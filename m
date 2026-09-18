Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547B4C982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 03:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E394510F149;
	Fri, 18 Sep 2026 03:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1wR1tyX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB5F10F147;
 Fri, 18 Sep 2026 03:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789700573; x=1821236573;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MWZyk4I8siHcwAUxGGK33Apn/W3eLhPtAA4+uZWpxwI=;
 b=a1wR1tyX6+i8Khp4Y7vMhED314oxLqTUazE6HiVqc7QeE3NQtuSl02VM
 FCSjZrlhSylgd6FUwvmSjB8ro2LB9GtfzUG3Yh9TQK17EXaSJN/igs19B
 87X0OFtMtBNgdI8PqYnYUUH9rZrH7TBIyT7k9sRiKTjBQJYIx3/y/1tV5
 8JeBzevq3ZPk81lOXrhIM6sGCrDUnwsBTCTuaeGKy+6fhnI0SdjcFUvuv
 FxYGOfLH2uOwrXvOOWCbBNeFSjj/vAml+uWEMtVDjM1yhCivtMg1pp4NT
 TXEUPVwLU01yaRa5MwNbB1huepON4lxl2O9ggJGURCRgB6kXdtPUg3OFH A==;
X-CSE-ConnectionGUID: MVaIKkS0SOupoxuBb925Uw==
X-CSE-MsgGUID: lMhRlM52QYi48Yt3oIouVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90197576"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90197576"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:02:52 -0700
X-CSE-ConnectionGUID: 7VITmxtSSciBjqk4k/1VKw==
X-CSE-MsgGUID: vKGPKT5TQTSJGWQIWGXmBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="299256301"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:02:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:02:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 20:02:51 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:02:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYX28xg2G5im2Bxp+RC1RZMy25mVMFf5pGkxpSXDQX2G/l5XqVhG0tdAGfuM5O0jXb84JA4XjTcbeSoxi380C5w2hXtkIox4ENT7pNRjQg+c4Vb75Ja2rEueteRCtxrHk+KpqlPqWDdPmJTZ/534egiwMgER7YK8qyjhKmFPnvWX3Bvq+TkWpElfnE9NohnEdmCdTYNkdl7iDUDpK+fdwkF2BEehRhzsgYXtUCVsrG4dpYxpcBkEb8Ey0Vbh/xIIWFTu235K12/W4SDvev70G8ygpUBBOArwSwQpuY8d8MNl0kkPN+ZUP9rsbw4tsc89pk7MNP2mcUKtWRr8S9yo2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvZ8RmHx7eFzmkXtwMm9ca+Lai2BydAjsHRbD1YCfls=;
 b=kO6LWcX6YefTQyLlujW9n+452ot1LDOi2Bl2VYflXbeqqBho8Fi0roZDW15v3kZxbAT/98dC2wnA3TY/1fB6d++x5GaSzUt2jhlPMowUiHRZsr5WLKP79cDR97cyMxJUeYi09ImmGfuKh7Xt8uB8+F76zvtWKmFeYPTGLjXbgq0RCp2+FGRQofgu5y87Qm1i9hT4W2FnZ1JK7CfQpiguq5kRkfrVuIlf0oD1i5r/MwuNPNaN+nrl0ATWPQlMPCKy5WkReCncvn/Vgzo+PwTlbJAN7tl+U8k/Xj6Rf0JYW8W+o8+dQ6BZoGTQo7PGMpWWBBtCxVTpN2M/r4gcbIy2Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFE26A71A1E.namprd11.prod.outlook.com
 (2603:10b6:518:1::d58) by CY5PR11MB6140.namprd11.prod.outlook.com
 (2603:10b6:930:28::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Fri, 18 Sep
 2026 03:02:44 +0000
Received: from PH3PPFE26A71A1E.namprd11.prod.outlook.com
 ([fe80::713f:b691:3881:b27b]) by PH3PPFE26A71A1E.namprd11.prod.outlook.com
 ([fe80::713f:b691:3881:b27b%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 03:02:43 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 02/11] drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte, 
 write_byte, write_data}
Thread-Topic: [PATCH 02/11] drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte, 
 write_byte, write_data}
