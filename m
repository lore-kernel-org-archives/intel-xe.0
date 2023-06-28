Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B8FEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 20:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A97010E068;
	Wed, 28 Jun 2023 20:30:02 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269CD10E068
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 20:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687984200; x=1719520200;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vBwPJLKC2haSnV5nVcS+93y9zD+HcZC5d+NNBSa8uPQ=;
 b=FBkEfAnBhcwZzbzYmKF4ez6oqshww46jx6rwje3jvjsQpcNckzJpYOB0
 Ne7BMqEGh264o1jaiheoAVh9lCL51tJizRkfvJSSdtCUFT/k3IOiOlWA+
 UaJwOeNP/mj32NOeyObhYvWAo01t7uZQ4GcGX1Ql4oOUn1WD2VzuvgxE1
 VjIZ3d+R64FWrvYKcsSSVIecWZCulgQ9TDh3MvZR3dqV0UqK/xIELjtRq
 8XA15N/Rz25ufrhqyWq8c5TPDvJeAyi10eaIwtveIC+ddY2FmHnTuVV1E
 yPe0Nlo1zRVWkA0M11uhyyQXpGF8iAfgMLtPIQtyxBqwE/wbF0OXpdBAq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="346721667"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="346721667"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 13:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="963742136"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="963742136"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jun 2023 13:29:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 13:29:53 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 13:29:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 13:29:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 13:29:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGeC+2tIZnM5m+SlkQlqO5MU6BQJy6DrEJo2pAugkwTUszGs1iURIqvgdpJvp+d/hPGcSeX41XvsVC7cUc3OHU+4fZeWv9AYCLoYR1rqPWR76bmWR6ThNbt2/wzpBFpTbQlJ2vvWWidXLnvo4yv2PM8ro3WhrSkGAcp4pSRcLE5mw6GiPrNQ0ugg9u3H+ReOqaQYSY7GbtRJGZI2B18FRamOp3J8lrvkibMVvq1P+ssjO8iUrfapc/VyzN+gTpqY3l3EH6EHpJsI3qfU2En8IPTiLu3zHHBmJoDMTshmuX2mcwlV9kKL4t53Gq0kYu1wLpfKFgsjxQFWXWj2jpxZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42OR00YJDasdHY0gA1jw00K3PpKxnYvL3snWFayseEI=;
 b=O1EESR4o/89x0KwSuVNG5TY6kWr1Wtx8JFgoXLXJg+AFjdMiVO9mBX2r+2VSSiDvOZ566D6vVVqKIJEOzaJhLtFheH+dUpfTGZ9U7EaUcJYjRSjx/Q72cuJKzpwy/UKGOjssZL4K5yXkMS3GRlBl8R9nb5iVYvt0Rykj33m2ZKyhCqMxdYSsbdZNCTX2aMr1PQVw+CWPxoDtyEJvubV1TOKDLC1xtqyErTChbuJkQAfYjFwM3Tqa9bFOjmmPiYOlwqD/BmwL7tsfYuV8dEhJMQH7TqyXsRvD1epwA7wOtKu74w5XAX3VBKN0f0CoOYjjwOLBFYw53LxkhslkQQ76wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 20:29:51 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 20:29:51 +0000
