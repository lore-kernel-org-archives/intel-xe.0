Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCA1C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 07:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CC510E084;
	Wed,  3 Jan 2024 07:06:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A324310E084
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 07:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704265614; x=1735801614;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HP8cgQA+EToCVYKjdhMEs9Zt34OITgaR8OJiD6vYEQw=;
 b=Es8254fuNRgEThdOkYM3ZIvgNVN/7nlOgQoMkT8mcB2NBM0nAfRkDUUo
 8gZv+WYSy+2I3q7zTZHyWJrOI5LRtkObshB+d0q2aG+woxuc1fib57U7d
 7dVpKqIURwnN+8PpjGXSf4IdCJT9+Ku4fyBxdZ7iRdwVgBMFspX26V7jo
 WLOxlWq63BJEA0Gk1ud97TAzWonrr/sS5FCTqmJkiQ9PPjsGOUpkVXo1n
 D17R9g2vOG49Pw1DvpBOYRafQ6FkLqNMcYgyDPpa+vFMknFyKPZFRI/BB
 tGwS3ecfYnBT+fSmjT1p2+jFz0pa6G9cVXCXof0As9wFE6CGLDy0F8n1S Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="15615156"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="15615156"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 23:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="850349028"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="850349028"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 23:06:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 23:06:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 23:06:52 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 23:06:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHiX9SBlaFVOB3T5lzXQtAYx5yyUTZxjeDR+3kXkD0dBVdP6ihqMCAIZihqdAx2kZmi83CP9Xozf2TxlkI80xhGOOO04lvXY974PaFcUpItg4XFiWelEcqNGqIwzGohgywv7LbNeNtTxnxCY2VC8Fp1aPOzYltcu1xpl1NiU1GJM+MxaQEbhyByaJX1xFfog0Qs+Qv6aDeE9VbBu3mPWzI0DzVrIVb3kTB7ZYEm4bBpr2HD5bh4dC31MTruQ+mke7+9Fq4Jy1dh90yANtXj6vc1ipthW8hTWW8nzQnK2drPmQEhCrYvSNBQQGNDjxDet2KlfHuzX9rs+enlFCOGJkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDDrCd6F919Q9JLr6Oi7HM52mnCWfPq6rXS8hGrm9fc=;
 b=kPmwIFu7ZnSXAhwU0oIACD81nd8j46wT6jzjeANuG3WAG7bx3b6Dv9k5nBZlMt3O/3D94RN+SVpk7phi1mB1h1qjikl4BmjGaIrolrIh5HJA2oRulReVdzTDDDmL4WJn42b8qbh/qN6U+CPIw442yLHEyasnElnFCcMISRqsvuAk1vgd3i4aZV6YMWSwVZWBKLZ/MT8wpJXyduffixKvJYM8HcD1W2pQkDmHG1UMvU8zENLnTP/e7xOADnPSuXHEvLafS7fT+dxS9F9tKgsVVu6x9rUBz2Zj2qh1XmJoliHqCuHhJFljurX8+7Jne/5d1a9DuyMuMEb4FD7MpsU97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6780.namprd11.prod.outlook.com (2603:10b6:510:1cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 07:06:49 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 07:06:49 +0000
Message-ID: <b292a5cb-debf-418e-963d-3a3e6facba5e@intel.com>
Date: Wed, 3 Jan 2024 12:36:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/xe/uapi: Add configs for Engine busyness
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231222074602.817518-1-riana.tauro@intel.com>
 <20231222074602.817518-4-riana.tauro@intel.com>
 <4cb7f45b-c742-4bd2-ac96-c950d5d4301b@linux.intel.com>
 <a0a6c14b-4eca-40bf-b219-3c5e90c97f04@intel.com>
 <a7e0d7df-3727-4801-ba2d-35170afc8a1a@linux.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <a7e0d7df-3727-4801-ba2d-35170afc8a1a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 8025ccf4-4104-4f0a-fd27-08dc0c2a8de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NCf+znjsGsyMv5sDuLoLAibB9wwzpJ7G/pCtgOfAaQVUuzS7RcTbpzWYUnZieQAMCc/EF8fPAUUHNhO2sd8YILILN97fabqV688szGGdrwdytGwJ9kk5B6QnwcWqSQmn2GPL38GPjeVHGmOqrYHjYBvT05yhxh0pa+OJk+BMdKhLHoa+cbtOzaq1RZx99AwhPp+WTyiEDxXpGZ+1OXk2idEYbTWEehKl20cpgqAHqcKGD+zqPGLd+3MLJ1+wGenNvcKfxqEVig3RlkcndkZBt3vEVEGKw530sd3EXZ4swsMvKLzd8+n2yW2Y23OQxq8A0s8PRZhB2uajIwElGv3Ansic2UgFt2jYu31+ytsNcFW3w3tl80dY6j0NQrR/Ac4cnDu74Mv0IGPMv4CuZRSNd+0StL4WlBq1v8DJ9uaqnknogOxK/MjtjlfxAJpL3qgmVSnaSbWQLGR/csTqdKfdL5INytFQDz6xVesy42yaqvs4MzdvZBle0ndh6/nY5GlP3oEq4o0TzmV+3ZzequSDqMe78Y3DW4b25GdujVVClzkalpR1Yb6fLDg6RvTmg+XGsYi6XMbEO/u5GFNLDBrDzG9o1tQFhH0yo+llvtyDgQ66544aF4g48aXFazQSjyH1rzWtJbVKhiPEZPAGvJTFMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(346002)(376002)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(2616005)(6666004)(38100700002)(26005)(82960400001)(6486002)(8936002)(83380400001)(44832011)(4326008)(5660300002)(478600001)(2906002)(316002)(8676002)(66946007)(6506007)(66556008)(6512007)(53546011)(66476007)(86362001)(31696002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2lKWUMvbC9VQldWbTFUclQzckIxWGdpaitHNXA3Z0EzWVVtbGJ2VS9hQk5H?=
 =?utf-8?B?K290d2w0ckx3VytmVUxBNVdidUEwWXpFc3IzdHNyWktud3BWT2NMVkdPUTJ4?=
 =?utf-8?B?UWZIUEwwajBLVnE0aHRkVjMwMkNZOHUyMjVzRFlKTk1XNHExOUx0WDc1Ujl5?=
 =?utf-8?B?eCtYL1ZWQ1VnZGE3Y3I2VlFWSVZFS3B0NnZIL3dFc3VUTTlSamRETTJtU0Mr?=
 =?utf-8?B?dTMyY2VxcDAreTJqbmNIdWtWbk9teFV0TWU4K0prZTM2RStZd3hrcXJQb0g2?=
 =?utf-8?B?WjRDTGRFdVFOM294SldSOTFydnI2djRlZ1VzdmtjN09KRDl1WlNqQnpTck0x?=
 =?utf-8?B?NHhkK0RYd3g1SzA1QWlUdE12ckxLL0ozcmFOTU1oU0hJOGQyOFlmK05WcmV1?=
 =?utf-8?B?MTFrditqK0RWV3lsbUVxcWhjempwNE1FR0ZJY05sOEJjOVZhb2xyb1FzTHVN?=
 =?utf-8?B?UzY2MXh2eUpaUHhBN1lFRVVmbVZOdldVbGxKM05idVlZUEt5NGV6c0t5RHVx?=
 =?utf-8?B?SkZyU0VRUVc5RHVqUHJyOUpKckE1Q1VwWmVINWhFS2RzbUtvYjNCMXB5QW9P?=
 =?utf-8?B?YklIVGFnTUhFNkFNbHdtcTdGWVJhV2xkSWV2VnlORDliK0c0WCtkZlpCRk0r?=
 =?utf-8?B?YjZSYkxoZXkvK2wvRGJDWURSamxIaEJUWFdvNFRERFRmY3RBRjRzL0U4R1JC?=
 =?utf-8?B?dEdXSXh5TDVvRzhwY0lWRmNiNlJDQS9TdWpyWXIvQTN4MVg3U2RoMEFOY1lN?=
 =?utf-8?B?RTdGWGVKRllqVXRuZEMzWjE4RGpZOTdqQ1JTWHRTaHF5S3JMbkNUMWVzMmxG?=
 =?utf-8?B?WjBvQ1gxZUpLZHFPdzdQNVdEVFZFSHZ4SWdNbFJSWUtFaWxwTTRqWFB6bkcx?=
 =?utf-8?B?ckJIWWhqVEQ5Rnhza0FhekxoZURGajJEL1dQWHdjRk45cm9ySFhuY3JlQWh0?=
 =?utf-8?B?S2k4bGYvb05hNEt3b2paaHFIbEtsL2JiTmtwQ3plb0xzVmRISzVQcjZINEsy?=
 =?utf-8?B?U2JxY3A2dUxyd2NyVytSNDJIWkh5R2pFWFNOWUtWVjcxaVdBaDFIcHNReVZO?=
 =?utf-8?B?M1JHRW5BMnFuOXJzL2ZBQ1hrYlVWb2pQRkRkTENOSGpPelJYREdwY0E5K0pH?=
 =?utf-8?B?ZEl5eHdxS2JxcmtoRXpGOEdtbHJXb3krRjVXUHZCTXE5bkZCSkY2OXBtMWtI?=
 =?utf-8?B?ZXlGVUs1bmFPR3B6aVlYYmZvSmNlNzJoV1dyYUZRR3djczlvOWs4YXNNZlpJ?=
 =?utf-8?B?andYUlUyV3RmM0E0YUMwUUh2a3VRUW1HSEdjY0E0TU0vdTgxY0pJc1AvdmNj?=
 =?utf-8?B?bWUyVnprNjZSeTBqRk9ESjBhQVk0VHU1Tm0yS1U2U1pPWFVzWkJjajdyY1k1?=
 =?utf-8?B?MGMybUxtQjN3N1I4b2dCS2llV25RQzVnUGtURzhtakpGNDNtQlRwUndLd1hL?=
 =?utf-8?B?L1A5RmpBWFJZWWhWWFhCSkkrMmpnK0VxQ2ZmUFVPeVBGZ2kxbjNFOFZRZ3g3?=
 =?utf-8?B?R0lvengwTzJ5VjFRT0RHczNTMk41c2hSbnJiYW4wK2E3WjhsdkhzWHgyTXhl?=
 =?utf-8?B?b052TElFOGEwRFJPZ1RUek9EQ1BURGsxNktTeXM0WVZWNUQwVDl2K1RvY1ZY?=
 =?utf-8?B?OXdEQmVIZjl5QmtxZURvay9hb1R3NTIvMXFTZ1ZwS3dNaHRlMDI3cEJHa2xG?=
 =?utf-8?B?ZmhUTVFXdHRaOHVDemZUR212bWxXTHhVaE9VYmZjUHVVOWorZVhyUy9zQWM4?=
 =?utf-8?B?UXkyV1RNV29PWituWEU0UlU5eUZSOUgrTVNLcFZsQ1doaGtPSld1K3B4VS9v?=
 =?utf-8?B?b2R5YWRCTnh3cnArQmZuRlpld3EzbUlhVVltbkFoNU1icXB6bjhMTE12dTFz?=
 =?utf-8?B?K2oxVGxWWUkxdlF0a09QNk12Nitsdk9qMkVMOTdoWkdPR3FnNXMvck56VjBt?=
 =?utf-8?B?STlUNHZxc3JiVkErUTErdHRhTDFDSVdicERxUzNnSjBROXZGZENBRjlONjZ5?=
 =?utf-8?B?NERTNlA0UTFoM3l6dFVjdThTNktJWExqRW9vMlRKa2VrM0ZROXVDZjNDS1ZJ?=
 =?utf-8?B?cnR6VUJ0U0dxSTdKQ1FrN0c4ZmY5eU4zVDNlZ3Uxd3NNbnRKcUJIYkpTTkhZ?=
 =?utf-8?Q?+HFX2G9N4QJN6jQ9CseGxTm4H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8025ccf4-4104-4f0a-fd27-08dc0c2a8de7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 07:06:49.2547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juhv+uDhzT6epyt3TYpfv46/NZorjVwnaZu3VygVCXhtJiYUPzg7+9O3JiVAdRWfFr2coUf+cWqk4Z7C00ZGlw==
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



On 1/3/2024 12:32 PM, Aravind Iddamsetty wrote:
> 
> On 1/3/24 12:10, Riana Tauro wrote:
>>
>> Hi Aravind
>>
>> On 1/3/2024 10:56 AM, Aravind Iddamsetty wrote:
>>>
>>> On 12/22/23 13:15, Riana Tauro wrote:
>>>> GuC provides engine busyness ticks as a 64 bit counter which count
>>>> as clock ticks.
>>>>
>>>> Add configs to the uapi to expose Engine busyness via PMU.
>>>>
>>>> v2: add "__" prefix for internal helpers
>>>>       add a simple helper for application usage (Aravind)
>>>>
>>>> v3: rebase
>>>>       change internal uapi pmu config helpers (Umesh)
>>>>
>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>    include/uapi/drm/xe_drm.h | 41 +++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 41 insertions(+)
>>>>
>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>> index 9fa3ae324731..f8456cda5cda 100644
>>>> --- a/include/uapi/drm/xe_drm.h
>>>> +++ b/include/uapi/drm/xe_drm.h
>>>> @@ -1340,6 +1340,47 @@ struct drm_xe_wait_user_fence {
>>>>        __u64 reserved[2];
>>>>    };
>>>>    +/**
>>>> + * DOC: XE PMU event config IDs
>>>> + *
>>>> + * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
>>>> + * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>>>> + * particular event.
>>>> + *
>>>> + */
>>>> +
>>>> +/**
>>>> + * enum drm_xe_pmu_engine_sample - Supported PMU engine samples
>>>> + */
>>>> +enum drm_xe_pmu_engine_sample {
>>>> +    /** @DRM_XE_PMU_SAMPLE_BUSY_TICKS: Engine busy ticks */
>>>> +    DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
>>>> +};
>>>> +
>>>> +/*
>>>> + * Top bits of every counter are GT id.
>>>> + */
>>>> +#define __DRM_XE_PMU_GT_SHIFT (56)
>>>> +#define __DRM_XE_PMU_SAMPLE_BITS (4)
>>>> +#define __DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
>>>> +#define __DRM_XE_PMU_CLASS_SHIFT \
>>>> +    (__DRM_XE_PMU_SAMPLE_BITS + __DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
>>>> +
>>>> +#define __DRM_XE_PMU_GT_EVENT(gt, x) \
>>>> +    (((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
>>>> +
>>>> +#define __DRM_XE_PMU_ENGINE(class, instance, sample) \
>>>> +    (((class) << __DRM_XE_PMU_CLASS_SHIFT | \
>>>> +    (instance) << __DRM_XE_PMU_SAMPLE_BITS | \
>>>> +    (sample)))
>>>> +
>>>> +#define __DRM_XE_PMU_OTHER(gt, x) \
>>>> +    (__DRM_XE_PMU_GT_EVENT(gt, 0xfffff) + 1 + (x))
>>> Use __DRM_XE_PMU_ENGINE(0xff, 0xff, 0xf) instead of 0xfffff so that it will be clear
>>> that it is starting after the engine event.
>> Previous comments from Umesh suggested to use 0xfffff so changed it from rev3.
> looking back at the comment, Umesh corrected it to be 0xfffff, so using as suggested by me above
> looks to be more apt.
Initially Group busyness took the first few configs, so i had added a 
different offset.

Anyway ___DRM_XE_PMU_GT_EVENT(gt, 0xfffff) is same as 
__DRM_XE_PMU_ENGINE_EVENT(0xff, 0xff, 0xf). So will change it as you 
suggested.

>>>
>>> But __DRM_XE_PMU_OTHER is not used any where so why to introduce in this patch.
>> I added it here so that it can be used in the next patch to check if its engine event.
>>
>> Will move total active ticks config also to the same patch so that all configs are in one patch.
> 
> then you should define __DRM_XE_PMU_OTHER where active ticks is being introduced not viceversa.Okay will move it to the total active ticks patch.

Thanks
Riana
> 
> Thanks,
> Aravind.
>>
>> Thanks
>> Riana
>>
>>
>>>
>>> Thanks,
>>> Aravind.
>>>> +
>>>> +#define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
>>>> +    __DRM_XE_PMU_GT_EVENT(gt, __DRM_XE_PMU_ENGINE(class, instance, \
>>>> +                              DRM_XE_PMU_SAMPLE_BUSY_TICKS))
>>>> +
>>>>    #if defined(__cplusplus)
>>>>    }
>>>>    #endif
