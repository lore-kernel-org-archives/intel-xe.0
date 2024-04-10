Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0A1CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 18:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8682E10E5DC;
	Wed, 10 Apr 2024 18:04:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D282910E5DC;
 Wed, 10 Apr 2024 18:04:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Enable_device_atomics_with_a_V?=
 =?utf-8?q?M_bind_flag?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Apr 2024 18:04:52 -0000
Message-ID: <171277229286.1338744.11091209243239022623@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410170308.409-1-nirmoy.das@intel.com>
In-Reply-To: <20240410170308.409-1-nirmoy.das@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Enable device atomics with a VM bind flag
URL   : https://patchwork.freedesktop.org/series/132290/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../arch/x86/um/user-offsets.c:17:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
   17 | void foo(void)
      |      ^~~
In file included from ../arch/um/kernel/asm-offsets.c:1:
../arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
    9 | void foo(void)
      |      ^~~
../arch/x86/um/bugs_64.c:9:6: warning: no previous prototype for ‘arch_check_bugs’ [-Wmissing-prototypes]
    9 | void arch_check_bugs(void)
      |      ^~~~~~~~~~~~~~~
../arch/x86/um/bugs_64.c:13:6: warning: no previous prototype for ‘arch_examine_signal’ [-Wmissing-prototypes]
   13 | void arch_examine_signal(int sig, struct uml_pt_regs *regs)
      |      ^~~~~~~~~~~~~~~~~~~
../arch/x86/um/fault.c:18:5: warning: no previous prototype for ‘arch_fixup’ [-Wmissing-prototypes]
   18 | int arch_fixup(unsigned long address, struct uml_pt_regs *regs)
      |     ^~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:16:5: warning: no previous prototype for ‘__vdso_clock_gettime’ [-Wmissing-prototypes]
   16 | int __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *ts)
      |     ^~~~~~~~~~~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:30:5: warning: no previous prototype for ‘__vdso_gettimeofday’ [-Wmissing-prototypes]
   30 | int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
      |     ^~~~~~~~~~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:44:21: warning: no previous prototype for ‘__vdso_time’ [-Wmissing-prototypes]
   44 | __kernel_old_time_t __vdso_time(__kernel_old_time_t *t)
      |                     ^~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:57:1: warning: no previous prototype for ‘__vdso_getcpu’ [-Wmissing-prototypes]
   57 | __vdso_getcpu(unsigned *cpu, unsigned *node, struct getcpu_cache *unused)
      | ^~~~~~~~~~~~~
../arch/x86/um/os-Linux/registers.c:146:15: warning: no previous prototype for ‘get_thread_reg’ [-Wmissing-prototypes]
  146 | unsigned long get_thread_reg(int reg, jmp_buf *buf)
      |               ^~~~~~~~~~~~~~
../arch/x86/um/os-Linux/mcontext.c:7:6: warning: no previous prototype for ‘get_regs_from_mc’ [-Wmissing-prototypes]
    7 | void get_regs_from_mc(struct uml_pt_regs *regs, mcontext_t *mc)
      |      ^~~~~~~~~~~~~~~~
../arch/um/os-Linux/skas/process.c:107:6: warning: no previous prototype for ‘wait_stub_done’ [-Wmissing-prototypes]
  107 | void wait_stub_done(int pid)
      |      ^~~~~~~~~~~~~~
../arch/um/os-Linux/skas/process.c:683:6: warning: no previous prototype for ‘__switch_mm’ [-Wmissing-prototypes]
  683 | void __switch_mm(struct mm_id *mm_idp)
      |      ^~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:17:5: warning: no previous prototype for ‘init_new_context’ [-Wmissing-prototypes]
   17 | int init_new_context(struct task_struct *task, struct mm_struct *mm)
      |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:60:6: warning: no previous prototype for ‘destroy_context’ [-Wmissing-prototypes]
   60 | void destroy_context(struct mm_struct *mm)
      |      ^~~~~~~~~~~~~~~
../arch/um/os-Linux/main.c:187:7: warning: no previous prototype for ‘__wrap_malloc’ [-Wmissing-prototypes]
  187 | void *__wrap_malloc(int size)
      |       ^~~~~~~~~~~~~
