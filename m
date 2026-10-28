Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72288606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 04:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F91atkPc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3830E10E4F9;
	Wed, 28 Oct 2026 04:28:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1B310E4F9;
 Wed, 28 Oct 2026 04:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793161675; x=1824697675;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qclSLrQS98gpvKp1XKUahPdNSAn64T3sAui+ZhVTWAQ=;
 b=F91atkPc+nf2MaYT6nVrT/kLb8JIg+cYaka3HFNQ7XMMxk/XKWm+nnL2
 xyg1zW/GKwwIlER91F2Efon58/R976S2mf3y8I2JALRW0YmeeCpD8FlIY
 7Uzrg9FI0vZpOHHkbrYgVi7jq+b+5NBrlMdraL8znzivfBILMIghQMEyb
 RS2ZFKMHzUgaGr48H0f+hxLyNSLMAYxJnQFs5qTWE7eG0MFZ0xceaSFEB
 d2pzXLQpAvLmUXaOwhSCOf21HyOFYZH47WvGoATTY/Wq0v9WTb4+e0AXG
 diZP604RFRBP3XeFYbNpKdvEhZecx6JFcUfRbay1YXoFHvGc4DoKgRGWV g==;
X-CSE-ConnectionGUID: i/NQSBTNT0uzJ/kcysTItw==
X-CSE-MsgGUID: 9XIowKDjRwGhy76vqoK84A==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1904518"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1904518"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 21:27:54 -0700
X-CSE-ConnectionGUID: z99wVQVJTyyPjxoLdlSOLQ==
X-CSE-MsgGUID: HDQcur1sS2uE42cewgisdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4594165"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 21:27:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 21:27:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 21:27:53 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 21:27:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=et2TMK4SWF+uQjyumepKrKX5HuK3/C6xU9CxZX7zzPkF/2nmrTjJosW2OIV1ILcHmJ72pVtimMAbd8BCZEWWOZ/4MZkFpc4kss1s0sED4jUCm8Le8h30TsatDWxZel0LbI3bFVzxJTJh8T8nj+DA7jE8vyE8Wn49rrJLYE9NzNj+VUcU+o9ufV8mAAMQAHmxAp/T+otoI3QZMazD4l3qnZvL7ChKwOpzsTY/LAZW1aoKnzka32+cxvCOZjvi6NBpmWSrCnNgQRVbdRlhwW821CsTLkEpEQYzMxIj6yId7z0wWj/K8NDwOQAHR7EhvOmIEF+mJpwhiYn/Xbs0KCDgbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUci19Q3fFdC1Yw1ngv0zb2qGY0zLUzFhP8BbYIMoxw=;
 b=Y4IMRTnnqBCbcye69FMwVdkfkGy5bk94SsltFGxzQrDlBuH0qjdsjnjoAwvdwfqkHvZoz6JOE5xIPddshDAu/7mdlBTRVXW01zpCf5H7m+84yESejPuKr0fg7Uh2mwcHB26OkIJq7ueCP9cfZ5vdbRfUpLdUjlG2RWC3yhN31MiCs+XEfMtwd3uQKOJQvje5dOwsFoHRrasamazd20FptzSuzdf6al/fhFNXpfEXWwrsTi9c5akyFevyZn6stwGzzHOe9fvkFkW9JJtH9uuB7v+L97T+/Cd3Eaky9NoMiT36yr9wA9UNgYXMuhtSb+BAUerNhvDlwO2hyBCGnTToTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 by LV3PR11MB8457.namprd11.prod.outlook.com (2603:10b6:408:1b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 04:27:51 +0000
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e]) by SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 04:27:51 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, =?iso-8859-1?Q?Polo-Fran=E7ois_Poli?=
 <polo.code.dev@gmail.com>
Subject: RE: [PATCH 1/2] drm/i915/display: Seed skl_cdclk_init_hw() with
 SKU-max, not zero
Thread-Topic: [PATCH 1/2] drm/i915/display: Seed skl_cdclk_init_hw() with
 SKU-max, not zero
