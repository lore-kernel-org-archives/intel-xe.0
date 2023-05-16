Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75C2C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:54:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906AD10E25E;
	Tue, 16 May 2023 14:54:41 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E905D10E25E
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684248878; x=1715784878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OuE+JwPd3Afp295jSO8FIPdCwKYaYS/dd7k//lj+RhA=;
 b=Gi3/NEmXg9DuFh9+pBJTKWLNneifwloh77HsuXqrhp+AWnsNFPABCrrx
 Mp/1sWs9t0Ph11PkC1A0E0rj8QwtTmd08R2vlCU8hXdro5Tv979zmJbmX
 UGUPmZs1s60zKNtGEc4eer/7xU7WzsN3FAtG6ORs1MvHobj+jRXJ2jgtM
 HgcPqCv9cF8vyNZP6A1KmFjcZTBBdBobDoCmYvWcFXxMiIRSwaOI7ry2V
 liMpVUVCAWnoY31cjtP8XVqBVsvEEUjVqretYn5mya286vPvF73pJXee0
 heqfZ9lYYQRH0D6twZPT/O1+0HML6t2994iRs7/NDuNT2+GnyMJB1dtoa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="379677104"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="379677104"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="771095057"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="771095057"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 16 May 2023 07:54:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:54:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 07:54:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 07:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZ8z/WOVp4zBqo9tOFvfRN8GH25aArWssfI1imZmIdWMgW+n2kFBhB/oshO5ua4uFjWftutB0T8qZebWJHwZ4bK5u+nagVkDonyMV1FWG8s2wLFcIyw1HqEI62M/fkw1+8+McZrOyMHhyNMddpMqDMFePmkDwSdqo+sjuAaZ4yRSR9DdVCur3KMwosD8s47Pb/KBXfOLtDOZBzDjvD5jM+PMnqPD2750R++0bPqhmjQRc97CqvrTTiprQ2vpLmoAgrrK11CwsM7v9KS4VQBAYDua52OXYjhjQBYgLGRCFaxTCJ7J4FhJ3w/fhGcJYntuBQIkwyTJV63ORMjMgkZwsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfGBKFEpUt5sCPjos5CRQVPAQssga77GENx5umXokbM=;
 b=CNGtdc1Kq0MfovXBPscW7B8WduB21rGl70sYnkeZSUQGwMRecaPdqYAt+sKlW8/7MdsNxJd/1BGwn1kpTJ6uUy0yiG4y+N6EulbOjPmugpu693ldqaVTeSuyzVlO8WmZQedbP76yg4p1JscbAvrZPq9xIALN7p0PfTUNWm60Vg3jxcM7AY+4mHrSLwy8lpmIwG+d2/4xF0qwzmJ0LcWOF2rIoVawMQ3K0alkWtVcWnwmr0hijKgk/KCRBzvXN8yoqLOeYcFp1yHwt1isi0/lFhSaV9D9X2T+sQXg23rBQLpg7ssFlP8lK6xhV0CHcvNNZod0W+UbKV95RiVd81L5GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 14:54:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 14:54:35 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 16 May 2023 10:54:09 -0400
