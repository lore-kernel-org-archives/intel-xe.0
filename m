Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22913C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 16:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC2910E8AB;
	Fri, 19 Apr 2024 16:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsi+YweP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3C610E8AB
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 16:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713544325; x=1745080325;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pc3chQklkFsoM4mLehukbqEuiLYTPT3FqGzHRE6qOF8=;
 b=nsi+YwePyDeCWCbFxVVs8JjRqliSp/NgTr+bOSmpz9z/Xt87wyTRbhmc
 EgXK1XpbhEJ6aXJgTAUK+Zf3VSAgOjk6PhSCilOCJ1MPv8j9QmSfRxZbH
 dlAwn3SUCK7t53Qxa7MzwmWWoAL+dr0ashcTs4yc7590WoV9papPr6T5v
 0gF51/trruJuGm9J8zpCXBoNHEkb8wJBtLDNb+1Jg27xBotysraooWOT1
 jLLTCS+dmb68vn+juM5vjISeluD4/CuxQ65PAkQ02NRduPb4O/sLEvKgK
 YgI3ToWk1Qb0mo+q246PDrKmU0Rrl3O+PF46yCWFsKwTrTub1GTBhqxt+ g==;
X-CSE-ConnectionGUID: Q/lX6GSNSNCyHILmucG3XA==
X-CSE-MsgGUID: mL7MlaxTRWKBE3HgIlWwpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="19716527"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="19716527"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 09:32:05 -0700
X-CSE-ConnectionGUID: EYYxSsvOQ3SxCFvbWXeXrQ==
X-CSE-MsgGUID: yUOpdD65SwKwcmq4E/e49A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="28027510"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 09:32:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 09:32:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 09:32:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 09:32:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 09:32:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crdCyL2CjWrbR2EJ5HeiktQFbHlOPO2JYSSSpPR0mwhmezmkqN/164lyyuNwpLHz/uIxnvJaAKO/D0aQcnrm4Om1Hm6ebMaQLp7PVk+R3hQs13W8ffZHhNmP8f3yXbDO/hS3PEnZAhhkUIBpJE2SGTZr8Hz+tFkFiwQbKngrgDKfKaUbBAKr2diZpSbZ87vcZDqnQDmf5r9C7AKIkSNSJSNPl5ufZOi5r1botmB5T7xrh+k90wKSvGt+TbP2HVK8GPY7PFKNiPfQV2aVNp4TxtcJ7EKVUAKbxyoH+mH9kIsQDhDUnz0uD7/MkcNvzpZoV+dv1HnrT4RStXQ7BBcjKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/EhSZQpNkAvVnjVuHDQxf3hRrxvcAFOxXs3XubLoYQ=;
 b=W+io0a5Tu1jF7uqboe+flWG/2XMBt2MYTn6hm336ZdtjSqEwXLrdSBiOcXDM+DGPpFvvysH8DSJrMrSAVD0zKKSrGPyRqg8StVfHQXG+s/LkHHPaBRt0W+bDaK+eMpKNEjev262/h/Lt/Lng4otvxonX8QD9yFSURQ7+qNoLNeGdj++O/UR6XHkNT8r/qTOu6ZFVeixPn+5KJ70/bnAEi0gbOkOrOL47R+b9lvHW2gIiEr8+SLsnESUgUhXz9VcsFQ5RHP3vxwTGxt5Lpv7hcIycdE0NwEp2pfNKdJZFVskjxHS4bMAemqlh+LNVLBWzm/RypgHPioxfxQHw3S0ioA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 19 Apr
 2024 16:32:00 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694%4]) with mapi id 15.20.7519.015; Fri, 19 Apr 2024
 16:32:00 +0000
