Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73EDC636CC
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C459410E09C;
	Fri,  3 Feb 2023 20:27:56 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB0110E08A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675456075; x=1706992075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=A9ygFVshQyDAoocL3hbbpjzfIScaXGuLYDmog7ssZPA=;
 b=ImxCgzXrXhbWORA3LWGTOPPZx2c4MAISXnW8/tz9aloOyZqUBTo+rmia
 ySnch89YzO8T1mRcIlIeksCFkTO27rXZxjkzjvw/LzXWHiCfDzqypCieC
 Au9kXa+F2IznyTVuSeOaZPbx80wk4++XEeXwTwfJyE01fnzzwfhchOLev
 1Dh5HyMLFrPVPNtY4xpJIr231c89eoaOp371if6bkqkWNTbozHu16aBgF
 N6hPLqSpM7hCQqB0DppyzgjuNq/1g/c7z0UICzwqPTJ4gtSQCycyVAbrl
 vwizMeAaVS8Hjk2a3xKSrA9n8/18uVroADxuZJXiKr0CMq5q86zIipR+h w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="327484295"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="327484295"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:27:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="774450343"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="774450343"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2023 12:27:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:27:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:27:53 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:27:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bgm3kXu2ayucWqP9vXa/cQpw3SsSIRHrRshOcnYK5aQF/8poKJkMGMwQTaKp8y0zOtOkvelPcUsHmUlEaumdZCXO1Xb80Dthe7IstjFAGPXX6DclXpmWQLiVm4mHWmv2I3UcedywzMhsk3p7yPXLGAk8XCusmiQmcrLBzBT8QA9pFQaS+3aP0yEfcKIXzQnpk8U0ZSLVQCevCCZ7iJyfU2ILVo/dgLySLw+3ePMEGXYWfOWdCmaoCDW3j/eRGM46aM05evCqvoQcXfH8Spavv/9Hd1osomvPgnXPjOCb1iiDlRSyaYG45/CMflIpaUZ+zeLyylaFzButFMKb8Qq68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVrwQIVBwYQBlDgeirOHwlkYg4rVMbnUAAcG92IdeT0=;
 b=oVBSlwlYBBci591K/RDcGK3zahMaWiOmEkPGJvkbBPb0txiMZQ6ub96ADRg8bgx15zM9H4FyMi7FuLQJZ3CJYFHX3DaKvPmi7ibBgdCykOgZ2qrItv3ELPOkIQ/Gt3TzYJN28sVv8YKSPOzDCd2F6U5d4Mzix7+0sJNPmmu5PzuHQPVUk41ej1e6DzuUC5P3sVBdq1VeBbjuxQFeFcl0uMpJXooMavASHe7OefO83jTtiItHEF6VtXycfJ96allF/tCWYfeoS4HG9y2rD1zegwGPQGktQ6eYYNDQEklaCKXt0bkFg031/oon9hy0tUifO79KCkU2bfPuLxGY9Gwjvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 20:27:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:27:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:27:37 -0500
