Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44625CD5BCB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C81610E27A;
	Tue, 19 Sep 2023 14:25:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB09810E284
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133532; x=1726669532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QWLwVxPO6tHI0Ri/Tl7FhmSLqh9hJixwwvrVEE3/NT4=;
 b=CFu/JYqS1p3uHUdF9ndvtEGHm79t4CWN965AflRmEasqLKkQbIvqeR4L
 fWVpeTemGTqJrtez3M6tFWpgziVJSP+Nff1nUAFjVmjUqcJeSkDgzQSRv
 HwXIqxJjNguJE+3IkjC/H/4hC7VQ7xC1nDc5bRdMzreZIAi2v1hcmP83m
 pTDbqD3ZLHX5hs/UGMCdHUS6sMHpLfCCUxhFFSZyzbjA7lmaYadydMSIG
 LAukmnHQY8jzFWk7p3CKE/6drA+T1OnwujvmJC3IQPbSY9igTs1i7AWDU
 pVP2V58UJSNAwJHaxd//zwycCladMI4WSfefrur0Zqbs2XaBS8WtQJNu0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278536"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278536"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="695924293"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="695924293"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:25:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:25:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkTTz1k1l4A6NgDHhJSjjqayTTkdSuUDlzEVB4JaJx4MupY9/QSUzuwwxbgMlg1s4TYfpQEGu+syrUkZCzeqOOBMpVlf8udlhSvg84aVpVt18wkI2C9gV+KE5QAlfdPRvn44NW+5AC5Hm0z82CEf0criQrkODeK8YaiCkTQ+SsWE2ADZW0d5/cbiJiqTF8DGXBVHNI6BFp0Ug614OTWYttQGBIwkLBHk5EDE6dtU01ehj9z8F9nq6HYoYe372PMtwLjwDkYEOp6iWHi9IzvCIP2ybw9MoOTT0MtJbbq06A3iiAa+1EVQHo4y0guKX0V1IRhGpq/5TjM6jIBw7kKBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yh4/TPYNc/xayS6h3m5P4cR1tWAQzXuS21ZSZJ763aY=;
 b=j2AaKz4SUCymwxqcHQx3aC5MMhc+dZsFuOt18jGKaaws8fpcSgjHNJ/Zh3UXMhfDs0cFsT7Q/eYvTbjEAz+PpDI0HvuOf7By8RQtxQZtZt1SI8Yrm61Nn+hDaXuyEWbd0X6Fh3BOa2FVQOQkSShYwwrYrjstZn3k7f4cjhrv6kX8wHEztb5MmwOrHFwjqqcCRYcPC6pD1DoKa2bq7B6jQ5U0S34ARgJqFw1SJ5sZbUgP+gEvyijpcTkbyHQbFKW41VQh2zSN9gHOlCXdaDW3y/WNmaSimSeJBr1WtS0O8J4MeZZrqCUxUPQ0zxBOHAelZt0/UqtSUtGLBZK8ACclRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:25:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:25:23 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:24:51 -0400
