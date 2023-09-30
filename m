Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1006E77354
	for <intel-xe@archiver.kernel.org>; Sat, 30 Sep 2023 06:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6665B10E1BE;
	Sat, 30 Sep 2023 06:00:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE27B10E1BE
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Sep 2023 06:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696053606; x=1727589606;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g0xf7f9ollvN9/yXVYmPPpeRDZhvFVc/PaAoPPVu/NU=;
 b=Q9VM8lpSXWXGyfTBKdyQm66G2mx4ThlVhkajFL6c74Y49rbsVzqaF3Ks
 4SIDZeh0uWmH0LKWV81435hFzkIsQ39vnEuQdtPWFTqSNWooBwAGyh6po
 2cuX6Dz2KlzvmHoMjk0o95/Zvq3dUbHBSxJEXq9irs5tsqqQ9SvJ/SK7i
 b7hWIKtcXQR48tMVS9mr1BJn/Db2MQXvepiJCTQCp0v2ann3VdBz5ni3O
 XG1S88uQJAz89oWJD5sbgMVaxGt/xano3cyRUVqGNk/VOyDawKKN+oxY0
 YR2iUIQf+FWnIwQ7Gn38fSEaqjQttmAz5OEnB21OLOLFF0BLw7hpyfCC9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="382334117"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="382334117"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 23:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="997131013"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="997131013"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 23:00:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 23:00:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 23:00:06 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 23:00:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKd2X7ahhACHwqy+7E0YFVenjMY6qmV/nZBhr5yS6gDILjZa6831msh4ExQfEkEYYba7ZGripjhoOmnjwyaNjL6xF5zyzdlEVei3b1MAXl4aP1nlCM8zGbaLDYI64uX2tlMDX/O1r9BxcqYyHl0rLzkUpBXu56QK1S1sO6LqzaicwvMASzpvhFHN5rtlfPpOP0uLL0FufYGaGBiAGzOgcMWKoh6g94nWfIqM0NZdI0RlkEwF2KQ9JxDwbBd//SrpNhyVgt/8Z8H3PnWR+Dln/PeTJdIliZW/Nl8TqpDlu+t+gbofGJAS85e8WVLp93dLClIcBStqPXj7tecsFwffZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwDrTrpdbTBqJJB+Lf4iHOitNVALgGZOQPQO4Wjb2dM=;
 b=JJ2YM5wcYz1YfrOyeJphp1iTLj2flhWySI27JnNXNNJwH938GhZGhb2ySAmjR//TmZbpRcHnQQjcxM8Y1FwMb5Xd3SFOGYsEsmr99M2fbYVWc+jnu1bLAXLvS9NSEJLJtg5X2gXEWzBDmj4O2B+BjW4s3ayA+5M39TOuKEghjNsLtPAqUYxgsCvhxiiQX35DEMt/lrB7IE6FcEttzjFNMUSMpzzAJahVlO6bg7dLe9siRns3LiwpWY/KH9IQ5h1aAspXZUErVaHo/h35sr5Q4wgVfOG4RBI9k/132LY8/fwkUdsUrQWR3bRTx8OjmY4epUa+FAtpP/bK1saxgNgOFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Sat, 30 Sep
 2023 06:00:04 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Sat, 30 Sep 2023
 06:00:04 +0000
