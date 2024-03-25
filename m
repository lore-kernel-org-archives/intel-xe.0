Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777D1C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 18:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2665610E557;
	Mon, 25 Mar 2024 18:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XI21QV5Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4444D10EA9E
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 18:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711392937; x=1742928937;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8n5URmvexb7SGAWZ+YJecR4q+/p62h1gHD2P9y2if/o=;
 b=XI21QV5Y2qm9HvqTdEcFw5+1tOP+Rq+0kV2xceDtKiRvK3nLStLtBSs5
 B4NTWQvt0RlOvGJEYJHzI7ycgu1xICR287hm+tkXUH5v30843IcGiYKI2
 DNbVW9Rd9/T2YVBsbyNPlgWpLwHWycd0UPg+VfvxXwni/EgYQCALJGfVg
 DaRdU7hOyt7G4LYpTSaBaDtspnNN22SA/kYnExb52kigekNv5TE4W87lx
 lD3+NVEx/iGrRaMmTJTJeiLWDSxC7je1EJ2IBFhGKteGSJTyDYk66bvjB
 xQSZAjwC7mANl/tbXTXiQgL+ZJXP/T+/W7nB8hxed54n/fWijnPUuwHBr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10197567"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="10197567"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 11:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="15734355"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 11:55:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 11:55:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 11:55:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 11:55:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 11:55:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cU1WSvu/9M2pXS1TJ6b4uFQJf1Z21+zJyUQYAlCT65yxLgDPkt7Qe5PerR67+sMhNmbfS3QtrwzwEn0eH6dWIZPs62BNIj3FC1v+3UTOpJoAouj8XBBNH+eEi/baFxldT9o/OoAg4F8blOym5fB/qkdayZ2NddIXKfpJqEdbobgPHYLO5x6An0NDYoe3S8Q+Hgu7lJ9aeHxKTuBoitqQ8fP/bpG7rA9wbemVPftwOn61iMO0FYWi6ed1o4HHCE4s4Q4p41xseGmSVLAnam1nOkHXueH2U8B+2VLBLecjwgNpmYF4g3X5MGCGZ5K0f0LX/FrGZkwftHuWUH25Q1xe9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4D30mIzPqDwa7NSdOm7v202fxwKXHNske8kVldUes0=;
 b=oKeZSs2qJwapYgK4BKF8HuGBtKWjGCKyT9XkM1C76ztt0zEV46fUrEgeMmUh3u8edGD2Z2+aPPiCs2qkZfMGYzzsBlqKg8DeG2p3aQbJWpIg0kySfC1NX2gaJnJ8ku2n8JmXGTz0spWEGRbRY1MCyimF5EMRFN3BzC8BQ/rlDv6FjEScFQLRnPKK9B5LxuXxbmObFg4sOYfF6awQs4pp1XPr4HrB7A5RfDCUXgKVjdchcxtufvx7bFDRL+4Qk45heCXISExbKz1GGVY0+6xR2EQ0/EbXrD0yosHZVGBSZ049KZBRiUP+T0OirznyJyifJzZxh7KA26IfKFeNFCgqcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BL3PR11MB6507.namprd11.prod.outlook.com (2603:10b6:208:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 18:55:30 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 18:55:30 +0000
Message-ID: <d218bc8f-f1cb-4ddd-a587-5d41cd7a9432@intel.com>
Date: Mon, 25 Mar 2024 11:55:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/guc: Add support for w/a KLVs
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
 <20240325150435.2967536-2-badal.nilawar@intel.com>
 <b772d2dc-25d6-48de-b745-e61b2c218460@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <b772d2dc-25d6-48de-b745-e61b2c218460@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BL3PR11MB6507:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oz5j2EFEOZblGwwgEu+feFQqyB4N23XIIFPIOgoOrtcn1p+A9NaNnDf32l6tv6pzzlYJoGJByfQiL9DC35KsRrK5axxVCrYXhCJG1hUk2Dzvw3ue5Zle7bmK8nkLlcbT6PXgWLNUEkPD0JatS2CqewRwtguz7JakQk4wqxhjE1Wg9Jyx9FvSlbEnpbDpGLNLCSj9nVPYT2NiRF+UOcJ+bPq7sdUv2PNvokTGwcLTdo16ohmyBjWyhEiNhLM0qbEvnPPsqIszqz/RguC4deW4857VoI2prrtXlVllCXINzRPzKdp5/goxs/i5DW9kwQMwnZ7HHRs42ZrE1Om91TcrpAeGIaJGDISieGP1gBwOiHKpbTJskYCO9rP6zW1/o24tE0crm/Opr/7dDA9ZA0UequxISWAzjdp4a5A1SBgtvwIkOZZN3jOfqW3qiaig/YFeCuaG5b8UrKe4SctuGYwLxqsgbp+11kWbeyKl4VmNQ4eMCCcrBApaPeXOjnHfsTjR03hHiQsSAkAL3S+wVooGt+AtWH4DK9sx0IKeWAg10+XH7HzMMaktBbSRiJFa8XI5Vcfd30AWzzRS5NrY1z2HhWPBjIf8wQrBCpIstGza4lxIjZd1LPoxe9UTSGiv0/zAIs6vFEXWjoO8WzIGa3V7mz+rZnlapIvYkn6ZTewNMY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEtYZzhYSXRWQjhmVUtiZmtZeDNLUncycDNYeHdmeW45dHVXcFlmZ0hidUhI?=
 =?utf-8?B?WXJpSGx6cFliT043RnFLMTV3VGk5YkxKQXdObXdPdjd6YkFWcmdIaklvK0dL?=
 =?utf-8?B?OWVVS2JwOGFHNnpVVUhTOGNsQmo1RDdmcEhtYWQwOFVwQjNkem40M245NEZ5?=
 =?utf-8?B?bzhYNWdtaHlreGQ5RGJhQVdQdVJqcldmMElMSy8wN0xSOS9YV1RmMDZoa1cz?=
 =?utf-8?B?WG1kbGNVb1RLNUx0akNrM29vMVgyNlRvYVdTV3hLQ2dzRm1KZEZxWVUrVHBL?=
 =?utf-8?B?WUg4OUdyMUlSWU9kdkV5ZUU0RFNVc05kT28weDFCRER6c0gxNVl0RUhiRVVC?=
 =?utf-8?B?YjNPNVNNZ1lPbnIrbzNXQ0RBamF1aXpFWExFTHVBQ0VZTmJlM3phMzg4WndZ?=
 =?utf-8?B?WjVCcVVkaHJaYmJva2hNT0t0MUV3WHQ3c1cra1MrSGM0eDNUV0VkN3NCMDlF?=
 =?utf-8?B?V0w4S0JYL0hGS0dFZENFSUpaa2lvNDVGTUFia3Axam9oQkpOb3F1M25SOFE2?=
 =?utf-8?B?MUJobUdmSHhMVXA4V29BWUlhVDBpeFRyK1krMTBRTml4d3pocVhPRlZXaExS?=
 =?utf-8?B?U2Z2MHdaSWFOcDFJak04R05CeWFzY21tY3h2cUhnUWJ6WXhnTEtJSDZVQUtU?=
 =?utf-8?B?Q2lMUWZTbFdwVnUySjBXYjlQNzE2aXNzWGthQ3UrNWxUZ1lpeW9LUmJaelJX?=
 =?utf-8?B?SEFjeVV0NEcrK3B5YXFmTkltcGhsbW83SEw2MmVOdXVURWw1bndJR1FPY3NM?=
 =?utf-8?B?UWFUVXdRWlNhbjJPcjU1cHJQSFh4SVdDdTdpcmJ6OVhPTDQ0ditlWVpzOS9R?=
 =?utf-8?B?a29hb3k5SzhKRXY3R2EwNXEwQ0Nmb1MwanVtMUFjSVVudVJwRFMyUzcxczFU?=
 =?utf-8?B?d1F6VHNQRi96MXhhUWo1RTBFbU5NdnZtZVpGM1I2b2JQbWNiTXJtdHV2c09u?=
 =?utf-8?B?RXp1TnJhV3NFYlMvTXNLNzJMZmF4LzE0cHVodjl2bWdDVlRUd0RlcmRnSzVj?=
 =?utf-8?B?TGRaNFdhQXBIYmRLY2FVK243c09OWktSQjBWKzh4NytYUHRLYkVJQ0dCNTJq?=
 =?utf-8?B?SGRHUDhPTVlkVmcxRmdxOGFqRU5ReUEvV0ZtRGJUdDZjYTkyZ2NyMDFOQUpk?=
 =?utf-8?B?MEtoMVVGampLODZFdWNzcmg2VTQvckpGWDhPSXpYQTluNkJjVmwwa2lSVU0v?=
 =?utf-8?B?ajN3eVRWaER0YW5jdGpBeEc1UFpRN3pzYnQvT0ZNdERzRTEwRXkwTUZYbHRh?=
 =?utf-8?B?NFJLVmgzQ1N0T1RJUDRPN25QU1hQQnBFNGVlblpKdzE4V2p1dEw4bE5meVNQ?=
 =?utf-8?B?bHZmR2V3Zy9IcGkwUTF1WjVTZXpXV0t6QmZRQ0RvQTBEQmxtL0FIMGhYajdr?=
 =?utf-8?B?bE1ieW54VTRUNTNDaXBqRDZ3MENQa0tXOVZRc0RXZG5WeVB4Wks1YXZIUys4?=
 =?utf-8?B?czFPa0dSWEpWTTJFY2IzT3pyMVk5M05KM2c1WHBhTzEwQmJiekhlYWhVaEtp?=
 =?utf-8?B?L0ZzOWc5SHRNODJoS001R3REUUo5UFRKb2tZb1ZyWi93VDN1bzYwWWQ4SE0y?=
 =?utf-8?B?WTdsNnRDem5Vbkd1NmV4eFF3UGczUXVXSS9Bak15UVh5MEhFMzZsVGxjcFFn?=
 =?utf-8?B?dnhnUWxucHRQU2lpVSsyUTVvOXdHUkJYaTFBQVpGRmtmbnVVaHZMTklwV2dy?=
 =?utf-8?B?ZVVzL0orWHdudmZTV0hUb1ZjSGJ0NitWZlE0OStGb1BZeks0b2ZvYldwTUFw?=
 =?utf-8?B?c21NQjRVTHQ4UlZQakdpY0NOVmFHdmxWSEswcnpIZGsxSTJ5c09rbzVLaTk1?=
 =?utf-8?B?bHhZSUdvcTREOFZHTGZpTzJWZHpQUDNERk5LZDh0TDRoMXd3RzN5ZmxRaUNB?=
 =?utf-8?B?bVlmZjNCeTNtc1JjVlJFRENGQVNyUEpPM1EreHFsREdKT0d6eDR3ZGgwYVBY?=
 =?utf-8?B?RTA2RFR5L0phVzhPRFNJOWE3eUpWTWpETExsNlFCSzN6eUpQUndnMjk0NU8w?=
 =?utf-8?B?alBVNFY1ODJXb3p2OEt0Z24xenQ2QXRzdUZUL0dobGdDeStlZXZtT0UrcDJJ?=
 =?utf-8?B?Z09tOVpGbG1DWG5ubUx5ZmlOVHQ0R3paS2t2VkRBWDYyNGJDRjEyUEhsUFBX?=
 =?utf-8?B?UThPdmlRbGRabXpnUFBlRXVnVmxORkRIazU3TGVpOENQNThCTU51RktzNHFG?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d68c587-bfff-478c-9771-08dc4cfd246b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 18:55:30.3225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LoJNW4ZjfzQeYsSIl+TiRhqgeuyzS/VHoQD2GSn+NIbOFsDDsB+EO3t3jCfbfc2aQwARw2J72XkJ/brB4fH2p65KMkbe1F6k3drXPJi3hMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6507
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

On 3/25/2024 08:19, Michal Wajdeczko wrote:
> On 25.03.2024 16:04, Badal Nilawar wrote:
>> To prevent running out of bits, new w/a enable flags are being added
> nit: shouldn't we spell out "workaround" or use "W/A" as acronym ?

On the i915 side, we always used 'w/a'. It is more abbreviation than 
acronym, certainly it is not an acronym for a proper noun. But yes, the 
first instance in any description or comment should be written out in 
full and only after that should abbreviations be used.

>
>> via a KLV system instead of a 32 bit flags word.
>>
>> v2: GuC version check > 70.10 is not needed as xe will not be supporting
>>      anything below < 70.19 (John Harrison)
>> v3: Use 64 bit ggtt address for future
>>      compatibility (John Harrison/Daniele)
>>
>> Cc: John Harrison <John.C.Harrison@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 62 ++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
>>   drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 ++-
>>   3 files changed, 66 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index df2bffb7e220..a98344a0ff4b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -80,6 +80,10 @@ ads_to_map(struct xe_guc_ads *ads)
>>    *      +---------------------------------------+
>>    *      | padding                               |
>>    *      +---------------------------------------+ <== 4K aligned
>> + *      | w/a KLVs                              |
>> + *      +---------------------------------------+
>> + *      | padding                               |
>> + *      +---------------------------------------+ <== 4K aligned
>>    *      | capture lists                         |
>>    *      +---------------------------------------+
>>    *      | padding                               |
>> @@ -131,6 +135,11 @@ static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
>>   	return PAGE_ALIGN(ads->golden_lrc_size);
>>   }
>>   
>> +static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
>> +{
>> +	return PAGE_ALIGN(ads->ads_waklv_size);
> btw, shouldn't we start using ALIGN(xx, SZ_4K)
>
>> +}
>> +
>>   static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>>   {
>>   	/* FIXME: Allocate a proper capture list */
>> @@ -167,12 +176,22 @@ static size_t guc_ads_golden_lrc_offset(struct xe_guc_ads *ads)
>>   	return PAGE_ALIGN(offset);
>>   }
>>   
>> +static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
>> +{
>> +	u32 offset;
>> +
>> +	offset = guc_ads_golden_lrc_offset(ads) +
>> +		 guc_ads_golden_lrc_size(ads);
>> +
>> +	return PAGE_ALIGN(offset);
>> +}
>> +
>>   static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
>>   {
>>   	size_t offset;
>>   
>> -	offset = guc_ads_golden_lrc_offset(ads) +
>> -		guc_ads_golden_lrc_size(ads);
>> +	offset = guc_ads_waklv_offset(ads) +
>> +		 guc_ads_waklv_size(ads);
>>   
>>   	return PAGE_ALIGN(offset);
>>   }
>> @@ -260,6 +279,42 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>>   	return total_size;
>>   }
>>   
>> +static void guc_waklv_init(struct xe_guc_ads *ads)
>> +{
>> +	u64 addr_ggtt;
>> +	u32 offset, remain, size;
>> +
>> +	offset = guc_ads_waklv_offset(ads);
>> +	remain = guc_ads_waklv_size(ads);
>> +
>> +	/*
>> +	 * Add workarounds here:
>> +	 *
>> +	 * if (want_wa_<name>) {
>> +	 *      size = guc_waklv_<name>(guc, offset, remain);
>> +	 *      offset += size;
>> +	 *      remain -= size;
> maybe just asserting the used size will work ?
>
> 		used += guc_waklv_NAME(guc, offset + used);
> 		xe_gt_assert(gt, used <= guc_ads_waklv_size(ads));
>
>> +	 * }
>> +	 */
>> +
>> +	size = guc_ads_waklv_size(ads) - remain;
>> +	if (!size)
>> +		return;
Hmm. This test would be much more obvious as to its purpose if it was 
simply "if(!used)". Not sure if the rest of the code is overall simpler 
or more complex, though?

It would be nice if the "used += ...; xe_asert(used < size);" could be 
done in a loop that just takes an array of all the KLV ids. Not sure how 
to achieve that with the w/a enable test, though. At least not without 
the code just getting overly complicated. I guess it's not that much of 
an issue to replicate the assert line for each w/a entry.


>> +
>> +	offset = guc_ads_waklv_offset(ads);
>> +	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
>> +
>> +	ads_blob_write(ads, ads.wa_klv_addr_lo, lower_32_bits(addr_ggtt));
>> +	ads_blob_write(ads, ads.wa_klv_addr_hi, upper_32_bits(addr_ggtt));
>> +	ads_blob_write(ads, ads.wa_klv_size, size);
>> +}
>> +
>> +static int calculate_waklv_size(struct xe_guc_ads *ads)
>> +{
>> +	/* Fudge something chunky for now: */
>> +	return PAGE_SIZE;
> maybe SZ_4K ?
Technically, it is specifically a page not an arbitrary size that 
happens to be page. However, it is really the GuC page size rather than 
the host page size. At least, there is a requirement for the address 
given to GuC to be page aligned as the lower bits are discarded. Whether 
there is also any requirement on the host side for allocations to be 
page aligned because they are going to be rounded up anyway by the 
internal allocation mechanism is another matter. I believe that was the 
case on i915 but not sure about Xe? So maybe it is both GT page size and 
host page size?

Is there any host architecture which has a page size that is not a 
multiple of 4KB? If so, then maybe we need some fancy calculation that 
is the lowest common factor of host page size and GT page size. But that 
seems unlikely. In which the host page size seems the simplest valid 
definition. If you want to be really paranoid, you could maybe add a 
global compile time assert somewhere that PAGE_SIZE is a multiple of 4K?

>
> and is it really a 'calculate' helper ?
>
> if so then maybe add template comment how this will be calculated using
> want_wa_<name> and guc_waklv_<name> tuples
I suspect the calculation will be more like "if(IPVER >= 100) size = 
PAGE * 10; else if(IPVER >= 50) size = PAGE * 2; else size = PAGE;". So 
yes it is a calculation, but for the foreseeable future the calculation 
is trivial. A single page is both the minimum size possible and is 
sufficiently large enough for all current platforms. It may be worth 
using that last sentence as the comment instead?

>
>> +}
>> +
>>   #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
>>   
>>   int xe_guc_ads_init(struct xe_guc_ads *ads)
>> @@ -271,6 +326,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>>   
>>   	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>>   	ads->regset_size = calculate_regset_size(gt);
>> +	ads->ads_waklv_size = calculate_waklv_size(ads);
>>   
>>   	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
>>   					  XE_BO_CREATE_SYSTEM_BIT |
>> @@ -598,6 +654,8 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>>   	guc_mapping_table_init(gt, &info_map);
>>   	guc_capture_list_init(ads);
>>   	guc_doorbell_init(ads);
>> +	/* Workaround KLV list */
> drop useless comment ...
>
>> +	guc_waklv_init(ads);
>>   
>>   	if (xe->info.has_usm) {
>>   		guc_um_init_params(ads);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> index 4afe44bece4b..62235b2a6fe3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> @@ -20,6 +20,8 @@ struct xe_guc_ads {
>>   	size_t golden_lrc_size;
>>   	/** @regset_size: size of register set passed to GuC for save/restore */
>>   	u32 regset_size;
>> +	/** @ads_waklv_size: waklv size */
> ... instead improve comment here
>
>> +	u32 ads_waklv_size;
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index c281fdbfd2d6..52503719d2aa 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -207,7 +207,10 @@ struct guc_ads {
>>   	u32 capture_instance[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>   	u32 capture_class[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>   	u32 capture_global[GUC_CAPTURE_LIST_INDEX_MAX];
>> -	u32 reserved[14];
>> +	u32 wa_klv_addr_lo;
>> +	u32 wa_klv_addr_hi;
>> +	u32 wa_klv_size;
> maybe it's worth to add a comment from which GuC version these new
> fields are redefined
Not necessary. Xe does not support any GuC version which does not 
support a w/a KLV. Therefore this is simply baseline support same as all 
the other fields here.

John.

>
>> +	u32 reserved[11];
>>   } __packed;
>>   
>>   /* Engine usage stats */

