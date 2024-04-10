Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C924C67861
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 01:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCEC11309A;
	Wed, 10 Apr 2024 01:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvxAQbkX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D93B113096
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 01:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712714335; x=1744250335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wToro7IyPoZng+N3yCvWz6ure/96NjLeLdadRTYOlfE=;
 b=WvxAQbkXWcH0GaQX8e2ri9rqRw5pEGItJWpgq78ua+VCSmKnMPB+Y8wQ
 sAi88P+wLj9cwd6zrylBPD7jC5DjomS2VZkG1AeO4N0eUbNORZvKyspGL
 8EzTY02P4qreth43uUQ18kn5IP5r4SQVfAguPtnxxBgL1C61vApstd1vf
 /wb2COdBrK9ONo3dkA0hgYI7CQWm5cENUBERiNdxg+0sh3KbkzngLWgBW
 GFUrT3VKNX3qd/3Fz/85K9MClRHZzGzOVmpQFRPcXqq1dkaYFzk3UfVld
 X1k2Ht7tM/+IG2/AJgK96KzPF3Nl8t11UodypOzWJOY0dV9kKPo98n24p g==;
X-CSE-ConnectionGUID: URN/caoWQL6h3djKllbWbw==
X-CSE-MsgGUID: WOrMttUwRuCDtSgcKaHtoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7914100"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7914100"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 18:58:54 -0700
X-CSE-ConnectionGUID: AVRNwot3Q/ufz49ULHiVkQ==
X-CSE-MsgGUID: ik9k0GY3QM6gUoWqRq1zUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20970964"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 18:58:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:53 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 18:58:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQKi3eoiMxdxCVrZB0zBCf8fpYqeUmoRzJg0yInzvBPf+Ny3apklpg5EDocMz9JCF0i5wxrv8Eh71/sr7MtnJ4KJ9pl/FaHZw+VmRz4xRdQXxlvlSQ0mQAopO/ncLYFgWDgktqgIq10U1jh0FxBCLBBOZpNDgx2MUeJvxBKrEjaI9JHAGz0R5JE1BjyI4ZFolTEJnr6vDEN1vog/5h4icofrzs/IE7Vj2GfbtBPmdk7vzvuT5ceEsofKMKPSOsjozZ2kWhbaTL+Jj/uHD78MTIQdTw/gR+RzKVq3RRLs75BQjHIa+7r+BpS5vRdP61gaO1GwoZx7kvpOKpmn3PJy0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9BOJtZAlQWFf/XKQ+qmmxgFKCE/S83SgG06jzRP80s=;
 b=nee+YCGzrZiBR/bpvPmK6SGJQGRlhuaj9LRQpgOdTIvlONpQAZxZoFvIexSiVbbJ5FUjJtqtxqTPTwM+HP4RhcVNBPNPDS/tS7bI4WPchS6SgXwHZ2EC25B/yyHMsPB4P24EBL8nHLIRmbm4G++jv8i8guIx96agaz62WhzyW9JXE9p3uy91YHaZ6Zqzh5iNCe5MRqYmIrjsdvJs7FDi7oyf1LbF42Rrk0YqIlqqCkMJZz8mc0xfO/Nl+pMk1tp3YosCwNALwwc5y3FRwGJCTBygHX/Zfmo4ftYc+7AK1WNhJFzaO+i/xgABR1VxZgUsAU+fiSU3RoSxgXwpqhbu0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 01:58:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 01:58:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 5/9] drm/xe: Remove useless mem_access during probe
