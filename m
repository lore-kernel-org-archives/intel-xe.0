Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3696AD116F3
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 04:51:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CF210E169;
	Thu, 27 Nov 2025 04:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKOmE1Yt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00D510E169
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 04:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764219090; x=1795755090;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YaeAfsq1rHLF/+vHWt2BUe8h9Go0gMjnld+T3XWiTA0=;
 b=PKOmE1Yt9lkUJH3Ta242x4Kyt2HNachvQnaYGiAb+RR6kth1DI7d3UCB
 lFQHE/a1gEo5M+mtROwHn/rsk1xEjqMbHVTTOrassQfXKx+4MyLMCeGVW
 lWAAy33rDLUmIzNrAku0mUoAjS9hBiN0+6YWvltgdmEdsi4OnqnFmzh5L
 FGUK5RVOpXYTVWmyk5dTI4nF6ja7iYGGxo1AYa1geHi9AbDQaJVbVPpHs
 Ycf1PhJLrsDQHFe1yDu8N4i5CoDbgIt8FmUHdTocYe0r4iGkSOwTh0CIp
 VM4SNRYkMItPIaGrKWmYN+5WdUUbbTNJgpW+LZPJrdhazqq6jqo/orfze Q==;
X-CSE-ConnectionGUID: kgymSadyQjm9y3wB5BTy/w==
X-CSE-MsgGUID: 7SOZx15HTo61QOW76pWL7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66336823"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="66336823"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 20:51:30 -0800
X-CSE-ConnectionGUID: oh7j86C3RbGB9QCZzDFnMQ==
X-CSE-MsgGUID: fI5/ubYJQraK3hfVj7jyuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="197457360"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 20:51:27 -0800
Date: Thu, 27 Nov 2025 05:51:24 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, jani.nikula@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, anshuman.gupta@intel.com
Subject: Re: [PATCH v1 1/4] drm/xe/pcode: Introduce xe_pcode_read_probe()
Message-ID: <aSfYzJdEkOwgays3@black.igk.intel.com>
References: <20251118090012.608250-1-raag.jadav@intel.com>
 <20251118090012.608250-2-raag.jadav@intel.com>
 <aRx3u9LuWvhGvMZj@intel.com> <aRyTBkBgFK3OO_wT@black.igk.intel.com>
 <wcfsfjjncwfb5mwjkdixeqvmjvtfnr6vzx7bpwwu6jrbhoal24@orkpmm6x6nbh>
 <aSAj4aAKMH_isOvJ@black.igk.intel.com>
 <aSU4-yEwEMlJEhjA@black.igk.intel.com> <aSXqY7Yhz3qlMYtN@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSXqY7Yhz3qlMYtN@intel.com>
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

On Tue, Nov 25, 2025 at 12:41:55PM -0500, Rodrigo Vivi wrote:
> On Tue, Nov 25, 2025 at 06:04:59AM +0100, Raag Jadav wrote:
> > On Fri, Nov 21, 2025 at 09:33:42AM +0100, Raag Jadav wrote:
> > > On Thu, Nov 20, 2025 at 09:02:29AM -0600, Lucas De Marchi wrote:
> > > > On Tue, Nov 18, 2025 at 04:38:46PM +0100, Raag Jadav wrote:
> > 
> > ...
> > 
> > > > > > xe_pcode_read_if_supported
> > > > > > (Explicit about conditional support.)
> > > > > 
> > > > > I don't even begin to qualify here so it's upto you all.
> > > > 
> > > > xe_pcode_read_if_supported() would be ok IMO, documenting it to mask
> > > > not-supported errors.
> > > > 
> > > > But the the way this is implemented with the extra flag seems weird.
> > > > By "having the caller check" I think it's about handling
> > > > the return code from this function and treating it as a fatal or normal
> > > > case depending on the command being sent, if there's a fallback etc.
> > > > This patch seems to add a function and not used it, but I may be missing
> > > > something.
> > > 
> > > Forgot to doc. I had an impression that -ENXIO could be used for the
> > > fallback since we already have it here but ...
> > > 
> > > > I'd rather have this:
> > > > 
> > > > 1) Caller should handle errors and treat it as fatal or normal,
> > > >    depending on having a fallback or not. Emit an err there if
> > > >    appropriate rather than here. It seems we are already emitting
> > > >    additional dbgs in the caller for when pcode_read fails
> > > > 
> > > > 2) What is the command/subcommand triggering this error? We could have a
> > > >    helper like xe_pcode_strerr() that users could call if needed (but
> > > >    then we'd need to return the undecoded error), or we could change
> > > >    this specific return code to -ENOTSUPP.
> > > 
> > > ... converting to -ENOTSUPP makes much more sense, considering the undecoded
> > > return will be inconsistent with other pcode helpers.
> > 
> > On second thought, looking at it from caller standpoint, I'm wondering why
> > this shouldn't be the expectation with xe_pcode_read() itself?
> > 
> > I'm okay with the new helper but if we're claiming that something happens
> > *only* if supported, I'd expect it to be the default behaviour instead of
> > having extra bells and whistles. The only difference here is how the caller
> > chooses to treat it (-ENOTSUPP) anyway.
> > 
> > Thoughts?
> 
> It makes sense to me. I'd just peak into the history to see if there was any
> documented reason for the current code or just some bad decision/judgement
> from my side when adding that... if so, I'm sorry in advance...

Don't get me wrong, I still fully believe that we should not let this be
an excuse for callers to attempt random commands and abuse the mailbox.
So for now we facilitate the fallback for xe_pcode_read() only and let
other helpers operate as they are.

With that we'll also have the flexibility to change the behaviour per
helper in the future.

Sound okay?

Raag
