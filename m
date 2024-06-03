Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58377C25B78
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 20:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E833910E3D9;
	Mon,  3 Jun 2024 20:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c14NGIrZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565C910E3D5
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 20:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717447343; x=1748983343;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=otnxhcfSt5UbL4O0zIn8rZEGWLr567tpTzedaNns2CY=;
 b=c14NGIrZ0mEpgEQjjzLjdmDgw68Ehnae/H9GPtE8zDculucQZeso9dPg
 ZPXQ6GWwL2u5XrJgl0WH2oHJgDsuySKpVly3t+l9+LDXHISdu3iziAMXX
 V75pVHxWFE33G12+ONf+SHIp6OaChKAVOxpR4hQeotIsNpM6WifdLqdGn
 bJWm2vZnKARp1ZfWZoHl3u6keXYp8drI+UcDlFGpBj9hZfWwBKslJtweJ
 xV4sGCpYJJqNji7rYfiPfWLTnslKKw6hOJgYVrrwu1APxFfy5JOuAQn1u
 l+n3OcVFouKN3RUfF4HcJpLHN9JvdXQcPK8oOjhXxiE9trGDKev4GdqmS A==;
X-CSE-ConnectionGUID: Z+NTsKgnSVC3nhxaZhDN1A==
X-CSE-MsgGUID: d9PMHN/uSBC6Fdi04r32qA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="36482827"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="36482827"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 13:42:22 -0700
X-CSE-ConnectionGUID: Mp+SBggoR0ePzdQGZRkr+g==
X-CSE-MsgGUID: RGmqHVluQkCj6WbXpITjww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="41421303"
Received: from unknown (HELO [10.245.245.174]) ([10.245.245.174])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 13:42:21 -0700
Message-ID: <e772bf3fe4577f66f56a969ee261e218b8daf738.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Restrict user fences to long running VMs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
Date: Mon, 03 Jun 2024 22:42:19 +0200
In-Reply-To: <20240603175312.1915763-1-matthew.brost@intel.com>
References: <20240603175312.1915763-1-matthew.brost@intel.com>
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

Hi,

On Mon, 2024-06-03 at 10:53 -0700, Matthew Brost wrote:
> User fences are intended to be used on long running VMs, enforce this
> restriction. This addresses possible concerns of using user fences in
> dma-fence and having the dma-fence signal before the user fence.

As mentioned in a separate thread, We should not introduce an uAPI
change with the above motivation. We need to discuss potential use-
cases for !LR vms and if there are found to be none, we could consider
restricting in this way.

/Thomas


>=20
> Fixes: d1df9bfbf68c ("drm/xe: Only allow 1 ufence per exec / bind
> IOCTL")
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> GPUs")
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec.c | 3 ++-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0 | 3 ++-
> =C2=A02 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec.c
> b/drivers/gpu/drm/xe/xe_exec.c
> index 97eeb973e897..a145813ad229 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -168,7 +168,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
> =C2=A0			num_ufence++;
> =C2=A0	}
> =C2=A0
> -	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
> +	if (XE_IOCTL_DBG(xe, num_ufence > 1) ||
> +	=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, num_ufence && !xe_vm_in_lr_mode(vm)=
)) {
> =C2=A0		err =3D -EINVAL;
> =C2=A0		goto err_syncs;
> =C2=A0	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 26b409e1b0f0..85da3a8a83b6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3226,7 +3226,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0			num_ufence++;
> =C2=A0	}
> =C2=A0
> -	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
> +	if (XE_IOCTL_DBG(xe, num_ufence > 1) ||
> +	=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, num_ufence && !xe_vm_in_lr_mode(vm)=
)) {
> =C2=A0		err =3D -EINVAL;
> =C2=A0		goto free_syncs;
> =C2=A0	}

