Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C19C6FA8F
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 21:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C8C10E5FB;
	Wed, 30 Aug 2023 21:47:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A2F10E5FB;
 Wed, 30 Aug 2023 21:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693432049; x=1724968049;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=d6NqkVWv7Ng+r+1x09ooFslUCJHse5EBKXNVAP113DU=;
 b=AT/yk0D0hGF9O8Uemx+WmYezFVDxB0LbYGKztd0An+UJhCP0flX6OVal
 06185CWOJtpjk8FAjQB5vcd77oIV70uISrHddNDLCogNkLiC6xg0IG3b0
 iak47LaFrboZbeX/J7qr1+RMAyOyNSPwPOaYIC0ZDkY3VlWiglm/lQqjH
 84df7Ny959FrBOGN7uaHooz26dkeaGGifK4xaEVyMZFIAmo16qiPaVgU9
 VJe7enpeSeNz0cJsBSy9vak439EqWLYslaOuzW22NXaOX6lU8bxnYlT2E
 kC5bHKB3EWiXT3MLGIMEqhupJkDFW4dq7QX6LfAzeC2hJK+2+pkh8B++0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379507182"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="379507182"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 14:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="882898492"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2023 14:47:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 14:47:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 14:47:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 14:47:27 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 14:47:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKjbGTzPi3SyQp49hJqOXM4N01yLPyf5DjpMkw7yAa8IaP3dNwXBZGGqDiBvv6l0Ppdobpk4CJkuobzS4AhsEhrpCCDVXnJ11/cu+aX0Xh1P+NGxt+nwKwfVBG0EPx44Jj7GjACWCUeK/6n9lKz4N2IBob28gu1m5UFQJcZH5Vmnb9BRvZT40wauzt+S+lWllUxkLN2eJhIrogQPYHM9xgDZnKNzGt4gMMuVW6Yq5GEgvw3V2FpONagxyrF6yCPlV7Y3FJxA/SzMxM56Q2wFulnDmRXJmT0TwXGClBnYHSrv6KfIANwBbJOfxCX9/D8KHHotqz/xQTMnXruAOPYIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HsI1jPyYh00MF9kctw4XT+E/VC1h8+UN5xso4O2Uxo=;
 b=ILm0PiXc4oVoAdhJ8phNFYVFFRKZlKktbLewzWV0+baepr/xtttrdKThoUMBayPV4FPOyMRf3NVgbGzaCMV9Ms4P0gzizFWVNSEeF5Vr14F4J3xX0DJ4AaC6hLDKyxRXd2Y44FFH2xQ4xrCOLwVzL+h30RbCXAq9w3lrbIr1vUUlfwv53C8sCugsua0ky+YfrnV5HmSNUeYKvMwkR8SF8uUN8pcKfNakoXoSaoBrRMXYq7cy+T4yewzImwckUfTXkYuUlENSdThHySlsTUo/C7NVktj00uqGPWmLQAvQIMEZ4Kypr426FXtNmbIEnvBpHzJ9kqXWLcXSmzMx/ZlI+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4714.namprd11.prod.outlook.com (2603:10b6:303:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 21:47:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 21:47:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 30 Aug 2023 17:47:19 -0400
Message-ID: <20230830214719.113454-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4714:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b970c7-1612-421a-3466-08dba9a2b299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wPrwXKG88cmIBysyiONesrzkc7Xo4Z60pWsY8HKp9YhS13iNipGd5D7ccgrR9PO8UT/bX9tgiXOAB+e9Ze4lGCWMeGGsVF0X0ZhiRsfcQiph3vgsMbNtNQVx2Qt+BMlEhBGvJDCwMetgbGlmLB+l7sxNDHtCMo1NdkoGwUX84T5Rr6gQ98R2uWky1+hocNEI0rJUgEBkg0pwGMQeeMX9an9Dhur22amWU6FkJ1ERNLslnp3Me7Mi2BF2aXuOowPPfVWVWIVDHEw8DhlKgmjex0GCNyDS/awmZAKRra4sBw3+0gEPvyfxAoQmr9sFRNj0c1WWdVh1cOmB1yjDMzbrg/58ZDJbuu66grcVE/6DpnBqKCUVULwhE9h774Mu4DypotsYtnu6vJ3M7SyavOnKwv1SyY9AEV/gsA+Cb+pMbQyi1089Do5HfBqeQS2M5THTVPZi3moD6ulk5KzWHjweZStsnECW8SVhz1BfjZ4PYE2jBhHsqJn5nmFlrKPbw9OQi09YOTd+8GverZt1aVxG2cuPQ/g30SyPhuw76r6M8Vo7uMhpp46uAUNQPksxJYVO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(136003)(376002)(366004)(186009)(451199024)(1800799009)(36756003)(107886003)(83380400001)(4326008)(44832011)(450100002)(41300700001)(86362001)(5660300002)(8936002)(8676002)(1076003)(26005)(6506007)(6666004)(6486002)(2616005)(6512007)(478600001)(38100700002)(66946007)(66556008)(66476007)(82960400001)(6916009)(316002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vxLKMDoaMvNOArhA2Ol6nZ2j6OoDdWI64M/Z5ybuQac8m4IOIDFHLRrggJM+?=
 =?us-ascii?Q?bj+UUVH2GPMykL0U+YRePVB8XvBgo7VTM3hGqVQNH+U5EVgUaVJ7MYPerjnO?=
 =?us-ascii?Q?bLqx2gTU2otEIHlLzZOMd7+foxrMgZ3NgMC1aAQvO4nB38hbIJsXxhyUdJ8p?=
 =?us-ascii?Q?6NWuuRJr09315EQ0FYk/JRWwseLB/XpGc/gTr1QOw6STEeK8lxz2zZGdwM1O?=
 =?us-ascii?Q?fURjkBydXW0rE+beey5ZgxK2XEkrwuLm5qx7tD10IIEM3TZTadGspNu7Mnxq?=
 =?us-ascii?Q?eAcGzAXBYE1gREtCtp9nf/yzn8eSDVSHgALUBhQjXIViYJTSfYlRoqyRWT4c?=
 =?us-ascii?Q?HkA0LAJceYhPccSQq9piiTXpLlu0UKfCBEVyytx6oTcY8U4u3RSufgk4DO77?=
 =?us-ascii?Q?+DLURtLBGRBY3RdZPXuPlgvpX4XoaYM8uqulXaEBOZ+pfxqw4a6rTIzWO9Bz?=
 =?us-ascii?Q?wZp8lF3YGHq4JRwFLsBTI5zceImj/d187sTGAKJhwYMMl4YYkJXIfgN+L7N9?=
 =?us-ascii?Q?3fIK7ebMTvuDxHLtNEbWXNZSBY/XHIWXwCEP5XwUrbnR3iPSY94Qi7z7uIKs?=
 =?us-ascii?Q?i1dAOK8zAgDtt0rOw0ClTIK1P6VIK1NOfKskHEDXB6QOtyPzMw60n5pNLnBY?=
 =?us-ascii?Q?WVYxnQIDoPQ0ZMstxaYPGvLdV1ZzhRQPDnv7JRx37LiNTnM7F0sz2mYtomY1?=
 =?us-ascii?Q?OZBFHb6Oig/BvibjLgQlEfIOubKNGuCuaGNkdEGFWadukDv+bkW+u5V0BwHV?=
 =?us-ascii?Q?6vW9T/7VkYAmKUQOEFE9nl06wEnGBH2EfW5KjTwJc5A0vfP0bwo7IFMmJpw1?=
 =?us-ascii?Q?+7Ui1HAtezQvK3cKQ0FqY1TrfRaMqKbLggr+j/I4wFPXZ9ZV8Yd/9jaNoTQt?=
 =?us-ascii?Q?Tec1l8NBa+t+WLaM4Rdh0zqHIE7ZUwBZF4liemUQT4OyaTrBZB2VlmQKP6rM?=
 =?us-ascii?Q?SeqozeqpZZq4NvUMOHBUQrjXO9Jp9D8NrzwOyPMJ2ikiItThwXXmye3H63A+?=
 =?us-ascii?Q?jlXgZFtaxIgvWIpaw7VMvfL4huDD9yp00Hh9143EpvyqrsxrbPP3gfU0foxz?=
 =?us-ascii?Q?cCb6kXL+isYBVKgnWScl/YbuXG6J0+lRUf3tVU0nhWxoU0xFrZ8xHcW5+mRC?=
 =?us-ascii?Q?aVACulUNGLPaQj5KaMUkQmyx9Qjvk9dy6a0/GA7J0qDb9UyxQxpyaM6t8y1x?=
 =?us-ascii?Q?Nb9k6Hk8T7Nj8P491hheUOVb+M2GqCOSvpQ5FvbNONLcMz54jcT7Ocmoi5up?=
 =?us-ascii?Q?cifgj0t/8uvDgUD3jV1h+APVBgJe+hCSa6OZBejVIRg48wrawEKIZ39CV6Qv?=
 =?us-ascii?Q?Kaxq4t44O6HLPVZLXSa1ZzI6/Z+5l20UzZVDfzd6qBtE8n4aBY9MekXm4bNI?=
 =?us-ascii?Q?M16vi2ulojZ06sK3J23fQXz4L49/a6aR4t7Fi1YmD7IOYoT9QLIG1eAU/N4m?=
 =?us-ascii?Q?fKSBkcrN0uT1kxKV6LnsTHE3Utuz9SBhIWQ03T1ZLOV1VVgXfjhVTyD8YaJw?=
 =?us-ascii?Q?A94issGZNe58Jqn/VCLVE+zKB5w2DmRT+zOzsl31crjM1exv7po+nu5iki5M?=
 =?us-ascii?Q?yITHZc3hUBQQOC+/5ZhLNZl5iH5MtdOVgJAt5R7hIbyuogf/r18bUS/LYdqY?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b970c7-1612-421a-3466-08dba9a2b299
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 21:47:25.1178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffycITzLmiMGzp/EPPDOcGZ8+kWm3CiYfZbWzbgpcHk7MnwYHZfi0WeGyeDJMCuVaqfoJsvTPEeYixmF4yQuXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4714
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t] drm-uapi/xe_drm: Remove max_page_size and
 align with latest uapi.
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Align with commit ("drm/xe/uapi: Remove useless max_page_size")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h | 27 ++++++++++++---------------
 tests/xe/xe_query.c       |  9 ++++-----
 2 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index d1d49cd71..c78abc6ae 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -174,10 +174,6 @@ struct drm_xe_query_mem_region {
 	 * kernel.
 	 */
 	__u32 min_page_size;
-	/**
-	 * @max_page_size: Max page-size in bytes for this region.
-	 */
-	__u32 max_page_size;
 	/**
 	 * @total_size: The usable size in bytes for this region.
 	 */
@@ -256,7 +252,7 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define XE_QUERY_CONFIG_FLAGS			1
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
-#define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
+#define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
@@ -449,7 +445,6 @@ struct drm_xe_gem_create {
 	 * If a VM is specified, this BO must:
 	 *
 	 *  1. Only ever be bound to that VM.
-	 *
 	 *  2. Cannot be exported as a PRIME fd.
 	 */
 	__u32 vm_id;
@@ -489,7 +484,7 @@ struct drm_xe_gem_mmap_offset {
  * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
  */
 struct drm_xe_vm_bind_op_error_capture {
-	/** @error: errno that occured */
+	/** @error: errno that occurred */
 	__s32 error;
 
 	/** @op: operation that encounter an error */
@@ -609,7 +604,7 @@ struct drm_xe_vm_bind_op {
 	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
 	 * Once the user sees the error (via a ufence +
 	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
-	 * via non-async unbinds, and then restart all queue'd async binds op via
+	 * via non-async unbinds, and then restart all queued async binds op via
 	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
 	 * VM.
 	 *
@@ -620,7 +615,7 @@ struct drm_xe_vm_bind_op {
 #define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
-	 * than differing the MAP to the page fault handler.
+	 * than deferring the MAP to the page fault handler.
 	 */
 #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
 	/*
@@ -727,7 +722,7 @@ struct drm_xe_exec_queue_set_property {
 #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
 #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
 #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
-	/** @property: property to set */
+	/** @property: property to be set */
 	__u32 property;
 
 	/** @value: property value */
@@ -796,7 +791,7 @@ struct drm_xe_exec_queue_get_property {
 	__u32 exec_queue_id;
 
 #define XE_EXEC_QUEUE_GET_PROPERTY_BAN			0
-	/** @property: property to get */
+	/** @property: property to be gotten */
 	__u32 property;
 
 	/** @value: property value */
@@ -907,7 +902,7 @@ struct drm_xe_mmio {
 /**
  * struct drm_xe_wait_user_fence - wait user fence
  *
- * Wait on user fence, XE will wakeup on every HW engine interrupt in the
+ * Wait on user fence, XE will wake-up on every HW engine interrupt in the
  * instances list and check if user fence is complete::
  *
  *	(*addr & MASK) OP (VALUE & MASK)
@@ -1039,9 +1034,11 @@ struct drm_xe_vm_madvise {
 	 */
 #define DRM_XE_VM_MADVISE_PRIORITY		5
 #define		DRM_XE_VMA_PRIORITY_LOW		0
-#define		DRM_XE_VMA_PRIORITY_NORMAL	1	/* Default */
-#define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
-	/* Pin the VMA in memory, must be elevated user */
+		/* Default */
+#define		DRM_XE_VMA_PRIORITY_NORMAL	1
+		/* Must be user with elevated privileges */
+#define		DRM_XE_VMA_PRIORITY_HIGH	2
+	/* Pin the VMA in memory, must be user with elevated privileges */
 #define DRM_XE_VM_MADVISE_PIN			6
 	/** @property: property to set */
 	__u32 property;
diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index a4e40afdd..afdfe282b 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -227,9 +227,8 @@ test_query_mem_usage(int fd)
 			mem_usage->regions[i].used,
 			mem_usage->regions[i].total_size
 		);
-		igt_info("min_page_size=0x%x, max_page_size=0x%x\n",
-		       mem_usage->regions[i].min_page_size,
-		       mem_usage->regions[i].max_page_size);
+		igt_info("min_page_size=0x%x\n",
+			 mem_usage->regions[i].min_page_size);
 
 		igt_info("visible size=%lluMiB\n",
 			 mem_usage->regions[i].cpu_visible_size >> 20);
@@ -371,8 +370,8 @@ test_query_config(int fd)
 	igt_info("  XE_QUERY_CONFIG_FLAGS_HAS_VRAM\t%s\n",
 		config->info[XE_QUERY_CONFIG_FLAGS] &
 		XE_QUERY_CONFIG_FLAGS_HAS_VRAM ? "ON":"OFF");
-	igt_info("XE_QUERY_CONFIG_MIN_ALIGNEMENT\t\t%#llx\n",
-		config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT]);
+	igt_info("XE_QUERY_CONFIG_MIN_ALIGNMENT\t\t%#llx\n",
+		config->info[XE_QUERY_CONFIG_MIN_ALIGNMENT]);
 	igt_info("XE_QUERY_CONFIG_VA_BITS\t\t\t%llu\n",
 		config->info[XE_QUERY_CONFIG_VA_BITS]);
 	igt_info("XE_QUERY_CONFIG_GT_COUNT\t\t%llu\n",
-- 
2.41.0

