Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA95CA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4542789E47;
	Mon,  5 Oct 2026 11:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrvVMMi4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3209D89E47
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 11:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791198188; x=1822734188;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qMAmhs3wDL8NVWywhVWhopT9KO8E1DzkG8BKfzLxMJE=;
 b=XrvVMMi40QDP0POeNuzJCIEFDhihJAoctKGjVlYLosogB6UT1p/eMqNd
 d2jffzaeuxaSh/ktIJ0iNEHxZF8YNSw1vQBntrRWGqQBnunJd4GuBy0mi
 1Uk9Q1kKig4Q0CBs/YhUt5Mr+nMKDfq0rq3YmHNSsJXV6z6JaJPPmQNJe
 /2Ni1Qr1hvNdpp6H4xvr0StsmpqUtdjOOL2B7IbFq+6AjY2MKWgxoJR6+
 IKVDgic2GeOGSfsF69BLkWAtAL2KwXsU1o+XjCITN4nRphL2Pnd2RxbsB
 4xv2PwiVaPYxCOuaNPhxcRHQyyEwF33DstAOOEp90rUGri8EMciDSdlT9 Q==;
X-CSE-ConnectionGUID: 5u3BFMI7SmaleVljNlYbYw==
X-CSE-MsgGUID: SfpaGGgMSyCX3tw/IB4Mpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="102385261"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="102385261"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:03:05 -0700
X-CSE-ConnectionGUID: zPvcScMDR5yaY/s4wLVprw==
X-CSE-MsgGUID: lhRb6P2RQDePk6Y9/cclxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="276923437"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:03:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 04:03:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 04:03:03 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 04:03:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnyNHfXxCFG14ztye94inphH4dRaBgCTkPxTmQmBP0Xsvec2FCQV+GWT55cMfTRmZPgd7mLQWFzS3/WdVRBOblvbes4wBUtMF5Mw6n5Koh+SAOY97V3PITjWrTevXvEnmkUbL/bZumryGf6+7GpFzPNVwA/ma2ODBHQrv2g0kKK+PTPoih+uH0klCZgAQBerSplpMr2QDP85nqDkmmuBnmC6TGYkZyMJl1CuCO6g+jQDD2y5Puk2wcALi3STBa2gKN1Z3s0JCe8YNxj0LmCJGvyVLQMkDxqle8gf8eEz78m0xG+A5QzFoncRwK6EOUe1T4pW15DAJ66rONNNrkO+eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okoDSZ0BjuOQyO3h4WofaSFiPWOYvSn0V+e1PrKFzfY=;
 b=vGT26NJn0SWJmTZeN4mO6rNYDjLpquqixies8fIVakpAUmXS0cpbZJTHrDRBq51oXcF9PFuwPIuFC2VTJZJ+RJd/hDqLJUNIfLN+0uK5p1mgdm3RHJxdfXweGElEPLFr5Vpk8usABl1xnjYX0jElYRyXEN8GW5w8OON4t9whTDQHqpwv+r1KGNZcE4SEl1ROTp2wZDs9yOfBWZC4Nx3ljK32o+m9aA7Yb6DeMsLdc8VzCjV7nbwmWHRw6OTgP06pmMkd5NjYj8SJ6z1fPoiwi1OW0vCZy1v6FXZhUB2f0aDaDAyHM/ZDkpgbYx5jz/v9wWkjKQ0yzhRMyhO053dEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DM4PR11MB6431.namprd11.prod.outlook.com (2603:10b6:8:b8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.18; Mon, 5 Oct 2026 11:02:57 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 11:02:57 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v4 1/6] drm/xe: Separate drm-ras netlink data from device
 and firmware RAS state
Thread-Topic: [PATCH v4 1/6] drm/xe: Separate drm-ras netlink data from device
 and firmware RAS state
Thread-Index: AQHdVKg+CMBXuKDnWEe7yfzrNbZxULbuyEGw
Date: Mon, 5 Oct 2026 11:02:57 +0000
Message-ID: <DS0PR11MB87181BD77A01C36B5EC6A8BB81962@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261005090156.1233748-8-riana.tauro@intel.com>
 <20261005090156.1233748-9-riana.tauro@intel.com>
