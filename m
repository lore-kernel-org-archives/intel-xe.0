Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C21C7619A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 10:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF38E88DE5;
	Mon, 27 Mar 2023 10:06:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00F688DE5
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 10:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679911579; x=1711447579;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=12FFZg5cwv4JGhBx6DwsuAYRj+BgtFOvpS0bxE76Ymo=;
 b=Pj55XZ+UCMhw6AgzvB0PuHYEYovjtvVVgaQOOuwaM0lDHoCZhSekHOqJ
 G1lRXgJMiyTBeXKYeB53AaFd2m8I9xdY4e5KYn1X9Xc4MqyZ9xDaGO9ok
 dy5qbAZa45NFjXTmu9tkAt1lgHwIHNJA+TqlfUHjG4/Qtz/UkAkCcykM2
 J335qVpam4PQfp7imGbmK8vsJsUhEynOwl2y/7UeNcnkqtMyb4z5eBvpO
 vyd/rhd63Nqbd48saxhteXSQSNRIKm517AUaOeZB+fJvP28zooDHoCwlD
 MhQRY/lwVL+4tbNKUcOjIKa0Kji+1NyxyV5Vwrz1McynW7UVBnbZ97h9y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367971920"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="367971920"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 03:06:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="716023880"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="716023880"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 27 Mar 2023 03:05:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 03:05:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 03:05:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 03:05:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7spn7ddr52btKECjTU9NXHR2B1K5WITLERupI9Aukfh5MvAUhZS4Qsc76Ohs+GbMNbsBGldg8ojQxxUnshC1QCVjpL+l3vCXEUjPpIkB7fsKXN/zloXy/MK11+1NNG4b8MMn1GZqUBxNJVhlzzCLbeLcCyF+bpm5jXtOyVrMTnauBZePrq/RdRip2AkWu6E6fVmiL2nfN7stUxElMnVUiHqc1AL3dqwakKBqXWw2IXzpEamr69ztMC7Aay8Sh/90aS8ePZxsrn7j9pMEKZPhJYclgakm+ovuOM1Gszvn8BAHG1In3/36nvwmrrlprd5CmRd1bVMpPgUWIK3LXyANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSvqdFff7kqAIBGWqe5BjgBxX39TnO6eRIMmJrMkexc=;
 b=ORd1jDvdq46/E39fHwdvDUN3XYY2wnrLLSFjyCOQq7jXfptqtc9Nl4Z5hFOqacT7bqOMlln6LBStwPou0TJZK1Ku3Q4y8cujg91SkQ69MzFfndptPDi6J6bBPYcmGYgTH+YbRbcDYvx+HHo8COV8AfwIF+atrirlYClShIP8aa8W+EaKnXCR+lcNkmyiFDB2RJ0vg42Wj1dwvNwPyyLYdjUK6z2axSAvJuhZl55nnQV9iZu/jOtXyjwMXWNiBfHSo8Yuy7hHnZA6jFQ4pfeyYag39VkBL2Fi4C9jEQC8wBvuHiY7qWu+SrIAB00MYfORBZ6FtfZcDFj1MgDMjDHFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by MW3PR11MB4713.namprd11.prod.outlook.com (2603:10b6:303:2f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 10:05:52 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%3]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 10:05:52 +0000
