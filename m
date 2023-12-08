Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCD7C10F04
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9515D10EA0C;
	Fri,  8 Dec 2023 06:47:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE2D10EA0A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018057; x=1733554057;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=2g/TQBINz242NtBAmyOOXCNF1pbsO/W6TZfwEnvhaA4=;
 b=iW4HqghtTRAPIgL2TaHYZ6NLHwcu4AXLLrGBEkmJbvoE4BErRIOizMPa
 50dVRMz2PbRGTMnmg1AbEaS9+n6xpKjYQgYShHZjqu4E+8rgoW1CCyAVd
 +nWKJfgBKzkyxv/K+s7+EM5/RDLVDINaP4njh1+Efh5gSGeuNEngD/UYm
 RreyB2f2sZrIZX/etg4I0kKliUHDHcuz4oRWG4bU1llGbVD//NAH3hCyI
 ailDDuyYOoigLsztHKkaCN+j2FZmDtjlsaw0Exq4qsjIC+jJD8sBXOHo3
 jzYcSlr7UQLhgqxQ0AhMkK6LpFzV2Io+nG3GHZJ1xFt2bBoLeKZg4HKHh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="393235582"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="393235582"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:47:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721769690"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="721769690"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:47:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:47:36 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P912ziGtPEaJm5Hz/sHNlKMG5V7AnfewfeLS+IIh/nPorxDqmp9tKMU49n63eTuxGvHGHUDzhI3amzv6sPxEwLaY/IfgZhzts26mgBrosfRrROP16B+9hgiZzjV++QBm8xrBmqGR/b2KA7Mn6MJnm1gY/N7bOCDexlWLK6Ht5B51CCmXtCjTVyp97NXotMcL73cD9408ivWsjXOwXTDKdLVXAobgIZtfRw5XK4+Kp91usAmTJw1npq87Qn/ki/SoOs67kGXFJPfYtubp+vEryWTto6fpQkOiydvdR2Phwfj4jLl+CDAlcKn7p1ACzOWeIQndHzBU6HeZRB6gMurY1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMtssw1YZXKyxx2oMCHLwGxXc1o79Zu6Gu3Yvq84jTI=;
 b=XsQAVuM4iiFxXVqimHdN1RTSQfW1ecAWjlvk6l3mslxSsktxst33PFhYwtkTkHZG27QQ+hl/K5ITcd2i0tcrmalGbIW8jcXVIzqqHSUVHJQibS1k+wjV8omWHTtlfmiZ4raHBUD7WjfJr39hmp09UJrOxBIS+0rt6JMzBb935dw8JsyXZysSr+pSVP3Wl0WQWuSuE21C9k8dzfysoJy31In7YFFi0xMYPNvT2H7Q7Yuhx6ULiTTEMGW1vakxkoO++HB0EDfrV7iz6boGnNwxhlCi05yaZkWPR4l83DMKYr6aXtvUKXjMbKeOCa987jVn0g5FhYKfDQ91+ikX5BERpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 06:47:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:47:33 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 16/16] fixup! drm/xe: Port Xe to GPUVA
