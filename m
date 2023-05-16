Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09192C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B6110E25E;
	Tue, 16 May 2023 14:54:57 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2792E10E25E
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684248896; x=1715784896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Q3RNxp7Qib6Q1044twE+3fK5M+AaJ3/8x+6dT2JlPME=;
 b=DqFb3f0KQWL/cPDlXmQ8YF0OSQG24LAOgJ4/kFuXP/S6CDMcGT3f4KqM
 AzaIAHvbrvJIXlgOromjddiyUCRBiP73C1H8VZPjirAp2pHUSuL8J13t3
 TSJYatzpXvsFUEq601gpHWJihwUPKnp4MXJLvxHI5Pis8DVtMOUlIDeRP
 4IOpuyrp2unhZd9+G5pT+YSlZef7znPvZrKn3pmTKzaLNmFsTarK4x4Jq
 DIl7gerD/NXH+ZNqZRq2nN87qJAnz34xl/v0H7rODzr2zZtA7vijJhYdu
 97mdx+OK/AvHsYoDrIu1D6SpgU1GSML23H3DdXPQYobjbQkgoqFY0Tjq6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331114610"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="331114610"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="875651289"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="875651289"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 16 May 2023 07:54:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:54:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 07:54:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 07:54:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkdUKcPqDYFnXlUHYacGOi3EbzX3iogCgjls7P1Sasb+I0yYCkhNE85HEHETjhVDQY7ynYeIoEp/2pGZ5jfJODrwkQxV6+9hSA7i8+Y4KtwQAYdSJhVnpzLf0xQSrXbV2KP1EjZDlSiIyTGseUAaiSVxTQSU9SKP+XYl3ZuCce/1D42bVFhKP5+v/pKzsurjAEgPHVk2Je7M565Wu3mLlTPDh5Zzz+GxHHEFRCQ8P/SHtezM1td2wW2dEaSPIvSyarHMRgqw7zI9Xs4ZMzBt1SZpqNZ2QFbE/KQkm+1+kCxBm4ybbXc3t8UqtivaN3WobnZ+i4juFoAuk04+tVeevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqS/JtJaUGZZuqt5IDvIGsxpZjNoukBnfAbfOA4D2Ow=;
 b=Y1omcryOw1ZdJvoxem8XQJTCitus/eo6m7LMkOxudI8hfncGls0hgCpLl0ZkvXiAZ1Fcls51cZR8xCoCqN2zehUGzFzuYJ6NlOKrM7INrY5PHpFO07EaFSWr6bTbwr+rUGlkovJzzv3zDbai3DFqzAW/QNSr3E3iPRno1WCyhdIBDhol0nWf2FWkPSdlxNyIB5AsjR+Z51jtzk2D2BKS1o5neeYHW54G8VAmetiuV/wX6s4AESmwblyiZLqsqoDDN9tVtcxXN9cWmibMv2vhUlwa4NxFU1b+8FOZPLQNXHTyxOSLzYvjSMHOWyKVkI15+yhAUwolOX0lxFnT+6ok8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 14:54:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 14:54:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 16 May 2023 10:54:12 -0400
