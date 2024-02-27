Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30519C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 18:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35B810E825;
	Tue, 27 Feb 2024 18:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dEMwUrxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB65710E7EC
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 18:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709059061; x=1740595061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eT+znjwKvY8GqO2MZl6bngqQN7Mryf6Ar543xtfWfsk=;
 b=dEMwUrxWEqKg9jnlubAZo9njWxDjCZmIfbMQoCx5qJGX1pjqb6EtNMcR
 F2o+dmx0oXwirbSZPpSaS1A+p9/KeoEPn1tbKyYci1c7H+ozq9BSFgrTr
 x4DSS9uEeE5a9XhRsahlfOAyXbbdta85T8zP5VGC71LRfwdwfpuWZf7kI
 x/1KYTTTM7PeJGvbLMDHRNfknu2DuLxSeQaFhoztJKqoj10uNIef4jJQh
 WknRRqJCNwdIKe6VWzgG9+PcUCmuyu0IEo7+qjAdP5sq2G+an1ttMhUaJ
 fUW5UJP6Trd5ytQ+pxAMAc26een45n5Pz7PznPlyjotiSCy3dRMN9FBQj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3585891"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3585891"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 10:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7573813"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 10:37:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 10:37:39 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 10:37:39 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 10:37:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hb15vqCjKjyWpIui/liXXakfr2eFhpWItD8SVqZgnXYsLnToxz5As2DER2leYwSqMYac90PXsHTqZSxGJG7oNnU9PYW4rDajn9vE9rt642zNa8BYD4R6gmKIVdM+kbaS1qpgC4yWUVpyZ38Y6E27xKV158g0rYWsa4dk3dy918DFTYErCmJhB9v1pPBgr3NglyJTYHb2j/VohIszv4Zc52bD4e/u2rviamT0QCyDeTik8foXHCLTahkfUGsrfkRrGyUVnWAwKtj1a8DT3XbNt9AKc7Bbx6E1sNRyzh81nlRUSfUIqGgk40qtNa4HD9IMfPOdf6kb2nDRCTb9nyyoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/Ll9zF0c2DhFHYBWYXjcQwpVeJAFi0CyXP1MW8v1l0=;
 b=aEpEBq7e0qE0KzxN+gkCyQaZyKuZCBv98IQihb7ARXH7HmGecuUzPnZtOtQRWX/7Vp7kp4+WaSlDn6P3Ml8XJJV1J4av0UUIXFo3beJ5mU5YfxKR6/hNcvX8AurzYwZEhcTfPXhAKOTmLimCaai2jvbeXFt+qhUm9R51XrVu0MSHgeJiXSS/E5v7zYnTPUJIN9hKYIhBF7QTpZFXzmUK/ZpHU2ERd5IF8Z9Z+ZphQhIBVD9J4jVYxfcI72YQrInLbaUCMvyVmj7nOliYruNFhOvm4+wUCFOXvGAG1uLsAOJm8tmvgOzAaLWz2mfjTAbmYpValqwkzlSnljh2ZpuflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Tue, 27 Feb
 2024 18:37:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 18:37:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>
