Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68589C5478C
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 18:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33048112448;
	Mon,  4 Mar 2024 18:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATTyrTx8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF9811244D
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 18:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709576553; x=1741112553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=N4G/IC6sbPUhtiBLfsC3vyZAmreKBHNP+I3UML3GY+4=;
 b=ATTyrTx8kddgBDAgpRkqxb1RhkJuAr9uH+wDmWtPbiUYq8SNevnUXc9d
 gXfkycnbhc45jR43Sl5D5zAN2kbyBPTZrag33FMUV6QiSL1aQwVz5XotY
 CwdZ/0xVIJ4ZFiS7M7eO6RrGFnmR4g0UOoFZGfcrTEqEz0PKMGAKeP13I
 qFZs9c46en+0q1MkCmT5wXxZp8mQrjVh9xTmxKMDHxlf/uJS/roDji+Ek
 coaeiZwS3in4R1C948WInfcA8Sef2WqMdGa9dJ2NYm+VEnGxgYn4PfEpH
 jWMW8+Pxt8n6ZUixemPNTs6BEGh8ETnb9yvG23fwyGHs6Mn3OdT3ngm6g w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21623982"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="21623982"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 10:22:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="8936135"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 10:22:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:28 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 10:22:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fa9z+d5BMU1u6Hv2MuNQ5tJe0P5ZeKcvaJF8OaG5PABVYxU+gSc/ZOkNszDIZnYcVWN4FbVefAxVICEJFFH4mZgc4eLWsYvldmUAqdNa9OgkkLsIqEhMsbFNjs1Ano1ThuQ99OY+S3m6HwFh7y+LK0YzVE9DhgwpEhJ6hjd528M3doqS4hVF8F554qQqUnD/py50CDY/PmeqXz5VG4TsfevEhEbhbiuWDyumla6tAasYXvZt9lGCEzvvoijBKFmF6oXPv+zQn//+RZv2wyTb+H2JZpwKh3iFZ8VzNxYjoqL0pDv9+HGmUIlqSLVuMyNsH5WKL62CvlS6eIyI1JqvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ83eErW5CNOHOK7gVutf5/SI0ztcPN56Md9Gk46KFs=;
 b=Ys+nepUeT9bXb8mu0TyOlmgqffAMEROwpG73h5V9NvQysQecPwloMW5E9eXX9YQtlP9fs7g24CtS9vETLClPRsjh3UyzZvB0qgY8CaBy93YllHfruXC17UMseMKzEvT7hlazaMAmIMzLkWceo/X80BiG3Zc9Wyd5YpS1oeMZsHaZ4ewTokJqFfVNocl6PFTjKDq2W/HPuGxkWGSa/1mzbJLcQW4uvP8lA7LztYCWFN5/INi7K8YMqXNcDLyxqL+VICSZ6DWNgHQeIUQfVSlitidepS5D0/+71ake32dJgPBc8mNiel1n5CnjHErohYDK5OgCNZCy5PrL0wb6k0DX0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6462.namprd11.prod.outlook.com (2603:10b6:930:32::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 18:22:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 18:22:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 9/9] drm/xe: Kill xe_device_mem_access_{get*,put}