../arch/um/os-Linux/main.c:208:7: warning: no previous prototype for ‘__wrap_calloc’ [-Wmissing-prototypes]
  208 | void *__wrap_calloc(int n, int size)
      |       ^~~~~~~~~~~~~
../arch/um/os-Linux/main.c:222:6: warning: no previous prototype for ‘__wrap_free’ [-Wmissing-prototypes]
  222 | void __wrap_free(void *ptr)
      |      ^~~~~~~~~~~
../arch/um/kernel/skas/process.c:36:12: warning: no previous prototype for ‘start_uml’ [-Wmissing-prototypes]
   36 | int __init start_uml(void)
      |            ^~~~~~~~~
../arch/um/os-Linux/mem.c:28:6: warning: no previous prototype for ‘kasan_map_memory’ [-Wmissing-prototypes]
   28 | void kasan_map_memory(void *start, size_t len)
      |      ^~~~~~~~~~~~~~~~
../arch/um/os-Linux/mem.c:212:13: warning: no previous prototype for ‘check_tmpexec’ [-Wmissing-prototypes]
  212 | void __init check_tmpexec(void)
      |             ^~~~~~~~~~~~~
../arch/x86/um/ptrace_64.c:111:5: warning: no previous prototype for ‘poke_user’ [-Wmissing-prototypes]
  111 | int poke_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/x86/um/ptrace_64.c:171:5: warning: no previous prototype for ‘peek_user’ [-Wmissing-prototypes]
  171 | int peek_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/um/os-Linux/signal.c:75:6: warning: no previous prototype for ‘sig_handler’ [-Wmissing-prototypes]
   75 | void sig_handler(int sig, struct siginfo *si, mcontext_t *mc)
      |      ^~~~~~~~~~~
../arch/um/os-Linux/signal.c:111:6: warning: no previous prototype for ‘timer_alarm_handler’ [-Wmissing-prototypes]
  111 | void timer_alarm_handler(int sig, struct siginfo *unused_si, mcontext_t *mc)
      |      ^~~~~~~~~~~~~~~~~~~
../arch/x86/um/signal.c:560:6: warning: no previous prototype for ‘sys_rt_sigreturn’ [-Wmissing-prototypes]
  560 | long sys_rt_sigreturn(void)
      |      ^~~~~~~~~~~~~~~~
../arch/um/os-Linux/start_up.c:301:12: warning: no previous prototype for ‘parse_iomem’ [-Wmissing-prototypes]
  301 | int __init parse_iomem(char *str, int *add)
      |            ^~~~~~~~~~~
../arch/um/kernel/mem.c:202:8: warning: no previous prototype for ‘pgd_alloc’ [-Wmissing-prototypes]
  202 | pgd_t *pgd_alloc(struct mm_struct *mm)
      |        ^~~~~~~~~
../arch/um/kernel/mem.c:215:7: warning: no previous prototype for ‘uml_kmalloc’ [-Wmissing-prototypes]
  215 | void *uml_kmalloc(int size, int flags)
      |       ^~~~~~~~~~~
../arch/x86/um/syscalls_64.c:48:6: warning: no previous prototype for ‘arch_switch_to’ [-Wmissing-prototypes]
   48 | void arch_switch_to(struct task_struct *to)
      |      ^~~~~~~~~~~~~~
../arch/um/kernel/process.c:51:5: warning: no previous prototype for ‘pid_to_processor_id’ [-Wmissing-prototypes]
   51 | int pid_to_processor_id(int pid)
      |     ^~~~~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:87:7: warning: no previous prototype for ‘__switch_to’ [-Wmissing-prototypes]
   87 | void *__switch_to(struct task_struct *from, struct task_struct *to)
      |       ^~~~~~~~~~~
../arch/um/kernel/process.c:140:6: warning: no previous prototype for ‘fork_handler’ [-Wmissing-prototypes]
  140 | void fork_handler(void)
      |      ^~~~~~~~~~~~
../arch/um/kernel/process.c:217:6: warning: no previous prototype for ‘arch_cpu_idle’ [-Wmissing-prototypes]
  217 | void arch_cpu_idle(void)
      |      ^~~~~~~~~~~~~
