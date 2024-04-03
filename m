Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B317CD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 15:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51BD112766;
	Wed,  3 Apr 2024 15:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSTasNC9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F5010F417;
 Wed,  3 Apr 2024 15:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712157460; x=1743693460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+rW8CqN7H7NiWX4FyhKPnnYqY4vS8dEjbFW03pl4AxE=;
 b=HSTasNC9v/2JA8+NkW4blQPWkBEkgmc0lvtOSkYwlGG5Jn4u300ZDAlO
 q4CaVjFz/2nf9NASnicnjBPBpzCT22JQKbYm7rNMjDHK4biCvDG6qgz8z
 +9T8MA7NGH0Z/2rnyEAFsdDrAeHFIHcT2TMxJXrGA8JVmzS/ALjvGeaGO
 3Kfkg2sqdNRBCHvDSTo2dsP4e4XfH293VJsmzwgHVTn70A9AyMRl+pRa1
 H1uoH4pcFBA/06Uh+WASXdtKqL/9q4vcpsKQUwaPz2oSDdI7zDIrMiTqj
 6LbnjO3zEsdXjO1AaqmbiQMR96bo+38vb6AkekKZWeMjgheBfK0yE1V9B Q==;
X-CSE-ConnectionGUID: yMnYjm4bR3KQWqQzGTzaNw==
X-CSE-MsgGUID: TBTvRcuARJy9CThtYtd5bg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11174106"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11174106"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:14:27 -0700
X-CSE-ConnectionGUID: HsF60FlDSM68fKbQl/8bCg==
X-CSE-MsgGUID: +Z+sjl2aTSOJ/kyQGe4kCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="23108507"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 08:14:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:14:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 08:14:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 08:14:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLD1HNlRHqD33l9qMJhJSVCRI5Z02gQKcI7jbJixL1+RIHBFJECtAqqKRgjY/RGPFtgipLYyQC+SL2d6bb6TjvAfpWXYMAFLsbQ+x1/9S2FDF0DnAHP75LGpTzA2m43os8UFOg5ODZhdwN+ykRz2hN2GSUVUy1EuNxilu6BuwLhJda9J0gvJYegYQXwuBV+9+Kog7RNa1lUXCLF3N9yVO/NPai/I0U2VJRcxiIyYMLVzR8hEjWk8q2albHkLAeBA0x6pqr5olk6r+wb56BodJdNwR+C0+Dnrci9xjVatEmdi9XapEi2313wnO//r+pVvhM+LWK+RrvFcx+tHdnaZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSbM1ItKc1REo8okgBMCsud6+8DKPWHz84yuEoDHBDs=;
 b=QgrPfGleCpK5h8pomDY1tIh5+SmvaPFTF+J7vS4DZpOzXA7nHfSAEQaPqOCFhjUg1QlCsz+pdH3fb7g2Hj7NmWOXs/cHfObw4TLefqZ8CQTNoABFRLkQRytWIGjMLT+Nq4pwUhX1r+jOiwXBUodW2SJ9JiEVUZXY4XYUrh/HaOtPyKpIInpoPXgofxibmrs01d52WaVgPKWx47LGaJpANp7YP8hJCm5rqwA1XNM20sffDxsRUeQMt+p0GCG/E1h3kMg2pfuBzKCgF31og9KD31vDDIuuFMRsuMR5AaNnbUDrAk+yazbeDCFFfDo9kXoO28urKjZGDohrEkjD+OC6pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 15:14:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 15:14:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_wedged: Introduce a new test for Xe
 device wedged state
