Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23F8C07E98
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A533C10E688;
	Wed, 29 Nov 2023 21:47:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C01010E688
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294435; x=1732830435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=E1giS9Vq8Lt62Cm2Uu8ZaIjP+Ayry7fe0XQNIc8+xV4=;
 b=mbLeYdlWO7ju/6xXTFfZfMXQNkotvpREca5c+PomRFnRCM37WuY3YiQr
 SAr+QMh66JZp0m0i3e2/jcF/gMNfhbUwMxQuAOZUNX6RYngE7IHCFXj3c
 fnEFdohVBiYBhShMC49WzxL46nmbWlstX1Sf2Me6fE/wiU7DUNXTQ7PpH
 sCkJL9lAXNq7zVQZLDlzS5neZqpAwdS1WJXkXDKfX8vMAB48obrcbCCJ5
 zBUdeAGK4l6Isq4R3vl218/A2qWSNQodlYpO9jUcG4YhHZRc4qlWrMd0d
 TUnVKxRy50sKHJMvtu+Qtl9MM6PXC9pNbvoo0QTw8ivvN2h82x4wULaQD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="383628088"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="383628088"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:47:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="769061762"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="769061762"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:47:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:47:14 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pk+U+Mpj0lCb+IlHk1SusaxtQlZLbe34N2Ewgq3944Aexo+A8hleMsemKux6wZQLJvHyrOxU7Eha2Ek+BVO0diAW/psiU2W86TpLiR3ybgNd9yCe5wGkx62dhxOtvQfx2FEW4atkZffMsMc6p7BUvPRM1M0J0mw/Xkcj/nTr6xxE2FXy1e4DOs8ah7CGr940fjJnjm5nlrbi5N/Uu4krvosqE5Hkol8akCqoyP1e/gYK/Rlkc0/Lk38+EkmHSwxyOqWBES0MBANk+xRmHKtBSK/XCzpc4qXNOce3s2tdhq108uu96OgIiN1CPQ2xi+JiHIK4QSdBRbPRBPCbwoYVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p417Y5tbcIJJzdZEczgqxl8OpTKuCQMVcEkWMvEzV2Y=;
 b=A5zVxzs7sFThVAM6uvuun+TBOnDLLN0ET/XJFdNBGvDxcG4zUdplFkPhxjzJB7YTxxuy9b0Acq3DX2S7Q0s0WNwQ/T1qDOfbjIxMrv8GsfFTXCz7Qe1GRE3SWoGVRqRsji+wakN3KJJqatZ6hDElpqUHroHXut4/O/YAiIjtV8OMm7JQ74U9D/K1iKon4LNph+5dfxg8XsNO9MazBi6F8DORG4SAMldq9cz9S95haQ3aGLEJguGFhmmzY2n+r4Jh9uKTfiRlSBMxcYJ/wK7QkZvtGIFu0s8Iq1nqK3miIZ0Y+pZWOzgORI8Rt+UJINhTy0zqI6KebMB1IAbueLnl/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BL1PR11MB6001.namprd11.prod.outlook.com (2603:10b6:208:385::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 21:47:10 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:47:10 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:45:05 +0100
Message-ID: <20231129214509.1174116-10-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0380.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BL1PR11MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b5c777-9c3d-4c28-ee07-08dbf124bd9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h4JauZ8+OdrYIMZkhyIQ0ZiVJLc3IdHRnWJHdk3Qgad1GoX16A+eUTMRKuepyVaUPQMa92vOKHuQteFsF3mgonPc8fgZPaY0e8nnjQRcbQYBbbOwkch3RUYSDaGRyWlVD4Yw9mEKEcKS+WwT+iOD5kbvWV78loHiJP7Tl9BY9zly8HAEoGYxhjrGjgcNj0BpHVP8pzBhOOn69rsH5LL8LezTjuyaUnUlPS3c2uZQ1ybQ/ucwi7eq/QVkxT3GQ/0/2sK2MrdkYMCACxiAjdpkTkwFTN5KtAFzoasVuudpV4Heal66Lk7pwTf1Y/M3MwtKygI+tcWTOSRCSc50Y9s2I7MFMF/gDdpqmtAXRsLMwdbovKCgawMlsmAmUKZHRtBv53NwuFMiN1xYUqrCEGUYNonQJ+TSprlK3WOlAnwSPk6UNTZeXuSJUEyWoXt8//VAm3RtFIQIgtx2rSF+KBThn5q4PPmu7bGiwiL4AMGvPrjveDGy1cmHY3F00+4MUGbNsLu8ABQo1W3D03Remk3NzzFf5/oFD8T2r/5htQVcs3VlJZOGnTQGO/esd90AGwPAzmh4JxwdIT/m4EuLoayfV28QgkEGEAJJXFFlaAvBh14ONUOJUDo/y4FeEANpFFBY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(396003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(8936002)(41300700001)(86362001)(6666004)(6506007)(478600001)(5660300002)(2906002)(83380400001)(202311291699003)(8676002)(66556008)(54906003)(66946007)(4326008)(66476007)(6916009)(6486002)(107886003)(26005)(2616005)(316002)(6512007)(1076003)(36756003)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzVuMXFFZTNCUXM2NEVEZlN5ZURJVTNqbEc5czVXMngveW9nd29XbmR5SnRT?=
 =?utf-8?B?Y1ZTYi80RGdxWncxTVcyZUNibjdUUXJMY1RKcnFCc3I0RlZ5Kzk5anY5MElM?=
 =?utf-8?B?QVN6ZlRqWFJCMGwxYkhnbmRndDhwcU5iVFZ0bGt0ZlN6ZGFmTmZPdmFFTVlH?=
 =?utf-8?B?Si9Fc29sMncrS3QyNnoyTkhxNE5VTElCVkJOdlFneDBSaXh2Q3dSTkFqc081?=
 =?utf-8?B?VXBBd3BhRC9pTkZDNWRVTUh3N1pDeWtKYUxmUXI0eWRzSkJyaWgvY2IvUWF2?=
 =?utf-8?B?U3JDQkVHeXBOWkRvblh1ak1obG1qeWJ4Y1p2YzFNZnFuZ0hlUEZ1NXI2dGZr?=
 =?utf-8?B?VVFJQ2l2RGlReGJmbDdHMzBsUERodlBjZ3Q2WTdwVlFnODdURmdZcldGYWFl?=
 =?utf-8?B?YitSaVhncmovUWZ0UEEwMGNheE8yaFRWcG41aE1KS0VTdDJnTkxHbkZ1N1E2?=
 =?utf-8?B?cFhCdUhhUG5tb05TeXVlUGN0TGVBQzNoc2tHelFnWjdvK09aZmpJTEZvek5T?=
 =?utf-8?B?M1V1MHlKZEF0VjlPSGFGRzJTd2Rna3VMNFpuZUNXZFdLUVk1QUlXS0owbjNz?=
 =?utf-8?B?cTlRZlBIUTg2NkJOb1ppUW9JQXNxRGw1eHJJMDJIZ0ZqUWU3NS9ENmM4L2R2?=
 =?utf-8?B?Zy8rUGlFN3RLODJqelorblZxYWFHUWlQKzkvelJLd0FMa0Z5YVA4V21iRmk3?=
 =?utf-8?B?TU5DbVdjOHdJYXdZT25jT1pPd1hZQmRMaW1Hb2E5THpHRGJEMEM2MWNlN1hB?=
 =?utf-8?B?MU81NHIxcjVyNlZSbXIwYWt1SDYyNEgxb2pjRkhOTnI2R093MDg3TGJmMGxp?=
 =?utf-8?B?aFdOSEpMajNKcG5JM2c5SVplMHJNT3YvcDBzZklxNHlqWVBOWHdaME5haEhh?=
 =?utf-8?B?aXhhR3VKanRqc2N3K1A3R295bXBEdWZLeXQwS2NoRXhDWEVwVTR5Z2kxR2pC?=
 =?utf-8?B?MnI3UWVQY0hmSmd3SUl6RHpYenl4elVrMUlBcmZZSUZmZld2MldjRzdYd2VH?=
 =?utf-8?B?MFBlQWgvSGxLZWFrRWhmM2ZpN3d3d0NFbTZUZCtzRHpjUjNta3RXWkh6UmNT?=
 =?utf-8?B?YUw5VHhnTFBnWkRhRDIweG9HeVF4TloyUW9YcS9IRUs4Mko4dEc0anRkSVRy?=
 =?utf-8?B?MEtQV2NxVlg0cHE5b3NLRGpKZFVpbU9zT1lPdStydVlVTi9GU2cvOUNqVmdm?=
 =?utf-8?B?OGxVRzVsR0o0cmdlVktCZENMODBvckFBbTMvR2dabTc1ZjhBSGZ5U2dhLzUw?=
 =?utf-8?B?UHo5amhOVXg0aFUzY0dhZnMyUnJzd3ZONTVJYTlIR3p0MnZOQk5LRDY5RXc5?=
 =?utf-8?B?ZGZ2Z0RyK1JoM0VsMVRmYXhDczVKQWd3aFFUaGtvSkRaeXQvekNzTFFlN3lT?=
 =?utf-8?B?UGc2ZlJzbGZpbDNDNTZHK1hlSlZaWG1mSlFqM0NHem4yYjBGZmVFYTRqaDZz?=
 =?utf-8?B?VGhqNDdjdE5MN3V0Ymp5YlpTTjNPZTVwOTlnVWt3Wm1UYUZHQkNWQmNNbzRX?=
 =?utf-8?B?OHJFaDBxSWJmeHFlb2xOdjlyOTc2YnRzY09zZmYzUGFRbFBYSDZ3U3QxanNz?=
 =?utf-8?B?L3pqQlo3bElPWTNsUWdaQ1Z3MlhCS05PdHBGSDN0Yng1eDNhb01wNHVaWmFh?=
 =?utf-8?B?WHdkWXEzSm5veFU4cnNMT3JMTnZJcWZtT3RwVlE4RUQ2dGtrTThOTzlCQ3cy?=
 =?utf-8?B?SjNyZTdQeUZneUtOUjl4STJxK3AzZmN5KzFHZCs1M2VOSDZTZjhOVUpLa3Ix?=
 =?utf-8?B?UzZDRWJ6UDBPa2dFcnVvK2FoWVgya1VqNWlkMU4reVEwQVUwWGN4VXRreWFs?=
 =?utf-8?B?L3NQcE9sZGhaZmYxZVVQREZSaXhvVGJOUzZqT2t3ZWVpR2dnb0ZrMUZkU3Vo?=
 =?utf-8?B?Q1A4SDZNZFpra0czdllPMmMrTU1GZGNtZ1pCc0h5QzQvb2pqZzU1K09Bbi9i?=
 =?utf-8?B?bmZvdm1Pc2tTVmtUZ3J1WVB3aGpCa1F2R1hpVWRnZHFKb0NyaFZOdmV3MmlE?=
 =?utf-8?B?SWFPdm9FRzMveWM1Z1RTbFZvZHZjYURUaXROL2Zma2lSZXFmKzF4V2k5TU91?=
 =?utf-8?B?OXlLMDJXRVpQaUtBeTJndkxxRVB2aDlKS0hTdm5GUUJNTzBKdlBQZmQyVmdF?=
 =?utf-8?B?SnZOajFGd2FlaHZ1SlVUcTBodTF0enBuSHU1R2J3ZkxkWUxaUE81M3ZjbytT?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b5c777-9c3d-4c28-ee07-08dbf124bd9f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:47:10.6538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNUYdxTGctTPKrks/WXa0Z2cTX9QD5aqPNlvjWH+ugCSCeItM42NMiGfdAcNjq3Kxf48VpePngRIeHOtA+cZnMgFWJSbnh69hCrS3Dj8emc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6001
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 10/14] drm/xe/device: Introduce xe_device_probe_early
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
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SR-IOV VF doesn't have access to MMIO registers used to determine
graphics/media ID. It can however communicate with GuC.
Introduce xe_device_probe_early, which initializes enough HW to use
MMIO GuC communication.
This will allow both VF and PF/native driver to have unified probe
ordering.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 22 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_device.h |  5 +++++
 drivers/gpu/drm/xe/xe_mmio.c   | 16 ++++++++++------
 drivers/gpu/drm/xe/xe_mmio.h   |  1 +
 drivers/gpu/drm/xe/xe_pci.c    | 26 +++++++++++++++++++++-----
 5 files changed, 55 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5e1f73c8c77ad..f4be4b13a506e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -375,6 +375,24 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
