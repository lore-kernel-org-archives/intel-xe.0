Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A4FC369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 07:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB06010E765;
	Thu, 24 Apr 2025 07:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLmqKo24";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0D810E765
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 07:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745481105; x=1777017105;
 h=resent-to:resent-from:resent-date:resent-message-id:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=FeA6rLz2sSPWSi0F9Xn82U+zVB7OnZ4fe/pNo8JsGik=;
 b=LLmqKo24uNtD4s9vLqhbVmALKS2CRtB4g6GWKKQgYPMn4hWh+vAv75W8
 Dedp8Ij1UPX4ky0r7BeDJvOZPm9ofNGaWxkZHTv3URxv4VM+foJa0ekbs
 t+LQ3NpGc+ZaRdrGZL+Xg0LXqNKwW02973nozT2fvRrPokhY9D3VU//OG
 +b5Yk+m9ukIJATxXn7HjPqW9ebv3pGOt0pzIiBKF0UaIj7/neaK8HbYBO
 Nb2sTKqyTdQ7kzh2qzwx6F4eGBiH0mChI1PZvhoRGCXNgojoQfYI+dOes
 fPmw+GWZQzVo1SPwk34O9EPAvvMoh87MF/ZFHJ/9xRAvhj6zx5ielifPO Q==;
X-CSE-ConnectionGUID: uefpvVaMRqi34VDPzxRbUg==
X-CSE-MsgGUID: KQieQf1tQKGlE0P27DW23Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47275023"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="47275023"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:51:44 -0700
X-CSE-ConnectionGUID: rsCMFYTKR0mK8BxwuwpOXA==
X-CSE-MsgGUID: 9zbt2EbpR5uoeJtNN3cZgA==
X-ExtLoopCount2: 2 from 10.245.246.243
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="132518879"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.243])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:51:43 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: intel-xe@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Thu, 24 Apr 2025 10:51:40 +0300
Resent-Message-ID: <8734dyyp2r.fsf@intel.com>
Received: from IA1PR11MB7725.namprd11.prod.outlook.com (2603:10b6:208:3fd::13)
 by PH7PR11MB6428.namprd11.prod.outlook.com with HTTPS;
 Wed, 23 Apr 2025 09:10:29 +0000
