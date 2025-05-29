Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1C6C5AE59
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 04:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F0410E1C6;
	Thu, 29 May 2025 04:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKrpXwUB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0BE10E1C6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 04:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748491292; x=1780027292;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vw9TfVTxRVpEl1Ar9yCF5t4L2O3OIBwbYKhWstHI978=;
 b=oKrpXwUBdW6TMlWZ6Lxtgq/biR/Ufc5Ns4Kuv3tfMe66nRGc1Qq5S3P2
 KutPIUaUbuVjVM2A4DhkSrE9DLNUlZeuowCxmIN6rzlIJ5E8i1g3R70AC
 XQ6ry9Ls/U/9M9/6rxj+88/QCW2zR5xydooeH1Rj0hhoPQvGE71lJMGkc
 ZZNdsutni/H/ZYGmtBj8ZNRbSD3mlcXCab3MoHZkhIBsNEBFGEiUooz/r
 RUOlJtS05qMDb9JdzAe+5FBC37E+9qW4ozEYABsWehH1uTrDzSo6FekOh
 8FlCeQ1+IAgp7/1qyBgokuiGIOUzu5mxWWiI6lVnqoyF47/zhmWddU84p A==;
X-CSE-ConnectionGUID: I4Gy6q6VQtW4O9jkAW9LCw==
X-CSE-MsgGUID: dGfhNjU7SOWxgSt7nE6GYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="75927417"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="75927417"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 21:01:31 -0700
X-CSE-ConnectionGUID: Lq7j+S5UTv22/x70kCQHjQ==
X-CSE-MsgGUID: sKAA3aKvRLuVD29kn0T2BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="144419810"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 21:01:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 21:01:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 21:01:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.73) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 21:01:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQ2FGYSvrSGzJ6kwIDIg/hf6VjS5fnxOcSXA3qoCzLhvyyHBeE8Mm3hRpU8SzbHa5Yx8pincCH5dC2bKCVZgHvjwosNO/siy+MEORpZkmg710jix9iGsyvCl+zGVcNubAaJqjj3Ll/wYWxxKHd5fvNYIdpR2RcjneyrWWq9vRRE8OixYx4CY14ZfJCNMiVgXbHQrKsaWSjYV+zTKnzNOhTaJ39QoBfhQCjIr4AutgyS1Zot4Cim7J6jWt9+gZDWBvbP5wpiOEmDq3GV07yPRQ30+pvUHK753NxbDIIzyTOoTyztl5AnO1QB5ty2GpBCi57k82Ri+CH7O4pg5keOHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hutlWQrayZWTo0cHUtZkIHiQumUUxYUUC6/X4OHIsVs=;
 b=oWp9liX/JFIo9ncbZe2rL1iHi9QJo1pBxzZO1NpY5IumsSEC8krhQZuuWG6wGhkk67O2ia+0QoAk+h/OBIGZV6HPR8dbL6X9NGU2heGac3QFwNMVhPRO/c0mqMHk8mCkRuQNd0mVyOcZMd8vB+QfwufWW/MIpAUDZustO59+cInI5tEZ83SZ1USDAoe0wNM2u5xqIfzb68Xu8fEjgGL47c6B6YWflZ1Ny+ZQnBftWcgYE5oukc1SM9TReg6Xx6rVE9wwx31w/asmws0UTg+wkmaGtoNoOyE0jjoLKghoFgzbGa6K9Y5EISCunz8xgopFi6xnKIwKrvJpEKCCkmsflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 04:01:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Thu, 29 May 2025
 04:01:27 +0000
Date: Wed, 28 May 2025 21:02:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/vm: Add a helper
 xe_vm_range_tilemask_tlb_invalidation()
