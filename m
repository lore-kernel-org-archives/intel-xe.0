Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E42EC4167D
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 19:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F01A10E4F2;
	Mon, 11 Dec 2023 19:14:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA0710E4F0
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 19:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702322039; x=1733858039;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=zmo+JESsNZUyy7fCGyQFDIgkzwnSxcvaHBD87zm18qE=;
 b=ZHp+/LezGS/QmvdRXi2BbDqNkQWPPRwj5dPagWOYSCYbXpLNz7E6Yknf
 yeGQR25fiZW2U//M0oRyCrHHsVP6UayViUuqcHo7XBR5hRhXYRDOHQnX2
 AnuoovZNjgSIrzG2/QqMdT9uAP/whrbRgC2QPmdwtepZqlqoOnI7ZCNVO
 qtMpKoHpYYL8g1MSqVeOiH2GKuYF+1naP+GjTFd5EP6lB2BKDS8/jixnN
 S1N9UZC4z+JWDRpKNYp1Rsgb5pTw4H95Vcj9Lu2OknSllo3dcmCs2RqhJ
 jAgH6OJuGRhLWyjSuLJNGCVJnJmPLMvKO5ZvP/HLrvL4i0dtOkqhHF8xb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="394446755"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="394446755"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 11:13:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946447618"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="946447618"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 11:13:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 11:13:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/Lx5oKE5zMQBx791WaFMFv11puDibWxuj0m7vUshGiKC59BoJwzXUm7l+g3gjUWYfjs6w0/Uf4g2u2o5rMgWwT2Zjsj4WBa29EdXYMRI25ZIBENDUfRm2Q8pR7J6QBzpWyomTzfdSLJ4CJo+NuZDMJcp/n1MmGu5dgqdHqdf8G8OApTjuM6yFYK/T42Ps6J09k2QQQO9mWP/7WuZyEwSMqjY3l46ChkoSLwtJtGES5PmpLef8lWA3HGFII1f5N3s6U+m7anV96/obNhkoVCLWUQ+neFybl39cIidE9CwnUaJxF/LQFr+Tmt1DbuDwIIrVgkV15mZZlcratOlFSr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AUGsufKKZ3EuOqION/vPgMzINm8Y5uDhqtgxDenlpo=;
 b=EvS5a5nqVgww/fWPs9xzS8ZyJSTBPwlyD6OOnVpQ124jJIop8qcWx1UxmOQi3oxLkM13tHO755Ym0pdQcsrMf/6gHaWJ2SYOBacsQN8X4Iegz+caRntYUNvJFjpb6E3Snf6yrLKOyWUHJ3QyYz6kEuo8dcEAF3GRSsTh1/iTQqHY1YAyUlL4ZMzKMcXBnR/l4nZEjZatLpSC056S6Ii7Sz6hMz3qDGiNd2++clBK3gCNkve/pzdma5+A5TDX0SLeDmuGVB2jGTmcec2dtgUsJDWFBBXc5qJp7vOp7SjQQ9LkcvSZU7rYKBvlVEZpiGcqW7hWtLPJ+0M/1hxkzgM2xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7764.namprd11.prod.outlook.com (2603:10b6:610:145::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Mon, 11 Dec
 2023 19:13:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 19:13:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 13/13] fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
