Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ABFC47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 11:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BA710F8AD;
	Thu, 25 Jan 2024 11:09:56 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B562310F8AC;
 Thu, 25 Jan 2024 11:09:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Don=27t_make_exec=5F?=
 =?utf-8?q?queues_persistent_by_default?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 25 Jan 2024 11:09:55 -0000
Message-ID: <170618099574.710554.4317577734520399881@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240125105933.5159-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240125105933.5159-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Don't make exec_queues persistent by default
URL   : https://patchwork.freedesktop.org/series/129159/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[11:09:03] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:09:07] Building KUnit Kernel ...
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
../arch/x86/um/os-Linux/registers.c:146:15: warning: no previous prototype for ‘get_thread_reg’ [-Wmissing-prototypes]
  146 | unsigned long get_thread_reg(int reg, jmp_buf *buf)
      |               ^~~~~~~~~~~~~~
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
../arch/x86/um/os-Linux/mcontext.c:7:6: warning: no previous prototype for ‘get_regs_from_mc’ [-Wmissing-prototypes]
    7 | void get_regs_from_mc(struct uml_pt_regs *regs, mcontext_t *mc)
      |      ^~~~~~~~~~~~~~~~
../arch/um/os-Linux/skas/process.c:107:6: warning: no previous prototype for ‘wait_stub_done’ [-Wmissing-prototypes]
  107 | void wait_stub_done(int pid)
      |      ^~~~~~~~~~~~~~
../arch/um/os-Linux/skas/process.c:683:6: warning: no previous prototype for ‘__switch_mm’ [-Wmissing-prototypes]
  683 | void __switch_mm(struct mm_id *mm_idp)
      |      ^~~~~~~~~~~
../arch/um/kernel/skas/process.c:36:12: warning: no previous prototype for ‘start_uml’ [-Wmissing-prototypes]
   36 | int __init start_uml(void)
      |            ^~~~~~~~~
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
../arch/um/os-Linux/start_up.c:301:12: warning: no previous prototype for ‘parse_iomem’ [-Wmissing-prototypes]
  301 | int __init parse_iomem(char *str, int *add)
      |            ^~~~~~~~~~~
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

