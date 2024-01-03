Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5153C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 07:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986B710E084;
	Wed,  3 Jan 2024 07:09:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC14810E084
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 07:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704265752; x=1735801752;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2BogtL0zIWv95HHvBABzBHa2weiZQ1Rz4QANxgqDHfs=;
 b=K1AY+pF5WiJX2NjKrQF45BnKTc4L5z8BcpFb63R6X0XLfr1D7kSsJvWd
 29h9JciBOJm27fQ05XIddTWshsOgdyMcCz0WcVxlgosPqFBZBq43Z0jdv
 5L0u8ODhgrsUWRga4+3EvbWyqyI9IuHxeBQSp71vWW6LwdD6fkVjlg+U4
 T+nF69ekRNUgk9JENEEyph4pSn0dtZovoUk9gCXNxmMEyvRlZkTW6Epqm
 +uoWKtj0ae1Mk/Bj117WFXNkx3Cg0HKQ10LINERYbwmjt7yEIJDgZRhwg
 ObY1Q8sSvOcCKe+9hAYZObr6o3MCNKhhHNKW2/GLOhD961a23eoXfLvad A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="10363749"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="10363749"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 23:09:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="870484615"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="870484615"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 23:09:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 23:09:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 23:09:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 23:09:10 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 23:09:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0tsnFYsNAIEE3LnLAO8x+ewwZuqILQcvrPDktLQhirQ4/bGiONf+0gok6KfAnmeJaanhRxIDG/ca9p7oEKSCFLBBZwZPM8kkNZ9sDaUxCuLXCwdaikY0x/9Rx12EqvVg928fKYkcPin26ZNNvAQlSBr2FFHEa357r8CHMSp0vyeI4lttlzjZRpYmhO+MLJ9zq6EBx1x5GRxDOaXDAyBJHmVMWwBhJW8lwV77++p5hPvMo/SAsbp/j2axQZK5leSOCGdLfjtQEeHs4XUik8U3ZLY3hAEno2MVjmqrq08O+xxI6fwOy8A7oq2zc98v5/W/DRy38a8nvDB2L3MbhAGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwqTVKx3JPksBcFRXcwNLrwRBUJUzNAPlhOmQ7Jii+s=;
 b=hiC5ONeB3SU7KoOVEj10awOuIaBgJWROwWFVX07MCWjT7EmSwM+XWBSDwuvxqVsTve2y6yKsxxI1i2anqE7UvEPEaVUw4I/ipcSwTq0aiPlWeDIeImTg2OSvXtyZdsnxn4nnWt/gRBae3yc3XNqyimnG9sLu7pUa/TBZ80AnPHdJqWrZuwj7cvln2uVgsWzxZvqggrUs8J7flLGrfe0EVHBnuwOy/E2oB0vGmyWGZ78gagKPLXywTzGweID/HXIqLtNf4cBM7rvgeP3V325i03SKRxfm3bBdMA6fX3g8XxEPZ2lRCVULKg+My2gle/tiyUcHvxeJdotBAyQWXxjDCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6780.namprd11.prod.outlook.com (2603:10b6:510:1cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 07:09:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 07:09:02 +0000
Message-ID: <7e01c802-25e3-418b-92e8-1a44e70e1242@intel.com>
Date: Wed, 3 Jan 2024 12:38:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/xe/uapi: Add configs for Engine busyness
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231222074602.817518-1-riana.tauro@intel.com>
 <20231222074602.817518-4-riana.tauro@intel.com>
 <4cb7f45b-c742-4bd2-ac96-c950d5d4301b@linux.intel.com>
 <a0a6c14b-4eca-40bf-b219-3c5e90c97f04@intel.com>
 <a7e0d7df-3727-4801-ba2d-35170afc8a1a@linux.intel.com>
 <b292a5cb-debf-418e-963d-3a3e6facba5e@intel.com>
In-Reply-To: <b292a5cb-debf-418e-963d-3a3e6facba5e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 804c7626-035a-4d56-19bd-08dc0c2add8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YIrtVEs/HZTSprORU9DHLz40FjEgvqgA2f+BO1yzW900SxsVORQpaB2179wo9/cZ1rVbugilnG0WjDC0SgIPiuDTr1w+zn0u6juWOJLr1GbSwZWZtKEAEF/reO3v23krMzF4GAfw1ZA/UipUEeEg1N39isCy1a8LXjyVoP7nmngQEOn2f86UDZCVFTdTyOahqquftrtNaeUNUJ8r5PQiJucPooWsiad4TwBZO7/he1bOSeK5DvqN3jlwC9WbEefZHrBEqEC2jzdgsdahKxEIUAABEHunwVK7dGrGA3L/8BwJqcKGI+6scYMKalKhmr3vjdav/3Lly0eYUNmNwECnXTVXx0QBI+Lema0ZL4IZof16H1oWBQYlb4YxiJcFNXUkD02Kkr0KoB+Lx5ZFVpVevRV4SAKZEnvPggyPctHeCguXg8JH0/We+jUKefedzBIS8KGmWNlD6ncdnIS629I7lccP0psFrkxO4+fWHAQWV8cEFKSdH5qyiNxMGvPdEk+Mnkm0Z4lHIEoh0VOdayXsBj/8ZZs8icAuo/FL6iXamlDtlF7B6wHAsSUru33EA1p5Irk4GHfSL/ItUlbhbM3ME1XmavFjpq59LoDaM48Cpe2Rg7F28oJGaqlFqLjcOXb4pj5RjOVlMIFquQcOPy9MWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(346002)(376002)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(2616005)(6666004)(38100700002)(26005)(82960400001)(6486002)(8936002)(83380400001)(44832011)(5660300002)(478600001)(2906002)(316002)(8676002)(66946007)(6506007)(66556008)(6512007)(53546011)(66476007)(86362001)(31696002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWZ1Wlo2QlQ5aExzdktCQkJsVThjS2lmMnJtaW1ERUdiNEVKdHhhUGFEd1B3?=
 =?utf-8?B?SkZXclpxc29vY2h6ZzQ2dC8waUQ0VVRvUmZ0VHdFU1RjMUdOTHQzQ2lpNklo?=
 =?utf-8?B?eHhnUWhiQ0pPSnhRdWwycUpKbElUUlE2TnM5K3JCVTdvQmRueWZ5UlUzaTRj?=
 =?utf-8?B?WkNQQldKR3dQV2R5SmVodi9QSGFtS0J4TDJEc0ZMc1VOd2JmQUJ4RWFWYkxH?=
 =?utf-8?B?Wm0wVytFdXBUV1phdHYrUWVEZmVDei9rUmF6eEV6c084QlRGempBNTNoeHlF?=
 =?utf-8?B?bGJMQmkyOWM4SS91end3ZHFma0ZleDViaUs3WUErWHpmbWx4QXFuUTZ4aTJH?=
 =?utf-8?B?SUlBd2Rkb2QyQXdGVjErSjgxdXR6Z0pxTmk1MkZnL1FSa1ZlTktxR1p5UFVY?=
 =?utf-8?B?aWx4aDViVjBkK0hBNHozMzJvckRNOXA3Si8waUJDTEJzY1NjYnY5OWFDMGVh?=
 =?utf-8?B?Nk00ajB6OERiYlBEb29hQXNLMWVjN3kyZ1gxajN0WUxsQXB4K01oUG9KYktl?=
 =?utf-8?B?cEQrT3kwWjRJWDZ3eVBudHpxKzRLWFB1ME9ZaUhvRzZIQ1BZNXFrSXFISnd5?=
 =?utf-8?B?T2dNc3ZlankyNkhqZCtWeFVCOVA2c1MxOFJzUWR0UlJ3Qk82VXgveDdVV0R0?=
 =?utf-8?B?TDBhb2t3QTlIemh5RWpkeURuaWFnT3cxdjZiZ3V3ZzY3akVZOUFBMWxhZ0do?=
 =?utf-8?B?RDg3Q2E1aFQ5YnUrbXd1bmttS2xlWW84M1JVQ3IycFJnRkh2aUN5WC9QVDBS?=
 =?utf-8?B?SDduOXVnWjVUQUZCQlFSeUF0TEFhWU5hNGNIcWJGc0w4elA0bGVhQmlTOTEy?=
 =?utf-8?B?cXRNcTNFcU9BMEkzRTQxUk16S3BLMXZTOTdpQ2xRZnZ5OEJUSXBrdmJRZHpK?=
 =?utf-8?B?cEU2NjJ1OStMcjM4dXVHQkpnT3Q1NjZBays0QWVBSnVuTXhabXVyc3FwWXoz?=
 =?utf-8?B?b0l2TXl5US9ydEp3UTNKKzc5Nmk1ci9RYXhiVzlQZ3ZvYXlaNzRPeU9mSlg2?=
 =?utf-8?B?WVcrRjhHdkE2VHNYanAzRmZlbkdrYng0OG1FTE80UXVqYVpjY2tqMEEwY1dy?=
 =?utf-8?B?aDBjMG9keG9nMlo0dlc5dmk1UTZVUjJINEh2aER1c09OZmRBcDk2eWhxYWtK?=
 =?utf-8?B?eVM3SndRYkZ6MktSRkVyYm43VjhUbFg1ODdMV2JuSTlEemFPUHhSUDZISU1r?=
 =?utf-8?B?M0RmcUFwQUdRYXNpc21GSXlteTFaeVBWVThuZmRhY3FqUVdUSUdteXB6cXZW?=
 =?utf-8?B?ZDJhM285Q21lTzU2ME1LWS9tYWgycTBPczRXcElEM2JPWDY2NGdzOXRlc2Vr?=
 =?utf-8?B?cWh6T0xZZHZTZG5aMnUyQW15VFJYY0xjYUx0aXlZblpqV01pTUMxNW5kdFBm?=
 =?utf-8?B?K1BVVVFwVWtBbHAvb3BRQmgvc0w4ZlNaZzNldXlMUWl6RnE3TnQrSGFmaEpJ?=
 =?utf-8?B?SWZ6VGJucjJsTW5jVjROWXFKUVRKWW84TUtaOUhuRVkyNWxEajluQmY3TWtv?=
 =?utf-8?B?VTRRenlsMkxVNUFGTXlvY2FnWW5mRzlOT2ptUlZieUQxakoxMjBkTG96MDFr?=
 =?utf-8?B?VWQ2TUttWjNJOXR6Z3dOV1dIS2xiRHhzVi9GNFdicDFrNEpQOVFPUW94V3Za?=
 =?utf-8?B?dU5ReEFOV1doVTU3UFBPOTZ5Y21zd0RIRTUxK24xNlpwM2dlbFZpR2ZPbVNw?=
 =?utf-8?B?Ri8rRkRUN1hmbXdweUFwck5IMlU5cWl4dFNFazEyV3ZCdE9yR1gwNG9iY3l6?=
 =?utf-8?B?dmVrQWNYU1krMHJJcEJ6VHdZY1VVYUxoVVh0d04wRTJCY0Q0QUg3WGlVbkJJ?=
 =?utf-8?B?RkhBcjNiOXRhRjFVK2JhREliRlpDLzdYS1FKYjlIaHlSd3J4NWtzWkpxWk9P?=
 =?utf-8?B?cjJldnNkZzVZSjJVNU44QVp3bGluK1ZpclQzS2QyVERmOGZENFpmK05lby9n?=
 =?utf-8?B?STFGZHF1QWhQdkFsUlpCQkRBNFNxbkpqemEyc3lZTTRqOWNDcUxIMzF0SHZp?=
 =?utf-8?B?YndDMFcvRlhwUnZuWUdHQnh4RUlqUHpPYWNUUVRwQnJFYmJBcWNqQjE3c1Zx?=
 =?utf-8?B?U1NFem10UmFPbEZkV1pvWGVZTUZwTEk5bFJ0RmY2TW83L2xjbVhJSVNhcEps?=
 =?utf-8?Q?nPiLIyVjhsFOlx0PVdT2CY48B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 804c7626-035a-4d56-19bd-08dc0c2add8a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 07:09:02.8226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pnNVE7iR3nVlw8FygN5bbWlWvy+hZF6fdCeYWVFWy8URplpMS9KSLLeMwf/HBAJ0VCAAv/NVOpXbLY3dE7gFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6780
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



On 1/3/2024 12:36 PM, Riana Tauro wrote:
> 
> 
> On 1/3/2024 12:32 PM, Aravind Iddamsetty wrote:
>>
>> On 1/3/24 12:10, Riana Tauro wrote:
>>>
>>> Hi Aravind
>>>
>>> On 1/3/2024 10:56 AM, Aravind Iddamsetty wrote:
>>>>
>>>> On 12/22/23 13:15, Riana Tauro wrote:
>>>>> GuC provides engine busyness ticks as a 64 bit counter which count
>>>>> as clock ticks.
>>>>>
>>>>> Add configs to the uapi to expose Engine busyness via PMU.
>>>>>
>>>>> v2: add "__" prefix for internal helpers
>>>>>       add a simple helper for application usage (Aravind)
>>>>>
>>>>> v3: rebase
>>>>>       change internal uapi pmu config helpers (Umesh)
>>>>>
>>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>> ---
>>>>>    include/uapi/drm/xe_drm.h | 41 
>>>>> +++++++++++++++++++++++++++++++++++++++
>>>>>    1 file changed, 41 insertions(+)
>>>>>
>>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>> index 9fa3ae324731..f8456cda5cda 100644
>>>>> --- a/include/uapi/drm/xe_drm.h
>>>>> +++ b/include/uapi/drm/xe_drm.h
>>>>> @@ -1340,6 +1340,47 @@ struct drm_xe_wait_user_fence {
>>>>>        __u64 reserved[2];
>>>>>    };
>>>>>    +/**
>>>>> + * DOC: XE PMU event config IDs
>>>>> + *
>>>>> + * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX 
>>>>> listed in xe_drm.h
>>>>> + * in 'struct perf_event_attr' as part of perf_event_open syscall 
>>>>> to read a
>>>>> + * particular event.
>>>>> + *
>>>>> + */
>>>>> +
>>>>> +/**
>>>>> + * enum drm_xe_pmu_engine_sample - Supported PMU engine samples
>>>>> + */
>>>>> +enum drm_xe_pmu_engine_sample {
>>>>> +    /** @DRM_XE_PMU_SAMPLE_BUSY_TICKS: Engine busy ticks */
>>>>> +    DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
>>>>> +};
>>>>> +
>>>>> +/*
>>>>> + * Top bits of every counter are GT id.
>>>>> + */
>>>>> +#define __DRM_XE_PMU_GT_SHIFT (56)
>>>>> +#define __DRM_XE_PMU_SAMPLE_BITS (4)
>>>>> +#define __DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
>>>>> +#define __DRM_XE_PMU_CLASS_SHIFT \
>>>>> +    (__DRM_XE_PMU_SAMPLE_BITS + __DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
>>>>> +
>>>>> +#define __DRM_XE_PMU_GT_EVENT(gt, x) \
>>>>> +    (((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
>>>>> +
>>>>> +#define __DRM_XE_PMU_ENGINE(class, instance, sample) \
>>>>> +    (((class) << __DRM_XE_PMU_CLASS_SHIFT | \
>>>>> +    (instance) << __DRM_XE_PMU_SAMPLE_BITS | \
>>>>> +    (sample)))
>>>>> +
>>>>> +#define __DRM_XE_PMU_OTHER(gt, x) \
>>>>> +    (__DRM_XE_PMU_GT_EVENT(gt, 0xfffff) + 1 + (x))
>>>> Use __DRM_XE_PMU_ENGINE(0xff, 0xff, 0xf) instead of 0xfffff so that 
>>>> it will be clear
>>>> that it is starting after the engine event.
>>> Previous comments from Umesh suggested to use 0xfffff so changed it 
>>> from rev3.
>> looking back at the comment, Umesh corrected it to be 0xfffff, so 
>> using as suggested by me above
>> looks to be more apt.
> Initially Group busyness took the first few configs, so i had added a 
> different offset.
> 
> Anyway ___DRM_XE_PMU_GT_EVENT(gt, 0xfffff) is same as 
> __DRM_XE_PMU_ENGINE_EVENT(0xff, 0xff, 0xf). So will change it as you 
> suggested.
> 
  0xfffff is same as __DRM_XE_PMU_ENGINE_EVENT(0xff, 0xff, 0xf).
So will add it as

  ___DRM_XE_PMU_GT_EVENT(gt, __DRM_XE_PMU_ENGINE_EVENT(0xff, 0xff, 0xf))

>>>>
>>>> But __DRM_XE_PMU_OTHER is not used any where so why to introduce in 
>>>> this patch.
>>> I added it here so that it can be used in the next patch to check if 
>>> its engine event.
>>>
>>> Will move total active ticks config also to the same patch so that 
>>> all configs are in one patch.
>>
>> then you should define __DRM_XE_PMU_OTHER where active ticks is being 
>> introduced not viceversa.Okay will move it to the total active ticks 
>> patch.
> 
> Thanks
> Riana
>>
>> Thanks,
>> Aravind.
>>>
>>> Thanks
>>> Riana
>>>
>>>
>>>>
>>>> Thanks,
>>>> Aravind.
>>>>> +
>>>>> +#define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
>>>>> +    __DRM_XE_PMU_GT_EVENT(gt, __DRM_XE_PMU_ENGINE(class, instance, \
>>>>> +                              DRM_XE_PMU_SAMPLE_BUSY_TICKS))
>>>>> +
>>>>>    #if defined(__cplusplus)
>>>>>    }
>>>>>    #endif
