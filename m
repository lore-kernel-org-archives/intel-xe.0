Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88280C83F14
	for <intel-xe@archiver.kernel.org>; Mon, 28 Aug 2023 23:44:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2250810E371;
	Mon, 28 Aug 2023 23:44:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B094410E370
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Aug 2023 23:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693266291; x=1724802291;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f+qLs4h/39hLpVGGCj0XII3dBCdM65LWjdsY0D1qZmY=;
 b=mFGbt3VYsjvUqb/rpBgiRIUc96vUVAtvMwgOmzPdhBPRVTnSP+fvFdWv
 NY5DCpwvPwgOjv7tlrx+ryhIDZIQAvKhtxN3LkhdgkGQgThmgoOn+W4nH
 UyfyUVOHX+q6jx8jEyNBwmw10RU9BZ4u80R7kUMdtkjZs5cdKJpYRJyVX
 7xw7HlWPH6maALxGRRMMIRF3e50bmy1/A+HBUzITOFuh5v2sB6qKn5idH
 8g5A9ypj2VgoneNpa/DeWNU5suPl+tXMMd5QUSJUnPCIVcE1fBz+OUHLz
 bP7SXi1BtYNPiD4bSHdWtTqkAKIecvzhbzwex1XhirL1WWACOgKBm0P5N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="375200238"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="375200238"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 16:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="853068186"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="853068186"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2023 16:44:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 16:44:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 16:44:49 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 16:44:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkXklRbAuZYM8BV2N3gzElA4e46gm3lSdJ4S+M97/q64cZDaWvmPb1c7DM6txxz4KsE7FrC2+sPaRZjIaMzYnb+2ZxzkIw5yoOUewSrF7NxCdEmJVf6Nb9UcUEEepFvRkTZ4WnH2fXhyAJFkk3hj9g78H55dmDxbvUWusY4yLwcDkZULUUUkSSXyrBD3rgeZu27R8wi+k+ljQv4DBkGeOtjtRQfaktDhJpdvoBu+xmbKu3L//iguUttoPGJZ9i0vCkDvDFGhRExTuAdLIALZOS4pGTREMr9B6WlpbEHjXpvQNRoRFE6rq7X6u2EwA0WfwIi07tJ5g1Ub9medzl9CHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCWHPkGUad7cE9QBftW5qu8j2EAndtjDGRF5X0jDdcQ=;
 b=Cynav5k8LaKRQpuBt0NbigYSJX9MHBd4mvUANE6u47c6dVexyv8wnlxh502wS/Lrs0m9MNRx6HQe8U0aTn1rH9O3ShNr8r0/x/Gzx2xCK5Y0FiTL5s/9S7BWI25ftaJGJQJB79bC1VrGiaBwZo0Y5QNnKJIJil0dLonfjFI0JW9B2yo6WB+A6CY448pTHjkpQInt3R35eSOqDPf/2Y6sleg+Z3Z+X9p2ifNXPhswtz/C884Z+AtgFHG4dv2E/OSv9f5T7yyFN0nO3ZuYZsXnVX4o7E+ZzTXv4ceAzN0c5LG+DBeO6nPXnn7mYvWa3/QuXJCWiT4lDT4+aQxblLznNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by CH0PR11MB5691.namprd11.prod.outlook.com (2603:10b6:610:110::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 23:44:47 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::e8ca:2e48:a644:5e18]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::e8ca:2e48:a644:5e18%7]) with mapi id 15.20.6699.035; Mon, 28 Aug 2023
 23:44:47 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Thread-Topic: [PATCH] drm/xe: Enable scratch page when page fault is enabled
Thread-Index: AQHZ17JKD93JZooVqE2n7PDAlCiU37AAGoWAgAAwHmCAABiTcA==
Date: Mon, 28 Aug 2023 23:44:47 +0000
Message-ID: <CY8PR11MB69403662547195564248E336C3E0A@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230826001412.6949-1-yu.bruce.chang@intel.com>
 <ZOzz6eMcc+ou494X@DUT025-TGLU.fm.intel.com>
 <CY8PR11MB69408A18DEF63B22D8FD0AEAC3E0A@CY8PR11MB6940.namprd11.prod.outlook.com>
