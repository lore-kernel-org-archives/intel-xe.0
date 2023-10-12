Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B180CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 03:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9258B10E3E3;
	Thu, 12 Oct 2023 03:41:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C90510E3E3
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 03:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697082093; x=1728618093;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O0LTljR+c/WjTHZRqoJcshzw5smjCowxJGT9V0GtcAA=;
 b=OR90z5kGfKqq0I4lFh1ETQ0NHOgsqNZWJdkVw2dEDLvA1hPSly5vYbgR
 eBZE1L2ctP+NcHvz7tNqCotC7HbN3NKt+9fdSq/4PYHP0KocKjoFdE5/Y
 l87usNtaRMD3q5ixD0bNQywUQSbM4XmD+9ddzDPP5WPivwhL2ctGiMT1U
 DkZ5gcb10Y/kKCGr++CkFgedX5Y97JqVxUUB7LcGNOia9cLKnQIxmPABN
 5cizGBbKp3T6IEHi34XXGxUM7TCq/eJE2YqPh/cD64YavdoJF8qoHfuDV
 oQbX9vPFBMfQchNRpLbexesoTpEOIJSun9aSRoqBb6AYHXM1hpwtpfvit g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="3408965"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="3408965"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 20:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897919138"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="897919138"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 20:39:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 20:41:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 20:41:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 20:41:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbFF5iB3mtNNQ9cKL4U9MmZpugaho/mWitBsbnp8VdEcsduhEh7jZafITfO5yjYSzcxQ+wzrZztpQFpSdYnHVmePKxBS/VmM/lIaKT6oYdGvneo8V//HMqx+L163b87NhRBfZFuHQwe3DxRREeq0x6r9cwYd2uQYgwMKrsVjD2HDApIsQNqOsS5rW+U7xpsaj9CRAk+JL04fMgBR0q4lMeQn1X/SmfsCdAanZvTbZG4RpdsRFkGtueT9LbW04j1dK/dWFvunPmrfjkmvIRoS53HLqz/6j+8wv5ft3e2u6QSq5Pa8t/3ef8w5WM2GyM+W3kHTfdGE20ISyvIDl/Kg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCnh7f4JywRlaPqSG9krL6qfiV6aC7WIrNvm9ZOpeFo=;
 b=MMkfxv+A07ksl5ik76tbUdcCCXRZc7MafJ1PaLsaKD+Q10Wl4mfJDBRYtOgIaRzUA+nbCaRtBgXWizE2cl5i8hgYW/lrMjOEmzTVPAHPs1kgc3TUBdem9lHmSjYyBsxzIPk/i+Kte6mrhHFzJF86YnYeeoN3fIi/OL6XD8JpvuLUzA5XQm0nIAzB6MWyUd5fkhDQCKoihziRGdg6O/z34aoHPw5Oyy6uOun7e/RdUa/sPuqV8XLEDSkT4WFk/vNys0AG6y0NeNF3RGwtp+aAmEYSAwgtD/KuaBdBFizLcOaH8zR+IEe2pA9zAzHEx3PmvxLKTADXrKjrjLlnPXGMlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 BL3PR11MB6507.namprd11.prod.outlook.com (2603:10b6:208:38e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.44; Thu, 12 Oct 2023 03:41:29 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 03:41:29 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH] Revert "FIXME: drm/i915/ips: apparently silence warnings"
Thread-Index: AQHZ+3SkTVinKgjDkUu9ipb7QQhscLBESfJAgAE6gEA=
Date: Thu, 12 Oct 2023 03:41:28 +0000
Message-ID: <DM4PR11MB636079F7D5729DAF1A77C7D6F4D3A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20231010121905.1769182-1-chaitanya.kumar.borah@intel.com>
 <DM4PR11MB6360AB7E57A81CF3AE7D98B3F4CCA@DM4PR11MB6360.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6360AB7E57A81CF3AE7D98B3F4CCA@DM4PR11MB6360.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|BL3PR11MB6507:EE_
