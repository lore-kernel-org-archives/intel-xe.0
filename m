Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F7DE92708
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB03010E420;
	Thu,  5 Oct 2023 15:08:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9089B10E150
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696518501; x=1728054501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bjDJzvpbJW3Hio4oQK2r0JSZ8idT/Xxm6WICWPRG4yY=;
 b=jSkxy5pnww8104uBlFo82J0wa4rdn8NffDer6huQXQq0MzKjXR8zXA6L
 KfmEQ0GLv8ODg0bZExgonj2KZ4iE2ar1mwYL+YNNEMZTD+uUjeumMfY2U
 ZDiL1V2EqdGGElKnevjy6rNLXS8lhkWUWbumWL7vIFlX2BqPYSCCd7KfD
 J/KuyBf7eEhaJCqmlObFXF+75SUfrLbaxiK+1KcnjVnnEzbjpcgy/HigO
 An9QwP5gGyGsnTHduBu/uwwgyozS+xCAc4Ib3HP6Tn7PGZDhTaSK4dPvg
 C/lKLJqM5f5l7r771uLtlCCo3tnlYTkFTHhxYU0AilIvpd3lZ9AhbUnLQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="380803084"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="380803084"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="781283092"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="781283092"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 08:06:57 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 08:06:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 08:06:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTDBTbNcnW1hr5Gt/CO1y9thDueYpHR5B77oyWrVCXIZ3W4qJzfsc5ckLiLLnIT+z9Nu7J04ml1ycCrHOXSLCXP4UWJ0on/i9JsyX1k2IkpWcP3Wv7D0USFbOahcnCMQoV7+WSlC045Ui5WOjJFyTFhQmTSqYHBn1v2Q4szte7Ew9qC1BXi1HyOti331J4FdJFtVwKx2UzKwE6n4yNzULbu6R2meJjdwf40klk3wUe0XGXL/dLwFdjx5/THBSIJJS4qUNhbzmJfEUXp+/vWhvT58sOSmMg0lh6Cv9iucW3MeYPKLDGOFmXFDrzMerTKq1Oe/QFvsvcFtFVr7KEx7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq0JhCCm51lIZx2CSoS34gdl7buJ37rNgJP/PUe0F04=;
 b=MM1LEFVbdNPXHomSXLpYlbSp1xm9xo6Gr68rQSo5KWw6ihi4wrT//jBDj+xJIRUqLiGtlY5N+Oio2PRNz3FR/3yhXWn2DLDn/JQAs9tub7RMWY9F2rFbTQqCl6noWL+zqGZAk5B5H0D2WBqi/QDN7Zx26qfeeiRsxGlQode5Az2w6xsZ7Y860LmlqxJT9DWNzKWSVDcmzZWJMlYeSZbiWjmk6AnsBgKnGTwKCiIVbcRjFk81oyZwnVAvIxEHAdOgVt//dwEQaChu3MlWpgig4Py6NNdEpmEuTnScRagq3eYvYEz2nTU4cOs5sE13ZFR0J6+ksy6dcdGbqLIi9dPTHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB7576.namprd11.prod.outlook.com (2603:10b6:a03:4c9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Thu, 5 Oct
 2023 15:06:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 15:06:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 5 Oct 2023 11:06:19 -0400
