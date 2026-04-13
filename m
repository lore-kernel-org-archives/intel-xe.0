Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B19F34C5C
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 15:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85C310E4C5;
	Mon, 13 Apr 2026 15:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="my01nZEz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7FD10E4C5
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776094092; x=1807630092;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hrJ/Dcv5gs/O/P5+XgktoirlkpDdSNzPe37eB/Bx1DE=;
 b=my01nZEz3jtEYW0XyUFtQZJIEFTnKNnC2zM/nfEP0GsMcspCCMbMKWu7
 O8yT3LDLng5U1LiRGPFh3O8yqqXQWVHPItst/1blZjL1cIJdRm4yXWapC
 v65d4EidZG8NdGaPvuzB5pLyUFqwhhNLcMBVWZDKKWagE5Q1bQuhrYm1S
 bXqxk/R3rbgwzPB13bXFsusiEFaGoUAwBqS+09nq0evRfjVtwOwSi5TXJ
 b/RtCqcuEKILTfnw85zDQZnH4vyGKqhuuWHx0IyKO1TXQZK+27VbYzG71
 6YYG8cBXjqAsE//v1SamF5gAFjNgXtolU1dYiTMATeODTZj+vuGXRsGWD Q==;
X-CSE-ConnectionGUID: 29g/TOCxSvuNWhmIzJjYnA==
X-CSE-MsgGUID: 9XWEtmjCSvqftsByTSzwbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77052003"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="77052003"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 08:28:11 -0700
X-CSE-ConnectionGUID: 8UKduf4+SNKQr7xDpAX0XQ==
X-CSE-MsgGUID: fbum7FeFSbWVeEOjcrEdgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="229694383"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 08:28:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 08:28:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 08:28:10 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 08:28:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6lC7fZP/Ps4FV4DqRa0Au/2GpflAle670q79pQsDBQbAB4OuQYJx7A99yGkvEFPXNLzN6KD9NIfwa2yrkBHfkz3nZ72yboCBDvIzUgrt+Elvf+MESLAxzv3/94pYZFaqy2Oe1di0IpcKUQkx8l2BxLpw7dOz30PLk50jHM9Uj1kAS/PqsCFqQJe+0iqhqcyzBE/0UJ9l2aMCbkHQ76Jh8HOAC6HVKeP4TGF2Vlly/iLpU61U94weOFtro9NUoJ7uLsTqtkictYt3N9ZmxpBCWU+NCTQKrIDXoU7/8xnvGDLG9i7voGUkjhiMwPxJ3QyKT6hNkdRjcWKcSUOmJyDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nFEByaaSB8eXf3RSbNyhsug7wu0alw36QqNI9CQW/Q=;
 b=Inx9OtP8O2ILGDq0A4Pp/fM3P19w5AznvQoTXZWqmuVHKJsTX6Cch4+IWZyQ1s0lVQB8/h5R5xPchUGzrsFUSPsSTUigT5sbmVu7ehcXHOaDKGBbMtyHzdvFWHieRUtXukRwxufPSF0ziTbaWfM7zMgRmLkhhYvfF+RRT6JU3hdUQ+YhnKTdvUqMTOmitqJ6NoHx4aGPR2l2firUGip16qMvXv8ibz0KYwPyQ02/GFjetqpv0y94DGq9v8l2vUhEvw9xzJvrQ/b39Dk5oD9WCMSvjfIVNy3TKNlql0aWpeQWt5mSqsHLui8lMH/CNbzzJ87v+MaGdZItwGBHtAMOmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB8246.namprd11.prod.outlook.com (2603:10b6:208:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 13 Apr
 2026 15:28:07 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 15:28:07 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/tuning: Stop applying CCCHKNREG1 tuning from
 Xe3p onward
In-Reply-To: <20260410-xe3p_tuning-v1-1-e206a62ee38f@intel.com>
References: <20260410-xe3p_tuning-v1-0-e206a62ee38f@intel.com>
 <20260410-xe3p_tuning-v1-1-e206a62ee38f@intel.com>
Date: Mon, 13 Apr 2026 12:28:03 -0300
Message-ID: <87mrz6op6k.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::35) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ff85c6-d252-4a80-38b4-08de99714347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 91x4CHdvkfE3NXRXV0YMbWsmcE7tppaHtCAHw6n7GE8S2quGJvLiHKa18qiun/catvZ7nB6GYMTXMf/QGZ2xqTyhXh2vwKW09/OPCpw8wwEv/UzWTojeHzSP+8aBiL+Y7yMlql8nD42IcROgexZEOOJz35AV/f+mRMfO71pMwaAkpW0fvzndjiX1rOA5CRvi1+69g24sg0dZ1I+wm0Vgqar1HWo5uwmIGb97rd6S2gNlWtTOPSYXmTWLuOpDakMz2NmlwBaPFV4HPEMuhXbYXc9FHCcMcaZHia3vth3fS1hNgbuDmZb+32AvottRagHieUo1y9wLopJ5z/QGvmqRJ5Gq+aIc7Buawxfc7/3fm7oNQxsUajNrfHbBouY51fT2TW93p92BGo2CSTHC48U8zVwlZp6T5DN11fNI0jL1ty+ddbs/JR8cgbOdoQb+Zi5TrZlbhnAu+MxSMi8PwU4KzhcTIPJrzFA6H43xP7IRLQ6zAnCaVJe4YAthir9i0M9vqhKvy3K2DP82lfaaPxSfjiz9twCw7zbMpSRjbpQZnfZZnS59LeFYtAYqT9waJqFYECrVRaXgQ2d3p9mMTygTODAGeiqHj3HK9WN1TDSjjHVN/CoLO6idX3n0c+csx+Tj+1MHa/cIxgRYpHLJvO0NAKFpR0UOGVauXbIffKezNkki20muFCrT5WpYztMgYCHJcvuSq4noSBz68xEGDwlJCMoOeuaeHvlBP1h3UQHIgK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HhES0u1x6eie9bMrxqZqDpIsdfvaMdsM61T+WGbVQYyPPvRBYbQnQaveFAHe?=
 =?us-ascii?Q?IJJiuN9SGgbzaCIGV1coaghcY2XbquhQCn/HNL4DKfeSI+3bvq2gD5frNL3S?=
 =?us-ascii?Q?kzKHDmTOiEZap10wsB5J79FG+B2uGaNf6Gqs2JNHW3CI2s4BTtNbhbnvcOtu?=
 =?us-ascii?Q?ksO96Rf4BXDWM/Ohh0Z8clHuMqvGGR5/rC36D2F+gXohgXD8596/RJFIOVuB?=
 =?us-ascii?Q?eeYP01k80ts9rRd3jc+9g3lmsDksrpk7ktI2zXgMByUWrUGr6lzmAwR/AivK?=
 =?us-ascii?Q?ftvfk/9s35jEMvBmxQxV6EpP7ZVS2eHO/fbX+a8doJaKkpJ0GK4jDn4x5pAT?=
 =?us-ascii?Q?olb9bduWWA/ANV2VmDekozZfC7e88IyjTHvGqkweanVgzazpcCGScoGqUedl?=
 =?us-ascii?Q?QSBRmlwnI7v9L6Gb1/mRihpjYBJRY0JCc+4NeKgWyBEZl0HgaCR2Oi95UJzB?=
 =?us-ascii?Q?E5vrRuyVSp/YUpcqSxB2uuaUXza+oLuC/tFn4sWWWqLDGST2tY2dkQUcv4Rp?=
 =?us-ascii?Q?5yP7yS7qie6W7ca0MWVCziegTpkAXbxHUHyWLFZDyaadglOhIuDZQNPGI7EP?=
 =?us-ascii?Q?RgkN0GXq8SSWt37S5wRQHb5b5NVaeOq1oDvwBwxmFpd8fioVV9TW4qhdciHI?=
 =?us-ascii?Q?v4vpIKzOMaV4KT1U4AvZ1PNkxB+Cs/mgGpILbvVUNNJCHAmxt7z0ND+NUVjU?=
 =?us-ascii?Q?HhZDdbZTdO0eBEdpeGDmB8TSmNpuL8IFzpCc6/KIMWrRyI8ZHrZxvT5l57f+?=
 =?us-ascii?Q?Do8oDEbzKUGBsBwMLhH2I8reDWSF6D8SP5lshGv+nMp+9/fW8nrS9N3Lj6bl?=
 =?us-ascii?Q?UE/57hQC/Z8cByk803JwfNdF+7rac3xdyhHwe3KnD8xL0ZlhoLs3RC0vhStB?=
 =?us-ascii?Q?mWUEwShMa8B6rmKtcQ4m8qQE38Eyc7idjajbZkSPqg/LhrDhK12fgZPk4u1/?=
 =?us-ascii?Q?/mmscJ4m/USqxDwRo4ut72QdAZ11U2E5g6BvbDhx1H+U7T6x9mFxNgG4SZNY?=
 =?us-ascii?Q?f4bKZ8XF0BGSba7H1994+r0qZs1GZ+LWKSA4KLPTOlsPQR2Bmi41mmDuU5Dd?=
 =?us-ascii?Q?VpUKb4SLsdSX7oKkQhqQ1M7kaYmg7oywgAIZ88KnCZC9faW/rV6yF1lghEux?=
 =?us-ascii?Q?dycrArjHtQRlG45c9H8I6c+N8xW9amPcGY9syG8Raqk24usAccOJmXJP2QtE?=
 =?us-ascii?Q?H595+wJT2PUrGkrReep0qeLUZ7K9sV8JeCpll5GuWssJwvJMIxLVpBqFspNW?=
 =?us-ascii?Q?pa1Off+9ZheUZDhj2pEcFYv/ZXTKaH+gkxp2ZIa9QXBpGA9sbLOuDOto3Q0h?=
 =?us-ascii?Q?PP3yF/TIjU+nO5s8dNbQ0AVbcn3VeaaztUnJNlgp/RA+VafYHz6ilByJnzW0?=
 =?us-ascii?Q?h1c2WD5OYaT47lbEKYwKhGpUt61An98XTj4zsll0Y6YZCcESCzyzhwQM0drE?=
 =?us-ascii?Q?BPpNG+dPim/dREJqGjWvN+TT+DAmSOSYi3SB0buVGtP5SxTBJyp6QD5fOkTH?=
 =?us-ascii?Q?9MdiKoxMqMZGJIq0ppb0w7+Jo8OS4bCfXgij5uJYlzPT594rWaJvzbz3sfeI?=
 =?us-ascii?Q?uXaZSicAgbNQy8OGeEn3m+UDvmTXDkqfRHNaKFPVeA1Q/IodOOW/4+adX+6S?=
 =?us-ascii?Q?xYHJykC5ENuk+yR4fw9PRleEKCehkRTqyK6CytuRwpTkKBAQMfguv8DkeweL?=
 =?us-ascii?Q?N+Q3YJwVmuFcmRTElwPKM13IvYZ+yM0Bp6bMtoIlR4V2Fzd+S6D+JYpEXW4K?=
 =?us-ascii?Q?wtFL5+JTFA=3D=3D?=
