Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A01C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 04:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC9010E5AB;
	Mon,  7 Sep 2026 04:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Umki72XA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B646110E5AB;
 Mon,  7 Sep 2026 04:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788754247; x=1820290247;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=k5gyuG/lh7tGDk89vz9mdKdvcw1zfbaP7TucJ0HUjEw=;
 b=Umki72XAp/W6X1h+EM0iAqIvCNCKltGl5HUCJOvKZN96aDi1/4AZddwH
 vATvyVobKw6kevfuHg5Zpn0+RVeruAcHHmWBv0EyF2U1GTpGAWkETqZwF
 zP15YRDEO1DtEsYXUcCmNtTlwP0gCz2oHsJQoogjClAzvmRxcgj2xFMoA
 JJrulJ9DTDHqkdfA3p3XvRo8fm0397Uf2cjERh67emggvAfkZzqQYFk87
 aJwiGJApiQwuaSJsiLvwrtSmUMnvIFsdoka1ORWwB5ZfE/CVla0ZH5eeC
 WYfq4OVztqOaQwOuUir1IVcAxCjUQpb9BRWFtPVzVc1dfpfjxo5pMFuny w==;
X-CSE-ConnectionGUID: pLOC4aiHRkK9yEWG4YaWYw==
X-CSE-MsgGUID: 7Nx4QwfJQ2qh6fQxlf0B7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89026626"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="89026626"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 21:10:46 -0700
X-CSE-ConnectionGUID: f8lx22RjSVarekRTe5Lj5g==
X-CSE-MsgGUID: 4pksHE79QIeoz0v3xvfD2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="264402759"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 21:10:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 21:10:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 6 Sep 2026 21:10:45 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 21:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIkkrhaJsdZtWRarG5eEsBJpuNWJwqFICRnWSo/HFfrqYQ44sdiPIuhKa+SqHC4m2gNgkXoL66kW84YRMp/l2Jf/pIgYhXLaBt7mgyXs1tSQ2F+fYwv8w6whPlI6uf9k1TXGsSiEIoxFPPObarSVhpzX8Wa7XQ2Hw2hHahO2XXAyC6U6m7sC8QEoaqqAGCYokZiH4i9XHfAmCbQxxbkPCMZyBz9lC60woL0UJhA1mI5sgxMYM9i7IZLgpS93gz89IkOnBlw4A3tL0ptFfaAgFSEU5mvjR9AJPth+cKCI53ntFBgVilWhWiE1u0daDO+RL1qjsPcdA7criKvW4RDSTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sE5IoDBZf3pfU3RhWpOMDMazMa+JehPn/Ucxeml+cDA=;
 b=CwHF+rdN9MeMIbhmaNVdjkHcFVezMTQgpge2nqXnwzLj6FNL4A2KbexYSBSfEFrHRU3F7LzgQVQ4ARwlQoXgnIH5zF10e/SBMuDQ/D4/QYcNrhJw6PqZL6AZw12wWgo8ep0k7SbdE+soaLuhr+bfiwdMZ76tnihQaKAla4g2fQhIDiVc0DaixAfB+wnSKc6bmrT+IVinEPbaG0+vjwyZiwXUjYsSEILfoRLIq8YpLppEBAjgsKW9lWO3eYoJOMHQy3uemt8YReJoWpirIRChokWNSWz4OhH93gShDDG7GsLq9Rdge7tpeAv7EsU7G2v4Q0SRD6LllWKWhO79X/jIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by PH8PR11MB6973.namprd11.prod.outlook.com (2603:10b6:510:226::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 04:10:42 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0382.012; Mon, 7 Sep 2026
 04:10:41 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/display: Limit SEL_FETCH clear to supported pipes
Thread-Topic: [PATCH] drm/i915/display: Limit SEL_FETCH clear to supported
 pipes
Thread-Index: AQHdPDbxaxy2NJaVoEara7ZpTwvCXLa+AIYAgASEW1A=
Date: Mon, 7 Sep 2026 04:10:41 +0000
Message-ID: <MW4PR11MB68875FF691238037309DD2CAE3B22@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260904062744.3010375-1-nemesa.garg@intel.com>
 <9514a15f9ded3fa79572f92a61f33650c4ab02e6@intel.com>
In-Reply-To: <9514a15f9ded3fa79572f92a61f33650c4ab02e6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|PH8PR11MB6973:EE_
x-ms-office365-filtering-correlation-id: 25f5b00c-b178-44e5-008b-08df0c95fb7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|4143699003|10067099003|22082099003|18002099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: WTALX/iZMKLzCHPdcJ8CQk9fA+piFvnCBmnCgSuXEfPnrjv60oOgMSX1eoelA/pX6vUAYE57ooMlm1iFgUrINP2FBJ85OrORFLmNuKU8B5U0V+NgP5nKOjrOY9ey9sN1CJ/+95G+8TjBV5pr5k3gyjONldF/RXLW6UfrfuwObgxqKQbsywmL7JNOzke3VGPcZvk1lVYnfduhZ2eIBHRZZC2ajAvzqfFPodHF+NtjS3h2UuqenuWH65b3B8GsRRO/n5mz4e0moGPTZPsQb+MqRkJzBv+GUNNW10oODIFskUE/aTwiA9HICsYXlnI55jduqjjbdTW0RQPXt+ct6cPuCBE804crIZKSq8nvzhvMyOns+FXuXuxT8EfLAeUYJ03XFmkaB6coIMdvI4vc3eh4m+/7BBFCUbXr2A5YBpoYN0BGtqIlrs2zKEbAZRGQmYwEqKJ7x4fEluNuAcm/9wr2+L5JNock70jgsrdAa/XJRlB/LIrARu39e4zWcPO46g4UhTLLfRMmLVs/wrcy77Ub/fUgHF9SR9pkismOBsnm02fjcTcYunY5Eh2Wfyzukt0OQQAwBrXtjprTIwbbepl/MoaC2A5zGiRPnqM7V2DgE3/ETKIafszXQ8ghqmOC3QEFwLNwgfzvbrq2WR4/47cRkhrV1g0mQ1RUxb47noZqAxk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(4143699003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?22lQHLnyjwAORP1AvrWRgQGoGDhzZuO9P4Q6CCBpnil5UREntd96xz5oDUgl?=
 =?us-ascii?Q?b6sQC/gQDyzj96ol228U3tfrA3YBv0oaMiRxstc7n4HxOcjdNu4HrCEMe3y1?=
 =?us-ascii?Q?1poErEKwDSy/lumqyvhcb0a5SNwyeZGtVGrFXyshC6HgZF3gaplX/XaA9GZT?=
 =?us-ascii?Q?Tu9rY0CaGWlnMkJ9saDzDNLypT++lIa67QBPNoMs7P0IeTORj4+YZpBblLyd?=
 =?us-ascii?Q?EgSmTujFcU5fdejaIwsIlHHFMGNK6vEIyykGKhOZvwYOyvZh5PM+vx9C0znb?=
 =?us-ascii?Q?0xyFSesL3oen11ZTJXYMFNRjTKkmhGNAijkNjDclL3PiwSL+octsnwK/BK+9?=
 =?us-ascii?Q?upO1JgJ/Iumu4CpYGP6Yn23Hqylkz07grSthceCIyAhhdFrchHDapADMPGof?=
 =?us-ascii?Q?Hj0Y9tpkRxdNXSFpso7dwdLamLS4K8IX3/o2seUaMT5jcPRD2UNj15fD1V7C?=
 =?us-ascii?Q?aFJJZY77r+y/Xcz98d//WVLpBNB01bBB3P/ADyMez2SuMRFSCD8GImXmx7rK?=
 =?us-ascii?Q?NFpvf5mmAI9OeeuFrgws4HFXYUxx7n8d5BqbO0+4oaPVgCK3zLxlaPgPJEfT?=
 =?us-ascii?Q?3eib9eK/iYHRpqb8JThTlJGRDrfXDrcZhZH9+pgZ8tpAs6qGLAP/S/Kn5Jte?=
 =?us-ascii?Q?67aWOiYqZnqimfcbswh0fnXj/U6H9h0aJWN2vaP2T3gdsp1N4HNaAniCtUoz?=
 =?us-ascii?Q?jXnas9/+gQrfM6U3B4M2nsvMTLT/Nj0qVIZd0EOVCUYokhpvtLdQAZjVnwB/?=
 =?us-ascii?Q?/1L+iuUbEQs+SJbZP47nFcUXM9fk8uRhhplQWXq6UhFmMv3C7+U+IL8M+31q?=
 =?us-ascii?Q?FeOIq4KmuCbl9ZFW7jz74IFa8PVZ7KPwIE0nXaEsgGqn5VXioEcDoDpNVDYT?=
 =?us-ascii?Q?NRhfKV2H1cnN4M2xstH+cnC70ztswI1eMbi4dSIZJBeCyl2zodOCT20Y93Ci?=
 =?us-ascii?Q?OCYSlVaBRD0Aqqq7bEQW+FnuS9DeH7/ZsTGsAqy5Ghro+2QLF7oop5qZ5HVS?=
 =?us-ascii?Q?yld7xhBcAqYespB5lx72sprT3R/prS0oxP2PmFa2SkLdFscXoFC5HqV1rmSz?=
 =?us-ascii?Q?T9RLDqYDmLzIQImwJmk7c1XXh+kYdkAuC2LMhjvPGGqHeMK7TvN1DYRq5Msm?=
 =?us-ascii?Q?JQSYNVES5hHgkiQ9+lqwDkDA/ryS0iYJEt0RBpvD3clZPWNKDcWZlop731Qu?=
 =?us-ascii?Q?9CkAejlwj7vYfTHuVkKjy6nyuD0lmwrk/7dNNaoVMUBae9LvyLKtd25gpqt6?=
 =?us-ascii?Q?0mxJEaY0MJHUVsQSy6FCE6asaiZfDZXBq6uafbEinXbKQNjQzg4CcdoM/ZfG?=
 =?us-ascii?Q?gONvwz38x+ntuGIA5WiPgrsuU/woGlyb0PuWG1bsDQhsPNCy2hLtdyv5vl0P?=
 =?us-ascii?Q?YZu3q5P8q/rEyJ8+0VHot/LltVlIS1tpGUsgOn9kG2MTWCogGF1xyw+ww6i4?=
 =?us-ascii?Q?gDU/ijjG/lJDxOmyVl1/ZH3AiLYkngmK4YBgZi/IKveESLS9GpumcNh75R+M?=
 =?us-ascii?Q?UC9y43tGmynPxWCNqFb8/z8LEIPUltC+0R4bC0nem1VzhHyawR6TdHmiuxtB?=
 =?us-ascii?Q?r6X5BohqraUshcQ0OQK2yYaMHLhRvKSmuUkpKUXG2OpXNCNjRbt9RPuVYfJI?=
 =?us-ascii?Q?+0wVHmqJ7dbmcgq4rQvGQrTiPkmL5prUxrS9oCyeXZGDJiLsp/eR0pmdlzvY?=
 =?us-ascii?Q?i4z/ffwriafSkLmevINm4wsBR3QkwvdZMr0N0f7N4g6HOTU0PwDlIQPFjvdk?=
 =?us-ascii?Q?dynBv7ZV8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Y6uq0jbq0a/vHlG468RfQQyhA4z5NxnApBWxK7ApBCt34bWj/YIkv8Nz2H3fgamvr64X4r+cVI/TSqqVnN5his5cCgxuNdJLUCkXAvs5wAYRSFh44FDPSuCFcdLKNr2FOKHTFkAQyPnE7wsqkWBnhdVvAcxmF+m4DSI7yAir0jMPxpOC9R4Qrq5DZ34tO8dhxyHROykH+nCGSDBPkO/Z8U0wWVEtoIvVj9A8WRWBwcfm8gQOWdLAS1zXUSCgo1PNefS8Y7QDspDzuo0ncv0GhcMcj9rKmIGfoGISMC8Ut6Htyum4whRETUTYoZqK/6PjJIdN3SSLRf7kBb9vsGfnkA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f5b00c-b178-44e5-008b-08df0c95fb7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 04:10:41.7996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2KeS8tuC5UmtmoWGTTnYgBab5m+ZVOKXT5eR5nLT6PgNlB5oIqfaTEeHoL+EEPr/PIxgg661oDsh24A0coMA0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6973
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



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Friday, September 4, 2026 12:41 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org=
;
> intel-xe@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: Re: [PATCH] drm/i915/display: Limit SEL_FETCH clear to supported
> pipes
>=20
> On Fri, 04 Sep 2026, Nemesa Garg <nemesa.garg@intel.com> wrote:
> > Commit 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL on
> > plane disable") started clearing SEL_FETCH_PLANE_CTL and
> > SEL_FETCH_CUR_CTL on every plane and cursor disable.
> >
> > Not all pipes implement these registers. Clearing them on a pipe that
> > does not have them leads to an unclaimed register access.
>=20
> Where are the corresponding checks on the enable side, and what prevented
> this before 7f1172a2ac0d?
>=20
I will send a new patch where I am checking if its enabled then only we sho=
uld disable it otherwise
no action needed.

Thanks and Regards,
Nemesa

> BR,
> Jani.
>=20
> >
> > Skip the clear on pipes that do not implement the registers.
> >
> > Fixes: 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL on
> > plane disable")
> > Closes:
> > https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16876
> > Assisted-by: GitHub-Copilot:claude-opus-4.6
> > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_cursor.c        | 4 ++++
> >  drivers/gpu/drm/i915/display/skl_universal_plane.c | 4 ++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c
> > b/drivers/gpu/drm/i915/display/intel_cursor.c
> > index 86bb96ac449b..3c06d5482691 100644
> > --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> > +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> > @@ -544,6 +544,10 @@ static void
> i9xx_cursor_disable_sel_fetch_arm(struct intel_dsb *dsb,
> >  	if (!HAS_PSR2_SEL_FETCH(display))
> >  		return;
> >
> > +	/* Display ver 12 only instantiates these registers for pipe A */
> > +	if (DISPLAY_VER(display) =3D=3D 12 && pipe !=3D PIPE_A)
> > +		return;
> > +
> >  	intel_de_write_dsb(display, dsb, SEL_FETCH_CUR_CTL(pipe), 0);  }
> >
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index 5cda1ab90e40..252df30debc9 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -893,6 +893,10 @@ static void icl_plane_disable_sel_fetch_arm(struct
> intel_dsb *dsb,
> >  	if (!HAS_PSR2_SEL_FETCH(display))
> >  		return;
> >
> > +	/* Display ver 12 only instantiates these registers for pipe A */
> > +	if (DISPLAY_VER(display) =3D=3D 12 && pipe !=3D PIPE_A)
> > +		return;
> > +
> >  	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe,
> > plane->id), 0);  }
>=20
> --
> Jani Nikula, Intel
