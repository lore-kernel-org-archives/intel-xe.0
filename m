Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903F9C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 21:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E4010E4C9;
	Tue, 14 Nov 2023 21:12:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAA210E4E8
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 21:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699996368; x=1731532368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=a3Em42erJeOlaJ/uVy9Z7WC2nlFxBklkcwvR6Msq180=;
 b=FNPKqSFuaRz+x4xQZAEmznj2B2mvWovDTsMCJMGx3fpRb7HbP3zzNOyg
 55/hOKQ3vBBqP7I0Xng2D96EjbaiPbjzPkY3rrwcdabiwei102zP6M3eg
 W6DpWESe1P5Tjcos46UqxcMcpFp+jM1/G1/HxWK6xbvqApmfJzh3DR5WM
 MCtA7qfZzLDJbvo5WByySbZoAlvZSQ/ijG+AnPEKZoQqxz0qqUBHzM8tF
 Dzizs9Dz0cCSbDz5vyVANOqJqe7xW6cQbLvSpXr4cs/NsjNI7NY+Fru+5
 UogF00rNuoWiXIewNqT7YbqFgAGhk3lHOoGdXnvZk7G73+cxNQ6yojUqf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="393605544"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="393605544"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 13:12:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="908546000"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="908546000"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 13:12:48 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 13:12:47 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 13:12:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 13:12:47 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 13:12:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXLK8z19A+kN6YPyToX32SdhQ714jDFg8NrgPIu5N61DpeSiRUFq8P6RrkJ5rm/7z45RQdrPGJCf95qz/7BLSbFQeFlm90fAJqpMHhpEDXjuVOdSN8v2r6zny4KuBfmAKhVZMGKcDMT7QuzSKOMP6SvOKtwHjAzfcpkxDKRqM1RtwstSsTKXWYYfjtjS4BE6Nms338E4Y+aVGD2It7ZodCc/J+KOuGSaIesuGV0VCFxHI0+5B4JDq8Eat8y+tqLNUQMAyFlSade8MMrA1Z6tOulRNrlcw2Nb1iRSeElMtiPGjBLQvaP27zCMHquQmNwta6HStxtTv14W5OvT3KMGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3THzktK+jKq/liAEAvwysxuhoSArWlJTqD1Bhqk+0o=;
 b=PWEC1JdMDRBZ082wIYNdvHfntKhUwsp1GBISZX6uh4K66zMSn9euX8S8Y0kGErg5YYPGf5ZBWd+n0Z6TUzrj4/hHl7wKDhm7ZlwM7TdUwakzJ+STLfakBm6Xufbt3sTl5GzQPju+KWQC5eeWV3nuJ0VaMxTWnNDg0wyyaPRDzzRwTPulotwuDeLpDpFU0GpZ4DugGn1lUTUUQp/AOgmao68JJCTZafr6FLRU0rmkjJAwSDmf5t94nbEJEFaq9UPviGzBADKRPY2sa51De3b8KYVox3U6CqzlXK+x2nGeCPmwuhf6lVERBkvIAGfq2cd7QdM4BoVnDXWRTM0j+h8ZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5903.namprd11.prod.outlook.com (2603:10b6:510:144::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 21:12:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 21:12:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 16:12:31 -0500
Message-ID: <20231114211233.498338-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114211233.498338-1-rodrigo.vivi@intel.com>
References: <20231114211233.498338-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a03:505::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e16ccae-a964-4bdc-5010-08dbe556716f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gdw3b8WxtjoIoBxa8Kp7WIaKu79sUGF7uVYohE03MvHq5KpIS9lxPQtLn1qVNBIohQG1ZZC410weAc6qMM/FWv3Ivgt/WL76zQwTkgdLAawM1TuiMKz+8/aTGlGWrbkdY4PwFoA9/bmg/B0nDZQtcSNH4OHGrqDRCoYEhcrNoJm3swjrZZhIfwH02m2XxwkVv3+rS0q2H4Op02y8Nf3QUfQmTG7auwA9V201UgrFvBBjHTYmSKIsydDZpVq2Kl4odXmDkRLIaz/LZ1/9SaMk3Lwyh8HrRcqiSKBPG6qdG/veLEW8mLsuU1hKl/NGa/tQGPx1ol0GrPFjbMe8Cn/wmY5zU7zoBtuHzMsqVwbeLTKkUt/0whHaM1ExoLJvlw4H+i/x7Njv0cUTKdcg48RfbK+dOkwHcbwP3iEQ7TV2mDpW5q9/93GGu8LL79r+5kCYkJDbU9HJdds0h7FyKLKHliv6PeLHh30WaJTLXem405Fg/zH8Rn13/+JnHQRK4TkNMmYovD8AbNOl4CVV+3jlOgw15KJMqhRtlAyeCdn7agRiJAQHH2G2rSamUYpmfcG+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(1076003)(83380400001)(107886003)(2616005)(26005)(82960400001)(6506007)(478600001)(6666004)(6486002)(6512007)(2906002)(38100700002)(4326008)(8936002)(8676002)(36756003)(41300700001)(86362001)(5660300002)(44832011)(316002)(66946007)(66556008)(66476007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RoJfm3nAfOJQvE//+uUF/rxXYNzmm63ULrV/N7rvAammljOJ3UB6Pgu/goHc?=
 =?us-ascii?Q?rXVwiBBRSwdtULqLgj6LuZEO7RGnNHshuPlb3y2aI9scfFe6sOEu612Mj13e?=
 =?us-ascii?Q?QwJIqP/kwzXYAanw0/iSwZK2xeckYnYUMEom0YfTWhgT4TjeC7ueWq1YGEPm?=
 =?us-ascii?Q?9AvSmGrbjj/9Ky6WILMVWcgs9dKv4rQbJZ7Hx7OZ3cFgDs9I5mj7wmbtMrPc?=
 =?us-ascii?Q?ONj2X2z2KuOhi144FTUsCn3GuU4itfZX13m6goPKYu/6PShrEwDrxQDLJpTh?=
 =?us-ascii?Q?K493EpC3NUc8cc/6e1Sy/tGP9qzy2YRf7ef1P1SSELaZJUBohnPFQOYlQEKV?=
 =?us-ascii?Q?/YARNitPuWCvqjwNYe5VRxY99wrnX3vEmgqxqDTBGva9vGSMZWW2dpdoaVoA?=
 =?us-ascii?Q?+VMMGOnLJE2Jx36ro28VTrisp+TuPmWMj1amlrIHjAeq37ebchak0BL945b9?=
 =?us-ascii?Q?AE1WwPYmRzNRcCwMAkHsjykguwPAtU5q0OlBPiurc9k1j95g2zqPORKBoede?=
 =?us-ascii?Q?daJ/6KzkFaOp+IbQMP3RvzfN4CUcrqevyFXWQOtD9br7M1OPvDZRVcSf5NW4?=
 =?us-ascii?Q?jX7J8LxhTa7w1fZ4BCTv9EyJ19UnC/NpN1oSwUjcb8+iibRNJezS++2uOYGV?=
 =?us-ascii?Q?q34R1lGYQgT7FCsa9zTDBL0O6EcBAQ9A6fxO/kjXVgJknIIGZlS/bdoBRWCZ?=
 =?us-ascii?Q?S/e9l1hsJwmhbV7KbLKsR1nQOLFkhReIUqT6E6Zd/wTZijubjiWd95ag27R3?=
 =?us-ascii?Q?4e4azd03oCZMtAoWGIKNhcSjDCRJjoSfFvZ0X2rgaO4QnUuYQp9H0+DgEATZ?=
 =?us-ascii?Q?LAGvc/8lhMgcwJV9GBhyAy4EnWz9p0Dg5+pAzRQbLyU4uX2NZO8GSRLOvyDM?=
 =?us-ascii?Q?IVUu1s5RyRU10e6uBtcv5WGNI8HC/uVnymQTi+Wf86VXrRlh0pg+NBsi5m4q?=
 =?us-ascii?Q?rUAUnXvXv8BFqRiU+53OKaA8UUQ/TDot+FBfyTyDk6C+VyQv0/0j2kNu/jkj?=
 =?us-ascii?Q?8N93VW0qjX9swjxwobQ0VmTLShbHoXzQLYABTlQLPADZ26is8oGp2TyIRuFq?=
 =?us-ascii?Q?vK93bSADMTpBlBoBUkDaM6VcSR5YvnyEizX47W7utQsfB9IE6XMwP3Rybjvw?=
 =?us-ascii?Q?uAMDEbr4nMhRE0aTIoJ6P+YgxZXigE23XIRktIoVjbNRwjQfx7Vj1LPWtrvk?=
 =?us-ascii?Q?Mf0TIkO4DYd9ayqSbwKjeImH5coiavw+0iQ89qSiQfFMh6w+infbCY7oSYqH?=
 =?us-ascii?Q?fub/GGwJXS9dPuFB3HfiB6IW8CnqsKnfTxtkLvmJXEh/vziwVMBXz8BqWlt1?=
 =?us-ascii?Q?FGZPIgyPdWmmgGATiwD2sE9uAy2g1xA6hKugjrUVzp0ZmowoYVeorynbEGa5?=
 =?us-ascii?Q?yMM0vdpU1ba+KdVM0bcegzYV4YKNjtHLx/4pGqPv7XEmp6FvK60/ybyBdh1b?=
 =?us-ascii?Q?lNZrkIU+hnaZ05T6HxIyK+EiRKRWeD1Yr2RfAL1rBME0uoDa58N/gdJQIUXp?=
 =?us-ascii?Q?1p9ialIwVC/7xAgeIW03yych2KvsHo32u5FoscoTVNhExqssXo8hlwN9kBqF?=
 =?us-ascii?Q?zbkaGF5ByzHP/xgsUGWJk/DCcadEDbAM0ti9Zwum?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e16ccae-a964-4bdc-5010-08dbe556716f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 21:12:43.8122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Fq4vlK9e/rpyZq+iJPVbslX/hn8sNbs98Awvs5SB28rDVYXrfEewp+QpetMh+nBH3NY3Encv6KvEdB9cAUz8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5903
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/3] Revert "drm/xe/display: Allow scanout of bos
 that can be migrated to lmem"
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

This reverts commit 0842f1ee44de01519cb8b7b55716dd87f3b70579.
---
 drivers/gpu/drm/i915/display/intel_fb.c | 5 ++---
 drivers/gpu/drm/xe/display/xe_fb_pin.c  | 7 +------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 1ce61245728a..be09df7d8cec 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2227,9 +2227,8 @@ intel_user_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(-ENOENT);
 
 	obj = gem_to_xe_bo(gem);
-	/* Require vram placement or dma-buf import */
-	if (IS_DGFX(i915) &&
-	    !xe_bo_can_migrate(gem_to_xe_bo(gem), XE_PL_VRAM0) &&
+	/* Require vram exclusive objects, but allow dma-buf imports */
+	if (IS_DGFX(i915) && obj->flags & XE_BO_CREATE_SYSTEM_BIT &&
 	    obj->ttm.type != ttm_bo_type_sg) {
 		drm_gem_object_put(gem);
 		return ERR_PTR(-EREMOTE);
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index ffd35a59f405..602d35fc62eb 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -249,8 +249,6 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 					const struct i915_gtt_view *view)
 {
-	struct drm_device *dev = fb->base.dev;
-	struct xe_device *xe = to_xe_device(dev);
 	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	struct xe_bo *bo = intel_fb_obj(&fb->base);
 	int ret;
@@ -283,10 +281,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 	if (ret)
 		goto err;
 
-	if (IS_DGFX(xe))
-		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
-	else
-		ret = xe_bo_validate(bo, NULL, true);
+	ret = xe_bo_validate(bo, NULL, true);
 	if (!ret)
 		ttm_bo_pin(&bo->ttm);
 	ttm_bo_unreserve(&bo->ttm);
-- 
2.41.0

