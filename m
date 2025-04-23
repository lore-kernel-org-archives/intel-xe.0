Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA31C369D1
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 07:51:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDA310E763;
	Thu, 24 Apr 2025 07:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3PcK7xm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A717810E763
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 07:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745481090; x=1777017090;
 h=resent-to:resent-from:resent-date:resent-message-id:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=0h+jg/DokUzLb7bH96F/Wfo+/qMF0lyBYsyjue9pB78=;
 b=X3PcK7xmRV4hjvpbQfTtxXjzH5UklvA88W3UEM6aIx1lZJtEOODsr7NX
 zTePyyGHaOjby2qbpUAVKSHF7Ixjx9DlM9IrhfA2BjqXoV0BQcnyAqRUz
 w0N+r9PIuFFgTBb/fRZUxYYaILOaZ5rQS8CV8oHSF6lDFfSDdf6RVa72G
 TFQjtQf7dDMetcMn/GqtYFSmX04PJQiSItgQn+ZjY8CLTDm4+xeknbG/G
 biyLrd0lohq5y7jlGO9q6GuxoDryB6gVfNyrPusaubU3yn74OYHPHu6ri
 MeWLBM9Vgf/SY50LQK0rwn12u8iDQK5GTQDfCTiX6fMXvqRDT8QlT3DBq w==;
X-CSE-ConnectionGUID: BarAEBcgRmy+Rbpl0/Wwtw==
X-CSE-MsgGUID: ZoN7i2h+Roi9Zx9uZPgTXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47274994"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="47274994"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:51:30 -0700
X-CSE-ConnectionGUID: crKzX1VOQkWQNhL+4xdChQ==
X-CSE-MsgGUID: nGjmfAa0SCugUYcGyC0EVw==
X-ExtLoopCount2: 2 from 10.245.246.243
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="132518796"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.243])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:51:28 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: intel-xe@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Thu, 24 Apr 2025 10:51:25 +0300
Resent-Message-ID: <87bjsmyp36.fsf@intel.com>
Received: from PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13)
 by PH7PR11MB6428.namprd11.prod.outlook.com with HTTPS;
 Wed, 23 Apr 2025 09:10:11 +0000
