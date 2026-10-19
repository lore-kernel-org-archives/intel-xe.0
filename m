Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB60CCF2D6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 07:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F06110E812;
	Mon, 19 Oct 2026 07:55:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1CB10E4DF
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 07:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792396539; x=1823932539;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yPCjwaufGL5mfNUi6EDzhrzUPDLiIRgKuhffC9L7JcY=;
 b=TcqcX6PK8HcJ1D5TfYh0Aplnuqb9O4KLkI+3fpkmdbRjmLaSNB1uQrx/
 DdpbBjHIOJ0g5dWuT4j903rYivUOleg1bBuW8920n11tlJw3Qm/etA+Js
 u5BtPoAmkgT2s6ck94fENJF83k6h9c6EYpsWu9qaGOM8tGrSSWNlDrIl6
 ARePX5CvmaiJrKdnvIryu7qCoqDqSt2JWFHqlUvYDyozEwolmJy/AKLjp
 fNzrafm/3Drm53ynjtMjZuXX1bG8yzQSSN890r4vkTRdeoQpN9YSgOkPO
 2f51NUcW4qrIhRDG+R+KL6qmdp7TQOad4dvdchepb6DHnNvq1xREcedyZ g==;
X-CSE-ConnectionGUID: EF4GkRh8QTeueOD7xvh5YA==
X-CSE-MsgGUID: 9E9sc6LwQea2g7sHccS7Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="958197"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="958197"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 00:55:38 -0700
X-CSE-ConnectionGUID: svQ63GZ5QEiIpkcT6qNb5Q==
X-CSE-MsgGUID: 8vGhJUntQN63RbEQ8hDV0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2937712"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.222])
 ([10.245.245.222])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 00:55:37 -0700
Message-ID: <d36066161d657d87a3697e3a2b983b9c4110b7d5.camel@linux.intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe: Split the bo shrinker into purgeable and
 non-purgeable shrinkers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 19 Oct 2026 09:55:27 +0200
In-Reply-To: <atJp90kXhJceIa/i@gsse-cloud1.jf.intel.com>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
 <20261016133523.3622-4-thomas.hellstrom@linux.intel.com>
 <atJp90kXhJceIa/i@gsse-cloud1.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
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

On Fri, 2026-10-16 at 11:16 -0700, Matthew Brost wrote:
> On Fri, Oct 16, 2026 at 03:35:22PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Purgeable objects are reclaimed by simply discarding their pages,
> > with
> > no writeback required. They are therefore much cheaper to shrink
> > than
> > regular shrinkable (non-purgeable) objects, whose reclaim may need
> > to
> > wait for the GPU or write dirty compressed contents back to a
> > backup
> > store, and whose contents need to be read back on next use.
> >=20
> > Split the single xe_shrinker into two independent struct shrinker
> > instances registered against the shrinker core, sharing the same
> > underlying accounting (shrinkable_pages, purgeable_pages,
> > populated_tts) and locking:
> >=20
> > =C2=A0- A purgeable shrinker, whose count_objects() reports only
> > =C2=A0=C2=A0 purgeable_pages, and whose scan_objects() only purges obje=
cts.
> >=20
> > =C2=A0- A non-purgeable (shrinkable) shrinker, whose count_objects()
> > =C2=A0=C2=A0 reports the shrinkable page count (capped by backup
> > availability)
> > =C2=A0=C2=A0 and whose scan_objects() shrinks non-purgeable objects, an=
d also
> > =C2=A0=C2=A0 purges any purgeable objects it encounters, waking the dev=
ice
> > via
> > =C2=A0=C2=A0 runtime PM as needed.
> >=20
> > Express the cost difference to the shrinker core through the seeks
> > value: the purgeable shrinker keeps DEFAULT_SEEKS, while the
> > non-purgeable shrinker uses a higher value,
> > XE_SHRINKER_NON_PURGEABLE_SEEKS (8). The core scales each
> > shrinker's
> > scan target inversely with seeks, so purgeable objects receive
> > proportionally more reclaim pressure than non-purgeable ones,
> > without
> > one shrinker's behaviour depending on the other's state.
> >=20
> > The standalone purge walk relies on the LRU walk skipping
> > non-purgeable objects, for which xe_bo_shrink() returns -EBUSY,
> > rather than aborting.
> >=20
> > v3:
> > - Patch introduced. (Matt Brost)
> >=20
> > v4:
> > - The purge walk aborting at the first non-purgeable object is now
> > =C2=A0 fixed by a separate, preceding patch. (Sashiko)
> >=20
> > Assisted-by: LLM
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_shrinker.c | 109 +++++++++++++++++++-------=
-
> > ----
> > =C2=A01 file changed, 68 insertions(+), 41 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > b/drivers/gpu/drm/xe/xe_shrinker.c
> > index 378022c37a57..8e3fe675e0f3 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > @@ -14,6 +14,15 @@
> > =C2=A0#include "xe_pm.h"
> > =C2=A0#include "xe_shrinker.h"
> > =C2=A0
> > +/*
> > + * Reclaiming non-purgeable objects requires GPU idling and
> > writeback to a
> > + * backup store, and restoring them requires reading the contents
> > back.
> > + * Tell the shrinker core they're costlier to recreate than
> > purgeable
> > + * objects, which use DEFAULT_SEEKS, so that purgeable objects are
> > + * preferentially reclaimed.
> > + */
> > +#define XE_SHRINKER_NON_PURGEABLE_SEEKS 8
>=20
> I suggest for full tuning this tied to a Kconfig + plus syfs entry
> like
> I have here [1] so customers can play around with various configs.
>=20
> [1] https://patchwork.freedesktop.org/series/176251/

