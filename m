Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E96C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 21:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F6E10E3DE;
	Mon,  3 Jun 2024 21:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEM2djHQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0055210E3DE
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 21:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717448621; x=1748984621;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BKgdzZut5yBDgB+lGf8nZx7JWt6pIVstF0DWWeKhog8=;
 b=eEM2djHQto36D84Q6Ol5vPqLmdyaM7LBhh+jpNGnVyigfnGCIVFHTWr7
 kFc8z6kAb5XqDgt1u1UTgttZFp2Ex0VwUcKcGJdVZgR12z1IZMKJD5wMq
 4lfix39zAJxIByW89SwfK16FByth3i78CQZ6DvZxBcze5bLg75F8Lg6w2
 OMNPNj1ePeOPiQ4jKNofHqGbqlG3MVrXmWrfY+833wXLJlVuM/hP92zvP
 1TVyp5nPUUZpBuKlPuDb2QPvP0v7N3TWqWuPSIkDcAHH3iH1I6s4FeF2f
 TYGo69LpeHVUNWGbMPCKkQf+osOh0KYnnn3rhnF6zdKuO/RSsN6enKtq9 w==;
X-CSE-ConnectionGUID: eix4N6TMQNq/zwuAlfQQRg==
X-CSE-MsgGUID: W2rIpFBMRMySHv4P7/hsJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14122674"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="14122674"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 14:03:41 -0700
X-CSE-ConnectionGUID: N74z4w56TW2Di3tjKvPZTQ==
X-CSE-MsgGUID: 0PQvf9cBSbqqFkDI6PRLmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="37630199"
Received: from unknown (HELO [10.245.245.174]) ([10.245.245.174])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 14:03:39 -0700
Message-ID: <c260bd35e6843c13c80eb4e74f4dd4299c85cad4.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Date: Mon, 03 Jun 2024 23:03:36 +0200
In-Reply-To: <Zl4IR7xPQFNvPMyJ@DUT025-TGLU.fm.intel.com>
References: <20240531200851.223236-1-rodrigo.vivi@intel.com>
 <Zl4IR7xPQFNvPMyJ@DUT025-TGLU.fm.intel.com>
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

On Mon, 2024-06-03 at 18:15 +0000, Matthew Brost wrote:
> On Fri, May 31, 2024 at 04:08:51PM -0400, Rodrigo Vivi wrote:
> > Defer the ggtt node removal to a thread if runtime_pm is not
> > active.
> >=20
> > The ggtt node removal can be called from multiple places, including
> > places where we cannot protect with outer callers and places we are
> > within other locks. So, try to grab the runtime reference if the
> > device is already active, otherwise defer the removal to a separate
> > thread from where we are sure we can wake the device up.
> >=20
> > v2: - use xe wq instead of system wq (Matt and CI)
> > =C2=A0=C2=A0=C2=A0 - Avoid GFP_KERNEL to be future proof since this rem=
oval can
> > =C2=A0=C2=A0=C2=A0 be called from outside our drivers and we don't want=
 to block
> > =C2=A0=C2=A0=C2=A0 if atomic is needed. (Matt)
> > v3: amend forgot chunk declaring xe_device.
> >=20
> > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_ggtt.c | 57
> > ++++++++++++++++++++++++++++++++----
> > =C2=A01 file changed, 52 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c
> > b/drivers/gpu/drm/xe/xe_ggtt.c
> > index b01a670fecb8..ab086737f910 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -443,16 +443,14 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt,
> > struct xe_bo *bo)
> > =C2=A0	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
> > =C2=A0}
> > =C2=A0
> > -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node
> > *node,
> > -			 bool invalidate)
> > +static void ggtt_remove_node(struct xe_ggtt *ggtt, struct
> > drm_mm_node *node,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 bool invalidate)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D tile_to_xe(ggtt->tile);
> > =C2=A0	bool bound;
> > =C2=A0	int idx;
> > =C2=A0
> > =C2=A0	bound =3D drm_dev_enter(&xe->drm, &idx);
> > -	if (bound)
> > -		xe_pm_runtime_get_noresume(xe);
> > =C2=A0
> > =C2=A0	mutex_lock(&ggtt->lock);
> > =C2=A0	if (bound)
> > @@ -467,10 +465,59 @@ void xe_ggtt_remove_node(struct xe_ggtt
> > *ggtt, struct drm_mm_node *node,
> > =C2=A0	if (invalidate)
> > =C2=A0		xe_ggtt_invalidate(ggtt);
> > =C2=A0
> > -	xe_pm_runtime_put(xe);
> > =C2=A0	drm_dev_exit(idx);
> > =C2=A0}
> > =C2=A0
> > +struct remove_node_work {
> > +	struct work_struct work;
> > +	struct xe_ggtt *ggtt;
> > +	struct drm_mm_node *node;
> > +	bool invalidate;
> > +};
> > +
> > +static void ggtt_remove_node_work_func(struct work_struct *work)
> > +{
> > +	struct remove_node_work *remove_node =3D container_of(work,
> > struct remove_node_work, work);
> > +	struct xe_device *xe =3D tile_to_xe(remove_node->ggtt-
> > >tile);
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ggtt_remove_node(remove_node->ggtt, remove_node->node,
> > remove_node->invalidate);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	kfree(remove_node);
> > +}
> > +
> > +static void ggtt_queue_remove_node(struct xe_ggtt *ggtt, struct
> > drm_mm_node *node,
> > +				=C2=A0=C2=A0 bool invalidate)
> > +{
> > +	struct xe_device *xe =3D tile_to_xe(ggtt->tile);
> > +	struct remove_node_work *remove_node;
> > +
> > +	remove_node =3D kmalloc(sizeof(*remove_node), GFP_ATOMIC);
> > +	if (!remove_node)
>=20
> I think a DRM error message here would be helpful too.=20
>=20
> Matt

GFP_ATOMIC has a pretty high chance of failing under memory stress.
High enough that we must not leak resources when that happens. (Or
perhaps I'm misunderstanding the code here?).

Could we ensure that we pre-allocate enough to be able to queue a work
item without allocations?

perhaps=C2=A0along the lines of

struct xe_ggtt_node {
	struct llist_head deferred_remove_link;
	struct drm_mm_node node;
};

/Thomas

>=20
> > +		return;
> > +
> > +	INIT_WORK(&remove_node->work, ggtt_remove_node_work_func);
> > +	remove_node->ggtt =3D ggtt;
> > +	remove_node->node =3D node;
> > +	remove_node->invalidate =3D invalidate;
> > +
> > +	queue_work(xe->unordered_wq, &remove_node->work);
> > +}
> > +
> > +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node
> > *node,
> > +			 bool invalidate)
> > +{
> > +	struct xe_device *xe =3D tile_to_xe(ggtt->tile);
> > +
> > +	if (xe_pm_runtime_get_if_active(xe)) {
> > +		ggtt_remove_node(ggtt, node, invalidate);
> > +		xe_pm_runtime_put(xe);
> > +	} else {
> > +		ggtt_queue_remove_node(ggtt, node, invalidate);
> > +	}
> > +}
> > +
> > =C2=A0void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> > =C2=A0{
> > =C2=A0	if (XE_WARN_ON(!bo->ggtt_node.size))
> > --=20
> > 2.45.1
> >=20

