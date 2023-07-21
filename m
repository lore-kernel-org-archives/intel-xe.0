Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C4CEB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 20:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE1610E6FB;
	Fri, 21 Jul 2023 20:22:04 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B086910E6FB
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 20:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689970921; x=1721506921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BK3F+z52XKfHNP2Axav7Fyy0VJ/kEVmCXCCAuvHRtb0=;
 b=L5EpVZICrqsgOyOM+u03i41bNioD8FOBqBYkehsDoOiw+OokvXtCbMNc
 YPo4oNSo3u7fwFoYcykB4O0hV6xifmrCmDPClCGEe0g2M8rLrlk3Lr1Zl
 bBRsZw/tAOkY1rtDzTkkOWyu2ADHfZQ8TBabEMSFrtYlriGioUqgrztuV
 /6E4P1ZDdgumj3wUGxiuwBFOpVR0Ll3AQchehHqidlCop0+7AT0PlKfPT
 SsYGM9Dn7aCyA0OPKwdlRJ+Ne5Jf0xLR1+NryHc9mmupzO1zBlRgJUozV
 b+Mozl9YocjiaemGK0Lm+2BeckX/7e/P3eTGkvF0bKX7j/NGCAlFsnsP9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="347403392"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="347403392"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 13:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795074653"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="795074653"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 13:22:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:22:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:22:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 13:22:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 13:21:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNeqGtxSmumNLp10dWUbjMF2MxNR2TLe7zLqUNopJGGVF03RBFScnWbsrpWMK0Vc/e/ZRJyRNNhNVrRtutnXl3MPwBApIHbGwz4qNqR6ycKICV1Iar3vCarIab8h4gyecN3QO34+ii521QsTV3/L2GTxWjkIeBeG7nyao5xDrTAZU/HabT7ALmM+E8ozefa4CMFjhqu9f2Yva7A3GDLBop4Wzvr/G5776UW0PPdONAQKnQuA2upLtlVJsRGZ4gjNYnKw8w744p30nmIN9yUuIDLLnoyQhPFDXhVAw1PJeKyD+xQxF31OQ/XVSlyVzuLHGZy2dXEd7+4MY9Zf1/3LMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewgxuIJZdzMwLByd2DuLZqHKO9q0d+Hxk5sE5EDCDr0=;
 b=YEvvxwNu8IQ/s269umbESkeA1p9MR4UCu0+fD0o0yBSJJ20K+JA4iO9R0K7MBL5pQdgfacTiVPW0WiY66qMbLRTOgbt3EaxRbX/gU0o2nnRzydQlOC9Ongpf8sa7OYAMCWSHzfxfhYSYIGFExf0Bym+AVDyRfjwAZVT+Qa3bLXuwsPE3wa5hz8EE1Way8aDYFomEmKlLN/x1aGWvFQ+ChTrlrQoByXdCn9xeFCmlJueIXx92+tVJ6vPPy4dWdqvt6bg271+hM+aCNKJBxC5oX33BvSnmckF2gzDnVTM9W+W9kqjVefCQ9bcZqf0q9NUiQ2d9unojR0poTp1pZu2REQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5233.namprd11.prod.outlook.com (2603:10b6:610:e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 20:21:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 20:21:58 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 21 Jul 2023 16:19:13 -0400
Message-ID: <20230721202144.269837-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721202144.269837-1-rodrigo.vivi@intel.com>
References: <20230721202144.269837-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:a03:505::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5233:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4f42dc-b916-4fe6-f412-08db8a28224d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hLADf/cJqCxUR5UFu1cK7+MKdaZFssUsrbDHqW4kkatLKXQXWU9RObfR3cx3v4LIy7gvqrssPiiGSRgyys9U8uDLuo59u5tXOUnkTCOPXnivvgWzNDvM14dxlX2bns0XCgt5sGZx9ciOhP1N/mafvhlQdUVkibUqprLv5KkzXKAvvKKSMorrR/7keh3bZJppo1SOV6/HIdstDeI8gVUd/MUicoR8Zqed4AyhIYOgsnbJVLmriX9W04Sf1oVJoQRnOvBSlhPNztMnYjryW2kkipETfqelt6MAVwGlzX9BdZaywnqOwYTO+1W8fjcdtIFwZRgNrkouX6K5EiT9bV9hFKnEtKJZEPoic3f6qHKSwIlw7Nw4liM/mxkL3Btc7+BDKU0aVI3VTuIVwftrtjt9YFQa+KXvw1A6th3Kx2h23EzUSXvmsRcMRrQ9R1MI/eDfDMIs6h/PaRaEngifN3VvvfKgXHqVyGqOG+WDf3ygRh57LOEW5/QcegX165ibwoZUzhReD4yZC0413mOOmN5uNBlIImw/20/fOvf2nVDDX1+pxUIe2IhdXI+tIAJMYq8r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199021)(107886003)(6506007)(1076003)(8936002)(186003)(8676002)(26005)(44832011)(41300700001)(83380400001)(2616005)(36756003)(82960400001)(86362001)(5660300002)(38100700002)(478600001)(66556008)(66476007)(66946007)(6666004)(316002)(6512007)(6486002)(4326008)(6916009)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FzLw3Z9EQlduwQ3V08oxiD7Oo6uxr5sUhczgJ8GRqDrqsVSuKGTja8j/+NXP?=
 =?us-ascii?Q?hQArWq7eQfg9/i8sNfjjfZDKup9vJCbG3GiD3zOin65GcSRAJXHuvg7dt+xQ?=
 =?us-ascii?Q?HR04CIfEaRjfdLdPTN/RiYPQtf7xfJypDySMlDNdXPtAGpFhwIhWw6A+eBSw?=
 =?us-ascii?Q?WIs8Av1Aik2icJYJTqDBI8DyLMnBkSkp4ll8+Qf+mIgPqkP9irM2AS+r+Hgz?=
 =?us-ascii?Q?YDy/aJDaFWFplsukCA2PNVxA1wJpmeEXK2nDkb6tkbgJAY506Woi8kmSImB8?=
 =?us-ascii?Q?I34a+sA6NUA8ne8S933p7xbKqq00QCZfCbbC6tDO/eNSyi8+BmFeGYyvUzKO?=
 =?us-ascii?Q?2din4VL1NZdkXAEi677IFC/HZwrYYXeXvkPrxqB3c4C7XqAHVonl6gj1gO2W?=
 =?us-ascii?Q?i0EMO5t2NKO69e8KLOTrK1IexU+US2iHKakmFvX6UUSZe8+GV6olA753oyDl?=
 =?us-ascii?Q?mPpJc1HnWGOtDo5TiyoQCEZA7RYzo5C/1/yvWl8qbpNhce2vSZE0yzh142wc?=
 =?us-ascii?Q?xXWfLa9F79Bi2s3/d+FIvM9iEEdN8ZXEoiiHymGSmF7Jxb7XM7wOOjZrGOUy?=
 =?us-ascii?Q?5FCwbXnEtL4Mj61p4wcBpRN4i14GFgVvW6Zj53sZS2bvxgezWLsnCO+dapGR?=
 =?us-ascii?Q?cXRNgAnctxOEps/lQ/+sFa9O9w1P3GBOuY65wnk1ZEdpXnLV0RuzKnq7s/2p?=
 =?us-ascii?Q?kx9Xs0JXZ38tsGDmhHSygrkgXtT5rv41rakXCuG+fJ4SGMK4O7lhHlB+m42L?=
 =?us-ascii?Q?u/RVzQMhDbQAhuFIIlY5SERgFlRok4uym0ue3OYq2ATnx3oS4docFSSa/FgH?=
 =?us-ascii?Q?1H3phbBTKnl7LuEtHyDPkP1/gWQOxaNqc/QegPSnZeDEctJm0NqcqMGlbUX1?=
 =?us-ascii?Q?WMOoSH1xDHZ1juRNjK0mAtKZWF/iatX1T/9loDgHiB6Y2AvYSuCm/ifoQAMz?=
 =?us-ascii?Q?XzE5LrfdMMPMp/FPAftMBZ0+tT/yurXmmCvUPd00JmkW6ViyOUeeLDXpuYQq?=
 =?us-ascii?Q?hjktedF2ilAXH0KrsjDD5V/ypUCeEnSUUWzt1lf0sfE0svmldVnu+4mrV2K2?=
 =?us-ascii?Q?5GrnxmTq0ydhJ6MKZNhaUT8XPwIds6KpbJY0zDjpanP97JAH3NBEmxh6TDP1?=
 =?us-ascii?Q?S8ihKebACKgH0wZ8S4Ql76kvMEdW2Ym4Y3yzUT4cmivBQR6sauh4UQ7X5TRe?=
 =?us-ascii?Q?LUqfC0dl+1BaARLGHv7Xci9S7ZsaXEtFgkZS+NaC12FUAOBeFK2OWVHoOBs4?=
 =?us-ascii?Q?7WfyhX9AVO48/cNORX9/WToKvJ/w3mrSzpaCXe9PcpCzhkWF0p3H7UEsl13b?=
 =?us-ascii?Q?X76SN4Qmrgt34sBtrLiVnaleq/EoRdSzyCb6YaOQidxYX13PZHukaeZ+hPMJ?=
 =?us-ascii?Q?lMuQOqcMkD4KyE1MrjFSwGhaoExOhvXukfQ6Mx8/kRLsOCf+PqZbNEKm8tRv?=
 =?us-ascii?Q?oDMmnlBZPr1wzRczmLBzZg5PiebVnX18/Rro8ml+YE8z9lt5BvvqZ0CqszB2?=
 =?us-ascii?Q?USNef9sRp5MN3kNTDjDlAkjltcQsYQebd9d/TySCvcxey5yKGKMGhzTVr0Ws?=
 =?us-ascii?Q?9UwL/kLTrgIzhfiFh01v1zctoXLPgL3eIQduiO3/zB2150Q4z3mfWF81DNTv?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4f42dc-b916-4fe6-f412-08db8a28224d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 20:21:58.3893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJ5zR8gjtejBFCDX2a2tOrFYHCi7KeTMQbEJ0YjIPyH12jq+//W5qhlZge5vvM8X5y+KkZ17pJTmR1aOxttr5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5233
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Invert guc vs execlists parameters
 and info.
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

