Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475FFC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 03:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1601310E07A;
	Wed,  6 Dec 2023 03:26:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1125210E07A
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 03:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701833169; x=1733369169;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I4O9ubmIaTRfK/memZJwlsCpQ8AQmqe1R8rYF+eVgyA=;
 b=VNgTI8z9bcH9rwIf7kjL3TJi1nRtbCxM2fF3HfmhUmr/K0hOE54Q4fMT
 w0N3J2QhvvL6Y64OAX+/jYTdoiZtJ4V98jJ5pYbFAkV8ZtMqvCIOl0Jzx
 gmDERVDW+i0uydGcmPf03Q+9MNPLt4yT4HoPCp2x/roSPrB/FesriCrUQ
 vKuSX9YNDz2ikmlGuEKFIqqVmX4Ri0ys9zWayjseqxd8Hh3ERSYhnvtb0
 szwWSVwwX+cGWFWfyqEy3fb9PNy6OwtvJ0v2pinvroYs5/Ce7w1uvM0Gg
 iRDL2mrV+F9tdQajMLvv3AnSkmzzTt4Nq8BI53TJrwiuDdwnE2PliT1gf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1090407"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1090407"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 19:26:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="764561415"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="764561415"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 19:26:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 19:26:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 19:26:07 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 19:26:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GD1BM9Ez3+4k3VhpDC1TweTe8O3r9aBzX9CM2N8kEfG8iDs4/qa26XOlIzhmnrtlLVlxaO5QzPyBMmTi+bUKZ6US1TvZYaZMN7uhpWclm051Rh4a1yDRdMgIWig94qpV3CoCT+e9leyGUSTQN0WuuTdc0GyDkmEHgXzYDbpuAqFsLQxwb3o5ziIJAkN+y1PTZWqwPg9n6G2F2hUCX09NKf9F6gI747fx12NEIBGLN3NV289cBPhV6mWI4W4FEijDOqTzAm+IR13issFs1S8uWqu3606MgRvIHgeTGDUQKKkN4i31/FaA3rk2oAido5HSz35va05MvlwFcZkEwts/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zhlYq16BSC0eL6p6CBLIRZRDM0+rLMN+FcrEx4xI/Y=;
 b=FnvqutGlNUjZ5YfP90jsGDyiItYyNdm+rVzeaGFHzBq5fHYh9qDY7EAnFZrUd87vTS/7+xoJMoqUYdCpb9g90oAX/lNeTD1f57q/cIacBv8NasSsqM6fFzIAbMK5OTNbmXOwkKmcDuuFay1eOB+AQ9wavK2zB89ZQl9RZScBhm6MKxk3tiHO2XGL2XBOZ6SfKaV9yj0eOiiQXPAvXqxjrJminY1noLOH2runp9aDSZTpfNi/Xy04+pHUG56YPtGeZ+irOSn8sOWeTDccCTxtPqmsdy/0YFc+H1TA+cllz5rSnK2N7Ts86e19M0KsAitSbIybpDjVKpCkSdJU658C8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CYXPR11MB8731.namprd11.prod.outlook.com (2603:10b6:930:db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 03:26:05 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915%4]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 03:26:05 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2 1/2] drm/xe/uapi: add exec_queue_id member
 to drm_xe_wait_user_fence structure
Thread-Index: AQHaJ+76fnBwZa02SUmHnnSk6Cwip7CblpFg
Date: Wed, 6 Dec 2023 03:26:05 +0000
Message-ID: <SA1PR11MB69913DF01A96540F8AF5DF8E9284A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20231206024523.29164-1-krishnaiah.bommu@intel.com>
 <20231206024523.29164-2-krishnaiah.bommu@intel.com>
