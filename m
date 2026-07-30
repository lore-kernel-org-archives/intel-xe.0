Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5437C55160
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE9610EEFE;
	Thu, 30 Jul 2026 11:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmGALzWL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1B110EEFE
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 11:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409851; x=1816945851;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Pu90czNDDrkZwTuQIIkhZUSWgXJ4O2fCXr2mFxmOR+o=;
 b=gmGALzWLqBvm6bkv4wGsVCCD4n4Ra4vI0lBGaLWg/yGDraQiCx+OzuIS
 2f6PAcEqRU+KLRBe0zeLfPpeT1Hgueu6Rxk8Cge0MC5ZPtd+JcW9HkUyB
 UZrfIjBOfqwk8A+1RHrolfssXFylbkXcpunBjn3kEzeNDxlKqUpehdk/A
 kHQ6YZmnnN27iOHkqA/oOtIzrb2ACsryoJvjKD2beMaKKNp8ko5XxINun
 EU/HzqizfNjIw+Le1pyfEKAfK47cObAXen495+/VR/OCjhjtOU5Q5I5yu
 0KIcpNTHK8/8x6vEPQp2CwwktU8b1M4qI0yF4/WJP9O4P8jucltR6aplV w==;
X-CSE-ConnectionGUID: kvRbSf8BSG6HVZJFF3yePA==
X-CSE-MsgGUID: o9pCoeTbSsOCGXMgtL22YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97182509"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="97182509"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:10:51 -0700
X-CSE-ConnectionGUID: u3/t+RKsQ4WR3jg0u/YrQg==
X-CSE-MsgGUID: 03gPVHEfQES2+L+ojZOtTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="256934004"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:10:47 -0700
Date: Thu, 30 Jul 2026 13:10:45 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, vinay.belgaumkar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH] drm/xe/ras: Split RAS init into xe_ras_init_early and
 xe_ras_init
Message-ID: <amsxNU0TuoxTtyv-@black.igk.intel.com>
References: <20260730065430.902562-2-mallesh.koujalagi@intel.com>
 <amsSC57qtHNAj4gs@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amsSC57qtHNAj4gs@black.igk.intel.com>
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

On Thu, Jul 30, 2026 at 10:57:51AM +0200, Raag Jadav wrote:
> On Thu, Jul 30, 2026 at 12:24:31PM +0530, Mallesh Koujalagi wrote:
> > xe_ras_init() was doing two unrelated things: setting up internal
> > bookkeeping needed before interrupts start, and querying firmware
> > errors that can only be done safely after the device is registered.
> > 
> > Split it into two functions with clear responsibilities:
> > 
> > - xe_ras_init_early(): runs early, before interrupts are enabled.
> > 
> > - xe_ras_init(): runs after the device is registered.
> 
> Why not just xe_ras_process_errors() after drm_dev_register() and keep
> the rest as is?
> 
> With,
> 
> Fixes: d9732e498f5f ("drm/xe/xe_ras: Query errors from system controller on probe")

I just realized this actually introduces another problem. I have a bit more
robust fix[1]. Feel free to review.

[1] https://lore.kernel.org/intel-xe/20260730110635.925537-1-raag.jadav@intel.com

Raag

> Also, IIUC process_hw_errors() suffers from the same problem after commit
> a7df563b45b0 ("drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware
> errors"), which we also might want to fix at some point.
