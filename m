Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B02AC982D9
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 10:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1C810F2C0;
	Fri, 18 Sep 2026 10:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gx1PM/Fv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033A610F2C0
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 10:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789726449; x=1821262449;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oMZ14fxts7fY0BEQvFq9LsABTVr+Vtlfd5Vcr+aFYe8=;
 b=Gx1PM/FvrHOuY26rCvcjh88B/VWyezQXa+d23Ln6V885G0sheMfof/hE
 cawS0psolYBkmda4kndyUmQq3n9vQOAZxfWXrfi9VObq2XA1UHEHxJrcb
 kU6+FrZ4FE8HPNgcyauMS3OjQL6WkihswCKja8bpSh5MKBTm65wkd+sUp
 8yqFibUAv/kQVJIE5RIyBPES6p9kPIUn4TvuNikUtRqs1L/Qnsp8jrmKB
 CKrbvsovzdFF8+iafSCprHDvAQWCz0uhmFlHMFyJp0NpYXfMYf1M1orrY
 ERTAo8wC+yL2h9wMckoTR8ae1ZGCChym/Sd5MfgdTALLIvALNveiYliI9 Q==;
X-CSE-ConnectionGUID: tLSk2R3TSpe7xPXjVacc3Q==
X-CSE-MsgGUID: frmnTBXwQYS22EyW4IpYTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90088205"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90088205"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:14:08 -0700
X-CSE-ConnectionGUID: GblGSdAMRQu69GtUThIe/Q==
X-CSE-MsgGUID: rxdPWwYXREGEBCKVkcKVzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271646679"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:14:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 03:14:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 03:14:07 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 03:14:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/HDDsyzK5f0NYl8du7LMUVyi3JpIeKKbJLb1pzPvV8S4/i5KfTBKmrDTxjEBSwNdePlWy+HMIt1Zh6s5R/y3CJU8cLu9xekMiFjGoYKnrEMXOMHZ51nHd4nt5FgNZyh5C1XfO6Vyy8Ik1lMuqN+ELAARi7qIYIOM18UvfU2QdsyxH4332sKIdE++8XDB7qyzY3vSY4DfbSfJvvYhokgkG0+eWrqaL9dXtAApMig5FgPIU0H1MdU69R5upKm/M8I4cvoU5NXJt+r6LN4d9odNaopPTqI+p7DgbHqivBL1B6/BA/exHoGH42rkbsAsC0UYBS4X4jc6BLS1OuUEg3xJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGG3iVHqkC66Ze65HlgPUCl5FB4/xnF8b3FtDChCZAw=;
 b=RoxR1PgVjtAPsWJQEgUlPNsFp78FuRmCiSMZsAvm1ONgLwvM0AFYpI1w+LCCzRPTP4gYT9hmOlK+ZTmaIdUMdE8yksCBFiePVwdXxcY3kMmj+nWXUm9FIxT97maOiTaMo1AAzgkALVgpG6T4YwD6STAm313kKThX8V0jD7+ImXjMieE/8DnEusKMfQf77bqGTDwHPUSbew7fLGdJc4OkPP7MlLuCUHNWw0uklJxrgxY9A87/JupCH7O8M580DvJtYqlUe2HDaxfkRZsSQ5hX0CXHVgoO2mbZitVACxCPfbkJgGgvX87RzWOrWWiPJhAkcMq/GV37bZ0HGrD5uhteKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 10:14:02 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 10:14:02 +0000
Date: Fri, 18 Sep 2026 06:13:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v3 4/5] drm/xe/hwmon: Decode CRI temperature registers as
 IEEE-754
Message-ID: <aq0Ot9mwpR9LgUzs@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
 <20260910182756.638830-5-karthik.poosa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910182756.638830-5-karthik.poosa@intel.com>
