Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E46C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 04:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E8F10E0AB;
	Mon, 18 Sep 2023 04:53:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B0710E0AB
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 04:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695012804; x=1726548804;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=unaWjka+L+rS4k+mBOhoHqz77j3W0w9KJINPQ9c0VD0=;
 b=IFK0+kqNBVsDRYldOUYMYSOyBclOfc7u6EjSdIpYDHea1G2zI1AhX2wU
 /6uJdFujUeED1yVFzdlmSx+lwPaKOkXzTyMwVuv7j4UW92WUspitedTxk
 vDv6iseM00DUw9mSqqzKNht2GlK2ZhgsfKjBmnY7WvNkPb9iHpTzVBOK9
 0eMo4rorlrP4ah4jHXzqp0gwughHiQjODZrydHJIdZV5b0BiXxgKKb23T
 wkZiYEp/+JOkxGNLfOSX9/+SO23VeWYz3WlHsJVbsDxxtM/rWIUuFCrlF
 yFN7XASGrAfKhK1ZNsORYYIQwDo/i4pYQd1cladGURYyQlF8XteUshwAa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="358981322"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="358981322"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2023 21:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="748876309"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="748876309"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2023 21:53:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 17 Sep 2023 21:53:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 17 Sep 2023 21:53:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 17 Sep 2023 21:53:22 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 17 Sep 2023 21:53:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDYOJ6OYKcSaXGCEbHCBwjvthe7mTRt3stonsaIIJCmglqZp2GeQjZwbdk782uPZbwvMZS6YAAax55XEBn1DYyKWuaf2pa5hErCmb0Cc/I6hcf352uwyVTTXR6DuISbbpRSZRYuGxVTqXIg+LOTB/09hOhsZrIaro6a1i15oaovEJrnXQwJ77LJdyed0D/7SriTyUBXFchTHRtQ4tGduxlmMwtGhione6b5DyKiLsJDHAyICfJ5JHPBq5E1VY81Q/10RB/ZUsN9p8jgtcvnmao/dsDdXbrXVZejZeWfVZjR3wJrvubs9AXqdiKKjCWuq5LXs6jJa1YDW7wTHVJgOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMpQrMLrIlX3rQcMOCvniBdxMls2CtDJhw+4jY1fXXo=;
 b=IhQsFt2vkleXm6nAtJ67uw2q6eGYcq7qWqTJoaNREN2G8862pT6416/zY2M9U1YyOVSY4dibxTDfbyV55vutUz7XI+dRS8wL1Ij1M9jHTeOfc55wg5i4QaF6mQuyrFECDbIrlhFzf3KS/WLvuqltGsx9Q0xpQUDeyd/bUcLcYYQEo+5PVBjbHC93hP9QiKQIG2wRwH0dONcYdWV9bybuJvZq/ezKoxOC+6xCW102wiPEzte2/MDn+OkMbHXXnWBdG4rTvVjrkxXvX0qObwh09pf0m4JLvM+VtRrpr5UP2A+pdz2oWUxHh/keH+PbCNZBR5uh809zbzQzQvF0S0kEQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by LV3PR11MB8577.namprd11.prod.outlook.com (2603:10b6:408:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 04:53:15 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5%4]) with mapi id 15.20.6792.021; Mon, 18 Sep 2023
 04:53:15 +0000
