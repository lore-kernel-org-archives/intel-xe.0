Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A56C4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 05:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0482F112951;
	Tue,  6 Feb 2024 05:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fyqujnQ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F73112951
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 05:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707198477; x=1738734477;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KHruOkke+9EW023Mp2WehVSqxsSxbMKQZQ8c62FVscQ=;
 b=fyqujnQ/F4riQQF0bESG1ITV16hmdav+sHm0378yJJTt/FZb/4CL11sf
 IFbhcQIEj+BkDU9AwcHSihkcGMO+I3z/zAdsfrMJ/HJunLlLoCTtY2IsV
 FWUGd631FDlmATHXJE0DwdPytpisfIztpawbS3etPlYSeV0BYpxj5cS/g
 KO1L18oQgqlfZCoqWrg/Em7WPiS4h7oSQD4Z7rwCvr9RiXnTeDAY18x3b
 xu9VC4E91YRYeuKmG7aCHBtD3lbdRB7S/kaGAGk5Dad36WnvRvb/laE2z
 SjazHMfbanCz+DALnEJOLIVzhZsjXkL07xxt26NU7oNPLD7m44epOIDFC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="18099340"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="18099340"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 21:47:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="1152327"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2024 21:47:56 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 21:47:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 21:47:54 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 21:47:54 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 21:47:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dH0qnPPCXmt5hxq1XNOWmLnCTsfdUvGI8JHfPL1n4kBADLoRAhlWIl6WLG+R/33ARbAc72KGJYoyccG2+HI1pDoMwXrRPS6F9zfVBHBhCCr1SeriNfmUsbi2E7qEaGoVwtSjwfDojWduCB2ETinA3IXuAi6KkgGJ0HNbeo8WGCvVLnYgAUi3UuqENnZR/2cdvjIf1cGvI4VdggWs66m7E5n/P6jmZiuY5S2pCoR5tjm/Y3e4mjWPLDSHv6wY7492x7P98Eb/co2KzKeO8HjZcKXLMPTcLOVZRbJvFQq1zpnSAR6VRAwaXz12Td6rid3fClHt+OQ33EQmI7Equ7S4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZafmT6BfwP9MrYtKBv2tk/lPpWjXfnjMmMhFoCMQws=;
 b=mew97o+ogIOmnC2SIJ1U3ihcAD9mqw/0XBnB7UiuNqfD4sbFHVHhAJHQsF4D6WrsGeHiDeLtln4yRZBA5ztytGq7BfptsFNmhIFU5Yso6MYaDqYBXIF6Td1wpb5tpqmPdNqS9UdIoslXXksLDyWs76XLE+qXP+ewB0NwjWkbwkKkbyBoBkno+wII5P4zYS0EHniXhOQNlvd9qDoaYBZl1Z/76dd0I90AZ9ulOqRIp5j65Nf47SucQLPrWT16UEkHRTUKVhHDyUJsQvZa2o5gDhru0pgzdP40OtJETmmerZJsusjJRZagCQt79iFyzwYLq69bKnDjzFSM8UhiIdzmdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 BY1PR11MB8077.namprd11.prod.outlook.com (2603:10b6:a03:527::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 05:47:52 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::99f2:1d9d:a07d:2a4d]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::99f2:1d9d:a07d:2a4d%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 05:47:52 +0000
