Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F56FC5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB56510E5A4;
	Wed, 28 May 2025 09:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjPjw3Jl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6E110E599
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748424108; x=1779960108;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GpiNgagVygca++NTJXCSsE+mwPJZEp5tv6x12UjH+RM=;
 b=QjPjw3JlU1HsiJKuu//cuDQXswS/Gu/MZVroxKq1PdIE7n9fDX72C+tB
 +2zEhhuRriV5N9ATwfSQdwR7eyGoluZNWAPyrhO2XDQNjmfe9bQIOtzH9
 7DgA3xzqe7qy/7XYf5EfrNUv4/w63dCh+UecIbC0JOSbm+2FSxrfIRaae
 DCP1TELN6bjjKmvcoSKJgIMA0seSFPIc7gmZvAHnRcqqQd5Qwa8l4dLzG
 Lc0DC8KWQoLfquaX/RiIsfUKcMMuFDzSKgYA88Bmg8vU9XKuMRaO4rAwW
 PVg5LHdk7KrZzBsFtJZR8nb1nGFvdrTHng+DwupcjjLro7aj7zE/4Ta1I A==;
X-CSE-ConnectionGUID: o7TTBpmSS5ejDgD7UVitng==
X-CSE-MsgGUID: w69mpjvtRySBgKPnvz4P6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50436276"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50436276"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:21:48 -0700
X-CSE-ConnectionGUID: TO77SRZhQCap6hu+4VubVg==
X-CSE-MsgGUID: iOpB9C6oRbWHzzBTnWXjFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143638820"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 28 May 2025 02:21:46 -0700
Received: from [10.245.84.121] (unknown [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CC85833BCC;
 Wed, 28 May 2025 10:21:44 +0100 (IST)
Message-ID: <68dd615d-3c25-4fb2-bcf5-4cfdf388f265@intel.com>
Date: Wed, 28 May 2025 11:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] drm/xe/pf: Allow upon-any-hang wedged mode only in
 debug config
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, matthew.brost@intel.com
References: <20250521122511.5760-1-lukasz.laguna@intel.com>
 <20250521122511.5760-5-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250521122511.5760-5-lukasz.laguna@intel.com>
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



On 21.05.2025 14:25, Lukasz Laguna wrote:
> The GuC reset policy is global, so disabling it on PF can affect all
> running VFs. To avoid unintended side effects, restrict setting
> upon-any-hang (2) wedged mode on the PF to debug builds only.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c495d499edff..35ae9eba7526 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1186,7 +1186,8 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
>  	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
>  		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
>  		return -EINVAL;
> -	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && IS_SRIOV_VF(xe)) {
> +	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && (IS_SRIOV_VF(xe) ||
> +		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {

nit: this condition alignment looks weird - checkpatch didn't complain?

>  		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
>  			mode, xe_device_wedged_mode_to_string(mode),
>  			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));

