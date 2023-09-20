Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B61C04FF1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E3210E547;
	Wed, 20 Sep 2023 19:30:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4681C10E53F
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238218; x=1726774218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QWLwVxPO6tHI0Ri/Tl7FhmSLqh9hJixwwvrVEE3/NT4=;
 b=iGHrL16RkW0SRoFZOK2+3acYFyTgoa1eVAH4+fKoe2Y75jFE/Ph6BS8U
 BYOqO6Zv5xDylPMzveBK+byT7lrsNEwy3jtDuZ601W5TEjRMAMb7JYZLe
 Y23mFBgbCsA/aKgWxCaBrGgW209K/KacrYV0UUZVWzild9ERsdb4njq+v
 3HbYEt+jSkvJmA94HfW6kdAfpz/vf/0d+oqAgXXm5jM7nFpGat/2/A8F1
 wAuCWKq7j3pDh5f+AjNK+pdt3JVox17W3XjtRVs1+g1rqWyJCUhtqnDmn
 aBkNj/upZ3qF+nI5cSuw9wEuO19v0kAyhqqgNU2zzWVq8NX8I9JvTwxIt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359701212"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359701212"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870498586"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="870498586"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlLfyLN0A+gZuclDR76+vNti4K8Cx3O9mIJkUqsUPEtgPeUSgiD3EzisAspLkxwkTY+ieowJW+R3e11U0Y73DjeL6Gfgk2WNT3dsk6C+iZF236iTMo1JBWnSi6xo7uBSgsJWBL3PajFySC4wHjtfdRUTe4vFHgS1Nel3DSSFC8syQc1O2df4ZmCInRQldchhpyBr86bXQhJhfpDA4A3aB0gI/EoKIuCf9C0in6rPIqcKVj5x54Q13qXEFipyYbnVqe7jEVZLu7ZtC8gV07sBbAW/0WUJgismdiMqHaIpP2xaQFBhhloaVVCdsKjj9QXNN9/boi+1KolI0s152kZyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yh4/TPYNc/xayS6h3m5P4cR1tWAQzXuS21ZSZJ763aY=;
 b=bIn/esAUPcLjtKF+nmdvZ/c7dbT+RICIczg54n6dcT8jtF/avHxdRp51Jij1ZmaBWvCfP1NjMblD/CJeUvHV+MpshLUxlBNeToX9SJqX+HTo8Ctybm8vDtNC2NnzbpG/QGv09IMP3rvZYUNgHX5MQpmSMf+HnXDNfKkF+QTnECDn2Z/gU/4/HaVn51wGIw7PJSRp2LeCJ8A4GpuXVxMuiE/DkoelTtlU6IAWbWIebD9bhygkq/SPvxVsp70cbotbiYVjksl/vNnSa57ghT63+p8O6O3V5gYDddpPoE3LApoqBFG7A/1VUjkbMFTbB2b7NZ3yvSPhN7RRDG4xp+i5mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:24 -0400
