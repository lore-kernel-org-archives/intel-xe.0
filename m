Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548CFC54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 14:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A8411225C;
	Fri, 15 Mar 2024 14:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NrUkAv31";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5498A11225C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 14:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710511305; x=1742047305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=h5jCBA73hePoEC1U1TYsM6dzwI3/5DfBxixdoFV+VjE=;
 b=NrUkAv31BX9u1aE5UbQpYK+QpZfrbC1MCd4Lp1Qm+30IultuV5ollpdo
 +PxLoJlNQbGdBeQh2iSYcncXs1p6SUSUW+vm3tump07/Qdrq43pR2MX+o
 rlPm6TYAazt/rpENI5zPDP8oWfUHBzYUktV+2uJW5/9sFNnjLh+W4Zxwp
 hoBql+ngGx9t72oWVJfUq5LqwynUr9ZVghw/aolhKfpPcI7WKXf6y9B0y
 qyutMlQv2Z+1DxORC1EC5v0Mec7VMo9Wn1onsRhItc7ErH2FqXi5rLNg3
 LcMj3dJIGNba/Ag//9ZbdeNVssgWyGGM0pzt7hIeZCCM/a6i35LWXy43L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9213705"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="9213705"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 07:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12765185"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 07:01:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 07:01:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 07:01:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 07:01:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azPmWBV7NJcgzQ8t+ONHTnglHaw5WO9gNgUxNFHe5vUal2ib2dbtIskoT0ww/ouD6xMN5jYKZafjCSvAKeapr29a5M04azWOG551D0ptLfZFpR1ydPxz0WYHNr+68MPRn5EKIta9ApQNeeAHZFSzIrfZfiQHMB9oHj3OTOeXALh0PPADj6i+Btgespe2EzeRgVkxQ57mGn1DllyQp3xM1qP7+c26QLufJaFN5zeeLzI+Dp02FzFIH6m/ea4Zi8FQruwP3xR2+UEJq3pSLdDYAG0FPU7ExiMJJxfCfdJ421iL8PSqzZPbNqJpSjfxBdC94zC4yOfD8OncwxTfGoNc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inf0vnS2WPVyW15Ysgdr11oYbNBWcNx02aIxEXsC69s=;
 b=i5zZMQGoJ/v17LBv/nrCtoFMgyxs3qHOBrxP+067VC9nxo0omLKzYjRhU3ESRgECAQgWza9aiXb2qjifs/FlcejneiGE3Gf6LpWxpS2QquA8LzBWrV9K83IkUTdJIgtiJiUHs1WKQJGATq0GBx084ZOJV1EyKh8Vu7VntW6CRuWHQ2I/tQMcg9fFDx5hbV+pApl1Gu19YQyq3NxkfmDZEon3ncO4cn+nnxLxLtQzkwigT12fsl4JYB17UoOp/K6zEWjvDDLukP4/LSkF9ote1eOzlnGUXqQOlAYGRMkhep8cOHGeODUCtxbBCnSH5FCMHE/l0Z4rHqLTphWlGn7AtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7523.namprd11.prod.outlook.com (2603:10b6:510:280::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Fri, 15 Mar
 2024 14:01:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 14:01:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH 6/6] drm/xe: Introduce the busted_mode debugfs
