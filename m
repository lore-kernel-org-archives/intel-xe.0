Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65544C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 06:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E843310E14C;
	Wed,  3 Jan 2024 06:40:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A382610E14C
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 06:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704264035; x=1735800035;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E03PNquFG/z4jxWbiDgWvFJgAz3xZWAjNWY/ZKFiJlI=;
 b=VI2fQI7EtU5L0EFO7syjsMaijwRVlVgxZqFKf+D4w/tcRiT8aJSSWTzC
 ScTBBp5OuBUsktOBy0lOvcgLrQbLiA2VhYLZzoOityGSVpa0u+Kkl391k
 ozKj20/d0m/k0ofACPv8mYP1OUGFBgalmtkQW0TN0meQdNA9T4TECEX0U
 RASjrnoo5207wZWlUMjcNN6ztFU3macdNzTye5fU5klIsceJMoXFkD1wC
 deALHGBkCcBc53b3U/qZ/lKWGKa/51LZoDx9oNsOfWsQLDIyfDsh8h+qv
 urddZj0S5G5l6fKv68ZPwUGTrfIxpscjSDqKKbiGtyxWBDxL9gIuzYy+p A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4312937"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4312937"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 22:40:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="1026986869"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="1026986869"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 22:40:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 22:40:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 22:40:34 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 22:40:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9CbV0CsAbGaIz3OGYBAeV+FGGtPQ9KIMdOzn5drMT5Pzdp8TSqEbT3WTEzZXusfNHUmnhW4zxiqkrBiDYVrTItNT1mcD/IFX2JU9fwZLvfrfLHOYw7jPma2mwJ3Dja1b0SD3e6QZRye4CGLUDfTSNinQkOEcVvYXJgmfUnlwJYWqkXTuLnfGYBBJayJ7TTwtO2G0lOToLhz90ih6PrEaEutwgk0hV+SvGIUoPQrB5tvTDUM8/KcMkBA3Ee1uswOxlvOp27r8ZR0qckjB86kM8l68o8jZV+R2GyCJZ//7r5wt7vQ0DBhiGE+glAdg2DNNiTZJTNaIqodyNJMfUTWsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6Guzckuxr9PhrmPJYZGd9xyUAwUayPsOi70A27jAyI=;
 b=brexK0IEdpQjg+nX4SSdAYMD6AKEudwmZwgEs5rnSmRWG4U38aKYq1cT30dqwspoREEoXlv5ULCj1cxTF1n2Xwcv7rdSeZe+PpMAWE1K3PBmmhPTnpiI9SR1Ab29xsR1274KkKLVg2uQPF61hovT5mgKC6Y+nD2LFPHVSNo150aiXPbtRrl4AA/MpVSsH+9aFqy2O5Xz2k2+wddBeJgMXia6CfgxXWA1fexq5WGOI07CoxGTmdvoDqRrL8XIGgxsxbPDIu2RpV63959MsUH4zHU9LqoIWAskpvg+sKu5D4t2quNzKcArCgnsKBP0owzINc0hg3eZ+geDE0E5GiKo9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB6719.namprd11.prod.outlook.com (2603:10b6:a03:478::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 06:40:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 06:40:30 +0000
Message-ID: <a0a6c14b-4eca-40bf-b219-3c5e90c97f04@intel.com>
Date: Wed, 3 Jan 2024 12:10:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/xe/uapi: Add configs for Engine busyness
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231222074602.817518-1-riana.tauro@intel.com>
 <20231222074602.817518-4-riana.tauro@intel.com>
 <4cb7f45b-c742-4bd2-ac96-c950d5d4301b@linux.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <4cb7f45b-c742-4bd2-ac96-c950d5d4301b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc45de0-0104-40d3-f7f1-08dc0c26e107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b7r07APEgfd7VU9XefXVZQbhK7+6fU1jYjmkyoooXLPwbyP6q8adNqEXhMwrZFlTOZej69nJXBl0Z+nA2DEv1pZsatMZoPhYlvX6XfvBM4XHl9ka20g8TwNvSpEwXKNYp/+IOQBA9Cqwi3sJORD30UhhBJQR37Vvz4REKMhzDt2r94rNcoRbjn6cZ7Uu2hvYYJ0Kg6QQSA6nqg6m1wHVKQTlMfPKU+rMJCnfV1ljBJWDeETxqsKyn48RRROUyDXEfC/ef6fSSmoIdS2NeOQ397GPXJwCmEeLhwcqxtoXuQFisp96Q66LGp0ZjgCxm2jTeu0L6CjB3s6+JCPo70/vOoMsl3I2SlwkZuwQEtuFhTJSWRhz41cruKnLToWMbKj2XdtpN/4hlRJJNvgLVFDuBxLQ4iTHaVvbWVqA9rLCg+Y7s5DrSMHe2n+MfnpfpxHEYwpFrwlcBDYyk5ct6Wl/rtcLNFqG5uLOO1Z/XC36FTDsZFL0y3Z55R7GKI3oJybQd7LXY9mQToM32Q52PbQqEtxIJSi77ecZRykfrcjA9ytUcDna9irfvmm2NNcZ+rOYdH6QaNcyVNwmrM89ogDD7yayiu/r0uGW9ftZVDk6O+bJ3mNLLqGaTLuWBa7AZKjAZgZ4CjwLIsscFOU2whPlSbed8TATFix7z439VsFMAGe+p+mWJnulYnbz4dP5bkfGVrtLJMqXaVnvahN8gBVX9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(82960400001)(36756003)(31686004)(31696002)(86362001)(2616005)(26005)(6506007)(53546011)(6512007)(6666004)(478600001)(8676002)(6486002)(316002)(8936002)(66946007)(66556008)(4326008)(66476007)(83380400001)(44832011)(41300700001)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enJJZCt5b1NBd0swdmwwSWQ3cjVpa2REYW9OQ1B6eE96UXU3RG9BUzNPcnRy?=
 =?utf-8?B?cFpTSGpkOHlUajh6SWhnMUh6RHE0b3RNV2tubHFCVWhYdTZ3WjQzcm84dmNM?=
 =?utf-8?B?UUhRaGpYUTZIcEl4WFpKSVVnWlp4NzREVEhNRUhqOEVGM0xBQ2JoeXJnZHg5?=
 =?utf-8?B?SWp5T3ExVGEzbHo0T2hNak9JWEFhL0V1ZkM2Q09GdkRLU282a2t0MTdBSnRq?=
 =?utf-8?B?U1JNclhqaGlVbE1VN1E3Y3MvejBsTFZ5V1ZWbmVDS3J6Mk1MaFdRVXlFdWpM?=
 =?utf-8?B?N3JhM0V5Yy9yQ3k2U2lNR3k1YXpBOHRuendhejk2YzhtLzhvMEduZE0wSkZz?=
 =?utf-8?B?eUlrVFB4TS8yRFpxdDJJQUhWNVhubG5YTSt3S2E1bC9HSnhqYjJseG9VbnRD?=
 =?utf-8?B?VE1tQk5JRDV6SG9tbzl5b1lvQ3EvVENqWkdsUmZhMEM4OWI3ZGkza3hMay9S?=
 =?utf-8?B?SGVWTS9HdFUwWEsrNHFvaExEWDY5d2dnb0h6eXZ2bDNMZ1hsbzczUTVVNk12?=
 =?utf-8?B?NFhEeVMxMDVrS3F2L3RHM0xLT1dGNlhBdFkvTkpQcHVUa2p1U2Y5U2dPVDBa?=
 =?utf-8?B?T0Vlb2c5eU1OVjQzR2x6ejFVeDE3Tk56TDgvczV5ZG1WMHo2UGhhdHJxUFZU?=
 =?utf-8?B?ZmhHWkRwNHhza011R0tpSzlqYisyWHdIZk9PbEtiWFJnemxTVmdZRzBnRnhx?=
 =?utf-8?B?WTRJQWJDN2lnMmNqNy9KMzBiR3BnS0pEbER2a05FQmFka1R1Rm01TWtBWW01?=
 =?utf-8?B?Tm0va1EzZU43azhvWUp4aWV0REhjcDlxMGNLaUVPdEFtR2dkUkhYT0ZGODgv?=
 =?utf-8?B?UUhpbmhiREdhMSttZHdZSnpFYVI2d3VzQjgzQTNFVHlaNFQ5bWlzUXZMcnJj?=
 =?utf-8?B?STljeGhjVWFMODhKVWxjNmZKZmJxWVFHUGNSTTByMSsyT3I1ZkNDdmptcGRY?=
 =?utf-8?B?TlB0OFdWQmR1enp3cUNXWWZiRGxZNm5TbFN6NkxGQmpkVmdBd21zZlBxaUFX?=
 =?utf-8?B?SW1JTzgxb20wMmcxR2hMaFNSZlIyUWFYL0tNSjd2dWl5anN6ODZ3bFhiQk1k?=
 =?utf-8?B?cjBoUDlFb3JqMEtxSWNEZjBHQTRwOVlBRVFaWVJNQXZqQlZicGFpd3hKTUxz?=
 =?utf-8?B?dWFVNm5qQWkvTXYrY1RONVNwNGd0aWZKTi9oRnNtS3NjQVVaZHZ1UE12eVVC?=
 =?utf-8?B?QnE2R3ROVGw2K2JTd2djL0RRclE3SnlkQlFuSGVmVlpVcHJyNm9IekQ4bHM3?=
 =?utf-8?B?MjgrN1RpN3FvNS83Vld3NmNuSkdHWEozM3BueXVrVmNkdU81WnFzbzV4aVRX?=
 =?utf-8?B?YWxBMGFLdFNzVHNEL2Njbyt5V1NhZUNUcG10eFg5c3JRUTRaUjRuVGt2Ukty?=
 =?utf-8?B?cTR5eUFmeXBibWdVRlViT2pjdTJiamIzeUJMUTZoMU90eVZtVHp1b05PVlcw?=
 =?utf-8?B?bjIwTFMzUzhnTERoRzQ0dkNmZHRaUUZCTTd1R25Sb0Y0ZFFta0tHdW8yL0sv?=
 =?utf-8?B?NjRGTzFCYXF5MG9HSUxvUHJmcU5aN2t4N1JFYUNacmlMYzhZZEEwcHg2cXpB?=
 =?utf-8?B?eHJnS3U3UHRKbWRoVnpLajI5RmVTS2VTeFNQTEQxWmxsOWxsOG1sS1ZwbjRI?=
 =?utf-8?B?YnZxdWJtTDJiMFpsdDdLRzFOUGJyM0ZjejJlNzdneXVuTVdwQXJqYjEwOW1x?=
 =?utf-8?B?UWJxR1BrVklSWVRaNmZSTFRMektzSDRKMjc1eGJwZTFnV3lzczJodmJpd0tl?=
 =?utf-8?B?NjYvcGdSbVNyOGZpdk82Nnc0WjdhVGxjY1VtejBiU3dpZG9idXlaZWMwTjlO?=
 =?utf-8?B?VTJRdHc4VUxZRTFnSmxHeDRubFV2M1JQMGhmQTJ6cmZKc0U0MnlHejI4Qy9z?=
 =?utf-8?B?blRWck40bnpqV0RGQmQyd3c2OVUwY1J1QXRSZkhGaGxGNWJwVkU5bHZKTDhL?=
 =?utf-8?B?WE9UZ0RCTWFZRS9jODM2QzlBV0Mrb0ZEWXkyWDc0TVlRMG9Tem5mTnRYWEtC?=
 =?utf-8?B?M0dra3JYVStRS0luazR2UnhpRHAwVVI1OXBhWkRuOFVxZE96S1lmR1RHM1d2?=
 =?utf-8?B?QmxFRGpLUFF6WmJOZmlkM0tHUlVHbGROYjUyL3F3TDIrL0F0NDlIRHdDTU44?=
 =?utf-8?Q?Y9cEAoQ5Rd1Ufm1X8Vh4YM51w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc45de0-0104-40d3-f7f1-08dc0c26e107
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 06:40:30.7038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6MAmHRf5QsxO6whTZLPK5FWG8SlW+zZfJOUWCWn4PvO2Y5Q8ykQ7BaMOzQTXIjDoN2Rw975JLfXQB/9fiES7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6719
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


Hi Aravind

On 1/3/2024 10:56 AM, Aravind Iddamsetty wrote:
> 
> On 12/22/23 13:15, Riana Tauro wrote:
>> GuC provides engine busyness ticks as a 64 bit counter which count
>> as clock ticks.
>>
>> Add configs to the uapi to expose Engine busyness via PMU.
>>
>> v2: add "__" prefix for internal helpers
>>      add a simple helper for application usage (Aravind)
>>
>> v3: rebase
>>      change internal uapi pmu config helpers (Umesh)
>>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 41 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 9fa3ae324731..f8456cda5cda 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1340,6 +1340,47 @@ struct drm_xe_wait_user_fence {
>>   	__u64 reserved[2];
>>   };
>>   
>> +/**
>> + * DOC: XE PMU event config IDs
>> + *
>> + * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
>> + * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>> + * particular event.
>> + *
>> + */
>> +
>> +/**
>> + * enum drm_xe_pmu_engine_sample - Supported PMU engine samples
>> + */
>> +enum drm_xe_pmu_engine_sample {
>> +	/** @DRM_XE_PMU_SAMPLE_BUSY_TICKS: Engine busy ticks */
>> +	DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
>> +};
>> +
>> +/*
>> + * Top bits of every counter are GT id.
>> + */
>> +#define __DRM_XE_PMU_GT_SHIFT (56)
>> +#define __DRM_XE_PMU_SAMPLE_BITS (4)
>> +#define __DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
>> +#define __DRM_XE_PMU_CLASS_SHIFT \
>> +	(__DRM_XE_PMU_SAMPLE_BITS + __DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
>> +
>> +#define __DRM_XE_PMU_GT_EVENT(gt, x) \
>> +	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
>> +
>> +#define __DRM_XE_PMU_ENGINE(class, instance, sample) \
>> +	(((class) << __DRM_XE_PMU_CLASS_SHIFT | \
>> +	(instance) << __DRM_XE_PMU_SAMPLE_BITS | \
>> +	(sample)))
>> +
>> +#define __DRM_XE_PMU_OTHER(gt, x) \
>> +	(__DRM_XE_PMU_GT_EVENT(gt, 0xfffff) + 1 + (x))
> Use __DRM_XE_PMU_ENGINE(0xff, 0xff, 0xf) instead of 0xfffff so that it will be clear
> that it is starting after the engine event.
Previous comments from Umesh suggested to use 0xfffff so changed it from 
rev3.
> 
> But __DRM_XE_PMU_OTHER is not used any where so why to introduce in this patch.
I added it here so that it can be used in the next patch to check if its 
engine event.

Will move total active ticks config also to the same patch so that all 
configs are in one patch.

Thanks
Riana


> 
> Thanks,
> Aravind.
>> +
>> +#define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
>> +	__DRM_XE_PMU_GT_EVENT(gt, __DRM_XE_PMU_ENGINE(class, instance, \
>> +						      DRM_XE_PMU_SAMPLE_BUSY_TICKS))
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
