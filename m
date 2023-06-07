Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55456C7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 12:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E0010E4B9;
	Wed,  7 Jun 2023 12:00:48 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD7A10E4B9
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 12:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686139246; x=1717675246;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qB2xjAnco+D81GN6Aiww4feQiT9jCQlSFBL/SLLtPsQ=;
 b=doR05c3FaxR3SZROo7g3KGRyx4s6Frs5bj6fbZ9fD41niKCo1Cy6qktM
 qyRTVH5mDFM85r2hObENYW6+NOMKXEA0ehyV337bSHrO7QxVdbzushgKX
 3qfAR21/pjRD7KqDDm/htg/dR9E5e0VhqwzovxaQ7x3c/1lOUdHgWcw9Q
 DMfyDpKEJMpw8TtASxqSnNiAXqFyvA4ExkQKtKvG5LfB8ZeJJKTGAZr1c
 g7pZNfg/belylxYR0zKpJHBsn1s2kZpHzYH39GPrvTaYheeiAEP4jR44N
 /tiprbr7v4DcoGLZy9WGZglamgZh09ottqA9R1mOPcRkTuBPbB2AQv3QK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="354455468"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="354455468"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 05:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="883749678"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="883749678"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 07 Jun 2023 05:00:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 05:00:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 05:00:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 05:00:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 05:00:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbjUB3JhYU9p81+xDMZ7OwwS0WaL3IpCOiLS5pNFirmZloWbRbYxJFxedbCq9gj5EHHEYLNDsZQM891AVsY+fp4+owK20nb4TGdDEon5F+OJAm54IEPTYMRExK8PYzLBnwRWtLZMAgh9lk/46Igmy/zAMX+YCobIAtST92ZbFmiAxYTJX0NOdcFPZ6mbCr5Aqh5FLvu5rf0KjfX12zN1Lrb6i8rPCh9At/I4GdJ8njSQihvYX6Xy8DICuGKQFPwjL5C6ZR0RKVIuaH39sa+LtelvNV+1ubHrSSFdeqTCdtYcujxD9WvGxAD590aZThHczeux/RQzM1IP3gqCDa1TRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7enaY9xqGVlE864QqTlua49RKWleRkKlaTUmXUvyEyQ=;
 b=mgc/iIhN/9qBXPS+8qDK8/4V5SN4GQXH+RwM80BJu44vMtxUqC9243nQVw2aCJItoGAuZihroiEfklIyrmG0ta4ATMVbrGR9ffK6+7J57OUMxE8LBZW2I08Dw7a7WOXgCVp08omhV90yZ4l/x4fJLGjALuq3R4doj1ZJwFySVLHel/ezmyn6t0ylBkF886RfG0UIfoQw77WsEyJOJof2cX6p87+ZXnq+CYpHEjZO+tYv7iOJAIzkXqHpiQwkI8p99tQea9MQmZGk15v6Cm+q0Q9rKcXlKayx5760mA96QLtgLo+iM0kMRJOX1hqit7l5wHZbpVVZPAWMsy4OLZSd7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 12:00:40 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 12:00:39 +0000