Date: Wed, 28 Jun 2023 13:29:47 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZJyYOxoB4imTrQsV@nvishwa1-DESK>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
 <20230628114732.3598169-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230628114732.3598169-3-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::23) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA1PR11MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: e990c797-b3de-4947-81a6-08db78166c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LxlEY6i9fzaFnG0bwXsmCZ7sOeoHnQ6NQhAZo93TEtnm2My22klozyU7+n21ZWM/x14NrSSBibt6HOz6dqxSRDRLq/RYyyBj3uE5Spt2tueYn+o9CuBWVYpKXiSidfXzaI8lAYcpirMAEqV+BJ3WzwcPQFoDGPMe3eLzajip3Z/qgYbdKf4+Bo0ZX47+wq2RmwHYyNuGCIPapeqDYrMuMYOL1krflQp6F+qMXQa/gxXBlqg3IIAaQKvMHt26Yknug90JakBhDSejj3I32qh8nrYuFXh3DHY3J6iRnP3q0CwG6vM+J21m9ervB19m/kMwW8zF2yNMeUbv5jQuSBsfnCFz7X61LqgzcgROJ4Q7WEEtW0QJ4BbRB/KAH95e8/h1fl3FHHvlDLO14Rs7781c1LCBqYTdxuSV9driTqkB77VcTwqnL047xA3vosDv2qUHo1wYNxVfyj/wz57y1z1Ixx4euRkc9VXdDF03mPYyIbAcGN4YWglOBJzzA8n7sonxBLszKW3RK3wsVgn1PUDlFP7HPhFTqxxfqaIEsenu8WPMvilueFG6TxaTarzZ1E9I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(26005)(6506007)(6666004)(83380400001)(6486002)(478600001)(6512007)(2906002)(9686003)(186003)(66556008)(33716001)(5660300002)(41300700001)(6862004)(44832011)(66946007)(4326008)(316002)(82960400001)(6636002)(38100700002)(8936002)(66476007)(86362001)(8676002)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ed7J3YgoVAnLuzA005ciO2U0PR4uG7GEAAkS21RzWxTnxGrMI4h5yJgUEXDA?=
 =?us-ascii?Q?498OWAUko2eziDRZdoNI2UZ/1v2moNNYfexbmI9LSM2GYxtV2CHK5PCxWvhT?=
 =?us-ascii?Q?t9UtpKjtWs0VzRrqrqwJf/U8wnFzOJ/igrzVkB4yignRt9rdcUi4ZpQg7pU4?=
 =?us-ascii?Q?XxepI0NZWT9jFYX6aQzbQ2PTb9NjB+nKDZV4R7pzi87uz2+RrAu1siEBABvu?=
 =?us-ascii?Q?6nEASd7NUgv+WUoMVmWI5Krq9QwflcF+OyiZ9KEzlEg+iFd2Xngml961iwVx?=
 =?us-ascii?Q?FPh9Tz7J5LL4cVF0W/yzT6Dc+vbL5Ocixhc+mKZ/39l8+LkytIfm19WyBPqG?=
 =?us-ascii?Q?4dBEDIatVZcLK4utOjGh1GNNMSWzxcAQSUKw5rLvIK6SXUmxBSx3RbpiAjaO?=
 =?us-ascii?Q?DUWNTfqx8QohtlzpAzevmzDdPiIrdWW2zcHDudm1tA3ca168rR3TCCW7yxXX?=
 =?us-ascii?Q?yGrKlyjDj96F3iZ84XNeBbTHXh1CGtA/yRBShMvQBUHFtNpjFQC8JEGvUDtf?=
 =?us-ascii?Q?WpFZDTSS3FtcLr83guY2Omy+ik6jGuxJG36QSEmiXCTCpYOVmXgoQdA75geI?=
 =?us-ascii?Q?AvhXGm5fJx9HMcJGyRD0kCRtYPZ7bM0NQVikgMty8I/8O0RPTbPa3eItnump?=
 =?us-ascii?Q?9+GeNbFMrl85j+ejQJRvW6KlZzJc5lkfZdTZlAgtLG8vD2eGk+Vpq113/HOk?=
 =?us-ascii?Q?D/Pg45WXgRUO4TGJsxVDm1AjAjqSmjp7QNK0dIE+Nj3YCphsIzccZjM7fbtB?=
 =?us-ascii?Q?nWH3a9ZQMzyUoywiBtSaXXYlkRM2BwI4erEVXst0IT9zuPNiDcrKoq6gcgOf?=
 =?us-ascii?Q?oD6wZBjwJ2laheCrWVPuPJcslnZ23cxocPwrAVljGAzUGK45wRrW6MkvBMzF?=
 =?us-ascii?Q?2GDWOL+TcAie917zD1pW/W4uvCrFV+Xk7S76Nr91DuvsPlogAbJKWi4ARpye?=
 =?us-ascii?Q?+W02flLpfYojr9SmvvCy//G/kLW+rcaK3ZjlBx39mMryViqHr8v6S/OtvIF4?=
 =?us-ascii?Q?f6RsUzabLIonFd6RNsj+FcMekcllD6OiG59YrAv+QgvDu2bCihAKzax5IwxJ?=
 =?us-ascii?Q?6uOj+kXrY1+zmX1Wh6tuDvkO4hEWLbG6/9fV0Sib5sc23pG592kDNsjFp3pR?=
 =?us-ascii?Q?3O9v9TJgxt4kTieqLsfTS8K7fVAieQBwpaQ/NoJNp7ltsUwrkPYkn1prrAv2?=
 =?us-ascii?Q?ESMm8q4l0O1vrWW3Gr6dhMuKh2ck4V8q9xc1jp1HidnpYpVgpjNMFasA/xnb?=
 =?us-ascii?Q?nyETrL/ctVMH1t63PQykrokXDZrCXZiLYv4r5APuVqBuu5VTeW929Ky21+TZ?=
 =?us-ascii?Q?agDVebDHjjlVkDmGOBYeOiABYal+gOU7DIUjvqjqQESENlO7pmBkCIcvYvIn?=
 =?us-ascii?Q?5AeZsjuZGkBMeam/dSUj/p4Hr7ZQSVmBHBxBkFuROY1fA+LyIGd/GmBnOpfq?=
 =?us-ascii?Q?Pn83HBUte+fJBuUv8crgtjTnJBGiMkAbygSU1G8TZpZ2Pa5YsvovYEeSrSAY?=
 =?us-ascii?Q?eLhg0PHoB6/RvmOkqbR4y/xZPefWSA9OfETcWAvjkAbSywPEwApcshYYOV+w?=
 =?us-ascii?Q?pudaK4F5061TxwYd96jpwcK6EI/iEzr919YicB3qmHgZCzqIyIsMhMNDOLN6?=
 =?us-ascii?Q?lkb7ZoC5/tORzSmL/2TIVWw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e990c797-b3de-4947-81a6-08db78166c2d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 20:29:50.6706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2b/Dcv+8PnJ85rN9Z9qIEa8Dn9cXRZqLZqUHoUlhC7vKi+ho0Dc7VtUMwk0MNUPm/NzNjWXN2Si9a6g+7xOdfMqByeKddnQMcDOr1fEvyBs2EtS8AGEKdTHiMl2gwHw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8427
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 2/6] drm/xe: Add sysfs for default engine
 scheduler properties
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

