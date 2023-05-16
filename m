Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E7AC7EE25
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DFD10E25E;
	Tue, 16 May 2023 14:55:20 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4946210E25E
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684248919; x=1715784919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GPoM3F13StpdDnHh69WZSTaQmXjIA3LPYWqfC4HQZEM=;
 b=H573yPjw0f6RKu+6DN7/Qgfq8b4NP33t6akzQJmir89qRa7w8XgFG2DE
 O7+sxlYhrCUkRlI1r0jKnaZvvAgk/Kdoii07EWPDEVt6xhbEM8eSsAjEC
 R86eQuuOrZmddnUMBMk6lb/V7279UFd0KjiCux0a+18uKiBt4ub7xT9ed
 nTor5SGSOolRPPvHgn1712oAlmNn3Q/t0xQwWmjhJRKAxSI2ElIw2Wk5f
 P2tzi51Il6+8TiOylCqdgLohrOekVEITEeV+vU9Nka866lVXW4sLnu1Z4
 CmVevdBaGzWCqgbxZsyq8AmVHg7reh3izphs2/+Y/PiYBdWOtzof0Ep6I Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="437841885"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="437841885"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="791102035"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="791102035"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 16 May 2023 07:54:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:54:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 07:54:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 07:54:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqi4u0pA6cF4DCytEsqgltUVQ4dp5P+wkWJln8vkpHKT23PW0GMan1V935/dHYKZiN/8yLFJJSeuaf7V/IV/n1smWsJBQekZM1C4VdNRUHsIKX5UKi4ZbBROTkh/zwuWweAU5PbY+ldRrpMrGIvY722MJ/PG92ZMAlfy5syMu/JTWovT6YqVA83SXBwxwy0ERVLOONaOkS2ZM3ejiwab7qHpbNA5nxMF2OaubPRRdqDhLpA6nkE3zPKcCtmNhA5Q2THn99SlwH4RnZDMgoB7AqRWyB6j4k3ga72xCK/iwNAdePQXGeX83ubL7IySSqYtkBGhwnJKtWhjuZJo6L09Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbTKx4ufv7oqfiM7m6jcKwKUPLY4p+i+iWgPjpcP6og=;
 b=h8g+nAAHMvU4REYZBpWQn3/pTno5FAPxn7vUySOtxzGMMhdeGBSuW7cQMN2fDz6GEyD6hAqKzM5bBNigIJQ99xwUqLRD4jDOB23nPoystJiDGZ+u/apI7UGfgThod8cs+uv/CnBC/GBWLRy5NgVKnx+NfHGk0ZS5tjDFffdpCXNKUdsYjnqJFe1iTvPSg6DzVGzWo9Xx2feZG5lXBZPkqKOp5cFhmMNMSnGaPTqTK97tDRjPg4abxlj2wOXDNnlbiNMt7ZCfnYBRP4qaEn6KatjMyOA4vn12t3OjZEf4IW2zCOVPk/GFx7UgYa3sd34HBL6AFNsXunXgbov6hNdQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB7702.namprd11.prod.outlook.com (2603:10b6:a03:4e2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 14:54:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 14:54:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 16 May 2023 10:54:08 -0400
Message-ID: <20230516145416.1851984-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: ef0a31ea-97e5-4e9e-2ed0-08db561d74de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: av5WF7RvaVWH1xzI8HGJp4e0qqt1AGwAQ25a4lUo9qIESTSu4KlbqT5xlBD0qXMvb1+08bvTlrUh7nz2oBAZvExaXJUDKyKK6d03YXkXBHQ1SjpE1uYyTC2ZaUiGlx2VKaJh2epggFIB3iY1R+qSUtHeIVBCR4zjsnUbsknWsw6uu2bDaR1sgFEk8mmuSVb53/9in46BmnWRecus2WxXMnAjDj8kj1kMPKGb5RZ5wmj0M1XdaVPDIZ1kXgByyqz3UV/a7oFbmgcRI8nlFR9B/VpFJ7YewmORuw00REoR9g+ff8YnP+08H3Ly0wkKX4BdtlafqpLpOAY6NfEGvmNyq+7C4hEhYD4Legv6njTO4QEWzh/8LmANJuYwmOMlaXZfEffVMJdWIw6cohtUtyJ6bTMmnq0S4mxnDbVM/HrEubaKoBT+fszUZfddKY1qYQyy8pjBt0jbvg6KIbLLzyTKAf3UIqvlX4iLXQZCGAbH4EUsr9ANSV1NGVobv+sYzYvJ/2zh+zxCTkyJi1UTdKbVacpbyysDjIPTqwNEAG7y8zEYlvqkbZLqZoI7f6Ko2TtR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(8936002)(8676002)(478600001)(2906002)(30864003)(4326008)(6916009)(316002)(41300700001)(66946007)(66556008)(66476007)(6486002)(6666004)(44832011)(5660300002)(26005)(6512007)(6506007)(1076003)(107886003)(186003)(82960400001)(2616005)(83380400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xS0m91Aeb7alZRc2D5ORwRo5YqJmYPvvBCwE+VPZO4U43TtzV+Nkib3q3pNv?=
 =?us-ascii?Q?EV+n/hGD+Y0KniOs8fhHe5YQ9s5dXymk04a3Wa1p9V3xQrT0DSpnZYyUYmIo?=
 =?us-ascii?Q?WmMszBprkc2Vi+wGi3yhM7fFSTY1yDbXAwjXcY3mzlJT2IYbSXsI7+HnHM29?=
 =?us-ascii?Q?PaS9oq5Hr1T8WUiJZzlmtQ5c0+T0xxjCmuyMcRJqyX1ABQ+5gRzRbacF4+IU?=
 =?us-ascii?Q?8JStFrGbkoaxvOnxhE/3QVMyeBK17kvvuPZJw/3odk5d2pEePk7AkxEKXHFU?=
 =?us-ascii?Q?PtO/MHcIOXPyqwzfT4z48kBooFhWsBAikQcgzZw43lJ5G3Vx3NK1Bpn6x+j7?=
 =?us-ascii?Q?PjI/iSZGrvmQfr3AaeFEGZDD+/TcD0e4DvtmPeKcZZ4RuT51ED0oRZwyJRES?=
 =?us-ascii?Q?mUtbbygscVW1LBt+oWU58xOOiK84UmSzHfHW/dy75algRAnaocnkxWzQPbjJ?=
 =?us-ascii?Q?vegC7iy9WQXkAUsIWSX0Lp6CXz4/zncy0mYwT9glTYbH31BbIhbXj0k7cuZ7?=
 =?us-ascii?Q?hlCczAzf1DwNv2XvnhzHTIkP2xm1mTk60MIc5tOl4+JqQKvhB/CwI0ErJHLW?=
 =?us-ascii?Q?uEQc7IYEAWFtwR6nJr/8TD9AnS0oQSL1NBWZ5gIc+GeKu/AZLb7/cfFxI9PK?=
 =?us-ascii?Q?zagytjmgl9eccs7JqIMom1QpSfqpHF0BpF8WoNa/Q78XXaUypqrg124amxSU?=
 =?us-ascii?Q?bUzp8qNVsKWxpmka4ZdrrLpxhW0xt2sruEMsnA6yzt/XczomEHP4X6/Gv6V7?=
 =?us-ascii?Q?FdAdeoXuflGHbd4eOxPfPeMNIy4yUGm5Ef164fQKM96czE8H6vtE4NLiTjXg?=
 =?us-ascii?Q?Ze1oFVOY3lajEMyErVEr8HDOw2uHdPySxr1e0y49nObNVYt9VIkzPrtK9a3V?=
 =?us-ascii?Q?OUAhI+dxSY2dbu/f68riaK99ulPSs2m3GFptFGuiM4+yaMRRva88ZqJwnB06?=
 =?us-ascii?Q?WpixJmcIXjVHaD2fuuMeRrY2Il8qx4hnaNnGOGljsIlqdzGI7xpbIGIi4+si?=
 =?us-ascii?Q?eSGpnnQXCtcNuJDuBl+UY+prkw8z4LSdOvEgY2Ysmps0NnYkzXTk6uPU2xaV?=
 =?us-ascii?Q?bOZRKv0GJHmdqXsdwFXnIPTOpKlgfJg+qLd+PQgx4gvK3m8UbIg6mmqhBSeX?=
 =?us-ascii?Q?QkL7GX/jNBrs66vCdnHHbdTUhhUNYSe9hQzJd+qO9T+PYr/8pjGvikLDN/7m?=
 =?us-ascii?Q?BpUnwVlieOVfPqNY9RzZyKnkkRd0NeOEy8Qs+lvAbZao2Tv6tROSwLOeOETY?=
 =?us-ascii?Q?ex3p6r2DOWPe5WkNqAe3JH4G3hK0v2MwNQdzAx50EwyIL8YzJ/ZyfXc9yU4D?=
 =?us-ascii?Q?f7p23j12RHyQQ4R3mj6k5oYR+sJg6ZUE1wU285+UGkTej+pTzl54Q7T+DwQs?=
 =?us-ascii?Q?Tr2ykUwiFACGgwMDUsYoIN9oj2SOq2Hhsl7GQma6I4GPYeA2tkOOe1/Ay/c0?=
 =?us-ascii?Q?kD1rK84IfW9U8PrpI7rrW4ln4wzujp68lq7qc0BOwEIZD6AHnAywingRv9X3?=
 =?us-ascii?Q?L6aeaWPupgQfgQsxJ+mc2T/23r7GBLNbFIDBg9X1Fra1dhtHFHClWX08Ecqb?=
 =?us-ascii?Q?hz2MWqSsYvZB+KdiBgB7lwPygsLas6cEABhGBKvB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0a31ea-97e5-4e9e-2ed0-08db561d74de
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:54:32.0919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05j62c5aSlO2oHuHmVLwOnN8nv8GaJYL360H1Yyil7L0/Ub8VLvEDWIKFCjQME/E2Luw0O9EZORgpqkf622VTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7702
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 03/11] drm/xe: Extract non mapped regions out
 of GuC CTB into its own struct.
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

