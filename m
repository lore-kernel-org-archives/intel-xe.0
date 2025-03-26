Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D166CC36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 09:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69A910E690;
	Wed, 26 Mar 2025 09:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQH5YnE8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB66910E699
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 09:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742982204; x=1774518204;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=souR6D2Q6giApy40+H80mw2fyglrPtTPi9INNbX8Hz0=;
 b=QQH5YnE8w5VSvEg8ltJI1z23unikHbyksR1KBktNAzU9mjicrXJrL99C
 Dh/JgO/Ou4JtptPBPtgxFFCqWz7uIPhIc8Tg1/ZYEkLD/pElRZf2P2iI9
 dqLQLmDmetwX3cGEGjqNvxy3+SZYd7rNxVJ4eYYvXZ1eOnw3a/POMANEm
 XFrOiDFqBafvyBJYi38ij+EllGavNrf0zN2qSixO0UPrWvA5E6CwCWAZx
 rQK2cPd4xarmqgS/3YhnoH8ZpuQlkAIVICNbZaKBAWlQA8d1u7CnPIzOa
 G/B4Ixo28uAS3G74zM7PzLQIVR3+5SR+4LdM6s0WykEwsNi5TTkT3isDR Q==;
X-CSE-ConnectionGUID: X+lElW0wTQyRzvC9C0qpNQ==
X-CSE-MsgGUID: IfPtTUfhRiufCJaLq2NdaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55254938"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="55254938"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:43:23 -0700
X-CSE-ConnectionGUID: rkiKupINRliTMCtt4NcsXg==
X-CSE-MsgGUID: Slh//1WIQy2HpnIkCELpvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="124499768"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.246.202])
 ([10.245.246.202])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:43:18 -0700
Message-ID: <94496397d65ab85feefddaabfa02cf9531c033ec.camel@linux.intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe/svm: Fix a potential bo UAF
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Wed, 26 Mar 2025 10:42:59 +0100
In-Reply-To: <079ba9a9-2a31-4b73-bb9a-078e12b9ae10@intel.com>
References: <20250326080551.40201-1-thomas.hellstrom@linux.intel.com>
 <20250326080551.40201-3-thomas.hellstrom@linux.intel.com>
 <079ba9a9-2a31-4b73-bb9a-078e12b9ae10@intel.com>
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

On Wed, 2025-03-26 at 15:01 +0530, Ghimiray, Himal Prasad wrote:
>=20
>=20
> On 26-03-2025 13:35, Thomas Hellstr=C3=B6m wrote:
> > If drm_gpusvm_migrate_to_devmem() succeeds, if a cpu access happens
> > to the
> > range the bo may be freed before xe_bo_unlock(), causing a UAF.
> >=20
> > Since the reference is transferred, use xe_svm_devmem_release() to
> > release the reference on drm_gpusvm_migrate_to_devmem() failure,
> > and hold a local reference to protect the UAF.
>=20
> Fixes tag ?

Right. Will add that.

Thanks,
Thomas

>=20
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_svm.c | 7 +++++--
> > =C2=A0 1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 52613dd8573a..c7424c824a14 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -702,11 +702,14 @@ static int xe_svm_alloc_vram(struct xe_vm
> > *vm, struct xe_tile *tile,
> > =C2=A0=C2=A0	list_for_each_entry(block, blocks, link)
> > =C2=A0=C2=A0		block->private =3D vr;
> > =C2=A0=20
> > +	xe_bo_get(bo);
> > =C2=A0=C2=A0	err =3D drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm,
> > &range->base,
> > =C2=A0=C2=A0					=C2=A0=C2=A0 &bo->devmem_allocation,
> > ctx);
> > -	xe_bo_unlock(bo);
> > =C2=A0=C2=A0	if (err)
> > -		xe_bo_put(bo);	/* Creation ref */
> > +		xe_svm_devmem_release(&bo->devmem_allocation);
> > +
> > +	xe_bo_unlock(bo);
> > +	xe_bo_put(bo);
> > =C2=A0=20
> > =C2=A0 unlock:
> > =C2=A0=C2=A0	mmap_read_unlock(mm);
>=20