Date: Tue, 9 Apr 2024 21:58:21 -0400
Message-ID: <20240410015826.1093368-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
References: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6891:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q7RKU53G3+2tg2vyj/CfYa9xWX8pDBgc+br9qY4uCHRFLlljiqdCQ1LTTQEXJzI+K2zeLxu1G27j8Nvrk4w0BDHsmjNI1EK4Ql1pwL/D/1uOYcm8GKwK8eh8Vp+A/L6tXO1lgDYk2uNZnWfeD3zjSoFY9iMPqYPyq7dK6oVLMtRAN7Qb2ly2WWFlWeHbT6biCacaXSwXwSgWo86ptgpx9E3PG6cY7o7AEWmaHKedP7lNmPtRaNI71gH8qe+871kgvmUxaUGJPgyqbtkntyErkSRbowJdY9ZOnvkzPvfyc9QJdSXdFURIKJvAx90rQcvbL1dB2daXOCY13biel3SKkAg3LR6uy1P9rmvI39EAgyi2mnlaIS/TmOMqeqJgAkCA1Bt35ZCvRgDkqOHvDJaAxLLjc4VmzBCf9LaJ+3+9OMtd9eb993lb1RuCABaWYzR+gOUsauN3tsZAhdtySSztlUUzRRB8bXTDkLTRlKfTsaORi4Ivtb8HE+sjz34jdDYXrdHx1ENQ1ivXYy08fIbfAY5IKEcXa71TzY5tV/o9ef/VjBpUCsQCE96DXMSgeLlp9OXW1QMiJmXF0B6ZbJz7wmQqIugv4t+a4nLHOt8nC4lQzZrRy+/SM8VvJUg/CIMoXcSXB+sIo/+Z4ZBpX38CwtSBo1VFowTF2tT5r2iUu8g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e4xkXQ3RluB/iz0MoHKQBoTsvd6jLmDZCxqA/f16w1rw8+YTlnWm93vZAQId?=
 =?us-ascii?Q?NWGtlXh4X6riwtFgU9eKb9t2Xpab1zWsYaufWeSKoEs69hsjTvQzUxOfp2/Z?=
 =?us-ascii?Q?kD5pn0d2BA7ygk7SSHUbJkarNiA+GgfiNcPqL5+EtfXHkNmZgxeTPabLqNbu?=
 =?us-ascii?Q?M7koyYe8wiBjkE83xUNau8/oVlbR3eOyVk0r0tf6Hpw0yLMYSfUMszoCrvXX?=
 =?us-ascii?Q?smAjpAhX6P3/LdiYPWVZpESz2Knm69i8HRcnbBnpCABi0vQc1prstLXx9ihA?=
 =?us-ascii?Q?6pqyuyncF+kKDSPigg/HIJS+UB1lv7zuwSEMkrtuH45YcUjBqGjir+pETAza?=
 =?us-ascii?Q?5+NFxzJuYLkk9O4BxIMUnLod3jPQJVMi/gn57Is4BJY3Jx6ox+3lvPhwVZRf?=
 =?us-ascii?Q?uB16TygVfYar2BY3FaZJaERWxERTV7O2Av2eN5nxaz7MYld9aefDnWPjHmM5?=
 =?us-ascii?Q?497h+H5KAml58bx5bhVyRpyXgLrp6wtQZ6gv5Lkald8g5+Ekp/jO4mEN5kd+?=
 =?us-ascii?Q?jmsWpUKTlMEi+zn0hUbTK/N0po0nqQkDo4ddupGYpAHemE1R1lEXx454O3nE?=
 =?us-ascii?Q?DgJgEeXRSpGWdXrE5pfAWhTfjGrw6jMUrqo09gLe0CqLTNzv16DCdRUJDTsu?=
 =?us-ascii?Q?i3wi7iKprELdWERIKQSFQGOpL8hcCjlmNhRlSP0ja+a5fy27lP8Ytmd3215x?=
 =?us-ascii?Q?kIMUGJYsXbSpBOkWQHhoiB7z4AgynqkauCL8LgSSA5xWgoAQLiDKk+s7jMkP?=
 =?us-ascii?Q?c0DN0O1jJumFMDXv4jHChXINPObqNDrJZYirwYG4l+Bt3nGXBfxtT2quFADx?=
 =?us-ascii?Q?e2hq0fAmA6oW22DPjE7y9CkqKW9OqgIa244Vcs6VWBqjumdsz7lvpXfDSfNp?=
 =?us-ascii?Q?0xpeNk2J31cvZzUbAJzp/k5uso4HCHYzVgRrnO6xy2CpxGWZEIAqAUDTHTX3?=
 =?us-ascii?Q?+5qDCtgJakZ9hrDCz7x3TAIrpmktegpcD79fBxJoKI6aQT+nDRBkT4of37Z2?=
 =?us-ascii?Q?VLZlJ2wjGfAgPpuFp2PaRZCjj428OAObxsSwGiRWWAaT4fxo/8t/6M6F2Lnw?=
 =?us-ascii?Q?jG8eP/y1EQXQHZeJnEU1bpDrWBIHACQyjimRSKCa+s677Nd3wCaMspfeXRKl?=
 =?us-ascii?Q?U/kLwIiDHexFFJBthSD54mQAA9zythIZFxy1d/S9i7CAFdVX9zzGETkACnxX?=
 =?us-ascii?Q?aiykFPLNmNDyfNoPpeABlxCeYLLQNWppdcThs6obZHZgR7mvJ0Py0d+LlU13?=
 =?us-ascii?Q?sDJmKT0C7p/W7wAWst5N0ihubTZarlCAgq03ZiqJDKEx/NUUXgj7pduNZkQB?=
 =?us-ascii?Q?Ene+wBwN5DfOZjgUgXIikRsMQQdRREy0X1kiAfMklRlOx8Ug9UmV5o8TyxmN?=
 =?us-ascii?Q?yGY9f8Yv8ZGS6SG+u6vXfpW5yAtggzhnSVikYLmBL7dRSOYurPD1iCesemz9?=
 =?us-ascii?Q?RntRyhJ5tUqltAuOmpN7TYnHEzORzh4OI40LBVa3dDTY7lReKHRnJozCPctc?=
 =?us-ascii?Q?LmDa3egGjsh0wY/vTLw3d6w1eE0h1ske4Gp/yNWjesglZWcOLB1yAL/NCsr5?=
 =?us-ascii?Q?HBnvZThUXBeaz/LvlMIaXgEp+LwBkAIwDKGW/2Rbuliq05fo4BdCBbY04muA?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b587ad6-2870-4a58-b528-08dc5901c433
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 01:58:50.3773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sM42cR2DGOA+LytX9x4m66Fc80U5Fh+bNo/hXBBLPdXC0xiyvw786/maHsBzBc8JCHUOpDi6rEB2+xmLNrd5fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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

