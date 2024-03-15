Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5090EC54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 14:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14C510FC06;
	Fri, 15 Mar 2024 14:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Au0d/ap+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECA410FC06
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710511285; x=1742047285;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=0x8Nl9e//3pCPwlk3riYd9L2WRKuXv8Hlv6aUTMIpts=;
 b=Au0d/ap+uGAI5XKW8xo62aveWXAyvL5Okvw4CBmHFvwfHstZZmoCIokb
 IUlqsL/rz1CzPB+2xWxQyPUOQ67O8r5V7tlbTTSViH1ZfbvYEU1MNdp1i
 +gTSJpoqH30wj3Q78Z9Hzp60k9Ho1aKHjK5o9D02Lsz6Xx/H+0LMipoU3
 kgylJX2BmIKyFLKCmd5KT6sEcysRNrSOV3Wz6zlhAIbRMPgVmxOg4xFZN
 Pr0Yg0G3OoZcTR4aDWC7Kx3R6+2JpzR9s6rp/r18BXa200w0FVcH0wn8k
 IajG1jClhlXQpuZ40iN5QThcL04MQCOruO8ToS+RWzzSykYmwIg6O5uRX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9213637"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="9213637"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 07:01:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12765135"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 07:01:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 07:01:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 07:01:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 07:01:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvACL3loWPeJH5KaE25KoIylxWnkBtJ8nKFpAt/K9braZGxbFIhGz4lKYWNXt9xeL3hFC+7zZY4T9YbQPxRLMplwtrKiRt7bfjZx2z9TIZrJ5uI3ZNhu69Jgt/gsH+Q9AfX3Io6wHJpBuawjbunyJdsXcYa6E+cfGjWDPE0qDr13OvYnNSUSO6d29pxJtzWVQXjGU1nZvgs6sYIsPeE7cO3wqH5B13u67vbPPJPGOy2sXuAUQhluoeZBK1FN+oRI24sdbA12Lprq8t5YSTxQDhciSJV/42my4Fe6M+t0hGNuSByDqcdFG/mbrzIEmhWIIFjnU26sf7QUSVf4tLTDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wK5ryIWxyclVRIvIATrHXMh15NS4Sse+Pe21mGxWJ4I=;
 b=W5NPIJKu5rodKw88nT5ZVOFcvlSVoChN5hHLNO3LQ+kVlQWU68ioxUZYnoc1MxUV0vS9btAcvWPJ5EFB9GZxDTtDIkSNPLaOsVn5OHEcfbn4i+N44WvfKuuYY2XFxppo2ivhpZE+KpKvEHMLkK0Mkr/T2fti/fpcqf9Y/UO9Rbh59Pa6/lJHCSbJUifUMTHvGXLI62vfZ1UZJQkmaw00QpS3LH2AqOMw3V+Vr7vDP1G0bWtBcgRWuNClEHpgGzoJM8BseyevGvZAGtaTjjcxXozgCp4SE4Pe/2ynla9tVbS649LT6kIQvVoc8FLzkBLaioB8ilWk9aGtRqkACbTvDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4596.namprd11.prod.outlook.com (2603:10b6:5:2a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Fri, 15 Mar
 2024 14:01:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 14:01:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/6] drm/xe: Introduce a simple busted state