Message-ID: <aDfccjhMOR/W8IuB@lstrano-desk.jf.intel.com>
References: <20250529040439.1447961-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250529040439.1447961-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:303:16d::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF10012BF96:EE_
X-MS-Office365-Filtering-Correlation-Id: 2148dc84-4739-4fa4-a148-08dd9e657c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fW+ZGdNK60/HrBUhQDI5UQFszejy6kRRyZiOvEvyaKj4K/meCPoYsa1lCQhb?=
 =?us-ascii?Q?hPc+8CyetRR2PBJgPCnHW/R7qZIzTDWA4aPx0kHmxRFqPgthdbZvo9oTjTnm?=
 =?us-ascii?Q?LrwRLIk7RGIQiCscBWKZ9DwLylKI0XIl3i6aolWTNQO17ycGBT1Pame0zWjh?=
 =?us-ascii?Q?bxj8jZtO26xUF3pHi6BZ2RBKNJYGlPxdqbl9EaZrvwC5MB2HqmR7qa/Eo8fv?=
 =?us-ascii?Q?sT8S70RBWKPXnwHUT54f2ZJPvFdq6gv3KWca7cTXkfUNKyIW+85NYoWIcIFR?=
 =?us-ascii?Q?3LD6mTrozSAVawy7+lIEHyCxQiE/t/tIn48D1SS+QLFFzWfuf7oYCux/g6Lk?=
 =?us-ascii?Q?Rr9zh8L6/MwBZfXjJaDs7svTKbLtdCvqXhkTrlwK4dquiFqZE5oIVj7Ph/vR?=
 =?us-ascii?Q?DRJeigHFmDNYM242NvwKgjlqgtyBbdFaMeXvrsBiMxfOvklWWyXXQM4TqfsS?=
 =?us-ascii?Q?4WKKsVb8n3oxK+x33NMSznCCuEt9cJbewtosHvXwcKve+LmVN33huYF2Q3c+?=
 =?us-ascii?Q?VrEgx0LTiK7NYgk2AIJC7agJ/NE66ds//vGz+K8Knki/ophNXqyJA0fM5eXL?=
 =?us-ascii?Q?YzpIhXn5/6NfPSQ7ctgzyosFp22n7a+oj7j2+zJxi3ZDX0UsoNaCU9WWmleH?=
 =?us-ascii?Q?7a2xxkiHNFlA8gM1eithupHcydcHLTcVjtHG/IirSgDD4atudHV1x3ej+m/a?=
 =?us-ascii?Q?JnTE+kj+LuBrqCtzbztxlk63lH1UMwE3rSkFLPGCoLVaqAafSjZCIXo8u/fP?=
 =?us-ascii?Q?Gn74J7wyNKOUkCcscnu39WCKWWi67b09kO5XuUUzzJ36AFYdh0642Kkw35ej?=
 =?us-ascii?Q?oqCzmANeyJ9co6uEGw6Hul+Y6t+iEhz4JlIpIBZVwEHbUE1Ab3b5487Moxyl?=
 =?us-ascii?Q?QMgjDCHouWjmkvQYYPbYLLf5z4QSzbCmUDbt3MA63p1FsDDSKSIMxIdY1hNm?=
 =?us-ascii?Q?PyBjLIFv6UtrlHV5nPTcaY+yYWYtZEze2TB6to3Emt3x0xbvo/6mbrCERZHY?=
 =?us-ascii?Q?2AP/OsCg5ugVj7UUP3k8nopVzTCzcrvGHE6vhcqjw4MqLlj8fTatd6dS49fz?=
 =?us-ascii?Q?bEjRWAerNYc4qxjSWStG3g1OBWm0MC6LIwbNpYcKABx46VUwtMIFMY8AxBt0?=
 =?us-ascii?Q?WWWv3cTTQ2PmUfGibyS5u/UJTr9bzxwPSty4mC5YRx4fKq/KqfwqZGk3C2IW?=
 =?us-ascii?Q?L7U47QZFWkgYD+MLDtot9JLK//KwGtnDOGYUO+NjDgCpnLKYC7FoqWzX+8eH?=
 =?us-ascii?Q?A9yP5+5Th6RVXhAbL32otJSlpROzKbeTIry4WeLYqOMu0VHD0rQ+mbha0dlC?=
 =?us-ascii?Q?07u5RAtBNyJonusjfj0KjcOqMeFhFf6OiNlI5q4bn5JzFouO1JmwEgqsdev9?=
 =?us-ascii?Q?r5+fej/rixe6Us3/JCkPdq9Q2L3eVsdoJWT2wudgv6uDRkCir4hR6x2i4cFe?=
 =?us-ascii?Q?K3Wv/Fzfmwg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a6PAKFh+Jklwc94SKbiRcga6n2LMD3h9nuCxGXMBJFlziyvlWi5HfcGdLV8m?=
 =?us-ascii?Q?ntaHp85RTvYRSOiIoVTGaz65PmGkQrYgcSzdMbCDux4CEYyf6b/qFMQvdqaf?=
 =?us-ascii?Q?Ov4jcYhkD7UuHJUWEVXDb4+yZs9alTwLenXc0ImkjN2up/BmknIzNQ1gZEAN?=
 =?us-ascii?Q?mLvVmErkIzQKBa96txwLdrvjWkNcgkZTM/xeP+ZR88ByndZATYPFxQwEbqnR?=
 =?us-ascii?Q?K5PodwUymESg7LNYGIFf6SvQnEG5dYwiA3AmRFxzpnkjcuM3jfiLcwRpvEe7?=
 =?us-ascii?Q?Jy6oZTaD2vuF63O/+u6KCp1/MdkkTCsz1g/DSYW7QVHfQU/TJv0ZFpIlsy6U?=
 =?us-ascii?Q?1cxl/AoQquwHW0uAfCeUcZ21JOGSwC98PkhCOFwsNI6IjbxI2xRzlkD4RCCY?=
 =?us-ascii?Q?rGfMwkTSBqGr6ZJ1WBJk6et36dMvuVxroaBNZPq66HpwHfCG3Xuy6yeD+ZvA?=
 =?us-ascii?Q?+G8+zycW/JkpR4rVAGxMZ94nrv2zmBo3G218ZVbMivSULqMYtV+DXnnrYkB1?=
 =?us-ascii?Q?+tq4sa6I7ccJKq4Yc4f1ZZoRsaCs8kqW5aLOxdXdRfxA8R23UFKRAMgontGs?=
 =?us-ascii?Q?Tx4r0Z/DKKldeYDMoC51IP6xs3G6FL8s7NF2eq/TWOEeA1HG8DKoDBqqGVay?=
 =?us-ascii?Q?Y49TxrjO2xHhxHiisSXaMa+9uxC9rDjCujT2aC4WrjzX93EaCMema79FHdPN?=
 =?us-ascii?Q?/R+EKZAD2MQOumtx+pV9detTLzssFsLTCx/1X90XfKZEpvNjjp+Yv93BJYYW?=
 =?us-ascii?Q?UtPqUBJjkQoW+CbkeXudKQutuN9v6MXkdrDmKkSoEJC9HcAuweAdxf3I5Rul?=
 =?us-ascii?Q?dU4u/YTI4A9/nx39auZTirq9gpf0d1X2jCp/56aRoDiK/X4g02ll+gQYxeOM?=
 =?us-ascii?Q?YvuKw6TNcaTr1GOjg0tHAe5NThCRt7Hj/JkQVbibwSm0WqIQ90blcFZMdX8Z?=
 =?us-ascii?Q?0OofG1JmSYFx6Vtl3Bk/z3qWKeERA71vBlL10W7bYPCf7Ij0W1s35z0uRs3G?=
 =?us-ascii?Q?yRqJ48WYS0uikSwWAVw9YOZfLynC/i2dxw9rVgMDo6+brxuyvTkppkeQUUlg?=
 =?us-ascii?Q?4mhhWBva2b74/YPw+2OnjecJ8JVe7NWeySMjWgPzk+Z8jITJA7UQ3MVKkIzZ?=
 =?us-ascii?Q?YrqC5/EH3bEIZPvKY5Kq8QOJ90NUCl0gGCQgJCF9VMMTLgHKAyakhSXnou6z?=
 =?us-ascii?Q?ia79a32m0+qHW9wpoCN6lKwNR3TYZG4HU7PEbdzuXtg+lwAYuKJCwh0KeyNL?=
 =?us-ascii?Q?7bfqbSz2CJYxQjgKnqgRla+T9qL3AYKFK+LupJC1Saf/Tnecwz7lCzL8grUd?=
 =?us-ascii?Q?Rb7F+4K/47zsqVyrV/JIwRavAyFXgZTAjbcFWrzTikNu7nR6qEdIC3491nEs?=
 =?us-ascii?Q?AB9rU8575L+lRsFZyoKbPODmrewgb3qISxCCDg8PGorqmz4zr6xAVqOq7clC?=
 =?us-ascii?Q?bWzOS/6gJOLW8LI/HkCbZi9EgGZuD2HEGUQ8OwBs7R1ATPggHrnTW0YzFPs2?=
 =?us-ascii?Q?SieNoR3ocYxBxWnPnUHaummDMBEbZgog0R2Ofs2G0afwEeLvXQYZqqdHTYGh?=
 =?us-ascii?Q?KpRl6u/LqN79UnvNmIIRQvN4ULHo0FQFiQU2PLVgnx53aMvT4YWFc5oCi9Uh?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2148dc84-4739-4fa4-a148-08dd9e657c66
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 04:01:27.3332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTmmterqF3pfkN367hs5yZTTg9o11/oKecFFc4x/8feix+FiodiZwJRBbZ2oj3IXF45FVtcQRrFLptbgTatieQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF10012BF96
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