X-ClientProxiedBy: SI3PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:295::17) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CO1PR11MB5076:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b68cabb-4faa-494e-bf4f-08df156d8fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: eRXlaZZZ5mA4IihaIPfNcoUeoY05r4ryiSvhPfutMhTakzIATM9SAd1UlcftKcN3imyH/gNEKhtgB0QNRItiwVZtfkJ1Z+0A/Hsa7GIpB75RxDlszK5ZVo5oTiuaibMhLl3C2uTmmSm1WXlyUDrHcISsR3HGasBo5DYcr2nTJQ88OwC6EFWk39ah6NIvzZ3dQHbKBto2V5sDsW2k8pqF6L0vUxMTWs2qqOGZxH6oUWt8AA+HPoCx69EI82uyV2OkmIV0+8T2PD3IfS8olHgYxyVQWJvLwkXro+t48KYw5F1JINJvwyZwarV/fNUyQn0q6dIYouFPN3l/fPO+Cyb05ka1qhwC0Yh2nomG9VQZ4rdDkf/ymomTchyX2Aq1sWjOofc4hqQVgxDAdegA5LbVGo+xYLYE74w9CqlMnsc6zCDeJWio/XBaWcM+a0WOIwNwSjSnwYIZEFsOCqNJSPECxj8MYCq9ADcz0h+OdUATLDfvtLlE/FKMj/f4n2r6XAg2Ec5uItxbrVj1qpIv47M/zCKCCSdhBVsZ5RmlfHxadKxSQFs9DJGfJtQjCUmDYsnDvlx/uXDDK68gp+21nkyO90yQhnI/Vd9Ks+yyFvi9t0QcyKaPPfvmsP4bw9+dedmHb1ibMRQDCoA3JqjM7ERrFLsSqeT9VEVsvjaWi03Kxxk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Gkd50K/A2oIClJDj2j4EhVhKy4YB80tvgA4VmmfIPUg3OK8zu371NYd5a5?=
 =?iso-8859-1?Q?9toXGFhvzI1IX4d9E1OzTRQYqcVLygz1huRSV3tUKntn3Kb6YrOpH9cEzC?=
 =?iso-8859-1?Q?3/th2EgitbQmnuBz7txh3hr7d39Apo1RvlAlhsGEmD2ZSDxpjOQYesVFZW?=
 =?iso-8859-1?Q?5vssqM4x4q74E6DxUYAUe/XHdy9/I3Qh6GmM/AV1b+1hGopmSEeZVuOCY4?=
 =?iso-8859-1?Q?GGTItZaOsCU5I+Pc8lIKJq60ZB+wrF386HfLQ3wZMo0J2yQnqAcAbIbbAy?=
 =?iso-8859-1?Q?7CErkqQVlsq+RLd5P/fpMDmg2+GNBr6jcY530necYGexV9NK5X/szD5NBT?=
 =?iso-8859-1?Q?tJ+VpdPmw11MuwX/npGnTheChfPogccIvuSTx0dgo3Bz8y3Irdq+IXZHq8?=
 =?iso-8859-1?Q?4ZGpEaeFYsdXVbqurUJ+ByCM06Y8v3MGwzMX2/dcV+YJUX/l5r6nrfAil8?=
 =?iso-8859-1?Q?HKedGaRAijTM//F1w6quQWhCxu7fqaKhNdWwORDaHBjn2dBV4U+VPY7g19?=
 =?iso-8859-1?Q?crQ9G3yXtk8LhxMx/Lgc2Ne2QcK3tLDzUjdtyx9ZBDMveb0VrR9cciBJW1?=
 =?iso-8859-1?Q?6ER1+3fKuLnYls6DbofZNIRLFDUWICFfbamKo4IciETOF35HgURh/aZ5N+?=
 =?iso-8859-1?Q?mtBZD5MFRhJU56pdTa4lriybYhy7zcXYFXHcQJN0XQcdhlztOSJFDoC1q3?=
 =?iso-8859-1?Q?imops2qzY3qYv7ztTmsLsowlcCCMupavrLtBXnW61BllvaoVJVULPY9VVT?=
 =?iso-8859-1?Q?FLzEBYStbqv7BBFM18c6yaSrvWwclI+zuFmeK4TBZfPPv9DIBaYfcBwY3i?=
 =?iso-8859-1?Q?bdEPDhkJxSN4oSR4yuwmEOM6aZ5VQ9EqkzWCrkXvTYYer6UVTQwXtK73Mw?=
 =?iso-8859-1?Q?8fSido/mfcTJSCBwHGhmk/Av15oc5+2Ov/MB4zv3mo63SsI17/QGIYIcRc?=
 =?iso-8859-1?Q?aLrtETr9cerXHHG9GxlDAxGJUElnYiPqxDekBFPRddVOywtCOp9vpbcAlX?=
 =?iso-8859-1?Q?gezu+Dn3H/gWwu1KGF0aHPpXmVIxtHda7nL8ro6Fz/N5U/vaGZReqR3HUz?=
 =?iso-8859-1?Q?xDuSsrrWjTihGuNhrQBcoh4vEU3mjYm1cRfUam/t2yWudbDiA2ApUiV3xk?=
 =?iso-8859-1?Q?d94LE0vyhdrtMhWOoTiD0CAAQKT/nfcsnEbb9jU6AFVpYPKwwPoVFq01Uc?=
 =?iso-8859-1?Q?eIsbUX5ZpSGRLAwpVE7PpFCn/OBs1l9YTvCRFCNt9W8COWoG6GBkZs1aHn?=
 =?iso-8859-1?Q?RWIVctVNfy79zNwGzbWotP6J2B1/mA40mKFV8EzervoZFwoQ/RJ0gNG22M?=
 =?iso-8859-1?Q?xcZDwEYGdYlcZQCg23gCtkac86uo11XqdHtMUJRVXarXwJy53FNm3oB0LW?=
 =?iso-8859-1?Q?H9xV+BsvedonYG2csWtcabmq7oQMwYRBoADqndyRIdReGcGOH46R1zTUAL?=
 =?iso-8859-1?Q?Zu+gsUCnYpMlkNLI6E9YMiSp71K/aXw9IcWiweO2lL6dqfy8OnCSTcj6CS?=
 =?iso-8859-1?Q?AR5KwJwP9iBVGCi9sYIPHAfMN6OGWXgIgC0FbBIwhTbK0SlgO/W8FuXCSJ?=
 =?iso-8859-1?Q?DVOxmyRPVe2hyU4Ky1dIv1gRAFpN91XsvKHdV/0w0JOLTVLpT4Ck57Z6CK?=
 =?iso-8859-1?Q?htGke3dzcTeziqjoGc17nDgg9cUZwobseBbNy4rRqQ2XqpJoJ1gP4v//xp?=
 =?iso-8859-1?Q?RNKJHMFzkng4IK+4YoQRnb/36LfS/ZquejBpNvJj0WvMFoG2WMZSdIUbT9?=
 =?iso-8859-1?Q?2FIw/K6t8LsVoyUDIOPX7ay+WFFNKM+CwLtpi61ti33szYamNPX49GHC66?=
 =?iso-8859-1?Q?ouoFsbwQ6Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: XIR7OF4N6lvCUTZ4gE00dPgwM/6CNc1ob67S4KzhuWVFC1nky7iJV43ONIzwp4Oi0Y2/IwWVsuuiSI/vu4yoUBxF1TCv79dVN/JKfP8eSZdP+TFJgIZO9CfXobE3r7X7+MP2jaalnElXU0hdPH3ZrvoyqDEYsQ7kJRy6ko7EkfmjEjWZzOrFIxE+yxlhWtHWcbeP5kBVNG5f/Rve7ONc0N8OcQoAoAbZXDGgZmUNIUWiUbU344MusoteFveaNy+cUdPj4AgtVzxsKkV44Fju/I85IOHbedt9ILTwkGPctYNZ1JP5IS2IJkO+2u2bI+bW2y0slmKLEIpyN3axoUMiNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b68cabb-4faa-494e-bf4f-08df156d8fa3
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 10:14:02.1688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZAV7zIpRSCaKH4H5Vr14Fju8hktAON7IjLc0zvopYv3pyL0XKo36iCNdg+MbVT+4BRmV1eCoKmXizmQ2MlaELw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5076
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

