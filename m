Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB67C4167D
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30FA10E8D3;
	Thu,  9 Nov 2023 14:59:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2355210E8C4
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541933; x=1731077933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ujzRoNKPq2E+YlxY/PFOwnkZbpW41SdgQWf6oW+U5dY=;
 b=cNvY3WsXDoe1OQCX+m5ibrLqIq+pxZwliZP5PHZswoJTp/qZpM7en6EA
 59xwkDpozaPCqdgKgG+eByJqSgRiZ4XRPdxVheQB1PqCdlcz3MGaulEqc
 7V7C364bwTqGkHgbwCpeNrvoHRWtcHnfx53AJ8vxXUMnBSepV8YbgjIPp
 oZL7uscYitXs82T1Up1lgD7bvEn6AnEqxipezV8XCgJijfAJW5WTetAj5
 c6voEPNog5cAVEHHe1ceGu5yoMo3RMYlOgJ2C2jhGDNaa7lDHoruRC/tE
 W/uRStrLBMIQhrEX3kBuceRzvrhMbawsAf5d+NUHsnrLviCEk2TXp1Hp/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454300286"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="454300286"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4561415"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:29 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:29 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bdg7qCOR5WXwLZT5J7wac9mrESt0gX4JziOMpdWKHzEXeAlKpkAd6BDan8nBL5YnM4znQx0OsAljPSrNRQM//hSo20btMNa5DTBjyZvP72buK3/XMX4vLCmaV7S+x5GFcaaEckctVZ+mIqi8ebyAvAtvgHYPP04U5kWP4cHMcA3e5w8cdtVtAIT2zNEtD9f8qXhL6y7zvfkEtoHTskVDnprFxGD/JfSkW1PNrZe5ZJuX8sZ6iDwE34w25nOvjq3JVvc3EEw1DpM+P5D7GpHezemHzXxfgyyPGwWqjLH4Hs33C7YXFcNjoTT9gUFaYmUTVUpY3IIc7XzkcF/cByFtMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/JQbvSl+z1h8b9pL2eHDAyoTd7Tjf9CVZmOHWkZSqo=;
 b=RSmv4brsDQI5uX5Xp8HphouRmoutgi/OdVpNiUh9EioXTmQJoiTcj/SiEvHA/R62rQBOovGchmzLIxW2+IY68M8ayPXpTV3KNw8Y80dmKdThIa8n1mJHs+yw7JjUsFS7oUuOKyl983MU38PRieiz8eEBQzdYMmtVigir2NgPvJ8GX8I8/sXX9ZlZY/fc8h2LDqjtB8YXvsXQ5tZJ66JW44ixEB+5cEkKOOzs0uYA+vJtth5/xFI4CyucDzecXe1omMTjxoMwleaPTgYgAqcW0Rqm6E5tU9Mw6zIVVs3NckhBw7ihAwVC0FJWqZAd7rl9Cajgy2DzLPLV+Y2cZ/RO2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:25 -0500
