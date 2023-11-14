Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A152C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4729E10E206;
	Tue, 14 Nov 2023 13:03:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9403810E0E5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967026; x=1731503026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+BICbAg90vIZkXTMjsyP5hKgME+VL+xIfv3MFOL3vV4=;
 b=HrJaxHBZ6jz9eWQEfhAK9aXhUlgJ69ebt22BORHy/X7VKNG7RdFk5+gJ
 X8bJrqHJaku64ztfgO5VkajI2uqYUwTEPtUAbUmF5xaFiczl0JQd45YxQ
 H9li7XVlrxlAD9jiTtSij8tv93LRMES7+/ilOLie+uE7PWCf/+TGXSe/U
 9XIxFV+2l4lACBBD60y/vOMAX22y7xlSUo9gCAQF3ocJhHPErIz0KHjl1
 ksQCRUbVlS60eagKPVILBcfEUGazHo6hLBiedaNTgSy1hHWHWhL10EVNY
 GTknjm+D0dgv0o8GTgWlEgX7moerjkE7urrnY7MN1mvJ43y9CN3Rmlmye g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375692023"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375692023"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:03:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="882046070"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="882046070"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:03:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:45 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:03:45 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBkEvsv0tVI7DU6D8Wts86DaOm08nPe22qh2B6kmt7zoLmSV7w1nHOauFpob157QepEmjF3VVANd7zV7L4CPXrVefYMUnAxoSNqz2Ri0m4+SQuV4VheuPC9QNSjLy72F9sG+QQbMBB3BSSNvnnX8jQf7vSVcIX/5IrcTrbQyTSap5A/o59KMOcpre2teC714mL1kEwsG9m4+jeP/PwhAnBIS+JtsApuu8hBhPVXBlcqEy1811LGJOGLowiwKqYBl+x1is3rnlJWAwvaQJx7D4e82f0zVoxfEojj4H1Xnh+pGDGczLEnv/2/kHXZV6AdfkzypRDJDt/9bhRjRchFLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0UlxCKER3C7CVQoHEKzrrVp9C8KByYZnjS1xxgzkwk=;
 b=ds35gmie7fzTaA4TMzDOGVCpBX/wMlNqPaRXs3FrM5iTJy00FBL/TcKshtO016g7xMScVrqtYjpNLq0WhPCwwvY2+Mgofx+QfHOjVAFnuN8VoC0pK1rKlTuZ/sjhPWTBwUbdIoY6WQn1Ln5G/N3DoCoVFv6dzkFBb16ZC6o9z1l7GYus9js2eOJjzzaqKsAQ1mkxQrJzB28Vbs/xji9EMqpfHO2/Da/TjG9cR70TtI5PYwgqb9DZDT6HTa6PieU+iRFSK2SSiw2DNJK8fYgEeMim/xX7PW4Y7gRvOJcadkeVxE8L/SBEzxDlTLxuVwFZ38lEfqZdUtyo0GnQOqb9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 13:03:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:03:43 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:19 +0100
