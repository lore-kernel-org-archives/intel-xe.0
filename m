Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58509C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 12:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE0510E278;
	Thu, 18 Apr 2024 12:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICaYbPL7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A1110E462
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713444800; x=1744980800;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=g3Nhhovz/CXMY3FK6q/Ob9Ujn3O7dXsWfivlxZyJ4uE=;
 b=ICaYbPL7InsLOQCeNkesSM/617+LgQbA1DsTKkFhnSLbx2+bBuzF7t4Z
 /B4e7n6I6WlWXPv6C1U9ajPSPpsg/1MQleFagXe5CQZmLO8V6kmIN7ATW
 eZML8E0BS3+V546Ot5xSz321b4EBy62+qlFgbhcuDcq/DXF4sZ4ZirHUZ
 K7/oBdEbHA6XT050trHM18JS5rhVreGuHSMgxnzJ0OUmryb5j5jVdHepC
 i6OASjEHcYPPXY4h86CooI9dZGP+NlkFe5cIogHQDTuabC9oFc5G6VAV2
 Wyy0/sSOo2/O/aKQyPLNUigcuYbiCU6d08senr6s0fIFBZrp3PwJN6u3p Q==;
X-CSE-ConnectionGUID: RkbE9SwhQg+5bienD6JhkQ==
X-CSE-MsgGUID: mMJwTVqVT4q/CSHQ8FPj8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31470882"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="31470882"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 05:53:20 -0700
X-CSE-ConnectionGUID: sRdbJoTASYi8nLpRA0smgA==
X-CSE-MsgGUID: 1shKxdh2ReiwYpOTTP48PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="60399321"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 05:53:20 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 05:53:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 05:53:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 05:53:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihX4euoxlnEE+jkntJexcB11pvwutdayRJHEMzA/aqhthMKJiz+yqGYOD/sHe3eFQbniDtHRy3vzGByeYDph9Pl3q5Egae4KnT7WBiBM2p13CABBFIP02hMqlirPZoveSy1C9YJCa3WsgTdk8urX68s7iorF11sbUiQ27Ex/Ojtf9MQlbPsBi7qtfzHUVj0MQ/IxPPAlROZHx+yZH0Q2HYN1u/ebIWA1OxXQ4+veedg3AJoDqJKJepMrtIZUM/iNLLh8qQdBmnfY0jKu2msgqFMN/aIEecCp5f2hvG0puOH2tzagfAbp7ITLC7kjrFkt/1vnlyAGN7bQGEKQrJffbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SW/NEVTRZvmCerAVbn6KIe0ozGnPEKPCVkQ4cG2R+wU=;
 b=A5qi3AR095qTZNxLp4c4SI8vwar2Sqt2LKyssKMQYT35TEYAmg27rtSSo4CjDkleWFoDtcKC73brXYNly1mtLX1427YqzstiyvPcXzaDiwyGk+y7HmNjaMz0r2K5+47Fs0MHsYrW4wpgdBKkJJ3EVhsrVPxg0+xMkd5g3ZfcZgvcJja9SyYMlQjj72SRqlGgDRTZqYcN7oVRaroPdLzFSqCYarOuk4q2kfjYFlasRVuDDKjeoUM5SiVM/DVlJWR7f5DTmG77ifX5F1TFSs1OxvXfRpRF2I9PxxrFW8zeh+Su2TSwrelfVDmHFS8VBOuEZyOU4bsTIeBYOknXQMLRew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.27; Thu, 18 Apr
 2024 12:53:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 12:53:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Kill xe_device_mem_access_{get*,put}
