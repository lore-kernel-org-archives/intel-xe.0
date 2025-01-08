Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6772E77197
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 03:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A404210E08E;
	Wed,  8 Jan 2025 03:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zv0r2jg1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AEE10E08E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 03:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736307574; x=1767843574;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PZqq8bSZwC50W+pkEQU3KBFTdMzIjXv6SEI0/TGCg3g=;
 b=Zv0r2jg1hnODp5q3p8p7/D+JK3BM5ZEiHoPCSadlZ5iuvPrExasNqOp8
 rNTAKfueOvGlV5znvFeV8H6mQCx4g0T/dfDdCT5sM6lxp4D9I7BtfahM7
 W3+4AGkS081FurXxxv9OaAgJK8mTZE5hbZUQeJ5b2Vrqs1hAv1q/mpCl6
 bvYMA474DZF+HQJa2ynqw5aONN3rt0ZL+ZV7DiiSbTliEQdO15o59Qv+u
 WzNKxYOlWmAw0vS+Ic6T1UM4jIwCC9MmouFIT4IvwrGfk5N+EQxLN4ah1
 BaILr9V0DTfqL8R/D7n3n8ph5gCX4IGvrTlMlT88m2c1DJcuynMl2CUO1 A==;
X-CSE-ConnectionGUID: fVjolpa3T+qv2+Hw4XG+qA==
X-CSE-MsgGUID: vfzQtg3WS0KgoMPphYXqLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36678731"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="36678731"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 19:39:34 -0800
X-CSE-ConnectionGUID: 36oFwZ5dSRatb+7QhEBuDg==
X-CSE-MsgGUID: oFn5WkhdTG6/w5lk7Nbkww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="102879285"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.241])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 19:39:33 -0800
Date: Tue, 7 Jan 2025 21:39:25 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Koby Elbaz <kelbaz@habana.ai>
Subject: Re: [PATCH] drm/xe: Remove unused "mmio_ext" code
Message-ID: <5tnfpuj3qv3vqy6ydpbqttz5rf4cfssldw7bgpmmgbduojdztp@lpacc4xzoemi>
References: <20250106234312.2986065-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250106234312.2986065-2-matthew.d.roper@intel.com>
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

On Mon, Jan 06, 2025 at 03:43:13PM -0800, Matt Roper wrote:
>The "mmio_ext" and 'REG_EXT" code is currently unused on any existing
>platform.  Going forward, this also isn't the design we want to use for
>any future platforms/features either, so we should just go ahead and
>remove the dead code to avoid confusion.
>
>mmio_ext was originally added in an attempt to hack around the early
>(mis)design of the Xe driver, which used xe_gt as the target for all
>register MMIO access, even those completely unrelated to the GT subunit
>of the hardware.  With the introduction of commit 34953ee349dd ("drm/xe:
>Create dedicated xe_mmio structure") and its follow-up patches, that
>misdesign has been corrected and access to register MMIO regions
>specific to hardware units is now done through xe_mmio structures which
>encapsulate an iomap, region size, and some other metadata.
>
>Although all of the registers used by the driver today happen to fall
>within one specific PCI BAR region, and thus re-use a single device-wide
>iomap, there's no requirement that this stay true for future platforms
>or features.  I.e., if a future platform adds a new 'foo' hardware unit
>that exists at a different area in the BAR, or even in a completely
>different BAR, then that would be handled by doing a separate iomap of
>that unit's register region and wrapping it in its own 'struct xe_mmio
>foo_regs' structure.  The pointer to the new 'foo_regs' could be placed
>within the xe_device, xe_tile, xe_gt, etc., according to where the new
>hardware unit falls within the current hardware hierarchy.
>
>This effectively reverts the following commits, although parts of these
>commits had already vanished or changed with the earlier xe_mmio
>refactor work:
>
> - commit 399a13323f0d ("drm/xe: add 28-bit address support in struct
>   xe_reg")
> - commit fdef72e02e20 ("drm/xe: add a flag to bypass multi-tile config
>   from MTCFG reg")
> - commit 866b2b176434 ("drm/xe: add MMIO extension support flags")
> - commit ef29b390c734 ("drm/xe: map MMIO BAR according to the num of
>   tiles in device desc")
> - commit a4e2f3a299ea ("drm/xe: refactor xe_mmio_probe_tiles to support
>   MMIO extension")
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Koby Elbaz <kelbaz@habana.ai>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>, but let's wait
a day or 2 to give a chance for others to take another look.

Koby, can you ack this?

thanks
Lucas De Marchi
