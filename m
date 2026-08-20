Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16526C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 13:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E8610F025;
	Thu, 20 Aug 2026 13:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CiA7nDoD";
	dkim-atps=neutral
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110ED10E127
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 03:19:09 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7e9ecb1e13cso1968520a34.3
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 20:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787195948; x=1787800748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MQfNhWjHAIsYvqRXEU3FJgTiTF29iPfV7gMZoO8YVqY=;
 b=CiA7nDoDORico2ErcT6uUW3AXirC1ym2ByeS5soXScmbP/BfmdxCJlzPAdrTP2k972
 qrhvfRvX/eiJmBV5BVPLAqXMWu1BAasDf+z4iUMgM3mbt6AWwuJTkncXV5jkXA135tAk
 zdxy3Tv/O+80jrjPoatO3WKipjWHD6vAl7bs/GYNePCuEUa1ink3imUPbvXzdPZwynHH
 0mSxeZEeAksnD2wWHgNBzL3eQeBOBrhKkAcIo7+/NlL7bKWXVC7NnlrD+CJ7N1U9fwuG
 SSX/9B5XDFmD79idbk8XiPMK4phkX+T1nAwIn4pOs65Q+8RIl86n0jkr58N0n0oqvUk/
 V2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787195948; x=1787800748;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MQfNhWjHAIsYvqRXEU3FJgTiTF29iPfV7gMZoO8YVqY=;
 b=e1VGJnxKvAZc3R7S8dOXm/pWiWV1xU+7D3KlVGlzEN08aycpxp7nQqiaCbeKPoRJTn
 Pla/KmrlP1aYOc0+TIgMrYh5JTjsIxM6eHwwFSReb0GoAVg97VyMuTSP1PMVUPa4RIUD
 msFkqAW2XDLsJ+efDLFkqK1Ekxksoy4voGDF1qgVzTRgRpQ1QpCIOfyUgtlcuKjfaEuz
 SIz2Sd+508u1im2+FJcEDAkat7P6HZxHyX6Qh/unO4oUoLd+Xum3bEbgm64TwPtform/
 Kqur8nazRxpMM5aIPqDr3GZeb36v+BYES2GMXG/GwUar3IKgNidmUXzIltZcx4JpqH2f
 exxQ==
X-Gm-Message-State: AOJu0YzZKDmASmEO4GcRubKtMrPPDi5mdi+67TDXDA10/L+GHwfY2Ib7
 luYVdp4qO8mNTG60c3a+j/cN6EEGl14WDYuKNbDWnRF+vhgJa5vYIxBHW1uM7zVIx6E=
X-Gm-Gg: AR+sD10GhYr/I0BmwA+sW4Acv3NDO97Yz7BlPEb6rHvmiH6qG3F0no8PnS5lfqndrUb
 OLc/wZMIesLe4UgdH4jlzva3LVg6heTCMN4uyWqK4VGYh7EXu7cKRNKcPVfhYQl0qOR9CZKBpOp
 Kg63WVltW+MI4Gp4n2cg5uABvZzKZx3MFWkreL4jDcMREKGgpxXfigS1kwS0fP5nU/xuwzRnw5o
 qTxgwaoYAFaBUnMdA3O2xLAsSQWto8KB3UCZNd571seBA0rmyK6SDdcKrNdUsoHv9z0XhhP1Gb/
 vekXq2DxzKkIE9cwEGgoJ4g/t1vyh4zfaQM+n0HwKOc2cwScU0JDocY+E60QQwrHE+YxkVx/mn8
 Dm7hoGAXywYd+01g6KFbU7D9p0T+lVrOqY5xTVP2JdEQ6C7acJhTHfxRGaTR6UZxqVOXWd++4wX
 ++lmrQm0pEjDD6RG2yXU2zqnY0Vt+uC3N31ZaWsevcArRqvUUcSNWvkCW/pB1j2Py3pj9Q+77wS
 M4kr2kkPwYih70vpq0I6JOSmro9FdnsRHGjGjHjaSUgqQgJHSCE6PNtVfZERH/x7/RBbRXNLZEJ
 7tvEvZkclARIQtd25WiDqo7DEg==
X-Received: by 2002:a05:6808:5385:b0:4a4:9e18:607a with SMTP id
 5614622812f47-4b2bcb6daf0mr9471555b6e.21.1787195947888; 
 Wed, 19 Aug 2026 20:19:07 -0700 (PDT)
