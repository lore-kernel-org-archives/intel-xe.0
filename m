Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FD3CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 22:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEC910EA67;
	Tue,  9 Apr 2024 22:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBKta959";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604D610EA67
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 22:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712700921; x=1744236921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wCdFjg/GG5C1QbkmbNE00PvL+y+2qeui+LBYQm0WwaQ=;
 b=LBKta959yUelCMbXsjiV3XpLvf9pApN4DTXXMF3c4hj+WC9PKFkx8kMG
 jbgril5jNUGeVIZ0ehi9xN5W2PKissOghwlNiqnBublIr51JLLRJcJtI8
 r5OzMWXXzdmtaFsQP65xIEU9QIgo0ohEkNywHu/SnxXbDQLbqyAnG2zcb
 uRkKIOOc1lv7qjq54XRnshAd5JP/QxhtXQICJ2lw2u+OqyX9cjsySz4QI
 NbpXKQIfourEEdw5Kn7oaskwVvGmeU5Li8qZ0jvRq5JptsicYzJgBuXf5
 Jyv44a6Dvd61zqFqG10UJ8bR2UiZmn8hIOyvnO9/ACvs37KGF07R+D80N A==;
X-CSE-ConnectionGUID: 0GsT7Xt5Tdi154ozpTmtag==
X-CSE-MsgGUID: t5SNhoKIR/u06co5Oiu4VQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33446638"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="33446638"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:15:21 -0700
X-CSE-ConnectionGUID: vS7rn1vxQ1K7iotxhHe0xg==
X-CSE-MsgGUID: e56Z1o6FTy+1BGpWY3ru4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20793439"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 15:15:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:15:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:15:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 15:15:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 15:15:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLJbZIYXaFgtE5NOWf3QTwXVJ4Dyhh/TRAZTUf+UGZGltwZ/6szaZAnYqI04Go6PDrv6eWu3owyAHkTjwSgW4Tvtcxf6TX+SUdnh7gBG0WvGITUscuGpChPjJu7ztRH6ItfU4rS485Y6gbr3rXUvuEzLtjk4Fyz4Kag+Nj3qiL54qsPZ8/7xuBtyqy5khG5jLYyP/LYvXEeIwvk3q9y4ArNWiMSlfvtyW6FbHoMBvT6ykmv6ePbJShABl8cpizSp09JksxWLSERv10OeUYZkQgEcdts5s9UWTGDPqxTBay7gJ+XF15LXYg4P5//jGXVP43mEfQU08Wm9ABeV7DBvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTKUOwFBZgkdmtZ3BsNrD8cghLrb5UjZuf+o5IxRyLc=;
 b=fQIfdntY5jzo9vw+aCq4g/XPA2+1qP2F2z5/oAqgT5J4M5XQaLrOejbXRy/Lb34p1LsH5dVmBwG6KTgw7P1BztubP/qE3moOTv/q6kT/cONdzJ1sRYcMTgc3+jpszDrYy19blFkgLy8v1irS0en5fi18++KBzDdQwpRNo6tPCm0BkNxBGbgpsThAQZNpwjn/f2loNjrMpngqMjgSw5lsgJRr+1EvfIP7ejKEVMo8wuCQ31qX5lZSXjEoKMp3Fa0q6l706jMzPVIoNor7lT7cVis8D5TEu2vdKTqnO2wyHf4MIfw7nxFHAN1NbEpnbLlsHJ1rcDsrNofksPmJ8t0a6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV3PR11MB8604.namprd11.prod.outlook.com (2603:10b6:408:1ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 9 Apr
 2024 22:15:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 22:15:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: [PATCH 2/4] drm/xe: declare wedged upon GuC load failure
Date: Tue, 9 Apr 2024 18:15:05 -0400
Message-ID: <20240409221507.1076471-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV3PR11MB8604:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wn0u5vxfYHqbnpweF4UYTCpo84KOH7xxy8cvGwInHIi2DIrMNwzcI98w2vRiNp4qk1gYzsWDQPMdfJQbg09/hw2A8AvaClnCUvd5+UCVkXfBfdkYHiF0z1jpJb00zw/DtjHT2IX0l1tZ9qIZTJfjMScjkREzBMZJBL8kDy41h6vZr+0IWr+IEcR7p+9fM+dbTRUT8jud52hY5mTtjueDYWAFQap86eVkozk2FpX2Qf93AcHqp/SzeQ6F5Ch7Xp6rnhIqIlWJWSDEWGP9+wnREpd9zGTyHLkLJJB26I2TxyCMjf6IlnH9AKPnZZAba5loHvnGcbNcaEpLdkXyak8RSk1ZZNbwuF9VsYo1XuMS6+08JbiMNsjwUqDY8Q/MP0+v+4lbBnk3YvG6hjHkA1tuz/QZ6I4vEOa6NkOCK6l2xKMGNrKNKr0+2TRPCWTIQWj2w5nbeSPOf/y8otpKOFbn96iOxggi5ueg/WgCXOcHSZ//e+pPmJclAdwsliX8jFfLjKdJrEVLGCzpnof0adIJ8Ur8LV+l8VHwJlCgD0B4c5jQyP325cMTaK8ehlfflKSL16grojyogEsvBnVNUsgMyqQT3Zxvn0P4RzcmbIezg4zqQOpKUOdbAVI1QneOoVCqTyciXyeJ1zOH+azRS0MdrF682T6Ye3nG6p0O9bUeORM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Byekceo4Kn299P8lwmc3bgw5mqy7oLzih34GJZq4ohWDasAibREckvco+Pbs?=
 =?us-ascii?Q?lV8QIwiwvVb4A77PZCPZMWIT5tnrvuWq+DeQFIrDvLImVPB4ibLHyrUl1TGb?=
 =?us-ascii?Q?HfQeKj9FfLRH8LRIQdOrlBzQ3YRwpCsaRViX8nHkoMkG06yIM2MgM5qKv9B7?=
 =?us-ascii?Q?Fv0uXqC3J3jK5I1Gxts03EU/howAyEfSSONWdKnzgtGEK97GK2deoy/FsrzT?=
 =?us-ascii?Q?8Cx7pVAGjmd9aLhLSzh8FxPwqE209BeKwDTtn+cbR1BDdU9a9nucn9ql5ytf?=
 =?us-ascii?Q?UtAOk701Pf8V+o8Qb+SBdIKKPsbHhSurlL9oUgO/QAXiJJx2E4nqkIRaMK0w?=
 =?us-ascii?Q?T6eBo2M2zVbvOfaLIG/dLDviptv8AvQ4BA6r8qQj9bMRjO27neSnnrMo9slf?=
 =?us-ascii?Q?qAa3Kwamt6wb7481gSvsw5MObZ5iQZWSE9YPq5thBlpjthlfUT3JAHN9njam?=
 =?us-ascii?Q?MwH2FQ0lEOnyyV1Gu2xaI9TGpEUFmdL9x83s3imnKQXts5gq6eY7NWgf5oOe?=
 =?us-ascii?Q?38dpXvGcsApMe0H/dfo2Duj7QV4utsJU1mYGt0q/CWjwF+dKt8MyTd20H/Vl?=
 =?us-ascii?Q?tLmGk+lQHrRA1bDsEI1Wc0C5P4bh6QuLRyeQWnTL4z7kmSzIwnWIi15bpRyI?=
 =?us-ascii?Q?B6b+6Ona1SZBYglyrO7qNCk7sZBupBGa9he+fbWiK8YSU3e632pjIocWXuxn?=
 =?us-ascii?Q?FD+0zlJ37cs9JX4dMbR4yCdIoh/tXxRhpTCHaJsjZz3jbydRJo+yL/4/YIQg?=
 =?us-ascii?Q?U0IuySQdbwDRGfJ23rxoDEqrbwU83CNGGRmj7d1yL3KNZSHNvvNnqixNV4NY?=
 =?us-ascii?Q?+9e+HsspOCesdS2D2XLF5vbclwGAU5uT2+ltzWfvrgnhwFhssmBGMMuVJcWB?=
 =?us-ascii?Q?i46L3Zpkj8cpNuqp8ge8ahPHJFEUsterCkrF4c9lW4pbCE9gJYqGVGkHTTgy?=
 =?us-ascii?Q?u2+wVLu5o4tN64IGmIzVzVGK2uCdXsP3DCj4QKOQ6qF7MAOdJwdrsxNDDtnp?=
 =?us-ascii?Q?vI1MfkufTOXPNqInRXl14rr+lgWt1aCnT2RW1Jeh1u1r600FjXQUSf7oCT9p?=
 =?us-ascii?Q?H/lktB6faQeV9q9EmO8xU5pKH+W+rLwAPtNVosw6J9M6sJOui5CUdpCuXSQS?=
 =?us-ascii?Q?ltifVb3DUuidj1HuDdBpchdrt4duj8DLSXJT7Kv9K3KoxD4mTloPUAWCO57M?=
 =?us-ascii?Q?+PsQCZy1tR+3KxEGQGuSfKKRU0Em6dOy0RJ2fBcjPqamsPBYxj1AN9+dhNwJ?=
 =?us-ascii?Q?NuiLme0IOS1rfeIk5YnWxSO9jtHbCwbDHJ4bRvrz7gOeBgAm2pKSR4IKEDeG?=
 =?us-ascii?Q?H45Plp8bm6xftKt+eUxd1nayafIGhwUt0CPNvLun2at8G9eLqxDhCpbJ1XnV?=
 =?us-ascii?Q?g2SyHUlUN5QatdPjAWB/Z0Igp3jlFP/1J05QlUZt1CtjtuEZfU255hC9jzIb?=
 =?us-ascii?Q?9Q6OfJc9fJrIbs5pHEEY8VbUHscJxQE5+wsnnviqFDAVry7qvrB2JMi4TmQP?=
 =?us-ascii?Q?OgSFjusES35WMaNnvMjUgstHad6p+KmDHsfj/6qAPCKn8vlJKAuJERCuthHS?=
 =?us-ascii?Q?kSMsaV6/4jysu+Ysp9tt4G3Nit1lQcWjWolmODblFinaS6KCG6LqxBlWnlS0?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53134ec9-f072-4049-65ba-08dc58e289bc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 22:15:17.9990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqwCIapcc1DuIVOWCF0TWalv85txkLtGktVtdxahOz31qNAYKob+VdzbrDD21MjhrImmBl34cW70VzF9nf8zdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8604
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

v3: - s/busted/wedged

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 42 ++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 240e7a4bbff1..f1c3e338301d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -451,7 +451,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
 	return 0;
 }
 