Message-ID: <c6cff625-383b-4297-8863-166674d230f6@intel.com>
Date: Tue, 6 Feb 2024 11:17:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Add label support
Content-Language: en-GB
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>
References: <20240201175846.434392-1-karthik.poosa@intel.com>
 <82a783bb-e0bf-4a96-b993-e1244d353906@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <82a783bb-e0bf-4a96-b993-e1244d353906@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::14) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|BY1PR11MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: 4859502f-4f02-4d79-69c4-08dc26d7288c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ku377y1PLNq3Bh8Gz7bJ5DofmahKj9XyOCBdSneqR3wqutwmIU/o4xUkzkvHgizhNpKRbE3x7nCoRH/56e48Wg1eCZMBvxTZdsJWYbRBmg2viTPG31w3ioOfNHiQgEGL5Fsob1TPg9pJr0O3NKlTVaHfig/sLA//svh3EqzdAvM4XBpGjVpRARZ5ONZDK24xfEDwYpMAfI8uNXEO5sx8+KdiMb7vmmeLhdJS/NFeYfhfQh9mEkbPug//V0PqaXmuGSKw7mmWXghYFEZbF6e4D9oOrm5vpkSHlzppy6kk92FNnNeIJ8TsI3JaMwq7fjv+AjFE+1Xmp+vog7RakKD/lj9MramfN6EqcHVqUJpxrWuOgX3YIRWTUsppmHupHsnWpbuQt0NpMK1YxX+Ax/vylYbqbFtLHguDIpng+fH1iIcO45sN5LQSRyAgc6oIIw1IlyzYwmH06eXxFViUEnrceF2B72xdpIdLhHP20XiLPIoVoet+Z1lS6HbNtQEp3W9Br0/8zNqjrOZwY0qN2jnPYF+XCBO65RTgWWIGai3oAM2KCQKOghnnaFtrgKM//3+tOqXi6jT2pMHmsLbj4Pvy3PSMaAzCxYRuKnFEmfjNWAZ4EZLq5JdIW3xfuwrYAev4XlBqzMHH/gWq1x1Lq0HTSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(31686004)(38100700002)(82960400001)(6506007)(53546011)(6666004)(83380400001)(26005)(86362001)(31696002)(41300700001)(2616005)(107886003)(36756003)(8676002)(6512007)(4326008)(8936002)(478600001)(2906002)(6486002)(5660300002)(316002)(66476007)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YURpdmY3a1RFMktwcVN5NVB5WUVZeTh2Nzg4VUg1SFlJMVg3azBPcTNhcDFR?=
 =?utf-8?B?S05lbVpIRkJ1OFdYV3dhZzBqMWlRY2RnbjNGa2VVNE9walMvQzltWGx2dm9B?=
 =?utf-8?B?VDNuWTI0bXdVZUc2K0RwTUZLWWkzeUhDSFZSU0V2TTl4dHB6eUJqdGtDWm1w?=
 =?utf-8?B?MzB1RHdlbjB4OXZUNlhlYUhSQm1NaVB3THNJY1NCVmRvc0hNMURlWFpXdWla?=
 =?utf-8?B?N2RlcUhTUVVrNGY2VzltLzQ2L0VldmpISWptT29OWXQ0c2l3NEN6dnJqeVVK?=
 =?utf-8?B?NXBrM1lQeGllbm1FbnF2TWFJN09lQWQ2Und2VnpqRitpb0MzVmZlSG4yR2pW?=
 =?utf-8?B?UVlFUVkyeTFyZXhJRFRrRDVnMzhLR3lXZmdKNjhBSU42YnZsVGNtZWVpb0Jt?=
 =?utf-8?B?OU9SajE3ZGt5ekZ6ekNINUIreFdFSmEyUjdDVU5WSW5JU2ZlOWxwbE84a2sx?=
 =?utf-8?B?QUxiSXV4QWNMWjBxSGVmRXgrdXpCSHF2NmF5SFRJWEl2a2FUeUpXV2tTbFFT?=
 =?utf-8?B?L2NLZEdYOSsyU3E5ZTdWaUhyT0xqUERrZkg3M3ZoVXg5V01KVXEyOTEvWUla?=
 =?utf-8?B?cy9DUUUyNUt6SDUzYThMelMxZGFXbURyQUMrS254QjEvR3d3QXNMQXk1QTlQ?=
 =?utf-8?B?WWZqT3BGQnBhY0FiU0d6enQzV2E3bEhVeXB6b3VCbDlrSVIxNU5Pb0Y4TENL?=
 =?utf-8?B?emVDd1d4MW1ZUkNWMHJiM3NoZGQ5S05YTWdDUHRLenVRcDNnWVI2djJScVoz?=
 =?utf-8?B?MDF6VnAyem4xN0U3MlV4cG0vMjU1MHhwYXUvYmxnVGlTVWMvS3RFMENnYUVT?=
 =?utf-8?B?SDdDODNFRGhoUW5CT1NEYnZJR2ZLcEY5MFFtWlh5NlN0UFg3SE8xMUdoN3Fv?=
 =?utf-8?B?WDdxMSt2aTlkaVl1K2ovdmZvWi91WkNoVm96T0JScUowWm16MDhQenVzNXlL?=
 =?utf-8?B?cnI3Y1gxRC83aWFyN1UvdytWMEw3b2R5UWgyZklCUmtlek11MjE1SUJRdGhD?=
 =?utf-8?B?ZXcvUWFmWUNTZW1WVktrSm50cGVrNjB6Mmk4R05mcXJHdWMxSFMyNW94RUE1?=
 =?utf-8?B?cXB0eTBGcFNOWEk3NnoyTElrZ2h6WTQ3RkZJTDkyR0hMWG5udXNKRFFzaWhL?=
 =?utf-8?B?R0krcUdrYXAxVUJUMlBNVUovMjIvclZxQThIOHZOdHBWczhlQlZuU3RFZ0FV?=
 =?utf-8?B?dzNacXpoRkpTajM1ZkEwQmdLNWE0NjNOV1BDdkJpQ0Y0eTZnNUdvVnBCM3pr?=
 =?utf-8?B?L0dOV3R4U2NzV0dHRXYrRGo2YUZRMG9Oc1o2OTNuTWRjQkc5WGxxb25QMUs4?=
 =?utf-8?B?emRCTzVjQWpuR0UrTi9nQTE1bDQrVlo1WmNqUVJOK2RrQ2tJTG1aWHdJVGdm?=
 =?utf-8?B?cnFxZ1NldlU4SjFZbk5tUkI1VmJxMExoTTNIbVZ3RDNZaWpoVlBIWlIrRUF1?=
 =?utf-8?B?L2JhNHQ3cW1NekJ2MFN3TXNROVRiVVNWWThjaVdSa2JMOEo0bW5Bd0xBRjdh?=
 =?utf-8?B?bE05M014bVU3bzc2Y0ZqNGFscWpkcTdOOFRJYTNHdGx1WHFROHRvMGlMaVN2?=
 =?utf-8?B?c0ZWUVB4b3k3bTgvMVFrNWR0dmhyZWVWSjZhVnJxb2NtbGxXcXNaT09hMVJM?=
 =?utf-8?B?TkRLREtzQnNQVUZXbEJ1dkpxMGpmTHJUMWJHWHZ4YVBsdC9pRmlzdktEUVFm?=
 =?utf-8?B?Ry93NC9naWtFaUsxZStrT005RWdXbFN6NEM1aDZhU1pmMndBcXlRWmYwVnpQ?=
 =?utf-8?B?ck1ObXhNZTlmKzVpNkxPdUp1blRieWRHS2tFQ2xTL29SUDJZQnVhdkNXc3Zz?=
 =?utf-8?B?VllXMXFqR1NSZXhheXkwV24yWUUrODd1bjB3VHp6djF2WFhZVmEzaWgrbTJG?=
 =?utf-8?B?NmZEMHdhbzZLZ2hOa0NJd2xETFpuQU5WRmJKSmY4eFFoMkpGcE0yOWlsMDcv?=
 =?utf-8?B?ZVFMZzl0N0REUDRiam9kdVZyaEwyWDFJMWx2OWdzS1UxVWowWFVPWkJMZ3Vx?=
 =?utf-8?B?alRBU2dGQUg1Rk1aZWlNSG9vOTFPbk8rZmp1akZOeVA0Q1FJT1lwbUhYNGVX?=
 =?utf-8?B?OU9FcDBNdUNkZnNGVzE0KzhGblV1M2hZaTIzb0JCd09QUjhvd0pMajlUNUpJ?=
 =?utf-8?B?eERlbnNwZmZOc3kvMkJkSkFKYjlLeXdRQmJEZ1dsZVJibmFuSFAwS2laSWkz?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4859502f-4f02-4d79-69c4-08dc26d7288c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 05:47:52.3938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B47rz3rJj0LILwQLz6Q3ogBWnGpQxDZE22ftfv5/P8LA5t/e2iLjMj7fnKz263Tl8ZWy4rKjeSqB7/7i38jdxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8077
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


