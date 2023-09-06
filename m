Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B659EB8FAF
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 09:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E981110E1B5;
	Wed,  6 Sep 2023 09:38:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7768210E184
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 09:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693993131; x=1725529131;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=WPg3wu4zxY4jUFPpnJXVtNvWlhKnoFeqcPjr89KcgS4=;
 b=bL15EU5yXkg0/PjLYd40REymp+gYlX8nWIE2xWCi/fMtXrea5cIpr9OF
 uTiGB7bY6nvRsByRymLMKm/g4LlL3Pq0HqhaaEHtYBnajGvvbuwxx3e3O
 +Dt5Wf144NeUTU158pHPJsz87VLRUW2dEdzwXpRNCUhZIZGyxPGcqBFDR
 p9D68kyhdLlY5Q5j74gew9uJbEeapZM5Q0nlilkYIM4bJLQ56O8sO7JDR
 uE0LJeTpQXjfGrOHxMQb1mZavnBb13KvSXA/6xZa3nOv0sm8XxtQ1BAYv
 JZy7yiv5MZcNzQCOUuH2EuC3zfFDFOEc3CFasUEXTBw3bh4nLuYzhQv82 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="375920302"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
 d="scan'208,217";a="375920302"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="884623741"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
 d="scan'208,217";a="884623741"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 02:38:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 02:38:50 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 02:38:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 02:38:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 02:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MziPR0IS+TEF0Z6sNzmTC23I29efkCyIrYwmfzbaztFhVOLfqbVnF1NUQLoUa2V83qLe3bwx9FhySg6h0+N3jP9iySrHYcuQIQJHc3GtmAj3r9+fW0pqQjPDgN2blVfmnYL4jS7l02Psow/XCfw2jXQZ4mc0F46WhH3J7JZy7Wgjkww7/dBD70f90DuVDHuA079Fc7IsYCvsKDxoexTEwtumgXNab4orGAwrM+qSVfZ747JZfp91NxrRSJoGRLiV2Ly7wZgL/YdLAjrz9AD2whhJxqO9mf/vrasTaoggKAdPPpu7yXSy9OsMwE3GQJfgqK+jxjoOaMFePXne0bvFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBmxB0LW97e/osXpXXEabfdhVK1yJ/g3UFKKzL73/Ck=;
 b=TuA9tfAzP+C7Lvc26gF+I/0WZaw3+vtQ32UmtW1aqZrx35QWqiHVm1ddO3kozQMnSe5u5f5XXcE3jgpXvVWrIsi8nfer1SjeV6JoRtcNx3eb4gPIJFkegGl51uGywE7PL0iWYGvV5Ch5KivmEjwHW+y0K+8tP/GZGwkzUVh9Sp6qd1Cvzibh7C+7x3ziwxfxzKnRojxQKC3b//JZDOw0AfwAAM4Rc83BYyA1VNRuSD1M7pH7S6r4S9uSW+c1UtE8iaP1IxwVjOQCIUKwtSSj7V2aU/+6I6arpajgFWkvBnOcBw7V82oMcM0k0FxZd2YhIzYbtCuk8d7xmeu48/K78g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH0PR11MB5473.namprd11.prod.outlook.com (2603:10b6:610:d4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 09:38:45 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:38:45 +0000
Content-Type: multipart/alternative;
 boundary="------------EkiMTV0KpNOwvYhJDJntPONx"
Message-ID: <42fb6950-bc66-449b-bd9b-138f25f2354d@intel.com>
Date: Wed, 6 Sep 2023 15:08:35 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
 <20230831090536.2949934-4-tejas.upadhyay@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230831090536.2949934-4-tejas.upadhyay@intel.com>
