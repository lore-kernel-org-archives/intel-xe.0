Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79609CCFA02
	for <intel-xe@archiver.kernel.org>; Sun,  2 Nov 2025 00:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3790110E174;
	Sun,  2 Nov 2025 00:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RVAqltgp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA9D10E174
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Nov 2025 00:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762043960; x=1793579960;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Bw8YmbmmiljovQOqgXljHtJiA4TC3l0dY6YmFzEeqnQ=;
 b=RVAqltgpbvmH+FR4A1W3d9ryuzu0q0+6gxgjALrtXEpCFxTpGoLUYIe+
 wE2pqE/2eDZq9Q5av6Xq8lqTT+8rO0XgJ4EMcGC3WZ+/P+SxZsCzqR10A
 M4ttXRgNs9rprEknfr/5BJR4FGFJe/SmLKWA2x712uDs9aMLfG6d91dmu
 FIP1ij2rl/mSTXfB6uUYxj3nCodetXOiAjgRH7rMJsa+t41W4beT0WSB/
 tn96u7UyvO2ETefGlxFetHT8cSAjr6KZl+dJMIO809NcKeJj5ifzLaqXm
 et474faha4g9G4SGKtHqWSdg5Qz3NK9J5LLAiJdHT4IL9pkTagovdKV53 w==;
X-CSE-ConnectionGUID: q+kduCxPQHG14drUEjw66w==
X-CSE-MsgGUID: 4sWM+mk4SFekGCY2TXSEkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="67820775"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; d="scan'208";a="67820775"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 17:39:19 -0700
X-CSE-ConnectionGUID: aGHAc9abSu2NUK6Wb/5JCw==
X-CSE-MsgGUID: 2p8yxWydS9mTCiiC4MxRpQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 17:39:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 17:39:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 1 Nov 2025 17:39:18 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 17:39:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=saiIqMOY3sihWgZPCu6323sm+NfIep0DEuYy2yl0VqMOrTCMZrJlfLyn5Aq9KeWnGnJjElkK1vKtq8BPH4gicRyYxfMUzSiPKfJNXNWfdXnWmpPo3l/1LAq1rnAudfrbzrp2Rm7dDGv/LEcRURHl+PTzXRm/vMekxIy9dgae6RFg23CR/bBzoGW6rzM8WOCHyimwL2MMPXNliJUzJTFJvEvMwOMF61eWdRI5okVP4eueDTX1ldPYTT6J6sas4WM2feVbrt9aUi3yVSloGRMWGLmqFDCiv1AVk607ekmVk2UrrntfzDY51oIraQWpV5Ups6SCONG5umagmMH9m1iv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6dCw4DkD40LuA9GtmtIYX9Df2ksZp908k6fp1aWQi8=;
 b=NJZFN1gjhk4+iH6+MiR8OR2hLpQQ+JSWbsUJEnNR6Voul+wzllcJvSYgfmrTeZKdqjqRFEDrqEQAO1HcmnEsc6KXGEEbO197i1o4HRvhLrPEz53jUEwSOOLZv7917vCjGWXQ5ebY9KYS5oj2KYmdcWnOKA3EdC4XnmZMHY+tUGGe83NZBVIa5YOTc+VQDqdYRvyhJWZtn781692lvOHBKtKexc/j5Z2QVKc7BR2daWBwbK/v9gVcRxmUo0dCH1gRX+phHcchAyvmZSUJ8MCKHminrn8x0RuEgCxfzrhDXNbKo/H3TSxYgUzh0uPZVkKZWMqjrpWW5PyPw/A68xc69Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4626.namprd11.prod.outlook.com (2603:10b6:5:2a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 00:39:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Sun, 2 Nov 2025
 00:39:12 +0000
Date: Sat, 1 Nov 2025 17:39:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 09/16] drm/xe/multi_queue: Handle tearing down of a multi
 queue
