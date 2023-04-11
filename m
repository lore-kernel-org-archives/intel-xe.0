Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EAEC76196
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 22:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAA910E03C;
	Tue, 11 Apr 2023 22:15:50 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF1110E03C
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 22:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681251348; x=1712787348;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ccdFBnO+WTFDriwfRftDGl8Zs/uc0E/63bc7FRbb1RE=;
 b=G+bizb1Cs84w2PsBUqn5Ya2C5u+4/h0Cu8XyDQUB2Gny6xeuWi+TtQjR
 pEo7fDsbraoH+UYyFN9xMOR+6c21GmAzD+7UaCLCP3afZ1uF6b+SLASjK
 Il7///ukAYbzXv7MxsTHxunT+xVT36bgA3usAHO9KfM7dbPHTF6uO54uU
 DdwIL3BddDreh6p3ZMdL+7HvHC9nGPGxTFFuF4mjba1PYod0N+EPm66Ca
 uxOPHSqkVnS05qUrvKySp+Iwz9ZnuFn9EjjL32ciCvNCywKqt7POpiA/W
 RLwff5ALuteqP9q0iInBcs5FmzB4vmTWLurURwFKwVuKCM8CWta7MdR7Y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="406573899"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="406573899"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 15:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="719124533"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="719124533"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 11 Apr 2023 15:15:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 15:15:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 15:15:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 15:15:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGGzE687em8LZjwUYYXinTIyk+K4AJDjhtiroTTYtolNUo/SJcGPsYH3mWeqQWQLD1iQ1ampzqjabk633SybJ6hSlF78bwIu0EBuhdh0MDlUpYHf7Tze7BFDLKSCZtzCdWgQLTGgekpzC3y3o/a9WcUejTfdXV54rf3MINE0zv6M6U59twzFWusa3w+SOb0UKkMHISGGUkzrLHpzTHnvw0BS/zCT8m6lkotXwt8gOl/RKyqQlfOyPD1nZdjHoWeGJWnXIghHq2Z02ENk6hRNrt9ESIaQC1gxs68X/f0mTVUeHT7rgoKoxpJBNy2J5oQthOx7Nl3F6/w4ZvT7ymdiOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNetnJOX+R2R+eR5szSIhfxMJ4F9T35SjnyUJ9f4LsA=;
 b=n5Dh2fsQjypuUpzuvsztWL9hyf+hVKm8j+25m7bCL+Pe/vaxR4Nf4ad5R/LcQqGL3W/J2LESRRSHBDzNvSqW7Np3x98nwR5R0rsPKg2Fqo4U2vvmSVZTkB5f5GjnSz1+3yFlJ/xJlbXwtgKsSGVSOoJsUYq+z/Bc71FkvLi0CciLYWRlUlZ9n0YFlGBTY4xdZJc78Ah9+QfnvPGsjAM5vogCvaUxqpr9bqcb0szenZHLWws5ZQlX7250haCjR2gBSoZIGq17a5UWvGKFbRl4LMTczr6+XD16DAxfbXgjEouS7PFlNAciZanyqrqCtoB/ZiVMDXUQUJ1OwK5ou4PvgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2SPRMB0011.namprd11.prod.outlook.com (2603:10b6:a03:4f2::15)
 by SA3PR11MB8024.namprd11.prod.outlook.com (2603:10b6:806:300::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 22:15:43 +0000
Received: from SJ2SPRMB0011.namprd11.prod.outlook.com
 ([fe80::3d20:2a50:2d79:574c]) by SJ2SPRMB0011.namprd11.prod.outlook.com
 ([fe80::3d20:2a50:2d79:574c%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 22:15:43 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [PATCH] drm/xe: Add Rocketlake device info
Thread-Index: AQHZbKstQxOdJk5nBU+CMvc8IpnL7a8mf6IAgAAtGPA=
Date: Tue, 11 Apr 2023 22:15:43 +0000
Message-ID: <SJ2SPRMB0011219968E4B5AA71F4ABEDF89A9@SJ2SPRMB0011.namprd11.prod.outlook.com>
References: <20230411192403.2864507-1-anusha.srivatsa@intel.com>
 <20230411193326.GZ4085390@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230411193326.GZ4085390@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2SPRMB0011:EE_|SA3PR11MB8024:EE_
x-ms-office365-filtering-correlation-id: caf60ab3-a4a1-4278-8992-08db3ada4adf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AIGyy51HzN2tEnwMCe+SHiucDOESftBTx2f/7FecW5/XWEQUDDl96pItNu7n6iABHYKEquSlaop/FpcPAt8sYqTiX+BBmDA1/AVAJGPocLHLfflOXUo41vIDKX7WZ+IASIMnoai2wR/fvB5V6NhrQxtEKbfqnbKhtgxnEtCE8gPQ8bEqQ3SA7tCSxv6lKtJz5zkyazcDsQocmkyKaMdNMtt557L6BmmkRlMjv8QO6dBNOEE9IszEEWzGGPulrfPIiuId9xrXEHG5gLIHZw4onLlnCcFwynVZJkkMlG66PZiwf736onYKi4grKFdW2AwLwHyQsmyypz5UzKe3sniizKJuHD9fuZTECIFKW7LvgWE2tdSw1hcf4oJ0sKu0UCvZLDXFOelQqlZIN4xB+62r+sfa2o06ZUsm68bbWP0msxQ9Pd0iYoEdSYZMnXPN6Qe383Bg2j5IVnnCN0KdGy0vLKr/eJiq3Tb+oTUsWPypsnIxgnLi2ZEn9mYXIsSnI96WBBdn41cMlJq3BmuVcIXBqRevfmlxQKnBHaVQDFKxnL4hIVF7J8Pu57iQ0DjrErvIpUA9B9MhpI3VmgrToZeOgXx93BZHqV1XQ4H9kWsVl7efFoyl7Nk7PjBosvs78Lhw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2SPRMB0011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199021)(7696005)(107886003)(186003)(4326008)(122000001)(38070700005)(41300700001)(8676002)(83380400001)(55016003)(71200400001)(53546011)(6506007)(9686003)(26005)(478600001)(54906003)(86362001)(316002)(6636002)(8936002)(66946007)(6862004)(52536014)(5660300002)(33656002)(66446008)(38100700002)(76116006)(66476007)(2906002)(66556008)(64756008)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/wHdYxu0U6pNeXVu2+7/U8hQzY/WmNQaDHKgMXqUx0bNsV36cjNS9rNPW2LY?=
 =?us-ascii?Q?4crmYhiXRL4IirF0INYQvVBeeAxpv1gvhm5FqHNaY/qS3/6rc/LD/NaVpkiZ?=
 =?us-ascii?Q?yCQotNXvnb1WazPtELYIBX94RzhC40vcyB3xU6MZd2fiDV3DLWit+tvE9xtQ?=
 =?us-ascii?Q?iH0khyj4AadsLol9brl+wJQBeKx3htzbG9kF/V2K9fKBYRgDsTQV2Ppov8mV?=
 =?us-ascii?Q?Aogw4kjJFizkw60XpTzfOpDw67uCRuJ9blvILB9Dplry252ZIs/CGeE+Llbm?=
 =?us-ascii?Q?xY/76ZSTtJB30B2LBWcHR1ZhrvySTPy0teRrPpGFqMmzFoNVSd9H78OsJsnO?=
 =?us-ascii?Q?1Fpjm3cRoKQqDZgIN5b+EC6ObFUH95hjhNr1sE0sY6suVvRStvpHHr7lkE6d?=
 =?us-ascii?Q?C+bfi/zzGdn36YHSc33b9eKcQcVc5OBJY2mN1gYnaJVezFEWd8Z41jfdVuRq?=
 =?us-ascii?Q?S7cNEPoNslFaPPQK4aDjFmWlXIRyJObuF0Gf+tAOQfTsVzh6ib6FqKsxn8tK?=
 =?us-ascii?Q?bSrFLUBYWGy1gfxOpRiO7XoEfHcnXlPBsyYxzBJDG+GdqwIq+1ZemxlIwxsd?=
 =?us-ascii?Q?GpRD+VYqPaCdmK+DzvAOpuUQA3/qyk5RiBFPgFzBO2n+b5GW7J1bNnNtrQrn?=
 =?us-ascii?Q?UnCtHVJnlMhif5iUl8p2Pl7z4MLG0XYk5gT6X497pfC1SBvoJHNVWa8M+6Bl?=
 =?us-ascii?Q?XqS9Oc+iHSSXxuxOOt8oW6xUbjhoPEUfkd8BICp1UIwOl/fqUaZ10W0q3mDB?=
 =?us-ascii?Q?tafKi293GdBMZunfs06sQaR45bjtcLBltxClXBDU8ZqQN8772JIwakOyNe2i?=
 =?us-ascii?Q?yR8Im7hoBaK7TL0Fpy16nYoRMtl0fXXmfa3D/cU3M0eViooQedwFU/1N+m0B?=
 =?us-ascii?Q?wjK3naoAqnBngGS/UMhDEo+xIwcAquvMJism6529aeKOM/6rv41uku4Mg3l4?=
 =?us-ascii?Q?qWDXoDxSjTcztjaPpZPlJc4qs0nVs8MLHBXWZEWtfXYmWvyjBEiIE5U1Lnv/?=
 =?us-ascii?Q?DBUI586qzgoGKaNWkdnE8KaUhFizMBcwp0HzwpmGVt30V5fkC4yyIlndUV1U?=
 =?us-ascii?Q?vk9GUzt6kPSxFiKKpVdSqRwApl9ywDbP9MHIOhzDJlzSGmeXLgbfEX+ZkyNb?=
 =?us-ascii?Q?YcPTGTls0PMEfhmkPeZaDph3ug1FOh4tRHBYFg7/hm+cp64tUHXWqBY94bdG?=
 =?us-ascii?Q?062Qs9VMgvIDxQL1vJbsCAIDxuAfS9zbN9l733RWU4bwxHBVEfCr0eCpC/tn?=
 =?us-ascii?Q?+YTyr+i5diPqslLsraLlDfWevDlFon6fG2BgPK7vyNcCnM2kdwgCuS2/HK2t?=
 =?us-ascii?Q?v4ZNzsPp43wTCZ3kZA+dnaqH0Dyg5w9PPDItoI2tJe/nWGjtZb9A/1TqDDMl?=
 =?us-ascii?Q?Rn4xwhLlozTS/3hEnKUiaijtcc04wHvx3ccfiO/XCDG9bTypRKnKFmDttVng?=
 =?us-ascii?Q?hUX3zZSyOteq8j+nRrb6qB4ERyWFMJ02nxCn+BJII0UnS/MIdC87xVM4SZrC?=
 =?us-ascii?Q?ULF8ri842ZDuivkHm4z2TdCXeAyDS5OabItUdsnLeaRFFWtMWmPvcj+j5qlG?=
 =?us-ascii?Q?mZ1O41AtpG5bzrBiMstYVLmaCkO1Z00RIhCVI0hrsdSAtzBEGDqTs0O/RsJ7?=
 =?us-ascii?Q?9Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2SPRMB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf60ab3-a4a1-4278-8992-08db3ada4adf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 22:15:43.5906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ydw9Vl+zhQsAvPbJ9/hCZ1PN0n46W4ZjGKSxFHEWS1xCn5ZNBUGx2AUfS1xNB+L1NxrrVwdfi+M6DpkAqe5wFOePcURV3zFQZqdQx8VJ2h4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8024
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
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



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Tuesday, April 11, 2023 12:33 PM
> To: Srivatsa, Anusha <anusha.srivatsa@intel.com>
> Cc: intel-xe@lists.freedesktop.org; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: Re: [PATCH] drm/xe: Add Rocketlake device info
>=20
> On Tue, Apr 11, 2023 at 12:24:03PM -0700, Anusha Srivatsa wrote:
> > Add missing device info for Rocketlake.
> > While at it, also set the value for IS_ROCKETLAKE macro which is right
> > now set to 0.
> >
> > v2: Also add abox_mask to the device info(Lucas)
> > v3: rebase
> > v4: Set IS_ROCKETLAKE (Anusha)
> >
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>(v2)
> > Tested-by: Anushas Srivatsa <anusha.srivatsa@intel.com>
> > ---
> >  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  2 +-
> >  drivers/gpu/drm/xe/xe_display.c                   | 11 +++++++++++
> >  drivers/gpu/drm/xe/xe_pci.c                       |  8 ++++++++
> >  3 files changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > index ae25bb02896a..3de1b0c8e23e 100644
> > --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > @@ -70,7 +70,7 @@ static inline struct drm_i915_private
> *kdev_to_i915(struct device *kdev)
> >  #define IS_ICELAKE(dev_priv)	(dev_priv && 0)
> >  #define IS_JSL_EHL(dev_priv)	(dev_priv && 0)
> >  #define IS_TIGERLAKE(dev_priv)	IS_PLATFORM(dev_priv,
> XE_TIGERLAKE)
> > -#define IS_ROCKETLAKE(dev_priv)	(dev_priv && 0)
> > +#define IS_ROCKETLAKE(dev_priv)	IS_PLATFORM(dev_priv,
> XE_ROCKETLAKE)
> >  #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, XE_DG1)
> >  #define IS_ALDERLAKE_S(dev_priv) IS_PLATFORM(dev_priv,
> > XE_ALDERLAKE_S)  #define IS_ALDERLAKE_P(dev_priv)
> > IS_PLATFORM(dev_priv, XE_ALDERLAKE_P) diff --git
> > a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> > index 5fab5b9fbde0..44697c0f7fb5 100644
> > --- a/drivers/gpu/drm/xe/xe_display.c
> > +++ b/drivers/gpu/drm/xe/xe_display.c
> > @@ -488,6 +488,17 @@ void xe_display_info_init(struct xe_device *xe)
> >  	case XE_DG1:
> >  		xe->info.display =3D (struct xe_device_display_info) {
> GEN12_DISPLAY };
> >  		break;
> > +	case XE_ROCKETLAKE:
> > +		xe->info.display =3D (struct xe_device_display_info) {
> > +			GEN12_DISPLAY,
> > +			.abox_mask =3D BIT(0),
> > +			.has_hti =3D 1,
> > +			.has_psr_hw_tracking =3D 0,
> > +			.cpu_transcoder_mask =3D
> > +				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
> > +				BIT(TRANSCODER_C),
>=20
> Do we need pipe_mask set here too?  RKL only has three pipes, so inheriti=
ng the
> value from GEN12_DISPLAY -> __DISPLAY_DEFAULTS won't be correct.
>=20
Yup we need pipe_mask to be set here to override the default value set by D=
ISPLAY_DEFAULTS

Anusha=20
> Matt
>=20
> > +		};
> > +		break;
> >  	case XE_ALDERLAKE_S:
> >  		xe->info.display =3D (struct xe_device_display_info) {
> >  			GEN12_DISPLAY,
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 4b01d8c538ae..c92faffc838c 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -181,6 +181,13 @@ static const struct xe_device_desc tgl_desc =3D {
> >  	.require_force_probe =3D true,
> >  };
> >
> > +static const struct xe_device_desc rkl_desc =3D {
> > +	.graphics =3D &graphics_xelp,
> > +	.media =3D &media_xem,
> > +	PLATFORM(XE_ROCKETLAKE),
> > +	.require_force_probe =3D true,
> > +};
> > +
> >  static const struct xe_device_desc adl_s_desc =3D {
> >  	.graphics =3D &graphics_xelp,
> >  	.media =3D &media_xem,
> > @@ -305,6 +312,7 @@ static struct gmdid_map media_ip_map[] =3D {
> >   */
> >  static const struct pci_device_id pciidlist[] =3D {
> >  	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
> > +	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
> >  	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
> >  	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
> >  	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
