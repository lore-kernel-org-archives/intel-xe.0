Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A27DCD98F6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 10:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1791810E067;
	Fri, 19 Jun 2026 10:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EC3MIW9h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B584910E067
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 10:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781866038; x=1813402038;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xZNGct4ILYbyEENB3d8K+fhf5BIWAch/KEykoxNpDZ8=;
 b=EC3MIW9hN89fLCN037UFeDyf/hHvWxbtuInqduATGusQ84ysyNL1ZBTN
 Wzkv/mWFHK4ztDGakwdhUmKpIbSvAM5RcVC296wUJAVOETlCk1dQDnUiW
 y3XLkruHa1ytuSaOFm3aE4Et2gELALSEukrdl63lHVKWLrxdKBItx+AkF
 WHrVpFUVWROwSFzDaE0T1F9chMYuALCX/h5DBfT2H+OjKEFhbMRq3fA7A
 xgdpxjxJWfjkjvwShVG5CZiriIgbBLjrQu4mMO0Onuj5gFIzf8dvZOE1y
 ygajHeTRMgjo1KyPWtguYU3qPopPw/Chmq5H6CemorzNnqAu3qSY7XY1i w==;
X-CSE-ConnectionGUID: t7SHFzyaTNW8xtbT4fSr7A==
X-CSE-MsgGUID: dca/SxWzRv6UHeBajuU/Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="86626690"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="86626690"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 03:47:17 -0700
X-CSE-ConnectionGUID: 7MweUAkvQlmXpoeYetnMNA==
X-CSE-MsgGUID: Irf+6RPtTkO8/I7kduhmCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="247736484"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 03:47:13 -0700
Date: Fri, 19 Jun 2026 12:47:11 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v8 04/15] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
Message-ID: <ajUeL4DutqTpg3HS@black.igk.intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
 <20260608084700.640376-21-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608084700.640376-21-riana.tauro@intel.com>
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

On Mon, Jun 08, 2026 at 02:17:05PM +0530, Riana Tauro wrote:
> Add error_detected, mmio_enabled, slot_reset and resume recovery callbacks
> to handle PCIe Advanced Error Reporting (AER) errors.
> 
> For fatal errors, the device is wedged and becomes inaccessible. Return
> PCI_ERS_RESULT_NEED_RESET from error_detected to request a Secondary
> Bus Reset (SBR).
> 
> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
> error_detected to trigger the mmio_enabled callback. In this callback, the
> device is queried to determine the error cause and attempt recovery based
> on the error type.
> 
> Once the secondary bus reset(SBR) is completed the slot_reset callback
> cleanly removes and reprobe the device to restore functionality.

...

> +	/*
> +	 * Secondary Bus Reset causes all VRAM state to be lost along with
> +	 * hardware state. As an initial step, re-probe the device to
> +	 * re-initialize the driver and hardware.
> +	 * TODO: optimize by re-initializing only the hardware state and re-creating
> +	 * kernel BOs.
> +	 */
> +	pdev->driver->remove(pdev);

Curious, how does this effect drm_ras nodes? Do they persist?
If no, is it reasonable to have them recreated on every single error?

Raag

> +	if (pdev->driver->probe(pdev, ent))
> +		return PCI_ERS_RESULT_DISCONNECT;
