Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFAA10FC456
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 00:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FE210E6F7;
	Thu,  9 Apr 2026 00:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOaXiUUq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCAF10E6F7
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 00:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775695626; x=1807231626;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Gav/Ibbz6e+6egWShm/xgba5qlnXOUzNNa/iE+Pg+Os=;
 b=VOaXiUUqq1AjFrMKFtOdl9lWwXXPRpq/VL/vvEyAdrkzzAqcSQA4Y3Qv
 yuQUciRnIeahlj92lIV2cO8H/fAUw5SC/XD8gARecXYnIXiIIMjO6ukGD
 j46fW4n5YPrycdZBwt5pF7H2kl+zp1b/FURPf5gRCgViak/96EdJUUJ0K
 y9087QCWM8+6LuGhfs5qlhrzj6ajdUlrg8Rufeyrww+tB6ttHqVmzqA9D
 ITh2CF+C1Z0L0c9MBiiKTwhlbwRdn4nBUE4S/sOrcBKkxtYe/h2Hukg6O
 sOMXSZYW0bVQzt/p0/51kTUbBbhK2VAcXplzqW00t1miJpQys/Aw70S+Q g==;
X-CSE-ConnectionGUID: 47g//kOORWqFAe5cBOXffA==
X-CSE-MsgGUID: 7iqsYyW9TyiAZ0vvtVnKqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="86981792"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="86981792"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 17:47:05 -0700
X-CSE-ConnectionGUID: Pcgq6p0PRYuwPymWa/PcsQ==
X-CSE-MsgGUID: +PLsBcLlT4+eIUngNOAsYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="228550766"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 17:47:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 17:47:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 17:47:05 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 17:47:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdqFJLznIhKj8Alocykatr/9MdVINEa/Uj9pFbiamsE99jykaX0v6GfyXMylm2ftuZ7rJTfBPBe0h+SR9MEqZCwfvqcVxV88T9jZJbhbh/2tvrXDBxK8ElyeZ3wmDgq6panVjTPSnINzNK1IkMKYgVHApFUy2Aa062SCRnV31eTPebFlmrUFtdDEz3/JHLcC1feHeUr9FSWVxDMaOMO9gC+6IuCiFxIZYn5NbqZM1OG7FIr3SfV1RqenTB/OAQ4UVHTN3qp8RtH2u4ljKM8/ee0srZWGp7EH7fiGDxNAwzkoJv4i3IhSG0UW8Qf6pNILH0MUSIdZXJgJ0FH8yraeOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKZPKhcuV7KHD2LQTHntPg3t/vgRCT+Fs8ISudTroqQ=;
 b=Su1Qip2Gp6fCZKivjKWxtRvLL7J4He4xKaM2hwvdar1ZkONwg1+MCYnGLelk3fhoRvXXXBrcwvj6H7Yi9PyAydqQkTBFaGaVIAis4RDVGKn7n23EYXfvtG4AQ5Nn2ejE5ipVoQowEftcIMl85cma/0Djgiq6govcAAF3H+E5vfHcqog81JwMHeu0QWqhtQUTyIhrFsi3uZToAtda8i+c9aDITasNjZby0PyWCB2yufOh8wMQ5zlXm5sVqtB6NydmAgF/fR+YVb9RWFXWAceoctNG/D1O+RngPT06C78aseli0BDWozOxdTV5s0sLdyB73ZrtWV5HzGceGH8rS+aKcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 00:47:03 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 00:47:03 +0000
Date: Wed, 8 Apr 2026 17:47:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix potential NULL deref in
 xe_exec_queue_tlb_inval_last_fence_put_unlocked
