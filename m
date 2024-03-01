Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B2FC54E49
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 18:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23F910E662;
	Fri,  1 Mar 2024 18:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEOvNf/j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542CD10E662
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 18:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709316342; x=1740852342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xFPE3KePAt6/qa6c0ktDdxcHTyqMoz4d7aslBZv+mpk=;
 b=LEOvNf/jA5h36iKAPqVrXmWdulo6AGT2JsExsCsnz39r1cK6tZVdA5k+
 E7tW5hIq24hcFC2gN23Jkz7Zqw+x6WznyeRNtg40LiqudkVCCa/d0ITq8
 UWXqytC/zuPRAKoODqbgtp7EI+Srs7upkqP4w2SZj5ExFDLtErhIeXoHq
 WbkWf0JkBCQgjlIOsy+vc8STUjF/e2j9LwzNh5muf8jw6mV6hqQrV03f/
 XBW0J01SfKwa7tID2GnJqGEeB9hSENFlbyPFPej81O8kKCbsM9jsnhqDu
 W/k7v1S5pc5PnZnhn+fNj/o27pF7XaxKMO1wOD8GHD8SgZnGc1KQEDU6v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4038600"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="4038600"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 10:05:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8700351"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Mar 2024 10:05:42 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 10:05:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 10:05:41 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 10:05:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 10:05:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSFFZ/pO00x7dommyKGVnif4/whH1KSlx+203GeKLhBuRqnuYqETSSfdyqehK1PhsMDZIwdzIUtxkXR6gSGMoTWRbpOug/kKqClgscu9VqyFm1nUauEv/tljCn5NI+qz+F14EMAf3prN/J8BAcpwjpM2BMq9czz2G37X+pjydYqAaV126Mof9nwKc5gycDerd10kBX3wFZDgstccIvcblo751xFV2FuPykt9f72o/IdgWu/yf3WdS3RXqS6BK17JBbPPjGwSUMc5SylaaaIr3M6iiXtnWyUe8a3Er9lELcmLODlQzjmK/YgWRH9nLWncRU4GdnKHr62dnwcu6UoMZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7PAJc/3Ugb0yZ6Rf2Fo84IW7yjsOOui8UVdtC89J/0=;
 b=kq1IxMOP7l24IGaCtJDu/GU7L+GnO6am2Ev3JLqWzZOCLRY5y7bkCCar0+a3kiwtFVeK96A9ejvw0K6YWTsqpJuMQWpv2j83wlQttmPZS+nBvdiOX5ST+3Ra8Ip8WBTOzte0Ln7elOnnZ5IvjZVm5wSSXoV3DlA+Ph216SKd0GO7z+BkzPmtdpGhgNWM5l0CeMME5QolOWq/sYtEawomtuP9gg5uxU+t3OB0XUETS9CYCJGL9geQefblRYAwHf0A4IyizwC+wP/k6gZeTdaz0+kU1H8uwzsTjDP4p/XSJqBm4Ce21T0WtTC4Pc8gY2lAvBePOQpMw6Xem3gQkDZZ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Fri, 1 Mar
 2024 18:05:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 18:05:34 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>
Subject: [PATCH 2/3] drm/xe: Create a xe_pm_runtime_resume_and_get variant for
 display
