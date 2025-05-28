Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839E0C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 18:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E8910E6A0;
	Wed, 28 May 2025 18:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lFWUpq4B";
	dkim-atps=neutral
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880AB10E6A0
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 18:34:49 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-234e48b736aso1972925ad.3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 11:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1748457289; x=1749062089;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dDamfn2xQq3DOGlbmKXENyudNWqh45tSHG1Xpu2toI4=;
 b=lFWUpq4BebTwa/2W/iz/n7ER/sRrcwBur0yn2RMZL2ga5mb0jQmG9a/Dp4bfQnYUkL
 h4CJ9PlNydYciu/jKan97wcoPuIQG629BIfGpjkPkgbDCuAGFafmPl3BchfjftVzfwZ4
 X8eBXWEKtBo7v+bW1zXo4EB7NeHlU5kqB/Kpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748457289; x=1749062089;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dDamfn2xQq3DOGlbmKXENyudNWqh45tSHG1Xpu2toI4=;
 b=MNiId2eahfodS3noDwwjaxSV0Osf4TCODELiskPPcz/65vP9DqUycum6Soy+16t99+
 CMOQY2tCVBvn9EkAI4/n8HMiHcuEZhY+01XB9JKwOI0ddJ0cbfkdLC6BEFtYmx8qEhi9
 scclqqGU4pQFTJDm+CUKhfi+I51Gp2FAQ8aAvwzd7AS3xCrBLOOtWuA+urktBpQEN73y
 86CSdKTGpKBnkRit46Vi6KjrLB+/w/mgFnV7F/9q0XaW+RbBHmtZJzTbVYL4Jv5O+4m4
 u6AnX0+PltCSlixLvCNlPCHkbFFBO/JRQ5AcenaqHM1RCjyNm9GnNdBoh2S9Dr1KFTCs
 SnSA==
X-Gm-Message-State: AOJu0Yym2mfmLFO46cvNRPeAtwFyyUHJ5C1V0g/nJAYsM0EQRX4F9jmS
 SYZf4hRmcNN1DuBt+HX6xnWJqkbmTBZk5x2T1DSuID/8hB8J5wfESlM0Est8q1bQRg==
X-Gm-Gg: ASbGncsL2hZWApVAvHQ43FiAUCqfm7qXU8wt0FAAujkIM75m/yGyChTSzNlSMyAVStS
 s8IVYgWea4EE3SXU3eTHZ8GkYZSVJuNH6hRYJUcqd88hDoL9IYFUtk44SlxJOJyRX/EyaY+q30f
 GpJUXXN0TAHqozGyOH41g1707gIRe3G+pFRNCSfWWWdgYEaKbPtZB4j1AaIuJ3KWTY3RcYeG5EZ
 2ssQBenSPzM0eupMZkpJ9GfhhJBmCctGWmJgw3UZxBIt+/icaXO31AI6zzJ4cid1hormXV1IaoK
 GBteXv3OwUlDfYEQZbGDROveMrNikuIcN701I9JlSqp/Jt/0+F9narpiwE0Xzpzttg5uuOnc7iL
 uelxGZJMlTGeNaH8qBOAGH45QIFlCDUzOwXY=
X-Google-Smtp-Source: AGHT+IGXNi5Ba6zVvgNeYLaUnvDEvTLtOO5xugxuNZshGoSJ6GXgz9GXookatb/noSMk24uwvaqS8A==
X-Received: by 2002:a17:902:f551:b0:210:f706:dc4b with SMTP id
 d9443c01a7336-23414f77b0dmr243859885ad.13.1748457289140; 
 Wed, 28 May 2025 11:34:49 -0700 (PDT)
Received: from justonli3.c.googlers.com
 (209.131.82.34.bc.googleusercontent.com. [34.82.131.209])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-234d358f22fsm14959375ad.149.2025.05.28.11.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 11:34:48 -0700 (PDT)
Message-ID: <d83d2f3c85c8aaf9a6e55457ad7744f9f19d9b65.camel@chromium.org>
Subject: Re: [PATCH v2] drm/xe/bo: add GPU memory trace points
From: Juston Li <justonli@chromium.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Yiwei Zhang <zzyiwei@google.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
Date: Wed, 28 May 2025 18:34:47 +0000
In-Reply-To: <c5a7ed00-cbae-490a-86ba-e94060097760@ursulin.net>
References: <20250521224239.856298-1-justonli@chromium.org>
 <vvtskvjaqcorex5xpeyyyuvljgikpdyo2vbncgmsdlutpnfaeb@u5gtlafthvh2>
 <c5a7ed00-cbae-490a-86ba-e94060097760@ursulin.net>
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

