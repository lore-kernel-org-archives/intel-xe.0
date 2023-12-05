Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01894C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FAB10E380;
	Tue,  5 Dec 2023 01:33:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF2610E380
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701740009; x=1733276009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GtRZjY4AGS6th8xKxIVi5f0wCC7R1trmMNK9DCx+kQM=;
 b=X+v1BDkaPDV8bAFcC6KOUaWFF2iJYGWayHNpO9PG44qvDg2OqHu+Mbyq
 5jJCLyEw7Isl9HBIBpelXF10nKKqzPV7weWpNAkqiZ/5q81v6x5vkqdVX
 z1X+bkcESkPPkIpx7He6WNVHgdqfIIPz8fUC/XPJPSGSz1IvzAOfGzCwW
 jmiobxeATECBDSvClTWKp947/QizugDdyzz8H9fgH1SSKSJdnHDBX1w1i
 jeY7GGtlLUJiRlfeN5R+ufJk04mhNgS1aqsbrmZ2Hr7MJkDjAPlF+PWNJ
 vqx7aVh/NmOrGy3uKDsf30cFagEMkPEzWKfqolwut9S1oVmrZzAONfl3P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="458146938"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="458146938"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:33:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764156021"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="764156021"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:33:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:33:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:33:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:33:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YveC3VWdrX9ZmWPhIffIBPhhR8rga45AwCKjOcEXBdfGHgIuhpk6hjDHctZ5BkmBydbNU0OaV3sst7vrY1wkt7CkAohoMMxvrLiswsUhtR78uBVObH9mFkLIhzOpuSRj1RwVgPAQT7m73oSjmn6rkKcgTc5WsvdMe5eGmxRXL6g2dg2lCYxKyUh97+BYEEwCIatYjasdWZLp4Ivj2tfAv3ygsLLs8h8Tt+hySdHPmyLgTY5jKO6YM3B2akiQAUn89iiSxZu9PAqHe+CjJXMbAbbcTXrfr4FRTwbKmSEn7OxjvBGBOr5vW9S/iqbDoxQUr1NASwperDvaPd50zN/nJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=783tXf1uEmQ9LGnu4FFVxoLlbbp7C0cVzf/CnxOJqMk=;
 b=KIw2j69R6P0jZhc8hZxTkyQEf5COnFGNO/SvHYxmdZZRVDbMkZcYGsV1v21P98isaSpsUUi5KQvOntuq+kaV6xD7ZVar0ek3jFOdKaZFBgsvVeDy9vOKGstS+OXO82+EPZBNb352flFMCwwaLVO0vObuo180jVwhl7h5o91amxJaLRMP4YObeWDsSgxnYbWbHE4WQYuY26iLYlchgIr5cR/3b0pNQhdJRD1adceg9zqlheO5CumWklaHVIP15xfn3C5eGtTt4qQayl8UWA9nHPF984oXHCDxLOj1WrGxM5ckOou5gc830vxQPgq55QmdT+FtJRV2y+72Yij0dB0k9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 5 Dec
 2023 01:33:24 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:33:24 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 02:32:58 +0100
