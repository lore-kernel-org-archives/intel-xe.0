Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB7CC61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 15:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803E310E14B;
	Fri, 28 Aug 2026 15:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3i4I6wF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7A910E14B
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787930957; x=1819466957;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ym7Q/XAm1DqGJP0eycvbARRZJ1FClm6tFO3xUY8ZkmI=;
 b=E3i4I6wF1d5oXMHuatJprQ61FyZmnqyq+q9oVEnUP6sls3hsd7iyZoY9
 zxNGNc3C5yg3w3Si+NOJhNe2qD6kUn0Rsn3hfz7aXNJ1lI4e+a966YVSJ
 S7zfJirSWB4BglBpw7SkFKFYpAmU+1c6xvHODEWhS8ayzzqvEqyq//JRk
 aOaz8OEN0YCohiiam/fwK99tGD/JgI1Ujs3W3GbH60bFarFRTNSRejpG7
 R27zomir3GU6M0zVLIrfEPwuSiZyfQ32oow+/FtSvIskdb11amOENCFeu
 1BC9tGyo6FBoRW/TA/yCTLsySElPFiqlxKUwc0ozUrueDw4XSny4o1L2I w==;
X-CSE-ConnectionGUID: Px9+pdLOQeWOe9n/PgtLRg==
X-CSE-MsgGUID: 0i6c3GHnSkKaZ5gKZJXQOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="92253244"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="92253244"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:29:17 -0700
X-CSE-ConnectionGUID: t2d8aWWfS1+zm6YVcWcUgQ==
X-CSE-MsgGUID: 7iJ7QUhiSNOQ3+6sZJyFAw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:29:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:29:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 08:29:16 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPneR+inRrn1L8VMPA//SJQAL8hvSIJaSCSpMnIGLOIXP7yu/TUiKj1YDBKTlqo2Fuio6aUCFG4cqbcU0cLJud6G6R4PC28ferxVcGwFlGeae5YWesLaUuHdXryLWti8d/InQrvaRtNjoAad6MNU7srntXC3BYn9Z1lnhOqGdB5IxvxG1rnR12LceiD+Z3KwuRz2dBPq6wEC5r+gcU97KuR2OS0WKg54kEW8lJ4J1uxStchdnfMASOs00yyAtlKTlW7CItmDS4cXjlqok2l9+8jXL8SjqmefaGsH3KUpZey/xsDM5i9c9mVG3fjkhq8gIrzPhuITwS1FS0L2ZXx3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJfD/FXRgqpittmYB6yd2mi70ihU60LiUwftA5ZXUeE=;
 b=SjEI8UMsuEfeMt3zuVBWoEDa5rctLqTWZRDMpS7gNXQdht+39jt0KoFuADReR+73QxVPTin9t6o3aqo4yOjZLEUrDXH3dhJSiihc+gU1FfEO3+d+xklh2SKeXJItG3bnc6Y9RAwFQdBl+5S5lF591+WTNIo3yVU+7FjFbhRkQKHWsGMlC5ze9c3JRgg31feH36nuFt8PYLMWx/HN2iaj3IMAI+u+gFVS9rTKyHTEJFdrFX5UTVQWXbPIrqnWZQURLU9IHdpGPzU3wP4tEBxRqj2w0fn9L7ZcLJFsY2dUSCx1y4aPOEREgCaLAa7Pag5sr5w57c+AP8UOKHo6f76TQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 15:29:14 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:29:14 +0000
Date: Fri, 28 Aug 2026 11:29:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH v1] drm/xe: Introduce xe_wedge
Message-ID: <apGpPfE11KBvLkp8@intel.com>
References: <20260825114450.1371821-1-raag.jadav@intel.com>
 <bc375ac6-35c7-4660-9c59-2b310d45ada3@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc375ac6-35c7-4660-9c59-2b310d45ada3@intel.com>
