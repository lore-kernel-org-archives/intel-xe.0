Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E961CCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5BA10E45A;
	Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KaoU/Q1e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378A110E444
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816832; x=1794352832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ORIlrfkqlas7Sx23S78s8YIliKIFKSOc0wQ5fO0Lpw=;
 b=KaoU/Q1eZvcLifno6MXo0yYqN/X/eHchrgWgiages5+imxX7O5tggT7v
 xeIbmEdMVJTW0fJi4EMTIz8FfJ8vuUT89roizp40z416NBNrHFpJ0MqD0
 EQAgopAtUoujA3IdhO236FAnRFFZOpr4ofvGekLmBMJGZTwzVv611vTNC
 PQJVzbXw56xdcY1KZGcPDAqurmyIFA8oL25Om5xrCaOTYAWy+2AzCRN9t
 mmP/PaEp7jA7OyxEGnhcgFKhOyEZ7MD+jZ7e9r51ygdHRk9B4utmADwMR
 +YTBixOWVgH2pQh6w2dTBhiECXav3kgnaVE9aiAqTkev4nRd3/Rx0Y2RG g==;
X-CSE-ConnectionGUID: srEzVEolTx+PA/I3mG3D0Q==
X-CSE-MsgGUID: sznbWPgBSou0NqUGZAVfHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="67480248"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="67480248"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
X-CSE-ConnectionGUID: yCDGg5c3R7apWN34KJsyow==
X-CSE-MsgGUID: u/3wG4fHRIKx+cOf+SI/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189243954"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v2 03/30] drm/xe/oa: Store forcewake reference in stream
 structure
Date: Mon, 10 Nov 2025 15:20:21 -0800
Message-ID: <20251110232017.1475869-35-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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