Message-ID: <aQaoLnIMeoKzYtNA@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-10-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-10-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4626:EE_
X-MS-Office365-Filtering-Correlation-Id: aeaabfe6-3838-41a7-594d-08de19a83e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FZEN1HiNPt4Do+Ye4cHsNzGhYVCWosVtYQrW5fpKCozuMNnAzDJMVDZCeekT?=
 =?us-ascii?Q?nd1sX/whh2+EKm+paN/+e8/wLtS+ABVX0503DeypKWxPZMDRSaegL7BmD2pf?=
 =?us-ascii?Q?mPqESJ+UgYPY+YHEoGKm3FLfF/LC/SUIICo+XJAbXNi9nnum4qIKHXtKDxaU?=
 =?us-ascii?Q?2Q5VflOWtNv05GoFB5GLu2aRua7RDjxklFmMxIKdE6SYSZlOEMa3F/Wwqrh6?=
 =?us-ascii?Q?+GSjXxaYLLOKBE3ES4Ezjq8naJnagY3lZ+9r3uIKYeF+fp4lUfau92ibf7sG?=
 =?us-ascii?Q?Sk4ksric5wY8Rct8CSUITcygi/f45b77AGpRwLyaSxwayi+BO/G63mHLqlP2?=
 =?us-ascii?Q?qU9W0+XFj/B+9U4BtYKZJDddBDAliqx6ym9kGaCzvhh2i3zs30iVv66R9mtV?=
 =?us-ascii?Q?xBgz2qkFo6zNEjgw28GzMeohsZ8s/YsQGSo26GN6Wcy16UY7YHSdfSiUHZf3?=
 =?us-ascii?Q?PdKlk/IOK0xBi7gVJvupWl9cCcZyC4mm0nstXxBmAXgY6FFbS0DLa7WdcQXa?=
 =?us-ascii?Q?1i+D67ZaxMu/ciSMz2xnrD5cRVyOYinGW8Lp9OXY6myqxChvy97U4RVrm9dv?=
 =?us-ascii?Q?ntQ8Zecg1f4fhg0dbL9zYfpmfY0DvAWldxEDRwWlPNTpDu2HlD2+ikauiCJq?=
 =?us-ascii?Q?BlXfkXDBZ/SH0WnOODajtVz4/uSXKWTmZ9x9sAnSSfn8IkE38YKLoQRKK61R?=
 =?us-ascii?Q?EnvarWOqpLXdUU+RSEIydSktHT5rzpylhA/TrAxZH0Tj+4tMMTS9ZyhdxnLX?=
 =?us-ascii?Q?A11BCqJAt7iKE6vg0AudOnuPWSk7FpixI4iObw2y/xd+EXJJqxcSI23gLgla?=
 =?us-ascii?Q?osPtXuB/KKSfQhGlBeHRQur0SGdeGBMsn/kCpGfcvaxBCQbb1ivNlsL35D6f?=
 =?us-ascii?Q?FG4vvT54M8ZOj6nI75gONx1nVV+WyvwK7SYfvZ23375YFwxszm9LCWUJ1WZv?=
 =?us-ascii?Q?S/34NomOKuEyvg6mbjpbIFpkE4gUBweNVzm++X+gcsQ1R14K0pfF7m7exGy2?=
 =?us-ascii?Q?jdN8w1WbJX6RF1gUmrIw8z6kQLsmKaU+0B1QkBSP+L4Lh/3d3vjEseGBi2Xb?=
 =?us-ascii?Q?W/SxW39axKdkcY+Gc29Soxdg3Arvn9hn5tyGXG733tEzDQOkes65oqm/YQp8?=
 =?us-ascii?Q?9/TJCWAD5jVvwNrYIQ06Rhmk9Q+BKy+frNmJpsPJE8a11hLRYtuvfeNjAReN?=
 =?us-ascii?Q?tDkvAfgx/P33ch3XjqEvuDTR0llgOhC/GL/qbsny4ekww0Dyqgr8j0MS2jlo?=
 =?us-ascii?Q?SGuLVCgO+V9dG3caQ0QTVXzm9FkBE20C6IjWwx3l4ptZGWUrPBg3orbf9PCf?=
 =?us-ascii?Q?SQl9oCksg9hjB94pp/qxdamnHDOB9KadtApvOyA+LGokCRU5aWDS+Q2FlWem?=
 =?us-ascii?Q?pVquHtIF/Zs5gzhsR+5W1jKfZjt7Vbz0ol2AABk8t7HoTQ8cmddzSfWswbRR?=
 =?us-ascii?Q?LiLVeXlbLjCB7DT7KH9eNbX5eKozemRT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u+AljFCV0b7o8wS5DLkNsALfS/xOV5Z+Yiet8rDbmiJPZXMKQm2iAxM1BwEN?=
 =?us-ascii?Q?VATIstCdGTLtOtmlTu3F0bXs/9DuZ6voPcXV4BxqBiNRJFdkyLF9kZQ1+VUz?=
 =?us-ascii?Q?gchgXrb6F+aV9oliRSA7t3KMBKfkK72baaC7D87F9JZ51v2NGawe3yqKLlmJ?=
 =?us-ascii?Q?t5qB7FQux3l4hChmVS1nzEmVpsrcI6vGg1e2L/tjvUjel+YZH1Zl+tsFKpGW?=
 =?us-ascii?Q?OXK2n37hpJfm8pGT6PGLc6eqvvmTtXUcaAOXtG1VcE/0XVBYcIPLA1lOUq7p?=
 =?us-ascii?Q?/Ssph/qy4koiuKVoBaWSrViCjhuybZDinBE0x2BDTXPuEQpeE3eD6OX0HWWw?=
 =?us-ascii?Q?+PJon81Eu1dFZmT7NQVtysTlmPmVgMMA6nU2GRfYP+1eb8idszrjUnxCu6xF?=
 =?us-ascii?Q?YA0EIy4tq3l/LnUW3boBMDcLm1OFrH2tZ4e5iPXxoQ9TUottBQfpCTY7S0q0?=
 =?us-ascii?Q?i5QplhZYj29+zrymLAuHuPmFlreKmmIAqv7vn2mq/GwUxsI5wwYRIjJzOBVX?=
 =?us-ascii?Q?J72lY6fy2hhDuUTRjdpAYC1XY3S8BJHkJ4+YB4uS6jd4FDP/UBP2Y27HT5Le?=
 =?us-ascii?Q?fkPoL725gcWhdQpT7rnOoVvLGC/lJjA/C3FBHkbz2N2Uc21wLx/udvxwD6/v?=
 =?us-ascii?Q?JRCV9jQo23u2jQftzLHZCU8Y4uTkbuPjtvdnmKtoY22eKi47LZYr69ZqZJrQ?=
 =?us-ascii?Q?mYhBshfEktaIM8Q/5/kYRyk2tZjX7npv2IKQrj36L/erIAMau3eyPhQqk8PW?=
 =?us-ascii?Q?Iynh81Yk2qm2R0ostpxZfThKPtzExffI2xPNV7qlgmTwmQuZHrq+UNkHmPQ+?=
 =?us-ascii?Q?j7wxyjfEqXYJD/4eEVUqByKlvppqUe+p6tRaQOXj7nboeWEqZ5EVxQIUe6+Z?=
 =?us-ascii?Q?93JC4ho7rjnO23sgHtrLYmrU5hyjRAI2y+eCpPfhDy6ZypI8AVQDtLgQUbnY?=
 =?us-ascii?Q?iGZoZ28PRKswPugq1eiLocJutoQWl0fUH3eqrfpC6ZnBd5+nkoGnnE19T5Vw?=
 =?us-ascii?Q?gFdFzZjW80wFWjq+52RLvAhuOj6+kilFLpAV6uq1qHPaPymuWddgxMHYrKhO?=
 =?us-ascii?Q?zFLpLU0U60xdUk6iwrxiYvUXcnuFoMLVEfsx4Jzf/ujtDQLFvw2KTtQLdHxA?=
 =?us-ascii?Q?qyAGktWEly4cqs5E207bnL7XqgBx0mVv9IUEndXhf+oLC4+FOMg3WjgWp6Rp?=
 =?us-ascii?Q?el8ZSTpiaov0TqC2YMwgsijWWl1Sw4lbg9DuRMDW6wG6RQZfumjNyKb3Yff1?=
 =?us-ascii?Q?+8Rt/mOEDnp+xtp3fVC0uLTxr4SrQK/s843GHGIhtcTG6A98lIE06vv57moX?=
 =?us-ascii?Q?EmLa9bSdNa4RAwTstOwz4G/R5RX0nE2y4o8oyQDWHmeblWc44KMDlCcSTKLt?=
 =?us-ascii?Q?eFtHzcuiU4acPQroaAvR9xtHk3xGHaNGxt04Sq3JjTfJC+yyhe4PJzeDZgxl?=
 =?us-ascii?Q?qvA7LQ6YUbx/ubzvz21r8/a8Ob9gNZBOdMr56j/2EvVLITHSCugoNPcLerdf?=
 =?us-ascii?Q?RRvJrd7I0538AtBM/lbbdDP4bYT639vjN90gGgnOpPd0buKFu6drVJcWMmSd?=
 =?us-ascii?Q?BDzEWZpnqQxSRwzsSqkYkPFlIsG1COOjT5zHh7v3nUvT5NAw1EfF47ul9zd9?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeaabfe6-3838-41a7-594d-08de19a83e65
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 00:39:12.6448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1pa+vXLpvY/iTcXK9DZ7JHFptU7SXgwzMZL2sN7R1IRkcURvsBUMntNfCqvVBOBap7/PGIBgkk6wp/9KtiwMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4626
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

