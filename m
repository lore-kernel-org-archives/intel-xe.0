Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB81C7EE24
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D564110E17E;
	Mon,  8 May 2023 17:06:55 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD90E10E17E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683565613; x=1715101613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GPoM3F13StpdDnHh69WZSTaQmXjIA3LPYWqfC4HQZEM=;
 b=RO9zSlfycmrUu7PAPUpj9pXZGb0k3wSAtVOcZJCspLUQsaXM6lreKymW
 f97P6xThfu1jJ8ukpP9KMUjI00OpPddb93KwY1qPBYwJN0imoQbBehtQi
 ZG8GD8IxR4grf9szhPYOSYlYdAUXNMj5eRZKMHlNxiQbPguAWavpYv8oO
 KHOPaxazXMaVtt+Bspshyp7/HvvXMbkgg88iYdNuG0ofGJTSMU+U+dMMo
 WclNSEPQ73dA2jFMYG50nR/GpKB4/hrNI+ucgr7//W2mo06R+hmvJmZXZ
 K37YguMJe9YDH1V7ixnRJyPF4AE7laS+IiOELOplwD1Wq1aKqmlCNOMcF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="412963326"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="412963326"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729149497"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="729149497"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 08 May 2023 10:06:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:06:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:06:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:06:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcTJ/Xzt0gqjTm2Hss881zKihBIbyzlSmRZZzOrM+H8IwmOfRYldjyKcCcoMHxLq4dndX00vN1JzpRn86G2SEnyp2maCdBCxibEn20KG643X84maxwORK+0CWWUn/Q0GsEsdIexYBwp5hkZAArFtH5jMsyqsKi7lnc5c03WWyENyucv5abFNsUVmTKGyHXc0gVEAZQ19ZKo+iIRochMg0X/9NrmBRfXFbRWLXMFnzgQxvvnEXlYe63VJU0uCdI6pBtixTUvohXZBsjqq0gPwGSqG7Gto2y901Lq+QUlWchB/5x4cYIcwFO0xlDct/v7zG77PmaTYYhCRPxpyKBZd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbTKx4ufv7oqfiM7m6jcKwKUPLY4p+i+iWgPjpcP6og=;
 b=ASHfiNWBrITef5B4SqNtIUqwrKlHcaVStedFAzgotjYL2UJkyNNo6nrfMWjyJcpsI0bzMnk0XC3+45u1zIU2LxeVUi6Su2cEv5VHw2qRMEf757bLqp0zdsHJnaqbmOWtCMZH/AXBmAeieIZKzalR8jmjE7KNdKvDaTlvqi+8fCc5l7gIY/shx6owfbblegOkcyiZ5/8ZIhFoQK1fcofxtU+zW86VIK60zg9wqBgDsomXfqHvTaiGgSUBHjQ1Ytj878iSATei3ClAO8im8ytz/IloUO9uhO62DV/x1kJyCNRGGxyoGv6G12xT2UXvmI2eY4JvzE2HbqazWw9QNBqlSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:06:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:06:39 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 13:06:08 -0400
