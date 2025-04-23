Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73488C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 07:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1423B10E64E;
	Wed, 23 Apr 2025 07:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UX8fDhar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEA710E64E
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 07:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745393665; x=1776929665;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R6Aj3KkHezJTRcYk5Szky3dmDJ3vNxsn+G+tpCWwKew=;
 b=UX8fDhar9oKaQ1vuQKXLM8AISnwFm001CQBronB7bmkvL8rjJ5+n5Izb
 g8XrqELdUYQOM6lTQGKoOCpLb/yl/hNQ+FzAxKtmAs5DS78UZI1ONLa2q
 bUGn+VF96K+gM5w8EgNPsh6TUtBatEDZTKB1BRJqGBccm/qRZh+XOf7Fq
 KJ2OvH3TGBTA5GTo9Tjsx803pldNuedKBKqZfnayr0uifB+mzpZh7xpok
 ZsRDLAaYqaqP9DMr6cdtZDE6ALvZ+fKYeBi8qINLUCPpSGXNHAA+t6TmA
 CNlJq6BdcGr10W/s2DJmALYlfPohM7kPJgGBOUlmt1v/4Ci68jtYZp4nR Q==;
X-CSE-ConnectionGUID: PGfJiv8mSnWejX/i69MFdg==
X-CSE-MsgGUID: /KNN+xcJSTuSCCHeOt1a0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47101889"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47101889"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 00:34:24 -0700
X-CSE-ConnectionGUID: yxazorDKQGWAZuGAxMUY2g==
X-CSE-MsgGUID: adL/pegIS06f20qqtBVUKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132779072"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 00:34:21 -0700
Date: Wed, 23 Apr 2025 10:34:19 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Badal Nilawar <badal.nilawar@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ulisses Furquim <ulisses.furquim@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/hwmon: Fix kernel version documentation for
 temperature
Message-ID: <aAiX-26Rv5yA7Gnd@black.fi.intel.com>
References: <20250421-hwmon-doc-fix-v1-0-9f68db702249@intel.com>
 <20250421-hwmon-doc-fix-v1-1-9f68db702249@intel.com>
 <aAZ8qZytCQQrSLez@black.fi.intel.com>
 <uorgzeqaszua5ofvdff2u2y5gba5ctc5tq3ziu6voih6uceox5@jypdw3tcp2oe>
 <aAdGiAj31OBqIUpB@black.fi.intel.com>
 <m2phxj2zvpkil576b3u53yao3zxu3735nc65vnecx72qs3nwbm@5hi3453lepr5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m2phxj2zvpkil576b3u53yao3zxu3735nc65vnecx72qs3nwbm@5hi3453lepr5>
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

On Tue, Apr 22, 2025 at 02:42:46PM -0500, Lucas De Marchi wrote:
> On Tue, Apr 22, 2025 at 10:34:32AM +0300, Raag Jadav wrote:
> > On Mon, Apr 21, 2025 at 02:53:00PM -0500, Lucas De Marchi wrote:
> > > On Mon, Apr 21, 2025 at 08:13:13PM +0300, Raag Jadav wrote:
> > > > On Mon, Apr 21, 2025 at 08:15:38AM -0700, Lucas De Marchi wrote:
> > > > > Wrong copy and paste from other entries: these are starting to be
> > > > > supported with 6.15.
> > > >
> > > > I had an impression that we follow the upstream drm tree, but it seems not?
> > > 
> > > This is a simplified diagram on how it propagates to a X.Y kernel release:
> > > 
> > >                                                (a)
> > >         drm-xe/drm-xe-next  ->  drm/drm-next   ->  linus/master
> > >                         |                      (b)      |
> > >                         `---->  drm/drm-fixes  ->       `- <X.Y-rc1>
> > >                         `---->  drm/drm-fixes  ->       `- <X.Y-rc2>
> > >                                                         `- ...
> > >                                                         `- <X.Y>
> > > 
> > > 	(a) 2-weeks merge window
> > > 	(b) weekly fixes propagation
> > > 
> > > We always first merge it to drm-xe-next, but depending on when we merge
> > > it, a **feature** may be targeting different kernel releases. As a rule of
> > > thumb, a -next branch always target either the next kernel release or
> > > next+1 in case current is already on ~ rc6. Fixes target the current or
> > > next release (depending if the current has the bug or not).
> > 
> > Yes, which makes targeting a release a bit fuzzy for the patches being
> > merged around -rc6 (unless we have a hard cut-off rule that I'm not
> > familiar with?).
> > 
> > Side node: This is definitely worth being somewhere in
> > https://dri.freedesktop.org/docs/drm/process/index.html
> 
> This page is not related to drm though: it's just the html-rendering of
> the entire kernel docs. Also, I don't see any other subsystem/tree
> detailing the "path to Linus".

I meant it's worth being informed to be able to target a release correctly
and you don't have to go around explaining each time.

> > (atleast for the folks who are new to drm)
> > 
> > > This sysfs documentation is for the end user and userspace developer: they
> > > have now idea (and shouldn't have) of any branch propagation in the
> > > kernel to get to a release. This propagation is not even stable across
> > > the different subsystems in the kernel.
> > 
> > Sure, so perhaps reflect this in the commit message?
> > I know we do it for other cases but being accused of copy paste doesn't
> > feel right :(
> 
> This is wrong for any subsystem and not only drm. If it was not a copy &
> paste mistake as I assumed, I can write something else in the commit
> message. Please don't view it as me accusing you of anything: it's just
> the most common mistake and I assumed it was the case for missing it in
> both instances. Would it be better like below?
> 
> 	The version in the sysfs attribute should correspond to the version in
> 	which this is enabled and visible for end users. It usually doesn't
> 	correspond to the version in which the patch was developed, but rather
> 	a release that will contain it.

With that feel free to add to the series

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
