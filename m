Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AACC47074
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0BA10E259;
	Thu, 28 Dec 2023 02:13:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF8710E061
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729607; x=1735265607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rjceATmjvdeMEd/6nTWI5+VHoPmH3dPMxVN+WUy9F7c=;
 b=OWby8Dh5uQr6XXeHvE+vPRY4nkFDnrJdEECDw2cWg52EIg8s2rg5o3UB
 KhDIGPf4cmEzAg2Ep4dsvEqTueDG3xlrtcXhuafci3qvShyM/l2Y5JJXz
 Z9MjcpjyF7jwnn+2QACxUUd9hvC8xmgMWSBGwk4PyH1bd1JqxRvBdjALY
 MbVdV3PxnyOnaOZVWiuQnGY/1xjQ4Lqj/hLc2zf2hglzmQRmQgfBcquTz
 jnbYRg8RKUIWD9vE/Gs+JkflzfSrYFwbiRubZvWJtzSt0Z2aOEL/zuKlD
 T71y5f4nxAAvU1lpoET95mrTrDTDIGUg4xOX6ecakkdELrKLwvA1XnJhC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="10062201"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="10062201"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="869014352"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="869014352"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:27 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:26 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsxPFDXltywFY9j5p9hGEfjC/G+0iPLBnOVDeChTe722lfMbMPLAZdSepxBor8cf3cFBDgEY0O49oM5huQCTCMcTYUA7CAl3H4MkoZJBD7XfEAC4X9tk67PRQNTY/FC0x5pR4Xqvp5imj/3ChCxyeY/iKV2KJpzoqvpY0h6rQmjNQzyw/GpJ6ZONP/UF42QRtBhJizxAOOPOwWB1n/+j2wVlHPY0vt+wVpuhe8hEIKgVzqi02SGg4CVnct4lCMygQkIiSvgESRPPH293ahiB7J+rR6QJrjROiCexVgrVQ9zQe4x4O7xiWEG+wWQZF+OZEpFk4/nICzXYgk68FmrD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5yTZgEjjJ3ga8BbiZmhx7Ex6QWSVUvibtYFK7ManBg=;
 b=D+tNIioTfcaQ0UIZWGZznTVFRyPAq/eQT2MRKbjH5NMB0ItFPHOq5aK9I3DtjoPuI2nFiC6X8YzBp9LRwz7XmtqTCNUeEf6DTmewnfDPe3yu4A6bG5GpFugIJ18VbomgcD63urnVvBLTxCZ6iKXYzgP4Y0hUet/UhjaqLx/oztKNPgcGOuY/D4/pldziHEORpymE79Hf7dbM/c2zqPvNj2r5OXc00yY6qMHsZ6dla8NR/SqGkX15VDFW77UFKfzHLrBFJ+h1D/43xqNnIeu63TS4hht3ocgASWj3vqKdNziH3tvYXpEXsyEqe2sFNeNCHrDU+YPll9ImQykaiIb8Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 13/20] drm/xe: Runtime PM wake on every debugfs call
