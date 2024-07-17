Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6EEC3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 14:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0AF10E034;
	Wed, 17 Jul 2024 14:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3Itnb18";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AE710E128
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 14:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721227239; x=1752763239;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=3MLCT5CvMDQo+7ln0iO/08sHaT+fkNBfTPpe0apJmvg=;
 b=B3Itnb18k+i+VyH8+zExLeZIYYMN3P90IE58Bu5K50B6BUJbVLOFgfSZ
 2w8fKAgFkfWBnRZi2hMk4n5GyqnorTvfcP1pBjvU8u+WdEAj38pz0WJfd
 Pjxd9T2tidDG6j2BHfyRZAZ4O0VIEJtYeEa/IHgWDJUY6XTR9NdmKCVkG
 XQHXyKxK9cgVxtWM4i+itQgnaYhyEfzWhR5XZ24iwVkGeGAEB2ieUgrah
 i080wfDf4N6wHI3GYBUO8yGd2ppD2q6fGpMs3tGTYroUyHFlLf9knEFQK
 l0UKj4sX5vzOFaKeZz3FT8RCI0rk81yyBo4mPFUC0crl/kRSE2C5H2M1r A==;
X-CSE-ConnectionGUID: icb7UT5qQn2PIody1N5sfw==
X-CSE-MsgGUID: 7MU70lzFTpCmg4BEwX1gkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18600168"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18600168"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:40:38 -0700
X-CSE-ConnectionGUID: 7/pziEAnSG22c/iXmZPqXg==
X-CSE-MsgGUID: k91YbMH8Th6mLRf/1Pst3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="54599054"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.38.191])
 ([10.246.38.191])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:40:38 -0700
Message-ID: <45d28440-d355-4a9d-aa67-189e3ccede46@linux.intel.com>
Date: Wed, 17 Jul 2024 16:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Validate user fence during creation
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240717140429.1396820-1-matthew.brost@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240717140429.1396820-1-matthew.brost@intel.com>
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


On 7/17/2024 4:04 PM, Matthew Brost wrote:
> Fail invalidate addresses during user fence creation.
>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 2883d9aca404..f2e5e3c8c0cd 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -53,14 +53,18 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>   					       u64 value)
>   {
>   	struct xe_user_fence *ufence;
> +	u64 __user *ptr = u64_to_user_ptr(addr);
> +
> +	if (!access_ok(ptr, sizeof(ptr)))
> +		return ERR_PTR(-EFAULT);
>   
>   	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
>   	if (!ufence)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>   
>   	ufence->xe = xe;
>   	kref_init(&ufence->refcount);
> -	ufence->addr = u64_to_user_ptr(addr);
> +	ufence->addr = ptr;
>   	ufence->value = value;
>   	ufence->mm = current->mm;
>   	mmgrab(ufence->mm);
> @@ -183,8 +187,8 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   		} else {
>   			sync->ufence = user_fence_create(xe, sync_in.addr,
>   							 sync_in.timeline_value);
> -			if (XE_IOCTL_DBG(xe, !sync->ufence))
> -				return -ENOMEM;
> +			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
> +				return PTR_ERR(sync->ufence);
>   		}
>   
>   		break;
