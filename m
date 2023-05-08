Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCF0C7EE26
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C8310E06C;
	Mon,  8 May 2023 21:08:48 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B576310E06C
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683580126; x=1715116126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GPoM3F13StpdDnHh69WZSTaQmXjIA3LPYWqfC4HQZEM=;
 b=oEYI9dZk3s6e/OmEG9GtTbjiXxueCKFJaooYmKrl40IuViu3BLHeWlIl
 P3itFYjd3xLjP39FSyVQ+9ynVtDhdpyLS4WhccCOLsoQFyKgEI7f0aldk
 7RTa7ngzFnXjp4YTA2CeS2zhShGEcLGoUzJx7W00/J5RekLpzu37o18eC
 +qk3PkQ64WcN61yBYj/7piGeLQu5Jfak4hoXQvfUH4K2tpvchNXASyvYN
 4N4XJpTSXgOP85+EkbvBpVycVDg6OzATnqTeOG2sFPY1Pbg61Z7XxYvm+
 5d8yjAkq9VT0YX05nc82MSpAxz/z6+WyYbJIPj2LbUMqyMGpxNbBw5zLi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415319287"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="415319287"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="649029229"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="649029229"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 08 May 2023 14:08:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:08:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:08:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:08:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DATLU9H038A7smvie2xKPFgpfExT2DLq7hbZ+ELHnUJwUazGbY3enfp0VUqB881f0rbMKhjkCX1DZgsJBEHUr3tx+QuZcZ+5h5I/jW7Nxx17H+qEashsHdcFcKXTKZ13UcnLHkVRebTQeiKhG70NG70qg/Cct8sPU00xcN2DFKX7Zpx3flDrASSjnX3wAJ0VRsLV2mF4SrbarSUyNSwPprltqEmPi60leL3lhchpgakbsXHnt4n20Dxrz4YhESrRg5FzBOcvFC2mgTTqB3wj48yThdzRFZXrEkP1wwBa5qzRQyJE5Ld9V5+dQKnA84r+nytKnj2uHXcRre2Eh5muuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbTKx4ufv7oqfiM7m6jcKwKUPLY4p+i+iWgPjpcP6og=;
 b=MzGo1HwkpKUXJgFwAOH/RdHbQwEtHTxecK9YZcgvqjLV8gQAtRfVb4UDV2pmHyltXWN5kjbwwrAOQChcMbJWHT4zfGDa2p6JuNaWeg2XdT2k9tmz4hup0uX1inyCbJv3ohwhzsAQZEbCL4e+CKzi/vnEcBw0/D7UrThrONOg1hrJetRKkDpfGAWHm1V+FmFQamN+L68zfLf7wIOc8exjGXr/1bbYfDHZ0S8nT9i3CoURqvYwSpBOCSLomv+Iy0SQEHQG8ESjbEn8HxOoaw7LVN1qamdJfiVK0oic2qVANLHLKtcIk/iUjVSaE505ZqJMMnOP6ZXc346Jr72C9P05JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:08:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:08:39 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 17:08:17 -0400