Message-ID: <20230516145416.1851984-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 2870ffa1-a769-4a58-6112-08db561d7db4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i3UzC7EnlGLJS/uzS2mCFPPyDOa6LboQprGry8FbS0ARGlq17bnmI05SEKDOqExRf7prDSrINIZtbzS8roAWfAydw3gKyDVwOAlKm+YvqiKKICiTOnTt/KziPS6XxlNjHnyAYN7cCYHpqsuhi1mNP14UU0NKa0kAASf/H1cerxST1p8vNAKo3s93TSazD2jXTGjXJLCDOIOsowSEcqnMItaBBTF3/miJ/2Rd4Qlz0xGQJBrADbYCMz0rBjSn4sYChaQjeLEiF8etJV5a+uH68UFD/I+pbAcrhPZ+J/hsvERZDR9UUdTJWNdkWWcqL9PLXrnuvoLeTiYRxbdVhNKkf2WF8XR0LY/yV3GYTE4BcBFn0eJKgwt1L31atSUZ65AxqwNO8pdMf+abVyEvA2yjYAh0fmFYJCUOr2/XypCsufxpvAfzMEwbhOUaaJbDfWhlfyHKZME2Rax1R8aRuK9MF/H9oCmn/b4R9v3YfeW8TKV7txL0m90iiyG0cI/tcF7jN4ccLYvdYLR7SlOOedQYlJ9LWdAVHfCuBYjs+K/RMshJMEYqmk9iMg8LIwxPUTdS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(44832011)(45080400002)(478600001)(8676002)(86362001)(8936002)(5660300002)(36756003)(2906002)(30864003)(6916009)(66556008)(4326008)(82960400001)(66476007)(66946007)(316002)(41300700001)(38100700002)(186003)(2616005)(107886003)(1076003)(26005)(6512007)(83380400001)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jIsS+FJ/Cs/GUcYFJDswz92Yba305jAaAn8gwtnk9i589wKVWJON5f044/YT?=
 =?us-ascii?Q?AJve4A+lERWoZEhFDlBJJ7n84rZq87NKe+I5tgY/14T6E0OJNJnoI8/kaHsp?=
 =?us-ascii?Q?z2J+l+27TcBSVjElmBO7SwyimZTIu4976R5md4LmTfkS2BOwjTGGNoF8hSbJ?=
 =?us-ascii?Q?QAUQrnwXy5HOJa6j4NG2D/VlO7eBHFvFwOkNpGtC9Rr/+11XFTfFgZwolEGd?=
 =?us-ascii?Q?P0/z5nqYJlGXGVVf6RoPhSm8nXcPctDkN3VPjVIVyKDQ3VKuCuI5YWBwzUjm?=
 =?us-ascii?Q?s7Lvni+nNxFf3l1WqNCRUAl0SDzTSkr1CmzmVx8X3drY0+W+EBUBw96R75o5?=
 =?us-ascii?Q?TfKrUNBh6PJdHS5/7ghstxzuV7PWjPiCwVqySPVVfz/71QfeHHp9cLpjpEqk?=
 =?us-ascii?Q?lGiXgY4jEqu4CUOQjIi81kyqS61FrDgM9M55VdlraI+Y0phXlNTcNq070s2C?=
 =?us-ascii?Q?NXfgXuR0NUfNg5sm/5yYbi/Khb43SqpvSDh59wxI1dYKaZ3WnzWU2Pb3sgy5?=
 =?us-ascii?Q?UvxXIvUah+zS6Es1fo4p0IVjD4O2ppPUgiVNqT+gcHQql4ER6yPua9fVR3lS?=
 =?us-ascii?Q?J84VMyXz/74+TLcn6wIYnFQVGDOpkKKencT8SnHwQcsCiJKMttt3fEPIU4TY?=
 =?us-ascii?Q?wJSNzQjuxArDnArDkGlVa9YJMPF2YBT/6aOGCHjecXmqN4GOr0rgHQnxaFK2?=
 =?us-ascii?Q?naPL04OixcGZs7TCpInDY72Y7ZFLz4Ft6pfkd0Raw8cr/t17kP4DnF7wZGcZ?=
 =?us-ascii?Q?FniDcgA+GjrppD4bkPoKkhq1z7Nv4+J2oqvG5P9CSBYvDcDnDmH5vOlmH/np?=
 =?us-ascii?Q?tTIdaQucihu7OuKm0PJQuPSN01ZVgn1xauGtqiZgOS2/BnmBuj3pimURsFX3?=
 =?us-ascii?Q?EMtr/Y8SB7A/ZRZ1q6y0r9snLEXaqYdxrHxP7p5N5Ka3V8X06aMFDaXtluww?=
 =?us-ascii?Q?PxYrOiYR9XTYaOQxct1ZA4wpqVxL1kFhXRuyvpZl3x0wO4qmqyZn50sp14rt?=
 =?us-ascii?Q?oGKtWt2VoR1SHgDgHEwQVWHn4lTtANjrTvXDsjCiBQ6r/F7f0peFPmAr+EYI?=
 =?us-ascii?Q?1kJUdAlPFgW+tjftSp4vzRV41afJgohpEhPSad/I2qa6olI7sdMjGucgea9W?=
 =?us-ascii?Q?ij28iAAqF4yG8jfLrG6mWCWiN74nkBdZy5IeCtN2+2iySB9PVEIcMbTj8cWc?=
 =?us-ascii?Q?HhmSsdvm7Z/7wI2m5cSy1fxjke+FtXFPzpOp+XXRNzumMlp2nSBEqDaUFDDX?=
 =?us-ascii?Q?CVOEIeEltAPKHXmm+CtljpSbH/q7nECJIDEn8/ctAimwd1XAmgLSzN/yZhNI?=
 =?us-ascii?Q?EXpsRA7Kk6e40jluvXoa2WWjz7+eGwK1p4f5KGb0lTMu0WOUckcHLETrA172?=
 =?us-ascii?Q?Q140DJ+ElgtUwXtB3lQkZJ9e9JZWXrV+6CjritTmjQK1meuUsxLZrbJJkZ4m?=
 =?us-ascii?Q?iTmIKV6UJl5dhycKuZTVpifjJ15mZZqk4eIBpkW2Ej5hf1BAtY3nZ7JAESR+?=
 =?us-ascii?Q?9aw92jCrlG3d9tXFPqmntEi48FKorSYvLsw4ROR1bBAwxrG1R2fnXMtoTebP?=
 =?us-ascii?Q?ipYFPaXnCbgMQXEysmWGFL/lZeGLWUd/839m79op?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2870ffa1-a769-4a58-6112-08db561d7db4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:54:46.9318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HM5wpEDuvhth/ZlL2UFSntrU9wm7UUqbmesQyGHD7tQ6PZx4TjhHnHHHwiTQRqW2suvfvQyohJ9qOeNtjhlhmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 07/11] drm/xe: Convert GuC Engine print to
 snapshot capture and print.
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

