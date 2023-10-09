Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA11E95A8E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 08:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E997B10E236;
	Mon,  9 Oct 2023 08:59:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EC710E236
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 08:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696841980; x=1728377980;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iiBRvjOBirGBq9fGPc2ssvHWQrGRR9SWAifMF7j1NPc=;
 b=D0TrUGLmXsgyCMD8E5TiUWqodXmRFz0YlXM3+fIzkJD5TLIKT+kBQTAY
 Qrn4AVjcQIRAI+px1IniBVpzyZt7BEokGdbXrkMvyMS1bM3TTzzPxUJh7
 MfDTtvSNhTyE25ixi4gtfjpRu7bv/j2C8JhAe586/Ji15XTTG6b/0KGXV
 wRYU65mv553wwEHYzwO6fHhqLnlyGnuRGgB48s8uOhatNKsRfG6jLQfox
 IFPBEaJFupmPMN/4uYgolDSDEVFvBZq6nqn4kRIxwBgn13zw3WlVhdg+L
 +4qQKNVgR44wUg2mu1H90dpknUleByvMC5VuJz6TOPnorCFe0VSpa24SN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="470365101"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="470365101"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 01:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="1084263661"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="1084263661"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 01:58:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 01:58:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 01:58:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 01:58:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzQFYrGRZyvIHFK/MZtlL6CGLKJARU40ci/mxNkVYyFCuVLqVs46saNcl/NaBjDwXrkO3WaF6BsRgyrIH6GNaqowERHEk5IIOcDAy0XU7RnrYtSN30Jt3eqXLSwyKtsdufTgcQRbTgy7LCLZUd1sE4wk3GGWT+Gw3SRlW87dZZI8W6QgFDEku9rX7FYQNLcoPuEB5kilCPsJXWkLRiLk8AfvuWTSWIGeZu3a8Q5Xnh6E/aJzsdWNZf4GaEI7BLqdOkF9kdIpWezRCjyaIRDbS3cBBEew/d4B7JtFGCrY2P+DOr4S/gP60v1Nieq62BcYRwhIND45yPsSX/2vt1U0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Tuks1ddC4dvnJ8yLkEdU8xaddqfGZF6S7lmo1uzpII=;
 b=ewi8VlhPsTNoLQ4FewU32PTU5Dd+WpDcLACddXyB6MnIW/NnnMLyWsgWONpuu6kzlsRVGYCRULPUrj51SZ50sRmsmaTJl4EHKLv8tBVAiz0sCbuxfRl8aWafLu+XCFIrU33IQrEF6Gok2FK2TcCMc3uJxTK65GKdl4muhK5VI7F9MQoc7k8fj2c0sR0wLeaOZdZl02Rna7J6VhElCU9AWq/4+xYxXl5KDZz1GwM66tJJvNYSLlfzGeX1IBOrcVsh06IS3nL0yJITPlMsU9s5izXuxH6R9A4acHgPe3g1rvx321HL22KLFaOyvcaBPiV4GgvuyEkbVlRuRY+dlyGU5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CH0PR11MB5508.namprd11.prod.outlook.com (2603:10b6:610:d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 08:58:53 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::88b:6fa5:dca0:2419]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::88b:6fa5:dca0:2419%7]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 08:58:53 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 1/3] fixup! FIXME: drm/i915: xe doesn't have gsc hdcp
 interface or something
Thread-Index: AQHZ7UEmh/3FmKDHzEiT3Nm0JPlzUbBBQX4AgAAAgFA=
Date: Mon, 9 Oct 2023 08:58:53 +0000
Message-ID: <SN7PR11MB6750E95D5FB25D3E0490867DE3CEA@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230922082909.334085-2-suraj.kandpal@intel.com>
 <20230922103759.346871-1-suraj.kandpal@intel.com>
 <DM4PR11MB6360DB0FA9CEECBCD3FDC8F2F4CEA@DM4PR11MB6360.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6360DB0FA9CEECBCD3FDC8F2F4CEA@DM4PR11MB6360.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CH0PR11MB5508:EE_
