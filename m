Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD55AC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6D910E203;
	Tue, 14 Nov 2023 11:45:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E69210E444
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962324; x=1731498324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5dFVj3iDjxhIda/p53Pf0usWkGS/fUkg2AOK3BqUDgU=;
 b=gKvB7utt8SSp2p9K8tIBxla+KON7izARXpcs2FY8TNBKvS+JoU92klla
 cMPbiV1x5mAB4wv7KyqU1liBZCkEAsImFXjkE9+DNdoOb+oT5bcuZQzQT
 bT9x2kkDUvpklbwJMf4VvBzlfNMO69vZFrsUQ2b7nwYAca/McKVzUngpx
 FkFOuDLg0/kYQ2dEz0N3JWqTcQz1TqX4sZJHKr5iqv8mlVR6aw83vyGA6
 /XlWLEg6ea39W7kAfV3g6H5m+6X8XpAvk2PQbjd4AGC3vk+tEyE0kUxSh
 vjFZT4Gld0nNAfJQrOK7hNZbq7auhoIls76xXkbEglHpBGXHVdHFe3gWl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369982134"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="369982134"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="835008992"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="835008992"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:23 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKvpo0qst6sMDfFWm8xXlAUTU4OwGtdpy57KwfRZ9t+RsE0hcv01Nu7y8j7IkzsRKEvuXZhAmtHMh7BaD2yTlxdXPhQ8XJC+7r05AcldNO4gkbBcQgMrtc4vG/8gwz4CEtbbVmUSm/NtoanYyX6Ny1YPX26kHB+KvRyD/knBFiFFUiPHq7FaudOeyrxigti9jtbu9N0vZHe2YYMO9rqp8/3GApNE9e2MRnIZMv9y/H2TXNzbcdYYo+MDiMVUX3Dy760jZD6T7O2O3NGH/4hnD4NmdmtETMcYWBgVb53AunhzDJE7tclHxrCI394Z7tLfse2fgZUsLE6XM+xmb+dESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fN2HDxixzpT8m5/DO4cvAmHpiYoFY/Q+r7uA7W6kNrM=;
 b=OaMH6Gy+iCMBozZ/1bf/CbBVXemdHnFTkquehoGU1Te9Xi1i2IJsMcdhsgTdLhYCwEiMmUM+m4wDEJIl99NQ4YzgxdYRhnCiAf0kT45hs90ZSkG+4snJEKnXvIILCB43D7VRSCOQJLLPu4vdPhFcrn2NdGiY8SVEyVNzQCA+AUFhPSHXzPJ8bwv2YStJJ8c/yKJrecaohJ/3WVWWfRk83MgJqJI+0vnOYDkoXBAGzkE+L1/9oMbBNlRs49A1G3cGdnSPCoLPNoBWXATwuuRg9kQCQmUGdDxpEi+Zp9M26GOAjlyikIha3m4zbicEtiDeD6vgfAj2+BYmXbDNtKfJZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:45:22 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:22 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:55 +0100
