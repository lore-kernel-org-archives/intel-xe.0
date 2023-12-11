Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABC3C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 19:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAB210E4E7;
	Mon, 11 Dec 2023 19:13:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB5D10E4E9
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 19:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702322012; x=1733858012;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=/Y2f12SDioduIuD+EkQsCKkHRe48o3TYVRiATy/RD3w=;
 b=Mef1oK4G0xLBBc3fH8bM89YPN6w1MjGRAt7hbB8NRwbfdivPdlEnEGNo
 LLXNqbaeLZx2Z37FCPM4YonWdcI5niC/Lafrgh6W6NOQva5jL5E1bA1cB
 9MrtNXSnarMlOXrLQo02nCzbgV1dAgpe2uKSM9VR7do+IT/byA0kKBF8n
 K3vsSlULEnZyHdMe0efSI+g+rNubqfHQrPIpSKJkrHc+347C/NnHV8KWc
 MUyBiQ6ovtZd1QfHIvITOeIGQevI4zx3NHDUKGrqla23KA6JdA72/iZ3o
 eXjVHYC0pgg3ItO7DrQt+Exzd1587BQODVJ8R1OcQxtynSJ1VqztDDmrj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="391866913"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="391866913"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 11:13:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104585657"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="1104585657"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 11:13:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 11:13:31 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRjZiW4dYP7Y81WYX+lbxLZv4fU6oagxxkj6K2NSwtEnzE6owT2nVX445GKyBTv0+WIda3PKUb+A2BU5xHB2kY/sz+bi5qJRUPxYEpvnPJDbgfRWvDD95tupBppJyLQCxe7enmbsLvbtHAr1JI756kdYc7zAljZSc6u9sXnIqfCsSC91rbJqzR70OjIJdmS5Opd7vetDO3uJNjRrlu3Ysie9YthsJQbqrNHE/MJuAt4ndJLfIXWYEr7987Wae8GDCqrCoGObStZEaJI2IuPfC6FSlsmnpX2pHzhgfi/aaV3qaRg7fUoO50xJMTgPGcL4pzTGYzcrk9KUDozUibvdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJU3vpP74qgriU8r34lZtdD9dzVVa8849ftI0KfFZ/c=;
 b=gIHBOV2wW7rGAOdOt50NZt2Dw483pZvgG48L73HoMj94JYOk5WPN8sRktNeSi+FyWExxMCPeZVn5Af7Y8BA6TJNk6vBHrar4zAI6YLEIEOvtoJNzjIwtriLIm/Qour6I9NIkL26OJcD4pIcMabTyYHTKD5L+vxy83xxdBxVbvtZpSup2DtDPEv3L3tuMSXMf02gO2O8OumdNIYyNzhQaGDmYv1wYpuuuDvpJ1PG81gbd2m1IV589aQo5k7aLlid8iwDjQNAi6oW9U29763lqLPn6wepV6+eStVoNPNCzAYBwEaty3+SLmQRBOkV/OR4zyfbv7fUKZFgbgRpxRbKUmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7764.namprd11.prod.outlook.com (2603:10b6:610:145::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Mon, 11 Dec
 2023 19:13:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 19:13:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 06/13] drm/sched: Don't disturb the entity when in RR-mode
 scheduling
