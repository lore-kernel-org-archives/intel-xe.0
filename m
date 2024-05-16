Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE550C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 06:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6971510E3E5;
	Thu, 16 May 2024 06:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMPudkOS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6F410E37F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 06:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715841878; x=1747377878;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=f0F8Trfwyomc4lH15OKx0LR+LX20P0q3RLQVomKxSvc=;
 b=VMPudkOSA1jW0D/cjbpDNmToInuTbAOZGqYY56g7+IJiP0yHaufDo2IF
 ZMwSeSuyDM5otpAEV7+imkkGpKLnHVmjSbMNHhUIhG8APQFqGww691FIc
 Pc4Gs0D+jgs7AA0Gt5rNL6CxEFZT1REwHMf7ZfLx9/inNqGBcO/loVoG5
 wwdp1/2gRAxwoPq5Aw9hTOM9Kqwwo1aaF+nXRwpjA54ZuDR5gY0ALsZWA
 mVcu7T+TALMnbVq2gzPoBK4badbmWIqonMRcRJKUtM0236287kJEa+h6X
 hpyOAG/jXYb9aRaO2Mm8QZXRL0xqbx6sZmHfgSfBDc+qinJHG+UYDo7uT w==;
X-CSE-ConnectionGUID: FfsR3OvfT2uGrRmeGgpA4Q==
X-CSE-MsgGUID: me8HigLCQ6GPIwrwy7Yqrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11878115"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="11878115"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 23:44:38 -0700
X-CSE-ConnectionGUID: sz8r25XlTCOwCPeXfQEssA==
X-CSE-MsgGUID: af8yuKXyTBaE+DXT46mnqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="35880845"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.188])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 23:44:37 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 20/21] drm/ttm: Use drm_exec_trylock for bo initialization
Date: Thu, 16 May 2024 08:44:08 +0200
Message-ID: <20240516064410.22151-21-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516064410.22151-1-thomas.hellstrom@linux.intel.com>
References: <20240516064410.22151-1-thomas.hellstrom@linux.intel.com>
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
index 3f1247fc657d..ed67c3b4a6a3 100644
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

