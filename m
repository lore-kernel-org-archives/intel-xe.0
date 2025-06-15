Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED69CC61CE8
	for <intel-xe@archiver.kernel.org>; Sun, 15 Jun 2025 03:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828F510E0D8;
	Sun, 15 Jun 2025 03:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iu0Oadym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE0A10E0D8
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Jun 2025 03:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749959725; x=1781495725;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BagWNoirUMesiO4w9TbNyZSHm7YlRw2Dz9ZHUD9XRiI=;
 b=iu0OadymBEHtl1VFaZIXe2zhQVnpq9Ay5WcGgNVtfbqVZ1wSjB42jA+1
 mLHye7Mq0X3ji+Uzb+DsHW5mtqUr2Nu04fcz/BsCFTSvHOft9lkChvNGu
 rMFGnxcv9tJG8B5SgS10WdcbO50t8cu5NJK675b7/RlBrkFdi//wXjG1H
 6OC5wkgpOdmoqAdbHuhDh2wAuQgUVI3rdmjOnzXRMBzqzi03PLAWD5vFW
 7cKg9O4Nyt0hEhvLC4XRl6XRjUypFvTxG9m3viRBMCU0ATX2Y7bKfWp8k
 KVFHL+UMi+t3gMPFlkN3pIwEN5oTynyDrsnrR9/6CJUP7Onfn9xCAfx6L g==;