On Thu, 2025-05-22 at 16:14 +0100, Tvrtko Ursulin wrote:
>=20
> On 22/05/2025 15:50, Lucas De Marchi wrote:
> > + dri-devel
> >=20
> > On Wed, May 21, 2025 at 10:42:35PM +0000, Juston Li wrote:
> > > Add tracepoints behind CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS for
> > > tracking
> > > global and per-process GPU memory usage.
> > >=20
> > > These are required by VSR on Android 12+ for reporting GPU driver
> > > memory
> > > allocations.
> > >=20
> > > v2:
> > > - Use u64 as preferred by checkpatch (Tvrtko)
> > > - Fix errors in comments/Kconfig description (Tvrtko)
> > > - drop redundant "CONFIG_" in Kconfig
> > >=20
> > > Signed-off-by: Juston Li <justonli@chromium.org>
> > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > ---
> > > drivers/gpu/drm/xe/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +++++++
> > > drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 47
> > > ++++++++++++++++++++++++++++
> > > drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
> > > 3 files changed, 75 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/Kconfig.debug
> > > b/drivers/gpu/drm/xe/=20
> > > Kconfig.debug
> > > index 01735c6ece8ba..2371eeda0afd5 100644
> > > --- a/drivers/gpu/drm/xe/Kconfig.debug
> > > +++ b/drivers/gpu/drm/xe/Kconfig.debug
> > > @@ -111,3 +111,15 @@ config DRM_XE_USERPTR_INVAL_INJECT
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0 Recommended for driver developers only.
> > > =C2=A0=C2=A0=C2=A0=C2=A0 If in doubt, say "N".
> > > +
> > > +config DRM_XE_GPU_MEM_TRACEPOINTS
> >=20
> > is there any particular reason to make this user-configurable per
> > driver?
> > Why aren't we making CONFIG_TRACE_GPU_MEM configurable (if needed,
> > but
> > could just depend on CONFIG_TRACEPOINTS) and then drivers just use
> > it.
>=20
> Could be done like that too. Msm does unconditional select
> TRACE_GPU_MEM=20
> which I thought wouldn't be acceptable so I suggested making it=20
> configurable.

Ok yeah, I don't see a reason to make it per-driver either. I'll make
CONFIG_TRACE_GPU_MEM configurable since we don't have
CONFIG_TRACEPOINTS or CONFIG_TRACING enabled on GKI.

Juston

