Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445CBC10DC3
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040C610E6A5;
	Wed, 29 Nov 2023 22:36:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F52B10E6A3
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297374; x=1732833374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jy1mDxViyO/RwHLHORc2bF9vdzA1IGfyIhBbQxqxyaQ=;
 b=OaDCs48b6HQZs9rOXbp91Luil7CFKw629jYyde2oThOx/pFlh0C94G9k
 ID2y14PyDvcXI6qxiNeUGMJ3Y7MJkRUj4RTw64aiSqHAkwO97/rtJpr/T
 DkPWO8QKTHbU66Y6kwWDgWdGJRrma+syFFz6eFBtZor8C3yctM8QOitN6
 ywqU2kYmGNNRh0XFixBgFNq7twZ0vDoqQV8Y+t4+GZZsnvRHpWNUW/2nA
 nRMCjDeP4B8sSPb4gtaAFH9la8HF0Y6OGF0txXbnqAn9pPHfruw/hGqHU
 oxpIl7i8CH++EqSMvX96xi90Mis6LuSs9QrjkyQ4ENiEpNrvlyr5zI8Pw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="219764"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="219764"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745418194"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745418194"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:13 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RM2YeMD9G1AZhrbR720bOxYOh8Uqbt7PcT5vFaKhCqIn3hMX0jeNS+D+r5vy3V9LBQ0qszbIk7z4hTpQVSzylP7Z4TE4zn2VMx5ynWN7V2kPc75M22Emx2ycc0R6WE9gzCx0DUb1WcjvgwZ6W/Rdr2CK+6gFNoLHKrzqfXmoQEW1k04QaMz+fQcRM1H4xXM0eK5mbANdRSbRM68WXwAPbhjmY/Xb2kOWYWv3/KZIBq7WkyXI75Wv/ArE3ANBD6m7O5ofinDrVjEdHHxcDDHcLHyb4FNMVjG75ule1P85Je4HsaRCdmwViG2pG5SJEufTl8FtEPscesg7UkUn/TRHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kUES51vjr7SD8WRPfBC16XoaVGeWezpeYPhwPIu1V0=;
 b=PmNbzPArFX3GjqBP2CwjT2LwpHFAzkMWBH+TLiH32jYzJ9jcvam81fUcF7O2oDGOjY5CzurPB28BnWXpX7sQ/cZg7WM9DM3IHX7mrd0E3dUdXRFdWmmtpRa89yI78Y9vwhF3jUBKFdKu4gtpyF9KwhBTvKDi7xxYDgcEIC/pmNDz49rQYpxaOyl5WrEvBgqUQTHt7oRgWFlRndt2jUf0qlwNWJ+C9lx8ddrD70LzAYZZDrfBdvgEiMOSVqLw7YRuy4oZgOKJyruwA060HjP3CgPZvZjcniotJILkUYUdUcmexs1EtNp+rJKD+o1lSnLHdptrPgasyWQhqS1/zIMKeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 22:36:10 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:10 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:58 +0100
