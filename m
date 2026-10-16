Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80196CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 17:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB39110E33C;
	Fri, 16 Oct 2026 17:29:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE6F10E33C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 17:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792171787; x=1823707787;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=yl2exvhzDXgaQIueZFy36E+UlKq4io3pctnREz6Cjdc=;
 b=D1orTHHTGMw7nxW82OeI76LgAeXfo0mM9LPQRb+kuun9K9MtWLAmPmQh
 9re/jLsCs01ssRPuGMX51gJeXrRRfUE1es+5zdf8K6ksGT0IcMTTvyRhV
 G6bRBe8KWcBs9Z5QmiKkfJrTgpVqj7LrUaUV+n1pBR+60iHergji/ryYx
 XF1gxVWJYSeASInufLTDWqI1IQrcf6krE9sbJVW1haHP3/6RFAnNC8fg8
 6Z8NhUYamI68V7fa1f/Y3MkXMvW+p/CfyMfwHhlCDAJdeJxOFEVSUjx9+
 ZC4Px6R3JoCfV8ZA6TbBdvL1fUvkamcGrtk2vfx/PvF+e8CxHuJEKXNYb A==;
X-CSE-ConnectionGUID: LTjHfJV/RYGE/p4GDDEaPA==
X-CSE-MsgGUID: BRq0/oJ9Rp2PVRLRJb4Gpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="976005"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="976005"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 10:29:45 -0700
X-CSE-ConnectionGUID: gKYsw0zNTXWuZyj2/RXjHw==
X-CSE-MsgGUID: DouCzrRSTASUxVQH/B4kBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="3836852"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 10:29:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 10:29:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 10:29:43 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 10:29:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMj+Sr9Fh+fUpXLMPAZTAM48t+163zJ2Uf7DyOs8snZIyg1GPnSkhBYxloEOXYrAINEjkLjiUxTHkbaOyKfnRDZrNnDF/PsO/mRFESsk0ux2FuJkR4Sqm6LwNUC4SxiUkfAJUlRZFz8hXN/UtjNv7pgfONrMh7FfsaOQnSZt0IZ5w8Ou/2KSvgnmRnxlskau7g8028/0zX1cST7XjZHMkjigDojM3o0kLp+mJweWDtqnkwhx7L8UTnzCdmYIx8+pxz40kI9E6nzUX2Cdo0Gvx0kbjVHeKACzc1BbDS/opP7U/H7pyB6bUfswDH46E/XpAbnzt11x/rIqdgUW0hOPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iLpbgD2qU2SHC4cvohYxNfoeGDzt8v+uudYe4Xjwkg=;
 b=JYMlmlj+l/zXJ4cYGpDbdKNkJ4E5999UcT+K9oEtKcFg8wruEZU+azpbtZC4LOnnd4xQlnusFocn0kXeGB7v6XkPu2HhhRy1MZ9bFg4Zp/DRo3N+EZmpahMt2c+KylhYgjuzmh69FVrZdWFUWl9/lkuvhK420KnZ/S9H/k6UgfZ44pwx2uqXML9NiWaWwOb4LyMg8SkON+DFxPeIXnu7Sbvup6TyRMnxd6lfoh27LkIN3C1y8hEfrpTvtQKZf5Xt6rCudoY4awoLtArCnZUvA6Vttu+Jg7HQQA5h5fl7VYS/u9Xj8cFWNPBISZX7Q1Plk+M5KBFrcN1DUCMSQ4UASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13)
 by LV0PR11MB945601.namprd11.prod.outlook.com (2603:10b6:408:606::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 17:29:42 +0000
Received: from DM4PR11MB7181.namprd11.prod.outlook.com
 ([fe80::89ec:90c8:3170:5f0a]) by DM4PR11MB7181.namprd11.prod.outlook.com
 ([fe80::89ec:90c8:3170:5f0a%4]) with mapi id 15.21.0496.021; Fri, 16 Oct 2026
 17:29:41 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Stuart Summers <stuart.summers@intel.com>, "kernel
 test robot" <lkp@intel.com>
Subject: [PATCH] drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m
Date: Fri, 16 Oct 2026 13:29:38 -0400
Message-ID: <20261016172937.2980310-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To DM4PR11MB7181.namprd11.prod.outlook.com
 (2603:10b6:8:113::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7181:EE_|LV0PR11MB945601:EE_
X-MS-Office365-Filtering-Correlation-Id: ecbf0c49-d1c3-42ef-2e7b-08df2bab0fd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|18002099003|5023799004|261009220027099003|261009223327099003|261009221227099003|261009221727099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: abH6goSph93yE8C611RdQ3urvvfO7jJcafLTfWQTmftkjTWp9/7d/BJelVW/UYSzyemLOnPmfFt0VsLhw90ox4C8C4l+uCjlk7Gc+90K5nS1qXaoW+J3Vxd8SZfrcoE6JyuSgi/846gqvABMcn1VNibTdI7A3o2ValZNADqnDnxZfNnM69HI2CAgTMXdW2YFLLDsGxAzGtWfcnfPjQos43G5z7sG+NzCAgXF/Swy1peyDbidYYQK6lSPu3JGvlzRmkao4HgzUTAnj1S3yyM0fhS8C3QC9j6L+M9thHRtNU9b3rNBQqp3gK8t/ZhoA8B66zIt3ZnktJlmfQMljHqBHEi1shGRw+MAJnVIyRLxujjZdplMvYmuCc4Yg89C29tZvBGmySENcAwQprV9GYrJ0VtILytH1UwFqvNvSKONpALrqhVwUfHF866ub8hUuSsziOOF/sHijpg3ZBc12f/OuzJ6v6lJB+wThdXltwmHLRVEswGE5JbT2cJWG4+RwMbDiie3g+cLq1e1O4SE9fLg2WIem1anO63bVXt2nSVy89CqSCLDbYIZAMFveygQe1IKvNfmb7syxlmzdUxLH/ZdKNEsVtiEfxWzQQzhaJQzlp2IeXiXV3qr0NiL+zzPXcMX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7181.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(18002099003)(5023799004)(261009220027099003)(261009223327099003)(261009221227099003)(261009221727099003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sDO7tOPgYvNWYr6ZoJ7G8JhSn1YJT/I3oE3nAATCPFy5U/3RheV2Q96C7vty?=
 =?us-ascii?Q?OP2Lti/afhSlcjhsEcN8SeJQYXB5B3uqhW4T0Uws3yU+kTodLx4imKN+dJR+?=
 =?us-ascii?Q?DMq2Mj5/H+N4KsFhxUKM0Wa82y/ThOBr2XhCX2XPwot2ebNWT5R9GwfN8b1K?=
 =?us-ascii?Q?aSlWIFD4FKwGcFoechwujMK3u0Hjui7NWNr5EvMl+er+gbdru7W+qfS2dFJ/?=
 =?us-ascii?Q?UWQbuSVdXD/BFQZeedlwLMokdn1yS1/6WitO89U74UzViifcLX563HFyrr16?=
 =?us-ascii?Q?bv5NV9Tzxfkoxlmp7DyXrKhhouSyNc52GB3nOx1V6lgmWvBVn72ZGVeok9W2?=
 =?us-ascii?Q?ACDn+QEJEOjB90B3T0Y/HzWiMOKCEcTf+PeYB2VCopEBWCLZEUoQTk3D4Xym?=
 =?us-ascii?Q?YUOihY6yZOjHJJnyrp4yBWL9f1JqzQQzHqm0aINHPVuOU4dL2SwoM+2d0cce?=
 =?us-ascii?Q?sGFcYHnErjHvH3y12aGMGr7zjR6TCMo4/lI560Rsr2pCxSymWZurze2viCma?=
 =?us-ascii?Q?BZSAD+Wf26UNktEbiniMIqJO4Y8kFEfVMh10QwLgJt7rF/UaBChvG2/nn+UH?=
 =?us-ascii?Q?E4CdnrElxH+zAJK/w5bL/HpJvtsRg2cCciKUJBsdA001RrA0aWGLjQY1J3wS?=
 =?us-ascii?Q?KAoTyvsj1v7gzXw8894gaJdrP8ZO5hRXNJcR7xWTm5fP0vu5x9S8MROuYGGS?=
 =?us-ascii?Q?g6LQNEQwkIo+1MbtQc4VbuKxk1ZXh6VRqG9K2ECvUXb3WXC/V0EixVbl9dzC?=
 =?us-ascii?Q?VgLLhKabeWEEEyeUHksWuDo3xQAois5fNarxbO1ScRxHaK2G65MRPOiBl7D/?=
 =?us-ascii?Q?xtckSCwRz5eS00qh1huvQOHjjUtN44jg1bBcsHM6Dofd4dj3IrQavgzG1KEh?=
 =?us-ascii?Q?fB4yjLff09V2OPH4sjPgDaWFOXTxKl/lbHgMDodIvYYnZwuk6hmaqkaE3TeM?=
 =?us-ascii?Q?YAdojre5ng5NIpQxO1G/t1IfkFqGh5CB9uBCVNft7RDF1vAVk3QLBp0uLSsd?=
 =?us-ascii?Q?ekZrSndFmKkpTdVMo6S3sdleK8lFMLtSUrxfW78WbAkHceUWzMvT6XtTq2wU?=
 =?us-ascii?Q?tkanaWYDq9G/yi/k6H2qQpPqwNpqHd/JAb17vE004Jeily0YR9k/DrYQSbo6?=
 =?us-ascii?Q?joXapihRZySr6CPymAsMG/blGfgCQ8U0H9MJTiSxg6iJqUZZ/mt5HydKi/8j?=
 =?us-ascii?Q?qiQ21YHiuL5NSpOs9RoraXE2SIpUFTjSxUSRlMSPHV2r8p0GHHHJlBkhCiU5?=
 =?us-ascii?Q?AH7iUgEnJ/QuTF52jK8CJOi69SBGSUXE+jFtw+6m9exVeuZwOH/iEnZS9e+Q?=
 =?us-ascii?Q?WWAWzPFDa2HJTufv6A3r/QXTuuTmez7wFBA37t6OdgJielzPlz3AFPJd00h1?=
 =?us-ascii?Q?QdYrRSAqLbdp0BJY0GzfA59WY0ZiaelmKO+bi96QJ9AWDQ3SKZsbH9JVNlXU?=
 =?us-ascii?Q?j3mr9dl2QeVOQfYz3Vxs9fSFizAzOMjfmlAA+Erk/6m0UWjL+Fegwye0sfo8?=
 =?us-ascii?Q?lycd9mviSmbBvKXs0bVxQdbao8TcStqBqdHyLZ3Nq9VlpkQvelLNXvHIfGG4?=
 =?us-ascii?Q?EZtBWr4J4HdV75gCFszj1Jgl/hOVb1H089yAABTTFtJk0J1BiDklA+gnt4gN?=
 =?us-ascii?Q?NyN/My4YMCtxUnV930HIWjBXnJUnt3MctiYTuf07nc/WaJ2OECIw8Fm5Ok4I?=
 =?us-ascii?Q?8isnJ8yRKcUBfBEyn7Bkx+10KGp83H9gGskUOzkiKmnfW3gxPHyFyfs0WIFu?=
 =?us-ascii?Q?ASql2YSUMw=3D=3D?=
X-Exchange-RoutingPolicyChecked: qaHdQRHbkX2suGOwQOf5cDlk7rFF1D2GPYd+nxhxDMVyGNYDCwrx4kV7HjajgAubfGV+WTfEJ0hmRO6zZanchAczGj3vPGyYEfrNLiNla6Gfeo9kRDsAm10mQpuF5XiwsEinrQWdtAWMzLZWLglsL8zSmrxkngKWwUwLtpGrbfwnOoWefGTrCtsFQWn/0g/TyIsbYLeojZnww3Jp5Xz/nGbxQeRbY6V9lN5OEPfMfc6RDOJbVGXiEqJU7xOQmegZRu3ZuGlGh2vEfvtti3JMPA1sX1AYpPbITzZ+5mfAyHve697bx69wlNAHHuvUBoGEb2Brn1idD9DcPIeJiWRAnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbf0c49-d1c3-42ef-2e7b-08df2bab0fd3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7181.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 17:29:41.7438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccrmrXAeeSIo/NbNgvtIVXneiWlk9Q3o+uk4EXBrFIb43D97IeLyfMxKRLoHxME5U8roOiphQzaagdq8vEbWtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB945601
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

When xe is built-in but configfs is a module, xe_configfs.o ends up in
xe-m and is never linked, while xe_configfs.h still declares the real
functions because IS_ENABLED(CONFIG_CONFIGFS_FS) is true. This results
in undefined references to all xe_configfs_* symbols at link time.

Adding a "depends on CONFIGFS_FS || !CONFIGFS_FS" to DRM_XE is not an
option, as it creates a recursive Kconfig dependency through INPUT and
USB_GADGET. Instead, add a hidden DRM_XE_CONFIGFS symbol that is only
enabled when configfs is reachable from xe, and use it both to build
xe_configfs.o and to select the real or stub interface in the header.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610160935.Qk4ZxBxY-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig       | 6 ++++++
 drivers/gpu/drm/xe/Makefile      | 2 +-
 drivers/gpu/drm/xe/xe_configfs.h | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 0d87251c5d7c..9479340b5808 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -116,6 +116,12 @@ config DRM_XE_COMPRESS_DUMP
 
 	  If in doubt say "Y".
 
+config DRM_XE_CONFIGFS
+	bool
+	depends on DRM_XE
+	# configfs needs to be reachable from xe: built-in, or both modules
+	default y if CONFIGFS_FS = y || (CONFIGFS_FS = m && DRM_XE = m)
+
 config DRM_XE_FORCE_PROBE
 	string "Force probe xe for selected Intel hardware IDs"
 	depends on DRM_XE
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 10930c924070..588091c529e8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -166,7 +166,7 @@ xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 xe-$(CONFIG_HWMON) += xe_hwmon.o
 
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
-xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
+xe-$(CONFIG_DRM_XE_CONFIGFS) += xe_configfs.o
 
 # graphics virtualization (SR-IOV) support
 xe-y += \
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 10a00d6bbf8f..063e73fe01d5 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -14,7 +14,7 @@
 
 struct pci_dev;
 
-#if IS_ENABLED(CONFIG_CONFIGFS_FS)
+#if IS_ENABLED(CONFIG_DRM_XE_CONFIGFS)
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
-- 
2.55.0

