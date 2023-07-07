Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47754EB64D9
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 03:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09F210E505;
	Fri,  7 Jul 2023 03:54:03 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456D010E505
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jul 2023 03:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688702041; x=1720238041;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JPfxS1ynvhnEfAPhR3hEKaPfcGZgFsMSO1JP3LdmrxM=;
 b=LLMLHPcZTELwCWenoiCzn2roMdkEAyDRlSvCEhWfr8PIdbDIl7CwEqZ7
 xM9U8lqtOqN+x3us8WinyZQaCyIv5KxN+USOB1tjb31WObxEvp9ow+RpU
 82q7lxe8tKEgBPBGLcFmUCKb6snsnX+1UjKHWtKGexHfbko+0eWOB4Igz
 N3DBg3RMf6qhjDdSpywXXBETamdJ4Z/mA8wtt0WNaTkRxnvmlelLq8t2V
 ocOz8qS9aOVDF/OD8vOEehbLklv0HWOACqcGrcLtPyESwJPohDjH+vRn8
 thvSSRm/UPH+2GCIgzHRrlt93noMFnSK4M7QRQH5NQgzOgMCQhg/BLHax Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="348592651"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="348592651"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 20:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="864360998"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="864360998"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2023 20:53:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 20:53:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 20:53:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 20:53:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 20:53:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRWLpLOXIrm2KftxMWYx1PnstFaWppoBARMKeQMKOXACCCMCqq9FlzUQUd8vJ65D9OmN0D6C1hNuzRYCgrKBAEQBlfGBSdoYuH3ivDw4WCz1fVWlUnWt6tCdtS5Pn2AnIhhSGWmB7NpS3/hkxtDuBWL2vG0TXk5Y4ZKi2GJnIi2Wz19O18b0060LfeLgsCPcL2vn1ez9tjLRboeNxv6ZV83YjzDMqKkzBsSR0Ul4DUTtchPMIyNdKgwjGLwjVanymKvxD09og1D5Vaa9pPPiLKA99A8FdkanrFkAH/HQVWf63kgMpvQny4Ln4DE0Y4Y79ToqjYxs4Y/jVEUuN9tk7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5u8DEM4O/A8/UrnsmQe3724GKzmbDexXxuttzUC/r4=;
 b=ayIQk3xc91R0StXT402oJSVJKyUg1LeWzbJXrrG99F9oi+w5QTyAukqetx80aoDA2PXCw9IGRKUGTS6nKl/u3taHXFEhuHeAmyF+RYDDdvG/z8THob+DTaLQBkJ3jAllJs9KjftsVnkMmBh0lC5b5NjAWXkbUsYpl712/LU6ezpZz0UctkqtJ/g2y2YU1yM5bYWx+KNh+bTErp0vEuDoRoGMHIG/KW5vvilRp1QdOycC7c8gmx1Zz7Dhb/n08wEAHRhSu5cvWNKmxntQiSIce7G6OghwIrb6ziLAcMWR1H9iiM+03YmIqbgFPBITFtunGIQYQ2GqqpPYB/zIVdVfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Fri, 7 Jul
 2023 03:53:57 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f%4]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 03:53:56 +0000
