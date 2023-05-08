Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB6BC7EE22
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C60910E06C;
	Mon,  8 May 2023 21:09:03 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145ED10E06C
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683580141; x=1715116141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YJSlOfm8ZHy91VRcSpoIZz+E6qUBC11O/FJSRmgY+t0=;
 b=oAh/5INKlYaCHFLniAoJR5DSmnkVl5En+mfEymVy+CQEVsx7Rd6bcUN1
 zxtKaBWTV9jsOaFRAWIdWByJfObl7LBAWJRKhVSTHtM0ScaPZn942oD7f
 vv70W9+SYAZuLXTmBYMPKMN/ltlS756f5FuiCikJGBmZ0Dmvzakj2p85a
 QFYFlWJV32K3rAUDBcDslVcqPXvYwkFBLsTQXlOk5pACvKdF1S/NWA0EC
 zBpHUjQRYQ7th9BDoZmubYazto/1ZBmbcLuvWeNe3lji/fYsnOHakfWJX
 awx7m0GrD7ZhCpKaO/ek7QzTcp0Ou3qRtj0uW7J4rKCjJATpXz/ohtroy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348583355"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="348583355"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:09:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="763535879"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="763535879"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 08 May 2023 14:09:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:09:00 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:08:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:08:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:08:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DO//EokyHQIUGanHjpgicu0VrPM5yv6oavhIoH79AY7QXcMv4Ign5Yk5qnU3IthQg1TDe504au4zeL1bM1Fvj51MVPlbAK7ekTyFp7zD/GfSPmyc8I9jfeGu5TX6KKgoF0VlKC/Ot0GEXpnHbr3YfXVQO0ZpMCKtAM5qJVgZj/m0ylNCzF1kdanbN1V8g0zBEJ3gzj2gBQtvW+m7X/9EAJn4mupqyo1daonWCwy13KluO62qxmfvx8x6Nznrr+xWpIDFWrRB/XULQd9/Cjw4cAXCSm85Ku7KhAcYiRLapOTibZLgj0LgFjgfCD6JUWF4ZR0lQuAO69bYC0IXfs75NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVy8AP7m2eR1kKYimLYQqQc9xRtAlXOrPMNb0O+/cGI=;
 b=GJVf8J9O31MR3HR0OeEor57trj09n9VD8GanAIMv3kX0GxsVBkMm3ZO8xm6BVwZ1zYZdVIMQYqtdsMgr6yZxeYajeKnn2mBJYkDgf9YPq800M1QkAyFs//29RIUzz544n6weIH5KfEu5FxFbLlqq3EzT+Bv+KzgB+cMrYYi2j8iJ4YCNqI247nWRkOw2sulHkOSlL+f0Bhoza9Lxu6lxxwyUkvn8fXoyq2XFxRmk2FY8SeRm3wR0wacR4meq+4JUVIKGfAnTYS54v8iQrH/DLitJjSVatIqjL3XwFOHnY3seIAoufkwm4F0swMIQS/IGxk0FY1k16uNVPu7iSLaGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:08:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:08:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 17:08:21 -0400
