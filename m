Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B6EC47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 12:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF5110E067;
	Wed, 17 Jan 2024 12:36:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE3710E067
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 12:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705495012; x=1737031012;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=pRzGnsRmZM+8zfvWJ+3zu0uouF/xopBwrixoe02Rx8Q=;
 b=HWDmbUuZBkkljPA0qr66Whajdk0zATUYFvPk427CqpxdT31A0pNveqN3
 nlctt/sqp44SLz/7VJ6cVpLMiyeDGNyvt3gWHMkcQInqCXSI5xQzjByNV
 oSMt7EJYGYOEnXXgUR3k9Zu6d8i0GDjgiR2/DHAaGGkRCA8KYL1ZkYwGo
 T74Qu/CHky2FA1z+D050mLljSPEpQbTJn4m8fAZmXpclhSsG3Opf/Jjee
 5ErvLPsRGO70wjm106JtjcWHD1CVUwwzXZ5hQS5AvRuAIfpHviLV0PqeG
 /u5L3Nz7d2Ysg2av1ya6yZD8cMYk0/IMnC9HjG/l49Yqz/5j9x2lc+3pC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399024578"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="399024578"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:36:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="19513"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.57])
 ([10.249.254.57])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 04:36:50 -0800
Message-ID: <5ab4f020a2cc9f5248a3ed1b3d1cdc7770d60bcf.camel@linux.intel.com>
Subject: Re: [PATCH 1/5] drm/xe: make xe_ttm_funcs const
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 17 Jan 2024 13:36:48 +0100
In-Reply-To: <20240117122044.1544174-1-jani.nikula@intel.com>
References: <20240117122044.1544174-1-jani.nikula@intel.com>
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
> Place the function pointers in rodata. Also drop the extra
> declaration
> while at it.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_bo.h | 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_vm.h | 2 --
> =C2=A03 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 26fe73f58d72..686d716c5581 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1041,7 +1041,7 @@ static void xe_ttm_bo_delete_mem_notify(struct
> ttm_buffer_object *ttm_bo)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -struct ttm_device_funcs xe_ttm_funcs =3D {
> +const struct ttm_device_funcs xe_ttm_funcs =3D {
> =C2=A0	.ttm_tt_create =3D xe_ttm_tt_create,
> =C2=A0	.ttm_tt_populate =3D xe_ttm_tt_populate,
> =C2=A0	.ttm_tt_unpopulate =3D xe_ttm_tt_unpopulate,
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 350cc73cadf8..db4b2db6b073 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -243,7 +243,7 @@ int xe_bo_evict(struct xe_bo *bo, bool
> force_alloc);
> =C2=A0int xe_bo_evict_pinned(struct xe_bo *bo);
> =C2=A0int xe_bo_restore_pinned(struct xe_bo *bo);
> =C2=A0
> -extern struct ttm_device_funcs xe_ttm_funcs;
> +extern const struct ttm_device_funcs xe_ttm_funcs;
> =C2=A0
> =C2=A0int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> =C2=A0			struct drm_file *file);
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index cf2f96e8c1ab..e9c907cbcd89 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -199,8 +199,6 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm,
> bool rebind_worker);
> =C2=A0
> =C2=A0int xe_vm_invalidate_vma(struct xe_vma *vma);
> =C2=A0
> -extern struct ttm_device_funcs xe_ttm_funcs;
> -
> =C2=A0static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
> =C2=A0{
> =C2=A0	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));

