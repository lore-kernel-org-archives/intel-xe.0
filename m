Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F10C5479F
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA0A10E9C0;
	Thu, 22 Feb 2024 16:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrNjtve2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4FD10E9B5
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708619995; x=1740155995;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=h/ml2rQR3mOHhhL4D9NOTmE2xCDUfpXuorQcbTyL/MU=;
 b=nrNjtve24D5MxB0B9GbS2LYZiELC1zHXji4D067b0rUkZ7jmsFJsnbOq
 VJW5BJcDCiCUKADG7JwIn3wUvrnYHWExXc5NbLMnvCqfoCCNEPdmHgfId
 PSsHNB0pQiT38LhhfCFGWeNhLaCGT3fOsWChNZx6HD5iWpVmzmrAew5eJ
 JP7eD8sMlxj6YZb1lHpO2i1/LzbkAavEIYRiTusXPQCzkLOnXr5rZoFGg
 XGy2plRePvwXtSWi+H6D0N/Y7xTqHhPDmFY+J3BJb3ETC1x/Id9VPEX5S
 3uMqgwUaWey4zY63ZOFeF7PLx9+40nK9n+fR2QvW3G9msak0fe5YM1E1/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2730639"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2730639"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:39:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913552811"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="913552811"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:39:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:39:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:39:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:39:50 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:39:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0EjRcBuQsonjoCG5JpJ95KtsLk8vwPtu/gmsGwxRg6Bj4CUpsjfzsTre2MjLkeBPh/SwycxNkLkkZf5Q3Cf68JvxZbwIU7sF7KUq0gkuv9SLOkS7V09XuyNFA0QKmnFgJw+4u07mLpHeCnmWczjoMzL95ErP/boel2yBR9ZVrONMwuOSv7cCXrD9PvQaiNuXW+fmho8yQqTEg9c4nx73DHHQ/I2A/c+MihpaxyBRQ7uy89FDrXn1PYEP3uM0ogZo2vOf5/1Par42Ts1BFNgl8uYr95gLjLO4L7d/j17152DMf6oSClq5EmFIQtlFySRphYdDtzOJ4Ih18X/zUFEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57kEpqH4mHwxQach39+ohSGlOfbYfLgTh5NaBl1Fjnk=;
 b=EMkkRoKLbyJ8pUVbY/fuEFREjnHkjNVXyMlohtpoghz6x+/Ex31ku8n/qQC1kRzL5hdx1omk9lhE2vzX10nmejS0TYsZcSIlflaCaddyYz2nxes1n8/zyTKQtdeosLysa1H2sg5WT6JpULMMHziDYO/zRRDERglgEONIJU45x5SLhRioQAKYkxXSuDj3d6/nLjqVHHPmxIhfIHHi1dD4iSNMwC9IyE78TYQiUDfRYCh2rPUuOkMurpMe6m1vus2DdTrdSX86CYea5Vqhbffpwh6MIgY22yklgTScz5YoRHwV2BBaaGyYttOjSEubfXyxpoVgcSbjzKVRhZn2YFNzUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 16:39:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:39:41 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>, Francois
 Dugast <francois.dugast@intel.com>
