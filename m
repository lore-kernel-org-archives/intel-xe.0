Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A80F54AC9
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 14:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2465710E6E8;
	Tue, 24 Mar 2026 14:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHf74YsG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B13E10E6E8
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774363647; x=1805899647;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FU5Z0kEQ/A3LOdXuMZyMMX/uP+sDP1LIco74vmcz+G4=;
 b=XHf74YsGdzS1iuN2RfpRmT620KdbPEe3B92QReK+CNZID3ZmCa9qXitG
 hv/HPUB0aqSJwisBEoq0gC8Yw92F22WQVY69zmVbXU4Q5E3i9g3iYLaqu
 PPD1gpARfAQhduGcYlc8MDXLs01IwxZAV/6v13RdNXtj3dgCHA/NhLcJp
 m3h47taBpXLQanbVPv3HLIJJovRiALk4i1TEws3hbJ/OlrU8l43VsonTT
 ti77pJenOO7LpAjyTTv/SOVTmWl0I54smDbm2r+kDThGmJ/hjGUJECKaH
 syMgyvOXjDfOGl0NbRUVgHE5HCj8HcU7OWLLeDnG97AVAsQKpV2s6dLo6 Q==;
X-CSE-ConnectionGUID: t/4QIRZCTNmGmGRBiYsl7w==
X-CSE-MsgGUID: nWQOxdx9Rn2Cmk9uo8LLHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75451939"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75451939"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:47:27 -0700
X-CSE-ConnectionGUID: otMgvB1PQ7eh6oM5RC/X6w==
X-CSE-MsgGUID: EoHUuDlcTceN4zX1k4MNQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="247438559"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.208])
 ([10.245.244.208])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:47:25 -0700
Message-ID: <bf99efe5398cadc1f8dcac8bb34b918eff73bee8.camel@linux.intel.com>
Subject: Re: [PATCH v7 09/12] drm/xe/dma_buf: Block export of
 DONTNEED/purged BOs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com
Date: Tue, 24 Mar 2026 15:47:22 +0100
In-Reply-To: <20260323093106.2986900-10-arvind.yadav@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
 <20260323093106.2986900-10-arvind.yadav@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Mon, 2026-03-23 at 15:00 +0530, Arvind Yadav wrote:
> Don't allow exporting BOs marked DONTNEED or PURGED as dma-bufs.
> DONTNEED BOs can have their contents discarded at any time, making
> the exported dma-buf unusable for external devices. PURGED BOs have
> no backing store and are permanently invalid.
>=20
> Return -EBUSY for DONTNEED BOs (temporary purgeable state) and
> -EINVAL for purged BOs (permanent, no backing store).
>=20
> The export path now checks the BO's purgeable state before creating
> the dma-buf, preventing external devices from accessing memory that
> may be purged at any time.
>=20
> v6:
> - Split DONTNEED =E2=86=92 -EBUSY and PURGED =E2=86=92 -EINVAL for consis=
tency
> =C2=A0 with the rest of the series (Thomas, Matt)
>=20
> v7:
> - Use Interruptible lock. (Thomas)
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_dma_buf.c | 21 +++++++++++++++++++++
> =C2=A01 file changed, 21 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> b/drivers/gpu/drm/xe/xe_dma_buf.c
> index ea370cd373e9..4edbe9f3c001 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -223,6 +223,23 @@ struct dma_buf *xe_gem_prime_export(struct
> drm_gem_object *obj, int flags)
> =C2=A0	if (bo->vm)
> =C2=A0		return ERR_PTR(-EPERM);
> =C2=A0
> +	/*
> +	 * Reject exporting purgeable BOs. DONTNEED BOs can be
> purged
> +	 * at any time, making the exported dma-buf unusable. Purged
> BOs
> +	 * have no backing store and are permanently invalid.
> +	 */
> +	xe_bo_lock(bo, true);

Missing error check.

/Thomas



> +	if (xe_bo_madv_is_dontneed(bo)) {
> +		ret =3D -EBUSY;
> +		goto out_unlock;
> +	}
> +
> +	if (xe_bo_is_purged(bo)) {
> +		ret =3D -EINVAL;
> +		goto out_unlock;
> +	}
> +	xe_bo_unlock(bo);
> +
> =C2=A0	ret =3D ttm_bo_setup_export(&bo->ttm, &ctx);
> =C2=A0	if (ret)
> =C2=A0		return ERR_PTR(ret);
> @@ -232,6 +249,10 @@ struct dma_buf *xe_gem_prime_export(struct
> drm_gem_object *obj, int flags)
> =C2=A0		buf->ops =3D &xe_dmabuf_ops;
> =C2=A0
> =C2=A0	return buf;
> +
> +out_unlock:
> +	xe_bo_unlock(bo);
> +	return ERR_PTR(ret);
> =C2=A0}
> =C2=A0
> =C2=A0static struct drm_gem_object *
