Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634F3C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 13:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4329610E189;
	Thu, 16 Mar 2023 13:02:24 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675F510E19F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 13:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678971742; x=1710507742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IvD26WOAfu8kBErWHpvaWlvPhcgwLXtlmo7Xk2b8vVM=;
 b=RgGmHxGp2G03KSGSljBt43c7Z2Hs2c1im6qsxPwuIspM0EN0YJ4IVXs1
 Kye8TckuNf3OPu1hCGGLZgGKhnX+cDv/jVRUkJ+eEQ2h4pLJHoRFyIVW5
 ZSqdLpYEY2+/uUJpwK2MkcS4Y9RM7dAVVU13cG9oGfvZK9PnLR5g4Dppx
 SI6NE9WpKFBvEwQ+7WzvtUqfpyQKMC9FJdzY1j+pd9uJFjl23ogqH+t0H
 WlnzXq3IfnP9AFgC326Z2pePTFILFIfi2l8lmyk6nS3yvBIU4cvMz2H7A
 OVxOKjSZJnbVMsIYqgQjrWmNlNLtD8GyNcXv/Yc0mWKmdV4ywtn6M+4CK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="336669958"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="336669958"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 06:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="682306669"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="682306669"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 16 Mar 2023 06:01:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 06:01:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 06:01:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 06:01:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 06:01:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcRtWrk/cZ3/fIJRbd6PM5H0xsgPqbZSHdE7J/VCwpos7y5tVTuwZAMppCsV9I8GB57RYhq2Cxjd+/so8NxLiJd0bZcjgG75tBhb9XeNK4oG1ht4+aSYB1xDNZ0gxR2WW9BXaJRglzdaYQoMNua+c/2pOhL1fdvL8/wfeOHWEO1yDfllpinMv+7pegO4PLE0OgSzLNJ2xlh8l9nlcdiF4asXG+NmddUvhGkXa3nJAVyeNqu5T8+jyUPzieBjvjXxdjpRHhpDBnIvxG6EPXyvQ+L9JwqfeRxjTajkmNPlEh9mtnoQM3xH1ULkLElv9CjgFt8vownn5LDxSgZtj3crNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgmQfQ7O1gdXYK2VeVymh/He9G1Wyk7Y0FQMNtKDet0=;
 b=gfc+J1FxbWv+HIZOcwgMji7QISBVrLk9OJ3aPDpzvhgaEryoEiA02U8AqWwBvq42bUkL14JwysRGivBqnHHSPLRtDSVTzB4ctzKeLHy7PnLFbph5oorgqdEy8oWJip1jUzlIH0vG9UuBBpZiqvIBWY/KeqvVRuSpjoSAUk4x9zMk3Aa2Z0L7/E1K0gAeIZidA9Jd/n97UUH73njT4KLnOLUOZBcfZI6Nx3+gkIExYYzWeqxgw+gzmWMSHunHDwR/Rflu8GVa+yMY0P46q3kYH+p982pBYfsHQ8a1FLgDdGCLt7HfzLQ94f/lKdpHhkBLUCjnr6hJQsT9nw/h4GHgWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by DM4PR11MB6359.namprd11.prod.outlook.com (2603:10b6:8:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 13:01:51 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%5]) with mapi id 15.20.6178.033; Thu, 16 Mar 2023
 13:01:51 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Mar 2023 14:01:25 +0100
