Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08495C54E5D
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 01:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFC310EF8D;
	Fri, 15 Mar 2024 01:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOFK8+i/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B321A10EF8D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 01:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710464614; x=1742000614;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=umz+ljCAwrXOS7jsYGJXBNGe8boVKreDdragdtt/PYQ=;
 b=bOFK8+i/XeV2inRWhh+bwPmo1fxs4mQZteXkzTN0bKviBKWDVtgWMKsT
 4o6+Qn0wf9t187hPltm56kuBJo21EAgOe1R57wmp2Z8BpaVikLz1WT1KV
 O3+LIMOrdr6pdA4SDoeYuc4JkJuT1/zrUjW76M4Nc1FLnYI3ZJKjqtKnF
 dichQ7pGtVJK2m25Q+7T7kdR5ZP/IY+o7lC1cj6/EAor0M3JlbVyV+hKE
 8RrhrYB8y5cxOcOqUrJOtmFnhkC8g0JPPN5E1dizq6WrTB4IlWzrFJEaT
 7ThBL7sI63IPg2dARYvN5fG23VqCXMD8IaLRyC2KkalQIaFwbp/Z7krxh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5450282"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5450282"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12456191"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 18:03:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 18:03:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 18:03:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 18:03:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 18:03:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUSy4uIhm4jNuRehrzb0mIRwkjki9ASiAuxm2dlAkaspTrserMnnMOAWSm5RPioDcgAFnZiOUN4G4w9o3IIlzKMRNjOsTqpzhLH+O9TFy0lOYOMwu1KqQoc1fAP1PnhwOM99acyT+8ookEzI7OxwEKo8Pqf6gzI3i/uXUejZsFHrSiDkgJzmzZV6gPgez2fEs0E6a2/N2cigAuYBUWHULPoiOqrkx1tLCeqYjR/PW/C9P//M7uKRi5lj/lJs24H0W9vRGfcDhrG692i44p2mQPqs7NLLrR8XHeWxCiB/MI464QAaKO80mXWm3caevV+nYqihoCMl2AXhN2s8uyX7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRn3hmCf/0K1dPN27A15kHPQHwTH5uGOjUaAmtPOuuM=;
 b=GtsSbNcxQPhNwjUz4uHIFwa7lJbOp2ZK8pKVQ7Ba+UuFkXe0qXpJeRLvHzoezqtGirv2aHFsPGfUrd6hL94rPFfI9sc6ESb+761/Dyoo02JXHmkxK5VMj7UEi9vIJRPxsUb41B3gtQOwzseelkI6rK+it74etjdnlf0t8pysBvPqIvc4wWCey4eYAeir5pD5pRNCCm4aTPSLzdIq6EPwKqwJZveHxQXJZtVIQkk7DVwDNb3LGqb3QCVMqemFp86Q6bJbuTypYhWz9j3Ox6pdlhBp1mv9net6xEoYKOjjUkRWC11OO++nIUxmtWxwDJjWHHXJTu1nkG+SZJpxHhQFYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 01:03:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 01:03:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH 1/3] drm/xe: Introduce a simple busted state