../arch/um/kernel/process.c:253:5: warning: no previous prototype for ‘copy_to_user_proc’ [-Wmissing-prototypes]
  253 | int copy_to_user_proc(void __user *to, void *from, int size)
      |     ^~~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:263:5: warning: no previous prototype for ‘clear_user_proc’ [-Wmissing-prototypes]
  263 | int clear_user_proc(void __user *buf, int size)
      |     ^~~~~~~~~~~~~~~
../arch/um/kernel/process.c:271:6: warning: no previous prototype for ‘set_using_sysemu’ [-Wmissing-prototypes]
  271 | void set_using_sysemu(int value)
      |      ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:278:5: warning: no previous prototype for ‘get_using_sysemu’ [-Wmissing-prototypes]
  278 | int get_using_sysemu(void)
      |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:316:12: warning: no previous prototype for ‘make_proc_sysemu’ [-Wmissing-prototypes]
  316 | int __init make_proc_sysemu(void)
      |            ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:348:15: warning: no previous prototype for ‘arch_align_stack’ [-Wmissing-prototypes]
  348 | unsigned long arch_align_stack(unsigned long sp)
      |               ^~~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:45:6: warning: no previous prototype for ‘machine_restart’ [-Wmissing-prototypes]
   45 | void machine_restart(char * __unused)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:51:6: warning: no previous prototype for ‘machine_power_off’ [-Wmissing-prototypes]
   51 | void machine_power_off(void)
      |      ^~~~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:57:6: warning: no previous prototype for ‘machine_halt’ [-Wmissing-prototypes]
   57 | void machine_halt(void)
      |      ^~~~~~~~~~~~
../arch/um/kernel/tlb.c:579:6: warning: no previous prototype for ‘flush_tlb_mm_range’ [-Wmissing-prototypes]
  579 | void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
      |      ^~~~~~~~~~~~~~~~~~
../arch/um/kernel/tlb.c:594:6: warning: no previous prototype for ‘force_flush_all’ [-Wmissing-prototypes]
  594 | void force_flush_all(void)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/um_arch.c:408:19: warning: no previous prototype for ‘read_initrd’ [-Wmissing-prototypes]
  408 | int __init __weak read_initrd(void)
      |                   ^~~~~~~~~~~
../arch/um/kernel/um_arch.c:461:7: warning: no previous prototype for ‘text_poke’ [-Wmissing-prototypes]
  461 | void *text_poke(void *addr, const void *opcode, size_t len)
      |       ^~~~~~~~~
../arch/um/kernel/um_arch.c:473:6: warning: no previous prototype for ‘text_poke_sync’ [-Wmissing-prototypes]
  473 | void text_poke_sync(void)
      |      ^~~~~~~~~~~~~~
../arch/um/kernel/kmsg_dump.c:60:12: warning: no previous prototype for ‘kmsg_dumper_stdout_init’ [-Wmissing-prototypes]
   60 | int __init kmsg_dumper_stdout_init(void)
      |            ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c: In function ‘vm_bind_ioctl_ops_create’:
../drivers/gpu/drm/xe/xe_vm.c:2170:6: warning: unused variable ‘err’ [-Wunused-variable]
 2170 |  int err;
      |      ^~~
../drivers/gpu/drm/xe/xe_vm.c:2169:23: warning: unused variable ‘vm_bo’ [-Wunused-variable]
 2169 |  struct drm_gpuvm_bo *vm_bo;
      |                       ^~~~~
../drivers/gpu/drm/xe/xe_vm.c:2168:23: warning: unused variable ‘__op’ [-Wunused-variable]
 2168 |  struct drm_gpuva_op *__op;
      |                       ^~~~
../drivers/gpu/drm/xe/xe_vm.c:2167:24: warning: unused variable ‘ops’ [-Wunused-variable]
 2167 |  struct drm_gpuva_ops *ops;
      |                        ^~~
../drivers/gpu/drm/xe/xe_vm.c:2166:25: warning: unused variable ‘obj’ [-Wunused-variable]
 2166 |  struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
      |                         ^~~
