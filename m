Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B90D116F1
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 13:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E3710E8F4;
	Fri, 28 Nov 2025 13:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2d1sV2D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F164B10E8D6
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 13:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764335614; x=1795871614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JdiUMeoswIoZ52N469Kx9Pu8vc/t1D47gM2RWkUevLY=;
 b=Y2d1sV2Doii1XconWeoLvKzg/Ju6rT2chEbjJYS6X+Iy57VIbJBSnI5M
 YlcbTvQH/jXvkwHS+199omZXewB1PGdIYn9xAFhrHGRMJQd4QisEJCHPI
 JTfri9T2kAw/TgzSRxqmFszr/BTFcQTNS1/8dTeXLKqh0oX3tbgordp+y
 YX9H7Ij7JYL0PjbH+Z8vQ0AnO7X9VCEX5jmsvAXeIwlsZWQwNzSkWvgmk
 fzHDRYbJZBkuaP8JoYP2GtAE/UCn1De4/Xq/RIu517n0GJOKkcM1jU7pH
 Nql56OlHXlBAk9in/AykSHdFKVp9SxxZZiCMSvQK7Xc2OB/v/NJ5VW9mF Q==;
X-CSE-ConnectionGUID: YQTOFTmCSc+CGpjylEKTSQ==
X-CSE-MsgGUID: KQOjm65IQVyAT4hztF15Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66084615"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="66084615"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 05:13:33 -0800
X-CSE-ConnectionGUID: 7B9SJxQfQIWjox0Xy4D8jg==
X-CSE-MsgGUID: dvZEZGd7Rkub25ZlrN6YvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="193126626"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 28 Nov 2025 05:13:32 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v7 3/4] drm/xe/vf: Requeue recovery on GuC MIGRATION error
 during VF post-migration
Date: Fri, 28 Nov 2025 19:00:56 +0530
Message-ID: <20251128133052.17120-9-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128133052.17120-6-satyanarayana.k.v.p@intel.com>
References: <20251128133052.17120-6-satyanarayana.k.v.p@intel.com>
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
V6 -> V7:
- New commit.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 9 +++++++--
 drivers/gpu/drm/xe/xe_guc.c         | 6 ++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index fd7dd4a4739d..937554657440 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1256,14 +1256,19 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	}
 
 	err = vf_post_migration_fixups(gt);
-	if (err)
+	if (unlikely(err))
 		goto fail;
 
 	vf_post_migration_rearm(gt);
 
 	err = vf_post_migration_resfix_done(gt, marker);
-	if (err)
+	if (unlikely(err == -EREMCHG))
+		goto queue;
+	if (unlikely(err)) {
+		xe_gt_sriov_err(gt, "Recovery failed at GuC RESFIX_DONE step (%pe)\n",
+				ERR_PTR(err));
 		goto fail;
+	}
 
 	vf_post_migration_kickstart(gt);
 
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

