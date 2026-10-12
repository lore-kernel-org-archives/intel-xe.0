Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7089ECA9EDE
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 19:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBC110E4F6;
	Mon, 12 Oct 2026 19:24:10 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F7D10E5B8
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 19:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1791833041;
 bh=i6YL50I34PHBt6JAT10Cen5OL/L/H4grARWgHhagCVs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=TCwBKuX5H4IgoKJO0mPmDONCaURL9CvYLVlvhwUTzFdorH5YAjrO1T9RbjJeOInb3
 63bybW0wonQaYDX1t4rjSd/OvaW8t93/KjUYAG4CcobFfApgqvoOFkaxZEA+jL0zMz
 6Yhdly1s1VfF/XhRsQrh+polhhyv/g1DQPjmIjPxSFROpFHEpRHuiQx6vapryEsd3f
 nCsOzKsaPAHygRxWxfGr1ms4syZyWPC/yMegQUglND3YG4P41zX6l8n5QFNd6E0uHB
 C7rI3xUcv24fz9c0212B/OPKCxxCSc/wWdGWT11OXJIVjpgGxlzJxpcIpAVAriQs+M
 Y1CA7ChhM5Aqg==
Message-ID: <9f60d69c-b15e-4088-93e4-879a37a3f5f9@lankhorst.se>
Date: Mon, 12 Oct 2026 21:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/tests: add regression for eviction of a BO
 with no resource
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20261012191041.1492725-4-niranjana.vishwanathapura@intel.com>
 <20261012191041.1492725-6-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20261012191041.1492725-6-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>

On 10/12/26 21:10, Niranjana Vishwanathapura wrote:
> Exercise the xe_evict_flags() NULL-resource path: import a dma-buf, gut
> the importer to an empty placement so it drops its resource, then drive
> the real xe_dma_buf_move_notify() -> xe_bo_evict() path and verify it no
> longer faults.
> 
> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 89 +++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index 0be8440b3976..792376e965f1 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -195,6 +195,79 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>  	drm_gem_object_put(&bo->ttm.base);
>  }
>  
> +/*
> + * Reproduce the move_notify crash path: an imported BO whose ttm.resource is
> + * NULL (as happens mid-teardown) must survive xe_dma_buf_move_notify(), which
> + * evicts it via xe_bo_evict() -> xe_evict_flags(), instead of dereferencing
> + * the NULL resource.
> + */
> +static void xe_test_dmabuf_move_notify_no_resource(struct xe_device *xe)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	struct dma_buf_test_params *params = to_dma_buf_test_params(test->priv);
> +	struct drm_gem_object *import;
> +	struct dma_buf *dmabuf;
> +	struct xe_bo *bo;
> +
> +	/* Needs a separate, dynamically attached importer bo with move_notify. */
> +	if (!params->force_different_devices || !is_dynamic(params))
> +		return;
> +
> +	kunit_info(test, "running %s\n", __func__);
> +	bo = xe_bo_create_user(xe, NULL, PAGE_SIZE, DRM_XE_GEM_CPU_CACHING_WC,
> +			       params->mem_mask, NULL);
> +	if (IS_ERR(bo)) {
> +		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
> +			   PTR_ERR(bo));
> +		return;
> +	}
> +
> +	dmabuf = xe_gem_prime_export(&bo->ttm.base, 0);
> +	if (IS_ERR(dmabuf)) {
> +		KUNIT_FAIL(test, "xe_gem_prime_export() failed with err=%ld\n",
> +			   PTR_ERR(dmabuf));
> +		goto out;
> +	}
> +	bo->ttm.base.dma_buf = dmabuf;
> +
> +	import = xe_gem_prime_import(&xe->drm, dmabuf);
> +	if (IS_ERR(import)) {
> +		KUNIT_FAIL(test, "xe_gem_prime_import failed with err=%ld\n",
> +			   PTR_ERR(import));
> +	} else {
> +		struct xe_bo *import_bo = gem_to_xe_bo(import);
> +		struct ttm_operation_ctx ctx = {
> +			.interruptible = false,
> +			.gfp_retry_mayfail = true,
> +		};
> +		struct ttm_placement empty = {};
> +		int ret;
> +
> +		xe_bo_lock(import_bo, false);
> +
> +		/*
> +		 * Gut the importer to drop its resource the same way ttm does
> +		 * on teardown (validate to an empty placement), leaving a live,
> +		 * still-attached BO with no resource.
> +		 */
> +		ret = ttm_bo_validate(&import_bo->ttm, &empty, &ctx);
> +		KUNIT_EXPECT_EQ(test, ret, 0);
> +		KUNIT_EXPECT_TRUE(test, !import_bo->ttm.resource);
> +
> +		/* Crash path: move_notify -> xe_bo_evict -> xe_evict_flags. */
> +		xe_dma_buf_move_notify(import->import_attach);
> +		KUNIT_EXPECT_TRUE(test, !import_bo->ttm.resource);
> +
> +		xe_bo_unlock(import_bo);
> +		drm_gem_object_put(import);
> +	}
> +
> +	bo->ttm.base.dma_buf = NULL;
> +	dma_buf_put(dmabuf);
> +out:
> +	drm_gem_object_put(&bo->ttm.base);
> +}
> +
>  static const struct dma_buf_attach_ops nop2p_attach_ops = {
>  	.allow_peer2peer = false,
>  	.invalidate_mappings = xe_dma_buf_move_notify
> @@ -274,6 +347,22 @@ static int dma_buf_run_device(struct xe_device *xe)
>  		xe_test_dmabuf_import_same_driver(xe);
>  	}
>  
> +	/*
> +	 * Regression for the move_notify NULL-resource crash. Independent of
> +	 * residency, so run once with a dynamic, different-device attachment.
> +	 */
> +	{
> +		struct dma_buf_test_params p = {
> +			.mem_mask = XE_BO_FLAG_SYSTEM,
> +			.attach_ops = &xe_dma_buf_attach_ops,
> +			.force_different_devices = true,
> +		};
> +
> +		p.base.id = XE_TEST_LIVE_DMA_BUF;
> +		test->priv = &p;
> +		xe_test_dmabuf_move_notify_no_resource(xe);
> +	}
> +
>  	/* A non-zero return would halt iteration over driver devices */
>  	return 0;
>  }

