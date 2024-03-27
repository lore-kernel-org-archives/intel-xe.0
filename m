Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14D0CD11DD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 01:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEDC10F617;
	Wed, 27 Mar 2024 01:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TROvOBSG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C431510F617
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 01:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711502960; x=1743038960;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GvvhvExJOvyRD8IVlOZFlGEoymiXGtGnJm+OUZITq74=;
 b=TROvOBSGMORJGIgfx6RSYq2iAxALRd8Kk8MOmdo9eb1OgVMwunB5R92A
 snbLqreKbYW4t25yK/rY0HLhSh2mj7BmiwqDVxfU/c9EO4jn+APjSf8XX
 oAyDAshXneGyLZmzXPWxAtam4jjC/wQpF8xY0h5f9x6dYCFHFyxwlRw/T
 +cK5V5kZXqOuyCwqlEQOOtWnBVZ3wZx1F76xoXO302nZowNsU9M58ACqs
 BOmxtaY/NBoPs/LTo8B/APwGGLGsUiPTsYi37kELlN/dCgTX+RzhC6sHj
 5Y3Iq4ByPiRqHqB0yn61FE/H0qocOOH55R8zpUx6lY3maSUVH7AWIejoT g==;
X-CSE-ConnectionGUID: 4k4K5OJMRDqgFsoHEQWVSQ==
X-CSE-MsgGUID: nBLuubX9Tx+llSwUlqkWcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17128314"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="17128314"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 18:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="53599122"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 18:29:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 18:29:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 18:29:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 18:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlbqX+FwiTTAXbmz7ZdtwDnbnbEq++rnXxmx7nf/0gJUJkIT+YAO1iueM8PgQ3XaJzmEVHETNTO9dLBY//jQM0ybIv/7egAqC16nARbRGaG0egoGekUBIIl2TJTIyVg03j+qLi7d0PeqpobuwneNFotXitYLXWN/h4GMRRYVaw8CQfp8ZnXCGjc2Sl4d/EuVNk/S53Jfnt3FfDjnt3QDqpwhFSXAZBUZSKTXurQRjByLAZ6s7XD6KkWE87zgvA4alPff7PieZBId85fWrKiV8bu5ajV4Ar1fcLJ9aUgtFNKvgAlduRABfJ/bqMiQPixMjyYeaUJZRA6uiBUr7qHrow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKyTmschqhCX6Ty5nRWUaapM1prquUeeaWB+PGbOEkE=;
 b=mPscG2Oo/UMQDcxjPeOQIlapasqHn7tSGu6GLFk0U6tXxs3BjRH72TctRj6RkreDdxISs6vclaWWdg2JcES0hCqiJy/VrgE08hjHQwMwuHQvgVWSw73XtOb19nNFCppVZxTpbp269/hhxVML7crv2T3eOhVAfjEpH9MfiOgDjIdCpbL/sFnNQoDIslHa8VEPgzf9F6c4DWHCPoqLoKqrfXAOOggbj71P6Z4PgAtk3HvETPNYjSoWjE+7n4LwaaxHbqCb7csGqKpI/A76JHrqBNjGAotMRPfJdEmCNbQYGbsFRjlR5krNPhYa63BZTQJyY/gl0KSla9AvwcVxPNeOfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by IA1PR11MB8223.namprd11.prod.outlook.com (2603:10b6:208:450::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 01:29:16 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Wed, 27 Mar 2024
 01:29:16 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v4 15/30] drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
Thread-Topic: [PATCH v4 15/30] drm/xe: Add xe_vm_pgtable_update_op to
 xe_vma_ops