The goal is to allow for a snapshot capture to be taken at the time
of the crash, while the print out can happen at a later time through
the exposed devcoredump virtual device.

v2: Handle memory allocation failures. (Matthew)
Do not use GFP_ATOMIC on cases like debugfs prints. (Matthew)
v3: checkpatch
v4: pending_list allocation needs to be atomic because of the
    spin_lock. (Matthew)
    get back to GFP_ATOMIC only. (lockdep).

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c       | 237 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.h       |  10 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h |  91 +++++++++
 3 files changed, 298 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 250e56ee2e75..cc8191dfdf89 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1596,75 +1596,234 @@ int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return 0;
 }
 
-static void guc_engine_wq_print(struct xe_engine *e, struct drm_printer *p)
+static void
+guc_engine_wq_snapshot_capture(struct xe_engine *e,
+			       struct xe_guc_submit_engine_snapshot *snapshot)
 {
 	struct xe_guc *guc = engine_to_guc(e);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct iosys_map map = xe_lrc_parallel_map(e->lrc);
 	int i;
 
+	snapshot->guc.wqi_head = e->guc->wqi_head;
+	snapshot->guc.wqi_tail = e->guc->wqi_tail;
+	snapshot->parallel.wq_desc.head = parallel_read(xe, map, wq_desc.head);
+	snapshot->parallel.wq_desc.tail = parallel_read(xe, map, wq_desc.tail);
+	snapshot->parallel.wq_desc.status = parallel_read(xe, map,
+							  wq_desc.wq_status);
+
+	if (snapshot->parallel.wq_desc.head !=
+	    snapshot->parallel.wq_desc.tail) {
+		for (i = snapshot->parallel.wq_desc.head;
+		     i != snapshot->parallel.wq_desc.tail;
+		     i = (i + sizeof(u32)) % WQ_SIZE)
+			snapshot->parallel.wq[i / sizeof(u32)] =
+				parallel_read(xe, map, wq[i / sizeof(u32)]);
+	}
+}
+
+static void
+guc_engine_wq_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
+			     struct drm_printer *p)
+{
+	int i;
+
 	drm_printf(p, "\tWQ head: %u (internal), %d (memory)\n",
-		   e->guc->wqi_head, parallel_read(xe, map, wq_desc.head));
+		   snapshot->guc.wqi_head, snapshot->parallel.wq_desc.head);
 	drm_printf(p, "\tWQ tail: %u (internal), %d (memory)\n",
-		   e->guc->wqi_tail, parallel_read(xe, map, wq_desc.tail));
-	drm_printf(p, "\tWQ status: %u\n",
-		   parallel_read(xe, map, wq_desc.wq_status));
-	if (parallel_read(xe, map, wq_desc.head) !=
-	    parallel_read(xe, map, wq_desc.tail)) {
-		for (i = parallel_read(xe, map, wq_desc.head);
-		     i != parallel_read(xe, map, wq_desc.tail);
+		   snapshot->guc.wqi_tail, snapshot->parallel.wq_desc.tail);
+	drm_printf(p, "\tWQ status: %u\n", snapshot->parallel.wq_desc.status);
+
+	if (snapshot->parallel.wq_desc.head !=
+	    snapshot->parallel.wq_desc.tail) {
+		for (i = snapshot->parallel.wq_desc.head;
+		     i != snapshot->parallel.wq_desc.tail;
 		     i = (i + sizeof(u32)) % WQ_SIZE)
 			drm_printf(p, "\tWQ[%zu]: 0x%08x\n", i / sizeof(u32),
-				   parallel_read(xe, map, wq[i / sizeof(u32)]));
+				   snapshot->parallel.wq[i / sizeof(u32)]);
 	}
 }
 
