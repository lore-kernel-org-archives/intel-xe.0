Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DDFC54E69
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 14:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F68711225A;
	Fri, 15 Mar 2024 14:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXaaBGiD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540BD11225A
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710511296; x=1742047296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Q7ITJGR9cMUtaqbrfCynI1D6grmEdQnLJ3Six75PlFs=;
 b=bXaaBGiDaMRUnZVNwNzRveCEOGyFawzpYgGx0Dyu1hgK5jyvimDpuiMQ
 uknkHgOgCudjgCAMwM8tyIs9sqTbYX3Xmg8D8TltUJv1IdGQJwhraGDEp
 Oh8aM2N9jzp5gpLMorbnSq2UYN9RuNt08PeGtFgXpcQCKXlkpSv5oniz+
 ANo2ITVcGNd6GkmU99Q4EEBxP/SCkTzJAf+8VjU++qn/Dl19W+9EGceJ2
 WjAwjFrq7Dilcq4SGp6IBfS2M4EOkdHB/P3SqY0qxbYyjhyj50PvFYGPh
 6mG4yQ+cXp8DW+RJBw4r3IZy3l65V9ngIKUEXp8WamfSXr7y7kYg6zJli g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9213684"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="9213684"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 07:01:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12765171"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 07:01:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 07:01:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 07:01:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 07:01:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmDIijctPbygVf0T3z5t5DA8o7hSsOWnlhdXkWSKoDSMkO5Zbjlu7lxhsoLd+djDNTGZR+spcijjeeu1WyMP3PY0VLUynqd9zcTjcJUTSAG9bKGrLXGnSFDlLj0fsqpenMQ8KDdo95tpGfzGjkpHN/pHltINTxzX1DEqlfGwHk2HntBylUmab9/8eAgWZ9W2EMNNndt35A1UFTbfDREQidOCs2Sabm5BnNrndWtAeb7RGrDGYlQjLLV2WD/jqVNLCU6AA2duT/NgbxbMvJpTlUbBYDfxWarpWhHdQtqJAynn1LkHczQ3MMUhMjXwPjD9oAZO0J+Q9GIAPR0jXWUg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/osX1Q6CjmZ7pfVleR1dgL2Lwo5hgUbyNr4A1oEiU8=;
 b=new4SI3hBCqIKjsb1BZLvBnJPEvXisOV3I+er6mGW5MWG8i25oRxO9SgacZixrDQXT2SCNlYbtGsoiB9/o8piOVS5bvFQRO73iw2fFSvTIhqajHTsYQcWjSYbsK4K+kbjzfW9RFdEhoTihL3dmB8HqDrkupYRM6kjD6mItxiTFXS3kKp1GRjJWfc2NtaIGDXWlE9pQfDE2+eck247D3ErpfcyJkH4AsWqjO8YrDSAp2rnSBfmCYW1mekavWXi36ewwshaFJKaULPVMxbE5fdgO89IcU+diqRfibJ62tJi6dPT/1QaqLDjO+kf0PBTBMHQcJV663afcLCkWeX62V/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7523.namprd11.prod.outlook.com (2603:10b6:510:280::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Fri, 15 Mar
 2024 14:01:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 14:01:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>, 
 Himanshu Somaiya <himanshu.somaiya@intel.com>
Subject: [PATCH 4/6] drm/xe: Force busted state and block GT reset upon any
 GPU hang
Date: Fri, 15 Mar 2024 10:01:06 -0400
Message-ID: <20240315140108.217862-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315140108.217862-1-rodrigo.vivi@intel.com>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 264bf868-b5bf-442d-d192-08dc44f86b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YGpzClKVeRk9TMv1sZ9Cee0Hp64r3gLvWysmVuc1eqAF+FCb5T1s9g79Rt5UqdjmlL8QTAFJixQbEnxkFJCzDr4E/uMQQU6Jv59fT27izRdwfS6TtAmztaoFUKsMAFJ/1eqLQiA4EOBQH4t46/yT/Ma+yS8v3WEWxWjWaISut2/KCsxKLf8stk5hlcYBLAJzL+eYTm5O/8iZepofECgMFVQgsoIzntxfViZyjb3fgZX+ivcPxbB46sRSRN54vvy2uwwXVwD7cLNzwH5L5D6S1HJuCW7cDqTTCzARYY2SW+vkZ/LjVG4Zt2dfQlTYDaLpwvQlHjDn6Hlnw48FyWSaqVyP6TNXsqtPe2xPJTyoneoYkpEEAc6GPQ7D/Fi7yvUf9XrKAejncq+WeKxXccwSzDd5CHfMr5HQVNJiXJcJhDsVp2ncMnd0JPkaRQlpM1twGXxkFsXf8192Hta2hxBQp4aNJlATkAxrnMSkBg64SSLaof3WMH800IuIG5rUl37NdHidQsFvoMr1wakjL+ias3imR/OFUN+xeVOUPijY6z4oVKpJCQqrq9mtimAmJ4W3hepO0crSj+dB56hIp/MnNHGumyqyYNO4jsRSJK6sA+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZanJ/I7h5/Goa4gIsXR8nadIADiAYkhW7/WADJbPeOuzLdXJaUmMsBfDYE25?=
 =?us-ascii?Q?lrOkP2OLzI2fvFBQFnx4HyxhJj3TS2XUGreCAMupOcxNt1ypslrfu21cpH1y?=
 =?us-ascii?Q?h1hKTV0/I4N+gXi1kzZVFHYcAYW6CYuBGnltCQ4MOoXjNOb1CduqmFjaUwP0?=
 =?us-ascii?Q?mWx8OruHpzyd9O9a3/ndV2Yb56zJD7r2GCe01FAwfc8zMUflAAvm19uk+0Wi?=
 =?us-ascii?Q?hnJ6Yy8iAez7yNHhaDZ72zUr8XMpWqqXr0ueUALPSJUwnrwC3KoZSfH4Lcld?=
 =?us-ascii?Q?2jXTW8+Y1PY3KOAhZugppRAhnl0gsyrghDQFDpPFOxmvxCCiL7n/adpuRr09?=
 =?us-ascii?Q?PJjkUkGaO6OcTXC1U3DtAsuKlWTw7S8VxQaPAmomsFPt8TFaCachpY0U33Ci?=
 =?us-ascii?Q?I3oot5XKnb1wzJK85Oem4Cb0iz8w82cFwmiXWt++E63/QfrvIX8PcKVDxt2w?=
 =?us-ascii?Q?r62qzsbDG6xyXTPIG17WiNyMC1t4JNsRSZWgrpvPWHU8DvzlPyjMAB7E9FX2?=
 =?us-ascii?Q?NoxGbzUScsMJbJin8pDeSktx6yNElNGrLynQz7JX3Ev7RQEh8JoZ3QYKgDSV?=
 =?us-ascii?Q?rYmxaGg7jhBL3ysUHYM2WccuB5SzzfZ9igo+x9yJnb7tG5s2/cagpQ3e+4jP?=
 =?us-ascii?Q?J6ynD+ZUN2CirR0UXT3Fuv8IAO7CAjGs7GTC4FU+sKpoqFg2T0DZ5gXSYiit?=
 =?us-ascii?Q?0Qp8Qk6Cg//cO7tsB4A7QKAX5nGOEMfYVHvJJf80fzMBWZM1y9IQnWYh5Xws?=
 =?us-ascii?Q?pxPUfpLfKcDYp5w1ddR6/aPvfQSftuIlvth7XINXBl3V1MLTyauDYLAbwKoV?=
 =?us-ascii?Q?mmcekWq/aDkQTLjlJvajODWdTmP5fLlFwwszQQpg4h/iE5aw0QjJVWegMZbh?=
 =?us-ascii?Q?wEL34WrAt9w7weLAewV9n0t1eqooVBJ6nYm6XjIXq/Xky7P+f6zzveoXin+c?=
 =?us-ascii?Q?bHK9yPMF2znVRbgssYRrRdid5VJ7uXNMb3NpsnL2SDFCDmSMRsopAEO2+tei?=
 =?us-ascii?Q?PqoO8/7A8aWVS3l+kDuE15hpNzPhqz684TSi9z8fyL7TRlyBpEj6cO1/wVGH?=
 =?us-ascii?Q?YyGCD1e/dDzDaT31Cwb8ojBJqwyx1uZOAb1BE3edvj3MODfPgbdFUBlzSODk?=
 =?us-ascii?Q?Zv6TRnOIebRTfb6HI2dPyssnLgSnfIss8PRYQhhLxzTl2lJCHysx6HNitDyG?=
 =?us-ascii?Q?uwXA/gLSIWohV8tYCV2uck6GpTlpvPxbXjar7cIjA3K8P8zuZ6xds4DF0NO1?=
 =?us-ascii?Q?c0J8gqb5P43rl9wQAct93XjLNTfK0jfg+uUpWUcp38Yp8Nrz7m0s+jDg3U7l?=
 =?us-ascii?Q?MQWiATcPbdzcUSY2CLwvxLfn51L0ZoqCI6UkAWHwsoEs9KWQaRfd2hqziGiy?=
 =?us-ascii?Q?Hi05DB7QL1uYuLL8wkbey/WYaGPl3AySPlCoSHENdlhUO5ic9jrncv8NUN28?=
 =?us-ascii?Q?7SuTDy6veg9E29uMMapan2wvtukqVIlzNLmX5hGzgNilElGUt7AkPARwRP72?=
 =?us-ascii?Q?aocvDyTHdoDRLIJJnuHHo/2o2tUXBLIH9mvuz6kpZz+XuDS1vjG3jUFUbquh?=
 =?us-ascii?Q?lJb4Sv7SpTBXsmaDHT6wPxiFs+1bnkLqPl1FMuPD8sKFi3ba2alHMDy+0d+3?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 264bf868-b5bf-442d-d192-08dc44f86b7c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 14:01:32.7975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKQks1F4vm/eyGGdQXtobRkc1+GC4ghBxh5585cWF48ilLcF8Vglxu7gMl/a+pfDM+Btq5vqOLc0MTidEuOSKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7523
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

In many validation situations when debugging GPU Hangs,
it is useful to preserve the GT situation from the moment
that the timeout occurred.

This patch introduces a module parameter that could be used
on situations like this.

If xe.busted module parameter is set to 2, Xe will be declared
busted on every single execution timeout (a.k.a. GPU hang) right
after devcoredump snapshot capture and without attempting any
kind of GT reset and blocking entirely any kind of execution.

v2: Really block gt_reset from guc side. (Lucas)
    s/wedged/busted (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h     | 13 +------------
 drivers/gpu/drm/xe/xe_guc_ads.c    |  7 +++++++
 drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
 drivers/gpu/drm/xe/xe_module.c     |  5 +++++
 drivers/gpu/drm/xe/xe_module.h     |  1 +
 6 files changed, 48 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d02e59fb49eb..e28e3628744f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -774,3 +774,33 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
 {
 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
 }
+
+/**
+ * xe_device_declare_busted - Declare device busted
+ * @xe: xe device instance
+ *
+ * This is a final state that can only be cleared with a module
+ * re-probe (unbind + bind).
+ * In this state every IOCTL will be blocked so the GT cannot be used.
+ * In general it will be called upon any critical error such as gt reset
+ * failure or guc loading failure.
+ * If xe.busted module parameter is set to 2, this function will be called
+ * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
+ * snapshot capture. In this mode, GT reset won't be attempted so the state of
+ * the issue is preserved for further debugging.
+ */
+void xe_device_declare_busted(struct xe_device *xe)
+{
+	if (xe_modparam.busted_mode == 0)
+		return;
+
+	if (!atomic_xchg(&xe->busted, 1))
+		drm_err(&xe->drm,
+			"CRITICAL: Xe has declared device %s as busted.\n"
+			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
+			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
+			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
+			dev_name(xe->drm.dev));
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 2c6d9b77821a..e6edf2d3ee4a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -181,17 +181,6 @@ static inline bool xe_device_busted(struct xe_device *xe)
 	return atomic_read(&xe->busted);
 }
 
-static inline void xe_device_declare_busted(struct xe_device *xe)
-{
-	if (!atomic_xchg(&xe->busted, 1))
-		drm_err(&xe->drm,
-			"CRITICAL: Xe has declared device %s as busted.\n"
-			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
-			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
-			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
-			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
-			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
-			dev_name(xe->drm.dev));
-}
+void xe_device_declare_busted(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 6ad4c1a90a78..ecf45289b187 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -18,6 +18,7 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_module.h"
 #include "xe_platform_types.h"
 
 /* Slack of a few additional entries per engine */
@@ -312,10 +313,16 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
+	u32 global_flags = 0;
+
 	ads_blob_write(ads, policies.dpc_promote_time,
 		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
+
+	if (xe_modparam.busted_mode == 2)
+		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
 	ads_blob_write(ads, policies.global_flags, 0);
 	ads_blob_write(ads, policies.is_valid, 1);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ee663683e9eb..3f3160373631 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -34,6 +34,7 @@
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_module.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -950,6 +951,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	simple_error_capture(q);
 	xe_devcoredump(job);
 
+	if (xe_modparam.busted_mode == 2)
+		xe_device_declare_busted(xe);
+
 	trace_xe_sched_job_timedout(job);
 
 	/* Kill the run_job entry point */
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 110b69864656..f81970e8d713 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
 	.enable_display = true,
 	.guc_log_level = 5,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
+	.busted_mode = 1,
 	/* the rest are 0 by default */
 };
 
@@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
 
+module_param_named_unsafe(busted_mode, xe_modparam.busted_mode, int, 0600);
+MODULE_PARM_DESC(busted_mode,
+		 "Module's default policy for the busted mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
+
 struct init_funcs {
 	int (*init)(void);
 	void (*exit)(void);
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 88ef0e8b2bfd..bbf88c34e4f4 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -18,6 +18,7 @@ struct xe_modparam {
 	char *huc_firmware_path;
 	char *gsc_firmware_path;
 	char *force_probe;
+	int busted_mode;
 };
 
 extern struct xe_modparam xe_modparam;
-- 
2.44.0

