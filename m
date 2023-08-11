Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8C0EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5274110E6B8;
	Fri, 11 Aug 2023 16:23:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D1110E6B8
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691771036; x=1723307036;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2C/xBfGQEl0hHGlqio7KPaF1RxhtGvG/naOQNprqcn0=;
 b=T9nXk2WHvNBaGaKTZr3Jr9f21zJwux1XZJSOH139LjQOFEzE5uUeROz4
 Dfsa5UFTkbLE2aXpiRjh/D7KMfHQ4bGEv8uyrIXNKrK/LTLf0awyHYr1W
 /aA8RY/lf9VOI7sLM3KeSO4t9ZN5FimLfLxCTbc+h4zYawkknN24qotS4
 ZGF2G5B2QI1j9W7AgUPdIZGYkbv9gqGKvUfsRhD1H7jmfd4MRkleaPSDb
 UAA+UjF+soPh4dcAvVFYHXVhjzs6i5x4A4EbHHJMWZ9dUb87NfeT2yYXY
 TVEh22+NUtE8t+410rkObTTAt/xaGM1g5qzeF7g+j9U+R4ZxThsDjOkON g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="356672792"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="356672792"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="1063364172"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="1063364172"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 11 Aug 2023 09:23:55 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 09:23:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 09:23:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 09:23:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkQnNNddnkqv1C9wzZu/wccALFfWzRESGeAvqm0khp0xjhtzaHfdfxbtJg3FykqjitQdONkrNqN+ch59natXevIhpVgc7d9Iglx5nKu0nGyK+6ucraGxNOpPSJP7oA2wc6RINImMAdsobTYZ6/PdJ4Hco1qvdxlR1Y7AsL0KNEWLF8HaiOU2Ree1mfZo3e82oO3r8eKP5ppq50qle+ObIBliDVbWpc8hIxxHkcx1FvegijqHl8sCCQpxWAoJUpYQsFEarYkU3viEK+400ceDHXtlluIgZVgcv34xq5YOm5v60501TDEU4x8o1YHuhRkNIFv8Dg1kVbz3FI570p76Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5byqAOJDcDW4vjZhXnWPjBxlLAf5gGqhMsl1BWlqBY=;
 b=XyMzEbVO3agkcGF2JdAGsK0L5HrDjvXI2k4tnAQkj86vkiuUbg151nyy8aYluA54AQZi0E2Jho8ZShCuLR0WV88KvRMpCn0IJ7ErZD9mWxr11D/zZbSoVH9KTLbGb/iocApRo5ESlvc8GUyo7PlJKzm/4+FBHqV2g892W+gYg9Qsd+l+0sBwOtd1q4mUOrMYMPUXJ89DogqaEpmLcPoG6RBZo67HWFo2q7gJlim7pyGrx9B9B2x73z7GLbDKpdngVchCND5u7fMADy+Do6jcA/pA9lvdIA0UTYIBUguo3hyC74928SAWHjz+UjHvusAkC6T1JeUFo8+0jVu//7/+WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CYYPR11MB8388.namprd11.prod.outlook.com (2603:10b6:930:c2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.30; Fri, 11 Aug 2023 16:23:54 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 16:23:54 +0000
