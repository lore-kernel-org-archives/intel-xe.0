Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491B0EC01A9
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 08:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F205210E487;
	Mon, 23 Mar 2026 08:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToTUTR95";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD4810E487
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 08:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774255926; x=1805791926;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FutBEJUy0UBehNEpZovpHJil9TotTC4waxPCsX2nXag=;
 b=ToTUTR95qC//QWKbuBM21ssA4/29bAB6AvSVpVyFUwdP9cnysirsQM3L
 3lYTRoqnEo5NWcCiNflQBLKJujVP1EEXUiXKzFj7KtBb08ywj1GczxhvC
 v0k2iwF7NpYpsrh9cOxh4apXDO01LaYq8G+HrlmuLJnGqMKl5mIIOWwTK
 63Q7jM5CmYFD4Yvd8cFcVwUaBDoU0ZJegioy5ga7hIEtNR3hz7LvwF8cd
 6Rsmx4DhHShzL5TfTUWGgOmhEp8phG6O5xHaOo/aodRY/z/UUSmecvzyX
 /xf4aWTEYv2Ob5AeKxrWCvRgtSJR4d1CFPum+0HoGIA1IjYogoqh4NAVT w==;
X-CSE-ConnectionGUID: M65QWO1bQpGvComAPYL7Pg==
X-CSE-MsgGUID: pt4pM4+WTqqoEAIToqiEIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75315117"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="75315117"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 01:52:06 -0700
X-CSE-ConnectionGUID: rZD1BmfkQZy+7IatVSV9hg==
X-CSE-MsgGUID: sIHmfwWoQgS5QUEe/wVkPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="228042463"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 01:52:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 01:52:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 01:52:05 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 01:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLrPLeGmCT/3m4+fbLGc1VR1M/FOjchXXXTKOEEYYobXvELNkS3eM3+LsmPcrj0W1Co6Tv6ojxsgWgkxcKqD0zp5mt4C4SigQ1s60tNXWv5JI1L3napnHADz846VSjqdNODdoRXGbOnGhfHJayhVgi+HqvIhR+5BLncI+B3FT8Ry6mp1dzkBv8I0+us4mTfiqLFz5ETeyvn+OYO+wBL/mcQ57eNFyopV2cdYLc0aVlGmlEWTGk6dXhHcuLZDfkBmHyiscaGF50bRSfJx7bIcKKxDfXnlV6f+Rz7VF7yijZRHFi1nI0U/AiZzbxSOzWyBj4SEX+OSSAVUHtelHIZsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LyYjqKyZXydiLrP/nkPBlmLm1zgUEhY+j03IPQbp9M=;
 b=WYjXBot36yBdkWWdDJTPirNZUguBaZTY3DRub989OpBA0KAh7mZsVeb2eovMwmSvaplD3x+7BWBDNKqxtW6itVcd6rvE4mtbORtcA8WwOE2VM+5o31wfjnL2qt+oSm6flAVPoDb9ki1YIXKsCRcopMTmGS2/6+2RjHt+mohYm6MBfF7g1W999xwxq/6MylCFOyyEM+mT4GV37vOLB9fFNHwnpRwLn0UirhP2Js41w9TR724V2IIYGLJS5KXCLpbe66pWDp1ZFZ2wknPDqTYLa67557pA6i5aK1I95Kf1Y69PhGZEnxZZxQIeztxS+tTB7IKzQB25FSXBMFZLIUj4uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by CY8PR11MB7172.namprd11.prod.outlook.com (2603:10b6:930:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 08:52:03 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 08:52:03 +0000
Date: Mon, 23 Mar 2026 09:51:59 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Add PR_CTR_CTRL/THRSH register definitions
Message-ID: <acD-FTKMfQ6j79jp@nostramo>
References: <20260303201354.17948-1-michal.wajdeczko@intel.com>
 <20260303201354.17948-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303201354.17948-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR06CA0172.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::29) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|CY8PR11MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c05802-5a03-403c-063d-08de88b973f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 6Lp3UZT5ErN0IOof8xj3PPMda6WE2O7hEonEgbsPmQShh20M8HftP3Cel4uyj0FwsXwfGOJiyVZOfyoOEetgyGzXtCrIh28RropO8eLn4lc5bJYwHaaVFoY3fyyNzwZanhF4AT08oI4tsZ7A6vqg/89F3WAE7OX0ORbvBqKhtgAtoul38FEOFBGjyl8J/6E+V/vN+sCgaK96YnouNUMZ8QaDUBtsR5jbKKUuaU7j4w6qS19bZJw7Xe+NqBrtMOSfjok9uHuTyBVuXi6q5joWaYY2FL/xfC7JMBpoXxeqL3G2Xo8nJhMLeMGoISz4Ux1BStS6klZ4cOcbUxVcJRgX567vK8WOdRDbkeJP3mDDTsMm/6x+Iky7UV+NwvBPGfaLHaF8tSO//ecR/hkWynsTgPtN3LEFpMGTFgYbVcAqxLzFVyujRk+IV2mIH2gSeN3J1Ym82e/LBc9+iIA3YYt1cZVtjnd8Fue3cUq39vHlSknldE6ml5EdzDVAVhmHWd4NvT4+9kdKQdnHPDW6EFXqGQbwwc0E46iCjx2P6hpFxk1JWDTWVYKNJ60evEKjHXbaQxSct2+ATltMfl+ByUpKy/CtwwOOhya9sFTC/3ztMwuqhjuPvPumFEWdjLhnCQ2P49PD+4tabjFW3OASbi1QU6B2ghnE2xiU1hOuba9CW4b1DoQI8gp05GsM7vmPgqkOGutyxypyyIvY6WY5yyL4D4szTrkTjKb7JtgOrMYxDo4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzlleGhDNTRHVnA1SS9HUTVwU0lhd0dSUHBTZmltWmtlTk5nR3NqdW9yWnpZ?=
 =?utf-8?B?TENBZGQ2bUVZM0tKTmJXWmNTVFhzZzZUUXV2TXhtbFdIUlcwRjJEQmF6dzl4?=
 =?utf-8?B?U2ZnSmdlWmJ4bFNiMk11ZzViL2RiRlVkem4xTEk0SnNuRW5abHpDRkUxaTNl?=
 =?utf-8?B?Q09sTytLSHk2NHhkUVZaTEpKTno1ZXJyMFN0RlJFVHVQV1NDbkJlQ082NFFi?=
 =?utf-8?B?TEJyR3R3R2JjclNwOE9uaERTOWNGRUxpMXVlNjNlNVVJeWl5TGNWdHl4T1ow?=
 =?utf-8?B?U1BmZ2hHM1F5V000Q1Y4MzhmMHpEQ2ppS2x0MVRkenkxQ1orTDdlZDkxYmdZ?=
 =?utf-8?B?N1EzODJjTlVzYTZSQlJOWWkzMDNmVWNNRWFEbDJxbVg0R3gwbGxWaDJSRDI0?=
 =?utf-8?B?Vkthc2Y2WGdVVlhnU3A2eXp0SGtnNHJnWlFDS0xqTCtJUmJ6ZlI2cGV2aXRJ?=
 =?utf-8?B?c3lCMk5SMTY3QnlBM2Q3NzNPQzVHVjUwbDlGUHMzb1JhZnpNM1N4Q2tPVkd1?=
 =?utf-8?B?VzBaVzF2UVBOZWVJM3VNSWwvVThta0FTWmp5ODBOREw2eHVMNk8ySER0WXV1?=
 =?utf-8?B?Y0YwSTBOcmwxR2lVd2diK2tiWk81MjVzc1JrcDRqWE51dVJKWlRpYzBYa2wy?=
 =?utf-8?B?dU5FQzdURG5SUjhaTXh6V0lvUXFWV2p6eTRVOUdBY2tFcG90MUxOMzlWSUNm?=
 =?utf-8?B?WDBhaVl0UG9icy85cWtBVStOUTJEYms2QUU5VTRvemJKb0cwbzJSOHhuc0Qx?=
 =?utf-8?B?T2VCakVtTmFwUW16VEJlVytRcEsrTEdtVUxnaUU2bzJYcjQxUkt1ZlVRVkw0?=
 =?utf-8?B?ckxVVytHRnFFQVhZaldGdGNNRDhpY2NWVG94WGgyb3cxWVhaSnhjZmc2SHlq?=
 =?utf-8?B?YVd0WW9ndVM2dUloOGVXUW5lYWQ2UE85eDJtZmFSUlpiR1dUWmlHRi9Wdk5z?=
 =?utf-8?B?UWlKQ2NtUFpmMEdEajRFdHJmY25mQXdOS3NDWXJVYTRjb2wxVUR1WGN6bzJt?=
 =?utf-8?B?SDliMGRiSGd4Q3RmRDk2WXFReEVwNTBNdFRtQkMvUFh1Qnh0bGVROVJPVmJI?=
 =?utf-8?B?MzQ4ZFJJOVg0WTBuY0FIMlhMaGIrbVZhQnRnRFRuN3F2K2g3dk1QKzZqeUJy?=
 =?utf-8?B?UElaYUc4ZDBrcWlLZVZLeEgvUG1TN2lpUHVSUm43MFpLQmhDT1FEbFQvV0Zt?=
 =?utf-8?B?bSs5bVgxQmNXV290cHIxMldIa044NU9iejZvYnEreFlJZC9PVlhuSmlOVU1s?=
 =?utf-8?B?MlhzV2VOT2V2SDI3c2E5aW5wVHdnZ2UvN0Q4M2RtcHdhV2h3aGQ5Tm0wT1RV?=
 =?utf-8?B?QUp4dUFsamJ4bDFBM2dJUDFXaElHOG1PSG45U05HTU4vMVJlNldNNFFZZ0ky?=
 =?utf-8?B?L0RJRk90eDdIL2U5VjFCblBXa1c4VzlyNWlGNWdKWVNUZUsraDRDV0ppREFo?=
 =?utf-8?B?TkpHbWVJNHB4NUo4emJWb2swL0dsM24weGNyeitySnUyb0F0VWdyQkxrVUFt?=
 =?utf-8?B?TGpBRmY3VXdMdHUxRUh6SFR3b0tmYkRBL2M2QitqRXpuSE1hNHZWbUUwbUZO?=
 =?utf-8?B?aGN3aDdvcjdNOXlVbWxaLy9nRXFYcEJOTUwrVXF5TEFoaitvTU5SbEMrNVBz?=
 =?utf-8?B?VHU1OERpbXBjR1RneG5kdEN1VU5BZDRTRkVUTkNFOW5xQm84UVp5bVc4YzhS?=
 =?utf-8?B?T2hyQ3N0NkZsRnZ2UndJVm5ISm1qOFlDaEVIdWxhdXFlWWFRWE9RcldLZmF0?=
 =?utf-8?B?bnk1U0sxdmpBQzNwaGxiMFFrNG9qK1Z5N3VESWZhOTlhaHhBQUUvSm0xYkRq?=
 =?utf-8?B?aXE1VFVnY2R6dzUwekxSekhiZC90ZDVhNDFxNXl6WmR3RElWM3RCaFY0VzBY?=
 =?utf-8?B?V2VrUlpoankwbDhlVzFMeWdaeWI4eFpuN1ZXVUlTZHhrekQ0STZqeGZBQUY4?=
 =?utf-8?B?S1NMUHo5dExCb1hrTlhVUDN3elBuVzllSkpTR3JhN3k2THpVeDdvcGlnQ2cr?=
 =?utf-8?B?WGQ1Wm82UnB4REZXRm5kL3NONDRkeFdvY3h5blVLaDRVZnFYTkVQMTM5RDRE?=
 =?utf-8?B?alU0SU80dldMN0JBaXNsRGZWUStWc2pRYXVZTFVUcXVpMFpqNnIzTzh1bHIy?=
 =?utf-8?B?RVcyUTROL1o0b0p5RFZWVzZWSVZsSVpWNnRIUEthSFFiS1NkbEhYU2thTC9J?=
 =?utf-8?B?NDJJbm43dzM1SUM4RmRtQndldG5rVExqczlCd3h4N3VTMVRvYWpaWGNic0h3?=
 =?utf-8?B?c1NSNERIblA3b1RoU0JYMmp5cVJTWXFaTTUwMHJvdldsVTgvaG83aEdZRjRH?=
 =?utf-8?B?YUQ1ZzlLZXpWK0wxOWZRZ1B3ZksyQmtGVWRlc3RKYXE5SWlzZU1LNzUyRGxq?=
 =?utf-8?Q?Y0c9BpfFzaWUIZp8=3D?=
