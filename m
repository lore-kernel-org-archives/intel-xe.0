Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E57C54E5D
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 01:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AF610F3C1;
	Fri, 15 Mar 2024 01:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8sR+KhC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EE210F430
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 01:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710464625; x=1742000625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=skoGmEFc8/fLIt3SX0oK8BM3QWfNCDktrxZ3wTQx/8A=;
 b=Q8sR+KhCIGCmi9aMRVGxwcstC8kW2OO+PcP9AeDSQptHVb4S7ohrjtlZ
 24KnE22sI62nxhxJRL73XEgFvpYU7vPOYNhTlJkRLieDSW06VUqQ6N3Dn
 y7JcWHom7znG6mVAdE2oVvmW38mLflWRwhfkGVgDwtkKZdcyH8S5rU0Lb
 8UK4wSnaXHV/8Pjx2iO6mYNVJoOqMbBlG2xsC/H0gFZnU69Qqv0UIasug
 J85imwPjxonvuGDIQor24S2jpZG33hLVo/5ucc98wYK0iKg9d5D6RZESA
 OvaBcjFdPIKm8Qpdl4vhhKXE2OvgyoSm0qGMOrYhz3E0fNMPSBZEhYPUN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5446701"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5446701"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="43521702"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 18:03:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 18:03:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 18:03:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 18:03:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 18:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpGCzQXOzMmYPjfljYBgyTBfD14Or5Kn354j6RQnwGPTZmZ03M0SH3uLDbf5CJYyKHycZGydIHAxDSiFzdmgbW2W65A9imFqrmH4A9IL51nb90Jdftj5lQSH2VwJAdK4AMHbJ8bOlLbk/PQ4sG48WWvm3K6Aw3KLbDtXQzfD8v6zQTczh6O6NgSmrVjQVKK/lIvhuwj49HTWtfjVRyPdYmWYlX4Mqx5JSs+KfuWI7G8x0P39kYNzO+okbpnYZqBbk61PhcqdhuM71uqsjLzMlymsMdoTniFECV/L0IgJaMWWAgv904cChx5iWBnCuxxfIFIPP8LBGcDNdo1zbJnPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkqWrs7czeiP0Ai77rPGiOnKKX5yi9OtTb3PGAh+ScU=;
 b=J5hRpXGcM8+QLbAXkmA98+zIf9IHDrIJcWmIlg9h5xSY4lpgItQoJmCk3kT53LY3i1x0JYaG9Tze0mBITjxXeNl0Hur1kbC+9Gf8VOGYL66tN/0L3xp3BXmH6rQXAIjZ3HO10FoKw2BaA/x0N/Qovse4TEyi4EyEWQ088PMnl6X0VlGa8ZvBD/HYFbqlBkCBknN2RF7XiLU/agrByUWS3kl3osD4uFN4DUlyFtH3W3bGoHAoFiO4Gnp9kOogTq9gHjDdYCdVZb0XnU47SvMXXOsi4yGzhquPpnwKSpi0LXeI7uzYF0kczwjSZ5MIb3APyKurny9stATMvRFpxUgM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 01:03:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 01:03:30 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>, 
 Himanshu Somaiya <himanshu.somaiya@intel.com>
Subject: [PATCH 3/3] drm/xe: Force busted state and block GT reset upon any
 GPU hang
