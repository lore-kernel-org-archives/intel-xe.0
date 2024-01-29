Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD839C47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 19:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5820A10EEEB;
	Mon, 29 Jan 2024 19:50:24 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDD610EEEB;
 Mon, 29 Jan 2024 19:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_series_starting_with_=5B1/2=5D?=
 =?utf-8?q?_drm/xe=3A_Add_SVG_state_table_for_Xe2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Mon, 29 Jan 2024 19:50:22 -0000
Message-ID: <170655782290.806672.4185957972997462628@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129194615.282624-1-jose.souza@intel.com>
In-Reply-To: <20240129194615.282624-1-jose.souza@intel.com>
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

Series: series starting with [1/2] drm/xe: Add SVG state table for Xe2
URL   : https://patchwork.freedesktop.org/series/129280/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[19:49:30] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:49:34] Building KUnit Kernel ...
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
../arch/um/os-Linux/main.c:187:7: warning: no previous prototype for ‘__wrap_malloc’ [-Wmissing-prototypes]
  187 | void *__wrap_malloc(int size)
      |       ^~~~~~~~~~~~~
../arch/um/os-Linux/main.c:208:7: warning: no previous prototype for ‘__wrap_calloc’ [-Wmissing-prototypes]
  208 | void *__wrap_calloc(int n, int size)
      |       ^~~~~~~~~~~~~
../arch/um/os-Linux/main.c:222:6: warning: no previous prototype for ‘__wrap_free’ [-Wmissing-prototypes]
  222 | void __wrap_free(void *ptr)
      |      ^~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:17:5: warning: no previous prototype for ‘init_new_context’ [-Wmissing-prototypes]
   17 | int init_new_context(struct task_struct *task, struct mm_struct *mm)
      |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:60:6: warning: no previous prototype for ‘destroy_context’ [-Wmissing-prototypes]
   60 | void destroy_context(struct mm_struct *mm)
      |      ^~~~~~~~~~~~~~~
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
../arch/um/kernel/skas/process.c:36:12: warning: no previous prototype for ‘start_uml’ [-Wmissing-prototypes]
   36 | int __init start_uml(void)
      |            ^~~~~~~~~
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