On Fri, Oct 31, 2025 at 11:29:29AM -0700, Niranjana Vishwanathapura wrote:
> As all queues of a multi queue group use the primary queue of the group
> to interface with GuC. Hence there is a dependency between the queues of
> the group. So, when primary queue of a multi queue group is cleaned up,
> also trigger a cleanup of the secondary queues. During cleanup, stop and
> re-start submission for all queues of a multi queue group to avoid any
> submission happening in parallel when a queue is being cleaned up.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |   2 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   4 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 150 +++++++++++++++++++----
>  3 files changed, 134 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 98f8f1c7f13b..3c1bb4f10fd5 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -85,6 +85,7 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>  
>  	xa_destroy(&group->xa);
>  	mutex_destroy(&group->lock);
> +	mutex_destroy(&group->list_lock);

You init this lock in eariler patch but destroy it in this. Can we get
the init/destroy/instanaition in a single patch? 

>  	xe_bo_unpin_map_no_vm(group->cgp_bo);
>  	kfree(group);
>  }
> @@ -605,6 +606,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>  
>  	group->primary = q;
>  	group->cgp_bo = bo;
> +	INIT_LIST_HEAD(&group->list);
>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>  	mutex_init(&group->lock);
>  	mutex_init(&group->list_lock);

group->list_lock is taken in the submission backend, which is entirely
in the path reclain. Can we teach lockdep this lock is in the path of
reclaim?

