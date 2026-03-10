Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BDFEB1040
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 10:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD01410E214;
	Tue, 10 Mar 2026 10:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbpRGYeh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDFE10E214
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 10:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773137959; x=1804673959;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IPm4sGGe0cmjqlvsQaQLrKvL6lmmgND+85dDVHAhlJc=;
 b=BbpRGYehRVwacON+qOnDBxiqzp6HGG66ebGDJZYasVzHbLNbYWApPE3c
 5wKvAJa72yJQbwzcvQyC5zhksaorWIHk+K7DBwuerbDQHf9uaKsVlZzmx
 xSpKc7snRxGeNtDrs6mON4vkeI5Q09PNfqAonYxL4wJnBFJ4Vtdzy7jGu
 mJKHSwOkOQFtXULnrAqrpj+A/qwZXVuJr3Ck5a/O/WD1tDjCfq2uS+HC9
 XC5LCvOqqYAYlmSq7/ECO+5dmpmYeJ6fT6Resvq7I7l8I2MmBdqYb2W6o
 YN/cxjGLMLi0p4qnNqF6urAkO71QP3Xknq6yC7r65n6CRXbfrxFZiQIeQ w==;
X-CSE-ConnectionGUID: ATJYjw/sTg6yYa01PohnRg==
X-CSE-MsgGUID: EDQrmP0DQVCMMuiBjq9sqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85267665"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85267665"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:19:19 -0700
X-CSE-ConnectionGUID: FoAz+iABQU2jfmFbACtc7A==
X-CSE-MsgGUID: CLWtUgi2Q6SN1PaaqcpCNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224525637"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.39])
 ([10.245.244.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:19:19 -0700
Message-ID: <dd1098ed4987ded7c49eb31de5a8dc3e70786124.camel@linux.intel.com>
Subject: Re: [PATCH v6 09/12] drm/xe/dma_buf: Block export of
 DONTNEED/purged BOs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Tue, 10 Mar 2026 11:19:16 +0100
In-Reply-To: <20260303152015.3499248-10-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-10-arvind.yadav@intel.com>
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

On Tue, 2026-03-03 at 20:50 +0530, Arvind Yadav wrote:
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
> index ea370cd373e9..aba6b9696030 100644
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
> +	xe_bo_lock(bo, false);

Interruptible lock.

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
