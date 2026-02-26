Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA97FD9E21
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 23:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51AE10E09B;
	Thu, 26 Feb 2026 23:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="je/fBEze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D2410E09B
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 23:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772147255; x=1803683255;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ml4xuMrXmGTIcsm3fh4osv6cgExqBowffZzZnab2mIg=;
 b=je/fBEzeOAPgF1YkLig9XpX/l4ysMroroWT9AvKuJxlRJOmCwXemjUd6
 K/A5ap9UDJeIHdVMEq7MBauDrVw14JI/kcFcJyME8+WGjz1LvaqApSQyU
 Y0w3dK8VF4lAWeba+EOQFsSwmcCmTJeUg4ibA8X/t9qsRp+ArJvGKYCw0
 Lrq+MzjGVQn0no9BfZ5+7zpUSEFlaxnMMf7oQEECtCpz6bnN7bHaeb9mm
 a0aHLflZ3mXhzeMO5dTl7AYxLypKx4Qw4j1iHPrBMsbn+4djNOI9I5acY
 lA6aVkOEkvsltt3BJhQjfdEm3pE8Q/vr1/TG+GXjjKZ6C2XkglBF9O+k8 Q==;
X-CSE-ConnectionGUID: yyPg6oNpRoqWvODxndgeaw==
X-CSE-MsgGUID: adCsLluPS1uhFx4ENfTuPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="76836725"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="76836725"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:07:34 -0800
X-CSE-ConnectionGUID: ULmlvNkVS32rhR2i5/Qdlg==
X-CSE-MsgGUID: V4D7ex1FSWiFeAf/HKpaGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="215946327"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:07:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 15:07:34 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 15:07:34 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 15:07:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJgpQ2WMZzN3GANK9hZ8nn4S+bI9ZWJm98hCXcng+4VAxARwq0+l70oe/s92jwQjXUUjp/BsUf4qtVaXNFnHulNV67L/bovlSIiD2NF8EiMYw7Y6Wmr7gktUncVBrOwXwEqiZHJIEqxQa58qUe0WCSNylVS11ThHN7QQIZ6M39T6Kk6Jkmfp1vZHGX75DqsZQ2pgVm1uCezSHn7gZtrvjlZjazmDcJLQ252o6/BySZh7CwIM3+x0eAVjQijKwoVitE2XaRwvoMpkk4OI+Tubhe0i/aujyPKZvvWMEsmLzMPgZmB8aL5uJmBXxtm+EyGVZ8lip2zOSHFfoLp0kHll4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjpwPF0PmeFCTu/HHsoqhjCgyX+nhKnCjrzyYS8SUeI=;
 b=tFlTWa5sPyUJcSrnek8yJ4cXByJXcLiIoi5ePTagGcL38PY8hKin0mgnZ5PkmhGpgikouVKLzJJluD/ePdj0EqtkbQV/tjJjfUeSPRi7WGTDF6msGQsj+2T/R+E5sWDZ4R4tb9Tlqodzvk4hy8fb9SNDQFrJg66IaQwoF/agSXR+yAr58FQqLE+AQAiiHweHZgBZFPhMfFErP5seq6wozxvI/947UVgs7FEHSTZBVsRqSHR8KYjy8Bo6vR9aGABg0grhp1+cOoBQ92GEIZyHUgj63euEEebDRfWhSEEuFVksaI7pzpL7RjsaM/ezWSDsHhcAeelFs91jKBwVcQhSHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 23:07:32 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 23:07:31 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/tuning: Apply windower hardware filtering setting
 on Xe3 and Xe3p
Thread-Topic: [PATCH] drm/xe/tuning: Apply windower hardware filtering setting
 on Xe3 and Xe3p
