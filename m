Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C048CA9EDE
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 04:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E44210EB63;
	Thu, 15 Oct 2026 04:01:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4758010EB4F;
 Thu, 15 Oct 2026 04:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792036856; x=1823572856;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LZ2bC4wjvRc1O40p789axdZYUHjGoNsMkAqcgVY/0XY=;
 b=QX7Xr30L+dmNLCtOHfrSZ8aAUnZ9B8jlRJ64d1tpH3cTsexyBEv22EAC
 drzPGqRr9EKCtqdmvmdS0ucQyl5CNaU15wDyg/rAq70k/uOrmE9IgRo+A
 j/cacYScUJ1MhF25mko3m51gPZTS9uEjcuAa9X4BFdOpj0sMkCmdhNtsF
 7TqEuTtwkbdzxtqLcaMy6eBVHSKiVAYVfUUSGzNtpAdYfDTSXEQUPA094
 3kz66Wo7rjb0nwgIjZZd7OIVNS8+PdjpY8ODQqsItWFgS/qSnfrLSbWAp
 cC9qjFTkh0Qsjmh5otcDYhxczhy0yfa1A4NravROezvn0CDJxBTJ96q9n Q==;
X-CSE-ConnectionGUID: K95IMqCSTBu+ZG+VkjpDew==
X-CSE-MsgGUID: 7LsZwlfIQW6rjFYNLOLHtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="804958"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="804958"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 21:00:55 -0700
X-CSE-ConnectionGUID: XKlNxu+xS1+chi3jtwmRqw==
X-CSE-MsgGUID: Dm3EoSG7SGGib8tfzha9ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2033149"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 21:00:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 21:00:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 21:00:54 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 21:00:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDfXZhQ0J85RA/l2NiI1JZ7x/DZAWPI5r+uWfqgRXq8Wr09ZIJqukShjgW/XPzHxFnwIEog6UsBmrE8p28GB8UxCB+0Ajf/YwMi/50vJFvfVldXJpn8cZJZppZQ4qxqatdI5tDq/5Ju0bPM1F21F6zDCEywIfGEvGSJHynFR+hZ+Au0ziTHWuE8pIjZFzj4t2qYWrb/w3EaimDx8qSBlQF3HILeRh6NtCsR5meE3EzhOuEwH7Nst7LYMh9ZDWflaUyUVblM19IFVwHtcNFG/hCwX9EwP5WeJ9scHTNWLmJZrzfWSvqq32mqEmtc2m2rUy234xt6dA3XaVTcY06k7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7c/R2GJ8tjuKHSJtc8DpZRUaJV7I+EIEGUvgRplu3GE=;
 b=FQkxHTbUPXU8o3ACFnKk2AaX6YtsQz7YZyQVaCpjli9d6S/JKoshXLX9pcavE3r4AbOCaumJNPAUDyf6iMMeMU9diSJ8B5+6ydUfmNjD6TE7qFa0X8k92vHCqsZRPm8uh0mZkOyQ6OsIO4fF2lif/BOdwjubrHiEPDQ/CLYd7m2zpk1m5zhNWgh+IvCFpIjrpOEHVbOSbpWHtlL8Jjmd1tKq0+ne8jIMtt2wWmIoVqjz0AMFwyBQOB19DVJTtd7ow2l2vTd2Fro2h61oQh/8Orf2kncuNmc58QoTJjWuJMGsz3teytiPdDOh1YpUPdsBr2KUPEweEA0754q1ZxaCHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by LVUPR11MB9811.namprd11.prod.outlook.com
 (2603:10b6:408:39c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Thu, 15 Oct
 2026 04:00:50 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 04:00:50 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Kahola, Mika" <mika.kahola@intel.com>
Subject: RE: [PATCH v2 1/4] drm/i915/dpll: move the PLL power save W/A to the
 display W/A framework
Thread-Topic: [PATCH v2 1/4] drm/i915/dpll: move the PLL power save W/A to the
 display W/A framework
Thread-Index: AQHdW+MqVoOgcJhHMkOwvzW703kkYrb9+t0g
Date: Thu, 15 Oct 2026 04:00:50 +0000
Message-ID: <DS4PPFE901A304F70A28346FEFC919D5826E39C2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261009103552.1864818-2-mika.kahola@intel.com>
 <20261014134424.2845993-1-mika.kahola@intel.com>
In-Reply-To: <20261014134424.2845993-1-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|LVUPR11MB9811:EE_
x-ms-office365-filtering-correlation-id: 49ea4e3d-3f83-4cd0-cc0d-08df2a70e69d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|4143699003|11063799006|56012099006|38070700021|18002099003|22082099003|6133799003|260925021311599003|260925021911599003|260925022911599003|261009223027099003|10067099003;
x-microsoft-antispam-message-info: BL9YZwgIL/FgzdDXFKdRDFRZ/nhIN8j4A79ui/LQgiO645tU0l8XrWs8uL+5mIdeLgo1mHBVaJq/k8w5Jkd2BsrJ/Fab4HLd3C0jyngXcYxpKBsMch1o731Qiiewb991Xjtha3n5ypF1SlBifjBFjaTn7m78qi5yrl1YRaMPCjIRGELDod8FZ94zneqmYUi6fxwRjvHJkUK/EuEnrnxEMny79MwgsZ/BnE48rsNeCO9lmjs+5AkXH4IGF0prsefikKFm5JGPOiGvDNVHrobHb/QrNQ0T8VgbZQ0lW1TynlJC1xEQJ+veyhM0d68ScfxCpsVeWJVHIk5SqTtYjzGRv0Ie/+obGHqKBp3l6nsp81cDl+tgfgcSqzLy9bqJ8CgZgiuS9hWv7CW57IURWS+xZjIMIQ8Ea2Xee1qPGZWCboY45mQVfIaZAi2FCKgJ+joKE60L0jACGn4R6ryhyxlBwcZoWv/nhIQ7b1zUP0IJE4bUNF0Y6vlpL3Ib71FreuvDB/+OyZm132WR3pAKWecppzUOBRHRNkBYyIMpQEchp1XB1ccPHXTnFcJWsmE+xl9bPs5F3uZV0re0f5JOVKx7AmGFW8O3zQczjP8ukcGQIwCLNIHPW4mmkC2NiP13UFSms5a8/sqZo/lgZhF37ssJiIw4/8oUYohSGVnQw+dg3WejYk9XsyGGHjkzFj61npuNbM8+guON7OD+SKclqwXaNdDNPC04JmGMTFPcYbJm+qw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(38070700021)(18002099003)(22082099003)(6133799003)(260925021311599003)(260925021911599003)(260925022911599003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bmSZGegWjeJjoNazmn7MLfkf7i/C308CYjVZjEYQjOget2mNXttAm7wbd2pC?=
 =?us-ascii?Q?EIqIbfMEFuOeIuv/xWIlZCjesCD5RoaSmbWt7KQykRF0/Z7u0cjgSunarFX2?=
 =?us-ascii?Q?joF0zajdCzROugA0iGbMR43XHyRXcQfGmpFXx9SzjOXhVAOttHZfpXcZkRbw?=
 =?us-ascii?Q?aefc53SgEjKx3616Vb1NASjY5/GuL27C0a4GtpXmA3CsJodTuaN1V+abDroe?=
 =?us-ascii?Q?ZorxxZwRv3lDST7P0ADPjjoHHMJNsy8N1tQIXBV+Dc5IU8ZoTJG7xqLpnGZ1?=
 =?us-ascii?Q?3fZgat0JlDmR7pAaTlXUCbDHfgqNcDU/HPJOKQMCH4b8y0+xM1XUtKZWq0XN?=
 =?us-ascii?Q?rT11SDYJ3+ILIwNdFjFwxfsIlhVzYX/m6dQQvP1wR/47x8COLiEn5o0HotxT?=
 =?us-ascii?Q?UcXVzsRdPQBr0QDFgRx+x31NF2VFSah+bfudaTBE0jptgfuaxSMMZMxwQDRo?=
 =?us-ascii?Q?StfhC2XVMcVcuXAkJQ9V+JmYVHyAM4pW3Swi/kPVIxr4NSATZHKgqqH/b1aL?=
 =?us-ascii?Q?zXrrBH08vS/0Rbd+/iiUgLN5MEW4E0GrcZdB2RfTt2viOW4hsFDQiVuhJLN2?=
 =?us-ascii?Q?Rst9tqvGxZMmdlyO+QGq2iPNKKtbLKrvhuh7TWp2W0P8AktliMdv/z0Syg2h?=
 =?us-ascii?Q?lCVbdSUk6Dq4WVNXqVUStPh/iBulqkEZLA5bVIOthd8nj5E0wkaulyBsF5Gi?=
 =?us-ascii?Q?lQnlEw34WUQsOzUYRRZLR4j20KqB2/gQCH9l3V2NUvHWpf71tVREqtd/3u/G?=
 =?us-ascii?Q?mGXqnK8IlQHJ6NGQEDXqfQvTc5Tceh3+Lt0i/cy2BljwRf3/PoTLbe1Ydipo?=
 =?us-ascii?Q?LiIRp3ZuR+eYdlIz2EB4UrOEk4KKtP+B4p6Pwysqyg0KZPOz0NNKjhHK0GVf?=
 =?us-ascii?Q?qhamfwchgJDVRJjn/U69DEzyFjA2Y9ajqQzt5NGkQVw/dWCTBN7B/a3SFwHg?=
 =?us-ascii?Q?sd746Cuzq8giLoKxf2dDSV1p1D0tE1q1fWJyV0d5y/ELY4h535rjpNIWXWpQ?=
 =?us-ascii?Q?zSyj53BcANQdUSTeh7IAhD20lvu0WHcnZR50Z+6ndTQwq6fqQqJ1n5YIgiyW?=
 =?us-ascii?Q?nyfL6wIHF+f+THaEP8O36XZFDAua8hB2qwrGoZB9cd6C1AoLiSuDEZwpCa+t?=
 =?us-ascii?Q?wlr0TB/HZaLlZ3vJjvKBpoxGGowJsry2/f+0Ej+6hFcA3wKp7pt37Rwd4K37?=
 =?us-ascii?Q?sXV2xvZaJID1t4p/5YKftn+Fp/tF3WCZBQUEQAFFc6aSl6KEeMg6pSt88yF6?=
 =?us-ascii?Q?iHRkAvrAbUYF+g7OyXXBF7vR9jhgJ9VbbCzyhOHiIcw8u0Pc55JeYF7Jh4+9?=
 =?us-ascii?Q?hxFZEgDn1d+Fm9/HwOla+J0GQApQ85EmKC6QFVbZ+zzGPb8DhVVH23iea6CC?=
 =?us-ascii?Q?X1UUZ8/vwHuGq5nyBpzSB/ZoOPsL7WNc4GI6dRDpJ0uZzRRiu9scNQuuVdNb?=
 =?us-ascii?Q?xhf7LQdFiAgGx3uNiL85GFoMvVOozn+WX431S3YhzIrJyPgqNXurQybhg7L9?=
 =?us-ascii?Q?Xfs4HnoPUxfYsz8AXMaEpYtsoIIktXZkDgOCnjgxTA9Tl9NyW8Yv4bzSWVGK?=
 =?us-ascii?Q?L9rQtKBzGUEDmLL5BDKz/09KV1iOkNmZcJuZ5WMgdOMzKx3VFTDA7FNUpnDs?=
 =?us-ascii?Q?v8RcwrXOmkw7zYUfUWPnvAXNLvDV6zOmrVQYZkskZUUNaLh/kqXs2mRBdDY1?=
 =?us-ascii?Q?/ouQKLPHm+kZvx6JSk4AY5QUfMCv5ycIZ9c8w9HhbflXOiCttGagzMjglsZu?=
 =?us-ascii?Q?K4PbR3HBqA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f76/VZvbVWN/vPbVoEKJINjfk0WgrVq7xbptb/u7c5upXYYjeuZWgIBTs7+ZDsGEcqRWZlDzwFhB82eTB1S9nGVuhubdRYwPEpCGDYe5vHYtiWH7ChlP8BZ3B5N7IUHam9Ahu4fRcJgbKJLPhnZW+8S8/OqkrbKeb1WrwDHhZGkGj9/L/yOvXc63pbblF7x5p5GGEkq/zsyrNOF0Y+q6A/na9d8SDq9ow0GBICUdBT2JfySbY3PIuXWN/q0sWXH8pMrnuo36FvqDxzXo/k5R730927URC4oEBvDJEpLctwSL7RwpnzTecXzQMbqnfPfLNdMDsGxRp3v4XnVvFPCOvg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ea4e3d-3f83-4cd0-cc0d-08df2a70e69d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 04:00:50.3493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WYZLxUb78EJc6CcVJFS15JPx7i1iS1KTxCvfuBOGohgM6odv+Ycic960oQ0skXMJqxiKR0BiQMo6kfhtMkT6jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9811
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

> Subject: [PATCH v2 1/4] drm/i915/dpll: move the PLL power save W/A to the
> display W/A framework
>=20
> The condition for W/A 14022081154 was open-coded as a DISPLAY_VER()
> check in intel_cx0_pll_power_save_wa(), which also walked the encoders
> itself. Neither is specific to the C10 PHY.
>=20
> Add intel_dpll_power_save_wa(), holding the W/A condition as
> INTEL_DISPLAY_WA_14022081154 and the encoder walk, and leave
> intel_cx0_pll_power_save_wa() with only the C10 PHY sequence for a single
> encoder.
>=20
> The spec lists the W/A for PTL+, so use DISPLAY_VER() >=3D 30 instead of =
the =3D=3D
> 30 the code had. No functional change: the sequence is C10 PHY specific a=
nd
> intel_encoder_is_c10phy() is never true on display ver 35.
>=20
> While at it, let the drm_WARN_ON() on the table lookup check the return
> value.
>=20
> BSpec: 74151
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c  | 59 ++++++-------------
> drivers/gpu/drm/i915/display/intel_cx0_phy.h  |  2 +-
>  .../drm/i915/display/intel_display_reset.c    |  4 +-
>  .../gpu/drm/i915/display/intel_display_wa.c   |  2 +
>  .../gpu/drm/i915/display/intel_display_wa.h   |  1 +
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 34 ++++++++++-
> drivers/gpu/drm/i915/display/intel_dpll_mgr.h |  1 +
>  7 files changed, 58 insertions(+), 45 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> index b83f0afaa9b5..92cb370d724c 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -3700,54 +3700,31 @@ int intel_cx0pll_calc_port_clock(struct
> intel_encoder *encoder,
>=20
>  /*
>   * WA 14022081154
> - * The dedicated display PHYs reset to a power state that blocks S0ix,
> increasing idle
> - * system power. After a system reset (cold boot, S3/4/5, warm reset) if=
 a
> dedicated
> - * PHY is not being brought up shortly, use these steps to move the PHY =
to the
> lowest
> - * power state to save power. For PTL the workaround is needed only for =
port
> A. Port B
> - * is not connected.
> - *
> - * 1. Follow the PLL Enable Sequence, using any valid frequency such as =
DP
> 1.62 GHz.
> - *    This brings lanes out of reset and enables the PLL to allow powerd=
own to
> be moved
> - *    to the Disable state.
> - * 2. Follow PLL Disable Sequence. This moves powerdown to the Disable
> state and disables the PLL.
> + * C10 PHY part of the sequence, see intel_dpll_power_save_wa().
>   */
> -void intel_cx0_pll_power_save_wa(struct intel_display *display)
> +void intel_cx0_pll_power_save_wa(struct intel_encoder *encoder)
>  {
> -	struct intel_encoder *encoder;
> +	struct intel_display *display =3D to_intel_display(encoder);
> +	struct intel_cx0pll_state pll_state =3D {};
> +	int port_clock =3D 162000;
> +	int lane_count =3D 4;
> +	int err;
>=20
> -	if (DISPLAY_VER(display) !=3D 30)
> +	if (intel_cx0_pll_is_enabled(encoder))
>  		return;
>=20
> -	for_each_intel_encoder(display->drm, encoder) {
> -		struct intel_cx0pll_state pll_state =3D {};
> -		int port_clock =3D 162000;
> -		int lane_count =3D 4;
> -
> -		if (!intel_encoder_is_dig_port(encoder))
> -			continue;
> -
> -		if (!intel_encoder_is_c10phy(encoder))
> -			continue;
> -
> -		if (intel_cx0_pll_is_enabled(encoder))
> -			continue;
> -
> -		if (intel_c10pll_calc_state_from_table(encoder,
> -						       mtl_c10_edp_tables,
> -						       true, port_clock,
> lane_count,
> -						       &pll_state) < 0) {
> -			drm_WARN_ON(display->drm,
> -				    "Unable to calc C10 state from the
> tables\n");
> -			continue;
> -		}
> +	err =3D intel_c10pll_calc_state_from_table(encoder,
> mtl_c10_edp_tables,
> +						 true, port_clock, lane_count,
> +						 &pll_state);
> +	if (drm_WARN_ON(display->drm, err))
> +		return;
>=20
> -		drm_dbg_kms(display->drm,
> -			    "[ENCODER:%d:%s] Applying power saving
> workaround on disabled PLL\n",
> -			    encoder->base.base.id, encoder->base.name);
> +	drm_dbg_kms(display->drm,
> +		    "[ENCODER:%d:%s] Applying power saving workaround on
> disabled PLL\n",
> +		    encoder->base.base.id, encoder->base.name);
>=20
> -		intel_cx0pll_enable(encoder, &pll_state);
> -		intel_cx0pll_disable(encoder);
> -	}
> +	intel_cx0pll_enable(encoder, &pll_state);
> +	intel_cx0pll_disable(encoder);
>  }
>=20
>  static void intel_c10pll_verify_clock(struct intel_display *display, dif=
f --git
> a/drivers/gpu/drm/i915/display/intel_cx0_phy.h
> b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
> index 95c20eb4b4b7..b63916bfeca7 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.h
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
> @@ -78,7 +78,7 @@ bool intel_mtl_tbt_pll_readout_hw_state(struct
> intel_display *display,  int intel_mtl_tbt_calc_port_clock(struct intel_e=
ncoder
> *encoder);
>=20
>  void intel_cx0pll_verify_plls(struct intel_display *display); -void
> intel_cx0_pll_power_save_wa(struct intel_display *display);
> +void intel_cx0_pll_power_save_wa(struct intel_encoder *encoder);
>  void intel_lnl_mac_transmit_lfps(struct intel_encoder *encoder,
>  				 const struct intel_crtc_state *crtc_state);
> void intel_mtl_tbt_pll_enable(struct intel_encoder *encoder, diff --git
> a/drivers/gpu/drm/i915/display/intel_display_reset.c
> b/drivers/gpu/drm/i915/display/intel_display_reset.c
> index 504ec7043cd9..375201798413 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_reset.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_reset.c
> @@ -9,12 +9,12 @@
>  #include <drm/drm_print.h>
>=20
>  #include "intel_clock_gating.h"
> -#include "intel_cx0_phy.h"
>  #include "intel_display_core.h"
>  #include "intel_display_driver.h"
>  #include "intel_display_reset.h"
>  #include "intel_display_types.h"
>  #include "intel_display_utils.h"
> +#include "intel_dpll_mgr.h"
>  #include "intel_hotplug.h"
>  #include "intel_pps.h"
>=20
> @@ -100,7 +100,7 @@ void intel_display_reset_finish(struct intel_display
> *display, bool test_only)
>  		intel_pps_unlock_regs_wa(display);
>  		intel_display_driver_init_hw(display);
>  		intel_clock_gating_init(display->drm);
> -		intel_cx0_pll_power_save_wa(display);
> +		intel_dpll_power_save_wa(display);
>  		intel_hpd_init(display);
>=20
>  		ret =3D __intel_display_driver_resume(display, state, ctx); diff --
> git a/drivers/gpu/drm/i915/display/intel_display_wa.c
> b/drivers/gpu/drm/i915/display/intel_display_wa.c
> index 888676693f5e..eeddf10a4071 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
> @@ -111,6 +111,8 @@ bool __intel_display_wa(struct intel_display *display=
,
> enum intel_display_wa wa,
>  		return DISPLAY_VERx100(display) =3D=3D 3000 ||
>  			DISPLAY_VERx100(display) =3D=3D 2000 ||
>  			DISPLAY_VERx100(display) =3D=3D 1401;
> +	case INTEL_DISPLAY_WA_14022081154:
> +		return DISPLAY_VER(display) >=3D 30;

This WA from what I can see also applies for PTL and derivatives.
Not on LT PHY
So maybe also add condition DISPLAY_VER() < 35

Regards,
Suraj Kandpal

>  	case INTEL_DISPLAY_WA_14025769978:
>  		return DISPLAY_VER(display) =3D=3D 35;
>  	case INTEL_DISPLAY_WA_14026643300:
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h
> b/drivers/gpu/drm/i915/display/intel_display_wa.h
> index 425a300840aa..acb45fa59aef 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> @@ -33,6 +33,7 @@ enum intel_display_wa {
>  	INTEL_DISPLAY_WA_14014143976,
>  	INTEL_DISPLAY_WA_14016740474,
>  	INTEL_DISPLAY_WA_14020863754,
> +	INTEL_DISPLAY_WA_14022081154,
>  	INTEL_DISPLAY_WA_14025769978,
>  	INTEL_DISPLAY_WA_14026643300,
>  	INTEL_DISPLAY_WA_15013987218,
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> index bfd6f0a19725..65cc028a90da 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -33,6 +33,7 @@
>  #include "intel_display_regs.h"
>  #include "intel_display_types.h"
>  #include "intel_display_utils.h"
> +#include "intel_display_wa.h"
>  #include "intel_dkl_phy.h"
>  #include "intel_dkl_phy_regs.h"
>  #include "intel_dpio_phy.h"
> @@ -5220,12 +5221,43 @@ static void sanitize_dpll_state(struct
> intel_display *display,
>  	_intel_disable_shared_dpll(display, pll);  }
>=20
> +/*
> + * WA 14022081154
> + * The dedicated display PHYs reset to a power state that blocks S0ix,
> +increasing idle
> + * system power. After a system reset (cold boot, S3/4/5, warm reset)
> +if a dedicated
> + * PHY is not being brought up shortly, use these steps to move the PHY
> +to the lowest
> + * power state to save power. For PTL the workaround is needed only for
> +port A. Port B
> + * is not connected.
> + *
> + * 1. Follow the PLL Enable Sequence, using any valid frequency such as =
DP
> 1.62 GHz.
> + *    This brings lanes out of reset and enables the PLL to allow powerd=
own to
> be moved
> + *    to the Disable state.
> + * 2. Follow PLL Disable Sequence. This moves powerdown to the Disable
> state and disables the PLL.
> + */
> +void intel_dpll_power_save_wa(struct intel_display *display) {
> +	struct intel_encoder *encoder;
> +
> +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14022081154))
> +		return;
> +
> +	for_each_intel_encoder(display->drm, encoder) {
> +		if (!intel_encoder_is_dig_port(encoder))
> +			continue;
> +
> +		if (!intel_encoder_is_c10phy(encoder))
> +			continue;
> +
> +		intel_cx0_pll_power_save_wa(encoder);
> +	}
> +}
> +
>  void intel_dpll_sanitize_state(struct intel_display *display)  {
>  	struct intel_dpll *pll;
>  	int i;
>=20
> -	intel_cx0_pll_power_save_wa(display);
> +	intel_dpll_power_save_wa(display);
>=20
>  	for_each_dpll(display, pll, i)
>  		sanitize_dpll_state(display, pll);
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
> b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
> index f4b84733a58c..0beb8d99fd5e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
> @@ -461,6 +461,7 @@ void intel_dpll_swap_state(struct intel_atomic_state
> *state);  void intel_dpll_init(struct intel_display *display);  void
> intel_dpll_update_ref_clks(struct intel_display *display);  void
> intel_dpll_readout_hw_state(struct intel_display *display);
> +void intel_dpll_power_save_wa(struct intel_display *display);
>  void intel_dpll_sanitize_state(struct intel_display *display);
>=20
>  void intel_dpll_dump_hw_state(struct intel_display *display,
> --
> 2.43.0