Message-ID: <20230203202742.577659-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202742.577659-1-rodrigo.vivi@intel.com>
References: <20230203202742.577659-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4586:EE_
X-MS-Office365-Filtering-Correlation-Id: b94e95da-84b8-4621-4a58-08db06251fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1q64fOZKR8vT9YqVgTRZ6AeNgg02jakpLdmBFZvtssfeSEUiecMJ4uLe8pEiqaDOtz683Qu/IPcvweXOgJ0GYAIw13U00IHgX69RjkiilhhtDS0CJOiQZZZhHTFhJ7Ox0XezyaQCuqmCvuX4JTSm66IOqNPgnApn0t+iy3iCJUgKROchjXaYq+tIC9RoPwobhxLr1ZtvrR2wZD2OeoJKwkCqrXwxz2ZHzu8vZaBA7LyGqLsNWXUbfTZQ7VOOZgQNH07myKB7iB8/zDpedhMl4GXNZtIEsqmi4V/67VQGF0DnKfrTxRdjU9lvhEFhe4rWmzNP8fcWe7AFE7hoIr6f6ct0neXsEhm3yKwjRqzqaj9PydXPtoX4vGv0hlwJ/YPootn3NTtIB+nJUSkPa90bvsut3k9i4ZlMGitXiTUaiaiNJXBWq23RSdrciVeiGXKO1GwcQqyLsmGgMhx0LMBFiVhJvsnxBRqin9jJgFxBfO9zkMXprnOVdwcDb6No54Xf5s/Eici6uu7v5vPKxgf22rvwsr6mZdiixxK+2WeL6UeRLpI7OxziIBQrsr2wIcvXYqEsMrPT3JouLHKiE2ISzqRBCkcmBYDJiVnBi0tICxKQJUCyFSYm1o2oukQMMT964Fp+FOEUXi4GEd/yKihcWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199018)(2906002)(44832011)(30864003)(5660300002)(83380400001)(38100700002)(86362001)(82960400001)(8676002)(4326008)(54906003)(316002)(8936002)(2616005)(41300700001)(66946007)(6916009)(66556008)(66476007)(36756003)(26005)(6512007)(1076003)(478600001)(6506007)(6666004)(186003)(107886003)(6486002)(66899018);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QAqi/+4D1bkL2r1QFRBlJP7RyywTI7rs5fbvVa1mLb444eRJUHWTlmLb1hjZ?=
 =?us-ascii?Q?teVhtpA7M+yVSX2P1FaFCdFyH52EAVc5oKxBWMqt/O+WOUUj+t0ALQmHOG6H?=
 =?us-ascii?Q?IE+No61t8NVntiKWnvwbLGhB3j+kQnt+0yiCoPr1D05+9U+XOdp+anIsG4pP?=
 =?us-ascii?Q?ufWW8nn2KM2hBeEKJrbxX88o2zqpcnbCA2nWYP1yQN4/rNEuM8oxL7bayChH?=
 =?us-ascii?Q?Ux6PQegGBFNfPuAfQDNrITSqgpkA8X/iqGXHmwAbJtuPlzpKvz5MMaCgK+Yn?=
 =?us-ascii?Q?J5MsIvUDEwlxXBTnozxj1T+eGZqP0jHOYmPi2SAl7H2NkfR/7XbcAnQfxdMd?=
 =?us-ascii?Q?N2ctlyxGIgA64X1GpNmb757rdOKhN1K2Hf/j+wR5Jcobv7AMIk8vtZXl1yAH?=
 =?us-ascii?Q?l1zrLjBsO1lkrdnWrQY8Hn5Wx9fBSVFSrpIEBqiZDtH271nQeb+F+q/LTQKd?=
 =?us-ascii?Q?lwwgAkf+LoXSbjgO5VbFixjir80MhkK8fmSbK9bgIu3dpf78F3epKrnhoE3a?=
 =?us-ascii?Q?6+qx4AGaZ2Eap25w/6OWAEfthRgYCy+cY59OD7bNf7L08rYtfoY/g0MBRGPq?=
 =?us-ascii?Q?LMdmz+8IAK3vnMZlMTGufdFh57KecWXko0v2MkDsOb4fsRTVc9gqL+etXYSz?=
 =?us-ascii?Q?bEP3mrrY4z6vhlk7sd/npUKPWwV1Ql0vkHmM26MJtHjSwD4Dyb8IeVVOMma9?=
 =?us-ascii?Q?fdXFx5hrQ3cA96adCvmXFkOCER22M4rUdoLM17RbKKvqzrZhA4hbQHKt73Z3?=
 =?us-ascii?Q?e8fwNJR0wxHU6DXjKJ3P/NeaAUr/+4OF0rDJ0ORc8kKZE70X4/I8vY+/57kN?=
 =?us-ascii?Q?6LNsAx+SV0bfaO0KR++OS0LnXQMLZuaj0JQFQ4CFbUr2ID2Td76yXqdd684V?=
 =?us-ascii?Q?jdMZV2WbSWtfTHkHEI/tgOL9wZv6PGPMz3/y6RhioyF0tj9QkoeAgrYBnHuL?=
 =?us-ascii?Q?WPGieyLT5ABHWaqV4R2y74yzF7o+Pt2ZJFvOTsIL9DBodr4EKdw+veRdZ6O5?=
 =?us-ascii?Q?wbhXbHBzfo6KH0eDWJcmAQgaVMOr//NYGw4RvWKdgI9GfA9eT2CCFlhQnKc6?=
 =?us-ascii?Q?d+2fnzLvfLgeRH82777uX2vtbF0J4OgPdt+ExTJcJQ5matx9bFnIgDPJMI9W?=
 =?us-ascii?Q?TC6iK2LVVtf4RlYtAX+j1wFZPPobkbBbLpmq/8yNfUn56q51X/UFhTJExTZJ?=
 =?us-ascii?Q?c6WsH0PJ8VlywzYlO7mXZPVYfroHPo8XGqm3eB69w9CjZh16H3asIQq1qD1Z?=
 =?us-ascii?Q?+uRG83WwZ278x/+FzX7s+utv4lw78LjEJFoxMCCp119uGu10RcaiZ5LJPqiQ?=
 =?us-ascii?Q?bNMsqtsWFIncon/OppKL2TiukPA5lVikl4g1GFTey7i9T+AkbSVdiyuMY3U9?=
 =?us-ascii?Q?yvUWpzCgf/Pck5n8FzOMww/rZgJ4RGOqnQSAxAvurdV762XNI2hG6eVzDiLw?=
 =?us-ascii?Q?QnnDQrDOq+FNbPsLc8ZCIUSfEOpmZyzRP+S6xqcSxXTcHoEeiQY2QWY5wh8E?=
 =?us-ascii?Q?6xaNjfMxDuQJyGKEZmIsVmtJ5qbS4lVQR0MnGbDHqwhh0+puNW9V6tl5Xk0m?=
 =?us-ascii?Q?/sbu3ApZsRFqEbWq8v/WJ6aZpF7UFKSP+8mR1yJFcBHKfarn/qMJGIpNT+Qs?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b94e95da-84b8-4621-4a58-08db06251fa3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:27:51.8658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOiMFBL1ffm+i5aj5sNjpKcAW9g8HZ6pE9IEkmZBZtjHTtqQJDRMkjRe5oRiYOukldtf1n2W0YY6kLufw/FdLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/6] drm/xe: allow disabling display at modprobe
 time
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Offer an alternative besides Kconfig parameter to disable display
when loading the module.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 73 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_irq.c          | 11 +++--
 drivers/gpu/drm/xe/xe_pci.c          |  6 ---
 drivers/gpu/drm/xe/xe_pm.c           | 14 +++++-
 5 files changed, 78 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 62f54b4806dc..2e1f4beba9b0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -47,6 +47,10 @@ static bool enable_guc = true;
 module_param_named_unsafe(enable_guc, enable_guc, bool, 0444);
 MODULE_PARM_DESC(enable_guc, "Enable GuC submission");
 
