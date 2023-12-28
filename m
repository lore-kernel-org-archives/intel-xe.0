Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D133C46CD2
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0509C10E061;
	Thu, 28 Dec 2023 02:12:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6B010E061
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729569; x=1735265569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4j1a22eSnmeq+yfH+G/B8aFanoa6Vw6xEV9ccZcymnc=;
 b=g8QLIGYRjYlJy6VGXnsc585Y69Th63ZH9c76iIn8nOXGEBG9gZgjJsOQ
 kiA2PZrS/320cGef7nxG9E9i18n1atMevEO6lW9xLjrqHYasbbwg95m3h
 zwYR1IdH4u+3AHTncFTrQpVIxgcN6xLNWJGGH8DuuSw8N+X61RVBDsYLO
 A2BrlKtZgLK+UyPGqsWn3VM/ej5Cp55nj3gGt2gkzTI+0WcKadBjuYscU
 X8aDQMQ72EbICDQwbvh1e/pLT1XIktyEMuYqGyYAvfdBCndGp+8a2hfT9
 XKsz3pvFQqmQG5zewy0OI7dWJEzlGuG0UtrW1uo77M4YdIbL8DUdLsfNv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="482684568"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="482684568"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:12:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754611046"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="754611046"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:12:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:12:48 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ebj83rPSQRbjoqSMn6JhmaVk/Rr6ThQ59vOZk1/LuhWN6ovgovznG4ddQcE5/+ZNy70P0ce/fGdga9Qle5ILHVyB2D+TUePdcSpKMGJ24KvGzPHU/pQQSXxOCVJJiq126Ud+Dgnn/3/GSrGBK4MZrqOopQHD2DqZKtfS5/o7JFiNlKyPSHbh+l+stSTjPiKtfNdTCQFos9yIqX6pFWTmVaF6QSMjXValsRZriLkmPXqUesoHtmBqvAnEceikTt+AkGSK0K6VjhCNwoMoYWfORKsrtA45oC6v9s+iP+zTIfV+Pf1eiLqSkIXbllE3Rg/pc8lXydQWvlLzLhmH4Gojiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nn0TSFdv+NADNpBxTc8F9xaoES6P7LJMabKOkWOfCU=;
 b=n7y3xsydiZGHuQbyWSAEHI32/El1kqoV8mOcXzf3CvqRAes3XKjTo/C4+CFle3iGujcym9Dmpr7qeut8ZG/Ad492MZQbWbKBxK+u0hQ/D6iSh9qLRusEG+RHd3BM2wbUueRvE4Cg1TfyXiiu7Hfstt9QeDKaGB4xTykEfhjPPme0KFFy4LJVbt+o46ku34WbI0d8LOuIJYqcWtqAvYD/Lh27vVh9Q+LiFHbFsY/aO6KlxfBaP0dOfbemZSTwLsN6aCWRqLbWQHDrcLPvj7zKGuAO44UgubV6yRTlX3e5IrqAo71FX0h4hV1Y9Hqi51LpfPOj8Mi6YvF+sD13968m3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18; Thu, 28 Dec
 2023 02:12:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:12:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 01/20] drm/xe: Document Xe PM component
