Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16412C04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80C110E53F;
	Wed, 20 Sep 2023 19:30:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF99A10E53F
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238217; x=1726774217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EoC4bW+tcFYI9kF1Celikj4MfAQC6NvpxGBu09Un+A8=;
 b=VSLh+H3X0pm04SBHexZ8/pgepCJqWkrL6ZRsA4A/pJqdsdy28oxgxyy8
 L4piO7sicc1SOhZknVkgNMbzmjPm2BVN5Hl3rGmZIHJLlHI0b6n75NIOJ
 hTFOBBdoYw6p0EwthQGQOLbtnFugYeeWmAhyPAkkVpvKXgLwRGnyPjzq/
 GFXZqE2N7W4mK7XiwiPRSclyri9mWUskhUAgjmYasxzHdUm40Njqr8Ul9
 xI+wWpalZNEfQUIEWsePtwtSZheelLeoQ6roZ8c/AldOYdsIU31DiTnPq
 QgCjQZW3lT27s8QTkiMRGN0WAwgO+o0blvOKl2rwHnQ/6eakVgn16m/3a Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377618943"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="377618943"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812287464"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="812287464"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3wXwJaQeOOKsnyIXNMy0TbYSTnviqM8kMyiDbRokKuvLiBpCocP/qog8TUC3r5ME8AB9sRiIcbhrBLFgGFjJU9SABnCE6bjG8paHsRYM0dk9lHt10F5hG1V3prRoMBo9ICGGBWAzQZNRUg6sqo+d2rzsoay2h/bYR+5CkCI5f1aZG/rRWl53YJCv0gcd16r/FV0NKXec907KB8IyRiNvRaA0+7WKiKQUVrrxgYv9N8z6SlDKu+kUa/cIMuQYPoS6Wsjoh5FwcwXhfgX92RP0lW81CRRdeyoXvCYHSvJj70mEXZKsDiR5EquYRdj4+OOtLfEIFD63nKGkfuJKRzJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owoxyXZqZV4lJcn69xsH3xCFHYrROIIL7ztnksDwL7s=;
 b=K/yU9JomeyCUUSy3k+yzejqil3g3SmA3IlNfPlWDmBBSZ2aR3Gn7l641YWQ0OMJ7KV6nx0CsqruXvcOEONKko5avF39ndijGzcX3Ffa2n/rQ5nO7Exdf9JrD+nuhC3Jwi38W/xINwgcUJxq59711jaTXkM6PR7auXjsh52CWk0Tax7j9680RLedILITTaRYylA9os1jDV9Y4k0SW/nKiOCKP5+cPMrAd2aMn/ivrumJtjYdjSXRKyAIIokNskDTYzTZh10aRrcAtpCC1k3kSQ83m6fsJ7MHpdT33+AcOkeZv6uj4jhtHTvtcGnMs2A7ta0eAAWxu24SUF0xpYm0wog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:25 -0400
