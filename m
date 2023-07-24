Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3153BC00528
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 15:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E228C10E336;
	Mon, 24 Jul 2023 15:44:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DB210E336
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 15:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690213444; x=1721749444;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fCLoDVN/eKaHYv/7xo5q94rNft88+HmPpU49/4AyP5Q=;
 b=fH4oUuFdsCneW8tFq+InDCY8GtOTsN27s35xqsNK+lfk6doEbNkx3x0P
 hrve1PSAYqe7Gp+8bGXMKQsx1e6oo4un8CSCR/+5tNRlKTuBqVwywEu0V
 8sG3LsxfP7Bi4p3JVPLuD3oA4nyH+98ZwFKChgH7I/BNXxY2H7UehW6OX
 n0ZNwsKGhiarq/JU5eXiE9gymz136r57DnVyV7VlFeq54bE7CcyIfqnwU
 /IMYCQLbWb9GO1EbG5Sge1cuLaUWBzX1oYUoPTvShKiChJ8ELX51NsNDX
 MtnX9BKctvy+kyOFb/LEfYr8DMirTUqRQwmkxaXDvcvcGAL760I6mU9c8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="453852610"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="453852610"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 08:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="839491585"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="839491585"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2023 08:44:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 08:44:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 08:44:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 08:44:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 08:43:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyw3n793BuJS+UGK2FrCD1vRC9LI0mupPG7whwdjsdHRunkHN5O1m6RozB2maTWDmDpzMh7b3bJetiPS0G9w+JKjcn1t204AYhfiLsJUu+2ZktILNfAGFuDstpq+4QAX5UTPoQTryPcYeuPEN+5geWtfW0VS1MQOWnXoXBNAv5MmlmQDcx/YuOalfdOMJHOG+qsKvfA/vZrr93siSe0rpDRQxoMP4OFnO1xMvjQqnT7EyX5hP7gz8vJcypHmVsNL70mFiyIQqe0bY07hOSoawTvVCRoOh3QRUVFBkmumNAzglLJ7eR14in/StVwZElnOhs7is555NQB/dnElXB2MEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdNxRtmSHWzs5+0nR0j5zkGDbNNl+VNlk7kA1swIQq4=;
 b=kgFulCt9tid1cdSdzAXSGR0EyXn16uFz+Zwjiv+Tmuv4zm62wtUzhqmXMibrdodmsA7hpllVV6qdnsQMkr6YRGSamWrjnyANPeB/10siJbJVG7Tc4HrhqqUCNdS1/mo05H3QS0sXPWo/lWIz3l7cpeSgFgF6BwgxXHkSs8djH5jslIIIYt+llGuJXJT5OQTuX5lD2PKhABf+ZGZhjASWEvYZM5eyVOXtj1UQSjVA81DZBppsfY/5C5VW4H0+oQ1C58ItTPDcYFEfclQQOkgq/Hb7PcLpGMoxRpHJtzu6F3CHgAbs1Zv9/RM0zu9uUDVBn749wPhHGueXkamx/cVltw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 15:43:40 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 15:43:39 +0000
