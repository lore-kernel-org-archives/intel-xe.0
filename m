Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C73C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 21:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AEE10E02B;
	Wed, 26 Jul 2023 21:04:06 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAD110E02B
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 21:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690405443; x=1721941443;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=vG4h1+CCgMBmO4lF1Xz91gllu08UZd/OHpRN9MZ1vMY=;
 b=eGepsSFPVTCOmZ9Q8P/56A6cJaBD7H6H37pU1QxXJkJm9FWGypz6j8CI
 WHXc7Lj9PqCNdtFE0Tatk6CMjjcCtJkhHuAqFQHqppXpEshe3eXWC6V8r
 ySScKDM5VLNx8Jieg+Z6kDNDAh9FvXffYdRbSIQg8bgC7CKm7xO9/q5GK
 LXnEUoScARWJ0Eis0FToNzzxIJS38TjqZ2mba32sqXXtDZ8s/60l5SIIB
 dJBsoGs8n/gaOdMTjEK7e4dsIJsK6sEZWhmOVNgZ2brULm5YTfvSw3c6q
 mO6XV7wyuspJRuRCviRZXN+yTw8Jx8yB1eM6nkv9/qB/Gk/PYKazThNGz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399068653"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="399068653"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 14:04:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="796716681"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="796716681"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2023 14:04:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 14:04:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 14:04:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 14:04:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ch5l7mPnplIV0Gv6oasbr/pkYVGCIRS3y+f9pDi3v/EMKS1eDmjNe5t0HV4i8gcfjH9BOFebEC96xmb+1WnbE+0bazYmcyLaKBk3886mlfazd+2ChXOXkWd3cSsTMDEZbdrUOd9VqrgD32hzQ9dnfqpN2x/T45qiy0n4NfRkRENgfR3FtdiYMJf/6ZGg0x4Wo0+g04oR7HdCI7VE+92Q1OtqM8smw+fzC838zC/w/j6mLODodyn09WXU0mg5DJOLkO+25gXdgA9LjdWWWlWdyRagCFyddzTnzlJf8VANEMByHvaJ663KGaUfmF/aFXUNI39vPxf3OqdxfgB67qlshQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KI7TXbwWJgP+mC8SoYHw9P8sKnb+zjD/5czgaVut6KQ=;
 b=dCYarRBIQz3ggs+ilfW3RCP67sKEskLGSwkUXeuduRllpxTpmgkOrYydp7K0yyV3+UZ/ScYBE4oJHxrLAXN2adX9Cql6yg+iB1hBirq0Whu+bPh7iOSJurdXaKqF/rEkmtxcFqNZZYCbznTbFIkyU9pmiaCh09zgrnLk8qWeyTQkHcARrUR9f2KPyx/xy+VvBkTI6kNlxHvCMY2OpaUoxEB6DwhYki+1+Gb8bD4MN9VKBqLBNyRXIFUc7rPW1Y+L8viCGv3xs7vm/JRTIF8DV77AcQNL66D38AuX9JOucqj751bUYYxLgyuctp0Otv9WASu3RUzvkaAOXtmCQ6Pj0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7406.namprd11.prod.outlook.com (2603:10b6:8:136::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 21:03:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 21:03:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 17:03:52 -0400
Message-ID: <20230726210352.390864-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0337.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: 771c7a2d-26a4-4a38-0b92-08db8e1bd3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B1PzvsWo4Iroquw8E+EJzuIFZEIUQmeNhUHKtDhXqGit1U3Jw2yhe77wPzjdlYjtWrBQoRJwQ1JbUz/t9j2pmh2sZN2FAfuCVprw3UDb7Cw3xyKeSKVSxNbs6EamvkUr5DMSkUc2d551Ma8hMqWu3TDLxzmo4jjjqCCS/Obsyc0vokZr6CtMvwbgmKPcNU547bwOLSpLMh0MfaiIvXxpIh4QYOVvWWNexocKl/8Qfu6LRmMlMuIzHcZoQ/W1vixaLcnqDmqPwKp3X9QLHXoGR03EjKTB8Xf06tuP8tivh+cPujK6/2UlPwtWqonPRtAXbKc5gP9fvAnQnS65qHqYPCezbY97GSae/R1PMtPeTIDndQylpRIA5IxUsc+ecIV26HwnBnUMbYS4bYuGSWa8VM63XBB4kAneCX1SLMzvysoylGxTcWuTupEtj6+kRixf9g5IVkNI3EfY22dx3Jd2O0tqI8xvmRUQDRiHTGYlUrLQ0alNK9ucpr17YpLZ4gQ4hIxJfJOL3TRS8mnTLhEskuUMKrluJabMlnailpIOEqYDNd1c901YxYjUrh5aVBlK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199021)(1076003)(186003)(26005)(36756003)(6506007)(5660300002)(8936002)(8676002)(44832011)(2906002)(38100700002)(82960400001)(107886003)(86362001)(6666004)(6486002)(66476007)(66556008)(6512007)(66946007)(83380400001)(478600001)(41300700001)(6916009)(4326008)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1sJmf1fT3R+JgcmFJdJ7ZlPeNDWwstRctEnt188twHkAvUUSApu7c6z285Sz?=
 =?us-ascii?Q?dcqKiXuw9XKukiL0ECS8rNSK1uNXJ/lL7joUBeArNK9UL9necqN4O3gvn0Ld?=
 =?us-ascii?Q?DWAsDuxM9toaHjoeepQVlp890L2lAymoslSPqNWVxGxG40/NmS4VXZGt98gz?=
 =?us-ascii?Q?/+fqWbpJ2DJehF2hyrv92FwGl/EhoAmcb7c0FZzwU788GsSAHxPuLI4BK2TF?=
 =?us-ascii?Q?Tt3VmYvg2zJ8iiJ/gXKsjWm9e2cTSClDbEkY1ihcSahq6vefVl4T4tY/f37g?=
 =?us-ascii?Q?3MI5aTVxU9W2UhI9rZAcvh+MOzZ44qamL/DjlQ2TT4RznMBOmjm9BqMw60Ks?=
 =?us-ascii?Q?vh/NpaodK1XzBObLXI5KpW0kFVVDU2nIKliLmBtReQ8CFFynNmdyITsXy//A?=
 =?us-ascii?Q?G+UVGYMP86LBzkBRpJD5z86h1OHPlUzvFaKhcNCXLHlqkLTxY6yKndbJRsu/?=
 =?us-ascii?Q?vHMO0OyMKQ2XxF2VSEul42Tcy4ff2Czxjhg2wx8VfSVdIioVJ/kZ/oO9XePJ?=
 =?us-ascii?Q?oMXIvQ+gZhGldRMcx+aWdHxRWCJcNrUYZV3frF+uq7s76n6KAPCZOf9k6Ya/?=
 =?us-ascii?Q?6TBCZEONFzf8VlpZhSniTPVHpAoQHPGMR38wKL4slBpa5xJIn5OD8cPPjP+P?=
 =?us-ascii?Q?i+vYoAGX1dYb8pTj0IAzXQ+6w0xZshkCdWGTN8eRV0O0OuZfHzouQVzIccY5?=
 =?us-ascii?Q?2hRB+D5vmPtjtm4z052AeRqbPMrHPj657CPXF5cW6P84p7MIO5OJa+RGpZgy?=
 =?us-ascii?Q?Cc7DgvPRMyBVtGGVKS+1Sc++6eHP5vIVH1+stzsTKdhZ55useQZcUKQFp8Hq?=
 =?us-ascii?Q?07mRs2eWFtBzAQDUMJTI3ux7Iv3k8Zs+KuQ7nRUs6NvAoAjzeVy32ovRTFZX?=
 =?us-ascii?Q?x5UW0fspXHYZwHodBQOuQ+f81RVG9tS78m/PIb5Z6o8uJeDGEjObHpMU6mQC?=
 =?us-ascii?Q?0vsuGQ6eW/zaOnBUIhCQOhQtjE7/YKr+qGGb4QQRmx+Vut39d4j++6NfAtjM?=
 =?us-ascii?Q?uXaz67xdf6D7A9N69lISUaTyNqSqdMauqTBIM2cx7N3y+QNw8NT23I4QlDzz?=
 =?us-ascii?Q?7os3EOz+nTZmrZHBjxAI8GJsDmqDXXDXMuczcf6Eui9ujKcf+0TPLOUl4taH?=
 =?us-ascii?Q?sdgDeom62ALPM/pjg7PYZq7ccNEdxA4PW6XgI5njBf8oLv5FjQyzz1jEvuDy?=
 =?us-ascii?Q?/if8SBQuWq0nhjipFctCNlCifUIAqGqlpFKI6f6AJDkW4JWKz2WwWm2prUMm?=
 =?us-ascii?Q?swhQvin+Jzh52X3cNCSsUGD+bHKjxgfYXsMGQ/FyxS5udDbTZ25UdiEOQFmZ?=
 =?us-ascii?Q?989hLXeqT/DrufyeJXJUuZ8lgv70rIPGwD8X2sz25vEatETXEjpLG7m2v7lC?=
 =?us-ascii?Q?EKTUrd8CRbgBGixLF//qvHhjK+em70CgZ2GyUhOO1ZQnjb1jgbiyo2DRdKTR?=
 =?us-ascii?Q?JzMAvfk+8z1O6Npo8EFNYGNiSgIaCYCqmIUNKfbkxp0B8bcHx8c4EwFeVKMr?=
 =?us-ascii?Q?Xf+obXFOMXa0Bb7u4DXXslXpJcsrLvg8ZIbzwH6HMoyP5VPsxcvKKFzfKhDp?=
 =?us-ascii?Q?ohn3PGWhMXvXiXn8OCsJwIApKq8lccsQrXtBSw3zzBazix4y6/UmPFkbc6su?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 771c7a2d-26a4-4a38-0b92-08db8e1bd3db
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 21:03:57.5794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjnoouZBhRW439HFMU4IuCrzipl/8eotNb70YD+br42LSOu6+gWaRTEdHkv2zkWPGYr0rSWPuDtDuPXOnIdofA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7406
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/xe: Invert mask and val in xe_mmio_wait32.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The order: 'offset, mask, val'; is more common in other
drivers and in special in i915, where any dev could copy
a sequence and end up with unexpected behavior.