Message-ID: <adb3BKQE5hFW6cye@gsse-cloud1.jf.intel.com>
References: <20260409003449.3405767-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260409003449.3405767-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 41503508-97b7-4d04-119d-08de95d18418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: bc5QZurXI6k2gKcCukEXsWSieYZmsMaMtKRNbY8dmgxj8h/Ew+5ejllPswY9FAn0WkZByJ2HG1AqOHP8TjtU15M/BxchSMe6/UNk8xaFsZAAnpmGeS3ygidEo1sP+/DHWIg8i/1o893R49vLAu/7FcpuXZeeTAFYFrSM8MvEqANsCvtJmDtHm6A3YO7wdMclZajoeZH11hTM4zGmkw7XeIEC7PfD3PdLIHfnoez9O3tj2ZuQomyZAN6lqGMlYciRIYSUzLqZw+FDU6Jtupxu47KPSoKRXR9gZ0DOS/2oFiAR1MVRp5e5f3X4WEzYOHZyq4PyWjrIzRRGe7oSXyNwQYOJQheln2iypBtqIX3eivnkax2dop7c20f4rt2xxV1THqg3l/SKEFqr2P2j3+WTiXO/OZXgehVukHMWfWUss05GNeXGfG9GSOwPAfxYcF4PnxsIzn/FzM8p/TW85GA+5IwUKtIG1cuM1FoxyDlkYgD0gyjNYR4RoWDAn9xu+4b8FOcGCg0PUeum6KUyHVrTRGgxR1wpA0igra1QQiCT98If07cFllYp0imGfGOPOGmtayoRj4u/V5bdMhYFONpnqlFJS4Ic3lvwMKOoMnsX/jG+30jARiVyAQfYzkI0zbIcFya8mUZ6FOJ44oAxx7UBTUTG9zloaWwW9A8aHaN64ckK2wfZZFmWb7jgF4sT22GPDCiTHFBnqj1wT+1OJlvp9VaTo3nv0WsFP0CCiljwKeo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ACV8L7Qs9HWAvLh7gkrfW/iE+99SZ9f0ccjVNuMyBpmZT8qSaIkHg2S4p3by?=
 =?us-ascii?Q?GCK1poVYI016DciJjtOzbpvrj8jtoITYS8fgmfKG2EdREWXhst3D7lc/0Mtp?=
 =?us-ascii?Q?Wk1iuStUF6k9UBknUKTWtJgg0X6ShH3c8Blw6vm6uzjM+cJ2oFKMdihjkl7T?=
 =?us-ascii?Q?yqQMNxW1dOBdocjgL4nveX/+x0GBnoHcgvfUWO96Oxjaz+hLf7zHmsHpV2jS?=
 =?us-ascii?Q?1g4WfIa2Wscvkmj7MrOeIp2R8KIdBfICQ7fuCDmOlDHZ7k0PnEsRMniQbfFV?=
 =?us-ascii?Q?oDuq/yul/oWfignLlZLQveEckSnu4VDgX/jbxsYNqn9RcqHtG3236Q4j7YYh?=
 =?us-ascii?Q?M2KbPRxI4olAplS9OgwtU7yjywo5Iy2tNYe9qj2fc8LUiXvoDq+bySjlUbbt?=
 =?us-ascii?Q?ZAIWsM7puGjBxyiNyYcz5e171suiNGImFqNp7sws0KSB/0XO3zeOe1imBKna?=
 =?us-ascii?Q?7bAINp9fBz3JqveAAoExQK6g2tY/w42POYZjcNLngmx4UCMgt1PACqsbBX6k?=
 =?us-ascii?Q?osb6DraxSthYdcZLR4ZxgYqDv8sZvWPHACjSWbDPbXH+NBZCcvJKw3olvFgR?=
 =?us-ascii?Q?Q8OovhbMlHf8FHPH+EjLhTkmPWKL4R2C3bchdAww1FmP/lYdLvEJDMWAYZ6A?=
 =?us-ascii?Q?agw43lH/1XcFxfyf/fqXQKpeSeGINFsdwcv+SsT4PGRoH9VNmfVQOP5EhcTw?=
 =?us-ascii?Q?3Pw9Tvwl0VkzaqJcEsJwlaDcdNoO8L7G6imIAmnbuUARqq5WWI0vmdTvHBFI?=
 =?us-ascii?Q?X8S7hfOTojbQ1g8zSps3SX6XodOybWtAorI0tzyR1k7yN7n85XW3d/A7NkRq?=
 =?us-ascii?Q?nxTyou6JwYq947/Gq2pC/UG5r0aKPAEVynKwGHKzg0CKoVXxNWEw74cw8FPa?=
 =?us-ascii?Q?589JPaXrZ69tZcSoaPaiKoBVMYOjYQHIAU7XbQzwJqIzUjVyjg0a75M7qQBz?=
 =?us-ascii?Q?BJVw80KHL/9+DNa9EbXndBX5WgoyMWC90Zl++WxvDzozvI6pXZgyn5KIMk1q?=
 =?us-ascii?Q?C9HTyx3hBHqb/WWK+jmWnBHg+Y4jHCNY9rPdocM8Uz98lcn0W92siJbSU/rT?=
 =?us-ascii?Q?hCwLE5LFpnzbkEfgXjBcmnX7+vNeu0nBM7ylNMbAB/A1mOq83QygIejslAWr?=
 =?us-ascii?Q?L/Z3qWcrgyJN5yucJz4gzCMRT2BoX/nd4B6FU9c20wp86rirWS3Yd+qhKYTr?=
 =?us-ascii?Q?KbThyABfkNg5lOXlbBeYPIxu7TfHo6rtAUy2mIB98XUR7zMno3OowFk1gjdz?=
 =?us-ascii?Q?XFbwRRae+Bf8r0pAF1PC927IsQN71rjShf5XDDRCg5VHSyHAr6P4T4Dsy68X?=
 =?us-ascii?Q?rv7iD/pBRFSxP84RIKOjk8ietcM5CUAEEfMaihCRW+b3ZxBoaMoYgXeS7vUb?=
 =?us-ascii?Q?uNTuT6gGvihv6NIW7HFBu8BfV4OUpo10yrx201vdKUwY//9qHPklTK3q1cVu?=
 =?us-ascii?Q?qS0H8yee+0OaofTwM8mnsuKpi4LkQBsSUXK7TPwdr2Psz3jduvqLcjSLvkD1?=
 =?us-ascii?Q?uOEMMQ9OXS6/ORJE67QW4BFpGci/AEDryC/S/vkTJBMc1n7waALhBIkJlxrR?=
 =?us-ascii?Q?3fA0raZ+5CwC+ZyeeeKcFWCmTJjWwi1n0hKvH1yg31+nbN4R+6oQ37uzAVFw?=
 =?us-ascii?Q?2ZMU2vZTMSaCcWmgaaFLOEzN1ZvFr5W8YtOWoOSkcHHfXSjgR+/sTZr3+LzN?=
 =?us-ascii?Q?4NJtl3Lh2ReQmwnzpEv7ljVsySYe1yXpXahQ6WGEIyUIHcCwO+pLiT0Zl98r?=
 =?us-ascii?Q?Px7skAfT2mVV0PaVeHSDhj4CWkIy1uM=3D?=