-static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
+/**
+ * xe_guc_engine_snapshot_capture - Take a quick snapshot of the GuC Engine.
+ * @e: Xe Engine.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a GuC Submit Engine snapshot object that must be freed by the
+ * caller, using `xe_guc_engine_snapshot_free`.
+ */
+struct xe_guc_submit_engine_snapshot *
+xe_guc_engine_snapshot_capture(struct xe_engine *e)
 {
+	struct xe_guc *guc = engine_to_guc(e);
+	struct xe_device *xe = guc_to_xe(guc);
 	struct drm_gpu_scheduler *sched = &e->guc->sched;
 	struct xe_sched_job *job;
+	struct xe_guc_submit_engine_snapshot *snapshot;
+	int i;
+
+	snapshot = kzalloc(sizeof(*snapshot), GFP_ATOMIC);
+
+	if (!snapshot) {
+		drm_err(&xe->drm, "Skipping GuC Engine snapshot entirely.\n");
+		return NULL;
+	}
+
+	snapshot->guc.id = e->guc->id;
+	memcpy(&snapshot->name, &e->name, sizeof(snapshot->name));
+	snapshot->class = e->class;
+	snapshot->logical_mask = e->logical_mask;
+	snapshot->width = e->width;
+	snapshot->refcount = kref_read(&e->refcount);
+	snapshot->sched_timeout = sched->timeout;
+	snapshot->sched_props.timeslice_us = e->sched_props.timeslice_us;
+	snapshot->sched_props.preempt_timeout_us =
+		e->sched_props.preempt_timeout_us;
+
+	snapshot->lrc = kmalloc_array(e->width, sizeof(struct lrc_snapshot),
+				      GFP_ATOMIC);
+
+	if (!snapshot->lrc) {
+		drm_err(&xe->drm, "Skipping GuC Engine LRC snapshot.\n");
+	} else {
+		for (i = 0; i < e->width; ++i) {
+			struct xe_lrc *lrc = e->lrc + i;
+
+			snapshot->lrc[i].context_desc =
+				lower_32_bits(xe_lrc_ggtt_addr(lrc));
+			snapshot->lrc[i].head = xe_lrc_ring_head(lrc);
+			snapshot->lrc[i].tail.internal = lrc->ring.tail;
+			snapshot->lrc[i].tail.memory =
+				xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
+			snapshot->lrc[i].start_seqno = xe_lrc_start_seqno(lrc);
+			snapshot->lrc[i].seqno = xe_lrc_seqno(lrc);
+		}
+	}
+
+	snapshot->schedule_state = atomic_read(&e->guc->state);
+	snapshot->engine_flags = e->flags;
+
+	snapshot->parallel_execution = xe_engine_is_parallel(e);
+	if (snapshot->parallel_execution)
+		guc_engine_wq_snapshot_capture(e, snapshot);
+
+	spin_lock(&sched->job_list_lock);
+	snapshot->pending_list_size = list_count_nodes(&sched->pending_list);
+	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
+					       sizeof(struct pending_list_snapshot),
+					       GFP_ATOMIC);
+
+	if (!snapshot->pending_list) {
+		drm_err(&xe->drm, "Skipping GuC Engine pending_list snapshot.\n");
+	} else {
+		i = 0;
+		list_for_each_entry(job, &sched->pending_list, drm.list) {
+			snapshot->pending_list[i].seqno =
+				xe_sched_job_seqno(job);
+			snapshot->pending_list[i].fence =
+				dma_fence_is_signaled(job->fence) ? 1 : 0;
+			snapshot->pending_list[i].finished =
+				dma_fence_is_signaled(&job->drm.s_fence->finished)
+				? 1 : 0;
+			i++;
+		}
+	}
+
+	spin_unlock(&sched->job_list_lock);
+
+	return snapshot;
+}
+
+/**
+ * xe_guc_engine_snapshot_print - Print out a given GuC Engine snapshot.
+ * @snapshot: GuC Submit Engine snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given GuC Submit Engine snapshot object.
+ */
+void
+xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
+			     struct drm_printer *p)
+{
 	int i;
 
-	drm_printf(p, "\nGuC ID: %d\n", e->guc->id);
-	drm_printf(p, "\tName: %s\n", e->name);
-	drm_printf(p, "\tClass: %d\n", e->class);
-	drm_printf(p, "\tLogical mask: 0x%x\n", e->logical_mask);
-	drm_printf(p, "\tWidth: %d\n", e->width);
-	drm_printf(p, "\tRef: %d\n", kref_read(&e->refcount));
-	drm_printf(p, "\tTimeout: %ld (ms)\n", sched->timeout);
-	drm_printf(p, "\tTimeslice: %u (us)\n", e->sched_props.timeslice_us);
+	if (!snapshot)
+		return;
+
+	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
+	drm_printf(p, "\tName: %s\n", snapshot->name);
+	drm_printf(p, "\tClass: %d\n", snapshot->class);
+	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
+	drm_printf(p, "\tWidth: %d\n", snapshot->width);
+	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
+	drm_printf(p, "\tTimeout: %ld (ms)\n", snapshot->sched_timeout);
+	drm_printf(p, "\tTimeslice: %u (us)\n",
+		   snapshot->sched_props.timeslice_us);
 	drm_printf(p, "\tPreempt timeout: %u (us)\n",
-		   e->sched_props.preempt_timeout_us);
-	for (i = 0; i < e->width; ++i ) {
-		struct xe_lrc *lrc = e->lrc + i;
+		   snapshot->sched_props.preempt_timeout_us);
 
+	for (i = 0; snapshot->lrc && i < snapshot->width; ++i) {
 		drm_printf(p, "\tHW Context Desc: 0x%08x\n",
-			   lower_32_bits(xe_lrc_ggtt_addr(lrc)));
+			   snapshot->lrc[i].context_desc);
 		drm_printf(p, "\tLRC Head: (memory) %u\n",
-			   xe_lrc_ring_head(lrc));
+			   snapshot->lrc[i].head);
 		drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