In-Reply-To: <20231206024523.29164-2-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CYXPR11MB8731:EE_
x-ms-office365-filtering-correlation-id: a278a9b7-8df3-4217-34fd-08dbf60b146c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eOn4oZrA0uJNotD/JTu4Y2D9iHK1lax+pnk8ExtVobCrABdUUGL6bzluifTmZlv47cn+wbf/LP3AEGuLS7pu/VHGXr1JsxUFXJ1YxYYrXofd7FPue6Fw1QC5qtd3+NzVrV/3zndu4tQivt07PgAvBuXTkJe33TqS8T/BwS6dYK4tdO6X36u5A9GtPuxaEaiYkuP8IFm5jwNiJMllFpuutNN3ukND8/U0sBD1C3jez1taoZQxkY84wFjHLW+53Yg5tuUfKjiKv7mKj6Cz7jFx5vG+oBkIMZ4dYP8XmdPv0FOgLbbqZmx7AZO2mgQaSZiwqjOYmT/pl0iiy4H/EFn3Ov6dYUbW01vVFnuCYWJtkH28JaZPrMZ/ktPVCTOvtkM3qRgIGMugB4ZqdMhPRM7llygKyTG6mDTfijA934CCEQNievTQa8ckrIp5l/xaad6z7jMXCbILQo1HneF1zwWqGkvTFVhiVNTVsH944iv1HhCuUOYdQ5S+05JgeSnnQJPDVpJLLj1UW9rPsaU69GFVPicFwP9Y0XvbZAM9kedEJpUzER0ia1eCG7meOTvBpmBuCD+tzPWOBabG2ZNdu6nEccFQOsOmI83zYJpoUhk17jTD/p7475vmPAURKZ1VZQBR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(136003)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(54906003)(64756008)(316002)(86362001)(66446008)(8676002)(4326008)(8936002)(52536014)(66476007)(66556008)(478600001)(76116006)(110136005)(66946007)(41300700001)(38070700009)(2906002)(5660300002)(33656002)(122000001)(82960400001)(38100700002)(107886003)(26005)(7696005)(6506007)(71200400001)(9686003)(53546011)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rC57ZJugcnp+AQpfmCdVI5/rQPfRl3eVJQxfZUPs2+5js/n1ucUjXn8HQVYq?=
 =?us-ascii?Q?hLFlKKZPsDQ8kZav6cl6B7tXkYlRccIvI+DIyNHEgpyKIIKILrb7RvasKMGe?=
 =?us-ascii?Q?BA2D474jMNs/Ad3hapiJumQUtvLLULlm1prMXqQrNY7myiCvEbK0NYQ4phjp?=
 =?us-ascii?Q?qmSMnMijLu0OYM6HL/hK2d5XVpHY3dMoI7Kx6CoDAFrS3S23H1B3nvbMc/WB?=
 =?us-ascii?Q?L3AhpNTWe4VjsUHZP6x3yhLXgtDj1bT+nzW42BfQ4zdlvpkPs6rbfmF5AAia?=
 =?us-ascii?Q?Q1o4MeR2+KPSG+fBHdvFQfheBOjEj2FCEbLVUJ8BhysZve32XpqzcaQE0Mbw?=
 =?us-ascii?Q?I4iX1J37Jni4L7ISUf2fOwVfKub23ZjbALqtAM9d2MuRyULu1Ei6qS4fNg0y?=
 =?us-ascii?Q?QS+SO2GoAB95KChTz0UXyzMOcOA/6p4M7wnmcp6IlODM49oQl1d27BmNrLjK?=
 =?us-ascii?Q?7ce3LXLPDsGwpCr3vDXG2NczEhfa9rjBLMFtej/7bWiHyXb1CDCQIrtjTSae?=
 =?us-ascii?Q?tUziap8YyEtJ1FixoBKv6sorK5rz57OrQ6f6yS55hehgvbBqvs7hQM2bRxO0?=
 =?us-ascii?Q?S6EbQkoM8sRHmGbD/YB47K0lnx5+34Cqs95OaNpDmtiJJO3Dmlof1U6JQHWm?=
 =?us-ascii?Q?ji39q/E4rqV/Qy994AtqJsf9FdPQSeR7ythEfPmY9KVIi8hh3lfPh1V53KQz?=
 =?us-ascii?Q?gNJDS9zjOOuBiz2uwejWnDtZjdvH7GsR9+JXhuOcVY+VFg5ufQbKByjP7/NT?=
 =?us-ascii?Q?oaaf7gKax1p6OKekuA8hSRyFMZqxCf73jPFGjDbCsrEMcIsE019UuNK1alsF?=
 =?us-ascii?Q?+FfgsikyvyKOCsSu71fSrtcX0qVTY40WCorvmDP4SUjtY/XcFKLP0PHIc7SX?=
 =?us-ascii?Q?FdKtlzH0LDSuLaQlX4Grrml711bZy3hvt+U0JdwoL+oin23zkT6OxIxgAFYQ?=
 =?us-ascii?Q?yJkG1IIqose1+l9aUAksPjFH399FSZOF0mlD9E4OHDdXApjRqdGDXyLJ4AmU?=
 =?us-ascii?Q?vfLnRfx0vdLei2bZ9KRwowY+vi1ND38fujmO1N3QcrBaTob2IdwQfte+v49s?=
 =?us-ascii?Q?9QtwTfP3ueN7d3Dpzv1qSnVsoZCALuWYhOTkaNjnXD2dwCzHHkiiPBgWDihZ?=
 =?us-ascii?Q?3BS9FcoeYye8CfjAXS6xHZ+qrAZsJTF6HBU0mCopz0ESDiq3L3q1X00c5qVW?=
 =?us-ascii?Q?ic2ntv3UjzeWHOZimIBDZk7gfNrGYqz7gOxid/wcv40DYSya9fOoSrFV0Ohc?=
 =?us-ascii?Q?vc6td5FON93um9zKO8W3NsDG5AH0O6fW+lRn4mCxF9UAND8F+yhl/hMLjDIT?=
 =?us-ascii?Q?RJv3r7SY7uM6qWYf105iCtuHtstE6i6XHew52K1ew5/bI3/NPDLObQsKVql1?=
 =?us-ascii?Q?d3QB43HhmYI83Bc+84m8OToE58bYPEAAIPDiOP9yZbYFjYtUYaavu2FnawZ6?=
 =?us-ascii?Q?H3qF4D6yvlVc9PxfH8XCHETdbi0Zi7wrHoq7oshjyJHcCe6mTS+wYGCK8Bm8?=
 =?us-ascii?Q?TlY10W6XlfH3xi08ZUFmybwFQzjqt/Q+fF1oWChP7cPcVgTGp12yQMD8cLbW?=
 =?us-ascii?Q?ZQfa1BpcstGZuaIRW3s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a278a9b7-8df3-4217-34fd-08dbf60b146c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 03:26:05.0313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oO0oooTpnMlWUBHlRmMvWVLw+xkFQqvvM8BMyQt9E3nrn2Ru1SgGDL8y0G/6sTOAgTDJJbG3sPkkrqrU7jkftw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8731
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/uapi: add exec_queue_id member
 to drm_xe_wait_user_fence structure
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

