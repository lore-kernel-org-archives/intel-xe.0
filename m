Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8680CCD5BD3
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389FA10E3D6;
	Tue, 19 Sep 2023 14:26:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE8B10E3D3;
 Tue, 19 Sep 2023 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133585; x=1726669585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=USpYVt8tROBprvWiGtgKJvwcJk81T/sWmVty4Y2YwEo=;
 b=ENBG/Ki0hqB0+/VUX2bTgeBeo/EeG+3XfxUakW83sg6G8jqsjAqOjo+A
 M9ALD0jBx+BjmLND47d0VMRxIPRuyvF6KrlSMX4Cs/bSkX+LOVltLz1dW
 GMly9JeXlkDGVhlZFcz6eO2zftdBPv54AzXXuczWNuIzUaPemToePq7kF
 NITrmYYhZVInF6swJgtujaMJ/6mjPB3vrg+y1STETZR5NTPPPdlBUsMm8
 ncyzzLi+tc0VVovP/4aeui41bXOdQOPciq9si0SepyPCZ8uabmm4TPgzV
 Gj1J9qm48f0GFrcdRBAp+LNh9/0Mbwfc3yEm0HDoulds7HHUyQI2/DTgE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383786056"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383786056"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781319648"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781319648"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQ+c9DDX7lPTHtOtzqAU4Jj8j+SKd2DKR/oZU2CHY40aPZpZI87Hof6It52RlvlpRFP0OtVb7YXa7Dm/IrMXrRqUfXafITdJDHorajvIX4b0o6ap7Uvwn58NHpA+MaJcoMEFpxhUr5Ld4X7rvya3/rU3a3Nnfi6oPl2Ea5CPrwCXbuEt9sv8ZalwdQZcQ0G7uVd4QatTpf3XEFWHCKcSBJLwYV1Hcs0zDDrwp4wn31IJx8fDYaiNQVz66IG9RwC+CRvf2O5RjSDIkfDfA6PEiFDN+2NqHrsFVwt+VcGlTWmTLUA4y5YJx+KLKw4fjYMLuiygGo8aWcVKyR+oc7YHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCM6a2X/SeNuVhsRDK/yjnvTN2TQdO0NEAOerTt/0Pk=;
 b=OJ2odZeH4i0uA683uBRbgK0l7ncwZTaNmX/boU6roVc3FfvMeKBW3Ycp4raLW6jOL8OSpUIyjBdzRIvQ3tX+yX6c3NQlKvKvYyjMPtViE72pchJynhgDBH/SOpaXPkTNvmvyyvZKWiKx+qDOivR4L3Uesdh0f+xja8W3Yuv9frUyhU4shyjalj6fNVoY3SADqwxX5Uj3QdgXcvxMmi5K0+CavKHUhDwTftDWVKZnQH76rHVUzG68xObvzEljY6YCBA33bWMAlZdZvVEH4iZpubNbaZnyatar6idijUd4gJdCTHRFBdXpwAKsg+acaCVQZyYBXZMzmNtbljLwVcW7pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:26:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:52 -0400