Thread-Index: AQHdRbWY3IqJU/lq5UWx1SoYrg57p7bQ7DuQgAHBaoCAAPrFUA==
Date: Fri, 18 Sep 2026 03:02:43 +0000
Message-ID: <PH3PPFE26A71A1ED50D0313D30401061E81E3872@PH3PPFE26A71A1E.namprd11.prod.outlook.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <a890746215c6c7a1e36a6bc880ae644dd06f1956.1789547331.git.jani.nikula@intel.com>
 <DS4PPFE901A304F3439245166797C8A3327E3B92@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <e732c3adab756452aeaa5107489e91d0a9c10d7c@intel.com>
In-Reply-To: <e732c3adab756452aeaa5107489e91d0a9c10d7c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE26A71A1E:EE_|CY5PR11MB6140:EE_
x-ms-office365-filtering-correlation-id: ad1045fd-a485-4cbf-78f5-08df15314f44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|18002099003|22082099003|10067099003|38070700021;
x-microsoft-antispam-message-info: c+31ujYPInsfDjQSve595MqnY9LmwiQ6dMSCMLqyv7sWNtQyIjx9PSexGgmqJoKbeN7W9TIo6GJQefkYBnJZ6CpuO9hg7nzJ5Myef3KRzuFQi7v600rdv2PuXap8ScVrd2OPBln7IJ+NnFamxJl9noqJgJfH51oatJ+/P61kgRgZELONFEUZbKWI1Y9XIURmPeMXJUogW2hSI5vd4TBuWqYiUcfFoCu2ryTwjleHXIsYWTixi0X1nPgr3aMQYw27oK1mKgHErx1y4Oe6Tznl4thsXAI3no5/WvAU7QB/cRssO18jN4fj49jR4W4Fu/yeCUzlBfkRPeR8Kj6/AXpeEIJIAc8HgvZT44nNJlFBstyZ4uLhCnkhIQeyVNxU1WEtpDyNGkt7ZWx8FCN4iM18hcRIVZkR/k54MZYdn2gzvWP8Myaa7Fb3TInK5OAhixun9NP/Kq+SNeEyrvIocs0185cLvvej4vOoAQVdM0WUcYXhz+D3n1HnzHaDYzumZ+f1jRYVIGrmO21nRk4HvhIDFtBqMW7d5O52XmxIN+L3f0VDiQ0IeiagRyZ4I3kRJz/dKbtQIeM1d0Qn5bMpdc/ZdVt6pCmejckwEg0O8AjZ2wHwHmjf2kI1Osr1d/RgUHYQ2Su4S0H3e/IhLlYc6cfzCcJwuJIyF13bivYdS4K7WS6mnNtFpBqqQa1aJasggAEAPh99sKbpbzYV3KwSpemzTkcj3WxUOsl/TvGD5ZiDl5w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPFE26A71A1E.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PQHBfv0sHGk5uRGarsBtHFduxpD9UG3+ZoJfI/QQaCBrNpL9zFdCUoIbDqGE?=
 =?us-ascii?Q?CY4cUn2Hf7kcleJQ7b1EguK21vujSCTqTrSDW0eFxpy2pCwrqyASVnVDWqxu?=
 =?us-ascii?Q?vhAPFUY1E1gkj5JoKKzIaEyWoTuAhziaKXO5MGyM+O9Ta+SBGuxsNCjBazLV?=
 =?us-ascii?Q?cxUFYtcK3z5uhKOxUBf7rjGhIe45Psce40H0hJ20JxISaVwBuUvVWFizFPdE?=
 =?us-ascii?Q?cKcXALrgemfW2boINszOrrMrnMPChMdk//+TNqQNf7/x2vXbsV8dwMwKlGlj?=
 =?us-ascii?Q?liOMk/Ho0GXW1DJhq8qwmLs7oQWl5z5FpVAIzNBrFRKsiHfVpWHbjrzdnKSY?=
 =?us-ascii?Q?tCXlhFsx1YesWX33D0cd3Hqe/HWRMcLP4M/7/RCOiwiMPfkN4uMEeLwTg1GD?=
 =?us-ascii?Q?nvxQYDQnbO6pgrX6BFu5dxV5nB0x/sqPsgRgRR68P9rKdpF5yhEf29n2iudO?=
 =?us-ascii?Q?Nh7dO9aUlN4Ri/9jIZagjttKRUInKl7bonDSK9P//2lebfKIbTRbmZO/RHwc?=
 =?us-ascii?Q?y6x9s40y0Qr+D7dTJdezcMISnhj8jNZXObz9GJjWoT4L/or1/EbPVAXJ0ry9?=
 =?us-ascii?Q?Y2iFbF/PP0YViPdBlWhPWUUu0Gs/doVP/j8MvjaXZIMNL7TGngyZFAvLfnP/?=
 =?us-ascii?Q?mpYbroTEtYEuOnvoctW9tGMZ3XZwltVf6iKO7cfLfA76hRucHF8WWtrWvVt7?=
 =?us-ascii?Q?JcD+uGbe3F9/DWL+b5l0OYOCIsff6AJ0BLdgKpEvrCMF3ra6FMqZmsI8qCJ+?=
 =?us-ascii?Q?1kO49P18mquNdSRb5lnuFAWLHV+c5bFj4X8Yh+l5UBe2etJW3/hX1GIwAudp?=
 =?us-ascii?Q?r3TX28qzlSzf4MVOhUqFgrUWJES582EbjD0lpXkhrDYfkjz0VG9/3rDJSHF7?=
 =?us-ascii?Q?yAO/E7JzgEt+J0QsYhsGA0DKq8KN2vxgS891x19ORC/y8JZ6STJzftMcozWH?=
 =?us-ascii?Q?uW68PejWM1ABWt2BTaJWZkJzZKYm+4WfUqCmkLgxpidtJWHwZr1kpOI8Kngo?=
 =?us-ascii?Q?SzY4KMu4TdkYQBa531XOFUYGAsP+i42bk79P7ILBft4xTbMpaPFrdd5gyxWj?=
 =?us-ascii?Q?Sd2tozq5vNWu61nLcWWWPj6ypLUSc6NSPs1GcE5DINWpYuBaNdnz/pJD05A8?=
 =?us-ascii?Q?eG/s08hA503nbjHFQrf/yilHjuCUxjdy4A6UEFS9ibCrgJJhKWEoTdFVvR/C?=
 =?us-ascii?Q?9Dd2XDdIsVhkKIXEIcR0zJU1M8zpz6HOPIosCI4bLukP/uvSvE1usGcSDOlf?=
 =?us-ascii?Q?rdCdEpc0lRGLL1BPxpLXZGIn83LlqV0OsWVRATKVGlKZ3vLYn3Huamy59foB?=
 =?us-ascii?Q?s0whiKpCUZjvRQddMPsxxLpRZyO6qGUFcOG2zGLWUMWGRj10AjRgpR28/Fl6?=
 =?us-ascii?Q?jWQZ7XIjly2JPZyDf+C0uqE8PrYrFTIacwQ4OUMstGDPWC1PZ9RZtJoRQQAz?=
 =?us-ascii?Q?TTL9c+hggI1wz7lyS25idZTbycNbFxHmUcpvApwQUTsZGTmUyqg3542ebu5P?=
 =?us-ascii?Q?DItyXkplJ18umtQzNGzLuguHYBgu9UEHMYnCqynO5rfIMOliqaRgUiycl1uc?=
 =?us-ascii?Q?mUsyb/iiagutLhrlty6/xWhZ5g/jvxyxkvvShc2Uf2fSVhK2XCdD6JpSMpPD?=
 =?us-ascii?Q?zH/xK0RNv8dyclAcbxw7yJY/qqfZdngFKiDK9WrUGmQmIobUAeXzuyryCzPf?=
 =?us-ascii?Q?hcEgxlKJOcLyyoSPWmcc7RsV64+AfqE5QCT/jYak5MT4zjZBazkawxFrguGG?=
 =?us-ascii?Q?pOlP/89/uw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 3SuM8EyNbpsCzqURG+3RGkcX1mOGpynXmhQsnhGalc5ZPsOABFwWu7441FbMVduUaA38IOAfJZC7EFjwg6FfzDgEw5RF5W2kyUdesmPLypdFswlq2bJnZgq4CUghUI/OGyNIgFZQGvriDL9Z2abNKzXiANtl1FbI5sxRM3H98Wae8Qe1dvK8D0MK4I/2qi0a9Yiog0IrPbuJcMOLjjeG9e9xl6X7EEPSt9QpghhDeDLr1SA9Uoj42FVDcSxx39mAjGG3bf6pi4x7LXWpmf4smydXLyTdR2VpK2vch+gfGoQb0hV9c2II0zdMU5fFq2oW1GJZHNrJf3cVCWqXZ6CU4g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE26A71A1E.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1045fd-a485-4cbf-78f5-08df15314f44
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 03:02:43.6906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8AlWTqy35z1T1QIrAGJ4khZl47zok6SN1iRVXcc3gwVfWl4sUHz1Jb0CWFshhiNG4gRI9ZN10YsBOzXRkv/fZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6140
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

