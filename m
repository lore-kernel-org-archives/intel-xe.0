Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359D4C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055C610E682;
	Wed, 29 Nov 2023 21:47:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B23110E67C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294450; x=1732830450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jy1mDxViyO/RwHLHORc2bF9vdzA1IGfyIhBbQxqxyaQ=;
 b=Tw6gFCgNFBXgQSyIqgpw8g8dcGIunZG82L2DAruiJK0ljhuLxMj3JU1j
 Qz9SJX7tV7I0oOOXE75NcQeTRePHyeicOdVwLtzURX5VqY7CFqa3xlYZi
 wbrHAhCiD6WU155HLCk6AlNhcTrURNC8mCSSfaRe0gnKRwhF8JtNuRVaM
 dpm0xVqKizbfcvJ7nVX/tnlYrZlCcmXZ7RcsQOy0rcfptM5NoQIjY5K5z
 U1XWSbZQmNa4hlXVHSG51XZOWGShEU2qdC/ckSx/LbHR+z92xlj68YvSo
 1cAfYY9hpyDll7EiEOULe6lgWiqiJf4unBkfITsUfgPXwNrJx9TLl9pUi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="383628140"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="383628140"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:47:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="769061799"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="769061799"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:47:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:30 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:47:29 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUpdXnErUvoT5Gi7n5iZ+19pjP1u0xuFvBkWo/ng5S3ks3HOytCZLXApVezEaTj5FQsdVCa90bydMlD5QelSDjUYuCo6rApc1P7ZGqmiEAAOQaryV/harYbKhLfTuHr7PdOiLa7AI3YmMNJ6HT80wIhHkHy9b5wIOlmX1/nIJ7PgjoX6BA30j189MZlDCQwJ44UiEcrdsIw0yGUpn0UJJtTdxVvc15pY6HJ31oqXn95RY11mokG4UXELG+DrQFKm6X43ycvweqGiPt0WMOXt/xKiiOw8/N70V+kObOXu2rapZGv9u2D8Wd2/DkKgALq69Gy7gNBAeko5m8Ke9+lmSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kUES51vjr7SD8WRPfBC16XoaVGeWezpeYPhwPIu1V0=;
 b=irdk9CCyBmE1fM2na6lShRHUVuDlNBCkCGmoPy+WZlzPbz5g31anwlWGyfBdz1S7kk25aH50w1XgxCdGwjgEvJWe48m4viWqHLJw6WINwe8RJRZWXu0tGStI4/2W1MJjhQDGwlB5k8Q7yQCsqKMH6Zep7+GluJqu4dg7Hls9BWbw+MDSC5ItfYqQaXM+Uuq+tRLTNKvSmZibscFI9Z97qM/mn76TcIYBH0D+ul04Hi6TitCWEwCjQYe2Bi2dxQImryuG9GBxA0NdRQQ+mCxos1XzOUYWrZvBBU5sUc5VsRXueg/qiUDA33z+ko8A97LErhS6A02QUCJV2rm6ZAbYTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 21:47:25 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:47:25 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:45:09 +0100