On Wed, Jun 28, 2023 at 05:17:28PM +0530, Tejas Upadhyay wrote:
>For each HW engine under GT we are adding defaults sysfs
>entry to list all engine scheduler properties and its
>default values. So that it will be easier for user to
>fetch default values of these properties anytime to go
>back to default.
>
>For example,
>DUT# cat /sys/class/drm/card1/device/gt0/engines/bcs/.defaults/
>job_timeout_ms         preempt_timeout_us     timeslice_duration_us
>
>where,
>@job_timeout_ms: The time after which a job is removed from the scheduler.
>@preempt_timeout_us: How long to wait (in microseconds) for a preemption
>                     event to occur when submitting a new context.
>@timeslice_duration_us: Each context is scheduled for execution for the
>                        timeslice duration, before switching to the next
>                        context.
>
>V2 :
>   - Use sysfs_create_files in this patch - Niranjana
>   - Handle prototype error for xe_add_engine_defaults - CI hooks
>   - Remove unused member sysfs_hwe - Niranjana
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_engine.c          |  4 +-
> drivers/gpu/drm/xe/xe_gt_sysfs.c        | 93 +++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_gt_sysfs.h        |  5 ++
> drivers/gpu/drm/xe/xe_gt_sysfs_types.h  | 13 ++++
> drivers/gpu/drm/xe/xe_guc_submit.c      |  5 +-
> drivers/gpu/drm/xe/xe_hw_engine.c       |  5 ++
> drivers/gpu/drm/xe/xe_hw_engine_types.h |  9 +++
> 7 files changed, 125 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>index 6e6b2913f766..33d1fbae560d 100644
>--- a/drivers/gpu/drm/xe/xe_engine.c
>+++ b/drivers/gpu/drm/xe/xe_engine.c
>@@ -54,8 +54,8 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
> 	INIT_LIST_HEAD(&e->multi_gt_link);
>
> 	/* FIXME: Wire up to configurable default value */
>-	e->sched_props.timeslice_us = 1 * 1000;
>-	e->sched_props.preempt_timeout_us = 640 * 1000;
>+	e->sched_props.timeslice_us = hwe->sched_props.timeslice_us;
>+	e->sched_props.preempt_timeout_us = hwe->sched_props.preempt_timeout_us;
>