Subject: [PATCH 01/14] drm/xe: Document Xe PM component
Date: Thu, 22 Feb 2024 11:39:24 -0500
Message-ID: <20240222163937.138342-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 58be6c21-1ac3-4298-5cf1-08dc33c4de46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3WHy0j0caPIcj6LTuOMmNuFcU7h0iU65GTTSIrJDV5x5MZnpum6eQobWebQmC/D6EYn9vABCmR3hGqGral+/3BULMAJGpIupahUFqLpAaNBjFSiTMn6kY3vApOAYxSL2EIlEPRz+2D1Y5uacOHKQuqnWNO5wU+jdgH05ghUDt8kqOBr+W3lp4GFcklGl+hzwTN+I1Xt0G6E1DPmy8oeTNaR+pvt0s7t2Bl4xp6PdhhSCQw4RY4QBzl6d8AnD/fNcuSoOoNENYpetTdj6JwVz6c2jYmQZL95RmQ0CgtZTGG3KCrxdkbgqhzOraqnPReYWhjZlfIigWpKtS59uFYZXHsCeDyq/aE0382izigM5Ch4YdVhKnohi+JEMcKb1G56OmKUp5c+eLAFe7NaLTmhq6VmriewNfthezibSlf3Djk8OOr2UN7LBjHXawJ/qRYs1v3y8unGm2+LHBQzrfhDdbhxtsl39kMZ6Kj9Yz5Fa5k1m4e/iqqvv+ET0+z3Lg5SBuBfpkAPtDD0GjFXTLhv6E7/RElM0puYjkIDIDGkMoNM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hE7ECCb7rKPsUUqE5xMaZcz/UtLnpAiZMftA7LbLQll2sL39J2MXhBoAVZhK?=
 =?us-ascii?Q?MWN9Cu3zADShY7AnxcBNGYDYMuj10ApyhfrD6p/W4nqUDsvaaZ0kV9vmSx9G?=
 =?us-ascii?Q?S6JonyAbZfnwR79wVDY+NDx0sIJPsfB/Bi8ySLJ229SgaFTuvsZSpAhqoZJZ?=
 =?us-ascii?Q?zmHJaUnZCwMpz8LhQ13EFsGokCI/3g2czS1h9XDir74WSm0EYLqvcpn9rtDh?=
 =?us-ascii?Q?nu6lY3D2xb4aYYhSG6eFysRd/JOSZVJrJ2fC4ESH48Rk4V6Vx+uThQBbpFlW?=
 =?us-ascii?Q?vqCGwfKhY679UPD2BzeBGiMrdmQfHKT+9RTgfc2jTxczpfVLEoCEQALaZMOp?=
 =?us-ascii?Q?hun9yU5doq0pBNmZSFXEXxajcEDObrdsOrsScVyFN+GVA7GshYgnGYaoJpkn?=
 =?us-ascii?Q?6HNhtxtjswArWmZko737aOTVehrO2/CrbHcAxP4r6IY9OXAqzG7xk+/NMePP?=
 =?us-ascii?Q?zu3oYIWDA1R1XcgOFga5mHdg0W8BmD0CcwJgGZbmC593arDQs9EYpdGUh1Z/?=
 =?us-ascii?Q?9I8uwdPPspDzCr9WwUQ6GaupzNu8yoKyoANGgEdzW0wuOGi/a1naLVOBT5K8?=
 =?us-ascii?Q?J8tbM4G/WAq9tRc9tEEDmdwPcYtlhioxpBNQ06JFPpu+R7L7yFBgqk3VVgcl?=
 =?us-ascii?Q?7z51TscdJ8kshqQ+7I5juGz8bp4DztqCXDY4UXrjSsxILhFPAJWOWYyde+1A?=
 =?us-ascii?Q?av71AcIVmUcWIPFPjwq/Y1ZGm9OYAs/DO5Ci5XPB9ynYEjwgKxDiaCE+KwKn?=
 =?us-ascii?Q?xdkvCFQbXACa0c1O6MofDQ8q35VN3f0diPtbyeHn8oR1oMbBOfEgOEYTCMby?=
 =?us-ascii?Q?b4ABb1m1bAviNNCZLKoeBunc+uX5gI5jSppnAyuxRFodQYuXz/Mn72/Lr7p7?=
 =?us-ascii?Q?83Q3ulnop+9mcFCHLMltL48Xmb8B3QZEk6ebnV/NiT2Y3+oZ/gVFTonH20+q?=
 =?us-ascii?Q?u4SSivJby4k3cCJ8XLexPXe1gf6O02QjdEZnU3L5BYwq5cgJcSIKlRxoUBg9?=
 =?us-ascii?Q?Dy7cRzxbZCYYPLq5UkDNGOd/UbAvDDqWa+EqAWeUtHd+hpJbodHGSZiqJraz?=
 =?us-ascii?Q?ut6OyUaeE4j3njeWmSO/kEiZI3+c3YMVrN+pKSR8tRD7vMj6Ul17FPRMbEUD?=
 =?us-ascii?Q?apdFlyWvCCsvcyDkxyhHQATDvMz2howHXvx1aGtK9NyTj0oSe5jDVtFXz7MG?=
 =?us-ascii?Q?rTFFy0zATc+79NDYzKHUpbh+IHerdKuUF7j9wKIV6LEBZeJAAHFJGbcJ6rzS?=
 =?us-ascii?Q?uKFXmgOm7zZLham5pKSo+00Emx75582/yVXJBdXGM5CLuRu4JiVJ8+eTgt7f?=
 =?us-ascii?Q?6ySVNLeRUEk5JjPzPsR/3jTGvGYVUuKNuNBgjRU7Bc6pkeBDLgC/RUzCo7dw?=
 =?us-ascii?Q?X1bDigPsvHvpz8hkmmQJ1QEjil3VCmOnnTthUObThrtpieXBVxtkbb2SxRjM?=
 =?us-ascii?Q?VJNOaIGMi4wcEL5IUvWdyHT1IZq1QFf5h3bEupt3hS1Mv/MkBYZTaO3UOR0h?=
 =?us-ascii?Q?xq90oAn9THXdj/xrLQKFLyl1gnySD45++dUXhXwwhw4PLbWUn2iF8Vvv9dpk?=
 =?us-ascii?Q?V7amOEJTn4lzji/ehN4nc06QqCQOvEqatwG6QYW9GC8mncYVS0gOdAU6vTWL?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58be6c21-1ac3-4298-5cf1-08dc33c4de46
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:39:41.8893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkAN39AIdgoAkbhMBS0QjKG2suMKkFLcGUEd89gSx2h10p4oRAuBTjL9A4dnvXUeeEyG1TKtjmxOiPrU1otrWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
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