Date: Fri, 8 Dec 2023 01:46:43 -0500
Message-ID: <20231208064643.877688-17-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:a03:180::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 218c9695-1bcc-42bc-2c94-08dbf7b98e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q3v/WT7yTWZ6WrWWkqYkgD74I96khLVTdWK2GBHxd1YUUB/n1IH5OrIySzDnn6v+VjEpKzWNGHNRaOrHc2PLcgTClOp09lMVQEAbismIlKLLr66AQBC0bY6Ay9GXoTrEyPxaVsGTCVlhi8k1L5K//Ul2XDT2M2mh9iZirYRohULlTJbd4STBJxPPuSyq8mTmDfUdPQN/mSzOmHfyU+E0eC+RPoLtY/6ZywDvT1+wE/TAhasJ6CCHCP7RLUx8OvJEfd7ObBpLXHrB+SuJm0rVIqrnBMIs4rIpAIPzFXHLCDtEbDGwLVSw1ViGMwWQzpdmqR2tmprXY6GPhHyByTxipfwQ7Zh0wO0HO9rQjKoDGv6uZDmls0BaqOYAARG88ndYQtvUBzViOHnCHgPXfqw6mQy5X3Ko29sZuXo7mX06uKLWtiqn3Na/mtKiGPZsuUdvE1fSGaBQqlsR6ZyBSWha+80czxn1ba3SLlEWWY1IZPKSSWlIU2TZKBzLy0HyQaGGnESG3++OUaG21rgxqyhLlFo5+GldFurxcOhmknCEPsBqQGO4iiKUr4rJtFFLtbKGYeMJZ9eF1Hh51nRvq1ByUF3j/Ycfmu8HHtwFdy/7xMM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(83380400001)(66574015)(6666004)(1076003)(6512007)(2616005)(6506007)(26005)(66476007)(316002)(66946007)(66556008)(41300700001)(5660300002)(30864003)(2906002)(86362001)(8936002)(8676002)(36756003)(44832011)(38100700002)(82960400001)(6486002)(478600001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzVCejRUUE5weG5ZZnI2bnFFaGVaNEU5VTFENStHTlNRejlqcytpbVd4RURB?=
 =?utf-8?B?U2dES3JZd3ZmT1hDcFo1UkVMVWtKTmV3RGVrd0E0UUthTWJBMWl5TkYvS3cx?=
 =?utf-8?B?UnJZYlgxK3FDWkplYWtody9OM1NYUTBRWGxaZ0swdTF3SExEU3pCYlBOc3J3?=
 =?utf-8?B?UmNOL2VGaS81RW5FUHJiTzFXd2t1RXdwWEltQWl3NFJCTGMyVmxJaGZaUmxD?=
 =?utf-8?B?YTZxbUdYaDcwUFl1TE0vcTVqRDQyTDN3K3VFcnR3djJkNDNCSHFMNTc3eUVU?=
 =?utf-8?B?MkgxV1Y5ejRjalVDaU9JMzR4Tlo2ZEpISjdIRVU2Nm84dDZYR20yS1hyYUpq?=
 =?utf-8?B?eTNUZEk3WkxPRFJMd29TMDBqZnZrZ1ZpU0pzbCt2QmVyY3Z3ZnRrQm02alBx?=
 =?utf-8?B?N0gzM1NtTzhGRk9ReTBvWllRZmprbGlEeGYxNVBRUzhabENBK2tEYUJpVmZB?=
 =?utf-8?B?a1NwSVk4QyswUVJsNU9tTVVNYWVSRDAzT1k1aTNzNStwVHRnQU9kb1BZUk41?=
 =?utf-8?B?QXZqQnBqR2VGbHp5OTdhdkVuaDkvOHpHRTJDZWYyK0ExRTVBckExT1Z0WEVL?=
 =?utf-8?B?ekVCc3dFSDZTOEpQRTBxUGZ1YlM0dXdRU3dBazF2RkM2UXg4VGg3anVzWmNE?=
 =?utf-8?B?UDliTHJLeHhmZUxkVndIZ21HV2RxR3VXSVVpQzZ0MUVTQmo4Ukg3eUI1dURo?=
 =?utf-8?B?VjJ5SUJ2bE4zRHhRRTZDS2JXSzkwTFhNYllBdVIvVGpXRSs1SUlWMUJsaVJa?=
 =?utf-8?B?elUyQ0ZIaWVIa1NiY3lFcDVpbXpvV3FCeXR4R0ZBRXdDT1YwZVk5Nmk1RFgx?=
 =?utf-8?B?S3ZTUnZ0UCtVQ0hpVjZHeXVERWFRUmZBdXU1eDRwUTY5TUROakVDZitEbko4?=
 =?utf-8?B?Z2NTaXBjSjlQTmZWNVhjTWRnV0FLb0x3NkdSY0pCWmpOMldIS092YktnNkVU?=
 =?utf-8?B?em0zc2s0T3U2RXJtanA5RUN5cmFqQ0ZPMi9DZlpOUFEvTmR2T1ZlM3VhdjBS?=
 =?utf-8?B?QnJLN1ZDMmR0MHYxME5xcnMrcDQydFVpT2NiWElNcWl6RTR4ZzNGaXduTjVa?=
 =?utf-8?B?enBrZ3JZUDkrVHd6Y05XUkNocCtqc0cvS1pUU00yVEtIVlI3NmtVY0R1Wnh2?=
 =?utf-8?B?UUxzdHVGRjIyZVcrRjEzdDVHa3ZwY3BtblVoQmR0VlJFOTBqazNqa0ZkTjlZ?=
 =?utf-8?B?QVlrQUFQWVVMak5hOUtvUDBTMlN5dW9xMStwSHlEczhNT29CT3RaNG9jRFpW?=
 =?utf-8?B?YS9Ic0lHNUpCd1JnYk5BSG9wd29rQnBRTnl0NTdJamVyZ2RjS1B6cDAwSlNC?=
 =?utf-8?B?ekNlUGRmek9JN29OSG5GQnFwYzZJbWRpbWdId1ZXalJ0dHFDOTlFQk9QKzR6?=
 =?utf-8?B?L0xHUUpOV1czWTExb0pjODcvbWsvS1JJOTl1aXliL1NEVVZwMHZTS1VhcGhx?=
 =?utf-8?B?UTY0OStkL3F4dVZMSWdsMzhJOEkxZVhLajRZSmNzcVdFR3hTUUh0T3JmRTVx?=
 =?utf-8?B?TnFqREdEVmFKdko3dHVvYlFpaWFXR252blpyYytmdGN0QXVZcERZWVU3ZStM?=
 =?utf-8?B?Wnpiam1iM3IrSDdvRSt2dFJLU0YzL1JNRzJQb1pLanphdHkrYVp3TXVRWDJp?=
 =?utf-8?B?Y2VJK2tuU2VrcjJTZjREWk9LamlDdzBaMXBtWVhpQ2RhSU9jQVhPeG9pQm1j?=
 =?utf-8?B?UkdWMHQxQVhCZzZHUFcxeHdMaUNBamhCVk9mQzQ0dnd2WkcyOUdqc1FlR1o5?=
 =?utf-8?B?SHd5bjEvblpvNk5VTndydDRSSXpaMzlPV1hmYmE2WE5SeVZ2NE5oOFZ0MEly?=
 =?utf-8?B?WjY3dVlpbGZnT2lUNHFQTm9iQVY3dXF4aFNaOTlyeEdZc1g4WFlCNkpyNU1C?=
 =?utf-8?B?K2wzUzArRTQ5ZjFmZFdta3RjSEg4TGl4Nk1nYjAyQ29VZTB2Z09nL0oyOVBP?=
 =?utf-8?B?Tm1VOXdRYnh4YVk4MGc0blgva3NXSVBYYnYzdHlYLys1TmtLNThpYlhOdWx5?=
 =?utf-8?B?ZFp6NlV6NFZacnNDaVFOZFgrdnVSSlkyYmFZNlJkczk2bzFHMXVVQVNUYTV3?=
 =?utf-8?B?ZW11THZPVkhsRmQxSUZHVkdCbWU3YWlBYzZQVGMrSURtempweEZneHhINHlR?=
 =?utf-8?B?QXpqSlNSU0x4d25mQUlEZWU3ektldDg2eHFsTTY1bDJHNm8rMnlvSHZCK0NX?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 218c9695-1bcc-42bc-2c94-08dbf7b98e97
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:47:33.8334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYrjx7FiYDH+JY0ycPPWk4h9r7VJiUzEU0fdsrQuHe4BXJjTIN/MKt0MbxfE6PBI2EBxRhx5lYPSx2AnkcWt9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8256
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

