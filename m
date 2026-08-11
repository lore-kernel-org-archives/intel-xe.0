Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F65C5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 06:04:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C756B10EA77;
	Tue, 11 Aug 2026 06:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LbTif43/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F1610EA77;
 Tue, 11 Aug 2026 06:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786428261; x=1817964261;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8ICsXBforPa3B2M+n0XP0CVCJ6gYl5srxdA425Z+z5k=;
 b=LbTif43/DzKCxy4ApAd2WzodK64L8hz42ARsxbjFLoLrUiHuVG5+ABzG
 MIg8T4cGbcwXHnWkExc8+TpXP6D5ylTUI9gJF6Oei4KVaMcZJsGR3YN+C
 es1IEacmR2/vnPazgYSl33+b3TwGry9zhxLIA8YRqHU9b1wBa3Icu9hrE
 DeBj06UBlY62tfXgWfeNAyA/EPaKJ5Jl0uZcniFhHnZmHbQRSgS8lClFb
 V4ibNfpvrHcLshbG0HDnrwjRthVaqA4G3WI9FlYLt7qwdhf3T4OW2wVAJ
 vWNOHQp9ytUwFqGcn73ySEFcdsJDKzvr3PB6oCGKkgAi6BDpt/v0PIGG+ w==;
X-CSE-ConnectionGUID: VH2slYwjSdyyoB6IbyHBHA==
X-CSE-MsgGUID: +rF2ofQiTR+lKqEx8JpCXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="112497400"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="112497400"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 23:04:21 -0700
X-CSE-ConnectionGUID: VSTuOmLiSZ+XGrx/ptl/LQ==
X-CSE-MsgGUID: SWKi3gwWS1OJD3aLaVQcCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="268405005"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 23:04:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 23:04:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 23:04:18 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 23:04:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UC2rA0rUOU9rYgKGDTbbJK6daooPJH0bm5fdic+h6i5992FKD+e/dZGgWM71Diu0OT5ZSw+bojoNkXxvb2NZl/Mkb5Yfz62lVh8sRKhkfX/gjkBo+PsZs2YvMkMI+WyF54ogL1skV5jfQ+fnQw6djrQqrvwNp2jAZs9tf8uahCVyPiH4TyZ5ZXaysW9s54EnpWPH0FUORPn2qQJMBMH/OP3pn1F5uDEk2A6byxR1Y5LSiUS4IdUnTF8kr3mzjIBqefHBqfKG9xMJoAmhRFRXe+bF2wYV59z0LS52EXHZq74Vx98QwCocnSDhD3fmLsqeo8+c5kXoYt28Ck3z6twzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6gXPGDbS6Z2FsG8P54YIgIJ1DnXW86U64Ng8/EG4sg=;
 b=XicAA0lFLRgRwKFf7ddjLoA8YYOgPiIy91TrM4brmZdKjJbybAzb2SlfuYQRCAQKzRde4OGHMx3jqwP8DA42nluAsTdSjJDNbeqtMpC1tjsfMN6zd3jYzkSRMJueweuhe+RLH2vPtfwLg34wk/XHp52vjgm83UGh6PU538RjcP3XLrcot0KuyiwaD2055lTzcwe5wXAX+ICL92sRKM4JGJNo9ecMpVmg1X3GW7124Flxbz+QupPzvUAoTk1+Ecn+OYKsgLn4ofk2EdqeqaISbWQlUV2Wi1aNQug2l3OxXVMUAD+T0g2rvj6oJGwM2Sp2Sdrmef7JRl4sIJHb17HrLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA3PR11MB9111.namprd11.prod.outlook.com
 (2603:10b6:208:57d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 06:04:01 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:04:01 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>
Subject: RE: [PATCH v2 2/8] drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
Thread-Topic: [PATCH v2 2/8] drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
Thread-Index: AQHdKU44hDWWLwMaOUGJl5LD6QC5XbaYW60g
Date: Tue, 11 Aug 2026 06:04:01 +0000
Message-ID: <DS4PPFE901A304F2672A95D44947D69E1EFE3DD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260811044234.593986-1-ankit.k.nautiyal@intel.com>
 <20260811044234.593986-3-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260811044234.593986-3-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA3PR11MB9111:EE_
x-ms-office365-filtering-correlation-id: be05e71f-332d-498c-ef97-08def76e571f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007|4143699003|38070700021;
x-microsoft-antispam-message-info: TSfJzduFJea7LC3W60TYYs1nDKoFwd2zJDtJucLS6KXuhOlUimYeKOZbYI6nU7h0Z4u+g52x+7HHH6Z4m+oV0y6szloTuQM3yry4bJo6fPbF1qintehghcD94Iz7kVEdKyylZeDGgyv8Tnktrsu/nrE3AqCF5KT/LW4Rp11zFZPZ+VSYNfg8aiabHaaj5w0shjDcK6wX2AeLwog7MiVM15v+JfUIY0PUuU4S5X2HFV3M91mKwcNW8IB4NNJdB26El3cURMFPy4LysEGZu495iovbOtgEKvufdIp3gEK4y14oXuyEo9aIrOUhau3iVwkdl1tHRrPfIvw8oNGNk9e/QnAFGRSqm4sozbEMNLqhS3Bx2bUDpS7PLrf8NlDlQz6OLwRpqjvrwRvVzfG4KO1CfyI5P5+LPkdzoXBx8AZh/i7lSrZ/lCjVfGnGsW4WqiE/YMisLwJQnwqEAW+ZEMo3JkuOZ/CuVedswT4jSfgS76dRb/jEm24JwDk2sL1TCLrCjyu7PqUA0cu6iRo0fTRnuy9W2je7026CIBYCpdLIlooZFBL7cboM2sqJNV6JdTJ20G974lnPxEPDXPv9qy0BqdDLz7Z2Te6SLUVCPc2O5L1xWD5fAhLzrXqfey9O9mnXLZxI/izJhkUiGMU7Jur5kuX0M/Hb9xGFpPojSqouwtq9flSqztrQUsWeYNUdsWsE6icWn/HU1cmcVFvH9nJYf6NbOQN0hsqyMpFWmgsIc2o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DIuF+BZDsviMFDHHZZ6hpMmZ+l40MCu153hRCPgqK9K1obq7S3qmzEf9mZlz?=
 =?us-ascii?Q?V8FTRgVnR3vopknIM3QHriJTWWNhlPmoHTRSLkzybGcQhFkEly2HPyzJXDkz?=
 =?us-ascii?Q?xp+vD+fIaJAW25AGLVqXiHsOeSq2sQiqaGvuTG9HXfJapm3QJMu626Wa/LEJ?=
 =?us-ascii?Q?slkdR7dVlWJNthejWpKxOSZ8nK75vp2NGPznK7YKfs+Jq/u8cASYK6afsq+A?=
 =?us-ascii?Q?5+rncHoC/OP1LXfTRDHxltrqG+5SA32Pno+MUYtKB9TF8gl67b0qNY/9v7nW?=
 =?us-ascii?Q?NhcpK2rKA+VWIz8C4161J5aeI6iLs75c4PmNtj4JmymOWdOC3rQZMA+0zhrl?=
 =?us-ascii?Q?MvNkBJWH0b1bvuMvqfQUBtH6iCGemeroiyAQD5HWqw97bpPUCcfFD2LbjFxi?=
 =?us-ascii?Q?NvHceLztigcUp83IzjbY/qMMHLp6CYm15vU/lK5R5JT6EoTKKd4YgppwHZut?=
 =?us-ascii?Q?lYc1RdmfFYFxmN/OI1DnQY75sWhx/e4/uNJ0CMftoXNNR5aP1OSAWqBrHrSd?=
 =?us-ascii?Q?bmzEjJfdl9Lu21PVobUvnuaCm6McReRx+adLFDIFZjJiqYavfN07hh7dq+pd?=
 =?us-ascii?Q?UR/3agMTArxoOvX0eHHIw7+ZUbh5xUDH2RCi/OUVMlNuxnyTO8mrq6pxzccZ?=
 =?us-ascii?Q?zw/I2YkCw4hF5FXDI3f9HzZOr1Fo/buvF9o+jrAtAU51Z/+yHGA70r+hHdjG?=
 =?us-ascii?Q?fOb24v7Bu4Jp5eWrzkgXxYGN8iydH2ikkQC0RieD6Rdlf2d9JHdG5a1YjAzq?=
 =?us-ascii?Q?oSLHAf3CVqWUsCzJa5G6ojziTvdcAUOi7urB5at5onSRfAptaKBJU6KF4tDW?=
 =?us-ascii?Q?8ulLx2gCIDJ6rnbc1jPsmely3i616WMB3qDaNkg8rs8wV2/yVdHc+kkRkXPr?=
 =?us-ascii?Q?nGt4/3TI4MOJZMzQmjMunvC8w9cg8I2LDPwV6W6X1dq9P+7rGv/eHSbIYemR?=
 =?us-ascii?Q?7ZRtymj6OPOAs1ubARP85D/ebq1lKrnTlYyV6X/wa8gPc02rMc2H1DnziM2O?=
 =?us-ascii?Q?tuWNhDk8VNQqfDLWBZQY9Y30XPnZa0nA63AL1sSXVH5eHPd9wlyNViRvcFDU?=
 =?us-ascii?Q?mxz8BZDxqDuUZ2gBkg2kSnV04T+Aq1LZuOlYCcFNfIL+lVq6YzFTptDSF4V9?=
 =?us-ascii?Q?FcEOMXIdV1hEBOxLfWhZMrz0m7lQgPn3H54lwu4RrTeNItL/RzywnWBTsPRo?=
 =?us-ascii?Q?i3SCzNpa+ReRiGIU6b+QM8aFG/Dax5gSnUvnDGEYgi5/EJCXJF+5ZwePLLDt?=
 =?us-ascii?Q?o3VbdmvNimxPJ8s8JpSQq1f9k4U2c9AHG0uHYLcJu3zWFRA3ca89deHKDJ+Z?=
 =?us-ascii?Q?Iy+uBwtxhZ1aIDUDqpjAsYSbHd+sHL2k8PJW65+FaNh0ERRF5TdFpmcUZnX5?=
 =?us-ascii?Q?o6i1yJ7/0HwAKV1o0t5ySlszLbLCTp9/192oNeYDpE0GqZD1v+DkdJpDg42p?=
 =?us-ascii?Q?EZSdCZVxTh/JWZl596RAw+i8MBK2YeMwiT08cTJ07Z5pardwOo5VUON/nfks?=
 =?us-ascii?Q?AbaFHPwCYjkmu2hpQxgsUkmO8/daXGXiU/vxKUvZUuaCONNWY6UOfBxBgB0V?=
 =?us-ascii?Q?OaxRS+yQpgKhtHU1l1ipw4VYhKCfsBI7GEWr8JcXMDmLo6ER1w/APbGiTzxB?=
 =?us-ascii?Q?k1Ffop8sTTUvJm89OpC0nfEAF6jocGQ8+1DLue+VjrpY2Gt+6YEtRisq66Xs?=
 =?us-ascii?Q?8O0q9gRM6znMgGdhMxHg1JMkM+pfi5/xS/7qPsHlDPUuuOpF3j0v3ye2krx8?=
 =?us-ascii?Q?aDI7LE0wvg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: okce3n8K6HqENCb+YIkIxHhOScNuX3rqOl/zG/uWJ8G7pv8egfDk3sf2CRCfD82OKIRH1nO8Bogd93g5riHQON3RFWU1hKO3GcxBQAREkm63rbx/mQeT7qPNfT4I1DES1Sj2t/+VQ3/Ec0b1eP5m8M/5sym8yMziXM5WGwGremQ25AfNISvL2ro0yKHecnrCveN6EC4W91noh2yYvW+IHphxmen+OlySj6t/Rfl3Zp2I4+LTPIXe/gGr+0PdMdod5B5SXSEdVBCThREy36jGy1TkAYrLU5xanCjHaKFl3tvpaosnOQNNyp/Efl6biar1pXyxLj2u3Z8Dxnxj/hmw8g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be05e71f-332d-498c-ef97-08def76e571f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 06:04:01.3150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DPGZhcF2uxHBEqQB348ZwbHVzhvtLLKNEOerNVIbrv0vdSluhWGF6emJM7vPBqshxDAil8lyGdYTNJklDClHQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9111
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

> Subject: [PATCH v2 2/8] drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
>=20
> The FRL bandwidth check considers only the PCON's max FRL rate, ignoring =
the
> HDMI2.1 sink's own max FRL rate. Cap the available bandwidth by the
> minimum of the two, similar to the TMDS case.
>=20
> Move the check into a helper intel_dp_frl_bw_valid() so it can also be us=
ed in
> the compute_config phase in a subsequent change.
>=20
> The DSC case, where both the PCON and HDMI sink support DSC, is left as a
> FIXME and handled later.
>=20
> v2: Remove extra braces and re-format comment. (Suraj)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 51 ++++++++++++++++---------
>  1 file changed, 34 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 437b9e7bb864..dd706f7de62d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -124,6 +124,7 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)  }
>=20
>  static void intel_dp_unset_edid(struct intel_dp *intel_dp);
> +static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
>=20
>  /* Is link rate UHBR and thus 128b/132b? */  bool intel_dp_is_uhbr(const=
 struct
> intel_crtc_state *crtc_state) @@ -1179,30 +1180,46 @@ static int
> frl_required_bw(int clock, int bpc,  }
>=20
>  static enum drm_mode_status
> -intel_dp_mode_valid_downstream(struct intel_connector *connector,
> -			       const struct drm_display_mode *mode,
> -			       int target_clock,
> -			       enum intel_output_format sink_format)
> +intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
> +		      int bpc, enum intel_output_format sink_format,
> +		      bool respect_downstream_limits)
>  {
> -	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> +	int target_bw;
> +	int max_frl_bw;
>=20
> -	/* If PCON supports FRL MODE, check FRL bandwidth constraints */
> -	if (intel_dp->dfp.pcon_max_frl_bw) {
> -		int target_bw, max_frl_bw;
> +	if (!respect_downstream_limits)
> +		return MODE_OK;
>=20
> -		/* Assume 8bpc for the FRL bandwidth check */
> -		target_bw =3D frl_required_bw(target_clock, 8, sink_format);
> +	target_bw =3D frl_required_bw(target_clock, bpc, sink_format);
>=20
> -		max_frl_bw =3D intel_dp->dfp.pcon_max_frl_bw;
> +	/* check for MAX FRL BW for both PCON and HDMI2.1 sink */
> +	max_frl_bw =3D min(intel_dp->dfp.pcon_max_frl_bw,
> +			 intel_dp_hdmi_sink_max_frl(intel_dp));
>=20
> -		/* converting bw from Gbps to Kbps*/
> -		max_frl_bw =3D max_frl_bw * 1000000;
> +	/* converting bw from Gbps to Kbps*/
> +	max_frl_bw =3D max_frl_bw * 1000000;
>=20
> -		if (target_bw > max_frl_bw)
> -			return MODE_CLOCK_HIGH;
> +	/* #FIXME check bandwidth with DSC if both PCON and HDMI sink
> support DSC */
> +	if (target_bw > max_frl_bw)
> +		return MODE_CLOCK_HIGH;
>=20
> -		return MODE_OK;
> -	}
> +	return MODE_OK;
> +}
> +
> +static enum drm_mode_status
> +intel_dp_mode_valid_downstream(struct intel_connector *connector,
> +			       const struct drm_display_mode *mode,
> +			       int target_clock,
> +			       enum intel_output_format sink_format) {
> +	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> +
> +	/*
> +	 * If PCON supports FRL MODE, check FRL bandwidth constraints.
> +	 * Assume 8bpc for the HDMI2.1 FRL BW check
> +	 */
> +	if (intel_dp->dfp.pcon_max_frl_bw &&
> intel_dp_hdmi_sink_max_frl(intel_dp))
> +		return intel_dp_frl_bw_valid(intel_dp, target_clock, 8,
> sink_format,
> +true);
>=20
>  	if (intel_dp->dfp.max_dotclock &&
>  	    target_clock > intel_dp->dfp.max_dotclock)
> --
> 2.50.1

