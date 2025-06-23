Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA2EC7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 16:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E5710E422;
	Mon, 23 Jun 2025 16:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZpBCGPR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BACC10E422
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 16:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750695464; x=1782231464;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=04bPMhe7AU415JO112U23XFQ1BRuTD8ewFAkuJawDAU=;
 b=EZpBCGPRXp2OmONYzX/5FVh4CbqCEPWmsDRwCAlAsr0h+GCjCofhzz4y
 htZNkGeLf3ye2yK9//KE8uqdkxz5fy+JIMgi/82IDAfLxHLrH7XyvCQsF
 rl4w/Uwstsjd8Wqda7xVIdd0Hd+Rp0wuQ9vlCqecTdaqrhlK9YflB9IPa
 XkJUqmUEypEdR8CVk/jleDg4K/OslwPzUvp3X3LSjOS+NWnyfhEpnvQeX
 tb3cbRblfZifR6lqzbT0Cu5scmPAGl2OGk/iHK6yC4tiBYeQFFAzoAQu+
 7+pW0sbFb1UEdkg4gnbgql7LC6l72arZ3s1ds1SNiUCKKZ9J3MVv+nOxt g==;
X-CSE-ConnectionGUID: KFvXiZf7TNSkICZdV0cFCw==
X-CSE-MsgGUID: 2ISU3QfJT1eUTReWQ33jFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70479258"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="70479258"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:17:44 -0700
X-CSE-ConnectionGUID: 93CHeOlcS0y0bfuVtJTFiQ==
X-CSE-MsgGUID: S2N96gJpTTKALDqwl8Ocpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="157429671"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:17:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:17:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 09:17:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:17:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojSLFrexbDAdSalgeq0d5B8/m4vcvo3vzTjRaNBnASDAf56UaPKj3WdUx+sonU74H7pd7HQn000tH8NDLwU53xb41X3qGgrMXt94zWNuWKBUiDT7xGnhe+juMJcc33urho/h/INTu/Rv3JXkOoi/yj7cxKGxudASoPV1sSLgcHODE3VQwzC/102TPJncFPmE15rEsXON56aAft52F0uycQY2XfjsXK2tSgFpx7DDujDPLO/ObxP4rUvL6VwsZ7idwJH1ergZ7A7mCKKEpZIOt2U5FDmT35n1FoedAPj2OZ2YEqW4ygd/nxy/cXBaf45VSPvmsH7pPIeMCuSXo/D4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+5VJ6sa3TT8m9RZeea6rO2a55JbVkXkwBei/kjXHg0=;
 b=L4Y/te4LrsCqk8VgAlala726QIdAvmecwRMhot4PEhmAZVAOExVMXmWZ6s0m+g975j93qitTfvGkn0WQLNVPvBeShuv+R0wOQajHac+v/pdh0mghsd/+h7pXh32auxn3eLqym13UP0CB14Zqqr20/lsUwO7LDqplqI19A2k8nSi/4+Sr8TiR6Q1IMKCXpVYB1z+7Ln6fb0U7xnhvb2DlDoBUtSHhXkn6xZ2T5wYgcd6ekGl+LAue8de8koY5LYINFhPLQL7+hpZXptkeE5oJOnreAgXGZ19ihaBN7qrRJtEGhm/1XaNEVN+1Vy1WC6l+gH9NzMF3eB0vLKaf/ntSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPFCB5A2AEE2.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 16:17:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 16:17:40 +0000
Date: Mon, 23 Jun 2025 09:19:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 18/20] drm/xe/bo: Update atomic_access attribute on
 madvise
