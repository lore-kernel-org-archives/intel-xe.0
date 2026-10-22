Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E522606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gWx1Ared
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1234E11254F;
	Thu, 22 Oct 2026 11:23:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9A411254E
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 11:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792668230; x=1824204230;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Cpvo7FYGLJO7jh4PMKthe3Ui4rJ588OI5GhwQisGaPo=;
 b=gWx1Aredw6BirQ2y36bYmuCzCyNEKIu0Stb1mD69gwhFFcsvEi3cNdqV
 zo8mdIH8VW9xwz5P4CjiMPCvwYoQPpM6xp6fYmjr4KbCbKf8HuPq7TPXm
 ZDJ2IjT/xEiw1earqsQGU165AXWAhNWQyp8xiULvzCdsNakC++LChlZuv
 6e2CC8/nYAkkHUq+kACU4Z+fgH6giXgrsFZdMmvjH4XHK6Hxt8ABZSmnv
 tHE/VNgNevIzw6KYk3ClXA6kb53xaBebIl4iV4OnnoHt8v6t6xDGxSMij
 PWnm6vSogza6xTSIXBWQbt1fvI/cjXVRKPXIGkZiUJQ7V3dm/Jwq1Lrct Q==;
X-CSE-ConnectionGUID: u+YmIyP4RP+JDOCnDMr2/g==
X-CSE-MsgGUID: HE+dup0NTfKNyVXaQiL1lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1447630"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1447630"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:12:17 -0700
X-CSE-ConnectionGUID: VXWbdd3sTVa8jwLfdUZRZA==
X-CSE-MsgGUID: Kr9EGnMDS++csEeAiiBNHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3821396"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.245.180])
 ([10.245.245.180])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:12:16 -0700
Message-ID: <49204d78b2ebd1211663b0fedfec9037a09bdd59.camel@linux.intel.com>
Subject: Re: [PATCH 0/6] ATS/PASID SVA support and PRI-less fault servicing
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>
Date: Thu, 22 Oct 2026 13:12:13 +0200
In-Reply-To: <7c0b318c-3074-4c6c-aacd-5a8d6aa4a3b9@intel.com>
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
 <d5cc6853e434ccc4d6fbb65c9ea30a000e03fa5e.camel@linux.intel.com>
 <7c0b318c-3074-4c6c-aacd-5a8d6aa4a3b9@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-10-22 at 12:00 +0530, Kumar G, Naresh wrote:
> Hi Thomas,
>=20
> On 10/21/2026 8:55 PM, Thomas Hellstr=C3=B6m wrote:
> > Hi!
> >=20
> > On Wed, 2026-10-21 at 09:41 +0530, Nareshkumar Gollakoti wrote:
> > > This series adds initial Shared Virtual Addressing (SVA) support
> > > for
> > > xe
> > > on platforms where ATS and PASID are available but PRI is not
> > > enabled
> > > or
> > > not supported.
> > >=20
> > > For SVA, the device must be able to issue memory transactions
> > > tagged
> > > with a PASID so that address translation is performed in the
> > > process
> > > address space rather than in a driver owned address space. This
> > > series
> > > adds the xe side infrastructure needed for that flow: VM support
> > > for
> > > SVA
> > > PASID state, PASID retriveal helpers, and programming of
> > > CTX_SYS_PASID
> > > for ATS and PASID enabled contexts.
> > >=20
> > > On systems with PRI, device page faults can be surfaced and
> > > resolved
> > > through the hardware page request interface, so the driver does
> > > not
> > > need
> > > to implement a separate fault servicing path for SVA.
> > > On non PRI systems, that hardware assisted fault path is
> > > unavailable.In
> > > that case, the driver still needs a way to resolve faults against
> > > the
> > > backing process address space so execution can proceed.
> > >=20
> > > To support that case, this series introduces a CPU mirror VMA and
> > > uses
> > > it as part of a driver managed SVM path for SVA faults without
> > > PRI.The
> > > purpose of the CPU mirror VMA is to provide a CPU side VMA
> > > representation for the address range being accesses through
> > > SVA,so
> > > the
> > > driver can rely on the kernel MM/VMA machinery to validate
> > > mappings
> > > and
> > > resolve backing pages for fault handling in the absence of PRI.In
> > > other words, since the device cannot issue PRI requests, the
> > > driver
> > > needs a CPU visible VMA context that mirrors the GPU SVA range
> > > closely
> > > enough to let faults be service through normal MM paths.
> > >=20
> > > At a high level, this series does the following:
> > >=20
> > > =C2=A0=C2=A01. log ATS/PASID enablement state during probe,
> > > =C2=A0=C2=A02. add VM infrastructure needed for SVA PASID support,
> > > =C2=A0=C2=A03. add a helper to retrieve the VM SVA PASID,
> > > =C2=A0=C2=A04. program CTX_SYS_PASID for ATS/PASID-enabled contexts,
> > > =C2=A0=C2=A05. add a PCI helper for ATS/PASID operation without PRI,
> > > =C2=A0=C2=A06. add a CPU mirror VMA for handling SVA faults on non PR=
I
> > > platforms
> > >=20
> > > Patches 1-5 provide the ATS/PASID and VM/context plumbing needed
> > > for
> > > this flow and have been validated internally.Patch 6 adds the non
> > > PRI
> > > fault servicing path, and feedback on that overall approach would
> > > be
> > > especially appreciated.
> > I was under the impression that we'd integrate this with current
> > SVM so
> > that we can still migrate to VRAM and use page-table mirroring or
> > keep
> > data in system memory and use SVA page-table sharing *OR* page-
> > table-
> > mirroring depending on user-space's wish?
> >=20
> > Thanks,
> > Thomas
>=20
> IMO, Yes, that is the intended model. Userspace picks between the two
> approaches with the bind.
>=20
> Bind with=C2=A0CPU_ADDR_MIRROR=C2=A0=E2=86=92 existing SVM. GPU page faul=
t, optional
> VRAM=20
> migrate, PPGTT mirroring and this path is unchanged.
>=20
> Do not bind =E2=86=92 SVA page-table sharing. IOMMU walks the CPU page ta=
bles
> with ATS+PASID. Backing has to stay in system memory. This is the=20
> end-to-end share flow, and it needs ATS+PASID+PRI.
>=20
> If PRI is missing, an ATS miss cannot be healed by the IOMMU. The
> device=20
> then reports a GPU page fault. Instead of NACKing that unbound fault,
> we=20
> create a CPU-mirror VMA and service it with the same SVM path so the
> GPU=20
> gets a PPGTT mapping.
>=20
>=20
> So, ATS+PASID+PRI =E2=86=92 share works as user space asked (no bind). Bi=
nd=20
> with=C2=A0CPU_ADDR_MIRROR=C2=A0=E2=86=92 SVM, independent of PRI. *PRI-le=
ss is only the
> recovery path when share cannot complete at the IOMMU*.(This is one
> of=20
> the proposal)
>=20
>=20
> Let me know if anything am missing.

