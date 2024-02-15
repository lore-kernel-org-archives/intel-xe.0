Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAABC48BC4
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227AA10E651;
	Thu, 15 Feb 2024 19:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFj9OuEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC5710E22C
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025688; x=1739561688;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=pgYuqNuKb0hxcePdvX+0aiLLIRWpSs3d6g2btlnEJms=;
 b=ZFj9OuEYVyjiTE/joioSFT9ZILGd2wbqZ9q1DhLfGE+a3suB1OvWiPDo
 Q4tYkYaB+aNL63tEPQ/fcHb8uks3UCk3pCACFj93ozNSN1aHb+u2GGbpE
 T6UKCCSs4iJE0bKEfZLtJZFLdG58/NNWMaOq4leZAHbdPZTD54aaYefu1
 a+xYYK+SqSpVLdGOxlKjXkUvvoBBjTKAihxACp1M8EL53O1e7Fz1SA3dC
 7856kUUkVUPC03eE+jyYrX8gzW9soCyl4mZuYh9+JxWTWj0AFFMBrEb7Q
 aL2sw+SPO/nqy4jWiuTbePiEXLGLcOJjd8r+bWHNYiKtW39EEYyIlzA1E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12688042"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12688042"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:34:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8230415"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:34:46 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:34:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:34:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:34:45 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:34:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWsSkTXITXj4cGXzWgP0zFwFk1HqSMw1scVISfjWsb27R+4Mo++6V5XKawF2qIupyxxBNgCVyMDETVrZQqLpU3ksLZNrP7G+hlMQMzwapIS0e79nIow/pyJsBdhdEa9fFfLOLSojarETC4ktb3C7XTzdckmOgCqrsyZEb+Ijj6TqhhFUMhvFT2V4GT5T4iV8Z+AFAK2TW3yduNXCDK/to2WTpH/weeXxWWIXTbqpy4P/Z8aYBBe5EUlXKiTCdFINDjR+rgNQFeEGF9K4Qlq9PqoVG5MRoK5tQ/Ee1JVfoIKBbGFvvd39c7+X5zTgmMsRV1zzm37KSTkkGhNOQij6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoiI6I/3UC7JpFLhMTaQqdrSbaPQ7ZmJ4AjIdwxanA4=;
 b=E3UXisNl/z7kqxrDkeTSQJ8qak7QgfccdgECjk7Aj0RX6AD2V4a79CYXcoSmImPQht7N6CXTop4N36RgtII9jNtfcfoABj3AFB5vDyXAHNTybswJUsJWUcQlSu1/Cql0SQo0pHywYPx/V9nNBl5o/j8ziZQR4fMGlSAnyYQ5haqpLqeRTw1bos7fY2I+X+mTmQ0T0yMPrQOdiOdfA47szkYVuHx7388zPDoGj+AD3vGna6a+FtSdFdyLjsNiUWDdeB/WRH2Cyut9IXDPOjaBdSi7m3MDkF6XYSCGKmeNs7DDo8/++UJl/vNVpl5cHXd0vkvUNNnK81MmkfX3UlcJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 19:34:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:34:42 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>, Francois
 Dugast <francois.dugast@intel.com>
