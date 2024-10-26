Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F74FD10BF6
	for <intel-xe@archiver.kernel.org>; Sat, 26 Oct 2024 11:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143EB10E011;
	Sat, 26 Oct 2024 11:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZiC2uuv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A38710E011
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Oct 2024 11:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729943901; x=1761479901;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZNQqNqlmyuPuvoyssQPm+CzHfz1Rht7aT4Sl0OWLvjM=;
 b=WZiC2uuvk6IAQqVlOMsEmwGb0CaXut4Swmla77WjNgypMKHKGc4bl7Jp
 /OWN+BhWCOSjg0wwz285xFzHNdamSmKQGHusZ8rWgB+AdbHpKGIwHTtuG
 bhzLs6SCpYX8bJWlVQbNTee+t+M+b9rEaFt18F9c795ZfSyZUdjBFXek5
 pp+YymiZXYwrpSSZgb6/c7r/AXCcentTMPp3r0Kd9Zd7ijGdgPXR9MJds
 EeYOWkbDsEd5FqlBIccn3gUN4Z5GlEuwozajjInPnJJK/c02tx8lT54Dp
 b5/P9VWr3fEkbpNyJF9RlLyGJYuiJbYLKiJ1vH50O4sfMOKhv9fmj0UMa A==;
X-CSE-ConnectionGUID: bw65KR8kR66ixwpLoAe9Mw==
X-CSE-MsgGUID: PpNfJvSdTfSu6pnYgp39Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47063840"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47063840"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2024 04:58:21 -0700
X-CSE-ConnectionGUID: 0L2WMsNVSfSls4pc8rrTjA==
X-CSE-MsgGUID: YyUmbmHZTiSX52+0V76+6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; d="scan'208";a="112010052"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2024 04:58:18 -0700
Date: Sat, 26 Oct 2024 14:58:15 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Cc: ashutosh.dixit@intel.com, John.C.Harrison@intel.com,
 rodrigo.vivi@intel.com, andi.shyti@linux.intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: Re: [PATCH v1] drm/xe: Rework throttle ABI
Message-ID: <ZxzZVzx-oh5qDYjX@black.fi.intel.com>
References: <20241025092238.167042-1-raag.jadav@intel.com>
 <20241025170341.GQ5725@mdroper-desk1.amr.corp.intel.com>
 <Zxvrri2LSkodxC-g@black.fi.intel.com>
 <20241025204534.GS5725@mdroper-desk1.amr.corp.intel.com>
 <xzllrcfttsfafxxgdn7ov6rmckhlwj43i6phbnabxnjbj474mo@ml43i733c5bn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xzllrcfttsfafxxgdn7ov6rmckhlwj43i6phbnabxnjbj474mo@ml43i733c5bn>
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

On Fri, Oct 25, 2024 at 06:07:40PM -0500, Lucas De Marchi wrote:
> +Sujaritha
> 
> Rodrigo was already Cc'ed, but please take a look below.
> 
> On Fri, Oct 25, 2024 at 01:45:34PM -0700, Matt Roper wrote:
> > On Fri, Oct 25, 2024 at 10:04:14PM +0300, Raag Jadav wrote:
> > > On Fri, Oct 25, 2024 at 10:03:41AM -0700, Matt Roper wrote:
> > > > On Fri, Oct 25, 2024 at 02:52:38PM +0530, Raag Jadav wrote:
> > > > > Current implementation adds multiple sysfs entries for getting GT
> > > > > throttle status and its reasons, which forces the user to read multiple
> > > > > entries for evaluating the result. Since output of each entry is based
> > > > > on the same underlying hardware register and considering the access type
> > > > > of this register is RO/v, the value of this register can change at any
> > > > > given point, even between subsequent sysfs reads. This makes current
> > > > > implementation fundamentally flawed which can produce inconsistent results.
> > > > >
> > > > > Rework throttle ABI and introduce throttle_status attribute which will
> > > > > provide throttle status through a oneshot register read, making it
> > > > > relatively less error prone. The new ABI will provide throttle reasons
> > > > > in a string based list based on the respective bits which are set in the
> > > > > hardware. Empty output means no bits are set and hence no throttling.
> > > >
> > > > But the old ABI is already released, and we have platforms with
> > > > force_probe lifted already.  Presumably userspace software is already
> > > > using the existing interface (otherwise it never would have been allowed
> > > > to land upstream), so that means we can't change it in incompatible ways
> > > > anymore; we're locked into supporting the current interface forever on
> > > > these platforms.
> > > >
> > > > We can change the ABI for _future_ platforms if it makes sense, but it's
> > > > too late to make compatibility-breaking changes for LNL and BMG.
> > > 
> > > It landed upstream pretty recently AFAICT, atleast in xe.
> > 
> > It landed upstream about 10 months ago:
> > 
> >        commit 1c8e9019033728093c04608f44c6e87fec6822e1
> >        Author:     Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> >        AuthorDate: Fri Dec 8 00:11:52 2023 -0500
> >        Commit:     Rodrigo Vivi <rodrigo.vivi@intel.com>
> >        CommitDate: Thu Dec 21 11:45:28 2023 -0500
> > 
> >            drm/xe: Add frequency throttle reasons sysfs attributes
> > 
> > and has been part of the 6.8 kernel onward.  So this isn't a case where
> > something just recently landed in drm-tip and hasn't made its way into a
> > formal kernel.org release yet.

