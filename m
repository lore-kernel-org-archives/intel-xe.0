Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED03DCE79A6
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 04:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C0310E34B;
	Tue, 26 Sep 2023 04:28:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF0E10E34B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 04:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695702522; x=1727238522;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VkUU9xggYMr4rnXIC/M1NXlCqzTtn8gZh4NxTHKD5iY=;
 b=cRVISocgaPMpjLqnQDp8MBndmN4wzt3IC6iyYjpORyz2hi5kvpBJ+xeF
 DWFQR/z+HxjLTWtKlNNhD2qEMCh64VQSxOjqCWRE9a8lIyLKUF07Xil5U
 1vT5e2DG3lygU44Gwd3hakoqbeweaWsnoljYytlFsq44MnpKNh2xOyLiQ
 Nrpw4C+ix9dIV3/mFuDwFAu4c9I2ZFQxASpHG/K16JRtqpouPCEcIzBfo
 pTTslp8DsQJmiEWxxZiuxxo0ZuzQIDCHwHzCfqb0a/jxATtVAJZU6z01R
 FgD2mMeX2cU36RZeIaFdWDUummC8Q7cRW7PY0+JpeqwRXH7kaEVtp3gTa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412397281"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="412397281"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 21:28:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="922276246"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="922276246"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 21:28:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 21:28:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 21:28:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 21:28:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 21:28:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWxiarrxueSVB0ypNt1W2WCIeHTeZEXsymnhT96bCaGh0zPNpT1fEfWoNzUtcBltZ0STabN2W5IAl8NwStN17kdfi8DQM5OLQBrNWG/gKGwovtT4aMOIkQMR+XG5Dc/KJrLHAUQdTpXHfb7p7VXoVJmM1a+gOK5VZmxSYfTFL3PTQh30Y7osuGUV3Z+0QluCsYfAit+ifvj2x4Ut3Q4h1+SXp00XGfnV4L/ek1U1TLFohPIfMPSpJWgCiXors0GAqCVC8Mw7+vVq3v2C8Gx6bSIPadgBk5sIX+TrkzBsKBy7SDcDxNRL8XbnivbOTg1psYFkoIwST4njcsXsShkt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhaTu8a8j1IFA1QNGyNdlMqwDBSqdnpfyLLCc2NYf8E=;
 b=XjqCdJTUfqZK8OhmzSdHYrze5KhKb48ZDnpEKPNkvXD3ZvGl6qbPYyNyHWQyGiE2MM1EGezaXrr6aDuT/9C08OfN724VXN37MIHBtsify6t7JkWPij5oSKowuw8OU3obOigEhyfdLsCafaQvnp1KcCiCFBER2EpOeohutT9uP9wROwzOI4p5tt14Uf8UR4Fb0OWdvF7yzQPZ2iY9+pzqT2ExYg2ao0YJgJbsM/MtZg4yGUoWy5WZ+Q56FhTlG/eyw1oJFjEREqVdNIJKDzsRVH265YKucny5GyYVZUDRCdZkUoC2SBmy2QeiKxy3S8ZSHWcwxUNFR8Ds/KxBQj7SVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 LV8PR11MB8721.namprd11.prod.outlook.com (2603:10b6:408:203::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Tue, 26 Sep 2023 04:28:34 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::c013:26f7:5743:995b]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::c013:26f7:5743:995b%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 04:28:34 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe: Add module parameter 'fastboot'
Thread-Index: AQHZ7vdjgST/ShzRm02MWFTdbOB57bArQ8oAgAAlV4CAARx08A==
Date: Tue, 26 Sep 2023 04:28:34 +0000
Message-ID: <DM6PR11MB3177463328371DA40107E7AABAC3A@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
 <CY5PR11MB63445AE80355495983540166F4FCA@CY5PR11MB6344.namprd11.prod.outlook.com>
 <874jjio5ik.fsf@intel.com>