Date: Fri, 15 Mar 2024 10:01:08 -0400
Message-ID: <20240315140108.217862-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315140108.217862-1-rodrigo.vivi@intel.com>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:334::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b38baa-ed4d-40c6-2c92-08dc44f87009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: egptiVlMDyv0SAuIyg2DvMBCUg1Gu8wtXlUrXOatb4B9q+kixaAZFO3vc5FDCRrNqU4XZKjT3jYcaE7GYdqv7fP7f1n+m2w0NPTa/CiUG4TdhtqAkGt1N1HZqiG4NLVwVByHSCBHG3WLakb7ZrzsdYx92xaNRLJ+ji++MIRdKZmf871GpvMbcm2JChyvxUAOQO3dvaPtqfnpXSVaLt5xRk44jdDzbPKT9BlndY1JwXSlnq+AKWEl1mZwqJw67WegSIZ7iuuZG01KEiKPmgnkLXsp3OF1/iub4pTn1iMCBdxORGIAUZBC4Xq+AniPoTMwwi7jZGqwJ9LuROy/FpzXMTbBaUQexcGZjBCiQLlu0xZuDSwYYA0gJ535kaMi4LxyzC3DOMFDzw9y3zn4PJwKf26z3UgJ4ebvQCLnr4f29s4m7eSR41pwYgDqiKEeqQcG9xcqhLlxEf6XOH69okeMT/6VUeIFIIZgYscpyrr6JcJ+jzVgHlux93i+xjkS5cWinWBJ5CBBej4HNKoeB8SiDP/UAB6/84rJIkBWfUAI41UV8K2RYC9+mtgKKfqO1WJ2UgTz4Sb4wLcXEozfhqrlLUdrQiX3Td/N39Ut+2+sFD9BjFWjmXt0DuT5juZ2cO3kDZXsyogdk4sxD3Ux3220o+IXviqB9gXkLHrGiVbYmKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wPuiZSaYvEEotZizRLSIbfCQMyQCwciukPp4VxrS3soeXiO9gy9QwSoGWDrt?=
 =?us-ascii?Q?rjBGyJ2r+m65F+EhMQDuBDxDjbZwUVMXi/QMUMiwx4tFThqZfN6nsz3EdHpF?=
 =?us-ascii?Q?tLbmHMCDdMoEpxwY+5FE9+CixoBe5U5VvQQCeFgTJJV26hO7HJkfz2+ZIZFo?=
 =?us-ascii?Q?xvEOeDJDSLE402/qR8KCoZjF0TCs7o41pkdelTx8CvxU9F0nJKDB1+7KQfSd?=
 =?us-ascii?Q?BbQ2U3wduaCXcnEWcZ3lhNd98Z/OZjK418uNjEEEGGDTAUbCgKLIwQI2ZsYk?=
 =?us-ascii?Q?xMiTa9tc/+pT0alG3fMnGxsZ6BNCPw306RjxaL6djYOd1p8zfmCYZp3JDl75?=
 =?us-ascii?Q?h+9fOBS5hGfEAYqOYVXYxunBRww1rXiPhkNBNBeEv5nV+RiquEANzvQa/AkK?=
 =?us-ascii?Q?u3AVmm3tH07R1LDqMXrNi1f0UewixHjRrM4DDHdfRO3pasW9jMhq7QjhRp8a?=
 =?us-ascii?Q?2/jI4RxYZox1AdMZG3zuueG4E4m+PgtKCRZYTs53GgvUxFdIOh7BweB479yC?=
 =?us-ascii?Q?NM2lffBH+zdq004LrltK7E+TpQ24b3pOd/Up1E9Y76t33rQ9ODzDIsG7U/5b?=
 =?us-ascii?Q?VMAvWTLcm7gI350wKWaVnvqH3VfqNDioQHwzSELFHkYDwR2x5lRO7sydRgxu?=
 =?us-ascii?Q?poffMYLnVaEnxOl7NL0P89T4RRGaYIfVfEkfs47O6fmjMkqY6w2xp7jNSEcO?=
 =?us-ascii?Q?KAvCiiK2kDWAnhrw47hbAARzpac5CBzZS9w5lnQXq2TeAxOezuHEsmHVCk6a?=
 =?us-ascii?Q?HeA5ypHKOSz5VghVSa12X7x4dwMUUSb50SRscW2uqtwDJ2gm/UHnd8Moq6fe?=
 =?us-ascii?Q?qvGR+dR5lcUeCYg6KaF6RzYJw/WOg+8uRrh88/zw0r7TUWabNyjo0BARzoUw?=
 =?us-ascii?Q?zxcAdA1kq1JdUIEIJsIVqFW/0yS+7sC21Ovh/0MGA8ftE4wGWDGlIxGefGT+?=
 =?us-ascii?Q?5fHyJCslIqNS9o3PaAKyMdU7YN3iIaI7u7ACwJyuQGJEmYF/QeISQF3MrRAD?=
 =?us-ascii?Q?iD+wyuB8SbfuQMmt1+BGeZ3NaDqQJGtX9S9YPxvh7F2l7kvuJehT7wGoCRtj?=
 =?us-ascii?Q?8kPxgT1FX38G7/1V0syly7PkFkZzOWT8tPmbvW+UtC8WAGLRnXZttZ6lL3ed?=
 =?us-ascii?Q?GNxnsiWkaZq+wCqeTfSsRzXfXs5iainXIfU64rIaQy7FmjH1FZl7Ya3/47Js?=
 =?us-ascii?Q?L74OL24DKtMeXYOwPvB38gQQMuhw63K9JQ9wsV8It6MJUUULnkO5l2vQRPT9?=
 =?us-ascii?Q?hZfG0972LhRB8X1XMy+/Nbqr9+JJuIy60tWGmtcBakxakHFDeEHS7mT8rN1v?=
 =?us-ascii?Q?mR9xSjDG+kdJqsSB+KYPdt253bQ4oQtwZB4ATdrfIL0S33zJ53/th1XG8r7j?=
 =?us-ascii?Q?MSxWAJV1VdBcnDpdbrJNsFxZay0f1amQL1RTpDQwtHMS8Rt1hDjCq5WGdAhH?=
 =?us-ascii?Q?07TPF+FywolvH3lEL9FhZYXW1fJNuhO/MoKgCOrPNxoIaRynfa55Tca6Pd3i?=
 =?us-ascii?Q?+LRBEMKqFrEM2eHKazcSAB4dCUqv/JXDiHNgWWXmqIbiyd4wroq97ay2T/eh?=
 =?us-ascii?Q?aRzDNfOIQNC4OO6LCmkqw/MfRef5AMLFedMNZFMOhbL6Pg9XZDEP+U+iG6ua?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b38baa-ed4d-40c6-2c92-08dc44f87009
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 14:01:40.5865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoCw8zD+fp7XrWTSD2putX1YhjQzkM1TGuSp2so+WsM1oxxExSevuEqTSH02UlfwUY5rBRfDKSXJRRoZEjBq9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7523
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

