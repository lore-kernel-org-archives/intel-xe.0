Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899FAC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 20:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393EB10EA5E;
	Thu,  3 Apr 2025 20:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eni9m1pf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5896B10EA5E
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 20:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743713472; x=1775249472;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vr5sofbMtrSAmEoIxovFBkgCjWTNzqjfJjGebnkbRBo=;
 b=eni9m1pfFyg7X2mZY3xX99IsNNyOMk6xpkXEBmp9M53EfXbFUKQIeM9s
 w43mEucfYX0bCPba0aZqR/mcSoB0ecBdfv/h3m4+w1Pt6D4BjcZJSAoko
 /0uGGVKj18wkskQWzPMgr0+qoBIkqamLnRBAaYKjrkgLos1AR6W2j5G4x
 sAzXHzQhNcpM1H1J6lWxL4CsfSXF1R6m+5qhs5N0mZQqay5QS4TrSxXxV
 gOOZ4sJId3O3higDErf6bTLsu0zbk/Br0vDa0DmCc1xMvgYpNU4ZQKLig
 DD0pTEnDjZV/7kw2Dzm7Z5TI3fBDDE+FMKGGrZfYlTiF3AVEcGNsW8a09 g==;
X-CSE-ConnectionGUID: Nkj8uhYBScKi3dUwH0CU8A==
X-CSE-MsgGUID: 2RWFGy3WSneCcnTrOcL8gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45287045"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="45287045"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:51:11 -0700
X-CSE-ConnectionGUID: al5u3aVRR6i44CIjNXOeCg==
X-CSE-MsgGUID: TZrNQ7M6TS2gRf5IkKaTpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="132245839"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:51:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 13:51:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 13:51:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 13:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFpiUnF9MqDjEVC1/w/v9WhI7X1S2dYOacvxW8XHNBLiM4gfF3Ts9LRPf7JbqFYezGNP5o7x/+fPAPkNy4JPADNbLAvXPP8wY/NggA+L6iljqac2uP/HOykPareL9xq+Uxt8he0qvye11WkYaYfjl7VvfyqBKmLs9BHaZ2GeSedcYxLFJws/rwAwObod3/BArCByTKsqVtbU0iF4A9b3zvCkX1KCLt9iXqJK5c98qS32iP/Rhh+Y7XtxsJj8oqztpAGqjEh/zxEIO6pifz/p8VLtKT51O0pXWkY2CXBRfuS5C+G/RhNzFqFLZ9wowaW/SAUdTp4/NFTd1wNAvEFAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t541PqiHjrAy+fWQV4H/Dh8ThbV1b9BZGYsHchZlnYY=;
 b=bY1CEuWT4ix0Hwf0xVv2/909P9OLPpwd/iCUR0r9kHn2Ahw23N+1pZFPphdYB/A46Tv8ksHVF8Fqi+uZWiUJkJIA1eH61L2msC3V6lrUvoxWyZ4mxazBwwodb/YEI6cPZim9Pjo4Z9y9isM2o1QcZoo7Wij2oGdh2oTa31yZNcRb4J6yMlmRCH27iXay7RqPrkGvHTuSWGxj7n6LGXbzCEsng9WKZbCadg7TAHdyKy5840wNR0BvWMnGgBaQG/gaHe0HkAKePZuyOabHahSSJ3Z+7zOEK62AKHqIHpdHR8BfKXyzgnSh73ba3mtSm9B/TbezoPWTNpVApVUBDAlvUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 20:50:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 20:50:48 +0000
Date: Thu, 3 Apr 2025 13:52:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [RFC 09/29] drm/xe/svm: Allow unaligned addresses and ranges for
 prefetch
