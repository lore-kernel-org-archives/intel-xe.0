Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2F4CF9C6F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 05:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08C210E379;
	Mon, 23 Sep 2024 05:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJOwmT6v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5998310E379
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 05:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727068067; x=1758604067;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zx0rcQoj1pxuQfwtLyZ2+PSKfrWMPEnB36PiftrJggU=;
 b=MJOwmT6vZnWNWnt6DWohtHf4zzkbFcsoLRIrVM6X6PVjJT7j62+2xZ/E
 52aBzB/Peu9qep+SMv/rSQTclvFb4qfkAm8b2sDJO3jQgXCN6XUH4YvHJ
 Y8r2pvwDhBvgzWypXLLeXYL38P+2Glmr78AIf9+k0bbHcTVSZma9B9kDo
 TfIqhtlTK+WguBtPFhpGGRz7JR13fNje4gblXoV1PeqqgAzXM0xU2wI99
 exDu4Bm0o9V0S0lfTCH6gOnJR3OZ60Whh6oU8GvfEsp0FoNU4o67yyIwj
 1x5sg63bFkpq4/qFjAAmtzXSgCDgJ9th/CB8YNY3e+j5ehkwome2oo0oW A==;
X-CSE-ConnectionGUID: 5iqmQmd/REGYwcP0AWW5lA==
X-CSE-MsgGUID: 65zeyrVzTA6EEiV+aW+4Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26117704"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="26117704"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 22:07:40 -0700
X-CSE-ConnectionGUID: 27E7+QChTnSHia8nN3EUTA==
X-CSE-MsgGUID: JhGDBjdyS0ym6Em+ok3GpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="70528444"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2024 22:07:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 22:07:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 22 Sep 2024 22:07:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 22 Sep 2024 22:07:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDHCB8JInG9MQDqOhCLuuZHwR9h2C/8aHui/C/BbLeoD4ylaIK+sJf+0fVwin/Oxyx1rLrHG8SDlkLtoc/08gcG3Gh+vf3TXiQ7bVrbJQlHu55Ak1zPwQ1ylaqTOK1SFoOv+A7XGGNEqTtFHi8fEB78Lnvowsc+xDxf8OyRsAIjiJbklRreqHOgIaR1KCFOFQBHO7CqMntdbgSwqj3ASSBJeID7RPhRrvGQbdN0Kbj6pbo1bZjlhuR0ikfmXXEoMupmi93ErHE/wTltzb++DYZVfyx4OU/h52vARUsb7nbgdKtTGJmNpMfksRM9n2taWeFykZboZlU+4fCfGeVwDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01Pd9mQa2KTlScFScVsnkOOxaI7Gqmq79CYhTjYHles=;
 b=ByJTSxPWm4PQmuOTuhLfcen0dMviDjTkWuliiHkUyKjtyfRWns+NN7upXrhzrvSjbSzoOhx00uCJXCangFznnlB9vrr7XOCR9akrtRmHXVMbZikoraxLmjn4NTzYoepEvBSC5A+jwv9LjZU4yp2t3PeuJClarsLsMXeUvE8ycJKGRiewprt+Z8LEdiw30uh2k9e2CXPzAHic8YdsXyOHCX6FuRpEFZFN7V4d2NDKdiZ5q/j6KLBio2W1bysjAX8uqn1e1P7TY40G07Q5xQ9v2I2Aq3CqJzBkmrLj08qV3u4Fl7zqsFlQuIpz8mPmIKKsQHnxFV44RTsPj/CKyxpeDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA2PR11MB5034.namprd11.prod.outlook.com (2603:10b6:806:f8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 05:07:37 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 05:07:37 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Pottumuttu, Sai Teja"
 <sai.teja.pottumuttu@intel.com>
Subject: RE: [PATCH v3 1/4] drm/xe/mcr: Use Xe2_LPM steering tables for Xe2_HPM
Thread-Topic: [PATCH v3 1/4] drm/xe/mcr: Use Xe2_LPM steering tables for
 Xe2_HPM
Thread-Index: AQHbC6I/F1uKsxlSxU2M0zjBOMBPo7Jk1aWA
Date: Mon, 23 Sep 2024 05:07:37 +0000
Message-ID: <SJ1PR11MB6204E640DAF1A2A28AF4D41A816F2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240920211459.255181-1-gustavo.sousa@intel.com>
 <20240920211459.255181-2-gustavo.sousa@intel.com>
In-Reply-To: <20240920211459.255181-2-gustavo.sousa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA2PR11MB5034:EE_
x-ms-office365-filtering-correlation-id: c2e7e073-b559-4aab-6506-08dcdb8da430
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?9peBJjk4AWQTtnyxd/UxsWblrvuRrz1oECpLfBQ8CCt8bCN9C+o7jGwf4hjS?=
 =?us-ascii?Q?Vjhbn86GV7NK0RsK28e9lfvUSJ3Vq9EaMK2m7kErjxh21bKorLMqx9IGj4lJ?=
 =?us-ascii?Q?R6rSg+nVYBLtwIGA2+DM3Op0nsAeMYDUmKysSl4T6nhNE6G5/e3uqW8MRfTt?=
 =?us-ascii?Q?TAxk5SwEpoosc3tZHwF1pkRo1fZnOAIN42HAHJvvEttsmR9vbHDJrwQ2QQa3?=
 =?us-ascii?Q?6xhtVfcJXv+LPQFkDmHmHpojXJrr4685cevvv2ZxdWKlPMjtaIulbpkPfheo?=
 =?us-ascii?Q?6Sqj7u7pOhTt/lwIjy+Xb91Vttz7QHfiEAV+LQ6QkF0BDntPDC+SNAqD7cWD?=
 =?us-ascii?Q?goEIwIDfPR4qTpimTriRA4pMSwsDw67h7+LW9cZQ2f9BRHb4zVVd1atfNq2F?=
 =?us-ascii?Q?Bqs4HEg90utjVmkYgf7kAS5bqRCjlMkujN/cHrc25II9CtvPlQs9f/Tm65Ky?=
 =?us-ascii?Q?lBreVZqueNBOCbKlBA2eJILB+bch0isdX3cJTh4K7kI6vAe/OPhhPsovORZ4?=
 =?us-ascii?Q?xoNUFwfO/b1rT5/ivAhy1wr3zHpPP2it4cgXX4Qrj27DfOQtSItU7xLJF3eg?=
 =?us-ascii?Q?D4B5vzZ/tElydb7cPP1yiYMk2IDEoj36ePpYltlONAKvFcg74pJuRhJG170j?=
 =?us-ascii?Q?qpPvaFdhKN0TYaZss/tdMGzzGmcOZieUwO5AZc5Wo9vJfaA1Rc4/DbPWJpUo?=
 =?us-ascii?Q?3ZAsQhX63rb22aY9PSErL4r6zFktG/HRMln1oIo1b88LQYLf8ky7vxXY80WA?=
 =?us-ascii?Q?zREkzfCuV2rY+h6f81Hh4XVbWIiLb7k22BHl2P6AYjJALdwuLbZcZPMMzN4P?=
 =?us-ascii?Q?cjM7pINxgIhRMaooJ1P2GtB5LKBPxdBL7Kmaer/qhOkYSFK0uarjqWgKLVl2?=
 =?us-ascii?Q?zAs6cP9oi2K1fftVIEc3GzN0Z0rH+qoXFOQtWlp80K2N48XZ9WzI/JFPwXNz?=
 =?us-ascii?Q?nTs+ER7wNDAyJ2BrajBeprvCYf0IYniVYB4telQ7WdoatUqemozKYJwFmDf2?=
 =?us-ascii?Q?1Lg2Osk0dFtcJC1JDBOyGuDj2rofe56Y19+JgmM3t1g/14S8snXoPJG1g6UA?=
 =?us-ascii?Q?1ap0X3BO0M0uDemANG6fj6BPX2e55TlLxkKuKvG1z7+XxYz59Ih0A84iM1ed?=
 =?us-ascii?Q?dI1N4EJ1l35mmXRVCT2kUqfzOXOTQYmPfFfjrtqhxgGFVeNuQAlmdRNONm77?=
 =?us-ascii?Q?fqu5sugo/9R5zeD/Gzq70Py2G+NQF+O7W4i9kNbw//h9+m86wfQIDVVC0wl8?=
 =?us-ascii?Q?lFdzucINFAS6AqJ/wGFohGBuWXPL0uJAJ4Ds8xKuxRnx/hXpm4rnD4DXn3rX?=
 =?us-ascii?Q?7E1CxMcxz60+L+F6+wKwMqx2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RueOyz4/dtnmiyrgDvbj265PMUYqdWG+ZzTpDY56vtChzO9R1Mq7Hm2OFssQ?=
 =?us-ascii?Q?WSiCEa/Wa5pYM8XSm9reizAEhS172/NpMU/QnJzLbM1e/GF8FNdi0eYEhmxp?=
 =?us-ascii?Q?EiViwdh0J9zfX6tPxRgO1LYTorCqDq5U7xsR4uAXlBYiJjlVcsGxDE/TRWQE?=
 =?us-ascii?Q?x+MzvWa1s9Ilo4CgFmu6j5z5gleFXGN0zCfyJqUWK/tnI07LNsTVUtB3H+1o?=
 =?us-ascii?Q?dK8j5YiF95HBMeajFweJY2NnquBvlp4PmxriI5Y3zgUO3aQLBd9Xt9uerJaq?=
 =?us-ascii?Q?qC7DMmbDjwXpuXEi7rvz54ixMiuBZ8G65MKyV/YvbPlwiYva5lTPEYyWzVDX?=
 =?us-ascii?Q?TeFNEOv/JEPrZgzriZScuaz+im9x8g4Xwfw4981yKqCXhlS1rYPR+pCHM6tW?=
 =?us-ascii?Q?+CEXYtOATtHkG76P6fATsDuFu+CBOhyPbMPoCUur224f0GeIAi6qof96IBds?=
 =?us-ascii?Q?jPWhzjqkZs/GlmpndKEIIl8a1LruV9nRfopDhQsp/5TBfsjS7vnh1mwQfnWo?=
 =?us-ascii?Q?V5iEpZ3Jx0YyTeRHHijtcgmzkUNZpeapEQzQSBKYcKQR8U4bC0alipJMP+zi?=
 =?us-ascii?Q?UQrmr5pV58W2QOAqB7esr2YsFls/kXUwGdg7j8YHvfuMo4wzb8FCD0fhodvg?=
 =?us-ascii?Q?j0mnI9NDzmTVZH0zhlWErGmpw7i4YpuAPe3jGDUsuI6oed8wkFXqidmRdBbZ?=
 =?us-ascii?Q?508cF2rbEacI3cXAkqlCabfI5paZOKtM3Pf4ZmduPtXxD0M7ExjVTNIi5qxR?=
 =?us-ascii?Q?3ilZyaXAPf80Oyio/vDr2rmLhKsAo8hIBirIBP0dpI/FdDzN5G5sghcdVVaa?=
 =?us-ascii?Q?STm05u0H9DDtoPWVuKscQ4GuGiCS3IXG126ivJJ+Uyc5Xh2CLn0npNNcDctK?=
 =?us-ascii?Q?Ny/gqpSQ/HQWdRRCjQk2YT3Q6IG9Jgq2gqGlepDpsjkuzuPAvzCq7nHpQHNV?=
 =?us-ascii?Q?nNeu2lmyjaUbphKR+eCvAy6BWLV7tc2elFlzm+K49jmuc+lnmHAgX79pw9rh?=
 =?us-ascii?Q?4SIHQKLVm94bucmUyRbUE+euVtITuJknTDSI/auwg5JAx7mjNocaliXRGXNN?=
 =?us-ascii?Q?CqjiSXhBdxZRHn2ZI8xpvl7R9+YFQxsodB7n6QWCOFuxFzi4CI92IvI0kb/L?=
 =?us-ascii?Q?bPDmfiSlOEdKZ7Xe6Z3VL+jr2fOtZGI95VQKa2TXbbyXO9YKwnRyWBIGxyTH?=
 =?us-ascii?Q?B6pqwUxKP9N4wgH2CXRlnONlQOCLeUVGy8HA0/wkxUEEu8rYnqNvt8/gPk+c?=
 =?us-ascii?Q?xtxYAXFrPU4vt0Fft/jXmypvI35L+d5vY+I17kZcQJH4QNhsTLsFbsGpLve+?=
 =?us-ascii?Q?UxL6avl2CdcVGPZ4HlsdDbEkPFypsok2lzKozNN2e8WKBURWqd2LnLVlnpLP?=
 =?us-ascii?Q?GBiQI411VdR/foCsw1K/4eskvoqxJk1DVSEDZdAqfOZaIHZiqoy5CidHwBLR?=
 =?us-ascii?Q?fTOtL0e3lhI2ZilrCOOAwtnWX5aQnW3XC8ZVi98KhiYAn5U20vuOo9H/7hui?=
 =?us-ascii?Q?uoic/VXVbMZXHkPvGecXgnRtzV+8N0ERAKQ1OSS5tGMrNr7tTHL3/t+OWLvi?=
 =?us-ascii?Q?bLZXiul9ShRsa0AlfmKEtNoMx/EMJ/IL4HPn9Rdz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e7e073-b559-4aab-6506-08dcdb8da430
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 05:07:37.1116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPoGVlDZmaxmFKBso10iBrwdv5ou9aVIL1bwWvtetKmJBOZ9P10HEqox5BMbRwlGPPWvdV7x3L8PXDgy0SloCtAYny+hwbY3EWErTA2AdPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5034
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
> From: Sousa, Gustavo <gustavo.sousa@intel.com>
> Sent: Saturday, September 21, 2024 2:43 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Pottumuttu, Sai Teja
> <sai.teja.pottumuttu@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH v3 1/4] drm/xe/mcr: Use Xe2_LPM steering tables for
> Xe2_HPM
>=20
> According to Bspec, Xe2 steering tables must be used for Xe2_HPM, just as=
 it is
> with Xe2_LPM. Update our driver to reflect that.
>=20
> Bspec: 71186
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mc=
r.c
> index 2671ce6b1a76..4c0767403881 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -441,7 +441,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>  	if (gt->info.type =3D=3D XE_GT_TYPE_MEDIA) {
>  		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
>=20
> -		if (MEDIA_VER(xe) >=3D 20) {
> +		if (MEDIA_VERx100(xe) >=3D 1301) {

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  			gt->steering[OADDRM].ranges =3D
> xe2lpm_gpmxmt_steering_table;
>  			gt->steering[INSTANCE0].ranges =3D
> xe2lpm_instance0_steering_table;
>  		} else {
> --
> 2.46.1

