Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ADCC77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 13:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127EB10E04F;
	Fri, 19 May 2023 13:18:45 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839A310E04F
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684502323; x=1716038323;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=GPoM3F13StpdDnHh69WZSTaQmXjIA3LPYWqfC4HQZEM=;
 b=hwfRVvU/bLWa9aSxvvuvOxdPj3bL3kYw0FQKNK9BzymQOSx48jQe9Dtj
 2x39Du6TcuXjA6EjCEuSklocZ53hgtm5UBXIxb2UjXgfgLW6sq9eEO7O3
 /5QiJX/My7jPBbvnTY9XV35MjtTRv6Mkw2VNQV0eY2gg1vWv1UY3YkAjx
 hrJXLGV67bboevioGTqVpc1Mi8VHB/YKl5Oo7IaMf1tLY/HiOViuegQxC
 JQMVTuTLnZ/iehiqj+kaZOfHNpav6m6kI08XjOEfz3nmv6eg9UlLvS9Cv
 l5d+ucJUMRfjmhYPbCSM/T2f/AXlm515XfeIXGCx1BbY2j+yjVr6tkshU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="332733985"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="332733985"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 06:18:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="705615778"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="705615778"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 19 May 2023 06:18:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:18:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 06:18:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 06:18:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdMLZk5puTEMNiVhWzhg8WIe/b122koXsl+mmTlRfMG3cD+sIfgzpKkjvdc30PAiIRMgVE7h6znb65wiYpJdzW5sjUY13rMY8u3Xy6mEMP5bhqPbHdpATNc93dELRXR1gF/EgRAfb5PJjmaw3dmp/Bp9x45vvaRDRsCvLkI6VIZQb2KHyvWv8xPv7e0I2Dn9YizmIM93DgOG3bUEC+Qu2NP9MoDKqkPFGv7WRmbHsJNcPZBkYZD7EeQ9p74WDHBXkDEMCP0Y2VYXQSc+7pid7MdLZymA+N9fzdOlXtUN0kmmIgAemPguwbLgAWgSuKjeBwuNGpUKyTCUtAYDDPlM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbTKx4ufv7oqfiM7m6jcKwKUPLY4p+i+iWgPjpcP6og=;
 b=EJVNnFqBGzB7w4cIzl7wJS88sry3fmlbuu/NM62d2Mf+rYOf0XpAN3OX8gXVSNObj/KzyTqd4k9d6p798XMauaCi2d2j4bWOGdfLZiR18nhADXILD4FkuVdsX8b9XOmJT/SwK2n13JjAtorzlG1UK1HgZsrPvZtUF1O/HElgAG+CvN8SjvzuLwzEuX28HiZoa8C/kdskmN4k0pqLW58c7U//CWuX6Y3M0eWJIdyaFA1rZOBMlScEuXJ8vsLSTSjNB1hQdEFezzTEHvT2RnqrKYq9qOYGUWeBRJV9Z2CYY0hvyl5TYV/VQAaPXCi/BuUcjiVYU8sVHRLUJUimy8VZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 13:18:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:18:31 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 19 May 2023 09:18:12 -0400