Message-ID: <aFl+hk2nSSW5fwe6@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-19-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613125558.2607665-19-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPFCB5A2AEE2:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a0de4e7-2476-455e-ac6f-08ddb271799e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0Iw3QlCiNzjKLCrCAWItj3a2wdJZKXDWna1i74SH1swgazRIrTlTaY04OpmP?=
 =?us-ascii?Q?flM+61k9VJ0VWd8WRkKvGKNsd/XU9CtMDgVjuxWIIg6575G49MyWoBMGkkfl?=
 =?us-ascii?Q?6T+e6PIf/Ok6FND/I4meANDcKA0cIxWw6OKiK+Dx8MW0ZUTrdrAzCWGabhSy?=
 =?us-ascii?Q?Ani5jOBXBUOKqhspWO5JMS9gmnLWei2Fhlt9rf1AN28lG0V8dSX85EAeDSL+?=
 =?us-ascii?Q?Rd8W5LoigoOEbZqohE8gECJX6UqWwFJqVgO9QQiw1SVlOHWiaTgG0ZpvRdP2?=
 =?us-ascii?Q?qUsOh+cOc4KvxWkGhHRkEn3vhj30FITfqzf5AIP+k+UAAijXS185v852whnB?=
 =?us-ascii?Q?U6MOS/9T2UnR/v053Ng3GRTBsn7BO/paVh0/VFxL0j/jd2GiwgQuc4p5KJX6?=
 =?us-ascii?Q?MlNvZSmvFr7bcb5O7TCeFz0Wk9w34q2/YA4/9kM1KG1irtEUHyjsGeuBnzRn?=
 =?us-ascii?Q?njFtS+/fIubQIvvRKKw9TObxr0Ia4hWh8oOLG+AviaxwNBxb4R2ytOkIwpkd?=
 =?us-ascii?Q?7Nhm0nNmVLlL834uHLLqlxAEEP+gQbKeZYa2jPvJolB/TUc/l+AWZ6Ma7zJk?=
 =?us-ascii?Q?aQY3MHNDOwjJpL7OIpq4OSVe1xUiYevKy12Y4Z3eEwUzDbiKjPLC7bJ59D6t?=
 =?us-ascii?Q?fgJ8zTHdfuEo8bM7mUFxMABfdQO3ozCEqYkg6WozCAW7D6je+qQo6+zncPlF?=
 =?us-ascii?Q?VcJpHzCpL5h+MtgdePQ5+iZoMr5UgjNt6K2mfI9ELVi1mCYpLEDUglHO768M?=
 =?us-ascii?Q?ZKWYg8uqFQcm8NqxdyjbXR5rA8Hm/F33KyLxxZf7/DFujQfqv/XD8nX+oQMi?=
 =?us-ascii?Q?d3LM1gQmk4vPKIXaHRgAtb3u7JVUOCHocGfuv8wsYTQIv+Akd/9FHUG6Zkch?=
 =?us-ascii?Q?X8QuneuEmWJA6YTpTO7OslUMjCLkrXdi7Dzfwwk0RsugY/Qom5Nu6IuNCs3Q?=
 =?us-ascii?Q?gkn72UCs4iSd56S+BTtOxjYYhgaWdXfkbW2p3kjQONjKII6VlygfmOiWCVVx?=
 =?us-ascii?Q?8JpxnqbJVAt9wF6MBbapPb9C1A9r+ejEWxfrezwD6cE40fu4BlHmPws1G40Z?=
 =?us-ascii?Q?jcg1N2MMRpC2ASyVNbG+8blAQ395gBiAV7OlfkaAvqj16On6EOBPAACt4Kc9?=
 =?us-ascii?Q?dQv7vdKhOTWOOvjPuLI3dwqPUZhG6Yivet/Cyeycdiic6mF92xFgpm0/iylO?=
 =?us-ascii?Q?s094PMK9/OtEzYVX7N1+8IF8AIkAp1ETEgmxkDEFSYzvmRBykC0672poHi0W?=
 =?us-ascii?Q?A4oq6GZasgKMUkvk0ceu1EkuFYzepxGKVVvs9oMStUmUi/JhfARlAaP1XYsl?=
 =?us-ascii?Q?d+UM70jXRfNMWYs19Od98E94IFEuxttWE5kb/+3s9kKOA8n2IA06DDJRcpsA?=
 =?us-ascii?Q?oCVAYwiZCiythCBU9MHsovETaK/cgS+bXthS3A013nXN1SANUOk2XUbP6pCS?=
 =?us-ascii?Q?E6J1X1BbCFY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zwv/7Mrs6JGGiTswx4jp8FHKJs8/fhUwiNlbsM9uB8xeXlTPDerqd+7zF1uT?=
 =?us-ascii?Q?EYM/4t36Vy/Pzqs97ZHqKhodoTfBCB4ZSrkxb+mzrAG5GYyBQADV/U53wGUE?=
 =?us-ascii?Q?V4MA6eKWBtHGwNKGe27QrcdRyoWXj0zMWUUA4NuiE2mYI9gyjCO6xWkJh06C?=
 =?us-ascii?Q?P8ZR6Fvx6bk8U0mjsvUznVe32/jPgt9PUYY6vpIL9SVA+L3wDaEeSOmdILJ+?=
 =?us-ascii?Q?tOewD1Fr2ROxW3FIQ6J1BVz0zbRaBHErHH0z02GYV+u/eOgkWyGJJI35hLam?=
 =?us-ascii?Q?tDGrFDjePt2lTw5Jl7I7dXh73ge83owRPyuQz2TnrR1KrK68yugD7ZvRSDPD?=
 =?us-ascii?Q?u/aSggdu78JIBtqsblUlemhO38JlWBp02nI5XseY7Q5UvzuBUz/18OEXTcHi?=
 =?us-ascii?Q?T87LI9NUuXAbKUAuog7jXRexfZtQsstipjTD2slQd+93X/c9tGA0jHJ0U4Ro?=
 =?us-ascii?Q?kyv11HJ7LtbFrBlTYH007uaVlWhMXtUw1HhrMCG5ofeUKqM0FX5Feh0rZ3XZ?=
 =?us-ascii?Q?2d2SR9elSsJCHPxnrvguRndey/8giXQAvMLKbVrgNEUP4s1hhIgC30LCKKkp?=
 =?us-ascii?Q?2F+6gPiJGdtmPDI65CICFZpRMltNjNRByiwhCK0CTnGPh7L+h7dSwO2vpUle?=
 =?us-ascii?Q?bEe4ReYnhBx8an7SWF5ktP/P3HViKaIUGNNPtVbLKkZpvVKgl/gla5B9+1aI?=
 =?us-ascii?Q?zIHo24CI7g5voxrNI3iBywaX8Toq2YcCYQ2UY/ckmpEdQDV1k0G1v0uGRBZ4?=
 =?us-ascii?Q?eUMjzGJUbTAIoxuooBsLYNQL1UYEyMBlTx70QTUAoRhb+gCTGHrehZtXUHz8?=
 =?us-ascii?Q?F+IZUZup7FxrdpFg136aUd+0OnlIx0zQkWrQe4OUIj+UcVGAp/6ReVO7dxN1?=
 =?us-ascii?Q?WLYaY++NUv2kg1DglyeKr1dDLsCvhjqYkKPwJi0VEVAypjF4sbvLwSma3s9Y?=
 =?us-ascii?Q?6dA4tfB0yT5Dd+IsWGmnU4+ERqE80RoqYsb9qIdmTrTWkiqa1Pv5Cry0+olQ?=
 =?us-ascii?Q?wJ+ik/QAx6GsNNaohNbiWSUHx8nNYt7F+hg484Q089HD+EjFiIBE6Z7t/1qz?=
 =?us-ascii?Q?KrlhxlBpbL09CoKMrMwR/skp649zDPyEfokmYkA2GIIKXqwIt+aPtRTjsc4Z?=
 =?us-ascii?Q?4YlmLG16XrB6v579o7Fby7vzPNTibeOtB3HWX9z93phTKayo5a/C7RZSWttr?=
 =?us-ascii?Q?ArZNJe/eYJyUozOoU8c85xmFxcs3xeXerL1zC7guhHuf3btThplni0PYABMu?=
 =?us-ascii?Q?5LK8kN0Yj8cGb6erNzgPpKshA+aiaA/VM/nRJZxl1fyM8+s5yFVFdDY+oldf?=
 =?us-ascii?Q?5cwJcFOaJQqh96NqxMTju6u3MZo5YIN+oNoMvtXGhraYIkY1IWBdZ+tS9aHy?=
 =?us-ascii?Q?D+EHq3Hx6CfQay4TuQQ9c4Ed5j6bJJaC/rUMcuStl6vdtOmMrlyirLFutWYb?=
 =?us-ascii?Q?W78hozjTpUlchXy+vxwGU3Cn6BfDaW+ZeMV/yjnvmDEAx4kyQtJFZw3fUhLn?=
 =?us-ascii?Q?GksYdeWny3Ns96yeoYsswVXclUTD0PBWK7QjApy4Xq0ke92437Yowe2qumLF?=
 =?us-ascii?Q?5DCYWCXLf2dqqFou5rKKKsbdexlCJRLlgc4MyVRLt73uXikfpOOWN83wouQX?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0de4e7-2476-455e-ac6f-08ddb271799e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:17:39.9515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMK/naDqs5oAHK9BfMBTuq1d/xfeyq2XxEgxRVyTgDhmSvsy7C9xi9BDq9WdjIqJgQDgOJcGhoMD2WTX35n4lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCB5A2AEE2
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

