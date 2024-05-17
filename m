Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA94C25B7E
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 07:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DC810EE21;
	Fri, 17 May 2024 07:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVQI83J6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D556910EE26
 for <intel-xe@lists.freedesktop.org>; Fri, 17 May 2024 07:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715931718; x=1747467718;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aqcoCRU4N9DS91+gSoR8uJldzTDKB8mTwUeVmzq4VKc=;
 b=UVQI83J6K7HYEwM2KiwZ70J5hGDrOxOUWQh/MG4AL+nAX2T+LTn8MG53
 7UnAP7ZhkBhuG/MPfuKpYOhiy/gRkl/z6Mp4C7l0V/pOp6R0ibnCqrU4z
 5kxCyZ5v6zCFZ/gsGpjfxD723fpakjxSQZhUaRbg8ZP2vLb0xkt0a4m6d
 /Ykjrem/F/MEvF/aU1Fj5uIXD8NAOSvrP4YyFak8yaBS05iemoy8vgBsb
 NlbjdwL6EMCsbPdDhKpv9MzmcU4OYh5bE+hqEGmqgBtV+uP04osoUqevw
 jPiJJxLJfa3LIX4ANiWT/o/e2dC6aRSLEGob3MqqZMubKrHLO55hW6uv2 g==;
X-CSE-ConnectionGUID: X0AEvKOWQXy0zWwUeAHT1Q==
X-CSE-MsgGUID: sIJ/Jth6SRK4cnUm7PU9Fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11897605"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="11897605"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:58 -0700
X-CSE-ConnectionGUID: Nv+JJCcZS2aWst1sl8wQHQ==
X-CSE-MsgGUID: BY4FmHvnS+SJk8cdTBjtKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36213140"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:57 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v4 20/21] drm/ttm: Use drm_exec_trylock for bo initialization
Date: Fri, 17 May 2024 09:41:29 +0200
Message-ID: <20240517074130.2908-21-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240517074130.2908-1-thomas.hellstrom@linux.intel.com>
References: <20240517074130.2908-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/ttm/ttm_bo.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d4b35856f907..618c41d15fef 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -924,10 +924,17 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 	/* passed reservation objects should already be locked,
 	 * since otherwise lockdep will be angered in radeon.
 	 */
-	if (!resv)
-		WARN_ON(!dma_resv_trylock(bo->base.resv));
-	else
+	if (!resv) {
+		if (ctx->exec) {
+			ret = drm_exec_trylock_obj(ctx->exec, &bo->base);
+			if (ret)
+				goto err_put;
+		} else {
+			WARN_ON(!dma_resv_trylock(bo->base.resv));
+		}
+	} else {
 		dma_resv_assert_held(resv);
+	}
 
 	ret = ttm_bo_validate(bo, placement, ctx);
 	if (unlikely(ret))
@@ -936,8 +943,12 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
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