Message-ID: <20231129214509.1174116-14-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA3PR11MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: b9fd31d0-58c3-4b2e-8dbf-08dbf124c631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G3oMa6i4GZDlYwO/dd0MRMI4kiUybTzP8u6BFDA6ZcEa1WrGOoxtru1iSLWZUdbY6DTklVVgIAd1iptEQw0z7akg3DvmAAaxrumq3Ab3UB3NV/qhWkGMzvJBHkf6exvoJwt6nXnAFy85y8ZhvTuhrg7Z4jbqqW8/cU8R1B7FYQBFyaOQh4MvG9/j+8CVL87oUSYRldfuGrPW6YqVppVHO4AIw5wHL7WhjmRDGIldMtZJFfbuU/PHSSItvf5HWT7bsdTVPF2ecHh5SSDYMlYa0ONITVzBa9VjeTZnq/jun89G8QduEb4TSXR39Sh5pBd2iMCKGU8Ua7XoC0vGucijZWnFR4ch8w8qbIGQOKqRcjMInmBna0GfucGubT2heIkJdCdUhSUPgrcUmWFvOr4KieL1jfGIkhS7YB1SQmZQALdLM3A9M4+5t7CZpgRQEALf1stKiwLvX5nFrwqbKs7pJwJj5LDzO06jsUKPJpKPymzjwfsR7I7T3vI83gA07B/HHQBcO/K6wSy8Shk+1xRcPi4aZtFmTqAOqLYOmxUfSuoLSw4sYPbPTG8UBBg2Jd9PFhscSTsjTGER84ZHu4Ejn7xkLfbQqeiXuMtQAIm3Y08iUAQflpvHeTXtns9prJEb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(366004)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38100700002)(41300700001)(36756003)(1076003)(86362001)(83380400001)(5660300002)(82960400001)(107886003)(26005)(2616005)(2906002)(6512007)(6506007)(6666004)(8676002)(4326008)(8936002)(478600001)(202311291699003)(6486002)(66556008)(66946007)(66476007)(316002)(54906003)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWdtYXNvYUFVS3E1TU93NkFYZjFvOERjcGdWYU1KR1BWZUMzTXFCNy9sQ1Fl?=
 =?utf-8?B?SWhWKzBaM3NSL1hwUkIwQWx5V3pQU3ZDc3Fxbm9EQ05jVGgxQ2czM3NFWFRG?=
 =?utf-8?B?OVNmOU9VNi96QW1IVHB2NlgzbDNMbW9WeFQ1aDNCM0QyZTY5U05qWW5TbHds?=
 =?utf-8?B?TFdaOGIydDZuQmJWYlpIdjh3UFlxVmdKWUZmSERPbUxsb3FhMHJOdWltaWdL?=
 =?utf-8?B?cmhTV1ZOZ1RZeGM5amVQTmxXcnQ0NzFicUxqZFJYUjJoL0VaTTI1TTRoNkE3?=
 =?utf-8?B?dTh2S3M1WEEzK3I1M1pRUlVXRDVzekhsa1JsUXlXclRVSWNtaE1LYzVTdTFw?=
 =?utf-8?B?WHJLYVNIV0RLWEJKdzVYRHl6QzhZcGJVTGppcUVNQ1Y3SnVyNWsrUk1Cd0lO?=
 =?utf-8?B?K3ZybjV0bVpWL2M2MzBMMXdFclRYNndiL3Rpc0Z5YUN3YmVkMlR1TGZ1YVBt?=
 =?utf-8?B?K3dYUThkdjdVdG1wVXpMbkx6LzNSanZoK0ljWWRiY0NBeEkxZFlWN0hNcEM3?=
 =?utf-8?B?VjlhWEVCdk03bytIRFZiUmJ0bm1hd3JHZ3VtcmZxdnVRQVJBVEdDdXdwQUU3?=
 =?utf-8?B?MFFDUERadGUzSTFOdk5NbUpxbEE3YjVGZmJhaUt1VVNubmhERDBEclRNbzZR?=
 =?utf-8?B?MTFmdWREaXJnbWltSFUzYUM2V3owVkYrTWpMWFhQVUlUdGFIYzZzZU44bjFG?=
 =?utf-8?B?WGJYYjlzeFBWbFhQQzIwU25ZeUIvZlluNzY5MHhpbGk1djZEczBJV0p5ZEtP?=
 =?utf-8?B?U2ZDVHdSV2QxYkZHM0g0M0tCOWdlRjlFa2FaMVN4VTI1MkVwNjRwYXFIUkE3?=
 =?utf-8?B?dWFSbVptYWFtUHFxa28ycER3V2szd1FsUWFMV0FNbTV5OHhmNm1YVDZWVlMw?=
 =?utf-8?B?dEpXaFBIeloyOFVxbTNteUhreW1ieHBPbWg5SzAwbk1ja0lRaUlyTkF4VmtX?=
 =?utf-8?B?emk2c2VYc1ZpWFZ2eUZlMVBFcWNLMTRMV0ZEdjRoL1kvWS9aNGk1KzBDQ2I0?=
 =?utf-8?B?TUVNSHBUYzVxWGIveGpvZFpTWjcwWDB4S0psblBQUXF2U3JxVFpVNnV4Mkgr?=
 =?utf-8?B?UmpxUUk0TkpPTENyVC9ESEF4eHA1ejJCWmZBSHlXZmg5elJyVWVQbE5LSkF1?=
 =?utf-8?B?czJOZlZkTmxDL0lqSDNtOTlDNEpNZThWZytYWUQ3eE5TcGZMS3JwVVEzRzRZ?=
 =?utf-8?B?SVZDRUU4aVJwL0R6SmE2VTAvSWV0MU41TnJONFJUMXJYU0k5L0YyczNPSURZ?=
 =?utf-8?B?UTZaUFhHWWxWVzE4bldYeHpSb2VSb2dNTi9KcHpHaGhsb3BUUEVuTHA3Q2JW?=
 =?utf-8?B?Z1ZJZmx0OU5zRFV6M2VYZkQrYnhieFgrL1Bkc3paelVmVUxvVXZ6eUJSMTV2?=
 =?utf-8?B?dHk3eGJwTHRYRlEzRjBGVTRvczJ6RzNTSU1DTncvOGF6TUNHYm5ZdGdHRGk1?=
 =?utf-8?B?NGp5bGNIUG5QMnlWZFdyaGZrQzR3UXRsZ05TSC9FeVZMeVNEc0F5bXMzYVlX?=
 =?utf-8?B?WVEycTRTUjZEZU82WXlUQjc3RVhQMXE4Mm1RWUdIaElicVJ1Qm9XNEVkUVZn?=
 =?utf-8?B?QiszT1oyRFNteEI3UlJMYkZZaWJPZVhMbXY5QjFHa1oxeXQ1SkF2bnp0a0hB?=
 =?utf-8?B?TjgrUi9iUUJub3RHdHlhUUFtakZZOWxCdE1uQXJqUVpEM0hlLzdPUFowb0Jv?=
 =?utf-8?B?MjBkSmpmeGVZWXpsRUdIdWViaWgwZ3ppRXBmSGRpVHJEbTFjOENJb1YwY210?=
 =?utf-8?B?MHVxUlVublhRN3huckZJbjYwcFFHVk9abVZtM0ZRYzAxamtjUkw2cVhUOGlK?=
 =?utf-8?B?Uy9TM1RVWGVjS0twS3BPWDBsZkdwSXpLaEVCRi80a0F1UWM5UFdQcFhWZG1L?=
 =?utf-8?B?MjJsNFRNcUVlQ2tQVlRnbjVaSkF6NE1UUzBucmdOTzlKc2ZPOEhDbGVRTUNC?=
 =?utf-8?B?RzFwZ0srOXM4SFR0NGwzSVMrWEl0VXcyeGNuUTFVS21COFp0bFg1TU52Qk5a?=
 =?utf-8?B?QkhTYXppRG1LdWE1NG56bUhtU1d6K2o4RzRkNWxDOVl2VkY4cWRHSXZuOEkw?=
 =?utf-8?B?STJVM2ZHd1lkQk9JSTdlQ0JaajRmdkFJWS9mbnA5bXFxRFBGZU43L3ZUU1hs?=
 =?utf-8?B?SnRBOHdnT3BKQkhKdnNYQWhJekxCQmEwWldOcnQ2Z2c3NzR2Tnd4MEY0OExx?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fd31d0-58c3-4b2e-8dbf-08dbf124c631
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:47:25.0651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YoM1XW53p4Wfd1af+Hl0HGmME71f7Jd12eEWiTmMubKtCDh9+NEuoJolgssUN8Fjv02ezhBXzeHxatPclph2gW0ZzmVq17gef9wkbFGoD+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 14/14] drm/xe: Reorder GGTT init to earlier point in
 probe
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