Date: Sun, 17 Sep 2023 21:53:12 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQfXuNiC5mqwrvTp@nvishwa1-DESK>
References: <20230915233445.2241554-1-matthew.brost@intel.com>
 <20230915233445.2241554-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230915233445.2241554-4-matthew.brost@intel.com>
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|LV3PR11MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b327ba-cebf-4e1b-b7b4-08dbb8032b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r7Txm1Xg5SCS/8ScdJd71d3QEiQ8XT9PG3MPN1z1iyE0RlCIK3q0K6hfr5Uy6ae5i/MBAjoGJGGc5CXaXJsIb+nK9N1nsF1yIZzxfTzJZaby1QKkVxqnvY7qyXWeKVEyu3uyJ4uEATORtZEKIQOKiQnXMJANfK7tm/nb8P1Zazg9YLP2w+cpi1aWbYjhb1smlQhaEEANeSqExPECypxiBymmSY2opLFgVqYu+vdrSxjR2JygxhVt1uh5Fq+7PZuFvO+o2vTy+vz2JCY1mDHDSWnph+nP3BWG1GmsUH+0RupWpk1ekp9ge5FdkySrrugA7MsCxsEUELAxneRpCCXkY3TcQos4sZlNHeTKoaUewQS+D8B/nQ0KS4AWjqiCJjXYGnf3fS3UN410zhqCL7dCyg7OtzNsR7dI0FkKaEs6+MpqZ+8z3zRS4ptI1fZWDDbyUxR+Ia0MYRvkltKhqeA4Es/QiLWfOSyst/o8Jcp1pB2xy0qn9h4PeqcVP27UZbl/RCgVeCjgtLnILQwPSSEOmMS3ftmEwH3cTaVyEm+SmLjzJ1yDSfmpoaDMXYc5w8lj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199024)(1800799009)(186009)(6666004)(6506007)(6486002)(86362001)(38100700002)(82960400001)(26005)(2906002)(9686003)(6512007)(83380400001)(478600001)(5660300002)(8676002)(6862004)(4326008)(6636002)(316002)(8936002)(41300700001)(33716001)(44832011)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P9m5GxQRSBF40LAnDtu2w+TUXc8OwM8p8hWnrCKMXVCTWTfuxWpDeSJW4weQ?=
 =?us-ascii?Q?Q5u8Z/jivhtwQ/K9tK3ok66L7jfY29fHCZfwpWPNLVddFsDu4dWUlDPZ6395?=
 =?us-ascii?Q?ziKFSsebLLrWYQAWw9ImuW2KINV12Ga8bC4oT8o+koxSna7yHTe+PLQXRS9F?=
 =?us-ascii?Q?nkSc0m7lhoDo0sWiMpkww53nsy//r6LlG6oEwayTE1PvgZALtmVV8zgEWJDi?=
 =?us-ascii?Q?BAFApy1z9Mib+yntWYW6gNVWaxalSsykBD9pB/PB9T6wzNYC1KfZP21/jeLP?=
 =?us-ascii?Q?Tii5wRfOvFqmOymDbFrDdbshQ0useCu9iWOlQZL2wWFOkO+o/A8DW76kSUcL?=
 =?us-ascii?Q?GhBBYA5jggjdudmDV96Xf2z76e4LERuQ5f4mT3Qdj9JVWn281cy+ok3t9r9K?=
 =?us-ascii?Q?b+uTzj8Q4nZ2XXqn1col38KvZknp3iXYVR2rDH84/HZJ8B+H/K83Hdj3veow?=
 =?us-ascii?Q?p34v3/KnLcdaSvQu1JSJr5B8UbWW+qPXOUikIUPPnRQsZv6lg1gcw4UTmEWd?=
 =?us-ascii?Q?wf6etoKl7kmCC8pOs8m+WBrC8OnilTizQy1eI6ZPPhivDAdKDIkg8gFONqCa?=
 =?us-ascii?Q?fYStZ7bou7k56qZeCKJad/u8XxHPLKPjRPiiKR75lDukHw251O09kd5/37iK?=
 =?us-ascii?Q?ha0m1QuEJU9RYaM1UMCtP2NMfmL8quXGP5uugTYajBKBtOslKyZR73DMflq/?=
 =?us-ascii?Q?j4jtq2FVt0uZA7mYlalGk74q+R3zqbkOORiBDI9uGpBM++FRAJFWXYAntB8c?=
 =?us-ascii?Q?jjQdFSfyRpgky3gnv1tU8qq+l+q1jPjbrSj7BI2HmR3mAHRh6udZTG/FPyfs?=
 =?us-ascii?Q?NNE0DCgGDBsfKTaEFgDHysqoe4sv7WkwcakF3gaKa81u5eioep4nyz3UFsQB?=
 =?us-ascii?Q?sPZJRzwbL+hpAeuCnFR+OEIXJpd0Wv3whQifvL2qWdcKEU6Elv2TXdUlwsI+?=
 =?us-ascii?Q?S3odKxzmg4YY5gztJbREeIEh+70w8eLGbRFiPf2kCmDrYyi8p3x4OKJgFPcn?=
 =?us-ascii?Q?oBLSl41IrtSI3VM99u1HQoad/Prrd5GWyPPQ1fYN87qDk+JOjy7RG0PRebtk?=
 =?us-ascii?Q?ZKSLVCer+s4lxXqvSMJ5j1ypTeOMH7IRdebppGzcG2mfLInrQk6B04Kk4tey?=
 =?us-ascii?Q?kDJFJFGxYkHo2/Ghom2qLQzRrKzHYF0uCzvhlGSaQdLhqRFdnR9At43M7+kJ?=
 =?us-ascii?Q?xLTOLaSunBBZ3BnXL1mnmYJy6I34B4iUdMYJQb8/682uybUFcKsJAz4msBj9?=
 =?us-ascii?Q?E28SRp/SFGONDyCWWObPYZFzF14BqZsT3X5W6XgY7on60LtTZOCFOyFSXNf5?=
 =?us-ascii?Q?mxPPZh/PzYmpjckHCZGEacTEgwpMc1RYyUeoPE0FGJuoEQkocgQOvmz6I6ba?=
 =?us-ascii?Q?RHPdcT+i1l+7GynX8RqGZeqMdJDeSDq9U20FZxjoPaoeED/JkaI2isJCjiWU?=
 =?us-ascii?Q?3lE5I2HXN6a2E496DPnG+nIhO0HSGqQY4puhQl7xtAayjdU7zw0y6iC6Xkx0?=
 =?us-ascii?Q?UDQbJd1hvqcEqUjfl1kiq89/rpuzFm4CFLpkmKO40xGhYjpOTP++1cgsgFDo?=
 =?us-ascii?Q?/0WxvVMADByACuStxdnAyNNPkVgf5UQlKlZxWLEP1Ps0Ck+FEl9Ariho55BK?=
 =?us-ascii?Q?xI9px6m50J8W5OFZUa8Ed3I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b327ba-cebf-4e1b-b7b4-08dbb8032b41
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 04:53:15.4507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: am0uZ6lnSZOPwoW3/qCm/3JDuefCuCF48v9nMUpYjKLj3rPrGDCOgygOFWzawd/EEy2ECWl26Wt4cjrV25HJbmZN89yeyT1C+qhfRk5cyaq7BajBbuk9nCsj3uEW3392
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8577
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/4] drm/xe: Rename
 exec_queue_kill_compute to xe_vm_remove_compute_exec_queue
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