Date: Mon, 24 Jul 2023 08:43:32 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZL6cJPgR93Ck2uTn@nvishwa1-DESK>
References: <20230724094733.720266-1-tejas.upadhyay@intel.com>
 <20230724094733.720266-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230724094733.720266-3-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CO1PR11MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c27a1c4-9b02-47be-b4ab-08db8c5cc064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: seGOpmgFUsJcVNRuGITi9Mg1cF6L2PX7cNElXEPqMc9gx9RgmSXq7JUHvLDIkHe1v7Q5AA5nbRf7fWPoeQVeZp8tJ2/Lcxyx2ytEDg8sjTeAnE+mFQLtdmItJTAn0N+4CNqDVuTZ1a1UlJQUCTG72vjB5VZoAM+AY3fx3tH/MhKYCoXN3HVsOxUggNOlauAX+Phoum2arossmz4oepkjuRKdD/cPBZ2qVf6CAtOupoE78bIndmaCW8qZihM7hw6Q+IsHagE4k7SG4XbcZ+K62GsjRVMo7fl4Wqid9ky0QeyjwNnAzTDNzj2q9+CCGz78b0tHj3xQL7FSWpFq+BNt+LC5mxQQ7QiBrzUZbTCwmEfOyMyFi28ozUIih14amBRSCqC8CY8PysoIJhnfq8Zw/jRyB+ZeLlDqaTFdY3TUWF5tj3h8Qffy1REG2WB069rKXm1VwaIxZw74eR3NTC3JALC3drSdlwvnrHpgwR8EVFe+pdrJTxV+TbM1qMAaaQ6P6WrGOIRLXJYCValpwJM+yzw/oLu+5ZrTxq+tRaA1SJjziPaMLtW9s3TWERjLNTDI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(66899021)(83380400001)(33716001)(38100700002)(86362001)(82960400001)(478600001)(2906002)(30864003)(186003)(26005)(6506007)(6512007)(6666004)(6486002)(9686003)(8936002)(5660300002)(8676002)(44832011)(6862004)(316002)(41300700001)(66476007)(66556008)(6636002)(4326008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cNK58WhPMSR4uVpNz1q2vN6j03TpWgu+fl8YMji+T5/iTsiQldDgzXiYOyl7?=
 =?us-ascii?Q?G4hn8fdP35HBnKfFVe5SxcGK6syjTUrGlEJ8CsbNnrvLs5k3CY5IaiE+bmSz?=
 =?us-ascii?Q?OPJ2kEanVu5hPreLel31VBECIfJWMcZKqaQR2BasYi5rLl2MQ9USmgm05Y1P?=
 =?us-ascii?Q?F1TDG56nry90pgWHwWIhaetlzKmMBOowr6x3pbVQkJGtr+yL3xfUl2WNnd5q?=
 =?us-ascii?Q?PRE/a3MtE4ZIc1wAOS5hd1rvZUgocqGcZLvqbvCiPeEuyEyWtAcyzjweOhXQ?=
 =?us-ascii?Q?vRazGJPJROI9u67vD3BHWa5igJE9Oyu7+K1akeSXhA8ONdzua+k12tJ7GBtZ?=
 =?us-ascii?Q?qNfKj3J+iDk6yd1HC7zGn2FK16VOW4lyiNFZwp+e1X2O+hwj3hMdQFIMKQs9?=
 =?us-ascii?Q?ZuTCWCkAuFx5LlEB3fD59Qd33JTXTqYJBBF8wWTafiZA0sSCtD0u0wEFYL7Y?=
 =?us-ascii?Q?oB4E45oZzOZkzW3OFcvLoWQ2QcOj+32Z1g3OTOXxVjy00iCs5C+IFED3029u?=
 =?us-ascii?Q?HgOf/2k/7TCcWhGibwJJhdLPX+iTlSqhvE/tZPB15kiN0ZOOYq8sWgLljNoG?=
 =?us-ascii?Q?/Er/91h8/7rWlXl7dHEb1/CcdQ3S5HdZ2PZq3MAUNf2NgMcLCURoDQ+MyGod?=
 =?us-ascii?Q?fvMEqT6lIOIkEJHzesoZIgsOXME8v0oBsoRhPvDDS8i0qUQqY4NGcIfCPAzU?=
 =?us-ascii?Q?y1m2LKmzgdCMJN+N0HUmYoNaJab5RzdfZxCWqmdpDNGwRtV9Gwm7KXudFMoA?=
 =?us-ascii?Q?XPX8oy06tgTD0VauX08Hn1eIZXR0dDBgd4BltdzZPEhgxXZg9AWR6qL2uoai?=
 =?us-ascii?Q?yunSy7zSdG6dYBDDeL/JnysMNe1pX4wDqTRUYeXEF29/uIGrbBI6qXS997zh?=
 =?us-ascii?Q?fLV9C/mKpVGtgmgMQQes5V5QBMuXmUBOmWNTafWn4Em58sGCA9TNOnUR70oY?=
 =?us-ascii?Q?DkhyHZMa+uSW2A2+OgaeY/QwiO6D5zVo6v5/8QjB/6AhtE2MG52GWTBK+wRO?=
 =?us-ascii?Q?slHVKIjjJyMBwIXMeFWM001FEk23mruI7Ap1vB7A3itRlk/WO+n+j9vmW7r/?=
 =?us-ascii?Q?iv6rS2doe7b73ruR0trzqWrHCOxDKBUew3HIavrDhxqWHpIbL088LpITL0el?=
 =?us-ascii?Q?xj/doUHNtaxfgO3yXj2OEQS2zl2suzzUaGkVyvZbGxgBIH5hWA4ywn4FcHjg?=
 =?us-ascii?Q?gL729r1VkONZrI2vJfs+5YVKGmi+nEA3TZyu9GILUnngvffJlo65wo3w39aA?=
 =?us-ascii?Q?8IZ4iznlTzWJPQFri5k8UoSE4SrOLPw4aWXG7gAXRBUG38VTvilnY1EhJpyU?=
 =?us-ascii?Q?8AAwnKeUrlyT0rgcqigePeQUAX176iwn5KlMZriRZIyziRWG4bPi0MIvlmEa?=
 =?us-ascii?Q?mpG9mYiS/BIw+9EI6INIxos8X+hCCBMlS9kux2jqJAZ4Ni7Pnd3+Sr+k6lsr?=
 =?us-ascii?Q?qzB6QjKOM8sjUMEcsIay0NSbvgfTMoG5XaOpnzsmPgXtjzEZaB1Ya/t++ioI?=
 =?us-ascii?Q?RqvjScXUxaEOUUWV5FEkYPaRyYAx+y9am7b44O/8pI3UlAc+qhWjsppCAmAB?=
 =?us-ascii?Q?76Cw02gy2XWNMuj0twNAu/HQ49fICm2VnBE9x+fCTK3gfaz/6zQVronC375i?=
 =?us-ascii?Q?QwThu74qAs6AT6/6gegFMqQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c27a1c4-9b02-47be-b4ab-08db8c5cc064
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 15:43:39.7505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrSjkU5HJVXIDJPGZu8dW578ISqp0T/BwpyZXzWBt3bg3DI09BOsOn9W5sc925MitD2CeI+gtAGCScLCZdaN7zVl+wYI0O0wzz/aZ79jA56wtzefz7nDIobYkeV3TsgU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5089
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V6 2/6] drm/xe: Add sysfs for default engine
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

