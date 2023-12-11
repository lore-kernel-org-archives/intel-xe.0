Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EFBC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 19:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EBE10E4E0;
	Mon, 11 Dec 2023 19:13:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99A710E4E0
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 19:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702322008; x=1733858008;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=MdAv6JhemSKQrnrrVPo+UYKKlwpkhRoD3umig1gyrxc=;
 b=bl19hA8DVIZHjO4mmO9OCzpS4g/ApPD784ouWUccLKzEKOzkut0dlotU
 5nIPX4nvEVOcV1TbDztjN2AWO/atvtWLEZt35JJzIJEyHlwjcii3Ouh3R
 vjjRuwWLbTt62xbUbPT1EVatKzitMxi01MbeuB1sNsw+HYY+VUmFTiaA9
 LrdBAcWazsOAUb1i5/ZY0eyajpKOnSjATjXKRfM6BV4bWIhMd3YK98oVi
 UGpkGWZQFgvc+dWMRSiR1zD3CDVvdlSQq28oe/7BwxNs51AF8ug/U3HFz
 7JeIGoGyQsHbgUk4cnkQEDGKLWoL9Y5R5nznK8MQ23nnhzJFJLVYRcZJk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="16247738"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="16247738"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 11:13:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="896581826"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="896581826"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 11:13:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 11:13:25 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GITSwhj/S3nITdmV9FD3BRoMPnL+wwoL9vP9kDTLqEjfrPpF7cuvbNHzXUC//oFvr35s4kE3/aW3SvXMVv220PWGGbL5nnMHcGcZJV/PfqmaYSaSMAqSoxv0YKd6gRdHjVzQ4i8s0fysWxHaUIodYw/zNpM1qULVwE4hc3PR4mhxKnVoSTy2rZWeoqe7xH/K1T5aSQPVxFpw4vAZNeN660ydLHKugIgQlxTK8BNJ2vdy5z9VNrZRPp0402bT4VYJiL7i+pVsYDSphU0lMQTfu3ChdFuGgWSXnOqAMQB7i2//8qSr4MI3QYOWWBvg16SILJ2kS22Eo5JGX7Z7fbmKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Da4piN5ciRUWVxqEI4qMpnUFkNDNUYdlf0ZUvgNoW2M=;
 b=Avdx4dkL/TS1h5bngF1OQ2YSyKuJDbN8wZ3xBM+Ze1IF/Oi5dtSIUc2PW4YgzBQcjeEs8jlsm4g7xCImz06UI03r5B4B5hew4IPbd8uEbE8+GLaVUs0/ADuxWUC/hNdtYKEyEnIcEHr0VBYXimDFLCXpLL3OpELK44EWLXI+1DsI0HjFtL+NzsbYWSbm2fsl1Xv9HHbPGysBbob1KvshBeVWNIGHJkMR/oGNCzXl5Rw1QIzEZr661oRS9ep4M2zeVWo8QqnL7YRFShvOn2fsKYE19l4ibaQcsHtLVtv9ni0JNHfaqz5D1fUbges6jnbhVilBPoM0xZfG1UzBlDx/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 19:13:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 19:13:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 04/13] drm/sched: Rename drm_sched_run_job_queue_if_ready and
 clarify kerneldoc
