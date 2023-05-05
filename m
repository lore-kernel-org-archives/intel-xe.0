Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AB6C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 07:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3342110E58F;
	Fri,  5 May 2023 07:44:49 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EFA10E58F
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 07:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683272686; x=1714808686;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EnGObgQu2X0ZJA4cqP/uOIRl0STS2oyuIHQC1dy/fuA=;
 b=GWlQh9mla2emEgDd6Z6x7KT/+IDXstvcqqI4sqzTaVP2uMFwI4YCd6dN
 RtUT9+0FbGNjncVg1RTi2bzyxY2B954GyInoRcqrRM6tVdh0zxlKzwfpZ
 isP8dprnzXUUHPYb8THa8NuZ8Sz47g/vcrGcHIN0bWaWJ4hs5WlH2ziAe
 JcsRfwEstN4S4ms45cvzLXPNf3gqZjfwJuBwmeLy9a60d9Fo00mSGFLIS
 F7sCq9ZF4+TtjogXCllQ57xOIZV0iycChD3jrLafmG5QHXuiMjPiLns0r
 Wv5p+8qQrAWekMPLjoEZdMFMjuq6+25zu9FvODEcuHKxPs3DEXzsWDWMV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="347977088"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="347977088"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 00:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943734544"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943734544"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 05 May 2023 00:44:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 00:44:45 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 00:44:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 5 May 2023 00:44:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 5 May 2023 00:44:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndprdl+NFgiwK1Hb0ovM0ywsGQA6R7N6dQQ5eGzLlj9P7+0C7rDu/sD+/uOTCUBkRKRmDFrO94IVA59s2WEswANrz8DPB8bDF2ai39qbW5RDBz55FaFbUijnQUKCMC06HspcridsTsrZQBCYcGnwxukp7IQxnt5F7gLNyeG29f4W0sLwM+9Pzzjy71L9RVtqrVDX9dZTbed/OuAzvis1LxtxPq472CHIk73EJld2kMyRqYYp0E2HcceQ3Ck8XvkHtUUpRXnNm8Sjyl2kprZHAeYjQ5HBFj+kYCwoFI0eq4V2q4GdaNgKMcKUaNfc4K2pVql7fHAgj4+SpcKuvE6Jlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqRmuwpVMFF9LsaDB/xxEcnwJwVQNTkRyc5erbSeeMY=;
 b=DQbJha6JVVQ7jEMTEllo4HA2BOhOAIFwxwg70puOQC37SB+6cOHbmyhzCFxHubr4rrp0QheUSUYWOnyqnkDOTUUsfMQbauv092SkuBLa3Wd6M/qH5xDEmLsPgQnsuktmgrnPkruosj/vzLoBJWJpvFExkwyKP8QKZLhhvBgi4GNVdZY8GUoT5hz+Pv+0YbWVv+AgI5MKFT2VUiMtp6doNnMzFqfg1L4zpFmN/sX4Jj+6gjs1VkFPTay9bTimET8/RT+B1Dne7+1DXqDj0UcouyKNb07Qjl4ayyQipVZfPPfsccDoUYjzkKmGn2SLbPGQnA6DxhmECWaaJ/xRdwBpbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MN0PR11MB5985.namprd11.prod.outlook.com (2603:10b6:208:370::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Fri, 5 May
 2023 07:44:41 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3%5]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 07:44:40 +0000
