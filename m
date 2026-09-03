Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE228C624DD
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 13:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53D210F5CE;
	Thu,  3 Sep 2026 13:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qDcZOqnB";
	dkim-atps=neutral
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85F510F5E8
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 13:44:13 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-482e4998d28so1769997f8f.2
 for <intel-xe@lists.freedesktop.org>; Thu, 03 Sep 2026 06:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788443052; x=1789047852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=m5nFAvnp9TbeBbFXDaBPRO3V4SNXTlxxZw2s8E+92CE=;
 b=qDcZOqnBdHoFcbhmsgqhzEDdtNwCu2bJUMbjofF6qrA0ouuylP1Y4WQ7fjQluqcPJp
 ceqAGG/L0CUZA0BGxhSaZbqzKzbY53K4u/8tZSwnjjlzxbglL9o1gxeX2tRrvbTk5cHj
 Ula1ShOFsYeZqerFDLx0Xeyz95hVeSYiWdt15WAgDsF8fqq5q6WLW+Hsf5hJKinYvlBV
 33PpDW2gzUcRf2AyJa3eKzmOCLEtRfguMstpGEECcLzfk0iZUNTdxwdZnggj22GF3Jyn
 t52uZIvY5fFd/SLaimXbdD1xlr1dIynBPCLgZ9FBpri8Ng7tLDtQeLonDFHfflHA83UQ
 yLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788443052; x=1789047852;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=m5nFAvnp9TbeBbFXDaBPRO3V4SNXTlxxZw2s8E+92CE=;
 b=dW8qYJiQuEAVUGBMNf3S/f+xwDl71TaC8UitvGqJIhVnuagt2J0eQ65NoLsHyVjcSz
 TZPHC8KWPIxr+Wc/Dog8+tKFvo0sCsu2h/Q8Liq+7XKuXpZoohVYnD2N9jBcvwt2QO7H
 yejUfRyg6jTufOj/Hk0PDBiTrnwRDmyX/RXTE4fHScdZRiYp7h2ilPUbIWo3QFSUeqQe
 1q1dSUQM8CTFaBJ6H3sx/34lq9GEbtJtBITGQv7mOUST+/80eEW5jU60i9RkHZs8Wwjz
 bciUOjqQEoDuRiyFutu0fUPuflztkTodjCRAc1Zju5CzWqqpenytrkbuybOsH6GtoKqj
 dtLw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx8/txlB02lV55e/2o18N0zGuIheXOK4ty85UEWyOAwfiLHBAwbQ0QoyO8i1Ag6BB25i/vOFjXF+Q==@lists.freedesktop.org
X-Gm-Message-State: AFuF++lYLGiUd5atHocP0ye3sMIPM8TmKJakjvJNeWDXHSKSaLWyjM9f
 3bH95PRSQhkjxrB8adqokSGaA8IIUq15V6eoKwbacHNqIHJT4eGmHpBh
X-Gm-Gg: AYBFou3525XAJvscwL7cTZcHrAB9AWizGIJj+mIOpGkxMljZWKZY9nzZ311/hWHUram
 CikHI42z5OhOaIt+RN2IfORpI4PrZeA7mING4wQi21kfuJV39ACsRHg8/NcJ9WQy04nuYqH2clv
 kCOdxQGa6jUwkU9IsszR4mTx5GttKhYFKUuTc7c83Cp8CBj3jzjYH9XSLGCrUf+4teXMgXRpyp0
 RXZdAEI3vxxVZm3AdGKVg8nl04P7BZf7iHeXeWcRCRe+5pFLZ0geY8rXQEIbPXJNMzKM6ipZsZ2
 a8cTsfj98X/qlLDAHM58ByljaP8IvHB2b82/CdKFCNcnAkl3odwTDiz2awJpVbHGd0r01EXBRZF
 OmhyCX3NH4/NjA/PCFS747vMQssS+qaIgqaY7xfCsNWj6rt6oc26wg+n6M/+GYEh3PJzMDRBBgG
 N1oH1040AQWph6ambYdG1tscrFjp5m/HaHT2iPbNHV+e7nlgBiLwCCey1OcWoo3PrVXFNX3YqVZ
 w==
X-Received: by 2002:a05:6000:601:b0:484:36c8:ffb9 with SMTP id
 ffacd0b85a97d-48586022058mr934474f8f.4.1788443051985; 
 Thu, 03 Sep 2026 06:44:11 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15d9:4700:e712:9f38:603a:54e4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm13597080f8f.5.2026.09.03.06.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 06:44:11 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dakr@kernel.org, ecourtney@nvidia.com,
 matthew.brost@intel.com, nat@pixelcluster.dev,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/11] drm/i915: fix incorrect RCU teardown order
Date: Thu,  3 Sep 2026 15:27:56 +0200
Message-ID: <20260903134408.105317-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903134408.105317-1-christian.koenig@amd.com>
References: <20260903134408.105317-1-christian.koenig@amd.com>
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
Reply-To: christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

i915_gem_busy_ioctl uses dma_resv_for_each_fence_unlocked() to iterate
over the fences in an GEM object without holding a reference but only
the RCU read side lock.

What can happen here is that the GEM object is destroyed concurrently
while i915_gem_busy_ioctl is still running. This won't free the GEM
objects memory, but still drops all the dma_fence references.

Now when dma_resv_for_each_fence_unlocked() sees a destroyed dma_fence it
assumes that a new fence list was installed and re-starts the loop.

But in the case of a destroyed GEM object a new fence list is never
installed, only the old one freed and therefore the iteration never
finishes resulting in an endless loop.

The solution is to drop the fence references only after the RCU grace
period.

The fixes tag is not necessary the patch introducing the problem, but the
one making it so worse that we need to address it.

This problem was pointed out by Sashiko-bot.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 912ff2ebd695 ("drm/i915: use the new iterator in i915_gem_busy_ioctl v2")
CC: stable@vger.kernel.org
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 5172d3982654..9e01f8b2079a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -89,6 +89,7 @@ struct drm_i915_gem_object *i915_gem_object_alloc(void)
 
 void i915_gem_object_free(struct drm_i915_gem_object *obj)
 {
+	dma_resv_fini(&obj->base._resv);
 	return kmem_cache_free(slab_objects, obj);
 }
 
@@ -144,7 +145,6 @@ void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
 {
 	mutex_destroy(&obj->mm.get_page.lock);
 	mutex_destroy(&obj->mm.get_dma_page.lock);
-	dma_resv_fini(&obj->base._resv);
 }
 
 /**
-- 
2.43.0

