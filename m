Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44EFC4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5851010EA30;
	Thu, 15 Feb 2024 19:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jveei1K0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F48D10EA26
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025706; x=1739561706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iErffNxrtx1zXWeE/gfQ3fP8ivI/RiSknHStGYCWMV0=;
 b=jveei1K0iqZcVPL917m40l9LXAfJDnrFq3qpkvKsjkSeKJ836jDvSJrz
 EEwDHzrXpzyX9oBzRQiuUT0qLoc8KPzgkJbmARodJXolX1i4SjyDoYJQF
 HhhgTRBnPE353TjdHMrmF0VnMNNknpNA6pb4aVt0HUqMD2qjGAm3+5M8m
 xkLltXKV2yAAHm+1cw1Lt9eh/CHub3cA0jUgHOczKVeWfE6IXrcKLRAEr
 9aycBvEVjaNj3VI97RBg2Vu/g6wbTDmgOz72sJMfq7aHWWyUgbn1Jr3bc
 Z5L8+CQlTI/x0fAKgVdRZeH5NS2Pt9R75B2KJ9/zakVPpJoe+IzEKjE26 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12688077"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12688077"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:35:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8230619"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:35:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:35:04 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXnpLRNWpCeCjGqejIppXlVeH5BNn9ttMi32fM/SVne6RtoQRUR14FyQIT5NWgJenc8jalWbSwQoHgv0Zwx38jyGB1lo6HFprO1R+1/2hutrK9bJqLmPGNPgj3AyxWLz3HpmUw/gdy4lSIVC0lwlA5WFq6xsyA0Mz67YI9If/7J7BsCk0cIQouIlVDpCupJwWvpj5e60EiKHPOobZGPecXbaleXDF52/qdwN5PPb1kt61YndiWVGlOawsgpXTDQ+OYL/oL/p24R+c6RdcwmIodJ/VpnlS1gFx28OhddVz3735uxTQX+X1Vir0uJWbD5rnYYhRPhoXrOu68KFDFoAng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9WyINydHQ6BaBP75l1AEK9kaU2KShSYt091eep2gQw=;
 b=Olw3oF1DKZyM44zTm9K9EYY2RyQJ+XOdKhPWuqXq6soHcenASmwm6wweHHsK/yup5wmJ4zfcUTrCghZrDrRkI3Vjt3lw3toeSrXREYXHt8qWf4uo2Iwt3y8/CTXvPgNtVIVNkuFk2QZL8WDQH7hb30REhdOQapTPjNlpQ9cXGp+6yptJTtGvFDOziPRXHMTUlJO8Om41/f9syQ5mSnZJOHds0T80KnJ7EWzLPUbTfZ3zvlDXAROAPKeXhZxiETCiX1zcJBjBVwRuRr/fkt2SaAMypJ0EiMmZHxOOsPlNRM3LLabcBeGFD7rMkmtKEOeri7+mT7aSGriFNKe/xmbA9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 19:35:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:35:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 07/14] drm/xe: Runtime PM wake on every debugfs call
