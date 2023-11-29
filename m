Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5083C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A29510E5DF;
	Wed, 29 Nov 2023 01:17:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3428810E5DD
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220640; x=1732756640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jy1mDxViyO/RwHLHORc2bF9vdzA1IGfyIhBbQxqxyaQ=;
 b=O9RvpI3sHitp/BZ5onOPM35DoYUI/k5DtY/ycD9+aV0nm7ofxOM0eD3m
 iixQaK4l49R7oXVNxKMyeJrNkxFLhm+5KzMXCi+X7985uu03u+5e6lcSz
 Hga7SDezbSGxXCEnxDIHLfB/2LZadrSY1R5zU7+Q8DxBtMVEbK7Cl2KSP
 Zfj0sBplKBNIeIihoHrSd4s+jS76LHx6CGIzIhp/pPVA0F0o0qKYJbLBl
 SjqYPVyw+12rwWt3rwzbiDfj5+TSo0YYj5Te+rOchmqRXeRxbFJO6FDgt
 ICqsC+DOFUIa0BYbltuX4RnQA+dIlwXRdqqQzZCb7/7yL6s+wITIhIVt7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436616"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436616"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272714"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272714"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:19 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wd3L1DBfMErlA3X6uO3IRs63Bg3N30tt08r4FL2j8DkgICjzt9ciVppHtmRhjJWznqmNi/gkLs+BSaduJbIR4pows/Mz0MTg7ZR0+zU7DjcP26L9yvqR09xYwLtvSe1nO41SdJixhuuHcdkOt3uNVTSqOSuXJS26AU8J3hbCk8FYMuAWEpFeluYyK9pv9kHIEPOKgL+I+I50oWr6950PQC5T90jwkUAz0cbdFuAiF7D+wFkaZjvW82z9wNCIFVsnRPFnxvgBGgddnC4FNf4iFk/fym4M5NHe+hdt7ieOrvmjc7k+wu7oRh4gAQ0fP5QYMA2yFk0+SfquIDwLRpBo6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kUES51vjr7SD8WRPfBC16XoaVGeWezpeYPhwPIu1V0=;
 b=gTU8zHxN05aIqk/NOIc+iV0xBkkXWS9xh48XIv31PDwSusJ8gAMDjaUBhljJfkUlFnslKe9530da0DvHjoC/59IVj72ZS3AjtstGZZNT1mKKX8I1oOXXHpjtLGZhh1AAH0KbBHfEiUQ9DyjOEw3IhX/uuVrm6erpqDnMDvlyIexV05kumqmx9sri2ouBPoB+Q7rkFiHuxPynDFHrQpKVaxQsadZwH+JNPk2vXYFTVuNAZu+FnGXUaydTZrz+WVgdbbStiyTtypzL3xKwQd/50JzbrOLmVKgD9Fu5Pnef8AsQUiWBcC8Rmxwe4++kMjGNWq/pcA3bxl4uAImuIRcx4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:16 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:16 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:15 +0100
