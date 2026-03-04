Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E71EDEBF7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 00:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFD710E901;
	Wed,  4 Mar 2026 00:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpwlsMR6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B1E10E901
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 00:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772584842; x=1804120842;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IqKFCNXnbGMpbOR+NUU1ZZMOlm/nJW/64c0BztdzOf4=;
 b=hpwlsMR69RWOdsPhTSp3WTeqgrDXp3aix6cR11r+M2hqokFE6gvRwIay
 Z1ETugpCU+ipzc7S0jH2e0ovL5xXLvNqemxKHj0V4ImbFR5i1jnPxBSKm
 KK3WWZoLDToBxgI/hwopi6ouOIDmhKqDqvbdePWIiXsvJzvmNrXtnoAjF
 UDPVoVDQPYZUpolETGDNznT4wf5lMv5bx7UEUGWWWRAIKvZQIi1jM3OUE
 GbwTuw3f6iEbQX6XpFMfdYkokxZ+MOU4pJm/FFmb5o/EPe+1bxnHKFiY7
 +10Kk1rJ6iQn5sfLEbjQWuUyxI0B6q4SLpmU0T8KfOVcWtiNX1eu75Mx/ g==;
X-CSE-ConnectionGUID: VxNP6p8XRomgi1UQ/FGoMw==
X-CSE-MsgGUID: yTdgdHLqS2Slb+O9LXrVnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84346734"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="84346734"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 16:40:42 -0800
X-CSE-ConnectionGUID: PtDJ4JRxSu+UBcy0zBhmPQ==
X-CSE-MsgGUID: 4pzkDVG1TwmXTJaY9I3MBg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 16:40:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 16:40:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 16:40:40 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 16:40:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sjc9F+RTjwBgiyLdWc3br3Kh159AqdRemw70uEcvQ1/ggAeF+BZxztyLuJVxrYRlfebgPJ3+MSwpnvH7vtzG75IxT8T60MrCjfbSYmiIAor7S3YNqKgrIdGW3HNeynPeOGAA48R/vn7xUy4fIIf2viLC3JgepnUDshzl4JbT+oBYQTMmcyNnRD+R3GtoE8XrAuHxwVpt4z0UYBjGNd3/MmExxBDsmzdqo0wAaBlIX4eTMqBwEj70z0aPkAwpToHNaM8q6L3WcmDXahu4yL1pdYCpQvwlboFcs/eOC6AKU5CkhLOdAuwlmMS4CjT/TLIO6vqjAushmQ2ubOsnKjWJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z47dALViFexfm9cTE/t6ljc8l2oWiwxo2j2RrNQJLlQ=;
 b=mXXUX6aC9Cax/fGnhubP34kyAkjvU0JvEMX0+vU35jA1slpHY5sqO7TVWbfKaGzR6yqPaOh/UaJIKDz8pGwLuiVniAXenOMS3YyXOJxAXA2jtsdafXBJM2+BoJRLZrl0Jyjq15d28Ghxm5HcxmPYCIOZbgPBvDQIkQzKdb/q3/ggyyPkzAD7dIR0EJdF+75QCSZpm/exfSho7lOKaOwAmXeZW/P3ZgsTthkK4tr31FctKgJh/xfEjRNWnouNyU1bad1QuNJv7dxQCdAGglvWyzwGidRO2i8HAVmixG8J0f2oX+OXl2Dbgr6mdSfiOKbnxj6MzPMgOfIgKudxsz98CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by CH3PR11MB8547.namprd11.prod.outlook.com (2603:10b6:610:1bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 00:40:38 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 00:40:38 +0000
Message-ID: <8ee6b7eb-4183-46c9-a4f4-7fbad37e9d2b@intel.com>
Date: Tue, 3 Mar 2026 16:40:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/1] drm/xe: Enable Wa_14025515070
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260224174918.616779-3-julia.filipchuk@intel.com>
 <20260224174918.616779-4-julia.filipchuk@intel.com>
 <07735a9f-cfbd-4aa0-bafb-b57cd126782d@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <07735a9f-cfbd-4aa0-bafb-b57cd126782d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0157.namprd04.prod.outlook.com
 (2603:10b6:303:85::12) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|CH3PR11MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a63d9ee-7f56-45ce-4ed5-08de7986a790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: u4j6RGCUMZY8jdssv0R2dDmipR2jCHHJWIPpXuZeOJstgbv0/Mj8Vl158KsAGV9YreQcl/WjbpEzus6q0dOTmqc9K38/h4FsAbiClUjf0h/9Q7FxbD7KxAeGMhxSmVC2CMyg9yn0OoX9KqQQZGVDVEtlSld3/QZb2c00HgTAuTKyUiD3JO2gpfs7jiUxfxKs4Ja6c+wfYFjwFJqxzPgUkPJZsLI1MjcJBIntSBdh+AUk4VKk0pUOCByN/pwjLOpvpNrTkA+XMEftJoPwf4BzoRT947BOmpc1dWkh97JJDsrrcASgGjaokcmkm+peu0LLbux1AN6/CYuX5U7EwZA8DMBZNQOldV/ThP0xwhcuvnqosrqR5RCXwyTrLQHYjpNsc4PACmnL1cN0VKIdbMMqqIWMZ0NlULrFEfqhShcj8kWD9i53roZwykOynAclMjP+yRMgORDk4XOSBTqCEi4LQqZFRXdnj7++b0kkHls+fxHS9UMh8kvbSAw6dSkCXUzIphL+qQrfNyou1UbrAUqktYvHWC3bRKFHzJcMwQbWKHgb6nKUTvIwYjHV6BJ/Hm69PJ6oTjNY9vKlp2Sa/AclyyZUQh+HrL0emC5rjp+ctNE07TGlvFiIv3zJ8MjOcal+QaP00ZIW7MFeLti751+Xn52FhbwQikYqyJhzaPkRJI5fYXH5ylS1u8gsiDOM2BUOE5PpMKRSDNeO4aKv/L51+7rbjpPF2wfIuKqDnFqCMU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGpBYjRIMW1lR3ViSmRySFE3cHE3Zm9BLzZyY29ZcXJvOEtLUDV6cmc2bjRh?=
 =?utf-8?B?d0VDR2VBcklJTmFYTTQrZS9qbTFZYkVsY1lJN2lQcThxSHJKcHBVQ2REWEFI?=
 =?utf-8?B?eUhMTXFGQU9xTjA0WGVMRjdwUEYybGNNbno4K1RxWnhjdDZkd3V5VTYxcHBa?=
 =?utf-8?B?aExIOXRiUE1jM0lGNnZFTlVyZXk4U0Z0c1AzVnVwTzNMV1IraEVpTlF5Ymg4?=
 =?utf-8?B?L0xFNU92STl4MW1DbUV3cDc3Nlk1TGxvUUEzNEo4djk0RjF2U2FJQTZFWU92?=
 =?utf-8?B?RWE1UmlNbUtBd0pGV3BLZ05hWW56QVRWazRqcjJDb1lDazBsOUdjRW5HbFBH?=
 =?utf-8?B?NTZqYmRsb3BPVzBYQWpweWJZZEtWTGVwN0ZZeE11SXcwNU1xSEJ6ZDFBcXNy?=
 =?utf-8?B?QkN6SU03eG92aHhsYmF1d2pBdUlFa0lpSGg5cUtqbVI5ZENGUjgxaVZjTG9L?=
 =?utf-8?B?K3lwU0ZNRnozU2pZT1ZTMW5xcUM3cmFUR21VdFRyeDN6QlN3Rjc0M1FBZWND?=
 =?utf-8?B?UVdsWjNEQXVXc2hybWhoNzBQaUJJUnhKc1VoeDNRWlNBcnlsbzZSQUV0cXZl?=
 =?utf-8?B?YTJ6eTVramtOalFBdVFtWDBmOTRvRnZKSVVmUTBuaGJFZXlvckdBVGhGMk0v?=
 =?utf-8?B?a2tDcWpMMHJqdVpFcDY3QS8yeWVRc05ldENZcy9CbUNFN1V4MCs0OUduMlZZ?=
 =?utf-8?B?ZldUN3lvM0R3MSt5UXBaS0RjbUtjcmFoQ2I4Rk9QWVpsNzRaUUhpTnVKRHIr?=
 =?utf-8?B?dWxtYTBKT1g0cTg0NEJZa1BTc0dSM0p0Q1prY0hVMDA2VGhubU9RUCtUaC93?=
 =?utf-8?B?RlpTNXJXZjBpVWV5b1h4ejJEajVkd3hyN2pYNGJOZVdiWnFtUWY1NDBHM3VO?=
 =?utf-8?B?cmdDREtja2tmREQyOTBZbk9rZVIvM1BYM1EwM0J3b3IwSlJycW1XN2FnenZ0?=
 =?utf-8?B?d3FRc3JzaTFkMHlFVFlxQ3RWR3RnTW5JR2dZT21pcW96b0NUSmo5bnUySUFu?=
 =?utf-8?B?RXR6UGpGbkgzbE4zODlYVkRLUUI2TXlvQW5Md2lPandCSkFOTXFNMGc5bmlC?=
 =?utf-8?B?ZHFXZ0ZLcVdpUzM3L2E0UDlUd0h0RndxZGdHTmV4dHVMQnRYeVVUSFBDcUtp?=
 =?utf-8?B?VVoyMXpBZkNXVW1GSU50d3VwdGJ5QmNPZTFHV2QwWDlDbmp2ZC80b3g3T2pz?=
 =?utf-8?B?d1VSY0hBVkI4RzArRjY1MENrM3UzZm5iTXcxQm92L3VRTVhocjBMaDFKaENo?=
 =?utf-8?B?eE1vemZlQVV2LzFCUlFTaDNTbUtaMEFTSDZLcEk1VTk4NEV0MytlTHgxdnZI?=
 =?utf-8?B?UUN5ZTB4MW5IT1lNcVV2QTkrSDV6eWF0NlJDUlI0cVdUcVpmRGFPdm96c3N4?=
 =?utf-8?B?dmd1S2dnWUxMRnViSktKQUx1ZGNsMHpyai9nMzJZMFpubU1FaW5PbXowSnRY?=
 =?utf-8?B?ZXMwVk40T2JwREwwTVZiSk85dUFRTnBlU0dFbFVwZERJVVpaV3U0b0RUZS9x?=
 =?utf-8?B?NnZkaEFNRXlTUUdLcXdIN3VKRHlpYjRic25JU0pJWEhUam9EZ0lLcUtpbVpx?=
 =?utf-8?B?ZHJvVDJQRVZubXZ5WU5QSXVRc1FYbXhpUDNRaGZ3eXhObTVNQ2o5Rys2MVUv?=
 =?utf-8?B?WEphY2U4YklOaWIrdm5NWG16ZUVyTWpkQk5uTld6VUc0RHFqWTZBTldNZDFa?=
 =?utf-8?B?Z0FkSEFUdUU5YmN6UEtiMzV5bXNUUTk2NUt2dnZWczl4d1V2N3hTNDZNOEo0?=
 =?utf-8?B?VmZBTUYxZkRSZElkemhkdExBUlNTSTlEK2JaZFFnU2RrQ0JZK1czSjEwMjZF?=
 =?utf-8?B?NlB4REgyOC9CRkxDRXE3VVkvVVhldG5wMGN0dEwwNytSQzh2dlVtbDdaOGEv?=
 =?utf-8?B?VjJYZXo2d2hXdmk5cWlUekMrcTFaYkhNcW9SOTVLbU1MdmtTRzU0eFpuVnJF?=
 =?utf-8?B?aEFXdElJYU5vczBmZzhaVzZKSWZOK0hZUmRuZEJERktkUDJJbkJXTmdIN3BW?=
 =?utf-8?B?THhjWDI5S3RqTjhNSXYvaDkyUlBtRHdVcWJ5TytaRjhEUko2SlNZUHl5bk1y?=
 =?utf-8?B?Y1cxaDZIYnBWWmwzTDlleE95N2tiVFMwbUxHamQ2UzJQcWZPbmQxQ0FGclJk?=
 =?utf-8?B?T2F3T1ZSMnJSOG9GZnA5d3czdFlBRU9KS2l5allHeitJR3U0dENOdWUwdlBh?=
 =?utf-8?B?LzV3a3czemo4U1Fhc2VOWnlOMEM1akoveDY0bEJNQ01MMVl2MW9hcEE4eDc3?=
 =?utf-8?B?Qk55L1k2cWlQajMwR1dyU1U0Nm4xd29oMXptYW15QXlEZy9LSzduaXFPOUhX?=
 =?utf-8?B?dUI4cjFzaS9PNVJOblhQTDdTNFlhUmpDK3JrYTQraHkyYnNQZGU1VGZsRUsy?=
 =?utf-8?Q?eFdbWbrXPLGZCEwU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a63d9ee-7f56-45ce-4ed5-08de7986a790
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 00:40:37.9294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYxZXGjwSGRNWS8buneJcROm/8AnFjJinsaPPq/EuKQ93IIS+u9qmij5oPKFcl7kC3kuNus/6kdw3WqN/OY72I/x/KrPVieRRuvsk2plbZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8547
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