X-ClientProxiedBy: SJ0PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::28) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DM4PR11MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8eed95-f5aa-4175-ef63-08df05191d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|22082099003|11063799006|18002099003|56012099006|4143699003|13003099007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: qcdWk3APdOB2PhC9HdfO9g8iWG8SiCCxfhUHnPuEX+1wT0UgpZZ0LcwyGLHQmrqfn16ST/BqgaB5vzerJcg6ozbHZxR5v6ZNFNreve4AkyrRlRJ+jLFGKp6CrW/R8B4V6/l1koreST6GxaFCJkZCCIuZZ7wHZdqi+U3xqlN34oH7CKDGXgbSjhqlX4g46O3rm6hs3hrS+EOKz1SoJGnEtJRims0Ndj7K7eCMU6c0vaCn8doIo6EvcImN+0nkTgae0Wwp0svy9bi93+4t/BMW3lVypMBc0CFvml3svjfl0mEKwDGnH8if3L0lvU9UzKBE4zMEGplsBKIPT4qoeBPYTU4iNoQoLa65wdXooyGivIakPJh+inzhk6sfEUoQmpiaEaFhuaMx8KDlbFfvBCocepni7LVv+TR+NeTSYB6BnGkZOHgncKassOtTMG21eKcsHp9nSIFvCvNsMW7JbUsxlcaDwguaYiKsMJxaJd0E7QrdyCabiY8Di6KoFQ/i3zPKoD8ewp8kmpP/znIBOweYtBqvY8RttPIBzYCVEa2GjkF8Foyv+gLH141iz4et3MpT6bjqlsQLPUhOvl/apWXcVutOdBK5BzArJYzSnlZUth+L42d3/fkX6dKoNTrqMaFF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(11063799006)(18002099003)(56012099006)(4143699003)(13003099007)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tbmugY8+Ve80YjNon276o7130oS/SwwwuVB/ZxLcY0xPWrN3KlGe0sQaD8?=
 =?iso-8859-1?Q?5eVMzyt/VJrSvRASrU1CaY0Yq5MCx0yA6B0IGWmUvLT/Oxsrf/qOEqNQH3?=
 =?iso-8859-1?Q?q/aQU5F6J8tuTr3ox0xdisoVoRvcTXwIabFTBVfGhEAd8XkzYc4meUd53d?=
 =?iso-8859-1?Q?ik77NhGU93AU5753HxLObdHjdrHTKMstL1xUNwZ7EjMygyC0tmzfxPW21m?=
 =?iso-8859-1?Q?cc23LaSHijg1BhrLrKnGa5KuyJr0LpmHbT2qtiTSROtZmx5e9XJg7w7HUb?=
 =?iso-8859-1?Q?G7eIhE8FgIkF0QIG05q0wEXXgXH9NW8aPbmknute6FtMHsQdVCK6i1t9AR?=
 =?iso-8859-1?Q?1x67FIZ44Ls9gWnbYMp8essidvsq0wm/uK3KcZuC0XZxiZiePfJa20/h3E?=
 =?iso-8859-1?Q?mATNnSA0kANuSNSgYXMqH9E4Bkfh/yHZyzli/+oGAYs+KaGA6MtlFEVuA7?=
 =?iso-8859-1?Q?vNGiXe3Wxs+PL50MkitvT0nc/MMMv3jWxVWicPAf0C0G4VLidMNBoVCLZA?=
 =?iso-8859-1?Q?DuVQA3LyRm3XYPzS6MHW9O+mUbtuDSfAjx1esKLKMokO0/rWMpadAOeMng?=
 =?iso-8859-1?Q?jQo4rnEBO6xoXi4X1S5ewNt7a7ZyjdLVxL/IlS4oP0J5dtUQdz3x06KvvH?=
 =?iso-8859-1?Q?GwujHmMc/idyQHIm8oMFt4TVmePKALv+iQ1kSIlOLEOtPr/DGAUnWguezc?=
 =?iso-8859-1?Q?mPI90IYH4gCitpKK7QgbyfKHiym5T9PR94IqGQ+xprh6vvh22vngtqA8Gl?=
 =?iso-8859-1?Q?sAAcVDRjCDwHvnVdcVvfXoKsdY1gRAm31QQEZT7zeujCpEemMw8Lcq0OfU?=
 =?iso-8859-1?Q?GZG2A+di0xUOWl0W4xbLxq6zdVcAZWYmrSwXj3BStjbMsttzSnLj+VG2rO?=
 =?iso-8859-1?Q?cDfxq7srg7Ed8sgZMo4WEH2J7c9JPg3oWyRK0C/ZTBXpb07iaMsCU8CpQT?=
 =?iso-8859-1?Q?nMeUx3GpPEX0aGVlk8NWTMTM+Z5npGeZCVE6tyIZPfxyLtDd3yBOnrzpAM?=
 =?iso-8859-1?Q?gNynTCcpDNIFM9UiBXPzPRgsx1ZHpz+9wxHHtjEn3rZ3b/bVE8TbQ/lbKT?=
 =?iso-8859-1?Q?IiAaJ36HC5poF4P0jKzWUJh0qa6Nk0GuCXMhD9qKFpa0ogxHlSxZsPumOV?=
 =?iso-8859-1?Q?HeNMDkWMJyZ9Q5FiimEl9/jYbp6TtdkQO77xOlSCqcIbwMO7RBVn88pW9D?=
 =?iso-8859-1?Q?UEG+wMCUIC0ZfaJLD/vOvZwLLEI+jItby/JH2gubTkSmQ2z8S759QFcngb?=
 =?iso-8859-1?Q?yFRwFU/O88WvId1qVNLVudYc5hBxyRg5xjpE4Ve90wzhywRJYno/0a3A+D?=
 =?iso-8859-1?Q?TUI/Im+2G91bGLoA1jPac/yr9PaDXIHZTduzCn0aTvghNafVL1qN90NpcE?=
 =?iso-8859-1?Q?143cSMmxzYg4SNsslIrkw+lSA85OLBXdRHq1W16O+KIS+1G6h8p2Y+warZ?=
 =?iso-8859-1?Q?S+S4E4YlYsY2vO+WdQcolKrNYIYZlv/amw6sD9TdO4dzJ/O13c1hnoW1WR?=
 =?iso-8859-1?Q?W9QuHtpuXvaWSncEGjf67jL/whtFJ7pAFhO+SRtcBCrwpm6jJzZWYOH6BJ?=
 =?iso-8859-1?Q?7+7I1QWZVXfcImxoeF0lEadiPzzESHk+dinH6Ih7pmwgkDxW+9iXolC/tp?=
 =?iso-8859-1?Q?v1BH+umMlwA3kp1XqvC8nRvxuCgdDUOP/NYmuLOhrfOKFazSRlCxMhNYfS?=
 =?iso-8859-1?Q?z0jsm2AS3jaPo+bC3dj0XkaZc+JTiD/vLYwKnuBTTDkLXsVF+7PWeeDC8S?=
 =?iso-8859-1?Q?uPrxXbS2iZ11vOtrk8keurB/4JCnTZrxsLMYAb/qkxFud4vvqdjOC4S41d?=
 =?iso-8859-1?Q?qK474ERJBA=3D=3D?=