Message-ID: <20230316130125.1629081-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316130125.1629081-1-francois.dugast@intel.com>
References: <20230316130125.1629081-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::6) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|DM4PR11MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: 4797b59b-2e23-4052-357a-08db261e9c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XFlEsSX1Rgv+I3sHOBVV4+/SknywdHhozZu+SgDnB3seVwSBrUJAkUrItpe3cROzWCismj93+gfTud/eo5ryT0yIPxE/IoPFtn5ekoEUkBMKm2cvRQUCaNu2ixAErltIvN/GdNDmBIdYRR3mc6gAVJFcfZ3dUaeM9J1BxRDD2FPSHpJH49/uDXl78Kxyxt2jGRrkZfaZg4KImU+JjlfBIGsxWHSX+7+nE4nFX8jCC/k9r64NB8TeF1AyHLaeYES2jItU3a5Dcnf2aMG5j4+ErLoNrRVIucYR3ldjvVx2W2Yzz3pg6fT6+DD7M+HvOaEnoYvjcMG8xBVCSO2tn/DLSqEdWebfhSnEDEvkGSzhci/2irCWDLGBYSPoOVzPNnBtLo3sRFjthcXhCU3OsTO9X4kJ7JTJqdbh7p5V0RJb9ZUV9gdYIXfpPgO0phgV2NWbqIM/l4CaI8zafRFGMHVVwG/deZYhXdtcmjRgcsS9xhruxea7O/OBi+isZlyNilbr3VWYBhEAWLsnfaAhR3YSVvu76sgK+HpDNj44hj0dOJZbKtQ+uEOs+B2zqEMWYAsFqE8Df1S6HrCzKkb5HzcG+XWUcTvu8hPNAkJYoc6QCqhtEsWE/gBSN+j5WvpoXFY7vdLa/W5xGYR+JvJc7hMYsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199018)(186003)(6486002)(478600001)(44832011)(2616005)(6666004)(107886003)(6506007)(6512007)(316002)(26005)(1076003)(8676002)(4326008)(66476007)(66556008)(6916009)(66946007)(83380400001)(41300700001)(2906002)(8936002)(5660300002)(38100700002)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjNaVERBYnZQbGw1Z2xJRmJHL0JmbDFMeEhiNVJuaDUzaFVwQlk2eis2bG1M?=
 =?utf-8?B?VDViZVRPMTdjRVhWb2g3MU55RldLc2RIYXUyK0lNamRITGJHVmFueWFFQ3Rk?=
 =?utf-8?B?SDUvaXRMZW9kcGdwWjYxM05kR3JmQXB2ZEVjTWpId2w0S1RubnNMWHpkOTc0?=
 =?utf-8?B?K0ZQWGpvSlRHeHlXTEZxTEpzSEJCOE9sUmdUTGVEVFRwclp0YW95QzJHbnFL?=
 =?utf-8?B?U2R5cXhWSzFYOFBheFNrOTRmYy96d2lGRklpZHk4eE5JS3gzR0ZrNXVEL1Bm?=
 =?utf-8?B?c0pHZlYzeXdFN0VYaWFGZk4xc3ZoUUFwbmhKOVJtVVgxMHRlODVOekVmRHlE?=
 =?utf-8?B?Tm9qSmNNOC9pZkhiazJ3a3BYTEdGOGxnVXUyemxPU1MvYmMwUjhqRThCb3RS?=
 =?utf-8?B?Q3BObXFWa1h6MElZZEk1c0F0Z2ovWWl5TkozbWZaUldtM09mY09ERHNRcXJQ?=
 =?utf-8?B?NzhpZTVmNk1xVzBpMTRkQW1aYmNCVTg4YUJNeGc3eG9ERU9CTzc4ZzJ0d2Jj?=
 =?utf-8?B?QmNSaUo1cjFSV3gycXdLNEsySW1tWFlGTmZNMU9HL1I5OE5HbEFpUTVRbElm?=
 =?utf-8?B?MmQwaHZZZTN5eExucEg0KzVHOG9yYUxHZldRQlM1TjFxK243VDlrN3ZqSVBI?=
 =?utf-8?B?L2dXT1lUWWRjWmZ1NjJDQWhZTG0zMFZRcy9QNXU1MEM3bjk0MlNKL2hEY1Nl?=
 =?utf-8?B?TlVJZ1oxOG1DNmI5d1RHcWRzanRWNmtIcW1PaFR3VFNDdUgxVUhiYkxHZzc2?=
 =?utf-8?B?b1dHcFBtR1V4SDdXMjVZT3JNSXpkeHNtU0Y0VnRFdUFQRDBTU0I0aVI0Vlh2?=
 =?utf-8?B?TjF2dG11NE9IdkNLckN5Mk9EMlMzMTZOaWFFVTBUVUpBZWFLK0NxeW1xQkR2?=
 =?utf-8?B?MHJ4SmNSZ0hlTnFZZ0NkZE5TVWFxc05pNkJoVVFKT3ZVaG5GaHlyN3FyVU52?=
 =?utf-8?B?U3hVNHl4Z2RNYjVPVVRaVUxISDhSUkx0cTJoendZNGxRTXlCMDdkYlBWaVd6?=
 =?utf-8?B?dUZETFBmcUNjUDJtYmlRUEhsL2lVTHNGSGdhTEpMT1Boa1U4aDBWUy9VQ2ha?=
 =?utf-8?B?cGVIck45MXlYeGVWY1B5SElLZUtjdk9wenV2OWtsN2I3a3NFOGhOdEptekl0?=
 =?utf-8?B?M0M5Smg2d3ZqdVpSS0l0elBRc0NSVG1JWEtnSW8xR2RITHhCNHNmSXluY0pL?=
 =?utf-8?B?Nnp6d0pkbjI3TUNYZW0rNGNZUStKdXdpdXZOK0hlZjRmdWJVSmtPQUVQdjhi?=
 =?utf-8?B?RlhuMiswZWJGbkZ4KzYyeS9ESGtZcEVYbHRBcXI4aDJuNW1qTlJOQ0t6QXE4?=
 =?utf-8?B?bnlwY25ZTDRBNkJzU0paZ2JMYktOVUU4bXN1Z05ET3hIazl3Y2E1cEtKU0tu?=
 =?utf-8?B?anJJNVo1Vm5GV0JFNGd4SDNDZ0NEbzhwRDYweCtBNm1ZVEdBekREWXJFUG9H?=
 =?utf-8?B?WWZVZzh1WWpJTXBhcFF4TnJWSDdtN0dYRFhiWldmYVBveWJEeFFMK1RjRGox?=
 =?utf-8?B?YjUxWWh4WXVoZXN2ME03VHg4eExyZ2dOb2wyNW85VnFkSktwN1prcFhWRjR6?=
 =?utf-8?B?cGx3a1ZLakJuTWRlZzdjdXd5WFd1eU90RS9VV2ZaMUVIdFZqM0Z3TjkzeGJ4?=
 =?utf-8?B?VnBBM2pVUU91NE5qdURmSWdTVjFQdEV6QnJLUDRSUGFaY3RBNDZ2U0xTNTli?=
 =?utf-8?B?dExEL0RWY3lxR0luWXR5a1hpR2dxbXFsUG80elFqU005ZGtiTEZKQzNlb3Jp?=
 =?utf-8?B?d2RSRENLWjlEQlVyWjN2VkNtM1F2VVlFVm54T25EeGhSdEV3OGo2SjN6UVA3?=
 =?utf-8?B?Y013cjA0MzFEK1NIMVFxQ2hUUHg1S2pGcjZKRExMNmU1NUhFUHY5aW1KU2M5?=
 =?utf-8?B?aGI2ZmtoUm1yZHlnQnpaYUQ1ak9OeGN1WlNqOTFwZFNYTm5KbUVKVlIzR2hx?=
 =?utf-8?B?ZW1nY0p5Q1p3bG13dU9DNlh1VWdRZ25zNEM4Z2hGamdiNGV1OXpoZU55bjNI?=
 =?utf-8?B?MHlGV3d0WTNMSWdKT3BqaXJaRW9Da0w1bk5iUnhoL3lPV0FsSHVWSHNTVmlZ?=
 =?utf-8?B?SEsyS0FyZ2t1WkNxYWNRZ3V2WjV0SFp6ZmVKUXpKT202Zzl4aXdvL3cxNHlk?=
 =?utf-8?B?ai81U0RZMElLM3VXNlN4Q08ycGQ0YnBmSnBTZnRweHVJdmJYK1lyNHlJZmZR?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4797b59b-2e23-4052-357a-08db261e9c2a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 13:01:51.5974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IV4QpCQ2SehYAGfsp4W2VFrg9SMQXhu6WDgIGpoHBUSK+sjzsm9OHhkf86dir51IS68v1JY0cBgmucc/xSXdoZ0bNLopLsnacOYw+MBZv3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6359
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH v3 3/3] drm/xe: Add platform specific
 functions for a new platform
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

