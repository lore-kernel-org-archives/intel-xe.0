Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EC8C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA8F10E4A0;
	Wed, 26 Jul 2023 16:58:22 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5326E10E49E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690390700; x=1721926700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s1K9kqzwTp66LHN0QED+AqEt8gN7ldxXwYvRfEpYw5o=;
 b=jy6pHmRKiXE7ApKsqMoWS3kQ83kLFTFv8NtegQ0iuBXK6AUGx5z9oHeV
 XzzNKbM4SQUtA76Z8mN6p5ksb25fLlfHJJbY0loaagOceTCt/9IthA4H3
 8ZR7+8ZbmdJQSYARp7DhcQvhSeBYXJVzaNQOBs3CkLPbFEQnmRFLoBD4C
 JwI4/7pxVXBjarfZhfduv8A7NMdnaXH/i9eNHuPp3ICb8t3ebgCbIBGAe
 ULQnxETiiMXXAeaXPtkDqhWgkWwoDKtrpiVmsPeG5edlMhVlL5BTJmxk6
 Zu1rVbwvI4WP2NYNmVqLsvEcMoI1Nm4gBeY/1CADJHmXVoAmd1vPMn16O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="368094456"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="368094456"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="796649404"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="796649404"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2023 09:58:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 09:58:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 09:58:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 09:58:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 09:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwkMpd3zg12DTfR4/2M/9ZfyWPK7AaSOLdk6rRVvKFqkyWCLYZhfuq6FU8mcHwEXiD0kN0eBIQGlEUaNzHZagc0HfZLl0I+0XAd2QA1dhcAIl0+8okiNRqC1bI7mkfHVFd0ENaWXYi2yp54PpJWcF/HSd/xzCAI/eb8lHVn3a+PSG/71hAl5ZCpraKpF5m5XgKJVmgmzdCPnWbBx4yanNXjLNPTEmN5Yd+ZBh5vMl8qS+4T4eq9KZKa96Z68ykcM97Hn0/ECNhXuVH9jugmpE3I0vI8k86xX9RG/Ehh31NSqs2LTZ+dqMmfFucozXqC+6tDKcWQVa6IXSnkMoZew+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CdUcA3U9OAToflboLFIFINpRI8Lu8p2RZZNJYJaNkE=;
 b=Pw4c4XDdNTeKBdhSn66JHeszTCgwloY+G3dCu9FIcEl5NN4XbOxEQcAz+z0bEDzdkDzCZFlwxo2Vcx94/+V8ddY8vLB3Vonj6aBguWUREWuT58Gq8STnry1DiDgiHeK7oyScKXguHVzmVBPCh0xTOjC/0yYgmsC19TWxXZjpFrLk5fuAJl7ANpbQ5tNQ/JjCW7J0/ZG74SQtHu5ZYS2K0j4FBMdgJA7wcMJk1JSO11jBCgYpz2X8arohs13oIdZhshWiWSo6FFuqDtMCNQFgUDcyXtpnPk+r3pu6wm0RxxKeki8Tzhu9SlcNdfCNouEF2Dj5c4LFDLxVfu/Khl3zLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB4863.namprd11.prod.outlook.com (2603:10b6:a03:2ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 16:58:17 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 16:58:17 +0000
Date: Wed, 26 Jul 2023 09:58:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230726165814.GO138014@mdroper-desk1.amr.corp.intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
 <20230726160708.3967790-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726160708.3967790-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: afe15555-d03e-490f-7cb0-08db8df981d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +3IvFXXxzqp9xz8CjIlb2cmfLLrxNudCtGZkr/2OloR80iFUdz5QlU3wKA1hqDjeCfDvRdI9SUxxOLWqNLzNOoHNo6CSGCKZ05ppS1hE+Wa4Uftx7JBwXbW9XdIZHrNmerug+NbcdPCdrg0s3dIBZXg6Fyuw+ZSgM3MFD39XfTLZRrIhobqX+gfHRpOTNLvgAa+8Z6jn0RbsEnLHi6AgdeRKOmTLhZ8AXSLo9VWSBbUpk4S3xYtze9lH3BOqpZFU1o36gHstqMWGG+4qTbnj4+fXUm2oc6rA/zV8g6/9mSG8IyU9+QNMaZJcRdMoT5PtluhSfpFVcsgxOY7BgzTpsbrnftc679Wkix1oHk7/WbEySsNj/8/PgDDyJfxv7m+SEFwnJkaqA/KyC85kbmnA8gAz+VnJitmIEjgHScCs4EJPjk1u+A5MY3KEKP848rtICTT6j2qauQLZyP4+1KJ+q59+A+IamgeSVzBpylvSGgUoM06LnOdZSSPKPF6wqfEX/0S3T564fLNEX7/hF0xeZ265e+/CyBkHgySOOvIr9Fky9vZpMYtuzs9cvyIuoQw8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(6486002)(6666004)(82960400001)(478600001)(6512007)(83380400001)(6506007)(1076003)(26005)(66946007)(6636002)(4326008)(66556008)(66476007)(54906003)(186003)(38100700002)(5660300002)(8936002)(8676002)(6862004)(2906002)(41300700001)(316002)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vAz2+RJe+U8ItYmqCjwyj66hGl+idyI9C8UQgh3i/QJ0MmPfVhRTtJPrtZmU?=
 =?us-ascii?Q?gTAtxG5Mc5ZV4V+Y6qh4khYmC7VPWR2KfBRnSNAd+Kbh9ZdFnhCSCqRnheEI?=
 =?us-ascii?Q?iaWHSVF2+jHPwQLW23l1+6myEmur3yKLDKwIHr4fcCKAbcsfEN4Aq1sRVjdL?=
 =?us-ascii?Q?7WkqaNfaqluO4PhXjfaOyriAVIudV6yqunMHbdMBNhXHcRF1EpCMMuDlYGTA?=
 =?us-ascii?Q?48f7iGoddzoOwu5OLL5uxNpUiDgHU+aU3NyDWcf740BYpFZiASJgiHmnniLZ?=
 =?us-ascii?Q?mZJIRYwRHMZLMJYsZbHMGPHQWLBCyX6NyDOBF9/s7JH9DmQG4XRndPF2+DID?=
 =?us-ascii?Q?DK8vXqakSdfgy5Y+aHeKjcXKfiATGywDZ4RAM6jrb8BEbXcZ3bMFARcjxZ9I?=
 =?us-ascii?Q?yCvKN6dUZGMtxS1mj2YtcpsORMdRtChFFkoasLTdVNxr7QOo18bcodmgAoYJ?=
 =?us-ascii?Q?5UwDhpIvdmGG9WjSuul/WzdfCQDUMWu5Z8bHAunuaenoGrYOzFPSpFP/iTMc?=
 =?us-ascii?Q?w9PY2vdMQRvN5FcBpqPrR/yiiovShWUw+3t/M3NdQyg7KfTs2+e5h5xifzZP?=
 =?us-ascii?Q?Uj+FEYJSM/ZKCmW1gEAty58JV+KAIxf6cSPtBuDfauKDLnQCgLlf8jQH5Fq7?=
 =?us-ascii?Q?7skiwG6FHTlROjpwORb0ejMNtGgy/+ApNKTGR4nNJ10M9sGIsGdN78vgCwPc?=
 =?us-ascii?Q?JRvdctHmDoxeBVFVJ7YpKuxNX5tLVF/EKOpQai72/MPZckaC+/Q8CVUWRbd7?=
 =?us-ascii?Q?X6OQxg9ASIhlidvHyuxntJpY8QX3++E4J2ZpH2oxA5J6O8hYlaJzhGEbRVqA?=
 =?us-ascii?Q?AXEOlBDYe4B0hr9zAFQlx6x/FIldlh8qNw0lw7yWlX5+YtrIAy63ibs33VkO?=
 =?us-ascii?Q?8dnQeotXQLdEDlaBzl5kEkJKG8XfIu3dAjJ5paA+adYIJpRFtzQBv4iy8Z2O?=
 =?us-ascii?Q?adV3ZzkDiB0hbvBxig9y0dCesHWCRL+0fAerLCTR9mT3brc8DxJXNNNof+Va?=
 =?us-ascii?Q?hQCTdj1cmnrbNyx6E6pFaeAOJdDehlvwLqa60hkntAILNEL7HKh+tltBfaTX?=
 =?us-ascii?Q?0EGXYPJYib/sZkqgSgHO1gf0hDNR4an8vRAahER9VHdAYHocHWcna3fJD9rx?=
 =?us-ascii?Q?qkByKYr0TsTlay6wz1dssyLA3ulCiSj1pGs2gwMBAF+99sL6CvX3N/yXf9hb?=
 =?us-ascii?Q?U9fPTTRTWxaA0jc1EdHvEjji47lXAH5r7H/eLJzv5IHyEkGjEy8k//0V7fHY?=
 =?us-ascii?Q?HvgKqw1wO4/aWxTAoJ03r1BxOORMSA2Wz+aZaqwG+KAOTFJZpzmzqLugXAFj?=
 =?us-ascii?Q?7d0jaiXZ6C6P8Br5bRTolI8Pmd1gscMvA5GsP36Qt676JosQ9561qbao5bLB?=
 =?us-ascii?Q?FYZgN9STX4WK3dAaU3n8lPWOcx5EHXEZcjk+8zcTNP0Li+JGbf0qldmOSp3E?=
 =?us-ascii?Q?zw19IGIRshKOSUKgs1ayt4kvYDkRqhzdX7SnZtF73xc4/BHZcleA3Tz1aiR4?=
 =?us-ascii?Q?SwMJAhPlf+BxYt5i8Co3quPB8qPCNkK7vxj94IAXf8HtE6+67pBDbt87k0WD?=
 =?us-ascii?Q?vCIHE/N7VC81Gd0LAekG8crutByCH4bZgxZZB1157Q5mYH1d89nOgTufKHMb?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afe15555-d03e-490f-7cb0-08db8df981d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 16:58:16.9093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKpFcClADJRVNyyY3F7JYXDaM77x9mnVzKhyB1kSPtfPDvw2/Buk/B0o3zkexQknLAhDMDCYEZJlxygldFvhXhfDeZj9nS4xrijTdlA3gYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4863
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

On Wed, Jul 26, 2023 at 09:07:04AM -0700, Lucas De Marchi wrote:
> Integrated graphics 1270 and beyond should set the PTE_LM bit in the PTE
> when it's stolen memory. Add a new function, xe_bo_is_stolen_devmem(),
> and use it when encoding the PTE.
> 
> In some places in the spec the PTE bit is called "Local Memory",
> abbreviated as LM, and in others it's called "Device Memory" (DM). Since
> we moved away from "Local Memory" and preferred the "vram" terminology,
> also rename the macros as DM to follow the name of the new function.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c      | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h      |  5 +++--
>  drivers/gpu/drm/xe/xe_ggtt.c    |  4 ++--
>  drivers/gpu/drm/xe/xe_migrate.c |  4 ++--
>  drivers/gpu/drm/xe/xe_pt.c      | 13 +++++++------
>  5 files changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 29813271cc4c..a34a9248ed5c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -80,6 +80,21 @@ bool xe_bo_is_stolen(struct xe_bo *bo)
>  	return bo->ttm.resource->mem_type == XE_PL_STOLEN;
>  }
>  
> +/**
> + * xe_bo_is_stolen_devmem - check if BO is of stolen type accessed via PCI BAR
> + * @bo: The BO
> + *
> + * The stolen memory is accessed through the PCI BAR for both DGFX and some
> + * integrated platforms that have a dedicated bit in the PTE for devmem (DM).
> + *
> + * Returns: true if it's stolen memory accessed via PCI BAR, false otherwise.
> + */
> +bool xe_bo_is_stolen_devmem(struct xe_bo *bo)
> +{
> +	return xe_bo_is_stolen(bo) &&
> +		GRAPHICS_VERx100(xe_bo_device(bo)) >= 1270;
> +}
> +
>  static bool xe_bo_is_user(struct xe_bo *bo)
>  {
>  	return bo->flags & XE_BO_CREATE_USER_BIT;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 894ea0deb34b..b29750a47d23 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -58,9 +58,9 @@
>  #define XE_PDPE_PS_1G			BIT_ULL(7)
>  #define XE_PDE_IPS_64K			BIT_ULL(11)
>  
> -#define XE_GGTT_PTE_LM			BIT_ULL(1)
> +#define XE_GGTT_PTE_DM			BIT_ULL(1)
>  #define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
> -#define XE_PPGTT_PTE_LM			BIT_ULL(11)
> +#define XE_PPGTT_PTE_DM			BIT_ULL(11)
>  #define XE_PDE_64K			BIT_ULL(6)
>  #define XE_PTE_PS64			BIT_ULL(8)
>  #define XE_PTE_NULL			BIT_ULL(9)
> @@ -230,6 +230,7 @@ void xe_bo_vunmap(struct xe_bo *bo);
>  bool mem_type_is_vram(u32 mem_type);
>  bool xe_bo_is_vram(struct xe_bo *bo);
>  bool xe_bo_is_stolen(struct xe_bo *bo);
> +bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
>  uint64_t vram_region_gpu_offset(struct ttm_resource *res);
>  
>  bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index f57dd8703d93..9b6bff724613 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -35,8 +35,8 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>  	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>  	pte |= XE_PAGE_PRESENT;
>  
> -	if (xe_bo_is_vram(bo))
> -		pte |= XE_GGTT_PTE_LM;
> +	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> +		pte |= XE_GGTT_PTE_DM;
>  
>  	/* FIXME: vfunc + pass in caching rules */
>  	if (xe->info.platform == XE_METEORLAKE) {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 2a4b22c3a024..aad76a6a8094 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -258,7 +258,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		level = 2;
>  		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
>  		flags = XE_PAGE_RW | XE_PAGE_PRESENT | PPAT_CACHED |
> -			XE_PPGTT_PTE_LM | XE_PDPE_PS_1G;
> +			XE_PPGTT_PTE_DM | XE_PDPE_PS_1G;
>  
>  		/*
>  		 * Use 1GB pages, it shouldn't matter the physical amount of
> @@ -463,7 +463,7 @@ static void emit_pte(struct xe_migrate *m,
>  				}
>  
>  				addr += vram_region_gpu_offset(bo->ttm.resource);
> -				addr |= XE_PPGTT_PTE_LM;
> +				addr |= XE_PPGTT_PTE_DM;
>  			}
>  			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
>  			bb->cs[bb->len++] = lower_32_bits(addr);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 38ccc96c4584..debfe6860c28 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -127,8 +127,8 @@ u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>  	u64 pte;
>  
>  	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
> -	if (xe_bo_is_vram(bo))
> -		pte |= XE_PPGTT_PTE_LM;
> +	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> +		pte |= XE_PPGTT_PTE_DM;

Can stolen memory ever get bound into a PPGTT?  Either way, the
condition definitely doesn't hurt anything.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  
>  	return __pte_encode(pte, cache, NULL, pt_level);
>  }
> @@ -714,7 +714,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
>  {
>  	struct xe_bo *bo = xe_vma_bo(vma);
> -	bool is_vram = !xe_vma_is_userptr(vma) && bo && xe_bo_is_vram(bo);
> +	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
> +		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
>  	struct xe_res_cursor curs;
>  	struct xe_pt_stage_bind_walk xe_walk = {
>  		.base = {
> @@ -728,13 +729,13 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		.va_curs_start = xe_vma_start(vma),
>  		.vma = vma,
>  		.wupd.entries = entries,
> -		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_vram,
> +		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
>  	};
>  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
>  
> -	if (is_vram) {
> -		xe_walk.default_pte = XE_PPGTT_PTE_LM;
> +	if (is_devmem) {
> +		xe_walk.default_pte = XE_PPGTT_PTE_DM;
>  		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>  			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>  		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