Message-ID: <4a95e6c8-789a-bc0d-a2b0-a679261b8134@intel.com>
Date: Mon, 27 Mar 2023 13:04:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230323115926.391900-1-matthew.auld@intel.com>
 <20230323115926.391900-6-matthew.auld@intel.com>
 <e3055d28-6330-9dec-3a78-474c41c16705@intel.com>
 <bc2803fa-5426-20dd-367e-e981b3b5772a@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <bc2803fa-5426-20dd-367e-e981b3b5772a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::11) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|MW3PR11MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c103d19-3a41-4491-88f3-08db2eaad938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CScJBhfUsbh9VKFfHuG11jw/uzsVFZY8ZzL7ojL9r/oDzYHZtXPYOOvYZVuWP0jAeDf8i5JnlsRY4PDVMQ4gxH40RkDZbYHBNtu0gnVAvT1Bl25/ADPBxDicwSnC8XeoxwsB9oY+ZulnXPGMbETlKJp5En+Oep0wItCQk+LiClA8+2UyfwAyv8TodRvihU0sVsZXLUMQRlGU+UxD+5XEnUTlnaQOuVW3+JD+RgcbgZoVxxnEWs9Duq0PGGQjWBhvpnkdcrNU6GOXHZz7hj+ReRTLc8AB9FizMXVuJRT/MxcvqtLthuohqpqbvaxdQYHYA6Is3djOpyg44mbz92mJf+XY4oKn6bK1BneXYJlBNTXsPVN7kFUPAqjG8vq1hZZ8o1VtXFC3kkYroDc3H5BEPXmtkvYFZSkdnBG8pIv8muTNi1we3xhnR7riJPedHV/h+GyIOFXa3PKxlQ2JwWltFx41ztNhLd/W7g+VVUBQfGOwTZG/YsQwDnD9wBQOaFHGU8MG1E3+KVCGYb/q+O9jA2JDv7G0DE/c5Lzps13EIQ6rPKqeRQGOQzgx4F4UTclHd735N36QzQHjJJ/xgL5cWWNmsB2TGPZZHNa1rC7SNAeX1G6LNIHGaHUR/TSFe5FeKTE5I67gfYS+YfcwKt/uhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199021)(5660300002)(54906003)(8936002)(66946007)(316002)(41300700001)(31686004)(2616005)(38100700002)(4326008)(82960400001)(8676002)(30864003)(66556008)(66476007)(2906002)(478600001)(66574015)(6486002)(36756003)(26005)(86362001)(186003)(6666004)(31696002)(83380400001)(53546011)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0R2TWZ2bnJ0ODJ6ODlqaDV3QzBzUTBQWGNyeE1mZGZGSDRSNHZxemRiV0Uv?=
 =?utf-8?B?Z29WVUxMeHNHcXdzUDZPVGRCMzdqemxnWG5WbUp6VlFRaWhLVlNXdi9jYXo5?=
 =?utf-8?B?NkdOOEJHZjVyWW5BcjJya3VacVhuNFdvRHNsaWFZV0lJakIwV0p4emZFUWhN?=
 =?utf-8?B?Vm01RzI2MHFtTG5Lek5PK2ZaRkZhQ0dKajdZZ1ltU2M3cHNOVUxCd3Y0WnBY?=
 =?utf-8?B?LzJOYmlFZm00cCs3VW1IWjhSTGhHWmtpUldSRFVZczdjRkhkKzV6Skx2N1Az?=
 =?utf-8?B?NjAyR2w2Rm1pUnI1V1VYSUg0YTFqVnE0ZWlnN0ZsOFo0OVVYM0dmdHZHZWYv?=
 =?utf-8?B?Mno2SytlMUQ2Q3VWbjJPZXpFU0lQOGJjTGNBVGhGTHNpdEJZTXMyRnk2aDcw?=
 =?utf-8?B?V2RiTWFrZ1hveklCdmc0UENhS1h5YlN1dlVuY0YvVzZJME9nbm9RQVFYN1FU?=
 =?utf-8?B?NjVZakJrYXhjQmt3ekREbVRWZXE1ZHVvdzFXWUFvcEdyNHRMZ3lQWExxTDUw?=
 =?utf-8?B?dmVqZzlaSXZpeFRXcUZKTENNQzFySXJxRGJLWTA4cHI0bjV3OXQ4VFZkVWFX?=
 =?utf-8?B?eWNuQ2l2T2N3KzBwazhrSTdwWEl2a2x3Qm53b0tzSGEyYUU4REhRRkl2S1NI?=
 =?utf-8?B?REFEM2cwZzRtbkNEYXNUZW52S1hzRVR5eFh1c2VMRVVRVk5jTklJRXdDVVFX?=
 =?utf-8?B?ZjU4a0syM1R0SWcrdUoxOXhLY3JnK1AvUXNrZkh2Z2VvVldSbEdVRzZWc2cz?=
 =?utf-8?B?YnhkdmFnbnJKbjFsRVJzN2w2STRPYVpBQmFxMnJrUFMxWmdUa0FvSzhFbjk3?=
 =?utf-8?B?SzBnOVNVNjVmUmhsa2dFM2JrcXNGMCtYM2ttdU9NQUxlcjRYcVpERlozOHlm?=
 =?utf-8?B?blVONnh6Yk1wUVpVRGt5dDQvaytBUFprTmxMUWFBQnZjSytkMHU0OVRpa2tl?=
 =?utf-8?B?Z0lTRlU3alpCa3dpZUpiS24yTXlucHBQdXBQdUl0T3NQY25FQnZxQWJjanZQ?=
 =?utf-8?B?ZnVBcUxBdTY0eHdxY3RjSFUrQ3JLVEdhWEJjMUFaSVEybnkvbXR1UlBUSzBJ?=
 =?utf-8?B?czJsY0wwZVBId2FmTHFva3FwMGFwZlBQN2pNak14Z0R0ODVEbDh0bDZlRjly?=
 =?utf-8?B?dU01NVZWYmR2NDVqMytSNWl2b0NUaDRXYUkwZVgxRnI3TFFMcDdkZm1sQVU5?=
 =?utf-8?B?K0NrWEZFRGVuaU8xUG9sWHBZM2g0RlZIbnpNdzZ2QU1lWTdrM1NPYXQyVTdM?=
 =?utf-8?B?SmFYZkxXcTM5QXFLR2VOOWp0UkN3Q3pQWW0rZDJBNFhuc2Iralc5TnE4NVls?=
 =?utf-8?B?NHlWdzhKbVd4QUVKL2w3a1cweTBPL1RybnRJaXQ1b05ZWjc1VHNNbiszaHZD?=
 =?utf-8?B?SWFCSTN5ZWpDWkNZWHFLVDBGV0RtbVhTTFlId0lob2g4clRtdzJldkYzTElj?=
 =?utf-8?B?eWp1ZnFWbGszeUhmNGZmOFFvaXpzRTlUOE5EdlNFbXdaV2lhUzhNL0Z6Wjlq?=
 =?utf-8?B?dGRyTDNPRFB3QnNNZXR0eitJNmJSTXR2aDk2bW5lVGlMMlRIK3ZwZFM1WWcx?=
 =?utf-8?B?UVNOMFBUejRYSk5lYWtyQk1xZjY4bGhoNGd6TWY5bTRNeU91MHZxWnRyMEx2?=
 =?utf-8?B?RVgyRWdFQk1QbUNYVmVHZVgyRjk5Rk5OQ1E1dVpsUE5aTnlSc2toT2M0U3pH?=
 =?utf-8?B?UDhIRmtmN29ZYzRHQ21VZ1UvWndNN25Ddm5BMDV2Z0l6NVNTN0htdkYwYWFr?=
 =?utf-8?B?NXVaRFY1N2RrL1ExREMzT3FhdHJTUkkxeEFndkR3U1ZQUDBiaUczeitVUXhW?=
 =?utf-8?B?d0kxUDVEa0ZWb0FPNGo5cUxjcStNWEF3WUl0WmRKZi9pUGFtM1hYUHEweGZL?=
 =?utf-8?B?cnpJNXNUelZJVHlvVUx3YWNjUHFLOGFlWmlXSkF6dzd1Z0NhL1J0WmVTcVhN?=
 =?utf-8?B?M1NNNUJzWE5tckM0bkFyOVd5MEtjMUh1NlpXTGs5d2YvQUN0UjdnZFR3dVli?=
 =?utf-8?B?WHpkZ1NWd2NyZVFSaVhqc0hYQmFQdFpnaW1Wc2V3b1VZdElnSUdHNWlPK3VO?=
 =?utf-8?B?UU5OYTIrZ3dnTUtSZXU0MDhhbjdvZmNFR2RyTjZRQTduaTR4TnYrM3ovNzZN?=
 =?utf-8?B?TWM4emgwRG5HdkVscDNydEpoQ01RRkZGQ3dRZFRMTU83bzNXWlIzK0R3M3hw?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c103d19-3a41-4491-88f3-08db2eaad938
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 10:05:52.7688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LCJYLV7eAquBrY7DUjps1PKdeYC1qLqwnSpsWefsc1P/Y7308HKswWxCKtMZN2nUg4yaF57heC8c6IDSGjDUl9ZJBnwKMKxQ0plQY0g8Xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4713
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/6] drm/xe/uapi: add the userspace bits
 for small-bar
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
Cc: Filip Hazubski <filip.hazubski@intel.com>, Lucas
 De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 3/27/23 1:00 PM, Matthew Auld wrote:
> On 27/03/2023 05:37, Gwan-gyeong Mun wrote:
>>
>>
>> On 3/23/23 1:59 PM, Matthew Auld wrote:
>>> Mostly the same as i915. We add a new hint for userspace to force an
>>> object into the mappable part of vram.
>>>
>>> We also need to tell userspace how large the mappable part is. In Vulkan
>>> for example, there will be two vram heaps for small-bar systems. And
>>> here the size of each heap needs to be known. Likewise the used/avail
>>> tracking needs to account for the mappable part.
>>>
>>> We also limit the available tracking going forward, such that we limit
>>> to privileged users only, since these values are system wide and are
>>> technically considered an info leak.
>>>
>>> v2 (Maarten):
>>>    - s/NEEDS_CPU_ACCESS/NEEDS_VISIBLE_VRAM/ in the uapi. We also no
>>>      longer require smem as an extra placement. This is more flexible,
>>>      and lets us use this for clear-color surfaces, since we need CPU 
>>> access
>>>      there but we don't want to attach smem, since that effectively 
>>> disables
>>>      CCS from kernel pov.
>>>    - Reject clear-color CCS buffers where NEEDS_VISIBLE_VRAM is not set,
>>>      instead of migrating it behind the scenes.
>>> v3 (José)
>>>    - Split the changes that limit the accounting for perfmon_capable()
>>>      into a separate patch.
>>>    - Use XE_BO_CREATE_VRAM_MASK.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: José Roberto de Souza <jose.souza@intel.com>
>>> Cc: Filip Hazubski <filip.hazubski@intel.com>
>>> Cc: Carl Zhang <carl.zhang@intel.com>
>>> Cc: Effie Yu <effie.yu@intel.com>
>>> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 13 +++++++++++++
>>>   drivers/gpu/drm/xe/xe_bo.c             | 13 +++++++++++--
>>>   drivers/gpu/drm/xe/xe_query.c          | 13 +++++++++----
>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c   | 18 ++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h   |  4 ++++
>>>   include/uapi/drm/xe_drm.h              | 20 +++++++++++++++++++-
>>>   6 files changed, 74 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c 
>>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>> index 65c0bc28a3d1..2a0edf9401da 100644
>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>> @@ -195,6 +195,19 @@ static struct i915_vma *__xe_pin_fb_vma(struct 
>>> intel_framebuffer *fb,
>>>           goto err;
>>>       }
>>> +    /*
>>> +     * If we need to able to access the clear-color value stored in the
>>> +     * buffer, then we require that such buffers are also CPU 
>>> accessible.
>>> +     * This is important on small-bar systems where only some subset 
>>> of VRAM
>>> +     * is CPU accessible.
>>> +     */
>>> +    if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
>>> +        intel_fb_rc_ccs_cc_plane(&fb->base) >= 0 &&
>>> +        !(bo->flags & XE_BO_NEEDS_CPU_ACCESS)) {
>>> +        ret = -EINVAL;
>>> +        goto err;
>>> +    }
>>> +
>>>       /*
>>>        * Pin the framebuffer, we can't use xe_bo_(un)pin functions as 
>>> the
>>>        * assumptions are incorrect for framebuffers
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index de57ccc5b57c..25b1a56c2afa 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -893,7 +893,6 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>>>               ret = ttm_bo_vm_fault_reserved(vmf,
>>>                                  vmf->vma->vm_page_prot,
>>>                                  TTM_BO_VM_NUM_PREFAULT);
>>> -
>>>           drm_dev_exit(idx);
>>>       } else {
>>>           ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>>> @@ -1518,6 +1517,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, 
>>> void *data,
>>>       if (XE_IOCTL_ERR(xe, args->flags &
>>>                ~(XE_GEM_CREATE_FLAG_DEFER_BACKING |
>>>                  XE_GEM_CREATE_FLAG_SCANOUT |
>>> +               XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
>>>                  xe->info.mem_region_mask)))
>>>           return -EINVAL;
>>> @@ -1555,6 +1555,14 @@ int xe_gem_create_ioctl(struct drm_device 
>>> *dev, void *data,
>>>           bo_flags |= XE_BO_SCANOUT_BIT;
>>>       bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
>>> +
>>> +    if (args->flags & XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
>>> +        if (XE_IOCTL_ERR(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
>> Hi Matt,
>>
>> if (XE_IOCTL_ERR(xe, args->flags &
>>           ~(XE_GEM_CREATE_FLAG_DEFER_BACKING |
>>             XE_GEM_CREATE_FLAG_SCANOUT |
>>             xe->info.mem_region_mask)))
>>
>> by the above check, compares args->flags and xe->info.mem_region_mask 
>> to see if the XE_BO_CREATE_VRAM_MASK bit is on in args->flags,
>>
>> But why is it checking bo_flags and XE_BO_CREATE_VRAM_MASK here, which 
>> stored bit-shifted values of args->flags and not original args->flags?
> 
> I think args->flags has the uapi/user version of the region bits, so:
> 
> SYS   BIT(0)
> VRAM0 BIT(1)
> VRAM1 BIT(2)
> 
> And that's also what mem_region_mask is using. But internally we use 
> BIT(0) for tagging USER stuff, so we just shift << 1 here to convert to 
> the kernel internal representation, so:
> 
> SYS   BIT(1)
> VRAM0 BIT(2)
> ...
> 
> And here VRAM_MASK is based on the internal representation.
> 
This completely explains what I was wondering. Thanks.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>
>> It looks good to me, except for the part I asked about.
>>
>> Br,
>> G.G.
>>> +            return -EINVAL;
>>> +
>>> +        bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>>> +    }
>>> +
>>>       bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
>>>                 bo_flags);
>>>       if (vm) {
>>> @@ -1818,7 +1826,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>>>       bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
>>>                 XE_BO_CREATE_VRAM_IF_DGFX(to_gt(xe)) |
>>> -              XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT);
>>> +              XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
>>> +              XE_BO_NEEDS_CPU_ACCESS);
>>>       if (IS_ERR(bo))
>>>           return PTR_ERR(bo);
>>> diff --git a/drivers/gpu/drm/xe/xe_query.c 
>>> b/drivers/gpu/drm/xe/xe_query.c
>>> index 9ff806cafcdd..e94cad946507 100644
>>> --- a/drivers/gpu/drm/xe/xe_query.c
>>> +++ b/drivers/gpu/drm/xe/xe_query.c
>>> @@ -16,6 +16,7 @@
>>>   #include "xe_gt.h"
>>>   #include "xe_guc_hwconfig.h"
>>>   #include "xe_macros.h"
>>> +#include "xe_ttm_vram_mgr.h"
>>>   static const enum xe_engine_class xe_to_user_engine_class[] = {
>>>       [XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>>> @@ -149,13 +150,17 @@ static int query_memory_usage(struct xe_device 
>>> *xe,
>>>                   man->size;
>>>               if (perfmon_capable()) {
>>> -                usage->regions[usage->num_regions].used =
>>> -                    ttm_resource_manager_usage(man);
>>> +                xe_ttm_vram_get_used(man,
>>> +                             &usage->regions[usage->num_regions].used,
>>> + &usage->regions[usage->num_regions].cpu_visible_used);
>>>               } else {
>>> -                usage->regions[usage->num_regions].used =
>>> -                    man->size;
>>> +                usage->regions[usage->num_regions].used = man->size;
>>> +                usage->regions[usage->num_regions].cpu_visible_used =
>>> +                    xe_ttm_vram_get_cpu_visible_size(man);
>>>               }
>>> +            usage->regions[usage->num_regions].cpu_visible_size =
>>> +                xe_ttm_vram_get_cpu_visible_size(man);
>>>               usage->num_regions++;
>>>           }
>>>       }
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> index cf081e4aedf6..654c5ae6516b 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> @@ -458,3 +458,21 @@ void xe_ttm_vram_mgr_free_sgt(struct device 
>>> *dev, enum dma_data_direction dir,
>>>       sg_free_table(sgt);
>>>       kfree(sgt);
>>>   }
>>> +
>>> +u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man)
>>> +{
>>> +    struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>>> +
>>> +    return mgr->visible_size;
>>> +}
>>> +
>>> +void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>>> +              u64 *used, u64 *used_visible)
>>> +{
>>> +    struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>>> +
>>> +    mutex_lock(&mgr->lock);
>>> +    *used = mgr->mm.size - mgr->mm.avail;
>>> +    *used_visible = mgr->visible_size - mgr->visible_avail;
>>> +    mutex_unlock(&mgr->lock);
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h 
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>> index 35e5367a79fb..27f43490fa11 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>> @@ -25,6 +25,10 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>>>   void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum 
>>> dma_data_direction dir,
>>>                     struct sg_table *sgt);
>>> +u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
>>> +void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>>> +              u64 *used, u64 *used_visible);
>>> +
>>>   static inline struct xe_ttm_vram_mgr_resource *
>>>   to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>>>   {
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index 661d7929210c..5a9807d96761 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -169,7 +169,9 @@ struct drm_xe_query_mem_usage {
>>>           __u32 max_page_size;
>>>           __u64 total_size;
>>>           __u64 used;
>>> -        __u64 reserved[8];
>>> +        __u64 cpu_visible_size;
>>> +        __u64 cpu_visible_used;
>>> +        __u64 reserved[6];
>>>       } regions[];
>>>   };
>>> @@ -270,6 +272,22 @@ struct drm_xe_gem_create {
>>>        */
>>>   #define XE_GEM_CREATE_FLAG_DEFER_BACKING    (0x1 << 24)
>>>   #define XE_GEM_CREATE_FLAG_SCANOUT        (0x1 << 25)
>>> +/*
>>> + * When using VRAM as a possible placement, ensure that the 
>>> corresponding VRAM
>>> + * allocation will always use the CPU accessible part of VRAM. This 
>>> is important
>>> + * for small-bar systems (on full-bar systems this gets turned into 
>>> a noop).
>>> + *
>>> + * Note: System memory can be used as an extra placement if the 
>>> kernel should
>>> + * spill the allocation to system memory, if space can't be made 
>>> available in
>>> + * the CPU accessible part of VRAM (giving the same behaviour as the 
>>> i915
>>> + * interface, see I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS).
>>> + *
>>> + * Note: For clear-color CCS surfaces the kernel needs to read the 
>>> clear-color
>>> + * value stored in the buffer, and on discrete platforms we need to 
>>> use VRAM for
>>> + * display surfaces, therefore the kernel requires setting this flag 
>>> for such
>>> + * objects, otherwise an error is thrown.
>>> + */
>>> +#define XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM    (0x1 << 26)
>>>       __u32 flags;
>>>       /**