Message-ID: <20230516145416.1851984-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a79fd8-047f-46d4-6ff6-08db561d7721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yp0eS4aFb+Ns0IkdMkgS3KAU7Er012zpEoS2Ow/m/dvEAb486V6mPP5VPce59TyJcy9Bz8vA4PJ5CPB/TpkDZs0INc26xqIwvuV9pA7UHMwKhCDvcVJQwClFH00r6T5V70PJlGdisvpST4UbB81pxUIPfMu1ey4LLjCP2YbNneDqwxI1zvD0T7P++NOFEgl2xc4h9UcSFoj0r78QKLWd14QcnT0WVq7IKYS3HdNbF+GvMI+AhOmQFwhHxFsXcX6lFw5qj/tQyyh8MkDlREGzPo/79IqSTpG/n95zbSpvxwTfkyMCIkukLz+lDScXrM/Hnpdo6pJ2CnCg6vxYD6x6Bjz62gEkvntJBtq+b1h3XVBLNiwp5w50zb0RPIzQTC7PXuggTQqDPjkgS3xvjJQBQz5WZHra6g0EjGq8Xfb467r5UQ7STq6ILCmMVK8czxbZc5ND7K8n+/JWO6TlCnBIPeLt5rfmFebou+72HFUZD4w6VVSBN+Yi9RBAHb0nkwGPURWshkP31hfS4dHy+XSBO6Q/BvQNVZ9aE3XAzjk7wcqmIZmDOtH+4uO21+g8p6Ro
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(44832011)(478600001)(8676002)(86362001)(8936002)(5660300002)(36756003)(2906002)(30864003)(6916009)(66556008)(4326008)(82960400001)(66476007)(66946007)(316002)(41300700001)(38100700002)(186003)(2616005)(107886003)(1076003)(26005)(6512007)(83380400001)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4I2J12h8Nsdz9uLPpc6U+xUUJToTjeSaGEGYi2DRa5kZ1QLAa/9f4DF4A3Re?=
 =?us-ascii?Q?AVF29sbWLjU9koeyLnHyi/mDrKapIOAVIExtFEXW+xX6TPmXvcf442eskl/O?=
 =?us-ascii?Q?FodMPFf8eHH6e6k+/YrOhtxRBA/Sa+cijmLNyKgaMI9LWK1lrMCNlTwJEyWC?=
 =?us-ascii?Q?NJsc7k2Gm0gMUmz56AEirGYNdPmvYH4Pv9kRWzAadC8imiTOMdGhER76lsm8?=
 =?us-ascii?Q?DaTd0pCktfdIKBbtpwBS6449RojMsWDf1T5jO18SSR1rYaY+WuIgHGKgm8ee?=
 =?us-ascii?Q?7HIxA7MVK7dw8Xpd0LRUC2vBH7STD//Teb9lWCjPkSCpjQvVAoulTpU/BgKz?=
 =?us-ascii?Q?j7mQ1cMFJIDrC17GUGuriUx2URwCYv98gBLRt7QlxBBcULWaaMc37b4aD4AE?=
 =?us-ascii?Q?2L9WOEddXnYYThK5wWRSj4fE447q1E6kj/QZA7WIXhDWUSDKD3jODrlyXJt3?=
 =?us-ascii?Q?O39VrhcteE7yk06Y9eWiELhgO/Q29XgOOfn009jI5BmyiUlXIgB0uXt9z8+l?=
 =?us-ascii?Q?FPXyU9L5/+RbezAr1VScdtk/otJ0QoXxN444PA429ZNORrYPlZ/IUMmoInAb?=
 =?us-ascii?Q?hja0GO9+bTEebYIwx2JfQ9PmC74BILpHAGc2J6ONCvI0WmJdkJwwbd/ZZc/1?=
 =?us-ascii?Q?mRnW30XHeoUgmHe1MKka68o8ygUJSGwaRxnuh2sfQ1snL3GasxUtQmw1QrTD?=
 =?us-ascii?Q?i52UT/x8+rIYvyb86qCxKhK5/9XwPpEtvOf2jZF/wqMZ9F1Sk3+U15YYPZVL?=
 =?us-ascii?Q?aqEKjSlo8yM6kDlBSbdrKNSb03FWQdifkp31EsxEDof37f9dKn+fsz6EC4Je?=
 =?us-ascii?Q?zZfX2HAS6ryUlLTUVD9hm9qYjYincoTsfLR5mE4rkgpVNiZVbkI/bWuEcvnf?=
 =?us-ascii?Q?e1lT5RlsSviCAgdWiKnuJWca82FBf4VtCe/FXXuQEhUHj5CJ5Zn0gJAHSxjB?=
 =?us-ascii?Q?Uv4bMPB6rXvKoN5uxffxVdCbGSRCFh4NLDh3uKsrfRBY0D/eNUi+kqwP0CkH?=
 =?us-ascii?Q?jmGaWVAO6T6wahdM/QmMl7hqGy54eYXx3lpeFAxfhm1LPnqPlGcLT/xWbZ76?=
 =?us-ascii?Q?ONG95q8cmZ7oXknbaiGkCBjY8xwJKvJ+3suQKqrUpMhG9n7oxHEiOD633DML?=
 =?us-ascii?Q?QES0y22oBjME94qlAllsSVvNa3IdoZTlxZtT+YdCguGcs2toFLjjZ3XxSuL9?=
 =?us-ascii?Q?Ysc2AOCtP8k+7kNJS7fhoQcWAt5f49EQFqp69Agrcz6K96ciwfJORUAUC1Q1?=
 =?us-ascii?Q?hrgIkOPCLIsRo8vJJqZ0m6rJpCYOnSRHlvBMuUrW0MGGpunHYmmOK+4wDaF+?=
 =?us-ascii?Q?4r/UzCbLSApiSHRz9aNjHXmz8Mf+aeTdwmFKR/duy7jdjCjt7JouzBe3Pu8j?=
 =?us-ascii?Q?TzdzDVW+l30cbdufnLQhe2y6H4GIIpUwKOeg/eH7Gv2QYamgoyvS5BnNor6H?=
 =?us-ascii?Q?wX2LLXBXNri6fAcEDwiEKkoakg6vHT9g5FK+yNy2rZbM3Ss4QH6DsGED6w4x?=
 =?us-ascii?Q?+F0Lq/lOsYCODHHN+9NlUNesnD5Om26tRDWciIsDa1C+MxZF7ydjTvkhqYvZ?=
 =?us-ascii?Q?FO/djizwSKJnHY1xJYQ1dxqWiZgCqfIxJb7lPUr6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a79fd8-047f-46d4-6ff6-08db561d7721
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:54:35.8852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXy/AmL/RQloGZMZSNVJH6ZK97YaG/vYjFordCDOU68cJakw8xW9k4h4mB+O0Cue6jWI+dF6SnOXnrrpVa6Q8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 04/11] drm/xe: Convert GuC CT print to
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
v3: checkpatch fixes
v4: Do not use atomic in the g2h_worker_func (Matthew)

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c          |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 166 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_ct.h       |   8 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  26 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c   |   2 +-
 5 files changed, 179 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index eb4af4c71124..b72407e24d09 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -857,6 +857,6 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 
