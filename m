Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931BEC35274
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 05:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EA710E646;
	Thu, 21 Dec 2023 05:26:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD9E10E646
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 05:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703136394; x=1734672394;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IKquMlY9Dx33PTr5c4CZlMkBLICmu57zoSRz0aKQz6U=;
 b=WmpJwjrNVOA3pKkAutD3hOAbMqxRwZIi46vZaditBwm1bd+tDfY8eilr
 0BqEstSHIdRCJEQIYQtvaWv/HlAgXGOwvrX2OdU/diBmdnEvjpcYje9/G
 aSkEsdsDJqLF8+gy9mgoMK2Qd05496ufPk2xX1IEXi7+1WJySQcGF18Fo
 f2dyZpKUAKUrj7DMSJ6c+G4ujjGv3cCK7f/3yEl5lJYMxXp78t0oNq63D
 G6lCOd4SGorrMMRJc+bih6Kk5CVGKkz3mnDViMEzFMReopOBD7ENPPXIz
 DUJKjel7AVsWFY/vk792T/XjytUptPWAO7Y8cU2VsQdTeUB4etx2FcuuK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="482103572"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="482103572"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 21:26:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="842523113"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="842523113"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 21:26:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 21:26:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 21:26:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 21:26:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 21:26:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PS9bNOWh+fVnWB9Au1vTpETiLWtRtUpR9iwTQZeVbtyrV3a5ygEiZ6smakjQmIsd6vhLWH6QilnUxvxI9qJCtre2GsvPgPf93VYVVtCCtfeavp0yLlBk1t6DGZnT/xo/5QoPmxqI+yltByVP5ntfn6G1yMsP89BFsQ0RqvqsfOSeaSeDKIUJfJnUDZmnMyvxikv/Pk70H5aNoenuVxb+1WjC6/uulsuEJrr/QpuEBoY0yriE/XWqHMKEUL6wIUP4fZFE8vfF6sqWsquyHmC3HJAqAeBvULvZg8bJGj7E5sOa8cXyEmcbYdtLOfaaqoeih/jtHS1djQHh0jrM4mWqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8WIcZ13DV4Lq5GzpuSnbLoTC9oAC2Rgt9NOkpizD8o=;
 b=jJ5jgscpR57ZhhCCy3wpMVjZTYGMD+9ZDveYtzm2bQxI99APoZLyY0MZrQLqf09/kkyranxEo8QGopwknAWqhVTEMXoEUwVfhkKO3bPvZCdUTWw7njg3cBKMe67S4wGPnt05ryDxXIm6UAUjAtvGRDo4LEDOAhbzbHL2rK56AAjIHUuArffL/nCfSxJKEyXI0s9lGdE2XDUXYxZDPtcr3TczU2hsndBYLlZ37qGHn0g/IDvXnQpVkvQD0wR3qvXXNEUeLwdjaXvrZ+Fb8nkbf5347PopnIJ1WwT+tG+tKj++CI1iUaIyQVsgKXsCOsJeJ5S7PnPvYQ/BYiWSCjIeAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL3PR11MB5681.namprd11.prod.outlook.com (2603:10b6:208:33c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 05:26:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 05:26:25 +0000
Message-ID: <0348bb88-8f77-4145-acf1-962892f6b955@intel.com>
Date: Thu, 21 Dec 2023 10:56:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] RFC drm/xe/uapi: Add configs for Engine busyness
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
 <20231207125802.3730165-6-riana.tauro@intel.com>
 <ZYOjDfVEXA0QScsp@unerlige-ril>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZYOjDfVEXA0QScsp@unerlige-ril>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL3PR11MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c728eb-cd4a-46e6-290d-08dc01e56011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: De2kLSzdk0QECRYrcXW1RVKCyJxhfOO7GBM4YE9NM4Nm7TAMHGhqwjKGnf3uY9/fmlB/b1x4zptKqPaIMJhQABJpA9lKdAOaU2jbrIkKvEWv0uzwZxnuypDvaHGHbh+mUOQbWE7MXwqKe0wXPFXVMbu5nbq8U8Y5n8Ay+qPXXTgRCYt/IU8zO+kl9BtQCp6XrLsr770zF64MbEULQNH0b3FO1mr1iqUrVrgpEyuVkclx6D9xrNz/qOv0uXjEMeo1sO7KTzRdbH88fNXESMLuzHJIfCr05kLkf4NgiHTk9NYd7WjgRxk+PR/iQ0is1kTv9gNrnv6Cnlx1Bh1fZCYlt3mgQHHVthQ3Ceyp0zwXm2Q2barJqM4j+DhWgYrnFEEgb+2J4yMAaa7yrSBlCw/c+KxbdoeljEU3fIkjopmGhIu2r8Kc36pX66/hGFyOxEZiddTDRI6T5wmT8bJKYkfsFjkmLaEab2T5BWn1wTX3h3xwfoy/EVJ/khSqQJgHLpLZWWyEaM2Zb2dKLzMdlFW6JbeaNuC9XfPe4/0n+YRNANM1ByJjLKY+KYkq6PVTW60gEnnurFTO3p1vmKa5PIeCsLV9ZtwLBE1J0VDUIvr1o8TQ0fKSQTBr6CwfD2SwFyMm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(366004)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(31686004)(26005)(2616005)(6666004)(6512007)(6506007)(36756003)(86362001)(31696002)(82960400001)(38100700002)(5660300002)(83380400001)(8936002)(8676002)(6862004)(4326008)(41300700001)(44832011)(53546011)(66476007)(66946007)(66556008)(37006003)(6636002)(6486002)(966005)(2906002)(316002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2tCTUR5clRuZGM1eExXVURSQUZtUFpMR1M4cng2ZTRaNytzRDlnUDk3RGtk?=
 =?utf-8?B?eGg4OUJJM1FIY2s1MWd6MnZVNndUT2h3c1BIQ29EY01oNEN3S2NMTzNoOFlx?=
 =?utf-8?B?Z0llWHhZQ1RFblFXWDg4Mm1ZR1NXeXBibms1ZGJxYWNoNU5tRFBqM084WUVS?=
 =?utf-8?B?b3JHek83TUFycjNYYjFIOXhHWEFDT1A5Q2x2UHlIUCtNZThkQy9QVGdpc3RJ?=
 =?utf-8?B?M1NTMTRYSEpIL3pkSE5GWG1MZ0wyWUlRMk1vNTg3TzRqL2E1ZGFjUnVWcEhr?=
 =?utf-8?B?R0ZpSmFXS1ZiQ1c4QWpjRXl3aWJzU2s0bnUzWkszdjNQOFRJRVp6VHkxK0xP?=
 =?utf-8?B?MjlBZkVqNE9TTzVkcDljcEJ5UGdiYWJxdGdrbldMK3EwTUFiSW03bHowZEFE?=
 =?utf-8?B?Z1hZUEp0Vk1lbTJlZXRBVHJMU1FrV3ZjTXdNMGpIb2ptRmZnMlZOWUtRWmw5?=
 =?utf-8?B?Qzg3b2RPemFrNWIya1pmVUxUQlJvdkZTV1FxOHVCc08rNStqZkhzRElsWjRu?=
 =?utf-8?B?ZEZNYWpqeVJhTUwzWVZBc2x0N05LTlRBSE9rMTFvWU5ZbWRwZm5MakJ3RCtq?=
 =?utf-8?B?YTNHamU2dnRUcnJLQUdUMWxBbm12cGtkdFYraTl5Um9XMFk4RUtVVndERXVw?=
 =?utf-8?B?a0RTMVZwU3hWR3kvOE9WNHZRdE43eHN3cFBJSlJtWnBuU3Q3TTFxRGlRVXk0?=
 =?utf-8?B?clMrN2FPckJxS1IwRmNtUDA4clVNb055NTREQlkvLzJTeHpML1BJclhHUitQ?=
 =?utf-8?B?YUwxREJsU0ttbXc3R0xibTFVZFY2VkloYmRINVZ5d3BZWDVreHVCa0VLVzIx?=
 =?utf-8?B?ZlJ2eXJONTZwMm1BelplYmVFV3I1V1F5RVpkOHRqRm9TR2wxdkhQdXl1Z1h5?=
 =?utf-8?B?M1hCTER0WG5HRVVxN1FkU0JIRGtRRDFHd1dTRVQxcythZW9HaHVveTB0WXB0?=
 =?utf-8?B?TUhjcTRid05RMnRtcmZHTUwxSDB0c0JKU0t3ZEptcERlU3dsbmxRYUtITzVG?=
 =?utf-8?B?WDlvT3hlbW5ja3JYVGV5QVZEdGtYU3ArcDBPOS9GSGNIQUI1Vzk3dTdUUnVm?=
 =?utf-8?B?bGQ4NmlzUTVDNC91bDhLbE0xcWM4VEZpblVaQkhQZEtHT1dkMndzOVUxZE9O?=
 =?utf-8?B?WTdLWnhKNU1wTWZYNC9SOXFzYzNBaXdCVTZ1QmQxMzltakx2L2F3S3ZiaEZD?=
 =?utf-8?B?SmlJNjJwV3p6dGt6SjR5QmVwajMrWm9YdDZuY0FsY3F4NzNmazJud1cxYW42?=
 =?utf-8?B?c3ZSNi90cXRMYWM2MHBsMjN5RmVVSjNGaDlYZ3B6c25hZ3FzUjR0RjNicjMr?=
 =?utf-8?B?RXI4UzA1a1BRRy9yYXRtYmREY1N4alhJOEZSdFQ5MlBHNDRueUNSZ2VQaHdh?=
 =?utf-8?B?YjBhRXJLTWp5dGNTRmpMN3JuN3JjOXZNTkpydFdUM25MSnUwV0lvN3JWdHdT?=
 =?utf-8?B?d3BXQVZia2w2L1c5QmJPMXZVbWlpRHhMbVphRnRqUUgvT3ZWdDJlTEZ1aEQr?=
 =?utf-8?B?MlZvQnhkNEZMQ0lxSFNsZUdaVlJOeVBxUGEzcE1pcytaTDdFY3JETXNMMmNO?=
 =?utf-8?B?TjVaT2RSbGc0S0YycDFWZXZZcFJMSG03R1ZHdEpiZXNBY3M0TlJuZEFHYkhY?=
 =?utf-8?B?ZktjK0FMZm0zQlVUVGFaYkFIKzJhdXp4dXlmTURlL1ZnVHNIQ3pteXdTZHd5?=
 =?utf-8?B?dEFTRXIvVHh3aWFhY3V0cmczU2hqTHJWTStpeU90WmE0aVo2L3FXRE9OMC9y?=
 =?utf-8?B?eFVPM2c5NE5GOVhjclhwMEN5OUI3WlVRdjVpN3pmdkcwam1FSVBwUWR2a3pq?=
 =?utf-8?B?UzE4dm82Y2p6d2FPdFZGdVRGTVByTzdYS204bW9EQWFVMVJaM3piNGhCdGw2?=
 =?utf-8?B?MnJjV1JNRld5TlhiRGt3V09NOU9MQU9UNkZtdHIvMnJiWjlVSDVMUlU2bXBC?=
 =?utf-8?B?TGVwMUt5R1pXLzRZdFZ6SHZaK1V5SE5QdERERXB6WWFiT3NtRzY5NlhZLzA2?=
 =?utf-8?B?b2h3VXNvQ2kzZFlPN1VnRkd2ZjVWTXdOUTNxQ253WmxMMnZpYnZ5WFVod1k0?=
 =?utf-8?B?S0FkQ0trMkQvOHpHeGJqN0JacmRhLzVwM0lwMWlRWjRwMDJHb1g4L2c4VzNi?=
 =?utf-8?Q?2kg2zcHMBmjzJOd8mpQY7yFhW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c728eb-cd4a-46e6-290d-08dc01e56011
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 05:26:25.4043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLmXEJxsZ9FFDpfwSKF8P9G5ETn/WMRen58LoDwTl4hKrBEo8l6YzYFdHXmHlQ1CNivrCHXmWfy8FQMVUcIpkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5681
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Umesh

On 12/21/2023 7:59 AM, Umesh Nerlige Ramappa wrote:
> On Thu, Dec 07, 2023 at 06:27:59PM +0530, Riana Tauro wrote:
>> GuC provides engine busyness ticks as a 64 bit counter which count
>> as clock ticks.
>>
>> Add configs to the uapi to expose Engine busyness via PMU.
>>
>> v2: add "__" prefix for internal helpers
>>    add a simple helper for application usage (Aravind)
>>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> include/uapi/drm/xe_drm.h | 23 +++++++++++++++++++++++
>> 1 file changed, 23 insertions(+)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index b5e7a4f673fa..074d63cb79df 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1107,6 +1107,10 @@ struct drm_xe_wait_user_fence {
>>  *    fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>>  */
>>
>> +enum drm_xe_pmu_engine_sample {
>> +    DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
>> +};
>> +
>> /*
>>  * Top bits of every counter are GT id.
>>  */
>> @@ -1115,6 +1119,25 @@ struct drm_xe_wait_user_fence {
>> #define ___DRM_XE_PMU_OTHER(gt, x) \
>>     (((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
>>
>> +#define __DRM_XE_PMU_SAMPLE_BITS (4)
>> +#define __DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
>> +#define __DRM_XE_PMU_CLASS_SHIFT \
>> +    (__DRM_XE_PMU_SAMPLE_BITS + __DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
>> +
>> +/*
>> + * Engine configs offset - 0x1000
>> + */
>> +#define __DRM_XE_PMU_ENGINE_OFFSET(gt) \
>> +    (___DRM_XE_PMU_OTHER(gt, 0xfff) + 1)
> 
> Thinking this should be (___DRM_XE_PMU_OTHER(gt, 0xfffff) + 1) because 
> class is also 8 bits. This part is not any different from i915, so not 
> sure if you intended to change it for XE.
> 
>> +
>> +#define __DRM_XE_PMU_ENGINE(gt, class, instance, sample) \
>> +    (((class) << __DRM_XE_PMU_CLASS_SHIFT | \
>> +    (instance) << __DRM_XE_PMU_SAMPLE_BITS | \
>> +    (sample)) + __DRM_XE_PMU_ENGINE_OFFSET(gt))
> 
> What's the idea here? Engines are limited to a specific GT and the user 
> is also passing in the GT in the config?
Yeah, the engine numbering is same for all GT's. So configs will be same 
if we don't consider the GT. Using GT to create different config ID.

Rev3 has changed the config id's without engine offset as group busyness 
was removed

https://patchwork.freedesktop.org/patch/572085/?series=126919&rev=3
> 
> I think the gt should just be shifted to __DRM_XE_PMU_GT_SHIFT and ORed 
> with the engine counter, more like:
> 
> #define ___DRM_XE_PMU_GT_EVENT(gt, x) \
>      (((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
> 
> 
> #define __DRM_XE_PMU_ENGINE_EVENT(class, instance, sample) \
>      (((class) << __DRM_XE_PMU_CLASS_SHIFT | \
>      (instance) << __DRM_XE_PMU_SAMPLE_BITS | \
>      (sample)))
> 
> #define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
>      ___DRM_XE_PMU_GT_EVENT(gt, __DRM_XE_PMU_ENGINE_EVENT(class, 
> instance, DRM_XE_PMU_SAMPLE_BUSY_TICKS))
> 
> Just an example, naming is up to you.
Will modify this similar to the example.
> 
> For group counters, the logic you have is fine as long as you set class 
> to 8 bits:

Group busyness was added by Aravind but has been removed now from pmu. 
In the next rev will add similar to this for total active ticks

Thanks
Riana

> 
> #define DRM_XE_PMU_RENDER_GROUP_BUSY(gt) \
>      ___DRM_XE_PMU_GT_EVENT(gt, ___DRM_XE_PMU_GT_EVENT(gt, 0xfffff) + 1 
> + 0)
> 
> #define DRM_XE_PMU_COPY_GROUP_BUSY(gt) \
>      ___DRM_XE_PMU_GT_EVENT(gt, ___DRM_XE_PMU_GT_EVENT(gt, 0xfffff) + 1 
> + 1)
> 
> ___DRM_XE_PMU_GT_EVENT(gt, 0xfffff) is same as 
> __DRM_XE_PMU_ENGINE_EVENT(0xff, 0xff, 0xf).
> 
> Thanks,
> Umesh
> 
> 
>> +
>> +#define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
>> +    __DRM_XE_PMU_ENGINE(gt, class, instance, 
>> DRM_XE_PMU_SAMPLE_BUSY_TICKS)
>> +
>> #define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)    ___DRM_XE_PMU_OTHER(gt, 0)
>> #define DRM_XE_PMU_COPY_GROUP_BUSY(gt)        ___DRM_XE_PMU_OTHER(gt, 1)
>> #define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)        ___DRM_XE_PMU_OTHER(gt, 2)
>> -- 
>> 2.40.0
>>
