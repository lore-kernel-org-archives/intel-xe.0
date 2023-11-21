Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BAAC61D85
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 14:48:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B6C10E0FE;
	Tue, 21 Nov 2023 14:48:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A69F10E0FE
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 14:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700578133; x=1732114133;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PWCD6cqKsL5vM2r0bljivv1Gtm+xaj7NxvERmXKTDFU=;
 b=eqF8EKvNhVyvx8qtN8TkwoRkICvI55j8xDiVYRIAsXKcgrgvAAKCTiJm
 i4KYkKVUyWPOVuS26G6t4CF/TdZUC4UbM1qtXEGL1U4vc63LhPmVMClOy
 O64+xj1q22tkBOGMyLl8zxi3fMqBxahK+eHgio6Oq+L6+VLUhOH24CKqL
 twBNCJPJPfMOlTR8i5DTAnz3L9pBc3Q9bHVuSLRAV+wbcp5J4HyqQfEpY
 s3p/oJAVCeQNoe3yKiqJ0TH9M+/Cam7VUFwOdbym4h5eIGOp1b46PaQdb
 y0iPshvEa0EKUN4B59WF+e6nvSTDJgFudyPQ2vvuGTUJF32koHzikdnGJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="456186293"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="456186293"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 06:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="890267920"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="890267920"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2023 06:48:52 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 06:48:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 06:48:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 06:48:51 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 06:48:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCpspLwx87l2x+gfoPwbYP7j1PaWPezDBx5AvcC79JL/ocHVOP5fNj1JZC1vdZx4PgwZ5812kCuyUUHR4kglKxqTLkdIfO4CHw8chP9Xn76Fb1MI1+kYLxcRXpkJ+TdovhINf/JWKK0Jb2QRH4FXJzlZM3KcLCEoEkFZNhifqg+wfJrUda5kde3aOmyuIM4aXGZTvd6HKM4sK7wCfQ6Z6O5kbeoo1Whs32DUStp9Edk0MgxsUvNvMHE7cBGPaWHPn/3hhtBKT8yXpnpdjx1qqubP01J4fF6gYSsnXnS3Hl/ITHSGTPreN+pVuS/7HryqbDFsqoe7S80ESiEizrL73g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LY3HMLoJZ4o2A3bWhk6NzG5oAMyIh5vc6EEY48Fcuvk=;
 b=JMEYCLGvhytN8N+kYgdY7Uk2l1xTMwFPcw1ZEZbT4lDtJA1aGsvhmDrFIbV9s+Lo2xXxLTJW3kZb0rSTRnCpLz7TUoPOlHe7hb1UauOq7u41bgmNmNiZ8w7wmNCoy41yJQVZ4KDyS/RnVXYRNATtFZr2MRt1kJ0Bupn5saXiLX5KuhDS2R/v1QCysgL250YyGo7ZAyZoRylmEtsazbrRUrfuHdDJ/wEPDWn1jpHZEghVXjSqnMBAZysdM1SI2O522dT5BkImFK+LYsHoWfoCz5z2yCXBwSlTh4U4QCV0JOKDpvS59Vazp8r0m0URkaqZdOcra+lobNhwIi0+i/oTdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5189.namprd11.prod.outlook.com (2603:10b6:510:3d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 14:48:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 14:48:49 +0000
Date: Tue, 21 Nov 2023 08:48:47 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ykymzzr23ixp3owtn6tdeieb6eyxpnzeypvwajx66mqkkxobzx@eu26ntxgx6fr>
References: <20231121112555.3734840-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231121112555.3734840-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: b358e6d4-e4a3-4da2-b7b8-08dbeaa0f899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3keZjZkpEps7wbfUVtS5j1fOkZW0AfCUpmV1cvrT2M2WRm1kAlt8X/VKBdo2/W2KWL2MzTpWih0E5kdEF/ERqST/7G+nkAgp0jrlyUiqjM5ndhV7VqJrNx+xjCZdi/JTZ1XDhooEMrx8R8MTm8H/7t9jPf85QYR8NOxNFlfFxZELXXOsvp4oJyHDCIxVPI/zYk+y65KsgjGBDX4ZZPxb5L0/qZ1cxWg730piu+7rEQAHyVGXOXuqUOgGS9tY07oD3Hdq92QGWvTOFT+P9m+eEFyTVAdn7L8ZPYJxAefNWgHJwPxzWOnjhQnn8gsc4pIIwx6N3poSrrSUk+F6+L9lUouKWNBZpq3OFDORY64RPB27+kpQYT261H4WDqZDElq9SngdYT5L3t7DU7KIm3sFyYY8OKuLko83ww2art3p4cx+uregzU1S00yOB5Z1qSQs+d2gkIEJ6gzXGkEAJWJuBE7u1uG1PpAlaJiYofCDU+sMrAO53vaMw9gufg56Jqmlzq1JQMO5kiGXeYvrEeNM41t9Pqw+2Hl5/yNKx2FZd4WjaDkcDqZ7kr5bKZ+OdQYw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(39860400002)(346002)(366004)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6486002)(2906002)(38100700002)(316002)(6636002)(41300700001)(8676002)(8936002)(5660300002)(66476007)(478600001)(66556008)(66946007)(6862004)(4326008)(86362001)(6506007)(6512007)(9686003)(26005)(82960400001)(83380400001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8VOgBD9sC0oOW3xNQ7uBMwtp+ze9Iq+ZlioKfKnrUD3CZoK7XR30l07kMsik?=
 =?us-ascii?Q?8Hdeb8KToHwS5+2oqa5evhS3Hyu2PsKgOa6Hw1Eqi2+nsDl2zomWozgnjb74?=
 =?us-ascii?Q?SXKDWLUzpI7Y6eeY63nASbAU9+78uZ6I2SUaxKgDhQbaC0eW8RbcZnyBk6Ed?=
 =?us-ascii?Q?lfA/s6H2HtfXOMKoBHWq3in1bcnnmp+Y08JCVLdMKeP4vIEXTiEKrylrP9cb?=
 =?us-ascii?Q?0Bcu/i90QRZxZIQs+ReIetmHJ0g1FpXZaGxPGxD3u+ba54rXcppyhMEaVvxP?=
 =?us-ascii?Q?MJ/Kr4wvzT2bm7zw5ui6yrQBu9UF4IuGGHTeFx6zyKU7cco6GhyB1BFxpV6A?=
 =?us-ascii?Q?3y6k80/X3NDsLl/9i0/fR1wfyXV5xyYGCnX16f+oNJG/qmmgaVEb6WqvecB1?=
 =?us-ascii?Q?9FOU99lo+tttGUFWCvYHXM0pw0auXStA7P1mxNXTPDG0Ak0zNGr6iipJbC4c?=
 =?us-ascii?Q?baLkkbFaw2hJla/uD5kFrTj4NPf1XNKOatsswRQ8cKixL3gbJ+0NiU5SMFet?=
 =?us-ascii?Q?NLDpWrUN+X/l+4swydhF7x7viHGAMpV7tf/T/DcpZ6f+/WYOTPxYGAcxX0Qs?=
 =?us-ascii?Q?6vF3cD5NiM7peDx0YBfh+m/Ff4AC5cBksYjlkVXSGrmy66DmdIcCVlfiptl9?=
 =?us-ascii?Q?GL/H/uzvAaOvfVPAZzJUzltokS0JaOmyJCs4mFhIxa4rqVi0+5pb5TCFgyn0?=
 =?us-ascii?Q?BF8QvixACGAEgSBF2Pba87yWkxY2/I2CDeBGRs0yL3WNNJsC0zuDL1QB9mtM?=
 =?us-ascii?Q?QkXsIpq4ZhM0mj33w/L/HnTwAkA/m+7nWkJuAux8ys8z1MuiSTzTG3oBLWQ4?=
 =?us-ascii?Q?1lL31fbqQ2FCV4sAF8xL6h3Hhi14DRoQvDC1DTmwCggDLZfdeg9FXLskPSEs?=
 =?us-ascii?Q?UDwyqIngrz4KOmSVi7a0nOtOVBdp5QrZcFHm/F6FdHZmJecKI2O/AVVla8eu?=
 =?us-ascii?Q?YhKo6cnP4tvtEOhXjo36KdMYpppM6+rvCxXCBAGx+QN6lC29NCkrxhBtpYLl?=
 =?us-ascii?Q?hiqIQRHPx8tv2AKbIggozuj/jqx/tVXmaGqY4e7Pq/SyINCHNm46OruaQh5y?=
 =?us-ascii?Q?cEY3+HyAGfbd1GJTeu/LmVd0nJ/+HeFB212vmEii9syVwQZbyK6StHgxfbZG?=
 =?us-ascii?Q?tQBkndDY2INPk+Xii9J5H741DSBifdnYO2KvoD9wJOVvz3Cm8w8sME57GNOM?=
 =?us-ascii?Q?lI3V6Kf3FYholMlH3vSMjaq389PHmlSPQqJKbVGKUZjE1VSXXmvi1d9NZvFN?=
 =?us-ascii?Q?3tRgE5u5BdHk41FeBSn/mjx37qaZGohFr1MFAvDfuZ/RirMs810gNgUiTXMN?=
 =?us-ascii?Q?CG1VqKT2o6Nrjc60AbFciw830pdlkbsATvAf92Q+VTB2nmiEBKebn4UysDcf?=
 =?us-ascii?Q?XjVnC4VPBJXP1RcD6wXuDfwQ+KKY66ubKNhGpiANIZUdiVzGYI4FeL7TGQ3h?=
 =?us-ascii?Q?v+yYsljTMuin+AJrMOtYxvASR+oTwEI7oJ5KN8BbM6ITKehH2HJrP4UGs7BZ?=
 =?us-ascii?Q?H7yiaB8EEM+ak+Ck2IzZNGK1fJaS2g3VuToqwGp7IVQBnLE4dg/lqF2DnGt9?=
 =?us-ascii?Q?jdrqdhaOvccUbTEjJTVOAHBCtt8Uv783frvkSY8lvNg3HY1HfTUUFl3n4kVu?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b358e6d4-e4a3-4da2-b7b8-08dbeaa0f899
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 14:48:49.1263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJif0tEIp/HPmlMFhftUqbfKmVQT4fnEJbRGntML0P8gx2XMUz2i+7HWpN5C0j2X7SVVtMLHAocYVOoYMt7mKm9RR6ScS4nWCZyuLyn0Txc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5189
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Move wa processing to gt_init
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

On Tue, Nov 21, 2023 at 04:55:55PM +0530, Tejas Upadhyay wrote:
>Currently WA processing for gt is happening in early init API.
>It also includes processing of WAs which needs filter based on
>hardware engine by looping over number of hardware engines in gt.
>
>However at early init stage hardware engines are not associated
>with gt in software which skips processing such WAs.
>
>Example WAs which will be fixed to apply after this change,
>"14011060649",
>"16010515920",
>"16021867713"
>
>Fixes: 811a9b3d262d8 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 0dddb751c6a4..3d0f7b6f952c 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -311,7 +311,6 @@ int xe_gt_init_early(struct xe_gt *gt)
> 	if (err)
> 		return err;
>
>-	xe_wa_process_gt(gt);
> 	xe_wa_process_oob(gt);
> 	xe_tuning_process_gt(gt);
>
>@@ -495,6 +494,7 @@ int xe_gt_init(struct xe_gt *gt)
> 	if (err)
> 		return err;
>
>+	xe_wa_process_gt(gt);

the problem with that is that if we need to touch any register already
touched until this point, the workarounds would not had been applied.
Digging the git history, I had added this commit exactly to be able to
initialize the gt workarounds as soon as possible:

	4eb2e8d25ab4 ("drm/xe: Add xe_hw_engines_init_early()")

And then

	816d37907ac6 ("drm/xe: Plug gt WAs to gt init/reset")

Note that these commits are in the xe branch, not drm-xe-next.
So, it was:

	xe_hw_engines_init_early(gt);
	...
	xe_wa_process_gt();

That gt_fw_domain_init() seems a very poor place to initialize these
things now. It started with commit b892e30c6cd7 ("drm/xe: Move load of
minimal GuC and hwconfig read much earlier") and then people end up
adding random stuff in that function :(

So I think we need to get back to the original idea of _early()
initializing what's needed. Then we'd probably need a few cleanups in
the initialization sequence so the function names at least partially
matches what's being initialized.

Lucas De Marchi

> 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
>
> 	err = all_fw_domain_init(gt);
>-- 
>2.25.1
>
