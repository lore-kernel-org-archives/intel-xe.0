Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D466D606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 19:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XwMbJHH6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFFB10F02D;
	Tue, 24 Nov 2026 19:20:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9AC10F02D
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 19:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795548005; x=1827084005;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MlPeK6zcOIcW8COqhrpOAvt8GtGGrn7E45a8/nGV0hE=;
 b=XwMbJHH6oydh+LRcAiCPNwwsnwoKUBTPbZ/IcPrlA5tLHYRChymhjMug
 rtF9dC+PAHRvAcg01yyeUghAhysOvR0dmitQ6puDEUYX+wwpcFypS+zZp
 JMp424rIHJ1YcHrdWLRkMsIEhxO/p0+SlobTv+f6Ew4DsJSuo2zB5iasQ
 fYkzTRHQ1AiWmlqylmJ/vxk75crWpZyuqk5wiVYfEY3DrN74QOmCAN3Vl
 RuSdCP8OYjx40PshtxlON77Dqw+XeOOFYZnQ1YucNredUDXvraVBOvG6R
 FNCY7rzJO3ZAO2TtAKASMObU/+bgPmwaJTtHCoIrVAN/bboB++hhyZKIn w==;
X-CSE-ConnectionGUID: 50/lZ6+WRnOUcnir6IDTqQ==
X-CSE-MsgGUID: EeCk68ljTm25PIjUyeIFlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4374928"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4374928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 11:20:04 -0800
X-CSE-ConnectionGUID: E//Ux2eQQ3SL0YW5G7yG+A==
X-CSE-MsgGUID: pk7UTFV8QmSU5goEXKAsNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11748623"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.188])
 ([10.245.245.188])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 11:20:02 -0800
Message-ID: <4cfd3d47d3029380cc4757ecdebb844658f93940.camel@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/ttm, drm/xe: Drop the ttm_tt on null moves to VRAM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Nov 2026 20:20:00 +0100
In-Reply-To: <avctByO+qRX9FQ+l@gsse-cloud1.jf.intel.com>
References: <20261107-oom-fun-v1-0-be9eb05b82ed@intel.com>
 <20261107-oom-fun-v1-3-be9eb05b82ed@intel.com>
 <avctByO+qRX9FQ+l@gsse-cloud1.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 2026-11-13 at 07:30 -0800, Matthew Brost wrote:
