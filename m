Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DD9C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 18:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B5610E219;
	Fri,  1 Mar 2024 18:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ao/P6J2a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37DF10E219
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 18:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709316342; x=1740852342;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=wsuZPnaAjnmDGUzHnm5gDeKKeBl2SpcIvOrgh4nTo8U=;
 b=Ao/P6J2aKDla29CcID3ok7vPIBXQZIP/rjYh4YPEuY28zeiXUKNJfciK
 JBLjbGLO0xJ22PcKcThGsIUKolI6vYDh/X+ewci7b8eGZRY5E7m1KY3Os
 qV6f4sTEayN4KbMWgquWkdtZxVw0zuCCjIiuZc46Ph4KVTH4BrLyYoRjw
 eIEAl8s8+/NT3UppuyRui4LiXAlGZkl9IBDGZbWf5b6Y7jCFKfoKhyVIu
 qE5RU/XD8A3YCDAf5WVsNqIOt41h3GoxcYbY81Rr3GGbU4VA4sNqiMX1a
 bxLpXMllllgRM8ph+niAGuB35ij0WQ3t70Fvt1MFYQlnH+e1dAcIDoyvS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4038593"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="4038593"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 10:05:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8700345"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Mar 2024 10:05:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 10:05:39 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 10:05:39 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 10:05:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/BQ20VUfDIp6sfN+Xp/kBCimQHVZNDhaq8Mm8SbV1z10RLH/AYwE/S0n/i5z7gsRW4Zi59NKI4dS1JjqTsL1sLU3isBqXKHzQ0tpSnig5MQYuE5g+4/DqF9q7+rtsUeIAYp1xAxYRq0CmCY6eby9mYZcyQRoaCKsidxAU+geVDUaNcie/fYN42ZTEiVLTSQyw2i4vMdctEm8evGztvnHHsQJAX2TKRv5U5Nfqg7tTHnHxvNkflWU2cKIzZQqYXw4smKykHMeOA7vrnMEJJoLH5wZY2B4ZGnai3eS/dH6e0+qC51qWT0+LRgY/NsSHBkC+UO+vqZhe3fWabgxyRunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRTKnbeRF3tlLskFwkVJQFJaacM0gZK/+Ev7DHvoCkk=;
 b=VpWF7RNbhMvd55Ou2bRDMJSyD3YnuUPfLAXygR237Gt0lJWcMZHSGaa9N8C6iZpf06J+Bm2LnWY4S/qIkaAJp+i53fiy3k5m4YULFQmsTupRgA2SXbhsCeD7vhUGzSTJDU2dUBU49hyR4V5wy6ln3Fp8pQJrO9FgB/Kl3Rua3y8H34Tf0phXrA9XlzDNSn6uPFtw1ySemyAchRbNMcj5Qckw65kXrcQD54xKNOaeiEnZTFyZM08oP1CpyP1xaQI6nL6qkpc57rHrhPETZk4LFcmEDEX/GV0AW2Dm8ozJ4y1jlQXIc9Z7H4LDNd8OJvd6SJ2lDIsyAdK+h/Q3qZyLYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Fri, 1 Mar
 2024 18:05:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 18:05:31 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/3] drm/xe: Fix display runtime_pm handling
