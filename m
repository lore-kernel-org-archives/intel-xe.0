Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92805CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 08:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5633810E185;
	Fri, 12 Sep 2025 08:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdiJgNAu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7580B10E185
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 08:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757665195; x=1789201195;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Dv0L32bzB/0P4f0daD17TjB7wDRwFsIDuixCWY5yGRg=;
 b=PdiJgNAuDvyHltTfmU+EMHKsL75HMYAmI1nrDTw/WNmP7OyQ7f1n/ONZ
 uDlRKlXQBmyKkXZOfThJgIAWvSKuoC29X6PurAB2ELfSB1X9yUV0nY4vO
 4CgFxWX+FvLGdNQoSuc4OdBp9QfKz5j/ypeWYG6C+efTLZxZT2bZ86/R9
 F43VUIXDFxrF/bw1yRvzkOYq2yjVTKeFV++gD5L1iydbgQcTt+gQ9UCh6
 MzGymY7iqbJrbbLH9NVKdfyG65TGFwTXr7uaICUFqNAFo5Wnpg1hP4CZ3
 11VxU0lKLcMvM+QNMZ2Cxz9iW69cmy2uNgBFIR1QK1zsUfC0vKzu3YsOG g==;
X-CSE-ConnectionGUID: tfixuc6TTDCYu1oyuhX+Eg==
X-CSE-MsgGUID: UxvfMLgpRF+hAAK82fHrGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="60116040"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="60116040"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 01:19:55 -0700
X-CSE-ConnectionGUID: xwV40sVkRiOBtp19uk3GNw==
X-CSE-MsgGUID: BHi24ESMSQW+tTg+BFe0Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174688895"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.177])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 01:19:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH 1/3] drm/pcids: Split PTL pciids group to make wcl
 subplatform
In-Reply-To: <20250911210514.389014-2-dnyaneshwar.bhadane@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250911210514.389014-1-dnyaneshwar.bhadane@intel.com>
 <20250911210514.389014-2-dnyaneshwar.bhadane@intel.com>
Date: Fri, 12 Sep 2025 11:19:50 +0300
Message-ID: <70fc412b47d9972ad2d1b6eca13bbdd9da992552@intel.com>
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

On Fri, 12 Sep 2025, Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com> wrote:
> To form the WCL platform as a subplatform of PTL in definition,
> WCL pci ids are splited into saparate group from PTL.
> So update the pciidlist struct to cover all the pci ids.

This stops wcl from being identified by display driver. You need to add
INTEL_WCL_IDS to intel_display_ids as well.

It's a good idea to use a code tagging tool such as cscope or gnu
global, and check the references to the symbols you're changing.

> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  include/drm/intel/pciids.h  | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 701ba9baa9d7..fc2ea9132804 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -375,6 +375,7 @@ static const struct pci_device_id pciidlist[] = {
>  	INTEL_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
>  	INTEL_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
>  	INTEL_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
> +	INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, pciidlist);
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index da6301a6fcea..9d378c65be4b 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -877,7 +877,9 @@
>  	MACRO__(0xB08F, ## __VA_ARGS__), \
>  	MACRO__(0xB090, ## __VA_ARGS__), \
>  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> -	MACRO__(0xB0B0, ## __VA_ARGS__), \
> +	MACRO__(0xB0B0, ## __VA_ARGS__)
> +

Please add comment

/* WCL */

here, see all the above recent groups of macros.

> +#define INTEL_WCL_IDS(MACRO__, ...) \
>  	MACRO__(0xFD80, ## __VA_ARGS__), \
>  	MACRO__(0xFD81, ## __VA_ARGS__)

-- 
Jani Nikula, Intel
