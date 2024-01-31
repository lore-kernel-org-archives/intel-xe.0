Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A25C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 06:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCE4113957;
	Wed, 31 Jan 2024 06:03:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70910113957
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 06:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706680991; x=1738216991;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=ogN3SYz0q8Vnn+tp8nQ0QN7iIUm8XGS8Ny6OQpZz9Pk=;
 b=mJGwjnoOt3eXLwbk108ttl0GfJ/ALfwH1gMz34XoCEWeql2P3TNxx6kp
 AdsemMDJbEPRVe03Tnq1p59+vkqkbaMZOh4Pr5juSALFJbJ5fpJH4Rm7f
 hF3JHhJ9P3OsNjdoYm1Vh8qkEnhyeRsR5OAo/jFUk0e9CGRIRr6wRVGzB
 dOptg4iA+NI3eCJRbj8tuDWZ2K9A2vkXqyS6WjPWYKsA4gm2GsbA76ih4
 5TKxn3d42YsDVwA7EHTyrHhCVzOed8qifr9TSk4SLNB8boIVgjfjNZdon
 GuTjLX8uBpohumv0I8MXgO0RvDsaVFyIEHML/pZwavYT9NHN1Ntsf+snQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3342101"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208,217";a="3342101"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 22:02:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208,217";a="36756082"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 22:02:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 22:02:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 22:02:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 22:02:25 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 22:02:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2njhWqtr5esnJIcc5oAkNtVMboooSSjjFemx1no3oSHw0WDl/I7UC8MWFYz1o8fxo7Vu3dUdx9qU7LwsUK1oMY9WmVQchYsvjPcUs7+wF7NSVRSmBYlB/e2QaYaLfyNWj7+mlYDQ1PooXYw7xK2bjPvI2Cuy+R7dQh4UXWv1oN0EU4FP+b1VJsnNkYLbVWBUFUK++3yfEGg3b+DcqAC/Zo7JxcitFrD27od4U5Xhgs0IE7XJDCZRl3xkpUULtfeA5jyFiIXomVxUGXa9rmNtIlcHMOt71xgb249LG2xhgUx931eEH1sDq/WwqQ7itFHltzjXiysdkIyegjQgHHHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxhfV1gNqN5JfZXv4Yq7vwxoXX6r8oNT1F5MXbY98hI=;
 b=HEBgVZCvMjFiHoVCt51u/XKu4JzCZya7wMqxkfyxhUzFedhVIVZKQ8GcKPo+n7ZcCn9Skyn/VQVKt9sQ6pu82FrF4E0sh4tM8Haul3HG7pR5d+XXveEUeUDdllUX5F3EYq2GbVovV4ehE1KVi0WJ9iGHWf8ZDgv9WsxTArzQurW30isQ8jB4A9Yw8TaHoXXdKNjSXnuRgxvw8nbeY5E36Rt9v/UBob+UOtWKbTy0Zgn9gTGktJc7b7S/4tdeWJTDNVAQ0ILeqbZPYZQApR+B2p8aTIeg2XirqCaA3fjSoGOHJ3ww2MINIfKqChs0xzdayvboH5X2aXIzcSla358H1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB5630.namprd11.prod.outlook.com (2603:10b6:a03:3bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 06:02:23 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957%5]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 06:02:23 +0000
Content-Type: multipart/alternative;
 boundary="------------ZEjbO4oh87Bswgbv7qiF96qi"
Message-ID: <2344f0b1-4ec2-49c7-b480-121e0b56e34d@intel.com>
Date: Wed, 31 Jan 2024 11:32:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe: add bind time pat index to xe_bo structure
Content-Language: en-US
To: <intel-xe@lists.freedesktop.org>
References: <20240130193652.374270-1-juhapekka.heikkila@gmail.com>
 <20240130193652.374270-3-juhapekka.heikkila@gmail.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240130193652.374270-3-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: PN2PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::33) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB5630:EE_
