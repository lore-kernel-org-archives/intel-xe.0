Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B15C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 18:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75CF10E53C;
	Tue, 27 Feb 2024 18:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBQIv02m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5800C10E7EC
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 18:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709059054; x=1740595054;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=sP+OPcpJhFV5T9HTqjnAokdS20BA6KbwEkvVaglpOFI=;
 b=aBQIv02mFsTFWFG/8xJ+gmjjXHTXcB9/zztOQYXBpctctlmFJQcuOLnZ
 a/gHW9VJCZfvWJobBvQ+PR/eZA/69EXgzopCwKyUUoiMdwdLatYLCz0rD
 FFg77KHs2pDO9fioVARGqbcuzu3k44qEbo9nPv0RBjYC/QwYAxEkNietc
 86BD5tZaUTVuEtI0Sj2USC5P3wEl0Ql7mCq035cA4WiUExFVIcf+C2pHM
 Y9ys51d0nPPQnR9MDvqtUCh0rHBULjNSexbAukuNqPKkIg6BMpNlWGT1z
 C+fq8H5sW8jqC5S+wdWHFR6tIUOZjH0VJRRGhZ38ZWI92u8FKL+uP8bS0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3583006"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3583006"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 10:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7281829"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 10:37:33 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 10:37:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 10:37:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 10:37:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHGjBFLn2LtJ/UeSKzricPDey6oQQoajwbZ6ZiV4TmMtioiqFDnRWaPEQc78v4G6HFQZSUsTngJ83wuGRhK4776JRpW3WN1J/EMUldVZzD1E3YsPVjYWft/omgjM/7i+UCcp/5hIUamzq1x9STWqpRP76hyrnTkMha4UJcH6fYRyQgABU10AhymTRKAVRhggPlm0frL0vBK8QjydP+KRtWQW1cjOqA9Udg/Thn6ByBjtSChWgqmNXNTZiZLlrwsMtqljA/7TBPmmSdYb23V88wYTxajWF4dDSLCgO964SYIi1PC1AWpY4ZCLA/7BSFA2mo+BR7dLquKDNJjDQbUdgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llFuxSqmcY03xM/SOYZQQ1Zvz6T4kKMgovZ6+6Wi6lw=;
 b=Zwx7u5QTIPdbmDBkvwrR1QkDDmHjLCi9GO+XgE3nPykrl2VRy6k5OFSMuLmiDwKsJ+1ChOXhPv66FDcfkTJqp2mun/2GVEzfLNjanoFVVbuf4B1z4yxp7LbLTLPc1TN1kPxSXPLOBngIxXHe86MLE29zwDKxTCQu/UZEGGSjED6eHE6xY8ujpbnObSCIaD2o2KSi2lsOathoOnns8RnzqKYQ138B7nYg9aG+Pw0V10cvJ2heSXXstf7WPejQ3h3YhAsubnRbz/dRjb8v0G2kd7QyIYAr9jzgMF0aFzEtaro585Sd0sxg9rLxyFew27tYWQRVjdNCvsU+tvYB6iT2vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Tue, 27 Feb
 2024 18:37:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 18:37:29 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/3] drm/xe: Fix display runtime_pm handling
