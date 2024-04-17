Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65453C04FFE
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA5710EFDA;
	Wed, 17 Apr 2024 20:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QviTAxqG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DF110EB48
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386412; x=1744922412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4n+QsI8cM49ElzvqDJbhQxMd9GA9b9AG04xMuAQXlTE=;
 b=QviTAxqGbWJqTVB8M2GZfe1FNSeXunPOsB59Ul6O1HIoVpzty3wUJnZ2
 YCYkUPuz+aAdQDO01xQPDQ8odFBoL9GzOeraJyuH9Mrnb6ZBJUGDOsYVX
 bImeRBv1COQ/t3/1oAfeXY1OZ3El6OpSk74JA0YnNQOkKgXpGxK6iX6di
 hBfrc/W80w0TK9X8hyx1dT4R9FtjiXUhJ+IXnP/y121ZZtHAGnWc2Kui5
 TSRWyIgLZdXSR+sQRn3WSGtAFSnLYxk77BUlY2vNzgTMWpORMHZ7gp37p
 wPnr4vzW/8xsX6C1KeTOwPimXfErVIAwe7qweJi/qgO4QC+IzM2SQ/FoL g==;
X-CSE-ConnectionGUID: qVJ/Puy9QxafMC9QIHMykQ==
X-CSE-MsgGUID: 5G5H4BsSR6mMN3fcgmA0Gg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20049642"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="20049642"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:40:12 -0700
X-CSE-ConnectionGUID: eycgcVSoRnWxrSeuZ3whMw==
X-CSE-MsgGUID: 9CuK+9iCT0G4cnF8LtApKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="22747022"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:40:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:40:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnA60Hfwiv3C8aMT6fGjapIq1cn1D+F96Wpn6WrZjr4gyeRdn6h49LBjBtNSSOcyA1JP719AXZwqFaYKHpQpGayHKhTh2a8H6chleUGNwh2aL4dsczB/bTkg18nAhBoj9+H2rWDsfxfl8lY5IloLGdc/Q/POVhbMC+1cf193fZtFJMQDxyYnbzL4cQApahC2rR/FxbEGpCddAcwNgFXXIW+HevzYA1nMiiZgnkR8O7scg4xZFIgKqxCbiOT59QvfugEqCJfpJ0sJguSGXUmSVFJN+6AA1rvf+82G83QzoX8EO5JnB6zsKcmxEXh3j1Og43wQGeQfB/uD7VfOxpSMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bCdkYsMJBHO1nDMA8VP/nHMstGiJB5M3CoEtbB9jZU=;
 b=MXnf76N7rpYfYrIkTQ31v88TCt+icRvIKqHAFZSi+37c/COAzLUrUTvCR6GaixNOsaOUBRIeS9jRnfko3v2BYrg3mt0qIyMTfKjqs8wSGFAXE8G3Vq0BhyFr1FQB0BUuDySbQmML2gmCLsaQ3BOdQlNbYf8AIWkxmcYcIr4B5CgMPIkOEVQeAT8OQiBcKbBjn0uxG+daaOOZUVz82jQUJ06uT6wRggRKg0YyTszOOk3kBBIdlgQkGk/jOqn+YNJQdePsiAzyX9XTvH9kIdLzdFrv6Sss8rJLrArbCS2yl89CqsPUsqM+9Kec9AKsvnVR+t7GaCrbM4eDUeJIOJUa9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV2PR11MB6048.namprd11.prod.outlook.com (2603:10b6:408:178::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 20:40:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 20:40:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [CI 04/10] drm/xe: Move lockdep protection from mem_access to
 xe_pm_runtime
Date: Wed, 17 Apr 2024 16:39:46 -0400
Message-ID: <20240417203952.25503-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417203952.25503-1-rodrigo.vivi@intel.com>
References: <20240417203952.25503-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0034.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV2PR11MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: b56cb66f-a041-450d-05fa-08dc5f1e925a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ZKkq4SdjGl1DzdyOH4cZF46s3f9a4xejLJaouWjx+32ei+Nqw5RhNlgGwmAo1BEo3sjb4D0d9ff3pBIjid6Y+jmoJq2D2Lm3z7nL1HcGNHE8RH5zvK1jGkZr2pcOyz/uTrt+oh25VXY/M/UALpB45RNvj98hkzjzJH3eDVLtPqWkuqQZq/KbXgbrHMXh58OzwgMQjmsYZGB3iZT0hUhhkSTtE0DSxielcCcAqljk4Hkf+JvZHV1Qxw/ArzNOxIOVNTj88XSRjpLJjst2ODEL8rRM5WRewDfXRYdDXc0vQrUAmz4yf1JiWAir0Pd62FpBvbpCS+yILaBtwGBj0JvPf/SFwcY8ALGZRF/SytfdoKJaBILgkel/kpOCErUUTO6wM3UN12O08Qq9bZODlbKWUJSdO2jSo4YIP+py5VZk+wOoBMmroaIRbwFcvnEke9b2F4QifWce+B6GzCmwvJ5ZoTVRZcMuGtymCetuvh1RSAOHcB7Z9CbcOPRUvp7JyHP7fb0RA3pRm9IyIzCYbYTyRAzXaMaKFpybOWdsEqoOkE7M+aMS2JIg6cm7vbdUHqK+t8f2SfyDuDA31DxaeLSbP6SyXYHtcOVzN/V79N7/TTKjeDd3gFc53vWlCmqh3HSbsAdmOQOBDNSnO5+ckGmtB+e6HYTfHiz7glDqY49/T0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B6FAzIX6lu0pWQynOeQYemsKZswBwWQ3ctohCY2OkEXYVGlQ8RIscVEZPOVX?=
 =?us-ascii?Q?P9sYRU+Se7n71z3MUCmuWImGurZb7ODQcrvR30alMZ/OKLN8xPLvsLCaCERG?=
 =?us-ascii?Q?9cLhViVPU1bc6iTV3ZEdLgPjGUOIYZRXVcvDEYdb5FSy4EhU9ZaQG70QUgDN?=
 =?us-ascii?Q?RnVh2ODMUOr6w/WKn0TMkOVtYzXX0mIZqmNPf+KOyJneSfjUKKmldk40gGjX?=
 =?us-ascii?Q?63sbDSoXeeayPYdbBGLMA7RtRe9OvoYSPHoVjULGe720XUx0v+bJwieRsUqS?=
 =?us-ascii?Q?wqq8EOseBUlmLpRBvKOWomRisI556bgF8djfRjYb9365UbdISV5qRhFXTEW2?=
 =?us-ascii?Q?5P7A9c3q/8/EGllmGdAwWyOXqn7f2u1tg0wZ8eomHzUfTsTFHuplEX/myJQw?=
 =?us-ascii?Q?ti6eh2jXcQphdiC5gZD22txGa5/2fbWGxdO3YW9HiMeXca4auy17bmyTh/bN?=
 =?us-ascii?Q?VerUoaQ/ZS+Gmb/9CA4Q/pm8P24sq6mggjo3FspqD7HY52QHXplJ0yOrUc6/?=
 =?us-ascii?Q?ofUcx2OSaHNgpBYYYH5Xo8Zr2zM2byOIvTpaUeiu/A+uWysB4ThGwF1yWRI0?=
 =?us-ascii?Q?gSGNTbpYODG7kz/AcIuxiflt4EnKXg1UBPZEjRdYtQaX0pniYtUwOUnB0oKQ?=
 =?us-ascii?Q?sppMpYjNZGKgnylMheDQQokfSLd+AsH6EcnTQzgdwdTpcWFJFEjHC7ywVPO6?=
 =?us-ascii?Q?4gpkgqwYFsJUsRB2g01lOMR4OMrdfSgaZEDJsrQJ41Yp1XMPbX+poTNer4cP?=
 =?us-ascii?Q?IVPm4UrXpxOVuKXNUHVcJEobU2oNZWn8/2FvWwVi5mG5kGMO7RVv5PdSXVR1?=
 =?us-ascii?Q?9k5mXCukYJxwyC9ouXiXoBb4b7RMMwTMRxfv0IBoO47X7ZiYEgp64+H3L5B7?=
 =?us-ascii?Q?tJV37h2ZaY4dx8PL+JGNk6InUhFF5kvv3hPd5UaiNtyjHGHLMxwcHSwEXiWY?=
 =?us-ascii?Q?uDPT1wxnh7dP6wCvwsBfFr9KawzComAkpW0+vRcl4RvN4cVpnTTeE1pR6ZCy?=
 =?us-ascii?Q?yNpqjN8+jDzOWBFdJaYFuK3Qr/UqsNl/S/168z0X9TZBq6EbvQUrbVdtB86+?=
 =?us-ascii?Q?j0MBMhrv/EZHXlbds1Gc+JO1/Pf1YeMqzTe0jQCei2NG0GdXYfoWU7QlfYmT?=
 =?us-ascii?Q?YhP6cpFVvy23ASbd2MXKFBKOCSyLUxtkHkyvI8tAA/sMUX+2PvZGsitfMzbK?=
 =?us-ascii?Q?OLwFRKLMHJOYZJIr4UYjxgqc9rtqkm5XjPZtMmjkmVM7kXOYElzkovOPfQA/?=
 =?us-ascii?Q?ZgcIWehCntxZrBSoBJ4/3JpV+ZNEztlN1MyzZ5W1J7rvEykXgWgZpyGgC+UD?=
 =?us-ascii?Q?lSuq9jWn3Kd8Z9u5VnlSZ24216espTpU+dDuy93TxLMP5rTZmyDuNeMEHdI5?=
 =?us-ascii?Q?egCz3Q/qx+Xgu2W6CgGQtDJk4QEKHKaN5JTwu84FTTIL7WCOcED6/Sh0K9EF?=
 =?us-ascii?Q?qMdXRfaY/uEt55rCBo9akHSMaIkzPiFXrY/ZHydMiGhWTpR39PIvf+sQDBIc?=
 =?us-ascii?Q?ttzbhfE1RYm4EPg7TodnHDG96GE4BtlPF6OR3reV6p/W/Zr+RrWWZqQvLv6P?=
 =?us-ascii?Q?hYWp9Y24lvvPonF0zOdjJ91wE2oVKjf/xUMtv13c5xXcV5XUjfWNFNXXfWQ+?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b56cb66f-a041-450d-05fa-08dc5f1e925a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:40:09.1402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Go439reygpj2LMLsesArzfD6TN6DkinFLFrlrDIDLtdsghi4HN58e0TZ3mJbeSCIhwh4jo+DbwC94Nwy4/HbhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
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

The mem_access itself is not holding any lock, but attempting
to train lockdep with possible scarring locks happening during
runtime pm. We are going soon to kill the mem_access get and put
helpers in favor of direct xe_pm_runtime calls, so let's just
move this lock around to where it now belongs.

v2: s/lockdep_training/lockdep_prime (Matt Auld)

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 23 -----------------
 drivers/gpu/drm/xe/xe_device.h |  4 ---
 drivers/gpu/drm/xe/xe_pm.c     | 45 ++++++++++++++++++++++++++++------
 3 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d85a2ba0a057..4b38fb78adca 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -46,12 +46,6 @@
 #include "xe_vm.h"
 #include "xe_wait_user_fence.h"
 
-#ifdef CONFIG_LOCKDEP
-struct lockdep_map xe_device_mem_access_lockdep_map = {
-	.name = "xe_device_mem_access_lockdep_map"
-};
-#endif
-
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -780,23 +774,6 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
-	/*
-	 * Since the resume here is synchronous it can be quite easy to deadlock
-	 * if we are not careful. Also in practice it might be quite timing
-	 * sensitive to ever see the 0 -> 1 transition with the callers locks
-	 * held, so deadlocks might exist but are hard for lockdep to ever see.
-	 * With this in mind, help lockdep learn about the potentially scary
-	 * stuff that can happen inside the runtime_resume callback by acquiring
-	 * a dummy lock (it doesn't protect anything and gets compiled out on
-	 * non-debug builds).  Lockdep then only needs to see the
-	 * mem_access_lockdep_map -> runtime_resume callback once, and then can
-	 * hopefully validate all the (callers_locks) -> mem_access_lockdep_map.
-	 * For example if the (callers_locks) are ever grabbed in the
-	 * runtime_resume callback, lockdep should give us a nice splat.
-	 */
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
-	lock_map_release(&xe_device_mem_access_lockdep_map);
-
 	xe_pm_runtime_get(xe);
 	ref = atomic_inc_return(&xe->mem_access.ref);
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d413bc2c6be5..02eda6610972 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -16,10 +16,6 @@ struct xe_file;
 #include "xe_force_wake.h"
 #include "xe_macros.h"
 
-#ifdef CONFIG_LOCKDEP
-extern struct lockdep_map xe_device_mem_access_lockdep_map;
-#endif
-
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
 	return container_of(dev, struct xe_device, drm);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 37339bb57229..a1a13d17aa78 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -68,6 +68,12 @@
  * management (RPS).
  */
 
+#ifdef CONFIG_LOCKDEP
+struct lockdep_map xe_pm_runtime_lockdep_map = {
+	.name = "xe_pm_runtime_lockdep_map"
+};
+#endif
+
 /**
  * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
  * @xe: xe device instance
@@ -307,11 +313,11 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	xe_pm_write_callback_task(xe, current);
 
 	/*
-	 * The actual xe_device_mem_access_put() is always async underneath, so
+	 * The actual xe_pm_runtime_put() is always async underneath, so
 	 * exactly where that is called should makes no difference to us. However
 	 * we still need to be very careful with the locks that this callback
 	 * acquires and the locks that are acquired and held by any callers of
-	 * xe_device_mem_access_get(). We already have the matching annotation
+	 * xe_runtime_pm_get(). We already have the matching annotation
 	 * on that side, but we also need it here. For example lockdep should be
 	 * able to tell us if the following scenario is in theory possible:
 	 *
@@ -319,15 +325,15 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	 * lock(A)                       |
 	 *                               | xe_pm_runtime_suspend()
 	 *                               |      lock(A)
-	 * xe_device_mem_access_get()    |
+	 * xe_pm_runtime_get()           |
 	 *
 	 * This will clearly deadlock since rpm core needs to wait for
 	 * xe_pm_runtime_suspend() to complete, but here we are holding lock(A)
 	 * on CPU0 which prevents CPU1 making forward progress.  With the
-	 * annotation here and in xe_device_mem_access_get() lockdep will see
+	 * annotation here and in xe_pm_runtime_get() lockdep will see
 	 * the potential lock inversion and give us a nice splat.
 	 */
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
+	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
@@ -353,7 +359,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_irq_suspend(xe);
 out:
-	lock_map_release(&xe_device_mem_access_lockdep_map);
+	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
@@ -373,7 +379,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
+	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
 	/*
 	 * It can be possible that xe has allowed d3cold but other pcie devices
@@ -408,11 +414,31 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 out:
-	lock_map_release(&xe_device_mem_access_lockdep_map);
+	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
 
+/*
+ * For places where resume is synchronous it can be quite easy to deadlock
+ * if we are not careful. Also in practice it might be quite timing
+ * sensitive to ever see the 0 -> 1 transition with the callers locks
+ * held, so deadlocks might exist but are hard for lockdep to ever see.
+ * With this in mind, help lockdep learn about the potentially scary
+ * stuff that can happen inside the runtime_resume callback by acquiring
+ * a dummy lock (it doesn't protect anything and gets compiled out on
+ * non-debug builds).  Lockdep then only needs to see the
+ * xe_pm_runtime_lockdep_map -> runtime_resume callback once, and then can
+ * hopefully validate all the (callers_locks) -> xe_pm_runtime_lockdep_map.
+ * For example if the (callers_locks) are ever grabbed in the
+ * runtime_resume callback, lockdep should give us a nice splat.
+ */
+static void pm_runtime_lockdep_prime(void)
+{
+	lock_map_acquire(&xe_pm_runtime_lockdep_map);
+	lock_map_release(&xe_pm_runtime_lockdep_map);
+}
+
 /**
  * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
  * @xe: xe device instance
@@ -424,6 +450,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
+	pm_runtime_lockdep_prime();
 	pm_runtime_resume(xe->drm.dev);
 }
 
@@ -453,6 +480,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe)
 	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
 		return -ELOOP;
 
+	pm_runtime_lockdep_prime();
 	return pm_runtime_get_sync(xe->drm.dev);
 }
 
@@ -519,6 +547,7 @@ bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
 		return true;
 	}
 
+	pm_runtime_lockdep_prime();
 	return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
 }
 
-- 
2.44.0

