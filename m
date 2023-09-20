Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B592CE79CF
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 12:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE1B10E181;
	Wed, 20 Sep 2023 12:35:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D336510E181
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 12:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695213357; x=1726749357;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HA15qjYu4ZplJpphSQUm5HpwMRP9rd7cg2lm3rlYcCI=;
 b=ExSc0CvY5HEowxuEe+PXAo+LxF/KcqFDBTWGrgeodxYKmth2UkpPO6NI
 9sx5DnwJ3OXIwsfT4WrLRGQBvM9wTWFwdBgeOZckl2I8Z7fw945h6f9x3
 mZchQTLSEU+X33zru56haTAPWcnLQQPgicrM9xkHPSoMcTnJUjg4a7//Z
 ni3Q83e+eHA/GHJpcpFxyx3NulKK6AONDauDTCfmDfp+xhsoAfyuoWKu6
 kBid3F/N+VHxhHtWnR59xE4MamQorirtfnajhQQovB69/2HmJ5f4QWRup
 2iKXs8YrV/HIsc1qdxdBsRpwpS55akmKXzw4Q6848yTPuOwLoEE4LHkpn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="411154075"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="411154075"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 05:35:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="723257013"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="723257013"
Received: from fathuddx-mobl.gar.corp.intel.com (HELO [10.249.254.147])
 ([10.249.254.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 05:35:55 -0700
Message-ID: <58d9b23c-15c1-4200-b237-f59647f8cbee@linux.intel.com>
Date: Wed, 20 Sep 2023 14:35:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: intel-xe@lists.freedesktop.org
References: <20230920095001.5539-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230920095001.5539-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Disallow pinning dma-bufs in VRAM
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


On 9/20/23 11:50, Thomas Hellström wrote:
> For now only support pinning in TT memory, for two reasons:
> 1) Avoid pinning in a placement not accessible to some importers.
> 2) Pinning in VRAM requires PIN accounting which is a to-do.
>
> v2:
> - Adjust the dma-buf kunit test accordingly.
>
> Suggested-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> ---
>   drivers/gpu/drm/xe/tests/xe_dma_buf.c | 16 ++++++++++++----
>   drivers/gpu/drm/xe/xe_dma_buf.c       | 25 +++++++++++++++++++++----
>   2 files changed, 33 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index 1c3f4bc72b99..ee911df94cc9 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -150,11 +150,19 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>   			/* Is everything where we expect it to be? */
>   			xe_bo_lock(import_bo, false);
>   			err = xe_bo_validate(import_bo, NULL, false);
> -			if (err && err != -EINTR && err != -ERESTARTSYS)
> -				KUNIT_FAIL(test,
> -					   "xe_bo_validate() failed with err=%d\n", err);
>   
> -			check_residency(test, bo, import_bo, dmabuf);
> +			/* Pinning in VRAM is not allowed. */
> +			if (!is_dynamic(params) &&
> +			    params->force_different_devices &&
> +			    !(params->mem_mask & XE_BO_CREATE_SYSTEM_BIT))
> +				KUNIT_EXPECT_EQ(test, err, -EINVAL);
> +			/* Otherwise only expect interrupts or success. */
> +			else if (err && err != -EINTR && err != -ERESTARTSYS)

Ugh. That else if should have been an else. Only. That got somehow lost. 
Will post a fixup commit for that. Not that it changes the behaviour of 
the test but the above looks really odd combined with the below.

/Thomas


> +				KUNIT_EXPECT_TRUE(test, !err || err == -EINTR ||
> +						  err == -ERESTARTSYS);
> +
> +			if (!err)
> +				check_residency(test, bo, import_bo, dmabuf);
>   			xe_bo_unlock(import_bo);
>   		}
>   		drm_gem_object_put(import);
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 09343b8b3e96..bd8d51e7f93f 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -49,13 +49,30 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
>   {
>   	struct drm_gem_object *obj = attach->dmabuf->priv;
>   	struct xe_bo *bo = gem_to_xe_bo(obj);
> +	struct xe_device *xe = xe_bo_device(bo);
> +	int ret;
>   
>   	/*
> -	 * Migrate to TT first to increase the chance of non-p2p clients
> -	 * can attach.
> +	 * For now only support pinning in TT memory, for two reasons:
> +	 * 1) Avoid pinning in a placement not accessible to some importers.
> +	 * 2) Pinning in VRAM requires PIN accounting which is a to-do.
>   	 */
> -	(void)xe_bo_migrate(bo, XE_PL_TT);
> -	xe_bo_pin_external(bo);
> +	if (xe_bo_is_pinned(bo) && bo->ttm.resource->placement != XE_PL_TT) {
> +		drm_dbg(&xe->drm, "Can't migrate pinned bo for dma-buf pin.\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = xe_bo_migrate(bo, XE_PL_TT);
> +	if (ret) {
> +		if (ret != -EINTR && ret != -ERESTARTSYS)
> +			drm_dbg(&xe->drm,
> +				"Failed migrating dma-buf to TT memory: %pe\n",
> +				ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	ret = xe_bo_pin_external(bo);
> +	xe_assert(xe, !ret);
>   
>   	return 0;
>   }
