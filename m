Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEE5C4828A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E41410FE66;
	Fri, 26 Jan 2024 20:31:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8021D10FE60
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301059; x=1737837059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=I/sVQ0pbBlUCACmsjSmhpGaVJuuCEEfkZ5lg60yzLUs=;
 b=Rb72QAd5leVUIg2tVA9yLw1VjouegY71tUGHWxPWG5F4RHpMSPShsH86
 BujPZ3L1rsiJaoVtrBIPbNjRLfUMQONCTXKpeTpcIN0AReVHvV/w09iPb
 m6xJ1POvbZ26NlQ0HJFW/W99SUVaF2Ywm932A7WGq76Psct9pSmwqWYiC
 unOqMEL4LhgkdQfTfDGnq1W9l/NCV8w3DtjT4sr+b0puhf1MjqyjjNYUs
 d/Y62NtmIJHh/sNBV8YxdAO6SBtjaOUCIJUEKl7d5Erqm2K8GD7xka2RL
 ivs/ejWAPTGNCcQtpTezffKqiDx7uxHkhW+ZEdM2X5sGp/YirZocp6VjC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9244884"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9244884"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:30:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="910434248"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="910434248"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:30:58 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:30:57 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:30:57 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:30:57 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:30:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMmnqsb6vI4cqO56y1NMixJ3MGZDJkM6bQK0bz7lL8DOj7qPAJZdetHSvKSAgwqmR4Bx32tkFnEWi6nxhO8iLS4gtZei1xm4xrg/Gcsr7tHETY5jNTFm5U4J557Gk39940xh59LAsLHN6ROx/VHv5aYTUdYu8FlW1kIivtEv2iCqUq64lQZpo6y3IqsHi2UqaljOcaZ4XCRlU1BdeHStoVeieSLOGVB2vRiSeuM8k+qR139esOyGKBP+3GD+Jk4eSCXyoxSbvdYjMxXizQyO2EfVY8aRgeRE4gJ5wJ4L70Wqnf19ZBL0n1CK//OTFAy6hhsw60es78+jJoBrvw2i/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2foK5b3UZkGSuw4HBXHhi6aS+WAtvAjz7SC8mDb+wlk=;
 b=cGaTbFRkhar5d1i+XmQ1cpY5EpuWomsTgxvj/pYlydvaQyItdFnI+RyRmrJtabIAxxy/c7Ln/xIX6EuEbrf+PFx9vkkg4zxzfZRxe7aOOVx/pssIOuv1vcVDqfSICGGs6A5k0ZyG66i02frmUgMun3AjOOSF6jxHfzsthTnM4PBm68+/4hmnvz57PXTXj22zopeej92qXJfvGrPhua9yeytSoFnO0rf3F1ScBD7vi3BIpc6Engb+r2IC+dF2mC5RNuifHJNGbPdwn5l/TaR4ySe21fR/dwh8aVt23jPukt4Gvrfa8eAACzXNVTcGK0UfzFRPVwV421YirJyl5kSTlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Fri, 26 Jan
 2024 20:30:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:30:52 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 02/34] drm/xe: Document Xe PM component