Date: Mon, 4 Mar 2024 13:21:54 -0500
Message-ID: <20240304182154.42611-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240304182154.42611-1-rodrigo.vivi@intel.com>
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:217::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 9858d38d-3a93-45f6-a380-08dc3c780aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eCyCpxEc0GAbIMRGrEkr2siG+V8GzNL1VNWhSI1VBFmNBF2iqQr8z3a/kZlbW5Mc0GN5Oq/SvnLVqAT2blAd68fO8Qnk1HKp3L1uebAp9I64Sh/fdp/m7ow6GGvUVOFBmbL+cWuZE3lKO9n2lpL/KeL00atg2gE4U2zQmOkBosZl+gU3TD79eVet6T4ELHCr1oP6rAPuKqllBRWVC5fgB5qDLjssIYPk/mVGs48CV9Qe9GEnmyCCpGCxOGG6nktsjeCI/37udv4KxXqRk0HmOYqyNqvfshDCV59GLy6MkeX/rMSsHhR7X83hFFS/iI/XV3IeC9A43uehcu+Ke5qSfCFl0akBb0X1W5lsulsZ4XQ7JTgg5Fv8e0YAsWbuIYPIBkSJHsv/UQ0yKDELwPlirLjG8hWRA0vBCv8jRBMEk8LOb0dmUn9bKx/jTISOGCrMU6RML4kWm2LftwGVwnEPGmpdIbGwBaFzWyi6fCUiG5/nk7BWsLWRN8uiMn/vIXEuAoEVw3oU4CsQCH+eNidiSGhD6pX0sUJ/kNXACzJhwgyzNM5FKd93qopFuFaOPV+vYA4SrveTtefgV1yMxQYeuS3PYwA9jEAffb1jwzFcMnDz9jihP4cJPFI8lGr9lkTCjiDee7kNt5LUSq+mh1LaBT3kZJwVdoR6Z5Qbv0qAiS4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YQYGUWzbCkg0s4ZhKfVLTVrVGA752UhlpI9zKVcFW7F8h9e0JXiM26qrx/Jl?=
 =?us-ascii?Q?ogOAc/zGyw7pafbng8UqKdc4I/U/9JnHao2SZJZWx2Zw+PrARHkzJ2k1Q1JP?=
 =?us-ascii?Q?ydcFT2OlR9KLrQYuuMttj+WjsYXshebdtbX/0XxA8JtZl+LhaF6mDwNtVfcZ?=
 =?us-ascii?Q?0v0CNJBoG5DKn1n/pPvNJ3hIiGu42m5Vt5JG7IYqwNWd38HQ33FQ7HF67Nak?=
 =?us-ascii?Q?GLuTRYJvsWj2N8YVFnU9VpLv0cFjG0QhJHPcq26s4c8lmgDc0lRy0u2OjMuv?=
 =?us-ascii?Q?zQwcG42AgAfj6Oh2aEkr1kbPzAvywPhu1gMNeBlCFKh8iS8yQCC9RnOHWg3I?=
 =?us-ascii?Q?koFrimNDdTqcqfJuyE/vJELa/giz8SJtfKQVCzrUIVEdU7nYbbn0x+rQrbhb?=
 =?us-ascii?Q?PlgMn2F+VDmN2cza/nROTjPXEry6iNoUa2sJGzoTosoompjs+/66hHAjZ5Db?=
 =?us-ascii?Q?tlihrX8SHzIhHJDFv9p8yNwpNdwFj+tOZhtzNBXmw7lvPVA9jGSQ6e+1D++4?=
 =?us-ascii?Q?/FDQNWrborgOtHtYigJBcCXN9IhTeJd6Efzu06LXAvlS+3fqk1oLzRVTgdMq?=
 =?us-ascii?Q?gKCL+371sVlcNpdRncl/fb0ZAOLLT1aNGnn/ELwVipuNZkcMrqhc/BvuS5DV?=
 =?us-ascii?Q?myQlvuFJVWkhYUzhIsdh52vmoDQBZ6c2aJOgjrTkYKNQ6lBAO3MJaAcV3Fc+?=
 =?us-ascii?Q?X6SkJfO862F/rUlSbU5DNluWQ4vroocSC7RswPL6bSd2I9JR9ZeCzfi+xP2u?=
 =?us-ascii?Q?TCg8UwhnU02fYoVBPfJYINPjh8X6jtFEsd6qPfCyXUCARWFYq+ONM4z6mefT?=
 =?us-ascii?Q?VH/68w7Bk5UgUaxL6/dmI8e4R6a/v2um64hOgnmk0ply2SkroCTpejHnmpj6?=
 =?us-ascii?Q?U0lsUIHfngllNrCyYHb+lKLOO4cJvYJZ3RFGM7Khy6pdGbYuM2T8V/hAqkpy?=
 =?us-ascii?Q?ZMtFJeMkhwaw6GFlt8IUBFA3KkQetqB/JyBZ6k/GWE/sXZJRAEnxX9EPra9J?=
 =?us-ascii?Q?Gr8x1mz39OjrbMT6WGa2L4vwSuMzzLunjocn8OOxPaIgzsFaaj0x2B3w0Wor?=
 =?us-ascii?Q?L7is7Z80xYP/6M4qDAGyHay15hhf0B77CHRvlLVFrhP8fGjOdJHl6+As0USt?=
 =?us-ascii?Q?uYfWHYXya3otE6wxsRmdkRmKrKiOBaIqVZLkEgeIPY78UbkO99pz2W61ZbMW?=
 =?us-ascii?Q?C2NlZN7rgBGja5IcwY2NeBkAhtXn4yqLEfR4ZCgvHydIhwOF9AM+syordgX+?=
 =?us-ascii?Q?f/LMLbDoxwIsTxJ6qxFzAiNq8OufVUb9RApJVVKZUKsXFzuFytUF4+D9kGu2?=
 =?us-ascii?Q?akLSmCD7zjFchoe4ItUhV39OzdNpGgZpUXavczVJJMfCr6/l/eJOtpSqeGZP?=
 =?us-ascii?Q?PHHEWKH7+612I1qFVW/aDu51mrYdk+n8jBEfvB+EHI2CR9oMbELRvqHb+ymT?=
 =?us-ascii?Q?638GgKdxn9I6X6feGT9MCcQn/cOMY1KMbatZXpiTurl+xun62se7XvQxsQO9?=
 =?us-ascii?Q?tBaqPQBBmKEsDgpKlELb5uP67TVOT6hMvwqJTQFfk716vBcH49//kVrMxNJx?=
 =?us-ascii?Q?xLjM8DrxqDdvabJmVJCCqNMKlZ+6DF18+3n7xMh6aBZh+6saPhiOlHRQz81F?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9858d38d-3a93-45f6-a380-08dc3c780aa6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 18:22:25.5061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSYNJ6IKDFvceGSP8rsNo+63E2kc61RcIjXpsmpaOKKGXcz7zDHQWfQeZlqr6ELi/4sAmuPhESv19dWXp6nq2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6462
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

