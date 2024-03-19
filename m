Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8576DCD11BF
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 15:21:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AA110FB90;
	Tue, 19 Mar 2024 15:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hL97Ueg2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA69C10FB8E
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 15:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710861705; x=1742397705;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s4B4gwEiZ2/UYWVCav6eAmBaP/LCY8yg+FZLMIA6Gj4=;
 b=hL97Ueg2RwrzCfNt10lUTHPltruK77KUd/7y5lurp9xphwg6xta9lOgY
 2VgfRGqVTq8MjIzoFpQZFnNKAHB47FGvhHgRBq6OCbGHna7j2w0WVzHh+
 V3LNMUjeqoqIlwS0v9QMsjvgtJgYLwMs+79HSfKzE1xT5umjHFXCBOOjQ
 VIDJ03a9cTY4utm5B9urvOoBwOEzn0TNZOOYKmohivOtPTmHjm+wHrKMH
 wxVPMewHcV7Wr2HjMXrOwu/zR4R88OSQrQDf4kwkMFYw8VwTeoVBrLaW3
 zeUJ08FkCbpW5yZLsvIGLr8vXSdcJnkWVODErvW6dM+YvBC59/2pfeaGl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="9559115"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="9559115"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 08:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="44801876"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 08:21:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 08:21:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 08:21:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 08:21:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTx8jPDcKRahNg+wtVRGVCl1NBTG2FUvOlU0nVowZupbch0rIvLIQFWpg4O1q0Y0NTmLZ/uMsysq93e+i2QEAWmh0xa/eusR1DxHZAGV+TuZws2VL07Ae+54cAhTdc4Aqfb2Dt45KWzPYu8IKUSTOO5Acu8UdRTOB5eo+iWJSpMkRdLlNbVIlgsFGCVMp5sZ/pznboqjrCZAYvzSN9Yu1c0KFEvEhBDdQq+Okji4GkokIgKZn6eI8P9Z07tOkBmahWzIS0E0WEfoYRPA0nmFJ3Y4tvc0ZOm1UTNM63mnrPsZmMz3yFOB4kWlIv3RfhfQAq5VRG4ggeSDROBN9aLzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqXZVTez+Uyni7XXffA4oz6wUv8U+bfoJJuFAI7dOZE=;
 b=PDkBiUC+Tr/MA/oeS47a9WCB9fj5udtB4B9y/Zn243ayt0OnNvIknE2ASnoE3wzimQsz6O62Tcgnzw7FoEcmlbIYclNXLGhI5NWnAvLJC6lxDaLXFUsvaTCBuPvIokWsBvQxgoqFgXR2vNjjQSB+FUzZ68CGSojb2CQctSlsdUJNqOXPPeeUk0v9n7tIa28pRftzyo99pjUui6QL0VxXHRbeAdh5JfwDBm0IFcPOcecWnay+m7jHj75FYzojkT/u4oq2LarDEgsNRFczsPryVfBeIhS+keStTCWMAL4LxeNpcT/NtlBq43m3pqNoeWRQrz+OE7mjIbxaRqWYLkBfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB5189.namprd11.prod.outlook.com (2603:10b6:510:3d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Tue, 19 Mar
 2024 15:21:41 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 15:21:40 +0000
Message-ID: <57fdb710-399a-4351-ac87-76a85f0e8c64@intel.com>
Date: Tue, 19 Mar 2024 20:51:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Add support for w/a KLVs
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240315112147.2460691-1-badal.nilawar@intel.com>
 <20240315112147.2460691-2-badal.nilawar@intel.com>
 <e4dcce08-40fe-4a8e-bff7-2cf70a404766@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <e4dcce08-40fe-4a8e-bff7-2cf70a404766@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::22) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b8decb-1e5e-4a35-6fe4-08dc482846ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JhD8dDv5rs4nW/XNHgSpmnLUSwB/3XY09inl0MeF27c2vrAJghvOQY0PBoMLHMhtRtX7M8SzWb3I5WheimcW7QrPr5ShpaOlpW0+ZCRwFpp8ahyIYL+MrfiIB8EGBrRmSNka4YFTj1w76BdgF6FnGoUeN4KYP5pBeI0ZpeAhZsKQ6nqS0eOPKhhrHpkPGKispaLxTjtN8sBb6l7lSilwmHOqQdx0W2pS4EkyZcINNYjWNMvBaSh09xmcDnyfvg6GcwhlViZyCmDGVs5X3yew5HU+BvkCnwdiKZ1jxLfBK0K8y0dmy7AFizXqiYhtjqdp1ahhCf29GLpx11XSq/Iya3sTB9OvzD4wLLvh7pUyo2fR33CIysqR+x7QT3hgSxaa+3eZZKVgHYMctBTPble+0zRtRYc6pKwcK7+EUEXw7qu1TPM4htx/3/GcCTpyH7CZFbHUorjVEzT7bbgvhRCQLsVAOFUh4ZaFNVtlnfWJrB9+EkDavRUX+6G8ozwHSq4Qdi/T3WnHW2274qcqV5kW7S5jAg7CmIOc2G0z1Uc256JO10tSISX7mHfASvfSRdwE9r+p9bsxVZdrgLV0nxlZM4iMBRxrPCGLLpgVKdCZnig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1diaEZDeFlXcm13Z2gxMS9xOXhpZHBleFJxeWxYRUFCUHhIZHZNNEpvRExW?=
 =?utf-8?B?enkzRHNqamU0emQ5VFhyYlNTdUpXNGxwQ2ZNUjBKUWdzRHRlVENKNkpMajI1?=
 =?utf-8?B?RTI3WEY1Vi9NbERrQWhPTTZ4RDBVQlZOZ3EzL0hkdUdTUnRmZVF0Y3lOV1hC?=
 =?utf-8?B?SFNCSWVyY1FCcURib2xDY2JCOVo0cm1ETTVUZ3UvTFNlQTNDUnpxelB3NEdj?=
 =?utf-8?B?ODdQb3F2VDJkb21MUTUrREZRTnlwYzcvQmx2dXVDVEJzdnlaK25uOFYzOEw1?=
 =?utf-8?B?ZXFyZndLZ2hIc3dtUFIwaGUvT29XZUttT045Q0V1QWtrZDhTU0RSV0xqQWFo?=
 =?utf-8?B?MjVNV08zZWN0d1F1RjVLaHJ2Rk9vWkR3a2lBdkJhZXNzaERlaTdja0JVZ3l4?=
 =?utf-8?B?OVJCc05ONElUakRINm13eitlTHFuSFltNnY1OE1WTXgza213VGtkSHR4dHg1?=
 =?utf-8?B?WHRWdm9kTHB4M1padDlmRzNkejVpVmVSajd6TmxaaFFRd2lYbDVYV3p2TGEr?=
 =?utf-8?B?d0dhcm1CSW0vY3pXK0lLT3IzS29KWGJGb2JEcXFtVnJEQWhQU1BFa2REc21r?=
 =?utf-8?B?enpUR2FOMEpQL011WkYxN0xGNGY3TDhjZW9FeGdOdjlZM085REVxaGtjZ1Zm?=
 =?utf-8?B?U2hXQ0FtUnkxZ3JvMGkrZERhK0xPYlVzbjNhanhkbnlBbzQwMzZ3Y0xWdDNB?=
 =?utf-8?B?bGs1KzBKazJOMUJqUHdQQlAwanZueGs4QUE2YWRJZHY5d2dUeGl3d0lWMGRi?=
 =?utf-8?B?MWNkNkJqdUtSaG5DN2hQZGFvY0NBa1ZrUkgwbEt2ZFZJQ0hYWnpINkFlK05E?=
 =?utf-8?B?d0x4WEo5ckxjQTI2UFZ4ZWdDOFZ5UjQ4UllDalZNOW1ReGdybkI4VlZaU0xy?=
 =?utf-8?B?bjBmUCt5WmxkSTkzb1hESllyTVIwbzlySHQxak85QStTSGtsMFlybFM4THJB?=
 =?utf-8?B?WnVrQVA5clRrUnFWeW1GNGlJN0dMdmF3eWRPcFRGV3Qvck8zUHhacVJESVh5?=
 =?utf-8?B?aEIwcFN4bEdka3dzWURtQ2sxaGtzWmtUZDF3OUtRU1FBMmJkdzRkUENsS2dh?=
 =?utf-8?B?S29DU3ErM3VzY3R0MGJLRWJDcThScXllUlA0bGp6Z1VVOExwN0ozVURwRU16?=
 =?utf-8?B?QXVOVkgyU0tQLzJ2c3JJUFBlRjJoT2RmOHNmbTd1Zk9wV2pBbHgxa3JTR0VK?=
 =?utf-8?B?RWxYUlM1c0RpblRuTUlWcTBndmxqdEFVM3YvaWNENExjdmQzWk1hcFZFSUR6?=
 =?utf-8?B?bTllQnp3aFNZdDNSZ3duaTUrcFZidlpoVHhhYmR1RmF4czIwamt4QVlvRytu?=
 =?utf-8?B?OU5WSy9XbG9UVlE3OWI1YXd1bHB5ZjBlNlhkZytnZTQ3aGtpRWc2ZEF1eExm?=
 =?utf-8?B?ZmJYenE3LytlQVZ4WmZLTVJ0NTQyblpZd0pDOURlV3JvU0FraVdST0ZreUQx?=
 =?utf-8?B?TXRyVVMydlZkUEluWHJrb2tXSVpaL2tVeFpXZVcwRDk1Q25YbXBDY1BHZ1Nw?=
 =?utf-8?B?TFJPWHhJWmJmN0lZa0hjNVJGSWl4MWxaUEc5SVl3WEYzY0JNK1JaeVdKMy9s?=
 =?utf-8?B?NDVTaFUyd2ZuZDliT1F5Rjd6VHNiY2NZY2FsVFdEaDVkZVB1ZTZzQVdDcUF6?=
 =?utf-8?B?VDlzYjd0Y1poMmRDL1pnamhLaUo0Y3BjQklmdzBabnpVUVpLZzd3TWVCQUM3?=
 =?utf-8?B?enRBa2tyMFdTek14Y0M3TzR1N0hqVFNlRS9yam1mbHZUenlOUXVDOU9TYnZt?=
 =?utf-8?B?eDZPV0NxN2dob0xWU3BLU1hXQWxnWTBNWVp2a001UThoKzRJZ2RSWDBuOXc2?=
 =?utf-8?B?QWJBVitLV1IzZUhtajBwQk8xR1E4U2dhbUxLekxQTDFiMHBrNlpOc2lmL21N?=
 =?utf-8?B?YnVPcTVyVFRKcXo5UTR0N25uRENIVGlObm9wSndFOXFUM2dFOW04bm9aME1E?=
 =?utf-8?B?QmluOGdZSis1Y2tDL3RNNGcvYVM3SW4rVTJhVVllM2VHV3hvdFNNaXgwYlNq?=
 =?utf-8?B?bjB6ZzVtZWRXWVJLMy9kM3hWUEJFeDNlcWRzL3NiQW55MUx1UDg3VkJ0b1By?=
 =?utf-8?B?K25GNVRzYVRBdS8xRjV3VGtDNHFVSmhkcytpRDlQSGFGU2xZV2ZPcmtVNHJm?=
 =?utf-8?B?UW40UGdHVlgyV1hCOU5lSTJtSW1iR1N2QnVNTFNpdHA3UTRXRkF0UjU2WVhP?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b8decb-1e5e-4a35-6fe4-08dc482846ab
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 15:21:40.4100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rIdiA8ZQG5dopYv9JSM8yAykGGDruZHLNoYPBnybQLgsMvJ/sq6/gfA2jJTx9EGUVJe66j5cqnp5mHVrovgqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5189
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



