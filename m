Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809EBEB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 02:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB9C10E086;
	Tue, 11 Jul 2023 02:12:13 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BFD10E086
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 02:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689041531; x=1720577531;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B2LUXJ0+ypFUHrWtU2sMKyKTn/dAsqoz6h2lO+lKadE=;
 b=JRKZzZBn2SD0ppWo4fKPco/O4C8Prg92CH50Lxa709PXHWNDgNS6/RIH
 svzcXQAcdBFLHHadHlmWWtq28AK1Uog+eFLwOa5smwdtsxLTgZbEkUcPe
 IkeBol4u9gTd4tBBfeRS4prorGYd6Cv6WCpyBsjG8TnBLMNb4vC5jIJNq
 c7XNO/9+w+2wPiRPD4UevS2k/HsFKH8zmWoXNuYvFb12txpEQrF1/u/lf
 fvbhrxMsUH8DIoqZ9lzX4aZ5kZ+jAl5M/uUTfDOoOoBFEpPrRml2QKdUg
 WJc5bPzj31C+NPQU/7ZL/klI2fjKU6WD6IHsgwuoiNnjEZpk6wmi7d9sa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344101156"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="344101156"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 19:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="791011751"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="791011751"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 10 Jul 2023 19:12:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 10 Jul 2023 19:12:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 10 Jul 2023 19:12:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 10 Jul 2023 19:12:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJsw6NMIGEB+GszdcxKLOgAZnMQL2mHafZIrTKohI6obCFcleAMdbE8cR/Qz07F812T8qnbaz+eRhoPtQdtpgb6wzV8jgigMJtqla6gKa70Ieb38ExfdcrfrxJfmWGzvyijNLyFk6E+qWX/saRbhdMCsLy+WRZ9MF/npafhPAtxIXxul5skEpo9dmatfJ60M2dTUnOKpeeyuw7uzr9xOPe51src7NftXpvigvlVqW6PVhDW2je+FPnhvcwFWoFezVb2/EGnOd7YJ+glJ+JT/nPN/iznwPPcBssyTNZCcQ9lYrkZvJ0z7/qKPsP7hH6WzNRr0Z79kDZKTl/w5eOwm5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PD0SEiNk3ZuaGW8P2pWyXh900gYXqpobFVxOVLE5qe0=;
 b=nPImkxNKBwQQHNBanm+CwCmlSuInoUQ1/RIJO3P3aHUG1qfb+FH9AEUdEzryW8snMC+wD7AIsQrNIh8Y3jOju4jzE5qQVXiplSYSa183kGbkWclGgC+h9PuFlj5sZVkWmiEeiFLSchWJ4qJ377CB54YxLR20tZcX4e7WqDlzCiYya4bezRRfPzGBI2xZGy21wQ/7n5TITDUNSNUtHUUhttTY7x8wllTLHF5ow1Qrl+Jy4WfDhLBJswZdy7f/UndDrOykWxqVPsJXxwso+P/BhPveWZoKF63R2IgeNVHT0HF/t0S0dW7CU54C6lUbjUZS5XZ7KntJnOj2P+UXjxwEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH7PR11MB6746.namprd11.prod.outlook.com (2603:10b6:510:1b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 02:12:01 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4ddb:c601:faf:fb9f]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4ddb:c601:faf:fb9f%6]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 02:11:59 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH] drm/xe: Enable scratch page when page fault is enabled