../drivers/gpu/drm/xe/xe_vm.c: At top level:
../drivers/gpu/drm/xe/xe_vm.c:2191:2: error: expected identifier or ‘(’ before ‘switch’
 2191 |  switch (operation) {
      |  ^~~~~~
../drivers/gpu/drm/xe/xe_vm.c:2224:2: error: expected identifier or ‘(’ before ‘if’
 2224 |  if (IS_ERR(ops))
      |  ^~
In file included from ../include/linux/fwnode.h:14,
                 from ../include/linux/logic_pio.h:11,
                 from ../include/asm-generic/io.h:609,
                 from ../arch/um/include/asm/io.h:24,
                 from ../include/linux/io.h:13,
                 from ../include/linux/iosys-map.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.c:6:
../include/linux/list.h:778:2: error: expected identifier or ‘(’ before ‘for’
  778 |  for (pos = list_first_entry(head, typeof(*pos), member); \
      |  ^~~
../include/drm/drm_gpuvm.h:995:40: note: in expansion of macro ‘list_for_each_entry’
  995 | #define drm_gpuva_for_each_op(op, ops) list_for_each_entry(op, &(ops)->list, entry)
      |                                        ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c:2227:2: note: in expansion of macro ‘drm_gpuva_for_each_op’
 2227 |  drm_gpuva_for_each_op(__op, ops) {
      |  ^~~~~~~~~~~~~~~~~~~~~
In file included from ../include/linux/list.h:5,
                 from ../include/linux/fwnode.h:14,
                 from ../include/linux/logic_pio.h:11,
                 from ../include/asm-generic/io.h:609,
                 from ../arch/um/include/asm/io.h:24,
                 from ../include/linux/io.h:13,
                 from ../include/linux/iosys-map.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.c:6:
../include/linux/container_of.h:23:48: error: expected identifier or ‘(’ before ‘)’ token
   23 |  ((type *)(__mptr - offsetof(type, member))); })
      |                                                ^
../include/linux/list.h:601:2: note: in expansion of macro ‘container_of’
  601 |  container_of(ptr, type, member)
      |  ^~~~~~~~~~~~
../include/linux/list.h:612:2: note: in expansion of macro ‘list_entry’
  612 |  list_entry((ptr)->next, type, member)
      |  ^~~~~~~~~~
../include/linux/list.h:778:13: note: in expansion of macro ‘list_first_entry’
  778 |  for (pos = list_first_entry(head, typeof(*pos), member); \
      |             ^~~~~~~~~~~~~~~~
../include/drm/drm_gpuvm.h:995:40: note: in expansion of macro ‘list_for_each_entry’
  995 | #define drm_gpuva_for_each_op(op, ops) list_for_each_entry(op, &(ops)->list, entry)
      |                                        ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c:2227:2: note: in expansion of macro ‘drm_gpuva_for_each_op’
 2227 |  drm_gpuva_for_each_op(__op, ops) {
      |  ^~~~~~~~~~~~~~~~~~~~~
In file included from ../include/linux/fwnode.h:14,
                 from ../include/linux/logic_pio.h:11,
                 from ../include/asm-generic/io.h:609,
                 from ../arch/um/include/asm/io.h:24,
                 from ../include/linux/io.h:13,
                 from ../include/linux/iosys-map.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.c:6:
../include/linux/list.h:779:7: error: expected identifier or ‘(’ before ‘!’ token
  779 |       !list_entry_is_head(pos, head, member);   \
      |       ^
../include/drm/drm_gpuvm.h:995:40: note: in expansion of macro ‘list_for_each_entry’
  995 | #define drm_gpuva_for_each_op(op, ops) list_for_each_entry(op, &(ops)->list, entry)
      |                                        ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c:2227:2: note: in expansion of macro ‘drm_gpuva_for_each_op’
 2227 |  drm_gpuva_for_each_op(__op, ops) {
      |  ^~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c:2227:24: warning: data definition has no type or storage class
 2227 |  drm_gpuva_for_each_op(__op, ops) {
      |                        ^~~~
../include/linux/list.h:780:7: note: in definition of macro ‘list_for_each_entry’
  780 |       pos = list_next_entry(pos, member))
      |       ^~~
../drivers/gpu/drm/xe/xe_vm.c:2227:2: note: in expansion of macro ‘drm_gpuva_for_each_op’
 2227 |  drm_gpuva_for_each_op(__op, ops) {
      |  ^~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c:2227:24: error: type defaults to ‘int’ in declaration of ‘__op’ [-Werror=implicit-int]
 2227 |  drm_gpuva_for_each_op(__op, ops) {
      |                        ^~~~
../include/linux/list.h:780:7: note: in definition of macro ‘list_for_each_entry’
  780 |       pos = list_next_entry(pos, member))
      |       ^~~
../drivers/gpu/drm/xe/xe_vm.c:2227:2: note: in expansion of macro ‘drm_gpuva_for_each_op’
 2227 |  drm_gpuva_for_each_op(__op, ops) {
      |  ^~~~~~~~~~~~~~~~~~~~~
In file included from ../include/linux/list.h:5,
                 from ../include/linux/fwnode.h:14,
                 from ../include/linux/logic_pio.h:11,
                 from ../include/asm-generic/io.h:609,
                 from ../arch/um/include/asm/io.h:24,
                 from ../include/linux/io.h:13,
                 from ../include/linux/iosys-map.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.c:6:
../include/linux/container_of.h:18:41: error: braced-group within expression allowed only inside a function
   18 | #define container_of(ptr, type, member) ({    \
      |                                         ^
../include/linux/list.h:601:2: note: in expansion of macro ‘container_of’
  601 |  container_of(ptr, type, member)
      |  ^~~~~~~~~~~~
../include/linux/list.h:645:2: note: in expansion of macro ‘list_entry’
  645 |  list_entry((pos)->member.next, typeof(*(pos)), member)
      |  ^~~~~~~~~~
../include/linux/list.h:780:13: note: in expansion of macro ‘list_next_entry’
  780 |       pos = list_next_entry(pos, member))
      |             ^~~~~~~~~~~~~~~
../include/drm/drm_gpuvm.h:995:40: note: in expansion of macro ‘list_for_each_entry’
  995 | #define drm_gpuva_for_each_op(op, ops) list_for_each_entry(op, &(ops)->list, entry)
      |                                        ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c:2227:2: note: in expansion of macro ‘drm_gpuva_for_each_op’
 2227 |  drm_gpuva_for_each_op(__op, ops) {
      |  ^~~~~~~~~~~~~~~~~~~~~
In file included from ../include/linux/fwnode.h:14,
                 from ../include/linux/logic_pio.h:11,
                 from ../include/asm-generic/io.h:609,
                 from ../arch/um/include/asm/io.h:24,
                 from ../include/linux/io.h:13,
                 from ../include/linux/iosys-map.h:10,
                 from ../drivers/gpu/drm/xe/xe_bo_types.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.h:9,
                 from ../drivers/gpu/drm/xe/xe_vm.c:6:
../include/linux/list.h:780:41: error: expected ‘,’ or ‘;’ before ‘)’ token
  780 |       pos = list_next_entry(pos, member))
      |                                         ^
../include/drm/drm_gpuvm.h:995:40: note: in expansion of macro ‘list_for_each_entry’
  995 | #define drm_gpuva_for_each_op(op, ops) list_for_each_entry(op, &(ops)->list, entry)
      |                                        ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c:2227:2: note: in expansion of macro ‘drm_gpuva_for_each_op’
 2227 |  drm_gpuva_for_each_op(__op, ops) {
      |  ^~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_vm.c:2242:2: error: expected identifier or ‘(’ before ‘return’
 2242 |  return ops;
      |  ^~~~~~
../drivers/gpu/drm/xe/xe_vm.c:2243:1: error: expected identifier or ‘(’ before ‘}’ token
 2243 | }
      | ^
../drivers/gpu/drm/xe/xe_vm.c:2151:13: warning: ‘print_op’ defined but not used [-Wunused-function]
 2151 | static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
      |             ^~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_vm.o] Error 1
make[7]: *** Waiting for unfinished jobs....
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:1919: .] Error 2
make[1]: *** [/kernel/Makefile:240: __sub-make] Error 2
make: *** [Makefile:240: __sub-make] Error 2

[18:04:24] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:04:28] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