drm/xe: Adjust to commit "drm/gpuvm: add an abstraction for a VM/BO combination"

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       |  28 +++++--
 drivers/gpu/drm/xe/xe_bo.h       |  11 ++-
 drivers/gpu/drm/xe/xe_exec.c     |   4 +-
 drivers/gpu/drm/xe/xe_migrate.c  |   4 +-
 drivers/gpu/drm/xe/xe_pt.c       |   6 +-
 drivers/gpu/drm/xe/xe_vm.c       | 139 ++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_vm.h       |  24 ++++--
 drivers/gpu/drm/xe/xe_vm_types.h |   8 --
 8 files changed, 127 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 72dc4a4eed4e..7e25c8b7a01a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -470,6 +470,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 	struct dma_fence *fence;
 	struct drm_gpuva *gpuva;
 	struct drm_gem_object *obj = &bo->ttm.base;
+	struct drm_gpuvm_bo *vm_bo;
 	int ret = 0;
 
 	dma_resv_assert_held(bo->ttm.base.resv);
@@ -482,11 +483,12 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 		dma_resv_iter_end(&cursor);
 	}
 
-	drm_gem_for_each_gpuva(gpuva, obj) {
-		struct xe_vma *vma = gpuva_to_vma(gpuva);
-		struct xe_vm *vm = xe_vma_vm(vma);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
+			struct xe_vma *vma = gpuva_to_vma(gpuva);
+			struct xe_vm *vm = xe_vma_vm(vma);
 
-		trace_xe_vma_evict(vma);
+			trace_xe_vma_evict(vma);
 
 		if (xe_vm_in_fault_mode(vm)) {
 			/* Wait for pending binds / unbinds. */
@@ -519,9 +521,9 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 			 * that we indeed have it locked, put the vma an the
 			 * vm's notifier.rebind_list instead and scoop later.
 			 */
-			if (dma_resv_trylock(&vm->resv))
+			if (dma_resv_trylock(xe_vm_resv(vm)))
 				vm_resv_locked = true;
-			else if (ctx->resv != &vm->resv) {
+			else if (ctx->resv != xe_vm_resv(vm)) {
 				spin_lock(&vm->notifier.list_lock);
 				if (!(vma->gpuva.flags & XE_VMA_DESTROYED))
 					list_move_tail(&vma->notifier.rebind_link,
@@ -538,7 +540,8 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 					      &vm->rebind_list);
 
 			if (vm_resv_locked)
-				dma_resv_unlock(&vm->resv);
+				dma_resv_unlock(xe_vm_resv(vm));
+		}
 		}
 	}
 
@@ -1398,7 +1401,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 		}
 	}
 
