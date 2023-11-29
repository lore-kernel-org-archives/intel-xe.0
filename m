Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687C9C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3916E10E5D9;
	Wed, 29 Nov 2023 01:17:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B23910E5D9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220637; x=1732756637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=321ASdLwBZNVl9VNRgT2GU3ONr8sPhlacb02HFffnlQ=;
 b=e7/ZoJSrPLLuGypVyz9zWcSGoIMFqzifdyTRmY7ILtuBh+5VYd6KCsdS
 VW1kCc2I0vYpU0svPjR1A2jkKnK8V3/IfPFTyNlW0NbnAlRCZYePVhgYr
 +IiOxsTyp9Dh390Nd1da3kRZTz1Cd16pC0R23IB6GrhZXkTNIfjv3wo3d
 Dmkcw9qcvzwhjwQNJpXJ+5YiCy9gvRiLTFcd2TaAgc2PBKnbBBdzu1/D+
 t/9SM835F7EmJYvN4HAp/dO79XTb5hJEabX1fdYp0r2W3uYxE9kWlfzsr
 xUDEAmu+ZMks4ulYO6D7Q7+Lxgsd4nDFBnV39X1rpt3uzyxcDzvzvLvAC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="391930173"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="391930173"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="745086324"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="745086324"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:16 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:15 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ieccw11YbO/4wp7DODUauBjqMoD+9H5A2/KyHAnIJbYl+iIaQn8WnNunJaB5j3ydwSpKUr88ZAt7UoJQLF4qs7QCAx+a8IAMgJq0/ZzshxNBQhq4Nzg+T/nrYltlz0Ct59PfhFjTJh+IKbtR4lnOz7Yn2Ik0mQ38ygY1Tb113hdbCncXmBdyYc7i7xbQ6dPIIvi8h6TrNLzsZfpRSdH/rFRcwJwenKh5+abWtix2yNROkM3wzM7AOuF3jXDnNaWX448ZGAeZVIhqihaSzkhqE68P/yj+dt0n+80u6AWC+UAb7E5NEbz9mBU12JZe+WfbweYZzcstKDR3XJhF13LatA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdZ0HqlXSatTfoUkY23sGnCrIeYgOA+03Waip/RwN2E=;
 b=QvlrLzR6wn+w5+ZinT8z3Wh5RH9ccVhCNpYlH7E34EQT1ULTuY17ValK1xFGxdqbesRPEkQxnZHM+y8/y16X5NcWv+sKSWCz+N1jijrE8HP39eLegZhg5ZoFyyFbdGxBRkz7g05obv81OBDlJaTXkUBoH0iyaBmrdVrABvFp7quXE9sCzlydrczwEZG2h9AocdUR6f+04JhXlfHY08gKYoniHTFM0fvGfeQKrLQmEBsPRRkIIf811w5uewWGTx68X4RE8u8UWBxKbSONkeB+2kH8csXAHfdEjczj2YlcDpohOTHFo/9eES0zCWOBA4LEaHVGJQza4sFUQDGdjdFtOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:06 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:06 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:12 +0100