e.g.,

fs_reclaim_acquire(GFP_KERNEL);
might_lock(&group->list_lock);
fs_reclaim_release(GFP_KERNEL);

> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index dcb55b069ed8..e64b6588923e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -51,6 +51,8 @@ struct xe_exec_queue_group {
>  	struct xe_bo *cgp_bo;
>  	/** @xa: xarray to store LRCs */
>  	struct xarray xa;
> +	/** @list: List of all secondary queues in the group */
> +	struct list_head list;
>  	/** @list_lock: Secondary queue list lock */
>  	struct mutex list_lock;
>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
> @@ -140,6 +142,8 @@ struct xe_exec_queue {
>  	struct {
>  		/** @multi_queue.group: Queue group information */
>  		struct xe_exec_queue_group *group;
> +		/** @multi_queue.link: Link into group's secondary queues list */
> +		struct list_head link;
>  		/** @multi_queue.priority: Queue priority within the multi-queue group */
>  		enum xe_multi_queue_priority priority;
>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b84a0be2eefe..87c13feb2cef 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -920,6 +920,81 @@ static void wq_item_append(struct xe_exec_queue *q)
>  	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
>  }
>  
> +static void xe_guc_exec_queue_submission_start(struct xe_exec_queue *q)
> +{
> +	/*
> +	 * If the exec queue is part of a multi queue group, then start submission
> +	 * on all queues of the multi queue group.
> +	 */
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		struct xe_exec_queue *eq;
> +
> +		xe_sched_submission_start(&primary->guc->sched);
> +
> +		mutex_lock(&group->list_lock);
> +		list_for_each_entry(eq, &group->list, multi_queue.link)
> +			xe_sched_submission_start(&eq->guc->sched);
> +		mutex_unlock(&group->list_lock);
> +	} else {
> +		xe_sched_submission_start(&q->guc->sched);
> +	}
> +}
> +
> +static void xe_guc_exec_queue_submission_stop(struct xe_exec_queue *q)
> +{
> +	/*
> +	 * If the exec queue is part of a multi queue group, then stop submission
> +	 * on all queues of the multi queue group.
> +	 */
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		struct xe_exec_queue *eq;
> +
> +		xe_sched_submission_stop(&primary->guc->sched);
> +
> +		mutex_lock(&group->list_lock);
> +		list_for_each_entry(eq, &group->list, multi_queue.link)
> +			xe_sched_submission_stop(&eq->guc->sched);
> +		mutex_unlock(&group->list_lock);
> +	} else {
> +		xe_sched_submission_stop(&q->guc->sched);
> +	}
> +}
> +
> +static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);
> +
> +	if (xe_exec_queue_is_lr(q))
> +		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> +	else
> +		xe_sched_tdr_queue_imm(&q->guc->sched);
> +}
> +
> +static void xe_guc_exec_queue_trigger_secondary_cleanup(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_exec_queue *eq;
> +
> +	mutex_lock(&group->list_lock);
> +	list_for_each_entry(eq, &group->list, multi_queue.link) {
> +		if (exec_queue_reset(primary))

Do we need to propagate banned or killed?

Also happens if secondary queue is reset or a job times out? Does that
affect any of the other LRCs in the group?

> +			set_exec_queue_reset(eq);
> +
> +		if (!exec_queue_banned(eq))
> +			xe_guc_exec_queue_trigger_cleanup(eq);
> +	}
> +	mutex_unlock(&group->list_lock);
> +}
> +
>  #define RESUME_PENDING	~0x0ull
>  static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>  {
> @@ -1098,20 +1173,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>  }
>  
> -static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> -{
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
> -
> -	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> -	wake_up_all(&xe->ufence_wq);
> -
> -	if (xe_exec_queue_is_lr(q))
> -		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> -	else
> -		xe_sched_tdr_queue_imm(&q->guc->sched);
> -}
> -
>  /**
>   * xe_guc_submit_wedge() - Wedge GuC submission
>   * @guc: the GuC object
> @@ -1185,8 +1246,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	if (!exec_queue_killed(q))
>  		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>  
> -	/* Kill the run_job / process_msg entry points */
> -	xe_sched_submission_stop(sched);
> +	/*
> +	 * Kill the run_job / process_msg entry points.
> +	 * As this function is serialized across exec queues, it is safe to
> +	 * stop and restart submission on all queues of a multi queue group.
> +	 */
> +	xe_guc_exec_queue_submission_stop(q);
>  
>  	/*
>  	 * Engine state now mostly stable, disable scheduling / deregister if
> @@ -1222,7 +1287,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  				   q->guc->id);
>  			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
>  				       q->guc->id);
> -			xe_sched_submission_start(sched);
> +			xe_guc_exec_queue_submission_start(q);
>  			xe_gt_reset_async(q->gt);
>  			return;
>  		}
> @@ -1233,7 +1298,11 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  
>  	xe_hw_fence_irq_stop(q->fence_irq);
>  
> -	xe_sched_submission_start(sched);
> +	xe_guc_exec_queue_submission_start(q);
> +
> +	/* Trigger cleanup of secondary queues of multi queue group */
> +	if (xe_exec_queue_is_multi_queue_primary(q))
> +		xe_guc_exec_queue_trigger_secondary_cleanup(q);
>  
>  	spin_lock(&sched->base.job_list_lock);
>  	list_for_each_entry(job, &sched->base.pending_list, drm.list)
> @@ -1392,8 +1461,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	    vf_recovery(guc))
>  		return DRM_GPU_SCHED_STAT_NO_HANG;
>  
> -	/* Kill the run_job entry point */
> -	xe_sched_submission_stop(sched);
> +	/*
> +	 * Kill the run_job entry point.
> +	 * As this function is serialized across exec queues, it is safe to
> +	 * stop and restart submission on all queues of a multi queue group.
> +	 */
> +	xe_guc_exec_queue_submission_stop(q);
>  

