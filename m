Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9FAC61DC6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC83B10F035;
	Thu, 27 Aug 2026 12:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YvwsvSB4";
	dkim-atps=neutral
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888BE10F019
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 12:49:24 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47f92e3c14bso1723513f8f.0
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787834963; x=1788439763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=N8mDe5o2IhEvMzlea+bfmuWRPz0ePMPn3R+ho2zQsEc=;
 b=YvwsvSB4h/L2t5o2tucacfuwFd5v5bACPi70zyLLgyTLNygLcNDxMqO2n81mzBMhI+
 kRHvxUEzKo7RXpJxuH8VdRHPvIHr0vHy/W5RPPsylEfjwhdcH2zP8V6NujiHoWwuEcLY
 8w1ofZDWq3YXhJegEEmFmXirU/MmDwn6h1FT8SVThUvUsYb87/mVnpgYGDtrHDiE5Fji
 C9aXNoQJWoUNg9GQOViPuHUMtFRCy9+a6NXYNF5GV0aw/hp7GURTX5P4xXWgkhSDYqZa
 KGi4IqcdnaPRdM/Kl2eO6gWj1uBlD00N7rQnQVU6tunZGy4dJHk0X1snMA9syIGJm5/t
 L35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787834963; x=1788439763;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=N8mDe5o2IhEvMzlea+bfmuWRPz0ePMPn3R+ho2zQsEc=;
 b=puH8ZnRrjPdt6X5adXI33XJ4MPM9TrOKKyuzHE8Z8H2Fi8RSjQSUH3Pf7xNNulaDmP
 MUxh/k00X0VUqfeXx5lpOqmKpSiVxuzBpbM7KscOSt35bPbHW44ri06/IVOGToE0sKWh
 L2qRvBpVgN93RYR9zlrhS3DHVQ7T0Bo8wc//Rl1vCkua6lWr3VLgf5cyQtYa0vFnDz9W
 RV3YDuxt4dD8d/brnMztj9XZpllLzTIVzCz5Mn1XUUV1Q1+cb7b0jBVj3JUvlAjv0ZsQ
 wJzVTMYHcgk1dqq3391Cuq0DQpKjJ1nh7GtU7vmFPlYawANBcRdYxQGvyzIKydCbnSzA
 nHSQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpPtfnN9tRtx3AMjct8ZmCH29cpWlDxUxpkT8PcNycPg1qMkGy53S2Dg8P6y9cONcMURL1WRgF07Q==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kk1SVVC5XlZokedySb2S+Q+DTPYnGnupL1Ax7HABBEHvRecBPs
 BAjr6jLBoBS+6COaKNnnmNBO+l7auFRQm/8Ln73aHeayuxdBfqus2tmb
X-Gm-Gg: AR+sD13R6ibKhqPukIlLZARgLIzKEKikYRz4aPEP+OU/xEH9rTzpDimqHTAbdgiSfHr
 VeIomI533gBQcwfOPxTrhsJ4pBc8zhTl139tW+CVPnEjE0qdSPTW+RSzwZhgSY/10IQVselD/Yn
 bzDNq4D2/mfj13U6+rgVJD3LMr3Db3zvK4qD2Qd4Slnvz2wcfA+pkMSvLBB9VtaNd1DZtyMvsBj
 4uMn//lZk1c3pOrf2STTy+r5YoMiUvvEfzEn6cw7cpue3iairMaU+hT8FnUx2rC6tDbiEgFoe7V
 ktv/lgLEvn0T2+Kyx7uT+v6p+z9F1pIXNovGRYx3XkiJYjmbbWMaj3c5hLL61uXwlfkFWCJsSTs
 UA0ibanwowHf71HqfZrfDlN0jpGKV/haWr/S2YbFu4RqbXZTOnWgnrkYlY6f84pjrZroGglbZJl
 dF0DN9WOwn58KAnWRDQp2mn3kdj2Ng24olJ9HkL2tf4+06bZIdX9GYzHPutcm65CyjW70QUi7Pd
 KkwlFrjwGCg