X-Exchange-RoutingPolicyChecked: bACPyppXunrqoU8MG0xzxnuncl7jkl8VUjOGONWRVGITDlsRE/YlFzOtAHMC+DO9Ky/Y66mQsGZuSIdiUxXYDhPvUwbL9KjAZ/DBRVLalU4tlSanxV5A1YQHGPxF6RnGzt8+TMQ7aRHmSl1k/T9Wa8GLhnisebvYpqcm7ZSFHzdHMMva/u/hzVktBIrZZnjHCTZ5kWegwFlOdJ1LQ4766ymUHR4aZyQBehGaU4Lh0s2woob/0MNL6G6gdhnozz28c59CHimsIvXetDp7+3ds6ZRExPU8IhtTdgtGsG/GQlJpvcF0XHlYgvyBcffxF8m/fMC50FcuqXxUxIE6825NpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8eed95-f5aa-4175-ef63-08df05191d79
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:29:13.9469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYnIJAviFgXRdSwaEOdvibvKWJ3F6C7Weh/NKV97qUwHB2fRtHioN6kuwvwZ+McuPBZl1GBLk1mDUA2TPcUeOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7757
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

On Thu, Aug 27, 2026 at 08:33:29AM +0200, Laguna, Lukasz wrote:
> 
> On 8/25/2026 13:42, Raag Jadav wrote:
> > Consolidates all wedging implementation into a dedicated xe_wedge
> > component. While at it, add a worker to schedule the wedge handling to
> > be done async making xe_device_declare_wedged() safe for atomic callers.
> 
> Fixes:  drm/xe/mert: Improve handling of MERT CAT errors ?