This shows how platform specific code for a new platform can be
separated and maintained in its own file. With the use of function
pointers the modifications to the common code are minimal.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/Makefile            |  1 +
 drivers/gpu/drm/xe/xe_gt.c             |  8 +++---
 drivers/gpu/drm/xe/xe_gt.h             |  4 +++
 drivers/gpu/drm/xe/xe_guc_pc.c         |  9 +++----
 drivers/gpu/drm/xe/xe_guc_pc.h         |  5 ++++
 drivers/gpu/drm/xe/xe_newplatform.c    | 34 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_newplatform.h    | 15 ++++++++++++
 drivers/gpu/drm/xe/xe_platform_types.h |  1 +
 8 files changed, 68 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_newplatform.c
 create mode 100644 drivers/gpu/drm/xe/xe_newplatform.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4ae440d85918..8745f8095c36 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -67,6 +67,7 @@ xe-y += xe_bb.o \
 	xe_mmio.o \
 	xe_mocs.o \
 	xe_module.o \
+	xe_newplatform.o \
 	xe_pci.o \
 	xe_pcode.o \
 	xe_pm.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 718cd18b6421..103547750ada 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -30,6 +30,7 @@
 #include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_mocs.h"
+#include "xe_newplatform.h"
 #include "xe_reg_sr.h"
 #include "xe_ring_ops.h"
 #include "xe_sa.h"
