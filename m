Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38802E9371A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 20:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E774110E497;
	Thu,  5 Oct 2023 20:31:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F1E10E496
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 20:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696537903; x=1728073903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bjDJzvpbJW3Hio4oQK2r0JSZ8idT/Xxm6WICWPRG4yY=;
 b=kQIRkj5h6nlQtwoo61iV3xjn2ooKnDBb1C9QWTqrHoEcH9UaEPJbnu0/
 FNCPSv1d+xde/7FNrtItfcaOb0hQHnFghlbgIwX1QkspU6+udAYaiEEnE
 3caHBfxu7mKUjevMS8OEfa/vBugr68o7JtJ5JZrk296dhH3ZLIZXHbTe2
 YtMc7JbsrYtCPHF5QqvAhBTiTeeGkRoQugktiQQqBuYMctQnMMAWpLuTW
 mGWgWcdLgSA4boeoz+as4bZkqPnx+MnqCkdms+KGDEyCARh1peVGYulyC
 9myubbfZmwcECdHE/yXgLIA7mBFOWcqKUWXlKUJZI0kjPtYy2R5tox0qP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="5169653"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="5169653"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:31:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="842557818"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="842557818"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 13:31:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 13:31:42 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 13:31:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 13:31:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 13:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzAzXAed60564b/ZpnQPnshvsIwyptCZMq/kl8Vk7kQz41K9ysFLph9qHliZP3FZLWoeCCYHLnDA4wp2///3C7M7cTdVzvf+VGPPJ0+vw/es5wTnXAJQM6I4G9xFUQtIFCwTL05mMbhEmU+1kFteH/jOzQ8pwcTjStYP00QlksvDrvGnJ16Kl3333tONPXvTL4UI48pNatFi9XTXqi1zpRfMWUzgFPWMCCwB9hEpaegIFv/f/gLcFpG+9shQDKLcsRQU4YRXrNaIHl2LWTQT1cb1r6pBZYmCU4LfqRP44wTGGmXQaLkloomvigva+xawi2tRNIeoUdtvJYpTVoT7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq0JhCCm51lIZx2CSoS34gdl7buJ37rNgJP/PUe0F04=;
 b=RUpClisBLhe1V4sUqN8Qp7LheuCwRnI7WVKwBwHK4FiBMMrxMvwCFu2y/PqUAV+K3wz7H/SOlnr7HDrNco77WuF0zADaA+rKCC5GeYf/R2fVZ8LV0LSxOzYvXlqX+7+969/XJvtHoAF+5uhKjcFlilXRCW87BaPilvBrP8XJgA8ss5Eu0O/Kt1umhmlZ2opwIyDX71/IpCAIZreIGgwx2Jee9cQlVd20CJtrGTWgT+GIfZ8PdC9x3jpjYQAvJR0J3w0UE9mhUSpUGxuXSQ5x+5kGpvNC2uYbR9r+PA4YVy+ZljzZuxTcMogoL3KQf8Nkh87YimFjqacqesbcMojMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 20:30:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 20:30:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 5 Oct 2023 16:30:29 -0400
