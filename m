Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D681C54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 14:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE80811225C;
	Fri, 15 Mar 2024 14:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBhrWOt/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA4611225B
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710511288; x=1742047288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KWI5i3sljxEl56D9dJZVItuFlU2SLE2g8rX4NkBgKyA=;
 b=XBhrWOt/p/KWdqEI+vr8j3C29kwSj07ZigflxHWG1p+ps2mUuwPGnGhV
 ZJ8Icp5bLSPXFP0A95ahwm41XiFqWmqVXGaSo1KFs/7aM9ZkztfRBNHNs
 wlASf5WUv0sG8VTBkUe2netj4tt5m+4wxVe2Q0VfCUzyhD6aq+LbOS3Hd
 oc+eu+VQvVZpNXnbKyLrHlEvGl+qfmULymyXQ9PrjUpKZPQ8OU3ojEayR
 9QdpkEd94ab5Ej9f0U4H/Oj7fw0lz7/USLa2EJmep49pt7duawptgS4YR
 ltS8wv/WDM03LxU/ZQMewB8foOJzOsDGvYBsiOpKMERnIW61arcqRlDDk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9213651"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="9213651"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 07:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12765146"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 07:01:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 07:01:27 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 07:01:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 07:01:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 07:01:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXjB6WUfS7iJKBHFN3j2F7vFHTLs72ncfzCTtw66IgS4fdLb3u0qGM/DbNVnzFEPSWRnlHYzogA/JgIE5CItbVdXF63LTVKDf5pO306lUVeIru+29d7kVJKdEl16AWCeKzJO2Gm+V5ymzUH7hj82G73Ey3uwLD1bWwdxh2/rEuVGSYqMwG9IYNqU8JghHogTFUPTQ8Ii6Qwae24AxCt79eYIOBGmwn5rcq847703rhLZut8dWouN28BMhEm3gsG0ccl2UVKc2py6cwH1eXWLCH8pbtq2Og/KcOy6Fx/Qe/0nXv+gXIWq9ZwLgC0zLisnSPkdgXhz1eJZgyO9KHYRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf0C4nbOznRdKPF2HBPFUUynrdLxCQxugVrr2mCh9gU=;
 b=TWX8ftUEvxNOcJyKHn3Im4wRhXuaq3IqCxBrQOlvvJZDb3u9EXZ7A4p0zPvssIpi9jDhq75K+MrOYjqsV/YXFUlIUnJbYgkz4klXT+wb+FhLqkjrC2c55yc6j9W/Scdox2mqYGgh/EVTtzb0X1Fm3pHO3lHQ3nDgtEmibNPSBN9vq40ZuITCFngLdjXXZ5vsHg5iIeUCCUpZzw0SfLYRgLfZQQsZmp6HyHr1N78IAJyaJMBsUhckRwSNQBpCUd4UmJU4sZjj6Wo5Phe4QvQ55ilTO3tO+zaEQi2Uhn7rfDRvcHB5OtS1ndn/RHzfP8cCzA26PE+ZypA6Kh91usEBWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7523.namprd11.prod.outlook.com (2603:10b6:510:280::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Fri, 15 Mar
 2024 14:01:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 14:01:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: [PATCH 2/6] drm/xe: declare busted upon GuC load failure
Date: Fri, 15 Mar 2024 10:01:04 -0400
Message-ID: <20240315140108.217862-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315140108.217862-1-rodrigo.vivi@intel.com>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 38dd3f26-b178-446b-8c81-08dc44f86678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1MHy5w0CZUu1f9avSaEeL1tGkJXYfwyCJ6rcDC02AY8WySe7zOtfN1WdtvG0p3k5ZAGWJkpfxa+URZyp8H1OvkaY2uxk6/0JFb4VtFB4NPTNtuI1FozkTfzKfg3+RtiLgW+N3tkccjUIQMRoJbEmOulmJc1sAR6fZ3XB1b0V8uG1HPnxVc8oWijbNXYyIE3zIy4NVJXBlop5MJfNDG6QyUhYb8Jp1R9l2OqMKuisyCFFTnORYyzsGt1fR6h4XlDYuTPP1gcmqMbXrHzO4/neG6CuL/s4LxIsNm1Tb4iT3DXRaO8xm8+MygfniGgTe+QwK1cJ5cCL8PYjTYRBdJ2aIxJoVfXbmn2xakCDp/eP0lK/IPGgRsBOB1p7wFz+arjUs1ORjk7fwoeAteXYafjnfUPJzG30QOYuFLAzw9X1QMU0bXBtRfvJ+g+XConEb+Ah8rTgF2RJASQCYWXyWbcElM0o6m8QwNpQfW+RAtBHxOB2nTiF83QUyMxGih6QkIykN93KT/9arlrTje27+G31/fxi9KGkhWpZpAKXg4iT22a/5UY2ZeioiS2DFnL7m1kDeYWwScvkYA5HyFA99kPN5nKFtqY5Ig9AxCXZNHf8jdEX2UMNj60iWSSb9su2PuI7JsIngO8Rg2Xjf7zQXHrals/qxhvdSIgwhnyRfRrgIVg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fJ8vX7w6xZ7Jxmvel35RhskWnkhq9Ilx4C2QrrSuD3qr6TLJhEUxUHQnd45f?=
 =?us-ascii?Q?K6/UPAmdy2S3aC90nO6n7Lcn1CCuLgj7dq3/9CasAfWbE6RR/mjyz1ZiMUmR?=
 =?us-ascii?Q?dny2EDWgmyS6oXWMw/HBMglTwvcu5NH6KwH0/QdDQyYEVDI+3nz4JXLIZSv6?=
 =?us-ascii?Q?ObINfEns5jpI5HUckzicqpnDd9iEncFEY5AvSFFqYo/u5dZwfpsmFrO+gJS6?=
 =?us-ascii?Q?fklNbEzERz4e0rRGdOe0NeH7GMQTOUDEGd3PaU0TY8vjrYaf7CYYcrzMdqBH?=
 =?us-ascii?Q?cBXQIBfw32JFfJI1OkZGIuSkKx7qTWOfYXYhVFfz2I5TRTGcNxCl68EMwkNE?=
 =?us-ascii?Q?o4UdoHW6mlfxiCrgRG9z4++i1J5xiDo+VS3HenLjE5NL26Mg7n73XDvC50w/?=
 =?us-ascii?Q?Hv9vvsdO1dRm+cFSFKWTqROH7ctu2WxGZ9lBQ8E4Q06vsab9gwIMaXGSwwi5?=
 =?us-ascii?Q?RS5J3ZZ9dnGLeZyuvfpdcf7Jxr1xEPif9nKgIslAbMKFCHvulwxF6XHEAl8T?=
 =?us-ascii?Q?xcfwqda82gBVNsnJdBGIUJMycMTKW5gVEatdYTrgGXN8ZHxTda+wJl+qRMol?=
 =?us-ascii?Q?OTN33lTTKVEIgKYL1NPQD4e93GK7JeERQWGUutJUVwRAtxEeHfqolAHe+zv7?=
 =?us-ascii?Q?Vzr8eoHFcBll1FIAUBd/r+u86uX4IF6vlHUh3yFiHycZwM2VXBJvjUiLpPm5?=
 =?us-ascii?Q?S6veVWEvRG2Dm51sgw4MRpn1paa5WZZTfs5UbuoPhN/CEWCEnOsHWriirBom?=
 =?us-ascii?Q?AxVm/yBNWhBTVfp7WtP30ZsDQMbb9l/LRVguleAay0iM8ojd7PJEC37hIF2p?=
 =?us-ascii?Q?ODw5JtvV9/Jxt4ZLnCU3DjUrZ1Yx2Ixy1pEJa4vq3u2prGXtGZ0A79BOgvRI?=
 =?us-ascii?Q?pul0qNl3yryZF2PPf/Ih0q/TQXurs+r5ElLpm2F2K/mpoDNaG49wDFyXwH7V?=
 =?us-ascii?Q?+hzLP7a9sp2eSE2IxUoe+RAxq9QGdvgaKcC9OSfiI3FW5vThscTC6iH8k3/3?=
 =?us-ascii?Q?gjaVlyiNou/ExiSBNEjc0yI9P8ZPtGLF0A+1euXH0umu0EAa8g+dE8Q5DYGF?=
 =?us-ascii?Q?tDDfASenarKhyIAPM0l6JbL6CoDrlgRN+GgzJWw1Qm9vBS2eAbDFaxnQh5xK?=
 =?us-ascii?Q?qffojZ+/4MVr/Bq0FqDGyujdwLsz9F5z2aYL7gbTKFZgZbcFHw4JWCA/oKV5?=
 =?us-ascii?Q?tDz87evOFldDLrPmFt7TVsdG7TKRrdUOZ73mAYqc4xWCMemE7/AjAxQHC+MD?=
 =?us-ascii?Q?L9VBnqd2hit2ciyGnCUNhr+q9ErOhcNaWpSm/dgAEx7oKwTzwZklw4bjA4P6?=
 =?us-ascii?Q?NJLhTJBA9BKT1nWet72j5CjYwZKGZ68ZhrC5zkadgYkbyPUqC1/8Q+vpAkm9?=
 =?us-ascii?Q?pHwUz1XflI+o4GXH/syMNLPQgtHuDw+5ryA62BXuOBN34iKdGoQLhWP1KZRb?=
 =?us-ascii?Q?Dcg4wt+2DoH5ErYp3sNzYrllYAPB/FtuL2evkefEB4q/J1DJViAwMDtc2suK?=
 =?us-ascii?Q?/5scsFIL1jE0CtnejiUxbEtyTHfvGkmnnz2TtRDQo4m5n/WZsYKgiHzKP75S?=
 =?us-ascii?Q?tZDGjxCDjIjAfil8izJ18oA9HDSg47cBiZlsVVuUIlT/ufRqWyrkIkcMhmdR?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38dd3f26-b178-446b-8c81-08dc44f86678
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 14:01:24.6219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMf/ocB6dg2GszLINJVR7TK9RXykf5FYg+AlCJZY9y672LSALsCR9CoXcXVyd3Q6g1OHTwUWVc7R8njW+8ZLug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7523
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

Let's block the device upon any GuC load failure.
But let's continue with the probe so guc logs can be read
from the debugfs.

v2: - s/wedged/busted
    - do not block probe or we lose guc_logs in debugfs (Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 41 ++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index caa86ccbe9e7..85edaaa734a5 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -461,7 +461,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
 	return 0;
 }
 
-static int guc_wait_ucode(struct xe_guc *guc)
+static void guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	u32 status;
@@ -491,31 +491,28 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	if (ret) {
 		struct drm_device *drm = &xe->drm;
 
-		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
-		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
-			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
-			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
-			 REG_FIELD_GET(GS_MIA_MASK, status),
-			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
-
-		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
-			drm_info(drm, "GuC firmware signature verification failed\n");
-			ret = -ENOEXEC;
-		}
+		drm_err(drm, "GuC load failed: status = 0x%08X\n", status);
+		drm_err(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
+			REG_FIELD_GET(GS_MIA_IN_RESET, status),
+			REG_FIELD_GET(GS_BOOTROM_MASK, status),
+			REG_FIELD_GET(GS_UKERNEL_MASK, status),
+			REG_FIELD_GET(GS_MIA_MASK, status),
+			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
+
+		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
+			drm_err(drm, "GuC firmware signature verification failed\n");
 
 		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
 		    XE_GUC_LOAD_STATUS_EXCEPTION) {
-			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
-				 xe_mmio_read32(guc_to_gt(guc),
-						SOFT_SCRATCH(13)));
-			ret = -ENXIO;
+			drm_err(drm, "GuC firmware exception. EIP: %#x\n",
+				xe_mmio_read32(guc_to_gt(guc),
+					       SOFT_SCRATCH(13)));
 		}
+
+		xe_device_declare_busted(xe);
 	} else {
 		drm_dbg(&xe->drm, "GuC successfully loaded");
 	}
-
-	return ret;
 }
 
 static int __xe_guc_upload(struct xe_guc *guc)
@@ -545,16 +542,14 @@ static int __xe_guc_upload(struct xe_guc *guc)
 		goto out;
 
 	/* Wait for authentication */
-	ret = guc_wait_ucode(guc);
-	if (ret)
-		goto out;
+	guc_wait_ucode(guc);
 
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
 	return 0;
 
 out:
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
-	return 0	/* FIXME: ret, don't want to stop load currently */;
+	return ret;
 }
 
 /**
-- 
2.44.0

