Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAB7CD5BC9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D52910E28E;
	Tue, 19 Sep 2023 14:26:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C050610E28E
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133563; x=1726669563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zsj9EBNiWL38slq+96nepsKdeO7HqozsoGKtRAVAnMA=;
 b=NKAkfH6gdXcUeQ+2keOuTr32TSiVn4pontdzAjC8+DIZGOu+Pq7hlFfg
 ytEUuFfpGjgNFuVvs9OBSqnxYSAUSKv6A0HgU8yFrMolZHoAorPF526DM
 dMEtB7LHyL1UoVtgjNTbPSSP5RGAnpDVzeLbccVFdayLXGpxnqoJofJPT
 97Vy0TJjKFRyYZEgf/ogwYK7UlfKjM2j/xpCvkTAx8pUvi0erOEAlUiCd
 xk4J4Ujq2neUetvtzAn7N3JEzDVXuDlr+3cmxq/eox2rO/3aZfeZYSb+4
 eWD6zcHeBkB3NmLJ2zYwUr9tc7zgxtt355Km7mw9uitLQjtC18mcSSMGz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278709"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278709"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="695924353"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="695924353"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFqAcxMCYU8uyaoLbA+dvGT9D1lLwoWpUwdbKrxGFkuvpuKO5q3q/nnPcFRXm6WDiCvNpGUXepDLSFvtHt+5XL9DAMMnbZ/Iwp4WaUH6a7u8dMj73QfAUWCEPZc1ImqIlxu7WF3yHSPR6F3cf+bKyiOTJHEoghe76AXCbiQZ2gk2ZYXMh1tLaByVlw6ydRPEzhfpE7uuFFAt4CCghPGx5EyL9FC64gY1l4j0bSYqIgnuyUw+6Q1ur+8Rs0Vp1LmCZ0x9HTQ+ysiG8vvwHK2kZMAWgi9/AT4jygSNSt2YcjqqBK2WORSZvRpNM9IDBCBqOTKaZSpYlBRSa7HHAGtfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bflC0149s2QuPGYhTZLf28QJk7+K0jVAhgfvp9kwr58=;
 b=i40fpaCCBraf+UYWaBvrls2X0Ie375yqA1IWwTUlt/ohPhnY4mojMT4mSMaJ8GZEHDxRpzOUT5zhxVIXM+0oj+ASfbJJCvHY8VmWI15BoPv4HmbI/ja1ZWTyGiCQxl/6TbR/8P556F1t7bno07XLY2EzIFFFBachyDCz1dSbH6ka6VojIIwAjWmVf3CyvcrvpdeJq2FbgojpXD1bn/hqDLL1Hd1W5V2SVrTibNvFt/zMHgl9xaNAHvwOu6hOtcaZrNosUCxy2DAEa2ZI7biZqzcMw8kPA6+5ngXKMUCjDX+3b+yqCoqsjLuuQYQ7gF/h1WXzeyRTLpJNxgMINpw9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:25:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:25:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:24:52 -0400
