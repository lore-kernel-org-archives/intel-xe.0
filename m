Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F30DEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 19:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E7010E604;
	Thu, 20 Jul 2023 19:29:16 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F9810E604
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 19:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689881354; x=1721417354;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9xbtj4HvYFNwrG7fNTfvdSQHN6EtkDwDOJZ2Ar+aOKA=;
 b=RGlQvmZ/A9DYUcOTi6hi2q/7GYknKZAdnX6ulroaSkIU5WIqobSQa5/n
 TK22WY8J4glvAJ7N6FVbo8nyXpZPbGFMaGwhXZrkTNFE+dN4OFK0kn4Ts
 D6NKw7GS6DCtYxjfYrcO8pB+PUNOpuBQDK2rpQze81TcCcJX4l1Xo4b53
 0hOD67BXeZIKZ9qcNqHjQ5icVY7+Jou/T/NShCE34yObJ0/TmczIIbMbn
 z/DvuXp+Yi3Rz2UWs7Qav6D/WNOjWOHldih5S9A4BnOWedoMDCXVGzgpn
 xAGFzyQpaNVYePT4pcTu4l6XL3UDWa33jWhVYgBZsjbR1xTF/SD4QwXm7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="369516753"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="369516753"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 12:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="718549251"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="718549251"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 20 Jul 2023 12:29:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 12:29:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 12:29:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 12:29:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 12:29:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TO9uqmS+mBIYFl8AjmuwFpYoHqPj5CsrXUvAvWZhfDgpisR2zsPRzgrB18RA8Brfi56AukSJu83krnQEVlbQ8nc98vzJI7bvR+ItD4p0CFjhRU6YeEVJKjrgLM9BwboqMo2QMyb1Um23iuNDEP3LkMFcu2jSulJzMOFkRhqDXdvFVW/PpZPRJ94PGE/FR8CQ9seuHWacri2G7zbU7uUirPBQZwT/r7Uo7+gUOeLVyxKksIe2/i/xSOyvsf7QoH46DLvx7MGlQ5uHg0lHSE0r2viVCBU7NTEX3V/8x+cAoTC7jwDBDt0PGWLywxz/Z5ZPK4ju3JFaeIb9gVPJS21bUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5uStTgy4m1TrooWYcIL+YL3YXU6kyU6pd2caoYMzrU=;
 b=lQlkKcNav1WLZUxmuP+/0NWPs0u9owMi4nL6VSuESZ/HFnQX2dpJxHPfj+oe5leO11RvE0esVa/MQW07TXSrDS4hIY5u8nlj/RPVrErbcgDI7XOwc8w8DhHYPOISfFZF7fLPL16/WiP7nq+GP0JwVX2/Nme1BBQncJz2C9WsRZVoUPFpDI5zCTEOTMaUX+RarZaPZPbRwtv+c5N9i5OYJa7/binknUo7ArGc3Brp1hEnC96X/8nU0v0uCeyZa+B8lGy2STP+AgXFuO4IDJl5wGFW+86Ol/3/VCr3uxMSVxKp4vV7yNIwnuL5ko017W79jXGuqLRiN1Rtk3y4+99biA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5791.namprd11.prod.outlook.com (2603:10b6:a03:423::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.37; Thu, 20 Jul
 2023 19:29:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 19:29:10 +0000
Date: Thu, 20 Jul 2023 19:28:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZLmK2Z5c8iVmVjkd@DUT025-TGLU.fm.intel.com>
References: <20230720142510.534057-1-tejas.upadhyay@intel.com>
 <20230720142510.534057-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720142510.534057-3-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 5023656a-8fec-43cd-81ab-08db895797b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ePGECztgcQ83wxwqeXXVf6xwgL5Y63lB9Hp7XoLGuoAkcy/WzjUROatPJFTRKddC0/BmrrvCeiKNO7xpkcu86scl6LfnTiELD7CJ8c7gt6O3jumBuO82WofTYmUkKT6l415LLBNQvFPmZ+5fdvKvPAswnTJ/BRZ3/gDSo6MeY08LxdSS0Nkwd67O8+D0oXMc07eXxp/47s4toqCDRfrObhButw1LlgtfJxTd/CopJHBnHepFO/FeBmVXd3zC3LTKLyHlnI39yFs2PKoxXXavnqZ/1sZPjd8KsKqBq1qCUAyKlba9ZVM0KHJv9oTxfOGVZAeoQjYp6haaxt5P9xvTcC31VJehg5alODN8l7y+rAyuL1n+CQVXZL1Bf9/xbWm6QM/BknTZlm5nVP9TT7gzpNHiIz5UazWMDtS/G1Ke0a9a39kf7Sj39kX0D9cb+o77is3KwN88GlPPZE23s7lyoFBB3yqXExrc71W01Jvfz7hoROwDXYlwpB7nBJz7umL0BZXRq7qYHjujBMhdH0r2Toz/SHIJANKg8lOnXK5rurg2lJn87J4cph/Z3BqNq2/1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199021)(26005)(186003)(6506007)(83380400001)(316002)(66476007)(66946007)(66556008)(6636002)(4326008)(8676002)(6862004)(8936002)(41300700001)(5660300002)(6486002)(6512007)(6666004)(2906002)(478600001)(38100700002)(86362001)(82960400001)(44832011)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0UuzOCXmtgh4ah2SPXUep043lU/PRYmw4KOb5+GdBgVn6uketNxuf650q37f?=
 =?us-ascii?Q?M6Ul48WMgd7Q+JR49k/pkJML7xNjjUmT3Lcdq6v3ZLJcrgkC/SIfBy+1ZNch?=
 =?us-ascii?Q?Z1h8RhY89XNOqMsyQ8PUMbTcv19+nOLnGZ9LU/YuObYU8OI925rYgOgfklWf?=
 =?us-ascii?Q?jh7N3nvZRTZB9Zs5yhbQkcC2gZWNPGRw314GhxHhusYwIi3voIcltflLVSj8?=
 =?us-ascii?Q?ljHxnajhlDALelgdeuju8AKioWWcJ84lgLAoInwasK55eD0QoQw1OIA4YM0p?=
 =?us-ascii?Q?HJM2HKWSgpvD5Cn1xFcTbMJRb9Ac9TtIlwintUcVWbAR8CvWo0q9o/gKcsUy?=
 =?us-ascii?Q?gLWo4YeqY/LNB0egfq4+kamrnCOQGzJr+Rn+WqyY+Z6SYfAmJwvA8dLhAJyJ?=
 =?us-ascii?Q?AoZXRQs0V/lUtNxabfcaJAou+GhSr/wAocfptpn1DqN7TINLlSMux5WNei/d?=
 =?us-ascii?Q?VJdwS5issAUpMSPWXy8Wk1/49ns9pZieUVMBxvXbi2bHw4kfB/V9MTCraL6N?=
 =?us-ascii?Q?zPrC4rQ1EP3y1sXhfzuxabO5S/9ItLpJCN1mdbsJNYtziFfgm3IAWrmsVsZC?=
 =?us-ascii?Q?CKl6RjHxwTzWbNEMnQuVDTShW+KVSo7mg0AJlIXVtm0sun5iK4Q6xyAIlucM?=
 =?us-ascii?Q?pQs0oZk1jHDOqSqJTMjf/KkossPHMARDqurTz1OYuhm1yRoCm9BIQbw899l8?=
 =?us-ascii?Q?JXqgF+JO8xq9/wANIkyv0gLkjTUSwfpgP1kZGlGZbHZdgfDdypmC6H44TeSy?=
 =?us-ascii?Q?2cD13iDDweZLRqZORdPQNWZnqONkd2M0WuN3m+jju8mkKey8G6HPncuboL8U?=
 =?us-ascii?Q?lc7MRez7SitmKIuRbQJs8mKBTlUV8hhV74rMNg7Xr905T+xsNY9o3PWDbzPW?=
 =?us-ascii?Q?XdVVo6wef8bbrOMADjMbN2cg5yEi5t1EGDXa1VghVZpJzqFQKM9CG3rFxrvi?=
 =?us-ascii?Q?12BXkGzAC5hp4kpUAa9KcUDsrbMmMkpWd+TKA0yX4j0iHPElnFzu6ne2zHm9?=
 =?us-ascii?Q?kD3PSa1P4Otuvtb/h7TRcBT59bwELqk38jYoPw8uEBzLiQ3LCOrTxmF+C+C0?=
 =?us-ascii?Q?mWS+vmG/gXltJYqreeZWyoxbj2WdqmUmnYtCp338Uc13ZgNvboSyh8xMolq9?=
 =?us-ascii?Q?9HdrAqgPm7GmGdf9ySPwvX/wiwKT0On0KiGUdtr+fKZnxWgdtohKN7ZKp5uQ?=
 =?us-ascii?Q?8VaB5gryqzKaKbG4sSp+K/QLjwtgolaDq7kBUwpI+teCvF5W+H1+UL5F4Y3k?=
 =?us-ascii?Q?JUu8sL4L3I1Y8yuJgrbFcH1HQ493JVdJzYD2ZzIuXHHW22h7N0XcIgFoyVgv?=
 =?us-ascii?Q?56+I61GVdau7fpw0LF66HnTvuEuIOMwP/XGlppLO30cck+gFlFBTcpcBy9OW?=
 =?us-ascii?Q?nXKj015wCvaXnEGBLeHhbEdLKIHf5SR2qV09NsGb8BvO7P2zWqbHcREVF8ZK?=
 =?us-ascii?Q?ZqmQL6XFoKw+DbIGpQtJg4UXQkxQJsJPXTV/7gJURG/dE8rBrt1AkuGjwJF/?=
 =?us-ascii?Q?7YNBeK/NtbScDRftJ53kmWVQrc4K3cMZThrdpfCk7ATVWwedUM3r2FjtB3/0?=
 =?us-ascii?Q?HxSW+Y0jy2jfSLx5IJiGrJSzrwFd0y/PuzYyHBqMqf2ncsSChq8iEiRrmICn?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5023656a-8fec-43cd-81ab-08db895797b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 19:29:10.5692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eaJNCSEQ748v4yeSR5kITmRzUGzZD+aRf/mM6gcz76gkk1/3ZtTu3G9geV+5+CAn69xcd6+TsEo34xBd8SMnLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5791
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 2/6] drm/xe: Add sysfs for default engine
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