Shouldn't we be setting job_timeout_ms also here?

> 	if (xe_engine_is_parallel(e)) {
> 		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>index 76bb6441e9c8..5f534f325823 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>@@ -12,6 +12,8 @@
>
> #include "xe_gt.h"
>
>+int xe_add_engine_defaults(struct kobject *parent);
>+
> static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
> {
> 	kfree(kobj);
>@@ -32,22 +34,91 @@ static const struct kobj_type kobj_xe_engine_type = {
> 	.sysfs_ops = &kobj_sysfs_ops
> };
>
>-static struct kobject *
>-kobj_xe_engine(struct kobject *parent, char *name)
>+static ssize_t job_timeout_default(struct kobject *kobj,
>+				   struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms);
>+}
>+
>+static struct kobj_attribute job_timeout_def =
>+__ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>+
>+static ssize_t timeslice_default(struct kobject *kobj,
>+				 struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_us);
>+}
>+
>+static struct kobj_attribute timeslice_duration_def =
>+__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>+
>+static ssize_t preempt_timeout_default(struct kobject *kobj,
>+				       struct kobj_attribute *attr,
>+				       char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_us);
>+}
>+
>+static struct kobj_attribute preempt_timeout_def =
>+__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>+
>+static const struct attribute *defaults[] = {
>+	&job_timeout_def.attr,
>+	&timeslice_duration_def.attr,
>+	&preempt_timeout_def.attr,
>+	NULL
>+};
>+
>+int xe_add_engine_defaults(struct kobject *parent)
> {
> 	struct kobject *kobj;
>+	int err = 0;
>
> 	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
> 	if (!kobj)
>-		return NULL;
>+		return -ENOMEM;
>
> 	kobject_init(kobj, &kobj_xe_engine_type);
>-	if (kobject_add(kobj, parent, "%s", name)) {
>+
>+	err = kobject_add(kobj, parent, "%s", ".defaults");
>+	if (err)
>+		goto err_object;
>+
>+	err = sysfs_create_files(kobj, defaults);
>+	if (err)
>+		goto err_object;
>+
>+	if (0) {
>+err_object:
> 		kobject_put(kobj);
>+		return err;
>+	}
>+
>+	return err;
>+}
>+
>+static struct kobj_hwe *
>+kobj_xe_engine(struct kobject *parent, char *name)
>+{
>+	struct kobj_hwe *khwe;
>+
>+	khwe = kzalloc(sizeof(*khwe), GFP_KERNEL);
>+	if (!khwe)
>+		return NULL;
>+
>+	kobject_init(&khwe->base, &kobj_xe_engine_type);
>+	if (kobject_add(&khwe->base, parent, "%s", name)) {
>+		kobject_put(&khwe->base);
> 		return NULL;
> 	}
>
>-	return kobj;
>+	return khwe;
> }
>
> int xe_gt_sysfs_engines(struct xe_gt *gt)
>@@ -72,7 +143,7 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
>
> 	for_each_hw_engine(hwe, gt, id) {
> 		char name[MAX_ENGINE_NAME_LEN];
>-		struct kobject *khwe;
>+		struct kobj_hwe *khwe;
>
> 		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
> 		    hwe->class == XE_ENGINE_CLASS_MAX)
>@@ -109,6 +180,16 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
> 			kobject_put(kobj);
> 			return -EINVAL;
> 		}
>+
>+		khwe->hwe = hwe;
>+		err = xe_add_engine_defaults(&khwe->base);
>+		if (err) {
>+			kobject_put(kobj);
>+			drm_warn(&gt_to_xe(gt)->drm,
>+				 "Warning: adding .defaults to engines failed!, err: %d\n",
>+				 err);
>+			return err;
>+		}
> 	}
>
> 	return err;
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>index a531aebd10d6..a539cf031c7d 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>@@ -19,4 +19,9 @@ kobj_to_gt(struct kobject *kobj)
> 	return container_of(kobj, struct kobj_gt, base)->gt;
> }
>
>+static inline struct xe_hw_engine *kobj_to_hwe(struct kobject *kobj)
>+{
>+	return container_of(kobj, struct kobj_hwe, base)->hwe;
>+}
>+
> #endif /* _XE_GT_SYSFS_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
>index d3bc6b83360f..d0a5eae1bbb4 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
>@@ -23,4 +23,17 @@ struct kobj_gt {
> 	struct xe_gt *gt;
> };
>
>+/**
>+ * struct kobj_hwe - A hwe's kobject struct that connects the kobject and the
>+ * hwe.
>+ *
>+ * When dealing with multiple hwe, this struct helps to understand which hwe
>+ * needs to be addressed on a given sysfs call.
>+ */
>+struct kobj_hwe {
>+	/** @base: The actual kobject */
>+	struct kobject base;
>+	/** @hwe: A pointer to the hwe itself */
>+	struct xe_hw_engine *hwe;
>+};
> #endif	/* _XE_GT_SYSFS_TYPES_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 86c445903560..ecea38e9e639 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1128,7 +1128,8 @@ static int guc_engine_init(struct xe_engine *e)
> 	ge->engine = e;
> 	init_waitqueue_head(&ge->suspend_wait);
>
>-	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
>+	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT :
>+		  e->hwe->sched_props.job_timeout_ms;
> 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
> 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
>@@ -1136,6 +1137,8 @@ static int guc_engine_init(struct xe_engine *e)
> 			     gt_to_xe(e->gt)->drm.dev);
> 	if (err)
> 		goto err_free;
>+	/* Record timeout value, in order to show current set timeout */
>+	e->hwe->sched_props.job_timeout_ms = timeout;