On Thu, Sep 10, 2026 at 11:57:55PM +0530, Karthik Poosa wrote:
> CRI temperature registers encode package and VRAM temperatures as
> IEEE-754 floating-point values. Decode these values before exposing
> them through hwmon.
>  
> Use integer-based IEEE-754 decoding since kernel code does not use
> floating-point operations and hwmon reports integer temperatures.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: GitHub Copilot; Model: MAI-Code-1.1-Flash

nowadays 'Assisted-by: LLM' should be enough.
And this one here was not the previous style anyway.

> ---
> 
> v2: Reject temperatures that overflow long on 32-bit (Sashiko).
> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 85 +++++++++++++++++++++++++++++------
>  1 file changed, 71 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c682c5a33650..e4a210916df2 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -1159,6 +1159,62 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  	}
>  }
>  
> +/**
> + * xe_hwmon_temperature_decode - Decode an IEEE-754 temperature register value
> + * @reg_val: The raw register value to decode
> + *
> + * IEEE-754 single-precision format:
> + *
> + *  31 30                         23 22                         0
> + * +--+-----------------------------+----------------------------+
> + * | S|          exponent           |          fraction          |
> + * +--+-----------------------------+----------------------------+
> + *
> + * value = (-1)^S * 1.fraction * 2^(exponent - 127)
> + *
> + * Return: 0 on success or an error if @reg_val is non-finite or cannot be
> + * represented in millidegrees Celsius.
> + */
> +static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
> +{
> +	u32 exponent = (reg_val >> 23) & 0xff;
> +	u32 mantissa = reg_val & 0x7fffff;

Perhaps all of these deserves some define somewhere?!

Perhaps something like LLM suggested:

        #define IEEE754_SIGN            BIT(31)
        #define IEEE754_EXP_MASK        GENMASK(30, 23)
        #define IEEE754_MANTISSA_MASK   GENMASK(22, 0)
        #define IEEE754_EXP_BIAS        127
        #define IEEE754_MANTISSA_BITS   23
        #define IEEE754_EXP_SPECIAL     0xff    /* Inf / NaN */

and use FIELD_GET() for the extraction

> +	s64 value;
> +	int shift;
> +
> +	/* Exponent 0xff encodes infinity or NaN. */
> +	if (exponent == 0xff)
> +		return -EINVAL;
> +
> +	/* Subnormal values are smaller than one millidegree Celsius. */
> +	if (!exponent) {
> +		*temperature = 0;
> +		return 0;
> +	}
> +
> +	value = (s64)(mantissa | BIT(23)) * MILLIDEGREE_PER_DEGREE;
> +	shift = exponent - 150;
> +	if (shift >= 0) {
> +		if (shift >= BITS_PER_LONG || value > (LONG_MAX >> shift))
> +			return -ERANGE;
> +		value <<= shift;
> +	} else if (shift > -64) {
> +		value >>= -shift;
> +	} else {
> +		value = 0;
> +	}
> +
> +	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
> +	if (value > LONG_MAX)
> +		return -ERANGE;
> +
> +	if (reg_val & BIT(31))
> +		value = -value;
> +
> +	*temperature = value;
> +	return 0;
> +}
> +
>  static int
>  xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  {
> @@ -1168,26 +1224,27 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  	switch (attr) {
>  	case hwmon_temp_input:
>  		switch (channel) {
> -		case CHANNEL_PKG:
> -		case CHANNEL_VRAM:
> -			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> -
> -			/* HW register value is in degrees Celsius, convert to millidegrees. */
> -			*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> -			return 0;
>  		case CHANNEL_MCTRL:
>  			return get_mc_temp(hwmon, val);
>  		case CHANNEL_PCIE:
>  			return get_pcie_temp(hwmon, val);
> +		case CHANNEL_PKG:
> +		case CHANNEL_VRAM:
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>  			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> -			/*
> -			 * This temperature format is 24 bit [31:8] signed integer and 8 bit
> -			 * [7:0] fraction.
> -			 */
> -			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) *
> -				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
> -				 MILLIDEGREE_PER_DEGREE;
> +			if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
> +				return xe_hwmon_temperature_decode((u32)reg_val, val);
> +			} else if (channel >= CHANNEL_VRAM_N) {
> +				/*
> +				 * This temperature format is 24 bit [31:8] signed integer and 8 bit
> +				 * [7:0] fraction for platforms before CRI.
> +				 */
> +				*val = (s32)REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
> +					(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
> +					MILLIDEGREE_PER_DEGREE;
> +			} else {
> +				*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> +			}
>  			return 0;
>  		default:
>  			return -EOPNOTSUPP;
> -- 
> 2.25.1
> 