Subject: [PATCH 3/3] drm/xe: Prepare display for D3Cold
Date: Tue, 27 Feb 2024 13:37:25 -0500
Message-ID: <20240227183725.505699-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227183725.505699-1-rodrigo.vivi@intel.com>
References: <20240227183725.505699-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 27916d64-5aa1-4494-b1eb-08dc37c32b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2zW4Or0xJ6dJgiyZr28e4ttvNcQ8OPsWbgPKRK3q5eTG+AUuauzJe2rBqA2XxnearB9ndONutL5Kk/CHHgrOeBys//DFPZ64yNHfSrrcV7ojfrUwKWbABRPbQ5GsM6FhLjX5nlRhGCvLsOtgCUQfHjL0MRv9Aow08wQtwyu3Iq+vQrVseEjxmEsk6dQRFEDuZX2eDzQokvRapGe15F8AQO1WhCij9ZgQwPble8pP9cxt0mGt1uzZuj/idz1D+OP+80Zx+BhrVMeUM7oRn9tvCS/UFANQJKo+dEwN/PbdjYRXZ17xqTt0dT6Y0STZqH5x3YvUDVF8vsbKEehor9Enm+3xUb5ILvEUvUXbGmA0jOSp75vWvwj/5Ti/vG1OmLG/86Bw/gqq9HK4O8TadAERw8ER7JUEPaL71S2BptiwIJywg10mJmOD8OmYJSaf/70KdTHxvbb7XTCV1OGcerBRhX9oF8U6TqKL1RVMHFXC6zzuSgf15cQ5IHkyjTDVoGpRCL9tiXN3fJk+SSbb1zM6h0J4LDrSHwVb3dpTfdkrckQWa4Q4ZzBKaXDItQsfgKq2SOY0LKnzum+xI3XnJyE5kQjlPCmuF2isR3Izc7H1WpAB1vDpxdnBhVJBtz4FkPRQBE4DkV7KBVm1J5e+IjUYIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nBlR6QE6+bJs6bzTfrMp9mIjK4cWILI7BI1PQ/EBTQgOMq6QkpvkBNSUWBfd?=
 =?us-ascii?Q?iHlGu0PB0QMw8nDiyoPUVHDRO7SWoO2LRiX+RT4IWPbTj/IVETiF75IWP5Mr?=
 =?us-ascii?Q?7vWRwkWwUb1moC2nldabZi5ithzoYZZnnKtLR96QX+mGjFCfkvxDilwQvVBW?=
 =?us-ascii?Q?C3cQlwWAGMvzsuvqmz5zf4aUc3YoVpFsE4R0Erg5Dqv3AE7gMcBP73Tl8zSg?=
 =?us-ascii?Q?uMlnWBl+T4rk3cUa75q4qHzDz/Z/0NmEEl7G48oFuCdL3fdtq5ztBcdDOdDl?=
 =?us-ascii?Q?jmbuWPZjtrP1S428YtkCBh/gP8Xh+JlBAxZng/Ry12kJf38l60ltO1r1n8Fx?=
 =?us-ascii?Q?BXdHB18sGPxUyQ+A2mHd1AKbVRApCL2s4z21VN7ha7aaKgZw5fTt/gGrYsEd?=
 =?us-ascii?Q?X1kZgifZAXDGTTT6JZvJzDKYtOWR24/sIWxZ5CWkcinlZe0pQJSxteIcPj/8?=
 =?us-ascii?Q?IKqgBjcSCKKKKIByfimUQ6TySY8ewuE/WV2JcFNvETiMCeazc4cGWWebELTx?=
 =?us-ascii?Q?vmA4kygdGYEudHaYn5WKX+TCBDLm2AzIDRrzV3fjoOtLXOaeds7yMqp6Me9g?=
 =?us-ascii?Q?GSgG81K2iGzK9z2CEck7uglZc3NdeKZPNFua0vuOZpStyodgpjEZpHFf7clP?=
 =?us-ascii?Q?1c63dPMPN9KLp/Veq8QcDgNsiBM1i7nykBJmtdKMh+GkjrZwROMob2GQkUF4?=
 =?us-ascii?Q?lFGW1AyYgqp0Fw/3Fqedyh05HSDHlMjC4ilVvVmCKjzgEoAOvs+GeqZpSIY2?=
 =?us-ascii?Q?WigUD8MUy8BQa5gsdouQUTMqiEJwwyegfy33suDwgCAmGjeo1q8NRUHh64BG?=
 =?us-ascii?Q?66Jn96e0mwruzT4a4yALj/LkVy7jzeuddqGhoiPZstZ408s4lXYrKhZOsCbm?=
 =?us-ascii?Q?pMek69Vwb6yx9G5iIJaVQcAevNoCCJOEP9CPrVWFrZhNfwv0S2ZP1kI8Zk8P?=
 =?us-ascii?Q?H3wgPhn8uvk6xHLIupC0uZqXRWRmKeZzQEORTYj4WvJA9V6HQ6NOeBdjMT/j?=
 =?us-ascii?Q?LNRWc1OP55ZwUSaS27s3hCIT0Cg/qOV55BHtPnJrj8KgmK/FDdzGQMKZYjXm?=
 =?us-ascii?Q?AsZI+JQlBbUGedtlFpeArNMjoK+SaThbn598FFhsmW4aSeBo8RLuSlMOo270?=
 =?us-ascii?Q?hCZqUaSHhofI3Qr8Y3KmKL9nvDzS9KjgSpd5p3ABy1Ij65sNYdGxpM1JqXJd?=
 =?us-ascii?Q?1qqSAh513Xjra32tkp3AOUlqJLAKngWmZMIu59E/xbIkcv7X5EdXByhbMmhr?=
 =?us-ascii?Q?OL+a7j0Rd9G9M+y9ocDa0K+u5Y46Hw66ppkvZB4FXmwtgEaOWTCEQ/r7muzE?=
 =?us-ascii?Q?er9Dyzd81R5Zo/Evp2rLBSpr2o36mZdtEmCFJtXJk3lPzDz+zFveBF7gtcZZ?=
 =?us-ascii?Q?fBdk+xLHQ6FyiOUn+N4VLbymEjc6kOe0fRL2QWecw4is37RoLgoeMPu2UVGp?=
 =?us-ascii?Q?4THD9vDteThod1s8p5MMIg4TnMw9jXTrUvaAx9lDXRITCPN/9zCgpTtC3hZF?=
 =?us-ascii?Q?NCZqL4cIcjsoNMhf3jNRmcAnTwCdGDbdvIj0mee905QzexPMacVkKgyMfn36?=
 =?us-ascii?Q?L02erfzQMPNgV1j7JjGwzI2boMq4+f5V1TDnHSBP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27916d64-5aa1-4494-b1eb-08dc37c32b30
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 18:37:36.4368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOhvTgkY2Ky3/N7MtTmieEe0wkFhmAqB2cSkbgAqgZ6HJYK+7BF0ARNYOSohw2GWcA65O2yddFav948tnulHuA==
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

