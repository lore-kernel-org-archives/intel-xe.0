Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19697EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 19:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9FF10E3EC;
	Thu, 29 Jun 2023 19:56:23 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00BB10E3EC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 19:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688068580; x=1719604580;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gK+ONMnQAcwFd/TWa+yZCWypsu71U92jXwHRh6sjn44=;
 b=IJsgMrl20O105vesFO9AZBXScr1j9pN9CjHOaOrTDW/67JzVPNSRyHiu
 FKpOtGhSYl1SwPRvHjJa9juzfYIF+AJAfEDxOCDC0Oiqh/7u7+YHYCEfG
 oOcGCQC6XJi8eSoj1AKBMNJVhtAqI/XTE6vw6sA7bPRM2x/iinNsf9UrA
 id6e2TpEl7yeVvmIjOBtLqyVMG2HGeL/KRFhbZf1tP7/ZIRq+LShd8de2
 60EmSvrG8QRrTgTnyFrVIyNKVZdvvn1a73irfoUcn2EVdSMxbblHPt17v
 iDTuK7329W/WGSPBkFDoo6PprauOzQOK86mcNIkQot+HksWPilfO09Aro w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="392938367"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="392938367"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 12:56:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="807467376"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="807467376"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Jun 2023 12:56:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 12:56:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 12:56:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 12:56:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuUrOvNSB6K+8KyUy4wskqj2ClD1qV34WmALL3i/UHoYT/3cVUKab2ikGlCZtYkOeFn07Gc4QpTdWMH06T3nnFOSPhqdCwHLIF6eKaKgtW/6P6eHZJ8ZF9pHPiYPiG2RBndzs00Du7dNsCcz8dWabAoiqwTte9XW8W+zbWHpdvRp5HTJY9HSmyHcpuTTxCZcxMN6OmRQKOJKd4ck5x5XZMKCR9fYX9EbuJ/KmZo/eXNHpPKBiOYv+gzPrFqLCrgdA8xCNnE094vFhrAcFQEyvWNvonKGknzXRuO0NhEhnUrW1cTd91mg3fp4/YTbGgP93jZ4sA1VWvF23CT04IZvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78WtgNSxDewsrvHSMy16oxnomfaQIjRbQMBbl55ei1s=;
 b=VG4y04SP/vHMhWAxdBI1tvMxKy5yQfvPAyyvn+PWYUQxV2eNY04g2m7FXZK0JtLkzavEXaaODyYIVJmlmTRKXZS27T3HKaIxy7hVsIziQaCKx86DZI6J6cYD9VfpLPHJ3fEb6sqcmB20wWco4Rj23bQWJT0uSBUi1gdXLlvibRvBFY70w5o6mRIl0tW+RkBrCrWzCuQOhx2exPcoHBHQQk56RAj5W0GZ5N9yPLkiysoI+lTUp/hutFuGyQHBVt+fLm1a6+yLrQ+vXmZz2gIlyFe/qLVGfcwqPSVgZoOR/LUq5UVJvc9mOsv8lMMHxzn7bKHooCO/8kLkGCJlqvNCmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 19:56:16 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 19:56:16 +0000