[11:09:30] Starting KUnit Kernel (1/1)...
[11:09:30] ============================================================
[11:09:31] =================== guc_dbm (7 subtests) ===================
[11:09:31] [PASSED] test_empty
[11:09:31] [PASSED] test_default
[11:09:31] ======================== test_size  ========================
[11:09:31] [PASSED] 4
[11:09:31] [PASSED] 8
[11:09:31] [PASSED] 32
[11:09:31] [PASSED] 256
[11:09:31] ==================== [PASSED] test_size ====================
[11:09:31] ======================= test_reuse  ========================
[11:09:31] [PASSED] 4
[11:09:31] [PASSED] 8
[11:09:31] [PASSED] 32
[11:09:31] [PASSED] 256
[11:09:31] =================== [PASSED] test_reuse ====================
[11:09:31] =================== test_range_overlap  ====================
[11:09:31] [PASSED] 4
[11:09:31] [PASSED] 8
[11:09:31] [PASSED] 32
[11:09:31] [PASSED] 256
[11:09:31] =============== [PASSED] test_range_overlap ================
[11:09:31] =================== test_range_compact  ====================
[11:09:31] [PASSED] 4
[11:09:31] [PASSED] 8
[11:09:31] [PASSED] 32
[11:09:31] [PASSED] 256
[11:09:31] =============== [PASSED] test_range_compact ================
[11:09:31] ==================== test_range_spare  =====================
[11:09:31] [PASSED] 4
[11:09:31] [PASSED] 8
[11:09:31] [PASSED] 32
[11:09:31] [PASSED] 256
[11:09:31] ================ [PASSED] test_range_spare =================
[11:09:31] ===================== [PASSED] guc_dbm =====================
[11:09:31] ================== no_relay (3 subtests) ===================
[11:09:31] [PASSED] xe_drops_guc2pf_if_not_ready
[11:09:31] [PASSED] xe_drops_guc2vf_if_not_ready
[11:09:31] [PASSED] xe_rejects_send_if_not_ready
[11:09:31] ==================== [PASSED] no_relay =====================
[11:09:31] ================== pf_relay (14 subtests) ==================
[11:09:31] [PASSED] pf_rejects_guc2pf_too_short
[11:09:31] [PASSED] pf_rejects_guc2pf_too_long
[11:09:31] [PASSED] pf_rejects_guc2pf_no_payload
[11:09:31] [PASSED] pf_fails_no_payload
[11:09:31] [PASSED] pf_fails_bad_origin
[11:09:31] [PASSED] pf_fails_bad_type
[11:09:31] [PASSED] pf_txn_reports_error
[11:09:31] [PASSED] pf_txn_sends_pf2guc
[11:09:31] [PASSED] pf_sends_pf2guc
[11:09:31] [SKIPPED] pf_loopback_nop
[11:09:31] [SKIPPED] pf_loopback_echo
[11:09:31] [SKIPPED] pf_loopback_fail
[11:09:31] [SKIPPED] pf_loopback_busy
[11:09:31] [SKIPPED] pf_loopback_retry
[11:09:31] ==================== [PASSED] pf_relay =====================
[11:09:31] ================== vf_relay (3 subtests) ===================
[11:09:31] [PASSED] vf_rejects_guc2vf_too_short
[11:09:31] [PASSED] vf_rejects_guc2vf_too_long
[11:09:31] [PASSED] vf_rejects_guc2vf_no_payload
[11:09:31] ==================== [PASSED] vf_relay =====================
[11:09:31] ===================== lmtt (1 subtest) =====================
[11:09:31] ======================== test_ops  =========================
[11:09:31] [PASSED] 2-level
[11:09:31] [PASSED] multi-level
[11:09:31] ==================== [PASSED] test_ops =====================
[11:09:31] ====================== [PASSED] lmtt =======================
[11:09:31] ==================== xe_bo (2 subtests) ====================
[11:09:31] [SKIPPED] xe_ccs_migrate_kunit
[11:09:31] [SKIPPED] xe_bo_evict_kunit
[11:09:31] ===================== [SKIPPED] xe_bo ======================
[11:09:31] ================== xe_dma_buf (1 subtest) ==================
[11:09:31] [SKIPPED] xe_dma_buf_kunit
[11:09:31] =================== [SKIPPED] xe_dma_buf ===================
[11:09:31] ================== xe_migrate (1 subtest) ==================
[11:09:31] [SKIPPED] xe_migrate_sanity_kunit
[11:09:31] =================== [SKIPPED] xe_migrate ===================
[11:09:31] =================== xe_mocs (2 subtests) ===================
[11:09:31] [SKIPPED] xe_live_mocs_kernel_kunit
[11:09:31] [SKIPPED] xe_live_mocs_reset_kunit
[11:09:31] ==================== [SKIPPED] xe_mocs =====================
[11:09:31] =================== xe_pci (2 subtests) ====================
[11:09:31] [PASSED] xe_gmdid_graphics_ip
[11:09:31] [PASSED] xe_gmdid_media_ip
[11:09:31] ===================== [PASSED] xe_pci ======================
[11:09:31] ==================== xe_rtp (1 subtest) ====================
[11:09:31] ================== xe_rtp_process_tests  ===================
[11:09:31] [PASSED] coalesce-same-reg
[11:09:31] [PASSED] no-match-no-add
[11:09:31] [PASSED] no-match-no-add-multiple-rules
[11:09:31] [PASSED] two-regs-two-entries
[11:09:31] [PASSED] clr-one-set-other
[11:09:31] [PASSED] set-field
[11:09:31] [PASSED] conflict-duplicate
[11:09:31] [PASSED] conflict-not-disjoint
[11:09:31] [PASSED] conflict-reg-type
[11:09:31] ============== [PASSED] xe_rtp_process_tests ===============
[11:09:31] ===================== [PASSED] xe_rtp ======================
[11:09:31] ==================== xe_wa (1 subtest) =====================
[11:09:31] ======================== xe_wa_gt  =========================
[11:09:31] [PASSED] TIGERLAKE (B0)
[11:09:31] [PASSED] DG1 (A0)
[11:09:31] [PASSED] DG1 (B0)
[11:09:31] [PASSED] ALDERLAKE_S (A0)
[11:09:31] [PASSED] ALDERLAKE_S (B0)
[11:09:31] [PASSED] ALDERLAKE_S (C0)
[11:09:31] [PASSED] ALDERLAKE_S (D0)
[11:09:31] [PASSED] ALDERLAKE_P (A0)
[11:09:31] [PASSED] ALDERLAKE_P (B0)
[11:09:31] [PASSED] ALDERLAKE_P (C0)
[11:09:31] [PASSED] ALDERLAKE_S_RPLS (D0)
[11:09:31] [PASSED] ALDERLAKE_P_RPLU (E0)
[11:09:31] [PASSED] DG2_G10 (C0)
[11:09:31] [PASSED] DG2_G11 (B1)
[11:09:31] [PASSED] DG2_G12 (A1)
[11:09:31] [PASSED] METEORLAKE (g:A0, m:A0)
[11:09:31] [PASSED] METEORLAKE (g:A0, m:A0)
[11:09:31] [PASSED] LUNARLAKE (g:A0, m:A0)
[11:09:31] [PASSED] LUNARLAKE (g:B0, m:A0)
[11:09:31] ==================== [PASSED] xe_wa_gt =====================
[11:09:31] ====================== [PASSED] xe_wa ======================
[11:09:31] ============================================================
[11:09:31] Testing complete. Ran 80 tests: passed: 69, skipped: 11
[11:09:31] Elapsed time: 27.961s total, 4.179s configuring, 23.561s building, 0.182s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[11:09:31] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:09:32] Building KUnit Kernel ...
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