Date: Fri, 29 Sep 2023 23:00:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZRe5YXEoH2/v06O0@nvishwa1-DESK>
References: <20230929062420.394375-1-tejas.upadhyay@intel.com>
 <20230929062420.394375-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929062420.394375-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::18) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CO1PR11MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3eef72-0d12-45b3-29c6-08dbc17a7d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AoNLY+QBMM/9/XvASfQgzXixHY6a+qjmn+3mFso97dmtdlh0760k08eJxWyMjt5XO6Tu8vVTiGLXQDB41XefuVZRoowq4MAks7PvWPCgDrFMFCsVb1rwz7DWH1m4ZPfAHcNsCF/wK1XES/5oK/21KsAYKxQ6yOZgwfxwtqD1TZd5oj92elCm0EL7tPKquuGXEUARNH6J/mTAcmtt+67zRuEiti3ZLNiu/W/K84hNfhXf9wgRoGuOBdYLazUkrP9hSVlt0GISy/oDl8LPBByihCJM6axAOhZMbg2fFCEgBYmszbOdhJmFXiy8Kfp3fC6htwRpVj6lMDspgfboK/afcKkS6fZaI437Y4vPmzajPDS5ozNdXGcUrIb/aOsj3Y1RenpHHkvRKtCfHfPe0qggjIVuR8ROQZZX6dEWjMu76OmPSXyzUbYIHIffo64C0Abcs+qp2y4LXCwmz1kOsw1knL9ZSJ+ZsdVzI9uj3wCJYdwsvEA6BouHR1hfOfLX/rORRj2ZSTuUbqVPqeH7hvF7pXCJ7TfMmScCZ5lf5BkNmXDVAb+gqOZiwJOCewrVmfqP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(366004)(39860400002)(376002)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6506007)(6486002)(6512007)(478600001)(6666004)(9686003)(8936002)(66476007)(66946007)(66556008)(8676002)(316002)(44832011)(6636002)(82960400001)(107886003)(33716001)(41300700001)(4326008)(5660300002)(86362001)(2906002)(38100700002)(26005)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X03Jpy0NvUg0dhfCrqC4Y4dqZ3SmF+wumMkk22/rmGuKx/d83mfvb2mIWiyn?=
 =?us-ascii?Q?0E/eBUOKXKjWjg2QC1hKuXuT8hV3+hpghVMWFuknHOW2b3+R4FbdoZgJjIlk?=
 =?us-ascii?Q?fo0BY/yPa71++xNZRbHGUzRCqsSR+MMYLrlDSSOpiLBbbWzDX7ZCSsNbjKU3?=
 =?us-ascii?Q?I4Eli75Mav+l2qW+WsMSR3/4sJHRkS7wYyDlPSl1lFgz8m9tjJxadlN6VIVa?=
 =?us-ascii?Q?WEC5GOdHfZvxTkoyFLUlv0JTVy9SB9ehnpyRTFO8q/rM73eMDkW+5maBxHwS?=
 =?us-ascii?Q?lpdJFHW7qZmUb6XRHDrJYq9kLdvyrOhPzP6Wob5Rtr1ml+WnX/pffmIEoEUq?=
 =?us-ascii?Q?+uflRlCYE4uxkr/sGWJuI6liGk29eTPcSIYf/eiPKuHBcDADmmWyH9K5BuUU?=
 =?us-ascii?Q?2urtkucDiWo5QQ6+ybljYMLTtkQWGMbFOUxs1sXZRLWroxoo0A1EYcovCO+G?=
 =?us-ascii?Q?0C+1p/myvFRYwoLug3qi74WV5o+1ZVTffB04S+/xh2H5itg8+bwfssxjnT8f?=
 =?us-ascii?Q?AgaOVtECJMfVGN4pwld5VcvtJ1uWiCo3oc1cYQEtqlaH2aQC/MepP1puxwPd?=
 =?us-ascii?Q?PUl1RwSWbAk+VXo3yy2z3SZsqLDHD6BLUwDXNclH2nmj1XEi00th5jcqxk+Y?=
 =?us-ascii?Q?lFfancL+et1EcyI/cxhAHaEHeJOP9T9HEbvh5e3NVTR/nL3OLAilD5yRV06Y?=
 =?us-ascii?Q?Z2a2iotXZm0sg+U+u6NLwzvGryymTO4Jdx1qhiCQUFn1nzWMtNGquNcUffWT?=
 =?us-ascii?Q?VP2Gb8N020H+rTLSV9Gvx6S/RJbV5qji5tbuUOTb0qlxERIyevKYKhq57yW8?=
 =?us-ascii?Q?vEuyDpH8N0+qJjg9oygC48BkRyNzSuytTTUkp8wwQJeidifRGAJZQUnwsGFB?=
 =?us-ascii?Q?ZdoiX8+aq+h0E/jFZrmR6tshSkhHqU0HLOkN3sW0Dk+I+thVBDqpbCu490cT?=
 =?us-ascii?Q?GtJqrrIjYXqR4v4i6PxtNXWNbETxGu8IWXT56gwnyKKKhM24ybZ/uFxfruB7?=
 =?us-ascii?Q?2/VTPa9Nhuy/C5EvlaiaWqc5S4CqXRCJT/4yP3RzgtFPj4Gjy6zyoz86kZCi?=
 =?us-ascii?Q?4K13TEqcMe/9a9vAB1Ab29gP+YAfifkeltFnu9XIsh3EsgcsVNQDIkj8NnAk?=
 =?us-ascii?Q?byhsDFXeaxi+mwO4+oi3iOBlyQCGoobRJaNnecmhCD/TcUIE5Neaof959f0t?=
 =?us-ascii?Q?Pt7dYaOaYbZT9R6a5wco69MgJihaqMuSUpKbCzZHtBkcgVyxz7ouREy0ozh+?=
 =?us-ascii?Q?BtRdCu/J0oWN7BIvtX5BlA9W/q7UG2tYTEL7kmekzbiBfAq9jtQ+geVxdVsW?=
 =?us-ascii?Q?bAiBYhDqxZV2lX0JTmPTP7/XBf42gOXSURdbED6ZIxdJdlUJAuDANTEhK0gA?=
 =?us-ascii?Q?/q2U2Xfx1xL1myAkVFxXI/AkoJdcbLJWsI5AbdKW+8SwKtT4pjiDDgBTnvd2?=
 =?us-ascii?Q?dOE2gFCPzUnlRZUba+DHwwPx9JHTscSt9A7/3xZNecKWRCWrxbvU6LXXvPoV?=
 =?us-ascii?Q?JenwHMawyfmjZ+27Vu5NaHGPkbclBil/p/sR7WyTQ064SuGGcAHYQzyRlEyv?=
 =?us-ascii?Q?Mb3GBqvoxFJryyv+MBDsmtborbqapIUJRCGZV+UPwRN0wAK4aI+aYUvcQPqm?=
 =?us-ascii?Q?usqaDq7iV0j9tA5a9J6MhQ4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3eef72-0d12-45b3-29c6-08dbc17a7d90
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 06:00:04.0873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDmg5VbqAGclWu7b4yKIuOP5vkwoTAguQ8z112ErR4Q29l+8Mxm3WDb+P7Eh6pXFuOO9hR6DiiBsUFKEqQgmUaObGrVcHtYXnth1WfCeo1euaflk/CgrIL/A9/RQosxE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 1/2] drm/xe: Introduce low level driver
 error counting APIs
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
Cc: Roper@freedesktop.org, Matthew D <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org, Wajdeczko@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 29, 2023 at 11:54:19AM +0530, Tejas Upadhyay wrote:
>Low level driver error that might have power or performance
>impact on the system, we are adding a new error counter to GT
>and tile and increment on each occurrance. Lets introduce APIs
>to define and increment each error type counter.
>
>V4:
>  - Move API declaration under tile.h - Jani
>  - Typos
>V3:
>  - correct #define max value
>V2:
>  - Move some code to its related patch - Michal
>  - Renaming if API and enum - Michal
>  - GUC errors are moved per GT - Michal
>  - Some nits - Michal
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
> drivers/gpu/drm/xe/xe_gt.c           | 18 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt.h           |  3 +++
> drivers/gpu/drm/xe/xe_gt_types.h     | 10 ++++++++++
> drivers/gpu/drm/xe/xe_tile.c         | 18 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_tile.h         |  2 ++
> 6 files changed, 60 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 0717839ae964..dc57b38d7e63 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -59,6 +59,12 @@ struct xe_pat_ops;
> 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
> 		 struct xe_tile * : (tile__)->xe)
>
>+#define XE_TILE_DRV_ERR_MAX	2
>+enum xe_tile_drv_err_type {
>+	XE_TILE_DRV_ERR_GGTT,
>+	XE_TILE_DRV_ERR_INTR
>+};
>+

