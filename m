Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041EAEC875B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 21:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C433E10E3D7;
	Thu,  7 Sep 2023 21:44:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53BD10E3D7;
 Thu,  7 Sep 2023 21:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694123049; x=1725659049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EwrlimL8j9LjKcCRm0zBcZPjRArTxRluPzbIIDKEwtQ=;
 b=bbCd4f8WsBZ/QyIeNEHnHnxN3nqtG9dbweQ8rA9+WFCDrVDdaRQd9pvq
 8O2bZf2P6z7J6tp6bJQa6tPe38XGtX1Kx3ah2VQfI06qeFkDS3N2Bi5J6
 9gvrT+oBsRhufV4tbGdW/ml+KLJwItlTK88M3ePbiLggEcv71uKvonaUV
 DxxnYBDo3pUkm+0+uMBLAW28Nr5kL7thl+kajlQcKJKc1VKxwYFdcdy/A
 nwcaRVx1avINUMxqTxd/POP5yIWpJv9pAfXsqHnLVzrXcId6e2607mK0T
 YmgHd4+ZYJvIkudecb1HSR8RY9Zs7r8As5zLQxUCk9z98bD/XzyroGyE7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="380220664"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="380220664"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 14:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="807698100"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="807698100"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2023 14:44:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 14:44:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 7 Sep 2023 14:44:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 7 Sep 2023 14:44:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gH6gw/w7aADuo5MrljsX8TGbbOYDQq7lMTa6ZtJIO2t+ak0VHTfLwqivfiqNfee9X8p6JKii1453B5H3FEq9lH+v+ANSM06+MwYPY/1fWv6euluOeLVDF625CE0yaDLZJBGnCA/wbLcZdl/d06qpPm1D6+RHJ+LOkG3yd8R9UjaiMjzqsS1Dqpg/XkTjvOtjU9k9kLuQxdtsemRkpUgN/vJStWbDP79cv+HfZCbxsVMvF2MLYzn8J77lDteSESKiEEHqmW+bhGJ3vcxh95C7yRKNQ0rkjWp8Fk2H7ipJtU6EYxDHoE7lwYDQ5iNBGgLJYy4uh2waI6vDCcMoYvbgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQWg8ReckOv7A6iRhJVy5QKcMzbigOT0IKUMrs9ePxY=;
 b=ZgBwMUt1eBOPl3a5fCsEX7el4YbHwSIReonBuEJySu9Bw6Zoiz2kQLBVyelli3A4vAtFUpVCUgeVGPq7qA4p7EO8FGG4DdrV3ber1bSGxwQudh+WxOp6TZ1wZ0lEl9fQ7qdngj+j/3yk0y5upgHmXG4CDo3yWzA68DFYzbJhG5lJ4jTMpOPOvPPofT1sjxfJfrr4NcGltv4SGp0TxSTiWUt7RdQWlQjekU2kQVTGHXTW9LsLITOwDrCzbzBSvgX5R+5/+xtvVBTfPqa0AzGFFp1qZ4V5U3NSsn37Cef6bEyykUJxAuSZvO2+gYjBUHRbdJ4YRXceUSgkg40hefRliA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7659.namprd11.prod.outlook.com (2603:10b6:510:28e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 21:44:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 21:44:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 7 Sep 2023 17:43:58 -0400
Message-ID: <20230907214358.399918-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901112158.nnctj5rt2yiimibx@kamilkon-desk.igk.intel.com>
References: <20230901112158.nnctj5rt2yiimibx@kamilkon-desk.igk.intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0376.namprd04.prod.outlook.com
 (2603:10b6:303:81::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a50cd23-a8d2-4bed-f052-08dbafeb8f40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +UZP9rrTt9oTFvaZEtq7mes50kv6uqS/TVXjRNlH0tGFejTUzRZ16w5JlBrtpTHGC3ZiqoP6yRCdh+YM5vBwehu1iJXP/Yw4KSKjcyF3109EyPVoHPU951ZN5LWgbTpCHl9sowCfnECAjKtspSLRNSgkITn3ACP4hcQKUluwiPtCHKG+HcN3MpmM7tlpYIKKKrirthd2Ms+5dbLYgeGPglh/Sht1mvfgeDUoLo/O4CEeyx2HK9aawH/oBBPOu8KKPzNKuUtIJoD78X+vGt5vcbGRfYim70jkt0ueb9N4HVkhRg2l00+07dN0hmpV1EEEI9v8YjQMf+q/nH+Evg8bFRcpPuAzXJqFRjgfTB7GSnCvCJZBny3jt+Huu0iin2TRmYI4PAnB5uy5+KdpxLFRtYYYO/xnOH4LCyQPjdSm9ZhAF/MqxqCYIyr4mSiP40nd/jmNOTntBKoS1FgWqkLZY6EqgbFrFaAdcdwu982V9j/uLAP7vTqxCNGsC339GnIw/oYEqfeOpo2SQ3qEcY9j60b/8gvX5ZSZL6NRYEKIJ/hPU+ageV0gRu8flrIhhUy4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(1800799009)(186009)(451199024)(6506007)(6486002)(6666004)(6512007)(2906002)(2616005)(83380400001)(26005)(478600001)(316002)(66476007)(6916009)(66556008)(41300700001)(66946007)(8936002)(44832011)(54906003)(4326008)(8676002)(36756003)(1076003)(86362001)(82960400001)(38100700002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l0AIN7PkPOdAjZUegtl5P+2j7leAwQWMcA8FeRvV2p+ajGbQ6eEW/gVKnjLD?=
 =?us-ascii?Q?qrUb8r6m1I76xXSaI87n25J0RUlxQMnAxq8sHoj0BdSAkOt/uCU6Ru+6vMJC?=
 =?us-ascii?Q?UcC/lkNb5hUkyJ9om10CXG1XdVliSfmKbU/xCzj2yWLXeUGed3oVW0kRAgQb?=
 =?us-ascii?Q?cXo9Ns7Hyu/XCxJMWgOAjFy76jdPwyQ8naXkohHeoseRUbVKGsVqJI2SxbPN?=
 =?us-ascii?Q?A+D12i8IVlTbPwZ50CbNpeQ+7kIw98ue3dk9S+41jMbnKs/uMT/4tAzuzz3R?=
 =?us-ascii?Q?llDWOoqa01AFncjLmJi2f39h+Yg6DAOAX6kmPRBG89ggaxKd7d/V1M0k1MrX?=
 =?us-ascii?Q?GlI21flky5Sn3GK9upWp++Pb7QPoKpdBYg6m1c4dZLYF7IkzbHPUxnWYkl78?=
 =?us-ascii?Q?qEHb53XoItL6neL7bTydycbll1/egQn5wEX1aiRuQyN0tJBFC6VJ5M5fkYX/?=
 =?us-ascii?Q?zs1Q0jHV5Y4yB+rOx2pBfljFn6l1MD2o44ISRhuyNtUKfWGpQN0/HwiatOq5?=
 =?us-ascii?Q?GNWv1y5Htqg7Lwhn5lHnWDL+4W6GpXKXbkuKS+yTHaF0jXQN1pYLofduirFz?=
 =?us-ascii?Q?+1ndmshtc50HxAyPuGplw68MR4Z4BrtZuCAShs9hsAUyTHwPEvNzTJmo27Ko?=
 =?us-ascii?Q?bmvR8Q/54iuBDdn3OAfxP9w1xqOr0h6RmOmZsjvlHYOrhHkpiY3iUvny2OAt?=
 =?us-ascii?Q?dY9gI7Mz0lZEeqHrGl/B0jSUVaNgOuhU4mey+a9DcH0gJvkzS76mCJ5hG7SN?=
 =?us-ascii?Q?1uL8NK7HDQ81S5WAcK0x2ZIQw3ilbS2kAs+8FFQQfkYX4O29oYa5K2c/ZMMb?=
 =?us-ascii?Q?DtUwk3XQYswXX7bZkz/UOxwguyX5yKXa5TvkLOvN0vsVY3iuoQ6DBdCNXdDo?=
 =?us-ascii?Q?zUZNVG/skVJjf5hZ8Nzgmw1DBRCR1eH2PFAAN1fbYFK1uSdTCJscprBcwTet?=
 =?us-ascii?Q?MJEm5Wlgid1vf0eu0fy435Yjz5HOTWhuiFYmwZJ1SUKXNu8ZpYrT8wmIvLwN?=
 =?us-ascii?Q?EJMKY2fs3h3T5HZ2SnwBi8JqT98Th/BRKla4aDpYL4glKwJmkiI6dFBUFP3o?=
 =?us-ascii?Q?idmFIUdQLXIQzKAoftu/oiP0v9s9igaBlEdz+/Ul8lAOuK/DiC3YN5kbgkcL?=
 =?us-ascii?Q?YOxdqnUFi1DBGYTNTPczGtEBvwLmeo6HBwUlXOj0o1Ue53qj7SQYPfa1o5yR?=
 =?us-ascii?Q?nZWAu7qzLjxUII9hQa57PTMRUqti4Uxf7FeB2futlK2Srd+cckGewaIahoTs?=
 =?us-ascii?Q?Z9nRfIJ78wtyWY4WKVLy2tIQLYDBBIIavvG3NgXufIYKSTJ6DqYunauxORSC?=
 =?us-ascii?Q?9xYdx7ymFu2jesRJszyX5HIyupgPCdlT/bK+s0V/SDZk27RI0+djk5RS+V1p?=
 =?us-ascii?Q?Mk6WIKydUJ+Oku2SdKZdeYGSUHX53mFXHa2pEg775F+NfhHrDwPoL41cYQEq?=
 =?us-ascii?Q?JbMtTVXZ7JBxgfeQZKsB2eeKO8J11amaQ+nGZCqCWGlzs0y43HhfcrxF9fXj?=
 =?us-ascii?Q?aiIIekKJqoulZSkBDfF3uIoQ3yZGaZoYsEKt29+q1RwnSPvfG3Oww1yTa5dL?=
 =?us-ascii?Q?47NJdIG0XXr0NlJgZkQ2C93nNwCXM/RfNbWidtJglNoKbkAbmqlCSDYa2P5E?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a50cd23-a8d2-4bed-f052-08dbafeb8f40
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 21:44:06.1107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZyFPg1DLxDg5O+h+cq99VaGAx/yZ6i9lg0mwQnDN+j0qncswmtHLAoxxeNFdoCqqWSqkKiIzRPsKGTCEYqU+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7659
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
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Align with commit ("drm/xe/uapi: Remove useless max_page_size")

v2: Rebase.

Cc: Francois Dugast <francois.dugast@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h | 23 ++++++++++-------------
 tests/intel/xe_query.c    |  9 ++++-----
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index d1d49cd71..804c02270 100644
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
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 8ec849130..c540e3351 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -228,9 +228,8 @@ test_query_mem_usage(int fd)
 			mem_usage->regions[i].used,
 			mem_usage->regions[i].total_size
 		);
-		igt_info("min_page_size=0x%x, max_page_size=0x%x\n",
-		       mem_usage->regions[i].min_page_size,
-		       mem_usage->regions[i].max_page_size);
+		igt_info("min_page_size=0x%x\n",
+		       mem_usage->regions[i].min_page_size);
 
 		igt_info("visible size=%lluMiB\n",
 			 mem_usage->regions[i].cpu_visible_size >> 20);
@@ -375,8 +374,8 @@ test_query_config(int fd)
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