I'd know where to stick this comment, but disable_scheduling() looks
like a pure software things for secondary queues. We currently need the
LRC to not be running to accurately sample the timestamp - I think we
could fix that part, Umesh would likely know for sure. But until then
I'm pretty sure we'd need to disable scheduling on primary for an
accurate sample of the secondaries queue's LRC timestamp.

>  	/* Must check all state after stopping scheduler */
>  	skip_timeout_check = exec_queue_reset(q) ||
> @@ -1552,7 +1625,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * fences that are complete
>  	 */
>  	xe_sched_add_pending_job(sched, job);
> -	xe_sched_submission_start(sched);
> +	xe_guc_exec_queue_submission_start(q);
>  
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  
> @@ -1565,6 +1638,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	/* Start fence signaling */
>  	xe_hw_fence_irq_start(q->fence_irq);
>  
> +	/* Trigger cleanup of secondary queues of multi queue group */
> +	if (xe_exec_queue_is_multi_queue_primary(q))
> +		xe_guc_exec_queue_trigger_secondary_cleanup(q);
> +

I'd stick this part by xe_guc_exec_queue_trigger_cleanup above.

>  	return DRM_GPU_SCHED_STAT_RESET;
>  
>  sched_enable:
> @@ -1576,7 +1653,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * but there is not currently an easy way to do in DRM scheduler. With
>  	 * some thought, do this in a follow up.
>  	 */
> -	xe_sched_submission_start(sched);
> +	xe_guc_exec_queue_submission_start(q);
> +
> +	/* Trigger cleanup of secondary queues of multi queue group */
> +	if (xe_exec_queue_is_multi_queue_primary(q))
> +		xe_guc_exec_queue_trigger_secondary_cleanup(q);