Date: Fri, 1 Mar 2024 13:05:24 -0500
Message-ID: <20240301180526.643505-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240301180526.643505-1-rodrigo.vivi@intel.com>
References: <20240301180526.643505-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 022648e2-8ceb-43bc-bf10-08dc3a1a30cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FbSV7oMyqHd8iQno9hpFbHWEymOfXU2/kuCDrLaaJGCdcD4M8VN58iJID7tl0mbiHah/vo3CWlda6fcqcM2/E8AzbNjPBKFMwxpnqr/YwKteaTGSQ5OgcEfpeKm6PoIsNO9gVWNgkKMKU1Z4pidpw5n3eh6v3JpGeGZiGgO6zzJoICC8qgt3QkBk2Lr1rkRJdDBhAwFiiC6IhI6ZIBNXgShmtja+3sRyPPu9ir2LykObqnxX3swv7pkOr2AlOy0AJB3FDgWe8s2Fvhp+ub/1NBJCqW+P3ds0N0l9dlFVzJ1xRM0z1TKpe2a1AlFVQaZoNZdS6JluB/fQ+wclgsr/eMO1xx4Ox5oVdtlLuNyd0e2xXSdUksoKFUCOUiduHznI0tzOkIYH8Lgk/MOawCrjq4+mJUHpBos08HFHgz2cYOfVPLgiUcS1Uj4OPEO1fXtRl6x48ZTmZr1I/KNO9ctYEXdNzUcLzzw5D9T5t4DMqW+1pfaGIPBLJxuMh5aQa9tzJ6yiblwd1s8bJv9GB81zSZDwPcBIxffh16I0QrtIeLRMOHnBdh8EhiuSCI3E+jnBWlE6byaxzRQ+Vb69t5iDYP0utVWGOITRlBukZ4YGi1wUdKbXK7Ltu8/WcPIluKo4EgdRA+FzLTCJuVptA72V2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fjWzoTY716GRj6K21gZI4Diu2ILDB4LHxhVj1fd3bnWhaZZ8HeP7unH/ESB6?=
 =?us-ascii?Q?AWxlQrY7MUXJDpZF4kCzaIYyLMX9PMZGiM5TIDvexv5OiRXDi22zDDF49zX4?=
 =?us-ascii?Q?XaKPYO2OoBw3jn/YjFyfylmH+Mj3QcRsjcBkJTDKNLczBjdV4yFBc/Oe52I2?=
 =?us-ascii?Q?wgtvnbceHZcgtTOI8FeoTYwsdv6veo/T5CGdUa/6wCaAhrVEB4eXEqYWZWXl?=
 =?us-ascii?Q?4Yk7IaGoe+wncPKBxzwc2OR1Otp41G6jFZef4y7srifAkzO7ObII33gfh6nL?=
 =?us-ascii?Q?oNtOejRzRDZ3zGGukRYbGB8isYCLO8AjkW8D5yHILbJ5UCRJLJZ87l1MscqN?=
 =?us-ascii?Q?habX9+bT2m8GR1dAgt4NIKEcIL2Fa9I+SKJ4DQl8FCdqxTOmgSfIpzij0o/V?=
 =?us-ascii?Q?jtDeJkP6vwEPqTVja1Ntho8oTY9PQkShx66+CgX32Z2ly59BfYmmfNpQXvOm?=
 =?us-ascii?Q?Eq+Km0NxnBU+ABT6vJjFpwdXJkNZ7m0nfR86ZhNmf4RQwUcLoR9UyLu3XVR+?=
 =?us-ascii?Q?ChCBOTQ5YFmHYB1tkbMHXg0U5HX5f9Aog5/asHBEjMwhsd+W0120V7BavRRO?=
 =?us-ascii?Q?HHYZSOi9EFNuf/bu0mcA070fPL5blMh49CIn09wQhMiK2ixSV5jbLCSSeO+m?=
 =?us-ascii?Q?yFWL7n73Y9hbOuKbHqTGt+F7GNJtVqk3fNzEevnB0xS8yMwGg/qKFM/FlLIA?=
 =?us-ascii?Q?+ft1yCsTO9qfwVAIgkICeMMsyQkwDJJaqLlYNixj9xiGYkuV2DqbZazOxxFz?=
 =?us-ascii?Q?hqaiAwUIDYCDGteXL4znCwpTwUXsDsKW3urBeniQ7q+QCJamghbM4OTrXJWw?=
 =?us-ascii?Q?NKYayzvM2Dsv48W8usnqedw3r7unWsuwPxnNaWR5uoctaYlVBx70mTOYe2s1?=
 =?us-ascii?Q?y+m8RHhb9MCjwMUUrzzf49N5daanFPEL5gHuRuS+WJ8UGNeuQjvzKbNBDdKh?=
 =?us-ascii?Q?tVNXQIbYlQLYku7FbdGWup80vJlQcEmNK1dlIUCHfGMNSNI/9fsi1f1MZeJN?=
 =?us-ascii?Q?78M2kIZtqUTgA2o1F2JCIx8rXVTvZTAD2V/gtL4DTL90lDj3MDyam3V5zdZk?=
 =?us-ascii?Q?q/Uza6FGWCeg/DBnAt8L9baGcc5uOxHJfKQzkSGqZqrkrbGuaOAnDuheKm5D?=
 =?us-ascii?Q?/ibNWU4bqR/GPtXB3iY+9tAyaakbhh757X3Z9WebETKOXf3oIApTxVXPzxP3?=
 =?us-ascii?Q?1/1C5ao/h8NSF/GZasAW/xp/fuoGeLHZBYtaDqhJoXk1k+9K/dpQb07ZBOfl?=
 =?us-ascii?Q?HT4LTcqpKVf5Ncj2cC7Iu4qJDm4+cN0PTGHswj6IO0UWgK+NtU1AMNC8hV2f?=
 =?us-ascii?Q?JSEVBWT0x0APA2wCWPg1b6ewSCpZcGOGo26k0LDRmUWokygNY7VLyuYdwFRW?=
 =?us-ascii?Q?19V3/ubNzzFxqych0oanU/ZE/ta7hH5vkz5fAjti+arOmuTeil09GDNYr4LO?=
 =?us-ascii?Q?t3vi88wG+lMjlg0r/iIsq4K5+zgAjMr4RWGv23yZVCukPjHGJSYugSN6MLZC?=
 =?us-ascii?Q?VVVl7NEI2Sh0XEyS38OIz7YzzCfrJd4hfXXll999n9ec6qxg5ZYgGTwJCSdT?=
 =?us-ascii?Q?6x4EwpNC85dSiz4lEF12aHkZacUPC3HfIKV2dHVa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 022648e2-8ceb-43bc-bf10-08dc3a1a30cc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 18:05:34.3758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqwiFqs3Y+YCR+u6UdMDnlbU04FGPr9m6bdFF1M1yQwGyNCjzliUOYITezNT9H+x1p9znL0xr5BSPVhOQNW+tA==
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

