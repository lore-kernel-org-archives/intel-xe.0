Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE94C636CC
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C92110E09C;
	Fri,  3 Feb 2023 20:24:56 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D1E10E0A4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455894; x=1706991894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uq4bSlp/61Grf7pNqWQOQGbdb9c27n2m0kpsJvHnYKM=;
 b=MnZ3qjUpMWGnEz9k8hSSAxkfAW96gJFRHxg4l/8pD67aqIuO7XvxL4RJ
 TfF732nOGQGaOwfCvxNSp+DtWKBtsh+upcOJUGNeO0nRm79hr5vW7OVxe
 fHD+43I4TUAWOyEXN6qxEpg5dcbhb1jAPFdiMjPk1B9Uad1Qhz65Sq6on
 uX2HYSZXAuUsEJ01kiorxauv1jGqJH/ctYYs/vPJ8J4/SzLOaEu7a/dWH
 eDoM1tjMljLvbuqP+RWJBGarfbREPKT0bh/gHZqCi4sw5V/yEnP35ujBy
 6vsqdOsJKGMLn7WoDLpxI7FE6WAenHsys7UjlRY9PDYLtEzgsS7kXGRFy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="327483455"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="327483455"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:24:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="774449925"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="774449925"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2023 12:24:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:24:53 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqRsaff/oyavW4g2YO+FRNS9dwchKd3Nu7jNz89upyLtDwmzrmFu+z0pwGf8y8dh/bBZAYsQH4m7WHw2qjEjVsAOY/vjKD4zTyacoyHiYtYOkJeUJRFm5btKGOrl2PXmT385YBs/X0+ZYaNNhNGUGQii+C01Gq8fuJzrctg3YTokSw4hytDsNPcruNC8BSLAyWTEUYDIdspcZEe+c/40yFjOp2BSseOsDSKtQxCdd6Fl8YQtIlPn9BOTpaRkxw4eLkiAbOkys7F+2E8xaTEVjywnu9wwEPO1XBCwa/1jkbNP2PP0Reb8eQ3q+Le9iY9d2RtiGPJ4mWUaBsLxwvkguQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8l71q4d/LV4Y58tO8cfpwtOdXGXw7SW7NkWdigLiRc=;
 b=GIorym1dGly0r0sABurmMrBbuwk5rHgJOUeAxG/htGbGOrcn6MHNDzSp0RkoEp+IkMnrZN0oVAj1zq4OYD2VFLDUwxRn92GbuC8Q4WySzX0P5pwTI2z1n0Ob3JTZRdBJBaAcAq+5vmZlfkqz9BZKBHCuGGTe4zhV6jU/P8VgztDhgk3AZzQYcpBTS5ptdy+I+gd6+FAM75NbNlOTiyh9R1KvyecVcAjOVn4evaf3c1qNPc55rQ5fofhCA+IX9U/Dh/XOPSOByRRhSqHckrB7sdeXSJh2krGOJyoc0GkgqAZDvb3AcyPn1RklnkMTDk9e9U3bwtbnaT/aoEMAFp501g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 20:24:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:24:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:23:57 -0500
