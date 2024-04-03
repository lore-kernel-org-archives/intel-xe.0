Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71225CD1299
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 15:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D06112774;
	Wed,  3 Apr 2024 15:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwIofsGy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2D0112772;
 Wed,  3 Apr 2024 15:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712157461; x=1743693461;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=LZSplZiNlw1AM0/PESiWVtxYoMLs4OZ7h9XbcuPchno=;
 b=XwIofsGyCcDxnMc0c+OOcxycFG4jt0c1RDh1XQ5YxD7LR4+hmKKphweE
 fK9bwIzeWLPH8+MQr96pxo/3LgUTc1+cIiTSJ7Y/kVSlqcYxYkhF8b8ez
 VzvXR/RIMU6FoluRO1ExV6bBGMKA8DRFvttxegWSsbTNfQ7K89TYCwLw8
 tGxVmuaz6+4Vx6p+MPnhQZTGY1DtgDLfbviXSvjIBVUS1WzYs/i1zwHJb
 QCZ1VzNpgiLGz2U3tPYLhKauSVF9zOFTIMogLC40zDc+iAKNGCeuDrNpT
 vKnyPTwP1pF7qRGaJBiC25xJJIPVvgpdhI/Y9I1OM3B0Ol9SoU+HkjT2N A==;
X-CSE-ConnectionGUID: Bg39eJaRS8STvf42Vb/ufQ==
X-CSE-MsgGUID: xLF4N4AhRh++Eoleic7EpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11174119"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11174119"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:14:32 -0700
X-CSE-ConnectionGUID: eN3Ni2JKRXyfZb6JIIBQDQ==
X-CSE-MsgGUID: ovlyCyn4S7yNfwDrsspprw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18506304"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 08:14:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:14:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:14:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 08:14:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 08:14:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMpy6NmAD9R6pslcw9bu01gg9b5rFBll5Gqd9XQIKDfFqLsApwMOCF5Es3qhCUq0TQnZRrYQtMQbryAA4HWVJ2ECiEmDqvN3Fp9NrxKMyPkhAJakzwm4qkyraFfeSFJG6tt7qjUpfNRbFQx+rkU2CqcuxKnmpfJmovVj1X+g7cmWm28uGLLVUkLDf5CJGMrCbtCpG1U07VqYfhpZnR3EJ3pP0doDo7G92rX7YmFXxCQB7AxFn5w+nEStZytQg3FDjLyDuFA6A0/RSCJCYpV/FXVwwhfoX3xKcBaU6Wi8qmC9tF0Xt0JlG/bRniW5AevjHQRHxc+x011tl25b7gyMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcT1bJgOVzPG05wH3J8AuQYfiDAO10q6XMfIX/DE4Cc=;
 b=kiTPmSTmco/qfLi/8DuX0561Y5uLlT5rZm1QfyOtE9fxKVasd02pKauIV0SG9qaZHO/DcHngC0WzBl4LujdIvvwwtH/DaRkpeHn4e/b2vpYOt3a1CS2DHkUPqg5248UaR7L/P2YzaXxLm0I/xtX06pJQ/aZXCE8qOiOilgUF4WE7gs2Sv1+hUjUO1NEvNmT7IFs3Cj+3ERqSYpvXDZ9WxJUZdJsMPhXAd0gJzPFWFKrR6Lasj6vWQhkD12jzinkdS0cl2bGNdy+9FQKkXV+PBlNsHBXB3tDSxyJdCCTPhPFuR3QdX33NZR1uZSn5kkNUzJ/sEUQyHTgGnmtyWgbweQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7479.namprd11.prod.outlook.com (2603:10b6:510:27f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 15:14:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 15:14:17 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/xe_pm: Fix runtime_pm tests
Date: Wed, 3 Apr 2024 11:14:07 -0400
Message-ID: <20240403151411.113159-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7479:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WjyKh2K7w3F9V3RwcpGg2cDi/Vl37HGzBzaPSwD0fUG8UodzjroJZ9FvbkewHxCOmJU60rrnnt/SAH/+JCtCeAjWDvHCGhf/ki1ePyXS/F9NySCmTKRg4FRlJMxeVnFNIifxniB9nIq/cfrXzz3mbCksD32W9J6+KO3CW3f4UC8sxmptT+V4QUz+OlaWmbk5iZfUL1efm1Y7Qi0GSmtpC+HSj6xqafkXm72MKcqrFL10vD+tdlob5KjtGRIRM1Gzjx5FjoqjY+sGcHZXJbWGflQUNY+j8HG+B3x3hlxduYogJlsl0oWVBMNOTopH5ULUP3y5DMglA1DITtm6LpxoVJ0lzyXrlXeAtvd06cZOmNXKSmJeBqINjbwOjT276ElL5aB0tZ/84G1cpsKChAPmpIcNpMxoqGrZMyoqB1wpVW4m45YqUsNCJjbjZZt6gGwQoO8VoMvgB9pg8H6P1L8YJlLMN3T+m3hWa+R2me3w+qkBFUzQnHKa1T53UMcRiOWSF8T+W75kngNRiZ5qt9UJms/PCobHTr8gki1C0iWuoNURmCMVFw9AAvAYDG51xx3sCeK1J0qo2PJeZWUM9/fMMiouhkhcKGYnlr4nrJy/75SbGAhq20U6tzt9pyHursvVWxRaQ2ojBm9+OSrfDhqz4gapyfzP8RfWc0tfmovoMZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f4OPQMuXM2AkfTNVPpWpdO2v2zqGDucTIP9JHvkGlypaiqfx2irRjZlfVy1r?=
 =?us-ascii?Q?kMNP2+wKzQLSbiYjitjyLPUetrVqnqb1FncfgEy9/7cR5MhCaJFYnbAdw2Pc?=
 =?us-ascii?Q?Kysc3SLVUg920noRjUhYiQrCUUAqeMC3fAzMTp2f8c7H3KqoLL6hGM0thxAi?=
 =?us-ascii?Q?Vd1AEYw+CHQD/eWPFIQLf60PmcRf4zYEa2/eG5WVkeqo8hx40HkzmT5D0BVF?=
 =?us-ascii?Q?AXdu3IN5l4YdmQpJB3gbcpR6vopbfiZdGgyVukprNLNswhMJJ61Oh4PJftUz?=
 =?us-ascii?Q?QlG2Ygj2BOfJn+TpPhVm09tAb+2oSOOLdfzYnDBDJ9xacXlIHTafgs5K/jRy?=
 =?us-ascii?Q?MLhnS7MKoy5UeT+4WWXDMwqBLf4d/XHKLIEyZWQ/ws0bbQnMAp36LialCXxs?=
 =?us-ascii?Q?i4UxBeYXvhiOGEnbN+Oka253Sq5/w2naeiQVTpglLl7KqqP2+5TWCxZPIp7D?=
 =?us-ascii?Q?i91CICKThVMasUzqCtNNzOsAhBy+q0wlu5seNCpi8jOGcNlrGQ48FlprxorL?=
 =?us-ascii?Q?c6SAiKM2273c2ituNOI+JjvflnhM3uuCg8W8eeWJ5qHhmt2dAhO0TZbAow0M?=
 =?us-ascii?Q?ZDDw2FtlIJn2Dun8BYXkUA+/GV8EP3mA9Us5RZY6ALqjrSME6CWtQfKWdnzC?=
 =?us-ascii?Q?IhaziHPer9dXivcS4r/gteYVh4Zgvez/ePznv9vzAcBsUTUUoHX8HA0F6ra8?=
 =?us-ascii?Q?pUPKy5ZMnDds3CcS+emHfQn5SLoBcAOglTF6giUXTIk+2+/uA6v30sdLEcqN?=
 =?us-ascii?Q?LKMZCz/1dYfC6oysvmrmXhFjOQZkeaHM5bKPWZoxzRDK8reTmnZ5999tBwH1?=
 =?us-ascii?Q?DMCW6wzSXjBuAmn/Uax6HNXV4SCLX+nD0w21J+wSIDZZ4E0MGNTFy4B67jo0?=
 =?us-ascii?Q?wStdWFikGFB/0I240mn6KA7n7tSJMBGuNCNhH2ghNo7TOecNPlxZirFfivCT?=
 =?us-ascii?Q?VPp+YImhRP8MTYdLxgU1tzuCyThu63tMG8j26VAPNnR+NnTxxled/qEmdVQm?=
 =?us-ascii?Q?bhsnZTuLWXDHWWXGYHuce/vN6IoMlCcoSdYtg0bpIrV9+OSalx5Q6EupyN0j?=
 =?us-ascii?Q?J++HFpIXQ3evS+MSJM8ZiPcA6CVZ+C9C2bDQnMTuJLimv1Fssza5LfS1QqTC?=
 =?us-ascii?Q?FEKsbhdmJtTXYcbrHJwS368+NOlFo31XyyNs83RkNYb3l//AGE3mH94CGrET?=
 =?us-ascii?Q?N4dd/j96cgmvxC6QOa9ctxIr0LMlq160+tmCVThkuuFvql3qLNOKZSfcUK98?=
 =?us-ascii?Q?l0IQ/CY2a76FFXEPIIOtIcVv34LgtFPLF/oI2OHU2APKqOTJUSOsvRJKSDcO?=
 =?us-ascii?Q?P8uekOA6bvpAi3+64ZW+CQ93rRZUDRRdhW4r/sHQ32VqgCYXulV16ZhZnxGL?=
 =?us-ascii?Q?sinR3DDa1gFCXJm9YHeRD8lP7dPALv+eIqkEG3jLzmwyL/ZFcbvG84SXMRO8?=
 =?us-ascii?Q?llnC1zRowefYQbdxFAm8ss3w7mLWAZs9p4a4BRcXrISFip33pALQ9kKnEJLv?=
 =?us-ascii?Q?cFhTXsE/NafXzG+nx0qvTdeuInhQgyRwC5+6NJy3zIjqkjadKoh6wdmou+Uy?=
 =?us-ascii?Q?KfypMg/NYlahmF7TVMYC9iExRZ9rwPlujbr++d+7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7d7150-0e07-45db-dc54-08dc53f0baa6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 15:14:17.2379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFImdPjtSg3voGax+pOIPrrnPCBZo5qhkMqB7CFHZ9izc9IwT4xP6I4ULBSRYdJlkmfDUbt7D5dkTs7QcpC9+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7479
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

After the introduction of kernel commit
23cf006beac3 ("drm/xe: Runtime PM wake on every IOCTL")
the many ioctl called during dpms_on_off might be forcing
rpm to transition back and forth active to suspend.

Then, when setting the d3cold_allowed during a transitional
runtime_state, we got some situation where the runtime pm
might decide to keep the device awake for a very long time
even with runtime_usage == 0.

Then our tests would start to break like crazy:

(xe_pm:29453) igt_pm-WARNING: timeout: pm_status expected:suspended, got:active
(xe_pm:29453) CRITICAL: Test assertion failure function __igt_unique____real_main473, file ../tests/intel/xe_pm.c:556:
(xe_pm:29453) CRITICAL: Failed assertion: in_d3(device, d->state)
Stack trace:
  #0 ../lib/igt_core.c:1989 __igt_fail_assert()
  #1 ../tests/intel/xe_pm.c:432 __igt_unique____real_main473()
  #2 ../tests/intel/xe_pm.c:473 main()
  #3 [__libc_start_call_main+0x7a]
  #4 [__libc_start_main+0x8b]
  #5 [_start+0x25]
Subtest d3hot-basic failed.
**** DEBUG ****
(xe_pm:29453) igt_pm-WARNING: timeout: pm_status expected:suspended, got:active

By simply waiting the suspended state before we touch d3cold_allowed,
we get our tests back to a sane state.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/intel/xe_pm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index a0045da0b..fcbed6249 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -121,6 +121,16 @@ static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
 	dpms_on_off(device, DRM_MODE_DPMS_OFF);
 
+	/*
+	 * The drm calls used for dpms status above will result in IOCTLs
+	 * that might wake up the device. Let's ensure the device is back
+	 * to a stable suspended state before we can proceed with the
+	 * configuration below, since some strange failures were seen
+	 * when d3cold_allowed is toggle while runtime is in a transition
+	 * state.
+	 */
+	igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
+
 	switch (state) {
 	case IGT_ACPI_D3Cold:
 		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
-- 
2.44.0