Date: Mon, 11 Dec 2023 14:13:06 -0500
Message-ID: <20231211191306.1069362-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a33234-361f-43e1-6b69-08dbfa7d5082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qg9LrRj/Wqn012ZExInRPNTL0olm1P93RnAKkXMBEB+Xb7TiKnh6C4OLFn1hwYNhYgvpedlZX1dLfsXYHZ5zW8EbFVG4ndtSLp3u7AzE31IPPADzkMj5GSOLJI+4KZxhUN3E4ZL5sE3tqJjrF6YixD+q2IikLUfL+re3KAWwNa28A/9CFt+HJ4sVlh3ceaV2FeCchAzSmG6Lwn7xVQTGVM5em51ZWKj23sCbg1QAOZwE5JE1zbfWRqPz8Es4HAAW0/VA3bt+YQki9JO6UftQNATuG9Egac90ydjYoyarbzk3gKAYx3DcerNrRnLubj+rPs1IdcVyqoPENv8OdqvtCZBGt90CFogL4q0or7EqjzTSpB0g6dmSid4VaQka/Un9Hoi5quXiXPOHMUzd+ftoxmYl4bcaLAKL8BFrbS4tVSfmf6yWPFRVqETbRrB6Z29x/Mn6JOx1P5tIOQXJ/7ivdeacVgFt6qjENCnuQ/+SOZfSqkfN/d2OPHaalMq88Y0fk9K3MzrLCoEcRkpbf7vTmBvLUXJdxhhNo6xESNhxXdH1dCSM1QbbU8TJrO5H8g3T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(346002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(2906002)(41300700001)(478600001)(82960400001)(6486002)(66556008)(66476007)(6636002)(66946007)(316002)(38100700002)(6666004)(86362001)(8676002)(8936002)(6506007)(6512007)(44832011)(36756003)(1076003)(5660300002)(26005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?38XSJZb1S1s9AOZjo/wk10roTdrQDEAq6gVXh893DlLDnv9jIkJZ1B0Rdltg?=
 =?us-ascii?Q?9aUzgVwSOhY4pP+MUb2io9j1gWTUT+nf1cXDoD1cAOZTgUYWJ3aclRTCvh34?=
 =?us-ascii?Q?JRL9wm5ZxIuTfBdJPsU6E/qMLBQTsVB1zUPgxXetJ2xemqcjim/qP2pLiQ9E?=
 =?us-ascii?Q?3g907GUgDi10N2qF4+aRhOuWn0t6HQKae51KYFFDMx2I7xRx6ttJiC60mHGM?=
 =?us-ascii?Q?MuqQFgMmtH8DvTpTT3FoewWjNv+3X5EgBt4XIb6usa5ktZXkk6Cw+mPCfmeB?=
 =?us-ascii?Q?M7Q84z1JRaLzr6dyCSJuuQKOKpLfbLHferP4bv1Ktqx5FPU88nlXMqI0sXE1?=
 =?us-ascii?Q?JftGKHT+4YeV7DrUtIssnFnBy9HMcaPr1Qz5XmCXhVitVkJioVS09cIiPghq?=
 =?us-ascii?Q?re4YghhbXvJEwxza00G/+xjbCFH1cki4QB3VKSqB/kT0qa/yf9U2eOlUF/kR?=
 =?us-ascii?Q?pcFj5KLypS71dPfrEbnc0fF9AbyoWf/b2HrslfuoxLSpA46qhIeeyaso+qmI?=
 =?us-ascii?Q?T6/SZqJfypMKS4XNWeVjoK9Fqfp4Hd0qaO4+nlz9vB5at+pcTUJI/LW1mah7?=
 =?us-ascii?Q?nNeEFrVndtFe+3HBX2+m3E18hT05XVR8q9EGwLPza25pPKhkd0XTObupOxvr?=
 =?us-ascii?Q?0Tk4cbFnr1XvRj3XgF3JKYmAGrbqvbYQ0YsajkngYsmcqzjDF7mJCKPBWVwx?=
 =?us-ascii?Q?KStMDeE+M3kxDyn09ETIqgYPIfVp2tn8smjv05czg9P2wT2cjrrRnL44VVh6?=
 =?us-ascii?Q?w2Sy8MV4J06eGv+yNekwEcDQKLWDpDsexT3ENejLGmNe7EguxAfTYqT3Qyit?=
 =?us-ascii?Q?Rh5rIVeuMKqzStoUf37kPNqjpsZDT6D4jHqeOnSFG8X26rVlivupW5IX/f3p?=
 =?us-ascii?Q?aAQD0jIfOQvLvcXZXsOpI1JBfrw2MIGWSLmAowOB5DVjxLYzvljBJAUraKkh?=
 =?us-ascii?Q?1hqH+E6Yp8RDtkUbcQ5RfKwlB3XzFq1MYVeIh6ipIslpOLKHYCmHRB2+be+O?=
 =?us-ascii?Q?5v8GzXGSwEpYraUHonrKCqPu6BRP5nYYYA1AVrlSLu+2ci80MMJ+AcrnCX+v?=
 =?us-ascii?Q?xqFsumB3jbKBaUK1xBN2y+5BMKyHcZq7voBw3+X7p1sD89IBpbML52c7IrPA?=
 =?us-ascii?Q?d0N4/BK3KGc5YZq4I7fLePXyVpct4HLFcvAsG/wK1RUTJpnH76uT3iFizU5n?=
 =?us-ascii?Q?NAzIcH93LkSA/YmoIVTDyd4VphuS0CCxVu08Jrock9DVWfCwrSlNMN/iULDk?=
 =?us-ascii?Q?5lQ6/oUNYpkRiRmPsHjlNy/ZIm4f2j2peE1Eqie4e7olblSZsqvNDmC9zWtQ?=
 =?us-ascii?Q?+0SuxpmDBZrJSJwwcpv2N6ioqNFfIGZNggVh/bK6LvWeDugWQIjQciVj5a6n?=
 =?us-ascii?Q?SbXqYnceVXRyjuVssmdyx51U3E2VQevIYDO9N2OUFLVdcUhqIXaGVLlIiSu2?=
 =?us-ascii?Q?91Sht0lP8ixp4So3hiI6P1/XyyfVHLKAthzmBt+EXSHUOhIN5ryUOOkv5f56?=
 =?us-ascii?Q?pncdB+Geq2IQiZNZqaAIbpPR/l4WYIWTqWTvlqfrOptpF/W0ZuSnUjAeG1cc?=
 =?us-ascii?Q?GX/5ZsR2qFFSTBggUZ/v67Jsh8sKYVUaWH2IyKKz/BYz8sIYEBldKH/Y47iq?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a33234-361f-43e1-6b69-08dbfa7d5082
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 19:13:53.3906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrZqjYJ/SYK1XjML5oXkjNYcj/Ps6DT3DDR57kZ8ye6t6vS4b+I+RJuGDwBI4gO8u//UbG2Ub8SgClkObKiKCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7764
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

Adjust to recent drm-scheduler changes that already landed in drm-next

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c          |  6 +++---
 drivers/gpu/drm/xe/xe_execlist.c            |  3 +--
 drivers/gpu/drm/xe/xe_execlist_types.h      |  4 ++--
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       |  2 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c          | 10 +++++-----
 drivers/gpu/drm/xe/xe_migrate.c             |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c           |  2 +-
 8 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 91d67f4da2cc..3cf7f5d3d5e3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -222,14 +222,14 @@ struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id)
 enum drm_sched_priority
 xe_exec_queue_device_get_max_priority(struct xe_device *xe)
 {
-	return capable(CAP_SYS_NICE) ? DRM_SCHED_PRIORITY_HIGH :
-				       DRM_SCHED_PRIORITY_NORMAL;
+	return capable(CAP_SYS_NICE) ? XE_SCHED_PRIORITY_HIGH :
+				       XE_SCHED_PRIORITY_NORMAL;
 }
 
 static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q,
 				   u64 value, bool create)
 {
-	if (XE_IOCTL_DBG(xe, value > DRM_SCHED_PRIORITY_HIGH))
+	if (XE_IOCTL_DBG(xe, value > XE_SCHED_PRIORITY_HIGH))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, value > xe_exec_queue_device_get_max_priority(xe)))
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index e8754adfc52a..e6a94d884115 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -344,8 +344,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 		goto err_free;
 
 	sched = &exl->sched;
