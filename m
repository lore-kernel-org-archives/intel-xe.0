Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E63CC10DC1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A55910EA05;
	Fri,  8 Dec 2023 06:47:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B4110EA01
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018047; x=1733554047;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=RRChE4DCflDx/0cflRlzn7S6vLvxBTawrW3AwMxxjTk=;
 b=ZB3hPw3i9Y0F14Ce3jIR/13toMPHdbTgwKtI7g4TJCXIDh9JZHMEGfZU
 EuRugISPiQfNwBF/R8fBSLVuT6WsN8gqJg8JBDckevAXOwvEztMWdsFs8
 uRSJv+14Cyo3Yp5MJmunudF3QzKyIWRnQFEFTZX9D7L+djPim+LjIUQ40
 lrGlsEisrWiPF/hpVlAv6S/VT+TE+gDENTN/twpZc5gj80IHMNeosm+pb
 o3kqwKsoPQ4nYr2N3N83ljeXLVFgDeVgYgZ78wnP3MG15iVvgtsFD2Du+
 cl98wgeqXOVXwjZ0NSTuaXfvPQ+geln9fYWWL1i+EhWBZVeZkr15Facck g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="393235555"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="393235555"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:47:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721769621"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="721769621"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:47:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:47:26 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZFgiPyaVT80M+reNM5NNsnqfUNoFUhKBNMnEy9A8Iielh8Jpt65IFp+AuxQQGznVgFYIPaVCD1ml9Ln5KdcUptotW7LDo2hTXIsZRQp4bCIFoy3RzWiURyNbuJzmLSxo94/4VUVZ2DbIue9++ET2jbu9gPdlTdCHQ3OS6LNV+XzUppUsi2UGNzsjZQDTff+kJBmmNtELVAFDGhhAUMSvCrniiYz77yN1CihVtomT0tWm6UpwNHJcHuXG8AJPaUWyYWQRQX7fkOMxtm1AlKUZCBFVjPbyaJCPod0sxDWNumr06B1TX3L3ZpYDGf6F/cSbv8F9aUmf5x1sUWl9NXy6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lH48WM8TO1WgIjnhRCyNo/qgZ0X5IAutH8b8l2LLmNg=;
 b=dUuiXC6AxxrpCWR5kBDz3gBA3u3sAL+OOzSM7nMLdPhv0xPj/Yi/tj1Wix33o/qbwqmifHKeKlXN7/1sCu9ILFVn07O4EIQJcKGuPRrmQBMWsuMNobEJ6JkWyYLTsxmYgFllqutgLFZtSBudDug5AqUhz7ZzlMHYnquiT+z2CnnMa3kqbUV41dJ+fEvABxNrrf5f9NV0hy3YFVd0Bf62Jaa7Wlrbx6ATyE6H2vu7oZuIdmNn4q1wc3Kvb7DIHKRtu/F7W2PRLTjCs437DXRFg4iuMQ96aiIykrITKfEvEu9QW3d2TJUkQF3axia97rqn8a8UmtSq3F89dbiRkYIpvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 06:47:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:47:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 13/16] fixup! drm/xe: Convert pagefaulting code to use drm_exec
