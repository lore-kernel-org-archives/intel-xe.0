Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1180C30653
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 13:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A775310EAF6;
	Thu,  4 Jul 2024 13:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7pyHEcv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4FA10EAF6
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720099774; x=1751635774;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Iqp+3lVm9heGrvmPbGnu1rMGMwOhoO1RUs3qwuQQAeA=;
 b=W7pyHEcv1RlLEd4kmFsZ282lRhUIca3Jp84sX/kRvRJC1ahRAcB/HRy3
 nATHb8VM+EvHX6/6N/P8yu5EYLsM8BF095smsfhzasxO8ZlGVGqeyZUb4
 x4ffY78lShG5hl+O5KK9hMR73RhFPoKkXOOIS9+NR7OFXKHjxRxa4d3Cx
 yZexHqrzq2jZYbMMTn0bzmL0YZZiaJQQGw2B5QOYTjQhXT8K0assmT5wa
 WaXTlvwm1bF9fQpqnLu5FtYDhxNoKRbSOwFCbAGx+ewMMzmbsasCfFZpW
 43fdMZpeqPHuiqDcBZr4E03PWF9g+/2ElYKdY3BSjTzcfW6+iEK5ETFAl Q==;
X-CSE-ConnectionGUID: Km2TDAceQ3y2AY6lSiJ2fA==
X-CSE-MsgGUID: ww+xz6erQnOE9xnnmdNZ5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21188762"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="21188762"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 06:29:33 -0700
X-CSE-ConnectionGUID: gszuHjPRSYSKM+6raezFuQ==
X-CSE-MsgGUID: LyNHJw3FRve8BzxjmZsYSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46566116"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Jul 2024 06:29:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Jul 2024 16:29:29 +0300
Date: Thu, 4 Jul 2024 16:29:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org, ryszard.knop@intel.com,
 ewelina.musial@intel.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVA==?= =?utf-8?Q?=3A?= success for Reapply
 "drm/xe/gsc: define GSC FW for LNL"
Message-ID: <ZoajuaN7JrWYAOwI@intel.com>
References: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
 <171988208839.3729.11952250272154489901@2413ebb6fbb6>
 <mxtejwnl6xie7a7py2ntnrbq5s57o5ho4exy3gygwggau4hgt5@lg3ixotyab4j>
 <790e4a09-a383-47fd-8c1d-2b8994c6c0b4@intel.com>
 <ct6pqzwxnhlmgkal5yjbaaukl7kcshlg2ifhjiodxu464o4xth@6lnkhu7lrwck>
 <11752a39-1aa0-4140-bc26-15283f045607@intel.com>
 <2urugervd3spw4vtlkpxu4z2rwd3axojxponwhpnwutv662ntj@p3mr6qxe7kh4>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2urugervd3spw4vtlkpxu4z2rwd3axojxponwhpnwutv662ntj@p3mr6qxe7kh4>
X-Patchwork-Hint: comment
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

On Wed, Jul 03, 2024 at 03:22:04PM -0500, Lucas De Marchi wrote:
> On Wed, Jul 03, 2024 at 09:38:54AM GMT, Daniele Ceraolo Spurio wrote:
> >
> >
> >On 7/2/2024 11:02 AM, Lucas De Marchi wrote:
> >>On Tue, Jul 02, 2024 at 09:25:31AM GMT, Daniele Ceraolo Spurio wrote:
> >>>
> >>>
> >>>On 7/2/2024 7:29 AM, Lucas De Marchi wrote:
> >>>>On Tue, Jul 02, 2024 at 01:01:28AM GMT, Patchwork wrote:
> >>>>>== Series Details ==
> >>>>>
> >>>>>Series: Reapply "drm/xe/gsc: define GSC FW for LNL"
> >>>>>URL   : https://patchwork.freedesktop.org/series/135623/
> >>>>>State : success
> >>>>>
> >>>>>== Summary ==
> >>>>>
> >>>>>CI Bug Log - changes from 
> >>>>>xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -> 
> >>>>>xe-pw-135623v1_BAT
> >>>>>====================================================
> >>>>>
> >>>>>Summary
> >>>>>-------
> >>>>>
> >>>>> **SUCCESS**
> >>>>>
> >>>>> No regressions found.
> >>>>>
> >>>>>
> >>>>>
> >>>>>Participating hosts (5 -> 4)
> >>>>>------------------------------
> >>>>>
> >>>>> Missing    (1): bat-lnl-1
> >>>>
> >>>>I guess it didn't really work. +Ryszard +Ewelina: Can we promote LNL to
> >>>>be considered "a reliable machine from the CI POV" so we don't have
> >>>>"CI.BAT: success" when LNL execution is missing?  Or is there any other
> >>>>reason why we report success in this case?
> >>>
> >>>Damn. I can't repro the issue anymore with this WA applied and 
> >>>even in CI we weren't seeing it when I sent it for testing before: 
> >>>https://patchwork.freedesktop.org/series/134099/ . I did 3 runs in 
> >>>that case and none of them hit the problem.
> >>>
> >>>I've triggered another run to see if we get any better logs.
> >>
> >>this change should NOT make the machine "go missing" really. Actually no
> >>change to xe-only should really make a machine not have any log at
> >>all....
> >>
> >>I believe it was a very unfortunate coincidence and there must be a
> >>network issue or the like... but we can't consider success when we don't
> >>have a report for LNL. Particularly for this patch since LNL is
> >>the only affected platform.
> >>
> >>"try again"  in patchwork sounds good for now.
> >
> >It died again, but this time we got some logs. It died during an fbdev 
> >test, which makes me think this is due to the display side of the WA 
> >still being missing. I'll try again to repro locally and if I can't 
> >I'll send a patch to move the FB out of stolen and see what happens.
> 
> I think it needs to be out of stolen, no way around it.  We are fencing
> the number of writes, but if the fb, that is user-accessible, is
> allocated in stolen, there's no way to do that.
> 
> Also, I have no idea why it's currently in stolen. Looking at
> 
 	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135667v5/bat-lnl-1/dmesg0.txt
> 
> 	<7>[  321.798108] xe 0000:00:02.0: [drm:intelfb_create [xe]] no BIOS fb, allocating a new one
> 	<6>[  321.798743] xe 0000:00:02.0: [drm] Allocated fbdev into stolen
> 	<7>[  321.803371] xe 0000:00:02.0: [drm:intelfb_create [xe]] allocated 2880x1800 fb: 0x01621000
> 
> so, we failed to get the fb from BIOS that would be in stolen (why? not
> sure), then we go ahead and allocate in stolen, for what benefit?

Using stolen for this is not entirely unreasonable as otherwise it
might just be completely wasted memory.

Though we should probably have a bit better policy than the current
"1/2 of stolen". A more sensible policy would be "make sure we leave
enough for FBC". The problem is deciding what is actually reasonable.
One easy idea would be to just do something along the lines of
intel_fbc_cfb_size(intel_fbc_max_plane_size()). I'll see about cooking
up something like that...

> 
> It seems like drivers/gpu/drm/xe/display/intel_fbdev_fb.c is already
> missing the MTL WA that avoids stolen

Technically we shouldn't need that w/a on MTL as we now bypass
LMEMBAR and access stolen directly.

-- 
Ville Syrjälä
Intel