-	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_MIN,
-				    &sched, 1, NULL);
+	err = drm_sched_entity_init(&exl->entity, 0, &sched, 1, NULL);
 	if (err)
 		goto err_sched;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
index ee1fccd4ee8b..38bb6f0709c6 100644
--- a/drivers/gpu/drm/xe/xe_execlist_types.h
+++ b/drivers/gpu/drm/xe/xe_execlist_types.h
@@ -10,7 +10,7 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
-#include <drm/gpu_scheduler.h>
+#include <xe_gpu_scheduler_types.h>
 
 struct xe_hw_engine;
 struct xe_execlist_exec_queue;
@@ -20,7 +20,7 @@ struct xe_execlist_port {
 
 	spinlock_t lock;
 
-	struct list_head active[DRM_SCHED_PRIORITY_COUNT];
+	struct list_head active[XE_SCHED_PRIORITY_COUNT];
 
 	u32 last_ctx_id;
 
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index ea785bcd3eb2..10c6bb9c9386 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -63,7 +63,7 @@ static inline int
 xe_sched_entity_init(struct xe_sched_entity *entity,
 		     struct xe_gpu_scheduler *sched)
 {
-	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_MIN,
+	return drm_sched_entity_init(entity, 0,
 				     (struct drm_gpu_scheduler **)&sched,
 				     1, NULL);
 }
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
index 86133835d4d1..941a360af2f5 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -8,6 +8,12 @@
 
 #include <drm/gpu_scheduler.h>
 
+#define XE_SCHED_PRIORITY_LOW		0
+#define XE_SCHED_PRIORITY_NORMAL	1
+#define XE_SCHED_PRIORITY_HIGH		2
+#define XE_SCHED_PRIORITY_KERNEL	3
+#define XE_SCHED_PRIORITY_COUNT		3
+
 /**
  * struct xe_sched_msg - an in-band (relative to GPU scheduler run queue)
  * message
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 46b132ee1d3a..bfa8fb710cdf 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -411,10 +411,10 @@ MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
 #undef MAKE_EXEC_QUEUE_POLICY_ADD
 
 static const int xe_sched_prio_to_guc[] = {
-	[DRM_SCHED_PRIORITY_MIN] = GUC_CLIENT_PRIORITY_NORMAL,
-	[DRM_SCHED_PRIORITY_NORMAL] = GUC_CLIENT_PRIORITY_KMD_NORMAL,
-	[DRM_SCHED_PRIORITY_HIGH] = GUC_CLIENT_PRIORITY_HIGH,
-	[DRM_SCHED_PRIORITY_KERNEL] = GUC_CLIENT_PRIORITY_KMD_HIGH,
+	[XE_SCHED_PRIORITY_LOW] = GUC_CLIENT_PRIORITY_NORMAL,
+	[XE_SCHED_PRIORITY_NORMAL] = GUC_CLIENT_PRIORITY_KMD_NORMAL,
+	[XE_SCHED_PRIORITY_HIGH] = GUC_CLIENT_PRIORITY_HIGH,
+	[XE_SCHED_PRIORITY_KERNEL] = GUC_CLIENT_PRIORITY_KMD_HIGH,
 };
 
 static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
@@ -1227,7 +1227,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	err = xe_sched_entity_init(&ge->entity, sched);
 	if (err)
 		goto err_sched;
-	q->priority = DRM_SCHED_PRIORITY_NORMAL;
+	q->priority = XE_SCHED_PRIORITY_NORMAL;
 
 	if (xe_exec_queue_is_lr(q))
 		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index be2a92dee52c..1d22aac57478 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -398,7 +398,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		return ERR_CAST(m->q);
 	}
 	if (xe->info.has_usm)
-		m->q->priority = DRM_SCHED_PRIORITY_KERNEL;
+		m->q->priority = XE_SCHED_PRIORITY_KERNEL;
 
 	mutex_init(&m->job_mutex);
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index b467d5bfa4ac..a9c7ae815bec 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -104,7 +104,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	kref_init(&job->refcount);
 	xe_exec_queue_get(job->q);
 
-	err = drm_sched_job_init(&job->drm, q->entity, NULL);
+	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL);
 	if (err)
 		goto err_free;
 
-- 
2.43.0