Date: Wed, 3 Apr 2024 11:14:09 -0400
Message-ID: <20240403151411.113159-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403151411.113159-1-rodrigo.vivi@intel.com>
References: <20240403151411.113159-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0028.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8665:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: esmwSsQbuoG4y5hpaUmlyHviOK+jK55d5qoiiGmeqg3XvAwOHXcZv4p9hhS97drPtZFaLBjzXJGB+XCIv5OFCi0q5+9wqe3bI/x+38/JA6o3plq3XMCwmZXvV9H16OEzUoR7uUfnYk8+l/T7y0wQIjnQTznovHItEJyxdkzvBDKEULDH8e8wsd4B0n09fK34qbmpG0R6t4663hspKi9ExDsS8jWutNohtpjVg6Qb7lV2EFIcct6+5Pw4ZTnadhf4eyyqQS0gYgIhQvVTs0Mrxqxs/DMxqbqR71kABoLu0/liQRY3lnLhcMN8fREj3KoR43szuWj/6xwusrLvuhxQ8lgkt9loeBynwfaMEoIo/J7nmfCHSFJ1rb4bXp8pMOe22sz1vfxT/Y8ISXIuUXxQXR2NeS4naXUHtirrbBx/8NdLQutgUs1tyD7DqSe9SaJ/bB0RHq81wzk3omSchTxyDdGsAB8Sez0X9wknEsk03ZnwNYRpAPFuEYEgB5bo23O4qxhlf8PNyLSwTeMs3aK2vjuS0d+BNeHhDPjbj/3DST6giiDeGT8iOLgtwpAGfK246nzmHEKbbS46Nusyc/SMQhwVfZJ6DkQSv+z75GMJHXLO/20oeZKOraBKAMg79FDWb9V9B3UFlTRiB5AGTnCTqYPXZ4ZFsbKFapl6MZinJqg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEw2SDI5aTNkWGFPYzdWTkxCMnlkQzZTaE9vMXhyU1B6N2xuRklyRmphNmNV?=
 =?utf-8?B?VHV5Z0NJY0JTU2VJVEo3R25iemJIa3NkTXZjKzdpUjZmc3BOOCtJNERMbkp6?=
 =?utf-8?B?MWVSNlRkRU9ISGE5eWd5c3BsQVpPQU5rcDVHWEFSNkRRRG9wQmp5TEMyVWFv?=
 =?utf-8?B?bmdJRCtJY1NyRW1mcFg1bmM1VmdEZmZoZGZoRXpBZFZ1cS91WWluWk94c1Jv?=
 =?utf-8?B?clVVNkZySVRDRHhETVZzMjFWcktLMUpSOGxGMTdaUHE5OUdJYktVaWdmaENl?=
 =?utf-8?B?N3FQSHhyRDQwSSszQUZuYTVZYzFrTEVOVkkyYVZJeDBGSkNIQ2pFeHFMUGQx?=
 =?utf-8?B?aEQ2bEpGOTVsMVZsUDhZUzNIU1RCSWlFUmdWKzVwMmlFTTY5QTZIb0cwNkJu?=
 =?utf-8?B?L2wzam1mZUx2ZUYrMERXcmgzckc0L2NaV0NUOE9mc3JoOW93WnlyZ2NNK09w?=
 =?utf-8?B?cURncGFXcVRxbG5vSHUySnZuLzJLOFIrcFN1b2VaMVdZcTNML3JvWWZFMU43?=
 =?utf-8?B?R0lZK3BBcEoydFdSbnI0OVNjOXZVaEFEM0tLa3c1bjJaVjBKZE45a2Y3eHFy?=
 =?utf-8?B?Ylp3a0dvZlNJaHBFYVBPWk5qang2UDI1ZzNQOXd1MUx2bDUvSnA0Yy96NUN3?=
 =?utf-8?B?WlNiZm5qcTQvRk1QSERqeVNQTy9TRzQ0QjhsYzBZQVBNUk5zU0VVSzVFZ1ha?=
 =?utf-8?B?TnVXakhKZ0NqeEdaMkF5cXVOdFQxb2dOdFR6eWtTNXNheGtRNm5FamhzaDda?=
 =?utf-8?B?NS9GNktWVXBxcEdBOGxjSnY1OUFRTFpxOVRxUExrSCt3K0Y3QmJlUHp2TmJk?=
 =?utf-8?B?cjJDMmQwTTJMRWpoRjF0TnEvdlkvaU12UzhXUWI0TzZSa1dtd0NlaCtEamdE?=
 =?utf-8?B?QUp6dWcrRDI4Q2NTbkt0R2tkZUdEU3pSTk1yRmFnVjNNZDZURFMrci9peTZq?=
 =?utf-8?B?NXc5K2JWalBtQTJQY2IxTENmQ21tendwUFhGK0hzK0dHQlJ3M3l4Zm1GeGI5?=
 =?utf-8?B?a1k5Vjg1WFc4aEY4aHZUOWpicmJJYTlBVFlTaU5JVjBzWnBoUHhzVUZGVFFE?=
 =?utf-8?B?ZmVxNmlOS1h0dVUwdWJ2YmpacWV6TVdIUWZsMnlLV3pqaGxUSENZK2tkcURF?=
 =?utf-8?B?azZPMm9oVVlVUlJhQ1FwdnBYbnBhRVlwNUIvWHEzRFA2MlRHdDFXZkRNNlB0?=
 =?utf-8?B?bTZvSS9SUjZDK2pBaFJIN1k0Ri81bGtEcm1DTGFtQUJGL3ptUXhmMVF1cHZP?=
 =?utf-8?B?NElBYzFyZXgvaTFCVDhtVVlKUmlHdUVmSW05d3UzYTVjVHlhUE03VkdXQUIv?=
 =?utf-8?B?S3dMQ3RRZ2JWdEh1WHhHbENLWmp1Qm95QlVwYWtOT1JpaWxMdzFtMzZzZ09M?=
 =?utf-8?B?MERiblk2SW5talpLazd4cFF1YW9HVW5LbC9icEFkMmpyeXphU0Z1dFlYaENC?=
 =?utf-8?B?L3NuZHJVSGpXblpxdVM2azlEd2xoWlV6b040T2xxbGNUeGdia0R4eXoxdEdn?=
 =?utf-8?B?ZmNMUVBWb3VnTVovQ0d5TjVjbGtWM1dSdG9IUE1GOFNpaXp2U3dOck42LzJE?=
 =?utf-8?B?bHR6T0I3TmRRREJ4TjA4cnoxb3BIS1FvVHAzSTViTVhyeWdkNDJQakVsOGsr?=
 =?utf-8?B?VTBDeWZQRXRUVGlWOE5ZNWp0WGdDZ3Q4SjFieUl6NS9JT0IxWkUxRmhCY3BN?=
 =?utf-8?B?WDBHR0hvZlVzS3lESGdicWR3ZGdwaHdKaUt5bm1jcjhMcWtyT3pkVGtJelZv?=
 =?utf-8?B?ZkJ3MzBCRXlQK1JaZ3R6bk9uWnZtWEVVRCt4ZlZLM21ZMVlWZ1ZTWm1JWDBH?=
 =?utf-8?B?SEk5dDNoYlRubGEySlJWUWc5WnVHa1VuU3NXNnh6SnB3UU0yRDJONVJGcTR3?=
 =?utf-8?B?YzhyUjdxTXFzcFNKbFJNRTE2VlZQRFZyb3JhbTkxSm5rcVYzdmdrb0tkbXFN?=
 =?utf-8?B?UFJVTW9pWWFDbXJweHhPaUJiS1g3Umd4dkx4QWFZdFhxb1ZHUC9ZSHNtK21J?=
 =?utf-8?B?ZWUydUtKWFp4cnRKRmhuZ2kvTjBhbENPc3JsT2E1SDRXRVBNNWxoZjFaR3Ux?=
 =?utf-8?B?ZlJtWGNnd3UwNlEzMWhxemJIZkRWSzNlWWl2NUkzOTBNNml5WFNMTWZtYVZY?=
 =?utf-8?B?WnRRWnJyWDIreGVaenlUbkNuMkZRYUh2RlV3QW52Qnkvei8vM2hKMXB6WXVG?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d71398a4-ef8f-43af-e1a8-08dc53f0beff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 15:14:24.4881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9sZojqFC4yR5OB6AJ7TQI1wJqUddstkSUiEZ74Yef7dNJXRbdOu3uYfmxLeZMdbjt1PXCp5Wordcmpj1P8olg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8665
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