Date: Fri, 11 Aug 2023 09:23:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230811162347.GH3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-14-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-14-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR06CA0046.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CYYPR11MB8388:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d91275-83db-4ecf-edfe-08db9a875ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i7cQ33vngYPNHxlKB5DWXKaz4M8RaSsYSaV8KORWRZNuc9PwGh23FtjWe/JDhPsxbhOFd3dznE3c+sOhGnd+1ThsLTuAG3df0O6MzmXyEhZpBVPR8pHz8wwF7LA4s0ycyXBd1xNms9RzvQBeyQhvXRoUHdHhaHbdoGKcQpRe+0lRBxO9RUaJiiJxf0TQHY0hakm/S+I04aJXeAHO9ZR3Ksi0UCGzhIDSXvzRGESVLyMZ6NwIcdS/ZOGbsarMgT2yPS6gHusW0D1DRbPbBD1BkV/4DD5fGDa0EUYkS3nDWIIh9/xO6fDXPvtgfYe1oDrQV7bROJx78rsnmP2fTZWlUmaFZXIRLAJ0jK9FLRqrnhPYkSFMiLklN8JGhbsBXznsCiKFJxSkLw3zzD0+eDwCVt73Bv3Cj+w7I8nR6/QvsRnV0nlObq9vmNp7ZuYXz0ti3y7ipFHl7WOlpYGgDI1qtgGVW2efocBvBWcL9GzprH0IgfYAZYnVw73IjWFXwA4sVcdNdJQVa3PG8VU2uB8EFdlWP8j04y99hVZ+LMzR6IZ02NvfBE7uwhOGQYTwboME
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199021)(1800799006)(186006)(82960400001)(38100700002)(86362001)(33656002)(6666004)(5660300002)(8676002)(6486002)(6512007)(107886003)(6862004)(8936002)(1076003)(6506007)(66556008)(478600001)(66476007)(316002)(66946007)(26005)(6636002)(2906002)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3eYXWr5gi8KTjkeQ0th7PkthGdOtjC7vQdgBVPvZ77ltXI/fjLDVcaLqctJ5?=
 =?us-ascii?Q?LMUVIjlS+AcIV8K8FsDGyA+CxGwpVxe7KSjo51hkl57RH9/cZuUBDJ/wNrTs?=
 =?us-ascii?Q?VfehA2ZNBoOQ5JWC+drbZxJ+kh34azs5LS1cqiLSj1bd1jqK31nm3qFAx08T?=
 =?us-ascii?Q?u9vTPNkQB+yaLrMhtHSznG9c350PlhPBtfpQRP5/7KTNtqnO+v5wF6rrKBR9?=
 =?us-ascii?Q?QzkBSdt1BeYLvjjc/SN6PYjhGDLvwHdr4Nc9988KTNf2dZ2w42pmNMuHTOu6?=
 =?us-ascii?Q?0aWan3M7pOP4MRv95O6jRgz5/KgvSkNMwvQNjAt671dM9ahJrBkyGG4nVeUT?=
 =?us-ascii?Q?CSFKEBbd4TZ6mP0PpwT8nWGOR/3ArSyiAQTbrD4mvdJMZ1lBSoEQATvlohKn?=
 =?us-ascii?Q?9Y4luAPbGTZSPc91qd8NvjY6+iNMyxnOlUWBRf2kjHn1ELhPdH86cv6R59ud?=
 =?us-ascii?Q?vMhKMF2Jfki53osNtYAAJt2Im1RQ7P7KB3oOuV4xH7cDBnrglCclNQQ/cp3v?=
 =?us-ascii?Q?eAjYiRp08/hPkSlyp0JAu8Go9tuMzmGv9VKv/dH0CCutEiZlhFINYIW5ruWq?=
 =?us-ascii?Q?ZFZLb8MrGHsju+EE7pzFVFZTnux8JL4XTBkdHY7Yb/UKFvVrnp7HkzicAsWO?=
 =?us-ascii?Q?yg+GR3rbZzvdzJs4YNiPq+tCRbVMy1iplTaVBvsbZbbDX4Fq7D3skpVKEQZ1?=
 =?us-ascii?Q?l9tZBvbnrlY80P8o3lCc07IRDjEK8RkRmZpPjCHdumkAZow822OdKRV7R8Ez?=
 =?us-ascii?Q?W26oF9CvFoGJjOOTvog6FqPVT9H0/xncfUWA4Z3MBI9CpPCBb+EgQEwj4+A6?=
 =?us-ascii?Q?yIeN716YAutHiiC5AoKXmKC8xudvQLfUbR1WLFen8RSv0FL9lRdf/SfrF9Nr?=
 =?us-ascii?Q?wB1fvg/l/ELzWe004T4WF0hZBiC3wiUpdEhwFPkRxxM0BrBkjdKLXgSQNVUg?=
 =?us-ascii?Q?7towekJd2UcIE7o8ofXi5CFWlDEpN2A+c0Ic4gtstrCSoY6BSqX9NnpkJtPq?=
 =?us-ascii?Q?YMJDFT2QfuporTtxQ/JXlWXuOkQxZEsg41YE6h+5EvXA/gfKDYTgAhuegZa+?=
 =?us-ascii?Q?VNmRJW/HjvXCdiV1A8PgaDj4XstTyRmxUk4o6bUC/BXclx91N1N7WpB/K86R?=
 =?us-ascii?Q?+5Va9g3kEEMAqiafiVEL9uqHqT/hZdgaQs01Wem636ZbDQOCtFM+ooUV7gVZ?=
 =?us-ascii?Q?0rHigWci7wRPCvy+md4Ve56e6j4iAmCt3rF4NSMIiK5CUM2dCO3ukgimTumX?=
 =?us-ascii?Q?KhqavUfXgX2qfCe3BXsJfPdT1RGdVUq4TN9ZXIy5xdA+pumrs+tKUcxbkNvQ?=
 =?us-ascii?Q?YXPUmpxyMUtKc8jeOK8B0QYKCZx4pJJD6SbDb0hg5jb+tJikgilwc8ysPv0f?=
 =?us-ascii?Q?w+RDgaqmiZ9lFSgvhcUixWeDYq/jCZY3GNR/S4Ma5TLFvQW5QltGOwf5CtGl?=
 =?us-ascii?Q?56toFhgzc+Dn/WG/r3lGNmWyFuZzxx81N+LwOVZUlxelWlH3vFhu4E2XPoR/?=
 =?us-ascii?Q?JaGMFicV1VgJ2KRzPJuz4jw04ExZWwRyJyCFxJRjVyyDp99tyWmuxyczz5+9?=
 =?us-ascii?Q?rfjmVN9NsLvazaPcfzN9MASA243mTx1dRsuiwrs39TLT0wsJDMhuvuzQomZH?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d91275-83db-4ecf-edfe-08db9a875ae3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 16:23:54.0475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQEJ0AO3C0t+55g+xth+mRwmTqchBqIZs5lT65tqFJOgCybZ2RSjyPRvKujOmYThR6KH5kv2nrYxr073EbrqwowW1dSHp4cSAj+RiKWQqJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8388
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 13/15] drm/xe/lnl: Add LNL platform definition
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 09:06:16AM -0700, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> LNL is an integrated GPU based on the Xe2 architecture.
> 
> Bspec: 70821
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Since this patch is just being posted for the first time, was this
supposed to be a Cc: rather than an r-b?


