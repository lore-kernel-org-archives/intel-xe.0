Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1937FC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 17:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40641136DA;
	Wed, 17 Apr 2024 17:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhoLX3Rz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003D51136DA
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713373851; x=1744909851;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Sv9IgQu6DS2DlN5lq9LpWpSIvaMKGJxPJq5Q7HtGBIY=;
 b=DhoLX3RzU+GtjZTsd+mg7RzTTbdQsS7udzKOdze3fNyqYXFmmwXvGT0Q
 oEmwrdqcBak57dnX8G/uJ2NjqUVsZJ3Ny9HkSMImKEKEgzXstpMZCfqqc
 71cqAqUpClnUXEZlfZQu553l8qsYs2u73QMgXuREUe1ZvgnqtRKkXM9fv
 IU3Wl9JN+xXJ0L41dWKa4Uxj8iB98238SEPR8wjCPH9uV7sHZ50uJo4pw
 /3ZMVpAbDBUnOcm7GiE/lLp032ky16kvs54mLWaDPSlku/A9lmtPQ9jrC
 bbyIIOPMnrlDkPqF6sNHuWM8xmx6s+pAagnncNvnqW14hsk+uarkqhE27 A==;
X-CSE-ConnectionGUID: c0+tjPbpRy+HanNeQAQhdg==
X-CSE-MsgGUID: AWpfGpB4RzKXLDaGbMuIgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20270840"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="20270840"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 10:10:46 -0700
X-CSE-ConnectionGUID: jTTheC69SFarm1nHTH1IsQ==
X-CSE-MsgGUID: 9QBRmPrvQKazVrN210CO1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22577802"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 10:10:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 10:10:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 10:10:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 10:10:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NM/yjJkbu7P2jbdx+lIcwmosaBa5YHZ3SNGtKCzvGQTsT88bV8dFHjzglY3XYoSfoALIcCQriIOy82cJ2gVf36zwEdMlZ3wJdbrgV2z/qwTc/wX8tFWDb0BFucQRKHoUc44Z9aheUHZ5RxiR7SEbW+WVhghKNA7et5Ex/qZskq+mQmhPk8v1G7z6U9T/WIz1hFQm0fnUtusNuUaFqfOiIGidLKR/EwktIQLLJWdfT4oFFQrQRvbdYw56gTygvIn92wwbJJdSMkFiO6U160T256y3EhUWahRUX81+HjoMIayWADnNpT+vW3Lx6GW6A8TEnI7P5akLiumADUZ15QegjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+Y5TRlQQs9xtBMnIubQ7U7LpJUXHqI6o42/eYDBIMg=;
 b=H8xk0vpw9Aqde9Q1973TYFsyVeZ2k99EcXRDeUy+aQJej/5S9TiymY7nFYjGGxexc2rVd2rWKxHanNH00ol7xp5STEbqc3MZqjwfLScWFpbiMHAr5ERQBUSandDAWE7Z4im7SK5j5ZRasV9Ot+06nc1+zf897opTL2+HoQffmBtgwYqh+aGrkVvnKZCqhzJN6odGYi4MkoKMNyDZ0k18zzKuAaJTOGnCYoxvmfoJbh6ZE3xIQOKtHW6lywq6M0d4R0SvrGST9Xmp6pRPpmDzlf7ptsF0p9S5iuvhk5l5/RvsatFd/8/12Z9ryMUSu0P9GJkI+1gGB+jfGeAUPeytuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 17:10:42 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 17:10:42 +0000