Date: Thu, 14 Mar 2024 21:03:15 -0400
Message-ID: <20240315010317.193756-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0093.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 6242aa90-5c45-4070-0fb4-08dc448bb6e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /vACIs58wjSoUzN28yi/P8OqxB1HQJZO/9rDqKaezi8qBrubTY6AQw92bxGnfrnFlY9VLlX1hjIffbH7dp4coixAF1u2/jL1agRZvnfGYQcPfXYIsD+OZRJXPliVExzv/cjgOQrJAqqDEeHuQeXqRzHkAKO1LRjWb2KIWWatJkoGTuIdPPO7ne85ev5HaPkfXknRVbIMz1ZF5rxvcMX5vcu46mAu8uqkBs41mt9GlbuKbfguQMgne1bLMbDuve5Eg65WBch1yCf0gdw0bO6pnnFK5JM1sQJWL9ns/eQN5iD3dnwqKUA39UdwW6Rurt3jprwDvSECmzU2YozR/PGzC0j0wB751MdSwzq/j7m/+/FKs0/wP6a/zGR/QI9Xt53PJrygVnwlMjY7eF/3cei4C8aejMqDba85JkG3SQ0d+kR9hSKvgtoGyS3ik8AqBCjZ3sAd9Mti3iPZGbe3iUc/7naeSSDMtwkkfwGQhFag8JIYcFdh+SZvoeOpfwVfO4iWolpDhq+62MOMcPZtJxY3AXap4PDHnODH8bXFzIkW2wXeMxnH2u5TtOPyQ0m0r3gas84oSrWTu5Hex8QU5SbElsC0NrNbeWp6TuF4iFB1bTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?batFfC0jZYHrk/3sVe3taceCe62qMKx8aCtkYDSuz77uHRyS5P26lg+NZoNC?=
 =?us-ascii?Q?/9aDYpY19NQZvN1a9Rjm4ilvv/miuZuhu3koMkKoaq5MpxdsqtEF/LwHj8Xn?=
 =?us-ascii?Q?lq+uROgyu5kSbFQI29EsXd1nrWXVybwuelTsnsxbt0hPPPZLldW5EHHfLb7a?=
 =?us-ascii?Q?+pqsEPkrNA+Iakw7WrVYhQPJRqvkpTQj6dNnSYW0SVER5lP1BcuCrSuYmzuj?=
 =?us-ascii?Q?yfpApkGS2s+BYoOX4CdrspTVPNhG6ccfsJosNr8xmw+0XOK2YgSI+MlIiNh5?=
 =?us-ascii?Q?OWngsITESwQa0dlqROb/oLAI+McF9lNW9AEGTomNIrBE77SEcVYEJWaKSHVk?=
 =?us-ascii?Q?beJLtq3BN1+f1MIrka3v/0/nsL3iXQeX18zFmH76jxt2/+3oo3JWOoLJgPSe?=
 =?us-ascii?Q?cHw7eU+zvd7VUsRkl2jqmLgmdWAU600Sk39OH2E9ay5BUNKMjsQ1+B+SvJim?=
 =?us-ascii?Q?w997HLYhzzrj/lf1z81wcpQGktv/yYFkNA1Br9gnMbymWqrdWdhJKRmgT7El?=
 =?us-ascii?Q?nm5ZL+9oKESA1hMUQ3YKq7pUhX57g7cQZUmJEiz9cHGSReS6aDVEaqAF7Gxd?=
 =?us-ascii?Q?wZBJytSUxF6i2Irn5tJcJz2Fmt9S1MJcwC88uKvVehedI5ESnaMvl21bfuQ5?=
 =?us-ascii?Q?N/cGVzcrOAA4WyOJZse5UkSYETy1hlDKx5KuCLRcWC5SdAED1PRuxQeuWXVE?=
 =?us-ascii?Q?juCsbKksVX3XU6LNgToYGf5CribxthH9gGm29+tcZTOyydOA/b0DyJmhZY9P?=
 =?us-ascii?Q?jm71mGBiLYJ8L2SlTx90vxiMOvxOO9Bm0YoekORq5F5W9wksJh3k6+H6bYKs?=
 =?us-ascii?Q?QlHwp71dp30H0fsFxs8FKRj4Z+ES+SE1czxezySm34f9x35iw4TUkGXaAU/m?=
 =?us-ascii?Q?Bt04iAtNeVrRJDukgKv7Hd0NF+3Wnf7zgMvuLA2QKLuqaT5jE1HETaimGLCo?=
 =?us-ascii?Q?FqYKo8AqgUklOBHJ+eDKtMtuE+4Whzmp2WwjiAPyZwdmWr3cFytxuLlOO9a4?=
 =?us-ascii?Q?o/XMByuTbH8Rwkx7WUkXCpSXPIGFqC2p8hyPu1pur3RJ86xcY9y7SEgpUT18?=
 =?us-ascii?Q?tZUhd9DlzVYzgciD3a5bdwKgJRNCRxbb9cE6MT7qSylir633xAKUuKOKLCU/?=
 =?us-ascii?Q?/vjQBKwHhC3MvSf/lR0OyZREgZ1gxRAJqTp032K9GCbFNStT7Xk+N5JUMPp7?=
 =?us-ascii?Q?Mz3k3S6MxZ3mKVDgcaMxonFy9Xp3uvbN9lpSISsvibO8yEsgiyHG2Ve9Y2Pa?=
 =?us-ascii?Q?pbtV4916/FR4m8RJPrxJM8fiTVytoaqIeNKOssfeVxX4a+TzT6Rbm4uQHh8T?=
 =?us-ascii?Q?yAj/MgoYBVZMgQkNik56ok7gMLdBcb1jseIVk5UKwKwEd3pJ7pa72p8jhZ2n?=
 =?us-ascii?Q?TxCf9f9QgZTfGbU4txkv2SZgYbr2a4i8pMeqbs1aZyNwJNLpwqYHGAg9RWGp?=
 =?us-ascii?Q?4wV65eMArLv3pcHzD70GpjFPKpH1l7DCn7dTgB6dOX8u3HCiYRQ5zI9J0ty9?=
 =?us-ascii?Q?jJjFAr72a2R0ZiWnbQY4CExBcoAOINO8AyUUBeJj11VP/Bf9rwGtToSlTsRx?=
 =?us-ascii?Q?EfJf4mTeEcldyvbyF2LAE4MlQqBOHboov1jEksdh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6242aa90-5c45-4070-0fb4-08dc448bb6e5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 01:03:24.2602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgpuEtqQy20hy3aHl5I4Hed2BlbkAyu81RugqflWrDd0Jq9FJxNgg29lI+rtml7ObMVD6XCyT4MAwlj3fSfm7g==
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