Message-ID: <20230920192940.135004-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c62459a-ac19-4197-d53d-08dbba0ffd18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fZ5Xs8thoJsSf+eZC4/F1x0uN4CnAIHBklwgKlg2d/1fTP3wrHtzWMgmIG64KDDxr3JWcgj5imz4AMaCR4fF008EsXAgNK76irzwq6GnB6hMlKNhoZvFF8fN3FK8lzJDHUsDtDA+tkmxtY0b9NqsG+RhbHVsndz6p2coO2s3ht+Atpf4kXVKMM08NML/KAGAUP+pNRzKhBRTpNKoG19/InhTAevGW6J+HtN2USk8vU2VrSGnXpRQUcx+Kl9nfKZot3RYFVNSgGRhyXh1AEEIh5J3WrFg5PB/xsrtVCEhFkWfi1Hm4C88DNRqcGByjwjWjVMlcD5W1D4Id0cKlN/Ariz5sQL9dQyGT6BHpl/BrxjqWXI97V3laVYPiBJBPskL9tEKhp2qXfiIJOxfOq5W7vfk1Jc9aZmlPbXN8TssetG1BoDH9u/ozadm97w5iFwQpl8fbppa9/AMdObIWVvbSNXFSrUtx3fGilbDj34GUDsJ3PV3qsUo/1Cj6u0spFiB0G92bJdmECE8f25mgGU1Hy+yR2ARmrwZMaTlVLD3eFfELsIpmFufMjauP/tRxPJl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(1800799009)(186009)(451199024)(2906002)(44832011)(5660300002)(4326008)(8676002)(8936002)(6916009)(1076003)(107886003)(41300700001)(6512007)(316002)(54906003)(66476007)(66946007)(6666004)(36756003)(6506007)(2616005)(83380400001)(26005)(66556008)(6486002)(478600001)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vibQXo0/0sF6va2FtPdOt83hJr7iJUhRhdfeWXAsqKIr1955hBJcjA1WbX2A?=
 =?us-ascii?Q?kG/DxXRVPJPKdmVVaII0aqOwbNlZbC1Hyt5MznS3mw6ShXX+PCBw9dj78J8w?=
 =?us-ascii?Q?ZH15YVarQFVDKea2M0UQmpphsAf4EsDOguPSMyaKnT8YArwPTSGaADNwbtqT?=
 =?us-ascii?Q?qDFS04cSxP+VflXdqulyqps/BZupcm+B2Am6VOKe5WnLEL7q0qrlk4NWyIUx?=
 =?us-ascii?Q?xb8+SFK9lRXeP1Qd1R23neH13v98jOMSaCqwc0xHJ7LVgYerUwmgvv1HY9Lp?=
 =?us-ascii?Q?h07rJsOoGacVVhTN4DsvxWVNRt3oXVvu/Jllwg4xqppVINg1C6NwwdviQ3qQ?=
 =?us-ascii?Q?AEH7f5CSKhabiLMkPNNDpLphMu2LY5r4qcu1gzoStwM9BsyICrpnJTw6h4I1?=
 =?us-ascii?Q?l3otKsw8VWGipqAsTVTMW7XWoJsfXbRxF+iUeANAew0QeohCKpbWlI7ylQrd?=
 =?us-ascii?Q?ZV6iFCvwKHrdyr4zyO5d2BZNVIT4fNyDUgxYGVzcx1UQw4+ZXC5S0queUNc9?=
 =?us-ascii?Q?bzXAVTfZk94wVZ75dZoCJHxBZhr871ZBTUz/jPu36Oc2GRBC3aPQACm3qjVY?=
 =?us-ascii?Q?qoUZoU+MdqnkVoB72yYie4V75wyFoQwEMB74ylXAr0EQ7gX01gcxjMlkdljJ?=
 =?us-ascii?Q?URwoWNaWJtYdMaxWskIExXKxF7ZrWSrjb/+cNtqhUAQ19JiaCCJGP2E6pyoI?=
 =?us-ascii?Q?FXMtz75T1eETTa8c8MAkVf54V4AJqcrrEr1/oY3091UG+RpNQjpsXhaBZvsV?=
 =?us-ascii?Q?nQb7qmnWFA4udN/pbSDulop0Wcw/s4CJ9otCLXj1zRingMnnPK769BZb3vql?=
 =?us-ascii?Q?sYqMm9pvFllGgQhg5NdZY91lwUcWlKYhvFEjUSYq5hS4i2M6HYjNBuT9cJBg?=
 =?us-ascii?Q?Thnf2tuvb2Zfi7ie3/2/6IDIaVXi5MBTRL/KLRT+Yu0j2yrM04o2B6sYJ8+v?=
 =?us-ascii?Q?gmVTGiN/SD+FwOA4QlDg0EV/86YGiqg7CpnFpLJb7T+8jnMcy8UJMmWgryPJ?=
 =?us-ascii?Q?2u2971Yr/megJOmGEL92Y/XRBfva358fAlJYMGcMadztkb6YysydlqvRMswB?=
 =?us-ascii?Q?CiuHaEPuJiUllbzA8R96Q8Dg1ljelIovR+cPMH/UH8lPwqsR/fV8PdZYV4vZ?=
 =?us-ascii?Q?YLw6+RDDrS4y3IpOTippRfsK8Z+/Ww0vCg/k2KWM3T3aU0HkqZKwAbQ+bEeN?=
 =?us-ascii?Q?AHwOQB0fwX9hkLER54HiThXbdM2244BpAie8PWBQaNn6RrA0YabP8bnM1HUu?=
 =?us-ascii?Q?W+KI7Gy/CUZXo/GM8Nxl3OHwPP+y3swNY/lcwfbYSFefyphR+3bhV2X/NJ9B?=
 =?us-ascii?Q?UF941hdIVn/PkBtn/ynZbAx7d0kQveg7eKq70c//Unbp936EMUvdBMj/Tens?=
 =?us-ascii?Q?gusfAQJkvUQrXGINi61csqcYXXj4EgfLXvgY2di4+EzFo22DaCEAlUs/Z1NN?=
 =?us-ascii?Q?3+pTw86ckxNev3M7ZoWf2jvUxfXpAuAw3+hQZofQswNoJJNmwnpCSbVfOD47?=
 =?us-ascii?Q?9QAP9aiZJiPu9zj4OY0F/p4AdgB1VjwoP6vANz2gDIsSYZyZUwB1WakV8x+B?=
 =?us-ascii?Q?2KxrZJHGVQZmftb7BVT0sUSQuhSwVWZ9F3dDrB5JZmn9kiVnIqpUs+VyT40k?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c62459a-ac19-4197-d53d-08dbba0ffd18
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:03.8367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzRKOaaeOuArb1GNHbuV4PYyUUiIc20GIDcFB1zU8e6bHMNv2mdzT2vEKUtHtNKGaSO/s7TLtPExZPPldwvO4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 05/20] drm/xe/vm: Remove VM_BIND_OP macro
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

