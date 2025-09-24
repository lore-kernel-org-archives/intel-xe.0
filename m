Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5A4CAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 17:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF3F10E794;
	Wed, 24 Sep 2025 17:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rp/wqhLy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DCB10E794
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 17:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758733570; x=1790269570;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OrL54bn+HyCE3IFL6ygnPsq0QIygMEGPQ3bsVahyElY=;
 b=Rp/wqhLyFdzsSCLHoJa5zwCx17rYvKuv55J3WBwxZSsJMYA7nUIUlt46
 lIpYRBC0xy/VPWiedeNGkKqSzI1JyhnzCcHGZpYpEKsTGkNcuHMQhw03I
 pCA5S11MjaotmHf6YzVCRW9TVL8hF016NWJ8uiU0ZzJnu0JgUhy7kkkZd
 uN5uWH+dhGuRgw+b/Dn0r83N06oq/tBXebn8v+J85EeilT7WrWKHMJKb7
 +7X4Q0SgK4A5T/cPYOTJhi09Spnvs6yBi4d/4BWysGMQXExQq0h5fG8Wk
 XOmRoRkScuV7kSrVvWk43KfBYIurdRUAcp/2aLUyOz2aRRWSzSAp04Bcm g==;
X-CSE-ConnectionGUID: BNILUV+yQym70X8AjvhGYQ==
X-CSE-MsgGUID: C0nb6VhmRHSkuuKLw7jMwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61091767"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61091767"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 10:06:09 -0700
X-CSE-ConnectionGUID: Mkt9ZMPeSY+OW9Vk7Fc4FQ==
X-CSE-MsgGUID: AAzF4zp4Q4OW53n6swR8rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176674859"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.11])
 ([10.245.244.11])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 10:06:09 -0700
Message-ID: <fda7a6e8b3043987fdb7ed436021fb0c1d4132b4.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Allow mixed mappings for userptr
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Sep 2025 19:06:06 +0200
In-Reply-To: <aNNUaC45nFcOQ13X@lstrano-desk.jf.intel.com>
References: <20250917182817.3995998-1-matthew.brost@intel.com>
 <c407b98661b5742352674f577c76cf50eddcc493.camel@linux.intel.com>
 <aNNUaC45nFcOQ13X@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

Hi,

