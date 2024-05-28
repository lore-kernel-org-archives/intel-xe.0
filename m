Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD22C27C44
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 09:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E1F10FE03;
	Tue, 28 May 2024 09:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdnArhFO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4708910E739
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 09:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716890131; x=1748426131;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=J315MWDgQXInDc8OsP3at4w8VKdlUB/VDgWc9aZ1qqc=;
 b=JdnArhFOxeO6e3124/CsWNJePxt+Jt/ZB9qvP+fVTmSFq5h/Y8fBL37V
 yhQfAZzirtbBfSlzkUPa3cs/h7HWDtwypLFMYDg5xDQBnXIkP4bwIG3HQ
 zbhaqyVSNlQlmvURDTD3FiCzkiqHo4rpuwSua6x+SLDFLg/4sT4eWzVzH
 IQTsY3jvj5DcTffJo5oB/8eHPdHOpzlJlvPbl4N7H3XPFMc1Jkeb9oNbp
 UQIE5FUYSbFa5OFGb5315CU9ipHbCMrG5pEnBYPkCGNQSNT6t1u9/YQVv
 02/AyP/d7Gf8kfbL3LgGbFBp1w+FbGrdF/5zVT96ExdkiUArnRh8LGtfw w==;
X-CSE-ConnectionGUID: 209NBaVsQWqlFaLOcM6uNA==
X-CSE-MsgGUID: DYMZM3laTaqdyhGHf2E/Nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13345574"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="13345574"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 02:55:29 -0700
X-CSE-ConnectionGUID: i7WteN0lSQmJDjX8960j5A==
X-CSE-MsgGUID: AkkVwmEvR9OVET2OZ58DNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="34932111"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 02:55:28 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 19/20] drm/ttm: Use drm_exec_trylock for bo initialization
Date: Tue, 28 May 2024 11:55:01 +0200
Message-ID: <20240528095503.90177-20-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240528095503.90177-1-thomas.hellstrom@linux.intel.com>
References: <20240528095503.90177-1-thomas.hellstrom@linux.intel.com>
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

Buffer object initialization may be part of a drm_exec transaction.
Rather than using dma_resv_trylock, use drm_exec_trylock_obj().

RFC: This patch indicates to me that we should avoid the -ENOMEM failure
for drm_exec_trylock, Could probably use a sleeping lock here without
problems.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 8706502edcb1..216aeb6d7941 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -942,10 +942,18 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 	/* passed reservation objects should already be locked,
 	 * since otherwise lockdep will be angered in radeon.
 	 */
-	if (!resv)
-		WARN_ON(!dma_resv_trylock(bo->base.resv));
-	else
+	if (!resv) {
+		if (ctx->exec) {
+			ret = drm_exec_sanitize_for_trylock(ctx->exec);
+			if (ret)
+				goto err_put;
+			WARN_ON(drm_exec_trylock_obj(ctx->exec, &bo->base));
+		} else {
+			WARN_ON(!dma_resv_trylock(bo->base.resv));
+		}
+	} else {
 		dma_resv_assert_held(resv);
+	}
 
 	ret = ttm_bo_validate(bo, placement, ctx);
 	if (unlikely(ret))
@@ -954,8 +962,12 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 	return 0;
 
 err_unlock:
-	if (!resv)
-		dma_resv_unlock(bo->base.resv);
+	if (!resv) {
+		if (ctx->exec)
+			drm_exec_unlock_obj(ctx->exec, &bo->base);
+		else
+			dma_resv_unlock(bo->base.resv);
+	}
 
 err_put:
 	ttm_bo_put(bo);
-- 
2.44.0