Message-ID: <064f5bb0-643d-eac3-4e14-0ebbc740ca81@intel.com>
Date: Fri, 5 May 2023 13:14:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
References: <20230503064252.830641-1-riana.tauro@intel.com>
 <20230503064252.830641-3-riana.tauro@intel.com>
 <CY5PR11MB62114419BC5C8ED03B7FAAF1956D9@CY5PR11MB6211.namprd11.prod.outlook.com>
 <ZFPV8jPCfSio2+Zu@rdvivi-mobl4>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZFPV8jPCfSio2+Zu@rdvivi-mobl4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::29) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MN0PR11MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 88a63346-8de2-4220-a138-08db4d3c954d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s91jW52TWWQcfi4bY7PHuiUBut5WDTGP/WxzLxSC+Fdvkfqtvp4uFU1O5IjQUAJlKLVnfEkLH4k/vO3BHj1Crzz7vAoglEqwm/y1BABi3csf8WT9UpaqJqUY6ylXl29sduTR+Q47f/ZjkpynZExIv2NUr92OuTy48NkfobzXIYyKdfRjCMdInfg42igYttnPt4WvZIVP4L+ACQhlTeh+SkxZrbAFNBCWi1Pv9U6j6WMYd8Xt3IOjYRN0b6a1JmeYM7QhTE6uFoqiy3BiEBLVEC/+n5xWJvkJ9gC/DO1jPPgoFmyMxQlJmK9wh8kALEoz3AbM2OjSDk/wMx5nnbnuloHNDOs0Mx/7QCPPIwHgp3fBBABphf1IS1tSRxrNAcyRSYMSXw9jDhlPQUqtxFcsX65p5lfg3wrlkjVwvSKzE6Z4rhzWxGFI8ijLZsQmaBSHeGnYunxvIyrIpoJAQFGbuHmEP9+vWO/A/GCC0EPKi3fwT2UBsf7305N3eolvLjB5cQDzlfNdXjIaMNPzoUJCLWyY+OoaR87eChnKu0mXHhHfJg7Q8gSyaZvjrtZERbWIn8UKS6gNW2qSopIPeARO3fAg0XdXPkrfB/x9rMATcdJOE3mpvfdMLRS1YeVVW/4RXjzfpFE57MZAn0WThxuuyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(5660300002)(6666004)(6486002)(6512007)(83380400001)(36756003)(186003)(2616005)(31696002)(38100700002)(86362001)(107886003)(82960400001)(26005)(6506007)(53546011)(54906003)(110136005)(2906002)(4326008)(66556008)(66946007)(6636002)(66476007)(8676002)(316002)(8936002)(478600001)(44832011)(41300700001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1BiMVloYTdxeWJKVDJqc0NmU1JnYmJLNUpBcXlMUEU3b0ZJTTFGb3VZRUNO?=
 =?utf-8?B?elI2UElNM3FaR28zaEV2eVNLUWhqckloU0dxRUdiaHFWYnc0NG5XeXN0TEdV?=
 =?utf-8?B?MHRudGYvUGZuSjFFajNBeVpja3RrZTZzUzhvZnA0dWxnS3ZuL2FjazhydE9V?=
 =?utf-8?B?YmpmR09RcW1FRWRGWmN4blBlTW1TWldqS2pQdnBsYkN1Y3VDYytGRVZ5ajkv?=
 =?utf-8?B?bHA0YzVXd0QvaUVNTHFtQjQ2U0ZxUG5nck1RQUFSVWFta0NJVmIvZ3dTQnFT?=
 =?utf-8?B?Q2FMSDdORjYzOERSMzJrZ1cwbkhzUllTeVFZUk5JSnk2RnVFT0FpR2NCUjdM?=
 =?utf-8?B?T2trNDUzemxRYi9pYzByOEdyMzZYOU84cjVrQ29FdHV1TC9PWWlkdHFCZStQ?=
 =?utf-8?B?eW5LR3oyMG1LeThEdkRERGdaUS9xTlpCSzlyM3FXY1dVYnhKVGNBWmROcXRl?=
 =?utf-8?B?TnV0OWYyazkrSC9Rd3pyNGJOUkJ6TldxL3lWbHRvTzQvN3JvcGMzWHA2eDh6?=
 =?utf-8?B?Z3BFdGE2ZG1WcFZDaW16K3Uzb0NadDBxbkNidzU4bURpUUVGTUI0MjdHTGdt?=
 =?utf-8?B?MGUwd0pLUmhRNnZWOEJnc29HNnd0bitmaUM1WDVmM2tBZjVyMVJCMEUyVHE3?=
 =?utf-8?B?eGtCMjV1MXB1SlpNdEhKbHJEa0prN1VBNHRUSWViaXVNS2F6dGlzaGxpdkdW?=
 =?utf-8?B?dkE4OFRoZ2NrRVo1VzlBbllTanN5SDUvUUM2enE0ZUNZbDQ5QlpUZjlrS0Uy?=
 =?utf-8?B?UENFWWtkVlFhY2VsQlFPYmdJRzVtR0wzWHEzMlJQQm5pdi94VzkzZ3Avcm1p?=
 =?utf-8?B?ZWpNRUJOTjZvSy8wYWg4ZkpwaDFsc0FMMW91OHZ6MWZhMDRCWTlJNzVGRjZB?=
 =?utf-8?B?U3labmhId2JnOXJKWWlzT09sR2FkeFRmdS9XQzdHc2hsT21pQVF0d1oyUmRv?=
 =?utf-8?B?NExIemJZVVhuaXpNeEliVmdCMlluSitMOFlQRzkyWHU5WFVyTm9LY0FIVlJ3?=
 =?utf-8?B?U2hWRkRXTWZBN002MjZYazJSdEE4N0VTak02c2Myd1BIbngrWUx0aUtkd1Vy?=
 =?utf-8?B?WWtjZTVuSXR5OFgxa1h6bDk0R3BqcUk3YTVLazltSE5BNTc4MCtJeUdZaXVa?=
 =?utf-8?B?UzJYL01nU1BBQkNXYzNBTHR4TTFCbUhoaUhzZmpoQmNLMDBMYmpsUHdBKzR5?=
 =?utf-8?B?RnZ3bFVDOVhxQ0tZVkFPV2w1VFY1ZFFXZHNpK3JLOHZsWklrVVlsZzRvVzVE?=
 =?utf-8?B?SmdCRjIrbnkrQ3JabjY4V2l1Y1FxUU9PWm1uY1JKQ3NtMGVub2U2eHJkOTMz?=
 =?utf-8?B?OS83SEdnNDRBNlhyTzdHRkMzSGZ2bkc3UzU4ME1aS0Q5bUVvY0tNUTQ0Wlpy?=
 =?utf-8?B?OHlyZTRCMzUxbTNsTEJ3UUFDMVh1QW8xek9Cc05XUU5yeitWc24vQTNPa0gr?=
 =?utf-8?B?aUhEbmFWTjVNVStwS1ZXbW5JSUNWaFBBbTU5Ry9pOS9Md0RwQWl4SWI4Vkdw?=
 =?utf-8?B?WHczZ1AzUlFTYko1MGFGaUR2aWc4MGx1WHdyQzEydTVWeDFFa1M0Y2ZTLzg3?=
 =?utf-8?B?NWNOZXd4ZC9OTEdDdk1XNGt1TVdiOThOK3h2c2Q2a1g2UjNmMm1aNDRDVVhY?=
 =?utf-8?B?aHFPaDFRek5GbjkwY1ZjRDhiYzVqUERQYTV2VS9WSGdhYzlDUnFFZ0ovbDFN?=
 =?utf-8?B?YWkxNHZqdTdVNTZyWnZUMnVCV2p4VHNZbjF3MUdpSllTVXI2eHFjZWxublRw?=
 =?utf-8?B?bXZKaWxvNUg5a2x6Ykswd1FrOHFzZ2dxTXlhRWFLT3lLdDB2UUNySzNhL3hP?=
 =?utf-8?B?U0REQ2NqUGZ0OWxDZW9qaUhhbjhURTRJbG5LWG1iRE85RVRvOEMrbUZWcElW?=
 =?utf-8?B?bWVMTGhMZDVoUU5FalMwUzY5NjhocW5MSjU0V2NORmtFMVcvcWVucktBT0kr?=
 =?utf-8?B?R3lycFlmbHFRWG9CQVlyTFFyUTFma3BIQlFodlJzUTlxNGFLTENqVDI1bmE5?=
 =?utf-8?B?eHVhdFE4QmFWNFBuWGppSlZhZDFKYUVra3pudFBTQUJUWHdGaTFxZGU4MTg2?=
 =?utf-8?B?M0hlRXIxcW1IaU9ZVlpWajR4VGo0L2gyYi9RbnlLR0QxQU5QeDJENnEraGlz?=
 =?utf-8?Q?QdQ+HwOpQ3BvN+hj/MR1SDOOo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a63346-8de2-4220-a138-08db4d3c954d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 07:44:40.5038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0o7Z0wjej6nqwuhJ8qWN/zBlVvCv88AHWOYps85PB0MMezKjGDnvSMjqvN67N7rOzwmPsXtAYKHMDfzGYOyYFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5985
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 2/3] drm/xe : add rc6_residency in ms
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 5/4/2023 9:27 PM, Rodrigo Vivi wrote:
> On Thu, May 04, 2023 at 06:55:48AM -0400, Gupta, Anshuman wrote:
>>
>>
>>> -----Original Message-----
>>> From: Tauro, Riana <riana.tauro@intel.com>
>>> Sent: Wednesday, May 3, 2023 12:13 PM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit,
>>> Ashutosh <ashutosh.dixit@intel.com>; Nilawar, Badal
>>> <badal.nilawar@intel.com>
>>> Subject: [RFC PATCH 2/3] drm/xe : add rc6_residency in ms
>>>
>>> add rc6_residency in ms instead of rc6 residency counter.
>>> Handle wrap around for the counter
>>> The counter can still wrap as it relies on the frequency of counter being read
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_idle.c | 46 +++++++++++++++++++++++++++++----
>>> ---
>>>   1 file changed, 37 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_idle.c b/drivers/gpu/drm/xe/xe_idle.c
>>> index 231bdb45a6b7..a7e97ddd7253 100644
>>> --- a/drivers/gpu/drm/xe/xe_idle.c
>>> +++ b/drivers/gpu/drm/xe/xe_idle.c
>>> @@ -11,6 +11,8 @@
>>>   #include "xe_idle.h"
>>>   #include "xe_mmio.h"
>>>
>>> +#define XE_RC6_MULTIPLIER      1280
>>> +
>>>   /*
>>>    * Render-C States:
>>>    * ================
>>> @@ -27,8 +29,7 @@
>>>    *
>>>    * device/gt#/gpu_idle/rc* *read-only* files:
>>>    * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
>>> - * - rc6_residency: Provide the rc6_residency in units of 1.28 uSec
>>> - *		    Prone to overflows.
>>> + * - rc6_residency_ms: Provide the rc6_residency in ms
>>>    */
>>>
>>>   static struct xe_gt *idle_to_gt(struct xe_idle *idle) @@ -51,6 +52,35 @@
>>> static struct kobj_type xe_idle_kobj_type = {
>>>   	.sysfs_ops = &kobj_sysfs_ops,
>>>   };
>>>
>>> +static u64 rc6_residency_us(struct xe_idle *idle) {
>>> +	struct xe_gt *gt = idle_to_gt(idle);
>>> +	u64 cur_residency, delta, overflow_residency, prev_residency;
>>> +
>>> +	overflow_residency = BIT_ULL(32);
>>> +	cur_residency = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
>> We shall use function pointer here to get the residency, so underlying function can read from
>> appropriate counter and  abstract it from sysfs show function, same comment for converting to
>> ms as well.
> 
> Yes, please!
> 
> Leave this new component as clean and free from the 'RC' stuff as possible.
> Leave all RC stuff inside xe_guc_pc and then this new infra is specific for
> the report and control so you can make this as generic as possible and likely
> extend to other stuff.
> And contain the platform stuff to the lower level.
Hi Rodrigo

So do we have two entries for residency? rc6_residency under 
device/gt#/rc and also displayed as idle_residency under 
device/gt#/gpuidle?

> 
>> Br,
>> Anshuman Gupta.
>>> +
>>> +	/*
>>> +	 * Counter wrap handling
>>> +	 * Store previous hw counter values for counter wrap-around
>>> handling
>>> +	 * Relying on sufficient frequency of queries otherwise counters can
>>> still wrap.
>>> +	 */
>>> +	prev_residency = idle->prev_rc6_residency;
>>> +	idle->prev_rc6_residency = cur_residency;
>>> +
>>> +	/* RC6 delta */
>>> +	if (cur_residency >= prev_residency)
>>> +		delta = cur_residency - prev_residency;
>>> +	else
>>> +		delta = cur_residency + (overflow_residency -
>>> prev_residency);
>>> +
>>> +	/* Add delta to RC6 extended raw driver copy. */
>>> +	cur_residency = idle->cur_rc6_residency + delta;
>>> +	idle->cur_rc6_residency = cur_residency;
>>> +
>>> +	return mul_u64_u32_div(cur_residency, XE_RC6_MULTIPLIER, 1000);
>>> }
>>> +
>>>   static ssize_t
>>>   rc_status_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
>>> { @@ -76,11 +106,10 @@ static const struct kobj_attribute rc_status =
>>> __ATTR(rc_status, 0444, rc_status_show, NULL);
>>>
>>>   static ssize_t
>>> -rc6_residency_show(struct kobject *kobj, struct kobj_attribute *attr, char
>>> *buf)
>>> +rc6_residency_ms_show(struct kobject *kobj, struct kobj_attribute
>>> +*attr, char *buf)
>>>   {
>>>   	struct xe_idle *idle = kobj_to_idle(kobj);
>>>   	struct xe_gt *gt = idle_to_gt(idle);
>>> -	u32 reg;
>>>   	ssize_t ret;
>>>
>>>   	xe_device_mem_access_get(gt_to_xe(gt));
>>> @@ -88,8 +117,7 @@ rc6_residency_show(struct kobject *kobj, struct
>>> kobj_attribute *attr, char *buf)
>>>   	if (ret)
>>>   		goto out;
>>>
>>> -	reg = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
>>> -	ret = sysfs_emit(buf, "%u\n", reg);
>>> +	ret = sysfs_emit(buf, "%llu\n",
>>> +DIV_ROUND_UP_ULL(rc6_residency_us(&gt->idle), 1000));
>>>
>>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt),
>>> XE_FORCEWAKE_ALL));
>>>   out:
>>> @@ -97,12 +125,12 @@ rc6_residency_show(struct kobject *kobj, struct
>>> kobj_attribute *attr, char *buf)
>>>   	return ret;
>>>   }
>>>
>>> -static const struct kobj_attribute rc6_residency = -__ATTR(rc6_residency,
>>> 0444, rc6_residency_show, NULL);
>>> +static const struct kobj_attribute rc6_residency_ms =
>>> +__ATTR(rc6_residency_ms, 0444, rc6_residency_ms_show, NULL);
>>>
>>>   static const struct attribute *idle_attrs[] = {
>>>   	&rc_status.attr,
>>> -	&rc6_residency.attr,
>>> +	&rc6_residency_ms.attr,
>>>   	NULL,
>>>   };
>>>
>>> --
>>> 2.40.0
>>