See one question below. With that addressed, patch is Reviewed-by: Oak Zeng=
 <oak.zeng@intel.com>

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Bomm=
u
> Krishnaiah
> Sent: Tuesday, December 5, 2023 9:45 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Dugast, Francois <francois.dugast@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: [Intel-xe] [PATCH v2 1/2] drm/xe/uapi: add exec_queue_id member =
to
> drm_xe_wait_user_fence structure
>=20
> remove the num_engines/instances members from drm_xe_wait_user_fence
> structure and add a exec_queue_id member
>=20
> Right now this is only checking if the engine list is sane and nothing
> else. In the end every operation with this IOCTL is a soft check.
> So, let's formalize that and only use this IOCTL to wait on the fence.
>=20
> exec_queue_id member will help to user space to get proper error code
> from kernel while in exec_queue reset
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 56 +------------------------
>  include/uapi/drm/xe_drm.h               | 16 ++-----
>  2 files changed, 4 insertions(+), 68 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 4d5c2555ce41..447e4cfd204c 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -58,29 +58,7 @@ static const enum xe_engine_class
> user_to_xe_engine_class[] =3D {
>  	[DRM_XE_ENGINE_CLASS_COMPUTE] =3D XE_ENGINE_CLASS_COMPUTE,
>  };
>=20
> -static int check_hw_engines(struct xe_device *xe,
> -			    struct drm_xe_engine_class_instance *eci,
> -			    int num_engines)
> -{
> -	int i;
> -
> -	for (i =3D 0; i < num_engines; ++i) {
> -		enum xe_engine_class user_class =3D
> -			user_to_xe_engine_class[eci[i].engine_class];
> -
> -		if (eci[i].gt_id >=3D xe->info.tile_count)
> -			return -EINVAL;
> -
> -		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
> -				     user_class, eci[i].engine_instance, true))
> -			return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
> -			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
> +#define VALID_FLAGS	DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
>  #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
>=20
>  static long to_jiffies_timeout(struct xe_device *xe,
> @@ -132,12 +110,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev,
> void *data,
>  	struct xe_device *xe =3D to_xe_device(dev);
>  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
>  	struct drm_xe_wait_user_fence *args =3D data;
> -	struct drm_xe_engine_class_instance
> eci[XE_HW_ENGINE_MAX_INSTANCE];
> -	struct drm_xe_engine_class_instance __user *user_eci =3D
> -		u64_to_user_ptr(args->instances);
>  	u64 addr =3D args->addr;
>  	int err;
> -	bool no_engines =3D args->flags &
> DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
>  	long timeout;
>  	ktime_t start;
>=20
> @@ -151,41 +125,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev=
,
> void *data,
>  	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
>  		return -EINVAL;
>=20
> -	if (XE_IOCTL_DBG(xe, no_engines &&
> -			 (args->num_engines || args->instances)))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, addr & 0x7))
>  		return -EINVAL;
>=20
> -	if (XE_IOCTL_DBG(xe, args->num_engines >
> XE_HW_ENGINE_MAX_INSTANCE))
> -		return -EINVAL;
> -
> -	if (!no_engines) {
> -		err =3D copy_from_user(eci, user_eci,
> -				     sizeof(struct drm_xe_engine_class_instance) *
> -			     args->num_engines);
> -		if (XE_IOCTL_DBG(xe, err))
> -			return -EFAULT;
> -
> -		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
> -						      args->num_engines)))
> -			return -EINVAL;
> -	}
> -
>  	timeout =3D to_jiffies_timeout(xe, args);
>=20
>  	start =3D ktime_get();
>=20
> -	/*
> -	 * FIXME: Very simple implementation at the moment, single wait queue
> -	 * for everything. Could be optimized to have a wait queue for every
> -	 * hardware engine. Open coding as 'do_compare' can sleep which
> doesn't
> -	 * work with the wait_event_* macros.
> -	 */

