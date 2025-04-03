Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3206BC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 11:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25ED10E215;
	Thu,  3 Apr 2025 11:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6vGThQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAB910E215
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 11:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743678320; x=1775214320;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=TSU7NLa1Q6/MQney/nALsP1yERF9AFDkVYoBG5TO73Y=;
 b=O6vGThQN3EYyxpu1HdBshtTAyICDoqTKCfFuBh6D/8adDX+c1lXcehVF
 OF3K/nd8BkX9HoX9HVNZecWR28U/qEnGzpN1rEgMu0uJHTY8W8BaiDRjX
 ntOvf9XeML2Jm2LhPBCRkTm4Jh1vqjuhF0nDarN+bUyTkdpqFxNTo6KlU
 ZMPWG9GA9P3tlqLj1IgmhXG/HqpJH+H0wJpdcaUrSCqsOIjnDPcbq1qV0
 Rq6zw3yZrkRdb3IjE9sFR7PVPHUh1hLrXD4Xo4kX9+TomMEQvKYt3i1vp
 cj69Sq8ZbbMub+BVXpcfpgD+BhSMJSCtWdPdWCLYdraJh0GOpYUrVsBGS A==;
X-CSE-ConnectionGUID: CdU6wZUhTh6DvzcSZb1YOg==
X-CSE-MsgGUID: EjrHkukISLOSzGTpcvezvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44793187"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44793187"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 04:05:20 -0700
X-CSE-ConnectionGUID: 4EYGX8jaRsazqu6yOdW+7Q==
X-CSE-MsgGUID: YhoDoT/jT3GWX+LFNwWR4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="132175718"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 03 Apr 2025 04:05:18 -0700
Received: from [10.245.114.177] (unknown [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id AFD1033EA9;
 Thu,  3 Apr 2025 12:05:17 +0100 (IST)
Message-ID: <285deebb-2cd0-4a85-84ce-35d4514cd793@intel.com>
Date: Thu, 3 Apr 2025 13:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/vf: Don't update GuC reset policy when
 changing wedged mode
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
References: <20250403094141.25941-1-lukasz.laguna@intel.com>
 <20250403094141.25941-3-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250403094141.25941-3-lukasz.laguna@intel.com>
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



On 03.04.2025 11:41, Lukasz Laguna wrote:
> Prevent the VF from attempting to update the GuC reset policy when
> changing the wedged mode, as this operation is not supported for VFs.
> 
> Log a message to indicate that GuC may still cause engine reset even
> with wedged_mode=2.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d0503959a8ed..062668d02365 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -171,6 +171,11 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  
>  	xe->wedged.mode = wedged_mode;
>  
> +	if (IS_SRIOV_VF(xe)) {
> +		drm_info_once(&xe->drm, "VF can't change GuC's engine reset policy. GuC may still cause engine reset even with wedged_mode=2\n");

never use drm_info_once() logs for places where multiple different
devices can be reached, as then doing something similar on next device
there will be no trace at all

also should we change xe->wedged.mode if it is N/A for VF?

btw, what is our approach if someone on the PF already set some policy
on GuC will not do engine reset? or it is n/a after a VF switch?

> +		return size;

shouldn't we return -EPERM instead?

> +	}
> +
>  	xe_pm_runtime_get(xe);
>  	for_each_gt(gt, xe, id) {
>  		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);