In-Reply-To: <CY8PR11MB69408A18DEF63B22D8FD0AEAC3E0A@CY8PR11MB6940.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|CH0PR11MB5691:EE_
x-ms-office365-filtering-correlation-id: 6f87c34f-18a0-4bcb-8e28-08dba820c37f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KW3BMlcj32jYaG3sU7ghyFQVwcEgcfiLqnspug5fuAavYcLVap70fP7GFFzYwAL7KBQEXZYnJsX+o0eKMVRuUU/XectWGsyb4c5oTQIrcVoO/AyZlsjdVnsJYzCQwb/qrrrv7Esw3VkzR2xnzsuvxfqbJ66n5dFAIvE6zVZcihA1cknIzWwDBozanPFKoTX+r3wfhWowGHvwXNRzfDGVrUodiSO2RRiIivC37DygN+DrZBMAfFCJtZ11ySmVgYWydWxEM4dmAAQxJBhm7YwSywy9G3qEGm4B1qr6Cwuycn76qaoF2VB5CIDaAG0mq6+6WvLeLgj6ZNaNHN5AsOO+SPIYa1EVIgPevIMXAFAstSOjpX51WSlCV2TDr5L0uOnvMbaRS9eIPyv+ciyqZCy9s8vjPVuFOiMpczWMzcWGo9yOL0ELdVtNIkHIxZG5F+2KIs7ryGLFibXUCkj+XTUM8A1sFuosnzmiMxB1Hvt8H87GxhVX8KhPLvph3i90eXHW3e6wbX/9B6StWxBZBGTz/wcRwoLWfnafu1YuQq5EdEJNCkxeckGUunQwsOhmNxIlVVAIA8ATNEscQuaP4EVhYOnTOqnSS2nf0OSDye30AU+mHW0NxVYdhAZlNl2/YiyQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199024)(186009)(1800799009)(7696005)(9686003)(71200400001)(6506007)(55016003)(33656002)(86362001)(82960400001)(38100700002)(38070700005)(122000001)(2906002)(26005)(83380400001)(53546011)(2940100002)(478600001)(110136005)(54906003)(41300700001)(52536014)(66556008)(66476007)(66946007)(4326008)(8676002)(8936002)(76116006)(5660300002)(6636002)(66446008)(64756008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SdNVla0KwbfkXmWSH1YpD/PcbVdfW5L76L+TktLn3zctmClCQ0VgfsTNsL/u?=
 =?us-ascii?Q?Y048g9TGFXg2hzMyCjJEQ6sLABo90+gn//YM0F6rLoGh8Q2Wb27ryhkiSgRT?=
 =?us-ascii?Q?AY5ajQLKcRDHGD0NswfuQaZ2nAGsGFwHHGC9xvMj5UKgcIIhbgFthAkhGAaA?=
 =?us-ascii?Q?2v8zJMO11vTBPDJuyTos33IFlRJCWHs5N8FKdJkYey4PrOp4L+SqZT9dAPTn?=
 =?us-ascii?Q?gHEiWO4ZopxJc8AjcgQmLWDlDGjdDkaejgEw/1gAhSOJtAphTd+jOZJ0MBlz?=
 =?us-ascii?Q?8vpypE607DvjcN3ZlP3fHAViS77FKr2TG8+c3AykKcXJe0N66rS4nHji6qvj?=
 =?us-ascii?Q?QBd9hOD96rdK5f+MJY7UI/3yxpOZIQdpD/Ugf43aHFU3hNF4XMgYUZyYHt7o?=
 =?us-ascii?Q?OKWCXpbM6WK/5QttCNh2txAF+E74kw2qmmlhV7Kd5Oq0ipzzEzCtNWraHXBD?=
 =?us-ascii?Q?Ph5kUS66318nR2tUxN2CBE0DkBhnXH/gDhpmrfWdcp7xVRpRVNXGLapGqfbq?=
 =?us-ascii?Q?zeRhMp0oBjy8YMU5HU2hncpmUY4oPmbyTtD7mqEemt0fpcDIxrsvIrMY4qmP?=
 =?us-ascii?Q?mdokbtDaD3tN65RRc/fE+ippWCi7hDH07UmgzIOqZhurc6BBM6gc0M8B9LnQ?=
 =?us-ascii?Q?pwvdlHQe/AeEFUvL15eNQeknTZJ8iMF8iMOhkKdxBSaaFGPu7ypG58pcUNMV?=
 =?us-ascii?Q?Bi6aE1Yjf29WK4KJ/56OlsdwASrXfZJzHSpumBj6PmA8OIlVtTMz3ec0DxC1?=
 =?us-ascii?Q?JsTnloQEb8k8U5NjikGADVxJcMk3pybCHh7ekFd8/YgX6eaWI6UgkfqqlOVh?=
 =?us-ascii?Q?jFjj/LVFXKE6tqtSwuUK8KMtOFM7IDTKbEx0fwZuR2wInkilqhkE+K1Xa7w1?=
 =?us-ascii?Q?qLmJuwv8maa7OZVwpCssGvqfshdyJJRa8EpjLQLKl/7ahDx7ZTrWW3H+nmJe?=
 =?us-ascii?Q?eeN1xpUqdubgSDA2wtosSnKFEKxCIDpNFtmA6cdKj9W2EVIy/P1Mjmoj0I2u?=
 =?us-ascii?Q?6r90VwlGcGF5UlDXbXg2Cl/lp0elUNuBBx5/C3nTLltsdzMTO3bLcClZe/YA?=
 =?us-ascii?Q?uwgJPYzRZuXj5vDOkBRuuPGnJ4UYotmzgASZc4VEMBvJGp5QtIhxPKSWv/Ix?=
 =?us-ascii?Q?0uoWuBrXIurA4X5C+VnJLFJEdXvrN/vIKScTuQbCIuDA+uDXAarmNzCtk1zz?=
 =?us-ascii?Q?OA1vx1lLiWFOrH7sqXKdBDYrR0sPjVX0U2D2wdP1Gms49gy/QERpIahii/w3?=
 =?us-ascii?Q?rQyQzeTnYF75UlWE8AVgshMEL9AwONTLWqXEh3DvHGoZftwmb59Ngmt74fDb?=
 =?us-ascii?Q?pEcJ8r5QGQNblb6jKVU2rWCrYnOleUP9UziZZpFXGLeo3QxfkcO5Y6vZqZNR?=
 =?us-ascii?Q?pphTxKUJT8ElxchEIrURG6KuyH2kksuPbcsKmREsz9ugY6eTs2+vnOenTAdp?=
 =?us-ascii?Q?g78/fCVbvq5WY7kuxfxbQWKSsQxnA5FXG+Jw8WWmxykRxf1Srin9tB+f+2sR?=
 =?us-ascii?Q?vCl12M1J9Hxk11n/jUp/1gR4QBb1Lj8XvW0NPI38dhzMdDMSwHgSdMt/DvUx?=
 =?us-ascii?Q?bzAYX7mb3z+Hp/ozfTjsBpGdXYeZVfu050+E7G1c?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f87c34f-18a0-4bcb-8e28-08dba820c37f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 23:44:47.4840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QM30UrvZdvjXYSn583kfFWaCkVj3jMy3sA/g+cOGsnjYsz1DnY5J3bO+BJLsUnC64WRnxgbMJ/7/elSO8lhcInA3imiszEdzu/MDTOP7HPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5691
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Enable scratch page when page fault
 is enabled
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
Cc: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Chan=
g, Yu
> bruce
> Sent: Monday, August 28, 2023 3:35 PM
> To: Brost, Matthew <matthew.brost@intel.com>
> Cc: Summers, Stuart <stuart.summers@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe: Enable scratch page when page fau=
lt is
> enabled
>=20
>=20
>=20
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Monday, August 28, 2023 12:22 PM
> > To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Zeng, Oak <oak.zeng@intel.com>;
> > Welty, Brian <brian.welty@intel.com>; Vishwanathapura, Niranjana
> > <niranjana.vishwanathapura@intel.com>; Summers, Stuart
> > <stuart.summers@intel.com>
> > Subject: Re: [PATCH] drm/xe: Enable scratch page when page fault is
> > enabled
> >
> > On Sat, Aug 26, 2023 at 12:14:12AM +0000, Chang, Bruce wrote:
> > > i915 can use scratch page even when page fault is enabled, this
> > > patch is trying to port this feature over.
> > >
> >
> > I think we need to ask why do we support this before merging this.
> > Because the i915 does this is not a valid answer. Please explain why a
> > UMD needs this feature.
> >
> Sure, mainly for EU debugger support and any potential prefetch WA.
>=20
> Will add this in the commit comment.
>=20
> > > The current i915 solution changes page table directly which may be
> > > hard to make to upstream, so a more complex solution is needed to
> > > apply to the current Xe framework if following the existing i915 solu=
tion.
> > >
> > > This patch is trying to make the minimum impact to the existing
> > > driver, but still enable the scratch page support.
> > >
> > > So, the idea is to bind a scratch vma if the page fault is from an
> > > invalid access. This patch is taking advantage of null pte at this
> > > point, we may introduce a special vma for scratch vma if needed.
> > > After the bind, the user app can continue to run without causing a
> > > fatal failure or reset and stop.
> > >
> > > In case the app will bind this scratch vma to a valid address, it
> > > will fail the bind, this patch will handle the failre and unbind the
> > > scrach vma[s], so that the user binding will be retried to the valid =
address.
> > >
> > > This patch only kicks in when there is a failure for both page fault
> > > and bind, so it should has no impact to the exiating code path. On
> > > another hand, it uses actual page tables instead of special scratch
> > > page tables, so it enables potential not to invalidate TLBs when
> > > doing unbind if all upper layer page tables are still being used.
> > >
> > > tested on new scratch igt tests which will be sent out for review.
> > >
> > > Cc: Oak Zeng <oak.zeng@intel.com>
> > > Cc: Brian Welty <brian.welty@intel.com>
> > > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > Cc: Stuart Summers <stuart.summers@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 ++++--
> > >  drivers/gpu/drm/xe/xe_vm.c           | 48 +++++++++++++++++++++++---=
--
> > >  drivers/gpu/drm/xe/xe_vm.h           |  2 ++
> > >  3 files changed, 49 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > index b6f781b3d9d7..524b38df3d7a 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -137,8 +137,13 @@ static int handle_pagefault(struct xe_gt *gt,
> > > struct
> > pagefault *pf)
> > >  	write_locked =3D true;
> > >  	vma =3D lookup_vma(vm, pf->page_addr);
> > >  	if (!vma) {
> > > -		ret =3D -EINVAL;
> > > -		goto unlock_vm;
> > > +		if (vm->flags & XE_VM_FLAG_SCRATCH_PAGE)
> > > +			vma =3D xe_bind_scratch_vma(vm, pf->page_addr,
> > SZ_64K);
> >
> > I think this would be better.
> >
> > s/xe_bind_scratch_vma/xe_vm_create_scratch_vma
> >
> Will make the change.
>=20
> >
> > > +
> > > +		if (!vma) {
> > > +			ret =3D -EINVAL;
> > > +			goto unlock_vm;
> > > +		}
> > >  	}
> > >
> > >  	if (!xe_vma_is_userptr(vma) || !xe_vma_userptr_check_repin(vma)) {
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 389ac5ba8ddf..4c3d5d781b58 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1262,7 +1262,8 @@ struct xe_vm *xe_vm_create(struct xe_device
> > > *xe,
> > u32 flags)
> > >  		}
> > >  	}
> > >
> > > -	if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
> > > +	if (flags & XE_VM_FLAG_SCRATCH_PAGE &&
> > > +	    (!(flags & XE_VM_FLAG_FAULT_MODE))) {
> > >  		for_each_tile(tile, xe, id) {
> > >  			if (!vm->pt_root[id])
> > >  				continue;
> > > @@ -1998,10 +1999,6 @@ int xe_vm_create_ioctl(struct drm_device
> > > *dev,
> > void *data,
> > >  	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
> > >  		return -EINVAL;
> > >
> > > -	if (XE_IOCTL_DBG(xe, args->flags &
> > DRM_XE_VM_CREATE_SCRATCH_PAGE &&
> > > -			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> > > -		return -EINVAL;
> > > -
> > >  	if (XE_IOCTL_DBG(xe, args->flags &
> > DRM_XE_VM_CREATE_COMPUTE_MODE &&
> > >  			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> > >  		return -EINVAL;
> > > @@ -2783,6 +2780,39 @@ static int __xe_vma_op_execute(struct xe_vm
> > > *vm,
> > struct xe_vma *vma,
> > >  	return err;
> > >  }
> > >
> > > +struct xe_vma *xe_bind_scratch_vma(struct xe_vm *vm, u64 addr, u64
> > > +size) {
> >
> > Nit, the size argument really isn't needed.
> >
> Sure, can hard code it.
>=20
> > > +	struct xe_vma *vma =3D 0;
> > > +
> > > +	if (!vm->size)
> >
> > xe_vm_is_closed_or_banned rather than vm->size check.
> >
> > > +		return 0;
> >
> > Probably a ERR_PTR with correct return codes.
> >
> Will add this error check.
>=20
> > > +
> > > +	vma =3D xe_vma_create(vm, NULL, 0, addr, addr + size - 1, false, tr=
ue, 0);
> > > +	if (!vma)
> > > +		return 0;
> > > +	xe_vm_insert_vma(vm, vma);
> > > +
> >
> > Need to check the return of xe_vm_insert_vma, also probably WARN on
> > this as it shouldn't ever fail.
> >
> Will change it
>=20
> > > +	/* fault will handle the bind */
> > > +
> > > +	return vma;
> > > +}
> > > +
> > > +int xe_unbind_scratch_vma(struct xe_vm *vm, u64 addr, u64 range) {
> > > +	struct xe_vma *vma;
> > > +
> > > +	vma =3D xe_vm_find_overlapping_vma(vm, addr, range);
> > > +	if (!vma)
> > > +		return -ENXIO;
> > > +
> > > +	if (xe_vma_is_null(vma)) {
> > > +		prep_vma_destroy(vm, vma, true);
> > > +		xe_vm_unbind(vm, vma, NULL, NULL, 0, NULL, true, false);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op
> > > *op) {
> > >  	int ret =3D 0;
> > > @@ -3205,7 +3235,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > > void
> > *data, struct drm_file *file)
> > >  	err =3D vm_bind_ioctl_check_args(xe, args, &bind_ops, &async);
> > >  	if (err)
> > >  		return err;
> > > -
> >
> > Not related.
> >
> > >  	if (args->exec_queue_id) {
> > >  		q =3D xe_exec_queue_lookup(xef, args->exec_queue_id);
> > >  		if (XE_IOCTL_DBG(xe, !q)) {
> > > @@ -3352,10 +3381,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > > void
> > *data, struct drm_file *file)
> > >  		u64 range =3D bind_ops[i].range;
> > >  		u64 addr =3D bind_ops[i].addr;
> > >  		u32 op =3D bind_ops[i].op;
> > > -
> > > +retry:
> > >  		err =3D vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
> > > -		if (err)
> > > +		if (err) {
> > > +			if (!xe_unbind_scratch_vma(vm, addr, range))
> > > +				goto retry;
> > >  			goto free_syncs;
> > > +		}
> >
> > You don't need this change, GPUVA handles all of this (e.g. it will
> > create ops to unbind the old VMA, bind the new one).
> >
> > Matt
> >
>=20
> I was also concerned about this change. Good to know GPUVA can help here!
> Then the change will be a lot more cleaner.
>=20
> Thanks!
> Bruce
>=20
It seems
 err =3D vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);=20
will prevent GPUVA as it will error out firstly. If I remove it, it seems w=
orking.

-Bruce

> > >  	}
> > >
> > >  	for (i =3D 0; i < args->num_binds; ++i) { diff --git
> > > a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h index
> > > 6de6e3edb24a..6447bed427b1 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -212,6 +212,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma
> > > *vma);
> > >
> > >  int xe_vma_userptr_check_repin(struct xe_vma *vma);
> > >
> > > +struct xe_vma *xe_bind_scratch_vma(struct xe_vm *vm, u64 addr, u64
> > > +size);
> > > +
> > >  /*
> > >   * XE_ONSTACK_TV is used to size the tv_onstack array that is input
> > >   * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
> > > --
> > > 2.25.1
> > >