Thread-Index: AQHacRaqdlyQSmny9Uq76M3Z1UNMlrFJGgywgAFk7ACAAGqBAA==
Date: Wed, 27 Mar 2024 01:29:16 +0000
Message-ID: <SA1PR11MB699177A96AF72F2B6B24339292342@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-16-matthew.brost@intel.com>
 <SA1PR11MB6991BD0E93816DCB264C00DA92362@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZgMcfJT5UCcTgMl8@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZgMcfJT5UCcTgMl8@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|IA1PR11MB8223:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2haf/GtK2pAhfQpqfLZGAHYyjwr4etXWnLNXwhHhVeyIjAVhgNm80MbFxKHoDxmLqFg6mOtw2HC6Z6L6tlu4GqlW/Nh8t6Yd52jrw/dBJUT2B+l4LOo+LaLIWbVIOAO+lOsOiwkLBAEk1QzgprpRaa7fElT4mDpSeFPu6MpHGCiramoxPWbx9BNIsk76BapKbvdQoH1FLUdlL9s1mjw1HFGfRPCzneOhW9XzAq2WWFxL1GA8MBrdk1uM4OVhx6CQ4sgJwzq5UAmD4miMAzfa0UcW5CROvmJdw0uomD3l1hTeRfdFvzJkuGLlPMF17/by9SqdWcuwMrISNnaamVUgEiuJWbGd/d66SGRme6PASRQGPeWJzPMRjKMwlvt5y1vZPSkOoXosee/pp8tzav1yvBKuvnox+5PwE4gRl/hfxLSpFrr4SSK/mMaZuHe2InxmWoP0BJbAYJlo1fVPem/8MMYSquWrxmSCsHmYL8ZAwT5ArFjAEQrdjTv8nNZ6nCnr5g5+yVFG5SyTvYQ8HZJfB//RN2MO5s0BEDTNO9fTcmlBcBnulrOG1y0KJhW8+u24JieEvF+RO2EjjSphan1LxsHdUkm8FeRWpq1Jrn9CKaZ5wcmqW+YdDtN5V6xhBJMzCdDtWRrawysESpixKEAs8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?shG+0/9LKeM95CwZsbq2kjTy598EZ5Ec+RA8qF3z5xksX+ap/pZwt91MLHn6?=
 =?us-ascii?Q?KRRKpYdKFVs1JMo7UdomJtI8+g66Y7gf38Z3mB55OTg66gmKbs2ojFUsM1ae?=
 =?us-ascii?Q?Kg68ovq6nlcb0WaPkqi+KuJX/sDnj7M2sHySCPK0yk/ujo8dCOthNi0kxsBq?=
 =?us-ascii?Q?ob6PpKZXtwyhU9O47G8SD89PhMSB8Ag/CDVGpufKoB6ShSyXQVQgDEXdKGkr?=
 =?us-ascii?Q?zkrZ0s52YHgA+07jRvNMwLelPBs1rLFfiBtyOyaaQPkdka6TMEWjXgGFJiz2?=
 =?us-ascii?Q?1sOW7YzY6IKKxRXz/KlUYsZyOsmvOYlKGeQRuwhU3qplo7/bs503dy88lTti?=
 =?us-ascii?Q?/mI5k9EZDpH2UyuCFISRkdrsT/wWyvaRoDljTwz8VI5Rrjtj3Wq1fuIAWQiw?=
 =?us-ascii?Q?zGZHkki/oqHmlkhaEytz/NA86bAwhQEC2VATx0lSR3QYJIUz13QVqf/RWPt6?=
 =?us-ascii?Q?ZPybnANDWVs504iNcjtfVQ7ZmUvt9KMfwRAcSmVwmvFFa3kY6e/uVQIlxLKE?=
 =?us-ascii?Q?U9uo34F8dqLEDtD8h7h1XI8UmE0IkSPqd0jrAnpr8OOCM4RUOeMIMObnPbTw?=
 =?us-ascii?Q?vmULk+K+2fYBxSMp9+Ih1AhsfJintQpP1v1fGvB9L0oycVzGEQBsYQmepz+l?=
 =?us-ascii?Q?wAl/sFy/36lt6B1oV4+cVXj4Mv9eVpsHZySmZ5uOFbSjXyikttKZaLpp0tXy?=
 =?us-ascii?Q?sGnOiBoPHbahr9MpiqXOof1OMQhvXQiC8xGX5tTy6JWRwiYtVMqHyKqM94pw?=
 =?us-ascii?Q?7YbrnSPXCL63hJEPQhYtzWeKhscQjhsgadTN9QuNErT/rWGZ50XOFtw329UN?=
 =?us-ascii?Q?yPua4w18BDTFF5MLvmr1ih9CcqjkAEAy/XDgdnnsIdiSCOj9mqLy3xhKWWm2?=
 =?us-ascii?Q?PVjkq37fJ7uo6RpXAH/O+Wy+3H34f66LkmHHRlTrFfDr6/SoThRjdZTvBwGi?=
 =?us-ascii?Q?6eKFtYHmLd/t9fun2Yu7LDQtUQxMdbn86BBXTjIPWCAR7CvXQ20JOf9gKZgN?=
 =?us-ascii?Q?6Au+wGbi6rCEGWfKGSYC/CRBO7Yp8RqT5um22yh5ScuQ07cFZNdiZxvW3YEE?=
 =?us-ascii?Q?40wp9x+C7tPUmxoxGJ6XD6JhNtOKfoalmh91PRxjQpzVio3Z5m3NmblzaD44?=
 =?us-ascii?Q?lJr00uylx36ln9AUgpAVw/OgboTkrESSdoJ0vNfGbdNE2KNNxEo66nmQC6n2?=
 =?us-ascii?Q?aYcqVXB4rQRChbxoNdc9rT4v6VAh2+o5H0pssrw7MNe7GB+306vooP0fD2nk?=
 =?us-ascii?Q?dwwu3impjfxPLeR9fXncMuClEZFxv9YVx1y+T0dt452G71IShHg83HjbByD6?=
 =?us-ascii?Q?e7mzNBgnpU9tazk+BsN7tlo0YyEY5pBZgGYGQGxHXOm61rbXHuFUqef6OFCp?=
 =?us-ascii?Q?XVN+GT1LzzD8zbbQyEGUIx/28ZqNGT6Smx1ZHI4DxSgsNH2G6uYzELFXTqER?=
 =?us-ascii?Q?GSTaVQZizgN3kFgXSKjnzFgNSclMEWqChu5JSEjYLx0AgJegvUERaIBFJDZQ?=
 =?us-ascii?Q?H195j56F3sXbOSn6xWFsQLH60vQxgxWvmr7I+GAc1ARp8R51KNUQhpcK+34F?=
 =?us-ascii?Q?Wz+nY/HGrr9WmIncR2w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9adaf35-2e61-4e10-3bf0-08dc4dfd5104
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2024 01:29:16.0567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tB26F3I5bBZYk0moQ6taS44HeFdBdE1YBeHhYH+Q5sFMha8Tw3JrJwDZfOj1zRNRXVx/0NlbfgxMFxVG9cpCPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8223
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Tuesday, March 26, 2024 3:06 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH v4 15/30] drm/xe: Add xe_vm_pgtable_update_op to
> xe_vma_ops
>=20
> On Mon, Mar 25, 2024 at 03:58:10PM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew
> > > Brost
> > > Sent: Friday, March 8, 2024 12:08 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Brost, Matthew <matthew.brost@intel.com>
> > > Subject: [PATCH v4 15/30] drm/xe: Add xe_vm_pgtable_update_op to
> > > xe_vma_ops
> > >
> > > Will help with the converstion to 1 job per VM bind IOCTL. Allocation
> > > only implemented in this patch.
> >
> >
> > Can you explain why you need to introduce pt_update_op? this patch seem=
s
> only allocate some slot for pt_update_op but they are not really used for=
 page
