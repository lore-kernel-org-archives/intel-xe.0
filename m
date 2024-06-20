Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABB6C2BA18
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 13:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30D210E9C7;
	Thu, 20 Jun 2024 13:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pg6UOquC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4789189950
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 13:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718889119; x=1750425119;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7jBCReqSeSIPBO9uDMj53sp6WI2BXfVShEFx31BK9BQ=;
 b=Pg6UOquClfHBU4MPjbgIK5wwYj3Y8f0AyIcY/FNJufOJ2pREJ4OT1Ksb
 zoFEkBiN1fXq31J0dMdhmZRUrvkipuZil2+OBcHje3/VpNrI0glBqjMkv
 aTJBwwpv6x5+tlScHgYQ0or73zhieylTS3/CZ+eo0BznCtlrypFRUj+lA
 55E+clXqd9QpNp8CB1TeAXxib3dLi8CzcSZ6auyPRQgdynnIQtVYCBEDe
 Bcn2EribuR9blBr2rAObOBh6qmC24nBaFIXf1jKWQJgEL1WQi7qUGOte0
 XRSUDLLrL23dQBX1yrQ+ufg086NGrY+KnA2DiP8kZsgWPYbElNsCOdDC8 A==;
X-CSE-ConnectionGUID: FkGK56yCSkGi/EWyG85EvA==
X-CSE-MsgGUID: m507cXFjRY+k//PF52ExMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="41268354"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="41268354"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 06:11:45 -0700
X-CSE-ConnectionGUID: Z8gnxoDfSIWgZise/v9zqw==
X-CSE-MsgGUID: 8iZz4SGIS3CeGkbTTMN3LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42131165"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.11])
 ([10.245.244.11])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 06:11:45 -0700
Message-ID: <fcfa6c00b3b29fc169c148f8ffa08640c35b28a5.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: fix error handling in xe_migrate_update_pgtables
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Date: Thu, 20 Jun 2024 15:11:28 +0200
In-Reply-To: <20240620102025.127699-2-matthew.auld@intel.com>
References: <20240620102025.127699-2-matthew.auld@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Thu, 2024-06-20 at 11:20 +0100, Matthew Auld wrote:
> Don't call drm_suballoc_free with sa_bo pointing to PTR_ERR.
>=20
> References:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2120
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> GPUs")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v6.8+

LGTM.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 05f933787860..c9f5673353ee 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1358,7 +1358,7 @@ xe_migrate_update_pgtables(struct xe_migrate
> *m,
> =C2=A0						 GFP_KERNEL, true,
> 0);
> =C2=A0			if (IS_ERR(sa_bo)) {
> =C2=A0				err =3D PTR_ERR(sa_bo);
> -				goto err;
> +				goto err_bb;
> =C2=A0			}
> =C2=A0
> =C2=A0			ppgtt_ofs =3D NUM_KERNEL_PDE +
> @@ -1406,7 +1406,7 @@ xe_migrate_update_pgtables(struct xe_migrate
> *m,
> =C2=A0					 update_idx);
> =C2=A0	if (IS_ERR(job)) {
> =C2=A0		err =3D PTR_ERR(job);
> -		goto err_bb;
> +		goto err_sa;
> =C2=A0	}
> =C2=A0
> =C2=A0	/* Wait on BO move */
> @@ -1458,10 +1458,10 @@ xe_migrate_update_pgtables(struct xe_migrate
> *m,
> =C2=A0
> =C2=A0err_job:
> =C2=A0	xe_sched_job_put(job);
> +err_sa:
> +	drm_suballoc_free(sa_bo, NULL);
> =C2=A0err_bb:
> =C2=A0	xe_bb_free(bb, NULL);
> -err:
> -	drm_suballoc_free(sa_bo, NULL);
> =C2=A0	return ERR_PTR(err);
> =C2=A0}
> =C2=A0

