Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933F0CE79D1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 12:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475FF10E4AB;
	Wed, 20 Sep 2023 12:39:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0763910E4AB
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 12:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695213564; x=1726749564;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dE2Wm3QOnNFC/mRO8OJ84HS08gf4pTWYJ9VwHOs2xcc=;
 b=hHYdTWHEl8iUNZpIA1RwqM/KPLvVPpW70Snc0P6INHF/EwybwSnXQq/B
 wZIKFFEcgYzvRn+HP5un6YfBo3GU/YmsBgVJr9zAGK86zWiVNDpJJZw6H
 oQmDt95nOGOCuUWPjNbzagB68R1qJ06w2ARv7GK92AfUv+ucoftgls4Dl
 Ru6engQ787GIw2BvhGC3r81WGAh1EjCiuTk4zzIVfAPM69SNrukjkViuG
 WEOoMHcbD0M36LwhsP5G3w8MLXdyHwvkpNEratNaL3WbGOmO+jPTpRUHr
 sXF6SGJXUzv70b9X5OZMrf6XtuS0rCaJ1OJ6/vhBsqqyLfL0RFy7JKaci g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="380113795"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="380113795"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 05:39:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="781676836"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="781676836"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 05:39:24 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 05:39:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 05:39:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 05:39:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmeMNeOzA9T14bOXWT/sD+oTVO6TsngfvQnbitHa81Gm+aQp9E9ucCPPBsahiIJ98W8YkXcuO6MqKuEKVBkvxPOeKiPbb5yR6MPTxAmbTdkGxG966iM5W51MohRI2ugWnuze8fOQdigIJ26GgRkiMeAeJ5myhqv07z4yf0rGUR2B0bSyrjTz2E6w8nGwY7Hy1pnr29xMkUxMwcBfuhcEZxY1+Goe53miUCgey+YwbQJhwejGZJja4Dtfau+0PG4U+NwNBg7SITPSCWMLF/iVfSWVBCRcx3f0RTQfiG4QGlPxcNRgB8kgLuZQ+pd3JnUJjQcjAeJRKpb4csL+87Q5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aSIWymEMErylXuBLH/fEnQBcVQ6uHcxrhvDRajqyf0=;
 b=U863ey+agJo70BlnsPv2clBnaxdSllAmSepQNvxWa3AxF+hWdKJkVzXror8xWokEMzzXw+z4unGpq8cfNVBLE+5jT5PTIdK2x0sMBLTQFMVQo8ATmkPEEbHt4KbB8ZgOwHrpXLOnhXKwVdikaOk3diwpJlVzC6H1v3RUGfAOZ9GyYIb0Q6OZIJg0IBOHjK/aKLjrtXd2eBW5+t+vadoSkaLzV774PYeQ36ZMEz9GyVfkv92ZwRTC+hrqVJAPoTTpL0iy65idMcq2Zz98qNsNeUW/i4xc1MRy+LEImER7PyF2TqEZ9pw3BBjIjqcp5LVFaEY6tJZ90wj++gjRg+VubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DM4PR11MB5262.namprd11.prod.outlook.com (2603:10b6:5:389::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.28; Wed, 20 Sep 2023 12:39:19 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6813.017; Wed, 20 Sep 2023
 12:39:19 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>
Thread-Topic: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode setup
Thread-Index: AQHZ6lXdhnR6bAnnAkuRArVea0TjA7Ah8+MAgAGA5iCAAAtZgIAAKIYw
Date: Wed, 20 Sep 2023 12:39:19 +0000
Message-ID: <DM4PR11MB6360E6B0DAAF5EADCB0BAA31F4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230918173711.625930-1-uma.shankar@intel.com>
 <20230918173711.625930-3-uma.shankar@intel.com> <87h6nqtpzb.fsf@intel.com>
 <DM4PR11MB63600D5DCF025595B46C98B9F4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
 <878r91rwbm.fsf@intel.com>
In-Reply-To: <878r91rwbm.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: ville.syrjala@linux.intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DM4PR11MB5262:EE_
x-ms-office365-filtering-correlation-id: 90b80495-a650-4dd8-1e08-08dbb9d69c27
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PsxqnaUvHZ0nbaq23Yo6RFnOlr+LTaKcr/245LwGyHb5t+uAGxbNMGawgGNHJyKeKmQsqY0O265FVGcP8SNz0vgBfAzb+4HOpXmszx1Pt3+1M4bSU10B29kRTLS+tLYt8pdkJd3zBL4pi4t7jUtIW2B8xC6c+4DKhwLB6WXSCw8kezOuq8Ou1xFmDyHuFvOkWPvNaDM3Zz/mvWVQn8SztF6vf2inVuqfFUkhvD3X29mXoMc11PERpc89CEKKc3URT72jZCwgRt3QSGHr/+BABAAF8D19SPZUsX9AmIjI2UnDd50pJyAMIyeoXTM1IKJEjQGAxo9bZez+7+WdnQSRn++5hlT1bE4nTv4dT7k4ZXbK8g0X2Uayv7Od01O7Jtgb2sXm9WdsND35hy5u1vV88eWpOTNBzBG9GGMWRFZQ/KBNaLoknBymRFJKgvzR6cX/tIs7FmEdGj5NzzPhHT0zwRaTlOhJfRoGeOCOJgi4RgX7ysDyEBiIgyNeXkUYWpDfoujaoRhgO3zzIxBXLN/5caUfg/E3qKkzgr/TEbcKfktw2UXL2kiqVE9BZriYB6iaYDJAT8igajGhN93x1nfS9r3DvljsUt0zYYqNI8rshQzJFGh14JECoxoJVBi3bDmU/3YGaJ8AW3QDnINtld+G+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(376002)(39860400002)(136003)(1800799009)(451199024)(186009)(26005)(52536014)(66899024)(33656002)(8676002)(4326008)(8936002)(83380400001)(2906002)(55016003)(5660300002)(86362001)(71200400001)(7696005)(6506007)(122000001)(53546011)(9686003)(38070700005)(38100700002)(82960400001)(41300700001)(110136005)(76116006)(478600001)(66556008)(316002)(64756008)(66476007)(66446008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/CcL/3AFVbFh/VYMrDm+3F5OPvbJWRL8fKNnbSi/bFshKKQRZ7G4g+lwPLh9?=
 =?us-ascii?Q?U9YLBZ5ALAqV964LV339TGXy6vStlqBBHf3Jr+/TZCE7eGfJ5X8tSALvgGKJ?=
 =?us-ascii?Q?Py2u6+sWRaWZ/Df0ChwqJcZQfRH30+Wdt/QM+uA1iAWrcVlJhmkhBqJf6Vff?=
 =?us-ascii?Q?t6Q7kA49/WD7g7g3cbBl1f3sOVCFnIYoBEXCUPKicOBjlW5QO+AdZ+4CrxNw?=
 =?us-ascii?Q?fzqjtAMLvXriXWZZxv7Kk0Icy53rrzcQ/gjNy0QaXWyzK0Yf4RZM1El6t+V4?=
 =?us-ascii?Q?sZh/lRjfMcBBS4/czwT3z0zPlQRodtFwO6XYlBDKbhkOQ0ilVghomzPpmfop?=
 =?us-ascii?Q?4gLY9XV2Che+qQMm6DIzaS/UvTG7NOlUpR0ZUdbCHlF4wra2BHfndlrNsSFb?=
 =?us-ascii?Q?slF9pdsBwCSJ9xe/vHp5lOHBUwngm4OLKWaFhQKROyFuaAILTS8N5gDjx0Xr?=
 =?us-ascii?Q?Mfc/mA4XCFEpQvw8C1gJhq/0KlKIa74Q/gTl2kS3qjv5QbOEUbjKlAQD0uE0?=
 =?us-ascii?Q?zEeR8DzU12LsPRi2avTq2hV1SnaFj6aLKhlYOIXv+wNOzZJmkoYn/Gp2Bpt/?=
 =?us-ascii?Q?tHyUaqV+NmrYdWz7PAqGfpzp71YcQM4DI/UfYZ9jFSjQuvQavTyZyliTBjz7?=
 =?us-ascii?Q?sWxaVjAHia2sv/esb6VjNsNYjqLxC3IM5SnWSXGPpxfP/NE3ylT5YCoxZgDR?=
 =?us-ascii?Q?qAc1fB8RqPL9Nbqn+8rnxqwFen0d1DiGSQ7ZKSoO27jbWRks58hZbVFBNQ75?=
 =?us-ascii?Q?2ETjGK2SFNi+ctcJ+FAFkk5eZ4E6G9jD7sTm8q/RWxerS3Y3DRh7cs02djnh?=
 =?us-ascii?Q?qhLl/Yh5WpGhzXlDaaam8+YYXpOOCMRNKl3ic6ofAahTD3Xl/CVm/xlRCor7?=
 =?us-ascii?Q?hTcrqeKphdD1JkMtQt3JHUVDSw3krD3Qus2/yKaxwF/h1gq1GhQyzdBpryKR?=
 =?us-ascii?Q?Uu4tH5i92jT9E7JClexaA9j1/Q5zqRODHCC06RU0ynAMLxGRDDO1drKlKa9h?=
 =?us-ascii?Q?M/Tyd1kcndrPfbQt4OeRaD0xPAwG2JesMPoeSZpezY1o9BAuRF7g8Fo4iTMg?=
 =?us-ascii?Q?ZsSfNSv4h6KpUja/jyiq01RQ/nbqxRLRf/q+p/+jboPXWcQMwUUwIXbUjMXi?=
 =?us-ascii?Q?8V85Hte4X+GpbDkHLyoKR96E9Ak5kEJ2JNeb4tO6uAuGpqN/opwYyPlMxmEI?=
 =?us-ascii?Q?h2smeYdQvbsegsfXCHtBvms//k/UNipMvQrBRy6cv2G1D7ImCY++PZp5VkEf?=
 =?us-ascii?Q?WtguvRpNiLFyz1wlYSgpucmKZsnuoRkO9i3cAUE0bXm1RQZu9vop2wbuttAQ?=
 =?us-ascii?Q?0b/1AG8/KjjNjov/KPEom7lSEjKomKqiTyaonUUrssnzPEjU+vSoGfc+/pCe?=
 =?us-ascii?Q?waEP1y6GDwFPHhLedkVgwkjv/hCC+SiMcuMOz1pc6glngQVbAOvIYk+3jl/7?=
 =?us-ascii?Q?133myMy+HzwGb99IXCIDXb6FIY6MpS3lNs3f/NvWFL4LPKMVT6BEznYvFKiW?=
 =?us-ascii?Q?DLbRl7P/eslqHJKwDAcI0XEYUFUHvWCgoJUhdwB5ApRA4VlqgmlM76h3ePz9?=
 =?us-ascii?Q?eC4vOsVd5VzVugYd8ODhy5IZ7FRFoY+WHvgeIwHy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b80495-a650-4dd8-1e08-08dbb9d69c27
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 12:39:19.6974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yVGNBXo8CgzruFupvvij/9YRlvy2s14bpevvLxDVnurxyT+M2TfbaPW1PlA0gQNr6MQMzjZhgc+v0QCo/RFsBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5262
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add wrapper function for VGA
 decode setup
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



> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Wednesday, September 20, 2023 3:38 PM
> To: Shankar, Uma <uma.shankar@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Subject: RE: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode setu=
p
>=20
> On Wed, 20 Sep 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
> >> -----Original Message-----
> >> From: Nikula, Jani <jani.nikula@intel.com>
> >> Sent: Tuesday, September 19, 2023 4:00 PM
> >> To: Shankar, Uma <uma.shankar@intel.com>;
> >> intel-xe@lists.freedesktop.org
> >> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
> >> Shankar, Uma <uma.shankar@intel.com>
> >> Subject: Re: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode
> >> setup
> >>
> >> On Mon, 18 Sep 2023, Uma Shankar <uma.shankar@intel.com> wrote:
> >> > Some of the VGA functionality is not needed by the Intel Xe driver.
> >> > Adding a wrapper function for VGA decode setup.
> >> >
> >> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/xe/display/ext/i915_utils.c | 5 +++++
> >> >  drivers/gpu/drm/xe/xe_display.h             | 1 +
> >> >  2 files changed, 6 insertions(+)
> >> >
> >> > diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> >> > b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> >> > index 981edc2788bc..aa3e9ad718c3 100644
> >> > --- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> >> > +++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> >> > @@ -20,3 +20,8 @@ int __i915_inject_probe_error(struct
> >> > drm_i915_private *i915, int err,  {
> >> >     return 0;
> >> >  }
> >> > +
> >> > +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool
> >> > +enable_decode) {
> >> > +   return -EIO;
> >> > +}
> >>
> >> We don't really want to add anything new to i915_utils.c. It's just
> >> temporary cruft that had to be taken from i915 to make the rest compil=
e.
> >
> > Hi Jani,
> > Thanks for the feedback.
> >
> > I was looking at any good place to stack it together. There are some
> > misc stuff like this which we may need for some other stuff as well.
> > Should I add a xe_disp_misc file for this or any other suggestion on fi=
le which
> we can use.
>=20
> Let's take a step back, though.
>=20
> Why is this call needed on i915 but not on xe?

Ideally it should be needed even here. Not sure on the exact usage though, =
the GMCHGraphicsControl
is there on current platforms as well. Trying to gather some info to get cl=
arity.

@ville.syrjala@linux.intel.com Do you know how critical this is or can we d=
efer its enabling and
add support later directly in upstream.

Thanks & Regards,
Uma Shankar

> BR,
> Jani.
>=20
>=20
> >
> > Regards,
> > Uma Shankar
> >
> >> > diff --git a/drivers/gpu/drm/xe/xe_display.h
> >> > b/drivers/gpu/drm/xe/xe_display.h index 03b7ea9268d4..d7a200e6ec30
> >> > 100644
> >> > --- a/drivers/gpu/drm/xe/xe_display.h
> >> > +++ b/drivers/gpu/drm/xe/xe_display.h
> >> > @@ -38,6 +38,7 @@ void xe_display_pm_suspend(struct xe_device *xe);
> >> > void xe_display_pm_suspend_late(struct xe_device *xe);  void
> >> > xe_display_pm_resume_early(struct xe_device *xe);  void
> >> > xe_display_pm_resume(struct xe_device *xe);
> >> > +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool
> >> > +enable_decode);
> >>
> >> We also don't want to add random declarations in xe_display.h either..=
.
> >
> > Yeah, looking deeper seems we don't need it as compat-header is already
> including the same.
> > Will drop this declaration.
> >
> > Regards,
> > Uma Shankar
> >
> >> BR,
> >> Jani.
> >>
> >> >
> >> >  #else
> >>
> >> --
> >> Jani Nikula, Intel
>=20
> --
> Jani Nikula, Intel