Prepare power-well and DC handling for a full power
lost during D3Cold, then sanitize it upon D3->D0.
Otherwise we get a bunch of state mismatch.

Ideally we could leave DC9 enabled and wouldn't need
to move DC9->DC0 on every runtime resume, however,
the disable_DC is part of the power-well checks and
intrinsic to the dc_off power well. In the future that
can be detangled so we can have even bigger power savings.
But for now, let's focus on getting a D3Cold, which saves
much more power by itself.

v2: We cannot do the full-suspend-resume path or we end
with a deadlock between xe_gem_fault and the modeset-ioctl.
Reduce only to the power-well & DC sanitization.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/display/xe_display.h |  4 ++++
 drivers/gpu/drm/xe/xe_pm.c              |  5 +++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index e4db069f0db3..a37cf679b087 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -362,6 +362,28 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
 	intel_display_power_suspend_late(xe);
 }
 
+void xe_display_pm_runtime_suspend(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	intel_power_domains_disable(xe);
+	intel_opregion_suspend(xe, PCI_D3cold);
+	intel_dmc_suspend(xe);
+	intel_power_domains_suspend(xe, PCI_D3cold);
+}
+
+void xe_display_pm_runtime_resume(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	intel_power_domains_resume(xe);
+	intel_dmc_resume(xe);
+	intel_opregion_resume(xe);
+	intel_power_domains_enable(xe);
+}
+
 void xe_display_pm_resume_early(struct xe_device *xe)
 {
 	if (!xe->info.enable_display)
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 710e56180b52..23b8e63a1703 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -38,6 +38,8 @@ void xe_display_pm_suspend(struct xe_device *xe);
 void xe_display_pm_suspend_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
 void xe_display_pm_resume(struct xe_device *xe);
+void xe_display_pm_runtime_suspend(struct xe_device *xe);
+void xe_display_pm_runtime_resume(struct xe_device *xe);
 
 #else
 
@@ -67,6 +69,8 @@ static inline void xe_display_pm_suspend(struct xe_device *xe) {}
 static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
 static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
 static inline void xe_display_pm_resume(struct xe_device *xe) {}
+static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
+static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}
 
 #endif /* CONFIG_DRM_XE_DISPLAY */
 #endif /* _XE_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 3e13a666fcc7..a13b97503467 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -342,6 +342,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	xe_irq_suspend(xe);
+
+	if (xe->d3cold.allowed)
+		xe_display_pm_runtime_suspend(xe);
 out:
 	lock_map_release(&xe_device_mem_access_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
@@ -380,6 +383,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 				goto out;
 		}
 
+		xe_display_pm_runtime_resume(xe);
+
 		/*
 		 * This only restores pinned memory which is the memory
 		 * required for the GT(s) to resume.
-- 
2.43.2