@@ -42,10 +43,6 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
-struct xe_gt_platform_funcs {
-	void (*setup_private_ppat)(struct xe_gt *gt);
-};
-
 static void mtl_setup_private_ppat(struct xe_gt *gt);
 static void pvc_setup_private_ppat(struct xe_gt *gt);
 static void tgl_setup_private_ppat(struct xe_gt *gt);
@@ -413,6 +410,9 @@ int xe_gt_init_early(struct xe_gt *gt)
 	case XE_TIGERLAKE:
 		xe->gt_funcs = &tgl_funcs;
 		break;
+	case XE_NEWPLATFORM:
+		xe->gt_funcs = &newplatform_gt_funcs;
+		break;
 	default:
 		DRM_ERROR("Unsupported platform\n");
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 086369f7ee6d..18d732b49789 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -62,4 +62,8 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
 
+struct xe_gt_platform_funcs {
+	void (*setup_private_ppat)(struct xe_gt *gt);
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index ef3ccf83ea3a..cffe7443c2ea 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -19,6 +19,7 @@
 #include "xe_guc_ct.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_newplatform.h"
 #include "xe_pcode.h"
 
 #define MCHBAR_MIRROR_BASE_SNB	0x140000
@@ -117,11 +118,6 @@ pc_to_maps(struct xe_guc_pc *pc)
 	return &pc->bo->vmap;
 }
 
-struct xe_guc_pc_platform_funcs {
-	void (*init_fused_rp_values)(struct xe_guc_pc *pc);
-	void (*update_rpe_value)(struct xe_guc_pc *pc);
-};
-
 static void mtl_init_fused_rp_values(struct xe_guc_pc *pc);
 static void tgl_init_fused_rp_values(struct xe_guc_pc *pc);
 static void mtl_update_rpe_value(struct xe_guc_pc *pc);
@@ -923,6 +919,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	case XE_TIGERLAKE:
 		xe->guc_pc_funcs = &tgl_funcs;
 		break;
+	case XE_NEWPLATFORM:
+		xe->guc_pc_funcs = &newplatform_guc_pc_funcs;
+		break;
 	default:
 		DRM_ERROR("Unsupported platform\n");
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index da29e4934868..c2c968da1dd2 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -12,4 +12,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
 
+struct xe_guc_pc_platform_funcs {
+	void (*init_fused_rp_values)(struct xe_guc_pc *pc);
+	void (*update_rpe_value)(struct xe_guc_pc *pc);
+};
+
 #endif /* _XE_GUC_PC_H_ */
diff --git a/drivers/gpu/drm/xe/xe_newplatform.c b/drivers/gpu/drm/xe/xe_newplatform.c
new file mode 100644
index 000000000000..9e791b633047
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_newplatform.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_newplatform.h"
+
+static void newplatform_setup_private_ppat(struct xe_gt *gt);
+static void newplatform_init_fused_rp_values(struct xe_guc_pc *pc);
+static void newplatform_update_rpe_value(struct xe_guc_pc *pc);
+
+const struct xe_gt_platform_funcs newplatform_gt_funcs = {
+	.setup_private_ppat = newplatform_setup_private_ppat,
+};
+
+const struct xe_guc_pc_platform_funcs newplatform_guc_pc_funcs = {
+	.init_fused_rp_values = newplatform_init_fused_rp_values,
+	.update_rpe_value = newplatform_update_rpe_value,
+};
+
+static void newplatform_setup_private_ppat(struct xe_gt *gt)
+{
+	/* platform specific implementation */
+}
+
+static void newplatform_init_fused_rp_values(struct xe_guc_pc *pc)
+{
+	/* platform specific implementation */
+}
+
+static void newplatform_update_rpe_value(struct xe_guc_pc *pc)
+{
+	/* platform specific implementation */
+}
diff --git a/drivers/gpu/drm/xe/xe_newplatform.h b/drivers/gpu/drm/xe/xe_newplatform.h
new file mode 100644
index 000000000000..e4e0448b86dd
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_newplatform.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_NEW_PLATFORM_H_
+#define _XE_NEW_PLATFORM_H_
+
+#include "xe_gt.h"
+#include "xe_guc_pc.h"
+
+extern const struct xe_gt_platform_funcs newplatform_gt_funcs;
+extern const struct xe_guc_pc_platform_funcs newplatform_guc_pc_funcs;
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 72612c832e88..aee2b1a4ba38 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -18,6 +18,7 @@ enum xe_platform {
 	XE_ALDERLAKE_S,
 	XE_ALDERLAKE_P,
 	XE_METEORLAKE,
+	XE_NEWPLATFORM,
 };
 
 enum xe_subplatform {
-- 
2.25.1