Date: Thu, 18 Apr 2024 08:53:07 -0400
Message-ID: <20240418125307.39579-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: c50fa881-79a5-4725-9836-08dc5fa68110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJapL3nLzJ6pqY8BUXsIG2ECynOyM/w9moUpeh/UdNoKb3VHZlX/AInM80yqnNkuTy8KTAxBFh/mH3MtOq30u62zRpKlDGgpDcX/7WfQuZ/UL99FN1F+FbVhmTa2ob0aItYhRSGdzfdkDAH6KLBxActbOS1BQoXxtfFFW0P75P/09DbvQgiy65Xlp+U76M5Zuq4x0DNwl4UzZYYPzu6JOUVCHb6l182jQpMrtWAkjlWfXjVWkRx2IqxABhdGINDFtu1PZm/OkcwMsbp5S9IfxyVw+inVdR2m3S9IiB6y/d/PyWv9tPEI7xpYJr5DVXOM/afv/UDXgucB6OXLvmPF/W1yIlDi4mJY1WV6Oun5s8yk8tNNRfoiv18VWyngTn4jO82qqYTyO6TB7qbBpMtHNgjtki1VAHKwAEUE43CK6/KyhZKRo8FIE2h+8Ktd/XxR8Cov4k7mIH+nbOoQ9c7iUOLHL2+nGWd3s99AB5PnNVhLN/P8PURPpnTLV9FMnz+U3ZfEOqSJiMTClYfOLbSrHl/rypG7aowSqubfIMezlIqim2cztsi0OwWBbeK0qUT4CvOnznPBBEF1mw8evl4xQAacoHmPo6D15PRRMW/PLmmaXevG8jVrJw26X4I+tF6IuOAnRkc29Tb2yo9lg+a+EO33+DYil4VsLbV8CgYaiNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CDCmdhp7mg8Q29QDBEtGAaHPbor42/liL6kmCUAcAI/0m6rmowtVKO6BvaA7?=
 =?us-ascii?Q?33Nu9cleS8Andpbyrhb9J5RAyqfCVPTuFUSyN+BTkp3QIL90MGBE8IzCymKu?=
 =?us-ascii?Q?9liaAV3DSqJ5c5Pw7tQss1Plr4rJyM8ZX7wrbk0ZFEF2CHhPXNy/Itqw6Lql?=
 =?us-ascii?Q?VklQ4leUNHsnpvVyLc2D/Mnym+4i9O9lsR9EvePEF5u1tDq4B5MrMflfqpnE?=
 =?us-ascii?Q?yMoY45DWSukwauVPeR4Chk1WFFsIQcUBj072IvanMSb4N9YGbBGkC4YoAcUs?=
 =?us-ascii?Q?tDopabeJmvnP2o6sqg+YEpzuOB2IPgYr70C/Qz29bNMkmvOqfqeGFcMu8TcM?=
 =?us-ascii?Q?SgcJIcYk2Q+NeXqTNyqw8Onodvro3pttISkUXQLSZZnU3N0eZBuiniooguOU?=
 =?us-ascii?Q?Qp5pJPPTFqwQ1A6RuKVgGe/N2GtLgQdeYQUkAJf8Tch+9YY+iXSZtjvKSNoE?=
 =?us-ascii?Q?8kn7gpIg97ITow08+M3O4al0pueJkhSCYNFcW2b+/UluXzN1apPy+YO2cdbS?=
 =?us-ascii?Q?W46vo4QufMseWjo70d6ADeWo9zJsZ1ZxNNv+s90zdfLWhCMncBnYqa5yBbIp?=
 =?us-ascii?Q?yPYBydcebKwX+jLJFGxa+KRzWR+d/caVXaSgh6G+nWN6OY7Mssh6b9C+yzqa?=
 =?us-ascii?Q?VLhX95CtK8X47zpN85Nz+aP9XScrrtFQTtntq30L/9a6P5fI56KFbpS3Z2+H?=
 =?us-ascii?Q?faXEPfgJkEO1HTDaM+XruyW0NS8q1alHfWx6fIveeMgSD4SrVOaXn2kEwXRM?=
 =?us-ascii?Q?VfcW87QpVmKhMf+FG4zUtPPv2nn7kFsyvsrtaQjuwBnvMFEGKNTom0JFtNPo?=
 =?us-ascii?Q?00Hh718leo9b2bfnNFOiMZSKtxJrTfSqfhuCP+kafVmheDqazUGK/JR9Z+Me?=
 =?us-ascii?Q?vckrSnn3IvNUO4F3guUgTzNvjemPa273mTco1MXDTVnL28TZP8dt2MfS+3b2?=
 =?us-ascii?Q?RCcDyq4kkd2FA/gE6gU3TVOw+l93fYstfrEKHXedYiEH3ZRwyqMU2lRsqlJb?=
 =?us-ascii?Q?EPmjAyMYbTVj33OKM8GeXwkVBAML5iB0Ok1FlVAgAnU6Qp+b45hmf+ODib3j?=
 =?us-ascii?Q?4c9smawH1eIR3stF3dCqtt1HE1yN1Y3kuVZRNCn9pzn6598BNXXLC362oV3e?=
 =?us-ascii?Q?MfaOlYpkOEpHTXSxtn7CeXVT1+eg7vRJ3poiAXzkLMVHcKVyin01hnGd7Su/?=
 =?us-ascii?Q?HQOKWYBxVEoFjK6tBVfKO9Ek5vqr9GtO8eQUh/nk/pqmFupJVVb9Dz6Tc8M3?=
 =?us-ascii?Q?AmSfwWfBT9gcjzw29x4Eni/YX5/KwE0FtAETmzmzWaltSO1Bb3h1iMI7ILlo?=
 =?us-ascii?Q?vZnvZ87B2BBDKfVcvhvYlWF1j9qACRXvGANQ707fP0Y88vTdavMPww41RVsO?=
 =?us-ascii?Q?xK1dBzL7hSz3+AUbJVc5bV3kyB9RJH4m6QqjF1AHNtdVnJ43G8peUmZRunNv?=
 =?us-ascii?Q?G+pPJy6PN8nyKq7wYI4g56ljPeszfa1xfQ4Mr3z5WP5yDt8WAMT8F+kbkxpC?=
 =?us-ascii?Q?ZlWBIedynoGl8BvysvUrzfjNpEPCunSpEtDkeW7IKynMpwL17Fh4GJsxjGad?=
 =?us-ascii?Q?CZftPO2rhaBaY5sfTmWC6MLHLxllui2WvtroXG5h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c50fa881-79a5-4725-9836-08dc5fa68110
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 12:53:11.7039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPiSB0tu6f+EBib/ByL6TZFthWhskC/jQek+qLs8N+NUuIPbGTjE03KAYL6FFYb1yAOgzMT9ThImWrjMmD6q7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6252
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

