Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255A5C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 20:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF89B10E73D;
	Wed, 14 May 2025 20:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6UPbaSo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ABB10E73D
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 20:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747254855; x=1778790855;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=42O/WoiAuHJ7NQs8ee3V5iI7F80X6rd8NdDyxtlDzCY=;
 b=Z6UPbaSoVp5xjOowKMdRjj20XDQoBpIVy1UbqFgMqdC68C4R/IwSw3Vk
 1VHSnwEfWZFz3U7RBLcixrCAvKcuqTl1v1ouBF8e39P+nwYsNJ8SPuCd9
 W9zrCuTg3ugxkqubiAV2LxZxj8043pMohLUkn1iSYEwavSfwb6djdD/oU
 DiiMruzX8b37L+n4+neYCtVohX2vOIA4yBOH7QCEXJ2yyn6K8yETsF2iH
 +fvhS9rG4zODa/de326mSvmHGj8Ort8R4ENxCMZlF1bcMvrpDPqHYY6r4
 lt5Kl+TYriLoJDANO5a8Sg5axBRmYNM/e0TQw5t2RTD3Q0ApaM0K8MXPr Q==;
X-CSE-ConnectionGUID: BDTWBqU1QJifSBxw6MmiLw==
X-CSE-MsgGUID: FqmMpufNSzqw+oY+I2eDnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49155595"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49155595"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 13:34:13 -0700
X-CSE-ConnectionGUID: x5jhZ4z4Sa+6vU/9+lyNow==
X-CSE-MsgGUID: OAta9dN9TmmaUdgSJbigqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142919704"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 14 May 2025 13:34:11 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A49E93497A;
 Wed, 14 May 2025 21:34:09 +0100 (IST)
Message-ID: <10adae13-8e8a-4995-9e07-0ec0ea067422@intel.com>
Date: Wed, 14 May 2025 22:34:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/xe/vf: Disallow setting wedged_mode=2
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, matthew.brost@intel.com
References: <20250514101124.12437-1-lukasz.laguna@intel.com>
 <20250514101124.12437-4-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250514101124.12437-4-lukasz.laguna@intel.com>
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
> In wedged_mode=2, engine resets need to be disabled, which requires
                ^^
maybe we can name the mode instead using its value?

> changing the GuC reset policy. VFs are not permitted to do that.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index a8470221ff85..7dfc39dd4c9c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1189,6 +1189,10 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
>  	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
>  		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
>  		return -EINVAL;
> +	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && IS_SRIOV_VF(xe)) {
> +		drm_dbg(&xe->drm, "wedged_mode: unsupported mode (%u) for %s\n", mode,

maybe it's worth to add xe_wedge_mode_to_string() as it could be also
used in patch 1/4

> +			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +		return -EPERM;
>  	}
>  
>  	return 0;