Done with coccinelle:
@rule1@
expression gt, reg, val, mask, timeout, out, atomic;
@@
- xe_mmio_wait32(gt, reg, val, mask, timeout, out, atomic)
+ xe_mmio_wait32(gt, reg, mask, val, timeout, out, atomic)

spatch -sp_file mmio.cocci *.c *.h compat-i915-headers/intel_uncore.h \
       --in-place

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../drm/xe/compat-i915-headers/intel_uncore.h |  6 ++---
 drivers/gpu/drm/xe/xe_force_wake.c            |  2 +-
 drivers/gpu/drm/xe/xe_gt.c                    |  3 +--
 drivers/gpu/drm/xe/xe_gt_mcr.c                |  2 +-
 drivers/gpu/drm/xe/xe_guc.c                   | 25 ++++++++-----------
 drivers/gpu/drm/xe/xe_huc.c                   |  3 +--
 drivers/gpu/drm/xe/xe_mmio.h                  |  4 +--
 drivers/gpu/drm/xe/xe_pcode.c                 |  2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 |  2 +-
 9 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index ec2d4885bff0..cd26ddc0f69e 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -90,7 +90,7 @@ static inline int intel_wait_for_register(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, value, mask,
+	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
 			      timeout * USEC_PER_MSEC, NULL, false);
 }
 
