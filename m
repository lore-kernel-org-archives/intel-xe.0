Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A28C606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 08:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OT9nd6kE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D166B112075;
	Thu, 19 Nov 2026 08:08:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8A0112075
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 08:08:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 960A547464;
 Thu, 19 Nov 2026 08:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC581F000C6;
 Thu, 19 Nov 2026 08:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795075705;
 bh=yaxq1x1UkRgGmTxZEnWJK6IEZPQEkPLWxqSKAzuB8j8=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=OT9nd6kEy5q8zHGihDcsJryr7BHS8vRGfE03VQOUid15yU/aeTTLtS2bRvAQwtZY2
 LftO8Mj2BwumvADDVQssjx2tRcmQzAXDZajLPby5A1LpertJCLIODXFlN9Xof8nkXR
 0jxM8zkPIyuoWGpRsCoyPuS5LcCg+G/sf5051xdPLx0VYw4bxHLg8pf31ZD7xljvaL
 qMDtgeAV9y0gEUmmTWmHHX3ykGByMpCMn29vVu8170CKLrK6TlKHijyVqXUSUcjnEg
 OauRoBcXYv8WDIuRtzAaFD7l/qRNkD83zWdxNrRrTGyFREvWKooQMsasuDf8NsVGzP
 V/wruvFNyhZ1A==
Message-ID: <sashiko-outbox-222643@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2] drm/xe/nvl-p: Add Wa_14028564128
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261119075242.3292552-2-tejas.upadhyay@intel.com>
References: <20261119075242.3292552-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 08:08:24 +0000
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Low] drm/xe: dead xe_pat_wa_14028564128_safe_userptr_index() check in
  VM bind/madvise
- [Low] drm/xe: xe_pat_wa_14026539277_reserved() is dead code under
  Wa_14028564128
- [Low] drm/xe: commit message lacks Wa_14028564128 description and
  stepping scope
--

commit a633547ef8e235a15273f650a42f77a0dff5896d
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

> drm/xe/nvl-p: Add Wa_14028564128
>
> Wa_14028564128 applies to 35.10
>
> V2:
> - Add missing pat indexes to no_promote as asked by WA
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

[Severity: Low]
Could the commit message explain what Wa_14028564128 does and why it lifts
the UAPI reservation of 2-way coherent PAT indices?  Also, the commit
message says the workaround applies to 35.10, while xe_wa_oob.rules
restricts it to steppings [A0, B0) of graphics version 35.10.

> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 5938fef22579a..24caed2626425 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -337,6 +337,18 @@ bool xe_pat_wa_14026539277_reserved(struct xe_device=
 *xe, u16 pat_index)
>  		}
>  	}
> =20
> +	/*
> +	 * Wa_14028564128 remaps every PAT index that is statically 2-way
> +	 * coherent (indices 2, 7, 23, 27 and 31 in this table) to a safe
> +	 * no-promote/UC/1-way value, so none of them are subject to this
> +	 * restriction once that WA is enabled.
> +	 */
> +	for_each_gt(gt, xe, id) {
> +		if (XE_GT_WA(gt, 14028564128) &&
> +		    xe_pat_index_get_coh_mode(xe, pat_index) =3D=3D XE_COH_2WAY)
> +			return false;
> +	}
> +
>  	/*
>  	 * Disallow 2-way coherency for any L3 cache policy because
>  	 * XE_L3_POLICY_UC could still be promoted to a cached policy
> @@ -345,6 +357,21 @@ bool xe_pat_wa_14026539277_reserved(struct xe_device=
 *xe, u16 pat_index)
>  	return has_wa && xe_pat_index_get_coh_mode(xe, pat_index) =3D=3D XE_COH=
_2WAY;
>  }

[Severity: Low]
Does xe_pat_wa_14026539277_reserved() ever return true now?

In xe_wa_oob.rules, both 14026539277 and 14028564128 match the exact same
rule: GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0).  Whenever has_wa is
true and xe_pat_index_get_coh_mode(xe, pat_index) =3D=3D XE_COH_2WAY, the n=
ew
loop above already returns false.  In addition, the comment here says
Wa_14028564128 remaps those entries to no-promote/UC/1-way, whereas
wa_14028564128_fixup_pat_value() only sets XE2_NO_PROMOTE and relies on
wa_14026539277_fixup_pat_value() having already converted them to L3 UC and
1-way coherency.

> +bool xe_pat_wa_14028564128_safe_userptr_index(struct xe_device *xe, u16 =
pat_index)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	if (pat_index !=3D 2)
> +		return false;
> +
> +	for_each_gt(gt, xe, id)
> +		if (XE_GT_WA(gt, 14028564128))
> +			return true;
> +
> +	return false;
> +}

[ ... ]

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
Is xe_pat_wa_14028564128_safe_userptr_index() dead code across all four
call sites in xe_vm.c and xe_vm_madvise.c?

xe_pat_index_get_coh_mode() reads the static xe->pat.table[pat_index].coh_m=
ode
entry, which is XE_COH_2WAY for PAT index 2 (as well as 7, 23, 27, and 31)
in xe3p_lpg_pat_table.  Because xe_pat_wa_14028564128_safe_userptr_index()
only returns true when pat_index =3D=3D 2, coh_mode !=3D XE_COH_2WAY is alr=
eady
false whenever the helper could return true, so the condition short-circuits
before the helper's result can have any effect.  Once
xe_pat_wa_14026539277_reserved() stops rejecting the 2-way coherent PAT
indices, the existing coh_mode !=3D XE_COH_2WAY checks already accept them
without this helper.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119075242.3292=
552-2-tejas.upadhyay@intel.com?part=3D1