X-ClientProxiedBy: PN3PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH0PR11MB5473:EE_
X-MS-Office365-Filtering-Correlation-Id: ecbb7e18-21ae-4d5a-61e1-08dbaebd104f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WiFY38fswS144Ic4PpIab5sxyyFNwsBDEzR8lfPSqy5FFsYasvFhMppiVwnJaoYwwJKySAn+VMagPHar1fbb47WnPomSzBIl12OTGeOGyjrlXq+L3GEup5u8FEiF6I1m7YdQ4/MD+hu9QfXZTWfHZmkVbmWwXqzZzFaJPz9NQacp3CyH/o1gOmK8Gl4nmPlV54tkTl8s0J6naXn0Gw4ik/4txepelkFntQzT4m0jZ8FlbP/H6+vs6aG/A+9fR9DPtZcJHqJhASZrgWEVbVjrzTW6mBjcHVbwX/z5IjXI2m+PNlga0WZz/YGigMGRC0pb1EFcUdS/iu7/zaQdAf/pim8hDQ5suT9SVvl6hhuqnPL5EbSdJRvCclfsyfkNFZfUIRKRQYh/iK+qZIYQ9Mnu3xdRYqt2fmOYrD18soaW07lPTIH08fYd/ZyJy3YzUmbVzbFZRl1Q2Ool7PU1gUzR6miOm+t41GEC7BvFHNRPmJPMas2P0sYCZrUu88HYhnI+h8f7coYRGgMb3wlswvH16Df4HeLH06aA+JE0eUowdJEk0l365SG+0kfNOplsh0AK+GkHUwypQWGWq4soVfr2VgOzMaT0GkN7E58A6qQekmZrH6QvAUF524Nc6OKDoETgWydNfWEuQzmzYRGk7SgUXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(346002)(376002)(366004)(1800799009)(186009)(451199024)(30864003)(2906002)(38100700002)(82960400001)(36756003)(31696002)(86362001)(2616005)(107886003)(4326008)(6666004)(8676002)(8936002)(26005)(5660300002)(53546011)(66476007)(41300700001)(66556008)(66946007)(6506007)(33964004)(316002)(6512007)(6486002)(83380400001)(478600001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1dETW85QWNhbFFUMTIrQUV4SmpUbVdQOWVJSWQ2REhUTG14Unp5bGhUdDht?=
 =?utf-8?B?Y05ENkRsWU4yZnQzWW5UTzY0cWR2K0pvVGpsMmJYbXdzOTd5dFp1OHcxbUtt?=
 =?utf-8?B?U2hDaE5MMXc3RjdxOXJHaFV4NHFlaWk2WG9GMEF2eEVZY3F1TjNkYjBWRkFk?=
 =?utf-8?B?SHVxSE4rYmQ3MnZ4bVBteWxsSEZuRXNlcUE5TmdQV0NxejV0UTgwTWF0cTVy?=
 =?utf-8?B?NGNpNVZOSUQvUUd6L0EzWjVRVXh3YVg2WDk3QzdJRG1EY1FZUWVGL1hza2or?=
 =?utf-8?B?LzNVb2Z6NHNpZEcwOXo3dmVDZHpobnNxZDhqVTJOQjdaajhWcnQ3UDY1U1NM?=
 =?utf-8?B?UCtTV256b1dVaFpYM092ZVNTYzdlZ2xnZ1JUbThkVXpRRk8vUzl0K1I0ZXhm?=
 =?utf-8?B?SzFoZEdPWENYSW1BaHYrZGVWWHpRUjIvSkZDZzA5WXJsT0FKMTlURmNkU3Ft?=
 =?utf-8?B?V1RTZDc4TUlOR004cG5wVDBCNjFrbVZiRU9NT3VuZ3N5aHU4U2VLT3ZoQ0NM?=
 =?utf-8?B?T0VKbG16MnhhK2xMUzFIVTNvSGkxYXhha3JTUHRldHh2ckhMVTVTQWl2M2NJ?=
 =?utf-8?B?bGJJK1JTR0RLWFRnSkhQakhLVWJocDJpVUMyWGJRcUdkMTRuU1l4S3R3bEk1?=
 =?utf-8?B?dW9WM1NqeC9ROTRxcFBzZzhUTjUxME5uNldnUTRVWno5OFdzc1VhUE5kZDdU?=
 =?utf-8?B?YmxRVFBsZkM1UWRsdVhsTlRvd1RtQ3RvelVHVHBoa2x5YUVFdWdORjJIWUJx?=
 =?utf-8?B?UzgwZ1BmQkFsK1h3NkJRS1FVK1c0UnpvWXZrMXVHNlZLWEhpTzRRelZINGJK?=
 =?utf-8?B?cVZOSmF0ZVpWYXFDTUxPSyt6TXdYTXRuSFhpeGVuSWpRWDNHSXFPZ2RuTTcv?=
 =?utf-8?B?YTRRLzBIMHdHT3Y1SytWTE8rNTdoRWo4VkI1STJ0N0praHhjUEw0SldXa1Ey?=
 =?utf-8?B?Q3lFdFZLQ0lJQkx6K25rTlhsdVdzUUZvVFdBL2pBRHB3cWpUWHhCN1Q2eVlv?=
 =?utf-8?B?SFFwOHBaK24zTS8rbjdTWmxyTmlWd0JodUNFRlJ1aWt3QjdIL1FuNFpJSUVE?=
 =?utf-8?B?azdRcFBMYzc0TUw3dUNGR0dWWW15UHB0VjhXT2dLQzJhWCt4ZEMrZG5YRkoz?=
 =?utf-8?B?RWppQS9BRXFhejNzOUlxbGlvUitlSnRNcWg1amp1Rm42MTZuTGl5WWF6OXI1?=
 =?utf-8?B?UE5HYmlNZ3M1NXplYndqQ3NpTVdjZWk4QlNLRm5XMUVRVjAyMEtyMU05SWIw?=
 =?utf-8?B?L0w1T3pLQzRkM2JqSVc1Rk4vRUJSSWN3clUrWTdwK3JiM1lhb0VsY1IwdkFn?=
 =?utf-8?B?TklyejQ3MXRzNkNWaDFSdzFsUlhKbmdqcU9GS0krWWErdU1NVE1jekN1cG1N?=
 =?utf-8?B?UW5lQm44Y3FZb0FJUHpLZ2lsUTA2Ny9rWXZoc2Z4QnRVaEJRaDB4V1IybnBo?=
 =?utf-8?B?NTlGQTRJR1lJRllqSTIrMTVVQktCandRTVhSU003b1VoL1daWXRzbVVVZmo3?=
 =?utf-8?B?cmw4Sms3U0ZITkNJZTZHUGl1TnlORHJyS3FVUmd6QjZJamluRkJMNkVIRC9E?=
 =?utf-8?B?aXdIU09SeWdzcmI5NTdQeHNua0c2Qkp3MEMrNC9JZk4rNVpNRmtMaDlPTGVn?=
 =?utf-8?B?QjVEMGRLQ3F3R050YncxQ0hSUHAzb2FWQVR5MmdnMmYyOUxtYmcvdWF6bVMx?=
 =?utf-8?B?ME5Ia1dmZEFlV1RRSlp6Z3JjRjF6d093eGZDTm9YTDlhSlp4VUJXcDg5VEtN?=
 =?utf-8?B?TjhieUkwdzRrbGZVMHoxbWlPNVloYXlETmJNYjJ3M0ZwdGdxWDZObzYwVGc3?=
 =?utf-8?B?SHpDQkFNd2RnYXR4SnNZUVJTQmY1UTZkM1VKN2diS0NGUCs5SHY5WW13bUlJ?=
 =?utf-8?B?QXhVYWNqTUJDN0JRWlZwaStJeXA1UGFGbGNmMHYyM0N3OVk4SitqU2FiQ1Y5?=
 =?utf-8?B?ZDJLTlhHSXFTRk52L1R1WkthcVVzS2JBc1ZsWXhpaU9IT2xjdkZvaFBwdzFo?=
 =?utf-8?B?dFhtQnk0d3NRWTA1N1duaHpETUdpVlFxa2tLY0diT2JOaDBwWFB5d2JMUG1q?=
 =?utf-8?B?cVNmTTJXSjN6dXg3YllFSWVkbjc3REd2U1orTEN5L2hXK0d6ZTlRVUtXR2pz?=
 =?utf-8?B?UmhIbGhDUDlSUU8yMnZhc1E3MDVoNkV0R0EyYURIdnRSWjB6UmYyVFlYUXhE?=
 =?utf-8?Q?94LJwjVaiUFWNXoQkWGQ9/Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbb7e18-21ae-4d5a-61e1-08dbaebd104f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:38:45.2220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHRVJEaQGFsYNmuTzvuYNJ5XhQXKP9LfCKcRXVyd0gS/yfklVwwAGiHI3SOgpm1RB9tUMjaioGaQZiX65j+XrtNsDaoa1TtcDhYrK7AXt/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5473
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/7] drm/xe: Add tracking support for bos per
 client
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

