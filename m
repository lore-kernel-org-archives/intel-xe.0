Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2CDC47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 12:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6249310E688;
	Wed, 17 Jan 2024 12:38:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE2610E688
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 12:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705495138; x=1737031138;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=QRoUA374TkPSUdwUuH89If4D+4yijgW8jnfpO+o1yxE=;
 b=CC5iurjcsMKdC7YX0ckLeGcP3usJgTfdy+tpdr6GdHelaNagIBbrPbU3
 W0K7SkL4xPSAr1NSgP3bJWTN7KLhSHxFr7MWxP3PxmqqazbIDM9bx9FTb
 fJ6sdkf6ckqljLK0/7kdp5dtlE6qsCBSvPCGO+BYD25lN1BK/xRp3AFVJ
 65FFtHUfnixhUo+S7Uoc8HJER1PVi1GF6CC1+2ZUpSxV4Wp2E460lQ7qt
 L+lFaOgtBtfxMe64RaNszAbXlXB+05cGy2xz8G0VLxYiorLMp/mVLea21
 t7rYzZ9ORDL7TGLNhTfkfBRtLnlOj89tF5QDU+h+Cl98/nLhzm9Y1+7BT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="21629525"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="21629525"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:38:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="26170873"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.57])
 ([10.249.254.57])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:38:56 -0800
Message-ID: <6d136d1a9f90bab5120f73299d935859455848ea.camel@linux.intel.com>
Subject: Re: [PATCH 4/5] drm/xe: make gpuvm_ops const
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 17 Jan 2024 13:38:52 +0100
In-Reply-To: <20240117122044.1544174-4-jani.nikula@intel.com>
References: <20240117122044.1544174-1-jani.nikula@intel.com>
 <20240117122044.1544174-4-jani.nikula@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
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

On Wed, 2024-01-17 at 14:20 +0200, Jani Nikula wrote:
> Place the function pointers in rodata.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 10b6995fbf29..64558a95418c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1054,7 +1054,7 @@ static struct drm_gpuva_op
> *xe_vm_op_alloc(void)
> =C2=A0
> =C2=A0static void xe_vm_free(struct drm_gpuvm *gpuvm);
> =C2=A0
> -static struct drm_gpuvm_ops gpuvm_ops =3D {
> +static const struct drm_gpuvm_ops gpuvm_ops =3D {
> =C2=A0	.op_alloc =3D xe_vm_op_alloc,
> =C2=A0	.vm_bo_validate =3D xe_gpuvm_validate,
> =C2=A0	.vm_free =3D xe_vm_free,

