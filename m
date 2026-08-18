Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8011AC5DF74
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 13:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3894910EB88;
	Tue, 18 Aug 2026 13:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgyWhPYX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DC710EB88
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 13:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787060703; x=1818596703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v4ScqtC3Yp2bMrO92L/YbOQtKcFL+czI+CJpIaXLKQA=;
 b=RgyWhPYXVPW8uePIccKZKLAsZPs5W4oOFQp1nUYrTnXgq/LMDQIJ7Ysb
 EbzPFX5w/Nvl78xU61YjzPZ8+JVAXjUbVfSvHoXt27S/ICotA0Vjn6XGF
 pf5F3Rpi7CVANHjJa79CL3hLBYADQiavuH2+WJ4+biEU2u3gJmI/wQKPY
 Ll3nQU8dGOfTVKoj7vxfyCdJhdGe5T8gaz3NchpZiCcZihaMw9jJcJ+LE
 hxpfNIsv78uzyzcYB2RdR77DhTOFmsjhjW5XQsEI93PhiVzAO8+HrY/r+
 7npn4SBDZcIj/BCg4yazTL4o34wYNLchcxyHCpqDcwR58ViTURnG+WrwZ Q==;
X-CSE-ConnectionGUID: bGCZNWVIRVGqp0SiC9ROyw==
X-CSE-MsgGUID: I3cfV3rHS9OqM2+Wya19Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87469368"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87469368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 06:45:03 -0700
X-CSE-ConnectionGUID: gD7YRK1gTWutTfkeDWy2Cg==
X-CSE-MsgGUID: qyXhFWNJRM2JQbE8Ib5/6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="295157255"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 06:45:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 06:45:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 06:45:02 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 06:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZVZ7ndm3jZwbIPnnPgBl3P5B7Er4z0uqWK1woa7K2Blo3a6vpb6HdOz0KtYchEFee4wHBVTTDprB4KVWFoQnKPTmjO3Sae2zBQV2VeRnZqdMGF7mq5QRR/hnzgau1m1wMadAU1pnMkoX9m3PuJkJ3Cso7e658Y/c2Z6ioWzn8iMjIZZ3GNQ9iTGv/L2sQkK7WQ34abXpzIGj4J6xzB1cTs2fJNCl3FzsvSNkm57qXP7m4EiKnFokEzdD+fBrWBwQZwkpdniYq7ihW1yl/Nnn2bKPgvM7fxxwordHNl8kIpQn3WWJkNqPHlYdQD1mo28gFdeiIgshbpKPjcmUB/zzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ySCa4xYP5sFL26r0wApJgGzQ/z393qMR1QFigTFm7Q=;
 b=P0VQnnl1VMrYIxVtXMws2naTp9h+9SQ/BEdpjeeBHKeYw2z8qFY+hxj4uuG3soVap536/7qrwQLGs9debnPMvZQzFkw6aWE8YZpD8otuiZ6V3AM36MEwdsyW9AQZXT1SaSmv0/zsryNMxYQ7h8AzQ/xUbQOvIJ3/fJHo82FgQwq7xefPX/UmsEmzzJOTfK/5aqYnwGMypWBOWAaYhfV81ZHrC/EL1o5M/vdGcvEOINbSpr/fGNbTGZGB2yHq4F+hjFY1WY0DSysd6ET4oXIOUcEw01JS7T9QVeHiao9qQy9/j5a4lZHL9a273oTstlpAz1PdGEsovPVUp5bxvIItpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by PH7PR11MB7449.namprd11.prod.outlook.com (2603:10b6:510:27a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 13:44:59 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 13:44:59 +0000
Date: Tue, 18 Aug 2026 09:44:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe_drm_ras: Enable CONFIG_DRM_RAS
Message-ID: <aoRh18aUKVP2YVWm@intel.com>
References: <20260818075454.1508724-2-balasubramani.vivekanandan@intel.com>
 <aoQQ05RgZxVOeY_U@black.igk.intel.com>
 <d07c319a-96a0-4ffd-9623-695cf4d27e69@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d07c319a-96a0-4ffd-9623-695cf4d27e69@intel.com>
X-ClientProxiedBy: SJ0PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:a03:333::16) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|PH7PR11MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: badd8911-f120-4e3d-f7d3-08defd2ee558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|22082099003|18002099003|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: tSgzOTmNf23GK32XN7NEbAvqhFzEhwX1dP/6fJ+UbIwM05PIKIaGWAbm6O+xAlTtl9S9XYy51mCrUIF+ceP1fi330LOcDonGoaGBAjK28YeLZbn5p0dw1ocfcPVWntiiKkw3o2iX1AyqqgcjqFF1nSR4HeYj//G+0q2yQXG2Vyk5BCrP1Jt85E2rdSTsqsraZ5ds87FQr6HLLPU1Wm2YdPpIHN9z+lgh+dXXOGoS7wlakeest3Gh3vfj0bMlmgyNRsQr/WM7+L9vpIKklzali/vmtwZ4fT2M+dFeulmEX/hsOG0K0u5W8UalT9HejaQtjWaYkKLaZYWJF9mufMJHJ7J3epWMDwncmrZCzoLx+GT+Mq/nQY8XlOezt2SB3hiNzuqQkUM0kxPzO+Inez4RQF/nbGDXLDOtxzZkRekzQjLccUhEdufQeM3OHCrTJjytNIHENSmMb+saxl0hIPa6pvpClJ0yIg2GvqBzUjd4esG6NF3p7RH3XsxMgLfWY+ca4l9PBG9VtqQMX4OENVcwloc1HjuYjv03U/lsR41h1LeRHgRaRTSa/RR2ouO/7ltLB/fOzxdgK0AY1/tpJuSHlka1kZMWJmc32fIsyp4VbysqzstUvyKXIJMs50fpV8SzTKgt0XkjMqG4lhpIxxK0svhvThnYcsZI1d1O6fm9G7M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7XXhsyrhTN0J/cIZj/EenfOwwkUWhA1D8ILiNCB2zLU4ACT21TAok8AlIl3Z?=
 =?us-ascii?Q?Ss70wdGSVWwZ82GJxA0Fev2A3xfICF358GCmzKSHH2EdnvYOPbJb35Xw+8mb?=
 =?us-ascii?Q?QcK6noqK7iwCk42q9HDpFHF+GfZ6PhWXbV+xFpmZ9+17BB7Q85RBvJF3ajBX?=
 =?us-ascii?Q?gDE/VAGn9ANJch6mkhbhXaNRptT5/B4BJy2IXIPWlDfFJRsfMe7dzMc/mthC?=
 =?us-ascii?Q?UrI0cJk+9DnTeKvWIkqS1BOVUAXvT7QT6mbDmBA4SRdBRnR/6sROVH72BfSa?=
 =?us-ascii?Q?rWEKTVNb91iXbftNtIKThTq+CD8+2/yZWkFHGBTVRMNV6JTGnF97A42Rij7a?=
 =?us-ascii?Q?70XHLoUXkR/a281k45WEE4iaSzKR+ATD2L9wxh44L31Uhz4XCpS3kuetas2b?=
 =?us-ascii?Q?MyMD+hpxd6bhMzVzaCe4WEoBtlQFCMXlobuceiPbhguNktoulnpUh/uXePfx?=
 =?us-ascii?Q?0BiMVBLWM/BvQ9AVqWJVE0j2nsr4o0NBHl1Ayq7iYvHOsofIR6ra7XLYE+e7?=
 =?us-ascii?Q?Q9eT6jluBtsJy8i60PaoarPUQYZ7L20LsFjA12iKB0MvvL9b83ga9llWH351?=
 =?us-ascii?Q?2nIYjuABE/aGTAeLrF5Aofty+TVBaXCjuFOKD9k7nnMVO/b38jDDrzLHeMdo?=
 =?us-ascii?Q?Ei7ohrQC9J8zU0XwBOsfEgVnUUXQRlMIkMjy5M4SuGcBKkCiQlvdeg3CsLwY?=
 =?us-ascii?Q?6Xb0OU7VeG/DBylSvChukHQAOMK+BVmb71XF2bigPjtryRMzBOfmz/MCaIeu?=
 =?us-ascii?Q?2TYDq+PW9hFFYnS4E5MnJPgHvXZv4G39PZCDC3j7UHuIKkyd0p6tHVjOYQSb?=
 =?us-ascii?Q?guIr+dEiUiSXn+5J+Au4fN57LJSUHmLUJdYcRbTcazNlic26VDaK0w7x8Vrz?=
 =?us-ascii?Q?MJk2D5gM5g8eUdscr+rD4VqgLvUiFjdckGzokL/agM39A596EMsluaESn4J3?=
 =?us-ascii?Q?fsMa7aBaPAVV/oWrZ+j+7S0K073D6EhLcP3xKV1sSbUkutlQ/jX0hvZ8lVWZ?=
 =?us-ascii?Q?BCbf+Gg+gRtFNOxJcFPj/8tjQ06W3vt/MDtMYIn+nct+Kyqg70IDMeJaYj65?=
 =?us-ascii?Q?afxlJ+/jRhk4eRKGQA/HMq4j2TFVqUcnPESoWvCElUhSVVm/Ks+vnK/xqus2?=
 =?us-ascii?Q?Ynh6ZcM+X9j8qlwkW2+eUkI0I9DNJpitBcQLAuSYNoFWX+Z9PZXK40q0/Ebq?=
 =?us-ascii?Q?qJ/u5ilta/ht+dbDnFR0J3ZTKfSbHuYIAc5daV7u8iJu90cGt8G4eAMkN2ho?=
 =?us-ascii?Q?vLOARFojQ51wPm8LL3lyc/otlashVJdmX/ZBVLawpNLyGX0rdD2dWKyQmMte?=
 =?us-ascii?Q?k+GtMBDZVi2dwiVdDWSKA3xLOzgt3S+TI/GCRVbFKeHM/1ub+XX4DNg80R+N?=
 =?us-ascii?Q?gaG/PAnkNplB0jrkJE+awSYXd7LJcIEnFP3gRKFASN5BgUCxV6Z7HuP62yGA?=
 =?us-ascii?Q?Cd9+6zDmol1z8rNhNSCyP/7FJwT+c1s4ne2IQgkd1liQPi66CZ0DNpu6a86n?=
 =?us-ascii?Q?diICJMItHUAiCNacLCIWrL6PKK7vM3QgBvGJIMRQojsKDOg2qGIqYlRH8oaq?=
 =?us-ascii?Q?JycoJpPi6mT4WGvJJsHvxofAILxFNakvq/OMEIVEcuhwWiEM1PclYtmL5O/W?=
 =?us-ascii?Q?07/JIJpwanqtghJmlWyGHE/LUrZdG53CxaMLGNuJ58rM1Bsk8YHyLZeLVIXe?=
 =?us-ascii?Q?Cbd501hwh5SsiDCKHEMRu2xrc4C51QghC0qjaxuQYJvkn0DO/YOdlcQLgFTr?=
 =?us-ascii?Q?BnF5ZiPQHQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: rfVti6NOBP+MyH4ZmSB0ge2xan2raslGUKxYU5cXZ1SaOAw+O62TW7HU3YTtSlY6aZjXcM9y0Jdt105N1Pa7egW7d2KnaD0gTBdwW1c4CQEYe7ELngBiKQqOBNdTOSOgpmlISTLy91PheLV6jGK+yqpP1UImF8wvsjoA8pjI52aKcb6DxgETT63SvVlLomqy3NJk1hFlyiSX94gNDBtQSNiB9dWDtzEO6v6ygxlLzVlyHhTJMj9JPDIRkwFiMogHYb/eecraT+Jkf955mthjWKdwvXQKdZnmujRBVnAlzDUYwRSzI3RKSd3YsGuRdNa5oaETNIQ5ja7PKGBmwkWPtA==
