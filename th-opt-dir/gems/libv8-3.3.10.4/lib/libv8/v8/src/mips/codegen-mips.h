// Copyright 2011 the V8 project authors. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above
//       copyright notice, this list of conditions and the following
//       disclaimer in the documentation and/or other materials provided
//       with the distribution.
//     * Neither the name of Google Inc. nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


#ifndef V8_MIPS_CODEGEN_MIPS_H_
#define V8_MIPS_CODEGEN_MIPS_H_


#include "ast.h"
#include "code-stubs-mips.h"
#include "ic-inl.h"

namespace v8 {
namespace internal {

// Forward declarations
class CompilationInfo;

enum TypeofState { INSIDE_TYPEOF, NOT_INSIDE_TYPEOF };

// -------------------------------------------------------------------------
// CodeGenerator

class CodeGenerator: public AstVisitor {
 public:
  static bool MakeCode(CompilationInfo* info);

  // Printing of AST, etc. as requested by flags.
  static void MakeCodePrologue(CompilationInfo* info);

  // Allocate and install the code.
  static Handle<Code> MakeCodeEpilogue(MacroAssembler* masm,
                                       Code::Flags flags,
                                       CompilationInfo* info);

  // Print the code after compiling it.
  static void PrintCode(Handle<Code> code, CompilationInfo* info);

#ifdef ENABLE_LOGGING_AND_PROFILING
  static bool ShouldGenerateLog(Expression* type);
#endif

  static void SetFunctionInfo(Handle<JSFunction> fun,
                              FunctionLiteral* lit,
                              bool is_toplevel,
                              Handle<Script> script);

  static bool RecordPositions(MacroAssembler* masm,
                              int pos,
                              bool right_here = false);

  // Constants related to patching of inlined load/store.
  static int GetInlinedKeyedLoadInstructionsAfterPatch() {
    // This is in correlation with the padding in MacroAssembler::Abort.
    return FLAG_debug_code ? 45 : 20;
  }

  static const int kInlinedKeyedStoreInstructionsAfterPatch = 13;

  static int GetInlinedNamedStoreInstructionsAfterPatch() {
    ASSERT(Isolate::Current()->inlined_write_barrier_size() != -1);
    // Magic number 5: instruction count after patched map load:
    //  li: 2 (liu & ori), Branch : 2 (bne & nop), sw : 1
    return Isolate::Current()->inlined_write_barrier_size() + 5;
  }

 private:
  DISALLOW_COPY_AND_ASSIGN(CodeGenerator);
};


} }  // namespace v8::internal

#endif  // V8_MIPS_CODEGEN_MIPS_H_
