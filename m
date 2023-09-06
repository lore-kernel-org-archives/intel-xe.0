Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E3DEB8FAF
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 09:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8178F10E1DF;
	Wed,  6 Sep 2023 09:55:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB9510E1DF
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693994111; x=1725530111;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5EehhKN1DnwRzbGzC4egj0VTOeGcrJ0I5Ek+g1nHk0Y=;
 b=Xc41Z5gFchIQzYb3tYYyEBz8cVl0O0JXevbr1Z+hy1/T28kkpe7lk+Tr
 gf+Wfq940YrUXs5qkMvAWF++ROYqW7kCElczGGoZarNsk3aBFpDTSfQ71
 09RAzXBEr260yrTjUyPRbiPcSIsqDV4kA1S19FFbKqoABktqpmvAz66HY
 nVt4wibA8mN1gVL01jTapp7Y1+A0vmTip1Zbi/A+jFiE5LMRbaqe4MM5L
 BQu8QCX0iFVkYnrrjrh5XW8MA//NAw2/nufWItCXJmbnDRtUiDK5lrJie
 FyTIcvXRoZGdALmWMm+cQGL1dgYgRnahTIdZ6Hy8DJh97SFUcbCggCSiO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="376934955"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="376934955"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="811594150"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="811594150"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 02:55:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 02:55:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 02:55:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 02:55:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 02:55:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EI1lc9g8C+h5iqLY8xFo8GPVZZWK+jVNfqJz1d7ZW/NxkMS+pPnqImXp49rDEljgvthczCqb+NRkHM4Qinv9Ra4Vf4OIvHSYtcW50SBFJeU7CrKEijZQJIkS4xekbjUFRdqscdRtMJbzeM1QDR0XU7n96top5h2SOU0+9Pa1hH+v/VwVX6yb7Z6mnG+c/c+fmJdzfChJR4uaCAMHF1QWhHIEZJMDfz0n/FHud+5r+MhKNKRbIm+FrtKxgS12g4q2pNvALAP6DN9ohh2AbHsUOzBlM82KFJ39BndJXka/MYDZyXuf4tCdVhIjGtn1SXM00jDcoy7spxCYdURFd8r58w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsO+3jLbQOVyFuMssvF9bjIpzyIhzTb2irOTH7GhiIc=;
 b=bCNbBVouRVO8nfwSvqUySAI0KJVVrB5olLoj9LUgsVggN8CSHXT5kR8xByhH07jz+6dWHh3lvA3BbcDLPFQEa8d2YuGEmG48DHyWsgLJHXa5e96dYU/QNq2/a+DP5lSrgCdG3REJ7cdmJIYU0L/bCsCf9WbLdIlIdL3F45kKuZyDFT2NLus3dQR61SIcgMq72AINrj6uPI9nN1vuPLFzWmCv4KAdUkkMEklUMtVKm3lYCEYb0RqvpDNzIpjV0/VhJYnT+qMjlVhZlTB1NR5k64hu/x/uGlKoZ+9ANdIPz9jltj01OoV5tCY62qsJ9E6u/8SsV+tL43c5dMLBeqvIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA1PR11MB6781.namprd11.prod.outlook.com (2603:10b6:806:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 09:55:08 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:55:08 +0000
Message-ID: <f42a5b92-63b1-4adb-bbc6-4d479dbb0d37@intel.com>
Date: Wed, 6 Sep 2023 15:24:58 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
 <20230831090536.2949934-6-tejas.upadhyay@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230831090536.2949934-6-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::22) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA1PR11MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: ea45cba1-fc75-4d23-d12c-08dbaebf5a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e8xCXUNSE5tQf1VXFN7Wcf0ROIJmZOQeZdgzsSKtLlpsTq4WXqaEVVM5so8d2zbrYSELKBckVFwEu90NSmAWuJ6Vw3Rgt2AqmdlyDjtOJkVpRXVjfm6Bt8KGUUZLSyOzhYGAXKDl9X9Qet0VPF3/6gDfJBidxCgD2Zu8rMqXi7zBHJkJ427+SmGyzbi3SU6mIJclRlf3kAJ3InFbxB/o1m9e4dP7EqZvp20tnF376Rby3cIC28ilkzLPNJgLcjxxxNTxOHtItdxfJT34vIlctXum67h7cOJZhpizwfijg6XxY6E+4+v8ajVqo2IrHkPsdehakVspMai7HuR5tP9qFvvSvmTC9Ug/KNWqiy1hpO5G/2HxvZirnpe1Lc3GDtyEZLrEdCZRnluCSwBJh/tF7if3h72Ho3U+VbHcS21GR6MaGZtEZg8P3Vb+YXYjO8KVK24Ef1xvhjbsVBxnqjy0BelaYvibrH6MTe8+REvBYTuU4BjaZiNf2SqEIsUw+GO0Hmmhzi8699daha5OvvL/VXmKVYcT44+AokUDeMoMtNi0bGXyPBno4n/pBqokFr4oSXSnqEMmj7FtkLsjeOQ94xRvJjgBETJ56eoh52C8XRv1PM7R5q83dJdT+IJntHGoVBQRnUFnE03wm/axMGi8Hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(366004)(396003)(346002)(1800799009)(186009)(451199024)(6666004)(53546011)(38100700002)(6512007)(82960400001)(86362001)(6486002)(2616005)(31696002)(26005)(107886003)(478600001)(66476007)(66556008)(6506007)(83380400001)(5660300002)(8936002)(4326008)(36756003)(316002)(41300700001)(8676002)(66946007)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXkzZ3lqVUV4VlMwWEN1SHNZcldEZ2RKTC92c2lqRStNSit5c3JNdFNUTysr?=
 =?utf-8?B?SFAzSzVGYkhWUWxXTmh5MDhvdGN1NkFpVHJuK2Mxc3lHWTl5REljSldBR2lQ?=
 =?utf-8?B?UkRuOHJvL3lWLzJrazVSU0RDdGhiYmRBMUZpQzZSNXdES255QUo4dXlZMk42?=
 =?utf-8?B?dnc2d3h2NEdGUzVQTFhYc3dkeHZJOEI3ZndPQ1lTTzJYVUpnbUlJYmU1QkJz?=
 =?utf-8?B?M3IzTUhLcENEN1NCSzd5dGpmZGkxNFNKczUxYkoxalcxcDBXcGlLWGs0bmRY?=
 =?utf-8?B?aXZ4SThsVnVYeGdjb3kySnQ4YllNcFNrRjZFc01CQytCNnRacnlsd1FDbEVo?=
 =?utf-8?B?UzgzWlhudHJhMVlOT2l0TDhBMlpnZjRUMi83MnlFTzBnOWRXQUVwbUdwVTRr?=
 =?utf-8?B?cUVwbElqWmdpVEcrUjl0REVGTlNqOEN4My9QNnovZ0gyVld6djFBeUo3OWN5?=
 =?utf-8?B?MExPaVg5OC9nMGJOY3p3eDFjVHpCMmdCeDliMVk0dVBoNkJUUG5HNE4vK1ha?=
 =?utf-8?B?bFJDOHBzNlAzSzVDcitna0M2YTY1dWpvSXdWNWtkemlwUUVQYmk0SzY5d0tT?=
 =?utf-8?B?Rmg1aFpDVndYRC9KVDBxZ1BpVGlWRFlMck1pVFk3VDcvRENiUkZLM2pLZEVU?=
 =?utf-8?B?WGhQdC9JNGpPaVBvVEwycHpiK3VBNnlvYXBJaDlCbHBITHN6eVNIaVVmc1By?=
 =?utf-8?B?dDhzdTFKMVFtSDFIdjJIc2ZGbjFGQjErM1A5amxqSGQwQlpVaURmeEtiSk9r?=
 =?utf-8?B?UG5seit2VkdBbVpZOW1BRDRITE9uSU1NS3BlY0trWkI3SkdtQkNCZEl5ZVk5?=
 =?utf-8?B?NTZadTh4L0trWUhzeTFUZk4yOFB4RzlVMUh0ZnNXUzZ1K3pNUDl6blNabzc3?=
 =?utf-8?B?bHJTSEVMUzhlUW5FVDFnVFFZOWdsemJibFF4cXlkTTdvR3luUnFaNCthN3V1?=
 =?utf-8?B?T1hFdmNmVWhIc2IyQ1JuUEZnTUdPQ0Z6ank1eEhseEFxblYwNmQ4TWlTSGpC?=
 =?utf-8?B?TkljdlJnNHhJMHYzT2xPTk5USVkwN25LbTFGK1JBcnlmQXJPZVcxUDJjQUtE?=
 =?utf-8?B?WGo0SktMWnhMWCtqTStVejhYdW90TnpsRHVCQ0lsbmlrK1BCNjA2RGU2UVFw?=
 =?utf-8?B?SkNmSE5tbnJLYlZyaVpnZUFmVGIxTUQveTd1dWxQOTE0M2VSdXY5bXJZUVgx?=
 =?utf-8?B?YzQ3d05YelR4ZWV5ZG1WRDNYR0dwbm1hdEthWVVKOVFweWNQSEM2SXUvcU1w?=
 =?utf-8?B?MUQzNHlMT01NRXA1NERiMWZjL2M0TkVCdnVPckd3czEzR3drendJdnowNHh4?=
 =?utf-8?B?a1NWUksxMkd6YUpib1pTZytVSG14MUpTTURBbXFPL0Y1SnkzcXZGZjM1Nld0?=
 =?utf-8?B?K3BpNTBQNVBWV2xFOUZySU15eHFsOUtiNG5FajVQVFozUXVWNTNhYnJpQkxH?=
 =?utf-8?B?K08rTWdqUTZFanlHS3FxemVlSVpISVNHZ2YrZTZ6UFR6VHU3T1RUMzBCeTkz?=
 =?utf-8?B?R2NwL2JGc1hkZGtLclJpUkFIa21sZ2NDSzhxdWtMRnJOUWI1MkFoOHBQTFJ0?=
 =?utf-8?B?ckdFaXI2ZkpDNStNb1ltbGJBRklzam5wSkxvcUVGeE1xd0NVTUpsUkVxd1Jo?=
 =?utf-8?B?WkhRVU1LcEh3aGhXT2NHYWhFRHByK1ZXUEEyY0VFeFY2ZmFaMklBREpxK0Jy?=
 =?utf-8?B?U3hDUUFBRjZjVm9IL0x3amJmZVFaRzBCK0dKeFFBdjd2cG8zcVdVMzNOTnRC?=
 =?utf-8?B?Q0pCZFZYZ3B2am1KTGp3L0JZWllDTTRBSzc1eEYyZTMvMGh1QlBpclVMNmNu?=
 =?utf-8?B?Z1VlcktaeXBZd3lJYXZOOFYrbGFaNGdpbGptTit5NXpQcWsrcVNiZXhKbFYz?=
 =?utf-8?B?T2w2R3FidnlvSnplakcrVHZlc25qSTM5eDg2WUg3Q0loMmhMZkQ3cTAyQUoy?=
 =?utf-8?B?V092MzA4SXY1eHBuWGkyRGxOSmhPTmJ6SVk0MjM1eTQ5cDc5WW5NdnZMbEkv?=
 =?utf-8?B?UE9uM1NlRk50OUlKRkhLdVBsVnNwWS9tOXRkU3VPWHE0dnd5ako5QXNqR2k4?=
 =?utf-8?B?NEtYQjdoemtQTG42ZEp3c0t3VW9ZNll5eWM0WEJBdG5UZk9IN3dPMmZQTHJx?=
 =?utf-8?B?ellHMXJpZlQ3R2hPN2RvMC9LYlNvRkh6TnhhSDhScjhzMmtsa1JqMHFiMk11?=
 =?utf-8?Q?MdF3FT0G6rdtgiuLlEthS8o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea45cba1-fc75-4d23-d12c-08dbaebf5a21
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:55:08.0587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrbtCguP8Kp/jc/reSHA8Dz1uJ88rCjHAmibnvYwi2i69gXIfT+sStRKhP+I7pIS2Ivutnm5clIop2ifmn1VIgyt4ijdNFV5G4c3ftiOr3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6781
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/7] drm/xe: Track page table memory usage
 for client
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


