Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9207CD5BCA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A70310E288;
	Tue, 19 Sep 2023 14:25:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22B210E3D7;
 Tue, 19 Sep 2023 14:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133509; x=1726669509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+41jdCMj6+WcaxBbShEAaQFp2ECvG8K4s0WMNW3sEjg=;
 b=XuHs21EMjor0mjNDZthnhNfBJSfXOJjAI+h04Hom6MOm1wWwOEWlW1V0
 vZSRpeaqXhJZzyHS2hs3+LtAhC6aVFd6AkNQXWj896N+C9RmwV3MDKhiv
 adGG2z/ABKfxuB5qZr2luMluRnxp/mFdKP06U2h8MvCnTE0h/rhy+4A8G
 Rb5g6YiSDhBuAY6vPzIftcaOcVOLgsww9LgYuY3vGT3SEI7g3GkOR9O83
 /3eqr0sU8EUReinHrphMORKfiQ+fjzfO9AxCK2C8n9A0iNB8JyXCxggCU
 C2ijhDT4NnpWMzmxRT+lBH9lS+W99SbKwl39CdLJZ9NEne7YsuLi20KLI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278426"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278426"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:25:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="775573857"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="775573857"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:25:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:25:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7Omzn3hxSFeLVyBXsXCFbxqsJo2nbw4aGMCDMK82/agtmvWvNPgUjktex1GIFDpW+WhZTaL9nB9PPYO3rlw+w5uHyxlpcQbLpn3j+0dcP1s2d3JpxIOFi9vzFTNBvXfNTWhzquNeBlEDg0mm/jcKyjnrWaP3Rszun8OHYINlTsQoxpe1GWj8gcF6SlN8tWGWGv5w/sNiZp2TFq7kiQfXtmXl+wZ8WAd2icbYmHESPX8kUitrmzevkQapYBIYvJivm/SIy1xOLP1pf53Tg+XJqhr9/bUr5bNU1p2Kl47IsCukRc8m7633vnzhZgVseWiIm4hjvzG4dVjQ1u32YmcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aevKsj+msu85qaAWp0A2zL6D4a9rxAVsryNEGSh9HGo=;
 b=E1k1JGLJfx5+yVRRI6AD8JwQ3b6pvTNu5ic8bmvr3ZAd4RqXfjO+EtG2bN9zox4UhrKePU17fOyhW1jzrdJRpG5nRvtDzbPC+KX1Yg6xb4yj+2PiKVF58r+sNbPsWyEAiWlf/ZXyPpc8tlXYOuW6l4hIX9xuaXSiXpJnI22XF7qpr1BC1v9lxsqshWclNJRNQfDnTQm2V5eULRYVtguUVtjkh4k4b+fJ6MPMoC6CTCrb+SVBY6rhgRjoFvRXKMLFq44/itfK53gCKsAxG75eOn738A9Xxb7psxmPvlN8yk/OhbmIDKTDNxqSOFHc9MIY/HPSXsUUARAAp3OoAVaYAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 14:24:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:24:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:46 -0400
