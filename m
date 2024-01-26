Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BB5C48285
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450F910FE64;
	Fri, 26 Jan 2024 20:31:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB36110FE60
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301059; x=1737837059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XuFpk5QpnmBpUSs7+8NgakkphWSet07mljcqiiMjMX4=;
 b=kzC5JLJ6dMI4Ql2iXMIJycOszmhzFrpsCPT9sLmiJjAmMEyjrR/bhDEK
 Okb3IO+L6c/wxG1xhbxpnqvTSRJobKp6odKFVAcMkYXwvuBk51TpXDQmX
 hsYyr18OXGrylDc4aG+eGkM71cy3kOoTacqajwoXUz7an+xQ68J1GUUjM
 snpFaeXcsFSe0dIkxo2f6dhPYDao9ayD1/4YoRXOfU4rA/R7Oyvm2AjCt
 8D++G9CvnlJsIViolDOIa+PrBnMczTBmG+D7eHlaZVZvQL9kR1Llw92ub
 Cb5s2gUHbBrp0hteTwS+EF8TcBAYI9KkQPY9/PMgnoLpPFtUgXWxrEsD6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948137"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948137"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:30:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877481635"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877481635"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:30:58 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:30:58 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:30:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:30:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cp64fxKWTVtWaaZJdxGZkbYlqZb5nsojX5bhqS7Ut2YXghTGjsDaGm9fVwowO+XxieF4t8U3ZQHzAWfzMpXPNSYulSR2EkYkVhxoZA213MNrUoPTbOpDZuObI0iLFdZaBJ2m6+5ZaVI7yoLKj+qSmUaXWBgTC+ZhOBGbpp5BpyBy+mFb+NFzywIOabawLqRIstkp8UH9J8CVaKKwuyKeveAQHHzbz1+8H336gK2Fd3i+q7DosOeOLFA7sINlbAnCf0qD0m5Kk4AiX9wTEw9NAabTr3bTZwQrdfaHSB+O9Xur+8bOgNMt1AKz6xNvHjYcBWHb3jRMYyIDhn6OHGoUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3p3501sdYu2WHrejpizx/A/vITdAkqWhhxoflmHO6dU=;
 b=nu2PQjs0IjSHCFh6oShgigNcB3f3Hg8SsCmaDz05K0p38o0yMa5o2AaHJUDDJ1lmPUPh99AiMZqPQO4HOXglAgZ73Gv0scSueCmf1JcBP83jWay9gyDgQ7zwlQAi7lhEA7a0J8enJdkIm7idPFiMuS4AnbKeyDg8hQeaqmi0PkA85tYROa+3/qH9r+amiww+C1cC88XnEvz5GyXgoQkkJ079h0IFMPDyxqUncxTC9J/GNJ+eaHYiMwlVi3/pYesjnwBozQj+Wm9qvMdnGMuVL4cBjyGKN9foZsIzFLoKuIFHlAVuRe2z/l/cV9pfgsTHcI5281wDjpAAUzfYW8DGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Fri, 26 Jan
 2024 20:30:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:30:56 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 03/34] drm/xe: Fix display runtime_pm handling