Message-ID: <20230919142504.91652-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0181.namprd05.prod.outlook.com
 (2603:10b6:a03:330::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: e035c883-53b5-4efb-4b03-08dbb91c5734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +lPsX6JKtW6ARiTELMmasiu/JcTfFH2HgFmP/JwZKY4At38s5YUUhp97pLQCAm/v14DouVah8Qax4OiSa2e5c7ezcmqoYVxlE322jfZMNk1er98ndI/K+ROTouJRSPlT1Vqw+Z9hKUqBNxxVLrZrfvAU9VkIrnDF3cy8NZzBpnRQfgzOPC3wOI+PiNkqodRhikpIApqBu7v5DSm67Pw7wFS8CUs/hGvtrmFqzHjtKHafKKGJ7irKSaytJiMg9EGRu4/EvTGuaOJ3iPH0gTlbMvByTuOkW6ipvz6//ug9dJ6pGQ/nSH0HM2syoP520FXGE3Lz+yk/wGVqyJIsFoZp4J9jEAOx5BTQmliFALhX+KoH3E17++b9MqGZVeRvh4Mq8XJTDdZ5QR1ReT9PZh7g1QRY6/6CpIBuWMXapiiiwVtQ9HHyljgqV14ZqcuS1WdItn14dU9o1DWTxLVn3M2hjUMQOt60KzlaKdqW/f6+q2oYoLFujydaJccpJH1aMhCeJXk074+hhkcRXQcUtLnAvJS3kJVvCRSS+CPr94m+ELD8ckW1PxDcKz32E/D5AWfo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(36756003)(44832011)(5660300002)(83380400001)(86362001)(4326008)(8936002)(8676002)(41300700001)(6506007)(6486002)(6666004)(82960400001)(107886003)(26005)(1076003)(2616005)(6512007)(66946007)(478600001)(2906002)(38100700002)(6916009)(316002)(66476007)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LC1zUqF8VbFrikq5CaDLLS+pI7nwz2VmP3sIh+8+lx7ZKmlpTesTIreZWxKf?=
 =?us-ascii?Q?dS1I0KcG9p7shmKB6dgH8/z1DzcL0sKiTFcz6rEBcLkxnALL/TN1CrKKN/mE?=
 =?us-ascii?Q?a3h0BhaeGeIGHw8F0TGkusRM5miGr+q7Qr9Aw2Lync3akW7z2WuUSvQW01s+?=
 =?us-ascii?Q?k/g9nU3t4JJBzXs3GZWHl5mJyj7cOuW7gAv7mS+q3BtVUIHMqK1SvX5kH6TA?=
 =?us-ascii?Q?SFrekM2ehWhnenZ5bjcl8H+bogfdad6UmhH1hgjmV0OjVFNg9CAdKXjZXvxN?=
 =?us-ascii?Q?AIh5nbH6UrbLBZ/Cs/ydPnMO5JbwUTXOxeJ5vhvNXfNbyImnf211J/bLu/p6?=
 =?us-ascii?Q?pk8NwfHCnH+Kl6OwguJncem0TBU1ESs1UJJfL3U8kRfczZaiEucMqdrOPCMy?=
 =?us-ascii?Q?DXiQJc/eMtNzgTE05NAH5H+64YhpXHXzi/m9QZ/efyYAeOn1vzDh4REPIaDO?=
 =?us-ascii?Q?XsegII14kEMe7wnw2I4lUOsoCRjA//FZRNCGvPLFMH/2vukx3gkThlZGZzms?=
 =?us-ascii?Q?0jTh8yOQTogQgEUOXgqpbJlvBGkQcGy6V6zYO00w1SwQm62AogxgmVoIVmpU?=
 =?us-ascii?Q?GfKPWMk/yDTQciwgyXplBqSghj8pfTwIFHwcJc7hwLqbWtRtPGJGg+qVNoH1?=
 =?us-ascii?Q?U1EyKBdp7aOSohd97nRkR/HJRYjKOHEO1oeGzUeIKnFxZ5/c7616m+wMYe1l?=
 =?us-ascii?Q?nPtVThUTCWnNZ4Md7hGaq3g7zFlYVSjXmUIQFdNaswSv8BaE7rGLsGclpvvD?=
 =?us-ascii?Q?o7FZcAnYPVrZBaCMLaDxoDprRRm3EaZf1HwbtHx4WDSL8dL08yKl15EnglS2?=
 =?us-ascii?Q?ZhDCn7h9n49XYUyve9GubfK0p5kOnjiXucAJp/pIjHSythSXVSpTdRGNvORu?=
 =?us-ascii?Q?tn0cThXIVWGj5pscKYZiY3FfV97+YTm/ife7CTpxDPBIDNbm2c3EpCFR1xHB?=
 =?us-ascii?Q?pP8oQhKCePk9bheWA2Cf6qwVxIMJCDTBsAP9laQxCyNBSdvghdJkStJmNyKT?=
 =?us-ascii?Q?3JvcPBzcMQ10dWrvCpVlakp4CSvITSonfHQp1iBdVNqn0C3jlegX68tEGHxw?=
 =?us-ascii?Q?PS7C/vtpaGYj5pBUD8ru6u/KLnlhxysEog1lfy4p6n8PCKnDHEzheLSu/Tna?=
 =?us-ascii?Q?PxS8et/eBZZdsPy5BTBUdNfoeLXyxjeKXAZ2M5tqD5B43AUwdGPa13BqYuR+?=
 =?us-ascii?Q?LkrwtjqqQcXUVxvoBc4e775S0F0ccXMjb4GjS/YrEq21tqRd+0qCootNVQEO?=
 =?us-ascii?Q?PUe4Uufg9+N2vesZOE4f3HA7q5/Ozka2P/tiLns/QYmZ+7XZTowurG2T/DzC?=
 =?us-ascii?Q?tiqtKr7FgTm0Iq5bvE+HDix5n+BzOspt0F05zFNidl0FR5xbmOQdM5uCTuWl?=
 =?us-ascii?Q?UVZLpyQFyBNV8CXU43IWbJJ7VD4foOvipjISGe4NPUVfel4kU2sSG7CRqgvL?=
 =?us-ascii?Q?gMkCWejgY7XEsH/xN4fgw1LomN5nAHcKdVl/b+j53PC46Mt7gjTSpPtf2yXQ?=
 =?us-ascii?Q?JKw6EZFicVmb/SG54jgpUrG4WzFjXhrR5/CXX/mEnFPqpGFW5UFSH6saUSdY?=
 =?us-ascii?Q?n6RElvxWV/aulGBYHsDgPBkH55c1Fn1fa7d+VPj9vCsH6+92kQeAYUkl5wBo?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e035c883-53b5-4efb-4b03-08dbb91c5734
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:25:57.9041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEt5ux7WBF+6RSw6aeRuFuHTJr3+my9xuL/AJs0QwwsAawZ0FOrh2VrMfqvJhLG49qWyxQckmc56r407qY2Qpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 05/17] drm/xe/vm: Remove VM_BIND_OP macro
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

This macro was necessary when bind operations were shifted but this
is no longer the case, so removing to simplify code.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