Message-ID: <20231109145347.345120-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0307.namprd04.prod.outlook.com
 (2603:10b6:303:82::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 4227a497-2301-4cc0-2600-08dbe133c1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dp0qjjoq7H13SNDYkOXfQikiZMim0kpshcmS3+ZcHKZ63eaw/xSYpVavagDswD/6tdez7wSNONoWT3PJ9hVAJV/DKhQLy80Qgmyw7bnliV90DkSb0wgSDc52gACDeckzj3A4M15pRNnkfBmpPngoOtC1eiWYkFdsHwUGsTF3MdBIWAc+Lm26aA6HyDSHDx1dUhpNOpa8yFHmepbOIz5U5wttAAYmyxFDWaQwWaywgDReWKDLgUgz1FmkAWmeajOFMf+zV+/NLqWUuFgqY7uUENuHm7vSfkMJWKYSrkLbjKEigwxbPxXCWmsFJjqUF0KSm0WZv+pu8O8KcJEHfppovaVOsmwSdvpP/RIj9sXdADj3HkpTZTVTl+B3vfDcFMmUhxRiEwWgTKxGEoDEQNnrhuApQjpMGB3c0rTggxbcPMj0PiM1sdG1yALWcGUl8oAByIZLZ8xyGoEslraLwyl+gKj4bstbNYWif0+T2AcX9HdH0n2jiF/hxW5GSjDtBi2AeUTkFAD/EeYXH/u/hakn0df9JdSHeEbZsCSzs563v851MhAYQbtasdD099MzD+zuasmWTi9I4ktoMcndvlpCVuT/lPM5UBfEO3W++Jec3tA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(26005)(2906002)(82960400001)(41300700001)(8676002)(8936002)(38100700002)(478600001)(4326008)(6486002)(44832011)(86362001)(6506007)(2616005)(66556008)(66946007)(66476007)(316002)(107886003)(6916009)(5660300002)(1076003)(15650500001)(6512007)(36756003)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IS9+/0sQvd3tFuou9CsA/doIu5t+9DSCMElETLttgkNtCm5m/PI0YfIxW0Rt?=
 =?us-ascii?Q?P9PA3g2jTvCf14CfDuRF/Ilspm7fPZX/+3bU9doYiH1FroY1/8U7Mvptch09?=
 =?us-ascii?Q?Qijg/YbXG2pZjqN3aZzIewbl284ocYReOF4bZQc6BrbXor4TbdG4Ag0KXnLg?=
 =?us-ascii?Q?EFDCg6yBzOPE7WLbiedpbDlRJxrr7QQCmtNl0FSC5uItM0ZpdhSefSMJ72S1?=
 =?us-ascii?Q?DmfkAz1yjCFhNWpnFhKBP4+QB6W94WiKJxQ3Q5+X/ulUYr3CGSymwD4rdLlV?=
 =?us-ascii?Q?i8OZdP6K+fg53EL4C6q8GoQ7gQMJKTm+5yjvwKwkasRuQikbLdQMvsUJKUdM?=
 =?us-ascii?Q?1eKv4yAFXzEps3lUtsEBi4AnF6vr183Hi3FN4Se6PW00fE2xp24gpOkFBefW?=
 =?us-ascii?Q?iRrMwuKUd8oQcQtmLGuD9BOTpycgKeMP5N3kA3/AbyOO7zOwIo/ybV/A1Hm+?=
 =?us-ascii?Q?0LL08BUPVIRfJton/W/LbP/43rzHikDAUToI1DBss7h+C4FYS8NJ40wjoffT?=
 =?us-ascii?Q?NwlkGikUaCDJ5cepGr/pUFOPW3+H7T6XdHVXGzGUL/+Q9QIlPqSa71ORxixe?=
 =?us-ascii?Q?jn4xVa3DvFGUQ0G7UpimjHgj/vCxSef/M05Z+x5uYMYkmkxUp1fXrZFMP5eo?=
 =?us-ascii?Q?0Q6Mr/IqORttVNYrsm/QZZDj4V4Cy2LX3wIeVTEl8PWTXHL3/EQd7dqDwn9Q?=
 =?us-ascii?Q?/a1msPZssdqAsqqOR3UkgV/4Mmg+nOcE/wzBSLIbMdE7n//2rRKTQQ/b4Ree?=
 =?us-ascii?Q?ZBRBAXB5QzFaCmya9Naehb5YD4F3HFdG46yREg1/6mR3HIqK9kIMIKetdYA6?=
 =?us-ascii?Q?FzGXN2tcKcqBlmlOk+Tl0W6pLW2mC6T8hAiO3LSlOOBkCXNc315VBxTvrz6N?=
 =?us-ascii?Q?f/gdQ2O2HWcUBzlGG11Ars3WbFfuyjHkwxfkCIXgEWjxLzwfZBig3BEFsCmg?=
 =?us-ascii?Q?c7QrbO51+NE4OdKPtBdlqG5bt89gE44sqEzVWudHSFfEoj34cyqbSlRCNcY7?=
 =?us-ascii?Q?WGiVruL/ix3CtWRUxfz1VAjqYI/kO1BQG9qCuUi9cW7Vsy9HLjt026fBXJiQ?=
 =?us-ascii?Q?ZBl3u6GXyb/rPWYQPWU9oC/pGw6GB8PeegFUnWojW3kjxBtVHYsP8pQA6JNh?=
 =?us-ascii?Q?Qy7qIn1ESv7fNQRxlolCGmdn+wRtSjyW3E39KMlAV1uA7jo6plWNqBsYIiHK?=
 =?us-ascii?Q?mbZcMEraINfPLF/ov6VO/xpnAbyOztYg8OGJMOnC9/Xpog0s/yjU2sD2F0TJ?=
 =?us-ascii?Q?q3lU6iiTaN2weQDFXMr7f6z72tyTMtQ603iloifJB9MEkaNyaw6cglvlrjLO?=
 =?us-ascii?Q?y3fVzXYP7LzyeiiTYM23w3KbfE6w023uT835gbRYge7co/qEXWGhCBnNxXTG?=
 =?us-ascii?Q?XUimN5zKHFie9pgx0s2x3bfv/0rilnri6/HZY/XIaLgFrAZtU1imtymBAIDE?=
 =?us-ascii?Q?EpVIATk01QfdKMRYu6aADvOv+oTRPZgbFqE497xuENFWBWHaKvHcVIHtw0TL?=
 =?us-ascii?Q?ip6CAC43oDGC3YsLgxykGVSe6BDEJurjM1i7feadR7c9VEaWHTh6GH8dSBMN?=
 =?us-ascii?Q?qNvcoMDE0/F2mLdZDMfpe+UDdsCBpFD4PZSRr+miXBeIszxqO2O0rU5Vf8RU?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4227a497-2301-4cc0-2600-08dbe133c1f6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:21.9738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4at/+cpH6heVdptDYYCMFs/hyEvqpEBMhV4mZpUFtH5i/OnzVGU0yiddmQPhwJI5Qek9C323zhvRyQXCPzIZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 07/20] Revert "drm/sched: Add generic scheduler
 message interface"
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 567df7bf2005777a866c3ea15e96368caff69315.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 58 +-------------------------
 include/drm/gpu_scheduler.h            | 29 +------------
 2 files changed, 3 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ca2d7a35eec5..eb389c1f42fc 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1031,54 +1031,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 }
 EXPORT_SYMBOL(drm_sched_pick_best);
 