On 3/3/2026 2:58 PM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 2/24/2026 9:47 AM, Julia Filipchuk wrote:
>> Corrects a failure on context switch. On registration of context with
>> indirect ring state will correct state of targeted and idle command
>> streamers.
>>
>> This Wa requires GuC 70.53+ (uapi 1.26+).  If indirect_ring_state is
>> enabled and Wa is unavailable, notify and disable indirect_ring_state.
>>
>> Added additional XE_RTP_PASTE macros for expansion of longer rules.
>>
>> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>>   drivers/gpu/drm/xe/xe_guc.c           | 8 ++++++++
>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 3 +++
>>   drivers/gpu/drm/xe/xe_rtp_helpers.h   | 2 ++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules    | 7 +++++++
>>   5 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/
>> guc_klvs_abi.h
>> index e33bd622ab44..f0815500177b 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -496,6 +496,7 @@ enum xe_guc_klv_ids {
>>       GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO                    =
>> 0x900a,
>>       GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH                    = 0x900b,
>>       GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG                    = 0x900c,
>> +    GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG            =
>> 0x900e,
>>   };
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 54d2fc780127..0c14e321bd67 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -777,6 +777,14 @@ int xe_guc_init(struct xe_guc *guc)
>>       if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 14, 0))
>>           xe->info.has_page_reclaim_hw_assist = false;
>>   +    /* Disable indirect_ring_state if missing GuC 70.53+ WA 14025515070. */
>> +    if (gt->info.has_indirect_ring_state
>> +        && XE_GT_WA(gt, 14025515070)
>> +        && GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 26, 0)) {
> 
> Nit for style: we usually break the lines after the && (checkpatch is also
> flagging this).
> with that fixed:
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Daniele
Adjusted in v8. Thanks for the comment. Turns out I was not providing enough
arguments to checkpatch.pl for the correct results.