Message-ID: <20230519131820.2020660-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
References: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e77c736-81b8-496a-258a-08db586b8abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VNdK3S03DgxJMEsnfKdETInCxQnsqRRAqwbCFwoMjGq2ryPbudBCNeXxgdbLsLqQmmSuP52K3jwu2ZzKFlYkQpMsuElf2gzn0evXhvKP25YOXPQeg/BWOg4B3Ps2YYzr+cJuNyQz8i/59eWBW9Oi5fWZg/4Ec5e//kwGtksD4/8H8Mqua68jrorTA9I79Q3dKbQP4bxglUFX9D9NazSkWkiqtrz4EM7lpn3KyrC05mmWMdQwlhNUAzf3KXPK5Lf4WGlt9YVzP3G0AbmCtgrOQqhpkN2lD8+BYXpUz1w0GhhvX2naoVYmC87Ul8cnwjNX40eFZ8P34xeq4aqPoJT0yT7IdbFwuHw0ecYo6aj9G/2xdgd/QSxCEGENU53PHI9pk7sU9/INh17TmXRnIbgUkUILd+mRWaZPzutwqjrNTjXJtlqs+GF2ccGbcFXIaxphS/yGfw0sD8IF3m9LwpfHzh2a9ZgGeLoThXyZH0GKgd2wvyeeMtR4wT3ldyc6luGiWvo0cUtovV+ZL+Yv78UY8NRnCnS82dKnwsZQqw812K1cL1A3h9cHFP+xAW8rmH8T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(82960400001)(38100700002)(36756003)(86362001)(44832011)(8936002)(5660300002)(8676002)(2616005)(6506007)(1076003)(26005)(6512007)(2906002)(30864003)(478600001)(66556008)(316002)(66946007)(6666004)(6916009)(66476007)(186003)(6486002)(41300700001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/SEc6aa1jSS1eA4lv1v1lokJBrcsxjQQRfqsaXrGQ8dEcwcJLMusev4TPLFf?=
 =?us-ascii?Q?4r4wzLk6Sw8HQVsNjhHHepKfj4UE5AEg1Gatfno79857eCUBIl155ICyKyKV?=
 =?us-ascii?Q?c22kRO7Qofhw+YyPnGIlaYWSpAU3Qsi55zQkcnjBHVFWsSXZaIZeXRQi3wOL?=
 =?us-ascii?Q?ljLOWDonsRsh7PlfGnCEVNQ/cLH+gfhG7KmTC1NK6wKU323dok5C4CnmF1R0?=
 =?us-ascii?Q?RRjtpjSTJlejoqeP8BwmPypGkOq1/BppeNO9IgUx5bkKdWLvK8C42CmGeRqj?=
 =?us-ascii?Q?gJJ1eO3hK7+JtqLsto8H6byn/z8VaRtclVxMtzGRXP4UZPUAHJtRhya9l6u7?=
 =?us-ascii?Q?E/UO1fldW3iyMaqSGRWeJodmXzXxKGZWajTeHQw8VOQdMQihiuXRvcnq4sRy?=
 =?us-ascii?Q?6p1+g354dzpI/orJubXtt6Zrqa3bJS3ceQ0H+peOdlSPaVXW6up0Uge870Mf?=
 =?us-ascii?Q?rzIJ0LXVTrITF/JvJ6L9jrhMZ31PmvrUsRpH1KZzmkaRu98wan8aLc4j8zvL?=
 =?us-ascii?Q?jA+Wxq+bnDq2J5BpnCSmJBNSTscnX/R4boBx9Ze1LnHIsHODQBITo17bvsYz?=
 =?us-ascii?Q?3S3GPZI+ccpTuIZwmPiC5lFHqk/vgFOWE1sLIsl83WPugyaRGlNMOhb2mL4T?=
 =?us-ascii?Q?re2Dt9ZvHvhnjSO/xpTqyBhF8Czl/n/YwrzZ2BkYSv5KxFJnaw8cyjh9GdAu?=
 =?us-ascii?Q?zzz+0p1jk5JSuSab3VTnFeh2rU0Csz70gYSlWjSf9IbZRBeZBB5d07P72e7O?=
 =?us-ascii?Q?xi2Lrok8ahIPULYmPazG8j9CKzQWiDob8qgErwwwg6+d3Xf4YbVsCZ9Oki8C?=
 =?us-ascii?Q?8sgBdikUVkITt3E34eaFB6vLhXmnPLXIypctJefB9XoL2drWpNMa4ZBdF5ve?=
 =?us-ascii?Q?mjPDXQoDqXJhZ56a1bx2vOO9QV2Q2ALNXw4hehfHFRNahwWfRx8IwwTPc8Uv?=
 =?us-ascii?Q?Ej8gR3njAwG4JRHoOip5jwx/L6P25Q29PGzs0I6FLvTHhGzFwwACShSnBuJN?=
 =?us-ascii?Q?GN+3NIKT6zFIxAOM8oFA/saetz6bBc39eLaoALHbSzm/LoQjbBwOjjwXUUxN?=
 =?us-ascii?Q?yktPbepr3+JM0+cActrNH72m6cMsLIdZHYIDC4BsJkqMWDrCgnDLpRqDm46y?=
 =?us-ascii?Q?1TiSsZWzXkKJzlHQh+WEmWgmh/wZDXg7FUYoU001dSrsSF/eUAIFN/2Dj+1s?=
 =?us-ascii?Q?ssXYrCXlmcENfINCpM+udwu5UE7cr+gRafU3/WIrFke9ZxkVYjd1p042CUMq?=
 =?us-ascii?Q?ieJWiZNdxc1txXb9L8EHpgTupo40kavtWu9WWKSfEPDKvF1vjsaPFylpgcp9?=
 =?us-ascii?Q?CiVN4SYW+WhpXDM/LhrnG5ZyTGHgXLljl9gq0OOFTAiuJJ59cuBDtiBWPOzt?=
 =?us-ascii?Q?TCzzpKuslhDRp4fvoqbug1rHuLIJx/v38pfudtUU6AMTH3snVI01u8CB5EL/?=
 =?us-ascii?Q?nLNORgSivISpXu+aKwTUKVYdsBxsSfeZd/p07S5YdMXBSY3G4fuVoxpIgmAp?=
 =?us-ascii?Q?KvtkdDZdqgW67moS8o6cQ+Uj3ZWtr5g3D6adbgGkfc8FymvDpgZL9N/lBqI8?=
 =?us-ascii?Q?CPVU6qHLWYT1+fHvm5BAo0k4vxIhK9RWOuezfXsA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e77c736-81b8-496a-258a-08db586b8abb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:18:31.7727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PqW9R2Z6TkkITrKWfkBqywsJhl3YB//C5a18BTjPeBENakhCqsPzRib7U/ruR1270BvpnQRMW3Iqqt7OEjeRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 03/11] drm/xe: Extract non mapped regions out of GuC
 CTB into its own struct.
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

