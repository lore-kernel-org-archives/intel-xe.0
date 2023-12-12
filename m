Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D949C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B54710E53F;
	Tue, 12 Dec 2023 00:11:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FA710E53C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702339895; x=1733875895;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=MdAv6JhemSKQrnrrVPo+UYKKlwpkhRoD3umig1gyrxc=;
 b=HLxABXZngouIpmMwAjkDYhtUV20lrVXe2ng7YYaB25jXJSVUIU2J/XT2
 kY+qmkPZQcyxxDLTxsxnuQ2CssZbsBtFFwATmLy7sxlXfGAciCHG/MhOg
 KgBtIFubRlHdejboWyR8jzIay+azantUtPyUYq2kUsotD7lHaAi5PxMDQ
 NjF/BKrfCLEn2ihRxK9dVEjGmZMUxwPZxWowL7aCNFP8C7HEwuFXZns7Q
 BXKZyUhoYKk/eubViaTcDGHH9H+A7s/4/mxvMXEVowZkAWUPFr5Gn2KeZ
 bNqf4NplR95egfw05/RcriOFlzAdl17gnUt3g8JPubaaGM1K6vg8ZnogT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8093425"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8093425"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:11:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766586592"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="766586592"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:11:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:17 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:17 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:11:17 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlVAeT8/5uCQ7rhunQeT11rSvXYD4q462mtVkZgQCMzRUHHKETLgOiMuUMpGESlE31aOkqS5Agu6ovN85Ij/WBDrBMsxwPARCOr6V5eihOvZ3T/Hnbc8kSTuiiTx2F+H6e0zj+1RPuyAODMLLRxhzKYQU6C/nycp4Gw9Roa5sAQlat/QNjg0mg1CRx8Ef1ur0EZMRfTTJNCCd1SyCAGsxpGoFiQGu/d7LX6blUj+mjp3jZriAHJPbRePKa4sP26nAYZn3tpP5FUC+0aXLdJlHObrzvL7+DqULa+tKdLU/oFnyODlbku3HZSfv3INi7QB7Pa5KvLuArg9aor6SeiNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Da4piN5ciRUWVxqEI4qMpnUFkNDNUYdlf0ZUvgNoW2M=;
 b=b3ADecg6dTQtFkcjZWQ4cDP0jHEccTkPbBhuy74aS/K1/Bw2HtouCQA/WgJUsVD+0vOfSO3N82lscu0xPtDe6+tBz7imDtoMJkL5gLCfcqWflOSZ54VFv3pPDqZVaqJgt6TGZbMrLhw4eKIRAtPD1OpSthy/rloDh6h2Na+KBoa5MY+QIiq+hg86jwQhQsbe487xDZr+cr3FXOoTcCnA9F0Qa3Bcc44gPFO192aX0fRp66J0SEHTRoOfmgI2ZtMISyT95GL7gNEDqX8c00OM+Q1Sk3oVwimEvw1NpZOVVSreXYd6OJ4uuTBn4MK9MdHbtskuR6hDhVenO1ztOgWvnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 00:10:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:10:58 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 04/13] drm/sched: Rename drm_sched_run_job_queue_if_ready and
 clarify kerneldoc
