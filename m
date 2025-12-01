Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A75D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 09:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB72810E35A;
	Mon,  1 Dec 2025 09:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIfOTDa5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599F910E35A
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764581569; x=1796117569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3KD+WGyXo61q78QQsME10+FHkbT51PR9v1XBtRBLxgg=;
 b=TIfOTDa5GOT67B/icSop4lWV4BYU5rBTIxrzGfWAEj7s7H0Y2Ya64V0D
 uaew5gtYV/saC18dah2tYFxG1t41WQbG9RzwpsmHX22piKxFA4Z8W9e28
 0gKFFk1G7lbxmdfwqeqmABJzGeA4wQ960adSc28T9elYzpd6AhWdsmnKY
 5f3QcEw6Ia9cifCoYAqqJpv8sEZucTlOZCEF8OXphR35olvN27y18xyvj
 L+Uc32iB3qe6lV1Yuhpfyp7K9iGWdrmtvmtKQYX1wYkZb0rm9x+5fHtDp
 qYGOKQyrYOjVRuvxDZX5jxWLIXxRECaFw61fPdwUadx6eU4rrUiaR8Mfg Q==;
X-CSE-ConnectionGUID: ZxJQ2KUNTGCmBXKESfY2mQ==
X-CSE-MsgGUID: NFKT5ttYTeWkDXeMLdYX5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="89164409"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="89164409"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:32:48 -0800
X-CSE-ConnectionGUID: yF4bYn0ARuGaGloY6l4CXw==
X-CSE-MsgGUID: ajtkDSmGR3Kil9+wgmMFHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198379563"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 01:32:46 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v8 3/4] drm/xe/vf: Requeue recovery on GuC MIGRATION error
 during VF post-migration
Date: Mon,  1 Dec 2025 15:20:15 +0530
Message-ID: <20251201095011.21453-9-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251201095011.21453-6-satyanarayana.k.v.p@intel.com>
References: <20251201095011.21453-6-satyanarayana.k.v.p@intel.com>
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

Handle GuC response `XE_GUC_RESPONSE_VF_MIGRATED` as a special case in the
VF post-migration recovery flow. When this error occurs, it indicates that
a new migration was detected while the resource fixup process was still in
progress. Instead of failing immediately, requeue the VF into the recovery
path to allow proper handling of the new migration event.

This improves robustness of VF recovery in SR-IOV environments where
migrations can overlap with resource fixup steps.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V7 -> V8:
- Fixed review comments (Michal W).

V6 -> V7:
- New commit.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 3 +++
 drivers/gpu/drm/xe/xe_guc.c         | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 5bf13e41de80..0b3ecb000ff7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1268,6 +1268,9 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 
 	err = vf_post_migration_resfix_done(gt, marker);
 	if (err) {
+		if (err == -EREMCHG)
+			goto queue;
+
 		xe_gt_sriov_err(gt, "Recovery failed at GuC RESFIX_DONE step (%pe)\n",
 				ERR_PTR(err));
 		goto fail;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 88376bc2a483..f0407bab9a0c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1484,6 +1484,12 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
 		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
 
+		if (unlikely(error == XE_GUC_RESPONSE_VF_MIGRATED)) {
+			xe_gt_dbg(gt, "GuC mmio request %#x rejected due to MIGRATION (hint %#x)\n",
+				  request[0], hint);
+			return -EREMCHG;
+		}
+
 		xe_gt_err(gt, "GuC mmio request %#x: failure %#x hint %#x\n",
 			  request[0], error, hint);
 		return -ENXIO;
-- 
2.51.0