Date: Wed, 27 Dec 2023 21:12:25 -0500
Message-ID: <20231228021232.2366249-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7a46e8-61fc-4dff-6428-08dc074a902c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nVFwzpQ+3tj16r6N7HI4HgpGGeX32yPIg4okwom4pMDFUfUiC5822PZ4R+7M1/ETtxEwb1a3bw12o0uyhhhmbPCLqbGYFy9PkTF8P5Ic/B+4C+GGXLNSGE53taffDyvJNYdYEPS/Hmin0guJgBTbN32c4mxy1aCq+iGGotXPuy9GfYY/eDi9ZMxxWHMUXkf2G4omFuxTjTefI+S8qz0kAEyPyUUjJaaulYSUpWkIuarhPTjBv2yvjw+ozBhSxbHJvntW4kCYRxObt7i7F0GUweqJ63DA7uI2NjeWBozHQ9kK3mm9Z1cXI5PED+7Eu2KuZZTb/HVLBWSj9DbCAxAMpCXiyu4UopLCB37LVbuhLDZ/nbavXBHLoxoQt2IQ6UbVK4+EX1If5pY6rn0C2JYYxCo/YH9X+fxFb28fZaueRkV16dw5AeCRk/haSR8iIdCMyyTfG2lH+FzXPbn3UdHtrWiZF0TTRPBtWnYAT8pjUdZPmkcdWcG10p5EjU4Pr9nzmiy0qeqwSuxM55L3W1pcwYtkyitIY00OYDZI4163VaXnMfrbuhWfYrBRnueMRihI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3rL/rApntXUSklLYIYmhRy+HKV767drvbz+YWCoaZJco4bV6tZAVpXINQFn6?=
 =?us-ascii?Q?xsJPrDztBW05Lvvy2hqCO6tY3rDYhGvCpODReyfTC+Va3Iv0idBz189g334Z?=
 =?us-ascii?Q?oPD/kB0M15SEqbBo7JacEWa6yMaAZ2eGEwev3Yc71VTOVkYaClbeDKiTC//l?=
 =?us-ascii?Q?Svm6LHQne7yG+J0kZEGeFL88ozCdzE6qrY/EzrySFoiRHpdIQgftgqGWGmdq?=
 =?us-ascii?Q?k9lQbZekmEsBCm84KVMHRrLip11IMU7hoOywU9Ed4/s0ZES1jXf0z+8yBVHu?=
 =?us-ascii?Q?PeBIEw7t3rfk+EvdIXxTV3owX0+YXWl1PTKypQolCEC9iJpDfLDpzfTTROC8?=
 =?us-ascii?Q?bsOns/lynZhq+ZhEF4iWxkcdAbXAkzfNlUCrCTt/7gBL1aE07DnR96Nk0LQD?=
 =?us-ascii?Q?prd02X2koQ6OYb2SoIZRPw730VeuEIxEnE+qhxN5yLkHMy2II1rQz5UIZ6t7?=
 =?us-ascii?Q?ZAsPz9R2dMVzI68Lwm9fPa+U/+vNY1g8pH01kn4gwtRhpofNETAuM7oTOTFj?=
 =?us-ascii?Q?XSMQIxERykZ2HxskJZFHNpDtg99PwoeICC8Z97xPPCShek4c7TkraJ5gRhl1?=
 =?us-ascii?Q?kFK3ZimMWJhucckzKBL17rZV3LZ4Zfek8p5H+JTXnzvIphbolxDC/7n6VFWq?=
 =?us-ascii?Q?r8NNFKquOyQYR3S9k9PlBdVjpefDHeUju2oSoSYiUGW+5POMa11rrMZeBsJI?=
 =?us-ascii?Q?GpyRNOwmWhDYfE+8m4mioZh0dODT8VBh+w8uj76N/+0QUxOpne4abJna8gVE?=
 =?us-ascii?Q?R/n4GxAmTn/NscC0ikaZUUUlmHhpWcCgPEeRPPMujzyUoZXU0oPowEOdrUf+?=
 =?us-ascii?Q?2avrB5xrWVEKtT/u66tPn7HtRtpPT1EpxmN0LmlX2NsMXS3ZxRzmv8vNnKRf?=
 =?us-ascii?Q?k705rZ33VUUUew2um3MAvrsbHmrqwu1eycnYPPU89v8gxPSccTV/a+CyQlCs?=
 =?us-ascii?Q?GkiaRy2asFqGQMp2EOVC35pxL2WAcyb65Xtjsxyczz/7zNrQW3WFQQN6rxV0?=
 =?us-ascii?Q?VGVCjPiQMyXulIEsLmlMKfpIIbMjOPA0J3Yotra9ehXN5/nnzL/tMnXSU+Bb?=
 =?us-ascii?Q?nkoMieXCmm4oobEG+BjrQkcJNJEA5ZNqViDqo1RtbF8pJnGhsYqQYK7vM5CU?=
 =?us-ascii?Q?S3ZyuxaHM9n3TryfDB98qlUAsbK68Q7OeRN1+GO+ohQkKfxdwXyAaVDgz4xH?=
 =?us-ascii?Q?wOZJW/3BgR70vopEJebyghGMZ5kWanOz1APTPwlcEy9ArcUE3T2FJ8H6DVLY?=
 =?us-ascii?Q?L6yvVrnfCONrDgbZuJ+WSb7qYGCtYDI+mrXx1lgkQVKPnuJQMLnij3WB57n4?=
 =?us-ascii?Q?bBTvBlzxSc0ilylE1Ea+/FLkViVnoLmMDf4PPwtJsBFojV+UU0uFQ3Ucmnfv?=
 =?us-ascii?Q?drkJyhayOeds997UopPhpCgjGS2QpgvOBjNPelYDZaIWZGOOvgf4DcOMOuxM?=
 =?us-ascii?Q?kBXddL+YK+X6udo/p2GUxC0Z59PIkGcSpsl84XWNUSvcmLBWTkb69f36ePer?=
 =?us-ascii?Q?f4kfBZLHJ9Ry05AkWBGRktXz9TEQOKYkZkcDabpDZT2hadR+3hGZtGcMcBM6?=
 =?us-ascii?Q?inlgfzKBkX8DiUSVp/JoSeIQjyFWhWU0L8N9TXp0TrILJ2srHS27LYtCeUOG?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7a46e8-61fc-4dff-6428-08dc074a902c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:21.0368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PN3pzVNFBUQYgKedo2vOrOCXjVvUDEkodoodm8/GjPPFMtbyGgvaYkcGoxnCrSFLYQkd/laZMckxRhAyjN5/gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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

