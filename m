Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843BEEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 20:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489CA10E685;
	Fri, 16 Jun 2023 20:40:05 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AF210E685
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 20:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686948004; x=1718484004;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UiCfYMqBXnnoqfkCrpCyMyKBI+Tgwkw+lbGvAoVJTac=;
 b=YX0sGLD0Nsm1O4pdTy3BS/3Y/AyhVJqv42WOiH0rVbDz85mYiz3S8kD0
 4J+I86DYP0ddoEXK0YA8/ptjZ/SBZgKWMpYlZtWH859vyY8yHO+qdhYfB
 fGm9qx4LNIOeQuBjY42wmGk5LS4pkjjP4jTvYOG5BTCAKVeAbq7Z5QGCH
 3kLZ90NG/5hXfyX8qcozfgizB5YnZiSiB3whS+8DYU4Ddj55W/rH4+x9c
 oCOGWPnhc653bDZyQoXMnp0zJfiHcqGc8lwWiXRhqnYG9m8lAVd69cE5g
 lEZ4MhJ7KqSKfyWEWWt50JQNvKK1lhSxdu6IZBiM2TzL3FzMBpNCfyjFe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="339640853"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="339640853"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 13:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="1043214596"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="1043214596"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 16 Jun 2023 13:40:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 13:40:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 13:40:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 13:40:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaJz0F2C+/m1KI8VqHPzqFXhsmuVK22HJUOnvlacNsCJhqwIQH61HoCC+Etr/RKJwCe95y350ZfIki7yXOHxGUX8CijIXXb9TkW6j009tnHbN5uQjDIlo6QL43IbMBUWR5+w1aT8OU+uHiWHhNUwVBnQ4R4NugkXDzPBblFF0bky+qjiCr7IOdCYUSOvn7e7u261UctQf0kvm5a5TV8OkMqTFgOI3Ngkfxj06jJ49ydaAiBNzAcBPgcBl7QbofmMmcPGisLNIYJmIZxm+JpLCotIw82ipEL3BGKEAF7q542p+wW7glpFtnHWh7aJ08T9HVEEMISg54mdEtSv1kEGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiGRDf9a7bEo+AU00EUcGhLQE7Z6b63MEQCppDlbwYU=;
 b=R/KHFWCwWj8za3wHhTJ6C2BV7YDoS2ROAU//nM85VGveSwVhe+4HNATcTomlhFFzc/esGH64xbNmOQ8tFgFLEkLcBZyneLTKifSwmmAPEPzjeTdvEj2O7PlAfTheOCtt8C6MwCDzQiStMjYFzq+MYpYYPVMf6ZH1fT3nK0lZtmL3nA9DKUMuqwriiRGSFYaXFtrC/8j8SPdcHMqwQ7x9k26acwuXorxWp8Q6Wc+sZEETAq0GcCMPEqMZISHJhf3/iQ7YO5IwDqXpXCA675lqm12ZU/dn0JMpyirRvA8W24YJF1JC2RDraIxsUEwTblC6LYtvifXhvdjzhvDLXNzNmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BL1PR11MB5555.namprd11.prod.outlook.com (2603:10b6:208:317::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 20:39:59 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6500.026; Fri, 16 Jun 2023
 20:39:59 +0000