Message-ID: <20230919142000.91363-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 396c8f8b-ef92-4a26-daea-08dbb91c3106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ljncTZ78nhIx1AGX0qs4yVkLA84CIkAb+PIqSpk1Z7kXTlOT/5k+ypegdyZLG982m3czQhBQK4AYtFnBD8QHlzwY6d6V5q9RwAbXgJvDbzhX0q7ov8WoTrtOFxyajvte8ZSbYxbaSY/1PnrCko/h8bNOMazvJ7EwhtOQbokx+SY3XkHK43zY54Qh1F1rPHF1mcWOAX7bSQS0y13AyQUtk6P50EVRQnG4dVG72FVGO83RSp2afDN7Za70tVfvEAecyehuqjVlBtxnARgYseaqa9PnelDM54ptu068sgR/J4A9ecUMablV3+YApb8p+G6/5Bpbn/8rcuJEQ9oKsMhc/7kCDd2OYlAwR/AH/EWUUPulc9Z1n3ZArJSte0TPg2xyshsI7b1rCBAZf2EQ28YDoXBJtj7Wc5NnOGJPo4fTDrHOa/k9MR5jpcjwZ5ZuLZf5nzQqifklDCBp4zxWLUBJ1kOMZzVEIJbSNK/Jq15zROLWGdwy1e5L/ZqB1noXnLa5c5241euJPS88AD3E2mH9rXfQwMBOx1D23xWumvPskv6D9GjJgF0NUIKQY8TrDtOM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199024)(186009)(1800799009)(30864003)(478600001)(41300700001)(450100002)(83380400001)(44832011)(5660300002)(6666004)(2906002)(316002)(66946007)(54906003)(66556008)(66476007)(8676002)(4326008)(8936002)(6506007)(6486002)(6512007)(1076003)(26005)(2616005)(107886003)(36756003)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IA84H2fLcuHzSZE3TPvUxPK8v5tPxoLvOcQ+vcizqKkgU20EbD4LhfbR7Nc+?=
 =?us-ascii?Q?pG3Ze8guZlRPjme4IPtyyBzh4/AGJDCSlJ3WNQQNlamporx/X967d2DdPq6k?=
 =?us-ascii?Q?cifRgU1WKhM60uROJ7+D8TZeMgsh7dgoRHCfxoocuZoP6amAihw2B4+itI8t?=
 =?us-ascii?Q?E+pdRXugQMhT2F8KKainDHyJQiJGTBtXOJtDuqmM6YDNkhsN4RWnikXGFDTf?=
 =?us-ascii?Q?PYYwC9rl/73xZ5V7l0QA8vPYBPGprc75+QsWuQxRV5CUYTGHZ3n4pYTrdg05?=
 =?us-ascii?Q?B4pWShvVsxfWCCbkpxnnVnnmTwZdkTm1u5wcJZLEaxpFXY3wsnFLBN/8KJ54?=
 =?us-ascii?Q?lTG9jg88Vr+845xACxinZ45ajeWLPse4DZflAMkq7yepmTTdoz379xcbx7+x?=
 =?us-ascii?Q?B2i4hgKo5MxMzHbnv2HB1lkq1GMa6S9Eyri2G6GQJUm8O5EHMSHXZpJAOZ+D?=
 =?us-ascii?Q?bsNgMZ4+BVUBuPStTa39cQrX4rAy7dy7PNmikV5p5js0fGh+RNPLxiTL7vMl?=
 =?us-ascii?Q?Ji08EgyJ/4X5UkQ78lPNUGAPCLt84N+j7ajMs7i1ErZnmz3s+GORapAJTMnn?=
 =?us-ascii?Q?ji2u9hkuaCuYp50mEbp1F7ZvGRQ79B8MLo48spf4GL6e/UxOPQA0FkVDs2+7?=
 =?us-ascii?Q?s9WfbT80oXZSX4q++tERsMuGDum07dgcykWbmzVhdnq+Uo02fazyjUdKkcGF?=
 =?us-ascii?Q?rku+VpdWGEMwhO4EqXi4nM2qoAto7KJoU39jcQnJir9Mh1R8WsiugdvuNr2w?=
 =?us-ascii?Q?xZZFHOeCbP56CX96O8ZWQa8Kaji3b8i4dZREinu4MlVWEZ82eMXWyNyJ8itT?=
 =?us-ascii?Q?I6gieHALH/E3GO1EGD7F0SAdoTva9uTfiIeSXHB2lgFHegL1KgNMfCHhTG81?=
 =?us-ascii?Q?q/h96qm7YL1CpCtCCUSGsO4MP+LkzRdrNna7I73SF5bxm1h09q5YsyKfffhY?=
 =?us-ascii?Q?vM204elvEvVVRP8JLUEO6WMjv5zwYPkBOxodiJ5TPB7v+hEvJ1qG6vpz7azA?=
 =?us-ascii?Q?KDQ9JtDDmwg0WrbyV/mqSmIQ7PpIV2u52a/Nw8DCINEYOJjVeWD8LPQWOuAe?=
 =?us-ascii?Q?mI38B3dBQcqYsdfl4PQAStROc53ickpY7zt3Jx4xkGmWsiNVf2kkb+6ElNAi?=
 =?us-ascii?Q?3D0BkRH9r0PH+wiZt7U+wRtikT0V847G9dCqstKUX0bhaM0aY85vAEL/W52c?=
 =?us-ascii?Q?VD+NjwH/LXt/vpQ/t0teAIadT+U2OUjYtnMqjphveDQYWBBkp0jLLf1ylPWN?=
 =?us-ascii?Q?7TPno1Tv6SNLPv6C2mYfgnDxE7JcWgPQ7vSbgb0cjGzC1M4zmW7YIeR580oV?=
 =?us-ascii?Q?kfvnyJrcMUozkdNd+YwJay8ZKnoULtVrfdIq0d5FotJQPrccCwLcBYtls6OM?=
 =?us-ascii?Q?RjVA0M9vOSpx1KjJ40JnU8JdGQlOTvMgU0E++DPPWeOmxu+3njaq5mzXXCLM?=
 =?us-ascii?Q?uyXH50DGRtC0FIFXV31czREbhBCKmVZo93qSGZe+FlCdAKjH2CkSggcklD0m?=
 =?us-ascii?Q?ILtKi9hzstWHipR6eBaV0+JpqeuT2vhJglx/ppnE9fbC6X3Nx/ekpmbBvzVK?=
 =?us-ascii?Q?y7JS2LRI7/DRMrzFuHXnzGZ0VfRy19kUOw0xiGSiOc14sN6wYkW7Lgiy8UrG?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 396c8f8b-ef92-4a26-daea-08dbb91c3106
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:24:53.7581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOBmTCwf5wKOWj8X5+u0Hh8/+R4wFhjjzI5wlYme6i4g9BimrBovpcOG1/0KjOnS5uQCfo7jcmfmQ06vsZwYPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 03/16] drm-uapi/xe_drm: Separate VM_BIND's
 operation and flag, align with latest uapi
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Francois Dugast <francois.dugast@intel.com>