--------------EkiMTV0KpNOwvYhJDJntPONx
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 31-08-2023 14:35, Tejas Upadhyay wrote:
> In order to show per client memory consumption, we
> need tracking support APIs to add at every bo consumption
> and removal. Adding APIs here to add tracking calls at
> places wherever it is applicable.
>
> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c         |  7 ++++
>   drivers/gpu/drm/xe/xe_bo_types.h   | 10 ++++++
>   drivers/gpu/drm/xe/xe_drm_client.c | 58 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_drm_client.h | 26 ++++++++++++++
>   4 files changed, 101 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6a8a41dafe88..cde91c3601d1 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -16,6 +16,7 @@
>   
>   #include "xe_device.h"
>   #include "xe_dma_buf.h"
> +#include "xe_drm_client.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
>   #include "xe_map.h"
> @@ -1051,6 +1052,9 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>   	if (bo->vm && xe_bo_is_user(bo))
>   		xe_vm_put(bo->vm);
>   
> +	if (bo->client)
> +		xe_drm_client_remove_bo(bo);
API returns bool, handle it or use void return type.
> +
>   	kfree(bo);
>   }
>   
> @@ -1230,6 +1234,9 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   	bo->ttm.priority = DRM_XE_VMA_PRIORITY_NORMAL;
>   	INIT_LIST_HEAD(&bo->vmas);
>   	INIT_LIST_HEAD(&bo->pinned_link);
> +#ifdef CONFIG_PROC_FS
> +	INIT_LIST_HEAD(&bo->client_link);
> +#endif
>   
>   	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index f6ee920303af..1aef413b6f8a 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -45,6 +45,16 @@ struct xe_bo {
>   	struct ttm_bo_kmap_obj kmap;
>   	/** @pinned_link: link to present / evicted list of pinned BO */
>   	struct list_head pinned_link;
> +#ifdef CONFIG_PROC_FS
> +	/**
> +	 * @client: @xe_drm_client which created the bo
> +	 */
> +	struct xe_drm_client *client;
> +	/**
> +	 * @client_link: Link into @xe_drm_client.objects_list
> +	 */
> +	struct list_head client_link;
> +#endif
>   	/** @props: BO user controlled properties */
>   	struct {
>   		/** @preferred_mem: preferred memory class for this BO */
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index b5dc024b5dd0..00b28a08909f 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -8,8 +8,11 @@
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   
> +#include "xe_bo_types.h"
>   #include "xe_device_types.h"
>   #include "xe_drm_client.h"
> +#include "xe_device_types.h"
> +#include "xe_trace.h"
>   
>   /**
>    * xe_drm_client_alloc() - Allocate drm client
> @@ -31,6 +34,10 @@ struct xe_drm_client *xe_drm_client_alloc(void)
>   
>   	kref_init(&client->kref);
>   
> +#ifdef CONFIG_PROC_FS
> +	spin_lock_init(&client->bos_lock);
> +	INIT_LIST_HEAD(&client->bos_list);
> +#endif
>   	return client;
>   }
>   
> @@ -52,6 +59,57 @@ void __xe_drm_client_free(struct kref *kref)
>   }
>   
>   #ifdef CONFIG_PROC_FS
> +/**
> + * xe_drm_client_add_bo() - Add BO for tracking client mem usage
> + * @client: The drm client ptr
> + * @bo: The xe BO ptr
> + *
> + * Add all BO created by individual drm client by calling this function.
> + * This helps in tracking client memory usage.
> + *
> + * Return: void
> + */
> +void xe_drm_client_add_bo(struct xe_drm_client *client,
> +			  struct xe_bo *bo)
> +{
> +	unsigned long flags;
> +
> +	XE_WARN_ON(bo->client);
> +	XE_WARN_ON(!list_empty(&bo->client_link));
> +
> +	spin_lock_irqsave(&client->bos_lock, flags);
> +	bo->client = xe_drm_client_get(client);
> +	list_add_tail_rcu(&bo->client_link, &client->bos_list);
> +	spin_unlock_irqrestore(&client->bos_lock, flags);
> +}
> +
> +/**
> + * xe_drm_client_remove_bo() - Remove BO for tracking client mem usage
> + * @bo: The xe BO ptr
> + *
> + * Remove all BO removed by individual drm client by calling this function.
> + * This helps in tracking client memory usage.
> + *
> + * Return: void
Wrong return type in comment.
> + */
> +bool xe_drm_client_remove_bo(struct xe_bo *bo)
> +{
> +	struct xe_drm_client *client = bo->client;
> +	unsigned long flags;
> +
> +	/* Object may not be associated with a client. */
> +	if (!client)
> +		return false;

This call is redundant.  API is being called only if client exists, make 
sure to check for bo->client_link too.

Himal

> +
> +	spin_lock_irqsave(&client->bos_lock, flags);
> +	list_del_rcu(&bo->client_link);
> +	spin_unlock_irqrestore(&client->bos_lock, flags);
> +
> +	xe_drm_client_put(client);
> +
> +	return true;
> +}
> +
>   /**
>    * xe_drm_client_fdinfo() - Callback for fdinfo interface
>    * @p: The drm_printer ptr
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
> index dbe3a083c9df..bbbc5d6ce3ae 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.h
> +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> @@ -15,10 +15,23 @@
>   
>   struct drm_file;
>   struct drm_printer;
> +struct xe_bo;
>   
>   struct xe_drm_client {
>   	struct kref kref;
>   	unsigned int id;
> +#ifdef CONFIG_PROC_FS
> +	/**
> +	 * @bos_lock: lock protecting @bos_list
> +	 */
> +	spinlock_t bos_lock;
> +	/**
> +	 * @bos_list: list of bos created by this client
> +	 *
> +	 * Protected by @bos_lock.
> +	 */
> +	struct list_head bos_list;
> +#endif
>   };
>   
>   	static inline struct xe_drm_client *
> @@ -41,5 +54,18 @@ xe_drm_client_get(struct xe_drm_client *client);
>   static inline void xe_drm_client_put(struct xe_drm_client *client);
>   #ifdef CONFIG_PROC_FS
>   void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
> +void xe_drm_client_add_bo(struct xe_drm_client *client,
> +		struct xe_bo *bo);
> +bool xe_drm_client_remove_bo(struct xe_bo *bo);
> +#else
> +static inline void xe_drm_client_add_bo(struct xe_drm_client *client,
> +		struct xe_bo *bo)
> +{
> +}
> +
> +static inline bool xe_drm_client_remove_bo(struct xe_bo *bo)
> +{
> +}
>   #endif
> +
>   #endif
--------------EkiMTV0KpNOwvYhJDJntPONx
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
    <blockquote type="cite" cite="mid:20230831090536.2949934-4-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">In order to show per client memory consumption, we
need tracking support APIs to add at every bo consumption
and removal. Adding APIs here to add tracking calls at
places wherever it is applicable.

Signed-off-by: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_bo.c         |  7 ++++
 drivers/gpu/drm/xe/xe_bo_types.h   | 10 ++++++
 drivers/gpu/drm/xe/xe_drm_client.c | 58 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h | 26 ++++++++++++++
 4 files changed, 101 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6a8a41dafe88..cde91c3601d1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -16,6 +16,7 @@
 
 #include &quot;xe_device.h&quot;
 #include &quot;xe_dma_buf.h&quot;
+#include &quot;xe_drm_client.h&quot;
 #include &quot;xe_ggtt.h&quot;
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_map.h&quot;
@@ -1051,6 +1052,9 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	if (bo-&gt;vm &amp;&amp; xe_bo_is_user(bo))
 		xe_vm_put(bo-&gt;vm);
 
+	if (bo-&gt;client)
+		xe_drm_client_remove_bo(bo);</pre>
    </blockquote>
    API returns bool, handle it or use void return type. <br>
    <blockquote type="cite" cite="mid:20230831090536.2949934-4-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
+
 	kfree(bo);
 }
 
