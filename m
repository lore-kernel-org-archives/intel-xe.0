Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC6BC54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 02:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D6D10E239;
	Tue, 19 Mar 2024 02:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTepb3DL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0595010E239
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 02:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710815816; x=1742351816;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XVpmf2amQxxi5WDBqLLXqfSgz7wnWW8PLZxgosgvEpE=;
 b=BTepb3DLO/uD+fK5UIhfuNTLREAwMYfmo9B973X2Qnew0L1ZvKI4K9i9
 N50FPvLqc7idLY1SE05dbmFu9Kpw78I0/1oS4hvUnP6JXt0mLPIfqfI6r
 0eqaAClEZ6iuwZhlI3WZqZtBZ5Y8k/Duz/Y7sibkjGlgeAJxF0EN+laE6
 SIEpxE3YRohFjFAn6LiFTpI8FL47lCS+c1WLpJwvILy+5VMgGk2RySq2Q
 CDmA+JxRp2iMJZ0PXpRdzrI7o0wIlC428pdh1xrN16zvUNt0H8RpbfDun
 N5v8pNxYsnVjWV/sf9ND70eFlT0aNBTRmSoXwTiekLQG1Sq5gPSaYm5gr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="17064440"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="17064440"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 19:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18241422"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 19:36:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 19:36:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 19:36:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 19:36:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKyU+WQnHyIG/HV2+TQYlLNblFef7a7aG8hYzc0X4CvAv2yCldlVnkJBcsZHuM+i+Vk6GycAtf/8rMmmWD8jM2IK0S3Xsxzr5QxC3q94JZ5ppMlKP60MjTaeO77KiHvUDIFOTTUpPbyJe9Xpf149jNNtiBel9SEwnydFA7HhvjyhFp+O0Y9lNeK+34WpLdqdwdzxvIvVaXRRItFIQhyvG9NKiwPMCEOnDSSzqc+MDxqST0kkceW0nO1O32ok5HUFSlOpl7kZlZCQfLLWg4SaZ3wClRVlDv5kmsNdAmiCit3BLXsOEO47SuoHNYv3kqnBIso4LLCIU2TC8P9heyDfkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wC8lO++1ecfAdIMdcqXK7PsAmsOMr6vhyWacyAqPhNk=;
 b=exnRhocP1NNH/vUe33sPXf1cA55zMSpMuHRZl5rvTx4tN0T/M0IBkKiumXPdBGm1fnazYRncN6X9UybiToIkQg9PdqR/n7+k7dLlXNRdLKwaDfnNUIwCQ1rygFKyrleHDtVe5WilgbBC/HQ4CN4CibpNhMuczXB2Dbsa8ombu61UUPvKIq7kJNc58eP1upVTqeu0gnbHa2O1EVAvcNLQlbi7NePu+XfKhC2ACFAhHFuCVeS7Q71K6uGDWI0Z2YGQM5LhYGLyBjLO26Wm9HuYYOsDeuNK/wnLkWK/u7/+7xNvhPW+Eunw6ih3n9TyGxr06ctqz/sH0h3hJhIGCTtHWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by IA1PR11MB6076.namprd11.prod.outlook.com (2603:10b6:208:3d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Tue, 19 Mar
 2024 02:36:53 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Tue, 19 Mar 2024
 02:36:53 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 5/5] drm/xe: Use hmm_range_fault to populate user pages
