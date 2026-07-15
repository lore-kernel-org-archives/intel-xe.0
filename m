Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69995C44507
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 19:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241B410F142;
	Wed, 15 Jul 2026 19:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IfMpWDnp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993EF10E1AA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 19:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784145462; x=1815681462;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ogDB7AWw0rOEET5/X/6IHo10fDuk2YRwgMS4D7wAVY8=;
 b=IfMpWDnpDbg1X0kGPatYvWp/Pk+7EagjLM+2eNm5AwtgWMxKm4l6VsSq
 zzSfiiRqIpzGJ81XvjMW29mesdEhlYKS8eUmgTY300sVElIMaoQTBgE3p
 s3XPFD6+ZvTPqE4hfEisvbr2kP2L7oN/rq99WbAQ41euFw5zWBnTE83Gd
 9YBnsz6ne/uGoot9gMRIy4Dt/Jisj1+uLikxMHL5FKvu3u+I7t531uHAK
 EC8RxUh2kPsxzllf/M/dXTJuv30Si7K3LfRf+Ps08s99wlolB2x39tYjF
 Am9gXugajI6er4jkHTKDNET3Ua4VXvh1DVrA3JAEe5pB2PXC02xPTYxmO g==;
X-CSE-ConnectionGUID: QUZHa1fnS/uiaDMIgPUPRg==
X-CSE-MsgGUID: oI6WJaPvTvCxlEQ8pGnQuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84582058"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84582058"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 12:57:42 -0700
X-CSE-ConnectionGUID: 7m9xYKZSTgeSFGIooLfoWQ==
X-CSE-MsgGUID: K9zDrqEETs6duvn/YE4aZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="286366237"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 12:57:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 12:57:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 12:57:40 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 12:57:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=an0gBoYfweXQ5VBUQ8oUwO5v+HrF5pXEqKNYrQ3wQYG81Tz6pQTMTj4Xuy0tZemLBy/36WqImFFXpcAneCnybxYvhzxgRxO2M5SbNp/k+HPMuopIrRcwg96lIPrqpMjYTn4seE/YmT+uUTeVVT67Pu22lmAJx1cMTT+vXRkG4yr4WEOSIBnBMSsTHyIETZTQiO5uE3gueDi3mkhQFNkUoYKRsTW/H26yMigYuvWzXOXmoVFSd0qQpXsMsk3kxsUlYpMkug4oGaP2bU6omPPYmHTXfZQ7r1YxSfLe2og4mWdVJhfBkcFkRyLeqNngBcmJIjyu6KBANPVWD9S0zxdylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsqzbZ+P9tEy72ZPYgpW3Gyv1yIL/kdy/MNuEMlt0YE=;
 b=L5lP6lg9NI2L/GqlYPPZxWasI/n5nrrPLF33hc7x9F+PcKIT8ODHaF7DyRMWJEB110cfN1rZHm949Ne46Llg0ARbHTGkTKfEnMoN0UDkxm23MyxwgaY7iyZMTKHSD7NZDPPAoE28iIwEzZRrqF82NbUlFg0GTgjhgK41CFF5GrQS2J6pPtgxECouG64GcjT5pCqIcrKdI1MLC+vB/e9GhPxDizZzs+ALcEGVYMU5VnB0pR8+UAlB+nfykuPz7wNe8kLlolYHMVoZr9Yxw0tqLO1HwwSjZfwqtxG+lgnawUB0nTKLRGL9+TRJBJjg96TPdE4cjxGQxkltVQyHmahXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 19:57:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 19:57:35 +0000
Date: Wed, 15 Jul 2026 12:57:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] xe/userptr: TLB invalidation new pm_runtime ref before
 submit
Message-ID: <alfmLCNnyyXZgOo0@gsse-cloud1.jf.intel.com>
References: <20260715140133.1811959-1-dnyaneshwar.bhadane@intel.com>
 <b32d3a0f-e0d8-4aed-9a39-f3c317c33c3c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b32d3a0f-e0d8-4aed-9a39-f3c317c33c3c@intel.com>
