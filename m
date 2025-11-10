Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A6DCCFA1A
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377F010E463;
	Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWxd5AqD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EB910E385
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816833; x=1794352833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KrnWk6UdwuCBHE4Xrnee25gf5RMfbbk5ThKZku2z+f4=;
 b=jWxd5AqDwJ3CTxw5ZKdkfZzmyjX3+QOxk4FlxmhdvelwnKSkbuRdLxK0
 nJ9MzxiBqAu20nnj37a+WLng8V1p37vpRY1R+HL0U+tA79538/oIMyHwo
 aspHsMKVUfUC4HXuY9E4PmgS5ifQVHRYbwWpP/BF3G65NX3gptu2U3Nzq
 mz1JfyRp/cIsn2x+doJB16+CFgeVJxQ7ru6iBV1a9/hLMa5ysuQ1hmnhN
 TxTYs+31MtHIXA+wec7KVmsDl+vsFu4AbbSdEka9ctF3l5t4CEMU5l6uy
 eFoVTHceTk/wlRccS7WoBtFX0NWU9xJcGd3VM/7IkPLa4wbkKvwBHdsl9 Q==;
X-CSE-ConnectionGUID: W5gXYDHeQo2TElFqzYiarQ==
X-CSE-MsgGUID: T0/YtLtSTJKC6nv8HEC8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="67480247"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="67480247"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
X-CSE-ConnectionGUID: OMv+wGlISXyRxtNvNETM5A==
X-CSE-MsgGUID: zgVgZeIcRDOYvBFMWhMv7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189243951"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v2 02/30] drm/xe/eustall: Store forcewake reference in stream
 structure
Date: Mon, 10 Nov 2025 15:20:20 -0800
Message-ID: <20251110232017.1475869-34-matthew.d.roper@intel.com>
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