Message-ID: <20231129223508.1189461-14-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 24508824-76af-4ef4-fad0-08dbf12b959d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AVfonljTannD/0pZ3cnG3gORgg5z7ZnQ8LDj/pvWMySdFGdpOXcCPxwmnBbPTlya3W4zalczRMo2qk67hZGF+w2BIRxZf4q3SHtbAjjdxpvKpshQyjMjBxjfBiICnZe8zjEOhnilS12yEHCrQlJyw/Cq4BluR2Yhbla1ikwAR9C+Qx/Pe30hRxNnzLzY0SyqnbDvPDsZnHqdtUocVT3DLv7rXb65MLiNp5tYSoMMsyQCcPlti4/AluabbUrobsHM1UtE5Iap31g6ejUM5YDQMG//4dM499sIQBZr8tTGFRLl4eTgZtgAdqg0yg9V0x8sSqNVabNzdTFlKQDqeAwLl2UJxnsac/jDKm2KoLu+BpO+kVzxWm3hUaYENaBf3Iw5X/EqP1A7cRJd9vteUnl+M66b5x5oOKRRF7h+HE7aY6XX11+2t0vDcHH7iz7PJfevQSFoZ4kg4FiKTtf0zui2dxrioSq62BNAPxDwFITyG6zxUqzax4jj6fSx8CWsqyNg3KioKXtLm9qhb1r3Dhn9e76BF6XGEShbAb6EyBCX6ZRP7oo4EZjChKiwgjLCBpBQVdn0uE6jpOhKv+SlmS/XahCbwjrhTLt1da6gPLn1xr4ryW2+wy80vqTn2Clloao7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(26005)(2616005)(1076003)(66556008)(54906003)(66946007)(316002)(6916009)(2906002)(5660300002)(4326008)(8676002)(8936002)(86362001)(66476007)(6506007)(41300700001)(36756003)(6666004)(6512007)(478600001)(6486002)(82960400001)(38100700002)(202311291699003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TERBaDhHQjhEblZOdDRXS1hNYnAyUkhZS3BtS0Z5SkxuWTBhZ2pHVDk0VWta?=
 =?utf-8?B?R0cvdkx0VUZaei9oWFJVWlpsK0Yzbi9kT3dHZHpZMEk0bVhWVzArTVlpaGQr?=
 =?utf-8?B?Wm9qMFh1L0x3SFk5ZTI3WW5TVmVvMU56b3JUNnozYWJPcFdIWkJvM2xraERO?=
 =?utf-8?B?YjNvSDIrZ1hZelo0SlVpRWtuclpxYkFuUXdhUnVzbGtrTkh6OXJvTndrdXRO?=
 =?utf-8?B?OTV2ajd1cjZrQkRGSGZwZWRMaDRuSU16NU15K2NTc0xGOHZlQVcwOElkdEo2?=
 =?utf-8?B?d2ZpenVkUHlzMEdER1NiNjRib3FIbTVEMnBMTjRuSmRFQ0lKRmcvZ294Rm9a?=
 =?utf-8?B?cGU2cXA4UXNJUnFiTzhrRzhkNlluL25sdnFZSXQrSzRtVUUzQUF4Rm1KaWNN?=
 =?utf-8?B?eTlIcmlWaXhHWE1PQ3dyTkJCRUtuUUxCSFdaVDhZYzF1a250Szc5YmJXK21U?=
 =?utf-8?B?ZnZnVWhaOFRnRVVLcWM4RnNnRFhuQlg3RUdLTFgxcWF3MHB1clJNaEVxVjJR?=
 =?utf-8?B?UTljUWtrRlNxNGhQbnY3UVZKNnk0bEVoZU1QaTA0clNldWIwbVk4QkM0ZGts?=
 =?utf-8?B?bngyd3FiNjViM3hxZkFxTktHNmZKOTRDSVVxYlAzZXBjV2FONW1jaFBleTlS?=
 =?utf-8?B?ZC9ycFlvbnAzS1hRaiswQ2VVQXJoUVFOOGU5blZuN3E1YWpPQnhvQ1F4SENE?=
 =?utf-8?B?RDluRGVIRS9kVVhjTGgvVVhHamk4T0REVGFDL2pVMlpUNk9JNklDV2txRnVD?=
 =?utf-8?B?cnczOFNsa0hlT0l2MnZ3MG5yUkRsR081THEzK2VRVzVsdlU5R0J2M0ZVdzFv?=
 =?utf-8?B?VE0zKzVTdUFydDR1bDJBOE0xcEw1S2hyS3pvaTdwV0dMQUpPRXl5c0U5Tko3?=
 =?utf-8?B?NXE5Z3Q3VEpuSWdlVmdTbkhtVThxc3pzTFYvZFJja1hIWEFHMU9kbE5DZUV3?=
 =?utf-8?B?SEgvUnlON0RHUkpqUWNJY3ZuS3ExTUsyS2pzcFBKOHV0K2VCVEVMMFhtZXIz?=
 =?utf-8?B?dENEcFNhRjhFczdmemRpR0p1bUR3akx2NEl3VHBLdEhTT1QrOEwxUWRmWjF1?=
 =?utf-8?B?c09ycmNGYkhRb2tKa2lxb2hOUHN1am9KUTlnY1NjZ1kwME54NzNRenE1blZx?=
 =?utf-8?B?MnlUZWtpNlZEQjViVGJ4RW9JMExheGZTSHpSQ01qdU9WQlFFbng2cVpNZ3Jv?=
 =?utf-8?B?Q1hnYzBFN2lsUmVSREhBc2E5bXYvaU9NU3lyY3pZSnI5VGt0UmJLblZUb0J0?=
 =?utf-8?B?STJ6NjVvVm9hT1NVWlF0VHlST1NrRmVuVC8yUnpGa282UC85U20zZ3p5U2F0?=
 =?utf-8?B?NDc5UDduMDBYMXVuazRDUWxrc1NLZGVLenVQR2JsVjRhOU5ya01NUU9ERHd3?=
 =?utf-8?B?RTM3Q2FhSWtZVndvS1RMbHMxTjFCMDVEUXBuNWtZTjFFZE8wZm9kY2J1a3Va?=
 =?utf-8?B?aWNhNHRRSmU0cjl2elZWMGVTdzk0M2htODhnUHhuQ2RoNVBNdHVrU2N1dGJ5?=
 =?utf-8?B?L0dSQ0U1UnRhWVVFTmEyUkJjVEk3d0J1cmZkSWlpaUVvTWFkZWJKRHBVV3M3?=
 =?utf-8?B?aXVoSmRUeklXQkYvWjNveG56YkxxTzdLWUpyTjlMQnN0RGFHYXZsamdVbWFM?=
 =?utf-8?B?YloyQllweWdpTGtVc2F0SXY5eXA3UkhjZVBJVkhYS3JkSEw0cjVoWWlIV0JK?=
 =?utf-8?B?WG44b3JyMklVNVBUZ3RITHFURHg0TENSbXVKdHJPdzNUdTlPcFNJRkcrdmZQ?=
 =?utf-8?B?Z3BOZzlrdFFidTNxd056dXNSS01oVFhSTEtjOXBpZ1llQUI4czhDSU5qVEFr?=
 =?utf-8?B?ck50MGFOOXpYRWFaWGh5VVQ5RUliYlIxUEZYNDN6LzJWQUxtdTQ1L0E2UXpn?=
 =?utf-8?B?SG1obFVpR3VyN21LWDdkelNqWVp4N2k1WDBtNS90eWl3MGdBaXVKZFY2WjhE?=
 =?utf-8?B?TWRZblArbVcyYURCbVJ6TW9VV3BDZ0k3QytJbEZocHdXYm9yRGhLam0xeUlr?=
 =?utf-8?B?V2UyUkFpcFNMZnZzdnpodTZqVWkxT1VqTXM5bDRsMWNXelJrckRuVWJTeGdt?=
 =?utf-8?B?RFh5UGVSVDNJaVpCQkpDdmwraXFNZmZiZ2hVN2gyNzlrTFNDOU9haG4zMGtn?=
 =?utf-8?B?OUJnY0RQeklIbFRUdERkdkpWZ3p4M3RWUjZmMG5IRXZINXR1Zlhic29zN1dC?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24508824-76af-4ef4-fad0-08dbf12b959d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:10.0163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMpoKOldNW7pk4xYcRCjtv2fWirkwt7bL1IAxWdf103BFnNxi/j0lqzT3ZKqnAoJwhU4c3gpSkaUr2q3rvcWU5OiP17qyoEdEx5NyYK+m2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 13/23] drm/xe: Reorder GGTT init to earlier
 point in probe
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GuC will need to be loaded earlier during probe. Having functional GGTT
is one of the prerequisites.
Also rename xe_ggtt_init_noalloc to xe_ggtt_init_early to match the new
call site.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  7 +++++++
 drivers/gpu/drm/xe/xe_ggtt.c   | 20 ++++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h   |  2 +-
 drivers/gpu/drm/xe/xe_tile.c   |  4 ----
 4 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bcc10b7f23ab7..65e9aa5e6c31e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -24,6 +24,7 @@
 #include "xe_drv.h"
 #include "xe_exec_queue.h"
 #include "xe_exec.h"
