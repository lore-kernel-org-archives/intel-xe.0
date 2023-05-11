Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04361C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 10:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C9C10E21E;
	Thu, 11 May 2023 10:04:03 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413BC10E21E
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 10:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683799441; x=1715335441;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6S1Tf1wY41YYZg0k2n9O+c3pZoZYKPrMoc1ElsKAKBE=;
 b=B0GQrcRw1ao7w+wdRFHgmvUG8qILbUO4NsvfmIG0a+K71/vp6ElMn0CT
 eubaY5jf61D6Y8MjT8W5O1Up0JuEDdvoSrvHeLtBYxtnzIgu8upbtW/Xw
 4q8EbZDYRmOs/kOOZnssfxbRqfRxfA9vCEVep7vtr9SJabBAiY1sZygSn
 6UE7XNks56sfbYEdzqK9kF+idIadEHbevZ3Tq6f9ypkHjuDq6dWYzEXEz
 aqAgJBrszWNVfibkoibJDUFrrreikJ48F5s7VBZwpStdpxMi+IHVBWvhO
 W3hSJCwf7G3p3Olt8qG1VksPUn5SDHtO2KtG+ETqhRHWTlPSB9ksTgTbc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="330078541"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="330078541"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 03:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="650099432"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="650099432"
Received: from cuphoff-mobl.ger.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 03:03:59 -0700
Message-ID: <76b803aa-46aa-37ac-ee43-837744257984@linux.intel.com>
Date: Thu, 11 May 2023 12:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-29-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-29-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 28/31] drm/xe: Allow dma-fences as
 in-syncs for compute / faulting VM
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


On 5/2/23 02:17, Matthew Brost wrote:
> This is allowed per the dma-fencing rules.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



> ---
>   drivers/gpu/drm/xe/xe_sync.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 99f1ed87196d..1e4e4acb2c4a 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -105,6 +105,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   {
>   	struct drm_xe_sync sync_in;
>   	int err;
> +	bool signal;
>   
>   	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
>   		return -EFAULT;
> @@ -113,9 +114,10 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)))
>   		return -EINVAL;
>   
> +	signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
>   	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
>   	case DRM_XE_SYNC_SYNCOBJ:
> -		if (XE_IOCTL_ERR(xe, no_dma_fences))
> +		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
>   			return -ENOTSUPP;
>   
>   		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
> @@ -125,7 +127,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   		if (XE_IOCTL_ERR(xe, !sync->syncobj))
>   			return -ENOENT;
>   
> -		if (!(sync_in.flags & DRM_XE_SYNC_SIGNAL)) {
> +		if (!signal) {
>   			sync->fence = drm_syncobj_fence_get(sync->syncobj);
>   			if (XE_IOCTL_ERR(xe, !sync->fence))
>   				return -EINVAL;
> @@ -133,7 +135,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   		break;
>   
>   	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
> -		if (XE_IOCTL_ERR(xe, no_dma_fences))
> +		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
>   			return -ENOTSUPP;
>   
>   		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
> @@ -146,7 +148,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   		if (XE_IOCTL_ERR(xe, !sync->syncobj))
>   			return -ENOENT;
>   
> -		if (sync_in.flags & DRM_XE_SYNC_SIGNAL) {
> +		if (signal) {
>   			sync->chain_fence = dma_fence_chain_alloc();
>   			if (!sync->chain_fence)
>   				return -ENOMEM;
> @@ -168,7 +170,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   		break;
>   
>   	case DRM_XE_SYNC_USER_FENCE:
> -		if (XE_IOCTL_ERR(xe, !(sync_in.flags & DRM_XE_SYNC_SIGNAL)))
> +		if (XE_IOCTL_ERR(xe, !signal))
>   			return -ENOTSUPP;
>   
>   		if (XE_IOCTL_ERR(xe, sync_in.addr & 0x7))
