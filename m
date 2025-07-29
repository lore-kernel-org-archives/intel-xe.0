Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08209C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 04:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CD510E1C4;
	Tue, 29 Jul 2025 04:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZQiQ/fq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BBE10E1C4
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753762710; x=1785298710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/0tb7NvQag5C9/eM7sp6edwEE8OrwUNt3oLaGryHCo4=;
 b=QZQiQ/fqNBQmxZ9QAq0z8//DdPMV51OF9alidwLy8dZLeE0n1qZtTXNx
 ZNUbUN1JZepBFuELxFcX4OjENc7ojeqLEdXQVFyHIqwHeHFZ6cS2nvpSz
 XmDvT1d7GTuhW7b/zhVUAHfE5X366oCE1fXGOaicxEt5HYLFL7lTUHEo9
 i4ULg8nUljUM39uMlnXStnYiUYwtsS4k6uksLwCD2upxIOvxjP++uKAgy
 jT9jxjlrG/vp9pmyZJ3j2iTMt5OU9MTCEcutQLoPvq/voSmtTKCdnYyxe
 YNmTv8tArNYJEKuCFtK8jclP7dLda90BDk9h7eloyEcmOTcbBEH5YFZSk A==;
X-CSE-ConnectionGUID: 4vpV9XkkSeab/QOp9z+hhg==
X-CSE-MsgGUID: yEtW6EXQR6WJ2MeHJ2UZRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59847714"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="59847714"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:18:30 -0700
X-CSE-ConnectionGUID: gp908wgCRR+4iZYXYDCdLg==
X-CSE-MsgGUID: cqkzl1tuQN66p8roXNFTJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="199735675"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:18:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:18:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 21:18:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:18:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1DI5ZbvdnD64xmGVXhYmwviMr3wGzFpEHzcFEAASF3uy7NHQYkmaVhmYcRjam8Y8Es+Gh105tPfnye/HfonSPrM2MraJiH8ccGt7UJUyD+3VaXzl/3khAnSQRCfW0xjF8ctic/Ok+VJ5hqBnHicpr/SAxZD0og05gCckJ5+din4ux3dcm8snslc59+6WAvlxvtjadrlHShd1VRQOhvA2MFmwAcI6/uTD6rH0G71xy8RNsSp2eKUL597yP3z+PV5q6Se/smnRx6KwHcEStl6JrFQ368XJsba6LdqzFl6VZACRv3TuS/b3sCvp8mDU+wfJHfqUM2vErYCo0GlMs786g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HFsYd356KVKSEWUPIvF4NwqqFcOIPSMsNmh0m0F2OY=;
 b=uwxwv8443+7mbHyv8XcrHAku/LH87iKv8THqNblsg3G1fhdRFA9Qc28hbBTiVunAl94a4neTLosxQ0XIW0PgJ+4XWq72nNOx4WfS7DnRAXk4rtLNoIk4lOtb0+k3BuWYviMOxPET2YQveUEo9E3zDQVWBHILrM92ikwpEJwIu/5kOQiBlZCvZZJvEMKmKfYf1ZBgnIqqjHQv7Mjxnsm3srCbUqTRxRHIW8kbQMQ54JZrUIyQNKkNy9501YRUbUIm1BUNDt4G+IM4YFz7JHCiMgD77JrtQcHPpYlEUJ4pDvLOFABC35v/vJrgdnuvus9jUNwpnsJSau3G47iIxSeb2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 04:18:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 04:18:25 +0000
Date: Mon, 28 Jul 2025 21:18:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 17/23] drm/xe/bo: Update atomic_access attribute on
 madvise
