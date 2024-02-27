Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB746C54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 11:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B928610E58B;
	Tue, 27 Feb 2024 11:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnAT2wQa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BE210E58B
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709034889; x=1740570889;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=j2B9P9MDVid8jqJguAlGkQxnT+OZliHbYf3ZOJGp19s=;
 b=BnAT2wQaQx2KhBmbtHy30R52+jHKc1htcLJj2gweAcvcUSF2vxXfIy+8
 LFPCL8SJCE68+mD3GNFmjrE3lhs0tUU1cwuH9iFisFqF0+S+HMdIAP+C+
 fPRK9p6Zqrxk5SAPPzRg7oIzUA8kN3iH5Lu3byGhWtDvKY/HPM7Ha5oDV
 Xl3oN+4u2FyYHMzG3VlqGTvD2mG2cYsu8Yw2y3/Z5FelNObLe5SLeg9zQ
 KLopP+LtkvyxKVrfio1EjsSzc/uNCusOkEtzY2r/HNK+rb1yXnIuJLKj/
 UJmQd7PQhFZzps2pixxLeOCnEgdpx8mSrQvOrrXZ47r4yM9AGBM6cR3YY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="13921102"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="13921102"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 03:54:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6980020"
Received: from rbriscox-mobl1.ger.corp.intel.com (HELO [10.252.3.86])
 ([10.252.3.86])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 03:54:46 -0800
Message-ID: <e0bea21694f710c79653d37d46831d1d4d8ded7b.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe/bo: Allow eviction of unbound local bos
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 27 Feb 2024 12:54:43 +0100
In-Reply-To: <Zd0F0J5nPVQjmxIv@DUT025-TGLU.fm.intel.com>
References: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
 <20240226164455.10179-3-thomas.hellstrom@linux.intel.com>
 <Zd0F0J5nPVQjmxIv@DUT025-TGLU.fm.intel.com>
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

On Mon, 2024-02-26 at 21:42 +0000, Matthew Brost wrote:
> On Mon, Feb 26, 2024 at 05:44:54PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Local bos that don't have any gpu_vmas set up are allowed
> > to be evicted. Support that.
> >=20
> > Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external-
> > and evicted objects")
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Oded Gabbay <ogabbay@kernel.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c | 7 ++++++-
> > =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 143d93632253..2931b9030503 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1057,10 +1057,15 @@ static bool xe_bo_eviction_valuable(struct
> > ttm_buffer_object *ttm_bo,
> > =C2=A0		struct xe_vm *vm =3D xe_bo->vm;
> > =C2=A0
> > =C2=A0		if (vm && !drm_gpuvm_is_extobj(&vm->gpuvm,
> > &ttm_bo->base) &&
> > -		=C2=A0=C2=A0=C2=A0 vm->is_validating)
> > +		=C2=A0=C2=A0=C2=A0 vm->is_validating) {
> > +			/* Not bound to the vm? */
> > +			if (list_empty(&ttm_bo->base.gpuva.list))
>=20
> Do we not need a lock here? Maybe add drm_gem_gpuva_assert_lock_held
> to
> make that clear?

Good point. I'll add an assert here. The lock is needed to
read vm->is_validating as well.

/Thomas


>=20
> Matt
>=20
> > +				goto allow;
> > =C2=A0			return false;
> > +		}
> > =C2=A0	}
> > =C2=A0
> > +allow:
> > =C2=A0	return ttm_bo_eviction_valuable(ttm_bo, place);
> > =C2=A0}
> > =C2=A0
> > --=20
> > 2.43.0
> >=20

