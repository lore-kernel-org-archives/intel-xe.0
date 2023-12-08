Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9B0C10F05
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E337710EB29;
	Fri,  8 Dec 2023 20:27:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF8E10EB1F
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702067278; x=1733603278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jOh0/4xgwCcSnlJ1omhxi8z49PZ3ZmQJuJLnkyHbQIs=;
 b=Pqpm+0oZAba1Lr21RidB7s6ddGY4XA0B3JC2bTcHaKAe74JvMTjsTYkH
 7YnGFOPP8Tp22kaDQQgrdo5V5yWfw2iAx7/o/42hN7AQKXJRx7YUlyjIS
 JbIudeIVflqapE8gjL//9tHgUoGPEJLwPPeVqiL44TazwKN0Z9/DDyRMz
 F0wH2G+auco4h39lV2WLHp9EttEqLU4Fcbg82vdpq94eDay2Q7sb7SDdY
 Nv5oIIVeQM7NLvcQrRGISsfmHqP19qqAMGXJSL1DUGWVIyBprs+9ezYZT
 miS4z7DL9h+ETtWB5KuJN+HdRMb2oVnLkbCyDlZrRy8JLHx5Jvcnk1DTi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="7786281"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="7786281"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:27:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890259935"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="890259935"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:27:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:27:40 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgUDLThIsIEzhbNJAVup1gStd54uHZ3701trirVT6sMp0yn8jzTC04W9mFWJ6GNMaAa6uqPAdC2T6UlT998nPdouLSI9U2/j21hXuFmXIl+6coEUePkUBz3OfpUtQU+WFWVba6GWrPmWLHC2SBwxYuaXKSDLsread2VJy/tnZUGquKnpfmgwEcZz7CLL2xKZZ5XC4F+F/GDTtC+fmY5IEtNiIYF5uMybYNjKZYRxYjyGvvaA1JRzfZ00/w3uFns352fEuO/GoU/+qk7pyOFOkB/DIjqQXUv6VKaA6C+bVNhGz/ahG5df8m7gf9xX3/VL4wwABjMnPqV/4fQk6elZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8me7gA5xB29K5f+JhP6Vs2r0tUqJvIDj0I56VUdxuM=;
 b=bAwtV6DVzCK7f4PpWai+KeOke7yNBDmWXGfMG9qYFARq07cpIRWTL33YDWlHwZ0z+JH8Ea3foML5wSMH0pddEXO1X4YNnrmQ6negBTHO1Q6SDvJ0797bwaLXLEnyjEHb4aNSXdYf5JRFdunGMNcAHmEpJbvCOIEPxP9IncpG1tWIJHK1BxqZJ03c4Og78RCrJ29Jwy+gnxRWkcZzIQ4M1lBO8AjqXwSKdcfMGrAzxVZk3fAXUC8Dn74Sl8/DA2FVJTnYBn+osWLGE1cWzkUA4j5EhBbIMwJvaZxg3eCxfV2f4wJVeZJ1NUEcGXwvgCow7o/8GshP0Eb3NbU/7rDXzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 20:27:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:27:37 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 04/13] drm/sched: Rename drm_sched_run_job_queue_if_ready and
 clarify kerneldoc
