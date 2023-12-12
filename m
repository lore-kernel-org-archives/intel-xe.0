Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0CFC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE37C10E541;
	Tue, 12 Dec 2023 00:11:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A90910E540
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702339916; x=1733875916;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=a3RKfGnsdcb+8WGmXapiRbhFB5Ftds4mDs7UJ5Lew9U=;
 b=iT9RkJlFMUgjLTtzHqNoRwYhAFnDu/nyvKTk7q7aDTpfYsTf7tM01qgz
 G6zauQQGmBPMOdAZ7LQ6/w1fOutxfzDtjD/VBSgOd8oVbe0+yTYmXBmpY
 Oi+vQKW3FV9BT7suvaifnOuyuE6yUGMnUkWQK5ArcaO1Vn/IK+FYzevFC
 bgKe/1viVnyZ6S0xw+L1lFogiCkDfkK4HchtQe8U1O9bmLr9ii9IDl4bN
 i9Wtv9Q1sK/LRAs2RJaKqpOMfxkek/61C02Xr53dsR5GNkDbZYWETZiZH
 l/GPfoBPML2OuMeaW/u2U3bq9z+VRri2z8/OJFcgOvRm3xjmVgnY4gtGw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8093499"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8093499"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:11:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766586679"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="766586679"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:11:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:32 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:32 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:11:32 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEgctdt6oaod+AH+0+nQgxE7NLUjGeqK1NKuzQrotpaCxgnrEMiDgDgOrSIZ7jTRzOetaKMDVGy1ZDKpdRnCi5r3SodPtghxlBnY4ZbIKGQ8OEToYHK+rYj2Q/OU6oH8h84vuMBmM6eRezQck7YOxmjGYilRScaXcCi3si6MN9xDcUYrbpS+GdyaoTCd3C8Hdd9aB3Cxq5KCauuoGTT7J4oEPKCusY4JPEjQ4VFwsI2Hv9+3a45KAX4SmAR0g0wCOWtyrH+oclVr9XkAtUduZh5+7d9j4Brt4jTOjjB0nMq4AD8cOmHtp8T9uZQVpWfiD0qG06nm9tihp5ybw2xWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/J5Y5oi+wEa3gt0PBuKd2jHYIgpXzQfvqKYusT0kGQ=;
 b=bYs+cV1wm/LjlBHn6QRunZvgVxgyQ38u0TIJm4Gf5O97A9CIXU6UnEBuBREeeaWM9WjAnQ2YZ3pE0lJyvGq7xv+dfsVsXOg29JFw4NrfqynDHzKmHQBKKVJ30FCaaTYZhx5E7Cx7Uri/cpmZNX1+pxwCgCZ785SM8x64xg375scXKm/FU0lAhAdez1h7sXVLJTSNd+vZRcyhiGhzu1zaimxH8+ffaQvLlXkOii55d5Hmck7DMLFVek0pQxtQS0o21OYpWL/n3XNk/M6YFpyTbu1TLoECsQQAzriFtYIPgOpAhyGGduy+skqOblsxVYpbLz8LHSIjTFrWX8CUlqWTDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8394.namprd11.prod.outlook.com (2603:10b6:806:37c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 00:11:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:11:29 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 13/13] fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
