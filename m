Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E92DC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 20:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C3F10F847;
	Fri, 12 Apr 2024 20:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPbbDRB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C42310F847
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 20:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712952736; x=1744488736;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/zi1Q0mSHrWKpaprrSQUmxVJYc9QwUaDIb8YN9icR8s=;
 b=gPbbDRB5DmbR8yuMAGzF7W7pfYSKnpBG2A4B3q4fmsGxjpUzdwquDOQS
 zxAmY/7eQoZNq8zQrUmydEgpjKIk2drORzZwwkUeHGv3ko5CCRxP7Em9k
 IxRj3wfHZcLS9FwtUvZLeSqarAxABKr7Jm8ECJ2dKpFACZ/9rEB/8ykJB
 PKgn1+8mnkOs7lKnCMigqjwMwBTNeFc6NNTiYs3XuXZblOQPZbcBrwtLc
 NU13rcVO3m5hatkvbF16TFe9tZxWgDOqXnL8YoEptyRA4RW/MhDNlt99p
 2J2p6odxFucD52AX9z9eYDPgjx4MBwvBBS697Pa86Q9WatViD3zhGCD7H Q==;
X-CSE-ConnectionGUID: mz5NtHmlSoqQri1r9MSZiA==
X-CSE-MsgGUID: BQlTlmdATt6KIwhHJL7Qtw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8267886"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="8267886"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 13:12:15 -0700
X-CSE-ConnectionGUID: LUJk8M8wQhmX+Xc1s5NSQQ==
X-CSE-MsgGUID: m7rYTIKWRAaTUFtR78onDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="21899406"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 13:12:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 13:12:11 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 13:12:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 13:12:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 13:12:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3ld23OH7bIUs7zIHcZOs7I9MNqbna5RwkNIcvlPSm9BonP+9soW++Gns1R5mzCr5zL0U4zLvsMVtSPNBn5fFW6jqLOtAuHbdYJNbFoozvFJXCol2/pl2HN3S+tcNWxmKyQic5qBIN3qPkWj5tdwOzIUw9Q51yX+y3c2TaAFuEV8z5vYbjNeHXEoEqbtXYgUahF/B1rgHceRSIoIlm/jroA1lE7geRn1hydleRP3+3+Fi5Q86VtfFHYeXO1gWNaxZRWZmMBbWWWkWB+P7mcov5/KOw0paT+CsMsGf36xTLQc14+evyQLKC5lUgD0MIGTMkVPxOU8t1k0q7FwBAoV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqcrzMnicZu2PQdV8sfhbQ0NLG4/6EOxdE8qdRv6qUc=;
 b=nFzzcdQbGu2PKcKYPd0lPejClpw5h0ndN921DmgASsbwdD9nAfn4VagJvwLSMsoZeCxgwnswYyRlYt4dPgvqUZZ+YGi0YDlFU7VDfTorLvq3MOKicMb6Q4SGFZRcmViF1iyUAg9WUfwepwacL0i3xs9/y2qgeSSXaQ9MgaP3vwueaH9oovvq7lgJqLcI+iBAb5/weE/+ynpUN5TH6noeqZ63olWNwotnSmJfodQN7/0ozsYA+VOpQZtPNGn/YgCA2rNW+DQLHbvPE8T/Cx2iQKAUBpUu2rdsBEDvp9oLEE7BKNnYBuUnMZ/8retShU4kvLvW1AJ0bd61myqi75gCDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MN0PR11MB6012.namprd11.prod.outlook.com (2603:10b6:208:373::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 12 Apr
 2024 20:12:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7472.025; Fri, 12 Apr 2024
 20:12:09 +0000
Message-ID: <909a1599-a028-4b46-ade0-662a5557039d@intel.com>
Date: Fri, 12 Apr 2024 13:12:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/lnl: Apply GuC Wa_13011645652
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240411233207.394688-1-vinay.belgaumkar@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240411233207.394688-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MN0PR11MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de3ad7f-c31e-41b5-3005-08dc5b2cd541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4okQ6c0aWwq+GnaKWJcvNt3qF4ZS1rvDTH/M5mCUQd6HQRDMsmPFmEA86KsXg/1ArtDptX6hfAzdUdUryKxIcyrV7v36Cg7JNeY1LS9cXXOBocWe6ahsh2tOqbk5k/WTtWt2bzeqVB+XK7hNAi281ZwcL//TyrlIJTv1nWr53seeQnfE+Ei9EVJV8LKbUSenjEw6sRPcAtaH2COU1QNJmOz/RkmNFDcC6esMRJtwtWjlKrK4vMvmMxDC5ztQLPvNlYvRIWEeF9sdHOLG4UMno9M4oVklk/nwTvyiGzsUu6l0zNlaHHNS3Zwvmc9xQLGFoMMPAF9rcPyX+Gka1Ge8IWlMpRdA4J/BfmL7C1UI7YX/gUO2EYcKPzzIOGFnOE5EWM+nz63ch7YQ10wAgmQdzbBhuYk+gUAydWuMQ+lnhPnRffIpCt0cHJEaE9W18epN/A9fSczE7VglfJrjexRp1DgbjRjiDtXPwZdoomn0e61tDZFU3RNwBOtZD60KPpJ0KdTZfG7N/POFwOdnlwOdvWW+Y+RT/qlrfG9iaQLbdRaDdI2kLXNGp5IVjm+jw7tFJxPd3g1WGbkcMeMFuyDatjW9ukULLN2+f7VIPPl4kHp05Q0CWPt45ikxrjicr0Ca7N9n6G8Uedpi2gkY6gYWhWQeb3P0vhGFoj3eHRnaQ48=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHpGMVNSWTVYQXB2U3crNWVkRm4vRksxUzgzNDB1RDdPZEwvZGRURU9jLzdL?=
 =?utf-8?B?clVmTzNpckRQTXdWanBJeWVOT0M1d2VEWXozY2ZJTmlOUys5WUFCMU5LUmZy?=
 =?utf-8?B?dnpxSWc3SDUxM2lqRmFyMEZmV1Fka2NNSVpyNTVqYWVwSUpKM3ppbldTaThG?=
 =?utf-8?B?RXBxT0FiNSthYURHcmlmRGhkTXk5bGVEY2U5azlTbEJlV3JFdXZiZkNuUVg0?=
 =?utf-8?B?cTBCSkFvMmRiSUNSdVNxT0xLM1M2cmNUQ0p2ajlaTXo0UThEekV5Nmd2QUw5?=
 =?utf-8?B?RzlDQUlxWmZ3K1BXd2VVejJpd3c5T1ExeE9tSHE5MHl0QUJCaXJwbkFJSmI5?=
 =?utf-8?B?Y3IwSWxlbkYrWkFCUlBtU1RSeFNraVV2TFFlb01zN3FCamx3UU5WdFlvRUU2?=
 =?utf-8?B?bDRkd2U5bE01YUdzUTZRaWRLQkl1eElhZUdIZXpXUXU4a3JCL0NvOVNXdE9X?=
 =?utf-8?B?STRyaUZ6ei9DYitXZDRUbml5TjQyOCswT3VWL3B2QVhKc0tsbXlsK3I4ZzZN?=
 =?utf-8?B?eVJwbDVaUDk3YWw4b0laZnZNYXBQQU5RZ3Fsa3FrMG15QmR3MUc0UkJ1WHBT?=
 =?utf-8?B?SCtWcnNNVEhnVzNnazV5bXp5TmI2RGJNVFdZQzVmdW5BaklFb0hOMWNjK2xo?=
 =?utf-8?B?cSsvQXhBdCtOcTBZaW1ZUmdJK0toYjAvTEFMV3lBYUMwU3FYUCtPS0pBMXVM?=
 =?utf-8?B?TGxlVUdKVGsvcDdtZGVKZklyWkhrQXZaWjhNc2VFNEhPWTRYYUZnK01DOTI5?=
 =?utf-8?B?MHZ3U1ZhbkNidmNtTU5HcTd6NzZYQytMR25wbDQzOUpNc0tzdHA3dnFOSm9Q?=
 =?utf-8?B?WTRMNEVEQVVnd05NbEpFWHZHbVRJYW9HUXI1QXBOczdYUTZ4OStBM0Z3MnpG?=
 =?utf-8?B?N21FQTlrRENCa0tzUHIwMTlsZ2xSV3I2UWtkUFZxWG9xeHZIdVJjUXJjSXY5?=
 =?utf-8?B?dlVMMkN4U1liZk02VHJ0QmQ0QU43bDh3SXpQU09wL3FoNlNEUFdnNit2YXNC?=
 =?utf-8?B?d3NkNkIzTWZCeHdxT29VV2NCRnp3dU5GWHAvMldUb3J5UjhPR0txM1gxQ09W?=
 =?utf-8?B?OTI4eHVwVUc3cW1vMy9IRjNMdW1SQ1FXcnloNjk0V1BHclNjQ2ZRZGV1cUZr?=
 =?utf-8?B?MnNHbkpXOTdrOTR3UnRDdHNlT0x5WWJHbWFEbzQrZzlxYUxZZWd5c0luYnN5?=
 =?utf-8?B?NWNlaFowQjdId1FkVExEaEsyNStGMm14Szhxc2xDQ00rN1RsL0FBamRiaEtn?=
 =?utf-8?B?MUV6SXd0Rk9pbityMmNTUVVuV3pYcGFkc2cvRGc5bmtBcThWQ0ltZ3RDWXZn?=
 =?utf-8?B?ckxDMlI4REVvb0xkQS9uSjdwNERwYTRDc1JPUS9KeHBHWHFQL3JMUndHRGlB?=
 =?utf-8?B?L0g3dUVKZkM0a3JkT2NLakV2NXV3eXFOUW0rZHVkcDMrbkFPSE5rSXFNTVll?=
 =?utf-8?B?OHhPVHVQU2VsYkhtSFBYeG1rdEhVNm8rZFk3eFFlMnUzTG05SnJCYm9xWEtT?=
 =?utf-8?B?T21DUDM3MWU2KzhxVXkzMXRHSjVvU2NkZGVVNURta1NFRGRpdFNzMm5KbDNL?=
 =?utf-8?B?RjBBYzd4MWdNdXRqbm93ZzJIbkF4czErVHRFbUV5VmJ3VW92MHZRZFVmZyt3?=
 =?utf-8?B?WmFua096SXdTR2FSL3JmbFNRN25WaFkxWTFQbXZBSWxDQnQ5dTdzZlpTZFhr?=
 =?utf-8?B?QmRaZU9oZzVtVjZGNm5sQVNxM29aVU5mb0hIN1RlWTM1RTNITjJOcnBPcEpz?=
 =?utf-8?B?OWgrWnNpcmRHOHhBTDN6Z1NEcExCMnZTQ3lFNHlPRHRzV0Z6ZmJzc3RrZGFW?=
 =?utf-8?B?Uy9FWlFGOUxLanlTMTBiMWp4Tm1BWW1sTFhsRjdEZ0thM0lZL0VpdnpTQ2hE?=
 =?utf-8?B?Z2paVmRxR2JXaTZEa2RUNjlaaXVaSGVOQWRBQ2VwazJ1bGJYeTZmWE40TE51?=
 =?utf-8?B?TWNpKzY3TVdUQjY3MmdlSGk4ejV0eU9aQjROajJmQlpDQTZQQ3F6WFQxNDA5?=
 =?utf-8?B?YS9wNTdLRjlBeHF2blV5dUxGdUVKRzFCRnpGaHRrY2huZGc5bUFkZ3FuY2ZK?=
 =?utf-8?B?WllRTm9pZnFzNmZFYmpLMGcySkU3M3VQVmR2MVVCWWlqa0RYcmJZQ2FkbFQ4?=
 =?utf-8?B?d3d2VjRpeGJ5aXZkVHNycU5PWit6U1Zmczkvd3l5SDlaZmpsSXBjQWVQck5j?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de3ad7f-c31e-41b5-3005-08dc5b2cd541
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 20:12:09.5869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tpr6s3Iwp8abOs0mEw2Oy6mrvFknk1+0f04RMHbChA31ik3NAGGqbaTLCzgwPFeB46LXyTdmxdd3FpS5CE4UlXA/SsGTFfUDNEstxvif2BQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
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

On 4/11/2024 16:32, Vinay Belgaumkar wrote:
> Enable WA for a bug that could cause the C6 state machine to hang
> during RC6 exit.
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 33 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>   3 files changed, 35 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 5dd45e06f0b6..3158fddb2f27 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -324,6 +324,7 @@ enum  {
>    */
>   enum xe_guc_klv_ids {
>   	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
> +	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 757cbbb87869..05b6e7fa7fc2 100644
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
> @@ -319,6 +346,12 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>   					&offset, &remain);
>   
> +	if (XE_WA(gt, 13011645652))
> +		guc_waklv_enable_one_word(ads,
> +					  GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
> +					  0xC40,
It is probably worth explaining where this value comes from. Something like:
     The workaround involves re-writing the value of register XXXX to a 
known correct value. Currently this is just the power on default of 0xC40.

John.

> +					  &offset, &remain);
> +
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 98a81468bc8e..f74af0d369dd 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -21,3 +21,4 @@
>   		PLATFORM(DG2)
>   14018094691	GRAPHICS_VERSION(2004)
>   14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> +13011645652	GRAPHICS_VERSION(2004)