+#include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_irq.h"
 #include "xe_mmio.h"
@@ -418,6 +419,12 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_force_wake_init_gt(gt, gt_to_fw(gt));
 
+	for_each_tile(tile, xe, id) {
+		err = xe_ggtt_init_early(tile->mem.ggtt);
+		if (err)
+			return err;
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0e2a41837f169..fab3cc04882da 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -96,14 +96,20 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 	}
 }
 
-static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
+static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
 	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
+}
+
+static void ggtt_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_ggtt *ggtt = arg;
 
 	xe_bo_unpin_map_no_vm(ggtt->scratch);
+	ggtt->scratch = NULL;
 }
 
 static void primelockdep(struct xe_ggtt *ggtt)
@@ -124,7 +130,12 @@ static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
 	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
 };
 
-int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
+/*
+ * Early GGTT initialization, which allows to create new mappings usable by the GuC.
+ * Mappings are not usable by the HW engines, as it doesn't have scratch / initial clear done to it
+ * yet. That will happen in the regular, non-early GGTT init.
+ */
+int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -178,7 +189,7 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
 	mutex_init(&ggtt->lock);
 	primelockdep(ggtt);
 
-	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_noalloc, ggtt);
+	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 }
 
 static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
@@ -226,7 +237,8 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 	xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0, ggtt->scratch->size);
 
 	xe_ggtt_initial_clear(ggtt);
-	return 0;
+
+	return drmm_add_action_or_reset(&xe->drm, ggtt_fini, ggtt);
 err:
 	ggtt->scratch = NULL;
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 3faa3c6d0375f..a09c166dff701 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -12,7 +12,7 @@ struct drm_printer;
 
 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
 void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
-int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt);
+int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index daf1ac39dcbb1..731869e49b016 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -166,10 +166,6 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	if (err)
 		goto err_mem_access;
 
-	err = xe_ggtt_init_noalloc(tile->mem.ggtt);
-	if (err)
-		goto err_mem_access;
-
 	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
 	if (IS_ERR(tile->mem.kernel_bb_pool))
 		err = PTR_ERR(tile->mem.kernel_bb_pool);
-- 
2.43.0

