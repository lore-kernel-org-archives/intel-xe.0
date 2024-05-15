Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D6BC25B7F
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 08:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245A610E5B3;
	Wed, 15 May 2024 08:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GKstf8dD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28F010E0D9
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 08:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715760918; x=1747296918;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=c+7JfpjhUja62FYMznV+K0tNN0rX9/5lhS66olgomXE=;
 b=GKstf8dDOMKo06W0VISY0UQPKHqam2o1D9IWla3XJFtCOniVSRhLOV4V
 DT/IqwBl3B3ypfWlsirDPl0WZ3ZnvC7WRxkmB8gVmq/U8KnUEsg5dLS9s
 9abXTptIUKSU+05vVti9VUeHyTDzWt2+UdJHITQDJ8JH+NIUMZffYTm9U
 eaj2fgFUkxwexZZCoyhWd5yUn2Q8z+3528RKorFLh/uAyN3EkEFLN6AfK
 oL7GGjEaviH3Dd0PzcWInrXOEd2p5pKpfJBI89w8pmpo8Qk/RGbe6nf75
 8NWoRFAwHopsjsXNk9cApKA2mKCIzhdBp8XZu/kYPXHq3hRYmeZf2pODB A==;
X-CSE-ConnectionGUID: RjR4RTUqSMGNbOPTtqu2Gg==
X-CSE-MsgGUID: Gu4akJ3xRC6TwMAjvWcJlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23193325"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="23193325"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:17 -0700
X-CSE-ConnectionGUID: z4hS0GRwRfKzMLH8lfDnog==
X-CSE-MsgGUID: gcGehxW2SL2iHZk427lYEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="30977489"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.147])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:17 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 20/21] drm/ttm: Use drm_exec_trylock for bo initialization
Date: Wed, 15 May 2024 10:14:48 +0200
Message-ID: <20240515081449.46646-21-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
References: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 103a26e51792..44000c006126 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -919,7 +919,10 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 	 * since otherwise lockdep will be angered in radeon.
 	 */
 	if (!resv)
-		WARN_ON(!dma_resv_trylock(bo->base.resv));
+		if (ctx->exec)
+			WARN_ON(drm_exec_trylock_obj(ctx->exec, &bo->base));
+		else
+			WARN_ON(!dma_resv_trylock(bo->base.resv));
 	else
 		dma_resv_assert_held(resv);
 
@@ -930,8 +933,12 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
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

