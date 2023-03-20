Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2599C6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 17:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B898610E5F9;
	Mon, 20 Mar 2023 17:14:54 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0D510E5F1
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 17:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679332492; x=1710868492;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6fNHypezzW2IvV4YuZhieMWuUid30rkCfaJWNK5Wyeg=;
 b=AqTdT/LoDU46EoQiO/rqVYt9gF7ssJJ/A6duiboFbkBbnqBywD8nCDwe
 o/lq1AewVuTj0PMyzNse1CsbXMtIKGcKODNkse6g9RwWBMSoQZNVy+q4O
 x09kdfRbH1tyYT8IdwclwcmtU1wnhOjjlPN01GcggnRxEZZMy54It8LpA
 J15KTfd2TLfCDtfwtm7k1pWelx4UZVlWhtRiOfiNvNT+kXurFBCCk/y6g
 X6NAUXNlxyYxwzCLNZuLEbkofN2fd/PfEnvrotccewGJnyLYitPyc+elL
 alEIO/0JVTB9Tc2I+wXzd15gf4BdlZzw4jUklhsQlnrzhfw6LTLHBtNKG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="340270524"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="340270524"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 10:14:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="674474683"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="674474683"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 20 Mar 2023 10:14:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 10:14:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 10:14:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 10:14:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 10:14:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZOinaDXignFHfI9Jb9eWrICKVRP+q2vMQRDGHnoXbqqVvkLFGaD1beUp3JyPbdHn3JIPHrQvy26QLOrYWGeWFjyzZBhmTfQ1G97Zobldu7TW/HPt4sMsqngUh5O5ypIDuENhQIKjZ9Wx/mlaC088WULzP8W1LWDpzBGu2njzDuIzSZFKpzva59Q0cSG+2f6MTZYTGO+GTDzQNtmTr+ryC09xDzCZsxsHG2vJON4u4ecXtrVsuBADA2NUyp6kRIAgOYO2oLb8WUl5OIf+2xoCG2XXxQ0RMaQrPOtH+A1HeT5gxR0aGtRX3PeOQgh2k/vVoSwQzVg7pZB6iWRNPz3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vG8FMMBdCDhI5O5aQQjICfs+CurHA14NOIkXajmV/Vc=;
 b=L0JfwIhGSiYInMw6GTF+BYO4AMABP6ZD1XMf8rCYQ1dtkKZpGSeL33mmTfr7wA4g7oi0XjEDbbe8G7P9fApRQ88xfA7bE4fWuGvOie2FBy28X7W/7Pguc4wQzmf8PpfnweDN4OtejOmVtjQhI9YhWoaHlcTMKb263yr4iG9haZJqLZJ0NdUnN6sHVeeSBNNQNeI3O7YgHrWH5/ZAupThOBhu8NK4XEGSBMimuUA3y7hMJAxdQpxrwJIAW28tZQoi9PuzwHUjKr6bQzwghC/PzxXwdzNrLAH1GHTTqaKQvCaJwiZqoqXtcyhrwEhRVlnVSA7Mnvad6RPUligr9fAZig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4957.namprd11.prod.outlook.com (2603:10b6:a03:2df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 17:14:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.025; Mon, 20 Mar 2023
 17:14:47 +0000
Date: Mon, 20 Mar 2023 17:14:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ZBiUWCqqEf5XoKoy@DUT025-TGLU.fm.intel.com>
References: <20230318032842.578049-1-matthew.brost@intel.com>
 <346d3a67-11dc-afac-9b28-335b8fe1c4fa@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <346d3a67-11dc-afac-9b28-335b8fe1c4fa@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4957:EE_
X-MS-Office365-Filtering-Correlation-Id: 899e2527-ee1e-4b67-c6d7-08db29669b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Kj/CV9FH6WsKrc3u+/aEUHEn5vrrZMLk3nb1Kv3WPexYr/e0PV14OD9MFSBjw1cl+Jjiv3ahPv7uN2KsjM/SPgF8Sv4gsVQwiYJtMoC3jNBB7UlJGGfKLk24ryrPqfVcJVPI+IlZaAGzXNYaOTfCVzY8cQRwV4Ssi+JeG6+IckP1YuK/Bfn2Su3zAUgeu/cuwwqfo936VJ9rzHy1mw8SQ9qWGw6WHfkCsonPElmzd/I8z13yHBi39K+dqp2pCEaI61ZkQgLiNqyB99FyDozjlzEuI4fGlXIth3y7PIus7GXVcSP43kGSqUnbZvIv7+UgAeoWXEXVKwlgAM4oBaOP1vIsvFdfx28zUfVCTfJlLaqnhBxMfQ+xHM0anaZV8Rmcm7rdKe2Z5dgvfRYuHSt/+FFlQLGCOG+AHoN6W5ty5cukXoNbhh1M4WeUVBgjXZTiLFKpLRnmgXk+wsLW3yAaCXrUvQBXu2sWFIfM8BZaS7avb0wKKTmDVUQne9/GzVNhmqph7JyOy6Hk2EfwzT8YdUoUBk5hCgUgkCtJWhppq98hp9XQUsphPLR40Z7EdhUmrjPMInFHDSXP6CspLRcZMBt3gdj83FaRNZBKKYy1S8r98fzPT79YqI3bYSHARP85jqRaCEAtg2cZ5Klf6ybZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199018)(186003)(6486002)(4326008)(6666004)(53546011)(83380400001)(478600001)(316002)(66476007)(6916009)(66946007)(66556008)(6506007)(26005)(6512007)(8676002)(8936002)(41300700001)(44832011)(5660300002)(82960400001)(38100700002)(2906002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wS2OhjAbS2WzvHHSz3eXuYb6ETCG36/arYL/0jrTZKLkRylANHTwdStiQauE?=
 =?us-ascii?Q?CTZPXth94iPQ4vFTy3TSItpMv/meEPDCym72OHNIt0+PqOqgxKsqx7sedne0?=
 =?us-ascii?Q?T5NAm9To8ddP2p+PAMY3kmclvmKatck56Va8Kt5Nj8FTj0jqZYho0WJxPFxU?=
 =?us-ascii?Q?J2Fw8xffWfb78WwOpZJNsBK0xuarh8qnE8bHSGbICcn9+YmUwCSjV2fKlcF2?=
 =?us-ascii?Q?MfE1nDOPjfhanya3kRh9SYMecv5yF6ekpCN0ei46sWoMDJz8pbKs2O/Ul0it?=
 =?us-ascii?Q?bluM6WlG/1iEBcJk3cjnLAwWANvxVogQVE/4HUY8maDsbi1yo9BKQ4g06MfG?=
 =?us-ascii?Q?PIEQv0U2aacvEIyStcvr+1gijqWqr20KhrDQAmQt8WlmbIUbKvVFM8NBsPdb?=
 =?us-ascii?Q?zsAa781oQ8CwV7O5y3idU7DblchHdE7nHu9/pnHAvXmTnVUn3POnW2ORAx/N?=
 =?us-ascii?Q?uY3zwvwOx9eJcuWt5u7mOU2+j3J8+ROq3CT2DVdWSN+vAUJL79RRGfrK4aG2?=
 =?us-ascii?Q?fqkH/BrQjdHOd9FUsc03j9zg1FFkL91mFx12LpWb4+J9HvQXjvWgR7QQ1MTR?=
 =?us-ascii?Q?qcx2vApMYqEJgWkp017FuZPB9xdY3/EOePnlEEMy69M+QAyShKk+KHi9CMk9?=
 =?us-ascii?Q?exV4mJu0tsmkbsyH+bI3i3N+FzDh4v08yrqGhvlsxATrI7yBDKw4vaPDaSu0?=
 =?us-ascii?Q?ceP5gq4fV3aHymsXgWWu81BGBWClK6uZmUTGs9s8C/GV8seJVwdcJ62+qEvx?=
 =?us-ascii?Q?PTPknHCS6xm7MEcJ15lIwvapmJBI9Mg617FQFZINutrW6M8VGdWl9kc1Bwho?=
 =?us-ascii?Q?LGR6A8yWitduKdKntqKpZi4xPj/1cuz4tVnyP6hNJXB44Lwa1wN2rRJtYwaC?=
 =?us-ascii?Q?H+efp0p+PJJQWiR8RUBEyCAN85czFSiK3eoogNtV4k7kgN9dDEdeeFSmdqBu?=
 =?us-ascii?Q?0Eklr4CjxGO+3u58TRGNqLL9bOW0CDncePZMyu19KnoKS77h0BRHHr7YuCIX?=
 =?us-ascii?Q?Q8ibartqP+3a77zw0/o5RrWMBMUKk3+HPN7HzCyQE3B+1aH9MQ0CMIxMJ3H7?=
 =?us-ascii?Q?TGDlTQ4K5iFmEj5esLMttddXKIb/mIzr7TnHn3wdgAyLasTsvgXrZnIi9T03?=
 =?us-ascii?Q?Gg7WNLtODxFlQV6Spablk3neJxQkiuEf9Rxr80zLvCXtfVwxkY04E1pWhpQm?=
 =?us-ascii?Q?Ghhb/i/dD6UpVJYy4HZjdyR9MgfI6Tw2dW6Uf/Nzjw5fNa0zmF6m29qVor5a?=
 =?us-ascii?Q?eRpmZlwLe5PuxKIc6soQpEeTsy6TRrgZ8L3qWiLON5/Hbww0jJ6wsu2M1Xn6?=
 =?us-ascii?Q?2hMjc7f2ZKFVPkM2JxBz73NTNV0yCN7s9t2UkyDaeswCyqh5fupg9XQFKmQb?=
 =?us-ascii?Q?I5LgIFbfLGizGs97gj6VhyoGHn6xIQkQh4Re4qBAX9fQrjy/YYMnU3dotjRg?=
 =?us-ascii?Q?e04I/aTD/XYORCiAD/uMeCBdcvoDeiKtdreDvBeIhdzfU4jAh6aae/QE5eQA?=
 =?us-ascii?Q?q2GzuwE0B2M2rVmc0i34GqLEGTKA8WvP33oOmqvyQE2eL02ma+Ape8CLy0m2?=
 =?us-ascii?Q?9UYGRZgRO+N/GZ+fdmHdBnVSDn7Zh9LcWYpC9GpO6ze3ELtlInqUQIYc3FXY?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 899e2527-ee1e-4b67-c6d7-08db29669b48
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 17:14:47.3260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VL3PF/W3qLAawjRV2A3VRzaXG6kmtDcb7zhVUq4+3d3YGh5pEcftfv2sAMsICdu+EjNhLGtXaVoVAHZWTLBW4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4957
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix potential deadlock handling page
 faults
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 12:31:11PM +0100, Maarten Lankhorst wrote:
> Hey,
> 
> On 2023-03-18 04:28, Matthew Brost wrote:
> > Within a class the GuC will hault scheduling if the head of the queue
> > can't be scheduled the queue will block. This can lead to deadlock if
> > BCS0-7 all have faults and another engine on BCS0-7 is at head of the
> > GuC scheduling queue as the migration engine used to fix tthe fault will
> > be blocked. To work around this set the migration engine to the highest
> > priority when servicing page faults.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 76ec40567a78..8fad6e60f826 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -106,6 +106,7 @@ static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
> >   static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> >   {
> >   	struct xe_device *xe = gt_to_xe(gt);
> > +	struct xe_engine *e = xe_gt_migrate_engine(gt);
> >   	struct xe_vm *vm;
> >   	struct xe_vma *vma = NULL;
> >   	struct xe_bo *bo;
> > @@ -185,6 +186,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> >   	if (ret)
> >   		goto unlock_vm;
> > +	e->ops->set_priority(e, DRM_SCHED_PRIORITY_KERNEL);
> >   	if (atomic) {
> >   		if (xe_vma_is_userptr(vma)) {
> >   			ret = -EACCES;
> > @@ -204,7 +206,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> >   	/* Bind VMA only to the GT that has faulted */
> >   	trace_xe_vma_pf_bind(vma);
> > -	fence = __xe_pt_bind_vma(gt, vma, xe_gt_migrate_engine(gt), NULL, 0,
> > +	fence = __xe_pt_bind_vma(gt, vma, e, NULL, 0,
> >   				 vma->gt_present & BIT(gt->info.id));
> >   	if (IS_ERR(fence)) {
> >   		ret = PTR_ERR(fence);
> > @@ -218,6 +220,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> >   	 */
> >   	dma_fence_wait(fence, false);
> >   	dma_fence_put(fence);
> > +	e->ops->set_priority(e, DRM_SCHED_PRIORITY_NORMAL);
> 
> Could we just keep the priority of the migrate engine at KERNEL? This change
> is prone to undo the same priority bump by another pagefault, unless you
> protect the priority with a lock.
> 

Ah, yes if you have multiple VMs, multiple threads can be processing
faults at the same time, good catch. For USM devices since the migrate
engine is a reserved physical engine just setting it to kernel priority
seem reasonible. Will change.

Matt

> ~Maarten
> 
