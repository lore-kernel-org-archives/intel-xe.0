Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CA7CA0EFA
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 15:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0C410E4E6;
	Mon, 25 Aug 2025 15:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dEWshdpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0184D10E4E6
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756135727; x=1787671727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qG6PjHsq0PVRo4Hk/7CSZEoLr9UddXoQ1nUtTFbBa5k=;
 b=dEWshdpxJm4vfg10AwxAYeinHzjsI77bnxCFMz1mt8A3UxJfuJDpMMOY
 pxRrZts9KejxqQSDzVp4QSKdmX8VwkHdsjwPrpN29Ai0KacckdU3iV9Rb
 8rIGYBcIizizy+30BzsvFez1rirgWMcpL4HnlB5O4EgUI05Kz5HamMx2L
 hfSPUe9lV8NI78V6Yq4YcIAx6wDkaezxEcQnRtFAm7bFgS7a6weDi2fjR
 0LotFcSxjqSQikw04wjsmZJWykRB50R0tF69KJBY6Q37/zVX8GoixRNly
 +uExMZhZmLpiuNemJy8Cjxwn577m0quwNNMd5WFeHFzuvn1HdV/UCWv78 Q==;
X-CSE-ConnectionGUID: +1p0yUjfTn6yZng4v2xb7Q==
X-CSE-MsgGUID: 4PO3Hiu8SyKTW+h78O19Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58214513"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="58214513"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 08:28:47 -0700
X-CSE-ConnectionGUID: kLtokR7OSbKL4c9OXoU7NQ==
X-CSE-MsgGUID: KCH4YXupTv6iYK70BxIqtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="173622328"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 08:28:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v2] drm/xe: Don't trigger rebind on initial dma-buf validation
Date: Mon, 25 Aug 2025 08:28:41 -0700
Message-Id: <20250825152841.3837378-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

On the first validate of an imported dma-buf (initial bind), the device
has no GPU mappings, so a rebind is unnecessary. Rebinding here is
harmful in multi-GPU setups and for VMs using preempt-fence mode, as it
would evict in-flight GPU work.

v2:
 - Drop dma_buf_validated, check for XE_PL_SYSTEM (Thomas)

Signed-off-by: Matthee Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6fea39842e1e..a0630e120cd2 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -816,7 +816,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	}
 
 	if (ttm_bo->type == ttm_bo_type_sg) {
-		ret = xe_bo_move_notify(bo, ctx);
+		if (new_mem->mem_type == XE_PL_SYSTEM)
+			ret = xe_bo_move_notify(bo, ctx);
 		if (!ret)
 			ret = xe_bo_move_dmabuf(ttm_bo, new_mem);
 		return ret;
-- 
2.34.1

