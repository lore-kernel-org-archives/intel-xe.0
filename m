Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DBBC3ABAC
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 14:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5319310E945;
	Fri,  2 May 2025 14:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRPW1xCo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A16710E945
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746196804; x=1777732804;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9mqMXtVt6P9Jk4tg94nBu/bbYspzvidm7v7NbMjy2Dc=;
 b=RRPW1xCo3OqTsCM7QYFS1IcECX9807TUlsj3LXcNtrdn07qmQQqrZKsB
 Ad8cM6PtEJLE7o2rI+o63Kw2HYLTLtcxsG/4xneP78Xm8nmYg+I5SXnSr
 MF1RsTDdHdbkjStsCeikGAwQX68a9BSPuXFWAcLlwSeiXaPoWw+rGwIvU
 f0HPSbC6k9yY62NkKr++lfF/I1fVi+O4iMdFlPCoWJXtraaiWpYyK/pXy
 SzbmOpgWK9fXK3Ssf9hA9mTWOSi1up1UhPBScA3U6nMaImN9glBl9oYkL
 fnffxE7D5oQj5XlQe1hpdTG60gznPsDXctAXyOQLuImSccFeDMbJcM9y4 Q==;
X-CSE-ConnectionGUID: Y9tg5UKOQRKLxkVH8rl2hQ==
X-CSE-MsgGUID: yw3iGEvYQiGhUhmaHapDeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58868352"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="58868352"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 07:40:03 -0700
X-CSE-ConnectionGUID: mORbz+pcR66eWOhZvXWSyw==
X-CSE-MsgGUID: ZfsBJRTqQHq7RU3Jo0vvQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="138668515"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.151])
 ([10.245.246.151])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 07:40:01 -0700
Message-ID: <17301febd0068fc40549b5f75773577fa0b4846a.camel@linux.intel.com>
Subject: Re: [PATCH v6 19/20] drm/xe/svm: Implement prefetch support for SVM
 ranges
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Date: Fri, 02 May 2025 16:39:59 +0200
In-Reply-To: <6206f91e-aef4-400f-891c-6b11bbe4ffca@intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
 <20250430121912.337601-20-himal.prasad.ghimiray@intel.com>
 <62989f8bbb1d8f57fea227f7afdbc753b492dbcf.camel@linux.intel.com>
 <6206f91e-aef4-400f-891c-6b11bbe4ffca@intel.com>
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

On Fri, 2025-05-02 at 20:05 +0530, Ghimiray, Himal Prasad wrote:
>=20
>=20
> On 02-05-2025 19:12, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2025-04-30 at 17:49 +0530, Himal Prasad Ghimiray wrote:
> > > This commit adds prefetch support for SVM ranges, utilizing the
> > > existing ioctl vm_bind functionality to achieve this.
> > >=20
> > > v2: rebase
> > >=20
> > > v3:
> > > =C2=A0=C2=A0=C2=A0 - use xa_for_each() instead of manual loop
> > > =C2=A0=C2=A0=C2=A0 - check range is valid and in preferred location b=
efore
> > > adding to
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xarray
> > > =C2=A0=C2=A0=C2=A0 - Fix naming conventions
> > > =C2=A0=C2=A0=C2=A0 - Fix return condition as -ENODATA instead of -EAG=
AIN
> > > (Matthew
> > > Brost)
> > > =C2=A0=C2=A0=C2=A0 - Handle sparsely populated cpu vma range (Matthew=
 Brost)
> > >=20
> > > v4:
> > > =C2=A0=C2=A0=C2=A0 - fix end address to find next cpu vma in case of =
-ENOENT
> > >=20
> > > v5:
> > > =C2=A0=C2=A0=C2=A0 - Move find next vma logic to drm gpusvm layer
> > > =C2=A0=C2=A0=C2=A0 - Avoid mixing declaration and logic
> > >=20
> > > v6:
> > > =C2=A0=C2=A0 - Use new function names
> > > =C2=A0=C2=A0 - Move eviction logic to prefetch_ranges
> > >=20
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray
> > > <himal.prasad.ghimiray@intel.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_pt.c |=C2=A0 58 ++++++++---
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_vm.c | 197
> > > +++++++++++++++++++++++++++++++++++--
> > > =C2=A0=C2=A02 files changed, 234 insertions(+), 21 deletions(-)
> > >=20
> >=20
> > I was thinking a bit around the UAPI, and prefetching foreign
> > device
> > regions. That doesn't really fit into the current UAPI.
> >=20
> > What are your thoughts here. IMO this should align somewhat to what
> > we
> > do for madvise().
> >=20
> > Let's say we want to prefetch into a foreign device memory region
> > identified by an fd? I figure we could add that later as an
> > extension.
> >=20
> > But how does the UMD API for this look? Do we cover current usage
> > with
> > the existing UAPI syntax?
>=20
> During Initial discussions one of the way we discussed was using a
> flag=20
> something like DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC for prefetch to=20
> madvise assigned preferred location.
>=20
> so it will be two step process from UMD perspective:
> 1) madvise sets up preferred location: which should also be used in=20
> pagefault handler.
>=20
> 2) If user wants to prefetch to same location, user passes region as=20
> DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC to vm_bind ioctl.
>=20
> https://patchwork.freedesktop.org/patch/647180/?series=3D146290&rev=3D4

Indeed, thanks for reminding me.

>=20
> or we can simply pass u32 devmem_fd as prefetch_mem_region_instance
> to=20
> vm_bind ioctl,

But that wouldn't work if we have published UMD using the
mem_region_instance as the local mem_region_instance, right?

So if we want that we'd need an extension?

/Thomas



>  if we want it to be single step, but w/o madvise that=20
> wont work for pf handler.



>=20
> /Himal>
> > /Thomas
> >=20
>=20