x-ms-office365-filtering-correlation-id: 026047b0-7e29-4b6c-fd34-08dbc8a5f67f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q5/smcHJPBNYJLOE+vgNwEr/mO7727uVCBjU+uykmSaMIsYbQ1qOJujIMy8sBRO00VrLU/0ntysQS6mwPxqv8JGC6UHg+zPG6h5GBdA/hJPg43WYjb7VF/GSSKSJvGYOmWQAav0+PtW0LQatD5joagUACM0DTzGqsPmR6F6xQSbOwvKFcFxWqJa2S9ha+nF4+XwWvPQR+e4XkTeituJCGmFUTIP0bg1RblpghuMI3eq62cxaB65NW+gVnlBjA9XQY2axMFsnj47m6+kOL8FyYE4QP7EPFf8XAZUMxfL2Lx7mflhRkNZTBgjQoZ7tHdRTbIT85RXoF6HixqKdcqRN8n1N2q5Mns756fGxEf3PAyVg44bXhspfn9E7wQQKkLC964mAnHJUvYs7Rc+pCeCx8egum5Msw2/AnSHTiIDShkFX3380UFzLIQy72cuL4fxjX8nNaz3OL96RuzH+voWZLQACnAC0pUPIBOVlk7AV4aKLsbP10YfLj782RDXaeki8QU+76PFjKGR7IZdkUv1nL1jMPUN7gIq2euc4Kglr1x3h5f8UeUAMY8dVAinq72wdOGO40YCfd6EaHP3AUJl1EGyVELS7V1wIq08JBeeXY5XS6fVaG7mINE9qolxceVts
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(136003)(366004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(53546011)(26005)(71200400001)(478600001)(6506007)(7696005)(8676002)(83380400001)(8936002)(2906002)(66446008)(66556008)(76116006)(110136005)(66476007)(66946007)(64756008)(41300700001)(52536014)(316002)(5660300002)(55016003)(82960400001)(122000001)(38100700002)(38070700005)(86362001)(33656002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DFNJHJXkQYsnnn8FvT2YevRRys8uVUCSD7kWvYCIdTpQYQCERgl0RlQ0xPbF?=
 =?us-ascii?Q?WBv6YUDg2jefSRE+HDV4B8y/lVZyd9CjbCyJChJmh3NSHXs0mCS891OpH6w8?=
 =?us-ascii?Q?zs2/FsdQMQCMBlcRai0SOK2CGEW5M88mJOqB93nLCBGeDng5qV2LfqMXh7Sp?=
 =?us-ascii?Q?xOXqsd+A9lhq4C4nznH8s9mBBpX5QELouJNs/lLz7WQ1EP0q7NhUjrFAUpS5?=
 =?us-ascii?Q?21xO3InfKwlIFVEaWzuAyh39jC/Fa8fcGzc0BzjteYMPJCZByG4ZpnPgoM+F?=
 =?us-ascii?Q?1A+zIqXVX1WbXIEw/ODeesgpZZ0S91nYozw9G36LB70rjqSvF+e/HUxIX3Lp?=
 =?us-ascii?Q?FrGZa6tZgRrbfKR4/kC4Cx9EFMjp1kQ3duDwzPICzWjv7cRJ6X2mBgvZoV3f?=
 =?us-ascii?Q?kPaPZuq9mFaL3waAmxZYDvF/XMyAwrSWHxskv2K6U2aj2r9Nx91SgTqQQHFB?=
 =?us-ascii?Q?1OU25aWQd0p2kFDERpPWgf35WdNffmPEtcC0AhKkWhBRCTfg4be5yDX2fqgd?=
 =?us-ascii?Q?fOoxT2hVD1gPPo+7DOmTORJQoXPdFKWIHIUyn6KkAxNjDRwmhTXZnA551QO7?=
 =?us-ascii?Q?UXPeCJhXjU2lkOF5Wh3A3B7kY5FUghqfciNBgvZjIOyioxnSKkujRUkdEj2j?=
 =?us-ascii?Q?ZajTje0R9tqaOcEBt+k9aPEVpRVGuv43UdT9J0ACHdeoXkrRLN5HlvKrC6FP?=
 =?us-ascii?Q?6z8/FPpIo8NfsuKDB8djiUp62y/n909yzQtDRcSJecvArQgWPz4PH44GkbUR?=
 =?us-ascii?Q?e3eOHjLabaSQdDSjB7GsgPPAXfeL36eWic9e9IcYSu0INFnLKDmLpQhF5kd3?=
 =?us-ascii?Q?RgdokNpygFucBHBk0/3THi+1h/ihBJhhgba8qjUj53mUCHNmknycCT2j45WK?=
 =?us-ascii?Q?cpk+/jUBzb/R7xny4QGJdta1Wdy5xFqNwfkt6MhD4X77btI215GBdxgYmtry?=
 =?us-ascii?Q?+w3v7MlYmcSiZYrrpPuxJu6RzQNMHCblzX0VdVAorR0shQJZe5b0ad8diUGK?=
 =?us-ascii?Q?ZdMdne5RWOvJxrxAs8Q/TyEzkDn9WxmuvFO59HqmknW++JjPNllQiM42xirI?=
 =?us-ascii?Q?NTd+X6RRvKh9IuHZcPaEKaurvs7Tz2qIXXWSzNZhnJqy3Wyd2Hh7+A+UNDDw?=
 =?us-ascii?Q?QPq0HHS8gPsCIxUwW/+NXIjQ8hclEHlPVZur1J0cX4IJLG2ysxTTt6BsqMRz?=
 =?us-ascii?Q?IX3ajvbl8HQ2v3TCSwWanNeXIneR1ozRjQct2bC8yFPbt1Mb5fQsRC7kScrX?=
 =?us-ascii?Q?fhhqXHiQbK9Df0MvgCS98iB6DQ8YylN3a+bRIjAYriZc0b0LejwVVBuDRFMW?=
 =?us-ascii?Q?4V5+z/g+DbUjQUIujJpxdnU7IO/9cLmDgMlncxLOfE0wXB8PncGeDQW8ucoL?=
 =?us-ascii?Q?QZo3qd9y133zS2XOJIHwzh575B36HomIoKXzJzhbEynQ/vH5qK4Pb/7NLga7?=
 =?us-ascii?Q?c4OEKH5jh5CKiBY9u6j597gJRs/K7RDwYoPyIowv3gXLpGGlFf2CTpoGjxSn?=
 =?us-ascii?Q?33fVGNfCE0jPwR/GJ1BzngVvjjNOxr3TAaojbzuJixC7tlFUq9GNbfv5bI6O?=
 =?us-ascii?Q?VD6CM87e50OK259AqHmw20J2mFxu38+5qErHl3/9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 026047b0-7e29-4b6c-fd34-08dbc8a5f67f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 08:58:53.3570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mpBym1CUPv/hGIOER5cHwrXNFjPafj3WwJQqR82KUfA4cmjmCTCu6yqzE0RcDDdgfx5xMVFRkIT8MLbWvaWbyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5508
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] fixup! FIXME: drm/i915: xe doesn't have
 gsc hdcp interface or something
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
> From: Shankar, Uma <uma.shankar@intel.com>
> Sent: Monday, October 9, 2023 2:23 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org
> Subject: RE: [PATCH 1/3] fixup! FIXME: drm/i915: xe doesn't have gsc hdcp
> interface or something
>=20
>=20
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: Friday, September 22, 2023 4:08 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Shankar, Uma <uma.shankar@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>
> > Subject: [PATCH 1/3] fixup! FIXME: drm/i915: xe doesn't have gsc hdcp
> > interface or something
> >
> > Remove stubs to clean up HDCP code
>=20
> You can mention which patch is being fixed here (one which introduced the
> change).
> This can later be squashed together.

So the fixup patch mentions which patch is being fixed=20
FIXME: drm/i915: xe doesn't have gsc hdcp interface or something (subject t=
he commit being fixed)

Regards,
Suraj Kandpal

>=20
> > --v3
> > -Should be a fixup patch [Jani]
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_hdcp.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index f617ccd206c8..a42549fa9691 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -174,7 +174,6 @@ bool intel_hdcp2_capable(struct intel_connector
> > *connector)
> >
> >  	/* If MTL+ make sure gsc is loaded and proxy is setup */
> >  	if (intel_hdcp_gsc_cs_required(i915)) { -#ifdef I915
> >  		struct intel_gt *gt =3D i915->media_gt;
> >  		struct intel_gsc_uc *gsc =3D gt ? &gt->uc.gsc : NULL;
> >
> > @@ -183,10 +182,6 @@ bool intel_hdcp2_capable(struct intel_connector
> > *connector)
> >  				    "GSC components required for HDCP2.2 are
> not ready\n");
> >  			return false;
> >  		}
> > -#else
> > -		/* TODO */
> > -		return false;
> > -#endif
> >  	}
> >
> >  	/* MEI/GSC interface is solid depending on which is used */
> > --
> > 2.25.1

