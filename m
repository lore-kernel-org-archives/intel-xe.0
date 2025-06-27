Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FA1C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 12:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3E310EA06;
	Fri, 27 Jun 2025 12:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIs50R/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9522310EA06
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 12:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751028337; x=1782564337;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rPpLOEQQwdotiHt6e4oezetzCql9PBIVoPZCc/ss7uc=;
 b=CIs50R/YZKLjLaDdMxgG7h8EjPvD1UhjzMcYBudZ/laSqZ63kxvDGkf9
 Z4W7GLkVIF+EbJnxsQp8Jf+F/IDNUjQfg9gYRQkPJAtnyvSQ932CmkHm/
 kXccvPxN1iASKWTP3U2x/vGeUDghGm/rdU2+hWc4pQlNkOWIv7C8w79AV
 fHD43ZQR+SZoH9v0UfY/rPYn2ba8wLvKZO0iZo29ahCHnvkEEI7KTLu0b
 3DwELEX2ynNiXzGjEFOwLVaqn/dJ5P0/VjRYBuNxlx86G/cFnX+f8obti
 JE1/e7TtRQXnzTW7equfa0AO+1TZ7nVSKTfgTzQU+uZbVUJ+gkpcEgU2H A==;
X-CSE-ConnectionGUID: opicgANtTRymy0U1jcqVNw==
X-CSE-MsgGUID: h7G4YUp+R1+6ANhUNRPkXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="70771875"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="70771875"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:45:37 -0700
X-CSE-ConnectionGUID: EPtZAuW2QOqH0dRtzoEBFw==
X-CSE-MsgGUID: 9VdxH/9gSBGf0DL1NQs1lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152319927"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:45:32 -0700
Date: Fri, 27 Jun 2025 15:45:28 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe/pm: Wire up suspend/resume for I2C
 controller
Message-ID: <aF6SaLLw7HlSxagh@black.fi.intel.com>
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
 <20250626135610.299943-4-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626135610.299943-4-heikki.krogerus@linux.intel.com>
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

Hi Heikki,

Thanks for picking this up.

On Thu, Jun 26, 2025 at 04:56:08PM +0300, Heikki Krogerus wrote:
> From: Raag Jadav <raag.jadav@intel.com>
> 
> Wire up suspend/resume handles for I2C controller to match its power
> state with SGUnit.

...

> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index bfbfe1de7f77..0227fcba2168 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -227,6 +227,31 @@ static const struct regmap_config i2c_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +void xe_i2c_pm_suspend(struct xe_device *xe)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +		return;
> +
> +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D3hot);

I just realized the power modes will need (__force u32) casting to make
sparse happy. If you're planning another version, can you please include
it? If not, we can have a quick fix later on.

> +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> +}
> +
> +void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +		return;
> +
> +	if (d3cold)
> +		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY);
> +
> +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D0);

Ditto.

> +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> +}

Raag
