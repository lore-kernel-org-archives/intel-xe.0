Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CE5CD54B0
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 10:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A493910E386;
	Tue, 19 Sep 2023 10:26:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C443A10E386
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 10:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695119172; x=1726655172;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wNXZyysxkIgCIWE6EqnUNKKXETOzxlAF/xsm6KT2Ajk=;
 b=RnKl6gzkSWYueEvs10+jc+kvdFLa5q4yc4y1DeCWV5kCYKiaSKipA0Mm
 BKmH5apkOUqNLqnL7hWKOivFWnSfidUl9My4iwnkLVY/VbKtmNxmblQa/
 YcDtXQvOYzkqRnp+m0pSaPliz7eyICbvx40OLvQ7ivMs/tzDT9mNVVwuu
 3x9mSut1AOvVAVtbTc3A7bcFy4ARNrKHgyQUY43n0J7Xn75BmqsQmdn31
 PloxZpQuQQ2ZeIIffm9lekNCpZLJyGEJnk5EGETSIDmoGGnKbSauxC5fV
 JFKFKis9DsSYhWwG5kKgCm9dK8QB0iq0g9C0VSodKRoKWqEIjallBfYQ5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="359303890"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="359303890"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="869929438"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="869929438"
Received: from tjquresh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.37.227])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:26:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230918173711.625930-2-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230918173711.625930-1-uma.shankar@intel.com>
 <20230918173711.625930-2-uma.shankar@intel.com>
Date: Tue, 19 Sep 2023 13:26:07 +0300
Message-ID: <87jzsmtq68.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/3] drm/i915/display: Add a wrapper function
 for vga decode setup
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

On Mon, 18 Sep 2023, Uma Shankar <uma.shankar@intel.com> wrote:
> Some of the VGA functionality is not needed by the proposed
> Intel Xe driver. Adding a wrapper function for VGA decode setup.

If you want to do this, it should be sent to intel-gfx and i915 first,
then backported to drm-xe-next.

BR,
Jani.

>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/soc/intel_gmch.c | 14 ++++++++++++++
>  drivers/gpu/drm/i915/soc/intel_gmch.h |  1 +
>  2 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.c b/drivers/gpu/drm/i915/soc/intel_gmch.c
> index 49c7fb16e934..818f0b7f62a2 100644
> --- a/drivers/gpu/drm/i915/soc/intel_gmch.c
> +++ b/drivers/gpu/drm/i915/soc/intel_gmch.c
> @@ -12,6 +12,7 @@
>  #include "i915_drv.h"
>  #include "intel_gmch.h"
>  #include "intel_pci_config.h"
> +#include <linux/vgaarb.h>
>  
>  static void intel_gmch_bridge_release(struct drm_device *dev, void *bridge)
>  {
> @@ -167,3 +168,16 @@ int intel_gmch_vga_set_state(struct drm_i915_private *i915, bool enable_decode)
>  
>  	return 0;
>  }
> +
> +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
> +{
> +	struct drm_i915_private *i915 = pdev_to_i915(pdev);
> +
> +	intel_gmch_vga_set_state(i915, enable_decode);
> +
> +	if (enable_decode)
> +		return VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM |
> +		       VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
> +	else
> +		return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
> +}
> diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.h b/drivers/gpu/drm/i915/soc/intel_gmch.h
> index d0133eedc720..88db1653ffc9 100644
> --- a/drivers/gpu/drm/i915/soc/intel_gmch.h
> +++ b/drivers/gpu/drm/i915/soc/intel_gmch.h
> @@ -14,5 +14,6 @@ int intel_gmch_bridge_setup(struct drm_i915_private *i915);
>  void intel_gmch_bar_setup(struct drm_i915_private *i915);
>  void intel_gmch_bar_teardown(struct drm_i915_private *i915);
>  int intel_gmch_vga_set_state(struct drm_i915_private *i915, bool enable_decode);
> +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode);
>  
>  #endif /* __INTEL_GMCH_H__ */

-- 
Jani Nikula, Intel