Message-ID: <20231005150619.9521-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005150619.9521-1-rodrigo.vivi@intel.com>
References: <20231005150619.9521-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:303:b9::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 362a0024-cb59-4028-f156-08dbc5b4b61a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uy5gAYkbKUjJVY/4SSFghq6M3QmeUOpQ7XQ0iRny9kujhHJjmFyXgjcclgMR1Oatt3ScP0SluHDwXpX+5gfHcmZoC5BdFoyBLloc7C2wza4E5xvBnMHo/UyxExM68fYv51cnEOvzGIv4G3V+znr6pVVC3ogwK9sFZnetD8OdtS+ilcX/q8KWaUSriTyWilufm3nECxDQ03AYfxIopEfkixYp2qZGCN1OvBMn+r0wOOvFWmzm1NerOIyweqvmZIyv+md7mze+CTNo0zsfhjILoGVsu9QYJZKAWHH/7qYz4+UPX/iJKSslZEeYVuwiAUBtARB8Lscd9I0vsETPUqVIgDctKHoAnlk8iNkpKt6mQw4qTXGAWUuZYU3lpDS6NNUvkl2HZvOGQWVWP6F/zZxTQ/ifuxiUPWtkOy5xhel1HG8BJbhZ5dVxoBedwb6WRuoSNuo33owIgHE9iAxawdsWNxY+1N8Vjen7lLsRRYko2ilSxDguKBo8YlEq5B+lQ+XduyfEu//XULvjg9z+NPJIB0lo+exSpP/+xqSi6sgzdOuV37BlaFTtvIFr+yYT0EsV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(66476007)(6916009)(66556008)(316002)(1076003)(107886003)(54906003)(26005)(66946007)(6666004)(6512007)(36756003)(2616005)(6506007)(38100700002)(86362001)(82960400001)(478600001)(6486002)(2906002)(8676002)(41300700001)(8936002)(4326008)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cNoD1YrmE12zlqDet6kl+jTdN+QoPrX8POeQTx7/Iz8YE0uXzakInW+X3scU?=
 =?us-ascii?Q?6wr4dexIRPDKJNqlyVwlsSK9EK1FaAjXDSeReezKcqvwh2eqZuRP7Y9uhadN?=
 =?us-ascii?Q?IXiqO1OY9MBTvgdHc7/HQ8Oo0b2Te41aGwycIHbgYWOhqUEnwUwp4NWtVeDT?=
 =?us-ascii?Q?gB0vINU6XJUtPuSRwglFCzbxWEsMsbfh+uH5yeRnkC/a7xCZmyLxI49SH37+?=
 =?us-ascii?Q?bB+aXeucLTDQYvwhNCVvrbxSzQ7kmwukdpVf8Uw4z+7C8oAXvunNdm6Z5yUC?=
 =?us-ascii?Q?Ip5E+0d7Rp+CqCzsL3VGyfM6+wy0Bzuek0YO8NN19w9hma9LhEu0xJ7wi8Jq?=
 =?us-ascii?Q?s0WpcMN+8H0xyLxM/UX93YSFfJbaEEXOKowZ1Jm6bE3Jd+51XWOv0hwcH2Fs?=
 =?us-ascii?Q?dIDY4GQSCzqz6ijjJp8pgV9d66JzXkMmvvxxUC/9Rt/fGic1us9D3pSaNA9V?=
 =?us-ascii?Q?E026bdnIn9xqx6xdlOSa//29SfOyenxHq/FJ/0hYWFRqszitDr+GNZn779aN?=
 =?us-ascii?Q?suAZmKzNG6pUFcCF3cJXpjTWcUm1mz0aNydSE9yG1ixRBSB/PUBzlmNQmfvQ?=
 =?us-ascii?Q?5QW/Ql2puvVmSE7QF7+rzq7EnfZWWkm74xrFomipQ3oCYlvhEJrvsMjyXjPF?=
 =?us-ascii?Q?GTmdrVR3vi5ieJ0Ro6n4tyFLCMxWRUrH78b6vWBfmyyH197yyN/xU4qKkdKl?=
 =?us-ascii?Q?cZ+OreCAfJRU4etqZA2TWutE/3YYqjKKK+SHerOZs+ZCG3zjkJOxF5Q0dgwY?=
 =?us-ascii?Q?/ofTTyA0jaNjLAswShyz5TKrrHW974VtH59xDLUDnGg6N896rqHhwG4WCkm2?=
 =?us-ascii?Q?d5jVrGsEzFhGUutFeHFcLZc/39S7aGault+1OyMTkILHcrbMAqYY72FYNDrN?=
 =?us-ascii?Q?tPKoytbKZzhrZu7lEo+QYufJy14NzdVsY1gwKOyGGnmP8cUblkIg4wLwIIMe?=
 =?us-ascii?Q?nJKy+h2lmDgLsuKQ68ntdbHkBLQB4vLckdUbAOJ07TNblMdnCKSR4O7ntvWb?=
 =?us-ascii?Q?FwXvCCdXZvS3WFyN7xoHrXOTSrwLgA8K4pp1S8e1v6RSKPXbAj1wrIioSwXe?=
 =?us-ascii?Q?rPKsT0zlEJ/F3ZKOSq4iUalNOKukOybe7bQlJsL5G6KZjcZZj27S+VKndj53?=
 =?us-ascii?Q?LRvHUxkxBjCkH7jM+irwm0wob0LFFCvWkFR4iSDXM0J3awSdch6nISGimFs8?=
 =?us-ascii?Q?TJkXxjcIeUV/TFRQTlQ4EMF/0qZHEGqPNMBi1xiK3wxdUm31XUa8LdnI/SIr?=
 =?us-ascii?Q?6Ca/sDr0T//3aBYND8gKL+kUV1FjBSVxAMqqiidSl8mbBt84y/8xY0EkYPeJ?=
 =?us-ascii?Q?QSb01W1oFDWFpBfGflg7Sr7pZ7Fu3Jq12PCv99FKx3JmXHzu6KGoXj7rbJX5?=
 =?us-ascii?Q?7pp3lbHjDdiEilaWWZ963GRAvFaWoDOagwp7aUVIVj3THXio30P6UP0EHf3+?=
 =?us-ascii?Q?T1XlujKMtUBViR8CCuPRCNoIEqXLpJVmdeVJNXzKfWE9wA3ygyYg6uwaZKsY?=
 =?us-ascii?Q?YaYHp53Pxn12NOt9L0aRHJpUaiDpfl3znku8zoVdRUYg/UZ0CnQN1L/TMjXx?=
 =?us-ascii?Q?0xEFclobpjMlYVix0dRlbZIPzSKSR0pUpgHRMi+s0Wlncp50ppy1FOTEkcLs?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 362a0024-cb59-4028-f156-08dbc5b4b61a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 15:06:54.8888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAFh96HUGMV9gNqy3QzEFvoEhFF8uaNdb/dZJrYUjUW3a4krzOPAM7MlYvj5B6zK68PPsBrijJ4AbsPheM3ZEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7576
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

