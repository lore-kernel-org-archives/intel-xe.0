Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802B9C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C35C10E1B5;
	Tue, 14 Nov 2023 13:04:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE43F10E206
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967046; x=1731503046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dAo7P3D93d+UTw+OiB8sDSSqGVIO4b6NScGv62TGk5w=;
 b=eZQDJy8nCueZVKp0OmTQh2UuEN9zuIw1Feuf5afJ09z6M+hB1nVve5YZ
 S/Uq1DT1MJpzJAGMbXqv5w2GsNfWOKMXrC33p8AunkiZRHoNmJ82PBSkA
 MV/5MidmGdWSPtTZShF2ZhQzUoyxgoJBpp2NBY69st6fdOQNrSDvPpzER
 RnWFcGZumiN6XxLZugo1DcdjgXXywVOXwvhQcEnA1f8CgjtXttAWxoz8e
 vPNIDjhbnecjtOgoPMjUUuW1GzFb5g5PlmXWe45BqHaEvi3b0aZY3xDV+
 /dYKfVTcMeLhcYJnE0xJZlGyVNk964qq64pVBCHnOInmubZKA2oovjo9U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375692101"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375692101"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:04:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="882046121"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="882046121"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:04:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:04:05 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:04:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0LYST1utR4yuQUKGauFxtvwh9w7PKwcxjdWpdajHJaZJJB61n3WNjWN1uE7Yo+2s2QjcMFbvOvq+BSH6EvBgXFSKqvOFX9uS9NYcUf+bNqMjtvmBO20cDwtpMaR1xPfZp5Qak2kyfpvyB9Xrd0mtcHIlcrYIlg1prxoyiU+2cWXGKYQKa/pLPgiu+r7tYaQ6mbE0xMoHGJNKAfrsdX4UaSsnKJ9SrDOara5hF0wH4d3Ylsyi6CkCeTJDbFM924pSqvZ4PcPtItPstDUvoDRL6j1hAgbUpc5ckUO5rP/zK2A4dDsrR293p/9dN6dhpoje23rSn9hAsEd/Gheey+oSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYxr7gIz1SdsS1NhyHdv+U93XPY7gym9HhP4X+MTLJE=;
 b=TealHT9kcTIpnUMGPFVYPTKq/pDapuuR9vemkueePEQl9Bg5TYoXQqP/Bdbn7C8Tfnp77mFCiNGBAVtD9cl2xtTtmRydV+B3P3ln4O3/QKBKJ2Affv4po/zerMExd+sqhIMVA/r2mNumpS3RRQW3F9mzjqTWQYg0HVW0l8Yte3ZQMXRYyUDYeCdGZTzUkRkaIyUwxRHx8BP8o3ZV7XXjx3izKTz1FOim0bYjRP4SKNGcVUKQxbxjDe5zpMyBSjZsCxagIgWKcDjo5tzHQ475XXrcXK+5lSrxmSUcxuHUBrM3YykfN1mDistPlDMIzi/oqpuFiYRNnIUXHp0m0ZP1dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 13:04:03 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:04:03 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:24 +0100