Message-ID: <04ae6811-9bc1-c66d-6cb8-640bfd8a9c7b@intel.com>
Date: Fri, 7 Jul 2023 09:23:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <87mt09daqu.wl-ashutosh.dixit@intel.com>
 <a6fbb435-6383-772c-703d-183f26a8144e@intel.com>
 <87a5w8cvmr.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <87a5w8cvmr.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::27) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|BN9PR11MB5514:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7f6abe-6b52-45d1-8aac-08db7e9dc982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VVQV2WS5GakKVzqIiMur2PBOhYNX+Eok41TXgdiHD9KmeyUi0aXwXDOal/mSdwcqamYvO4sQ2Zvr+Zn29osFfUmbQAHrf3GPY6VNQW+54qXfT4CJ/JK3ViGXEKutXBzK1nhBPJqjydLpwr9Y8BFPwQNQtpyd7P0UMJps4SNj3x7K7p61vpmNA8MyctVQENOP49FrRLiifJS+ndsJV6XdfVmA7Kp8UevUdPonvKdB2EWsjYyog2bHpfef+8m++FPWSRssEdBae9USTv6k08YK2yli4vciuqG1Lp3Ix+dxtpHbWIdk3pEzCIUbNd/vqWuzpOipXdg62g97U5NoeQ7TAzHrgNBKWBix2xoSyQv9C3BE4I/k1VWKHs60vpZZEo3gYPzH8v3xty1F87vNfPzLEiH7aPnPccORoReyCbxWT4AvFi5dZRXORdjtJ3fCnrA+vSQg479fOZ5is5x21D4jaSWGW0p3aP+aqf7+hCy28Yaeos1lARXq5oetq0lYlAq6tVxZ6GvXUwB8pBTKQgPsI812rQnvpz0oIoraGBmOhCL461Uv6m3I8m4O4KesjS9WNtij/x3q2av73DceCKiNOzmqWvLuRykhMO2YGiFJUQ8fOfhCCtDLxjhnftnTGX95oiMn0HYI9/OPMODjL9z4yD7QWIHZ8Mf1138dwj7VH1rswmO92Pbpj/8ppVhjMq4h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199021)(2906002)(966005)(6512007)(6486002)(53546011)(82960400001)(83380400001)(107886003)(186003)(2616005)(26005)(6506007)(31696002)(86362001)(8676002)(5660300002)(6862004)(36756003)(37006003)(54906003)(38100700002)(6666004)(478600001)(66476007)(8936002)(316002)(66556008)(4326008)(6636002)(41300700001)(66946007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnhadmRtc0RNVm9iMThscHV4Rjc4RUF0YVF2WXlEc0x6cGxieHhhVEdEM0RP?=
 =?utf-8?B?R1F3ZUZYSVowVTREWEZKWGtmcW03Y1Q0U3lhNGNBTHpqcVhLbXd0enorOEVC?=
 =?utf-8?B?NFIzS2xSdHhvTHR1RGhKRmRWajBnSDdRVE4xWEdQMWdJRlIyZmZCMDV2L24y?=
 =?utf-8?B?bndodTN5ZGMwRGFzMUQ0K0FaSWx0Z0VjUTJSTjVFcm5sWXcxWHM2bDBLQlA2?=
 =?utf-8?B?VFBLWTVCalBGSm5mMEU0cndhd0I3T0VGeVFkcWpULytPMTlqNkVjNnd3VFJR?=
 =?utf-8?B?d3U3aCttdDVIK3JVaHdyZ3QxN0lTc3c1TGNhc0VkaGE2WVQ3bDh5OWlUK0hX?=
 =?utf-8?B?TUh4M3B2VSszc21kbkFHR3JSVVdGdXppdm5QamZnekdncDJrckpmNU04ZG9W?=
 =?utf-8?B?YUxQV3o1MWlLLzIrSzE5L2kvL2NKNC85M29JSmZOa0puQituaTVSY242SEFH?=
 =?utf-8?B?emQwekVISGQ0RHhzUVlZUHo3cTdYa1YwTU9WTjluWkVnRkhQcGxuM28xSHJ6?=
 =?utf-8?B?MkZYZ09sV2tZNjY4eWZJK0F4eWNvQjRKRFNQTTZZRERobUFkdFlGTHVPUDA3?=
 =?utf-8?B?NkpQR245aC9idEFXK2NWR2dPbE9jYjVFaXAzbXpJWStKNVFoQ0E4bUJtMlZC?=
 =?utf-8?B?SitMcTd5azJSeU4wNEpDc0wzZ0EvZHdaRHQyQytlTThEYnFhS1VRdmdrODBD?=
 =?utf-8?B?UlcvbHBOaFN6cmVXR0dGWEVHdksvbjhENUI1WW9xN3ZQZ2pySUZEelpmVVQ5?=
 =?utf-8?B?QkxXV2ZLZE1GWXY4N1hmQWhGRW50MmJWbHhwODMwTHA0Z2xBeFhMNTFmVmZw?=
 =?utf-8?B?Tm90VDJYbG9qdTI0QzhZQkR0cUw5d2ZFMEU1OXIyd1dISXlaNUxOSDRBdldt?=
 =?utf-8?B?Vk14UUhCVTVZOXJuSEVTQ0xWb3Q3QmtqZ3FyYXp5RkQ1eEVHK1ZjamNrdTFk?=
 =?utf-8?B?bmMxVlhUVVRjZWZnczRtOHFqTisyeE1ySlAwMkhnOHRud2oyQldHQm54TVFZ?=
 =?utf-8?B?UTdNVzJVeVZaVTR5TlU5c3gzT2ltK3Yvb3pHb09ZcVpBSkFjUDRETFhKSDcx?=
 =?utf-8?B?eWE3b0xabUM4MUZIMEowTXpRZDhiR2ZzaEN4Y0t5Ukp0NzR5bXRKaWJGOVla?=
 =?utf-8?B?WmI0TVhkeUdtMS9PdzllSzZRM2lDTERhUFJ5b3lSRU5wTWh3SmJNcGlldy92?=
 =?utf-8?B?cjY4SWJsbkIxQWtyY0NpUG1pK0RKRUQxK2RQWE91M0wxcGFJU2xEblgzbVN4?=
 =?utf-8?B?MzVLeFNDTWVUbGhxQ2RNSGpMWjVsSjczN1ljY2YzWmV5b0QrUG5xVHMwakZW?=
 =?utf-8?B?MmU1M051Ti8wMnprTUtPU2lHTlVxVm5NeXhJVUpYTHpqV3VqY0Mxbi9oSUxj?=
 =?utf-8?B?eFU0Uk94MkdIbTk4R3FhYjZCazQvRm9oRk5aV1UxOVk0dGVLRXYxM3ZFWnJX?=
 =?utf-8?B?bDBvZmdQRDJ1U2dTUlAybE1QTTV5Z0NWODFpRXFXdFp6amJBUll1T3FBZWZy?=
 =?utf-8?B?bEhpTVJJa3dkUHFhRGtKK3dUUnJBTFg0M2hLMnhkUjFLZUlON3Qwb2tPYWpR?=
 =?utf-8?B?MFZ2M2wxcVBpLzVRZlJrUjVIa29xS1Q0blIyR0FwWEZFa2Z0U3BFRWE4N2Fp?=
 =?utf-8?B?Z21WZ25aT0cwMjFhajRDZ3lqczFWb3dFNE9OTHNYSEpJdHVEalNSMFlMdVY2?=
 =?utf-8?B?VnZTNk9oU1FVZFl0Qkx2UnBpUFZURjhmMXgzZE9ZNHNickIxWk5xUUpjWC9r?=
 =?utf-8?B?cGVQSi9rNHlmeTNIclI0WlY4THRiaW0ways0WmxnRHhsR0JSMDdmTlhPeUlU?=
 =?utf-8?B?TWFObUg5TUM1RmlyejZHQmdFTHREdDlZWEJGMjFKZThOakU0U3dVakYxanpj?=
 =?utf-8?B?OGNjVlZuTVhVeW01UnFiWnNlQ3lFSHNyRlpQdmxFbnE4UHo2ZDRjblBIZWVJ?=
 =?utf-8?B?SXlRS3hodjlNZStoTTNzdnJXZXlLY2JGcHVLKzlMV3QxNUhsNERxS2s2Vitt?=
 =?utf-8?B?ZkRxeG9VMDd4WnRlaW9VZmtQOVhlTjBRZmd4YkNnQ1lXRzdMYXg2MkZScllV?=
 =?utf-8?B?UURzRCthTS9IQ2hMbHQ0aGtkS25VeEVVaE81UG9kVWUwUUFGQjZreXU5ekhF?=
 =?utf-8?B?a1FZSWNaUk9wM3lpZkVidWRVRDNuVzhBZXRRaEJ4Mmc1MjVPdFQyckNPUWor?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7f6abe-6b52-45d1-8aac-08db7e9dc982
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 03:53:56.5357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oByln1OlPbSLd1dixRgaHwVx+P4OrTZZcN+Lxqwv2vDJGleYKRYQgyrUI7+kybvIiB2/mWVhRA5IzmqIYMd3bAoIDrpEG5SL0zllZ7HzPZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5514
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 07-07-2023 07:48, Dixit, Ashutosh wrote:
> On Thu, 06 Jul 2023 06:42:29 -0700, Iddamsetty, Aravind wrote:
>>
> 
> Hi Aravind,

Hi Ashutosh,
> 
>> On 06-07-2023 08:09, Dixit, Ashutosh wrote:
>>> On Tue, 27 Jun 2023 05:21:13 -0700, Aravind Iddamsetty wrote:
>>
>>>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, u64 config)
>>>> +{
>>>> +	u64 val = 0;
>>>> +
>>>> +	switch (config) {
>>>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>>>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>>>> +		break;
>>>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>>>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>>>> +		break;
>>>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>>>> +		break;
>>>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>>>> +		break;
>>>> +	default:
>>>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>>> +	}
>>>> +
>>>> +	return xe_gt_clock_interval_to_ns(gt, val * 16);
>>>> +}
>>>
>>> A few questions on just the above function first:
>>>
>>> 1. OK so these registers won't be available to VF's, but any idea what
>>>    these counts are when VF's are active?
>>
>> VF's cannot access the registers but the counters will be incrementing
>> if respective engines are busy and can be monitored from PF and that
>> will be across all VFs.
> 
> Ok, good.
> 
>>
>>>
>>> 2. When would these 32 bit registers overflow? Let us say a group is
>>>    continuously busy and we are running at 1 GHz, the registers would
>>>    overflow in 4 seconds (max value 4G)?
>>
>> Based on BSPEC:52071 they use MHZ clock assuming the default 24MHz, it
>> would take around 5726 secs to overflow.
> 
> OK, overflow should not be an issue then. Though I have seen 19.2 and 38.4
> MHz in OA. Also, if these are OAG registers, OA timestamp freq can be
> different from CS timestamp freq, so not sure if that needs to be
> handled. See i915_perf_oa_timestamp_frequency() in i915.