Date: Thu, 15 Feb 2024 14:34:23 -0500
Message-ID: <20240215193430.130106-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 373decf3-5097-46bb-e59d-08dc2e5d3415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 98N+PGVbdWhIUx6OgLJ/vZfKhgfCEDoqTquCinjBotxWdShr07GaScfo4APz4kbeQUc/0Tx9DvKpj2ZTNukAILXrDaT4kXODMzj6/07Q+u36eBOfYjmGq16jQo+/etRhSmCVhEyax7hZLQPDm7UgaDpWQpumkGjPDccnlIq0IcmB84RjRzBrdONRUE6dd0ozf6q7Hq1MzsNuAay+8Vd64//dp7vf0QXecxhbcvUewRtth0VH6VB9WIJS5Yvnkya4og3GHFucZO4Hqe0PVzL7yBcwnezMQ/Pp7kwqvJxvxZSchRX2gLGajLrLUBHCxu7TBbq/MizJTnqhflndaHAPubZ0CnEl17H6oIyfe9GykaMXoMOtKHYNDUuoZc7VeiZ81OA8Aq+Lk+tzRcnXvPLdPjpdkzT3Yjara6P958tUA4q2+EoFtPRD0xdkRPrtT9TFx0wfk0kxuM/u9gEg4Td0jL/dWDXPDcOjv4sVO7PVrQIl0wx88kAleBpyisNQ6R5Wpo7kVXHAOjWGyPVilOiSXCfRzUKOqYnrJF66J31F4pGElWWQEgW2v/7TDm1kWIRw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(44832011)(36756003)(8936002)(6916009)(66476007)(38100700002)(4326008)(66556008)(8676002)(66946007)(5660300002)(82960400001)(316002)(107886003)(41300700001)(83380400001)(1076003)(6506007)(86362001)(6486002)(6666004)(2616005)(26005)(54906003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uxKv1yYjlM08ie17eIEjbhOiJjlLOhaqksDBvgb3PpsZJKK+l2TrbMKe/k1S?=
 =?us-ascii?Q?oNCJRarWS0p830qN0ZGBeEn6o6Q++6VdvkMSK+i8v454ch+wP6eSCgXIbw5s?=
 =?us-ascii?Q?CVBbvXRmfOiPMuHs41XYtA6Id9Hl5lhAwCh+B8L5GZZMCN6b0dfogPW5Fulg?=
 =?us-ascii?Q?6qQb9nzeMeXlMfa6yQDiAq1dPQLcX6mrO/kxVI3Xb6Lgpwk0addwf1gUIqlm?=
 =?us-ascii?Q?a9j/oj/F7ATewjfeG2P7kbGW1L4Xzpx4oayk6PhL+2UKY05vTXNh2l4uTck2?=
 =?us-ascii?Q?q8/wIUSnOyrTUYm5hEv8Y/TAHFNuO2m4kjIQa1jV2LzwYhn6zMY4d0SXPTce?=
 =?us-ascii?Q?Z2otf4ytPQlYIOl3b3Q7pvEVfSktPBD5Bsos3sg+ID7eDpWfGjwr5q9/hfaM?=
 =?us-ascii?Q?gRcY5Ygfl3VE9QtptZSawIoulnz4CXPFHtBFd+ldGp3WJ8AxaO5fxHY+RvbQ?=
 =?us-ascii?Q?aGw97UGeS4UJW8Qwm3msmtWoX/weEmjSkXK/CjGpESOAA6k1d2IuftXcmT9S?=
 =?us-ascii?Q?lDQRqTl1veNY9B4Ou+t1qswHMGwEre6HIqP7poYqvUcmtmr0S2fQgM0XJLOU?=
 =?us-ascii?Q?v96a1aEF375hhFlZnmkDYahevpGxaQUzDLMWDL0tpaWRVpMaQ7Ddjp+sEd0K?=
 =?us-ascii?Q?kxN/qy2h+vtUrtCqZv8tQG+NrF5XrFpN7EfJnOhfLjc2miAZKrvipHn5NFzR?=
 =?us-ascii?Q?8VT8CArSUIBhE61LgV34+E06VFxHFwzIkL3GNgpbQCLA5E4IBkqhhZeYMcmz?=
 =?us-ascii?Q?Pmm/EJJE/c8rIcaBGElqHy9W2q6+eho4q6C1soxh7GXMB2wYvmnunoMAp4Zq?=
 =?us-ascii?Q?4bxWSNuJBKitE7opeVQzTxS+9voc0V7R3GLQXX0kECiOtdpoVhrj9DLOuEnL?=
 =?us-ascii?Q?KZjo8XjgZ9sTQNPc1RT5VacI7g6BRgphK6NznJl8kc7wnq8SOFlO1XGFiNs1?=
 =?us-ascii?Q?bUM0zNveHoACnAji1GjOkhGAIId1eaXlldtu3ACSEibGruSciyvTmNVzWBUM?=
 =?us-ascii?Q?FflLnlcpF4/yh8qX009StZT/hWHEfRB3D5tlGzBb1LQnGylOT5SM8VBLcbCw?=
 =?us-ascii?Q?KxTnkTVF22fr/W3ywHNS+12X0xj8vjwc5Z85iIwod9adfMiRSh/8Y3I1AkhT?=
 =?us-ascii?Q?22FZLEygNxU5X3cevNX7b99gsRQPaEXovEoRDYEVYsJq+F9NYQXFcISU5/TQ?=
 =?us-ascii?Q?D3e/RE1r62eRmk4tS7t/rX6+Jb2v2ZZeyvMk3eiUbURKdwodoMQ0OhRtZIU1?=
 =?us-ascii?Q?0z28IfZ3V/0rsdkYLLd4G0QtkCZFFvT/xgL650BbfRDiWHX1WsUeAm74Gmy4?=
 =?us-ascii?Q?/rOodAiSlWiTH7UbYV3OMOspPJ0Ypa6Q0aiBa9b+RSCZu1UlpOFGCIxiNJ7U?=
 =?us-ascii?Q?D9yI4C2xY7FjoawryRP5KNF9CJE1SeOQH5/EbTdfTjs8NOylBWZ3i4iTHaBu?=
 =?us-ascii?Q?2UTwHxVISxCxIymYxQW9X7AXbR1TmOcWviceMnWRU2qHqfYJEL+6ivCPm/lT?=
 =?us-ascii?Q?bydIwCvEQjk8VT1JCjbWQyRoty+W3eRDUQhhgwBHJ7EIm8Yt22kv0HmUu62i?=
 =?us-ascii?Q?sSo120mhLCoMh75TEEUtk658t/4MiLjng1XR6j5EW96a4CxBJzqnzWKVySnH?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 373decf3-5097-46bb-e59d-08dc2e5d3415
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:35:02.2850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWmlk2t3JfxVNAveoAfB5FKb0UMWUpUq3e06PGvpWV8yJVEGAE20G/yZU5155BTcGnIKS9/pI8nKM4pfm+MOhg==
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