On Fri, Jun 13, 2025 at 06:25:56PM +0530, Himal Prasad Ghimiray wrote:
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
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 21 ++++++++--
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c           |  5 ++-
>  drivers/gpu/drm/xe/xe_vm_madvise.c   | 61 +++++++++++++++++++++++++++-
>  4 files changed, 82 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4e39188a021a..82b33dfc5515 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1667,6 +1667,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>  	}
>  }
>  
> +static bool should_migrate_to_smem(struct xe_bo *bo)
> +{

Again maybe a quick platform specfic comment here so we remember to fix
this on different platforms.

> +	return bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL ||
> +	       bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU;
> +}
> +
>  static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  {
>  	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
> @@ -1675,7 +1681,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>  	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
>  	vm_fault_t ret;
> -	int idx;
> +	int idx, r = 0;
>  
>  	if (needs_rpm)
>  		xe_pm_runtime_get(xe);
> @@ -1687,8 +1693,17 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	if (drm_dev_enter(ddev, &idx)) {
>  		trace_xe_bo_cpu_fault(bo);
>  
> -		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -					       TTM_BO_VM_NUM_PREFAULT);
> +		if (should_migrate_to_smem(bo)) {

Maybe assert here that a BO has system placements to ensure our
sanitization of madvise IOCTLs is correct.

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
> index e2d975b2fddb..1335c5fc0e10 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -89,7 +89,7 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>  	if (err)
>  		return err;
>  
> -	if (atomic && IS_DGFX(vm->xe)) {
> +	if (xe_vma_need_vram_for_atomic(vm->xe, vma, atomic)) {
>  		if (xe_vma_is_userptr(vma)) {
>  			err = -EACCES;
>  			return err;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0dd9f9e11030..14e554f3f4d5 100644
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
> @@ -4207,7 +4210,7 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
>  	 * on a device supporting CXL atomics, these would ideally work universally
>  	 * without additional handling.
>  	 */
> -	switch (vma->attr.atomic_access) {
> +	switch (atomic_access) {
>  	case DRM_XE_VMA_ATOMIC_DEVICE:
>  		return !xe->info.has_device_atomics_on_smem;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 973627edb23c..5b96c8fc73a5 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -102,14 +102,28 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			   struct xe_vma **vmas, int num_vmas,
>  			   struct drm_xe_madvise *op)
>  {
> +	struct xe_bo *bo;
>  	int i;
>  
>  	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_ATOMIC);
>  	xe_assert(vm->xe, op->atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
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
> +		    (bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
> +		     bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL))
> +			ttm_bo_unmap_virtual(&bo->ttm);
> +	}
>  }
>  
>  static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> @@ -231,6 +245,41 @@ static int drm_xe_madvise_args_are_sane(struct xe_device *xe, const struct drm_x
>  	return 0;
>  }
>  
> +static int check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
> +				  int num_vmas, u32 atomic_val)
> +{
> +	struct xe_device *xe = vm->xe;
> +	struct xe_bo *bo;
> +	int i;
> +
> +	for (i = 0; i < num_vmas; i++) {
> +		bo = xe_vma_bo(vmas[i]);
> +		if (!bo)
> +			continue;
> +
> +		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_VMA_ATOMIC_CPU &&
> +				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
> +			return -EINVAL;
> +
> +		/* NOTE: The following atomic checks are platform-specific. For example,
> +		 * if a device supports CXL atomics, these may not be necessary or
> +		 * may behave differently.
> +		 */

/*
 * NOTE:

I believe above is the style and IIRC checkpatch will complain about the
way you have it.

Also this comment could be at the top of the function or at least above
the first check.

Nits aside, patch LGTM.

Matt

> +		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_VMA_ATOMIC_DEVICE &&
> +				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
> +				 !(bo->flags & XE_BO_FLAG_VRAM1) &&
> +				 !(bo->flags & XE_BO_FLAG_SYSTEM &&
> +				   xe->info.has_device_atomics_on_smem)))
> +			return -EINVAL;
> +
> +		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_VMA_ATOMIC_GLOBAL &&
> +				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
> +				  (!(bo->flags & XE_BO_FLAG_VRAM0) &&
> +				   !(bo->flags & XE_BO_FLAG_VRAM1)))))
> +			return -EINVAL;
> +	}
> +	return 0;
> +}
>  /**
>   * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
>   * @dev: DRM device pointer
> @@ -276,6 +325,14 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  		goto unlock_vm;
>  
>  	if (madvise_range.has_bo_vmas) {
> +		if (args->type == DRM_XE_VMA_ATTR_ATOMIC) {
> +			err = check_bo_args_are_sane(vm, madvise_range.vmas,
> +						     madvise_range.num_vmas,
> +						     args->atomic.val);
> +			if (err)
> +				goto unlock_vm;
> +		}
> +
>  		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>  		drm_exec_until_all_locked(&exec) {
>  			for (int i = 0; i < madvise_range.num_vmas; i++) {
> -- 
> 2.34.1
> 