Message-ID: <20231114130231.2299661-9-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c4c966-8ff3-44c3-3086-08dbe512213f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zUVEuKPsS2RUsnp5o3cn8Caj3FX8JBZDhv9Qs71PWyz7XMxJpRR0gWTU21vcHLuYuJoQm7t8Kwp1McUf6VKdlAbU7AFoOW+neNyGxyVZUjEa8pEJ4R3Z3eaXXSqt6p6OnVjAzJO2bL9wAvq1RoMP6Il1JxJUTgnar2jNQWicimun/klL7rDsnRbgjlAnIt1AWGhRF/tb5JdA9Da1uThY2quretr6yZ4wka9iuQCG/uFsiyo6gXGWUyHFYMISvnqlfVcr9XlCbcIaKFfh3cFdyaxy/HJnKa0C6Fm1nOFn7xHaoO0NRiT19FVqVp+7j2J597nNLPrhRr73VBqoGm99oTVP5m034bx9MpSD1UWI0O9u3bThfsxsyua6HY9Yk7QSjpCOn24x2MKaTjqKdMW9YFlwtn/wjpymdsPqvKxszUHY6Duqac1mcgDiCIS/VkvLtUP2gMnOiYRD05yaX9BUS/R8wSpSvKl6ox9eFmOQJa0gbDnM/W6Iejc852gxR+gyHEW2QzDKRVHr019ciSfQji772cMIWH11t+hZgBNMCN8r5WpYlGExr3QSAQlejtJV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(346002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(1076003)(26005)(6506007)(6666004)(2616005)(6512007)(83380400001)(5660300002)(4326008)(8676002)(8936002)(2906002)(41300700001)(6486002)(478600001)(316002)(6916009)(66476007)(66556008)(54906003)(66946007)(36756003)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHZhNTlCSEdRc2IrNWlFLzdtVDRLVm5sYU05eE55bWcyQU84MlBtZXQ2SlZF?=
 =?utf-8?B?K0JPaldSblFxV0t3Mm1CK1JiTUFRcHM0SUw4dkd6ajBGaVg0UDlJUndDTzFC?=
 =?utf-8?B?OWFKSTMvZ1NyWEZrK2RXWG9QdHFmSGNrd0dJWkI5Q2N1ak42ajNiVlErMXMx?=
 =?utf-8?B?ay9sdUZEaGdYSTA5b2tndnN1RFBPUnVkY25sOFhWa3VyTkxwd056RkVDRmZ2?=
 =?utf-8?B?cDM4R2ZvUXpFZUczY1dWT1ZZLzVPMjBjYkJYN2pHeXdnc0Vaem9sT0JiakpJ?=
 =?utf-8?B?aXNwK2xkSTAvSVBESTUxN3FpYWdtR3FnSXcxdVpEYjEySlZqa1B6cGFUWjRR?=
 =?utf-8?B?dFEweTlNVnFqd0EvSmJQV295U0p3ZEdRNzUzQWFkbzYvQXRSZUdvN3dVejJD?=
 =?utf-8?B?SjFWOXg3NjFXWnFpSHVWb0hCbXRYNkpXckYydnhRdlBRR3VIdzBFYTcxRGVw?=
 =?utf-8?B?ZXF5Zkx0RGxja05xUkFyZFI0N3RiUEwvWUpBM1Qzc2E0dXhlVmJ6L1NRZ1hP?=
 =?utf-8?B?SnJMQ0srTnFwT1Bxd08vOG5TVVpocXpYeXJtbUxwQ0FDQ2ZWQmR0QWszV0Zm?=
 =?utf-8?B?K1NCV2paZ21ZMXo2VC9HRmpyN2EvZG1jVjd5eVJRTHpGN1NZUUNzdWx1elFZ?=
 =?utf-8?B?ZHYwcDYvS1lRckZ2MFJ1UHFOZEdSaC9lTlNEVThlZnJGUVNDcjlDdlpYeWFv?=
 =?utf-8?B?elg3TjJ0eTNaNUN1enF1dS9hWjE2Vmpka3ZrYUFaZ1A3UHR6RzRscVZpekRU?=
 =?utf-8?B?WVdld05JVUgwQ00xaFppNHpzSnd3bUlDQ250emV1bFRabmtQUEU4OC9wMGV1?=
 =?utf-8?B?WElxNW13UGw5QkJmWTdyekhISGZkS1RaRS9SOHM1bDE3S1hFNzlhSFlkTkM5?=
 =?utf-8?B?bzhPQkpRMHlUOFNMNGV4U29rZGkwSW43VXRXQlFWemZwdXpEeExZeFd2R3I2?=
 =?utf-8?B?N1JJOHkxdFduakkrdnU0cTErR0Z5VFN0RWFkVFpBN2p1T3FrZGdpc0VJaXZ1?=
 =?utf-8?B?aHZ2ZEtPaVVlZ1lKeUJvOGc3akRRcjBieU1nR1JZMXBKVWRSUnU2NmFOSFYr?=
 =?utf-8?B?dHZiVG80a3NDKzVoeG1vUFNiVUhkVk01RWdBUDdnRFZTbWc2eVlnYlI2ODBG?=
 =?utf-8?B?OGRaY3pPb0x1eUZPc2xlZHBQR0xEZlJWZXAzaDNZSFgrZzU2VmJ1WUR0MEZh?=
 =?utf-8?B?MllaTXBlY3JpZ1lOdlhZcjVWbk44N3dZQmEwQlRwM1dDM2xQMVA5VlJBc3l1?=
 =?utf-8?B?VFM1VzdEY3I3dEowK3QweVJTSTMwWFR2cUFoVlUyd0tEVDdsdzVuNzlURHQ0?=
 =?utf-8?B?ZVVsd1I5cEpTa2ZWaWVBTzExb0o2ZThUWTJreXAzWWw3R01sSFRTT2lZWlFE?=
 =?utf-8?B?NktsWnJBditsMklyYkN0WFV6bEZVV0djVFVlNkVkWDFaRXRFZUx2eC9NamdW?=
 =?utf-8?B?b1BKUXIvcElrTGRUMDJkYm5QRk9XTERaNUF0Um9VQnJiNUdmWitLc2s5R0N5?=
 =?utf-8?B?WGM2dFRFeEV5R0R2RTR0Qk1Db0ZGTjJSS2Y0ZHlISnV4RGRpbVVENEIyd1BX?=
 =?utf-8?B?NHJWck1zVUVqOXArV3UvT1ZpeWZKSHZXSkY2TDNBYllSMGxGZnJ4eFRIdHky?=
 =?utf-8?B?ZDkxdDMvUTgwY1g4bnowa212ODlzMzYzMUg5aE5MNEU5VnpNM3V4eXo3RGxj?=
 =?utf-8?B?ME1FS2NRNGkvcURhNWdUbFJvdzVldU9oVDlSTGl1Z0FTNnN0N3hpOU1NUDBp?=
 =?utf-8?B?WkNZZkVqc1l5eE5NbWxISGt0amhwbUdIbEliMUU3OHBadTJYYktWQWFYd3JW?=
 =?utf-8?B?VVN6ekFLWXh3d2xCRldqd05MWFZoWllIS2NvZUtCamI4WE15VHdRaFRFWHF2?=
 =?utf-8?B?N0dOb0Fpb1VsT1Zwd0ovbUVkbURFRS9xOFptUG92cytFT0cwSUpaWFc4Nll4?=
 =?utf-8?B?aGFIWVVDMkdaVDhmam1HSkEzYTBLdzNXdTVQbmhTUkRtUEZxOUh5QnVWNnNN?=
 =?utf-8?B?TGtzeWJhNVJiWDJjclRjUDBnakpSVG0vZEd6b2NMK2xqT1JIalBCelJSSXd1?=
 =?utf-8?B?Qm8xOCtVNnEzRXVPMHJiTjk5QVBSVjZWYlZBMElFM1VEbWZUTEVibkMrUUhQ?=
 =?utf-8?B?WmdkNWFneFdnN25xM0hzdm9DdGd1eE00VHdHaTdKMjBPSHRGMFVmaGpsMlUz?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c4c966-8ff3-44c3-3086-08dbe512213f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:03:43.4422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOL5oSM2872hJzt02Ifi7jdD1imeYSvjw6YpAHUSMEqv9/+mx0FI5OMpEh7kj8gNX17wgSKQJD6XPeMyPy4L573t4vhvzgHBe5m+m8aS1es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 08/20] drm/xe: Map the entire BAR0 and hold
 onto the initial mapping
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