Message-ID: <20230508210825.1405432-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:a03:100::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: f39b8fad-d20e-43cc-18d6-08db50086e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c6zXgvQYv+ixS1r+9h/HpQ7nelbIhOFedHXlT7Z2e3fK2SjZF/NB9HFAvZYXGv5J0iM/h5EkF65tuJpF4t8CaMrGGpIgf9viu8X8eCncN7zdNz4xSnWirZzuCnO3tQuEXfhPII7PWIqXLT02QVzkzNhqrYjYOQpfMle4dGxwfmREhCS+mHrmOob6MrUaS7d3i7gCIGQFQC3ys2M9PFh9IIDphc02YuRPI2TYpUq8pjcVttEYOj0ze6xPqgWXvDa4Xf9djfoIIS2uY/lvE2osTOww4RdTINf8C689Ill7UCksAepemLpHR031vom8IH/+/LeUC2WZ69FrTGOo0nvoGCfRe+4LdrrPU6vuK6xfFdnvj9dQBz2n0dyiTNXzdewdF9/233tZPXJ4HS1vnGWC3HULDnAdy9+qatCegceYck0SzWYgcnhMi9UbGCBp8ZnlogzIMy7wd3bX8Z+d6Gg8HxZso/GZH9sdamKITnnTcBOfwj4VN3RHtsnOAtVhnBOLLhYa765HGD2hIGAbvEGGBVWSpkdFIdk8H9+vpJy7hiGeK5U38ze3TQ0MJ5ZQ94iz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199021)(45080400002)(86362001)(66476007)(36756003)(54906003)(66946007)(316002)(4326008)(6916009)(66556008)(478600001)(6486002)(5660300002)(2906002)(8936002)(8676002)(41300700001)(30864003)(44832011)(38100700002)(82960400001)(186003)(2616005)(6506007)(26005)(107886003)(1076003)(6512007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y5e6xtPiokCjxdZ/9NvZWdlypaycOE3Ltce3Ugv5oG2sg61jkqqyrbIR3ZuQ?=
 =?us-ascii?Q?g7lE3JIIi5nZFtbBrYTmzxHYL9CWdwgC/YFlnI94x1m10oNe0W6ucRXWvSmn?=
 =?us-ascii?Q?DKTB/NGurVAl/Kcntn0M47tYlbTE22d1wf/jYtz8EMyJ6FmADu+NuuygA6Lv?=
 =?us-ascii?Q?mvmnJFrGfVgZ5enMPj7lV9obc5z/gR+LI2qlsorEgkWIa3wLql9/s97B9q+U?=
 =?us-ascii?Q?Veu0jfb3S29dRGMIHdRMmiXHRNW4ob+2xXCDPKvCTMaooosRy5TDeukC6ML9?=
 =?us-ascii?Q?GL0z81S8etPna8hQOWewM8j2fzGC2vbudjdrzKR6TV76gBuouYChCIlvwYuK?=
 =?us-ascii?Q?R83eTgcBNbOuY9XPNhuNESKZCOUn0qa2aEQyC7SJwSeagqsvZHR9r50TphGU?=
 =?us-ascii?Q?j3ts/nC0dmI4K6qPAbM5UJpGoifuOYR527PhhQ+hJDh4d8ETDVXpQjn1evcV?=
 =?us-ascii?Q?U6NNkR2cfz/Dmqv7lAd5IsnH2VCCJUH9QIAGCU7cD7jCnBdQbMhTzS6QW3WY?=
 =?us-ascii?Q?ee1SXQiwoGw0eckwPa/KPDpm9zqGOQk2YR1ZZBqw1zaKN3+nuwO8peFriqmQ?=
 =?us-ascii?Q?HkRElS5x4zuiu6T4rW+cM3GlDFLqRkG3e0wfk2hr7kUEwf0lO4Tux0sGuQ8w?=
 =?us-ascii?Q?YVnePAYxdJKlrorkj7PsyhMy/MJ0253Qbzr4R9IymNh4dDB7XlxNMiCaKPBD?=
 =?us-ascii?Q?rrdOYkqTrXwUZ9dtKNcJfgPK9YG5KUEk7k5oN3x0XPXJUiK6merqMVCyP5mu?=
 =?us-ascii?Q?zlnCcKMhwtm1UqmTKa9qg1lX/1NuMShjCUWGIEayjYkzInZHm/I/tJx8yjJr?=
 =?us-ascii?Q?EbUOpwUGDmJTwsgjmcCc096eQJ/sxYdLUpi0WfYRjYz7PI9xmoAoJVfbpmvn?=
 =?us-ascii?Q?t3s4bQuTfk7cCKrLV5EF2DbUipGZXEaikCrDahV+gs3rxGckf0hKaslX7cR0?=
 =?us-ascii?Q?22fwXRrDFkVNNy/FU+6b8SSaJOPX5ObAVtbLUbP7VvOkO09YtLfmBEAH1oe7?=
 =?us-ascii?Q?8lb5xSOofsWfAY3FyXU56QphwDbUXbAu6mlJsKnzqdEko4RtxG6GlmFo3biB?=
 =?us-ascii?Q?j1NwiaqrXU36ZOkV6sbHRxsGXyElrS57j5zAo8jbW/A5KqRsQs1SZXJw7f1W?=
 =?us-ascii?Q?wvvUch0cB7bvLfzrScNgYb+OENeC5oBVooEFNTCBeO/NLE+Y+aor/BZKYT/4?=
 =?us-ascii?Q?D7Bj9owd8zCtqGo823ruZJ7jlb+S8oYLE3JTyxilWkEV8JnxdPWSvkrnazSN?=
 =?us-ascii?Q?QeZAaJc/VQM4YqKRZ5/6O1dorsoGultBm71O1640EW0+ggyRI55x4L8uKiqF?=
 =?us-ascii?Q?b5FeGgw7ULTgcVvTxkmKDW8TnwW6pKRIPZLx3P4bnJI4Bu4JH5mt1P6lFoMa?=
 =?us-ascii?Q?iRJIVd/3O//6L2/MgOD9Eygpwt/9VqhCS7Pw3pGaJMon9LWkXkGXtFiVuDD0?=
 =?us-ascii?Q?GpmrZ5gbb8Ah0U8AZVoht8kfUZhHy8Y2MqIXBlhK9HZZlTaKqzwf8IvWDaXq?=
 =?us-ascii?Q?3g0uVdQr04c9oN/V3iLMFcJfWygaJUrv/yuF5LyR6Gf9ay6jXOanzxSu+ASe?=
 =?us-ascii?Q?zhqTfx7P81pBrMz4DKWtyQ2e9XANDB3yCFWgl/YjCUphAga3u3TBANw8BK2a?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f39b8fad-d20e-43cc-18d6-08db50086e96
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:08:55.0992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkoHPM4EAu0uNPIgVrsyQRXekkeELkrSUi3qoDfjBstDXw61aaqVzj6HixTnsSMCd7f66FkYsj4VsS/BZ70KDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 07/11] drm/xe: Convert GuC Engine print to
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c              |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       | 251 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.h       |  11 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h |  91 ++++++++
 4 files changed, 310 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 985f6e901ee4..dc891ad1d367 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -857,5 +857,5 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 
 	xe_guc_ct_print(&guc->ct, p, false);
