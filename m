Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37F8C54E90
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 22:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAC810E049;
	Wed, 21 May 2025 22:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fcRmYlu3";
	dkim-atps=neutral
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F39A10E049
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 22:38:48 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-30e8feb1886so5925441a91.0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 15:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1747867128; x=1748471928;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TqaYf0caXxTCalvBSkq5/O/hg5ikBI2EJRwM50HAYMc=;
 b=fcRmYlu39czXGzhNU03AP+zjk7fhulAm78fOFvJbRgDeiJeg13tjtOpMGJa+n2K/c4
 zUBoDhf02B9eeSO552fa8UfF5BiLtk+yTi6rSMKyBLBrEK6o2bx3lqry2J84ibTuMTmN
 UKSEXibvy+fdhk3gySaMqZMrfzoZbb2gh+zMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747867128; x=1748471928;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TqaYf0caXxTCalvBSkq5/O/hg5ikBI2EJRwM50HAYMc=;
 b=KdJHPaTeRoEyiSPdTSM4uHGulmNQ51VFT0goPUzMHkGDrVme2aPd4I1kSN0+p0q3en
 qzrirq/CURQ7D/4Guf4M/+WoxT1UziZnWk1ZO2AopN81JTYX29B99B7htsD+EhIDXZEl
 Vbg5i1X/+X25pdErOP7rfPwjFfqKtEiJnZIL5mEjVMnd8Uc4OtGDRAF6TWWgeup6OVuK
 0X3ueRK86nCil0K/wVP4tUel0OC/SiMmvvIV1OlBdla1hksVGY/B9pnt9JeEV2pl7Ekg
 6lCskY2zMKqmnHoq+bC+HZzGgRbz7xkcjgdkOttOfYrARwekxNGOEukKb6+1syEUwvoK
 DleA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW88hNcsNFVAjtYaZvSicO8jE/bIWHnHMburCQIihX4YpVTCV7ENlE6XN75GmeGXT68eI6sIhn1tQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUSDuXFWiN7mPOPa4MVBz6h0vqHErzoiRnIHl3i7ClLn572Nf+
 Dl3xc3WfxBdQ2lSmZ4wVCqjMX1Gsd1CRR9j2wyr5lqexqxJIdOndzvBbH+6OdcileEVknFvS7hB
 Drbg=
X-Gm-Gg: ASbGnctVyHWcPf7CGOIpxygT9k6823qT5rPCftku0Ye/yEBy+tv1QYeXMWhuecZOFsq
 bQrk9k9GD+lpxuuycnijQOwhOa+iAIl2+vYIWF5okxCG4qhn/QmDo30PKHJMTlxTVjX473EjiVh
 zP8zfQRHyqZMcRr4aYsewxRCVbQxScpqIsXVhQ+g9Hm8sPrWnyCEGzW8/kLqLtLqA4fw1+jBf9U
 L9kWHjk6kv9n/Ciif4K4tfF2GqwW0vJHsKTWZYuv3zTIC/NNik0qWLvETIn4YkZpC7v7tBwVr1R
 l24seY4vY8D3wwniKsTe45OYSLvbWL3yUjrfcTdjl8Uy0zeOcAJ+BqDqqCRhR8GwzwiFq2ZiMxY
 1TXs99Suj108G1qmdALJXyw/NrduGGcqvpnkN3Mz5/sZ7OQ==
X-Google-Smtp-Source: AGHT+IE29kHk5wSQS6s8gwN+vMZAVyI8uRA0iimvuffrHFYjW1GWExCkFfVZLF2PAaMR4izzv51R8g==
X-Received: by 2002:a17:90b:1846:b0:2ff:64c3:3bd4 with SMTP id
 98e67ed59e1d1-30e7d5bb196mr33340598a91.31.1747867127991; 
 Wed, 21 May 2025 15:38:47 -0700 (PDT)
Received: from justonli3.c.googlers.com
 (209.131.82.34.bc.googleusercontent.com. [34.82.131.209])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30f36386a70sm4200590a91.18.2025.05.21.15.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 15:38:47 -0700 (PDT)
