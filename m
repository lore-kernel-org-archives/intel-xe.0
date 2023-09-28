Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13062E743C3
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 21:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1C610E6AA;
	Thu, 28 Sep 2023 21:04:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CD210E0AE
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 21:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695935053; x=1727471053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pdm7nU+GP1qmdwQdjapngQLVQxhYMSKyewx8Vx8lMFY=;
 b=fqQObVxu5/f+a4TayYwfktMMY0W9QP4P72gKr99rBh+XqcpXTIkZ7Jfc
 2mvg8cMpjYpXC7/l1kXpncAWijV7MFwVSI3KEpPXwUOiMizwIMUFGxdeM
 RPBSDMQ8BzQXdGzhrEwGNDhbUT9o1OEqCjCE1Swi82gOI57trWDIUi7Y3
 zEyKPH+3gwEA5/aD7TgnJAhiYevKDIp8vL02QTlxwwgm6/95RfKLFxuvC
 Z9Ohv/ugZLnJcxz4rup4c50ltmPMr7SApVstzzkZAQ4fn4yse7HhNNjgF
 FC1nwl0CdG3Il/Q7T3As2qtovyYmeCNBsrOk9aZ08b5EAp3iaZfkuheL3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="361551298"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="361551298"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 14:04:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="840052602"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="840052602"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 14:04:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 14:04:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 14:04:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 14:04:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4sVm9CNfJBg1dxYdPpvIzgpXqdDnXyH9RlWlbX1HPaUMeiXO/HiZo9W3bSibtNNjog/Zbv81t8IfuKPjOlvYtYXrPUnYY7B7LvfiVurGNwPzYgyLt0iFY/efZz6hpK44FyaimIBPvxAv5WIFEXRI0H5Mj3ctkcJnEkWbOeHRD/k2yXipfhgZJ8OK1nBSeWHwN28pbPIU3QjGvf9TJaflAnYnmT/cjLE61v5fTIpuq61BCISHEFAp4O4Lc7SxfBfgmYklY/jwFk6famrVcDIIhJpeHYYjdwKyuqDp7lbWfMT+tVOJhtme9nfEQAXwT9KAamQb/tZl7igCe0rA7EzMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYI7UMwmWQUYAn3gLbmWWemhia6N68fOo9rmZ0+Che8=;
 b=TnSyM9tT06IC47Ur5n9cOuro2i59H+/39K5qEfS+B0T1C0mTOHr0FmQgskzb+wt5UFl6U+ytdAMik2orNw5t2GhZ+TJ0girkJDw+nbRg1wtKOt9UViVwCWz4uV8SDwWMiE6AmO34HHFOrkuVsQKytQCMNwlLOWTxiKwhNNPsGvLBYlcifRCcm2+vRw4hdfhctPH1N5d6whMan1geOa8sF1HWZHFZSt+7xbxEXxBdz63J/sLdDtYcMDpy38csXLNk8k4gvfzovX+jZDznOAO393siG7Ud8YXnhwHYuAkp0GzmHtuBOKUKVW7uSUZmLkXzy4HZuoJQt3MQ8RJ45TM54w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS0PR11MB7482.namprd11.prod.outlook.com (2603:10b6:8:14a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 21:04:09 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Thu, 28 Sep 2023
 21:04:09 +0000
Date: Thu, 28 Sep 2023 14:04:06 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZRXqRsYvgoZQDocC@nvishwa1-DESK>
References: <20230927043118.3017207-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230927043118.3017207-1-matthew.brost@intel.com>
X-ClientProxiedBy: BY5PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::18) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS0PR11MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb557f0-5f84-4ec8-0759-08dbc06675a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OXdKfpz3/ytGcnYw42O1Pgx/W4Gwfao8Y2qo8xk8ASJTpscTlzONhUPTR9IGyzq8ADMySgI2Dqy2kVPy6L/cP0uHZZ4B2df94RjvdDqYgLInCRw0PhthMgAT8JAzzzHftswWwy9fcw0lFRv/8+/q/DkZVUqcIhUTr4phTmidkAnfC8dq4lroRFxStcS+n+OiLAyagWc4gNZPw3RyaTuFkjp+h93CtVBkY+q14VzkmxirPIxQthL0SktMwYvZhiFuEFQ6BYWUOI/X0PuxJDu9E4UZKlZDlJvHZzr+LeRwCVdRih1/Adnh+fcnro2XMSebMsPIpXJP9ER4gkVQlQylKY0elqFanGvzuuu6U36RPOItYLohT/lg60QIQkzhtdyoSRUI+N0d314ZkONEr3zLwi2lGnHsvY4oyjFf+VFd9Moe4Q9CixhGwRlWSiRGfT3G9QW0zPcveJph+AQnXVcG6m15IytjWoW3SLmnwXAORO/641pY7RvinGGHBLjNeOpYzOaBdNEMnG0nY26cfSE/u+PPHKfPSQyLwAFSRsERm1INDOO6LZBHvHyxlpLI41vA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(6862004)(2906002)(5660300002)(66476007)(66556008)(44832011)(478600001)(33716001)(6666004)(6512007)(9686003)(66946007)(6486002)(6506007)(26005)(8936002)(316002)(6636002)(83380400001)(4326008)(8676002)(38100700002)(82960400001)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rj0hVTl8fE+MK6b31hLIslpi0ByCz+EXgTGfXaJS7GlYg2f35HMy1Vo/pITr?=
 =?us-ascii?Q?ClJyvzN8jdqeN2U5HUSZW48wfqg0bUvL3hucjB5JJXSpRN/KSoIrkiNnn0cU?=
 =?us-ascii?Q?hgfYbqFLYyQuqVnv3/jfeOkKcjY9M4GfYYwu0yvTjdF9gq2DzlkCxyiO8YNb?=
 =?us-ascii?Q?st+werd1L3dkkuZNOPbC01tYAGak9TdWHbnbdRIzel+dfSwWUG5DljSyMJgm?=
 =?us-ascii?Q?vDeX1om0TcEcfWCsJ1U/J3V5wfm0YeWjkWDLS5etwPGythyGHQLQ7AJD6syu?=
 =?us-ascii?Q?lEl0i2GLVmzWFwzygIUsd+zGq+ciCvLQsI9O4FGXJlkoSxCNL+5VK16K/tj1?=
 =?us-ascii?Q?htuY3RIdubPPFYyTPeYbKoJliCPpTrySQNb5DTA9ZUIW1ANrdwJKE1MF4BS1?=
 =?us-ascii?Q?PMoVV0zwFMq7a/nQdAJ04Sdjrer2kAQvCJhccj6iXgFv5O9S0vEStseHpzm1?=
 =?us-ascii?Q?VxOXW2kcDbMYO/Szmssu1d573xB0x1BxCUM/KtdgjUk++lmipzoUxcrLiTK5?=
 =?us-ascii?Q?FPGiN6bJ6rhTJ3wBHI5fq+que8z93TsneNbuo6YEHkgrz2kO7o24CI/G5mK/?=
 =?us-ascii?Q?p3rNZGileB0JGg6qk79n/y1zzYL7FTTQeqtbVvr8aCzyiZrxjdaiSHnZgB/s?=
 =?us-ascii?Q?7AeGcCDn8/+K9WuGAOtB6M6XOmu5cb92rOX1mUBI2RZSwF2swWIE/lfkLJqd?=
 =?us-ascii?Q?V0L9CnASrAmminQZYQ3cDbhaaP7yGnVrjDskU6pLFqZD3JGBOlcgHb0ywH78?=
 =?us-ascii?Q?ooZz7Bwlil1gjjcjzO5Nfz6bktQ8vrT9TDijAXIFLJfSoyZLPyCfbqrIR5xK?=
 =?us-ascii?Q?kBF/Uz53fdMGIcBLgUi+EGA/VtGsttVCT26o3DkQUH9o+SGYOI5ns6yAUw1Z?=
 =?us-ascii?Q?ZAY7qC0GDNdbZKvQkSHG1burMxxuYvVUhp9Jkdo9v7NLtnVmRcbLNo1DrF1s?=
 =?us-ascii?Q?HlL7Kjew+TIQNMxgRiQ3COsqc9yCbfqqZydQDmktZSjlm15XXqS8piZ/fEDN?=
 =?us-ascii?Q?ymuBp5wpzAaIOluMI404u1E2BzRh0ijZL43H+yWH0MhDfnVG4veXxGleZqMT?=
 =?us-ascii?Q?jb7hQGJRA2qSgtnLuDMhkBLkiRBLI2jMvn/tYgfzKWRhIeyaVWISDAHahf4t?=
 =?us-ascii?Q?R6d0UbscrgxntYAS+cRR6PuqgKL2Yp0HYjpuMXd8apF8oGdqfHmQCm3or6Ul?=
 =?us-ascii?Q?OMtnTaxkBYvJ8xjNVOhDNsdvvkz9ghzn4rxuOucOvw8l2+7rkuMuZxXAi6Az?=
 =?us-ascii?Q?Kxc4de5OvgdxDLcVLT2TsjnAOy4NSjdGVT2fmhSRjv4SB+R0XkBFaSUVoPyZ?=
 =?us-ascii?Q?tP2MaRwGSzVxLGXmBNTE9nSKKn2jH0jbX6NdZGvJvMvSZXyYtPttPJZwx2xJ?=
 =?us-ascii?Q?+hdNwdDV0s58lYlN4Hj2U0bk/VGVFAOpgBq391FkZDa279TeRF5eKvVi09yQ?=
 =?us-ascii?Q?aWJTfuIU2QU1G78jXxbzizuunXUiPFpUyuKXOXILQguVKNlFUJYdJJEV7jSW?=
 =?us-ascii?Q?fbKQ/+qvM4u7XWVB0X/4LVJHCGE1FSPvuvCC74Y7V1Ub+ZpNSu8bZd13lfQY?=
 =?us-ascii?Q?x9oHvLe5A8VPvQRPXv+4SmvnQpI58TELMpcAQbkOeEpXR54YMZKqgDe1I8dr?=
 =?us-ascii?Q?IisweLXRQrcXuauWE+GB1u4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb557f0-5f84-4ec8-0759-08dbc06675a1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 21:04:09.7180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHrbZvUIJsmfALw7YOgNm0PpdYH0LBOu1Aa7Rwm93ykeVFCvFoBm5ZRTU6uyy7XMtc/2jUUgi4r8jO+9UdkgLnvPNtn2fFEwXPdHVWNlsCEyXWOuR55rC9HLC79O4DKM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7482
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Drop -EAGAIN userptr invalidation
 dance from VM bind IOCTL
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

