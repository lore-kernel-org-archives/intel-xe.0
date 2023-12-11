Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717ADC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 19:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3654110E136;
	Mon, 11 Dec 2023 19:13:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B804310E136
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 19:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702322006; x=1733858006;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=WjLkP7atTkU/tNivNKxEGii7tXHJE0x5wahkpSjwrws=;
 b=neK0rUIDI99z37ZzuUiu5BWPSUAH44Cy/mHV1/F3qf3eKbekTrOhDsOt
 eaCh+yXpOr8rZEwxKE1zs96oqgWs/e+Ll2E1AUoD433/nxDElk474rcDm
 6x4GVs3k0PPV6/Ne6JOyz4w5ubi+ZFwhDNMkF4mdjxV/jFuGW+jGCZbaN
 OYW5JCVrqgFstXi8+QUz3fHtWB/OxXXAJMzzhuj+YmDXMgoiWfR4+obgz
 8Uv8ghUvWF2pvB/lPKuAcDgd6kfHrx2JlpHKQTiJ6liUPBraUGqwpPzDN
 MKTCrJPaKyLZ1saWgKEMW/uok/HFKXYB6qKQ12wyt3+MaupaL587Pd1ld A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="16247732"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="16247732"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 11:13:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="896581812"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="896581812"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 11:13:24 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 11:13:23 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxrPts3uSNacv6zaS+cEOpYjwKMLIXJ5JuSRdduJ7YD/O2RobYpQ/gaIvrrJP+Mb3ndeSrfesvVcZ7js/J440IDyG2F3WenQmVt2f7AERFtFVFoj+zv7vCLeM22mtlSEPP67UpdMpEwM1Af6sYN4reBNJSoQGKQu0xpbxe9dnRZb1vps4FjI/2rqoW1UcodFHTZ6rzcqGrUdCnwqhphhwUs5dxgUydqr6rhTUK2p4VVkOIjNh27O7VLS/zlolehUq8U7SNEELgOw0BmK/OEVQow/MnBb6wUeT4tDYeyxoRqSXmM46yW9TMnuchMR56oUgLDEyuaF2G89i13iuEvFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhmJ02PXM63xt1LeTyFdQLsRIOfM0fxfK5xNYxjCyUM=;
 b=XIWiqOWZb67IwgS9UPaEzl/zDe1fba21OctMrpxhY3h5TAXlhDsAl9cBbu3M+1ZXv+ljZjZUrBQNRfj/4bFsVMyV7sSxPDr1S89eAGzA7CLIURUR64m/lI6vSwoFMv5ri5QQPk3S6o6kHeSuN+kXeWTX4ON1j9w1qFgX+sPnZHfhPgJSBHVTq+TRQOnUliZwo3gyoETV3mlPc4HPywLgRrxf1SL5DlB6htZFF+ExPo63oqD8b+b91QFhg4vtnPhjs6GvIwIZlPF5y1EyTMvom5v99fHpNWcHB6MCA+slsjxNGLQqRo81WQ6hI0qkOdoWbTRvk+gJbENo2WZ92toN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 19:13:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 19:13:17 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 03/13] drm/sched: Rename drm_sched_free_job_queue to be more
 descriptive
