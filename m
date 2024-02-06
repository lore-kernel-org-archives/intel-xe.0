Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D9DC4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 15:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AD010F487;
	Tue,  6 Feb 2024 15:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSZQG5vE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F6210F487
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 15:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707234061; x=1738770061;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EP2OyJ3v4ozAcVAUOAoGoLYbwxnO09aF7sHU1BFtLVc=;
 b=HSZQG5vEOX3imVQbni+fYWH1LTcgEALlLiiVraIOu81yVaRJ5QSC0OWp
 z3sdK7Z8yg2p4IvZjWLRfJT0oIMsLyazy/2e6zxBhG20EBlKRSb9t42CP
 zgO/DYxxdWZn07bpf+MwS/Bn8OuS3CZOd3GtpCyGYej9udeO6OiIyD0n9
 1AzG24Gw5NSNfLTIz1HiaRBq5gIQI82QfWKGQMVXEATyYpeb5EzHla+uJ
 MgGDR9Nk2LQFgerwfV6oHF2rE1U2ye6D3jRuhueFXkclWcB/pvLUJuBep
 GIXK0RVq8nzzZZx6ZMt6VC/XRIqiTilihCcjDDqRxZiumOwIhukVhUzq3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="922643"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="922643"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 07:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="5655845"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 07:41:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 07:40:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 07:40:59 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 07:40:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPcEZ+GZStHXd5BUlvy3sDxBGFYyf5eTS9gn/wc68T5MBBWjuDdFfzVw4ezDpfmf4XPhT66+wDnqAYeg15ByRAEo1UpKidEmQBOFxFNJGjjgpmUWu9CtdSoyVRVQbFgmsuDZgFTsftJ1OeEXKgkdLoDRDvXPYwNpi2gKulUNYsK5I1euOk+D9E3pkChkrz+RUAKcfX1esNEXqoE5iygQwMOc6IyjxxCagaIKzlpQRvpyd+a/uvRwDpKJj06islWZ2W/JEq69YQOaj+02zsU8FWUNya61r9oNbjp3CXAcsgZbrcmSvek9B13ATO9ReiJA+jKQdSRQkOknuj+WqQq7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBXDci5C0hzeEl605LjxJdlzfOa2AJFTmi0PoJNX6zc=;
 b=lWUBbeP4Z5WClLQz4chLhcXanKDI/9Xd8ffx9Y7YC5OV0a77pEvyxyGcgBZNcGIzc+J94tW+54QSIrDjBJRfFxkOsuYNbMqnLlB4A4pDHkoJdvIcOvxcCibsZJ5xk3Melsj8mLMezypiGgPX+kDwW7fAv+eXev5aGoW45ct5EsgZTXlGkWSEuLsKxfYzT0hGC8Hj3NnuFmeYo5G2HKwXG8Vf6NZr5PVDQBsQ9FgtyRajdF6DyLTDy1K41l4sb3WyNbWUxUwbdfMY2d5uzo7aje4lKXnaA5W6wQM62CHZK/Fm9PnFgPb7/+H5A5M20F92c6c/q1V8ROPf3sPiZMzEEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SJ0PR11MB5815.namprd11.prod.outlook.com (2603:10b6:a03:426::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.36; Tue, 6 Feb 2024 15:40:51 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::99f2:1d9d:a07d:2a4d]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::99f2:1d9d:a07d:2a4d%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 15:40:51 +0000