Message-ID: <20230919142504.91652-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0036.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::49) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c024cd-dd1a-4475-0eb3-08dbb91c4309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LB4uokFFp6md6qetaonDI5kHLZppDxSO2WXl5O4pTHEHwUN7/SGamZdMIBYKJnwb5g7qCSQTSbEjKaRy7r58WMegUfOs7Sk05uppI7yvzaSu/yponldYPQ3D5QwBz0dODIvRJ2l9N6if05aqpEtW0mxawVvWYbPiVESYY93UTXXLcxXKEYw1QLIYzMXMezluseZW+F2NvnZta8Px9+cDgvwkXN4xp+4zqtIIMD/lvJjsZHBjgBf3LVy2JcTOcXoa6Rq5d0owWFFpWSlCYugodjYJVobzw5YigmknBWZBz/MtyjEWwOeJI6M+LBa2Z1DMAUaOi9brOsJgaxhAC3JXuDJqnIFcGHT0NZ1RrUxrFy29dspslfuOmQ7sMqLySEvfeccHlS1ZK4BFROvj0iqdQKMOcz+o+4FuSpLPW4T2yr+3O5HUpWZBCaXdV2LIhDuodJ/SyV6iGS1UsS2ugMGJOcYuBH9XV9P8XHek5E3TfmBw06lpoz5tqN1baC6JdjMdlLGuiF/brzH00Gc2LN8N6WFMv3vyQuOhg/mqZBP61i4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(36756003)(44832011)(5660300002)(83380400001)(86362001)(4326008)(8936002)(8676002)(41300700001)(6506007)(6486002)(6666004)(82960400001)(107886003)(26005)(1076003)(2616005)(6512007)(66946007)(478600001)(2906002)(966005)(38100700002)(6916009)(316002)(66476007)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/nY0zEaCUHePX9b0XZUOUFGWUdYBvshhXwnpNRrP0skl9v45Bd2FNGuS+ss3?=
 =?us-ascii?Q?/DUMTvCUdm0u8AuqkLt6iDOMDOjGB2yWhwbaxyGQSbmtBK4EsOSiiKiSdLkx?=
 =?us-ascii?Q?g8ihoYUhf8KXJXQEsFo5oJocisbT0OT1/CZYojBE9T669J1uJdNTnqxa46+d?=
 =?us-ascii?Q?6wLHZvUzzMjkz60VkZNcMUfr2LNPKusdTLfoGAJBntRYw0ToVXrp4kxZAPpE?=
 =?us-ascii?Q?p1to7UqmBRa9YtGoYPqFsXlCx52o28BdPbbvPTNiP/WmLFpgHoOaYOxr+b4U?=
 =?us-ascii?Q?pZrhkSIOCseo/N68jBzurd0BJTTKaI3Pef/gWwQEJXUvm4J9JrHrFDov3L+F?=
 =?us-ascii?Q?dw2D/dkXpM1cfT+Bo0YpE2hAoxAWk9BtEmpHQOeSLudKifA6QivZKNMf/NKI?=
 =?us-ascii?Q?REpm42/F+0Gp3cnhPh/a+RWL0ddjhtnULi4kj/L5vOKH/oQDyl0cfHKt9Spi?=
 =?us-ascii?Q?xnl2rR8C3X9GyMTcxOV/RfcKZGYEKkNYZd1QEPDvDYmtKx4KfRRDrna16aj/?=
 =?us-ascii?Q?fXN/aWGll3K81iV/GNkYpTeJZGBlBWVzgVhk1oZT1LaY6VNFlHfJyuhmK/mV?=
 =?us-ascii?Q?cOaMxHsgDhMKiOI380U8G5qQ52qXKGX1Hn16gH22DogyP77RShgxl4FjUrdx?=
 =?us-ascii?Q?PeG0Z+YnN1ra45M11ShGzD99oE8+5CEN8DhvyNGlmZfhNRw9fdWuIZTGQPW7?=
 =?us-ascii?Q?uDAJ8ukgga5zTOdKLMNE4h3FMFa3zGMdtBZj4+pDhKe1WHInvDG0Z0RbUJGp?=
 =?us-ascii?Q?L4Jlj/pS0Sc5KlQ8hsOTQWygNoCSXpm4xwGevysnxkAOkB03LQfvQ9AmVbLA?=
 =?us-ascii?Q?paDEclKYdpcR7fj6wfMfIAPrPAtBCVhD7QHxcSZDfvtPD3zBjXwWOJOkXhku?=
 =?us-ascii?Q?7/jBkx4wd+jh4+tFNh5KPn5+TcH+xpGVswWlvmBRJf5+dmWEq6raiILSHOrD?=
 =?us-ascii?Q?vvh9Q39PyXTDDjagxooWTg+jF9OsWaxUMSsHjo5Mw3a7d1fhTPXGDazFZdHr?=
 =?us-ascii?Q?Z5YMO+KIfSIsbeQRgdUIlII0fqbQOolCn0KNOmQYsHGPPJnOuxRzFPRZopdi?=
 =?us-ascii?Q?a2oLk4kQ7XI1jOk6eYMez/bFcWt38FowTZDQr0K9xd33zcTRJNUKtlzWZxQp?=
 =?us-ascii?Q?Rw6ZVmklMLJeIdzsGnFTwMP5Y2Qkv2KMkrIsHiejR+BHlbCL6BHFWpwoOj/f?=
 =?us-ascii?Q?396qtlbb8dFyuPdi6k6Po5ZW1tEWIziyCf8CbBuiY4NhjAAA0OzQ95KDALXJ?=
 =?us-ascii?Q?IUBm/j7SrDSacSCDPM+iBJHYxY0K1rh+AiugDXSVCcYSaTEx53oVw5TXdEWP?=
 =?us-ascii?Q?NoS2O/8wk42y2QzMdu0Pn1tToyrQ+hND1AhwNe+UXqFItc3y3HvToQOvgaVQ?=
 =?us-ascii?Q?zoEjX7zyq/rSesbuu31dikTWFwSxsG5IoGrx+Ee/O9pHYNuAhlAf7+P9vzAg?=
 =?us-ascii?Q?ViL72qvA3hWa3bG88ruwpxIO7Q/qs1wuqOj0gb2dbYjw7+0pPLsCdidBzhlz?=
 =?us-ascii?Q?2kLDKxNiH/BGTVEY9fInpNQT5ZpeEEsTr9KFKAGJUKAgFXum+KO4/TLyE5iv?=
 =?us-ascii?Q?baryDoNL7wA+fCAn08gH4fj3XxEBtACSv4gcg6xw4c5vJHRb5A/S3BSyanOA?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c024cd-dd1a-4475-0eb3-08dbb91c4309
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:25:23.9447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdh6R4nrR/HqDftW2BzIqYaPhnzsDTf0JhuqyR1C1gCUiR4e1qhAp3bHy1VCYHB7I5m2ekFANKrvEhiTUtn7UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 04/17] drm/xe/uapi: Separate VM_BIND's operation
 and flag
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Francois Dugast <francois.dugast@intel.com>