Let's inject a gt_reset failure that will put Xe device in the
new wedged state, then we confirm the IOCTL is blocked and we
reload the driver to get back to a clean state for other test
execution, since wedged state in Xe is a final state that can only
be cleared with a module reload.

This new test case is entirely based on xe_uevent provided by
Himal.

Cc:  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_wedged.c | 91 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build       |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 tests/intel/xe_wedged.c

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
new file mode 100644
index 000000000..f767e2511
--- /dev/null
+++ b/tests/intel/xe_wedged.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: cause fake gt reset failure which put Xe device in wedged state
+ * Category: Software building block
+ * Sub-category: driver
+ * Functionality: wedged
+ * Test category: functionality test
+ */
+
+#include "igt.h"
+#include "igt_kmod.h"
+
+#include "xe/xe_ioctl.h"
+
+static void force_wedged(int fd)
+{
+	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
+	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
+
+	xe_force_gt_reset(fd, 0);
+	sleep(1);
+}
+
+static int reload_xe(int fd)
+{
+	int error;
+
+	drm_close_driver(fd);
+	igt_xe_driver_unload();
+
+	error = igt_xe_driver_load(NULL);
+
+	igt_assert_eq(error, 0);
+
+	/* driver is ready, check if it's bound */
+	fd = __drm_open_driver(DRIVER_XE);
+	igt_fail_on_f(fd < 0, "Cannot open the xe DRM driver while reloading xe after wedged\n");
+	return fd;
+}
+
+static int simple_ioctl(int fd)
+{
+	int ret;
+
+	struct drm_xe_vm_create create = {
+		.extensions = 0,
+		.flags = 0,
+	};
+
+	ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
+
+	if (ret == 0)
+		xe_vm_destroy(fd, create.vm_id);
+
+	return ret;
+}
+
+/**
+ * SUBTEST: basic-wedged
+ * Description: Force Xe device wedged after injecting a failure in GT reset
+ */
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
+					       O_RDWR));
+	}
+
+	igt_subtest("basic-wedged") {
+		igt_assert_eq(simple_ioctl(fd), 0);
+		force_wedged(fd);
+		igt_assert_neq(simple_ioctl(fd), 0);
+		fd = reload_xe(fd);
+		igt_assert_eq(simple_ioctl(fd), 0);
+	}
+
+	igt_fixture {
+		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
+			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
+			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
+		}
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 02cbc3780..12dd2c16e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -311,6 +311,7 @@ intel_xe_progs = [
 	'xe_query',
 	'xe_vm',
 	'xe_waitfence',
+	'xe_wedged',
 	'xe_spin_batch',
 	'xe_sysfs_defaults',
 	'xe_sysfs_scheduler',
-- 
2.44.0

