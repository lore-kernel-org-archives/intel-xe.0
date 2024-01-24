Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1DCC46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 07:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B1410F300;
	Wed, 24 Jan 2024 07:40:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6696810E969
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 07:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706082037; x=1737618037;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xH7QwDAQrBQjMlX3cLjcUuQwRf3QLjLQdTi34IjdQ3U=;
 b=mZdUhi3czyfoqRvK3GFfVx+lHWAN6oNtoSSDPRr+dAYvtBtd/n1fNOZD
 6T6t8OxkZtVMXkWg9Wm6YPR7PY/+IPx1bRymeIEnxDDWRAkh2etdD2D9P
 /4KQxMjc9S5PokF3qIxw9oi3rLKWGeJbTLROHLegE2iLc/VU3WZiTYalO
 AM6fpNu3kXk1VPltmVYEsKipL5wghCpxbeHihUpUdx2IUuB+aikOxLios
 2lWiCxoXfyHUKqMlE30YqOrf4FQ4dukGLGzwKeunVo7FwtwNm7k90gw4Z
 2SjyodAmJKMbi58oVozh6Ll3rvea+WczprAWkjvaC0LTT23eoIgwkB5WB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401426287"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401426287"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 23:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1890782"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 23:40:32 -0800
Message-ID: <add1825c-8894-487e-8ccf-1aea0e5e99fa@linux.intel.com>
Date: Wed, 24 Jan 2024 08:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Only allow 1 ufence per exec / bind IOCTL
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240123163422.1570227-1-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240123163422.1570227-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Mika Kahola <mika.kahola@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Matthew

On 1/23/24 17:34, Matthew Brost wrote:
> The way exec ufences are coded only 1 ufence per IOCTL will be signaled.
> It is possible to fix this but for current use cases 1 ufence per IOCTL
> is sufficient. Enforce a limit of 1 ufence per IOCTL (both exec and bind
> to be uniform).
>
> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

A Fixes: tag needed, to have it cherry-picked for 6.8.

> ---
>   drivers/gpu/drm/xe/xe_exec.c | 10 +++++++++-
>   drivers/gpu/drm/xe/xe_sync.h |  5 +++++
>   drivers/gpu/drm/xe/xe_vm.c   | 10 +++++++++-
>   3 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 59fd9bb40c18..952496c6260d 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -150,7 +150,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
>   	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
>   	struct drm_exec *exec = &vm_exec.exec;
> -	u32 i, num_syncs = 0;
> +	u32 i, num_syncs = 0, num_ufence = 0;
>   	struct xe_sched_job *job;
>   	struct dma_fence *rebind_fence;
>   	struct xe_vm *vm;
> @@ -196,6 +196,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   					   SYNC_PARSE_FLAG_LR_MODE : 0));
>   		if (err)
>   			goto err_syncs;
> +
> +		if (xe_sync_is_ufence(&syncs[i]))
> +			num_ufence++;
> +	}
> +
> +	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
> +		err = -EINVAL;
> +		goto err_syncs;
>   	}
>   
>   	if (xe_exec_queue_is_parallel(q)) {
> diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> index d284afbe917c..f43cdcaca6c5 100644
> --- a/drivers/gpu/drm/xe/xe_sync.h
> +++ b/drivers/gpu/drm/xe/xe_sync.h
> @@ -33,4 +33,9 @@ struct dma_fence *
>   xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
>   		     struct xe_exec_queue *q, struct xe_vm *vm);
>   
> +static inline bool xe_sync_is_ufence(struct xe_sync_entry *sync)

Kerneldoc.


> +{
> +	return !!sync->ufence;
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d096a8c00bd4..8576535c4b6a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2851,7 +2851,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	struct drm_gpuva_ops **ops = NULL;
>   	struct xe_vm *vm;
>   	struct xe_exec_queue *q = NULL;
> -	u32 num_syncs;
> +	u32 num_syncs, num_ufence = 0;
>   	struct xe_sync_entry *syncs = NULL;
>   	struct drm_xe_vm_bind_op *bind_ops;
>   	LIST_HEAD(ops_list);
> @@ -2988,6 +2988,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   					   SYNC_PARSE_FLAG_DISALLOW_USER_FENCE : 0));
>   		if (err)
>   			goto free_syncs;
> +
> +		if (xe_sync_is_ufence(&syncs[num_syncs]))
> +			num_ufence++;
> +	}
> +
> +	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
> +		err = -EINVAL;
> +		goto free_syncs;
>   	}
>   
>   	if (!args->num_binds) {

Otherwise LGTM.

/Thomas