No functional change here. The goal is to have a clear split between
the mapped portions of the CTB and the static information, so we can
easily capture snapshots that will be used for later read out with
the devcoredump infrastructure.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c       | 155 ++++++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  20 ++--
 2 files changed, 95 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 9055ff133a7c..e16e5fe37ed4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -172,13 +172,14 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
 				struct iosys_map *map)
 {
-	h2g->size = CTB_H2G_BUFFER_SIZE / sizeof(u32);
-	h2g->resv_space = 0;
-	h2g->tail = 0;
-	h2g->head = 0;
-	h2g->space = CIRC_SPACE(h2g->tail, h2g->head, h2g->size) -
-		h2g->resv_space;
-	h2g->broken = false;
+	h2g->info.size = CTB_H2G_BUFFER_SIZE / sizeof(u32);
+	h2g->info.resv_space = 0;
+	h2g->info.tail = 0;
+	h2g->info.head = 0;
+	h2g->info.space = CIRC_SPACE(h2g->info.tail, h2g->info.head,
+				     h2g->info.size) -
+			  h2g->info.resv_space;
+	h2g->info.broken = false;
 
 	h2g->desc = *map;
 	xe_map_memset(xe, &h2g->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
@@ -189,13 +190,14 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
 static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
 				struct iosys_map *map)
 {
-	g2h->size = CTB_G2H_BUFFER_SIZE / sizeof(u32);
-	g2h->resv_space = G2H_ROOM_BUFFER_SIZE / sizeof(u32);
-	g2h->head = 0;
-	g2h->tail = 0;
-	g2h->space = CIRC_SPACE(g2h->tail, g2h->head, g2h->size) -
-		g2h->resv_space;
-	g2h->broken = false;
+	g2h->info.size = CTB_G2H_BUFFER_SIZE / sizeof(u32);
+	g2h->info.resv_space = G2H_ROOM_BUFFER_SIZE / sizeof(u32);
+	g2h->info.head = 0;
+	g2h->info.tail = 0;
+	g2h->info.space = CIRC_SPACE(g2h->info.tail, g2h->info.head,
+				     g2h->info.size) -
+			  g2h->info.resv_space;
+	g2h->info.broken = false;
 
 	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
 	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
@@ -212,7 +214,7 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
 
 	desc_addr = xe_bo_ggtt_addr(ct->bo);
 	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2;
-	size = ct->ctbs.h2g.size * sizeof(u32);
+	size = ct->ctbs.h2g.info.size * sizeof(u32);
 
 	err = xe_guc_self_cfg64(guc,
 				GUC_KLV_SELF_CFG_H2G_CTB_DESCRIPTOR_ADDR_KEY,
@@ -240,7 +242,7 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
 	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
 	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2 +
 		CTB_H2G_BUFFER_SIZE;
-	size = ct->ctbs.g2h.size * sizeof(u32);
+	size = ct->ctbs.g2h.info.size * sizeof(u32);
 
 	err = xe_guc_self_cfg64(guc,
 				GUC_KLV_SELF_CFG_G2H_CTB_DESCRIPTOR_ADDR_KEY,
@@ -329,11 +331,12 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
 
 	lockdep_assert_held(&ct->lock);
 
-	if (cmd_len > h2g->space) {
-		h2g->head = desc_read(ct_to_xe(ct), h2g, head);
-		h2g->space = CIRC_SPACE(h2g->tail, h2g->head, h2g->size) -
-			h2g->resv_space;
-		if (cmd_len > h2g->space)
+	if (cmd_len > h2g->info.space) {
+		h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
+		h2g->info.space = CIRC_SPACE(h2g->info.tail, h2g->info.head,
+					     h2g->info.size) -
+				  h2g->info.resv_space;
+		if (cmd_len > h2g->info.space)
 			return false;
 	}
 
@@ -344,7 +347,7 @@ static bool g2h_has_room(struct xe_guc_ct *ct, u32 g2h_len)
 {
 	lockdep_assert_held(&ct->lock);
 
-	return ct->ctbs.g2h.space > g2h_len;
+	return ct->ctbs.g2h.info.space > g2h_len;
 }
 
 static int has_room(struct xe_guc_ct *ct, u32 cmd_len, u32 g2h_len)
@@ -360,16 +363,16 @@ static int has_room(struct xe_guc_ct *ct, u32 cmd_len, u32 g2h_len)
 static void h2g_reserve_space(struct xe_guc_ct *ct, u32 cmd_len)
 {
 	lockdep_assert_held(&ct->lock);
-	ct->ctbs.h2g.space -= cmd_len;
+	ct->ctbs.h2g.info.space -= cmd_len;
 }
 
 static void g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 {
-	XE_BUG_ON(g2h_len > ct->ctbs.g2h.space);
+	XE_BUG_ON(g2h_len > ct->ctbs.g2h.info.space);
 
 	if (g2h_len) {
 		spin_lock_irq(&ct->fast_lock);
-		ct->ctbs.g2h.space -= g2h_len;
+		ct->ctbs.g2h.info.space -= g2h_len;
 		ct->g2h_outstanding += num_g2h;
 		spin_unlock_irq(&ct->fast_lock);
 	}
@@ -378,10 +381,10 @@ static void g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 {
 	lockdep_assert_held(&ct->fast_lock);
-	XE_WARN_ON(ct->ctbs.g2h.space + g2h_len >
-		   ct->ctbs.g2h.size - ct->ctbs.g2h.resv_space);
+	XE_WARN_ON(ct->ctbs.g2h.info.space + g2h_len >
+		   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
 
-	ct->ctbs.g2h.space += g2h_len;
+	ct->ctbs.g2h.info.space += g2h_len;
 	--ct->g2h_outstanding;
 }
 
@@ -400,20 +403,21 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	u32 cmd[GUC_CTB_MSG_MAX_LEN / sizeof(u32)];
 	u32 cmd_len = len + GUC_CTB_HDR_LEN;
 	u32 cmd_idx = 0, i;
-	u32 tail = h2g->tail;
+	u32 tail = h2g->info.tail;
 	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
 							 tail * sizeof(u32));
 
 	lockdep_assert_held(&ct->lock);
 	XE_BUG_ON(len * sizeof(u32) > GUC_CTB_MSG_MAX_LEN);
-	XE_BUG_ON(tail > h2g->size);
+	XE_BUG_ON(tail > h2g->info.size);
 
 	/* Command will wrap, zero fill (NOPs), return and check credits again */
-	if (tail + cmd_len > h2g->size) {
-		xe_map_memset(xe, &map, 0, 0, (h2g->size - tail) * sizeof(u32));
-		h2g_reserve_space(ct, (h2g->size - tail));
-		h2g->tail = 0;
-		desc_write(xe, h2g, tail, h2g->tail);
+	if (tail + cmd_len > h2g->info.size) {
+		xe_map_memset(xe, &map, 0, 0,
+			      (h2g->info.size - tail) * sizeof(u32));
+		h2g_reserve_space(ct, (h2g->info.size - tail));
+		h2g->info.tail = 0;
+		desc_write(xe, h2g, tail, h2g->info.tail);
 
 		return -EAGAIN;
 	}
@@ -445,11 +449,11 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	xe_device_wmb(ct_to_xe(ct));
 
 	/* Update local copies */
-	h2g->tail = (tail + cmd_len) % h2g->size;
+	h2g->info.tail = (tail + cmd_len) % h2g->info.size;
 	h2g_reserve_space(ct, cmd_len);
 
 	/* Update descriptor */
-	desc_write(xe, h2g, tail, h2g->tail);
+	desc_write(xe, h2g, tail, h2g->info.tail);
 
 	return 0;
 }
@@ -466,7 +470,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	XE_BUG_ON(!g2h_len && num_g2h);
 	lockdep_assert_held(&ct->lock);
 
-	if (unlikely(ct->ctbs.h2g.broken)) {
+	if (unlikely(ct->ctbs.h2g.info.broken)) {
 		ret = -EPIPE;
 		goto out;
 	}
@@ -554,8 +558,9 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		if (sleep_period_ms == 1024)
 			goto broken;
 
-		trace_xe_guc_ct_h2g_flow_control(h2g->head, h2g->tail,
-						 h2g->size, h2g->space,
+		trace_xe_guc_ct_h2g_flow_control(h2g->info.head, h2g->info.tail,
+						 h2g->info.size,
+						 h2g->info.space,
 						 len + GUC_CTB_HDR_LEN);
 		msleep(sleep_period_ms);
 		sleep_period_ms <<= 1;
@@ -565,15 +570,16 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		struct xe_device *xe = ct_to_xe(ct);
 		struct guc_ctb *g2h = &ct->ctbs.g2h;
 
-		trace_xe_guc_ct_g2h_flow_control(g2h->head,
+		trace_xe_guc_ct_g2h_flow_control(g2h->info.head,
 						 desc_read(xe, g2h, tail),
-						 g2h->size, g2h->space,
+						 g2h->info.size,
+						 g2h->info.space,
 						 g2h_fence ?
 						 GUC_CTB_HXG_MSG_MAX_LEN :
 						 g2h_len);
 
 #define g2h_avail(ct)	\
-	(desc_read(ct_to_xe(ct), (&ct->ctbs.g2h), tail) != ct->ctbs.g2h.head)
+	(desc_read(ct_to_xe(ct), (&ct->ctbs.g2h), tail) != ct->ctbs.g2h.info.head)
 		if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding ||
 					g2h_avail(ct), HZ))
 			goto broken;
@@ -590,7 +596,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 broken:
 	drm_err(drm, "No forward process on H2G, reset required");
 	xe_guc_ct_print(ct, &p);
-	ct->ctbs.h2g.broken = true;
+	ct->ctbs.h2g.info.broken = true;
 
 	return -EDEADLK;
 }
@@ -656,7 +662,7 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
 		return false;
 
 #define ct_alive(ct)	\
-	(ct->enabled && !ct->ctbs.h2g.broken && !ct->ctbs.g2h.broken)
+	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
 	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
 		return false;
 #undef ct_alive
@@ -821,7 +827,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		drm_err(&xe->drm,
 			"G2H channel broken on read, origin=%d, reset required\n",
 			origin);
-		ct->ctbs.g2h.broken = true;
+		ct->ctbs.g2h.info.broken = true;
 
 		return -EPROTO;
 	}
@@ -840,7 +846,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		drm_err(&xe->drm,
 			"G2H channel broken on read, type=%d, reset required\n",
 			type);
-		ct->ctbs.g2h.broken = true;
+		ct->ctbs.g2h.info.broken = true;
 
 		ret = -EOPNOTSUPP;
 	}
@@ -919,36 +925,37 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	if (!ct->enabled)
 		return -ENODEV;
 
-	if (g2h->broken)
+	if (g2h->info.broken)
 		return -EPIPE;
 
 	/* Calculate DW available to read */
 	tail = desc_read(xe, g2h, tail);
-	avail = tail - g2h->head;
+	avail = tail - g2h->info.head;
 	if (unlikely(avail == 0))
 		return 0;
 
 	if (avail < 0)
-		avail += g2h->size;
+		avail += g2h->info.size;
 
 	/* Read header */
-	xe_map_memcpy_from(xe, msg, &g2h->cmds, sizeof(u32) * g2h->head, sizeof(u32));
+	xe_map_memcpy_from(xe, msg, &g2h->cmds, sizeof(u32) * g2h->info.head,
+			   sizeof(u32));
 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
 	if (len > avail) {
 		drm_err(&xe->drm,
 			"G2H channel broken on read, avail=%d, len=%d, reset required\n",
 			avail, len);
-		g2h->broken = true;
+		g2h->info.broken = true;
 
 		return -EPROTO;
 	}
 
-	head = (g2h->head + 1) % g2h->size;
+	head = (g2h->info.head + 1) % g2h->info.size;
 	avail = len - 1;
 
 	/* Read G2H message */
-	if (avail + head > g2h->size) {
-		u32 avail_til_wrap = g2h->size - head;
+	if (avail + head > g2h->info.size) {
+		u32 avail_til_wrap = g2h->info.size - head;
 
 		xe_map_memcpy_from(xe, msg + 1,
 				   &g2h->cmds, sizeof(u32) * head,
@@ -983,8 +990,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	}
 
 	/* Update local / descriptor header */
-	g2h->head = (head + avail) % g2h->size;
-	desc_write(xe, g2h, head, g2h->head);
+	g2h->info.head = (head + avail) % g2h->info.size;
+	desc_write(xe, g2h, head, g2h->info.head);
 
 	return len;
 }
@@ -1093,12 +1100,12 @@ static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
 {
 	u32 head, tail;
 
-	drm_printf(p, "\tsize: %d\n", ctb->size);
-	drm_printf(p, "\tresv_space: %d\n", ctb->resv_space);
-	drm_printf(p, "\thead: %d\n", ctb->head);
-	drm_printf(p, "\ttail: %d\n", ctb->tail);
-	drm_printf(p, "\tspace: %d\n", ctb->space);
-	drm_printf(p, "\tbroken: %d\n", ctb->broken);
+	drm_printf(p, "\tsize: %d\n", ctb->info.size);
+	drm_printf(p, "\tresv_space: %d\n", ctb->info.resv_space);
+	drm_printf(p, "\thead: %d\n", ctb->info.head);
+	drm_printf(p, "\ttail: %d\n", ctb->info.tail);
+	drm_printf(p, "\tspace: %d\n", ctb->info.space);
+	drm_printf(p, "\tbroken: %d\n", ctb->info.broken);
 
 	head = desc_read(xe, ctb, head);
 	tail = desc_read(xe, ctb, tail);
@@ -1114,7 +1121,7 @@ static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
 			drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
 				   xe_map_rd(xe, &map, 0, u32));
 			++head;
-			if (head == ctb->size) {
+			if (head == ctb->info.size) {
 				head = 0;
 				map = ctb->cmds;
 			} else {
@@ -1168,12 +1175,12 @@ void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p)
 	if (!ret) {
 		xe_guc_ct_irq_handler(ct);
 		msleep(200);
-		if (g2h->space !=
-		    CIRC_SPACE(0, 0, g2h->size) - g2h->resv_space) {
+		if (g2h->info.space !=
+		    CIRC_SPACE(0, 0, g2h->info.size) - g2h->info.resv_space) {
 			drm_printf(p, "Mismatch on space %d, %d\n",
-				   g2h->space,
-				   CIRC_SPACE(0, 0, g2h->size) -
-				   g2h->resv_space);
+				   g2h->info.space,
+				   CIRC_SPACE(0, 0, g2h->info.size) -
+				   g2h->info.resv_space);
 			ret = -EIO;
 		}
 		if (ct->g2h_outstanding) {
@@ -1185,12 +1192,12 @@ void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p)
 
 	/* Check failure path for blocking CTs too */
 	xe_guc_ct_send_block(ct, bad_action, ARRAY_SIZE(bad_action));
-	if (g2h->space !=
-	    CIRC_SPACE(0, 0, g2h->size) - g2h->resv_space) {
+	if (g2h->info.space !=
+	    CIRC_SPACE(0, 0, g2h->info.size) - g2h->info.resv_space) {
 		drm_printf(p, "Mismatch on space %d, %d\n",
-			   g2h->space,
-			   CIRC_SPACE(0, 0, g2h->size) -
-			   g2h->resv_space);
+			   g2h->info.space,
+			   CIRC_SPACE(0, 0, g2h->info.size) -
+			   g2h->info.resv_space);
 		ret = -EIO;
 	}
 	if (ct->g2h_outstanding) {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index fd27dacf00c5..64e3dd14d4b2 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -19,13 +19,9 @@
 struct xe_bo;
 
 /**
- * struct guc_ctb - GuC command transport buffer (CTB)
+ * struct guc_ctb_info - GuC command transport buffer (CTB) info
  */
-struct guc_ctb {
-	/** @desc: dma buffer map for CTB descriptor */
-	struct iosys_map desc;
-	/** @cmds: dma buffer map for CTB commands */
-	struct iosys_map cmds;
+struct guc_ctb_info {
 	/** @size: size of CTB commands (DW) */
 	u32 size;
 	/** @resv_space: reserved space of CTB commands (DW) */
@@ -40,6 +36,18 @@ struct guc_ctb {
 	bool broken;
 };
 
+/**
+ * struct guc_ctb - GuC command transport buffer (CTB)
+ */
+struct guc_ctb {
+	/** @desc: dma buffer map for CTB descriptor */
+	struct iosys_map desc;
+	/** @cmds: dma buffer map for CTB commands */
+	struct iosys_map cmds;
+	/** @info: CTB info */
+	struct guc_ctb_info info;
+};
+
 /**
  * struct xe_guc_ct - GuC command transport (CT) layer
  *
-- 
2.39.2