[19:49:58] Starting KUnit Kernel (1/1)...
[19:49:58] ============================================================
[19:49:58] =================== guc_dbm (7 subtests) ===================
[19:49:58] [PASSED] test_empty
[19:49:58] [PASSED] test_default
[19:49:58] ======================== test_size  ========================
[19:49:58] [PASSED] 4
[19:49:58] [PASSED] 8
[19:49:58] [PASSED] 32
[19:49:58] [PASSED] 256
[19:49:58] ==================== [PASSED] test_size ====================
[19:49:58] ======================= test_reuse  ========================
[19:49:58] [PASSED] 4
[19:49:58] [PASSED] 8
[19:49:58] [PASSED] 32
[19:49:58] [PASSED] 256
[19:49:58] =================== [PASSED] test_reuse ====================
[19:49:58] =================== test_range_overlap  ====================
[19:49:58] [PASSED] 4
[19:49:58] [PASSED] 8
[19:49:58] [PASSED] 32
[19:49:58] [PASSED] 256
[19:49:58] =============== [PASSED] test_range_overlap ================
[19:49:58] =================== test_range_compact  ====================
[19:49:58] [PASSED] 4
[19:49:58] [PASSED] 8
[19:49:58] [PASSED] 32
[19:49:58] [PASSED] 256
[19:49:58] =============== [PASSED] test_range_compact ================
[19:49:58] ==================== test_range_spare  =====================
[19:49:58] [PASSED] 4
[19:49:58] [PASSED] 8
[19:49:58] [PASSED] 32
[19:49:58] [PASSED] 256
[19:49:58] ================ [PASSED] test_range_spare =================
[19:49:58] ===================== [PASSED] guc_dbm =====================
[19:49:58] ================== no_relay (3 subtests) ===================
[19:49:58] [PASSED] xe_drops_guc2pf_if_not_ready
[19:49:58] [PASSED] xe_drops_guc2vf_if_not_ready
[19:49:58] [PASSED] xe_rejects_send_if_not_ready
[19:49:58] ==================== [PASSED] no_relay =====================
[19:49:58] ================== pf_relay (14 subtests) ==================
[19:49:58] [PASSED] pf_rejects_guc2pf_too_short
[19:49:58] [PASSED] pf_rejects_guc2pf_too_long
[19:49:58] [PASSED] pf_rejects_guc2pf_no_payload
[19:49:58] [PASSED] pf_fails_no_payload
[19:49:58] [PASSED] pf_fails_bad_origin
[19:49:58] [PASSED] pf_fails_bad_type
[19:49:58] [PASSED] pf_txn_reports_error
[19:49:58] [PASSED] pf_txn_sends_pf2guc
[19:49:58] [PASSED] pf_sends_pf2guc
[19:49:58] [SKIPPED] pf_loopback_nop
[19:49:58] [SKIPPED] pf_loopback_echo
[19:49:58] [SKIPPED] pf_loopback_fail
[19:49:58] [SKIPPED] pf_loopback_busy
[19:49:58] [SKIPPED] pf_loopback_retry
[19:49:58] ==================== [PASSED] pf_relay =====================
[19:49:58] ================== vf_relay (3 subtests) ===================
[19:49:58] [PASSED] vf_rejects_guc2vf_too_short
[19:49:58] [PASSED] vf_rejects_guc2vf_too_long
[19:49:58] [PASSED] vf_rejects_guc2vf_no_payload
[19:49:58] ==================== [PASSED] vf_relay =====================
[19:49:58] ===================== lmtt (1 subtest) =====================
[19:49:58] ======================== test_ops  =========================
[19:49:58] [PASSED] 2-level
[19:49:58] [PASSED] multi-level
[19:49:58] ==================== [PASSED] test_ops =====================
[19:49:58] ====================== [PASSED] lmtt =======================
[19:49:58] ==================== xe_bo (2 subtests) ====================
[19:49:58] [SKIPPED] xe_ccs_migrate_kunit
[19:49:58] [SKIPPED] xe_bo_evict_kunit
[19:49:58] ===================== [SKIPPED] xe_bo ======================
[19:49:58] ================== xe_dma_buf (1 subtest) ==================
[19:49:58] [SKIPPED] xe_dma_buf_kunit
[19:49:58] =================== [SKIPPED] xe_dma_buf ===================
[19:49:58] ================== xe_migrate (1 subtest) ==================
[19:49:58] [SKIPPED] xe_migrate_sanity_kunit
[19:49:58] =================== [SKIPPED] xe_migrate ===================
[19:49:58] =================== xe_mocs (2 subtests) ===================
[19:49:58] [SKIPPED] xe_live_mocs_kernel_kunit
[19:49:58] [SKIPPED] xe_live_mocs_reset_kunit
[19:49:58] ==================== [SKIPPED] xe_mocs =====================
[19:49:58] =================== xe_pci (2 subtests) ====================
[19:49:58] [PASSED] xe_gmdid_graphics_ip
[19:49:58] [PASSED] xe_gmdid_media_ip
[19:49:58] ===================== [PASSED] xe_pci ======================
[19:49:58] ==================== xe_rtp (1 subtest) ====================
[19:49:58] ================== xe_rtp_process_tests  ===================
[19:49:58] [PASSED] coalesce-same-reg
[19:49:58] [PASSED] no-match-no-add
[19:49:58] [PASSED] no-match-no-add-multiple-rules
[19:49:58] [PASSED] two-regs-two-entries
[19:49:58] [PASSED] clr-one-set-other
[19:49:58] [PASSED] set-field
[19:49:58] [PASSED] conflict-duplicate
[19:49:58] [PASSED] conflict-not-disjoint
[19:49:58] [PASSED] conflict-reg-type
[19:49:58] ============== [PASSED] xe_rtp_process_tests ===============
[19:49:58] ===================== [PASSED] xe_rtp ======================
[19:49:58] ==================== xe_wa (1 subtest) =====================
[19:49:58] ======================== xe_wa_gt  =========================
[19:49:58] [PASSED] TIGERLAKE (B0)
[19:49:58] [PASSED] DG1 (A0)
[19:49:58] [PASSED] DG1 (B0)
[19:49:58] [PASSED] ALDERLAKE_S (A0)
[19:49:58] [PASSED] ALDERLAKE_S (B0)
[19:49:58] [PASSED] ALDERLAKE_S (C0)
[19:49:58] [PASSED] ALDERLAKE_S (D0)
[19:49:58] [PASSED] ALDERLAKE_P (A0)
[19:49:58] [PASSED] ALDERLAKE_P (B0)
[19:49:58] [PASSED] ALDERLAKE_P (C0)
[19:49:58] [PASSED] ALDERLAKE_S_RPLS (D0)
[19:49:58] [PASSED] ALDERLAKE_P_RPLU (E0)
[19:49:58] [PASSED] DG2_G10 (C0)
[19:49:58] [PASSED] DG2_G11 (B1)
[19:49:58] [PASSED] DG2_G12 (A1)
[19:49:58] [PASSED] METEORLAKE (g:A0, m:A0)
[19:49:58] [PASSED] METEORLAKE (g:A0, m:A0)
[19:49:58] [PASSED] LUNARLAKE (g:A0, m:A0)
[19:49:58] [PASSED] LUNARLAKE (g:B0, m:A0)
[19:49:58] ==================== [PASSED] xe_wa_gt =====================
[19:49:58] ====================== [PASSED] xe_wa ======================
[19:49:58] ============================================================
[19:49:58] Testing complete. Ran 80 tests: passed: 69, skipped: 11
[19:49:58] Elapsed time: 27.747s total, 4.207s configuring, 23.320s building, 0.192s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[19:49:58] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:50:00] Building KUnit Kernel ...
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

