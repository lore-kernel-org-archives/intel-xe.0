Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F235DC4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE90210E214;
	Tue, 14 Nov 2023 13:03:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0766110E214
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967035; x=1731503035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2jAngHTDmFUtNbENRla5KrDje/X+XuQF+fTga4Xk4Ww=;
 b=CEFeFB7Zhq3dIy7b0z2il3o2LyM9/wuRHmZNkoB2HJNdFbSkNCvhXBEu
 e4jGbpFLnovxM7NRmr8lpkuugBW+upB8e5U/bexmWSEYxU9m2R+FSfiXH
 +ybBbq9D+scIcE+MrBZFyd+W16i5d3AgE5LVQQwxKcI/D5J/t62e5ex5W
 v0zIOHNfvdkZeDmOAWV+i0EqjnSRcugXAMe9fd0ea8pnFdh5ajNwmcWyc
 GQ8oLrYSW1CbZgoEfIpYg6pJlODgV6EP1V1Nnley9JHiNhInO037V+Gzf
 aEdTeHGFQt7q90ftg5TOJ2hg3q9/PoVsaLT4wmSZXrQrhgwEgnGbrto5o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375692062"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375692062"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:03:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="799518351"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="799518351"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:03:54 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:54 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:03:53 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJmHts+Cf3WLkKAl4n5klHCyytyNvfx5f492rEBqCevbnpQvvJdGPBTxjGNnzd4d8dnf+FNXmpj6RwSA832nvrcJ/6THEfUA9Z63jm1eltTEBgNX7xLToIxYlG3ibOYaZmv0Fl0ou+8/cvAEslbh6ldUA1YrkGTmnQRXQhR4xs3M7MoQ3kPE3FljhuUUmpIziG7t43HSEbDOSrHeNh/tSpuBWnIxiHLdsMIqKi+5Wyvqb+AfcrCV3ZVY2fpN5yQxTfC4FpIzZlXSzbBEeYhR6YbEfh9TXwP+ZP+JMep7jDuZOrf/NGzk1/q8a1CMjHGzpP2ra8HUAVvgFIc/GwjSsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27Rw23padcE8DEgHNTlN/UorWcDytKaDQYMpWBAz5zw=;
 b=GnQGlaVd+vAFed1aazLlhLqSYWTXX3V+WsIX28kR7tKXOXKuybxqFDSeu/CIIvynW8e1bW7FGcmhETtHo43USb4JKX30oeOr0cb692bTWODKNGemtV1/12kGAE+1eero9NBS6xHg+Y6d3KfB3a/O6qRqjv0A49t/D9PwlxMsvhfR+ZK5lI0bU5oV8TFX1IEh0MlkNJc1HseYjvXZF8OMsLLbJ1BNxBg2h7nN7C/vA1KUpDl+XLsFLKEiHO2DIuJ6XSiT57wXPtjasPk6uNG/PRKaY+fAMg7T+mwnpD/i2sTyHLdmfnAzbYV/nyi6CdXkMtrFVagVGzpOpw3uDLtG9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 13:03:52 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:03:51 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:21 +0100