Let's simply convert all the current callers towards direct
xe_pm_runtime access and remove this extra layer of indirection.

v2: Convert all the current callers instead of a big refactor
at once.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c |  7 ++---
 drivers/gpu/drm/xe/xe_bo.c             |  8 +++---
 drivers/gpu/drm/xe/xe_device.c         | 36 --------------------------
 drivers/gpu/drm/xe/xe_device.h         |  3 ---
 drivers/gpu/drm/xe/xe_device_types.h   |  3 ---
 drivers/gpu/drm/xe/xe_exec_queue.c     |  6 ++---
 drivers/gpu/drm/xe/xe_ggtt.c           |  9 ++++---
 drivers/gpu/drm/xe/xe_sched_job.c      |  5 ++--
 drivers/gpu/drm/xe/xe_vm.c             |  6 ++---
 9 files changed, 22 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 722c84a56607..403ed2d42f6b 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -10,6 +10,7 @@
 #include "intel_fb_pin.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_pm.h"
 
 #include <drm/ttm/ttm_bo.h>
 
@@ -190,7 +191,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 	/* TODO: Consider sharing framebuffer mapping?
 	 * embed i915_vma inside intel_framebuffer
 	 */
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	ret = mutex_lock_interruptible(&ggtt->lock);
 	if (ret)
 		goto out;
@@ -242,7 +243,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 out_unlock:
 	mutex_unlock(&ggtt->lock);
 out:
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 	return ret;
 }
 
