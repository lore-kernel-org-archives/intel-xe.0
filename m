Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA309606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLAC1KIZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D2C88F78;
	Wed, 18 Nov 2026 15:11:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0DE10FDA3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 15:11:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C2C9A62261;
 Wed, 18 Nov 2026 15:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D591F000C4;
 Wed, 18 Nov 2026 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795014703;
 bh=h/znRILvOQTRF5grByQlV3DnNPbRLneN0bli/t/UMBE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=DLAC1KIZ8+7bi1Ecp3Dn1Tgz3zxaV6oMHNyuVqL6Qe4pin8ovBaXIP46MsoKbgzUR
 6bpI1JOcxzrIw57UFpZ/TnbEHP5DZyny0rieXNzQYJq6DeQMAVedB6Sm9EYOHaY5UK
 blW8ivEfI8EUjcDfLUuytfNPnbpm1PHg6YRXJpyGGoaMOfGmeY8egUpN444yH9h2Xj
 VZHJWYHHPus/MT68YsL1YOkNKCWRH20FbVkxjpv5zqCJVBTWkckaiSdxEWY6swQ24o
 ZqF2qaXnSCsQb9dCZc9cG1tXavLvGpvPBOVau12pmUNDFuLDuc0fJCZBn7i+yVfS9W
 rPjvVuM3dA6yw==
Message-ID: <sashiko-outbox-221298@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/nvl-p: Add Wa_14028564128
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261118145429.3281059-2-tejas.upadhyay@intel.com>
References: <20261118145429.3281059-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 15:11:42 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] drm/xe: missing wa_14028564128_fixup_pat_value() in
  xe_pat_dump_sw_config()
- [Low] drm/xe: redundant xe_pat_wa_14028564128_safe_userptr_index()
  checks
--

commit 683d82e78ad6b286b430cc2236f6f9fa00bba693
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/nvl-p: Add Wa_14028564128

This commit implements Wa_14028564128 for graphics version 35.10 steppings
A0..B0 by setting XE2_NO_PROMOTE on PAT index 2 and allowing PAT index 2 in
VM_BIND and VM_MADVISE ioctl checks.

> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 5938fef22579a..49c776da4e9f3 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
[ ... ]
> @@ -420,6 +450,8 @@ static void program_pat_mcr(struct xe_gt *gt, const s=
truct xe_pat_table_entry ta
>  		struct xe_reg_mcr reg_mcr =3D XE_REG_MCR(_PAT_INDEX(i));
>  		u32 pat =3D wa_14026539277_fixup_pat_value(gt, table[i].value);
> =20
> +		pat =3D wa_14028564128_fixup_pat_value(gt, i, pat);
> +
>  		xe_gt_mcr_multicast_write(gt, reg_mcr, pat);
>  	}
> =20

[Severity: Low]
Should xe_pat_dump_sw_config() also call wa_14028564128_fixup_pat_value()?

xe_pat_dump_sw_config() calls wa_14026539277_fixup_pat_value() and
xe_pat_wa_14026539277_reserved(), so without wa_14028564128_fixup_pat_value=
()
the pat_sw_config debugfs node reports PAT[2] as unreserved with
no_promote =3D 0, disagreeing with the hardware register value programmed by
program_pat_mcr() and dumped by xe_pat_dump().

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dd855876f571c..80ccaa44720ce 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3888,7 +3888,8 @@ static int vm_bind_ioctl_check_args(struct xe_devic=
e *xe, struct xe_vm *vm,
>  		    XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
>  				 (op =3D=3D DRM_XE_VM_BIND_OP_MAP_USERPTR ||
>  				  is_cpu_addr_mirror) &&
> -				 (pat_index !=3D 19 && coh_mode !=3D XE_COH_2WAY)) ||
> +				 (pat_index !=3D 19 && coh_mode !=3D XE_COH_2WAY &&
> +				  !xe_pat_wa_14028564128_safe_userptr_index(xe, pat_index))) ||
>  		    XE_IOCTL_DBG(xe, comp_en &&
>  				 op =3D=3D DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>  		    XE_IOCTL_DBG(xe, op =3D=3D DRM_XE_VM_BIND_OP_MAP_USERPTR &&

[Severity: Low]
Is the xe_pat_wa_14028564128_safe_userptr_index() check here (and in
xe_vm_bind_ioctl_validate_bo() and xe_vm_madvise_ioctl()) redundant?

coh_mode comes from xe_pat_index_get_coh_mode(), which returns the static
xe->pat.table[pat_index].coh_mode value.  In xe3p_lpg_pat_table, entry 2 has
coh_mode =3D=3D XE_COH_2WAY, while xe_pat_wa_14028564128_safe_userptr_index=
()
only returns true when pat_index =3D=3D 2.  When pat_index =3D=3D 2,
coh_mode !=3D XE_COH_2WAY is already false and short-circuits before calling
xe_pat_wa_14028564128_safe_userptr_index().  Exempting PAT index 2 inside
xe_pat_wa_14026539277_reserved() already allows it through unless
xe_pat_index_get_coh_mode() itself is changed to report the remapped
1-way coherency mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118145429.3281=
059-2-tejas.upadhyay@intel.com?part=3D1
