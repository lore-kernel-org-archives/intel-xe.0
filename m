Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9347C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 20:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7966710E6A8;
	Wed, 28 May 2025 20:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ITmMfmpO";
	dkim-atps=neutral
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A5D10E6A9
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 20:01:22 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b0db0b6a677so181343a12.2
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 13:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1748462482; x=1749067282;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1hLyUAeoeB341+oaDdjiptOZMPn4CRdP1gsbN5LfP2A=;
 b=ITmMfmpOwei9NOdJvA4Ar7G2HE9bOw30csMr4mh3/zziq2nNHNThklCcEKdJ8Gb+6b
 iMflUc3YL6d32F09CV7gkruzjF+3DtLbALoNbCzGwjo9GrEWInY/LNnkP+CaWyOd5ECb
 firLD5zaARka0oy8YojGGNKqKtVVnbIIdhpFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748462482; x=1749067282;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1hLyUAeoeB341+oaDdjiptOZMPn4CRdP1gsbN5LfP2A=;
 b=NmQ5FcwqD3GPMmMNSTQOWxHLBs0iU/6vnRzcG0FbbTS4/DFVVmGWmLmmcMVn4eIGjx
 EwPzSLP4+4quh/WDW63jUevK9fG5zM40149vh1L5/cGMGPChUy94jx0PYmBxIm1Yfm4l
 Suj507CwBkklIrvcJ3Xk6MHrUGNeG/ZiDdd6zjBobeiK+NNKNA/9BcqkWJW2cGT3otsu
 HJZHJhozdCqWQHL9AFVUYEEvArLnFLiSLi+hHHvCtRjA009ptxjZhOWewLcz6faAQ3NM
 WCzSKpl8st6VmQn8ZVErmdXJKUv98lzus6eVgYQ2KBpHI4My6Ax8L5HD06UKKlKPu+VJ
 BVBA==
X-Gm-Message-State: AOJu0YxfVLVl6ImcDtz5gy0JoyC16TSoyWzGxJ31905Vs4hQEOZTCNLR
 0hjvqocHPtyqjC8kFRM8dVWF8IyMHtHux61UvgY0821SJ5x5D2vNQUIRLjZTdm1mng==
X-Gm-Gg: ASbGnctJkIPE2zhbrNNg5TRdeIUCd2MRiXH4iulUiAbSGfH8cCW+ZmPtaVL5Yx+lvqq
 uAtQjbb1r3HdMGwA5a7YKkAx0BSgLMLsQA2yIbDBfj47TQoAgTBx48FxYi4jy2mTU3jpj9X9T7h
 7TnEwDB52u381Ai2zP53wA1ucgE/LDlRp2e7aS6EXxQwG89JJFqJvsozekUW4QxKhaM8A2o52N6
 M+8gkfoCEIpcRanZ3d/A7eUlrUsb6bwI8Z2lwR2TPDb8WPOUiC1vh8cHAC7rSfb7usU/VzrFDYi
 ZnVjp/pLSwiePbSqOQe9LJu0X7ASw2uY9CSZ2Dn//NaR8EOB/WNTQ/XxbevpB/VO0T/gp5BfZFG
 g6LUfl66aunykNDoc+Kpze9lYL25YG1UzDjg=
X-Google-Smtp-Source: AGHT+IEYaGLpJcY5jBOAoGZnT+oltE8eAs7WCZfihhs4nhmMJREYNdquz4RmqsyHorxecn0fB/4Ryg==
X-Received: by 2002:a17:90b:1809:b0:311:b5ac:6f63 with SMTP id
 98e67ed59e1d1-311b5ac7125mr8233997a91.21.1748462482318; 
 Wed, 28 May 2025 13:01:22 -0700 (PDT)
Received: from justonli3.c.googlers.com
 (209.131.82.34.bc.googleusercontent.com. [34.82.131.209])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3121bdc5937sm21015a91.46.2025.05.28.13.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 13:01:21 -0700 (PDT)
Message-ID: <cf88959ee067702b2cf0b12877faa1c0476f6805.camel@chromium.org>
Subject: Re: [PATCH v2] drm/xe/bo: add GPU memory trace points
From: Juston Li <justonli@chromium.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Yiwei Zhang <zzyiwei@google.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
Date: Wed, 28 May 2025 20:01:21 +0000
In-Reply-To: <d83d2f3c85c8aaf9a6e55457ad7744f9f19d9b65.camel@chromium.org>
References: <20250521224239.856298-1-justonli@chromium.org>
 <vvtskvjaqcorex5xpeyyyuvljgikpdyo2vbncgmsdlutpnfaeb@u5gtlafthvh2>
 <c5a7ed00-cbae-490a-86ba-e94060097760@ursulin.net>
 <d83d2f3c85c8aaf9a6e55457ad7744f9f19d9b65.camel@chromium.org>
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