-	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
+	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
 				    vm && !xe_vm_in_fault_mode(vm) &&
 				    flags & XE_BO_CREATE_USER_BIT ?
 				    &vm->lru_bulk_move : NULL, size,
@@ -1406,6 +1409,13 @@ __xe_bo_create_locked(struct xe_device *xe,
 	if (IS_ERR(bo))
 		return bo;
 
+	/*
+	 * Note that instead of taking a reference no the drm_gpuvm_resv_bo(),
+	 * to ensure the shared resv doesn't disappear under the bo, the bo
+	 * will keep a reference to the vm, and avoid circular references
+	 * by having all the vm's bo refereferences released at vm close
+	 * time.
+	 */
 	if (vm && xe_bo_is_user(bo))
 		xe_vm_get(vm);
 	bo->vm = vm;
@@ -1772,7 +1782,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 		xe_vm_assert_held(vm);
 
 		ctx.allow_res_evict = allow_res_evict;
-		ctx.resv = &vm->resv;
+		ctx.resv = xe_vm_resv(vm);
 	}
 
 	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 098ccab7fa1e..9b1279aca127 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -11,6 +11,15 @@
 #include "xe_bo_types.h"
 #include "xe_macros.h"
 #include "xe_vm_types.h"
+#include "xe_vm.h"
+
+/**
+ * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
+ * @vm: The vm
+ */
+#define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
+
+
 
 #define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
 