This macro was necessary when bind operations were shifted but this
is no longer the case, so removing to simplify code.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 42 +++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7579c9537bfa..ab132b88c135 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2134,8 +2134,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 	}
 }
 
-#define VM_BIND_OP(op)	(op & 0xffff)
-
 struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
 {
 	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
@@ -2160,7 +2158,7 @@ static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
 
 	lockdep_assert_held(&vm->lock);
 
-	switch (VM_BIND_OP(op)) {
+	switch (op) {
 	case XE_VM_BIND_OP_MAP:
 	case XE_VM_BIND_OP_MAP_USERPTR:
 		vma = xe_vm_find_overlapping_vma(vm, addr, range);
@@ -2269,10 +2267,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 
 	vm_dbg(&vm->xe->drm,
 	       "op=%d, addr=0x%016llx, range=0x%016llx, bo_offset_or_userptr=0x%016llx",
-	       VM_BIND_OP(operation), (ULL)addr, (ULL)range,
+	       operation, (ULL)addr, (ULL)range,
 	       (ULL)bo_offset_or_userptr);
 
-	switch (VM_BIND_OP(operation)) {
+	switch (operation) {
 	case XE_VM_BIND_OP_MAP:
 	case XE_VM_BIND_OP_MAP_USERPTR:
 		ops = drm_gpuva_sm_map_ops_create(&vm->mgr, addr, range,
@@ -3110,50 +3108,48 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 			*async = !!(flags & XE_VM_BIND_FLAG_ASYNC);
 		} else if (XE_IOCTL_DBG(xe, !*async) ||
 			   XE_IOCTL_DBG(xe, !(flags & XE_VM_BIND_FLAG_ASYNC)) ||
-			   XE_IOCTL_DBG(xe, VM_BIND_OP(op) ==
-					XE_VM_BIND_OP_RESTART)) {
+			   XE_IOCTL_DBG(xe, op == XE_VM_BIND_OP_RESTART)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
 		if (XE_IOCTL_DBG(xe, !*async &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL)) {
+				 op == XE_VM_BIND_OP_UNMAP_ALL)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
 		if (XE_IOCTL_DBG(xe, !*async &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_PREFETCH)) {
+				 op == XE_VM_BIND_OP_PREFETCH)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
-		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
-				 XE_VM_BIND_OP_PREFETCH) ||
+		if (XE_IOCTL_DBG(xe, op > XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
 		    XE_IOCTL_DBG(xe, obj && is_null) ||
 		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
-		    XE_IOCTL_DBG(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
+		    XE_IOCTL_DBG(xe, op != XE_VM_BIND_OP_MAP &&
 				 is_null) ||
 		    XE_IOCTL_DBG(xe, !obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP &&
+				 op == XE_VM_BIND_OP_MAP &&
 				 !is_null) ||
 		    XE_IOCTL_DBG(xe, !obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
+				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, addr &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
+				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, range &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
+				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP_USERPTR) ||
+				 op == XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_PREFETCH) ||
+				 op == XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, region &&
-				 VM_BIND_OP(op) != XE_VM_BIND_OP_PREFETCH) ||
+				 op != XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, !(BIT(region) &
 				       xe->info.mem_region_mask)) ||
 		    XE_IOCTL_DBG(xe, obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP)) {
+				 op == XE_VM_BIND_OP_UNMAP)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
@@ -3161,9 +3157,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		if (XE_IOCTL_DBG(xe, obj_offset & ~PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
-		    XE_IOCTL_DBG(xe, !range && VM_BIND_OP(op) !=
+		    XE_IOCTL_DBG(xe, !range && op !=
 				 XE_VM_BIND_OP_RESTART &&
-				 VM_BIND_OP(op) != XE_VM_BIND_OP_UNMAP_ALL)) {
+				 op != XE_VM_BIND_OP_UNMAP_ALL)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
@@ -3227,7 +3223,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto release_vm_lock;
 	}
 
-	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
+	if (bind_ops[0].op == XE_VM_BIND_OP_RESTART) {
 		if (XE_IOCTL_DBG(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
 			err = -EOPNOTSUPP;
 		if (XE_IOCTL_DBG(xe, !err && args->num_syncs))
-- 
2.41.0

