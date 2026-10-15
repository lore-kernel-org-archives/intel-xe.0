Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39447CA9EDE
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 04:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36F310EB63;
	Thu, 15 Oct 2026 04:03:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB0710EB63;
 Thu, 15 Oct 2026 04:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792036979; x=1823572979;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d73JBkd0yLPFhZ0gBjWPKLKiX8aXHBNECnhcu3v/3l0=;
 b=Q+4CxvSofYdxqNYUCgqfOVm1wfthQsjpqlx0edx+JZ/4ssr24blnAP9E
 kaqfAj8oJI2CGt5n/UdvMeJLzAJLeItqWvLol719lxPUvMtQtt9X8ffHy
 z6e6PnP+J+qPt1I6FzBdvxQcBhmg25kowGTTobft+dn5akH4YhHZS0Qix
 ydA6KbDNCCKd828hnCGRVRcYlP434LfWTbscUMYTi8YtXCSZxT7W3hv0a
 /Ac0o7pjLHoxuaDhNiAhZIaL5FbIvs9loOrOcbXusMclI82+Amw/TLDod
 i0BPnH5DVeXuBBJlUc8IDUJoTNs4t08i8XlufaKUAQmzSyYZy3L8gWo7Z Q==;
X-CSE-ConnectionGUID: tBQmASR0QaCMJTjOWzx1Xw==
X-CSE-MsgGUID: +H+gMegoRmu6QWCt4qg3+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="828327"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="828327"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 21:02:58 -0700
X-CSE-ConnectionGUID: H9yYDnWtQr27q4dsVjru0A==
X-CSE-MsgGUID: 3Z1p6KIjQUy6epr88gmN+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1668533"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 21:02:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 21:02:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 21:02:57 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 21:02:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIiF9lMcNDMHMujdzS9D0MV22VKU+6wM5i532GMdH4TFtLH3wdlfCHvUnhNN1ecOTlqzFZ+rd02ezprtnmOa3GWEGcA6hGUKwb8JMg4+LizwECp9y76e8oYDWic2p2Uj2X6IEGmIZXZqTvW6K7bbI6Iz+FZae6a++U+0IM/yJb35J/YtbLFn0yvRfVlrqc/BfTpz0EoJcaPgi+Osx2Apf5vYAgGRTsOJkrDS4/o8yREWjRAsD0imQiqA/xggWGZWjiL/S9ZfnqAvTJg7OnghB4bsClw2s6VO+PZQ80+GNYYDBVuM5TbVMZLpgldO6XEO1Je5PLrLiVCICFL4rL4n4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3GmIE8wTJ/Dg/aGaMgW3EGiJGjTgcLyY5nSGVR5Wrw=;
 b=IDh9rnsTRTIg3hXOI+tzeoHz6wRIzfCQGoctAbVb9Hz//A/E1In9jEMkMudW1Gy5ZI/hWQyDxkp6DJqACGM89AUYS7ddqy+6sHZCWG+tKxcHCbyZ5jyz+FG8zsCWGCziXybSNvtQskNoc43ymQQJr++8mfeoKoqRV17ZykB2QRH9bnGxka2yja2RGKcFiUb3/Z/L6MyOHoIGSxJXZrxhasNvKf4NJgIYVE7GRMnCrJrpUd8ntBVy2hagRvyNpqRKZYjI3N+1bfRg74iRRSYNazOn0Hyv33qWpwGOtOXnIvQX3JBh0YvN8EQ8YyjXHjMZDtkZQ4ylcbXsMoBO+CZiNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by LVUPR11MB9811.namprd11.prod.outlook.com
 (2603:10b6:408:39c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Thu, 15 Oct
 2026 04:02:54 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 04:02:54 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Kahola, Mika" <mika.kahola@intel.com>
Subject: RE: [PATCH v2 1/4] drm/i915/dpll: move the PLL power save W/A to the
 display W/A framework
Thread-Topic: [PATCH v2 1/4] drm/i915/dpll: move the PLL power save W/A to the
 display W/A framework
Thread-Index: AQHdW+MqVoOgcJhHMkOwvzW703kkYrb9++BA
Date: Thu, 15 Oct 2026 04:02:54 +0000
Message-ID: <DS4PPFE901A304F9DD673EE63ED5D5941CEE39C2@DS4PPFE901A304F.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 3f5d9c20-3d9b-4a1b-9559-08df2a7130c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|4143699003|11063799006|56012099006|38070700021|18002099003|22082099003|6133799003|260925021311599003|260925021911599003|260925022911599003|261009223027099003|10067099003;
x-microsoft-antispam-message-info: AX32/UW6QBXaMWuq+BicbfU9jaQSu5l2POrqnPVCS/hFdECPnfplBZGZ9VncnCZxM77qmpMZ3Au9oqKlU8guqL7H5DyLcRLdlXhCbEaf1ZebPU3P0SzXXSHcXPiKhOjzfcJNFphAnki4HuL4tczx4vnJB9+XPVPizFhzWqnZIEi6vePlxAhH0jRK8tealkv++i/ZmKA44sd4djPcEp6tPMsLR2rQdC/i73KvAWYKMAXjn6739lGmCaanaAiawxS+T9fECOM7GHP96lFL26GV5K9BNYe4ZfdO+Q65UDdCsp0s3gPdE1IdFqsetiQeVzs5WxHvZODN4Hw3A0rqZWSIelvGN3GLmOXIbU1SpSJHOaoOEv67e8DewteLMjNvXjm/QungVgsgay5Uba/RuetIyGhuJBWF9mxTrEimP5aE/TRLRJ3cPkWtD9+d/5CoCKWBQV2v0fR0H7gMukbwX72Wdo7Ji1PjnoYYJimk7zkNXMPiZXMczvuRf06XL1Hxr9EoWtYLIE/VdJp4ALep0UshG+hlvDVyBfTEZC6JlaGq2UYdI191yTpSojmL9Z17LASi5hJzEIHs7rQgDMuwwFuYsadP62VEy3d/Um/Tb0KTHL6Z1nHB1oIFXlYKpz18jcFFTn1mibwvOzALxX6wh9Q/Yv3o1J7LzEPue+R0qtmjPsveirfH0KAIQWwMsXhqfhto9FviOdWWE8+MjVSrkpoGlJ8cBhFeXsLnaYIOclkOflc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(38070700021)(18002099003)(22082099003)(6133799003)(260925021311599003)(260925021911599003)(260925022911599003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?flLxAHYXKZ9njHow52iKSMCv4QXUXaXBUcA5YDYrhPr/jWXV1NoDoRORFtEq?=
 =?us-ascii?Q?FG8nqAJXqDzTakikyLYBS2t0lpO3dBIDRV+l8bRlsxkFhrv37Uf5dCJvjV16?=
 =?us-ascii?Q?ANh42pzP+Rc+gjgcktp4XTWF3i+aK8ffOJUQBNjuMF+9OyRyiG9ESNSpKSlf?=
 =?us-ascii?Q?lL+gZB1vWbyq67r4NydF4M8VPmYWfwcEE/sy1BY0Fl1ZdYwkNX6GplaVyJDO?=
 =?us-ascii?Q?og0ZscqmQygLu5lFYRUUlDardGXdr+VOV0pm5wHZa6XDLI8+6+hlT7yPHKEg?=
 =?us-ascii?Q?AjHS6POQd9oCAN5B4KqbgyeYwOT+F/ZPT+m2Mohf2ZhILoMbnIiUh3lcDcW2?=
 =?us-ascii?Q?RhqNYEqf03vKpgUBhoUOhHOvK/GGeXqFggGF1Tl0X8FCBm7tXJI77IKCrD5J?=
 =?us-ascii?Q?pyC9hJyhK50222USsceDfODaZrKj6l/n6ICnXsUZuJvNeramd+rfnEoyB4jM?=
 =?us-ascii?Q?v/JkXphBFQQX8O1SpEd8ZxiU2s/q//pGgyGXmOBfX93DUx2C5UOYqesaNHzT?=
 =?us-ascii?Q?GyZWug3wF32HSjYWvFoNK79LvWieaBRT6ODTrJeqoCEYNAqk9V9LvlGj2p5f?=
 =?us-ascii?Q?ge56L0/hI2PBdJTWpbItc5nB1ptzPGZFCukE7q8Qg2wcMX/uljfwklk64sc2?=
 =?us-ascii?Q?e5enurJziBWuGZl1tdmUXuI/V79oFVssmL7vcK4OQMd8GOPFyzcf8O4QHjX+?=
 =?us-ascii?Q?OjQJxMKN0Jgf28pNIamcoulAlS2F73WCvpJgTFS86cqNOF3zCzVaG4cHtXhV?=
 =?us-ascii?Q?eLtkjp6ZNp2kBfVGD/GFig5+vzruqK9/nVWEuCBu2p6QbeXaoFDdp44PbqyD?=
 =?us-ascii?Q?5o/ksvbpyXAqeal+OORhVl4xWNqH6HQ6wwp/ktX9S7Zzy2JhtvNQ0AwHj+IF?=
 =?us-ascii?Q?l59tR9DziyLTGKFSQaS/PMLhFYJ/FcDuPtSwFXepm08j+m/uBrROajHNIFur?=
 =?us-ascii?Q?b3hgC09AiYqjBwFcH8KsyjmhEgtVsJScA9dYdcBnAPlh/2BRQV/NVlTyERAJ?=
 =?us-ascii?Q?cUgHY+JtsdWzO+tWa+NeeJWGMnSAWQa9ugRqgCVthuL0OYkPTSP0eYAD7jkN?=
 =?us-ascii?Q?I/ISR4MVOej4vSwYEhhLBSZz1HWojaODv5PimUMJqY2glbAcaxJ49+YVnywn?=
 =?us-ascii?Q?1tInRkhHRbe9EuH9dFf/Foe2FtHwzlXM+aGQh0/chlAX7vp05USwR5DYXWRL?=
 =?us-ascii?Q?c9b9cLdyvEYDTW2Y60pc6Xlot1x3CUAG4mAFZ5W+JeAJQNB2q6TzoSoTDgoP?=
 =?us-ascii?Q?v8/E2R35txnb5bDtBn1YmjLU9LgWPWqVVDn/0eQ9IZAonj4dAlFLLJgdf3Dj?=
 =?us-ascii?Q?rIO5k738so0bQJ343lZshMs8AZFpkLtIljLf/kz5bn1SEdcrGYszHtJy5lCQ?=
 =?us-ascii?Q?Q7mv55phFbxbKRTwOp8HFrIuJJUfR0R4/lG5kgLKkXd6mY965hABjD5HosO+?=
 =?us-ascii?Q?S4Ns8QmDvyB+l7q3rRUl73O7EMLeATW8ZCkilQfmm6Ib3uWLYOoE2MREnIKo?=
 =?us-ascii?Q?zpq5cX8oDPvuWGUIs04MjUBqxJ2dAOo4S60vgaMkv+YdRtEE1W2NBOlhUMO3?=
 =?us-ascii?Q?NuK95WCuIXWQFvDm4YdD9JDBobicPCfaDiveW7xcXwlMyTz/FbeqXAKcW7MC?=
 =?us-ascii?Q?ko48dvwhgUPW9thWdfmLHXa6f+7AAR7A20u/s4fcYXfyJN6f71vuoM6Uyg/j?=
 =?us-ascii?Q?S7lNs/XmEF6RVZllzNxLMxdhOsQeqTBk27SijW9dk8+5Tn/i/x0gAAWchIZx?=
 =?us-ascii?Q?IoOoH7O5Lg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IrEtOXXMjFiO1l1NZEVpSsbgDnqYJgu6H//RGjKJtFtdtMMZcNsg7VQulWTAtsB4q1sJKOBlSvnGY0ONoLEfQwfrzwFgfcrFp7UP0kfqAHilS8rq03NieTpR+c0l6n1yJLZ0BzmZEtVo94I6xbnopT6w5lFNW4e9w2vtbFulVNd8rgX3sJqWFEeA3z72zbDjEQmEhkUFwBGvBNIUdWgFN3gl9UNMclFG6vrVpfxMGa09AD3yywBcGH0NP8nGfyiawj1QcM+SnYGxyoXnrMSCaQT1zPf4Ob1hpVJuWavPK1rdA/3W2wnXtVc614/R4Ev0jLV3AszVpHCsmsRWP7DapA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5d9c20-3d9b-4a1b-9559-08df2a7130c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 04:02:54.7562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fqL407ebFH0sxUZeeTUp2V1KD/DoASiGs57/KG12bCuQ0J9BMryF/T/Lw3WvveviwNbHCTvcBTcy28KLKsN/Mw==
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



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Mi=
ka
> Kahola
> Sent: 14 October 2026 19:14
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Kahola, Mika <mika.kahola@intel.com>
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

Also rename this too ret since error may or maynot be return based on the c=
ondition if a table is found or not

Regards,
Suraj Kandpal
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