X-CSE-ConnectionGUID: +qAAHp5tSbWW0jSaSguJXw==
X-CSE-MsgGUID: qJjHAojdThSM/oK+1ZWqmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="69708670"
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; d="scan'208";a="69708670"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2025 20:55:25 -0700
X-CSE-ConnectionGUID: gGfkNgT7QxawcJ4EcSLG+Q==
X-CSE-MsgGUID: tb2GHR1bTYuM+m9i4b6Qhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; d="scan'208";a="148025238"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2025 20:55:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 14 Jun 2025 20:55:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sat, 14 Jun 2025 20:55:24 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.68)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 14 Jun 2025 20:55:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMSaTn5yp2HpTPZHH7/5IaGeqJNLOeRSdRSIOPwkD8HP3v7J9DDobtbcptQS2FYbmrDT9h5hCBHZgZQyjUEQLW5GHXnBe1NOz0FYOo8hYJDhc17EJlaFnt3CNxwuzcXu1iIHOmibcrFNIw18DPndDVjbNsQ1HbMzecUaw5GjLrdMckkANGWCwXUP6D1/OcFjC7TiBBRDCpjM4RdrF1OXbL4yjZOPbo30cuxmzoP2AFOMxzkzSDy/K9J8e28WmVWCnZccomBKKms7MJpKt8Z7UXWmUW0xWpt25CrrlSkw3PoeQexZQN38mO0h8lyqqF9IjGd0NXkLiSO5yvErbE1cRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LN9qzDUa+i/3pZfWh3fjO59Byn/3i2xOMVep000edy4=;
 b=S+HtXYqa0PpodaQJHC4JjTX+MjFGrmvvlaz85INP1ICYk603b381fk5cu2Zsc66MqucgqcwY0Xru8bXvNQv6ulXfjggENl4UI5NnowqgMXsOzfa+zQf55oH3V9VkJywMmSLJ1GyhpAtVyZFj3fQ5tYE2oEuKOx2QPxo1ENg7GHYNvu79Srhp8Tm06Za6/a2Odfap/3yfEqzkzSWtQO8lbRwpzPrXZyNBCKyl4K4AKwkLXPSXEHqS8ThJNTgueIY+QDMFi5UFpjRXarA8F27OXClka8rLAbReAZ+osf+weTA6ul25yaEHBTQvTyXravCNdiNbMl2zc5q7tAzzibSf0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6915.namprd11.prod.outlook.com (2603:10b6:930:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Sun, 15 Jun
 2025 03:55:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 03:55:08 +0000
Date: Sat, 14 Jun 2025 20:56:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Opportunistically skip TLB invalidaion on
 unbind
Message-ID: <aE5EfR6LkVsZCf28@lstrano-desk.jf.intel.com>
References: <20250613210242.718441-1-matthew.brost@intel.com>
 <20250613210242.718441-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613210242.718441-3-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:303:b8::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: fe698e85-bba8-42fb-6bd8-08ddabc06b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fDNADIlJpt+rPj1+R3Z+FYvFnH4TmaRkqDWaasIvam+pOHlaXPwwBuMZtEQJ?=
 =?us-ascii?Q?fAMwWwtpSFMZUM/nGjcJ8oeZC6ysfoyqMT5wSN0TteQ7rabx3eTj1WguU0j1?=
 =?us-ascii?Q?63EylNzITUGrrZt/cy1MdVCZkhjazh/bNND1nIBrE+EnQ8mT8PWfQ4WuliLw?=
 =?us-ascii?Q?k9U+yPsCNG6AtzZq/D9NKCp6gdPbo8r/yezmbnbroX0CD54wzmfUa0crcaFC?=
 =?us-ascii?Q?9SOz//oKY3LN3fDBJRwsS+bnWd/w3A5j+GNHRhqEZe4qeYZjaEXGTV1WuOOE?=
 =?us-ascii?Q?l+GBqEg3N+SR/BOBANAHa4eYZxhqMCyMVaUZon8tgFrkRabQuDZioLif4G4N?=
 =?us-ascii?Q?0dIAs2CaM6ybryyuIY9cKbKoFYgifg86VWMcxjIlyQpN9ugefwsd7ynBnWT5?=
 =?us-ascii?Q?dz6M0ehXWr7km5RnlNFRmfVQSiKEIK1lpyGf4TvKf8gpF9Ose1BlaEHJ9FSw?=
 =?us-ascii?Q?0zHw9bNmLNl45eu8eejdMpk+FOfy/HIIbBpJ2E4DHZv8Nz7HL5cJFM6/aX64?=
 =?us-ascii?Q?CUtXcLakYtfLqlR4xpkpWY1DIced+RxDohwR5WVD91cHJoOvhGKldWodaAnU?=
 =?us-ascii?Q?SHXVZzG/75f1mAcA4emd7ntn3Uv4Doi5Srf8JenR1tvPq+8lbhRWYb5jDiB7?=
 =?us-ascii?Q?YWCIi7c4hFHeTjrNLqIYxi6LdmRlTsyu24r2gOIeRQXGY+nIuxzToVDwmN7+?=
 =?us-ascii?Q?qiqn/r+8oGMi+6VkFdR1a5IHtYYQFjK1bH0j1iHXDDCyEKKy8K76F4l4DX8m?=
 =?us-ascii?Q?bR0aLmzPto4GilRRAwsFMML5tdZ2ZUuDUCk3ns+TIlWl0sVgtCO1NulAVMg4?=
 =?us-ascii?Q?9KhuMAxPpwUDzBXuqiv3/46K166Ne3eL/D78oZ/qm64Hl/a/vUXVH9ZwZHgX?=
 =?us-ascii?Q?mua1ce4pX5PRNMSuR934Mm47x0b2wbrfEcB1GLq0PITC8rhlrGm8msWkUlRK?=
 =?us-ascii?Q?OT++fAXrDy5o2jJkV3JOFc4Ok0gSr5KZvYJC4ox4HqUbkGYLqrgfv4CGea9H?=
 =?us-ascii?Q?shIwdLmIbDiZUpVzaFFJQKAkNRH8IfwwID0+z4BiZQPS0D5WWU7qU6nPRyvI?=
 =?us-ascii?Q?1yGGpqGOBXMcZtdEvsw3K5Bhofgn0wx/6NS9e5kH+1+IYv1cnodVDsgn0aQm?=
 =?us-ascii?Q?g9F/YSbBLC1Zd6ec38x+BkPhl6SXKYXgT2OCltxf7SquK8+WJLm7NDM7zTf2?=
 =?us-ascii?Q?ARtu9kfyzJ71FiZgirJ+wK2Af4ytkhSp6ZGKN3Kz6O2zNDKXKf81ErkrC4k9?=
 =?us-ascii?Q?bH5p4S+bWWkEt1kCdR5lqG/PQi4BBR38mxrChwk1V9mpoSimiOl/JaDUFNNc?=
 =?us-ascii?Q?FYUlHijeA/c9QHxpM/SGMwOL/3aQ/S2upaxDuZ4ov1osjcOMpSx1YEomXRO1?=
 =?us-ascii?Q?GEjI7fM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kb5z9NVyhCunHpIYDcphtd06hnLhaGR1uOUgWHpPCP+PzfSHtC0C/UfWTto3?=
 =?us-ascii?Q?dyBfOc6g9fR6aM7GpA6cTiTUbM10sMqf4ioKYiMxbbgqywfyfGaEah4VgrXd?=
 =?us-ascii?Q?ElN+UNRe9whyjhVao79FLHdzOn3wXPxskE5K/h1YxQFG9/FPajmkWhe3whnh?=
 =?us-ascii?Q?t+8mYh29s08eSkRn/6jUq9+exVVyNSnVWJMBjid32tGUNSYWrlUcOHYLxR0a?=
 =?us-ascii?Q?xUnmmyCPJKZTUf5Dc6o0rTavobSKfEfDbc5/mImbbY917ySOVD7A9XaT+fTk?=
 =?us-ascii?Q?YdykACnLxYEw8AnAfBkEspaiAZBVl3zWQwC+g1y11zSPrDRHRCM/KFIUm5dh?=
 =?us-ascii?Q?FcOfqwMBDbgq+UXf/byoJoXMDBLVoVpNHsKb0pG7aYtQZ/2LoYJM53+wK+x+?=
 =?us-ascii?Q?yrPNfdZGA8+RMz36CKm48cjtc3/WAwExAqK6ozlrP9XeUDP+veITcKO+u96/?=
 =?us-ascii?Q?wYsAIy8dNRX4VNwJcA8q5CJrktfYEHbproCl8/gLrd8OGPUk1y3SFZPhytV3?=
 =?us-ascii?Q?JEmuQ+0eD6r7Jpr/sL0MudxbXtojgyjesyJREOdPk0OFxPAf/+BdOWEzfUtB?=
 =?us-ascii?Q?AUs5eYEw69+F+fihwmvd3zKK00CmcXoD0YPj1U20Gz6ASPKPiOvDsPaqHwC/?=
 =?us-ascii?Q?4OJuvPnTRczCJUKy+IpaFknehziX/qkyDC3j2wbSmr3UBLkbHqFDkzg5fxUx?=
 =?us-ascii?Q?x7cxVlbUCK3KmK4O56QH7WF9f3WoyHv1AvZXI4LmJGHloBFmm4oi0qUC+zCu?=
 =?us-ascii?Q?vlfszOxyXWNThYVFcm7wYJhPxwK52nxegbTcNnbHkU+3ZLBz6A//jtu/XUv2?=
 =?us-ascii?Q?gg5wDWo+uHsjIv5dKhU/pjTfN/SBfYTb83k4hEZvscw9+r9IM/jy/GS/T+dU?=
 =?us-ascii?Q?0Zs2vdG+tl5L/W6+EpEcMwdbquJ4/s3A1cklcqiWw5bFuaJ18alp03I9Toos?=
 =?us-ascii?Q?l6xM4uZMlMvIIMDIHoPiKBGxqg2cLnPND8oEoFRLvOmsQDeUrbrt7gIV5Mf0?=
 =?us-ascii?Q?rB+If+rorgfJyMCQKg1fRP+eXqD7ptCWwVg0tLcJXPSyRoicObkoevMF+04S?=
 =?us-ascii?Q?74LA2mTi80JCuVbLeoFVEBver9+fmaJkNEFfbhGELuIXrZdhXO4ANVrJk9mT?=
 =?us-ascii?Q?Ltl6XuO9Lau/5wsmxUKa4mGGYPDqTm8yUbxB4ZSmx9q8Z1MOJ1E97ZJ6Q66y?=
 =?us-ascii?Q?9301xg5rSO8M2kZm44wfnxoJvLKcLEvP2mOKYJFbUjHfcy7My6nqAkenAoKk?=
 =?us-ascii?Q?Q6b+GeDwFZVB2Mo1ae2yrjF5d3D3gr+6wN5myTmimvqH/r2AWK4aXCAeDGFA?=
 =?us-ascii?Q?PX7aUaOGXH9gzCcHurx6kfu4XK8dgNSG7+S8VSizv3vG/IC4mf34tnA4adcl?=
 =?us-ascii?Q?sdfMXxWPp0KMdcTryj+mXjd1hPvtRWSeGm10KassFkHXm/5EBuigccB3fw6c?=
 =?us-ascii?Q?O5Vb+DRDvKbhm0xd2PWGhtHnsUBHJJspRK4oPG/4miUqDgTCl1YA+29udExm?=
 =?us-ascii?Q?X4+wLp5eX5xZlJWAPlMj/HID2FlPE0edH6g13d6S9oMbIHDMEnoQ7VjnZgl4?=
 =?us-ascii?Q?TCHLgO1J5Ebv0BcLaTxxXVtUEZ+MDLvjPw19+TN5mtgAwdAcgkkg/WFm6WxM?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe698e85-bba8-42fb-6bd8-08ddabc06b91
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 03:55:08.4450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBycSvzkNiAOJnCbXc2Om4D9Q5+rXxqOPybhJCR2aosfthsM1MAwLEgB+SvIHig2BW4dmoS8hDN4QzVKUG16VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
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

On Fri, Jun 13, 2025 at 02:02:42PM -0700, Matthew Brost wrote:
> If a range or VMA is invalidated and scratch page is disabled, there
> is no reason to issue a TLB invalidation on unbind, skip TLB
> innvalidation is this condition is true. This is an opportunistic check
> as it is done without the notifier lock, thus it possible for the range
> or VMA to be invalidated after this check is performed.
> 
> This should improve performance of the SVM garbage collector, for
> example, xe_exec_system_allocator --r many-stride-new-prefetch, went
> ~20s to ~9.5s on a BMG.
> 
> v2:
>  - Use helper for valid check (Thomas)
> 

This patch doesn't quite work either - I'm a roll here of posting
things that don't work [1]...

If we are removing PTEs are higher level than the size of the VMA /
range, those will not have been invalidated and could still be in GPU
TLBs. We need a helper to check the walk results against the size of the
VMA / range too.

Matt

[1] https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1#comment_1206030

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 59496c1a1e77..39947fd5c3a2 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1988,7 +1988,9 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  					 xe_vma_end(vma));
>  	++pt_update_ops->current_op;
>  	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
> -	pt_update_ops->needs_invalidation = true;
> +	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(xe_vma_vm(vma)) ||
> +		xe_vm_has_valid_gpu_pages(tile, vma->tile_present,
> +					  vma->tile_invalidated);
>  
>  	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
>  
> @@ -2023,7 +2025,9 @@ static int unbind_range_prepare(struct xe_vm *vm,
>  					 range->base.itree.last + 1);
>  	++pt_update_ops->current_op;
>  	pt_update_ops->needs_svm_lock = true;
> -	pt_update_ops->needs_invalidation = true;
> +	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
> +		xe_vm_has_valid_gpu_pages(tile, range->tile_present,
> +					  range->tile_invalidated);
>  
>  	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
>  				    pt_op->num_entries);
> -- 
> 2.34.1
> 