Let's ensure our PCI device is awaken on every debugfs call.
Let's increase the runtime_pm protection and start moving
that to the outer bounds.

Also let's remove the mem_access_{get,put} from where they are
not needed anymore.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c     | 10 +++---
 drivers/gpu/drm/xe/xe_gt_debugfs.c  | 53 ++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_debugfs.c |  9 ++---
 drivers/gpu/drm/xe/xe_huc_debugfs.c |  5 +--
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  5 ++-
 5 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 01db5b27bec5..8abdf3c17e1d 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -12,6 +12,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt_debugfs.h"
+#include "xe_pm.h"
 #include "xe_step.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
@@ -37,6 +38,8 @@ static int info(struct seq_file *m, void *data)
 	struct xe_gt *gt;
 	u8 id;
 
+	xe_pm_runtime_get(xe);
+
 	drm_printf(&p, "graphics_verx100 %d\n", xe->info.graphics_verx100);
 	drm_printf(&p, "media_verx100 %d\n", xe->info.media_verx100);
 	drm_printf(&p, "stepping G:%s M:%s D:%s B:%s\n",
@@ -63,6 +66,7 @@ static int info(struct seq_file *m, void *data)
 			   gt->info.engine_mask);
 	}
 
+	xe_pm_runtime_put(xe);
 	return 0;
 }
 
@@ -76,8 +80,7 @@ static int forcewake_open(struct inode *inode, struct file *file)
 	struct xe_gt *gt;
 	u8 id;
 
-	xe_device_mem_access_get(xe);
-
+	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id)
 		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
@@ -92,8 +95,7 @@ static int forcewake_release(struct inode *inode, struct file *file)
 
 	for_each_gt(gt, xe, id)
 		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c4b67cf09f8f..6b4dc2927727 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -18,6 +18,7 @@
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_pat.h"
+#include "xe_pm.h"
 #include "xe_reg_sr.h"
 #include "xe_reg_whitelist.h"
 #include "xe_uc_debugfs.h"
@@ -37,10 +38,10 @@ static int hw_engines(struct seq_file *m, void *data)
 	enum xe_hw_engine_id id;
 	int err;
 
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err) {
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 		return err;
 	}
 
@@ -48,7 +49,7 @@ static int hw_engines(struct seq_file *m, void *data)
 		xe_hw_engine_print(hwe, &p);
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 	if (err)
 		return err;
 