X-Exchange-RoutingPolicyChecked: GdmHbb91+0ESCAn51YwggJYjrnsqYks63+jDFUdT3jYKG4GNVfpoBzyTSItNbXUtWz2s9bn95W1DmE5k/AdXBAeTKBz05mZJ2vk63YlqAMSuQ4O8eJNr415EEP9oycA9jQUhTkPZzNGu9PqMKNLXagLsn5wy3tq1CfCXP2CCoLpmQCzkXy+9RtvRbbaxQJSMbcshSOgrWbs6YRwz56/5+nrnVpL5+FoQkCf1m3xDcETF11jBFyfM07HXzLjSfCvt0mOZ0g6w/o5T+ZY0U5lBaWV8yHRQPSuMFWHzRxipdvHB+CYjRRUGVxFjQw45TSYjZ0V2Kflz2/EnGfodUfISVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ff85c6-d252-4a80-38b4-08de99714347
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 15:28:07.3802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzDVC3mLv5WclDcT7rQqtfRegmXrl/RLtxTvDaMminlQj6+9ZQFodpH/4ImA7+iXNS+DRW1Pm52PHz+thQBCXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8246
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

Matt Roper <matthew.d.roper@intel.com> writes:

> Whereas the tuning guide gave guidance on adjusting various CCCHKNREG1
> on past platforms, starting from Xe3p the guidance is "Leave register at
> HW default settings."  Set a version range upper bound of "34.99" so
> that the current programming will stop being applied on any Xe3p
> platforms that have graphics version 35.
>
> Bspec: 72161
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_tuning.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index f8de6a4bf189..ea48e2a60fcd 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -43,7 +43,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>  	},
>  	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3499),
>  		       FUNC(xe_rtp_match_has_flat_ccs)),
>  	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
>  			 SET(CCCHKNREG1, L3CMPCTRL))
>
> -- 
> 2.53.0