In-Reply-To: <20261005090156.1233748-9-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|DM4PR11MB6431:EE_
x-ms-office365-filtering-correlation-id: b8b7e3cf-c794-4770-7c6d-08df22d03676
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|11063799006|4143699003|10067099003|38070700021|260925021311599003|260925021911599003|260925022911599003|56012099006;
x-microsoft-antispam-message-info: KdoohsW3GWCGo8y1GNg2hhEW/6zt58vp2kZGNa71p5W+MbLTGgnq7nq42ME9nnuL+7boBpxX8egIk+4blIzC75D+fZuySUqqfwOWZgpfAP2X78N43YGsi+Svq7kGX40PLORKk7GaVdF+U9yqSLNYF6rRqvdjy/v6sfyYnfAj7g/h89InKK9me8UUgqlgBvR7ruont9+0o07zDp4iM2qY2LC42rKHlWU6sZXgCv2Yhw6+jENXmeUX6y7YyGsUlVDrtcyHJsMcX9c1nevtelcB7UutaEYFhoJqv2MzrON2O+jEz+fZEJukfihkHXjPtq+ZOFtIrNWEpW/XcuRX9WjN0gSsx2hM2kz120nhNeAdaD9f5coQx+6lSSqunsohU+KWxiVMI1DcmPE1zjOBY4AfeNMSJ0we93igMYNJ1foIeVQpFDpXLHyiK7DcWTZTXMG/rSJdjEYDF23M57ChlCkoTtuXDCanuEvUFFFS1XoXpU5G/sd75yT4AYCnfMTDGimb1wU6FqP7b0QwetgshCrpUk+bKl5l/m2utYDEAW6O1xaXu13mmIYh+4lNpbnS1qn6MQviREFd3VW3mUVLphgaQn9xHj0lzptZdRokrJYzPtFpfqvws4tfR9auOi12eck1pAp+DAY+BDI8pOoeFwOC9rwhMxBM4U5SZKF04k26lQJ7ZUi8M0lwg/5ISAGpFJ4ff2/Hoy2cHmlI2Fp17n7DxfJVgkn3KFjprGatNDMWoek=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(10067099003)(38070700021)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0Yzp/RJ/6Ebq0TOEQulroWKdMvaXTOLOjsZW/0whp1Zo/6CxjfcKQwCbJvic?=
 =?us-ascii?Q?SRWm0bUDlLfcJoB1m9MA9sgezDzj98pramn0X+NVXAC2LF0RRCVcx6y0W7dk?=
 =?us-ascii?Q?j7Mh+JUC3opyA9udShmXbxhEaEMdq34CKxPlh1gwxGsqsiHQCf4DQaHC2ozT?=
 =?us-ascii?Q?HNuPuUhvqJP135ctpWMWMfIi6RuJNzwmvg11aZn4TcG4DmVjQzvECU6F6ecX?=
 =?us-ascii?Q?l0qr3KmK7Tk7iGfjyKWBSJc4ktchjEv+9ed+3V7Pd/drvZeVdoUU/IMehayT?=
 =?us-ascii?Q?zgWBfPpY1yQ7i5jdu9/o4A34/aC88A+MwZjCzahkXvCt/TpVSWPxz6BSeoyO?=
 =?us-ascii?Q?S1b4uynxzeg3KKmprEV1R+SqRBK+nPYOnFADbzsGuzcan+CQSSe/hVFZCVih?=
 =?us-ascii?Q?mLFEV936IJz/YqMSUqvLXgqKuVwYeHgRqlmJ+iTDwbtSmbhlPgb5Oj0kj5Jf?=
 =?us-ascii?Q?px+s3FWuZHTcmtrIsusdshIrdLzg3iT9z6KVyAqXxv/jmkTcUiDF3AlosLJl?=
 =?us-ascii?Q?ygwD27vQuNfTEOJWG8CRrtPKSg4nNDTFUoWfw5+5oYACjS1zMsmgJNbSjZp7?=
 =?us-ascii?Q?QJr18zJjXVnte1G0fRU9KXKr5h2lT2K3t4IGoDyImO45CMl4Me1GWgl87Sqy?=
 =?us-ascii?Q?hQUDYOfXORYsUPcfUx92MIywsNG0DJPfYF6VvFx9EM+HT8iEXAUKRKTMycaw?=
 =?us-ascii?Q?yLgUtIyOuVe+reGn5WRBjkn3ebqZhwKAPUZ2wgQluiRskafGHCqG4XukXbz3?=
 =?us-ascii?Q?1Meq9cykXOhJcwv24Y8TWsEpMmisQizXplsfZoARB6zfF7IZ4cmNwYqc4ZF/?=
 =?us-ascii?Q?+GCk0dXd6dUn+cV/IfE/mwOWs9ntFfvFEqYGpf+KsnspkBRs/syeqHULSiZ4?=
 =?us-ascii?Q?veTaleY/T2LOGPeyXWY6qmQUIFFmJj/m1oRtR/1LmeMAWPQh/MQqw1YPao8k?=
 =?us-ascii?Q?rTAdtlImohhiM4Pg7fVRarhuV0jCYCP/5rH29b63IZ+Oco2hab4RloaUQWr0?=
 =?us-ascii?Q?LPFJek+K/e7AzHywaQr6f9dsZQN7iJJ9eVqTcPCaeYXj7weA69OdUDkraH0X?=
 =?us-ascii?Q?9WjysPiROoqMhCqWJ6EwiA5H2ruxstIg4sWff141oveqWrA/3nS8viIqdVYl?=
 =?us-ascii?Q?xM7W4yPgvcaLxy9I89V6qfUGT4PP3ywwS1vGZ/M3cuoEc2wFljIdfPB2m0+0?=
 =?us-ascii?Q?iMXDzgvMiFUeUmeawduKKQ/atuTCsazxwuYZBN26jaDCB0EE+xxMCIrgPwEb?=
 =?us-ascii?Q?mwjRGmkuysThMABNO3mLEwrxnFQesTy0MC46z4dtgIjqN9elyFVShjaWvfce?=
 =?us-ascii?Q?E7Ue3cyOVvLbYA3b+RpgbnxZm1q52+bs1HjoOvSccV0L5Zt8cb6Y2rrcu04N?=
 =?us-ascii?Q?qkaQ5MSMPNT+IlUm5urA+L/5RbklIv7shGtDmZ5Vtt44zX1/ZPOPA69bHeUD?=
 =?us-ascii?Q?UJ3j8EOGPpXvB9RqV2WHMskNlHFI2kGpOJqJF1+fBsBxHLyge3A3emaxeoai?=
 =?us-ascii?Q?Zy8tVA1W/iKsEJu4gPlsHr6GR1YFfVs2qXp7QZZby3Rq8JnSFZs4km/Mly0U?=
 =?us-ascii?Q?dHQqzLlQz2ibFb3FpSo5/XgPMzIhdTg8kvD5DXtvDZ93amwwUcWkimaP5naY?=
 =?us-ascii?Q?h+lRrQ8IFQjUrzyOTDalO/kM5GiR0CHENcDrlBgtPRMdh1YrFO9BlFPLYghh?=
 =?us-ascii?Q?EBrE6i/BIotLUoh1FLz5eiceqSsn8n1lHyV2Z/QTdgKyQa9jW9Rh39e2pT9F?=
 =?us-ascii?Q?xwgsWH/riw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cMFgcHVCOplC+1TAG6P5iFsSvNnTt8c0Javi3T0Bj2cwszOPJonC8uZCISDM74pqJc2GcKUZUQXf/a4tSFa2sfAlp5laGzMx9UNGvpcVB0PIh9XXvJYiO5ZK85mlCw4S6WkBg7eZqHno3rZpMnhiK9YAAWlz8S1u9JT7uBGy5LyPsgn7UiaosuHV1LouesmCMtOMl+zf2sAmnnaH5C0yw0CC6sjPgf7q6X/x7g58G5lxFOwSUGndIIA2DJ/rawJdQTLwfMYfRiOaAbZoD2daBQn03irf9MuQRzATwyuW70pEMe892uZPj3icAr75pAbCc7llg9bcD5oDjGQ8nDHMLw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b7e3cf-c794-4770-7c6d-08df22d03676
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 11:02:57.2101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0t4C+tb/4uFei/caOLGitvSym/2HIHxMKtYnnlpq34NJkTQ3+AEo5QacdS251pGH9gzfuCYbZnit9NPakP5nco1THLTkwbxO8Kw0aSGI978=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6431
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: 05 October 2026 14:32
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH v4 1/6] drm/xe: Separate drm-ras netlink data from device
> and firmware RAS state
>=20
> Keep the DRM RAS data used for netlink reporting separate from the device
> and firmware RAS state in xe_device.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
> v2: remove inline function (Himal)
> ---
>  drivers/gpu/drm/xe/xe_device_types.h  | 11 +++++++++--
>  drivers/gpu/drm/xe/xe_drm_ras.c       | 16 ++++++++--------
>  drivers/gpu/drm/xe/xe_drm_ras_types.h |  3 ---
>  drivers/gpu/drm/xe/xe_hw_error.c      |  6 +++---
>  drivers/gpu/drm/xe/xe_ras.c           | 26 ++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_ras.h           |  2 ++
>  drivers/gpu/drm/xe/xe_ras_types.h     | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c  |  3 ++-
>  8 files changed, 52 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 41f703a87916..d267fb4e4d81 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -21,6 +21,7 @@
>  #include "xe_platform_types.h"
>  #include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
> +#include "xe_ras_types.h"
>  #include "xe_sriov_pf_types.h"
>  #include "xe_sriov_types.h"
>  #include "xe_sriov_vf_types.h"
> @@ -576,8 +577,14 @@ struct xe_device {
>  	/** @pmu: performance monitoring unit */
>  	struct xe_pmu pmu;
>=20
> -	/** @ras: RAS structure for device */
> -	struct xe_drm_ras ras;
> +	/** @ras: RAS (Reliability, Availability, Serviceability) structures */
> +	struct {
> +		/** @ras.nl_data: drm-ras netlink data */
> +		struct xe_drm_ras nl_data;
> +
> +		/** @ras.state: RAS device and firmware state */
> +		struct xe_ras_state state;
> +	} ras;
>=20
>  	/** @i2c: I2C host controller */
>  	struct xe_i2c *i2c;
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c
> b/drivers/gpu/drm/xe/xe_drm_ras.c index 7f3695707611..38d77561facf
> 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -20,7 +20,7 @@ static int query_error_counter(struct xe_device *xe,
>  			       enum drm_xe_ras_error_severity severity,
>  			       u32 error_id, const char **name, u32 *val)  {
> -	struct xe_drm_ras *ras =3D &xe->ras;
> +	struct xe_drm_ras *ras =3D &xe->ras.nl_data;
>  	struct xe_drm_ras_counter *info =3D ras->info[severity];
>=20
>  	if (!info || !info[error_id].name)
> @@ -41,7 +41,7 @@ static int clear_error_counter(struct xe_device *xe,
>  			       enum drm_xe_ras_error_severity severity,
>  			       u32 error_id)
>  {
> -	struct xe_drm_ras *ras =3D &xe->ras;
> +	struct xe_drm_ras *ras =3D &xe->ras.nl_data;
>  	struct xe_drm_ras_counter *info =3D ras->info[severity];
>=20
>  	if (!info || !info[error_id].name)
> @@ -90,7 +90,7 @@ static int query_correctable_error_threshold(struct
> drm_ras_node *ep, u32 error_
>  					     const char **name, u32
> *threshold)  {
>  	struct xe_device *xe =3D ep->priv;
> -	struct xe_drm_ras *ras =3D &xe->ras;
> +	struct xe_drm_ras *ras =3D &xe->ras.nl_data;
>  	struct xe_drm_ras_counter *info =3D ras-
> >info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>=20
>  	if (!info || !info[error_id].name)
> @@ -106,7 +106,7 @@ static int query_correctable_error_threshold(struct
> drm_ras_node *ep, u32 error_  static int
> set_correctable_error_threshold(struct drm_ras_node *ep, u32 error_id, u3=
2
> threshold)  {
>  	struct xe_device *xe =3D ep->priv;
> -	struct xe_drm_ras *ras =3D &xe->ras;
> +	struct xe_drm_ras *ras =3D &xe->ras.nl_data;
>  	struct xe_drm_ras_counter *info =3D ras-
> >info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>=20
>  	if (!info || !info[error_id].name)
> @@ -142,7 +142,7 @@ static int assign_node_params(struct xe_device *xe,
> struct drm_ras_node *node,
>  			      const enum drm_xe_ras_error_severity severity)  {
>  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> -	struct xe_drm_ras *ras =3D &xe->ras;
> +	struct xe_drm_ras *ras =3D &xe->ras.nl_data;
>  	const char *device_name;
>=20
>  	device_name =3D kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d", @@ -
> 190,7 +190,7 @@ static void cleanup_node(struct drm_device *drm, void
> *node)
>=20
>  static int register_nodes(struct xe_device *xe)  {
> -	struct xe_drm_ras *ras =3D &xe->ras;
> +	struct xe_drm_ras *ras =3D &xe->ras.nl_data;
>  	struct drm_ras_node *node;
>  	int i, ret;
>=20
> @@ -230,7 +230,7 @@ static int register_nodes(struct xe_device *xe)
>   */
>  void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity,
> u32 value)  {
> -	struct xe_drm_ras *ras =3D &xe->ras;
> +	struct xe_drm_ras *ras =3D &xe->ras.nl_data;
>  	struct xe_drm_ras_counter *info =3D ras->info[severity];
>  	struct drm_ras_node *node;
>  	int ret;
> @@ -260,7 +260,7 @@ void xe_drm_ras_event(struct xe_device *xe, u32
> component, u32 severity, u32 val
>   */
>  int xe_drm_ras_init(struct xe_device *xe)  {
> -	struct xe_drm_ras *ras =3D &xe->ras;
> +	struct xe_drm_ras *ras =3D &xe->ras.nl_data;
>  	struct drm_ras_node *node;
>  	int err;
>=20
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h
> b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> index 0be218ba2db7..8d729ad6a264 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
> @@ -43,9 +43,6 @@ struct xe_drm_ras {
>=20
>  	/** @info: info array for all types of errors */
>  	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERR_SEV_MAX];
> -
> -	/** @disable_vram_page_offline: cached configfs policy, immutable
> after init */
> -	bool disable_vram_page_offline;
>  };
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
> b/drivers/gpu/drm/xe/xe_hw_error.c
> index 5f2abc9485ff..f53a6b3055de 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -240,7 +240,7 @@ static void log_soc_error(struct xe_tile *tile, const
> char * const *reg_info,  {
>  	const char *severity_str =3D error_severity[severity];
>  	struct xe_device *xe =3D tile_to_xe(tile);
> -	struct xe_drm_ras *ras =3D &xe->ras;
> +	struct xe_drm_ras *ras =3D &xe->ras.nl_data;
>  	struct xe_drm_ras_counter *info =3D ras->info[severity];
>  	const char *name;
>=20
> @@ -260,7 +260,7 @@ static void gt_hw_error_handler(struct xe_tile *tile,
> const enum hardware_error  {
>  	const enum drm_xe_ras_error_severity severity =3D
> hw_err_to_severity(hw_err);
>  	struct xe_device *xe =3D tile_to_xe(tile);
> -	struct xe_drm_ras *ras =3D &xe->ras;
> +	struct xe_drm_ras *ras =3D &xe->ras.nl_data;
>  	struct xe_drm_ras_counter *info =3D ras->info[severity];
>  	struct xe_mmio *mmio =3D &tile->mmio;
>  	unsigned long err_stat =3D 0;
> @@ -422,7 +422,7 @@ static void hw_error_source_handler(struct xe_tile
> *tile, const enum hardware_er
>  	const enum drm_xe_ras_error_severity severity =3D
> hw_err_to_severity(hw_err);
>  	const char *severity_str =3D error_severity[severity];
>  	struct xe_device *xe =3D tile_to_xe(tile);
> -	struct xe_drm_ras *ras =3D &xe->ras;
> +	struct xe_drm_ras *ras =3D &xe->ras.nl_data;
>  	struct xe_drm_ras_counter *info =3D ras->info[severity];
>  	unsigned long flags, err_src;
>  	u32 err_bit;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> 7a85735c57d5..76c54dbd4af4 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -906,6 +906,17 @@ static const struct attribute_group
> gpu_health_group =3D {
>  	.attrs =3D gpu_health_attrs,
>  };
>=20
> +/**
> + * xe_ras_get_disable_page_offline - Get the page offline user policy
> + * @xe: xe device instance
> + *
> + * Return: true if the page offline policy is disabled, false otherwise.
> + */
> +bool xe_ras_get_disable_page_offline(struct xe_device *xe) {
> +	return xe->ras.state.disable_page_offline;
> +}
> +
>  /**
>   * xe_ras_init - Initialize Xe RAS
>   * @xe: xe device instance
> @@ -916,19 +927,18 @@ void xe_ras_init(struct xe_device *xe)  {
>  	int ret;
>=20
> -	/*
> -	 * TODO: Replace platform check with xe-
> >info.has_disable_vram_page_offline
> -	 * once the feature flag is plumbed through device info.
> -	 */
> -	if (xe->info.platform =3D=3D XE_CRESCENTISLAND)
> -		xe->ras.disable_vram_page_offline =3D
> -
> 	xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe-
> >drm.dev));
> -
>  	xe_drm_ras_init(xe);
>=20
>  	if (!xe->info.has_sysctrl)
>  		return;
>=20
> +	/*
> +	 * TODO: Replace with xe->info.has_disable_vram_page_offline once
> the feature flag is
> +	 * plumbed through device info.
> +	 */
> +	xe->ras.state.disable_page_offline =3D
> +		xe_configfs_get_disable_vram_page_offline(to_pci_dev(xe-
> >drm.dev));
> +
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h in=
dex
> 0b8669f28d56..ac1253d6ead9 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -7,6 +7,7 @@
>  #define _XE_RAS_H_
>=20
>  #include <linux/types.h>
> +
>  #include "xe_ras_types.h"
>=20
>  struct xe_device;
> @@ -20,5 +21,6 @@ int xe_ras_get_threshold(struct xe_device *xe, u8
> severity, u8 component, u32 *t  int xe_ras_set_threshold(struct xe_device=
 *xe,
> u8 severity, u8 component, u32 threshold);  void xe_ras_init(struct xe_de=
vice
> *xe);  enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device
> *xe);
> +bool xe_ras_get_disable_page_offline(struct xe_device *xe);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
> b/drivers/gpu/drm/xe/xe_ras_types.h
> index fe6f3658a2a4..5fe56e42b841 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -336,4 +336,14 @@ struct xe_ras_set_health_response {
>  	/** @reserved1: Reserved for future use */
>  	u32 reserved1[2];
>  } __packed;
> +
> +/* Device structures */
> +
> +/**
> + * struct xe_ras_state - RAS device and firmware state  */ struct
> +xe_ras_state {
> +	/** @disable_page_offline: cached configfs policy, immutable after init
> */
> +	bool disable_page_offline;

disable_vram_page_offline was named thoughtfully to add "vram" phrase as th=
is is specific to vram. I know you are reading from same vram specific conf=
ig name. I leave up to you to add "vram" word in this variable.
With or without it :
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> +};
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 9a514d983e90..2c4722a956a0 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -24,6 +24,7 @@
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_printk.h"
> +#include "xe_ras.h"
>  #include "xe_res_cursor.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_vram_mgr.h"
> @@ -933,7 +934,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device
> *xe, u64 addr)
>  	vram_mgr =3D &vr->ttm;
>  	mm =3D &vram_mgr->mm;
>=20
> -	if (xe->ras.disable_vram_page_offline) {
> +	if (xe_ras_get_disable_page_offline(xe)) {
>  		xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
>  		       addr);
>  		return -EOPNOTSUPP;
> --
> 2.47.1

