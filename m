Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E73C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 22:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45080112CB7;
	Mon, 11 Mar 2024 22:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGSfoiRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0665E112CB7
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 22:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710194552; x=1741730552;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wtS4qHXHqt70ImsRKhA6KhtSjp6BgievP3dnGApYCzw=;
 b=DGSfoiRP/01suo1tSzWLjVrVyVXQ52vpf9DNCtBx98PIBu75kThv8x8z
 eAZd89rv/DGwiEU5rsTjm9/d9Vp/JeIgqhBmXe86/4fcWo97o+uARatTX
 iFW0wYlCCE85OEV6oD22gFaHo86cbrwkVb20E/C3VzLP5P8cMZVO7V/lN
 HVxUp/uik35W7Vb1wmu3jQ5aUm5BWtm/yNvPROg56v+w3HIFa5Vpf6loF
 cUKlmiuh/8CbyTB6A7VZUIDARHYQfOEXL4HaEYY9ypjRYe3VX3WwwCwER
 fgbUpr/0YDGZ/H33wSQkj9Y1Sfmd+lV5JilJ2SDyYl6UoCX1pHis+GXRr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="27356906"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="27356906"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 15:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="42224136"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 15:02:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 15:02:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 15:02:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 15:02:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVUmFeVSAsJT0PLsiCfcU7lt82/TDDDC5ZH4GyNTKToERAIddtXAVkCB8k3E5U6W6ua5g5UQ7pshDgDGvS3JoyrI+5yn78eV88X48nGkDRbxtXJ+IQvKAJcVmOnYPe3I7AL9z5WOxN4dMaz0yZPQfSvjC/YD3BGMGAmi7mxYmi9S+NQyrJyzpAUu9HAIUAEU5mm/HV5lefuUQWZeco8ZmUK6K7SgHxuGjbrYdDiodNdZA3l9pZ9BlQAOesuuCbBKhHTE0IoHYrwI3qE94J00WDrVNF7CwBVLZ9cnUSsXFISSrlGCGlWvjlEAM5pBfccSgD46rpvRUNI9cRNB3ChEuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyhvK87Mm/3sRDM2JNVYsxrW5mZdjLXAheedFqZJKtE=;
 b=JQBShW3X0OXh6UEHAtCpmmGrywQT60pqC+KK2HMsRCh6tSnhYYI7LoBxwT9DUPe0uFXzs/8g21Obc+gRWrTbaH73/RroDbTWWJk54ZhypWvWYrBPy3bDMXoB55cSCZWTWFtjxeDGJmn+JC4idrRBAolD3E71HvcWEOt35SaghwrUj5u/UUQgXT/Lwl7p5VCrLU94Xu9dYRPujwrrwnXFWlTXEEVFrwrxnxTOQ84t3gIzceoY5iy7CZomAD12731vLhtYkdiEESsJiPROZPKeZ189vASCHCml0CrOWA4vxnIpTFTiMsz1XPh/EJwe6d59J6Dod+m/DLA716JvqSFG5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH8PR11MB6853.namprd11.prod.outlook.com (2603:10b6:510:22e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.15; Mon, 11 Mar
 2024 22:02:28 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%4]) with mapi id 15.20.7362.017; Mon, 11 Mar 2024
 22:02:28 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v4 01/30] drm/xe: Lock all gpuva ops during VM bind IOCTL
Thread-Topic: [PATCH v4 01/30] drm/xe: Lock all gpuva ops during VM bind IOCTL
Thread-Index: AQHacRabrjz3DDGVyUKATKk5TSOMG7ExN58AgAHAhYCAAB8NYA==
Date: Mon, 11 Mar 2024 22:02:28 +0000
Message-ID: <SA1PR11MB69915ABA34C079F317F76DAE92242@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-2-matthew.brost@intel.com>
 <SA1PR11MB6991E7ECA4A2ADD89DA05C1792252@SA1PR11MB6991.namprd11.prod.outlook.com>
 <Ze9gKyDiycibP6g5@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Ze9gKyDiycibP6g5@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH8PR11MB6853:EE_