Thread-Index: AQHcpemiEVhKIKxqFUuBZLa6zH7GWbWVlpBw
Date: Thu, 26 Feb 2026 23:07:31 +0000
Message-ID: <DM4PR11MB545692395035743113E2FDACEA72A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260224235055.3038710-2-matthew.d.roper@intel.com>
In-Reply-To: <20260224235055.3038710-2-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CH3PR11MB8342:EE_
x-ms-office365-filtering-correlation-id: 3bbe040a-88ae-4ade-55f1-08de758bd210
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: NaYi+SA56a916ycMXQKHIq6VonALRlNgw+IVIo7jV2IZwR7FCx/03EE7RtG4Asy1lllsSTyAzsl+DgTJlf2O+FxrYIKFL+CYbZpAQk8j7iOkLKUhWvYV+1cFzaj9VwazK60Sk3YZ1PccMKqyZA5EneqR4b/+aiGtr/A6y6GvHiiyq3qryiZXZbZFPHJdjjKCpEynKrqwbmeXFTAVsN3E0v7yCXgk61Fei8eMpFvYJcmpw132BGpLjbXSvAzt7BXpI0AEU9epoenPaL1yZJ9SJ7z0KS0YjRGFZvsI1Jf/+5eitGTZtynuYUS4jI8ITDkNaye9UDWHuRcOtmYykvvYX2pgLlJOGqJrRF/UXSgYAiE6lyE7G4czM/GOU7BXthoPPj5777vvAOG1RqGtFecDwUhQZPWf/2lpepxkK0xanK/m9vYfN2qoIO+Jvx6PMKh/Y1h3W42Yz2A4PDJ/DimtBI1urZXJSTIgkoRVdEJKo65OYa9iOW72QwAKxQbD0w6UEc992hBO3IpATyJO+gIrKMqqxQFXEr2Z18GFWWgcPL+RORYLJ5GBQwQtli2r40pnLyeN5rAVn+R2i3AywVnTySLWrLzQtvi+1xiNy5oE8ohVAJSD5/pojNV0B8Wn+zdPAianN+Z+3H98HPKjQFpBor9gm8A3feXFL66h8tZ8VaVQCHpQUqKDS9dxhrJCcia5GMPxhUVs82Iiz7wOXdAx2qeagLzYVeZ8E/FiCvxQxu1D2UpTLqjCZlHVIdXB4n+6EzUudRqO2OeRZ6oI/MKnKnZJQU+NAh/jICmlS4xi3FI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZrzLZZ/rsfV22k7jSGfEYvvdM5DjyTyCiyqjEYgRzukwEzOhVo03szS+Ovbc?=
 =?us-ascii?Q?1VlfMU0HYsOlbTGCmpiuOvzD9w2ZqlnoFD5lW1BUJwjfb0wlM0Ec4UsWnG+K?=
 =?us-ascii?Q?y+KMy4USb1mUZiP5Zzt0e9lLEwdkSShKUW0vNBamJwYfSyLw1eF4FJnR+RtC?=
 =?us-ascii?Q?rqxq67ZL7UnegpCdhpro3F+yi7VQ43YzJ2sB4Y0e3RinGryu66uBoUcmkEK2?=
 =?us-ascii?Q?skMd3j5lJvg9df4OhkMBAX5U8GRLqWGldDc5ctWfrrCuV9X1POEmLxzyMZ9N?=
 =?us-ascii?Q?/8pxgpegeh1+n8iaSNK9muQSIAK0o/V51J5cbikqF1BGWnU1HyBLKDKYKZa0?=
 =?us-ascii?Q?R2R/sJTKzYe9KdUiPNOdBWD9kcPjBKeP0CDm4tCi6LZp4jXsqas1AETo0u3y?=
 =?us-ascii?Q?MKnXcJps7fsMdQsBpxcCfTTsKN/0EY5j6T/wuZWkCAQDWPkpL2jp7AWI36FP?=
 =?us-ascii?Q?SKpCTO9rrC4Zt1rihd9fNOdrsdJq4busfbEWnCfFV28H4rTjiRlXdXuVehyb?=
 =?us-ascii?Q?/r8NNLU+oDwyQGp7Qj8snxorSYMSyhZyOGa46p177TzMpQnCIHLb2WspxlY8?=
 =?us-ascii?Q?03dGg1FO0HgPilsYgKw9X+KqHnzgRkS7MTHp6sOh3pcyV5OpGWMdPqSzCzJH?=
 =?us-ascii?Q?nlBl+DUqRwVCmyJbIADJou40iq5dxjA2/MLcYE3vCoR6UbBt15dv68ufeT95?=
 =?us-ascii?Q?dKidm/MdDofkBfh4ZQXOj1IYkoUv2H1nXTY4Rttp3Q2dt7GQ4YibMcBQcw+D?=
 =?us-ascii?Q?ejiUCwMvfQ/i2sLSe3irwJR5zAMTRWQFePTqUr+/7/dT5JnccFd0zaxQZFx/?=
 =?us-ascii?Q?Gn1Dn8NTHgHBmU+RO4hDXkclBeghg6SCJ56yIsdXGO1K0h5iKW1zJrBD9E+K?=
 =?us-ascii?Q?O/pEMcvBGHJn4zRHQAb7a5j1dtd/mbqP+8RJ7gzNu85/Eps+bJQqI9bgULER?=
 =?us-ascii?Q?pkWXZ+hxDGaM+ktH/yX4mwKzakUkr17xIlf5hS0F5VPa7FxzVWSDDENf17nO?=
 =?us-ascii?Q?x2onbeGdX+ZrJpxd905t4KR/dKiC5TQ42bkePjDmgdymSsbRm4GD5NrnVjw2?=
 =?us-ascii?Q?5rIVpcugK5FYMSUiJ4wYsTKNkBkSVzxbhdQDQZ5QWtV3vq9nYxVUPeBcDl8R?=
 =?us-ascii?Q?EQesHddAcxH66XqNf5S2T8AXmGdyv+ZaAzth0kUVSvNeZH7CUSOPyIo66yCi?=
 =?us-ascii?Q?I5h9SwTv1cxQowedkmxswPhXh0Q3I7fixt5+pzVTPFJ8hYJ4JO41Z4AXnPUA?=
 =?us-ascii?Q?gkHZQAOXXxNHCfIv8M2QblBw/jFTe6nVJ5Wi5+DzMZ+WHRWl9VWEiTi7K6Ii?=
 =?us-ascii?Q?RCPZJWZ6USMVsmk6Xo72xVTSHB8cYKjGu8UHAseerK5/o2zLhQQi3k9Ief0J?=
 =?us-ascii?Q?zOGm2HLyp/t66k2sRP83OBxDDv10EDqBB2iZnhMS7AVMZ9ZO0IQB3gQVQpXd?=
 =?us-ascii?Q?Rs7LL0H3a2X5TxVh3SVXJI9WYEpi3IQL4s71kd5DZafUq+o5semPzaCc/JXp?=
 =?us-ascii?Q?flniaT2yMsCJOrhJZjPlrFplBvAJN8SFJTZeUELhopbBhWwXwoZ94NPzhl1s?=
 =?us-ascii?Q?DZqWS0/2KPfWpjBfSVN6QYeoHxh5VxQVQ7ZC+yYf13zilUvYKdhhmnvtvrv+?=
 =?us-ascii?Q?EdEyEpcj7X1Kjy7QR7xB3Biy8V7R51wd/ChOz+VXVzG2INQW/l6ojJHFWnC7?=
 =?us-ascii?Q?d3ktmH+bixWj4CPT2FFqpfRzlZRSlFI49E/hIhnmQI0fE6E05f7EusJMxFvN?=
 =?us-ascii?Q?Z8kXt72iXA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbe040a-88ae-4ade-55f1-08de758bd210
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 23:07:31.8190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qNjiKo7Bc3cAUPb//XUWTWTIN/rEs4cFZwNNqwDv0fimxYY0/BSwzWWH6nIEdl4uneqXiFsDq1UyZ2CSpY1oHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
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