Received: from craftbox (static-173-249-255-172.cust.tzulo.com.
 [173.249.255.172]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b2d68439f5sm619427b6e.5.2026.08.19.20.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 20:19:07 -0700 (PDT)
From: Nathan Bourgeois <iridescentrosesfall@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Nathan Bourgeois <iridescentrosesfall@gmail.com>
Subject: [PATCH] drm/xe: Fix unnecessary host-side population of ttm_tt on
 non-TT resources
Date: Wed, 19 Aug 2026 23:19:01 -0400
Message-ID: <20260820031901.1018324-1-iridescentrosesfall@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Aug 2026 13:29:11 +0000
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

When a buffer object (BO) has a created but unpopulated ttm_tt and is
exported, the default behavior populates the ttm_tt, even if the manager
does not require a TT. This unnecessary host-side population reduces
host memory available to the user.

This occurs when a BO is created with XE_BO_FLAG_DEFER_BACKING and
migration places the BO into a resource whose manager does not use the
TT backing. The retained ttm_tt is not authoritative for storage, yet
the default ttm_bo_setup_export() treats the existence of the ttm_tt as
requiring population.

The issue was reproduced with vLLM 0.27.1 loading
0xSer0/DeepSeek-V4-Flash-180B (d3c704b) on a system with 128 GB of RAM
and six Intel Arc Pro B70 GPUs providing 192 GB of VRAM. Loading the
weights (100.61 GB) triggered host-memory exhaustion and OOM events on
the baseline kernel.

On Ubuntu 24.04 with 7.0-12-generic, the vLLM service cgroup grew by
115.84 GB on the instrumented baseline and by 15.34 GB with this change,
a reduction of 100.50 GB. Diagnostic instrumentation counting cumulative
TT pages across all six GPUs recorded 109.22 GB on baseline and 8.72 GB
with this change. The reduction is 0.11 GB less than the model weight
size.

The change creates an Xe-local export setup helper which skips
ttm_bo_populate() when the BO has a current resource manager and if that
manager has use_tt == false. If the manager does not use TT, then
population is skipped, while an absent manager conservatively calls
ttm_bo_populate(). Behavior for a manager which requires a TT backing
remains unchanged. Keep this policy local to Xe so other TTM drivers
retain their existing export behavior.

The regression test creates both the control case and the VRAM migration
case. The control case creates the deferred BO in system RAM and leaves
it there, which requires a TT and population when xe_gem_prime_export() is
called. The VRAM migration case creates the deferred BO in system RAM
and then migrates it to VRAM, which does not require a TT and thus, when
xe_gem_prime_export() is called, no population occurs.

Fixes: 91494dee1091 ("xe: populate buffers before exporting them.")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Nathan Bourgeois <iridescentrosesfall@gmail.com>
---
Newer Testing:
- Built and booted b4f95affc66ef76342c1f6bf3849f6c8ade6b9d6 plus this patch on EPYC 7352 with six Intel Arc Pro B70.
- KUnit xe_live_test: xe_dma_buf_kunit: pass:6 fail:0 skip:0 total:6 PASS
- vLLM 0.27.1 loading DeepSeek-V4-Flash-0731 (full model compared to REAP) on six Intel Arc Pro B70 GPUs: No OOM error, 17.82 GB delta.
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 105 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_dma_buf.c       |  28 ++++++-
 2 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 0be8440b3976..bff803ab7a57 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -260,12 +260,117 @@ static const struct dma_buf_test_params test_params[] = {
 	{}
 };
 
+static void xe_test_dmabuf_export_deferred(struct xe_device *xe, u32 bo_flags,
+					   u32 mem_type, bool expect_populated)
+{
+	struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
+	struct kunit *test = kunit_get_current_test();
+	struct ttm_resource_manager *man;
+	struct dma_buf *dmabuf;
+	struct xe_bo *bo;
+	size_t size = PAGE_SIZE;
+	int err;
+
+	/* No VRAM on device? */
+	if (!ttm_manager_type(&xe->ttm, mem_type))
+		return;
+
+	if (mem_type == XE_PL_VRAM0 &&
+	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+		size = SZ_64K;
+
+	/*
+	 * DEFER_BACKING places the BO in SYSTEM and creates a ttm_tt which
+	 * is unpopulated. In the case of VRAM, migrating leaves the ttm_tt
+	 * retained and unpopulated while VRAM becomes the real backing.
+	 */
+	bo = xe_bo_create_user(xe, NULL, size, DRM_XE_GEM_CPU_CACHING_WC,
+			       bo_flags | XE_BO_FLAG_DEFER_BACKING, NULL);
+	if (IS_ERR(bo)) {
+		KUNIT_FAIL(test, "BO creation failed: %pe\n", bo);
+		return;
+	}
+
+	err = xe_bo_lock(bo, false);
+	if (err) {
+		KUNIT_FAIL(test, "BO lock failed: %d\n", err);
+		goto out_put_bo;
+	}
+
+	if (bo->ttm.resource->mem_type != mem_type)
+		err = xe_bo_migrate(bo, mem_type, NULL, exec);
+	if (err) {
+		KUNIT_FAIL(test, "BO migration to %u failed: %d\n", mem_type,
+			   err);
+		goto out_unlock;
+	}
+
+	man = ttm_manager_type(bo->ttm.bdev, bo->ttm.resource->mem_type);
+	if (!man || !bo->ttm.ttm) {
+		KUNIT_FAIL(test, "Expected a retained unpopulated TT\n");
+		goto out_unlock;
+	}
+
+	/* Precondition: ttm_tt starts unpopulated after migration */
+	KUNIT_EXPECT_EQ(test, man->use_tt, expect_populated);
+	KUNIT_EXPECT_FALSE(test, ttm_tt_is_populated(bo->ttm.ttm));
+
+	xe_bo_unlock(bo);
+
+	dmabuf = xe_gem_prime_export(&bo->ttm.base, 0);
+	if (IS_ERR(dmabuf)) {
+		KUNIT_FAIL(test, "dma-buf export failed: %pe\n", dmabuf);
+		goto out_put_bo;
+	}
+
+	err = xe_bo_lock(bo, false);
+	if (err) {
+		KUNIT_FAIL(test, "post-export BO lock failed: %d\n", err);
+		goto out_put_dmabuf;
+	}
+
+	/* Postcondition: if VRAM, ttm_tt remains unpopulated, if SYSTEM ttm_tt is populated */
+	KUNIT_EXPECT_EQ(test, bo->ttm.resource->mem_type, mem_type);
+	KUNIT_EXPECT_NOT_NULL(test, bo->ttm.ttm);
+	if (bo->ttm.ttm)
+		KUNIT_EXPECT_EQ(test, ttm_tt_is_populated(bo->ttm.ttm),
+				expect_populated);
+
+	xe_bo_unlock(bo);
+	dma_buf_put(dmabuf);
+	drm_gem_object_put(&bo->ttm.base);
+	return;
+
+out_unlock:
+	xe_bo_unlock(bo);
+	goto out_put_bo;
+out_put_dmabuf:
+	dma_buf_put(dmabuf);
+out_put_bo:
+	drm_gem_object_put(&bo->ttm.base);
+}
+
 static int dma_buf_run_device(struct xe_device *xe)
 {
 	const struct dma_buf_test_params *params;
 	struct kunit *test = kunit_get_current_test();
 
 	guard(xe_pm_runtime)(xe);
+
+	/*
+	 * A retained TT must not be populated when VRAM is the backing
+	 * resource.
+	 */
+	xe_test_dmabuf_export_deferred(xe, XE_BO_FLAG_VRAM0, XE_PL_VRAM0,
+				       false);
+
+	/*
+	 * Control case: deferred SYSTEM backing must still be populated
+	 * before export.
+	 */
+	xe_test_dmabuf_export_deferred(xe, XE_BO_FLAG_SYSTEM, XE_PL_SYSTEM,
+				       true);
+
 	for (params = test_params; params->mem_mask; ++params) {
 		struct dma_buf_test_params p = *params;
 
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index bf0728838ead..0c4e4e2e1a81 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -219,6 +219,32 @@ static const struct dma_buf_ops xe_dmabuf_ops = {
 	.vunmap = drm_gem_dmabuf_vunmap,
 };
 
+static int xe_dma_bo_setup_export(struct ttm_buffer_object *tbo,
+				  struct ttm_operation_ctx *ctx)
+{
+	struct ttm_resource_manager *man = NULL;
+	int ret;
+
+	ret = ttm_bo_reserve(tbo, false, false, NULL);
+	if (ret)
+		return ret;
+
+	if (tbo->resource)
+		man = ttm_manager_type(tbo->bdev, tbo->resource->mem_type);
+
+	/*
+	 * Do not populate BO-sized system pages when backed by a non-TT resource.
+	 * This is Xe-specific; the generic ttm_bo_setup_export() always populates.
+	 */
+	if (man && !man->use_tt)
+		ret = 0;
+	else
+		ret = ttm_bo_populate(tbo, ctx);
+
+	ttm_bo_unreserve(tbo);
+	return ret;
+}
+
 struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
 {
 	struct xe_bo *bo = gem_to_xe_bo(obj);
@@ -257,7 +283,7 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
 	xe_bo_willneed_get_locked(bo);
 	xe_bo_unlock(bo);
 
-	ret = ttm_bo_setup_export(&bo->ttm, &ctx);
+	ret = xe_dma_bo_setup_export(&bo->ttm, &ctx);
 	if (ret)
 		goto out_put;
 

base-commit: b4f95affc66ef76342c1f6bf3849f6c8ade6b9d6
-- 
2.55.0

