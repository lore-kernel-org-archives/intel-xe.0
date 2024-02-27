Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4253DC54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 10:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD1C10E8D5;
	Tue, 27 Feb 2024 10:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEX2VKEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E32B10E8D5
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 10:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709030469; x=1740566469;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=qQfoudj7HPrTu6hnq45LxDj5p3QwMLy3ku/0D4J7/uQ=;
 b=nEX2VKEFt2f9dbutiCSsZXA5pj1GQkLp++tUzR/5kNsBKzkT1/3UD97f
 uWwakw0KySpMUs5L/wTsfYKEtwyt4LJrA0CqLGHfr8yYjFPDPU+VDeAK4
 SfqQrqV2hf7i185264+waABuPv9Bo+Pp/m36cYmLzC75TdknVO+dNzRFK
 iOuO78HmoqQzovtufZmECbet5ZbPEFpIM3vM7aam2S08ZEjisUJDrr7xX
 MlEtBRDDRFmnRFd5+ZLOTHI7NfImlrrA9Xwe8++CYnc7Z6HsadEUVQ0Bo
 dVgVRkQ7X/TxkxWEjwmjtGJLguHgMFd56OXskWKwooOm7WeXaQxRGZmHy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3236877"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3236877"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 02:41:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="11731587"
Received: from rbriscox-mobl1.ger.corp.intel.com (HELO [10.252.3.86])
 ([10.252.3.86])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 02:41:07 -0800
Message-ID: <2f8a462eee9b6f51ceab7faa9e3f9e8ef4f0c8ed.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Validate user fence during creation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 11:41:04 +0100
In-Reply-To: <20240227024337.141585-3-matthew.brost@intel.com>
References: <20240227024337.141585-1-matthew.brost@intel.com>
 <20240227024337.141585-3-matthew.brost@intel.com>
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

On Mon, 2024-02-26 at 18:43 -0800, Matthew Brost wrote:
> Fail invalidate addresses during user fence creation.
>=20
> Fixes: dd08ebf6c352 drm/xe: ("Introduce a new DRM driver for Intel
> GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
> =C2=A01 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sync.c
> b/drivers/gpu/drm/xe/xe_sync.c
> index da8799bf7237..022e158d28d9 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -52,14 +52,18 @@ static struct user_fence
> *user_fence_create(struct xe_device *xe, u64 addr,
> =C2=A0					=C2=A0=C2=A0=C2=A0 u64 value)
> =C2=A0{
> =C2=A0	struct user_fence *ufence;
> +	u64 __user *ptr =3D u64_to_user_ptr(addr);
> +
> +	if (!access_ok(ptr, sizeof(ptr)))
> +		return ERR_PTR(-EFAULT);
> =C2=A0
> =C2=A0	ufence =3D kmalloc(sizeof(*ufence), GFP_KERNEL);
> =C2=A0	if (!ufence)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
> =C2=A0
> =C2=A0	ufence->xe =3D xe;
> =C2=A0	kref_init(&ufence->refcount);
> -	ufence->addr =3D u64_to_user_ptr(addr);
> +	ufence->addr =3D ptr;
> =C2=A0	ufence->value =3D value;
> =C2=A0	ufence->mm =3D current->mm;
> =C2=A0	mmgrab(ufence->mm);
> @@ -181,8 +185,8 @@ int xe_sync_entry_parse(struct xe_device *xe,
> struct xe_file *xef,
> =C2=A0		} else {
> =C2=A0			sync->ufence =3D user_fence_create(xe,
> sync_in.addr,
> =C2=A0						=09
> sync_in.timeline_value);
> -			if (XE_IOCTL_DBG(xe, !sync->ufence))
> -				return -ENOMEM;
> +			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
> +				return PTR_ERR(sync->ufence);
> =C2=A0		}
> =C2=A0
> =C2=A0		break;

