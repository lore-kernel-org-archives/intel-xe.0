Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698BBD65C43
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 12:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F1E10E087;
	Wed, 17 Dec 2025 12:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQ6J8Hff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2CE10E087
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 12:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765976277; x=1797512277;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=edGf3gpQFeuvMvCpqdY/Xm6EAiqhq6jDx/S818uVFAE=;
 b=OQ6J8Hffn/+a4c90QK3M90CTHzYg9Ob2eew8WRfoo06bWXcysTOUAmMb
 z7W9/yp2Wq2DoqNGajEJ9oOHenjI42oSAmN8He85S5PUMIiO86KsPrDM2
 D+4R6IRfrewb0Yndx/2yvwx0JKA/NLfvfMRu2+8D1nlCB6T/SF29z/82l
 QdDUEQNsL/VwtdopAW+kw1EX5OXU/TD5KulXEcRd7WKVZJDRhU8gb1q7S
 qhuYz7ErrDhPFtPtMZqrGjgjOUMrLr+qHCWXBoL6UhiOoP0wvcOVybJfQ
 1dNyodo+ejqKtRlCrl5vdgqZQVTXNBf3JIHDgdRR11NlfM6f+r00O6CIs Q==;
X-CSE-ConnectionGUID: 2vN/3wyHQ2ClPmZxaWVPZw==
X-CSE-MsgGUID: d1yl9bkQQLSO4Mi+ZSmhlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="90571080"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="90571080"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 04:57:56 -0800
X-CSE-ConnectionGUID: Hh+rOCigQq6SzvE6OmGxLw==
X-CSE-MsgGUID: H15dc30OQzWJUiZvBazp4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="197401204"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.182])
 ([10.245.245.182])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 04:57:56 -0800
Message-ID: <dc533a8b-ad80-446f-a3f7-1fdde195a0e2@intel.com>
Date: Wed, 17 Dec 2025 12:57:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
To: =?UTF-8?Q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
References: <f1ae6465-3276-48a5-8dc4-e3caf2b9e2b8@intel.com>
 <20251217123209.430427-1-tapani.palli@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251217123209.430427-1-tapani.palli@intel.com>
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

On 17/12/2025 12:32, Tapani Pälli wrote:
> Helper function xe_sync_needs_wait expects sync->fence when accessing
> flags, patch makes sure we call only when sync->fence exists.
> 
> v2: move null checking to xe_sync_needs_wait and make
>      xe_sync_entry_wait utilize this helper (Matthew Auld)
> 
> Fixes NULL pointer dereference seen with Vulkan workloads:
> 
> [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
> 
> Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when swicthing to dma-fence mode")
> Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sync.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index ee1344a880b9..2b6c2e2527ae 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -241,7 +241,8 @@ int xe_sync_entry_wait(struct xe_sync_entry *sync)
>   	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
>   		return 0;

^^ I think we can drop this bit, since below will now check it?

>   
> -	return dma_fence_wait(sync->fence, true);
> +	return xe_sync_needs_wait(sync) ?
> +		dma_fence_wait(sync->fence, true) : 0;
>   }
>   
>   /**
> @@ -252,7 +253,7 @@ int xe_sync_entry_wait(struct xe_sync_entry *sync)
>    */
>   bool xe_sync_needs_wait(struct xe_sync_entry *sync)
>   {
> -	return !(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) &&
> +	return !(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) && sync->fence &&
>   		!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync->fence->flags);

Here I think we can maybe simplify:

sync->fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync->fence->flags)

Since sync->fence != NULL must imply an in-fence which will always be 
!signal for the flags anyway?

>   }
>   