Date: Fri, 26 Jan 2024 15:30:12 -0500
Message-ID: <20240126203044.1104705-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:a03:80::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 084b7126-e1aa-4cda-d78b-08dc1eadb2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: piK05hkpf+SmooQr5OTVVMVE5xq/Xm1B0wmm7Xj5y0NAuFLxxAY0tDMwJlfR38usa3f9XqP4eO49SrEjiQJYUNDPC8YrtIxTUgO90m82uTTgTsYlu24AFqwQ5dwJYYgChZiekh7DkS6m7Qgwb9Oyw75yTHLAR4WuvAtQrPkhDXCv+8JdzzQBYf3et7Fc/IWwrVrAr0bZiG0A6UbeH3bwqUQ8YEWx2UC/jfDYGybe9hs5seMU1Jwucm8M2vNq2ML4+zgBfFgKNHXGyKerOlm1dnT7ImSgYo1FWVWSnvc8/hoSjErxLEnu1MqrgLebTgz/1lRfiy/V23bUaJ/Y+oLMHPEu9SKN9hmlbrL3VZfAv6vyAgBYOJCDXaOI+amHJY2zo6vIFhMJ4CNA499TJkiG4NcXpK6InqHF2zZjwfX7DvyB4HgvsmTYj2W0W1K2/O4DHjXc+XrJZQj+RrBociWbME6rPRt5IPjaaHfvKN0bwBG9+PuyMbLAy9yS7jY0tOWILKXz8it7ENaoQ4rACHyR9LTzf8BmEfH5Ze9+p3FWTyeO/rbCzLOu4QwsDZxb1hgm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(83380400001)(26005)(107886003)(6512007)(66946007)(1076003)(38100700002)(5660300002)(44832011)(6506007)(2616005)(2906002)(4326008)(8936002)(66556008)(8676002)(66476007)(6666004)(478600001)(316002)(6916009)(36756003)(6486002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PbPN2VmgkJcmhvajbZ5FblAMEeLFmNzthENED/MBj0cJ+Ck5BsoS6yXClGKX?=
 =?us-ascii?Q?gRQZ80Z4szPKnA5zcGSwriWRBmGPVRXUfShgof0TKLWqPuXeGPKdQrfL2jDS?=
 =?us-ascii?Q?zHN+HkDdOrZKwmSDCXi98a7SkwQWlhkDqBplj9RT3t9PzWXEEJK0jayHQ5NC?=
 =?us-ascii?Q?PFzz06zCeyqF0Xs8vCoQidoRjquHF9iicqD5JJ9vt0I3ntx8q9rBYQdGx/iz?=
 =?us-ascii?Q?0gzGn2DWGO9F+xOzS6jR2PeF5dmMcnIZwnMF5O4I6MDTS3SJGBEY/ao6TVPN?=
 =?us-ascii?Q?BufDTA9Lzu3xLHsiubpteELPvfwKOXUao6zQ8LD9SgnRCg8nthC97ZbLRV91?=
 =?us-ascii?Q?3+1FOdgB+vNftK6Z3qtKM2Dl4ZZL96ixxA8o9pOLtSXFe8W8ShSRPFfXHLkO?=
 =?us-ascii?Q?WN/ouW17RaZD42J4GSaTqilio2roNSx/f02/rfgZ1Pd7N7qC0LLHAX+7+Xip?=
 =?us-ascii?Q?Q4JUIo9cfH095p0aP9OnA4IoNSPLgMCAhsVNDhzZpzvwF5gy/E+c1RL0FRim?=
 =?us-ascii?Q?RwCn2+RJ6QhTAW1S1cFvDesnSfDiuLItz+yictS6C5ssSvWeLFkP9535Ehwi?=
 =?us-ascii?Q?8NrSzZMfmkpkqdc6Ww2V6lKZidPiwOmasOHqCHvi9/lKpM65GjvHBBv7BcdV?=
 =?us-ascii?Q?YFNo9W/BLbicfA9xggbo4RQi8qETBHYWETyFPBMC2OnIsP9F8QkCM+JvhDbY?=
 =?us-ascii?Q?pot8p72vNh9WDVrg65Ux/XWkztW/xg9wFW7RCGYHhCbgFFawYhWTTRrRVDQt?=
 =?us-ascii?Q?UDk5KUwUdGUpzvXup6O4taytJOyYcnB1t0oVvzLnMSYm49CeimCpd0FvD+Is?=
 =?us-ascii?Q?+Oh+kSPleSGZWs0vdMzNhsJZ/DtXfw5oUd2wdBwW5Zkxe0gtXlKepWqaTlt7?=
 =?us-ascii?Q?dE+b/M1ymuc57jMHUGu735fUuPfEAmDJcaOB/IVyMsP5ZIQ9oghL03F5vGfA?=
 =?us-ascii?Q?CMrxrKG6CJsEXphXPkfQSmq5j/u6VaiUmWvm7+/bdxCCL712SFVFPu6nHF9l?=
 =?us-ascii?Q?AefMzIoIMUxJNUa3ueiadf7Q0dEo+UihCktxBYrSmqRwZ54KWFE163u2CvSS?=
 =?us-ascii?Q?hY0DnyaqA1jYu7ap6pjy1lP9wqk5PV/0iLbrb5aJD8awLzrUCx1LPn416a8y?=
 =?us-ascii?Q?/iUmRVBHMQNTh03v9aXVoqja3PoQXa1MrPuC30oG7KrVMw1MtSg7cO+lB/a3?=
 =?us-ascii?Q?WLhu5Uti2lC4gDhm7sanjIH4rWoAW21PCFmbGcIymxMyUvdtOSSWSx+mNX24?=
 =?us-ascii?Q?vLn+5p1rRovErTVQgT0S4iVgKCL2dRxhHVl2SH7n8sqZ7EEfq48VCHicihS9?=
 =?us-ascii?Q?v2XCT+xpJ/Q9vpyWzgK6Xd+/0KxV21oIYPoRLMDmykVLfuADhc/nV6zJBS7+?=
 =?us-ascii?Q?g8c6SCLW2KJQVgGB+SG0IC1SjuFSWUIa1Hsw+WCet8IZXp7Y6yPUtZx18Clv?=
 =?us-ascii?Q?QxrsKYLOFOp04dF6MhEYGOebiqko4V6XAmq+l1iklDOja1+2KwkVGpvVG0ac?=
 =?us-ascii?Q?iPaZtAJi58Dm5zxh05uOyjXUojCYPTE7rKTPnY8sS8BR8cnFyNMXK0JJCmFt?=
 =?us-ascii?Q?X2iPoFFOB3EUb4l1MYDn5X6L7QnzhggFlOV+y6Py?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 084b7126-e1aa-4cda-d78b-08dc1eadb2a1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:30:56.0139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLxaAnwORgEKaKB0ZOumQePm9MxZ522O9i2E6u4WM6u/Vqx2NY53KJXDo6+qZh1zmi9W/ysWvf/ScC1BWR3ZHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

i915's intel_runtime_pm_get_if_in_use actually calls the
pm_runtime_get_if_active() with ign_usage_count = false, but Xe
was erroneously calling it with true because of the mem_access cases.
This can lead to unbalanced references.

Let's use directly the 'if_in_use' function provided by linux/pm_runtime.

Also, already start this new function protected from the runtime
recursion, since runtime_pm will need to call for display functions
for a proper D3Cold flow.

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
index bd35fe9f6227..19f88cb7715b 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -417,6 +417,23 @@ int xe_pm_runtime_get_if_active(struct xe_device *xe)
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
+	return pm_runtime_get_if_in_use(xe->drm.dev) >= 0;
+}
+
 /**
  * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 64a97c6726a7..9d372cbf388b 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -28,6 +28,7 @@ int xe_pm_runtime_resume(struct xe_device *xe);
 int xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
+bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
-- 
2.43.0

