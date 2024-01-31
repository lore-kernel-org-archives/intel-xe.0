Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410E8C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 09:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04083113AC7;
	Wed, 31 Jan 2024 09:20:27 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC8E113AC7;
 Wed, 31 Jan 2024 09:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe/vm=3A_Subclass_userptr_?=
 =?utf-8?q?vmas_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 31 Jan 2024 09:20:25 -0000
Message-ID: <170669282571.860541.14220318896041225913@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240131091628.12318-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240131091628.12318-1-thomas.hellstrom@linux.intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/vm: Subclass userptr vmas (rev2)
URL   : https://patchwork.freedesktop.org/series/129324/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[09:19:33] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:19:38] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
../arch/x86/um/user-offsets.c:17:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
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
../arch/um/os-Linux/skas/process.c:107:6: warning: no previous prototype for ‘wait_stub_done’ [-Wmissing-prototypes]
  107 | void wait_stub_done(int pid)
      |      ^~~~~~~~~~~~~~
../arch/um/os-Linux/skas/process.c:683:6: warning: no previous prototype for ‘__switch_mm’ [-Wmissing-prototypes]
  683 | void __switch_mm(struct mm_id *mm_idp)
      |      ^~~~~~~~~~~
../arch/x86/um/os-Linux/mcontext.c:7:6: warning: no previous prototype for ‘get_regs_from_mc’ [-Wmissing-prototypes]
    7 | void get_regs_from_mc(struct uml_pt_regs *regs, mcontext_t *mc)
      |      ^~~~~~~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:17:5: warning: no previous prototype for ‘init_new_context’ [-Wmissing-prototypes]
   17 | int init_new_context(struct task_struct *task, struct mm_struct *mm)
      |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:60:6: warning: no previous prototype for ‘destroy_context’ [-Wmissing-prototypes]
   60 | void destroy_context(struct mm_struct *mm)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/skas/process.c:36:12: warning: no previous prototype for ‘start_uml’ [-Wmissing-prototypes]
   36 | int __init start_uml(void)
      |            ^~~~~~~~~
../arch/x86/um/ptrace_64.c:111:5: warning: no previous prototype for ‘poke_user’ [-Wmissing-prototypes]
  111 | int poke_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/x86/um/ptrace_64.c:171:5: warning: no previous prototype for ‘peek_user’ [-Wmissing-prototypes]
  171 | int peek_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/um/os-Linux/main.c:187:7: warning: no previous prototype for ‘__wrap_malloc’ [-Wmissing-prototypes]
  187 | void *__wrap_malloc(int size)
      |       ^~~~~~~~~~~~~
../arch/um/os-Linux/main.c:208:7: warning: no previous prototype for ‘__wrap_calloc’ [-Wmissing-prototypes]
  208 | void *__wrap_calloc(int n, int size)
      |       ^~~~~~~~~~~~~
../arch/um/os-Linux/main.c:222:6: warning: no previous prototype for ‘__wrap_free’ [-Wmissing-prototypes]
  222 | void __wrap_free(void *ptr)
      |      ^~~~~~~~~~~
../arch/um/os-Linux/mem.c:28:6: warning: no previous prototype for ‘kasan_map_memory’ [-Wmissing-prototypes]
   28 | void kasan_map_memory(void *start, size_t len)
      |      ^~~~~~~~~~~~~~~~
../arch/um/os-Linux/mem.c:212:13: warning: no previous prototype for ‘check_tmpexec’ [-Wmissing-prototypes]
  212 | void __init check_tmpexec(void)
      |             ^~~~~~~~~~~~~
../arch/um/kernel/mem.c:202:8: warning: no previous prototype for ‘pgd_alloc’ [-Wmissing-prototypes]
  202 | pgd_t *pgd_alloc(struct mm_struct *mm)
      |        ^~~~~~~~~
../arch/um/kernel/mem.c:215:7: warning: no previous prototype for ‘uml_kmalloc’ [-Wmissing-prototypes]
  215 | void *uml_kmalloc(int size, int flags)
      |       ^~~~~~~~~~~
../arch/um/kernel/reboot.c:45:6: warning: no previous prototype for ‘machine_restart’ [-Wmissing-prototypes]
   45 | void machine_restart(char * __unused)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:51:6: warning: no previous prototype for ‘machine_power_off’ [-Wmissing-prototypes]
   51 | void machine_power_off(void)
      |      ^~~~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:57:6: warning: no previous prototype for ‘machine_halt’ [-Wmissing-prototypes]
   57 | void machine_halt(void)
      |      ^~~~~~~~~~~~
../arch/um/kernel/process.c:51:5: warning: no previous prototype for ‘pid_to_processor_id’ [-Wmissing-prototypes]
   51 | int pid_to_processor_id(int pid)
      |     ^~~~~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:87:7: warning: no previous prototype for ‘__switch_to’ [-Wmissing-prototypes]
   87 | void *__switch_to(struct task_struct *from, struct task_struct *to)
      |       ^~~~~~~~~~~