Date: Fri, 15 Mar 2024 10:01:03 -0400
Message-ID: <20240315140108.217862-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4596:EE_
X-MS-Office365-Filtering-Correlation-Id: f4b5d08f-c432-48ce-bf1f-08dc44f86434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cCkFjXbaqLtuQj/qVQare5JW9e0UbxIUdIoxbPEcZCY+4W5AFL2rPkCiKMpmch0Z8h3HkoByXGxb1SL/41djKHf7l7F8kF10aqeY4mmC4uUR6oAS4j1AlEOzdCpHY2RYn4j9g14d06VLwCPyPMafuskNPdHuxJVI1dAqyrXFbU/hnezsvONz6eX2XedxKl9LSHu6sTshY8z3OW8dexCJVOUsrRY5jCHSUfulfXpo2wlBxM+pCRTpJ0uyxMOg4SWzYOIM+M0QKqqVgAfzCv3n3AX4XRXOsGW4Z1VPEbvS95BZ5gCIEd/WoeleFk3I8iqDNSFZvj1xfZvc9Z/3BiKy2DDuzyyQdHkg4tUihlo34BSo/PQ+VpCklJnRm9FT/SrcyFY0oPAqbQgPiOC8Ev4WDFlyZH+fxxZUSS+c+FTvQ0xUVHbjTp88P/VjrcB5KNfBgXW0bKnCEL3ENe4Fjl8n3tOQ9IbOgbjMf0RIq2N+RkmXezac0ViRGFg0HKnSYVAEBcZHrNFKK9jEKupfzTlQ4EY9e+Hfi1seFjgUc6rVbLrGtLIUoHtqtSWWgaS7KVDkKE2tMHbfG3fJqzo5E/acTOLrsyECXdgsgY1LVTLQxfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cMrC0L1lJCRbcx1q2i52i/C2Eoc8t/LGW26c3bB5LZ3gRMBIijuuWovIxCpo?=
 =?us-ascii?Q?HsLvNps8loEAl4PjCCwrtNxNV1CcUSfBuIDHkaLBHDKbGAJ+8y/Q5jBAWhkE?=
 =?us-ascii?Q?kwv0Xvk5u//6U1mtDooGZW3FV5cvgtd/m8ZR0MqjUENffXe6msXYkXjs1a8M?=
 =?us-ascii?Q?OqF4nYW7VxfaGDpM89PhR8R+Qa+T9JdSwvOjfnXTulWupjgPGKZXXElNXwSa?=
 =?us-ascii?Q?EtZ2IpXsQUdggTYUBam//d/4qHq+xzI03ftRVsmZReDhnGV1gAGPOsatDsTF?=
 =?us-ascii?Q?VmAZswwM0gChpCkBuj6iqM/sHSe2cyOUWXj1kiH73dHxoznYVL2LYym/b5BP?=
 =?us-ascii?Q?ikSiRacE++DlMdBSxUWgehPSn/9e8yHDtnPePo8Padi1ckZ1zW1uwpc3nZe1?=
 =?us-ascii?Q?2PY6jT9qQR+XzHAwdwyICBy3KWAzgcQoN2T8ULveaa1FNAr6bOQI4BzUlXyX?=
 =?us-ascii?Q?W0ZCHygSExAooA7oLf/ygME4sWPH4t8+p4+8swJjZQj7MLj3U3/jMnqtMEAk?=
 =?us-ascii?Q?vqcfqlVA9J5x6I94co8rQrNcOzjo1vszgasC+C0ZfODrJmTaB+F2CP0MiJ7f?=
 =?us-ascii?Q?bPx2CfXCHyVU6G0iUweLlJ7rMdvYQDku3+vnN53cvmeYLMPLNJ4MLzVWG/1Q?=
 =?us-ascii?Q?tdgg2qjKdCC4wW5yJSrrSV3C5JenuB0sQtQBo4IWttir5vPc97B8DqsgaWfn?=
 =?us-ascii?Q?Zo4O5TId8q6C4eQR/7KN8g4fmqQVXcn2r99+pWviRG+Q+W5RJYIo6Ssk2ltF?=
 =?us-ascii?Q?5Dn1GWhyFZxvl1rvgT3RNzSc4o0DDS16qEjqXQ/c159Z3Z2+99Tr0MW4KpyI?=
 =?us-ascii?Q?mOUAwo34301Kfc0DA0OTR/RESo0JmmvkcZJCxxtT5wUYzRBW09PQ2Ebj0POU?=
 =?us-ascii?Q?LaMWdFXg+7RzQDNFV4oH+egWzo+K0T1lrs9VglUKlotqEbyAn1azbM+xZqvJ?=
 =?us-ascii?Q?dNIl8sgpRYUYrkRtHAzmpGGacym1Zi0JsWN93vCcykcXPxG4DPB/skQlBPKo?=
 =?us-ascii?Q?rgqQBfVWbsz7GPBrXjV7MV2WwVpJzplgvu2KUgDpBgNIrGcwKD69CMfiZcnj?=
 =?us-ascii?Q?lXGenasQsxVgxVAWPQnRL7jwxEOw8noXc0PvXxLv+RaPcIUjQYYF83Nlm3Zg?=
 =?us-ascii?Q?pMf6HRkcEYzxk8nU/yuOzAFHcKkr6dmF19JfqCquEK5c20unZu7mNLGKOPU+?=
 =?us-ascii?Q?yBmNlMrsmxG+1QaF0V1zqdmyu3Lx2MQQHCk2TdHCegwNvEhS3o2ojn7AVYjL?=
 =?us-ascii?Q?CU1wyArtt7XAVn5zgeLbJqN9eZB03zBZNdh+NaW+68/tb7Gpb+FviOaorhyx?=
 =?us-ascii?Q?hBw+wmQeSQGMZ9Zh/yc6OWUNi8dWZEWtukXutd7tPoOmdOFfRWupPB4WBm3/?=
 =?us-ascii?Q?vKn0ROuu2tRRiiijkahYJiHme3T/vmdkqWW3ev8suG3X4PEYfrNU4nl6QWHh?=
 =?us-ascii?Q?6dqJo1WNRVhkvsP+F9eRihbf11l8kFUugTYJr+x+7mNaeg4VZxF5C3uPgFaM?=
 =?us-ascii?Q?0mkovI/FKkREhsvRkiZI+xV/jT0MvJBWmnaD3c1goWl3hTtrSt5Q+GVs2hSd?=
 =?us-ascii?Q?1UopVqmikOpG08BCs6YoiYwg+M3s7yIliBKA484+LIWKO7gPndnXNHGA8uNP?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b5d08f-c432-48ce-bf1f-08dc44f86434
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 14:01:20.6653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZVJhpycRM8GrAz0IMiNlEmUclrs0X6CLpM1iDcJC3TVT0ShRLEIzoUhH9w1x6gIXn+a2CK13h3TuuWjUpqxXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4596
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

