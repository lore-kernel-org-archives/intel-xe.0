Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59FFFF5139
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 20:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711F010E4C6;
	Tue,  7 Apr 2026 20:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQoTn8U6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E9210E4C5;
 Tue,  7 Apr 2026 20:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775594255; x=1807130255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HlgFyBbAC9c7G3rwTDazwB+J00vLN/QG9V5DUExkZYU=;
 b=KQoTn8U6q8cIICOPpysi6dzdeN4IJmGZVz1IEhMaIgnWSI2KVqWu7QJi
 ZklWqJH4AUTlxORZhyqKCisUl32r9SgA9DR4tFZ369q85SczgK6P0eXIB
 k4GJNOFVh+KNZhia80jTSMxPhtFDsbXtemKwvMGTUood2wf09PEUpru8s
 pUxL+VLjmk2H5ww3J+Am83YZCH7jjol3+6IvQXWzBzlOzd5wYgD7hB/Ih
 3/E0g1noOWO3ovD3d8CkQ1YmRziRffVEE3eO4/coBAOqftytZNybg4px0
 e9bjAATZKoquLoJyr5TWcvlTtG+0+QC+Pa/tN47W/CbPxu25WCca3M+ZE g==;
X-CSE-ConnectionGUID: RLdCAvgRT8mZJg3KTk4yqA==
X-CSE-MsgGUID: fZ1iOUufRIe5lFhcasrtEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87642083"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="87642083"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 13:37:34 -0700
X-CSE-ConnectionGUID: lwe0wZZ3SDuTib8s6FRPaQ==
X-CSE-MsgGUID: nMr7nzwoSg+8CzTm6gNcqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="228532862"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 13:37:33 -0700
Date: Tue, 7 Apr 2026 23:37:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 4/5] drm/i915: drop unnecessary intel_pci_config.h
 include
Message-ID: <adVrCdj16fGPC6pX@intel.com>
References: <cover.1775590536.git.jani.nikula@intel.com>
 <8323c99f379809b2973c99ebe54c21fd274d246c.1775590536.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8323c99f379809b2973c99ebe54c21fd274d246c.1775590536.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Apr 07, 2026 at 10:36:29PM +0300, Jani Nikula wrote:
> There's an unnecessary include. Drop it.
> 
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/i915_driver.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index c10cab38935a..129013c5fb42 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -122,7 +122,6 @@
>  #include "intel_cpu_info.h"
>  #include "intel_gvt.h"
>  #include "intel_memory_region.h"
> -#include "intel_pci_config.h"
>  #include "intel_pcode.h"
>  #include "intel_region_ttm.h"
>  #include "vlv_iosf_sb.h"
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