So, the busted mode can be selected at runtime with the device
granularity, rather then a module policy.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 12 +++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c | 46 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ads.h |  1 +
 3 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 175ba306c3eb..0cd20862d32e 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -12,6 +12,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt_debugfs.h"
+#include "xe_guc_ads.h"
 #include "xe_pm.h"
 #include "xe_step.h"
 
@@ -124,8 +125,10 @@ static ssize_t busted_mode_set(struct file *f, const char __user *ubuf,
 			       size_t size, loff_t *pos)
 {
 	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_gt *gt;
 	u32 busted_mode;
 	ssize_t ret;
+	u8 id;
 
 	ret = kstrtouint_from_user(ubuf, size, 0, &busted_mode);
 	if (ret)
@@ -136,6 +139,15 @@ static ssize_t busted_mode_set(struct file *f, const char __user *ubuf,
 
 	mutex_lock(&xe->busted.lock);
 	xe->busted.mode = busted_mode;
+	if (busted_mode == 2) {
+		for_each_gt(gt, xe, id) {
+			ret = xe_guc_ads_scheduler_policy_disable_reset(&gt->uc.guc.ads);
+			if (ret) {
+				drm_err(&xe->drm, "Failed to update GuC ADS scheduler policy. GPU might still reset even on the busted_mode=2\n");
+				break;
+			}
+		}
+	}
 	mutex_unlock(&xe->busted.lock);
 
 	return size;
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 43f0a88bbe8a..5dccdbe595bf 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "abi/guc_actions_abi.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
@@ -14,6 +15,7 @@
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
 #include "xe_guc.h"
+#include "xe_guc_ct.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
@@ -679,3 +681,47 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
 {
 	guc_populate_golden_lrc(ads);
 }
+
+static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
+{
+	struct  xe_guc_ct *ct = &ads_to_guc(ads)->ct;
+	u32 action[] = {
+		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
+		policy_offset
+	};
+
+	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
+}
+
+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads)
+{
+	struct xe_device *xe = ads_to_xe(ads);
+	struct xe_gt *gt = ads_to_gt(ads);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct guc_policies *policies;
+	struct xe_bo *bo;
+	int ret = 0;
+
+	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
+	if (!policies)
+		return -ENOMEM;
+
+	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
+	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
+	policies->is_valid = 1;
+	if (xe->busted.mode == 2)
+		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
+	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
+					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
+					    XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(bo)) {
+		ret = PTR_ERR(bo);
+		goto out;
+	}
+
+	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
+out:
+	kfree(policies);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
index 138ef6267671..7c45c40fab34 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads.h
@@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
 void xe_guc_ads_populate(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads);
 
 #endif
-- 
2.44.0