Received: from BY3PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:254::35)
 by IA1PR11MB7725.namprd11.prod.outlook.com (2603:10b6:208:3fd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 09:10:26 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:254:cafe::45) by BY3PR05CA0030.outlook.office365.com
 (2603:10b6:a03:254::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.13 via Frontend Transport; Wed,
 23 Apr 2025 09:10:25 +0000
Authentication-Results: spf=fail (sender IP is 192.55.55.71)
 smtp.mailfrom=intel.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=intel.com;
Received: from edgegateway.intel.com (192.55.55.71) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.1 via Frontend Transport; Wed, 23 Apr 2025 09:10:25 +0000
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 edgegateway.intel.com (10.1.192.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 02:10:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 02:10:15 -0700
Received: from fmviesa001.fm.intel.com (10.60.135.141) by
 FMSMSX902.amr.corp.intel.com (10.18.84.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 02:10:15 -0700
X-CSE-ConnectionGUID: YWh6KauFT8265ioJM9l56g==
X-CSE-MsgGUID: tW+rEW1eQP+4E6s214gRxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="163317723"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr
 2025 02:10:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <jani.nikula@intel.com>
Subject: [PATCH 3/3] drm/i915/de: drop drm_i915_private compat wrappers from
 intel_de_*()
Date: Wed, 23 Apr 2025 12:09:48 +0300
Message-ID: <c8dc8fdd8815b9e0ef233b4aa6f071cd84c2a867.1745399318.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1745399318.git.jani.nikula@intel.com>
References: <cover.1745399318.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-OrganizationHeadersPreserved: fmsmsx903.amr.corp.intel.com
X-MS-Exchange-Organization-ExpirationStartTime: 23 Apr 2025 09:10:25.4702 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 13326719-3224-49ab-1641-08dd8246af2c
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Exchange-Organization-AuthSource: fmsmsx902.amr.corp.intel.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-SCL: 1
X-CrossPremisesHeadersPromoted: SJ1PEPF000023D7.namprd21.prod.outlook.com
X-CrossPremisesHeadersFiltered: SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|IA1PR11MB7725:EE_|PH7PR11MB6428:EE_
X-OriginatorOrg: intel.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 13326719-3224-49ab-1641-08dd8246af2c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|82310400026|7053199007|41050700001; 
X-Forefront-Antispam-Report: CIP:192.55.55.71; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:edgegateway.intel.com; PTR:edgegateway.intel.com;
 CAT:NONE; SFS:(13230040)(366016)(82310400026)(7053199007)(41050700001);
 DIR:INT; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 09:10:25.4494 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13326719-3224-49ab-1641-08dd8246af2c
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=46c98d88-e344-4ed4-8496-4ed7712e255d; Ip=[192.55.55.71];
 Helo=[edgegateway.intel.com]
X-MS-Exchange-CrossTenant-AuthSource: fmsmsx902.amr.corp.intel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7725
X-MS-Exchange-Transport-EndToEndLatency: 00:00:03.6827753
X-MS-Exchange-Processed-By-BccFoldering: 15.20.8655.031
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910005)(944506478)(944626604)(920097)(425001)(930097)(140003); 
X-Microsoft-Antispam-Message-Info: Nwx5TVY8r7FVRgsZXpRY+vGJIcKadfbUSpcMfT42A3HF3ySpx9AE+tdLgdwitO8OeaojAE6kDefsjaAcJkEm+dRpfI/eVDIzC+Xwwm6Mfxa0cMvYzsoy3JusWU2xsP27kTB7WtHNHGABw+1v+i4gFs1hnPcTeL/pP4tHNKg0OhKo4zlQYLpzQK8fWV8qU9BwNoIw/N9nqWqfHZY9VonGl1s5AAGP1yRIn02tFig+Ey45FfpgaA86TlJloPEJEXNfF8WwoO6EbF6dDGpztTJ1nFRQWlhZz+XCAsP2LirbW2q/Pv0CwDF+koEaQbTavOBQgZLglURlCC2PfnbB82ySboZI6tyT1WuGoVnb+b3Hh8SVEbR95VWSJ01/Uakka64uvLMVF98wFAiCmAQfBAwkleAQoVMNWPcfX3ArivpO9Zdt+ZUFXb8SQ5TXRtv3WIzfOxAwnAGOzPfe+uGcA36gvWDT2WVgAURQV0w93Mqhf0IN9ZSpceLI/ie+7amD3oNUXniFQGuNk7nX7ZdtX5Pnz1RR6cd8xRqk46WyUpSQZ1tN05sMtl/Ggv1NT1yFMUwFp65r2MP3fLN1UveZuJyXivAYe5Y7VBYf0MYWdtTlC1LgW+TFzwQxoZE0aFu6cx/y5fQHuLIRGY1URBQcbJwmDV8dg+5WtWIec5jxz7B4rhsl0VkneggYwnekpc4zp9nkjFuo/Mc2ZjPQHOcZP52a79e4jQ25u2OEUppltYHlIjgUA61RQntEe6Ya/VQPlu1TPcZJPWDWr2DU2FmTXESp9EY8AQD167aT3wJAKnKfkjLjSDMdLuvSyARutubGgQYj01JPv5163es6dGNRdGmIRw==
MIME-Version: 1.0
X-TUID: BII2+ve/BK8r
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
Message-ID: <20250423090948.hcmxFhr6PwtShcFEqwdZgr-pttHCLbTWzsA2wE21KMM@z>

All the users of intel_de_*() functions now pass in struct
intel_display, and we can remove the __to_intel_display() _Generic()
compat wrappers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 655467a6ba87..54ce3e4f8fd9 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -6,7 +6,6 @@
 #ifndef __INTEL_DE_H__
 #define __INTEL_DE_H__
 
-#include "intel_display_conversion.h"
 #include "intel_display_core.h"
 #include "intel_dmc_wl.h"
 #include "intel_dsb.h"
@@ -19,7 +18,7 @@ static inline struct intel_uncore *__to_uncore(struct intel_display *display)
 }
 
 static inline u32
-__intel_de_read(struct intel_display *display, i915_reg_t reg)
+intel_de_read(struct intel_display *display, i915_reg_t reg)
 {
 	u32 val;
 
@@ -31,7 +30,6 @@ __intel_de_read(struct intel_display *display, i915_reg_t reg)
 
 	return val;
 }
-#define intel_de_read(p,...) __intel_de_read(__to_intel_display(p), __VA_ARGS__)
 
 static inline u8
 intel_de_read8(struct intel_display *display, i915_reg_t reg)
@@ -66,7 +64,7 @@ intel_de_read64_2x32(struct intel_display *display,
 }
 
 static inline void
-__intel_de_posting_read(struct intel_display *display, i915_reg_t reg)
+intel_de_posting_read(struct intel_display *display, i915_reg_t reg)
 {
 	intel_dmc_wl_get(display, reg);
 
@@ -74,10 +72,9 @@ __intel_de_posting_read(struct intel_display *display, i915_reg_t reg)
 
 	intel_dmc_wl_put(display, reg);
 }
-#define intel_de_posting_read(p,...) __intel_de_posting_read(__to_intel_display(p), __VA_ARGS__)
 
 static inline void
-__intel_de_write(struct intel_display *display, i915_reg_t reg, u32 val)
+intel_de_write(struct intel_display *display, i915_reg_t reg, u32 val)
 {
 	intel_dmc_wl_get(display, reg);
 
@@ -85,7 +82,6 @@ __intel_de_write(struct intel_display *display, i915_reg_t reg, u32 val)
 
 	intel_dmc_wl_put(display, reg);
 }
-#define intel_de_write(p,...) __intel_de_write(__to_intel_display(p), __VA_ARGS__)
 
 static inline u32
 __intel_de_rmw_nowl(struct intel_display *display, i915_reg_t reg,
@@ -95,8 +91,7 @@ __intel_de_rmw_nowl(struct intel_display *display, i915_reg_t reg,
 }
 
 static inline u32
-__intel_de_rmw(struct intel_display *display, i915_reg_t reg, u32 clear,
-	       u32 set)
+intel_de_rmw(struct intel_display *display, i915_reg_t reg, u32 clear, u32 set)
 {
 	u32 val;
 
@@ -108,7 +103,6 @@ __intel_de_rmw(struct intel_display *display, i915_reg_t reg, u32 clear,
 
 	return val;
 }
-#define intel_de_rmw(p,...) __intel_de_rmw(__to_intel_display(p), __VA_ARGS__)
 
 static inline int
 __intel_de_wait_for_register_nowl(struct intel_display *display,
-- 
2.39.5

