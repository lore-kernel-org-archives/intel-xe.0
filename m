Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805CEC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 08:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF8810E064;
	Mon, 12 Aug 2024 08:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fONYhySa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A8910E064
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 08:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723452786; x=1754988786;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=VAbrki7/DG/X/zR+OVyVn1AxR9sj2fCDstWePRWK5DI=;
 b=fONYhySa+qceaFdVnaej2JF3XTTmC1lI5MbzmkTpR9AHP7scl1xwHup2
 JSEg2nOpcHrm2LQh87dX9FcsUeqEWuNLvj64/AwcFBvJmaghaobcL4Dxw
 sw7Ny5BA9/jzDMdG5u+AduYZIL+f/TdnVLwpvvidtI7mijQGs4hFDashI
 TMiIP03Bet7DcgbOouZkXuZycg3Mc2qfRcg2+NLqz7WojPdOc7glZfasF
 VP5Z9qIYu8590X2skvbVXqqElyDZtzMlzX+4vTOPt+5JoLPnzgM5WyoW4
 Shqw39VkZr90XW70ZpN1JxuPOrMf8jb3znBA5un9Nxvr6WvPXQdbq/1lX A==;
X-CSE-ConnectionGUID: nXv1BlU+SOmMShApg+mpTg==
X-CSE-MsgGUID: hlj8/zI6SGO6blcFybQMuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21110814"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="21110814"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 01:53:05 -0700
X-CSE-ConnectionGUID: Y+d9wPeVTzi8RMnmzBLqDQ==
X-CSE-MsgGUID: oJ91776CQw+SI6TVM2gCtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="95704677"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.53])
 ([10.245.244.53])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 01:53:04 -0700
Message-ID: <6f07724535d0860e696d25ff6c8132170c6d53ba.camel@linux.intel.com>
Subject: Re: [RFC PATCH 0/8] ULLS for kernel submission of migration jobs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 10:53:01 +0200
In-Reply-To: <20240812024717.3584636-1-matthew.brost@intel.com>
References: <20240812024717.3584636-1-matthew.brost@intel.com>
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

Hi, Matt,

On Sun, 2024-08-11 at 19:47 -0700, Matthew Brost wrote:
> Ultra low latency for kernel submission of migration jobs.
>=20
> The basic idea is that faults (CPU or GPU) typically depend on
> migration
> jobs. Faults should be addressed as quickly as possible, but context
> switches via GuC on hardware are slow. To avoid context switches,
> perform ULLS in the kernel for migration jobs on discrete faulting
> devices with an LR VM open.
>=20
> This is implemented by switching the migration layer to ULLS mode
> upon
> opening an LR VM. In ULLS mode, migration jobs have a preamble and
> postamble: the preamble clears the current semaphore value, and the
> postamble waits for the next semaphore value. Each job submission
> sets
> the current semaphore in memory, bypassing the GuC. The net effect is
> that the migration execution queue never gets switched off the
> hardware
> while an LR VM is open.
>=20
> There may be concerns regarding power management, as the ring program
> continuously runs on a copy engine, and a force wake reference to a
> copy
> engine is held with an LR VM open.
>=20
> The implementation has been lightly tested but seems to be working.
>=20
> This approach will likely be put on hold until SVM is operational
> with
> benchmarks, but it is being posted early for feedback and as a public
> checkpoint.
>=20
> Matt

The main concern I have with this is that, at least according to
upstream discussions, pagefaults are so slow anyway, a performant stack
needs to try extremely hard to avoid them using manual prefaults, and
if we hit a gpu pagefault, we've lost anyway and any migration latency
optimization won't matter much.

Also, for power management, LR VM open is a very simple strategy, which
is good, but shouldn't it be possible to hook that up to LR job
running, similar to vm->preempt.rebind_deactivated?

/Thomas


>=20
> Matthew Brost (8):
> =C2=A0 drm/xe: Add xe_hw_engine_write_ring_tail
> =C2=A0 drm/xe: Add ULLS support to LRC
> =C2=A0 drm/xe: Add ULLS flags for jobs
> =C2=A0 drm/xe: Add ULLS migration job support to migration layer
> =C2=A0 drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
> =C2=A0 drm/xe: Add ULLS migration job support to ring ops
> =C2=A0 drm/xe: Add ULLS migration job support to GuC submission
> =C2=A0 drm/xe: Enable ULLS migration jobs when opening LR VM
>=20
> =C2=A0.../gpu/drm/xe/instructions/xe_mi_commands.h=C2=A0 |=C2=A0=C2=A0 6 =
+
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 +++-
> =C2=A0drivers/gpu/drm/xe/xe_hw_engine.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 ++
> =C2=A0drivers/gpu/drm/xe/xe_hw_engine.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_lrc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 49 +++++++
> =C2=A0drivers/gpu/drm/xe/xe_lrc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 3 +
> =C2=A0drivers/gpu/drm/xe/xe_lrc_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 130
> +++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_migrate.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> =C2=A0drivers/gpu/drm/xe/xe_ring_ops.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 32 +++++
> =C2=A0drivers/gpu/drm/xe/xe_sched_job_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 10 ++
> =C2=A012 files changed, 268 insertions(+), 8 deletions(-)
>=20