Message-ID: <20231114130231.2299661-11-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 9982070f-be36-4168-20e5-08dbe5122649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WiYDe4KXDppFtTaQSWpWEMq6oPSWe8HVd3kXaAkFiUqJzP2OFOxB6Kexp3b3jUMHwgFsHu+MvBqI6IUT/KrjRTKyLTTjBMkz6IgfsAeEDO4TJFwTpDou+I6ZeAwlUK9QlnYJJf4RWAqTQxlkZZUW16TRFV8uCvqfD24OnUyzunC+ZkZ1HzyfW5/TpIPE5umd2d01gYqgOBYzgTKAu7d7Sc8NVwSIHpigZrtLbwwa/Ew70+5mz3eNQ0r6ETyziL72z7ezGTpjet77yxY/39ctVbQO+qKZXksnV5c0o7ZDangs4xpd/g4yit/aqxdRlg+xviw7bMQm5KedCC2pld7LVvnWt/PKuY3JKCPbBshug/71tzn0afIJ+U6LEK8i/FaIO/Dj3+EIHHbgGm9SVBMHzMhWkrTCohFKwLfMVR3hY+RNxhjG6A9O0INrguud8VsSVGKFu+u/Wa7Tsi6MiGKIqZyos/HOVwJeVUyF63v3UChKCWujmS52wpiBsdPoruGA6JbDpGVbQmrufpgsDOyvDcw1uTE3tFwSE+LGEgB99XLX9GumYFh9Cin/s9SUX2rt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(346002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(1076003)(26005)(6506007)(6666004)(2616005)(6512007)(83380400001)(5660300002)(4326008)(8676002)(8936002)(2906002)(41300700001)(6486002)(478600001)(316002)(6916009)(66476007)(66556008)(54906003)(66946007)(36756003)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzVXek9yT0NwRHhucFdNZUg1bVlXbWFWaGdwc2hOUVp4TE9WMnR2M3VDckxv?=
 =?utf-8?B?TVY4NURhbjJJWml3ZndURUZnWkRVb1JFT001UVlsdjFZS2JGTE84TVlwKzY3?=
 =?utf-8?B?ZlBiWS9lVlIrZVdXVlpWZG1KVEdYZEprZ3U5L0RiM3VobHFoRUVzU1ZDVmJD?=
 =?utf-8?B?bmdTeFJtNFhHcEwveFRjSzlmellndUErbmlYRG1YVEk2YW5RTlhpdEFPMXRD?=
 =?utf-8?B?RGpmNFNSQ1BYTDZrdzBLbTdwME51QVdVVlowZHRyRWZGNThXYVUzMmYvcjlw?=
 =?utf-8?B?blpFWkRybXZ5WjIvSFV0S3pnYkhpNHFtSFl5cTNBL0FtK21jSW10VWUxaHhP?=
 =?utf-8?B?eEtHMGhnT0FrUkpWazBFRzdnTG9nY3JZalk4d3pUTkxHWlFEZEFRZml6a3c0?=
 =?utf-8?B?S2hEUVlWQ1Z0OVk0d3RheFVsYmlKbS9zeElNaGFVNElLcHRVN1JpbnF2U0RH?=
 =?utf-8?B?MHczcUdVc0tLQ0JEa3B0U3FxY0hNY1BGUDhOd0prS1BuVXVTdmJzdGhjSUhY?=
 =?utf-8?B?NXQrMTVVQ3l2REhKMUNlOXJUcU1PcEs3eXZTSVdOaldZenZRSmU3VXdJejFp?=
 =?utf-8?B?WFZETm03bGVublZsbDFNTWFQeTVmajFXSmJOaUpIYnpnaGRQZ1Z6TWJUN0pN?=
 =?utf-8?B?VVVidEp5bFpjTWl3TTFpMURhcXFiYmxaMldZNDNVOXNQUVJhalFOOWZaUHZK?=
 =?utf-8?B?WjEzVDRTWVJ3cHBxaFZ5RGR2QUpwVVBIYUFKMDVNR25WSHBRSWxKbEFsdEdO?=
 =?utf-8?B?S2QxRUZhTTlhejJEL3dnZ1pPSy9IZmcwb0hVWlVPeU9HU1h3TkFLNFFoRTVP?=
 =?utf-8?B?Vm1qMERFdURFUUhrZ3hLK2lmWTcrVVczSy9xM1ZLRWpHUVh4SFFyT2pONFYv?=
 =?utf-8?B?UW5aUzNXSXRnRTFuWUZxNG5TTHcyaVI1cVkyQTR6cERpek1tQ2QyNmVxck1H?=
 =?utf-8?B?MGJjaWt0S2tjMWxxbHlXWVFPYzJQN210UVc5WHFSdWNhZElhOTZuU01oTEp5?=
 =?utf-8?B?bHgwaGNSMHVkcDI5UEdVNXNIYXdpS2RjZGEySVVBWjdPYzBWc1V4SmN6R1F5?=
 =?utf-8?B?SlYrZXlnSkxWNHJGV1RkNG5sdGxSSEg2U29XMTdFWjJIU3hIME44Y1h4YTA0?=
 =?utf-8?B?bGpCa3IxR053MDIzWnEraU03VzlMVVQyNUhhWGo2cHBLc2FreFEranI5TWFa?=
 =?utf-8?B?d0ZOT2JYYTZ6OHJ5OENPQ2tPUTU1WG1DVUdaenY5VGcwRjVqTy9Qc25MOC9Q?=
 =?utf-8?B?QUcxb0UvZG5zem1CajNKYWhjMjduMW9RdU1JckRnbDFJRDgyMFowbUxyVFQ5?=
 =?utf-8?B?Z0xaMnd5VjhFdDFqamRCVGdCbkN4eE4xVlZ4a1NxZVhJZVErWE5ybjhacjRp?=
 =?utf-8?B?WTF2TWhacTV4WlJVM25MSW10ODVLWjJUWUtwYkpGT0JoOHFkOHFOSWdUTFVy?=
 =?utf-8?B?M2FQL0ZtdE9CazJaald2T0U5OHdXVmdvSGgrcjBiUzNMNWppVHRmV2VNdlF1?=
 =?utf-8?B?ZllrR2hMOE55OHJwSThIY3lFTGt3eTJHOXJOQ1V2RmZLMXpSbG5mQWhCYVRF?=
 =?utf-8?B?MWpLVDkyazBPbVB1QWtmNVliZ2Q3ZFFCRjFTTHdxeU1HV2tYTjBvMy9tUTlx?=
 =?utf-8?B?ZmhVd0pvRjRiUTE3UStzbmc4Y0RQT2dXakZ6cmJXV3pvbGhnUWJ3V3ZCcGJN?=
 =?utf-8?B?U0hDL0RqSzNJUzZKWlNzSmgxUjhQdU1mZlQzbDlVVXArbWxwUUQwRXlHaUtl?=
 =?utf-8?B?enJQaFUyaFVDY08rTWYrWndsMjN6TjJibHBHTnpJcmVjd1RwUUVmaVZFVE9N?=
 =?utf-8?B?eVpEWHFnZW9xcmc0QlVsa2dhL2gzV2RoaGV0RVF2RnFGcWdYNGxGQm1BM0Zy?=
 =?utf-8?B?czlzMTZLek95SXlMS0xsTnRmM0ZFalBqMUQ5NE4yNzd3UGRGMG83YUNFS3Nt?=
 =?utf-8?B?ZEJOQWxtVVNHR1pWTVBJOG5IV2t3a2hVQ1RTSmJNbTEyYnUxOVlqbnVNVkpx?=
 =?utf-8?B?N1FLMlNaVkFFWTJsczY1ZkdPU2RUblF2YTFROEgrcnhzRFBiWUJhTW5ST2U3?=
 =?utf-8?B?cjBvaHNYbWQ4azBkZlQzbHN2ZGlKODY5cE4zamZLZUplWlU1M04xcjE5MWFK?=
 =?utf-8?B?eEtUeFRaUWdocG12Q2FHMm1SdzJ4QjEvZmNXWjNHQ2hWbHR6MUZaTHlFbm1o?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9982070f-be36-4168-20e5-08dbe5122649
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:03:51.8819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrfABqmSG8K3bN+ENmFdcwkA5dX72TZ+UvVpBIt6aobOVZ9t7HA//03qvcSyySM9oyqAf67OvHNKZq8Vw3Jr1/ehgvV6MtvmbX68w+/vkwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 10/20] drm/xe: Don't "peek" into GMD_ID
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

Now that MMIO init got moved to device early, we can use regular
xe_mmio_read helpers to get to GMD_ID register.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_pci.c          | 35 ++++++++--------------------
 2 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cc27fe8fc3633..6b195115564ce 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -38,6 +38,7 @@
 #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
 #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
 #define   GMD_ID_REVID				REG_GENMASK(5, 0)
+#define MEDIA_GMD_ID				XE_REG(GMD_ID.addr + MEDIA_GT_GSI_OFFSET)
 
 #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
 #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a1026b7ee4727..a6c08577b01d2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -21,6 +21,7 @@
 #include "xe_drv.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
+#include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pci_types.h"
 #include "xe_pm.h"
@@ -441,29 +442,6 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
 	return NULL;
 }
 
