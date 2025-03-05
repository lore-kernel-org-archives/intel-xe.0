Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DC0C19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 12:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C926910E807;
	Wed,  5 Mar 2025 12:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvleLO87";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA69E10E800
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Mar 2025 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741179071; x=1772715071;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dYM1yOZS97SUbyA3KMa4MgywHDwvcOCdbSzSG8x/ppQ=;
 b=HvleLO87gxQD6mMyNnoF8pahhY+un6bbpSVzlXsNJWVTYcw79KhA79J5
 Npnf/Gh7scWVxmN4OxxDPzlyyQfx2xIyck3Z+uaQaUMRCsg0fXbS6hZ5k
 SBtws9s3oosjObpFBVmdPbk0eULPq4BDUuLGOrvvUVdxuXA0pd9rzlKlM
 ypsSCOKRxaaLULBhpUcR2haD0dnzxOHioyBJGRW/mlsf7Yug/9HarUJkF
 06Pce5cBddUG8YyJniu+GiosSmZsxYn/8dnY55eJvm7fWQa3UaaquMkkb
 4WcTHTfTtghjzRafcBmatzfeR8P2aC6sUJ2gz9JF79BpD0Rt0KGlXT+th A==;
X-CSE-ConnectionGUID: zM9oR198RWmbyJ31nJtdQw==
X-CSE-MsgGUID: qqqEvSySSCaK9qIm59EJQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53543137"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="53543137"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 04:51:10 -0800
X-CSE-ConnectionGUID: 6l7Mb4RXSguicoAR6ksqCw==
X-CSE-MsgGUID: 9BTdzCJzQXiMDXroLzHYhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118693524"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.45])
 ([10.245.246.45])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 04:51:08 -0800
Message-ID: <fa7df4560cfbdc5372581bbeb0825479a06f1192.camel@linux.intel.com>
Subject: Re: [PATCH v3 0/3] drm/xe: Userptr invalid page access fixes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>, 
 Oak Zeng <oak.zeng@intel.com>
Date: Wed, 05 Mar 2025 13:51:06 +0100
In-Reply-To: <Z8frE6L2styWTD2R@lstrano-desk.jf.intel.com>
References: <20250304173342.22009-1-thomas.hellstrom@linux.intel.com>
 <Z8frE6L2styWTD2R@lstrano-desk.jf.intel.com>
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

On Tue, 2025-03-04 at 22:11 -0800, Matthew Brost wrote:
> On Tue, Mar 04, 2025 at 06:33:39PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Fix a number of potential invalid page-accesses by the userptr
> > code.
> >=20
> > Patch 1:
> > - Some coding style fixes.
> > Patch 2:
> > - Avoids invalid struct page accesses during userptr pinning.
> > Patch 3:
> > - Block xe device accesses on mmu_invalidation on the iommu level.
> >=20
>=20
> For the series:
> Acked-by: Matthew Brost <matthew.brost@intel.com>
>=20
> In the long term, I believe it would be beneficial if we could unify
> Xe userptr
> with the DRM common GPU SVM get_pages/notifiers. This is really hard
> to get
> right, and I think everything we have fixed here has already been
> correctly
> handled in GPU SVM. It would also help other drivers getting userptr
> correct
> going forward.

I fully agree.

One thing Matt Auld brought up, though, is that the size of a page
(hmm_pfn_page_order()) may be larger than a range (userptr or SVM) and
cross the range start and range end. Do we address that problem in SVM?

Or perhaps it's not really a problem there.

/Thomas


>=20
> Matt
>=20
> > v2:
> > - Address review comments by Matt Auld
> >=20
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Oak Zeng <oak.zeng@intel.com>
> >=20
> > Thomas Hellstr=C3=B6m (3):
> > =C2=A0 drm/xe/hmm: Style- and include fixes
> > =C2=A0 drm/xe/hmm: Don't dereference struct page pointers without
> > notifier
> > =C2=A0=C2=A0=C2=A0 lock
> > =C2=A0 drm/xe/userptr: Unmap userptrs in the mmu notifier
> >=20
> > =C2=A0drivers/gpu/drm/xe/xe_hmm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 170 +=
++++++++++++++++++++++----
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_hmm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 7 ++
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 4 +
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0=C2=A0 4 +
> > =C2=A04 files changed, 145 insertions(+), 40 deletions(-)
> >=20
> > --=20
> > 2.48.1
> >=20