../arch/um/os-Linux/signal.c:75:6: warning: no previous prototype for ‘sig_handler’ [-Wmissing-prototypes]
   75 | void sig_handler(int sig, struct siginfo *si, mcontext_t *mc)
      |      ^~~~~~~~~~~
../arch/um/os-Linux/signal.c:111:6: warning: no previous prototype for ‘timer_alarm_handler’ [-Wmissing-prototypes]
  111 | void timer_alarm_handler(int sig, struct siginfo *unused_si, mcontext_t *mc)
      |      ^~~~~~~~~~~~~~~~~~~
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
../arch/x86/um/signal.c:560:6: warning: no previous prototype for ‘sys_rt_sigreturn’ [-Wmissing-prototypes]
  560 | long sys_rt_sigreturn(void)
      |      ^~~~~~~~~~~~~~~~
../arch/um/os-Linux/start_up.c:301:12: warning: no previous prototype for ‘parse_iomem’ [-Wmissing-prototypes]
  301 | int __init parse_iomem(char *str, int *add)
      |            ^~~~~~~~~~~
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
../arch/x86/um/syscalls_64.c:48:6: warning: no previous prototype for ‘arch_switch_to’ [-Wmissing-prototypes]
   48 | void arch_switch_to(struct task_struct *to)
      |      ^~~~~~~~~~~~~~
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
stty: 'standard input': Inappropriate ioctl for device