Let's ensure our PCI device is awaken on every debugfs call.
Let's increase the runtime_pm protection and start moving
that to the outer bounds.

Also remove the mem_access get_put helpers, now that they are not
needed anymore.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c     | 10 +++---
 drivers/gpu/drm/xe/xe_gt_debugfs.c  | 53 ++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_debugfs.c |  9 ++---
 drivers/gpu/drm/xe/xe_huc_debugfs.c |  3 ++
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  5 ++-
 5 files changed, 66 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index c56fd7d59f057..1ead9cc9300a6 100644
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
@@ -62,6 +65,7 @@ static int info(struct seq_file *m, void *data)
 			   gt->info.engine_mask);
 	}
 
+	xe_pm_runtime_put(xe);
 	return 0;
 }
 
@@ -75,8 +79,7 @@ static int forcewake_open(struct inode *inode, struct file *file)
 	struct xe_gt *gt;
 	u8 id;
 
-	xe_device_mem_access_get(xe);
-
+	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id)
 		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
@@ -91,8 +94,7 @@ static int forcewake_release(struct inode *inode, struct file *file)
 
 	for_each_gt(gt, xe, id)
 		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c4b67cf09f8f2..6b4dc29277277 100644
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
index ffd7d53bcc42b..d3822cbea273a 100644
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
index 18585a7eeb9d4..4d9f2bb0eee2e 100644
--- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
@@ -12,6 +12,7 @@
 #include "xe_gt.h"
 #include "xe_huc.h"
 #include "xe_macros.h"
+#include "xe_pm.h"
 
 static struct xe_gt *
 huc_to_gt(struct xe_huc *huc)
@@ -36,9 +37,11 @@ static int huc_info(struct seq_file *m, void *data)
 	struct xe_device *xe = huc_to_xe(huc);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(xe);
 	xe_device_mem_access_get(xe);
 	xe_huc_print_info(huc, &p);
 	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 3e1fa0c832cab..9844a8edbfe19 100644
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

