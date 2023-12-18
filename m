Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110AAC46CD3
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 18:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF29310E2B0;
	Mon, 18 Dec 2023 18:21:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052CD10E2B0
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 18:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702923668; x=1734459668;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/qzA0jJPn1D12C123ouzwvOem8c6QbgzepNfXBZgP1M=;
 b=grf2Uxpc7i/9JqcO5YVdKIl8EuuPnrHy2cokfER3TMNtt7qEoKYVWqPK
 /h1YZuXJK0PiHqHtnQdallOoF+etMxFpF8xRpybf9dxwBOQDhOzdbZysF
 ADdpNP9U2nzJGgoI7Vp0ATHWnjp5xCAzcouZ9o1QpmdeWO05wbfRVSokN
 27f/y6N0CX3GgIyEVamQQsPoP+FMwyYKLlbgaONOh/6bxCKEG3hUiTy25
 +V944EkW7xtyc9G+fZptHGyy2Hc80a2wsVMc7zVGQNNliGJgFazXP0hhu
 nWgcCzENZIN96mgEb2Mac1sEsTs7XZqd/e2+m9m9/sIxlQv94VLAnhBeo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="394331345"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; d="scan'208";a="394331345"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2023 21:30:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="804411048"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; d="scan'208";a="804411048"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2023 21:30:58 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 21:30:58 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 21:30:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Dec 2023 21:30:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Dec 2023 21:30:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTBVZYgbsoUdSRNsok7X38iA36tPE8bdlz+E1k7QcriqqQhGP5xtbZDsViG8jUERklBI/IbCO9vODUEnFu+qhTQf+YY99UEaHtZfQZs0y9vz2NJ9G+LD22YNRWL7HU4lFsFhV/S6Q8D2HgofmYKR1lnNSIAlKS1PvqP8WFUREEZtRzudwQBUoT7JE5wcEPA+DKsug9UOJEuCobAFhjJwSuY2BmJwmieBlq8AiuCdsFyeL2+vfR9FglBuLpBC89DdV2ziW5Exh89ME6PnlNGltJnFrvq0Yex+1wQMdvlUKMsg7zvyOWNJJHWlxPxu/WSPTV1d6clBVSYHK4Y5pob1Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDkiDSJZ2oYau0pjq+2sD9xKBPqmaIcOMeGGUkBrKgY=;
 b=A9F+BUYTn6gOBNuelYUvoLUNEPuBxrkRdcqYfyd3/y/TWgwduasaMHR8j9cHwerm3m+GvWo7c9BC2lj3qnm/iWDJdKRoG/Kd6ahKYlklUftNGlN5ITbvVuJAFaIr50dMmKOd2q3cVw/WueZr+Sl5x4ESTCeTmoIFyvsYhCyMiNEvpVFiWhaQcZUAtM/XlbAUo6s6boR2aoo1EKZtqrjQ/R2Qr8F6k8WXsrp1pYZTHBQYUDSrJGrOrBhP39/eKKRbJBb1KOFTm9offn7S9xFRO+DZ8LMz7EMp9dMhVgIlss2BTIUt15nOpjmY3rv1DWYx5d9Ct4n73WRtGBwR+sbT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 05:30:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 05:30:51 +0000