Do you mean to set "e->sched_props.job_timeout_ms" here?
Updating hwe's property based on e's property doesn't look correct to me.

Niranjana

>
> 	sched = &ge->sched;
> 	err = drm_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index b7b02c96e998..bd94155a28b3 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -361,6 +361,11 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> 	hwe->name = info->name;
> 	hwe->fence_irq = &gt->fence_irq[info->class];
> 	hwe->engine_id = id;
>+	/* FIXME: Wire up to configurable default value */
>+	hwe->sched_props.job_timeout_ms = HZ * 5;
>+	hwe->sched_props.timeslice_us = 1 * 1000;
>+	hwe->sched_props.preempt_timeout_us = 640 * 1000;
>+	hwe->defaults = hwe->sched_props; /* Record default props */
>
> 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> 	xe_wa_process_engine(hwe);
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>index d788e67312b9..7a8d275df6db 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -107,6 +107,15 @@ struct xe_hw_engine {
> 	void (*irq_handler)(struct xe_hw_engine *, u16);
> 	/** @engine_id: id  for this hw engine */
> 	enum xe_hw_engine_id engine_id;
>+	/** @sched_props: scheduling properties */
>+	struct {
>+		/** @set_job_timeout: Set job timeout in ms for engine */
>+		u32 job_timeout_ms;
>+		/** @timeslice_us: timeslice period in micro-seconds */
>+		u32 timeslice_us;
>+		/** @preempt_timeout_us: preemption timeout in micro-seconds */
>+		u32 preempt_timeout_us;
>+	} sched_props, defaults;
> };
>
> /**
>-- 
>2.25.1
>