On Mon, Jul 24, 2023 at 03:17:29PM +0530, Tejas Upadhyay wrote:
>For each HW engine under GT we are adding defaults sysfs
>entry to list all engine scheduler properties and its
>default values. So that it will be easier for user to
>fetch default values of these properties anytime to go
>back to default.
>
>For example,
>DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/bcs/.defaults/
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
>V5 :
>   - Scheduling props should apply per class engine not per hardware engine - Matt
>   - Do not record value of job_timeout_ms if changed based on dma_fence - Matt
>V4 :
>   - Resolve merge conflicts - CI
>V3 :
>   - Rearrange code in its own file
>   - Rebase
>   - Update commit message to reflect tile addition
>V2 :
>   - Use sysfs_create_files in this patch - Niranjana
>   - Handle prototype error for xe_add_engine_defaults - CI hooks
>   - Remove unused member sysfs_hwe - Niranjana
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_engine.c             |  6 +-
> drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 94 ++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_engine_class_sysfs.h | 20 +++++
> drivers/gpu/drm/xe/xe_gt_types.h           |  3 +
> drivers/gpu/drm/xe/xe_guc_submit.c         |  3 +-
> drivers/gpu/drm/xe/xe_hw_engine.c          | 10 +++
> drivers/gpu/drm/xe/xe_hw_engine_types.h    | 36 +++++++++
> 7 files changed, 162 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>index 59e0a9e085ba..19a7a05bbbc3 100644
>--- a/drivers/gpu/drm/xe/xe_engine.c
>+++ b/drivers/gpu/drm/xe/xe_engine.c
>@@ -53,9 +53,9 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
> 	INIT_LIST_HEAD(&e->compute.link);
> 	INIT_LIST_HEAD(&e->multi_gt_link);
>
>-	/* FIXME: Wire up to configurable default value */
>-	e->sched_props.timeslice_us = 1 * 1000;
>-	e->sched_props.preempt_timeout_us = 640 * 1000;
>+	e->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>+	e->sched_props.preempt_timeout_us =
>+				hwe->eclass->sched_props.preempt_timeout_us;
>
> 	if (xe_engine_is_parallel(e)) {
> 		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
>diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>index 9959b0362d71..b930b4aaa866 100644
>--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
>@@ -9,6 +9,8 @@
>
> #include "xe_engine_class_sysfs.h"
>
>+static int xe_add_engine_class_defaults(struct kobject *parent);
>+
> static void kobj_xe_engine_release(struct kobject *kobj)
> {
> 	kfree(kobj);
>@@ -19,22 +21,91 @@ static const struct kobj_type kobj_xe_engine_type = {
> 	.sysfs_ops = &kobj_sysfs_ops
> };
>
>-static struct kobject *
>+static struct kobj_hwe *
> kobj_xe_engine(struct kobject *parent, char *name)
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
>+		return NULL;
>+	}
>+
>+	return khwe;
>+}
>+
>+static ssize_t job_timeout_default(struct kobject *kobj,
>+				   struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);