-/**
- * drm_sched_add_msg - add scheduler message
- *
- * @sched: scheduler instance
- * @msg: message to be added
- *
- * Can and will pass an jobs waiting on dependencies or in a runnable queue.
- * Messages processing will stop if schedule run wq is stopped and resume when
- * run wq is started.
- */
-void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
-		       struct drm_sched_msg *msg)
-{
-	spin_lock(&sched->job_list_lock);
-	list_add_tail(&msg->link, &sched->msgs);
-	spin_unlock(&sched->job_list_lock);
-
-	/*
-	 * Same as above in drm_sched_run_wq_queue, try to kick worker if
-	 * paused, harmless if this races
-	 */
-	if (!sched->pause_run_wq)
-		queue_work(sched->run_wq, &sched->work_run);
-}
-EXPORT_SYMBOL(drm_sched_add_msg);
-
-/**
- * drm_sched_get_msg - get scheduler message
- *
- * @sched: scheduler instance
- *
- * Returns NULL or message
- */
-static struct drm_sched_msg *
-drm_sched_get_msg(struct drm_gpu_scheduler *sched)
-{
-	struct drm_sched_msg *msg;
-
-	spin_lock(&sched->job_list_lock);
-	msg = list_first_entry_or_null(&sched->msgs,
-				       struct drm_sched_msg, link);
-	if (msg)
-		list_del(&msg->link);
-	spin_unlock(&sched->job_list_lock);
-
-	return msg;
-}
-
 /**
  * drm_sched_main - main scheduler thread
  *
@@ -1092,7 +1044,6 @@ static void drm_sched_main(struct work_struct *w)
 
 	while (!READ_ONCE(sched->pause_run_wq)) {
 		struct drm_sched_entity *entity;
-		struct drm_sched_msg *msg;
 		struct drm_sched_fence *s_fence;
 		struct drm_sched_job *sched_job;
 		struct dma_fence *fence;
@@ -1100,16 +1051,12 @@ static void drm_sched_main(struct work_struct *w)
 
 		cleanup_job = drm_sched_get_cleanup_job(sched);
 		entity = drm_sched_select_entity(sched);
-		msg = drm_sched_get_msg(sched);
 
 		if (cleanup_job)
 			sched->ops->free_job(cleanup_job);
 
-		if (msg)
-			sched->ops->process_msg(msg);
-
 		if (!entity) {
-			if (!cleanup_job && !msg)
+			if (!cleanup_job)
 				break;
 			continue;
 		}
@@ -1118,7 +1065,7 @@ static void drm_sched_main(struct work_struct *w)
 
 		if (!sched_job) {
 			complete_all(&entity->entity_idle);
-			if (!cleanup_job && !msg)
+			if (!cleanup_job)
 				break;
 			continue;
 		}
@@ -1192,7 +1139,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
-	INIT_LIST_HEAD(&sched->msgs);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index bb3470e0b16a..e4e103a181c6 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -386,23 +386,6 @@ enum drm_gpu_sched_stat {
 	DRM_GPU_SCHED_STAT_ENODEV,
 };
 
-/**
- * struct drm_sched_msg - an in-band (relative to GPU scheduler run queue)
- * message
- *
- * Generic enough for backend defined messages, backend can expand if needed.
- */
-struct drm_sched_msg {
-	/** @link: list link into the gpu scheduler list of messages */
-	struct list_head		link;
-	/**
-	 * @private_data: opaque pointer to message private data (backend defined)
-	 */
-	void				*private_data;
-	/** @opcode: opcode of message (backend defined) */
-	unsigned int			opcode;
-};
-
 /**
  * struct drm_sched_backend_ops - Define the backend operations
  *	called by the scheduler
@@ -480,12 +463,6 @@ struct drm_sched_backend_ops {
          * and it's time to clean it up.
 	 */
 	void (*free_job)(struct drm_sched_job *sched_job);