Message-ID: <aIhLjxvqsun2ZKmv@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-18-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250722133526.3550547-18-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:303:b9::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: c03dd1c4-3e87-4ad9-1136-08ddce56f691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?liGsPDYzHp+z/szYEVGB2hNhmtfUfvHkmZ7ymAJJu2vZxrcqQeEPv9WSxR35?=
 =?us-ascii?Q?5EdtCvefmOxGROk2oyrP/Si3krzEfiJ3pjjCybhYeM/Y3gUNi1yvzkcN3PYp?=
 =?us-ascii?Q?n+zdfQoFNE92GI9Ypcop8OycymdzqdGfZdClHvWnjhp0UJITcUZc5QT793Fi?=
 =?us-ascii?Q?Eol58tnATZkxsKOedeP/j5L7tBmfxEG8R1NzWdjZGWkt/jL8h53RZErZLP9M?=
 =?us-ascii?Q?sMKuaCIZbO1gDR+oWZmCk0jG/MFHu3TqPBqTAmdj0j2SlCBJHO43W9Dz3LPw?=
 =?us-ascii?Q?5IPvOllyQlex2SNktP/qSmb2MNxPB4P7C6VsyQuXPG3BtQi5573sJSQJmRUF?=
 =?us-ascii?Q?50XPOJjuQpXnvdIA7XL2I3uX+5drcvx0iCtlnJ2f7ml4B20urfVuekf767UW?=
 =?us-ascii?Q?K3nkOYZMuVxUw7/lHTdCKuCrYIvAowy3d42vY/7M9O0/FZoJyMgJCVT4zJ+U?=
 =?us-ascii?Q?3/2zQ1jQK9SmjbEtOWtLVGtob2QFh93FCLF/Z6C2DdbWnSuzAtUfehrThbsw?=
 =?us-ascii?Q?bVzJ6FlYM+hAlTwAwUX/X5R8K9fFeFKYL89wBXwaWtHm7KNpiKNKqG85/5jw?=
 =?us-ascii?Q?c7052YKgY2mtcnelJRpoW8DFDMyYSOLvQs2ypfDmYq4g62cerSihUxcP8+tu?=
 =?us-ascii?Q?0Go1AjLjJWSzU4sS8i1pmKojicctrOi6L+ksXTcbDlM5ULWJdnxGywYDDGXc?=
 =?us-ascii?Q?qPnYG2n8Qm4N5Ehtk4sJ76K3G9Aoc4BD40Kktlla5y4859CgljxksR+PYvpc?=
 =?us-ascii?Q?MZe6J+fwupiVMKg7KSD1cV8fyW+WIsil9rlvXa9+CbjP25phdEVaxJZZ497I?=
 =?us-ascii?Q?XL4X3vgSZu0J2I96VbCQC0qU2lGiDCg89wMmJwAXmOx5kOcw4wHdf+dFuHtf?=
 =?us-ascii?Q?eD7qncH3lBBaoqR2LRaVJeTPlfm7ahyXWRRyLIrvGyGt2hr/fj6Iv0SWxoyA?=
 =?us-ascii?Q?iDyf0amwTDVZIxf3cymYBPPA9yRkc5dawm3NsINquRASIEnEPGFZ7PXSlp29?=
 =?us-ascii?Q?/ECbMhaP9jzuRJbTRlggAf29gnepSAb+ki9bTrt5zVQ0HePd2n26cUurl2PA?=
 =?us-ascii?Q?eXYU/s/QfJstFn0FA5qiX3QI7GlooRHKVlGa6KPRSACIyXiW43j+FYz693wc?=
 =?us-ascii?Q?is9r0DY04e98iYvOcPtfMOjbuLHjPZxMR5lOoe8JtR+xe+cE3O9hqoKUvmIK?=
 =?us-ascii?Q?FuVrSvT/6vaNbGKSQ08Tdv/w2XH/oSvcd2F8Cu14q1JoZk4OXn0rHQ1/fRq7?=
 =?us-ascii?Q?AzexTQgm1BqWG/rD4P8SKs3yxrJr30dTNoNNFZ1s3yGTrLeKPP0kHBz4ih3o?=
 =?us-ascii?Q?qtFr0zcNOS4SgGgUtzE29428MTMZuM3OhxxNGzgB9i6lcb8VZGksDtUS2UdQ?=
 =?us-ascii?Q?sGyr9jUEda/aKj4gjA7FgLusVWjXMbX3sv1UhXQjGwUlRs8FGp+7DyxSk9WH?=
 =?us-ascii?Q?+xvi8jmHLAw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WBDCdwRLMdEBn0zjP/yMRZshZR6LpfYL+Ro9K4R7+4YXF2/sF+ORmaN1qIve?=
 =?us-ascii?Q?DjErHUPt7NK2E+SGjGYIcaNEFAuePyDJonqTKFNhO+FkQCKPhRACA2kBYeTs?=
 =?us-ascii?Q?FSpuFlDAhq0q6uQNc4/OuXPW/CxNzCVroO5ycfM/tly36l8XfIGK5CG3KWVT?=
 =?us-ascii?Q?10ELxzeTYGo8hKIt4FVgvkL9MSCYzc6m77tdIabbn9WyM9aUwdZIMR9+Cz53?=
 =?us-ascii?Q?9Ero7EzsdqsS35k3QuyVTc/hrDQlqHQOhmJneBtLvygYZnw515/7F4hjW3r6?=
 =?us-ascii?Q?d0cYQbf65flChwisV5UHCGQdIqZwZyGi+uKK3oMXVnjjrkLlsmyNrdLKLtlo?=
 =?us-ascii?Q?AmE7FQ8YBbr+HCK8y7hnX6FzLEGP5xX5Du44vjfLhPKfQueIFIYjvQRfNrH5?=
 =?us-ascii?Q?15gttk7S5Y0Yg6Zr0Yc6A6KGte1TfIluZNmEGdW0u2+doA6npf1thWO+ehpl?=
 =?us-ascii?Q?JwZYAVHIxjDhgriW1VW2iIy1CyH3ZkRkiefAleHB2O4zRPLhu4oamLjy+dqZ?=
 =?us-ascii?Q?PXI1vJkzWhrXU/YGyjH+DimfDQUPJYyA4PoO9RA91eHmx8awltmpoUjHFjOp?=
 =?us-ascii?Q?40lVK/D4p374qtd4hSE6OzLDA8I18cE+W+bBcx89FNi8DYo6VtiVBLZSwWB2?=
 =?us-ascii?Q?6YgddSvG0WCRGXtRYJwQNZZporeaeQgt5iu64TyFdYhzc018xvAxkg1vYyw1?=
 =?us-ascii?Q?GAjze4xzGj8If5gGSQzYORA4mZDuezLYGAErApOy82CjBh1BMalXbdD4L1r5?=
 =?us-ascii?Q?Mmyj7m4Y62kyXeZXTM/hT8Plpp9BIjIQmYah2O+/XudQgfq/L9k0XY5uRF+Z?=
 =?us-ascii?Q?iIZjG2s96pguCpUwLrhl4M0O7SJFuQm8l9AnvZ/CY0cKerr1kMwnRif2iThk?=
 =?us-ascii?Q?m3qDdwR8WF69JwukjXd58MUI4BQHUTILrqsZskswqF+mvaUBMhtZOY0yEo7z?=
 =?us-ascii?Q?0OO8Q1jsmwHPi34NPK7hOTUjfQJCFGE/vEL63YlcF8hzWXLn8xyMIOK7pcCs?=
 =?us-ascii?Q?0kVLXA6aLoSqr2ApCf49o6jmACXlD34A8/uhLbsUJHM6sBOmbi+7GbrYIOX0?=
 =?us-ascii?Q?SXfhjH4q+t9RGKH3wnJNiQB1kuRUZbSKpIVJqViaeWQLDJ+Y3CZajJ75D5Ew?=
 =?us-ascii?Q?HGRdngDlp1RrlmHc3dLM/L0P81j9sF9qVU0/Ecovqp1uZJif2tVmbvEXgAjc?=
 =?us-ascii?Q?7tiq+uknrl75V5SAYIaQANP1QY7x+YPQxekionVdvFajDKgm+G+Tdg7IEhLY?=
 =?us-ascii?Q?EvwyTX8LjKL3C/K7kz+CUi1Vs49MZrFMXyFpFNVZHZ+CSTtTMfSVGqmIf1M3?=
 =?us-ascii?Q?GoQRlyLCt/0fxggJyxJPGoppoBxxtVFn3cJ/r6dlZwuRGE9cJCDmWuhKJ6Aa?=
 =?us-ascii?Q?kBRKad+K4zPZsese6M6yyg/OFgTK627JzVF9BedHSrwHutVPz5LwXNNhDrUK?=
 =?us-ascii?Q?8V1MpzNv+jzpttGWzQGToIFJTTsbjmTjIcgSCDEw5jE2R8TLi3dGxNoRqGxk?=
 =?us-ascii?Q?jMF95tA3SM9GKchu6u8FhgMKvwv8KMKuVtZNlZALSAhIbn+olTfLCN7n7ndy?=
 =?us-ascii?Q?SFWXJUz1FWi3f1CI5y/ZGteU0crQmVP2yGRXvzqhpqwmVQjAXh22h7H5Yuwm?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c03dd1c4-3e87-4ad9-1136-08ddce56f691
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 04:18:25.6905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIHFLigTjZqVuS031ie3L+tewA3vxsoK1UOVyPvCdOdva6zc7mZmVY0JNuItAN8mxji1KpazzjLM5IMgz7AXLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
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

