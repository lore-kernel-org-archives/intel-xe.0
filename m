Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15CEC77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 13:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8A610E0FA;
	Fri, 19 May 2023 13:18:48 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E58510E04F
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 13:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684502324; x=1716038324;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=4tI2+YSi0B4jeqi2uOBm15B/f0u5Zvn2iYR4wtNWJA4=;
 b=jBpr5lRbDPR/BFY9UbAH9PrT0BDVcEESUoq6ythAnTorgPD0nAm0OfC4
 BxehuE/BQ99oiPOG8w5lo80fZDf52MqVq1bc9mz5cwg7R1C7HqAAUifHS
 hy7EKaNCcK3zcUvYf4wLElT6c4qajfCq1xzIIcvxktQhOz1AwWdvl+CVC
 65F2bUsTbfsGNTqxKijrV4zWFu08bADt93KcC9DrFNEk0/5BJ/HnQUGKs
 fojxZ4sJzi3jlUKINhiDdPeNKNMOFsZifagGuuZWdC8tO5N728+DSu6Be
 hMcNQb1xI985q4Aee8Ad8KO2XiJ8caOlYj9IFf+sGrEGZ5Kr2vQ4VWjLN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="332733992"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="332733992"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 06:18:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="705615788"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="705615788"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 19 May 2023 06:18:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:18:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 06:18:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 06:18:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKERZ/HM4Q5XUQAe6jn5ur0Vl3UydsbBGRo8kzIkZtqliKGzmVv3Uf/70FLhvwS67hNd47IulG2WX0rsKeLlCFSKNFDbmgOh+5G0wV2i/p2jagHSb2HrCw2uevWmgli+MaEJFDmpv2TtrbMTA7nywZ+bhC7+TIy1StjKDnOF4+iOuJIikkwgWIXC3UYfN1lHeVv+mOG1plGKejCLCs8GZC7qvV8YEJWw0Fpb0fRK0/2myLt7wf+bvbrl84OcDbXI0mhvVTBJANPTLe5YSfC+FpFtwENvYGVvWDghHnR9yT9FtGbH5FkOUjJ2ShBjwZIFRriDpXcbwcVHiHw5zQNyUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koi40hxJzDqsCeHNpaBfs01mZaQh0/tAHrVKgfq1cpY=;
 b=jp4EhJqdIRR8T9vAZlTK+KMlPz+eMrTjmWdoUEhPj3ynxTTfjnZ7Z1ChxH3W3OFzqY2ypOXtpyP1zuvtQ52mNF/Y5haunB8/9jwfkq75WGg2eehQxJFJjw0bG7+T1T/lKf1oyWwR6dumqMhSSyJYTtXfB0tteEYxBaXTEc0qW8Te4S9YJ6CUL2M4cANGedfqjMghuZcw6J53fIwhdvYom7CRoZSeNqT7xLFYscp1rTypSEcwX+IGXff4YMu3v6Ks6GlaO+LuUg84FZqyAjTbU0sV4DJ0+yyaGOjfb9WtH7BxC6jjqd4ToVnYZhiPLyUu1JmoxpBBEjHyCnKhcnQ9rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 13:18:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:18:35 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 19 May 2023 09:18:13 -0400