so that is handled by below calculation
> 
>>
>>>
>>> 3. What is the multiplication by 16 (not factored above in 2.)? I don't see
>>>    that in Bspec.
>>
>> These counters are incremented based on crystal clock frequency and we
>> need to convert to CS time base hence a 16x mul. BSPEC:52071
> 
> Hmm still don't see the 16x mul in BSPEC:52071. Anyway.

lets say the frequency is 24MHz so the counter increments every
1333.333ns(granularity) and corresponding cs timestamp base for this
frequency is 83.333ns, 1333.333/83.333 = 16 and this true for rest of
the frequency selections as well. hence we multiply the counter x 16.
> 
> Also, could you please explain where the requirement to expose these OAG
> group busy/free registers via the PMU is coming from? Since these are OA
> registers presumably they can be collected using the OA subsystem.

L0 sysman needs this
https://spec.oneapi.io/level-zero/latest/sysman/api.html#zes-engine-properties-t
and xpumanager uses this
https://github.com/intel/xpumanager/blob/master/core/src/device/gpu/gpu_device.cpp
> 
> The i915 PMU I believe deduces busyness by sampling the RING_CTL register
> using a timer. So these registers look better since you can get these
> busyness values directly. On the other hand you can only get busyness for
> an engine group and things like compute seem to be missing?

The per engine busyness is a different thing we still need that and it
has different implementation with GuC enabled, I believe Umesh is
looking into that.

compute group will still be accounted in XE_OAG_RENDER_BUSY_FREE and
also under XE_OAG_RC0_ANY_ENGINE_BUSY_FREE.
> 
> Also, would you know about plans to expose other kinds of busyness-es? I
> think we may be exposing per-VF and also per-client busyness via PMU. Not
> sure what else GuC can expose. Knowing all this we can better understand
> how these particular busyness values will be used.

ya, that shall be coming next probably from Umesh but per client
busyness is through fdinfo.

Thanks,
Aravind.
> 
> Thanks.
> --
> Ashutosh