On 02-02-2024 17:22, Nilawar, Badal wrote:
>
>
> On 01-02-2024 23:28, Karthik Poosa wrote:
>> Add label for power and energy attributes.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 24 ++++++++++++++++++++++--
>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 89c6f7f84b5a..9fd70bff3435 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -403,10 +403,10 @@ static const struct attribute_group 
>> *hwmon_groups[] = {
>>   };
>>     static const struct hwmon_channel_info * const hwmon_info[] = {
>> -    HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | 
>> HWMON_P_CRIT),
>> +    HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | 
>> HWMON_P_CRIT | HWMON_P_LABEL),
> Is it not possible to expose label for each individual entry?
You mean like power1_max_label, power1_crit_label ?
Nope we can't do that, Each entry can have only 1 label, ex: power1_label.

>>       HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>>       HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>> -    HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>> +    HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL),
>>       NULL
>>   };
>>   @@ -484,6 +484,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon 
>> *hwmon, u32 attr, int chan)
>>       case hwmon_power_crit:
>>           return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
>>               !(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>> +    case hwmon_power_label:
>> +        return 0444;
>>       default:
>>           return 0;
>>       }
>> @@ -584,6 +586,8 @@ xe_hwmon_energy_is_visible(struct xe_hwmon 
>> *hwmon, u32 attr)
>>       switch (attr) {
>>       case hwmon_energy_input:
>>           return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS) ? 
>> 0444 : 0;
>> +    case hwmon_energy_label:
>> +        return 0444;
>>       default:
>>           return 0;
>>       }
>> @@ -691,10 +695,26 @@ xe_hwmon_write(struct device *dev, enum 
>> hwmon_sensor_types type, u32 attr,
>>       return ret;
>>   }
>>   +static int xe_hwmon_read_label(struct device *dev,
>> +                   enum hwmon_sensor_types type,
>> +                   u32 attr, int channel, const char **str)
>> +{
>> +    switch (type) {
>> +    case hwmon_power:
>> +    case hwmon_energy:
>> +        *str = "card";
> This should be package instead of card. You may use 'pkg' here.
Okay.
>
> Regards,
> Badal
>> +        return 0;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +
>>   static const struct hwmon_ops hwmon_ops = {
>>       .is_visible = xe_hwmon_is_visible,
>>       .read = xe_hwmon_read,
>>       .write = xe_hwmon_write,
>> +    .read_string = xe_hwmon_read_label,
>>   };
>>     static const struct hwmon_chip_info hwmon_chip_info = {