Date: Mon, 11 Dec 2023 14:12:59 -0500
Message-ID: <20231211191306.1069362-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0087.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: f2255235-c901-4633-92f0-08dbfa7d4169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bq/JDTbnevY2XF/7+sJS02xeLjzUVxGO8bQe2le9v+hXRZmQJ7GlVY8dhexY3lVXXNLPJdkObRN/gd5XOnlyr12pXwmZ2WNmxshSEGOvICicb332eCe8n21CBo9GvCYqc+F8H/jMKCt1Ipd3n4uvpOSEJByByCnW+RgM5Mq7gY5ZPinO/o+wEnNU/4ykwygNPK8/w251s8Is7RcWhkCK+BGxCO+GO/BcjQ4cJaVf1ch7mMFU5cj1k1zHHXzYfNPpZ9JyDWvdsdB2i9bLlbL2FuJAVFRdpgTn4qSmnqcsMefdTFrSLz/sxUjPeVe12Se9TtZ+vmbecBq0eeJOShtBzu7ia0VETYlcvWTSV4B8xGfwYs+4VaCrpcWW7MuQQ1yPVpdGAy2r/IWA/dkziaJeGntyehu7r681qWo7vQZREGiLehujQqlt6WuzRJ3MaJx1mkeVBxMbuzA2YpbIG9G7yG9TqFoWSdukz3qBJu9lVYX6QO9PVJc+ZpVDr4ohbYvhf2ZhzqBEGa2k+o9urfmXRi/wvH1YaBgZfMnM6myYHKs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(346002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(2906002)(41300700001)(478600001)(82960400001)(6486002)(66556008)(66476007)(6636002)(66946007)(966005)(316002)(38100700002)(6666004)(86362001)(8676002)(8936002)(6506007)(6512007)(44832011)(36756003)(1076003)(5660300002)(26005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XrPdkkIbTIRLvlOME6dRMiM7jwBuuj+R98dfsc0LZuS3gOmuGT03O15PZ+AX?=
 =?us-ascii?Q?I75oIYeKVr/MJ06vlZXO6pdpS1ed7Wn/0XertUDQf36zGFYdPyetTlGRjE9g?=
 =?us-ascii?Q?ZfC8qeWOCGqZkwie5kuiT2nMW5GrxwbwTtHDHwRa2YItnKaqhbhXd3q6lnR2?=
 =?us-ascii?Q?kPJw6coQi4pAmC0F8xkC/DoEko2/qG079TBCi/RjORdIlzAF2sLbALCBv3N6?=
 =?us-ascii?Q?ynfHaeOW9H09S7I7I7wAIVGVcLzDcK5+Y1zpnmgGkvnFv9F1rKpnfwuSqYbL?=
 =?us-ascii?Q?jd0w+cdaROC7+Vy0qaI2TYIn7BVldDnNmDCsRnzdQsjmVSUMbsnnFppE/kDa?=
 =?us-ascii?Q?F4deRLmbnwvo34Lma6aBO+mV3eRPbASoRBUGYMvNhqTooSJEZ3S9Fwxcyif4?=
 =?us-ascii?Q?NprXzjCEItYuRIZuVzPN5Eiuhd0b6m22CKykNHH5BrxVFvNdtg8wreMENGBL?=
 =?us-ascii?Q?rdK5sVeycu6s6DQ+xJR8Z21v/S8d5H0NdaGnpQDT9T/lPz1n4eJl9i872Rk2?=
 =?us-ascii?Q?dfW22ewAv4dI893YnMFzTwvTUDq+WHaTadTLrxGGfY3RK7kF65pdD4iS9Zzj?=
 =?us-ascii?Q?7hyO67HX9QMxVd9m0G0ZJ/NHPPokyQucNuiW15hNxapAx1yco6CXr4OW3a0Q?=
 =?us-ascii?Q?EhTl9b+cTsM34qddeGCOqEulXzblNHvb9j5Km083MtlzBRNcNP2sq0/gHtNm?=
 =?us-ascii?Q?tIPC9R1ySuF0LJnh0Cph/WknBnKfxad+zH/qBRU4xalv99a50kSRlp2A2Abx?=
 =?us-ascii?Q?ZaQfaZ4yM+aYEXSCKkKdQpytRD/OR43ZdIVNprlD+URIW/X9s45WhpAjer07?=
 =?us-ascii?Q?ck9TJH6SWXkq82pkPtjhMppGqb4Ve/j2XOnkG6xT9O041/qb1PZZY+rlm4Rc?=
 =?us-ascii?Q?iOeXUiP/4RtL6uM7BjRQtA9LSJ9fHASF/P1pQZgUXjNmc3njjR/Mp+/WvK5J?=
 =?us-ascii?Q?lF4qck9MR2roU20OxNyPAF6qpOS/QiYw1hHx3zocJYAJLUHc4Tdcsi4mMXz9?=
 =?us-ascii?Q?UvGA7X1tpXHCIogQhxNEUTWL5ttjKFR6syAKC6t2B1BQCLuqk/rbn8OhTIvd?=
 =?us-ascii?Q?MesZO/eiN8BsULoEjZoLqhwKrCreJvj07yQ3Frl0kIKH+BH1hNyw+X/+SQ2N?=
 =?us-ascii?Q?Djd7Ni/LiB4hhszfKNkCKvkF9MAyXTuTNN/uLEtJ1fYhHRw2N5vIm63DR1Vg?=
 =?us-ascii?Q?XAjBEPZcgW9csob10zBuAHQYKpfPlfsmJSpdMG9ZLbGNj1KQrezsLB4mieuV?=
 =?us-ascii?Q?qtuHrh2jw5ZN3aBAje8bpz2MggBoDK0qKpDNsh8KqXJmtBmiG/BKTGuzmn0y?=
 =?us-ascii?Q?Cq0luRPgyEYDGdiOwjAyXL9nKy/31t1Xli0AjXhDBlzII3dm5qHPMg3xqvDp?=
 =?us-ascii?Q?KeDSnGzOmVHyY71IJ0HW95m/2ew4TXY5rEMIxaK64rkBzLF18U4b3Rdx29lm?=
 =?us-ascii?Q?lLWDlpUxDARhL6ND9waC6FUKd+b2XgYnbwP/v/KKQ1dvWlOb2jmDqt/PxoVR?=
 =?us-ascii?Q?b9DNrOL0GS6pPEosus77aqaV/DKoCb0oHxPjjWRLLV+Tbo25eIa7JK9HVddM?=
 =?us-ascii?Q?IBueJqRrZae05tvft/9BP7avBt9C9pW1mwpVsDbX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2255235-c901-4633-92f0-08dbfa7d4169
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 19:13:28.3482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHMRPoBKLxEI9RgIkXd2cljrGQThGJnJZGc1vEfMunkMVkS8C3TowpWUqDRha93p6fU4mOi24J9cq6KuWVf3KA==
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

From: Luben Tuikov <ltuikov89@gmail.com>

Don't call drm_sched_select_entity() in drm_sched_run_job_queue().  In fact,
rename __drm_sched_run_job_queue() to just drm_sched_run_job_queue(), and let
it do just that, schedule the work item for execution.

The problem is that drm_sched_run_job_queue() calls drm_sched_select_entity()
to determine if the scheduler has an entity ready in one of its run-queues,
and in the case of the Round-Robin (RR) scheduling, the function
drm_sched_rq_select_entity_rr() does just that, selects the _next_ entity
which is ready, sets up the run-queue and completion and returns that
entity. The FIFO scheduling algorithm is unaffected.

Now, since drm_sched_run_job_work() also calls drm_sched_select_entity(), then
in the case of RR scheduling, that would result in drm_sched_select_entity()
having been called twice, which may result in skipping a ready entity if more
than one entity is ready. This commit fixes this by eliminating the call to
drm_sched_select_entity() from drm_sched_run_job_queue(), and leaves it only
in drm_sched_run_job_work().

v2: Rebased on top of Tvrtko's renames series of patches. (Luben)
    Add fixes-tag. (Tvrtko)

(cherry picked from commit bc8d6a9df99038f61adf2881ad9f717abe414e06)

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231107041020.10035-2-ltuikov89@gmail.com
---
 drivers/gpu/drm/scheduler/sched_main.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 27843e37d9b7..cd0dc3f81d05 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -256,10 +256,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 }
 
 /**
- * __drm_sched_run_job_queue - enqueue run-job work
+ * drm_sched_run_job_queue - enqueue run-job work
  * @sched: scheduler instance
  */
-static void __drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
+static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 {
 	if (!READ_ONCE(sched->pause_submit))
 		queue_work(sched->submit_wq, &sched->work_run_job);
@@ -928,7 +928,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
-		__drm_sched_run_job_queue(sched);
+		drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 }
 EXPORT_SYMBOL(drm_sched_pick_best);
 
-/**
- * drm_sched_run_job_queue - enqueue run-job work if there are ready entities
- * @sched: scheduler instance
- */
-static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
-{
-	if (drm_sched_select_entity(sched))
-		__drm_sched_run_job_queue(sched);
-}
-
 /**
  * drm_sched_free_job_work - worker to call free_job
  *
-- 
2.43.0