Align with commit ("drm/xe/uapi: Separate VM_BIND's operation and flag")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h     | 14 ++++++++------
 lib/intel_batchbuffer.c       | 11 +++++++----
 lib/xe/xe_ioctl.c             | 31 ++++++++++++++++---------------
 lib/xe/xe_ioctl.h             |  6 +++---
 lib/xe/xe_util.c              |  9 ++++++---
 tests/intel/xe_exec_basic.c   |  2 +-
 tests/intel/xe_exec_threads.c |  2 +-
 tests/intel/xe_vm.c           | 16 +++++++++-------
 8 files changed, 51 insertions(+), 40 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index f96c84a98..078edd9f8 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -663,8 +663,10 @@ struct drm_xe_vm_bind_op {
 #define XE_VM_BIND_OP_RESTART		0x3
 #define XE_VM_BIND_OP_UNMAP_ALL		0x4
 #define XE_VM_BIND_OP_PREFETCH		0x5
+	/** @op: Bind operation to perform */
+	__u32 op;
 
-#define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
+#define XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
 	/*
 	 * A bind ops completions are always async, hence the support for out
 	 * sync. This flag indicates the allocation of the memory for new page
@@ -689,12 +691,12 @@ struct drm_xe_vm_bind_op {
 	 * configured in the VM and must be set if the VM is configured with
 	 * DRM_XE_VM_CREATE_ASYNC_BIND_OPS and not in an error state.
 	 */
-#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
+#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 1)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
 	 * than deferring the MAP to the page fault handler.
 	 */
-#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
+#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
 	/*
 	 * When the NULL flag is set, the page tables are setup with a special
 	 * bit which indicates writes are dropped and all reads return zero.  In
@@ -702,9 +704,9 @@ struct drm_xe_vm_bind_op {
 	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
 	 * intended to implement VK sparse bindings.
 	 */
-#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
-	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
-	__u32 op;
+#define XE_VM_BIND_FLAG_NULL		(0x1 << 3)
+	/** @flags: Bind flags */
+	__u32 flags;
 
 	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
 	__u32 region;
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index e7b1b755f..6e668d28c 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1281,7 +1281,8 @@ void intel_bb_destroy(struct intel_bb *ibb)
 }
 
 static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