Message-ID: <18a52c03-6199-4377-a5da-86904261c80e@intel.com>
Date: Tue, 6 Feb 2024 21:10:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Add label support
Content-Language: en-GB
To: Riana Tauro <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>
References: <20240201175846.434392-1-karthik.poosa@intel.com>
 <82a783bb-e0bf-4a96-b993-e1244d353906@intel.com>
 <c6cff625-383b-4297-8863-166674d230f6@intel.com>
 <55a03371-9eb7-441a-af18-459d988bede8@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <55a03371-9eb7-441a-af18-459d988bede8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::8) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|SJ0PR11MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc7775c-1624-4940-a239-08dc2729ff54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dY7kQVwkC4azBKLEVT+3GUm3w7f2mjVDQw7Y4zezcjrd6UNazsgYy352x9rHyMAtPVN/2/D2KeyIyz8c7xLDPkExFHJO551GMQ0iPO+VQGxetkd8YgYvv2+ClwLBdSrJA+Nqq1TaapELQiSwHQURgHmLwkhcFi4PJvi+ANOCPITLtv36LYSeSWtSDiKEc4+XWyra9JxWynQ7zfK8wi7C7Yubzy2E/NEA9bDMCCstPgpwqPlx4MhhQOIC9b8yCEVi5MJEvU8IG9XqR8+lQuj2HljYXykWMMp4JqLZo9BP+zOkRrXhDh2b+c2wPfMfBkbN+F3jYm0es7PJ3rheBsVtix2aZ/JBnm2+w4RUrGW2priRxAHb4FvhyhvWu6opGeUwDTWIRd+ArVxrtxhT55oe9U+/QKEiP8U2//GOV25kfuoI7dK3scGuU8FWfHPcqmGkviiVAPx07yzKQ6YHdHbczf1F8L+UuM0XFqlJeKczabrhtn7dy03amxx42bTjpHPULGpQ2uf7BBrQwTHx6nKkEe8gjhm5mnJiR/W+lgN2hfJV3PBtImVINHQJoyZrK9cMilV3GgEwWzqym4EQPHlqm8/XY4RqYD4BrdCdkYXjOYzzJsKxA2m0+ck5gZhZy0yzfoenbAFRWWi2ZKXs+qtRVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(31686004)(83380400001)(2906002)(38100700002)(82960400001)(41300700001)(26005)(110136005)(66556008)(66476007)(66946007)(316002)(86362001)(8676002)(8936002)(4326008)(31696002)(53546011)(2616005)(6506007)(6512007)(6666004)(478600001)(5660300002)(107886003)(6486002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGpEMUFtZjB6M0xFQzI0QTB6eXBiVVQyN0x3cXRJR3ViWjJ2VUlOVkFSQXgz?=
 =?utf-8?B?VmJ1MmEvWlhEWWpqMmdqNXkxQ0pta2cxelU2WVBkQy9IZStVVStTV1YvWjZU?=
 =?utf-8?B?eDNZYkRTYW9zMTZQK0Z2RDVmNVZpa0c5NHdNRUQwdStOUGxuRHZCL1Y2aVl1?=
 =?utf-8?B?a0lDbnVvK1NSdlFCUENCU1pEVFM2THhncXBhSzA2Y20zUmRaaFBybDZSZG51?=
 =?utf-8?B?dmJxdk0zYUZQY1IwMHBab0xrQTgyNVpIU1JwRitnQXJjdHdYdzMrZS82bTMw?=
 =?utf-8?B?VjAwbjl0VFVzOG1pM1hveGtac3owdWdyV280V0xZOFM0SlowTHZHV2tCa0FJ?=
 =?utf-8?B?cVFXdzA3Nk9VdURrZnZvbzVXTHNDRHhYRFNCY2JIY2I4Y2pVdnBBZ3I2Njk0?=
 =?utf-8?B?K25xNlhHdmhvdGREZllTeXZhdEpJNms0MkhWbXlWV216ZERPTTV5Zlp1SWJQ?=
 =?utf-8?B?b3o5V2FWa1MyL2I0Tk53dlVSL0hOYjVwTTZvU2RibWw3RnVtT2xIRlN0NU9J?=
 =?utf-8?B?Y0VaODc0NkZxRW9YQTNlbVNjYkx6VksvWFpHSCtTaEdXV09hRXk4VmQ5ckZK?=
 =?utf-8?B?d1U5MXdvWTJDM0xGNHVHR1UwQktuS3cvaXlZa1F0ZFQrVm5vaUFPNm9rUEk5?=
 =?utf-8?B?NktrbnJnZVJJeTRZNC9lb1pXMjNiQ1YxMUJ4WjRCRWZpazFHWkdKZTl5M0M5?=
 =?utf-8?B?V1Q1a2JPRnAyYlRwRkxVc1Vyd2MzemdHMXd6b2hjeXJPOW52RmhQWGJMRHd5?=
 =?utf-8?B?L0VrVmJnRUo3Z25YVk5iYk9VUXhzYzVaallIMXBhUGlNZGZwTEUyWXBLSmJv?=
 =?utf-8?B?ajB0Nzg4bnJiUHhXOVIzbEt4SlQrRFlMeEpuKzlKZWY0bTNROERoM0JtWDg2?=
 =?utf-8?B?VVRsR2NxNVZPckR5allRK3lRMTNuZFRrcFlxcVlnREpuMEo1Zi95UjhucnFQ?=
 =?utf-8?B?R1F6L21ncUNXVHBSVE15T2lkZENrbzlSMVpXMHhQQTc2cXkydXdYNVk2SFI3?=
 =?utf-8?B?OGxjVUlhemRIMzhNdDgzalZwblQ3Q0g4Rmo5Vk1wNityN0VCWEcyWU43MlQ3?=
 =?utf-8?B?NjUzckU0c2xlZDNnc3g0TkpyWmFVM2hmakd3Y3NJY2dSbXZaTklwSHdqRGFm?=
 =?utf-8?B?SDhCVlRscmgrZ0c4ejh3aXI5R3NQZytvdFhSaUpVY3Q1RlkvRFIwbmVmQk1l?=
 =?utf-8?B?VTV0WmcvalM3R3VmRHcxYktBT3laVnFEMnlyYzZMQkZKSzBySXlxTlhhYzh4?=
 =?utf-8?B?TnlxL0lHRXFHVUFqS2tkUkZEbEQremJwYndjaHE0MjgvaEhnV0VGTWJCMVlE?=
 =?utf-8?B?U1RobnN2NkFoRjZ5azZhc2k4U1UyR0NLbGNvWHp0WVdpQTM1L0kvWU1DMGpy?=
 =?utf-8?B?Wm1KcjNvMTg1VDYyTXdqZEtURDllSDZuUXBlRlpUbE9MU1ErQ2c5Z0tWeTFt?=
 =?utf-8?B?TWFvZGE0Nk0vRUNrRlNVc1NhOC9iV3Fnc0ZUYnpORUpOM0FtRXprdXZlMGhZ?=
 =?utf-8?B?ZU9iTW1nQ1VQQWtLSjFUZ3pxLzl6T3QzeUJ4K24zU2lCcWdwdjFnY0ZzbVFs?=
 =?utf-8?B?NlBvYnFLUGsrd1ZENjRXaDBSeC9RNDVmeGxZRmhXanBSU2h1T3hwWmNPMzB0?=
 =?utf-8?B?c2RvaFdzdVo2TFdhZ2Q2a2Q2S1VCSVdGbmNDTVNIZGY2aUFLT2h2bmw3ZFQ1?=
 =?utf-8?B?dlYyc0tNZjVzRVd3RlQ5aTR0c3h5NWI3WEUvZkhvMkdIZkdwTVpFTHgrRjJv?=
 =?utf-8?B?b0prdjJhc0ZtWGU5aFRKMU5ib0h3ejhjaUVaWXlvZWk1SDBubXZJU3lOdW5N?=
 =?utf-8?B?eWJmQS8vRXhFaUZmRklRWkx5LzF4SkFnMnBVY0Q2ejUxYkxsTjNCUkZuajIz?=
 =?utf-8?B?ZmlIdjAyektzQkZmekhabmRJUCtVd0hiZ0pPUWJyclNOc3VXV3VTZ2V6bG5X?=
 =?utf-8?B?N0V0L3FCcjdVUktvWktiRmtteE4rVEpTcWNmbE9oN01TMUFRdTFtR1krT25a?=
 =?utf-8?B?YnpYZ2R6dEFoL0kyczNQcUhIZGFZOU85cUd5MDFVRjB3TU5SeW1hRWhWcnB4?=
 =?utf-8?B?U0dGZ0VudnFXVWhsMlBJR1V4WnpSNUlyR2ZNWm1OQk5QL005NjhZZHA1ajRo?=
 =?utf-8?B?dDRIbzFGbGtSd29RVU1ZYnBNZzdHdVVTN2tDcFhUUEluUHhRb1phRzB4ektk?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc7775c-1624-4940-a239-08dc2729ff54
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 15:40:51.4629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGtGQEAMIpYMUmNRwZCyENDnnKehOCtg1KC4SSkPkiP9cdI0TcnhiWasjhMAslAwTfXlE0+gAVSxiL4twqJM3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5815
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


