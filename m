Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D296C44501
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 20:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C4210F692;
	Thu,  9 Jul 2026 20:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqaPBYb3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7BB10F692
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 20:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783629800; x=1815165800;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZVZ+3H9LPdorjpNd3WS9gqguAKvQ2HwwKr6+KHtjFbo=;
 b=RqaPBYb3BkBWzNTTyyZgUYZP3o9HMbQRxXxgMqPs1pI6Qkyutltromng
 cNSjkCdGhtHa0bAqwuDjOWtCTeTnF7UQF0khawbKINTyNaSfKj9Qx5snj
 Tql8k+sL7qXykBEgJKkgOU+ckv1EQ6zxa0cDFM5PqKhatDEip+tKglkXX
 VYzpuuF1ET/Yftp70H1oxu3yb18nxRjTXpDtcF4iYsU+Fycd2XOjcInSh
 d1VVub9Ofwf6CXsNv13w5THwmiMgUqBkRlsLvc+IEMfoqBLpb8YH8eMBB
 apskfEk89MfhwXaOUVjjgLml5dVzhi/qD2m1yMk14V7Woy/ivwwlnnuWi g==;
X-CSE-ConnectionGUID: K3OC7C9vSFuEn2+emlyx/w==
X-CSE-MsgGUID: R61hx6BjTd6fm78BRosCoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84348180"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84348180"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:43:19 -0700
X-CSE-ConnectionGUID: 4jmIp7SLRN2gnCosAGrvSg==
X-CSE-MsgGUID: SafF56R8RwuAISBEouzOfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="256613647"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:43:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:43:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 13:43:18 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:43:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTYCOqPk+hZI6RGkgRqJXFdR2n+zQss5LU0emosDq3tcS1J7uqa80xpgwBh4LNBrJPWVw8sm9BcsZYfJz43fpdWO3cWgmP8pQUnC/g/p/YiGI8nn7+TcVrumE3p1BVV+XC17hbYbeTCLr4WT5/qVXT4BNv6q1wHP/YmHPogHmE9EG4454y7sEuzKf9+V77LUpbLZv8vam+iYlFEeQKOYXT9wue3rSIUqkD64Nq8Hg3L6uD0IVBgtOS3i+fcn+cBch46vx6VFbi8FyqeKVX6jpS0fFN2NE/NcWP3WNoQwEZUDsBYRdc5sIaEGK1n4T20tbPTq42uldt2a/WqFc0rdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1LMYW0VaGOr95oMVsRRouRIGSU1E03McYsgWvZVVu0=;
 b=lMe5nx50Jh8ev3B4ZJPXYVKZLoZG2bfeWl0aEz04ubePVm9qggydsFCITN3uzRSr4bWMPjsRxdOnPiNwIpfRviSuPr1XWb4AQ/Kmnk8YdbtOiOs6ynS9PDua5D8GMrbKS/fuBDQi5rTsHxFe1gTeM6hIy4zj/LfSow+/MGNAyWqlniWRFuoi2JC/PDyao0hVtgiMvqytlHQ1Ku1zF4z96p8+uMCQcZCNabxN/fMWBirSZtdlXQFJECNHgxCb+Mx3z8JRsfFpIAnCG+FsnXPoKyAMm7wxM8cZS2Ky+ABihSWjMgWRDN9YsApq5Oas3rjF3NJ28hNrOsuKGDzkISqVyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA2PR11MB4844.namprd11.prod.outlook.com (2603:10b6:806:f9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 20:43:15 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 20:43:15 +0000
Date: Thu, 9 Jul 2026 13:43:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/multi_queue: preempt primary on queue
 group suspend
Message-ID: <alAH3ogvxAPcNmMq@gsse-cloud1.jf.intel.com>
References: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
 <20260701050730.1776476-12-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260701050730.1776476-12-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BY3PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:217::21) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA2PR11MB4844:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1c617e-63d1-4673-d8ae-08deddfab291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|11063799006|6133799003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: W5RznqW6IGX5jHlZU+j8R7LeEdyf9lcCBWAEYxSyj5xuekHboJg1DXxoGGA00p8O1D+JmJ4Fwdo35yl5TdETIiBh4o0JbwPTPh4KYs8PIr5ZSvqpPHSsf1Tm22Sel9af+QzvEQT/+b0mdT/KdASRYIbkwwFFP8rnMGvroUvD95NHVhD1UUoSxt+uUntMQsaFPqWLeZ5MAsMFQPTtl/HXjvec8qVgt1bu9yc7xXhm4S5QOGRgdpjJn97egOy3D1B/cXUJyNRXnvVjChKr858EhGAIFg+59TgsJ2TiAOgppiRnftYZ+VegY3Cx77TDK3TTBOX1tjgUNqF8RWqHkpFvvVMU0fzjhQNGsaQ21U+Iv6y6E+C2SwuXr8f74WQpCSpWmoToLYbbKJEIWYW2lWXLFy8A7ATxKFQTITPPhqFZQUPkwSQS8qVqkcq0uvAW2f/CFOuPqLhf0nVD+pbSQqVQRgW2n2zRoNyzVL9H4IlEEosf7F+v8VvnK+MbFWo1zGeQmBKww3OQSIZJ95FnYsTnfFtxisK7asIUezeyKKQ01Ux6A4npmz4ickKQ8CQx7hat2GW+ljEqjQLwywoF2zaGQNGNsaQ/ww6Nor9aENASGdFeyRVpkT2JUDQTKSTUD1WavrA0csGkTeg+uqXs80F7saGW7JsgHYwFJZZkvtrR9hM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(6133799003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?opqZgUf7PtIpWfmQGvCUyuO63ge9OTrwsW8qIbr8QRU9LecHA7DQPZKsDymm?=
 =?us-ascii?Q?RTkCrCvy4rNalJovUNqIr9p9nA1hvRitJfFY1hdhI4gv51Z+yh60NsJVaG8H?=
 =?us-ascii?Q?9R9JkhBxV6hvi4XJgQ9an7vU3OwuI8lQh7eSeo/ai3eAYWYDJFHsaSG3stFd?=
 =?us-ascii?Q?yeGeEWBUCqAoreLThTr9g6I1H7m9uf4mBsu7dFlk+KVFTUN6V2ksRqc8AgOA?=
 =?us-ascii?Q?m8P7MV7Kpybz50G3iWcOYyn5+ierAZR0a+R5Pqpmn6nDN6wH/0sbe7hoVSRs?=
 =?us-ascii?Q?UeYZ5p242vuIDg83ubSVUikXFuygM0AAxNlFFzC3GAo9XVymb7bzwiLyfptr?=
 =?us-ascii?Q?2R0SwoN0o473utbt8RpDJDNfZYJ7481B5MsyM8dkRVTdzvtAKYFMPFTc3VcU?=
 =?us-ascii?Q?9Ck+tb+Qs9Gz8uX3sCHHDWJJvaFtu60nwxGlGGzJx0X8yTRmy9hTnbxbBnEh?=
 =?us-ascii?Q?ZBkc/WtKlB0GMeEpUUaPd4gIP/piJXKzTJK3z7YNwXgLZm3KnFAnowxkh/D3?=
 =?us-ascii?Q?bDd3CAI8VN5Fnt9fRWfUjIWJD4920d+vRKGsHWAF5kseuLNCc1LmXNjU5WgT?=
 =?us-ascii?Q?p9hptIOWcW/snR5XIdEEfUdrz7I1/QiCZl2+9OZ877tmMfc2qUTf2l2+zgUu?=
 =?us-ascii?Q?hspKsJxal98lmF0OCCfIpnscF5KUqF7hUXBhehcr+1rTUZ7f+UmpU1htgOpv?=
 =?us-ascii?Q?gX+y1Tl2ML87g2TUrnr4b7qEHX9B6xaRxMLEQtQGjtfw2PHHTrex7oy3rDx/?=
 =?us-ascii?Q?v3gFDKOm0Ev6SHMOj8a7flCX4aTOlWWyZcvHVmm9ADJUwJSUQVhOFfR4FrHI?=
 =?us-ascii?Q?Iwt6aWFYYvWG0CmeGkoHjwRV6r00gBlFoqnxTvRL10fIHPHNemSkDgsb7kc3?=
 =?us-ascii?Q?ZZkYQ/mdUvXwftdq4RFsB/yD7BbVDjHWAJ5JwWW3Yry/jgYtSjaNtxvF2C0H?=
 =?us-ascii?Q?FO6W5rFe9VdkuKr1yb0DwC5t+XrbOFIPApMU+sbXYEtSAVwpNI1RMhFM/m4j?=
 =?us-ascii?Q?xp+Nw1BUUx5Xp/dHgkatJQYdQsf2Z6VhoZQ8PsP32FQwduwvPpKgv0Y30L0i?=
 =?us-ascii?Q?xMy8QlOaFYS4Nc+bYZspqUtiO6FaF+zl/AqT4ZJxyjQ3Up+trYFtO+GkpTML?=
 =?us-ascii?Q?m7xffvslwn9VFM3Azaqxs6b1wDBCyh8QLq/PMF7TL+jQP51ogakZKayQfxNf?=
 =?us-ascii?Q?ZwvvUuaWXdPveC8mkz0w/bk4oe9VQekgRu2Y3TRRxPdWjjXcYdZ5ATW7KgzR?=
 =?us-ascii?Q?BPtvStIP0Lo+ayKBO6yPq2L7YhpPe0b27zvhPB7COWbP/7YbcHJUq1JhV9V/?=
 =?us-ascii?Q?I9yD/7jO3MdGxMy2HqOLh6ZgtTvKy+k/YBULCcqdJABysSU9KLNfhjU3QEas?=
 =?us-ascii?Q?zWzZaPcxrsy98v+WDkJ0MhVyoB6OBFboNUusNbTnswJ9qkfr6LODUWUV3kXl?=
 =?us-ascii?Q?l8O4hisJ+95nIuY2B5sSXKUYQm8FLrqd6OyXNteyP4iCnPQmiucz2Q50ouqb?=
 =?us-ascii?Q?YbSANrtqB+CJtcKK4eujOvgMCBnQ3M2vQ9WgFhG1R2Cs9KlaxaUljI1fHsGK?=
 =?us-ascii?Q?LJAQma/l2wfQJeD6TXBpr3vVqYQNP6J3QvyqCjaCPDdbZfwhyAph+b8bCKk0?=
 =?us-ascii?Q?T5im0pDnsrG65BEDNx0YZHKUpOtiDTOePjY4+l4YVySmYaMC+TUMz6Ywx9fc?=
 =?us-ascii?Q?ILfh/DxfNTSQrV4CgfcoiWGFVgcJHbewWiSnXeT9AdDIi8l/lNB+mmWqGqMC?=
 =?us-ascii?Q?rI58Vm0rqBnaukQ9YKu0m+kyZ1z/q0M=3D?=
X-Exchange-RoutingPolicyChecked: GYn+OTK5MVNM089aX2VxoiQhF6I3fYrMr1+C90c9Je5v77vroGSrB0Y5Yn7EeO2AKF3LwGAP7JgNVtQqnJsO353Aycwz0CKr+xZtl8ShoMMC3XPUBH8QMQyR998YhpPZTMOQLKukapCfL7gnwP2tWkRj8RAHSPGk7Khaij7M6bcMYB+LHStwhZq4pKs5WE9TpBT1o0o6wP4cYPJHI3HPHzk/4++yYx8x2u06Jb+xMYuLkXIJlu1vM8VjU0kYq+5Dr6+9TyP7SEHBL5yHLtrJK5N7Yc92g0m0BF0TUQ/9/0vwwP42TOd6RiqLeX/jX8Lek9QJgTI0dyv+5GJgA/NN4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1c617e-63d1-4673-d8ae-08deddfab291
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:43:14.8761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKrIzcMRvhjXELu7otCxHLJIhpyQtehfswqtfHY8OYHVHQPH6CWgkkExD6jilVff5Sq9mVswRw8IinHXAQJLig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4844
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

On Tue, Jun 30, 2026 at 10:07:33PM -0700, Niranjana Vishwanathapura wrote:
> In a multi-queue group only the group's primary queue interfaces with
> GuC for scheduling; suspend/resume of secondary queues is handled
> internally and is not forwarded to GuC. As a result, suspending a
> secondary queue alone (e.g. on its preempt fence signalling) does not
> disable the primary's GuC context, so in-flight GPU work of the group
> is not actually preempted.
> 
> Make a secondary queue suspend/resume like any other queue, driven by
> its own xe_guc_exec_queue.suspend_count, and additionally forward the
> suspend/resume to the primary so the GPU is actually preempted. The
> forward is gated on the secondary's own 0->1 / 1->0 suspend_count
> transition, so each group member contributes exactly one suspend
> reference to the primary: the primary keeps its GuC context disabled
> until every member that suspended it has resumed, including across the
> resume-all-queues-each-rebind-cycle behavior. group->suspend_lock makes
> the secondary transition and the primary forward atomic, and a member
> leaving while still suspended (queue teardown) drops its reference on
> the primary.
> 
> guc_exec_queue_suspend_wait() now waits on the primary, so on a suspend
> timeout ban and tear down the whole group (set_exec_queue_group_banned()
> and xe_guc_exec_queue_group_trigger_cleanup()) rather than just the
> primary: the primary owns the group's GuC context, so its failure to
> suspend wedges every member.
> 
> v2: suspend whole group upon error in suspend_wait
> 

Same as last patch, if the upper layers are fixed this one LGTM:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |   1 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 174 ++++++++++++++++++++---
>  3 files changed, 161 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 1b5ca3ce578a..df95855a3d61 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -842,6 +842,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>  	group->primary = q;
>  	group->cgp_bo = bo;
>  	INIT_LIST_HEAD(&group->list);
> +	spin_lock_init(&group->suspend_lock);
>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>  	mutex_init(&group->list_lock);
>  	q->multi_queue.group = group;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index dbb2ee8eb5de..bf76a879aedc 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -62,6 +62,12 @@ struct xe_exec_queue_group {
>  	struct list_head list;
>  	/** @list_lock: Secondary queue list lock */
>  	struct mutex list_lock;
> +	/**
> +	 * @suspend_lock: Makes a secondary's suspend/resume and its forwarding
> +	 * to the primary atomic. Nested outside of the queue's message lock
> +	 * (@xe_guc_exec_queue.sched.msg_lock).
> +	 */
> +	spinlock_t suspend_lock;
>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>  	bool sync_pending;
>  	/** @banned: Group banned */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f7a3ff0d0b1d..b1591d02eed0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1681,11 +1681,24 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>  }
>  
> +static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q);
> +
>  static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	struct xe_guc_exec_queue *ge = q->guc;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  
> +	/*
> +	 * A secondary can leave the group while still preempt suspended (e.g.
> +	 * xe_vm_remove_compute_exec_queue() forces its preempt fence to signal,
> +	 * which suspends it). It holds one forwarded suspend reference on the
> +	 * primary, so drop it and resume the primary if it was the last member
> +	 * that had it suspended. Primaries forward to nobody, so they don't need
> +	 * this.
> +	 */
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		guc_exec_queue_multi_queue_drop_suspend(q);
> +
>  	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>  		struct xe_exec_queue_group *group = q->multi_queue.group;
>  
> @@ -2163,17 +2176,22 @@ static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
>  	return 0;
>  }
>  
> -static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> +/*
> + * Core suspend: take a suspend reference on @q and, on the first reference,
> + * disable its GuC context so the GPU is actually preempted. Caller must have
> + * ensured @q is not killed/banned/wedged. Returns true if this was the first
> + * suspend reference (the 0->1 transition).
> + */
> +static bool __guc_exec_queue_suspend(struct xe_exec_queue *q)
>  {
>  	struct xe_guc_exec_queue *ge = q->guc;
>  	struct xe_gpu_scheduler *sched = &ge->sched;
>  	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_SUSPEND;
> -
> -	if (exec_queue_killed_or_banned_or_wedged(q))
> -		return -EINVAL;
> +	bool first;
>  
>  	xe_sched_msg_lock(sched);
> -	if (++ge->suspend_count == 1) {
> +	first = (++ge->suspend_count == 1);
> +	if (first) {
>  		bool added = guc_exec_queue_try_add_msg(q, msg, SUSPEND);
>  
>  		/* slot must be free at 0->1 */
> @@ -2182,6 +2200,68 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>  	}
>  	xe_sched_msg_unlock(sched);
>  
> +	return first;
> +}
> +
> +/*
> + * Core resume: drop a suspend reference on @q and, on the last reference,
> + * re-enable its GuC context. Returns true if this dropped the last suspend
> + * reference (the 1->0 transition).
> + */
> +static bool __guc_exec_queue_resume(struct xe_exec_queue *q)
> +{
> +	struct xe_guc_exec_queue *ge = q->guc;
> +	struct xe_gpu_scheduler *sched = &ge->sched;
> +	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_RESUME;
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	bool last;
> +
> +	xe_sched_msg_lock(sched);
> +	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
> +	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
> +	last = (--ge->suspend_count == 0);
> +	if (last) {
> +		bool added = guc_exec_queue_try_add_msg(q, msg, RESUME);
> +
> +		/* slot must be free at 1->0 */
> +		xe_gt_assert(guc_to_gt(guc), added);
> +	}
> +	xe_sched_msg_unlock(sched);
> +
> +	return last;
> +}
> +
> +static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> +{
> +	if (exec_queue_killed_or_banned_or_wedged(q))
> +		return -EINVAL;
> +
> +	/*
> +	 * Non-multi-queue queues and multi-queue primaries suspend themselves
> +	 * directly: their own msg_lock makes the suspend_count 0->1 transition
> +	 * and the suspend_pending update atomic, so no group level serialization
> +	 * is needed.
> +	 */
> +	if (!xe_exec_queue_is_multi_queue_secondary(q)) {
> +		__guc_exec_queue_suspend(q);
> +		return 0;
> +	}
> +
> +	/*
> +	 * A secondary doesn't interface with GuC: suspend it like any other
> +	 * queue (its own suspend_count drives its internally handled scheduler
> +	 * state) and, only on its own 0->1 transition, forward the suspend to the
> +	 * primary so the GPU is actually preempted. Hold @suspend_lock so that
> +	 * observing the secondary's transition and forwarding it to the primary
> +	 * happen atomically; this keeps the primary's refcount paired with member
> +	 * transitions even if the same secondary is suspended and resumed
> +	 * concurrently across rebind cycles.
> +	 */
> +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
> +		if (__guc_exec_queue_suspend(q))
> +			__guc_exec_queue_suspend(xe_exec_queue_multi_queue_primary(q));
> +	}
> +
>  	return 0;
>  }
>  
> @@ -2191,6 +2271,19 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  	struct xe_device *xe = guc_to_xe(guc);
>  	int ret;
>  
> +	/*
> +	 * In multi-queue mode the primary owns the GuC scheduling context for
> +	 * the whole group, so wait on the primary's suspend to complete. All
> +	 * group members share the same GuC/device, so guc, xe and timeout above
> +	 * are computed from @q directly.
> +	 *
> +	 * A secondary's suspend is short-circuited (no GuC round-trip) and, as
> +	 * its SUSPEND message precedes the primary's on the shared FIFO
> +	 * submit_wq, completes before the primary's. So waiting on the primary
> +	 * is sufficient.
> +	 */
> +	q = xe_exec_queue_multi_queue_primary(q);
> +
>  	/*
>  	 * Likely don't need to check exec_queue_killed() as we clear
>  	 * suspend_pending upon kill but to be paranoid but races in which
> @@ -2232,10 +2325,20 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  		 * tripping the !suspend_pending assert (the RESUME message is
>  		 * dropped for a banned queue), and triggering cleanup tears the
>  		 * context down.
> +		 *
> +		 * @q is the primary here; it owns the group's GuC context, so a
> +		 * failure to suspend it wedges the whole group. Ban and tear
> +		 * down the entire group in the multi-queue case.
>  		 */
> -		set_exec_queue_banned(q);
> -		__suspend_fence_signal(q);
> -		xe_guc_exec_queue_trigger_cleanup(q);
> +		if (xe_exec_queue_is_multi_queue(q)) {
> +			set_exec_queue_group_banned(q);
> +			__suspend_fence_signal(q);
> +			xe_guc_exec_queue_group_trigger_cleanup(q);
> +		} else {
> +			set_exec_queue_banned(q);
> +			__suspend_fence_signal(q);
> +			xe_guc_exec_queue_trigger_cleanup(q);
> +		}
>  		return -ETIME;
>  	} else if (IS_SRIOV_VF(xe) && !WAIT_COND) {
>  		/* Corner case on RESFIX DONE where vf_recovery() changes */
> @@ -2255,21 +2358,52 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  
>  static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  {
> -	struct xe_guc_exec_queue *ge = q->guc;
> -	struct xe_gpu_scheduler *sched = &ge->sched;
> -	struct xe_sched_msg *msg = ge->static_msgs + STATIC_MSG_RESUME;
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> +	/*
> +	 * Non-multi-queue queues and multi-queue primaries resume themselves
> +	 * directly; their own msg_lock is sufficient.
> +	 */
> +	if (!xe_exec_queue_is_multi_queue_secondary(q)) {
> +		__guc_exec_queue_resume(q);
> +		return;
> +	}
>  
> -	xe_sched_msg_lock(sched);
> -	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
> -	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
> -	if (--ge->suspend_count == 0) {
> -		bool added = guc_exec_queue_try_add_msg(q, msg, RESUME);
> +	/*
> +	 * Mirror of guc_exec_queue_suspend(): resume the secondary like any
> +	 * other queue and, only on its own 1->0 transition, forward the resume
> +	 * to the primary so the primary's GuC context is re-enabled once the
> +	 * last member that suspended it resumes. @suspend_lock keeps the
> +	 * secondary transition and the primary forward atomic.
> +	 */
> +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
> +		if (__guc_exec_queue_resume(q))
> +			__guc_exec_queue_resume(xe_exec_queue_multi_queue_primary(q));
> +	}
> +}
>  
> -		/* slot must be free at 1->0 */
> -		xe_gt_assert(guc_to_gt(guc), added);
> +/*
> + * Drop a leaving secondary's forwarded suspend reference on the primary and
> + * resume the primary if this was the last member that had it suspended.
> + * See guc_exec_queue_fini().
> + */
> +static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q)
> +{
> +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +
> +		/*
> +		 * A suspended secondary holds exactly one suspend reference on the
> +		 * primary (forwarded on its 0->1 transition). If it leaves while
> +		 * still suspended, release that reference so the primary is not
> +		 * kept disabled forever.
> +		 */
> +		if (!READ_ONCE(q->guc->suspend_count))
> +			break;
> +
> +		if (exec_queue_killed_or_banned_or_wedged(primary))
> +			break;
> +
> +		__guc_exec_queue_resume(primary);
>  	}
> -	xe_sched_msg_unlock(sched);
>  }
>  
>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> -- 
> 2.43.0
> 