Received: from SJ0PR13CA0016.namprd13.prod.outlook.com (2603:10b6:a03:2c0::21)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 09:10:10 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::e5) by SJ0PR13CA0016.outlook.office365.com
 (2603:10b6:a03:2c0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Wed,
 23 Apr 2025 09:10:10 +0000
Authentication-Results: spf=fail (sender IP is 192.55.55.71)
 smtp.mailfrom=intel.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=intel.com;
Received: from edgegateway.intel.com (192.55.55.71) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.1 via Frontend Transport; Wed, 23 Apr 2025 09:10:10 +0000
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 edgegateway.intel.com (10.1.192.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 02:10:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 02:10:04 -0700
Received: from fmviesa001.fm.intel.com (10.60.135.141) by
 FMSMSX902.amr.corp.intel.com (10.18.84.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 02:10:04 -0700
X-CSE-ConnectionGUID: UBb9WF0iTV6FAspuBrr7fA==
X-CSE-MsgGUID: 7i2/slaaRieFJmhSKIvo1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="163317713"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr
 2025 02:10:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <jani.nikula@intel.com>
Subject: [PATCH 1/3] drm/i915/dpt: convert intel_dpt_common.c to struct
 intel_display
Date: Wed, 23 Apr 2025 12:09:46 +0300
Message-ID: <d5b11987e97c642a1c7ee9de93b9bd24d97d5a67.1745399318.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1745399318.git.jani.nikula@intel.com>
References: <cover.1745399318.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-OrganizationHeadersPreserved: fmsmsx902.amr.corp.intel.com
X-MS-Exchange-Organization-ExpirationStartTime: 23 Apr 2025 09:10:10.5580 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: dcdbfeed-baf1-41ab-ad49-08dd8246a648
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Exchange-Organization-AuthSource: fmsmsx902.amr.corp.intel.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-SCL: 1
X-CrossPremisesHeadersPromoted: SJ1PEPF000023D3.namprd21.prod.outlook.com
X-CrossPremisesHeadersFiltered: SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|PH8PR11MB6660:EE_|PH7PR11MB6428:EE_
X-OriginatorOrg: intel.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: dcdbfeed-baf1-41ab-ad49-08dd8246a648
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|366016|7053199007|41050700001; 
X-Forefront-Antispam-Report: CIP:192.55.55.71; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:edgegateway.intel.com; PTR:edgegateway.intel.com;
 CAT:NONE; SFS:(13230040)(82310400026)(366016)(7053199007)(41050700001);
 DIR:INT; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 09:10:10.5367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdbfeed-baf1-41ab-ad49-08dd8246a648
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=46c98d88-e344-4ed4-8496-4ed7712e255d; Ip=[192.55.55.71];
 Helo=[edgegateway.intel.com]
X-MS-Exchange-CrossTenant-AuthSource: fmsmsx902.amr.corp.intel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.4388895
X-MS-Exchange-Processed-By-BccFoldering: 15.20.8655.031
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910005)(944506478)(944626604)(920097)(425001)(930097)(140003); 
X-Microsoft-Antispam-Message-Info: Np2juFpuSWcztyj6W8AH6g97zH0UKwyH/C/adcIbqbU5QETNKfyaFCSJYsiUTnuQUh6Fd/18vbd519+anC6+vMcUCVuUUD8VpvfyoxeqFmr8RQaS5MbTcLD3JjOLyKCebvrw71GfLjsk7pGrVmvsVQEpzY5gAR82+azeufVSBZOm4W9dKRmYcio/sn+KIGrLiq4mszBENDarovBfWUoc8IZ0mOu0JNGtCpu2f1dx/ksDddSLqLxW9GS0Q1dh0uwYKS8C80di9haiBsao+JCOudMcCt2Pl+Elj7CvpaGDiSxyeg2j+4NqNjQdJhf5R0tLN5Eb/EPbqURAdfzhOU86dquXsnQ52yuAeb3GoO5C7jV4qLo1d1AFy8JoU8d+ySEAXhFFhJSivRsin2SN2zDebxiYeCI3UEEejy+nFf9EV/5OutDd74F6QDTQF4I52WPIUj19fb9L+gxDi1yUCspHNBWGOgUQA8fMrkiVaEnhaRylmlg/ahCHM+i5wKqEkoT8hvRtkdSEVaIyAYC9nwH0Pt7n/LjrOrIfUjpfQZ6Z57L9uAQ76x7qKTm3+lYKOt3c6cgcd+5KD3qhLS0somyAkvyRSw8clvvLmLzn6LxgSIq9455DaLclkn6hl+lqJPXMHaMuKTRk+NruBMvkGEUN0B92q/jxekeatoJMy7JwZDzThO1cE3JJCN2F3B0krc/ENPQWHg3ApNLCywSBN9qdarB8fnwntvotVsSoBq/F1CmIAhBk88y10k8XfvZme2sadp6366IpdSvMwsCjn9oM7kmHWp+zZkfd7T95Krsl2Em3YhPgs/cL/XWiaaqxILJzp8NesTLs/J28wQJJuVVM2g==
MIME-Version: 1.0
X-TUID: AUyYIp3HWmQr
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
Message-ID: <20250423090946.cvnakbkWUm4Za30IwkLu-YTW-wcBY0LoRr5Atpj1kwM@z>

Remove the last uses of struct drm_i915_private from intel_dpt_common.c,
and drop the dependency on i915_drv.h.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpt_common.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpt_common.c b/drivers/gpu/drm/i915/display/intel_dpt_common.c
index d2dede0a5229..ce5aa0ca0fa5 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt_common.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt_common.c
@@ -3,7 +3,6 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
@@ -12,9 +11,9 @@
 
 void intel_dpt_configure(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct intel_display *display = to_intel_display(crtc);
 
-	if (DISPLAY_VER(i915) == 14) {
+	if (DISPLAY_VER(display) == 14) {
 		enum pipe pipe = crtc->pipe;
 		enum plane_id plane_id;
 
@@ -22,15 +21,15 @@ void intel_dpt_configure(struct intel_crtc *crtc)
 			if (plane_id == PLANE_CURSOR)
 				continue;
 
-			intel_de_rmw(i915, PLANE_CHICKEN(pipe, plane_id),
+			intel_de_rmw(display, PLANE_CHICKEN(pipe, plane_id),
 				     PLANE_CHICKEN_DISABLE_DPT,
-				     i915->display.params.enable_dpt ? 0 :
+				     display->params.enable_dpt ? 0 :
 				     PLANE_CHICKEN_DISABLE_DPT);
 		}
-	} else if (DISPLAY_VER(i915) == 13) {
-		intel_de_rmw(i915, CHICKEN_MISC_2,
+	} else if (DISPLAY_VER(display) == 13) {
+		intel_de_rmw(display, CHICKEN_MISC_2,
 			     CHICKEN_MISC_DISABLE_DPT,
-			     i915->display.params.enable_dpt ? 0 :
+			     display->params.enable_dpt ? 0 :
 			     CHICKEN_MISC_DISABLE_DPT);
 	}
 }
-- 
2.39.5

