Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A100BFCC056
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 18:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524DF10E3DC;
	Fri,  6 Mar 2026 18:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ur96Nxug";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF43910E3DC
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 18:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772822229; x=1804358229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RnjiEdwSViqVQfOn8lHyyk4/V235JBexvsuxe8uoZEk=;
 b=Ur96NxugLy4nkeEgtXIIPiWCWHiMXQJmkUlL+6WYsdxVVwfpMu8NS+US
 oLIrZagIL+bkYmRjezU1IpvlByqLO0lnj8PaMJMB4vekEMe2caC5eWzNf
 cnKw0ffODlbcIBvUb8aa7gkpX7K05WJX74gEjTp/YWiziMG8Rdk0t6yD9
 nM0GSsCBrKMykT1uznlGhaaSUdJljk1FRQkxqHH+XyN0lyeWmvJe5Do66
 C1wOk08g5c9H/vnGg5yigXQ9EOz9g8Hg/dhVu0NjLLGuIcbMAWYE4IS8t
 0o151+Uu4Hyk73bRAlrLqnqvq/m5BYw2vfaXaDkPA9lLhOdBp52PZuJ/5 g==;
X-CSE-ConnectionGUID: X0cUyL5PS5OPOf1qNuCDsQ==
X-CSE-MsgGUID: fQyDOWFWSvWw1cSt9Itfjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="72962849"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="72962849"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 10:37:09 -0800
X-CSE-ConnectionGUID: fqKZMOGoSmyY08yVWqcf0w==
X-CSE-MsgGUID: OfLv/PJVQdOf2bI5PfH9qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="219079546"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 10:37:06 -0800
Date: Fri, 6 Mar 2026 19:37:03 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH v2 08/11] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
Message-ID: <aasezzxs0JbdMn2S@black.igk.intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-21-riana.tauro@intel.com>
 <aahjUV9VPkT11a85@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aahjUV9VPkT11a85@black.igk.intel.com>
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

On Wed, Mar 04, 2026 at 05:52:38PM +0100, Raag Jadav wrote:
> On Mon, Mar 02, 2026 at 03:52:03PM +0530, Riana Tauro wrote:
> > Uncorrectable Core-Compute errors are classified into Global and Local
> > errors.
> > 
> > Global error is an error that affects the entire device requiring a
> > reset. This type of error is not isolated. When an AER is reported and
> > error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
> > 
> > A Local error is confined to a specific component or context like a
> > engine. These errors can be contained and recovered by resetting
> > only the affected part without distrupting the rest of the device.
> > 
> > Upon detection of an Uncorrectable Local Core-Compute error, an AER is
> > generated and GuC is notified of the error. The KMD then sets
> > the context as non-runnable and initiates an engine reset.
> > (TODO: GuC <->KMD communication for the error).

...

> > +	} while (response.additional_errors);
> 
> I know we're not NASA but I'd try to have some timeout instead of blindly
> trusting the hardware.

Or just break on something like MAX_ADDITIONAL_ERRORS if (by any luck)
it's mentioned in spec.

Raag