Message-ID: <20231114114405.2207747-11-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d26a4e9-4878-4dc0-d314-08dbe5072eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GAUth4E9EXHwhI1rOsLAZMBqZjGgJRiiQYO+xEutVRCZH19nx14vquS6saZ9H/PcFa9OAgWbrfXl4aFcQDvg+NyOPomvxhRLjEtJwCaDuI2YqdSFeWM5HL7lksxUGl+7BklFza5F+1P2WDmiOTSy5YYziv53Lf2kGC5opZIfkLAXaM/cGWmcBEwr0R17af2+El4KeVTBM4Y301us1XLkLU5ZpQuL8j6MlFfQNuXBBrcgRVJOYb+IOlkKJeHyl4N94r27UhNCGVFJhKkmP8vqcXGAuAgCDupKIMEqveLgHo9K3v9JIegfNoqzPHIefY6A5ohZuZCFVj9vHCQt+mMKPXWc83R/cjR4WiVoD+uVCqEPWHCyl06pkqlpYEY0advGMtxZDN/bWUYdqt6wGM+KOsyetyBpTqNPe2eewLKAiT/CI/03pWxdDJSFdb1a0EFfXCIIRjLZM2NxDp1KoydRYS6OpcitTcSKZAWL0I+Sev8248b6wPvm7MZ71uRbcOt8qWbK+2odgkJpC94m8PccUPEMX257fYmbb9DJ23b2zd8ZBdv6+OjU1hODR6NLVlPP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajdJRGZHWGZSMkpqR0pXcUtQd2xIbk9tK0tlY1hkUXlYazZ4REJic3BhYlBB?=
 =?utf-8?B?WHFRbWFOWTcrOHBzY1NlZHFEWGFPNUNsT2dnMDVGNm1IaytWeDEzOUQ5TTJl?=
 =?utf-8?B?YjhnbUZvVkxMZEFlZFZUd3EvRWx4d2JHbmdhblNsdWFnYjFvNkREMG1PemN2?=
 =?utf-8?B?YnI4SG1nWjNUTk9nYk82cDRZZTJjdk9FeXJkOFZreERsNHBPaEpXYVRWTGhi?=
 =?utf-8?B?dUxkNzBIeVU5bCtyYVREb2M0b3JiUU9weUcwK1JoZVMzQURwM25vbksrdWtn?=
 =?utf-8?B?aURGLy92TWxtdnB0RzFuT2dsK3hpQWc2TExmaERZclpPNFpSNXdIWU56VE1j?=
 =?utf-8?B?dStyMVFKWmIwTUNralZuMGxDRHV4M2cvbGV0ajFIeHYwV29TdFBGZm1STFFI?=
 =?utf-8?B?akpnaW5vNENFZjZFRUFJclo1cmFDNWp2ak8xOW9sdzZhU1luK2x3bzNpTmxE?=
 =?utf-8?B?R2NrRTJLSEVjSjNjR0o3R2lLN1BEUFdlc1B2TFNHVzlsR1hOcGNxNkhjT1po?=
 =?utf-8?B?VG5OU1pBcWtnRjBGaVdEdjVOcytlWWFRZ3grNmlrczhGUEFEZTFZKzI0R3JE?=
 =?utf-8?B?djBtVUtETnBJRDFKT3M0TFQrVXBCMU1sL0ZsV0pxTHZoN1kwdTBPUnRrK1lF?=
 =?utf-8?B?blAyOHErblQvYjFja0RtMU12ekRlUElQMmpzNWUvTFlIQUQvMXBRMnZqRHBL?=
 =?utf-8?B?cG1hTCtjUjRPd3hzVDE5cWFoUytmRzJab1FDeStKN1VOMU1GTlBWZE1uVFUv?=
 =?utf-8?B?T1F1S2VtYmJJYlZ1blROd3FtZ1FGYWxzK0E0UGxXTUtRRTY5TXJvcElqRkdI?=
 =?utf-8?B?UTIxK1F1NXZtbWF6cEdHRmJES2R0YWJtQXBFSFZpcEZQVEYxTlUvaTNkWFJH?=
 =?utf-8?B?MHF6VHY0SS9QRTFsREFNNjE0YitRK3RCZm5mOHdQSkVhK0h6ZlM0NmNqZEpr?=
 =?utf-8?B?WGx0S0JCNExzR2pSeitZT0xtd3cwVVozZ1NoQ0Y4SUxTN2hGT0pVVXhqbFRk?=
 =?utf-8?B?U1lqbUFUcjNiRktGZDQvc3ovRmpoamVOR2tscGIyL3JhZjVnMU5FWFZSZHF4?=
 =?utf-8?B?YnNQZzFNWWFqcEgwTnZDbXRmU2FpbDRBd1ZYQ2NhWm5CZFhWR1U0VTJKSzlR?=
 =?utf-8?B?UmxteXVuOFRTQnRNYkpUMTE5S2dIWllOK3EyaHpWRkUrc3AvWHhZelNNcmR3?=
 =?utf-8?B?SjVYSENodE12S1JadXJEOEVFcGFIanF4SWszK2hRU2l5QzVBOEgzd0hvNGh0?=
 =?utf-8?B?dE1QT3NMK05uTlBjUCtKU3FQTnJYR0NkeFBFUnF2aGppTm1lT1ozTGdaSVRO?=
 =?utf-8?B?V0VaLzV6YW1lUUhndWxEUi80VVJvWEUzSjZPWExsT0JQMUNRUmVnRTVsRTgx?=
 =?utf-8?B?b09EL2J6MFljMkFrbzRRc1E2MVFlMWpSbVZJL2RJMG9UeUhMV00rQjl1LzBL?=
 =?utf-8?B?ZWVqV3E3YXYyTlIrMCtOTTN3ZjFvR0pVa0ZIa0hpRHNESXNjUjA2MHMzZVVo?=
 =?utf-8?B?S1paUU9BbndUNVBJeDhPNFNmc3hUWG9ETEM4V1djcXcvKzQxWmVISWlmKzBC?=
 =?utf-8?B?aHNpbzJDUmN5L0VIeGp4Z2hTSDlodGFodG5JSXpvNW54bW8yUjNneDg5TUlm?=
 =?utf-8?B?VytqeTc1VzcwUnlQc0FlUFdqaEc4bWJnSi9hZVk1b2RZRUlCMlpqbitldllQ?=
 =?utf-8?B?UUJieFBoQTQ4cldRMFVndXR4K3dkbDdReW83VzRhNkI5VkR1enIrYWl0NlZl?=
 =?utf-8?B?RXdtbGduRkJscE0rRkNuMlBHT2Z4ekwydFJlWjlob1doQkJaSWN3aFNIT2F4?=
 =?utf-8?B?U3V5MUVwem1yQ2FWSllUZWg3RWVNVjV5cWJhNzNlazQ3RVErRlV2azBsbkM4?=
 =?utf-8?B?cmUwdXRMaEtuMng3Y3lQc2pqOW9laGdSWkFuUWNHOW9QTHhuUDVLMm1obFFo?=
 =?utf-8?B?d1B2SkNjZWgzbTQ5RjlObXd2UjFEUW4vd1EwMzZZQkFNSmRzVzZHQ3E2eXFp?=
 =?utf-8?B?Z0Y3MHJiZHlBVEQ1K3FJL2FtMTZkVzNiZThjcFFZZHRtR3B6d0FHV3pKU0pq?=
 =?utf-8?B?aGdid0hOeUVEcGhwNWRsYXUvdmEzRU56YUJ4RktZS3RXN2Y4RldQK2Z3MHJ1?=
 =?utf-8?B?aTNUd25wbUh0ZWxhY2w4Sk5YQzAyMFE1Tzg2cmZZTFVKOUd6UDRKUGV2UmIx?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d26a4e9-4878-4dc0-d314-08dbe5072eff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:22.0265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtzQxhYwxMnyKa/dQpnnMAPI2BhSdJOcJJn6wokCoObU0OiLgXmV4zxp5SBLSHQoSLuYihr3yGAh4gyDiRvE1OIL7W5wLosEY+f2c1UpJd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 10/20] drm/xe: Don't "peek" into GMD_ID
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
index 5b330d12d87a6..2a2143727c51d 100644
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

