Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39F7C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 19:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B1210E7DB;
	Thu, 31 Jul 2025 19:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knS1gjdJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5409710E7DB
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 19:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753991204; x=1785527204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aElubdQuFPx+M4HTxy2VfvUtYpe69LSYv+xs2YhtI4k=;
 b=knS1gjdJOq+YG3Ag5KmXvT02KxfSVZR5EEQXUKwPV2VeKbfEeH1KAac/
 auoGH9CUFDEPhuzhKSYBA3ib1CyTR6QJFrmnT/IlHozuHTyMhVgSK7Sox
 KKo38lcdEHbC1gG129WMwvoWrKujzuKWXYq+T1epG3aoR2kkrl7lAlpnO
 Qfd/+swrpgC8iIY70eME2mcPuL5NfsxK5PQepxdBbzOprMu5Q88B2Bb3U
 SqGM8BkvPDaF90tDUvwK3eRkqtSjosS/P0NTb81aDRq3yhqCYED3OIQbG
 kF0majrCzy7rPlgrZHE9ITspef/95JH4W1X+O1vJpWHpAZOzx/rL288+a g==;
X-CSE-ConnectionGUID: T+EkRoQ5QTKNjMZv11ZP0Q==
X-CSE-MsgGUID: hIKdKBRJSdeZyz2Ky50R4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67404326"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="67404326"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:46:44 -0700
X-CSE-ConnectionGUID: Gf6V9U2gQNC3MLICcFvw0w==
X-CSE-MsgGUID: 7U7yQugFTKeDdpBUWEJlzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163696985"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:46:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Skip LMTT update if no LMEM was provisioned
Date: Thu, 31 Jul 2025 21:46:33 +0200
Message-ID: <20250731194633.179852-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

During VF unprovisioning, if VF was not provisioned with LMEM,
there is no need to trigger LMTT update, as VF LMTT was never
set. This will spare us sending full TLB invalidation requests.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index f00cce81f1ff..692b174dd5b8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1434,8 +1434,10 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 	return err;
 }
 
-static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_config *config)
+static bool pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_config *config)
 {
+	bool released = false;
+
 	xe_gt_assert(gt, IS_DGFX(gt_to_xe(gt)));
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
@@ -1443,7 +1445,9 @@ static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_confi
 	if (config->lmem_obj) {
 		xe_bo_unpin_map_no_vm(config->lmem_obj);
 		config->lmem_obj = NULL;
+		released = true;
 	}
+	return released;
 }
 
 static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
@@ -2021,12 +2025,13 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 	struct xe_device *xe = gt_to_xe(gt);
+	bool released;
 
 	if (xe_gt_is_main_type(gt)) {
 		pf_release_vf_config_ggtt(gt, config);
 		if (IS_DGFX(xe)) {
-			pf_release_vf_config_lmem(gt, config);
-			if (xe_device_has_lmtt(xe))
+			released = pf_release_vf_config_lmem(gt, config);
+			if (released && xe_device_has_lmtt(xe))
 				pf_update_vf_lmtt(xe, vfid);
 		}
 	}
-- 
2.47.1