-	xe_guc_ct_print(&guc->ct, p);
+	xe_guc_ct_print(&guc->ct, p, false);
 	xe_guc_submit_print(guc, p);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e16e5fe37ed4..e8c2edb1359d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -595,7 +595,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 broken:
 	drm_err(drm, "No forward process on H2G, reset required");
-	xe_guc_ct_print(ct, &p);
+	xe_guc_ct_print(ct, &p, true);
 	ct->ctbs.h2g.info.broken = true;
 
 	return -EDEADLK;
@@ -1088,38 +1088,40 @@ static void g2h_worker_func(struct work_struct *w)
 			struct drm_device *drm = &ct_to_xe(ct)->drm;
 			struct drm_printer p = drm_info_printer(drm->dev);
 
-			xe_guc_ct_print(ct, &p);
+			xe_guc_ct_print(ct, &p, false);
 			kick_reset(ct);
 		}
 	} while (ret == 1);
 	xe_device_mem_access_put(ct_to_xe(ct));
 }
 
-static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
-			     struct drm_printer *p)
+static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
+				     struct guc_ctb_snapshot *snapshot,
+				     bool atomic)
 {
 	u32 head, tail;
 
-	drm_printf(p, "\tsize: %d\n", ctb->info.size);
-	drm_printf(p, "\tresv_space: %d\n", ctb->info.resv_space);
-	drm_printf(p, "\thead: %d\n", ctb->info.head);
-	drm_printf(p, "\ttail: %d\n", ctb->info.tail);
-	drm_printf(p, "\tspace: %d\n", ctb->info.space);
-	drm_printf(p, "\tbroken: %d\n", ctb->info.broken);
+	xe_map_memcpy_from(xe, &snapshot->desc, &ctb->desc, 0,
+			   sizeof(struct guc_ct_buffer_desc));
+	memcpy(&snapshot->info, &ctb->info, sizeof(struct guc_ctb_info));
 
-	head = desc_read(xe, ctb, head);
-	tail = desc_read(xe, ctb, tail);
-	drm_printf(p, "\thead (memory): %d\n", head);
-	drm_printf(p, "\ttail (memory): %d\n", tail);
-	drm_printf(p, "\tstatus (memory): 0x%x\n", desc_read(xe, ctb, status));
+	snapshot->cmds = kmalloc_array(ctb->info.size, sizeof(u32),
+				       atomic ? GFP_ATOMIC : GFP_KERNEL);
+
+	if (!snapshot->cmds) {
+		drm_err(&xe->drm, "Skipping CTB commands snapshot. Only CTB info will be available.\n");
+		return;
+	}
+
+	head = snapshot->desc.head;
+	tail = snapshot->desc.tail;
 
 	if (head != tail) {
 		struct iosys_map map =
 			IOSYS_MAP_INIT_OFFSET(&ctb->cmds, head * sizeof(u32));
 
 		while (head != tail) {
-			drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
-				   xe_map_rd(xe, &map, 0, u32));
+			snapshot->cmds[head] = xe_map_rd(xe, &map, 0, u32);
 			++head;
 			if (head == ctb->info.size) {
 				head = 0;
@@ -1131,20 +1133,140 @@ static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
 	}
 }
 
-void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p)
+static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
+				   struct drm_printer *p)
+{
+	u32 head, tail;
+
+	drm_printf(p, "\tsize: %d\n", snapshot->info.size);
+	drm_printf(p, "\tresv_space: %d\n", snapshot->info.space);
+	drm_printf(p, "\thead: %d\n", snapshot->info.head);
+	drm_printf(p, "\ttail: %d\n", snapshot->info.tail);
+	drm_printf(p, "\tspace: %d\n", snapshot->info.space);
+	drm_printf(p, "\tbroken: %d\n", snapshot->info.broken);
+	drm_printf(p, "\thead (memory): %d\n", snapshot->desc.head);
+	drm_printf(p, "\ttail (memory): %d\n", snapshot->desc.tail);
+	drm_printf(p, "\tstatus (memory): 0x%x\n", snapshot->desc.status);
+
+	if (!snapshot->cmds)
+		return;
+
+	head = snapshot->desc.head;
+	tail = snapshot->desc.tail;
+
+	while (head != tail) {
+		drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
+			   snapshot->cmds[head]);
+		++head;
+		if (head == snapshot->info.size)
+			head = 0;
+	}
+}
+
+static void guc_ctb_snapshot_free(struct guc_ctb_snapshot *snapshot)
 {
+	kfree(snapshot->cmds);
+}
+
+/**
+ * xe_guc_ct_snapshot_capture - Take a quick snapshot of the CT state.
+ * @ct: GuC CT object.
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * reset or CTB handler or from some regular path like debugfs.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a GuC CT snapshot object that must be freed by the caller
+ * by using `xe_guc_ct_snapshot_free`.
+ */
+struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
+						      bool atomic)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_guc_ct_snapshot *snapshot;
+
+	snapshot = kzalloc(sizeof(*snapshot),
+			   atomic ? GFP_ATOMIC : GFP_KERNEL);
+
+	if (!snapshot) {
+		drm_err(&xe->drm, "Skipping CTB snapshot entirely.\n");
+		return NULL;
+	}
+
 	if (ct->enabled) {
+		snapshot->ct_enabled = true;
+		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
+					 &snapshot->h2g, atomic);
+		guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h,
+					 &snapshot->g2h, atomic);
+	}
+
+	return snapshot;
+}
+
+/**
+ * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
+ * @snapshot: GuC CT snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given GuC CT snapshot object.
+ */
+void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
+			      struct drm_printer *p)
+{
+	if (!snapshot)
+		return;
+
+	if (snapshot->ct_enabled) {
 		drm_puts(p, "\nH2G CTB (all sizes in DW):\n");
-		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.h2g, p);
+		guc_ctb_snapshot_print(&snapshot->h2g, p);
 
 		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
-		guc_ct_ctb_print(ct_to_xe(ct), &ct->ctbs.g2h, p);
-		drm_printf(p, "\tg2h outstanding: %d\n", ct->g2h_outstanding);
+		guc_ctb_snapshot_print(&snapshot->g2h, p);
+
+		drm_printf(p, "\tg2h outstanding: %d\n",
+			   snapshot->g2h_outstanding);
 	} else {
 		drm_puts(p, "\nCT disabled\n");
 	}
 }
 