@@ -381,4 +382,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
-}
\ No newline at end of file
+}
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index def68528cd40..cdcc46933811 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -738,7 +738,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 	xe_assert(xe, migrate);
 	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type, move_lacks_source);
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get_noresume(xe);
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
 		/*
@@ -762,7 +762,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
 					ret = -EINVAL;
-					xe_device_mem_access_put(xe);
+					xe_pm_runtime_put(xe);
 					goto out;
 				}
 
@@ -780,7 +780,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						new_mem, handle_system_ccs);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
-			xe_device_mem_access_put(xe);
+			xe_pm_runtime_put(xe);
 			goto out;
 		}
 		if (!move_lacks_source) {
@@ -805,7 +805,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		dma_fence_put(fence);
 	}
 
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 out:
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 58815e9bf242..e2e6b6dc8534 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -655,42 +655,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
 	XE_WARN_ON(xe_pm_runtime_suspended(xe));
 }
 
-void xe_device_mem_access_get(struct xe_device *xe)
-{
-	int ref;
-
-	/*
-	 * This looks racy, but should be fine since the pm_callback_task only
-	 * transitions from NULL -> current (and back to NULL again), during the
-	 * runtime_resume() or runtime_suspend() callbacks, for which there can
-	 * only be a single one running for our device. We only need to prevent
-	 * recursively calling the runtime_get or runtime_put from those
-	 * callbacks, as well as preventing triggering any access_ongoing
-	 * asserts.
-	 */
-	if (xe_pm_read_callback_task(xe) == current)
-		return;
-
-	xe_pm_runtime_get_noresume(xe);
-	ref = atomic_inc_return(&xe->mem_access.ref);
-
-	xe_assert(xe, ref != S32_MAX);
-
-}
-
-void xe_device_mem_access_put(struct xe_device *xe)
-{
-	int ref;
-
-	if (xe_pm_read_callback_task(xe) == current)
-		return;
-
-	ref = atomic_dec_return(&xe->mem_access.ref);
-	xe_pm_runtime_put(xe);
-
-	xe_assert(xe, ref >= 0);
-}
-
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
 {
 	struct xe_gt *gt;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index b45592b0bf19..355bddfc8274 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -133,9 +133,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 	return &gt->mmio.fw;
 }
 
-void xe_device_mem_access_get(struct xe_device *xe);
-void xe_device_mem_access_put(struct xe_device *xe);
-
 void xe_device_assert_mem_access(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9785eef2e5a4..4bec8b90a37c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -377,9 +377,6 @@ struct xe_device {
 	 * triggering additional actions when they occur.
 	 */
 	struct {
-		/** @mem_access.ref: ref count of memory accesses */
-		atomic_t ref;
-
 		/**
 		 * @mem_access.vram_userfault: Encapsulate vram_userfault
 		 * related stuff
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index cb83bfb2cb6d..499be61ce33d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -217,7 +217,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_device_mem_access_put(gt_to_xe(q->gt));
+		xe_pm_runtime_put(gt_to_xe(q->gt));
 	__xe_exec_queue_free(q);
 }
 
@@ -597,7 +597,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 				return -EINVAL;
 
 			/* The migration vm doesn't hold rpm ref */
-			xe_device_mem_access_get(xe);
+			xe_pm_runtime_get_noresume(xe);
 
 			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
 
@@ -606,7 +606,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 						   args->width, hwe, flags,
 						   args->extensions);
 
-			xe_device_mem_access_put(xe); /* now held by engine */
+			xe_pm_runtime_put(xe); /* now held by engine */
 
 			xe_vm_put(migrate_vm);
 			if (IS_ERR(new)) {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 355e4bb987cb..3e761646993e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -20,6 +20,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_wopcm.h"
 
@@ -416,14 +417,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 
 	return err;
 }
@@ -441,7 +442,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 {
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 
 	xe_ggtt_clear(ggtt, node->start, node->size);
@@ -451,7 +452,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	xe_ggtt_invalidate(ggtt);
 
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 }
 
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 8151ddafb940..8ba35b1698ed 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -15,6 +15,7 @@
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
+#include "xe_pm.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 
@@ -157,7 +158,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 
 	/* All other jobs require a VM to be open which has a ref */
 	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_device_mem_access_get(job_to_xe(job));
+		xe_pm_runtime_get_noresume(job_to_xe(job));
 	xe_device_assert_mem_access(job_to_xe(job));
 
 	trace_xe_sched_job_create(job);
@@ -190,7 +191,7 @@ void xe_sched_job_destroy(struct kref *ref)
 		container_of(ref, struct xe_sched_job, refcount);
 
 	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_device_mem_access_put(job_to_xe(job));
+		xe_pm_runtime_put(job_to_xe(job));
 	xe_exec_queue_put(job->q);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 643b3701a738..84360f4a1b60 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1324,7 +1324,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	vm->pt_ops = &xelp_pt_ops;
 
 	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_get(xe);
+		xe_pm_runtime_get_noresume(xe);
 
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
 	if (!vm_resv_obj) {
@@ -1435,7 +1435,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
 	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 	return ERR_PTR(err);
 }
 
@@ -1558,7 +1558,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 	mutex_destroy(&vm->snap_mutex);
 
 	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 
 		if (xe->info.has_asid && vm->usm.asid) {
 			mutex_lock(&xe->usm.lock);
-- 
2.43.2

