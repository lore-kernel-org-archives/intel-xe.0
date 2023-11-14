Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D1FC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE4610E0E5;
	Tue, 14 Nov 2023 13:03:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC75710E206
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967005; x=1731503005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nL5wgPP0m4tq1vIEOx5aT8SXc8/nkacwLss8hf2TJ9U=;
 b=dqt1snr1DFscC3aG/Fa8h5E0ij2dhRElwUbUDXbypz21SVAUoGSp8oAU
 jo4gbqS1mvSxipJks4BInHitnVy0kXymP5BytsOYT+Ztrm7MmEwRR13Tg
 P1ErHMsOv+xTDUXi4qCoIVOtF0amiXUM4bCVIcPLQUDEMKFCj3x0+6rNF
 pAHGb7UmYNSxsxUZfGErhNpQk+ogoDKKVptWUChaYxmy1YER2YbQiOc5g
 dEmYHrGNyypJenWHTJEt2ylKiu/DXkQXhLHaknV6pxtb6VxtXZXHMtX5K
 rQgmggdQQ8M/CHbUyWW41JNGFUV4wAZ9MTp6dZgdzVjLUJHsBFlSCqmDg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375691908"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375691908"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:03:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="882045970"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="882045970"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:03:23 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:03:22 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdYnKh862fzJXKhE+/Cefm8uWW8K0mW+jrlDTgXKLK0J/pSrTnVbEWeFY53WUPMOPtxSGPLwChf1afkpqsuO2T4M/xtNsR5c61M4GGPhmNc83hhPsfP5ge6byt7mAQ7Nfd+DIZPYLV3SeXkjZ0H8B/K6vv6NQnCZ2XgKaXMogRD24qGm9PSJmXuE6OWFm8ZICNDa1E0JaRbsGf8jNfZQOg/gLhPL0VVfGnxDQyijFI4qYKcRQTOcdqI/NK1ihNtaGHMNpV/MxoLbqGZ3HkOq2EOllUsLD/eCJVoQqcaSgXlMukzhH1PTkixZVaSXtlegW6gHRns2FxQH4K6h5WPdpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqLXF+h9i5jCkHd++QbtnzqVcdw5c5wt6X43+cjzuc4=;
 b=JYtilf9OsN7mY3LLbo++HUBtQE5kXypYlr+PHZvcCVKw3NOokDpqhxxrGRgtK6RJCL5aAwBw0KZFZB3qnBBofxaoEXbdXdlDBJmYVcbshUotdBa4EkqC085pFgAvRWUaUWS9eKqOXx/SQSJexBvZ19mfE/TxEzsHXCdJwhRzUTuEeN6QnHnf/mpDtev08iaB7pbc9ZHnXSKMbWB4mOM1pp5XRGcWH6RHaUydxFj+OPzPzzCjNXCBIelOFk9JY/yDbzEtYbeqfX8hT7YfjhNovOlhCMZkTBpjQbTVBxgs+OuCbyYPvIJlC+hmJcJrwm3q3ox6GwXM8Rb0k5kDkZnARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 13:03:20 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:03:20 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:15 +0100