x-ms-office365-filtering-correlation-id: dd3c2066-bd17-4a91-c64c-08dc4216f133
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2OIRC7mMm4UZ6ejE6cNWV5fsos8qQQWVHEjzUNDLg2Y2pltqiaf4Po1wiBrhIm4wDZeMnj4ZcACFsdpJbtZ8SnI9tF4ZR46qgRe3LeSVwqgCna35kILkzheIEhk2Up5iMGrZgF8c24cD2bIE9JTwrap8qgMNhg54ZWBZuRzNaYIncST9m3TTHtda4nNeEH5DKKHHaxGOfBCG4FGIGPIgfxsOfY2rQewvQYAp/IdceTVuvzHQgEfs4GyLLgJoSgJWaIq9v6Bol0Q+LBsKb27la0Y6njOClJUpy7Dd2DC0el1L1pltJn9kXzTBqT+KImrHb1oxbXQlS4ourmi/MDEhizQ7TYeAzO/osR4Ej7g4pADyZtnnDL3WHtSbN7snPE1UMxA1ZQJihUVZAa89lj3Fl+Tgj8WLbs7jOc4Qxg32WR4OrxzVkSbFtYRipOzkZ6JQYNw16Fs6fxcWxJYJ30LI9LKvKgU2HD681yhtugldzvpEY9aV8YHr0nkEwEig0JntQYsEWJSin0G0c6CSuoOij1f/wRVetdHkiBY+bFkkDVRs7xipwHHvcaQxI7uGywaFDHXVPjG9aio9veiQBVjw10D0s7UJp0sJbuD5OTeCfhzFkD+iuvgHQAIPh37x6YKne6vdDLVzE7or700t6uPiqEIenp/uab7qNlVU6aBx5FovSGTMfQdD8s1cUCikyxJI6xN6yiZPG4cPofxYd3W//WcbgRyd1XFAKsHeUSDq3tc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2zVuqUH5PJHES6nfQlLutkI+BDzBg9o/dErf8xXxHkYqfWEIqKlwh9T0SfJt?=
 =?us-ascii?Q?aZc1YprYb4a7LbnRD22BI/0i4LPgoNmvhUxWg0QSNBVdsbOSIFz6jkZt6/++?=
 =?us-ascii?Q?tlmwaBBguYx25fimz14Wmjx7vyc1bGrkwsySew+YfmvZlYb29oZuaUPDFKVP?=
 =?us-ascii?Q?ailKxHFuGsSPWlmRuoV1kkhNwWIJhbQyb6WlWSdjTMueajGYstadApzhDIl6?=
 =?us-ascii?Q?v2p9592cEOHbH1YoBQ+cmmgfU9udgpdUunPR4MyT45DPjh9BRj99LnuDTOmN?=
 =?us-ascii?Q?EymmWIJwknthgjULsPmff1PIJVnD6v2G3SjA/3Jg8jA/Y56hxv98xORTR/Qd?=
 =?us-ascii?Q?72X4C+K76x91fwwy0sRCeZt/zNYPSKKYaIgnNAYBHBCxyIu12FW+iPhE+HPe?=
 =?us-ascii?Q?Uqz5QJAGCi7L7NUCKFpw2b/+Fm3C/qIBrXV2NLwZqGpPDm4DsXoCnRORhxHs?=
 =?us-ascii?Q?32G7xYMP2AckQcYsNFCVtg+Jzo+J/L8kfEJTrv8GL0Tj67LDZ7qRQdrExnKo?=
 =?us-ascii?Q?BR4EZ0Z8xRwco8rqf98fsNRDHrnP40Orrr1rxk/58oGKFqNT6uHIUrb2QE8K?=
 =?us-ascii?Q?grs9rVv1m6a58P+0LP91H8oSinZiGijYwnFGBFaM/47bz0uGHn2PlISV5Gg5?=
 =?us-ascii?Q?BVnmIqRsdkXSP83wIWmWGClkM1di0BfvyGG9esVcRzq3km16lK66/T0yp1s7?=
 =?us-ascii?Q?2ZhX04yH1evSTV1PDaRD8biYZzBzgUom10r5qzyzBd7hXIH5bFNG6qNryzZD?=
 =?us-ascii?Q?k3PUfJne0ICQlGubLuoIBoqy4FPAzGuvxjYyXILwROL4dghytqLQeAXMryzG?=
 =?us-ascii?Q?iU1ERbwNow6goOTplZl91sYOLN9kdZTYi37z+HwKXydIELexo67MjEkjrw3Q?=
 =?us-ascii?Q?kAvyHJ70Otbk0ntGEyHkM8rsbEcKGnfXokUHlP/W8pr/cDo2JdZac3DcJoTM?=
 =?us-ascii?Q?eSu/HSF7KkddS8oYtQ7il9t/lk4ylAeaS565Ax8KdK8XH0KM+U8Ft5OR3yJk?=
 =?us-ascii?Q?phij+kg+nBaVZxaJUJuRYdXx5+b++4NYTPuug23LGQfuIlL2Itx+RMf8H/hB?=
 =?us-ascii?Q?jnQqJ1soWIHk7i5gmF4YDbv89qOUedcwlCd21OZsoibYCfNOW6QMEYsgBRUn?=
 =?us-ascii?Q?S7CuOMAhSbMq9KZMACuUlDF6aTG8K47svK2ehkhsZSNn99B5P3qHeq0VHziG?=
 =?us-ascii?Q?ofV6c7L/U0RS8zL0zmXJhYHoT5prM/Y/vGDKioHJmYrH1SOLq1NUvVKtj697?=
 =?us-ascii?Q?OTuMn2IcOAknqakjyBcJKiE19v1wHafwgkLSdLhd6tCfw32rHY5KUh3Ug+QR?=
 =?us-ascii?Q?SYN0bTQKYBCv9gCbd23kw5P8XGKB/N2xfc4BGi6TToWspuSv7T4ecgXJWmQj?=
 =?us-ascii?Q?oQIwcK5HkBscQsVRCFri7Xp2Q60yEVAnpeZUaBNLJIe/Kb31haUAkL8tCcu4?=
 =?us-ascii?Q?Upy0kkZviPX67cQyF3gHMwSG5CBdGdR87NOF4q2KdTj+dcFTuopS5zKDzTRU?=
 =?us-ascii?Q?mbT0RdX1sON2/QIuJB97UGzxXj2XMJRNiAZuVqE67Z6RYTv8XVJ3QuoS+RgX?=
 =?us-ascii?Q?4faKC8dHG0s8RpFwIfo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3c2066-bd17-4a91-c64c-08dc4216f133
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 22:02:28.2685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3b8+sQi1VDQhvWpevYVSOCO8V65mWToAqFiz6ctLIYIevqMSa0/cuHTp5cxw9tx13pGe1iSXzO3cVI1W9durkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6853
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
> Sent: Monday, March 11, 2024 3:49 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH v4 01/30] drm/xe: Lock all gpuva ops during VM bind I=
OCTL
>=20
> On Sun, Mar 10, 2024 at 11:44:00AM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew
> > > Brost
> > > Sent: Friday, March 8, 2024 12:08 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Brost, Matthew <matthew.brost@intel.com>
> > > Subject: [PATCH v4 01/30] drm/xe: Lock all gpuva ops during VM bind I=
OCTL
> > >
> > > Lock all gpuva ops
> >
> > Can we have a better wording? Better to say locking all Bos used in gpu=
va ops?
> >
> > Or maybe lock ops by locking and validating all Bos used in ops.
> >
> >  and validate all BOs in a single step durin the VM
>=20
>=20
> Lock all BOs used in gpuva ops and validate all BOs in a single step
> during the VM bind IOCTL?