> >>  		lspcon->hdr_supported =3D false;
> >> @@ -244,10 +242,11 @@ static bool lspcon_wake_native_aux_ch(struct
> >> intel_lspcon *lspcon)  {
> >>  	struct intel_dp *intel_dp =3D lspcon_to_intel_dp(lspcon);
> >>  	struct intel_display *display =3D to_intel_display(intel_dp);
> >> +	int ret;
> >>  	u8 rev;
> >>
> >> -	if (drm_dp_dpcd_readb(&lspcon_to_intel_dp(lspcon)->aux,
> >> DP_DPCD_REV,
> >> -			      &rev) !=3D 1) {
> >> +	ret =3D drm_dp_dpcd_read_byte(&lspcon_to_intel_dp(lspcon)->aux,
> >> DP_DPCD_REV, &rev);
> >> +	if (ret < 0) {
> >>  		drm_dbg_kms(display->drm, "Native AUX CH down\n");
> >
> > I was wondering now that we have ret should we add it in the debug
> > message using ERR_PTR() Same for all the changes done below ?
>=20
> Feels like the changes are pretty heavy already, maybe that should be ano=
ther
> series on top.

True ill try to send a patch series on top of this cover these debug messag=
e prints once this is merged then

With that this
LGTM
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> BR,
> Jani.
>=20
> >
> > Regards,
> > Suraj Kandpal
> >
> >>  		return false;
> >>  	}
> >> @@ -331,15 +330,14 @@ static bool lspcon_parade_fw_ready(struct
> >> drm_dp_aux *aux)  {
> >>  	u8 avi_if_ctrl;
> >>  	u8 retry;
> >> -	ssize_t ret;
> >> +	int ret;
> >>
> >>  	/* Check if LSPCON FW is ready for data */
> >>  	for (retry =3D 0; retry < 5; retry++) {
> >>  		if (retry)
> >>  			usleep_range(200, 300);
> >>
> >> -		ret =3D drm_dp_dpcd_read(aux, LSPCON_PARADE_AVI_IF_CTRL,
> >> -				       &avi_if_ctrl, 1);
> >> +		ret =3D drm_dp_dpcd_read_byte(aux,
> >> LSPCON_PARADE_AVI_IF_CTRL,
> >> +&avi_if_ctrl);
> >>  		if (ret < 0) {
> >>  			drm_err(aux->drm_dev, "Failed to read AVI IF
> control\n");
> >>  			return false;
> >> @@ -371,7 +369,7 @@ static bool
> >> _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
> >>
> >>  		reg =3D LSPCON_PARADE_AVI_IF_WRITE_OFFSET;
> >>  		data =3D avi_buf + block_count * 8;
> >> -		ret =3D drm_dp_dpcd_write(aux, reg, data, 8);
> >> +		ret =3D drm_dp_dpcd_write_data(aux, reg, data, 8);
> >>  		if (ret < 0) {
> >>  			drm_err(aux->drm_dev, "Failed to write AVI IF block
> %d\n",
> >>  				block_count);
> >> @@ -386,7 +384,7 @@ static bool
> >> _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
> >>  		 */
> >>  		reg =3D LSPCON_PARADE_AVI_IF_CTRL;
> >>  		avi_if_ctrl =3D LSPCON_PARADE_AVI_IF_KICKOFF | block_count;
> >> -		ret =3D drm_dp_dpcd_write(aux, reg, &avi_if_ctrl, 1);
> >> +		ret =3D drm_dp_dpcd_write_byte(aux, reg, avi_if_ctrl);
> >>  		if (ret < 0) {
> >>  			drm_err(aux->drm_dev, "Failed to update (0x%x),
> block %d\n",
> >>  				reg, block_count);
> >> @@ -445,8 +443,8 @@ static bool
> >> _lspcon_write_avi_infoframe_mca(struct
> >> drm_dp_aux *aux,
> >>  	while (written < len) {
> >>  		/* DPCD write for AVI IF can fail on a slow FW day, so retry */
> >>  		for (retry =3D 0; retry < 5; retry++) {
> >> -			ret =3D drm_dp_dpcd_write(aux, reg, (void *)data, 1);
> >> -			if (ret =3D=3D 1) {
> >> +			ret =3D drm_dp_dpcd_write_byte(aux, reg, *data);
> >> +			if (!ret) {
> >>  				break;
> >>  			} else if (retry < 4) {
> >>  				mdelay(50);
> >> @@ -461,9 +459,8 @@ static bool
> >> _lspcon_write_avi_infoframe_mca(struct
> >> drm_dp_aux *aux,
> >>  		data++;
> >>  	}
> >>
> >> -	val =3D 0;
> >>  	reg =3D LSPCON_MCA_AVI_IF_CTRL;
> >> -	ret =3D drm_dp_dpcd_read(aux, reg, &val, 1);
> >> +	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
> >>  	if (ret < 0) {
> >>  		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> >>  		return false;
> >> @@ -473,14 +470,13 @@ static bool
> >> _lspcon_write_avi_infoframe_mca(struct
> >> drm_dp_aux *aux,
> >>  	val &=3D ~LSPCON_MCA_AVI_IF_HANDLED;
> >>  	val |=3D LSPCON_MCA_AVI_IF_KICKOFF;
> >>
> >> -	ret =3D drm_dp_dpcd_write(aux, reg, &val, 1);
> >> +	ret =3D drm_dp_dpcd_write_byte(aux, reg, val);
> >>  	if (ret < 0) {
> >>  		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> >>  		return false;
> >>  	}
> >>
> >> -	val =3D 0;
> >> -	ret =3D drm_dp_dpcd_read(aux, reg, &val, 1);
> >> +	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
> >>  	if (ret < 0) {
> >>  		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> >>  		return false;
> >> @@ -617,7 +613,7 @@ static bool
> >> _lspcon_read_avi_infoframe_enabled_mca(struct drm_dp_aux *aux)
> >>  	u16 reg =3D LSPCON_MCA_AVI_IF_CTRL;
> >>  	u8 val;
> >>
> >> -	ret =3D drm_dp_dpcd_read(aux, reg, &val, 1);
> >> +	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
> >>  	if (ret < 0) {
> >>  		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> >>  		return false;
> >> @@ -632,7 +628,7 @@ static bool
> >> _lspcon_read_avi_infoframe_enabled_parade(struct drm_dp_aux *aux)
> >>  	u16 reg =3D LSPCON_PARADE_AVI_IF_CTRL;
> >>  	u8 val;
> >>
> >> -	ret =3D drm_dp_dpcd_read(aux, reg, &val, 1);
> >> +	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
> >>  	if (ret < 0) {
> >>  		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
> >>  		return false;
> >> --
> >> 2.47.3
> >
>=20
> --
> Jani Nikula, Intel