On 19-03-2024 03:41, John Harrison wrote:
> On 3/15/2024 04:21, Badal Nilawar wrote:
>> To prevent running out of bits, new w/a enable flags are being added
>> via a KLV system instead of a 32 bit flags word.
>>
>> Cc: John Harrison <John.C.Harrison@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 68 ++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
>>   drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 +-
>>   3 files changed, 72 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 6ad4c1a90a78..ee48cf01fe22 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -80,6 +80,10 @@ ads_to_map(struct xe_guc_ads *ads)
>>    *      +---------------------------------------+
>>    *      | padding                               |
>>    *      +---------------------------------------+ <== 4K aligned
>> + *      | w/a KLVs                              |
>> + *      +---------------------------------------+
>> + *      | padding                               |
>> + *      +---------------------------------------+ <== 4K aligned
>>    *      | capture lists                         |
>>    *      +---------------------------------------+
>>    *      | padding                               |
>> @@ -131,6 +135,11 @@ static size_t guc_ads_golden_lrc_size(struct 
>> xe_guc_ads *ads)
>>       return PAGE_ALIGN(ads->golden_lrc_size);
>>   }
>> +static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
>> +{
>> +    return PAGE_ALIGN(ads->ads_waklv_size);
>> +}
>> +
>>   static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>>   {
>>       /* FIXME: Allocate a proper capture list */
>> @@ -167,12 +176,22 @@ static size_t guc_ads_golden_lrc_offset(struct 
>> xe_guc_ads *ads)
>>       return PAGE_ALIGN(offset);
>>   }
>> +static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
>> +{
>> +    u32 offset;
>> +
>> +    offset = guc_ads_golden_lrc_offset(ads) +
>> +         guc_ads_golden_lrc_size(ads);
>> +
>> +    return PAGE_ALIGN(offset);
>> +}
>> +
>>   static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
>>   {
>>       size_t offset;
>> -    offset = guc_ads_golden_lrc_offset(ads) +
>> -        guc_ads_golden_lrc_size(ads);
>> +    offset = guc_ads_waklv_offset(ads) +
>> +         guc_ads_waklv_size(ads);
>>       return PAGE_ALIGN(offset);
>>   }
>> @@ -260,6 +279,48 @@ static size_t calculate_golden_lrc_size(struct 
>> xe_guc_ads *ads)
>>       return total_size;
>>   }
>> +#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 8) | (pat))
> This should be in a common header file, not duplicated in every source 
> file that wants to use it. But see below...
> 
>> +
>> +static void guc_waklv_init(struct xe_guc_ads *ads)
>> +{
>> +    u32 addr_ggtt, offset, remain, size;
>> +    struct xe_uc_fw *uc_fw = &ads_to_guc(ads)->fw;
>> +    struct xe_uc_fw_version *version = 
>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>> +
>> +    if (GUC_VER(version->major, version->minor, version->patch) >= 
>> GUC_VER(70, 10, 0))
> Note that Xe will not be supporting anything below 70.19 once this patch 
> lands:
> https://patchwork.freedesktop.org/series/130677/
> 
> Which means that any test for <70.19 will need to be removed again.
I think I will remove version check from this patch.

Badal
> 
> John.
> 
>> +        return;
>> +
>> +    offset = guc_ads_waklv_offset(ads);
>> +    remain = guc_ads_waklv_size(ads);
>> +
>> +    /*
>> +     * Add workarounds here:
>> +     *
>> +     * if (want_wa_<name>) {
>> +     *      size = guc_waklv_<name>(guc, offset, remain);
>> +     *      offset += size;
>> +     *      remain -= size;
>> +     * }
>> +     */
>> +
>> +    size = guc_ads_waklv_size(ads) - remain;
>> +    if (!size)
>> +        return;
>> +
>> +    offset = guc_ads_waklv_offset(ads);
>> +    addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
>> +
>> +    ads_blob_write(ads, ads.wa_klv_addr_lo, addr_ggtt);
>> +    ads_blob_write(ads, ads.wa_klv_addr_hi, 0);
>> +    ads_blob_write(ads, ads.wa_klv_size, size);
>> +}
>> +
>> +static int calculate_waklv_size(struct xe_guc_ads *ads)
>> +{
>> +    /* Fudge something chunky for now: */
>> +    return PAGE_SIZE;
>> +}
>> +
>>   #define MAX_GOLDEN_LRC_SIZE    (SZ_4K * 64)
>>   int xe_guc_ads_init(struct xe_guc_ads *ads)
>> @@ -271,6 +332,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>>       ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>>       ads->regset_size = calculate_regset_size(gt);
>> +    ads->ads_waklv_size = calculate_waklv_size(ads);
>>       bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + 
>> MAX_GOLDEN_LRC_SIZE,
>>                         XE_BO_CREATE_SYSTEM_BIT |
>> @@ -597,6 +659,8 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>>       guc_mapping_table_init(gt, &info_map);
>>       guc_capture_list_init(ads);
>>       guc_doorbell_init(ads);
>> +    /* Workaround KLV list */
>> +    guc_waklv_init(ads);
>>       if (xe->info.has_usm) {
>>           guc_um_init_params(ads);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h 
>> b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> index 4afe44bece4b..62235b2a6fe3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> @@ -20,6 +20,8 @@ struct xe_guc_ads {
>>       size_t golden_lrc_size;
>>       /** @regset_size: size of register set passed to GuC for 
>> save/restore */
>>       u32 regset_size;
>> +    /** @ads_waklv_size: waklv size */
>> +    u32 ads_waklv_size;
>>   };
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h 
>> b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index c281fdbfd2d6..52503719d2aa 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -207,7 +207,10 @@ struct guc_ads {
>>       u32 
>> capture_instance[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>       u32 
>> capture_class[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>       u32 capture_global[GUC_CAPTURE_LIST_INDEX_MAX];
>> -    u32 reserved[14];
>> +    u32 wa_klv_addr_lo;
>> +    u32 wa_klv_addr_hi;
>> +    u32 wa_klv_size;
>> +    u32 reserved[11];
>>   } __packed;
>>   /* Engine usage stats */
> 
