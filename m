Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67ECC54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 19:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8543710F6E0;
	Wed, 13 Mar 2024 19:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7truW+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5509510F284
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 19:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710359717; x=1741895717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LijePfcZXSa8/09NtXT/pZfkYWKBotLgaXzjHFQ3QEc=;
 b=X7truW+ry48HFw0870P5qIdtblWMZMNNIS16mRIkoyckCC8KHHuXk6i0
 QVvqf9uO4b580m3QSB155Wc61/1mV38utLUaXf2wDPrjdDmgh4yUAXsl0
 56AYx6NbLCRSFFtyxha47kcP0ift62HIUFGDfSVGSwCzsKBQbu2VARFIA
 7c6oOPSOGPUhI7EsVkgaB10a4B2XplMClihIxZzsjyab1VVHpGKffMjsW
 pLC2Qar54ODk715ub7DPAPFdbBUgAUZACdl648FXOcdWGVQvmGiAniSoV
 mM6ZMy1klRcAKPRMnbxsOpLvg7CGUMpczdkLWF6oYXBefzzUKdy3Y9Vew g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5323141"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5323141"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="12128691"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 12:55:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 12:55:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 12:55:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 12:55:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amGOPzu3t4HbvGTdsPyo6krshrjUzhUnN1NsHAgKZmFOliZ8hh/iuMJV8R5Mfr5ZOdDelMrWAeq8GBqHY2A+PF767nxDbHW8C7zjnyqDjJ4BPlBTYwxOAzVrk9qULGQn+Byvojg3pogDDGX12CUJGWqcVJ+XomNDDjFgzC1TSge4u/9Ztvhy2JqxSLotCFRSgBMPo4cy0evCFFHeDW8n+LDAS/Ye9YfnIXNJQuNl/Voc53Edb52vp0FOOcdQ9TLULP+zF36xXGN7jTTsjM4RfJr6DNAgoO6hOS0U+4tTMPy0VjhKto8IYijsim3CObyfyGJYxGAv5QPdu51samm2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYafHKZhckXIfGZydmF7YCbQF7p8+2nBtTYPZZD7a5c=;
 b=An4UDkBsrRZ8uitjhaMS9YsuJfjCxGXMoIaflE/trWt/kDwYuLITC0T8/l/J/5bJUoK7N3UwK9zXb+rJjsRgDRhymK+Ez47dcgzR85f2H++IxR0NkNkEq8LY42zozqUA+vsASzwGW9F9eSct7MFS1cuRzsekg8mgrUJjFn3rj9sX7EJthz7JueMaOMCn6edMPLDwiD/XoYxDOccT5Y6fnLB3rRgDEMFLs4EnpD7NEMI37ZZrs5BWDB657BC5bqpCXMqh49yxp0Dx0xuKskcG7Uj6sdW5HfLWXYRrpZYJlD6WfZ+qN5CIYE8myffTvb6SfIIhzXcfrh4QdgZXNAPMnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 19:55:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 19:55:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: [PATCH 3/3] drm/xe: Force wedged state and block GT reset upon any
 GPU hang
