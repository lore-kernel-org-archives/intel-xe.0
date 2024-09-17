Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E23C35FEB
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 06:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9A410E1EE;
	Tue, 17 Sep 2024 06:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMpBGzyr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6A810E1EE
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726556369; x=1758092369;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/yR9MhVz6KUSAoZ5bbwiXc0c2kEMC/etb6WxZr/WrWY=;
 b=GMpBGzyrTwC789h/7YQOVOrtrmh5v0/BmSLCMs32E4xTcHuzi/iFfTQL
 aE/okds5o9Q0XamoZ6D5Kkyz6NU8CMzATRcsOGHBUDHUmGYlLB60Hj9B4
 SPwnK33Ikmoa1hLhpHCJo9G8juLQIRJTPVA+lX1xh9VLUbs3eVSVwoNfU
 MytY56P+7HnaoQpFRQejlw/9l05H+8OO8aLK+fV7sUS7RbjJ/yZ8dNyDC
 s+9XuhU53vK/05hZOK++zoRUmt4Hv56HDimFkwWvDChI5MYCmXPTwmizJ
 4/AYw9UPBaoBKlnzIYnULzG8lely80imRH+P3SlgYjPec9u2e7x+B7zMQ w==;
X-CSE-ConnectionGUID: T9YmQDJQTWuenXkDdOc1ig==
X-CSE-MsgGUID: 46JMO2BKTQuo7SruY3XyXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="28310485"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="28310485"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 23:59:28 -0700
X-CSE-ConnectionGUID: c4dQzkfBSeimxsGKrh1FXw==
X-CSE-MsgGUID: /o498sfWRLu83lBMSolzOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="73687487"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.188])
 ([10.245.244.188])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 23:59:27 -0700
Message-ID: <5ee3eec0b0c8585b0b278d9f2f779d299aa51e3a.camel@linux.intel.com>
Subject: Re: [RFC PATCH 0/8] ULLS for kernel submission of migration jobs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Sep 2024 08:59:10 +0200
In-Reply-To: <Zug40aMNkJ9ZibYC@DUT025-TGLU.fm.intel.com>
References: <20240812024717.3584636-1-matthew.brost@intel.com>
 <6f07724535d0860e696d25ff6c8132170c6d53ba.camel@linux.intel.com>
 <ZrpFwv+GlJzqzibT@DUT025-TGLU.fm.intel.com>
 <Zug40aMNkJ9ZibYC@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

Hi, Matt

On Mon, 2024-09-16 at 13:55 +0000, Matthew Brost wrote:
> On Mon, Aug 12, 2024 at 05:26:26PM +0000, Matthew Brost wrote:
> > On Mon, Aug 12, 2024 at 10:53:01AM +0200, Thomas Hellstr=C3=B6m wrote:
> > > Hi, Matt,
> > >=20
> > > On Sun, 2024-08-11 at 19:47 -0700, Matthew Brost wrote:
> > > > Ultra low latency for kernel submission of migration jobs.
> > > >=20
> > > > The basic idea is that faults (CPU or GPU) typically depend on
> > > > migration
> > > > jobs. Faults should be addressed as quickly as possible, but
> > > > context
> > > > switches via GuC on hardware are slow. To avoid context
> > > > switches,
> > > > perform ULLS in the kernel for migration jobs on discrete
> > > > faulting
> > > > devices with an LR VM open.
> > > >=20
> > > > This is implemented by switching the migration layer to ULLS
> > > > mode
> > > > upon
> > > > opening an LR VM. In ULLS mode, migration jobs have a preamble
> > > > and
> > > > postamble: the preamble clears the current semaphore value, and
> > > > the
> > > > postamble waits for the next semaphore value. Each job
> > > > submission
> > > > sets
> > > > the current semaphore in memory, bypassing the GuC. The net
> > > > effect is
> > > > that the migration execution queue never gets switched off the
> > > > hardware
> > > > while an LR VM is open.
> > > >=20
> > > > There may be concerns regarding power management, as the ring
> > > > program
> > > > continuously runs on a copy engine, and a force wake reference
> > > > to a
> > > > copy
> > > > engine is held with an LR VM open.
> > > >=20
> > > > The implementation has been lightly tested but seems to be
> > > > working.
> > > >=20
> > > > This approach will likely be put on hold until SVM is
> > > > operational
> > > > with
> > > > benchmarks, but it is being posted early for feedback and as a
> > > > public
> > > > checkpoint.
> > > >=20
> > > > Matt
> > >=20
> > > The main concern I have with this is that, at least according to
> > > upstream discussions, pagefaults are so slow anyway, a performant
> > > stack
> > > needs to try extremely hard to avoid them using manual prefaults,
> > > and
> > > if we hit a gpu pagefault, we've lost anyway and any migration
> > > latency
> > > optimization won't matter much.
> > >=20
> >=20
> > I agree that if pagefaults are getting hit all the time we are in
> > trouble wrt to performance but that doesn't mean when they do occur
> > we
> > shouldn't try to make servicing them as fast as possible.
> >=20
>=20
> Okay, there is definitely something to this. I have an SVM test that
> serially bounces (i.e., each bounce results in a GuC context switch)
> a
> 2M allocation via fault about 1,000 times between the CPU and GPU. I
> applied this series and added a modparam to enable/disable ULLS to
> the
> tip of my latest working branch [3].
>=20
> Without ULLS enabled, the test on average took about 3 seconds on
> BMG.
> With ULLS enabled, the test on average took 2 seconds. I was
> expecting a
> small gain, but this is significant. Other similar sections I have
> seen
> a speed nearing twice as fast. It seems to indicate that this series
> is
> definitely worth pursuing.
>=20
> Also note that any operation using the migrate engine will see gains
> (e.g., clearing BOs, prefetches, eviction) in terms of latency.