Message-ID: <d33afe40-4ef4-4499-bab3-f62f00a38078@intel.com>
Date: Mon, 18 Dec 2023 11:00:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] drm/xe/pmu: Remove PMU from Xe till uapi is
 finalized
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231214113144.251726-1-riana.tauro@intel.com>
 <20231214113144.251726-2-riana.tauro@intel.com>
 <f69c89e2-1bac-41c1-84ae-b9e614261585@linux.intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <f69c89e2-1bac-41c1-84ae-b9e614261585@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: c53ca47b-2849-4088-8268-08dbff8a7f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AUUt7Ht/BdPYqatdAoUs4HCe5CbVaPhTvu3PnnkAr1/blwytyGnQSyCLQgdpxNkx445V7l6x1aP+Kf1HypkC709cqGMA5ZfVQ89T4GJ5hheLYAK8LsiCeUOHtA1CmlT8bhHJIthT1R5G7hoy/TtVdIzK9LO5clcWz7iv+DuQXjU3dXfas3Obaj05cyYLnPeIfNycSvk//5wlvy1regjtE2n/BNyScFK7Kacg74m33uoA7N5onYCyXaIhWyhTCDf5CoLbdlIIYDuPyzzKhXErjoku4hpfSx9OjR096jK8YV9qIol5G5EgKkUDC/A5oJyK9dgb7NwwQZiAv75s1xp5xKC/I2rwotlDMjFqHExIc/DL+tkMD1c1v5jDqbQJWhfY3iS87CcSJZg4vu9CE8ok39eU0YK/hMdYhc3AIFOqZqLMv0oAsrwb6dtzJQmCDgkqKKxY28BF2WIAgfNVf0oJPWikltUuzDTLaR1ETM/v4YcXjx3CNa26YLBco5eQSTRUgcuWBFOxrI7ujnL+SKU5wK0fQ1JckpenzEPLUehYUsSmFvm3CnwPWV+zSSoJ0wMHhQMKeSZI9AP3jaZfWb8JKoIWsmgdk6sIJoJ1Ef+55IOe0qQO4cJJQ/fSmg6N1zKj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(31686004)(5660300002)(38100700002)(30864003)(86362001)(31696002)(2906002)(2616005)(26005)(83380400001)(6506007)(82960400001)(53546011)(6512007)(6666004)(316002)(66556008)(66476007)(966005)(6486002)(36756003)(41300700001)(44832011)(478600001)(66946007)(4326008)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak5pMmFFQnJ4U3FYSTBYdFdxeGdzbEl4TFh4ODUvcEpkOGdKN3JicjZ2U2d0?=
 =?utf-8?B?UkFBMEtUN0k5SU94UFRHNlZLVHNwVjBaSm5mYWR1Yk1La3RvY2lLd3V5UytM?=
 =?utf-8?B?aXFtTkk1eU5VTnlPalRIZWRGSEh3TjlMajZGbWpVTjBndU1tZWNkV2cvbUZk?=
 =?utf-8?B?a0ZtYzB3RTM2b3dPc2l3eDlsQUF0dkxHYmxDM0lwanhJa1BtMk85bTJkV1B2?=
 =?utf-8?B?d2JXaEhHYWs2M3dIZzBTUFVwdFEyMytiNnpXM2drcDZXSnpXRDU3T056cW9K?=
 =?utf-8?B?V3dtclNHL3dYK2JVbUdpRnB1LzdGb1FkeXljUGRTY3R1b1k4QVVJdnExZm5z?=
 =?utf-8?B?dUhvWmNrWEVWNVg5SzYzUzRHeFJqVkdGZ0pFMUx2QXgrMVYwV2JVUzFxellB?=
 =?utf-8?B?bWpTUlV6L29iVDFRcFF3RmdrMWF4UHkvTTFPaGdPdDJBVGx2OEJFbmJlUjh3?=
 =?utf-8?B?S2VqMzE3d0JxV1k3UHQ1R2Z0U2RZWjVuWGFsbXFKakZGVGtXZUdkUjhHeDBp?=
 =?utf-8?B?d3lZQS9sMU1MZ0lwdGxlZlVYMzNnUWk3ZzlpdHNhTUNzaWJUQlRzTWtnL0lU?=
 =?utf-8?B?Y20zdHBXRU5WUlhGZjlnNVJORFVQNlU2OTZ1UXE0M2lGR3d2dWFESGM0ZzVa?=
 =?utf-8?B?WGJZS0xXTjgzeDgzUmJNY0NRcnBLdmh1cVBSRG1LdDFCeVNBYlhqREJYaG9n?=
 =?utf-8?B?Z29VSHdsOHhycmJyZVlUVjhWeFNpNG5DTXFRdXd3eUIrTHpTWll0NDI0VFBj?=
 =?utf-8?B?NThnS0NDalMvMGQ4OHRGY2RDdnQreXdqUlg0VkNkZmxnUmQzZWVaYWNKZWVI?=
 =?utf-8?B?aXhPVTBLWlA1ZkgrcytCZ3dkSzVnek9IWW9UYzBTSjBEWitsYmRVMGZrc2Fz?=
 =?utf-8?B?L2VuelJHSzdXbFJpR3FnaEJCRkYwOHJGZkJqWDJZeTBhK09NdHZkZnllT2J0?=
 =?utf-8?B?dFdDanduQ0xFaTdyY2FIR3haZkNDSnNOYXJTU2hncExYZStBQTdZeFpGcWZ0?=
 =?utf-8?B?RXdUaEtKQnUzMGxjWHJubkxZNTltNUtSUlNoaEZINkVRVXBmWStlM1YxcVYv?=
 =?utf-8?B?RS9LRFlJM2RjUTZFQmgvd1QrandFT3dGbHZ3Q2g0QlVUd25JZTVOZkp5dXRl?=
 =?utf-8?B?TVFIcHZMTzU0VVBmeU5YSlFWVmRyVlFqN0ptdEFucU9KeWpwR21hTms4YXJu?=
 =?utf-8?B?eXBQaUZoSElqdEpTQlorMWhhUFU2cHl6Mm9ZdlBnbVFpN3hqNFg1VXJkWHFF?=
 =?utf-8?B?amxkN3dwNmw4c1FqeVNRVkJMQ3FRV2hBUHdURUZ2ZVdxbUtwUjBtUkxFZFIx?=
 =?utf-8?B?ZzQ3bjNDcjhDMXlHZUhuSnV4R21QNm95OE1tallObGdhVkZtdnA2UGZnMndZ?=
 =?utf-8?B?OWpVekwrVjhJa2NFRWdzR0pHSTQ3OFd0bklVY1lZYUxTSnhkeUxHN1l6V0F0?=
 =?utf-8?B?UGtRU1o0dU1VeGtLL3IyWWgvcVVkWW9Ra1BVU0pCdE5CYWcxaktpOFA1RkhI?=
 =?utf-8?B?V1pibTRRekhBN3RyVzRHTURjbkNwM3JvS24yQ01wbjBtOTZOZnFwRHdzMGVM?=
 =?utf-8?B?UTJyQm9TUFJRUC8yNSthNHdnNGs4VmpoRnQ4WjFGY1o4cXFWekVPSEJYSk95?=
 =?utf-8?B?cjVlci9MNnlwcjFEVnRmcmM0Mm1scDdqTjhOaEVCUzVMOVBNa3d6TDFqdGxK?=
 =?utf-8?B?cDJSeS9aN0VFN2cyV1Y0dGdaUWtOb0hqdVE5TnloM1M2R3hleUltU3JMYmdw?=
 =?utf-8?B?QU5OeFN5Q1JKK2hKOTlFdHI0dXY3VEpHTm1NTXVxbjkvN3ZnZFFicldOSE11?=
 =?utf-8?B?cnlVdXpjMlJheEVpbXBtckdVRC84eEpIdWFyVHMzZm5lM3BQMUhDYWZEL1JE?=
 =?utf-8?B?SEdWVU5CT3NsUjVheVd1VUVPQTZCZlkzcTg2UkY4Z2xNNVltK05wbjlBNWp6?=
 =?utf-8?B?VWVHUXZFNVAxRmo1R0xpRUhrOG4zMlcrNXZKNk5sczR5dllNZWFvL2JBdy9V?=
 =?utf-8?B?UnZ1WlZTQUlFM0FzNGlRQkdnTUJjT0VLU0h1WjVkdUh0cXBncUUwSVBuVlpK?=
 =?utf-8?B?blNBb2t6WktsUFVpRUd3WTlJT0llUXlEaEV4bUE2RCtTckozRVFiVDZWQTBm?=
 =?utf-8?Q?pE0hzLllJeD0tD/8EXeJ6bxib?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c53ca47b-2849-4088-8268-08dbff8a7f1e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 05:30:51.1992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1CcL3R34WKhyHk5Kzcj8yiuvYYqlSKAwnNmFhOkPqlUU3JjfF39TYNFfUCNfM67wANBLK8AL6zfAwOJshD46g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
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