Message-ID: <20230508210825.1405432-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd2eb83-106b-47ab-18c1-08db5008656a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tvdIQjrTWdxCPCxpwdf9Dc7osFbL/Pkl3CrRww7OS5ziZYTGlrqRyqtrvqhabW+AfST8deQRw5sTSYen+5qQTKJq1Sf0kwhfScXf/W1ARQnnfUey65mdLiDJqjbwCGZozoaj6fJPPsCPPczpU5TJ5w9wKJenG/v5KupEKO/2fCLUZrrAJ7gP2eYZQ/K8bpjB6AukBUrBMAmjTul/QsAeHO5qbRF8BBWAK0FWWVtC02YtPmvH0CxmSz/+LyK/IMQCkVnHWW/ob95ipoVCNXtX5jOPPzkv9OBE3ZwF1ShboLQ6oNZ29P0luppQ9fDhnuPA2f6hUbQNjzDZSttOh9dZrqMgH6G85FQhJEOSWMANdA57bbI9VMhoZcwWXBQ5IsBgoKMakBv9Xq/QXYpnc5U1VF9KvWWmtDxq/H88a2b/C6Yc2WKQSinzAC+KjnwJqs87T/F/DrvmDxy4O1Zgs1L3kJvFX47BWdhMOKEuOS+WvIZLqBe5hPhkJANVszFkSdZ+pnhfIozjWA0ouVQgsS6lWSyBgugu6xN8zDK4/ZP5CUXUdB9LtnPdC/dJy/uTZ9zm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(107886003)(478600001)(6666004)(54906003)(6486002)(2616005)(6512007)(26005)(186003)(6506007)(1076003)(4326008)(2906002)(30864003)(44832011)(36756003)(38100700002)(6916009)(66946007)(66476007)(82960400001)(41300700001)(66556008)(86362001)(8936002)(316002)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IX2g6Zi6G+zNI3eBtoOmKFKvJ9NVkLFtShXRfvYlsdIGkW/D5WNghF1bXFLk?=
 =?us-ascii?Q?JdfE5o3psU59icgqYClDgzjdUiE34o4rLDs9JhRBnX1bgR7sSYwHLw96KnVF?=
 =?us-ascii?Q?cKXjJc3Z/6a5kqrJG3l+53dVkdBFjIowJFkOkv48JSGxEWtUYmB9LSKDrLCU?=
 =?us-ascii?Q?5MUxb+Qtze8tKMbod9zzDvADdyCmEvPEvLF2Ph8w4qgsjpazhOblq9+GLn33?=
 =?us-ascii?Q?2+dFTgfv3XtNNUkgBYgHCbd+GoLuwTSc+OImHH5shf5cd0eXXTBhsVPuHEuU?=
 =?us-ascii?Q?qgfPaK2rISKQnUzImGmotqVU6vz+sivGYJQPQ0GdnZ5tUW1wFViqkgzKUqLJ?=
 =?us-ascii?Q?DL/jf0NSTiwjiArN4pcILs4ajgTzC4AsEO7nJw1wCxbVp4DT4r2cmmwF2vbC?=
 =?us-ascii?Q?pbGIFTiJTflbzXIzdKJvMfwAv7AwVyjJojSFo2/AX31SaNGrcFlWl1goh9fy?=
 =?us-ascii?Q?HBBh06D8aBmoyjPpsX2oDmDELmnDnNPZ6W0tcIgL+Z64Bddv/WqIv94OWt/7?=
 =?us-ascii?Q?bs6+lUoObmUMpfrqS9rd10Nre+vjFtYTIXnIM75rbeeJP8oL0FsF1CVIrcUO?=
 =?us-ascii?Q?VjJTuO7jPKfWDV2e2aHmnuyWxKmhugz6AQjbk8DP8h3qI31FJurZXvhqSMWr?=
 =?us-ascii?Q?xNVEAsycUNynNridVSR+hhGd293hHGDeygELAeK9BoWrwOyoS9WOSkohmC+O?=
 =?us-ascii?Q?DdHCV6rRi+vCKpjDmANiux7oA8kqlvrXG8ERRo2aWYn7n9QGR1SPGl2OrAEt?=
 =?us-ascii?Q?a3WrWSN/7Gwx78sPKPaGEshXo7wHJY9adDwaxFpwmjMyYMU571xb46WzX3KV?=
 =?us-ascii?Q?lH6qp9ZOumDh2VLtU16G1Yd2XhlbBnKzD9c9U0Q5gFEELR2lYC6UyW6Tqy80?=
 =?us-ascii?Q?UPqGPirebXOI2U1iJiR4ySoDNjcWfhy72AsyqiFxwTC3d5MICu0Hu+MvzGO1?=
 =?us-ascii?Q?jHFCsUD/RAOK333ZiGLuNElox5yuzlaiNtP9KFcg3cxx7Nbr0uhTygawj/zY?=
 =?us-ascii?Q?WYobwMLfiZfYLRCs5F4pVkWZ/zHUff4f8oLZat3XhDtDYaKMZwc03Dsj9HDT?=
 =?us-ascii?Q?TyCI7FajZez62H/81iYp31YxuWnFAuj7V8vFze9wycCvnGE0QCe6up4jeGVw?=
 =?us-ascii?Q?Jo7Je30W5tPHK9IQmLJZ6Bz05wzhj8y7vR1UOU8/8iDYkGhc1gdc4EN0lCUa?=
 =?us-ascii?Q?g25ccgql2ANuHDySQeY7qDmUy7NgSdJ0GGezln9S9WycBf9U9FxvFTOXEMM9?=
 =?us-ascii?Q?/KMUXgrFzcAGwOv1w53DlDswDq/f+aSySsm8u0Yvmqiycb8TAXVcuq+VvwF5?=
 =?us-ascii?Q?JjqkFjFhNkxjPEvZ6Y6HBbEXOsg1cof5vwK6t2sX20GA+q6/hDmaJOAHArlc?=
 =?us-ascii?Q?rStXvr/zYdPbqAI8M0MmRCdiOCi0SHWXvnsh54Xn3Sq6iB6Wwt9l6JPDX/EM?=
 =?us-ascii?Q?LQCx8Q5GPcoCJ9cV4CFNhPeHiaf+HI+4j9Se8H6nTph2ATh2goLbh5KWFfdI?=
 =?us-ascii?Q?xLeB0LPCBTH4nNILdILcQT0sLYFiMr+XbcXhBMmQujdm49fV4IEGJxhi7CtI?=
 =?us-ascii?Q?9T4jxzx20cxmHxfCZ6X6PDag8SweiPP0kGZDoVcdv6CDXBG7+Ju4COTPiID/?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd2eb83-106b-47ab-18c1-08db5008656a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:08:39.7288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQ8UTZZzu8dSWQPV0HaTiPWGHa2YUhYzV71AjxF72kVOa+++w6Z+vWxfvonkUCfo09PE6JZaUVwWO30Lle530g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 03/11] drm/xe: Extract non mapped regions out
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

