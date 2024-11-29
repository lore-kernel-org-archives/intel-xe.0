Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DEAD6EBEC
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 08:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CAB10E02F;
	Fri, 29 Nov 2024 08:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdWd4ACD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C214810E02F
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Nov 2024 08:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732869460; x=1764405460;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=6Gqm+kZZ6TaVpRAhZeaZAgb1vvqT0lE7L5SxNItgP7E=;
 b=GdWd4ACDCGUKtUqItP5v354PrruAlqtLiYAq8hqR9AP0hmZ7333BjVHN
 1K3zA9IO6opBtrilwCR/FX/dY07NDK1hFfPP4eCfPKq/TG+IwszjRNfqb
 CoUXDtSnbWCyebZOtWLbYRLZAQ+7uv2a6a2CjvqGfmZBqGLH70F9R8TBM
 N9085ij5E048PzvDhYKU60yKEFJqeXZZ7pLAW/4MuJQ80gvD5BhmG+DqW
 Zjg8MHLMcvvQEqbAEul5Ej7F/vRuxe3uK5MbpWvFwNKz12Kfkq84FUKwR
 y5r/Oa5hb5PERA/TWdUG/NVWFlQnK48sO9E3qhVvLcCFtNZg3+9XvJ0ho Q==;
X-CSE-ConnectionGUID: 1St0iqAUTRedlpri1cWq7A==
X-CSE-MsgGUID: nqKBcymHQ1WJXD4gKqdtPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="20698278"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208";a="20698278"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 00:37:40 -0800
X-CSE-ConnectionGUID: qRpoAoz+S0qQX74EtCsLGA==
X-CSE-MsgGUID: TnmvPCQgT7Wvp3BLC26e+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="97474306"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.229])
 ([10.245.246.229])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 00:37:38 -0800
Message-ID: <665583917e387e1cebc18a9c88fd8dd4f199f752.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: unlock object in an error condition
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Oak Zeng <oak.zeng@intel.com>, intel-xe@lists.freedesktop.org
Date: Fri, 29 Nov 2024 09:37:23 +0100
In-Reply-To: <20241128213408.1821171-1-oak.zeng@intel.com>
References: <20241128213408.1821171-1-oak.zeng@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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

Hi, Oak,


On Thu, 2024-11-28 at 16:34 -0500, Oak Zeng wrote:
> In xe_gem_fault, we reserved a buffer object but didn't unreserve
> it under an error condition. Unreserve it.
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index f51d86511cb9e..634a1b54ca60d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1286,7 +1286,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault
> *vmf)
> =C2=A0	}
> =C2=A0
> =C2=A0	if (ret =3D=3D VM_FAULT_RETRY && !(vmf->flags &
> FAULT_FLAG_RETRY_NOWAIT))
> -		goto out;
> +		goto unlock;

This change is not correct. On fault retries, the dma_resv lock and the
mmap lock is already dropped by the ttm helpers. This weird construct
is to allow wait for io outside wide locks, and then restart the fault.

So this patch can be dropped.

Thanks,
Thomas




> =C2=A0	/*
> =C2=A0	 * ttm_bo_vm_reserve() already has dma_resv_lock.
> =C2=A0	 */
> @@ -1297,6 +1297,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault
> *vmf)
> =C2=A0		mutex_unlock(&xe->mem_access.vram_userfault.lock);
> =C2=A0	}
> =C2=A0
> +unlock:
> =C2=A0	dma_resv_unlock(tbo->base.resv);
> =C2=A0out:
> =C2=A0	if (needs_rpm)