Didn't see the split, my bad.

...

> > > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810
> > > >
> > > > I'm not sure what this ticket is about, but it was already closed
> > > > several weeks ago due to no longer reproducing.

Well, no longer reproducing != won't be seeing again.

> > > I'm sure we all have our "it works on my machine" moment :D
> > 
> > The point is that we can't point at a non-active issue as justification
> > here.  If the failure reported in that issue is still relevant, the
> > ticket should be re-opened and a proper analysis should be posted there.
> > But changing the ABI like this wouldn't help anyway since it would just
> > guarantee that the test breaks (because none of the interfaces it tries
> > to check would exist anymore).  This patch wouldn't actually fix or
> > close that ticket.

The ticket is here to provide reference to the problem which is explained
in the commit message.

> > Besides, the failure in that ticket likely isn't a KMD issue at all,
> > just a bug in the test.  By design, these sysfs interfaces represent the
> > "right now" status of the hardware.  If you read several sysfs entries
> > then the status could change as that's happening.  It's just a flaw in
> > the test that it overlooked this and incorrectly assumed the status
> > would never change while the test is running.

I would assume the test is designed in such a way with an acceptance
criteria in mind? Maybe Rodrigo/Sujaritha can shed more light on this.

> > > > The ABI change here doesn't seem to be directly related to this ticket.
> > > 
> > > We can always create new tickets, and that's not the point.
> > > The point is we're stuck with unreliable ABI.
> > 
> > Unreliable how?  We don't let new userspace interfaces into the kernel
> > unless there's real (not IGT) userspace software lined up to use them,
> > and the userspace developers have already signed off on the design and
> > semantics of the interfaces.  Presumably the current users are happy
> > with the current semantics and understand that the status provided is
> > live rather than sticky.
> 
> I was looking at that commit and noticed that it actually doesn't point
> to any real userspace user though. Ugh. Kernel doesn't break userspace
> interface. That's true, but it's not the same as "the ABI never
> changes". It's always risky and a decision not taken lightly because
> there's a *potential* for breakage.  However you are not breaking
> userspace if the usersapce doesn't exist.

Agree.

> It seems the uapi was mainly a copy & paste from i915.
> 
> So, a couple questions here:

...

> 2) Unreliable how?  Just as Matt asked, if it's unreliable you need to
> provide a proper justification for it. From the commit message:
> 
> 	Current implementation adds multiple sysfs entries for getting GT
> 	throttle status and its reasons, which forces the user to read multiple
> 	entries for evaluating the result. Since output of each entry is based
> 	on the same underlying hardware register and considering the access type
> 	of this register is RO/v, the value of this register can change at any
> 	given point, even between subsequent sysfs reads. This makes current
> 	implementation fundamentally flawed which can produce inconsistent results.
> 
> so what? the error would be in the user thinking that he could read
> multiple sysfs files atomically. What if user is interested in just 1
> of them?

Maybe... Although anyone who's looking for throttle reason won't possibly
be getting all the answers from just 1, considering the fact that it can be
any combination of them.

> It seems like adding a new file that guarantees this atomicity, is
> documented as such and *points to an actual userspace consumer*
> would be much better, with no potential for breakage. If then we find
> out there are no users of the old interface, we may think about
> deprecating/removing it.

Out of all the software out there not sure how much we'll be able to
cover, unless we have documented ones which we're guaranteeing to support?

Raag