On Tue, Jul 22, 2025 at 07:05:20PM +0530, Himal Prasad Ghimiray wrote:
> Update the bo_atomic_access based on user-provided input and determine
> the migration to smem during a CPU fault
> 
> v2 (Matthew Brost)
> - Avoid cpu unmapping if bo is already in smem
> - check atomics on smem too for ioctl
> - Add comments
> 
> v3
> - Avoid migration in prefetch
> 
> v4 (Matthew Brost)
> - make sanity check function bool
> - add assert for smem placement
> - fix doc
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 29 +++++++++++--
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c           |  5 ++-
>  drivers/gpu/drm/xe/xe_vm_madvise.c   | 62 +++++++++++++++++++++++++++-
>  4 files changed, 91 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4e0355d0f406..f133fc54664e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1685,6 +1685,18 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>  	}
>  }
>  
> +static bool should_migrate_to_smem(struct xe_bo *bo)
> +{
> +	/*
> +	 * NOTE: The following atomic checks are platform-specific. For example,
> +	 * if a device supports CXL atomics, these may not be necessary or
> +	 * may behave differently.
> +	 */
> +
> +	return bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL ||
> +	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
> +}
> +
>  static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  {
>  	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
> @@ -1693,7 +1705,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>  	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
>  	vm_fault_t ret;
> -	int idx;
> +	int idx, r = 0;
>  
>  	if (needs_rpm)
>  		xe_pm_runtime_get(xe);
> @@ -1705,8 +1717,19 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	if (drm_dev_enter(ddev, &idx)) {
>  		trace_xe_bo_cpu_fault(bo);
>  
> -		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -					       TTM_BO_VM_NUM_PREFAULT);
> +		if (should_migrate_to_smem(bo)) {
> +			xe_assert(xe, bo->flags & XE_BO_FLAG_SYSTEM);
> +
> +			r = xe_bo_migrate(bo, XE_PL_TT);
> +			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
> +				ret = VM_FAULT_NOPAGE;
> +			else if (r)
> +				ret = VM_FAULT_SIGBUS;
> +		}
> +		if (!ret)
> +			ret = ttm_bo_vm_fault_reserved(vmf,
> +						       vmf->vma->vm_page_prot,
> +						       TTM_BO_VM_NUM_PREFAULT);
>  		drm_dev_exit(idx);
>  	} else {
>  		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 5a75d56d8558..c1cb69c6ada8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -84,7 +84,7 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>  	if (err)
>  		return err;
>  
> -	if (atomic && IS_DGFX(vm->xe)) {
> +	if (xe_vma_need_vram_for_atomic(vm->xe, vma, atomic)) {

Same as patch #11, if atomic fault and DRM_XE_ATOMIC_CPU, we nack the fault.

So I think the helper should be defined to figure out what to nack too.

>  		if (xe_vma_is_userptr(vma)) {
>  			err = -EACCES;

I think DRM_XE_ATOMIC_DEVICE works for userptr now if
xe->info.has_device_atomics_on_smem is true too.

>  			return err;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2226b1eb46f1..5dc7cd7769f8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4200,6 +4200,9 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>   */
>  bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
>  {
> +	u32 atomic_access = xe_vma_bo(vma) ? xe_vma_bo(vma)->attr.atomic_access :
> +					     vma->attr.atomic_access;
> +
>  	if (!IS_DGFX(xe))
>  		return false;
>  
> @@ -4208,7 +4211,7 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
>  	 * instance, on a device supporting CXL atomics, these would ideally
>  	 * work universally without additional handling.
>  	 */
> -	switch (vma->attr.atomic_access) {
> +	switch (atomic_access) {
>  	case DRM_XE_ATOMIC_DEVICE:
>  		return !xe->info.has_device_atomics_on_smem;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 1dc4d19a5f2a..727833780b4b 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -98,14 +98,28 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			   struct xe_vma **vmas, int num_vmas,
>  			   struct drm_xe_madvise *op)
>  {
> +	struct xe_bo *bo;
>  	int i;
>  
>  	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
>  	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
>  
> -	for (i = 0; i < num_vmas; i++)
> +	for (i = 0; i < num_vmas; i++) {
>  		vmas[i]->attr.atomic_access = op->atomic.val;
> -	/*TODO: handle bo backed vmas */
> +
> +		bo = xe_vma_bo(vmas[i]);
> +		if (!bo)
> +			continue;
> +
> +		xe_bo_assert_held(bo);
> +		bo->attr.atomic_access = op->atomic.val;
> +
> +		/* Invalidate cpu page table, so bo can migrate to smem in next access */
> +		if (xe_bo_is_vram(bo) &&
> +		    (bo->attr.atomic_access == DRM_XE_ATOMIC_CPU ||
> +		     bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL))
> +			ttm_bo_unmap_virtual(&bo->ttm);
> +	}
>  }
>  
>  static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> @@ -253,6 +267,41 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>  	return true;
>  }
>  
> +static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
> +				   int num_vmas, u32 atomic_val)
> +{
> +	struct xe_device *xe = vm->xe;
> +	struct xe_bo *bo;
> +	int i;
> +
> +	for (i = 0; i < num_vmas; i++) {
> +		bo = xe_vma_bo(vmas[i]);
> +		if (!bo)
> +			continue;

I think for userptr VMAs we should reject any DRM_XE_ATOMIC_GLOBAL as
that won't work given we can't migrate userptrs. 

Likewise DRM_XE_ATOMIC_DEVICE should be rejected for userptr if
xe->info.has_device_atomics_on_smem is clear.

Matt

> +		/*
> +		 * NOTE: The following atomic checks are platform-specific. For example,
> +		 * if a device supports CXL atomics, these may not be necessary or
> +		 * may behave differently.
> +		 */
> +		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_CPU &&
> +				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_DEVICE &&
> +				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
> +				 !(bo->flags & XE_BO_FLAG_VRAM1) &&
> +				 !(bo->flags & XE_BO_FLAG_SYSTEM &&
> +				   xe->info.has_device_atomics_on_smem)))
> +			return false;
> +
> +		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_GLOBAL &&
> +				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
> +				  (!(bo->flags & XE_BO_FLAG_VRAM0) &&
> +				   !(bo->flags & XE_BO_FLAG_VRAM1)))))
> +			return false;
> +	}
> +	return true;
> +}
>  /**
>   * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
>   * @dev: DRM device pointer
> @@ -302,6 +351,15 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  		goto unlock_vm;
>  
>  	if (madvise_range.has_bo_vmas) {
> +		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> +			if (!check_bo_args_are_sane(vm, madvise_range.vmas,
> +						    madvise_range.num_vmas,
> +						    args->atomic.val)) {
> +				err = -EINVAL;
> +				goto unlock_vm;
> +			}
> +		}
> +
>  		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>  		drm_exec_until_all_locked(&exec) {
>  			for (int i = 0; i < madvise_range.num_vmas; i++) {
> -- 
> 2.34.1
> 