Message-ID: <20231005203029.14849-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005203029.14849-1-rodrigo.vivi@intel.com>
References: <20231005203029.14849-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: d9fb371e-25a7-492b-986a-08dbc5e1f9dd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oW3lkogi26D61fM7YvS1n54UgSdUw3R0rcvXimL01KzqN4/4JqWODL1KWSL+z3kSW1y13WT7/djYcrMddirWCIv1ikLQ+ZZVUik4BidjH9mMx+HqMRyxHZtGdgrAUW/YEodROat22rxJt+nQKpVdrjRY1WAHcEgh+WbCf2etE39VwcWPSxFsLxFTkIjN7FAtgUeBBtfgXzaIQGYsh0TrnnqmUezBGzwf8Tc5sZQwSY4tzRwA11RuP/BXh/F1aAjUyJHH19XdZknCWR/n0/zwFD2RYZIUIn/Rkze4Cb+YYgyAf0RoDQqZmxo7x/jB3fgszI+bN3gKKR5VSolFezbYUAOuVyxX2k5ALK+pUAXPoK+O+KsEPttHKx/Mucc7H3G9bO41yC5X5CWlo52JSz0pfZPOaXKI6NXO8fSckScSLf/hcPBoPYNGjbM7tutVFr35hd3njPE9NJYF78tMWqHxo9fvTTGC94ZaoqAtV6eS3cWvrYmSEOzHjJoAJZ8R0y1t9Ulcos4syQI7QLE1HW0zwIrZ3egz10x0EBS2wgx/2ZVWHdoC5dm0Uvk6wSeoHMO1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(107886003)(1076003)(6486002)(2616005)(316002)(6506007)(6512007)(41300700001)(66946007)(6916009)(54906003)(66476007)(66556008)(44832011)(8676002)(8936002)(4326008)(5660300002)(26005)(6666004)(478600001)(83380400001)(2906002)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ufq3LY+CRGm5oRNAYA/Kvkw63C1uAe+QrggBFv41gM6MYiDx56CUxbikfnJP?=
 =?us-ascii?Q?bGGTVIB++2SIGQmgi4rrtuHSp8PmtONC/Hbhoc0/vN0KCCfbrnxO+MM3aQCP?=
 =?us-ascii?Q?3IMnh5shpI0jkBFaP2MmkuckPOt38J+ZgzEvOH4GYQVak08MMmInT4IEs2+0?=
 =?us-ascii?Q?/RlzhPKF0Ud/ALwOEaCONcWHDq4D/7eyDSSaCAdee0TaLcmyADGDRQb0xu8J?=
 =?us-ascii?Q?1HWsuGCYivA1W7+uEBdiLAj/q2zHg88nM/SZz1SilRKhD0+kHH2uSlHCGuuF?=
 =?us-ascii?Q?mLlCCxWd+S6IvSlgTBfDCe0qoiZ7f5R4JKqbBlDqXLsUB5jgOwVWNzVstoL6?=
 =?us-ascii?Q?Lpg0/dRXNOam4F7ldh1hBFZztTiNMFSXprXgdZfR1FQ9qeOKdO9WKQqetAIN?=
 =?us-ascii?Q?GW/skWOQSAunte5cJXgAGkTQMA85OpxnLrOiV+IzGYTkVORe2WnPs7s8Vdbk?=
 =?us-ascii?Q?E6V70G/AByf5Yn9pRk8FSYE8OGXIvE89W//rtYSn3wxiA44BHyFhmbxDYWDl?=
 =?us-ascii?Q?HX8NgNequwhcv/ICq0tM4J6khTMd4EjUTPtKdu/iJ0cVYXt+KaJvk8DNja5g?=
 =?us-ascii?Q?LGlTYGFBlXJsVFbcPhcMDoP4j7mAoZTw7Ens4EyDtNz+wHXFXtORO5MEh0+o?=
 =?us-ascii?Q?D1jEqwT4HkiG/FzGasFv+6lk8bI/iUXv56W5XfnMHAw2ujyipbAmMPixKemH?=
 =?us-ascii?Q?zCUiziN5jkptfB1murmd+Ok7PkvghR4NBzpQeIrGM9Y0xVY0CmFBgPqxmogX?=
 =?us-ascii?Q?V3eZEqTfNEUDEywlo7iu1SmGKZLRAxmDagI2/f97usXWy2xH6PqdUxmt0j7q?=
 =?us-ascii?Q?NFGBV7KEZiDb93/7BtuKyWneZNqaR/iZzdeVO48wKei2nVfREgpNJR9sD+MK?=
 =?us-ascii?Q?SCVe9tCoPQ0XkFC3Pp2P5A95wHWlkcl76E7uw1s4RPDc4gn45NVTG7mrmWm0?=
 =?us-ascii?Q?6zhgEMs0AN5KWj2RbdY3+FCu7U2KEMOO4zuA7p8rFeTiJWPd1w5peUhqnssZ?=
 =?us-ascii?Q?Yrn1DG9sUEGkU9KIJtg/ptQMW87niKo2OkN5xh9H4TDdjAA8I2HzHTj/l70M?=
 =?us-ascii?Q?LGED/66MgPJJWmdRaH4ZeMykQ+O8B3oEaD+uQvqRkRgvbIXPaphCoE6L+lvZ?=
 =?us-ascii?Q?b3CyGmUrfwiuN+58niMqADc2garzllg7JaAkBeknV1NhOLuYx3SvXA1cCHe4?=
 =?us-ascii?Q?p8S5D7mhb97iofPL8DkkcFz5AU38q5AGW3QmcUbKU+AVrZStcTkFHCfk5lz5?=
 =?us-ascii?Q?z8ic2cpYGpgooB5jZNt0/p/C60rulwvDXFld6uMaTaZ3XizNzdPjW1jPvea7?=
 =?us-ascii?Q?40YFRaiT8w1oG+Iem++GLC/nC6ZCPG1xmLqlrjB4aoJz2YHQ7q4qWYvdEAgs?=
 =?us-ascii?Q?RcVgWCfHDJeHrN4l/56jD0wvFjb5uHvoFpnFYc/o3Wl7Uba61UCndeCtsDI1?=
 =?us-ascii?Q?7YuY9UEPCyTTaXQqvUfgy4kfyWpwt94p8mZUgUg4/Vwkvydk4ofXQ3obkuz5?=
 =?us-ascii?Q?Uen9/kPdbSULx5UQGWWajVK8MWH/zr/3R2SB13qZN9OvLjj/m7r2uHugTg9k?=
 =?us-ascii?Q?2/OT9Gn6AHGBM5OUxMy916/Aie+bH/0ix3LrIFp7Ob9P6L9X0W8Zj/6ZvjD8?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fb371e-25a7-492b-986a-08dbc5e1f9dd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 20:30:55.6604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtNYbF2/L9EmzJmPsuN1FP+V1V7QR/YSorR9+m+gBYiRy24mSW7TEguGOY4IPFUS66hXIAn4M8OCInUuvLqIqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 6/6] drm/xe: refactor xe_mmio_probe_tiles to support
 MMIO extension
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