Message-ID: <20230920192940.135004-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0152.namprd05.prod.outlook.com
 (2603:10b6:a03:339::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: dd789a0b-9313-4e69-a89d-08dbba0ffae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EKJL4VsusRGCH7SZLE+58gZgN5KMB3Wz6kKksPAiaV8wW5feiinf8Q5SXBCwDg7y67ISh5Ur/4TCNb0DOaORZMGQHy8ONaFP2aFm4Gtj/sN6MBz29Ck64JnoIEPD2Q2xE/LKw6CgELZpFF52JI+0zAjgqQtXSeRa6qo6A4z9k/sPKFUGelo8sFrZbpoAUttn834H1wshQ9E7Md0fLV/BIFOeg2m1qSSDewM0GUBpZBkMzM+FhSimvz0YO0d/IJmU83QeKQQ8kh2nV7sHUgsEEi6BPysVr1vq7o126kudWech24/m0oW7l2TnVtQ/u3h/a9Q6aGwuk3s3LXcg/HOSELqk0Ug2Ca2llSm6M4uDcmS0FX9HXQJs/7aBnpE2r92z2Nus4+/6QTtMy1LZvNwAxukuXliBU/yvMpt0bIn59S40399PX5JkBiSFb+qB3VMe1aQHNQq2HshdIwce9xnjwCfLnBv6mgqSUg/1BkL79GbixhTPT3Lfwi1WeO7VngHnOsWvfzgBC5SxNAcndLneh4vpRzHRB2U9UkrF8RHsyaU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(1800799009)(186009)(451199024)(2906002)(44832011)(5660300002)(4326008)(8676002)(8936002)(6916009)(1076003)(107886003)(41300700001)(6512007)(316002)(54906003)(66476007)(66946007)(6666004)(36756003)(6506007)(2616005)(83380400001)(26005)(66556008)(6486002)(478600001)(966005)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qk6w/ywID++j8YElsk8tVggcMdzsXNuCEeH/WgROEdvLU4r2Gn+8kuyTaWe3?=
 =?us-ascii?Q?iSWA6maCYJhoO7gzkbpHvFZltweJpZIKy3OgUd3FrycCLImgFOQTDAiklEJU?=
 =?us-ascii?Q?KMKsGssJ34QvP7hxaOFh1cAVOsoV+cPVb0mX2vQTGooR8Ht7Hl4E2eAczqW2?=
 =?us-ascii?Q?XsLsn6MRcQ7Ibs1WIVCz5fMCLAAnWN+RMvdSpXPjn7Kx/3/1kCYAWTeU1YqO?=
 =?us-ascii?Q?YYRJ/uVLwFcPly4WJDQVJnOW6HdHSnK+WJ9+ODGZoByj6Y9Ra9bcL/d8fuf9?=
 =?us-ascii?Q?Dq48R+NDzDQGhsvddBldcbPZZuSJ5zO162FIXk6k+yquudQkPOyBEOKYs58Q?=
 =?us-ascii?Q?SwwiUH6FI2DrI0R8jfT6XuBSC9LNv8AnQk7TYkXwOArOakdzwwNh7+c7EYBv?=
 =?us-ascii?Q?Uvox0C/KCUQ6JNeBEOtMz6Rz5luBQhdHnFqsAGyOgKwwzY402bk5zWYIE3db?=
 =?us-ascii?Q?Ea1deZKEMdtxcVWT62knxUK5Z6Jd8qOyKLiG9m/EzU+ZK0PTzQXFQyFpW29q?=
 =?us-ascii?Q?Ta/0HsSvM4OKihJh1EJVs7yZJLonnXLH4TgQI5hPJkpfnEZJzB7HRTCXDmKP?=
 =?us-ascii?Q?VN48oKhQaEcljF1cgqFoX+XA/Wt13iEI+fyRueeXDfUr4qlWuOjTuTEzqQDX?=
 =?us-ascii?Q?JC6CrgvVQ0GSjNG/v4htwNaa9HPQTl8nJh3mpoUFBnoC36xXdZmdT1Vu+khw?=
 =?us-ascii?Q?ezYy2FrJaEyWHY4je+vbTkmzyqN2lDQ75Ldah3UammgpHCvnGvx8xCX3gdl/?=
 =?us-ascii?Q?cIziOj/LCnrO/pU3PdkIIHq/RGxZPkQNC+HzjWtjUYR+zEH3z9DsrvzstZGq?=
 =?us-ascii?Q?fGLL2fs5dsOzCkt7WizI10KA0y8LzcTJH3SCd6DjzZITuHF0ZlVHJaMj7mKJ?=
 =?us-ascii?Q?WqBk+KRH9j/5jzx0lXiOGL0vL+F+iG1TyUrPaszlmHT7p4YvkOMeqK/m428y?=
 =?us-ascii?Q?2mQMISOsUqgzqr9jqqYQGB9Yj5vdar7iTAFATWJN/qNavNogaDLSxx6MzQXV?=
 =?us-ascii?Q?YyUh8IQnSA4Vmh2aUbMwcfvPMYyZ19AIiVHcADCfxjeDb2Ih2kZIrBcIzIWr?=
 =?us-ascii?Q?Opy66lC8cEepY48Ode3hGKsyXbJb8ccfMiwgtYqSjefZA9a/gYYA1UmKrMYm?=
 =?us-ascii?Q?mQmDGEbdLbHSptWtHxKD9bYw07BswPmDW85Wq1lj1VTr+yI6W4VwS0ipCEm+?=
 =?us-ascii?Q?JdfPKY0zdqVQSdlbTlPedMKbhuN3vurXk2UPNtYeWLQKXGLL9QUkhq5v9Poy?=
 =?us-ascii?Q?w0QIJN1bjERNF8B8WQyoJiKft8ok/7bygrQt0hCRQeZp6I5Ju2VwyIBUHB+3?=
 =?us-ascii?Q?prx4AP161W4xgFnSQsnvt4UAxTUQl74IUdI79IbBEtPg5HwjLWBYJMUCMFN8?=
 =?us-ascii?Q?XZhrvaqBEC2vTVs6pw/37mZzV3kVHWpLPNR87U3wRQQUCcHCMCjgPbEMobCD?=
 =?us-ascii?Q?kc6CfB1kkWzt6Vpl1cNZZJRm45kTSTjTi70Ic6eDCTM/FweC1lE663/JWbrj?=
 =?us-ascii?Q?NhrP4KWZTrFSuidKnL+v5IQtwRFT/MuPIPfQPZj1Cu9167lTYLmtjODtAdXc?=
 =?us-ascii?Q?9bxVJlfxZLUtzDqK8fspLc9CQrGOPOYfv7QPFahndI+/Ocn/sUNqWCLHDz6O?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd789a0b-9313-4e69-a89d-08dbba0ffae8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:00.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5igxQkfaKG07BhWB+fKDv48A7viHc8VEREqT0xqnZep+IufyuZY1z0VpuGCIW75YgyNGwKgIAye0RSOo4mNgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 04/20] drm/xe/uapi: Separate VM_BIND's
 operation and flag
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