Date: Mon, 11 Dec 2023 14:12:56 -0500
Message-ID: <20231211191306.1069362-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e937667-2581-40ff-60cb-08dbfa7d3ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k3q1D/fq+KIZTQqSwD/GIUKxMptHX4EG9cu3QMDXnlSYFtqVRXinrD+0bbUAEgv8fLfuLPTZ2cr5ffyooTrx4FbaVD+nni8IN/8wNqYFxgL8xvyKa4q8Y4iYABSXlBhA2pxMXN4B+u+Oq4kBloOViflgDvDklF25/tjKJLGsENOBAHA3hRZTQzgx6dcXiH8n8vy+28ol7dHmRLlYLgg13C4Mmq7elnsI4KJYEuIhv904uu434BG1g1hjUM7kM8uhOQkQ/NjfC0onJTWVhsR6r7TqkIbBFh4rcw3Jq9aYKDvBwDuoMVFytrzbPoFSjPaIwQxEuRCZTFlhe9lPA3/MeaKKtlq2X2I1ZqwJM1UVuwm9RfrEbCoHyEQVelDTO3S0DGeP7dyFFswxTygXC6Bv4qRmV1W7tmoUgw1rcK6DWbKp6gMoFrNWDhv3aTvQAJe36Y/lKswmgW8Fdo8boNzhUPgqkd/oSPT5lcY7NUFL36W+53/pbagg/4robX+uHB4u+Oma5tOt95Cv3LGjVqK/77Ulzu12sKjde8BICYw7AZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6506007)(6512007)(6666004)(2906002)(6636002)(66556008)(66946007)(66476007)(44832011)(38100700002)(36756003)(86362001)(8676002)(8936002)(316002)(5660300002)(966005)(478600001)(6486002)(41300700001)(82960400001)(26005)(1076003)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cxvhceFSm83MJR21OplizJ1Z1GPai8cwmx8Doee+2hu1qrMUoZ3FF+zgaCrN?=
 =?us-ascii?Q?YwE8jFU035I5zKmIycYWG18FcUIT0puVKhe3cgoOZfKWFNzO35Oz3NWnp+Js?=
 =?us-ascii?Q?sffz5NOoqlEMbYLuiCV2gm/ueDapxK/jyrGc7O4BN1MzwVCyd5TUuCM/nn/R?=
 =?us-ascii?Q?3sp2bejufQ668KYRyUm7eI+EqUdNP6lZA0PuZUsHMDvswmYKyxJ6pOnkZ8FI?=
 =?us-ascii?Q?netfUQHobVcBaERdYKH3qWuxZO77Ln8WG4BX9HjYpb+BeKnSG2KIoXe7UPlT?=
 =?us-ascii?Q?1XlojhVVw7HUMWFxjJo/1ktKZYp0hsMgd1+ADNQaLqYOqZJ/quOC7Nnn3I/5?=
 =?us-ascii?Q?mC9/4crfc8FEIh/cJirIw4fMbSa0yt18POxcD52AOpcVLcP++mId6G7R6XW/?=
 =?us-ascii?Q?Z1VfrSb/wO1KRQL3LejqSGOi2n+f/TNAsNZiJXFRoO6gWNOh0iXh3Fs579dz?=
 =?us-ascii?Q?O6Dy04YE+3x2Y+pf+pOcFItDHvkHW9Gud26ux13ylYnDhtJ0XkldeP9XvEAC?=
 =?us-ascii?Q?8ICTrrIVbnpf82O4g/j7QFfMb1gV744XzVs5G2uPjQVJ3wDnv9RF+Xy4+Xbo?=
 =?us-ascii?Q?BYYDjRwah32ctB89H2jlm/PZmZYzL7VYGEwyumVNRD307Ugw8BJh5+Z3TKCL?=
 =?us-ascii?Q?DD6OprZveA9nmOqWDjl99CePn9F+3c4sCcIOesPhK54aHJCuVpFqsjf4xwps?=
 =?us-ascii?Q?aK4JuX3JDSfMqPKx3/ci9WrmaKROTOZSTWe3MmeHDEX5UuNIheaocmKHR6EG?=
 =?us-ascii?Q?/qGggTSy1yvQN9gG03DJ2XyXHlc9tZOA5XOfoO1naA8/m7MLfAhj9LRZyu0F?=
 =?us-ascii?Q?Vrfe8kv5n0B7SeqaJAnMep/EwivMznvZgWICw0bANJxkDLg0MMatY3ps/lgm?=
 =?us-ascii?Q?Fum2Od8mYL1a7RUrcjUROZqSk1lCRFsrtE7IhTNIMw8l6fl5rWINRwtHJzil?=
 =?us-ascii?Q?mxrR3gIxPOJ4h6zzdXaJynhaqd1XmC3JUXbC3ghUPDDLU29hg61d2L9wOiMv?=
 =?us-ascii?Q?bCpj5mpIY67MT+Kt6lDmtjEi1RZUdgPb34UK2M8GmHuDjiVXs5LuXoxROmz6?=
 =?us-ascii?Q?IMsDZx3EioYm2pT6PDVoXxjX6xfvdLSs7pc9DgG1w7ThVLVCf0l9HfESrBgh?=
 =?us-ascii?Q?79SMDKN1FKS/QIYzDAa2wfqQrfT5i/oprmvel/TZY75bkj1o9ZOsIimldUlT?=
 =?us-ascii?Q?40VM5NIXOIz8+9lWSqtIZXIwF8umTqusvYac95yyuhHNWWIBLoGg9Y/nkr8R?=
 =?us-ascii?Q?wHfBWu8XoQqlPvj2e4PPnDXpphO0b9wbu960CUBKw9rWqku18A/gXCnPD4n+?=
 =?us-ascii?Q?5emzV1i32yYiN9TvBlueVhu3svv2Ufy1fjBb9FTZEMBH23s4GIJSUZ9JQFm8?=
 =?us-ascii?Q?O2ZMU8DttwrMWdC3cTL7MrXHWzVhlPaF+8YYgodRUviZTD9eYok/qdVd0DPo?=
 =?us-ascii?Q?J5nZcXf+B8IUfLa+C10mDbbZOfT7YDxP3h/DyuYd1jWEebn/TtYE7+iUdumE?=
 =?us-ascii?Q?vTDW7iPmPPEe2Qq+quju9NfjuMDOsfNWEFQOtNtXQja2I/+eRPCCn3rLSUDu?=
 =?us-ascii?Q?D7IuClaScUTVr16QxzIJbb5Y2kJbYi2+pY+8b9ji?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e937667-2581-40ff-60cb-08dbfa7d3ae9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 19:13:17.3009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMHhh2m25FSK/V6ZW1ENcUMOTiOTZEdGjFmCV1z8UrhV8RvWrMSz8ne/J0A8WETdONS86Nt+lxvLyg5V7mDN7A==
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

