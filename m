Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D138E92706
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699AB10E150;
	Thu,  5 Oct 2023 15:07:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1227810E150
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696518458; x=1728054458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bXZbJjcx2mzPG+Sgava+Arp8+rfbmT1D2HfdInkQ9ls=;
 b=nUIEQ3YlvEUV4nBve6EMPj/Ih6bO0wkSnP9kCnH2SSUmfc9MAfegn3Wg
 L9kxAor4B/rqfDbdE1sRUiDlU39VgnpVkwi9ZaYH3TOU/n+/qcriJ3cD2
 +lZB/sR1GGjkVPxk+parSjJv3cGxKj8OIre93swN0hIzfTWSBVIp3K9rh
 IVG2TVEL3glYLj65U+afTlYFdLAoG2SqUOQw7VCXHiiwaydB3bU62nV25
 ZvHR5lau0Sc7ri2hs5208NzzHvEq5yLRKqwwccOhI9MqWR/XFcg+50XCB
 Blbmn/thmtUCymuqmDWY7r5EoP4ukCBdg2Pw3HZdI1zJHmZSjyRzLc7MX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447710089"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447710089"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:06:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="701683281"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="701683281"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 08:06:42 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 08:06:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eb8YsoWr8HH5PbQdKzr3t1bj4tg1n5fRJwHRlYqSSayOUNzeyDtPQM9iB609NA4o7jAZq6LG10VdlELINWZaI0nPyzvaBro7cXIZosr/RhtC00ZfQ3qC8ouImD22EG9lasusRmBPFkwHg6qzOHnhHsTFBcT3BwYrLROWnsO1whTORaYkIhZPNvGHoTX0HvVtNdHVoErvxcqhxzDR8HcVe6kUo2Qnj5UNUcIxw/R5Ed/Yjg+ftaU+tj9WESxWnQ6uuXk2SgP5CiCxOBFdz73Qox2uatablTT/05rVM8XxqJY0YV8jE8RvQBzn9GcnQ7ZxJ8OUIwc4BHiU5bretr/v8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gt63O/+yI6E8Ne2q3mHQiY9znCJfo+s54NYEEQ2cFmQ=;
 b=XfblwjIbAsE0SpTM3i3ASOwa5OJKduJZJOo8w4jDHmykj8fpX0aOUvi30143rr7X3qsMdjs1PXzYaMDgtIUB13fTDWImDA/aow0UCDcEI/sT6aHFsSt61MvtAZ+IgU4NwRGzpBkYIpoEqVSfeCTHfFrQtmjyUwz9zi0oqacpmAlrZmj3VM5+nolnRmMIbUZhUAVve8cE1VyYZ9siszJH0Fppc/N3QqVxbaUWzSqf3PbZEeL4BAlUJIwVQIWQBB8r3Tr/NbyPaQz5sKi6f3jI1TEIVWeZ2kcl+CYZ7Hc2li3MPdrlLyqWR+7tSIe+ZpiyLO6a4sF4BhUD1sHwmXpDKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB7576.namprd11.prod.outlook.com (2603:10b6:a03:4c9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Thu, 5 Oct
 2023 15:06:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 15:06:37 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 5 Oct 2023 11:06:16 -0400
Message-ID: <20231005150619.9521-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005150619.9521-1-rodrigo.vivi@intel.com>
References: <20231005150619.9521-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0383.namprd04.prod.outlook.com
 (2603:10b6:303:81::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da8e2f4-8e81-426b-6573-08dbc5b4ac18
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1kwctrx4T1uVQWmlDEFZMq+xhI99EulY7l6C2H9k0/mhgOfKy+X8BTDRYcogVlrS++7YCYvKtsrnd9Lc1AZIFUR9mDql1lWP2TMP63gHTcpr3AVQnfxgYk9i9NSaTBcmVDrNTUGnYWEM5bLvxCJT9PzhYaWYw8CIKjKZ52cqZGylaZXdGDSr97yotP5kucjsX6Cvl9sHzed5NXhSDlCEaKXrC5pv2T9HerQ1uBdWjrNrmWZzD1lU3yMmybfbBufCeUbEUBqjjB5wQJkSvP/7AYF06kThLXPqOEhg4lTCFK4GePESxHA8dXlYVDLbkk5Mp7UB2gX0yKJHvny24O2tBTvMayDIZYzV1OvZv3DtDfdPTTbO1JXaiYvXoPdDKlB6TQP5qd8G1YcIBiJ/x9KYZ/kbZ4n/U6ZsRVh19NnewC605r6oapdkWoPPbiN31EWsp0HLAexf5bz5t0xeg7pQleFdeF2wrhqD9e8WKyIRPkMq13C68be0ctOETND9c6oNpyAQfNXczHBgwan7/uUiYXng7d1manjBFUtySIp2pZmZfgLRs7Zq2j9xaJV+ip9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(66476007)(6916009)(66556008)(316002)(1076003)(107886003)(54906003)(26005)(66946007)(6666004)(6512007)(36756003)(2616005)(6506007)(38100700002)(86362001)(82960400001)(478600001)(6486002)(2906002)(8676002)(41300700001)(8936002)(4326008)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PqZyBc2KAEo20KnUXiERPyND0atBSpBJMHyImxoCd+1II1Dh1LsMbEjpexBf?=
 =?us-ascii?Q?QDWLrQ8VmXaa4ks+zlQzM8ubT9kRENgS6uS3YXL+GH+IipdtQzckALGMkNYp?=
 =?us-ascii?Q?fxVqgCHnaE41lEUDXvqUS7H96Qc1RGRnegWsfWe5Fkx26xeP36kbVYxBhPo7?=
 =?us-ascii?Q?1v2zNNWJZg2PH4PzZR+EQu3gLxKUVPgtotv00UsJYBinrR5Fmo3ZYCn8eWAq?=
 =?us-ascii?Q?3AUlunYwuMBhVgTgpvQ95SEBCYvasWC2gx4Lkn106deXjNTfnfE6Ru8Sqrx6?=
 =?us-ascii?Q?VWpMoM99OMXmmyhTn76FUVuFyr/JmPPv2dbAKNc+TozXKkR+ry23EXyWAxkt?=
 =?us-ascii?Q?ccAhEBOydamY6Igck/2xOwni0NORi3IHeU/3eXpcVGRlfEQDCPLWJd42/FbS?=
 =?us-ascii?Q?Y1x24ED0wMH2A33rtufs/7b/pZeR8kisPrrW8f5+9DdqcgqRqKmeo/BfGHi3?=
 =?us-ascii?Q?PZ1KKlXCVY/0rCdvQlPtunc044mJnD0mt6GcNm61DH6cnaL+fBM8l9IaKrLB?=
 =?us-ascii?Q?8tQGWiuyVWyjYVpPkJd+hvTGhLPEtSj/Uk3Nk/O3kihRfFVWLclh4fk77gxs?=
 =?us-ascii?Q?qybOFIv9lU1pG6+zDMNmfxJUAm83zT3CIZSeFYfqJAzEUBbld9K6R9jL4zOS?=
 =?us-ascii?Q?vNxE0mG42JSFr9JBYuJZfe7HxNeR5eki1Qh6WVwKwfDNOmdpkQDbixbsup3n?=
 =?us-ascii?Q?2I+WGqeojjqHZ574MXqWYHb3ghT6pB1/e54Fik+QTfVt6n5Ns2k/zCftFtx6?=
 =?us-ascii?Q?PB22RrlnnY3RFMF4j3Q4enEWSQIJX/v3X9ndkJv5G1Rd6Q+2EpLO/BtunoAF?=
 =?us-ascii?Q?wCKzVeC+fqvinXDd1CJdYDOknCbRUqb/opV3kYfGuCyQoqRFOO5OwzkrWfvR?=
 =?us-ascii?Q?CUKPLBttxEKcJycnLTMiM8aG0YcNpFkbvDvI+XkHW9YbFH7Nj62JMKAqVzDH?=
 =?us-ascii?Q?bhbYf2nfrSy80p7WC0gGrehoJ56bpblCdHC1s7FGoG/klGWG6nd1byCAoc++?=
 =?us-ascii?Q?DaE3zCq1JnWs/R4iLF58dw4ISal9F3THgnR/VIeSQA4akemgHvbYWepy6RtS?=
 =?us-ascii?Q?9TbEPr/kLfVbW4zwZMoQwZotD5cG9tRsXPF1Pgqee/ppKkT4h1NQ1imzthKq?=
 =?us-ascii?Q?Rzm7atV7W7qdpNb4LLW9fnEcPvBcgV9yubOl1cHdJkFmP+s0IuGramUkOuJe?=
 =?us-ascii?Q?UO8r+E6rkRI6pw/6iESDTgRs7+EntHkJ9uMMODhQm1AMzSjphDIaT5ZC5aj3?=
 =?us-ascii?Q?Zmw+v852dVhJgv0yVGZrHli+Ey3XVSOpXGTjKW2c5GZ3AOA82X5s3vnuRa3D?=
 =?us-ascii?Q?A4Qkq88Ws76X2twDgH+5PKF59r7ySqJl5vSDTu6JWGhtmXLFH6z23G5TiRcf?=
 =?us-ascii?Q?/gBRUzlZaU5/aEuEFeIYpKX2XwspHKdoSR28A6RKEW4gQ6YXy3uybR13Boct?=
 =?us-ascii?Q?Hr+ufu8MAOCRhzqAKt3D6V58Wuv4OiHcvB1Yf5fNOoWZ0M9mQ1Sg7Q05hAdP?=
 =?us-ascii?Q?/wlNhI2HyVK6Ax9r9mfc6pj+esUl7RuKfm2EWdCIDjXCWBUsGb/TyxOSq9Dt?=
 =?us-ascii?Q?hvPHg4OH4UY+qwr7nyvjT8wBHSs+pxp4Ay1vK2WkuQauvb0FKPEQqp30i7sE?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da8e2f4-8e81-426b-6573-08dbc5b4ac18
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 15:06:37.8345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0XSJ09NWG5aCGV6yDiDIhSKVMMXV79gnZ1BHs2I140gSCr1nm0f1rPq4hbWZ0JqjqYdnPErcauxZqTW5dgmlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7576
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 3/6] drm/xe: add a flag to bypass multi-tile config
 from MTCFG reg
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
Cc: Moti
 Haimovski <mhaimovski@habana.ai>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

Skip reading this register as it is not relevant in the new devices.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_mmio.c         | 24 +++++++++++++-----------
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d1f360f17ef2..7d816a5df1fd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -251,6 +251,8 @@ struct xe_device {
 		u8 has_range_tlb_invalidation:1;
 		/** @enable_display: display enabled */
 		u8 enable_display:1;
+		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
+		u8 bypass_mtcfg:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		const struct intel_display_device_info *display;
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 3ccc0af4430b..054ad752303f 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -318,26 +318,28 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 
 static void xe_mmio_probe_tiles(struct xe_device *xe)
 {
+	u8 adj_tile_count = xe->info.tile_count;
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	u32 mtcfg;
-	u8 adj_tile_count;
 	u8 id;
 
 	if (xe->info.tile_count == 1)
 		return;
 
-	mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
-	adj_tile_count = xe->info.tile_count =
-		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
+	if (!xe->info.bypass_mtcfg) {
+		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
+		adj_tile_count = xe->info.tile_count =
+			REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
 
-	/*
-	 * FIXME: Needs some work for standalone media, but should be impossible
-	 * with multi-tile for now.
-	 */
-	xe->info.gt_count = xe->info.tile_count;
+		/*
+		 * FIXME: Needs some work for standalone media, but should be impossible
+		 * with multi-tile for now.
+		 */
+		xe->info.gt_count = xe->info.tile_count;
 
-	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
-		 xe->info.tile_count, adj_tile_count);
+		drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
+			 xe->info.tile_count, adj_tile_count);
+	}
 
 	if (xe->info.tile_count > 1) {
 		const int mmio_bar = 0;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 32d9ef1e6dc2..1a57bef75b6a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -59,6 +59,7 @@ struct xe_device_desc {
 	u8 has_display:1;
 
 	u8 has_llc:1;
+	u8 bypass_mtcfg:1;
 };
 
 __diag_push();
@@ -564,6 +565,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 	xe->info.has_llc = desc->has_llc;
+	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
 	xe->info.vram_flags = graphics_desc->vram_flags;
-- 
2.41.0