Date: Wed, 13 Mar 2024 15:54:59 -0400
Message-ID: <20240313195459.141463-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313195459.141463-1-rodrigo.vivi@intel.com>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5254:EE_
X-MS-Office365-Filtering-Correlation-Id: a8807c8b-5fec-4e8c-889c-08dc43977f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5id3QnPVFGDVVnGbxZngB0cApuKPpThRvQz/H5Fo2Oh6O2d6OoT19wYYph34bQRcM1KADEJIgR54ZTQdsrGs2GFERrsdYbVEJ1ZB6t1+xj4MBO9Vprr9kya2sWVYuyB4q7FbRKrq2fquoqZuazoErz9qiG4Vzv4A2gQHhJjKsg1jNADLzBLNHZnx2YKszU/a/OJYJUC7khKCtq4JGy0uTiQnfdDHVYkP8f9Zuv+/2fZbiiwvNN8AxNcm3x2kb0hHO5mPXL5dSjiB99byQgvue+ehCJ8Qe5NGsGGbjRGaWeuW3F76dFLkdemU3rEv4Crrb98U66PZZyydJzEGMUe4SmHwZjhuHT7ZJ1LqUE+F2N23Qsmp8oan04B7yCa6W7dApereGGfru7LniGna9h9LqEcjlO0SDdv7f/Uedqbo548BXeDahrSXTYek32plx4VREQh81DyRQD6xfj8V24WbKFTIaKAIpOdOQTwnt3irr37i4tKULfdeWWy+q/o44vPOktF3vXUYm9wymuES4jd9M5EIic5SDGKi5NOIBhV1vk5l9uzdjZlpfaIK7tsChO6L2czoFkyOAbNDBecgc1P+NfqROAiweY0NM6lNnHzNzUb3Oy72oQH9OWsdF2yp125egqiq6wormvDXR0wySNhN2uweSxPa1JBOjkDw4T6DzwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sS61gHdhK5cmSdFwdG78fyjdw3Ua8Y8MFylRpr+lsq9z5tlB7kJ29VaMcWkC?=
 =?us-ascii?Q?qEtnJsfIhbSEcZw2Y4qeNPhBOaDH+G7E18ed8Mn6y84jdhMBbWvF47vIuZom?=
 =?us-ascii?Q?8soop6xubYfmoaauJQD5ArkYHQkcuA4AJBrmUltGLbvFF1rxAbA6B1P6wG8o?=
 =?us-ascii?Q?pkHt9VHyuBYYAJoehRsw/l//dYoBvoiZEMALfv2l4mwN30wQPaKY2Rik7Tk1?=
 =?us-ascii?Q?ytkvK6brvQbnADW3vxoYDN03ieX9KbkGpZuQTe1mRx3m2uIGjmidK+H3JynO?=
 =?us-ascii?Q?qO7vkCQwVBTLP5r4MU0K5WeaqiUIiAf0UcVyJuPR4V/FKnTcJ0SFJOReyqEU?=
 =?us-ascii?Q?FCJ5Wen/KyOBVQFrxzqXiMX7Fif2paC7IzzscCtyLntsCJKSsJuaKFnJMkc4?=
 =?us-ascii?Q?GILO08YQztggqa6VsQDs/Q3NvcSKCvAAjTUhC6EI6aBI09EzG0Rij3uknr5G?=
 =?us-ascii?Q?fifO65zeyFFuNFN4IqlLAFXKCBd+vREOTc4WaVUvgLVV0QIZRsmQYLgTUJvy?=
 =?us-ascii?Q?4sL/HOokZ744Dm7E7AcwLwL3sGZU9oz6o1zoHS/AXw76mCjI3ifIA7HA+cKU?=
 =?us-ascii?Q?tAcy3UT58m7xpzWjx6EqCleafdAxXFZUjo6Bq1Fvg/yT2h83/kTv/QTUG8uQ?=
 =?us-ascii?Q?6cqpUBj2qEOjLidQPbjGho6SSrMvx9/m2ucbmw0qDbLnCgO1YZD7N6hR0N3N?=
 =?us-ascii?Q?ODCezQE0Cn+SXqRebfSSqo2VC8DlQeNY9WMdOHATB5zMZfWo4mMp7B7t5URq?=
 =?us-ascii?Q?tWfqtMAKaVYhUAVhEHsG0DB8ie9cvqMsfPKpDeTHyn1pe410EOGD5lDeEhRJ?=
 =?us-ascii?Q?4s+sQzYwQXu6aBVXshiJJFwA+G+eZKjQQ4xr3TkVEpjyciyBtGgmj/pL57/Z?=
 =?us-ascii?Q?5Edr+8CxOA5T0M/grOgZzvCKMKy2A1P9c09UfP3oYdBrHLQzx8zjIGGTBgxW?=
 =?us-ascii?Q?HUW2RCGcJCYZt54mRTOoxqpb7QpISe3LLL70eBuThR91xwT1ihDq9X5PcSFM?=
 =?us-ascii?Q?5pGTO7S+19vEH1U0dKvMrgfiZyohBg/L14LlausIJrLIAQocpe/j3BikjVU2?=
 =?us-ascii?Q?eloRpN8GG+NSRBCbGZw9jm5oE7VrcnRgmYzoJe2w59YMc8YRlmQWoKnnq3Ty?=
 =?us-ascii?Q?vJ3IWDHo5f2PNg9RUDVbh3hf5pSSdcqXp4p+KDPkXu7LXsrVtDP4fbansG8f?=
 =?us-ascii?Q?Nl+1+kgvsShKfcElS+C9mxUl80oSiH2uHmFFquS/lry8ICtcelCXIAkOFCV2?=
 =?us-ascii?Q?PuXMW2ynH5lVJitlCa1z2R0sc+f6Sf0jkVOaIgTX8gQBXJfR6q2X0A+jaz/V?=
 =?us-ascii?Q?+ctj7HJnEbKBasSGel8Kz9YLUo37UnG+tOUqG2D60Uk0HdLclG7fReiOwszT?=
 =?us-ascii?Q?1/UMPo5+bz3L+Zici/23R4EA/jMK1j/lrpPCRTnLOx69vpvoRFlU+ysaE9Fl?=
 =?us-ascii?Q?cf6mQoraGS5s4jOBpB6RyeNgLeeNmBrBAVG6Xt2XPUZXt6lOfR6Hep8JsHBv?=
 =?us-ascii?Q?ulWMg5jhblUxXKApi5z9XqkzBno9sUmIBAkb6BtKgbbIcTwnYBHLssy8Reuq?=
 =?us-ascii?Q?ebQ+pBpIj1VeHIjqcOiDg0wgWhado61L2nFsMTu9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8807c8b-5fec-4e8c-889c-08dc43977f0e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 19:55:13.2529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8xd1jbdQPJy4iZyj+D0zln79b7aV4bCsf8F0vAs+LAJLJtaZB4vWS6EfKiGN5P2GdyFzMe2Cy/q9hrbOYBlqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5254
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

