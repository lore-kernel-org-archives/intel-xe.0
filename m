Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3D9CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 22:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDD0112FB9;
	Tue,  9 Apr 2024 22:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNZFeRoH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FD0112FB9;
 Tue,  9 Apr 2024 22:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712701166; x=1744237166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VYnmeZXedOeo3H0NUrqJDzNgFdfM0yZX7DjdRug6hVg=;
 b=gNZFeRoHqx28KJs7l6MoKqXfRBTzsvkU3yVQ8Enzo9ok3FbCCLXC/GZd
 yl1p5LmOq4SUT3UzpUz2fxMGiL+O/UacwGPAuXblfan892TnEttzfIY50
 ZhE/OJZpKWVeYu8B3mTkO4+S9il41yblNEDOgaeUNH9vgsrMr7FGYBbAX
 Du8BH+LseYxwuslFRjJu8GnTwfj5SEiSdPiAk4QkgA4skYliFWjfyqxwF
 DFppIGPWDlk5ZN2u+ILo1Jp2sAybcTzSUcnD63vjF1pnLiATcGxeYCXLd
 ZPFhl5yL33I+hQH7BL3OxT8+rJewpKsyruK6xoCVk1+v0U7Tmsyonb3NP A==;
X-CSE-ConnectionGUID: HeegjzgsSQWYvKxqcJ93fQ==
X-CSE-MsgGUID: t8zAwpgESRSKvB3+DyqyRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7955631"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7955631"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:19:26 -0700
X-CSE-ConnectionGUID: I83uTcQ0TEWZfqK6EFEoJw==
X-CSE-MsgGUID: i99MfwjRShuFcmV2n/gpkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20469177"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 15:19:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:19:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 15:19:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 15:19:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WH3hiz/z14LIMDAJ6MX++hEhqlF1Nb6le2mt9medydJ0AY6O6WwITXw3Kv3x9kRmhCynKfId2FrLEu/CLEJThIP8pYeSZJaeHb20eTrvWfrcKXD76gS6zKwRyHXf5Z8MAhwFd5UGQko+l5CLGfqYsFQzWb2Kavj72Wv1qyYHhP9JBXhnYeM0ChWb6l/kkm8J4WnLU31m/sUmoQgluYCkHR9BOdSePPII/ZnyY4wkE8VuC9L9+xLTWplj2A4vip/Ti17AcvyfMyPoNmnYIShgPLre/TxFY1JtxAm/rvLhsqhq7PWQdGDGSwzLzBa6eWPmzSWMPjyLL1qC/Hq+gaixJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SJ7t4RULSaiQpY3+6yHaoRe2MnRHlT3uDgTUn90nII=;
 b=QcNKQAaMKCPgAHt8uXmU0jEgC0CvSXiG6Kd85oXWs/z+vyN23Gxmkl9ysMsHos34oqr7P7EHULzYG19RDE+y2WlLnxf7yklMsYzxL7KXYCkdDMuQJ4CafeTb2LhrPNAhH2GZfZMNlg8lBgOUyWLKKYrmjsHPjtnB1J0+tkgADDDw5Xze9+EcdeZled3Z+uvmog7AyZ8e4ZkHJY6bs1uk/FnMU2ZXlSLNnd0zcOlDZcGi1+XMczAEQKYxngPHR9s8tbIu1yApTEpPrAe/t02urThblk57xL2ZBua7E6fjKD05giIDG0H3p2jCDNjiTYYai1dhMn31W71m0B+kfC4OvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 22:19:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 22:19:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_wedged: Introduce test for
 wedged_mode=2