In-Reply-To: <874jjio5ik.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3177:EE_|LV8PR11MB8721:EE_
x-ms-office365-filtering-correlation-id: b47d1705-58a7-44b1-6a09-08dbbe490c0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IA9bp9nWJ2UiF2CcZFE71yKIUBz1Ml/7Y19hOh7EO/cIzuViKn8aX1X+VzK3zWBzLSOsB6lQ/3b0+oy6VZw/JWjHNxweYPCV+uwIs2PuA/pSK+FFrexnX2f9tqeFReUtpmnq53JpVGEsuXJSAQcZHzYu76lLxLZo1pKmtZzlBYKJGSIhW2dkyr5io3lyQmPFwr+meSvIHhE6KEXXTBQ58yIOzzFtiI0CCSY/wRhqvYlkVkLLTa/Q9jBpsOsApSpLOSA1kB5oMGyuC06wGpN9psFChRSroesupxPBi7fYiDlwgVvWmPpXzP+PZNEKWWAZrr+rdw0r75oaV8qeQ78oeP9NpBA3Egmprn4VtaFFt7kwNORV2WBGSKktpUDisG/WrujMY6JVSK3M7OqOYqCjky6NCLtlpgYXkGdS7Sza2HYUyKcp1iIZwhROZQdSthrhhdcZl8pYKs8ZfshcW54DNLTndbSdoyx6ULwlyCdHHfeCctqdqx6IP/5LXUGQJxx7jhznJy8aeRyoisRSXFP0vjWzIb7Lc/UbpKPTA3U9zYaJFLVG0HopbXhSaXuk0jUt+02b4skyqOsFNZOTPpOVX37RpuaumLWXWLjYmYAN46kSZBIpeC5E1NWdGyU+oHY3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(376002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(82960400001)(316002)(2906002)(55016003)(41300700001)(8676002)(8936002)(66556008)(110136005)(52536014)(5660300002)(478600001)(66946007)(66476007)(64756008)(38070700005)(38100700002)(83380400001)(33656002)(26005)(76116006)(71200400001)(66446008)(122000001)(9686003)(55236004)(53546011)(86362001)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kCUUy7VjNgJKx7To0VQiMAJrZecRqn2g9N0nhVLRk2lqF+pID8NgETezdqVP?=
 =?us-ascii?Q?eNkslnhftlWKi0DOh6a/R2Hl8Szf5vSOdpVmDCDB61p4U67G30xI0ze/yUoB?=
 =?us-ascii?Q?PwQZMkdgHs30escIz4UEZZddnar7rxLaC+nsc6giGpaP3jeEZQdDKUJtlbbP?=
 =?us-ascii?Q?kGej3QWJnSUwGws0+xeRxmTLYiLvvsEVpKV8rXl92g4q9RP1LFok0lDq+3QM?=
 =?us-ascii?Q?u1+AuzEYOkdBGs+2uh/SvZ2lyRmxU644kOPT6Cd3Emppg22TEiIuyDFYHrk8?=
 =?us-ascii?Q?Wa9LhCvuFWUFMcdZbV/tQ7QPwD8lZqy9jntRQIcDCg1303yWUv9Ums0T0byR?=
 =?us-ascii?Q?FdrRoV6GewnbWJz19qOqSqE8xr1wqdomhEbeuOLbGFbPcJGBK5nQdEl0wgRn?=
 =?us-ascii?Q?K9idm05HiEr4Usw/S3yZ5oLRCIKRENAXqxVhmdKaTUXmT7Dq708jD/E75hex?=
 =?us-ascii?Q?bfa9IUZ2bC6ZxHokTGjejjwB6MZfOFvNrKqBUMaTKyhep7UamtwSS4mhubZ+?=
 =?us-ascii?Q?ae+S8ydfTRvZBsljNc/08M26jYo/b9Y/hukO5F8aQjoiSpOjFX7uM0TLr54q?=
 =?us-ascii?Q?wYhXbxCElv3t2gf8o4/berC84rtWvow78CwvpN8tJ5UcqOcBDa+NDVvo8VMo?=
 =?us-ascii?Q?fY0NgV33bcOlX1TGzPlieXmH0H7uh1SrVh8kkT8mCCcWRbJaKUfO77bDgDtL?=
 =?us-ascii?Q?PobnQb8juWsLVAl5L1cUNU+lyb9pmjYdV9OQVCBv0fx9s9v0wMuhSqtlodnT?=
 =?us-ascii?Q?xuQo2ae+sywHG4rFQPfl+rfGQahxvFuftq8PUYMEGMu9E3OF5Yq9WW9scmsS?=
 =?us-ascii?Q?MHbn9tL04enDz3BK+1DvBtv3aHYr8YPdfP82fUhVCl+VOmNFO0TAfQLldZT4?=
 =?us-ascii?Q?ETdSBl3diIjZN3620BJwLwvdEhx28PBFBN+C9kkvJbjIxk55TaPssZ2Mq5/T?=
 =?us-ascii?Q?lL1mPSWsF/veChxGcRZXfjxCp9PooZtIXy7Bxptn2+kzzjS3SIZ3KHb2KGQU?=
 =?us-ascii?Q?NagNxcs7Y9/S2KO0umLuaJGoI8v8i8ZSpWL23XMGvyvY69xwPDm/eRKZuaTt?=
 =?us-ascii?Q?su2nLDOQc3TdwanYNW27YR63epDM2V/cpkdCVEOuxWrSA7QK1WiGpdITQnni?=
 =?us-ascii?Q?Iq/ON0UoEWCNuT4CNb9KockTy9mEkePHWBmh6Dwj1C24cMAbo6EeVKoL9Xmr?=
 =?us-ascii?Q?IZOLCj6ePcwEFyI1UtdhxuxregyGu0XroG7KmlPDBKePwYgkzIxvVp1BATlU?=
 =?us-ascii?Q?JyeVAMm7liRwy+2/YotRTPvhrGZHOXxfGUQGUbuUq4VI17/2IP+Y9iZvITkZ?=
 =?us-ascii?Q?uBu86PNh4QUBcJv828pntvP5MwUselp5uSMA9E4PkVaopcybN/ue49YRKaVi?=
 =?us-ascii?Q?kdmUIq0+OxpinjlHepfXxvcO7yOXg82DfhrPVuvUV7a41xgnj+/hLWQi+QY6?=
 =?us-ascii?Q?3ULaApUhSj/BXl70zR06Ha3Ra1upcMrVUh4DkylELnBTdB4V5gr/KamFVzCv?=
 =?us-ascii?Q?iO4dXbZQZbXCs8xEhJUZWM722fNwGonqryCA55Dio1bLbpyvgC94cTmk5D3j?=
 =?us-ascii?Q?nO948cG4pfs+31K1JUABUTGz40lkQ35QG9uVHJpF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47d1705-58a7-44b1-6a09-08dbbe490c0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 04:28:34.6494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7KYOuRkY9xE7vCW6NiOYc4yI+FSjZdX6Si/d3Jr3IfUexHA7eehaVtvBatNGas3t7IJjO1QEm3MZugBURKgspQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8721
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add module parameter 'fastboot'
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
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Monday, September 25, 2023 4:59 PM
> To: Shankar, Uma <uma.shankar@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add module parameter 'fastboo=
t'
>=20
> On Mon, 25 Sep 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
> >> -----Original Message-----
> >> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> >> Arun R Murthy
> >> Sent: Sunday, September 24, 2023 8:18 PM
> >> To: intel-xe@lists.freedesktop.org
> >> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> >> Subject: [Intel-xe] [PATCH 1/2] drm/xe: Add module parameter 'fastboot=
'
> >>
> >> Fastboot is by default enabled on all Display 9+ platforms.
> >> Module param is added in xe for controlling the same.
> >
> > On Xe, we don't have the module param yet. So, there is no way to
> > change the default what we set here in this patch as of now. We should
> > modify the statement here.
> >
> > It should be ok to get rid of the #define and have fastboot disabled
> > by default for now. But we should work on the task to get the module
> > param or any other mechanism acceptable by maintainers to control
> > fastboot feature.
>=20
> The question is, do we *want* that module parameter in xe?
>=20
I feel its not required, by default have it as enabled for all Gen 9+ platf=
orms.

Thanks and Regards,
Arun R Murthy
--------------------


> BR,
> Jani.
>=20
>=20
>=20
> >
> > Regards,
> > Uma Shankar
> >
> >> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_device_types.h | 1 +
> >>  drivers/gpu/drm/xe/xe_display.c      | 1 +
> >>  2 files changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> >> b/drivers/gpu/drm/xe/xe_device_types.h
> >> index a82f28c6a3a0..f73c0672bd54 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >> @@ -458,6 +458,7 @@ struct xe_device {
> >>  		s32 panel_use_ssc;
> >>  		const char *vbt_firmware;
> >>  		u32 lvds_channel_mode;
> >> +		int fastboot;
> >>  	} params;
> >>  #endif
> >>  };
> >> diff --git a/drivers/gpu/drm/xe/xe_display.c
> >> b/drivers/gpu/drm/xe/xe_display.c index bb4938a84f47..8a80d85eb104
> >> 100644
> >> --- a/drivers/gpu/drm/xe/xe_display.c
> >> +++ b/drivers/gpu/drm/xe/xe_display.c
> >> @@ -123,6 +123,7 @@ int xe_display_create(struct xe_device *xe)
> >>  	xe->params.enable_psr2_sel_fetch =3D -1;
> >>  	xe->params.enable_sagv =3D true;
> >>  	xe->params.panel_use_ssc =3D -1;
> >> +	xe->params.fastboot =3D -1;
> >>
> >>  	err =3D drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
> >>  	if (err)
> >> --
> >> 2.25.1
> >
>=20
> --
> Jani Nikula, Intel
