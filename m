Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90446C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C41F10E035;
	Wed, 26 Jul 2023 17:51:17 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449D210E035
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 17:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690393875; x=1721929875;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/FTsq4kndlmzqR+hHANuarbPdEUgoy3UbQNPCJmEucM=;
 b=VMNRuAGD4eX6v8kpC5uqWe2D2yvQqrymdFlXcmle/VXUJXXk8vW/qZew
 CNUQPVVGk4nTv0AyvUfsx/d1WULOsAOYWXEXIzKBkIp1J4KeDcRP7pqmF
 sqzr6LL4VWs6ayj/sY61+iScdoLKIbO4nFi80kRx9leb+HmUS7ABSOB/B
 712Eeh6a4ZhGJFthDhtCP6X+Z58Q75KKMxSI5MmanC0caxDwunJkoRiOA
 CZE9IMYeMoTcdQT8uRuw2kUjTIYdjEgykHRz//6ToyKiSs+8Fm8NifWqj
 +WkuUBu2kuewzkt4Nv3cdV2ELjfOppttiLSlE9YUhkv73/MhhaPFhw7Ug g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358087351"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="358087351"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 10:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="796671185"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="796671185"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2023 10:51:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:51:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:51:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 10:51:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 10:51:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BabOKYWmySaWV5qo4d0VmWA0Bkt/Ia3fkdVWrSHUBbpr66IVcliyqghDAY7rRH+DnVa19tBgBCnzxtYIYhs+dj0nk/MkFEBC8yovmSlrlHeFtaRmR/l+uktK+yPpzoeo5mrO79e8ULvviLJp1uEWfTL4h+0yKV8fXkHGbZWWfmjaxcSpBjIYLg6FzxnGGqNyFaWdYDE1d1u0w4BxuQkb4HTqHQ6dlHITIY0b5CIpwe1ktM1XKwjON4BI4RywNEcnS9XtpTnbmKkluOwp2bQ66ytBSivdTR5mhAG+1WAgQudT8QyK3rgIqVHp5dsrOsCa1S3uOnZjIiYTVfDonSoaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNbA3V9RmDo3Tp9xASuF0CGxulA8NtrcIgDgg/9fN1M=;
 b=A2ALwJUw6FA0dBWGr4zZG9z2EUHNuWN53vDgwRW9lt/Lt27pYBxxsWlDbAJCTzVAc+JizVsLF+NsNV6BzKX8iBhmxiaoyTNbxk7+GEdXnpGwSI8bBGUdsqR4ItE1YsTQ44qxJB5k9YdPbbpvDFn2p73ZTAPR9hlhqpGKeuFMt7/E2SGwW9fUoYqrcjDYBLHkhEZ/CbovB2Tv4EUTwe6U/Fl7eVPU9MfYYFyGGv5C3NePtV0MU7tVR05n06m8Dj2o53+seL9ToDntql8xFBDBXaifTRocxaaVg3EJW98tGQukABJSvzLr9iK0Fnwes9Ypq9kkNtsl7waX+bxBi1SwyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4606.namprd11.prod.outlook.com (2603:10b6:806:71::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 17:51:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 17:51:12 +0000
Date: Wed, 26 Jul 2023 14:51:06 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <vgqmdgzb3be6qkzxi3p47ihyvwqpxtxi2pvldp62eiosjk23vr@7jy7dfyedzdt>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
 <20230726160708.3967790-7-lucas.demarchi@intel.com>
 <20230726165814.GO138014@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230726165814.GO138014@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4606:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f6b79c-12e9-40bc-bf8e-08db8e00e645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TCXY+Gp+JGtJfEy+MttPUA/kdBXKGHY/xErAuQLeg8L/4OmyU2e65eNECj8S/8OYQkfYg9AGvby4bT1YoVdN7BO9oAL3yfO0Cbqnph7AgLFgvPUbj/444e0dyz7uJ7boqQuRXc9MvCD2RkuitmrKJKGy71t62eG9ED6pVNb9zAjv9b/lYtj+2jOkkP5zXISncdFbmiOXhqPCT4aAY6YYrWhB3MW5/g62hhZlYEp6Ykx9bO7QDcyH8ETkSerEI7s5BLk05zQtaaepAovIo9Qouza1sGSjaUGym8mIejdZUXgxyLWgGHKZTQt9MQ8PVQSXrVK1pbqldIx0cGo+d29J2dPLu5pFRcuVXkckgCJbg153qEPEvxUzT42jEnLwgARtdoGTERUjqeBqa2sqV5d2J/q3v3rSEDS6WOzNWMHc+C6/P61Zv2H+QDo1KtRe9enaCyqjmqOmbqcrPQtjEI6yJEbQlfZL8kJqzdnAlzjFo/SHv+b+JUc3hrCa4anKOfGMR1T4+dNnzLbw3MxJIYDsRcmPSiBabi2XH+evLDr/pFN+5VECPn/gNbuyv6xMzcoE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(316002)(41300700001)(2906002)(5660300002)(8936002)(8676002)(6862004)(33716001)(86362001)(26005)(6506007)(107886003)(6512007)(9686003)(478600001)(6666004)(6486002)(82960400001)(83380400001)(186003)(38100700002)(66476007)(66946007)(66556008)(6636002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CFyU9dLfuldF/XmcezLcukSHgn/zO1S4TQjFNlG3BA1FAuYH9Lt6et72nVuO?=
 =?us-ascii?Q?Te9saa2AkT6e3Ua0uU83sjwWQSCHg37EImXkbkwuMdoTiIWYYRuW/4z+YDJq?=
 =?us-ascii?Q?//HoOieTirbkBdmh+7obCbP0fkiINhkv+YIV4PjAGTR28cT+lkCd1JDuCBwZ?=
 =?us-ascii?Q?sj0+oDfXRb7rTls0aOwm5DjBlCGD5LhCauWt4a8CvI2v0m0IvneRKWOUM68N?=
 =?us-ascii?Q?+MScXmr98BtyaZpeoyXBJEydbfFpG2JW24HhejV0fbD3KEFqUxG/LLK5Argp?=
 =?us-ascii?Q?r0FjH0zDkjQ9XDT4F26c/qNk/OgpwmbBJ6QiEY4EQkygYSf53M0husP60pGf?=
 =?us-ascii?Q?ivlWKbsgSC82gr2VcyELompxPqsJxi4dd3Rztz+6n4WCuRwIGvortallQF6Q?=
 =?us-ascii?Q?MdFq7cbQGalBX1Xq6Q9aI/NRODajiTvhwKiGEzYlS8xUQyE9x2qNNKFGUi14?=
 =?us-ascii?Q?qFZUNvvuyFjorprlY+nIWCYrQGBHz2maW6bMFejbDrMouo0Fk9gDEqgYuf7j?=
 =?us-ascii?Q?fp3epBue0xtaC8HM5rqnxtgynBDyZPRj4fUVxMfCpx6LxSFGlnLap9sr0x8w?=
 =?us-ascii?Q?wEZXFConx9SbsCSo8QU7kY/hKgx3RJRAFuzBpFqr3c0uqQ9pbZxIoegpy0h+?=
 =?us-ascii?Q?ML9f319aAOUFd1KyKeopuVQ/8MvsdQSxWJrMHvEgprdtZVzVdiQQ5Z8RCjRB?=
 =?us-ascii?Q?GKZbw0Wde00GVhuUrIhu8BDh7Dpvqc6NuIvQdakWpstCTnQer7zeW1SfvsaY?=
 =?us-ascii?Q?ndgE+gxRW7OANnKnOv4a5rjkLMRItRaikKor8wk/OEXmyNaFCKuNWV88lHei?=
 =?us-ascii?Q?lS8XdLiUcRigOnfz7s9GYrPgjPeBKKqo6QSO9L8HsvyzE1oJjTnxLzbAnSwB?=
 =?us-ascii?Q?+foHmjSOwdb90Quaklngini2tWPJV36riUEW4jiHH68iaTysc8DAEEf0+CmA?=
 =?us-ascii?Q?u4SSjbaIs+4/A8k6GONjaobJiR1Ao5RcGe8yDBNQPoV+5DNvKPZVvoyqhCXY?=
 =?us-ascii?Q?t5clYcCJtHwWHDBr994IBqnROwtNYBJKFNxQaaWBtCVXWrzz0SW85jhffpTX?=
 =?us-ascii?Q?txI+QdFS7FRntWneivcWhqP+5aHmR7Krzo1jz/wyg7yucLT+j9J8g23v4RI1?=
 =?us-ascii?Q?nHO/U6ljCfrY7GWTL280ASUWvXrC+dvsjjC/y9jR6ydZQlkgx4syPKCVatfQ?=
 =?us-ascii?Q?LHqL5Jqv2xXbTuszYopcYSdor6f22YWYTa/YYUzmGpxQ+MfWeS5+pm540MVj?=
 =?us-ascii?Q?vOdsej6r5LABA65yLdY1IYX0NZQc+oE+sQbSwvDrStPvNlZ314uW3KtTZRmf?=
 =?us-ascii?Q?+crILWA3/oLZBQpMYmL3/hUb47D6KtfKTEN24SJhny1++DazBfVEl/hbem3a?=
 =?us-ascii?Q?nakEj0BOGTUXr2a0gKdeO/923FIUDbkBAkhEiEIGW2BeLqRYHXzw0D6k1EEm?=
 =?us-ascii?Q?M99KQewZ566K53Q1vkw8TpkpoV5TskJy6XXd2YljwoCFDtvfgeY0SoNfjMdR?=
 =?us-ascii?Q?743LxWROuwc1cIIaMY2nssnddfLwErLArbWGhO80DHnw3MMNcBFg/8UG4Cp1?=
 =?us-ascii?Q?Y24jIN1cUEmNUyAxCDEQUKzXYBoil1doZnnBg+9WT8a2ihXTREB8lPkPvrQC?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f6b79c-12e9-40bc-bf8e-08db8e00e645
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 17:51:12.0792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KshuBY3rkr/6iSiU6jxfKY3j7lnIoQo/JpS77wdjq9PBIhW5uZPsGNAip5g5jKNxFs7elNG824aZuV4evqrgyCFcUCK2lKoX/GDu629cY0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4606
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 06/10] drm/xe: Set PTE_DM bit for stolen
 on MTL
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 09:58:14AM -0700, Matt Roper wrote:
>On Wed, Jul 26, 2023 at 09:07:04AM -0700, Lucas De Marchi wrote:
>> Integrated graphics 1270 and beyond should set the PTE_LM bit in the PTE
>> when it's stolen memory. Add a new function, xe_bo_is_stolen_devmem(),
>> and use it when encoding the PTE.
>>
>> In some places in the spec the PTE bit is called "Local Memory",
>> abbreviated as LM, and in others it's called "Device Memory" (DM). Since
>> we moved away from "Local Memory" and preferred the "vram" terminology,
>> also rename the macros as DM to follow the name of the new function.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_bo.c      | 15 +++++++++++++++
>>  drivers/gpu/drm/xe/xe_bo.h      |  5 +++--
>>  drivers/gpu/drm/xe/xe_ggtt.c    |  4 ++--
>>  drivers/gpu/drm/xe/xe_migrate.c |  4 ++--
>>  drivers/gpu/drm/xe/xe_pt.c      | 13 +++++++------
>>  5 files changed, 29 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 29813271cc4c..a34a9248ed5c 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -80,6 +80,21 @@ bool xe_bo_is_stolen(struct xe_bo *bo)
>>  	return bo->ttm.resource->mem_type == XE_PL_STOLEN;
>>  }
>>
>> +/**
>> + * xe_bo_is_stolen_devmem - check if BO is of stolen type accessed via PCI BAR
>> + * @bo: The BO
>> + *
>> + * The stolen memory is accessed through the PCI BAR for both DGFX and some
>> + * integrated platforms that have a dedicated bit in the PTE for devmem (DM).
>> + *
>> + * Returns: true if it's stolen memory accessed via PCI BAR, false otherwise.
>> + */
>> +bool xe_bo_is_stolen_devmem(struct xe_bo *bo)
>> +{
>> +	return xe_bo_is_stolen(bo) &&
>> +		GRAPHICS_VERx100(xe_bo_device(bo)) >= 1270;
>> +}
>> +
>>  static bool xe_bo_is_user(struct xe_bo *bo)
>>  {
>>  	return bo->flags & XE_BO_CREATE_USER_BIT;
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 894ea0deb34b..b29750a47d23 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -58,9 +58,9 @@
>>  #define XE_PDPE_PS_1G			BIT_ULL(7)
>>  #define XE_PDE_IPS_64K			BIT_ULL(11)
>>
>> -#define XE_GGTT_PTE_LM			BIT_ULL(1)
>> +#define XE_GGTT_PTE_DM			BIT_ULL(1)
>>  #define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
>> -#define XE_PPGTT_PTE_LM			BIT_ULL(11)
>> +#define XE_PPGTT_PTE_DM			BIT_ULL(11)
>>  #define XE_PDE_64K			BIT_ULL(6)
>>  #define XE_PTE_PS64			BIT_ULL(8)
>>  #define XE_PTE_NULL			BIT_ULL(9)
>> @@ -230,6 +230,7 @@ void xe_bo_vunmap(struct xe_bo *bo);
>>  bool mem_type_is_vram(u32 mem_type);
>>  bool xe_bo_is_vram(struct xe_bo *bo);
>>  bool xe_bo_is_stolen(struct xe_bo *bo);
>> +bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
>>  uint64_t vram_region_gpu_offset(struct ttm_resource *res);
>>
>>  bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index f57dd8703d93..9b6bff724613 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -35,8 +35,8 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>>  	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>>  	pte |= XE_PAGE_PRESENT;
>>
>> -	if (xe_bo_is_vram(bo))
>> -		pte |= XE_GGTT_PTE_LM;
>> +	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>> +		pte |= XE_GGTT_PTE_DM;
>>
>>  	/* FIXME: vfunc + pass in caching rules */
>>  	if (xe->info.platform == XE_METEORLAKE) {
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 2a4b22c3a024..aad76a6a8094 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -258,7 +258,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>  		level = 2;
>>  		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
>>  		flags = XE_PAGE_RW | XE_PAGE_PRESENT | PPAT_CACHED |
>> -			XE_PPGTT_PTE_LM | XE_PDPE_PS_1G;
>> +			XE_PPGTT_PTE_DM | XE_PDPE_PS_1G;
>>
>>  		/*
>>  		 * Use 1GB pages, it shouldn't matter the physical amount of
>> @@ -463,7 +463,7 @@ static void emit_pte(struct xe_migrate *m,
>>  				}
>>
>>  				addr += vram_region_gpu_offset(bo->ttm.resource);
>> -				addr |= XE_PPGTT_PTE_LM;
>> +				addr |= XE_PPGTT_PTE_DM;
>>  			}
>>  			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
>>  			bb->cs[bb->len++] = lower_32_bits(addr);
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 38ccc96c4584..debfe6860c28 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -127,8 +127,8 @@ u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>>  	u64 pte;
>>
>>  	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
>> -	if (xe_bo_is_vram(bo))
>> -		pte |= XE_PPGTT_PTE_LM;
>> +	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>> +		pte |= XE_PPGTT_PTE_DM;
>
>Can stolen memory ever get bound into a PPGTT?  Either way, the
>condition definitely doesn't hurt anything.

I don't think we have any case, but according to HAS 1809192879
in theory we could have. I thought I had seem something in the bspec,
but I couldn't find it today.

I can't really find a use case for it since we don't expose it to
usersapce.

Lucas De Marchi

>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>>
>>  	return __pte_encode(pte, cache, NULL, pt_level);
>>  }
>> @@ -714,7 +714,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>  		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
>>  {
>>  	struct xe_bo *bo = xe_vma_bo(vma);
>> -	bool is_vram = !xe_vma_is_userptr(vma) && bo && xe_bo_is_vram(bo);
>> +	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
>> +		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
>>  	struct xe_res_cursor curs;
>>  	struct xe_pt_stage_bind_walk xe_walk = {
>>  		.base = {
>> @@ -728,13 +729,13 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>  		.va_curs_start = xe_vma_start(vma),
>>  		.vma = vma,
>>  		.wupd.entries = entries,
>> -		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_vram,
>> +		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
>>  	};
>>  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>>  	int ret;
>>
>> -	if (is_vram) {
>> -		xe_walk.default_pte = XE_PPGTT_PTE_LM;
>> +	if (is_devmem) {
>> +		xe_walk.default_pte = XE_PPGTT_PTE_DM;
>>  		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>>  			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>>  		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