Date: Fri, 1 Mar 2024 13:05:23 -0500
Message-ID: <20240301180526.643505-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eda195a-216a-4f37-28dd-08dc3a1a2eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4/rR9fPrIzwl1SE+eOKVBcys4hi67YvF8dXdAgDkyRkVixhq1q+S/F+WHRApWUtFFLRuHBlz5flKpsrOVB4VTDg1cbJMwtBi7T6I0GublY6sV0E/fPXl7w8jCgs8xxa7xlT0eD6G7+8RzttcSPjHowIK6Tb5mQDVvJASVKjFH/dfPk/jd/4+Vw6GIuC7FEreciZPC9Y2LqiFwWobQzAOmnMaImGGpI6DUC7wGIOF447mQynjMV2sUb/Np1WVHAVTHeq2q0pMgd8MOB8IyYh/VNyTPKrRScBn2tP5IS9EFSu21zeWENZlJtzCvhzleSd80umgbcM4qOGdj3WyIj+iVTM5vhxmpaxKVxGDQtX2dtwOGpAQW0l5JbdQ1PN+z7gEPOJp0hBh3DZvSwTJX4WhVYC8MIcdtFeMyczYq81kzqV1W0KQSh20kKi0ErtQ5A6KlReg5iDSE2618IvHsE932zPJhDrhufP73ewRMCXubiJzgbKIWIigl1iHbhe+qfobTFqtj4BnXiIGjyvS6THB9MYQlly1qGUeWvfAm97kpHrPSBhOHyppObYj/68hJMzmELovh7GWM3/4PtfXOLlDWdasJeG4C7iUCNtHakbbLAtSDfGbhKpTnfoNSOZfVdJMd5ripw8ymE2f2JzbE+28aA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J6KTCCtXybM7d7MhDIzPkW57yFaocjKewdiTGxR2Vz1GFEoPM93epLdBB9JY?=
 =?us-ascii?Q?I0ouINAitnSKpvBam6icp9euJp8Y9skDU8MGaLEVVFTCak0DAkbxw19ugbU7?=
 =?us-ascii?Q?rBobsGVUtQZ1i7JkLi/F0Mocnmr83q2Z7Ju9A3AsH/vqrS+6EcFejX5b45wr?=
 =?us-ascii?Q?VKjY3zg8/qeERfRKCiYstdFTuyW9FNzoSpk9hulgUpDGybgYgPTFNuvfeHV3?=
 =?us-ascii?Q?GqZf0EmZGYAKZaTez0ZFP3VB1rTOSPFcMBjQU2pjGGAgg7R3bY9LlmH7lzbn?=
 =?us-ascii?Q?Q9fehGuOWZdndpbDyxLTDGSLnfgD5EvcGy7teIcVU4fgoVVKil3DNjKsXEg8?=
 =?us-ascii?Q?oFdBYrDVFPMNok+zHMprLJae5TaUCWOtd7k8YG8HK1+n9ptbKC8WJYhNGUB5?=
 =?us-ascii?Q?CM5D1U47ZlAyAswL26nvu46yTVx7GKm/lJCzLveitoC3BbMuhsmydcyprR3p?=
 =?us-ascii?Q?2TVKY6/SWOdggDdWyzYOXsyipKUTFCtQB2h+2CK/MwuFxquwr7GFRPPn8aJU?=
 =?us-ascii?Q?kgbI13Kt3KYHJGSH3+oliIxplqKx2Ko32vEBnKvipkPbBWQcuvVH/2d3mdb1?=
 =?us-ascii?Q?sRbOowGCdUP3Xf0cutuGrDgCiEJqVlhPh19M+4AAyAKLztQ7NozRGqL6EDqE?=
 =?us-ascii?Q?nO5J0fvyQ+7vx3NyG5Cuu6oEOHlG5bAsBEpdOjYU57xwBVZpxyg917AiS5s+?=
 =?us-ascii?Q?Z/uppiGKugJls8fatFlu3/O53JZsCl9L0Nnt5y1ucd4tnC4T/ozSmQZS4EOA?=
 =?us-ascii?Q?TYNoKHpKd76NKpFvJUIQD7C4sqkjXR35DXnPZpvTHY7Turyu3QIbVb8nfBxb?=
 =?us-ascii?Q?7MnMS1G4hoO7/S4fcF4shvnruoD53+rSwtfbKkfeXj3unE1Jvct20n8cafjQ?=
 =?us-ascii?Q?+GNY9dxVV+JgwbbgH9NfAc/DJYC2U/s3zsH/XnBJkNrOOcqEdLmkmNycbtdc?=
 =?us-ascii?Q?pvaYprM+TA9Fc2podg1qx+17tnb6GD6jZGvmaCTuskeitCt68IRFZLjyTjWL?=
 =?us-ascii?Q?Zo1atLRyVSaYm984tjizV5HNg3GLnputhYpCsqYaLHl/rziBwbXc2ViHmCUj?=
 =?us-ascii?Q?5aQllJr8GqIcXdNeYwqGq4xlivkvtMPm12csNMo8jS+zYXDz8JcocsLqcU1I?=
 =?us-ascii?Q?jNlr9U3Ko6cr1Nlxnm5vaOSvTm1vCk2CRZI6PYDUmU3dFQy83n/AFzQCI6wy?=
 =?us-ascii?Q?JLCD84ajJyeXN/b1mKuM7bOtq7ZBOsqRsPqjep+iz9ZYXAf5x+XvFEtqiBRN?=
 =?us-ascii?Q?yNTEMmuaV3pDOsmA4gVTKVdXcvcWUVWB7X7H4nRvrPw8jb9cMX9sTI6UoN7i?=
 =?us-ascii?Q?J1MegkFsQrtaDU1waRQ7U3MPYF2AeQGJrpQ/sMW25S7uUvBuSu8RvfDL4Boo?=
 =?us-ascii?Q?RCI4ieMpPW6Od1jj3lDkRZO4jZXqI0RGfUuGUaYU1YNtVL3IsrPX+/fAQxkL?=
 =?us-ascii?Q?CjSak7ZcHb1FQOWSJM28yNRhpGSuyRaZGkIua/cjzOprDUDAVTn1AiNlKhyP?=
 =?us-ascii?Q?EV5rI+2F4pWtHxPxL7PbHVtsMwFVtq/F3nOTK5P8ls+g2IWxmRq7akrBG/6g?=
 =?us-ascii?Q?zYhPUU9rhxNtDMPn9S8SS+u3aRALn7CNB1HKMYkb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eda195a-216a-4f37-28dd-08dc3a1a2eae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 18:05:30.9254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yBDHBEVKCWRjJhJVPiDP3sVQhScvKpfACrdXGp4JpC95nmvgrtojxDH0MAKts4BDeONAHemHrDXncOiYhdfhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6952
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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