On 31-08-2023 14:35, Tejas Upadhyay wrote:
> Account page table memory usage in the owning client
> memory usage stats.
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 4 +++-
>   drivers/gpu/drm/xe/xe_vm.c | 9 ++++++++-
>   2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5709518e314b..8df83241c5fe 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -7,6 +7,7 @@
>   
>   #include "xe_bo.h"
>   #include "xe_device.h"
> +#include "xe_drm_client.h"
>   #include "xe_gt.h"
>   #include "xe_gt_tlb_invalidation.h"
>   #include "xe_migrate.h"
> @@ -195,7 +196,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>   	pt->bo = bo;
>   	pt->level = level;
>   	pt->base.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
> -
> +	if (vm->xef)
> +		xe_drm_client_add_bo(vm->xef->client, pt->bo);
>   	XE_WARN_ON(level > XE_VM_MAX_LEVEL);
>   
>   	return pt;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f5f832c8ed42..84fb1069fdbb 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -18,6 +18,7 @@
>   
>   #include "xe_bo.h"
>   #include "xe_device.h"
> +#include "xe_drm_client.h"
>   #include "xe_exec_queue.h"
>   #include "xe_gt.h"
>   #include "xe_gt_pagefault.h"
> @@ -1980,6 +1981,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	struct xe_device *xe = to_xe_device(dev);
>   	struct xe_file *xef = to_xe_file(file);
>   	struct drm_xe_vm_create *args = data;
> +	struct xe_tile *tile;
>   	struct xe_vm *vm;
>   	u32 id, asid;
>   	int err;
> @@ -2058,7 +2060,12 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   
>   	args->vm_id = id;
>   	vm->xef = xef;
> -
> +	/* Record BO memory for VM pagetable create aginst client */
> +	for_each_tile(tile, xe, id) {
> +		if (!vm->pt_root[id])
> +			continue;
> +		xe_drm_client_add_bo(vm->xef->client, vm->pt_root[id]->bo);

can be changed to

if (vm->pt_root[id])
	xe_drm_client_add_bo(vm->xef->client, vm->pt_root[id]->bo);

BR
Himal

> +	}
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
>   	/* Warning: Security issue - never enable by default */
>   	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
