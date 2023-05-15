Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546EBC77B7D
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 13:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADCB10E1CD;
	Mon, 15 May 2023 13:08:32 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9BC10E1CF
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 13:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684156110; x=1715692110;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8wIldh5iIlitwWbBylfJ8UfwwO11kYVNe8m+3MPGMB8=;
 b=UJpU6pCmPK/UU5ptSjHBDIPg1fD4a8XxkrY3ozwZdSg/UNXYyrTLr1CL
 46OolISTXER3bPzmZrYbtK8RpjpM0bWecNEha17/BaeUnqpqtLqjRuVmj
 9eEEX5cJzii36gbA0Of33BYDDbCxOr5aDYC/P6J3eF8CvVUfZRUn89W3/
 Y1ObSCbKPWHFuTWIk2bxgcZM7dJomTlkERFLapxH/ShwZIRKKUkOrqPtR
 peRrZT0+hksUNeaY7q0KucnJkz06TspKywvVXiTLrdaIsvzO5zywdgwbm
 XJrB5bA8kHL3raYMiJcozkDyeiix2h7DHq0BEFca5Ij/r18U8wslNR5nM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="353464867"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="353464867"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 06:08:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="875169687"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="875169687"
Received: from cstoita-mobl.ger.corp.intel.com (HELO [10.249.254.124])
 ([10.249.254.124])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 06:08:27 -0700
Message-ID: <70299874a6ff739e3606017c8819bf4f267da731.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Date: Mon, 15 May 2023 15:08:24 +0200
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH 00/26] Separate GT and tile
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
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Matt,

On Wed, 2023-05-10 at 20:46 -0700, Matt Roper wrote:
> A 'tile' is not the same thing as a 'GT.'=C2=A0 For historical reasons,
> i915
> attempted to use a single 'struct intel_gt' to represent both
> concepts,
> although this design hasn't worked out terribly well.=C2=A0 For Xe we hav=
e
> the opportunity to design the driver in a way that more accurately
> reflects the real hardware behavior.
>=20
> Different vendors use the term "tile" a bit differently, but in the
> Intel world, a 'tile' is pretty close to what most people would think
> of
> as being a complete GPU.=C2=A0 When multiple GPUs are placed behind a
> single
> PCI device, that's what we refer to as a "multi-tile device."=C2=A0 In
> such
> cases, pretty much all hardware is replicated per-tile, although
> certain
> responsibilities like PCI communication, reporting of interrupts to
> the
> OS, etc. are handled solely by the "root tile."=C2=A0 A multi-tile
> platform
> takes care of tying the tiles together in a way such that interrupt
> notifications from remote tiles are forwarded to the root tile, the
> per-tile vram is combined into a single address space, etc.
>=20
> In contrast, a "GT" (which officially stands for "Graphics
> Technology")
> is the subset of a GPU/tile that is responsible for implementing
> graphics and/or media operations.=C2=A0 The GT is where a lot of the
> driver
> implementation happens since it's where the hardware engines, the
> execution units, and the GuC all reside.
>=20
> Historically most Intel devices were single-tile devices that
> contained
> a single GT.=C2=A0 PVC is currently the only released Intel platform buil=
t
> on
> a multi-tile design (i.e., multiple GPUs behind a single PCI device);
> each PVC tile only has a single GT.=C2=A0 In contrast, platforms like MTL
> that have separate chips for render and media IP are still only a
> single
> logical GPU, but the graphics and media IP blocks are exposed each
> exposed as a separate GT within that single GPU.=C2=A0 This is important
> from
> a software perspective because multi-GT platforms like MTL only
> replicate a subset of the GPU hardware and behave differently than
> multi-tile platforms like PVC where nearly everything is replicated.
>=20
> This series separates tiles from GTs in a manner that more closely
> matches the hardware behavior.=C2=A0 We now consider a PCI device
> (xe_device)
> to contain one or more tiles (struct xe_tile).=C2=A0 Each tile will
> contain
> one or two GTs (struct xe_gt).=C2=A0 Although we don't have any platforms
> yet
> that are multi-tile *and* contain more than one GT per tile, that may
> change in the future.=C2=A0 This driver redesign splits functionality as
> follows:
>=20
> Per-tile functionality (shared by all GTs within the tile):
> =C2=A0- Complete 4MB MMIO space (containing SGunit/SoC registers, GT
> =C2=A0=C2=A0 registers, display registers, etc.)
> =C2=A0- Global GTT
> =C2=A0- VRAM (if discrete)
> =C2=A0- Interrupt flows
> =C2=A0- Migration context
> =C2=A0- kernel batchbuffer pool
> =C2=A0- Primary GT
> =C2=A0- Media GT (if media version >=3D 13)
>=20
> Per-GT functionality:
> =C2=A0- GuC
> =C2=A0- Hardware engines
> =C2=A0- Programmable hardware units (subslices, EUs)
> =C2=A0- GSI subset of registers (multiple copies of these registers resid=
e
> =C2=A0=C2=A0 within the complete MMIO space provided by the tile, but at
> different
> =C2=A0=C2=A0 offsets --- 0 for render, 0x380000 for media)
> =C2=A0- Multicast register steering
> =C2=A0- TLBs to cache page table translations
> =C2=A0- Reset capability
> =C2=A0- Low-level power management (e.g., C6)
> =C2=A0- Clock frequency
> =C2=A0- MOCS and PAT programming
>=20

With that detailed cover-letter description, I think this makes sense.

I figure pagetables will need to be per tile with this splitup? What
about per-tile resources, like VRAM, that is accessible from all tiles
but with separate throughput / latencies depending on from which tile
they are accessed? Should those perhaps be per device with a per-tile
pointer to "preferred VRAM" and a map [tile][memory_type] of access
cost?

/Thomas