Now that these properties applies to class, we probably shouldn't have
a hwe here.

>+
>+	return sprintf(buf, "%u\n", hwe->eclass->defaults.job_timeout_ms);
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
>+	return sprintf(buf, "%u\n", hwe->eclass->defaults.timeslice_us);
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
>+	return sprintf(buf, "%u\n", hwe->eclass->defaults.preempt_timeout_us);
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
>+static int xe_add_engine_class_defaults(struct kobject *parent)
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
>-		return NULL;
>+		return err;
> 	}
>
>-	return kobj;
>+	return err;
> }
>
> static void xe_engine_sysfs_kobj_release(struct kobject *kobj)
>@@ -69,7 +140,7 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
>
> 	for_each_hw_engine(hwe, gt, id) {
> 		char name[MAX_ENGINE_CLASS_NAME_LEN];
>-		struct kobject *khwe;
>+		struct kobj_hwe *khwe;
>
> 		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
> 		    hwe->class == XE_ENGINE_CLASS_MAX)
>@@ -106,6 +177,17 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
> 			kobject_put(kobj);
> 			return -EINVAL;
> 		}
>+
>+		khwe->hwe = hwe;
>+		err = xe_add_engine_class_defaults(&khwe->base);
>+		if (err) {
>+			kobject_put(kobj);
>+			drm_warn(&gt_to_xe(gt)->drm,
>+				 "Warning: adding .defaults to engines failed!, err: %d\n",
>+				 err);
>+			return err;
>+		}
>+
> 	}
> 	return err;
> }
>diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>index f195dacc1ec6..492a84a22c30 100644
>--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>@@ -10,4 +10,24 @@
>
> #define MAX_ENGINE_CLASS_NAME_LEN    16
> int xe_engine_class_sysfs_init(struct xe_gt *gt);
>+
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

This probably should be "struct xe_engine_class_intf *eclass"
instead of hwe.

Niranjana

