Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE09AC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 16:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B385110E862;
	Fri, 19 Apr 2024 16:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICfYN/oJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0D110E862
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 16:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713542783; x=1745078783;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BkBISLIDoDWC/tYbUC/+PwjonjPYNCxe0TlKhUFY/Wk=;
 b=ICfYN/oJOU15bARh/JFI/9RYBvqOZwJwNxOdVao8DaMBl+nGLyme2srZ
 SSC7B1voI2D3OiVS9J6OfuJ09k2dAgJRuDrhbhI32131Jox9ogCM8vp+g
 k3MZsXwgT2p9VlxoyzO8sCQJQ8DzoS2DIGHYkBUZiY8F8STj8ieR/9LFc
 esQPRtOXZdfte6fl3Hfh5dXIWlrju29QKh9AiENy6uVPoaEvNM6/2b6/5
 fn/Cwe+nuwRHVJVcN8z/AsS//hS1kW+y09PweiPNUa7CnbiSakMbF2mLu
 Biutwiu544RBS3MTW9nb9LTEqQnv9HXPW+/vewnacZlCj2UUeTP6dLpQT Q==;
X-CSE-ConnectionGUID: Ej+R9MZyQo63XJ2kwHChHA==
X-CSE-MsgGUID: K3xncxphTWyUfQQQYIskbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20291606"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="20291606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 09:06:23 -0700
X-CSE-ConnectionGUID: XphlpxkgQXO18oGLTmNILQ==
X-CSE-MsgGUID: 9SvdOL+gRem9KuBtRa/qXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="54573541"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 09:06:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 09:06:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 09:06:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 09:06:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZxHkX9pIdQfa1IgyGuOpKyMfhwlOlhh7eFfcUNowAQdzXC96GYSeimq8xRzF4+xrk5JJpR4SwNmU8UiFLk8BucPR+eO7ieHLhhJ4P4lhWKO/AIG+nDR67vyAoAg6bOCrb5mUF3p59lT4giyVbRLo174GUZmfdphifzSs603iLZMQPdX6/7Qy1/IDWSyBIQAXXYCu1pWaLORMWsnLAxkDa5eChxy6/bKEEBCytThSff/h3UJjueitel4SbB2pAOHwRnPwWS5hDz6FxXa2aaJNf9eHxLdUOIPBeOvvlthPtDitmVRnScWlfWYTqsEB1wQK59DwjBT9wrUFv+JRsq1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osfJLFOFGlAsa9PdVDstzgyO6JUIYHu9H9r93z42NAk=;
 b=eqhoR+5wnpyed8AuyXwTU9sX4tndCDxmXVxNQwvbYwHGBarzI/2lzscIO2QCgU3ufm1IoIS88RrVxeDt1rv27uBYo6G68pEhEVhU3EA3+nhoVg93KanufdWFxcWjsRjvbPVRhoucFWSXSAdxWuDu/XZGOd2YYOGh6inYkY5oNAVYPm+5/DvMDalE5gJSIKvw5oXxe42YRNrsVv8v5GmXTI2U3GiLPR7HjDdkeHLo09wl2HPGD9EiOd2SfIjiuO+tSNQPpGqtKUJqdcOh3KexT3qD7erwxs5/stLH8Zumf4tCry0jRKqTw+XJ+LzZ0GFafyY4rsLvgbkhHYHo41jgkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.14; Fri, 19 Apr
 2024 16:06:14 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 16:06:14 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: RE: [PATCH v3 1/7] drm/xe: Introduce has_atomic_enable_pte_bit device
 info
Thread-Topic: [PATCH v3 1/7] drm/xe: Introduce has_atomic_enable_pte_bit
 device info