Matt

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c            | 7 +++++++
>  drivers/gpu/drm/xe/xe_platform_types.h | 1 +
>  include/drm/xe_pciids.h                | 5 +++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 70d5f25c0d208..5e3ffe76cc460 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -342,6 +342,12 @@ static const struct xe_device_desc mtl_desc = {
>  	.has_display = true,
>  };
>  
> +static const struct xe_device_desc lnl_desc = {
> +	PLATFORM(XE_LUNARLAKE),
> +	.has_4tile = true,
> +	.require_force_probe = true,
> +};
> +
>  #undef PLATFORM
>  __diag_pop();
>  
> @@ -382,6 +388,7 @@ static const struct pci_device_id pciidlist[] = {
>  	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
>  	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
>  	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
> +	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, pciidlist);
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index abbb8a1f29a8e..e378a64a0f863 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -21,6 +21,7 @@ enum xe_platform {
>  	XE_DG2,
>  	XE_PVC,
>  	XE_METEORLAKE,
> +	XE_LUNARLAKE,
>  };
>  
>  enum xe_subplatform {
> diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> index 43afd973e153b..29f07a00ac0fd 100644
> --- a/include/drm/xe_pciids.h
> +++ b/include/drm/xe_pciids.h
> @@ -207,4 +207,9 @@
>  	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
>  	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
>  
> +#define XE_LNL_IDS(MACRO__, ...) \
> +	MACRO__(0x6420, ## __VA_ARGS__), \
> +	MACRO__(0x64A0, ## __VA_ARGS__), \
> +	MACRO__(0x64B0, ## __VA_ARGS__)
> +
>  #endif
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