-						   uint32_t op, uint32_t region)
+						   uint32_t op, uint32_t flags,
+						   uint32_t region)
 {
 	struct drm_i915_gem_exec_object2 **objects = ibb->objects;
 	struct drm_xe_vm_bind_op *bind_ops, *ops;
@@ -1298,6 +1299,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 			ops->obj = objects[i]->handle;
 
 		ops->op = op;
+		ops->flags = flags;
 		ops->obj_offset = 0;
 		ops->addr = objects[i]->offset;
 		ops->range = objects[i]->rsvd1;
@@ -1323,9 +1325,10 @@ static void __unbind_xe_objects(struct intel_bb *ibb)
 
 	if (ibb->num_objects > 1) {
 		struct drm_xe_vm_bind_op *bind_ops;
-		uint32_t op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
+		uint32_t op = XE_VM_BIND_OP_UNMAP;
+		uint32_t flags = XE_VM_BIND_FLAG_ASYNC;
 
-		bind_ops = xe_alloc_bind_ops(ibb, op, 0);
+		bind_ops = xe_alloc_bind_ops(ibb, op, flags, 0);
 		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
 				 ibb->num_objects, syncs, 2);
 		free(bind_ops);
@@ -2354,7 +2357,7 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 
 	syncs[0].handle = syncobj_create(ibb->fd, 0);
 	if (ibb->num_objects > 1) {
-		bind_ops = xe_alloc_bind_ops(ibb, XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC, 0);
+		bind_ops = xe_alloc_bind_ops(ibb, XE_VM_BIND_OP_MAP, XE_VM_BIND_FLAG_ASYNC, 0);
 		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
 				 ibb->num_objects, syncs, 1);
 		free(bind_ops);
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 730dcfd16..48cd185de 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -67,7 +67,7 @@ void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
 			    uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, bo, 0, 0, 0,
-			    XE_VM_BIND_OP_UNMAP_ALL | XE_VM_BIND_FLAG_ASYNC,
+			    XE_VM_BIND_OP_UNMAP_ALL, XE_VM_BIND_FLAG_ASYNC,
 			    sync, num_syncs, 0, 0);
 }
 
@@ -91,8 +91,8 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
 
 int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
-		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
-		  uint64_t ext)
+		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
+		  uint32_t region, uint64_t ext)
 {
 	struct drm_xe_vm_bind bind = {
 		.extensions = ext,
@@ -103,6 +103,7 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		.bind.range = size,
 		.bind.addr = addr,
 		.bind.op = op,
+		.bind.flags = flags,
 		.bind.region = region,
 		.num_syncs = num_syncs,
 		.syncs = (uintptr_t)sync,
@@ -117,11 +118,11 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 
 void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 			  uint64_t offset, uint64_t addr, uint64_t size,
-			  uint32_t op, struct drm_xe_sync *sync,
+			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
 			  uint32_t num_syncs, uint32_t region, uint64_t ext)
 {
 	igt_assert_eq(__xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
-				   op, sync, num_syncs, region, ext), 0);
+				   op, flags, sync, num_syncs, region, ext), 0);
 }
 
 void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
@@ -129,7 +130,7 @@ void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 		struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size,
-			    XE_VM_BIND_OP_MAP, sync, num_syncs, 0, 0);
+			    XE_VM_BIND_OP_MAP, 0, sync, num_syncs, 0, 0);
 }
 
 void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
@@ -137,7 +138,7 @@ void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
 		  struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, 0, 0, offset, addr, size,
-			    XE_VM_BIND_OP_UNMAP, sync, num_syncs, 0, 0);
+			    XE_VM_BIND_OP_UNMAP, 0, sync, num_syncs, 0, 0);
 }
 
 void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue, uint64_t offset,
@@ -146,7 +147,7 @@ void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue, uint64_t off
 			  uint32_t region)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, 0, offset, addr, size,
-			    XE_VM_BIND_OP_PREFETCH | XE_VM_BIND_FLAG_ASYNC,
+			    XE_VM_BIND_OP_PREFETCH, XE_VM_BIND_FLAG_ASYNC,
 			    sync, num_syncs, region, 0);
 }
 
@@ -155,7 +156,7 @@ void xe_vm_bind_async(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		      struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, bo, offset, addr, size,
-			    XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC, sync,
+			    XE_VM_BIND_OP_MAP, XE_VM_BIND_FLAG_ASYNC, sync,
 			    num_syncs, 0, 0);
 }
 
