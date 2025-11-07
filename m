Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4184CCFA1E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895D110EB7D;
	Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRB/e8JB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0F110E1D2
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539209; x=1794075209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ORIlrfkqlas7Sx23S78s8YIliKIFKSOc0wQ5fO0Lpw=;
 b=CRB/e8JBoBd30G32Mx//kVJIajw30cS9nDmHjg1dQLCgwUNp7k8mfZPO
 v2gTYzCWp6SLPmQqMpQl4NlCR4nvUtP5x7Car5M9jb8sx0yosGgUu0Qxt
 W1pcF3c23hINrqbASFuP8NWCoQExjvfQe1lS5N82VMTYFyKYaDzCKG1M5
 YNep++/U6uMFadvRjxvsyzQLL2H5NRDIWWwyKuDGQVGIJvp9xDVaKF4Ee
 hETZdPSr0PZOLB+kMhXbYKRp96xyhypfdClFEcXG1aKMti2nUV/V8heth
 2c+HeTUmocoOeVG6VHAGwGAWrtK1sweLR9lodqvwFcrEvVwQOd8YTVHJS g==;
X-CSE-ConnectionGUID: UVDSg2hcS4qgV0lIKSKvjQ==
X-CSE-MsgGUID: sHToxiuVSk6TpIJnj+/KvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64730183"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64730183"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
X-CSE-ConnectionGUID: Gzc4EGvATdC64b27LILj2Q==
X-CSE-MsgGUID: RW60ZXPzSju0MDBBOVGs6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271153"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 03/33] drm/xe/oa: Store forcewake reference in stream structure
Date: Fri,  7 Nov 2025 10:13:19 -0800
Message-ID: <20251107181315.631642-38-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Calls to xe_force_wake_put() should generally pass the exact reference
returned by xe_force_wake_get().  Since OA grabs and releases forcewake
in different functions, xe_oa_stream_destroy() is currently calling put
with a hardcoded ALL mask.  Although this works for now, it's somewhat
fragile in case OA moves to more precise power domain management in the
future.

Stash the original reference obtained during stream initialization
inside the stream structure so that we can use it directly when the
stream is destroyed.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 9 ++++-----
 drivers/gpu/drm/xe/xe_oa_types.h | 3 +++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7a13a7bd99a6..87a2bf53d661 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -870,7 +870,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	xe_oa_free_oa_buffer(stream);
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 
 	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
@@ -1717,7 +1717,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 			     struct xe_oa_open_param *param)
 {
 	struct xe_gt *gt = param->hwe->gt;
-	unsigned int fw_ref;
 	int ret;
 
 	stream->exec_q = param->exec_q;
@@ -1772,8 +1771,8 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 
 	/* Take runtime pm ref and forcewake to disable RC6 */
 	xe_pm_runtime_get(stream->oa->xe);
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+	stream->fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(stream->fw_ref, XE_FORCEWAKE_ALL)) {
 		ret = -ETIMEDOUT;
 		goto err_fw_put;
 	}
@@ -1818,7 +1817,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 err_free_oa_buf:
 	xe_oa_free_oa_buffer(stream);
 err_fw_put:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 	if (stream->override_gucrc)
 		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index daf701b5d48b..cf080f412189 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -264,5 +264,8 @@ struct xe_oa_stream {
 
 	/** @syncs: syncs to wait on and to signal */
 	struct xe_sync_entry *syncs;
+
+	/** @fw_ref: Forcewake reference */
+	unsigned int fw_ref;
 };
 #endif
-- 
2.51.1

