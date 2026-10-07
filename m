Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55760CA5FFC
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 18:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34DF10E647;
	Wed,  7 Oct 2026 18:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OduhXLnF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAE810E647
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 18:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791397053; x=1822933053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XThv6ZEbOk6yVJQFFZkSUtG1JM6NG/J7xe102S244pU=;
 b=OduhXLnFpqWDeuJtLBRRFi32v2mfpl8na14EAfmozMrd8ao9lHZwZVWb
 CdZ5X6ipmDwlafBu4o8xTS156J3eaxfHU/Y9C5YIXpnLKHttJbg3uznQ2
 GaWKHJFfM4YmyeU4zE2OP+naqx5ycVKCBEC8DMGBNyDDzh3QU6CHqdmOQ
 Eu5WCVy+0LuHZhGYg4+JW7ajmwFR7bBVO9efxZAmzruQJ+Ic3B/A2xwAe
 paUIxszHHd2f/TUlN1bmk8ZI7QMXg7TkU0q8saeUHrVlKrRA8QESYDOy4
 5Ou6z6WG/PbPKbnWo5pPrqzle04yneT2YBi4POOzReezj1dXP1HLJekFx Q==;
X-CSE-ConnectionGUID: 33MxlDEbQkC8ow5bb2aGsg==
X-CSE-MsgGUID: dI+zSYm0SUC9TtidBt0Tmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="56648"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="56648"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:17:33 -0700
X-CSE-ConnectionGUID: +pcvw2v0Sv2FtRRzSQ07VQ==
X-CSE-MsgGUID: JBuw+NVESqmJiJRR1uykcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="280808943"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:17:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:17:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 11:17:32 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:17:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtRvcXatP20ukl5RmrvBsOoSTUizXABgg+L2oUeO5mFykxmsy+1RVOff5tuMRsfbhx8LU4RVAcFL1qHcHVR6Jhd2oovgWC2JWScIcgCVlBDbl5DotgVOyHTs9+vHJdWMOPF8oi1YIG/N/szkWlfmjjpZez6cbl3m0UxEzxShSmAauYhgwQxln/lii/VRvyPf2FLBwSEPQ0qWdyYGYLVgL8IezsZv6hy/KGng9b9Ne6vmSiGm+IowcW1QPAX8pBrxROSkls2Mb0mAp8+2z/Ux87Kd7kh92F5HxZ6kFgeGb22O7JNbe+7dit7CzeAzzuru0Jrhlfk4rVas/8u1/nMgpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsuH+SmnVF1IPfSdBoKlnpzKCc0/xWPaF4Vr3lSoePg=;
 b=FUIdOaLTkXjxap7FuO6yLOViaKBwzE4aUC7VPaqM6pSiLkYFqDD23BlJiXcjks/pNmkLpb55MzNOmDU9KM9BSOl+06HXKxWlHpJHLcVJu3HpXWwyP253OL6Rl7naKUcAnDLV93ErI+JcU3c1IMDKaof/JBY9f9CseQueqQTfGd4h6tj+SFvOIrSMpia8hgiU2GMoiF7K1mO9sPIPOpOA6mW8WiVYjibwESGlswdoo+xtDF8/7gz16f8AR6Mn7AQlVjM9GJtr02vvy65/DmRcgLVq69RqIEbUYvMaTc1Ts3NgTbJuDN+0rUOUt/T/jbcbcC0hb2SkdF3pDE2Hi0xd8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by SA1PR11MB8524.namprd11.prod.outlook.com (2603:10b6:806:3a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Wed, 7 Oct
 2026 18:17:28 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0451.026; Wed, 7 Oct 2026
 18:17:28 +0000
Date: Wed, 7 Oct 2026 14:17:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v8 01/15] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
Message-ID: <asaMq28VVNNaotF1@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
 <20261006033534.3583967-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261006033534.3583967-2-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|SA1PR11MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f180be3-8152-4c6a-f4bd-08df249f3ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4x/xcqsHbfI2W5jh3LDt++WGEQgzcMcsKs28XusuQ/L9VsCS4bSmgvLnisBe3OGqU/CoPcVrDF7vdLSJsuAnR0hMy1zIddwXH7yXreCjSyMuRrkxq2IpbP6m9g4F48iTd8ncgx5AMJCuPVWoMwBjP9kMVyyZL+V44zkOK7zDV/HhKciTMMXNAMeWwH1WYzl4KHnjYFrso7yZRsJSDBD6llHh/4TIiwS/9pbqk69Gc44StQghM1Ct8ZbNZ1oxGLXgofWIgE2tv7dZopoMHKC1gs88AoHbKS1oTunGc57xkxpl9KkJHFme1+P1PHL39+irRSvLEhb3VMVwIrbcoOcbwhRxFx4evkXJi+orOQlSmkdGqlhxG1iVTo08V6EOPPQe+5bpx1RYKAH7qKCKDEpNm6jpHDp5ChWZ2I9mJGLTRl7oUI1LDJD6MaPvudFI8ykpQ3UemiNOtZK5r6jUI3gaHRs0tfjICcNITp8NPGFeLXiIxH2Hj2aWZc5V17UVo9kduh2ctlfhg//IqD2qoLHEJhkP9rZTPwLsmf+9LOr/SMw5GIa4Ewx3LNrxvEE2+fhrmh2prbWewYffA+//eEjzisf7jj2mCKPVu+vxqOFlMNkdJPm8KGffYsDeq8trSQzW5lSwnqU5mgULncypYAJ7JKO+x45eroz9DUHk5n3+jdw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?96sJuSzRNDsCzj3ZfscD/RRzwKE7FykKpih1+kusnXfKzWARd61Iy/3s7o1R?=
 =?us-ascii?Q?986FQrRfAsi6Q3G6zmLIuavegnOfKvhOCRdFtsLhh5ep6QTxYJPpPejMtSGE?=
 =?us-ascii?Q?LjmV/HP8BMIbH4Mxd7ncHPqY1MBCBzS63dauApQoc+9ka6zzmL0C8WtQahiX?=
 =?us-ascii?Q?y3BJj3pzzoUuVL8awJdl//9UQ36IUvuh5iPyypM4U6p9b3y1xqvOXmhq/QGx?=
 =?us-ascii?Q?PQYGV84+54YOT4M3ZM6ZY2bto4iGvYXcFBfBGjUqe3PvO4aBIp5BtBCNUVXY?=
 =?us-ascii?Q?xLB8jajyCLT6twL0OFj3lsDmK+fCAVoPYLmr52Y0ZX6aLg7HcCY5tEB8+0R/?=
 =?us-ascii?Q?vGTxH+dKBZ225OiAwBAG+VeTRWmYyg4jeQdj0DI9PewTdIxLZo27lMuOk3oB?=
 =?us-ascii?Q?H1AQxV9an0MhzKRnjZ8WMgvASm5KqVemCVcANiFKXTbvMT0SKTXNLucOMjyj?=
 =?us-ascii?Q?n5+M6NFSJxmdWMj1c/ehCpOQ7LEUOPqC8x7vkJwoH3koUJDYHCVq4iQ9g5ht?=
 =?us-ascii?Q?+Z1UunjqmxlaP5F0en6nqvVkau+bIZwPwh2Wln9zfsse0ZbE47JX54sQJvkd?=
 =?us-ascii?Q?pkbI0W1No/pcwpl0oCQ6jcoyOKKt5D/lUxqUOVTgLA2uXVusZYgqodwCYYTx?=
 =?us-ascii?Q?XI5oYn6E0Jp/z1g/fouaEeNRNPXvdzDB2/0ZEeq+oloe9BSZZQdwmtCon34P?=
 =?us-ascii?Q?aZ9nneyexm/Rf9g/MRtNe2g9fZtxok1t/nZ1Y/HbUiHyW1mS0vywqliGN5oy?=
 =?us-ascii?Q?3/RQd4PEAJcQYZ6x4qfDzvWcsjqGdDTXLfkO7Xh6sJwRUIcP0Nx0X0GhjAKK?=
 =?us-ascii?Q?RYyMYiz+W+8Q6RKmbn612zzJyCmrFZUU5xIWujI+0R3O9szRjqEvUxyWmGkN?=
 =?us-ascii?Q?CcVi1pp2PejBO/GeuoMi8Lvrl4Wcql7gyV4SlmXlyYT23X1AJ+bUXqAStGU1?=
 =?us-ascii?Q?F52Vqy6wgV3QAxM3fBivxGk3eBKe2n/IXfMtYiy6BWU7pQbw+BXLCaHoxNqr?=
 =?us-ascii?Q?C6pDhs3RR3T6OIsww//x7n12bGqoqzeCQ6ooOzeP1HbOZ8QppLFjL0gDA3Fe?=
 =?us-ascii?Q?TNd9l/RugFTNcsquje6S5DoPSgls1styvSFedyiYmK10vl2wJc8X9tNOwCca?=
 =?us-ascii?Q?F/CJa3o2Rfbh1RwIQFuk55rTV2d55ERjsYcDMpN9z/76CByLH7JU8BMo6qL+?=
 =?us-ascii?Q?3JhMNji5CO1fq81fmHL602Edn7wyxgvCbyD6BpZeaa5+ZqpQfl2/uWVjJ5n8?=
 =?us-ascii?Q?J2cM7TcD4GqoFXWyDqBfZ8lCSIzueXeZ7RVmGgnHOdFTy/OyiEiSwrBdfZOd?=
 =?us-ascii?Q?LsAsMgkb3XgMxald2qhBuwMH1p1pyg4wdwGlB8R3Kk0+BaBuGe5B2rE9hrgg?=
 =?us-ascii?Q?Oqe8WLcCHMIRDVL5SMmwvxWBCAY7HIDx4Dunn0Tr0h3tw/MYJyBbU+ZWwx6U?=
 =?us-ascii?Q?Ms2J1ht7JbqpEPn1vu/a7+Egg9HkVEiZkB91l05RCIlCZ+7f97KOLO0QpEnL?=
 =?us-ascii?Q?y7vXK0t4Be7JY2O55XnYws4K6e3vOSgUelml5fg6lrTybBcQLmh/U8pOfBCP?=
 =?us-ascii?Q?weFL2Ev/zDy+gSU+WsQHA8JOm6OqvnqbzeA9Sk3maSEtmkfaDV5ZWnH/nUd3?=
 =?us-ascii?Q?Zf/CG4tXCNuVnNmLLg2T5yKoydlOK/L/R23RX/K8uCDgfBpoCe3AR2MNd4bo?=
 =?us-ascii?Q?HP38uG4ZilLFwbKeO6dMGcw+lNZJ0+3LumJbiDLYHTOwYIvqHxmyw3rqE9df?=
 =?us-ascii?Q?Znhyz3LwTlVb6jZa4NKjvU26FvTskTk=3D?=
