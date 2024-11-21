Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CD0D6E2A4
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 09:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024BF10E21A;
	Thu, 21 Nov 2024 09:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OU7dj9zC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BD910E8C7
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 09:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732183051; x=1763719051;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=crpeUMju/SkC3Q8p5odsNmIP+yKBdIZ50E0Wl0PmQ0E=;
 b=OU7dj9zCxpIbcalAtgYW2lEjl7ENPhtvgUacErwg79pFJIEWREbzVoot
 bF2KTpnX4otul2sajH1VXg1oxQ1lwjH2Vzi0JXE3yAoisRTFDOKEuLVrr
 XlQI7X/RkyiAF+iZhKQT1C3JYkO7rPKe5swwKKD3Kv/yOtflKrBK+RKal
 9M7N6dmDxozFkEApDQXhCtdoII0QdJ4RHveg0cgZQtnxc22WDHcM2gyNg
 8EjHu8MeSkgdhLiC6V4ySmW7VTXfhaTf6Jq7cQHwYmBUd+xxqdpFsdBtH
 hLMhHC3qdqWDqH2GBnJT8ws02YUgTMqyqBLvQzsIuhditBW/IqD11OXUL g==;
X-CSE-ConnectionGUID: vlHuCF8MSQ6ykFZ9VfAQXQ==
X-CSE-MsgGUID: 76HB5TXDRJSt70UD1L8H8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="31676581"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="31676581"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 01:57:28 -0800
X-CSE-ConnectionGUID: kMpAkSGJQ6aFRnU7/MeWkw==
X-CSE-MsgGUID: Cnf2Ib45SMW4E0OQc9chGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="91015375"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.95])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 01:57:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, John Harrison
 <John.C.Harrison@Intel.com>
Subject: Re: [PATCH v3 09/12] drm/xe/pxp: Add API to mark a BO as using PXP
In-Reply-To: <20241120234353.1037180-10-daniele.ceraolospurio@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-10-daniele.ceraolospurio@intel.com>
Date: Thu, 21 Nov 2024 11:57:22 +0200
Message-ID: <87iksg29kt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 20 Nov 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> index 419e8e926f00..533bc82255b6 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> @@ -9,6 +9,9 @@
>  #include <linux/errno.h>
>  #include <linux/types.h>
>  
> +#include "xe_bo.h"
> +#include "xe_pxp.h"
> +

Can't have this. This will include xe_bo.h and xe_pxp.h from i915
display.

Basically you can't use gem_to_xe_bo() in static inlines in headers that
get included to i915 display. It all needs to stay opaque.

BR,
Jani.

>  struct drm_gem_object;
>  struct xe_pxp;
>  
> @@ -16,7 +19,15 @@ static inline int intel_pxp_key_check(struct xe_pxp *pxp,
>  				      struct drm_gem_object *obj,
>  				      bool assign)
>  {
> -	return -ENODEV;
> +	/*
> +	 * The assign variable is used in i915 to assign the key to the BO at
> +	 * first submission time. In Xe the key is instead assigned at BO
> +	 * creation time, so the assign variable must always be false.
> +	 */
> +	if (assign)
> +		return -EINVAL;
> +
> +	return xe_pxp_key_check(pxp, gem_to_xe_bo(obj));
>  }
>  
>  #endif

-- 
Jani Nikula, Intel