-			   lrc->ring.tail,
-			   xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL));
+			   snapshot->lrc[i].tail.internal,
+			   snapshot->lrc[i].tail.memory);
 		drm_printf(p, "\tStart seqno: (memory) %d\n",
-			   xe_lrc_start_seqno(lrc));
-		drm_printf(p, "\tSeqno: (memory) %d\n", xe_lrc_seqno(lrc));
+			   snapshot->lrc[i].start_seqno);
+		drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->lrc[i].seqno);
 	}
-	drm_printf(p, "\tSchedule State: 0x%x\n", atomic_read(&e->guc->state));
-	drm_printf(p, "\tFlags: 0x%lx\n", e->flags);
-	if (xe_engine_is_parallel(e))
-		guc_engine_wq_print(e, p);
+	drm_printf(p, "\tSchedule State: 0x%x\n", snapshot->schedule_state);
+	drm_printf(p, "\tFlags: 0x%lx\n", snapshot->engine_flags);
 
-	spin_lock(&sched->job_list_lock);
+	if (snapshot->parallel_execution)
+		guc_engine_wq_snapshot_print(snapshot, p);
 
-	list_for_each_entry(job, &sched->pending_list, drm.list)
+	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
+	     i++)
 		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
-			   xe_sched_job_seqno(job),
-			   dma_fence_is_signaled(job->fence) ? 1 : 0,
-			   dma_fence_is_signaled(&job->drm.s_fence->finished) ?
-			   1 : 0);
-	spin_unlock(&sched->job_list_lock);
+			   snapshot->pending_list[i].seqno,
+			   snapshot->pending_list[i].fence,
+			   snapshot->pending_list[i].finished);
+}
+
+/**
+ * xe_guc_engine_snapshot_free - Free all allocated objects for a given
+ * snapshot.
+ * @snapshot: GuC Submit Engine snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot)
+{
+	if (!snapshot)
+		return;
+
+	kfree(snapshot->lrc);
+	kfree(snapshot->pending_list);
+	kfree(snapshot);
 }
 
+static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
+{
+	struct xe_guc_submit_engine_snapshot *snapshot;
+
+	snapshot = xe_guc_engine_snapshot_capture(e);
+	xe_guc_engine_snapshot_print(snapshot, p);
+	xe_guc_engine_snapshot_free(snapshot);
+}
+
+/**
+ * xe_guc_submit_print - GuC Submit Print.
+ * @guc: GuC.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function capture and prints snapshots of **all** GuC Engines.
+ */
 void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
 {
 	struct xe_engine *e;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 8002734d6f24..4153c2d22013 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -13,7 +13,6 @@ struct xe_engine;
 struct xe_guc;
 
 int xe_guc_submit_init(struct xe_guc *guc);
-void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
 
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
@@ -27,4 +26,13 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					   u32 len);
 int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