X-Exchange-RoutingPolicyChecked: bgS4xNhpjbsspyvl4PtpAOh1JdwyYXoswN2Ql51o2LcEczrv7NmG73DliV3lIzWrM0mQzn3CJEhhfyg0z/daaGnUsPkdHeNLAOZsKfvIycBT0KqfF2T8MWoUpFMOlDBHb5rFa2V1yFiWR3iJLL06uLU2uC3ElCB8r4gedYve/t8f60qG8rJ/IMQtNIsP5B5vreRkUgmHzjxPKXm/u4q6JnJykrz2RSvdSFGcYmJS4WUunQMN+6v8j1xbVy7p9ZMAYeyMWA/REkhu/PBs5b7LaKueFgG0lX9MiH1n8exkjd69CNoyd//317g0mBb+ofbAjjPGelIZ+eUU09vjhojfnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f180be3-8152-4c6a-f4bd-08df249f3ebe
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 18:17:28.6297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yy3rQkWlGGN6Iy3+h5xQWENcytydNAPHWq/C1Zdqk/A8W6mcaJM4H2H+ALKQ2qP5xNppIyrILIi5ePi0icUbeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8524
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

On Tue, Oct 06, 2026 at 09:05:20AM +0530, Karthik Poosa wrote:
> Return early when the pcode read operation fails in
> xe_hwmon_pcode_rmw_power_limit() and check the returned error in
> callers to avoid updating power limit settings with invalid data.
> 
> Fixes: 8aa7306631f0 ("drm/xe/hwmon: Fix xe_hwmon_power_max_write")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> v2: Use ret for return instead of count in
>     xe_hwmon_power_max_interval_store(). (Rodrigo)
> 
> v3: Return the error from xe_hwmon_pcode_rmw_power_limit() directly
>     instead of mapping all failures to -EIO.
> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5edeac961ec3..9884e06f83e5 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -232,9 +232,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  						  READ_PSYSGPU_POWER_LIMIT :
>  						  READ_PACKAGE_POWER_LIMIT,
>  						  prepare_power_limit_param2(hwmon)), &val0, &val1);
> -	if (ret)
> -		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
> +	if (ret) {
> +		drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>  			channel, val0, val1, ret);
> +		return ret;
> +	}
>  
>  	if (attr == PL1_HWMON_ATTR)
>  		val0 = (val0 & ~clr) | set;
> @@ -394,7 +396,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>  		if (hwmon->xe->info.has_mbx_power_limits) {
>  			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>  				PWR_ATTR_TO_STR(attr), channel);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
> +			ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
> +			if (ret)
> +				goto unlock;
>  			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>  		} else {
>  			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
> @@ -679,15 +683,19 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>  
>  	mutex_lock(&hwmon->hwmon_lock);
>  
> -	if (hwmon->xe->info.has_mbx_power_limits)
> -		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
> -	else
> +	ret = count;
> +	if (hwmon->xe->info.has_mbx_power_limits) {
> +		ret = xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
> +		if (!ret)
> +			ret = count;
> +	} else {
>  		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
>  				  PWR_LIM_TIME, rxy);
> +	}
>  
>  	mutex_unlock(&hwmon->hwmon_lock);
>  
> -	return count;
> +	return ret;
>  }
>  
>  /* PSYS PL1 */
> -- 
> 2.25.1
> 