On Tue, 2025-09-23 at 19:16 -0700, Matthew Brost wrote:
> On Tue, Sep 23, 2025 at 04:52:30PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Hi,
> >=20
> > On Wed, 2025-09-17 at 11:28 -0700, Matthew Brost wrote:
> > > Compute kernels often issue memory copies immediately after
> > > completion.
> > > If the memory being copied is an SVM pointer that was faulted
> > > into
> > > the
> > > device and then bound via userptr, it is undesirable to move that
> > > memory. Worse, if userptr is mixed between system and device
> > > memory,
> > > the
> > > bind operation may be rejected.
> > >=20
> > > Xe already has the necessary plumbing to support userptr with
> > > mixed
> > > mappings. This update modifies GPUSVM's get_pages to correctly
> > > locate
> > > pages in such mixed mapping scenarios.
> > >=20
> > > Fixes: ("9e9787414882 drm/xe/userptr: replace xe_hmm with
> > > gpusvm")
> > > Signed-off-bt: Matthew Brost <matthew.brost@intel.com>
> >=20
> > s/bt/by/
> >=20
> > Perhaps we need to let the PAT index discussion land before we
> > merge
> > this. If we support multiple placements we might need multiple PAT
> > indices...
> >=20
>=20
> We'd likely just get the pat_index from the userptr bind here, which
> the
> UMD likely expects to correspond to system memory. Either way, let's
> wrap up the PAT index discussion before introducing more complexity.
> Whatever we decide on will probably require a fixes patch here.
> Alternatively, we could take a suboptimal route in the fixes path by
> evicting userptr from device memory upon bind =E2=80=94 similar to what w=
as
> necessary in stable kernels before the userptr =E2=86=92 GPUSVM transitio=
n
> landed.

So assuming that we can use a single PAT index for multiple placements,
and if not we extend the map operation to provide multiple PAT indices
then we should not regress.

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


>=20
> Matt
>=20
> > Otherwise LGTM.
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> > > ---
> > > =C2=A0drivers/gpu/drm/drm_gpusvm.c=C2=A0=C2=A0=C2=A0 | 6 ++++--
> > > =C2=A0drivers/gpu/drm/xe/xe_userptr.c | 1 +
> > > =C2=A0include/drm/drm_gpusvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 4 ++++
> > > =C2=A03 files changed, 9 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > > b/drivers/gpu/drm/drm_gpusvm.c
> > > index eeeeb99cfdf6..64c0ea70eae3 100644
> > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > @@ -1361,7 +1361,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > > *gpusvm,
> > > =C2=A0		order =3D drm_gpusvm_hmm_pfn_to_order(pfns[i], i,
> > > npages);
> > > =C2=A0		if (is_device_private_page(page) ||
> > > =C2=A0		=C2=A0=C2=A0=C2=A0 is_device_coherent_page(page)) {
> > > -			if (zdd !=3D page->zone_device_data && i >
> > > 0)
> > > {
> > > +			if (!ctx->allow_mixed &&
> > > +			=C2=A0=C2=A0=C2=A0 zdd !=3D page->zone_device_data && i >
> > > 0)
> > > {
> > > =C2=A0				err =3D -EOPNOTSUPP;
> > > =C2=A0				goto err_unmap;
> > > =C2=A0			}
> > > @@ -1397,7 +1398,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> > > *gpusvm,
> > > =C2=A0		} else {
> > > =C2=A0			dma_addr_t addr;
> > > =C2=A0
> > > -			if (is_zone_device_page(page) ||
> > > pagemap) {
> > > +			if (is_zone_device_page(page) ||
> > > +			=C2=A0=C2=A0=C2=A0 (pagemap && !ctx->allow_mixed)) {
> > > =C2=A0				err =3D -EOPNOTSUPP;
> > > =C2=A0				goto err_unmap;
> > > =C2=A0			}
> > > diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> > > b/drivers/gpu/drm/xe/xe_userptr.c
> > > index 91d09af71ced..c628f58c085c 100644
> > > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > > @@ -54,6 +54,7 @@ int xe_vma_userptr_pin_pages(struct
> > > xe_userptr_vma
> > > *uvma)
> > > =C2=A0	struct xe_device *xe =3D vm->xe;
> > > =C2=A0	struct drm_gpusvm_ctx ctx =3D {
> > > =C2=A0		.read_only =3D xe_vma_read_only(vma),
> > > +		.allow_mixed =3D true,
> > > =C2=A0	};
> > > =C2=A0
> > > =C2=A0	lockdep_assert_held(&vm->lock);
> > > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > > index 5434048a2ca4..97d2f57914bb 100644
> > > --- a/include/drm/drm_gpusvm.h
> > > +++ b/include/drm/drm_gpusvm.h
> > > @@ -235,6 +235,9 @@ struct drm_gpusvm {
> > > =C2=A0 * @read_only: operating on read-only memory
> > > =C2=A0 * @devmem_possible: possible to use device memory
> > > =C2=A0 * @devmem_only: use only device memory
> > > + * @allow_mixed: Allow mixed mappings in get pages. Mixing
> > > between
> > > system and
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 single dpagemap is supported, mixing between
> > > multiple dpagemap
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 is unsupported.
> > > =C2=A0 *
> > > =C2=A0 * Context that is DRM GPUSVM is operating in (i.e. user
> > > arguments).
> > > =C2=A0 */
> > > @@ -245,6 +248,7 @@ struct drm_gpusvm_ctx {
> > > =C2=A0	unsigned int read_only :1;
> > > =C2=A0	unsigned int devmem_possible :1;
> > > =C2=A0	unsigned int devmem_only :1;
> > > +	unsigned int allow_mixed :1;
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> >=20

