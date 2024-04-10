Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449D5CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 01:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2D7113096;
	Wed, 10 Apr 2024 01:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gp8jDZye";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C9F113096
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 01:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712714336; x=1744250336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ujvXKpmi6+qq1JQY+yVbmmXRbNilWvxpM7Xtg/lYsBE=;
 b=gp8jDZyexH0RIBxTOwm3gKFusjkv/xuK1qYgKe4cOuJiT/YTyHoQMID2
 rIy/DC+3nhHePNO6p0v95UENZfrrRhelmI+aDkYiITGZwAC1TJtILQGhW
 p284jm0E2Ad/6qtlBSmNpF9xQJOuLtOtrDdkmTVz1bKbqx+6/l4JwSOzo
 Qg+xo3eywL50xoN8xq5Fc+ZwZ2++qYqsq6njGCDqWJNeWvT5QzhnbH+lb
 O9t3tMCoJHWfvVaIBKPmF0bjV8dGqpFuspffG38DNpFUDgj7PP3Ce8M6f
 EDgyLFBaAuBrQFZtZTmp0MJejRpiSPz4xmGTxnqpj3Sk/oKTIi7Ad+wDq g==;
X-CSE-ConnectionGUID: TAgCBjonSBOaDAZ47CCQBg==
X-CSE-MsgGUID: DRygFEpkSlamOWnVNI11qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8226583"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8226583"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 18:58:55 -0700
X-CSE-ConnectionGUID: 1qBx3tv8To6sELa2XDqNUg==
X-CSE-MsgGUID: ZAhH46FHRDG9uYqvirw1yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="57849593"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 18:58:53 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 18:58:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHqVgMte08/+kW2LnKQ09+4B1VgRPh0A//LAiOAupOih4niKuHvaTeIDpyHepK3dOchU2DKhl27lcXESLoJHiITXJSOyRZduYpHbEdlt9n5xwcLuzzPZpDqA2/u/qssiaXULIbKt/dWCrguluw2tphT86uWaEgSLcimOVjgCRzWq3kmUodSxVoUFjgk3cTpnEFmotebqycS7zEHTtgP7dfhjDjrzNcECUNfDjMRfacL9ON9NnnfV/7sBbyRVAUMXvczSSvpBNmp69JIxso8JsALVAGkjlfxCqy/WRLL/7HKcdkvuv6bG2yyahjN137ql4xeLolA7bj1yv2XUO7VuUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMjqoJoYGZ72uWIlPrboBdOptvbUhuBnEKRT6txTRUk=;
 b=mDbGwuLupTaD0tyXxaQE/LDuc6U3k2MFlducL4s+MJw72JVzO9idaKffL207801S2Yt9H/jZcauj0rI/DRg/6xrTsVkVjI+3u0/iIUIDjSU0Fh6QLESkIFz2u8ZWB8C3ryP+IO3B8LghJXPZpIrkJgBgLk9IERHHuB8bu6M9amgSm6LjJeaJVC7MBUmeq08mRKMhr8P1PrhWpqHTXJhaFpVzhPrVFYB5x2D51yn3E+WzLUsBm768hI39MqROrmxQAGhWv7hRKH1XUswg5RJ6gVcc3lshctHDrSuI/QGZzHH9y/RuMehilWxcbpsfXe/ZUoFCvIoixVdABnsNqYNXYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 01:58:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 01:58:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 4/9] drm/xe: Move lockdep protection from mem_access to
 xe_pm_runtime
