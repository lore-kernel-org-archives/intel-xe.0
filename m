Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D4DFF60F4
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 18:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3920310E7EE;
	Tue, 31 Mar 2026 18:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzGaLpaf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AB610E7EE
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774980811; x=1806516811;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rQnFmgueKFBAAAw0tayHL4bjEp7sr/R4Z5wCZxxuQLc=;
 b=DzGaLpafWcriNbQOmvnxHkP+RIy4LA4NubIxbE4Yq8n6qnAqr+NAgbfJ
 KjLFUgAkIdW8o8LjqtSAw1DNvDkbLXuI1upFk+DdOBxmziu+kEFrzMnTL
 FmzaGBnC2BNxIM8UYaxCkDSrUSrPt+QITz7ATisGZN5UBB72bPpESYCD3
 IF9sdzt/lVFQeJiNc/b00GFe+OpSxx6LtACRPC6MErw55bHWFDcL9/PoW
 2fbUDpnGGsiYR9y4DqulP86Hd6rNV+yLS6otjyTtIuuzHxg5mxCEey8Sk
 Wh7ARiVFe6k427GmmCKR3xG+pTkhFYby6YcWPuZQfpY1u49sdr3ak3PPS Q==;
X-CSE-ConnectionGUID: Q5U5VFGVTFWFTaXgsDcuWg==
X-CSE-MsgGUID: ekvog+GGRxqO7hgW3mcgPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="98615071"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="98615071"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:13:30 -0700
X-CSE-ConnectionGUID: XMsyMmySTpqyLgqGGpIPgw==
X-CSE-MsgGUID: mjSISX0UTue7Hwfnyl7kiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="222037448"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:13:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 11:13:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 11:13:29 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 11:13:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSiQR865F8MPmJm99iAlFFI2HyYgT1eXltNy00xeYwBYgQrQohAsIB5ysMqXe9SBCL9ksDZk2ZxQE2r0esx1gCLs7WZXTjvd8ig1yuqcyRClrHbazbtYyGcHv0vLM35EscwQx7DgRnKfGSIegGnPr3l9yDknJKi7a9ecT6RskD74Nkn05lAOLKeh7D5mGbU0ZbabUal7370/dWysFWuUj8M69TTwx9kVsw9Djs+XoVT3onKENQIp8kOPcIvtrWtT4UjeG1tpL1AJKHgKsZM62XgX+SVSrTGHh8JISh0zi61SUWi8y2xrpxaqRNxzAQhMTXK7gUfOBI1Sf3oTL5ZuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2b/Wa+aDeDQFPhPZ7+shTYwdkz/yIX+u4Zn5qlBFlDY=;
 b=n1SIaCPi4YaaR73E7YVefE0iJiJfuEVBYOfcEKKFrAQV1FuKz9M+wj49KT7eyj/KKCssYG2A3K2iNMoxtmXRAdvurbCAK5hOHYQN+rXdp/1JPWDuYw66ayXw4cJlRrazLI8ggo+7Jj3OVNSSlMGcIHnhgSqV0tqUt9SDbJIhtnnPk0yQtTMcOqECF/BHIj9tEkv8HnRJSMxNgxX21v5oyG0wy5P12UKmc/0m59jKOlz2GNyCEKly94/QAp7SPGTl5YRxpaHNA8sXcbOAbgMntP+w7Fdhif8mkHBJNVNaEsZ5qpXxbLDnlJkS6oR+CAK81pwmOTnpovBissqzD4z+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB6903.namprd11.prod.outlook.com (2603:10b6:510:228::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 18:13:25 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 18:13:25 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v2] drm/xe/vm: Add missing pad and extensions check
