Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A89C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 14:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C1710E890;
	Fri,  1 Aug 2025 14:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPIKjJsK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56AA10E894
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754059477; x=1785595477;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M4F0KnJf0l6D3le6/UFEqhHFC5RrIVG56Xpwj8rJ5v8=;
 b=BPIKjJsKbmaCfusrpMiKlgxmajEv6bAHbfGLXMY/rbJn9gDvPSvGsteF
 6SGuFruyN/KXRJaycBJdiCjb98DgRZxLOyIQ8wqNK6oX1nJsJjWscRlrf
 mivDEEzDV54OP8r8Gny3LSTNwCdj8pIGv6RFXINjyNPSTz4sAAtNval5C
 OnCMIxBbtJt6DCxLn8NKubnxsViLDGKZSxwJSM+T83kcnxKJgRb+BCgpC
 B3lgEJ56/4S1Q5voZMNtrFHzrJsl2KO5/C8mP/tj1BKwUI4fGyHJOmkPD
 uqeSjoW4SfSJl1LDZWTfwiAzWWudEDMqap1+9wcVZqZqABnpyXG+SXBVm A==;
X-CSE-ConnectionGUID: QTPAUAiKS8eZFHSCbPxcUg==
X-CSE-MsgGUID: t11RnAo6Q4i3/OvIaab7EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60046632"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="60046632"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:44:37 -0700
X-CSE-ConnectionGUID: 2Wt3TSU4Q5mej5/v3xwDIQ==
X-CSE-MsgGUID: 20KT5MxjTeq6DIRaiPpCpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="187254718"
Received: from mkolod1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.39])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:44:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/pf: Skip LMTT update if no LMEM was provisioned
Date: Fri,  1 Aug 2025 16:44:18 +0200
Message-ID: <20250801144418.180584-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

During VF unprovisioning, if VF was not provisioned with LMEM,
there is no need to trigger LMTT update, as VF LMTT was never
set. This will spare us sending full TLB invalidation requests.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
v2: don't use local var (Jonathan) add comment (Michal)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index f00cce81f1ff..c8f0320d032f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1434,7 +1434,8 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 	return err;
 }
 
-static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_config *config)
+/* Return: %true if there was an LMEM provisioned, %false otherwise */
+static bool pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_config *config)
 {
 	xe_gt_assert(gt, IS_DGFX(gt_to_xe(gt)));
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
@@ -1443,7 +1444,9 @@ static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_confi
 	if (config->lmem_obj) {
 		xe_bo_unpin_map_no_vm(config->lmem_obj);
 		config->lmem_obj = NULL;
+		return true;
 	}
+	return false;
 }
 
 static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
@@ -2021,12 +2024,13 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
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