On Thu, Jul 20, 2023 at 07:55:06PM +0530, Tejas Upadhyay wrote:
> For each HW engine under GT we are adding defaults sysfs
> entry to list all engine scheduler properties and its
> default values. So that it will be easier for user to
> fetch default values of these properties anytime to go
> back to default.
> 
> For example,
> DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/bcs/.defaults/
> job_timeout_ms         preempt_timeout_us     timeslice_duration_us
> 
> where,
> @job_timeout_ms: The time after which a job is removed from the scheduler.
> @preempt_timeout_us: How long to wait (in microseconds) for a preemption
>                      event to occur when submitting a new context.
> @timeslice_duration_us: Each context is scheduled for execution for the
>                         timeslice duration, before switching to the next
>                         context.
> 
> V4 :
>    - Resolve merge conflicts - CI
> V3 :
>    - Rearrange code in its own file
>    - Rebase
>    - Update commit message to reflect tile addition
> V2 :
>    - Use sysfs_create_files in this patch - Niranjana
>    - Handle prototype error for xe_add_engine_defaults - CI hooks
>    - Remove unused member sysfs_hwe - Niranjana
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine.c             |  4 +-
>  drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 94 ++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_engine_class_sysfs.h | 20 +++++
>  drivers/gpu/drm/xe/xe_guc_submit.c         |  5 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c          |  5 ++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h    | 12 +++
>  6 files changed, 131 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 59e0a9e085ba..aa2d49efb9bb 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -54,8 +54,8 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>  	INIT_LIST_HEAD(&e->multi_gt_link);
>  
>  	/* FIXME: Wire up to configurable default value */