-	xe_guc_submit_print(guc, p);
+	xe_guc_submit_print(guc, p, false);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 250e56ee2e75..b5ec1aa55451 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -718,7 +718,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
 }
 
-static void guc_engine_print(struct xe_engine *e, struct drm_printer *p);
+static void guc_engine_print(struct xe_engine *e, struct drm_printer *p,
+			     bool atomic);
 
 #if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
 static void simple_error_capture(struct xe_engine *e)
@@ -746,7 +747,7 @@ static void simple_error_capture(struct xe_engine *e)
 
 		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 		xe_guc_ct_print(&guc->ct, &p, true);
-		guc_engine_print(e, &p);
+		guc_engine_print(e, &p, true);
 		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
 			if (hwe->class != e->hwe->class ||
 			    !(BIT(hwe->logical_instance) & adj_logical_mask))
@@ -1596,76 +1597,240 @@ int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
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
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * reset or from some regular path like debugfs.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a GuC Submit Engine snapshot object that must be freed by the
+ * caller, using `xe_guc_engine_snapshot_free`.
+ */
+struct xe_guc_submit_engine_snapshot *
+xe_guc_engine_snapshot_capture(struct xe_engine *e, bool atomic)
 {
+	struct xe_guc *guc = engine_to_guc(e);
+	struct xe_device *xe = guc_to_xe(guc);
 	struct drm_gpu_scheduler *sched = &e->guc->sched;
 	struct xe_sched_job *job;
+	struct xe_guc_submit_engine_snapshot *snapshot;
+	int i;
+
+	snapshot = kzalloc(sizeof(*snapshot), atomic ? GFP_ATOMIC : GFP_KERNEL);
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
+				      atomic ? GFP_ATOMIC : GFP_KERNEL);
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
+					       atomic ? GFP_ATOMIC : GFP_KERNEL);
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
+}
+
+static void guc_engine_print(struct xe_engine *e, struct drm_printer *p,
+			     bool atomic)
+{
+	struct xe_guc_submit_engine_snapshot *snapshot;
+
+	snapshot = xe_guc_engine_snapshot_capture(e, atomic);
+	xe_guc_engine_snapshot_print(snapshot, p);
+	xe_guc_engine_snapshot_free(snapshot);
 }
 
-void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
+/**
+ * xe_guc_submit_print - GuC Submit Print.
+ * @guc: GuC.
+ * @p: drm_printer where it will be printed out.
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * reset or from some regular path like debugfs.
+ *
+ * This function capture and prints snapshots of **all** GuC Engines.
+ */
+void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p, bool atomic)
 {
 	struct xe_engine *e;
 	unsigned long index;
@@ -1675,6 +1840,6 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
 
 	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.engine_lookup, index, e)
-		guc_engine_print(e, p);
+		guc_engine_print(e, p, atomic);
 	mutex_unlock(&guc->submission_state.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 8002734d6f24..0ac50702f600 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -13,7 +13,6 @@ struct xe_engine;
 struct xe_guc;
 
 int xe_guc_submit_init(struct xe_guc *guc);
-void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
 
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
@@ -27,4 +26,14 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					   u32 len);
 int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
+struct xe_guc_submit_engine_snapshot *
+xe_guc_engine_snapshot_capture(struct xe_engine *e, bool atomic);
+void
+xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
+			     struct drm_printer *p);
+void
+xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot);
+void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p,
+			 bool atomic);
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