x-ms-office365-filtering-correlation-id: f5a02ac7-79f4-44e5-3bb3-08dbcad51e70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WVTT57ISNgSGc8jayAKTVAd8K+LC/IE9MSONHq0Yskn8/pOcAtp72iwzNKAcHVq93tjoV9WlDmL1iFmaPcqn0+u/OGvoX9WKXqT7MVWhyOnCIDDHMuUX3rJo0ivUNlkl/AJNotyVtFQbfYBrFdkAdsDQF2k3RJ/X1dSu/A7n9PVcJ8pwqlBm4T5qo1otUXHiTA/XqVU9KM49WZQ0EJtnYN6wnXMA/PONwlAxhdVwBfGEouEaLINu202uROHGeEeZb2pm3AxT25b/zvsFMlQWdiA/RwrrUFJ5uDVr/2Q6ZV+Glly3buHs0+4U9cDmI3+6WcVtdPIV0LERrC/3Xsn664B8dAXjVsndSQSibzuT7KKICQrkVb0GgjGaZ5U811N5eZRZ0VBI/rT/L2c6wFlY2CzrtnyqPRFD41W/qzseTTyU5NITC0t3KUGY9YdpLViYnszeNX+ibJgD7+wyhYBSDQENFeEv0QR5upm+MuEygTnekuUtTtGaVBjgdCPmGrVam0VSfu55tmBO2jZuFi1fLUixSDZtfRWvNCBfpNTRMFxkSSIBKhlr2gF+TepHyZrCEiYwaNvvGleDhWziaXneMDfmMUoDx+2qDNxXsKP9ZvyTMkEpXDLlSUTtzr/VlNh6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(478600001)(55016003)(71200400001)(8936002)(66556008)(66446008)(66476007)(64756008)(316002)(110136005)(76116006)(66946007)(86362001)(122000001)(82960400001)(38070700005)(2906002)(8676002)(38100700002)(5660300002)(41300700001)(4326008)(52536014)(33656002)(26005)(9686003)(83380400001)(6506007)(7696005)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bXcJmJVjzZ9vlKdcv0SKUyf1UfXVWjetkOsYpqNdyBmsTjZzkXXZO75IUdWl?=
 =?us-ascii?Q?DTn2o9A991qVgr9Pa8fPjIDwQQGVnL/GR0m4JuqvleOiXXeDBRxENul/qV+y?=
 =?us-ascii?Q?8Bfk9f2XkuyIjLXklroCQOd0wJifA6COQrsVaTYtQ2d7RZYQRIgwTxlrikSJ?=
 =?us-ascii?Q?SiHCxMKyO+VF0I5CLNM9MiEFS+GKWKsdWXOyJ5VOiH+glBrZfBZmR41ugvJT?=
 =?us-ascii?Q?Pw68isvrrFI3xBA+u805Hjk4cr13y82b1iFYhrK8aXWUjyVy+YqX17+KP+1z?=
 =?us-ascii?Q?yRZrJurrbwp9FrHUpDjdZoSyKTW8bIsQLYVVISH2ym6KBPHWcuSXlzSPDSYQ?=
 =?us-ascii?Q?d03eG7w6/7hmUj6o4oT29Ve/YcVa31i8Fo36a5Ofn1C4lpgWl49eKAPXK7dl?=
 =?us-ascii?Q?ifh6RDpllBDiXlikr1gulk5Yw0MWchHVKnH4StsPjVfXF9QKnGjbw0ODhOcy?=
 =?us-ascii?Q?LKnL1u+7hrVypqDvnwuTiRuD+NVEx0KN1/hbT3jIBGiVjVgazGpCl2UAqoCr?=
 =?us-ascii?Q?FbA59rfxdW00/ugTEomqo6UBOjXnEPooHlSvpTpeI0kufSBHD5EsUXD2xus5?=
 =?us-ascii?Q?oGjFttWf8Fh0hf6DWzdrPD4I3nDP3+cPQGs2rmhqLoZ92TZyxOMLO3CN1sZp?=
 =?us-ascii?Q?o5YliOV/IjxsJ++tCummMry7Zx1+exDYz0i7HQ3UtoCts6aNfaxFTyN7VBV5?=
 =?us-ascii?Q?guj0jBn391AYVTb9Df5iN/KUplRB80yrAku0djmpSud2U+XQCIPbqL00u9FC?=
 =?us-ascii?Q?GeU+PLTf2McqcxgzInutzSyoRqrgkk9U7uRluqHejokaSVxUkBP4lQojI7Nv?=
 =?us-ascii?Q?9+hmc0WAGPGsoqhk5yM/n0jD4u/jBUpWCneq+T7dic5j18Lmkj62XHTOuRSD?=
 =?us-ascii?Q?MMFmV5JAqhLFb2nQOMGohMn1c//PBByxAEDvibHOpHLMheFwh+UrM7JKyq3J?=
 =?us-ascii?Q?1XlUIQuIRDrpOX4pbJR+TjMnMmY5nbOg4QEK4yX8s6hI9jwYA/VGJsBHC8FM?=
 =?us-ascii?Q?CFCms71bqgjEMOfBRbmlTps3mY63T5O8zkloNnzUwqmCbDsfeuzlUKTgVEJL?=
 =?us-ascii?Q?URd/rMuWzvh6hYqMW7Hs4K+X28VNsH8PDolSpCvqJGodUT68T/iRc3hgXD0B?=
 =?us-ascii?Q?2Vl3HsQZnxXxzMMzsrcDbQKlh7LQKL8Z0M2bxYsHBBfSjmVERmb/+eNdcB5E?=
 =?us-ascii?Q?RKvya/pQQLmuCRTPqrJOIPuZdfb5OkRrcNbSnGwBdlDBhwlHeDP2uLY3BbCM?=
 =?us-ascii?Q?u4qBoCJJcrWRiLM7B57A4Z9bnK2X7P21Dq4AqbHlRroB0UevNv8xmeMvJt0H?=
 =?us-ascii?Q?jdKtmoMGKTwvIuf5yV0htPsiIeAiHoxYcCu2d1wNTiv1fm0NC3s3yzDRuCOo?=
 =?us-ascii?Q?jr13x0UZ4C4Vfiohz8r4KQtlLT/u+C9bQdMHWBVoaOqDRnCnQCKLH3GZTNLv?=
 =?us-ascii?Q?pYTCZxxSLbTjKbrf+5P2SgWNZug4rc+fr8nsaC/zI483yo8IzH6f9HFRJETK?=
 =?us-ascii?Q?TfLzAE/oCrRIpA59mVYh9yM6Yr0PwdQ2jlz+w4WTrRjO7VtoAp0enEgiyaX7?=
 =?us-ascii?Q?jntvrSbv0d2cK6Jo79PNEnl+0b1aaOoByO4yyue2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a02ac7-79f4-44e5-3bb3-08dbcad51e70
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 03:41:29.0207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+qtY9P21nqUX/lcniTkEfyZFj6O9scHo2cvHAvcyg9v+C1UqDPIpYYOHiziHmBodNJYEuU0O1W0VR1Ru3/iEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6507
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] Revert "FIXME: drm/i915/ips: apparently
 silence warnings"
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



