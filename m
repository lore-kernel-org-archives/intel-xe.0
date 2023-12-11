Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A144BC4167D
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 19:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6538F10E4EB;
	Mon, 11 Dec 2023 19:13:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439DD10E4E7
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 19:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702322012; x=1733858012;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=C9CwnU/U1a9DeNepWJvwpRyPboFS8BiJdVdwgDPFY3w=;
 b=RrFq+ie2Rv93FF/Qhb++Ezg0LKNbME7fkcqKSDl8RRbW90fKclDMKOev
 2kIufiKIGODjAuKwZCp8a/ZZhl0uLr5tyvd4DGigA01vTtSZXGtaw7BQO
 3r9iYp8AwyTgQC17QtGml4S1FvIJZZQsR8/lRrou5aK7GKL8M6yonSkNn
 XLL5PuCtmZfG9VCTkyhFcrN2kfrmV/L+Al6EBI0hM3uo9lGCXUs0lEk/q
 mWOLq8ZNoCvtBvPY0BpKnjW7a+M7hFZxOrD2LFs0aYfbLxT9jnDiI08i+
 sN2nsGkpXKZpzlhnToxxnw+BCaghfs9FrbfAiuwy2+ZYsQQpHPjJCdiGn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="391866911"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="391866911"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 11:13:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104585654"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="1104585654"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 11:13:31 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:30 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 11:13:30 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUVgGmuSAEAIkzdUUzcewL385cvUi2FqE6/8nyYqIAlvXsExOoZ7iNtdRmUnnuvRHv/Dsfe44GeJPsKwcOATmJ34InAas8xZnlbjpsmoyyyrkcf6I8IFKJ+bgI3nMQzTlLuflPwvVzW7HkQkptK0SnbzmjGy7nnnjoj675QErH5yd2COiFdHm5I0gHAKzIm8nHqjhpjhz4zwT7ufOnfIwd82meX7Cw26KcIHIkOW5iQVM15uS9xSUieew9N5LU+HG/gvKsnHxAm7lRtAWLE22aRxUc3eskDCYiM2hkXnzspRsdWzN37mgjPmIZHRvfp5cOsXC7papR2WJVgDXZ1jxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3QNJFd+RNVMLW2jWm92GKE6XPUR2PmwrEqie/ar2Tg=;
 b=ksaufprOOINrD0CefNefWDCzXDdieny6lIsjOlxAfLtHIInJhkq/ly51b7Sxn7dpi1FnOCa+HwYD7NjqtAJmga52wZ8G0KBrAPSvHTxXK027nvldHCyLvuJuLpFaqxuigMXg8QCcOUN73/mei86SJpxp+31hTBbHiZnp5jE4k4me4mt0wQML6xf+QUQKTd+xO9GOZCPaGh+SPpqOicqgEmTOxvXDcTzsN3oN00Wj28DQQWBpsrKBpwfmuTL6TsWYcJT4sraHztHPsRl2EZnQs4MlqtuC5NxrvmEEAStMu43DBgsDaBMqYRfCVoeJAFI5oLLeKFYz2eWG8j/zFxe0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 19:13:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 19:13:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 05/13] drm/sched: Drop suffix from
 drm_sched_wakeup_if_can_queue
