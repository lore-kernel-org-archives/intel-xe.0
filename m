Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF65C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCF810E03A;
	Tue, 12 Dec 2023 00:10:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646B610E03A
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702339856; x=1733875856; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=2osjlutTAAU+8xg2Nyg+i8/CEh1iCm/87zJV8W1zEN8=;
 b=Uz9SOzFHI4Bk16ZP1UTDqOJc8j0duEZmuyCdBot3Uc5ab5hYIDi7k9ag
 +77a+k1ox9qPzsatECtFpXl2jC1eDJY4a8zOnVMjsrtoYe2tRBvNavbRA
 mIXuwtNjbX21oBo9s/BN/oiQ0B5DEHH2yj2CSXoYBinW8iXbSXavaNjPc
 o7BnE+yn0x2GJENSFJoyybSXR4QA3jT4E1BjUuMEba5YqDodFEwCl5U5S
 FiTFYhMdQFbCRskZAIqgrFwih72d7R0k8tIFW3JwsdVJmu/syPYMtMO6d
 b9H9tjBJHmM/5EhbdAWcSND1wATKTbg+uulIUqfLV/rydybGwYpxnuJ73 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8093274"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8093274"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:10:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="917062768"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="917062768"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:10:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:10:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:10:54 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:10:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlQtNLpNCAC3i2wtA3qFdtGTQlg84A3oW6EMYvK3hqLFMo317+pAuTd0YfQ+S6KgFI5DqCnmgS7bWBw6kY8LrYE6V0TGHGedq67rVlAtGygn7NnqjRVHqOgOErlTFCrrj6UB7yIkbDCoeOrr0rUTGglfjXEvlJbsfgByYWmixy4VcWk0MDbx4EyHMCS1jLxGOxOL56pSXXikO+dcJiTjqnDrgvozie4cn2msKfYBw3axKAo5UK6aFxrydLnRz8fi0zl7mKUIM5qVodDJ+M4O91afTXZl9bZfapZtzbhGJEz1tCqU4oh0Kf2E88dE05nefdgT91dDC7hv9Y2HZdD9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/FuAKtfkvV4l3rUWaOQM+Q7Ij2+WR6YCsj3If/5ObY=;
 b=NsUSBDiQT72U42DMkF7G/Fn/oTmrZIMiA04RO8k5OCAKV25bOHVe30NqN2TwOfqfLhaMxt9oRRr91a4C3CY3s//eBbuvO8JKGpaa/g34Xk4QcBfMBHKy6l/L1RlqU9A/eZ5RtFdP93WrSMiROI/3WvrQFQ/2sJgmD/rauBFc3eKGKwqj3W6e40joC07Qt/QICAyLLQnwOJ3Su+micv2p7Tpwhyo4u6oVQf+UOnLN/3t3emWCGwVi7fELB/0l5UMIdc/9X34FzcXIDtMtlDKG7B0h+1i6H9EaBP53uLwK46pVwRjV6WlAr0v0bV5MbjF6nInMXKqpUnJu8p1bRnhXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 00:10:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:10:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 01/13] drm/sched: Rename drm_sched_get_cleanup_job to be more
 descriptive
