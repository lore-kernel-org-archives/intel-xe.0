Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0189CC54E49
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 09:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C87710EFC8;
	Mon, 26 Feb 2024 09:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goUnjXls";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05FC10EFCA
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 09:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708939091; x=1740475091;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=6F3bIf8uMbVyM6cAmjh0THYuXR2Q9jhA2hMFSrtow8U=;
 b=goUnjXls+/ASpA6ynEIqW3q9+BCkrBxmiHn5C1Lg5CSwUoCMs9ySrGuk
 D/IKThU7KMhob7foZSDOthGbUhff3TZ04vEvL/d5CsZeTQKwpnOCL7BWc
 GOlMctV/huW3mbqdZbtC6qLZM0cDg4aseoKsDdZ+bDKnDTfBBpCOWgZbT
 968avSMOtIz21mGFlhHMJ4e9i9ZgFr6JqGZc2szIqIUpyXTrkr8OXgQt3
 jxUN0gfM7gOh8zYhTfQxzZG/y/6k+zBeSGWi64jGTj3c1CUt0C+DUfWWs
 kgXoYyqcKBcYj1xb8psPf5TIbZQIH33Ia+G6inhJiRYwiumzWLP423HWL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="25682034"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="25682034"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="44087740"
Received: from hekner-mobl1.ger.corp.intel.com (HELO [10.249.254.134])
 ([10.249.254.134])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:18:09 -0800
Message-ID: <5d3d54c8a37debbff3f597c1fad36be90637ae81.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Use vmalloc for array of bind allocation in
 bind IOCTL
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Mon, 26 Feb 2024 10:18:06 +0100
In-Reply-To: <20240223193719.6495-1-matthew.brost@intel.com>
References: <20240223193719.6495-1-matthew.brost@intel.com>
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

Hi, Matt
On Fri, 2024-02-23 at 11:37 -0800, Matthew Brost wrote:
> Use vmalloc in effort to allow a user pass in a large number of binds
> in
> an IOCTL (mesa use case). Also use array allocations rather open
> coding
> the size calculation.

I still think allowing a large number of binds like this is a bit
dangerous, because to avoid out-of-memory DOSes we will need to
restrict the number of binds in some way. And if the UMDs can't
gracefully handle the OOMS and retry with a smaller number of binds
they will break. And we're not allowed to break the.....

Did we end up keeping a max number of binds that we guarantee for
forseeable future?

/Thomas


>=20
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 23 ++++++++++++-----------
> =C2=A01 file changed, 12 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e3bde897f6e8..45a12207ebf5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2778,8 +2778,9 @@ static int vm_bind_ioctl_check_args(struct
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
> +					=C2=A0=C2=A0 GFP_KERNEL);
> =C2=A0		if (!*bind_ops)
> =C2=A0			return -ENOMEM;
> =C2=A0
> @@ -2869,7 +2870,7 @@ static int vm_bind_ioctl_check_args(struct
> xe_device *xe,
> =C2=A0
> =C2=A0free_bind_ops:
> =C2=A0	if (args->num_binds > 1)
> -		kfree(*bind_ops);
> +		kvfree(*bind_ops);
> =C2=A0	return err;
> =C2=A0}
> =C2=A0
> @@ -2957,13 +2958,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0	}
> =C2=A0
> =C2=A0	if (args->num_binds) {
> -		bos =3D kcalloc(args->num_binds, sizeof(*bos),
> GFP_KERNEL);
> +		bos =3D kvcalloc(args->num_binds, sizeof(*bos),
> GFP_KERNEL);
> =C2=A0		if (!bos) {
> =C2=A0			err =3D -ENOMEM;
> =C2=A0			goto release_vm_lock;
> =C2=A0		}
> =C2=A0
> -		ops =3D kcalloc(args->num_binds, sizeof(*ops),
> GFP_KERNEL);
> +		ops =3D kvcalloc(args->num_binds, sizeof(*ops),
> GFP_KERNEL);
> =C2=A0		if (!ops) {
> =C2=A0			err =3D -ENOMEM;
> =C2=A0			goto release_vm_lock;
> @@ -3104,10 +3105,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
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
> @@ -3131,10 +3132,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
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