X-MS-Office365-Filtering-Correlation-Id: 71895ae2-cfbe-4b2f-0239-08dc22223111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VIrxoVD7aIsC5ms03H1xer0+nmBgmL4RZEHPEpaxPCPRJbKqWxpi25RGb9u6hrd40b2AFOrAvtrZbyvmq8NIkV8CtTeQoSmnIh1Xrl+7eOqTjGHyZFoDO/X6/F9vuhgQDFwAhSD02gBXH9f51n6MPUkdXDH6XSkDXaMokek6KacXTvX9ycqhr1ht/7JGKwX9gf91i11TtJJCMq0SX8rxqKfv4CCwS9d7PPuIuLdlnui2A2Dq1X1JmpqWvUqYnN+0JgSsRXNHWlGh2lbDMpeEnBx+UDfnFT3sXx//feofCW+OuWiM1kzOXu9tqUaOsmyChJkSd+P9pJnQq3u3SgzdUNbWNRAC5bueGyR0CZImCJkaIgG2PBonUrcU8uyj/593jlWkP/AojgrowRynsvSx6ybjfgJbLPFC4LcGPZ3eqzUeJ/jRHa1w5YZs/XKTFfXKG7V4UkLH3Uoi+hXKrkxLxp1ux3mKAc1k9pQQ39CXk9dKYxX6tLk8kq9sWmPe6toKu0obHPrJeZXbsCnKteq8v5Am36mtFr3YUvUF2dTdCec/00yssHQMtJVcxgZd4ACYpsXETKYak1o5p0DSzdOY+8CylF4Q9eBTeDjp0uZPqSKj7GE9Gfl6FoIQogSHaEuyTnXnS+wtYgmQxCA6cY7h0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(346002)(39860400002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(316002)(8936002)(8676002)(2906002)(5660300002)(31696002)(86362001)(66946007)(66556008)(66476007)(6916009)(36756003)(6486002)(38100700002)(82960400001)(33964004)(53546011)(6506007)(6512007)(478600001)(6666004)(83380400001)(26005)(2616005)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWVLK2VpYVI0UkRNUDB3ZjMwTk56OHh5VHdoNTY2MTFFdk1mSXZta1ZSWkJ6?=
 =?utf-8?B?REx0T0lMbzR6bWl2cWVUWHEybmZXRFUyOGJmTDYxM2QxZHZVby80d0R0elVx?=
 =?utf-8?B?UFlyWlo2a2NLV3c3MHIwSnNJdVNJeXJLRGxLZHpIeWM0Sm56M1NaQnJkZkFq?=
 =?utf-8?B?QTVYamZsOTE4S29yN0FiN3hUdEMxZUhKVmlXRGFGQlJ3ZHdUNVBLT1NDc0lR?=
 =?utf-8?B?Wk1mSDBSQW1Mdk5QbFc2cmhVa29UMnpQSllsSXZMOW1mTEM1N2x6Zi9nTDFp?=
 =?utf-8?B?VHd2TjU5MTlZdytzM1dOZHoyVzRONXFxcnN2blRscXdEUmN4VWdmTDRmUms2?=
 =?utf-8?B?MGFFRHIyMzlOK2k0NnVaR1BNUlRHSElwUUlMSWtJcE52OElRdURWak9DVUxR?=
 =?utf-8?B?dlRMeXAvMGI1VmJtRnNpUlFTcVhWOVFzNGs0YXg5d3VIbXplaDB0VFJlVjdH?=
 =?utf-8?B?UFBINE5ONlFoSmhPSUFRd1IwNWZMemlJVmRwQmRVZlcreWpBMEdkMmN0cXRY?=
 =?utf-8?B?azFkSy9LZHhuRXpwYjc4VStXdUFIbHlTTEJqR0x6Zy9yOE52UVEwbnhyMnRy?=
 =?utf-8?B?eVBaL1M0c29IdUhBZk5Xdi84UUJXREFHYkFMdVp6ZXE4VnF0YWlFSzY4Mm5S?=
 =?utf-8?B?bllDeDF5NHp4L0wrL2NxVWFmamNiQXhPV1dSWjNZN1RKTGJGU01IMURwR2tD?=
 =?utf-8?B?U2ZIeVh3VEQ3VkNENUFHbTF0OTVLcEtNTTNrNlV0QlJLUFBUT0I4MU5Qczkv?=
 =?utf-8?B?ZWNEeUM4b3p6dGs1NGszYnI2TEZ5YlJ5SjhJOGxnVHBZb3ZwMVdTcWo5ZXdL?=
 =?utf-8?B?SnVlbFo1aVZvcWY4M0RIMWpxTTV2QmFrY3F4c3UzZHZ0ZUEyR0pZbTZycUM3?=
 =?utf-8?B?akYzdXpENzNqS3NUKzRJTXczNjV2MWpFS0RuMEc3TUJ6Q1E3NENETmN4N0pk?=
 =?utf-8?B?NnNyYjRxTHNtVG5rUUhXUTRIa0lCdjVBcGYyOW5ETWpVNTNJZ3o0cExlOTl1?=
 =?utf-8?B?dzE4aTVacVovcFV5OTRQakpNRTJDQnNVU25RMnhjRGdNaTlRTGZBN0xnTll5?=
 =?utf-8?B?NndRdG1TTGZsVTV0NFN0MFhMRXN6bU5ISWpSTEdzdUlrZ0pIcGVjbG1jTjFw?=
 =?utf-8?B?ejJWcHJXcG1qUkVpQ2xWRnROczMxaFhRd0U1WkVmcGdZMW1ZNkFBZ2Uya1ly?=
 =?utf-8?B?YmEySTZlMHlYWWhyNnByRzlndE5hcmczUFg1YTJuS3JPdytkZTA3S0JGaDVN?=
 =?utf-8?B?MnAvanUxQ2VlMkxrS0NQMExNMXZ3bTQzbG80bjVoSjFNQmo1TkV4VEF0eUkr?=
 =?utf-8?B?QXJDb2daeUVxdDNTMk1KWk41Wlp5Z2xUdW91aGc1WVRxemhjREt5eFREREFW?=
 =?utf-8?B?S2dwaW1iQkhJUk1QZ3laUHZ5RG1hUVpaakdneTdyaFY1NHhXdDlya1ZNeU52?=
 =?utf-8?B?QW5wdnd2MjgzQ0RVU2RHSnRBTzI3M2U0VlJ6cUdiUnhKcW5saEN0aG9OV0FO?=
 =?utf-8?B?U2ZNOGcrbE8xTFhCS3dyZHV1cGZkcUpWTEl1T0NyUlpWTE9FeVByWFRXM2NK?=
 =?utf-8?B?cHZnT08vVXpiMHByYm0yanhhdVY4Sm1LZUp0a0RVTlJWajQ5Rk1YRnlkS3Rq?=
 =?utf-8?B?Y3ZuSnEwcHRFWS9BNUFocEVhL3lTVVA4VjF6WGlNYTdnV3dESTBQaXlXV3lV?=
 =?utf-8?B?RTdQYm9wMndrTTJXdDQ5VlpmQTZLbnRxLzFOYzdmRHFDN3ZBaXkwc1hvTmts?=
 =?utf-8?B?V2hra1pYclRKYWMrL0IvYS9VdFpTbmltZnN4MDIwRUhCLysxUVZRUXk4SW5F?=
 =?utf-8?B?OGhkWGg1UGhLeU9yVU50eEtKeHZJTUN5L2R0ZCt3SVpPdXYxcmNuYmZUVG9o?=
 =?utf-8?B?czRhWFFCQUJXVmFNeTFmYnRFbmZrU3h5LzA4OW1NK0ZmSUIybHQvZUJTMlFM?=
 =?utf-8?B?VWxZRXF1bG5ad01jTmNKUnRWbHVTV2tBVVVrQUxFSm5QTXdaOGovQVVmM2NB?=
 =?utf-8?B?dW45V2RSYzJndVNQYmdsVjB1OWRFYUZVUFkwMDF0SlVpZXNocUxiTkM2MSt0?=
 =?utf-8?B?NitCSzgwRnQvNDdjZjE1UGREQUNFaEFQOEZjakxEWjVKMnNXcDhsN0xEQTFh?=
 =?utf-8?B?RXRaOUNZRlRHNlIwTVRFaEJqVWhpQnQzOXRpUjNJZW5rN2FNV2cvV1RyUmVl?=
 =?utf-8?Q?kKlg3w/0hZBWnmjxB4n3Vi8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71895ae2-cfbe-4b2f-0239-08dc22223111
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 06:02:22.9910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wt6mi0ImKMV8beETPXexwoF7+DKWWpqQ5sWxgyDWblVQC7AQKe3n02aEwPWPAqVhrQILtNI+S+maboYxlwetVM57cWC6sLOqHtpR9Yf3+Zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5630
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

