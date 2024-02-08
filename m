Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77006C48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 09:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DECB10E083;
	Thu,  8 Feb 2024 09:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lP1msSxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E215710E083
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 09:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707384128; x=1738920128;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=84N5kHm7tbNHwXqrA2GirADPMTFzB4rz49N5nFCa4hU=;
 b=lP1msSxWZ+oEkueGn1Yk7S/zv5mudBrdubWWZYuwubwVA8SWC7vVBKe5
 9kmc9UPx383ETR3mXoP3aAx1WjSbAnRoiCBUKXZ9+vZ2Zr2DJeNdZEwfd
 MmzkrjWBG8qCcG4A2H4iffv9Ne4EI4kE3kdNg/fmgiHtGDwvbfKfL0K2o
 ud2z5dNLaxPG9cl06ouMaweVfQmmQIWpFuVR+7Lxrh8pXa9lHDn44NuYP
 o1bT6ErKDZIe/5jGv8lq+zOhVdtzYZQXVuDpVvEpL1Zo5BV2x5wfDx60B
 XPTiyhWo+/WP7xXmFB0Zt901lm4UQPMdBs8g3Wy3qooB5N5AAsqGMkNOe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="11758512"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; d="scan'208";a="11758512"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 01:22:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="6266237"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO [10.249.254.149])
 ([10.249.254.149])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 01:22:05 -0800
Message-ID: <d9fa7cf66c85f52e8c09fc0e3459a2c0d05abf78.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/vm: don't ignore error when in_kthread
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Feb 2024 10:22:02 +0100
In-Reply-To: <ZcEr9axBgGiIoFee@DUT025-TGLU.fm.intel.com>
References: <20240202171435.427630-2-matthew.auld@intel.com>
 <ZcEr9axBgGiIoFee@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Mon, 2024-02-05 at 18:41 +0000, Matthew Brost wrote:
> On Fri, Feb 02, 2024 at 05:14:36PM +0000, Matthew Auld wrote:
> > If GUP fails and we are in_kthread, we can have pinned =3D 0 and ret
> > =3D 0.
> > If that happens we call sg_alloc_append_table_from_pages() with
> > n_pages
> > =3D 0, which is not well behaved and can trigger:
> >=20
> > kernel BUG at include/linux/scatterlist.h:115!
> >=20
> > depending on if the pages array happens to be zeroed or not. Even
> > if we
> > don't hit that it crashes later when trying to dma_map the returned
> > table.
> >=20
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> Someone from Habana point this out a while back and forgot to follow
> up
> on fixing this. Thanks for fixing this and looks correct.
>=20
> Should we include a Fixes tag here? I am thinking so.
>=20
> With a fixes tag:
> Reviewed: Matthew Brost <matthew.brost@intel.com>

Hi,=20
Matt + Matt

I think this requires yet another fix. The reason for this odd
construct was that on process exit (CTRL-C), the userptr mappings are
torn down, leading to an -EFAULT here. This is then propagated to the
rebind worker and we get a printout like

[  188.922692] xe 0000:03:00.0: [drm] VM worker error: -14
[  188.922913] xe 0000:03:00.0: [drm] VM worker error: -14
[  188.922943] xe 0000:03:00.0: [drm] VM worker error: -14
[  188.922948] xe 0000:03:00.0: [drm] VM worker error: -14
[  188.922952] xe 0000:03:00.0: [drm] VM worker error: -14
[  188.922956] xe 0000:03:00.0: [drm] VM worker error: -14
[  188.922960] xe 0000:03:00.0: [drm] VM worker error: -14

(xe-exec-threads --r threads-cm-userptr-invalidate-race + CTRL-C)

And the idea was that the rebind worker just re-enabled without setting
up these bindings. If any job was then still accessing this address (it
shouldn't at this point, right?) we'd catch this with an IOMMU
pagefault or similar.

But in any case, we need to filter out the above log spamming.

/Thomas

>=20
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c | 5 +----
> > =C2=A01 file changed, 1 insertion(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 9c1c68a2fff7..63aeb3aead04 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -114,11 +114,8 @@ int xe_vma_userptr_pin_pages(struct
> > xe_userptr_vma *uvma)
> > =C2=A0					=C2=A0 num_pages - pinned,
> > =C2=A0					=C2=A0 read_only ? 0 :
> > FOLL_WRITE,
> > =C2=A0					=C2=A0 &pages[pinned]);
> > -		if (ret < 0) {
> > -			if (in_kthread)
> > -				ret =3D 0;
> > +		if (ret < 0)
> > =C2=A0			break;
> > -		}
> > =C2=A0
> > =C2=A0		pinned +=3D ret;
> > =C2=A0		ret =3D 0;
> > --=20
> > 2.43.0
> >=20

