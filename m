Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34372D65C5B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 14:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E347710E17D;
	Wed, 17 Dec 2025 14:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DoZnCRXR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1529A10E17D
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765983408; x=1797519408;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IjTVJeO5PM1+Oy/kZCHBtoMXseANh0EZU+wrRZhNvGM=;
 b=DoZnCRXRnZiLCxnxvja42pwddwWgrgZzpf0Vce7UAYyO9roLNuRvoWva
 SRlmuGLuie9RmlzMGF3ua5rBAwe6xrRyhtBMJwRbrUapnRqfQjAjJ6ycT
 T8omQQr5iku7vo9hpOLWeZ/7G2wnRVN/HHqqkR7rmMbDnndVmsX3/gbAw
 7WpkCzjW00tCsu+yk2H5+43s3pvbudrrz2JnWNMUesCJ31Lxt3uN8t3l3
 1obIr8n+O4w6NdlnjbsviQPGJJvUUN4IKVdxt1uXqboA7DPJimIZBY2eW
 3AQc7G+qdpB8rmHMifQNqY//vX4n5xaFkRB/vPyula/gijhGqAlGuaN5F g==;
X-CSE-ConnectionGUID: HbRxC50sRRCYa8tUMFcTpQ==
X-CSE-MsgGUID: fNNJ4eYsQy6K+POv1KfaUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67116277"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="67116277"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 06:56:47 -0800
X-CSE-ConnectionGUID: wXiNvOYbQ765v6FDxCYTKA==
X-CSE-MsgGUID: IAL+TEchRlqOJP5qjJNC6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="203415835"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.182])
 ([10.245.245.182])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 06:56:47 -0800
Message-ID: <c4776b5a-3396-4c0a-89c5-7a8b21e93028@intel.com>
Date: Wed, 17 Dec 2025 14:56:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
To: =?UTF-8?Q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
References: <6f9d860f-f95c-4b3b-9d5c-1a0c295bcdd6@intel.com>
 <20251217132412.435755-1-tapani.palli@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251217132412.435755-1-tapani.palli@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 17/12/2025 13:24, Tapani Pälli wrote:
> Helper function xe_sync_needs_wait expects sync->fence when accessing
> flags, patch makes sure we call only when sync->fence exists.
> 
> v2: move null checking to xe_sync_needs_wait and make
>      xe_sync_entry_wait utilize this helper (Matthew Auld)
> v3: further simplify code (Matthew Auld)
> 
> Fixes NULL pointer dereference seen with Vulkan workloads:
> 
> [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
> 
> Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when swicthing to dma-fence mode")
> Signed-off-by: Tapani Pälli <tapani.palli@intel.com>

To me this looks reasonable, but let's wait for Matt B and get his 
opinion here also, since he was the original author.

Also thanks a lot for reporting, and fixing the issue,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_sync.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index ee1344a880b9..c8fdcdbd6ae7 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -238,10 +238,8 @@ int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
>    */
>   int xe_sync_entry_wait(struct xe_sync_entry *sync)
>   {
> -	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
> -		return 0;
> -
> -	return dma_fence_wait(sync->fence, true);
> +	return xe_sync_needs_wait(sync) ?
> +		dma_fence_wait(sync->fence, true) : 0;
>   }
>   
>   /**
> @@ -252,8 +250,8 @@ int xe_sync_entry_wait(struct xe_sync_entry *sync)
>    */
>   bool xe_sync_needs_wait(struct xe_sync_entry *sync)
>   {
> -	return !(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) &&
> -		!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync->fence->flags);
> +	return sync->fence &&
> +	       !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync->fence->flags);
>   }
>   
>   void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)

