Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17DCCCFA19
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8229A10E1D2;
	Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvdqfuXr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F3E10EB78
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539209; x=1794075209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KrnWk6UdwuCBHE4Xrnee25gf5RMfbbk5ThKZku2z+f4=;
 b=SvdqfuXriKj7Lc2nWEUCGAPx74BgP2Y/KWheLI24eGSBj/ZqL5bvQSvu
 WNsLBVRCCB0+kwq0VGPZT6yJ/m65iEgO2ZiSyxzM14U5bosGitgHm83uT
 aofeDj2idmtzYR5niScyTvioBy05f7Lomud3AmUVn5QJ0K927bp05DVrb
 GwSd82IKZKc1mxiFZHvYTrnpG6P6LYQRCUPcUhuGn5vkoxuaz+HRN3Tno
 TmH7FZwF7QmZUCHtYYSYy4gpJvJju5tvD2YZn4lyfC6zZHibqAJPbLLDx
 3TL5Uru4NzBdjqMOfXLCz7r1tNdXsR3nwF4+sWSeASrHNj6KSrrkoXTKA g==;
X-CSE-ConnectionGUID: BAR653KLTNS/bzchswM/4A==
X-CSE-MsgGUID: XcydtdZLSmqYssN+xWisgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64730182"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64730182"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:28 -0800
X-CSE-ConnectionGUID: OTVB6nWgRPShhgMaA4jrbQ==
X-CSE-MsgGUID: ovpyeBTXQyeT2acZJxZq/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271150"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH 02/33] drm/xe/eustall: Store forcewake reference in stream
 structure
Date: Fri,  7 Nov 2025 10:13:18 -0800
Message-ID: <20251107181315.631642-37-matthew.d.roper@intel.com>
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
returned by xe_force_wake_get().  Since EU stall grabs and releases
forcewake in different functions, xe_eu_stall_disable_locked() is
currently calling put with a hardcoded RENDER domain.  Although this
works for now, it's somewhat fragile in case the power domain(s)
required by stall sampling change in the future, or if workarounds show
up that require us to obtain additional domains.

Stash the original reference obtained during stream enable inside the
stream structure so that we can use it directly when the stream is
disabled.

Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 650e45f6a7c7..97dfb7945b7a 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -49,6 +49,7 @@ struct xe_eu_stall_data_stream {
 	wait_queue_head_t poll_wq;
 	size_t data_record_size;
 	size_t per_xecore_buf_size;
+	unsigned int fw_ref;
 
 	struct xe_gt *gt;
 	struct xe_bo *bo;
@@ -660,13 +661,12 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 	struct per_xecore_buf *xecore_buf;
 	struct xe_gt *gt = stream->gt;
 	u16 group, instance;
-	unsigned int fw_ref;
 	int xecore;
 
 	/* Take runtime pm ref and forcewake to disable RC6 */
 	xe_pm_runtime_get(gt_to_xe(gt));
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_RENDER);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_RENDER)) {
+	stream->fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_RENDER);
+	if (!xe_force_wake_ref_has_domain(stream->fw_ref, XE_FW_RENDER)) {
 		xe_gt_err(gt, "Failed to get RENDER forcewake\n");
 		xe_pm_runtime_put(gt_to_xe(gt));
 		return -ETIMEDOUT;
@@ -832,7 +832,7 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
 					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
+	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
-- 
2.51.1

