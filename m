Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7907BC4829B
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 12:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432A110F97A;
	Mon,  5 Feb 2024 12:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6KFalYx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3371510F97A
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 12:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707136987; x=1738672987;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=0iDVXWdLbSC4K6MmrzXrvUbAThXrpezkmYZYwoW2wJY=;
 b=J6KFalYx8gGI52p3QLWWxXE7L5oD0yqBP5gLwNZT2wQxAZmHsjca+xKz
 wKURGD0MYKXDish11kCW/lFy5yerLlIB3881PcVlBHQKZyXzLGqVXCdIY
 vc57H4K/RXDTKO+X68qcl7ha8HxtAGP7gxTrXuFYdxjrrgl6KJ8g8xK4u
 wK34Ab2kI6RI9fEvybtiH86EFYM6gfnJAZd081xdf5L7D9ELfISv2tJud
 cheQHH4y/6+arh/GmDKqm7qgEQ7DtZuHFoQuqTPkTFJs6/ACDgTMkXT2z
 0ERie1HmAIJaTWduvFUCeuTJq1MZsrV80+GSVRvtAbCnI235Ynk8n+I9+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="408335"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="408335"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 04:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5324226"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 04:43:06 -0800
Message-ID: <eda9bf63-118f-4684-a385-72153c71aab0@intel.com>
Date: Mon, 5 Feb 2024 12:43:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 24/34] drm/xe: Remove useless mem_access protection for
 query ioctls
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-25-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-25-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> Every IOCTL is already protected on its outer bounds by
> xe_pm_runtime_{get,put} calls, so we can now remove
> these.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Should this be squashed?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_query.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 9b35673b286c..86222c80a874 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -147,7 +147,6 @@ query_engine_cycles(struct xe_device *xe,
>   	if (!hwe)
>   		return -EINVAL;
>   
> -	xe_device_mem_access_get(xe);
>   	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   
>   	__read_timestamps(gt,
> @@ -159,7 +158,6 @@ query_engine_cycles(struct xe_device *xe,
>   			  cpu_clock);
>   
>   	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	xe_device_mem_access_put(xe);
>   	resp.width = 36;
>   
>   	/* Only write to the output fields of user query */
> @@ -437,9 +435,7 @@ static int query_hwconfig(struct xe_device *xe,
>   	if (!hwconfig)
>   		return -ENOMEM;
>   
> -	xe_device_mem_access_get(xe);
>   	xe_guc_hwconfig_copy(&gt->uc.guc, hwconfig);
> -	xe_device_mem_access_put(xe);
>   
>   	if (copy_to_user(query_ptr, hwconfig, size)) {
>   		kfree(hwconfig);
