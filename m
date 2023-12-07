Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C155C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 00:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F5910E060;
	Thu,  7 Dec 2023 00:37:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE59A10E060
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 00:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701909472; x=1733445472;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PLSiyw0vW1F7XMTC3YFG6n49MivEMRkBlGG5i9bmx/I=;
 b=g0eTrZJ78eVo7t+Vo5xzSy57DeO/TeNV2qNJ/us4+Gcdu928gYcE5u4O
 8d8J/rUVmDoBN68WYPx7WZ+FFAY3H3jbMscEi/HGxYmYp3xmn8m/MBYg9
 DeCiO7zvQcnhr9LTpBwS/quMfVTk7wVOuVgNS6sy4M5prAwI03gAb+wwi
 USa4UyoSQhKumlRWPBIKnIxbQfHXCSawX5urJVhKRvEMPqoUt+g3NrFBk
 rDjRrioHKoHLs5zPrbqGLX2oFaXdw23+60HdWWCM+xoMCRITGLW4OBGYM
 RhzDH0FAuWDvvzujfCXKAhGHlC8PM5ukACE9KnueDMxqVq0KuZusiHeMM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="425303982"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="425303982"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 16:37:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="764915900"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="764915900"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 16:37:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:37:51 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:37:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 16:37:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 16:37:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ts8Kn59nk4KAwsjRoqVkFbGYUXN9uuy4Z0ZfMUlHt14WFD+OYfINkRHTia5wN177ONZeMd6oRq9LJyzQ2kMTXyb9sQFZ3x1jVNibUILikRDiGR9mDFcZp2m+meY0rOowPHnXZd/lImn7CE5DoaUJ32NvAXgkBmgIyD7i/ugQ6ZEjiaQhCiD1SsAasyQq0BvQ2eLSoA6VFOH11y7z7L6MnAFNAGYoyOckL4p7GrLJW/9wqXYRL9L5eUNIhVGTWRjj+W4rKQPzesluAqMM7BzQkT+b4R/6kLclGfUr4Pm8in8Lt7iRUoPMwWe7VpXl9SUV0AobyV9VORQeYY7PC/6aCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nEvGeTIgRy0c7bASj3FNidvZeeMYsoRNZuQe3tFOFs=;
 b=SPRgfj6QakIUHUgk6AZ1HPmm+D8vIA0lag+t4a8pLlJrAe7RUGtX6VThKesDI3waTjh9l/SGV1oRvbLbsCJf+DlQjoAb1NiB/h86TH/+t7tfd2VdlOZGz9ChT5fcsR1ImSyOI0nkAN0suHHLKIL6t2N8gXRrTB9uHd8NxX8sQOgMCLPJy2+xV0ir1t2DWjA4+FrdoJpOwX/evwRGfxg3md+wCNPlez7eVnUDHPSWc86sRpqNPrPHns3cP3AeaePJqqsi6Tthxom/zH4ySDqxXEHrVhn/mnHIQ0gqokpSvU2dchekBp18FTDf6La/Pl2lc7kLy2miReMVP16YYaLLVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB7949.namprd11.prod.outlook.com (2603:10b6:8:eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Thu, 7 Dec
 2023 00:37:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 00:37:38 +0000
Date: Wed, 6 Dec 2023 16:37:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231207003736.GY5757@mdroper-desk1.amr.corp.intel.com>
References: <20231206205034.1105637-4-matthew.d.roper@intel.com>
 <20231206205034.1105637-5-matthew.d.roper@intel.com>
 <klfcmsla75h3sxdhd6vjxsrnaej2qycu3bjizntytjyxflae7t@d7dsiab2o3e5>
 <20231206230953.GX5757@mdroper-desk1.amr.corp.intel.com>
 <6q4wwszpvvl5wacpusm6lrrzzqccnxyefz23h5wb3bcidqg3ga@dqdnxieitt4f>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6q4wwszpvvl5wacpusm6lrrzzqccnxyefz23h5wb3bcidqg3ga@dqdnxieitt4f>
X-ClientProxiedBy: SJ0PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 0217e340-053b-47cc-483c-08dbf6bcb685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fCiooSTKsnuLXyNCDsR6AS90wHTH/Z3g2L+P1nj5CZJMzSjuVWjmzAhOOOPP03D6AqQP9OUT9endm9xbjgqIHhu4S9Qw0J9DQDk11r0PFPAYzKsvzXJzEHgvBgI9VN4wMP0kzPqEB0tKOqvSXWeYz8pgp9nOQoQq1oRB+ivfeeS8BU6YWKaMFcuPaYeZrcn8lEM/CZ3fNHT4RPO7hb1kDig07sO3+/28QtRBQzSdw1N80lA9nv32AeaI2w95k9ZZsgxc5dwKmRFwZk28NtO31qOBqIb9KyksamyrNQBB99cv2wAMy9FgLut6VcQUBAOwCCYue1CIqDblZQMj6CYZR7x9uKzepFs+mwDnX1CO1/ScJmaucj9Aih148Fh7BhANcMNZkZ3QkRRsZwb+7Sfyig+wNmmBBWJVVlqnzAmT7uRYUc8H6MgctXXuXiJolR+p1RkIsWrRfLEsd18qjif6wxMraBzUwqq6X9xKqwx8o4if8qmndpYdbU9j/d3wouWQMo0QtCdcfKyhakTEM5dq88fZRqA+nhx2FJGFFlTsmd95zHTNVouUz3VFacjPTpGt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(396003)(366004)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(33656002)(82960400001)(2906002)(5660300002)(41300700001)(86362001)(478600001)(6506007)(6486002)(6512007)(38100700002)(1076003)(83380400001)(26005)(8676002)(4326008)(6862004)(8936002)(6636002)(66476007)(66556008)(66946007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ei5ZCGlywFsxFIyc3TSIKItOTr6xyJKiI6omAN7oEJi2Y3IXDXkPKhn1bvx+?=
 =?us-ascii?Q?KLxZNDfer93/RKhgYovEINmeqIvH078C/ronOVWtb5US2jcCyFGSUPg0Jzvi?=
 =?us-ascii?Q?gQ9ubbghWQpX8Krhm5ByLBi1aMfe15dWa8AdtcZRFNMm2PFXFfuKyOU1l2eA?=
 =?us-ascii?Q?NQr17UpvKhNy5/LsK/2eCLcJHJF4rUnRzBHGaej+rIygynbJdmW2/XgxTKwa?=
 =?us-ascii?Q?BnVRP4ZbSL8kRDzm86zUjMAHkHDTd1edt+3qh7tXMrr5DuAXxmrB5PZORUN9?=
 =?us-ascii?Q?ybQlvPuTbTagepRwYTEKzQk1DMixBvl5z0osmmObV0d+3n4Bgvq7NGx1voH+?=
 =?us-ascii?Q?wEnBcSAEK3h5w5F9x+KYIFq7BSdj00nzvyWdXE0O7nq4DXfnbD0tlL9bbsXo?=
 =?us-ascii?Q?ah/yWieBQKZJAqWCRFmTh/bqiGzQjyDDCvBbHjIzJU+tPdcLfu0kM+gU0HPb?=
 =?us-ascii?Q?+aFd2RZoEerTL+gcSlK6pD0VsNmIJlPImglqmMd28PHwN2djhudN43gX+p1M?=
 =?us-ascii?Q?QfE2IDrO20KkT1J6r837Zs/W/bDo+gvnyHOzTh/Xg9L9Vb8/KOZjDvnqwYVf?=
 =?us-ascii?Q?W00glEcDbkSamfisMqMFGrQkiZKfmrfoTjQDW7ScmdHsFjMh2886vrrd4heZ?=
 =?us-ascii?Q?XxegzsQ81gSDOQ1mlZ+5t+lR8RSCRQU2lOfH5B90W9Ur+w/NlM1sxfkuKUTH?=
 =?us-ascii?Q?PGyGpgoexC7MJo/sGvdGf9BpnTN92sWbcBiP7CMfvPlEor76U4j6iMs04iJV?=
 =?us-ascii?Q?duBcdz2wXRJR3nBFGSsQv1CJGIHp1qO6MSPyU22Se4aAixy0XFV+70O7uLgz?=
 =?us-ascii?Q?5D0Ss936Qv0wlOX1jkEN8E8ayYBmfdg1f1gyPy4PxFxfUPQoCGpL99WtnEUR?=
 =?us-ascii?Q?f0lyNFLUo+yQ/EjiNn1uVWbXL4filOSfnqbTf4Cer0NbEzZ5084fBmnLe4OV?=
 =?us-ascii?Q?s66ytRoBeiN2uYvMIhl3Ml0ZZDJy5mhuWlUk+QXAvoHlPFcnN/j98uB8X2Yd?=
 =?us-ascii?Q?do8X3gt9GEhv9UWgFj6BviMlFGBl8m2SC5XQtNz0s45EF6/a8LXX/HxvV0SI?=
 =?us-ascii?Q?rIRd80nesXJOqoK1tVjdeS5TJfb6rQPOFJWs+3DT++VopqNQOqJDPphKG5N5?=
 =?us-ascii?Q?WdCMkuYlFACiP7n5pBW8BU4d0ceXtYbWigv16oKAA59B9PkVRq5pp2nJMw/i?=
 =?us-ascii?Q?lrexN+1lIiPnW0lxGFfxVbhcLedpUv2KXs0QbWjvu7j+l14PvCcwUzPS0q10?=
 =?us-ascii?Q?LBi9tKI4/AFLcUvueYGOIaR5i50HuJRGZTTUm+AWkFzHvnSu7UxX8P7HXcMO?=
 =?us-ascii?Q?RjZVI7ZBe+D4N8FSgSVU1VANL54L3rtyyt9ncn8zu5PH2d5wkVEBM2CzXfFl?=
 =?us-ascii?Q?1wfko1cGVM6GFY3PgC6XnPqqsucxOrgqxyqOFzujpBt2H0N74sobCt6VmexJ?=
 =?us-ascii?Q?uQUhW5aq9omgT2vHlqp22ckYqy9BxypY4Zl3KChXOIabL6Z3d1NQbxODWaQj?=
 =?us-ascii?Q?eMX1QQ4bi1vRKpL9BaMxoExYWHoTK6wrMUHROahN6MnapEo4hL1mh5tT/zwb?=
 =?us-ascii?Q?sIoDOVBhx8P1BCEdK1m21gcbPn9VKt2yTQGzXd+iazKlfbu2Kq8yZUqeoKop?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0217e340-053b-47cc-483c-08dbf6bcb685
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 00:37:38.0615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3uMTnkFbVrmJvAXcp3GB/OxRwRqr6JazX3C1Sj71wDpQUI8ppruTfDJTAvU8oLrsOsQYStsDdxV4Gj+kdEUV9oMOuIZdiwjW/j1EArw8HCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7949
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Stash GMD_ID value in xe_gt
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 05:19:41PM -0600, Lucas De Marchi wrote:
> On Wed, Dec 06, 2023 at 03:09:53PM -0800, Matt Roper wrote:
> > On Wed, Dec 06, 2023 at 04:55:10PM -0600, Lucas De Marchi wrote:
> > > On Wed, Dec 06, 2023 at 12:50:36PM -0800, Matt Roper wrote:
> > > > Although we've stored the major and minor versions for graphics/media in
> > > > xe_device, it will be simpler to implement the uapi version query if we
> > > > also stash the raw register value in the GT itself.
> > > >
> > > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_gt.c       | 6 ++++++
> > > > drivers/gpu/drm/xe/xe_gt_types.h | 2 ++
> > > > 2 files changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > index 154d6c7072b9..c6f7885ffdc0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -381,6 +381,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> > > > 	/* Initialize CCS mode sysfs after early initialization of HW engines */
> > > > 	xe_gt_ccs_mode_sysfs_init(gt);
> > > >
> > > > +	/*
> > > > +	 * Stash hardware-reported version.  Since this register does not exist
> > > > +	 * on pre-MTL platforms, reading it there will (correctly) return 0.
> > > > +	 */
> > > > +	gt->info.gmdid = xe_mmio_read32(gt, GMD_ID);
> > > 
> > > I was coincidentally reading the PICA_DEVICE_ID for a debug (that we
> > > currently don't read) and stumbled upon this.
> > > 
> > > I'm wondering what's the correct place to read and save the GMDIDs. We
> > > already read it on xe_pci.c:handle_gmdid(). Why don't we simply stash it
> > > there? With the current design, it doesn't seem we allow 2 GTs with
> > > different graphics / media version since it still on the xe side
> > > initialization.
> > > 
> > > So, why don't we just stash it on xe rather than GT?
> > 
> > I mainly did it this way because it makes the actual uapi change a bit
> > simpler to actually keep this in the GT itself.  Plus it's a bit more
> > future-proof in case we ever do start allowing multiple GTs of the same
> 
> I don't disagree with the uapi. We can keep the uapi gt-based.... just
> wondering if we need to keep the read on the gt initialization, because
> if we allow GTs of the same type with different versions, we'd already
> have quite a lot to change in xe_pci.c
> 
> > type with different versions, or if we ever add new types of GTs beyond
> > just primary/media.
> 
> on the other hand, we have 2 other GMDIDs that could be useful, but
> aren't tied to the GT:  Display and PICA. I'm mainly concerned about
> PICA for now since I'd like to print it for debug. Should I tie it to
> the device while graphics and media remain on the respective GT ?

I don't think PICA should be in Xe itself (and we should remove the
display GMD_ID as well).  Instead the display code in i915/ should
probably read and stash it in intel_display_runtime_info during
intel_display_device_probe() (assuming we're on a platform with display
version 14 or higher) and can print it in
intel_display_device_info_print().


Matt

> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Lucas De Marchi
> > > 
> > > > +
> > > > 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > > > 	XE_WARN_ON(err);
> > > > 	xe_device_mem_access_put(gt_to_xe(gt));
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > index 4e48c4643163..4e7a4494a554 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > @@ -117,6 +117,8 @@ struct xe_gt {
> > > > 		 * hwconfig blob.
> > > > 		 */
> > > > 		u64 __engine_mask;
> > > > +		/** @gmdid: raw GMD_ID value from hardware */
> > > > +		u32 gmdid;
> > > > 	} info;
> > > >
> > > > 	/**
> > > > --
> > > > 2.43.0
> > > >
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