-static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
-{
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
-	u32 val;
-
-	if (!map) {
-		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
-			gmdid_offset);
-		*ver = 0;
-		*revid = 0;
-
-		return;
-	}
-
-	val = ioread32(map);
-	pci_iounmap(pdev, map);
-
-	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
-		REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
-	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
-}
-
 /*
  * Pre-GMD_ID platform: device descriptor already points to the appropriate
  * graphics descriptor. Simply forward the description and calculate the version
@@ -495,9 +473,14 @@ static void handle_gmdid(struct xe_device *xe,
 			 u32 *graphics_revid,
 			 u32 *media_revid)
 {
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	u32 val;
 	u32 ver;
 
-	peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
+	val = xe_mmio_read32(gt, GMD_ID);
+	ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
+	*graphics_revid = REG_FIELD_GET(GMD_ID_REVID, val);
+
 	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
@@ -512,7 +495,9 @@ static void handle_gmdid(struct xe_device *xe,
 			ver / 100, ver % 100);
 	}
 
-	peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
+	val = xe_mmio_read32(gt, MEDIA_GMD_ID);
+	ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
+	*media_revid = REG_FIELD_GET(GMD_ID_REVID, val);
 
 	/* Media may legitimately be fused off / not present */
 	if (ver == 0)
-- 
2.42.1

