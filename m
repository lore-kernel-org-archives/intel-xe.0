Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D528AC83F03
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 22:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F1810E79B;
	Wed,  2 Jul 2025 22:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ki1ZMOBI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9244910E798
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 22:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751495457; x=1783031457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U8OiCrznjNr8I/ISIlMhcm5kPCb4P9Ag8ZiLJTt5Yak=;
 b=ki1ZMOBIkJ56IHHShjXlRLS2Ex+11y3EFOYs7ZF32X3Sjm5kPBVaPxwO
 dIYnpIJjCpNz2/A4bpU4gacKh0SOOQ5BE+VqQsQ7qLqGnW3F3mUh5J7mY
 lVa8wISNHyjrSd6Wn0DRxmdj32ZkIY+Qv+xexYBdKx2NgHHnmDMl7kYyf
 dg/H6No7/5q5lNPBKBq8S+pgieDq5HpQz2OnJHjJpAaTuXH62Yhizgi9e
 myOnhDpqToVmwrvgZcClm5npB9rA/28BCOui591rtc6BMZsVLWg+fLZ/Y
 Lgn/4vKkfB/mstIad2sQlwn/yWh5b0Rv9/TcvT4MF1Nw4Y0vtHzWg/0b/ g==;
X-CSE-ConnectionGUID: vdii9/RATESGKA6jh/t21Q==
X-CSE-MsgGUID: ybPKxlgTSUCywS3Cg6hD+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53737231"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="53737231"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:30:56 -0700
X-CSE-ConnectionGUID: SSKiuAR2SruzNF6hP2irAw==
X-CSE-MsgGUID: +A2BtoaZS7OpLih6tozFTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153645296"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.112.168])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:30:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe/pf: Force GuC virtualization mode
Date: Thu,  3 Jul 2025 00:30:39 +0200
Message-Id: <20250702223041.1700-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250702223041.1700-1-michal.wajdeczko@intel.com>
References: <20250702223041.1700-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

By default the GuC starts in the 'native' mode and enables the VGT
mode (aka 'virtualization' mode) only after it receives at least one
set of VF configuration data. While this happens naturally while PF
begins VFs provisioning, we might need this sooner as some actions,
like TLB_INVALIDATION_ALL(0x7002), is supported by the GuC only in
the VGT mode.

And this becomes a real problem if we would want to use above action
to invalidate the LMTT early during VFs auto-provisioning, before VFs
are enabled, as such H2G would be rejected:

 [ ] xe 0000:4d:00.0: [drm] *ERROR* GT0: FAST_REQ H2G fence 0x804e failed! e=0x30, h=0
 [ ] xe 0000:4d:00.0: [drm] *ERROR* GT0: Fence 0x804e was used by action 0x7002 sent at:
      h2g_write+0x33e/0x870 [xe]
      __guc_ct_send_locked+0x1e1/0x1110 [xe]
      guc_ct_send_locked+0x9f/0x740 [xe]
      xe_guc_ct_send_locked+0x19/0x60 [xe]
      send_tlb_invalidation+0xc2/0x470 [xe]
      xe_gt_tlb_invalidation_all_async+0x45/0xa0 [xe]
      xe_gt_tlb_invalidation_all+0x4b/0xa0 [xe]
      lmtt_invalidate_hw+0x64/0x1a0 [xe]
      xe_lmtt_invalidate_hw+0x5c/0x340 [xe]
      pf_update_vf_lmtt+0x398/0xae0 [xe]
      pf_provision_vf_lmem+0x350/0xa60 [xe]
      xe_gt_sriov_pf_config_bulk_set_lmem+0xe2/0x410 [xe]
      xe_gt_sriov_pf_config_set_fair_lmem+0x1c6/0x620 [xe]
      xe_gt_sriov_pf_config_set_fair+0xd5/0x3f0 [xe]
      xe_pci_sriov_configure+0x360/0x1200 [xe]
      sriov_numvfs_store+0xbc/0x1d0
      dev_attr_store+0x17/0x40
      sysfs_kf_write+0x4a/0x80
      kernfs_fop_write_iter+0x166/0x220
      vfs_write+0x2ba/0x580
      ksys_write+0x77/0x100
      __x64_sys_write+0x19/0x30
      x64_sys_call+0x2bf/0x2660
      do_syscall_64+0x93/0x7a0
      entry_SYSCALL_64_after_hwframe+0x76/0x7e
 [ ] xe 0000:4d:00.0: [drm] *ERROR* GT0: CT dequeue failed: -71
 [ ] xe 0000:4d:00.0: [drm] GT0: trying reset from receive_g2h [xe]

This could be mitigated by pushing earlier a PF self-configuration
with some hard-coded values that cover unlimited access to the GGTT,
use of all GuC contexts and doorbells.  This step is sufficient for
the GuC to switch into the VGT mode.  We must do that on init and
repeat on every GT/GuC reset.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index d186f780885d..a75ef4007a1e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2366,6 +2366,30 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 	return err;
 }
 
+static int pf_push_self_config(struct xe_gt *gt)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
+	u64 ggtt_reserved = xe_wopcm_size(xe);
+	u64 ggtt_size = tile->mem.ggtt->size - ggtt_reserved;
+	int fail = 0;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(xe));
+
+	/* GuC will turn on the VGT mode once it receives this minimal config */
+	fail |= pf_push_vf_cfg_ggtt(gt, PFID, ggtt_reserved, ggtt_size);
+	fail |= pf_push_vf_cfg_ctxs(gt, PFID, 0, GUC_ID_MAX);
+	fail |= pf_push_vf_cfg_dbs(gt, PFID, 0, GUC_NUM_DOORBELLS);
+
+	if (fail) {
+		xe_gt_sriov_notice(gt, "Failed to push self configuration\n");
+		return -ECONNREFUSED;
+	}
+
+	xe_gt_sriov_dbg(gt, "self configuration completed\n");
+	return 0;
+}
+
 static void fini_config(void *arg)
 {
 	struct xe_gt *gt = arg;
@@ -2389,9 +2413,14 @@ static void fini_config(void *arg)
 int xe_gt_sriov_pf_config_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
 
+	err = pf_push_self_config(gt);
+	if (err)
+		return err;
+
 	return devm_add_action_or_reset(xe->drm.dev, fini_config, gt);
 }
 
@@ -2409,6 +2438,8 @@ void xe_gt_sriov_pf_config_restart(struct xe_gt *gt)
 	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
 	unsigned int fail = 0, skip = 0;
 
+	pf_push_self_config(gt);
+
 	for (n = 1; n <= total_vfs; n++) {
 		if (xe_gt_sriov_pf_config_is_empty(gt, n))
 			skip++;
-- 
2.47.1