Date: Tue, 27 Feb 2024 13:37:23 -0500
Message-ID: <20240227183725.505699-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: a059677f-c1a7-4e00-7c45-08dc37c326fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FjFIBwqSC2w66iL47okYQkwbDUT3GGkx7hAd2Fn+aO8jDqmuLC4WEG1NXKixnd2YzkvclzcZQYdkT35QqnuSNYH9N1AOUQS0Qqwg4LYUu0yZmddPuWcmVrcRf4+Fe0ZycnyrA75b4uyouphOQMokNKkehO4HeoRKtfuXdChWxBBtsoKxkH93wH6Ma90QDot5g7wy5AkOIjoO9yNybnNjNkyVgjKUKrUy8tzoEO2zf49QxtZCtb8DND/g4SghO6ZbGC9IwrNQpuOUuqZ6Ki4b36ZO4nJrsJZt5yFc+I/QXJTmI8W/Z0dq0zwsWu6fsfIf5k0dZetNEXlGXAbtcG2DH/9NKqla/VWDdm6v9ttQ6SHoxSI1KPOQqOY6EfAMqeEyQChZ4rIw2x2EX8liFi3AX350KheMi/gb0x2HXz+o7L9le0T8Ze65ulGMGPV1YfXUZ7+ovMvyGTYa72JbbjMAw2N2o0+39K+NdtkYe2uG+OIF2BjvzT0sUgZlhaTMj7XIfpeVyDCrqL/RhNV3vpH6NptpqkoP3PO3yi2atc0B+34pi3eHBanzm6QtJe9MxkOhStqyCIa/0S7V25tdUIVz8WuOzzJROD71yNsN3usV2807L+aWymsmNxATIliBlicOTI6e4l/qoyZW8LtOlOysfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yn+TDOenyuOLw6PPIZyMh9GR88nmTdG5As9/Sz4nM+fj7myKG5WXWivKHgpF?=
 =?us-ascii?Q?dxlW1+8mUFtJOxlQ8zRW8mdSbVBcIevXqLpaADpbLow/HYdBIkUZnh45swfn?=
 =?us-ascii?Q?kvSabegO2En141ed5czQbQA58VP4JzmtMFD5saxt/yoIHUltOa2uznXxQTsP?=
 =?us-ascii?Q?RTaDUibrA3c+8WZBH+AgouPwkrSfEMyRakL40tYjIfBEyddvv5zA8mX7DxFy?=
 =?us-ascii?Q?RQE2fWvb7Gqo93NuWMvhrESFSLn35d09c6irSDWnHPjJ2vDYYSQq7e/Adxef?=
 =?us-ascii?Q?HcxIpXLZuD2KHz4mW80Dz90PIy8kP0xyb+r27h+fdi3RBt1K9Sc4GFOLotfd?=
 =?us-ascii?Q?uKk9yQ0GGP1VfQkxyiWb2ieoZGMX1qBOE+kjl1CBC27AMkoMREeCFKWjWP4I?=
 =?us-ascii?Q?aP+BoWnHr7q73Qj2ZY5ijc54Wr0WsyCPeYyGFAtDpNj2fWqUahZcgLj21xcm?=
 =?us-ascii?Q?nDo6XzJxWec6wa6fCSvmLgBQcwb3SU8/A1QAYrgYMhf6orL/AzKVeS93KQdZ?=
 =?us-ascii?Q?6H5C3PqCH+b9PqM0k9wj8nOz1V/E6zwEmkbBWNWC3XcnxPBXk4xLc7vT1YXa?=
 =?us-ascii?Q?RMVs74f2Al/eooqgp9kCx7CZ+nkupMDxTwezZfC94BGa0v7t2eRK5miVB+sy?=
 =?us-ascii?Q?nc9VJmrWklZNLlFHoO8hp50u6XgJBJsRz5D72NcrLMu2xLRpv7cQEz3SBqRg?=
 =?us-ascii?Q?3U9BzAV3WAHt6x1EbyQuxvmPF5D+Nf9HCU/Bcrw6ERnoUZbLj5H8KlRgfwjf?=
 =?us-ascii?Q?XJaYstFeOXht8JaOGJIBVT+YBLGZwDcDURYZlC0Tid1ZahJ7UvZ57YkiTLh5?=
 =?us-ascii?Q?peQOo6wh+lD4eA6rJKTK/dkZn2P4X78muvIRg99Qibk7HN8mGplWGXaq4F5Z?=
 =?us-ascii?Q?/Jf2hVnul8s7t6J/24RJdWbOup1R+cFoUjwOb12TYA9o/Dpgjz1CGw/JEVu+?=
 =?us-ascii?Q?HRkhDFwyl42WWYjsFr691ElP8tlrC1ClASUrPWVi6KNCCo/q5PA3kE4ViAGA?=
 =?us-ascii?Q?XrKRxwrnYy8LBZwg3VrWTPz35R395L/h+T9EA8djQfN8yN7t+A/TqIM2PbkK?=
 =?us-ascii?Q?Qytr/lKU0NhWtqj/7IVdwa81/bITRHUm/rfWEfzaucVq0miHkk+pknwKnjhV?=
 =?us-ascii?Q?sgKCuQdphOCNaiUKZr4G04NW5qWSiEyMZdPByk/LZhowNh9qjemYnZh3mHXS?=
 =?us-ascii?Q?7CJ4dnCRuZmjN4bQuue8QNvXNmxKhdo1TmRCSoQP86p1eKQj1jT3VKi/I5M2?=
 =?us-ascii?Q?zTUu2Ly6SfOfY4vjzgFOlBu0IA+G5WkkMcz54cRnpeKQGACAbVS6T42a+ynG?=
 =?us-ascii?Q?bNhYeNq3YFjBvG4W23GIihRWcpQMPUYyECmr/L9N8IuuEnsivXB+vKfTLxq5?=
 =?us-ascii?Q?9XrJ3J3fNSKc8VMX90M7iR5HiOGBMALDtn9WSZUncDqIx+u+vt1x/rpvuAcx?=
 =?us-ascii?Q?FFeWe6lTON7a+w3RUgzC2pmdc1XSLKsI4RBTfR53+7Cr8hOIs4l2ZtQnriMC?=
 =?us-ascii?Q?gCyfrzZwueExosdDg4ehad0m7UjSVJKRJbjVteT/0txJ83DA4T2bVTs19bBb?=
 =?us-ascii?Q?uIEQTuBlqihfK5EXXbjurrAKmvh9J537SKT++HsV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a059677f-c1a7-4e00-7c45-08dc37c326fc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 18:37:29.3843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcOR17ccMGV9cmdyKAzmugWyqGPJ/lTCT29XqaYmxKo9iZbUsx9eupzeMRnZVC3ur2Y2TgA3uyewPJpjKowbrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8280
