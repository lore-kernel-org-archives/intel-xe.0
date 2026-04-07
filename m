Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A504BFF510C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 16:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBDD10E47B;
	Tue,  7 Apr 2026 16:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtmOrRtb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC9610E46E;
 Tue,  7 Apr 2026 16:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775577691; x=1807113691;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Lqul4K/ncdLeF/22adYFJtCO28FU4oCbvbOhhnHaMvA=;
 b=mtmOrRtbjoaHmaojQ6gB2XyilrxhYlMeTsqTxldvsPeKp9YLnzVNzHZa
 3j9c1qLbOmY8z3smgIyZnpYf4YVHEgnTCU2uQuhOU61s+nzXOjvYiyrBK
 nCDWRhYRzN3oaA/D3bAS36JegRGyP00ulfzoXp1SJM9Ia1RJImnLWKyHv
 1u4LFAI7RhV6a6SHk390MYnHL6rBq9KyYg4qcWTa8HKSVo3qpNId9P/lj
 tjAlRVuOKp5ikaq2B8MAh1LmAO5F2Ow5Ba4zknRVlaUVe+RdF113fLBPk
 ovr1avI1fHo6MCWf4IfR37pbFLBYnLpxvHgJcGjrxz90cgB3OOild3mwa Q==;
X-CSE-ConnectionGUID: aUzsoPViQp6P0/TYTbiVrQ==
X-CSE-MsgGUID: OzPJPROeRbG/ZxI9dx+ezA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76262729"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76262729"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 09:01:31 -0700
X-CSE-ConnectionGUID: I8Qip/soRmirOFGyiyRD/w==
X-CSE-MsgGUID: bvOSbYnkRVysNA7b/RP8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="227378533"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 09:01:30 -0700
Date: Tue, 7 Apr 2026 19:01:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/i915/pci: move intel_pci_config.h under
 include/drm/intel
Message-ID: <adUqV3_A52cS9Vom@intel.com>
References: <cover.1775559414.git.jani.nikula@intel.com>
 <1e19927c4a5cc9f0e559a7253279ed3cf2259c78.1775559414.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e19927c4a5cc9f0e559a7253279ed3cf2259c78.1775559414.git.jani.nikula@intel.com>
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

On Tue, Apr 07, 2026 at 01:57:42PM +0300, Jani Nikula wrote:
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index c10cab38935a..0314b5dc592a 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -49,6 +49,7 @@
>  #include <drm/intel/display_member.h>
>  #include <drm/intel/display_parent_interface.h>
>  #include <drm/intel/intel_pcode_regs.h>
> +#include <drm/intel/pci_config.h>

This one doesn't seem to need the header anymore.

>  
>  #include "display/i9xx_display_sr.h"
>  #include "display/intel_bw.h"
> @@ -122,7 +123,6 @@
>  #include "intel_cpu_info.h"
>  #include "intel_gvt.h"
>  #include "intel_memory_region.h"
> -#include "intel_pci_config.h"
>  #include "intel_pcode.h"
>  #include "intel_region_ttm.h"
>  #include "vlv_iosf_sb.h"

-- 
Ville Syrjälä
Intel