@@ -1230,6 +1234,9 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	bo-&gt;ttm.priority = DRM_XE_VMA_PRIORITY_NORMAL;
 	INIT_LIST_HEAD(&amp;bo-&gt;vmas);
 	INIT_LIST_HEAD(&amp;bo-&gt;pinned_link);
+#ifdef CONFIG_PROC_FS
+	INIT_LIST_HEAD(&amp;bo-&gt;client_link);
+#endif
 
 	drm_gem_private_object_init(&amp;xe-&gt;drm, &amp;bo-&gt;ttm.base, size);
 
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index f6ee920303af..1aef413b6f8a 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -45,6 +45,16 @@ struct xe_bo {
 	struct ttm_bo_kmap_obj kmap;
 	/** @pinned_link: link to present / evicted list of pinned BO */
 	struct list_head pinned_link;
+#ifdef CONFIG_PROC_FS
+	/**
+	 * @client: @xe_drm_client which created the bo
+	 */
+	struct xe_drm_client *client;
+	/**
+	 * @client_link: Link into @xe_drm_client.objects_list
+	 */
+	struct list_head client_link;
+#endif
 	/** @props: BO user controlled properties */
 	struct {
 		/** @preferred_mem: preferred memory class for this BO */
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index b5dc024b5dd0..00b28a08909f 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -8,8 +8,11 @@
 #include &lt;linux/slab.h&gt;
 #include &lt;linux/types.h&gt;
 
+#include &quot;xe_bo_types.h&quot;
 #include &quot;xe_device_types.h&quot;
 #include &quot;xe_drm_client.h&quot;
+#include &quot;xe_device_types.h&quot;
+#include &quot;xe_trace.h&quot;
 
 /**
  * xe_drm_client_alloc() - Allocate drm client
@@ -31,6 +34,10 @@ struct xe_drm_client *xe_drm_client_alloc(void)
 
 	kref_init(&amp;client-&gt;kref);
 
+#ifdef CONFIG_PROC_FS
+	spin_lock_init(&amp;client-&gt;bos_lock);
+	INIT_LIST_HEAD(&amp;client-&gt;bos_list);
+#endif
 	return client;
 }
 
@@ -52,6 +59,57 @@ void __xe_drm_client_free(struct kref *kref)
 }
 
 #ifdef CONFIG_PROC_FS
+/**
+ * xe_drm_client_add_bo() - Add BO for tracking client mem usage
+ * @client: The drm client ptr
+ * @bo: The xe BO ptr
+ *
+ * Add all BO created by individual drm client by calling this function.
+ * This helps in tracking client memory usage.
+ *
+ * Return: void
+ */
+void xe_drm_client_add_bo(struct xe_drm_client *client,
+			  struct xe_bo *bo)
+{
+	unsigned long flags;
+
+	XE_WARN_ON(bo-&gt;client);
+	XE_WARN_ON(!list_empty(&amp;bo-&gt;client_link));
+
+	spin_lock_irqsave(&amp;client-&gt;bos_lock, flags);
+	bo-&gt;client = xe_drm_client_get(client);
+	list_add_tail_rcu(&amp;bo-&gt;client_link, &amp;client-&gt;bos_list);
+	spin_unlock_irqrestore(&amp;client-&gt;bos_lock, flags);
+}
+
+/**
+ * xe_drm_client_remove_bo() - Remove BO for tracking client mem usage
+ * @bo: The xe BO ptr
+ *
+ * Remove all BO removed by individual drm client by calling this function.
+ * This helps in tracking client memory usage.
+ *
+ * Return: void</pre>
    </blockquote>
    Wrong return type in comment.<br>
    <blockquote type="cite" cite="mid:20230831090536.2949934-4-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
+ */
+bool xe_drm_client_remove_bo(struct xe_bo *bo)
+{
+	struct xe_drm_client *client = bo-&gt;client;
+	unsigned long flags;
+
+	/* Object may not be associated with a client. */
+	if (!client)
+		return false;</pre>
    </blockquote>
    <p>This call is redundant.&nbsp; API is being called only if client
      exists, make sure to check for <span style="white-space: pre-wrap">bo-&gt;client_link too.</span></p>
    <p><span style="white-space: pre-wrap">Himal
</span></p>
    <blockquote type="cite" cite="mid:20230831090536.2949934-4-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
+
+	spin_lock_irqsave(&amp;client-&gt;bos_lock, flags);
+	list_del_rcu(&amp;bo-&gt;client_link);
+	spin_unlock_irqrestore(&amp;client-&gt;bos_lock, flags);
+
+	xe_drm_client_put(client);
+
+	return true;
+}
+
 /**
  * xe_drm_client_fdinfo() - Callback for fdinfo interface
  * @p: The drm_printer ptr
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index dbe3a083c9df..bbbc5d6ce3ae 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.h
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -15,10 +15,23 @@
 
 struct drm_file;
 struct drm_printer;
+struct xe_bo;
 
 struct xe_drm_client {
 	struct kref kref;
 	unsigned int id;
+#ifdef CONFIG_PROC_FS
+	/**
+	 * @bos_lock: lock protecting @bos_list
+	 */
+	spinlock_t bos_lock;
+	/**
+	 * @bos_list: list of bos created by this client
+	 *
+	 * Protected by @bos_lock.
+	 */
+	struct list_head bos_list;
+#endif
 };
 
 	static inline struct xe_drm_client *
@@ -41,5 +54,18 @@ xe_drm_client_get(struct xe_drm_client *client);
 static inline void xe_drm_client_put(struct xe_drm_client *client);
 #ifdef CONFIG_PROC_FS
 void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
+void xe_drm_client_add_bo(struct xe_drm_client *client,
+		struct xe_bo *bo);
+bool xe_drm_client_remove_bo(struct xe_bo *bo);
+#else
+static inline void xe_drm_client_add_bo(struct xe_drm_client *client,
+		struct xe_bo *bo)
+{
+}
+
+static inline bool xe_drm_client_remove_bo(struct xe_bo *bo)
+{
+}
 #endif
+
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------EkiMTV0KpNOwvYhJDJntPONx--