+static bool enable_display = true;
+module_param_named(enable_display, enable_display, bool, 0444);
+MODULE_PARM_DESC(enable_display, "Enable display");
+
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_file *xef;
@@ -138,15 +142,12 @@ static void xe_driver_release(struct drm_device *dev)
 	pci_set_drvdata(to_pci_dev(xe->drm.dev), NULL);
 }
 
-static const struct drm_driver driver = {
+static struct drm_driver driver = {
 	/* Don't use MTRRs here; the Xserver or userspace app should
 	 * deal with them for Intel hardware.
 	 */
 	.driver_features =
 	    DRIVER_GEM |
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	    DRIVER_MODESET | DRIVER_ATOMIC |
-#endif
 	    DRIVER_RENDER | DRIVER_SYNCOBJ |
 	    DRIVER_SYNCOBJ_TIMELINE,
 	.open = xe_file_open,
@@ -159,9 +160,6 @@ static const struct drm_driver driver = {
 
 	.dumb_create = xe_bo_dumb_create,
 	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	.lastclose = intel_fbdev_restore_mode,
-#endif
 	.release = &xe_driver_release,
 
 	.ioctls = xe_ioctls,
@@ -191,6 +189,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	struct xe_device *xe;
 	int err;
 
+#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+	if (enable_display) {
+		/* Detect if we need to wait for other drivers early on */
+		if (intel_modeset_probe_defer(pdev))
+			return ERR_PTR(EPROBE_DEFER);
+
+		driver.driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
+		driver.lastclose = intel_fbdev_restore_mode;
+	}
+#endif
 	err = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
 	if (err)
 		return ERR_PTR(err);
@@ -208,6 +216,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
 	xe->info.enable_guc = enable_guc;
+	xe->info.enable_display = enable_display;
 
 	spin_lock_init(&xe->irq.lock);
 
@@ -267,6 +276,9 @@ static void xe_device_fini_display_nommio(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
+	if (!xe->info.enable_display)
+		return;
+
 	intel_power_domains_cleanup(xe);
 }
 #endif
@@ -276,6 +288,9 @@ static int xe_device_init_display_nommio(struct xe_device *xe)
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 	int err;
 
+	if (!xe->info.enable_display)
+		return 0;
+
 	/* This must be called before any calls to HAS_PCH_* */
 	intel_detect_pch(xe);
 	intel_display_irq_init(xe);
@@ -297,6 +312,9 @@ static void xe_device_fini_display_noirq(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
+	if (!xe->info.enable_display)
+		return;
+
 	intel_modeset_driver_remove_noirq(xe);
 	intel_power_domains_driver_remove(xe);
 }
@@ -307,6 +325,9 @@ static int xe_device_init_display_noirq(struct xe_device *xe)
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 	int err;
 
+	if (!xe->info.enable_display)
+		return 0;
+
 	/* Early display init.. */
 	intel_opregion_setup(xe);
 
@@ -342,6 +363,9 @@ static void xe_device_fini_display_noaccel(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
+	if (!xe->info.enable_display)
+		return;
+
 	intel_modeset_driver_remove_nogem(xe);
 }
 #endif
@@ -349,7 +373,12 @@ static void xe_device_fini_display_noaccel(struct drm_device *dev, void *dummy)
 static int xe_device_init_display_noaccel(struct xe_device *xe)
 {
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	int err = intel_modeset_init_nogem(xe);
+	int err;
+
+	if (!xe->info.enable_display)
+		return 0;
+
+	err = intel_modeset_init_nogem(xe);
 	if (err)
 		return err;
 
@@ -362,6 +391,9 @@ static int xe_device_init_display_noaccel(struct xe_device *xe)
 static int xe_device_init_display(struct xe_device *xe)
 {
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+	if (!xe->info.enable_display)
+		return 0;
+
 	return intel_modeset_init(xe);
 #else
 	return 0;
@@ -371,6 +403,9 @@ static int xe_device_init_display(struct xe_device *xe)
 static void xe_device_unlink_display(struct xe_device *xe)
 {
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+	if (!xe->info.enable_display)
+		return;
+
 	/* poll work can call into fbdev, hence clean that up afterwards */
 	intel_hpd_poll_fini(xe);
 	intel_fbdev_fini(xe);
@@ -469,9 +504,11 @@ int xe_device_probe(struct xe_device *xe)
 		goto err_irq_shutdown;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	intel_display_driver_register(xe);
-	intel_register_dsm_handler();
-	intel_power_domains_enable(xe);
+	if (xe->info.enable_display) {
+		intel_display_driver_register(xe);
+		intel_register_dsm_handler();
+		intel_power_domains_enable(xe);
+	}
 #endif
 
 	xe_debugfs_register(xe);
@@ -484,7 +521,8 @@ int xe_device_probe(struct xe_device *xe)
 
 err_fini_display:
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	intel_modeset_driver_remove(xe);
+	if (xe->info.enable_display)
+		intel_modeset_driver_remove(xe);
 #endif
 err_irq_shutdown:
 	xe_irq_shutdown(xe);
@@ -496,14 +534,17 @@ int xe_device_probe(struct xe_device *xe)
 static void xe_device_remove_display(struct xe_device *xe)
 {
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	intel_unregister_dsm_handler();
-	intel_power_domains_disable(xe);
-	intel_display_driver_unregister(xe);
+	if (xe->info.enable_display) {
+		intel_unregister_dsm_handler();
+		intel_power_domains_disable(xe);
+		intel_display_driver_unregister(xe);
+	}
 #endif
 
 	drm_dev_unplug(&xe->drm);
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	intel_modeset_driver_remove(xe);
+	if (xe->info.enable_display)
+		intel_modeset_driver_remove(xe);
 #endif
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a8d48987b2d8..6c71e1b2dbf4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -96,6 +96,8 @@ struct xe_device {
 		bool has_4tile;
 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
 		bool has_range_tlb_invalidation;
+		/** @enable_display: display enabled */
+		bool enable_display;
 
 		struct xe_device_display_info {
 			u8 ver;
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index f978bdfda99b..e1cc057f50ba 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -299,7 +299,7 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
 	gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (master_ctl & GEN11_DISPLAY_IRQ)
+	if (xe->info.enable_display && (master_ctl & GEN11_DISPLAY_IRQ))
 		gen11_display_irq_handler(xe);
 #endif
 
@@ -308,7 +308,7 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
 	gen11_intr_enable(gt, false);
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (gu_misc_iir & GEN11_GU_MISC_GSE)
+	if (xe->info.enable_display && (gu_misc_iir & GEN11_GU_MISC_GSE))
 		intel_opregion_asle_intr(xe);
 #endif
 
@@ -403,7 +403,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	dg1_intr_enable(xe, false);
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (gu_misc_iir & GEN11_GU_MISC_GSE)
+	if (xe->info.enable_display && (gu_misc_iir & GEN11_GU_MISC_GSE))
 		intel_opregion_asle_intr(xe);
 #endif
 
@@ -488,7 +488,8 @@ void xe_irq_reset(struct xe_device *xe)
 		}
 	}
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	gen11_display_irq_reset(xe);
+	if (xe->info.enable_display)
+		gen11_display_irq_reset(xe);
 #endif
 }
 
@@ -504,7 +505,7 @@ void xe_gt_irq_postinstall(struct xe_gt *gt)
 		drm_err(&xe->drm, "No interrupt postinstall hook");
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (gt->info.id == XE_GT0)
+	if (xe->info.enable_display && (gt->info.id == XE_GT0))
 		gen11_display_irq_postinstall(gt_to_xe(gt));
 #endif
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 927a050f3b8f..1d5b6afed2c3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -476,12 +476,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENODEV;
 	}
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	/* Detect if we need to wait for other drivers early on */
-	if (intel_modeset_probe_defer(pdev))
-		return -EPROBE_DEFER;
-#endif
-
 	xe = xe_device_create(pdev, ent);
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ddfd884796ba..4b3a1d8a8adf 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -52,7 +52,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
 	struct drm_device *dev = &xe->drm;
 	struct intel_encoder *encoder;
 
-	if (!xe->info.display.pipe_mask)
+	if (!xe->info.enable_display || !xe->info.display.pipe_mask)
 		return;
 
 	drm_modeset_lock_all(dev);
@@ -66,6 +66,9 @@ static void intel_suspend_encoders(struct xe_device *xe)
 static void xe_pm_display_suspend(struct xe_device *xe)
 {
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+	if (!xe->info.enable_display)
+		return;
+
 	/* We do a lot of poking in a lot of registers, make sure they work
 	 * properly. */
 	intel_power_domains_disable(xe);
@@ -91,6 +94,9 @@ static void xe_pm_display_suspend(struct xe_device *xe)
 static void xe_pm_display_suspend_late(struct xe_device *xe)
 {
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+	if (!xe->info.enable_display)
+		return;
+
 	intel_power_domains_suspend(xe, I915_DRM_SUSPEND_MEM);
 
 	intel_display_power_suspend_late(xe);
@@ -100,6 +106,9 @@ static void xe_pm_display_suspend_late(struct xe_device *xe)
 static void xe_pm_display_resume_early(struct xe_device *xe)
 {
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+	if (!xe->info.enable_display)
+		return;
+
 	intel_display_power_resume_early(xe);
 
 	intel_power_domains_resume(xe);
@@ -109,6 +118,9 @@ static void xe_pm_display_resume_early(struct xe_device *xe)
 static void xe_pm_display_resume(struct xe_device *xe)
 {
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+	if (!xe->info.enable_display)
+		return;
+
 	intel_dmc_ucode_resume(xe);
 
 	if (xe->info.display.pipe_mask)
-- 
2.39.1