Date: Mon, 11 Dec 2023 19:10:45 -0500
Message-ID: <20231212001045.1099517-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
References: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::48) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8394:EE_
X-MS-Office365-Filtering-Correlation-Id: 9523f75d-cf97-47fc-6f80-08dbfaa6e391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: avtdXe9F9pA/K42bCgXJsdPIrid7RtNb+ukPJTzR1hiF5lG83+AMksutHpgKEPFi5uxj6O5F6741s6r2W7AA3oiZdIBNbq32mI9Hzrx8H0IqpI+JUVu1bzC286IGkrYBvzVnEUpLz4fc+gvPwe047Bq/fzM/ndIBY+VxNGTDuLJdThh0OantgV1FkRZd5YhwZmggsevRWMTDRUw3469k+7IvLYVsxv/p1maPXlOLSLbb+2L8Opp0UpumsPu6lkZLoUSpidjjDituhqVBQg+TdMb/91WXFjbF1CypeGWxywwZKXptfvqxOwSOpk87hz2PqHVt8Su7G538l9NkrEjcLNZHClPWwHvZ+/KTnQmY1L7Gsr2I29GouwdGbhtcsorslsPEjlVn23zlIFv0jN0++Kk4wyQRfI9K53JfE0f3uMaW9N0CImTFMMHqB+V9NDFqq3BRlvC+iZ2aj+5Jmd+ULfwnWSR3Zu/UVxU172pJJpPhE1Z6b+tgIH8xMit4aNEwQvYSy7gzzZaRGQjLy/XgU0Wuk6VCPcXQ4e3u+1uDgssPzKwTLYuWgsrGgPS/MuBC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(30864003)(6506007)(6512007)(6666004)(2906002)(6636002)(66556008)(66946007)(66476007)(44832011)(36756003)(86362001)(38100700002)(8676002)(8936002)(5660300002)(316002)(478600001)(6486002)(41300700001)(82960400001)(26005)(1076003)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YiDfoY0DSx/bMVqQmee/Q+RJ3yl0/636AJvOBtKrAjopH4QWTW6KVbqTrSnr?=
 =?us-ascii?Q?wZIG7zhSZcucrxTV4Lgzl2LcBoOfZ//p553U0EUH3yLUP+yLkooGTP9d5W3P?=
 =?us-ascii?Q?e6vL+x0eyOsYIiAo1k9AtatkyAkzv+lD6xC4u+48Od6pc61gWomH9gDGm/sg?=
 =?us-ascii?Q?uNq8ebQFNJeJ7toa9rzqzC8Zy4PIq+1pMUuRc8j6phhUqf0uqxo9oeqh089E?=
 =?us-ascii?Q?KPXatw/kBZYtrYPyYta5KeqXQOEihhzrbvhjTlptXOCevlDp4m6m2j/6lQXX?=
 =?us-ascii?Q?X0K064n86hHgFWOytDHHA7BTGQtzsDR3OY523VfMX8ZDSLJV1dAUtC5+ZOlO?=
 =?us-ascii?Q?A5I2mFT2BFNwVx6vsuBl27pYvS2+aIWbsiZ3cRYDvL5zxeV3o7ek7gIoImxx?=
 =?us-ascii?Q?/dLSgx7QRHZiCuxulfbQjvnl8YqLnfDVN3uYczzyWr3nlNSY3lH5KQ61sB3Q?=
 =?us-ascii?Q?P7C0e5C3cwTmO9ZfNERCB5v7+L6jKMPF/zdSB2+qk8Skcg46Z74kqS/Lthon?=
 =?us-ascii?Q?2RMKHcYvQzdOrYd3uK+cY8vzdOg24Gqrix0KtSxRNdPugyG3Bu+nuM6JvvmJ?=
 =?us-ascii?Q?G7oQLLv0LrKpXd5JKdy6l5XN0OmZA04imt2cf3vqd1wWvYXRAf0JTAbs8OR3?=
 =?us-ascii?Q?Fp4gbMQZOb2BAtigYW/mvVcy88sUrEefspOU2ctXGmcHzxUU9d+AQ+B0bAeJ?=
 =?us-ascii?Q?VgZuiE1luyfPNn+j295vodyOT5kF9kSq1zE4LxG0veFd95SMiX4reBEFoqw1?=
 =?us-ascii?Q?c8KvbAG/nW0u6fufuaR3Zs6+qJPvj4THoM0swHYyNjtz4lC3CIubNGLFh1VH?=
 =?us-ascii?Q?GoPWe+fI/1iLm77pED9yens2IMuAE5RlLDYF2/XvE7Qk80/s1RogkiLwhqDk?=
 =?us-ascii?Q?EFpcerIl4x+SkGnfcQCYRJ/GXpN8sfgJC2tzsGaRo5UJ+d0TLPuNeQXI8N+k?=
 =?us-ascii?Q?iRt7IpceiJM+7iNb27zH4ad1QRXg1g9SXqScoRigBkvq2K/tuzEDeHNGC/4w?=
 =?us-ascii?Q?8gw1H8wT2Wqog/ZjXmRAlJPNRA3tUXy5/0jSHkA0NUTeoY22Ca61s5hq3NAI?=
 =?us-ascii?Q?S5A1a1rIyHGU0veTAYGR1r0vSlvmNHi3z+On6GGKJVU+FmPTnItzVdYqfz+R?=
 =?us-ascii?Q?aTa7Ad9EGp95vRE2HdjjneyS1iwDLgbup0LKglyPBztsJSFw8iXCPy/kDQgq?=
 =?us-ascii?Q?kmfpzQ1M93GveDsQSohZRW5U75lvgx4K/JuEIK2ggJccB/cuzayl0UCJ2lX1?=
 =?us-ascii?Q?tlMJDx28uINQmBaXVUb4wUWgoIzKXd8wsDwYb6EBWtuAml2CaVROQRVzl9TF?=
 =?us-ascii?Q?XuL4ciSkREal6pVE9iCxfRr9Zj1xg790oxM5uicEwWykjExKwS6n6+A4Ht2U?=
 =?us-ascii?Q?2aODrXu60sE8qVwolk/DveGMkkg6OG9ofoxPGbdlqPulrLhyJvpng5hvdNLw?=
 =?us-ascii?Q?fGhtNSh8KBz22lJn/YvuYrEEdrzR8mWtkwh+eyVda4nQ6fhBvREYm/mz3ISH?=
 =?us-ascii?Q?2mGWdKdCconq+VCc50yxnX9MxoRCKg0haFR3OeCxKhY5deiOmqFjjpYLD0eD?=
 =?us-ascii?Q?Tl4h2wZypDbr1Rg6y5wKE+886cZVHzJ/pTzu+o5Jh0sOW2xqAe0+Cp5ZWWzf?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9523f75d-cf97-47fc-6f80-08dbfaa6e391
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:11:29.4906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEbl0fpdloeLvTaWkTQ9/I5kyvBR+6aoJttGQ4PEEvTD9FMAfljVg+bFD3sCyJZptV0R19V8SgcE3kH6sG2UGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8394
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
 drivers/gpu/drm/xe/xe_exec_queue.c          |  8 +++----
 drivers/gpu/drm/xe/xe_exec_queue.h          |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h    | 14 ++++++++++--
 drivers/gpu/drm/xe/xe_execlist.c            | 25 +++++++++------------
 drivers/gpu/drm/xe/xe_execlist_types.h      |  6 ++---
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       |  2 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  1 -
 drivers/gpu/drm/xe/xe_guc_submit.c          | 18 +++++++--------
 drivers/gpu/drm/xe/xe_migrate.c             |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c           |  2 +-
 10 files changed, 43 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 91d67f4da2cc..85bc25fe99ed 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -219,17 +219,17 @@ struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id)
 	return q;
 }
 