Introduce a very simple 'busted' state where any attempt
to access the GPU is entirely blocked.

On some critical cases, like on gt_reset failure, we need to
block any other attempt to use the GPU. Otherwise we are at
a risk of reaching cases that would force us to reboot the machine.

So, when this cases are identified we corner and block any GPU
access. No IOCTL and not even another GT reset should be attempted.

The 'busted' state in Xe is an end state with no way back.
Only a device "re-probe" (unbind + bind) can restore the GPU access.

v2: - s/wedged/busted (Lucas)
    - use unbind+bind instead of module reload (Lucas)
    - added more info on unbind operations and instruction on bug report
    - only print the message once.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
 drivers/gpu/drm/xe/xe_device.h       | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_gt.c           |  4 ++++
 drivers/gpu/drm/xe/xe_migrate.c      |  6 ++++++
 5 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b0bfe75eb59f..d02e59fb49eb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
+	if (xe_device_busted(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret >= 0)
 		ret = drm_ioctl(file, cmd, arg);
@@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
+	if (xe_device_busted(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret >= 0)
 		ret = drm_compat_ioctl(file, cmd, arg);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 14be34d9f543..2c6d9b77821a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -176,4 +176,22 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+static inline bool xe_device_busted(struct xe_device *xe)
+{
+	return atomic_read(&xe->busted);
+}
+
+static inline void xe_device_declare_busted(struct xe_device *xe)
+{
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
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9785eef2e5a4..2633fdfc1a38 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -455,6 +455,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @busted: Xe device faced a critical error and is now blocked. */
+	atomic_t busted;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 85408e7a932b..2f29f7fa682b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
 {
 	int err;
 
+	if (xe_device_busted(gt_to_xe(gt)))
+		return -ECANCELED;
+
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		return -ENODEV;
@@ -686,6 +689,7 @@ static int gt_reset(struct xe_gt *gt)
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
 	gt_to_xe(gt)->needs_flr_on_fini = true;
+	xe_device_declare_busted(gt_to_xe(gt));
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ee1bb938c493..d7eb409e8415 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -713,6 +713,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
 
+	if (xe_device_busted(xe))
+		return ERR_PTR(-ECANCELED);
+
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
 		return ERR_PTR(-EINVAL);
@@ -986,6 +989,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	int err;
 	int pass = 0;
 
+	if (xe_device_busted(xe))
+		return ERR_PTR(-ECANCELED);
+
 	if (!clear_vram)
 		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
 	else
-- 
2.44.0