@@ -59,18 +60,23 @@ static int force_reset(struct seq_file *m, void *data)
 {
 	struct xe_gt *gt = node_to_gt(m->private);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_gt_reset_async(gt);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
 static int sa_info(struct seq_file *m, void *data)
 {
-	struct xe_tile *tile = gt_to_tile(node_to_gt(m->private));
+	struct xe_gt *gt = node_to_gt(m->private);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, &p,
 				     tile->mem.kernel_bb_pool->gpu_addr);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
@@ -80,7 +86,9 @@ static int topology(struct seq_file *m, void *data)
 	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_gt_topology_dump(gt, &p);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
@@ -90,7 +98,9 @@ static int steering(struct seq_file *m, void *data)
 	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_gt_mcr_steering_dump(gt, &p);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
@@ -99,8 +109,13 @@ static int ggtt(struct seq_file *m, void *data)
 {
 	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
+	int ret;
+
+	xe_pm_runtime_get(gt_to_xe(gt));
+	ret = xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, &p);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
-	return xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, &p);
+	return ret;
 }
 
 static int register_save_restore(struct seq_file *m, void *data)
@@ -110,6 +125,8 @@ static int register_save_restore(struct seq_file *m, void *data)
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 
+	xe_pm_runtime_get(gt_to_xe(gt));
+
 	xe_reg_sr_dump(&gt->reg_sr, &p);
 	drm_printf(&p, "\n");
 
@@ -127,6 +144,8 @@ static int register_save_restore(struct seq_file *m, void *data)
 	for_each_hw_engine(hwe, gt, id)
 		xe_reg_whitelist_dump(&hwe->reg_whitelist, &p);
 
+	xe_pm_runtime_put(gt_to_xe(gt));
+
 	return 0;
 }
 
@@ -135,7 +154,9 @@ static int workarounds(struct seq_file *m, void *data)
 	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_wa_dump(gt, &p);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
@@ -145,48 +166,70 @@ static int pat(struct seq_file *m, void *data)
 	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_pat_dump(gt, &p);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
 static int rcs_default_lrc(struct seq_file *m, void *data)
 {
+	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_RENDER);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
 	return 0;
 }
 
 static int ccs_default_lrc(struct seq_file *m, void *data)
 {
+	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COMPUTE);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
 	return 0;
 }
 
 static int bcs_default_lrc(struct seq_file *m, void *data)
 {
+	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COPY);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
 	return 0;
 }
 
 static int vcs_default_lrc(struct seq_file *m, void *data)
 {
+	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_DECODE);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
 	return 0;
 }
 
 static int vecs_default_lrc(struct seq_file *m, void *data)
 {
+	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_ENHANCE);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index ffd7d53bcc42..d3822cbea273 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -14,6 +14,7 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_log.h"
 #include "xe_macros.h"
+#include "xe_pm.h"
 
 static struct xe_guc *node_to_guc(struct drm_info_node *node)
 {
@@ -26,9 +27,9 @@ static int guc_info(struct seq_file *m, void *data)
 	struct xe_device *xe = guc_to_xe(guc);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get(xe);
 	xe_guc_print_info(guc, &p);
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 	return 0;
 }
@@ -39,9 +40,9 @@ static int guc_log(struct seq_file *m, void *data)
 	struct xe_device *xe = guc_to_xe(guc);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get(xe);
 	xe_guc_log_print(&guc->log, &p);
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
index 18585a7eeb9d..3a888a40188b 100644
--- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
@@ -12,6 +12,7 @@
 #include "xe_gt.h"
 #include "xe_huc.h"
 #include "xe_macros.h"
+#include "xe_pm.h"
 
 static struct xe_gt *
 huc_to_gt(struct xe_huc *huc)
@@ -36,9 +37,9 @@ static int huc_info(struct seq_file *m, void *data)
 	struct xe_device *xe = huc_to_xe(huc);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get(xe);
 	xe_huc_print_info(huc, &p);
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 3e1fa0c832ca..9844a8edbfe1 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -73,7 +73,10 @@ static void xe_ttm_sys_mgr_del(struct ttm_resource_manager *man,
 static void xe_ttm_sys_mgr_debug(struct ttm_resource_manager *man,
 				 struct drm_printer *printer)
 {
-
+	/*
+	 * This function is called by debugfs entry and would require
+	 * pm_runtime_{get,put} wrappers around any operation.
+	 */
 }
 
 static const struct ttm_resource_manager_func xe_ttm_sys_mgr_func = {
-- 
2.43.0