Yes, that looks better.

>=20
> > > bind IOCTL. This help with the transition to making all gpuva ops in =
a
> > > VM bind IOCTL a single atomic job.
> >
> > Can you also explain, why you want bind to be a atomic job?
> >
> > My guess is, bind ioctl can end up with a series of operations, if some=
 (not all) of
> those operations fail in the middle, it is hard to revert the successful =
operations
> before failure.
>=20
> Yes, exactly. It is ensure if we fail at some point in the bind IOCTL
> (e.g. memory allocation failure) we can unwind to the initial state.
> Also another benefit is we get 1 fence per IOCTL which is installed
> dma-resv slots and returned to the user via out-syncs. Lastly, it
> logically makes sense that 1 IOCTL translates to 1 job.
>=20
> The cover letter at some point explained this. I add something in the
> next rev.
>=20
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 142 ++++++++++++++++++++++++++---------
> --
> > >  1 file changed, 101 insertions(+), 41 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 643b3701a738..3b5dc6de07f7 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -413,19 +413,23 @@ int __xe_vm_userptr_needs_repin(struct xe_vm
> *vm)
> > >
> > >  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> > >
> > > -static void xe_vm_kill(struct xe_vm *vm)
> > > +static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> > >  {
> > >  	struct xe_exec_queue *q;
> > >
> > >  	lockdep_assert_held(&vm->lock);
> > >
> > > -	xe_vm_lock(vm, false);
> > > +	if (unlocked)
> > > +		xe_vm_lock(vm, false);
> > > +
> >
> > Can you explain why we need xe_vm_lock in the first place here?
> >
> > My understanding is, xe_vm_lock protect gpu page table update. Below ki=
ll
> function eventually calls into guc_exec_queue_kill where I don't see any =
page
> table operation there. So I doubt whether we need the lock in the first p=
lace.
> >
>=20
> I think it it protect vm->preempt.exec_queues list but that could
> probably be reworked. For this series I'd rather leave the locking as is
> and then in follow up rework the locking a bit and fully document it.

Isn't that vm->pre-empt.exec_queues is protected by vm::lock (the rw) semap=
hore? Xe_vm_lock here is vm's dma resv.

I agree we can rework those locks later.


>=20
> > >  	vm->flags |=3D XE_VM_FLAG_BANNED;
> > >  	trace_xe_vm_kill(vm);
> > >
> > >  	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
> > >  		q->ops->kill(q);
> > > -	xe_vm_unlock(vm);
> > > +
> > > +	if (unlocked)
> > > +		xe_vm_unlock(vm);
> > >
> > >  	/* TODO: Inform user the VM is banned */
> > >  }
> > > @@ -621,7 +625,7 @@ static void preempt_rebind_work_func(struct
> work_struct
> > > *w)
> > >
> > >  	if (err) {
> > >  		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
> > > -		xe_vm_kill(vm);
> > > +		xe_vm_kill(vm, true);
> > >  	}
> > >  	up_write(&vm->lock);
> > >
> > > @@ -1831,17 +1835,9 @@ static int xe_vm_bind(struct xe_vm *vm, struct
> xe_vma
> > > *vma, struct xe_exec_queue
> > >  		      u32 num_syncs, bool immediate, bool first_op,
> > >  		      bool last_op)
> > >  {
> > > -	int err;
> > > -
> > >  	xe_vm_assert_held(vm);
> > >  	xe_bo_assert_held(bo);
> > >
> > > -	if (bo && immediate) {
> > > -		err =3D xe_bo_validate(bo, vm, true);
> > > -		if (err)
> > > -			return err;
> > > -	}
> > > -
> > >  	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate,
> first_op,
> > >  			    last_op);
> > >  }
> > > @@ -2488,17 +2484,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_=
vm
> *vm,
> > > struct xe_exec_queue *q,
> > >  	return 0;
> > >  }
> > >
> > > -static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> > > -		      struct xe_vma *vma, struct xe_vma_op *op)
> > > +static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > > +		      struct xe_vma_op *op)
> > >  {
> > >  	int err;
> > >
> > >  	lockdep_assert_held_write(&vm->lock);
> > > -
> > > -	err =3D xe_vm_prepare_vma(exec, vma, 1);
> > > -	if (err)
> > > -		return err;
> > > -
> > >  	xe_vm_assert_held(vm);
> > >  	xe_bo_assert_held(xe_vma_bo(vma));
> > >
> > > @@ -2579,19 +2570,10 @@ static int op_execute(struct drm_exec *exec,
> struct
> > > xe_vm *vm,
> > >  static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > >  			       struct xe_vma_op *op)
> > >  {
> > > -	struct drm_exec exec;
> > >  	int err;
> > >
> > >  retry_userptr:
> > > -	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> > > -	drm_exec_until_all_locked(&exec) {
> > > -		err =3D op_execute(&exec, vm, vma, op);
> > > -		drm_exec_retry_on_contention(&exec);
> > > -		if (err)
> > > -			break;
> > > -	}
> > > -	drm_exec_fini(&exec);
> > > -
> > > +	err =3D op_execute(vm, vma, op);
> > >  	if (err =3D=3D -EAGAIN) {
> > >  		lockdep_assert_held_write(&vm->lock);
> > >
> > > @@ -2756,29 +2738,107 @@ static void vm_bind_ioctl_ops_unwind(struct
> xe_vm
> > > *vm,
> > >  	}
> > >  }
> > >
> > > +static int vma_lock(struct drm_exec *exec, struct xe_vma *vma, bool
> validate)
> > > +{
> > > +	struct xe_bo *bo =3D xe_vma_bo(vma);
> > > +	int err =3D 0;
> > > +
> > > +	if (bo) {
> > > +		if (!bo->vm)
> > > +			err =3D drm_exec_prepare_obj(exec, &bo->ttm.base, 1);
> > > +		if (!err && validate)
> > > +			err =3D xe_bo_validate(bo, xe_vma_vm(vma), true);
> > > +	}
> > > +
> > > +	return err;
> > > +}
> > > +
> > > +static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
> > > +		   struct xe_vma_op *op)
> > > +{
> > > +	int err =3D 0;
> > > +
> > > +	switch (op->base.op) {
> > > +	case DRM_GPUVA_OP_MAP:
> > > +		err =3D vma_lock(exec, op-
> >map.vma, !xe_vm_in_fault_mode(vm));
> > > +		break;
> > > +	case DRM_GPUVA_OP_REMAP:
> > > +		err =3D vma_lock(exec, gpuva_to_vma(op->base.remap.unmap-
> >va),
> > > +			       false);
> > > +		if (!err && op->remap.prev)
> > > +			err =3D vma_lock(exec, op->remap.prev, true);
> > > +		if (!err && op->remap.next)
> > > +			err =3D vma_lock(exec, op->remap.next, true);
> > > +		break;
> > > +	case DRM_GPUVA_OP_UNMAP:
> > > +		err =3D vma_lock(exec, gpuva_to_vma(op->base.unmap.va), false);
> > > +		break;
> > > +	case DRM_GPUVA_OP_PREFETCH:
> > > +		err =3D vma_lock(exec, gpuva_to_vma(op->base.prefetch.va),
> true);
> > > +		break;
> > > +	default:
> > > +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > > +	}
> > > +
> > > +	return err;
> > > +}
> > > +
> > > +static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
> > > +				  struct xe_vm *vm,
> > > +				  struct list_head *ops_list)
> > > +{
> > > +	struct xe_vma_op *op;
> > > +	int err;
> > > +
> > > +	err =3D drm_exec_prepare_obj(exec, xe_vm_obj(vm), 1);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	list_for_each_entry(op, ops_list, link) {
> > > +		err =3D op_lock(exec, vm, op);
> > > +		if (err)
> > > +			return err;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > >  				     struct list_head *ops_list)
> > >  {
> > > +	struct drm_exec exec;
> > >  	struct xe_vma_op *op, *next;
> > >  	int err;
> > >
> > >  	lockdep_assert_held_write(&vm->lock);
> > >
> > > -	list_for_each_entry_safe(op, next, ops_list, link) {
> > > -		err =3D xe_vma_op_execute(vm, op);
> > > -		if (err) {
> > > -			drm_warn(&vm->xe->drm, "VM op(%d) failed with %d",
> > > -				 op->base.op, err);
> > > -			/*
> > > -			 * FIXME: Killing VM rather than proper error handling
> > > -			 */
> > > -			xe_vm_kill(vm);
> > > -			return -ENOSPC;
> > > +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> > > +		      DRM_EXEC_IGNORE_DUPLICATES, 0);
> > > +	drm_exec_until_all_locked(&exec) {
> > > +		err =3D vm_bind_ioctl_ops_lock(&exec, vm, ops_list);
> > > +		drm_exec_retry_on_contention(&exec);
> > > +		if (err)
> > > +			goto unlock;
> > > +
> >
> > Do you need below ops inside the drm_exec_until_all_locked loop? After =
you
> locked all objects, you can close the drm_exec_until_all_locked loop, the=
n
> perform below out of drm_exec_until_all_locked loop.
> >
>=20
> Yes, xe_vma_op_execute can GPU allocate memory. GPU memory allocations
> can trigger evictions which try to grab more locks. Once the
> drm_exec_until_all_locked loop is broken we are not allowed try grab
> more locks.

I see. So you need xe_vma_op_execute in the drm_exec_until_all_locked loop =
to grab more locks.


 Also eventually on memory allocations I think we will pass
> in drm_exec state so the looking can hook into that.

Then I guess you need a exec parameter in xe_vma_op_execute, so eventually =
you can grab more locks in memory allocation?

Oak

>=20
> Matt
>=20
> > Oak
> >
> > > +		list_for_each_entry_safe(op, next, ops_list, link) {
> > > +			err =3D xe_vma_op_execute(vm, op);
> > > +			if (err) {
> > > +				drm_warn(&vm->xe->drm, "VM op(%d) failed
> > > with %d",
> > > +					 op->base.op, err);
> > > +				/*
> > > +				 * FIXME: Killing VM rather than proper error
> > > handling
> > > +				 */
> > > +				xe_vm_kill(vm, false);
> > > +				err =3D -ENOSPC;
> > > +				goto unlock;
> > > +			}
> > > +			xe_vma_op_cleanup(vm, op);
> > >  		}
> > > -		xe_vma_op_cleanup(vm, op);
> > >  	}
> > >
> > > -	return 0;
> > > +unlock:
> > > +	drm_exec_fini(&exec);
> > > +	return err;
> > >  }
> > >
> > >  #define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL | \
> > > --
> > > 2.34.1
> >