> On Sat, Nov 07, 2026 at 05:26:52PM +0000, Matthew Auld wrote:
> > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >=20
> > A BO created with DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING starts in
> > system
> > placement with an unpopulated ttm_tt. Its initial move to VRAM has
> > no
> > source data and uses ttm_bo_move_null(), which unlike
> > ttm_bo_move_accel_cleanup() leaves bo->ttm attached. If the VRAM BO
> > is
> > later exported, ttm_bo_setup_export() populates that stale ttm_tt,
> > pinning unused, unshrinkable host pages equal to the BO size and
> > potentially exhausting host RAM.
> >=20
> > Add ttm_bo_move_null_drop_tt() to destroy the ttm_tt when moving to
> > a
> > manager that doesn't use one, and use it in xe_bo_move().
> >=20
> > Fixes: 91494dee1091 ("xe: populate buffers before exporting them.")
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/ttm/ttm_bo_util.c | 20 ++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 6 +++---
> > =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> > =C2=A03 files changed, 25 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > index f9458a4d5a09..0ab52be3a5f7 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -756,6 +756,26 @@ void ttm_bo_move_sync_cleanup(struct
> > ttm_buffer_object *bo,
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(ttm_bo_move_sync_cleanup);
> > =C2=A0
> > +/**
> > + * ttm_bo_move_null_drop_tt - assign memory without moving data,
> > dropping the TT
> > + * @bo: The buffer object.
> > + * @new_mem: The memory to be assigned.
> > + *
> > + * Like ttm_bo_move_null(), but if the memory manager of @new_mem
> > doesn't use
> > + * a struct ttm_tt, also destroy @bo's ttm_tt, mimicking what
> > + * ttm_bo_move_accel_cleanup() does. The caller must hold the bo's
> > + * reservation, and the ttm_tt must not hold data that needs to be
> > preserved.
> > + */
> > +void ttm_bo_move_null_drop_tt(struct ttm_buffer_object *bo,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *new_mem)
> > +{
> > +	if (!ttm_manager_type(bo->bdev, new_mem->mem_type)-
> > >use_tt)
> > +		ttm_bo_tt_destroy(bo);
>=20
> This is certainly right, as I have seen TT leak.
>=20
> I do have question - should this just be built in ttm_bo_move_null?
>=20
> IOW...

The problem happened only when moving a "lacks_source" bo to VRAM, and
I was a little afraid of other drivers regressing when moving to
stable.

But this should be safe, really. I've sent a new patch.

"drm/ttm: Destroy the ttm_tt in ttm_bo_move_null() when it's no longer
needed."

/Thomas


>=20
> mbrost@gsse-cloud1:xe$ grep -n ttm_bo_move_null *.c
> xe_bo.c:892:=C2=A0=C2=A0=C2=A0 ttm_bo_move_null(ttm_bo, new_res);
> xe_bo.c:1110:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_move_null(ttm_bo, n=
ew_mem);
> xe_bo.c:1137:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ttm_bo_move_null(ttm_bo, new_mem);
> xe_bo.c:1146:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_move_null(ttm_bo, n=
ew_mem);
> xe_bo.c:1163:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ttm_bo_move_null(ttm_bo, new_mem);
> xe_bo.c:1173:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ttm_bo_move_null(ttm_bo, new_mem);
> xe_bo.c:1195:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_move_null(ttm_bo, n=
ew_mem);
> xe_bo.c:1272:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_move_null(ttm_bo, n=
ew_mem);
> xe_bo.c:1283:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ttm_bo_move_null(ttm_bo, new_mem);
> xe_bo.c:1340:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ttm_bo_move_null(bo, new_resource);
>=20
> Why are some call sites in Xe in which use ttm_bo_move_null_drop_tt
> vs
> ttm_bo_move_null?
>=20
> Matt
>=20
> > +
> > +	ttm_bo_move_null(bo, new_mem);
> > +}
> > +EXPORT_SYMBOL(ttm_bo_move_null_drop_tt);
> > +
> > =C2=A0/**
> > =C2=A0 * ttm_bo_pipeline_gutting - purge the contents of a bo
> > =C2=A0 * @bo: The buffer object
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 0181f73ef66d..6628db44951f 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1178,7 +1178,7 @@ static int xe_bo_move(struct
> > ttm_buffer_object *ttm_bo, bool evict,
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if ((move_lacks_source && !needs_clear)) {
> > -		ttm_bo_move_null(ttm_bo, new_mem);
> > +		ttm_bo_move_null_drop_tt(ttm_bo, new_mem);
> > =C2=A0		goto out;
> > =C2=A0	}
> > =C2=A0
> > @@ -1313,7 +1313,7 @@ static int xe_bo_move(struct
> > ttm_buffer_object *ttm_bo, bool evict,
> > =C2=A0						new_mem);
> > =C2=A0		if (ret) {
> > =C2=A0			dma_fence_wait(fence, false);
> > -			ttm_bo_move_null(ttm_bo, new_mem);
> > +			ttm_bo_move_null_drop_tt(ttm_bo, new_mem);
> > =C2=A0			ret =3D 0;
> > =C2=A0		}
> > =C2=A0	} else {
> > @@ -1324,7 +1324,7 @@ static int xe_bo_move(struct
> > ttm_buffer_object *ttm_bo, bool evict,
> > =C2=A0		 */
> > =C2=A0		dma_resv_add_fence(ttm_bo->base.resv, fence,
> > =C2=A0				=C2=A0=C2=A0 DMA_RESV_USAGE_KERNEL);
> > -		ttm_bo_move_null(ttm_bo, new_mem);
> > +		ttm_bo_move_null_drop_tt(ttm_bo, new_mem);
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	/*
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 32791c4db2a9..123ef68bd849 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -480,6 +480,8 @@ int ttm_bo_move_accel_cleanup(struct
> > ttm_buffer_object *bo,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *new_mem);
> > =C2=A0void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *new_mem);
> > +void ttm_bo_move_null_drop_tt(struct ttm_buffer_object *bo,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *new_mem);
> > =C2=A0int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
> > =C2=A0pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct
> > ttm_resource *res,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 pgprot_t tmp);
> >=20
> > --=20
> > 2.56.0