Message-ID: <94ca03ac-bd67-dbc1-e827-b6f74776652e@intel.com>
Date: Wed, 7 Jun 2023 17:30:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230607101103.2127088-1-tejas.upadhyay@intel.com>
 <20230607101103.2127088-4-tejas.upadhyay@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230607101103.2127088-4-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::23) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MW3PR11MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2b1a71-1421-418a-7a5c-08db674ecfa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3P61gICVNx+63lGsEyDahLyNOMZG9GP77p7IuQS/c29OUcmEoLwzpsYClxot8c6ZF/kpLU/dAbDswsf3lsqPIaGZmNUVml154/x6X9EHWna4QEOeGrNjV658HRTRU40KUaLN8udOgYL2owsxRhKzBuU4492JmSV4tiPHCxVxvwDh5zC44klaTugy7aaiNzIExt8xRHDV2HVoapnC+ejvc8emZQ/T0qt6VnNQ54M03AmF+dJiUNQ8AOtj8iQL1cf7zlQuy+osGsdUdgX6jfdQFQXyH39KcCQQkExFj3prQxoycgJ7dpibQIWyY3SssA5prXuvVvKFwrkt3AxrjZCsaTdlSn1l1JI/egcGui92aZKcul4LoVCv6EInS7VQFKxRUfCzr/n09MVqXRJrmYR0OyAFIiQNtANFtbUyOwYvGWi3foIYT63APT+cum0IAELAD1eyJaMojNMs/f0UxWNVCLL30Srj+W+gasvuBr4q11t3kvyR/DeW7Fck7tP85HOJixHUG7LjVEEJNRK4KRXsU98gFyHOUDJcgLcjPEpApFr/oB000PL2gP2Vvn8YCkBpt7MHplTDgcB6OUcclxGgp9gcH0JOlZVg00h5DLKfhkAu+Rqj+WVpsyW1rsi+qR8UYUk2ex5L/GtFO6e4KgIwtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199021)(6666004)(66556008)(82960400001)(2906002)(6486002)(66946007)(66476007)(8676002)(8936002)(36756003)(5660300002)(86362001)(38100700002)(31696002)(41300700001)(316002)(478600001)(2616005)(26005)(6512007)(6506007)(53546011)(186003)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vmw2amkxUGg5SlI3ampSM29XbnI5YzBsYWpzaW5oRkRvd3JNekdrWlhZUHpm?=
 =?utf-8?B?Y04zMGlpMEl2Ky9vaDNkaTlIemFya0JmUnJQNkVXeHpERzBUNXZvZzlUQ0U4?=
 =?utf-8?B?czlWajIwdTVVRzFpU0JuRHhsL3VtbVJ5bVE1Ty9ma1Y5b0JnWFBWL1VTOXQx?=
 =?utf-8?B?bHZGOElyWlhxcTJGSHh6RVc1eTV0eGVxSk1UdzEvNkI5ZXBFdFJaM3FuUmFO?=
 =?utf-8?B?cWJCNTFDdi9Vek9rTHFKOVludE1mTVZEalZibk1ZU2gxVUg1NFc1Yjh5K1RM?=
 =?utf-8?B?cmhiSUFUdWo1Ty9weWhQYWM3RmtndHJEeWhjS3dYTjExMHZERWk0WDRLZDFK?=
 =?utf-8?B?YVY0ZXlJRWtUa1czeEZ1Z1dBR1dpb0tXV3NVcVVpUDBlSHB5UjFGNSt2aXpq?=
 =?utf-8?B?T1VHVDFYV2VDdnBpVFNnZTFhZkZMR3FURXlYU1NubkZFTFF2Tml3SVVQZXQ2?=
 =?utf-8?B?cVA4TkpPTTVHM2h4eEFUa2ZFZ2hMOTJFZkhFOGxQRGNBTW9oT0tJNzJLTmhY?=
 =?utf-8?B?RDhTNW1vTCtzRWlPcm9nbVZFQWI1Mm11Nk5SZmR2VytFNmVGU0JFRTB1T1RJ?=
 =?utf-8?B?dXZEbXBBdldNZjdoaWUrYXJSOWN1UEpOaFpsQUFtUE15NGs1Z3h1NytUUU04?=
 =?utf-8?B?ampLV0c3T05GYkY1S2VyUkhNcFp6dk5wY3NNRlNBK3lSRWZYOGFEOVBwQVcr?=
 =?utf-8?B?YWlydTZCdVNqempGekhIY1ZWYlBNSm9Fd1dYbmEweXdnSkt1U2E0Qjh0MlQw?=
 =?utf-8?B?aGV1MEh1ZjdrQ1MrSnFDTnJYSkZiMldrd2k1SkNNbmo4NDJSQ28xTXdIT3lW?=
 =?utf-8?B?cFVFMUhobE90ZkNkNjB1V3lvRU5SMHlueW01NVkzVmo5MmFETmhVRE9qeWpv?=
 =?utf-8?B?ZE9GVjBnQ0E2cThSRzUwaG9GS3dRdjIwNW14RnMxb1pzdkdqamUwdHU5Mzdl?=
 =?utf-8?B?enpkcVE4ZXJMdW9pWFJEdys0V2c5NnY3RkpnRHErSFR6YXF0RWpFeHVCT0No?=
 =?utf-8?B?ZlVEbytPVWZKQjZtQnpiQVV2TEZTYWlxeGFxamc5a01nSnZORlllLyt3Wi90?=
 =?utf-8?B?dW5nZ0t5QzFrOVh6UmZlaFFJQXVHQkM5YUpUcXpsMkk0R2N2NDVMVEhwK3Fu?=
 =?utf-8?B?WFMzZTBuankxNG5abDl4RjlPSUFONmJjOFdubFUrc1VIUlBkRWplck1EUDlu?=
 =?utf-8?B?cTBzUkRoR2l6STR6NTNObFBPYTdOclJ0dUtDcU01a2tUY2tsTUdOYUltdkIy?=
 =?utf-8?B?TExuV1pXUGQveTlXOGl0cTNZNjB6Z08rTElIVk82WERrU01aQnUxVGVqWENE?=
 =?utf-8?B?WGd3UWxSZHpObkNtRmgzd3BwMEI0cmMwTHZlR2dWREtGWkZSYmk4elN6NzBu?=
 =?utf-8?B?VmJhTGMwb01yNzlvaE0yT1NUMGNUSndKMlpnM1d2Q0VsaVNBR1ZmNWdQRmVs?=
 =?utf-8?B?ekFlaTUxTWhsWDBhU21KVXNMSStoUnVQSURTTWdYYjQzc1VHeWZta3E0MTlD?=
 =?utf-8?B?bGMvUGtUbmdBUVFBS3JYRk0vVlJ1Qy9zb3hJc3NqbFFHbGwyR2Zld3JBVmx1?=
 =?utf-8?B?N0dsUy9xdGhLTEpNbXZHWkxZZmUrV0JCMVFYWjZnNXQ1eDFXeWNCRTJiUDMy?=
 =?utf-8?B?WU9ILytPRHY1UkZWczllVXlCSHRQWEI0ZFlLbHAzY2pHWWloa3huTEprTEZu?=
 =?utf-8?B?L1k1aExibytteUhqZ09NeXVEOVFTMkRDZS9rY0xWN0thTmRRRktyT1E4dUUx?=
 =?utf-8?B?ZkRWN0taQ2lHVkpJY1JjdTBnVnVaOG9ScTgwTmErSFE5RHp5dlhkVU0xWHlF?=
 =?utf-8?B?U05qVVJTdWphbGRTd1UycW5RVFdhaXMwRG5BY3kzY2hFcHNpYXpSMzZkbHM3?=
 =?utf-8?B?N2kxblc1bUE1MEdhVUhYQkJtWnNCNExyVUxKRnpXRjJxWkt1SVZpdnV5SUJI?=
 =?utf-8?B?YjR6WXliaVQ4ZUVwM2VpTVNSN052STNHY2lsdVNCdi8wS3pBUmRjK0lWcDNW?=
 =?utf-8?B?RERDTGltYzE1S3RnSGxQNWN0MnY4elo1ZXB1S0cxYWZycDg1Q3ZUTVpTalE3?=
 =?utf-8?B?T2NTREhaMlhvbnlOWnREWWNFZGNNc2MxeEduSGNsTzdWR1hDZ2xmZzBHc1U4?=
 =?utf-8?B?OUh6MWpFUjU5YjV6c2MwVHFUWTFYTkwxbXpxbEY3cUpwbi9NZEc4a1NVVUll?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2b1a71-1421-418a-7a5c-08db674ecfa6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 12:00:39.6328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9oRwfpjOee30LrDBhfJ/viZHv5dkYAwVhiNS/RKyjrIp69rnZXxNv6/lAMyo2BcqWqnIJPVldWgBXpRhvbui9MOd28sz9R2PZrZYZ9UkVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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