On Tue, Feb 24, 2026 3:51 PM Matt Roper wrote:
> A recent bspec tuning guide update asks us to program
> COMMON_SLICE_CHICKEN4[5] on Xe3 and Xe3p platforms.  Add this setting
> to our LRC tuning RTP table so that the setting will become part of each
> context's LRC.
>=20
> Bspec: 72161, 55902
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

One small comment in below.
LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 90b9017770ea..66ddad767ad4 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -176,6 +176,7 @@
>  #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300,
> XE_REG_OPTION_MASKED)
>  #define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE	REG_BIT(12)
>  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
> +#define   HW_FILTERING				REG_BIT(5)
>=20
>  #define COMMON_SLICE_CHICKEN3
> 	XE_REG(0x7304, XE_REG_OPTION_MASKED)
>  #define XEHP_COMMON_SLICE_CHICKEN3
> 	XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c
> b/drivers/gpu/drm/xe/xe_tuning.c index ea90e8c99754..f8de6a4bf189
> 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -127,6 +127,11 @@ static const struct xe_rtp_entry_sr engine_tunings[]
> =3D {  };
>=20
>  static const struct xe_rtp_entry_sr lrc_tunings[] =3D {
> +	{ XE_RTP_NAME("Tuning: Windower HW Filtering"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3599),
> ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4,
> HW_FILTERING))
> +	},
> +

Not an issue.
Should we put it at the end of this array to follow the platform version or=
der, and add the "/* Xe3 */"?

>  	/* DG2 */
>=20
>  	{ XE_RTP_NAME("Tuning: L3 cache"),
> --
> 2.53.0