Message-ID: <20231205013309.1497006-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed70ea0-144b-4b50-f56e-08dbf5322c03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yt4/RIvq8nUuNyTJyrhqNB9lSqlnAd7/utAjH4ZMQKl5+PnkRqIKVImBTPz18S6Dt3nnL5dXwwTHvBaS2fom5oEm6fEpK9wPC30WIk1UHnl5j4+UFEmOdyF3XEkwVkGqsZzA4/BhVVpeaWXJPVrQcR0kmw1lsSGpVtYQEW0wiunKMLEP0WJl9rxuhyCwkkO6AiN+PruCT2aorEPsoquTWFbjnhNs+g1gPJLcNVY7AINZ4wgEM6FCxCC7L/WCydUwaUEdg9hFd7IMqhdvwDvqy7AMQkdea7kcMeTTvr3SgiX0Xdpp75K5vdvvqPE2KCQcNrKA8MEA4I/MbsUd1Yyra4iVPBXRBU7eDyfnjC3PHd12ziiibuSNLHXrcvtHsZnTurXVeZoFZ6xr/4PomhRlopsuD6WvwBrCxZ8TaRotXTNJcfxiOpBxkrYJHaDkqI5er9VPl6rRjPipvBB5MDP208yWFzdikShQpp4UAFUt9gmMNfKT/32JAZgQhdx41odSGCvyHivy52TtKvbm5NjldPat7AB+ToZQZMoSLLJm+gOBAkFQyAm9KTuZXnmG8/i2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(1076003)(2616005)(107886003)(6512007)(26005)(478600001)(6666004)(6916009)(66476007)(83380400001)(6486002)(41300700001)(2906002)(5660300002)(8936002)(66946007)(54906003)(66556008)(4326008)(8676002)(316002)(6506007)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2VtUUhZSUZRSG9UYmxRd2JCQTBDWlE4ditFMVhEOTdKdUFJVjd0WkVDTkFy?=
 =?utf-8?B?a3BqSEQwZWEwemlwbGNHQUlaZFRFNFMxM0xiQUZzUFNmazlDdWJDdmJKSUtq?=
 =?utf-8?B?MEpkaHc3VXAva08xMjcyWDdJekplQTNPVE9XWHhtaGRUeU9WS3pFYW15ZVZ3?=
 =?utf-8?B?SkxGSE0xOW4weXJUY3N4cmxIT3VzSktNOStDOUkzK1MyNHZaZXk3OTNreWc2?=
 =?utf-8?B?ajJ2SXR5NE54OU9uYmRhMmZNRXpTU3Evb2UycHJURi8wZ2N5aFZyckFRaFh2?=
 =?utf-8?B?QWJ6VjlmQnZOcnNRZFZpZDVGd3IwRTZ2MnhNSWt2MWZyb3Y4azVDQ2VTM3Jw?=
 =?utf-8?B?NkxTOXlXNEhEQWdoUXJkeWNoZlZvQkZpdmxMVWhpOTNqU0diQTdsVEtqS1Fo?=
 =?utf-8?B?V0NjRnhyQTYwQ2FlVjBlWXNRUndISUtwOGRuNzY3UCtZSVVMM2h0anRSZkV6?=
 =?utf-8?B?U3FTZE9ScUpSMkl2YnBXTEN5b1ludEg5QWVGNjdxNGhGemREZVFqZTM4YTRi?=
 =?utf-8?B?QnRacFVXYTQzak0vUkJacnNnelJUSTRXMlJpMlJTdWZnbUFxYWJmWGxnbUpD?=
 =?utf-8?B?ZXQ0UnE0cEltaEpSYWpOWnRISlhWUmYrUGMvYi9VSk8rdDBWclV3UUFqUnEz?=
 =?utf-8?B?cVNYendMZXYwbmFWczlWdjZmNVcvakdXRmxmRGt6VDZsOE5zajNQd0FvaXU5?=
 =?utf-8?B?V0VxNTZnamtYRlJvQndRRU9PdVpBUmlGbWN5NWZFZno2dFE3a3RURnE4MFp0?=
 =?utf-8?B?T0RKcTlMeElndUI4bEU0Mi8wY1p0OXdBQytOVm9BZS93MFgzM2p4ZnBVbkZM?=
 =?utf-8?B?LzZRNWpBN2ttU01rZ1l4VE1XcHpuRHZsZFN0aE44c0VpUFpaeGp6MW5UdUR1?=
 =?utf-8?B?eU9wZTkxYkdQRks4TS90UmwrSDVrWGJldU1nS1NDdUpKTUVEbDlRNHlzNHcx?=
 =?utf-8?B?aFZxQ0lPckpjaVlpTm13T29iUzVYOUZPbWNnbUtrZVR3MmZTK2pZckVwSkkv?=
 =?utf-8?B?eG9oYXlGU1dFM2hwR0NrWnBKcjhhLzFVWUlNREJCTmFreGZsZFNqdFVwamdG?=
 =?utf-8?B?ZERoQm9RcXN5bE1Cc05pQTNJd2N1enhKd3B0emlQRDlmSTFRc0ZvRlRtV1JE?=
 =?utf-8?B?QjNDYjJhTDNtMW4zREU3UVpOUVFzdnNXaS9qeW5EQnZHTEhVY2gyTnlzVEtO?=
 =?utf-8?B?aDhZeFhhaTV6bTFqRDhwTE5tcGVRTE9YOVJwUkdzZGFKQW5YNmFaeklFV1B6?=
 =?utf-8?B?RXJ1QzFuVHFwbHFLQSt2YlRGMUw4eG91K2hnSmpkTkpxbFN5ZzVyN3E3azlU?=
 =?utf-8?B?WWlvMEFxUGl6eGF3L28wYjFlaHFsVVNkL2NvTzdWck5laWRUSG1sdWdpTWsv?=
 =?utf-8?B?MWcyTlQ1KzgwNm1DUTFNY21kN1VTMzJGVDNTVUpaZmx4MGh5VG1sSlB4RUpk?=
 =?utf-8?B?U0dqcGlpSGRnM2Z6N2I0YWgxNVJYWGpzSVN6L2paQ2FwMXRWZXU4eFBCcDVS?=
 =?utf-8?B?ZG5JaEE1RXZXVDZHNERmZWZWc3FycFdscVFMa3E2YVV2QVdqVGJVTXFMNTBt?=
 =?utf-8?B?eVJUUVFhOUsyVXk5cUZGTnVXOUNZK1Q4bFBOQVpEeXZDOHFCdmdmZVU2bjg2?=
 =?utf-8?B?d0xrZWdHL0xxdnQwZ3Y3TFJtUmRPWkJPMmIzVGhYNlJKbWswMFlEdGlFVCtK?=
 =?utf-8?B?c3lkeSsyZ01JUG9tblArTThIOVI5RXdneGRoMnJBYUxjS0Z0ZHllekFmVTdB?=
 =?utf-8?B?MVFMc3VmbWJxZCtOcnVtNkRtWk42WTJJd1BqTkRlOEdjalMrSjljK3FTSzQx?=
 =?utf-8?B?Sm15eExMaHpDMTlnQ3RubWdSQWxTQ1k3TnlmQWpBTXdkUkg1MHR2bjhvTlpt?=
 =?utf-8?B?MFFOcGNLWTkrK1RmOVYxTWVOK0RVODhvOG1GRXFqMFYvUVE0cURZNkxKYjNP?=
 =?utf-8?B?a2t2cnIyRnUxNzljZU4rL0ZiQlR6eCt2d3phU2VaOVNCZFNwM0hYeDNqaTAy?=
 =?utf-8?B?N3dydU5mQ2dHdUJmWmRJQnFVd2FJWGdBQ2RuUTVpcmZSblFDbXprWkl2WXdW?=
 =?utf-8?B?WGpzRlg5azN4c0plbjZaL2RENDFmTktRMGMzZzZhNks0U3pzK0pFd2dLTHlP?=
 =?utf-8?B?Q2M0NG14YXQ4clpNTEVRTlFjVWlSaGRLUzZ5dmdiWUhkQnE0dFF5UDE4Vkd0?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed70ea0-144b-4b50-f56e-08dbf5322c03
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:33:23.9728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6ar6AX9wipijh2NfilTTrRVYHXne/bUbANPMxi/hgeWMOJQztEVOFLyv7fb2vepA264YNziPHpTTfhxM5QLefU8y/yTEF6xSzY/xgwnRjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 03/13] drm/xe: Map the entire BAR0 and hold onto the
 initial mapping
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Both MMIO registers and GGTT for root tile will need to be used earlier
during probe. Don't rely on tile count to compute the mapping size.
Further more, there's no need to remap after figuring out the real
resource size.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index ab91be1405c96..2e6c94731a5a0 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -300,7 +300,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 	u8 id, tile_count = xe->info.tile_count;
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
-	const int mmio_bar = 0;
 	struct xe_tile *tile;
 	void *regs;
 	u32 mtcfg;
@@ -314,9 +313,6 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 		if (tile_count < xe->info.tile_count) {
 			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
 					xe->info.tile_count, tile_count);
-			pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
-			xe->mmio.size = (tile_mmio_size + tile_mmio_ext_size) * tile_count;
-			xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
 			xe->info.tile_count = tile_count;
 
 			/*
@@ -381,17 +377,17 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
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
2.43.0

