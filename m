Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B82DC76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 17:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F5B10E00A;
	Mon,  3 Apr 2023 17:50:19 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7709110E00A
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 17:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680544217; x=1712080217;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w0Sj+e08MbZvtInQUbkA//o5ahTrTLhWIda4Rg78jLU=;
 b=VBOtAY1ELw9HL+LJ2LIE+99EoPrisO7nCtJQsDthAO9OrPlehAWJE9GT
 /uXarQbmAQQlEOtvfaL6xRpe78b3aZfXXIgY3/qS+t7K+GEmZb2iMuE9D
 zgKLkqHrwUlfaaQhph+Tcm3OVdJ5AHEAHlkmZeJosaYPnnfFaVYxC1j/c
 8AEvhJcUa+igB6kNy/ea/z23n/tRWk1slAl7ua5huIVboKsJDWoFlSqaq
 wEeIOiPYNzX6G9Y1bIkEy3LvnNY9ODXjLfzDPvHVe+AO4rWCOfu3YbA0g
 gi5zT5iJ/yHxvTJHBYyVEbpBrNNse06HUeqIQIORusACwBgK0KADehd5+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="321634037"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="321634037"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 10:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="932131514"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="932131514"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2023 10:50:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 10:50:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 10:50:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 10:50:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFZdfb962Gk39GeuPhCEl7N7QKJmNwAg6BpDIAe0RBGuiLodYGZk2KNefit+QismWZDNuVfORJVrzfGt2KLJi0/rjKOlujb4OgYj0o6DuHebWkDBl9anntd4d061bXlNYWMXP3YeY1h0Lot6a9kCmmQlo4c5VXLIDKaz3KVa4VVjPhZTmlZJs+kns76J8C/beMt56/hbXKejlMGQ41Dnyr23F3vsCP89LTfXyycN/2vQBF+z4wWoj2ZvCuEXGagdRmfamrPrn25q5JaFkqM7KD83oFEMq65LBrcuRTh7kvz566X3gPPNm5MfzpbiCT5E4rtqpeL47VWDrRZVRdQUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/fjIAQ/QAvlFE2va0cu5fAwzTdEijvmqthKvXY7SlM=;
 b=ST0f5yQUeAqx+72V/+XEZxWR/1BLkLPhEFnNID5m4mgVpkRFIB4rOsXkQVFtha31SpZrwU5xdYT2mu76t+JnncXbUiynVHIXHO+k2bTcgI8NQKj3lpdmorQVGZmAoFAN2kiTltj3lvQY2hiG5+3VgLZvLjw0VsURqY6w1RPVd8uMYuBley0ReVT+Mf3LJBIsOXmgi1RloFDBkw0YNKepMJWFRqT/F/l9Gm0viWSz1kRW23zu4/NA68/UFa2xpfTd6sAMaAlsVy1LZx9U0bbCMYHV3XMMhHTm2SZHbTTAMJ7X29OV0uOD0p9AqLqPeeLKKyNXAquD1Eidnmvv/7kQDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.28; Mon, 3 Apr
 2023 17:50:11 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 17:50:11 +0000
