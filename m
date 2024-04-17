Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CF7C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 00:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA19D112FE0;
	Wed, 17 Apr 2024 00:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecVZinfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CFE112FE0
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 00:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713315097; x=1744851097;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YApYo55oNffYMluynBNl2uUgPQ2RMpizobZayieZrMo=;
 b=ecVZinflhDQ/IVcKqNnv0az8enf14Yq+3Oa/mo24CjSTa3X2/YaIuQso
 LpTlQ6wbVJ5h46GmFSKQyXk/ynVjjnvgUEQgFmu/NhRaQQOoQ8Zb0zmG7
 IRaAKdbFiT1Fv6/spxVMOU0VmP8Jon6F/c5pmOM2rHD7VMS7vSGXvcRj8
 P/1HGQZwajFKgBTlYYARY73P7DX+rrmP/yqY61RYuqQrKlc61VXrz8un6
 CkMy9Ntb7QfY0BAAvOPlS8VxgQTWcLLsWJei6gXt8SWG0NSRqiCcUOadi
 6WnHBGrj3TCjxDfkUWHLwnyitmvGKhoTBkIIRYR671gKEoGqTyGHmyJox g==;
X-CSE-ConnectionGUID: DJso0jEOT3GD9MDY1qHVuQ==
X-CSE-MsgGUID: XODE0cjTRwymsdnAw/hjog==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="34175450"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="34175450"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 17:51:37 -0700
X-CSE-ConnectionGUID: zqCuoldQSEW2hCcuo40jEQ==
X-CSE-MsgGUID: 4D852SbdQ2WHoSzDSiEyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="22448028"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 17:51:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 17:51:36 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 17:51:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 17:51:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 17:51:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8pQkOXN3k6yRdtD+FjKIzAkCt+2iJb942xjSaGgK0fSmMfk1c9C5VByFGJM1BT5DoPN6FXfkXhigP55hyFrftgPzYMawPwhr8qvcTDEZle5Gd+oo00bEgvJBDYtnJJnADrTvIwa+UhzCBQMCXZ+W/UbkcgoDdser6/2C8fQeIifg6DiZC+MU7729sNFarQEFvQRDKf7JHOHXM/mCEv8PxaLnnUp4gOnNQyXIarzhA5/ThFEQ0h/qXn7Dq9kw+II9Cf0prnt1vbqA7sBNFjPv4Cx/owrKBpqAJoW91N6Ul4N1+/BdDjbQ4b4d8eKMHYMaohcy5eAgBCP0atAQvWcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtQBmXcvSH2fF+nDFHkGByW/ILiEqfH8bxnL+U871h0=;
 b=T72ZAFPCBh1wuwgBWiAtXqDJ9TS0UysNujR2pwOay+ap5sOjD/zWPim6I6j3QG0Y60wDB3GOdZxkdg/At048MaP4PBX0j/kLxCOmZk8B74VlDwvRc7JZXAuaz1dVYct0i4lqBs4wDYWoCAZvXejBmDMxtbqvXHcAUfAdorRXg1deD6xnPJmQwBdB+UfwI5qnRf0jMcmdiG2H1BUmp7WMnC4xX6UGW1Rd91Y6b1bMpdUWT8x7hpnejNYwNqJqUKCxZINx3Tn1cZ6BikEHpi2iAAXrVuUlnKltxxaZp+f4Dy7o9/EXT6js3cHDMXT940fohmby91rMWfgUpJ4lLwPp/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW4PR11MB8289.namprd11.prod.outlook.com (2603:10b6:303:1e8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 00:51:27 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 00:51:27 +0000
Message-ID: <20d39c77-2a8f-4512-a352-b0b02eff0d35@intel.com>
Date: Tue, 16 Apr 2024 17:51:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/lnl: Apply GuC Wa_13011645652
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240416194106.1540872-1-vinay.belgaumkar@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240416194106.1540872-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0180.namprd04.prod.outlook.com
 (2603:10b6:303:85::35) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW4PR11MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4b900c-5f41-4354-05f4-08dc5e788396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: elGXcE3Q4YuRTZwJXdLFV+IE1giLCxKE/d9JQ0LWosROZyo9aL3ATMuqTs0Xe574zPIC8KNERA/DcleKG/PDfPFBH1iHue+IueedCGZ5HXBQvLDWzUe60a6LGZrThUpQRawF2YKnbTOWMHr7C1035vzGPPMN/anbWHYVJMc+I76yN7CQnLxYZJ7IQGi3PtumGdxSywR3HkcEuPNTW4ztHVAZobAhcbAeLt6B41pxxZVZh6WEk+6wV034Fu1fVO1n51QfN0WrVSxfMtt9/eHVd7W4HtoK0jIfowcvYTW2I6ilcPjYDWG0Nfan468gofGS0CJTGgjBhjWuMwTBRo6dojjaZgAeCZpWejxwoqANzsBp0rR8NO/M1ucWv7XPy2gzwDZ0KTU01d1TOS4VLK01LzPZbFXLXH93AcZ/AxAYkCvY8CMPxXDmoC0PII61mkpRTGssAsS7D1hj49Uve+SfRFpZISBKXsPTEWBAI14m+ld6Kn0DPEPRzpSO/MwCObRMvMAmqNFDRkxnFtWGb1NlW0Hf37dJbpuIYAML8+zonfJxwKEzpgTp7212d34liT1UaA5ES+BJb2YluJ2fvbMig5zMJNM+emnMBirFyzMlNRmMIjpcdSLGfZ58XofJH4byoNzxJX25sce3zEi4w+qe1i3WN4V6XQT3DyKLG85lE5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bytlNTlFTWhteDl3bzg3UXEvNmJOa0o1TDhWK1MzMXlEOHJqZ3JUd1pweHVV?=
 =?utf-8?B?ekp0elhBU1dKU3I2UStGZUlzRk83WGIxQmdHcVRLVTJJbGxtZHlGUjQ2UkJp?=
 =?utf-8?B?dnRFcTdkS1dSbEJyWUxQajJlRHRCdlh0dU9vaDNtbmFxQndya25YQ0FNZ1NT?=
 =?utf-8?B?bnl1R0x5aEUraDladW5jNUx4TU95U0h0WmRRV0hkaFp4N0RHaHorWnpWMTBw?=
 =?utf-8?B?RUpkc2lVb2lxajhzNWpHMDBLNk1pbWE4Z0wzTGlzMjltQkNWVnFoYTdndFlQ?=
 =?utf-8?B?bjhmZDdjNVY4OUtLS3ViWHMycVZZNGwyd1FEUjdFVVFYZDdZaEVIRFBucDBX?=
 =?utf-8?B?N1ZNTHd4ZVdZdVZoYWJvNHlBRTd5Wnk0dEVzVHJZTGRiSUQvbVl1bG05cFNi?=
 =?utf-8?B?VUxHZWN0N3NobnNuL1pjOG52b1hhRmxBWEp4ZFRlV1BMQ3NUVjYwbmFQNGNF?=
 =?utf-8?B?TnAraDcwTEhFK0lsdmlsWS84V2JqS1BSYUhIY0ZGQWRJV2ExckN1K3ZKb2hI?=
 =?utf-8?B?ZXJhRUxRaU5GbWZxeDR0V2htUkpiOGwrZG5HV0Zka20rdHllSEN5UXFBK2hm?=
 =?utf-8?B?a2xQM3VxT1NBeEdreUQ0UDR0M25FeVhLYi8zL1JjaTdEV1ZLTE9LYXgrbzFx?=
 =?utf-8?B?b3l1VXlsazJZK29TRXNxY1hmRExoZnJ1Q0dLUHFhcVRiYUpRL3B1eTFGMHVi?=
 =?utf-8?B?U2xIc1hDLzFIN09GdE1MQUhqTGpJN3A1aVUzZzN6cXRkeksvdmphODdjYlYy?=
 =?utf-8?B?MWV6Z3g5WmFMWXF3NHo0bHNTOXBwZEczNHhuTkVObW80NzFnMDBOVGZjRzNQ?=
 =?utf-8?B?ZHEyVXI2Q2lWOGl1djZZbXJHNFA4aURNUmpSUWJZM1dYQkR5VVVEbEdtcW50?=
 =?utf-8?B?cldER0hVTFF0dXVVTldBelJjR3FtdUVoSWp6UVlaSkp2QjYwbXhieXBxNWE5?=
 =?utf-8?B?Z2krNHB5eTF1TUZtNGdDY3hNR3V5Y1JTVmVvU1hvYUUvU0Qwa2FZdy9XNmZq?=
 =?utf-8?B?VUxnVlZVY3MrZXZkVldiMEJLN3A4UFN1WnhzdDhDVEN6a3ZJemhPdjBQZUFm?=
 =?utf-8?B?UkROV2hMeXJyZmJJbms0WDVGb2dtK1FkSkxoQ0tEV00xaDZnelhYTkIvVCtu?=
 =?utf-8?B?K2tHS0xZK0tVVndpWmNKZk9vSzNISVRCODBHV2ZQbVlEUjFoaVF5dFpzRldE?=
 =?utf-8?B?T0VQWWRtZjZZMG5EemtHRzVMNnFOejc3ZzJHbEVVU09udW5BdkdtME9qSE9n?=
 =?utf-8?B?VW54THBpVWtoY1BoT3lLNjJYb094eWNaWHEzVHg5SU9menY3eGJRZmtCVDI0?=
 =?utf-8?B?eFhPNlBFeFZRRkdxUTFJdno0RDloQVFCSzNFU2UwVkkrL091bEladENrYVhH?=
 =?utf-8?B?bkpHcTFPQzVzbTNCem55M2FqSkZKVmF1TEs3N1pZNVRyWXdHWTZIa0hoSjg5?=
 =?utf-8?B?S05qaVI1SldwdElSZ2t0TFlCSkcwUkhjeThvVFZNWXIxallwSytGdTVzTmRR?=
 =?utf-8?B?Snk2OHRWRHNXcDV1Tm5ESFIvMSt6d2VyeW1zQnduR3NYcEJ0aWxUdnB4bE1D?=
 =?utf-8?B?QUVXT1ZnVmZDSXI1VFFlTEZ0WDE4eTNEWXN0VUVzWnVKZ0t4ZFVRYTVOcnph?=
 =?utf-8?B?M2lJWHA5SXU0Rm50OXhWRXUrd2U0ZkRIYktnMkdFcXhrR05ndXR4d3Jtc1Uz?=
 =?utf-8?B?N1FGQTkwNFN6UGE0R1kvdmlpMVdJeWtRV1VGbENIQmJtbkN5VTJkOUpPdnY3?=
 =?utf-8?B?OWY0Y3UydTJxNVYxSkk2bDQ0UFZWS2tPWHplSklTYWRXYTFadHZubG1OVjYv?=
 =?utf-8?B?UkVlYUREbWZ3MDJCMi9SQWhlOXk1UlhNWlFZRWx5bENTNnRKeGJiWCtFcG94?=
 =?utf-8?B?M29ORGEwZkoxRFQxK0taODhyWm1xMnd3cG1Sc0orbDFvSFJqdGI5L2lOUDd0?=
 =?utf-8?B?bzVzbXlrYXNqMndudkk1ajBUb0ZORURiNVQ1dlVqcjByVDdtMHluKzVteExU?=
 =?utf-8?B?NTdFVUFnbXluWWhPT3lPQkZaYndNQVpKVTZrMXRGMzRyKzdjaDlCNHNyVURN?=
 =?utf-8?B?bnJUanNub0RvS2h1ekJRazBmcVN2K1E0WVJ5SmFVWlQ2OXBSeVFEOXZRbHVU?=
 =?utf-8?B?N2xrQ1p2Y25XUlYvQW9iNjhYQzhQY2E2UXdFa1AyUThsQmdVSWo0RStKWEVu?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4b900c-5f41-4354-05f4-08dc5e788396
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 00:51:27.7910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIsM0A+4sTU4gKuKt7alvRCw3Ggsszr9mHGI9GnL3Up9NqVcGamaCvLM/XltKj1L6/EXoJMLB5ghwzyDnBoqaEq7RfarISo8Lxh+l8t+Wxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8289
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

On 4/16/2024 12:41, Vinay Belgaumkar wrote:
> Enable WA for a bug that could cause the C6 state machine to hang
> during RC6 exit.
>
> v2: Add comment clarifying the WA (John H)
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 34 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>   3 files changed, 36 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 0972113f6b81..511cf974d585 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -326,6 +326,7 @@ enum xe_guc_klv_ids {
>   	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
>   	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
>   	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
> +	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 678ece366056..4e6fc69a4710 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -282,6 +282,33 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>   	return total_size;
>   }
>   
> +static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
> +				      enum xe_guc_klv_ids klv_id,
> +				      u32 value,
> +				      u32 *offset, u32 *remain)
> +{
> +	u32 size;
> +	u32 klv_entry[] = {
> +		/* 16:16 key/length */
> +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> +		FIELD_PREP(GUC_KLV_0_LEN, 1),
> +		value,
> +		/* 1 dword data */
> +	};
> +
> +	size = sizeof(klv_entry);
> +
> +	if (*remain < size) {
> +		drm_warn(&ads_to_xe(ads)->drm,
> +			 "w/a klv buffer too small to add klv id %d\n", klv_id);
> +	} else {
> +		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> +				 klv_entry, size);
> +		*offset += size;
> +		*remain -= size;
> +	}
> +}
> +
>   static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>   				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
>   {
> @@ -327,6 +354,13 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
>   					&offset, &remain);
>   
> +	/* GuC will restore register 0xB04 to the default HW value of 0xC40 */
This reads to me like 0xC40 is hard coded in the GuC. I would prefer 
something like "On RC6 exit, GuC will write register 0xB04 with the 
value provided. The default value for 0xB04 in bspec is 0xC40, so use that."

John.

> +	if (XE_WA(gt, 13011645652))
> +		guc_waklv_enable_one_word(ads,
> +					  GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
> +					  0xC40,
> +					  &offset, &remain);
> +
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index eb647d5a1e16..12fe88796a49 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -26,3 +26,4 @@
>   		MEDIA_VERSION(2000)
>   16022287689	GRAPHICS_VERSION(2001)
>   		GRAPHICS_VERSION(2004)
> +13011645652	GRAPHICS_VERSION(2004)

