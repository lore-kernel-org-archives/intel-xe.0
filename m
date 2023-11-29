Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCCFC10DC1
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F4E10E6A4;
	Wed, 29 Nov 2023 22:36:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF2710E6A3
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297372; x=1732833372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=H2Y3mUXTnfMDtQ4Aaho/pwcOAMnTWiCth77LOQdgDZw=;
 b=AiDSrhc7V9oMgl9xJaGKNtuDX9Us7GGUDPVa2gB4ON1uS/5cpowu36ah
 nhhZrnrsOYHxairbTURC5guAkfZOSeGUEusYbfv/WqNMwKwOreK67eS3g
 pu12eKHjOQEP9M8k0bQ/W0r+nYONBl2YKiQucdRj7pC4TIMsEpJD1o86R
 LAlwwNujxNBhMiCH0mc5T6ob729Rrt1dVflodbFCAoiuxIS3koiJDpxqr
 yZ5nZH/4Q0XdR5Yi7vUJBKlT+n6HXhCW60/Vb4OmrxOX/nPiB59j3avxK
 8N+zsPG3uTuvgDy4K9KCcZihhMlx3mlmJhe+NKWHGjA5NR0G9Ym31M4Ep A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373420147"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373420147"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718892006"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718892006"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:04 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:03 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwcBBt2aw2QC/1xJnVKZ7JSAnaozJyFYtIkN33hDjIgbJT1WkGDGyXpI+UNLcNfjSA36afjf7NCFnWjHG/LEV+yVYFvYIZUWzA62HOlz0f1NOkE1izOFfJfII2163JkEHPl6GpxBgKX7NratrRz4lU07zthqxKV6F+LWccopB1n925rpizJVate/CgEy/FFG/9Ry3drFJ9rDUyRaTy5lQvLubKtNC6i0n7qyv99SrZ8aRHMwad7LfYQkBdnKiYyDvljncn1h5Ld0+PPQHlcJA0CXOGHIdq1mxY1bd/YF73yZN5zkZhhVTpeR85GLJzUU3WX/ep6MWhXR83DhYrLAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVzjcja+H7C2ZTN6KPV+yqgqYtxr8Szm+DP9FrBuW20=;
 b=BX7FAIYguB0t3O8grWO3CqTcAyOtWCk0CSDyWhPfXOIe7si97AcwMemc3od3PlGuKzBpnLW1SQZvUuijja5/jvfNYWwkDNWuzQXYv1OZx8BAEz2nYym2IyztTxvprc+nrR7tUlv2oxUOzc6TDkL/4HPihPahyDoE47jMtwGtszF+ntXE4LW8gxZ5FB8aMsNp49Wh+2yB+GdsABmZx7pdJ95sXeb6gG1sDDVs4KMCbpRmU+0LL5JfBheLmmTBbqRgr1T9uLmThP+z0ope61tAZZTogq8MKcZTI6gGUK4MsikUs+gzrblldNHvdCLkauBFdzsUOr6BSrW83u2ybaGZ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 22:36:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:00 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:55 +0100
