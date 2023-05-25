Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D886C77B7E
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 12:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBBB10E067;
	Thu, 25 May 2023 12:55:30 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC20610E067
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 12:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685019328; x=1716555328;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HfE2bZ9Dv8qDvnapJsjW6lqinUN1m0Gg3mR/QCXu1qg=;
 b=jrGQlXtLcUyK6fkToeXKXzGlETxG+knGAT4oBjKQSF4clowOwf6gKbiK
 oE4BXtSINk4JZrtZjo0612poefaTz3xAiakVgz+ceLLUYkWTvYYByrXls
 3ks+x877IGXOuDIjcCEQVSv57e6N7c6jgjlnqbV6BhQnyu2eUZEgZ+JZ5
 rr2/i3CKpuhV3K4N4zKGUdJK7BtMQYCw0bjoT16Idwnp85bfinsYpGqa5
 0lsNTjAq5ALQlK9mhLsJlplJ1Fzx8XjT2kucLsI/ywl6ysdGTI0fhh6TC
 BksILnO704u9+v29FY7VDFA5tiKLu5bzz9syJ7wIOV6TmpyeDIq8cV0hj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="353897390"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="353897390"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 05:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="698969555"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="698969555"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO [10.249.254.226])
 ([10.249.254.226])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 05:55:25 -0700
Message-ID: <b47fc657415ec2cff94afa0661a0a38e181266e9.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Christopher Snowhill
 <kode54@gmail.com>