Thread-Topic: [PATCH 5/5] drm/xe: Use hmm_range_fault to populate user pages
Thread-Index: AQHadb8ahNnquyWYX0m4Y0rDuYakOLE3uC+AgAahYKA=
Date: Tue, 19 Mar 2024 02:36:53 +0000
Message-ID: <SA1PR11MB69918F7689AE088036B32915922C2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-6-oak.zeng@intel.com>
 <ZfNkE9phLoW5e2Y1@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfNkE9phLoW5e2Y1@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|IA1PR11MB6076:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DGUep7lkY5onZVeCpmG0Qy7j928tqrQ84mYonBUQHosdb6VwAA4HOW1KvLaW7U4fg1tAPtp7wyn5NWpptZGEzoOoO4kVlwsmivP/mDEyKuX+wPO9VA5ccDnbc976jiS3GBnsdSbjGKRBWbbtE+b4TNHCt0CGwknsJUKABnhF7MF6SUKsM+27QqXpOVqvlIDjuYh/n4uF9M+L9w3CVKbRXClxWAdKktypaGnr6EVHlsMTZPZ9zsBkkKObSuNNxlgTUwhkJuYQfHGBo7owDWXspFEzO3E9oHm1hZzRMrMOxBvbtvQ+X4k6FOE2tXqxdgzNmKIp6vq6bY0VnJZcXX0UnfvFRoty5+xTsdLPCrf8+N0pMQTG+3WSv3pfmyWRHVAYYDkNNDBEFvHKmZ8QFsGl/++EesX4H+IL74bjcMEeyikm7/g8EFnfDUpj8TV4YlWOFwIfDAbmncQeVFWHvQ08BWxm+L7rlNiXNi4UOCzFYXsiUDReOyOdKHrmZ69+ONyOym0MYmR45AXZAFs6O3el5CrJ/KF/R0lzDuSzO9q3CsOZaniYlBjdc6P5h6W9J3TSSFDbFieovP/y3VR8hXGG4KgN5yChFIFBsPW5sH6iJwpIvqatRLYRDTSq1jEL+l69iN/8mFY6KK6PaRnqy9TS4kzmuBL/811v5fuprdEQ1mM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3n7fhLltSRv9CoKfcnYGw+sP+jcgg/vVZLoObV4oreZ5qFzrUdNRdObDPkI6?=
 =?us-ascii?Q?uEf0Gcjr8L+Knc/53Y8YH4d1cJX3g/RGCLadJIxVdf/6S6oQHDBzY6QF9n0h?=
 =?us-ascii?Q?ohoN/mJX4cxoNcYevRgw9A8W6YIV0bX4HIeWU/P8mgMirpkTrDQqmCjJ4daP?=
 =?us-ascii?Q?e1nCG8iE2yb5GBl5/R2P9hio/5Fb7F0bULkren5bUYuZQoseJedyd1pxBbNN?=
 =?us-ascii?Q?ygZF6Zl4PZwM/0Ik9t0oVWBgFQKg29i01WL4ATDcRTs0KHLy/n3fRJBEuZVu?=
 =?us-ascii?Q?s2xbFMVBBlwUU1+DHdNiPNc368tkOB2cGLZMxu9R4c/QJHVyh0K8dLuWcZFv?=
 =?us-ascii?Q?WZkPia360WrdVC1acURjJDOM7Pk3ov0CdhcaP7etiYES5tbjfZXjQsw9FbBK?=
 =?us-ascii?Q?v52ikQ+jcOWS5/2zG+7hN+vN8AAmBZHCPNN0DgMVwgMhEEPM/cEIlUa7VnoS?=
 =?us-ascii?Q?BKbiu0j+hGR3dRxo24EWb6RZEg/HTgLEJaiuMezxAd3LKRDCFsTWQm2rW7kQ?=
 =?us-ascii?Q?fHvpiNQj29fjXQgpZKdjBvjp/9YGvNme+CHl5VIX/A9j4dc01azZFOE2UtLX?=
 =?us-ascii?Q?vup1cBeP7RkuzTXbXTVfqzLQ2eSu/A7rKXxYr+7+y5ppAER9rWI973Aos/CL?=
 =?us-ascii?Q?22SQ9PxMOHImfV1FeI1xdlMfoQ6xBkOn+AJneSz7Sc5OuRN6iWdKfm8tgOtM?=
 =?us-ascii?Q?+rqeIbciklOu7bFZTPSG3cIIPc76jJ/nVpMZZBc8lwzXJfP9WvUmtsgwO5Bo?=
 =?us-ascii?Q?UhsLWC/kR+Rmge8Ba+ZQ0QHFX1fqigpAnR+yuJafr4Nz2t0qkXuNEcq+HY9r?=
 =?us-ascii?Q?Fr5w0ta+Ia/7ph1y2weq6tGCQqxkeEJP1hTh5xClEJApp8MN3gICyORrZW3o?=
 =?us-ascii?Q?QJLFcAk24ChuEBoknaPqKo7pPoO0f5DyqfybwPsUwLayWDkiAB6xdWfJuvzb?=
 =?us-ascii?Q?JgDTF5fm3dzkwdsXfZx8l8q4XBssBFrQhrTfE8GnEwJ/QJe7cFDd6QzaqPap?=
 =?us-ascii?Q?me65XefM+KCgOHMIvIIa969tCzQYlLKSFyx6ph8HrkfgzLb5ran/bw5cjoW9?=
 =?us-ascii?Q?RsNikjWy5OklJV/Yc7cg78nqIatsQLgFR9QGEjYwJzh56xiaemrLpc2EkzKk?=
 =?us-ascii?Q?FfNUSw5Kzu2pE7Hr5Vy+q1Jk9ASE1aDCtxFD9R3K3ktG5UJPBiR4JM6ZqNnF?=
 =?us-ascii?Q?d97wVfH9Q06oBX1EtvuggBsLSlJ6yv4gQdUWbGAahXRjbjUh/0VKWw37t6vb?=
 =?us-ascii?Q?8qksme4M/AEAfdn+Nqs3SXKRhlS2ILJAB67I+T09KDGrrd85Q5Lwg4itcym+?=
 =?us-ascii?Q?ooYMIHUsQXvFtAec6hiHx8lJUen2BEtyFK3BG4zj4TTNUvRaLirv7cz0KL0l?=
 =?us-ascii?Q?lUgR9E9TvXzpjBsahl0Ldptd03/GOsYW1Fr+7npIVcINI4vYmdEp3TDVsyl6?=
 =?us-ascii?Q?PL3tuXV80K/LJ05Hc4UlbZtfFB23uSRsiIShiAG22WRV44YuU+rSrFRT2wsw?=
 =?us-ascii?Q?admAKxgtMKmTtpnnl2qp2EGUx2r0+NDHBss639eCdPx6KImzOYtzE4wYYuPA?=
 =?us-ascii?Q?uDi6EXvZJfDbisNEH5o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad61e9f8-604d-42f7-6de6-08dc47bd6fda
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 02:36:53.0688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fN/aP2t8j+K68pMcM/BiuqI85Rv2z4ZHWlpmn4Sx6XMeJBNRM3D1i6y2FF6lM6AXLma1rDDdpxkX2NOoSjrh+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
X-OriginatorOrg: intel.com
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

