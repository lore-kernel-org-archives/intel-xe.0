Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73535C3ABB2
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 04:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA5A10E7CE;
	Fri, 30 May 2025 04:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwmFsDk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA5D10E7C9
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 04:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748579289; x=1780115289;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7jjavoPYMMV0HkmtV5yQlpuZoBQCt8gP2+i0EBPDXFw=;
 b=EwmFsDk+9+GZrpIl59BPOiv0ebsdsAACfdS06cR/f81EtxBeORv6JWqP
 5n//LGZW8LUIy3X3B7BI8WL/7D8yYqJT7PSPfLQwNeHFpQ4pyGM3bCwi/
 Vdvf/2xFppsLOU9Df+vTdJ9beMrc3dN0kCEf8WyEUg8yE/TFbYE04VnNE
 yY9YQ4BuEXvR6y+TCq12zzZrUEZnsh2HSbNNaRwmtbstuhKXhGTU7uCSf
 FZzdI7lbo90uDCEOQguW/u5CK9tkhxGtieo2LP+z8iggd8miD58pzC2Is
 pUZllMAEgAOLB5C9agSpsve6PMWb7yufIOmV6CoS6+RAN/dB3TyK7GAGr w==;
X-CSE-ConnectionGUID: n/j+aIiTQx2/dlfc/VCm+Q==
X-CSE-MsgGUID: s0+54JKZQCCsQxQsNzZrIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61717147"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="61717147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 21:28:08 -0700
X-CSE-ConnectionGUID: 1Vc8AeQhQuiGhbZRAVpzHA==
X-CSE-MsgGUID: eYXtbZ5DRBCBqOAwq11rQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="174762090"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 21:28:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 21:28:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 21:28:06 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.77) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 21:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFZNy3o4wOtFIXvwHLHH4yQn/x3+dpUeblrUjH8W9nR58903XtF58n3ZanwVO+AWzTOwv54eJfFmL8vp75DTza8fFd0qGSlzrz77vEmT9I9MeN9xtaQpXzuxcfKj08gQNWxON1shvtDrsPZf7p/2FHYYsPoeHcQRZx9aDcgLG1aAB0bvZxRGBA2wtOnhELngnXzDnEu08fhQAqlWq36vCCi7DJ3OUbgNBN8kBUifYqj3FJtvjPMC6qj7TODBKhn1AJDFsQiw3OeKtOAIrgI66MVY9j9u4RcnIP1+6PQfMjd+JZO5GBtNxJ5f4iJoCefcoEf0AEYQjru6rF83ZysmlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoVFnNYWgNLQi54LnfHr71KTYLwkzME3e6wTlLckHM0=;
 b=YNvV+dkQ24B9/ZaQFDBZNgguIw5DoyI19S0HJ8LMGXCfwH7NqXDGOUu2V3Ll1e/YeCHCMPmlema45mmjWjp0mxqh3kEZPvZ7d1kr16WnOPaX5OsycVuA6UvHkeH1VlwNruAPE1H3h2cJG98q3Rs6ynSRKUWZofVs7y7yt12dopCY7OuhkNoOp+S5Mz7mwLISfYrjp8WXMGka+G4kIMFRWLNnk9I1iAJzHTkB+SIQQiI1tx5uXBFRsKJUwtNXQl3UsEpzWkaXfmtwKqc0jiYa+rnwJDRM6AYXlCBXe47Rj3V5T6XfqPPtMTdPKvGbQ4MyaiUg1CDO62+5vH068jy5Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 04:28:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 04:28:04 +0000
Date: Thu, 29 May 2025 21:29:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 17/19] drm/xe/uapi: Add UAPI for querying VMA count
 and memory attributes