X-Received: by 2002:a05:600c:4592:b0:499:b402:6c0 with SMTP id
 5b1f17b1804b1-499dc6eac3bmr170763485e9.3.1787834962697; 
 Thu, 27 Aug 2026 05:49:22 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1524:4300:a4b8:720e:f64f:4778])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b465226d8sm52089985e9.0.2026.08.27.05.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 05:49:22 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dakr@kernel.org, ecourtney@nvidia.com,
 matthew.brost@intel.com, nat@pixelcluster.dev,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/10] drm/ttm/tests: Use dma_resv_alloc in test files
Date: Thu, 27 Aug 2026 14:38:57 +0200
Message-ID: <20260827124910.2245-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827124910.2245-1-christian.koenig@amd.com>
References: <20260827124910.2245-1-christian.koenig@amd.com>
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

Replace the remaining dma_resv_init usage in TTM test files with
dma_resv_alloc(). This completes the migration away from embedded
dma_resv structures to reference-counted dynamic allocation throughout
the DRM subsystem.

Changes in test files:
- ttm_bo_validate_test.c: Convert stack-allocated resv to pointer and
  use dma_resv_alloc() with proper cleanup via dma_resv_put()
- ttm_bo_test.c: Replace kunit_kzalloc + dma_resv_init with direct
  dma_resv_alloc() calls, add cleanup for external_resv

All test assertions updated to check for successful allocation. The
tests now properly exercise the dynamic allocation path that production
code uses.

Signed-off-by: Christian König <christian.koenig@amd.com>
Assisted-by: Claude:Sonnet 4
---
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c          | 11 ++++-------
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c | 13 ++++++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index 3aff1c427cd1..853024724af9 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -339,14 +339,12 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	resv = kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_NULL(test, resv);
-
 	err = ttm_device_kunit_init(priv, ttm_dev, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
-	dma_resv_init(resv);
+	resv = dma_resv_alloc();
+	KUNIT_ASSERT_NOT_NULL(test, resv);
 
 	bo1 = ttm_bo_kunit_init(test, test->priv, BO_SIZE, resv);
 	bo2 = ttm_bo_kunit_init(test, test->priv, BO_SIZE, resv);
@@ -441,11 +439,9 @@ static void ttm_bo_fini_shared_resv(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
-	external_resv = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
+	external_resv = dma_resv_alloc();
 	KUNIT_ASSERT_NOT_NULL(test, external_resv);
 
-	dma_resv_init(external_resv);
-
 	fence = kunit_kzalloc(test, sizeof(*fence), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, fence);
 
@@ -464,6 +460,7 @@ static void ttm_bo_fini_shared_resv(struct kunit *test)
 	drm_gem_object_set_resv(&bo->base, external_resv);
 
 	ttm_bo_fini(bo);
+	dma_resv_put(external_resv);
 }
 
 static void ttm_bo_pin_basic(struct kunit *test)
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 6fc381a9d2da..4559352e7115 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -201,7 +201,7 @@ static void ttm_bo_init_reserved_resv(struct kunit *test)
 	struct ttm_placement *placement;
 	struct ttm_buffer_object *bo;
 	struct ttm_place *place;
-	struct dma_resv resv;
+	struct dma_resv *resv;
 	int err;
 
 	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
@@ -212,19 +212,22 @@ static void ttm_bo_init_reserved_resv(struct kunit *test)
 
 	err = drm_gem_private_object_init(priv->drm, &bo->base, size);
 	KUNIT_ASSERT_EQ(test, err, 0);
-	dma_resv_init(&resv);
-	dma_resv_lock(&resv, NULL);
+
+	resv = dma_resv_alloc();
+	KUNIT_ASSERT_NOT_NULL(test, resv);
+	dma_resv_lock(resv, NULL);
 
 	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement,
-				   PAGE_SIZE, &ctx, NULL, &resv,
+				   PAGE_SIZE, &ctx, NULL, resv,
 				   &dummy_ttm_bo_destroy);
 	dma_resv_unlock(bo->base.resv);
 
 	KUNIT_EXPECT_EQ(test, err, 0);
-	KUNIT_EXPECT_PTR_EQ(test, bo->base.resv, &resv);
+	KUNIT_EXPECT_PTR_EQ(test, bo->base.resv, resv);
 
 	ttm_resource_free(bo, &bo->resource);
 	ttm_bo_fini(bo);
+	dma_resv_put(resv);
 }
 
 static void ttm_bo_validate_basic(struct kunit *test)
-- 
2.43.0