Message-ID: <52d20752-bb34-41eb-836b-9e8868b32c9e@intel.com>
Date: Wed, 17 Apr 2024 10:10:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/lnl: Apply GuC Wa_13011645652
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240417054802.1766359-1-vinay.belgaumkar@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240417054802.1766359-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::14) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH8PR11MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a4ac2c-2b68-4267-449b-08dc5f015027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lg4o/Y7/TiQrokGyL8pS3GdiULT1CNIjqAqSzJqpWNysLZXaG2hFo0PScNX7TAESp9QTRs9I3s8p/UdqhcTBA9B2nrnPx/Rmztqlxbsdx0tx14WZ/JP8vEyG/8i9cC25FqTfBK+6fz+gZJQU8Emgnbv6QJ88xjcaFaMFKUnRBJR8xDizMTVJTGHJAlOOeegGzAv/McSlnB0oeI2vHRFB2QJusYvfbHLhXNG3x2hXO1S4MFRmy9OqjtmrGigK/l/41B342m9Ar2dR5rYXrk47nPo0j2Y7G+3N20MNIvXn35xaOm3RR1+xuuWwmdHVL+HstTyZCmjN03YK1osnuhvQ+nq6cHyY6P5o537qZ8t1kg8a19C9L4KuoDaFIIN4b/CnEdlus1dMCj+IIJQ1ydXN+XGJV69Z9YpgBUUKJC/zodZDmcGcFQxXj0sHS3xR5G/fImgRXYVNVgN8k8rAXp93S69GbnyUsMz7Mv6omKdTq3q0R5FgISOWeq5gKPQISD6+OsbMNtiajYA3gOQ8m+qvlJ/qIIcQWU6NLXhE9Zzm1fJN4vkGofPaDvax9/U7fk6IAi4/C/GW12EI+SPwd/5Zx6MFdc6ezuLPa6XVCT8FvJsbw/uQUtt4xUJPgTEsPsrEhiRBCd2Ac1LonucPDfXldA4n8Ws8VGm5VRz2dD30jyQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VURlZnhsSXhSVXBPc212Nm0rcWE3QUFFYzc0dHdaM2o0WW9Gd0ppMWVsVnl3?=
 =?utf-8?B?UXI0eXBmeENJNnpTSWRnZVJqSjF4WDFYZExxcDVubXdRMy9UazkveW1xNEt4?=
 =?utf-8?B?Y0VRTXRnT3AvQTBzamVFOWFDVmdueTFYV3dMRHMzVEFqN2hxS0pDOXpRQXpn?=
 =?utf-8?B?QW5DVEYzaHQ2U0dVZmdFRUpmQWFpMHNtZjYrTkdYeUZiZlRDZFY5eU5BUkhs?=
 =?utf-8?B?bm5sTDAzTXNvbTgvVjMzRzhFUW1TQ0tZaXZiUkY5MTNVWU5aWmkwdnRGazJj?=
 =?utf-8?B?UzZvazN5WmtnQmhGOXBKYTl6UGc4aUl3aW5rN2VBZGR3cW1vMlpyZWtsOFh0?=
 =?utf-8?B?MnF1dmlidzhWVEZkdE0zSk5HYjJ2cURvVWJ6RkpWNXpjNEdGQ05oT0YvakVZ?=
 =?utf-8?B?dDMvSFRFVWQ4N3FNbElBdCtobHVld1Y3UmpkTTZJa0JoMEpzY2JSREJ2YmhH?=
 =?utf-8?B?bm1wMGdkRzRrNEVtV0VFWHEzaUppUEMvaVJNemlrUVVocnpFOEsyamY1aklW?=
 =?utf-8?B?TjJMVFpPa0o0ekFTUkFvOVdpb2Nvb2hqK2tVSWk1amtzSnBkOFEremF0SWVm?=
 =?utf-8?B?ZGlUcitjSktNaXRKMDlPeWNsck5mMEVicGYyWk05SHZnUW9jUEhRSGRkc1Yr?=
 =?utf-8?B?a2hJQnZobUNBbzR3QmNDSUlNbW5FMFduRXl0dnBYNXo4enR6bjgzRU5JcW8y?=
 =?utf-8?B?UG96bU05aHlyeWtVOW5BK0Y5THlQdFVuVWZHUDRlNkhFTW5teHJOWm1sNDZM?=
 =?utf-8?B?S2VDdnRDZ25FQ255cGRqTGhkeGdhamF6NlV4cGlKaEpHV1VlUnRmNUFuWXYz?=
 =?utf-8?B?U0YyNU11VERGZ0xib3BmblllYXFZaWo0K1BWQ2trdlVZL2hMaUE1SGs1SkxH?=
 =?utf-8?B?T1ZMR3ljT1Q3cFgxSFdObjFlSTl4bm1SdnV4UmtpU05tdE5MYkZWN3VXNHo0?=
 =?utf-8?B?MEZOTTRiL3BCVHFvU2VEMnlocWNGckNQc05WRzNncllpREpnSU4xT3N3bHN1?=
 =?utf-8?B?em5jT014QU5zUllNbFJrS2NIZSs0SDZuSHR4T2pNalZaWEl2dkI4NEZkUVFp?=
 =?utf-8?B?dWUwTElkb3RScmwzbWJMTFExK3pvNTZTNGloTEtvRUhOeURNR1pQbW1RaWs0?=
 =?utf-8?B?N0tjRWh4aWJ4YmVMaFFHRGxGaFAzak80ekphY2V0UjV6cjBCeHM4N01Fb1Zz?=
 =?utf-8?B?NTdKTGRFdlVaejBzU2VUZjAwditMNy9oNzhaazl4ZERTT1VMMnYrRlBPWWIx?=
 =?utf-8?B?NGhiRVppRW1VWkdDUnpXUSs5d0NnbmJuM0FJeGNwRkRoREExQTFsL3FQZWMx?=
 =?utf-8?B?dzRBVHdMWEYzRVZjRG4wQU9IME0xNjRnaVpja2tEZXBQbVVZQU5HdHV6QU4r?=
 =?utf-8?B?bGxmYjNFeXFWR21YaWs5QmxRTzl2dC9uUHY2UnNHN3NzREdsUndya29DT3E4?=
 =?utf-8?B?MVBQamRwWmwzS1FnRFZ3WHZmVGcyTGhBZU5hTEs2NlpQeXdDSERxM2dCZUZP?=
 =?utf-8?B?bUlsZ2VzbVlmTW8yUW1BUFdCcmE0cWZNdWlqMm9SMlNvLzFxeDAreW1rakU0?=
 =?utf-8?B?VVhWVlBncGtIYnY3MXVRa2U5dGJhTFJEOUdkcTNyYTVvU240NHVrMEtHQVNi?=
 =?utf-8?B?N2s2VGNHSCtTRitVdEg0aVJWNW00TjkrUGY5WE0xejRMRXVWemg3ZmtuV1FS?=
 =?utf-8?B?MUhUMzF3VHlPUlVFSk82dU40N1orZEtaUTNaWmdweTRwWWFuSWI2QlVpQ0Iv?=
 =?utf-8?B?d083WFhBay9Sb1RaeFVxbExRL1VpUlZsemU3azZiejN6eGs2a203cDhYeUVX?=
 =?utf-8?B?RzUvbnk1SGJROTdrU25QSUNVYUwwQmJXRUNicCtJYWZKenYzTUhNS1prb2d1?=
 =?utf-8?B?OXlabHdDdnVtSWxFYXhXbkNDcFpXNFIxaDBzU1d2VXJKTVNxMXliTXM1WVR1?=
 =?utf-8?B?OW0vdTcrWEhORGQrMndJTGptZVdqcDZEWXVCNUM2MXhvRERSUlZ3RDl3RkJw?=
 =?utf-8?B?TG9HMUNMOUlMZ1VZTW84dW1mMllKNkxpYzZzdG5IRkt3RUhmRGR2TjFrZ29a?=
 =?utf-8?B?VkN5TmFCcDF6OVZOd1Yyek9jdTZvWjA4Uk9RcVZISEZTOG14VVdkbUdEdGlz?=
 =?utf-8?B?dHdiVHBEMDhmd2ZBdTZVbUp1b2pnVENYbWU5Z2RaWGVZb0Fsdm9OclF5eGdR?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a4ac2c-2b68-4267-449b-08dc5f015027
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 17:10:42.5265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1/+KUQj1DsyW8U78Nl2Y+5vbFp1WeD/IORnKhl9J3Ht7bDcgQiT8ZjFsCswyFmzCieeB6EdJkBrFFumBDFXCDl2OFha5TSq1KK5cnJk55A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
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

On 4/16/2024 22:48, Vinay Belgaumkar wrote:
> Enable WA for a bug that could cause the C6 state machine to hang
> during RC6 exit.
>
> v2: Add comment clarifying the WA (John H)
> v3: Add more details to the comment (John H)
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 38 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>   3 files changed, 40 insertions(+)
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
> index 678ece366056..1aafa486edec 100644
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
> @@ -327,6 +354,17 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
>   					&offset, &remain);
>   
> +	/*
> +	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
> +	 * the default value for this register is determined to be 0xC40. This could change in the
> +	 * future, so GuC depends on KMD to send it the correct value.
> +	 */
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

