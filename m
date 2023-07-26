Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC56C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 06:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA25E10E418;
	Wed, 26 Jul 2023 06:20:12 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655A010E418
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 06:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690352411; x=1721888411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xslOPPczjvmfkVggFY+dtyNxlIr5V4JpEcMsJX8UUsg=;
 b=XGzVu4CSGnzKEHR81wYhu1GciLc7PKEQs8dJuLlWwA40s8kD6iZue2fn
 xpkOwRekZUqhPGXFEcRZ5hc6+ohznPK/ZlvtzofIRnoMQAxdpa1ggDyhw
 FnLrZnTmnBF39gvroKm/0Z69g6kBmV0NUXC/WrozeTtruxRGxLig7L/dY
 rxXurpcF86X4aCyUCg1GoY7Y1qNWroGAF/6qrLvCiWkyEQYGDdpXAC6Wj
 /ZO0P04qnzLcS+MpmmI1yU+qfjzv0HJZNUEST7M1ITd2kirNkeVNVRORN
 bjXMho2jrwKCfrpg9eV9G/O3d8TR3Hxdmmd1BwlkrWzHH1nmPosYXAnel w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371537812"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="371537812"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 23:20:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="869761394"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2023 23:20:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 23:20:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 23:20:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 23:20:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9ETdJHybWs9NWFMl7ZJp9Wz176PoDv5vSJz58+/r0A8By4SDAod8W8P+m/pp3QHwVmqfRgLr6y07wPt38ZspTiM6IQVBCWOYCrjJCUjAB7pr0vE1kHlPrXZa4u7LcUNOXiNmsIcG0gRtA7NMKpyvPLjZ6JFRdbXX7Ddl7hXYAVgE1O/HsPExojhQGp2wv0jxAwbyLiZz1bHclHjiGZZSFgwARf2sRP6J3BrclpFS8tGsLMKnuWUbV2HIWEPbTY+l6r2yKCU71OO5H78zVnscCI8rcmFN4osSfroQ3g6+wjQJLa74NwkL82qC9yXfi7SAfEQACR0pzCJh5H6gLrefA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dx12jPf3cFrWwq/SleLwoUFnuxdTiBj9oVzPE8P3GYw=;
 b=XRpbWilbafnQ2x1Skuh77EhmDWQIivuzavvzaABVczc0Goyz855Twppks17CRqSGzHLsmd5DvZz8q3HSKXZ+KNE1xDoTuMhISSqfBQnnXHW6awh4Z2PGh5rK6R9jlYsWz5haaJC9fnKODYo/1WaHPsuUUqgXONE8bY2pRaip+s92OPs5ET1MG6o8cqigy6iLIMpR6BLFN4lsDFPrcy7FiLLJaPdOStK7mep6FksxNQ3pxLRxPk9tNS+u3jNt7lBTKn3FSnYOF+FgEj5uHGL8mvHrZWGP4rmciOhzZR8PD0CSMCSVh3Dzy9eyrip34t7/QofrrQGpZAic3kqesy7rnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ0PR11MB5664.namprd11.prod.outlook.com (2603:10b6:a03:37f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 06:20:08 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 06:20:08 +0000
Date: Tue, 25 Jul 2023 23:20:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMC7EIJqHO7gI+Sh@nvishwa1-DESK>
References: <20230725115003.785982-1-tejas.upadhyay@intel.com>
 <20230725115003.785982-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230725115003.785982-3-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ0PR11MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a9c113-9a54-4040-41db-08db8da05bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qWAAU1mFUHt0FF5PQ4PZsNQ+ksBzWqWgjU4a+NWLezeWQMGzeIJQspUM+Mdy5nKpAwCjeleSlN3nutG6Cgt8r1WxBvgSUGfuXdEIQnN2l/D0hqs2haZONUzR9HHotaKgFV7xA3I4BeK8gk7mV182OWHyHaS0z7rlTiaRRJ7S1j+6Z7YzsjWNVZLn/9qV7IXcMMf1wuhGbSP1n/3UqXIWA01gprRjA8g0uljbcQcchNx9IF2OwpktOc2Etc2Ef2A3UdqEjXC44DP4GkGNOwW5w89qzrjijnROPD6RZu6ETZAXnxUCLNZspD02cj9MYfK+iqVb8NHZK+hnfQ5c67mZBWInf9Hz3fHbM3ZGaVMqQKOASH+wx7uzQ/TBjIzp8y65RsDzmZQbiDrGlHfngAKzw6wgDgJs3UCDv2Xq6qc3U142n9lPO2QfzOMrV2vxln18ul8g2S9DUtgl9U82qpEM52Rp4rmd6Q7MHYWCHyuuS096czHWUiW0LyT9IK/bKF41bXIaO5cJRbRYLWm40dnA8wz6ewrnR8KyVDF//0YO2F4yRXQYUTtKUfu3R16eC8+mLil1cqxZZ45Pw0/sGVa8tf/njr7Od9UOOcFxRf97xsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199021)(107886003)(186003)(6506007)(26005)(83380400001)(6636002)(66476007)(66556008)(4326008)(66946007)(316002)(5660300002)(8676002)(41300700001)(44832011)(6486002)(6862004)(9686003)(6512007)(8936002)(6666004)(2906002)(478600001)(30864003)(38100700002)(33716001)(86362001)(82960400001)(66899021)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0WEqm9nRQuIyVQneFvN4hHkthHDIWp5EC/2j3eKHrHNZzcEgSzDaC7PkeHsH?=
 =?us-ascii?Q?P4xs5kv1WlJp1VcZNEJpYLZWc3EXaL/0lnxPC3MAaKO58ymqzESQjqvrWEzf?=
 =?us-ascii?Q?TsHgxM6N2GcyyJcVyI1Ex/1T/TRAlEfrGW0bsseR0cp+70Zh1tfou3aUrtMw?=
 =?us-ascii?Q?qU+seu4wL5JeRNbfSO7eHdzbEzOQynK2BzUC6lnUElH7M/xoXmdikjth+L8/?=
 =?us-ascii?Q?/ccwQV6d2ibDwKvtW7yq932rRDDt6B5fwxIUacVATvKWccFOEyULXJv+zUBV?=
 =?us-ascii?Q?uj7aC4bqKIEUyK7ToV0aARzIrdcJwQlbsO6wI9GTr7O4lAnbcd2DV2ixUhwe?=
 =?us-ascii?Q?paC9DFO/K4AokLXKOuZuSTIYumThcB7BCdros8woDA1co0B9BIew4ufgbTqg?=
 =?us-ascii?Q?sm6BgEjwYlkZQyXhF+I62y435lBVKBT1K7o7B3FgoloKAxonJNyUqljCYJNY?=
 =?us-ascii?Q?831qmoYTZkc+4dN9+EiQoIRcpnQSk4uF+YScx0Vnq0yccXuU9NZgWSpkDx2a?=
 =?us-ascii?Q?SUGhCVZM+vuA7dMkvaKPAoYLphDbwVDIJAKwczSqwSJSkMhvACfKZRFwCz31?=
 =?us-ascii?Q?WiN2+K03y5/YGXoYHkosTzeWcv+ps2PmCDw0qyl1jYXDKJG1EYf6Qfqd0a6n?=
 =?us-ascii?Q?6PVXbNLnAyf+cdmBBdIkJhpK4hm2IPzKXYCqYJlcmQeG7YAD2/xRBmefPmO0?=
 =?us-ascii?Q?ZM6HYqb1NmnjNfR3SqMRDJF/S73JpF1OmiCXbamuIIank9XgbGsIkUBqFO/q?=
 =?us-ascii?Q?DoLyy/tpxanJsVQY1UOzMEm1s/k2CWBwP7Fdm4b9kcSX/zX2gjJ/rCGPSc2o?=
 =?us-ascii?Q?JRIbCMXvE1YTwIyouW3L5Uxe61xTcPTpCBWye8kjgvcmjRojRqviOzpK3Ud/?=
 =?us-ascii?Q?ONy1MyuAmrpfEY2JW1DzJp9M8fhynmTUqs3zRCzx0YGx45JXW4u6mKBZOJ+p?=
 =?us-ascii?Q?yS9KgQEXTn2vyvS8WUD8k7sbmKGzSND4tCDyAfyppropFVMTm4RU3vGs7iM+?=
 =?us-ascii?Q?Oaz15AVfMhc0j6Ims7pAvsLFL7L55lrhjFVmAi0VQZymnBXmX/E0d9D/jYL0?=
 =?us-ascii?Q?yhOwyLoFEuy2sCeiCO/lt+HIM3BxgQjBUFR5R+LrC0jeZHO+je0mN4ZTbJQz?=
 =?us-ascii?Q?iC33/mFw6BrO6o6+JFROlIBVDiBEqsiZrjPJ62zShaRZuf1y5/yEdseAOBAx?=
 =?us-ascii?Q?UvJ54BsppVeK4bsq+YdCrFJ375gaW+OozzHKMsWTXbkfxIqNmO7Hy5W7VSVH?=
 =?us-ascii?Q?kop2B6GxHhXwb3BWjNQGdqPYwfuSPXgtIgVI7TwpOcwY4sKFjq27yAX3As2p?=
 =?us-ascii?Q?4B3QVnAnmJMchY2tLRc6WafMdoy6Uhh2uPQlKHiEfRNRcJhdAZIwCdtnFtGw?=
 =?us-ascii?Q?Zk45Hv1Ld9q7Iirb82U4wa9KPcNLNv78+SmBU19w+P3pMsVFWY4LbajMiPrE?=
 =?us-ascii?Q?XSZfGA/R3XbBS1Oa+ys7VGi8cgTnna+vAVk5K76afjTBUhoCtrHXKI/gp9Qs?=
 =?us-ascii?Q?DW4AyS8Y/bjoG7m8B+6eWuu30m8U0072LJUYtanLhbr9qrRWx6qgQO41e0yz?=
 =?us-ascii?Q?J8VRJjFCtALtmYEfdEq/iEIxdcEcFKA8QC2GvGv+NNnFA2J4mb7Bxg5T/Css?=
 =?us-ascii?Q?HhbyxMwC1HgBBj5Vc63k3tE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a9c113-9a54-4040-41db-08db8da05bcb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 06:20:07.8771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JK1OYuf0TtsDUJNj/amHcTS6qktdL3dd79g8/3zeRavhjBvLF3FNkwFad3OD6YxWERMZXg2BiPOnUE+CMGscYq+M5y1hnPRQQkGt7rvcndP5w1YxVIAJYFjhpSC7vwVO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5664
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V7 2/6] drm/xe: Add sysfs for default engine
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

