Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA09CA0EC3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB4C10E321;
	Tue, 12 Sep 2023 06:23:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D33410E321
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 06:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694499793; x=1726035793;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=1x2fU+Ili4lqxaKhuxWTzeHEHTRwAaIVCyBoL9ncOFA=;
 b=G+Cbca7NF+JLM3bAbZpqOaToVKGobrkBBIl2X8L3d02o7InrVGpakwXQ
 FXGzPA+nbhSdQQKmESaEIss36JZz296yTsJ4sno/WtR6eLxNu8b/BuS0H
 n04qs5Uy2EonD2wlgvwjFWJvvPKGOvMvvOpt8JA+jf0P8CAzHXNAZfnJ6
 fS6Vp5QRx6Ihe/tfwYyxFUSP3VAOhD3V65hdZMsyte83FMJFkEojEI9Ho
 IRrJ1O2HUzI0ZkT5lDlum6Mt3wvBUhrPS+bqokFgUC8DYzaT6uDJKAbMX
 4GvOvc06PqFpbSo0e2aXzb9M7SXaijLXeeG7TSG7xyzlM7PRz0sq3Rycb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="368543145"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
 d="scan'208,217";a="368543145"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="772872842"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
 d="scan'208,217";a="772872842"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 23:23:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 23:23:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 23:23:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 23:23:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 23:23:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGPb12qrCe9dXpGm9RUC3xkq4oDWvj5M1/n+l4i9frhQkg3WRYggWdnrIQl3OyCUHK5s7cXXpuoKPwc4kzDbqOb0PtHMC3WxVVj9q1DpdwGyv7PnvFvQDk8S+z0JuqaeQVd8GH5Bo5oNmhUqXRJqAdSB79NeAD7Etttd8nnEac/1b2atkR6JuWNBB+kncdcmi2XO4qCfSv4AHzZK/Zjy++mk4a2vGuUUwSrA60qS7iWhqDLbfLCrxsBlunEDwGOBsyQ2k31cyLYlK5iTmcIjR3EU9yFvZwam8ZTbONmGHzJV7S8OhZsnF4Xk2DCYjUwqG0SSTAZWkiv1mPn0PPh8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3I6giHkjt71AdihnbKyu7jw9C6YO+XOkkzo5Z5OlsM=;
 b=ZLb26eVqrv+zZvxIWQ2IiqxyD3SxL6bEa5ta+YUoFEi72R5T2yCQGyugR/ZJpaqdVvBYGqPEi4I0SoDBZnIh5wHI2PprryY4CuViOWax/puVr2uH1htvkoPWfR77eyBm+8lFzS74sLa5P5glORRG3b6Ygh1f1BrVAcOLzOmVt3Xl5TKVtSYQiOchyWneZFUeC6nIzCBo5txf+9TAmVLsuzptEvRT5w1QblSYzxchAoy6mgEfpppRNnChUPeh9EEZ24JcAThY1vT7WnadEy4rpqNxg9SQqaBlIdL2i6k/eWRrJkNVw7JN5y/Ydf/YUh2T6mgSb8fHZJImtsW0jrCnXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.38; Tue, 12 Sep
 2023 06:22:59 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 06:22:59 +0000
Content-Type: multipart/alternative;
 boundary="------------Y3D3DugAC4kYfNKOfzudsKKL"
Message-ID: <c6509d5f-cc5c-4017-abfe-b9b6d194caa9@intel.com>
Date: Tue, 12 Sep 2023 11:52:49 +0530
User-Agent: Mozilla Thunderbird
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
 <20230831090536.2949934-8-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230831090536.2949934-8-tejas.upadhyay@intel.com>