Message-ID: <20231114130231.2299661-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0279.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 90cc136d-a59e-4819-a444-08dbe5121384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5XasXD7xxU3ndgrkx0nfvq8/g2vcnbKvILZgepPGMDE8A1cSWIhT60tB1YjaKsKYkTUIEMvA577gtsrTyQwU62+9u1coFT3lcHKkXuMyCw7e3RyP+A1+qE/mUqxCk6+JxVxi6v2wnGPaYKMKdE7AP5W46rTFY+oCJZdAA22jbLzoUHMTrFV3dotnJFa4FbK5qjnJvAUOd/lvbluaS5DJH1sU5gEF69YkdUL6XwakjohdS2PdkcDbreEY/4DJzrcwI9LMChsPng1hUBb4PP7XhLKXog8TxLw0L8hJ9v0NlyplpUlGaesh+FdspxPq2EcgPsfFNfoGvfVGbqBBFENec2ke00+EYyO9/E4+SqUXz77WCbLkoLG18m400s5WxCY8KlOEypnhRKMJkjJZDiMb+4e3Ezago6ZvgUAHXZFBKFZm6zOopWDv/czkau7u/QkQ6LwD+mk9lAgKJyoT2+Uloa6D6Cm9Y30M5W6NCLKG1tAnHL2mUfbNw7Kh4I/BVw0isOu1OrYWwC6gsL2YMtQsCD8IlA349fwLKL0oHYH6JZG6cKdgihG9sVldw+eDWD2A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66476007)(54906003)(66946007)(6916009)(66556008)(86362001)(36756003)(82960400001)(38100700002)(6512007)(83380400001)(26005)(6506007)(6666004)(1076003)(2616005)(2906002)(478600001)(41300700001)(6486002)(316002)(8676002)(4326008)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkxOaG5qSHZjZHQ4Mm5WdVRHMDMrVVFBMjhvZ2FwcHhISkdwWFUrbXMzZEYr?=
 =?utf-8?B?cXJ0Szl3MERNS3lBOWJLOTFSVlAydDdJLzJDdTMxVHI4ZzFLcTFPUGwxQVlS?=
 =?utf-8?B?OEJWaFk0VmF5UXBhdDFkcEozTXJjUDJUN3J6aXRvMFdrK0tEbkN0Sk50NW5z?=
 =?utf-8?B?V291ZXZkWTBJRVplUHNlZlBqc29xMUFVVmxjYmpheHFBdG41d3I5R1gxbjhP?=
 =?utf-8?B?N2tCOFpMcVNOUlJRczZGaXpLTXdRNlZ1RE00ZlJEOC9URGtMeDh6aGE4emZO?=
 =?utf-8?B?b1JkRzl4RjRhanNmWFFiZW1NL0xqVng5R0ZWQjNTRWNVMzNqK1dHdGdCb285?=
 =?utf-8?B?YjUyRWlXN2FINm5CaldkcStodVVET1pKbklZSGZTeGd5SXlVV1ZLK2Z1MS9t?=
 =?utf-8?B?cUhmdEszaGtWOC80M0pGOC9EcExmUWxwbmg4L2xRQmJPVHQ0QmttL1BYR0l5?=
 =?utf-8?B?bkRXdVpvU1N2Q0E2VEJZM3FrMmp2c1AyRC9DQlJpdzRXK1hUY0NrbG5LVUpv?=
 =?utf-8?B?TzBWMHUzTFBtNzdYazg4dlFjMmhUUDFxNUFRd3dxLzN1RDNJSWtUUWFwNHR5?=
 =?utf-8?B?ck5OdDRKWHJ2TXhjSHQxaXVEQWJOWENKRlZBV3FwTmdWaWJKYXI3cEl0UWJQ?=
 =?utf-8?B?eUU0QjNyRnhYNG5xM21YblpwcnVEZFA0NW9VWXI5c3Y0cEQxYTlZdTh4M2hw?=
 =?utf-8?B?dGRhL1o3V1ZyZWxwejdLWmwvVWJCa1N3bVZ6WHBDZzFKdXY2anQrWlVIR3ht?=
 =?utf-8?B?SGV6TXhVYk9YS1oxSzV4bXlVQnhTWGNvSmpYK1RUSlozemFlcEUxOEhWTDRT?=
 =?utf-8?B?K1hFN0dpUXB0L1J1Q3VHMzFtUE1zTzhBZFhIcGY1VHV1Mkc5WVJueVZMVmpD?=
 =?utf-8?B?U2I2elpVckYzTUVBODdhdzY4TElkWGQ3eFNVbVEvTVovdVp5ckZtYlNPSTlP?=
 =?utf-8?B?eFZCcTBjVW8wY2FxN2ZCWnVKVWFWV0JrRWtnODdNV2h6UXJhSU1qNmVMZ0Nn?=
 =?utf-8?B?cFJORHc3OW1CY09NQ2QwOWdmZmMxRHVxeHJRS0FSNU5mVGVsKzlJdzRJZXRZ?=
 =?utf-8?B?N2dWUGFjQXdFdHdBZFhROXp1Z2NENGU5aFhscmNVUUp1NE0zUEZuT1lRcG9R?=
 =?utf-8?B?SmUyY3NzamIvVkR3TXVFNTdXMjdiai90K2dEVkVveHMrQTF5NmF1aGlPYXhO?=
 =?utf-8?B?VEkwbm1yOEdzcmZkNnV1SldLQ0ljd3krV2JaY0h3MU4vdm9EY2ptcVk1dnVR?=
 =?utf-8?B?b255L0tvNE5kV0NDT3lYSGh0QTEzUURTNnhHTThYVFUxVXFRUmtEOTRDSVVJ?=
 =?utf-8?B?ZHFpRW5BSjNvQWRIRkZyY05Wank4K3Q3WjE1ajBxOUVUSVJzWjdidEdwbDQr?=
 =?utf-8?B?T3pFTHNqRnBMMzE0U3pnL3l0b0IzM3VKZWhYSzVmWlV2aUJSRDlrbjVVU0FZ?=
 =?utf-8?B?UnFwZlZHakcyOHI4OUh1c0RaRUNZRWRlLytHdFpZVVpmZlNQYTQrbWtCekVX?=
 =?utf-8?B?ZWdEemlQU2k3T2FBWndRWlBWalc0dkpWd0J3eUJXaHRkZWZzNVBXUTBxdGFD?=
 =?utf-8?B?Ym53TDVreHBFalg0bXg1cUh6SFF1N3ozZkJCOGdxa3dVQXgvREJKTk80MTZ5?=
 =?utf-8?B?eFZlNUJCVzVYQXB1azhTRUQ0a041S25zWUhJTEUxcEs4c01obEsxKy95ZGln?=
 =?utf-8?B?cmhGZHdLd24rZlZFSzBleFBib3dxTXNodnhmRm4vSHpPeUpGYUwrK2piVEUr?=
 =?utf-8?B?OUxPR0hOTG04R2VtY3VsbE5sRTVUVzhmR2RvaEJoUVlmajVKYVhZemJpeTFQ?=
 =?utf-8?B?YzZTOVJKTHZua0RrQzU1VTZBT1Y4K1c3UnljMkNTMmpVVkgwcTdrVXd4K05x?=
 =?utf-8?B?QUR0elpSSW5KTUpLbWcrN3lzQ2tnR05EalpSOHBObkNPTWNaWUsxZHNsSFpt?=
 =?utf-8?B?d3ZtemZ2NUZyMXNUczdqcDJ0aTdFaUlnM1F4b0JXeVltQWdYbzNzZmpMeVM1?=
 =?utf-8?B?NkdFOFZ1R0drd040UHdjOHZSWnZhRVhNZWxMUXEvZDVucmJxcUFKRVNPNVN5?=
 =?utf-8?B?SkN0RG5IN0U4UFYvZ1FwUXNQdG1iTkRWYTV2MkNVWUNqd2p0MXhqKzhFcVB6?=
 =?utf-8?B?SXc5akMzSjFuSVh2citZbmFOTFhUTTVkTTN1aHdDdnI1aWJPN2phSVh2MU9O?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90cc136d-a59e-4819-a444-08dbe5121384
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:03:20.3821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbbB+7Qh8bLy1j//KtbF/7e0dh6UX9+KqwbT3FL4vNy+1oMpiP+EZBx6rA4Hwh/KCnnCf2jgb73VrE+ljraK0mhXB008ECTi1HtEteYsVHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 04/20] drm/xe: Move xe_set_dma_info outside of
 MMIO setup
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