Subject: [PATCH 01/14] drm/xe: Document Xe PM component
Date: Thu, 15 Feb 2024 14:34:17 -0500
Message-ID: <20240215193430.130106-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0368.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 728f1be2-06db-4833-dbbd-08dc2e5d27f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YPQroFdEFEEL2zZi+8LMYcIo+WefCq43kT+jfdZqw1bX8saig8So8zTp+bee8atzzdCLlNg+Hxd0By+pBkup9v/iGTOmh88mEczOid2mUBxzZsfTJcChUEcK01GKCnfqslxMcSgUru2Tbhl6JDSFqBbQvZ7AvaS3tZNU7mlsXj4weP+bVIY0MVUy/k8wcPPMt/JqKuw0ZE/mkGpoDLA1WvSPe37KNoIhgjdgvlN2WM25ScmZQCnJXnwbnu9gvz1KMpNLMpxA2sD4Q7qsncL2CicCbL7HIwXtkcpz7wPcxJSjyEZLIhWEoL5Jds2/iGh+ZC3w6NLN92yFuwN/OgcKdjNqn6o6Ybz/T2pwbjCFA42inEbAekFVJw4j1yjtj8A9RGp183P89ixtPRxRCAWz5BgTjsrIZ2q0I7JmEjFV8+yHoQbGC/Kj/5+EjWVK0O/E9G1IJT7fG/dEWUwr542XSQSnlHhhDpLfpYC/Srp5610jEj9an4s0TOPd/tZxWuW4IZ6+A8ESyt+PtoufSnYeQvI7zQJMT/gXUIbGLPI962od+Ih1zRQ0cR5aDErt75Sq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(44832011)(36756003)(8936002)(6916009)(66476007)(38100700002)(4326008)(66556008)(8676002)(66946007)(5660300002)(82960400001)(316002)(107886003)(41300700001)(83380400001)(1076003)(6506007)(86362001)(6486002)(6666004)(2616005)(26005)(54906003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SGsO19SXf18tkJ2YjV0D3JWrVYQE21iTsJ1fC29earWkJdMazWZGCf8KO8r3?=
 =?us-ascii?Q?X5E1x8mAOOfJZi43jshGvB+3ei0ZPKmZkai5776cIxPF3grC478z5ShUlnXn?=
 =?us-ascii?Q?NJURWxhYECwWAgCp1z535wm/cq4BEl+zL9HUsFZbT4rtnyYYWSLjc3CbY9bo?=
 =?us-ascii?Q?+H9zHl8Vlb5ndN9bbmk8UMg0XjTf2M6/+4ci5AGzhe0Qi22PycFeUjFrrQUP?=
 =?us-ascii?Q?xcbCy9mkNQRsnx0zj7nFJ1MqMiHCMuc29es4mHU2EKU3GGrAeBkv8TdGCVjy?=
 =?us-ascii?Q?x3CDJJxpf3PgUaHmdEeTiIWUEsxffrwBCdhU5ybdP+P8J50LRq4RYW39BUxu?=
 =?us-ascii?Q?UGx9RIFTELef34Q8uBeFDeMs3kH3n4Cl/9NwuO13DzykYZVs8hCpry280rTD?=
 =?us-ascii?Q?MiXuZwZcm7v25sB/B+RrjfghRHQpLMEHgsLJtsWL98rIoVslh1xsdSdYf8a7?=
 =?us-ascii?Q?UB/Y/Y5XmxaipQ7sPpCNS1H683XeNtvd3Y4LNn7Mvq5N/oMWPYMYfymp2Gpq?=
 =?us-ascii?Q?+0+uLHiG5trRtNyyi1K83rzw07podzcn6mgcb5YSmJ1t+TjQr3Liy2BpAfHq?=
 =?us-ascii?Q?jvjuROwZmFc4GL3vCpkyixzJoa47L7qMM4iL1VtW9cFEOTUmrkney/umQJ2y?=
 =?us-ascii?Q?wfE/E2HIJNIxKUswDcuzJKyh4GqA4EeE/zOTE/gK40FeVozd6jbEDjjQKcji?=
 =?us-ascii?Q?B3yZg81yWT/x3DfJgNeSkj2YSAhh6CrCJEbW4xsQgtvCbiLIXxPHu3mJ8vrc?=
 =?us-ascii?Q?HThxSVWDdBqSYxss0NHRc4W4DS5bmGKLgWW56tIq0Zkgz2CF5HulwOvo4HbE?=
 =?us-ascii?Q?d5ejXJrlTrNBYp5Y1+aq7syUqMhS0068GmY/9NGoeZC695WahRh5DdJx1TH3?=
 =?us-ascii?Q?TMyT32rlqyG2cwOzEc2JVVTqQf4+laYoKmBPspuBFg4/ZoNx/nIs0W1Hp96d?=
 =?us-ascii?Q?QX1P07LI1s2nBkhmrj1/N5hOzKAXfZiiGNuiZHChUGlmI3hWj0HK8JzLqluZ?=
 =?us-ascii?Q?atnwPN5THMkluKvCq9i0ts4As1dPoWzL2mXWzFmxLTFDz8fn2VmtMYqwxdmd?=
 =?us-ascii?Q?F80P2G80jGAXb/TOK97k+SOiSxoCDjQL08iCVrDITh/7URrOFnFM951x0/UY?=
 =?us-ascii?Q?jUBKZmsWl1xE5CWdCfixu7l+WiFJ6zemAXSb4Nm7B3b6nVic7uLHFFLR2o/2?=
 =?us-ascii?Q?OCEKmOsE96hBA165HbskqNMiHkpJXGIV5MNGkdRsaidiR/iXSACQwAIZJWgJ?=
 =?us-ascii?Q?ylEmH9XpMLmvVtsbUoQPP8SUymey17PEbcLPrFpkJ8lT8Bp3Mt27xzLEHN03?=
 =?us-ascii?Q?voeQoXcY5KepWX3c2G2WEyvkNTiQWkt9+X9MR2tPcks5HHp8NGZyx43HelRF?=
 =?us-ascii?Q?iR73VM4QVLM6daS+vOat7V93BDVXNO3YfiuGYI0cbk91elqXjV8pEykPFy7k?=
 =?us-ascii?Q?cqZ/qbPBZ7/2aEUAcpjDEJCda9RCvj+EBf+rJrXmFKgXXNbBIuwTikSKYiEv?=
 =?us-ascii?Q?qgK8Q3eJXWasCxgsSnO8IXMvwPorb1pg9cZq2BKiVHPzDjCkSc55Errbv8g/?=
 =?us-ascii?Q?0WlM52pjxJbHWfdycnEPG70X24aXd15Xmb22bCjO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 728f1be2-06db-4833-dbbd-08dc2e5d27f1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:34:42.0362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCh9UQWM6M127FrNug/6ASLwXevr3cJHYoWcJy2c1lpW7BKCAv/lhmB/fex34KOtywI6MhjYVssxm1CoARPpGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 108 +++++++++++++++++++++++++++++++++----
 1 file changed, 97 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ab283e9a8b4e..64ffb9a35448 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -25,21 +25,46 @@
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
+ * Runtime Suspend (D-States) - This is the opportunistic PCIe device low power
+ * state D3. Xe PM component provides `xe_pm_runtime_suspend` and
+ * `xe_pm_runtime_resume` systems that PCI subsystem will call before transition
+ * to D3. Also, Xe PM provides get and put functions that Xe driver will use to
+ * indicate activity. In order to avoid locking complications with the memory
+ * management, whenever possible, these get and put functions needs to be called
+ * from the higher/outer levels.
  *
- * Also runtime_pm needs to be here from the beginning.
+ * The main cases that need to be protected from the outer levels are: IOCTL,
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
+ * are in D3hot, ACPI will assist here and run its own methods (_PR3 and _OFF)
+ * to perform the transition from D3hot to D3cold. Xe may disallow this
+ * transition by calling pci_d3cold_disable(root_pdev) before going to runtime
+ * suspend. It will be based on runtime conditions such as VRAM usage for a
+ * quick and low latency resume for instance.
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
@@ -178,6 +203,12 @@ void xe_pm_init_early(struct xe_device *xe)
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
@@ -196,6 +227,10 @@ void xe_pm_init(struct xe_device *xe)
 	xe_pm_runtime_init(xe);
 }
 
+/**
+ * xe_pm_runtime_fini - Finalize Runtime PM
+ * @xe: xe device instance
+ */
 void xe_pm_runtime_fini(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -225,6 +260,12 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
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
@@ -290,6 +331,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
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
@@ -341,22 +388,47 @@ int xe_pm_runtime_resume(struct xe_device *xe)
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
@@ -371,6 +443,13 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
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
@@ -395,6 +474,13 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
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

