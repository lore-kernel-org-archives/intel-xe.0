Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07011C04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 21:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967F810E2D4;
	Fri, 19 Apr 2024 21:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lIzIiTA/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF4210E2D4
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 21:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713560683; x=1745096683;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZflR4K/KWSbOlmnHT3AZMLM1XHcCkanvOSJujLMHLM8=;
 b=lIzIiTA/ScfkVnK0gvJO1QQNMePeCY10YHBqSiaNxJwcyWmLNSGEjAxm
 s1fkYEmWcPrVoWXN3owE2WkQ00MQp9aR8jfuz/l1rj7DJyPkDlJO7Pb9R
 hgdsZpHYo+xtGiajvE+Wnvv5im9b2Avg2pHSjJaefPvywiReDkr/5i149
 hrQxHCWAHNNGFdu0yOnMIpXMQYAAmJa1UNoFTSjnwi5KR+dDMgJbm2ksH
 VM58QVU1AIpNCZGOVn1HwnOH2SZI+OElLGGBnG8O8OlAcPk3WYzx+VJ8I
 1CPgxR5Q3FxAFt2E86PugOlorlhLRkyeVJkH+JWMeBmrE3SgGrjKOwl0N w==;
X-CSE-ConnectionGUID: WrM9hLsFS92jvh9gEJjacA==
X-CSE-MsgGUID: REo2z53fT8mczVTNO8Mv5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12974225"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="12974225"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 14:04:42 -0700
X-CSE-ConnectionGUID: 3NZtJsUCRiGR/19JqeJoCg==
X-CSE-MsgGUID: OaEFaODoR2+L+O0lfUoX6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="27899877"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 14:04:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 14:04:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 14:04:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 14:04:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 14:04:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Er9fgAExsB51TRJGe/FCKdUViJrBBlYH+4E4YnMron3ONwfP00pfZExeFMZqjMRzHQsvJt44xefCzC0VG60f1H2/SlM5AjE5yvRpXp38K6UBe/dbBsqaJsTqbxRZjKi6gthY50AAKxWv6/xsAdfB3pdwuU+t0QPJb93B6G4QDbkc4P9rYaP4F89lIjg2w42XAiVIdFDO0mDB0Ln1ma9sF3J9C01HN5OUHKOODZZnxh/ZN8UmcYeiROSm8foBYIBYMoK74YMqrM6+tj1d+Imuv/uRy23jyS4Mf9m2Z7ob6d/J4t0iSgFgxmjAfUSCNxAKldbXoPj+x1Lgfydn2Pqo4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRjmZEj4PdUebjf64U2r3gPDCip/TPhPRjcunDWGcR4=;
 b=iEys+C/RXb7G4EziFWRmii5TEXUNAIQT4chdDtYF5ATe1ASItoK+Zg66IEDSHvciWPeYyfvBvHg3qB3If6d0mRZUc3Xh/yfRYdb9BQ541cNqPQtF2R8oyWMMcuwSxXvCv5f8L53kiuTbHOCsDWGnKq/+wflQUv0KgmVuaZxR4RnPqS4CAynRMWsEF5CUlEA9mfZnfMiljGgn2wO1rqt8ZRWA+QvSXs8htH30ZvXkfV7KUzXJ9bNsx5IqybmJtg10nI4GPnS1bp5dY70zjxn8WnLE7sCh8D/3N5i5zBTrOggeZR00fkVioTVv7eUsNHlshEwNmQod9eZfVYIFJP7Sgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DM6PR11MB4643.namprd11.prod.outlook.com (2603:10b6:5:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Fri, 19 Apr
 2024 21:04:38 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 21:04:38 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: RE: [PATCH v3 6/7] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
Thread-Topic: [PATCH v3 6/7] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
Thread-Index: AQHaj0ausEHlOh0J/UCRYYvOuiJpR7FwEWyQ
Date: Fri, 19 Apr 2024 21:04:38 +0000
Message-ID: <SA1PR11MB69914921FA73C83445D0898C920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-7-nirmoy.das@intel.com>
In-Reply-To: <20240415145214.25641-7-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DM6PR11MB4643:EE_
x-ms-office365-filtering-correlation-id: 886a1b61-ffe4-4c48-5f4c-08dc60b45321
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: OOkSvJrh/Fhozj3EAzhB2kbjGy+s+AnInrnqRmpi22QrlWsFdVS64wG0xn5ypm2nKUk2NUBKAMBBhCT4jUFBM/4iZyhNQznC7dslCSx6vtt2Y+BAyOG8wWeUaqm+0CwhR9vtOL/0s2oyRzPcGigp3BGV1FNjDj/q40yn9Rwj0Oqlm2auiG8DnHBi7Y9S7LBY8Qx/xKHoVZ4OAuzQ4SWEYc5TRwH21vYdFessmtcI8uov/I9lamsdZ5ZvJvclZE0T4zCRbO6zQozNu/Ro/PK8bUZW9r8H0l1EO6QeKGHceqtZHENO6K2UnXi03q1nEa8wX66RyhhDYZqcXo/vx5CMqlahwqb/uCg3Soafu6aZyYq9O3wZx27L9svIBh1ogjY2ImknCEKIZ5ZWKZQbxpJ0uV81g76NbR+k8fTZDEes9yflXTTcJ6qmczonNSOkW2XAgC/QUd/YsGYtpX/TKEvxZ4BnF4h/4JVuDNU0zLcu4sGJGQ/3J9Np6ZSgfKhlBLMVuaVJfTUaHnhEbHb0fjFvfZjMws4zicQsRSjPtEnmn/Ka6xpLZEJ/qPFGSvPILThkBjdB2IwX+VBfiIFeAJG9QuDD7qstGCqtv+rvTCqt3AWDNif4Qi9ax54deV6L1Nccwc6gA9Isc5FkxBQFf++M01DbIYVEThsAyt23NO/Sces0LoROLlAMtWexSiuDuPgwBLYuSFBZFbEa0krB71ulZUwzcQ0d0/yCc+HTgdygX60=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uEFkekSjf1F2qhoqw+AO1OZHh9zBw71JAHHUESAp1FUd/vC/1MJkC6b6kbkq?=
 =?us-ascii?Q?yenn6sJKXFx7RJux0dcuklIc/hHCVNtEgDQ07qXm2GgfnyYBtaWAUhroK/GP?=
 =?us-ascii?Q?1QG96rUSKjy2bu+tm6bgrq+d6NmIc1/zbYY2zT9Wz2pMDhpmpha+8Z+k+HM+?=
 =?us-ascii?Q?C28riHo8ZVT6ZR0RqtHhc/Leizoja7Ub+dYbSRiauUh32iN78Vd8i3lDzorn?=
 =?us-ascii?Q?ekXS8omI6HUQl6p6wHHhNvKfOSW++6kNfyLIq3X4fg2QOCddj4DyU0F+rwUD?=
 =?us-ascii?Q?DCpSppxuTHNkRNiRIkoPJ/hzx1h4C3IHF7dYhf4GSw2IQ0gJ64YrVJbJxEXb?=
 =?us-ascii?Q?UTrzOGSU6y7fZPocw/rxdMBeMTTLGGAUi54kt5SIuKpJm6RnNuX3wB1rkV4M?=
 =?us-ascii?Q?RcOjXGVsd/SY/5M5iflf4Gx//HiHCtJrkwuxjJgxd5znNSC/aYM2P5ocAhDV?=
 =?us-ascii?Q?oJI/ROltuzm14AItnpFe+Gkplsb6Euzo6RHs0Bm4/Ip6G/tllSo1dWlMWlI9?=
 =?us-ascii?Q?A8OcBv9H+XdthjQu2oTzsLWKzAIMroACwqrL3nP/jXrLQZDSjCJcTh+qXkLI?=
 =?us-ascii?Q?uwgMXBpREBUG7IY9J8sNc0KaLGgGheCOY0D9oXzbDH8ZJt9qnQUWdqAEDJNQ?=
 =?us-ascii?Q?M/giaaAxP1qR7P6CPNYc0tUY4FhTyaknRgN2VlBPPZsn7fsxJLjQ9LmO6Y/h?=
 =?us-ascii?Q?osBZuAFgW0cYOjAMmXdygqbQzv95C5SVVrTrjkZjR0ExWhD0lrm4B4kcsyo7?=
 =?us-ascii?Q?ltqVt/fjc2f2XLvBvFRpJ81HXRkp8LoyLT1AJEyBSn9AgrzjR6MzJRCeLl9L?=
 =?us-ascii?Q?4UUHK2pMyv0UxQr3buaIbr0PLngHsQ7UJjUwmiRnu/V54EIs8PbbM26Ay2es?=
 =?us-ascii?Q?l/2ly3Vdw6UOlrwYr4UwsQ13dxb28HnZDe2PQPl03i8maqNPpiTqBN2BSK7o?=
 =?us-ascii?Q?uyuqOphtY228ziCIJPyJmOlCiE2trou6AuNaPaG7euX8HozHD/aMBwVqrYd8?=
 =?us-ascii?Q?MlpwhD/uBDCzKV7ES3OwDbiWmX0kGKTICP9INIirJYhRnJACzHQ7bFqtJ3/G?=
 =?us-ascii?Q?8z39jUx8p+oHLHwdLQd2S3CTLO1qmi339PWPvMIfQABjtkmeQkx6X9GlyLzv?=
 =?us-ascii?Q?oAGfo5/9go9CarAJ5hEz2dE4hT5j5aJINgsflJTwqaZryesXui1COCH2B+GY?=
 =?us-ascii?Q?lFfbXLo5MJ1uEx9qoK9YJ1yArl9m6Y2UecLsVOALxp5FA3wduEso9pgJZBXn?=
 =?us-ascii?Q?GfSKZYkQC37Q+wDZRdNEnzFVeI0hdhunmURPU9rM/mn8eKd8wwbPsRYf0/JE?=
 =?us-ascii?Q?iEbvCLjXvu5oOfj6ClZNYXqNKcOeU3cYvvMnHlREAsxPvTfJ+iGvoW22sSwT?=
 =?us-ascii?Q?28i6t5U3jPaIg3+UF142cp6Nc83QXi2Dieomylg9N7kRfL8/Jd4MXOgod0zf?=
 =?us-ascii?Q?rryjce8Y8he1OD8nEdjpHlZBS20s+P9dGwIy6PQtC82KNqgM+mOpsACjS+PL?=
 =?us-ascii?Q?zYcVT5L3hd6JdtqR3RYh/kQTJDnCOceC0wEvMXK5fjXftMke1o8vkYh0+IdJ?=
 =?us-ascii?Q?ZFghvgA6aTLHeK42b8exNDOqJwtnbm5L+/4gr9+n?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886a1b61-ffe4-4c48-5f4c-08dc60b45321
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 21:04:38.4755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i2wfsJEtZGFlNJCgg5NoXK4g56DRpLj8e98S+A6VFsin+5gTr4Ex4nPEV9ZVgWZuJRQzPngFiVuuDGAcsg4gww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4643
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Nirmoy Das
> Sent: Monday, April 15, 2024 10:52 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>
> Subject: [PATCH v3 6/7] drm/xe/uapi: Introduce VMA bind flag for device
> atomics
>=20
> Adds a new VMA bind flag to enable device atomics on SMEM only buffers.

I think we can drop " on SMEM only buffers". We are introducing a vm bind f=
lag and its behavior should be defined for all the allocations: device allo=
cation, host allocation, shared allocation (and the future system allocator=
)


>=20
> Given that simultaneous usage of device atomics and CPU atomics on
> the same SMEM buffer is not guaranteed to function without migration,
> and UMD expects no migration for SMEM-only buffer objects, so this provid=
e
> a way to set device atomics when UMD is certain to use the buffer only
> for device atomics.


I think it a little differently. We are providing a device_atomic flag. We =
should validate whether this vma support device_atomic or not, based on the=
 allocation type (device, host or shared or system allocator) on specific H=
W platform. If vma doesn't support device atomic, we should report error to=
 user.

Regarding whether we should set the AE bit in pte, I think we can set it re=
gardless the user setting. As long as this vma *can* support device atomic =
on this platform, we can set the AE bit, regardless whether user set the DE=
VICE_ATOMIC flag or not.

Now regarding the SMEM-only buffer (aka host only allocation), on XE2 platf=
orm, we can perform device atomic, so it is safe to set AE bit regardless u=
ser setting DEVICE_ATOMIC flag or not. On platform before XE2, the set of D=
EVICE_ATOMIC on SMEM-only VMA should fail.

In the future, we might also introduce a SYSTEM_ATOMIC flag which should no=
t affect AE bit setting also, but can affect migration behavior. If platfor=
m doesn't support system atomic on smem-only buffer, the setting should ret=
urn error to user.=20

So I think the AE bit can be set as long as allocation type (device, host o=
r share) allow device atomic operation on this platform. Not affected by us=
er vm bind flag (or madvise api).
>=20
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 28 ++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>  include/uapi/drm/xe_drm.h        | 17 +++++++++++++----
>  3 files changed, 39 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8380f1d23074..b0907a7bb88b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -753,6 +753,7 @@ static void xe_vma_free(struct xe_vma *vma)
>  #define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
>  #define VMA_CREATE_FLAG_IS_NULL		BIT(1)
>  #define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
> +#define VMA_CREATE_FLAG_DEVICE_ATOMICS	BIT(3)
>=20
>  static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				    struct xe_bo *bo,
> @@ -766,6 +767,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
>  	bool read_only =3D (flags & VMA_CREATE_FLAG_READ_ONLY);
>  	bool is_null =3D (flags & VMA_CREATE_FLAG_IS_NULL);
>  	bool dumpable =3D (flags & VMA_CREATE_FLAG_DUMPABLE);
> +	bool enable_atomics =3D (flags &
> VMA_CREATE_FLAG_DEVICE_ATOMICS);
>=20
>  	xe_assert(vm->xe, start < end);
>  	xe_assert(vm->xe, end < vm->size);
> @@ -814,7 +816,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
>  		xe_bo_assert_held(bo);
>=20
>  		if (vm->xe->info.has_atomic_enable_pte_bit &&
> -		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe)))
> +		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe) ||
> enable_atomics))