X-ClientProxiedBy: PN2PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::28) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH0PR11MB5409:EE_
X-MS-Office365-Filtering-Correlation-Id: da695895-7681-463e-7473-08dbb358b5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2TYfD3N+kXDjMrd/FPfFCRNz4SH+Gi7EFum0xWm/6FkWE8s37/LXu2bBkL4vPAS06yTjc1Hj0JGYHqeh5JS0iTM+cfz9MyTD1bfBCuw+5dKGF7ajM1jXAB6/jd4kVhTqqitZzfczmGsSjBvVlXwSkkoiHbStJ5QvJwjmxUGhOLaGgcLdQ0Wxwe/gWXJ3oRbPBTBMYQykB3sj2tQa63/lGHd8idJRgikXT/By0NioKix9qjubq5+y+gkU8CKEJzSurcgwN1xy7xUzz/JNU/FQLCyP3HJf4LglAcF8nnY2jiVgqkfzwC1lephR/IATMsZHONxkmKeCRy66wUmIFt23HYPSxm8dC4ISWJmBID2eknnBbGTdUzcvVlktC7/PbevuVCAElMEttjxQmihfOp8BtnkvA4CoOxl3jGuuxRospewtWqT51J8TOMH4rojVyzCDL2b/VfoigikVwmYq8wP9bxlnq1P+ACedmMvC4T2NWbjO6nvZ+x+QgU54hARA6I7jSyzejuu5BO9AYVhgaVD5DwVx9AXjmnjY6OjdEzyJYR66P7swC2BFXBdaaGfqQqMkkIfx/hrL+cZNYO+9msxGYOucLhfgfzXe1LFYC0PJUqqCuqvA38BsaBsL+f186VfvEXvEelyxGne8dB2RnrQLfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199024)(1800799009)(186009)(31686004)(6666004)(6486002)(6506007)(53546011)(33964004)(36756003)(82960400001)(86362001)(31696002)(38100700002)(26005)(107886003)(2616005)(30864003)(2906002)(6512007)(478600001)(83380400001)(4326008)(5660300002)(316002)(8676002)(8936002)(41300700001)(66476007)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2p6eU1xcDVYL3ZUcFdMWWF1S1Q5emE1a2h3aXRUNFIrT3QrUGFJTWZaVEc0?=
 =?utf-8?B?dGIvMmR6bVpXWGhvRnRQcVZwdUdlNDU5TnEzZnRKWlJPSnJRUkdTU2JPcHRO?=
 =?utf-8?B?RW14M3AzQW9EMUh0Sk9oQTRONW9sbmtNMmtwWXd5NGQrN2RHY05rT04wdzgz?=
 =?utf-8?B?WHVsb0EvSGJLQ1hrYlBORmtTNDlxOVZFSWZLWEkvU1pqL3NEaVNFelF1TmtU?=
 =?utf-8?B?aWgveHNHb1g2RkJ1UVlPSFNseHJObElwMC93YmFQajR6SW1FbkFWTVUwTkNu?=
 =?utf-8?B?VU9jZXg1MkZaR3oyNmYzbmh0NE95MnFEbU5EMVQxeFF3L3NrLzcwNENMdjVn?=
 =?utf-8?B?clVCVG9FTitYc3RNY09CbEVuT0U0SFVmaE1jdjhkQ1VEQnJ4VXhTZy9FMGJR?=
 =?utf-8?B?S1VsNUdWbVdZOWhwSFl4NGhlRktFNDRjMWpvZHRoYkhUQXdzSGlNTW1BL0pO?=
 =?utf-8?B?S2NVK0tvTzNrdURsK1Q1RnBtMjNGdmlOMExYQnZYQXc2eXIzYUp1RFhxWmNq?=
 =?utf-8?B?cFYrdEFLb2h3dGp5VWVIR3hZUHJLN3JKUmNyWnY3YTdZYVBUL3B6UUxMZFV3?=
 =?utf-8?B?Z2ZxSDVJVFpjZitlc3g2dGRXc0E3VG5ldmxCdzVxUGZsMXpPWFovYVhZaWxN?=
 =?utf-8?B?d3IyTE92RVVNZ09xS3lmN1pXclNWSnpQZDkrcXcyQVRSN3E3ekZzTW9kMFBk?=
 =?utf-8?B?TW1icmVhV2tlY1JTOXZBWGkyY2JzcDNRNkdaQm9KaTQwOHZSNmg2ekIybDhy?=
 =?utf-8?B?UE9MRjVSb0xkY3BvRFhrTEdHTUlxNW9WQ0YwUjkzdk96WHoxOXNLTFpRRy90?=
 =?utf-8?B?ZWo0U014QUU1Nkdqb1RmdU9OQXV1Uk54OWJTRVdPeEZzb09zTGpWZWJ6UGlj?=
 =?utf-8?B?cWg2My94K2JYNTNBVjd4MjNnOTBsRzJHSDU3d1ByMy9aWGI2VmMyd2liZ21R?=
 =?utf-8?B?elU5Tkh0WE0wbUF3VERUeEh4Uk9yTU1QUUlJSUZXZW1Ld0l0WmRFdXdmY2t3?=
 =?utf-8?B?U2FqUWowM1AxUnJpbzVERFdhUnlmdERZMERjclAwQWc0bXZXOWsvVExNbDUr?=
 =?utf-8?B?aWhUSDd6dGxnSlU5cjIvbU5rZ0sxU0M3U0RDbXBpbVllV0poRUdWZlo0WlZX?=
 =?utf-8?B?a2tNb21hMStySWpGWE4xNmNuYXhUR3V0MEZCUkVDT0lrUkk3d0dGS1VESlkv?=
 =?utf-8?B?TG9IZ2VnZDJTWmRDelNDcWZtN01MNEV3RmlJZWpQMTN2KzB6Qm43cmF6ZWpx?=
 =?utf-8?B?YjNGeXIzWHh3N1hDemhaRzVrWkVHOEtUenRUcjZLckw2WmtiQ3A5TFVOUnBv?=
 =?utf-8?B?WEpYZ2ZJQitWZm4zenJLaDI4VEp3YlhpdlRWa2JWN1VsSVNyNTNkQ01ac2sx?=
 =?utf-8?B?bzRQWWNQaXpPM2Zrd0szMklaNThCejI3R215aUZzSkxyZWRkb3gyaDljSnRU?=
 =?utf-8?B?RExqTmQ1aUpBRVpOeFU1Z3doZHpCakJPNS9pSEpYakdJZkZMdnNkbkg2L3F6?=
 =?utf-8?B?OW5NZG1yekFNU2Nya2VHZC82dk9FeEtHY2VWZFRCY1VOU2NBZXVqbVpUcnoy?=
 =?utf-8?B?OTdrM0xwWFhPRDlqbXVGOXdYTFZPUmFROHVSYWI5UElyT0Eva282ZTFsZE1C?=
 =?utf-8?B?SW9yWEY3a21nbFF3UDBGZ01sdXN0U1owTkxkV0w2bUF6VFE5eXZrc05iYTVa?=
 =?utf-8?B?ajJVcXp1dFFLSFFyNEZJYXZONlpiWGRaWGlEamszejhCODlTNkZaQ05rMEZX?=
 =?utf-8?B?NHEwUVcvbGYvZnFDcm55d1ZON09SYVBQb1R4YlYrWkNXYmpzVVJxdTJQM015?=
 =?utf-8?B?SWFmWXAvMng4OFNXWXJTbXE5My9TYmJML1VjM2Q0RzlTd2JDM2FnUTFlNm5E?=
 =?utf-8?B?aHlMRDliNGo0eTJoNENHV2xtakxIdHllak5UZ1A0VmtEZmpaSHlUbHlBWHJx?=
 =?utf-8?B?aUtRQ3R3ZXhkRFJnT1JBT002bGN3elp1ektBL043YWVWMGFtRkh0OHJVZ1ZI?=
 =?utf-8?B?SjNuQWRocHZZSktVRmJVMGRHRXRyVXp2TUVMblhxUXdJV0F6V1ZPN1QvdHBU?=
 =?utf-8?B?dzJhK0FvWDlUem9MSGI0VXNjK21CQWdZdWRIUnU3OHNKTlVTL1hQRmQyRXRv?=
 =?utf-8?B?dUVyaHRoYVVBaXUzLzV4OUsxcndPUGpqOC9DanVSUWZxTXVwVms0cUNGYlE3?=
 =?utf-8?Q?3DMWK0no86/P5Kj1IiBkQq0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da695895-7681-463e-7473-08dbb358b5cb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 06:22:59.5018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lndFRADk1xRvV8SSs0QsU4kuo4XvV957oNf4+9HO9VMnyQoPuimQxSJSv5wJJLt/wKvwvm2wXPHCmr/QehAwCsMueWmO3d+EtjIXdph0v1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5409
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe: Implement fdinfo memory stats
 printing
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

