Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD2CC4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D6110E444;
	Tue, 14 Nov 2023 11:45:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B991510E441
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962338; x=1731498338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dAo7P3D93d+UTw+OiB8sDSSqGVIO4b6NScGv62TGk5w=;
 b=NpLr2DUr++f6OX/BrPIIFgEPJz2TjxG77JssHWQEQSozyagRTcD1l/ab
 78uAJNwIeBo/Cy1ezsdbP52AR0XAZmN4O0N7eUcnGsFmWK7Ip4qzqNjOt
 nWEZ2pEhGFiw3WvQ8nRuAg+W0apOwmm7GtTfFmbakluxvaE5/znvss7U8
 VjPogBYcmCWW018mSF6ycScTRciW81+v35NfYynKzzx5RKDitxmRsetdG
 kMcNavaxgo71BY/f3LECcytsRGNaNCBpgyxnYFFdfex5izBKL9hDwaYdT
 1zMgFtP84N2fhuFHy62VHBejH3vxbrA12F1fQklHunOKaryWey36YQB3J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476849802"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="476849802"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="741070945"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="741070945"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwmtVTyt4LqToHYMzjILUQefoa8RzfDOtf5MHW9log9Fa26t0IBIQKO7VvBMo2stoty8dVg4iRU9diBZCbKIhzWc2UzuCTEE2epJeDxvRDuYHANO8WMxIveGXgC4wR+dW+V5mDoiAvb7oec304L4kkNv/X9VL8v2abYhUONQpDMyW5P7ETBK8IC1Q/O7h6LH0rmdlkjqY2p53mNH3d0Wvfv7zJmRwQohW4zakMwXoIw/s7nG+XMlzqfhY6Y0rf2yMtJfc1SWfROWRI9RTegc8LV9smNa0KuWLumeDnZLz2pvhAp5pzP6SEE/buwDEjOlpXC22ZhxxxcwOAAl1hV91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYxr7gIz1SdsS1NhyHdv+U93XPY7gym9HhP4X+MTLJE=;
 b=ClTH+l3VQvmgIpA2VSjzNPzX/mHFD+AvpYUwg6jp1UwzeDs5JMDnk6ub31L4PyIH5aXY6hIzf9jMGfEktZWpSvN/gsFMcgjAe5CfcmeS3GqAX0vByVN9YrxUQLtEG4ybOAXeVwfV2gimhkQ3iuM05V6o8vp4jFKHg+gdUL2fRWPvk3KtoggmaM/ir4zypSfPcr1wHhDoZRMhGwjk9CsE3zdL7Qu0+6ZqNNPoTkI+UxUk5KghZz0AKxKckDyDMQdQJC5gsI8UkCtICZw68Mhb+ULv1gMGeAlp+xHHk6lohC5FGlHSD1aQIaU5xAt+3N7kiktvlcaZSrMMdWM5BwCseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:45:33 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:33 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:58 +0100