@@ -165,7 +166,7 @@ void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t exec_queue, uint32_t b
 			    uint32_t flags)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, bo, offset, addr, size,
-			    XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC | flags,
+			    XE_VM_BIND_OP_MAP, XE_VM_BIND_FLAG_ASYNC | flags,
 			    sync, num_syncs, 0, 0);
 }
 
@@ -174,7 +175,7 @@ void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t exec_queue,
 			      struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, 0, userptr, addr, size,
-			    XE_VM_BIND_OP_MAP_USERPTR | XE_VM_BIND_FLAG_ASYNC,
+			    XE_VM_BIND_OP_MAP_USERPTR, XE_VM_BIND_FLAG_ASYNC,
 			    sync, num_syncs, 0, 0);
 }
 
@@ -184,7 +185,7 @@ void xe_vm_bind_userptr_async_flags(int fd, uint32_t vm, uint32_t exec_queue,
 				    uint32_t num_syncs, uint32_t flags)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, 0, userptr, addr, size,
-			    XE_VM_BIND_OP_MAP_USERPTR | XE_VM_BIND_FLAG_ASYNC |
+			    XE_VM_BIND_OP_MAP_USERPTR, XE_VM_BIND_FLAG_ASYNC |
 			    flags, sync, num_syncs, 0, 0);
 }
 
@@ -193,7 +194,7 @@ void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t exec_queue,
 			struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, 0, offset, addr, size,
-			    XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC, sync,
+			    XE_VM_BIND_OP_UNMAP, XE_VM_BIND_FLAG_ASYNC, sync,
 			    num_syncs, 0, 0);
 }
 
@@ -205,8 +206,8 @@ static void __xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 		.handle = syncobj_create(fd, 0),
 	};
 
-	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, &sync, 1, 0,
-			    0);
+	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, 0, &sync, 1,
+			    0, 0);
 
 	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
 	syncobj_destroy(fd, sync.handle);
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 6c281b3bf..f0e4109dc 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -19,11 +19,11 @@ uint32_t xe_cs_prefetch_size(int fd);
 uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
 int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
-		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
-		  uint64_t ext);
+		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
+		  uint32_t region, uint64_t ext);
 void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 			  uint64_t offset, uint64_t addr, uint64_t size,
-			  uint32_t op, struct drm_xe_sync *sync,
+			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
 			  uint32_t num_syncs, uint32_t region, uint64_t ext);
 void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 		uint64_t addr, uint64_t size,
diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 2f9ffe2f1..5fa4d4610 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -116,7 +116,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct igt_list_head *obj_lis
 {
 	struct drm_xe_vm_bind_op *bind_ops, *ops;
 	struct xe_object *obj;
-	uint32_t num_objects = 0, i = 0, op;
+	uint32_t num_objects = 0, i = 0, op, flags;
 
 	igt_list_for_each_entry(obj, obj_list, link)
 		num_objects++;
@@ -134,13 +134,16 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct igt_list_head *obj_lis
 		ops = &bind_ops[i];
 
 		if (obj->bind_op == XE_OBJECT_BIND) {
-			op = XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC;
+			op = XE_VM_BIND_OP_MAP;
+			flags = XE_VM_BIND_FLAG_ASYNC;
 			ops->obj = obj->handle;
 		} else {
-			op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
+			op = XE_VM_BIND_OP_UNMAP;
+			flags = XE_VM_BIND_FLAG_ASYNC;
 		}
 
 		ops->op = op;
+		ops->flags = flags;
 		ops->obj_offset = 0;
 		ops->addr = obj->offset;
 		ops->range = obj->size;
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index a4414e052..e29398aaa 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -170,7 +170,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		if (flags & SPARSE)
 			__xe_vm_bind_assert(fd, vm[i], bind_exec_queues[i],
 					    0, 0, sparse_addr[i], bo_size,
-					    XE_VM_BIND_OP_MAP |
+					    XE_VM_BIND_OP_MAP,
 					    XE_VM_BIND_FLAG_ASYNC |
 					    XE_VM_BIND_FLAG_NULL, sync,
 					    1, 0, 0);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 12e76874e..1f9af894f 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -609,7 +609,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			if (rebind_error_inject == i)
 				__xe_vm_bind_assert(fd, vm, bind_exec_queues[e],
 						    0, 0, addr, bo_size,
-						    XE_VM_BIND_OP_UNMAP |
+						    XE_VM_BIND_OP_UNMAP,
 						    XE_VM_BIND_FLAG_ASYNC |
 						    INJECT_ERROR, sync_all,
 						    n_exec_queues, 0, 0);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 4952ea786..f96305851 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -316,7 +316,7 @@ static void userptr_invalid(int fd)
 	vm = xe_vm_create(fd, 0, 0);
 	munmap(data, size);
 	ret = __xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
-			   size, XE_VM_BIND_OP_MAP_USERPTR, NULL, 0, 0, 0);
+			   size, XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0, 0);
 	igt_assert(ret == -EFAULT);
 
 	xe_vm_destroy(fd, vm);