X-OriginatorOrg: intel.com
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

i915's intel_runtime_pm_get_if_in_use actually calls the
pm_runtime_get_if_active() with ign_usage_count = false, but Xe
was erroneously calling it with true because of the mem_access cases.

This can lead to unnecessary references getting hold here and device
never getting into the runtime suspended state.

Let's use directly the 'if_in_use' function provided by linux/pm_runtime.

Also, already start this new function protected from the runtime
recursion, since runtime_pm will need to call for display functions
for a proper D3Cold flow.

v2: Update commit message based on Matt's feedback.
    Fix return condition of pm_runtime_get_if_in_use (Matt)

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h   |  2 +-
 drivers/gpu/drm/xe/xe_pm.c                      | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h                      |  1 +
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 420eba0e4be0..ad5864d1dd74 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -177,7 +177,7 @@ static inline intel_wakeref_t intel_runtime_pm_get_if_in_use(struct xe_runtime_p
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
 
-	return xe_pm_runtime_get_if_active(xe);
+	return xe_pm_runtime_get_if_in_use(xe);
 }
 
 static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm *pm)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b5511e3c3153..7d7df78f3a2f 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -457,6 +457,23 @@ int xe_pm_runtime_get_if_active(struct xe_device *xe)
 	return pm_runtime_get_if_active(xe->drm.dev, true);
 }
 
+/**
+ * xe_pm_runtime_get_if_in_use - Get a runtime_pm reference and resume if needed
+ * @xe: xe device instance
+ *
+ * Returns: True if device is awake and the reference was taken, false otherwise.
+ */
+bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
+{
+	if (xe_pm_read_callback_task(xe) == current) {
+		/* The device is awake, grab the ref and move on */
+		pm_runtime_get_noresume(xe->drm.dev);
+		return true;
+	}
+
+	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;
+}
+
 /**
  * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 7f5884babb29..bb4723a98405 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -30,6 +30,7 @@ int xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
+bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
-- 
2.43.2

