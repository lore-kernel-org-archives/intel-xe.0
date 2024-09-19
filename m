Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3698CE8D5C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 08:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B09910E29B;
	Thu, 19 Sep 2024 08:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbeYPymd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7379A10E29B
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 08:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726734176; x=1758270176;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7jERpotTKcgDrpLadXraWjeSC1dYkWXCoiD+1llxWn8=;
 b=cbeYPymdhgkTa8c11COrWoK+nB3/CpXjs2LX8IAa68OJiSx95c7lX8Yg
 FdP47kyoB/t1CUy7JngGWbnPrULODo3vKq//Aku+M7SjcMuDo+XRtPdCG
 osyUINdSSuPrx7zspO6mhUG0d+1cLl1MTwJo9j0Jw5kBrU/Z0JENfOaaB
 R7ojnAbvZhYzCypZbviGEFwbaK28FkLtEknWyJ4YsV7o9DgHzQRgfuAGF
 56VIrWj7HCUo23BfHcUSKue2mDk43UihWcju1+0Gj93034urEV9C8Dwge
 TGd/inec6ooiEb12Jq/b1QQLT8G4ALpNeT8jVDWtIw3TRqZr7sfPgJRVJ g==;
X-CSE-ConnectionGUID: XBr7MdbERom7t62eImtsTQ==
X-CSE-MsgGUID: oYN9BHrWSA+3WSWyQxx9Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="43149891"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="43149891"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 01:22:56 -0700
X-CSE-ConnectionGUID: SJwT+U5sT2ytw+yISKv9kA==
X-CSE-MsgGUID: g1LwFxsASciKRLcpX3l7Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="107320959"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 01:22:55 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 01:22:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 01:22:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 01:22:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQZfu78GTWvJS7/kKCkftbhju+I6bcgW1FtU0hhYAnAlxKarS1XImknc6eNGGErKM0AU6G6jTUDQSVyF7TQnm/Qgf1LMEeC2fkvX0YmB7Kaf6+Nn2xhAPy7XPX0NLRbu/gua1xPPfBy26hHdrlqV9Rb/vM4T4Qy5tZ9KSS9lGnt1l3JptAbkorE9uNYxhHQ+wX0zzUwOreXzN5+5comOu6WUx/0un2QeRyjSkmP6SvfT8GM5Tqot5KoBsVC/VnWR9pMyblSRyfApdfOIDVY6h4JW9VTREkdI5Nga8XiNGUKqhkt+Gw8YOlCcDuknrNmw9YLF2YD59eBmJ8hFrTqiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtdv/Qn/66cRyAsupQcF7qHe4LVD4tPVxWwTL3qp6SQ=;
 b=jrsUETTFszISAMWKCy1XzVVFo3FjMkdjTSoVG9YDcndU30gSMrM2awafDagDcnF6IHO95z6rcIAt0dGkbJEbm+qxWP7bXQK1msqfplbYqxi1AcTQS7icHnZ3iv4fVVYciteM10vY+YuWRU3svAA2G8A0QtOllnUUjt6Q+he/vjlyoZ3etlleXErOsM/lBk6o826Q547Yeg7nXERNv97CXqsg0w2rQu+n+mmx1YMZT8rEFFSqVjid7aRCNN9uX5btbRcpJO9M1+TKFLNieMf+ntbkGG0kxP81sapLPp0vB4pkZmPu/Dsbs54wCls+Kvhw+HtpVxuO/xJAXocFn4UHnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB7568.namprd11.prod.outlook.com (2603:10b6:806:34e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 08:22:51 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 08:22:50 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
Thread-Topic: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
Thread-Index: AQHbCgwwBIknbEUWrkWZw6M9a2LZrbJewvcQ
Date: Thu, 19 Sep 2024 08:22:50 +0000
Message-ID: <SJ1PR11MB620488E5BFA1FB516114662E81632@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
 <20240918204830.49880-4-gustavo.sousa@intel.com>
In-Reply-To: <20240918204830.49880-4-gustavo.sousa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB7568:EE_
x-ms-office365-filtering-correlation-id: 1d2a9e4f-a125-4a27-8727-08dcd8844080
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/mjoR3lYnLLOslKUPBE1VSkIKiJINutC1ChzW3sZc3LcH5UjhRGrzV/avuIU?=
 =?us-ascii?Q?4t7G+Qa71DJeVz26Ha8zTMc5Q+rWgVh6KtO+tCuKqnLFoVWX3Z2cZ8wyZN76?=
 =?us-ascii?Q?gmauvoIAMiW8coEJlnTTeTlMTaGhUasNI02EUMigSOjJMlQoxpa/ZsnZdHvc?=
 =?us-ascii?Q?A7E0q/SQzD4CnCGJjO2A4qv0W0WWCzSmREtfZZyRCPHUrfCnvbsQN5MJtEQ1?=
 =?us-ascii?Q?kutkGPY1Hi3A2KtXd4VRdUWl9H189P4fe3pGkgzHiHLQ/r7WynAeNIfcsbA7?=
 =?us-ascii?Q?4G2NtZhFZVPQR0DwMMx2beNTRKJ/p3+l5/dxB7olle3Qt3CzmfDR8HsnBdGw?=
 =?us-ascii?Q?3sgDPDTdfICx0ecZfrs6SEkpnWEDSlx5EZ/v9ZN7Q/vKd3opBTEl5s+Mj3Wu?=
 =?us-ascii?Q?3Yj55hhku5+PAP3CRA0i4OPv8WWQAxp4U9gxfF7AG6addmxMf+FyG06RBsp6?=
 =?us-ascii?Q?o8xkJWWl0iz5I+lt55Su1ftxpxDoxnR/jWB0bMwA5nzjJ1DAh/rMvZ4trbn+?=
 =?us-ascii?Q?pV45Dzc/LpsZzLdL4nTFaOpEcFkI3eTvPg4NyOjmy9xIjXKbmaAy5dwZF+x6?=
 =?us-ascii?Q?84jfrJBgyAO472pmdaOCKTO6YAiNwvieFW45yzRDERJh9GuCnrJyt4LEg6z+?=
 =?us-ascii?Q?+cbnXJLwxjB4SCy2L6YT6J1yhB86T0ExDF8j/Rgk05nY3aidvNSjJtzznzUf?=
 =?us-ascii?Q?zTxzfw52o1D9sJjkQG9/Wyz9kHeZu+6xK/H5mZ0HxLLn9tnmcwF7Ih62HWDs?=
 =?us-ascii?Q?CXDN9XK+kUSGZq5P0gFA642s/yjIzR/tZoBm1lv1OfdeZ/PyDGjMgJqN+/TH?=
 =?us-ascii?Q?mV0Htc/c/uNL8wlmvcOJshUutAGg0onuCTamZDZN4DarGn8ec0FnoFQNQaJ9?=
 =?us-ascii?Q?2wXZAnyV1gYEsQuUTQ4VDXTD6ozBZlM1cje1tHfP/DG2LlXe4wBv3iMbR20I?=
 =?us-ascii?Q?8Gtv738mbqYNNn/MAFaylElWX4pizoqiw1wkeUKRu/6DyCsumB6jwuoNPot9?=
 =?us-ascii?Q?REiIvXDCxQr7F1oCZh2Pnpv8TQ0L9LviRKoVrYv0dRYBGtSmn8MkjP5sFhQV?=
 =?us-ascii?Q?MKBmsbC5DEpdyMnu07cIj3NIELJoJMwajTVk1Tgvl2HWPgAjD68OzsyjZlHF?=
 =?us-ascii?Q?7zX9ZK/gyAwrZtoEs3prr5x4CjFRhCf7lPLdL0eA07pJ9/OxMgO0gdt8eBZR?=
 =?us-ascii?Q?jdTn53hkULLFJi4giehLznx1nYFB0zh1EoEli1N1oEePTs/bK8YDNL6KVDzj?=
 =?us-ascii?Q?rzV8R5D1MrXAzZaxno815latOBDvxGMtC2gNZDWvGRi94cOo9zzfVPMoWkWz?=
 =?us-ascii?Q?poyzBO2nwaFOEpZN9YwiMK/eAx/ca8lDvrxSJ7KdcZ4YY0Pu8L+luMa0M5s+?=
 =?us-ascii?Q?djVO/d95FqYgs40R9Mn7iu2xfIO6pPn/DQ6+SY8A/+QPC6DLig=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N5p4odNZJmaip0vObfV3jeaWxnWD3QhhJ8uXtZtCLwaNs7Z/9tXYDdyC9/UF?=
 =?us-ascii?Q?9KWnKlWOv9bSPhWkX1QDQa9RBVmW9tzBpl2nxZ4eIw909uoV3SNp7oVN34Kr?=
 =?us-ascii?Q?ysrwQC13la3XEVnlrQBQDlrmx8Sw2J3gH+4yKd4Xp9q6xSO2VEW748FyVmUk?=
 =?us-ascii?Q?BMlnZs5tD956RosAoee/VhNh2y/iAatl//r+iQ0FON3AO+uM6Tl9I+xzEMo2?=
 =?us-ascii?Q?aU3GipYp4oOFN4kmDlmt/FFm8M8d0yDAW7D5FJlHdGmSR8Wuw+pHVG8sxwfR?=
 =?us-ascii?Q?N1a5ftrZ5+ZbXfJS2de78lQ3Vpd5x5u/227wUnNLzmPhu3Ac1OA+MCJP3ET6?=
 =?us-ascii?Q?R1iA3YSciuld2UczJxzGVlQBI3RVIt3qOsQYvadG9N+JG431OUCQNaQGxYnF?=
 =?us-ascii?Q?jS6Ak/04BRtEXo3c+kVgCmkRFRfFZjybeeAKo89puLZK98tgzhonHg3JiBJv?=
 =?us-ascii?Q?62oeImjXk2DlwjW5bVOtwvIU76fDyN6xq3T7pMeciB0DyiZHGF+PLCBcO699?=
 =?us-ascii?Q?TGtcpOtJc/AwJFbKJGiO+Vcf13Lp0UlusDbeFdaes082iDn9O0uy1mBq9y7v?=
 =?us-ascii?Q?qjvx12Jcch2bs1TpM97FEXy94R5VladkkT0vGc7nwv8DxIbJwteqmCUEu2Vr?=
 =?us-ascii?Q?yz4c/K4zBNpjljuukDcqUMJiKLBNmpizO0o/QOqRt+JTFtxdO3iwqmQRmtTZ?=
 =?us-ascii?Q?sy+5J2xrsj0eGCk3l71PWJxNqmfMndC//GJDdpJgQ9P/ZrDA9jCz9NRry7z+?=
 =?us-ascii?Q?xjPMUpcE0d9Crer6EDM6NTvIqLAml8JF8xFYG69kEhO+RLtjvJsa9y/gU7jc?=
 =?us-ascii?Q?2vkuy6QzdEBztNPXMvZQfNgHZrTjMpULTWiBDQ+UwcH/Qes03+1+37g2LVKZ?=
 =?us-ascii?Q?fMMWOg8GXUf1L1bNatJFkzyP/iB/HXJNsCiLrp3PQm25Xef96j25XpwkBop8?=
 =?us-ascii?Q?kGSFACtW1eSctXwYHYebPwL6C4wVMP4W/7ovLytGdTzXhCeY31imSq48GCFb?=
 =?us-ascii?Q?V6MGEew8C7nxsaETl1969mnnxXpfauQOzRp+My4Bw/cFa0QXPCMm/wPmwcFe?=
 =?us-ascii?Q?paZNFxV1AQ7dHiLiq6/sME8okJsJQm+9LJsFTZ+SXh/hmqZyaXgb7Q9MwkAg?=
 =?us-ascii?Q?LA9HDJ380gQoVKT+t34x0THpq3Hrs+wm+Pp+aYM7HNCaWBvw/i4nUOoUH4hs?=
 =?us-ascii?Q?etguDjwfD2qK7woGw9eRJQ4VCy/t8I8YA+Lqse29oT7EmuVjvi/SPNmTCIl4?=
 =?us-ascii?Q?2oH6mioaxaDTITqUkl4iyxU8lKSQvo4s4gaAKGM2wCpYr7QkyVa5gqTLRcSK?=
 =?us-ascii?Q?DLATg0PCGp3ittM1M2SI6/2peMhMZwEbE3J4ax84Ni3t3ibZpQ9Ge7bJ2NFt?=
 =?us-ascii?Q?dVSpsstpDhw37JJd2u/3mt1r7g0UA3q+w4eqC1DkEPOTmp6UYIUfSISNshHX?=
 =?us-ascii?Q?YV7CcVfVh19315kda54bYjfFLnzJqYB/vxMtpYZm8ddNmjyD3yI7frl84fxr?=
 =?us-ascii?Q?KxYrShDB8uaWkHNrY3sifppXpdqSXxGmqMStxk+CYYLlXHZlbxnMazNiLjpt?=
 =?us-ascii?Q?Ip9BhPXP7DfiHXfTxMCJ24ceaL8maTi1xW5m3f0E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2a9e4f-a125-4a27-8727-08dcd8844080
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 08:22:50.9010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YB5f+70wZbLCRJ1yUOt8Yn/uNM/LBuMhlxGLhxQDoYQ/DMuShb3UricvpY3OCcGiKznxN+JKloSyN39qecTtGsVQqLQxInnOUBY9NaEV5yU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7568
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Gust=
avo
> Sousa
> Sent: Thursday, September 19, 2024 2:18 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
> flushing
>=20
> A recommended performance tuning for LNL related to L3 cache flushing was
> recently introduced in Bspec. Implement it.
>=20
> Bspec: 70821

Yes bspec needs an update.

> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
>  drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
>  2 files changed, 13 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 6ec2d2c11d77..ccd18cdd5b50 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -389,6 +389,9 @@
>  #define L3SQCREG3				XE_REG_MCR(0xb108)
>  #define   COMPPWOVERFETCHEN			REG_BIT(28)
>=20
> +#define SCRATCH3LBCF
> 	XE_REG_MCR(0xb154)

Please name this SCRATCH3 only as bspec mentions.

> +#define   RWFLUSHALLEN				REG_BIT(17)
> +
>  #define XEHP_L3SQCREG5
> 	XE_REG_MCR(0xb158)
>  #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
>=20
> @@ -406,6 +409,8 @@
>=20
>  #define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
>=20
> +#define XE2LPM_SCRATCH3LBCF
> 	XE_REG_MCR(0xb654)

Agree with other review that we should name this MEDIA_SCRATCH3 for future =
use well. Also this does not look to be MCR reg. Please double check.

With that addressed,=20
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> +
>  #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
>=20
>  #define XE2_TDF_CTRL				XE_REG(0xb418)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tunin=
g.c
> index f62622f0be85..4dd77b44ac82 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -80,6 +80,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D {
>=20
> XE_RTP_ACTIONS(FIELD_SET(XELPMP_STATELESS_COMPRESSION_CTRL,
> UNIFIED_COMPRESSION_FORMAT,
>=20
> REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>  	},
> +	{ XE_RTP_NAME("Tuning: L3 RW flush all Cache"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004,
> XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(SCRATCH3, RWFLUSHALLEN))
> +	},
> +	{ XE_RTP_NAME("Tuning: L3 RW flush all cache - media"),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000,
> XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3LBCF, RWFLUSHALLEN))
> +	},
>  	{}
>  };
>=20
> --
> 2.46.1

