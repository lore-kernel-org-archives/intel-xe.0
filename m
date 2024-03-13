Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E7AC54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 19:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958AA10F6E0;
	Wed, 13 Mar 2024 19:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JcCNFQEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EC710EA7B;
 Wed, 13 Mar 2024 19:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710359743; x=1741895743;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=6H9ssjuyzTQGBE22JhMOfE0a35QhR/2Uz6jOdY6mepo=;
 b=JcCNFQEYZYUsiftmQbVDKMdCxojEJq1y760N2fVsmv56EO2dE3Vdbsuu
 FyRZN4UXyYLtBmttERL/BBbPqlRpA5T4yO+PXgYCZM6Dw2qX6mQaLDjeN
 3MjJjCXgqSmr4yyg3dmbS1/g0gO9ZJ3iYodT6EuQpCPxGBDvxIyryinR+
 30XzxcFuxbRwU8Mf74LHk1f+fASKHjTTxzkH5J3wBMW72DGLBPAfOsTsV
 pX/quIWvrAx3WXYxAreII2evIAV9e4UulJ4z3WCfvMlapZ4se49Eqjv8T
 BGGm4N/yB3+I3trnXawOGqtaT7eBIEbSRAS28vKAe1NRsYeSo4t/IF7Iz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="4998034"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="4998034"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="16636806"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 12:55:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 12:55:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 12:55:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 12:55:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 12:55:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtnAOuuIRFJKXTpX4KlLxUVgqzkY4HHROFR3YxEquJ3BmmiBGNfS1tkVGFyHcRQVbqzSu8jzbh/Fu55RYcb21Hf4mpzlQ++FFtsweNdwLl0wkthukJYpv8BVxnEGlmhz8ZNIpPOVzEYgtJWLvu+Km9NCa7mbPBBdoXwiIG4eVVi7WSpUK7MfRa3spT8fQQjfbNkmQ1bcerz7C4oxAj3wRJsjass+vijr0FtZ2bvMBbUmody9IZaiHoQPB5hjtwn3/WRZHFfW/yLK6fRKFu3TCRy+94IHJCRoOShrh7CLwWQPz3hS9aQw6uU1TqLT96t5w+vXxiH6cIALNswffM6sbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxnNm7/p4FpP+DK02TBhgXBRl+Zx8cAFHk9xpSNmIWc=;
 b=RKxS7skgfIc1Ke2mDbNA2YgBdLkTb8N0B9bgvGU0sRc6RBr2w37I2MfTeucfGCtHMTN98jnkJ32FPHPOz2Fz+TaayX/OJxNYHETlMK9aA34HidxbtoGxbEAu/Dv0cFSk+bLuowA369osfOUJTImwg/LDMUOwEnCoBXWGIz55ku3iuvCnr7PsdJZXTISz+MzNhN+NtNRAu+S1/2nGCmyk/T6TP0W+YomHDTSk6Hg0H/2y+j1EgD4NkoayKTUkavIVZuHyyK1JIp9ZmdGnX3csV5cBaDVKig2cIrk6kRpg1xKD5XakPmcCvvTKZNvH4W7LhXL2kp9Q9NUIg1xsJwQEjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 19:55:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 19:55:33 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_wedged: Introduce a new test for Xe
 device wedged state
