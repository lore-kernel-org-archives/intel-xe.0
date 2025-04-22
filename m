Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F42C369CB
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 07:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C5010E0F6;
	Tue, 22 Apr 2025 07:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AH/wmavu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C38810E0F6
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 07:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745307277; x=1776843277;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tSFdcLEE18VBOu0Z4cVg8V033mnAyjn2rUka8pibqdU=;
 b=AH/wmavugZPJ8Ai6Jo+jIzFekTrDZPcJ+mZHwdiDw8pMQSLyX7es4avG
 kqZ21JvZyTGfalTej37bTKXLqx+Bz05tPG5Qud4x3/ejsUsGHZ9W4okQd
 nq3oQYvRxGrsA0C0L4k72xornaYyKOg8mx3t+r7k3oyzmRjVx1FadBmGy
 WpIyh86q+zipm+0Y5BBNlbybgCjdkEIKd1RLeBBVlM0WHp8NQEPaS2+LH
 N3qupcbeItp+Q9Fu3FCncoRNZBA4KUnKxdpfBRcRgrI4UcD1vRQEo51bT
 Y+zkDZUdJSOk6iVbPfFcThk3Tm2BCOjOgUbfwoesEAACjQTXoIeebctpr A==;
X-CSE-ConnectionGUID: jnY0DYU+R7eKXE19mRYLsw==
X-CSE-MsgGUID: vSeMAa5NQDiP3LMmCgSdNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="58226556"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="58226556"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 00:34:37 -0700
X-CSE-ConnectionGUID: VfHbtOKGQmW6jeGxiPV0Gw==
X-CSE-MsgGUID: JgnfulKSQfyKhzmZgC7FXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="132814278"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 00:34:35 -0700
Date: Tue, 22 Apr 2025 10:34:32 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Badal Nilawar <badal.nilawar@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ulisses Furquim <ulisses.furquim@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/hwmon: Fix kernel version documentation for
 temperature
Message-ID: <aAdGiAj31OBqIUpB@black.fi.intel.com>
References: <20250421-hwmon-doc-fix-v1-0-9f68db702249@intel.com>
 <20250421-hwmon-doc-fix-v1-1-9f68db702249@intel.com>
 <aAZ8qZytCQQrSLez@black.fi.intel.com>
 <uorgzeqaszua5ofvdff2u2y5gba5ctc5tq3ziu6voih6uceox5@jypdw3tcp2oe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uorgzeqaszua5ofvdff2u2y5gba5ctc5tq3ziu6voih6uceox5@jypdw3tcp2oe>
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

On Mon, Apr 21, 2025 at 02:53:00PM -0500, Lucas De Marchi wrote:
> On Mon, Apr 21, 2025 at 08:13:13PM +0300, Raag Jadav wrote:
> > On Mon, Apr 21, 2025 at 08:15:38AM -0700, Lucas De Marchi wrote:
> > > Wrong copy and paste from other entries: these are starting to be
> > > supported with 6.15.
> > 
> > I had an impression that we follow the upstream drm tree, but it seems not?
> 
> This is a simplified diagram on how it propagates to a X.Y kernel release:
> 
>                                                (a)
>         drm-xe/drm-xe-next  ->  drm/drm-next   ->  linus/master
>                         |                      (b)      |
>                         `---->  drm/drm-fixes  ->       `- <X.Y-rc1>
>                         `---->  drm/drm-fixes  ->       `- <X.Y-rc2>
>                                                         `- ...
>                                                         `- <X.Y>
> 
> 	(a) 2-weeks merge window
> 	(b) weekly fixes propagation
> 
> We always first merge it to drm-xe-next, but depending on when we merge
> it, a **feature** may be targeting different kernel releases. As a rule of
> thumb, a -next branch always target either the next kernel release or
> next+1 in case current is already on ~ rc6. Fixes target the current or
> next release (depending if the current has the bug or not).

Yes, which makes targeting a release a bit fuzzy for the patches being
merged around -rc6 (unless we have a hard cut-off rule that I'm not
familiar with?).

Side node: This is definitely worth being somewhere in
https://dri.freedesktop.org/docs/drm/process/index.html
(atleast for the folks who are new to drm)

> This sysfs documentation is for the end user and userspace developer: they
> have now idea (and shouldn't have) of any branch propagation in the
> kernel to get to a release. This propagation is not even stable across
> the different subsystems in the kernel.

Sure, so perhaps reflect this in the commit message?
I know we do it for other cases but being accused of copy paste doesn't
feel right :(

> > > Fixes: dac328dea701 ("drm/xe/hwmon: expose package and vram temperature")
> > > Reported-by: Ulisses Furquim <ulisses.furquim@intel.com>
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4840
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > index adbb9bce15a5d..6fbab98fb639d 100644
> > > --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > @@ -111,7 +111,7 @@ Description:	RO. Package current voltage in millivolt.
> > > 
> > >  What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
> > >  Date:		March 2025
> > > -KernelVersion:	6.14
> > > +KernelVersion:	6.15
> > 
> > Perhaps the date should match the release?
> > https://hansen.beer/~dave/phb/
> 
> from Documentation/ABI/README:
> 
> 	Date:           Date created
> 	KernelVersion:  Kernel version this feature first showed up in.
> 
> I don't think we need to try to predict the exact month a kernel release
> will happen. There would certainly be mistakes. "Date created" can
> simply be interpreted as when the feature merged in our branch and
> doesn't matter much. The more important part is the kernel version.

Perhaps the rules are different across subsystems but sure, makes sense.

Raag