Thread-Topic: [PATCH v2] drm/xe/vm: Add missing pad and extensions check
Thread-Index: AQHcwTnufP+4mA3NCUGMWY8LskuJ17XI8YJQ
Date: Tue, 31 Mar 2026 18:13:25 +0000
Message-ID: <CH0PR11MB54445FBF9C7DC995537CF51BE553A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20260331181216.37775-2-jonathan.cavitt@intel.com>
In-Reply-To: <20260331181216.37775-2-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB6903:EE_
x-ms-office365-filtering-correlation-id: e6d8be71-252d-48eb-aee2-08de8f5133bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: pDDNGQuCVxqI8Do8R3HFuifR465XIHzOp3TE6frs6KOAjRgBSFu5KDhnvKO3BaLe8h2DJ96KfUnDTgfTMsHBGh4Z8/ikR5Wur4C1yfJysMk3R1ppeiYiqVRhl61ShA2yQU6Qv7pJR2OZYmht9cQoQ+y6FXUYAy7jwJtz8x3DxHx7Kk6oFAtUfvKqD5xvJVKNj4+WsGTmjA66s8sYpC8yF3Np30yxjwYQL8gL6rS/+iprHp2j8Kl16xJokflNh8m7Jm6LYET1sACywAq9BGh24Mbulhr4pj7odn088b8yAY2peEG/tfg1qPO0PYNGrHRxEa+hNzxh+CGg01P/rJ/M5iUAXvj2El4iCrAqSwuHhkqyYhVCFWJo6adwm8lhj1tnTzVJHF6yyUwbEJxkPqRqOmKFmjbPElBTgujlC6/T557jotaHksCuKu2YHgNuXlyRJUNi4hMIpNmu/rPjFVGAF1QmuGFqcZ6Di4tuK+hXTMNCCbZ/4PkcS0R8Yy3aX9wJG+XhWaqc1+p3ciKOdkbDbFlI4KIBd9zkL01uzv7oUsJHt5gP3zIoi0qfUS+p25kysuX/vhh5lvkzv2Lz9SO4NlzBxV9TvWKCNKSdlAhlCy4nOeazqNOrxBqk3n9ZeYHzeov6BgxkdlaxrDqxOnO8p3KJJ1/m3lsXGALwqJUsbGUl5O0WXdbF5qOVCG71nFwEVYyCfGe0T5G8+esIn46M2wrNlC8AWUYm4XKP+7sw0T5TMLE+DH4Hm+TIlP5jKssPJWFPD8oyS5Qqgt5eyMOcgw4mdsQJsOwfELAh1b4N2/A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bfneYPgtn1lY0T7IQLNdkrXDhEMD78Xj+hXd3vLfk7XzES8GKPYzHqm9z/eR?=
 =?us-ascii?Q?9swps1RJI4hY0HYAQ8h2Gaks2HkB1b5XIu/YEJ89saFbDCuYxKV/Rh7PfxZN?=
 =?us-ascii?Q?2Pf7wATfig6oCreekrO1Y58ANcCTvexlN4AeP36HzicxsSlAsv+yEr03GyyQ?=
 =?us-ascii?Q?2Nd/4AfoNShvChd9EoSMAkYTvQFx5vs32pMDxBX8XTHt+taO3p0tpzhgsk1i?=
 =?us-ascii?Q?40DccGNjQBW7X3zGvbwFtRPjA7xGfuc8aNrKZbRsR5RK30YRBhiZmq0NYwyV?=
 =?us-ascii?Q?xJwuEqRRHMFCdTs1b3IbR4AKh4zpG9e/sAui4KfyR85/G+HQDvfVKJal38Wg?=
 =?us-ascii?Q?sHeEP3Zxqmrz/djBvbM5nI8TBLiA148J7pCWm009Qq5+FVR6Dyk8FD2wwu2Z?=
 =?us-ascii?Q?Ywkny0OvW+d/TH808vQhLx7QLXIAIGJfFwg551zO913aJaokiDo5jWe/UqnD?=
 =?us-ascii?Q?kx1Bd9toM4/FQ0m1wM3wHOfsXvHcQ/GGc1MqaHLJOv8+EEb2THFB2rvBr1y7?=
 =?us-ascii?Q?GDp/jYWK5xxeOxvkcnBEjqciLIm0FXzlfnalNxw7JopH2d6EyFZVwlPYto7F?=
 =?us-ascii?Q?EFTb1V5d3wZWLkwk+KIa+C4EqrflDZFLOrkq635G3+Zq1rVxeUCiOjHKdlNK?=
 =?us-ascii?Q?hoAtDcYaQAlYYf5fvRX5MuhUOQk+7Nr/hIXKi6/PWIxSHbA/ertTWGYv6eE0?=
 =?us-ascii?Q?LmLyYOdgZK0/Tfp5MLlZOJhdJrTyE4bajIDQCU+AATD3KilhskCjUoWVrRG+?=
 =?us-ascii?Q?jF6mOY8kPt2dBVovN7v5a6PI5ipTuKAt0rnyoZ7jST702UdApRsD4TcNw6m7?=
 =?us-ascii?Q?muiDMReX4jfiJGj2hOHR2nefT+Uq9nMn1qSnGcNBOZ02CD3A/eMtFRT4/U1w?=
 =?us-ascii?Q?risMXTeM5I7jAq5ZtihfK/bHON8ThN0WgiP/itVkWiat2zQsw3QcEO+LS9Nj?=
 =?us-ascii?Q?woSA+MstbNy6BO+uDwGNk/jwjl+Os0pRb4YuRQzhNrYvBC30WVDSuR0339uo?=
 =?us-ascii?Q?H2EqfJcMwQvxgJDVJu1s8XVSPog6axc1q1jRTrJkg5ev3BkQ1B2K6UrJfMsj?=
 =?us-ascii?Q?X7qPs0zcDp67AeopE+9n2SASz54FwUb3xJPef0h7GClPvA2fGasXMnx8nkKu?=
 =?us-ascii?Q?Dg8MK2k4/9OJTNi8G5msi09k3PY+9Li9dp9rZvqMrbpADQ8zrm0ZmFgsdV1r?=
 =?us-ascii?Q?6OO+RKRBRPVZt9BMz+g7O+qlMzWJO3zDT/Ha3XPgsocRWLB6vF3z+T+jsHgR?=
 =?us-ascii?Q?dpmRLPUbWymozVQnCPyEpmcvj82mIV1d2979nhWNULSMwZQ8P2YWiw9wW5EJ?=
 =?us-ascii?Q?RVHJyigmMA7zcZ/DtnkKlvtG5slQP3vZqVaVNuvj6mHICnBJTrKtgEoxaDgM?=
 =?us-ascii?Q?LMePwLwe8tNjBLqOMb1NKbxDtiIXGNVM/lRuBExivLuo0EwA/RGiqG1iYBoI?=
 =?us-ascii?Q?HuhNt9ZY8aHniTygHSMfDBjX5v3XAOm14lpJxHQH1Ugj5L/8oXgL9bJ2WzVU?=
 =?us-ascii?Q?mq1jDLB4GFqHsA3/pr9eUAKM79ADmliXGAauu6zYkUn1M3HtyMN131WR0GjD?=
 =?us-ascii?Q?iEzUoZpS3iHUG2W6Fix83QsFhP4Xh4KZzyK5vR0qQypndfmZmE+I0fyaXAup?=
 =?us-ascii?Q?6agtXtEePmEpRTBw5phl6+sRjzxdTpfQT5DxNK4EO+wP4YkVUhcehRg5BwJy?=
 =?us-ascii?Q?Sr+rcYa18aWjMjgpCfnojYbLjNbj0upyA52/AXRU8H0eQYemnPDhp5O4t3jw?=
 =?us-ascii?Q?b1e/5XQoL1hyd1lkVcrbQQIExhcWlVOmS0NmHX9Z9pwPvad5hcqYfWDd4Rlo?=