Date: Wed, 13 Mar 2024 15:55:28 -0400
Message-ID: <20240313195530.141586-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:217::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5254:EE_
X-MS-Office365-Filtering-Correlation-Id: 43614ec0-fca9-4f65-ae3f-08dc43978b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NGb4do26GBE5itEATJHTzuhsVpjkhoqkeTqyCGcI3B+iTX5TnCOI03xU7iENP58sUPRKF/kS8oRV7CScNnR4RcnWH3Yr/EVEaqZnoa5/4+kjmrys6x+5wUgeblcQYLyaz0l5tz4wKpDrSaY+q6TlXBijki5YN2Nrs3wqMsjUG6FohsF/7/fKGhPCLtK/b+JqDzZQYSv/3KEt2yIvSdZcMu9UCT1yxYLn+9UxcMMc94+opVwLFAoZ3RB3Vnui63v/+OpnbKenL04VhdqT0X81cNzz2aG24e9YHJL9HUeUj//jQEbMYfPgZ4xWfT4gKNNUXfVwDiD6qbvJOMwl8EUc5hkmpH/kWNwRSB7uZfrfIkqW6DkyFYYFlezdAfKBkMYTXMUqnvJSRB8prkXEeZLsV3BbhN/ezYwlF2zkxPh+rUF9DxSsfNNo5+ACCF8HHRne5EAHvqtxsaIWtbjQYVkiEdS0WKSRsini5e5A1OSaYMw+vb+CojbcRiGTke8cqqnU8fIRRQePUITDkwWBveJJsHqOzqmsNozsvewzAghGhBHl8XIv5BAFoNLsmDf1vOUQPYfzp+mPh1WL6IItFqSGdROmL7iNjUA/2dpZAy8ptX7yEQBDSR348c+NmMF+kSCpaEnNudI19eiaYCnNLBkR0vvnlwGagFJWr568vKBngJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEFFcWE5Z1pnV2NYdTNXNHUweklvektnbEh3NjdGZE9iVDVuRWxZQUdPSE8w?=
 =?utf-8?B?RlE2N0JqaXo4UU5TL0dLcFpDbUwwRndMYk01NW96Y0pYOTJqS1ZqRExmOVZo?=
 =?utf-8?B?dnZxcEpVdnlHWWlsQ2FpdEZjdE9aZlA3enFWOXQyT2lXYURHdlByMjB3Tllp?=
 =?utf-8?B?azRPWFJrWCtMYjBiMjF6cnA2TnowemxQZXlPRHBLS2c1NW5JNWdMUUFnVlNS?=
 =?utf-8?B?ZCtEbG9jYzcyeGNNMjJ5ZTlpaFh1dUlTc09lWDMvNFFhcGFQVi94MHpzM1pT?=
 =?utf-8?B?ZGlhVURNSm9MT1FrRitGWHE5OWgzNU9vSUhQUi9mY0tmb3p4RnVsNWxCRFJq?=
 =?utf-8?B?S2hPSzFhakxXSThzUjZ0Q0tFeENRVHB6Nm9nMHRmVWtBY24wazBDMVRJa2VU?=
 =?utf-8?B?TVZMblJPWlVKR2VZZUw4ZWR0V3dNeW5mMDVqamNjb0pLbExOZEU4dW9tZEJq?=
 =?utf-8?B?Y21NcWdkSkVUc2hzSVZGTXk0NzJTTnM4bTJWL2JJaTEwY2FINXBHZktlM2tI?=
 =?utf-8?B?YXJtbWh4U1U5aStSVUtuUjJxa3c3bE5pZU85cGp3THVjZFUybXBvT2JGRURK?=
 =?utf-8?B?V05EWTQwUXhkUTRGUHNMSW1uempFTmRnNSt5VFkrbHp5NWhvazM1aVl1bGg2?=
 =?utf-8?B?WFhLY1dvOFc2WFlpOGFkL0tmZC9WYzZ5ODM2WHpBaWZBdGg5dTA1RVlKYXpq?=
 =?utf-8?B?cEt0NDhjNzJkYlFoREdlOUZZak1TT3BjZW5temY4QVcyeW9JYll1dzlmZVI5?=
 =?utf-8?B?YTVrUVd2MEVwYk96K2NIYjd2QjFDejViQmpVdG1vUEtaU3JoV25oQ1lRcWxS?=
 =?utf-8?B?SXVrSW96bHpFbFA5N3BLLy9LSXY4NDUrZkFqRGt5Qm5sOVVyL1E4OUszejQ4?=
 =?utf-8?B?OVpWYVloQ2tiSVZEYWJtcDZiM3dtNUpDdWI3dWFZSms4cGxnNzZ6NmdRK29h?=
 =?utf-8?B?N3Bvb2FLUDYxZFpMelhKUFlIWjRCNlVrbFdjd2ViV21KUE5DaVQ0Y3pMcElH?=
 =?utf-8?B?eUVhclJzVjNvZlN1WkNaVWtnK2JqZlVBUU5TclUrcGQ2NGM4NTFUbEpMcklJ?=
 =?utf-8?B?L1NPMU84THpiclhNUEJ6R2xheS8xLzQyaS93a0I2L0pqL3l6NXFJcjdOUFQv?=
 =?utf-8?B?SG43TkUzSmp0V2I1SXRXai93MjRiOXNZamdiKzdlWFBsTU5DelkvTDZTNTZL?=
 =?utf-8?B?SHNjMGJCTUsrdU9MS29heEZWSUxVWFphSVMwUVlkQWlJa3JXWVI0bG1MZFVt?=
 =?utf-8?B?NmUrd1QrZGVvOE9sMlBmczFMSGh5YXJFN0NwYkUxZVFNUjRoUUlCaVI5bjFq?=
 =?utf-8?B?Tld2VUdESVZIVVZnYWI5UnZ1SFk3NzdFb3VrcnBwaVh6UUhOWXNmQTIxcUp4?=
 =?utf-8?B?N3FzTVNIWXFjSmhUMGdLajJMUVBlRU1sWDBzazMwVDRQL05FVEhpTUR2Q1Zh?=
 =?utf-8?B?WGxibDFvbWRITzRrcE9SNFp6SkNoZnp2V1lvMDNxUFFQdUNVQzE5OUNweUh6?=
 =?utf-8?B?ZlVWTUdycnV0em8vMDlkQVQ0bVMxQmtnUE1vRHVtamRuUHliM0x1Q2dMMEM5?=
 =?utf-8?B?K3drTXFtejk2WXppWTdxd0VqYTdOOFpzbGpuZnhUeDU2c3JwWk4xY20wcHVK?=
 =?utf-8?B?K2hCckw4RTU2VGdJNVh4aXU4VHlIek1ZeGVHUWxHTnRIMDR6OGRBMEtpTGUw?=
 =?utf-8?B?V1VMeEJZcS9tYWo2dURGZDNoQzZPbHcxZGxXWDUyejZUV0NGWEpEb3cvUjRM?=
 =?utf-8?B?M0g2WHNVK3pCUktBUWJMV2g1N2RidFNMb2pHWHczSWxkTkhJeXB1ZERvUURi?=
 =?utf-8?B?amNDbjYwRjN3eGhHc2RGYzJic09FWkVSQ0t4Q25JeDZBQ3RSR1h2QVVhTG5W?=
 =?utf-8?B?czU1ZmI1blZxb2VLQ3JoNWVjTTF2TFBydTU1SHVNNFFraTlrZGErcFo3N01w?=
 =?utf-8?B?Z1BHUUk1QzlLZENMODFwVmhUVVdVcUZUTnVDSWsxTEs4Vjk1eFQ0dFRMZEIy?=
 =?utf-8?B?MmxTdWQwbUtCWWZ1Z25iTkJDeTEzWlhHOUxQVTJ4cDArWGZDazFVZng0NUNz?=
 =?utf-8?B?aGZXRDFhQWpIRkxKQWc5bTVhbmR0dXhveEJ3eURJRk5lb0h1aWR1V252OE9X?=
 =?utf-8?Q?l50w7lT9ekxjySOkXgnN1ZInw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43614ec0-fca9-4f65-ae3f-08dc43978b3e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 19:55:33.8272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i90aWNWiHQafbjE2g/2hKJ3Bz7tipKduJFpZA/Mzee+HMuTOV2bF5z0ttPBAwyhlwwwIQvgoTKKgj2gFHZ6ZCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5254
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
index a856510fc..e590d4348 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -312,6 +312,7 @@ intel_xe_progs = [
 	'xe_render_copy',
 	'xe_vm',
 	'xe_waitfence',
+	'xe_wedged',
 	'xe_spin_batch',
 	'xe_sysfs_defaults',
 	'xe_sysfs_scheduler',
-- 
2.44.0