@@ -168,7 +177,7 @@ void xe_bo_unlock(struct xe_bo *bo);
 static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
 {
 	if (bo) {
-		XE_WARN_ON(bo->vm && bo->ttm.base.resv != &bo->vm->resv);
+		XE_WARN_ON(bo->vm && bo->ttm.base.resv != xe_vm_resv(bo->vm));
 		if (bo->vm)
 			xe_vm_assert_held(bo->vm);
 		else
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 347239f28170..5ec37df33afe 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -281,7 +281,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	/* Wait behind munmap style rebinds */
 	if (!xe_vm_in_lr_mode(vm)) {
 		err = drm_sched_job_add_resv_dependencies(&job->drm,
-							  &vm->resv,
+							  xe_vm_resv(vm),
 							  DMA_RESV_USAGE_KERNEL);
 		if (err)
 			goto err_put_job;
@@ -309,7 +309,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	xe_sched_job_arm(job);
 	if (!xe_vm_in_lr_mode(vm)) {
 		/* Block userptr invalidations / BO eviction */
-		dma_resv_add_fence(&vm->resv,
+		dma_resv_add_fence(xe_vm_resv(vm),
 				   &job->drm.s_fence->finished,
 				   DMA_RESV_USAGE_BOOKKEEP);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c9c4d2428068..be2a92dee52c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1136,7 +1136,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 					  DMA_RESV_USAGE_KERNEL))
 		return ERR_PTR(-ETIME);
 
-	if (wait_vm && !dma_resv_test_signaled(&vm->resv,
+	if (wait_vm && !dma_resv_test_signaled(xe_vm_resv(vm),
 					       DMA_RESV_USAGE_BOOKKEEP))
 		return ERR_PTR(-ETIME);
 
@@ -1345,7 +1345,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	 * trigger preempts before moving forward
 	 */
 	if (first_munmap_rebind) {
-		err = job_add_deps(job, &vm->resv,
+		err = job_add_deps(job, xe_vm_resv(vm),
 				   DMA_RESV_USAGE_BOOKKEEP);
 		if (err)
 			goto err_job;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 35bd7940a571..3b485313804a 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -866,7 +866,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 	else if (!xe_vma_is_null(vma))
 		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
 
-	dma_resv_assert_held(&vm->resv);
+	xe_vm_assert_held(vm);
 }
 
 static void xe_pt_commit_bind(struct xe_vma *vma,
@@ -1328,7 +1328,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 		}
 
 		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(&vm->resv, fence, !rebind &&
+		dma_resv_add_fence(xe_vm_resv(vm), fence, !rebind &&
 				   last_munmap_rebind ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
@@ -1665,7 +1665,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 		fence = &ifence->base.base;
 
 		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(&vm->resv, fence,
+		dma_resv_add_fence(xe_vm_resv(vm), fence,
 				   DMA_RESV_USAGE_BOOKKEEP);
 
 		/* This fence will be installed by caller when doing eviction */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0b55f040cdeb..265cc0c5e440 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -328,7 +328,7 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
 	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
 		q->ops->resume(q);
 
-		dma_resv_add_fence(&vm->resv, q->compute.pfence,
+		dma_resv_add_fence(xe_vm_resv(vm), q->compute.pfence,
 				   DMA_RESV_USAGE_BOOKKEEP);
 		xe_vm_fence_all_extobjs(vm, q->compute.pfence,
 					DMA_RESV_USAGE_BOOKKEEP);
@@ -366,7 +366,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 
 	down_read(&vm->userptr.notifier_lock);
 
-	dma_resv_add_fence(&vm->resv, pfence,
+	dma_resv_add_fence(xe_vm_resv(vm), pfence,
 			   DMA_RESV_USAGE_BOOKKEEP);
 
 	xe_vm_fence_all_extobjs(vm, pfence, DMA_RESV_USAGE_BOOKKEEP);
@@ -647,7 +647,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	}
 
 	/* Wait on munmap style VM unbinds */
-	wait = dma_resv_wait_timeout(&vm->resv,
+	wait = dma_resv_wait_timeout(xe_vm_resv(vm),
 				     DMA_RESV_USAGE_KERNEL,
 				     false, MAX_SCHEDULE_TIMEOUT);
 	if (wait <= 0) {
@@ -742,13 +742,13 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	 * unbinds to complete, and those are attached as BOOKMARK fences
 	 * to the vm.
 	 */
-	dma_resv_iter_begin(&cursor, &vm->resv,
+	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
 			    DMA_RESV_USAGE_BOOKKEEP);
 	dma_resv_for_each_fence_unlocked(&cursor, fence)
 		dma_fence_enable_sw_signaling(fence);
 	dma_resv_iter_end(&cursor);
 
-	err = dma_resv_wait_timeout(&vm->resv,
+	err = dma_resv_wait_timeout(xe_vm_resv(vm),
 				    DMA_RESV_USAGE_BOOKKEEP,
 				    false, MAX_SCHEDULE_TIMEOUT);
 	XE_WARN_ON(err <= 0);
@@ -797,14 +797,14 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	}
 
 	/* Take lock and move to rebind_list for rebinding. */
-	err = dma_resv_lock_interruptible(&vm->resv, NULL);
+	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
 	if (err)
 		goto out_err;
 
 	list_for_each_entry_safe(vma, next, &tmp_evict, combined_links.userptr)
 		list_move_tail(&vma->combined_links.rebind, &vm->rebind_list);
 
-	dma_resv_unlock(&vm->resv);
+	dma_resv_unlock(xe_vm_resv(vm));
 
 	return 0;
 
@@ -911,12 +911,21 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	vma->pat_index = pat_index;
 
 	if (bo) {
+		struct drm_gpuvm_bo *vm_bo;
+
 		xe_bo_assert_held(bo);
 
+		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
+		if (IS_ERR(vm_bo)) {
+			kfree(vma);
+			return ERR_CAST(vm_bo);
+		}
+
 		drm_gem_object_get(&bo->ttm.base);
 		vma->gpuva.gem.obj = &bo->ttm.base;
 		vma->gpuva.gem.offset = bo_offset_or_userptr;
-		drm_gpuva_link(&vma->gpuva);
+		drm_gpuva_link(&vma->gpuva, vm_bo);
+		drm_gpuvm_bo_put(vm_bo);
 	} else /* userptr or null */ {
 		if (!is_null) {
 			u64 size = end - start + 1;
@@ -998,16 +1007,19 @@ static struct xe_vma *
 bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
 			    struct xe_vma *ignore)
 {
-	struct drm_gpuva *gpuva;
+	struct drm_gpuvm_bo *vm_bo;
+	struct drm_gpuva *va;
 	struct drm_gem_object *obj = &bo->ttm.base;
 
 	xe_bo_assert_held(bo);
 
-	drm_gem_for_each_gpuva(gpuva, obj) {
-		struct xe_vma *vma = gpuva_to_vma(gpuva);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(va, vm_bo) {
+			struct xe_vma *vma = gpuva_to_vma(va);
 
-		if (vma != ignore && xe_vma_vm(vma) == vm)
-			return vma;
+			if (vma != ignore && xe_vma_vm(vma) == vm)
+				return vma;
+		}
 	}
 
 	return NULL;
@@ -1197,8 +1209,11 @@ static struct drm_gpuva_op *xe_vm_op_alloc(void)
 	return &op->base;
 }
 
+static void xe_vm_free(struct drm_gpuvm *gpuvm);
+
 static struct drm_gpuvm_ops gpuvm_ops = {
 	.op_alloc = xe_vm_op_alloc,
+	.vm_free = xe_vm_free,
 };
 
 static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
@@ -1335,8 +1350,9 @@ static void vm_destroy_work_func(struct work_struct *w);
 
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
+	struct drm_gem_object *vm_resv_obj;
 	struct xe_vm *vm;
-	int err, i = 0, number_tiles = 0;
+	int err, number_tiles = 0;
 	struct xe_tile *tile;
 	u8 id;
 
@@ -1345,8 +1361,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		return ERR_PTR(-ENOMEM);
 
 	vm->xe = xe;
-	kref_init(&vm->refcount);
-	dma_resv_init(&vm->resv);
 
 	vm->size = 1ull << xe->info.va_bits;
 
@@ -1379,12 +1393,21 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	if (!(flags & XE_VM_FLAG_MIGRATION))
 		xe_device_mem_access_get(xe);
 
-	err = dma_resv_lock_interruptible(&vm->resv, NULL);
+	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
+	if (!vm_resv_obj) {
+		err = -ENOMEM;
+		goto err_no_resv;
+	}
+
+	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, &xe->drm, vm_resv_obj,
+		       0, vm->size, 0, 0, &gpuvm_ops);
+
+	drm_gem_object_put(vm_resv_obj);
+
+	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
 	if (err)
-		goto err_put;
+		goto err_close;
 
-	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, vm->size, 0, 0,
-		       &gpuvm_ops);
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		vm->flags |= XE_VM_FLAG_64K;
 
@@ -1397,7 +1420,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		if (IS_ERR(vm->pt_root[id])) {
 			err = PTR_ERR(vm->pt_root[id]);
 			vm->pt_root[id] = NULL;
-			goto err_destroy_root;
+			goto err_unlock_close;
 		}
 	}
 
@@ -1408,7 +1431,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 			err = xe_pt_create_scratch(xe, tile, vm);
 			if (err)
-				goto err_scratch_pt;
+				goto err_unlock_close;
 		}
 		vm->batch_invalidate_tlb = true;
 	}
@@ -1426,7 +1449,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
 	}
-	dma_resv_unlock(&vm->resv);
+	dma_resv_unlock(xe_vm_resv(vm));
 
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
@@ -1447,8 +1470,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 						       create_flags);
 			xe_vm_put(migrate_vm);
 			if (IS_ERR(q)) {
-				xe_vm_close_and_put(vm);
-				return ERR_CAST(q);
+				err = PTR_ERR(q);
+				goto err_close;
 			}
 			vm->q[id] = q;
 			number_tiles++;
@@ -1469,28 +1492,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	return vm;
 
-err_scratch_pt:
-	for_each_tile(tile, xe, id) {
-		if (!vm->pt_root[id])
-			continue;
+err_unlock_close:
+	dma_resv_unlock(xe_vm_resv(vm));
+err_close:
+	xe_vm_close_and_put(vm);
+	return ERR_PTR(err);
 
-		i = vm->pt_root[id]->level;
-		while (i)
-			if (vm->scratch_pt[id][--i])
-				xe_pt_destroy(vm->scratch_pt[id][i],
-					      vm->flags, NULL);
-		xe_bo_unpin(vm->scratch_bo[id]);
-		xe_bo_put(vm->scratch_bo[id]);
-	}
-err_destroy_root:
-	for_each_tile(tile, xe, id) {
-		if (vm->pt_root[id])
-			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
-	}
-	dma_resv_unlock(&vm->resv);
-	drm_gpuvm_destroy(&vm->gpuvm);
-err_put:
-	dma_resv_fini(&vm->resv);
+err_no_resv:
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
@@ -1577,6 +1585,10 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 				xe_pt_destroy(vm->scratch_pt[id][i], vm->flags,
 					      NULL);
 		}
+		if (vm->pt_root[id]) {
+			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
+			vm->pt_root[id] = NULL;
+		}
 	}
 	xe_vm_unlock(vm);
 
@@ -1594,8 +1606,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_assert(xe, list_empty(&vm->extobj.list));
 	up_write(&vm->lock);
 
-	drm_gpuvm_destroy(&vm->gpuvm);
-
 	mutex_lock(&xe->usm.lock);
 	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
 		xe->usm.num_vm_in_fault_mode--;
@@ -1632,29 +1642,17 @@ static void vm_destroy_work_func(struct work_struct *w)
 		}
 	}
 
-	/*
-	 * XXX: We delay destroying the PT root until the VM if freed as PT root
-	 * is needed for xe_vm_lock to work. If we remove that dependency this
-	 * can be moved to xe_vm_close_and_put.
-	 */
-	xe_vm_lock(vm, false);
-	for_each_tile(tile, xe, id) {
-		if (vm->pt_root[id]) {
-			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
-			vm->pt_root[id] = NULL;
-		}
-	}
-	xe_vm_unlock(vm);
+	for_each_tile(tile, xe, id)
+		XE_WARN_ON(vm->pt_root[id]);
 
 	trace_xe_vm_free(vm);
 	dma_fence_put(vm->rebind_fence);
-	dma_resv_fini(&vm->resv);
 	kfree(vm);
 }
 
-void xe_vm_free(struct kref *ref)
+static void xe_vm_free(struct drm_gpuvm *gpuvm)
 {
-	struct xe_vm *vm = container_of(ref, struct xe_vm, refcount);
+	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
 	/* To destroy the VM we need to be able to sleep */
 	queue_work(system_unbound_wq, &vm->destroy_work);
@@ -2170,6 +2168,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct xe_vma_op *op;
+	struct drm_gpuvm_bo *vm_bo;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -2197,7 +2196,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		err = xe_bo_lock(bo, true);
 		if (err)
 			return ERR_PTR(err);
-		ops = drm_gpuvm_gem_unmap_ops_create(&vm->gpuvm, obj);
+
+		vm_bo = drm_gpuvm_bo_find(&vm->gpuvm, obj);
+		if (!vm_bo)
+			break;
+
+		ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
+		drm_gpuvm_bo_put(vm_bo);
 		xe_bo_unlock(bo);
 		break;
 	default:
@@ -3213,7 +3218,7 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
  */
 void xe_vm_unlock(struct xe_vm *vm)
 {
-	dma_resv_unlock(&vm->resv);
+	dma_resv_unlock(xe_vm_resv(vm));
 }
 
 /**
@@ -3245,7 +3250,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 			WARN_ON_ONCE(!mmu_interval_check_retry
 				     (&vma->userptr.notifier,
 				      vma->userptr.notifier_seq));
-			WARN_ON_ONCE(!dma_resv_test_signaled(&xe_vma_vm(vma)->resv,
+			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
 							     DMA_RESV_USAGE_BOOKKEEP));
 
 		} else {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index eaf072974d94..12bb5d79487f 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -24,20 +24,19 @@ struct xe_sync_entry;
 struct drm_exec;
 
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
-void xe_vm_free(struct kref *ref);
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
 int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
 
 static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
 {
-	kref_get(&vm->refcount);
+	drm_gpuvm_get(&vm->gpuvm);
 	return vm;
 }
 
 static inline void xe_vm_put(struct xe_vm *vm)
 {
-	kref_put(&vm->refcount, xe_vm_free);
+	drm_gpuvm_put(&vm->gpuvm);
 }
 
 int xe_vm_lock(struct xe_vm *vm, bool intr);
@@ -139,8 +138,6 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
 }
 
-#define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
-
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile);
 
 int xe_vm_create_ioctl(struct drm_device *dev, void *data,
@@ -222,6 +219,23 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
 int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
 		      unsigned int num_shared);
 
+/**
+ * xe_vm_resv() - Return's the vm's reservation object
+ * @vm: The vm
+ *
+ * Return: Pointer to the vm's reservation object.
+ */
+static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
+{
+	return drm_gpuvm_resv(&vm->gpuvm);
+}
+
+/**
+ * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
+ * @vm: The vm
+ */
+#define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 #define vm_dbg drm_dbg
 #else
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 23abdfd8622f..e70ec6b2fabe 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -136,22 +136,15 @@ struct xe_vma {
 
 struct xe_device;
 
-#define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
-
 struct xe_vm {
 	/** @gpuvm: base GPUVM used to track VMAs */
 	struct drm_gpuvm gpuvm;
 
 	struct xe_device *xe;
 
-	struct kref refcount;
-
 	/* exec queue used for (un)binding vma's */
 	struct xe_exec_queue *q[XE_MAX_TILES_PER_DEVICE];
 
-	/** Protects @rebind_list and the page-table structures */
-	struct dma_resv resv;
-
 	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
 	struct ttm_lru_bulk_move lru_bulk_move;
 
@@ -424,5 +417,4 @@ struct xe_vma_op {
 		struct xe_vma_op_prefetch prefetch;
 	};
 };
-
 #endif
-- 
2.43.0