Message-ID: <20230508170616.1289914-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
References: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec50b6c-b3b8-47bd-619a-08db4fe696c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rG04kMWbshXeanO/dcJxzkelj8fchLYN8QkjLfWxS7Qp9yikCx967x9+WRr8SCOnVQUBzzpnT/uFTB3/jAVwMca9qvczsUQhN3YK3UtyA2fX7GkLVDTOT9yeHT/MI/RAgV8oHUVf7jmZRKsWYzK9n7fwy8E3OG/WlmQ8yVowuoHVH2B1HMxxRmlUKW2d5H8mwAS96VCj98Eg1x9sz3nTe+/cMgJ41r4MRY2benfg2tP1bVAqV7rwQ+HsQWYW71fI+RvQfJNO/1VGbZRulAwc9SfeDOLKb7xYGQ28JKB1+beKwkR4TVjSW2jItVvj1LyVRNX2lkG1RIwCWG2Ubzv/EjCqfh+UdSClUOdEZCUeHT2Pup8nuqAvH8PnXlAiKsmzwj7XtgN8cpdYFpXsl9IthqiSP5rG4U7wG2F/9Ms3l8T62AZkXwXwjt7/7RJUNDNhY8M+OdGd8bxtLWlQcnYqM0AEY9aPFos3V93OTPyNPfSwBhsAZB59wttYPaVUuybt91+zYjoVxrTzqfYjPvj9hh0QJ6SoBBwp0fZnw9FMqzoqF20f6WHRGRT2KcAHik2P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(30864003)(54906003)(2906002)(8936002)(316002)(478600001)(8676002)(4326008)(66476007)(6916009)(5660300002)(66556008)(41300700001)(6666004)(44832011)(66946007)(6486002)(1076003)(6512007)(26005)(6506007)(107886003)(186003)(82960400001)(2616005)(36756003)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wcyDxlYWpvhuZhQUJdfo7YnkdJcuu8cJiF/Ij7IkaBBJgeivzGxOaQRHq/SR?=
 =?us-ascii?Q?uEvmZB2T2iuUvVtIvh1uGNc8ByRi0tGxDrMcRmrKAt3EkdO7vjAspoOOYp2t?=
 =?us-ascii?Q?sn2GzoOvB9uqMbSH87NNuDexvPVwLo7HQxP8sEClHcBXn9ABSXAPYCNC4CPq?=
 =?us-ascii?Q?NQtY+wCWWeqkhz2nkRYjBr9kQ6xbCZ+jflqqf9fRfb2YpIPdTWbcdlpuJJAo?=
 =?us-ascii?Q?y6dGgxxbqQyiUEXezTO7G8EK91ZIY985oQV0wtSa4tfQz5R/b98/aB0gITTS?=
 =?us-ascii?Q?gm325y6P3Ovh9WW+ovpV4TN3YWeaXMr8JF3XqIwgJMg9aojILC36uIj2cx7w?=
 =?us-ascii?Q?Np4fdZbVpfP599ZnCKh0zKn+jl94W1apWxbcv/7dVZh4hWKaUHInXM3btjs+?=
 =?us-ascii?Q?nCiXVxubpkmy/5qc+Y6M/biTnUpbzeDaRL+aH7EzHwYjc9TeZONWOD6zT9B1?=
 =?us-ascii?Q?EyedacqJvZa4aqU4gNrVnErhz5g9IX5gO58EBdNmC9Dx53Aygng2IpRlONqA?=
 =?us-ascii?Q?Yms/iN9ezJRzoqVnQbLjtfBFru9BSyXkl/Rc2U5MJuWsuufzCdhYisGNb4+/?=
 =?us-ascii?Q?vXk8WVl8fDvhUY8I6mRgtbDM3inrmL8k+WPtnYzT+1UxcmCHv/paSp4KaaAR?=
 =?us-ascii?Q?Wz2K1Sn1b7IYlFhnL2tlTjiUO/4BK7kcF0nF9UCqty0HU/gU84sKxn9zDsD3?=
 =?us-ascii?Q?E1LvK+kPnAO6RAVV8Kvhk2uAP7OI5MSzpwlZRL/3GJjQJh8u3oWLuXjt9rSo?=
 =?us-ascii?Q?NhEjWo8Hhl+Dl4OIpiqtOfJQykLRLIlC6UvE4zXYLUgZEG097vsmdtsQEaie?=
 =?us-ascii?Q?hTVnnJcmBDfw52+OMxIT7ioxmV6OrkA2uYkFhAZ54kehLi4TvlgZvNtC6RzD?=
 =?us-ascii?Q?uj30YZt+b34u4tt9Xr/w9fFxYF+yz63bPwe/+SnnR3I+24IM+soIkc+hQv6g?=
 =?us-ascii?Q?yF0b2p62821DNfcBvG+7o9nUyR1U/c47WT8HyYpJb8vCwMFlZ5UScNTLrQOs?=
 =?us-ascii?Q?nNSKxf6ClxlJq7cjCXuKB+inPYPPVynrKfExnfafnA9enlOd5DkceH6LuJw2?=
 =?us-ascii?Q?C479AyFC3yA9BRdAynJ468TEr8+s88G3ocN+oQ5OW1cB0VVsnOqRtNt5ENoC?=
 =?us-ascii?Q?y7oR6b14xw7RVtnj6+vVDAnkxOBRrszuhy0+duHeXyiMrhkIMJJ7FrbI4b6X?=
 =?us-ascii?Q?bn4EP5TfQLvq+i6rPw5oiZzk6kHhdnSz/vYxsZjy7Se1J3h4mTpvr++jVUMN?=
 =?us-ascii?Q?Y+rCfX14Mhooh09IuXHH6eRCjYSg/y1JBPCTSPsiBGF+DDcOTEyZPwHwjKlx?=
 =?us-ascii?Q?2EwMKth0FtCmuKWi4GyElDPbtoVhuc3itv/i4Gg8Dpy5emw+9elvLizjbe05?=
 =?us-ascii?Q?NWsFO/9OxVbQv2iejUA2P7RqYmK76DkBt10zIm4KsypC8Vcia/GEwbohTNWt?=
 =?us-ascii?Q?fIjZ5/LUozktirBTsAL+iKK+37Ctw/vZP9WihaK+PyLmSTYk48I+R/EvLZn+?=
 =?us-ascii?Q?q16sV+q0uht3tZbpwjoIx47dUmpQmBzLL/4j2mFph3DwCBGFXo5bDx2ywlrp?=
 =?us-ascii?Q?nQF8KDIUAz40yO30eqpmnT3f6KBgNjv4NVuIaUbR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec50b6c-b3b8-47bd-619a-08db4fe696c6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:06:39.5857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPJebE4rugSOZtapDzzdjQ+Jk1IMmBxu2bprD8cX6lz+BbY0/rgDRl8IzF30DTR23JZJhbRq+BF4/LDFZ5KksA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 03/11] drm/xe: Extract non mapped regions out of
 GuC CTB into its own struct.
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