if so, please send the stand alone fix that can be backported.
All the refactor later.

> 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > PS: The original intent was a bug fix, but that's just a matter of opinion.
> > 
> >   Documentation/gpu/xe/xe_device.rst   |   2 +-
> >   drivers/gpu/drm/xe/Makefile          |   1 +
> >   drivers/gpu/drm/xe/xe_device.c       | 172 +--------------------
> >   drivers/gpu/drm/xe/xe_device.h       |  11 +-
> >   drivers/gpu/drm/xe/xe_device_types.h |  19 +--
> >   drivers/gpu/drm/xe/xe_wedge.c        | 214 +++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_wedge.h        |  24 +++
> >   drivers/gpu/drm/xe/xe_wedge_types.h  |  25 ++++
> >   8 files changed, 271 insertions(+), 197 deletions(-)
> >   create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
> >   create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
> >   create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h
> > 
> > diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> > index d3a022362ade..8baed81580c9 100644
> > --- a/Documentation/gpu/xe/xe_device.rst
> > +++ b/Documentation/gpu/xe/xe_device.rst
> > @@ -6,7 +6,7 @@
> >   Xe Device Wedging
> >   ==================
> > -.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
> > +.. kernel-doc:: drivers/gpu/drm/xe/xe_wedge.c
> >      :doc: Xe Device Wedging
> >   ====================
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index adc2de37e768..c739a50b6896 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -152,6 +152,7 @@ xe-y += xe_bb.o \
> >   	xe_vsec.o \
> >   	xe_wa.o \
> >   	xe_wait_user_fence.o \
> > +	xe_wedge.o \
> >   	xe_wopcm.o
> >   xe-$(CONFIG_I2C)	+= xe_i2c.o \
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 74d566693dfd..d3a7034fac01 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -829,10 +829,7 @@ int xe_device_probe_early(struct xe_device *xe)
> >   	 */
> >   	assert_lmem_ready(xe);
> > -	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> > -			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> > -	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> > -		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
> > +	xe_device_wedged_init_early(xe);
> >   	err = xe_device_vram_alloc(xe);
> >   	if (err)
> > @@ -924,14 +921,6 @@ static void detect_preproduction_hw(struct xe_device *xe)
> >   	}
> >   }
> > -static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> > -{
> > -	struct xe_device *xe = arg;
> > -
> > -	if (atomic_read(&xe->wedged.flag))
> > -		xe_pm_runtime_put(xe);
> > -}
> > -
> >   #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> >   static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
> >   {
> > @@ -1148,7 +1137,7 @@ int xe_device_probe(struct xe_device *xe)
> >   	detect_preproduction_hw(xe);
> > -	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> > +	err = xe_device_wedged_init(xe);
> >   	if (err)
> >   		goto err_unregister_display;
> > @@ -1394,163 +1383,6 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> >   	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> >   }
> > -/**
> > - * DOC: Xe Device Wedging
> > - *
> > - * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> > - * When device is in wedged state, every IOCTL will be blocked and GT cannot
> > - * be used. The conditions under which the driver declares the device wedged
> > - * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
> > - * default recovery method for a wedged state is rebind/bus-reset.
> > - *
> > - * Another recovery method is vendor-specific. Below are the cases that send
> > - * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> > - *
> > - * Case: Firmware Flash
> > - * --------------------
> > - *
> > - * Identification Hint
> > - * +++++++++++++++++++
> > - *
> > - * ``WEDGED=vendor-specific`` drm device wedged uevent with
> > - * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> > - * admin/userspace consumer about the need for a firmware flash.
> > - *
> > - * Recovery Procedure
> > - * ++++++++++++++++++
> > - *
> > - * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> > - * the below steps
> > - *
> > - * - Check Runtime Survivability mode sysfs.
> > - *   If enabled, firmware flash is required to recover the device.
> > - *
> > - *   /sys/bus/pci/devices/<device>/survivability_mode
> > - *
> > - * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> > - *   firmware and restore device to normal operation.
> > - */
> > -
> > -/**
> > - * xe_device_set_wedged_method - Set wedged recovery method
> > - * @xe: xe device instance
> > - * @method: recovery method to set
> > - *
> > - * Set wedged recovery method to be sent in drm wedged uevent.
> > - */
> > -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> > -{
> > -	xe->wedged.method = method;
> > -}
> > -
> > -#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> > -#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> > -
> > -/**
> > - * xe_device_declare_wedged - Declare device wedged
> > - * @xe: xe device instance
> > - *
> > - * This is a final state that can only be cleared with the recovery method
> > - * specified in the drm wedged uevent. The method can be set using
> > - * xe_device_set_wedged_method before declaring the device as wedged. If no method
> > - * is set, reprobe (unbind/re-bind) will be sent by default.
> > - *
> > - * In this state every IOCTL will be blocked so the GT cannot be used.
> > - * In general it will be called upon any critical error such as gt reset
> > - * failure or guc loading failure. Userspace will be notified of this state
> > - * through device wedged uevent.
> > - * If xe.wedged module parameter is set to 2, this function will be called
> > - * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> > - * snapshot capture. In this mode, GT reset won't be attempted so the state of
> > - * the issue is preserved for further debugging.
> > - */
> > -void xe_device_declare_wedged(struct xe_device *xe)
> > -{
> > -	struct xe_gt *gt;
> > -	u8 id;
> > -
> > -	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> > -		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> > -		return;
> > -	}
> > -
> > -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> > -		xe->needs_flr_on_fini = true;
> > -		xe_pm_runtime_get_noresume(xe);
> > -
> > -		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> > -		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> > -			    "For recovery procedure, refer to %s\n"
> > -			    "Please file a _new_ bug report at %s\n",
> > -			    WEDGED_URL, XE_BUG_URL);
> > -	}
> > -
> > -	for_each_gt(gt, xe, id)
> > -		xe_gt_declare_wedged(gt);
> > -
> > -	if (xe_device_wedged(xe)) {
> > -		/*
> > -		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> > -		 * hangs, so wedge the device with 'none' recovery method and have
> > -		 * it available to the user for debugging.
> > -		 */
> > -		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> > -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> > -		/* If no wedge recovery method is set, use default */
> > -		else if (!xe->wedged.method)
> > -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> > -						    DRM_WEDGE_RECOVERY_BUS_RESET);
> > -
> > -		/* Notify userspace of wedged device */
> > -		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> > -	}
> > -}
> > -
> > -/**
> > - * xe_device_validate_wedged_mode - Check if given mode is supported
> > - * @xe: the &xe_device
> > - * @mode: requested mode to validate
> > - *
> > - * Check whether the provided wedged mode is supported.
> > - *
> > - * Return: 0 if mode is supported, error code otherwise.
> > - */
> > -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> > -{
> > -	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> > -		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> > -		return -EINVAL;
> > -	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> > -		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> > -		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
> > -			mode, xe_wedged_mode_to_string(mode),
> > -			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> > -		return -EPERM;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> > -/**
> > - * xe_wedged_mode_to_string - Convert enum value to string.
> > - * @mode: the &xe_wedged_mode to convert
> > - *
> > - * Returns: wedged mode as a user friendly string.
> > - */
> > -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> > -{
> > -	switch (mode) {
> > -	case XE_WEDGED_MODE_NEVER:
> > -		return "never";
> > -	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> > -		return "upon-critical-error";
> > -	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> > -		return "upon-any-hang-no-reset";
> > -	default:
> > -		return "<invalid>";
> > -	}
> > -}
> > -
> >   /**
> >    * xe_device_asid_to_vm() - Find VM from ASID
> >    * @xe: the &xe_device
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index 6c4cfaebc44a..c984972bd0f8 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -11,6 +11,7 @@
> >   #include "xe_device_types.h"
> >   #include "xe_gt_types.h"
> >   #include "xe_sriov.h"
> > +#include "xe_wedge.h"
> >   struct xe_vm;
> > @@ -207,11 +208,6 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
> >   void xe_device_td_flush(struct xe_device *xe);
> >   void xe_device_l2_flush(struct xe_device *xe);
> > -static inline bool xe_device_wedged(struct xe_device *xe)
> > -{
> > -	return atomic_read(&xe->wedged.flag);
> > -}
> > -
> >   #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> >   static inline bool xe_debug_page_size_supported(struct xe_device *xe)
> >   {
> > @@ -260,11 +256,6 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
> >   }
> >   #endif
> > -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> > -void xe_device_declare_wedged(struct xe_device *xe);
> > -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> > -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
> > -
> >   struct xe_file *xe_file_get(struct xe_file *xef);
> >   void xe_file_put(struct xe_file *xef);
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 180d450a6deb..f307d7e5e6b6 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -30,6 +30,7 @@
> >   #include "xe_sysctrl_types.h"
> >   #include "xe_tile_types.h"
> >   #include "xe_validation.h"
> > +#include "xe_wedge_types.h"
> >   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >   #define TEST_VM_OPS_ERROR
> > @@ -45,22 +46,6 @@ struct xe_pxp;
> >   struct xe_ttm_stolen_mgr;
> >   struct xe_vram_region;
> > -/**
> > - * enum xe_wedged_mode - possible wedged modes
> > - * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> > - * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> > - *	when critical error occurs like GT reset failure or firmware failure.
> > - *	This is the default mode.
> > - * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> > - *	any hang. In this mode, engine resets are disabled to avoid automatic
> > - *	recovery attempts. This mode is primarily intended for debugging hangs.
> > - */
> > -enum xe_wedged_mode {
> > -	XE_WEDGED_MODE_NEVER = 0,
> > -	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> > -	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> > -};
> > -
> >   #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> >   /**
> >    * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
> > @@ -534,6 +519,8 @@ struct xe_device {
> >   		unsigned long method;
> >   		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
> >   		bool inconsistent_reset;
> > +		/** @wedged.work: Worker for wedge handling to be done async */
> 
> nit: "Worker for wedge handling" seems sufficient
> 
> > +		struct work_struct work;
> >   	} wedged;
> >   	/** @devres_group: devres group */
> > diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> > new file mode 100644
> > index 000000000000..52d4661a2dee
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_wedge.c
> > @@ -0,0 +1,214 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_defaults.h"
> > +#include "xe_device_types.h"
> > +#include "xe_gt.h"
> > +#include "xe_log.h"
> > +#include "xe_module.h"
> > +#include "xe_pm.h"
> > +#include "xe_printk.h"
> > +#include "xe_wedge.h"
> > +
> > +/**
> > + * DOC: Xe Device Wedging
> > + *
> > + * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> > + * When device is in wedged state, every IOCTL will be blocked and GT cannot
> > + * be used. The conditions under which the driver declares the device wedged
> > + * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
> > + * default recovery method for a wedged state is rebind/bus-reset.
> > + *
> > + * Another recovery method is vendor-specific. Below are the cases that send
> > + * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> > + *
> > + * Case: Firmware Flash
> > + * --------------------
> > + *
> > + * Identification Hint
> > + * +++++++++++++++++++
> > + *
> > + * ``WEDGED=vendor-specific`` drm device wedged uevent with
> > + * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> > + * admin/userspace consumer about the need for a firmware flash.
> > + *
> > + * Recovery Procedure
> > + * ++++++++++++++++++
> > + *
> > + * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> > + * the below steps
> > + *
> > + * - Check Runtime Survivability mode sysfs.
> > + *   If enabled, firmware flash is required to recover the device.
> > + *
> > + *   /sys/bus/pci/devices/<device>/survivability_mode
> > + *
> > + * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> > + *   firmware and restore device to normal operation.
> > + */
> > +
> > +/**
> > + * xe_device_set_wedged_method() - Set wedged recovery method
> > + * @xe: xe device instance
> > + * @method: recovery method to set
> > + *
> > + * Set wedged recovery method to be sent in drm wedged uevent.
> > + */
> > +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> > +{
> > +	xe->wedged.method = method;
> > +}
> > +
> > +/**
> > + * xe_device_wedged() - Check for wedged device
> > + * @xe: xe device instance
> > + *
> > + * Returns: %true if device is wedged, %false otherwise.
> > + */
> > +bool xe_device_wedged(struct xe_device *xe)
> > +{
> > +	return atomic_read(&xe->wedged.flag);
> > +}
> > +
> > +#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> > +#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> > +
> > +static void wedged_work(struct work_struct *work)
> > +{
> > +	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> > +	struct xe_gt *gt;
> > +	u8 id;
> > +
> > +	for_each_gt(gt, xe, id)
> > +		xe_gt_declare_wedged(gt);
> > +
> > +	/*
> > +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> > +	 * hangs, so wedge the device with 'none' recovery method and have
> > +	 * it available to the user for debugging.
> > +	 */
> > +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> > +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> > +	/* If no wedge recovery method is set, use default */
> > +	else if (!xe->wedged.method)
> > +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> > +					    DRM_WEDGE_RECOVERY_BUS_RESET);
> > +
> > +	/* Notify userspace of wedged device */
> > +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> > +}
> > +
> > +/**
> > + * xe_device_declare_wedged - Declare device wedged
> 
> xe_device_declare_wedged()
> 
> > + * @xe: xe device instance
> > + *
> > + * This is a final state that can only be cleared with the recovery method
> > + * specified in the drm wedged uevent. The method can be set using
> > + * xe_device_set_wedged_method before declaring the device as wedged. If no method
> > + * is set, reprobe (unbind/re-bind) will be sent by default.
> > + *
> > + * In this state every IOCTL will be blocked so the GT cannot be used.
> > + * In general it will be called upon any critical error such as gt reset
> > + * failure or guc loading failure. Userspace will be notified of this state
> > + * through device wedged uevent.
> > + * If xe.wedged module parameter is set to 2, this function will be called
> > + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> > + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> > + * the issue is preserved for further debugging.
> > + */
> > +void xe_device_declare_wedged(struct xe_device *xe)
> > +{
> > +	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> > +		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> > +		return;
> > +	}
> > +
> > +	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> > +		xe->needs_flr_on_fini = true;
> > +		xe_pm_runtime_get_noresume(xe);
> > +
> > +		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> > +		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> > +			    "For recovery procedure, refer to %s\n"
> > +			    "Please file a _new_ bug report at %s\n",
> > +			    WEDGED_URL, XE_BUG_URL);
> > +
> > +		schedule_work(&xe->wedged.work);
> > +	}
> > +}
> > +
> > +/**
> > + * xe_device_validate_wedged_mode - Check if given mode is supported
> > + * @xe: the &xe_device
> > + * @mode: requested mode to validate
> > + *
> > + * Check whether the provided wedged mode is supported.
> > + *
> > + * Return: 0 if mode is supported, error code otherwise.
> > + */
> > +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> > +{
> > +	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> > +		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> > +		return -EINVAL;
> > +	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> > +		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> > +		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
> > +			mode, xe_wedged_mode_to_string(mode),
> > +			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> > +		return -EPERM;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_wedged_mode_to_string - Convert enum value to string.
> > + * @mode: the &xe_wedged_mode to convert
> > + *
> > + * Returns: wedged mode as a user friendly string.
> > + */
> > +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> > +{
> > +	switch (mode) {
> > +	case XE_WEDGED_MODE_NEVER:
> > +		return "never";
> > +	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> > +		return "upon-critical-error";
> > +	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> > +		return "upon-any-hang-no-reset";
> > +	default:
> > +		return "<invalid>";
> > +	}
> > +}
> > +
> > +void xe_device_wedged_init_early(struct xe_device *xe)
> > +{
> > +	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> > +			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> > +	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> > +		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
> > +}
> > +
> > +static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> > +{
> > +	struct xe_device *xe = arg;
> > +
> > +	disable_work_sync(&xe->wedged.work);
> > +
> > +	if (atomic_read(&xe->wedged.flag))
> > +		xe_pm_runtime_put(xe);
> > +}
> > +
> > +int xe_device_wedged_init(struct xe_device *xe)
> > +{
> > +	INIT_WORK(&xe->wedged.work, wedged_work);
> > +
> > +	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> > +}
> > +
> > diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> > new file mode 100644
> > index 000000000000..fedb30c99398
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_wedge.h
> > @@ -0,0 +1,24 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_WEDGE_H_
> > +#define _XE_WEDGE_H_
> > +
> > +#include <linux/atomic.h>
> 
> not needed
> 
> > +#include <linux/types.h>
> > +
> > +#include "xe_wedge_types.h"
> > +
> > +struct xe_device;
> > +
> > +void xe_device_wedged_init_early(struct xe_device *xe);
> > +int xe_device_wedged_init(struct xe_device *xe);
> > +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> > +void xe_device_declare_wedged(struct xe_device *xe);
> > +bool xe_device_wedged(struct xe_device *xe);
> > +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> > +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
> 
> I agree about naming convention. I was already thinking about something like
> this:
> xe_wedge_init_early()
> xe_wedge_init()
> xe_wedge_set_recovery_method()
> xe_device_declare_wedged() / xe_device_wedge()
> xe_device_wedged() / xe_device_is_wedged()
> xe_wedge_validate_mode()
> xe_wedge_mode_to_string
> 
> 
> Also, wedged_mode_set logic from xe_debugfs.c could be wrapped into
> xe_wedge_set_mode() in xe_wedge.c.
> 
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
> > new file mode 100644
> > index 000000000000..ffe7f9c64166
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_wedge_types.h
> > @@ -0,0 +1,25 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_WEDGE_TYPES_H_
> > +#define _XE_WEDGE_TYPES_H_
> > +
> > +/**
> > + * enum xe_wedged_mode - possible wedged modes
> > + * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> > + * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> > + *	when critical error occurs like GT reset failure or firmware failure.
> > + *	This is the default mode.
> > + * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> > + *	any hang. In this mode, engine resets are disabled to avoid automatic
> > + *	recovery attempts. This mode is primarily intended for debugging hangs.
> > + */
> > +enum xe_wedged_mode {
> > +	XE_WEDGED_MODE_NEVER = 0,
> > +	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> > +	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> > +};
> > +
> 
> Let's move the wedge struct here: struct xe_wedge {}.
> 
> Lukasz
> 
> 
> > +#endif
