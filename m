Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1FFC3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 20:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4447E10E723;
	Wed, 14 May 2025 20:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQdDDpjQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07A410E723
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 20:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747255161; x=1778791161;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zHdq10fyCZuRp5C3v7yEGcby030sSMhVRbzpNAJGphE=;
 b=LQdDDpjQI/9E5djjfWvrszVobLLuNddxOs2XMN2XxWAVHDb2yPmPTsBh
 8P/bE2rBkbSoEX7uJQBluhFl9zC43rdDO3bFqyvBjlJfbNmWRqe6KFAvK
 psMVbLY5iIDxKSleI6o1GOABLQlMRK9nq2SE5eQiJvBrKAzHx5NlfXuLf
 +D3PoH8zyA/c0aJWKOTuuUoO8kFxdo4u6AWdZ9YMJ29yaO5N9cJP/SdzU
 t1KxCo7pQG9UJBUpoNQriCtymdwSdQwdjNxNhp/vXbGfA50dWSmyxRXva
 KFaQv88gk18/1zjKGaIWog0ad3CtoxFeJ7+t3pqyPpG7oq3NoDdawNSuA g==;
X-CSE-ConnectionGUID: Xq5tpAXJRdOaJd3pQj9IBA==
X-CSE-MsgGUID: qkLtnEidRMaSGrIebWeCtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49246778"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49246778"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 13:39:21 -0700
X-CSE-ConnectionGUID: ueqoBtLkR3uthOlOL6Ffww==
X-CSE-MsgGUID: uNDIOEXURPifyPVK1NjAPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138027372"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 14 May 2025 13:39:19 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C717B3497B;
 Wed, 14 May 2025 21:39:17 +0100 (IST)
Message-ID: <6e884905-8ce5-4a7a-8527-3b1b412e48e8@intel.com>
Date: Wed, 14 May 2025 22:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/xe/pf: Allow wedged_mode=2 only in debug config
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, matthew.brost@intel.com
References: <20250514101124.12437-1-lukasz.laguna@intel.com>
 <20250514101124.12437-5-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250514101124.12437-5-lukasz.laguna@intel.com>
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



On 14.05.2025 12:11, Lukasz Laguna wrote:
> The GuC reset policy is global, so changing it on PF can impact running

it's not only about the change itself, but more that in UPON_ANY_HANG
mode the GuC reset policy would impact all VFs, even those that didn't
cause a hang

> VFs. To avoid unintended side effects, setting wedged_mode=2 on the PF
                                                            ^^
please use full mode name, not just number

> is restricted to debug builds only.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

otherwise LGTM

> ---
>  drivers/gpu/drm/xe/xe_device.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7dfc39dd4c9c..f23d8236bddc 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1189,7 +1189,8 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
>  	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
>  		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
>  		return -EINVAL;
> -	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && IS_SRIOV_VF(xe)) {
> +	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && (IS_SRIOV_VF(xe) ||
> +		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
>  		drm_dbg(&xe->drm, "wedged_mode: unsupported mode (%u) for %s\n", mode,
>  			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>  		return -EPERM;