[11:09:53] Starting KUnit Kernel (1/1)...
[11:09:53] ============================================================
[11:09:53] ============ drm_test_pick_cmdline (2 subtests) ============
[11:09:53] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[11:09:53] =============== drm_test_pick_cmdline_named  ===============
[11:09:53] [PASSED] NTSC
[11:09:53] [PASSED] NTSC-J
[11:09:53] [PASSED] PAL
[11:09:53] [PASSED] PAL-M
[11:09:53] =========== [PASSED] drm_test_pick_cmdline_named ===========
[11:09:53] ============== [PASSED] drm_test_pick_cmdline ==============
[11:09:53] ================== drm_buddy (4 subtests) ==================
[11:09:53] [PASSED] drm_test_buddy_alloc_limit
[11:09:53] [PASSED] drm_test_buddy_alloc_optimistic
[11:09:53] [PASSED] drm_test_buddy_alloc_pessimistic
[11:09:53] [PASSED] drm_test_buddy_alloc_pathological
[11:09:53] ==================== [PASSED] drm_buddy ====================
[11:09:53] ============= drm_cmdline_parser (40 subtests) =============
[11:09:53] [PASSED] drm_test_cmdline_force_d_only
[11:09:53] [PASSED] drm_test_cmdline_force_D_only_dvi
[11:09:53] [PASSED] drm_test_cmdline_force_D_only_hdmi
[11:09:53] [PASSED] drm_test_cmdline_force_D_only_not_digital
[11:09:53] [PASSED] drm_test_cmdline_force_e_only
[11:09:53] [PASSED] drm_test_cmdline_res
[11:09:53] [PASSED] drm_test_cmdline_res_vesa
[11:09:53] [PASSED] drm_test_cmdline_res_vesa_rblank
[11:09:53] [PASSED] drm_test_cmdline_res_rblank
[11:09:53] [PASSED] drm_test_cmdline_res_bpp
[11:09:53] [PASSED] drm_test_cmdline_res_refresh
[11:09:53] [PASSED] drm_test_cmdline_res_bpp_refresh
[11:09:53] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[11:09:53] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[11:09:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[11:09:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[11:09:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[11:09:53] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[11:09:53] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[11:09:53] [PASSED] drm_test_cmdline_res_margins_force_on
[11:09:53] [PASSED] drm_test_cmdline_res_vesa_margins
[11:09:53] [PASSED] drm_test_cmdline_name
[11:09:53] [PASSED] drm_test_cmdline_name_bpp
[11:09:53] [PASSED] drm_test_cmdline_name_option
[11:09:53] [PASSED] drm_test_cmdline_name_bpp_option
[11:09:53] [PASSED] drm_test_cmdline_rotate_0
[11:09:53] [PASSED] drm_test_cmdline_rotate_90
[11:09:53] [PASSED] drm_test_cmdline_rotate_180
[11:09:53] [PASSED] drm_test_cmdline_rotate_270
[11:09:53] [PASSED] drm_test_cmdline_hmirror
[11:09:53] [PASSED] drm_test_cmdline_vmirror
[11:09:53] [PASSED] drm_test_cmdline_margin_options
[11:09:53] [PASSED] drm_test_cmdline_multiple_options
[11:09:53] [PASSED] drm_test_cmdline_bpp_extra_and_option
[11:09:53] [PASSED] drm_test_cmdline_extra_and_option
[11:09:53] [PASSED] drm_test_cmdline_freestanding_options
[11:09:53] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[11:09:53] [PASSED] drm_test_cmdline_panel_orientation
[11:09:53] ================ drm_test_cmdline_invalid  =================
[11:09:53] [PASSED] margin_only
[11:09:53] [PASSED] interlace_only
[11:09:53] [PASSED] res_missing_x
[11:09:53] [PASSED] res_missing_y
[11:09:53] [PASSED] res_bad_y
[11:09:53] [PASSED] res_missing_y_bpp
[11:09:53] [PASSED] res_bad_bpp
[11:09:53] [PASSED] res_bad_refresh
[11:09:53] [PASSED] res_bpp_refresh_force_on_off
[11:09:53] [PASSED] res_invalid_mode
[11:09:53] [PASSED] res_bpp_wrong_place_mode
[11:09:53] [PASSED] name_bpp_refresh
[11:09:53] [PASSED] name_refresh
[11:09:53] [PASSED] name_refresh_wrong_mode
[11:09:53] [PASSED] name_refresh_invalid_mode
[11:09:53] [PASSED] rotate_multiple
[11:09:53] [PASSED] rotate_invalid_val
[11:09:53] [PASSED] rotate_truncated
[11:09:53] [PASSED] invalid_option
[11:09:53] [PASSED] invalid_tv_option
[11:09:53] [PASSED] truncated_tv_option
[11:09:53] ============ [PASSED] drm_test_cmdline_invalid =============
[11:09:53] =============== drm_test_cmdline_tv_options  ===============
[11:09:53] [PASSED] NTSC
[11:09:53] [PASSED] NTSC_443
[11:09:53] [PASSED] NTSC_J
[11:09:53] [PASSED] PAL
[11:09:53] [PASSED] PAL_M
[11:09:53] [PASSED] PAL_N
[11:09:53] [PASSED] SECAM
[11:09:53] =========== [PASSED] drm_test_cmdline_tv_options ===========
[11:09:53] =============== [PASSED] drm_cmdline_parser ================
[11:09:53] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[11:09:53] ========== drm_test_get_tv_mode_from_name_valid  ===========
[11:09:53] [PASSED] NTSC
[11:09:53] [PASSED] NTSC-443
[11:09:53] [PASSED] NTSC-J
[11:09:53] [PASSED] PAL
[11:09:53] [PASSED] PAL-M
[11:09:53] [PASSED] PAL-N
[11:09:53] [PASSED] SECAM
[11:09:53] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[11:09:53] [PASSED] drm_test_get_tv_mode_from_name_truncated
[11:09:53] ============ [PASSED] drm_get_tv_mode_from_name ============
[11:09:53] ============= drm_damage_helper (21 subtests) ==============
[11:09:53] [PASSED] drm_test_damage_iter_no_damage
[11:09:53] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[11:09:53] [PASSED] drm_test_damage_iter_no_damage_src_moved
[11:09:53] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[11:09:53] [PASSED] drm_test_damage_iter_no_damage_not_visible
[11:09:53] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[11:09:53] [PASSED] drm_test_damage_iter_no_damage_no_fb
[11:09:53] [PASSED] drm_test_damage_iter_simple_damage
[11:09:53] [PASSED] drm_test_damage_iter_single_damage
[11:09:53] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[11:09:53] [PASSED] drm_test_damage_iter_single_damage_outside_src
[11:09:53] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[11:09:53] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[11:09:53] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[11:09:53] [PASSED] drm_test_damage_iter_single_damage_src_moved
[11:09:53] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[11:09:53] [PASSED] drm_test_damage_iter_damage
[11:09:53] [PASSED] drm_test_damage_iter_damage_one_intersect
[11:09:53] [PASSED] drm_test_damage_iter_damage_one_outside
[11:09:53] [PASSED] drm_test_damage_iter_damage_src_moved
[11:09:53] [PASSED] drm_test_damage_iter_damage_not_visible
[11:09:53] ================ [PASSED] drm_damage_helper ================
[11:09:53] ============== drm_dp_mst_helper (3 subtests) ==============
[11:09:53] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[11:09:53] [PASSED] Clock 154000 BPP 30 DSC disabled
[11:09:53] [PASSED] Clock 234000 BPP 30 DSC disabled
[11:09:53] [PASSED] Clock 297000 BPP 24 DSC disabled
[11:09:53] [PASSED] Clock 332880 BPP 24 DSC enabled
[11:09:53] [PASSED] Clock 324540 BPP 24 DSC enabled
[11:09:53] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[11:09:53] ============== drm_test_dp_mst_calc_pbn_div  ===============
[11:09:53] [PASSED] Link rate 2000000 lane count 4
[11:09:53] [PASSED] Link rate 2000000 lane count 2
[11:09:53] [PASSED] Link rate 2000000 lane count 1
[11:09:53] [PASSED] Link rate 1350000 lane count 4
[11:09:53] [PASSED] Link rate 1350000 lane count 2
[11:09:53] [PASSED] Link rate 1350000 lane count 1
[11:09:53] [PASSED] Link rate 1000000 lane count 4
[11:09:53] [PASSED] Link rate 1000000 lane count 2
[11:09:53] [PASSED] Link rate 1000000 lane count 1
[11:09:53] [PASSED] Link rate 810000 lane count 4
[11:09:53] [PASSED] Link rate 810000 lane count 2
[11:09:53] [PASSED] Link rate 810000 lane count 1
[11:09:53] [PASSED] Link rate 540000 lane count 4
[11:09:53] [PASSED] Link rate 540000 lane count 2
[11:09:53] [PASSED] Link rate 540000 lane count 1
[11:09:53] [PASSED] Link rate 270000 lane count 4
[11:09:53] [PASSED] Link rate 270000 lane count 2
[11:09:53] [PASSED] Link rate 270000 lane count 1
[11:09:53] [PASSED] Link rate 162000 lane count 4
[11:09:53] [PASSED] Link rate 162000 lane count 2
[11:09:53] [PASSED] Link rate 162000 lane count 1
[11:09:53] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[11:09:53] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[11:09:53] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[11:09:53] [PASSED] DP_POWER_UP_PHY with port number
[11:09:53] [PASSED] DP_POWER_DOWN_PHY with port number
[11:09:53] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[11:09:53] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[11:09:53] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[11:09:53] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[11:09:53] [PASSED] DP_QUERY_PAYLOAD with port number
[11:09:53] [PASSED] DP_QUERY_PAYLOAD with VCPI
[11:09:53] [PASSED] DP_REMOTE_DPCD_READ with port number
[11:09:53] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[11:09:53] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[11:09:53] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[11:09:53] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[11:09:53] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[11:09:53] [PASSED] DP_REMOTE_I2C_READ with port number
[11:09:53] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[11:09:53] [PASSED] DP_REMOTE_I2C_READ with transactions array
[11:09:53] [PASSED] DP_REMOTE_I2C_WRITE with port number
[11:09:53] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[11:09:53] [PASSED] DP_REMOTE_I2C_WRITE with data array
[11:09:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[11:09:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[11:09:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[11:09:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[11:09:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[11:09:53] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[11:09:53] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[11:09:53] ================ [PASSED] drm_dp_mst_helper ================
[11:09:53] ================== drm_exec (7 subtests) ===================
[11:09:53] [PASSED] sanitycheck
[11:09:53] [PASSED] test_lock
[11:09:53] [PASSED] test_lock_unlock
[11:09:53] [PASSED] test_duplicates
[11:09:53] [PASSED] test_prepare
[11:09:53] [PASSED] test_prepare_array
[11:09:53] [PASSED] test_multiple_loops
[11:09:53] ==================== [PASSED] drm_exec =====================
[11:09:53] =========== drm_format_helper_test (17 subtests) ===========
[11:09:53] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[11:09:53] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[11:09:53] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[11:09:53] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[11:09:53] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[11:09:53] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[11:09:53] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[11:09:53] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[11:09:53] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[11:09:53] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[11:09:53] ============== drm_test_fb_xrgb8888_to_mono  ===============
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[11:09:53] ==================== drm_test_fb_swab  =====================
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ================ [PASSED] drm_test_fb_swab =================
[11:09:53] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[11:09:53] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[11:09:53] [PASSED] single_pixel_source_buffer
[11:09:53] [PASSED] single_pixel_clip_rectangle
[11:09:53] [PASSED] well_known_colors
[11:09:53] [PASSED] destination_pitch
[11:09:53] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[11:09:53] ================= drm_test_fb_clip_offset  =================
[11:09:53] [PASSED] pass through
[11:09:53] [PASSED] horizontal offset
[11:09:53] [PASSED] vertical offset
[11:09:53] [PASSED] horizontal and vertical offset
[11:09:53] [PASSED] horizontal offset (custom pitch)
[11:09:53] [PASSED] vertical offset (custom pitch)
[11:09:53] [PASSED] horizontal and vertical offset (custom pitch)
[11:09:53] ============= [PASSED] drm_test_fb_clip_offset =============
[11:09:53] ============== drm_test_fb_build_fourcc_list  ==============
[11:09:53] [PASSED] no native formats
[11:09:53] [PASSED] XRGB8888 as native format
[11:09:53] [PASSED] remove duplicates
[11:09:53] [PASSED] convert alpha formats
[11:09:53] [PASSED] random formats
[11:09:53] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[11:09:53] =================== drm_test_fb_memcpy  ====================
[11:09:53] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[11:09:53] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[11:09:53] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[11:09:53] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[11:09:53] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[11:09:53] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[11:09:53] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[11:09:53] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[11:09:53] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[11:09:53] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[11:09:53] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[11:09:53] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[11:09:53] =============== [PASSED] drm_test_fb_memcpy ================
[11:09:53] ============= [PASSED] drm_format_helper_test ==============
[11:09:53] ================= drm_format (18 subtests) =================
[11:09:53] [PASSED] drm_test_format_block_width_invalid
[11:09:53] [PASSED] drm_test_format_block_width_one_plane
[11:09:53] [PASSED] drm_test_format_block_width_two_plane
[11:09:53] [PASSED] drm_test_format_block_width_three_plane
[11:09:53] [PASSED] drm_test_format_block_width_tiled
[11:09:53] [PASSED] drm_test_format_block_height_invalid
[11:09:53] [PASSED] drm_test_format_block_height_one_plane
[11:09:53] [PASSED] drm_test_format_block_height_two_plane
[11:09:53] [PASSED] drm_test_format_block_height_three_plane
[11:09:53] [PASSED] drm_test_format_block_height_tiled
[11:09:53] [PASSED] drm_test_format_min_pitch_invalid
[11:09:53] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[11:09:53] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[11:09:53] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[11:09:53] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[11:09:53] [PASSED] drm_test_format_min_pitch_two_plane
[11:09:53] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[11:09:53] [PASSED] drm_test_format_min_pitch_tiled
[11:09:53] =================== [PASSED] drm_format ====================
[11:09:53] =============== drm_framebuffer (1 subtest) ================
[11:09:53] =============== drm_test_framebuffer_create  ===============
[11:09:53] [PASSED] ABGR8888 normal sizes
[11:09:53] [PASSED] ABGR8888 max sizes
[11:09:53] [PASSED] ABGR8888 pitch greater than min required
[11:09:53] [PASSED] ABGR8888 pitch less than min required
[11:09:53] [PASSED] ABGR8888 Invalid width
[11:09:53] [PASSED] ABGR8888 Invalid buffer handle
[11:09:53] [PASSED] No pixel format
[11:09:53] [PASSED] ABGR8888 Width 0
[11:09:53] [PASSED] ABGR8888 Height 0
[11:09:53] [PASSED] ABGR8888 Out of bound height * pitch combination
[11:09:53] [PASSED] ABGR8888 Large buffer offset
[11:09:53] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[11:09:53] [PASSED] ABGR8888 Valid buffer modifier
[11:09:53] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[11:09:53] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[11:09:53] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[11:09:53] [PASSED] NV12 Normal sizes
[11:09:53] [PASSED] NV12 Max sizes
[11:09:53] [PASSED] NV12 Invalid pitch
[11:09:53] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[11:09:53] [PASSED] NV12 different  modifier per-plane
[11:09:53] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[11:09:53] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[11:09:53] [PASSED] NV12 Modifier for inexistent plane
[11:09:53] [PASSED] NV12 Handle for inexistent plane
[11:09:53] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[11:09:53] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[11:09:53] [PASSED] YVU420 Normal sizes
[11:09:53] [PASSED] YVU420 Max sizes
[11:09:53] [PASSED] YVU420 Invalid pitch
[11:09:53] [PASSED] YVU420 Different pitches
[11:09:53] [PASSED] YVU420 Different buffer offsets/pitches
[11:09:53] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[11:09:53] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[11:09:53] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[11:09:53] [PASSED] YVU420 Valid modifier
[11:09:53] [PASSED] YVU420 Different modifiers per plane
[11:09:53] [PASSED] YVU420 Modifier for inexistent plane
[11:09:53] [PASSED] X0L2 Normal sizes
[11:09:53] [PASSED] X0L2 Max sizes
[11:09:53] [PASSED] X0L2 Invalid pitch
[11:09:53] [PASSED] X0L2 Pitch greater than minimum required
[11:09:53] [PASSED] X0L2 Handle for inexistent plane
[11:09:53] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[11:09:53] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[11:09:53] [PASSED] X0L2 Valid modifier
[11:09:53] [PASSED] X0L2 Modifier for inexistent plane
[11:09:53] =========== [PASSED] drm_test_framebuffer_create ===========
[11:09:53] ================= [PASSED] drm_framebuffer =================
[11:09:53] ================ drm_gem_shmem (8 subtests) ================
[11:09:53] [PASSED] drm_gem_shmem_test_obj_create
[11:09:53] [PASSED] drm_gem_shmem_test_obj_create_private
[11:09:53] [PASSED] drm_gem_shmem_test_pin_pages
[11:09:53] [PASSED] drm_gem_shmem_test_vmap
[11:09:53] [PASSED] drm_gem_shmem_test_get_pages_sgt
[11:09:53] [PASSED] drm_gem_shmem_test_get_sg_table
[11:09:53] [PASSED] drm_gem_shmem_test_madvise
[11:09:53] [PASSED] drm_gem_shmem_test_purge
[11:09:53] ================== [PASSED] drm_gem_shmem ==================
[11:09:53] ================= drm_managed (2 subtests) =================
[11:09:53] [PASSED] drm_test_managed_release_action
[11:09:53] [PASSED] drm_test_managed_run_action
[11:09:53] =================== [PASSED] drm_managed ===================
[11:09:53] =================== drm_mm (6 subtests) ====================
[11:09:53] [PASSED] drm_test_mm_init
[11:09:53] [PASSED] drm_test_mm_debug
[11:09:53] [PASSED] drm_test_mm_align32
[11:09:53] [PASSED] drm_test_mm_align64
[11:09:53] [PASSED] drm_test_mm_lowest
[11:09:53] [PASSED] drm_test_mm_highest
[11:09:53] ===================== [PASSED] drm_mm ======================
[11:09:53] ============= drm_modes_analog_tv (4 subtests) =============
[11:09:53] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[11:09:53] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[11:09:53] [PASSED] drm_test_modes_analog_tv_pal_576i
[11:09:53] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[11:09:53] =============== [PASSED] drm_modes_analog_tv ===============
[11:09:53] ============== drm_plane_helper (2 subtests) ===============
[11:09:53] =============== drm_test_check_plane_state  ================
[11:09:53] [PASSED] clipping_simple
[11:09:53] [PASSED] clipping_rotate_reflect
[11:09:53] [PASSED] positioning_simple
[11:09:53] [PASSED] upscaling
[11:09:53] [PASSED] downscaling
[11:09:53] [PASSED] rounding1
[11:09:53] [PASSED] rounding2
[11:09:53] [PASSED] rounding3
[11:09:53] [PASSED] rounding4
[11:09:53] =========== [PASSED] drm_test_check_plane_state ============
[11:09:53] =========== drm_test_check_invalid_plane_state  ============
[11:09:53] [PASSED] positioning_invalid
[11:09:53] [PASSED] upscaling_invalid
[11:09:53] [PASSED] downscaling_invalid
[11:09:53] ======= [PASSED] drm_test_check_invalid_plane_state ========
[11:09:53] ================ [PASSED] drm_plane_helper =================
[11:09:53] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[11:09:53] ====== drm_test_connector_helper_tv_get_modes_check  =======
[11:09:53] [PASSED] None
[11:09:53] [PASSED] PAL
[11:09:53] [PASSED] NTSC
[11:09:53] [PASSED] Both, NTSC Default
[11:09:53] [PASSED] Both, PAL Default
[11:09:53] [PASSED] Both, NTSC Default, with PAL on command-line
[11:09:53] [PASSED] Both, PAL Default, with NTSC on command-line
[11:09:53] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[11:09:53] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[11:09:53] ================== drm_rect (9 subtests) ===================
[11:09:53] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[11:09:53] [PASSED] drm_test_rect_clip_scaled_not_clipped
[11:09:53] [PASSED] drm_test_rect_clip_scaled_clipped
[11:09:53] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[11:09:53] ================= drm_test_rect_intersect  =================
[11:09:53] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[11:09:53] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[11:09:53] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[11:09:53] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[11:09:53] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[11:09:53] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[11:09:53] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[11:09:53] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[11:09:53] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[11:09:53] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[11:09:53] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[11:09:53] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[11:09:53] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[11:09:53] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[11:09:53] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[11:09:53] ============= [PASSED] drm_test_rect_intersect =============
[11:09:53] ================ drm_test_rect_calc_hscale  ================
[11:09:53] [PASSED] normal use
[11:09:53] [PASSED] out of max range
[11:09:53] [PASSED] out of min range
[11:09:53] [PASSED] zero dst
[11:09:53] [PASSED] negative src
[11:09:53] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[11:09:53] ============ [PASSED] drm_test_rect_calc_hscale ============
[11:09:53] ================ drm_test_rect_calc_vscale  ================
[11:09:53] [PASSED] normal use
[11:09:53] [PASSED] out of max range
[11:09:53] [PASSED] out of min range
[11:09:53] [PASSED] zero dst
[11:09:53] [PASSED] negative src
[11:09:53] [PASSED] negative dst
[11:09:53] ============ [PASSED] drm_test_rect_calc_vscale ============
[11:09:53] ================== drm_test_rect_rotate  ===================
[11:09:53] [PASSED] reflect-x
[11:09:53] [PASSED] reflect-y
[11:09:53] [PASSED] rotate-0
[11:09:53] [PASSED] rotate-90
[11:09:53] [PASSED] rotate-180
[11:09:53] [PASSED] rotate-270
[11:09:53] ============== [PASSED] drm_test_rect_rotate ===============
[11:09:53] ================ drm_test_rect_rotate_inv  =================
[11:09:53] [PASSED] reflect-x
[11:09:53] [PASSED] reflect-y
[11:09:53] [PASSED] rotate-0
[11:09:53] [PASSED] rotate-90
[11:09:53] [PASSED] rotate-180
[11:09:53] [PASSED] rotate-270
[11:09:53] ============ [PASSED] drm_test_rect_rotate_inv =============
[11:09:53] ==================== [PASSED] drm_rect =====================
[11:09:53] ============================================================
[11:09:53] Testing complete. Ran 391 tests: passed: 391
[11:09:53] Elapsed time: 22.281s total, 1.662s configuring, 20.495s building, 0.121s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