--------------ZEjbO4oh87Bswgbv7qiF96qi
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 31-01-2024 01:06, Juha-Pekka Heikkila wrote:
> Add BO bind time pat index member to xe_bo structure and store
> pat index from xe_vma to xe_bo.
>
> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
> ---
>   drivers/gpu/drm/xe/xe_bo_types.h | 12 ++++++++++++
>   drivers/gpu/drm/xe/xe_pt.c       | 22 ++++++++++++++++++----
>   2 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 14ef13b7b421..6d599f1e846b 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -91,6 +91,18 @@ struct xe_bo {
>   
>   	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
>   		struct list_head vram_userfault_link;
> +
> +	/**
> +	 * @pat_index: The pat index requested when bind this BO
> +	 */
> +	u16 pat_index;
> +
> +	/**
> +	 * @has_sealed_pat_index: The pat index is sealed because this BO is
> +	 * pinned as framebuffer. This is to prevent flipping compression
> +	 * on/off from framebuffers while in use.
> +	 */
> +	bool has_sealed_pat_index;
>   };
>   
>   #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index de1030a47588..c72cb75d993c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1208,10 +1208,11 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>   	struct dma_fence *fence;
>   	struct invalidation_fence *ifence = NULL;
>   	struct xe_range_fence *rfence;
> +	struct xe_bo *bo = xe_vma_bo(vma);
>   	int err;
>   
>   	bind_pt_update.locked = false;
> -	xe_bo_assert_held(xe_vma_bo(vma));
> +	xe_bo_assert_held(bo);
>   	xe_vm_assert_held(vm);
>   
>   	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> @@ -1252,8 +1253,21 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>   		return ERR_PTR(-ENOMEM);
>   	}
>   
> +	/*
> +	 * On Xe2 BO which was pinned as framebuffer before with different
> +	 * PAT index cannot be bound with different PAT index. This is
> +	 * to prevent switching CCS on/off from framebuffers on the fly
> +	 * with Xe2.
> +	 */
> +	if (bo) {
> +		if (bo->has_sealed_pat_index && bo->pat_index != vma->pat_index)
> +			return ERR_PTR(-EINVAL);
> +
> +		bo->pat_index = vma->pat_index;
> +	}
will __xe_pin_fb_vma be always followed after first pt_bind of vma ?
> +
>   	fence = xe_migrate_update_pgtables(tile->migrate,
> -					   vm, xe_vma_bo(vma), q,
> +					   vm, bo, q,
>   					   entries, num_entries,
>   					   syncs, num_syncs,
>   					   &bind_pt_update.base);
> @@ -1287,8 +1301,8 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>   				   DMA_RESV_USAGE_KERNEL :
>   				   DMA_RESV_USAGE_BOOKKEEP);
>   
> -		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> -			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> +		if (!xe_vma_has_no_bo(vma) && !bo->vm)
> +			dma_resv_add_fence(bo->ttm.base.resv, fence,
>   					   DMA_RESV_USAGE_BOOKKEEP);
>   		xe_pt_commit_bind(vma, entries, num_entries, rebind,
>   				  bind_pt_update.locked ? &deferred : NULL);
--------------ZEjbO4oh87Bswgbv7qiF96qi
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 31-01-2024 01:06, Juha-Pekka
      Heikkila wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240130193652.374270-3-juhapekka.heikkila@gmail.com">
      <pre class="moz-quote-pre" wrap="">Add BO bind time pat index member to xe_bo structure and store