Date: Thu, 29 Jun 2023 12:56:13 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <ZJ3h3UA5eZm/RODS@nvishwa1-DESK>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
 <20230628114732.3598169-3-tejas.upadhyay@intel.com>
 <ZJyYOxoB4imTrQsV@nvishwa1-DESK>
 <SJ1PR11MB620426A38DE4B23AFF8CC0D38125A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620426A38DE4B23AFF8CC0D38125A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR17CA0054.namprd17.prod.outlook.com
 (2603:10b6:a03:167::31) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DM4PR11MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: 628a3898-44ce-4900-5fb7-08db78dae5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nd99ANg5FZABNE3Foxp0jc2XfE8yp5kcOZzDUsKnMuMeviVjONYM5h1B1RvSIDjP4vbLlpnjE8/DNxSkQy0zq7QQ6pyf16gRIpMsl7BlYREhf/unhmR9QHWpEv2XSzDqO3av5s5Z/8qf+f2dl0tKa6eKb7uyvbhCzQQnZsWOgBLkH3hpb3CmDftGea9i/l4v76syhDsZNhtbGvL7fCkzFApCXHxE+L/eWtTAkz1D9v8sVGWgixkmdRnD5NJR4ODuX/K6HjukJfA5c0FDU1urEyXaY+MSgPUP6Q1NU5HGT6W1Lr0xUG+NvPASIuIHkKBoMSXof7QWlGxfdGblGE8S478/fISVP9a8sacppIdLDbBOl3G71zB/2C/z1fiJbE5feRm4oiOtcskFhGzKaUF7Mj7mLQXZ/HBkwZaWS25mpPxNQMspGrSa9B4DMyA0zGklqnR3l3yu2R3oVdFow2Reb7gzFQ2NTAXRidBjkv0F+sXuSvH1uaOy/K1dIokvJ7xtJEkPZcCW2au4gp+o9hgNhPUqXVEMbCA2eRYhVaUUZp4l0O3jhvPGdg/Mfq7TBkzr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199021)(5660300002)(44832011)(66556008)(316002)(66946007)(478600001)(4326008)(66476007)(6636002)(6862004)(6506007)(66899021)(8676002)(8936002)(86362001)(2906002)(6512007)(26005)(9686003)(41300700001)(33716001)(6666004)(6486002)(186003)(30864003)(83380400001)(38100700002)(53546011)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hIN7c7NSN/VKg/2ycTI8wLoklTG0gUv08NGL17AOFneRF94psh6dPwiJGcR5?=
 =?us-ascii?Q?NVLoekDjgyhWACnv8cUXnOyanOFZG/fr1LtPjoibcSjUcjmBhj4TbaKzdPkJ?=
 =?us-ascii?Q?Eac6k2tm710n9hbKMK0RgoNkbHFflDhEUB7VCQaPJotkYKefETqHVmQTNcMj?=
 =?us-ascii?Q?r/foOVF8U/IErAf1ntbyATPY0kfz8cwFUN3BK1fdOjb0MN7TJVRdkLW20LB9?=
 =?us-ascii?Q?HLvFILvmyxSHBNfiJ26HFpvWKcURPzp8NuuBGu2aGpW98YawgJ2xuWuVqo7W?=
 =?us-ascii?Q?hdlhyvDhI1pzn5A6FyESI6JpgJes9JHPvg6DVxHNOx5v89DwIidukt9qdNkh?=
 =?us-ascii?Q?6Nh3b4lY/Oz0nfM2cWDeDEusB1YS+SsEWzwBHQfgo20ArSfZ2rrAJHdZy2OC?=
 =?us-ascii?Q?JmN6gDe98EdWI/YIOdTqKGxo1pD7WbtxEpwbSltGpkSjLvB85HZJWsuJ8JqR?=
 =?us-ascii?Q?LSLm7MRHmGtNxiot/Qtmq4zQbalHeErmIb37QK9aoSNB7Uljte9iV2U3P08b?=
 =?us-ascii?Q?da1haDjh6qXf1MvwKGiS/rbw4f/ou7Oe91MYFev02f0stGGB1ZuqxbEKUp6a?=
 =?us-ascii?Q?SPfRQiBf+VGvdQ7PZxHXykpHX2zVJaUBQxrSDcpDUXHSstN8My0HWlFW1yqz?=
 =?us-ascii?Q?4uDlm1IN67LiIBB8YyGiKDDqjBcx1VCcL7tlmItE4mYtQpBq34XhVSTlB/+e?=
 =?us-ascii?Q?cPnfbXAchqnDz4pTo/eg5cxYPJ8a+5M7alZY+eXwvg5WzsDTiDtzmByEXxMa?=
 =?us-ascii?Q?7o0Yk+Tgnad2JEwCimbCMNH9jBN6llIj+OmOiay0LetSuMCAzWWyGw+D9VZm?=
 =?us-ascii?Q?+tSNRh1sa0Jdeq2wQkjLXNlzHgoCK+2/dqOd67GJHkPb9HowJ2k+zV0YDuHJ?=
 =?us-ascii?Q?FlX5AB8bL0K8BqK873VA03PSkye7VMQWiPKqSsUXncpNsR8c3H2hcsrPmupa?=
 =?us-ascii?Q?y2nqdBw39BZLXOHCOSA+Bq0cBBe4H9arTxyTtgkiK4/HqzjSDv7nQBX5I15o?=
 =?us-ascii?Q?a3M254+X1yzDVFcO2v86EK2yq2LI+PrkoFy/751IfG5gnOQSCQdonp/InBOa?=
 =?us-ascii?Q?+XZPwo4Vr9VtCPMyrV7XC5ND9jwBGZGlJ5VvSuiiK01pu2nmUScvKa8jw/eI?=
 =?us-ascii?Q?GaV9p6btzC0LVyVTMW4FbibYC+rS6A6UFJmh+wPPQ2PQ+ZCqt+lwLMnJH4eW?=
 =?us-ascii?Q?GxnE6mB+639XBc+nPRumRyZA0h7iPSxDcn94LU8wlYkw6B9JoxWS0do8h36k?=
 =?us-ascii?Q?CIOeySNX579bP1Hp3V7gw6WzKxREloCqbN1ofFWrEcm94EPg7pwQODPw+yIz?=
 =?us-ascii?Q?VpfwJbVp4ecD3mdMZIacGTujJV6MXlIywFgKd1tdI7UTYhI0liYe3QeX7iZA?=
 =?us-ascii?Q?7A5Hk19iJaX9hIgU7am31qTdIN993jTgfkYc0N4hE85Y9eOqB8Y/dnjh9wGa?=
 =?us-ascii?Q?Kbyrei46gPfj2dOts+NhKAglQCVHnAf30xFC3unigYMz7/X3XLEm2iT25bNq?=
 =?us-ascii?Q?b4z909QugwvgJNwG5Bxxd0K65SwYJZSAwKjEG1jjrjKvgk4OnCb9ZqfV6tiI?=
 =?us-ascii?Q?ejG34bAZdGcivirootT68kIWXhj25U+kxveYitQtfY0y0MfqMHkaqKMLBj3D?=
 =?us-ascii?Q?ztJb9cqDtpbag4WbnNoPhdQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 628a3898-44ce-4900-5fb7-08db78dae5cb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 19:56:15.9692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /D23jhW7bgTTj8fWBeL7Iw2OU0+R14TuwAxbnqHJKH5w25S0cVSpScTwdLu8IT9m6d/Wk+g2nBGWUv7c7NesOtdt6emwSyyEwu+q9gOAQxJAV093Wv8er6gNsDuhuzG1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8132
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jun 28, 2023 at 09:25:18PM -0700, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>> Sent: Thursday, June 29, 2023 2:00 AM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Cc: intel-xe@lists.freedesktop.org
>> Subject: Re: [Intel-xe] [PATCH V3 2/6] drm/xe: Add sysfs for default engine
>> scheduler properties
>>
>> On Wed, Jun 28, 2023 at 05:17:28PM +0530, Tejas Upadhyay wrote:
>> >For each HW engine under GT we are adding defaults sysfs entry to list
>> >all engine scheduler properties and its default values. So that it will
>> >be easier for user to fetch default values of these properties anytime
>> >to go back to default.
>> >
>> >For example,
>> >DUT# cat /sys/class/drm/card1/device/gt0/engines/bcs/.defaults/
>> >job_timeout_ms         preempt_timeout_us     timeslice_duration_us
>> >
>> >where,
>> >@job_timeout_ms: The time after which a job is removed from the
>> scheduler.
>> >@preempt_timeout_us: How long to wait (in microseconds) for a
>> preemption
>> >                     event to occur when submitting a new context.
>> >@timeslice_duration_us: Each context is scheduled for execution for the
>> >                        timeslice duration, before switching to the next
>> >                        context.
>> >
>> >V2 :
>> >   - Use sysfs_create_files in this patch - Niranjana
>> >   - Handle prototype error for xe_add_engine_defaults - CI hooks
>> >   - Remove unused member sysfs_hwe - Niranjana
>> >
>> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> >---
>> > drivers/gpu/drm/xe/xe_engine.c          |  4 +-
>> > drivers/gpu/drm/xe/xe_gt_sysfs.c        | 93 +++++++++++++++++++++++--
>> > drivers/gpu/drm/xe/xe_gt_sysfs.h        |  5 ++
>> > drivers/gpu/drm/xe/xe_gt_sysfs_types.h  | 13 ++++
>> > drivers/gpu/drm/xe/xe_guc_submit.c      |  5 +-
>> > drivers/gpu/drm/xe/xe_hw_engine.c       |  5 ++
>> > drivers/gpu/drm/xe/xe_hw_engine_types.h |  9 +++
>> > 7 files changed, 125 insertions(+), 9 deletions(-)
>> >
>> >diff --git a/drivers/gpu/drm/xe/xe_engine.c
>> >b/drivers/gpu/drm/xe/xe_engine.c index 6e6b2913f766..33d1fbae560d
>> >100644
>> >--- a/drivers/gpu/drm/xe/xe_engine.c
>> >+++ b/drivers/gpu/drm/xe/xe_engine.c
>> >@@ -54,8 +54,8 @@ static struct xe_engine *__xe_engine_create(struct
>> xe_device *xe,
>> > 	INIT_LIST_HEAD(&e->multi_gt_link);
>> >
>> > 	/* FIXME: Wire up to configurable default value */
>> >-	e->sched_props.timeslice_us = 1 * 1000;
>> >-	e->sched_props.preempt_timeout_us = 640 * 1000;
>> >+	e->sched_props.timeslice_us = hwe->sched_props.timeslice_us;
>> >+	e->sched_props.preempt_timeout_us =
>> >+hwe->sched_props.preempt_timeout_us;
>> >
>>
>> Shouldn't we be setting job_timeout_ms also here?
>>
>> > 	if (xe_engine_is_parallel(e)) {
>> > 		e->parallel.composite_fence_ctx =
>> dma_fence_context_alloc(1); diff
>> >--git a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> >b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> >index 76bb6441e9c8..5f534f325823 100644
>> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> >@@ -12,6 +12,8 @@
>> >
>> > #include "xe_gt.h"
>> >
>> >+int xe_add_engine_defaults(struct kobject *parent);
>> >+
>> > static void xe_gt_sysfs_kobj_release(struct kobject *kobj)  {
>> > 	kfree(kobj);
>> >@@ -32,22 +34,91 @@ static const struct kobj_type kobj_xe_engine_type =
>> {
>> > 	.sysfs_ops = &kobj_sysfs_ops
>> > };
>> >
>> >-static struct kobject *
>> >-kobj_xe_engine(struct kobject *parent, char *name)
>> >+static ssize_t job_timeout_default(struct kobject *kobj,
>> >+				   struct kobj_attribute *attr, char *buf) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms); }
>> >+
>> >+static struct kobj_attribute job_timeout_def = __ATTR(job_timeout_ms,
>> >+0444, job_timeout_default, NULL);
>> >+
>> >+static ssize_t timeslice_default(struct kobject *kobj,
>> >+				 struct kobj_attribute *attr, char *buf) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_us); }
>> >+
>> >+static struct kobj_attribute timeslice_duration_def =
>> >+__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>> >+
>> >+static ssize_t preempt_timeout_default(struct kobject *kobj,
>> >+				       struct kobj_attribute *attr,
>> >+				       char *buf)
>> >+{
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_us);
>> >+}
>> >+
>> >+static struct kobj_attribute preempt_timeout_def =
>> >+__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>> >+
>> >+static const struct attribute *defaults[] = {
>> >+	&job_timeout_def.attr,
>> >+	&timeslice_duration_def.attr,
>> >+	&preempt_timeout_def.attr,
>> >+	NULL
>> >+};
>> >+
>> >+int xe_add_engine_defaults(struct kobject *parent)
>> > {
>> > 	struct kobject *kobj;
>> >+	int err = 0;
>> >
>> > 	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
>> > 	if (!kobj)
>> >-		return NULL;
>> >+		return -ENOMEM;
>> >
>> > 	kobject_init(kobj, &kobj_xe_engine_type);
>> >-	if (kobject_add(kobj, parent, "%s", name)) {
>> >+
>> >+	err = kobject_add(kobj, parent, "%s", ".defaults");
>> >+	if (err)
>> >+		goto err_object;
>> >+
>> >+	err = sysfs_create_files(kobj, defaults);
>> >+	if (err)
>> >+		goto err_object;
>> >+
>> >+	if (0) {
>> >+err_object:
>> > 		kobject_put(kobj);
>> >+		return err;
>> >+	}
>> >+
>> >+	return err;
>> >+}
>> >+
>> >+static struct kobj_hwe *
>> >+kobj_xe_engine(struct kobject *parent, char *name) {
>> >+	struct kobj_hwe *khwe;
>> >+
>> >+	khwe = kzalloc(sizeof(*khwe), GFP_KERNEL);
>> >+	if (!khwe)
>> >+		return NULL;
>> >+
>> >+	kobject_init(&khwe->base, &kobj_xe_engine_type);
>> >+	if (kobject_add(&khwe->base, parent, "%s", name)) {
>> >+		kobject_put(&khwe->base);
>> > 		return NULL;
>> > 	}
>> >
>> >-	return kobj;
>> >+	return khwe;
>> > }
>> >
>> > int xe_gt_sysfs_engines(struct xe_gt *gt) @@ -72,7 +143,7 @@ int
>> >xe_gt_sysfs_engines(struct xe_gt *gt)
>> >
>> > 	for_each_hw_engine(hwe, gt, id) {
>> > 		char name[MAX_ENGINE_NAME_LEN];
>> >-		struct kobject *khwe;
>> >+		struct kobj_hwe *khwe;
>> >
>> > 		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
>> > 		    hwe->class == XE_ENGINE_CLASS_MAX) @@ -109,6
>> +180,16 @@ int
>> >xe_gt_sysfs_engines(struct xe_gt *gt)
>> > 			kobject_put(kobj);
>> > 			return -EINVAL;
>> > 		}
>> >+
>> >+		khwe->hwe = hwe;
>> >+		err = xe_add_engine_defaults(&khwe->base);
>> >+		if (err) {
>> >+			kobject_put(kobj);
>> >+			drm_warn(&gt_to_xe(gt)->drm,
>> >+				 "Warning: adding .defaults to engines
>> failed!, err: %d\n",
>> >+				 err);
>> >+			return err;
>> >+		}
>> > 	}
>> >
>> > 	return err;
>> >diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> >b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> >index a531aebd10d6..a539cf031c7d 100644
>> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> >@@ -19,4 +19,9 @@ kobj_to_gt(struct kobject *kobj)
>> > 	return container_of(kobj, struct kobj_gt, base)->gt;  }
>> >
>> >+static inline struct xe_hw_engine *kobj_to_hwe(struct kobject *kobj) {
>> >+	return container_of(kobj, struct kobj_hwe, base)->hwe; }
>> >+
>> > #endif /* _XE_GT_SYSFS_H_ */
>> >diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
>> >b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
>> >index d3bc6b83360f..d0a5eae1bbb4 100644
>> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
>> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
>> >@@ -23,4 +23,17 @@ struct kobj_gt {
>> > 	struct xe_gt *gt;
>> > };
>> >
>> >+/**
>> >+ * struct kobj_hwe - A hwe's kobject struct that connects the kobject
>> >+and the
>> >+ * hwe.
>> >+ *
>> >+ * When dealing with multiple hwe, this struct helps to understand
>> >+which hwe
>> >+ * needs to be addressed on a given sysfs call.
>> >+ */
>> >+struct kobj_hwe {
>> >+	/** @base: The actual kobject */
>> >+	struct kobject base;
>> >+	/** @hwe: A pointer to the hwe itself */
>> >+	struct xe_hw_engine *hwe;
>> >+};
>> > #endif	/* _XE_GT_SYSFS_TYPES_H_ */
>> >diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>> >b/drivers/gpu/drm/xe/xe_guc_submit.c
>> >index 86c445903560..ecea38e9e639 100644
>> >--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> >+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> >@@ -1128,7 +1128,8 @@ static int guc_engine_init(struct xe_engine *e)
>> > 	ge->engine = e;
>> > 	init_waitqueue_head(&ge->suspend_wait);
>> >
>> >-	timeout = xe_vm_no_dma_fences(e->vm) ?
>> MAX_SCHEDULE_TIMEOUT : HZ * 5;
>> >+	timeout = xe_vm_no_dma_fences(e->vm) ?
>> MAX_SCHEDULE_TIMEOUT :
>> >+		  e->hwe->sched_props.job_timeout_ms;
>> > 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
>> > 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
>> > 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
>> @@ -1136,6
>> >+1137,8 @@ static int guc_engine_init(struct xe_engine *e)
>> > 			     gt_to_xe(e->gt)->drm.dev);
>> > 	if (err)
>> > 		goto err_free;
>> >+	/* Record timeout value, in order to show current set timeout */
>> >+	e->hwe->sched_props.job_timeout_ms = timeout;
>>
>> Do you mean to set "e->sched_props.job_timeout_ms" here?
>> Updating hwe's property based on e's property doesn't look correct to me.
>
>In that case, how will we reflect what user has set as job_timeout as part of xe_engine_create? This is in default flow not through ioctl so it should reflect current HW status is what I felt. Please comment.
>

