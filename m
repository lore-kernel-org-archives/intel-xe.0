Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B46C3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 13:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9052D10E918;
	Thu,  8 May 2025 13:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2aBodC5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30B610E923
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 13:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746710954; x=1778246954;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=x6shcxliALZ33B4IhVLe7RvHfZf2gwctTfGSqzp/A+Q=;
 b=c2aBodC5DkrpOla871Lwv5OhaycH//NlnlXdpklJ80AznGzCtwaJqSfC
 6vxvRXb/fgNJb4KChaBtZOmswRY8PdUTaDq9CdCn2MMn4neheGcmJ2Z+y
 wh9mc56ubBax2jkaeqwgwe6YXPX31rg4dKSZsDREvpthipNwu7F0IRWKX
 2x+Jmcr4gFCiEOTK8AEAf4Dl+0rIi5d+HQAVhsW5EGU+fv28tDaP+30a0
 F2CqYnsFWBayTU2NKlh7FJ8aP4yUJh4i2x5nu6RqeDd3UGYFMGNxAWc2x
 AVe1MABv/DSmrCoNCZ3IDZ3b78n5ChPy06Rnf24aLL2bYZ+5D9UYJe//5 g==;
X-CSE-ConnectionGUID: vK7JihESRzqJJ+HvD3ZBEg==
X-CSE-MsgGUID: pW2RYzGiTuiDMNdULhW7RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="66029123"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="66029123"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 06:29:12 -0700
X-CSE-ConnectionGUID: 1c/3cE/nS4CPkwn29ToOyA==
X-CSE-MsgGUID: vmsfo6kcRdinN9a3d+kOnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="141191104"
Received: from uaeoff-desk2.amr.corp.intel.com (HELO [10.124.222.207])
 ([10.124.222.207])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 06:29:11 -0700
Message-ID: <10830d4217eda0d0334fd97f0b6cc88b1233d018.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Make the gem shrinker drm managed
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Date: Thu, 08 May 2025 15:29:09 +0200
In-Reply-To: <763f8ea8-0055-4f75-8419-f42aa51028eb@intel.com>
References: <20250508113015.3374-1-thomas.hellstrom@linux.intel.com>
 <763f8ea8-0055-4f75-8419-f42aa51028eb@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Thu, 2025-05-08 at 12:50 +0100, Matthew Auld wrote:
> On 08/05/2025 12:30, Thomas Hellstr=C3=B6m wrote:
> > Make the xe drm shrinker drm managed like many other resources
> > created at device creation time.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0 |=C2=A0 9 +++-----
> > =C2=A0 drivers/gpu/drm/xe/xe_shrinker.c | 37 ++++++++++++++++----------=
-
> > -----
> > =C2=A0 drivers/gpu/drm/xe/xe_shrinker.h |=C2=A0 4 +---
> > =C2=A0 3 files changed, 22 insertions(+), 28 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index c02c4c4e9412..399ae5f40321 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -402,9 +402,6 @@ static void xe_device_destroy(struct drm_device
> > *dev, void *dummy)
> > =C2=A0=C2=A0	if (xe->unordered_wq)
> > =C2=A0=C2=A0		destroy_workqueue(xe->unordered_wq);
> > =C2=A0=20
> > -	if (!IS_ERR_OR_NULL(xe->mem.shrinker))
> > -		xe_shrinker_destroy(xe->mem.shrinker);
> > -
> > =C2=A0=C2=A0	if (xe->destroy_wq)
> > =C2=A0=C2=A0		destroy_workqueue(xe->destroy_wq);
> > =C2=A0=20
> > @@ -438,9 +435,9 @@ struct xe_device *xe_device_create(struct
> > pci_dev *pdev,
> > =C2=A0=C2=A0	if (err)
> > =C2=A0=C2=A0		goto err;
> > =C2=A0=20
> > -	xe->mem.shrinker =3D xe_shrinker_create(xe);
> > -	if (IS_ERR(xe->mem.shrinker))
> > -		return ERR_CAST(xe->mem.shrinker);
> > +	err =3D xe_shrinker_create(xe);
> > +	if (err)
> > +		goto err;
> > =C2=A0=20
> > =C2=A0=C2=A0	xe->info.devid =3D pdev->device;
> > =C2=A0=C2=A0	xe->info.revid =3D pdev->revision;
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > b/drivers/gpu/drm/xe/xe_shrinker.c
> > index 86d47aaf0358..125c836e0ee4 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > @@ -5,6 +5,7 @@
> > =C2=A0=20
> > =C2=A0 #include <linux/shrinker.h>
> > =C2=A0=20
> > +#include <drm/drm_managed.h>
> > =C2=A0 #include <drm/ttm/ttm_backup.h>
> > =C2=A0 #include <drm/ttm/ttm_bo.h>
> > =C2=A0 #include <drm/ttm/ttm_tt.h>
> > @@ -213,24 +214,34 @@ static void xe_shrinker_pm(struct work_struct
> > *work)
> > =C2=A0=C2=A0	xe_pm_runtime_put(shrinker->xe);
> > =C2=A0 }
> > =C2=A0=20
> > +static void xe_shrinker_fini(struct drm_device *drm, void *arg)
> > +{
> > +	struct xe_shrinker *shrinker =3D arg;
> > +
> > +	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
> > +	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
> > +	shrinker_free(shrinker->shrink);
> > +	flush_work(&shrinker->pm_worker);
>=20
> As an aside, would it make sense of us to cut over to async rpm get=20
> instead of having to do something similar by hand? IIRC it also does=20
> some more fancy stuff under the hood which might be beneficial.

I wasn't aware of that. I'll take a closer look, but yeah, it sounds
like it makes sense.

Thanks for reviewing.
/Thomas


>=20
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>=20
> > +	kfree(shrinker);
> > +}
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * xe_shrinker_create() - Create an xe per-device shrinker
> > =C2=A0=C2=A0 * @xe: Pointer to the xe device.
> > =C2=A0=C2=A0 *
> > - * Returns: A pointer to the created shrinker on success,
> > - * Negative error code on failure.
> > + * Return: %0 on success. Negative error code on failure.
> > =C2=A0=C2=A0 */
> > -struct xe_shrinker *xe_shrinker_create(struct xe_device *xe)
> > +int xe_shrinker_create(struct xe_device *xe)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct xe_shrinker *shrinker =3D kzalloc(sizeof(*shrinker)=
,
> > GFP_KERNEL);
> > =C2=A0=20
> > =C2=A0=C2=A0	if (!shrinker)
> > -		return ERR_PTR(-ENOMEM);
> > +		return -ENOMEM;
> > =C2=A0=20
> > =C2=A0=C2=A0	shrinker->shrink =3D shrinker_alloc(0, "drm-xe_gem:%s", xe=
-
> > >drm.unique);
> > =C2=A0=C2=A0	if (!shrinker->shrink) {
> > =C2=A0=C2=A0		kfree(shrinker);
> > -		return ERR_PTR(-ENOMEM);
> > +		return -ENOMEM;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > =C2=A0=C2=A0	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
> > @@ -240,19 +251,7 @@ struct xe_shrinker *xe_shrinker_create(struct
> > xe_device *xe)
> > =C2=A0=C2=A0	shrinker->shrink->scan_objects =3D xe_shrinker_scan;
> > =C2=A0=C2=A0	shrinker->shrink->private_data =3D shrinker;
> > =C2=A0=C2=A0	shrinker_register(shrinker->shrink);
> > +	xe->mem.shrinker =3D shrinker;
> > =C2=A0=20
> > -	return shrinker;
> > -}
> > -
> > -/**
> > - * xe_shrinker_destroy() - Destroy an xe per-device shrinker
> > - * @shrinker: Pointer to the shrinker to destroy.
> > - */
> > -void xe_shrinker_destroy(struct xe_shrinker *shrinker)
> > -{
> > -	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
> > -	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
> > -	shrinker_free(shrinker->shrink);
> > -	flush_work(&shrinker->pm_worker);
> > -	kfree(shrinker);
> > +	return drmm_add_action_or_reset(&xe->drm,
> > xe_shrinker_fini, shrinker);
> > =C2=A0 }
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.h
> > b/drivers/gpu/drm/xe/xe_shrinker.h
> > index 28a038f4fcbf..5132ae5192e1 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.h
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> > @@ -11,8 +11,6 @@ struct xe_device;
> > =C2=A0=20
> > =C2=A0 void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long
> > shrinkable, long purgeable);
> > =C2=A0=20
> > -struct xe_shrinker *xe_shrinker_create(struct xe_device *xe);
> > -
> > -void xe_shrinker_destroy(struct xe_shrinker *shrinker);
> > +int xe_shrinker_create(struct xe_device *xe);
> > =C2=A0=20
> > =C2=A0 #endif
>=20