Thread-Index: AQHZs3rieMfAsT12tU+ZDyiQt3Yqda+zz3bQ
Date: Tue, 11 Jul 2023 02:11:59 +0000
Message-ID: <SA1PR11MB6991A43BEA30CCE04A735F449231A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20230710220654.323844-1-yu.bruce.chang@intel.com>
In-Reply-To: <20230710220654.323844-1-yu.bruce.chang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH7PR11MB6746:EE_
x-ms-office365-filtering-correlation-id: 2f351b31-f164-4cff-02f7-08db81b4357b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6B9TSd10oWL87sxuNsfEkzlM2ydeGkMDeDauy2j6gAZQgTQJVVEvvP6wNU3q4sTuVk48/MKk2Zk9eso4sf5ID/eiraDBX1Dnc3c/F0xCMyr5IJ9H5xQvX5OS/RwO4S3AJNQHJ45ZVdr2dbd3yvtUEYU5q8gRb8gKezDtjrFl5uGiY9myVU5ehT/3BzH7fBGRIxwO5JkuQAOFv1FH2q5DDDArwzYyrIVLg1tRXIrHoG/fTrnaxYQFss4UisC1QvDivHqeDSVDLVxrLK7IgthpDIOhigcMmNOB7sa9hX4qtVKsllAQ1k/C1d53wWkF/sdYj0NrivygOsMf81swLptDzo4SBDC2p80507c3dySNtZc//3UqZhcjuz5Ta1UN5TLERSmztxWpNhL6Cd4wFecOET2rp2BOKP6L+XRQmGOAkMZtaa6wMlzUqJdRGG9ptqQ0TWJrzehGpDycCLyj8x06AGwGTHk1PYOzWrfhMuKqpYmV+MJeCPfwhOzfWthMidGKsCq1KUYrcJSt4VBXosFgG6ehEJCLk0RL3cihDGWEOGlBrqWrK5zlCkX8KNRyez3X4dPi8L7qIYpLv4ebF0TdT0OpkGeYHyIOssBSRYBYHAHoulrsZ8Ekbp14IRT7yjqj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(38100700002)(86362001)(82960400001)(38070700005)(33656002)(55016003)(76116006)(7696005)(110136005)(54906003)(71200400001)(122000001)(478600001)(26005)(107886003)(6506007)(186003)(53546011)(9686003)(316002)(2906002)(66556008)(5660300002)(66946007)(66476007)(8936002)(8676002)(52536014)(66446008)(64756008)(83380400001)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EKMvGRR8spZvQLuawMCX7X0MfgBGV2Ad92WlUAurbqnqPniB6xjRKDkTF7+x?=
 =?us-ascii?Q?6EiE96b1my4A+iX8BpIwfFWydMBMlzIAWYtYRVSdRGX3rHh8xQ0UUVQNT+Fx?=
 =?us-ascii?Q?RBWoHhPfJyfR4MW/B3Q/qb1xAMZAhZsm4VBlIEliRzJZvDr2C8QvFMCHobt7?=
 =?us-ascii?Q?hEb70hJfS2xMbviRMaXcJMR3PIncAKj0UVp815bKSUb0lr9uoqWJVGA6eF1D?=
 =?us-ascii?Q?djC6HwXintiIS2hQuXfR3MdaMCDcnUplSVFxuw+Ihp5LnakhJZ0jPuNlFj4g?=
 =?us-ascii?Q?ce/nr54y1B0Qg3HMdjYBI07mcJjpAJiuKQ8inzNcPdZHjkTfpLbHardoDIVY?=
 =?us-ascii?Q?eAzq+T8l3v2Y5lU5VZ72Tj50B2JhtsSFj9cYbYZv5iKkifUfqoQp4CcjkPoP?=
 =?us-ascii?Q?fgW9mdB1VBCjRC/IhlaVGaUlza5spoaOQLL9mHyXLcLPEP0BucxZ2cyzmQ6f?=
 =?us-ascii?Q?tQFfCyJRgUEuXnNTDMEZ+n4wdFNWCy1CJA/MYk5bwS+mMPJmKDJEgNgzZqDK?=
 =?us-ascii?Q?KYP7rgRyu/cD3FIxSgVJotAYy9n7VpCSrzz6/K8+TqvNbB+Yy46v65N72rzE?=
 =?us-ascii?Q?WryNtvouuzWRcSexwyu4QF/lhbvfYHNZBb2UUachMPfKWhO6EJIeIKByTiW7?=
 =?us-ascii?Q?js9yEaWiCf9Ln1UW8MSi+FBpcDVgItw/XAjGns0hustPLRtecweDiVeJHR4N?=
 =?us-ascii?Q?TeE5qlQ3vfYzkmarv3iG397CfFSKHMBt3jSwE88MP6gy6vG9LiA+aD+ZV58m?=
 =?us-ascii?Q?olmUIpD0ZIANP7or67tu2PgGfR4kdlEMQH+X65WbNrbpPutoNuRzBgCbIOcs?=
 =?us-ascii?Q?v8dV1f8Y0NRrQHPT1DwQUiMXJOr8rwt1PwWVYZVYpRu+Dtu1l+hO4P2qxKE3?=
 =?us-ascii?Q?f2lpR0hQQOsWeQdsUwTx+h6pyV+BWflHi0CR+pbedl9jEHNsjPon7h+oS+VJ?=
 =?us-ascii?Q?K7/9Lj8eO9Y1Bk153SPduWVGk7qGLsQSAZmqYn/P5vsQ6dDPLNQ+8bJTR7en?=
 =?us-ascii?Q?gMLTrYhmsTxU+7THd6UJmdeZoMPgOiOvbIVmkmAyeJDXf43x7pUJaDtulYIz?=
 =?us-ascii?Q?2JS8fvALNTmwZpJevnNaOTvx27JCi1szsmuZ7ovmAzGIcB40dXZVL99cjrh5?=
 =?us-ascii?Q?m0isa6ymoSQO6Gz/lQUdcOTyORWvhCp4Fupc5zizWws/x63ix+cdqXXp4FqJ?=
 =?us-ascii?Q?hCfLsG4HKT/tMzVej2z0hV5aEMDfW4btuA0r0EvixXs3Z8qEjsg0iiNB44ce?=
 =?us-ascii?Q?xI4kgXKQtuiN5hXN3NqYyNvYWA3ufPwcnzItZHhpERunKUXOWWrpsAjl12rw?=
 =?us-ascii?Q?oIJo50IlT2Y0ph0tMJjeJrVa0+dw/OngojW2H6gVU6elyOT/LHf5DGqsRoIJ?=
 =?us-ascii?Q?Fj2xR8E6elqb+QydIsHILEfFyOtEe4rg2DtpIxBaDcFgKj6NTyzEM/LBhM23?=
 =?us-ascii?Q?Tii2mdR4mTGhR7IgJxXLEE6Hora5DiQJpCHRZiI15AoPY9Wyg6LhkOWj3y9c?=
 =?us-ascii?Q?1qcJaDPFz2s23AaQ+lUITVDLs1vXecQ0p+c234/rpjF7D60WNg/axVoIbEsX?=
 =?us-ascii?Q?G8kK0+i+bg9v+ATFwbk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f351b31-f164-4cff-02f7-08db81b4357b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2023 02:11:59.4057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rn71FpqK1thS69u38y2zShQTQ/RTly+61wGWWJm3csvaIrPv0UM5/2MFoQXBvaH0VDN7lLoquXRVcEvvO9I6Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6746
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
Cc: "Summers, Stuart" <stuart.summers@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Bruce,