X-ClientProxiedBy: MW4PR04CA0295.namprd04.prod.outlook.com
 (2603:10b6:303:89::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 4669b3f0-cb0d-486d-6581-08dee2ab50ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|4143699003|56012099006|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: OabnfnEaWbiK0AwGW+sMn5uPd9L68e6x3M3lWbohxuoZT4GVDwimH7nuciFRf3fSzSAveBzMjpde4tFYcJ+N/lnbVYcyfktOIwURbWu7pmsMj1M8psFAUbmYuqg7zG4faS0hnwHgFdeFPYnUnJB4/ovj2oPSI99ihnbaJxGwguvYNWUzTlAohKHLypwYkEc35ZBGt5IjzaIU3OHXcQiRWPkjBJzogJ5YFhgi6GyJyQJit/usCNd2SNAiOLCE2pr6Cd8RMAm6t4Zeq089osDzYlBls8JLqWyz39/NYg/Yk/hW9llTdca9AhcKRStMZPEIAZXW8M295mKdD5mzDngveTjR5wrA4tqugYNpq3utY+U9/aCgN1GQ4f4ih1oYEuvdjgLQFwCvf97+Ml+gOuUr9mYxyWQIDJrWziHlMJHD7JmcER5OzqzMHo7XWcpZY0TpkQeaXgggrlXyWmDiiwd0fCQ7khWGrC2jbrlqSqXi9chK9zMb8cQ76BzoaXY3k10V7okh0JwJuzqsZX5z8QPamY6C4zWHNdx27zYcQt8DjLQFtbl7XS/YvnoxESdE/4UIgTansilJeLQDzRSrbH2F9ZPU5lIMkyIYHlE1KgoEdYbprkdDpwpUqeyqof3FfW2h7Ugz7eEv/ioFizxr3EWRQO1iF8GZD1Eq9xne/z8jSNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FXcpnKk8pFwgnroaq/BlSbM0RfS/QQ6QbQh6N/ncqzazmbVH9Kqi5d6S+Wei?=
 =?us-ascii?Q?ZPUVt+Ihr1U1bytPcOWUn06kGFBO5mw9Yuv4WRlis3icYdYBGmGJxB3bWNe5?=
 =?us-ascii?Q?BxsIFWS5rjwAvuHmiJl/vWq6Wqku6eqINRyns7eh5ugN/3ixuE9rHYDh9C9I?=
 =?us-ascii?Q?8yo8ocAZxO7I72dATh3ZpSFOMedH5imOD37LbOINoyNfTDMlkAofU/XN/se1?=
 =?us-ascii?Q?rikRMYVsNupbLA+W3oM95w5z7X/6eytWAmnBqGDMIv6syIjjr34mmu2d0Thu?=
 =?us-ascii?Q?puC0hCzfiKGUNf0PC5uR9JTTGn0VZhl4C8bn9tn3N+N9E2qj8y2PTxkRVeFl?=
 =?us-ascii?Q?hvVOvcJhIMx6vvZtKY1f8Rc01Z/9i86Fhb6EzK/sjtADoTxM68bgzDYEl7+S?=
 =?us-ascii?Q?VZhJk8u091yJXHlt5GdBCDfZiK4k6Mlh4u5RADKz9BbDGrnuSO6LalXcvnlu?=
 =?us-ascii?Q?sYMmcbnjGaJpE9qpNA76V120azkMRYzKp1rMc7iLcGJYDgTNQ7DpYzE8mEfB?=
 =?us-ascii?Q?yeBidcvpBJYuvCg2t5oXLmg2xMlCog+W7p2mhJ76oiKGs8W3Wae3Qy2trCvY?=
 =?us-ascii?Q?ohMv3uepV9hapxgHzah9qk1O2qa0P4GOdBOH4/KeTvUKQ6K+78lzT7vpyd3t?=
 =?us-ascii?Q?OdZSEAp3Djq4X4f+ok3e9tXkVmoje0ybCPcRcC5jsrpnKSk4ElrtyT4iuh7O?=
 =?us-ascii?Q?7hGUPDVjdzc/npc/BvjjhGHWjCuJbcLTUM3lU3RWCTrRpSpA00FsZfW5Jl6v?=
 =?us-ascii?Q?5aPV2qruTEb/gzT9dSYFnyLdhzIsnbyDuJHcoMq0g/2leI0mQDXZzNYS33o0?=
 =?us-ascii?Q?6LrZVkql3Yt+49CguF9TXrYF17WolDIGb9Q6t44ka6C4xZ3KBaPA1WqbpO0m?=
 =?us-ascii?Q?Jif6F+H5vLnImh3ElW+oy/OhLJ0VWMqpggXopDuAmw0/jJgYF5bjxszk5pz1?=
 =?us-ascii?Q?10X713zZUeCxGt5tjoMWR9w5bEpfaP/t5Y0OMChu0tbsxZX5+mcgHYXlbX7L?=
 =?us-ascii?Q?yNRmB9SsuhfGiIiGToMvG35KwoSfQMZtIGqrD6rLP6yDoitNF3nHDsGa6Uz6?=
 =?us-ascii?Q?MYtmbO/Ilhc/iWPNIPFbd+y5+JLS4o+Ofy/537TV5tQYUCBSB4BXf8oMUwM9?=
 =?us-ascii?Q?5FrVVB+c5rPkMXJ8imIE0M+72dd2vy3FPlwemuoGF5LPDsnI86A29FsxiIj6?=
 =?us-ascii?Q?9ABn22v/d787o9/b2nluI6FGWD7Hz6Gy9/Q905eu4uwX0oH7MnZ6sO+h4W36?=
 =?us-ascii?Q?Yu0T3SYpOUh8tfJo6lipEG4WGQHsjOmHu4c38zGrEZMHnUGvDXB9aqURwhKb?=
 =?us-ascii?Q?1l04QC7TH8xBeFIsvIj/Jxi1GjduUCamcumXLNgQS3F+huuJLFgz6ikVBSqD?=
 =?us-ascii?Q?KGFs/G5WNnBR/sAGnkIPxUDeP27rwAo3CCtNcNP73xV1JoDN8zKZDHwmHebh?=
 =?us-ascii?Q?8YLkBZ5ZgyZIXYFRZXkaQn5rqaOfHbpRY23eQ8xjqNbXt7iyNALmxgnviQ1g?=
 =?us-ascii?Q?4WQdXtYRV0wiDIyt2KHqz+8xa+h5G6Qt3/JbN7E1kH2sgX7761/2C+nMbitv?=
 =?us-ascii?Q?d2UL8UDil2qFqLobAZMoRW3dU19lDCq/qwLauDRqOCRf39sXUZK1nBSLcB5u?=
 =?us-ascii?Q?SRKZJuD7Ao9SipfTj8Vlavtz/YxtB2CM8WPyRFtFjgNGS0lSnT7hOt0ieVeN?=
 =?us-ascii?Q?OF3kb7skKMbRPtnCqoniqIpVIl+QIMxzqHx0/gtC9zKIlio53Y4ukgTccCCS?=
 =?us-ascii?Q?z1gzVAWE6A=3D=3D?=
X-Exchange-RoutingPolicyChecked: cJTOmO8OKyAEZWd45Xu5leSesD1bjM5JbDzxRaWE4vOM5VIUUXWmi4MxM95dmkRzqf9tjP49dM/zrfvtR/+WRrFObv05zzBb/8QFqPfN6G1MlQlKzMOsJ4zQhns9xSixqJ/2BB05sFoyGAsRVYvSuiFT72Z6mCsSYteqX4RDeDrWuFXEmJF10uMTGIYlVJOtRwhZ/Qt+2hbfB8/nPYl6SQUirA88ffHU96f6kjkDk//MB1fAPOb5EgQM1oK+De19ija2af3KT0UdAErJROBGV+7fLBi+UxtSIFfIuvGubwpS4c6RCSqdo60lK6jlrOAkGfyejx55c5lhSzfoOy/cMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4669b3f0-cb0d-486d-6581-08dee2ab50ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 19:57:35.7575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJITZ6ZtSkS65InzT+u7SyFVJRN1xNYlPa6Rt5d4q7rCrrw1A06xLjoXP9XfVNWeDqRgIV26AG1GzFBJPTjFtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
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

On Wed, Jul 15, 2026 at 04:02:58PM +0100, Matthew Auld wrote:
> On 15/07/2026 15:01, Dnyaneshwar Bhadane wrote:
> > Take a proper runtime PM reference before TLB invalidation.
> > The MMU notifier path has no outer xe_pm_runtime_get()
> > protection, but xe_tlb_inval_fence_init() called from
> > xe_vm_invalidate_vma_submit() uses xe_pm_runtime_get_noresume()
> > which requires an existing reference. The fence itself will
> > hold its own noresume ref until it signals.
> 
> Is this fixing a real issue? Do you have a link to a bug report or a splat?
> 
> I think fault_mode implies LR, and LR vm is always holding an RPM ref until
> destroyed?

Yes, we should a PM reference if a LR VM is open.

> 
> > 
> > Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_userptr.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> > index 1d2ab678faf5..fc7e4b00fe17 100644
> > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > @@ -8,6 +8,7 @@
> >   #include <linux/mm.h>
> > +#include "xe_pm.h"
> >   #include "xe_tlb_inval.h"
> >   #include "xe_trace_bo.h"
> > @@ -103,6 +104,7 @@ xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma, bool is_d
> >   	XE_WARN_ON(err <= 0);
> >   	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> > +		guard(xe_pm_runtime)(vm->xe);

Also, this is illegal as far as I know. If taking a PM reference wakes
the device, we may allocate memory and acquire a number of locks that
are not permitted in this path, since we are in the reclaim path here.
Lockdep should complain about this, but CI is passing, which suggests
to me that we have an issue somewhere in the lockdep annotations. We
should probably investigate why this is not triggering failures in CI.

If we need a PM reference here, xe_pm_runtime_get_noresume() has the
correct semantics. In the TLB invalidation code paths, we do exactly
this when arming the TLB invalidation fence; see
xe_tlb_inval_fence_init(), if that is failing then we have problem
somewhere else in the code that this code path can be reached without a
PM reference.

Matt

> >   		if (!userptr->finish_inuse) {
> >   			/*
> >   			 * Defer the TLB wait to an extra pass so the caller
> 
