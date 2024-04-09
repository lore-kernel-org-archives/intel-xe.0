Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69F6CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 22:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438FE10E659;
	Tue,  9 Apr 2024 22:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeCeDeaR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C717A10E659;
 Tue,  9 Apr 2024 22:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712701158; x=1744237158;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=No0agqzvkndvaw5NB+3iLled5hLHf/WxnJ+uo+pSRfM=;
 b=jeCeDeaRcv1Fx2IxnuevK+pekJTblrk0SIgCtqPJmSMcKCmQ3RLD1U/C
 0GjXRI7PeWdL31swTQFG76z+j5ejX9KDp4BF36/yYiisVmPIlCXjFEKz0
 uqjo4gQuRm+Eny5QBVPbuUD0D3U2GhyadAJwUuXDJOos2CPODMQlkcDk/
 6gUoF0p+wBT6bF3gKwCY6lgeMtDJedR3f98nUSq4B0SncFAiiJj/kZf+1
 eH0FQvaCBw7YFsuwQfWDNuODpey4ex5tvXGEb+0PvHcbW4bGLFQ2HVi8P
 FFkAcx+ga2ZchKhqFPVfrG/07T2xOE4TBKPyqQ4QbK6UIi3ya1HpVlzvI w==;
X-CSE-ConnectionGUID: wKCpOaD/ScaQN+1d28EszA==
X-CSE-MsgGUID: vzIgAnclSzmdgiduwHY/YQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7955619"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7955619"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:19:18 -0700
X-CSE-ConnectionGUID: KRwmRubKScaZLq0jXp5CfQ==
X-CSE-MsgGUID: hy2pa6LoR0i57v0SZbOGXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20331464"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 15:19:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:19:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:19:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 15:19:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 15:19:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsPXX1TUjx6YNakXbEwgOPPrZBXWMoljTb4GX+RYuzXn1vkpDIf8vxX0WPiwTzX7DWQWgErHohlljSnkEXul4+HSezK6iuQT8olrmE5oHWYIu7GjUPmkrR1UT0vxe4wXSe/NENK+e9twZE7pKAnHejz0v7kdRylqMjKyvWUt6R0vkFJYNlcqlSLM4itdmxe/9ufGWdbLRosbMdoBanXFWQaVjdQ65OAl3H6slBwLbGynYvfOWgF1pEl2jlpoXD1a153/7/fPvAtISG1RihEkCLA/tbyFRD4hNWEiiFn8DVgKE7GImWkBzkta3b8mA6Me9lCofervJ0G1LNL3ovVXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxVpbzFNGA29GSMZD/EUUUgNJrSt+G4LH+LDM5BP4XE=;
 b=G9SpzwLK3D8Pmfr8QMxqEEZBR2C0wOhZqEGMJpombwHgysjV2uFk2nVkgXE7+STKklgJ04Hdc+IJn1FBo8IBCocN3WlkvHociAJrlCwVfTZzGjys2F8WiWoa6XzcLw7ddzHSjwWryZbPYWnW71POiEBqTjCo4RrmlgIp+dzdzeYeQK9qqtrOudC33KOdULgbqp3Gn3fWmcqXW5KHHxCY6RAW/vGNGiW1wsAtiuYawrOkEBh+qMkrkr8FC++olWKSAUK/wn+WddU7w0lUiU1Nrz/zYtKcpM6wzqtwkkn6zVKQrY/YYz4xdxemvZfSsuBvpBH+4AdDsUjWpbKOydC7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 22:19:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 22:19:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/xe_wedged: Introduce a new test for Xe
 device wedged state
