Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E67C54E41
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 00:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7960113602;
	Thu,  7 Mar 2024 00:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNatIG/P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3985113605
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 00:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709770596; x=1741306596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WbGXKbeyrwWm8WmrUEF1l0e2y1HtVwt53FgPI5o7iOc=;
 b=XNatIG/PzohOI05qHaPw3WQwQEhZvhRHVnNQA22xvCG/2swZH7xjdRfo
 JoCnobrucGKf0qlfTtHCPMQ52FH52yWHZJ0Dvqlu++NJHbOklkUBSybqN
 7WoVliOVUr6dvvDLcKfcZ2IwiXSP5zEkjsV0vYp1+9NVDwoA1Tu758h81
 DIunJPlsk3qpw9k5DQVaHizqZ5EVMui0sohCH7E8NkXujVy0VlKJM7cT4
 q/ApCwJpTUDiQlEX5vtPUcou+Jp0CclLnQbWT6BkldI/kBWGJlbdb3P09
 pnA5EKAe6wtqYk5lTN+LoUvdBsBNg4eiba3q9GaQeWahzrngWvDICzcwE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4350892"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4350892"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 16:16:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14576903"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 16:16:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 16:16:27 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeKkmOl/7BvXNNOO9oPV/Kwh5XGdqBIvnpFf1Q03fMdeHd//L7E/FGxljKi7NQH74IIjAmVtwcqYF0DCa5b1MP9YaxWd1e1Tj/kjng5vQsO5Bic7ZzFhnobgsisBIZuKhuy6FxlAlXkDmHskUByG/1StmIUia0TMCHnolECeX1Xl2Lqf3WsbA/Q3GpmmMtCSNATRgjUmnVe7TqgQeGNyuE3KxtanHloy9ekLlG95G6xj0hFXWW+y++Z6NHbyv15HIZDI168dSI3GRaa8HKH3m6KNsHzsOnc2zDyDeyYRiRCbs238q+GlzRyVRsDYUHqPUPVmERj/EjSn1qASlpnj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbNa6kqndPUlsSDQVZiN4AyjlVfeNtHMcJyYlifXheg=;
 b=jONHNbBEqpJAqIJ1/66Mj+ql2OJiMh+TZ0/3w/jbK4pYje0Fdi3ZiAq8bgH5adpIGw3M8UpFW8Po8Taqq5kwRiXkgtLN1QZ9NOEcyPMXNi8K55wQLrArNYQAmK4PBvF6/UgFR6Bs8e/oOZ+4aMOW4IyPUb1Ea5PSNUjAbNzKVylBVms5MprC6bSuTInKwGW8TntQKuODeXk7S6n/Eze6+0K3SDauWu0+CCOYSOAyUsmG8gBfixgIi3mfYvuRzzD5xmjFT5PnqHemSga9iOmg36di7I4wEm6YttPCZN5LcUTbuvJIe4En3HOh2KYQjcnJnngAkhNI7PQ2MKLsu89GfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Thu, 7 Mar
 2024 00:16:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 00:16:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <intel-gfx@lists.freexdesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 10/10] drm/xe: Kill xe_device_mem_access_{get*,put}