+struct xe_guc_submit_engine_snapshot *
+xe_guc_engine_snapshot_capture(struct xe_engine *e);
+void
+xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
+			     struct drm_printer *p);
+void
+xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot);
+void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index d23759959be9..88e855dae056 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -61,4 +61,95 @@ struct guc_submit_parallel_scratch {
 	u32 wq[WQ_SIZE / sizeof(u32)];
 };
 
+struct lrc_snapshot {
+	u32 context_desc;
+	u32 head;
+	struct {
+		u32 internal;
+		u32 memory;
+	} tail;
+	u32 start_seqno;
+	u32 seqno;
+};
+
+struct pending_list_snapshot {
+	u32 seqno;
+	bool fence;
+	bool finished;
+};
+
+/**
+ * struct xe_guc_submit_engine_snapshot - Snapshot for devcoredump
+ */
+struct xe_guc_submit_engine_snapshot {
+	/** @name: name of this engine */
+	char name[MAX_FENCE_NAME_LEN];
+	/** @class: class of this engine */
+	enum xe_engine_class class;
+	/**
+	 * @logical_mask: logical mask of where job submitted to engine can run
+	 */
+	u32 logical_mask;
+	/** @width: width (number BB submitted per exec) of this engine */
+	u16 width;
+	/** @refcount: ref count of this engine */
+	u32 refcount;
+	/**
+	 * @sched_timeout: the time after which a job is removed from the
+	 * scheduler.
+	 */
+	long sched_timeout;
+
+	/** @sched_props: scheduling properties */
+	struct {
+		/** @timeslice_us: timeslice period in micro-seconds */
+		u32 timeslice_us;
+		/** @preempt_timeout_us: preemption timeout in micro-seconds */
+		u32 preempt_timeout_us;
+	} sched_props;
+
+	/** @lrc: LRC Snapshot */
+	struct lrc_snapshot *lrc;
+
+	/** @schedule_state: Schedule State at the moment of Crash */
+	u32 schedule_state;
+	/** @engine_flags: Flags of the faulty engine */
+	unsigned long engine_flags;
+
+	/** @guc: GuC Engine Snapshot */
+	struct {
+		/** @wqi_head: work queue item head */
+		u32 wqi_head;
+		/** @wqi_tail: work queue item tail */
+		u32 wqi_tail;
+		/** @id: GuC id for this xe_engine */
+		u16 id;
+	} guc;
+
+	/**
+	 * @parallel_execution: Indication if the failure was during parallel
+	 * execution
+	 */
+	bool parallel_execution;
+	/** @parallel: snapshot of the useful parallel scratch */
+	struct {
+		/** @wq_desc: Workqueue description */
+		struct {
+			/** @head: Workqueue Head */
+			u32 head;
+			/** @tail: Workqueue Tail */
+			u32 tail;
+			/** @status: Workqueue Status */
+			u32 status;
+		} wq_desc;
+		/** @wq: Workqueue Items */
+		u32 wq[WQ_SIZE / sizeof(u32)];
+	} parallel;
+
+	/** @pending_list_size: Size of the pending list snapshot array */
+	int pending_list_size;
+	/** @pending_list: snapshot of the pending list info */
+	struct pending_list_snapshot *pending_list;
+};
+
 #endif
-- 
2.39.2