@@ -100,7 +100,7 @@ static inline int intel_wait_for_register_fw(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, value, mask,
+	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
 			      timeout * USEC_PER_MSEC, NULL, false);
 }
 
@@ -111,7 +111,7 @@ __intel_wait_for_register(struct intel_uncore *uncore, i915_reg_t i915_reg,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, value, mask,
+	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
 			      fast_timeout_us + 1000 * slow_timeout_ms,
 			      out_value, false);
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 7403673d532d..aba0784b608e 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -120,7 +120,7 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
 static int domain_sleep_wait(struct xe_gt *gt,
 			     struct xe_force_wake_domain *domain)
 {
-	return xe_mmio_wait32(gt, domain->reg_ack, 0, domain->val,
+	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
 			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
 			      NULL, false);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3e32d38aeeea..bb7794cf2c1a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -456,8 +456,7 @@ static int do_gt_reset(struct xe_gt *gt)
 	int err;
 
 	xe_mmio_write32(gt, GDRST, GRDOM_FULL);
-	err = xe_mmio_wait32(gt, GDRST, 0, GRDOM_FULL, 5000,
-			     NULL, false);
+	err = xe_mmio_wait32(gt, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
 	if (err)
 		xe_gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
 			  ERR_PTR(err));
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index c56815af0686..bb906cace7bd 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -423,7 +423,7 @@ static void mcr_lock(struct xe_gt *gt)
 	 * shares the same steering control register.
 	 */
 	if (GRAPHICS_VERx100(xe) >= 1270)
-		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0, 0x1, 10, NULL,
+		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0x1, 0, 10, NULL,
 				     true);
 
 	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8ae026838702..2530b6243661 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -290,8 +290,7 @@ int xe_guc_reset(struct xe_guc *guc)
 
 	xe_mmio_write32(gt, GDRST, GRDOM_GUC);
 