-static int guc_wait_ucode(struct xe_guc *guc)
+static void guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 status;
@@ -479,30 +479,26 @@ static int guc_wait_ucode(struct xe_guc *guc)
 			     200000, &status, false);
 
 	if (ret) {
-		xe_gt_info(gt, "GuC load failed: status = 0x%08X\n", status);
-		xe_gt_info(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
-			   REG_FIELD_GET(GS_MIA_IN_RESET, status),
-			   REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			   REG_FIELD_GET(GS_UKERNEL_MASK, status),
-			   REG_FIELD_GET(GS_MIA_MASK, status),
-			   REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
-
-		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
-			xe_gt_info(gt, "GuC firmware signature verification failed\n");
-			ret = -ENOEXEC;
-		}
+		xe_gt_err(gt, "GuC load failed: status = 0x%08X\n", status);
+		xe_gt_err(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
+			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
+			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
+			  REG_FIELD_GET(GS_UKERNEL_MASK, status),
+			  REG_FIELD_GET(GS_MIA_MASK, status),
+			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
+
+		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
+			xe_gt_err(gt, "GuC firmware signature verification failed\n");
 
 		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
-		    XE_GUC_LOAD_STATUS_EXCEPTION) {
-			xe_gt_info(gt, "GuC firmware exception. EIP: %#x\n",
-				   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
-			ret = -ENXIO;
-		}
+		    XE_GUC_LOAD_STATUS_EXCEPTION)
+			xe_gt_err(gt, "GuC firmware exception. EIP: %#x\n",
+				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
+
+		xe_device_declare_wedged(gt_to_xe(gt));
 	} else {
 		xe_gt_dbg(gt, "GuC successfully loaded\n");
 	}
-
-	return ret;
 }
 
 static int __xe_guc_upload(struct xe_guc *guc)
@@ -532,16 +528,14 @@ static int __xe_guc_upload(struct xe_guc *guc)
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