On Tue, Sep 26, 2023 at 09:31:18PM -0700, Matthew Brost wrote:
>This isn't needed as the nexr exec, preempt rebind worker, or page fault
>will issue a rebind. Drop thing complication.
>

s/nexr/next/

>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_pt.c | 61 +-------------------------------------
> drivers/gpu/drm/xe/xe_vm.c | 10 -------
> 2 files changed, 1 insertion(+), 70 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index aec469842471..34954d354013 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -1042,36 +1042,6 @@ static void xe_vm_dbg_print_entries(struct xe_device *xe,
> {}
> #endif
>
>-#ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
>-
>-static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
>-{
>-	u32 divisor = vma->userptr.divisor ? vma->userptr.divisor : 2;
>-	static u32 count;
>-
>-	if (count++ % divisor == divisor - 1) {
>-		struct xe_vm *vm = xe_vma_vm(vma);
>-
>-		vma->userptr.divisor = divisor << 1;
>-		spin_lock(&vm->userptr.invalidated_lock);
>-		list_move_tail(&vma->userptr.invalidate_link,
>-			       &vm->userptr.invalidated);
>-		spin_unlock(&vm->userptr.invalidated_lock);
>-		return true;
>-	}
>-
>-	return false;
>-}
>-
>-#else
>-
>-static bool xe_pt_userptr_inject_eagain(struct xe_vma *vma)
>-{
>-	return false;
>-}
>-
>-#endif
>-
> /**
>  * struct xe_pt_migrate_pt_update - Callback argument for pre-commit callbacks
>  * @base: Base we derive from.
>@@ -1139,7 +1109,6 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
> 	struct xe_pt_migrate_pt_update *userptr_update =
> 		container_of(pt_update, typeof(*userptr_update), base);
> 	struct xe_vma *vma = pt_update->vma;
>-	unsigned long notifier_seq = vma->userptr.notifier_seq;
> 	struct xe_vm *vm = xe_vma_vm(vma);
> 	int err = xe_pt_vm_dependencies(pt_update->job,
> 					&vm->rftree[pt_update->tile_id],
>@@ -1149,36 +1118,8 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
> 	if (err)
> 		return err;
>
>-	userptr_update->locked = false;
>-
>-	/*
>-	 * Wait until nobody is running the invalidation notifier, and
>-	 * since we're exiting the loop holding the notifier lock,
>-	 * nobody can proceed invalidating either.
>-	 *
>-	 * Note that we don't update the vma->userptr.notifier_seq since
>-	 * we don't update the userptr pages.
>-	 */
>-	do {
>-		down_read(&vm->userptr.notifier_lock);
>-		if (!mmu_interval_read_retry(&vma->userptr.notifier,
>-					     notifier_seq))
>-			break;
>-
>-		up_read(&vm->userptr.notifier_lock);
>-
>-		if (userptr_update->bind)
>-			return -EAGAIN;
>-
>-		notifier_seq = mmu_interval_read_begin(&vma->userptr.notifier);
>-	} while (true);
>-

Removing the error injection part seems ok.
But why are we removing this block? This block seems to protect the case
of userptr invalidations happening after we pin the pages. Right?
Don't we need to check for that here and return -EAGAIN if invalidated
live we are doing here?

>-	/* Inject errors to test_whether they are handled correctly */
>-	if (userptr_update->bind && xe_pt_userptr_inject_eagain(vma)) {
>-		up_read(&vm->userptr.notifier_lock);
>-		return -EAGAIN;
>-	}
>
>+	down_read(&vm->userptr.notifier_lock);
> 	userptr_update->locked = true;

Do we really need the 'locked' variable? Looks like it is always set
if this function is returns successful.

Regards,
Niranjana

>
> 	return 0;
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 861d050871bb..147d5f901f24 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -2757,7 +2757,6 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> 	struct drm_exec exec;
> 	int err;
>
>-retry_userptr:
> 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> 	drm_exec_until_all_locked(&exec) {
> 		err = op_execute(&exec, vm, vma, op);
>@@ -2767,15 +2766,6 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> 	}
> 	drm_exec_fini(&exec);
>
>-	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
>-		lockdep_assert_held_write(&vm->lock);
>-		err = xe_vma_userptr_pin_pages(vma);
>-		if (!err)
>-			goto retry_userptr;
>-
>-		trace_xe_vma_fail(vma);
>-	}
>-
> 	return err;
> }
>
>-- 
>2.34.1
>