Message-ID: <853a4e3306f18ef2b87a132d19050741d9deeb19.camel@chromium.org>
Subject: Re: [PATCH] drm/xe/bo: add GPU memory trace points
From: Juston Li <justonli@chromium.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, intel-xe@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com, zzyiwei@google.com, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Date: Wed, 21 May 2025 22:38:46 +0000
In-Reply-To: <91fd0d47-d875-4433-b0df-b27180b9423d@ursulin.net>
References: <20250520171650.771258-1-justonli@chromium.org>
 <91fd0d47-d875-4433-b0df-b27180b9423d@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.55.2-1 
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

On Wed, 2025-05-21 at 08:49 +0100, Tvrtko Ursulin wrote:
>=20
> On 20/05/2025 18:16, Juston Li wrote:
> > Add tracepoints behind CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS for
> > tracking
> > global and per-process GPU memory usage.
> >=20
> > These are required by VSR on Android 12+ for reporting GPU driver
> > memory
> > allocations.
>=20
> + Maintainers
>=20
> For reference, this is equivalent to 204226de27c3 ("drm/msm: Add GPU=20
> memory traces") and uses the same shared tracepoints and format.
>=20
> Two small details below, with which fixed:
>=20
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Thanks Tvrtko! Sending v2.

>=20
> > Signed-off-by: Juston Li <justonli@chromium.org>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++=
+++++
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 47
> > ++++++++++++++++++++++++++++
> > =C2=A0 drivers/gpu/drm/xe/xe_device_types.h | 15 +++++++++
> > =C2=A0 3 files changed, 74 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/Kconfig.debug
> > b/drivers/gpu/drm/xe/Kconfig.debug
> > index 01735c6ece8ba..e2ecc6df954ce 100644
> > --- a/drivers/gpu/drm/xe/Kconfig.debug
> > +++ b/drivers/gpu/drm/xe/Kconfig.debug
> > @@ -111,3 +111,15 @@ config DRM_XE_USERPTR_INVAL_INJECT
> > =C2=A0=20
> > =C2=A0=C2=A0	 Recommended for driver developers only.
> > =C2=A0=C2=A0	 If in doubt, say "N".
> > +
> > +config CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS

Derp, the CONFIG_ is redundant here...

> > +	bool "Enable Xe GPU memory usage tracepoints"
> > +	default n
> > +	select TRACE_GPU_MEM
> > +	help
> > +	=C2=A0 Choose this option to enable tracepoints for tracking
> > +	=C2=A0 and per-process GPU memory usage.
>=20
> Missing word:
>=20
> ..*global* and per-process..
>=20
> > +	=C2=A0 Intended for performance profiling and required for
> > +	=C2=A0 Android.
> > +
> > +	=C2=A0 If in doubt, say "N".
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index d99d91fe8aa98..f137d6ec5357d 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -19,6 +19,8 @@
> > =C2=A0=20
> > =C2=A0 #include <kunit/static_stub.h>
> > =C2=A0=20
> > +#include <trace/events/gpu_mem.h>
> > +
> > =C2=A0 #include "xe_device.h"
> > =C2=A0 #include "xe_dma_buf.h"
> > =C2=A0 #include "xe_drm_client.h"
> > @@ -420,6 +422,35 @@ static void xe_ttm_tt_account_subtract(struct
> > ttm_tt *tt)
> > =C2=A0=C2=A0		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, -
> > (long)tt->num_pages, 0);
> > =C2=A0 }
> > =C2=A0=20
> > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > +static void update_global_total_pages(struct ttm_device *ttm_dev,
> > long num_pages)
> > +{
> > +	struct xe_device *xe =3D ttm_to_xe_device(ttm_dev);
> > +	uint64_t global_total_pages =3D
> > +		atomic64_add_return(num_pages, &xe-
> > >global_total_pages);
>=20
> Checkpatch reminds kernel should use u64 type. Here and one more just
> below.
>=20
> Regards,
>=20
> Tvrtko
>=20
> > +
> > +	trace_gpu_mem_total(0, 0, global_total_pages <<
> > PAGE_SHIFT);
> > +}
> > +
> > +static void update_process_mem(struct drm_file *file, ssize_t
> > size)
> > +{
> > +	struct xe_file *xef =3D to_xe_file(file);
> > +	uint64_t process_mem =3D atomic64_add_return(size, &xef-
> > >process_mem);
> > +
> > +	rcu_read_lock(); /* Locks file->pid! */
> > +	trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)),
> > process_mem);
> > +	rcu_read_unlock();
> > +}
> > +#else
> > +static inline void update_global_total_pages(struct ttm_device
> > *ttm_dev, long num_pages)
> > +{
> > +}
> > +
> > +static inline void update_process_mem(struct drm_file *file,
> > ssize_t size)
> > +{
> > +}
> > +#endif
> > +
> > =C2=A0 static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object
> > *ttm_bo,
> > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 page_flags)
> > =C2=A0 {
> > @@ -528,6 +559,7 @@ static int xe_ttm_tt_populate(struct ttm_device
> > *ttm_dev, struct ttm_tt *tt,
> > =C2=A0=20
> > =C2=A0=C2=A0	xe_tt->purgeable =3D false;
> > =C2=A0=C2=A0	xe_ttm_tt_account_add(tt);
> > +	update_global_total_pages(ttm_dev, tt->num_pages);
> > =C2=A0=20
> > =C2=A0=C2=A0	return 0;
> > =C2=A0 }
> > @@ -542,6 +574,7 @@ static void xe_ttm_tt_unpopulate(struct
> > ttm_device *ttm_dev, struct ttm_tt *tt)
> > =C2=A0=20
> > =C2=A0=C2=A0	ttm_pool_free(&ttm_dev->pool, tt);
> > =C2=A0=C2=A0	xe_ttm_tt_account_subtract(tt);
> > +	update_global_total_pages(ttm_dev, -(long)tt->num_pages);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct
> > ttm_tt *tt)
> > @@ -1648,6 +1681,15 @@ static void xe_gem_object_free(struct
> > drm_gem_object *obj)
> > =C2=A0=C2=A0	ttm_bo_put(container_of(obj, struct ttm_buffer_object,
> > base));
> > =C2=A0 }
> > =C2=A0=20
> > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > +static int xe_gem_object_open(struct drm_gem_object *obj,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)
> > +{
> > +	update_process_mem(file_priv, obj->size);
> > +	return 0;
> > +}
> > +#endif
> > +
> > =C2=A0 static void xe_gem_object_close(struct drm_gem_object *obj,
> > =C2=A0=C2=A0				struct drm_file *file_priv)
> > =C2=A0 {
> > @@ -1660,6 +1702,8 @@ static void xe_gem_object_close(struct
> > drm_gem_object *obj,
> > =C2=A0=C2=A0		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > =C2=A0=C2=A0		xe_bo_unlock(bo);
> > =C2=A0=C2=A0	}
> > +
> > +	update_process_mem(file_priv, -obj->size);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > @@ -1757,6 +1801,9 @@ static const struct vm_operations_struct
> > xe_gem_vm_ops =3D {
> > =C2=A0=20
> > =C2=A0 static const struct drm_gem_object_funcs xe_gem_object_funcs =3D=
 {
> > =C2=A0=C2=A0	.free =3D xe_gem_object_free,
> > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > +	.open =3D xe_gem_object_open,
> > +#endif
> > =C2=A0=C2=A0	.close =3D xe_gem_object_close,
> > =C2=A0=C2=A0	.mmap =3D drm_gem_ttm_mmap,
> > =C2=A0=C2=A0	.export =3D xe_gem_prime_export,
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index f81be293b260e..5fb65f1c64cd6 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -639,6 +639,13 @@ struct xe_device {
> > =C2=A0=C2=A0		unsigned int fsb_freq, mem_freq, is_ddr3;
> > =C2=A0=C2=A0	};
> > =C2=A0 #endif
> > +
> > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > +	/**
> > +	 * @global_mem: global GPU pages usage tracked for gpu_mem
> > tracepoints
> > +	 */
> > +	atomic64_t global_total_pages;
> > +#endif
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 /**
> > @@ -700,6 +707,14 @@ struct xe_file {
> > =C2=A0=20
> > =C2=A0=C2=A0	/** @refcount: ref count of this xe file */
> > =C2=A0=C2=A0	struct kref refcount;
> > +
> > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > +	/**
> > +	 * @process_mem: per-process GPU memory usage tracked for
> > gpu_mem
> > +	 * tracepoints
> > +	 */
> > +	atomic64_t process_mem;
> > +#endif
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 #endif
>=20

