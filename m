Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB99CAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 11:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FEF10E22B;
	Mon, 29 Sep 2025 11:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQi9oNaU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13C810E147
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 11:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759145229; x=1790681229;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jeJqPUCX/En5SGXd4asipH1hGjO4Y7TdVNgt9xMpaS0=;
 b=NQi9oNaUvli2+KiSxrBt3U2ZSTwFc/INUrQxblpatk7n48va8cQVcHId
 r+eGVY95aUGplf9UvTT8lt+bgzlU4AiEP9IpK2TkzfBhxk11vMvYGhgfk
 6I/7QwUaK15gbQXBW2RfeEZLGd2wIB5/Q73jzwvA8DzGQdTR5UVumPvYo
 yqk92rL1HdjYPnbKj+HLTEd6Fu1geyi8fdZVl0w51cT2SRpSKSjmVGO7a
 30enshvNGL0nQVbOfuU0LPwor9ud8jaNrZlc0E6X+lrnTmGc4sb0g7a94
 9wf2PkFEq93MowINWhBqNGgVhtGxpPezLDbcQ8XulOYZzU9cv+ghMG7bj w==;
X-CSE-ConnectionGUID: gREpgP9+TGGlHECqDBNDRA==
X-CSE-MsgGUID: DUQr+uuHRt+MS5JXs3qddw==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61550252"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61550252"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 04:27:09 -0700
X-CSE-ConnectionGUID: Ljchz87DTVCJMTxYyVtBKg==
X-CSE-MsgGUID: 5fwMfnkqQQ2yJHASU53wIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178030140"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 04:27:08 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/bo: Fix an idle assertion for local bos
Date: Mon, 29 Sep 2025 13:26:49 +0200
Message-ID: <20250929112649.6131-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

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
---
 drivers/gpu/drm/xe/xe_bo.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index edc6e29f0cc1..0e2bd719226d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1737,6 +1737,24 @@ static bool should_migrate_to_smem(struct xe_bo *bo)
 	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
 }
 
+static int xe_bo_wait_usage_kernel(struct xe_bo *bo, struct ttm_operation_ctx *ctx)
+{
+	long lerr;
+
+	if (ctx->no_wait_gpu)
+		return dma_resv_test_signaled(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL) ?
+			0 : -EBUSY;
+
+	lerr = dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
+				     ctx->interruptible, MAX_SCHEDULE_TIMEOUT);
+	if (lerr < 0)
+		return lerr;
+	if (lerr == 0)
+		return -EBUSY;
+
+	return 0;
+}
+
 /* Populate the bo if swapped out, or migrate if the access mode requires that. */
 static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
 			       struct drm_exec *exec)
@@ -1745,10 +1763,9 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
 	int err = 0;
 
 	if (ttm_manager_type(tbo->bdev, tbo->resource->mem_type)->use_tt) {
-		xe_assert(xe_bo_device(bo),
-			  dma_resv_test_signaled(tbo->base.resv, DMA_RESV_USAGE_KERNEL) ||
-			  (tbo->ttm && ttm_tt_is_populated(tbo->ttm)));
-		err = ttm_bo_populate(&bo->ttm, ctx);
+		err = xe_bo_wait_usage_kernel(bo, ctx);
+		if (!err)
+			err = ttm_bo_populate(&bo->ttm, ctx);
 	} else if (should_migrate_to_smem(bo)) {
 		xe_assert(xe_bo_device(bo), bo->flags & XE_BO_FLAG_SYSTEM);
 		err = xe_bo_migrate(bo, XE_PL_TT, ctx, exec);
@@ -1922,7 +1939,6 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 			.no_wait_gpu = false,
 			.gfp_retry_mayfail = retry_after_wait,
 		};
-		long lerr;
 
 		err = drm_exec_lock_obj(&exec, &tbo->base);
 		drm_exec_retry_on_contention(&exec);
@@ -1942,13 +1958,9 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 			break;
 		}
 
-		lerr = dma_resv_wait_timeout(tbo->base.resv,
-					     DMA_RESV_USAGE_KERNEL, true,
-					     MAX_SCHEDULE_TIMEOUT);
-		if (lerr < 0) {
-			err = lerr;
+		err = xe_bo_wait_usage_kernel(bo, &tctx);
+		if (err)
 			break;
-		}
 
 		if (!retry_after_wait)
 			ret = __xe_bo_cpu_fault(vmf, xe, bo);
-- 
2.51.0