xe_pm_init is the very last thing during the xe_pci_probe(),
hence these protections are useless from the point of view
of ensuring that the device is awake.

Let's remove it so we continue towards the goal of killing
xe_device_mem_access.

v2: Adding more cases
v3: Provide a separate fix for xe_tile_init_noalloc return (Matt)
    Adding a new case where display HDCP init calls which
    are also called at display probe time.

Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  2 --
 drivers/gpu/drm/xe/xe_ggtt.c             |  2 --
 drivers/gpu/drm/xe/xe_gt.c               |  9 ---------
 drivers/gpu/drm/xe/xe_tile.c             | 15 +++++----------
 drivers/gpu/drm/xe/xe_uc.c               | 11 -----------
 5 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index ac4b870f73fa..264b957f3639 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -70,7 +70,6 @@ static int intel_hdcp_gsc_initialize_message(struct xe_device *xe,
 	int ret = 0;
 
 	/* allocate object of two page for HDCP command memory and store it */
-	xe_device_mem_access_get(xe);
 	bo = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, PAGE_SIZE * 2,
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_SYSTEM |
@@ -90,7 +89,6 @@ static int intel_hdcp_gsc_initialize_message(struct xe_device *xe,
 	hdcp_message->hdcp_cmd_in = cmd_in;
 	hdcp_message->hdcp_cmd_out = cmd_out;
 out:
-	xe_device_mem_access_put(xe);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index ff2239c0eda5..842097effe4e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -203,14 +203,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	u64 start, end;
 
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
 		xe_ggtt_clear(ggtt, start, end - start);
 
 	xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 }
 
 int xe_ggtt_init(struct xe_ggtt *ggtt)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cfa5da900461..64ef0b1191ff 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -347,7 +347,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_hw_fence_irq;
@@ -389,7 +388,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -399,7 +397,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
@@ -408,7 +405,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_hw_fence_irq;
@@ -474,7 +470,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -483,7 +478,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
@@ -496,7 +490,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 {
 	int err;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto out;
@@ -519,8 +512,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 out:
-	xe_device_mem_access_put(gt_to_xe(gt));
-
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 0650b2fa75ef..74ecb5f39438 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -160,24 +160,19 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	int err;
 
-	xe_device_mem_access_get(tile_to_xe(tile));
-
 	err = tile_ttm_mgr_init(tile);
 	if (err)
-		goto err_mem_access;
+		return err;
 
 	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
-	if (IS_ERR(tile->mem.kernel_bb_pool)) {
-		err = PTR_ERR(tile->mem.kernel_bb_pool);
-		goto err_mem_access;
-	}
+	if (IS_ERR(tile->mem.kernel_bb_pool))
+		return PTR_ERR(tile->mem.kernel_bb_pool);
+
 	xe_wa_apply_tile_workarounds(tile);
 
 	xe_tile_sysfs_init(tile);
 
-err_mem_access:
-	xe_device_mem_access_put(tile_to_xe(tile));
-	return err;
+	return 0;
 }
 
 void xe_tile_migrate_wait(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 7033f8c1b431..4feb35c95a1c 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -32,11 +32,8 @@ uc_to_xe(struct xe_uc *uc)
 /* Should be called once at driver load only */
 int xe_uc_init(struct xe_uc *uc)
 {
-	struct xe_device *xe = uc_to_xe(uc);
 	int ret;
 
-	xe_device_mem_access_get(xe);
-
 	/*
 	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
 	 * to correctly move our tracking of the FW state to "disabled".
@@ -65,16 +62,8 @@ int xe_uc_init(struct xe_uc *uc)
 		goto err;
 
 	ret = xe_guc_db_mgr_init(&uc->guc.dbm, ~0);
-	if (ret)
-		goto err;
-
-	xe_device_mem_access_put(xe);
-
-	return 0;
 
 err:
-	xe_device_mem_access_put(xe);
-
 	return ret;
 }
 
-- 
2.44.0