On Thu, May 29, 2025 at 09:34:39AM +0530, Himal Prasad Ghimiray wrote:
> Introduce xe_vm_range_tilemask_tlb_invalidation(), which issues a TLB
> invalidation for a specified address range across GTs indicated by a
> tilemask.
> 
> v2 (Matthew Brost)
> - Move WARN_ON_ONCE to svm caller
> - Remove xe_gt_tlb_invalidation_vma
> - s/XE_WARN_ON/WARN_ON_ONCE
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  24 -----
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |   3 -
>  drivers/gpu/drm/xe/xe_svm.c                 |  43 +-------
>  drivers/gpu/drm/xe/xe_vm.c                  | 103 +++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm.h                  |   3 +
>  5 files changed, 75 insertions(+), 101 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 084cbdeba8ea..0111ee59b81d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -440,30 +440,6 @@ void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm)
>  	xe_gt_tlb_invalidation_fence_wait(&fence);
>  }
>  
> -/**
> - * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
> - * @gt: GT structure
> - * @fence: invalidation fence which will be signal on TLB invalidation
> - * completion, can be NULL
> - * @vma: VMA to invalidate
> - *
> - * Issue a range based TLB invalidation if supported, if not fallback to a full
> - * TLB invalidation. Completion of TLB is asynchronous and caller can use
> - * the invalidation fence to wait for completion.
> - *
> - * Return: Negative error code on error, 0 on success
> - */
> -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> -			       struct xe_gt_tlb_invalidation_fence *fence,
> -			       struct xe_vma *vma)
> -{
> -	xe_gt_assert(gt, vma);
> -
> -	return xe_gt_tlb_invalidation_range(gt, fence, xe_vma_start(vma),
> -					    xe_vma_end(vma),
> -					    xe_vma_vm(vma)->usm.asid);
> -}
> -
>  /**
>   * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
>   * @guc: guc
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index abe9b03d543e..31072dbcad8e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -19,9 +19,6 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
>  
>  void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
>  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> -int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> -			       struct xe_gt_tlb_invalidation_fence *fence,
> -			       struct xe_vma *vma);
>  void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
>  int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>  				 struct xe_gt_tlb_invalidation_fence *fence,
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 871ac81bb04a..2f46ac95e27a 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -167,14 +167,9 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  {
>  	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
>  	struct xe_device *xe = vm->xe;
> -	struct xe_tile *tile;
>  	struct drm_gpusvm_range *r, *first;
> -	struct xe_gt_tlb_invalidation_fence
> -		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
>  	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
>  	u8 tile_mask = 0;
> -	u8 id;
> -	u32 fence_id = 0;
>  	long err;
>  
>  	xe_svm_assert_in_notifier(vm);
> @@ -220,42 +215,8 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>  
>  	xe_device_wmb(xe);
>  
> -	for_each_tile(tile, xe, id) {
> -		if (tile_mask & BIT(id)) {
> -			int err;
> -
> -			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
> -							  &fence[fence_id], true);
> -
> -			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
> -							   &fence[fence_id],
> -							   adj_start,
> -							   adj_end,
> -							   vm->usm.asid);
> -			if (WARN_ON_ONCE(err < 0))
> -				goto wait;
> -			++fence_id;
> -
> -			if (!tile->media_gt)
> -				continue;
> -
> -			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
> -							  &fence[fence_id], true);
> -
> -			err = xe_gt_tlb_invalidation_range(tile->media_gt,
> -							   &fence[fence_id],
> -							   adj_start,
> -							   adj_end,
> -							   vm->usm.asid);
> -			if (WARN_ON_ONCE(err < 0))
> -				goto wait;
> -			++fence_id;
> -		}
> -	}
> -
> -wait:
> -	for (id = 0; id < fence_id; ++id)
> -		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> +	err = xe_vm_range_tilemask_tlb_invalidation(vm, adj_start, adj_end, tile_mask);
> +	WARN_ON_ONCE(err);
>  
>  range_notifier_event_end:
>  	r = first;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5a978da411b0..2aecb37be293 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3835,6 +3835,68 @@ void xe_vm_unlock(struct xe_vm *vm)
>  	dma_resv_unlock(xe_vm_resv(vm));
>  }
>  
> +/**
> + * xe_vm_range_tilemask_tlb_invalidation - Issue a TLB invalidation on this tilemask for an
> + * address range
> + * @vm: The VM
> + * @start: start address
> + * @end: end address
> + * @tile_mask: mask for which gt's issue tlb invalidation
> + *
> + * Issue a range based TLB invalidation for gt's in tilemask
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
> +					  u64 end, u8 tile_mask)
> +{
> +	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> +	struct xe_tile *tile;
> +	u32 fence_id = 0;
> +	u8 id;
> +	int err;
> +
> +	if (!tile_mask)
> +		return 0;
> +
> +	for_each_tile(tile, vm->xe, id) {
> +		if (tile_mask & BIT(id)) {
> +			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
> +							  &fence[fence_id], true);
> +
> +			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
> +							   &fence[fence_id],
> +							   start,
> +							   end,
> +							   vm->usm.asid);
> +			if (err)
> +				goto wait;
> +			++fence_id;
> +
> +			if (!tile->media_gt)
> +				continue;
> +
> +			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
> +							  &fence[fence_id], true);
> +
> +			err = xe_gt_tlb_invalidation_range(tile->media_gt,
> +							   &fence[fence_id],
> +							   start,
> +							   end,
> +							   vm->usm.asid);
> +			if (err)
> +				goto wait;
> +			++fence_id;
> +		}
> +	}
> +
> +wait:
> +	for (id = 0; id < fence_id; ++id)
> +		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> +
> +	return err;
> +}
> +
>  /**
>   * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
>   * @vma: VMA to invalidate
> @@ -3849,11 +3911,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  {
>  	struct xe_device *xe = xe_vma_vm(vma)->xe;
>  	struct xe_tile *tile;
> -	struct xe_gt_tlb_invalidation_fence
> -		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> -	u8 id;
> -	u32 fence_id = 0;
> +	u8 tile_mask = 0;
>  	int ret = 0;
> +	u8 id;
>  
>  	xe_assert(xe, !xe_vma_is_null(vma));
>  	xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
> @@ -3877,37 +3937,14 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  		}
>  	}
>  
> -	for_each_tile(tile, xe, id) {
> -		if (xe_pt_zap_ptes(tile, vma)) {
> -			xe_device_wmb(xe);
> -			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
> -							  &fence[fence_id],
> -							  true);
> -
> -			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
> -							 &fence[fence_id], vma);
> -			if (ret)
> -				goto wait;
> -			++fence_id;
> -
> -			if (!tile->media_gt)
> -				continue;
> -
> -			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
> -							  &fence[fence_id],
> -							  true);
> +	for_each_tile(tile, xe, id)
> +		if (xe_pt_zap_ptes(tile, vma))
> +			tile_mask |= BIT(id);
>  
> -			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
> -							 &fence[fence_id], vma);
> -			if (ret)
> -				goto wait;
> -			++fence_id;
> -		}
> -	}
> +	xe_device_wmb(xe);
>  
> -wait:
> -	for (id = 0; id < fence_id; ++id)
> -		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> +	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), xe_vma_start(vma),
> +						    xe_vma_end(vma), tile_mask);
>  
>  	vma->tile_invalidated = vma->tile_mask;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 99e164852f63..1ef98113fa5b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -228,6 +228,9 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>  struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
>  				     struct xe_svm_range *range);
>  
> +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
> +					  u64 end, u8 tile_mask);
> +
>  int xe_vm_invalidate_vma(struct xe_vma *vma);
>  
>  int xe_vm_validate_protected(struct xe_vm *vm);
> -- 
> 2.34.1
> 