Thanks for reviewing. I'll take a look at that.
/Thomas



>=20
> Most everything every LGTM, but I think the Sashiko comment it
> somewhat
> valid, I'll reply there.
>=20
> Matt
>=20
> > +
> > =C2=A0/**
> > =C2=A0 * struct xe_shrinker - per-device shrinker
> > =C2=A0 * @xe: Back pointer to the device.
> > @@ -21,7 +30,8 @@
> > =C2=A0 * @shrinkable_pages: Number of pages that are currently
> > shrinkable.
> > =C2=A0 * @purgeable_pages: Number of pages that are currently purgeable=
.
> > =C2=A0 * @populated_tts: Number of populated ttm_tts currently
> > shrinkable or purgeable.
> > - * @shrink: Pointer to the mm shrinker.
> > + * @shrink: Pointer to the mm shrinker handling non-purgeable
> > (shrinkable) objects.
> > + * @purge_shrink: Pointer to the mm shrinker handling purgeable
> > objects.
> > =C2=A0 * @pm_worker: Worker to wake up the device if required.
> > =C2=A0 */
> > =C2=A0struct xe_shrinker {
> > @@ -31,6 +41,7 @@ struct xe_shrinker {
> > =C2=A0	long purgeable_pages;
> > =C2=A0	long populated_tts;
> > =C2=A0	struct shrinker *shrink;
> > +	struct shrinker *purge_shrink;
> > =C2=A0	struct work_struct pm_worker;
> > =C2=A0};
> > =C2=A0
> > @@ -179,6 +190,19 @@ static int xe_shrinker_walk(struct xe_shrinker
> > *shrinker,
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > +static unsigned long
> > +xe_shrinker_count_purgeable(struct shrinker *shrink, struct
> > shrink_control *sc)
> > +{
> > +	struct xe_shrinker *shrinker =3D to_xe_shrinker(shrink);
> > +	unsigned long num_pages;
> > +
> > +	read_lock(&shrinker->lock);
> > +	num_pages =3D shrinker->purgeable_pages;
> > +	read_unlock(&shrinker->lock);
> > +
> > +	return num_pages ? num_pages : SHRINK_EMPTY;
> > +}
> > +
> > =C2=A0static unsigned long
> > =C2=A0xe_shrinker_count(struct shrinker *shrink, struct shrink_control
> > *sc)
> > =C2=A0{
> > @@ -194,7 +218,6 @@ xe_shrinker_count(struct shrinker *shrink,
> > struct shrink_control *sc)
> > =C2=A0	else
> > =C2=A0		num_pages =3D 0;
> > =C2=A0
> > -	num_pages +=3D shrinker->purgeable_pages;
> > =C2=A0	read_unlock(&shrinker->lock);
> > =C2=A0
> > =C2=A0	return num_pages ? num_pages : SHRINK_EMPTY;
> > @@ -207,8 +230,7 @@ xe_shrinker_count(struct shrinker *shrink,
> > struct shrink_control *sc)
> > =C2=A0 * If bo shrinking needs an rpm reference and we don't have it
> > (yet),
> > =C2=A0 * that bo will be skipped anyway.
> > =C2=A0 */
> > -static bool xe_shrinker_runtime_pm_get(struct xe_shrinker
> > *shrinker, bool force,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_to_scan,
> > bool can_backup)
> > +static bool xe_shrinker_runtime_pm_get(struct xe_shrinker
> > *shrinker)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D shrinker->xe;
> > =C2=A0
> > @@ -216,63 +238,52 @@ static bool xe_shrinker_runtime_pm_get(struct
> > xe_shrinker *shrinker, bool force,
> > =C2=A0	=C2=A0=C2=A0=C2=A0 !ttm_backup_bytes_avail())
> > =C2=A0		return false;
> > =C2=A0
> > -	if (!force) {
> > -		read_lock(&shrinker->lock);
> > -		force =3D (nr_to_scan > shrinker->purgeable_pages &&
> > can_backup);
> > -		read_unlock(&shrinker->lock);
> > -		if (!force)
> > -			return false;
> > -	}
> > -
> > =C2=A0	return __xe_shrinker_runtime_pm_get(shrinker);
> > =C2=A0}
> > =C2=A0
> > -static unsigned long xe_shrinker_scan(struct shrinker *shrink,
> > struct shrink_control *sc)
> > +static unsigned long xe_shrinker_scan_purgeable(struct shrinker
> > *shrink,
> > +						struct
> > shrink_control *sc)
> > =C2=A0{
> > =C2=A0	struct xe_shrinker *shrinker =3D to_xe_shrinker(shrink);
> > =C2=A0	struct ttm_operation_ctx ctx =3D {
> > =C2=A0		.interruptible =3D false,
> > =C2=A0		.no_wait_gpu =3D ttm_bo_shrink_avoid_wait(),
> > =C2=A0	};
> > -	unsigned long nr_to_scan, nr_scanned =3D 0, freed =3D 0;
> > +	unsigned long nr_to_scan =3D sc->nr_to_scan, nr_scanned =3D 0,
> > freed =3D 0;
> > =C2=A0	struct xe_bo_shrink_flags shrink_flags =3D {
> > =C2=A0		.purge =3D true,
> > -		/* Don't request writeback without __GFP_IO. */
> > -		.writeback =3D !ctx.no_wait_gpu && (sc->gfp_mask &
> > __GFP_IO),
> > =C2=A0	};
> > -	bool runtime_pm;
> > -	bool purgeable;
> > -	bool can_backup =3D !!(sc->gfp_mask & __GFP_FS);
> > -
> > -	nr_to_scan =3D sc->nr_to_scan;
> > -
> > -	read_lock(&shrinker->lock);
> > -	purgeable =3D !!shrinker->purgeable_pages;
> > -	read_unlock(&shrinker->lock);
> > =C2=A0
> > -	/* Might need runtime PM. Try to wake early if it looks
> > like it. */
> > -	runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker, false,
> > nr_to_scan, can_backup);
> > -
> > -	if (purgeable && nr_scanned < nr_to_scan)
> > -		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> > -				 nr_to_scan, &nr_scanned, &freed);
> > +	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan,
> > &nr_scanned, &freed);
> > =C2=A0
> > =C2=A0	sc->nr_scanned =3D nr_scanned;
> > -	if (nr_scanned >=3D nr_to_scan || !can_backup)
> > -		goto out;
> > =C2=A0
> > -	/* If we didn't wake before, try to do it now if needed.
> > */
> > -	if (!runtime_pm)
> > -		runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker,
> > true, 0, can_backup);
> > +	return nr_scanned ? freed : SHRINK_STOP;
> > +}
> > =C2=A0
> > -	shrink_flags.purge =3D false;
> > +static unsigned long xe_shrinker_scan(struct shrinker *shrink,
> > struct shrink_control *sc)
> > +{
> > +	struct xe_shrinker *shrinker =3D to_xe_shrinker(shrink);
> > +	struct ttm_operation_ctx ctx =3D {
> > +		.interruptible =3D false,
> > +		.no_wait_gpu =3D ttm_bo_shrink_avoid_wait(),
> > +	};
> > +	unsigned long nr_to_scan =3D sc->nr_to_scan, nr_scanned =3D 0,
> > freed =3D 0;
> > +	struct xe_bo_shrink_flags shrink_flags =3D {
> > +		.purge =3D false,
> > +		/* Don't request writeback without __GFP_IO. */
> > +		.writeback =3D !ctx.no_wait_gpu && (sc->gfp_mask &
> > __GFP_IO),
> > +	};
> > +	bool runtime_pm;
> > +
> > +	/* Might need runtime PM to access backed-up or CCS-
> > compressed data. */
> > +	runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker);
> > =C2=A0
> > -	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> > -			 nr_to_scan, &nr_scanned, &freed);
> > +	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan,
> > &nr_scanned, &freed);
> > =C2=A0
> > =C2=A0	sc->nr_scanned =3D nr_scanned;
> > -out:
> > =C2=A0	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
> > +
> > =C2=A0	return nr_scanned ? freed : SHRINK_STOP;
> > =C2=A0}
> > =C2=A0
> > @@ -294,6 +305,7 @@ static void xe_shrinker_fini(struct drm_device
> > *drm, void *arg)
> > =C2=A0	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
> > =C2=A0	xe_assert(shrinker->xe, !shrinker->populated_tts);
> > =C2=A0	shrinker_free(shrinker->shrink);
> > +	shrinker_free(shrinker->purge_shrink);
> > =C2=A0	flush_work(&shrinker->pm_worker);
> > =C2=A0	kfree(shrinker);
> > =C2=A0}
> > @@ -311,8 +323,15 @@ int xe_shrinker_create(struct xe_device *xe)
> > =C2=A0	if (!shrinker)
> > =C2=A0		return -ENOMEM;
> > =C2=A0
> > -	shrinker->shrink =3D shrinker_alloc(0, "drm-xe_gem:%s", xe-
> > >drm.unique);
> > +	shrinker->purge_shrink =3D shrinker_alloc(0, "drm-xe_gem-
> > purgeable:%s", xe->drm.unique);
> > +	if (!shrinker->purge_shrink) {
> > +		kfree(shrinker);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	shrinker->shrink =3D shrinker_alloc(0, "drm-xe_gem-
> > shrinkable:%s", xe->drm.unique);
> > =C2=A0	if (!shrinker->shrink) {
> > +		shrinker_free(shrinker->purge_shrink);
> > =C2=A0		kfree(shrinker);
> > =C2=A0		return -ENOMEM;
> > =C2=A0	}
> > @@ -320,10 +339,18 @@ int xe_shrinker_create(struct xe_device *xe)
> > =C2=A0	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
> > =C2=A0	shrinker->xe =3D xe;
> > =C2=A0	rwlock_init(&shrinker->lock);
> > +
> > +	shrinker->purge_shrink->count_objects =3D
> > xe_shrinker_count_purgeable;
> > +	shrinker->purge_shrink->scan_objects =3D
> > xe_shrinker_scan_purgeable;
> > +	shrinker->purge_shrink->private_data =3D shrinker;
> > +	shrinker_register(shrinker->purge_shrink);
> > +
> > =C2=A0	shrinker->shrink->count_objects =3D xe_shrinker_count;
> > =C2=A0	shrinker->shrink->scan_objects =3D xe_shrinker_scan;
> > =C2=A0	shrinker->shrink->private_data =3D shrinker;
> > +	shrinker->shrink->seeks =3D XE_SHRINKER_NON_PURGEABLE_SEEKS;
> > =C2=A0	shrinker_register(shrinker->shrink);
> > +
> > =C2=A0	xe->mem.shrinker =3D shrinker;
> > =C2=A0
> > =C2=A0	return drmm_add_action_or_reset(&xe->drm,
> > xe_shrinker_fini, shrinker);
> > --=20
> > 2.56.0
> >=20