Replace outdated information with a proper PM documentation.
Already establish the rules for the runtime PM get and put that
Xe needs to follow.

Also add missing function documentation to all the "exported" functions.

v2: updated after Francois' feedback.
    s/grater/greater (Matt)
v3: detach D3 from runtime_pm
    remove opportunistic S0iX (Anshuman)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Acked-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com> #v2
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 109 +++++++++++++++++++++++++++++++++----
 1 file changed, 98 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ab283e9a8b4e..ae220f21acb1 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -25,21 +25,47 @@
 /**
  * DOC: Xe Power Management
  *
- * Xe PM shall be guided by the simplicity.
- * Use the simplest hook options whenever possible.
- * Let's not reinvent the runtime_pm references and hooks.
- * Shall have a clear separation of display and gt underneath this component.
+ * Xe PM implements the main routines for both system level suspend states and
+ * for the opportunistic runtime suspend states.
  *
- * What's next:
+ * System Level Suspend (S-States) - In general this is OS initiated suspend
+ * driven by ACPI for achieving S0ix (a.k.a. S2idle, freeze), S3 (suspend to ram),
+ * S4 (disk). The main functions here are `xe_pm_suspend` and `xe_pm_resume`. They
+ * are the main point for the suspend to and resume from these states.
  *
- * For now s2idle and s3 are only working in integrated devices. The next step
- * is to iterate through all VRAM's BO backing them up into the system memory
- * before allowing the system suspend.
+ * PCI Device Suspend (D-States) - This is the opportunistic PCIe device low power
+ * state D3, controlled by the PCI subsystem and ACPI with the help from the
+ * runtime_pm infrastructure.
+ * PCI D3 is special and can mean D3hot, where Vcc power is on for keeping memory
+ * alive and quicker low latency resume or D3Cold where Vcc power is off for
+ * better power savings.
+ * The Vcc control of PCI hierarchy can only be controlled at the PCI root port
+ * level, while the device driver can be behind multiple bridges/switches and
+ * paired with other devices. For this reason, the PCI subsystem cannot perform
+ * the transition towards D3Cold. The lowest runtime PM possible from the PCI
+ * subsystem is D3hot. Then, if all these paired devices in the same root port
+ * are in D3hot, ACPI will assist here and run its own methods (_PR3 and _OFF)
+ * to perform the transition from D3hot to D3cold. Xe may disallow this
+ * transition by calling pci_d3cold_disable(root_pdev) before going to runtime
+ * suspend. It will be based on runtime conditions such as VRAM usage for a
+ * quick and low latency resume for instance.
  *
- * Also runtime_pm needs to be here from the beginning.
+ * Runtime PM - This infrastructure provided by the Linux kernel allows the
+ * device drivers to indicate when the can be runtime suspended, so the device
+ * could be put at D3 (if supported), or allow deeper package sleep states
+ * (PC-states), and/or other low level power states. Xe PM component provides
+ * `xe_pm_runtime_suspend` and `xe_pm_runtime_resume` functions that PCI
+ * subsystem will call before transition to/from runtime suspend.
  *
- * RC6/RPS are also critical PM features. Let's start with GuCRC and GuC SLPC
- * and no wait boost. Frequency optimizations should come on a next stage.
+ * Also, Xe PM provides get and put functions that Xe driver will use to
+ * indicate activity. In order to avoid locking complications with the memory
+ * management, whenever possible, these get and put functions needs to be called
+ * from the higher/outer levels.
+ * The main cases that need to be protected from the outer levels are: IOCTL,
+ * sysfs, debugfs, dma-buf sharing, GPU execution.
+ *
+ * This component is not responsible for GT idleness (RC6) nor GT frequency
+ * management (RPS).
  */
 
 /**
@@ -178,6 +204,12 @@ void xe_pm_init_early(struct xe_device *xe)
 	drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
 }
 
+/**
+ * xe_pm_init - Initialize Xe Power Management
+ * @xe: xe device instance
+ *
+ * This component is responsible for System and Device sleep states.
+ */
 void xe_pm_init(struct xe_device *xe)
 {
 	/* For now suspend/resume is only allowed with GuC */
@@ -196,6 +228,10 @@ void xe_pm_init(struct xe_device *xe)
 	xe_pm_runtime_init(xe);
 }
 