Date: Mon, 11 Dec 2023 19:10:33 -0500
Message-ID: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0590c9-ae57-42ff-c9f3-08dbfaa6cb9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nyfm74sR2zYCHzjklLp92DfXEP0rzV+JjCLsDZB96mUQ7RM//l3EhiA7+zIg12iUWsCI+dm5eDrE8Q75FO2wMezASQlnuVQLW6tGFEKbOwUSBhEMKV1fJMfMmXxeH/3d3UnWEyDkOcToQvIQmX9YeEQFBlRzVih0oF3VmIXunCFluqpn0WYQYRPTGBfDVk1ii6Z4GDSLCNOZkgnqW2EdGaEeEFkqg4EzP7NxP4UybwO3pXNAeC8CWF9PJBebxo/2olmg73m2mokUqvJI0tEguJDbKiITDQdvRgXOskV/NTKwWO99Lk9qS6uK9OYqdfD7NFM41VUAly5YLm7mIhdLp5b7th2fDHs0XXnFQlif3dmlAnfYruNw5QxdR4WA5SyIMpPqAtBLsg9GXTFYGqZeeLTgfw5T3/RH0WjKtsk8C/1veZWJSyO9P2Q4dKu4bBOrUtG0tsXEI7jD6z/5gpwEqx8DNMXJ/EbkHxA5Ni7S0psTgt7O8tEZ1PGz9icWdFzhudjySjgNfkvl44gOJU/ucj2WBh3Bt96MfoBRMGJt18sJKT1b1n2aPoWqH87IjHszx17nAe3MqPg7AXymToXDCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(6636002)(66946007)(66556008)(66476007)(82960400001)(36756003)(86362001)(83380400001)(26005)(2616005)(6512007)(6506007)(1076003)(6486002)(966005)(2906002)(316002)(6666004)(478600001)(5660300002)(8676002)(44832011)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kr0loPxwy+93aLfEOGh3jBjKoJQ7kD4oDqUs2RA6uqveEcbkpKBGAmK3ni0E?=
 =?us-ascii?Q?aRb3O8sxbplJs84s3LM2J3NLIoLjMt3JmqDMpJEARQ0sQFYgCvxzLEVKjMDc?=
 =?us-ascii?Q?o9DWkUrM0NYQ5N2M0VWYAEXVur3k3+P6sW3sh8tRbg7iWmyrchgFJpik5Bc8?=
 =?us-ascii?Q?9TVnZBUygj3C0OV1p60ozw6scCEXNA3np/4OdHzQevtCF43NB8c+5X6qC+uz?=
 =?us-ascii?Q?qXwjjwt9KyEiJvc3/eUqcB6bVEOORshIhBxtnC5CgR0d3Wr9dOQQghDl4dLD?=
 =?us-ascii?Q?yHFiQVqcIhmvKX63iZ7OzUnX57LU0bRm1YGF4a098mvjODX3rMs5XHJnR9zr?=
 =?us-ascii?Q?Ycj9XFwDg3xcPKX8p7G97VJcbZzhFhnSuIxqFl+ri8P7jWHl5dXN7xbAoVut?=
 =?us-ascii?Q?+3ycVHSRjOxSYpTjBaEFWYP+RIiPFeLhtB8EXZcX4Nu1qyBY5X0c9nbtjmva?=
 =?us-ascii?Q?4ltgGGtFA5Hpl2kP8WF0Nzlw7BQWU7EgDEDALB/dfmn3gzh2s5BIkZm/O7CF?=
 =?us-ascii?Q?iZVZsN3yZZb430VcWKyi+RfnXWx43wxUU6N69NvrY9DjLFW4Yz8Zqcv8/G7x?=
 =?us-ascii?Q?OZG1frlImS5dMvX0l/IoSicBehEXrQPQspcoIZhOlYlCTwPnEC0w1V0SsdG2?=
 =?us-ascii?Q?ZohcaJRZXBQpjHemUkxk43F/oQfUtlQv4CzGh2jtfxuXKDPhWC3Y53WLanEi?=
 =?us-ascii?Q?AmZnPN5phy5+8Au0Viumr2K8d9VgLFEOFvISL95EM9cL66lPjBR/wHipJTUY?=
 =?us-ascii?Q?1vKn7rsAPA9XkQ7C/L2CIlF4U1uP8UKvZzIcxX43JwXe3sADAUTxZ1CCe96g?=
 =?us-ascii?Q?68M3LMh6yRVePfK9TrUYIEnXbGRpfIv2t4B/V7cZ8gip+Z/Y5jcEa+jQr4gt?=
 =?us-ascii?Q?z8JsNu/jyHs2RIqXnGMm7dVSPf8yJ9OJvPYXfCpMVvJIBpkL8urvM9YRKHTo?=
 =?us-ascii?Q?3JhSMfzv3HgcKyGd0LkMOZK2ud4WlxXvyQS4s/R6X1/2LqpjKP51MfgIc9cA?=
 =?us-ascii?Q?lanQqx1kubpXV2K1E9OeO8xqIT7ZsMP4Ko147fWli1hSgM55XeUYdho4p24R?=
 =?us-ascii?Q?lmFAqS9V8NoGq8TmGMzgxA0xIHueMHG+97JtMmEBvxBBumwbeQRW116tHbqK?=
 =?us-ascii?Q?TwYMxbMgJryZVMSMhHB8BOpEcC3c6v6ZWpMpV98FMtxm6+sSP3ZTEACUi6ZN?=
 =?us-ascii?Q?SoUGj8+cFTtW6PnIKHd1n4DfxJEqBwGviIkJ68QnRGAbqx1uAbwtb+R7eEtg?=
 =?us-ascii?Q?IhIf1ovV2cJqOPlkaUemwW5Hw+f3AJ/wv2I7/RWMJoHLze2wqsjI2DxkJJrA?=
 =?us-ascii?Q?OmaTboAY7I5jmTWH2poWnia/0H8xO5yQgPX65MX0TEvYktFlO52HQGZxZGMU?=
 =?us-ascii?Q?rRx36oqfEnlNgXts/rs8O/GKTr7pEXL42TGHwD9qXUmatJcPDJ9aDqMh7PZB?=
 =?us-ascii?Q?GZuTD4V3dfHcuu0FwBmMxwB9PT7rMvg7F/etwvtKBe2QkJOxoptqJ6vHz8op?=
 =?us-ascii?Q?qXgQREAuLAUedxlUw4jBP6tkYsBcfe5GcIdcqzBmiQZCbWzbX4gRXQ4+pCqt?=
 =?us-ascii?Q?Q7KaZypeie8qYEpfo32THxHAi5+334hm8o5ww8sK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0590c9-ae57-42ff-c9f3-08dbfaa6cb9a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:10:49.2609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpXG2VGq1LPDxJH8R/IxlufB42bX10/7tfOi6ZgvwQPFob44nRydY97btgvn+EWIgR6m4xmO0qRhVZl1F0KRTg==
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