Date: Fri, 26 Jan 2024 15:30:11 -0500
Message-ID: <20240126203044.1104705-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 7326aebb-1903-401e-8505-08dc1eadb0a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EGc16lK8IuUqkCIASVDgJFMRYg/B2HPyatV0eWjtyqHmo5pVY2Y/3QWJ7rsmAYYlvm/W+/x003Aetbn4yjr1zu5OmgkR7v60Aef96x2qe+FY3ad/ijcpGdxUeDvbJNF+CmDXJWQlhtUmWjFPxOcebF65GRlZPOuSekg4FmffFdK9N5MuuEyYetiEawDMGx3/JHF+ysw28E+fiijbbUGSu/zqlOzfprc+aD3c9P+BVNKvdcZxuv8F3foRQYaQ4r5bC048RvbspA2yE55zSgGfJ1hFxDzaEl6Fo+WLuaNfIDteakax9pwceleF/lmwfXZmspZYULvnIjIOCo1Q4dgm+ZmYJB6l5OvGoLIea/wLCqypQnhoFFMdFv9O7lZb1QP6WlnynUlMT8WmNicmmjLOs1nHoEWXHUuR3IM2RywEBeTMV4ruy5Ldexulw7Pp/Px/6qqYmmg8+Mg85e7D2Snhk2hUiMKgFjMJgtWoI5R4drpwrdnhlKba/j112pGSEihBbbNiiGja5pi2ohTWkQsnn9EHf30kHnL+naZ+bf04uo92N2byCteGDS2S4hdlW3cR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(83380400001)(26005)(107886003)(6512007)(66946007)(1076003)(38100700002)(5660300002)(44832011)(6506007)(2616005)(2906002)(4326008)(8936002)(54906003)(66556008)(8676002)(66476007)(6666004)(478600001)(316002)(6916009)(36756003)(6486002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h9rsZD/CI1j8QGhiimBrT+31qz+ebRTeV2LzpBgKpbufItJgkReniC17qyxD?=
 =?us-ascii?Q?D1pUAlQat06w38BMaKS5pgYlMVkZqQFUI2qWOVrq7g5O43h6Ol1BieL7AOP8?=
 =?us-ascii?Q?QvH56C4IsjyG/gyHJsI0sKLnZhXFVwowuXm+QF0GeaHm+XW674NJe9RFHuq3?=
 =?us-ascii?Q?yDEuY8JcfvPsvqeuXlHqOdhU5f4q4t5TDn65MxPVzrCb2Gb2RpuF60wrre3z?=
 =?us-ascii?Q?ILkRKIA6vAaKPY+5e8sHgkADAXUHVvKKwmGdmvH/uHKzu5+WmzHaMdZCTot6?=
 =?us-ascii?Q?k3iy6sCJBSeQmgvkGvYohwOZUfp0n9b+5R5bh8Z0VJVp7v83kiYt8fnxiwi/?=
 =?us-ascii?Q?xWZxfpEF7DDnmg7VZWuOh3cunWC3+UcPczojoMRJsb11p3/yqa6ejjm8lSaO?=
 =?us-ascii?Q?e6v1cC6KtiVCKZARph+fJc7P+X25xYfdgIPl0FZzOfjeL876UGGSG6jDKkID?=
 =?us-ascii?Q?Hy6lkAUoovArf8//rfbhR5AWVzUBYo1jjMtgueSPEj6xasJGodj2Rw0aY1pd?=
 =?us-ascii?Q?+lq5YgcrmfoQDWuPanOX1qSTB2QeEPwSMHs91VgaF9tD3i8C/ZZ/2HB7er7r?=
 =?us-ascii?Q?naN295BAwYIqEVLDzp7XNUxZ8V/jsqSUZrLlX1wtntBcTUl98ps3y4n6puRJ?=
 =?us-ascii?Q?dnB9/nkGpeelzNsKyUXXLlDN75sf82g8kQfxAnmVvq7KKk2e7OsaGniDYA/F?=
 =?us-ascii?Q?VHVScwguex0ORJHYa/xQmsnuUlgHTSsai4oNdXcv6IYupvphRNrel5GgE/Qw?=
 =?us-ascii?Q?X8glEllQauCKe6MKqPx60VjVWun7JOvdr9gp3E4wBuoVMBOFNG7hJ4AoUehS?=
 =?us-ascii?Q?NgxgyB2KHBQyGsUbMMs3sfb98yjXn+ecHww9KaeV2BtgZ1ThpJUQbn00+klX?=
 =?us-ascii?Q?H1uryUfZ7bVjrl5H94cEzrkLjuSdcUkYW9pyDzyMqlpNqNxovd+zSihW13lX?=
 =?us-ascii?Q?DUxRj7nG0ebW7svm/aqCLjnshG1CQPZ5kbTsC0qELSGHIRSpt3QXZz0Ee1pa?=
 =?us-ascii?Q?2K+luf/OoGYxexSp/2LkEMJRbzDSdOvCTeAtG0A/wNtD1b0EjH3+IFudiI7/?=
 =?us-ascii?Q?fBGcSDNe6Xui9lCPUlvaJKsolTbmwtVUr4pcFE0B6qYoTsm1iTPxrpC3U21n?=
 =?us-ascii?Q?55MXmlj7SrdIBnNiUp7/5SwCeLqWS2rTq8STCCqv8Y78q5HUIkVOhcu18tGe?=
 =?us-ascii?Q?2J+FW8UMsuN12T1sCNEC42NrpOlBOJs0cDEKwT8kRQPxqPkoIvjAvqgMm4kB?=
 =?us-ascii?Q?y81GBpSXB8eYZ/iBQy/mQqgGU4eYCC6rPGIEQg98zSo62kf9mN1tt4BlIKlR?=
 =?us-ascii?Q?8JzNB+vhPF9nDm9Bv+scEEW51lJRYSaymOCqnY+q25KmKypE2necWzb7ogl1?=
 =?us-ascii?Q?fb4mf51PVDcBBKDt6kfv+BLL/D5qDTQNjlUn+LBmkRuf2Xg/446XRL8mrq/H?=
 =?us-ascii?Q?le+zKBHXaFyjfRRBuuDOHFD0KtlGAyZUw7Ga0O02aGDkITfARg/wAsbqVyJk?=
 =?us-ascii?Q?gZvYzBb/6ZXi7M1urOb8Vbpoo6R1qqlaNP0hTMWV1i8JAp9FpFBDlvPCYi41?=
 =?us-ascii?Q?aPdM/QxGEfHKHVCI6IrdWzS5WIx8Iz86+g+MrjcF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7326aebb-1903-401e-8505-08dc1eadb0a9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:30:52.4993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jSII/Ns/nCskWlDeYt8gD21pQyMg+tCHf20GhTNyoNc37Nz832W6FI4VX0UQlxN8WMW1575NfqXwRKcrqsSUQ==
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
index d5f219796d7e..bd35fe9f6227 100644
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
@@ -169,6 +193,12 @@ void xe_pm_init_early(struct xe_device *xe)
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
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -189,6 +219,10 @@ void xe_pm_init(struct xe_device *xe)
 	xe_pm_runtime_init(xe);
 }
 
+/**
+ * xe_pm_runtime_fini - Finalize Runtime PM
+ * @xe: xe device instance
+ */
 void xe_pm_runtime_fini(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -218,6 +252,12 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
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
@@ -283,6 +323,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
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
@@ -334,22 +380,47 @@ int xe_pm_runtime_resume(struct xe_device *xe)
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
@@ -364,6 +435,13 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
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
@@ -388,6 +466,13 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
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