Date: Fri, 16 Jun 2023 13:39:56 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZIzInHB8NmkuwWd8@nvishwa1-DESK>
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
 <20230615141933.2865583-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230615141933.2865583-3-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR16CA0023.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::36) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BL1PR11MB5555:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb121ef-ba15-4be7-05bf-08db6ea9da52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eOgJ0FkE5gQ2chXzGeXhMcXXe8ar09JYv7+2ZmetSFT7R6K/NA5mioQ3LxQK0RGNaIvV3zAz7wvdt8EoULEaZme6xUhy4DekGr+qate2c1Fm0lIVPdxrIzCqkG7JGX1+rnPvb+oJNiKP1p05YRJyfNQNcFFnM/ZL3gf/uJopAuiPm2PUMuCND1N1LkkXuN2daIOkvpNbZRn/IDvAzie+aCHgLTU2rsSCZFygXBEFHOmT9GpqtS77HVt1R9eXciNPYLHUDmefa3RGAeNRVLu4iFsxi/Bn+fLqhQJ9j9skixKi7Xb3BRa2F554Xb7Vhfl0wPTRQHXU4w0cxNqjFQNT5WB3imxYpuJrZe2IiqtkA3zDsX+sS4eVqJoI/k8G/ITYCVlW8dbKnzEjKJNH9PYSHufM+wlizPgO636rrPaLixJqXT4x2llcAkr5t/TGXltk7T4GvcRhH2ya/aO6JrnKHOW7A9q/++Tijp3uELMjFgkmQw/AhtzwOL4iOD0sPrlF71vC6P/8nduxIX8l9ZYL324oGv074oDVwyfwA3n+DStVUElkP+HSXIiv0OboblEc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(38100700002)(86362001)(478600001)(33716001)(8676002)(8936002)(41300700001)(6486002)(82960400001)(6636002)(4326008)(54906003)(6666004)(316002)(6862004)(107886003)(5660300002)(44832011)(6506007)(66899021)(6512007)(186003)(26005)(9686003)(2906002)(66476007)(66946007)(66556008)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uSFc1kz31eXUBQHQFcW6tcutwHuRX8RoyEXr/RyBIAecZ5hCFLLB+CQP9y/R?=
 =?us-ascii?Q?+2WnEDUnQJPihXp19tL0NElTEjO5edN23w0/bw+93EVvxrIKHxQ9wyL0nd5J?=
 =?us-ascii?Q?H6bPeLPYKdTeRNLd5Cak7iPPEul+6EAj3bnmGR4cHGICCIE1jADst0xyn0yi?=
 =?us-ascii?Q?oi3wvvqAQ0X+gMD8KA4/iNEG6y3wD+7lNVTFcD1ARib42rHyDFw+/kWh6lZN?=
 =?us-ascii?Q?6yEPN9V4+Y5VaIggBJJHXvYGPWekMRItnitiCOytapJ+Y26KfEm48wgZE1zb?=
 =?us-ascii?Q?UlyMLAFcBSX2lJg60VSg1pfixZDzGxA+ZlCbxoxHlQB2S2Fzfry6IHoE6Khp?=
 =?us-ascii?Q?EjxXnijoTA3tNdcoL+WFuK/uTpwk9KIbsxJqLlKpeb7qYfWxEAIR01My0Qk9?=
 =?us-ascii?Q?YVIgLIhvi/DL5B4nEEHHgS1bmaD/2hZQPl5zaMXofc1xl5w1aJ5VwLE+4l5R?=
 =?us-ascii?Q?v/e6x41frCVb2rviGg/38fmaTf6jRXnUZC26rhl4yXynsveI+fYhLeP9AdGm?=
 =?us-ascii?Q?EqDc3R56GI/RFpxwV89w1qQZjNvVg+Yoyi1eDG7C+TrUMHGTdAW+FMQK5J8e?=
 =?us-ascii?Q?Fe62M66Yq1YKfi7K+dGtROF2EYTjAmrK7ewYkFc3Rs3c6fOqV5dqgXMziOec?=
 =?us-ascii?Q?A64upWVfPoA1uSUe5Y4m7xLJ5K5o9jbQy/eqRz2bl/cgypsQ5+h3h+Od297W?=
 =?us-ascii?Q?IyJK7QCAYqd0s90lfOozjjtjGjh/5kAs5Zv4t0Soy0sBta/v0cVJKNCiqusB?=
 =?us-ascii?Q?rcPhFs19HLECqcU5/qNrObTdIhiVi0QhQLv/Jw9jGpTZ8tWPsy3Fr3VF8c/y?=
 =?us-ascii?Q?7R2JTIP8ndxysDFBgAmp6pAqumqakQPiWjL9W/Q6PEB7xkBHqvRMm9RO/MuX?=
 =?us-ascii?Q?PsCIqs4Z/JC8uvUrjfIq/FfrV8BTEoY5loXr4TkRCHUGSRbyJsCj2pZtU5J8?=
 =?us-ascii?Q?ci0RxvXoLtzgzi2P//B2EmaJ0rBs5VOSj5LHw/EyaBhIoAJIvuOoExL48Vz+?=
 =?us-ascii?Q?9eEztuL+D2Op6H4V51NIycAx+GyHmfV3vQpyAMLPrxo+SIv52NibbLd0rcIF?=
 =?us-ascii?Q?nEiqGIcCQUKe9Gk2wE2joNg8ckkJzVaMrz5ZWGENHorXWrjoKY+hPLlK71hS?=
 =?us-ascii?Q?bNaBjMx7aMFIwMnZA6A2YbpvsiJSJ15UgEOezx42gVD2kp18xDUSSISMiO6S?=
 =?us-ascii?Q?OdrBH5RWaGDgoIZhf9D9/7pz7OnDmtKJMqAD90soqzvieJwLxGkRMJvnyUdd?=
 =?us-ascii?Q?u4LYu1xlyw0M85zmqzBBl9T1G4t95G3njXCExySVTUEol8Dq/Lf0EDwLxhW0?=
 =?us-ascii?Q?60M4/gscUElKc0+V1xi9gKE1koWq2OySvMYkMh/E8hjJ1/t6NToEEQ4AS+BN?=
 =?us-ascii?Q?qyNICNw10muAJpOjhWyYluId16o/54dEhqpg7ruCpaPN58sY9gQCUGTQdNTU?=
 =?us-ascii?Q?3hkexvJkhNrBV0BunkJMnW7RgcjjAkeO3pyhG7zLm8zc5gYWBlY7UdvUAuIe?=
 =?us-ascii?Q?lGNEOST2r5uVhp3Kd2wezNXp/5XvufprBg9ZE0HdTJrxoingzijKe5mcvP+y?=
 =?us-ascii?Q?UFuLPaJy3kOYIOSoDdK2xxx373welrIR/Pqpjg/mm42aQYvVmf7nV6LM3dwu?=
 =?us-ascii?Q?A3HUKN8sF98qiGXsyt9xfmw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb121ef-ba15-4be7-05bf-08db6ea9da52
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 20:39:59.5773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDTfLvNYBICcDIwQ3f8bUkZj33AHn9/PLOjTD3l02ct/tNSDait40ZXeHJamFkkTgtHeyiaXq04YPZKUFp2yJlL9qFttkPnQicE1AGYyo3HpTCMr6qxuV0JwXVJtT435
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5555
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: Add sysfs for default engine
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