On Wed, 2025-05-28 at 18:34 +0000, Juston Li wrote:
> On Thu, 2025-05-22 at 16:14 +0100, Tvrtko Ursulin wrote:
> >=20
> > On 22/05/2025 15:50, Lucas De Marchi wrote:
> > > + dri-devel
> > >=20
> > > On Wed, May 21, 2025 at 10:42:35PM +0000, Juston Li wrote:
> > > > Add tracepoints behind CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS for
> > > > tracking
> > > > global and per-process GPU memory usage.
> > > >=20
> > > > These are required by VSR on Android 12+ for reporting GPU
> > > > driver
> > > > memory
> > > > allocations.
> > > >=20
> > > > v2:
> > > > - Use u64 as preferred by checkpatch (Tvrtko)
> > > > - Fix errors in comments/Kconfig description (Tvrtko)
> > > > - drop redundant "CONFIG_" in Kconfig
> > > >=20
> > > > Signed-off-by: Juston Li <justonli@chromium.org>
> > > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > ---
> > > > drivers/gpu/drm/xe/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +++++=
++
> > > > drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 47
> > > > ++++++++++++++++++++++++++++
> > > > drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
> > > > 3 files changed, 75 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/Kconfig.debug
> > > > b/drivers/gpu/drm/xe/=20
> > > > Kconfig.debug
> > > > index 01735c6ece8ba..2371eeda0afd5 100644
> > > > --- a/drivers/gpu/drm/xe/Kconfig.debug
> > > > +++ b/drivers/gpu/drm/xe/Kconfig.debug
> > > > @@ -111,3 +111,15 @@ config DRM_XE_USERPTR_INVAL_INJECT
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 Recommended for driver developers only.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 If in doubt, say "N".
> > > > +
> > > > +config DRM_XE_GPU_MEM_TRACEPOINTS
> > >=20
> > > is there any particular reason to make this user-configurable per
> > > driver?
> > > Why aren't we making CONFIG_TRACE_GPU_MEM configurable (if
> > > needed,
> > > but
> > > could just depend on CONFIG_TRACEPOINTS) and then drivers just
> > > use
> > > it.
> >=20
> > Could be done like that too. Msm does unconditional select
> > TRACE_GPU_MEM=20
> > which I thought wouldn't be acceptable so I suggested making it=20
> > configurable.
>=20
> Ok yeah, I don't see a reason to make it per-driver either. I'll make
> CONFIG_TRACE_GPU_MEM configurable since we don't have
> CONFIG_TRACEPOINTS or CONFIG_TRACING enabled on GKI.
>=20
> Juston

Scratch that, CONFIG_TRACEPOINTS is enabled on GKI so we could do the
depend.

But now that I think about it, CONFIG_TRACEPOINTS seems enabled so
commonly I wonder if we might as well just unconditional select like
Msm as Tvrtko mentioned and then not have to deal with the #ifdefs?

If that's not acceptable, I'm leaning on just making
CONFIG_TRACE_GPU_MEM configurable.

Juston