If xe.wedged module parameter is set to 2, Xe will be declared
wedged on every single execution timeout (a.k.a. GPU hang) right
after devcoredump snapshot capture and without attempting any
kind of GT reset and blocking entirely any kind of execution.

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h     |  6 +-----
 drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
 drivers/gpu/drm/xe/xe_module.c     |  5 +++++
 drivers/gpu/drm/xe/xe_module.h     |  1 +
 5 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5f0a2bdb7c24..296bc75a55f7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -774,3 +774,25 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
 {
 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
 }
+
+/**
+ * xe_device_declare_wedged - Declare device wedged
+ * @xe: xe device instance
+ *
+ * This is a final state that can only be cleared with a module reload.
+ * In this state every IOCTL will be blocked so the GT cannot be used.
+ * In general it will be called upon any critical error such as gt reset
+ * failure or guc loading failure.
+ * If xe.wedged module parameter is set to 2, this function will be called
+ * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
+ * snapshot capture. In this mode, GT reset won't be attempted so the state of
+ * the issue is preserved for further debugging.
+ */
+void xe_device_declare_wedged(struct xe_device *xe)
+{
+	if (xe_modparam.wedged == 0)
+		return;
+
+	atomic_set(&xe->wedged, 1);
+	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d10664d32f7f..de3149baf82f 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -181,10 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 	return atomic_read(&xe->wedged);
 }
 
-static inline void xe_device_declare_wedged(struct xe_device *xe)
-{
-	atomic_set(&xe->wedged, 1);
-	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
-}
+void xe_device_declare_wedged(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 19efdb2f881f..987a57205fc4 100644
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
 
+	if (xe_modparam.wedged == 2)
+		xe_device_declare_wedged(xe);
+
 	trace_xe_sched_job_timedout(job);
 
 	/* Kill the run_job entry point */
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 110b69864656..61272553f40f 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
 	.enable_display = true,
 	.guc_log_level = 5,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
+	.wedged = 1,
 	/* the rest are 0 by default */
 };
 
@@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
 
+module_param_named_unsafe(wedged, xe_modparam.wedged, int, 0600);
+MODULE_PARM_DESC(wedged,
+		 "Wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
+
 struct init_funcs {
 	int (*init)(void);
 	void (*exit)(void);
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 88ef0e8b2bfd..0f95dcd8942f 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -18,6 +18,7 @@ struct xe_modparam {
 	char *huc_firmware_path;
 	char *gsc_firmware_path;
 	char *force_probe;
+	int wedged;
 };
 
 extern struct xe_modparam xe_modparam;
-- 
2.44.0