Both MMIO registers and GGTT for root tile will need to be used earlier
during probe. Don't rely on tile count to compute the mapping size.
Further more, there's no need real need to remap after figuring out the
real resource size.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 5a6053a61f301..acf6dfca0bc46 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -299,7 +299,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 	u8 id, tile_count = xe->info.tile_count;
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
-	const int mmio_bar = 0;
 	struct xe_tile *tile;
 	void *regs;
 	u32 mtcfg;
@@ -313,9 +312,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 		if (tile_count < xe->info.tile_count) {
 			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
 					xe->info.tile_count, tile_count);
-			pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
-			xe->mmio.size = (tile_mmio_size + tile_mmio_ext_size) * tile_count;
-			xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
 			xe->info.tile_count = tile_count;
 
 			/*
@@ -380,17 +376,17 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
 int xe_mmio_init(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	const int mmio_bar = 0;
 	int err;
 
 	/*
-	 * Map the maximum expected BAR size, which will get remapped later
-	 * if we determine that we're running on a reduced-tile system.
+	 * Map the entire BAR.
 	 * The first 16MB of the BAR, belong to the root tile, and include:
 	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
 	 */
-	xe->mmio.size = (SZ_16M + xe->info.tile_mmio_ext_size) * xe->info.tile_count;
-	xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
+	xe->mmio.size = pci_resource_len(pdev, mmio_bar);
+	xe->mmio.regs = pci_iomap(pdev, mmio_bar, 0);
 	if (xe->mmio.regs == NULL) {
 		drm_err(&xe->drm, "failed to map registers\n");
 		return -EIO;
-- 
2.42.1

