Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF7FC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 16:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D079310E334;
	Mon, 30 Oct 2023 16:13:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172A210E334
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 16:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698682436; x=1730218436;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=g1O4WwU1UGbpc3r+KeO3xFgPg8OyTCTw1x8epKEgAgk=;
 b=FQJj7at4FCKL6gUTz4lgfr2naoDQTjBgIFmyV0YzzYvVwNmzkQWQjBi0
 6Dvv5+SYPkvI9Rds0RtaqLaYuw4Xl/hvArb7hRveSQNMRuW0SGzkGxi+o
 eS5udIClCCoqI5SDiPLqXlKg6AQMN3elgTbC6djp6k/e52klgoo9dulfH
 DxQ1tFmhdrc5r/CXveCTGPsz7bGcnvS98DaSTdMtcbmiqrKxMqvre0F4N
 kbvvFvMCp6R7vWWaRSjSax+W0oCoslC93DMCDZsZKhroeJc2YboKuGugB
 JN2kG6uO3xzdBilh9P5AbhHbX2JOQhfo+8vj90JkzQDhKAI/Uh8MVBM1d A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="368314089"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="368314089"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 09:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1007466648"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="1007466648"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.249.254.157])
 ([10.249.254.157])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 09:13:54 -0700
Message-ID: <f4b5d56c-a066-27ea-02eb-cea264d18826@linux.intel.com>
Date: Mon, 30 Oct 2023 17:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20231030161016.54300-5-matthew.auld@intel.com>
 <20231030161016.54300-8-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231030161016.54300-8-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe/bo: sync kernel fences for KMD
 buffers
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


On 10/30/23 17:10, Matthew Auld wrote:
> With things like pipelined evictions, VRAM pages can be marked as free
> and yet still have some active kernel fences, with the idea that the
> next caller to allocate the memory will respect them. However it looks
> like we are missing synchronisation for KMD internal buffers, like
> page-tables, lrc etc. For userspace objects we should already have the
> required synchronisation for CPU access via the fault handler, and
> likewise for GPU access when vm_binding them.
>
> To fix this synchronise against any kernel fences for all KMD objects at
> creation. This should resolve some severe corruption seen during
> evictions.
>
> v2 (Matt B):
>    - Revamp the comment explaining this. Also mention why USAGE_KERNEL is
>      correct here.
> v3 (Thomas):
>    - Make sure to use ctx.interruptible for the wait.
>
> Closes: ?
> Testcase: igt@xe-evict-ccs
> Reported-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

R-B holds for v3.

Thanks,

Thomas


> ---
>   drivers/gpu/drm/xe/xe_bo.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 61789c0e88fb..cd043b1308ec 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1266,6 +1266,37 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   	if (err)
>   		return ERR_PTR(err);
>   
> +	/*
> +	 * The VRAM pages underneath are potentially still being accessed by the
> +	 * GPU, as per async GPU clearing and async evictions. However TTM makes
> +	 * sure to add any corresponding move/clear fences into the objects
> +	 * dma-resv using the DMA_RESV_USAGE_KERNEL slot.
> +	 *
> +	 * For KMD internal buffers we don't care about GPU clearing, however we
> +	 * still need to handle async evictions, where the VRAM is still being
> +	 * accessed by the GPU. Most internal callers are not expecting this,
> +	 * since they are missing the required synchronisation before accessing
> +	 * the memory. To keep things simple just sync wait any kernel fences
> +	 * here, if the buffer is designated KMD internal.
> +	 *
> +	 * For normal userspace objects we should already have the required
> +	 * pipelining or sync waiting elsewhere, since we already have to deal
> +	 * with things like async GPU clearing.
> +	 */
> +	if (type == ttm_bo_type_kernel) {
> +		long timeout = dma_resv_wait_timeout(bo->ttm.base.resv,
> +						     DMA_RESV_USAGE_KERNEL,
> +						     ctx.interruptible,
> +						     MAX_SCHEDULE_TIMEOUT);
> +
> +		if (timeout < 0) {
> +			if (!resv)
> +				dma_resv_unlock(bo->ttm.base.resv);
> +			xe_bo_put(bo);
> +			return ERR_PTR(timeout);
> +		}
> +	}
> +
>   	bo->created = true;
>   	if (bulk)
>   		ttm_bo_set_bulk_move(&bo->ttm, bulk);