I don't think you need to trigger a cleanup here - this is no hang
situation, rather a false timeout.

Matt

>  handle_vf_resume:
>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>  }
> @@ -1607,6 +1688,14 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
>  	xe_pm_runtime_get(guc_to_xe(guc));
>  	trace_xe_exec_queue_destroy(q);
>  
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		mutex_lock(&group->list_lock);
> +		list_del(&q->multi_queue.link);
> +		mutex_unlock(&group->list_lock);
> +	}
> +
>  	if (xe_exec_queue_is_lr(q))
>  		cancel_work_sync(&ge->lr_tdr);
>  	/* Confirm no work left behind accessing device structures */
> @@ -1897,6 +1986,19 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	xe_exec_queue_assign_name(q, q->guc->id);
>  
> +	/*
> +	 * Maintain secondary queues of the multi queue group in a list
> +	 * for handling dependencies across the queues in the group.
> +	 */
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		INIT_LIST_HEAD(&q->multi_queue.link);
> +		mutex_lock(&group->list_lock);
> +		list_add_tail(&q->multi_queue.link, &group->list);
> +		mutex_unlock(&group->list_lock);
> +	}
> +
>  	trace_xe_exec_queue_create(q);
>  
>  	return 0;
> @@ -2125,6 +2227,10 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  
>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  {
> +	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> +	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
> +		return true;
> +
>  	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
>  }
>  
> -- 
> 2.43.0
> 