"Get cleanup job" makes it sound like helper is returning a job which will
execute some cleanup, or something, while the kerneldoc itself accurately
says "fetch the next _finished_ job". So lets rename the helper to be self
documenting.

(cherry picked from commit 7abbbe2694b3d4fd366dc91934f42c047a6d282d)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231102105538.391648-2-tvrtko.ursulin@linux.intel.com
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")
Fixes: bc8d6a9df99038 ("drm/sched: Don't disturb the entity when in RR-mode scheduling")
Fixes: 56e449603f0ac5 ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
Link: https://lists.freedesktop.org/archives/dri-devel/2023-November/431606.html
Fixes: f3123c2590005c ("drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()")
---
 drivers/gpu/drm/scheduler/sched_main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 98b2ad54fc70..fb64b35451f5 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -448,7 +448,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
-	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
+	/* Protects against concurrent deletion in drm_sched_get_finished_job */
 	spin_lock(&sched->job_list_lock);
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
@@ -500,9 +500,9 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 
 	/*
 	 * Reinsert back the bad job here - now it's safe as
-	 * drm_sched_get_cleanup_job cannot race against us and release the
+	 * drm_sched_get_finished_job cannot race against us and release the
 	 * bad job at this point - we parked (waited for) any in progress
-	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
+	 * (earlier) cleanups and drm_sched_get_finished_job will not be called
 	 * now until the scheduler thread is unparked.
 	 */
 	if (bad && bad->sched == sched)
@@ -960,7 +960,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_get_cleanup_job - fetch the next finished job to be destroyed
+ * drm_sched_get_finished_job - fetch the next finished job to be destroyed
  *
  * @sched: scheduler instance
  *
@@ -968,7 +968,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
  * ready for it to be destroyed.
  */
 static struct drm_sched_job *
-drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
+drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job, *next;
 
@@ -1059,14 +1059,14 @@ static void drm_sched_free_job_work(struct work_struct *w)
 {
 	struct drm_gpu_scheduler *sched =
 		container_of(w, struct drm_gpu_scheduler, work_free_job);
-	struct drm_sched_job *cleanup_job;
+	struct drm_sched_job *job;
 
 	if (READ_ONCE(sched->pause_submit))
 		return;
 
-	cleanup_job = drm_sched_get_cleanup_job(sched);
-	if (cleanup_job) {
-		sched->ops->free_job(cleanup_job);
+	job = drm_sched_get_finished_job(sched);
+	if (job) {
+		sched->ops->free_job(job);
 
 		drm_sched_free_job_queue_if_done(sched);
 		drm_sched_run_job_queue_if_ready(sched);
-- 
2.43.0

