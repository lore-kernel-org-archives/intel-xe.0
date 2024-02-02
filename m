Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FF1C47DB3
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 11:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADB410E0DF;
	Fri,  2 Feb 2024 11:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9RJ1UGy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0146A10E103
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 11:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706874757; x=1738410757;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AoxUlWQLlb4TY9SebKxXSAholH83qpe0lp1vCBcUumw=;
 b=a9RJ1UGyB41xfRds0sXRRrMYmR4tdqmaGJN5nmfQEELWKjf9tT2Cdzr2
 PvIiZ3lxIjK6XgsR+H33q062VyR1VELjS1q3aYIbDCtri+sSlULdih9WV
 ADcmv2XIUBb2cHhYzCN/HW77vOK4FKbIE9WupqRh8OE3P37gEjPh5a7qk
 gCE+axIN6lf+HLSaIkibwyCUzvFePT3fI0OdxJ9lZfCURIkEYOP6bsHMz
 Zlz9lsrOTh8zUx1qjKKUDMky8zIuq2QddBzrCgitezOXW1ospTIRW1ivB
 8kisITjAUgPtZt2sduoZf3TWpXjtJDHCvk0cdzVnzfNhqgYiBse/dQQEH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="22626906"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="22626906"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 03:52:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="63144"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 03:52:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 03:52:30 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 03:52:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 03:52:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 03:52:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWX59s2LwZt9SUIE+Pmc8QbcEabFWhebnRXvJnU+jcESYog6NUV4Ye97v9DtE57JAdyqOc79zRdr3edTIzG+BnFNrrNwfSXSJtoa7TZbKAA+Zq4yN14tuNkQCye36YWFEbd+n9el3WF6O9u4sOPXPFQ92P5ZsESXGbFBPNIHi67Jn5pbSwJroGKmPfNR2jlmbYvCZ7CkNJLiKtK7iI/S9CesrUgGRPjI1kG2nnLcfMS8Zoxtf9F2lw9cbMDOjhrSe8VICX2E3UhOGiB8L7E8X5WKUdIwsUbEi6ObzDTBS8VvvqeYcSzFQQ215k8aywpw4TR2pFBsRecRVkqvnEKR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72qagTBmbKKXCfvHavP0/MwYVEtwyIx+khpcyGyma/0=;
 b=DoL1YJ6AmU15MzH9jGNQYo299e/2BFWB24+yjXuS0EqRaCrbfMy7K9i/sgi1Gv6viIhDDJGSuzLxGL0Gmk9IMSwhO5UTAJmn+muqqYa5yDFAk8/7xcAbGKnGXlDoxeHkqmVkN7iEJRDeZzBDmufvoaQlcWwZEuZ+xQxVS6AJhd/znSdsWUyuJ0yKXsbnKW2XSkwSBwLnv9IPBxjIHykqMvEJU9H0OgyiWldUkRqcM7C/4cJeHULLwUfMMt6WNrJ9l9x3cFbzSN7v3VmvFcHkBNa07ukT6mlIGkrcvJe+/ALkF7CqMUgLpeuxNmaIdbfPHaPRc0UeSj+Fp8Wah3HBSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Fri, 2 Feb
 2024 11:52:26 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 11:52:26 +0000