The current name makes it sound like helper will free a queue, while what
it does is it enqueues the free job worker.

Rename it to drm_sched_run_free_queue to align with existing
drm_sched_run_job_queue.

Despite that creating an illusion there are two queues, while in reality
there is only one, at least it creates a consistent naming for the two
enqueuing helpers.

At the same time simplify the "if done" helper by dropping the suffix and
adding a double underscore prefix to the one which just enqueues.

(cherry picked from commit 67dd1d8c9f6543661720b9a89e28a25488cb8753)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231102105538.391648-4-tvrtko.ursulin@linux.intel.com
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e1658030613f..f9baca20b438 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -266,20 +266,20 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_free_job_queue - enqueue free-job work
+ * __drm_sched_run_free_queue - enqueue free-job work
  * @sched: scheduler instance
  */
-static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
+static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 {
 	if (!READ_ONCE(sched->pause_submit))
 		queue_work(sched->submit_wq, &sched->work_free_job);
 }
 
 /**
- * drm_sched_free_job_queue_if_done - enqueue free-job work if ready
+ * drm_sched_run_free_queue - enqueue free-job work if ready
  * @sched: scheduler instance
  */
-static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
+static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job;
 
@@ -287,7 +287,7 @@ static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 	if (job && dma_fence_is_signaled(&job->s_fence->finished))
-		drm_sched_free_job_queue(sched);
+		__drm_sched_run_free_queue(sched);
 	spin_unlock(&sched->job_list_lock);
 }
 
@@ -310,7 +310,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	drm_sched_free_job_queue(sched);
+	__drm_sched_run_free_queue(sched);
 }
 
 /**
@@ -1068,7 +1068,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
 	if (job)
 		sched->ops->free_job(job);
 
-	drm_sched_free_job_queue_if_done(sched);
+	drm_sched_run_free_queue(sched);
 	drm_sched_run_job_queue_if_ready(sched);
 }
 
-- 
2.43.0