-enum drm_sched_priority
+enum xe_exec_queue_priority
 xe_exec_queue_device_get_max_priority(struct xe_device *xe)
 {
-	return capable(CAP_SYS_NICE) ? DRM_SCHED_PRIORITY_HIGH :
-				       DRM_SCHED_PRIORITY_NORMAL;
+	return capable(CAP_SYS_NICE) ? XE_EXEC_QUEUE_PRIORITY_HIGH :
+				       XE_EXEC_QUEUE_PRIORITY_NORMAL;
 }
 
 static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q,
 				   u64 value, bool create)
 {
-	if (XE_IOCTL_DBG(xe, value > DRM_SCHED_PRIORITY_HIGH))
+	if (XE_IOCTL_DBG(xe, value > XE_EXEC_QUEUE_PRIORITY_HIGH))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, value > xe_exec_queue_device_get_max_priority(xe)))
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 8b587d1b2c2c..d959cc4a1a82 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -57,7 +57,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file);
 int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 				     struct drm_file *file);
-enum drm_sched_priority xe_exec_queue_device_get_max_priority(struct xe_device *xe);
+enum xe_exec_queue_priority xe_exec_queue_device_get_max_priority(struct xe_device *xe);
 
 void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
 void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *e);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 5ba47a5cfdbd..6826feb650f3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -21,6 +21,16 @@ struct xe_guc_exec_queue;
 struct xe_hw_engine;
 struct xe_vm;
 
+enum xe_exec_queue_priority {
+	XE_EXEC_QUEUE_PRIORITY_UNSET = -2, /* For execlist usage only */
+	XE_EXEC_QUEUE_PRIORITY_LOW = 0,
+	XE_EXEC_QUEUE_PRIORITY_NORMAL,
+	XE_EXEC_QUEUE_PRIORITY_HIGH,
+	XE_EXEC_QUEUE_PRIORITY_KERNEL,
+
+	XE_EXEC_QUEUE_PRIORITY_COUNT
+};
+
 /**
  * struct xe_exec_queue - Execution queue
  *
@@ -43,7 +53,7 @@ struct xe_exec_queue {
 	/** @class: class of this exec queue */
 	enum xe_engine_class class;
 	/** @priority: priority of this exec queue */
