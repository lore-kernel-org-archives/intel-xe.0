Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CE8606A321
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iwFmN2yh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633D310E039;
	Wed, 21 Oct 2026 15:25:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDFD10E039
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 15:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792596315; x=1824132315;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UEupDyywrSrt4gBsXnbV4sioo3u+jkncCXxsIculsL4=;
 b=iwFmN2yha1b2tOQRPP+oLe8LJsQhjsQUMcbGdMOa/1uwqDTkNEJ2d2nj
 7QoWtTLI/HDDQ+AnrQw262HRZ6b8O68Y9Rk6dls90Prf9sxA2oh+w4aF/
 B1w0BKq92ZD3yKzBgm+m746rwbzrtY/PAs7CYa0ij7779l5BW3H5cr3Ps
 B3OgKeFPObu1xG7jx9QC4VrAyhWALJdSIuTktdEN+YF/shte3svv7ddeB
 o4ZJ8r3FbAJSYt9vVRJZTvRukDxCZ3tkDsnhpL9z7UASt+w6ewgibOvQH
 nWPtxkjQx9UTg9+UMex/5Lrrv0C9cOIWCt0juAZ2HEQaiSm6UZHPbuZ0f Q==;
X-CSE-ConnectionGUID: uHBcWOnpT2m1GNg6hJ9Z3w==
X-CSE-MsgGUID: /wLBUmUtScKX5Td2UcmtcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1342153"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1342153"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 08:25:14 -0700
X-CSE-ConnectionGUID: VTSxeqLgSOePlhN71KNB/w==
X-CSE-MsgGUID: eBIdOzwMRFKl/ihKfrcOEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3534442"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.245.16])
 ([10.245.245.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 08:25:14 -0700
Message-ID: <d5cc6853e434ccc4d6fbb65c9ea30a000e03fa5e.camel@linux.intel.com>
Subject: Re: [PATCH 0/6] ATS/PASID SVA support and PRI-less fault servicing
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
Date: Wed, 21 Oct 2026 17:25:11 +0200
In-Reply-To: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
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
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

On Wed, 2026-10-21 at 09:41 +0530, Nareshkumar Gollakoti wrote:
> This series adds initial Shared Virtual Addressing (SVA) support for
> xe
> on platforms where ATS and PASID are available but PRI is not enabled
> or
> not supported.
>=20
> For SVA, the device must be able to issue memory transactions tagged
> with a PASID so that address translation is performed in the process
> address space rather than in a driver owned address space. This
> series
> adds the xe side infrastructure needed for that flow: VM support for
> SVA
> PASID state, PASID retriveal helpers, and programming of
> CTX_SYS_PASID
> for ATS and PASID enabled contexts.
>=20
> On systems with PRI, device page faults can be surfaced and resolved
> through the hardware page request interface, so the driver does not
> need
> to implement a separate fault servicing path for SVA.
> On non PRI systems, that hardware assisted fault path is
> unavailable.In
> that case, the driver still needs a way to resolve faults against the
> backing process address space so execution can proceed.
>=20
> To support that case, this series introduces a CPU mirror VMA and
> uses
> it as part of a driver managed SVM path for SVA faults without
> PRI.The
> purpose of the CPU mirror VMA is to provide a CPU side VMA
> representation for the address range being accesses through SVA,so
> the
> driver can rely on the kernel MM/VMA machinery to validate mappings
> and
> resolve backing pages for fault handling in the absence of PRI.In
> other words, since the device cannot issue PRI requests, the driver
> needs a CPU visible VMA context that mirrors the GPU SVA range
> closely
> enough to let faults be service through normal MM paths.
>=20
> At a high level, this series does the following:
>=20
> =C2=A01. log ATS/PASID enablement state during probe,
> =C2=A02. add VM infrastructure needed for SVA PASID support,
> =C2=A03. add a helper to retrieve the VM SVA PASID,
> =C2=A04. program CTX_SYS_PASID for ATS/PASID-enabled contexts,
> =C2=A05. add a PCI helper for ATS/PASID operation without PRI,
> =C2=A06. add a CPU mirror VMA for handling SVA faults on non PRI platform=
s
>=20
> Patches 1-5 provide the ATS/PASID and VM/context plumbing needed for
> this flow and have been validated internally.Patch 6 adds the non PRI
> fault servicing path, and feedback on that overall approach would be
> especially appreciated.

I was under the impression that we'd integrate this with current SVM so
that we can still migrate to VRAM and use page-table mirroring or keep
data in system memory and use SVA page-table sharing *OR* page-table-
mirroring depending on user-space's wish?

Thanks,
Thomas


>=20
> Himal Prasad Ghimiray (1):
> =C2=A0 drm/xe/vm: Setup SVA infrastructure for PASID support
>=20
> Nareshkumar Gollakoti (5):
> =C2=A0 drm/xe/pci: log ATS/PASID enablement state at probe
> =C2=A0 drm/xe/vm: add helper to retrieve VM SVA PASID
> =C2=A0 drm/xe/lrc: program CTX_SYS_PASID for ATS/PASID-enabled contexts
> =C2=A0 drm/xe/pci: add helper for ATS/PASID without PRI
> =C2=A0 drm/xe/pagefault: add CPU mirror VMA for SVA faults without PRI
>=20
> =C2=A0drivers/gpu/drm/xe/regs/xe_lrc_layout.h |=C2=A0 6 +++
> =C2=A0drivers/gpu/drm/xe/xe_lrc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 ++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_pagefault.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 49 ++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_pagefault_types.h |=C2=A0 6 +++
> =C2=A0drivers/gpu/drm/xe/xe_pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++++
> =C2=A0drivers/gpu/drm/xe/xe_pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 56
> +++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 +++
> =C2=A09 files changed, 184 insertions(+)