This comment is stale.

> -	e->sched_props.timeslice_us = 1 * 1000;
> -	e->sched_props.preempt_timeout_us = 640 * 1000;
> +	e->sched_props.timeslice_us = hwe->sched_props.timeslice_us;
> +	e->sched_props.preempt_timeout_us = hwe->sched_props.preempt_timeout_us;
>  
>  	if (xe_engine_is_parallel(e)) {
>  		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
> diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> index 9959b0362d71..7804cc27bd05 100644
> --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> @@ -9,6 +9,8 @@
>  
>  #include "xe_engine_class_sysfs.h"
>  
> +static int xe_add_engine_class_defaults(struct kobject *parent);
> +
>  static void kobj_xe_engine_release(struct kobject *kobj)
>  {
>  	kfree(kobj);
> @@ -19,22 +21,91 @@ static const struct kobj_type kobj_xe_engine_type = {
>  	.sysfs_ops = &kobj_sysfs_ops
>  };
>  
> -static struct kobject *
> +static struct kobj_hwe *
>  kobj_xe_engine(struct kobject *parent, char *name)
> +{
> +	struct kobj_hwe *khwe;
> +
> +	khwe = kzalloc(sizeof(*khwe), GFP_KERNEL);
> +	if (!khwe)
> +		return NULL;
> +
> +	kobject_init(&khwe->base, &kobj_xe_engine_type);
> +	if (kobject_add(&khwe->base, parent, "%s", name)) {
> +		kobject_put(&khwe->base);
> +		return NULL;
> +	}
> +
> +	return khwe;
> +}
> +
> +static ssize_t job_timeout_default(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms);
> +}
> +
> +static struct kobj_attribute job_timeout_def =
> +__ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> +
> +static ssize_t timeslice_default(struct kobject *kobj,
> +				 struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.timeslice_us);
> +}
> +
> +static struct kobj_attribute timeslice_duration_def =
> +__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> +
> +static ssize_t preempt_timeout_default(struct kobject *kobj,
> +				       struct kobj_attribute *attr,
> +				       char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_us);
> +}
> +
> +static struct kobj_attribute preempt_timeout_def =
> +__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> +
> +static const struct attribute *defaults[] = {
> +	&job_timeout_def.attr,
> +	&timeslice_duration_def.attr,
> +	&preempt_timeout_def.attr,
> +	NULL
> +};
> +
> +static int xe_add_engine_class_defaults(struct kobject *parent)
>  {
>  	struct kobject *kobj;
> +	int err = 0;
>  
>  	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
>  	if (!kobj)
> -		return NULL;
> +		return -ENOMEM;
>  
>  	kobject_init(kobj, &kobj_xe_engine_type);
> -	if (kobject_add(kobj, parent, "%s", name)) {
> +
> +	err = kobject_add(kobj, parent, "%s", ".defaults");
> +	if (err)
> +		goto err_object;
> +
> +	err = sysfs_create_files(kobj, defaults);
> +	if (err)
> +		goto err_object;
> +
> +	if (0) {
> +err_object:
>  		kobject_put(kobj);
> -		return NULL;
> +		return err;
>  	}
>  
> -	return kobj;
> +	return err;
>  }
>  
>  static void xe_engine_sysfs_kobj_release(struct kobject *kobj)
> @@ -69,7 +140,7 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
>  
>  	for_each_hw_engine(hwe, gt, id) {
>  		char name[MAX_ENGINE_CLASS_NAME_LEN];
> -		struct kobject *khwe;
> +		struct kobj_hwe *khwe;
>  
>  		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
>  		    hwe->class == XE_ENGINE_CLASS_MAX)
> @@ -106,6 +177,17 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
>  			kobject_put(kobj);
>  			return -EINVAL;
>  		}
> +
> +		khwe->hwe = hwe;
> +		err = xe_add_engine_class_defaults(&khwe->base);
> +		if (err) {
> +			kobject_put(kobj);
> +			drm_warn(&gt_to_xe(gt)->drm,
> +				 "Warning: adding .defaults to engines failed!, err: %d\n",
> +				 err);
> +			return err;
> +		}
> +
>  	}
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> index f195dacc1ec6..492a84a22c30 100644
> --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> @@ -10,4 +10,24 @@
>  
>  #define MAX_ENGINE_CLASS_NAME_LEN    16
>  int xe_engine_class_sysfs_init(struct xe_gt *gt);
> +
> +/**
> + * struct kobj_hwe - A hwe's kobject struct that connects the kobject and the
> + * hwe.
> + *
> + * When dealing with multiple hwe, this struct helps to understand which hwe
> + * needs to be addressed on a given sysfs call.
> + */
> +struct kobj_hwe {
> +	/** @base: The actual kobject */
> +	struct kobject base;
> +	/** @hwe: A pointer to the hwe itself */
> +	struct xe_hw_engine *hwe;
> +};
> +
> +static inline struct xe_hw_engine *kobj_to_hwe(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct kobj_hwe, base)->hwe;
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 911d4965c27c..08e1b05206cc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1128,7 +1128,8 @@ static int guc_engine_init(struct xe_engine *e)
>  	ge->engine = e;
>  	init_waitqueue_head(&ge->suspend_wait);
>  
> -	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
> +	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT :
> +		  e->hwe->sched_props.job_timeout_ms;
>  	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
>  			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
>  			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> @@ -1136,6 +1137,8 @@ static int guc_engine_init(struct xe_engine *e)
>  			     gt_to_xe(e->gt)->drm.dev);
>  	if (err)
>  		goto err_free;
> +	/* Record timeout value, in order to show current set timeout */
> +	e->hwe->sched_props.job_timeout_ms = timeout;