Yes, first on the (implicit) UAPI, KMD must never implicitly create a
GPU_VMA. This is done to be able to handle page-faults for non-PRI
capable hardware. Couldn't that be done much easier with a separate
page-fault handler that just calls fixup_user_fault() or a similar in-
kernel API and mark the gpu fault as handled? Then I assume the
ATS+PASID request will be retried?

On the implicit "Everything not having a GPU vma will be using
ATS/PASID" I strongly oppose that. Was this discussed on the UAPI
channel? Does NEO have any patches published to back this up?
ATS/PASID enables us to HW optimize a subset of the existing SVM
functionality, and IMO KMD is the best judge of whether to use it or
not, possibly with a UMD madvise hint. IMO we should require a
CPU_ADDR_MIRROR vma covering also the ATS/PASID regions and add an
MADVISE setting for user-space to prefer ATS/PASID lookups over current
hmm mirroring. If user-space then selects an MADVISE setting that is
incompatible with ATS/PASID (like different PAT, VRAM preferred region
etc.) Then KMD can transparently move over to that. We can also reuse
existing igts and user-space. If UMD needs to detect whether ATS/PASID
is usable on the VM then I figure we also must consider that.

Finally, it looks like you don't use the XE_PAGE_FORCE_FAULT bit, like
in here:

https://patchwork.freedesktop.org/patch/657641/?series=3D149886&rev=3D3

How would you then stop the hardware from attempting an ATS/PASID
lookup rather than faulting in mapped VMA?

Thanks,
Thomas


>=20
>=20
> Thanks,
>=20
> Naresh
>=20
> >=20
> > > Himal Prasad Ghimiray (1):
> > > =C2=A0=C2=A0 drm/xe/vm: Setup SVA infrastructure for PASID support
> > >=20
> > > Nareshkumar Gollakoti (5):
> > > =C2=A0=C2=A0 drm/xe/pci: log ATS/PASID enablement state at probe
> > > =C2=A0=C2=A0 drm/xe/vm: add helper to retrieve VM SVA PASID
> > > =C2=A0=C2=A0 drm/xe/lrc: program CTX_SYS_PASID for ATS/PASID-enabled
> > > contexts
> > > =C2=A0=C2=A0 drm/xe/pci: add helper for ATS/PASID without PRI
> > > =C2=A0=C2=A0 drm/xe/pagefault: add CPU mirror VMA for SVA faults with=
out
> > > PRI
> > >=20
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/regs/xe_lrc_layout.h |=C2=A0 6 +++
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_lrc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 ++++++++++++++++
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_pagefault.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 49
> > > ++++++++++++++++++++++
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_pagefault_types.h |=C2=A0 6 +++
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++++
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++++++
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 56
> > > +++++++++++++++++++++++++
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++
> > > =C2=A0=C2=A09 files changed, 184 insertions(+)