Message-ID: <20231129011624.836843-14-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0054.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::43) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: c6265c4a-d01a-467c-cfa1-08dbf078ec96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: obkdZPDzS/oQTnklVoUEGKqLEb1MUy1/eM8de3/EAgqntrrLan4f+Dp83xeO39bOBrVHgnK4+TNelZPhqoetYTQa+KvJh32dbR7QmsKmHuHhpdNASz0gToMeVXFzv3ZqVAp/Qnq5kR2utVWFt/u0VyIZlNZl3slMWVsODdTllvUWY390eIio9w/O69FcWMkj3TYYIE6RpaBsrTm6a8oytruqAxXZZ0adoGRA3l8lIH1KuVwGHtrcUFjwiQ1JjVHR5pbJXJcJP4ok3HrDsycAgeHU2VyKczMe3l+yhZ+3Bg1VHckcy39BxGwRf6mRGLDIq7aCEod6OIYs/ux1EjsWC2t65aa67ULIPx9RgIBC3RJI7ORhmLM2RNbd5AoJg49hbfSqXWmCO5J8DEbPnF2nCVE/8Z7U/nose3mD3jMTouef03CuyYvPBmanIfGy1asKtT/NR9TYZSkakz+KAmfHcoP2kcqSG+Kevlt2yqp0fE9qPwQ0zaPZoJ4uN2YdgvwucHvDIe9y46qoc8bvtGzxh7Y28kjkmZVesbj7oInB+2LsnMs7Y3DOxyiqrGY+VbQ/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE5lbm41VlFsNFBUcjVMaDJMU00zUEhZYW1yRm1NQnJVUXlMOVNJWUpva0ww?=
 =?utf-8?B?YmZDZmZnYy81L3FzdlkxdEhyd29pWmdNYmNLUjhDU3o2UHJ5Z2FnU2RqYW9M?=
 =?utf-8?B?cVhqUTBPUmhEWXB2RTZXalZCZGdzMzFockRFelhFMk9UWUlpZkRHZkgzNCt4?=
 =?utf-8?B?b1M3MHVqQ3pRREhxRFp0WWkzTnNMa2EwVFZzZjhocVpQM3RQM2ZKTGdNNVcw?=
 =?utf-8?B?VmUrTUJDZyt1UGdPTERXSlR5N0lDT1FKTVBmQkZCKzFOZFprZWZhejkwejRK?=
 =?utf-8?B?ZGxFcTJuYVRueXVQQ1pBZldYMVlYWk5qMjBReUJGR2hjdmtObndsRTk3elBB?=
 =?utf-8?B?WG9SS1lSV0k4ZFAvdDcxRUFuNEJnMGpVOEVwRW9KSG9BODMvZUhNYkI4ZHVZ?=
 =?utf-8?B?N01TOCtCaUFlM3h1SDdwRDRYYW9HU1ZYR3JCOS9RRlJZNTRML0FFbzdxOW9R?=
 =?utf-8?B?WVMrdEIrRTlINkJJb21kZXlGWVM3NEh4b21tNHZIRUFPdHJMOGtxNXk4eitu?=
 =?utf-8?B?K21ZOU0vc0hiVTRsbVVCSmRTTGpja2RVQlR1cXVadmZMNFUxcDh0UEFyRGw1?=
 =?utf-8?B?WGR1dy82M1RXWkxZTERJdVBXWHFhTm1hRUpiZWFtWS9vVHRmMDRNdVFvdGN6?=
 =?utf-8?B?OEhXTk1zR1hKV0xpUjl1MjRVU0JIRkJITHVCeDlvRDJ5U1VxVjBsamRBc1o2?=
 =?utf-8?B?ZnZpS2RvOFhTMnBJTjFxRmI5ci81UWZmVWFvYzBaQjhEaUNVOWlvN2hGSmFz?=
 =?utf-8?B?TytOdWlRZGRTWXpqQmNoNklpRHAvWlUvYTNkc0xEWVl2YlV0KzBQcFRXSWF1?=
 =?utf-8?B?YnhhRnMvUUl4eFBNZ1RwcmVKczI4WXQ1RVdmV1VIN294eTI2eXY5a09qdGhN?=
 =?utf-8?B?RnlkQ3A2NHN4VEJOR3YrekxTTHN3dlYzZmcvZWRyNG5EQzFxY3JuVGNIaGNT?=
 =?utf-8?B?Um81Z3p3VGdwdDhTQ09ycVA2WC95RzVWNjE5MlBPRkN1YUwyQkowVHVVOEE3?=
 =?utf-8?B?dEhIMWx3ZTFQalJ0NHNYOWNaTkJ5cnM4eEVhbmg5OUttbGpVLzY0TnZ0akYv?=
 =?utf-8?B?K2oxc20wdHlsczZZNjhZOUdXdkJ5bE0vaW1KRmpnVDJQV3U2S1JDUUJXcjVS?=
 =?utf-8?B?Y0pqclpuMFJaTnRlQVI2VTVUcTVVZ0R4VEtwcWp2KzYweVRzdkV1akpheGtJ?=
 =?utf-8?B?WCtiQkZzOFJOTFRDbEhaU3Z2T1lLbFdYbXRIcHZoVTdrbkVaRjNHYWFIOUF4?=
 =?utf-8?B?MVZUNVFFTnY4YmFnaTNaNEhFK0VnVWNZUGQ2eEdJOGVsQXNOTnE0Zm1yNTU4?=
 =?utf-8?B?SkdSVWZzc052NTBDTzNVeWhaQ3FlNE5mdWJWVFJDbStjNUpZS3VJUXZwRE9o?=
 =?utf-8?B?ZXUrKytaOUV6aXh6RmpBL0p2SFhzaHM4ZEdvTFIyT3YvTHFnZmR0WUFEbG5i?=
 =?utf-8?B?cTRZbEJNeDdKbUpmMCt5OEMzc3ErcENFeUFpSGt3MHFoOHQvU2VPeElzejha?=
 =?utf-8?B?VURMYUlLd2M2QVh3VzRsOUVXTkdyUFJYRnVvK2piNVk3YWpMY1ZzcWtpRkxs?=
 =?utf-8?B?bSt6QWM2QWhqWTRPY1BwZFhNRjVmejgvSFdZVDZzYU9jdU5yRUx5Vmp6K3lL?=
 =?utf-8?B?RXN4Y0lFNStNOTgwSmVJL2J3dVY1OUdvVWpZc1hMT0E4djhnbTZocnVIay8v?=
 =?utf-8?B?Wko3OGpYK1RVUmY1TVhVeXFTZlkxa1I4R2tPc3M3M3FmZXEyTUVBQzJxOHY5?=
 =?utf-8?B?K1ZqVDZ2dW9Rc3BEd1czZ0lYUXozRUx4cStPbkhKQWFCdjdJNEFCMllRZWNn?=
 =?utf-8?B?dlFGNEVhL2NxclpEalc1cTBzNjF3TUJiVXRqOGVnRWt1MnBHM01xajZNdmxq?=
 =?utf-8?B?U1ozY3QwNUtnaXBKQjR2d3Y2NFBjMEM3aXpJSlQyQ3paMWdoTkVKNUVKWFp1?=
 =?utf-8?B?TVJiejk3OWl0OFZQbG1WNUdoL3RtN2x5RWVwQ09FMWRGUnlwN0Fyb08zQm93?=
 =?utf-8?B?TlpXemxwcnVaa3hqVldPeDhjL2dTaVV3Yzc0c2hzbnk5SzkyOHl6S1lFbkov?=
 =?utf-8?B?UXMxZlpma04wVXY1alhsV2lwZFpPbHBGL294M0EwNGxrMlBHRTd5azA3aG94?=
 =?utf-8?B?UWZZRWdTS0VvaWI5ejhoOUNYeWpxbHNkNGI5bTR4N3l0ZjdBdC84b29MWU5v?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6265c4a-d01a-467c-cfa1-08dbf078ec96
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:16.0103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: senNnGRCOT5BQihyueHC/VHt0rz4x1uS+tZGlSfW+Vmtpcbj6G+Z3//uAu3LZjRp8SdeCiDzPDWk48QuIVp/YmjsJbr0k4yEblC7dH9Ro8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 13/22] drm/xe: Reorder GGTT init to earlier
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