Date: Mon, 11 Dec 2023 14:12:58 -0500
Message-ID: <20231211191306.1069362-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0059.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 367d53bd-6756-4ee4-d0dd-08dbfa7d3f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ID2CvQTqlWBdjt48GmmMxjf89vcyPZWzMsoppu7gqdQupIeMv8jp7IJ+B/ntVUaFiJDdCe8IX2c282JLsXanq0Aqg2UC54x5yyZA/2vMLvtvY2v8A90DInvwYgLyAkZaTAUArDvCRPeJUOS/J5fU+guxYTIu1KTiVvMLrMibpUEc4UdBibnna35foXfgBFRGk0PxQbYJglM281hzjoCLPQUScZBzS8EBr/8PfrwO7MbEKIXP6KsbUHqQfPqPy4HddGUjflSY42QqJHB2SKuXQqRLNJxiAjO53m1pf2Eu06YUqVaEnpeT71UY/TWztN4H+OTkErHVBSWANaG9Ymvcc/39H9CuxGpKIWC2nn13PeFKN5ZQoFv74YQZuuBSidDBy8BU5VGcNRIafRm+oNgV5mGr5YAcUuEezd/s6g9ZY3LUwp+iL33FsocU4arW0ckdKauRx2jWTgIwA8GWzKPR8hVN2Vyr7aCkHXhW89jc6TlZAfdxTre1uMxtRyEF7q6xRXdxnGapKmDC+9sYMW/80/SipcOWuiys5iGIVAJQEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6506007)(6512007)(6666004)(2906002)(6636002)(66556008)(66946007)(66476007)(44832011)(38100700002)(36756003)(86362001)(8676002)(8936002)(316002)(5660300002)(966005)(478600001)(6486002)(41300700001)(82960400001)(26005)(1076003)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m46Ra/OTZ9uRW4YsxwdOvrqUPYbNBIGs6We72guYvkMDSBMt63bLYBlfs0V7?=
 =?us-ascii?Q?6T3rDIeULxXSuREBIP+rj5Asv0fjPqOjj0LrbBjf6fv7XJtQVhViAJshUDeR?=
 =?us-ascii?Q?D0vb60ghPah+eKQsFsRCdCAZ4RwXio9yM8fQU0OWCE8qtqQfWu6xYXlywrIT?=
 =?us-ascii?Q?ql/p4Z4ZxxTXBEVcn+lg2L0DPEEl3KsBkJF1n9AVwboDTymEaCoA+n17Kujo?=
 =?us-ascii?Q?BVzO5UOgIxTCLGnC0U0uI2JX0qi5yAna4R5+z2jbkLlEtrzUaikJzhkb40im?=
 =?us-ascii?Q?3BtRZ+RGCER1hhke88TbJl8m4qJVx+EIC94ejJJ83eXQkKZx3p+p2EhZA2v0?=
 =?us-ascii?Q?RkuFot7omDYeGNmvVLPquemBE9a+vQyLzHV1M3J/YK3kH4uf+OTGkuWoYdvG?=
 =?us-ascii?Q?l1g65nYMDJZcpRvX1woj27buYX5ZxYX0pWfLDb7aa0wKQGRUkdfXL3rpz03Q?=
 =?us-ascii?Q?xO+zGIRFl7dqx0B5vsSEQx1LSA8uIp73z/bmoAsbxZ3mxjPWibETEr+yoZve?=
 =?us-ascii?Q?YsooDbVJGpp8F70wgAdQdkK2/n5Xhbi/oA0Jpzp8K5ge8H03FrzDc81udNWi?=
 =?us-ascii?Q?/DlpJamCEfcpDlhEElmpnix6JiRkwlk+wtNdicAzXagBkfETYxsEsj6U8HAb?=
 =?us-ascii?Q?4A3YjVV2XcU2Q8wlVQfpsIjTdjL8YmCiwoZpt2QND2y5kxEB7GVs31sEzPpT?=
 =?us-ascii?Q?3fT7y4g8XLtb7w5tTqRKq5S1M6lkM+84nt1HeJX+1d1Lrb4jnn5VeDmPlrNN?=
 =?us-ascii?Q?yk/1dhXf88DtS4g7gj5repl4St0536UV9KGpLQVMrweFAP1weYt3rD9a2f+t?=
 =?us-ascii?Q?ECRnCs7/G5d5wCSOeWu3HDRO2Vfcy4O8zjSUj8xarWcLoI3MHYjKAdpouKLP?=
 =?us-ascii?Q?X6lHYv2EARb3mvo2NnNftMQlZSORvUh9IbDBC/5cQbDwkan+mcvy52D4/5Tr?=
 =?us-ascii?Q?ikTo91aCvt3Txa/pvOSENo9YaMQyRvHlK23JAK9qlx78saLe1oO3YU1MEUv+?=
 =?us-ascii?Q?sK3j5lDIgo4fklfC6AbCONwUaUEA1imRC4FUqsogBua/GVcpDkU8PyMdbpR8?=
 =?us-ascii?Q?nPOM/Y3DLuwKxpKO0oey0Vkq2u4JiYtjo9vx9UeEU1yyhxZ0nskiQZAJuJB2?=
 =?us-ascii?Q?szbx8BORv/ZpVRf19w8hPKPbpl3es4Ky6ojb6NQXBi2Y8mj2IU6wvLpp8Eya?=
 =?us-ascii?Q?Iq7A1nbL3Nbh6qUa1NXnN1pyj+CVycOQtyjzUcscT/1rb9AGB4CeKc+AENK5?=
 =?us-ascii?Q?NmHF5Om+W0t9bo1QNHVoP2B0zyV+XMIND8fETgAIOtEWtyGbL+nGurBDPc3X?=
 =?us-ascii?Q?3gd09/mCON//w405O7MjBSaDEip06iqiJaT9ePisBW+bM56NBCTkM12ctvd2?=
 =?us-ascii?Q?pd6++msEXOye16+4hp4K5aHpRkqIQkBV33zDbeBLfLxXc61By+nFi8h/i4X/?=
 =?us-ascii?Q?WK+eM7dniFZDWoQf4DuZLDJGP1ybvXRsHz4KP6UNbXzBbM1VtFEmtGhzaupD?=
 =?us-ascii?Q?eEpDzgFrqX+8R2+EGKRA/BaEkH6TNCOpyo66c+W/eq9Uf/tSAjdyOblJFzDs?=
 =?us-ascii?Q?IxatYWQYWdWJIPPKp6qSIXPIHE6Zyk9pkZ/smIpj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 367d53bd-6756-4ee4-d0dd-08dbfa7d3f42
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 19:13:24.6563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JK7uZIDb/aoFtq1oR+X+UbHbEKvIuTfnbs18BybJd/tP5mB2qB84Lnngor4g09uNXy4C0Ht7OYw1YmWFZA6lCQ==
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

