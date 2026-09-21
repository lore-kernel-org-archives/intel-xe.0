Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3654BC982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 07:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E614310E4CF;
	Mon, 21 Sep 2026 07:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODla6ZGK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC0810E352;
 Mon, 21 Sep 2026 07:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789975516; x=1821511516;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eXzyBkUPz8zh/kOlBod8I3rEOFDDae85AWRQfuHDUW0=;
 b=ODla6ZGKdvi9c2SrcHueq3HAy8a/niQ0MAGBTyMJtVBp/gO8Q4ObICgO
 rSVjknGLV5f03f0Bjo6jpvBlO8CLb/5mzzzEk42xrwW47ltX9lVk8U5H5
 2uKYptAUO6gXs5h3+JfsykRpSQHx5+km9U+xKSXCZ4VZH0/m+33ISQWAl
 7aRuX5RlpkpKwW0g5u5EvAeiSoTe/z3NopoP2aAg9Ys8qAUCus8F6ZmKJ
 iw/xeYwhlhOPg2SpmfV6l1ewIO4i+ZpnfoTqiOFoPNxQlGwdoPK0RNAzG
 EH9RLVvdDmryqQN7YfAL1jXv8cYOE/v7LgRFM07p4tHTPVMukbs5LNkVn g==;
X-CSE-ConnectionGUID: 5uTK7wBeSuaoiukwPU80hQ==
X-CSE-MsgGUID: jG51Vs1cS1estQ/MO3okAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="107974064"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="107974064"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 00:25:16 -0700
X-CSE-ConnectionGUID: 2UvGRcy/S0eqdygWxpvPdw==
X-CSE-MsgGUID: QJc2FTPESjeUCo8AKh8xig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3544069"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 00:25:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 00:25:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 00:25:15 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 00:25:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm6VVOa1VtpxZbN2mxtemJhK780rrEQhpgNz3bVeDumOjtpAxp5PZ2V/rTmKaZ0KN4QHhq9bYMOX+0ikcttnU8ZBMwjbsHQUyyNdtMRLPA5kLYQy7/0iZkh80LlD4y25QZnpk2O6WNzMxjqgTUJD63H01Av0o3Y/4ZElcLJSIFIdIkdG+90CmHXZ71rM/ylWDo37IgaaiBBNFS1k4rBjPzZjmcdvcAZb9/cWGQSg48GpAvPZIfcZRRR959DCTIUTvKD1h+uVjsgL0F5F4K1y2/fxLy4nlxmT5MPhGnDEt9bk2GpIDvLn7OW5Z3UCCL/WikN2qTn+VcBA2cNxtTNdAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHodk5qpN/8L4+/mSm+1DcHAi8O+eu0bK1YIxnbi154=;
 b=QYphnt9bES3Rx29BsdhmqDQHtgB2r9Dqb1NiKGW8qBkNTRTJxss/5k1cuCL0EHaeP0p7tmzX66XO7BF9ulkABH/W8L6CQp21lgmzbc7UtCyq5mIuZz/WGJiY48Kd9ksBKZTpe5edj7ot6J/NZBXbsTYeKd1YgNVaxoLXvHHVBXfcAUZ0/79tPC2zhlcW3DVFXplhAxvys3dBsVpY8ZcH1WQKfNzdfE/yBEncnzaclcHo6U47qU8qMKb6fJlzKp71ax0I3cY/0wG0RhEGoidfCeu3qq1cjYe1LQJSlZqDeX5lI+0OLRbHwzrlihu3d6PqYdttFifxT1ikXCnC3GM59g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA0PR11MB7211.namprd11.prod.outlook.com
 (2603:10b6:208:43f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 07:25:02 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 07:25:02 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>, "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH] drm/i915/xe3plpd: Map AUX power domains to DC_off
Thread-Topic: [PATCH] drm/i915/xe3plpd: Map AUX power domains to DC_off
Thread-Index: AQHdSW/UQB+FfTPDCkS4cliDaEAitrbYoZSA
Date: Mon, 21 Sep 2026 07:25:02 +0000
Message-ID: <DS4PPFE901A304F185E6E6D4B365612BE75E3842@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
 <20260921022016.1525322-1-suraj.kandpal@intel.com>
In-Reply-To: <20260921022016.1525322-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA0PR11MB7211:EE_
x-ms-office365-filtering-correlation-id: 9019b98f-6223-46c5-8c1f-08df17b17364
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|38070700021|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: /bIsOvlV/qQXEAX+jP8KDVn1MENUDjIcvs6dHsuhz3khHQrhY+3yr2BrD/2+RL2QRYWcQRtzEIuO8VJukBiQ9ZGpOg5NnIAo36WCpnCuQ37eYqJZL8OIKqbcVmB6MfwGxhYg6tlO8Rp/F8xV3OyDpqGs1FxdQRTRfnJCqoDlIcp6fo0Wkb5p/KxIOEMcaRqfSG5I2UBCtK6BNzRJq6XLGVsLwNY/xZExovW5si8Vfd6yJvu8/HmwM63vPmYZQsqWE8CwzriwsaKQqWB8Oqyw815ZX1dsnjJBZREB8JDBsO7C5ryygDtFh1BpYzJc5RJ21ikqoFNLsdYQ7sgWTRtviUNuAhVvNmQQHfLmhOliTYd3BxGj5uf8yP7N30WE8ln3Nx5ENE2JP7Sncx2EvEHGrekOxSAwOQUkTL3fvbYIa9vQG3uD2zGWgFmMLqAuI4LO4rbYLgxeCrFTesafiMsShg4KmOzOHn8mrooZz4iVFKY8wrTdWkX9rX++rZGQfAPMleY2YzV8o26wxyI4M7krxOyNeMbEKcBjv0esfKYO3l/H2Y7rz1/Un4u19WNkr0F6ulsK3RkEmaATTJnKdBphm/ZpltoKLAqmRycAeDYXAOG0ObhKcBW7zjiZQxzhhCUFh3XtuM/g2Z+12HfXAB/juviZGnwCobZz8/lQqX3E8MXF9Pg+9WLBIHtb51N2LFOPtVLZdBRHzvmYIifhXEpwrB+Y1XLDR6mkYieTLFP5ImI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(38070700021)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wZ1QqUq54mYFfkYG/szLIfkjvght+6Dj6VU4/vewzCbivF0PSaa7HVGSo+tk?=
 =?us-ascii?Q?h+uZQM2JsePs4FzOIoYN7bnEHA5Pg5L6op51LTahMMUM8md8CGDcwJIUkXJR?=
 =?us-ascii?Q?5zo7pyCa264p/WcRji+dcK2kQ1Khwmu4VN023vOSXwEEGyGb3S2ZD4yjRCXV?=
 =?us-ascii?Q?8XOvP15yOct0oWTXTjxzCxvQMZ8dTdTNz+xw0cN7lRJyQGJicLABu+rFwp/I?=
 =?us-ascii?Q?g+6LFz7A/nZXOEoFp6Ky6evkUDnwmNi6mlRWJp18pEBRMLteghXOPRMej5Gp?=
 =?us-ascii?Q?s3uVZRyB+8Q1benI8oRlMZYNHOtbqLMaq8TpGSaVH31BU5mZCBwtP0uxGPno?=
 =?us-ascii?Q?KG0ArLN3DXMVDomB2F5mBVGgNEIy+iXHY+PuQErYLhDYFV5kGjso3fSC1DJN?=
 =?us-ascii?Q?2EDhiarqOmRp4/rNSdfRdz8EIRr0WANkKAbDPnOTnk262tq5FuDsAeF9uRSl?=
 =?us-ascii?Q?f114/YEiQl20cP8nDQpI6SqWe3W0bUryEfnrqvjUt0ANSIpECLeZLACg/a23?=
 =?us-ascii?Q?HdwUETS09P0RQDaX4qnfQGenUw7nLsr52izJQhOlvfqE+HAhKT7tDdq8W+Aw?=
 =?us-ascii?Q?X6DScpG0OzC3DfvGJEoLW5rXJy6LgdR6PJChczY5dZTXjlKj7rJEE1U5at1C?=
 =?us-ascii?Q?YgR1qcnhTplYzWYvRu/mfpsh3NMUZ3DqhaNQ9Irba7aRjV5/OH/B5vMFokr4?=
 =?us-ascii?Q?AstGxUeelhg+q/DDIS5qKm3ohW71Xn+Ns5P3F6gzy8YIlEZx/5mgmD/S5ASI?=
 =?us-ascii?Q?OgnVX/uSMinEZLD+WFt02cUv2pXMFrD9HRkibEVkYt4r10B3ClS29dnUhoP/?=
 =?us-ascii?Q?bV51nISzRlKEKLgW1HkCjGpx+5biGPL4Ge6eWcUetC8c+z+QeUYVHJ1zZzqX?=
 =?us-ascii?Q?KfYY0bg9kL4JyAZ/kT7vQN1AMpe3pzUCr2dTmyreeqTBLe3kB9YNtGh3Tedy?=
 =?us-ascii?Q?EFW4Im9B0nPR2eJ6Rlp8vpNp7G9RRtkn7Ou3AMSASiLViYtkgLaUAXu2NNNW?=
 =?us-ascii?Q?yZExNWk4bPLVwTVZDl7Vgu5QVbFvZNJW0GPwdI8QVgul0blFR6F8Y/z2Oj4N?=
 =?us-ascii?Q?384R9qC0t9Undd6dObiSr4e9opdi8V3s/tEYEqSHYMOxmdEGOY/BuK0Zflz4?=
 =?us-ascii?Q?aFiZRNW9g9bePh1+O/uWDSYuFnb5V815srPsZwRHvHtWWmuljI0OloqcHxb0?=
 =?us-ascii?Q?CGOJlaBAubuxmgsXjhVGNU83dnG6FvUEpG4zuLdZvs1Pym0bbLojd69DAtAR?=
 =?us-ascii?Q?ldVHh/pabvMFjihE0vGImMG4fTW0xFlS8r3Ua8hFX5YCq4Mxe34s+fyGOLVN?=
 =?us-ascii?Q?aWpsRxXStqvsXbrP3SU8AUIq7CAMhOX/ywirea6YABBJzlzA4SvlKm9F1b73?=
 =?us-ascii?Q?Td8HSh/RADGvvy309vRDqgClZS0KI7iL3U2qrKRw+PQ9I29TiXt2u85GukTY?=
 =?us-ascii?Q?fNArZmfIwL7llRlW7j1F14HTl71PUBn6VB5uo1iUOTc1DtugddbBEfXf+oeb?=
 =?us-ascii?Q?PeaE9nLxci/9TM4t1jt0ctQ2B0n2yn8K6QOqE39QlyF/oYOp2iWRbmWAfeUA?=
 =?us-ascii?Q?a1BdHRncF6KUp7F6y8jaMMJN7wsLPA0Ai5wLkQrdUG9JpLTYFY/56c8a5Rbv?=
 =?us-ascii?Q?wtj2F8jAjt27KDTLbrHl6qQUtnW9DjHFMmicZJyo9vc5uec3pITY2QcAY4Mt?=
 =?us-ascii?Q?bQT8aqisNYrWDD3+QTOHBmoaLVyl/fdIpQxWI9ffFZtstdEsNvWd5ySg2wQS?=
 =?us-ascii?Q?cGb44OKxqw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HE655g0YBhJtryP4rC8PjLoTFcdqTdo1ZdJaCnFfOFPoWlsLjDSyYISnuBKw/Qc4dVIepOC3d9aoFmtnXrMF6hIzYygHD10iP56jAmY2Sa+RB0Gmx+omtSr+p9eqBP9bRN241GTIjk4AuiD7sUOi3rr2g0hppHcavdD/pgNWbr4EjXam3CIZ4EUwbVDcw03rH8BgyEw2oR4vADGNytdAcf1ocJWKNv/+6IJh8qWWYfi10WJAVzYSlC346YWW5hnMgxyf3flWfzSvdfllNV4G1JKnS3w3u8YFX/qXoW1BtIjfOWmDohrj1hW9EYslX4Eo5Say3XAlYG7pkr7IFb5pbw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9019b98f-6223-46c5-8c1f-08df17b17364
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 07:25:02.2218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Uuu+9ZU241C7Zu+9YPr5NDec2b9muUd/0ABOQoywWXEGz3TPfI9Rew9ONmEd6P8Iy3G14GLo3rSXdFPHqDgUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
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

> Subject: [PATCH] drm/i915/xe3plpd: Map AUX power domains to DC_off
>=20
> From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec for
> SNPS PHY Aux will be always up. But from Xe3p LT PHY was introduced which
> powers down the PHY. Which means we need to make sure "Disable DC5/6" of
> AUX Programming sequence is honored.
> Add the AUX power domains to the DC_off power well on Xe3p_LPD+, so that
> DC5/6 stays disabled for as long as an AUX power domain is held.
>=20
> Bspec: 68851, 68967
> Suggested-by: Imre Deak <imre.deak@intel.com>
> Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
> Signed-off-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks for review now merged to drm-intel-next

Regards,
Suraj Kandpal
> ---
>  .../i915/display/intel_display_power_map.c    | 42 ++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_map.c
> b/drivers/gpu/drm/i915/display/intel_display_power_map.c
> index 3400080d78d2..e18eb49983fe 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_map.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_map.c
> @@ -1759,6 +1759,44 @@ static const struct i915_power_well_desc_list
> wcl_power_wells[] =3D {
>  	I915_PW_DESCRIPTORS(wcl_power_wells_aux),
>  };
>=20
> +I915_DECL_PW_DOMAINS(xe3plpd_pwdoms_dc_off,
> +	POWER_DOMAIN_DC_OFF,
> +	XE3LPD_PW_2_POWER_DOMAINS,
> +	XE3LPD_PW_C_POWER_DOMAINS,
> +	XE3LPD_PW_D_POWER_DOMAINS,
> +	POWER_DOMAIN_AUDIO_MMIO,
> +	POWER_DOMAIN_AUDIO_PLAYBACK,
> +	POWER_DOMAIN_AUX_A,
> +	POWER_DOMAIN_AUX_B,
> +	POWER_DOMAIN_AUX_USBC1,
> +	POWER_DOMAIN_AUX_USBC2,
> +	POWER_DOMAIN_AUX_USBC3,
> +	POWER_DOMAIN_AUX_USBC4,
> +	POWER_DOMAIN_AUX_TBT1,
> +	POWER_DOMAIN_AUX_TBT2,
> +	POWER_DOMAIN_AUX_TBT3,
> +	POWER_DOMAIN_AUX_TBT4,
> +	POWER_DOMAIN_INIT);
> +
> +static const struct i915_power_well_desc xe3plpd_power_wells_dcoff[] =3D=
 {
> +	{
> +		.instances =3D &I915_PW_INSTANCES(
> +			I915_PW("DC_off", &xe3plpd_pwdoms_dc_off,
> +				.id =3D SKL_DISP_DC_OFF),
> +		),
> +		.ops =3D &gen9_dc_off_power_well_ops,
> +	},
> +};
> +
> +static const struct i915_power_well_desc_list xe3plpd_power_wells[] =3D =
{
> +	I915_PW_DESCRIPTORS(i9xx_power_wells_always_on),
> +	I915_PW_DESCRIPTORS(icl_power_wells_pw_1),
> +	I915_PW_DESCRIPTORS(xe3plpd_power_wells_dcoff),
> +	I915_PW_DESCRIPTORS(xe3lpd_power_wells_main),
> +	I915_PW_DESCRIPTORS(xe2lpd_power_wells_pica),
> +	I915_PW_DESCRIPTORS(xelpdp_power_wells_aux),
> +};
> +
>  static void init_power_well_domains(const struct i915_power_well_instanc=
e
> *inst,
>  				    struct i915_power_well *power_well)  { @@
> -1865,7 +1903,9 @@ int intel_display_power_map_init(struct
> i915_power_domains *power_domains)
>  		return 0;
>  	}
>=20
> -	if (DISPLAY_VERx100(display) =3D=3D 3002)
> +	if (DISPLAY_VER(display) >=3D 35)
> +		return set_power_wells(power_domains, xe3plpd_power_wells);
> +	else if (DISPLAY_VERx100(display) =3D=3D 3002)
>  		return set_power_wells(power_domains, wcl_power_wells);
>  	else if (DISPLAY_VER(display) >=3D 30)
>  		return set_power_wells(power_domains, xe3lpd_power_wells);
> --
> 2.34.1