Introduce a very simple 'busted' state where any attempt
to access the GPU is entirely blocked.

On some critical cases, like on gt_reset failure, we need to
block any other attempt to use the GPU. Otherwise we are at
a risk of reaching cases that would force us to reboot the machine.

So, when this cases are identified we corner and block any GPU
access. No IOCTL and not even another GT reset should be attempted.

The 'busted' state in Xe is an end state with no way back.
Only a device "re-probe" (unbind + bind) can restore the GPU access.

v2: - s/wedged/busted (Lucas)
    - use unbind+bind instead of module reload (Lucas)
    - added more info on unbind operations and instruction on bug report
    - only print the message once.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
 drivers/gpu/drm/xe/xe_device.h       | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_gt.c           |  4 ++++
 drivers/gpu/drm/xe/xe_migrate.c      |  6 ++++++
 5 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b0bfe75eb59f..d02e59fb49eb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
+	if (xe_device_busted(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret >= 0)
 		ret = drm_ioctl(file, cmd, arg);
@@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
+	if (xe_device_busted(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret >= 0)
 		ret = drm_compat_ioctl(file, cmd, arg);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 14be34d9f543..2c6d9b77821a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -176,4 +176,22 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+static inline bool xe_device_busted(struct xe_device *xe)
+{
+	return atomic_read(&xe->busted);
+}
+
+static inline void xe_device_declare_busted(struct xe_device *xe)
+{
+	if (!atomic_xchg(&xe->busted, 1))
+		drm_err(&xe->drm,
+			"CRITICAL: Xe has declared device %s as busted.\n"
+			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
+			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
+			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
+			dev_name(xe->drm.dev));
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9785eef2e5a4..2633fdfc1a38 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -455,6 +455,9 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/** @busted: Xe device faced a critical error and is now blocked. */
+	atomic_t busted;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 85408e7a932b..2f29f7fa682b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
 {
 	int err;
 
+	if (xe_device_busted(gt_to_xe(gt)))
+		return -ECANCELED;
+
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		return -ENODEV;
@@ -686,6 +689,7 @@ static int gt_reset(struct xe_gt *gt)
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
 	gt_to_xe(gt)->needs_flr_on_fini = true;
+	xe_device_declare_busted(gt_to_xe(gt));
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ee1bb938c493..d7eb409e8415 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -713,6 +713,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
 
+	if (xe_device_busted(xe))
+		return ERR_PTR(-ECANCELED);
+
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
 		return ERR_PTR(-EINVAL);
@@ -986,6 +989,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	int err;
 	int pass = 0;
 
+	if (xe_device_busted(xe))
+		return ERR_PTR(-ECANCELED);
+
 	if (!clear_vram)
 		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
 	else
-- 
2.44.0