Message-ID: <20230203202409.577032-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:74::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 663b6971-fb80-4901-85b2-08db0624b43c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jh0OTvQ28SfjVYBgbZ4axvr1EKdDa3fpjK4T8IXDM56hHf+ya6zm8jDC4SM2KPBRysjNQCdKKRTRUBI1+MWtRFleulZXqgGiww8NZ28dfJcz+hFhBbh7hIT6pryp4K3TRgMHYKhxCQ+OZYt/DMQtzjwTT6SAIrxV7kwPzDqB59sIvrTcEy4p/9fWHrZ2EGRAbgufef4iF5TFUIqzi05dUDfU1Gz4b+nLypJnRhraAMO9CLGgRfPdKS1IIlP7ouM9RGEPMMBplA8GmGhOB1piCLMAgNgS/Gfs1Xq0myuIoyCL7FCU3H4uz3G5BIrtthp78mWQGXDJ9b5Glpt8G4eRY9n+QvgI3468MYUep/IdzeCi2ydbbPnuAXkwiAPxpstTvMLhtMyHpUVfrPcntt8SP+Z4bJPnp5A9PKeaSatw6Lg1PDIjqwTZfDcnXWw8Lz73sj1Fwd5OQ2OwsACjVrpb2AZApURq+RYhflFBq1g9ieZWeqs8LemyXkHnm9vo5BCGcrsLkgfkaW2z/N0O9PkaUx1tRFH7IHWTZTFzMRBAB2Rzg+dIwHmOYmh3lz5CPTAbhLOIrCufpoSgN8or0VChdJHpfFzvYWHJfNjbXL/DzHh8sXe9xgEs4MUUQRRqpA0dJGzU1zyYrr3MoXNpRUC0kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(82960400001)(2906002)(186003)(6486002)(107886003)(6916009)(26005)(478600001)(6512007)(66946007)(316002)(1076003)(6506007)(54906003)(66476007)(8676002)(66556008)(4326008)(41300700001)(44832011)(5660300002)(38100700002)(8936002)(2616005)(36756003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xPdPFAPF2zPtKjyPXfyq3jCbAeWzTbqgKtNGse+ikjL+FMUHk7Pp+XEOzCGn?=
 =?us-ascii?Q?QjCmFUX8CzWK6hwK2Lelh3FAQhAEl2fQG49tMmKfXbEUXEnkiKsMfvUhDXk/?=
 =?us-ascii?Q?lJ/0Rx62MgupfgMHDcRihagK43Hzhd99FjaGUYll3FjY6BRanCeCx7H0/NLw?=
 =?us-ascii?Q?7yd/pUv36MN9LP795jIW0EnLoof0Jt14JUO4ku9ypIbsB6Ds5lrFfl+Bq0Sh?=
 =?us-ascii?Q?fgfcTIJhLcdPbClF1XTFAFA0Fct8VpqXZq4P6OeZnmxpfKlfNgDu91ycXmPs?=
 =?us-ascii?Q?zpgXPK/Tx4p7Erx3jDMC8qwwoegVHmn5TAHcrp22ajjiF08FGyEUcdL8YYwI?=
 =?us-ascii?Q?21ecAXlgjWmTnw0cy6bHwubL0/TmvbEblpd1n1t7OURp1GFBd0VJs0xJ7cBI?=
 =?us-ascii?Q?2iFx6u8xh1Qoql/ldqhVO/sSiZA8IhY/zToV1CJd5NI432XSW/lEFIMu/Xp4?=
 =?us-ascii?Q?vC69fo+5VCIuDCEOSDu6WLr8BGPZ1q2RRhUwOZ5577ji6y6M7JVFJT9ZGIUr?=
 =?us-ascii?Q?KtbeW/Ec4bHhPdorH/cZ4074Uq8BfoUk1Kj8Q9fAvFb7jLefrT9YmCCkGKHC?=
 =?us-ascii?Q?pWvVwt1aQWgPLyQa/MlYspn4IedCSvYZmWsL4XoOw17rMXGiNYltKqIix39A?=
 =?us-ascii?Q?ch89XmwvQuofg0hQOYZ5f21/5H2HVNL5XCAsWzndynAaF+UYiqaqB/Nlg7iL?=
 =?us-ascii?Q?oKUX0QDolYUUEedX5kPPlzDyDpC3H8ADU4zD+b4wEo8g7ufNjDQlJh/vxpDs?=
 =?us-ascii?Q?JLCJzrQHyEtft3mIc4MHD7h5AHvN7+RzOQers+6gnbyT6PkSYUd+mSeIzMzn?=
 =?us-ascii?Q?UYYi2upHXp4mAk33POV8MmEbqzlzTMuI7/KzRAbL08OdWbkgP++bbBjMDuDV?=
 =?us-ascii?Q?4A3T54GAewexvKvCTRx04PeVQMZ3bpclevjSzUoUzAJzvZY2EIfGAV5UOCem?=
 =?us-ascii?Q?9Spb62uskre2Z38IUXTbINh6pXkk1EZYaJGYnsC3pf5TQVLmi96YAh101+aX?=
 =?us-ascii?Q?OG9lCUaAydQprIUpkXmv/sPjrqBg+2GQW9lCNozHB8AsXIhJn1UgUX/0XEMr?=
 =?us-ascii?Q?/lu/eAtMy4V/fBYYzUSm622FIEtWADmYXO6vvmYEJv2MJVVfuMofG7mYNZg2?=
 =?us-ascii?Q?ig1I9ojMF777DdLMAm1QsfhDblMEVrH5DK5ywNvfLEqfSQnotdjNDBn4GQtK?=
 =?us-ascii?Q?VIrawvQsCFf+TprW94ICR8S0MtxtCSEWBVsm5vsAwe8kzKSO86YvKmIY5xQ7?=
 =?us-ascii?Q?SDAeJSpMSuLLRX/Tc/IoX6zSrscWzpHG5V5cVoD5ngcR8RR7NrIVXl2IFx6N?=
 =?us-ascii?Q?l2gxpCLuC1X2tNlQH6a21b0Mt6vDskKZfJI2Z5eWZeod2JulM4NPueNsxtHO?=
 =?us-ascii?Q?BVyP6hCJe6ue0eY/wIZLlbtWva13XF+15Vskieh6wRuZFgNnNd8WEvvKekke?=
 =?us-ascii?Q?z0eB723SvZ09RnTMPU8n6IVsLqVwMib2DzjW1T4NCx/XQnuXtNblDTwCICKy?=
 =?us-ascii?Q?O4y6M1FOW6o2lfdx49ui1GyFHzh+3JBQHl38hjMH5oQN117nviWaEBO9eXrJ?=
 =?us-ascii?Q?8VHQBCkWMj5xwQ3T4S0h500H2Ntd6eowGnckub7O7mM3N4qtsQOjz0R3emkZ?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 663b6971-fb80-4901-85b2-08db0624b43c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:24:51.7698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xt8XLPy/mjZ31yx/AnW3/NRQZr2TTwJeqy+L9oRNqUVIEGBJHEEgMjV41w0rm1HfiOPvsYVTvb7934ykGAnjUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 10/22] drm/xe: Only set VM->asid for platforms
 that support a ASID
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

