Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC669C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 18:09:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8AC10EA5C;
	Mon, 25 Mar 2024 18:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfPPElsn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012FD10EA5C
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 18:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711390173; x=1742926173;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8UTVD+lbgaPWqCYD+GE0F6XdRmsyb2knRb4rIX3DYp8=;
 b=DfPPElsn2r7xhE0CHAOQVNHYCkcpB/dFOPyZZ6WF6iR97xBzNGaq0v3c
 vxiRZDSFGuZcYKXTp1fsbm6bFZ3rd/zSbXCKtMKnxesZSkPoGcaZzN2d3
 +oVmc/a209SQu+c7p0RrDB2Myf9J0gGt0WaDDLpPE61uhujfnF0XbDgcx
 6zo75ScHiuqMa1oSRlyTr5ht1lzmS6M0ndU38pm1g/1Q2zWf91UtjzL9t
 1i4SfZzbtQhn/HgplmoJ5wrwOeyH5Zv2SoR4+w6i7pFrvvNPFuxpEtavV
 RE8zPE5Ezs6y1YI0rAA4JngJTlO4FhSEwvWLK0IFuenFww+COVHYuwO75 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="28890600"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="28890600"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 11:09:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16089654"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 11:09:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 11:09:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 11:09:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 11:09:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 11:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJpSPgH+ruVI6kETwpPrzhNe/hwXftq4sBt0Q/9ygKFHqpp3+Cwg26BHz0R99mPdcuUA5xB00m0Q4sOQ9jBkWtyuVwzihZXcsAhikpP6v5ZaQMWpXYHdMcpCMX8MHR9jEQSGlMK3uk1p/h8YrNsukrb0Vc+BZzcOrZB0X1dZjdRkn+1GEYj+dUoRm4SrJw5f5CPQFy83N4Q7P01YHTVBVKE9Fsno4UjyBQa9WwV4ebQe0LWjhBRC8qngaKhp21xaJlZh/xrN4ihXSX4VsV3hs96UOuRjFP8gchbTYEqj7cIGZi7xmYGfvbeecW0stN9yifhuEuqrOnBT3M5Om/R/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmKN/UgwFO1rcdLiXVwMGPxjdt57L/Kqhew0+MhNpKE=;
 b=D0yjggnVY9DP/A6bvxVpgByhpgJnZk19egmcpViwbs8SjnxyW03RQoiJVl2nnH7BPWGnbF1J5nItR3ueAJ12Nfo08fD4YHMxapIK8gsYYuxW71E/cYxuxDvH+y/SOyPYoytT6ES7Kk3DlF2nuVhgciXnb1YSKp32w6JCcQ1HB98JanEC9LsAZtzNgWiwj1XeiR+ubwlQPiTOS+rIqhxZM6PbT+VAfJ1EGz4FP1nA6Gqm5Z5MGe1UrJ4vWmjylAMOo0Rzl9aw5pHFky+BLWc88mTZaNjrRkT7TMAdRt+x3AgDHQ1OY+jsGyL26M5S/zk3+wA1GSSgC5JGR4jcNAC1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA2PR11MB5194.namprd11.prod.outlook.com (2603:10b6:806:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 18:09:25 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7409.031; Mon, 25 Mar 2024
 18:09:25 +0000
Message-ID: <e1b5afdb-0307-402c-a7fd-778131353a68@intel.com>
Date: Mon, 25 Mar 2024 23:39:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <john.c.harrison@intel.com>, <matthew.d.roper@intel.com>,
 <daniele.ceraolospurio@intel.com>
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
 <20240325150435.2967536-3-badal.nilawar@intel.com>
 <29f52749-032e-469e-9cae-cad1f01896fd@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <29f52749-032e-469e-9cae-cad1f01896fd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0240.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA2PR11MB5194:EE_
X-MS-Office365-Filtering-Correlation-Id: 694a9fed-270b-49f0-b9f1-08dc4cf6b456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: umJiBeVTdnMb5Jh2pXMD2ZpY/W/1b98hnBCUunPR0rnXZY2+DDfriy39UEiCFR8tvXCFPxIVOxt3tVmwuTD9ufIAlA0hx30UKVHMUZu+g3qfEQ7fa7kKLvXGvaPH89ov2ciAat1OA/efFj3pl4j5b6ypTH5NFotkWhTK3t7h8tEjs87/TxozJ8rirLtc9LbeMiKHHDBJCuKePoBAwwSPSDo5zh5FcgPZ8QC8B4OVft7vUB3NvZuTEAmXD4uvbnwLP0On7q4X7hdMpIByARZilaAakQNsWVZtFHlXdMEgjVkZxa/GYxAmXMSciHCTu/7zcuPShqxfoI9Z78mr5jxCtFk1EjhbztzzKOsNtl9UHVP1PW/n4Y+3ph0U9MFrtQ+Dvt53Umjp2JvK8KuZVETTf0xfQgDyY5LdQEvoJhgZifU0gA+WeLnr2STJrO8LnePCiQN7gCZ7Y0zoXolL3TUumbegwAXvyqPNR8m0ivoSPGelmT3XTQoaXREYLF+vLxLPn4JocPwFNvRVf3mg7zxedl6fvxU/s1vQ5SFr40SQ7D6BurbZatsHvnNtm1dNHKYYgAITbeGBhfrAlp8uEG7Myulo/fkxIxUPG9jFinCmLTDcP8HluTkkQ/jS7CjLf5RlAVsczQDrjNPCsqT9NnyEsB4+pND/LCWQt9OEhv9e7+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFRpcndFUGt5SmVNMlRKTW45RHhCdnNzeVAvTzdMQ0JwSG12eFR4ak5uNFZO?=
 =?utf-8?B?L3VlSExnYnNJamlhcTI5enAwYVFoOGJOaVEyRmFBQzFrT2pTWUFoeHoxV1FB?=
 =?utf-8?B?MU42dmdwQ0p6S3FHNjBXNktKbGg3YStOSmdSQ3pHalgyb01ySGltWDVMZUc3?=
 =?utf-8?B?SXBvSndFc2NBMlJYaVliQ1c5dW5jOTg4NWlDMk1PZUtSR0xqa1NpK0VpSnYx?=
 =?utf-8?B?eEJCU0FVdDU3Zk5rVW9sT25Qc2YvRHBqVFRQNVZ3aVEvOU1iSDlEcVE2VVNq?=
 =?utf-8?B?Y05ibFNJcWFHejFDZVVEVjAvWFRaWmsyK011cldFV0RZKzVwNW9WdTAwUEtO?=
 =?utf-8?B?RU5lRmFJUm0yQlV5M1hnVHBUMit2UFRJZlpqSEViQVBOemZmazFNdDR2N05J?=
 =?utf-8?B?YWdLUWNTd0MyR2JvNFJvZWdOc0Y3Y09wb0JNN0R3ckQ1V0J4M2xlWnZoQjRU?=
 =?utf-8?B?TFlWRXg2dmdmMDFRMVNjYVJLODhQUWJacVcwRTdRUlNZRnJuQXpaOGZqYU1l?=
 =?utf-8?B?RE1pT0d5S29VNlhaalVnKzQrb1RNcXI0bWpubHBLaEhvT3hHOXFqOTlrdDJq?=
 =?utf-8?B?dnFtQVNHM1V2N2RJcTZRNzlLQ251bnhFTUpoaGZZSE9QTHhzNkFVZUhPWk5Q?=
 =?utf-8?B?c1Fob2VGUjFZY1d6U2N6RkNaTjJtMVk1YVhkNFhPR3NiaGhEb3VJbXpPV0l3?=
 =?utf-8?B?YnNlMGowM0ZUK0d4RnhuZEtMYnprTTBRSjVodVpuTTl3c1QyOWZSL0JTTFR5?=
 =?utf-8?B?MEc3VmkxUTlCbTlwQ1pRZzIzYllXWnMvMEdOR3NFYllRbm81d1NiUXhQY1Z0?=
 =?utf-8?B?WGIwUEZSM25Gc3YwNVBYcVNLYm93WUpISVNZNzNwRzMyUlB3czE5NEVUUjVR?=
 =?utf-8?B?RzN1R1RnWitOOFQwUVZjUjY0YlBMTGpwTmtrSG1GSmVncWx6UmxWb2FmRUl3?=
 =?utf-8?B?UWh0UGkxSDdMc01NdGJ2OWF0UEtLOHNjOC9SSGpZcXBKU1pFVzR5ZUZTOEZ4?=
 =?utf-8?B?ajFCQVZZSDM2c0wrSFppZTBpb2pQdENXVCs1VlhjMTMrdXY3MEJaUXQzQ0Jk?=
 =?utf-8?B?cGI0M0JaSHNHQWhCQ0Zld3R6SkszV05PSktxbE9CMXl5czVFWWVQbGpmYUNV?=
 =?utf-8?B?emJ4NGpzUDRjNUZZMzFwaS81RDdDVUR2WEtGT3RkaHRjbzBCS3R1UXlRNWNP?=
 =?utf-8?B?N3FMbm5tWWZpWHYzcDYzbDl2ZmVGaHNibVRWMEdodU1VQ2gxUGVsdktLbHRk?=
 =?utf-8?B?K0hXUTBzaGlPU0FxOFM2NnBScWJpY2JsRkxDbEpkODZMY3BQd0kxWGFWSmE2?=
 =?utf-8?B?OFh2VUJiNUVQSk5wekw2K3ljNmtaMVVpL2RqNnYzY0NtZ1ZhUmthMjQxMnEy?=
 =?utf-8?B?cVB6S2dYZlZ3aEdId01wcHRpSkFvcHl0YldDM1hOc1pTK3hOcFpEWDU0S24x?=
 =?utf-8?B?TFg2emZKQU00UzlJeHNyZDhOblp3YThXRjQwTm9Eam5BZ0srdUFDSnZkSDR1?=
 =?utf-8?B?NHBOUmxyUFpLSzlIQndlMEx4djlpNjMwQ1QrZStMTm41N2xDc1Z2aWIvOW0w?=
 =?utf-8?B?UUErcGI5Vytvdld5bm9kdjFIbmRnY2xQRnFueEZmSUFHRlJqZ01wcGZnWWNw?=
 =?utf-8?B?MldJSjAyWVVhaHlXZFZIdEJFTk9uZDA2bHd5a2wycEdKa1pQaDJqbUZIc1FX?=
 =?utf-8?B?WDRZeWtSUWVYVTRNQ1pLVXdvQjViWGJRakxjeVJFRWh2eUx6VVlKOXErS05n?=
 =?utf-8?B?RXJCWlFaTXplSHFFUkU3M2RSUzJoR0N2SVNXU1FwempBSFVzSGxQeEhpY3h2?=
 =?utf-8?B?d0k5MU9NbEQzZURvOU9WeXcvTVpiaE9XN2FtS0JXenpaUmJ0UlFDaUJ4b0Zl?=
 =?utf-8?B?N0MwQnBpQ2lJV3hPT3NvNmt1cFAxdi9yc3N2Y2dUdjFPelYyWWlpQWNPdW9I?=
 =?utf-8?B?TVNiQ1RqeS9HcURaRUI2TTVscEJSLytaeFdLKyt1NGN5V3ZVK0lVd2dNbWdU?=
 =?utf-8?B?elM2YUIyQ3ZkbGJjS09GVlNPK1lPdU95QTBONzEwT25ObERFbVp3OHFDQ3U4?=
 =?utf-8?B?eVc2SHJNMHEvb3JjZ3ZIanlNS2lBY0hROTUwU1dyZXNlbEE2MjI0RXRBYmhr?=
 =?utf-8?B?YXdlZklITXZBNitXQ3F1dC9FUzFlbEpEQ2RKTTlIaS9YeENWVVpYdWFSbUZC?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 694a9fed-270b-49f0-b9f1-08dc4cf6b456
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 18:09:25.4203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOjVL052a+DMzvXdsJdIg8R8G9qwkPZ68OES4xlk3WRXwEorm4lK1nUh6qvVX0xPia2zGEgPPS49UArj24dVgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5194
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



On 25-03-2024 21:02, Michal Wajdeczko wrote:
> 
> 
> On 25.03.2024 16:04, Badal Nilawar wrote:
>> Enable GuC Wa_14019882105 to block interrupts during C6 flow
>> when the memory path has been blocked
>>
>> v2: Make helper function generic and name it as
>>      guc_waklv_enable_simple (John Harrison)
>> v3: Make warning descriptive (John Harrison)
>>
>> Cc: John Harrison <john.harrison@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 41 +++++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>>   3 files changed, 40 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 0400bc0fccdc..5dd45e06f0b6 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -319,4 +319,11 @@ enum  {
>>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY	0x8a0b
>>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN	1u
>>   
>> +/*
>> + * Workaround keys:
>> + */
>> +enum xe_guc_klv_ids {
>> +	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
> 
> how should we know the LEN of the particular W/A KLV ?
> as this is the ABI header, IMO we should define that here along the KEY
W/A KLV are alternative to flags to enable workaround. So length for W/A 
KLV will always be 0. Should I still add length? May be I can define 
#define GUC_WORKAROUND_KLV_LENGTH 0 which will be common for all W/A KLVs.
> 
>> +};
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index a98344a0ff4b..633e5fd9c738 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -7,6 +7,8 @@
>>   
>>   #include <drm/drm_managed.h>
>>   
>> +#include <generated/xe_wa_oob.h>
>> +
>>   #include "regs/xe_engine_regs.h"
>>   #include "regs/xe_gt_regs.h"
>>   #include "regs/xe_guc_regs.h"
>> @@ -19,6 +21,7 @@
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>>   #include "xe_platform_types.h"
>> +#include "xe_wa.h"
>>   
>>   /* Slack of a few additional entries per engine */
>>   #define ADS_REGSET_EXTRA_MAX	8
>> @@ -279,23 +282,43 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>>   	return total_size;
>>   }
>>   
>> +static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>> +				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
>> +{
>> +	u32 size;
>> +	u32 klv_entry[] = {
>> +		/* 16:16 key/length */
> 
> drop this comment, code is self explanatory
> 
>> +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>> +		FIELD_PREP(GUC_KLV_0_LEN, 0),
>> +		/* 0 dwords data */
>> +	};
> 
> you can define size here:
> 
> 		u32 size = sizeof(klv_entry);
Sure
> 
>> +
>> +	size = sizeof(klv_entry);
>> +
>> +	if (*remain < size) {
>> +		drm_warn(&ads_to_xe(ads)->drm,
>> +			 "w/a klv buffer too small to add klv id %d\n", klv_id);
> 
> this looks like our programming error so xe_gt_assert() should be
> sufficient as we don't expect this ever happen in production
> 
> but if you want to keep the WARN then use xe_gt_WARN() instead
Ok
> 
>> +	} else {
>> +		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>> +				 klv_entry, size);
>> +		*offset += size;
>> +		*remain -= size;
>> +	}
>> +}
>> +
>>   static void guc_waklv_init(struct xe_guc_ads *ads)
>>   {
>> +	struct xe_gt *gt = ads_to_gt(ads);
>>   	u64 addr_ggtt;
>>   	u32 offset, remain, size;
>>   
>>   	offset = guc_ads_waklv_offset(ads);
>>   	remain = guc_ads_waklv_size(ads);
>>   
>> -	/*
>> -	 * Add workarounds here:
>> -	 *
>> -	 * if (want_wa_<name>) {
>> -	 *      size = guc_waklv_<name>(guc, offset, remain);
>> -	 *      offset += size;
>> -	 *      remain -= size;
>> -	 * }
>> -	 */
>> +	if (XE_WA(gt, 14019882105))
>> +		guc_waklv_enable_simple(ads,
>> +					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>> +					&offset, &remain);
> 
> hmm, it looks that your implementation here in patch 2/2 is different
> than suggested one in patch 1/2
I wrapped up adding W/A KLV entry inside the function. I will refine 
comment in patch 1/2 to align with patch 2/2.

Regards,
Badal
> 
>>   
>>   	size = guc_ads_waklv_size(ads) - remain;
>>   	if (!size)
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 48cdba1cbf95..a8d15f004b6c 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -19,3 +19,4 @@
>>   		GRAPHICS_VERSION_RANGE(1270, 1274)
>>   		MEDIA_VERSION(1300)
>>   		PLATFORM(DG2)
>> +14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
