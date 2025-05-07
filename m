Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3FDC3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 11:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD0C10E786;
	Wed,  7 May 2025 11:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCVUDy8X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8D110E786
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 11:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746617964; x=1778153964;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=90kdE6BUMTwjJ2DI0v/iFeWJyLWnksB9K2SsRgsURog=;
 b=SCVUDy8X95PWRI8XWVUb7Ys/mUfF0+SAtyjKCTSyWZMEWo+e+R/GFEMv
 zmncfBA14GuK3HzFoiaGhUesnGrVqOh8t5oB8irBAm7OzD8UqTFL3s2Yz
 j+d89M17LGOkGj16wfwCEIUiEp3SIECEpFFYzHuXyWGv6shfdd8vfFZCZ
 1fFapjG5ppkbJ7QwI08uFZ7o9c1BIXcgzsn53Mbp4byGBto1AG/6Dtjvn
 cwIwvUBR6350lJ9Sz3GItIF57B1txsSX1gbRC3NTOxGQ+of+d8TNPv+Kr
 ULUoF4nLJIFERA6T6taJEl3Q73YXEpHnBk2bkNzbXQ6v6sLLzrhSJ1oTV Q==;
X-CSE-ConnectionGUID: 8T/ZPE8zRpWUjbE9wyU4Yw==
X-CSE-MsgGUID: Vrf3IL1YR6+P0+llB3XxlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52156669"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="52156669"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 04:39:24 -0700
X-CSE-ConnectionGUID: lg0hSysMQIi6z2uK8ykkjA==
X-CSE-MsgGUID: B4ovgRPQR5yEqyjLh0TjvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="136859500"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.238])
 ([10.245.244.238])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 04:39:22 -0700
Message-ID: <2e2f9c7f17df535635a957a95740d2cd69c0be6f.camel@linux.intel.com>
Subject: Re: [PATCH v6 19/20] drm/xe/svm: Implement prefetch support for SVM
 ranges
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Date: Wed, 07 May 2025 13:39:20 +0200
In-Reply-To: <c8bf7de5-d62d-49fe-bfc3-b71e5c58680c@intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
 <20250430121912.337601-20-himal.prasad.ghimiray@intel.com>
 <62989f8bbb1d8f57fea227f7afdbc753b492dbcf.camel@linux.intel.com>
 <6206f91e-aef4-400f-891c-6b11bbe4ffca@intel.com>
 <17301febd0068fc40549b5f75773577fa0b4846a.camel@linux.intel.com>
 <c8bf7de5-d62d-49fe-bfc3-b71e5c58680c@intel.com>
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

On Fri, 2025-05-02 at 21:41 +0530, Ghimiray, Himal Prasad wrote:
>=20
>=20
> On 02-05-2025 20:09, Thomas Hellstr=C3=B6m wrote:
> > On Fri, 2025-05-02 at 20:05 +0530, Ghimiray, Himal Prasad wrote:
> > >=20
> > >=20
> > > On 02-05-2025 19:12, Thomas Hellstr=C3=B6m wrote:
> > > > On Wed, 2025-04-30 at 17:49 +0530, Himal Prasad Ghimiray wrote:
> > > > > This commit adds prefetch support for SVM ranges, utilizing
> > > > > the
> > > > > existing ioctl vm_bind functionality to achieve this.
> > > > >=20
> > > > > v2: rebase
> > > > >=20
> > > > > v3:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 - use xa_for_each() instead of manual lo=
op
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 - check range is valid and in preferred =
location before
> > > > > adding to
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xarray
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 - Fix naming conventions
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 - Fix return condition as -ENODATA inste=
ad of -EAGAIN
> > > > > (Matthew
> > > > > Brost)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 - Handle sparsely populated cpu vma rang=
e (Matthew
> > > > > Brost)
> > > > >=20
> > > > > v4:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 - fix end address to find next cpu vma i=
n case of -
> > > > > ENOENT
> > > > >=20
> > > > > v5:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 - Move find next vma logic to drm gpusvm=
 layer
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 - Avoid mixing declaration and logic
> > > > >=20
> > > > > v6:
> > > > > =C2=A0=C2=A0=C2=A0 - Use new function names
> > > > > =C2=A0=C2=A0=C2=A0 - Move eviction logic to prefetch_ranges
> > > > >=20
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Signed-off-by: Himal Prasad Ghimiray
> > > > > <himal.prasad.ghimiray@intel.com>
> > > > > ---
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/xe/xe_pt.c |=C2=A0 58 ++++++++-=
--
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/xe/xe_vm.c | 197
> > > > > +++++++++++++++++++++++++++++++++++--
> > > > > =C2=A0=C2=A0=C2=A02 files changed, 234 insertions(+), 21 deletion=
s(-)
> > > > >=20
> > > >=20
> > > > I was thinking a bit around the UAPI, and prefetching foreign
> > > > device
> > > > regions. That doesn't really fit into the current UAPI.
> > > >=20
> > > > What are your thoughts here. IMO this should align somewhat to
> > > > what
> > > > we
> > > > do for madvise().
> > > >=20
> > > > Let's say we want to prefetch into a foreign device memory
> > > > region
> > > > identified by an fd? I figure we could add that later as an
> > > > extension.
> > > >=20
> > > > But how does the UMD API for this look? Do we cover current
> > > > usage
> > > > with
> > > > the existing UAPI syntax?
> > >=20
> > > During Initial discussions one of the way we discussed was using
> > > a
> > > flag
> > > something like DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC for prefetch to
> > > madvise assigned preferred location.
> > >=20
> > > so it will be two step process from UMD perspective:
> > > 1) madvise sets up preferred location: which should also be used
> > > in
> > > pagefault handler.
> > >=20
> > > 2) If user wants to prefetch to same location, user passes region
> > > as
> > > DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC to vm_bind ioctl.
> > >=20
> > > https://patchwork.freedesktop.org/patch/647180/?series=3D146290&rev=
=3D4
> >=20
> > Indeed, thanks for reminding me.
> >=20
> > >=20
> > > or we can simply pass u32 devmem_fd as
> > > prefetch_mem_region_instance
> > > to
> > > vm_bind ioctl,
> >=20
> > But that wouldn't work if we have published UMD using the
> > mem_region_instance as the local mem_region_instance, right?
>=20
> Thats correct.
>=20
> >=20
> > So if we want that we'd need an extension?
>=20
> True. IMO sticking to DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC=C2=A0 makes more
> sense.

OK, then for the uapi part
Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


>=20
> >=20
> > /Thomas
> >=20
> >=20
> >=20
> > > =C2=A0 if we want it to be single step, but w/o madvise that
> > > wont work for pf handler.
> >=20
> >=20
> >=20
> > >=20
> > > /Himal>
> > > > /Thomas
> > > >=20
> > >=20
> >=20
>=20

