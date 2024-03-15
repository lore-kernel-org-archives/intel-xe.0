Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59892C54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 04:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E8F10EE23;
	Fri, 15 Mar 2024 04:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LW8JkeEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A59A10EE23
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 04:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710477127; x=1742013127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nz4yRubh46zbO/J0f8hI93jiwTnpe/f+KWM0AOfucY4=;
 b=LW8JkeEF4gBMnxsBH0Ei/lVjnUdsTQglrVeBFDY3PVpjOd6rwTGMdLOi
 GSakosUgXkQZp+uyUHBARWjemD5LEHr7ZGtWbon0IcXGWgrYYYaHmnIGm
 elDGMuCAk4yPlG1iXCihiRqR+GZpUHSiD9E33Hkp8RxN8fQZIK9Uo5klk
 DjylBdJIHec+hQs+nJ/KJ7VA4lXDCWz7DZfCN4pnsydyI6wSWULL0K3EP
 hcQZbCkE+aPqe1201LzNihF+AXQjh2LyaSc4dLT0zb5gBoOYe/op9wuzc
 7IVTQHDA+bxQLH9Z9Iof1ZJxoEuWkZjTwcFnoWvUZIeuqndAyCRNgB3X1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5180195"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5180195"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 21:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="17131139"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 21:32:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 21:32:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 21:32:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 21:32:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHcv2S/ccn4ElakeE4TwulJFEKHdrSu3KpRGVxcZCMKHjeez26oZRlwDB+4HDZw/9DwpZfbEVLmwk8lpve86DU9aYfiY8BQQ2dCCBChZygIhGPrGBkcCcOvXQXhn2Lzl64LOA/gqV/rzy+B6vy+iZeVRnykLQRnXJjbLAWNkY5MzuImY5AYlPyijcP4BTiegKGm3WWcePugEYV8dI+LqQ9o8DRrHVAlmj+PxRRQP8WfIYoaQL6K2POtrPJHPYOLxEGvWAUjVxdD0ZHgEUmSE4RenWC7ddrVuLDB4l48lQN0zYvpKFSvstkk1VbOo5Mbc4/SYs8ql8ZkfqDTrz1V0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEI53+Ezfh12tJRgntYB6PZzI+qbbzAy35mPOqGVF74=;
 b=jeSIegfbPq8Gpljv6JIrAU7iSZUnJWPOWnaA2RtlUrF3ucsBmal0pKah0njbO54+nkO19FLQFHf72aCSb5Ik2+nZ4V3+7K86suvxvO1UIasSEw+V5Rep/88i3hba7unBZtvUK3POcPPY0+ZOQSOnWDxiXsi2gMoDmjpzqgkJbHk+N6HWHKNFzRmUhpLqi9Iaq+oA6Ot/gJCz1xfclb+LZEDrCU4TAvChbDlafz8uplhyHNcUceuYsiBelg4XGxgPJQNyDdsBCNgTkwZ01CplzjZtsOZp2iISd1neXVzPI7c0WFDWgISAkjBVX4Jzbo49FLCiLfwkdmlyTrOWph716w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by BY1PR11MB8007.namprd11.prod.outlook.com (2603:10b6:a03:525::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Fri, 15 Mar
 2024 04:31:54 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 04:31:54 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>, "Somaiya, Himanshu"
 <himanshu.somaiya@intel.com>
Subject: RE: [PATCH 3/3] drm/xe: Force busted state and block GT reset upon
 any GPU hang
Thread-Topic: [PATCH 3/3] drm/xe: Force busted state and block GT reset upon
 any GPU hang
Thread-Index: AQHadnSryIcy6RoE10msazniOwhy6LE4NT9w
Date: Fri, 15 Mar 2024 04:31:54 +0000
Message-ID: <MW4PR11MB7056DA60DFEDC7ECDCEA2D0FB3282@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
 <20240315010317.193756-3-rodrigo.vivi@intel.com>
In-Reply-To: <20240315010317.193756-3-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|BY1PR11MB8007:EE_
x-ms-office365-filtering-correlation-id: b5b347cf-5d97-4f99-9608-08dc44a8d7a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tz8LYOBbd/8RSO8AO9t7kZ1namw1OHlAgXdUj4IuBo9Xeq87DxGWIhfrYrG/gpO25nIymGv1SJugKpkbZlLow9fll4IvBrfMa5LHJm/y3jGSQFl9WYW1YHzWlhwI5NxsNVSep3EKCv3C+z2ilxaJkvzJHRPIX5Sn/pMghT5ivB13w5pQj1RFkDlYzm9H0fpVwburJecM6lEW3n4aSbvYjNQOEYqtto9D7492G3k+IiIaeuCDhYMcsC8NFKg39aNGSDk8VkURq1TNUr1K+9kc/fO9aTIde4TyWHdsY4DE3CH0SQZJOShswu22+hEpjYTP5PvmYiGwFH5nntsmM00tRZenA5T75+omKQrTC1G3SSGd87nE8oqA7E/epTlhgahfdlMD8hmB/ucdxnq8SrYeMmuTuYIqrLOvBlsBRplGT+iZ8M717NIkMLdkS5Tm053D+V+wRzCySYA2YAnxnvl5Qpu6cRZFMCSvcpcoqZ3C+UPrsrUnBkxPj+PaDYLQ5Q+KTjco47oXe6hxKpASJ6l3KLW0XLQfbztneYxBNxMPWGtiTkiFPEy783lh5934yIkyS9Lu180/rk9Vmd6QLyaSuR02X2A2HL/IFlkSOeowBWEMOXBGVxpjFTsZdSiOf7EbZh1O/r1VjfkkG7CvDY8/eo1MlmnFYJ0iFbCPeD4tCbc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RIGlEvZpobQ7dAGkQ84gGdiOAIiP94bDNKBRz/WDT6nCMuzZmB/nTnWEmZAm?=
 =?us-ascii?Q?wL+kc1IivODGRq4OJeVXqktbv6In06D1AVSV7t2s2xiZXq8XymcchDLGAvEY?=
 =?us-ascii?Q?DuZKMM0TIto6uJAwsqa4zMcmqosu7co1TtXRe7LE7IETgzw8FKnxCImoy4B9?=
 =?us-ascii?Q?gYeIAL8JQr6ZiMsfGTo69Ovmfrvp3R0pVNDcX+rTK9gyNJ2FIXm9Hp/Q/Zbi?=
 =?us-ascii?Q?VogRW1O+q/n9d81wip408mB8xRDvTuw2ZU4NLViemA00ncQePEyliiTfzmez?=
 =?us-ascii?Q?8UN/bx75bwSNUuedtfUUaByP3xE7VEzdRfsJ3GL6JUWv4+Vjc1T4eWSZV1lh?=
 =?us-ascii?Q?3+yS4s4LzDXzPZ5lvVMciMPAp9VR42o9qNT5a+PmI3I3KfxdjJfNF/G1+9yV?=
 =?us-ascii?Q?wDNZbY7gvBNjiZLzZzxqPrEYpw+0g4TdabXeIS+YCXurtnUw4ZF6HhLWGLvI?=
 =?us-ascii?Q?Kttg4V3NJwlaR4HA8lRsPesOIoVVIfziTLJb/Yq2wj+K8X4p1i1DgqhArclm?=
 =?us-ascii?Q?U2B7i/rlP0IAuB56+ZdsFPynKwWVzEWHRke/ErcXXnFip/MKEN2ViWC/8GC4?=
 =?us-ascii?Q?k9cYyg2R3Zsh8VRieTf3xpn0dGP7vKPycDbJZ1EuMG0bsQY9y4I6bQTgh50+?=
 =?us-ascii?Q?6pOEyCthCghGlZMY596VcgEFeYM0/bsrMpH2V9W2QerI/KAJbo4zf8pMuW13?=
 =?us-ascii?Q?8l5CysGIjnMPLWxb3I2koMdvqfVIDQknjwi7TXX91hLcJ03m/PqYd65FRhg5?=
 =?us-ascii?Q?bXADnJMnx9TDOXIlKRPOCRvZtYS0eP5Ml4z5pw8bNM5bLQ4DJp+fqFQ/EIyw?=
 =?us-ascii?Q?saIH02QhR1TVmkDeng1cIhbT82rjMXsC36Rhb0jz2+3JNiohPIW861ywPkW5?=
 =?us-ascii?Q?cM2gzdLVma8YknBGYps72eZnswR6wzQruKkQN9pmckvQGm41FMesh1DRPp9Z?=
 =?us-ascii?Q?EdsC9z3P/U3OW9g66P1NabCJyQj4NWNCSHjOeEwCx7221ySlt/VYSv1R21SS?=
 =?us-ascii?Q?qw/+agM+FVbs6tW7ySvuaSQWfh+htQRTXex9wonu+uMJqX4KdmUmycPbL/ZI?=
 =?us-ascii?Q?70jToBKTi0bD3o+dhF6C6GZqYZWpbvicvAi5hb3Q5VqqTy5iCLYOGvaAbeb0?=
 =?us-ascii?Q?Et2klAN7g+AXVPIGbTw/BetjUro0gfTy7g4OFK+I8WXSyw4cZeVHngxMxgqS?=
 =?us-ascii?Q?UO9RXQaYdvxLfwPoPrc0GioUQHpvPkN6qIX1kSJkz1lHINtJCa4XnKGZzscb?=
 =?us-ascii?Q?IDKvzw6IYYOlBueJoXF6LvQ88nySpbh3+bPiWi8i1dLp9YeH3VVOt4MIxiKb?=
 =?us-ascii?Q?hc2pXe7r5TVqRY2BIrP/7gRBvE6/IaxUtoDi1TZ1W1O1MeOA4jM12VI0sxal?=
 =?us-ascii?Q?pBaMdoBcTIYot4TRc4OnDO8vV9ybpIuDKeLzJQ3LnYtXjcuPzMFjRzbtLmw1?=
 =?us-ascii?Q?M7L7hGOZpIflT97p2186PT2/gC41iw7M3oQDCnI7GzrFSrMwUfsBwiu6QwmQ?=
 =?us-ascii?Q?Coy/oXmbYpgTp/ypCaKkE/EE/Kdbtx4ECqrTTARSwg6LBVtGQq6VDGaB7VNl?=
 =?us-ascii?Q?BRCAx29BstAJBfONzq0C7ru9BkVFd4ZQkuNjr4NeYWP6ASQ+C1CfaDDVeA53?=
 =?us-ascii?Q?dw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b347cf-5d97-4f99-9608-08dc44a8d7a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 04:31:54.2271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wScQdgEQ+GkEQ/RfOQReJRd2Ho7Rf1SDzOah6ILbLyly4KVChWKGEtgFRqowTwkUWnJFF7BgNT0WEf7y6l8LUyQlJrVTKBjw2cvVCJYUCes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8007
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
> Rodrigo Vivi
> Sent: 15 March 2024 06:33
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Teres Alexis, Alan Previn
> <alan.previn.teres.alexis@intel.com>; Somaiya, Himanshu
> <himanshu.somaiya@intel.com>
> Subject: [PATCH 3/3] drm/xe: Force busted state and block GT reset upon a=
ny
> GPU hang
>=20
> In many validation situations when debugging GPU Hangs, it is useful to
> preserve the GT situation from the moment that the timeout occurred.
>=20
> This patch introduces a module parameter that could be used on situations
> like this.
>=20
> If xe.busted module parameter is set to 2, Xe will be declared busted on
> every single execution timeout (a.k.a. GPU hang) right after devcoredump
> snapshot capture and without attempting any kind of GT reset and blocking
> entirely any kind of execution.
>=20
> v2: Really block gt_reset from guc side. (Lucas)
>     s/wedged/busted (Lucas)
>=20
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c     | 30 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h     | 13 +------------
>  drivers/gpu/drm/xe/xe_guc_ads.c    |  7 +++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
>  drivers/gpu/drm/xe/xe_module.c     |  5 +++++
>  drivers/gpu/drm/xe/xe_module.h     |  1 +
>  6 files changed, 48 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c index d02e59fb49eb..e28e3628744f
> 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -774,3 +774,33 @@ u64 xe_device_uncanonicalize_addr(struct
> xe_device *xe, u64 address)  {
>  	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);  }
> +
> +/**
> + * xe_device_declare_busted - Declare device busted
> + * @xe: xe device instance
> + *
> + * This is a final state that can only be cleared with a module
> + * re-probe (unbind + bind).
> + * In this state every IOCTL will be blocked so the GT cannot be used.
> + * In general it will be called upon any critical error such as gt
> +reset
> + * failure or guc loading failure.
> + * If xe.busted module parameter is set to 2, this function will be
> +called
> + * on every single execution timeout (a.k.a. GPU hang) right after
> +devcoredump
> + * snapshot capture. In this mode, GT reset won't be attempted so the
> +state of
> + * the issue is preserved for further debugging.
> + */
> +void xe_device_declare_busted(struct xe_device *xe) {
> +	if (xe_modparam.busted_mode =3D=3D 0)
> +		return;
=20
Do you see any usecase or benefit of providing the option to disable busted=
 mode with modparam ?

BR
Himal=20

> +
> +	if (!atomic_xchg(&xe->busted, 1))
> +		drm_err(&xe->drm,
> +			"CRITICAL: Xe has declared device %s as busted.\n"
> +			"IOCTLs and executions are blocked until device is
> probed again with unbind and bind operations:\n"
> +			"echo '%s' | sudo tee
> /sys/bus/pci/drivers/xe/unbind\n"
> +			"echo '%s' | sudo tee
> /sys/bus/pci/drivers/xe/bind\n"
> +			"Please file a _new_ bug report at
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> +			dev_name(xe->drm.dev));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h
> b/drivers/gpu/drm/xe/xe_device.h index 2c6d9b77821a..e6edf2d3ee4a
> 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -181,17 +181,6 @@ static inline bool xe_device_busted(struct xe_device
> *xe)
>  	return atomic_read(&xe->busted);
>  }
>=20
> -static inline void xe_device_declare_busted(struct xe_device *xe) -{
> -	if (!atomic_xchg(&xe->busted, 1))
> -		drm_err(&xe->drm,
> -			"CRITICAL: Xe has declared device %s as busted.\n"
> -			"IOCTLs and executions are blocked until device is
> probed again with unbind and bind operations:\n"
> -			"echo '%s' | sudo tee
> /sys/bus/pci/drivers/xe/unbind\n"
> -			"echo '%s' | sudo tee
> /sys/bus/pci/drivers/xe/bind\n"
> -			"Please file a _new_ bug report at
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> -			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> -			dev_name(xe->drm.dev));
> -}
> +void xe_device_declare_busted(struct xe_device *xe);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> b/drivers/gpu/drm/xe/xe_guc_ads.c index 6ad4c1a90a78..ecf45289b187
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -18,6 +18,7 @@
>  #include "xe_lrc.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> +#include "xe_module.h"
>  #include "xe_platform_types.h"
>=20
>  /* Slack of a few additional entries per engine */ @@ -312,10 +313,16 @@
> int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>=20
>  static void guc_policies_init(struct xe_guc_ads *ads)  {
> +	u32 global_flags =3D 0;
> +
>  	ads_blob_write(ads, policies.dpc_promote_time,
>  		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
>  	ads_blob_write(ads, policies.max_num_work_items,
>  		       GLOBAL_POLICY_MAX_NUM_WI);
> +
> +	if (xe_modparam.busted_mode =3D=3D 2)
> +		global_flags |=3D GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +
>  	ads_blob_write(ads, policies.global_flags, 0);
>  	ads_blob_write(ads, policies.is_valid, 1);  } diff --git
> a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 82c955a2a15c..e7ddf35c1dac 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -34,6 +34,7 @@
>  #include "xe_macros.h"
>  #include "xe_map.h"
>  #include "xe_mocs.h"
> +#include "xe_module.h"
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
>  #include "xe_trace.h"
> @@ -949,6 +950,9 @@ guc_exec_queue_timedout_job(struct
> drm_sched_job *drm_job)
>  	simple_error_capture(q);
>  	xe_devcoredump(job);
>=20
> +	if (xe_modparam.busted_mode =3D=3D 2)
> +		xe_device_declare_busted(xe);
> +
>  	trace_xe_sched_job_timedout(job);
>=20
>  	/* Kill the run_job entry point */
> diff --git a/drivers/gpu/drm/xe/xe_module.c
> b/drivers/gpu/drm/xe/xe_module.c index 110b69864656..f81970e8d713
> 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -17,6 +17,7 @@ struct xe_modparam xe_modparam =3D {
>  	.enable_display =3D true,
>  	.guc_log_level =3D 5,
>  	.force_probe =3D CONFIG_DRM_XE_FORCE_PROBE,
> +	.busted_mode =3D 1,
>  	/* the rest are 0 by default */
>  };
>=20
> @@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe,
> xe_modparam.force_probe, charp, 0400);
> MODULE_PARM_DESC(force_probe,
>  		 "Force probe options for specified devices. See
> CONFIG_DRM_XE_FORCE_PROBE for details.");
>=20
> +module_param_named_unsafe(busted_mode,
> xe_modparam.busted_mode, int,
> +0600); MODULE_PARM_DESC(busted_mode,
> +		 "Module's default policy for the busted mode - 0=3Dnever,
> +1=3Dupon-critical-errors[default], 2=3Dupon-any-hang");
> +
>  struct init_funcs {
>  	int (*init)(void);
>  	void (*exit)(void);
> diff --git a/drivers/gpu/drm/xe/xe_module.h
> b/drivers/gpu/drm/xe/xe_module.h index 88ef0e8b2bfd..bbf88c34e4f4
> 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -18,6 +18,7 @@ struct xe_modparam {
>  	char *huc_firmware_path;
>  	char *gsc_firmware_path;
>  	char *force_probe;
> +	int busted_mode;
>  };
>=20
>  extern struct xe_modparam xe_modparam;
> --
> 2.44.0