As explained above, I don't think AE should be affected by DEVICE_ATOMIC fl=
ag. It is safe to set AE as long as this bo support device atomic on this h=
w platform, regardless user setting.


>  			vma->gpuva.flags |=3D XE_VMA_ATOMIC_PTE_BIT;
>=20
>  		vm_bo =3D drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo-
> >ttm.base);
> @@ -2116,6 +2118,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
> struct xe_bo *bo,
>  		if (__op->op =3D=3D DRM_GPUVA_OP_MAP) {
>  			op->map.is_null =3D flags &
> DRM_XE_VM_BIND_FLAG_NULL;
>  			op->map.dumpable =3D flags &
> DRM_XE_VM_BIND_FLAG_DUMPABLE;
> +			op->map.enable_device_atomics =3D flags &
> DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
>  			op->map.pat_index =3D pat_index;
>  		} else if (__op->op =3D=3D DRM_GPUVA_OP_PREFETCH) {
>  			op->prefetch.region =3D prefetch_region;
> @@ -2312,6 +2315,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
>  				VMA_CREATE_FLAG_IS_NULL : 0;
>  			flags |=3D op->map.dumpable ?
>  				VMA_CREATE_FLAG_DUMPABLE : 0;
> +			flags |=3D op->map.enable_device_atomics ?
> +				VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>=20
>  			vma =3D new_vma(vm, &op->base.map, op-
> >map.pat_index,
>  				      flags);
> @@ -2339,6 +2344,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
>  				flags |=3D op->base.remap.unmap->va->flags
> &
>  					XE_VMA_DUMPABLE ?
>  					VMA_CREATE_FLAG_DUMPABLE : 0;
> +				flags |=3D op->base.remap.unmap->va->flags ?
> +
> 	VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>=20
>  				vma =3D new_vma(vm, op->base.remap.prev,
>  					      old->pat_index, flags);
> @@ -2376,6 +2383,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
>  				flags |=3D op->base.remap.unmap->va->flags
> &
>  					XE_VMA_DUMPABLE ?
>  					VMA_CREATE_FLAG_DUMPABLE : 0;
> +				flags |=3D op->base.remap.unmap->va->flags ?
> +
> 	VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>=20
>  				vma =3D new_vma(vm, op->base.remap.next,
>  					      old->pat_index, flags);
> @@ -2731,7 +2740,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm
> *vm,
>  	(DRM_XE_VM_BIND_FLAG_READONLY | \
>  	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>  	 DRM_XE_VM_BIND_FLAG_NULL | \
> -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
> +	 DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
>  #define XE_64K_PAGE_MASK 0xffffull
>  #define ALL_DRM_XE_SYNCS_FLAGS
> (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>=20
> @@ -2874,7 +2884,7 @@ static int vm_bind_ioctl_signal_fences(struct
> xe_vm *vm,
>=20
>  static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_=
bo
> *bo,
>  					u64 addr, u64 range, u64 obj_offset,
> -					u16 pat_index)
> +					u16 pat_index, u32 flags)
>  {
>  	u16 coh_mode;
>=20
> @@ -2909,6 +2919,15 @@ static int xe_vm_bind_ioctl_validate_bo(struct
> xe_device *xe, struct xe_bo *bo,
>  		return  -EINVAL;
>  	}
>=20
> +	if (XE_IOCTL_DBG(xe, (flags &
> DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
> +			 (!xe->info.has_device_atomics_on_smem &&
> +			  !xe_bo_is_vram(bo))))
> +		return -EINVAL;

Above check is good for host allocation.

For shared allocation, if bo's current placement is in SMEM, we can't retur=
n error, see below


> +
> +	if (XE_IOCTL_DBG(xe, (flags &
> DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
> +			 !xe_bo_has_single_placement(bo)))
> +		return -EINVAL;

A shared allocation can have DEVICE_ATOMIC flag perfectly. This is not an e=
rror. Performing device atomic on shared allocation also have real use case=
: just imagine multiple workgroups/thread on device, or on multiple devices=
 perform device atomic to the buffer, so they can be synchronized.=20

For all shared allocation, since the final backing store can be optionally =
in device memory, so we have to allow user to set the DEVICE_ATOMIC to any =
shared allocation. Driver can migrate shared allocation to device memory if=
 needed for such case.


> +
>  	return 0;
>  }
>=20
> @@ -3007,7 +3026,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
>  		bos[i] =3D gem_to_xe_bo(gem_obj);
>=20
>  		err =3D xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
> -						   obj_offset, pat_index);
> +						   obj_offset, pat_index,
> +						   bind_ops[i].flags);
>  		if (err)
>  			goto put_obj;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index badf3945083d..5a20bd80c456 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -276,6 +276,8 @@ struct xe_vm {
>  struct xe_vma_op_map {
>  	/** @vma: VMA to map */
>  	struct xe_vma *vma;
> +	/** @enable_device_atomics: Whether the VMA will allow device
> atomics */
> +	bool enable_device_atomics;
>  	/** @is_null: is NULL binding */
>  	bool is_null;
>  	/** @dumpable: whether BO is dumped on GPU hang */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 1446c3bae515..ca4447e10ac9 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -883,6 +883,14 @@ struct drm_xe_vm_destroy {
>   *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>   *    handle MBZ, and the BO offset MBZ. This flag is intended to
>   *    implement VK sparse bindings.
> + *  - %DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS - When this flag is set
> for
> + *    a VA range, all the corresponding PTEs will have atomic access bit
> + *    set. This will allow device atomics operation for that VA range.
> + *    This flag only works for single placement buffer objects

As explained, we are introducing an API which should be general enough. It =
should target for shared allocation (multiple placement) buffer object


 and
> + *    mainly for SMEM only buffer objects where CPU atomics can be
> perform
> + *    by an application and so KMD can not set device atomics on such bu=
ffers
> + *    by default.=20


As long as this platform support device atomic to smem, it is safe for kmd =
to set AE.

The not allowed case is: if smem doesn't support system atomic but user wan=
t to set a SYSTEM_ATOMIC (not introduced yet) flag, we should return error =
to user.


Oak


This flag has no effect on LMEM only placed buffers as
> atomic
> + *    access bit is always set for LMEM backed PTEs.
>   */
>  struct drm_xe_vm_bind_op {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -969,10 +977,11 @@ struct drm_xe_vm_bind_op {
>  	/** @op: Bind operation to perform */
>  	__u32 op;
>=20
> -#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> -#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> -#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_READONLY		(1 << 0)
> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE		(1 << 1)
> +#define DRM_XE_VM_BIND_FLAG_NULL		(1 << 2)
> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE		(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS	(1 << 4)
>  	/** @flags: Bind flags */
>  	__u32 flags;
>=20
> --
> 2.42.0