Thread-Index: AQHaj0apMsFj/5UUyEOx8BKgOgnFibFvyFbA
Date: Fri, 19 Apr 2024 16:06:14 +0000
Message-ID: <SA1PR11MB6991D01180A3AB6728A45C25920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-2-nirmoy.das@intel.com>
In-Reply-To: <20240415145214.25641-2-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DM6PR11MB4660:EE_
x-ms-office365-filtering-correlation-id: e03ca76b-c57d-4ed7-3140-08dc608aa3a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: ry5M2ewfbRPIBpaHFOLeytNYKbqL7xhgFiL9cFpMzPygNmjLeQPPJTLc1GknDlIeVrZU13Gl3NGeQiJ98s6Wx6Eusyj0JiXt+un8X53EDFIttpYUtf0ledndQ/WUbUlSIOy08t2xEVzOj2F/I6czyPTRZV7F8w2Sf3GF8Wk1QEVhCXEd+TY+aCsWlmRopQUg6MYfU0wzqsIRs8egIAZcgE4V7puZKM09XpNpBn2CrfvdcoFS0F7QeolN4mL93dDOp+egstS+T72OGSE8wcPiFubVnmqR5F4lsj5jHH7RR4phTkxDvcwRTEnpMa9VT08jR1FSAMl2DYqCo8CIoAXpgac1Geqz1cpPvEPjSYSLI/yfTTsGsW2j1rrmyTxo0MgtYDBEBM+q/eSL4UGg1t49kru4Hk7EtNK4NqIAQlSgQbNmXOY5GtAceEA1U8+GKAAUAZI2CURXxzmZuvQ5u5SxhL1Ol1PuO0UaBIHZzCrl/dpIzBau3UBkJ5lNGjbJAVCk0tEN9GmFeI2E3Rz+3mOfECAeldhwQGyARDTd6isgh7XnYFxX9hLR+vJ+Xlkx+/I7R6EcbK8qITB5siO8CsUHVyzLHoBOsXKDd9L2r9giufj+in9qQ+bBNOlF1PDQjmiwpm7yiFyvncdNNlpzThpg3ArAO9SvocgEpPbNNIUdKS8XKx4FHWxn5AIV2KNPInYBD62YCQGp/dLQyxdrsL4Kgi5UAbSv6gFcpVMg8OE8yrs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0AGpkrVEA5sBPDhylxE4CCUNS/bqAFFPSZ4tMRxFd5zqirmT84UecsojK5dI?=
 =?us-ascii?Q?SVwkid7Ly2Ky+YX+k114ybluRw5deNxrNWasy4SMdL/e/Hwo246OPaayq168?=
 =?us-ascii?Q?gYX0UNitVg7/hkEfY1zDIxTb8PqSwJyAby6RHzluXWqxujHxtlz5Hbaxjznt?=
 =?us-ascii?Q?H0Doxk1hY5LqKCJmfd7gAJTrsVgDGDD8w7r2yy+kKBlazX54xpH0pZ2d8Nr7?=
 =?us-ascii?Q?xvP9EJUuFVmFSa7p0IDr3wWWOC4Z0eR5+Nb/vlzvxIFIcharpdltIn9JgJMI?=
 =?us-ascii?Q?sldFGhTOy310jlTYNq8tWo3OlEtKw5HCH3/KePhSqK8FAe+XPBHYrAItC/d1?=
 =?us-ascii?Q?B4/vxy3OkdEliaW2JJomsMWnUi6rlhNKJp1SWnUC5sdEBHJUtcM9aOtidozX?=
 =?us-ascii?Q?Gam+v0bNBTXz3Jl62yKOr25CQ6Rwg9gxt6OFs+GLa0AXsDDoiWUaSwu294g0?=
 =?us-ascii?Q?AH6yKoX2zbBo87Kz+k+0mURf57SQjqPSoUFCq7JjPKu6gB/wvWiu7aie55bC?=
 =?us-ascii?Q?8d8coJiHTaqU9wc02r8rmf8uIorvBzA8OTjKnZ502nFapdKsbWASfUzvuffX?=
 =?us-ascii?Q?AOfkeYu5AXo8TdRfdc5va9YvOwqxN1naE1Xa/8zjUpQgf2T6VSf1eXvm1JZo?=
 =?us-ascii?Q?XP57zmVBMGy4x0V9Dd8N/hUTa+KVpzhkDNCr0d54rxlhcQw2rGKqv8EGy0Tr?=
 =?us-ascii?Q?lu6Wey/ZkXMhSX7bk9d8iQOsV1qhHPaiIZ8JYSRbaLz1SNQN32ikLATyQvvm?=
 =?us-ascii?Q?YCqPa0ROOo0WmWeIYtVoRxyDr0TLMXrr39CihZjS1vBNahpYFGLVqD4IQmZk?=
 =?us-ascii?Q?y2Kx1hQUoJNu76Bn31IctgR/5TJPm8E0XXMNO5HA5+YchGi4XJUO/VOTkCaW?=
 =?us-ascii?Q?IpH12su3XBmxp43IjA39JEQ1xSTL6bll0CBRXyUEKHqQVgTIoks58dH9Qi6N?=
 =?us-ascii?Q?FbSdDBZLEHaRPivjE0wY2656pJT/iUdo+zE1t+wsGS7ALSut0pL+M9/4UvM0?=
 =?us-ascii?Q?4YXzDEJhArCa25CF2dlnTvhI+xnVAKdlsJ2A5Jv6SBN3h8oVbhOvL3YT2OLV?=
 =?us-ascii?Q?DgybLlvgI4qTenXFo/WVSp4eshD3zQtIkx9Sc1FhM8Y9+iz7g/XlMD55ihSj?=
 =?us-ascii?Q?LIexF5eOp12LtCxzWQJr53ISEGoP3c5C/qJ+Ag8OQGocBq0QmPbjUR9OaLac?=
 =?us-ascii?Q?tV6plko0IU1g1fg7ja49vrdWGf24ayTbPtuccTB9hqljU7lgfaRXItB/gJKZ?=
 =?us-ascii?Q?7pw95/+qQFuDNoABg4un4HxG0/f0mqmWHqxaRZC8mfkSY9ujkYvvMGM+SNzV?=
 =?us-ascii?Q?zqpaFXkDgF3OvxpM+cD0ng+Iw5vI26IqDHDpS2H8gPKz5GqzF+dHUKtIJZEV?=
 =?us-ascii?Q?eGP6BDKesbYBywgUWl7zmIiGu7MJJzyeaT0GaclLRmIWK3ih8TbmAqjWDRaf?=
 =?us-ascii?Q?LT34ryaOdyWjnrquLTiKy/50yoC9kvgDfojo8/86IPEnwhKoX2wE573V1Uc/?=
 =?us-ascii?Q?gxmy0cWvh3yize8h390uiUztSxAded5/2PSOuBZ9Vc8IpGbABKKXNaCGVrh+?=
 =?us-ascii?Q?/Jh2Nrci7RpdiOhgipKtOFKo/7mrTfpHrNKvAe/4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03ca76b-c57d-4ed7-3140-08dc608aa3a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 16:06:14.6609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yM3DnhsYZB0vNFDV182Mqa0s2dH2ivR6x1VlAWYPFs8X/W/KCrhaUSjlqfwm6APlMmY61W8UYMr+9QPpmb3kOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
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

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Nirmoy Das
> Sent: Monday, April 15, 2024 10:52 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>
> Subject: [PATCH v3 1/7] drm/xe: Introduce has_atomic_enable_pte_bit
> device info
>=20
> Add has_atomic_enable_pte_bit to specify that a device
> has PTE_AE bit in its PTE feild. Currently XE2 and PVC
> supports this so set this for those two.
>=20
> This will help consolidate setting atomic access bit in PTE
> logic which is spread between multiple files.
>=20
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 3 +++
>  drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
>  3 files changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 60ced5f90c2b..bde42fe288ff 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -281,6 +281,8 @@ struct xe_device {
>  		u8 has_heci_gscfi:1;
>  		/** @info.skip_guc_pc: Skip GuC based PM feature init */
>  		u8 skip_guc_pc:1;
> +		/** @info.has_atomic_enable_pte_bit: Device has atomic
> enable PTE bit */
> +		u8 has_atomic_enable_pte_bit:1;
>=20
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		struct {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3b30353dbc09..9cf45559b915 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -146,6 +146,7 @@ static const struct xe_graphics_desc graphics_xehpc =
=3D
> {
>  	.vram_flags =3D XE_VRAM_FLAGS_NEED64K,
>=20
>  	.has_asid =3D 1,
> +	.has_atomic_enable_pte_bit =3D 1,
>  	.has_flat_ccs =3D 0,
>  	.has_usm =3D 1,
>  };
> @@ -163,6 +164,7 @@ static const struct xe_graphics_desc graphics_xelpg =
=3D
> {
>  #define XE2_GFX_FEATURES \
>  	.dma_mask_size =3D 46, \
>  	.has_asid =3D 1, \
> +	.has_atomic_enable_pte_bit =3D 1, \
>  	.has_flat_ccs =3D 1, \
>  	.has_range_tlb_invalidation =3D 1, \
>  	.has_usm =3D 1, \
> @@ -627,6 +629,7 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.va_bits =3D graphics_desc->va_bits;
>  	xe->info.vm_max_level =3D graphics_desc->vm_max_level;
>  	xe->info.has_asid =3D graphics_desc->has_asid;
> +	xe->info.has_atomic_enable_pte_bit =3D graphics_desc-
> >has_atomic_enable_pte_bit;
>  	xe->info.has_flat_ccs =3D graphics_desc->has_flat_ccs;
>  	xe->info.has_range_tlb_invalidation =3D graphics_desc-
> >has_range_tlb_invalidation;
>  	xe->info.has_usm =3D graphics_desc->has_usm;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
> b/drivers/gpu/drm/xe/xe_pci_types.h
> index b1ad12fa22d6..e1f2b4879fc2 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -25,6 +25,7 @@ struct xe_graphics_desc {
>  	u8 max_remote_tiles:2;
>=20
>  	u8 has_asid:1;
> +	u8 has_atomic_enable_pte_bit:1;
>  	u8 has_flat_ccs:1;
>  	u8 has_range_tlb_invalidation:1;
>  	u8 has_usm:1;
> --
> 2.42.0

