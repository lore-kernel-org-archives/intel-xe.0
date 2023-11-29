Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B319AC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7A810E5DA;
	Wed, 29 Nov 2023 01:17:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCB310E5E1
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220617; x=1732756617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8xWmFhsUCLniF8JLTtpED93aGZ7fW543byghCpDiYvI=;
 b=cW7p8z4LApIbD561ptLRgLO8Eu7VF0FcTpusgv+6zd1vewCtWYY5tzMY
 2v7k3aAjht+5pK2tpnoCibJVhndL4OsJtNPWzh+FXGyPmZUvkBNrdPwH1
 DAXeflSUEqSdVYgsdgzylA7hmUukrayXYVeNUETQ93PqFTcXRBYJH1Uug
 Q0oQKoSfU8MZ3RUp+zNgtPAskP0prvrx/V/vycz7coWVw1NZz3M8EO/9p
 Yx3PEWMK4Ufa9o6qIMfBIOAn3nPw7c9S1IuNMIgSh/XXh8rVSlJNAB5Tn
 hgmGdEaiU2gTdMSdKj/ouMO4alFsJQ6UYxgsW+RKTNF836DJxUJj6U7Bq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436557"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436557"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:16:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272620"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272620"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:16:56 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:16:55 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYlflcnaquvJF0UWX+IE91JKpWuitqrQ7ZYJMoTL1QgioUxcvbFopMi4pJcvhUySVf2dIBfR9b9xru60v5S9jMU+IAx3p9nCsn7eEwSZwTGLDoa5xamY9Ojf2clmuqBlQNpWJH1SCWcKinD0dHGin1lEEfO3Y1eoZ5KaI7p4r5rLB/bd0rlEJgAJ4DQlE5ZhQSi62RzKk0dteytuA6rafWFpSmDu6JNT9ny1tBlqblV/M9eHf/YNrwfWyXf7X7EtzifI4qSvggZntEbcn9nTgSWLW0sSn8No1ADBEfWx48gII4Bg89S5Ssx50zGhIsg5qIFPmGpxBC1at3RK7CAJWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpgMaTvdN275zKWCpWHbacxqTK087c6cn1CKvAA1uF4=;
 b=KcOXA0qTns6Uvb0Vl6Y7NtjB0GeyxPCkYOacnXiYLEXdD2m74lqCVl3jb+0gdxRaxTWiLP3e/ZEcg0uZXyYscc+/ewH8ADWuE8nSKbSTRak0GPKjUu0oKPURFJ+8qPrWgEtSv/8RIgy/4TYVrQRqmkEOeQa9LlBAXqoHHG25DxTC+JRXLMdazEL0rFG6pKjPQjIAjNN2Tjo4IXi+ZTO90yYQdIVqw0FioMOGRo4HUOCqZ1h8u3iR6ScbUX80mtbodzRpOkboK5pX/wNal47I4hSyJt/aWLawnAQTuoTA31nGUI54DeA8m+uZV56BojOUntcI+bI4uxkqTDZYi0m7hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ1PR11MB6298.namprd11.prod.outlook.com (2603:10b6:a03:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 01:16:53 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:16:53 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:08 +0100
Message-ID: <20231129011624.836843-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ1PR11MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: dc01d0da-5691-4eb4-653c-08dbf078def2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HxHCfQyhHQKBtZRWdF4RVn4sMfLLoMAQYT6D4AlJMKsizMIWOwmPzFugkDGBysP/xndBtWhTVFn76edu5t30qodlLfhzKPgcf9KEVLGM2VhxYTG11Ih481LiWmCqXohoXWF5dK81j9u9bHC7sq7Fk1bj2jo3ASev/jUueDBD8hBivtXlPXUAy3nVKFlKLRcjdcrCamMiAthUCDBrDfYmrowccMjKyYRhlpS66GE0XGrk2VfIBMpCAsgRhDo9RKjoNChw6mjk1aVnFMcMWb+sadafvVE7hHN3YX63OGegQxxyriQ6abNRflKNOE4udw9JnmMEUKCenHgUNWtUV8A1XOGY/OxjXF/vFgcvj1FLKOS/no8nOF5dhs/bb9Bn5CDxZxHJv4CJarKU2jXyKXJNIRJ8exs7xEo0Wp4C0/fFNAdx5WDFGZM+hf2uUV5/iWo7JLfruGdLn178+nth933fNxQUZfBjTXyJXYhmHRTMIsHtv75vz2GRVyuCXJowAAP1ygYj33KTeKRmfLGfrM0QTjqndqPi1hUjJw1wFLLSAasgENb9bzxR90b8w4AAqET7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(41300700001)(36756003)(86362001)(1076003)(5660300002)(83380400001)(82960400001)(26005)(2616005)(2906002)(6512007)(6506007)(6666004)(8676002)(8936002)(4326008)(478600001)(6486002)(54906003)(316002)(66476007)(66556008)(66946007)(6916009)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U003MHkxM1d2VGluMjFPYmlhUUJNNlA5QWhHWTgvUzVheStQRVhHNUJCMkRa?=
 =?utf-8?B?NFZzQlRuaVlXYVY1ZXEyRXhjV3RzTk5RbERac3BvZmlGNk9YSTEzV3NpTHhY?=
 =?utf-8?B?Ym00bE9zU3A2bnFwV3NVVVc5cHpUcXlCNmpvUVpBNFNobnNLVHdLaUpRT0R6?=
 =?utf-8?B?RzZFNGdXMUo4Zjg5TkhDVnJGbGhoRno0d3drTTF2T2Z2YXl3WUk4NUNLN1RE?=
 =?utf-8?B?Wm4yUEtDMVFHcS93a0x6ZEN1ZzdjMGNNZHFwMGtUNnRBb3FiZlRrRGlmU3pl?=
 =?utf-8?B?MGlTaDVZREViNmpCQnU1b0d0UGtRUS9aang3WHY4eEtKYUR1cU9qcEdiMU1a?=
 =?utf-8?B?bHp4Z0lWM29GWXVTWlQ2NXhZL2k0QW83OVoyV0RXQk01MFQxUmQ2ZmlacjNF?=
 =?utf-8?B?RUtBMXdDWUR0ZmM2WUF5ZUFSYUhvSTlFdlJzNzBQbkFZb0JEQ00vTTgwNFo3?=
 =?utf-8?B?bm1aWVRHcEJSTTREMlR4bWRCRkRvTHlpRTNkKzV5Q2pvc3h5S3lSeEpBK1Ax?=
 =?utf-8?B?bVByQVgyK2VLeHZjYW1LNVptUDZYQTBrbWlEUTRsMlU1WGlHcmNTdk9uN3Vp?=
 =?utf-8?B?ZVNEaGNhWGc1NWhuQlZxa0R5Y3NEdXBRL2RiYkRKakE3Tnhibkd6S3RscktH?=
 =?utf-8?B?RVhPTXFPSjAzK01KNkFvcUVnTzJkR2tOWjNzTzFkY3FRa291SkhqV082L3dE?=
 =?utf-8?B?MW1rK2xHS1I5RTBGUUo1amdDbzRZNFB4dUludlR4K3dUQkQyNnZJazdsc3px?=
 =?utf-8?B?ZmJEYTJXMHF1R3puY1MvWEdXby8rV1laVUlvMU95ZXFaL05vWFZvTEdDUWN0?=
 =?utf-8?B?aUxOS29Zb3d5SUlMZk1qbkxhd0tLa0xwbHdiRmVSemVIZ0xmUlVMcHVkZWh6?=
 =?utf-8?B?MHBlQWZhSCtXeXRjWWdZc2tSMk9kQ1dnazlyb3dlUmd6ckNlSFJKRkRDTGZW?=
 =?utf-8?B?aUcrYVI5Unowb2s2dnROQ2kwUzJodFd1b09FeE1QQ1VYT2xWTjd0WHpYcHJ5?=
 =?utf-8?B?d2FtV2FkbFptWGYwVnlwdHhmMUllWFNsK2tYZzdLaE5DOWFvME5WK0l4K3Jl?=
 =?utf-8?B?N2xLVGExU25WYXJKL1pQNXh4T3E2ek1iWjF3MzM0RDlLT2o4Lzgwcy8vTko1?=
 =?utf-8?B?a01Ta1UxNHlkYkkvTTdFRTc3SnB3TWJJNXhrcHNCOFpKaENsNWNqYzEyalpn?=
 =?utf-8?B?eWNsUHBJUmU5dkhYNVJ3N0h0MmFBY3ZaaDBtQjNYRi9kSzdpMkVKMG10WlRS?=
 =?utf-8?B?TEx2RUFiV2lkdGFyNTRzbnhRUXdNUXNZYzBPazluZWp5QkdjRXpXK2ppb2ND?=
 =?utf-8?B?NzRKZVJoNGk0MmFnS2VCL0tNUzFaeGd6YUdLbjJkZlVxVVRwTFdrbEpBR1lp?=
 =?utf-8?B?NWhwNCt5RVE1Y05IVlNRaGQ1QUFVVldEWDZGSVpsUE5JTldMNzl1eE03OVh1?=
 =?utf-8?B?V0JMZDJPbnhmVVV3a0FWeW55SjNKZUNFUHpXVXA0S0NyeVFvTHUvYXR6SEJy?=
 =?utf-8?B?TnVCN1BGeEJEQ2FyT0t6M1R6WEtlazcvbXZxZ2V6SytvZ2wwZnlTcDBTaUkx?=
 =?utf-8?B?WGFOVXFWdWFRNGNmenlmRkNHa0Q4YXU2bW83dkRlU0U3OXFpU2wrTzhrNzZk?=
 =?utf-8?B?LzZPR2VlcXB0Mm5jU1VMYWduZ1hrbjJFYjYyTzNIM2phLzNTWVZYRU80YmVh?=
 =?utf-8?B?bE5Ea3EweTJiRGIzRkh4emF5dW41U2x5a0dlcEFJWmxQR2Jpa3FBMGphNFZ6?=
 =?utf-8?B?M2FGcWZzREZib3ZiYnAzamh2T0M2U1YvWkF2OTlsU2FlR2pWTWVJUHBXVUMr?=
 =?utf-8?B?Tm50U09rUnJPQXNNU2pxbXRXN3NaTjdpajZ3YTRCS1UzVkpZLzVybVk0akxa?=
 =?utf-8?B?U3lCdzFWYVhnN0h1R2p2dHdwMmVpZFpGYVJTL01xNjZFQXloYXFtS0U3TFNw?=
 =?utf-8?B?MUpsa09CZEQzU1BpcURQNXJTYm5yakxIWTJ0Z1lXZ2lZR25NOElkWituVnFU?=
 =?utf-8?B?VFZDY0Nwb3E3d3FGcDVMRXQwSmJFM1hFaUU5WDAvdEo0OWFhZDZQVWQ3OFBB?=
 =?utf-8?B?R2pPeDNhWGFyd2p1V0Jwek5veU4vaHRmYUhpc29lZUM3UWhWNjZFVkRyS1dO?=
 =?utf-8?B?UUgvQ3g2OUMyWU5mRXVsUUlrZ3hOV0tENnR3cGdmbnZvcHdTNjh0QlFLUjJN?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc01d0da-5691-4eb4-653c-08dbf078def2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:16:53.1127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPtlIe35vkrlKh2E2jjxkct9nguZase+rbUcd6KuMMwnm2gabI6dtUn1IQDd1r2Qa9fMWIDDbPcjpBjv8CQ/U60IXMY7tWetMUxS/clM9K8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6298
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 06/22] drm/xe: Split xe_info_init
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Parts of xe_info_init are only dealing with processing driver_data.
Extract it into xe_info_init_early to be able to use it earlier during
probe.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c |  1 +
 drivers/gpu/drm/xe/xe_pci.c       | 44 ++++++++++++++++++++++---------
 2 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index a40879da2fbe1..733df9a270db2 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -143,6 +143,7 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
 		return -ENODEV;
 
 done:
+	xe_info_init_early(xe, desc, subplatform_desc);
 	xe_info_init(xe, desc, subplatform_desc);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index cc5dfccfb8c08..abdd2ca4b6ac2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -534,6 +534,35 @@ static void handle_gmdid(struct xe_device *xe,
 	}
 }
 
+/*
+ * Initialize device info content that only depends on static driver_data passed to the driver at
+ * probe time from PCI ID table.
+ */
+static void xe_info_init_early(struct xe_device *xe,
+			       const struct xe_device_desc *desc,
+			       const struct xe_subplatform_desc *subplatform_desc)
+{
+	xe->info.platform = desc->platform;
+	xe->info.subplatform = subplatform_desc ?
+		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
+
+	xe->info.is_dgfx = desc->is_dgfx;
+	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
+	xe->info.has_llc = desc->has_llc;
+	xe->info.has_sriov = desc->has_sriov;
+	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
+	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
+
+	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
+				  xe_modparam.enable_display &&
+				  desc->has_display;
+}
+
+/*
+ * Initialize device info content that does require knowledge about graphics / media IP version.
+ * Make sure that GT / tile structures allocated by the driver match the data present in device
+ * info.
+ */
 static int xe_info_init(struct xe_device *xe,
 			const struct xe_device_desc *desc,
 			const struct xe_subplatform_desc *subplatform_desc)
@@ -545,10 +574,6 @@ static int xe_info_init(struct xe_device *xe,
 	struct xe_gt *gt;
 	u8 id;
 
-	xe->info.platform = desc->platform;
-	xe->info.subplatform = subplatform_desc ?
-		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
-
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
 	 * descriptor to use from hardware registers. desc->graphics will only
@@ -574,14 +599,8 @@ static int xe_info_init(struct xe_device *xe,
 	if (!graphics_desc)
 		return -ENODEV;
 
-	xe->info.is_dgfx = desc->is_dgfx;
-	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
-	xe->info.has_llc = desc->has_llc;
-	xe->info.has_sriov = desc->has_sriov;
-	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
-	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
@@ -593,9 +612,6 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 
-	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
-				  xe_modparam.enable_display &&
-				  desc->has_display;
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
 	 * version 13 or higher has an additional dedicated media GT.  And
@@ -708,6 +724,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
+	xe_info_init_early(xe, desc, subplatform_desc);
+
 	xe_sriov_probe_early(xe, desc->has_sriov);
 
 	err = xe_info_init(xe, desc, subplatform_desc);
-- 
2.43.0

