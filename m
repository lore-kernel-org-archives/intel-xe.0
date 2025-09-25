Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716C9CCD180
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDB510E9EC;
	Thu, 25 Sep 2025 23:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRP/W/fz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CFB10E330
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844008; x=1790380008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OAEDf25IxOx4ynWEGwz0ocW+fOJjjg/+LgdTsN3asYk=;
 b=TRP/W/fzihC9TpbyXenPVQYnuF5AJlZ+31OKukOyZZ3ivXzPaC9L8pI6
 lMpU8q8uIKaQRBhHNEAh5Iu1c4f+F3M02OPMtZtu0haJdlJyAoZkAMu+W
 jvZkXUYCqvlSKZGCVaYfg+uTo5zrzRLCsOlxUwevirt/JdfcMj5nmhXre
 qPqmmvJ8GcblLZ5Vn7OMXzFVdItgj2k2Cz73dq0lABqWo4NPO0iS0IdGu
 EAjmSUCkIKVy9LUcZGnRua2jMcku7a965uNNm2WMWaj51FvI7cPJsbrry
 2RVMeT4H5rwlQemDLbhTxQtBV1Rl+GwwKIaz9fvn796aKSGiQC9GT/qyN Q==;
X-CSE-ConnectionGUID: cK2gfU0DRLGKpFtcHcG2lQ==
X-CSE-MsgGUID: aB7a8oJRSiq/Rklmpdf3Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817678"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817678"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: A2I4XtYqRTmKKvl170U5Fw==
X-CSE-MsgGUID: S0G8TEa6QauFSr/lKSMDrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852993"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 16/22] drm/xe: Bypass Wa_14018094691 when primary GT is
 disabled
Date: Thu, 25 Sep 2025 16:46:44 -0700
Message-ID: <20250925234628.2112163-40-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

Don't try to lookup Wa_14018094691 on a NULL GT when the primary GT is
disabled.  If the primary GT is disabled, there's no mid-thread
preemption happening which would make this workaround relevant anyway.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 83d61bf8ec62..dd69cb834f8e 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -266,7 +266,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 	unsigned int fw_ref;
 	int ret;
 
-	if (XE_GT_WA(tile->primary_gt, 14018094691)) {
+	if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691)) {
 		fw_ref = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
 
 		/*
@@ -281,7 +281,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 
 	ret = gsc_upload(gsc);
 
-	if (XE_GT_WA(tile->primary_gt, 14018094691))
+	if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691))
 		xe_force_wake_put(gt_to_fw(tile->primary_gt), fw_ref);
 
 	if (ret)
-- 
2.51.0