>+};
>+
>+static inline struct xe_hw_engine *kobj_to_hwe(struct kobject *kobj)
>+{
>+	return container_of(kobj, struct kobj_hwe, base)->hwe;
>+}
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 78a9fe9f0bd3..d8d9151cca62 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -286,6 +286,9 @@ struct xe_gt {
> 	/** @hw_engines: hardware engines on the GT */
> 	struct xe_hw_engine hw_engines[XE_NUM_HW_ENGINES];
>
>+	/** @eclass: per class engine interface on the GT */
>+	struct xe_engine_class_intf  eclass[XE_ENGINE_CLASS_MAX];
>+
> 	/** @pcode: GT's PCODE */
> 	struct {
> 		/** @lock: protecting GT's PCODE mailbox data */
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 911d4965c27c..7978f7efd702 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1128,7 +1128,8 @@ static int guc_engine_init(struct xe_engine *e)
> 	ge->engine = e;
> 	init_waitqueue_head(&ge->suspend_wait);
>
>-	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
>+	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT :
>+		  e->hwe->eclass->sched_props.job_timeout_ms;
> 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
> 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 1af5cccd1142..96c32a815c90 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -362,6 +362,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> 	hwe->fence_irq = &gt->fence_irq[info->class];
> 	hwe->engine_id = id;
>
>+	if (!gt->eclass[hwe->class].init_done) {
>+		gt->eclass[hwe->class].sched_props.job_timeout_ms = HZ * 5;
>+		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
>+		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
>+		/* Record default props */
>+		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
>+		gt->eclass[hwe->class].init_done = true;
>+	}
>+	hwe->eclass = &gt->eclass[hwe->class];
>+
> 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> 	xe_wa_process_engine(hwe);
> 	hw_engine_setup_default_state(hwe);
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>index 803d557cf5aa..6aedb627e292 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -63,6 +63,40 @@ struct xe_bo;
> struct xe_execlist_port;
> struct xe_gt;
>
>+/**
>+ * struct xe_engine_class_intf - per engine class struct interface
>+ *
>+ * Contains all the engine properties per class engine.
>+ */
>+struct xe_engine_class_intf {
>+	/** @init_done: Mark init status for this engine class struct */
>+	bool init_done;
>+	/**
>+	 * @sched_props: scheduling properties
>+	 * @defaults: default scheduling properties
>+	 */
>+	struct {
>+		/** @set_job_timeout: Set job timeout in ms for engine */
>+		u32 job_timeout_ms;
>+		/** @job_timeout_min: Min job timeout in ms for engine */
>+		u32 job_timeout_min;
>+		/** @job_timeout_max: Max job timeout in ms for engine */
>+		u32 job_timeout_max;
>+		/** @timeslice_us: timeslice period in micro-seconds */
>+		u32 timeslice_us;
>+		/** @timeslice_min: min timeslice period in micro-seconds */
>+		u32 timeslice_min;
>+		/** @timeslice_max: max timeslice period in micro-seconds */
>+		u32 timeslice_max;
>+		/** @preempt_timeout_us: preemption timeout in micro-seconds */
>+		u32 preempt_timeout_us;
>+		/** @preempt_timeout_min: min preemption timeout in micro-seconds */
>+		u32 preempt_timeout_min;
>+		/** @preempt_timeout_max: max preemption timeout in micro-seconds */
>+		u32 preempt_timeout_max;
>+	} sched_props, defaults;
>+};
>+
> /**
>  * struct xe_hw_engine - Hardware engine
>  *
>@@ -107,6 +141,8 @@ struct xe_hw_engine {
> 	void (*irq_handler)(struct xe_hw_engine *hwe, u16 intr_vec);
> 	/** @engine_id: id  for this hw engine */
> 	enum xe_hw_engine_id engine_id;
>+	/** @eclass: pointer to per engine class interface */
>+	struct xe_engine_class_intf *eclass;
> };
>
> /**
>-- 
>2.25.1
>