I think it would be good have some kernel-doc documentation for these error
counter definitions.

Niranjana

> /**
>  * struct xe_mem_region - memory region structure
>  * This is used to describe a memory region in xe
>@@ -175,6 +181,9 @@ struct xe_tile {
>
> 	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
> 	struct kobject *sysfs;
>+
>+	/** @drv_err_cnt: driver error counter for this tile */
>+	u32 drv_err_cnt[XE_TILE_DRV_ERR_MAX];
> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 68cd9a7ee087..a8b5f012588b 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -47,6 +47,24 @@
> #include "xe_wa.h"
> #include "xe_wopcm.h"
>
>+/**
>+ * xe_gt_report_driver_error - Count driver error for gt
>+ * @gt: GT to count error for
>+ * @err: enum error type
>+ *
>+ * Increment the driver error counter in respective error
>+ * category for this GT.
>+ *
>+ * Returns void.
>+ */
>+void xe_gt_report_driver_error(struct xe_gt *gt,
>+			       const enum xe_gt_drv_err_type err)
>+{
>+	xe_gt_assert(gt, err >= ARRAY_SIZE(gt->drv_err_cnt));
>+	WRITE_ONCE(gt->drv_err_cnt[err],
>+		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
>+}
>+
> struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> {
> 	struct xe_gt *gt;
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index caded203a8a0..9442d615042f 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -67,4 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
> 		hwe->instance == gt->usm.reserved_bcs_instance;
> }
>
>+void xe_gt_report_driver_error(struct xe_gt *gt,
>+			       const enum xe_gt_drv_err_type err);
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index d4310be3e1e7..4645ea9b7893 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -24,6 +24,13 @@ enum xe_gt_type {
> 	XE_GT_TYPE_MEDIA,
> };
>
>+#define XE_GT_DRV_ERR_MAX	3
>+enum xe_gt_drv_err_type {
>+	XE_GT_DRV_ERR_GUC_COMM,
>+	XE_GT_DRV_ERR_ENGINE,
>+	XE_GT_DRV_ERR_OTHERS
>+};
>+
> #define XE_MAX_DSS_FUSE_REGS	3
> #define XE_MAX_EU_FUSE_REGS	1
>
>@@ -347,6 +354,9 @@ struct xe_gt {
> 		/** @oob: bitmap with active OOB workaroudns */
> 		unsigned long *oob;
> 	} wa_active;
>+
>+	/** @drv_err_cnt: driver error counter for this GT */
>+	u32 drv_err_cnt[XE_GT_DRV_ERR_MAX];
> };
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 131752a57f65..708dd385f2b1 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -71,6 +71,24 @@
>  *  - MOCS and PAT programming
>  */
>
>+/**
>+ * xe_tile_report_driver_error - Count driver error for tile
>+ * @tile: Tile to count error for
>+ * @err: enum error type
>+ *
>+ * Increment the driver error counter in respective error
>+ * category for this tile.
>+ *
>+ * Returns void.
>+ */
>+void xe_tile_report_driver_error(struct xe_tile *tile,
>+				 const enum xe_tile_drv_err_type err)
>+{
>+	xe_assert(tile_to_xe(tile), err >= ARRAY_SIZE(tile->drv_err_cnt));
>+	WRITE_ONCE(tile->drv_err_cnt[err],
>+		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
>+}
>+
> /**
>  * xe_tile_alloc - Perform per-tile memory allocation
>  * @tile: Tile to perform allocations for
>diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
>index 782c47f8bd45..092a6b17a97e 100644
>--- a/drivers/gpu/drm/xe/xe_tile.h
>+++ b/drivers/gpu/drm/xe/xe_tile.h
>@@ -14,5 +14,7 @@ int xe_tile_alloc(struct xe_tile *tile);
> int xe_tile_init_noalloc(struct xe_tile *tile);
>
> void xe_tile_migrate_wait(struct xe_tile *tile);
>+void xe_tile_report_driver_error(struct xe_tile *tile,
>+				 const enum xe_tile_drv_err_type err);
>
> #endif
>-- 
>2.25.1
>