x-ms-exchange-antispam-messagedata-1: M6gZkFSKnMEoNA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SSLs6Otutce/CrJRt8B2pkGn2AvIAv5e6dZ2tWBMS+CZ/kfr1z+kAEQcbLvw7vk2zaO9Qbtb8ai2EbYXTzR2cd82AOu7xNJobOL2KYyK+3iSBCeicXShDjt0SiXUTKrX4IBzK8Os7rGoIuSBMfwM+v/C84gfvoyn15TgX1d2f/fSq4zF6zhptEHHi+EdFKsseNP3INbJ+UxSIZF0DqHhr7YhjJU6/OE7vA0keza9HkLTD+5Yzi2ta3147rj+s5xs64/GMctKZkj8ePPOLlASVURuTt2vN/Udat+UNIggLi9n3058n4HCwOsAYLDbICt9tGO3u+XgUlHJf6asHNCSrA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d8be71-252d-48eb-aee2-08de8f5133bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 18:13:25.6133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rkJAuA6dlKrO8Zf2O5hIEbkcon/N8foqCSLfy0kjOynjHkWe8A64Mv4hOtKTQTqAncmjK7VsvrdJKZdr/A64XpNRqCjLHW9h9sPk71QUrlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6903
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

-----Original Message-----
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Tuesday, March 31, 2026 11:12 AM
To: intel-xe@lists.freedesktop.org
Cc: Gupta, Saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Auld, Matthew <matthew.a=
uld@intel.com>
Subject: [PATCH v2] drm/xe/vm: Add missing pad and extensions check
>=20
> Add missing pad and extensions check to xe_vm_get_property_ioctl
>=20
> v2:
> - Combine with other check (Auld)
>=20
> Fixes: 50c577eab051 ("drm/xe/xe_vm: Implement xe_vm_get_property_ioctl")
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

I forgot to carry this over from v1:
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 56e2db50bb36..1720205c09ca 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4156,7 +4156,8 @@ int xe_vm_get_property_ioctl(struct drm_device *drm=
, void *data,
>  	int ret =3D 0;
> =20
>  	if (XE_IOCTL_DBG(xe, (args->reserved[0] || args->reserved[1] ||
> -			      args->reserved[2])))
> +			      args->reserved[2] || args->extensions ||
> +			      args->pad)))
>  		return -EINVAL;
> =20
>  	vm =3D xe_vm_lookup(xef, args->vm_id);
> --=20
> 2.43.0
>=20
>=20