Message-ID: <20231129223508.1189461-11-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0227.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: dec91bda-9cb9-4827-4809-08dbf12b8ffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RovpGcn53G0FkV4Lg5AbPl/a51Y8G7ANnKX4He64rR4yQAaYndSZnySoRnfgKKxO44RfGIDOqezaF2F58WzMyEBf7uJ2dnYq8zeoTStI+IYohpe7O30iTCLHqRVEt81ohdHZBg3u5oBKMQSVF3Lq2CozwUHAgJl8+vcl7wJhFhNXvouLbrbRDHgIBQF9BpohDDRNnIxJWlmZl3W4Sv3a7l4cy5OQqBrJPf+L+KZ4LRuqev5AL/EEVsHa5bxcyoS51UUwNo7KAPH4xzSrYvHJ9L8SL7VLe/ubDuGUiODIfu0lBvszSEiJ5cX8qRAkepip8jUwsh3UXmqhIK1hE0OuC7mDivYowexbcwdPLTImlmyPzarg5kYZS08eP97pzWhTk1HBwA1MqZ6pwH3Zx4bKt9FVnhUlMNIdQNcSZyx1PL9+RTf/0oOXEWwvbxg93npFuaphlyDRJXwlGZ3L5YKkxPUifClIQM9vTVi0K0VQ6KgCQxH3UDMW1Hu0BAR7ANfBnGLFSKTo/Bc+4sbM01x+m+ITc793+9TlvNM+lXVB0sTLfAJdprhfQBE5OE9X48aEHWVGnG8hpBe+N2h3Gj3sWB21aNY1L5sOsV8XJaG+2cNuCEv29pSZRTaPYzu6o6Vv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(26005)(2616005)(1076003)(66556008)(54906003)(66946007)(316002)(6916009)(2906002)(5660300002)(4326008)(8676002)(8936002)(86362001)(66476007)(6506007)(41300700001)(36756003)(6666004)(6512007)(478600001)(6486002)(82960400001)(38100700002)(202311291699003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zi9mUnFPVlE1UmNJODhySkhjSmFrTTFaTlRZeHhSeCtwL0ZXZXh3VTRHbExC?=
 =?utf-8?B?a0RpQkZ0T3V3VXVDNXNFem1yWGQwaDh2ZkNvZW80V0hBK241WS9UYmtxOGIy?=
 =?utf-8?B?Y2lhWXdML0piOGNMeEdWdGNQOEVYWldrb2kxSXI5N0JwMEdNTUdma1FtaDJI?=
 =?utf-8?B?U1JteDVLRmJJL2tONHIyQTREaURSNjh3WUVaQ2tFVWJ2TWV2OWdFcEMrcTFo?=
 =?utf-8?B?dWVLUUkyUnZWdmJERUhSOWVKR3k0cVNLL3E1SVJaYTQwc0RwS0NDZGNFVG1x?=
 =?utf-8?B?M25oZHQyR1Q4Z2ozNXlWWGpuZGdTS1dkbjhhSHZlL1ZXTE94SGdmTWRPMEFr?=
 =?utf-8?B?VDQ1WE1DNVhDM0t5ZHFkTk8yY0ErVHFOL2FhM3JZQUdYSXpwNDNSUlgxU0JH?=
 =?utf-8?B?cDFRYi9JaGNtUTltTU9CMitHZVpQTllWQUVpMldUUlJmV1ZBSzI1NHZkamt5?=
 =?utf-8?B?dGNzYllGdXNzaWcyaTkvZzV3QlR2YUovdnRwVFRKWkhWQWlKRCtpZzU2UHdj?=
 =?utf-8?B?N2VsUGxWUnFUQUJTdVRHMmltb09JN0lLTm93WWRQMGhTelpPRHVGekRJRjk3?=
 =?utf-8?B?ZUJQcGpyeUMzS2IveVJEb3lBRTh2TFQrSkRmakxHRURWeFZZckxmRGUvbC92?=
 =?utf-8?B?dDVFQVJ4Z2pxNWJQVWpaa3hhbHhIWFZTMkJYbDFqbFJ0cEVUN0tiRjhlWjgz?=
 =?utf-8?B?a1FEMHR6Rmd0cXFwQytBTUY5dy9DRk5rWVZhcGhlQlh2NWhlZ29HSThGQUND?=
 =?utf-8?B?Q0VYejRhRUpVak5aWkY3RWxhVDhodHpKaWVLNzJURlpIK29jditmNlBXRkds?=
 =?utf-8?B?UUpXSDloaHhyNEI3eEVuREpxYVVYa0YwWHkxWFRHVjkvR0MxcGFoeVMzQnQx?=
 =?utf-8?B?VVJ6S2F2YzFwbHQ5eVFzY3lvWGltL1JRM1kvNWR4N0o2Z3B4eDNXcStjKzRt?=
 =?utf-8?B?WFlDb2ROd1Rma2xYV0ZzTjAwWHd4cFU5STZxYUNUejNYVGo4OEhvU21HMFVO?=
 =?utf-8?B?YUV3QkI1bmt1NU1PWEEyMzZ5OUkwWDJrcXRPM3RCMVpLOXBGUFpWSkVyZnFW?=
 =?utf-8?B?SG4zTHRwd2FmMnhYVnlHUXI0SXBOLzNkMFNEbkViZjNuaXlRVnlGU25hQXdN?=
 =?utf-8?B?UXpqUHJUYkFITEplcUFvVTJjd1hERnBJWkpkb09KUmFmL2J2U2JXdGNlcVNh?=
 =?utf-8?B?QTUrOE9RVFhMSG0xRmpTVURONEphNzVHTnJRTXhQa0dPckZTZm1LckFxSnpK?=
 =?utf-8?B?cVltR21qWnhiK3V5U1hTL3phTU9rVEhQb0MvOHJGUXY2Zys3OFNQZ1hVUTQw?=
 =?utf-8?B?SVZjVjBabklDODZ5U1d0M09XRW95L0VpeERCMWxLalJGUHYyY3VuWURJekZN?=
 =?utf-8?B?blJvUTg3eWdnZzUvVG0yTHhNTGVrUnRuZDdYdzVPZUlLNm9rYkpVR0JnRUUy?=
 =?utf-8?B?ZDRxY0hTZXJlL29KSWpXb3VyZS81WEVWQzE2QzROS0lDUkdISGw2U0lRbUg2?=
 =?utf-8?B?U3hzeEN2aU1Zc1k5TjZ4bzhhanRiT1lUcTRLYUEySmEyaHRVdWRiSWpFV01l?=
 =?utf-8?B?bmFYSFRHV0F3bzBJdlc3RHJ5bytBTjZqL29WY3IraEdEL3d5ODE2eWFzL3ZO?=
 =?utf-8?B?TTRjejZSSlE3bGNTcHJrZWhERFY3VFdNTkVraitSYkNnYnZ0dUx2Q3haaTFr?=
 =?utf-8?B?dUhMbldOME9nUjlrRkV5Q3FDbHliaTRyRjZpSWNULzJtdjRPdnNFeTljeUcv?=
 =?utf-8?B?YzVpaFFMMzM0enRjUk84N2NyTXpjM3oxM3FmV28yMmp3YVUxSEN4Q0l3a0RR?=
 =?utf-8?B?YThhUTNpd1V5R1JHdm83SXJ0YnIwUHBCdllmSkJZanliMWNLUlZlUjA4U2JW?=
 =?utf-8?B?NElURG4rb1MremhkdHZkUDZoRTQ0dTBubDZkY2tUaExJNGI2SUROVVg4TURl?=
 =?utf-8?B?cE9CSHZBUVNzY1U5L28rWHRBVWx5NmRnblM5M0Z2WmdITUVsMmt1bXVxWDh1?=
 =?utf-8?B?NCs1Q3hqVDNqOVVBb1lSWmpTVEIxQ2x2b0kvTW50eE5HeVRJVFNKYiszaUEv?=
 =?utf-8?B?NmRtRmM3S3pVcFNxVXEwZkRuMHdpeVhwSEQ2dUdZUWJMNUZncDUvcitkME1y?=
 =?utf-8?B?RHhaQ0dNV0NxdGlRYnpWRTE3clVxMWJpN0NNcFp1aWpRUnVpZ0thWkFjUVha?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dec91bda-9cb9-4827-4809-08dbf12b8ffd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:00.5773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VElFiQIWOqVrydHpUS9m25AxgbipCvMtGyUgPkQcKgTGbuzFgW3xna5fx6TYgd8wYpceDqq/vvlp4T/sb/MEb11h41/Vfz9Iirkxftx4wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 10/23] drm/xe: Don't "peek" into GMD_ID
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that MMIO init got moved to device early, we can use regular
xe_mmio_read helpers to get to GMD_ID register.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v3 -> v4:
- Don't define MEDIA_GMD_ID (Matt Roper)
- Keep the "peek_gmdid" for KUnit (Lucas)

 drivers/gpu/drm/xe/xe_pci.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 889f60fa2e7cf..c949ec7ec43ef 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -21,6 +21,7 @@
 #include "xe_drv.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
+#include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pci_types.h"
 #include "xe_pm.h"
@@ -444,26 +445,22 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
 	return NULL;
 }
 
-static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
+enum xe_gmdid_type {
+	GMDID_GRAPHICS,
+	GMDID_MEDIA
+};
+
+static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
 {
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_reg gmdid_reg = GMD_ID;
 	u32 val;
 
-	if (!map) {
-		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
-			gmdid_offset);
-		*ver = 0;
-		*revid = 0;
+	if (type == GMDID_MEDIA)
+		gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
 
-		return;
-	}
-
-	val = ioread32(map);
-	pci_iounmap(pdev, map);
-
-	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
-		REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
+	val = xe_mmio_read32(gt, gmdid_reg);
+	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
 	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
 }
 
@@ -500,7 +497,8 @@ static void handle_gmdid(struct xe_device *xe,
 {
 	u32 ver;
 
-	peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
+	read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
+
 	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
@@ -515,7 +513,7 @@ static void handle_gmdid(struct xe_device *xe,
 			ver / 100, ver % 100);
 	}
 
-	peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
+	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
 
 	/* Media may legitimately be fused off / not present */
 	if (ver == 0)
-- 
2.43.0

