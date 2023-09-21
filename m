Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8BEE7D0A2
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 20:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B3610E614;
	Thu, 21 Sep 2023 20:14:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B58810E614
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 20:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695327263; x=1726863263;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xPYKsHFVOaQHX6kuQLWACXlLEULWw4zo4P6FQGoNHkE=;
 b=fTDFKo2USiOFUTWLvgD8u5L1gE3zGDJERktOKgv4I/Kgw3nhqzzUdrHm
 LU9+eX4ZwN9GlaVLI6yTHlDXPtw4S4oumkVRz6yiuII+dhezImkHmSYpi
 97x14ZxJsa3jXHfW+aLw3wdberye5bBtUN4pE4kslGePMfpohz0mXZq1q
 qM65vaPa4VCFEFU+UEXK7a/q5K01U2AdeNLbNHHbpz+C7j+J4SyIXkNbk
 ggyHyGLNwYtuVlB+VAfw6EJnzWT00nMayk58jo0OyfEXIXBHVwPo/cq0J
 FgDOmA5U1b1MfaPVmHxd1rCo4c5y96BG/SmLd1WzLR531v8XU5dRLP9hB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="447130820"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="447130820"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 13:14:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="812786967"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="812786967"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 13:14:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 13:14:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 13:14:22 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 13:14:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMQMZ8rZlQIewTxGnKVi0PD4eLE44FXAuDUyXT+ZiiYFVLLPnDzQRMguLF10TynZbF83lopEV4iPiXp5hGnym79sFyNV6laF6dEWyyi8+wH+XqLtyDPrHlRsjCaPyeyPRaOTUIET101EinOMLF1wNcm3MdrHqTpyrI2OubuhbrxtlRNj763gdIfGmgiVBKWwm3zrrQljVbx8pgF2wXEqUYfaJBxJRQarChTRCUnlawf9hb/DDSnoMd+15qHOA7ujT96cuCNH+xNkcc8qTa0zCgtU58PbERGEXUVRAHB2N2XAWDJ/3qgL9bPP/VlIuvgOIFZfVQ5fEL6CVG3BjRWYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhKtJkbrYo7eNDBVaGXme3y5N12OWb5/ylfGZAvwIKI=;
 b=ceLOIAwtpZxQqP0wjNmHqdYKF5IAMzpSznfHNxZCzikcr2NMNkSLVm/y6hol8xjFlXaLosJQ4NWBRKVEQ7AEnXiJWDpfMkWXaeEpxyQApCp8ZdfPSqu+Gwl9WqUsiEfvt0R5Pjk5ecGYquJMJX8zxZx2ucoSj/y2ObAbEWHgw6j4qiiSTfcTgbmgH8RnNZxf3P0dPHI+D1sFDvLwZ9jGDfDHqBfZkRwMkHJ3sNt2Y73CrkDsapZoSCPN8X8XQWZIgvjVCTozNmNl3OJqQh51msEjJMzhF/7oBKoFB5lkVxXDvLYXE7VkLG4M7tIn6SwI8wOaCUMEpnI+t5GSAJw0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CO1PR11MB4771.namprd11.prod.outlook.com (2603:10b6:303:9f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Thu, 21 Sep 2023 20:14:19 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 20:14:18 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>
Thread-Topic: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode setup
Thread-Index: AQHZ6lXdhnR6bAnnAkuRArVea0TjA7Ah8+MAgAGA5iCAAAtZgIAAKIYwgAGODICAAINdMA==
Date: Thu, 21 Sep 2023 20:14:17 +0000
Message-ID: <DM4PR11MB63600A2071A1AC821547A009F4F8A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230918173711.625930-1-uma.shankar@intel.com>
 <20230918173711.625930-3-uma.shankar@intel.com> <87h6nqtpzb.fsf@intel.com>
 <DM4PR11MB63600D5DCF025595B46C98B9F4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
 <878r91rwbm.fsf@intel.com>
 <DM4PR11MB6360E6B0DAAF5EADCB0BAA31F4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
 <ZQw0gxPDgHqyGCir@intel.com>
In-Reply-To: <ZQw0gxPDgHqyGCir@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: jani.nikula@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CO1PR11MB4771:EE_
x-ms-office365-filtering-correlation-id: 27244601-e3d1-45cd-b61e-08dbbadf55a8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: miE0s96e8ZaCWQQVg/r6bvojGLaKfgO44nQKrPJE1bdE7L/gFsYf5VbPQbmHW2wgUIYAbLfMbWbr1KTYdI7GxVeiCxkV8V/Ctt96CSgbEnHorUF13y8xWVKnFHrOPv8e1pADlk9FGBpYpJxjwqv7w7tCrUWWg11MRUcyK/M636jPT7muwsZK9+xZaqjSYf8ooeX0nvJxvb8uHx+iJUtFWnGCDcPj9xPeLqpC8afKxnWHIHM94HvQy1qmcg7vrulhGJONAb6iYdVrTFjDWTep7X59UuHuy/uu5zwsmWgWcDfxvmfhZVNfqln4KvqQhj0ii+VFX25F0iwGJqQRHOkGknUTt/wIbUuS19rdhHGO88lCRomrQ67e6SpzQZsCwNuUhPTBA6mXc0QK21UrOe+crySlUK1ta9Ax+l3I2szQI/X+z9yR/T9Hx+J6FYL3Te9jUO50q7jkWTY13Mq3/H6zEPEHj3FI1tD5YGq8CV5iD9heZfgH2kTzjIwPoy5HjNP11EBbJfqfjvvys9bRlWVf8wJfj1/GNmmz1BMIVEdsOOfCjlHFjC6Z8LKywAMMc4OUcPqbXXV29Y4fl7t+LQ13OzlzyUaUkpyI8+NSxwViD64=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(366004)(136003)(396003)(1800799009)(451199024)(186009)(66899024)(26005)(83380400001)(55016003)(33656002)(82960400001)(66574015)(38100700002)(86362001)(38070700005)(122000001)(5660300002)(478600001)(2906002)(8676002)(8936002)(41300700001)(4326008)(52536014)(316002)(66446008)(66556008)(66476007)(6636002)(76116006)(54906003)(64756008)(110136005)(66946007)(71200400001)(7696005)(6506007)(53546011)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jlZ+61oQA02HizeCKZsdKI1hV488l4hmAg01obrWQXr8IGwmc1NXwPvjAD?=
 =?iso-8859-1?Q?tozc55kuJkGiYeaBBtBrQdU/WyS5RcXzB/zCLJ60c6/WKE/jfH6H2LVGHg?=
 =?iso-8859-1?Q?vo/XTGOsH3UEeRDinnRIVR1DSMU65gWcspoLLpO8VKqKHKE0UYaC8OyXWr?=
 =?iso-8859-1?Q?9d9jrSYOgNDWKVVxA2ReHwyPx8IR46wozKWEQSJDKps66SCtTgiZsBzE6W?=
 =?iso-8859-1?Q?pQlUOWumM+62q9BODitH4gnYC2gRLfFvw3BrzPCGKNq5kt/KWMbUez0NPu?=
 =?iso-8859-1?Q?QuufLNImnfT12jX7MG4arP6Gym9KFtxcc2SzpneHLKvwESBpZngu5Ayn34?=
 =?iso-8859-1?Q?KM/Zeut9pS2cZyW9R/Xhu3yIg46t/1Bfne3YfoR1FARMZybwRtTfrTGPyv?=
 =?iso-8859-1?Q?fKanbpvrU7+VdFPixQ5lUS19oTkJkKbOfhOfoQ378Hi/yZf56sjFQDoSN+?=
 =?iso-8859-1?Q?WXL5TRtGVVnEI6f4IU/dffZL6Jyo2dzoSY18aFjb2QRRhlbgWt8zaXHVGE?=
 =?iso-8859-1?Q?6BzTzTCzxh9lMft15+9FHhosn5chpAClhFVxgkdt1gPpJv2xhoqWQIXNB5?=
 =?iso-8859-1?Q?WxeFqyzNFuHG8MQekRfgTEOcYorP3vdj3KI1+SpttHdCfKjT0kfnaPCT5+?=
 =?iso-8859-1?Q?H1l+MlzOA7gb4XSC+E9KSSnrD6qVzLUJl3PHXj6C4mMkV+jWqtqZ1jDUH5?=
 =?iso-8859-1?Q?8kBsu5n/XbfPZ1nvymisJN0Ta+jXGlSVG6R+cHWpWsgwK9Cymk9/YQ3a4s?=
 =?iso-8859-1?Q?zbwssnWl9t4B/JOzXl/p1MN+giGX6CmW8IZQdJYfVxTvlT9WxeCDU+yiwA?=
 =?iso-8859-1?Q?g9FQ34uvOtchzVg39Ay5Xt3m2vPp5y+gfN/7VvxQ6cH1ttL7lFh7vzlbIE?=
 =?iso-8859-1?Q?yOIOc7+dftWpKfFPp58j3Xrn0AFObx3+pa1FE/QcDG/VFkSippst0yQAVO?=
 =?iso-8859-1?Q?6DEzXdBhm+BjFiGGPP0hMLc42wUmoKIBj1fUsHVzvml1FbPoZTaEimD8mX?=
 =?iso-8859-1?Q?o+dIzlsKenjxKSIVMCWrWpJYXrKltTe64WrPb3gfyBjeQIHZyLNNcxaidw?=
 =?iso-8859-1?Q?X/nxL+H/AVGznmexrMu7Svboo5u5ToiDismZd/UZo+RXVg6BBdsJwTokTc?=
 =?iso-8859-1?Q?vIjQ5jk+ACTk1wPxdBUr8MdUIVIyAm4hTzL+Ed9dMWMonvdSV+Iq89E2p5?=
 =?iso-8859-1?Q?A46XEqEIvUuTTnRsYLrby6a+5i1LJi/K1OgbswZwyEuiGlSubvcqwrpKWT?=
 =?iso-8859-1?Q?c8/ZenisGGEVABT4g299jiQ30WtDTsUcBR3JpgW8Q3L6uaimEte0I5AMFV?=
 =?iso-8859-1?Q?wv2dARBSZ/0Y533aCcMlj/2KvGXJ/fPmBYY3ZNRrnbiJpcb/HehpfAfb/7?=
 =?iso-8859-1?Q?/S6KAFqxiBvTYw/MtUneNbuMKTIONHj3nGleZhpJT4DOXpxfHpFod29U5t?=
 =?iso-8859-1?Q?9oqTCQYZRevsQHf0wTh9XTZc5GG+3QKBM6+S8h5+Z1qlMUQ0UaxvAJI1Rf?=
 =?iso-8859-1?Q?Z97rrnqLusX8LP7xMotvDpFkmu4JmYmYUHuH6NUxGhboBmiVai5mNj+i/g?=
 =?iso-8859-1?Q?OsWw9PluQwyzngUSIrrdVTrxbFWaP9k86bjtmO2QNGEJtTUPrInvI4FJkA?=
 =?iso-8859-1?Q?ds/dC9S5Vy5GGLifcKe7Z+I0G+RacF6PJg?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27244601-e3d1-45cd-b61e-08dbbadf55a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 20:14:17.8490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WpgrVfxaW+wCzYE8U2bFaa7ZUMohnj1YpQPZZjRD96Q0D3rjHoJIRgKC7xOWNX2H7C5mem11K+limWpo5lCS3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4771
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Thursday, September 21, 2023 5:48 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: Nikula, Jani <jani.nikula@intel.com>; intel-xe@lists.freedesktop.org;=
 Borah,
> Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Subject: Re: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode setu=
p
>=20
> On Wed, Sep 20, 2023 at 12:39:19PM +0000, Shankar, Uma wrote:
> >
> >
> > > -----Original Message-----
> > > From: Nikula, Jani <jani.nikula@intel.com>
> > > Sent: Wednesday, September 20, 2023 3:38 PM
> > > To: Shankar, Uma <uma.shankar@intel.com>;
> > > intel-xe@lists.freedesktop.org
> > > Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> > > Subject: RE: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode
> > > setup
> > >
> > > On Wed, 20 Sep 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
> > > >> -----Original Message-----
> > > >> From: Nikula, Jani <jani.nikula@intel.com>
> > > >> Sent: Tuesday, September 19, 2023 4:00 PM
> > > >> To: Shankar, Uma <uma.shankar@intel.com>;
> > > >> intel-xe@lists.freedesktop.org
> > > >> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
> > > >> Shankar, Uma <uma.shankar@intel.com>
> > > >> Subject: Re: [PATCH 2/3] drm/xe: Add wrapper function for VGA
> > > >> decode setup
> > > >>
> > > >> On Mon, 18 Sep 2023, Uma Shankar <uma.shankar@intel.com> wrote:
> > > >> > Some of the VGA functionality is not needed by the Intel Xe driv=
er.
> > > >> > Adding a wrapper function for VGA decode setup.
> > > >> >
> > > >> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > >> > ---
> > > >> >  drivers/gpu/drm/xe/display/ext/i915_utils.c | 5 +++++
> > > >> >  drivers/gpu/drm/xe/xe_display.h             | 1 +
> > > >> >  2 files changed, 6 insertions(+)
> > > >> >
> > > >> > diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > > >> > b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > > >> > index 981edc2788bc..aa3e9ad718c3 100644
> > > >> > --- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > > >> > +++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > > >> > @@ -20,3 +20,8 @@ int __i915_inject_probe_error(struct
> > > >> > drm_i915_private *i915, int err,  {
> > > >> >     return 0;
> > > >> >  }
> > > >> > +
> > > >> > +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev,
> > > >> > +bool
> > > >> > +enable_decode) {
> > > >> > +   return -EIO;
> > > >> > +}
> > > >>
> > > >> We don't really want to add anything new to i915_utils.c. It's
> > > >> just temporary cruft that had to be taken from i915 to make the re=
st
> compile.
> > > >
> > > > Hi Jani,
> > > > Thanks for the feedback.
> > > >
> > > > I was looking at any good place to stack it together. There are
> > > > some misc stuff like this which we may need for some other stuff as=
 well.
> > > > Should I add a xe_disp_misc file for this or any other suggestion
> > > > on file which
> > > we can use.
> > >
> > > Let's take a step back, though.
> > >
> > > Why is this call needed on i915 but not on xe?
> >
> > Ideally it should be needed even here. Not sure on the exact usage
> > though, the GMCHGraphicsControl is there on current platforms as well. =
Trying
> to gather some info to get clarity.
> >
> > @ville.syrjala@linux.intel.com Do you know how critical this is or can
> > we defer its enabling and add support later directly in upstream.
>=20
> That whole code is mostly nonsense since that register is normally locked=
 by the
> BIOS. So despite what the code thinks it cannot realibly be used to enabl=
e/disable
> VGA decoding. I have some old branch somewhere that tries to use other me=
ans
> to control this, but IIRC for some reason I had to resort to stop_machine=
() to
> make it not suck in some way.

Thanks Ville for the inputs, so for Xe I guess we can just leave it out. We=
 can try to fix this
in upstream directly.

Will try to add a new file xe_display_misc.c to keep these miscellaneous th=
ings together in
one file. @Nikula, Jani Hope this is ok.

Regards,
Uma Shankar

> --
> Ville Syrj=E4l=E4
> Intel