--------------Y3D3DugAC4kYfNKOfzudsKKL
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 31-08-2023 14:35, Tejas Upadhyay wrote:
> Use the newly added drm_print_memory_stats helper to show memory
> utilisation of our objects in drm/driver specific fdinfo output.
>
> To collect the stats we walk the per memory regions object lists
> and accumulate object size into the respective drm_memory_stats
> categories.
>
> Objects with multiple possible placements are reported in multiple
> regions for total and shared sizes, while other categories are
> counted only for the currently active region.
>
> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.h         |  11 +++
>   drivers/gpu/drm/xe/xe_drm_client.c | 103 ++++++++++++++++++++++++++++-
>   2 files changed, 113 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 0823dda0f31b..538a9ec7f4c3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -6,6 +6,8 @@
>   #ifndef _XE_BO_H_
>   #define _XE_BO_H_
>   
> +#include <drm/ttm/ttm_tt.h>
> +
>   #include "xe_bo_types.h"
>   #include "xe_macros.h"
>   #include "xe_vm_types.h"
> @@ -258,6 +260,15 @@ static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
>   	return PAGE_ALIGN(bo->ttm.base.size);
>   }
>   
> +static inline bool xe_bo_has_pages(struct xe_bo *bo)
> +{
> +	if ((bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm)) ||
> +	    xe_bo_is_vram(bo))
> +		return true;
> +
> +	return false;
> +}
> +
>   void __xe_bo_release_dummy(struct kref *kref);
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 00b28a08909f..28b4c8e608f8 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -4,10 +4,12 @@
>    */
>   
>   #include <drm/drm_print.h>
> +#include <drm/xe_drm.h>
>   #include <linux/kernel.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   
> +#include "xe_bo.h"
>   #include "xe_bo_types.h"
>   #include "xe_device_types.h"
>   #include "xe_drm_client.h"
> @@ -110,6 +112,105 @@ bool xe_drm_client_remove_bo(struct xe_bo *bo)
>   	return true;
>   }
>   
> +static void bo_meminfo(struct xe_bo *bo,
> +		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
> +{
> +	u64 sz = bo->size;
> +	u32 mem_type;
> +
> +	if (bo->placement.placement)
> +		mem_type = bo->placement.placement->mem_type;
> +	else
> +		mem_type = XE_PL_TT;
> +
> +	if (bo->ttm.base.handle_count > 1)
> +		stats[mem_type].shared += sz;
> +	else
> +		stats[mem_type].private += sz;
> +
> +	if (xe_bo_has_pages(bo)) {
> +		stats[mem_type].resident += sz;
> +
> +		if (!dma_resv_test_signaled(bo->ttm.base.resv,
> +					    dma_resv_usage_rw(true) |
> +					    DMA_RESV_USAGE_BOOKKEEP))
> +			stats[mem_type].active += sz;
> +		else if (mem_type == XE_PL_SYSTEM)
> +			stats[mem_type].purgeable += sz;
> +	}
> +}
> +
> +static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct drm_memory_stats stats[TTM_NUM_MEM_TYPES] = {};
> +	struct xe_file *xef = file->driver_priv;
> +	struct ttm_device *bdev = &xef->xe->ttm;
> +	struct ttm_resource_manager *man;
> +	struct xe_drm_client *client;
> +	struct list_head *pos;
> +	struct xe_bo *bo;
> +	unsigned int id;
> +	char name[16];
> +	u32 mem_type;
> +	int ret = 0;
> +
> +	client = xef->client;
> +
> +	/* Public objects. */
> +	spin_lock(&file->table_lock);
> +	idr_for_each_entry(&file->object_idr, bo, id)
> +		bo_meminfo(bo, stats);
> +	spin_unlock(&file->table_lock);
> +
> +	/* Internal objects. */
> +	rcu_read_lock();
> +	list_for_each_rcu(pos, &client->bos_list) {
> +		bo = xe_bo_get(list_entry(pos, typeof(*bo),
> +					  client_link));
> +		if (!bo)
> +			continue;
> +		bo_meminfo(bo, stats);
> +		xe_bo_put(bo);
> +	}
> +	rcu_read_unlock();
> +	for (mem_type = XE_PL_SYSTEM; mem_type < TTM_NUM_MEM_TYPES; ++mem_type) {

can avoid this switch case with something like

const char* mem_type_to_name []  = {

"system",  /*XE_PL_STOLEN */

"gtt",

"vram0"

"vram1"

NULL,

NULL,

"stolen",

},

> +
> +		switch (mem_type) {
> +		case XE_PL_SYSTEM:
> +			sprintf(name, "system");
> +			break;
> +		case XE_PL_TT:
> +			sprintf(name, "gtt");
> +			break;
> +		case XE_PL_VRAM0:
> +			sprintf(name, "vram%d", mem_type - XE_PL_VRAM0);
> +			break;
> +		case XE_PL_VRAM1:
> +			sprintf(name, "vram%d", mem_type - XE_PL_VRAM0);
> +			break;
> +		case XE_PL_STOLEN:
> +			sprintf(name, "stolen");
> +			break;
> +		default:
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		if (ret == -EINVAL)
> +			continue;

if (! mem_type_to_name[mem_type])

continue;

> +
> +		man = ttm_manager_type(bdev, mem_type);
I assume on single tile platform man will be null for vram1 ? Please 
confirm.
> +
> +		if (man) {
> +			drm_print_memory_stats(p,
> +					       &stats[mem_type],
> +					       DRM_GEM_OBJECT_RESIDENT |
> +					       DRM_GEM_OBJECT_PURGEABLE,
> +					       name);

instead of name can use mem_type_to_name[mem_type].

Will leave it up to decide whether to use switch-case or const char*.

Ensure DRM_GEM_OBJECT_PURGEABLE is not reported for vram0 and vram1.

BR

Himal Ghimiray

> +		}
> +	}
> +}
> +
>   /**
>    * xe_drm_client_fdinfo() - Callback for fdinfo interface
>    * @p: The drm_printer ptr
> @@ -122,6 +223,6 @@ bool xe_drm_client_remove_bo(struct xe_bo *bo)
>    */
>   void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>   {
> -	/* show_meminfo() will be developed here */
> +	show_meminfo(p, file);
>   }
>   #endif
--------------Y3D3DugAC4kYfNKOfzudsKKL
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 31-08-2023 14:35, Tejas Upadhyay
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230831090536.2949934-8-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">Use the newly added drm_print_memory_stats helper to show memory
utilisation of our objects in drm/driver specific fdinfo output.

To collect the stats we walk the per memory regions object lists
and accumulate object size into the respective drm_memory_stats
categories.

Objects with multiple possible placements are reported in multiple
regions for total and shared sizes, while other categories are
counted only for the currently active region.

Signed-off-by: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_bo.h         |  11 +++
 drivers/gpu/drm/xe/xe_drm_client.c | 103 ++++++++++++++++++++++++++++-
 2 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 0823dda0f31b..538a9ec7f4c3 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -6,6 +6,8 @@
 #ifndef _XE_BO_H_
 #define _XE_BO_H_
 
+#include &lt;drm/ttm/ttm_tt.h&gt;
+
 #include &quot;xe_bo_types.h&quot;
 #include &quot;xe_macros.h&quot;
 #include &quot;xe_vm_types.h&quot;
@@ -258,6 +260,15 @@ static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
 	return PAGE_ALIGN(bo-&gt;ttm.base.size);
 }
 