[09:20:01] Starting KUnit Kernel (1/1)...
[09:20:01] ============================================================
[09:20:01] =================== guc_dbm (7 subtests) ===================
[09:20:01] [PASSED] test_empty
[09:20:01] [PASSED] test_default
[09:20:01] ======================== test_size  ========================
[09:20:01] [PASSED] 4
[09:20:01] [PASSED] 8
[09:20:01] [PASSED] 32
[09:20:01] [PASSED] 256
[09:20:01] ==================== [PASSED] test_size ====================
[09:20:01] ======================= test_reuse  ========================
[09:20:01] [PASSED] 4
[09:20:01] [PASSED] 8
[09:20:01] [PASSED] 32
[09:20:01] [PASSED] 256
[09:20:01] =================== [PASSED] test_reuse ====================
[09:20:01] =================== test_range_overlap  ====================
[09:20:01] [PASSED] 4
[09:20:01] [PASSED] 8
[09:20:01] [PASSED] 32
[09:20:01] [PASSED] 256
[09:20:01] =============== [PASSED] test_range_overlap ================
[09:20:01] =================== test_range_compact  ====================
[09:20:01] [PASSED] 4
[09:20:01] [PASSED] 8
[09:20:01] [PASSED] 32
[09:20:01] [PASSED] 256
[09:20:01] =============== [PASSED] test_range_compact ================
[09:20:01] ==================== test_range_spare  =====================
[09:20:01] [PASSED] 4
[09:20:01] [PASSED] 8
[09:20:01] [PASSED] 32
[09:20:01] [PASSED] 256
[09:20:01] ================ [PASSED] test_range_spare =================
[09:20:01] ===================== [PASSED] guc_dbm =====================
[09:20:01] ================== no_relay (3 subtests) ===================
[09:20:01] [PASSED] xe_drops_guc2pf_if_not_ready
[09:20:01] [PASSED] xe_drops_guc2vf_if_not_ready
[09:20:01] [PASSED] xe_rejects_send_if_not_ready
[09:20:01] ==================== [PASSED] no_relay =====================
[09:20:01] ================== pf_relay (14 subtests) ==================
[09:20:01] [PASSED] pf_rejects_guc2pf_too_short
[09:20:01] [PASSED] pf_rejects_guc2pf_too_long
[09:20:01] [PASSED] pf_rejects_guc2pf_no_payload
[09:20:01] [PASSED] pf_fails_no_payload
[09:20:01] [PASSED] pf_fails_bad_origin
[09:20:01] [PASSED] pf_fails_bad_type
[09:20:01] [PASSED] pf_txn_reports_error
[09:20:01] [PASSED] pf_txn_sends_pf2guc
[09:20:01] [PASSED] pf_sends_pf2guc
[09:20:01] [SKIPPED] pf_loopback_nop
[09:20:01] [SKIPPED] pf_loopback_echo
[09:20:01] [SKIPPED] pf_loopback_fail
[09:20:01] [SKIPPED] pf_loopback_busy
[09:20:01] [SKIPPED] pf_loopback_retry
[09:20:01] ==================== [PASSED] pf_relay =====================
[09:20:01] ================== vf_relay (3 subtests) ===================
[09:20:01] [PASSED] vf_rejects_guc2vf_too_short
[09:20:01] [PASSED] vf_rejects_guc2vf_too_long
[09:20:01] [PASSED] vf_rejects_guc2vf_no_payload
[09:20:01] ==================== [PASSED] vf_relay =====================
[09:20:01] ===================== lmtt (1 subtest) =====================
[09:20:01] ======================== test_ops  =========================
[09:20:01] [PASSED] 2-level
[09:20:01] [PASSED] multi-level
[09:20:01] ==================== [PASSED] test_ops =====================
[09:20:01] ====================== [PASSED] lmtt =======================
[09:20:01] ==================== xe_bo (2 subtests) ====================
[09:20:01] [SKIPPED] xe_ccs_migrate_kunit
[09:20:01] [SKIPPED] xe_bo_evict_kunit
[09:20:01] ===================== [SKIPPED] xe_bo ======================
[09:20:01] ================== xe_dma_buf (1 subtest) ==================
[09:20:01] [SKIPPED] xe_dma_buf_kunit
[09:20:01] =================== [SKIPPED] xe_dma_buf ===================
[09:20:01] ================== xe_migrate (1 subtest) ==================
[09:20:01] [SKIPPED] xe_migrate_sanity_kunit
[09:20:01] =================== [SKIPPED] xe_migrate ===================
[09:20:01] =================== xe_mocs (2 subtests) ===================
[09:20:01] [SKIPPED] xe_live_mocs_kernel_kunit
[09:20:01] [SKIPPED] xe_live_mocs_reset_kunit
[09:20:01] ==================== [SKIPPED] xe_mocs =====================
[09:20:01] =================== xe_pci (2 subtests) ====================
[09:20:01] [PASSED] xe_gmdid_graphics_ip
[09:20:01] [PASSED] xe_gmdid_media_ip
[09:20:01] ===================== [PASSED] xe_pci ======================
[09:20:01] ==================== xe_rtp (1 subtest) ====================
[09:20:01] ================== xe_rtp_process_tests  ===================
[09:20:01] [PASSED] coalesce-same-reg
[09:20:01] [PASSED] no-match-no-add
[09:20:01] [PASSED] no-match-no-add-multiple-rules
[09:20:01] [PASSED] two-regs-two-entries
[09:20:01] [PASSED] clr-one-set-other
[09:20:01] [PASSED] set-field
[09:20:01] [PASSED] conflict-duplicate
[09:20:01] [PASSED] conflict-not-disjoint
[09:20:01] [PASSED] conflict-reg-type
[09:20:01] ============== [PASSED] xe_rtp_process_tests ===============
[09:20:01] ===================== [PASSED] xe_rtp ======================
[09:20:01] ==================== xe_wa (1 subtest) =====================
[09:20:01] ======================== xe_wa_gt  =========================
[09:20:01] [PASSED] TIGERLAKE (B0)
[09:20:01] [PASSED] DG1 (A0)
[09:20:01] [PASSED] DG1 (B0)
[09:20:01] [PASSED] ALDERLAKE_S (A0)
[09:20:01] [PASSED] ALDERLAKE_S (B0)
[09:20:01] [PASSED] ALDERLAKE_S (C0)
[09:20:01] [PASSED] ALDERLAKE_S (D0)
[09:20:01] [PASSED] ALDERLAKE_P (A0)
[09:20:01] [PASSED] ALDERLAKE_P (B0)
[09:20:01] [PASSED] ALDERLAKE_P (C0)
[09:20:01] [PASSED] ALDERLAKE_S_RPLS (D0)
[09:20:01] [PASSED] ALDERLAKE_P_RPLU (E0)
[09:20:01] [PASSED] DG2_G10 (C0)
[09:20:01] [PASSED] DG2_G11 (B1)
[09:20:01] [PASSED] DG2_G12 (A1)
[09:20:01] [PASSED] METEORLAKE (g:A0, m:A0)
[09:20:01] [PASSED] METEORLAKE (g:A0, m:A0)
[09:20:01] [PASSED] LUNARLAKE (g:A0, m:A0)
[09:20:01] [PASSED] LUNARLAKE (g:B0, m:A0)
[09:20:01] ==================== [PASSED] xe_wa_gt =====================
[09:20:01] ====================== [PASSED] xe_wa ======================
[09:20:01] ============================================================
[09:20:01] Testing complete. Ran 80 tests: passed: 69, skipped: 11
[09:20:01] Elapsed time: 27.571s total, 4.240s configuring, 23.111s building, 0.190s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[09:20:01] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[09:20:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
In file included from ../arch/um/kernel/asm-offsets.c:1:
../arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
    9 | void foo(void)
      |      ^~~
../arch/x86/um/ptrace_64.c:111:5: warning: no previous prototype for ‘poke_user’ [-Wmissing-prototypes]
  111 | int poke_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/x86/um/ptrace_64.c:171:5: warning: no previous prototype for ‘peek_user’ [-Wmissing-prototypes]
  171 | int peek_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/x86/um/signal.c:560:6: warning: no previous prototype for ‘sys_rt_sigreturn’ [-Wmissing-prototypes]
  560 | long sys_rt_sigreturn(void)
      |      ^~~~~~~~~~~~~~~~
../arch/um/kernel/mem.c:202:8: warning: no previous prototype for ‘pgd_alloc’ [-Wmissing-prototypes]
  202 | pgd_t *pgd_alloc(struct mm_struct *mm)
      |        ^~~~~~~~~
../arch/um/kernel/mem.c:215:7: warning: no previous prototype for ‘uml_kmalloc’ [-Wmissing-prototypes]
  215 | void *uml_kmalloc(int size, int flags)
      |       ^~~~~~~~~~~
../arch/um/kernel/reboot.c:45:6: warning: no previous prototype for ‘machine_restart’ [-Wmissing-prototypes]
   45 | void machine_restart(char * __unused)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:51:6: warning: no previous prototype for ‘machine_power_off’ [-Wmissing-prototypes]
   51 | void machine_power_off(void)
      |      ^~~~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:57:6: warning: no previous prototype for ‘machine_halt’ [-Wmissing-prototypes]
   57 | void machine_halt(void)
      |      ^~~~~~~~~~~~
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
../arch/x86/um/syscalls_64.c:48:6: warning: no previous prototype for ‘arch_switch_to’ [-Wmissing-prototypes]
   48 | void arch_switch_to(struct task_struct *to)
      |      ^~~~~~~~~~~~~~
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
../arch/um/kernel/skas/process.c:36:12: warning: no previous prototype for ‘start_uml’ [-Wmissing-prototypes]
   36 | int __init start_uml(void)
      |            ^~~~~~~~~
../arch/um/kernel/skas/mmu.c:17:5: warning: no previous prototype for ‘init_new_context’ [-Wmissing-prototypes]
   17 | int init_new_context(struct task_struct *task, struct mm_struct *mm)
      |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:60:6: warning: no previous prototype for ‘destroy_context’ [-Wmissing-prototypes]
   60 | void destroy_context(struct mm_struct *mm)
      |      ^~~~~~~~~~~~~~~
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

[09:20:23] Starting KUnit Kernel (1/1)...
[09:20:23] ============================================================
[09:20:23] ============ drm_test_pick_cmdline (2 subtests) ============
[09:20:23] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[09:20:23] =============== drm_test_pick_cmdline_named  ===============
[09:20:23] [PASSED] NTSC
[09:20:23] [PASSED] NTSC-J
[09:20:23] [PASSED] PAL
[09:20:23] [PASSED] PAL-M
[09:20:23] =========== [PASSED] drm_test_pick_cmdline_named ===========
[09:20:23] ============== [PASSED] drm_test_pick_cmdline ==============
[09:20:23] ================== drm_buddy (4 subtests) ==================
[09:20:23] [PASSED] drm_test_buddy_alloc_limit
[09:20:23] [PASSED] drm_test_buddy_alloc_optimistic
[09:20:23] [PASSED] drm_test_buddy_alloc_pessimistic
[09:20:23] [PASSED] drm_test_buddy_alloc_pathological
[09:20:23] ==================== [PASSED] drm_buddy ====================
[09:20:23] ============= drm_cmdline_parser (40 subtests) =============
[09:20:23] [PASSED] drm_test_cmdline_force_d_only
[09:20:23] [PASSED] drm_test_cmdline_force_D_only_dvi
[09:20:23] [PASSED] drm_test_cmdline_force_D_only_hdmi
[09:20:23] [PASSED] drm_test_cmdline_force_D_only_not_digital
[09:20:23] [PASSED] drm_test_cmdline_force_e_only
[09:20:23] [PASSED] drm_test_cmdline_res
[09:20:23] [PASSED] drm_test_cmdline_res_vesa
[09:20:23] [PASSED] drm_test_cmdline_res_vesa_rblank
[09:20:23] [PASSED] drm_test_cmdline_res_rblank
[09:20:23] [PASSED] drm_test_cmdline_res_bpp
[09:20:23] [PASSED] drm_test_cmdline_res_refresh
[09:20:23] [PASSED] drm_test_cmdline_res_bpp_refresh
[09:20:23] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[09:20:23] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[09:20:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[09:20:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[09:20:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[09:20:23] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[09:20:23] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[09:20:23] [PASSED] drm_test_cmdline_res_margins_force_on
[09:20:23] [PASSED] drm_test_cmdline_res_vesa_margins
[09:20:23] [PASSED] drm_test_cmdline_name
[09:20:23] [PASSED] drm_test_cmdline_name_bpp
[09:20:23] [PASSED] drm_test_cmdline_name_option
[09:20:23] [PASSED] drm_test_cmdline_name_bpp_option
[09:20:23] [PASSED] drm_test_cmdline_rotate_0
[09:20:23] [PASSED] drm_test_cmdline_rotate_90
[09:20:23] [PASSED] drm_test_cmdline_rotate_180
[09:20:23] [PASSED] drm_test_cmdline_rotate_270
[09:20:23] [PASSED] drm_test_cmdline_hmirror
[09:20:23] [PASSED] drm_test_cmdline_vmirror
[09:20:23] [PASSED] drm_test_cmdline_margin_options
[09:20:23] [PASSED] drm_test_cmdline_multiple_options
[09:20:23] [PASSED] drm_test_cmdline_bpp_extra_and_option
[09:20:23] [PASSED] drm_test_cmdline_extra_and_option
[09:20:23] [PASSED] drm_test_cmdline_freestanding_options
[09:20:23] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[09:20:23] [PASSED] drm_test_cmdline_panel_orientation
[09:20:23] ================ drm_test_cmdline_invalid  =================
[09:20:23] [PASSED] margin_only
[09:20:23] [PASSED] interlace_only
[09:20:23] [PASSED] res_missing_x
[09:20:23] [PASSED] res_missing_y
[09:20:23] [PASSED] res_bad_y
[09:20:23] [PASSED] res_missing_y_bpp
[09:20:23] [PASSED] res_bad_bpp
[09:20:23] [PASSED] res_bad_refresh
[09:20:23] [PASSED] res_bpp_refresh_force_on_off
[09:20:23] [PASSED] res_invalid_mode
[09:20:23] [PASSED] res_bpp_wrong_place_mode
[09:20:23] [PASSED] name_bpp_refresh
[09:20:23] [PASSED] name_refresh
[09:20:23] [PASSED] name_refresh_wrong_mode
[09:20:23] [PASSED] name_refresh_invalid_mode
[09:20:23] [PASSED] rotate_multiple
[09:20:23] [PASSED] rotate_invalid_val
[09:20:23] [PASSED] rotate_truncated
[09:20:23] [PASSED] invalid_option
[09:20:23] [PASSED] invalid_tv_option
[09:20:23] [PASSED] truncated_tv_option
[09:20:23] ============ [PASSED] drm_test_cmdline_invalid =============
[09:20:23] =============== drm_test_cmdline_tv_options  ===============
[09:20:23] [PASSED] NTSC
[09:20:23] [PASSED] NTSC_443
[09:20:23] [PASSED] NTSC_J
[09:20:23] [PASSED] PAL
[09:20:23] [PASSED] PAL_M
[09:20:23] [PASSED] PAL_N
[09:20:23] [PASSED] SECAM
[09:20:23] =========== [PASSED] drm_test_cmdline_tv_options ===========
[09:20:23] =============== [PASSED] drm_cmdline_parser ================
[09:20:23] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[09:20:23] ========== drm_test_get_tv_mode_from_name_valid  ===========
[09:20:23] [PASSED] NTSC
[09:20:23] [PASSED] NTSC-443
[09:20:23] [PASSED] NTSC-J
[09:20:23] [PASSED] PAL
[09:20:23] [PASSED] PAL-M
[09:20:23] [PASSED] PAL-N
[09:20:23] [PASSED] SECAM
[09:20:23] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[09:20:23] [PASSED] drm_test_get_tv_mode_from_name_truncated
[09:20:23] ============ [PASSED] drm_get_tv_mode_from_name ============
[09:20:23] ============= drm_damage_helper (21 subtests) ==============
[09:20:23] [PASSED] drm_test_damage_iter_no_damage
[09:20:23] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[09:20:23] [PASSED] drm_test_damage_iter_no_damage_src_moved
[09:20:23] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[09:20:23] [PASSED] drm_test_damage_iter_no_damage_not_visible
[09:20:23] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[09:20:23] [PASSED] drm_test_damage_iter_no_damage_no_fb
[09:20:23] [PASSED] drm_test_damage_iter_simple_damage
[09:20:23] [PASSED] drm_test_damage_iter_single_damage
[09:20:23] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[09:20:23] [PASSED] drm_test_damage_iter_single_damage_outside_src
[09:20:23] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[09:20:23] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[09:20:23] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[09:20:23] [PASSED] drm_test_damage_iter_single_damage_src_moved
[09:20:23] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[09:20:23] [PASSED] drm_test_damage_iter_damage
[09:20:23] [PASSED] drm_test_damage_iter_damage_one_intersect
[09:20:23] [PASSED] drm_test_damage_iter_damage_one_outside
[09:20:23] [PASSED] drm_test_damage_iter_damage_src_moved
[09:20:23] [PASSED] drm_test_damage_iter_damage_not_visible
[09:20:23] ================ [PASSED] drm_damage_helper ================
[09:20:23] ============== drm_dp_mst_helper (3 subtests) ==============
[09:20:23] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[09:20:23] [PASSED] Clock 154000 BPP 30 DSC disabled
[09:20:23] [PASSED] Clock 234000 BPP 30 DSC disabled
[09:20:23] [PASSED] Clock 297000 BPP 24 DSC disabled
[09:20:23] [PASSED] Clock 332880 BPP 24 DSC enabled
[09:20:23] [PASSED] Clock 324540 BPP 24 DSC enabled
[09:20:23] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[09:20:23] ============== drm_test_dp_mst_calc_pbn_div  ===============
[09:20:23] [PASSED] Link rate 2000000 lane count 4
[09:20:23] [PASSED] Link rate 2000000 lane count 2
[09:20:23] [PASSED] Link rate 2000000 lane count 1
[09:20:23] [PASSED] Link rate 1350000 lane count 4
[09:20:23] [PASSED] Link rate 1350000 lane count 2
[09:20:23] [PASSED] Link rate 1350000 lane count 1
[09:20:23] [PASSED] Link rate 1000000 lane count 4
[09:20:23] [PASSED] Link rate 1000000 lane count 2
[09:20:23] [PASSED] Link rate 1000000 lane count 1
[09:20:23] [PASSED] Link rate 810000 lane count 4
[09:20:23] [PASSED] Link rate 810000 lane count 2
[09:20:23] [PASSED] Link rate 810000 lane count 1
[09:20:23] [PASSED] Link rate 540000 lane count 4
[09:20:23] [PASSED] Link rate 540000 lane count 2
[09:20:23] [PASSED] Link rate 540000 lane count 1
[09:20:23] [PASSED] Link rate 270000 lane count 4
[09:20:23] [PASSED] Link rate 270000 lane count 2
[09:20:23] [PASSED] Link rate 270000 lane count 1
[09:20:23] [PASSED] Link rate 162000 lane count 4
[09:20:23] [PASSED] Link rate 162000 lane count 2
[09:20:23] [PASSED] Link rate 162000 lane count 1
[09:20:23] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[09:20:23] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[09:20:23] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[09:20:23] [PASSED] DP_POWER_UP_PHY with port number
[09:20:23] [PASSED] DP_POWER_DOWN_PHY with port number
[09:20:23] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[09:20:23] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[09:20:23] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[09:20:23] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[09:20:23] [PASSED] DP_QUERY_PAYLOAD with port number
[09:20:23] [PASSED] DP_QUERY_PAYLOAD with VCPI
[09:20:23] [PASSED] DP_REMOTE_DPCD_READ with port number
[09:20:23] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[09:20:23] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[09:20:23] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[09:20:23] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[09:20:23] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[09:20:23] [PASSED] DP_REMOTE_I2C_READ with port number
[09:20:23] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[09:20:23] [PASSED] DP_REMOTE_I2C_READ with transactions array
[09:20:23] [PASSED] DP_REMOTE_I2C_WRITE with port number
[09:20:23] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[09:20:23] [PASSED] DP_REMOTE_I2C_WRITE with data array
[09:20:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[09:20:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[09:20:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[09:20:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[09:20:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[09:20:23] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[09:20:23] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[09:20:23] ================ [PASSED] drm_dp_mst_helper ================
[09:20:23] ================== drm_exec (7 subtests) ===================
[09:20:23] [PASSED] sanitycheck
[09:20:23] [PASSED] test_lock
[09:20:23] [PASSED] test_lock_unlock
[09:20:23] [PASSED] test_duplicates
[09:20:23] [PASSED] test_prepare
[09:20:23] [PASSED] test_prepare_array
[09:20:23] [PASSED] test_multiple_loops
[09:20:23] ==================== [PASSED] drm_exec =====================
[09:20:23] =========== drm_format_helper_test (17 subtests) ===========
[09:20:23] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[09:20:23] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[09:20:23] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[09:20:23] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[09:20:23] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[09:20:23] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[09:20:23] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[09:20:23] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[09:20:23] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[09:20:23] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[09:20:23] ============== drm_test_fb_xrgb8888_to_mono  ===============
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[09:20:23] ==================== drm_test_fb_swab  =====================
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ================ [PASSED] drm_test_fb_swab =================
[09:20:23] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[09:20:23] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[09:20:23] [PASSED] single_pixel_source_buffer
[09:20:23] [PASSED] single_pixel_clip_rectangle
[09:20:23] [PASSED] well_known_colors
[09:20:23] [PASSED] destination_pitch
[09:20:23] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[09:20:23] ================= drm_test_fb_clip_offset  =================
[09:20:23] [PASSED] pass through
[09:20:23] [PASSED] horizontal offset
[09:20:23] [PASSED] vertical offset
[09:20:23] [PASSED] horizontal and vertical offset
[09:20:23] [PASSED] horizontal offset (custom pitch)
[09:20:23] [PASSED] vertical offset (custom pitch)
[09:20:23] [PASSED] horizontal and vertical offset (custom pitch)
[09:20:23] ============= [PASSED] drm_test_fb_clip_offset =============
[09:20:23] ============== drm_test_fb_build_fourcc_list  ==============
[09:20:23] [PASSED] no native formats
[09:20:23] [PASSED] XRGB8888 as native format
[09:20:23] [PASSED] remove duplicates
[09:20:23] [PASSED] convert alpha formats
[09:20:23] [PASSED] random formats
[09:20:23] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[09:20:23] =================== drm_test_fb_memcpy  ====================
[09:20:23] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[09:20:23] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[09:20:23] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[09:20:23] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[09:20:23] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[09:20:23] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[09:20:23] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[09:20:23] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[09:20:23] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[09:20:23] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[09:20:23] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[09:20:23] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[09:20:23] =============== [PASSED] drm_test_fb_memcpy ================
[09:20:23] ============= [PASSED] drm_format_helper_test ==============
[09:20:23] ================= drm_format (18 subtests) =================
[09:20:23] [PASSED] drm_test_format_block_width_invalid
[09:20:23] [PASSED] drm_test_format_block_width_one_plane
[09:20:23] [PASSED] drm_test_format_block_width_two_plane
[09:20:23] [PASSED] drm_test_format_block_width_three_plane
[09:20:23] [PASSED] drm_test_format_block_width_tiled
[09:20:23] [PASSED] drm_test_format_block_height_invalid
[09:20:23] [PASSED] drm_test_format_block_height_one_plane
[09:20:23] [PASSED] drm_test_format_block_height_two_plane
[09:20:23] [PASSED] drm_test_format_block_height_three_plane
[09:20:23] [PASSED] drm_test_format_block_height_tiled
[09:20:23] [PASSED] drm_test_format_min_pitch_invalid
[09:20:23] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[09:20:23] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[09:20:23] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[09:20:23] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[09:20:23] [PASSED] drm_test_format_min_pitch_two_plane
[09:20:23] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[09:20:23] [PASSED] drm_test_format_min_pitch_tiled
[09:20:23] =================== [PASSED] drm_format ====================
[09:20:23] =============== drm_framebuffer (1 subtest) ================
[09:20:23] =============== drm_test_framebuffer_create  ===============
[09:20:23] [PASSED] ABGR8888 normal sizes
[09:20:23] [PASSED] ABGR8888 max sizes
[09:20:23] [PASSED] ABGR8888 pitch greater than min required
[09:20:23] [PASSED] ABGR8888 pitch less than min required
[09:20:23] [PASSED] ABGR8888 Invalid width
[09:20:23] [PASSED] ABGR8888 Invalid buffer handle
[09:20:23] [PASSED] No pixel format
[09:20:23] [PASSED] ABGR8888 Width 0
[09:20:23] [PASSED] ABGR8888 Height 0
[09:20:23] [PASSED] ABGR8888 Out of bound height * pitch combination
[09:20:23] [PASSED] ABGR8888 Large buffer offset
[09:20:23] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[09:20:23] [PASSED] ABGR8888 Valid buffer modifier
[09:20:23] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[09:20:23] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[09:20:23] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[09:20:23] [PASSED] NV12 Normal sizes
[09:20:23] [PASSED] NV12 Max sizes
[09:20:23] [PASSED] NV12 Invalid pitch
[09:20:23] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[09:20:23] [PASSED] NV12 different  modifier per-plane
[09:20:23] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[09:20:23] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[09:20:23] [PASSED] NV12 Modifier for inexistent plane
[09:20:23] [PASSED] NV12 Handle for inexistent plane
[09:20:23] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[09:20:23] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[09:20:23] [PASSED] YVU420 Normal sizes
[09:20:23] [PASSED] YVU420 Max sizes
[09:20:23] [PASSED] YVU420 Invalid pitch
[09:20:23] [PASSED] YVU420 Different pitches
[09:20:23] [PASSED] YVU420 Different buffer offsets/pitches
[09:20:23] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[09:20:23] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[09:20:23] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[09:20:23] [PASSED] YVU420 Valid modifier
[09:20:23] [PASSED] YVU420 Different modifiers per plane
[09:20:23] [PASSED] YVU420 Modifier for inexistent plane
[09:20:23] [PASSED] X0L2 Normal sizes
[09:20:23] [PASSED] X0L2 Max sizes
[09:20:23] [PASSED] X0L2 Invalid pitch
[09:20:23] [PASSED] X0L2 Pitch greater than minimum required
[09:20:23] [PASSED] X0L2 Handle for inexistent plane
[09:20:23] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[09:20:23] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[09:20:23] [PASSED] X0L2 Valid modifier
[09:20:23] [PASSED] X0L2 Modifier for inexistent plane
[09:20:23] =========== [PASSED] drm_test_framebuffer_create ===========
[09:20:23] ================= [PASSED] drm_framebuffer =================
[09:20:23] ================ drm_gem_shmem (8 subtests) ================
[09:20:23] [PASSED] drm_gem_shmem_test_obj_create
[09:20:23] [PASSED] drm_gem_shmem_test_obj_create_private
[09:20:23] [PASSED] drm_gem_shmem_test_pin_pages
[09:20:23] [PASSED] drm_gem_shmem_test_vmap
[09:20:23] [PASSED] drm_gem_shmem_test_get_pages_sgt
[09:20:23] [PASSED] drm_gem_shmem_test_get_sg_table
[09:20:23] [PASSED] drm_gem_shmem_test_madvise
[09:20:23] [PASSED] drm_gem_shmem_test_purge
[09:20:23] ================== [PASSED] drm_gem_shmem ==================
[09:20:23] ================= drm_managed (2 subtests) =================
[09:20:23] [PASSED] drm_test_managed_release_action
[09:20:23] [PASSED] drm_test_managed_run_action
[09:20:23] =================== [PASSED] drm_managed ===================
[09:20:23] =================== drm_mm (6 subtests) ====================
[09:20:23] [PASSED] drm_test_mm_init
[09:20:23] [PASSED] drm_test_mm_debug
[09:20:23] [PASSED] drm_test_mm_align32
[09:20:23] [PASSED] drm_test_mm_align64
[09:20:23] [PASSED] drm_test_mm_lowest
[09:20:23] [PASSED] drm_test_mm_highest
[09:20:23] ===================== [PASSED] drm_mm ======================
[09:20:23] ============= drm_modes_analog_tv (4 subtests) =============
[09:20:23] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[09:20:23] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[09:20:23] [PASSED] drm_test_modes_analog_tv_pal_576i
[09:20:23] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[09:20:23] =============== [PASSED] drm_modes_analog_tv ===============
[09:20:23] ============== drm_plane_helper (2 subtests) ===============
[09:20:23] =============== drm_test_check_plane_state  ================
[09:20:23] [PASSED] clipping_simple
[09:20:23] [PASSED] clipping_rotate_reflect
[09:20:23] [PASSED] positioning_simple
[09:20:23] [PASSED] upscaling
[09:20:23] [PASSED] downscaling
[09:20:23] [PASSED] rounding1
[09:20:23] [PASSED] rounding2
[09:20:23] [PASSED] rounding3
[09:20:23] [PASSED] rounding4
[09:20:23] =========== [PASSED] drm_test_check_plane_state ============
[09:20:23] =========== drm_test_check_invalid_plane_state  ============
[09:20:23] [PASSED] positioning_invalid
[09:20:23] [PASSED] upscaling_invalid
[09:20:23] [PASSED] downscaling_invalid
[09:20:23] ======= [PASSED] drm_test_check_invalid_plane_state ========
[09:20:23] ================ [PASSED] drm_plane_helper =================
[09:20:23] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[09:20:23] ====== drm_test_connector_helper_tv_get_modes_check  =======
[09:20:23] [PASSED] None
[09:20:23] [PASSED] PAL
[09:20:23] [PASSED] NTSC
[09:20:23] [PASSED] Both, NTSC Default
[09:20:23] [PASSED] Both, PAL Default
[09:20:23] [PASSED] Both, NTSC Default, with PAL on command-line
[09:20:23] [PASSED] Both, PAL Default, with NTSC on command-line
[09:20:23] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[09:20:23] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[09:20:23] ================== drm_rect (9 subtests) ===================
[09:20:23] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[09:20:23] [PASSED] drm_test_rect_clip_scaled_not_clipped
[09:20:23] [PASSED] drm_test_rect_clip_scaled_clipped
[09:20:23] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[09:20:23] ================= drm_test_rect_intersect  =================
[09:20:23] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[09:20:23] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[09:20:23] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[09:20:23] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[09:20:23] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[09:20:23] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[09:20:23] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[09:20:23] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[09:20:23] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[09:20:23] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[09:20:23] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[09:20:23] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[09:20:23] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[09:20:23] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[09:20:23] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[09:20:23] ============= [PASSED] drm_test_rect_intersect =============
[09:20:23] ================ drm_test_rect_calc_hscale  ================
[09:20:23] [PASSED] normal use
[09:20:23] [PASSED] out of max range
[09:20:23] [PASSED] out of min range
[09:20:23] [PASSED] zero dst
[09:20:23] [PASSED] negative src
[09:20:23] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[09:20:23] ============ [PASSED] drm_test_rect_calc_hscale ============
[09:20:23] ================ drm_test_rect_calc_vscale  ================
[09:20:23] [PASSED] normal use
[09:20:23] [PASSED] out of max range
[09:20:23] [PASSED] out of min range
[09:20:23] [PASSED] zero dst
[09:20:23] [PASSED] negative src
[09:20:23] [PASSED] negative dst
[09:20:23] ============ [PASSED] drm_test_rect_calc_vscale ============
[09:20:23] ================== drm_test_rect_rotate  ===================
[09:20:23] [PASSED] reflect-x
[09:20:23] [PASSED] reflect-y
[09:20:23] [PASSED] rotate-0
[09:20:23] [PASSED] rotate-90
[09:20:23] [PASSED] rotate-180
[09:20:23] [PASSED] rotate-270
[09:20:23] ============== [PASSED] drm_test_rect_rotate ===============
[09:20:23] ================ drm_test_rect_rotate_inv  =================
[09:20:23] [PASSED] reflect-x
[09:20:23] [PASSED] reflect-y
[09:20:23] [PASSED] rotate-0
[09:20:23] [PASSED] rotate-90
[09:20:23] [PASSED] rotate-180
[09:20:23] [PASSED] rotate-270
[09:20:23] ============ [PASSED] drm_test_rect_rotate_inv =============
[09:20:23] ==================== [PASSED] drm_rect =====================
[09:20:23] ============================================================
[09:20:23] Testing complete. Ran 391 tests: passed: 391
[09:20:23] Elapsed time: 22.049s total, 1.657s configuring, 20.262s building, 0.128s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