In future ASICs, there will be an additional MMIO extension space
for all tiles altogether, residing on top of MMIO address space.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 70 +++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 52e4572e3c4a..e4cf9bfec422 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -318,50 +318,56 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 
 static void xe_mmio_probe_tiles(struct xe_device *xe)
 {
-	u8 adj_tile_count = xe->info.tile_count;
+	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
+	u8 id, tile_count = xe->info.tile_count;
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	const int mmio_bar = 0;
+	struct xe_tile *tile;
+	void *regs;
 	u32 mtcfg;
-	u8 id;
 
-	if (xe->info.tile_count == 1)
-		return;
+	if (tile_count == 1)
+		goto add_mmio_ext;
 
 	if (!xe->info.bypass_mtcfg) {
 		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
-		adj_tile_count = xe->info.tile_count =
-			REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
-
-		/*
-		 * FIXME: Needs some work for standalone media, but should be impossible
-		 * with multi-tile for now.
-		 */
-		xe->info.gt_count = xe->info.tile_count;
-
-		drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
-			 xe->info.tile_count, adj_tile_count);
-	}
-
-	if (xe->info.tile_count > 1) {
-		const int mmio_bar = 0;
-		struct xe_tile *tile;
-		size_t size;
-		void *regs;
-
-		if (adj_tile_count > 1) {
+		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
+		if (tile_count < xe->info.tile_count) {
+			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
+					xe->info.tile_count, tile_count);
 			pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
-			xe->mmio.size = SZ_16M * adj_tile_count;
-			xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev),
-						  mmio_bar, xe->mmio.size);
+			xe->mmio.size = (tile_mmio_size + tile_mmio_ext_size) * tile_count;
+			xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
+			xe->info.tile_count = tile_count;
+
+			/*
+			 * FIXME: Needs some work for standalone media, but should be impossible
+			 * with multi-tile for now.
+			 */
+			xe->info.gt_count = xe->info.tile_count;
 		}
+	}
 
-		size = xe->mmio.size / adj_tile_count;
-		regs = xe->mmio.regs;
+	regs = xe->mmio.regs;
+	for_each_tile(tile, xe, id) {
+		tile->mmio.size = tile_mmio_size;
+		tile->mmio.regs = regs;
+		regs += tile_mmio_size;
+	}
+
+add_mmio_ext:
+	/* By design, there's a contiguous multi-tile MMIO space (16MB hard coded per tile).
+	 * When supported, there could be an additional contiguous multi-tile MMIO extension
+	 * space ON TOP of it, and hence the necessity for distinguished MMIO spaces.
+	 */
+	if (xe->info.supports_mmio_ext) {
+		regs = xe->mmio.regs + tile_mmio_size * tile_count;
 
 		for_each_tile(tile, xe, id) {
-			tile->mmio.size = size;
-			tile->mmio.regs = regs;
+			tile->mmio_ext.size = tile_mmio_ext_size;
+			tile->mmio_ext.regs = regs;
 
-			regs += size;
+			regs += tile_mmio_ext_size;
 		}
 	}
 }
-- 
2.41.0

