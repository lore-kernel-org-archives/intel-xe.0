Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27254CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 04:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE67E10E0AB;
	Mon, 18 Sep 2023 04:48:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CC010E0AB
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 04:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695012515; x=1726548515;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KbF88fWg+tmD4uGOSVm9xEnnL4xmnipaXVzisf0f7Hg=;
 b=D6ogQZY29THtNQm8WS+1wsNyP4QEWEP9Ys5BoiNk9qvxPALstvr0p1rQ
 yWqLQ7jhCZMgJu/yVltNveeOao5HOolpNXcC1q4kCsw3vl9lTK8cG0BQj
 kVO0VV1+ZkmmjCS0zHx1p7J/tahLO1h1/zEMbEVpmhtRjMJ1JS3h94Ipu
 AW7TLy8XKUc+CFrkECH7T9/E1z+zmeq1wr0UCkcYglqxHpXtWI7S7at1l
 UMC24Gcy1/TDB1HntqtTg81F5iz603noEBJD00S+V3z41GSB0KSv37u1N
 2K9LJseTvZ7QKCxmnFQ74Ev5/U3QIZKHftE8ZsyYypQJLz38XCvb8/17K Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="383386954"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="383386954"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2023 21:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="869426271"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="869426271"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2023 21:48:34 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 17 Sep 2023 21:48:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 17 Sep 2023 21:48:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 17 Sep 2023 21:48:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amCia6n/Wv1ZXALPNuvH4huh0vAlRW4JrgKKaNKYUSnRyMtx8hyGtMV2nXT30T10x95iFe5oX/dcVHY/zmcs8FoWD3bMFqv+gG2QSHH3ibg8kyJSj//UOEbOMSnyXXX4yuPp3OspBCckqqmLJ1KAvsekaugEmGeCzzR1zKrE3zDGab2uSqVf5S1fRck98IZooHygfU5bldC5L7Zi+lP5+ujJxUUSuWiR0LpTaiBC3nywPvioRB6FoX7m1H24sxT4Gws0OkZTb/SSI5Q+sKyIBuVSJaGAiRY5LpKjtMD5UtsuybK7dWOITXw3YagJyRvlHgMSEyVUAaZwXml30EF6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDQgHwRBTWV4cvlLXMmUJFGFuatTXnPekGChL5mBXak=;
 b=W3aeAVS7WaCWE1XDWvKRRVS684dLV3UiRvY/Tt2UKDVKY2e9c2BFNO7zIchi9UUvGt7G5JiZ+5gtnDSkCJGxNs2HrEyl3yVA49HloWj7X7NRekdyUw/QGvCJUIs98psPt3Ge7jTpoGsukmoWY564saWgMX/nVkY9eH2HIeze1zi96OrchEqMb6Ffg+eMD1UAAsQmO3okNqtJbY9bawJtjOWL9hmlqIl8VGcelo5PYaJpiIoGqo7kh/DPYONiPYCbJCftTk3y4EfJcgFNRrda6bvUi1JXmzwmUF9rTDPbSg/gady2/cvMps94wGECO3DBD0jjEmjC4NLgw2ZBOzFgeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by LV3PR11MB8577.namprd11.prod.outlook.com (2603:10b6:408:1b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 04:48:27 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::25ea:ab9f:da46:2ce5%4]) with mapi id 15.20.6792.021; Mon, 18 Sep 2023
 04:48:27 +0000
Date: Sun, 17 Sep 2023 21:48:24 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQfWmLVtSN7XW14W@nvishwa1-DESK>
References: <20230915232021.2241094-1-matthew.brost@intel.com>
 <20230915232021.2241094-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230915232021.2241094-3-matthew.brost@intel.com>
