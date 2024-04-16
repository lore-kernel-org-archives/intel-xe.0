Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB21C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 09:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B464D112B56;
	Tue, 16 Apr 2024 09:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsgTouxP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5962D112B56
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713260168; x=1744796168;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cK76tEHwwFDgtO5Cae2/VNFHgUEJXY0Cw99K6AwMCZY=;
 b=fsgTouxPSCBXDloCiDP4pu2RhBsH6ajSuoaYZyu2Fm/kntgeHMWsM25t
 8G5M50RmtpN0alNv8qmb7d8hukFaE9jBGRceR7w/ND6zo3wPGl6nAuwTU
 ODcfek//lnvsbAzKdKiw0GkfW9/qMs0tcFPhs85BpcEIvQtpt+KLil0Dj
 aLyfkJ9YsteNvOi5hz7SZLBoIoJq7qjABNZqGNjfoAS/kQRB6Dg6rI8+x
 3vG+Gox3a+AhW+5mH1RfjaoNdmcV8M6+sYSD+MZNlSXZirErH8h2/tCQC
 pI0aeqyFgOnCdvXWZxIivCK38gK1xlQTZYl6qTneBevbM1isa61GwsLef w==;
X-CSE-ConnectionGUID: t1FK1nKpQVy8c4ERDUgicA==
X-CSE-MsgGUID: LODciF/ORUOw59QiUKpZqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12463935"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="12463935"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:36:07 -0700
X-CSE-ConnectionGUID: 8EpfpY5LQ2StxgOWDu9oeA==
X-CSE-MsgGUID: F5umvmguQemtwNywkguznw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="45489552"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.221])
 ([10.94.250.221])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:36:06 -0700
Message-ID: <22cc7c5d-3fea-4a5e-ada3-1d2d0d5fb18e@linux.intel.com>
Date: Tue, 16 Apr 2024 11:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/xe: Promote xe_hw_engine_class_to_str()
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-4-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240416030454.3739862-4-lucas.demarchi@intel.com>
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


On 4/16/2024 5:04 AM, Lucas De Marchi wrote:
> Move it out of the sysfs compilation unit so it can be re-used in other
> places.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_engine.c             | 18 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hw_engine.h             |  2 ++
>   drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 18 ------------------
>   3 files changed, 20 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index a688bb2d96ce..8f72f324eee7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -959,3 +959,21 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
>   	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
>   		hwe->instance == gt->usm.reserved_bcs_instance;
>   }
> +
> +const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
> +{
> +	switch (class) {
> +	case XE_ENGINE_CLASS_RENDER:
> +		return "rcs";
> +	case XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return "vcs";
> +	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "vecs";
> +	case XE_ENGINE_CLASS_COPY:
> +		return "bcs";
> +	case XE_ENGINE_CLASS_COMPUTE:
> +		return "ccs";
> +	default:
> +		return NULL;
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 71968ee2f600..843de159e47c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -67,4 +67,6 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>   	return hwe->name;
>   }
>   
> +const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index c5084d94c442..4e9db6299c7c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -624,24 +624,6 @@ static void hw_engine_class_sysfs_fini(struct drm_device *drm, void *arg)
>   	kobject_put(kobj);
>   }
>   
> -static const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
> -{
> -	switch (class) {
> -	case XE_ENGINE_CLASS_RENDER:
> -		return "rcs";
> -	case XE_ENGINE_CLASS_VIDEO_DECODE:
> -		return "vcs";
> -	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> -		return "vecs";
> -	case XE_ENGINE_CLASS_COPY:
> -		return "bcs";
> -	case XE_ENGINE_CLASS_COMPUTE:
> -		return "ccs";
> -	default:
> -		return NULL;
> -	}
> -}
> -
>   /**
>    * xe_hw_engine_class_sysfs_init - Init HW engine classes on GT.
>    * @gt: Xe GT.