Message-ID: <20230519131820.2020660-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
References: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0045.namprd17.prod.outlook.com
 (2603:10b6:a03:167::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b15f2e-1823-4ad0-b72f-08db586b8ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GQ4P1fqOo6zj9zKNKpBWwmU5v+UctNTaH3RXyidYY5G1+UFVT41GKQBZLN3FYjJth5cqb9ma83wAf1GTFjb6cXqoryoQtHKh6qHNFlSIyc11a7e0Q+I45I4Tm9JLvFz7x5A/VEBCfbP1OeI+I/2SvH+F0QWHo3KmNBtwx42Ajbxl+4x+ESWwT8K0VfFy1y+CuJQu5liQqU+0B1ATVs8qieO2cCEbGB7/CBuI+yuyo8uGvr9gGL7YZOvyFP2UBPo0p9bGonANKpkc80CXqjiJO+srIBKBa4u+Yo41VDbcXMtMBvk9wrTgp66Vb4REK3Un+aDBtGylMtJg2Lq1AZHEmNU8MEBwir/g0myIdVIitkpefIUq0fYXgXahKbaYLDYQmjmEToc4jYM2Rq0MdXx3OF7m/xCRjALG1hnZ9CriTWkL3Lks/QZaPsojfzruJgMN37/mQNoptPgUlmvONhqGCj7jSY6Cz9jM9W6wYGL2w4F6u0rJBHaYSMpFmMgExKXnGaUAp5nvkFNJl4GcXd6dRo/WNXziGVSAlMAnTHxO/lGRlpQO1SKbxwUAIgUKCEYW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(82960400001)(38100700002)(36756003)(86362001)(44832011)(8936002)(5660300002)(8676002)(2616005)(6506007)(1076003)(26005)(6512007)(2906002)(30864003)(478600001)(66556008)(316002)(66946007)(6666004)(6916009)(66476007)(186003)(6486002)(41300700001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KdvGx+n2asSeVueWAFJayDaliJXmhPvZrqd7RdoZK4+pTX9rMjDzMY0FY9cB?=
 =?us-ascii?Q?0Ti+naCtIGEraqkG0FnYW3INIhZLBtD1+KLA6RFUdwq0hHi++5GTeb5gS4Cd?=
 =?us-ascii?Q?3MuF9ZFwuzS0J940w8ElZj+4OW2AKP/Zv2Za0Gmrybq6+FrE0I+UmMdYgJni?=
 =?us-ascii?Q?T3iIjG36nWihjsOUeANiynBC0qIuvfdp+n4zgYklu6h8b+DU40v37YbOc8Qf?=
 =?us-ascii?Q?ccjSfJkGbjm8H4mX9Kw32C2A+G6EGgC/F1UXya3JIlYqEbjnIqRGQB6WXR3g?=
 =?us-ascii?Q?y4cnEqpZFKalQztENIPnUIEkSPyNCljv04V2qKakN+4Qr0t2UrI01j+ErC7/?=
 =?us-ascii?Q?XXQD00YtdZHDYXKg58xl+R/j2QZKH0T9KFiWo7VbYtqJFE/1dS/kQN5KQg/q?=
 =?us-ascii?Q?sy35xl15TRWFeEQorcMam1isCZO/EK/o9IO3cbld2h7dV83e9J+fPOjCtwr7?=
 =?us-ascii?Q?UTI5k8DXjXs/6/Ok64asjZDPlwmIOi8U++aRNafknjXwkVkgBtPk90Y6soQT?=
 =?us-ascii?Q?Q9ixPSoruCMdyJEw8J1XYjsVsqvg4bFknnETyCGQW+jLpDxNU7aYkeW0ESgw?=
 =?us-ascii?Q?pdqjgo1f2cQAQyhbe+R4/Qcm+HAcAEp5fJkXBb073EtLbaIegPtBlw9ZdGOY?=
 =?us-ascii?Q?NX2/T89skMLRwKGBgaRFvotku912OrsrqCcPmiVHpKEMJfX/aAAmA9h1uCCM?=
 =?us-ascii?Q?18fkssVcjafi1PedD/3zBzeDo/EAiErPvPvBZ5OFAlIJV+8ljLl6p84+wa0Z?=
 =?us-ascii?Q?5COp42wpHlacYJ/8c+nQdIqRgfQ22XFh1xT2keg6B/OPFH/7JjOp2BtyeYx9?=
 =?us-ascii?Q?hPl8NL1iFYGvqPFbi2SlZQow7Wd8zYLSfiKL3YogFzC6rhMLcaJfq9VhEnvu?=
 =?us-ascii?Q?d7ZV7fXyt/PdJoNtgw0yB5bL5SXCOEeJ/EwqvBTjvcXhV3o9j1ZS0pM0Xl4V?=
 =?us-ascii?Q?clshlkZ3QhnPJXpm1MeGy6u/Lepjg6eGZIy0mdgKgTSr+9/5PsZQBg8it9qm?=
 =?us-ascii?Q?1RNmiHoRjIET2g9Dz6bXF5wou6pjgSCfv959OMSUqnULiJ++EXPn8y6q53hn?=
 =?us-ascii?Q?XeAMUjZRNoI03tEjXJCTDaTFy3MMdrqWZpoCuH/Y+9HuG+p8sW6/vQApksN2?=
 =?us-ascii?Q?A4tVAdloRngeVDBnyoQ2TP9sDw09ZmVKBiUM2R396Wn35yAuDKkZd4VJSu+j?=
 =?us-ascii?Q?yPeCnmBHY//QIQXiPjloeuJrDuYsacoUOk5DjvNmvEzHbWmBfHzCwxFvT+nY?=
 =?us-ascii?Q?H5K2tw2+QyqsQth8bGKrctTEFagHJLw7i/fvZd4KkSS3VuZsv5Ri76TpZyht?=
 =?us-ascii?Q?vXFflT+ZORUN2tOoFghnEgy49ZTdjgX54aSdirgAAMIVYziYo6yr0U++y7P/?=
 =?us-ascii?Q?B/j3uVem8v8HDQCnEHEu+EUQOp6uC/KikVLIm1bNDPQwjvhGOoswziBJafMs?=
 =?us-ascii?Q?N8cgUvnEPQv6wS2eoNhntg/ZnIm569hDeIvAHsqU5UoT0DzYPTXqP20tjYpJ?=
 =?us-ascii?Q?1LJAbJetXMLbqXrLUpafpY1KxSU/w5uIZw0krx6tYySyZkkatuOS+i1R0HLF?=
 =?us-ascii?Q?z8ArO5CTzrmzEC0aPz7hiXiBDLO0MX6Ktdu8kKBi3xr3aETimxTzEgu94j63?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b15f2e-1823-4ad0-b72f-08db586b8ced
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:18:35.5549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuRiOY/wAYch6bQWltf8CpB7pQ4zZJHUuCUMnt96RSCeE27XiYzpVujhsHgS56nRUqh4p97n9bojTsSRquv1oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 04/11] drm/xe: Convert GuC CT print to snapshot
 capture and print.
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

The goal is to allow for a snapshot capture to be taken at the time
of the crash, while the print out can happen at a later time through
the exposed devcoredump virtual device.

v2: Handle memory allocation failures. (Matthew)
    Do not use GFP_ATOMIC on cases like debugfs prints. (Matthew)
v3: checkpatch fixes
v4: Do not use atomic in the g2h_worker_func (Matthew)

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

