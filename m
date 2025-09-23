Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA36CAC5A7
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 14:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76E210E1C9;
	Tue, 23 Sep 2025 14:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZiZqu/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1D510E1C9
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 14:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758639154; x=1790175154;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=UX221bn9OZ+lVi59AkfkSRUL3pVZrj+W1diUBRNSFPU=;
 b=nZiZqu/Nix4w2iKA9/lfcGCMZ5QleibWZUiq3cZH90vTOPbKxE3EbMbB
 5GPEW7WuypGLZw9+uB5jLRaWAU1R/bl/ne5m5yJrgjrJHRkEmdFNriWFI
 XxTp6jwF4GckW6peG9f0nZzRN1we6tFfXzIF7kIp5I2QN4jjh34d3i0BV
 BcCVOV9gyGx4myzZdWOt0MHgUp5kC9FGZYy2Hf6/SKb1tCeMypED9UeJd
 WpDOhTqAbk+lQNqQgwu+ReSgbUxvTffRVuU4walCBZdn7p2MCqsMBzdYl
 2/YDQaLqzePps6yJixFa01+k8/N7bH+m82i2XpQMmzeVMNllyP9B1Bdih Q==;
X-CSE-ConnectionGUID: iFVUGl/hTm62IPEyAPRVDA==
X-CSE-MsgGUID: dM44ByBlQLeNyJ4vrJVvMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64747861"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="64747861"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 07:52:33 -0700
X-CSE-ConnectionGUID: FVFWhZdSSpSxNeeL9TdL0g==
X-CSE-MsgGUID: Vp/oq69xSsGtm9lLU2ogSg==
X-ExtLoop1: 1
Received: from opintica-mobl1 (HELO [10.245.245.2]) ([10.245.245.2])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 07:52:32 -0700
Message-ID: <c407b98661b5742352674f577c76cf50eddcc493.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Allow mixed mappings for userptr
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 23 Sep 2025 16:52:30 +0200
In-Reply-To: <20250917182817.3995998-1-matthew.brost@intel.com>
References: <20250917182817.3995998-1-matthew.brost@intel.com>
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

On Wed, 2025-09-17 at 11:28 -0700, Matthew Brost wrote:
> Compute kernels often issue memory copies immediately after
> completion.
> If the memory being copied is an SVM pointer that was faulted into
> the
> device and then bound via userptr, it is undesirable to move that
> memory. Worse, if userptr is mixed between system and device memory,
> the
> bind operation may be rejected.
>=20
> Xe already has the necessary plumbing to support userptr with mixed
> mappings. This update modifies GPUSVM's get_pages to correctly locate
> pages in such mixed mapping scenarios.
>=20
> Fixes: ("9e9787414882 drm/xe/userptr: replace xe_hmm with gpusvm")
> Signed-off-bt: Matthew Brost <matthew.brost@intel.com>

s/bt/by/

Perhaps we need to let the PAT index discussion land before we merge
this. If we support multiple placements we might need multiple PAT
indices...

Otherwise LGTM.

Thanks,
Thomas


> ---
> =C2=A0drivers/gpu/drm/drm_gpusvm.c=C2=A0=C2=A0=C2=A0 | 6 ++++--
> =C2=A0drivers/gpu/drm/xe/xe_userptr.c | 1 +
> =C2=A0include/drm/drm_gpusvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 4 ++++
> =C2=A03 files changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gpusvm.c
> b/drivers/gpu/drm/drm_gpusvm.c
> index eeeeb99cfdf6..64c0ea70eae3 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1361,7 +1361,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> *gpusvm,
> =C2=A0		order =3D drm_gpusvm_hmm_pfn_to_order(pfns[i], i,
> npages);
> =C2=A0		if (is_device_private_page(page) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 is_device_coherent_page(page)) {
> -			if (zdd !=3D page->zone_device_data && i > 0)
> {
> +			if (!ctx->allow_mixed &&
> +			=C2=A0=C2=A0=C2=A0 zdd !=3D page->zone_device_data && i > 0)
> {
> =C2=A0				err =3D -EOPNOTSUPP;
> =C2=A0				goto err_unmap;
> =C2=A0			}
> @@ -1397,7 +1398,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm
> *gpusvm,
> =C2=A0		} else {
> =C2=A0			dma_addr_t addr;
> =C2=A0
> -			if (is_zone_device_page(page) || pagemap) {
> +			if (is_zone_device_page(page) ||
> +			=C2=A0=C2=A0=C2=A0 (pagemap && !ctx->allow_mixed)) {
> =C2=A0				err =3D -EOPNOTSUPP;
> =C2=A0				goto err_unmap;
> =C2=A0			}
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> b/drivers/gpu/drm/xe/xe_userptr.c
> index 91d09af71ced..c628f58c085c 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -54,6 +54,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma
> *uvma)
> =C2=A0	struct xe_device *xe =3D vm->xe;
> =C2=A0	struct drm_gpusvm_ctx ctx =3D {
> =C2=A0		.read_only =3D xe_vma_read_only(vma),
> +		.allow_mixed =3D true,
> =C2=A0	};
> =C2=A0
> =C2=A0	lockdep_assert_held(&vm->lock);
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 5434048a2ca4..97d2f57914bb 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -235,6 +235,9 @@ struct drm_gpusvm {
> =C2=A0 * @read_only: operating on read-only memory
> =C2=A0 * @devmem_possible: possible to use device memory
> =C2=A0 * @devmem_only: use only device memory
> + * @allow_mixed: Allow mixed mappings in get pages. Mixing between
> system and
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 single dpagemap is supported, mixing between
> multiple dpagemap
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 is unsupported.
> =C2=A0 *
> =C2=A0 * Context that is DRM GPUSVM is operating in (i.e. user arguments)=
.
> =C2=A0 */
> @@ -245,6 +248,7 @@ struct drm_gpusvm_ctx {
> =C2=A0	unsigned int read_only :1;
> =C2=A0	unsigned int devmem_possible :1;
> =C2=A0	unsigned int devmem_only :1;
> +	unsigned int allow_mixed :1;
> =C2=A0};
> =C2=A0
> =C2=A0int drm_gpusvm_init(struct drm_gpusvm *gpusvm,