Date: Fri, 8 Dec 2023 15:27:14 -0500
Message-ID: <20231208202723.918082-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0b6833-4877-4862-a9a1-08dbf82c1e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZEGxyiRdgTyfVMP2px/jsRDubUA9Eu15H3e5eePWjv8KBRrBibZeb+WWgc4uKFa36u8QXzp16QWSigbJ0lOvMwOX836L5owy+7UuajMI1PPkpYLQrYEH8uq5LSySxh6T0G/AZUWF5fcacOge5WNjVQ1erNFhnxZ+i3sSpw8WcGzGqAotGPubjg1jkzP8t6J3Ce8IYvpil7yksIxJKZBegG+Fhf6W9Q7uIfIr4OaX3+MPo8XAr7EFP80SoBclpIYp4lSWEctQWQE/N/CQefeb+Irvk+qiUEete+G6ndpzd7UsAmUwzyTA/9NeslA1Tr9fYSpAybf55aMeLqZtnBOPom6TT04QdOSCdUIbaO/AH3z42VIRPn9IbYcrqYEaOYxeod9Vol3VNrJForAs3cjqlXSbHqD5xZPkjQQzS4tGipCmPFxRZT/8XHgFmflHX5UpQfpNI5TQUQQDZXDIHa9e0aVOZ/t6UVvl2DrgQ+lAWWi+b/Mz3UJq91lq6O4Ktzg64LDhqkVL1Ra9VFHq7CyoY1/x63IJYyayurM4SXLHtyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(8676002)(2906002)(86362001)(44832011)(5660300002)(36756003)(8936002)(41300700001)(83380400001)(82960400001)(6512007)(1076003)(6506007)(6666004)(107886003)(2616005)(26005)(38100700002)(54906003)(66556008)(66476007)(6916009)(66946007)(478600001)(966005)(6486002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nE7BLD+RvrtmikUoC5Ct6JWHhnYhooUbLggW9FH3SCUE+iZPx/IOBp8/gNzF?=
 =?us-ascii?Q?ifk2Dp3QQKLS5BDliX2+xxnPVmrRYIoWxgDMNkVGbzoK46gMlH1ewfDyXsoa?=
 =?us-ascii?Q?bQv8iypwu1WHg4CSQ7On6pKbSyMjqHMAFGyaqAlNsaiKzhAGHTm2VIYHO5nv?=
 =?us-ascii?Q?kQay01HUAo2HFgR8j+W7LDFnylpoi3fkE7dlhrnRv5lr1EFeWccxh3jzWO3I?=
 =?us-ascii?Q?BS8OGb9yoe1i/Ez5+XVpKkSS+phDb+UEH5icy/swEPUofk85CCkXr3BY1AMm?=
 =?us-ascii?Q?otBT4Z2CPsfgWJSW24tEUoqEzl1GKRcSydbaghK2QzxGAyxVC2AFRoumFd5S?=
 =?us-ascii?Q?qgFyPpzONktKdp7wW4ZbIjCVRP3oFwF/A20xp00i/uAtnrVONEFjULht+qt4?=
 =?us-ascii?Q?r0+9ozxjtHsQqqYh7pw3RVmGevmq9HLcx/W6ZGdsB7acuPq5XwDJAQaxVXEA?=
 =?us-ascii?Q?XLASCEShBvzn42ODv28aIVLSjsp6FpVcdm8KHO1bTU3kX7Knoa8nFwbV5H1h?=
 =?us-ascii?Q?M/M1X0eG7CZVz+2KmPjcSa/IaRDW71tXB2GRgkxRLOOM4hCh4g/El+Mp4oE1?=
 =?us-ascii?Q?ttRculD0LOBqcSlj3zsTXcxmiu0n08w+7GPd05AWch5UyUS/lX8oWu6hh/y+?=
 =?us-ascii?Q?dNqekOHb6PGVE/gdywAzeighSvhh7SRItgiQQthDfLEYJ+QucxdXFnh3ZiKI?=
 =?us-ascii?Q?ll4y0CPFK0dQfdJGvQ+0r2VzAk5sx99lw0CNeLmty7NOn+V701ShNq/FfyWm?=
 =?us-ascii?Q?gq1DToiSIw2i11/70I//raCZzshlL4ITgFuH0nxyyCFbeYdYb5/3eBp2ivr+?=
 =?us-ascii?Q?yTlhcYS1bkwaD4wdFdIPl/6iPjcj6zg9xr6Kf8kQ4d2e42EH5RxX9qpobSpf?=
 =?us-ascii?Q?6Oy4RNlcww9J+aX1g9nSOT4+P7Iu+XFiLtlfIgr4S+I56wg6u61RC/qJH9h/?=
 =?us-ascii?Q?GGmafLuD66VSbLZepq/wFQElIPaiY+dyrA70kZ9wmY0aL3c7xJtkWZpv0x51?=
 =?us-ascii?Q?PRC5cOwalL+FRGnKYeZDBffBqPH0qszlKIyEgxmlKu9JwqUrqUIGaeOCtk6n?=
 =?us-ascii?Q?NNTlh+dkyDR+fGlmGjmFf2d/962+LazuTa8yvxxnRtC+GmrlKXIckvQCeSZe?=
 =?us-ascii?Q?sWTAhF9CBXL3UbVBEsk3119KNeURJZ34AMEYPaaG1QJUewRFRHJcY8wc17Wu?=
 =?us-ascii?Q?srzyg7nO4vtBe+CCwsXwl/zMxQs5FokVZqjxMKJ4ztJcjkWaOxm4qblMX8uQ?=
 =?us-ascii?Q?4M9vapobR+jY9CCDMavgJn1wECVdCaRqcr5mcBeWgn3GsyAr3mVt+ORD5kWq?=
 =?us-ascii?Q?bivT9ZOWtt+F70p9Hm+tjTN1C4RoLlTXClC8/jJa8F4zx20JvJrmAGzMMvYo?=
 =?us-ascii?Q?nhdMvGBocBgiPPSuS9xXICvRYfRPArGSWJDXdbpeU2JjwHHgN278o7jybktG?=
 =?us-ascii?Q?tn81twcj3NiUHjJ0h1RP1u0ZEm99UU7c72tkI5J4L7Cy+q6lmpQ+PRSjQHPF?=
 =?us-ascii?Q?SGMps6H2iShSs8PFI/u5QvPJhfQeKPMGR3t+tuARcqALxrU7ULV90yMEIEos?=
 =?us-ascii?Q?JmxEVKqyLbzcbxZGYGoTr7llYuJD1mcSX9H8koTbeCUCChsYAuBptsqtpEzJ?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0b6833-4877-4862-a9a1-08dbf82c1e79
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:27:37.8742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/8cdoG9pr6ecMKg8hGJKwuyzEn9tv5fonmg5/a/zTVTU8uPbLwFyoD7k6YZ6YbxhWr3o3/eSFKYXNJU8sWWsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
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
Cc: Luben Tuikov <ltuikov89@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

"If ready" is not immediately clear what it means - is the scheduler
ready or something else? Drop the suffix, clarify kerneldoc, and employ
the same naming scheme as in drm_sched_run_free_queue:

 - drm_sched_run_job_queue   - enqueues if there is something to enqueue
                               *and* scheduler is ready (can queue)
 - __drm_sched_run_job_queue - low-level helper to simply queue the job

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231102105538.391648-5-tvrtko.ursulin@linux.intel.com
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
(cherry picked from commit 35a4279d42db534ad71a3a598029a53f22856f93)
---
 drivers/gpu/drm/scheduler/sched_main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f9baca20b438..d5ddbce68fb7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -256,10 +256,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 }
 
 /**
- * drm_sched_run_job_queue - enqueue run-job work
+ * __drm_sched_run_job_queue - enqueue run-job work
  * @sched: scheduler instance
  */
-static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
+static void __drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 {
 	if (!READ_ONCE(sched->pause_submit))
 		queue_work(sched->submit_wq, &sched->work_run_job);
@@ -928,7 +928,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
-		drm_sched_run_job_queue(sched);
+		__drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -1041,13 +1041,13 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 EXPORT_SYMBOL(drm_sched_pick_best);
 
 /**
- * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
+ * drm_sched_run_job_queue - enqueue run-job work if there are ready entities
  * @sched: scheduler instance
  */
-static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
+static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_select_entity(sched))
-		drm_sched_run_job_queue(sched);
+		__drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -1069,7 +1069,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
 		sched->ops->free_job(job);
 
 	drm_sched_run_free_queue(sched);
-	drm_sched_run_job_queue_if_ready(sched);
+	drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -1126,7 +1126,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	}
 
 	wake_up(&sched->job_scheduled);
-	drm_sched_run_job_queue_if_ready(sched);
+	drm_sched_run_job_queue(sched);
 }
 
 /**
-- 
2.43.0