On Tue, Jul 25, 2023 at 05:19:59PM +0530, Tejas Upadhyay wrote:
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
>V6 :
>   - Use engine class interface instead of hw engine
>     in sysfs for better interfacing readability - Niranjana
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
> drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 98 ++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_engine_class_sysfs.h | 20 +++++
> drivers/gpu/drm/xe/xe_gt_types.h           |  3 +
> drivers/gpu/drm/xe/xe_guc_submit.c         |  3 +-
> drivers/gpu/drm/xe/xe_hw_engine.c          | 10 +++
> drivers/gpu/drm/xe/xe_hw_engine_types.h    | 36 ++++++++
> 7 files changed, 164 insertions(+), 12 deletions(-)
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
>index 9959b0362d71..d9c7315b7f8b 100644
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
>+static struct kobj_eclass *
> kobj_xe_engine(struct kobject *parent, char *name)
>+{
>+	struct kobj_eclass *keclass;
>+
>+	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
>+	if (!keclass)
>+		return NULL;
>+
>+	kobject_init(&keclass->base, &kobj_xe_engine_type);
>+	if (kobject_add(&keclass->base, parent, "%s", name)) {
>+		kobject_put(&keclass->base);
>+		return NULL;
>+	}
>+
>+	return keclass;
>+}
>+
>+static ssize_t job_timeout_default(struct kobject *kobj,
>+				   struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_ms);
>+}
>+
>+static struct kobj_attribute job_timeout_def =
>+__ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>+
>+static ssize_t timeslice_default(struct kobject *kobj,
>+				 struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
>+}
>+
>+static struct kobj_attribute timeslice_duration_def =
>+__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>+
>+static ssize_t preempt_timeout_default(struct kobject *kobj,
>+				       struct kobj_attribute *attr,
>+				       char *buf)
>+{
>+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_us);
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