-	enum xe_sched_priority priority;
+	enum xe_exec_queue_priority priority;
 	/**
 	 * @logical_mask: logical mask of where job submitted to exec queue can run
 	 */
@@ -182,7 +192,7 @@ struct xe_exec_queue_ops {
 	void (*fini)(struct xe_exec_queue *q);
 	/** @set_priority: Set priority for exec queue */
 	int (*set_priority)(struct xe_exec_queue *q,
-			    enum drm_sched_priority priority);
+			    enum xe_exec_queue_priority priority);
 	/** @set_timeslice: Set timeslice for exec queue */
 	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
 	/** @set_preempt_timeout: Set preemption timeout for exec queue */
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index e8754adfc52a..d82b50de144e 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -33,8 +33,6 @@
 #define XEHP_SW_CTX_ID_SHIFT  39
 #define XEHP_SW_CTX_ID_WIDTH  16
 
-#define XE_SCHED_PRIORITY_UNSET -2
-
 #define SW_CTX_ID \
 	GENMASK_ULL(SW_CTX_ID_WIDTH + SW_CTX_ID_SHIFT - 1, \
 		    SW_CTX_ID_SHIFT)
@@ -154,7 +152,7 @@ static void __xe_execlist_port_start_next_active(struct xe_execlist_port *port)
 			list_del(&exl->active_link);
 
 			if (xe_execlist_is_idle(exl)) {
-				exl->active_priority = XE_SCHED_PRIORITY_UNSET;
+				exl->active_priority = XE_EXEC_QUEUE_PRIORITY_UNSET;
 				continue;
 			}
 