Date: Tue, 9 Apr 2024 18:19:06 -0400
Message-ID: <20240409221908.1077893-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409221908.1077893-1-rodrigo.vivi@intel.com>
References: <20240409221908.1077893-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0084.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6959:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6mCrM44tcyFcUhBA3pqUdSb6uzQR0k9KL831Ia9i6aBpVmLYOCY+99yhaSYELukk78jndpg1wuItxjoS/03nm8A0U+rdz8/9jrevbP32fy3y/xSiFWy19hifukKe3NvWVtNPCnkWaMRGVuD70R8o9SYyqw1eZ/zo9FjLgw3myyaRDcdpLp6v7lURDR/hwS6jhaIF0oOHMaHhEHnn7cLU9HEDlTIFEpNr2RiRVaIQpaOijyKTb4u06Hbe/JzXTzCqo2TOlid7djWr88/hgnj6L8X2KKl+gUE1YOiNKBE/gessAI7AB6D64ZSY9PdpxguX3VUi0ZkyuuvBVEDtWr+ZbxQdfmBz3TQ32DN1itFWWtLD6jbSDY8/pnhMqOkjvTVcg7mDJbgPOmYv2TcXQdkMmrSJP/WtTSWFojG6ormwXp99jJW7M5/7lCNKeAyWJBNhM4U64Acw2fhKwRYLh+zEx1VbMjMx2Ph/BrSXu3drjINj/ESNa3Fb4m+0646cA9arkKHN/lcVyGvBLRioSj6o6/QzRETSlgUutfEwnkA0YVIWtiZm4vne4IF2+ueeVAJQv00WKRTQ18+VW4m05oGfyTxMvOain0kmTq1sfCgpWjXsehc0vGXejY8Y09lFW7V6xbq0jK/8YKkzCQ+LmJ7+i2KZpNfjkYI/7Q1Vur8kNDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p6YQAnMmQrl87CoofE8UlD/015IaBICU/HhzFj0hLOhmAhJ/J2lBZMskTc8D?=
 =?us-ascii?Q?7M+D0lDroJwWp6ShFP43oZazGJRS+95OVeG2OSujAJJqW1enP4+B2BaWhgWz?=
 =?us-ascii?Q?B+zh2ffnggykyUMvYYJi3DosEdtNHqP7aatLnyjqmqbjsrNA/YmS7DXI1iUW?=
 =?us-ascii?Q?BqzOMtj9y3u90Id3HgKRyARgT1iOKB6g1QzIQUt04S6x/D0khIohq7PbpoCN?=
 =?us-ascii?Q?sSqUl8//IcZGGHbKhveNecV+jeB2L93C2v+QDYwlJus9xWJ9f3aprpDqtRIJ?=
 =?us-ascii?Q?9uPgxwsOwwUWGUhKytDg7A2wc56lgsBxjh+S6+UzgcbaHStfhegIKljghFGL?=
 =?us-ascii?Q?+kAtFOaTHeSh8S/AQfS5BQkA1qGC5khMv8CwpYr39fpRGtKJhttVRMvVhLQQ?=
 =?us-ascii?Q?3LJBBNgViBUvTkQOCso5grno4/s9xefzbguEvUOH9VAAPupOCmdEIxkxs6dD?=
 =?us-ascii?Q?wOO9A2ruy+Qs4wGFeZNBVmPY6dWNwAEGTE9zb3rsnFBd+rLD8PFwkgr3VxaT?=
 =?us-ascii?Q?vqnamDkLmb1AFdWtv05vc91bXcZhoiQlTlLm6R9cMkNxSdAe26UH0YQ/51Xh?=
 =?us-ascii?Q?4LuT2D5uWCD1RahbpbUW99NIFjZstluifeQ+4gVkxxiTeiyXTndHeiwr36gI?=
 =?us-ascii?Q?/5t8x945+09IFvIwhJ52PB/POd0Biq7k3Cwatv6Nlb3GlRIf3zlwZUfeyIlF?=
 =?us-ascii?Q?5bXxNd3CW5xZ5XaxSQ1/0k9kPHEbJUq22xKyFo1rWVeVF7euq+Gvx4sVe8vx?=
 =?us-ascii?Q?FbBTfQ7rRjZ8fsABYk7TQnbQc7Mv6XEzQsv8VfS/svrUNkEKYA5ihNpX2hqS?=
 =?us-ascii?Q?rBoAHAAA+0fNQ1g/200zgjlpsKlGB+RPbzkWFFFvNl6TQ+IQfhZLX36FvSyx?=
 =?us-ascii?Q?PtHS8dXhv4gq0aDBQIpe9TrfmSs9tFLvotoXD/O2Qq3RtU+HdirUKOSDQgTD?=
 =?us-ascii?Q?L2CW/sSE0zbPd1EKXLftfML+Q2jrVWBDOc+VI1zRf1lqPuLt+8NyTXSV4xD/?=
 =?us-ascii?Q?gyjyX3hNOksrVnMbEccYStN24EkaMvP6frTINgD1RsFDvJiZ0gxMvcVJKiYC?=
 =?us-ascii?Q?Fbh91/1STGxe/8y/3EkvK6NyHgnoy0jJ20kbUE7gvUWv+ZViUzwc4W/MbSck?=
 =?us-ascii?Q?J6zN6USCIGRWgaSi2sSObjITlDOiHrGJ6l5Ql7BJ8MxAKtpxfdlTFpyi0FC1?=
 =?us-ascii?Q?zEDCeT5OyJD+2IzpEoY1zFFpB/rzdWRV4kW9+MFEJD5/8iUN4i8F/NNafKyD?=
 =?us-ascii?Q?+YJziz14FELeadLjfJxaRRGPeMeU61z5XygZ1ltCNhgslR33gMo43fI9NTbO?=
 =?us-ascii?Q?anbgYx4cpzHNVs4FwALCEQgYs5XnDbtKRQlf1M0lrQGXTCUI9DD/jXbChb/R?=
 =?us-ascii?Q?SEUq3ptHWSzwwWXhGZmdCu81xEH3wsl+OYlKhm7rbFugcA3L04lgBoVEunrv?=
 =?us-ascii?Q?MCNq3KKiyzrXZ0Kr9eIWh+JWqOXjfUe0gHDzG3He7mB3uSrJAwDyO5w1gUsn?=
 =?us-ascii?Q?fpqofACotO5fg4HAmj52y8Xqi/0o4T7dPI+8dvU3CFsfQPsdW1sz3bpoa+bT?=
 =?us-ascii?Q?cQMTH+3MbALWLazNlrhqVz78kHKKFIrR6bGa8ZyaqbfF7CeYAbAkAaoNVIRu?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55527253-6eed-4c99-1788-08dc58e31b68
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 22:19:22.2996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuvUT3+QNLEH3fbcNabfC7q3iZJOHPzgFwofuNduZUaMMZ+x1G+9+gwmBO+nuYOYifw+vw0rLLCRXNqtnStX8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
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

