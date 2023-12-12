Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F0AC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170C310E52F;
	Tue, 12 Dec 2023 00:11:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B726710E52F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702339875; x=1733875875;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=C9CwnU/U1a9DeNepWJvwpRyPboFS8BiJdVdwgDPFY3w=;
 b=GcDAaqmwO7mH7nMwjDz56FhiU1LPxbjY8rsVvSG4WwW9tLEfjYxY7i2r
 SixBKRM0tZxCSQ4kXY8BZHZll0edApSL8XayJ9U1CCc6LhQP+MAvLcADp
 70ogeTumEEEm+//XDCQgTiqjI5YjnwJtgi+72OaOGe8atS7FhfQspPGlD
 ugDSA6qXQw5bSnvlplS9EkWw3hDxdlfDbWNmmP9B2LJEXNOESMdUFb7IX
 VEhcQ5gs675K8KxSzQ9V/+eNkE1QNnB0nuxlWyGWQIr0OWJJ7tmg+jMiu
 2vnXaRb3ufVrSAyLDZl6EsCKrv9eJIBrH0VYP0CkKf2uSe6OUAx6WPyjw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8092238"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8092238"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:11:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="14720252"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:11:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:11:13 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LU3dRUX8tPTYV2zsRjQKKW7b1wB0cEab//0/fGBvOaLqpQbbkUp3Tuq4TIZnklQuFNiq5v3JKfhfB/3zuDN8wjkiLpHpPUV8w/gpH7BHjpRz4p+MzIMvcDn/hyQqWU1joTcTXIPw4wmOeUsuhUY9N9zuLHK8F1bwSKS6vY/hii29aRWK/VuD+Xq5Of9Y6uy9p3NdB4rNI23ooppHYZkG+U9VjVTU9lFq5X7yHGtTtsH2+/SWCjUXQKvkNGChuP6Cy92q3uczyCtnJ4fXc/yDDniAAz4wu+qBb7k1+ITCszjpnfuydAhJC7+L5bgoaiztLhxxq6SLORjteHTVtx459w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3QNJFd+RNVMLW2jWm92GKE6XPUR2PmwrEqie/ar2Tg=;
 b=BWvatERqhhH8u5GsJvxwya5eK13GJnvOKU4Ti/7MdaxVXbYWwe0snvrWKZzVfriiLYtGt5E+ubHI49sCinW3CBeVaH/bxlVmWc4uqIDL5DUOALtlfSBlPK4V+6hluZZnmSQD2kWgSikdVsbUjTcpQXM7cADLxV7sE7NQ9qefen28Xy/XuVQRwpQVNtG5cbH3skXidnijY4NBAUGIzid0esrJNaB+3Es8zXi/5goQoJvDLisdOMHT171AlWD88xABCP35B6Xkzv6wFEkFtW6nKYQWbYk0zSqpTFbT5yoG1t8WrJelUCU8+/q1FV/R58+PEI27ZKm6kwgEkgqbRlrJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 00:11:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:11:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 05/13] drm/sched: Drop suffix from
 drm_sched_wakeup_if_can_queue