On 12/15/2023 9:21 AM, Aravind Iddamsetty wrote:
> 
> On 12/14/23 17:01, Riana Tauro wrote:
> 
> Hi Riana,
> 
> If you are adding back pmu infra in a later patch then you better just remove
> the group engine events and drop this patch.
> 
> Thanks,
> Aravind.
Hi Aravind

I added this patch only for compilation as this 
https://patchwork.freedesktop.org/series/127664/ is in the process
of getting pushed.

Wanted to rebase patches with the removal patch.

Thanks
Riana
>> From: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>
>> PMU uapi is likely to change in the future. Till the uapi is finalized,
>> remove PMU from Xe. PMU can be re-added after uapi is finalized.
>>
>> v2: Include xe_drm.h in xe/tests/xe_dma_buf.c (Francois)
>>
>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Acked-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |   2 -
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 -
>>   drivers/gpu/drm/xe/xe_device.c       |   2 -
>>   drivers/gpu/drm/xe/xe_device_types.h |   4 -
>>   drivers/gpu/drm/xe/xe_gt.c           |   2 -
>>   drivers/gpu/drm/xe/xe_module.c       |   5 -
>>   drivers/gpu/drm/xe/xe_pmu.c          | 645 ---------------------------
>>   drivers/gpu/drm/xe/xe_pmu.h          |  25 --
>>   drivers/gpu/drm/xe/xe_pmu_types.h    |  68 ---
>>   include/uapi/drm/xe_drm.h            |  40 --
>>   10 files changed, 798 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>>   delete mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>>   delete mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index f4ae063a7005..b0cb6a9a390e 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -267,8 +267,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>   	i915-display/skl_universal_plane.o \
>>   	i915-display/skl_watermark.o
>>   
>> -xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>> -
>>   ifeq ($(CONFIG_ACPI),y)
>>   	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>   		i915-display/intel_acpi.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index f5bf4c6d1761..3c3977c388f5 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -333,11 +333,6 @@
>>   #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>>   #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>>   
>> -#define XE_OAG_RC0_ANY_ENGINE_BUSY_FREE		XE_REG(0xdb80)
>> -#define XE_OAG_ANY_MEDIA_FF_BUSY_FREE		XE_REG(0xdba0)
>> -#define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
>> -#define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
>> -
>>   #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
>>   #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 221e87584352..d9ae77fe7382 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -529,8 +529,6 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   	xe_debugfs_register(xe);
>>   
>> -	xe_pmu_register(&xe->pmu);
>> -
>>   	xe_hwmon_register(xe);
>>   
>>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index d1a48456e9a3..c45ef17b3473 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -18,7 +18,6 @@
>>   #include "xe_lmtt_types.h"
>>   #include "xe_platform_types.h"
>>   #include "xe_pt_types.h"
>> -#include "xe_pmu.h"
>>   #include "xe_sriov_types.h"
>>   #include "xe_step_types.h"
>>   
>> @@ -427,9 +426,6 @@ struct xe_device {
>>   	 */
>>   	struct task_struct *pm_callback_task;
>>   
>> -	/** @pmu: performance monitoring unit */
>> -	struct xe_pmu pmu;
>> -
>>   	/** @hwmon: hwmon subsystem integration */
>>   	struct xe_hwmon *hwmon;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index dfd9cf01a5d5..f5d18e98f8b6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -709,8 +709,6 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_msg;
>>   
>> -	xe_pmu_suspend(gt);
>> -
>>   	err = xe_uc_suspend(&gt->uc);
>>   	if (err)
>>   		goto err_force_wake;
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 51bf69b7ab22..110b69864656 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -11,7 +11,6 @@
>>   #include "xe_drv.h"
>>   #include "xe_hw_fence.h"
>>   #include "xe_pci.h"
>> -#include "xe_pmu.h"
>>   #include "xe_sched_job.h"
>>   
>>   struct xe_modparam xe_modparam = {
>> @@ -63,10 +62,6 @@ static const struct init_funcs init_funcs[] = {
>>   		.init = xe_sched_job_module_init,
>>   		.exit = xe_sched_job_module_exit,
>>   	},
>> -	{
>> -		.init = xe_pmu_init,
>> -		.exit = xe_pmu_exit,
>> -	},
>>   	{
>>   		.init = xe_register_pci_driver,
>>   		.exit = xe_unregister_pci_driver,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> deleted file mode 100644
>> index 9d0b7887cfc4..000000000000
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ /dev/null
>> @@ -1,645 +0,0 @@
>> -// SPDX-License-Identifier: MIT
>> -/*
>> - * Copyright © 2023 Intel Corporation
>> - */
>> -
>> -#include <drm/drm_drv.h>
>> -#include <drm/drm_managed.h>
>> -#include <drm/xe_drm.h>
>> -
>> -#include "regs/xe_gt_regs.h"
>> -#include "xe_device.h"
>> -#include "xe_gt_clock.h"
>> -#include "xe_mmio.h"
>> -
>> -static cpumask_t xe_pmu_cpumask;
>> -static unsigned int xe_pmu_target_cpu = -1;
>> -
>> -static unsigned int config_gt_id(const u64 config)
>> -{
>> -	return config >> __DRM_XE_PMU_GT_SHIFT;
>> -}
>> -
>> -static u64 config_counter(const u64 config)
>> -{
>> -	return config & ~(~0ULL << __DRM_XE_PMU_GT_SHIFT);
>> -}
>> -
>> -static void xe_pmu_event_destroy(struct perf_event *event)
>> -{
>> -	struct xe_device *xe =
>> -		container_of(event->pmu, typeof(*xe), pmu.base);
>> -
>> -	drm_WARN_ON(&xe->drm, event->parent);
>> -
>> -	drm_dev_put(&xe->drm);
>> -}
>> -
>> -static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>> -{
>> -	u64 val;
>> -
>> -	switch (sample_type) {
>> -	case __XE_SAMPLE_RENDER_GROUP_BUSY:
>> -		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>> -		break;
>> -	case __XE_SAMPLE_COPY_GROUP_BUSY:
>> -		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>> -		break;
>> -	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>> -		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>> -		break;
>> -	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>> -		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>> -		break;
>> -	default:
>> -		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> -	}
>> -
>> -	return xe_gt_clock_cycles_to_ns(gt, val * 16);
>> -}
>> -
>> -static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>> -{
>> -	int sample_type = config_counter(config);
>> -	const unsigned int gt_id = gt->info.id;
>> -	struct xe_device *xe = gt->tile->xe;
>> -	struct xe_pmu *pmu = &xe->pmu;
>> -	unsigned long flags;
>> -	bool device_awake;
>> -	u64 val;
>> -
>> -	device_awake = xe_device_mem_access_get_if_ongoing(xe);
>> -	if (device_awake) {
>> -		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> -		val = __engine_group_busyness_read(gt, sample_type);
>> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> -		xe_device_mem_access_put(xe);
>> -	}
>> -
>> -	spin_lock_irqsave(&pmu->lock, flags);
>> -
>> -	if (device_awake)
>> -		pmu->sample[gt_id][sample_type] = val;
>> -	else
>> -		val = pmu->sample[gt_id][sample_type];
>> -
>> -	spin_unlock_irqrestore(&pmu->lock, flags);
>> -
>> -	return val;
>> -}
>> -
>> -static void engine_group_busyness_store(struct xe_gt *gt)
>> -{
>> -	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>> -	unsigned int gt_id = gt->info.id;
>> -	unsigned long flags;
>> -	int i;
>> -
>> -	spin_lock_irqsave(&pmu->lock, flags);
>> -
>> -	for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++)
>> -		pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
>> -
>> -	spin_unlock_irqrestore(&pmu->lock, flags);
>> -}
>> -
>> -static int
>> -config_status(struct xe_device *xe, u64 config)
>> -{
>> -	unsigned int gt_id = config_gt_id(config);
>> -	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> -
>> -	if (gt_id >= XE_PMU_MAX_GT)
>> -		return -ENOENT;
>> -
>> -	switch (config_counter(config)) {
>> -	case DRM_XE_PMU_RENDER_GROUP_BUSY(0):
>> -	case DRM_XE_PMU_COPY_GROUP_BUSY(0):
>> -	case DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> -		if (gt->info.type == XE_GT_TYPE_MEDIA)
>> -			return -ENOENT;
>> -		break;
>> -	case DRM_XE_PMU_MEDIA_GROUP_BUSY(0):
>> -		if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
>> -			return -ENOENT;
>> -		break;
>> -	default:
>> -		return -ENOENT;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>> -static int xe_pmu_event_init(struct perf_event *event)
>> -{
>> -	struct xe_device *xe =
>> -		container_of(event->pmu, typeof(*xe), pmu.base);
>> -	struct xe_pmu *pmu = &xe->pmu;
>> -	int ret;
>> -
>> -	if (pmu->closed)
>> -		return -ENODEV;
>> -
>> -	if (event->attr.type != event->pmu->type)
>> -		return -ENOENT;
>> -
>> -	/* unsupported modes and filters */
>> -	if (event->attr.sample_period) /* no sampling */
>> -		return -EINVAL;
>> -
>> -	if (has_branch_stack(event))
>> -		return -EOPNOTSUPP;
>> -
>> -	if (event->cpu < 0)
>> -		return -EINVAL;
>> -
>> -	/* only allow running on one cpu at a time */
>> -	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>> -		return -EINVAL;
>> -
>> -	ret = config_status(xe, event->attr.config);
>> -	if (ret)
>> -		return ret;
>> -
>> -	if (!event->parent) {
>> -		drm_dev_get(&xe->drm);
>> -		event->destroy = xe_pmu_event_destroy;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>> -static u64 __xe_pmu_event_read(struct perf_event *event)
>> -{
>> -	struct xe_device *xe =
>> -		container_of(event->pmu, typeof(*xe), pmu.base);
>> -	const unsigned int gt_id = config_gt_id(event->attr.config);
>> -	const u64 config = event->attr.config;
>> -	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> -	u64 val;
>> -
>> -	switch (config_counter(config)) {
>> -	case DRM_XE_PMU_RENDER_GROUP_BUSY(0):
>> -	case DRM_XE_PMU_COPY_GROUP_BUSY(0):
>> -	case DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> -	case DRM_XE_PMU_MEDIA_GROUP_BUSY(0):
>> -		val = engine_group_busyness_read(gt, config);
>> -		break;
>> -	default:
>> -		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> -	}
>> -
>> -	return val;
>> -}
>> -
>> -static void xe_pmu_event_read(struct perf_event *event)
>> -{
>> -	struct xe_device *xe =
>> -		container_of(event->pmu, typeof(*xe), pmu.base);
>> -	struct hw_perf_event *hwc = &event->hw;
>> -	struct xe_pmu *pmu = &xe->pmu;
>> -	u64 prev, new;
>> -
>> -	if (pmu->closed) {
>> -		event->hw.state = PERF_HES_STOPPED;
>> -		return;
>> -	}
>> -again:
>> -	prev = local64_read(&hwc->prev_count);
>> -	new = __xe_pmu_event_read(event);
>> -
>> -	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>> -		goto again;
>> -
>> -	local64_add(new - prev, &event->count);
>> -}
>> -
>> -static void xe_pmu_enable(struct perf_event *event)
>> -{
>> -	/*
>> -	 * Store the current counter value so we can report the correct delta
>> -	 * for all listeners. Even when the event was already enabled and has
>> -	 * an existing non-zero value.
>> -	 */
>> -	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>> -}
>> -
>> -static void xe_pmu_event_start(struct perf_event *event, int flags)
>> -{
>> -	struct xe_device *xe =
>> -		container_of(event->pmu, typeof(*xe), pmu.base);
>> -	struct xe_pmu *pmu = &xe->pmu;
>> -
>> -	if (pmu->closed)
>> -		return;
>> -
>> -	xe_pmu_enable(event);
>> -	event->hw.state = 0;
>> -}
>> -
>> -static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> -{
>> -	if (flags & PERF_EF_UPDATE)
>> -		xe_pmu_event_read(event);
>> -
>> -	event->hw.state = PERF_HES_STOPPED;
>> -}
>> -
>> -static int xe_pmu_event_add(struct perf_event *event, int flags)
>> -{
>> -	struct xe_device *xe =
>> -		container_of(event->pmu, typeof(*xe), pmu.base);
>> -	struct xe_pmu *pmu = &xe->pmu;
>> -
>> -	if (pmu->closed)
>> -		return -ENODEV;
>> -
>> -	if (flags & PERF_EF_START)
>> -		xe_pmu_event_start(event, flags);
>> -
>> -	return 0;
>> -}
>> -
>> -static void xe_pmu_event_del(struct perf_event *event, int flags)
>> -{
>> -	xe_pmu_event_stop(event, PERF_EF_UPDATE);
>> -}
>> -
>> -static int xe_pmu_event_event_idx(struct perf_event *event)
>> -{
>> -	return 0;
>> -}
>> -
>> -struct xe_ext_attribute {
>> -	struct device_attribute attr;
>> -	unsigned long val;
>> -};
>> -
>> -static ssize_t xe_pmu_event_show(struct device *dev,
>> -				 struct device_attribute *attr, char *buf)
>> -{
>> -	struct xe_ext_attribute *eattr;
>> -
>> -	eattr = container_of(attr, struct xe_ext_attribute, attr);
>> -	return sprintf(buf, "config=0x%lx\n", eattr->val);
>> -}
>> -
>> -static ssize_t cpumask_show(struct device *dev,
>> -			    struct device_attribute *attr, char *buf)
>> -{
>> -	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>> -}
>> -
>> -static DEVICE_ATTR_RO(cpumask);
>> -
>> -static struct attribute *xe_cpumask_attrs[] = {
>> -	&dev_attr_cpumask.attr,
>> -	NULL,
>> -};
>> -
>> -static const struct attribute_group xe_pmu_cpumask_attr_group = {
>> -	.attrs = xe_cpumask_attrs,
>> -};
>> -
>> -#define __event(__counter, __name, __unit) \
>> -{ \
>> -	.counter = (__counter), \
>> -	.name = (__name), \
>> -	.unit = (__unit), \
>> -	.global = false, \
>> -}
>> -
>> -#define __global_event(__counter, __name, __unit) \
>> -{ \
>> -	.counter = (__counter), \
>> -	.name = (__name), \
>> -	.unit = (__unit), \
>> -	.global = true, \
>> -}
>> -
>> -static struct xe_ext_attribute *
>> -add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
>> -{
>> -	sysfs_attr_init(&attr->attr.attr);
>> -	attr->attr.attr.name = name;
>> -	attr->attr.attr.mode = 0444;
>> -	attr->attr.show = xe_pmu_event_show;
>> -	attr->val = config;
>> -
>> -	return ++attr;
>> -}
>> -
>> -static struct perf_pmu_events_attr *
>> -add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>> -	     const char *str)
>> -{
>> -	sysfs_attr_init(&attr->attr.attr);
>> -	attr->attr.attr.name = name;
>> -	attr->attr.attr.mode = 0444;
>> -	attr->attr.show = perf_event_sysfs_show;
>> -	attr->event_str = str;
>> -
>> -	return ++attr;
>> -}
>> -
>> -static struct attribute **
>> -create_event_attributes(struct xe_pmu *pmu)
>> -{
>> -	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> -	static const struct {
>> -		unsigned int counter;
>> -		const char *name;
>> -		const char *unit;
>> -		bool global;
>> -	} events[] = {
>> -		__event(0, "render-group-busy", "ns"),
>> -		__event(1, "copy-group-busy", "ns"),
>> -		__event(2, "media-group-busy", "ns"),
>> -		__event(3, "any-engine-group-busy", "ns"),
>> -	};
>> -
>> -	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> -	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>> -	struct attribute **attr = NULL, **attr_iter;
>> -	unsigned int count = 0;
>> -	unsigned int i, j;
>> -	struct xe_gt *gt;
>> -
>> -	/* Count how many counters we will be exposing. */
>> -	for_each_gt(gt, xe, j) {
>> -		for (i = 0; i < ARRAY_SIZE(events); i++) {
>> -			u64 config = ___DRM_XE_PMU_OTHER(j, events[i].counter);
>> -
>> -			if (!config_status(xe, config))
>> -				count++;
>> -		}
>> -	}
>> -
>> -	/* Allocate attribute objects and table. */
>> -	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>> -	if (!xe_attr)
>> -		goto err_alloc;
>> -
>> -	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>> -	if (!pmu_attr)
>> -		goto err_alloc;
>> -
>> -	/* Max one pointer of each attribute type plus a termination entry. */
>> -	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>> -	if (!attr)
>> -		goto err_alloc;
>> -
>> -	xe_iter = xe_attr;
>> -	pmu_iter = pmu_attr;
>> -	attr_iter = attr;
>> -
>> -	for_each_gt(gt, xe, j) {
>> -		for (i = 0; i < ARRAY_SIZE(events); i++) {
>> -			u64 config = ___DRM_XE_PMU_OTHER(j, events[i].counter);
>> -			char *str;
>> -
>> -			if (config_status(xe, config))
>> -				continue;
>> -
>> -			if (events[i].global)
>> -				str = kstrdup(events[i].name, GFP_KERNEL);
>> -			else
>> -				str = kasprintf(GFP_KERNEL, "%s-gt%u",
>> -						events[i].name, j);
>> -			if (!str)
>> -				goto err;
>> -
>> -			*attr_iter++ = &xe_iter->attr.attr;
>> -			xe_iter = add_xe_attr(xe_iter, str, config);
>> -
>> -			if (events[i].unit) {
>> -				if (events[i].global)
>> -					str = kasprintf(GFP_KERNEL, "%s.unit",
>> -							events[i].name);
>> -				else
>> -					str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
>> -							events[i].name, j);
>> -				if (!str)
>> -					goto err;
>> -
>> -				*attr_iter++ = &pmu_iter->attr.attr;
>> -				pmu_iter = add_pmu_attr(pmu_iter, str,
>> -							events[i].unit);
>> -			}
>> -		}
>> -	}
>> -
>> -	pmu->xe_attr = xe_attr;
>> -	pmu->pmu_attr = pmu_attr;
>> -
>> -	return attr;
>> -
>> -err:
>> -	for (attr_iter = attr; *attr_iter; attr_iter++)
>> -		kfree((*attr_iter)->name);
>> -
>> -err_alloc:
>> -	kfree(attr);
>> -	kfree(xe_attr);
>> -	kfree(pmu_attr);
>> -
>> -	return NULL;
>> -}
>> -
>> -static void free_event_attributes(struct xe_pmu *pmu)
>> -{
>> -	struct attribute **attr_iter = pmu->events_attr_group.attrs;
>> -
>> -	for (; *attr_iter; attr_iter++)
>> -		kfree((*attr_iter)->name);
>> -
>> -	kfree(pmu->events_attr_group.attrs);
>> -	kfree(pmu->xe_attr);
>> -	kfree(pmu->pmu_attr);
>> -
>> -	pmu->events_attr_group.attrs = NULL;
>> -	pmu->xe_attr = NULL;
>> -	pmu->pmu_attr = NULL;
>> -}
>> -
>> -static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>> -{
>> -	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>> -
>> -	/* Select the first online CPU as a designated reader. */
>> -	if (cpumask_empty(&xe_pmu_cpumask))
>> -		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>> -
>> -	return 0;
>> -}
>> -
>> -static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>> -{
>> -	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>> -	unsigned int target = xe_pmu_target_cpu;
>> -
>> -	/*
>> -	 * Unregistering an instance generates a CPU offline event which we must
>> -	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>> -	 */
>> -	if (pmu->closed)
>> -		return 0;
>> -
>> -	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>> -		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>> -
>> -		/* Migrate events if there is a valid target */
>> -		if (target < nr_cpu_ids) {
>> -			cpumask_set_cpu(target, &xe_pmu_cpumask);
>> -			xe_pmu_target_cpu = target;
>> -		}
>> -	}
>> -
>> -	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>> -		perf_pmu_migrate_context(&pmu->base, cpu, target);
>> -		pmu->cpuhp.cpu = target;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>> -static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
>> -
>> -int xe_pmu_init(void)
>> -{
>> -	int ret;
>> -
>> -	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>> -				      "perf/x86/intel/xe:online",
>> -				      xe_pmu_cpu_online,
>> -				      xe_pmu_cpu_offline);
>> -	if (ret < 0)
>> -		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>> -			  ret);
>> -	else
>> -		cpuhp_slot = ret;
>> -
>> -	return 0;
>> -}
>> -
>> -void xe_pmu_exit(void)
>> -{
>> -	if (cpuhp_slot != CPUHP_INVALID)
>> -		cpuhp_remove_multi_state(cpuhp_slot);
>> -}
>> -
>> -static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>> -{
>> -	if (cpuhp_slot == CPUHP_INVALID)
>> -		return -EINVAL;
>> -
>> -	return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
>> -}
>> -
>> -static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>> -{
>> -	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>> -}
>> -
>> -void xe_pmu_suspend(struct xe_gt *gt)
>> -{
>> -	engine_group_busyness_store(gt);
>> -}
>> -
>> -static void xe_pmu_unregister(struct drm_device *device, void *arg)
>> -{
>> -	struct xe_pmu *pmu = arg;
>> -
>> -	if (!pmu->base.event_init)
>> -		return;
>> -
>> -	/*
>> -	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
>> -	 * ensures all currently executing ones will have exited before we
>> -	 * proceed with unregistration.
>> -	 */
>> -	pmu->closed = true;
>> -	synchronize_rcu();
>> -
>> -	xe_pmu_unregister_cpuhp_state(pmu);
>> -
>> -	perf_pmu_unregister(&pmu->base);
>> -	pmu->base.event_init = NULL;
>> -	kfree(pmu->base.attr_groups);
>> -	kfree(pmu->name);
>> -	free_event_attributes(pmu);
>> -}
>> -
>> -void xe_pmu_register(struct xe_pmu *pmu)
>> -{
>> -	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> -	const struct attribute_group *attr_groups[] = {
>> -		&pmu->events_attr_group,
>> -		&xe_pmu_cpumask_attr_group,
>> -		NULL
>> -	};
>> -
>> -	int ret = -ENOMEM;
>> -
>> -	spin_lock_init(&pmu->lock);
>> -	pmu->cpuhp.cpu = -1;
>> -
>> -	pmu->name = kasprintf(GFP_KERNEL,
>> -			      "xe_%s",
>> -			      dev_name(xe->drm.dev));
>> -	if (pmu->name)
>> -		/* tools/perf reserves colons as special. */
>> -		strreplace((char *)pmu->name, ':', '_');
>> -
>> -	if (!pmu->name)
>> -		goto err;
>> -
>> -	pmu->events_attr_group.name = "events";
>> -	pmu->events_attr_group.attrs = create_event_attributes(pmu);
>> -	if (!pmu->events_attr_group.attrs)
>> -		goto err_name;
>> -
>> -	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>> -					GFP_KERNEL);
>> -	if (!pmu->base.attr_groups)
>> -		goto err_attr;
>> -
>> -	pmu->base.module	= THIS_MODULE;
>> -	pmu->base.task_ctx_nr	= perf_invalid_context;
>> -	pmu->base.event_init	= xe_pmu_event_init;
>> -	pmu->base.add		= xe_pmu_event_add;
>> -	pmu->base.del		= xe_pmu_event_del;
>> -	pmu->base.start		= xe_pmu_event_start;
>> -	pmu->base.stop		= xe_pmu_event_stop;
>> -	pmu->base.read		= xe_pmu_event_read;
>> -	pmu->base.event_idx	= xe_pmu_event_event_idx;
>> -
>> -	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>> -	if (ret)
>> -		goto err_groups;
>> -
>> -	ret = xe_pmu_register_cpuhp_state(pmu);
>> -	if (ret)
>> -		goto err_unreg;
>> -
>> -	ret = drmm_add_action_or_reset(&xe->drm, xe_pmu_unregister, pmu);
>> -	if (ret)
>> -		goto err_cpuhp;
>> -
>> -	return;
>> -
>> -err_cpuhp:
>> -	xe_pmu_unregister_cpuhp_state(pmu);
>> -err_unreg:
>> -	perf_pmu_unregister(&pmu->base);
>> -err_groups:
>> -	kfree(pmu->base.attr_groups);
>> -err_attr:
>> -	pmu->base.event_init = NULL;
>> -	free_event_attributes(pmu);
>> -err_name:
>> -	kfree(pmu->name);
>> -err:
>> -	drm_notice(&xe->drm, "Failed to register PMU!\n");
>> -}
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> deleted file mode 100644
>> index a99d4ddd023e..000000000000
>> --- a/drivers/gpu/drm/xe/xe_pmu.h
>> +++ /dev/null
>> @@ -1,25 +0,0 @@
>> -/* SPDX-License-Identifier: MIT */
>> -/*
>> - * Copyright © 2023 Intel Corporation
>> - */
>> -
>> -#ifndef _XE_PMU_H_
>> -#define _XE_PMU_H_
>> -
>> -#include "xe_gt_types.h"
>> -#include "xe_pmu_types.h"
>> -
>> -#if IS_ENABLED(CONFIG_PERF_EVENTS)
>> -int xe_pmu_init(void);
>> -void xe_pmu_exit(void);
>> -void xe_pmu_register(struct xe_pmu *pmu);
>> -void xe_pmu_suspend(struct xe_gt *gt);
>> -#else
>> -static inline int xe_pmu_init(void) { return 0; }
>> -static inline void xe_pmu_exit(void) {}
>> -static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>> -static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>> -#endif
>> -
>> -#endif
>> -
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>> deleted file mode 100644
>> index 9cadbd243f57..000000000000
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ /dev/null
>> @@ -1,68 +0,0 @@
>> -/* SPDX-License-Identifier: MIT */
>> -/*
>> - * Copyright © 2023 Intel Corporation
>> - */
>> -
>> -#ifndef _XE_PMU_TYPES_H_
>> -#define _XE_PMU_TYPES_H_
>> -
>> -#include <linux/perf_event.h>
>> -#include <linux/spinlock_types.h>
>> -#include <uapi/drm/xe_drm.h>
>> -
>> -enum {
>> -	__XE_SAMPLE_RENDER_GROUP_BUSY,
>> -	__XE_SAMPLE_COPY_GROUP_BUSY,
>> -	__XE_SAMPLE_MEDIA_GROUP_BUSY,
>> -	__XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>> -	__XE_NUM_PMU_SAMPLERS
>> -};
>> -
>> -#define XE_PMU_MAX_GT 2
>> -
>> -struct xe_pmu {
>> -	/**
>> -	 * @cpuhp: Struct used for CPU hotplug handling.
>> -	 */
>> -	struct {
>> -		struct hlist_node node;
>> -		unsigned int cpu;
>> -	} cpuhp;
>> -	/**
>> -	 * @base: PMU base.
>> -	 */
>> -	struct pmu base;
>> -	/**
>> -	 * @closed: xe is unregistering.
>> -	 */
>> -	bool closed;
>> -	/**
>> -	 * @name: Name as registered with perf core.
>> -	 */
>> -	const char *name;
>> -	/**
>> -	 * @lock: Lock protecting enable mask and ref count handling.
>> -	 */
>> -	spinlock_t lock;
>> -	/**
>> -	 * @sample: Current and previous (raw) counters.
>> -	 *
>> -	 * These counters are updated when the device is awake.
>> -	 *
>> -	 */
>> -	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> -	/**
>> -	 * @events_attr_group: Device events attribute group.
>> -	 */
>> -	struct attribute_group events_attr_group;
>> -	/**
>> -	 * @xe_attr: Memory block holding device attributes.
>> -	 */
>> -	void *xe_attr;
>> -	/**
>> -	 * @pmu_attr: Memory block holding device attributes.
>> -	 */
>> -	void *pmu_attr;
>> -};
>> -
>> -#endif
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 0895e4d2a981..5ba412007270 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1080,46 +1080,6 @@ struct drm_xe_wait_user_fence {
>>   	/** @reserved: Reserved */
>>   	__u64 reserved[2];
>>   };
>> -
>> -/**
>> - * DOC: XE PMU event config IDs
>> - *
>> - * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
>> - * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>> - * particular event.
>> - *
>> - * For example to open the DRMXE_PMU_RENDER_GROUP_BUSY(0):
>> - *
>> - * .. code-block:: C
>> - *
>> - *	struct perf_event_attr attr;
>> - *	long long count;
>> - *	int cpu = 0;
>> - *	int fd;
>> - *
>> - *	memset(&attr, 0, sizeof(struct perf_event_attr));
>> - *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
>> - *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>> - *	attr.use_clockid = 1;
>> - *	attr.clockid = CLOCK_MONOTONIC;
>> - *	attr.config = DRM_XE_PMU_RENDER_GROUP_BUSY(0);
>> - *
>> - *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>> - */
>> -
>> -/*
>> - * Top bits of every counter are GT id.
>> - */
>> -#define __DRM_XE_PMU_GT_SHIFT (56)
>> -
>> -#define ___DRM_XE_PMU_OTHER(gt, x) \
>> -	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
>> -
>> -#define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 0)
>> -#define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
>> -#define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
>> -#define DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 3)
>> -
>>   #if defined(__cplusplus)
>>   }
>>   #endif