Above comment suggested a optimization to use per engine based wait queue.=
=20
You deleted this comment, but it is still per device based wait queue.

Personally I think it is okay to use per device base wait queue. So I think=
 it
Is fine to delete this comment though...

Oak


>  	add_wait_queue(&xe->ufence_wq, &w_wait);
>  	for (;;) {
>  		err =3D do_compare(addr, args->value, args->mask, args->op);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index eb03a49c17a1..d922641e11e8 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1030,8 +1030,7 @@ struct drm_xe_wait_user_fence {
>  	/** @op: wait operation (type of comparison) */
>  	__u16 op;
>=20
> -#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on
> VM bind */
> -#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
> +#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 0)
>  	/** @flags: wait flags */
>  	__u16 flags;
>=20
> @@ -1064,17 +1063,8 @@ struct drm_xe_wait_user_fence {
>  	 */
>  	__s64 timeout;
>=20
> -	/**
> -	 * @num_engines: number of engine instances to wait on, must be zero
> -	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> -	 */
> -	__u64 num_engines;
> -
> -	/**
> -	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> -	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
> set
> -	 */
> -	__u64 instances;
> +	/** @exec_queue_id: exec_queue_id returned from
> xe_exec_queue_create_ioctl */
> +	__u32 exec_queue_id;
>=20
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> --
> 2.25.1