Date: Mon, 11 Dec 2023 14:12:57 -0500
Message-ID: <20231211191306.1069362-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0071.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::48) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: e17fe453-1f93-447f-0ed2-08dbfa7d3d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8UempczuutQV47hTWfy8TVz++YDPLdzaekEKVYlxvsWw3ugXP93C16SlXazGjiYoz/VmR5c1Fvp8KdYZiRK81qG7VPE6OcvhXgdUTGbKlTZku6hYiUumtwjxtdI2tDKraMXd1rfOZdFgvAAt7ER6yozSGkUk2dFXPDlp0LY8cg9wFLqfRjFnfzrfQ2g7JAG84Lr/uWAIKHdXxyRnFeHnDNb1UNCUuvoCAPXaVXaAtz7RebTBTRNlgj2VLtLG6WDoRE3xR7PAG5eLwYFjlqGwfumwWXDcHzHYhJK7n2O9XJNebM4vGzFAPzj3IXxpXcZvH6oT5d/IQkJmnP3sBKmlmvg/qQtUJ9qieVcKG07xglWa5Uy7fj/XMI6+N/+hDyB/859LZtIbPuYac7m6zZGJR1bTpP+0TgdXGqug69DXI+LA771Drzp2rXldOoOeb5miLzvV1eCji5SlSlibalZqlJA3n4dp4urZhjxrkxDaIR7nj100UIoTmOipzLcvFMCI7gyUCXfdLicg+TH65BDdru+r7ctvo5MOS09G4JRvvTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6506007)(6512007)(6666004)(2906002)(6636002)(66556008)(66946007)(66476007)(44832011)(38100700002)(36756003)(86362001)(8676002)(8936002)(316002)(5660300002)(966005)(478600001)(6486002)(41300700001)(82960400001)(26005)(1076003)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GR573beC+9Bxtntj9dpDX5W45ENcMataX14LiHsiO347UeWrcJd+rP9FiRXJ?=
 =?us-ascii?Q?8O5vtvUgcqJVTX4lWGq67/rd7glR7J6KgZZ9yX6zKvcE0IlJnV78Mvu7gssD?=
 =?us-ascii?Q?8SWJkIOSV04ZyCInc5tC1g/FJJ4zex13u46VLrXA4qMhdckfvGjWvB501XK+?=
 =?us-ascii?Q?X8hG8qqSyBH1xqvSE3Qr9Fbdu0F6MlKx69GvFsBERtQIXdcAVjinkTHdYUlg?=
 =?us-ascii?Q?vw0cXjk39fKT+/8bWMwJmwDk/h4I64Ug3RQtFOnKvSg7XtxZp4cN3SSBspFz?=
 =?us-ascii?Q?MH3pqbgCdBLaRFUkveZKyEAYTs/7FhBbnlWBOZLjnolvyuDCXKg7f1r46Oo+?=
 =?us-ascii?Q?jobgt/7NtV8Fs41IrvQypP6b6nsn52D37gG5VxNKT2ylU5LC+WEc3uK6jrst?=
 =?us-ascii?Q?CkG6KVZM+jfrvWZAJi8V3GpSkJ2DTYKFJoi2/SR3dnq7x50Racpk8RK33zCw?=
 =?us-ascii?Q?ZC7DKt+H3kLLxEOhSXIP0/uiyYIpO0nSSSspRzCsAfhyEva3lZ3c85rhQ+2Q?=
 =?us-ascii?Q?jZMiTrKN9tPPiwbe5lA3Cg9qlkmYBbHRYiijtjazFwnrLyvW2t3ANAZry6qY?=
 =?us-ascii?Q?62IQVJ/o4EHvx9gpFSbR1a/KSafRxotC+x15XVn+sA+PM7tCIpzTeLIe2OJN?=
 =?us-ascii?Q?vnzmSWDJiUK1Mi2QOSsdz7Y7o+BJGb4fKInYriPpWzYZ/sxTH2SrO9ac8pnf?=
 =?us-ascii?Q?vlXeEQjTSrdCyLoGxeSUitbqQm7DPsg3Eg2WhBCqxbhxnnt5/KKNny/HLIDj?=
 =?us-ascii?Q?U6bt8wTPtKLecK37ncwGkf1TR4YEgKJSRuR+cQE8ILtF0a8Pu9jBibHFVft1?=
 =?us-ascii?Q?QW4vmWLApd8Y/ZreQoXRpXhwCdYx5E8OPxt3sZt+RkUFxIeW91H+9Ze7NYAO?=
 =?us-ascii?Q?1S33vJz2I+TL4NSh4sICY/ZFLqf38spMEAH7KTmNRGIbPn4bekEfeGLXtp+a?=
 =?us-ascii?Q?+3m1NXv79L4HT/TWRDwrEkDGNjQOvSwBTQkoaxrjivCxiWUDkba0z+MBXKeK?=
 =?us-ascii?Q?VZpco1z8mZsNuRY944DNKFR0dL3lkFPM4N1g47k0FHqqATSWdi5vRdnFZwUb?=
 =?us-ascii?Q?9HjiLYepJcuXVY6y827gENSr/LBjvY/vDKSQ9qr2GgFXk+cjODiKjB5J6Cdi?=
 =?us-ascii?Q?BS8VgJh/7zYTC3wwL2/OttYGVz8+Q6xNRjXT1I99Rh9YyWV0b0WpTTyE5ghS?=
 =?us-ascii?Q?JsydCJYaS1GUiTr4YWHHq6lW7Hvt35dlZ6BBm8GD0RUxFOBeqLDBsIn+RmKb?=
 =?us-ascii?Q?e5kAYeAYNncvtCSmHs7oh/Ji8qU8nbebpNww8e5/waRSlgN6hps8DJ1F2up7?=
 =?us-ascii?Q?slSDjzGoxupXVW8bazSp9jwBDH/Kg8xWkjYEmidDDnIULR+WQZarG5QklXXG?=
 =?us-ascii?Q?qMKg/El/FqbpeO5I3d+kWJq/zt7SRlQfI/RxzoeV2DXQrJxXmUKQRgPJuqfL?=
 =?us-ascii?Q?cxZsPAZCQHQ/n7lJO7pG1vyFxNI3CwbMc4OcpHmB/g2bymShppMFwDClydzJ?=
 =?us-ascii?Q?trseECoR/gEsd37JsxECAzIXqInWNwej3CGJdSjY7byfM74fhZsOZse6UWOb?=
 =?us-ascii?Q?qKJipo2THzzLWlry0LTyNNn6vWstGvCoHZUuYyO8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e17fe453-1f93-447f-0ed2-08dbfa7d3d1c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 19:13:20.9550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoEbOhsSlHtrHWkHj/gg0kwG+Mr/bL0yrwri2UijyJjpzJV6prXwF3CxKgwXr2j0MB983/Wm7Nue25wTdX9NTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
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

"If ready" is not immediately clear what it means - is the scheduler
ready or something else? Drop the suffix, clarify kerneldoc, and employ
the same naming scheme as in drm_sched_run_free_queue:

 - drm_sched_run_job_queue   - enqueues if there is something to enqueue
                               *and* scheduler is ready (can queue)
 - __drm_sched_run_job_queue - low-level helper to simply queue the job

(cherry picked from commit 35a4279d42db534ad71a3a598029a53f22856f93)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231102105538.391648-5-tvrtko.ursulin@linux.intel.com
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
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

