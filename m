Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFA1E93713
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 20:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935CA10E180;
	Thu,  5 Oct 2023 20:31:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B70310E180
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 20:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696537901; x=1728073901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ge8qrHF/SFOzoYrflQmkL8jy0rUxU5RRCpHuFmXhmPc=;
 b=AyQHmrNIF4f3UMB+B6AGALpEJfYI/ipy1r36aEGuRZpZH8SgItMPe8Q4
 6lrdrvejS3P6eunzGpPDtdqPJKGIc3tTfMKLZ2ambHYoHm+k6aOu4z66/
 BUkjCnh3TiUhID5ZOCcd3HANmrDYk5NWj8aQlyWnt51yyggexwxEVgEzo
 QFAuLmcSaQIa5WipUSBLRdsCKEC9LdXo1K8VnttnpFtnY51J2rwsiD1Ah
 nsciU7yWPWW7+HLL9UntbjIzXM7uvVKs3Qwpo+iUo1CPXwdRfiUGkftCT
 TEKIx78EhyVQno7X3pIYmpCyYH92C3GiQ9WxEoRZ9wsuCGLmsLb8SxBzd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="5169639"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="5169639"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="842557789"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="842557789"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 13:31:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 13:31:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 13:31:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 13:31:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 13:31:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXY4bzBQ/Vn7fZJjZ4Kn4rIDneaQAi7GEM5x0GWPClIiWJFe0itMwCUsoIJJaKR6G34ouTADGeKJYj1F3UyCasSEgd5UNUexOJ3GRLKxNjoI5D3Wkh5IyRiks+Nj/DhD9T/rJQ0HIYjjTLMVwoRvlTw6+t+se6wAcIfDreD+8s012sa7+jdwO1rVsD9iAwudxa8jRRkjdmN3HW0BlXpocFwwPLNoKtOkYpTbXIiD7fFzBCEtWAPmswUxMDMmYt+riAsmK3+k5qr++VMmI0Dx8gyl2DrEgpR6QDuwu8c8QOP30HLRsTWfuSrY1KWvba9/qH37p9lLEHny0S+U8KstYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XZB1L7SVZkbpXFwNWqgcFW/bXQTzxnTd4bwo08YV7E=;
 b=B9cGl0TtGCjVqLq/0k+yT0p5UsdKXbetqq8d8tAoCQpy1Y+lQqbxO8Z159nKRxVKUAyRI3A59JTUutCyiTp1hDCN4TZ/MYMjFfbu6fHT7CsMe14nwbBNDfGabzrVks4oCacHV1L6hsFj6WhT7GdZoq6jV5hwYMMnAnbLS6Wzd6GKXqJ3m+I9XLqkBIP8lorkuGZVpwGkKA/VvBv4h60Q+2sUF8Fp9+q3efDq29PDPisRwrwPj0btwz0A74iqjeshnC3qe5wStR4NfTcDM2ny46jmJYRbH0KzFtGpftY2v/MJXvGubeYxp1F1iB8UGBNE3RUBWiECV2tutWBer3PNWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6318.namprd11.prod.outlook.com (2603:10b6:930:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 20:30:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 20:30:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 5 Oct 2023 16:30:26 -0400
Message-ID: <20231005203029.14849-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005203029.14849-1-rodrigo.vivi@intel.com>
References: <20231005203029.14849-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0183.namprd05.prod.outlook.com
 (2603:10b6:a03:330::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 02db6bf3-62f5-4e71-68fc-08dbc5e1f2a1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aWewCpdcGlzMg1r7XPDTVVSSrQo8eSwt+oMYGzLepbJMQrfK5QDRu/TaAgApAS2lcyEQ457d8ks/bzq3EI8CSU8iovT4NA1PAgT8Gl14wuHbHpzcr++BAx0k/cmQdI2938v3I/cUlT1EuvPiu+vSaoVY8olPaE7hXjd93bBwCAYYcb2Xd/t0TR/f5vehGRbttjNOYIjhAWiHrU30dNJAhEp9uQNz3AEoYrvyELkcG/jw+GYvvY3EFAOgxXMR9IOAqgdy8r/zOttnI7eMbH5Zt4mMGh695P+fajp8UTSg+rZlMCF1D29Hf31XuHSLVOJf5VUDMsH+IzIHneE66mXJpc7Jexv9/0/rFfckvjs60Bgl9Zq5NJikj/cRZFbEx+jP2mXqr52qDHIFum87dBbYs9O5xsKA+Epc++njYol6FrpOeOCQIdaDW+7zkX0PxOuCqgrw9GVEr2PkyFfYXbkkp/BmgQIdUY8hJX+gl7X3UhyAiwA7ZsPIKFhnQCEjL29DxJeoLPSJ4ArRpbQBbIur8GcahUAOVKLeJ63mNMEiHTQXZnJVUtA2GsQbLlZL9S1x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(107886003)(1076003)(6486002)(2616005)(316002)(6506007)(6512007)(41300700001)(66946007)(6916009)(54906003)(66476007)(66556008)(44832011)(8676002)(8936002)(4326008)(5660300002)(26005)(6666004)(478600001)(83380400001)(2906002)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z7XjqnQRxi1dIWfYGIsQlfJ++1+S5HRoDUtG4MbEeIRpdjTt7iYdDo1kSAmJ?=
 =?us-ascii?Q?JPGeGHz6N7TuP7VDi4q8m7iJAq55pRoHl/PQcqh5g72qSIQcgeBP7WU+ds4r?=
 =?us-ascii?Q?8WxC3XvwhcUrGsjgirYajfeHb9riF07Re3aPnO0f6mXDdi1LRy1mDsfZ5lqL?=
 =?us-ascii?Q?nzIzx9YN8FWqgX+9HfwnLuFu8saSzTts4Uy/HKyIFV0WrDfH/gKXQaORYLfU?=
 =?us-ascii?Q?hbPV9PbMBgHsjybVBTghs9FkvUhpz23fcyBxsizOmfAscpPFH2QiVrYkyDV6?=
 =?us-ascii?Q?6r0q0XH3seP1iFNi2zS2ZHUL473/tFHUlA3AfbNbwBMDLQbKgZwkezS9c+p1?=
 =?us-ascii?Q?M0HGIH/wIQDvzs0VaLOoiMWnsOHT0E5/R0EdsHnITMDLrOYEBTOBanA1sb1o?=
 =?us-ascii?Q?+0JfzCFPdmE/+Q/rFlIN5YDlZ/ziEEN7TROwhDEsxe1icjrevrPvqlpm4OvU?=
 =?us-ascii?Q?OuH6+CF9gbxT6ssmplOXGS+S8SuZggmGzOoFXcvqhDXl8aONSzBecpETEkpp?=
 =?us-ascii?Q?kN10pk21Q7lQQoYaYsK6ke1CoRuL5BIrsfpKo8nxNlO8ZHKLuetKg/J0ISuH?=
 =?us-ascii?Q?EJvnQoIgFUq9pPoa4QbzlOKUpH7otzqzd+iFsRplCMbMG2xuRIEl4BapP+vH?=
 =?us-ascii?Q?yPXwqedSvJxqOQN74nUBsqgJXRJ1JI8djxMm2ZMoPa8rlgnO9wZ33JlJJusl?=
 =?us-ascii?Q?liiadh7VbyOLg7sOOtpRYI8Uv0DPvUEE/w3IXOr6MqG3hfRugNQBrGH5OVYq?=
 =?us-ascii?Q?7GBj6w0BsU1bSMmWr92BREBtX5xCat0sb+ttTRNxFhMTBYdC5et24Qu1x48/?=
 =?us-ascii?Q?J+ju9+Em6Z0ptfZqZMLGYmiW1BbOQ+zaY0eLNUnILEmlhkqIW5gfr+Gh2bwV?=
 =?us-ascii?Q?t2rTviPbL7jqBYHqyX+JUASvyuS+M67e5T2C5o4U3T1W4VMe8WbLTb/10cVy?=
 =?us-ascii?Q?AVC+kOdAUuK8kOiZRrYoQMe8LJ6T6HbWnbliPCx5rMNc/FEY98Tu69TM1YLK?=
 =?us-ascii?Q?XjvZulDZX1U5uOtwhaK8ht69undrOKyk2eBqYoIV71T8m61e9JDv6qXB2roW?=
 =?us-ascii?Q?msa6KMywtpskTp3aNFfCPJmuUU2hbGyVX7nR8gCR9XZ7MHhgaBxfwnlwBwZH?=
 =?us-ascii?Q?d+aBiKnLs6bbcbaWCO2LOv3t07ptDomANCY3H7kNfE0IlQ7hr/mh91i0tK0S?=
 =?us-ascii?Q?h+sx7GhZP9+CQrZFb2E22EM8MIjEAs4CjiJCsIfdZeRwN4QSb0xTb2pXiTfW?=
 =?us-ascii?Q?CCp1OQnbmdbNGww26ixVHa0JWu6eGbU75Pji7VAgtXv0OwtegWctFZ3rhfaF?=
 =?us-ascii?Q?fSQYIGrLOJODIT1+HZQFqMToF1/R8R3ZIYGpkfC/zepCHjHxJfL9KK8mOLTz?=
 =?us-ascii?Q?mpo6LECpuKGEzpax5A2Q80pQOhrdnkSOwmjp6fyIHynsF0KTOD+pzgEanjqy?=
 =?us-ascii?Q?4trE2xkL3SbGGtAdGxOCwwAKxfinSOLXdhqbyO5pk62vOccU5luTXyniqlru?=
 =?us-ascii?Q?6En2qey6QYhLuIcftjZpnrKVYRoIHbtWtD4fDU04TMJTkhv7wPs9jv4Jt+Co?=
 =?us-ascii?Q?mtPXx2aQ4G/M4OZ2pwms8iJB28ik7nSP2cUsFiX06fo8JOwLQyNqhej/o9A8?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02db6bf3-62f5-4e71-68fc-08dbc5e1f2a1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 20:30:43.6232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fP2B/SQJILcaOF61Xp9BOTLy4qcN1wM6Ha6fcck761I5oMY6zIE9bBCSNSVGJQ1Y6VO+G90GkzUm8OrSNDlj6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6318
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
index 335018d29829..bbc8296e9f13 100644
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