No functional change is expected with this patch since
xe_mem_access_get was already using the xe_pm_runtime_get_noresume
at this point.

v2: Convert all the current callers instead of a big refactor
at once.

v3: - Rebased
    - Squashed the GSC/HDCP
    - Added a new case: sriov_pf_policy
    - Improved commit message to highlight that
      there's no functional change in this patch.

Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v2
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  6 ++--
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c   |  4 +--
 drivers/gpu/drm/xe/xe_bo.c                 |  8 ++---
 drivers/gpu/drm/xe/xe_device.c             | 36 ----------------------
 drivers/gpu/drm/xe/xe_device.h             |  3 --
 drivers/gpu/drm/xe/xe_device_types.h       |  3 --
 drivers/gpu/drm/xe/xe_exec_queue.c         |  4 +--
 drivers/gpu/drm/xe/xe_ggtt.c               |  9 +++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c |  5 +--
 drivers/gpu/drm/xe/xe_sched_job.c          |  5 +--
 drivers/gpu/drm/xe/xe_vm.c                 |  6 ++--
 11 files changed, 25 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 3a584bc3a0a3..776b197480a7 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -10,6 +10,7 @@
 #include "intel_fb_pin.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_pm.h"
 
 #include <drm/ttm/ttm_bo.h>
 
@@ -193,7 +194,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 	/* TODO: Consider sharing framebuffer mapping?
 	 * embed i915_vma inside intel_framebuffer
 	 */
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	ret = mutex_lock_interruptible(&ggtt->lock);
 	if (ret)
 		goto out;
@@ -244,7 +245,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 out_unlock:
 	mutex_unlock(&ggtt->lock);
 out:
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 	return ret;
 }
 
