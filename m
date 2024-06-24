Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FE5C2BD09
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 12:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D72D10E41F;
	Mon, 24 Jun 2024 12:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BebcBM+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5637210E41F
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 12:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719232243; x=1750768243;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n61NhwnpgUXrEFRr55r7Hv5w8lG+cOnmldR/3Xx8Tm8=;
 b=BebcBM+zqjOTMjyANWqqrloGvvOqoUmw0nOPmT94f51ON4t0csmsrKqR
 8ywbN+dETRNpqtILPWiU8iASteoMBm+XQck15sO/AMyaWDVAcaDQNxgQe
 WDYV+uj1B1bR0nz1aKCbCZBw10DtXAqJ5yOxzmLFmz70HzRfBjoZ8WPJh
 vjJxu1ZnKzNOXvouIX/cf1Fhb2qiFASJ9y1Chjf2dPk+0lJTwhNGUF2Iy
 F9YtTckYr7eW6HCzGK30bY6yOEEEH4wIGCjnc6B3GsWtah/ozMxyunDF+
 iEfepYp1Fje7VG1csI3PUFqJfvZAUni8VadArYWFA+MgQEwAoNlPR0BLP Q==;
X-CSE-ConnectionGUID: nyziZ+c1QTaCPqNuwMyzNg==
X-CSE-MsgGUID: mtXj7xxbRPu9mwvyEoQj0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="26789547"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="26789547"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:30:42 -0700
X-CSE-ConnectionGUID: 2iw5jZNFQb2n2cDG/FwAFA==
X-CSE-MsgGUID: IA0OJq81RtGo3XM1U3LJ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="43095067"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 24 Jun 2024 05:30:41 -0700
Received: from [10.246.19.248] (unknown [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1648427BB3;
 Mon, 24 Jun 2024 13:30:37 +0100 (IST)
Message-ID: <9de03fae-edce-41c6-8b1f-421c83d6c23a@intel.com>
Date: Mon, 24 Jun 2024 14:30:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/oa: Fix kernel doc warnings in xe_drm.h
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240623203119.3840283-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240623203119.3840283-1-ashutosh.dixit@intel.com>
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



On 23.06.2024 22:31, Ashutosh Dixit wrote:
> Fix kernel doc warnings in xe_drm.h. Also eliminate private/non-abi enum
> definitions.
> 
> v2: Remove __DRM_XE_PERF_TYPE_MAX since it is unused (Michal)
> v3: Also remove DRM_XE_OA_PROPERTY_MAX since it can also be eliminated (Michal)
> 
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

some nits below, but in general LGTM, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

and I'm assuming it's not too late for such uabi fixups, but better to
wait for ack from Rodrigo

> ---
>  drivers/gpu/drm/xe/xe_oa.c | 3 ++-
>  include/uapi/drm/xe_drm.h  | 5 +----
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 4168b51cf7b5..9263ae9a864e 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1684,6 +1684,7 @@ static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] = {
>  	[DRM_XE_OA_EXTENSION_SET_PROPERTY] = xe_oa_user_ext_set_property,
>  };
>  
> +#define MAX_USER_EXTENSIONS	16

nit: maybe it's worth to put small comment saying this is our choice to
limit number of nested user extensions we want to support (or at least
this is how I understood this)

nit: and this doesn't really look like OA specific limitation, so maybe
it's time to promote MAX_USER_EXTENSIONS to some shared location to make
it unified across driver

>  static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number,
>  				 struct xe_oa_open_param *param)
>  {
> @@ -1692,7 +1693,7 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
>  	int err;
>  	u32 idx;
>  
> -	if (XE_IOCTL_DBG(oa->xe, ext_number >= DRM_XE_OA_PROPERTY_MAX))
> +	if (XE_IOCTL_DBG(oa->xe, ext_number >= MAX_USER_EXTENSIONS))
>  		return -E2BIG;
>  
>  	err = __copy_from_user(&ext, address, sizeof(ext));
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 93e00be44b2d..b410553faa9b 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1379,8 +1379,8 @@ struct drm_xe_wait_user_fence {
>   * enum drm_xe_perf_type - Perf stream types
>   */
>  enum drm_xe_perf_type {
> +	/** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
>  	DRM_XE_PERF_TYPE_OA,
> -	__DRM_XE_PERF_TYPE_MAX, /* non-ABI */
>  };
>  
>  /**
> @@ -1611,9 +1611,6 @@ enum drm_xe_oa_property_id {
>  	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
>  	 */
>  	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
> -
> -	/** @DRM_XE_OA_PROPERTY_MAX: non-ABI */
> -	DRM_XE_OA_PROPERTY_MAX
>  };
>  
>  /**