Message-ID: <278ef72f-52e7-4860-83d4-536e9d46aaae@intel.com>
Date: Fri, 19 Apr 2024 12:31:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] drm/xe/guc: Update GuC ADS size for error capture
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240327204041.178879-1-zhanjun.dong@intel.com>
 <20240327204041.178879-2-zhanjun.dong@intel.com>
 <9eea954d47ef4c38095c079f14805f56d74ca586.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <9eea954d47ef4c38095c079f14805f56d74ca586.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::18) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MN2PR11MB4711:EE_
X-MS-Office365-Filtering-Correlation-Id: ff0149f2-89f1-414b-3926-08dc608e3c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r6dTy8xj6/lwPts5fG+l5a0fqERQwHpD8zzhSG9EEvCD9gRUhGgjS4mYhwElxt0MF675Lqw+2R1V6+BHk96f+Qk3tSzytDKKqxwcxJzoHWpmMAsTHqvqV6rmc4w5393VyJDY3c4ZNITK3J72D3ruXcVxHG+5EFNO7R+qlbdUExF6ri9RLZo7iyBoradj5hrfQWOWhARbXkB3MvfEGEtGBn3XHWhAeep2zBvOLRidngM0C7f4bozzjIRNRtuJH9eDTdMdYiU8Xl5cd0YieeWdufBnuAgNrwVIMMb3Wyqxal1rQPIy/NJBZyg0A+MQFVdMsr+NIotYzD1Hz2rv4kDjSrMfIEFE4z4C4oJKLSCHD7M/8A3rWNYdrz0ObZqvjUXmRDbHAJ6N4Qtm8DVBS+aZFijoSCYfb/3EFHk3Z5GLDZYM17zSaYbwkRECxYIf2ck2QedT59aM9mJmVa1H8rDwQdbpQyDvwIusMsNJzrCpKfDmIKDtvRXL78oMJZv+Fem+jc7xhaoYKjnWZUlObGvOfVEqppJK1HqR4h2hXwnok1q9mJyy1/nSVl+GpvG1NibbAxHnOvzxxj/dGWNsipwJPBiV3tm0aREJzTCBhUQw1X4A3844/P8OAiyBnI7VP4g8nProzFudR3WhLNRblhPwFJuzkmWXOExwBYR8Ln/E+PU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rzl6WDd0UWJHV01vdlQrQ0hwSUhTRnNDUkRrYXBBblVaNFg1VUdDYlNGT0ZR?=
 =?utf-8?B?Sk9OSWVxUnkyeXhtVldiR0ZYMUZZRHZLTzJkNVVIbzByd1c5V3ErTjJpZE5s?=
 =?utf-8?B?dVZEb1Jhb3NFQmNoMWh0WGpZWmVYRGJ2VU93T0lJTzZjZU1BdmU3VTlKTEQ1?=
 =?utf-8?B?eUJ1VUlucUFBT3UrbHNjdFQwTnlYS3RNNkVhRjFBWjRaRnZOdHBHcFlJcVky?=
 =?utf-8?B?QjZqYkUyQXpPRVRzSFVzKzNYdnJ4c28wQ3JDYmtaK0daNmRHVWR0NSs2d1Zq?=
 =?utf-8?B?MDR6bjhVQzhkeWhKNnN1UGFrcnRLMDZiY3NzRnFKL1F5eW5LOTV3T1gwdjdH?=
 =?utf-8?B?M2N6WGtZdjQ1bDdpR1NjbUczaUVvRzZHaEFuMndMU0tPVWRadWh3ZnNmMXI0?=
 =?utf-8?B?KzVJdFFwaldCZW8wZkVHbjhWN2V6Zk1CLzZScy92cFlQb0RQc3BuQTFMaE1W?=
 =?utf-8?B?bFVQcVZWQVMrRmNVcEtsUHFTQVMrSW11Nks1N3JiRHg0SHNQelMyVGdQN1p3?=
 =?utf-8?B?NVJQalJoNGl0bndLMmlmT2lsVjBiaDEyVVJPMEdXOHNIR3JpOGxjcE8vTHdO?=
 =?utf-8?B?YzdBaWtiZ0g2WDVoTG5HL3VBMHFmNTJTZHJ3RWs4MUx0OHNaOUh4dGphbmps?=
 =?utf-8?B?aWs3VDFoYWthV2FCYkNVNFhjN1J1NVI2Vk8zenBvTm5kTWxrYmlVU2xhRG9F?=
 =?utf-8?B?MEZtZ053K1pDaFUybElWcThyOE13RFZEWmVDakNPYmxtVUdsczNGSE1HcFI3?=
 =?utf-8?B?dTFadnJoTjVlck5UcElVRmZJMStXQUlGUWw1R1VBbDcwVTdvUWhjYkdreGFh?=
 =?utf-8?B?c1dQU2VkTWREZEZkTXlJME9ybDdzc0JZaFdCOGZ5NWFvSWhvOUlTU3RrVGg2?=
 =?utf-8?B?eUVkdE02ZlFpeVczbWh5L2d1allFL1VGbk9IcWF4R2RKc2ZSZVB5Rkoxd0NE?=
 =?utf-8?B?VjRucnBERGhIcmVxVEN0R0l3bEtCMW12cWRCRHVuVThmMFZXSHZpbHFUK0xW?=
 =?utf-8?B?OGxFSjlpNXU4MHhRVlp2UXZwU0E2ZzJYNWRGRXQ0WFYxd3R2aW5mbDZwVlpZ?=
 =?utf-8?B?SEI5emZaUWViRC9HNUphSkdTSVd5YjBrVXppOWN4YTZCRlp4QnQrN01vd2ox?=
 =?utf-8?B?MmxUcVduQjJ0cXNFRmU5a25WQnU1bFppOVY3MnQvQVdmSHIwL3pNN0VFbW9D?=
 =?utf-8?B?UXhSSXRzL01HR1BOVCtDVWpOVFdUVE5tRDZEeVdaTWNPbkl0UHZTczZ6MjBi?=
 =?utf-8?B?M1hjVlRKMnZKbjc1dzcxajdtWDVuaEh4YnlTbjhhUzJvMUppU0pTdjUzcmpC?=
 =?utf-8?B?OXd3cm5rUUVSdGM5RVNnb3NEMWpsZ3E5Umk1V1V0ZmFFcEhia2VtY21Vd2F3?=
 =?utf-8?B?c0pqS3NiYWxFcU83Nm1sNkxsTUY0dndudVVQVlF0ckp5TDhqSGZyU21UdU5K?=
 =?utf-8?B?b1hlYWNqY3ZNSkJjVlRSdEs4N090TXd2UnFON1orWjJpdHhLRUwvb2hHRnJ5?=
 =?utf-8?B?aGxjY1Y2OG52SkptWWwrdjFPTXY5Vm5FMzUzbFlrK05OM0d2Q05MR3FPTGtv?=
 =?utf-8?B?U0F2UnZBY0lmL3E1TURLa09pM09RaHFzYWVRSEZyd0pQc0V1NFJjdUFicGNz?=
 =?utf-8?B?OU1EcFNkWG90Q2g0MTVRTnEzb3lmK2wwSVI0ZjUvdFFlRlJUNFpnRXczWlYw?=
 =?utf-8?B?cHBMaDBGSjUzM2tOTFVvQno1L2hsZnhGNUJVL3o5RVdHa0c1R3VFQXdRVWEz?=
 =?utf-8?B?eFZxbEJuYzNSUVVUc1ZLTWM1ZHZLNlhzRFprWmZEWTRScGdwdDdQamd2YXVK?=
 =?utf-8?B?a0p5NVFWejQvRHAwditxL01hZFhGS0d2THdpOENWT3YxOFNiNDduakM5b1Fw?=
 =?utf-8?B?b21jbWZidWtYdDNIY2R1b2J6bmtVdmRaOERERFJOaEgyQkVGVnRHTDZMYjlw?=
 =?utf-8?B?RGNnWVRQRzNVcXF4dEdlb2NZVzFTU1pYK1VveXJyU3hDaThDUTdjbnRiKzFE?=
 =?utf-8?B?MmNrMlRnOTN4R05IZmRERFVsMkhqMmdlSkhTb3lLOEEzcUVGZE90NkJoVEtn?=
 =?utf-8?B?cHVzaTlTTnBYQVJWVnZpZTJxQit6VTB3N096Q0lkU1E1aGJOSHYvNWpxNmF4?=
 =?utf-8?Q?aeRY6aeOpxKpKLsue3EtwqX9B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0149f2-89f1-414b-3926-08dc608e3c95
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 16:32:00.0336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hykjuFoVaY3qVzneseBQzsVHO0AQRBrMHvgI6JGxaLuJ0rKjdFXq/mk1KwEXHShqcMQLFxjtnvwnWSpecxK/4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4711
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