Date: Thu, 14 Mar 2024 21:03:17 -0400
Message-ID: <20240315010317.193756-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315010317.193756-1-rodrigo.vivi@intel.com>
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 04f28993-880a-4a8e-7cf9-08dc448bbad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S88F7vdw4P+GTuw+/nQoa6VnI/6pslqu7M/nXYJcLO3o24d1pmFRPeXFvtTbbtgYMPWq8eX5HGs9F42HuFLaOVphqnOWd2aFf8dirr0psbneaq0oQZEojscSudJwJ8lqqrb10lrYiS46/GLdXN19lyO5momthgNfLfDUvSMIvdTv1Achubqq61pe6OypQ6+UjuBfZl5nFH4Yr1qg8vQUa4bouP4wtTvpSPZ5GbGKLuMQAGdgo9r0x9c8a9w6PIOhaS6GZ+EN1X3lG9THa99/XvX1dQi3vZeRJ758a8aKP9UCIuLzXqU8X6hHCm6qA6ts9xW2UHqQH9BixcsDSi8N9S47ClC9mtUA4ncM5OgXW/w66fKtj1DjMZ9utlrrq2iXmY0c2T7WlfvAR5zI1ZBzr7qds1vd28qBkWg6ci6o5HfBhTfF+GAfed6GdOu/DUibZOGaKceCyQ4TAhZP2nPTKECxCOZIaa607+vURTl/cM37ZIsd0LyeUREopaXb6JDr8sERPUEJBTqbQwbr0+BKS6neljnB+W3FJ5E60F93WX+xHrHj1hFqCx9QcBp5ZL8Dpk/+D+AnCg6gDmVJB9jQNk9fIvNui6Yg62/ANATrFic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HWL5/0jf0JHs6yQJkx1D06eUut6xIaJTdpipn21ZfjKSBuzyYTYRjVb6t61q?=
 =?us-ascii?Q?kWwJ765aqpeTNY8Ha5vDvCzjCjBsdn2QpwwwaOXbtcEWzI3l1JZzTOoS+Sw+?=
 =?us-ascii?Q?EbHusYHkdvcB9Gj1H/BPtxKwwMbcLGEYv2XSBF+TGUPM6oZAeoW/QDkqDq3e?=
 =?us-ascii?Q?jxbMMK1itTTEBsVPyfzFt+slqnXCLY8UR46+e+fTeli1gcD9Ada6N9IhddHa?=
 =?us-ascii?Q?7XNowtIDyNLVjX5nDPsSgGZqpdU8c4YpVlgrHIK1ecvdro5fLaf/7tSWe8ms?=
 =?us-ascii?Q?CYUriE5KaQ7MaSlu8LMOyngD6sNUTJTG+Aj5IohAi2Db2gawpoz9fYvHlwcT?=
 =?us-ascii?Q?r15YOfJv2qHFXghbVghncAv8Bkx/J8EO/SPpKJbEvVbl3CiGyLno0Ve33PPm?=
 =?us-ascii?Q?bWuhIX0LQO3JICrTFbYFptQXF8W6rJ0wea8wtelN0LZIykJnpZ050NJj1kqU?=
 =?us-ascii?Q?DDJ2gg1RylOOUi0XP9JHCM4MWu9ehlBUesf4TiRzPUxyFJqj9z1cCTzZ8lTb?=
 =?us-ascii?Q?O/BRQhMyZkKEGREW9dK6+sy3JwgpCy/3UCGiZzsi6Qe/pqM/Km4gn7CclT7Y?=
 =?us-ascii?Q?MHaNdbgFyAdwRfNcYtKlKeC9WqdN9PHi+Rt4UItmHJ3AbJRCeRS8YNG6OHj1?=
 =?us-ascii?Q?zNb73QT5UtyIzmr/rGwk524OdgcDOk7TlbVQkZGxPZ2O4t7OhXIkqk+JuPZI?=
 =?us-ascii?Q?zHFL5QLU6Hu65YsP86KxeOkb828oXu9L8Np1XTxpGeNUqdT2MH5oiUeKS5+k?=
 =?us-ascii?Q?Nb4PnfZYd9F5UAQtE8vgdv9XDmtcY5w56hI5FzKC1GzVf6hKOF4iVwiitDd1?=
 =?us-ascii?Q?po0Fzj833CATzZFCsqHW2e4nQT2zWjKnAnzBterUdVMsRCBHXAW/yR92tzhY?=
 =?us-ascii?Q?19oFk7r/79v2LIr39M7wvZJODmBtXfHqdTGhW0MLFMna5qIhAtapxSKqLCjz?=
 =?us-ascii?Q?4JDfhL6vL8B2yROcgmT9JanXRWR3B++tvNKnyO2Hw9r9ecWmfJh2Y7y9ndmu?=
 =?us-ascii?Q?1+XHPxRBtic0jtH+jWNxWVvIl74OeeICXZRc9es0FFy6PAXut2semVXqP0Sj?=
 =?us-ascii?Q?OaTn9Vns6wdSxn5tfJuqQ0OjnGnzI9ROirAmY3vfykyPclPGh/BFTLdTY70m?=
 =?us-ascii?Q?yieJJn1Q87SHh3MfJQV2Dvrb9RwneZAVGgvJ+8SX5NPUOfWUtmjtkBzzunrg?=
 =?us-ascii?Q?CQ3zSxEFzYAREXGFxZRJCndUQiTxedLbuwFELv7GvSLvk6LTlA2IfU87+eOR?=
 =?us-ascii?Q?7Xd2VBRqfN8rHHX+5dTriiL/lo21wgAwoBPvcERxkHF+/2biGTsxG1moUPZ9?=
 =?us-ascii?Q?33Qn7Aw2HsmOM/GwN3ZTCHDT4RhKVvX8ymkPIFRqFRvz+rjX5w86kdjokZc7?=
 =?us-ascii?Q?dlwzoctd/vQq4UnMdxY4onHSwNoj1PpxidlxFDS2Fr6OF/3JIYDw4/WlAJsM?=
 =?us-ascii?Q?VvYl0JfUsIj6BH3a8wsTUYdEi/5hCW+3pfI/GuuCZKSWSLoq2e5BA13B4DKs?=
 =?us-ascii?Q?ilFh1xwaDBMvKN2HPhuLVBwgeUhojTCa8DwY9MDsSk0Sh87mdPacqhaKAb87?=
 =?us-ascii?Q?9kkM2pA42Ra17ePcWM3WLYB29V/lE2dq5edz9u1/9Evk44sYHjXBdIv7OXVf?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f28993-880a-4a8e-7cf9-08dc448bbad1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 01:03:30.7776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nl20Na4sDgcJ/4t1OIFNInFBcRF9ca1BwyWKwroaZvxpqyLJdgKpBBAu8xz7qfY1oXJy2B05xhRNZNllCD8ZHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6422
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
index 82c955a2a15c..e7ddf35c1dac 100644
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
@@ -949,6 +950,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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