> > > +=C2=A0=C2=A0=C2=A0 bool "Enable Xe GPU memory usage tracepoints"
> > > +=C2=A0=C2=A0=C2=A0 default n
> > > +=C2=A0=C2=A0=C2=A0 select TRACE_GPU_MEM
> > > +=C2=A0=C2=A0=C2=A0 help
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Choose this option to enable tracepoi=
nts for tracking
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 global and per-process GPU memory usa=
ge.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Intended for performance profiling an=
d required for
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Android.
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If in doubt, say "N".
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index d99d91fe8aa98..49ee20d54ede6 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -19,6 +19,8 @@
> > >=20
> > > #include <kunit/static_stub.h>
> > >=20
> > > +#include <trace/events/gpu_mem.h>
> > > +
> > > #include "xe_device.h"
> > > #include "xe_dma_buf.h"
> > > #include "xe_drm_client.h"
> > > @@ -420,6 +422,35 @@ static void
> > > xe_ttm_tt_account_subtract(struct=20
> > > ttm_tt *tt)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_shrinker_mod_pages(xe_t=
t->xe->mem.shrinker, -(long)tt-
> > > > num_pages, 0);
> > > }
> > >=20
> > > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > > +static void update_global_total_pages(struct ttm_device
> > > *ttm_dev,=20
> > > long num_pages)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct xe_device *xe =3D ttm_to_xe_device(ttm_dev=
);
> > > +=C2=A0=C2=A0=C2=A0 u64 global_total_pages =3D
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic64_add_return(num_p=
ages, &xe->global_total_pages);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 trace_gpu_mem_total(0, 0, global_total_pages << P=
AGE_SHIFT);
> > > +}
> > > +
> > > +static void update_process_mem(struct drm_file *file, ssize_t
> > > size)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct xe_file *xef =3D to_xe_file(file);
> > > +=C2=A0=C2=A0=C2=A0 u64 process_mem =3D atomic64_add_return(size, &xe=
f-
> > > >process_mem);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 rcu_read_lock(); /* Locks file->pid! */
> > > +=C2=A0=C2=A0=C2=A0 trace_gpu_mem_total(0, pid_nr(rcu_dereference(fil=
e->pid)),=20
> > > process_mem);
> > > +=C2=A0=C2=A0=C2=A0 rcu_read_unlock();
> > > +}
> > > +#else
> > > +static inline void update_global_total_pages(struct ttm_device=20
> > > *ttm_dev, long num_pages)
> > > +{
> > > +}
> > > +
> > > +static inline void update_process_mem(struct drm_file *file,
> > > ssize_t=20
> > > size)
> > > +{
> > > +}
> > > +#endif
> > > +
> > > static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object
> > > *ttm_bo,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 page_fl=
ags)
> > > {
> > > @@ -528,6 +559,7 @@ static int xe_ttm_tt_populate(struct
> > > ttm_device=20
> > > *ttm_dev, struct ttm_tt *tt,
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0xe_tt->purgeable =3D false;
> > > =C2=A0=C2=A0=C2=A0=C2=A0xe_ttm_tt_account_add(tt);
> > > +=C2=A0=C2=A0=C2=A0 update_global_total_pages(ttm_dev, tt->num_pages)=
;
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > }
> > > @@ -542,6 +574,7 @@ static void xe_ttm_tt_unpopulate(struct
> > > ttm_device=20
> > > *ttm_dev, struct ttm_tt *tt)
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0ttm_pool_free(&ttm_dev->pool, tt);
> > > =C2=A0=C2=A0=C2=A0=C2=A0xe_ttm_tt_account_subtract(tt);
> > > +=C2=A0=C2=A0=C2=A0 update_global_total_pages(ttm_dev, -(long)tt->num=
_pages);
> > > }
> > >=20
> > > static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct=20
> > > ttm_tt *tt)
> > > @@ -1648,6 +1681,15 @@ static void xe_gem_object_free(struct=20
> > > drm_gem_object *obj)
> > > =C2=A0=C2=A0=C2=A0=C2=A0ttm_bo_put(container_of(obj, struct ttm_buffe=
r_object,
> > > base));
> > > }
> > >=20
> > > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > > +static int xe_gem_object_open(struct drm_gem_object *obj,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 update_process_mem(file_priv, obj->size);
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +#endif
> > > +
> > > static void xe_gem_object_close(struct drm_gem_object *obj,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)
> > > {
> > > @@ -1660,6 +1702,8 @@ static void xe_gem_object_close(struct=20
> > > drm_gem_object *obj,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_set_bulk_move(&bo->=
ttm, NULL);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo_unlock(bo);
> > > =C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > +=C2=A0=C2=A0=C2=A0 update_process_mem(file_priv, -obj->size);
> > > }
> > >=20
> > > static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > > @@ -1757,6 +1801,9 @@ static const struct vm_operations_struct=20
> > > xe_gem_vm_ops =3D {
> > >=20
> > > static const struct drm_gem_object_funcs xe_gem_object_funcs =3D {
> > > =C2=A0=C2=A0=C2=A0=C2=A0.free =3D xe_gem_object_free,
> > > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> >=20
> > in future we may have other reasons for this, then we will need to
> > refactor these ifdefs. So, maybe just assign this without ifdef,
> > which
> > allows to remove the ifdef around xe_gem_object_open. The impl of
> > the
> > update_* functions could also be in the form
> >=20
> > static void update_...()
> > {
> > #if IS_ENABLED(CONFIG_...)
> > #endif
> > }
>=20
> It was also my suggestion to do it like this to avoid having adding
> an=20
> ->open() callback which ends up an empty function call on all builds=20
> expect Android kernels. I agree ifdef-ery is heavy like this, but in=20
> this case it feels justified.
>=20
> Regards,
>=20
> Tvrtko
>=20
> > > +=C2=A0=C2=A0=C2=A0 .open =3D xe_gem_object_open,
> > > +#endif
> > > =C2=A0=C2=A0=C2=A0=C2=A0.close =3D xe_gem_object_close,
> > > =C2=A0=C2=A0=C2=A0=C2=A0.mmap =3D drm_gem_ttm_mmap,
> > > =C2=A0=C2=A0=C2=A0=C2=A0.export =3D xe_gem_prime_export,
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/=20
> > > xe/xe_device_types.h
> > > index f81be293b260e..dd9d411e66dac 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -639,6 +639,14 @@ struct xe_device {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int fsb_freq, mem=
_freq, is_ddr3;
> > > =C2=A0=C2=A0=C2=A0=C2=A0};
> > > #endif
> > > +
> > > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > > +=C2=A0=C2=A0=C2=A0 /**
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @global_total_pages: global GPU page usag=
e tracked for
> > > gpu_mem
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * tracepoints
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0 atomic64_t global_total_pages;
> > > +#endif
> > > };
> > >=20
> > > /**
> > > @@ -700,6 +708,14 @@ struct xe_file {
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0/** @refcount: ref count of this xe file */
> > > =C2=A0=C2=A0=C2=A0=C2=A0struct kref refcount;
> > > +
> > > +#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
> > > +=C2=A0=C2=A0=C2=A0 /**
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @process_mem: per-process GPU memory usag=
e tracked for
> > > gpu_mem
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * tracepoints
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0 atomic64_t process_mem;
> > > +#endif
> > > };
> > >=20
> > > #endif
> > > --=20
> > > 2.49.0.1143.g0be31eac6b-goog
> > >=20