See my comments inline below.

Regards,
Zhanjun

On 2024-04-18 4:19 a.m., Teres Alexis, Alan Previn wrote:
> On Wed, 2024-03-27 at 13:40 -0700, Zhanjun Dong wrote:
>> Update GuC ADS size allocation to include space for
>> the lists of error state capture register descriptors.
>>
>> Then, populate GuC ADS with the lists of registers we want
>> GuC to report back to host on engine reset events. This list
>> should include global, engine-class and engine-instance
>> registers for every engine-class type on the current hardware.
>>
> alan:snip
> 
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index df2bffb7e220..abc0866bf22c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> alan:snip
>>   
>>   static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>>   {
>> -       /* FIXME: Allocate a proper capture list */
>> -       return PAGE_ALIGN(PAGE_SIZE);
>> +       return PAGE_ALIGN(ads->capture_size);
> alan: nit: i believe the functions that calculate the size already
> does the PAGE_ALIGN-ment, so this is a redundant piece of code. I
> was thinking if we might want to test for alignment here - but again
> seems redundant since the functions that generate the sizes are
> not taking any external inputs.

Yes, redundant PAGE_ALIGN, will be change to be for total size only.
> 
> 
>> @@ -260,6 +263,34 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>>          return total_size;
>>   }
>>   
>> +static size_t calculate_capture_worst_size(struct xe_guc_ads *ads)
> alan: since this file has so many parts of ADS, may i suggest we rename this to "calculate_guc_regs_capture_worst_size"?
sure

