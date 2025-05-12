Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C646C3ABBC
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 08:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4AF10E30D;
	Mon, 12 May 2025 08:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1Hdu0OR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0119110E330
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747038549; x=1778574549;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+BdYNWLMClGFtOjoZMqrgAxrKUjj/rtwPi4U3OwiOmg=;
 b=g1Hdu0ORigfNZLFqard94RI9H4wwIVHO19jqCmgLQ5MKIEBpCgb/UTe7
 i57c+ijPRByV+fjAyxzPf4qrGUefdOoVLArwCPEdTGijNtkwJQAdE1nSf
 0omGY0/EJvMfoz6t6FlFyy3lR8CP27276QJoQHmysKH4zNMPDPdOPZ6l6
 n66uBAhmBmKx1bTYzBZz8CMdC8sT+MQLwgGs7zgaKrtkMcALZGjZeRnSl
 cEMow7n6D2M/iLSK06MSaFUmdXg3bjlZDXntsQ6H3gdWcu/XZbIfMOJOP
 IHJ1VzzxlnQi2lXUfspqZUOcVcUDXPyYy/Eb+Zy7hEZKbzZchuh8uQEds g==;
X-CSE-ConnectionGUID: +HFAi28/SXSd1bJs+CPPKw==
X-CSE-MsgGUID: 4kJ2pfvDQyiKfT7k7rrUeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48989896"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="48989896"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 01:29:09 -0700
X-CSE-ConnectionGUID: i2Cn5MnQQCOxY5EInW34iQ==
X-CSE-MsgGUID: g7Dmcu25QLCUyFqnN33U9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="142257132"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 12 May 2025 01:29:07 -0700
Received: from [10.245.96.179] (unknown [10.245.96.179])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B10DD33BDE;
 Mon, 12 May 2025 09:29:06 +0100 (IST)
Message-ID: <a28b2f14-9e97-4c11-9235-c3822d6a6702@intel.com>
Date: Mon, 12 May 2025 10:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/pf: Allow wedged_mode=2 only in debug config
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com
References: <20250424143043.937-1-lukasz.laguna@intel.com>
 <20250424143043.937-5-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250424143043.937-5-lukasz.laguna@intel.com>
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



On 24.04.2025 16:30, Lukasz Laguna wrote:
> The GuC reset policy is global, so changing it on PF can impact running
> VFs. To avoid unintended side effects, setting wedged_mode=2 on the PF
> is restricted to debug builds only.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 3 ++-
>  drivers/gpu/drm/xe/xe_device.c  | 7 +++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 369bb2103e4c..79a879d92845 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -169,7 +169,8 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (xe->wedged.mode == wedged_mode)
>  		return size;
>  
> -	if (wedged_mode == 2 && IS_SRIOV_VF(xe))
> +	if (wedged_mode == 2 &&
> +	    (IS_SRIOV_VF(xe) || (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG))))
>  		return -EPERM;
>  
>  	xe_pm_runtime_get(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 13430538f861..b42af557acb8 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -735,8 +735,11 @@ int xe_device_probe_early(struct xe_device *xe)
>  
>  	if (xe_modparam.wedged_mode > 2) {
>  		drm_dbg(&xe->drm, "Used wedged_mode value is invalid. Setting default (1)\n");
> -	} else if (xe_modparam.wedged_mode == 2 && IS_SRIOV_VF(xe)) {
> -		drm_dbg(&xe->drm, "Can't set wedged_mode=2 when running as VF. Setting default (1)\n");
> +	} else if (xe_modparam.wedged_mode == 2) {
> +		if  (IS_SRIOV_VF(xe))
> +			drm_dbg(&xe->drm, "Can't set wedged_mode=2 when running as VF. Setting default (1)\n");
> +		else if (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> +			drm_dbg(&xe->drm, "Can't set wedged_mode=2 when running as PF in non-debug config. Setting default (1)\n");

allowing wedged_mode=2 in PF mode is just an exception/hack, official
statement should say "unsupported" like in VF mode

>  	} else {
>  		xe->wedged.mode = xe_modparam.wedged_mode;
>  	}