> > -----Original Message-----
> > From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> > Sent: Tuesday, October 10, 2023 5:49 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Shankar, Uma <uma.shankar@intel.com>; jani.nikula@linux.intel.com;
> > Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> > Subject: [PATCH] Revert "FIXME: drm/i915/ips: apparently silence warnin=
gs"
> >
> > This reverts commit efdb834bbd7c6cd80e018dd0c0935070f2f27169.
>=20
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Pushed to drm-xe-next. Thanks for the patch.

Regards,
Uma Shankar

> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index b28b4b718a2b..4b73db93d23d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -4199,8 +4199,8 @@ static u16 hsw_linetime_wm(const struct
> > intel_crtc_state *crtc_state)
> >  	return min(linetime_wm, 0x1ff);
> >  }
> >
> > -static inline u16 hsw_ips_linetime_wm(const struct intel_crtc_state
> *crtc_state,
> > -				      const struct intel_cdclk_state *cdclk_state)
> > +static u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crtc_sta=
te,
> > +			       const struct intel_cdclk_state *cdclk_state)
> >  {
> >  	const struct drm_display_mode *pipe_mode =3D
> >  		&crtc_state->hw.pipe_mode;
> > @@ -4243,7 +4243,7 @@ static int hsw_compute_linetime_wm(struct
> > intel_atomic_state *state,
> >  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> >  	struct intel_crtc_state *crtc_state =3D
> >  		intel_atomic_get_new_crtc_state(state, crtc);
> > -	__maybe_unused const struct intel_cdclk_state *cdclk_state;
> > +	const struct intel_cdclk_state *cdclk_state;
> >
> >  	if (DISPLAY_VER(dev_priv) >=3D 9)
> >  		crtc_state->linetime =3D skl_linetime_wm(crtc_state);
> > --
> > 2.25.1