>> +{
>> +       struct xe_guc *guc = ads_to_guc(ads);
>> +       size_t total_size, class_size, instance_size, global_size;
>> +       int i, j;
>> +
>> +       /* Early calcuate the capture size, to reserve capture size before guc init finished,
>> +        * as engine mask is not ready, the calculate here is the worst case size
>> +        */
> alan: if i may propose some rephrasing of the above comment:
> "this function calculates the worst case register lists size by
> including all posible engines classes. It is called during the
> first of a two-phase GuC (and ADS-population) initialization
> sequence, that is, during the pre-hwconfig phase before we have
> the exact engine fusing info."sure

> 
>> +       total_size = PAGE_SIZE; /* Pad a page in front for empty lists */
>> +       for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
>> +               for (j = 0; j < GUC_LAST_ENGINE_CLASS; j++) {
>> +                       class_size = 0;
>> +                       instance_size = 0;
>> +                       xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
>> +                                                  j, &class_size);
>>
> alan: if for whatever reason xe_guc_capture_getlistsize fails, i see
> code paths in that function that will not initialize the last param (class_size), in which case total_size would contain
> garbage.
> Best to check the return value to ensure valid size was returned...
> OR... initialize class_size, instance_size, global_size above.
> I would prefer the former since a worst case calculation should really
> get valid sizes for all engine classes and global lise, even if it means an empty list which is already designed into
> the guc error
> capture subsystem's register-list tables.
will fix it
> 
>> +                       xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
>> +                                                  j, &instance_size);
>> +                       total_size += class_size + instance_size;
>> +               }
>> +               global_size = 0;
>> +               xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &global_size);
>> +               total_size += PAGE_ALIGN(global_size);
> alan: nit: i could be wrong, but thought we dont need the
> PAGE_ALIGN across the two capture-index types... I thought
> we only need it for the final size. I.e. we only need to
> PAGE_ALIGN on the final return below. Lets sync offline and
> refer to the fw spec.I think the page align for total size should works, let me try
>> +       }
>> +
>> +       return total_size;
>> +}
>>
> alan:snip
>> @@ -302,9 +334,11 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>>          xe_gt_assert(gt, ads->bo);
>>   
>>          ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>> +       ads->capture_size = 0; /* Clear capture_size before run guc_capture_prep_lists */
> alan: above line appears to look totally redundant when a reader
> looks at the very next line after. I wonder if its better
> to modify guc_capture_prep_lists so that is doesn't check
> ads->capture_size and always assumes ads's info_map is valid
> (since guc_capture_prep_lists is only called post_hwconfig,
> thus, we should already have valid engine masks ... and if we
> don't then we should add an error message in guc_capture_prep_lists).
Let me reconsider this part.

>> +       ads->capture_size = guc_capture_prep_lists(ads);
>>          ads->regset_size = calculate_regset_size(gt);
>>   
> alan:snip
> 
>> -static void guc_capture_list_init(struct xe_guc_ads *ads)
>> +static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map *info_map,
>> +                                      u32 capture_class)
>> +{
>> +       struct xe_device *xe = gt_to_xe(gt);
>> +       u32 mask;
>> +
>> +       switch (capture_class) {
>> +       case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
>> +               mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_RENDER_CLASS]);
>> +               mask |= info_map_read(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS]);
>> +               break;
>> +
> alan: nit: Dont need a new line above after the break.
> Same thing for the rest of the cases after this one.
> 
> 
> alan:snip
> 
>> +static int guc_capture_prep_lists(struct xe_guc_ads *ads)
>>   {
>> +       struct xe_guc *guc = ads_to_guc(ads);
>> +       struct xe_gt *gt = ads_to_gt(ads);
>> +       u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
>> +       struct iosys_map info_map;
>> +       bool ads_is_mapped;
>> +       size_t size = 0;
>> +       void *ptr;
>>          int i, j;
>> -       u32 addr = xe_bo_ggtt_addr(ads->bo) + guc_ads_capture_offset(ads);
>>   
>> -       /* FIXME: Populate a proper capture list */
>> +       ads_is_mapped = ads->capture_size != 0;
>> +       if (ads_is_mapped) {
> alan: as per above comment, we might have no reason to use "ads_is_mapped" by checking "ads->capture_size" and just fail
> if ads_ggtt is not valid. Let's discuss offline as i am under
> the impression this function is only getting called when we
> have valid hwconfig info.
> 
> alan:snip
let's reconsider this part.

> 
> 
>>          for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
>> -               for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
>> -                       ads_blob_write(ads, ads.capture_instance[i][j], addr);
>> -                       ads_blob_write(ads, ads.capture_class[i][j], addr);
>> +               bool write_empty_list;
>> +
>> +               for (j = 0; j < GUC_LAST_ENGINE_CLASS; j++) {
> alan: Actually, "GUC_LAST_ENGINE_CLASS" is part of a list of
> definitions used by GuC for information that is NOT related to
> register-capture. This other #define list separates out the values for
> render-vs-compute. In the register-capture case, GuC interface spec
> uses a single value for render-or-compute. So I would propose that
> farther down in this patch where we first add the enum for
> "GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE", we should also add
> GUC_CAPTURE_MAX_ENGINE_CLASS as 5. This actually looks like a bug
> that may still exist in i915 ... it should have been fixed when John
> Harrison fixed the ~'using wrong #defines for guc capture engine
> classes' a long time back. However, the bug doesnt manifest anything
> right now, with the curent definitions we have today, they both end
> up being '5'.
Will add GUC_CAPTURE_MAX_ENGINE_CLASS
> 
>> +                       u32 engine_mask = guc_get_capture_engine_mask(gt, &info_map, j);
>> +                       /* null list if we dont have said engine or list */
>> +                       if (!engine_mask) {
>> +                               ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
>> +                               ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
>> +                               continue;
>> +                       }
>> +                       /********************************************************/
>> +                       /*** engine exists: start with engine-class registers ***/
>> +                       /********************************************************/
> alan:snip
> 
>> new file mode 100644
>> index 000000000000..bc6b682998e2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -0,0 +1,300 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021-2022 Intel Corporation
> alan:snip..
> 
>> +#include "xe_hw_engine_types.h"
> alan:nit: xe_hw_engine_types shoiuld come after xe_g*** (alphabetical)
To be updated
>> +#include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_capture.h"
>> +#include "xe_guc_capture_fwif.h"
>> +#include "xe_guc_ct.h"
>> +
>> +#include "xe_guc_log.h"
>> +#include "xe_gt_mcr.h"
>> +#include "xe_guc_submit.h"
>> +#include "xe_macros.h"
>> +#include "xe_map.h"
> alan: any reason why above 5 headers are grouped separately?...
> why not group together with the group before it (but will also
> need alphabetical reshuffling either way).
To be fixed
> 
> 
> 
> alan:snip
> 
>> +static const struct __guc_mmio_reg_descr_group *
>> +guc_capture_get_device_reglist(struct xe_guc *guc)
>> +{
>> +       //FIXME: add register list
>> +       return NULL;
> alan: i am not sure if its acceptable to define all these functions that help manage the
> register list and extended list when we have not defined what these lists could look like.
> I am familiar with the code from i915 but i think another reviewer may have a hard time
> trying to understand what reglists[i] could look like without any example of it getting
> instanced with populated values. i think it might be better to move the ext-list code into
> the 2nd patch but bring the static register table from patch #2. This was how the series was
> organized in i915 during its review. Lets connect offline and check with other folks to
> be sure this is needed or if its okay. Of course if we do this, then every patch chunk
> that accesses "extlists" would also need to move from everywhere else in this patch to #2.
> 
> alan:snip
> 
I'm trying to make this patch smaller, I think I can add few register in 
this patch to let reviewer know what it looks like, and add most in next 
patch.

> 
>> +int
>> +xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr)
>> +{
>>
> alan:snip
>> +
>> +       caplist = kzalloc(size, GFP_KERNEL);
> alan:switch to the drmm_kzalloc so its managed.
sure, will do. No more free.

>> +       if (!caplist) {
>> +               xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture list");
>> +               return -ENOMEM;
>> +       }
>> +
>> +       /* populate capture list header */
>> +       tmp = caplist;
>> +       num_regs = guc_cap_list_num_regs(guc->capture, owner, type, classid);
>> +       listnode = (struct guc_debug_capture_list *)tmp;
>> +       listnode->header.info = FIELD_PREP(GUC_CAPTURELISTHDR_NUMDESCR, (u32)num_regs);
>> +
>> +       /* populate list of register descriptor */
>> +       tmp += sizeof(struct guc_debug_capture_list);
>> +       guc_capture_list_init(guc, owner, type, classid, (struct guc_mmio_reg *)tmp, num_regs);
>> +
>> +       /* cache this list */
>> +       cache->is_valid = true;
>> +       cache->ptr = caplist;
>> +       cache->size = size;
>> +       cache->status = 0;
>> +
>> +       *outptr = caplist;
>> +
>> +       return 0;
>> +}
>> +
>> +int
>> +xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size)
>> +{
> alan:snip
> 
> 
>> +
>> +       null_header = kzalloc(tmp, GFP_KERNEL);
> alan:switch to the drmm_kzalloc so its managed.
>> +       if (!null_header) {
>> +               xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture null list");
>> +               return -ENOMEM;
>> +       }
>> +
>> +       gc->ads_null_cache = null_header;
>> +       *outptr = null_header;
>> +       *size = tmp;
>> +
>> +       return 0;
>> +}
>> +
>> +int xe_guc_capture_init(struct xe_guc *guc)
>> +{
>> +       guc->capture = kzalloc(sizeof(*guc->capture), GFP_KERNEL);
> alan:switch to the drmm_kzalloc so its managed.
>> +       if (!guc->capture)
>> +               return -ENOMEM;
>> +
>> +       guc->capture->reglists = guc_capture_get_device_reglist(guc);
>> +
>> +       INIT_LIST_HEAD(&guc->capture->outlist);
> alan: Since parsing and extration of guc produced register dump is only introduced in
> patch #5, the typical rule is we shouldnt have any mention of this variable until patch #5
> (note even in the main xe_guc_capture struct definition). However, lets check offline with
> committers if this is a strict enforcement considering or not... (since this is all
> FW-interaction code, identical to i915 and the merge will always come together).
> I suspect we'll have to fix it though.
Will reorgize this part.
> 
>> +       INIT_LIST_HEAD(&guc->capture->cachelist);
>> +
>> +       return 0;
>> +}
> 
> alan: Please move xe_guc_capture_destroy from patch #6 to this patch.
> It doesnt match up to have the list allocations in this patch and
> then have them destroyed in patch #6. Note however that with
> drmm_kzalloc, i am not sure u need a destroy but we can at
> least have it set 'guc->capture = NULL;' to catch any
> post-destruction accesses.
Will reorgize this part.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
>> new file mode 100644
>> index 000000000000..a16dcbe87af0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021-2021 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_CAPTURE_H
>> +#define _XE_GUC_CAPTURE_H
>> +
>> +#include <linux/types.h>
>> +#include "xe_exec_queue_types.h"
> alan:why do we need this header?
> alan:snip
To be removed
> 
> 
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
>> new file mode 100644
>> index 000000000000..4bb94ac1ff48
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
>> @@ -0,0 +1,177 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
> alan: nit: for each structure definition in this file, we should try to format
> the comments/documentation around it to follow the proper linux kernel documentation style.
> 
Will reformat
> alan:snip
> 
>> +/*
>> + * struct guc_debug_capture_list_header / struct guc_debug_capture_list
>> + *
>> + * As part of ADS registration, these header structures (followed by
>> + * an array of 'struct guc_mmio_reg' entries) are used to register with
>> + * GuC microkernel the list of registers we want it to dump out prior
>> + * to a engine reset.
>> + */
>> +struct guc_debug_capture_list_header {
>> +       u32 info;
>> +#define GUC_CAPTURELISTHDR_NUMDESCR GENMASK(15, 0)
>> +} __packed;
>> +
>> +struct guc_debug_capture_list {
>> +       struct guc_debug_capture_list_header header;
>> +       struct guc_mmio_reg regs[];
>> +} __packed;
>> +
>> +/*
>> + * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
>> + *
>> + * xe_guc_capture module uses these structures to maintain static
>> + * tables (per unique platform) that consists of lists of registers
>> + * (offsets, names, flags,...) that are used at the ADS regisration
>> + * time as well as during runtime processing and reporting of error-
>> + * capture states generated by GuC just prior to engine reset events.
>> + */
>> +struct __guc_mmio_reg_descr {
>> +       struct xe_reg reg;
>> +       u32 flags;
>> +       u32 mask;
>> +       const char *regname;
>> +};
>> +
>> +struct __guc_mmio_reg_descr_group {
>> +       const struct __guc_mmio_reg_descr *list;
>> +       u32 num_regs;
>> +       u32 owner; /* see enum guc_capture_owner */
>> +       u32 type; /* see enum guc_capture_type */
>> +       u32 engine; /* as per MAX_ENGINE_CLASS */
>> +       struct __guc_mmio_reg_descr *extlist; /* only used for steered registers */
>> +};
>> +
>> +/*
>> + * struct guc_state_capture_header_t / struct guc_state_capture_t /
>> + * guc_state_capture_group_header_t / guc_state_capture_group_t
>> + *
>> + * Prior to resetting engines that have hung or faulted, GuC microkernel
>> + * reports the engine error-state (register values that was read) by
>> + * logging them into the shared GuC log buffer using these hierarchy
>> + * of structures.
>> + */
>> +struct guc_state_capture_header_t {
>> +       u32 owner;
>> +#define CAP_HDR_CAPTURE_VFID GENMASK(7, 0)
>> +       u32 info;
>> +#define CAP_HDR_CAPTURE_TYPE GENMASK(3, 0) /* see enum guc_capture_type */
>> +#define CAP_HDR_ENGINE_CLASS GENMASK(7, 4) /* see GUC_MAX_ENGINE_CLASSES */
>> +#define CAP_HDR_ENGINE_INSTANCE GENMASK(11, 8)
>> +       u32 lrca; /* if type-instance, LRCA (address) that hung, else set to ~0 */
>> +       u32 guc_id; /* if type-instance, context index of hung context, else set to ~0 */
>> +       u32 num_mmios;
>> +#define CAP_HDR_NUM_MMIOS GENMASK(9, 0)
>> +} __packed;
>> +
>> +struct guc_state_capture_t {
>> +       struct guc_state_capture_header_t header;
>> +       struct guc_mmio_reg mmio_entries[];
>> +} __packed;
>> +
>> +enum guc_capture_group_types {
>> +       GUC_STATE_CAPTURE_GROUP_TYPE_FULL,
>> +       GUC_STATE_CAPTURE_GROUP_TYPE_PARTIAL,
>> +       GUC_STATE_CAPTURE_GROUP_TYPE_MAX,
>> +};
>> +
>> +struct guc_state_capture_group_header_t {
>> +       u32 owner;
> alan: If i read the the spec correctly, capture_group_header
> also has VFID field at GENMASK(7,0).
To be verified
>> +       u32 info;
>> +#define CAP_GRP_HDR_NUM_CAPTURES GENMASK(7, 0)
>> +#define CAP_GRP_HDR_CAPTURE_TYPE GENMASK(15, 8) /* guc_capture_group_types */
>> +} __packed;
>> +
>> +/* this is the top level structure where an error-capture dump starts */
>> +struct guc_state_capture_group_t {
>> +       struct guc_state_capture_group_header_t grp_header;
>> +       struct guc_state_capture_t capture_entries[];
>> +} __packed;
>> +
>>
> alan:snip
> 
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index 5474025271e3..ffd3171de65d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>
>> @@ -166,6 +167,8 @@ struct guc_mmio_reg {
>>   #define GUC_REGSET_MASKED              BIT(0)
>>   #define GUC_REGSET_MASKED_WITH_VALUE   BIT(2)
>>   #define GUC_REGSET_RESTORE_ONLY                BIT(3)
>> +#define GUC_REGSET_STEERING_GROUP       GENMASK(15, 12)
> alan: I've never noticed this before but i think the spec may have changed since the original work because
> STEERING_GROUP is now 16..12.
> Lets sync offline.
> 
To be verified
> 
> alan:snip
> 
>> +/* Class indecies for capture_class and capture_instance arrays */
>> +enum {
>> +       GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE = 0,
>> +       GUC_CAPTURE_LIST_CLASS_VIDEO = 1,
>> +       GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE = 2,
>> +       GUC_CAPTURE_LIST_CLASS_BLITTER = 3,
>> +       GUC_CAPTURE_LIST_CLASS_GSC_OTHER = 4,
> alan: as mentioned earlier, this is where we need a
> GUC_CAPTURE_LIST_CLASS_MAX = 5.
Will do
>> +};
>> +
>>   /* GuC Additional Data Struct */
> 
> 
