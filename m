Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC6BC52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEED10E998;
	Fri,  9 Aug 2024 16:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRVP9sIo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8AB10E998
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 16:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723222343; x=1754758343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TwcfbJDHx8JqgG9WhX2yVLZVky27z8PaSNqxQbUuUQQ=;
 b=gRVP9sIoOxzfGLZ77XXcOfJAFoJGDjZW9NXv/iC6LoHLq1jajKp9sPDf
 aPMny5is7rwjBNMnzBeOx6cV96sO+kw4qFc5kpIkcVHZG9G5i0kLGoD4i
 eT/b1MRHesGqIRctQaw6KV571SsHdgHGDrXScY2BO05qDFzwLTazIMF97
 785b9DZNPjuYUDacoWuq5edaRC8erQvWiyZE0RydAcQcHSfwUkOuTghT9
 68IolAod8RMV+yKzAtt7E/U68YxfpunkqHFinEoxtAD5n7DET/WAdqeBj
 c2G+HIJNUUf/NbElxRenujLGSDIKxo7jR0qiiN1ku26gMITNsOyNiI9Vi Q==;
X-CSE-ConnectionGUID: uTgd4xTMSs6Moy3Gjx6vKg==
X-CSE-MsgGUID: SLkGwJ40T0STUSdrJ08leg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21379413"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21379413"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:23 -0700
X-CSE-ConnectionGUID: ejXxcuQTRsq+sLfg2sUIQw==
X-CSE-MsgGUID: xF1Sfjp9RKKc1ayURzzSAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57569296"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:21 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 03/12] drm/xe/pf: Drop GuC notifications for non-existing VF
Date: Fri,  9 Aug 2024 18:51:50 +0200
Message-Id: <20240809165159.662-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
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

It is unlikely that GuC will ever send a G2H notification with an
invalid VFID and it is currently harmless if that actually happen.
But in upcoming patches we will start using that VFID as an index
and we must be sure it is a valid to avoid a crash due to a buggy
firmware or a currupted G2H message.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index d11839d9e7d4..ad447d867e51 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -8,6 +8,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
@@ -212,6 +213,11 @@ static void pf_handle_vf_flr_done(struct xe_gt *gt, u32 vfid)
 
 static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
 {
+	xe_gt_sriov_dbg_verbose(gt, "received VF%u event %#x\n", vfid, eventid);
+
+	if (vfid > xe_gt_sriov_pf_get_totalvfs(gt))
+		return -EPROTO;
+
 	switch (eventid) {
 	case GUC_PF_NOTIFY_VF_FLR:
 		pf_handle_vf_flr(gt, vfid);
-- 
2.43.0