Date: Wed, 6 Mar 2024 19:15:54 -0500
Message-ID: <20240307001554.162153-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240307001554.162153-1-rodrigo.vivi@intel.com>
References: <20240307001554.162153-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: d83e72b6-6ec0-4cab-5e80-08dc3e3bd36b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/lbO95advko+Mim8BjvPnpZE3blWILnqSglupBNZg55gWDfGZJY+rMzE3jUNBND8VsWL7ZlcBseTHA+4s/4dQMVkn5oUgUvsgwfqRvfe88jnrQGca52BdXrbBmZF8XaQOxp5DDLUClQIzULbS7SJKi5m+22ihuQ7+LxIPzI2e5Vr6E5apqFi4OYMzVO//lLJu3xGFu6vb96zLhpmoPcQLOqhm/+kDBmC/X8zrjEQh0mB6Ovt/YoaBiZLBpqJZgRQLHZ6s1BSUjHjgkPhlVsCcf/F8YgK2Jc0fiZaysljxq3HlYKK15SiNta0boKqDjiuikb5yqmK4N6MiHStJNogC3SZg911czdpp5Fuud9CiaURJiIN8a5v/k25CsczXYsPR3FQOXeoeZszVzMErAFqamoz8IwZVmI2nhjJfdILizr+w1iozuNX8SGxUPQdzoAi8hgI3KneRSiM13H6kPHDPuKSGJvi3fRXOrVosFEl2hebcenPRiUHJFoEYbaeBhYsEt+WOUn3V8bCx178Rjksc7AwGdwQoOx0j9XHgIOO3axc/wTtqz4sFFC6GM6KTipAjGmgjOxB7L+GoyJ0EkLr5WJLFchs/icr2MmK07C/ii3NCQ44udkG3zYbqYc8szO0H5PJFWeyXD0A8w+J8Vq/Gro6EweGwOUCqVvjsxP8l8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p6Vqs+l3CsB+whgwVJ1ywH+PDsmEZAeqid1QX33zz8piEAOCOw4I+fuMrY4n?=
 =?us-ascii?Q?enPzt2CDlawaeIV26SRMLtS9wuiIpbn8BXkzNcogPQOB98yuwGmcJw7QtJ7O?=
 =?us-ascii?Q?BRuG5zjgIa/vYwMvu/iafXrRekbUYKfwVO1c1tTg9Blx5p1fgEk9zkg2cYyh?=
 =?us-ascii?Q?5D4YCQqei+G1EXGjxKAWlHJrn0S84LxzWvKwcYdXtneoeF+dOdZtcCN0Kq76?=
 =?us-ascii?Q?BTdjvx3Npf+hf8I79TuoPqOA+cCGpzSR628aeKvszMNGRW/YzM2DIoYmm/oK?=
 =?us-ascii?Q?phB8rcBuV1jbpE0OLWWXfvv3Lgg0XaWG2kZ/Tm6JTDC/TifH81+ZPTBgy2ij?=
 =?us-ascii?Q?XrYawRQrdP/5sVrZcprdc6Ngv8TszpIN2r8cWM5CgyLcsDCO/WT+jIIXm6j8?=
 =?us-ascii?Q?PKRhPR8bkSry2a/laWpWcgoBTb0w305kGTgxpnZs37kUCrq8rf7WWpgy1C+H?=
 =?us-ascii?Q?ij0BeNkz6wGToAxAheBWWuwFWYVuZAuTfC7b2PSXcnyIlQagNHyEQBmrfL4H?=
 =?us-ascii?Q?L0kAjWBO33YLUg6DufiO2had3amrQQs+KQrxcdnuyLmRxTzcEQ6zSdT47VyU?=
 =?us-ascii?Q?h7JMVIa5tI4/xIzIOimS0lLJdcnK+lBP6h2x+NYD8/OX2dustzX+ZDeHvPkT?=
 =?us-ascii?Q?McrWPdtmHpUGefVjBVJZT9yBjDsEyq39srhnfg0O1JF0XBeRi6QxMOL4RFNN?=
 =?us-ascii?Q?vUfUGxGi9uxU6Ay8eNEUcCQbr9+2ZmLSw9F9A9FjcobZHIcSvJhZFtsYRMTs?=
 =?us-ascii?Q?VMCp1nmWS/ZDc542CsKYKJ8lfFMDRY+OiXz2HKkwZjSmp1AkN7qWHqG62ME2?=
 =?us-ascii?Q?cPd69T7CSV8xwAchgWnCU9NEIaD+Y+5V2UMjppQll1ihLvEsTxo7Je2RnxYX?=
 =?us-ascii?Q?HmbvMYN9QaU0IOvTe3Cj5/pdlhLhn/WBQwB4Ix4LFZmlZLH3Lt7sj1Dh+/74?=
 =?us-ascii?Q?96q40Bo05nKI5lS5WX+41a9ssR50EAP6BQKQfsk9qTuQGtIugnDgeWC1XB+t?=
 =?us-ascii?Q?0GuJTOKI9AMHXyzCaM9vQNaNm/uvdObbMayQZK8ax0U3bNUhG2CeMXbT6dNn?=
 =?us-ascii?Q?v/6lBtGTl8PPp3oSs3jr64z0acbGXDSL7j53Eq0TVJ4UUlC6B5cPXMcbZ/Zz?=
 =?us-ascii?Q?zF32OlVd9ENyb+Ul0rIAOfsFokDYkP0znVQvzALCq0wMmjlwUlSj9ecSn20T?=
 =?us-ascii?Q?DnprbUklj7abxlWeW1IfCh9Ku0+uvMi5/HXq8JvFRXj9iicIx+Tmf2nCpVmU?=
 =?us-ascii?Q?ZIqr1LUVma3vnUOpo2wiapDFYkpNbhSgTXadWc0o/OgKhHcFtKkrJbXdu/C7?=
 =?us-ascii?Q?ZRTEcffDGI/Xvz/5oPXjvFhRyqQbvE24FcnTla1Ogd5O1D/r77vDgnz6OM1q?=
 =?us-ascii?Q?HKk6yRPigEAfO0yt/2SbqzlN0p3Ip6VUA8p+5I9w7FsuhKj8OeWN+aonP+vz?=
 =?us-ascii?Q?LWhayWDm5PtXO4ak5kVj3rF9eW8DLDiZLKyCeEJHHIp1DWxt3riNJ+PJv8iS?=
 =?us-ascii?Q?WjDO360Q9TLJIW57gBuRNBNn3+cnf5LUwNzGk3w4s6u9WvP0whoz7hb5AMOD?=
 =?us-ascii?Q?M2ospca6fF2t5Ek3t59MXvJrDJR7OB5tKKa+PTG+/TypJ0DKPxz3GEuqfHMr?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d83e72b6-6ec0-4cab-5e80-08dc3e3bd36b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 00:16:25.3207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0n2d44EwSXYw4vptla4NFfIHM0Eq5HhAizll2mbn8cYQkq/UhgacRo13KDLqI3I5AbqXv5WmV7yq5kXlhZo6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5792
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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
index bc0cc5edc533..531c67083e2c 100644
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
index f69a9c99329c..42ddf857e9e8 100644
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
 
@@ -589,7 +589,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 				return -EINVAL;
 
 			/* The migration vm doesn't hold rpm ref */
-			xe_device_mem_access_get(xe);
+			xe_pm_runtime_get_noresume(xe);
 
 			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
 
@@ -598,7 +598,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 						   args->width, hwe, flags,
 						   args->extensions);
 
-			xe_device_mem_access_put(xe); /* now held by engine */
+			xe_pm_runtime_put(xe); /* now held by engine */
 
 			xe_vm_put(migrate_vm);
 			if (IS_ERR(new)) {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index cd5bdaba07bc..91a8f73ac4f2 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -20,6 +20,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_wopcm.h"
 
@@ -409,14 +410,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
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
@@ -434,7 +435,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 {
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 
 	xe_ggtt_clear(ggtt, node->start, node->size);
@@ -444,7 +445,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
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