On Fri, Sep 15, 2023 at 04:34:44PM -0700, Matthew Brost wrote:
>Much better name and aligns with xe_vm_add_compute_exec_queue. As part
>of the rename, move the implementation from xe_exec_queue.c to xe_vm.c.
>
>Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue.c | 20 ++------------------
> drivers/gpu/drm/xe/xe_vm.c         | 21 +++++++++++++++++++++
> drivers/gpu/drm/xe/xe_vm.h         |  1 +
> 3 files changed, 24 insertions(+), 18 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 93d2f0591c34..b95b62a2538f 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -775,22 +775,6 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
> 	return ret;
> }
>
>-static void exec_queue_kill_compute(struct xe_exec_queue *q)
>-{
>-	if (!xe_vm_in_compute_mode(q->vm))
>-		return;
>-
>-	down_write(&q->vm->lock);
>-	list_del(&q->compute.link);
>-	--q->vm->preempt.num_exec_queues;
>-	if (q->compute.pfence) {
>-		dma_fence_enable_sw_signaling(q->compute.pfence);
>-		dma_fence_put(q->compute.pfence);
>-		q->compute.pfence = NULL;
>-	}
>-	up_write(&q->vm->lock);
>-}
>-
> /**
>  * xe_exec_queue_is_lr() - Whether an exec_queue is long-running
>  * @q: The exec_queue
>@@ -861,11 +845,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
> 	list_for_each_entry_safe(eq, next, &eq->multi_gt_list,
> 				 multi_gt_link) {
> 		q->ops->kill(eq);
>-		exec_queue_kill_compute(eq);
>+		xe_vm_remove_compute_exec_queue(q->vm, eq);
> 	}
>
> 	q->ops->kill(q);
>-	exec_queue_kill_compute(q);
>+	xe_vm_remove_compute_exec_queue(q->vm, q);
> }
>
> int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 03ee6993e7c7..433bdfae6759 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -380,6 +380,27 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
> 	return err;
> }
>
>+/**
>+ * xe_vm_remove_compute_exec_queue() - Remove compute exec queue from VM
>+ * @vm: The VM.
>+ * @q: The exec_queue
>+ */
>+void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)

Actually wonder if we need 'vm' as input param here as we can always use q->vm.
If we do keep it, it will force use to assert 'vm == q->vm' here, so probably
better remove it.
In either case,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana

>+{
>+	if (!xe_vm_in_compute_mode(vm))
>+		return;
>+
>+	down_write(&vm->lock);
>+	list_del(&q->compute.link);
>+	--vm->preempt.num_exec_queues;
>+	if (q->compute.pfence) {
>+		dma_fence_enable_sw_signaling(q->compute.pfence);
>+		dma_fence_put(q->compute.pfence);
>+		q->compute.pfence = NULL;
>+	}
>+	up_write(&vm->lock);
>+}
>+
> /**
>  * __xe_vm_userptr_needs_repin() - Check whether the VM does have userptrs
>  * that need repinning.
>diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>index 5608e4e33169..813328ad3f7f 100644
>--- a/drivers/gpu/drm/xe/xe_vm.h
>+++ b/drivers/gpu/drm/xe/xe_vm.h
>@@ -168,6 +168,7 @@ static inline bool xe_vm_no_dma_fences(struct xe_vm *vm)
> }
>
> int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
>+void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
>
> int xe_vm_userptr_pin(struct xe_vm *vm);
>
>-- 
>2.34.1
>