+/**
+ * xe_guc_ct_snapshot_free - Free all allocated objects for a given snapshot.
+ * @snapshot: GuC CT snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
+{
+	if (!snapshot)
+		return;
+
+	guc_ctb_snapshot_free(&snapshot->h2g);
+	guc_ctb_snapshot_free(&snapshot->g2h);
+	kfree(snapshot);
+}
+
+/**
+ * xe_guc_ct_print - GuC CT Print.
+ * @ct: GuC CT.
+ * @p: drm_printer where it will be printed out.
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * reset or CTB handler or from some regular path like debugfs.
+ *
+ * This function quickly capture a snapshot and immediately print it out.
+ */
+void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic)
+{
+	struct xe_guc_ct_snapshot *snapshot;
+
+	snapshot = xe_guc_ct_snapshot_capture(ct, atomic);
+	xe_guc_ct_snapshot_print(snapshot, p);
+	xe_guc_ct_snapshot_free(snapshot);
+}
+
 #ifdef XE_GUC_CT_SELFTEST
 /*
  * Disable G2H processing in IRQ handler to force xe_guc_ct_send to enter flow
@@ -1166,7 +1288,7 @@ void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p)
 		ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 4, 1);
 		if (ret) {
 			drm_printf(p, "Aborted pass %d, ret %d\n", i, ret);
-			xe_guc_ct_print(ct, p);
+			xe_guc_ct_print(ct, p, true);
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 49fb74f91e4d..3e04ee64652c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -13,9 +13,15 @@ struct drm_printer;
 int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
-void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
+struct xe_guc_ct_snapshot *
+xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
+void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
+			      struct drm_printer *p);
+void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
+void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
+
 static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
 {
 	wake_up_all(&ct->wq);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 64e3dd14d4b2..93046d95b009 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -48,6 +48,32 @@ struct guc_ctb {
 	struct guc_ctb_info info;
 };
 
+/**
+ * struct guc_ctb_snapshot - GuC command transport buffer (CTB) snapshot
+ */
+struct guc_ctb_snapshot {
+	/** @desc: snapshot of the CTB descriptor */
+	struct guc_ct_buffer_desc desc;
+	/** @cmds: snapshot of the CTB commands */
+	u32 *cmds;
+	/** @info: snapshot of the CTB info */
+	struct guc_ctb_info info;
+};
+
+/**
+ * struct xe_guc_ct_snapshot - GuC command transport (CT) snapshot
+ */
+struct xe_guc_ct_snapshot {
+	/** @ct_enabled: CT enabled info at capture time. */
+	bool ct_enabled;
+	/** @g2h_outstanding: G2H outstanding info at the capture time */
+	u32 g2h_outstanding;
+	/** @g2h: G2H CTB snapshot */
+	struct guc_ctb_snapshot g2h;
+	/** @h2g: H2G CTB snapshot */
+	struct guc_ctb_snapshot h2g;
+};
+
 /**
  * struct xe_guc_ct - GuC command transport (CT) layer
  *
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 231fb4145297..9e2950f1fd0d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -764,7 +764,7 @@ static void simple_error_capture(struct xe_engine *e)
 		}
 
 		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
-		xe_guc_ct_print(&guc->ct, &p);
+		xe_guc_ct_print(&guc->ct, &p, true);
 		guc_engine_print(e, &p);
 		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
 			if (hwe->class != e->hwe->class ||
-- 
2.39.2