Date: Mon, 3 Apr 2023 10:50:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Message-ID: <20230403175008.GU4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230331230902.1603294-1-lucas.demarchi@intel.com>
 <SJ2PR11MB771597DDC3E40C1C09D770F9F8929@SJ2PR11MB7715.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ2PR11MB771597DDC3E40C1C09D770F9F8929@SJ2PR11MB7715.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL1PR11MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: 3321c12f-0c34-4642-4941-08db346bdf33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bqX6kUGyLYmDHv3T7nZiZgGDJpocep+7fKQSdF88dhIV1ZEyloVqUCNRko4NZZP+dwjn6RcsqpGmMGxakLaY66HzZWaLtOpqRTyuGQgW9Z5vjpCG9E5PyB405avK7IvXz3+KoMFifv7/7Hy/2C8CAF8etU0P0v5fRNmV0efpYU219qHDrDVWYw/SVOuCuVIu73+HrAydy0GFmALKNplSiUZuTFDtyptx9bF+hkvfpmjIdCvg0ojtmh9M6WJ+BaXB+vn0drfmV2yu4yAdFonPlaLymKMrBaxnvVW9z7tupdKUq/KziyYgcyZ2gCWQVjKzRWcmIUZz0KhaVcT+wpb6DgAOi5VXPozrhv6IpFvKLS/mDgzD67L2rsDcz7AxUVdmXKV6E9vtFkXPismeC6gG540hdIdIsb6EWpUrse/RQt7WDmTouqzMjTE6M3+Lyo/7IcqrSKPjM124liEm4Um4fOnPSQQpbiBl6j7jgO4QZZWN0IQHsO3jqA3Sg+hCmbAGPKGoN8DSYlkJN/XyfeRJeWHLajkf8hDLIdKPYr9/+Oss0L5XmJsNhmJozjWehC0I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199021)(83380400001)(6486002)(6666004)(186003)(33656002)(38100700002)(86362001)(53546011)(1076003)(6512007)(6506007)(26005)(82960400001)(66946007)(6636002)(54906003)(2906002)(66476007)(8676002)(8936002)(4326008)(41300700001)(316002)(6862004)(5660300002)(66556008)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rdjhZdHDlwHicUx4EV+pQB/XnH4oLPkWrT9K9qL3JZI6v82AeQ/DUKMt/XJG?=
 =?us-ascii?Q?T+rNj3/EbzlRX9vLGDTW5KjJmkf8ZsGH1TtoQvN/ThQBRL0alpCDdWRSxRrI?=
 =?us-ascii?Q?L36tud7ZaSI59VGnXOOaePFDn7PeuVwmRukY9uq9Uz5x1v/AAPq9ntEt9OrS?=
 =?us-ascii?Q?9Uu9vkpfnd8CymCkvDqKCUOA1bqHj1EjPj+n7GEmDkIzyTgHmkmcua3z9zIo?=
 =?us-ascii?Q?EktJaJWJwpQGzGhYAA2jtg/Uukxy8cSjUZjutIHui6mqAPtuONfqnhlaFR6R?=
 =?us-ascii?Q?VGUCc9N+Rgf7UkqMDfZKb6+FYG1dIlf8BnJ1QHyhW4L75yx9/GYwDaYDav/H?=
 =?us-ascii?Q?+bMaonJG3Oj1KrK9BuplMy8WT3jp9nio7/xwORIwszCxCM5gN2SKUWlT+oOV?=
 =?us-ascii?Q?LZVskKeN8kpeqasSIodBObvUvqxgisInjg2BFQQOa/eoB6pVcR2x/6wuRxtW?=
 =?us-ascii?Q?s65tFD2IOTxyS+XuxZSYEXIrrty15zf4ohBwX6oxOL+ksYZayNefO2sl8x9g?=
 =?us-ascii?Q?aNPXNHkQWZ52zmULW+EJV35TAl+UKclb08Y/aBnXw/Zw2dQOAtuP0hrWI5iy?=
 =?us-ascii?Q?L1SKiw+VOHbR6rgL9A0VXU7LyTEzt3bovd+lGj2Iq64pUf6II6LHs29j7Mrd?=
 =?us-ascii?Q?rSegiNCreNcIxEMLkqrl4fl6sfyZnlMhwgJ+Mo1RDDrD/O9C0V70Onn/8WcX?=
 =?us-ascii?Q?hp1w+DYFBcDH+JFIvhawLm7gdGnwB2CoDXuSAyXt1CAYUIwWvvkUu+1Ygip5?=
 =?us-ascii?Q?hVNobmWXUcJNDFDMwGJ1KrnCUcEEYScOHHCYtymHtFaIZfnr9Jk/hJWscMV9?=
 =?us-ascii?Q?EuQh4FVePiUnrEM5BX3lMws4RHopJBdg5g0sIsHEU5pJZ0gvpx4pzRc7fXF1?=
 =?us-ascii?Q?HI9YHGMog7EYeHuRJYByq2c9xK9lfT25fO2jSZAB8rMLthUpqL2QBHxY1VCh?=
 =?us-ascii?Q?wmzfH1oeDOpjovkW0e9ZeJZxfKCH49pb8t/jeGFqdS/ynKPdrTUmVwqq+ka1?=
 =?us-ascii?Q?53Jruues81Ukl+FmtZlyq21juuLpcuLF2x41QiVsSkfONjqlsWskFIEGLjrv?=
 =?us-ascii?Q?rqUw00S58g5EURVNBNzLFzNF31PRw/aFlOIGALOa+1OncHBcx7pl1bAB9Jrd?=
 =?us-ascii?Q?dA9ldRGgvzyAVJaU/QDLDFoPyKDALz8NL+OfFtNi0fL0qNJbrDJ6C130Ne/R?=
 =?us-ascii?Q?naSuvUSGNXi3yNlUcUeTmBNId4ELE+vnmaF5PVgiQ6+bf0+TW9e9fnAiqmn2?=
 =?us-ascii?Q?L2fSLmNIjj1rjIQ69i3DLpxpgHExLpaEAZ2752xshdc2CbKmoHb3pmmJSB0z?=
 =?us-ascii?Q?NT/4aGX1ie1gpd+p7Tgehv6xpc2vC3bqzELy7c3RI0Yr1xEqkSt9LBcIYfBr?=
 =?us-ascii?Q?ZRxqEf17oaITFYfowRRD5XGyPRMO1Icb0+qrFaUZ2bz5K6vLp/gLiX4GN7kR?=
 =?us-ascii?Q?tBUiCW5La4enqW6Vw09ja/+YAXA7kBxMqTUSqoBuLhxHGTZWO5vDMLYQO0nC?=
 =?us-ascii?Q?6VVnIfkQ9qPVFwXBOtkZbfVY3iONVgdAUOdkU/ZFj562ksUEytpoo9u7FGSe?=
 =?us-ascii?Q?6NvIDNyssePxRV5hDDl2HY2Fb9Uy3zYAst6iYnoyaHteYXM88v+CpBVybgNs?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3321c12f-0c34-4642-4941-08db346bdf33
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 17:50:11.5736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMELCLKLuTEAyvFOohm8TxC4edXgFtpJMl7EE5Hpkfv+3hciDvwORcYiOJVA6ftLC/T8pAh1WGmgxcNGF8Kkq/oanopCOye+Zj/jC3crzIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Fix platform order
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 05:44:33PM +0000, Srivatsa, Anusha wrote:
> 
> 
> > -----Original Message-----
> > From: De Marchi, Lucas <lucas.demarchi@intel.com>
> > Sent: Friday, March 31, 2023 4:09 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Srivatsa, Anusha
> > <anusha.srivatsa@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
> > Subject: [PATCH v2] drm/xe: Fix platform order
> > 
> > Platform order in enum xe_platform started to be used by some parts of the
> > code, like the GuC/HuC firmware loading logic. The order itself is not very
> > important, but it's better to follow a convention: as was documented in the
> > comment above the enum, reorder the platforms by graphics version. While at
> > it, remove the gen terminology.
> > 
> > v2:
> >   - Use "graphics version" instead of chronological order (Matt Roper)
> >   - Also change pciidlist to follow the same order
> >   - Remove "gen" from comments around enum xe_platform
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c            |  4 ++--
> >  drivers/gpu/drm/xe/xe_platform_types.h | 12 +++++++-----
> >  drivers/gpu/drm/xe/xe_uc_fw.c          |  4 ++--
> >  3 files changed, 11 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c index
> > 91fed9d3105e..1844cff8fba8 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -286,11 +286,11 @@ __diag_pop();
> >   */
> >  static const struct pci_device_id pciidlist[] = {
> >  	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
> > +	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
> > +	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
> >  	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
> >  	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
> >  	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
> > -	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
> > -	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
> >  	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
> >  	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
> >  	{ }
> > diff --git a/drivers/gpu/drm/xe/xe_platform_types.h
> > b/drivers/gpu/drm/xe/xe_platform_types.h
> > index 72612c832e88..80c19bffe79c 100644
> > --- a/drivers/gpu/drm/xe/xe_platform_types.h
> > +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> > @@ -6,27 +6,29 @@
> >  #ifndef _XE_PLATFORM_INFO_TYPES_H_
> >  #define _XE_PLATFORM_INFO_TYPES_H_
> > 
> > -/* Keep in gen based order, and chronological order within a gen */
> > +/*
> > + * Keep this in graphics version based order and chronological order
> > +within a
> > + * version
> > + */
> >  enum xe_platform {
> >  	XE_PLATFORM_UNINITIALIZED = 0,
> > -	/* gen12 */
> >  	XE_TIGERLAKE,
> >  	XE_ROCKETLAKE,
> > +	XE_ALDERLAKE_S,
> > +	XE_ALDERLAKE_P,
> >  	XE_DG1,
> >  	XE_DG2,
> >  	XE_PVC,
> > -	XE_ALDERLAKE_S,
> > -	XE_ALDERLAKE_P,
> >  	XE_METEORLAKE,
> >  };
> 
> For chronological order, shouldn't it be TGL,RKL, DG1, ADLS and ADLP?

DG1 is 12.10 whereas the others are 12.0, so this matches the guidelines
given in the comment.


Matt

> 
> Anusha 
> >  enum xe_subplatform {
> >  	XE_SUBPLATFORM_UNINITIALIZED = 0,
> >  	XE_SUBPLATFORM_NONE,
> > +	XE_SUBPLATFORM_ADLP_RPLU,
> >  	XE_SUBPLATFORM_DG2_G10,
> >  	XE_SUBPLATFORM_DG2_G11,
> >  	XE_SUBPLATFORM_DG2_G12,
> > -	XE_SUBPLATFORM_ADLP_RPLU,
> >  };
> > 
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > index e2c982b37e87..d1d2e6f0820d 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > @@ -43,11 +43,11 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw
> > *uc_fw)
> >   */
> >  #define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
> >  	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
> > -	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
> > -	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
> >  	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
> >  	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
> >  	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
> > +	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
> > +	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
> >  	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
> > 
> >  #define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
> > --
> > 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