Date: Fri, 8 Dec 2023 01:46:40 -0500
Message-ID: <20231208064643.877688-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: b12c3978-c6a4-429f-9c22-08dbf7b9897c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eifw2vqVl7ePfQyiS2rQlyHqUrLT9ThI4BDdBjBwFJn07Ahcw2F11+kiwEOfZp6mnWMfo469hwg0bY1s/Nlc/IUEC3FYsmF5EWWxPEfIVPHsd/EczogjXTr5H9RS+dV3oCYQK4hbnrxrOKt7vIqVr9OzG2QB2snfzfxh/ZR7XMLBFtTV6cB/Md/897Q0vt+aq5x4YxBxHVDtw3WM3NihezdZ/jU/wx3TdSe3MisXUBwo2xPIK/1nZespSLb1XYEyalniq0n/DHH8WfuHvoTpDlgRWm4/3sO90rxltkIM2p/jOGHJlYmVdgGhvgL9QqZvl92auN6/ihhV+Itwnldpamleq89IEZlfeWJyjxLYwlFE9pq2SIQmJNBzOzVa6Ate/VqhiGsXRf8Ho/Habz1eZbt9cSGI9LPRA9u9AqCDYaimUAQe6pukiR8JbWAJCGXe1F2Y7U3Tim5KRfXlPyRP0Ct3KpvEAIspudCLRoU+YhnXEbA+CycoHxnBhqhuErxeexAVbP2g+rWy6f7WIofzrh7ul/f8UTC9WmsQcSsdJv4SG5I4h+0LQLuHl0HxDhzl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(83380400001)(6666004)(1076003)(6512007)(2616005)(6506007)(26005)(66476007)(316002)(66946007)(66556008)(41300700001)(5660300002)(2906002)(86362001)(8936002)(8676002)(36756003)(44832011)(38100700002)(82960400001)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mV6wQJEqiPzBO0zR6HdtCxlqu7hYGLpHBjOjIvAY1ZSeT0HpCNk9+3YWgiyF?=
 =?us-ascii?Q?PzaDXoy+0DuDEMS61MMA3SarqBgE15kcuLZB/116uI3vVPfFGxgQue2AXEt8?=
 =?us-ascii?Q?LQr8BAHk6YCaT5jpfKa60FoOEoo/UOyD+qHz5LQfWHfrJLtwUjw76yFsrw8W?=
 =?us-ascii?Q?YC+ePwMQh5aDyk2tCJrO5NRXkEu28msiFEvn+AgeFrftn4O56jqTy0WLSMOr?=
 =?us-ascii?Q?JIA/10yUTfvPB5Xyi9vtT354KAB7cljAtJz6lx+FjaNS7Alz/FxrVfO5Sbz5?=
 =?us-ascii?Q?FpeFhLYVJCMbfixZFh8AhfZJY+aP9L379osnj23g6z+Wgm8n/dtqLjp523Gk?=
 =?us-ascii?Q?de19ta0ukSs3o9D7FFKotumIAxZurb3dnogIb7sKohi3OIZr+H49kbVkrqHq?=
 =?us-ascii?Q?J8kT7jMmpqFE+KOEb+7U6SkQvJp7SjcRfv/j1o8fnBbdTvLiMV4t701rtOnY?=
 =?us-ascii?Q?qQ+e415n917ZwOR9aiqE9HA6uTgTC6iHUyNsVh/IgtKH/ijYC8iRJJddNub7?=
 =?us-ascii?Q?DjXfglD19YfxkUjuPOxV6N/BSTwNymzrm69t4qxntrb8Rnvn/TOcbOLS210H?=
 =?us-ascii?Q?hWbaP6BeDUUoBVbS7v9tdaT3T/0AiCD470/VjGXzfJhmXM7RoXg824uOeFFz?=
 =?us-ascii?Q?82ZB1VSq0sVyFu4oi6g9NheJs5QRb1p45KWXkjZSgTtKm3jspqvEhUBMSG3Y?=
 =?us-ascii?Q?xWjPo1l7fG6hZItp75np0LHJZccLRQAdz6LrxZ6ZRT1OSngxKuUmtaAGhVhx?=
 =?us-ascii?Q?SrY9BF747ScWuhMNhB9miETL4bQYh3s2mMHtgVgLU3zPe3y1x1UdHVayS1Mf?=
 =?us-ascii?Q?fhkKNAJuiRc9w53lsOcmUvJyZ2ZPmuGBJxPPX916Zg8N9hd+EbGoqRML4df1?=
 =?us-ascii?Q?sDrwl8ln7k3ALscubDRTs1z9XhR5AUhna4FgQqjL4JhShJQKJOjCkHpPuAQx?=
 =?us-ascii?Q?qomnJ1q9T5fLkUtoikgVBc3rOEpiMYz4r2RHCXjR8DQnSajRHFLPCMkLiORB?=
 =?us-ascii?Q?czgxktpRuN8gXTqZPA4WOqFg015rEX3i2bzggkgCcD86I1Wck/J7fh0RZ+Di?=
 =?us-ascii?Q?MwtE2tygJzjdDJpDp6sQycLINdpNRcnH+Zs3Fb8G32geNfhQQpwAeaS2SmR/?=
 =?us-ascii?Q?g70YTircBWGv+/3l7SW5A+7ZcnwtkTcCNUwBlT1k5w4CgVdEBXezd1OSy6mK?=
 =?us-ascii?Q?421u5FeJnTbmtGF3dRgDDdTaGih9DjBwg25tE6Xno1vvcsKpVdymu8W4ZrRb?=
 =?us-ascii?Q?uphmewbZlGgMrMkwEJz9hgji7HAmXnJm+YgUufhObAFH9Op78ch4Hgo7BO3u?=
 =?us-ascii?Q?AQAGihLkGX3GFMj18RLWkY6ycSoQAQtSe/JDRGNhTL/dggR8+Stbfy6/+1cS?=
 =?us-ascii?Q?17D9gHw1nuyRfT20MaMNPW9hE/fia2/HKRiuD+Sk+FEz6SNG58cf/WiPXC52?=
 =?us-ascii?Q?AMDC3jTFbP/yC4rcGOqpj9KVGM3He6Zbam/uMKXPsnrGj3/9yWRUvKeBSpnb?=
 =?us-ascii?Q?ftjjNbf4nzm3s2pkoe6BcPf8+FW5EgWnpHvP5gecR8r4HoHAighdtqn35Zt+?=
 =?us-ascii?Q?BoJd2j62Vh416J8oU78uit8mGIaOpnW+mZFo43j6fxZStUmDpucWixVR1qT2?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b12c3978-c6a4-429f-9c22-08dbf7b9897c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:47:25.2556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrCR//IXP1O3dPLEdI2zZmeQTLw324PH95Sj4KJPJn48nE1ss5W9JtnO5x+UwNwSPKPLziCP3Y3dtnJvg8NIZg==
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 795497662e18..a5edf5cad369 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -39,6 +39,11 @@
 
 #define TEST_VM_ASYNC_OPS_ERROR
 
+static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
+{
+	return vm->gpuvm.r_obj;
+}
+
 /**
  * xe_vma_userptr_check_repin() - Advisory check for repin needed
  * @vma: The userptr vma
@@ -447,7 +452,7 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
 	lockdep_assert_held(&vm->lock);
 
 	if (lock_vm) {
-		err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base,
+		err = drm_exec_prepare_obj(exec, xe_vm_obj(vm),
 					   num_shared);
 		if (err)
 			return err;
@@ -544,7 +549,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	 * 1 fence for each preempt fence plus a fence for each tile from a
 	 * possible rebind
 	 */
-	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base,
+	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm),
 				   vm->preempt.num_exec_queues +
 				   vm->xe->info.tile_count);
 	if (err)
@@ -1116,7 +1121,7 @@ int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
 	int err;
 
 	XE_WARN_ON(!vm);
-	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, num_shared);
+	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
 	if (!err && bo && !bo->vm)
 		err = drm_exec_prepare_obj(exec, &bo->ttm.base, num_shared);
 
-- 
2.43.0