I'm still concerned about adding this, and if we do we should only use
it as a last resource if we see significant performance improvements in
real-world applications. Historically all the latency optimizations was
what screwed up the maintainability of the i915 driver and I think we
should be extremely careful so we don't end up in the same situation.
Concerns also around power management.

Regardless, ULLS only really should improve things if we fail to
pipeline migrations on the HW in the non-ULLS case, assuming that we're
using a single exec-queue in both cases. Is that because we wait for
each migration to complete before allowing the next one? If so, is that
something we could look at?

Thanks,
Thomas



>=20
> Matt
>=20
> > > Also, for power management, LR VM open is a very simple strategy,
> > > which
> > > is good, but shouldn't it be possible to hook that up to LR job
> > > running, similar to vm->preempt.rebind_deactivated?
> > >=20
> >=20
> > That seems possible. Then in is scenario we'd hook the
> > xe_migrate_lr_vm_get / put calls [1] [2] and runtime PM calls into
> > the
> > LR VM activate / deactivate calls rather LR VM open / close calls.
> >=20
> > Matt
> >=20
> > [1]
> > https://patchwork.freedesktop.org/patch/607842/?series=3D137128&rev=3D1
> > [2]
> > https://patchwork.freedesktop.org/patch/607841/?series=3D137128&rev=3D1
> >=20
> > > /Thomas
> > >=20
> > >=20
> > > >=20
> > > > Matthew Brost (8):
> > > > =C2=A0 drm/xe: Add xe_hw_engine_write_ring_tail
> > > > =C2=A0 drm/xe: Add ULLS support to LRC
> > > > =C2=A0 drm/xe: Add ULLS flags for jobs
> > > > =C2=A0 drm/xe: Add ULLS migration job support to migration layer
> > > > =C2=A0 drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
> > > > =C2=A0 drm/xe: Add ULLS migration job support to ring ops
> > > > =C2=A0 drm/xe: Add ULLS migration job support to GuC submission
> > > > =C2=A0 drm/xe: Enable ULLS migration jobs when opening LR VM
> > > >=20
> > > > =C2=A0.../gpu/drm/xe/instructions/xe_mi_commands.h=C2=A0 |=C2=A0=C2=
=A0 6 +
> > > > =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 +++-
> > > > =C2=A0drivers/gpu/drm/xe/xe_hw_engine.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 ++
> > > > =C2=A0drivers/gpu/drm/xe/xe_hw_engine.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > > =C2=A0drivers/gpu/drm/xe/xe_lrc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 49 +++++++
> > > > =C2=A0drivers/gpu/drm/xe/xe_lrc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 3 +
> > > > =C2=A0drivers/gpu/drm/xe/xe_lrc_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > > =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 130
> > > > +++++++++++++++++-
> > > > =C2=A0drivers/gpu/drm/xe/xe_migrate.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> > > > =C2=A0drivers/gpu/drm/xe/xe_ring_ops.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 32 +++++
> > > > =C2=A0drivers/gpu/drm/xe/xe_sched_job_types.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> > > > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 10 ++
> > > > =C2=A012 files changed, 268 insertions(+), 8 deletions(-)
> > > >=20
> > >=20