On 07-06-2023 15:41, Tejas Upadhyay wrote:
> Add sysfs entry to read per tile physical memory
> including stolen memory.
> 
> V2:
>   - Use DEVICE_ATTR_RO - Aravind
>   - Dont put kobj on sysfs_file_create fail - Himal
>   - Skip addr_range sysfs create for non dgfx - Himal
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
>  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 29 ++++++++++++++++++++++------
>  3 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index db61da4d6212..b8a07826c65f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -107,6 +107,12 @@ struct xe_tile {
>  
>  	/** @mem: memory management info for tile */
>  	struct {
> +		/**
> +		 * @actual_physical_mem: Track actual LMEM size
> +		 * including stolen mem for tile
> +		 */
> +		resource_size_t actual_physical_mem;
> +
>  		/**
>  		 * @vram: VRAM info for tile.
>  		 *
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index f7a7f996b37f..6febd11d7dd9 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -277,6 +277,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  		if (err)
>  			return err;
>  
> +		tile->mem.actual_physical_mem = tile_size;
>  		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
>  		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 09a4a8342aec..b5768c735cba 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -22,6 +22,21 @@ static struct kobj_type xe_tile_sysfs_kobj_type = {
>  	.sysfs_ops = &kobj_sysfs_ops,
>  };
>  
> +static ssize_t
> +addr_range_show(struct device *kdev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
> +
> +	return sysfs_emit(buf, "%pa\n", &tile->mem.actual_physical_mem);
> +}
> +
> +static DEVICE_ATTR_RO(addr_range);
> +
> +static const struct attribute *addr_range_attrs[] = {
> +	&dev_attr_addr_range.attr,
> +	NULL
> +};
> +
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_tile *tile = arg;
> @@ -37,10 +52,8 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
>  	int err;
>  
>  	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> -	if (!kg) {
> -		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> +	if (!kg)
>  		return -ENOMEM;

your first patch introduced it and you are fixing here should it be
fixed in the first patch itself and why this change as the return from
tile_sysfs_init is not being checked.

> -	}
>  
>  	kobject_init(&kg->base, &xe_tile_sysfs_kobj_type);
>  	kg->tile = tile;
> @@ -48,16 +61,20 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
>  	err = kobject_add(&kg->base, &dev->kobj, "tile%d", tile->id);
>  	if (err) {
>  		kobject_put(&kg->base);
> -		drm_warn(&xe->drm, "failed to register TILE sysfs directory, err: %d\n", err);
> +		drm_err(&xe->drm, "failed to register TILE sysfs directory, err: %d\n", err);

same here, but warn is more appropriate than err.

>  		return err;
>  	}
>  
>  	tile->sysfs = &kg->base;
>  
> +	if (sysfs_create_files(tile->sysfs, addr_range_attrs) && IS_DGFX(xe))

this check is not correct if you want to restrict to DGFX, the check
should be preceeding the sysfs_create_files,
if ( IS_DGFX(xe) && sysfs_create_files())

also you could use sysfs_create_file as you have just one entry.

thanks,
Aravind.
> +		drm_warn(&xe->drm,
> +			 "Sysfs creation to read addr_range per tile failed\n");
> +
>  	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>  	if (err) {
> -		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> -			 __func__, err);
> +		drm_err(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			__func__, err);
>  		return err;
>  	}
>  