pat index from xe_vma to xe_bo.

Signed-off-by: Juha-Pekka Heikkila <a class="moz-txt-link-rfc2396E" href="mailto:juhapekka.heikkila@gmail.com">&lt;juhapekka.heikkila@gmail.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_pt.c       | 22 ++++++++++++++++++----
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 14ef13b7b421..6d599f1e846b 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -91,6 +91,18 @@ struct xe_bo {
 
 	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
 		struct list_head vram_userfault_link;
+
+	/**
+	 * @pat_index: The pat index requested when bind this BO
+	 */
+	u16 pat_index;
+
+	/**
+	 * @has_sealed_pat_index: The pat index is sealed because this BO is
+	 * pinned as framebuffer. This is to prevent flipping compression
+	 * on/off from framebuffers while in use.
+	 */
+	bool has_sealed_pat_index;
 };
 
 #define intel_bo_to_drm_bo(bo) (&amp;(bo)-&gt;ttm.base)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index de1030a47588..c72cb75d993c 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1208,10 +1208,11 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 	struct dma_fence *fence;
 	struct invalidation_fence *ifence = NULL;
 	struct xe_range_fence *rfence;
+	struct xe_bo *bo = xe_vma_bo(vma);
 	int err;
 
 	bind_pt_update.locked = false;