In this mode, selected with debugfs, the GPU will be declared
as wedged at any timeout. So, let's also introduce a command
that will surely timeout. Based on the xe_exec_threads hang.

Then we confirm the GPU is back alive after a rebind.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_wedged.c | 69 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index ab9bf23d5..35fc905e7 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -162,10 +162,60 @@ simple_exec(int fd, struct drm_xe_engine_class_instance *eci)
 	xe_vm_destroy(fd, vm);
 }
 
+static void
+simple_hang(int fd)
+{
+	struct drm_xe_engine_class_instance *eci = &xe_engine(fd, 0)->instance;
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_exec exec_hang = {
+		.num_batch_buffer = 1,
+	};
+	uint64_t spin_offset;
+	uint32_t hang_exec_queue;
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	struct xe_spin_opts spin_opts = { .preempt = false };
+	int err;
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = xe_bb_size(fd, sizeof(*data));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+	hang_exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	spin_offset = (char *)&data[0].spin - (char *)data;
+	spin_opts.addr = addr + spin_offset;
+	xe_spin_init(&data[0].spin, &spin_opts);
+	exec_hang.exec_queue_id = hang_exec_queue;
+	exec_hang.address = spin_opts.addr;
+
+	do {
+		err =  igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec_hang);
+	} while (err && errno == ENOMEM);
+
+	xe_exec_queue_destroy(fd, hang_exec_queue);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: basic-wedged
  * Description: Force Xe device wedged after injecting a failure in GT reset
  */
+/**
+ * SUBTEST: wedged-at-any-timeout
+ * Description: Force Xe device wedged after a simple guc timeout
+ */
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -188,6 +238,25 @@ igt_main
 			simple_exec(fd, hwe);
 	}
 
+	igt_subtest_f("wedged-at-any-timeout") {
+		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
+
+		igt_debugfs_write(fd, "wedged_mode", "2");
+		simple_hang(fd);
+		/*
+		 * Any ioctl after the first timeout on wedged_mode=2 is blocked
+		 * so we cannot relly on sync objects. Let's wait a bit for
+		 * things to settle before we confirm device as wedged and
+		 * rebind.
+		 */
+		sleep(1);
+		igt_assert_neq(simple_ioctl(fd), 0);
+		fd = rebind_xe(fd);
+		igt_assert_eq(simple_ioctl(fd), 0);
+		xe_for_each_engine(fd, hwe)
+			simple_exec(fd, hwe);
+	}
+
 	igt_fixture {
 		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
 			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
-- 
2.44.0

