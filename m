Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4455DC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 06:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051F310E3AA;
	Wed, 17 May 2023 06:01:14 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C850B10E3AA
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 06:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684303272; x=1715839272;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PTq+0Oq7wzMoqJci3yawFIXobJ+kOgbDm0gtkz0OJR0=;
 b=WpRbGOux4kq6BRI54qRAurJRVDdwXT9NxUSexlZOocQtefqNro8O54dL
 vnvRJSN5TiazlL8UzLXNAF0/6nua/754Ii6OivPm6T9vkswLfOhKm2qRI
 0LPqrJw9SaCMynAQCokRlFHTe153041NV5lGqok6liUIGcC9gQqu5+nFq
 vsW3WjQD+DeWyIENtcK1h91EZbviSYuGhSX8MtOLKFn3Wwg5Q1YtV9A2D
 7GDm1cKXoHKDv7JAwZ1g9llQ9TsaY1W+s+YIPVuH6rdX57e+djFp8MVfi
 CW7ggg6TUMaezxoqXBqhdK8GLQsogSAQx4NafZZpz/mutSQJbmHX85+tE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="341056232"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="341056232"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 23:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="732264712"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="732264712"
Received: from skofoed-mobl.ger.corp.intel.com (HELO [10.249.254.12])
 ([10.249.254.12])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 23:01:10 -0700
Message-ID: <f87a9e48-adf3-489b-23e2-abe45b18b569@linux.intel.com>
Date: Wed, 17 May 2023 08:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230516184420.11806-1-niranjana.vishwanathapura@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230516184420.11806-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply upper limit to sg element size
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Niranjana

On 5/16/23 20:44, Niranjana Vishwanathapura wrote:
> Specify maximum segment size for sg elements by using
> sg_alloc_table_from_pages_segment() to allocate sg_table.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c |  8 +++++---
>   drivers/gpu/drm/xe/xe_bo.h | 21 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.c |  8 +++++---
>   3 files changed, 31 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c82e995df779..21c5aca424dd 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -251,9 +251,11 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>   	if (xe_tt->sg)
>   		return 0;
>   
> -	ret = sg_alloc_table_from_pages(&xe_tt->sgt, tt->pages, num_pages,
> -					0, (u64)num_pages << PAGE_SHIFT,
> -					GFP_KERNEL);
> +	ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
> +						num_pages, 0,
> +						(u64)num_pages << PAGE_SHIFT,
> +						xe_sg_segment_size(xe_tt->dev),
> +						GFP_KERNEL);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 7e111332c35a..a1c51cc0ac3c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -296,6 +296,27 @@ void xe_bo_put_commit(struct llist_head *deferred);
>   
>   struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
>   
> +/*
> + * xe_sg_segment_size() - Provides upper limit for sg segment size.
> + * @dev: device pointer
> + *
> + * Returns the maximum segment size for the 'struct scatterlist'
> + * elements.
> + */
> +static inline unsigned int xe_sg_segment_size(struct device *dev)
> +{
> +	size_t max = min_t(size_t, UINT_MAX, dma_max_mapping_size(dev));
> +
> +	/*
> +	 * The iommu_dma_map_sg() function ensures iova allocation doesn't
> +	 * cross dma segment boundary. It does so by padding some sg elements.
> +	 * This can cause overflow, ending up with sg->length being set to 0.
> +	 * Avoid this by ensuring maximum segment size is half of 'max'
> +	 * rounded down to PAGE_SIZE.
> +	 */

Is this a bug in the IOMMU code? In any case, shouldn't the fix on our 
side be using

dma_set_seg_boundary() and
dma_set_max_seg_size()

to set reasonable values that avoid that problem?

/Thomas

> +	return round_down(max / 2, PAGE_SIZE);
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   /**
>    * xe_bo_is_mem_type - Whether the bo currently resides in the given
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2aa5bf9cfee1..5c2fdfc0e836 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -117,9 +117,11 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>   	if (ret)
>   		goto out;
>   
> -	ret = sg_alloc_table_from_pages(&vma->userptr.sgt, pages, pinned,
> -					0, (u64)pinned << PAGE_SHIFT,
> -					GFP_KERNEL);
> +	ret = sg_alloc_table_from_pages_segment(&vma->userptr.sgt, pages,
> +						pinned, 0,
> +						(u64)pinned << PAGE_SHIFT,
> +						xe_sg_segment_size(xe->drm.dev),
> +						GFP_KERNEL);
>   	if (ret) {
>   		vma->userptr.sg = NULL;
>   		goto out;