Message-ID: <20230919142000.91363-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: cc314d4c-2405-4b3b-0717-08dbb91c5a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dhqF17f8nOGVXAlMqa5KzesmtpTnQmcVjuFMokm6R9tUtV8nZ7I6zd1hamo0HD4SrW+bZbDCMj2cpHYaFYBRd4hT4iHzUc7TnYvVK7zZWJKFlgLNFK183+npMX2+cseJGykOscLeCP48QLWJzbTsvC/PvZsBrkXqxE/ho83Cne6YXEvSsj9sI8anjwr6g2N3en+Ev39DCxyD7f99Z64DvfyMzpymwL9NsLf18DsxO0Bs9No/Yd/NHrYTOKa3DxwzzzFjweLszcj2TXWZsSbZHeY5Cgg7bjKBnmyAbQztsB07CTa2Bf1s2sU4GESh8RILNRhY5/9HE2AeyX1W+ZWQTYHvH40bM+ZdoVy8Oy8NXhoYZi5dja8xDQC1muhCJ04L5w5/TRoeWcsJ+lpjwCxVkE4h/CxN3mHW40uTk4+6ijPMAX1D7mYPOTEmMfYVtAfECk0+YrxnnT8M6K80CzQGomI3ExRIxt2TfEn0urxdyeNLOO+xseGYsTO5Zq+IoIZD5vfSBSYW2E3TXWjMe2yHVBDSDjWvI+TjGvygj/iWyVoMjry+5TT8CiUZ85COwfM0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(36756003)(44832011)(5660300002)(83380400001)(86362001)(4326008)(8936002)(8676002)(41300700001)(450100002)(6506007)(6486002)(6666004)(82960400001)(107886003)(26005)(1076003)(2616005)(6512007)(66946007)(478600001)(2906002)(38100700002)(316002)(66476007)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kLAIJU/7R1sC54E7bQ/nmUsrLrt63n7wgQCz1W/eFoLOneZylVzEiyBk5hp/?=
 =?us-ascii?Q?9Gcf469zFpaT9o2ekdlXmXQ1fSuoBvae7rNK+d8azq3mduDiUEp+GR7bLa/X?=
 =?us-ascii?Q?irrZ/lmBiEr9jeExhcW2tOuIiHo3QCNO4wyCM2OH5al5yiS72/+FPKvoX/Hi?=
 =?us-ascii?Q?I13FDuAQ+lElbeb6B8GzYhpQT8EOpCC5rtxBe4DTnc9AbL4ivOWLuESJHl3P?=
 =?us-ascii?Q?aJbn2H68bwsVyGLQ/UYxwGwNIs22hQVBwbbCtDgeSOSsAgw9U54MVP5J7B1W?=
 =?us-ascii?Q?Oj8lDp/R9omirNuFxNAdyZCiieNilnH8LFldG79qjp5PjrdHVdO3VoyDU3dS?=
 =?us-ascii?Q?NPoAs2bsj/dYwh8pQrqvrJH/oBJPomlpm31PtvC6oPvSBKFXX/46yx5dP/4C?=
 =?us-ascii?Q?rx/IhVQG8+NKCpKrBUmcDtdV5FrnnI+kWNuwUwBf0ZZjgO40QGVsAYqO+nwI?=
 =?us-ascii?Q?cDlLRq3uL8quroCZhKGEN/Ly2Yd60QheWbNttcSbe3ct+ccnd2c7Z12pGqWD?=
 =?us-ascii?Q?IaLlD3dT2M9+LthPuHei6zHV4dHQVhyg7SMNMnDV+r55AMGRH1WZruf/f4EB?=
 =?us-ascii?Q?OH4Ebnmm9YYCWzQOO9F+o7TO7fkTgjz8mmMAvu/m/BIHJ1EUjpDxq8mVqcgi?=
 =?us-ascii?Q?yRZnkMTj3QsGS2tueJBthH9n0gCG9Z13rYBMJLVomEzbpvRi5Hwpre1jgUiD?=
 =?us-ascii?Q?3xlaiGsM3KxrTda24Pu2EIYql75NH4TxqV4pxrpLmaBzxtLH1foX5BXQHYTZ?=
 =?us-ascii?Q?WxiOcVlH1B3vNsrBbMiK26OPocpSAKykXzwmuIRFXhAElouFgLDOQGK0i5zo?=
 =?us-ascii?Q?gAGa70/7BYJ5NNYfeP4/54RvvN/6aKnUqpzivbv2+lPVqsilpIEUF+jAaKRp?=
 =?us-ascii?Q?EaR9bYk7JcMwEmnMhfDv5h4BiYk2RfgVTIo5cNTBP3hU/tBEvR1wyIZlWQp6?=
 =?us-ascii?Q?Ku1u+jqcdxnCmfoaW6dqwLC+1f1R93rIt0I57BkbaVUiZpJskMg1FisY89cz?=
 =?us-ascii?Q?ZFS2aXNdxD3doH3w3CBPuvGR/1SryhnwH/GvX61ZR37qRA3qiWi/EcPiQTtY?=
 =?us-ascii?Q?SKBvp1TF2a9O3YHUglIgj9AICklM9LHajGne3cDIH7IjayKk6el4QQuC9iz2?=
 =?us-ascii?Q?QvWl4xHtdQ4S5hX8ftaLcafljeL6Kx8pyt6U/3a+zPBg1e7D8TJkZtQcRm2K?=
 =?us-ascii?Q?V2LDtuqQRMmb5EzJoYla6uMSuqBcplX5V8u8Wjyu31F1syqwG/YiqIWAkZGZ?=
 =?us-ascii?Q?WhaOUmP6m5uR0qxCkP0/y41jUWLMp/V0H/ikSDulWfDw7EATKPjgH4uG0xQ5?=
 =?us-ascii?Q?cho2rxtYh7JD2swrVnawN1tP2hwQlds0LQfGyXkP+Tt/UiGE90ZTA/4xGH8G?=
 =?us-ascii?Q?2XFm+UlKdRdJ3dUwgeG53PefUie0jfFEMm0nly8Po4Ktz45Myz4nfFMsU+rJ?=
 =?us-ascii?Q?4U+7VgNYM9AzblbXjPL93s2ayXq/OQTqEA16GpqoxzJtD/je6qTH314Ocy2B?=
 =?us-ascii?Q?aqhvjmj2OyHjYWBZ+MnvEakG+nivEX7vmr/acFb8hYoaSF2VyKGbrxndH5B/?=
 =?us-ascii?Q?V/OUiJm/fj37+Wx69AEubVgi4uEacrWMfaQOnCsAK+3yvnYF0srXnE3XXAoy?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc314d4c-2405-4b3b-0717-08dbb91c5a1c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:02.9058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKVZVUYvxqjqo+7IxPdfmwyqFJSKqL/D60xBe6Oxkzcj9Yi8Y1klWY0TYcd2yxZHDMkRtgIKxocv8vAxHkyuDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 09/16] drm-uapi: Kill
 XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
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