Introduce the resume and get to fulfill the display need for checking
if the device was actually resumed (or it is awake) and the reference
was taken.

Then we can convert the remaining cases to a void function and have
individual functions for individual cases.

Also, already start this new function protected from the runtime
recursion, since runtime_pm will need to call for display functions
for a proper D3Cold flow.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h   |  6 +-----
 drivers/gpu/drm/xe/xe_pm.c                      | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h                      |  1 +
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index ad5864d1dd74..fef969112b1d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -166,11 +166,7 @@ static inline intel_wakeref_t intel_runtime_pm_get(struct xe_runtime_pm *pm)
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
 
-	if (xe_pm_runtime_get(xe) < 0) {
-		xe_pm_runtime_put(xe);
-		return 0;
-	}
-	return 1;
+	return xe_pm_runtime_resume_and_get(xe);
 }
 
 static inline intel_wakeref_t intel_runtime_pm_get_if_in_use(struct xe_runtime_pm *pm)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 7d7df78f3a2f..3e13a666fcc7 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -474,6 +474,23 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;
 }
 
+/**
+ * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if awake.
+ * @xe: xe device instance
+ *
+ * Returns: True if device is awake and the reference was taken, false otherwise.
+ */
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
+{
+	if (xe_pm_read_callback_task(xe) == current) {
+		/* The device is awake, grab the ref and move on */
+		pm_runtime_get_noresume(xe->drm.dev);
+		return true;
+	}
+
+	return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
+}
+
 /**
  * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index bb4723a98405..29c20099a3f9 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -31,6 +31,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
-- 
2.43.2

