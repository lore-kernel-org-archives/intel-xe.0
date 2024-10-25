Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86401D149E8
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 19:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C91B10E055;
	Fri, 25 Oct 2024 19:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XbqDcsdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC1010E055
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 19:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729883059; x=1761419059;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H3lkvZxcNF2K09bz2aMV3QCnhZKHVizCg5q1Pj4nYFg=;
 b=XbqDcsdRhUhxYuioY6Yexv9x8Gsq3o7Vo3eZmyw4FgAA6KNoYrFlPuH+
 5EpeCpTMiCN6KLIvIetX6/GNERDinWq+CeH8Fw8JmRvXcLwnPMdjh2Lel
 1rsObGDgriC3dbcD3TCCIr2wmErYkWg1PKHTpsKwG2OBqXP8IZuj1XevL
 ZLl9w45KJOQKVTd3VO56d38qbFbWCQ2fhZtgDAT3UhPCe7VAtTlp8UDNe
 28uZHGDKHoiDQ5D0MJVC0OlbI1fthfwytw5K4NaJD4zckENUgfwN4PxPs
 jRHaz95APXWsvPDrtMCJARTsv8EJcyonVknfNkux10jgAkfy55UarXdJj w==;
X-CSE-ConnectionGUID: 6tiM+z2MRsiKMIZW9w4NAg==
X-CSE-MsgGUID: b2SEvddVROS0pMCEOGuWKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33258855"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33258855"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:04:19 -0700
X-CSE-ConnectionGUID: vgd/hBqpT8qxpsNoMMw/6Q==
X-CSE-MsgGUID: Bja/5tpDTUCjniNOtmk9VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="111806819"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:04:16 -0700
Date: Fri, 25 Oct 2024 22:04:14 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: lucas.demarchi@intel.com, John.C.Harrison@intel.com,
 rodrigo.vivi@intel.com, andi.shyti@linux.intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v1] drm/xe: Rework throttle ABI
Message-ID: <Zxvrri2LSkodxC-g@black.fi.intel.com>
References: <20241025092238.167042-1-raag.jadav@intel.com>
 <20241025170341.GQ5725@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025170341.GQ5725@mdroper-desk1.amr.corp.intel.com>
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

On Fri, Oct 25, 2024 at 10:03:41AM -0700, Matt Roper wrote:
> On Fri, Oct 25, 2024 at 02:52:38PM +0530, Raag Jadav wrote:
> > Current implementation adds multiple sysfs entries for getting GT
> > throttle status and its reasons, which forces the user to read multiple
> > entries for evaluating the result. Since output of each entry is based
> > on the same underlying hardware register and considering the access type
> > of this register is RO/v, the value of this register can change at any
> > given point, even between subsequent sysfs reads. This makes current
> > implementation fundamentally flawed which can produce inconsistent results.
> > 
> > Rework throttle ABI and introduce throttle_status attribute which will
> > provide throttle status through a oneshot register read, making it
> > relatively less error prone. The new ABI will provide throttle reasons
> > in a string based list based on the respective bits which are set in the
> > hardware. Empty output means no bits are set and hence no throttling.
> 
> But the old ABI is already released, and we have platforms with
> force_probe lifted already.  Presumably userspace software is already
> using the existing interface (otherwise it never would have been allowed
> to land upstream), so that means we can't change it in incompatible ways
> anymore; we're locked into supporting the current interface forever on
> these platforms.
> 
> We can change the ABI for _future_ platforms if it makes sense, but it's
> too late to make compatibility-breaking changes for LNL and BMG.

It landed upstream pretty recently AFAICT, atleast in xe.
So maybe worth reconsidering.

> > 
> > $ cat /sys/devices/.../tile0/gt0/freq0/throttle_status
> > prochot
> > thermal
> > ratl
> > thermalert
> > tdc
> > pl4
> > pl1
> > pl2
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810
> 
> I'm not sure what this ticket is about, but it was already closed
> several weeks ago due to no longer reproducing.

I'm sure we all have our "it works on my machine" moment :D

> The ABI change here doesn't seem to be directly related to this ticket.

We can always create new tickets, and that's not the point.
The point is we're stuck with unreliable ABI.

Side note: The logs in the ticket may help connect the dots with commit message.

Raag