Use different members in the drm_xe_vm_bind_op for op and for flags as
it is done in other structures.

Type is left to u32 to leave enough room for future operations and flags.

v2: Remove the XE_VM_BIND_* flags shift (Rodrigo Vivi)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/303
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 29 ++++++++++++++++-------------
 include/uapi/drm/xe_drm.h  | 14 ++++++++------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2b225c0692a6..7579c9537bfa 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2152,11 +2152,11 @@ static void vm_set_async_error(struct xe_vm *vm, int err)
 }
 
 static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
-				    u64 addr, u64 range, u32 op)
+				    u64 addr, u64 range, u32 op, u32 flags)
 {
 	struct xe_device *xe = vm->xe;
 	struct xe_vma *vma;
-	bool async = !!(op & XE_VM_BIND_FLAG_ASYNC);
+	bool async = !!(flags & XE_VM_BIND_FLAG_ASYNC);
 
 	lockdep_assert_held(&vm->lock);
 
@@ -2257,7 +2257,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u8 tile_mask, u32 region)
+			 u32 operation, u32 flags, u8 tile_mask, u32 region)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct drm_gpuva_ops *ops;
@@ -2285,10 +2285,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 
 			op->tile_mask = tile_mask;
 			op->map.immediate =
-				operation & XE_VM_BIND_FLAG_IMMEDIATE;
+				flags & XE_VM_BIND_FLAG_IMMEDIATE;
 			op->map.read_only =
-				operation & XE_VM_BIND_FLAG_READONLY;
-			op->map.is_null = operation & XE_VM_BIND_FLAG_NULL;
+				flags & XE_VM_BIND_FLAG_READONLY;
+			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
 		}
 		break;
 	case XE_VM_BIND_OP_UNMAP:
@@ -3100,15 +3100,16 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 range = (*bind_ops)[i].range;
 		u64 addr = (*bind_ops)[i].addr;
 		u32 op = (*bind_ops)[i].op;
+		u32 flags = (*bind_ops)[i].flags;
 		u32 obj = (*bind_ops)[i].obj;
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 region = (*bind_ops)[i].region;
-		bool is_null = op & XE_VM_BIND_FLAG_NULL;
+		bool is_null = flags & XE_VM_BIND_FLAG_NULL;
 
 		if (i == 0) {
-			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
+			*async = !!(flags & XE_VM_BIND_FLAG_ASYNC);
 		} else if (XE_IOCTL_DBG(xe, !*async) ||
-			   XE_IOCTL_DBG(xe, !(op & XE_VM_BIND_FLAG_ASYNC)) ||
+			   XE_IOCTL_DBG(xe, !(flags & XE_VM_BIND_FLAG_ASYNC)) ||
 			   XE_IOCTL_DBG(xe, VM_BIND_OP(op) ==
 					XE_VM_BIND_OP_RESTART)) {
 			err = -EINVAL;
@@ -3129,7 +3130,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
 				 XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe, op & ~SUPPORTED_FLAGS) ||
+		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
 		    XE_IOCTL_DBG(xe, obj && is_null) ||
 		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
 		    XE_IOCTL_DBG(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
@@ -3344,8 +3345,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
+		u32 flags = bind_ops[i].flags;
 
-		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
+		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op, flags);
 		if (err)
 			goto free_syncs;
 	}
@@ -3354,13 +3356,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
+		u32 flags = bind_ops[i].flags;
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u8 tile_mask = bind_ops[i].tile_mask;
 		u32 region = bind_ops[i].region;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
-						  addr, range, op, tile_mask,
-						  region);
+						  addr, range, op, flags,
+						  tile_mask, region);
 		if (IS_ERR(ops[i])) {
 			err = PTR_ERR(ops[i]);
 			ops[i] = NULL;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 3e249f197d90..59e9f2f87074 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
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
-- 
2.41.0