Message-ID: <20231129011624.836843-11-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae024c5-5b76-481b-328a-08dbf078e60f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K/nWy8vB7gzcMLcVWtYWJAcXNEHeY/RWLP6tnS0HS+0e60Qorfij6GNPT2qA4VkmULf7/ZA04Ok7wCFEXm/z532R/Uy2Og92dcGbLZGLipOHsTN9pq1FA4hELslLCVikNKjSWZ7JhsRGuogdmzeRW19f5ClY29q3Vc4tNO0Pwa5dJK0kE4H1yPuZzH1bUx+SnJh3w6lFF05XcVuk0gYSjk29odFzyN+kaZqndcToKZZPwWYd3v5FhcKH2at050x82hD6pdzXGNw6tQD5jgAZf/dK2v4RtJuaOu8FCAflrYgW6sbbcIfGQyt1G6d6zGafQDw6tm8e7yDYrtjKVrR7aoWkJ0KXs+WSg6WWDR8WLcWc5zeOhWB3BCTVNCru5uuahWRochqlW+TVK0Y0/lPdRQE1KGM2MTeEThDNsCUq21oDwYWekXK5a+qLvlYUciUcdKg9FA9Enmn523h1A9Wohyox6g0gaEzn6Fr/4zRzbA6XrSf3hgKk6vfQ47PfX/AF1adapp++DHVAAwq6B7d2D3S4cizTm/lv4swZ3RGz0wpgOUPHcFGmkNuJ5DGAmWW2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3RGcngxRGZZYnkyRGx1ZzlacDBwL25ISXA3dmw2cDUyZmRSd3puQzZPbUNT?=
 =?utf-8?B?aU5GaGFwMXNaWGQ5SHk1ZzRNMjVtMGs4YWYxSzNpSlB2TVc0VGcrZzNlM256?=
 =?utf-8?B?QmJMTnFpZ3RiVkwvWWNuM3k2V1dLdUw2blNUMy9WOEtpZGRTa3M4NHMxSlNX?=
 =?utf-8?B?VVAvbkRnZUxHbXhJZDdLZmFkSVVPMnVIcVhrNFJRZ0pESnVZTEtYMkRJQTBo?=
 =?utf-8?B?TEExTWl5dXRKQ2RYNnJ1S1c4YS9NbEx4Q3hJdE0wTk9kMWtPeVpEV3crcU9k?=
 =?utf-8?B?cWcyNUxOZVEzNnNxMk51dFFiZGRlR2xteW96SU8xYmk0MWhueGxhbkN6dGZK?=
 =?utf-8?B?d1ViT0RVQUhIVUF4cG1Lb3R1S3Z3NmJrQmlibUpBcU1zLzZGZXJDbVlXU3dK?=
 =?utf-8?B?THI1dmdDOGZzb1pucjRmd3QrcTErZWRvTG1Fc0pFYm9WTHlPSVhIZThobEQ1?=
 =?utf-8?B?c2pZblV1TGwxa0p6QlpMUVpOQjJTMU4zNGMzN3UwUEVTTVNibElvL2NOdlF6?=
 =?utf-8?B?dHgzaXAzalpKaVJEMU15MEM5bitDdFlKSW8yS0diY1YzbTFQUUdzU2VFdTgz?=
 =?utf-8?B?QzV1TEVIVmJIamtvK2ExYWlCTnpXSEoxcEhQRzMwTklZdFN2T2pHSTNMdjgy?=
 =?utf-8?B?am1hbjNreWVxaUhxbjRldllDWjFHMXZ3UFNMYWRhK2tVZmVtQzJjK2JWdUkv?=
 =?utf-8?B?TW5vVnhjUWFGK3BBM1NGVmFmNEcySkpoa1EzNGRZUGdqN3FjVVVPYlRJMUZi?=
 =?utf-8?B?QTQ1eGwvSnFmZ3BkMXlJUVNpb2tGUFFwNjRCSllzOFFtUldEWU15NTN1OGFO?=
 =?utf-8?B?RWpTb1FQMmJmSk1TbEszSjR6a0IrM0lVTkNZZXlxOUNZZjJFbkYwUFpZaE4r?=
 =?utf-8?B?QVRKSktQRmVOeTQza3Evc0M1cFBYKzl2WHpIWHJBTml0NDBKcVh4aEQrWTNC?=
 =?utf-8?B?N3BIOUlGckdtekpKU1FVUTM4U2hGVU9WZEkzeDRGTHpCL3Q0VXZsYVRsT1Jn?=
 =?utf-8?B?ZUpvMkZNSVMzMUdBaHYvUUxVRThKUWpDa1FBb2RSRGJ5cUEvc2E1RDM2SjMy?=
 =?utf-8?B?WHdVZkw0ZE0vTFRWemhpb3p2MlhVakR0S1EyM1B1WDJ2RlRBdFlJKzNZTnhq?=
 =?utf-8?B?a2NuVjRqeEZuK1k5ZVluUlJRVmU4NXNpcWVuSVQvS3AxSENWY3JUbXZZRHNM?=
 =?utf-8?B?S2FkamQ0QTBYSDFpcVZRcG8yT01mSGd5K2IwVkdCT0JjbnZtcTRDOTBhUEhY?=
 =?utf-8?B?TmhYUUZjNWw4NkRpR1VNZTZrOHd2WEFpN01MQmYzK242eDdTaFlLSXd1K3B0?=
 =?utf-8?B?Wm5TbmwrUGpkWU5Eb28rVlBYYkY2aVhjRHVmcTNNRmw1TnIvUkswejF5by9a?=
 =?utf-8?B?dzNRRFRtMG80MHd4ZllEVm1rbmpOT1ZqNlhTS3MvaHdRMy96Szd4cVoySzdK?=
 =?utf-8?B?UDBReTJMTFZNellrZG9hcnNnUitqQWFnZTAvSVNZTitlbVd0WjE0L2g2eXVT?=
 =?utf-8?B?anhDVWxBcGtWQzJzNzlscDJ2T3JFKzFXU1ZSUG9xK3A2QmtKcmw0WGUwdjVM?=
 =?utf-8?B?dnBKNHdqaHdRTWpIb2lFencwMktQQm93SW5tQ1JDMURFZyt2RUUxNTQxODFP?=
 =?utf-8?B?RU5JazZqazVtOHF0R1NzZ1BaY0JwVzN3K3plMXl3TnZUekxWS05lV2pUT05w?=
 =?utf-8?B?NGlCaVkyNGdHN0M3L3haOW5hQllLR0l4YlJyZmdPOTBacWVXcUd2eXIvc2ZQ?=
 =?utf-8?B?NWNOWCtTVGxpSXZsekZGVERjYjNramFjVTJaZ2IwTkdyUDVicFJya3FpN0Ru?=
 =?utf-8?B?SDh5eG10cFdwRVh4US9NdVZZMnl4ZlRxOUVjc1NjV3YwUloyb2xlSmp6ZDRI?=
 =?utf-8?B?VzRFMy9MUHVoZE5IOFFLQXlSUzlvRnhhVVJ5VHdDN0ZsNWUwRVVnNE1Uakxk?=
 =?utf-8?B?bGM2MFp5YzN1d2xEV3lOMms3R2FLZlNkVDhTczZxOHhJd2tieVVheGd5WFpa?=
 =?utf-8?B?aU9wWUV1U1BrMXFGR3lidExVc0tBMXRrVnhhQ1hUbVIrazhmZGFicDAvZlo1?=
 =?utf-8?B?QkN1eWVxWjhZRnZaVUJKWGhOV1psVmEreExQU2hPNW94ZnlielNNTTkwRjR4?=
 =?utf-8?B?U1JOSzlVZU0vcU9xcXQ5OWx5empWRFlwT0ZXQjNFTUhsU1FHdjgrdkozdkZp?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae024c5-5b76-481b-328a-08dbf078e60f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:05.9534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ih861ihDcefH+o0xBs9+B0l9y83C2Yz0WV1CghzK6KgyQIJDViWf+MFtGo2T99jV7gosHiA+aLn65mraYKr6+qIYVMq8lbLo2RBpkSer6zE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 10/22] drm/xe: Don't "peek" into GMD_ID
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
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
index 1d5e50bb49236..be24ea8ac1928 100644
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
@@ -443,26 +444,22 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
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
 
@@ -499,7 +496,8 @@ static void handle_gmdid(struct xe_device *xe,
 {
 	u32 ver;
 
-	peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
+	read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
+
 	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
@@ -514,7 +512,7 @@ static void handle_gmdid(struct xe_device *xe,
 			ver / 100, ver % 100);
 	}
 
-	peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
+	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
 
 	/* Media may legitimately be fused off / not present */
 	if (ver == 0)
-- 
2.43.0

