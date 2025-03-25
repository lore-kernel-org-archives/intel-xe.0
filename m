Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46380C3600B
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 16:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63D710E0BB;
	Tue, 25 Mar 2025 16:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0jVee8x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE94A10E0BB
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 16:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742921147; x=1774457147;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jILEprG59PnYYPol8DfcrP1TYMeZnTkPtuI2BUZ9FBo=;
 b=G0jVee8x7B4Ua21Ops3oSy+g6jOGljlmg3In60EePCFPApg46oub2mV2
 pR/4J2egmzpP5F5iysmFAvt07GaJ59mqLe9o6gqonJpozsquQ7ptJfCLo
 n661Pag1RXl6z4C24OSD7UKIII6aEUvuJbdoP/mj8IJKHPE3Hr99UMKRE
 Q8jFQMG9BNURPMMhUoYbBZils4zubtB+lCKyavxn2FWU/f6n74eD+sqGZ
 V8C/Ke4bDmk1Zn3NWD4xtWwBQsXjpzbnQNLYZyHaeMIedEp9WKaGUdjAj
 jqPErFM1txzE5BT/+HPDk9qBsna+Z8UnMVWd5ZCBMGPw948gZkYFQscW3 g==;
X-CSE-ConnectionGUID: qaJPbHGnRkaXmcJfn6gshA==
X-CSE-MsgGUID: tUl80OUuQKatmwDHJeZRFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="48054441"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="48054441"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 09:45:46 -0700
X-CSE-ConnectionGUID: KWlnMvSZSq+6iHB+88mLvg==
X-CSE-MsgGUID: k2bfewY2RuGudkNZDpRwDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="147617160"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.125])
 ([10.245.246.125])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 09:45:45 -0700
Message-ID: <035f67acc73fdaf8dfe73a53e265001b7b9a2b83.camel@linux.intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe/bo: Add a bo remove callback
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>
Date: Tue, 25 Mar 2025 17:45:42 +0100
In-Reply-To: <ed599ccb-2027-4936-acc1-e01ef5f6c42d@intel.com>
References: <20250324165500.20680-1-thomas.hellstrom@linux.intel.com>
 <20250324165500.20680-4-thomas.hellstrom@linux.intel.com>
 <8be75eef-2baf-4606-a8cc-1b392db6d918@intel.com>
 <4edfc75d575412439efd6dcad15d875eb1c557f5.camel@linux.intel.com>
 <ed599ccb-2027-4936-acc1-e01ef5f6c42d@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Tue, 2025-03-25 at 10:08 +0000, Matthew Auld wrote:
> On 25/03/2025 09:07, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2025-03-25 at 09:02 +0000, Matthew Auld wrote:
> > > On 24/03/2025 16:54, Thomas Hellstr=C3=B6m wrote:
> > > > On device unbind, migrate exported bos, including pagemap bos
> > > > to
> > > > system. This allows importers to take proper action without
> > > > disruption. In particular, SVM clients on remote devices may
> > > > continue as if nothing happened, and can chose a different
> > > > placement.
> > > >=20
> > > > The evict_flags() placement is chosen in such a way that bos
> > > > that
> > > > aren't exported are purged.
> > > >=20
> > > > For pinned bos, we unmap DMA, but their pages are not freed yet
> > > > since we can't be 100% sure they are not accessed.
> > > >=20
> > > > All pinned external bos (not just the VRAM ones) are put on the
> > > > pinned.external list with this patch. But this only affects the
> > > > xe_bo_pci_dev_remove_pinned() function since !VRAM bos are
> > > > ignored by the suspend / resume functionality. As a follow-up
> > > > we
> > > > could look at removing the suspend / resume iteration over
> > > > pinned external bos since we currently don't allow pinning
> > > > external bos in VRAM, and other external bos don't need any
> > > > special treatment at suspend / resume.
> > > >=20
> > > > v2:
> > > > - Address review comments. (Matthew Auld).
> > > > v3:
> > > > - Don't introduce an external_evicted list (Matthew Auld)
> > > > - Add a discussion around suspend / resume behaviour to the
> > > > =C2=A0=C2=A0=C2=A0 commit message.
> > > > - Formatting fixes.
> > > >=20
> > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > <thomas.hellstrom@linux.intel.com>
> > >=20
> > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > >=20
> >=20
> > Actually, there is a CI failure on LNL indicating that the pinned
> > kernel-bo dma-maps are actually needed at devm-managed release.
>=20
> Hmm, do you have a link? The failure I see looks to be more probe=20
> related? Once we do unplug(), outside the special evict all we do
> here=20
> we should pretty much not need dma-maps?

https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v5/shard-lnl-2/igt@xe=
_module_load@reload-no-display.html#dmesg-warnings381

Ideally not. But again since not all xe subsystems using pinned maps
aren't properly finished at that point, I figure it's hard to tell.
Since the xe_hw_fence warning happened at devm_action_release() it
caught my attention.

However I can't repro on LNL, even with IOMMU turned on.

>=20
> What about moving the evict_all into a well placed devm action during
> probe? Basically at the point at which we think it is reasonable to
> get=20
> rid of the dma-maps? Or is that what you mean below?

I still think we should devm_ free all pinned kernel bos, so that there
are none existing once the pci-device is gone. But as a cach-all, yeah
we should probably move the traversal for pinned kernel_bo to be
executed as part of a final devm_ action. That'd be usable for
debugging as well if we were to attempt cleaning up all pinned bos on
unplugging.

I'll do a quick respin of that.

/Thomas


>=20
> >=20
> > I'm in the process on testing this out on LNL, and if so I'll drop
> > these dma-unmaps and we'd continue down the route of ensuring that
> > these subsystems are indeed devm_ managed and not drmm_ managed.
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> >=20
>=20

