Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056E4CD5BC8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 14:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C9E10E8BD;
	Thu,  5 Sep 2024 14:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcNBVQcj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1EA10E8BD
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 14:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725544947; x=1757080947;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Qn8DbSYbuCEpabCfIjGO9nk65BK8lQHIg8dHyBzd7OU=;
 b=LcNBVQcjPzrub6MKL7HsW3IFx7V7P3Ma+zxReEvK8dp64IO87CyLh6z2
 MVuUYZ1Obc4IuUgY97tFUGEfMb02MbGvfkb6Nr8j3DVjKquiKL1sjpJ49
 1VOv1whmnWZG6KJdDoL3lMo4N5NQzDzo+h4ITKRefnyRLOstES60ZAZGA
 gZhPC4m3z8yT9BMormnclmwAr679YdEqT+3pLjLJfcFfrbNaV8oz4myxi
 piexen33SQwAzNsun1uw7BQt4eppBahQHNhD/mdiMPOQrHeEWLZnGotnu
 zZXPgqVEK+wyl8/2q5RV59J30K/1BbpnMAazIEpZgFrLWD0qyPTwo/8pX g==;
X-CSE-ConnectionGUID: eA7+jK51TSWpiJK4q5QwKA==
X-CSE-MsgGUID: C8aTg5rvT+Ol60+cXM0UZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24214093"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="24214093"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 07:02:24 -0700
X-CSE-ConnectionGUID: WAHQ1A4CS/mC3i6NW3GXgg==
X-CSE-MsgGUID: 6xAZCsmZSRCLrvMahM0BwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65282869"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 07:02:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 07:02:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 07:02:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 07:02:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5K5Dzgy5itkRtdBJjTCtTvsf3X/LQu4JoMh1BoNTnuofXpepzbAJDjTFc1l4h+Oeelf+WjKhtdDE6D/nJkcm4uF3JcIoHOI3I8U0YbGHEFERUEDFf2LKBrPDyy2kVfo8zyADFOfRpm/+VeWx9836UdffemxG0iOtl/7eLmDZG7Aq3QS+UkxfpDSnKadiiVm71xRFkl/x2nXyncWwRsC+g9PNytfKGWUds/IYSu+6jzDSTkpGNNxq/4/KcX74387W1BnDtM6VhByBcpEFD8i5dzPqJVB6Adl27HBheXrfUVQwi1v1a1zgdHKEixZUxDJ+l6hMaj81IS8YmZ/JZMshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeEWxsOM1/RU4tIr/OQ9H2APIWhiUQTJKFvlmNW+T6k=;
 b=uQMLKCxd9GNrIZV9/Du3sfMYwfMWvM1wYGiQxpPpG8dFY+WXjQFwD5Ix+2FsU2s8hu7+Wv42fhq9K1cwEJ/yQUASRKbrEVyNuLEcp8D6jSyJrJcZsV5VHe/nZqxBrsAS8370ws5JEAtHQAABMHShgKRrKQU38m6QmX+80TZUR3bPTjn6C/bSrUP45DAgXkfZLzrzrDCKAPPdfL3MAn+L+wTXmEKeCFrmr0oCVppr2TK4WjUdfxQ+HYUo3ifEm/8byC+cO1MW5JPSIIkNdAI0c7B1v6MCiP6ObiZxD8Gn4UgLFoPlccZkmHt1NPDs83mvi+DhdSwjubOFx+04W4I2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA3PR11MB8117.namprd11.prod.outlook.com (2603:10b6:806:2f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Thu, 5 Sep
 2024 14:02:19 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 14:02:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Jonathan
 Cavitt" <jonathan.cavitt@intel.com>
Subject: [PATCH] drm/xe: Suppress missing outer rpm protection warning
Date: Thu, 5 Sep 2024 10:02:15 -0400
Message-ID: <20240905140215.56404-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P223CA0013.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::18) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA3PR11MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b836547-9365-4144-c846-08dccdb35b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rsk6DfZ9m1Fk/O7psh/iNhcTxMc965xDQyQYmRpuCfViLfM/toEOkLkHcfDh?=
 =?us-ascii?Q?Lk8dEeB/oblEubWbIp55MsgM4wXoCOLBUj3qFvXjVzs3yIepmsWInSYHjQro?=
 =?us-ascii?Q?TtVX0Un4kXFpKRrc9bCF0QOGvu9w1IP5QSynYoCZXwy6yXZu1E/GnCupqL1j?=
 =?us-ascii?Q?cNsULLZ2yWGqYOqJPz+B7E69jpQvokwi3SFzMLuywjDtiPIXGa6E3W36flsI?=
 =?us-ascii?Q?1Tfqf6H9C27f54yomSFEbiMK6n8HFJgQNJRxBSR26cklEAXOg7aNUMTY9ViD?=
 =?us-ascii?Q?uPkzd8KqwH45XNyGqO0+DL98Pq3IesnW9imQYV0pYwigKbZ1LgRet3Alwq7R?=
 =?us-ascii?Q?+ljm6gVvPeaWkxT5gJn3lrR4vBY08BUac0mcmL47YktjNC2EJ0kEY9InVGtN?=
 =?us-ascii?Q?TZKgPDPFT57uGmqNtJgaV69x7KPr0PxDKoQC+jzmXVkrGC8GcAo2NPulWU+y?=
 =?us-ascii?Q?q8vE1J66iqwACuQgSGfBcfPAZ+EjdFuEKtXoEwjXWQJOgT2wRe5T3xPkYss9?=
 =?us-ascii?Q?hfVskpzOhc7uN7X3BGholkArzdmxJVEIYk2c4HNpb1peypXdVEpaSCK9pGO/?=
 =?us-ascii?Q?5SZdxw3EJRO8IDPkHIAsx8CbVzlwCNDcbuDeoYwjRPbwbzefOoo3Qw8csULq?=
 =?us-ascii?Q?iS22PK4tY1mFIoq4jC548za5OiYTrb59jCy6k0vv89dNjmRJJAOoo+cIrUNU?=
 =?us-ascii?Q?u2qZp+RHIoSbRPYxnOMubWve9FJUqNUHtgyYGGi9YG3R2nrpdooJAiL+HViX?=
 =?us-ascii?Q?W3IP2/kSdIGjYHZP0LO0PbDVAsyXCcGwT+2rUJGrXSf+om2zTdQPM0wFRL8G?=
 =?us-ascii?Q?c0C7XDzH/niB0uZRPSQIdq0hqt5/P9OIhY27XOesJlfAyrtTqa31usVzfA7U?=
 =?us-ascii?Q?j3oRxJfoOGVUS/DCiyp74J/ltAqJHaSfhx/JW334d1tO2CUFLTFw8j24Axh0?=
 =?us-ascii?Q?tjG32xdhhniGgs29VJZbWlJRzpVU5S4kaqb/xeNTrLSz0DbhNDbyjTtGoGKr?=
 =?us-ascii?Q?zO3J4pxJftZhWXUo7YeQLYtYPu0q0Pqc0rctC0gamfpJFJ/dQ5DrT/+cdzE2?=
 =?us-ascii?Q?5BWtqx4awvMq03xcs3YfY8YKNFIAL/1DMjnD8X1becwQCvhJL9mWqoOoyMVO?=
 =?us-ascii?Q?lKcTP7gS1IG/8wsgfV6DbANjaHzdBMqjVz/Qt6rF/AC9gpmOGOihvhpFF+hT?=
 =?us-ascii?Q?CR2I+IVP6IxzlfdvWx8ofXd+yLjBPL/HQXXsG4na9l8tmd2b/LCLuP3NRvBF?=
 =?us-ascii?Q?QefhT+vxceJSpFuoVLuov7irg9RB8CEi74Lsgj+KL5tpA0N9/QumRqLcWfhL?=
 =?us-ascii?Q?hXpk9APoGi+suDTCveAv+PDcwADigdSLPjrK1NyDyQ5xQg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KnNCDLPtPXwAp3+juxhTvz9/0cQNqcurSibVUafa5b6fiD0U/DqFTUKkgv/5?=
 =?us-ascii?Q?1JR4alGTXTA9FpvF6jk2GoZve03DG3qY5pxE/csaSDAaq3EBmQDhbkCQuUEv?=
 =?us-ascii?Q?8+/PUyniBrhE2z4yRZxqGivDOu1YC0FkgpmRBnUgIqqytje4qLqeQseY0tD3?=
 =?us-ascii?Q?SL2d6lmTliqhnPHnWk4K4etzNfBfH0xwDe83Gg4B7XJkXk1tb+OLn7T1kl+n?=
 =?us-ascii?Q?qYHIv0a2ACRjoU3w2q/FoIxpgQCCxsLbZWJn0S6LMK1Kg8MrqxAGfxblDd0e?=
 =?us-ascii?Q?gPYhlddLofeUuMvqbsPlS7WRPHvkeIK2kuJ8TMKP+kgHKwOzkjOe+73tW0c4?=
 =?us-ascii?Q?/THFlbxxPJqCMbe0J2/mj5PPrxe9H5heoh+Fqyz4b3BZmMhI1QvvtC57ONuo?=
 =?us-ascii?Q?kKGY7G+M/39m7fbMJpmi8jAajRr8ixgzl4WtxqVLYBQBTB0VXcvDdnr36oVR?=
 =?us-ascii?Q?1dd+eAWLNL08DXO6J5vpqgijrVz/LvwIUuTeveWtWoGEGFlDcTN0FJ3LXg3u?=
 =?us-ascii?Q?Q07beCY1R2e87/MnA96WQpggGRH06CkTTDV34kiAgdDU8SYLWh4NqvWhYMpV?=
 =?us-ascii?Q?JVhmUuBLEQntqI07vrzL/hTUhLq695DpRS46PW8NYfeaXt6sZ02ZUJacvFdl?=
 =?us-ascii?Q?E9HXtzvNO5p/DRrqpBKm2hTIfVvBwmxHdV+dqpZbFrxC9u8bTmq7cOOQj983?=
 =?us-ascii?Q?MeZ1LO+EvjShMOkwHpT+GT5t2IkqdkB2JWLT5a3rc14/xLhl30RN44xc4VOj?=
 =?us-ascii?Q?49Unqymn6NNrcZhyoH3xyCsZU9qCl2DbnzZELQmMZlD2POno0ngM/QvYKbgV?=
 =?us-ascii?Q?TjWF5XRe3DqGg+tviHHLbqpw0+OdD4UpCYHXq+ISLBlhg5x1L8HRsuYp++R6?=
 =?us-ascii?Q?mfpSXgu0J6ozL6DTh+Xgr5/XOAdST0QfHyaPylOqyccs3EcE+hz7V1Xz//NV?=
 =?us-ascii?Q?6zI5KtH2sPrS2o4kXU5ogDxd1hrPUshC5wy6woZnHwKX4IaDmM8iGiA3qq3Z?=
 =?us-ascii?Q?J4qwUOllHCLqCVmiJlnIh5/lfk5TiYZeF5Y1UQrEBcyXUjJGVERR/hWTvWue?=
 =?us-ascii?Q?rQCpaikkx9EBtJTZX9+FQcpTabavuOZOkLgZQ4J6z03dsCqCc2Le1aeW9zaY?=
 =?us-ascii?Q?r93KRxi5ZZdkaVqtlMU9FO2GhXmd6XZuV2R53Wlv3BJCp5dxpJhQThRh7zKE?=
 =?us-ascii?Q?vcZx7YRMWHq6i1MywPnfEpQUDk5ELsq0AWlSvlb1kk4lHZgQaQa9oGiOP/7x?=
 =?us-ascii?Q?CjXSYREkk8DWKKuIBiOp5GHVFNgue3xABIs9lDuUiatgGv8qHOEu3lWuAE8T?=
 =?us-ascii?Q?1Avn12AlZp04GlliwB1dCbHjTAope6CfPucJcrecpkD/1iyLsndtEPu9UcuW?=
 =?us-ascii?Q?b8gyoNRUuWDq54UkX0kVfDDX/+zTcgMn/Z+TfCFBvUDhFqg2MPplB/VywLDI?=
 =?us-ascii?Q?oCkrbX2gDy+WSrpU7VEh/9Cb2jbtU7Mq4OtbT6ROriUVv303XWL9ZUQSF3v2?=
 =?us-ascii?Q?jOXDgPURSuW31dC+el1h6JNWNXntQgXPL5u9uP1odICandGEN41dVSWtwpo4?=
 =?us-ascii?Q?43De7lCbROaNYG6bLRPeLWoA/XbQ3+CaARTv6xZOZchmp2bPqrEWcOzUI8NR?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b836547-9365-4144-c846-08dccdb35b2a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 14:02:19.5478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NXvV8PzH33P1aqrM8VqHyIMcqKT4aRJK6UVb7QnTsqU5Ttx5rSFFhZ3LNvi1ujoO4CVao9sbguRpHaqAPEYlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8117
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Do not raise a WARN if we are likely within suspending or resuming
path. This is likely this false positive:

rpm_status:           0000:03:00.0 status=RPM_SUSPENDING
console:              xe_bo_evict_all (called from suspend)
xe_sched_job_create:  dev=0000:03:00.0, ...
xe_sched_job_exec:    dev=0000:03:00.0, ...
xe_pm_runtime_put:    dev=0000:03:00.0, ...
xe_sched_job_run:     dev=0000:03:00.0, ...
rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
console:              xe 0000:03:00.0: [drm] Missing outer runtime
                                                     PM protection
console:               xe_guc_ct_send+0x15/0x50 [xe]
console:               guc_exec_queue_run_job+0x1509/0x3950 [xe]
[snip]
console:               drm_sched_run_job_work+0x649/0xc20

At this point, BOs are getting evicted from VRAM with rpm
usage-counter = 2, but rpm status = SUSPENDING.

The xe->pm_callback_task won't be equal 'current' because this call is
coming from a work queue.

So, pm_runtime_get_if_active() will be called and return 0 because rpm
status != ACTIVE (but equal SUSPENDING or RESUMING).

v2: Still get the reference even on non suspending/resuming
    path (Jonathan, Brost).

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index da68cd689a96..6c83b8f92494 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -588,6 +588,18 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;
 }
 
+/*
+ * Very unreliable! Should only be used to suppress the false positive case
+ * in the missing outer rpm protection warning.
+ */
+static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+
+	return dev->power.runtime_status == RPM_SUSPENDING ||
+		dev->power.runtime_status == RPM_RESUMING;
+}
+
 /**
  * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
  * @xe: xe device instance
@@ -604,8 +616,11 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe)
 
 	ref = xe_pm_runtime_get_if_in_use(xe);
 
-	if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
+	if (!ref) {
 		pm_runtime_get_noresume(xe->drm.dev);
+		drm_WARN(&xe->drm, !xe_pm_suspending_or_resuming(xe),
+			 "Missing outer runtime PM protection\n");
+	}
 }
 
 /**
-- 
2.46.0