Date: Thu, 25 May 2023 14:55:23 +0200
In-Reply-To: <ZG4Y3isjnk2IEEO0@DUT025-TGLU.fm.intel.com>
References: <20230523054404.4011148-1-matthew.brost@intel.com>
 <20230523054404.4011148-9-matthew.brost@intel.com>
 <CA+aRtua3TQh0kh6CaEA=oE1OPrSGXFBUJY2FwXp8MZ+EYasG8Q@mail.gmail.com>
 <CA+aRtuYm7G8F8JhDKQiuKVBKmkYahVGghee+5tDY4ht4pG3jfA@mail.gmail.com>
 <ZGzBvl8NwKQlUzTi@DUT025-TGLU.fm.intel.com>
 <CA+aRtuYyMaSRcAouAx4f_YkD3AB6V2iG+Sg4+ozjfgaA1kDRvQ@mail.gmail.com>
 <ZG4Y3isjnk2IEEO0@DUT025-TGLU.fm.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH v2 8/8] drm/xe: VM LRU bulk move
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 2023-05-24 at 14:02 +0000, Matthew Brost wrote:
> On Tue, May 23, 2023 at 10:01:53PM -0700, Christopher Snowhill wrote:
> > On Tue, May 23, 2023 at 6:38=E2=80=AFAM Matthew Brost
> > <matthew.brost@intel.com> wrote:
> > >=20
> > > On Mon, May 22, 2023 at 11:52:43PM -0700, Christopher Snowhill
> > > wrote:
> > > > On Mon, May 22, 2023 at 11:38=E2=80=AFPM Christopher Snowhill
> > > > <kode54@gmail.com> wrote:
> > > > >=20
> > > > > On Mon, May 22, 2023 at 10:44=E2=80=AFPM Matthew Brost
> > > > > <matthew.brost@intel.com> wrote:
> > > > > >=20
> > > > > > Use the TTM LRU bulk move for BOs tied to a VM. Update the
> > > > > > bulk moves
> > > > > > LRU position on every exec.
> > > > > >=20
> > > > > > v2: Bulk move for compute VMs, remove bulk LRU in
> > > > > > xe_gem_object_free
> > > > > >=20
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 24
> > > > > > ++++++++++++++++++++----
> > > > > > =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 4 ++--
> > > > > > =C2=A0drivers/gpu/drm/xe/xe_dma_buf.c=C2=A0 |=C2=A0 2 +-
> > > > > > =C2=A0drivers/gpu/drm/xe/xe_exec.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ++++++
> > > > > > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 4 ++++
> > > > > > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 3 +++
> > > > > > =C2=A06 files changed, 36 insertions(+), 7 deletions(-)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > index c82e995df779..22cf65bd63fe 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > @@ -968,6 +968,16 @@ static void xe_ttm_bo_destroy(struct
> > > > > > ttm_buffer_object *ttm_bo)
> > > > > >=20
> > > > > > =C2=A0static void xe_gem_object_free(struct drm_gem_object *obj=
)
> > > > > > =C2=A0{
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_bo *bo =3D gem_=
to_xe_bo(obj);
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bo->vm && !xe_vm_in_f=
ault_mode(bo->vm) &&
> > > > > > xe_bo_is_user(bo)) {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct ww_acquire_ctx ww;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo_lock(bo, &ww, 0, false);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo_unlock(bo, &ww);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Our BO reference =
counting scheme works as
> > > > > > follows:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The gem obje=
ct kref is typically used throughout
> > > > > > the driver,
> > > > > > @@ -1081,8 +1091,8 @@ void xe_bo_free(struct xe_bo *bo)
> > > > > >=20
> > > > > > =C2=A0struct xe_bo *__xe_bo_create_locked(struct xe_device *xe,
> > > > > > struct xe_bo *bo,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct xe_gt *gt,
> > > > > > struct dma_resv *resv,
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_=
t size, enum
> > > > > > ttm_bo_type type,
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 f=
lags)
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struc=
t
> > > > > > ttm_lru_bulk_move *bulk, size_t size,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum =
ttm_bo_type type,
> > > > > > u32 flags)
> > > > > > =C2=A0{
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation=
_ctx ctx =3D {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 .interruptible =3D true,
> > > > > > @@ -1149,7 +1159,10 @@ struct xe_bo
> > > > > > *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo
> > > > > > *bo,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ERR_PTR(err);
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->created =3D true=
;
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_move_to_lru_tail_u=
nlocked(&bo->ttm);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bulk)
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_set_bulk_move(&bo->ttm, bulk);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return bo;
> > > > > > =C2=A0}
> > > > > > @@ -1219,7 +1232,10 @@ xe_bo_create_locked_range(struct
> > > > > > xe_device *xe,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > >=20
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo =3D __xe_bo_create_loc=
ked(xe, bo, gt, vm ? &vm-
> > > > > > >resv : NULL, size,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo =3D __xe_bo_create_loc=
ked(xe, bo, gt, vm ? &vm-
> > > > > > >resv : NULL,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm &&
> > > > > > !xe_vm_in_fault_mode(vm) &&
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags &
> > > > > > XE_BO_CREATE_USER_BIT ?
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm->lru_bu=
lk_move :
> > > > > > NULL, size,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type, fl=
ags);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(bo))
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return bo;
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > > > > > b/drivers/gpu/drm/xe/xe_bo.h
> > > > > > index 7e111332c35a..f7562012b836 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > > > > @@ -81,8 +81,8 @@ void xe_bo_free(struct xe_bo *bo);
> > > > > >=20
> > > > > > =C2=A0struct xe_bo *__xe_bo_create_locked(struct xe_device *xe,
> > > > > > struct xe_bo *bo,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct xe_gt *gt,
> > > > > > struct dma_resv *resv,
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_=
t size, enum
> > > > > > ttm_bo_type type,
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 f=
lags);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struc=
t
> > > > > > ttm_lru_bulk_move *bulk, size_t size,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum =
ttm_bo_type type,
> > > > > > u32 flags);
> > > > > > =C2=A0struct xe_bo *
> > > > > > =C2=A0xe_bo_create_locked_range(struct xe_device *xe,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 struct xe_gt *gt, struct xe_vm
> > > > > > *vm,
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > > > b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > > > index 9b252cc782b7..975dee1f770f 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > > > > @@ -199,7 +199,7 @@ xe_dma_buf_init_obj(struct drm_device
> > > > > > *dev, struct xe_bo *storage,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_lock(resv, =
NULL);
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo =3D __xe_bo_create_loc=
ked(xe, storage, NULL, resv,
> > > > > > dma_buf->size,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo =3D __xe_bo_create_loc=
ked(xe, storage, NULL, resv,
> > > > > > NULL, dma_buf->size,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_t=
ype_sg,
> > > > > > XE_BO_CREATE_SYSTEM_BIT);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(bo)) {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D PTR_ERR(bo);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > > > > > b/drivers/gpu/drm/xe/xe_exec.c
> > > > > > index ff4df00f20a2..b2dcf34af16b 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > > > @@ -395,6 +395,12 @@ int xe_exec_ioctl(struct drm_device
> > > > > > *dev, void *data, struct drm_file *file)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_sched_job_push(jo=
b);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vm_reactivate_reb=
ind(vm);
> > > > > >=20
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!err && !xe_vm_no_dma=
_fences(vm)) {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&xe->ttm.lru_lock);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&xe->ttm.lru_lock);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > +
> > > > > > =C2=A0err_repin:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!xe_vm_no_dma_fe=
nces(vm))
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 up_read(&vm->userptr.notifier_lock);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > index 0398da1ef1e2..a5d65d0325d6 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > @@ -629,6 +629,10 @@ static void
> > > > > > preempt_rebind_work_func(struct work_struct *w)
> > > > > >=20
> > > > > > =C2=A0#undef retry_required
> > > > > >=20
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&vm->xe->ttm.lr=
u_lock);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_lru_bulk_move_tail(&v=
m->lru_bulk_move);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&vm->xe->ttm.=
lru_lock);
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Point of no retur=
n. */
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_preempt_fences(v=
m, &preempt_fences);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resume_and_reinstall=
_preempt_fences(vm);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > index fada7896867f..d3e99f22510d 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > @@ -164,6 +164,9 @@ struct xe_vm {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** Protects @rebind=
_list and the page-table
> > > > > > structures */
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_resv resv=
;
> > > > > >=20
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** @lru_bulk_move: Bulk =
LRU move list for this
> > > > > > VM's BOs */
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_lru_bulk_move =
lru_bulk_move;
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 size;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rb_root vmas;
> > > > > >=20
> > > > > > --
> > > > > > 2.34.1
> > > > >=20
> > > > > Something in this patch version, either moving the cleanup to
> > > > > gem_free, or the move_tail later in the patch set, causes
> > > > > kmscube to
> > > > > deadlock on terminate, forcing me to reboot the machine.
> > > > > Reboot got
> > > > > stuck when it tried to terminate my user session, so I had to
> > > > > press
> > > > > the reset button.
> > > >=20
> > >=20
> > > Any chance you have a dmesg for the deadlock on terminate? Hoping
> > > it
> > > gives some clues to the issue.
> > >=20
> > > > Verified, substituting patch 8 of 8 from v1 results in cleanly
> > > > terminating kmscube.
> > >=20
> > > It was Thomas's suggestion to move this from close to free, this
> > > is a
> > > fairly old patch and couldn't recall why it was in close rather
> > > than
> > > free. Now I think about this, I believe originally this was in
> > > free but
> > > moved to close to fix a bug, will try to remind why it needs to
> > > be in
> > > close.
> > >=20
> > > Matt
> >=20
> > It actually goes zombie/defunct on termination. I couldn't
> > backtrace
> > it, so I had to wait for the kernel to spew forth a backtrace of
> > its
> > own from the hung kworker processes that caused them to be stuck:
> >=20
>=20
> This is very helpful, thanks Christopher. I see the problem, we call
> xe_bo_put while holding the VM dma-resv which in turn calls
> xe_gem_object_free. xe_gem_object_free tries to acquire VM dma-resv
> and
> deadlock.
>=20
> I think I'll move this to the close function.

Ugh, yes. This is why it really should be in the release_notify
callback where we've individualized the resvs and can easily lock
without sleeping....

In any case, we need to modify TTM to do that so for now Ack to move to
close().

/Thomas



>=20
> Matt
>=20
> > [=C2=A0 245.565723] INFO: task kworker/14:1:130 blocked for more than
> > 122 seconds.
> > [=C2=A0 245.566642]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Tainted: P=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0 OE
> > 6.3.0-1-drm-xe-next-git-g48a7045a0879-dirty #6
> > [=C2=A0 245.567413] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> > disables this message.
> > [=C2=A0 245.568207] task:kworker/14:1=C2=A0=C2=A0=C2=A0 state:D stack:0=
=C2=A0=C2=A0=C2=A0=C2=A0 pid:130
> > ppid:2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags:0x00004000
> > [=C2=A0 245.568216] Workqueue: events __guc_engine_fini_async [xe]
> > [=C2=A0 245.568392] Call Trace:
> > [=C2=A0 245.568394]=C2=A0 <TASK>
> > [=C2=A0 245.568398]=C2=A0 __schedule+0x443/0x1400
> > [=C2=A0 245.568408]=C2=A0 ? check_preempt_curr+0x5e/0x70
> > [=C2=A0 245.568415]=C2=A0 ? try_to_wake_up+0x263/0x610
> > [=C2=A0 245.568421]=C2=A0 schedule+0x5e/0xd0
> > [=C2=A0 245.568426]=C2=A0 schedule_preempt_disabled+0x15/0x30
> > [=C2=A0 245.568431]=C2=A0 __ww_mutex_lock.constprop.0+0x539/0x940
> > [=C2=A0 245.568439]=C2=A0 ttm_eu_reserve_buffers+0x1f4/0x2f0 [ttm
> > bea26c7978113683d7615187c2f4d33b4f3ad4a6]
> > [=C2=A0 245.568462]=C2=A0 xe_vm_lock+0xe3/0x110 [xe
> > 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> > [=C2=A0 245.568653]=C2=A0 xe_lrc_finish+0x62/0x130 [xe
> > 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> > [=C2=A0 245.568827]=C2=A0 xe_engine_fini+0x2f/0x90 [xe
> > 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> > [=C2=A0 245.568989]=C2=A0 process_one_work+0x1c4/0x3d0
> > [=C2=A0 245.568996]=C2=A0 worker_thread+0x51/0x390
> > [=C2=A0 245.569012]=C2=A0 ? __pfx_worker_thread+0x10/0x10
> > [=C2=A0 245.569018]=C2=A0 kthread+0xdb/0x110
> > [=C2=A0 245.569022]=C2=A0 ? __pfx_kthread+0x10/0x10
> > [=C2=A0 245.569026]=C2=A0 ret_from_fork+0x29/0x50
> > [=C2=A0 245.569036]=C2=A0 </TASK>
> > [=C2=A0 245.569051] INFO: task kworker/14:3:488 blocked for more than
> > 122 seconds.
> > [=C2=A0 245.569963]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Tainted: P=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0 OE
> > 6.3.0-1-drm-xe-next-git-g48a7045a0879-dirty #6
> > [=C2=A0 245.570782] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> > disables this message.
> > [=C2=A0 245.571592] task:kworker/14:3=C2=A0=C2=A0=C2=A0 state:D stack:0=
=C2=A0=C2=A0=C2=A0=C2=A0 pid:488
> > ppid:2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags:0x00004000
> > [=C2=A0 245.571599] Workqueue: events __guc_engine_fini_async [xe]
> > [=C2=A0 245.571768] Call Trace:
> > [=C2=A0 245.571769]=C2=A0 <TASK>
> > [=C2=A0 245.571772]=C2=A0 __schedule+0x443/0x1400
> > [=C2=A0 245.571777]=C2=A0 ? load_balance+0x18d/0xe20
> > [=C2=A0 245.571785]=C2=A0 schedule+0x5e/0xd0
> > [=C2=A0 245.571790]=C2=A0 schedule_preempt_disabled+0x15/0x30
> > [=C2=A0 245.571794]=C2=A0 __ww_mutex_lock.constprop.0+0x539/0x940
> > [=C2=A0 245.571802]=C2=A0 ttm_eu_reserve_buffers+0x1f4/0x2f0 [ttm
> > bea26c7978113683d7615187c2f4d33b4f3ad4a6]
> > [=C2=A0 245.571823]=C2=A0 xe_vm_lock+0xe3/0x110 [xe
> > 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> > [=C2=A0 245.572012]=C2=A0 xe_lrc_finish+0x62/0x130 [xe
> > 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> > [=C2=A0 245.572185]=C2=A0 xe_engine_fini+0x2f/0x90 [xe
> > 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> > [=C2=A0 245.572378]=C2=A0 process_one_work+0x1c4/0x3d0
> > [=C2=A0 245.572385]=C2=A0 worker_thread+0x51/0x390
> > [=C2=A0 245.572391]=C2=A0 ? __pfx_worker_thread+0x10/0x10
> > [=C2=A0 245.572396]=C2=A0 kthread+0xdb/0x110
> > [=C2=A0 245.572400]=C2=A0 ? __pfx_kthread+0x10/0x10
> > [=C2=A0 245.572404]=C2=A0 ret_from_fork+0x29/0x50
> > [=C2=A0 245.572412]=C2=A0 </TASK>
> > [=C2=A0 245.572552] INFO: task kmscub:traceq0:8581 blocked for more tha=
n
> > 122 seconds.
> > [=C2=A0 245.573498]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Tainted: P=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0 OE
> > 6.3.0-1-drm-xe-next-git-g48a7045a0879-dirty #6
> > [=C2=A0 245.574336] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> > disables this message.
> > [=C2=A0 245.575151] task:kmscub:traceq0=C2=A0 state:D stack:0=C2=A0=C2=
=A0=C2=A0=C2=A0 pid:8581
> > ppid:8170=C2=A0=C2=A0 flags:0x00004002
> > [=C2=A0 245.575158] Call Trace:
> > [=C2=A0 245.575159]=C2=A0 <TASK>
> > [=C2=A0 245.575161]=C2=A0 __schedule+0x443/0x1400
> > [=C2=A0 245.575167]=C2=A0 ? asm_sysvec_call_function_single+0x1a/0x20
> > [=C2=A0 245.575174]=C2=A0 schedule+0x5e/0xd0
> > [=C2=A0 245.575179]=C2=A0 schedule_preempt_disabled+0x15/0x30
> > [=C2=A0 245.575183]=C2=A0 __ww_mutex_lock.constprop.0+0x539/0x940
> > [=C2=A0 245.575191]=C2=A0 ttm_eu_reserve_buffers+0x1f4/0x2f0 [ttm
> > bea26c7978113683d7615187c2f4d33b4f3ad4a6]
> > [=C2=A0 245.575212]=C2=A0 xe_bo_lock+0xaf/0xe0 [xe
> > 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> > [=C2=A0 245.575373]=C2=A0 xe_gem_object_free+0xb4/0x100 [xe
> > 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> > [=C2=A0 245.575532]=C2=A0 xe_vma_destroy_late+0xc4/0xf0 [xe
> > 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> > [=C2=A0 245.575726]=C2=A0 xe_vm_close_and_put+0x191/0x490 [xe
> > 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> > [=C2=A0 245.575913]=C2=A0 ? xa_find+0x92/0x100
> > [=C2=A0 245.575921]=C2=A0 xe_file_close+0x196/0x200 [xe
> > 35c5fcb454ded180c3570d3957d73eb524fe3f0d]
> > [=C2=A0 245.576081]=C2=A0 drm_file_free+0x219/0x270
> > [=C2=A0 245.576088]=C2=A0 drm_release_noglobal+0x1f/0x70
> > [=C2=A0 245.576093]=C2=A0 __fput+0x86/0x250
> > [=C2=A0 245.576099]=C2=A0 task_work_run+0x5a/0x90
> > [=C2=A0 245.576104]=C2=A0 do_exit+0x342/0xaf0
> > [=C2=A0 245.576109]=C2=A0 ? __futex_unqueue+0x29/0x40
> > [=C2=A0 245.576115]=C2=A0 ? futex_unqueue+0x3c/0x60
> > [=C2=A0 245.576121]=C2=A0 do_group_exit+0x31/0x80
> > [=C2=A0 245.576125]=C2=A0 get_signal+0x9a5/0x9e0
> > [=C2=A0 245.576133]=C2=A0 arch_do_signal_or_restart+0x3e/0x270
> > [=C2=A0 245.576141]=C2=A0 exit_to_user_mode_prepare+0x185/0x1e0
> > [=C2=A0 245.576148]=C2=A0 syscall_exit_to_user_mode+0x1b/0x40
> > [=C2=A0 245.576155]=C2=A0 do_syscall_64+0x6c/0x90
> > [=C2=A0 245.576161]=C2=A0 ? exc_page_fault+0x7c/0x180
> > [=C2=A0 245.576166]=C2=A0 entry_SYSCALL_64_after_hwframe+0x72/0xdc
> > [=C2=A0 245.576174] RIP: 0033:0x7f8956f44f0e
> > [=C2=A0 245.576179] RSP: 002b:00007f892b7fdcb0 EFLAGS: 00000246
> > ORIG_RAX:
> > 00000000000000ca
> > [=C2=A0 245.576184] RAX: fffffffffffffe00 RBX: 0000000000000000 RCX:
> > 00007f8956f44f0e
> > [=C2=A0 245.576187] RDX: 0000000000000000 RSI: 0000000000000189 RDI:
> > 000055c8c22459c8
> > [=C2=A0 245.576190] RBP: 0000000000000000 R08: 0000000000000000 R09:
> > 00000000ffffffff
> > [=C2=A0 245.576192] R10: 0000000000000000 R11: 0000000000000246 R12:
> > 0000000000000000
> > [=C2=A0 245.576194] R13: 000055c8c2245978 R14: 0000000000000000 R15:
> > 000055c8c22459c8
> > [=C2=A0 245.576201]=C2=A0 </TASK>