Message-ID: <aDk0L0X5ZSQgaIPZ@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-18-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-18-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:303:b4::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b981f32-3df5-47f4-4751-08dd9f325e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vZpR2RUr77sFXJ3ifMjF27HmI5/DKXl1tpZMsiR4DnfnZf1kpG/zNlrM6bl1?=
 =?us-ascii?Q?+GinvpKpCPtO4wN1KZgxsvnWsIU5ruiYpxlfm3iRRw6cyT6eyE/KrgBqBGzE?=
 =?us-ascii?Q?i0eXTC8f3JLQ0J5FDPlUUQ1yOoMD2A+TAqWSNBmEdtDAm2cgszgWOISBCz2q?=
 =?us-ascii?Q?G5yv9RNyBZN0gowUW0I7Vh8ZxlAciH13kE1NvGvoyXhDtZOqJZxBmn7Rg94j?=
 =?us-ascii?Q?buYx4pRtCEX6io8e9emb+tvd8wsTyzU64BHlLbD29F4PEbTbPVoylVht30pS?=
 =?us-ascii?Q?L68PEVl0F5dtUVVHeSILlgk6l44xm7VodMf6XQF7kNneSPCiQWLmSh/+F2Mw?=
 =?us-ascii?Q?ldtnjsOciSnBPdczi48C47f+gTo4M839ELwgX4hLZmOL/xe4LNeBPFWh5TBN?=
 =?us-ascii?Q?nL89ZASXN/bRHhLNmhbN9RXm3I4ehM1ZNy45YYv8/eSLeWtNaS2+1Jr6e5sj?=
 =?us-ascii?Q?qpfb7V1X5lCwS1XnSEPyc7l1aZV9ZcOWai0ucOisJVdhdOWrsO9/AFdRxG9P?=
 =?us-ascii?Q?43OD1q+w+LREAhnEPNOVbs8utkYGWfrdokmAXDUK2qgbLMY9bGHNt3StFxbM?=
 =?us-ascii?Q?nk8Srld4kOv992cYSFyS8dVTA/xv4wBZpYWk6dEJRhyVnrwue9GQaPuU7aM/?=
 =?us-ascii?Q?rUX/XXWz2x4fHng290jdk7cgVKmzGM7goosk/chP93fVTiRY8s1KbXG+K7Wz?=
 =?us-ascii?Q?n9X4mLehqMoEonC0MVHGk/I3zSw6IZC7KpHQHkv2QObqqMjtov/AZkni2p6N?=
 =?us-ascii?Q?kmtsMNzM0YnWFaTicFLrvp7VWuLt5WpG/yciQCNO+8ae7ddl9BRiOMtCHZWC?=
 =?us-ascii?Q?9so2xGB0L4RDmGLpGhQvbVcNptrA0h8HERHH06VkIAqjchlMFS/ykx74MN9Z?=
 =?us-ascii?Q?IXAQaa0yfHw1kENv0VVCuBB+VUrHewe9BM7mwNDmo4I2OJFvCZsBi03EbSv3?=
 =?us-ascii?Q?Fz65QvCfVk1BNPkYgDmbJXQvMb8cAYxgfXZReFAIaLWObkfErGfdlgUXe+/d?=
 =?us-ascii?Q?793sfZ0Zz51eyawySFQhHyTOXpryBaMyOHAqUvipMVB9OmvunuSj9Ghevm8u?=
 =?us-ascii?Q?6ivJviCETQm8E78Yi5S8mHReccCFXJ1z7EkObe8ohkih/ZScoNiE2K+UjBhe?=
 =?us-ascii?Q?3wpzjjq9wbhJBMq+RkXT3aOTX31jXlf2aYouiEZ82ZYeOLqNvieV6fm4Lx9F?=
 =?us-ascii?Q?T+ufA0rx+nBdTnMMc016y8q6Q4Hodosfw2A4GVFc/HblEcNO+AO2u9+uK3a9?=
 =?us-ascii?Q?SrpvYd14d74TnUeSQscvrBKZMIxQw4FfXerJTFzi43Xz4cNmHboEghrPCaL1?=
 =?us-ascii?Q?fRRLTpWA5b86UU4R6bO6vDKWBFD5a0uHoUZyD2kpDUpwk9OYtBKIGLKW1JKn?=
 =?us-ascii?Q?X0kAmmmqUfNmkhx2RXKm1uMJmJUGu2ZyCm71bQCQJTe9y3qJWuXN6iGQVFnl?=
 =?us-ascii?Q?yg8kkC/BRE4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5FL787rAiBqXylUe4o84wQ0F8hsfX2dtedLOXEjyVVu6L7ewr8KJkDwuI52K?=
 =?us-ascii?Q?DvRcDXeAaC0RgxNCkuQYW+n4nmN1zPdrAz27q43ojPxNI/0bbx6k0v+D+q06?=
 =?us-ascii?Q?fF1nbIiNkNc8bz4OhM4PsLRs91eKSRjZhyxPP2oIlz1Ca2qXqvN7s7JQ1ETr?=
 =?us-ascii?Q?EeygIdIUEqTg0CrKYasW9h8/oJuJ72aUu01BBSCchxjeAQZDMOZ1b0xQuFpU?=
 =?us-ascii?Q?UNNpUEL2W6I2yOp03Ds94lcooH/3BMSM4UVcOXAx8drLJtzbgbQ8wDAlbSyk?=
 =?us-ascii?Q?+9ulz6Hiwn9OQnm+Lx3O9mhg6Uj09jQFEnO/Oh/KsrEn0XUAfDjWsILV9ZvO?=
 =?us-ascii?Q?V5oOG0haUZ0SbpPMJFBLYmoBQwKMX9bBqhtWg23sLCA3kztoMLFB3Li5VZK1?=
 =?us-ascii?Q?4vF4mvzpnRfRJnR6/UAZZrQxc/80ZxTuSJdUKpHJPH6o4HXyET15Is1AdI7d?=
 =?us-ascii?Q?vV/cx+YK2ArgtNvMvJc/IwAH3NvFI4s3EsaBu7N7AxYa2QntGjAaEacwGMK1?=
 =?us-ascii?Q?Hami9y29cGliSDD9tg05xZt0JMtBL3NIhC2B6Ch16GqL68ApPBVLCcjX7xJH?=
 =?us-ascii?Q?SqlQw91/55BJjjVdKSSksEubNp4o3xO+H/OWhxSuMI/y+PEv9DyHyR9jKFsU?=
 =?us-ascii?Q?MlUm66KW8md6hFQkuip1NDD5xWe6jH59ABVUkwhE5pF3+rHveyACUkby+t4o?=
 =?us-ascii?Q?nInsw6DJ/xe/CN8Q1Z1Jk/Opck7sYYGWbq1SyemUjvRidaeSdtsn3e6pvVVN?=
 =?us-ascii?Q?J2EfmT7eEOJWmbq/tRhDJEt+dXXn+NLm2mX4OaPGUHz90ggD5U3FAhcfg8wz?=
 =?us-ascii?Q?+1+6WwZvNiKLib6+Pj1TX8G8EHBdIJE5TB7pgsk5D0we2KHHhiQwu56ooTL+?=
 =?us-ascii?Q?tSgN8+IGlHqL1GWmLowlBlz9A2VRaubEekoAcKz223dYJsv/i9cdiXJ/Puh4?=
 =?us-ascii?Q?bFNqwenOrECSHa3GZ2M7q7TIELTogAcunUDM8jkEDnKWOE1op9RzolFYBVb9?=
 =?us-ascii?Q?5NWifzB1uyNtsMtrcT+cRaE5k0Qjah+AmjqdMJCNr4CNCLIkT4QiC70Q7tdu?=
 =?us-ascii?Q?5odh+ufmwz0/d+nyXuX8BtpNF1yVAtgSyWQR6kpU/pvVPApwQOaWBw0y7Ek+?=
 =?us-ascii?Q?CKfuzoLGHpbRzowDAW8o/SuGEI8PTv4TAO7gBj2cHS8rpiEBsB/MY3mSwtIV?=
 =?us-ascii?Q?L6Ny2QM02i7SyFWG5FzGV0hqqOZNirWdhjyylI80Ve+qIh93JFXEjwkxnIV3?=
 =?us-ascii?Q?PrrdrEhd7fYGRaLGki+1ma1DyEDoy30NPMccrOqKA62b0L+EbzmE8ANTRybR?=
 =?us-ascii?Q?SAG60OAvfbXqydslEWCrEPjugLOLtrXEbUG3H+rmqiPL4tdBNPjK7a8qTBBM?=
 =?us-ascii?Q?5ZmrVeHJb0xoVbPPitbnf5UnFm7bwEh3XevkdDzEY4VzCsMK1OtDD/boGlEN?=
 =?us-ascii?Q?3WLBUMtIltZxoLo0SrsIGfkxSUbtkKR0B10KwuCOtb4rCH9lwWWwloXbMbYf?=
 =?us-ascii?Q?CeIacaQ1Qlaru47VqhT35o5j/2ajA/fWfyknEX1GCjOL5Cz7M0/KfTMJaPig?=
 =?us-ascii?Q?Br41oAJUR7JZQxrhIp7iTWG8/IOOtzzKKQdvGPRe61YdRZEl6d/Lzrg/I5DC?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b981f32-3df5-47f4-4751-08dd9f325e94
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 04:28:04.2438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCADXQqh7FgzM039Xoh+UpeRXdmv4rFhoY8KDhtTq5ShB9pahSEvePiYk3ZEDWV98gtvqmlIl2onoOdpH88q1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
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