+/*
+ * Initialize MMIO resources that don't require any knowledge about tile count.
+ */
+int xe_device_probe_early(struct xe_device *xe)
+{
+	int err;
+
+	err = xe_mmio_init(xe);
+	if (err)
+		return err;
+
+	err = xe_mmio_root_tile_init(xe);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -393,10 +411,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_mmio_init(xe);
-	if (err)
-		return err;
-
 	xe_mmio_probe_tiles(xe);
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 54694f98c91a2..3da83b2332063 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
+int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
@@ -123,6 +124,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
 		for_each_if((tile__) = &(xe__)->tiles[(id__)])
 
+#define for_each_remote_tile(tile__, xe__, id__) \
+	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
+		for_each_if((tile__) = &(xe__)->tiles[(id__)])
+
 /*
  * FIXME: This only works for now since multi-tile and standalone media
  * happen to be mutually exclusive.  Future platforms may change this...
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d1b59021c9712..6148c9da4f64e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -15,10 +15,12 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
 #include "xe_module.h"
+#include "xe_tile.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
@@ -376,10 +378,8 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
 
 int xe_mmio_init(struct xe_device *xe)
 {
-	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	const int mmio_bar = 0;
-	int err;
 
 	/*
 	 * Map the entire BAR.
@@ -393,12 +393,16 @@ int xe_mmio_init(struct xe_device *xe)
 		return -EIO;
 	}
 
-	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
-	if (err)
-		return err;
+	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
+}
+
+int xe_mmio_root_tile_init(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	int err;
 
 	/* Setup first tile; other tiles (if present) will be setup later. */
-	root_tile->mmio.size = xe->mmio.size;
+	root_tile->mmio.size = SZ_16M;
 	root_tile->mmio.regs = xe->mmio.regs;
 
 	err = xe_verify_lmem_ready(xe);
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index c054c27f6925d..98de5c13c89ba 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,6 +21,7 @@ struct xe_device;
 #define LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
+int xe_mmio_root_tile_init(struct xe_device *xe);
 void xe_mmio_probe_tiles(struct xe_device *xe);
 
 static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d9a3b20179cc2..889f60fa2e7cf 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -540,10 +540,12 @@ static void handle_gmdid(struct xe_device *xe,
  * Initialize device info content that only depends on static driver_data passed to the driver at
  * probe time from PCI ID table.
  */
-static void xe_info_init_early(struct xe_device *xe,
-			       const struct xe_device_desc *desc,
-			       const struct xe_subplatform_desc *subplatform_desc)
+static int xe_info_init_early(struct xe_device *xe,
+			      const struct xe_device_desc *desc,
+			      const struct xe_subplatform_desc *subplatform_desc)
 {
+	int err;
+
 	xe->info.platform = desc->platform;
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
@@ -558,6 +560,12 @@ static void xe_info_init_early(struct xe_device *xe,
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				  xe_modparam.enable_display &&
 				  desc->has_display;
+
+	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
+	if (err)
+		return err;
+
+	return 0;
 }
 
 /*
@@ -626,13 +634,15 @@ static int xe_info_init(struct xe_device *xe,
 	 */
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
 
-	for_each_tile(tile, xe, id) {
+	for_each_remote_tile(tile, xe, id) {
 		int err;
 
 		err = xe_tile_init_early(tile, xe, id);
 		if (err)
 			return err;
+	}
 
+	for_each_tile(tile, xe, id) {
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
@@ -726,10 +736,16 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
-	xe_info_init_early(xe, desc, subplatform_desc);
+	err = xe_info_init_early(xe, desc, subplatform_desc);
+	if (err)
+		return err;
 
 	xe_sriov_probe_early(xe, desc->has_sriov);
 
+	err = xe_device_probe_early(xe);
+	if (err)
+		return err;
+
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
 		return err;
-- 
2.43.0