Message-ID: <Z+7087lxPgQWSyez@lstrano-desk.jf.intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250314080226.2059819-10-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P221CA0024.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e2a2909-74b2-4ae9-a240-08dd72f136b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lsrYx/lsHMec9lmNFro6k0PilmWHCT3EPYH2/w68IlEIZ2EGU+EHxl/kMVoh?=
 =?us-ascii?Q?iLCyqfp0G0UQo99h+HcJ3zlBJbw96rMnXJYPQJdHHkQt/OjlVGabEccxlEKa?=
 =?us-ascii?Q?11ff7YJkgBDYigM9eoDd3mFQfb3Wl+KySs45UAy8xxABCJNMdSG+xoDxZ6/L?=
 =?us-ascii?Q?Bc5WQ97rGNiUV/WKhs3V7Do8atxk6gfjcK8bHnBqcj8enUt5X6IielJwsAXD?=
 =?us-ascii?Q?QGb/BtOihNgrmTnVwufg2Zn9ftF41WmCwDJrYKif/6GMhKF1K2XBB5KRY0z6?=
 =?us-ascii?Q?hUmCat6nK9i2RAV3N8K2YKc37Lm8K7Cx5ApByrSOVKy+LoezgK4yBnB6ifla?=
 =?us-ascii?Q?miPKo++wIrFrAg5CE8uUaIpfTtZAyMKwNMYOeb46vX9eQW9lTMG2KV1TsYtM?=
 =?us-ascii?Q?bck6Awn3AkA2ruaru2qEuoZ8k6EdSMcFV8jtJHhgJ81WT3ZhzyQnw9ErNKvz?=
 =?us-ascii?Q?hZIsdEWzqvf9YyB/iTPXevlWyo6LkozY6pfkX2gDrKg/lcPIu4hY89q6HEL7?=
 =?us-ascii?Q?bCVJ5MJLKYM4m91hD4iDYZcRT0j0MEknTImUI38NFb92QfdY2U+2lpm7MpiZ?=
 =?us-ascii?Q?B9sN1+KPN/7dR0MKgeWVtl0F3p7+g+N2fxXPWB/rFamq0aUrAx8COTimOrmy?=
 =?us-ascii?Q?Sf8yBePaIdDxM7QHbNPQXIGnZln0AcJbTDP1u+79XnIdD7Kcy1oLYCBUh5Up?=
 =?us-ascii?Q?oHvFk0IiG7sqDRfqp8fgp6h+qzTkrQr7u0AGIU/E0wFYAx3v+D0e0/GD3f9m?=
 =?us-ascii?Q?FLivGy4OhJkWcdtm4qKDkGUU837yT+Q8XucUMZN5SB3IA7v7yAkZWEBu6zyq?=
 =?us-ascii?Q?ocllTIctmMD/VGpvEQhLJJ8DY5jmeQp60GK1+Vcbot90KOgcQmJGIguq3CaY?=
 =?us-ascii?Q?hXUQ0+Y7Os5RAxqR61cIx6hhzP/nMf84lz+IErh6Gu4p5redPCMrdLr1Ft38?=
 =?us-ascii?Q?1+guEpefbT6Ocj01YQo79fIap5RjLlO206M8ncf56vEHI2LuNAr6N/skDGEk?=
 =?us-ascii?Q?ZhDpzehDl77jyL/7Tf4npjqPQpN8LNLb2+hAEbubaMUdc7zFY0hf17W5aOpl?=
 =?us-ascii?Q?kDBzYgD7PTquHAw6mmRtvI1lvxOFM4JPBQLS4STBUoFg9mWFK5A+3QPVlrD0?=
 =?us-ascii?Q?bNHHmphcWTIX7Lv7CmwSng9UgQv3IC64phDiQGVGcy41WOZfozg4oHZ7Qqf2?=
 =?us-ascii?Q?CkPVuod/ss5TwgBpancnKns7vqsy2Tc0eVvGws//Tnm63JasY1ww2BmkQKIQ?=
 =?us-ascii?Q?LmJTPq0L6RexMWtYts7GXUZtyew9f2uKp/OEAFF6QTeclQINveqZJc6+ISKI?=
 =?us-ascii?Q?2ZzytwX/YBNe9gd4SNWeWSLsLdICUDrOjhtAnsbWUpedNHPPGy8YdgJgIpG4?=
 =?us-ascii?Q?cTyY5vsqjLQZMP59Qynd4OdEaZiT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/tLRm/ZhGFkFDM4w1QYZQbrQwPg/qxVbs6pzrl9gcQYTfNqTGo7eHTuuMPNw?=
 =?us-ascii?Q?ERAO5GjQwunr7GGGcXbcZlZC6bfKeU6O8vxK2ptmT8X0im981aRAIxgs2uf6?=
 =?us-ascii?Q?QuoxOfIKRWFOtw00Ex67V0vExYvr7Utx2OApGJLG/wNsNId15EcT821FBUzN?=
 =?us-ascii?Q?oS5nxGQ1pMQ47BNE5DekR1uAnJwVXLGT5Q4cYbwxOaoKjKhTJ6FQRvwii+Db?=
 =?us-ascii?Q?2tb+1mkmJdelVniJYlWHUwF4z18f88TRvvRtfCZGuwC8+Vo0Kz8sp8paeMhN?=
 =?us-ascii?Q?CgqflLnx+AASrHERnkGvH35Ny6SwaIpfovI4NkUeGzFNzAOmgn+WMx93DBpC?=
 =?us-ascii?Q?zqy9ODBsxWqssnpxXTqFNtOOfZPyS+jTdbvTX619I87MImH+CcP6FXg9SWLq?=
 =?us-ascii?Q?e3I1I/qER/ioeOfbRRWvGcAia2Nequ8rucqnv7BhnB8Bjw27LG7OJmaiYCT8?=
 =?us-ascii?Q?WSu2bnOOyUpMpXV2XwTByB6GcdXTxwSlZa8Q4SWJdJVIaQ1spFTpvNPU0y8O?=
 =?us-ascii?Q?0naewlMGhZ9BbQsFkaqOl3xhDqzPYK39EsobYlEIRFmV067FyN3mDfu+SYY/?=
 =?us-ascii?Q?0wjOBVxtEhtSFOX2iw/f4ojEVfuRXyddsRLtrDgxdojarG1h2Ei0U6SiZyja?=
 =?us-ascii?Q?RMQj5oRmjjkbTPJv2L+Ybfo/gdZtP/BkuTRgnwSwNtoBlipYc9nJgW7n6J1X?=
 =?us-ascii?Q?G5yBE9tJjfp/xAWgZziIWMDVOarhpUB0mivmmB+r1VZ+cAk5xCZC4EbCO97T?=
 =?us-ascii?Q?Ai+1JjwgmASuc6+UBLTyn6TgfQZ2jhcWZRf1/Pr/DfR0j4tTz+bYrCZzg2Kx?=
 =?us-ascii?Q?eevWGNI5dlZObjhaFv24efqTb76nkgNfLHjOCWwLOrT/RhWK19NgXVA4+vfA?=
 =?us-ascii?Q?wsmfm6nW/a08XLX3uNHFOg0iJKVtA1qz05kf/1K0BoVkGZqFNsFEjSR3cd4Y?=
 =?us-ascii?Q?hXHn0obXSZLOvH9h6vZ5LQb4qoarqLgllyHd4+gQCfcLquP03C1Fk48Kg8zy?=
 =?us-ascii?Q?qymnWH4pM9lb3XGQ395YfRpOx6/oImBAbxDIAmxI1RD2nCm2YOhsrCjEiLcQ?=
 =?us-ascii?Q?heZUGSK8CHv7k/3TH7r7McDimVR1uMQ1g4GHwP6k4fvkZwOFD/RDIXU/OTK0?=
 =?us-ascii?Q?giK9GyrP/cFDG7Ku/WYEInX6FPQK8m6sygspgACLr9ufgP1xlZqqS3N5WgVL?=
 =?us-ascii?Q?Rbz9U3wpvxSBDMmi9mXXy+EIq7z4MUGx85jBZGUuGkQ9qFVEXcN6xqIumNMf?=
 =?us-ascii?Q?IKT/eWDaJcRt+gCOCdX1zifP2kJIuQcnTwAYlfJfQFCufx6rHAttwMENyaFr?=
 =?us-ascii?Q?mjK9qTJMdRFzOevwL/vDz+EIae7MsiZlYj9tI6S8FROiNuIJm5dAG4pUpBcL?=
 =?us-ascii?Q?qH0U4hmdG6gBoqCu0fI9tpupu5+RjMp8RUibDnGbKFCRmow9PZMAoeI9sHMj?=
 =?us-ascii?Q?y1FcWqc324sl4XMK4FxC11fXaGP5BVwjpXur9oou7WHGUi3dnz+uHBM0UJPt?=
 =?us-ascii?Q?2QxVt9Tt8M45FKj/Msk42k1g7nSPuHKkIElciC7U4HOFB9xxxK2gTOxAOWpr?=
 =?us-ascii?Q?1ZtsCErGb0CdOS1hLnclRY64yHkH3ynfQ7+ewlE512btu1N7/QVRsKL7IX3l?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2a2909-74b2-4ae9-a240-08dd72f136b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 20:50:48.8330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wq91P+oQXTQS2QL6ti0/iQSRbpexA6mwYoy8zrNLdYDpf9EkDiPic6KYgBqVO3PIxgR+fUW6SjSEnsWjnJSzBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7489
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