On Tue, May 27, 2025 at 10:10:01PM +0530, Himal Prasad Ghimiray wrote:
> Introduce the DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS ioctl to allow userspace
> to query memory attributes of VMAs within a specified virtual address
> range.
> If num_vmas == 0 and vector_of_vma_mem_attr == NULL, the ioctl returns
> the number of VMAs in the specified range.
> If num_vmas > 0 and a valid user pointer is provided in
> vector_of_vma_mem_attr, the ioctl fills the buffer with memory
> attributes for each VMA.
> This two-step interface allows userspace to first query the required
> buffer size, then retrieve detailed attributes efficiently.
> 
> v2 (Matthew Brost)
> - Use same ioctl to overload functionality
> 

I thought we landed on this was not needed? Or if it is we can add it
later. Anyways this does look better than previous rev if needed (not a
complete review).

Matt

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  1 +
>  drivers/gpu/drm/xe/xe_vm.c     | 87 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |  2 +-
>  include/uapi/drm/xe_drm.h      | 82 ++++++++++++++++++++++++++++++++
>  4 files changed, 171 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b9791c614749..8c965d15c187 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -199,6 +199,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS_ATTRS, xe_vm_query_vmas_attrs_ioctl, DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4520e475399e..9611d7ca2bed 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2162,6 +2162,93 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  	return err;
>  }
>  
> +static void xe_vm_query_vmas(struct xe_vm *vm, u32 *num_vmas, u64 start, u64 end)
> +{
> +	struct drm_gpuva *gpuva;
> +
> +	lockdep_assert_held(&vm->lock);
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end)
> +		(*num_vmas)++;
> +}
> +
> +static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
> +			 u64 end, struct drm_xe_vma_mem_attr *mem_attrs)
> +{
> +	struct drm_gpuva *gpuva;
> +	int i = 0;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (i == *num_vmas)
> +			return -EINVAL;
> +
> +		mem_attrs[i].start = xe_vma_start(vma);
> +		mem_attrs[i].end = xe_vma_end(vma);
> +		mem_attrs[i].atomic.val = vma->attr.atomic_access;
> +		mem_attrs[i].pat_index.val = vma->attr.pat_index;
> +		mem_attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
> +		mem_attrs[i].preferred_mem_loc.migration_policy = vma->attr.preferred_loc.migration_policy;
> +
> +		i++;
> +	}
> +
> +	if (i <  (*num_vmas - 1))
> +		*num_vmas = i;
> +	return 0;
> +}
> +
> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vma_mem_attr *mem_attrs;
> +	struct drm_xe_vm_query_vmas_attr *args = data;
> +	u64 __user *attrs_user = NULL;
> +	struct xe_vm *vm;
> +	int err = 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->num_vmas < 0))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	down_read(&vm->lock);
> +
> +	attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
> +
> +	if (args->num_vmas == 0 && !attrs_user) {
> +		xe_vm_query_vmas(vm, &args->num_vmas, args->start, args->start + args->range);
> +		goto unlock_vm;
> +	}
> +
> +	mem_attrs = kvmalloc_array(args->num_vmas, sizeof(struct drm_xe_vma_mem_attr),
> +				   GFP_KERNEL | __GFP_ACCOUNT |
> +				   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +	if (!mem_attrs) {
> +		err = args->num_vmas > 1 ? -ENOBUFS : -ENOMEM;
> +		goto unlock_vm;
> +	}
> +
> +	err = get_mem_attrs(vm, &args->num_vmas, args->start,
> +			    args->start + args->range, mem_attrs);
> +	if (err)
> +		goto free_mem_attrs;
> +
> +	err = __copy_to_user(attrs_user, mem_attrs,
> +			     sizeof(struct drm_xe_vma_mem_attr) * args->num_vmas);
> +
> +free_mem_attrs:
> +	kvfree(mem_attrs);
> +unlock_vm:
> +	up_read(&vm->lock);
> +	return err;
> +}
> +
>  static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>  {
>  	if (page_addr > xe_vma_end(vma) - 1 ||
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 340ac34936f4..b1e94b536c80 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -195,7 +195,7 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> -
> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
>  static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 03adfdc20dde..6ff9ff0c09dd 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -82,6 +82,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
>   *  - &DRM_IOCTL_XE_MADVISE
> + *  - &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
>   */
>  
>  /*
> @@ -104,6 +105,7 @@ extern "C" {
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
>  #define DRM_XE_MADVISE			0x0c
> +#define DRM_XE_VM_QUERY_VMAS_ATTRS	0x0d
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -120,6 +122,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>  #define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> +#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -2066,6 +2069,85 @@ struct drm_xe_madvise {
>  
>  };
>  
> +struct drm_xe_vma_mem_attr {
> +	 /** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @start: start of the vma */
> +	__u64 start;
> +
> +	/** @size: end of the vma */
> +	__u64 end;
> +
> +	struct {
> +		struct {
> +		/** @val: value of atomic operation*/
> +			__u32 val;
> +
> +		/** @reserved: Reserved */
> +			__u32 reserved;
> +		} atomic;
> +
> +		struct {
> +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> +			__u32 val;
> +
> +		/** @reserved: Reserved */
> +			__u32 reserved;
> +		} purge_state_val;
> +
> +		struct {
> +			/** @pat_index */
> +			__u32 val;
> +
> +			/** @reserved: Reserved */
> +			__u32 reserved;
> +		} pat_index;
> +
> +		/** @preferred_mem_loc: preferred memory location */
> +		struct {
> +			__u32 devmem_fd;
> +
> +			__u32 migration_policy;
> +		} preferred_mem_loc;
> +	};
> +
> +	 /** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +/**
> + * struct drm_xe_vm_query_vmas_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
> + *
> + * Get memory attributes to a virtual address range
> + */
> +struct drm_xe_vm_query_vmas_attr {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +	/** @num_vmas: number of vmas in range returned in @num_vmas */
> +	__u32 num_vmas;
> +
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @size: size of the virtual address range */
> +	__u64 range;
> +
> +	/**
> +	 * @vector_of_ops: userptr to array of struct
> +	 * drm_xe_vma_mem_attr
> +	 */
> +	__u64 vector_of_vma_mem_attr;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 