Align with commit ("drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h     | 23 +----------------------
 tests/intel/xe_exec_threads.c | 14 +-------------
 tests/intel/xe_vm.c           | 13 +------------
 3 files changed, 3 insertions(+), 47 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 66acf49c4..336b77074 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -555,23 +555,6 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
-/**
- * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
- */
-struct drm_xe_vm_bind_op_error_capture {
-	/** @error: errno that occurred */
-	__s32 error;
-
-	/** @op: operation that encounter an error */
-	__u32 op;
-
-	/** @addr: address of bind op */
-	__u64 addr;
-
-	/** @size: size of bind */
-	__u64 size;
-};
-
 /** struct drm_xe_ext_set_property - XE set property extension */
 struct drm_xe_ext_set_property {
 	/** @base: base user extension */
@@ -592,7 +575,6 @@ struct drm_xe_ext_set_property {
 
 struct drm_xe_vm_create {
 #define XE_VM_EXTENSION_SET_PROPERTY	0
-#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -677,10 +659,7 @@ struct drm_xe_vm_bind_op {
 	 * practice the bind op is good and will complete.
 	 *
 	 * If this flag is set and doesn't return an error, the bind op can
-	 * still fail and recovery is needed. If configured, the bind op that
-	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
-	 * Once the user sees the error (via a ufence +
-	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
+	 * still fail and recovery is needed. It should free memory
 	 * via non-async unbinds, and then restart all queued async binds op via
 	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
 	 * VM.
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index b22c9c052..c9a51fc00 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -740,7 +740,6 @@ static void *thread(void *data)
 
 struct vm_thread_data {
 	pthread_t thread;
-	struct drm_xe_vm_bind_op_error_capture *capture;
 	int fd;
 	int vm;
 };
@@ -772,7 +771,6 @@ static void *vm_async_ops_err_thread(void *data)
 		/* Restart and wait for next error */
 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND,
 					&bind), 0);
-		args->capture->error = 0;
 		ret = igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait);
 	}
 
@@ -1021,7 +1019,6 @@ static void threads(int fd, int flags)
 	int n_hw_engines = 0, class;
 	uint64_t i = 0;
 	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
-	struct drm_xe_vm_bind_op_error_capture capture = {};
 	struct vm_thread_data vm_err_thread = {};
 	bool go = false;
 	int n_threads = 0;
@@ -1054,23 +1051,14 @@ static void threads(int fd, int flags)
 	pthread_cond_init(&cond, 0);
 
 	if (flags & SHARED_VM) {
-		struct drm_xe_ext_set_property ext = {
-			.base.next_extension = 0,
-			.base.name = XE_VM_EXTENSION_SET_PROPERTY,
-			.property =
-				XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS,
-			.value = to_user_pointer(&capture),
-		};
-
 		vm_legacy_mode = xe_vm_create(fd,
 					      DRM_XE_VM_CREATE_ASYNC_BIND_OPS,
-					      to_user_pointer(&ext));
+					      0);
 		vm_compute_mode = xe_vm_create(fd,
 					       DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
 					       DRM_XE_VM_CREATE_COMPUTE_MODE,
 					       0);
 
-		vm_err_thread.capture = &capture;
 		vm_err_thread.fd = fd;
 		vm_err_thread.vm = vm_legacy_mode;
 		pthread_create(&vm_err_thread.thread, 0,
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 75e7a384b..89df6149a 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -324,7 +324,6 @@ static void userptr_invalid(int fd)
 
 struct vm_thread_data {
 	pthread_t thread;
-	struct drm_xe_vm_bind_op_error_capture *capture;
 	int fd;
 	int vm;
 	uint32_t bo;
@@ -388,7 +387,6 @@ static void *vm_async_ops_err_thread(void *data)
 		/* Restart and wait for next error */
 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND,
 					&bind), 0);
-		args->capture->error = 0;
 		ret = igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait);
 	}
 
@@ -403,24 +401,15 @@ static void vm_async_ops_err(int fd, bool destroy)
 		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
 	};
 #define N_BINDS		32
-	struct drm_xe_vm_bind_op_error_capture capture = {};
-	struct drm_xe_ext_set_property ext = {
-		.base.next_extension = 0,
-		.base.name = XE_VM_EXTENSION_SET_PROPERTY,
-		.property = XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS,
-		.value = to_user_pointer(&capture),
-	};
 	struct vm_thread_data thread = {};
 	uint32_t syncobjs[N_BINDS];
 	size_t bo_size = 0x1000 * 32;
 	uint32_t bo;
 	int i, j;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS,
-			  to_user_pointer(&ext));
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
 	bo = xe_bo_create(fd, 0, vm, bo_size);
 
-	thread.capture = &capture;
 	thread.fd = fd;
 	thread.vm = vm;
 	thread.bo = bo;
-- 
2.41.0

