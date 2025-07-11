Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625ABC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 19:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E9A10EABE;
	Fri, 11 Jul 2025 19:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkMfM8Fg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0154C10EAB6
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 19:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752262415; x=1783798415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p5aEVjwrKRqSdylB2bJeSgTVkcBW8JL8NzBIAB928Lc=;
 b=NkMfM8FgmvKCmjDhZfKBfHrsbPWotjq5g7k8EN2tdEaWRGNqr1OMyJIR
 pGOtI0hQsT2hSoK1N0OciVAinnmVYxWaDR7O9oKmOcKH6B4I1gr1LzLr6
 laQ8OnrbBzOcRx/x0gZiF5Bfbeb+jK2t0bSLMCRtNdS9UEF10CNW9c2+6
 77Ij7A2jVUwlUagRTF4Wk2VE8kQwbjgrBg7GywLae8HnCqwiyDiUUt1iz
 oHbksgSFzUytpDqINprXvxAhfN3iiBUPqVoMg6pjm+09sSgjg0ctb20KD
 2kNGTwiq9cT3UagFQ3Y6XrNqdjrLuwtKZqyByX3TN+A6T9uVNnXBI105y Q==;
X-CSE-ConnectionGUID: dtAhAJ81SZqZrGBknLGeMw==
X-CSE-MsgGUID: 0WhIuliJSfa2nCInwnEKoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54651045"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54651045"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:33:35 -0700
X-CSE-ConnectionGUID: z03GQFiIS6eiuGJkeTEAWg==
X-CSE-MsgGUID: OTnFVIxbR5ypd4BJ872mHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="160462022"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:33:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 4/6] drm/xe/pf: Force GuC virtualization mode
Date: Fri, 11 Jul 2025 21:33:14 +0200
Message-Id: <20250711193316.1920-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250711193316.1920-1-michal.wajdeczko@intel.com>
References: <20250711193316.1920-1-michal.wajdeczko@intel.com>
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
the GuC to switch into the VGT mode.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: rebase and push min config as part of the full PF config
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 55afc5b06371..86dade6f1083 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -341,6 +341,17 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
 	}
 	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
 
+	if (vfid == PFID) {
+		u64 ggtt_start = xe_wopcm_size(gt_to_xe(gt));
+		u64 ggtt_size = gt_to_tile(gt)->mem.ggtt->size - ggtt_start;
+
+		/* plain PF config data will never include a real GGTT region */
+		xe_gt_assert(gt, !encode_config_ggtt(cfg + num_dwords, config, true));
+
+		/* fake PF GGTT config covers full GGTT range except reserved WOPCM */
+		num_dwords += encode_ggtt(cfg + num_dwords, ggtt_start, ggtt_size, true);
+	}
+
 	num_klvs = xe_guc_klv_count(cfg, num_dwords);
 	err = pf_push_vf_buf_klvs(gt, vfid, num_klvs, buf, num_dwords);
 
@@ -2375,6 +2386,20 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 	return err;
 }
 
+static void pf_prepare_self_config(struct xe_gt *gt)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, PFID);
+
+	/*
+	 * We want PF to be allowed to use all of context ID, doorbells IDs
+	 * and whole usable GGTT area. While we can store ctxs/dbs numbers
+	 * directly in the config structure, can't do the same with the GGTT
+	 * configuration, so let it be prepared on demand while pushing KLVs.
+	 */
+	config->num_ctxs = GUC_ID_MAX;
+	config->num_dbs = GUC_NUM_DOORBELLS;
+}
+
 static int pf_push_self_config(struct xe_gt *gt)
 {
 	int err;
@@ -2418,6 +2443,7 @@ int xe_gt_sriov_pf_config_init(struct xe_gt *gt)
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	pf_prepare_self_config(gt);
 	err = pf_push_self_config(gt);
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
-- 
2.47.1

