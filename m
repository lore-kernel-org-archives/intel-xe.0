Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B2ACD5BA4
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 13:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256AF10ECEF;
	Tue, 19 May 2026 13:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daWtkC1t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140A510ECF1
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 13:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779197079; x=1810733079;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YY0CGALY271ZevGzIqJk1m3ifB4oFvDlJ3Pw1kOy5HY=;
 b=daWtkC1t27dLeLTEi9fmrEsiMtHoTX9zRPSHPEYhbzH7soXjwUpjHWPm
 l3x3KJjcGyH7DShINDkdZcSjwvpDsreiYRlk7rNXuuaTZsQu/hjTtIo6V
 MCkxwMe9ZCCNHHZkMP82At9ahLyHO1bUMwGh5T92Su1R2Lvs7gIFTRbOF
 MgG39x19q1BNUR1rCCqzOVKyyYxp/MNeC9CqmJ6+mk24gqHw6QbHSA68j
 D7PVzoI7zztW9yxtISPI44iFOZCFac3JBKwhZlTnhNU1zOzElY0zh6Lro
 vbvDT7kS8EnHXaUslRTybMbaKHszp5afA9eAwHDku/hP4ZZl0Eionuhis Q==;
X-CSE-ConnectionGUID: ntULaHYVTyqlI6REYjTFIw==
X-CSE-MsgGUID: 0oDCR31+T0SPRF+epUtEFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79925128"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79925128"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 06:24:38 -0700
X-CSE-ConnectionGUID: r+lWrSYsSVKI5vzGgrjxkg==
X-CSE-MsgGUID: GeIryMXUQX62dzMeJWWIyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="240027530"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 06:24:37 -0700
Date: Tue, 19 May 2026 15:24:34 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 matthew.d.roper@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCHv2] drm/xe: Check for dead config space on reading all 1s
Message-ID: <agxkkgXMMpLtELLN@black.igk.intel.com>
References: <20260512060128.209698-1-arun.r.murthy@intel.com>
 <20260519033104.480503-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519033104.480503-1-arun.r.murthy@intel.com>
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

Cc: Badal

On Tue, May 19, 2026 at 09:01:04AM +0530, Arun R Murthy wrote:
> After ioremap the BAR mapped address is read once as a sanity check and
> if found to be all 1s then return avoiding the driver initialization of
> a dead device.
> 
> v2: Move the sanity check to mmio_probe_early() - Michal
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7941
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 78adb303b663..d206e3720eed 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -90,6 +90,7 @@ int xe_mmio_probe_early(struct xe_device *xe)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	u32 sanity = 0;
>  
>  	/*
>  	 * Map the entire BAR.
> @@ -103,6 +104,21 @@ int xe_mmio_probe_early(struct xe_device *xe)
>  		return -EIO;
>  	}
>  
> +	/*
> +	 * If the parent PCIe bridge failed to leave D3cold, or the device

So shouldn't this also be in PM path?

Raag

> +	 * fell off the bus, MMIO reads return all-ones. Detect that here
> +	 * before any other subsystem (SR-IOV, GuC, pcode...) consumes a
> +	 * bogus 0xFFFFFFFF.
> +	 */
> +	sanity = readl(xe->mmio.regs);
> +	if (sanity == U32_MAX && !pci_device_is_present(pdev)) {
> +		drm_err(&xe->drm,
> +			"MMIO reads all 1s and device not present; aborting probe\n");
> +		pci_iounmap(pdev, xe->mmio.regs);
> +		xe->mmio.regs = NULL;
> +		return -ENODEV;
> +	}
> +
>  	/* Setup first tile; other tiles (if present) will be setup later. */
>  	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
>  
> -- 
> 2.25.1
> 