The module parameter should reflect the name of the optional,
experimental and unsafe option, rather than the default one.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 2 +-
 drivers/gpu/drm/xe/xe_device.c       | 2 +-
 drivers/gpu/drm/xe/xe_device.h       | 7 +------
 drivers/gpu/drm/xe/xe_device_types.h | 4 ++--
 drivers/gpu/drm/xe/xe_module.c       | 6 +++---
 drivers/gpu/drm/xe/xe_module.h       | 2 +-
 6 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 047341d5689a..491506a1e12e 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -47,7 +47,7 @@ static int info(struct seq_file *m, void *data)
 	drm_printf(&p, "revid %d\n", xe->info.revid);
 	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
 	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
-	drm_printf(&p, "enable_guc %s\n", str_yes_no(xe->info.enable_guc));
+	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_execlist));
 	drm_printf(&p, "supports_usm %s\n", str_yes_no(xe->info.supports_usm));
 	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
 	for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1c57944014e0..7221806c1693 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -203,7 +203,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
-	xe->info.enable_guc = enable_guc;
+	xe->info.force_execlist = force_execlist;
 
 	spin_lock_init(&xe->irq.lock);
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 8b085ffdc5f8..0ee44856ad08 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -112,12 +112,7 @@ static inline struct xe_gt *xe_root_mmio_gt(struct xe_device *xe)
 
 static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
 {
-	return xe->info.enable_guc;
-}
-
-static inline void xe_device_guc_submission_disable(struct xe_device *xe)
-{
-	xe->info.enable_guc = false;
+	return !xe->info.force_execlist;
 }
 
 #define for_each_tile(tile__, xe__, id__) \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0cb6b0d5bf9a..b156f69d7320 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -217,8 +217,8 @@ struct xe_device {
 		u8 supports_usm:1;
 		/** @has_asid: Has address space ID */
 		u8 has_asid:1;
-		/** @enable_guc: GuC submission enabled */
-		u8 enable_guc:1;
+		/** @force_execlist: Forced execlist submission */
+		u8 force_execlist:1;
 		/** @has_flat_ccs: Whether flat CCS metadata is used */
 		u8 has_flat_ccs:1;
 		/** @has_4tile: Whether tile-4 tiling is supported */
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 75e5be939f53..de85494e2280 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -14,9 +14,9 @@
 #include "xe_pci.h"
 #include "xe_sched_job.h"
 
-bool enable_guc = true;
-module_param_named_unsafe(enable_guc, enable_guc, bool, 0444);
-MODULE_PARM_DESC(enable_guc, "Enable GuC submission");
+bool force_execlist = false;
+module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
+MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
 bool enable_display = true;
 module_param_named(enable_display, enable_display, bool, 0444);
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 7169907c3365..2c1f9199f909 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -6,7 +6,7 @@
 #include <linux/types.h>
 
 /* Module modprobe variables */
-extern bool enable_guc;
+extern bool force_execlist;
 extern bool enable_display;
 extern u32 xe_force_vram_bar_size;
 extern int xe_guc_log_level;
-- 
2.41.0

