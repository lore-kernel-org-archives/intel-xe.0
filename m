Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D09C54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 14:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D1810EBC2;
	Thu, 21 Mar 2024 14:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FsREfb7g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5F510EBC2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711032979; x=1742568979;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1zKh4DpRtSXqEMaa7Mv+5GrVW3Ih7u/3f93WEz4te40=;
 b=FsREfb7gTUDAAJNwOiddvgj5aE1OPkqkDb8kDzAhIhaH2ZfeKcVRwsLC
 hHzxYROnpgBk7jP59HJsSB6FyaX5p7NEmbZ7bi3cPQqZkiU0rTQWCHRcI
 kGrPtEkVEM5KjYZtjtBclH3JZbLY+TeGQi229RLE+9M7FTAuzQF6DVRFI
 ll+uocKabw1+RVghE+unws3pQzwOqw+lLAOSXPhuEmC+Je+vThzBFD9Bq
 pS2d998o3Zgosfx0C4yG+XtUuDTiUiTuzTyr82MqcgPPCCI/3cYWzBLC5
 s90zJHhO//+Nmrxr6Hro5nZ5k0h7Ulwc+4sDfPdFnCorOu047a6GXfcHE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5858312"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5858312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 07:56:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="45638319"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 07:56:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 07:56:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 07:56:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 07:56:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgkhOtJh48yXoeHii2VarO2khHjZ6ITb4oBnzIHsMW0WTMxYJWBKff4Z5X6Egs7YY1YycKW2ophg/gPFhPMWln4O7VKIN5ZQEouOI/C7tuYBBMC9CyETMRegemmRqYnhSGEw1PbOyJa7ESAYKUI3cOqaywjuAFaGPBkpQU2MrPKDafnQpKihuuuFwmFcUvyiIeKVPp3IoYKyzMdY5VgQryoh98Ng44C9VeCJQVdfAPSfwTGBtX/pYTI+8jqvfrEz+gDJprWw7JWTmF72P4oWWp9fQ76Cdx1u7WQQ4AtdRYxbBKGo/tMalc5HaZsDAFq3rpa928Cw1u8j1ByURrtLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dq+Revf+8Ghsdwp8BnF9/eHoDPi9246+BRHc55NyXp0=;
 b=hfvFxZGXBgsEHviqK/p4U3SM5CBk+NpQBaVDjI1ztjXp7xugbFfOJL4y4iBOsUqZ9yuBpChm98RA3JDJE5fzcqkRIatZAzHKWRB2y506FUd4NknqticL+VgrRfwk/tSNTulzOqBdeakbFXqgUOLZTu/uG0hWWnJD2AnQsBrWDJ+DPRrmsLOOXVjzBJGPIhN5/I3D4oGK+PKhC+RpgbGfn8Mnzmuj0bJrg6DJt69z7h5BVhSP3mmd95el4/cVBi1KxN0hW4WKofP4QA/0gBil6okQEF57J09rdlYBIXXAfsOfH/xRc4K8fCG/AIxOHfZchwDOtqmcG4+3YYypnmuvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by IA1PR11MB7320.namprd11.prod.outlook.com (2603:10b6:208:424::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Thu, 21 Mar
 2024 14:56:15 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Thu, 21 Mar 2024
 14:56:15 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
Thread-Topic: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
Thread-Index: AQHaezXx8ukTkUkttEKudqvoYNITzLFBh1kAgAC2QEA=
Date: Thu, 21 Mar 2024 14:56:15 +0000
Message-ID: <SA1PR11MB699154B66898A29896FFB5D192322@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240321022939.2279979-1-oak.zeng@intel.com>
 <20240321022939.2279979-5-oak.zeng@intel.com>
 <ZfunwkSUxdlFWmcn@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfunwkSUxdlFWmcn@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|IA1PR11MB7320:EE_
x-ms-office365-filtering-correlation-id: feab355c-cf0b-48b7-63e9-08dc49b70ea1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ce8FPoGMCMFqR30Fz7Vk2OaRJ8PdRjbVkzTk4hRIVfQ0dWuOrNJ6PShY8Am0S1um+ZULnjGvhuXcWDaMGLrT7026O1RzIup1B0lhY+Va9sLTFu8m6MLCqI81SdELVQtipKhECq/rjdLanZuitPPvHnAejuNgf/GffcMuIiKSq228FE+LgUDWlMlcMb2SIs6iFGtstHCdJ9W+Be65voN4yav85cf5PgxxR+Xj5S9/DvaDewRwdfqQOJsHcuUIkJ3neai3W/VyuK8Dsbo/iUMB6uJHVfHobVeJ24pAH7vuIaT2v1wPOco/CX7DUDoXp48iMoT59XdSd3D2e4gxCdG5BOq5GZP0I06SrvGYisRaZV0Qp08frateK4vm3fGkvQtW2wflK02qx8aHaAVh4TI4deBuJtWfj0BWEJYd0gcLarmyfUrsByA3d2baigt0qsgp+Egvz0JZJVrRbZaH1ynANNEJpLh/9bZSsG24FL1v4NDpLxsjYzk34neEcb17fmuqdN9Ga3X44iJax0hzNGl0eSlFSFRs3LBDzRLC9pEg25Y3M81/0nf0hcDegaQ92OhiJ7BCZu+0y5FmStuF5Q6TVfsaT2UcYTnAIT4yeQqa8WFkb99MrQd3aatUDT3kBH9Nzqr8RExzjcQLlsobeLY35ZNvLuNUemtsrY/+6sX1Ob+zKhg79r8wZ9kA7gu4j6yV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8nNtNf7z3OhRRBDx9UlXibTDwlwm1Ig+djeaSTnsxJObG2u3k2GoTeRV9vEX?=
 =?us-ascii?Q?ExGMdGll1cGMRbuaaoPWcwx1GfpquwtTJbmurzFzJ0ot3G2dzYiXXgyX8uww?=
 =?us-ascii?Q?OsHx0RYLINwN9jXBuFDOgXl1F5E6b3h0Ll6ImZG2L/fA4LeOwEpBXKTcDq/b?=
 =?us-ascii?Q?tEswrFw5fbjPOksaiRv0hEVFypon23t+8aZKmutHcw/WBwgfgvcoouYhUT3N?=
 =?us-ascii?Q?BNXIAS18mWZmxZwJnY7OAGMpvdYYN8B5TVNqNEMbW3KtPYWBH8//qGDMMGNs?=
 =?us-ascii?Q?6z0BU3Euj6VKyG/tJWszJd6M+mYdexFwWtvz1QLC24gvKfRbbe6RKOwzsx7z?=
 =?us-ascii?Q?I7wq1VviUcSs03bchrq8lrLe5VmXd6F7GIXTpLygPX7+nwAfliCovWHcvMh1?=
 =?us-ascii?Q?nSorcT3pG20RjJcJ0mHNEVKxsETZfnZW0yRyLuF2gBMbm6Gqlhag4BmVSr2f?=
 =?us-ascii?Q?CR5G218OllaREMfvwTatF6MMwpGMcNWxVSlaigIr8ZKX51L2ZnxXXsZ1MOBN?=
 =?us-ascii?Q?QO5E4o3YSixfF1vwy/kih7hduWc6LDoU8IWOAqQYim8zPwDTaBkBig8YkhTj?=
 =?us-ascii?Q?vDhyhXwFV3M/A7XdixDD+fP03SGvejvqRSazaJ1S10rHAhhwOlcbwIiPMWtg?=
 =?us-ascii?Q?REPFYnwpylZWG7+q5zJcBFWcx53XH6ZrjbDxQzmlpFeKaXQGIaagg0BDX6Qu?=
 =?us-ascii?Q?r2JGuELYdN4SKmFJTZcXGBQUqUUbRHo+urPwtk48ZCBg8RgYaTwB9iGK6JAB?=
 =?us-ascii?Q?E8LyIXSBlJy2EpEnJRQKI2xd7s5+8/c3F9tcjBHACDjGSr8wKzU2BuWJ+rZl?=
 =?us-ascii?Q?7hGqIvO4YJwMXv8pyByPe9qOepOI8LY2VswLkliTPTm4fJ4IsYSEw1mNTxsS?=
 =?us-ascii?Q?0fHZLPXobSKzXBZRsKDW7016AuyrtUreR1Kk3Muo+JJwP+HHFloDv3IB73z+?=
 =?us-ascii?Q?qS52Th87eF6tYoK5lwOLuhOX7Ha7JO5dM4w+rDiC2aEQivI63eYVS5fQ3m7k?=
 =?us-ascii?Q?dshP4fFy5VdSxjpdAp/7kYPkUxajqWlHXCc6HhkPyi2iMpWkJASUUMptqj1u?=
 =?us-ascii?Q?x9Djmi3cVu6z6ZJZCY05ntCbuDDbm3y56sjKeEOy80ICfnu1FP2kL21ekq7K?=
 =?us-ascii?Q?zCGFxmEGpbFYqWNx63H1veO1Zosj0OhfhS6LpGg4iDtT+qqwGPjYm+UZM9EP?=
 =?us-ascii?Q?G0Lc57qWOdoOJu+/pQkB275NscKT3/BCesY653jX9cl0f3+KFuY6Knp7kyvZ?=
 =?us-ascii?Q?/dGoerqcCKZlhR5xow4jMhrhJbrvn5O9yw1pHj94CwIY8mxCQJHt0M5ZM9Uh?=
 =?us-ascii?Q?Z3dIv9FyoV7Tn0URH7KohmxgbDO9EJCwXpBwkfU88I9j3JqWmgq4NZntjbc0?=
 =?us-ascii?Q?G/2tZfqfcScj+GJHDu4LQcx78KI3JBZTlLb1J2r+wJbxP7do3S+FzydEdyr3?=
 =?us-ascii?Q?ddLneSZLxndMykrGzImBC8O1e3hm6/WJY5tGYpUjIcmc11akH9N/n0N2h7uB?=
 =?us-ascii?Q?1eQgce8nZOc94iKDciZJTF5Hz7klnDepY/kGZ6YBobMSfFd1vY6lL9wLzF9z?=
 =?us-ascii?Q?Opf5+/O9cuXCg8+c714=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feab355c-cf0b-48b7-63e9-08dc49b70ea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 14:56:15.3033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E6i8K+oOzl8hWSQko7fvmTe7bK0k+sKu5kC6X1CoIx99vZjRyy/GVooy40AtqixROeJo6c5kHL9lYzoXeMdwXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7320
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
> Sent: Wednesday, March 20, 2024 11:22 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; Welty, Brian <brian.welty@intel.com>; Ghimi=
ray,
> Himal Prasad <himal.prasad.ghimiray@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: Re: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
>=20
> On Wed, Mar 20, 2024 at 10:29:39PM -0400, Oak Zeng wrote:
> > When there is MMU_NOTIFY_UNMAP event happens, the userptr
> > is munmapped from CPU. There is no need to keep the xe_vma
> > for this userptr from GPU side. So we destroy it.
> >
> > But we can't destroy vma directly from the mmu notifier
> > callback function, because we need to remove mmu
> > notifier during vma destroy. If we remove mmu notifier
> > directly from mmu notifier callback, it is a deadlock.
> > xe_vma_destroy is modified to destroy vma in a worker
> > thread.
> >
> > Another reason of this change is, for the future
> > hmmptr codes, we destroy vma when hmmptr is unmapped
> > from CPU. We want to unify the hmmptr and userptr
> > code.
> >
> > I believe this is also the correct behavior for userptr.
>=20
> It is not, the user is still responsible for unmapping.=20

Do you see a problem of the scheme I described? In that scheme, if user vm_=
unbind after userptr is freed/munmapped, we can return user an error "userp=
tr is already freed". Is this a problem to you?

My thinking is, the xe_vma state for userptr depends on a valid userptr. Wh=
en user free/munmap userptr, the userptr is gone, so the xe_vma should also=
 be gone. Isn't this a general valid design principle? Xekmd itself seems a=
pply this principle a lot. For example, when we destroy a vm, all the exec =
queue of this vm is destroyed, not requiring user explicitly destroy queues=
.


Even if this was
> the correct behavior we'd have to unmap from the GPU and update internal
> PT state before calling xe_vma_destroy.

In vma_userptr_invalidate, we called xe_vm_invalidate_vma to zap PT state. =
But currently it is done only for fault mode. If we use my scheme, this sho=
uld be done for both fault and non-fault mode during a MMU_NOTIFY_UNMAP eve=
nt.


>=20
> The correct behavior in this is case just let the userptr page pin fail
> and invalidate GPU mappings. This recently got merge in [1].

This also works, but the design is not as clean as my scheme IMO.=20

For hmmptr, there is no vm_bind (except the initial gigantic bind which doe=
sn't count). It is reasonable to destroy vma when user free/munmap, otherwi=
se we left over a lot of zombie vmas. So at least for hmmptr we should appl=
y my scheme. Whether we should unify the scheme for both userptr and hmmptr=
, I think it is still debatable.=20

Oak

>=20
> Have a pending test for this in [2].
>=20
> Matt
>=20
> [1] https://patchwork.freedesktop.org/series/130935/
> [2] https://patchwork.freedesktop.org/series/131211/
>=20
> > This patch is experimental for CI and open to discuss
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 11a4bb9d5415..90d1163c1090 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -40,6 +40,8 @@
> >  #include "xe_wa.h"
> >  #include "xe_hmm.h"
> >
> > +static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence=
);
> > +
> >  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> >  {
> >  	return vm->gpuvm.r_obj;
> > @@ -604,6 +606,9 @@ static bool vma_userptr_invalidate(struct
> mmu_interval_notifier *mni,
> >
> >  	trace_xe_vma_userptr_invalidate_complete(vma);
> >
> > +	if (range->event =3D=3D MMU_NOTIFY_UNMAP)
> > +		xe_vma_destroy(vma, NULL);
> > +
> >  	return true;
> >  }
> >
> > @@ -901,7 +906,8 @@ static void xe_vma_destroy(struct xe_vma *vma, stru=
ct
> dma_fence *fence)
> >  			xe_vma_destroy_late(vma);
> >  		}
> >  	} else {
> > -		xe_vma_destroy_late(vma);
> > +		INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
> > +		queue_work(system_unbound_wq, &vma->destroy_work);
> >  	}
> >  }
> >
> > --
> > 2.26.3
> >