-
-	/**
-	 * @process_msg: Process a message. Allowed to block, it is this
-	 * function's responsibility to free message if dynamically allocated.
-	 */
-	void (*process_msg)(struct drm_sched_msg *msg);
 };
 
 /**
@@ -496,7 +473,6 @@ struct drm_sched_backend_ops {
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
  * @sched_rq: priority wise array of run queues.
- * @msgs: list of messages to be processed in @work_run
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
@@ -504,7 +480,7 @@ struct drm_sched_backend_ops {
  * @job_id_count: used to assign unique id to the each job.
  * @run_wq: workqueue used to queue @work_run
  * @timeout_wq: workqueue used to queue @work_tdr
- * @work_run: schedules jobs, cleans up jobs, and processes messages
+ * @work_run: schedules jobs and cleans up entities
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
  * @pending_list: the list of jobs which are currently in the job queue.
@@ -526,7 +502,6 @@ struct drm_gpu_scheduler {
 	long				timeout;
 	const char			*name;
 	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
-	struct list_head		msgs;
 	wait_queue_head_t		job_scheduled;
 	atomic_t			hw_rq_count;
 	atomic64_t			job_id_count;
@@ -577,8 +552,6 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
-void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
-		       struct drm_sched_msg *msg);
 void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
-- 
2.41.0