MMIO is going to be setup earlier during probe. Move xe_set_dma_info
outside of MMIO setup.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.c   | 26 --------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index af0abe56c24b7..ef5099eabde0a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -342,6 +342,28 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
 		xe_gt_sanitize(gt);
 }
 
+static int xe_set_dma_info(struct xe_device *xe)
+{
+	unsigned int mask_size = xe->info.dma_mask_size;
+	int err;
+
+	dma_set_max_seg_size(xe->drm.dev, xe_sg_segment_size(xe->drm.dev));
+
+	err = dma_set_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
+	if (err)
+		goto mask_err;
+
+	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
+	if (err)
+		goto mask_err;
+
+	return 0;
+
+mask_err:
+	drm_err(&xe->drm, "Can't set DMA mask/consistent mask (%d)\n", err);
+	return err;
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -356,6 +378,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_set_dma_info(xe);
+	if (err)
+		return err;
+
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_alloc(tile);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d8f9fabf715e9..1076ffdb3f92b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -25,28 +25,6 @@
 
 #define BAR_SIZE_SHIFT 20
 
-static int xe_set_dma_info(struct xe_device *xe)
-{
-	unsigned int mask_size = xe->info.dma_mask_size;
-	int err;
-
-	dma_set_max_seg_size(xe->drm.dev, xe_sg_segment_size(xe->drm.dev));
-
-	err = dma_set_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
-	if (err)
-		goto mask_err;
-
-	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
-	if (err)
-		goto mask_err;
-
-	return 0;
-
-mask_err:
-	drm_err(&xe->drm, "Can't set DMA mask/consistent mask (%d)\n", err);
-	return err;
-}
-
 static void
 _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 {
@@ -430,10 +408,6 @@ int xe_mmio_init(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_set_dma_info(xe);
-	if (err)
-		return err;
-
 	xe_mmio_probe_tiles(xe);
 
 	return 0;
-- 
2.42.1

