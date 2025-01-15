Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD34FC02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 08:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868C410E562;
	Wed, 15 Jan 2025 08:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUsI+9a7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B557810E562
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736930690; x=1768466690;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KFpxxalVysm9lapDA0iL1sDClQO/Yo0AllUya/2KTRQ=;
 b=ZUsI+9a7PkRqEHUQsYVgUD+GCIFaoEOpoNxU8SPSBxjsZ1gdCqcVKpzT
 ZyhIzKomTJPlv3445E35kJJj8j65W70f8kxb2tkX/+6nEEnykn07g87NZ
 BVCSEnh+/r/sEOGT0DBKJne38FE6LUvGXleOvWAig8hiG2z1iaSo7n7w5
 9BfDvJeWyY32OxhZThX9VYofGjwGOhBeDDrw918H3LyBxcuODR0p6fHap
 qReU4TL+j6LXpw3DQfeZeH0ES0G4SOdCh0pWh8OzihvJIdAQsdlw6z4wx
 7yj2yioPdl/14U2CMOB02JEs1nftZeSQfVOwJ5PuXJ8StuAEYzuzGk4BL A==;
X-CSE-ConnectionGUID: 0GS63uSFQ9mYCUSyMp/CZQ==
X-CSE-MsgGUID: 3Qlh7dOySJaCKjnc+s6m6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="54671603"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="54671603"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 00:44:49 -0800
X-CSE-ConnectionGUID: n3jnEZZJTV6OLT3mruzW0Q==
X-CSE-MsgGUID: R3mbrsc/S9qCNp8Pjl1/+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="110055567"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.51])
 ([10.245.246.51])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 00:44:48 -0800
Message-ID: <815868fae4611bf9dd594dd56393486d653d2c23.camel@linux.intel.com>
Subject: Re: [PATCH v7 6/8] drm/xe: Use ttm_bo_access in
 xe_vm_snapshot_capture_delayed
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed, 15 Jan 2025 09:44:44 +0100
In-Reply-To: <20241126174615.2665852-7-matthew.brost@intel.com>
References: <20241126174615.2665852-1-matthew.brost@intel.com>
 <20241126174615.2665852-7-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

Hi, Matthew

On Tue, 2024-11-26 at 09:46 -0800, Matthew Brost wrote:
> Non-contiguous mapping of BO in VRAM doesn't work, use ttm_bo_access
> instead.
>=20
> v2:
> =C2=A0- Fix error handling
>=20
> Fixes: 0eb2a18a8fad ("drm/xe: Implement VM snapshot support for BO's
> and userptr")

I've been holding this patch off from stable since it relies on the
actual access() ttm callback being implemented for xe, and I don't
believe it is.

Now with the first PR for 6.14, this will start getting backport
requests from the stable maintainers and if we don't block them, I
guess functionality might break?

Would it be possible to provide a sane backport of this functionality
on top of 6.13-rc? (the drm-xe-fixes branch)?

Thanks,
Thomas


> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 17 ++++++-----------
> =C2=A01 file changed, 6 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1d7faeba157e..2492750505d6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3309,7 +3309,6 @@ void xe_vm_snapshot_capture_delayed(struct
> xe_vm_snapshot *snap)
> =C2=A0
> =C2=A0	for (int i =3D 0; i < snap->num_snaps; i++) {
> =C2=A0		struct xe_bo *bo =3D snap->snap[i].bo;
> -		struct iosys_map src;
> =C2=A0		int err;
> =C2=A0
> =C2=A0		if (IS_ERR(snap->snap[i].data))
> @@ -3322,16 +3321,12 @@ void xe_vm_snapshot_capture_delayed(struct
> xe_vm_snapshot *snap)
> =C2=A0		}
> =C2=A0
> =C2=A0		if (bo) {
> -			xe_bo_lock(bo, false);
> -			err =3D ttm_bo_vmap(&bo->ttm, &src);
> -			if (!err) {
> -				xe_map_memcpy_from(xe_bo_device(bo),
> -						=C2=A0=C2=A0 snap-
> >snap[i].data,
> -						=C2=A0=C2=A0 &src, snap-
> >snap[i].bo_ofs,
> -						=C2=A0=C2=A0 snap-
> >snap[i].len);
> -				ttm_bo_vunmap(&bo->ttm, &src);
> -			}
> -			xe_bo_unlock(bo);
> +			err =3D ttm_bo_access(&bo->ttm, snap-
> >snap[i].bo_ofs,
> +					=C2=A0=C2=A0=C2=A0 snap->snap[i].data,
> snap->snap[i].len, 0);
> +			if (!(err < 0) && err !=3D snap->snap[i].len)
> +				err =3D -EIO;
> +			else if (!(err < 0))
> +				err =3D 0;
> =C2=A0		} else {
> =C2=A0			void __user *userptr =3D (void __user
> *)(size_t)snap->snap[i].bo_ofs;
> =C2=A0