X-Exchange-RoutingPolicyChecked: Sj3haU4hM/tRvQlvvH763QEZZsdpQuFLRjxzVttR6QTKwcX14xhHxFVqrxnBzya1OoOvalG4m1OgzZw+xS8UDCVxVzi6PoxoufUOynPJFGpfD+LPQf7YVrmlt5w5QIp/9nITxyjGnut9S4NZT6yUfuC3qVizzxseXGNN+y+cyanKeF80ptsQrFmYPiTnZLwZpBow1ufETYSVV1Z5+VQb55bQ/MK6UTf8cszmzjSDPG1dxka8yL/WyrfoXSS0rPhIvVTzszAaoAZFGGX2xlF6MBKHTc8iSMj0fTgT8WpSS0XXUJZMLzWSOddxYokS4Pc0JAqKmaGzu2v1NmwjWz1MXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c05802-5a03-403c-063d-08de88b973f0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 08:52:03.0768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4RUnJ46CJqjbCANCkjBKoezPn/Dn6ohixqyJxd0fJo155wZSgWsUsd19kzn4LUz1DN2Zo8MSNdnvTwsH/j8qV2LsMb6V/YJXLVkHGCGt5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7172
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

On Tue, Mar 03, 2026 at 09:13:52PM +0100, Michal Wajdeczko wrote:
> The Watchdog Counter Control and Watchdog Counter Threshold
> registers are needed for watchdog programming. This watchdog
> will generate the "Media Hang Notify" interrupt.
> 
> Bspec: 45999, 46000
> Bspec: 60373, 60374
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index dc5a4fafa70c..1b4a7e9a703d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -132,6 +132,14 @@
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>  
> +#define PR_CTR_CTRL(base)			XE_REG((base) + 0x178)
> +#define   CTR_COUNT_SELECT_FF			REG_BIT(31)
> +#define   CTR_LOGIC_OP_MASK			REG_GENMASK(30, 0)
> +#define     CTR_START				0
> +#define     CTR_STOP				1
> +#define   CTR_LOGIC_OP(OP)			REG_FIELD_PREP(CTR_LOGIC_OP_MASK, CTR_##OP)
> +#define PR_CTR_THRSH(base)			XE_REG((base) + 0x17c)
> +
>  #define BCS_SWCTRL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
>  #define   BCS_SWCTRL_DISABLE_256B		REG_BIT(2)
>  
> -- 
> 2.47.1
> 