@@ -437,7 +437,7 @@ static void vm_async_ops_err(int fd, bool destroy)
 		if (i == N_BINDS / 8)	/* Inject error on this bind */
 			__xe_vm_bind_assert(fd, vm, 0, bo, 0,
 					    addr + i * bo_size * 2,
-					    bo_size, XE_VM_BIND_OP_MAP |
+					    bo_size, XE_VM_BIND_OP_MAP,
 					    XE_VM_BIND_FLAG_ASYNC |
 					    INJECT_ERROR, &sync, 1, 0, 0);
 		else
@@ -451,7 +451,7 @@ static void vm_async_ops_err(int fd, bool destroy)
 		if (i == N_BINDS / 8)
 			__xe_vm_bind_assert(fd, vm, 0, 0, 0,
 					    addr + i * bo_size * 2,
-					    bo_size, XE_VM_BIND_OP_UNMAP |
+					    bo_size, XE_VM_BIND_OP_UNMAP,
 					    XE_VM_BIND_FLAG_ASYNC |
 					    INJECT_ERROR, &sync, 1, 0, 0);
 		else
@@ -465,7 +465,7 @@ static void vm_async_ops_err(int fd, bool destroy)
 		if (i == N_BINDS / 8)
 			__xe_vm_bind_assert(fd, vm, 0, bo, 0,
 					    addr + i * bo_size * 2,
-					    bo_size, XE_VM_BIND_OP_MAP |
+					    bo_size, XE_VM_BIND_OP_MAP,
 					    XE_VM_BIND_FLAG_ASYNC |
 					    INJECT_ERROR, &sync, 1, 0, 0);
 		else
@@ -479,7 +479,7 @@ static void vm_async_ops_err(int fd, bool destroy)
 		if (i == N_BINDS / 8)
 			__xe_vm_bind_assert(fd, vm, 0, 0, 0,
 					    addr + i * bo_size * 2,
-					    bo_size, XE_VM_BIND_OP_UNMAP |
+					    bo_size, XE_VM_BIND_OP_UNMAP,
 					    XE_VM_BIND_FLAG_ASYNC |
 					    INJECT_ERROR, &sync, 1, 0, 0);
 		else
@@ -928,7 +928,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 		bind_ops[i].range = bo_size;
 		bind_ops[i].addr = addr;
 		bind_ops[i].tile_mask = 0x1 << eci->gt_id;
-		bind_ops[i].op = XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC;
+		bind_ops[i].op = XE_VM_BIND_OP_MAP;
+		bind_ops[i].flags = XE_VM_BIND_FLAG_ASYNC;
 		bind_ops[i].region = 0;
 		bind_ops[i].reserved[0] = 0;
 		bind_ops[i].reserved[1] = 0;
@@ -972,7 +973,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 
 	for (i = 0; i < n_execs; ++i) {
 		bind_ops[i].obj = 0;
-		bind_ops[i].op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
+		bind_ops[i].op = XE_VM_BIND_OP_UNMAP;
+		bind_ops[i].flags = XE_VM_BIND_FLAG_ASYNC;
 	}
 
 	syncobj_reset(fd, &sync[0].handle, 1);
-- 
2.41.0

