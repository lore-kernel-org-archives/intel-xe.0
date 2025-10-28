Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ED5CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 05:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5301A10E578;
	Tue, 28 Oct 2025 05:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lS0IxAhB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EAA10E578
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 05:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761629084; x=1793165084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/TCv0hy9PNSVd9RcfF9EC9cbaiFwntBq7Yijg2XFC4k=;
 b=lS0IxAhBscO9DjN9nFaF5YtfvaC5kFtY8Cx9RaIlAa2Ocrh0WywgNrkE
 VGXmWS7UBaRnN0SiCKKiNi/z71QqVL+/qNnmzWxZ6jLRYQ6Q4SUFIQac7
 dQp3pNnc/EiVAnCW8o66FJilGPrdrb03cirzAnOH6cwzcaoS4LLijxldx
 xJXVhul2UIF5/YEMwUCWI+kUPLn5GQfNQqNUNPZx1iWepcEAcwe4UIJDS
 wqhfvWiwoK8Mqm2tjXPG4W5F3G9MNgvFAC67FCt6BRj8etpPYcOV8ZbB4
 jyndzFIo+oxRsyIPmWaL+KQRWkp1inIPAbgokIUwUUiZzVYLEhg9RrHr2 w==;
X-CSE-ConnectionGUID: meJt7XKURrmwsTOLcNj39g==
X-CSE-MsgGUID: sBg+tel4SFm3qn/zMUr5dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74839386"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="74839386"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 22:24:44 -0700
X-CSE-ConnectionGUID: q8IGjfDKRjWGLzHQM3uCSA==
X-CSE-MsgGUID: 570uxkI6R9K3+VZnbTn2TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="184875488"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 22:24:42 -0700
Date: Tue, 28 Oct 2025 06:24:40 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <aQBTmNAhCMHpHDLn@black.igk.intel.com>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
 <20251026-gt-throttle-cri-v2-8-41f8288a71a7@intel.com>
 <aP9ckwuSMtXlzSpd@black.igk.intel.com>
 <dkdu4cjrsavnqrt2p2idxa34ujcfpglovnx5fwgd7fjb4d5zos@lwbh7xv6mhrz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dkdu4cjrsavnqrt2p2idxa34ujcfpglovnx5fwgd7fjb4d5zos@lwbh7xv6mhrz>
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

On Mon, Oct 27, 2025 at 08:26:01AM -0500, Lucas De Marchi wrote:
> On Mon, Oct 27, 2025 at 12:50:43PM +0100, Raag Jadav wrote:
> > On Sun, Oct 26, 2025 at 10:57:20PM -0700, Lucas De Marchi wrote:
> > > It's currently not possible to safely monitor if there's throttling
> > > happening and what are the reasons. The approach of reading the status
> > > and then reading the reasons is not reliable as by the time sysadmin
> > > reads the reason, the throttling could not be happening anymore.
> > > 
> > > Previous tentative to fix that[1] was breaking the ABI and potentially
> > > sysadmin's scripts. This takes a different approach of adding and
> > > documenting the additional attribute. It's still valuable, though
> > > redundant, to provide the simpler 0/1 interface.
> > > 
> > > In order to avoid userspace knowledge on the bitmask meaning and to be
> > > able to maintain the kernel side in sync with possible changes in
> > > future, just walk the attribute group and check what are the masks that
> > > match the value read.
> > > 
> > > [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
> > 
> > Thanks for looking into this, but following the recent developments on [2]
> > I'm beginning to have my doubts about this.
> > 
> > I don't have any strong opinions but we can probably hold on to this one
> > until we reach some conclusion on the matter.
> > 
> > [2] https://lore.kernel.org/intel-xe/20251014053257.3417575-2-riana.tauro@intel.com/
> 
> what's the relation between that patch and this one? If it's about
> multiple values in a single attribute, then they are not really at the
> same level:
> 
> Compare this:
> 	pl1
> 	pl4
> 
> To that:
> 	Capability Info: 0x138320 - 0x2001ae06
> 	Postcode Info: 0x138324 - 0x0
> 	Overflow Info: 0x138328 - 0x0
> 	Auxiliary Info 0: 0x13832c - 0x0
> 
> And from Documentation/filesystems/sysfs.rst:
> 
> 	Attributes should be ASCII text files, preferably with only one value
> 	per file. It is noted that it may not be efficient to contain only one
> 	value per file, so it is socially acceptable to express an array of
> 	values of the same type.
> 
> 	Mixing types, expressing multiple lines of data, and doing fancy
> 	formatting of data is heavily frowned upon. Doing these things may get
> 	you publicly humiliated and your code rewritten without notice.
> 
> I'd say the array of "reasons" in this patch clearly matches the first
> paragraph: it's the same type, not fancy formatting and has a reason to
> exist: TOCTOU mentioned in the docs and commit message). Another thing
> that I consider important: not expose the raw number to userspace so it
> doesn't have to decode the bitmapp per platform in userspace (the
> platform abstraction belongs in the kernel) and is easy to maintain for
> new platforms (hence the walk over the attribute_group).
> 
> The capability stuff on the other patch is much closer to the second
> paragraph.

Let me discuss this with Anirban if there are any particular caveats
on consumer side.

Raag