On Thu, Jun 15, 2023 at 07:49:29PM +0530, Tejas Upadhyay wrote:
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
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_engine.c          |  4 +-
> drivers/gpu/drm/xe/xe_gt_sysfs.c        | 94 +++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_gt_sysfs.h        |  5 ++
> drivers/gpu/drm/xe/xe_gt_sysfs_types.h  | 13 ++++
> drivers/gpu/drm/xe/xe_guc_submit.c      |  5 +-
> drivers/gpu/drm/xe/xe_hw_engine.c       |  5 ++
> drivers/gpu/drm/xe/xe_hw_engine_types.h | 11 +++
> 7 files changed, 128 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>index b3036c4a8ec3..e72423bc398a 100644
>--- a/drivers/gpu/drm/xe/xe_engine.c
>+++ b/drivers/gpu/drm/xe/xe_engine.c
>@@ -53,8 +53,8 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
> 	INIT_LIST_HEAD(&e->multi_gt_link);
>
> 	/* FIXME: Wire up to configurable default value */
>-	e->sched_props.timeslice_us = 1 * 1000;
>-	e->sched_props.preempt_timeout_us = 640 * 1000;
>+	e->sched_props.timeslice_us = hwe->sched_props.timeslice_us;
>+	e->sched_props.preempt_timeout_us = hwe->sched_props.preempt_timeout_us;
>
> 	if (xe_engine_is_parallel(e)) {
> 		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>index 7528cc723699..72809078bd83 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>@@ -32,22 +32,92 @@ static struct kobj_type kobj_xe_engine_type = {
> 	.sysfs_ops = &kobj_sysfs_ops
> };
>
>-static struct kobject *
>-kobj_xe_engine(struct kobject *parent, char *name)
>+static ssize_t job_timeout_default(struct kobject *kobj,
>+				 struct kobj_attribute *attr, char *buf)
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
>+	err = sysfs_create_file(kobj, &job_timeout_def.attr);
>+	if (err)
>+		goto err_object;
>+
>+	err = sysfs_create_file(kobj, &timeslice_duration_def.attr);
>+	if (err)
>+		goto err_object;
>+
>+	err = sysfs_create_file(kobj, &preempt_timeout_def.attr);
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
>@@ -72,7 +142,7 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
>
> 	for_each_hw_engine(hwe, gt, id) {
> 		char name[MAX_ENGINE_NAME_LEN];
>-		struct kobject *khwe;
>+		struct kobj_hwe *khwe;
>
> 		if ((hwe->class == XE_ENGINE_CLASS_OTHER) ||
> 		    (hwe->class == XE_ENGINE_CLASS_MAX))
>@@ -109,6 +179,18 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
> 			kobject_put(kobj);
> 			return -EINVAL;
> 		}
>+
>+		khwe->hwe = hwe;
>+		hwe->sysfs_hwe = &khwe->base;
>+
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

More on this below.

> #endif	/* _XE_GT_SYSFS_TYPES_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index b209e4c2a3a9..bc0ffcf9fb1c 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1063,13 +1063,16 @@ static int guc_engine_init(struct xe_engine *e)
> 	ge->engine = e;
> 	init_waitqueue_head(&ge->suspend_wait);
>
>-	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
>+	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT :
>+		  e->hwe->sched_props.job_timeout_ms;
> 	err = drm_sched_init(&ge->sched, &drm_sched_ops,
> 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> 			     e->name, gt_to_xe(e->gt)->drm.dev);
> 	if (err)
> 		goto err_free;
>+	/* Record timeout value, in order to show current set timeout */
>+	e->hwe->sched_props.job_timeout_ms = timeout;

But, timeout can be MAX_SCHEDULE_TIMEOUT which can be more than the max defined
in the patch#6 right?

>
> 	sched = &ge->sched;
> 	err = drm_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 68cd793cdfb5..8314429cfa90 100644
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
>index d788e67312b9..406a1e33a05e 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -107,6 +107,17 @@ struct xe_hw_engine {
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
>+	/** @sysfs: sysfs kobject pointing to this hwe */
>+	struct kobject *sysfs_hwe;

Whwere is this sysfs_hwe used?
I wonder whether we really need 'struct kobj_hwe'.
Why can't we just have kobject defined here in the xe_hw_engine sturcture
instead of having a pointer to one. That way we don't need to kzalloc it.

Niranjana

> };
>
> /**
>-- 
>2.25.1
>