@@ -383,4 +384,3 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
-}
diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 264b957f3639..d46f87a039f2 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -215,7 +215,7 @@ ssize_t intel_hdcp_gsc_msg_send(struct xe_device *xe, u8 *msg_in,
 	addr_out_off = PAGE_SIZE;
 
 	host_session_id = xe_gsc_create_host_session_id();
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get_noresume(xe);
 	addr_in_wr_off = xe_gsc_emit_header(xe, &hdcp_message->hdcp_bo->vmap,
 					    addr_in_wr_off, HECI_MEADDRESS_HDCP,
 					    host_session_id, msg_in_len);
@@ -247,6 +247,6 @@ ssize_t intel_hdcp_gsc_msg_send(struct xe_device *xe, u8 *msg_in,
 			   msg_out_len);
 
 out:
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9889adcc458b..bc1f794e3e61 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -716,7 +716,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 	xe_assert(xe, migrate);
 	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type, move_lacks_source);
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get_noresume(xe);
 
 	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
 		/*
@@ -740,7 +740,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
 					ret = -EINVAL;
-					xe_device_mem_access_put(xe);
+					xe_pm_runtime_put(xe);
 					goto out;
 				}
 
@@ -758,7 +758,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						new_mem, handle_system_ccs);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
-			xe_device_mem_access_put(xe);
+			xe_pm_runtime_put(xe);
 			goto out;
 		}
 		if (!move_lacks_source) {
@@ -783,7 +783,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		dma_fence_put(fence);
 	}
 
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 out:
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a7c4e4f73200..1ac910bd5115 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -733,42 +733,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
 	xe_assert(xe, !xe_pm_runtime_suspended(xe));
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
index 54490802e97b..36d4434ebccc 100644
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
index 60ced5f90c2b..2014d87765a2 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -384,9 +384,6 @@ struct xe_device {
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
index 50ec661116a2..395de93579fa 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
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
index 38f6c94c722d..0d541f55b4fc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -21,6 +21,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_wopcm.h"
 
@@ -403,7 +404,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
 					  alignment, 0, start, end, 0);
@@ -413,7 +414,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 
 	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
 		xe_ggtt_invalidate(ggtt);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 
 	return err;
 }
@@ -432,7 +433,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate)
 {
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 
 	mutex_lock(&ggtt->lock);
 	xe_ggtt_clear(ggtt, node->start, node->size);
@@ -443,7 +444,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	if (invalidate)
 		xe_ggtt_invalidate(ggtt);
 
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
+	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 }
 
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 3eaa17ca54fc..fae5be5a2a11 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -12,6 +12,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_klv_helpers.h"
+#include "xe_pm.h"
 
 /*
  * Return: number of KLVs that were successfully parsed and saved,
@@ -368,7 +369,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
 {
 	int err = 0;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
+	xe_pm_runtime_get_noresume(gt_to_xe(gt));
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	if (reset)
@@ -378,7 +379,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
 	err |= pf_reprovision_sample_period(gt);
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
-	xe_device_mem_access_put(gt_to_xe(gt));
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return err ? -ENXIO : 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 80daee910ae9..cd8a2fba5438 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -16,6 +16,7 @@
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
+#include "xe_pm.h"
 #include "xe_sync_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
@@ -159,7 +160,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 
 	/* All other jobs require a VM to be open which has a ref */
 	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_device_mem_access_get(job_to_xe(job));
+		xe_pm_runtime_get_noresume(job_to_xe(job));
 	xe_device_assert_mem_access(job_to_xe(job));
 
 	trace_xe_sched_job_create(job);
@@ -192,7 +193,7 @@ void xe_sched_job_destroy(struct kref *ref)
 		container_of(ref, struct xe_sched_job, refcount);
 
 	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_device_mem_access_put(job_to_xe(job));
+		xe_pm_runtime_put(job_to_xe(job));
 	xe_exec_queue_put(job->q);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8a858b8588bd..85d6f359142d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1266,7 +1266,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	vm->pt_ops = &xelp_pt_ops;
 
 	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_get(xe);
+		xe_pm_runtime_get_noresume(xe);
 
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
 	if (!vm_resv_obj) {
@@ -1376,7 +1376,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
 	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 	return ERR_PTR(err);
 }
 
@@ -1507,7 +1507,7 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
 	mutex_destroy(&vm->snap_mutex);
 
 	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 
 	for_each_tile(tile, xe, id)
 		XE_WARN_ON(vm->pt_root[id]);
-- 
2.44.0