Message-ID: <20231114130231.2299661-14-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::27) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffac7ba-cc75-4cd7-7aec-08dbe5122d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16YiQUKH99yCnwdxzQSbXYb6NKBkQ34VURxOQpHx7uGvVodEn9iy2mYVeuHHeNh6gtiOt/jXTp42PwypLkP0+i1l/EC+shlZgz8qtYMSQ2u7t2BaL8s7GmwdGppeTpUvNjBvnqQkcFjhV1Oz6YM7yhQFhMroeYr9uX0GIyGsFOkWEB4/37G7rakBgD43nP+5IiXsVqBPZ1wIX6aEULOlMlzsIeS/OBnv2/Qlw4YLm2ZDnsxcqRC6fvlVBcTiVxswyyrdtTAiSDVffWLCo/WOTEcx/JtHiQoxpu9hoB0sVWg6RroMt8aouRMEfvT4OQpC+TgDZKXv13vit6wdL16wHOr42li6gtG7KuTzX1T6cZUxEoLM6yTI9zKTEC9VboEmZulQKYgICZXCtuiv+U2gIYet84nx5A/Z6bWqiNijK+vzsWY6BE31sgmKxBxKE7iOz6ZcswMg5vWKfsfszPtZBtg1ivbYlPacSwTG/uvqA0OMcIDf/nYpPTDtvKp09K/D6sxQgB8VlCF/PfnZnvAIE1RcPGHM3yvXp2I9DHslfaWZQh8Ok8gRUBt31zimQWB7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(1076003)(82960400001)(38100700002)(83380400001)(86362001)(5660300002)(2616005)(6512007)(6506007)(478600001)(6486002)(36756003)(6666004)(66946007)(316002)(54906003)(66556008)(6916009)(66476007)(2906002)(8676002)(8936002)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHJCaWFMNU8veVFCd2dqZG9SdzViTXBkcTcvZWlqMm5FZmhmdEd4dFluamIr?=
 =?utf-8?B?UmhDQmF2OXNkY2dEbWpEcUFiem90dW5EbzZEL1h1bG9JQnJTT1BLN2ZTNEIr?=
 =?utf-8?B?R2VrcW1XY25PSFc4cTRvY1BzUjkzNzIzS1JMUUdXbEJva05UaTBCKzNHaCt0?=
 =?utf-8?B?ZlBIRDkvRnd2eWJjYlF3SmxpSjdtTjIvVXhzNGpxRlhjdEUxbm1RN1BGSm5H?=
 =?utf-8?B?YmRPdEphTjFLMVVYdEVtSnYvY1I3bDlqSlAzaGwxSEtGdFNBYjRjMWJSdFVC?=
 =?utf-8?B?M0xhTVJ3b2lCb2hVa3k5bFUyeFJCdjVpZzZLb1p3SVRaOG5QQ3NaU1IxUEls?=
 =?utf-8?B?bEk2SjVjczNuNk15V3NGcmIyK2IwT1UwVUFwVnlZZXprSVByem41bW0rQVZF?=
 =?utf-8?B?akRYRStxWGpoOEljVXR6b21SaXhsaVg4UVVnTC9SWE1xT2pOQmlTRFMvRTND?=
 =?utf-8?B?QXMwQVFTNEcvM25zNUJsb0pTVXFuaEpWVlo4cTZtZ1RVM2xrQngvSWIrVEs0?=
 =?utf-8?B?dXVGY2NLaTVzdjByR3docCtjN0xyVWVwYWduRmwrelpaY09raitLbnUzWThY?=
 =?utf-8?B?UWRSR25EeHhPdHpOSG4wQ090c3cwZ0RvTVVlaGJwSlZHeG5xMTBiaStOL3d2?=
 =?utf-8?B?bWpGczJkL2ltbDZnTUR5UG85dm52c3MzNlpoTHNVVkUyelhpZkJ5Wk9NOThN?=
 =?utf-8?B?Ri9qVzZQMmZ6clM2TTVKL3pEQUt2WXNuaVBablAyWFRLb0NPbjVZVUZiLzNH?=
 =?utf-8?B?NDhhMU9UUTdocmhXUjEzcFc4aHM4clRNclYzazY1ZTNzUjI3ZFplbTRKODhZ?=
 =?utf-8?B?cU5NQnVjL1AxazRaVkRJNFo4RjZFS2tvQ1B5UG9ySTNSM3pZdURabGQrNytn?=
 =?utf-8?B?MEpaWHQzeUkzSDJMU2JVb1daUXc3NUFVd1UrM1JJNXJUb0xsbUFTdks2NENP?=
 =?utf-8?B?bTZMa214Y3FsRy8zR0lhYjNLS1RYUXovbmg4Tk9MZVlxaFpLWVNnc0h1QnZt?=
 =?utf-8?B?SzFzbTkwWUpXSG1zS2VjZWd2eFBwVWxZTFJudUtkRmxmZ1VtNS83U1V5aHNj?=
 =?utf-8?B?NmMza2RuOEV0TGFTYzBXZTRNS3Z3eU9ZYVg1SUFMODY1YUViTTh4K3A5Rit4?=
 =?utf-8?B?cjJGa25kaDVBREJlMkxWN3ZwbGhrN2lnTVV3RENmQUR4bXo2YWIvTDJGd1R4?=
 =?utf-8?B?TDE1azNKT2hGUEJudU8zZE1zSzZhZmNDK3lRcVNlTTIyTytxajVoc2dKUVNI?=
 =?utf-8?B?elYrU0I0N09VY0t4K2ZzdGZSa2kvQUZzYVV5cC90a0xRMWhXZnJERVRjbzVO?=
 =?utf-8?B?OUJCT0tscVhNY2MrekRtTm0renBLV2J0TDJ2MFZ0emZBdU1WRWtqRzFZTUdK?=
 =?utf-8?B?TTZmc3EvdEl4YlExV3RXSjVlL2ZtOVZiUzRjaHZ0WnF3MGE1R3ZnSXNYdytV?=
 =?utf-8?B?NG9BZjZsSU5OaERZdlNBOTdnMkJaSWlxejlyWldsZ2NRUXRjQVhENVVLSHNa?=
 =?utf-8?B?NUU4U2dWVVlwNDBzZ0NIbkhBWVdQaDd6S0puS3JBSTlvOUpXZEhEbk4reU91?=
 =?utf-8?B?cEl6V1cxWDB5T1E3UTBERDd5dDNCU2d4RTQwWndCNkk2S05mWUpWWmwrZ3Bj?=
 =?utf-8?B?b1hXdlEvVTVOSkVQWUV1c21TbWxnOENwOUIxRE9Ed3kyZkdGNGJ5OTdLM1ly?=
 =?utf-8?B?MGhsVWMzUHhnM29rTjdTOE8ralc3dm84U1NXbUZwUVJPSDRCRVdodGpLS1RW?=
 =?utf-8?B?NmM1ODIxUlVYdUdBTExseTRnaEhlUktKQnY0U2hmWGRhdzNjSW9nVllNRStP?=
 =?utf-8?B?UFM5UDU5VjJzTFVXeWZ1WDVqc2ZrbHcvcmo2bmVvZGpHN2dReGVuSndoYksx?=
 =?utf-8?B?RHQxL21rbTR5RnVRcE5HS0g3cThNNEFyeWdWQzlmYVdNcjBibUF1Vm5tc3Vu?=
 =?utf-8?B?cXBQdGlwL3dpTnQ5TmdpWmp5VnBkemUybDVHaTV0eDdPQk5pSVY4dFRLNDNO?=
 =?utf-8?B?M3NlK3B6WnZTNWdqaXFUSm0rVWNQVW5EeUFVdlllR0wzVHM4a3dKbTliMGZu?=
 =?utf-8?B?am1JS2hrb3ltTnVtZmdMcEpxTkhZZzl4K29NUm0wTjVjUTNmalBuVE1ZR25x?=
 =?utf-8?B?a2k3T1YwYWtBRmpPeWRTa3BWYXk2YkViYU8wOCtLeW5iaU1kRXdHNkNaZm1k?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffac7ba-cc75-4cd7-7aec-08dbe5122d1a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:04:03.3155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqU5x/U4Nu2FH+9y6afH2mUlkVBPZ+p6WapnwuNrE39n3MqPFXe32xnJgFLKTX4Ooa6d+iOr63FbQbhBsiIKT2J2cBF6dwDKSWz6futGCr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 13/20] drm/xe: Reorder GGTT init to earlier
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GuC will need to be loaded earlier during probe. Having functional GGTT
is one of the prerequisites.
Also rename xe_ggtt_init_noalloc to xe_ggtt_init_early to match the new
call site.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  7 +++++++
 drivers/gpu/drm/xe/xe_ggtt.c   | 20 ++++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h   |  2 +-
 drivers/gpu/drm/xe/xe_tile.c   |  4 ----
 4 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index fde597fe0b513..531aca74e8eb4 100644
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
@@ -407,6 +408,12 @@ int xe_device_probe(struct xe_device *xe)
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
2.42.1