> > > > +=C2=A0=C2=A0=C2=A0 bool "Enable Xe GPU memory usage tracepoints"
> > > > +=C2=A0=C2=A0=C2=A0 default n
> > > > +=C2=A0=C2=A0=C2=A0 select TRACE_GPU_MEM
> > > > +=C2=A0=C2=A0=C2=A0 help
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Choose this option to enable tracep=
oints for tracking
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 global and per-process GPU memory u=
sage.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Intended for performance profiling =
and required for
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Android.
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If in doubt, say "N".
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > index d99d91fe8aa98..49ee20d54ede6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -19,6 +19,8 @@
> > > >=20
> > > > #include <kunit/static_stub.h>
> > > >=20
> > > > +#include <trace/events/gpu_mem.h>
> > > > +
> > > > #include "xe_device.h"
> > > > #include "xe_dma_buf.h"
> > > > #include "xe_drm_client.h"
> > > > @@ -420,6 +422,35 @@ static void
> > > > xe_ttm_tt_account_subtract(struct=20
> > > > ttm_tt *tt)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_shrinker_mod_pages(xe=
_tt->xe->mem.shrinker, -
> > > > (long)tt-
> > > > > num_pages, 0);
> > > > }
> > > >=20
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > > > +static void update_global_total_pages(struct ttm_device
> > > > *ttm_dev,=20
> > > > long num_pages)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 struct xe_device *xe =3D ttm_to_xe_device(ttm_d=
ev);
> > > > +=C2=A0=C2=A0=C2=A0 u64 global_total_pages =3D
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic64_add_return(num=
_pages, &xe-
> > > > >global_total_pages);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 trace_gpu_mem_total(0, 0, global_total_pages <<
> > > > PAGE_SHIFT);
> > > > +}
> > > > +
> > > > +static void update_process_mem(struct drm_file *file, ssize_t
> > > > size)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 struct xe_file *xef =3D to_xe_file(file);
> > > > +=C2=A0=C2=A0=C2=A0 u64 process_mem =3D atomic64_add_return(size, &=
xef-
> > > > > process_mem);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 rcu_read_lock(); /* Locks file->pid! */
> > > > +=C2=A0=C2=A0=C2=A0 trace_gpu_mem_total(0, pid_nr(rcu_dereference(f=
ile->pid)),
> > > > process_mem);
> > > > +=C2=A0=C2=A0=C2=A0 rcu_read_unlock();
> > > > +}
> > > > +#else
> > > > +static inline void update_global_total_pages(struct ttm_device
> > > > *ttm_dev, long num_pages)
> > > > +{
> > > > +}
> > > > +
> > > > +static inline void update_process_mem(struct drm_file *file,
> > > > ssize_t=20
> > > > size)
> > > > +{
> > > > +}
> > > > +#endif
> > > > +
> > > > static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object
> > > > *ttm_bo,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 page=
_flags)
> > > > {
> > > > @@ -528,6 +559,7 @@ static int xe_ttm_tt_populate(struct
> > > > ttm_device=20
> > > > *ttm_dev, struct ttm_tt *tt,
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0xe_tt->purgeable =3D false;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0xe_ttm_tt_account_add(tt);
> > > > +=C2=A0=C2=A0=C2=A0 update_global_total_pages(ttm_dev, tt->num_page=
s);
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > > }
> > > > @@ -542,6 +574,7 @@ static void xe_ttm_tt_unpopulate(struct
> > > > ttm_device=20
> > > > *ttm_dev, struct ttm_tt *tt)
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0ttm_pool_free(&ttm_dev->pool, tt);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0xe_ttm_tt_account_subtract(tt);
> > > > +=C2=A0=C2=A0=C2=A0 update_global_total_pages(ttm_dev, -(long)tt->n=
um_pages);
> > > > }
> > > >=20
> > > > static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev,
> > > > struct=20
> > > > ttm_tt *tt)
> > > > @@ -1648,6 +1681,15 @@ static void xe_gem_object_free(struct=20
> > > > drm_gem_object *obj)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0ttm_bo_put(container_of(obj, struct ttm_buf=
fer_object,
> > > > base));
> > > > }
> > > >=20
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > > > +static int xe_gem_object_open(struct drm_gem_object *obj,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 update_process_mem(file_priv, obj->size);
> > > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > > +}
> > > > +#endif
> > > > +
> > > > static void xe_gem_object_close(struct drm_gem_object *obj,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)
> > > > {
> > > > @@ -1660,6 +1702,8 @@ static void xe_gem_object_close(struct=20
> > > > drm_gem_object *obj,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_set_bulk_move(&bo=
->ttm, NULL);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo_unlock(bo);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0}
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 update_process_mem(file_priv, -obj->size);
> > > > }
> > > >=20
> > > > static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > > > @@ -1757,6 +1801,9 @@ static const struct vm_operations_struct=20
> > > > xe_gem_vm_ops =3D {
> > > >=20
> > > > static const struct drm_gem_object_funcs xe_gem_object_funcs =3D
> > > > {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0.free =3D xe_gem_object_free,
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > >=20
> > > in future we may have other reasons for this, then we will need
> > > to
> > > refactor these ifdefs. So, maybe just assign this without ifdef,
> > > which
> > > allows to remove the ifdef around xe_gem_object_open. The impl of
> > > the
> > > update_* functions could also be in the form
> > >=20
> > > static void update_...()
> > > {
> > > #if IS_ENABLED(CONFIG_...)
> > > #endif
> > > }
> >=20
> > It was also my suggestion to do it like this to avoid having adding
> > an=20
> > ->open() callback which ends up an empty function call on all
> > builds=20
> > expect Android kernels. I agree ifdef-ery is heavy like this, but
> > in=20
> > this case it feels justified.
> >=20
> > Regards,
> >=20
> > Tvrtko
> >=20
> > > > +=C2=A0=C2=A0=C2=A0 .open =3D xe_gem_object_open,
> > > > +#endif
> > > > =C2=A0=C2=A0=C2=A0=C2=A0.close =3D xe_gem_object_close,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0.mmap =3D drm_gem_ttm_mmap,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0.export =3D xe_gem_prime_export,
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > b/drivers/gpu/drm/=20
> > > > xe/xe_device_types.h
> > > > index f81be293b260e..dd9d411e66dac 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -639,6 +639,14 @@ struct xe_device {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int fsb_freq, m=
em_freq, is_ddr3;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0};
> > > > #endif
> > > > +
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > > > +=C2=A0=C2=A0=C2=A0 /**
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @global_total_pages: global GPU page us=
age tracked for
> > > > gpu_mem
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * tracepoints
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 atomic64_t global_total_pages;
> > > > +#endif
> > > > };
> > > >=20
> > > > /**
> > > > @@ -700,6 +708,14 @@ struct xe_file {
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0/** @refcount: ref count of this xe file */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0struct kref refcount;
> > > > +
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > > > +=C2=A0=C2=A0=C2=A0 /**
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @process_mem: per-process GPU memory us=
age tracked for
> > > > gpu_mem
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * tracepoints
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 atomic64_t process_mem;
> > > > +#endif
> > > > };
> > > >=20
> > > > #endif
> > > > --=20
> > > > 2.49.0.1143.g0be31eac6b-goog
> > > >=20