I think this 'if (0)' construct not needed here.
We can do...

      err = sysfs_create_files(kobj, defaults);
      if (err)
           goto err_object;

      return 0;
err_object:
      kobject_put(kobj);
      return err;

> }
>
> static void xe_engine_sysfs_kobj_release(struct kobject *kobj)
>@@ -69,7 +140,7 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
>
> 	for_each_hw_engine(hwe, gt, id) {
> 		char name[MAX_ENGINE_CLASS_NAME_LEN];
>-		struct kobject *khwe;
>+		struct kobj_eclass *keclass;
>
> 		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
> 		    hwe->class == XE_ENGINE_CLASS_MAX)
>@@ -101,11 +172,22 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
> 			return -EINVAL;
> 		}
>
>-		khwe = kobj_xe_engine(kobj, name);
>-		if (!khwe) {
>+		keclass = kobj_xe_engine(kobj, name);
>+		if (!keclass) {
> 			kobject_put(kobj);
> 			return -EINVAL;
> 		}
>+
>+		keclass->eclass = hwe->eclass;
>+		err = xe_add_engine_class_defaults(&keclass->base);
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

NIT...I this function, I think it is better to push returning
error to the bottom of the function as that is what is followed
throughout the driver mostly.
ie., use 'goto's with below construct at the bottom.

      return 0;
error_object:
      kobject_put(kobj);
      return err; 

  }
>diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>index f195dacc1ec6..683726563059 100644
>--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
>@@ -10,4 +10,24 @@
>
> #define MAX_ENGINE_CLASS_NAME_LEN    16
> int xe_engine_class_sysfs_init(struct xe_gt *gt);
>+
>+/**
>+ * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
>+ * eclass.
>+ *
>+ * When dealing with multiple eclass, this struct helps to understand which eclass
>+ * needs to be addressed on a given sysfs call.
>+ */
>+struct kobj_eclass {
>+	/** @base: The actual kobject */
>+	struct kobject base;
>+	/** @eclass: A pointer to the engine class interface */
>+	struct xe_engine_class_intf *eclass;
>+};
>+
>+static inline struct xe_engine_class_intf *kobj_to_eclass(struct kobject *kobj)
>+{
>+	return container_of(kobj, struct kobj_eclass, base)->eclass;
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

NIT...is line size >80 here? is it checkpatch clean?

Niranjana

>+	}
>+	hwe->eclass = &gt->eclass[hwe->class];
'>+
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