X-Exchange-RoutingPolicyChecked: VBctDHkT6fe707ZzajjxKdEIj7jYhsACAt0PaMLJia+EnO6GsG9fU9x6G6nPpXpzGsr+HMy8gsyoTC05rc35sYgi4VoB1Hzjdz++ojGqTdPxHwaHQnQDJFplZ3eJkLpBHFeeBocfA2hdCqmWgeiGVcJJr5wm46+eC50gl9CzzvAbpr7gVBRV7HwLHIS2wzaaNJ0rA3ci5BBV4RHiVPJ2rhT1u1BC765MhHFDID7tzJiVkLNvwGR4bV97j5733QpFlrVh5VWyNgME/1Lfgs/0vqe4wVk2D6/2NJ4e0DMbKMwdOLKFY5ia9qvUfBG0Q0Aunjh3V7TjInAOOK+VtKnGUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 41503508-97b7-4d04-119d-08de95d18418
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 00:47:03.1810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhYISQSckEhHOENSRaDfcm4UxzI68X6liaDkSHjS4IBucmS0OXwyxjTFlEX0IRet+sSzfs8+cfVqz0mncb8khg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8264
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

On Thu, Apr 09, 2026 at 12:34:49AM +0000, Shuicheng Lin wrote:
> xe_exec_queue_tlb_inval_last_fence_put_unlocked() uses q->vm->xe as the
> first argument to xe_assert(). This function is called unconditionally
> from xe_exec_queue_destroy() for all queues, including kernel queues
> that have q->vm == NULL (e.g., queues created during GT init in
> xe_gt_record_default_lrcs() with vm=NULL).
> 
> While current compilers optimize away the q->vm->xe dereference (even
> in CONFIG_DRM_XE_DEBUG=y builds, the compiler pushes the dereference
> into the WARN branch that is only taken when the assert condition is
> false), the code is semantically incorrect and constitutes undefined
> behavior in the C abstract machine for the NULL pointer case.
> 
> Use gt_to_xe(q->gt) instead, which is always valid for any exec queue.
> This is consistent with how xe_exec_queue_destroy() itself obtains the
> xe_device pointer in its own xe_assert at the top of the function.
> 
> Fixes: b2d7ec41f2a3 ("drm/xe: Attach last fence to TLB invalidation job queues")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 4603ff08d860..071b8c41df43 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1763,7 +1763,7 @@ void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
>  void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct xe_exec_queue *q,
>  						     unsigned int type)
>  {
> -	xe_assert(q->vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
> +	xe_assert(gt_to_xe(q->gt), type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
>  		  type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
>  
>  	dma_fence_put(q->tlb_inval[type].last_fence);
> -- 
> 2.43.0
> 