X-MS-Exchange-CrossTenant-Network-Message-Id: badd8911-f120-4e3d-f7d3-08defd2ee558
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 13:44:59.4862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tA3o23pzLfUyGe569S2IZ79OxYpoRIic+/an+IUSLX4cANBwrs3qMCr1X8m5KI7RoyP471B78pUFSiHf3YpCYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7449
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

On Tue, Aug 18, 2026 at 01:48:34PM +0530, Tauro, Riana wrote:
> 
> On 18-08-2026 13:29, Raag Jadav wrote:
> > On Tue, Aug 18, 2026 at 01:24:55PM +0530, Balasubramani Vivekanandan wrote:
> > > Xe RAS functionality needs DRM RAS support. Enable it.
> > > 
> > > Fixes: b40db12b542f5 ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
> > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/Kconfig | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > > index 4d7dcaff2b915..6c584f918edf2 100644
> > > --- a/drivers/gpu/drm/xe/Kconfig
> > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > @@ -42,6 +42,7 @@ config DRM_XE
> > >   	select DRM_GPUSVM if !UML
> > >   	select DRM_GPUVM
> > >   	select DRM_SCHED
> > > +	select DRM_RAS
> > Nack, this was an internal workaround. It's upto the user to decide.
> 
> Agreed. This should be upto the user. We can add it in CI config but not
> select it from xe.

+1.

And actually, even on internal we should remove this right? There should be
a proper way to enable this on CI itself, without an extra patch.

Please Bala, check that.

Thanks,
Rodrigo.

> 
> Thanks
> Riana
> 
> > 
> > Raag
> > 
> > >   	select MMU_NOTIFIER
> > >   	select WANT_DEV_COREDUMP
> > >   	select AUXILIARY_BUS
> > > -- 
> > > 2.43.0
> > > 