Date: Wed, 27 Dec 2023 21:12:13 -0500
Message-ID: <20231228021232.2366249-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee7ee52-ff99-489c-d642-08dc074a79b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9UOFeQDWoIC/3jLYr9u7n2mgAntYkkDQusEtHswOYkU4EYQh4PS/0EiUuoOqG8Cm9qY2yLWoAyUS/Hj9s4ga95iHKtkIqqY6csUe8JWCCQM9Gk4RZV6TM4G4BWnthXrSLeFBLb7bEfd7y13kH9xExAt93+Zi+Nv1iIam72NZs45oUvpHQ74d2sgD2JG6fxYiWMONnwtAhjdAbDJe0xCkHFbiG3htMDaPX27F1b0xpTXQ3OPpWmQ37KPC+wqxEhB2p8yiQ1Whz5wdKELsCpbvnh+2ggQGiJn4eHDzDAacZ2WK3MzwmzSXyHj7v1OPIqDpWFG5Y2telNjzU8kOmDCUAkhJz3gGQi8pMkkul/w54IWaOKsJaNz1t4C9vU4tLSo6SgUlVrzCvRiQjvWUBf2qyxWFnC9aZpBxZZPoOkMiDWVRfGcAu56Uf93uT71pfS7z8FfB4nxyVEV24I5gxFztnDhWivEb2bS/CeJ8JTHghIMRre9cEMQgMTvtNCKIZIetXUxcYeJDziE3NxGkf6NoL2fBPVf7esBEVi/c3SdCdJB3HoerlIWp/3gpi9XNsWOV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(107886003)(2616005)(26005)(1076003)(6666004)(6512007)(6506007)(83380400001)(6916009)(478600001)(4326008)(5660300002)(8936002)(8676002)(44832011)(6486002)(66556008)(66946007)(316002)(66476007)(54906003)(38100700002)(82960400001)(86362001)(41300700001)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eWruXp21Z3tNU/ihjqXZVjstbDGAtmqSQ2junzPtepXH5Q2foClyq4wusnvY?=
 =?us-ascii?Q?Jn+v9xqIql6pUewcc/pmaUQTgpOWvZIwaEKHooTEVqYBigdZGwvgGqSRIl5z?=
 =?us-ascii?Q?jC3SysyXbAZ/9e6m43R5Vq1C/c/iBauW3cPJ/9gCOuj+6nGCX8+no32yZwBb?=
 =?us-ascii?Q?fpH7GYCV4GeTWnIGT5moUJCJcye4aEjXgYCx2YTDKqFLxo/aQP/2JXWhwMrq?=
 =?us-ascii?Q?Car0u3B2bead7jF2v3Nn5sK+Z+9QXicWjB59ussQ2z/8VnXDt6kzLB/y9muv?=
 =?us-ascii?Q?ERfCRbvjGoIzzD0ELZu+m1WAJpYWz95n5owsaAfxaqDraYOczXEK3KPEKb18?=
 =?us-ascii?Q?VMllmv2bMdDtEbz/fMkmybib7wRz0o9wzEk5GTfvZ7J2NShiJ4pr+yr15OuG?=
 =?us-ascii?Q?yZikE1sUOuGSP1NZVTD5HzPiedHjN9wjnauYtZS8siZdy/S5ggr0f0Mj49MB?=
 =?us-ascii?Q?AVg7UCC71BD91qQw550/ILaePkt7t93svpvBbxjhZPq/Bj7ybwRQhjb30t1K?=
 =?us-ascii?Q?Lod8k+PnL/MJmkyXyBc4joPIX24MOreIITaovuNoJ5v+YX0tplSuQqukegwX?=
 =?us-ascii?Q?zVMgHmGvEQ63bNgDbdwURyQQtRcgURmDHUbd8XVw2JIO227E8Y2+qvTjoca8?=
 =?us-ascii?Q?dct/44GHasne82FPjceCOb7TAMh7cTyJjBMQjPB1LF44o0DLKU4dhAwWbIrD?=
 =?us-ascii?Q?tqiuzoK7q+rtaUIF8LTvSX1qn4eyML42SXDXQPT5giEoHqQIrM97h+FKBU1f?=
 =?us-ascii?Q?MbBoltfw/l659EhOi4rbOOF3e9k3nuZqzJf/S6HXuCuYSOKgthv9cbhX2ksB?=
 =?us-ascii?Q?KVerrnKZ38Da4WvY/EaRzI6+Vx3Je6qj4tLKT+xtnEhOLqT58h2/v4O4Y41Y?=
 =?us-ascii?Q?E0vNQ9eiTUStGMVrROuCioAbgU9+BEP2yIRKcIeffDN+5mG5uuX5Ntg/wcpD?=
 =?us-ascii?Q?am4jRYtehFwZzudnvOI4qozOy/yUV0FkZPjSwJQm2/mR//9T8yp+y8mmu171?=
 =?us-ascii?Q?bnuE9EaWLCuiX8nvLUrLOmVZ7Z2xRZcWtdScH8ZPJc037KvG0wlvGmCnND4C?=
 =?us-ascii?Q?TLCH8Bt5j42ZIjvQwBvNsUMOqPhPZdMSjrY5CI1VDE6UKH4YGIfzPULXtRuF?=
 =?us-ascii?Q?fWfuJPAEy1ZdubfXE8g11Kvq29GtU57EsSkSlSWzENGBlj5HspvwUXJp3aQW?=
 =?us-ascii?Q?jfMGy6pEFXDJXq205xWYAU35sKs14DpFEgs3FZO80y11PdCZkzlbJhnC5Qz1?=
 =?us-ascii?Q?1jYk0DNZRA2yrPrsPVVLvXsg0yWs6runm0KalmsGdLFlCT8x/2uGss29X9lb?=
 =?us-ascii?Q?BYYoB04YRzhQSCSaUCKVHVuE9sfuvSQqznX3m4O8KY+rrbBi72zHAwgUok0s?=
 =?us-ascii?Q?SPp1sKGi72wWQvwl+NLJcb977wK4mVvDFfYnApBUQ0D39S6996+eQ4gaD+nk?=
 =?us-ascii?Q?jas3L73Z8ImTtoziHX8ODn621kLhje2QZMRjurUFCO+s2yCajhq6WPYb5RGU?=
 =?us-ascii?Q?8QQsP8hM7hLfEE4wSyPkwYDB3Vr7iC3HHIVqRFT2SUpCi2mrTHkvELJddYZx?=
 =?us-ascii?Q?qZbZGJPNGnN2AjaESSD8XRMs02w75ER84UNK/HzJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee7ee52-ff99-489c-d642-08dc074a79b0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:12:43.3014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b70eOOS8WJZzDTsP/p0ofOLLw8z4R04gzlZKyiJRKj3C+ERHRjMWDki/d/RUQL8Q6rYXc6J+b/gr39aqq5u3xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
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

