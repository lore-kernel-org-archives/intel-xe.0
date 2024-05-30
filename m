Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1BCC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 10:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208FE10EFC4;
	Thu, 30 May 2024 10:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imjXFEA8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122F510EAE6
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717063757; x=1748599757;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/5/Y5umyr1aY7E55XoZw8Gk4W/9vMtmptS5QmSrVols=;
 b=imjXFEA8PgY4nL7J96EpJh4r26UwwHrWHSc+EaXptoPeE4M+cvDf7Nxp
 P6XxmC13uegwu7yCL8cQ1yNnTW5kqyiBqvN/3TdkURXs7tpJe8DjfTUCt
 HhoZhZE28OPLiLu6O1OivKF+kNhaT30exW/ub12dgJ9z3MBzrjo0R8j8G
 xSf1YuO8TShNifedvA7+VYB7Qoot1fTPxlO8PuuBBguXihlZcTq8hIRkK
 Chy0pWILOz/eEzfza2fuiKMepvJsEQlyNYxoIl766ATnTD0V+dkNZrS2W
 2NMYslE1C+v8J7MXsaItu/9qOf24wy+9A65MM0g/xZCTGvMjaUr8z9XdG g==;
X-CSE-ConnectionGUID: 7H7JoZ8ZRregGVds1OFBow==
X-CSE-MsgGUID: Fh+SCLRsScmReE7u6xI0NQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17373115"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="17373115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 03:09:16 -0700
X-CSE-ConnectionGUID: LEBsbuZFRhmmXns0v8KnhQ==
X-CSE-MsgGUID: JMGdGf2SRgi2odk8TZiiIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36333020"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.63])
 ([10.245.245.63])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 03:09:15 -0700
Message-ID: <9deabf92ea72cd8001fa03fde607901340285e2c.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Add missing runtime outer protection
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Paulo Zanoni <paulo.zanoni@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Date: Thu, 30 May 2024 12:09:11 +0200
In-Reply-To: <ZlgR3gA9ye8MhPEw@DUT025-TGLU.fm.intel.com>
References: <20240529215603.105082-1-rodrigo.vivi@intel.com>
 <ZlgR3gA9ye8MhPEw@DUT025-TGLU.fm.intel.com>
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

On Thu, 2024-05-30 at 05:42 +0000, Matthew Brost wrote:
> On Wed, May 29, 2024 at 05:56:03PM -0400, Rodrigo Vivi wrote:
> > TTM BO destroy is called unlocked as a ref count worker when it
> > gets 0 users. When that happens we could be runtime suspended,
> > and waking up from inner locked places like ggtt_remove_node,
> > could potentially lead to deadlocks. Our warning system against
> > this case hit this case:
> >=20
> > [ 2295.891269] xe 0000:03:00.0: Missing outer runtime PM protection
> > [snip]
> > [ 2295.891604]=C2=A0 ? xe_pm_runtime_get_noresume+0x5c/0x70 [xe]
> > [ 2295.891717]=C2=A0 ? report_bug+0x18d/0x1c0
> > [ 2295.891722]=C2=A0 ? handle_bug+0x3c/0x80
> > [ 2295.891724]=C2=A0 ? exc_invalid_op+0x13/0x60
> > [ 2295.891726]=C2=A0 ? asm_exc_invalid_op+0x16/0x20
> > [ 2295.891730]=C2=A0 ? xe_pm_runtime_get_noresume+0x5c/0x70 [xe]
> > [ 2295.891816]=C2=A0 xe_ggtt_remove_node+0x93/0xf0 [xe]
> > [ 2295.891870]=C2=A0 xe_ttm_bo_destroy+0xe9/0xf0 [xe]
> > [ 2295.891935]=C2=A0 process_one_work+0x225/0x730
> > [ 2295.891940]=C2=A0 worker_thread+0x1d8/0x3c0
> >=20
> > Add this outer protection to avoid any potential deadlock.
> >=20
> > Reported-by: Paulo Zanoni <paulo.zanoni@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c | 4 ++++
> > =C2=A01 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 2bae01ce4e5b..a902f23bec0c 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1066,6 +1066,8 @@ static void xe_ttm_bo_destroy(struct
> > ttm_buffer_object *ttm_bo)
> > =C2=A0	struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
> > =C2=A0	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> > =C2=A0
> > +	xe_pm_runtime_get(xe);
>=20
> Should we only do this if we are in a kthread? i.e. !current->mm

First, I think the xe_ggtt_remove_node() should be moved to
delete_mem_notify(), because all backing memory is released at that
point.

But I guess this needs to be a bit carefully considered.=20
First, if we only do this from a kthread, then all instances of
xe_bo_put() needs to have a runtime pm ref, but OTOH putting a bo from
reclaim context would, if calling runtime_pm_get synchronously case a
lockdep splat?

I figure we need something like

if (xe_pm_runtime_get_if_active() || (current->flags & PF_WQ_WORKER))
	xe_ggtt_remove_node()
else
	remove_ggtt_node_from_worker()


Unless we can queue ggtt manipulations if device inactive and only
execute them at wakeup.

/Thomas

>=20
> Matt
>=20
> > +
> > =C2=A0	if (bo->ttm.base.import_attach)
> > =C2=A0		drm_prime_gem_destroy(&bo->ttm.base, NULL);
> > =C2=A0	drm_gem_object_release(&bo->ttm.base);
> > @@ -1089,6 +1091,8 @@ static void xe_ttm_bo_destroy(struct
> > ttm_buffer_object *ttm_bo)
> > =C2=A0	mutex_unlock(&xe->mem_access.vram_userfault.lock);
> > =C2=A0
> > =C2=A0	kfree(bo);
> > +
> > +	xe_pm_runtime_put(xe);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void xe_gem_object_free(struct drm_gem_object *obj)
> > --=20
> > 2.45.1
> >=20