[19:50:20] Starting KUnit Kernel (1/1)...
[19:50:20] ============================================================
[19:50:20] ============ drm_test_pick_cmdline (2 subtests) ============
[19:50:20] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[19:50:20] =============== drm_test_pick_cmdline_named  ===============
[19:50:20] [PASSED] NTSC
[19:50:20] [PASSED] NTSC-J
[19:50:20] [PASSED] PAL
[19:50:20] [PASSED] PAL-M
[19:50:20] =========== [PASSED] drm_test_pick_cmdline_named ===========
[19:50:20] ============== [PASSED] drm_test_pick_cmdline ==============
[19:50:20] ================== drm_buddy (4 subtests) ==================
[19:50:20] [PASSED] drm_test_buddy_alloc_limit
[19:50:20] [PASSED] drm_test_buddy_alloc_optimistic
[19:50:20] [PASSED] drm_test_buddy_alloc_pessimistic
[19:50:20] [PASSED] drm_test_buddy_alloc_pathological
[19:50:20] ==================== [PASSED] drm_buddy ====================
[19:50:20] ============= drm_cmdline_parser (40 subtests) =============
[19:50:20] [PASSED] drm_test_cmdline_force_d_only
[19:50:20] [PASSED] drm_test_cmdline_force_D_only_dvi
[19:50:20] [PASSED] drm_test_cmdline_force_D_only_hdmi
[19:50:20] [PASSED] drm_test_cmdline_force_D_only_not_digital
[19:50:20] [PASSED] drm_test_cmdline_force_e_only
[19:50:20] [PASSED] drm_test_cmdline_res
[19:50:20] [PASSED] drm_test_cmdline_res_vesa
[19:50:20] [PASSED] drm_test_cmdline_res_vesa_rblank
[19:50:20] [PASSED] drm_test_cmdline_res_rblank
[19:50:20] [PASSED] drm_test_cmdline_res_bpp
[19:50:20] [PASSED] drm_test_cmdline_res_refresh
[19:50:20] [PASSED] drm_test_cmdline_res_bpp_refresh
[19:50:20] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[19:50:20] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[19:50:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[19:50:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[19:50:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[19:50:20] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[19:50:20] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[19:50:20] [PASSED] drm_test_cmdline_res_margins_force_on
[19:50:20] [PASSED] drm_test_cmdline_res_vesa_margins
[19:50:20] [PASSED] drm_test_cmdline_name
[19:50:20] [PASSED] drm_test_cmdline_name_bpp
[19:50:20] [PASSED] drm_test_cmdline_name_option
[19:50:20] [PASSED] drm_test_cmdline_name_bpp_option
[19:50:20] [PASSED] drm_test_cmdline_rotate_0
[19:50:20] [PASSED] drm_test_cmdline_rotate_90
[19:50:20] [PASSED] drm_test_cmdline_rotate_180
[19:50:20] [PASSED] drm_test_cmdline_rotate_270
[19:50:20] [PASSED] drm_test_cmdline_hmirror
[19:50:20] [PASSED] drm_test_cmdline_vmirror
[19:50:20] [PASSED] drm_test_cmdline_margin_options
[19:50:20] [PASSED] drm_test_cmdline_multiple_options
[19:50:20] [PASSED] drm_test_cmdline_bpp_extra_and_option
[19:50:20] [PASSED] drm_test_cmdline_extra_and_option
[19:50:20] [PASSED] drm_test_cmdline_freestanding_options
[19:50:20] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[19:50:20] [PASSED] drm_test_cmdline_panel_orientation
[19:50:20] ================ drm_test_cmdline_invalid  =================
[19:50:20] [PASSED] margin_only
[19:50:20] [PASSED] interlace_only
[19:50:20] [PASSED] res_missing_x
[19:50:20] [PASSED] res_missing_y
[19:50:20] [PASSED] res_bad_y
[19:50:20] [PASSED] res_missing_y_bpp
[19:50:20] [PASSED] res_bad_bpp
[19:50:20] [PASSED] res_bad_refresh
[19:50:20] [PASSED] res_bpp_refresh_force_on_off
[19:50:20] [PASSED] res_invalid_mode
[19:50:20] [PASSED] res_bpp_wrong_place_mode
[19:50:20] [PASSED] name_bpp_refresh
[19:50:20] [PASSED] name_refresh
[19:50:20] [PASSED] name_refresh_wrong_mode
[19:50:20] [PASSED] name_refresh_invalid_mode
[19:50:20] [PASSED] rotate_multiple
[19:50:20] [PASSED] rotate_invalid_val
[19:50:20] [PASSED] rotate_truncated
[19:50:20] [PASSED] invalid_option
[19:50:20] [PASSED] invalid_tv_option
[19:50:20] [PASSED] truncated_tv_option
[19:50:20] ============ [PASSED] drm_test_cmdline_invalid =============
[19:50:20] =============== drm_test_cmdline_tv_options  ===============
[19:50:20] [PASSED] NTSC
[19:50:20] [PASSED] NTSC_443
[19:50:20] [PASSED] NTSC_J
[19:50:20] [PASSED] PAL
[19:50:20] [PASSED] PAL_M
[19:50:20] [PASSED] PAL_N
[19:50:20] [PASSED] SECAM
[19:50:20] =========== [PASSED] drm_test_cmdline_tv_options ===========
[19:50:20] =============== [PASSED] drm_cmdline_parser ================
[19:50:20] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[19:50:20] ========== drm_test_get_tv_mode_from_name_valid  ===========
[19:50:20] [PASSED] NTSC
[19:50:20] [PASSED] NTSC-443
[19:50:20] [PASSED] NTSC-J
[19:50:20] [PASSED] PAL
[19:50:20] [PASSED] PAL-M
[19:50:20] [PASSED] PAL-N
[19:50:20] [PASSED] SECAM
[19:50:20] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[19:50:20] [PASSED] drm_test_get_tv_mode_from_name_truncated
[19:50:20] ============ [PASSED] drm_get_tv_mode_from_name ============
[19:50:20] ============= drm_damage_helper (21 subtests) ==============
[19:50:20] [PASSED] drm_test_damage_iter_no_damage
[19:50:20] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[19:50:20] [PASSED] drm_test_damage_iter_no_damage_src_moved
[19:50:20] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[19:50:20] [PASSED] drm_test_damage_iter_no_damage_not_visible
[19:50:20] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[19:50:20] [PASSED] drm_test_damage_iter_no_damage_no_fb
[19:50:20] [PASSED] drm_test_damage_iter_simple_damage
[19:50:20] [PASSED] drm_test_damage_iter_single_damage
[19:50:20] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[19:50:20] [PASSED] drm_test_damage_iter_single_damage_outside_src
[19:50:20] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[19:50:20] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[19:50:20] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[19:50:20] [PASSED] drm_test_damage_iter_single_damage_src_moved
[19:50:20] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[19:50:20] [PASSED] drm_test_damage_iter_damage
[19:50:20] [PASSED] drm_test_damage_iter_damage_one_intersect
[19:50:20] [PASSED] drm_test_damage_iter_damage_one_outside
[19:50:20] [PASSED] drm_test_damage_iter_damage_src_moved
[19:50:20] [PASSED] drm_test_damage_iter_damage_not_visible
[19:50:20] ================ [PASSED] drm_damage_helper ================
[19:50:20] ============== drm_dp_mst_helper (3 subtests) ==============
[19:50:20] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[19:50:20] [PASSED] Clock 154000 BPP 30 DSC disabled
[19:50:20] [PASSED] Clock 234000 BPP 30 DSC disabled
[19:50:20] [PASSED] Clock 297000 BPP 24 DSC disabled
[19:50:20] [PASSED] Clock 332880 BPP 24 DSC enabled
[19:50:20] [PASSED] Clock 324540 BPP 24 DSC enabled
[19:50:20] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[19:50:20] ============== drm_test_dp_mst_calc_pbn_div  ===============
[19:50:20] [PASSED] Link rate 2000000 lane count 4
[19:50:20] [PASSED] Link rate 2000000 lane count 2
[19:50:20] [PASSED] Link rate 2000000 lane count 1
[19:50:20] [PASSED] Link rate 1350000 lane count 4
[19:50:20] [PASSED] Link rate 1350000 lane count 2
[19:50:20] [PASSED] Link rate 1350000 lane count 1
[19:50:20] [PASSED] Link rate 1000000 lane count 4
[19:50:20] [PASSED] Link rate 1000000 lane count 2
[19:50:20] [PASSED] Link rate 1000000 lane count 1
[19:50:20] [PASSED] Link rate 810000 lane count 4
[19:50:20] [PASSED] Link rate 810000 lane count 2
[19:50:20] [PASSED] Link rate 810000 lane count 1
[19:50:20] [PASSED] Link rate 540000 lane count 4
[19:50:20] [PASSED] Link rate 540000 lane count 2
[19:50:20] [PASSED] Link rate 540000 lane count 1
[19:50:20] [PASSED] Link rate 270000 lane count 4
[19:50:20] [PASSED] Link rate 270000 lane count 2
[19:50:20] [PASSED] Link rate 270000 lane count 1
[19:50:20] [PASSED] Link rate 162000 lane count 4
[19:50:20] [PASSED] Link rate 162000 lane count 2
[19:50:20] [PASSED] Link rate 162000 lane count 1
[19:50:20] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[19:50:20] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[19:50:20] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[19:50:20] [PASSED] DP_POWER_UP_PHY with port number
[19:50:20] [PASSED] DP_POWER_DOWN_PHY with port number
[19:50:20] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[19:50:20] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[19:50:20] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[19:50:20] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[19:50:20] [PASSED] DP_QUERY_PAYLOAD with port number
[19:50:20] [PASSED] DP_QUERY_PAYLOAD with VCPI
[19:50:20] [PASSED] DP_REMOTE_DPCD_READ with port number
[19:50:20] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[19:50:20] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[19:50:20] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[19:50:20] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[19:50:20] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[19:50:20] [PASSED] DP_REMOTE_I2C_READ with port number
[19:50:20] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[19:50:20] [PASSED] DP_REMOTE_I2C_READ with transactions array
[19:50:20] [PASSED] DP_REMOTE_I2C_WRITE with port number
[19:50:20] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[19:50:20] [PASSED] DP_REMOTE_I2C_WRITE with data array
[19:50:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[19:50:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[19:50:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[19:50:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[19:50:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[19:50:20] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[19:50:20] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[19:50:20] ================ [PASSED] drm_dp_mst_helper ================
[19:50:20] ================== drm_exec (7 subtests) ===================
[19:50:20] [PASSED] sanitycheck
[19:50:20] [PASSED] test_lock
[19:50:20] [PASSED] test_lock_unlock
[19:50:20] [PASSED] test_duplicates
[19:50:20] [PASSED] test_prepare
[19:50:20] [PASSED] test_prepare_array
[19:50:20] [PASSED] test_multiple_loops
[19:50:20] ==================== [PASSED] drm_exec =====================
[19:50:20] =========== drm_format_helper_test (17 subtests) ===========
[19:50:20] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[19:50:20] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[19:50:20] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[19:50:20] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[19:50:20] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[19:50:20] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[19:50:20] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[19:50:20] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[19:50:20] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[19:50:20] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[19:50:20] ============== drm_test_fb_xrgb8888_to_mono  ===============
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[19:50:20] ==================== drm_test_fb_swab  =====================
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ================ [PASSED] drm_test_fb_swab =================
[19:50:20] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[19:50:20] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[19:50:20] [PASSED] single_pixel_source_buffer
[19:50:20] [PASSED] single_pixel_clip_rectangle
[19:50:20] [PASSED] well_known_colors
[19:50:20] [PASSED] destination_pitch
[19:50:20] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[19:50:20] ================= drm_test_fb_clip_offset  =================
[19:50:20] [PASSED] pass through
[19:50:20] [PASSED] horizontal offset
[19:50:20] [PASSED] vertical offset
[19:50:20] [PASSED] horizontal and vertical offset
[19:50:20] [PASSED] horizontal offset (custom pitch)
[19:50:20] [PASSED] vertical offset (custom pitch)
[19:50:20] [PASSED] horizontal and vertical offset (custom pitch)
[19:50:20] ============= [PASSED] drm_test_fb_clip_offset =============
[19:50:20] ============== drm_test_fb_build_fourcc_list  ==============
[19:50:20] [PASSED] no native formats
[19:50:20] [PASSED] XRGB8888 as native format
[19:50:20] [PASSED] remove duplicates
[19:50:20] [PASSED] convert alpha formats
[19:50:20] [PASSED] random formats
[19:50:20] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[19:50:20] =================== drm_test_fb_memcpy  ====================
[19:50:20] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[19:50:20] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[19:50:20] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[19:50:20] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[19:50:20] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[19:50:20] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[19:50:20] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[19:50:20] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[19:50:20] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[19:50:20] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[19:50:20] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[19:50:20] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[19:50:20] =============== [PASSED] drm_test_fb_memcpy ================
[19:50:20] ============= [PASSED] drm_format_helper_test ==============
[19:50:20] ================= drm_format (18 subtests) =================
[19:50:20] [PASSED] drm_test_format_block_width_invalid
[19:50:20] [PASSED] drm_test_format_block_width_one_plane
[19:50:20] [PASSED] drm_test_format_block_width_two_plane
[19:50:20] [PASSED] drm_test_format_block_width_three_plane
[19:50:20] [PASSED] drm_test_format_block_width_tiled
[19:50:20] [PASSED] drm_test_format_block_height_invalid
[19:50:20] [PASSED] drm_test_format_block_height_one_plane
[19:50:20] [PASSED] drm_test_format_block_height_two_plane
[19:50:20] [PASSED] drm_test_format_block_height_three_plane
[19:50:20] [PASSED] drm_test_format_block_height_tiled
[19:50:20] [PASSED] drm_test_format_min_pitch_invalid
[19:50:20] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[19:50:20] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[19:50:20] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[19:50:20] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[19:50:20] [PASSED] drm_test_format_min_pitch_two_plane
[19:50:20] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[19:50:20] [PASSED] drm_test_format_min_pitch_tiled
[19:50:20] =================== [PASSED] drm_format ====================
[19:50:20] =============== drm_framebuffer (1 subtest) ================
[19:50:20] =============== drm_test_framebuffer_create  ===============
[19:50:20] [PASSED] ABGR8888 normal sizes
[19:50:20] [PASSED] ABGR8888 max sizes
[19:50:20] [PASSED] ABGR8888 pitch greater than min required
[19:50:20] [PASSED] ABGR8888 pitch less than min required
[19:50:20] [PASSED] ABGR8888 Invalid width
[19:50:20] [PASSED] ABGR8888 Invalid buffer handle
[19:50:20] [PASSED] No pixel format
[19:50:20] [PASSED] ABGR8888 Width 0
[19:50:20] [PASSED] ABGR8888 Height 0
[19:50:20] [PASSED] ABGR8888 Out of bound height * pitch combination
[19:50:20] [PASSED] ABGR8888 Large buffer offset
[19:50:20] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[19:50:20] [PASSED] ABGR8888 Valid buffer modifier
[19:50:20] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[19:50:20] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[19:50:20] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[19:50:20] [PASSED] NV12 Normal sizes
[19:50:20] [PASSED] NV12 Max sizes
[19:50:20] [PASSED] NV12 Invalid pitch
[19:50:20] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[19:50:20] [PASSED] NV12 different  modifier per-plane
[19:50:20] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[19:50:20] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[19:50:20] [PASSED] NV12 Modifier for inexistent plane
[19:50:20] [PASSED] NV12 Handle for inexistent plane
[19:50:20] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[19:50:20] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[19:50:20] [PASSED] YVU420 Normal sizes
[19:50:20] [PASSED] YVU420 Max sizes
[19:50:20] [PASSED] YVU420 Invalid pitch
[19:50:20] [PASSED] YVU420 Different pitches
[19:50:20] [PASSED] YVU420 Different buffer offsets/pitches
[19:50:20] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[19:50:20] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[19:50:20] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[19:50:20] [PASSED] YVU420 Valid modifier
[19:50:20] [PASSED] YVU420 Different modifiers per plane
[19:50:20] [PASSED] YVU420 Modifier for inexistent plane
[19:50:20] [PASSED] X0L2 Normal sizes
[19:50:20] [PASSED] X0L2 Max sizes
[19:50:20] [PASSED] X0L2 Invalid pitch
[19:50:20] [PASSED] X0L2 Pitch greater than minimum required
[19:50:20] [PASSED] X0L2 Handle for inexistent plane
[19:50:20] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[19:50:20] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[19:50:20] [PASSED] X0L2 Valid modifier
[19:50:20] [PASSED] X0L2 Modifier for inexistent plane
[19:50:20] =========== [PASSED] drm_test_framebuffer_create ===========
[19:50:20] ================= [PASSED] drm_framebuffer =================
[19:50:20] ================ drm_gem_shmem (8 subtests) ================
[19:50:20] [PASSED] drm_gem_shmem_test_obj_create
[19:50:20] [PASSED] drm_gem_shmem_test_obj_create_private
[19:50:20] [PASSED] drm_gem_shmem_test_pin_pages
[19:50:20] [PASSED] drm_gem_shmem_test_vmap
[19:50:20] [PASSED] drm_gem_shmem_test_get_pages_sgt
[19:50:20] [PASSED] drm_gem_shmem_test_get_sg_table
[19:50:20] [PASSED] drm_gem_shmem_test_madvise
[19:50:20] [PASSED] drm_gem_shmem_test_purge
[19:50:20] ================== [PASSED] drm_gem_shmem ==================
[19:50:20] ================= drm_managed (2 subtests) =================
[19:50:20] [PASSED] drm_test_managed_release_action
[19:50:20] [PASSED] drm_test_managed_run_action
[19:50:20] =================== [PASSED] drm_managed ===================
[19:50:20] =================== drm_mm (6 subtests) ====================
[19:50:20] [PASSED] drm_test_mm_init
[19:50:20] [PASSED] drm_test_mm_debug
[19:50:20] [PASSED] drm_test_mm_align32
[19:50:20] [PASSED] drm_test_mm_align64
[19:50:20] [PASSED] drm_test_mm_lowest
[19:50:20] [PASSED] drm_test_mm_highest
[19:50:20] ===================== [PASSED] drm_mm ======================
[19:50:20] ============= drm_modes_analog_tv (4 subtests) =============
[19:50:20] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[19:50:20] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[19:50:20] [PASSED] drm_test_modes_analog_tv_pal_576i
[19:50:20] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[19:50:20] =============== [PASSED] drm_modes_analog_tv ===============
[19:50:20] ============== drm_plane_helper (2 subtests) ===============
[19:50:20] =============== drm_test_check_plane_state  ================
[19:50:20] [PASSED] clipping_simple
[19:50:20] [PASSED] clipping_rotate_reflect
[19:50:20] [PASSED] positioning_simple
[19:50:20] [PASSED] upscaling
[19:50:20] [PASSED] downscaling
[19:50:20] [PASSED] rounding1
[19:50:20] [PASSED] rounding2
[19:50:20] [PASSED] rounding3
[19:50:20] [PASSED] rounding4
[19:50:20] =========== [PASSED] drm_test_check_plane_state ============
[19:50:20] =========== drm_test_check_invalid_plane_state  ============
[19:50:20] [PASSED] positioning_invalid
[19:50:20] [PASSED] upscaling_invalid
[19:50:20] [PASSED] downscaling_invalid
[19:50:20] ======= [PASSED] drm_test_check_invalid_plane_state ========
[19:50:20] ================ [PASSED] drm_plane_helper =================
[19:50:20] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[19:50:20] ====== drm_test_connector_helper_tv_get_modes_check  =======
[19:50:20] [PASSED] None
[19:50:20] [PASSED] PAL
[19:50:20] [PASSED] NTSC
[19:50:20] [PASSED] Both, NTSC Default
[19:50:20] [PASSED] Both, PAL Default
[19:50:20] [PASSED] Both, NTSC Default, with PAL on command-line
[19:50:20] [PASSED] Both, PAL Default, with NTSC on command-line
[19:50:20] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[19:50:20] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[19:50:20] ================== drm_rect (9 subtests) ===================
[19:50:20] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[19:50:20] [PASSED] drm_test_rect_clip_scaled_not_clipped
[19:50:20] [PASSED] drm_test_rect_clip_scaled_clipped
[19:50:20] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[19:50:20] ================= drm_test_rect_intersect  =================
[19:50:20] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[19:50:20] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[19:50:20] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[19:50:20] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[19:50:20] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[19:50:20] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[19:50:20] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[19:50:20] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[19:50:20] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[19:50:20] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[19:50:20] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[19:50:20] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[19:50:20] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[19:50:20] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[19:50:20] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[19:50:20] ============= [PASSED] drm_test_rect_intersect =============
[19:50:20] ================ drm_test_rect_calc_hscale  ================
[19:50:20] [PASSED] normal use
[19:50:20] [PASSED] out of max range
[19:50:20] [PASSED] out of min range
[19:50:20] [PASSED] zero dst
[19:50:20] [PASSED] negative src
[19:50:20] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[19:50:20] ============ [PASSED] drm_test_rect_calc_hscale ============
[19:50:20] ================ drm_test_rect_calc_vscale  ================
[19:50:20] [PASSED] normal use
[19:50:20] [PASSED] out of max range
[19:50:20] [PASSED] out of min range
[19:50:20] [PASSED] zero dst
[19:50:20] [PASSED] negative src
[19:50:20] [PASSED] negative dst
[19:50:20] ============ [PASSED] drm_test_rect_calc_vscale ============
[19:50:20] ================== drm_test_rect_rotate  ===================
[19:50:20] [PASSED] reflect-x
[19:50:20] [PASSED] reflect-y
[19:50:20] [PASSED] rotate-0
[19:50:20] [PASSED] rotate-90
[19:50:20] [PASSED] rotate-180
[19:50:20] [PASSED] rotate-270
[19:50:20] ============== [PASSED] drm_test_rect_rotate ===============
[19:50:20] ================ drm_test_rect_rotate_inv  =================
[19:50:20] [PASSED] reflect-x
[19:50:20] [PASSED] reflect-y
[19:50:20] [PASSED] rotate-0
[19:50:20] [PASSED] rotate-90
[19:50:20] [PASSED] rotate-180
[19:50:20] [PASSED] rotate-270
[19:50:20] ============ [PASSED] drm_test_rect_rotate_inv =============
[19:50:20] ==================== [PASSED] drm_rect =====================
[19:50:20] ============================================================
[19:50:20] Testing complete. Ran 391 tests: passed: 391
[19:50:20] Elapsed time: 22.187s total, 1.647s configuring, 20.371s building, 0.164s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


