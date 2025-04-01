Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB02AC36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 11:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784AE10E2C3;
	Tue,  1 Apr 2025 11:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfk6gt5N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6B810E2C3
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 11:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743508543; x=1775044543;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=il/xS/3kS7UpZGuuyqtdK71/+/gm/IfVmNjlUo6NR9s=;
 b=hfk6gt5N/g4x4v3LjgFWhiXCWLxUan5C+GggzckUQHxvFTsbD/5hNlZ2
 gOKmeY4sVN+MTMeekIMxZ9Jx+1+tQQ91SROJTynv5ATvnT3PKSedfqMPI
 P0eJlee7FpaYtL/NX0PTYTg8jfKkmHdMKohpmgSy5FqZcsLgiJ9DThn31
 FB/tnUhCEezb73vEjriYxzWYKhRqUAcBfuF3LJl20fKizn79ceS8ePpwF
 nTwsMcLJYe3tkIIS+FJsFz24r9CSR8fAKMHs2bccS/OMgPKnMwZAaXtwn
 fs23BApkI9j1WpBQ7ZggDTKl15XMzpV9GLmEQmnXzj4qiPvTWvQy22gsi Q==;
X-CSE-ConnectionGUID: U1q65KAmTRaoYeO0NCcWZw==
X-CSE-MsgGUID: 3il3d49eTvWQPvnB+j2Grw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="62226834"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="62226834"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 04:55:42 -0700
X-CSE-ConnectionGUID: 8ULjk22zS2CpftBANwnOHQ==
X-CSE-MsgGUID: GgkVwAiHQ5K+Uc+V17/GGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131503258"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.31])
 ([10.245.246.31])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 04:55:41 -0700
Message-ID: <5bf94f57b3d2bed5af7585b95b0bb67480cdbb3f.camel@linux.intel.com>
Subject: Re: [PATCH v4 5/5] drm/xe: Make the PT code handle placement per
 PTE rather than per vma / range
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 himal.prasad.ghimiray@intel.com, Matthew Auld <matthew.auld@intel.com>
Date: Tue, 01 Apr 2025 13:55:39 +0200
In-Reply-To: <x53tcs5bjldw6lcorjemuheklxcmepdvr2u7lvt3hpqrzqoc4h@nsu6hs25taqj>
References: <20250326080551.40201-1-thomas.hellstrom@linux.intel.com>
 <20250326080551.40201-6-thomas.hellstrom@linux.intel.com>
 <x53tcs5bjldw6lcorjemuheklxcmepdvr2u7lvt3hpqrzqoc4h@nsu6hs25taqj>
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

Hi, Lucas, Thanks for noticing. See inline.


On Mon, 2025-03-31 at 10:55 -0500, Lucas De Marchi wrote:
> On Wed, Mar 26, 2025 at 09:05:51AM +0100, Thomas Hellstr=C3=B6m wrote:
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > b/drivers/gpu/drm/xe/xe_pt.c
> > index 9e719535a3bb..82ae159feed1 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -278,13 +278,15 @@ struct xe_pt_stage_bind_walk {
> > 	struct xe_vm *vm;
> > 	/** @tile: The tile we're building for. */
> > 	struct xe_tile *tile;
> > -	/** @default_pte: PTE flag only template. No address is
> > associated */
> > -	u64 default_pte;
> > +	/** @default_pte: PTE flag only template for VRAM. No
> > address is associated */
>=20
> 		=C2=A0=C2=A0=C2=A0=C2=A0 ^
> > +	u64 default_vram_pte;
>=20
> 		=C2=A0=C2=A0=C2=A0 ^
>=20
> doc is wrong here. This would fix that for this patch:
>=20
> // diff --git a/drivers/gpu/drm/xe/xe_pt.c
> b/drivers/gpu/drm/xe/xe_pt.c
> // index 82ae159feed12..91ad347c8c7bf 100644
> // --- a/drivers/gpu/drm/xe/xe_pt.c
> // +++ b/drivers/gpu/drm/xe/xe_pt.c
> // @@ -278,9 +278,9 @@ struct xe_pt_stage_bind_walk {
> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm;
> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** @tile: The tile we=
're building for. */
> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_tile *tile;
> // -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** @default_pte: PTE flag only =
template for VRAM. No
> address is associated */
> // +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** @default_vram_pte: PTE flag =
only template for VRAM. No
> address is associated */
> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 default_vram_pte;
> // -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** @default_pte: PTE flag only =
template for VRAM. No
> address is associated */
> // +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** @default_system_pte: PTE fla=
g only template for
> system. No address is associated */
> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 default_system_pte=
;
> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** @dma_offset: DMA o=
ffset to add to the PTE. */
> //=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 dma_offset;
>=20
>=20
> However I was surprised that we didn't get any error in our CI.Hooks.
>=20
>=20
> It looks like this entire struct is not in our docs at all:
> https://docs.kernel.org/gpu/xe/xe_mm.html#pagetable-building
>=20
> Should we add a
>=20
> /**
> =C2=A0 * struct xe_pt_stage_bind_walk - ...
> =C2=A0 */
>=20
> so it's visible? Or if it's internal detail from
> drivers/gpu/drm/xe/xe_pt.c maybe we could drop the kernel-doc,
> leaving
> them as "/*" comments instead?

I think it's worth having it kerneldoc'ed. I'll submit a patch for that
+ the fixes above unless you have it already in the pipe.

Thanks,
Thomas


>=20
> Lucas De Marchi