Date: Mon, 11 Dec 2023 19:10:37 -0500
Message-ID: <20231212001045.1099517-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
References: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0028.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: cb65f239-ccf8-4134-565b-08dbfaa6d2f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mg+FCFufpu+atL8zlml/WQY5TRkO3cbIoJoKr+vdtRz5aWndpsumt2DwuYvcsz3ILX+swggcrP9L4fq75NAWBX9+BS1snk9IpddiuBUyYWg6NZp1rSgJfl3Cjw+PnBESg93vU9y5C0FQGsMdc2sn2umqHFK05AAwBpmjkf7Ezg90JrJ3WCsJvTWf1HZy8v5P8eU52BrtCvCLpO8590yp9TUjQcnW8ehX0wxW/Pli0ixjnmnyX4MKpdCZ3XXQfTV91Xk+vhum9AjVsZrFKLyoHPdWC3o49513rVhmKYS4G1H6eSxLFJV3X5R2i+L32QZIEC16+9jSo3EZxTA0fakJMs0NcSD0v6E1wsq3HXk9AAnw0+67qcJmj8z42eoUWoGmcxBQ73oePpzOBiLi/fPRTpcFHaAPUKS2Wh4yL5u2x0isXxhALOAG62NuOvuUzjnnEp2mmbwe6iuTgqUYxK3Y2pnzoA3PjufKmgvITU38qzQfQJgyfSyS/OARcPgtUUjPajuXJ7SAz2X3zcwJcadCfN2od+3HQFWGgOnQ3fqLjHQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(6636002)(66946007)(66556008)(66476007)(82960400001)(36756003)(86362001)(83380400001)(26005)(2616005)(6512007)(6506007)(1076003)(6486002)(966005)(2906002)(316002)(6666004)(478600001)(5660300002)(8676002)(44832011)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IiN6h6gtGwvF9LvO6X3juiXusvG/RTz0h/Kudp9tqugzSB5a8TpjKYt6aIwj?=
 =?us-ascii?Q?pfU39xKxF9hin/UU3jtmIOCevyya9Vm18oBRkkOhSUPld0qWJ+RgZv6LOVqi?=
 =?us-ascii?Q?YJzgZxMKejBjBbXTO1qPuCV8/lGoIOwouweKS7SC7hE1L80fXLS5nH0F/Ttf?=
 =?us-ascii?Q?YhBtgMtQxsbtRoeZg/e9jfI4xg1QC2XlpEdr6Wy/g8jVYIArqyv6IUUUwnPK?=
 =?us-ascii?Q?Mxbu66s7K+feWnsVc+aWTL6xJSpmdA5613FIO6QbtOKC/TURyT/zqMmx3Tvq?=
 =?us-ascii?Q?TlCzjehc3FfKbIoclDFrJWUeRAuA/v3cs3M0txsycxLgfXKc9txoCx4Bxs8j?=
 =?us-ascii?Q?Sy45avMFZ0hCiAldJ4p3rJZCCA4Zz0buw3vodeDFqj0oJMtKtxnGjONr63Z6?=
 =?us-ascii?Q?YrNvsxRNLJf7//UmxRAkh4Q1C1TS5FCOQ1vhtHZompbM1W+8G4npjeTsrmEL?=
 =?us-ascii?Q?7kreMVp57HOc4mGZbSlSJy+SHmx55M0D/i4pL/QwKtc6ESxiqseCz8p/2SOA?=
 =?us-ascii?Q?EL2Q77p3BlUyah9N62qiqlCtpqgEzWIhfMB5YJvAWez8BL8VNoi3HJK6G9/m?=
 =?us-ascii?Q?PplGwdSTiVO8PrzDHTkddoTgeGmarqV1JPjxQWryUVASL4xfl45H7Bg/Xhn5?=
 =?us-ascii?Q?I+ZWSICnc9qFzRRfTtVFwPapoBFD1zWO3C6ZcwiDUMvIBOjM2C5O042zbjlc?=
 =?us-ascii?Q?ufgQdDw3lOA7T2bYKX5gPDl/dicWGAxrKlWyRRdsPaI1Q4vdouF+Wfd+liDd?=
 =?us-ascii?Q?nmSEHkOzXEYCKNAgT4sgWIKqYJ/bKb6xAVJGVnK6w1ZaTBbYjHgM8RBgKu8M?=
 =?us-ascii?Q?3S/BhJlRBCA+xAg1Q4jtuOBMHzx39gQXFrY0NjsqI/QomEwJZ07mUlQdQk4j?=
 =?us-ascii?Q?fkYjBDCC9lC/3/WZeqgHZWRnkfHAbNEirGQQVFquJac4ROmaQoIgeIcxXILN?=
 =?us-ascii?Q?yUXXbLwPyT0bWXDHbd8XEB+JMMJXicnm4Hmt70asRlByLg5InHg5awa+xH0C?=
 =?us-ascii?Q?b1dejP0D1oW20shxTjTYANbhBIP+QFR8mj57i2MvTNPuykmHTmPbgGVqE8rc?=
 =?us-ascii?Q?epU+AcKkEOu+QTQgH3nEAUYlqpbTvyzXRGCzF8gG49MH8GdYyGukJjMTFBvV?=
 =?us-ascii?Q?XtOltD36J2NCXGs1/5Ferbfcwx+kDvmmlAhxnNf3gJ01dQJbcNMlVdhVkA9P?=
 =?us-ascii?Q?A6QSpvmh2VdpVbH1SR0EguPimD/JHCUM4MEhZZAW/J1CJcVtBThfgpbTi8GQ?=
 =?us-ascii?Q?ZNzSsvCiC+MMl7UC00QbCUf0HR96lP+ES8hHnd6+Wdq3tvQ5f8/4u/ueVTZb?=
 =?us-ascii?Q?eHsZQDM3Ghv+BPcRvSc0/ozrMM4uWCsgmzxh1RHXLyH/fs0eum9RhW0IFYtG?=
 =?us-ascii?Q?seZgMEnclgWy+jymGHrL3ILUrhM6Sfj3aPF11Sm7ThQMedfbPfG6A2q7H9Z/?=
 =?us-ascii?Q?4k5K2aFgp197JCoFvzAbXaevzW63K1Doxexa7pLKpMFuW5fhYvKK3ukA/YFq?=
 =?us-ascii?Q?qW3qyHFTM3iNYVDlNuu493138Nh3niWW9pL3I1Me1XusxbO6ybYzcnssJg7f?=
 =?us-ascii?Q?ww3rlF5Zh127P30bPUvvQ1av7sjddd+fhLgCS3T/68RYT7NsXLZJ3+uFiere?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb65f239-ccf8-4134-565b-08dbfaa6d2f6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:11:01.5770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RpEt/A/zsF9W80zErFt6sKD7/Rlcv+Hmn2FY4UkxNmyUlcEu8Nb6g5QsUFMjOcBjnn+ojELsHvE0dm+xP8SPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Because a) helper is exported to other parts of the scheduler and
b) there isn't a plain drm_sched_wakeup to begin with, I think we can
drop the suffix and by doing so separate the intimiate knowledge
between the scheduler components a bit better.

(cherry picked from commit f12af4c461fb6cd5ed7b48f8b4d09b22eb19fcc5)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231102105538.391648-6-tvrtko.ursulin@linux.intel.com
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c   | 4 ++--
 include/drm/gpu_scheduler.h              | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 409e4256f6e7..f1db63cc8198 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -370,7 +370,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup_if_can_queue(entity->rq->sched);
+	drm_sched_wakeup(entity->rq->sched);
 }
 
 /**
@@ -602,7 +602,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup_if_can_queue(entity->rq->sched);
+		drm_sched_wakeup(entity->rq->sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index d5ddbce68fb7..27843e37d9b7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -920,12 +920,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_wakeup_if_can_queue - Wake up the scheduler
+ * drm_sched_wakeup - Wake up the scheduler if it is ready to queue
  * @sched: scheduler instance
  *
  * Wake up the scheduler if we can queue jobs.
  */
-void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
 		__drm_sched_run_job_queue(sched);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index c1565694c0e9..43730f1ecbfd 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -558,7 +558,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
-- 
2.43.0

