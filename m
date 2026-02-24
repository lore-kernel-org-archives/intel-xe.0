Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ACBEFB7F9
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 05:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7DB10E4AF;
	Tue, 24 Feb 2026 05:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDUr6/ey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A3A10E4AF
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 05:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771911240; x=1803447240;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MX3yHsyxDy3W1KByq7j/dmtdwtP1RNX4+iXLIldbF3E=;
 b=KDUr6/eymYAxCuDgiiwsHYL6+9HYtHDZQ2r44G86Sx1dR11+Y+Z8J3ws
 df84V48O1EKJnP35P+HLq/6jiBcCBTHcdP3rVks65ANQekFodQeNxI76l
 jVFGf04hgt/bJ7l6qeNW0/XtUlt388q77JgZeD6NhI3QVi+dg2xKzSjaD
 ZZiE2sduXih/O5G3EAwGFvetGczQ7ydrj2+3Riif6Osk6w3ML2onsVNWG
 diZizxN7WrxRoDTEBtUv2MeOXQnfk9Bm60QESLf0Z+1ogfoglFCV/eV5Q
 qxWmLofXdXlQRM8VH377wLGyV2Vb4nQ22ZALOtHN7RSRHtuD8ok2FsoGR g==;
X-CSE-ConnectionGUID: iamnNUeaRRmBk4UpL92agw==
X-CSE-MsgGUID: fSdF2xjWQ6O4LRD3g//XTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72958882"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72958882"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 21:33:59 -0800
X-CSE-ConnectionGUID: dHLW4fNkQ8CEBWichFAHqQ==
X-CSE-MsgGUID: 4lkMTPKRTLu+npjyr4a0uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="214161485"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 21:33:57 -0800
Date: Tue, 24 Feb 2026 06:33:54 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH 2/8] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
Message-ID: <aZ04QjEu6223iMzx@black.igk.intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-12-riana.tauro@intel.com>
 <aYhDM-bCiyClOgyL@black.igk.intel.com>
 <efce4bdc-32b8-48b2-a5ae-c0aab1c7df8f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efce4bdc-32b8-48b2-a5ae-c0aab1c7df8f@intel.com>
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

On Tue, Feb 24, 2026 at 08:53:06AM +0530, Riana Tauro wrote:
> On 2/8/2026 1:32 PM, Raag Jadav wrote:
> > On Thu, Jan 22, 2026 at 03:36:14PM +0530, Riana Tauro wrote:
> > > Add error_detected, mmio_enabled, slot_reset and resume
> > > recovery callbacks to handle PCIe Advanced Error Reporting
> > > (AER) errors.
> > > 
> > > For fatal errors, the device is wedged and becomes
> > > inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
> > > error_detected to request a Secondary Bus Reset (SBR).
> > > 
> > > For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
> > > error_detected to trigger the mmio_enabled callback. In this callback,
> > > the device is queried to determine the error cause and attempt
> > > recovery based on the error type.
> > > 
> > > Once the secondary bus reset(SBR) is completed the slot_reset callback
> > > cleanly removes and reprobe the device to restore functionality.
> > 
> > ...
> > 
> > > +static void xe_pci_error_handling(struct pci_dev *pdev)
> > > +{
> > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > +
> > > +	xe_device_set_in_recovery(xe);
> > > +	xe_device_declare_wedged(xe);
> > 
> > Is this the correct usage?
> > 
> > Documentation/gpu/drm-uapi.rst +392
> > 
> > "A 'wedged' device is basically a device that is declared dead by the driver
> > after exhausting all possible attempts to recover it from driver context."
> 
> Can't this be used?
> 
> "The only exception to this is WEDGED=none, which signifies that the device
> was temporarily ‘wedged’ at some point but was recovered from driver context
> using device specific methods like reset. No explicit recovery is expected
> from the consumer in this case, but it can still take additional steps like
> gathering telemetry information (devcoredump, syslog). "
> 
> If not will replace it with the gt_wedged function and block ioctls using
> recovery flag

You can block ioctls by setting wedged.flag to prevent userspace access
while the PCI core performs bus reset, but the event itself depends on the
result of it.

If it succeeds then WEDGED=none would be more appropriate, as the user will
need to reload context and recreate buffers without recovering the device
(similar to AMD usecase). If it fails then we're officially 'wedged' and
tell the user to recover the device with explicit method.

Raag
