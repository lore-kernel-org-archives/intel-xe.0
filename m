Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7057AC83F1A
	for <intel-xe@archiver.kernel.org>; Sat, 12 Jul 2025 05:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A09310E0CD;
	Sat, 12 Jul 2025 05:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azHPy/Ma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B85210E0CD
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Jul 2025 05:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752299106; x=1783835106;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GH0/EI0jrwvkZz0McEKB1o6ewt8Q3cS1MndUI7KktlQ=;
 b=azHPy/MauMSLEBYe+wBG/xYiR+sAPEtX0ToyuSHw1QV3iWRoATLoCMI+
 1BcIA4xM6tO1ghRcI8Ytv6Bap0aAJd9vr6bxxFLIQdy3MsfpBJUGNZCF6
 HkDpndPYJ9b6735Ubr5WmdIhLJA/U2iA19CbFLR9NOMUdUzOkjDVsZLl5
 NtfvC3AgRQG/20h6aLFeMB+VjP3qunaY/krqgj5qkNd+aaYOZSjOgNdVL
 ZIEcIfDI+3At631agKSUj1AWsYRIbtenxExq4T8HIYAOu2B3vTmBF7VYL
 mluWUxr+fm3pLltZmox1iDYxqjyvbnjAELMUcfxpCeqVjiIy56Azz8HEb A==;
X-CSE-ConnectionGUID: tf0zNTABRwq18gGvKWb5WQ==
X-CSE-MsgGUID: hmk86POiQdK2kJQuoCTn/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="42220670"
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; d="scan'208";a="42220670"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 22:45:06 -0700
X-CSE-ConnectionGUID: 8ueub4q7QziEa0Q0ttnMkA==
X-CSE-MsgGUID: 1bh5sea4SsueFaBrnzGqTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; d="scan'208";a="157068771"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 22:45:03 -0700
Date: Sat, 12 Jul 2025 08:45:00 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH v4 6/9] drm/xe/doc: Document device wedged and runtime
 survivability
Message-ID: <aHH2XGuOvz8bSlax@black.fi.intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-7-riana.tauro@intel.com>
 <aHCjdQ_jcC8MvhvM@black.fi.intel.com>
 <0db2f198-433a-477d-bea8-81a1abba2b27@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0db2f198-433a-477d-bea8-81a1abba2b27@intel.com>
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

On Fri, Jul 11, 2025 at 11:39:22AM +0530, Riana Tauro wrote:
> On 7/11/2025 11:09 AM, Raag Jadav wrote:
> > On Wed, Jul 09, 2025 at 04:50:18PM +0530, Riana Tauro wrote:
> > > Add documentation for vendor specific device wedged recovery method
> > > and runtime survivability.
> > 
> > ...
> > 
> > > + * Runtime Survivability
> > > + * =====================
> > > + *
> > > + * Certain runtime firmware errors can cause the device to enter a wedged state
> > > + * (:ref:`xe-device-wedging`) requiring a firmware flash to restore normal operation.
> > > + * Runtime Survivability Mode indicates that a firmware flash is necessary to recover the device and
> > > + * is indicated by the presence of survivability mode sysfs::
> > > + *
> > > + *	/sys/bus/pci/devices/<device>/survivability_mode
> > > + *
> > > + * Survivability mode sysfs provides information about the type of survivability mode.
> > > + *
> > > + * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
> > > + * survivability mode. User can then initiate a firmware flash to restore device to normal
> > > + * operation.
> > 
> > Do we have definition on actual procedure? Can we add a reference to it?
> > Otherwise it's telling me to do something I have no idea about.
> 
> That is a userspace tool. I don't see any kernel code refering to userspace
> documentation.

How are we expecting users to be know about it?

Raag