Hi Matt,

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, March 14, 2024 4:55 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH 5/5] drm/xe: Use hmm_range_fault to populate user pag=
es
>=20
> On Wed, Mar 13, 2024 at 11:35:53PM -0400, Oak Zeng wrote:
> > This is an effort to unify hmmptr (aka system allocator)
> > and userptr code. hmm_range_fault is used to populate
> > a virtual address range for both hmmptr and userptr,
> > instead of hmmptr using hmm_range_fault and userptr
> > using get_user_pages_fast.
> >
> > This also aligns with AMD gpu driver's behavior. In
> > long term, we plan to put some common helpers in this
> > area to drm layer so it can be re-used by different
> > vendors.
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 105 ++-----------------------------------
> >  1 file changed, 4 insertions(+), 101 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index db3f049a47dc..d6088dcac74a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -38,6 +38,7 @@
> >  #include "xe_sync.h"
> >  #include "xe_trace.h"
> >  #include "xe_wa.h"
> > +#include "xe_hmm.h"
> >
> >  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> >  {
> > @@ -65,113 +66,15 @@ int xe_vma_userptr_check_repin(struct
> xe_userptr_vma *uvma)
> >
> >  int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>=20
> See my comments in the previous patch about layer, those comments are
> valid here too.
>=20
> >  {
> > -	struct xe_userptr *userptr =3D &uvma->userptr;
> >  	struct xe_vma *vma =3D &uvma->vma;
> >  	struct xe_vm *vm =3D xe_vma_vm(vma);
> >  	struct xe_device *xe =3D vm->xe;
> > -	const unsigned long num_pages =3D xe_vma_size(vma) >> PAGE_SHIFT;
> > -	struct page **pages;
> > -	bool in_kthread =3D !current->mm;
> > -	unsigned long notifier_seq;
> > -	int pinned, ret, i;
> > -	bool read_only =3D xe_vma_read_only(vma);
> > +	bool write =3D !xe_vma_read_only(vma);
> > +	struct hmm_range hmm_range;
> >
> >  	lockdep_assert_held(&vm->lock);
> >  	xe_assert(xe, xe_vma_is_userptr(vma));
> > -retry:
> > -	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> > -		return 0;
>=20
> ^^^
> This should not be dropped. Both the vma->gpuva.flags & XE_VMA_DESTROYED
> and userptr invalidation check retry loop should still be in here.

I will move this check into hmm.c
>=20
> > -
> > -	notifier_seq =3D mmu_interval_read_begin(&userptr->notifier);
> > -	if (notifier_seq =3D=3D userptr->notifier_seq)
> > -		return 0;
> > -
> > -	pages =3D kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
> > -	if (!pages)
> > -		return -ENOMEM;
> > -
> > -	if (userptr->sg) {
> > -		dma_unmap_sgtable(xe->drm.dev,
> > -				  userptr->sg,
> > -				  read_only ? DMA_TO_DEVICE :
> > -				  DMA_BIDIRECTIONAL, 0);
> > -		sg_free_table(userptr->sg);
> > -		userptr->sg =3D NULL;
> > -	}
>=20
> ^^^
> Likewise, I don't think this should be dropped either.

Will move to hmm.c

>=20
> > -
> > -	pinned =3D ret =3D 0;
> > -	if (in_kthread) {
> > -		if (!mmget_not_zero(userptr->notifier.mm)) {
> > -			ret =3D -EFAULT;
> > -			goto mm_closed;
> > -		}
> > -		kthread_use_mm(userptr->notifier.mm);
> > -	}
>=20
> ^^^
> Nor this.

Will move to hmm.c


>=20
> > -
> > -	while (pinned < num_pages) {
> > -		ret =3D get_user_pages_fast(xe_vma_userptr(vma) +
> > -					  pinned * PAGE_SIZE,
> > -					  num_pages - pinned,
> > -					  read_only ? 0 : FOLL_WRITE,
> > -					  &pages[pinned]);
> > -		if (ret < 0)
> > -			break;
> > -
> > -		pinned +=3D ret;
> > -		ret =3D 0;
> > -	}
>=20
> ^^^
> We should be replacing this.
>=20
> > -
> > -	if (in_kthread) {
> > -		kthread_unuse_mm(userptr->notifier.mm);
> > -		mmput(userptr->notifier.mm);
> > -	}
> > -mm_closed:
> > -	if (ret)
> > -		goto out;
> > -
> > -	ret =3D sg_alloc_table_from_pages_segment(&userptr->sgt, pages,
> > -						pinned, 0,
> > -						(u64)pinned << PAGE_SHIFT,
> > -						xe_sg_segment_size(xe-
> >drm.dev),
> > -						GFP_KERNEL);
> > -	if (ret) {
> > -		userptr->sg =3D NULL;
> > -		goto out;
> > -	}
> > -	userptr->sg =3D &userptr->sgt;
> > -
> > -	ret =3D dma_map_sgtable(xe->drm.dev, userptr->sg,
> > -			      read_only ? DMA_TO_DEVICE :
> > -			      DMA_BIDIRECTIONAL,
> > -			      DMA_ATTR_SKIP_CPU_SYNC |
> > -			      DMA_ATTR_NO_KERNEL_MAPPING);
> > -	if (ret) {
> > -		sg_free_table(userptr->sg);
> > -		userptr->sg =3D NULL;
> > -		goto out;
> > -	}
> > -
> > -	for (i =3D 0; i < pinned; ++i) {
> > -		if (!read_only) {
> > -			lock_page(pages[i]);
> > -			set_page_dirty(pages[i]);
> > -			unlock_page(pages[i]);
> > -		}
> > -
> > -		mark_page_accessed(pages[i]);
> > -	}
> > -
> > -out:
> > -	release_pages(pages, pinned);
> > -	kvfree(pages);
>=20
> ^^^
> Through here (minus existing the kthread) with hmm call. I guess the
> kthread enter / exit could be in the hmm layer too.


Moved missing parts to hmm.c. will send out v1.

Thanks a lot for the reviewing Matt!

Oak
>=20
> Matt
>=20
> > -
> > -	if (!(ret < 0)) {
> > -		userptr->notifier_seq =3D notifier_seq;
> > -		if (xe_vma_userptr_check_repin(uvma) =3D=3D -EAGAIN)
> > -			goto retry;
> > -	}
> > -
> > -	return ret < 0 ? ret : 0;
> > +	return xe_hmm_populate_range(vma, &hmm_range, write);
> >  }
> >
> >  static bool preempt_fences_waiting(struct xe_vm *vm)
> > --
> > 2.26.3
> >