+static inline bool xe_bo_has_pages(struct xe_bo *bo)
+{
+	if ((bo-&gt;ttm.ttm &amp;&amp; ttm_tt_is_populated(bo-&gt;ttm.ttm)) ||
+	    xe_bo_is_vram(bo))
+		return true;
+
+	return false;
+}
+
 void __xe_bo_release_dummy(struct kref *kref);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 00b28a08909f..28b4c8e608f8 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -4,10 +4,12 @@
  */
 
 #include &lt;drm/drm_print.h&gt;
+#include &lt;drm/xe_drm.h&gt;
 #include &lt;linux/kernel.h&gt;
 #include &lt;linux/slab.h&gt;
 #include &lt;linux/types.h&gt;
 
+#include &quot;xe_bo.h&quot;
 #include &quot;xe_bo_types.h&quot;
 #include &quot;xe_device_types.h&quot;
 #include &quot;xe_drm_client.h&quot;
@@ -110,6 +112,105 @@ bool xe_drm_client_remove_bo(struct xe_bo *bo)
 	return true;
 }
 
+static void bo_meminfo(struct xe_bo *bo,
+		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
+{
+	u64 sz = bo-&gt;size;
+	u32 mem_type;
+
+	if (bo-&gt;placement.placement)
+		mem_type = bo-&gt;placement.placement-&gt;mem_type;
+	else
+		mem_type = XE_PL_TT;
+
+	if (bo-&gt;ttm.base.handle_count &gt; 1)
+		stats[mem_type].shared += sz;
+	else
+		stats[mem_type].private += sz;
+
+	if (xe_bo_has_pages(bo)) {
+		stats[mem_type].resident += sz;
+
+		if (!dma_resv_test_signaled(bo-&gt;ttm.base.resv,
+					    dma_resv_usage_rw(true) |
+					    DMA_RESV_USAGE_BOOKKEEP))
+			stats[mem_type].active += sz;
+		else if (mem_type == XE_PL_SYSTEM)
+			stats[mem_type].purgeable += sz;
+	}
+}
+
+static void show_meminfo(struct drm_printer *p, struct drm_file *file)
+{
+	struct drm_memory_stats stats[TTM_NUM_MEM_TYPES] = {};
+	struct xe_file *xef = file-&gt;driver_priv;
+	struct ttm_device *bdev = &amp;xef-&gt;xe-&gt;ttm;
+	struct ttm_resource_manager *man;
+	struct xe_drm_client *client;
+	struct list_head *pos;
+	struct xe_bo *bo;
+	unsigned int id;
+	char name[16];
+	u32 mem_type;
+	int ret = 0;
+
+	client = xef-&gt;client;
+
+	/* Public objects. */
+	spin_lock(&amp;file-&gt;table_lock);
+	idr_for_each_entry(&amp;file-&gt;object_idr, bo, id)
+		bo_meminfo(bo, stats);
+	spin_unlock(&amp;file-&gt;table_lock);
+
+	/* Internal objects. */
+	rcu_read_lock();
+	list_for_each_rcu(pos, &amp;client-&gt;bos_list) {
+		bo = xe_bo_get(list_entry(pos, typeof(*bo),
+					  client_link));
+		if (!bo)
+			continue;
+		bo_meminfo(bo, stats);
+		xe_bo_put(bo);
+	}
+	rcu_read_unlock();
+	for (mem_type = XE_PL_SYSTEM; mem_type &lt; TTM_NUM_MEM_TYPES; ++mem_type) {</pre>
    </blockquote>
    <p>can avoid this switch case with something like</p>
    <p>const char* mem_type_to_name []&nbsp; = {<br>
    </p>
    <p>&quot;system&quot;,&nbsp; /*<span style="white-space: pre-wrap">XE_PL_STOLEN */ </span></p>
    <p><span style="white-space: pre-wrap">&quot;gtt&quot;, </span></p>
    <p><span style="white-space: pre-wrap">&quot;vram0&quot;</span></p>
    <p><span style="white-space: pre-wrap">&quot;vram1&quot;
</span></p>
    <p><span style="white-space: pre-wrap"> NULL,</span></p>
    <p><span style="white-space: pre-wrap">NULL,</span></p>
    <p><span style="white-space: pre-wrap">&quot;stolen&quot;,</span></p>
    <p><span style="white-space: pre-wrap">},
</span></p>
    <blockquote type="cite" cite="mid:20230831090536.2949934-8-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
+
+		switch (mem_type) {
+		case XE_PL_SYSTEM:
+			sprintf(name, &quot;system&quot;);
+			break;
+		case XE_PL_TT:
+			sprintf(name, &quot;gtt&quot;);
+			break;
+		case XE_PL_VRAM0:
+			sprintf(name, &quot;vram%d&quot;, mem_type - XE_PL_VRAM0);
+			break;
+		case XE_PL_VRAM1:
+			sprintf(name, &quot;vram%d&quot;, mem_type - XE_PL_VRAM0);
+			break;
+		case XE_PL_STOLEN:
+			sprintf(name, &quot;stolen&quot;);
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+
+		if (ret == -EINVAL)
+			continue;</pre>
    </blockquote>
    <p>if (! mem_type_to_name[mem_type])</p>
    <p>continue;<br>
    </p>
    <blockquote type="cite" cite="mid:20230831090536.2949934-8-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
+
+		man = ttm_manager_type(bdev, mem_type);</pre>
    </blockquote>
    I assume on single tile platform man will be null for vram1 ? Please
    confirm.<br>
    <blockquote type="cite" cite="mid:20230831090536.2949934-8-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
+
+		if (man) {
+			drm_print_memory_stats(p,
+					       &amp;stats[mem_type],
+					       DRM_GEM_OBJECT_RESIDENT |
+					       DRM_GEM_OBJECT_PURGEABLE,
+					       name);</pre>
    </blockquote>
    <p>instead of name can use mem_type_to_name[mem_type].</p>
    <p>Will leave it up to decide whether to use switch-case or const
      char*.<br>
    </p>
    <p>Ensure <span style="white-space: pre-wrap">DRM_GEM_OBJECT_PURGEABLE is not reported for vram0 and vram1. </span></p>
    <p><span style="white-space: pre-wrap">BR</span></p>
    <p><span style="white-space: pre-wrap">Himal Ghimiray
</span></p>
    <blockquote type="cite" cite="mid:20230831090536.2949934-8-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
+		}
+	}
+}
+
 /**
  * xe_drm_client_fdinfo() - Callback for fdinfo interface
  * @p: The drm_printer ptr
@@ -122,6 +223,6 @@ bool xe_drm_client_remove_bo(struct xe_bo *bo)
  */
 void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	/* show_meminfo() will be developed here */
+	show_meminfo(p, file);
 }
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------Y3D3DugAC4kYfNKOfzudsKKL--