This will help with TLB invalidation as the ASID in TLB invalidate
should be zero for platforms that do not support a ASID.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4c0080d081f3..2b1e79e65dbf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1371,10 +1371,12 @@ static void vm_destroy_work_func(struct work_struct *w)
 		xe_device_mem_access_put(xe);
 		xe_pm_runtime_put(xe);
 
-		mutex_lock(&xe->usm.lock);
-		lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
-		XE_WARN_ON(lookup != vm);
-		mutex_unlock(&xe->usm.lock);
+		if (xe->info.supports_usm) {
+			mutex_lock(&xe->usm.lock);
+			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
+			XE_WARN_ON(lookup != vm);
+			mutex_unlock(&xe->usm.lock);
+		}
 	}
 
 	/*
@@ -1859,16 +1861,18 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		return err;
 	}
 
-	mutex_lock(&xe->usm.lock);
-	err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
-			      XA_LIMIT(0, XE_MAX_ASID - 1),
-			      &xe->usm.next_asid, GFP_KERNEL);
-	mutex_unlock(&xe->usm.lock);
-	if (err) {
-		xe_vm_close_and_put(vm);
-		return err;
+	if (xe->info.supports_usm) {
+		mutex_lock(&xe->usm.lock);
+		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
+				      XA_LIMIT(0, XE_MAX_ASID - 1),
+				      &xe->usm.next_asid, GFP_KERNEL);
+		mutex_unlock(&xe->usm.lock);
+		if (err) {
+			xe_vm_close_and_put(vm);
+			return err;
+		}
+		vm->usm.asid = asid;
 	}
-	vm->usm.asid = asid;
 
 	args->vm_id = id;
 
-- 
2.39.1