Why do we want to enable scratch page on xe driver? Mapping whole process a=
ddress space to scratch page or mapping invalid (aka out of bound) GPU virt=
ual address to scratch page can hide application programming bug. It can ev=
en hide kmd or GPU HW bug. My philosophy is, when there is a bug, fail the =
application immediately and let user know the problem immediately. Hiding i=
ssues fails us for long run.

On I915, this feature has caused us a lot of troubles. Once it is enabled, =
application can depend on it so it is very hard to remove. As you know our =
plan is to disable scratch page on i915. So I don't understand why we want =
enable this "feature" in the first place.=20

Thanks,
Oak

> -----Original Message-----
> From: Chang, Yu bruce <yu.bruce.chang@intel.com>
> Sent: July 10, 2023 6:07 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Chang, Yu bruce <yu.bruce.chang@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>; Welty, Brian <brian.welty@intel.com>; Vishwanathapu=
ra,
> Niranjana <niranjana.vishwanathapura@intel.com>; Summers, Stuart
> <stuart.summers@intel.com>; Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH] drm/xe: Enable scratch page when page fault is enabled
>=20
> This is just a proposal and not fully tested yet. Once it is got
> agreenment, more efforts needed to make it fully working, including igt
> test changes.
>=20
> i915 can use scratch page even when page fault is enabled, this patch
> is trying to port this feature over.
>=20
> The current i915 solution changes page table directly which may be hard t=
o
> make to upstream, so a more complex solution is needed to apply to the
> current Xe framework if following the existing i915 solution.
>=20
> This patch is trying to make the minimum impact to the existing driver,
> but still enable the scratch page support.
>=20
> So, the idea is to bind a scratch vma if the page fault is from an invali=
d
> access. This patch is taking advantage of null pte at this point, we may
> introduce a special vma for scratch vma if needed. After the bind, the us=
er
> app can continue to run without causing a fatal failure or reset and
> stop.
>=20
> In case the app will bind this scratch vma to a valid address, it will
> fail the bind, this patch will handle the failre and unbind the scrach
> vma[s], so that the user binding will be retried to the valid address.
>=20
> This patch only kicks in when there is a failure for both page fault
> and bind, so it should has no impact to the exiating code path. On
> another hand, it uses actual page tables instead of special scratch
> page tables, so it enables potential not to invalidate TLBs when doing
> unbind if all upper layer page tables are still being used.
>=20
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  8 +++--
>  drivers/gpu/drm/xe/xe_vm.c           | 52 ++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_vm.h           |  2 ++
>  3 files changed, 53 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 6faebd02f3fb..01d316baf0e4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -138,8 +138,12 @@ static int handle_pagefault(struct xe_gt *gt, struct
> pagefault *pf)
>  	write_locked =3D true;
>  	vma =3D lookup_vma(vm, pf->page_addr);
>  	if (!vma) {
> -		ret =3D -EINVAL;
> -		goto unlock_vm;
> +		if (vm->flags & XE_VM_FLAG_SCRATCH_PAGE)
> +			ret =3D xe_bind_scratch_vma(vm, pf->page_addr, SZ_64K);
> +		else
> +			ret =3D -EINVAL;
> +		if (ret)
> +			goto unlock_vm;
>  	}
>=20
>  	if (!xe_vma_is_userptr(vma) || !xe_vma_userptr_check_repin(vma)) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dbff75a9087b..dc2d0cdfb0dc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1241,7 +1241,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u3=
2
> flags)
>  		}
>  	}
>=20
> -	if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
> +	if (flags & XE_VM_FLAG_SCRATCH_PAGE &&
> +	    (!(flags & XE_VM_FLAG_FAULT_MODE))) {
>  		for_each_tile(tile, xe, id) {
>  			if (!vm->pt_root[id])
>  				continue;
> @@ -1931,10 +1932,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, voi=
d
> *data,
>  	if (XE_IOCTL_ERR(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
>  		return -EINVAL;
>=20
> -	if (XE_IOCTL_ERR(xe, args->flags &
> DRM_XE_VM_CREATE_SCRATCH_PAGE &&
> -			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_ERR(xe, args->flags &
> DRM_XE_VM_CREATE_COMPUTE_MODE &&
>  			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
>  		return -EINVAL;
> @@ -2603,6 +2600,44 @@ static int prep_replacement_vma(struct xe_vm *vm,
> struct xe_vma *vma)
>  	return 0;
>  }
>=20
> +int xe_bind_scratch_vma(struct xe_vm *vm, u64 addr, u64 size)
> +{
> +	struct xe_vma *vma;
> +
> +	if (!vm->size)
> +		return -ENOMEM;
> +
> +	vma =3D xe_vma_create(vm, NULL, 0, addr, addr + size - 1, false, true, =
0);
> +	if (!vma)
> +		return -ENOMEM;
> +	xe_vm_insert_vma(vm, vma);
> +
> +	/*
> +	 * fault will handle the bind
> +	*/
> +
> +	return 0;
> +}
> +
> +int xe_unbind_scratch_vma(struct xe_vm *vm, u64 addr, u64 range)
> +{
> +	struct xe_vma *vma, lookup;
> +
> +	lookup.start =3D addr;
> +	lookup.end =3D addr + range - 1;
> +
> +	vma =3D xe_vm_find_overlapping_vma(vm, &lookup);
> +	if (!vma)
> +		return -ENXIO;
> +
> +	if (xe_vma_is_null(vma)) {
> +		prep_vma_destroy(vm, vma);
> +		xe_vm_unbind(vm, vma, NULL, NULL, 0, NULL);
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * Find all overlapping VMAs in lookup range and add to a list in the re=
turned
>   * VMA, all of VMAs found will be unbound. Also possibly add 2 new VMAs =
that
> @@ -3220,10 +3255,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
>  		u64 range =3D bind_ops[i].range;
>  		u64 addr =3D bind_ops[i].addr;
>  		u32 op =3D bind_ops[i].op;
> -
> +retry:
>  		err =3D __vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
> -		if (err)
> +		if (err) {
> +			if (!xe_unbind_scratch_vma(vm, addr, range))
> +				goto retry;
>  			goto release_vm_lock;
> +		}
>  	}
>=20
>  	for (i =3D 0; i < args->num_binds; ++i) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 5edb7771629c..74f99b38f60d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -140,6 +140,8 @@ static inline void xe_vm_queue_rebind_worker(struct
> xe_vm *vm)
>  	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
>  }
>=20
> +int xe_bind_scratch_vma(struct xe_vm *vm, u64 addr, u64 size);
> +
>  /*
>   * XE_ONSTACK_TV is used to size the tv_onstack array that is input
>   * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
> --
> 2.25.1