On Fri, Mar 14, 2025 at 01:32:06PM +0530, Himal Prasad Ghimiray wrote:
> The SVM prefetch operation can handle unaligned addresses and range sizes.
> This commit updates the ioctl parameter checks to accommodate unaligned
> addresses and range sizes for SVM prefetch operations.
> 

Do we really want to allow unaligned to page size prefetches? That seems
rather odd use case. Was this a specific request from the UMD team?

Matt

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 07cad2804b14..c6343a629c02 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3086,6 +3086,16 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>  #define XE_64K_PAGE_MASK 0xffffull
>  #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>  
> +static bool addr_not_in_cpu_addr_vma(struct xe_vm *vm, u64 addr)
> +{
> +	struct xe_vma *vma;
> +
> +	down_write(&vm->lock);
> +	vma = xe_vm_find_vma_by_addr(vm, addr);
> +	up_write(&vm->lock);
> +	return !xe_vma_is_cpu_addr_mirror(vma);
> +}
> +
>  static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				    struct drm_xe_vm_bind *args,
>  				    struct drm_xe_vm_bind_op **bind_ops)
> @@ -3194,8 +3204,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  		}
>  
>  		if (XE_IOCTL_DBG(xe, obj_offset & ~PAGE_MASK) ||
> -		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
> -		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
> +		    XE_IOCTL_DBG(xe, (addr & ~PAGE_MASK) &&
> +				 (addr_not_in_cpu_addr_vma(vm, addr) ||
> +				 op != DRM_XE_VM_BIND_OP_PREFETCH)) ||
> +		    XE_IOCTL_DBG(xe, (range & ~PAGE_MASK) &&
> +				 (addr_not_in_cpu_addr_vma(vm, addr) ||
> +				 op != DRM_XE_VM_BIND_OP_PREFETCH)) ||
>  		    XE_IOCTL_DBG(xe, !range &&
>  				 op != DRM_XE_VM_BIND_OP_UNMAP_ALL)) {
>  			err = -EINVAL;
> -- 
> 2.34.1
> 