-	ret = xe_mmio_wait32(gt, GDRST, 0, GRDOM_GUC, 5000,
-			     &gdrst, false);
+	ret = xe_mmio_wait32(gt, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
 	if (ret) {
 		drm_err(&xe->drm, "GuC reset timed out, GEN6_GDRST=0x%8x\n",
 			gdrst);
@@ -386,10 +385,9 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	 * 200ms. Even at slowest clock, this should be sufficient. And
 	 * in the working case, a larger timeout makes no difference.
 	 */
-	ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS,
-			     FIELD_PREP(GS_UKERNEL_MASK,
-					XE_GUC_LOAD_STATUS_READY),
-			     GS_UKERNEL_MASK, 200000, &status, false);
+	ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
+			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
+			     200000, &status, false);
 
 	if (ret) {
 		struct drm_device *drm = &xe->drm;
@@ -639,10 +637,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 	xe_guc_notify(guc);
 
-	ret = xe_mmio_wait32(gt, reply_reg,
-			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN,
-					GUC_HXG_ORIGIN_GUC),
-			     GUC_HXG_MSG_0_ORIGIN, 50000, &reply, false);
+	ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_ORIGIN,
+			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC),
+			     50000, &reply, false);
 	if (ret) {
 timeout:
 		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
@@ -654,11 +651,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
 	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
 
-		ret = xe_mmio_wait32(gt, reply_reg,
-				     FIELD_PREP(GUC_HXG_MSG_0_TYPE,
-						GUC_HXG_TYPE_RESPONSE_SUCCESS),
-				     GUC_HXG_MSG_0_TYPE, 1000000, &header,
-				     false);
+		ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_TYPE,
+				     FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS),
+				     1000000, &header, false);
 
 		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
 			     GUC_HXG_ORIGIN_GUC))
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 373a65c77946..dc1708b4e94a 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -85,8 +85,7 @@ int xe_huc_auth(struct xe_huc *huc)
 		goto fail;
 	}
 
-	ret = xe_mmio_wait32(gt, HUC_KERNEL_LOAD_INFO,
-			     HUC_LOAD_SUCCESSFUL,
+	ret = xe_mmio_wait32(gt, HUC_KERNEL_LOAD_INFO, HUC_LOAD_SUCCESSFUL,
 			     HUC_LOAD_SUCCESSFUL, 100000, NULL, false);
 	if (ret) {
 		drm_err(&xe->drm, "HuC: Firmware not verified %d\n", ret);
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 4953a9a3f1fb..d24badca8677 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -107,8 +107,8 @@ static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
 	return (reg_val & mask) != eval ? -EINVAL : 0;
 }
 
-static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 val,
-				 u32 mask, u32 timeout_us, u32 *out_val,
+static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
+				 u32 val, u32 timeout_us, u32 *out_val,
 				 bool atomic)
 {
 	ktime_t cur = ktime_get_raw();
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index e3ab1d3a367f..7f1bf2297f51 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -68,7 +68,7 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
 	xe_mmio_write32(gt, PCODE_DATA1, data1 ? *data1 : 0);
 	xe_mmio_write32(gt, PCODE_MAILBOX, PCODE_READY | mbox);
 
-	err = xe_mmio_wait32(gt, PCODE_MAILBOX, 0, PCODE_READY,
+	err = xe_mmio_wait32(gt, PCODE_MAILBOX, PCODE_READY, 0,
 			     timeout_ms * 1000, NULL, atomic);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index def19e64f2c1..a65ddae6808c 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -484,7 +484,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 			_MASKED_BIT_ENABLE(dma_flags | START_DMA));
 
 	/* Wait for DMA to finish */
-	ret = xe_mmio_wait32(gt, DMA_CTRL, 0, START_DMA, 100000, &dma_ctrl,
+	ret = xe_mmio_wait32(gt, DMA_CTRL, START_DMA, 0, 100000, &dma_ctrl,
 			     false);
 	if (ret)
 		drm_err(&xe->drm, "DMA for %s fw failed, DMA_CTRL=%u\n",
-- 
2.41.0

