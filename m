Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0CEEF06E3
	for <intel-xe@archiver.kernel.org>; Sun,  8 Feb 2026 08:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AF310E00F;
	Sun,  8 Feb 2026 08:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAGlWYX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2054110E00F
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Feb 2026 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770537785; x=1802073785;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZIk1GeF2uP3HmB9R9ZEnCRt5zwBT/ha2UX19YTCHZ/o=;
 b=fAGlWYX2URXpVod4juHd+12E8kBZbX/2pUpSxyCyBnQT93JnIfM6c5LZ
 bzO6MHSfG+CegeFHQF+tiHkx3YCW5nCardTnet5Jbyz4UViBcDrOG7x+w
 kzj4Xq6vqluPi6WBqqicB8ywKPoS8gHOl03em9WafImxBLoS72To0JSTv
 nK9HhKGcHgb7FENtULOKxKQ/z/bjmYJ2QSx9UBvNU/oD6Jo3jWJdNbfIH
 X5PfxnBk8BCacoPB2p2vuyW02qDd+eV85QDfM/v6ChN/egF9nH1G2mWuk
 Ro0Od+pG3bqEr2LiEvRnxgrbCGLHM1hFBWZSfBAuylH02BFiwla827hXs g==;
X-CSE-ConnectionGUID: 5TUA4cgJTpSZFnuYIlvXgw==
X-CSE-MsgGUID: krhvboRPRia7ITRitboPew==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="82793330"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; d="scan'208";a="82793330"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 00:03:04 -0800
X-CSE-ConnectionGUID: GJngERhBQfG7YflTQ3aBcw==
X-CSE-MsgGUID: 3nw7b7lNT/+1u7VbcCJTRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; d="scan'208";a="210367495"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 00:03:01 -0800
Date: Sun, 8 Feb 2026 09:02:59 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH 2/8] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
Message-ID: <aYhDM-bCiyClOgyL@black.igk.intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-12-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122100613.3631582-12-riana.tauro@intel.com>
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

On Thu, Jan 22, 2026 at 03:36:14PM +0530, Riana Tauro wrote:
> Add error_detected, mmio_enabled, slot_reset and resume
> recovery callbacks to handle PCIe Advanced Error Reporting
> (AER) errors.
> 
> For fatal errors, the device is wedged and becomes
> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
> error_detected to request a Secondary Bus Reset (SBR).
> 
> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
> error_detected to trigger the mmio_enabled callback. In this callback,
> the device is queried to determine the error cause and attempt
> recovery based on the error type.
> 
> Once the secondary bus reset(SBR) is completed the slot_reset callback
> cleanly removes and reprobe the device to restore functionality.

...

> +static void xe_pci_error_handling(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	xe_device_set_in_recovery(xe);
> +	xe_device_declare_wedged(xe);

Is this the correct usage?

Documentation/gpu/drm-uapi.rst +392

"A 'wedged' device is basically a device that is declared dead by the driver
after exhausting all possible attempts to recover it from driver context."

Raag

> +	pci_disable_device(pdev);
> +}