On 06-02-2024 12:43, Riana Tauro wrote:
> Hi Karthik
>
> On 2/6/2024 11:17 AM, Poosa, Karthik wrote:
>>
>> On 02-02-2024 17:22, Nilawar, Badal wrote:
>>>
>>>
>>> On 01-02-2024 23:28, Karthik Poosa wrote:
>>>> Add label for power and energy attributes.
> add why label is added

1. To know if a channel attribute is for pkg or card. This will be 
needed for future platforms.

>>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_hwmon.c | 24 ++++++++++++++++++++++--
>>>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> index 89c6f7f84b5a..9fd70bff3435 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> @@ -403,10 +403,10 @@ static const struct attribute_group 
>>>> *hwmon_groups[] = {
>>>>   };
>>>>     static const struct hwmon_channel_info * const hwmon_info[] = {
>>>> -    HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | 
>>>> HWMON_P_CRIT),
>>>> +    HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | 
>>>> HWMON_P_CRIT | HWMON_P_LABEL),
>>> Is it not possible to expose label for each individual entry?
>> You mean like power1_max_label, power1_crit_label ?
>> Nope we can't do that, Each entry can have only 1 label, ex: 
>> power1_label.
>>
>>>>       HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>>>>       HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>>>> -    HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>>>> +    HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL),
>>>>       NULL
>>>>   };
>>>>   @@ -484,6 +484,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon 
>>>> *hwmon, u32 attr, int chan)
>>>>       case hwmon_power_crit:
>>>>           return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
>>>>               !(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>>>> +    case hwmon_power_label:
>>>> +        return 0444;
>>>>       default:
>>>>           return 0;
>>>>       }
>>>> @@ -584,6 +586,8 @@ xe_hwmon_energy_is_visible(struct xe_hwmon 
>>>> *hwmon, u32 attr)
>>>>       switch (attr) {
>>>>       case hwmon_energy_input:
>>>>           return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS) ? 
>>>> 0444 : 0;
>>>> +    case hwmon_energy_label:
>>>> +        return 0444;
> This should be visible only if any of the energy entries are visible.
> Same for power.
>
> Thanks
> Riana
Seems right. I'll get back on this.
>>>>       default:
>>>>           return 0;
>>>>       }
>>>> @@ -691,10 +695,26 @@ xe_hwmon_write(struct device *dev, enum 
>>>> hwmon_sensor_types type, u32 attr,
>>>>       return ret;
>>>>   }
>>>>   +static int xe_hwmon_read_label(struct device *dev,
>>>> +                   enum hwmon_sensor_types type,
>>>> +                   u32 attr, int channel, const char **str)
>>>> +{
>>>> +    switch (type) {
>>>> +    case hwmon_power:
>>>> +    case hwmon_energy:
>>>> +        *str = "card";
>>> This should be package instead of card. You may use 'pkg' here.
>> Okay.
>>>
>>> Regards,
>>> Badal
>>>> +        return 0;
>>>> +    default:
>>>> +        return -EOPNOTSUPP;
>>>> +    }
>>>> +}
>>>> +
>>>> +
>>>>   static const struct hwmon_ops hwmon_ops = {
>>>>       .is_visible = xe_hwmon_is_visible,
>>>>       .read = xe_hwmon_read,
>>>>       .write = xe_hwmon_write,
>>>> +    .read_string = xe_hwmon_read_label,
>>>>   };
>>>>     static const struct hwmon_chip_info hwmon_chip_info = {