Date: Tue, 9 Apr 2024 21:58:20 -0400
Message-ID: <20240410015826.1093368-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
References: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6891:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rrS7eHwgRAlXj262RMwIvgK5dfrmpLknVagvuvezHShGdisOq1ZIjyuz39vJdND4Ny7o7g3Zag+PAvywKaK8m4lR5nvhoXaly2vaHycnbJvKWweWU/m1ALPRWFSMW3bJ6fcQUgxf7OEhsHCi0axbNfYpWP/UQoVI5s1Lxoo+gTFc+VzEYhBOs+miDDNUmKUliHSIdD1xn5DAmusFGmkTX2n0W74ZB9Bcn2j1P9/tKth3r8Yd0o7Xp+OwqQpJoSWkI/G71CuV/7p+KcNFYFxEkLjX/me6TcUQp+oDa685mv7JOEEGsLmSu6nOBetNL0xLQn26GvcpjpaJ3NT9dSjHQxiEMuJzD7j8obmBAR/h/K+tZIjsLEYRVU1qcPj0ZZact/Y6vHNlb8BQR6RybJ+tUyOfX1InE1xhr+QrsA34UTxU3h7mFuOfEkQ2jbHR1GqImXZzz5LpuhqjFDf0O31Qf3mGSrNZF1Mar5ClPeS2c6hoyoC1e0i8XlYfQRiFSZAYdp+a67XNVeov2ZPRrfQAeM5Am/qYa+DX9dkQe+JU2nq1oBStFygGpTzyKAWrkxM0qu+WGT9IYuhXSYFq9NZkGQP6kciJYXP5Xdh3r5IRvzl+9p2hcEb0uKG49buNfNXNSQt2ZxKWDl/vIcHgKT8uayJZI36ec0PL8EaytDf2LOc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5gp0fRhKulcExQhwnjvsrkfAntq6eeerBtmKOrAUDep8Fxg6TSVFBNA1nXTh?=
 =?us-ascii?Q?s6zvmux6uexCsJZFsLCZDpLZw2a743aB6Axv8OfY8eiuiTqk40E02JKX42P/?=
 =?us-ascii?Q?W6p/d3oqyZSdNP5sLA4ZnC35Gu2OhkiR5uPVmUwQmNIjlpJXt5XoPY0j36ZF?=
 =?us-ascii?Q?WaG4z74YRwCDwjd4+Xq4pT8ufqopWML5IwkHHz0fL/QYYcgXkXMwJsyokxZD?=
 =?us-ascii?Q?/nphA/3E4icf4nC3pD27dnjuRH5NjgXw7iCdeOkplf0npID0AAkT1J6ms57n?=
 =?us-ascii?Q?FCmRpOZztTaFp5+hGOjWezUsXFIE8fI81n/2HG46pNiGmb1khXTTQTFROBoP?=
 =?us-ascii?Q?cw/vDMICzkBvjC7+mx43LjfNY/sQ4KQgtbpOBXReXGg2SKZsiAgoLzUt04af?=
 =?us-ascii?Q?uk8bMLNbjbD80ha/MY6XNqShWbygOKMMIcOs1XSHg8tp4aeVuj4uUxYi4eMy?=
 =?us-ascii?Q?J+clfD3lchK5opb/1LhvNNBN4xfcmA2JdvpOHP7x0EUU5QKgHJQDlYliGw2O?=
 =?us-ascii?Q?zNkgJjiwoFB6hB/xVgPqzV0WdwQTA+WdDfIm7jmox4xWmjSYrzv6NvAwWq8r?=
 =?us-ascii?Q?8i6gnlAjKvFi7r7m8UzyMJwAy7BUXJluM6DgShpV/HDDOmvF136R/mOuk4Sk?=
 =?us-ascii?Q?k7h3mLNwDzt9rYEr6MH8TNL+o8NQllHff3juSPJWt/c4LJUXmZx4DNnWwvVs?=
 =?us-ascii?Q?e3uK/EtlJ+GM34X6yG+hMmc4QhtpvnRXxja83H3a36gSPvEV27h6LcHYhjoP?=
 =?us-ascii?Q?b4Owc/bpkzrUlE3P9UcmNSofoXx618kzjf+IEnkSxbu2ISLe9GcrIhiBsmPZ?=
 =?us-ascii?Q?CvWEd2MAIV6+Ac/5/RMMBnsDJkro+Ov/x/QTzkMv5wyVEEc5ectiGK90zk2L?=
 =?us-ascii?Q?siA43qZFymari2XfzYf0y65XiIVKq59fi89wHragoHq0zKFtk6ZgVkeiGZzC?=
 =?us-ascii?Q?X/s3BZR2ibf2HEWqJIpqONcqBoNpe2xVD4PSYnkGcs8LfdWpwSB0Ybx0pCIK?=
 =?us-ascii?Q?+Ykrd/LiI2cctM0E5HvKSN2aSqmMpybKrTHsQeoYaoJroBgzkI52oxbVFIxX?=
 =?us-ascii?Q?E7Lpv9PV3/wenMjcs0tuLyVqnDo7OzarTlV/9vtuaYPKIg8/6peBKOZXDZi/?=
 =?us-ascii?Q?4M0m+J6STMMqQqAe1VBwnMh6RqsEuJPLMb4SHpwqWVXJnN4/QPbUfkr+wukb?=
 =?us-ascii?Q?WzbhMZhLyVJiCziOy7MqjPiUai1NsWGGiT8DzN+TbGtzA03rT78OHDZx3IEn?=
 =?us-ascii?Q?CWTUenWHuTyuyFmJvsxJmkrnz74eOqbX9ktBDgz9gs9qfubzwYvPZXkyPOUV?=
 =?us-ascii?Q?Wzpea+5KPQ7McFe9cbbfpQ4wr+mGQpxgBms3FfTdTLJQ2LWZ99Ui43mJHQx+?=
 =?us-ascii?Q?hGaLsMslm0AQfjKKQAaOgoE9rl49g0m6JrTgyy3eVarcewM9rVsYiolp/FGC?=
 =?us-ascii?Q?QiK9gAQVdoU3Uprpkylhg/UX2YxlikVBV3K2SVqTwH6ysy5NTawp9Oay+hOE?=
 =?us-ascii?Q?O47hbebHhPoGdzXiOZ6IhAlKW+9uKEHmTwbWFrs94DfACreoV6Bidz7q4rzr?=
 =?us-ascii?Q?M8974f/QcuWsPZJkIYY0B4BPvJ5maPDpxPvrnLb0agbjvjhDYY1McKI4aq1D?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3310e39-d02f-4430-3231-08dc5901c21b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 01:58:46.7992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YtJ20M0AdPAfefkdcWj75vV1JyV1cSOg50MzV1HNWL1ouY3T1g1jZK+lJCQEQCUTyrckv13lgbKxcqynabh2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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
index 9083f5e02dd9..7a3dfee5473e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -45,12 +45,6 @@
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
@@ -713,23 +707,6 @@ void xe_device_mem_access_get(struct xe_device *xe)
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
index 1692cf08e950..9d80a2d8c402 100644
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
@@ -309,11 +315,11 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
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
@@ -321,15 +327,15 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
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
@@ -355,7 +361,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_irq_suspend(xe);
 out:
-	lock_map_release(&xe_device_mem_access_lockdep_map);
+	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
@@ -375,7 +381,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
+	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
 	/*
 	 * It can be possible that xe has allowed d3cold but other pcie devices
@@ -412,11 +418,31 @@ int xe_pm_runtime_resume(struct xe_device *xe)
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
@@ -428,6 +454,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
+	pm_runtime_lockdep_prime();
 	pm_runtime_resume(xe->drm.dev);
 }
 
@@ -457,6 +484,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe)
 	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
 		return -ELOOP;
 
+	pm_runtime_lockdep_prime();
 	return pm_runtime_get_sync(xe->drm.dev);
 }
 
@@ -523,6 +551,7 @@ bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
 		return true;
 	}
 
+	pm_runtime_lockdep_prime();
 	return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
 }
 
-- 
2.44.0