> table update. I will keep looking the rest of this series.
> >
> > I also don't get why this helps 1job/bind ioctl.
> >
>=20
> Each VMA operations is converted into 0-3 PT per ops tile. i.e. a MAP VMA
> operations with immediate clear generates 0 PT ops, a REMAP VMA with
> both prev & next generates 3 PT ops. PT ops work on the internal / GPU
> PT state compared to VMA ops which operate on the internal GPUVM state.
>=20
> The flow roughly is:
>=20
> generate VMA ops from IOCTL input
> convert all VMA ops to PT ops, prep and stage PT ops
> run PT ops as an atomic unit (1 job)
> commit PT ops
> commit VMA ops
>=20
> If at any point a failure occurs before the commit step the PT ops can
> be unwound.
>=20
> Likewise when a failure occurs the VMA ops are unwound too, this is just
> layer above the PT ops.
>=20
> In the end if an errors at point in the IOCTL the original GPUVM and PT
> state is restored. This compared to serial execution on tip where is an
> error occurs we just kill the VM.
>=20
> Does this make sense?

Hi Matt,

Thanks for explain it. Should we also document such implementation details =
in the xe_vm_doc.h?

Oak

>=20
> Matt
>=20
> >
> > Oak
> >
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pt_types.h | 12 ++++++
> > >  drivers/gpu/drm/xe/xe_vm.c       | 66 +++++++++++++++++++++++++++++-=
-
> -
> > >  drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++
> > >  3 files changed, 81 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > index cee70cb0f014..2093150f461e 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > @@ -74,4 +74,16 @@ struct xe_vm_pgtable_update {
> > >  	u32 flags;
> > >  };
> > >
> > > +/** struct xe_vm_pgtable_update_op - Page table update operation */
> > > +struct xe_vm_pgtable_update_op {
> > > +	/** @entries: entries to update for this operation */
> > > +	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
> > > +	/** @num_entries: number of entries for this update operation */
> > > +	u32 num_entries;
> > > +	/** @bind: is a bind */
> > > +	bool bind;
> > > +	/** @rebind: is a rebind */
> > > +	bool rebind;
> > > +};
> > > +
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 5b93c71fc5e9..72e9bdab79d5 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1319,6 +1319,42 @@ static void xe_vma_ops_init(struct xe_vma_ops
> *vops,
> > > struct xe_vm *vm,
> > >  	vops->num_syncs =3D num_syncs;
> > >  }
> > >
> > > +static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i) {
> > > +		if (!vops->pt_update_ops[i].num_ops)
> > > +			continue;
> > > +
> > > +		vops->pt_update_ops[i].ops =3D
> > > +			kmalloc_array(vops->pt_update_ops[i].num_ops,
> > > +				      sizeof(*vops->pt_update_ops[i].ops),
> > > +				      GFP_KERNEL);
> > > +		if (!vops->pt_update_ops[i].ops)
> > > +			return -ENOMEM;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void xe_vma_ops_fini(struct xe_vma_ops *vops)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> > > +		kfree(vops->pt_update_ops[i].ops);
> > > +}
> > > +
> > > +static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u=
8
> > > tile_mask)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> > > +		if (BIT(i) & tile_mask)
> > > +			++vops->pt_update_ops[i].num_ops;
> > > +}
> > > +
> > >  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > >  {
> > >  	struct drm_gem_object *vm_resv_obj;
> > > @@ -1343,6 +1379,11 @@ struct xe_vm *xe_vm_create(struct xe_device *x=
e,
> > > u32 flags)
> > >  	xe_vma_ops_init(&vm->dummy_ops.vops, vm, NULL, NULL, 0);
> > >  	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
> > >  	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
> > > +	for (id =3D 0; id < XE_MAX_TILES_PER_DEVICE; ++id)
> > > +		vm->dummy_ops.vops.pt_update_ops[id].num_ops =3D 1;
> > > +	err =3D xe_vma_ops_alloc(&vm->dummy_ops.vops);
> > > +	if (err)
> > > +		goto err_free;
> > >
> > >  	INIT_LIST_HEAD(&vm->rebind_list);
> > >
> > > @@ -1468,12 +1509,14 @@ struct xe_vm *xe_vm_create(struct xe_device
> *xe,
> > > u32 flags)
> > >  	return ERR_PTR(err);
> > >
> > >  err_no_resv:
> > > -	mutex_destroy(&vm->snap_mutex);
> > > +	if (!(flags & XE_VM_FLAG_MIGRATION))
> > > +		xe_device_mem_access_put(xe);
> > >  	for_each_tile(tile, xe, id)
> > >  		xe_range_fence_tree_fini(&vm->rftree[id]);
> > > +err_free:
> > > +	mutex_destroy(&vm->snap_mutex);
> > > +	xe_vma_ops_fini(&vm->dummy_ops.vops);
> > >  	kfree(vm);
> > > -	if (!(flags & XE_VM_FLAG_MIGRATION))
> > > -		xe_device_mem_access_put(xe);
> > >  	return ERR_PTR(err);
> > >  }
> > >
> > > @@ -1611,6 +1654,7 @@ static void vm_destroy_work_func(struct
> work_struct
> > > *w)
> > >
> > >  	trace_xe_vm_free(vm);
> > >  	dma_fence_put(vm->rebind_fence);
> > > +	xe_vma_ops_fini(&vm->dummy_ops.vops);
> > >  	kfree(vm);
> > >  }
> > >
> > > @@ -2284,7 +2328,6 @@ static int xe_vma_op_commit(struct xe_vm *vm,
> struct
> > > xe_vma_op *op)
> > >  	return err;
> > >  }
> > >
> > > -
> > >  static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct
> xe_exec_queue *q,
> > >  				   struct drm_gpuva_ops *ops,
> > >  				   struct xe_sync_entry *syncs, u32 num_syncs,
> > > @@ -2334,6 +2377,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm,
> > > struct xe_exec_queue *q,
> > >  				return PTR_ERR(vma);
> > >
> > >  			op->map.vma =3D vma;
> > > +			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
> > > +				xe_vma_ops_incr_pt_update_ops(vops,
> > > +							      op->tile_mask);
> > >  			break;
> > >  		}
> > >  		case DRM_GPUVA_OP_REMAP:
> > > @@ -2378,6 +2424,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm,
> > > struct xe_exec_queue *q,
> > >  					vm_dbg(&xe->drm, "REMAP:SKIP_PREV:
> > > addr=3D0x%016llx, range=3D0x%016llx",
> > >  					       (ULL)op->remap.start,
> > >  					       (ULL)op->remap.range);
> > > +				} else {
> > > +					xe_vma_ops_incr_pt_update_ops(vops,
> > > op->tile_mask);
> > >  				}
> > >  			}
> > >
> > > @@ -2414,13 +2462,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_=
vm
> > > *vm, struct xe_exec_queue *q,
> > >  					vm_dbg(&xe->drm, "REMAP:SKIP_NEXT:
> > > addr=3D0x%016llx, range=3D0x%016llx",
> > >  					       (ULL)op->remap.start,
> > >  					       (ULL)op->remap.range);
> > > +				} else {
> > > +					xe_vma_ops_incr_pt_update_ops(vops,
> > > op->tile_mask);
> > >  				}
> > >  			}
> > > +			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> > >  			break;
> > >  		}
> > >  		case DRM_GPUVA_OP_UNMAP:
> > >  		case DRM_GPUVA_OP_PREFETCH:
> > > -			/* Nothing to do */
> > > +			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
> > >  			break;
> > >  		default:
> > >  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > > @@ -3243,11 +3294,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void
> > > *data, struct drm_file *file)
> > >  		goto unwind_ops;
> > >  	}
> > >
> > > +	err =3D xe_vma_ops_alloc(&vops);
> > > +	if (err)
> > > +		goto unwind_ops;
> > > +
> > >  	err =3D vm_bind_ioctl_ops_execute(vm, &vops);
> > >
> > >  unwind_ops:
> > >  	if (err && err !=3D -ENODATA)
> > >  		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> > > +	xe_vma_ops_fini(&vops);
> > >  	for (i =3D args->num_binds - 1; i >=3D 0; --i)
> > >  		if (ops[i])
> > >  			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index f6ea4df64e79..f5d740dcbba3 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -22,6 +22,7 @@ struct xe_device;
> > >  struct xe_sync_entry;
> > >  struct xe_user_fence;
> > >  struct xe_vm;
> > > +struct xe_vm_pgtable_update_op;
> > >
> > >  #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
> > >  #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
> > > @@ -219,6 +220,13 @@ struct xe_vma_ops {
> > >  	struct xe_sync_entry *syncs;
> > >  	/** @num_syncs: number of syncs */
> > >  	u32 num_syncs;
> > > +	/** @pt_update_ops: page table update operations */
> > > +	struct {
> > > +		/** @ops: operations */
> > > +		struct xe_vm_pgtable_update_op *ops;
> > > +		/** @num_ops: number of operations */
> > > +		u32 num_ops;
> > > +	} pt_update_ops[XE_MAX_TILES_PER_DEVICE];
> > >  };
> > >
> > >  struct xe_vm {
> > > --
> > > 2.34.1
> >
