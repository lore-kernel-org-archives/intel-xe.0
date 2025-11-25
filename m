Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F81CFD36C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 05:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4C610E150;
	Tue, 25 Nov 2025 05:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5agm/XI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E11710E150
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 05:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764047106; x=1795583106;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=czm7XjVQl+F0i4lp3scbZSalP1KG0F2koddp9rYeb5Y=;
 b=E5agm/XIC97g/QSCykg6gbkYJiY8fxzCLG5ATUh6m855yqlZ4nDj3HAq
 AC/LRG8Ghk3556facFe1zE6aT8BdVhpU7erdWi5g74QsvZf31C7DvoEMn
 WM59PyXY7B7f+3rhRR8WPts2nMfmzl4KuR/ig6TCaDu9xdIJSUruqtN0u
 kY53JhZ/sQ0G108bEFu4dG41gglPy5z8HvMWkPV0kHz7Ucb+TQejWDNfP
 FiYRfiPMprD7ulE40HhshzLiDFWBweUE2ZqXGUGSTigP/X3fHduZ9sNPq
 5m2OT0iKvfyboArneU9I8rbvmQKf6LLvjGfTgl8NUZKB/t7spbm/EPlyK w==;
X-CSE-ConnectionGUID: qYvU6tf1RSKSJwe/LPcJ7A==
X-CSE-MsgGUID: SoshvUyoS7+o4RbVlH1BnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="53627125"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="53627125"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 21:05:05 -0800
X-CSE-ConnectionGUID: eJmvZFE3RgWX1If+oaF4bg==
X-CSE-MsgGUID: 8rBsiwOHQ+6gh59KrIonkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="192611430"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 21:05:02 -0800
Date: Tue, 25 Nov 2025 06:04:59 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, jani.nikula@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, anshuman.gupta@intel.com
Subject: Re: [PATCH v1 1/4] drm/xe/pcode: Introduce xe_pcode_read_probe()
Message-ID: <aSU4-yEwEMlJEhjA@black.igk.intel.com>
References: <20251118090012.608250-1-raag.jadav@intel.com>
 <20251118090012.608250-2-raag.jadav@intel.com>
 <aRx3u9LuWvhGvMZj@intel.com> <aRyTBkBgFK3OO_wT@black.igk.intel.com>
 <wcfsfjjncwfb5mwjkdixeqvmjvtfnr6vzx7bpwwu6jrbhoal24@orkpmm6x6nbh>
 <aSAj4aAKMH_isOvJ@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSAj4aAKMH_isOvJ@black.igk.intel.com>
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

On Fri, Nov 21, 2025 at 09:33:42AM +0100, Raag Jadav wrote:
> On Thu, Nov 20, 2025 at 09:02:29AM -0600, Lucas De Marchi wrote:
> > On Tue, Nov 18, 2025 at 04:38:46PM +0100, Raag Jadav wrote:

...

> > > > xe_pcode_read_if_supported
> > > > (Explicit about conditional support.)
> > > 
> > > I don't even begin to qualify here so it's upto you all.
> > 
> > xe_pcode_read_if_supported() would be ok IMO, documenting it to mask
> > not-supported errors.
> > 
> > But the the way this is implemented with the extra flag seems weird.
> > By "having the caller check" I think it's about handling
> > the return code from this function and treating it as a fatal or normal
> > case depending on the command being sent, if there's a fallback etc.
> > This patch seems to add a function and not used it, but I may be missing
> > something.
> 
> Forgot to doc. I had an impression that -ENXIO could be used for the
> fallback since we already have it here but ...
> 
> > I'd rather have this:
> > 
> > 1) Caller should handle errors and treat it as fatal or normal,
> >    depending on having a fallback or not. Emit an err there if
> >    appropriate rather than here. It seems we are already emitting
> >    additional dbgs in the caller for when pcode_read fails
> > 
> > 2) What is the command/subcommand triggering this error? We could have a
> >    helper like xe_pcode_strerr() that users could call if needed (but
> >    then we'd need to return the undecoded error), or we could change
> >    this specific return code to -ENOTSUPP.
> 
> ... converting to -ENOTSUPP makes much more sense, considering the undecoded
> return will be inconsistent with other pcode helpers.

On second thought, looking at it from caller standpoint, I'm wondering why
this shouldn't be the expectation with xe_pcode_read() itself?

I'm okay with the new helper but if we're claiming that something happens
*only* if supported, I'd expect it to be the default behaviour instead of
having extra bells and whistles. The only difference here is how the caller
chooses to treat it (-ENOTSUPP) anyway.

Thoughts?

Raag