-	xe_bo_assert_held(xe_vma_bo(vma));
+	xe_bo_assert_held(bo);
 	xe_vm_assert_held(vm);
 
 	vm_dbg(&amp;xe_vma_vm(vma)-&gt;xe-&gt;drm,
@@ -1252,8 +1253,21 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 		return ERR_PTR(-ENOMEM);
 	}
 
+	/*
+	 * On Xe2 BO which was pinned as framebuffer before with different
+	 * PAT index cannot be bound with different PAT index. This is
+	 * to prevent switching CCS on/off from framebuffers on the fly
+	 * with Xe2.
+	 */
+	if (bo) {
+		if (bo-&gt;has_sealed_pat_index &amp;&amp; bo-&gt;pat_index != vma-&gt;pat_index)
+			return ERR_PTR(-EINVAL);
+
+		bo-&gt;pat_index = vma-&gt;pat_index;
+	}</pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;" class="hljs diff colorediffs language-diff">will __xe_pin_fb_vma be always followed after first pt_bind of vma ?</span>
    <blockquote type="cite" cite="mid:20240130193652.374270-3-juhapekka.heikkila@gmail.com">
      <pre class="moz-quote-pre" wrap="">
+
 	fence = xe_migrate_update_pgtables(tile-&gt;migrate,
-					   vm, xe_vma_bo(vma), q,
+					   vm, bo, q,
 					   entries, num_entries,
 					   syncs, num_syncs,
 					   &amp;bind_pt_update.base);
@@ -1287,8 +1301,8 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
 
-		if (!xe_vma_has_no_bo(vma) &amp;&amp; !xe_vma_bo(vma)-&gt;vm)
-			dma_resv_add_fence(xe_vma_bo(vma)-&gt;ttm.base.resv, fence,
+		if (!xe_vma_has_no_bo(vma) &amp;&amp; !bo-&gt;vm)
+			dma_resv_add_fence(bo-&gt;ttm.base.resv, fence,
 					   DMA_RESV_USAGE_BOOKKEEP);
 		xe_pt_commit_bind(vma, entries, num_entries, rebind,
 				  bind_pt_update.locked ? &amp;deferred : NULL);
</pre>
    </blockquote>
  </body>
</html>

--------------ZEjbO4oh87Bswgbv7qiF96qi--
