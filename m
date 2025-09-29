Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE7BCAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 12:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180E510E3E3;
	Mon, 29 Sep 2025 12:09:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC55610E3E3;
 Mon, 29 Sep 2025 12:09:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/bo=3A_Fix_an_idle_?=
 =?utf-8?q?assertion_for_local_bos?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Sep 2025 12:09:46 -0000
Message-ID: <175914778676.375141.2537821120354271224@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250929112649.6131-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250929112649.6131-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe/bo: Fix an idle assertion for local bos
URL   : https://patchwork.freedesktop.org/series/155164/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit af3fcff837b5c325b4af8842b8ca0bdbb5a4ed21
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Sep 29 13:26:49 2025 +0200

    drm/xe/bo: Fix an idle assertion for local bos
    
    Before calling ttm_bo_populate() in the CPU fault path of a bo,
    we assert that the bo is not being migrated. However, for
    local bos we share the reservation object with other local bos
    that might be in the process of being migrated. Also some VM
    operations may attach USAGE_KERNEL fences to the common
    reservation object and trigger false positives from the assert.
    
    So remove the assert and instead wait for bo idle. This may
    unnecessarily wait for idle in some cases but since we're
    doing this wait later in the fault path anyway we might as
    well do it here as well.
    
    This fixes warnings like:
    Sep 25 14:56:23 desky kernel: ------------[ cut here ]------------
    Sep 25 14:56:23 desky kernel: xe 0000:03:00.0: [drm] Assertion `dma_resv_test_signaled(tbo->base.resv, DMA_RESV_USAGE_KERNEL) || (tbo->ttm && ttm_tt_is_populated(tbo->ttm))` failed!
                                  platform: BATTLEMAGE subplatform: 1
                                  graphics: Xe2_HPG 20.01 step A0
                                  media: Xe2_HPM 13.01 step A1
    Sep 25 14:56:23 desky kernel: WARNING: CPU: 6 PID: 24767 at drivers/gpu/drm/xe/xe_bo.c:1748 xe_bo_fault_migrate+0x1bb/0x300 [xe]
    Sep 25 14:56:23 desky kernel: Modules linked in: cpuid dm_crypt xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bridge stp llc xfrm_user xfr>
    Sep 25 14:56:23 desky kernel:  snd_soc_sdca snd_seq_midi prime_numbers coretemp snd_seq_midi_event drm_ttm_helper snd_hda_codec drm_buddy drm_exec snd_rawmidi snd_soc_core snd_hda_cor>
    Sep 25 14:56:23 desky kernel: CPU: 6 UID: 1000 PID: 24767 Comm: steamwebhelper Tainted: G     U  W           6.17.0-rc7+ #32 PREEMPT(voluntary)
    Sep 25 14:56:23 desky kernel: Tainted: [U]=USER, [W]=WARN
    Sep 25 14:56:23 desky kernel: Hardware name: Micro-Star International Co., Ltd. MS-7D36/PRO Z690-P DDR4 (MS-7D36), BIOS A.A1 10/18/2022
    Sep 25 14:56:23 desky kernel: RIP: 0010:xe_bo_fault_migrate+0x1bb/0x300 [xe]
    Sep 25 14:56:23 desky kernel: Code: fa 64 29 f9 48 c7 c7 40 e0 d3 c1 51 48 c7 c1 c0 e3 d3 c1 52 4c 8b 45 c0 41 50 44 8b 4d c8 4d 89 e0 48 8b 55 a8 e8 25 27 95 ef <0f> 0b 48 83 c4 40 4>
    Sep 25 14:56:23 desky kernel: RSP: 0000:ffffae1ca88c7b10 EFLAGS: 00010286
    Sep 25 14:56:23 desky kernel: RAX: 0000000000000000 RBX: ffff8d7cfd7e6800 RCX: 0000000000000027
    Sep 25 14:56:23 desky kernel: RDX: ffff8d845019cec8 RSI: 0000000000000001 RDI: ffff8d845019cec0
    Sep 25 14:56:23 desky kernel: RBP: ffffae1ca88c7bc8 R08: 0000000000000000 R09: 0000000000000000
    Sep 25 14:56:23 desky kernel: R10: 0000000000000000 R11: 0000000000000004 R12: ffffffffc1db1faa
    Sep 25 14:56:23 desky kernel: R13: ffffffffc1db2ab4 R14: 0000000000000001 R15: ffffae1ca88c7bd8
    Sep 25 14:56:23 desky kernel: FS:  00007fb1baf31940(0000) GS:ffff8d849c870000(0000) knlGS:0000000000000000
    Sep 25 14:56:23 desky kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    Sep 25 14:56:23 desky kernel: CR2: 00007fb1b2860020 CR3: 00000001705a9004 CR4: 0000000000772ef0
    Sep 25 14:56:23 desky kernel: PKRU: 55555558
    Sep 25 14:56:23 desky kernel: Call Trace:
    Sep 25 14:56:23 desky kernel:  <TASK>
    Sep 25 14:56:23 desky kernel:  xe_bo_cpu_fault_fastpath+0x11e/0x220 [xe]
    Sep 25 14:56:23 desky kernel:  xe_bo_cpu_fault+0x84/0x410 [xe]
    Sep 25 14:56:23 desky kernel:  ? __x64_sys_mmap+0x33/0x50
    Sep 25 14:56:23 desky kernel:  ? x64_sys_call+0x1b2e/0x20d0
    Sep 25 14:56:23 desky kernel:  ? do_syscall_64+0x9d/0x1f0
    Sep 25 14:56:23 desky kernel:  ? __check_object_size+0x4a/0x2e0
    Sep 25 14:56:23 desky kernel:  __do_fault+0x36/0x190
    Sep 25 14:56:23 desky kernel:  do_fault+0xcf/0x570
    Sep 25 14:56:23 desky kernel:  __handle_mm_fault+0x92b/0xfe0
    Sep 25 14:56:23 desky kernel:  ? ktime_get_mono_fast_ns+0x39/0xd0
    Sep 25 14:56:23 desky kernel:  handle_mm_fault+0x164/0x2c0
    Sep 25 14:56:23 desky kernel:  do_user_addr_fault+0x2cb/0x840
    Sep 25 14:56:23 desky kernel:  exc_page_fault+0x75/0x180
    Sep 25 14:56:23 desky kernel:  asm_exc_page_fault+0x27/0x30
    Sep 25 14:56:23 desky kernel: RIP: 0033:0x7fb1bc388bb7
    Sep 25 14:56:23 desky kernel: Code: 48 ff c7 48 01 fe 48 8d 54 11 80 0f 1f 84 00 00 00 00 00 c5 fe 6f 0e c5 fe 6f 56 20 c5 fe 6f 5e 40 c5 fe 6f 66 60 48 83 ee 80 <c5> fd 7f 0f c5 fd 7>
    Sep 25 14:56:23 desky kernel: RSP: 002b:00007ffd7814fad8 EFLAGS: 00010207
    Sep 25 14:56:23 desky kernel: RAX: 00007fb1b2860000 RBX: 0000000000000690 RCX: 00007fb1b2860000
    Sep 25 14:56:23 desky kernel: RDX: 00007fb1b2860610 RSI: 0000556eda79f4c0 RDI: 00007fb1b2860020
    Sep 25 14:56:23 desky kernel: RBP: 00007ffd7814fb60 R08: 0000000000000000 R09: 000000012be0e000
    Sep 25 14:56:23 desky kernel: R10: 00007fb1b2860000 R11: 0000000000000246 R12: 0000556edd39a240
    Sep 25 14:56:23 desky kernel: R13: 00007fb1b2dcb010 R14: 0000556eda79f420 R15: 0000000000000000
    Sep 25 14:56:23 desky kernel:  </TASK>
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5250
    Fixes: c2ae94cf8cd8 ("drm/xe: Convert the CPU fault handler for exhaustive eviction")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 0bd69799610244985d95eda223f554d5d22345cb drm-intel
af3fcff837b5 drm/xe/bo: Fix an idle assertion for local bos
-:23: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#23: 
Sep 25 14:56:23 desky kernel: xe 0000:03:00.0: [drm] Assertion `dma_resv_test_signaled(tbo->base.resv, DMA_RESV_USAGE_KERNEL) || (tbo->ttm && ttm_tt_is_populated(tbo->ttm))` failed!

total: 0 errors, 1 warnings, 0 checks, 59 lines checked