Message-ID: <82a783bb-e0bf-4a96-b993-e1244d353906@intel.com>
Date: Fri, 2 Feb 2024 17:22:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Add label support
Content-Language: en-US
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>
References: <20240201175846.434392-1-karthik.poosa@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240201175846.434392-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::20) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CO1PR11MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: af96552b-f41b-446b-2ded-08dc23e56d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PjyDGOv2FvMrN5uifMqqAQ925OuX+U8lEjJpsTilQS1VUUm3gmiUcc8Aw8ai+Op6ox2MWu3C3FAz38oICAyl94N8LoK9QXMpZw6GB62VeGUP0Kga8/VxAtcQIi7ATXiNjgT2wFDMr+N17a3Mi68BYnvJgT2X7K7FSaysLi+0rnMdfOwHrt1CT3eWBVGIlqZtySKvZdcRul6HO/5OAvMZBLfXzUpDLF5yhab3CLygU0iBWji0P9n/ILVW35FTWBx1o/zpaWefd6XV6/s3Q4dVTMZ16gcLITPFDOKU0/DzyOH1JCowYywNlRqMGQBYrPa0pVcCxbOv3gP+ApJK+sD+HF3tVQK8lUvUQbUJ4INQiaLsEtMisdv/6PfLz5RFwWUv7yNehp/qzGSfDKgtsblZ/bHjZbeQLUrt6BWEKsWH7ovCx+aeQqgNB5Bzsxdoe2U4w/MN60CIPv/77GtLPX/UbGmp1uWvQgatDqypAx99zdl+z2PsL4o5eRRqkClya4L2iPCALixsVzonjpQl6TT5ox2qiQ8pJ1M1HMrMIYdZZ0vMIVCvnj9W3r1QjobSX8l9ROgrrY34otQJnL8UwRXj5M6TG1oKUxJ75b3AZSLv8QYn0rOln8ZV7b/cBf3/8LSznlqz9BFKSNwy/N7BQsVYEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(66556008)(4326008)(2906002)(8676002)(8936002)(86362001)(31696002)(5660300002)(66476007)(36756003)(6512007)(83380400001)(316002)(478600001)(82960400001)(66946007)(38100700002)(6506007)(6666004)(6486002)(53546011)(26005)(31686004)(107886003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkhnVGVJeTVyT1k5YVVydHNRQm5IRTBmczMvVTdLTkNqTndwSlRIaXpDRlRU?=
 =?utf-8?B?N0pFczIvem5WaGpYOUlBOGo3SDgwVUM0Zk0rWWd5Q3kyMU1Bd1kveHNrN3l2?=
 =?utf-8?B?d1BTTFRPQVIrOStZc0xZNlVkNGFDUnVwVk1lTWFzRHNrREhqVVNxcG9aNXAy?=
 =?utf-8?B?VmxPeUNFdTlGSXAyNWpFblhxM2lPUjVTVjFnS2M4YWlWL3puSUxwaWN3d3ov?=
 =?utf-8?B?UEd2VXZPVXc1NWg0TWg5N2s4WGtCdW10bitsdWdRVmJMYVpVUEZZcGRnbGFk?=
 =?utf-8?B?U09OQkJ2a0luYWpRMWQvQm1PV3FYYWlpTTdDTDBTRUVLQ2Foek1tUEgxQWFU?=
 =?utf-8?B?a3VsN0ZKQmNQYVJiaWZoQ0FSTVVRVDhWeUpwRi90a3BiVmdQb0N0UmRFVTRh?=
 =?utf-8?B?MjZDanJjN2h2dzY0QnNzcUFLTDNIeVBiK3BkZElBMjI4MGFqeW93UzZOZjdj?=
 =?utf-8?B?d3g2TlpSK2F0ZDE1ekRHNmkvKzZvSXlCZkgzVnU3WnhGd2JzYW1Fd29ycjlO?=
 =?utf-8?B?anZrSmJRMk9NZlh5Y2ZCdUZDZ2ZONkNVeDNvQ0RWTlFiVE9ndXloa0N5QzA2?=
 =?utf-8?B?d2pNUy9XZ3k4VE5EWlRMQ3NDSUJBaE5xQUMxcmVhQ1cxOGI0bHc3T29IUHN3?=
 =?utf-8?B?Q1AzeUNYbUJqSHZybzFvM0hKVVY2TzJDWEYyOFpsZHI2c1M4K28ycXIwSTlB?=
 =?utf-8?B?MCtOZkU4MGxITU5Tay9Hc0RSS3gxeUU2eStxM3FxcU1ycmVaSzAxdlQrTWJL?=
 =?utf-8?B?bCtZYXFYNHU1SjdsRFJPRUhvU0pjQnZtcnduNWFxQVFSU2ZVc2loOWhmU1BP?=
 =?utf-8?B?OGg5UkY4VjdpeFg2bXA0N3BEcGJGVmpkZTRSbWNPSkFlVk84TTM0R25QWGdE?=
 =?utf-8?B?OS95MFpZZzYrYTJLWnBBYmpRMEpqNkx3RzZOWWtjS1JaUU5CUTdaWDlvS24x?=
 =?utf-8?B?YVN4ck4rQkd6VjRGOUsvaHFnY2lWZjFQWTYxVjEzMW9oS0FtY0ZxejF6YVdY?=
 =?utf-8?B?ZGtNckJyNkpnK1E1OVAybFRqME0xaXZlb3pmSk1LazMzZTB5R3lOejRVT2FN?=
 =?utf-8?B?Q245YWdGeHdjazVPS1QyVEhKelJMbER4ckpwZjRHUmVtbmxNa0tOWEtwMGNY?=
 =?utf-8?B?VlQrOEFaZm5tRE42WnN0M3JnV2RVSXNmRXpnTjhUcEsvUk1KanhmeDNTUmtP?=
 =?utf-8?B?ZjBObkhjV2xpN0I5QnY2RFN5Ri80RTlucnQvbXZxZzhUUTJUcmw1bHF5WHBE?=
 =?utf-8?B?Sjh3Rks5ZVgzdE9oYWMvZG9NNnJ1WUFHVVhMejdCNkRPbUVCOXFxREpQbEVy?=
 =?utf-8?B?ZTA0cEc0MGg1Q0FSZURtcGphZWNIQ055enJ3Ukk5UTVKTGFqY0dkOWRtT3pQ?=
 =?utf-8?B?WmdDWHNhTVNUYTFKNXBFcnZNeEFoSkZmT010TU5BUmVxOTdzQXJYbW5FT2Ux?=
 =?utf-8?B?blo2N3dyWUY5Y1dNS015SXpuanJKc1BFWGFxcDJObkhYR3VqQlV5ajhRaFly?=
 =?utf-8?B?SlR1UEVta0wyazJFdXcxZzQ5Ukl5ODdUaHpheThMaThEdVFJNTdUMUFlZkRq?=
 =?utf-8?B?R2Y3ckVQM2U5elUzeHN3ZDhWSlkyMUZ4R3A0UnAxYTVQaVlIaklFM3g1VXR1?=
 =?utf-8?B?eituTmYzbklRUFRZMkRRNGF0M0Rnc3c1WUJPVVlybGJ4Q3ByMWc4VTh3Vk96?=
 =?utf-8?B?elZ2elFnV0hqa0ZhMWhUQ2pRdUlQQ0g3cjJmdms2N1h2Q0JheE5iZnNhZ3Nv?=
 =?utf-8?B?VEhEY1U0V3gweXRPdk4velNBdkY5enNOMGVjZ3dqd01vR2w2VTZCWmpvTVMx?=
 =?utf-8?B?K0FUa1NKWHRRRnpSeDMvbU91a0x5UFg3RVZ2RWJoZkRUN1kreWxaNGJ6SU5p?=
 =?utf-8?B?VGVuOHY2ZC91MTNNNUxpR0VOOXFEL3ZpK1hEYkZZeXRLTG9pV0pmZTFZa2Z3?=
 =?utf-8?B?R3o2eUZ0ZnpKQ2tyalZVSjZ2MVFUYkhzUy90QlBXTnBtb3VWN3hmaGxXVjZr?=
 =?utf-8?B?enFuVldZbzMrcE9YUGNmaG1ObTU1ZDF2cGFKaVkzS0hQUjkrMXlGaFpLVkQ4?=
 =?utf-8?B?MjhTb1dVVUpuVDJ5cmNMNXRoZjVLM3VtczlnZ1huQTN2WXdjMEdzaFZ1alJ0?=
 =?utf-8?B?aDB3bVZKaXBiT2l3UkZhUGZGZVFabGRMZHJ1K0ErNkZHblNLVkVRQlVERHNv?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af96552b-f41b-446b-2ded-08dc23e56d0b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 11:52:26.6868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcuQxy/8U0COZLtkpbrztxDLUUaWTkkbWcNtVrxeslpoaPqckfDQiHDAPpGTKKEjjuS9ldln5ezd32LJj9ik4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
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



On 01-02-2024 23:28, Karthik Poosa wrote:
> Add label for power and energy attributes.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 89c6f7f84b5a..9fd70bff3435 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -403,10 +403,10 @@ static const struct attribute_group *hwmon_groups[] = {
>   };
>   
>   static const struct hwmon_channel_info * const hwmon_info[] = {
> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
Is it not possible to expose label for each individual entry?
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> -	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
> +	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL),
>   	NULL
>   };
>   
> @@ -484,6 +484,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
>   	case hwmon_power_crit:
>   		return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
>   			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +	case hwmon_power_label:
> +		return 0444;
>   	default:
>   		return 0;
>   	}
> @@ -584,6 +586,8 @@ xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr)
>   	switch (attr) {
>   	case hwmon_energy_input:
>   		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS) ? 0444 : 0;
> +	case hwmon_energy_label:
> +		return 0444;
>   	default:
>   		return 0;
>   	}
> @@ -691,10 +695,26 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	return ret;
>   }
>   
> +static int xe_hwmon_read_label(struct device *dev,
> +			       enum hwmon_sensor_types type,
> +			       u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_power:
> +	case hwmon_energy:
> +		*str = "card";
This should be package instead of card. You may use 'pkg' here.

Regards,
Badal
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +
>   static const struct hwmon_ops hwmon_ops = {
>   	.is_visible = xe_hwmon_is_visible,
>   	.read = xe_hwmon_read,
>   	.write = xe_hwmon_write,
> +	.read_string = xe_hwmon_read_label,
>   };
>   
>   static const struct hwmon_chip_info hwmon_chip_info = {