Message-ID: <20231114114405.2207747-14-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 967ed013-9231-41d1-c8b4-08dbe50735ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 29unOU4A2PJ2zw433upsOkBm5oSO1ndxGymYe4dZXdfYKtQJZHCQ3o408IgG+VpHbEG2JwVDE6KQPA3NGUuYbqYn125fdzEWIb7/qekbpyHwxTqVhNkD+HPMBGaX0KeCtgDMoP1G5F+gbVBSR4QQK/tpNdImpiXjeNGk2Pk16bIcarAWEb9Yn45ci79aWBFsEuW+fGqL+OgOBmCzjPWmg405F6i/+W0mizjA5DC2dp3iXfLSWgC2B3ypjovunsida7ADBTAs0e/fZiV0xd7IXX+wrL4EabjOWCwI46D5AphIOjEyhNxnJO9ntmSKMzUe10MJPHyEcCXdmvYPMZr1XjX1ehVWJRPUpOi5YLvbCteSUuRzwXLQSFiX9WfGjJC0hBW31tQ2Pe/hS6JMdjKRCdsPFRSE34RF2rtaau8HYkWX0tkZjaVFIuVl+jpfhGH3n56zeAXFbpkLrr2cshVeXxuSNwckGDwUxSCMmpPvQbQ1qR6CEFdiuHWDj3dm19K8RnAzRCb724Bdb8NOkj2ZycWQEcq1dKLhIZMid7zn4ix231GDa9e9x6MXOElkCnYa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzdOdHc0K3gydXpubTBzUEhpT2JJbFBYSXhEYnNsSkFCb2Q5TlNvWXBHeTBH?=
 =?utf-8?B?WG10WmlYdS9hNm9LTThNVERGUDFRWFdBK0dISzBWVUsxN09pVG8zbDlPclFQ?=
 =?utf-8?B?a3VBYWdyTm9Bd016QkFkaEFpYnAxTkNNUEhjaExiV1BHbjhESVNPRGZ3WFNk?=
 =?utf-8?B?ZW4wNkI5cTQyUFRCTFQvWER2UEFuM1d3YUNJQ0loRGgxYTFHWUt3cW8vNUdo?=
 =?utf-8?B?b2dVNWFON1pxODdOeDN6RjcxcHpNb1VtWCtEVGxsd2l6bVlvR2hqWkdPK3JW?=
 =?utf-8?B?MTJyeGsrZlFwWm1jUGdkQWFKY3haeEpaOHlnV2RZNkpqNFJadWxiRGYrQjVJ?=
 =?utf-8?B?VEk1Q2tNWjJxOEw2TzJVNlE1ZndOTkFtdzNFY3dlSFNJSEo2Nmczc25tSkZE?=
 =?utf-8?B?K012czZTUEpwdXpHMlNMMVZIL2YzTFJHTUVpRHNpbE5zT2padHlMRUMwZXFQ?=
 =?utf-8?B?ODc2U0NiMFd2amEzZWhseWxMeUdNOUNINVlYSUQzOWh0UHRqeC9FT3l0cyt3?=
 =?utf-8?B?eG8xSmlzZVZWYmgzZFRHemhCK0J5ZlFGV0RyZFhhdHVYRy9IL1VGVXN4MzdV?=
 =?utf-8?B?R3ZBTWVXVUg3WXF0SzFjSjBuSi9HTktPNnl2Mm1ZM3lHeHNmbWZjZGZBVGcw?=
 =?utf-8?B?cVdCemlOZzFROE5oREo0TXV6czVxYTEzK1piNXhNSlJsYXdaZVhDalZDbmxY?=
 =?utf-8?B?VXNzbm5HOHM4SUhmSUM2alpXSGRUdDd1dFE1YUNYM3lWcHdCN2NQSW8weXZO?=
 =?utf-8?B?eFUwZjB4TlA3bDNZajFSZUprbnNkcUNUWFREVS85dlF3YmczS0JHM1pCdndY?=
 =?utf-8?B?cHVwSmlLSVF5RTNOdEpVTE13c29wNzlDeEljdlQxQmduOWhXQUVGbEltckFY?=
 =?utf-8?B?V1BQdmxnLy9ZVG4xazRrc1EwTy80K2RUdVdNaVYwamdlTGFjN21Jc1preHNH?=
 =?utf-8?B?c0luMnE0YkNyTE1JRGJwUVUzTHZHU2NJV2dGcmM2LzA3aE44K2JTTDJzTFdm?=
 =?utf-8?B?a2tHdmVBSzUxcVhFdmlpQkVGV3NDTjNCWXM5amxGK3NvcUk1cTV3aEdpTEVq?=
 =?utf-8?B?Z2g4dy9mK005SDl5bFNGS0UzNjFid2d4Y1F4ZWV3WGRKNlZvaStrRzNoOW10?=
 =?utf-8?B?dTdOSDFGZ2RlVjlHbkxpWTd1QUs5N3BlRC91dlY0bHJmSlVZaXd1MnJIdDNM?=
 =?utf-8?B?RjZ6M3ZCQjNndWVsSUthMGRreXhKUVV5UDgvaU55WUlIMTV4ckUwQjZFaE1N?=
 =?utf-8?B?eU5uQXdMU21Od2RhOEtTZUNlWmNoV3lIQzVkVVFxTmJ6QVExYVZidWExNnow?=
 =?utf-8?B?WllnNi9qT1kyRStJMUVrR0FOSm55WStUM0FrWEFMODFEM3lpZTJWQjhSYlIw?=
 =?utf-8?B?dzJpbDRESlg3L29DN1pyK3IxSnZORVozMjlnRVp2TmVaeVpyUFlVWGhwOVk5?=
 =?utf-8?B?STFKdVJBS2I5bFBtTDgwMURid1pUNVAvd1M0RE0zZ0ZxWSt4NzJqaTNyU25u?=
 =?utf-8?B?MGNkeGZQNGZ4bnY4OXA5czJ4ZHd0WkhRTzFGdmk3djQxczgweGlybHhHaGxO?=
 =?utf-8?B?TTgzWHdOektNQjFLZkQ2SlpmMmEySE1FVVNsbE0zWGhDaTVWYnhNeDcrNjl6?=
 =?utf-8?B?dGgrRGVvM0M2cXVaQTZwQTJIWE9COHJ4K0hHaUJ2MTdEQjA4dHBMZVdJQVVM?=
 =?utf-8?B?cUk5VW56T1UzVXE1UmV1VHRRRzF4bGFFV01CYWJRSFZnS3BncjhwWDdYS0tu?=
 =?utf-8?B?cjFEcm4wdmtTZ21GVk1ONjZTclJnaGU1VFg1aXp0SEZQN0xoZVpMMTFTVDF3?=
 =?utf-8?B?d3FzQVJBQ0FpLzdaMGJiMEpzTGpDOWVSOWJvZnlHeWtQaGZVb0hxOEhGeWR2?=
 =?utf-8?B?Y2xCNmFncnNpNExUaTZTQ0o1UXdqNjYxeCt4bElnT2I1R0NxZWtxUWJ2cmlB?=
 =?utf-8?B?enpxbHphK1pVRUhZOHVSMEVHeFJmUFpRZkFXMG5PaWlhSlZTS3p0SkVXNUI3?=
 =?utf-8?B?SGxxWXdqZTlqM1dzc3kzWDQrVVBaMjdsOURpdk53NFFBM0E2QTkwOVJ3SUhw?=
 =?utf-8?B?Q0k3VGdIVFhaU2ZmcGVmVTBWOWFyY3NmWEJkV3JBTzZzQkJTYUpUZmxsYVhG?=
 =?utf-8?B?YmVaUElGUTAyOElYU1hTQlNNZllzUlROWW0wek8rUUJWZWdhdlZaTHRXUEJ3?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 967ed013-9231-41d1-c8b4-08dbe50735ed
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:33.6892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyEurjimyrs8A5jREE2EXPKqN+jhuKRR5TOvdLfW+60RLgUSUpas2ZdsUXbhlB146qmG26Z1bNn6otpbOR0sZLR9uHxnD5GEy/Nwdrz90dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 13/20] drm/xe: Reorder GGTT init to earlier
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