Replace outdated information with a proper PM documentation.
Already establish the rules for the runtime PM get and put that
Xe needs to follow.

Also add missing function documentation to all the "exported" functions.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 107 +++++++++++++++++++++++++++++++++----
 1 file changed, 96 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b429c2876a764..a7fe69d2f442e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -25,21 +25,45 @@
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
+ * S4 (disk). The main functions here are `xe_pm_suspend` and `xe_pm_resume` that
+ * are the main point for the suspend to and resume from these states.
  *
- * For now s2idle and s3 are only working in integrated devices. The next step
- * is to iterate through all VRAM's BO backing them up into the system memory
- * before allowing the system suspend.
+ * Runtime Suspend (D-States) - This is the opportunistic PCIe device low power
+ * state D3. Xe PM component provides `xe_pm_runtime_suspend` and
+ * `xe_pm_runtime_resume` systems that PCI subsystem will call before transition
+ * to D3. Also, Xe PM provides get and put functions that Xe driver will use to
+ * indicate activity. In order to avoid locking complications with the memory
+ * management, whenever possible, these get and put functions needs to be called
+ * from the higher/outer levels.
  *
- * Also runtime_pm needs to be here from the beginning.
+ * The main cases that need to be protected from the outer levels are: IOCLT,
+ * sysfs, debugfs, dma-buf sharing, GPU execution.
  *
- * RC6/RPS are also critical PM features. Let's start with GuCRC and GuC SLPC
- * and no wait boost. Frequency optimizations should come on a next stage.
+ * PCI D3 is special and can mean D3hot, where Vcc power is on for keeping memory
+ * alive and quicker low latency resume or D3Cold where Vcc power is off for
+ * better power savings.
+ * The Vcc control of PCI hierarchy can only be controlled at the PCI root port
+ * level, while the device driver can be behind multiple bridges/switches and
+ * paired with other devices. For this reason, the PCI subsystem cannot perform
+ * the transition towards D3Cold. The lowest runtime PM possible from the PCI
+ * subsystem is D3hot. Then, if all these paired devices in the same root port
+ * are in D3hot, ACPI will assist here and run its _PR3 and _OFF methods to
+ * perform the transition from D3hot to D3cold. Xe may disallow this transition
+ * based on runtime conditions such as VRAM usage for a quick and low latency
+ * resume for instance.
+ *
+ * Intel systems are capable of taking the system to S0ix when devices are on
+ * D3hot through the runtime PM. This is also called as 'opportunistic-S0iX'.
+ * But in this case, the `xe_pm_suspend` and `xe_pm_resume` won't be called for
+ * S0ix.
+ *
+ * This component is no responsible for GT idleness (RC6) nor GT frequency
+ * management (RPS).
  */
 
 /**
@@ -163,6 +187,12 @@ static void xe_pm_runtime_init(struct xe_device *xe)
 	pm_runtime_put(dev);
 }
 
+/**
+ * xe_pm_init - Initialize Xe Power Management
+ * @xe: xe device instance
+ *
+ * This component is responsible for System and Device sleep states.
+ */
 void xe_pm_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -183,6 +213,10 @@ void xe_pm_init(struct xe_device *xe)
 	xe_pm_runtime_init(xe);
 }
 
+/**
+ * xe_pm_runtime_fini - Finalize Runtime PM
+ * @xe: xe device instance
+ */
 void xe_pm_runtime_fini(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -212,6 +246,12 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
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
 	struct xe_gt *gt;
@@ -266,6 +306,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
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
@@ -317,22 +363,47 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	return err;
 }
 
+/**
+ * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
+ * @xe: xe device instance
+ *
+ * Returns: Any number grater than or equal to 0 for success, negative error
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
+ * Returns: Any number grater than or equal to 0 for success, negative error
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
+ * Returns: Any number grater than or equal to 0 for success, negative error
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
@@ -347,6 +418,13 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
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
@@ -371,6 +449,13 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
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
2.43.0