X-ClientProxiedBy: BY5PR17CA0043.namprd17.prod.outlook.com
 (2603:10b6:a03:167::20) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|LV3PR11MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a37d57-20f8-44c3-2024-08dbb8027f59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1AvuT/GQx6vjP5mrTiHURn1GRR+m/TyJgSujPtnsTw8wFlbPJ126gBAKMcl+WMXYExkTXHdjO77rOuAX79LRmskB4YB0JR+1jaeXVnxt7K8XgzWC43HfDlFWfzSXc+9mL4n6MuYpqJtJDXKvbhSePWUOQlpwsdTZ2tRM+trPs3wbgxB9PR+lLldhReTpvmLhDTj/PJBtM2MZYObnoHUZ/tVXFtDarAcmEQTwC5JKkc6l9YBtHnHTFDLPk35T4y/drixQdbDTOIk923NtSFWbJHg+ac21ewaMOfm6FXT3z4vEeVgeTFHKpTy+6g+GrK+uayoPVjo/YfN4LI3VxW4GAa/+BNB20Z9U4Tcgv71+BR2AnZxwF4JQlfRvQlPZGDao5jDGG8qnjifxDO7iJooVN8SmGZxFXAufRNXmpcOlRp5Kh09NcrF/Ytc29twWAFLHT5XdH4haZBN5G08wbio1SgoAvfON3ocSpwCo8ftgDetvFZhNFPIgmPTmLJp8klpx92JJ5Vb7pD+93lyVi1ZV9osAmwUFCT5ovxAUBs6bceDCYAzjuWKQZTViXP1wjnTH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199024)(1800799009)(186009)(6666004)(6506007)(6486002)(86362001)(38100700002)(82960400001)(26005)(2906002)(9686003)(6512007)(83380400001)(478600001)(5660300002)(8676002)(6862004)(4326008)(6636002)(316002)(8936002)(41300700001)(33716001)(44832011)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0KPNvkUDg3I5R7x38YyYq/1m026rX9lcjXhJu/VBE7SWgsb1KrcOEU99We+2?=
 =?us-ascii?Q?KwLjn1qEyqP8Up3CxI9hXMaJjb6dJ85GcIJUL1J3vpS2OStQ/VSKtvsRjwLH?=
 =?us-ascii?Q?K1WrpRf07/imVrUccQ3tJAV/p24PfrR6GIj7/Ahxspwcr/vSQg72ViCyO1ZQ?=
 =?us-ascii?Q?lkwgG+nAVa8V3RniEyZT/TrIvPWNqigj8gwGKN/ZVrOm+qUkp1ke09XDT3o3?=
 =?us-ascii?Q?7BKHQoxbHdwYEmd3XrFQFLhYSlehicnEuiJO8y0JrcEMymoPHM+2vRt3ahTT?=
 =?us-ascii?Q?m04CBsDFO+x5yMkpteSLMniWyRa6P+LTbgGw1ckJXmKu7e+bX2xwAF+9ub33?=
 =?us-ascii?Q?bkzAl5EC9H4rDBj6bqlRzYnsegiVlvJsuagv+WyKVXfzhZ5+soQNdSq8pMH9?=
 =?us-ascii?Q?8G8T2yxSmjcu7L96dHMQ8EXTXHsj2Ckyx+DKnuqzEWONxbwSi0efnhaRoN+P?=
 =?us-ascii?Q?sXUA2DUGB1446wo8dcUrGfPnAtSMyuEaHVrv6qo/+rNFd+ANT6T05pOYMue7?=
 =?us-ascii?Q?LU3oaTMswbmdrstB+ua1JXc/FfbPmrZtd0ZHzMsnODY1QCaV1CWDPGEHJjtJ?=
 =?us-ascii?Q?ZFkX61Tp6mgLU3Byl3YXD2vOp2uvR4WN3Wcb9AAzIX4vz71xEnwMcyBtRU3c?=
 =?us-ascii?Q?sfgTHJfs5BaZem8n2Y+jM6CrV3M2gW/0zT3SmxT7GP00bxEUVho9ZZugajRM?=
 =?us-ascii?Q?SzGKp6Fbh4Jhamt9r2+EuEICZfZwKr2HXq1pAYoKlR8WWsOkU0zT8r3777tf?=
 =?us-ascii?Q?rw0bCCeoRNST+2a8d/M5ed4BGAWIc0KhkwxGZQvlOW6YkLTJiJPSccr6iGCc?=
 =?us-ascii?Q?cVT3o7hCaX50EmisjBM1TJp0V4BRAemsr8n5sjdTnRnk2JeviYLb8dY5vBgO?=
 =?us-ascii?Q?OEBS5bjZtCuFtyNXvX3HumGpuQRbRjSdf1JP7PyFYYS/LRtXbLWGArjaeZLp?=
 =?us-ascii?Q?nFmGFksiUUDqRbv2V3SayPqzP1u5ZMJBa+72rvP7hAW6aOCNab5FuAaMpG0z?=
 =?us-ascii?Q?Tp0Ipvii0TajJUOPDzGstDMIvuOfg3QhcyAfr9Gf1NNarzNqtWXOXIMda86d?=
 =?us-ascii?Q?DWMTp1+67rtY140kARpf5byt2fg6Bp9v0UnoUvwXYeAUHnd0ZSP3dG3Drr26?=
 =?us-ascii?Q?lntvzKlPKZouQSj6jkyu6Qe0kEyrPLckNV8f0poqMjatmyhaVh7+KjNF12z1?=
 =?us-ascii?Q?E7wJf3BAK0Rho0BWIxU7EtemDPe37GPm/kZuyVnXmwoayg7xPZdwuE7kSON8?=
 =?us-ascii?Q?HzYZgIFqK7uUMOPMnUa+QhRvuTALaXpTHekcCfilvZk1MY11r6N5l9P3Htu1?=
 =?us-ascii?Q?a3dqJtYMMcrhlP03cRmgEfYQP5LqGkoUAKzdHOQehy7rwOwNkTC6WH1p2s5d?=
 =?us-ascii?Q?tbvMTJj1N4TfT7TJ4l8f67eieKXHP3a1StL1MX3r+3XDcnA4SMYB/2EOLDb7?=
 =?us-ascii?Q?mGaKNpsATE2Z7Gunkd54g1XerM8KRCSIWu6jGzCpZIkYXA9sNqOHDKo8LsrJ?=
 =?us-ascii?Q?+H6SOPzpdJnPrRBIE+BE3ISJS7n+5atXxGklqvHelrJ3yQKhfbP5q2XAJ9dg?=
 =?us-ascii?Q?V4cmOAhfeGsUKcCMmFlAU68rEx+htnd9jp6jTDzGGGXyEcv3dVPijJPpUUyd?=
 =?us-ascii?Q?Hv4czq0EmDrucDX+tuU9IUo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a37d57-20f8-44c3-2024-08dbb8027f59
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 04:48:27.0043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uY6zN4FmtYpApJCDT1qN1l931nLlgzjyR+/XxxklGJDDXOcGQxSYcmBX/i4zcCwetJ+fPJKb+A7HFdFpISRfoJ9jYXGUurYPlNU3UjuDjX76j3YYOmUDvcDSluaU6EjI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8577
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Rename exec_queue_kill_compute
 to xe_vm_remove_compute_exec_queue
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

On Fri, Sep 15, 2023 at 04:20:21PM -0700, Matthew Brost wrote:
>Much better name and aligns with xe_vm_add_compute_exec_queue. As part
>of the rename, move the implementation from xe_exec_queue.c to xe_vm.c.
>
>Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

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