Thread-Index: AQHdI/PPUs3/1za0SUinRpU/FCLTULcSAJwAgADURKA=
Date: Wed, 28 Oct 2026 04:27:51 +0000
Message-ID: <SJ0PR11MB5039BDF7FEF8E6EAE8FCFD2CBA6F2@SJ0PR11MB5039.namprd11.prod.outlook.com>
References: <20260804-cdclk-v1-0-484864b1aafd@intel.com>
 <20260804-cdclk-v1-1-484864b1aafd@intel.com> <auC9JGcyDdZ76yzH@intel.com>
In-Reply-To: <auC9JGcyDdZ76yzH@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5039:EE_|LV3PR11MB8457:EE_
x-ms-office365-filtering-correlation-id: e208016a-6505-4f4a-c531-08df34abd40c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|261026140227099003|38070700021|4143699003|11063799006|56012099006|261026121527099003|261021121427099003|261022075727099003|261009223027099003|10067099003|260925021311599003|261022105027099003|260925021911599003|261021123027099003|260925022911599003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: fhmx/UBO78M4MdNZIyJtmu7XJeZbyO/NESHrqGAzr1w7BFceEUt/6E8K4bJfpwmiygAHfXYEFQ1F/65ujSndDq0g6KqGCry3nHGbLM8IXPG0a6p6z9TBqX0AMFD5dSijwK0e6r4Yo6SEQUd/xXt8zoWk5A43eH6FAGvSbBJahb188cOcxQP72XoRSYjSzeks4FlBD8syTHuUIHCU+D1kyuTEFc6TB3DYo5Vuv8FQLdJPpk1rNYxq3N4KFseG9ncD2GviEZu9z9+i0yRVPQYjrx334Ug077NGKt9Ejudr1jEWyKn2TWqwL3U0VbG8VutyTNmHNX/dB8TxIgy9bPco2nhWQhk8R9QcSV0WCcAWaPxvDzALLcECxxtoYI3XGg8b4buE02jYGQ9T0q6USpzXqLapyBc0gdzqq2tvEdFYcgbMI1reVzzQfWK/A0ZohH6tGG4hpCwdiJxb03lh6/JiG/CBanRoi6PqM3CQONAgfNsj+o1dWGEB6PJ8yUKua1GHXF7rBdBc33loeepxBAuOlTwA+QqnX6lcIoNDExvhIxO3j2lYuUqQkeXspVcgktBg/W7/VPaXLekzmhbHqXs/PSEjtBpz9waZuDb3ognGCGTgvmxFUWYUGl3ISXvp9Dinn9mDUAlqhDUINC7EkTBNPg8GAkROvdNCsruLeC3NQtY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(261026140227099003)(38070700021)(4143699003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261022075727099003)(261009223027099003)(10067099003)(260925021311599003)(261022105027099003)(260925021911599003)(261021123027099003)(260925022911599003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1nNQO7hphb4a/UuI8IDMlEosj+NN6tORtO6rEPeH0hMQ4po70RM0k3yvYZ?=
 =?iso-8859-1?Q?0GV97I0UmzbQ3qAVCZXG1djgdJPn3SQglaANJvZ7as83Yti3HGtYny04cW?=
 =?iso-8859-1?Q?7fjPYMWE/cuQ3aRTyXvTz7DpBMjkzL5W4A7msqzJ5nB54GkeZjNniQsGA4?=
 =?iso-8859-1?Q?9V2/yWL7xd3vLFDkf9t2LOdElRbVdRrmkawLujX5c3lhDe4zqmWxsr2c1o?=
 =?iso-8859-1?Q?zolT+10g1QiF8xCnqIrWgdbJBGUY3wj0dF88rbpOYRQz3y2EO7SU9X+bBv?=
 =?iso-8859-1?Q?zIbISLUML+2tEb7UUHKAJ09rwagnXgGUBfpaMH4Tte1kdKAyL+s2GwM32s?=
 =?iso-8859-1?Q?d4q23OrAPkAICbom0K/xK5UzJzNKdy22PQX3xZKKDJ87cCmLSbXA/0wiYQ?=
 =?iso-8859-1?Q?mZ0kbbzkqr68QPR7gMu+1pFXYDZzLIMM9ITb8i7Jqhyr4/EqE8iqCLmz3F?=
 =?iso-8859-1?Q?v52ZXd/navNE25WhGNXxOKswxZnuRzXi8u7cqT4gEibinCHhTMOcmUUAVM?=
 =?iso-8859-1?Q?JlOeIh+gfMls4pB9Cl/n/12/hnIZ4EZjDAw6H7utd5iU54Rtv5xX0FA2yU?=
 =?iso-8859-1?Q?UUy7pRRtZi6KqHTP41GQNTCyX7d8zC7WfyvWOhn9DUcqbDsuXCySrpXowI?=
 =?iso-8859-1?Q?DqFSX+U39RO5+ut4wniT1QwgXjrBpa3fBTqAEm1GIC4iwVbE/50e2R3f1t?=
 =?iso-8859-1?Q?myi1UetirQsYvCW08Nm6JisNaMO+EA4DQYszVFsrLXgOIOzlNSKe/mnvCL?=
 =?iso-8859-1?Q?MHt6e8vp1qzb/XlOenKcqWuPigu0Sa8SAvjsRXr60F6X4iT5gTWuzKCXpD?=
 =?iso-8859-1?Q?1pNZSIyG0uLTFrKvyGJPy0o3vfFYM+ZrFCK3eo+Nwe6EqZKVSC2q2kMT3E?=
 =?iso-8859-1?Q?XU7Zrpkoze38yBFkxAatVErDXKiMw5Bijgs1i2Pm0wdKNQAFIgrnWmPqSO?=
 =?iso-8859-1?Q?GABGcpmzLU5jCTAhaxkxtXrZWs5VXT53SAU1uyBNirKaSKgmUnywTBrc8x?=
 =?iso-8859-1?Q?sAJIZ5k70KlGO4C1nN6sWxXe63dA92/vAXBOQE+bLBp0xlQHlpEHrj6qIv?=
 =?iso-8859-1?Q?IUpORW9XTWJLNRhtqfDYIayX+bP5SMOOnRDeDX9nVanocERBzgcwkFJksO?=
 =?iso-8859-1?Q?QoTtyjLR772lARJVqwqXTljx0WkAz/Baypp7NgLfev0GnUC8mXdKzdRSFt?=
 =?iso-8859-1?Q?UqoS8MDQHwHsILYp1vnQWWRMdT06FgqcK8q6hGFSzpT2nIyLO2Mr09yNLn?=
 =?iso-8859-1?Q?I+JzMXK4sVmzGAbfXdQrPIsc6nzfHU3BscWWnD8rzwNBO/pBqkrlWCxYOm?=
 =?iso-8859-1?Q?kMhUTUgo29P4fun6Dk7EVItPVbQ6XmI2RXYLJIr8jxGtfMcQRVywNoPD3I?=
 =?iso-8859-1?Q?HeeJfQqo2HShwhnfBZzv3YsIQIM0+0JTdOt1FmYnifGMZ0pwuiUHVXTegU?=
 =?iso-8859-1?Q?FDvr8fglmsCrL/AsJBXYh2KiXQqijHUO/wFRbh2Dg/Nvt6vNExAcXSp5Qb?=
 =?iso-8859-1?Q?isz92E/iL0ZXv40JpwZcSDdVtsrc++5OVBeVFhnkhy9kv2FgkV5186jpW/?=
 =?iso-8859-1?Q?G+63zSoCVDI0bcLBS0DsWR6x7K8qf/BOAyT0K1xQObhI/3ifZHOAdeZ74r?=
 =?iso-8859-1?Q?w3aEEegIu8GlVrL70er2hyGt3D8Ytjj2G6z7dDj86LagyQSRCNd4wsi6DM?=
 =?iso-8859-1?Q?ZObqg7ylbfA6a4+rwvtRPcDWGM8A9hIho7AM1+xUZsgP4uwkFc9KmI35D5?=
 =?iso-8859-1?Q?pfhrNeN1yO3z48xnN8yuWp09Gcu/rp7xGv8D1P9+bDyrlUoWXhzjYDB8Rh?=
 =?iso-8859-1?Q?j011pGumHA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Yohe4/gGQqhkkkfDBIagpDxi5W5oN5xInuGfQY4B1WxORQKFHyypDb9u8+0vsUxDZF/1zZpwPdU227UAHt+P9jpuqSiASkc8Ug5gOfNbOhZdeg2tn4qmf2Sv1fgro0KeXv9TiN9bzaSw1a7M1VG34smTBgDBDwPwBlCtv39RYYmJXTINQlDccUTClVIzJ4gYEen1W+lsdhC724dYVrMSwWteOTc2KxEWY6yWQu7bPFRJXg155xprHx0qrPGW/oUduPOp2rtnCBBhM7F09v11qDgtXVZHieBdoLYtzNojYClb3o864tN9itnqwEccaxoGJV1+G9yvyLUU1tTvqc48ag==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e208016a-6505-4f4a-c531-08df34abd40c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 04:27:51.0633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u7hx7pZNHGvDbw2H7OnWq8oR0Yh0WcDuJSw2x2gUvEhY/o7DLxL9FQixJFhSKK++Si8aaOOx1DKl2FFnrvBj7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8457
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Tuesday, October 27, 2026 8:33 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Jani=
 Nikula
> <jani.nikula@linux.intel.com>; Polo-Fran=E7ois Poli <polo.code.dev@gmail.=
com>
> Subject: Re: [PATCH 1/2] drm/i915/display: Seed skl_cdclk_init_hw() with =
SKU-
> max, not zero
>=20
> On Tue, Aug 04, 2026 at 02:58:30PM +0530, Arun R Murthy wrote:
> > skl_cdclk_init_hw() has a recovery path that runs when
> > skl_sanitize_cdclk() has decided the pre-OS CDCLK state is not usable
> > and zeroes
> > display->cdclk.hw.
> >
> > Seed with the SKU-permitted maximum instead (as read from SKL_DFSM),
> > so the recovery path lands on a cdclk that satisfies every pipe on the =
SKU.
> > The very first atomic commit that follows will dial cdclk down to what
> > active pipes actually need via the normal skl_modeset_calc_cdclk() path=
.
> >
> > Closes:
> > https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16595
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > Tested-by: Polo-Fran=E7ois Poli <polo.code.dev@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_cdclk.c | 65
> > +++++++++++++++++++++++++++++-
> >  1 file changed, 64 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c
> > b/drivers/gpu/drm/i915/display/intel_cdclk.c
> > index
> >
> a53d887271778193fd400b9199ad841d5d9730fe..19f3ef8adfcded3784289245
> 39db
> > 9336834278ea 100644
> > --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> > +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> > @@ -1288,6 +1288,31 @@ static void skl_sanitize_cdclk(struct intel_disp=
lay
> *display)
> >  	display->cdclk.hw.vco =3D ~0;
> >  }
> >
> > +/*
> > + * Seed cdclk from the SKU-permitted maximum. Used by
> > +skl_cdclk_init_hw()'s
> > + * recovery path when skl_sanitize_cdclk() has decided the pre-OS
> > +CDCLK state
> > + * is not usable and has zeroed display->cdclk.hw.
> > + * Seed with the SKU top instead: it is guaranteed to satisfy every
> > +pipe on
> > + * the platform, and the very first atomic commit will dial cdclk
> > +down via
> > + * skl_modeset_calc_cdclk() once per-pipe min_cdclk is known.
> > + */
> > +static int skl_cdclk_init_hw_seed(struct intel_display *display, int
> > +vco) {
> > +	u32 limit =3D intel_de_read(display, SKL_DFSM) &
> SKL_DFSM_CDCLK_LIMIT_MASK;
> > +	int max_cdclk;
> > +
> > +	if (limit =3D=3D SKL_DFSM_CDCLK_LIMIT_675)
> > +		max_cdclk =3D 617143;
> > +	else if (limit =3D=3D SKL_DFSM_CDCLK_LIMIT_540)
> > +		max_cdclk =3D 540000;
> > +	else if (limit =3D=3D SKL_DFSM_CDCLK_LIMIT_450)
> > +		max_cdclk =3D 432000;
> > +	else
> > +		max_cdclk =3D 308571;
> > +
> > +	return skl_calc_cdclk(max_cdclk, vco);
>=20
> That's just the max cdclk. We already have it.
>=20
> > +}
> > +
> >  static void skl_cdclk_init_hw(struct intel_display *display)  {
> >  	struct intel_cdclk_config cdclk_config; @@ -1311,9 +1336,14 @@
> > static void skl_cdclk_init_hw(struct intel_display *display)
> >  	cdclk_config.vco =3D display->cdclk.skl_preferred_vco_freq;
> >  	if (cdclk_config.vco =3D=3D 0)
> >  		cdclk_config.vco =3D 8100000;
> > -	cdclk_config.cdclk =3D skl_calc_cdclk(0, cdclk_config.vco);
> > +
> > +	cdclk_config.cdclk =3D skl_cdclk_init_hw_seed(display,
> > +cdclk_config.vco);
>=20
> We sanitize to min cdclk on all platforms. Don't add weird differences be=
tween
> platforms.
>=20
> >  	cdclk_config.voltage_level =3D
> > skl_calc_voltage_level(cdclk_config.cdclk);
> >
> > +	drm_dbg_kms(display->drm,
> > +		    "cdclk: init seed cdclk=3D%d vco=3D%d volt=3D%d (SKU-max, no
> per-pipe min_cdclk yet)\n",
> > +		    cdclk_config.cdclk, cdclk_config.vco,
> > +cdclk_config.voltage_level);
>=20
> What?
>=20
> > +
> >  	skl_set_cdclk(display, &cdclk_config, INVALID_PIPE);  }
> >
> > @@ -4231,6 +4261,39 @@ void intel_cdclk_read_hw(struct intel_display
> *display)
> >  	cdclk_state->logical =3D display->cdclk.hw;  }
> >
> > +/**
> > + * intel_cdclk_sync_hw_state - Adopt the HW-asserted cdclk into SW sta=
te.
> > + * @display: display instance
> > + * @hw_config: the cdclk configuration as currently read back from HW
> > + *
> > + * This helper reconciles the SW state to match what HW is currently
> asserting.
> > + * It updates display->cdclk.hw and the committed cdclk_state's
> > +actual/logical
> > + * so that any following atomic commit sees a truthful baseline and
> > +will
> > + * naturally attach a cdclk_state (via intel_cdclk_atomic_check()) to
> > +raise
> > + * cdclk when the workload demands it.
> > + */
> > +void intel_cdclk_sync_hw_state(struct intel_display *display,
> > +			       const struct intel_cdclk_config *hw_config) {
> > +	struct intel_cdclk_state *cdclk_state =3D
> > +		to_intel_cdclk_state(display->cdclk.obj.state);
> > +
> > +	if (!intel_cdclk_clock_changed(&display->cdclk.hw, hw_config))
> > +		return;
> > +
> > +	drm_dbg_kms(display->drm,
> > +		    "cdclk: syncing SW state to HW after drift (sw %d/vco %d/ref
> %d -> hw %d/vco %d/ref %d)\n",
> > +		    display->cdclk.hw.cdclk, display->cdclk.hw.vco, display-
> >cdclk.hw.ref,
> > +		    hw_config->cdclk, hw_config->vco, hw_config->ref);
> > +
> > +	display->cdclk.hw.cdclk =3D hw_config->cdclk;
> > +	display->cdclk.hw.vco =3D hw_config->vco;
> > +	display->cdclk.hw.ref =3D hw_config->ref;
> > +
> > +	cdclk_state->actual =3D display->cdclk.hw;
> > +	cdclk_state->logical =3D display->cdclk.hw;
>=20
> I have no idea what's happening here or why? We already copy the hw state
> into the initial sw state somewhere.
>=20
Initially I gave a debug patch to print the sw/hw cdclk mismatch and based =
on logs concluded its sw/hw mismatch.
Sorry I missed reading intel_cdclk_read_hw called from intel_display_driver=
_init_hw. Will drop this patch.
The initial sync is intel_cdclk_read_hw(), and later drift means a modeset =
moved the DPLL0 VCO without going through the cdclk path as the active pipe=
s remain unchanged.
Probably re-calculating the cdclk on edp modeset having different DPLL0 VCO=
 to ensure VCO change goes inline with the normal cdclk path should be the =
fix.
Will come up with a patch for this.

Thanks and Regards,
Arun R Murthy
--------------------
> > +}
> > +
> >  static int calc_cdclk(const struct intel_crtc_state *crtc_state, int
> > min_cdclk)  {
> >  	struct intel_display *display =3D to_intel_display(crtc_state);
> >
> > --
> > 2.25.1
>=20
> --
> Ville Syrj=E4l=E4
> Intel
