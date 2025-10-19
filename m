Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2ACCCD183
	for <intel-xe@archiver.kernel.org>; Sun, 19 Oct 2025 15:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2624D10E216;
	Sun, 19 Oct 2025 15:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PhlP99MN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCFF10E216
 for <intel-xe@lists.freedesktop.org>; Sun, 19 Oct 2025 15:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760889309; x=1792425309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IGaOqCaBT8tAB62eTMsjntSaDzmOj0/AgNQnUFDBrCA=;
 b=PhlP99MN5LowH5JJi44Pv2b0SpkVmMdjgKKUdKZK3L/miXhYLaoNHH/l
 7O4NUcEBOa7Dr9l6cv22yMDMXyp3YYiyXZEJuzul0IT2JSecsfGdEAsGR
 RAuqsKRqjmJeJ4D4/0wODliT0uJRPhV+0zgNQ+nZbQ71aDdZiSbhtuWEV
 ciGlyC9niL6ghtoN6eVHb6OqUf4t9D0Xu8tA5KULylD0u6a/YX5rJs8BW
 Tr8yeyXlfHtDbRUBTSIecfRQsRTTPbQ5PiP33ohA9yukFYJeaybN9Eaqe
 ZCnlbOGk0ZAOSa9HZ9wn4QmAcdQkB+qTI0jEGcfsRXPJ7gJbwo5MHFsKE w==;
X-CSE-ConnectionGUID: HyKXJJ1kQ1quEZ0hIULVlA==
X-CSE-MsgGUID: dJB3I1aSQRyE19pAqFoE2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62948099"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62948099"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 08:55:09 -0700
X-CSE-ConnectionGUID: +/K3OahYQBqY9IQAt9vtew==
X-CSE-MsgGUID: WnRkKdZkS661ZKKVvrDWaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; d="scan'208";a="188245244"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 08:55:08 -0700
Date: Sun, 19 Oct 2025 17:55:04 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, lucas.demarchi@intel.com
Subject: Re: [PATCH] drm/xe/xe_survivability: Add support for survivability
 mode v2
Message-ID: <aPUJ2JfS5UNFgMTH@black.igk.intel.com>
References: <20251014053257.3417575-2-riana.tauro@intel.com>
 <aPFE4hIJKUKh1pjz@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPFE4hIJKUKh1pjz@intel.com>
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

On Thu, Oct 16, 2025 at 03:17:54PM -0400, Rodrigo Vivi wrote:
> On Tue, Oct 14, 2025 at 11:02:58AM +0530, Riana Tauro wrote:
> > v2 survivability breadcrumbs introduces a new mode called
> > SPI Flash Descriptor Override mode (FDO). This is enabled by
> > PCODE when MEI itself fails and firmware cannot be updated via
> > MEI using igsc. This mode provides the ability to update
> > the firmware directly via SPI driver.
> > 
> > Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> > 
> > Userspace should check FDO mode entry in survivability sysfs before
> > using the SPI driver to update firmware.
> > 
> > v2 also supports survivability mode for critical boot errors.
> > 
> > 	cat /sys/bus/pci/devices/0000\:03\:00.0/survivability_mode
> > 
> >                Capability Info: 0x138320 - 0x2001ae06
> >                Postcode Info: 0x138324 - 0x0
> >                Overflow Info: 0x138328 - 0x0
> >                Auxiliary Info 0: 0x13832c - 0x0
> 
> I am truly sorry here, but although I was the one that designed this,
> looking it now, I realized that this is breaking the sysfs rules
> of one value per file and no fancy format. This is only allowed in
> the debugfs.
> 
> We need to change this asap, and with help from any tool that
> might be already consuming this.
> 
> >                FDO Mode: enabled
> 
> After we fix that we can come and add this.
> 
> About our options: I don't believe that debugfs is an option
> without the drm card right?
> 
> Perhaps what we need is to transform survivability_mode in
> the directory. Each entry becomes a file in this directory.
> 
> Sorry,
> Rodrigo.

Tried discussing in this direction[1], but not very convincingly I guess.

[1] https://lore.kernel.org/intel-xe/aIDrCMRK2gPGmIs6@black.fi.intel.com/

Raag