Date: Tue, 9 Apr 2024 18:19:04 -0400
Message-ID: <20240409221908.1077893-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6959:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Vf9x/+B4ASeMJL9cyYukd6LW5v9D4Tfh4BHKDwCaHZwoM0V+RqFjFWzUyuv8vYRA99/NYbhYv//Va7/cP26ysDY40wM9ex28vGevgUdjUQYfjJBOoOnNo5KYhCBLJ4TnLz5+QNSB9gO3D2XGALeOCufI1PR3zWdUYCI2Ek3qR6at2VTu2sGnh4Et3JVSZykkBSp8mPhkO/DwPKZVxHy1F5y2jxOmNzAuJ/TKyfQSOLQSjRqwOnI2nF3FFNDtabObLoErcBWXbusJtvg94ow/uQOi7qvSu08UuHcQ1QVcUn2ZUR/qn221uEESBHo8ANUj77fQv4mjTbd7yr8taq77bD/z97vZ6nPN2KAkohmJoUepVwpPLMp6/ygnRNIDJ+yFU6Ot9wPBcysVIz9BIo5mssPmqFh+VvdaFp1Bb+01UIEbwQRa8tAY7xpK0e6ozHdZZrRXUDe1OyOU4Cc7Xgy6SCxBaqAcOPTJ4i/relaIRjOG3U//ooTEV8lkT/sPKtXL5lFXITlxzbMR/jO89uQtn4Sfc7d8F9EeC9pwKEQd8a5zVX5R2G3NKuVDL0dFcuHPFyNtSxn4YoQtOof+9yCFjczt845OWUorrb7xytJJFyRdncww0k+P824i3sCm439iCZE0Jp5bpLaL8y0Aqu9FMJrpCcl6Eezahmi6By8eD4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXVZOXJFNWd5Y2hZc0YyNjBBcEpCK01TVjZiTmxGQlpVV1oxQ1cxYkF5aUtt?=
 =?utf-8?B?UDg0aXZWUDl1OE10a1JxUU5maENLaFR2RVdyeU9ISzluQ3VkNVNYeXVPcEpR?=
 =?utf-8?B?RzNVdnRxVHFuZTAycytBUzEyeW1CT0wxZ0lXVmtxR3ZUdS9XRmp2RVBUckgw?=
 =?utf-8?B?YW9XV1NCOGJXN29oZUw1SGhsN2VYejZ4ZnhsOFR1dlJKYnY2eFA4NDUrWHBG?=
 =?utf-8?B?Um91eU0ySThYQjlZbHl3OXhPRE5UZ3pVOEZqMHJ5MUFCY256Qld5aUhDQklG?=
 =?utf-8?B?VWFRbFNXL1dtVFl5NjhrdTlMdThBNjgzeDhLTTdtKytMcHh2c0xlQU0yL3oz?=
 =?utf-8?B?d0hKRDdSQ2IvY0JhT1dZZy94Z3pjZjJsRWhXaUJUd0t0dDByR2xRYm85YUxM?=
 =?utf-8?B?ZmFkcTcyK2pjSDdVZzVvZDFWcEtOcUx6c0dEYUVRYXpDSlFTa2w2WDAwT2Vp?=
 =?utf-8?B?cnU1ME1UeklqcVVZV2EyN3NtVnNYcEZTYlZpampvWFVzN3U2YkVaWHVyb1h4?=
 =?utf-8?B?b2p5OXVOYVE3TWxhRm4xNFA5QzRLczJmclBmdWoxcFVuRjM2QWVQZnpOaC9N?=
 =?utf-8?B?ZGdreVpPZ1BoNHFjRnlpYTcrY3EzYnFtaVZ0UXl3QjhadjRxSitwT2FSMTRt?=
 =?utf-8?B?VURGVHJXZ0hRZEtxaTFYT0hBYWdYZzRXUFdDbzdoRlZtaUcvL1dKMGhwNFVG?=
 =?utf-8?B?anBGQ1FENDc0M1IxdmRGWFJXUzNtWlZSSXhGREsrT09nVGdxU0oxRUl1MGtZ?=
 =?utf-8?B?VWtDd01vNGM0cENtY2VsTldyd3RSR1NuaXRSV3ZkWGdsc1JZaTgrUlBpd0g5?=
 =?utf-8?B?UlpsajlpK29Rcm8wY052M2F1aVN4YzJJTmJNOHF6WUZvUGd3dytSd2RzVUQ1?=
 =?utf-8?B?ZU5KSFAyRDkyS2UzQ25NcFdzYWZlTyt3NlpLRmhzU2oyRlIwMVRIbVhvRXlU?=
 =?utf-8?B?ZnJDVkM5ZXpHakhDK2VaejVIT3hXQTNsTkpBYWdvVGJuRDUyK1RzMndSZHcw?=
 =?utf-8?B?YmVKK2FTcGowTjZ0eGMxS0Z6TWtiOW1jNUd5L3RHNk9PdVFYc3RtaFZqamh0?=
 =?utf-8?B?ejRtcGdWb2cvdTBkL244VzA0eklrb1cyRnQrcWl6SHdRV0NQdzNCb1BGcDcv?=
 =?utf-8?B?K1luWHQ3N2d5ZnN1ZDA2OGVrNkRmMXJiVkJ2S0NRQmRXeUVVVk1INDN3cU5J?=
 =?utf-8?B?TnV5ZGg5NjY0WkdsMFFuUEEwcGhuNlVlenB2OUhPSUUzS2lVSGhtUGtXNVE4?=
 =?utf-8?B?akhML1pQckJEbEcyWUc0MnVkODVvOU4xTThTcnJSKzJmR0M1YXN5clo5ZDZU?=
 =?utf-8?B?UDV4RlFkby9adWhQSjlyK0kxdWMyTVBEOUFLSURkejM3TVY1ZEZLQVhBZGVQ?=
 =?utf-8?B?QUlmNkFvVThkQklDRGlaaTBGdEFmOExJUkNqM1lxT29zVUZ3VXVuNisyS0dE?=
 =?utf-8?B?OXlOYVdCOXNrRnJldVRYbGZIRGVDYm1Qbnk4RGVuSmhuUS9OczI1QXluU05T?=
 =?utf-8?B?Qng3akZObEwyclNIYkV3cFJZM0ErTlNxMHU3bmprd1M5dll5WkdWU0J3VGVG?=
 =?utf-8?B?WjJ2L2JvMGF5UXFCVDJuelYrYUMxU2NCOVpkVk5LMEtvck9hQVJza1BWODRu?=
 =?utf-8?B?MW5xWThsUjRQTGdCb3JxM2xUVVE2aWo5bDRoQWtJbjBmMW9aS016MlNEemxM?=
 =?utf-8?B?UEdiZjNndktRWjFiR3BpakFGNk5HQkVzK3NhMGozVEVuUVZzSEx2citaSmdm?=
 =?utf-8?B?ajZJTUdPeVpKc2RCUVFlemE1NnZmSGUzL1FOWXVZaE9sL2xDN0ZIK3E1RWFo?=
 =?utf-8?B?UllRaWZmczZXdHN6UHhDZHFweEFQL0pwWUxkQjgybHRwSCtiaVB0VDRHRGVI?=
 =?utf-8?B?MUNjeWlPK05NbDFrRGp6VzdiRUNFWmF6a0JCRFFMKzg3SkNyUDRjMXRWYjdp?=
 =?utf-8?B?K2dSNm9XdFhDdVJJS2VuckNGQlBoV2pWNEZtaDFrdURwdWRZRmxvWE9jNkNO?=
 =?utf-8?B?R1BBbTQ2d3pXTE9ZaFlGNnBiZW95RXhOVGk1VmJDdDRHd3E3VXY1ZDYrc2s0?=
 =?utf-8?B?YzUxVzBoL3RKNmxNNXBTZC9vSjVHZU9ReWx0Zk9kYU5FeHJuS3luMnoySThT?=
 =?utf-8?B?K05sc3lOd0ZIV1dwTGZNM2F3TTNjWkUyR1krUmdrMmxvNVhMUkpTWUJSODha?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 885e6921-9103-4e7b-6dab-08dc58e3162f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 22:19:13.5793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xIfk1KSoRPa9s5jZgyVIc+wAswMKfNu/bWhIMYF2bvGyGwC3QE0aexD2vEfIy8VqTFUlqVdbTS1XeFYhwcASg==
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