This doesn't look correct, if I'm reading the code correctly if any VM
on device is created that doesn't allow dma-fences it will result in
e->hwe->sched_props.job_timeout_ms being set to MAX_SCHEDULE_TIMEOUT.
Now if another is VM created that allows dma-fences the timeout will be
MAX_SCHEDULE_TIMEOUT which is incorrect.

>  
>  	sched = &ge->sched;
>  	err = drm_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 1af5cccd1142..0a254a59735d 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -361,6 +361,11 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	hwe->name = info->name;
>  	hwe->fence_irq = &gt->fence_irq[info->class];
>  	hwe->engine_id = id;
> +	/* FIXME: Wire up to configurable default value */
> +	hwe->sched_props.job_timeout_ms = HZ * 5;
> +	hwe->sched_props.timeslice_us = 1 * 1000;
> +	hwe->sched_props.preempt_timeout_us = 640 * 1000;
> +	hwe->defaults = hwe->sched_props; /* Record default props */
>  
>  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
>  	xe_wa_process_engine(hwe);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 803d557cf5aa..167a13fac3c5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -107,6 +107,18 @@ struct xe_hw_engine {
>  	void (*irq_handler)(struct xe_hw_engine *hwe, u16 intr_vec);
>  	/** @engine_id: id  for this hw engine */
>  	enum xe_hw_engine_id engine_id;
> +	/**
> +	 * @sched_props: scheduling properties
> +	 * @defaults: default scheduling properties
> +	 */
> +	struct {
> +		/** @set_job_timeout: Set job timeout in ms for engine */
> +		u32 job_timeout_ms;
> +		/** @timeslice_us: timeslice period in micro-seconds */
> +		u32 timeslice_us;
> +		/** @preempt_timeout_us: preemption timeout in micro-seconds */
> +		u32 preempt_timeout_us;
> +	} sched_props, defaults;

Hmm, here we really want these values to be per class not per hwe. Can
we setup each hwe to point to a common per class structure?

Matt

>  };
>  
>  /**
> -- 
> 2.25.1
> 