@@ -202,7 +200,7 @@ static void xe_execlist_port_irq_handler(struct xe_hw_engine *hwe,
 }
 
 static void xe_execlist_port_wake_locked(struct xe_execlist_port *port,
-					 enum drm_sched_priority priority)
+					 enum xe_exec_queue_priority priority)
 {
 	xe_execlist_port_assert_held(port);
 
@@ -215,22 +213,22 @@ static void xe_execlist_port_wake_locked(struct xe_execlist_port *port,
 static void xe_execlist_make_active(struct xe_execlist_exec_queue *exl)
 {
 	struct xe_execlist_port *port = exl->port;
-	enum drm_sched_priority priority = exl->entity.priority;
+	enum xe_exec_queue_priority priority = exl->active_priority;
 
-	XE_WARN_ON(priority == XE_SCHED_PRIORITY_UNSET);
+	XE_WARN_ON(priority == XE_EXEC_QUEUE_PRIORITY_UNSET);
 	XE_WARN_ON(priority < 0);
 	XE_WARN_ON(priority >= ARRAY_SIZE(exl->port->active));
 
 	spin_lock_irq(&port->lock);
 
 	if (exl->active_priority != priority &&
-	    exl->active_priority != XE_SCHED_PRIORITY_UNSET) {
+	    exl->active_priority != XE_EXEC_QUEUE_PRIORITY_UNSET) {
 		/* Priority changed, move it to the right list */
 		list_del(&exl->active_link);
-		exl->active_priority = XE_SCHED_PRIORITY_UNSET;
+		exl->active_priority = XE_EXEC_QUEUE_PRIORITY_UNSET;
 	}
 
-	if (exl->active_priority == XE_SCHED_PRIORITY_UNSET) {
+	if (exl->active_priority == XE_EXEC_QUEUE_PRIORITY_UNSET) {
 		exl->active_priority = priority;
 		list_add_tail(&exl->active_link, &port->active[priority]);
 	}
@@ -344,14 +342,13 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 		goto err_free;
 
 	sched = &exl->sched;
-	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_MIN,
-				    &sched, 1, NULL);
+	err = drm_sched_entity_init(&exl->entity, 0, &sched, 1, NULL);
 	if (err)
 		goto err_sched;
 
 	exl->port = q->hwe->exl_port;
 	exl->has_run = false;
-	exl->active_priority = XE_SCHED_PRIORITY_UNSET;
+	exl->active_priority = XE_EXEC_QUEUE_PRIORITY_UNSET;
 	q->execlist = exl;
 	q->entity = &exl->entity;
 
@@ -378,7 +375,7 @@ static void execlist_exec_queue_fini_async(struct work_struct *w)
 	xe_assert(xe, !xe_device_uc_enabled(xe));
 
 	spin_lock_irqsave(&exl->port->lock, flags);
-	if (WARN_ON(exl->active_priority != XE_SCHED_PRIORITY_UNSET))
+	if (WARN_ON(exl->active_priority != XE_EXEC_QUEUE_PRIORITY_UNSET))
 		list_del(&exl->active_link);
 	spin_unlock_irqrestore(&exl->port->lock, flags);
 
@@ -403,7 +400,7 @@ static void execlist_exec_queue_fini(struct xe_exec_queue *q)
 }
 
 static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
-					    enum drm_sched_priority priority)
+					    enum xe_exec_queue_priority priority)
 {
 	/* NIY */
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
index ee1fccd4ee8b..f94bbf4c53e4 100644
--- a/drivers/gpu/drm/xe/xe_execlist_types.h
+++ b/drivers/gpu/drm/xe/xe_execlist_types.h
@@ -10,7 +10,7 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
-#include <drm/gpu_scheduler.h>
+#include "xe_exec_queue_types.h"
 
 struct xe_hw_engine;
 struct xe_execlist_exec_queue;
@@ -20,7 +20,7 @@ struct xe_execlist_port {
 
 	spinlock_t lock;
 
-	struct list_head active[DRM_SCHED_PRIORITY_COUNT];
+	struct list_head active[XE_EXEC_QUEUE_PRIORITY_COUNT];
 
 	u32 last_ctx_id;
 
@@ -42,7 +42,7 @@ struct xe_execlist_exec_queue {
 
 	struct work_struct fini_async;
 
-	enum drm_sched_priority active_priority;
+	enum xe_exec_queue_priority active_priority;
 	struct list_head active_link;
 };
 
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
index 86133835d4d1..6731b13da8bb 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -53,6 +53,5 @@ struct xe_gpu_scheduler {
 
 #define xe_sched_entity		drm_sched_entity
 #define xe_sched_policy		drm_sched_policy
-#define xe_sched_priority	drm_sched_priority
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 46b132ee1d3a..ad5e19ecd33c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -410,25 +410,25 @@ MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
 MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
 #undef MAKE_EXEC_QUEUE_POLICY_ADD
 
-static const int xe_sched_prio_to_guc[] = {
-	[DRM_SCHED_PRIORITY_MIN] = GUC_CLIENT_PRIORITY_NORMAL,
-	[DRM_SCHED_PRIORITY_NORMAL] = GUC_CLIENT_PRIORITY_KMD_NORMAL,
-	[DRM_SCHED_PRIORITY_HIGH] = GUC_CLIENT_PRIORITY_HIGH,
-	[DRM_SCHED_PRIORITY_KERNEL] = GUC_CLIENT_PRIORITY_KMD_HIGH,
+static const int xe_exec_queue_prio_to_guc[] = {
+	[XE_EXEC_QUEUE_PRIORITY_LOW] = GUC_CLIENT_PRIORITY_NORMAL,
+	[XE_EXEC_QUEUE_PRIORITY_NORMAL] = GUC_CLIENT_PRIORITY_KMD_NORMAL,
+	[XE_EXEC_QUEUE_PRIORITY_HIGH] = GUC_CLIENT_PRIORITY_HIGH,
+	[XE_EXEC_QUEUE_PRIORITY_KERNEL] = GUC_CLIENT_PRIORITY_KMD_HIGH,
 };
 
 static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	struct exec_queue_policy policy;
 	struct xe_device *xe = guc_to_xe(guc);
-	enum xe_sched_priority prio = q->priority;
+	enum xe_exec_queue_priority prio = q->priority;
 	u32 timeslice_us = q->sched_props.timeslice_us;
 	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
 
 	xe_assert(xe, exec_queue_registered(q));
 
 	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
-	__guc_exec_queue_policy_add_priority(&policy, xe_sched_prio_to_guc[prio]);
+	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
 	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
 	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
 
@@ -1227,7 +1227,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	err = xe_sched_entity_init(&ge->entity, sched);
 	if (err)
 		goto err_sched;
-	q->priority = DRM_SCHED_PRIORITY_NORMAL;
+	q->priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
 
 	if (xe_exec_queue_is_lr(q))
 		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
@@ -1293,7 +1293,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 }
 
 static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
-				       enum xe_sched_priority priority)
+				       enum xe_exec_queue_priority priority)
 {
 	struct xe_sched_msg *msg;
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index be2a92dee52c..2ca927f3fb2a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -398,7 +398,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		return ERR_CAST(m->q);
 	}
 	if (xe->info.has_usm)
-		m->q->priority = DRM_SCHED_PRIORITY_KERNEL;
+		m->q->priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
 
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