Not sure. We have sysfs to set the default property values and min/max limits for the hardware engines (xe_hw_engine).
It looks like user engines (xe_eninge) will use those defaults from underlying hardware engines,
but user can override them during engine creation time (like job_timeout here).
We definitely don't want to carry those values to the underlying hardware engines.

Niranjana

>Thanks,
>Tejas
>>
>> Niranjana
>>
>> >
>> > 	sched = &ge->sched;
>> > 	err = drm_sched_entity_init(&ge->entity,
>> DRM_SCHED_PRIORITY_NORMAL,
>> >diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
>> >b/drivers/gpu/drm/xe/xe_hw_engine.c
>> >index b7b02c96e998..bd94155a28b3 100644
>> >--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> >+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> >@@ -361,6 +361,11 @@ static void hw_engine_init_early(struct xe_gt *gt,
>> struct xe_hw_engine *hwe,
>> > 	hwe->name = info->name;
>> > 	hwe->fence_irq = &gt->fence_irq[info->class];
>> > 	hwe->engine_id = id;
>> >+	/* FIXME: Wire up to configurable default value */
>> >+	hwe->sched_props.job_timeout_ms = HZ * 5;
>> >+	hwe->sched_props.timeslice_us = 1 * 1000;
>> >+	hwe->sched_props.preempt_timeout_us = 640 * 1000;
>> >+	hwe->defaults = hwe->sched_props; /* Record default props */
>> >
>> > 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
>> > 	xe_wa_process_engine(hwe);
>> >diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> >b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> >index d788e67312b9..7a8d275df6db 100644
>> >--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> >+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> >@@ -107,6 +107,15 @@ struct xe_hw_engine {
>> > 	void (*irq_handler)(struct xe_hw_engine *, u16);
>> > 	/** @engine_id: id  for this hw engine */
>> > 	enum xe_hw_engine_id engine_id;
>> >+	/** @sched_props: scheduling properties */
>> >+	struct {
>> >+		/** @set_job_timeout: Set job timeout in ms for engine */
>> >+		u32 job_timeout_ms;
>> >+		/** @timeslice_us: timeslice period in micro-seconds */
>> >+		u32 timeslice_us;
>> >+		/** @preempt_timeout_us: preemption timeout in micro-
>> seconds */
>> >+		u32 preempt_timeout_us;
>> >+	} sched_props, defaults;
>> > };
>> >
>> > /**
>> >--
>> >2.25.1
>> >