Date: Mon, 11 Dec 2023 19:10:36 -0500
Message-ID: <20231212001045.1099517-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
References: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0064.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4ebcfc-636a-42b3-ca4b-08dbfaa6d146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ji+d1ZyaD5KfBfirZ2sTMSIi6NVwq4MR7Q+VcZTHKnK5O0dz2R6ULffenYrhv1nhuSB6/Sfpv6HUEsxkW26T9QcIuUkWFgDttZ0Co7fSo2fM0s/+vh1WjYZatXfSiNhYr3qXTqU3U8BAPsPFtLCwCR7yPSS+0G62YzAPGTGj7uG8brWJoxG4NWKvwlAWpX5cHQUwpYv+fogcvp6aUJymPKm6g8GfdH9Rg0nNp3xVPhhp6y7QZZaeIApRDdbUbL3WQ/oTe6Po2nOR6v8B/pND4nJJ3Aku1dj3iZcWoaYAH1Rpay01otCGQPGoES083v1s3MT4FwNIudz7gIN1scrXTa2czfmNPiXV1vEuNpupuUnSWtnIF9evwoQfu5Jxu3OpIk7poMtJqwsjI44gRl8q8HbhnUERAkFTXu7yUQKVeLZSr8ES9hBDFpYmym7FxwPkKhKcYF2mJsiac3ZfHCQ0bZx5MhimDiCPKhSITr2Q5lY8ykoC5sZVXi2eXJ6lH5Z6F7e86Ow4aokKXxbD/1pUwpgUNuJHu6zG1FeV/ft1OmA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(6636002)(66946007)(66556008)(66476007)(82960400001)(36756003)(86362001)(83380400001)(26005)(2616005)(6512007)(6506007)(1076003)(6486002)(966005)(2906002)(316002)(6666004)(478600001)(5660300002)(8676002)(44832011)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?14wGfsj8eSCz+uATOehxJW5X64nxD6zbBBYXdqTsZ1KXF5tKTXCWoLPJzWit?=
 =?us-ascii?Q?Jq+UHf3rga9H8YYfnADBoX9ddpuJAHytHKph79RVVPjHv44Xyw9Io7zCRDvp?=
 =?us-ascii?Q?WCCG26988+5FGsLZX6ugJsrwX1L8/ImyE0q0YoLvPnMOxDxhRF+8d9Ev3I3x?=
 =?us-ascii?Q?LYKr7uYYwb5fiPXWeGRtixBgJPC7QM0NmiZB0rLUWRjgCvywDd3qhcoOsYaL?=
 =?us-ascii?Q?c+GW7HX03E4YE7XuZJA98HdPHdtIEAA2zk1zedjtVaaQUpzy5OsoAiw0JNcy?=
 =?us-ascii?Q?Iy4teJgzN7OAvYxhhK2jzxmCEECS0pobDqn87/p/FwLiugSX11maLqxV7h78?=
 =?us-ascii?Q?fKV3upi6o3BlmJ8Mo9WnurvPBDMd1zheoMSeB/0tnWtSNOZyiFVOPg0C8K85?=
 =?us-ascii?Q?9c0xBWPUFRVmFL/RrZF/x5ApOKmoUKt/yadNsxXv49QRJtuLN0MBV8bJ3c+j?=
 =?us-ascii?Q?FTyNvws0XqHJaGtqJdrhEEPXzm6SG3DbOkVzmKNQeNsbuU1M2uuifmC/QCc8?=
 =?us-ascii?Q?BMK4846Zv/WKgQAHQ0gl8mYEI/2LeLKZTxCnCIp3s/nznefjEjj4mWNV1ouu?=
 =?us-ascii?Q?iXjm92TBcO2Kv3/Xm2rzS8OAPCCSuVFKot6uNnW5dYU2AfG07+oRdh+5FnbM?=
 =?us-ascii?Q?QbUKM8bO+90e2QhwRaTiwuwm+T4ASAJrCxTlwamFiS5DLo20jYtKLy2KDiwc?=
 =?us-ascii?Q?5g6rEojC5x9IjKxpZrjE51qIXqhKx+ypoAhXkaK+CqvArMbiJDw2NaQmL2gb?=
 =?us-ascii?Q?FOJiwqJxUSq7wW2TvJVWqftQQSDvAtTuMq77XjEvFHBQ5vu+0sGqHmImW4w1?=
 =?us-ascii?Q?lsL1GpbIHDDOep8lwbN7vbQp1uNkKmvcJnIYQ9iY2EjXOwFffouJrvEPxe59?=
 =?us-ascii?Q?szTW9oO8cFeAxSPdfbKTxMkuSvB7Pf/IysN4mo80A3v4cYsTUmPpT7mH17rM?=
 =?us-ascii?Q?SyaFYraQRIXXpfiOmhBqPpVFyCrMq7yTIEQbDkscPPGipsA97VDD2yIS+KHJ?=
 =?us-ascii?Q?gAoTpPK62LDdxgPtKmQA7acrwIvo0FiTGFg+eugEf9DksgCnwupdmP4lrTwq?=
 =?us-ascii?Q?CIrx+1ZwTLDtaADJoFWKlMeK9O9TR6KvuXjPOspKHDxic1Iib/3IfkT0h0Ai?=
 =?us-ascii?Q?SOS0y0QvmtI6uEuy60U6OihpMUT5X4JGsY+Tc/jQYKaNwQ3xYg8ZDUap55Dx?=
 =?us-ascii?Q?1rShP8UV+88df9HBgIzFU727lHPcbfSJbBiGPDHDuB5fRqPmPhNBS6Tzzqpf?=
 =?us-ascii?Q?ssc5cMEA0vXiXSxuoS5uE91FQifhrhPP3OL/YIuL/cVxq7rZMYVOQqQmoTkL?=
 =?us-ascii?Q?BrL0J3Tfk8skji7u4ZtTFPab7iXl9rX7/sHBjBLw1KQtPuDAvsrNh6WqUico?=
 =?us-ascii?Q?FwJwUmdxJUZkE2PMKSX84TOwwY0REQy2+Z+H1SZ1ltLqM1YNv0a5en96tFm6?=
 =?us-ascii?Q?8KmbZnXH65GMXXggmSjI5DEOvBFt5EcB1iDHxDilxPaW5Ga1q0nXQuulZ6T9?=
 =?us-ascii?Q?VKj362MF29bxx+8VimGsuJReDSm8+zE7GGvdH6fdHOW3IE/MBfs3pZwFWWoi?=
 =?us-ascii?Q?kkrO5AZEy9rH0OP7mRZ/nD5+jXNyti3k1GglousPd4LIXIu0sT7xE2uA14S3?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4ebcfc-636a-42b3-ca4b-08dbfaa6d146
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:10:58.7521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: boVe80Bd6WlnIauaOnq/Aco1F8KTS1QKxV5UU0u+VN4JZFODen3ZnuvpFuaM2dATYxUzRfI0Ry6mpk7HPkvYBw==
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