+/**
+ * xe_pm_runtime_fini - Finalize Runtime PM
+ * @xe: xe device instance
+ */
 void xe_pm_runtime_fini(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -225,6 +261,12 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
 	return READ_ONCE(xe->pm_callback_task);
 }
 
+/**
+ * xe_pm_runtime_suspend - Prepare our device for D3hot/D3Cold
+ * @xe: xe device instance
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
 int xe_pm_runtime_suspend(struct xe_device *xe)
 {
 	struct xe_bo *bo, *on;
@@ -290,6 +332,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	return err;
 }
 
+/**
+ * xe_pm_runtime_resume - Waking up from D3hot/D3Cold
+ * @xe: xe device instance
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
 int xe_pm_runtime_resume(struct xe_device *xe)
 {
 	struct xe_gt *gt;
@@ -341,22 +389,47 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	return err;
 }
 
+/**
+ * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
+ * @xe: xe device instance
+ *
+ * Returns: Any number greater than or equal to 0 for success, negative error
+ * code otherwise.
+ */
 int xe_pm_runtime_get(struct xe_device *xe)
 {
 	return pm_runtime_get_sync(xe->drm.dev);
 }
 
+/**
+ * xe_pm_runtime_put - Put the runtime_pm reference back and mark as idle
+ * @xe: xe device instance
+ *
+ * Returns: Any number greater than or equal to 0 for success, negative error
+ * code otherwise.
+ */
 int xe_pm_runtime_put(struct xe_device *xe)
 {
 	pm_runtime_mark_last_busy(xe->drm.dev);
 	return pm_runtime_put(xe->drm.dev);
 }
 
+/**
+ * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device active
+ * @xe: xe device instance
+ *
+ * Returns: Any number greater than or equal to 0 for success, negative error
+ * code otherwise.
+ */
 int xe_pm_runtime_get_if_active(struct xe_device *xe)
 {
 	return pm_runtime_get_if_active(xe->drm.dev, true);
 }
 
+/**
+ * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
+ * @xe: xe device instance
+ */
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -371,6 +444,13 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
 	}
 }
 
+/**
+ * xe_pm_set_vram_threshold - Set a vram threshold for allowing/blocking D3Cold
+ * @xe: xe device instance
+ * @threshold: VRAM size in bites for the D3cold threshold
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
 {
 	struct ttm_resource_manager *man;
@@ -395,6 +475,13 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
 	return 0;
 }
 
+/**
+ * xe_pm_d3cold_allowed_toggle - Check conditions to toggle d3cold.allowed
+ * @xe: xe device instance
+ *
+ * To be called during runtime_pm idle callback.
+ * Check for all the D3Cold conditions ahead of runtime suspend.
+ */
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 {
 	struct ttm_resource_manager *man;
-- 
2.43.2

