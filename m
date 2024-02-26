Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814D1C48BF6
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 16:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3955C10E7A9;
	Mon, 26 Feb 2024 16:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBj+dhPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC6E10E7A9
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 16:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708963280; x=1740499280;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=JQUNEaWRI9ZDLO1xzKUJInxMasewYmxmEj0SQOR/XvI=;
 b=JBj+dhPPl2l+UOaH0ZiNrz9AYD6nllHaxOS7ygtF15C4CvTpLkkM7JdQ
 YHKYs2lCdDZQ7pj235Rv+AFOVGUhgiQ8tFzTnDrnr1j9g8Vg2HKSfQmGI
 eeH/DXGjuwfBdzucps+l1+X2fVEo5qYxsJypsjm7JDZcHBYIJhjovXsF3
 T24NCRUxDsjPxil3H1EVIuU0Z7KBJ0Wp23VZXdd3ZbFxuacK3oydCr8Sh
 XBwSmTCcUbcqlO931ad1/mO4+3l1ZO7DuLE083tFwBngtLQSomFwB8tWs
 3glJUy+IbN7AYnj/MiqpyRC5Ls2O0wtYCpL0jVqcH6GURPYL+Jw1am9Vd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="13961385"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="13961385"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:01:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6848349"
Received: from shunter1-mobl.ger.corp.intel.com (HELO [10.252.3.88])
 ([10.252.3.88])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:01:18 -0800
Message-ID: <1e8e5848b26b5a44941ab449afc20476aa35bc55.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Use vmalloc for array of bind allocation in
 bind IOCTL
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Mon, 26 Feb 2024 17:01:16 +0100
In-Reply-To: <20240226155554.103384-1-matthew.brost@intel.com>
References: <20240226155554.103384-1-matthew.brost@intel.com>
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

On Mon, 2024-02-26 at 07:55 -0800, Matthew Brost wrote:
> Use vmalloc in effort to allow a user pass in a large number of binds
> in
> an IOCTL (mesa use case). Also use array allocations rather open
> coding
> the size calculation.
>=20
> v2: Use __GFP_ACCOUNT for allocations (Thomas)
>=20
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 25 ++++++++++++++-----------
> =C2=A01 file changed, 14 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index db3f049a47dc..4154ef75e369 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2770,8 +2770,9 @@ static int vm_bind_ioctl_check_args(struct
> xe_device *xe,
> =C2=A0		u64 __user *bind_user =3D
> =C2=A0			u64_to_user_ptr(args->vector_of_binds);
> =C2=A0
> -		*bind_ops =3D kmalloc(sizeof(struct drm_xe_vm_bind_op)
> *
> -				=C2=A0=C2=A0=C2=A0 args->num_binds, GFP_KERNEL);
> +		*bind_ops =3D kvmalloc_array(args->num_binds,
> +					=C2=A0=C2=A0 sizeof(struct
> drm_xe_vm_bind_op),
> +					=C2=A0=C2=A0 GFP_KERNEL |
> __GFP_ACCOUNT);
> =C2=A0		if (!*bind_ops)
> =C2=A0			return -ENOMEM;
> =C2=A0
> @@ -2861,7 +2862,7 @@ static int vm_bind_ioctl_check_args(struct
> xe_device *xe,
> =C2=A0
> =C2=A0free_bind_ops:
> =C2=A0	if (args->num_binds > 1)
> -		kfree(*bind_ops);
> +		kvfree(*bind_ops);
> =C2=A0	return err;
> =C2=A0}
> =C2=A0
> @@ -2949,13 +2950,15 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0	}
> =C2=A0
> =C2=A0	if (args->num_binds) {
> -		bos =3D kcalloc(args->num_binds, sizeof(*bos),
> GFP_KERNEL);
> +		bos =3D kvcalloc(args->num_binds, sizeof(*bos),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL | __GFP_ACCOUNT);
> =C2=A0		if (!bos) {
> =C2=A0			err =3D -ENOMEM;
> =C2=A0			goto release_vm_lock;
> =C2=A0		}
> =C2=A0
> -		ops =3D kcalloc(args->num_binds, sizeof(*ops),
> GFP_KERNEL);
> +		ops =3D kvcalloc(args->num_binds, sizeof(*ops),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL | __GFP_ACCOUNT);
> =C2=A0		if (!ops) {
> =C2=A0			err =3D -ENOMEM;
> =C2=A0			goto release_vm_lock;
> @@ -3096,10 +3099,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0	for (i =3D 0; bos && i < args->num_binds; ++i)
> =C2=A0		xe_bo_put(bos[i]);
> =C2=A0
> -	kfree(bos);
> -	kfree(ops);
> +	kvfree(bos);
> +	kvfree(ops);
> =C2=A0	if (args->num_binds > 1)
> -		kfree(bind_ops);
> +		kvfree(bind_ops);
> =C2=A0
> =C2=A0	return err;
> =C2=A0
> @@ -3123,10 +3126,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0	if (q)
> =C2=A0		xe_exec_queue_put(q);
> =C2=A0free_objs:
> -	kfree(bos);
> -	kfree(ops);
> +	kvfree(bos);
> +	kvfree(ops);
> =C2=A0	if (args->num_binds > 1)
> -		kfree(bind_ops);
> +		kvfree(bind_ops);
> =C2=A0	return err;
> =C2=A0}
> =C2=A0