Let's inject a gt_reset failure that will put Xe device in the
new wedged state, then we confirm the IOCTL is blocked and we
reload the driver to get back to a clean state for other test
execution, since wedged state in Xe is a final state that can only
be cleared with a device rebind/reprobe.

The fault injection of this test is entirely based on xe_uevent
provided by Himal.

v2: Use rebind instead of module reload (Lucas)
    And other improvements also pointed out by Lucas.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc:  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_wedged.c | 108 ++++++++++++++++++++++++++++++++++++++++
 tests/meson.build       |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 tests/intel/xe_wedged.c

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
new file mode 100644
index 000000000..f2587cc43
--- /dev/null
+++ b/tests/intel/xe_wedged.c
@@ -0,0 +1,108 @@
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
+#include <limits.h>
+#include <dirent.h>
+
+#include "igt.h"
+#include "igt_device.h"
+#include "igt_kmod.h"
+#include "igt_sysfs.h"
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
+static int rebind_xe(int fd)
+{
+	char pci_slot[NAME_MAX];
+	int sysfs;
+
+	igt_device_get_pci_slot_name(fd, pci_slot);
+
+	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
+	igt_assert(sysfs);
+
+        igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
+
+	/*
+	 * We need to close the client for a proper release, before
+	 * binding back again.
+	 */
+	close(fd);
+
+        igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
+	close(sysfs);
+
+	/* Renew the client connection */
+	fd = drm_open_driver(DRIVER_XE);
+	igt_assert(fd);
+
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
+	}
+
+	igt_subtest("basic-wedged") {
+		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
+					       O_RDWR));
+
+		igt_assert_eq(simple_ioctl(fd), 0);
+		force_wedged(fd);
+		igt_assert_neq(simple_ioctl(fd), 0);
+		fd = rebind_xe(fd);
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
index a856510fc..65b8bf23b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -274,6 +274,7 @@ intel_kms_progs = [
 ]
 
 intel_xe_progs = [
+	'xe_wedged',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.44.0

