Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E138C9833E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 08:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314E410E8C7;
	Mon, 28 Sep 2026 08:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgFnICk/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCA610E8CF;
 Mon, 28 Sep 2026 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790585065; x=1822121065;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fnKEPcgl3q8HlV1xODwanoNlqu4aRAaJUz3aQLkUBos=;
 b=HgFnICk/n7r3bruShcBTq3ILdCplSex3BoPm/RvIQXu0a1fd0Xm+LAjk
 jKRx/KANMlDI8USjEtv+ltvpRg+aI4cv4boFlYle95wNkYMUw4RRsJyXx
 Jc3W8252v8bgpw9vymZ5mLutgbFIPFcNzjTBV8mKh/1IocL14GkQ5rLSR
 tnFtKauwQElNuNbbh12x0qa5Vt2XaxZSppwvgB9oEsQ0I2tZ4YXA45UHZ
 b9LPR8F80nwHWfOKmlvcJec4VGif0TaFuzBYgTU+KZ2R+Z8OHTMsVUBvA
 Fxaot1PGfx2RSUYmtcU8IBPyPs6G3Il13YEKH2lmXkNpiMKHi9xtdFyu3 w==;
X-CSE-ConnectionGUID: VQjvw6FtTneOuKzPd+Gacg==
X-CSE-MsgGUID: 21mm0qSmRVStJShn+X7OkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78840742"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="78840742"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:44:19 -0700
X-CSE-ConnectionGUID: k8qexaZkQk+ZQJ+xAw8+hQ==
X-CSE-MsgGUID: pgD259ArQ2inG2O4pBpFoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="274535091"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:44:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 01:44:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 01:44:15 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 01:44:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEn0Bq3lmaXn9Hr0za/WS/yrtzLZaIaSIUhvNtnAiIK9KeRt4e5ssxqkOp0TyuupSNf3mD0PYXjJ8c51AZUilm1u4+bFdGVpbakTEkJpZ7oWTHc3UY+T6Ge6GLRa3Qx+Df5FzwbayyvQABR3HHeaVL8sVDBduN4eoZz4E25wtH2HyxeUVZsdixeFbxUPZgJEwv89FcKKaBDZm8KN34HeUlepwKePU4BLmHg0CtRp5g4unScwkAvd/Ao1cBmHuGkSE/x8S5tajqGs5C4FVwLzeUdsOa4b1KDi6f1aYcVv1X0darJJZhYSEv7VSBLaxGZO71zTNkxwff5hh5cwLtyK+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTV/5CPQyQDsUiEybeO4eU/Y7PlhSmbf/Sd7p4qEhKs=;
 b=mTgJfIuo+8Kz0gkJ2CKQcJtLpRqbf4mP77H8jVuE/DzPU+erp030zUJCTw5rbOZQxRit2TmleoTU0BrjCEUCKEibFaRVl2Qrw7NXBZjnJf6gdtvl63q4qvagFOLVztojWYOZHgsufwWajnAixsL1ME9/Kx8yFuSTNucumXnuDNpuFIozwNAoptGFfOImX0C9u9Bldu6jbu7/+wGarhjuh6ZYDA1Ldw9fWmRO9XdOJ72hTJGxI2+NeNeJv8s0jsfPaG2+E1St8dUGCaPDe1lt8rSPD1DtvRd9twYIj2U+COBnfxD/ow4pfaXGZyojE2/l+kteJRN71Vo+Tk46dZQtmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by LV0PR11MB9838.namprd11.prod.outlook.com
 (2603:10b6:408:384::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 08:44:13 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 08:44:13 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Deak,
 Imre" <imre.deak@intel.com>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "arun.r.murthy@intel.comm" <arun.r.murthy@intel.comm>
Subject: RE: [PATCH] drm/i915/pps: Don't block DC states while the VDD
 override is held
Thread-Topic: [PATCH] drm/i915/pps: Don't block DC states while the VDD
 override is held
Thread-Index: AQHdTxBX5NbRXFSSbkKXLjZW4RbJ/Lbjq4kAgAAARwA=
Date: Mon, 28 Sep 2026 08:44:13 +0000
Message-ID: <DS4PPFE901A304F2F30F230DF7378468608E38D2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260928061211.2764543-1-suraj.kandpal@intel.com>
 <03e6056ddce4ff7c7e6f0dafdfe42a75e0beb203@intel.com>
In-Reply-To: <03e6056ddce4ff7c7e6f0dafdfe42a75e0beb203@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|LV0PR11MB9838:EE_
x-ms-office365-filtering-correlation-id: 927eb953-c895-46c9-7dd4-08df1d3cac38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|38070700021|3023799007|10067099003|5023799004|11063799006|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: kCcq4WFilSqPds/CKBnxjewzEYw1qByYGW6us0vP9mwqPWPyVQRKrYNwSP7M302imwljS0w+59XKweYpafHSLIEdWcBQdQqo6SJbt622yfJ0bdZhYlI5MRapb387LFSZuiwxfy9t9RD63daQsJzaBxIcRk+N8h1JH9QNBWpr9sq2CAleyHIEanpss1hewxQcNLA1wQ0PT3mdbfkSA06FM2DjH2KmuP72PBITilmtoeMFLVGfCdZuHrzRo+iyoNqUWCoo/lIA6sT5MncMbPYoq65937s5NiGb9MSGugPiN736nYGVb6ceHpYHMDtbFmT5zVCqXptohnYZw9uwXgPi2MFJIBEaw+o5Q3QOC9JMERSgyCtmVF8OVqfBiKE44+byv4NJICknlQdEDVZlGtXZxUNvdlvYEuKwG7ypAlm0mndowkkH7nEA7xV3AQyuHGJXWw9mg14J8QqX9u7Oibtb9R2h2VH96fyojluORlVZmfCOW0yiKoBe4qRcEVhu/h5oyGADFRMeauQElPHeUjcYMS3roRqlzA+S3pNRG8HB6EZUDr9lKQ9KjQeRF6wnu2jZblLa16FO1jVYz3eIssQ3BK5xbkiDx54oVNcch6PaDB+KO31z+cfi57rw+ydWw0Hf6ytaN65wLrAN7HIcpiav+kD/MiegSSDrMTeUJ8IEqKWFCnzuqNdPahY8uKYa+Q+pB/aWaWIGHNYMYiNQooM8UZ7Z6Zvdmupo7Z67BkRnI0w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(3023799007)(10067099003)(5023799004)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rSJ9Mg4hOixt0Qbp9bKbxPh9E0TlMcMuY53tgvUQgsJyyipsY2cvABjdS0UD?=
 =?us-ascii?Q?YmtnHqmyiTfT08OdhXH3tv9LQh4nG68dRljlOvLe0L87h/+ZWWJykjXd+iVN?=
 =?us-ascii?Q?4Zywbh1AasOVK1C2F3RBnf/8sS4k/96EIA6CHHq2TAREH9PwGuVpPtTSH1EZ?=
 =?us-ascii?Q?jbvI/YhoYSQTqgCCMuQ0E7FfEmybrtChzHNsqC5Jn1GlBrKkJaB58P71xciV?=
 =?us-ascii?Q?LWHHulyrBQtsvGyCxlzGHQd8KXxB76IoDxMi676TP8ZPK08sqiVUP9oGKK5e?=
 =?us-ascii?Q?mqvdGAacQKqdEZivSBSbcvGUvr5NTc6+ac2Bi4/gRUnbh+TsqObxz8EWiAOC?=
 =?us-ascii?Q?B5Pist8YGt9/o8PhJtxiqTlWgUvjnztLOH2IgdVA7457FPz/60rs0AXOcHOB?=
 =?us-ascii?Q?k5fC7FwjnJTlqQtbaTdFGqkFWluy5NOP2e5N9SUlRbs8Lq0rz5ELGSF/5PSq?=
 =?us-ascii?Q?Zuy0GVgVEdFyWqEyXhZXEzSgr0hWjD62TKE5dHsth5CNN2u4Jf2GEWS378RY?=
 =?us-ascii?Q?jOaCFQ2oWjU8kc268zfK5dpuBAmehcTxP6mOCkvwnr//LM7NsiTEGpGqrtfj?=
 =?us-ascii?Q?a1dpC4Sa/JK7F5dk36D5P4Hxzob/yEaQv0VOKxU0+0iPo+40jSMW0gzXtPGJ?=
 =?us-ascii?Q?JnUzP7a8v8WqxEXhAyCKSDpjzWznxsFQd6YkL9IqYLiSFL+gz2u+9/IzNP4p?=
 =?us-ascii?Q?iDrvLckHkbP5HcECSjlMqDBqXCuO827OcktkIEpOM/2HqGmWMtuKqV91DXZk?=
 =?us-ascii?Q?nlZu1xZ7vPsKkaKisJMfD3fZWEDvoY/YxqpL/Z9OH6G5CzwyhQojoFKwKVQ6?=
 =?us-ascii?Q?1pnpFKlRpxSMFw/036k0HGZQvpSRpHIHlxwTSSG+F9TdksVGRFwRJuFDJsvO?=
 =?us-ascii?Q?Q0BcB0S3KjUPiNfcOcFORZpDUWrStEj67G/077itD2pbElUZOPv6ON95E899?=
 =?us-ascii?Q?qIFh9rLgmUpeQ3pwOMdFBulN6Ou9Juxs7sF5Qcf7/IhESdCFsbwtZA/nthGO?=
 =?us-ascii?Q?5CbeEcjc+bh7Ws3llHtUXlCgqgz858/j6OFl9wle6MJ3noG5buSQ8M4hhvNO?=
 =?us-ascii?Q?mvn3dqH2NIjghlXmnksEKtrDL5IqsvrrAKD8DT8L1T3eeMi5U2CzVzeW0OT0?=
 =?us-ascii?Q?gbYgts64GBmkpk7oE9ojyoAtEzctJasSIHe3O310FgULJVMha1q67ZRas+57?=
 =?us-ascii?Q?H1X5DwKGmV22PURWaRE5BYUOQKF06/CMY+yc/jk47On1pkM4pNoUxIQD0/f/?=
 =?us-ascii?Q?F4um22PbzFn+dzLUzMljwm6GbgTKyUJb91/8k8Xg5AEbqRDFXO25/c7UOpBg?=
 =?us-ascii?Q?TTuKBqsMT0wKyjAfQQXSYd4RyWcT65l9wqUg7/ffOqvvV2DEhrJAU3o/Dk4K?=
 =?us-ascii?Q?NyBtWc/myxv04imSf40sdAtejeFzXGDHuJsDKBfdhBgqVKI9RZBw22p4t1FM?=
 =?us-ascii?Q?dmes5fvo25R/ViRl7Co4rmA3aWLADZ+jXUf8FUq3U8uLMI+UuSHbDmJD4Mw7?=
 =?us-ascii?Q?t+g4Ob9wxhaUEKjrG89eUSum6DPPTv3eqYkC22Mben3WzYTDT/Wt/ADlO7kY?=
 =?us-ascii?Q?Q/Mn0oc1Q/fn2abwYSYA6Z91c64eTJgDdhJL5Y8ve7lw01/ESPmfo6okADKA?=
 =?us-ascii?Q?Ei32zdtixyu7AGD79qtOatGmvlMMdpiH9D1Exlid//bGMs7cTA8QP4JVgeDI?=
 =?us-ascii?Q?hz4KtaZDKj81kS8h4CMtTpwlm1/RxTnGD2pZDkFvXyBFWrla0Vnm1C2Hdsd7?=
 =?us-ascii?Q?9VMAoQe9qw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4kBljdsGCq6LR7J6ATzRqO0aulHS+nwiF2QWRC1o3Tm17NId17Jq033LEZ3JEhS3yjSi7+cwIyt9GUKglZBM1Q1dyjmw5qFlQ/u8lSOvbdBA+9KZXNOBPyallye+GBqWY7p+FW34PVyfrU7+lRLOuiRJZcDd5myzAbkJ6Zlk0EAEs847FR+TsCfK3m4Hv1fTVoA5DKMowR2Oz+UCqMxYPFSfKAjo+2kr7oGKJSVpnqQcyFhOwPfZm9jKRmJKprhkf8NtkxMlHOmTdjxEpLJJQZrw28VilTmdtwL+yk9e+HM1SbweA+ODUnU6gP/utg09lzPInZIipt6hkRDENA3Ksw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 927eb953-c895-46c9-7dd4-08df1d3cac38
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 08:44:13.4474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NJ3xnocr1Qsa9b5u8FjKAUUxGprTB30j+fAJV7L0sxABWvn4cO97Vc7jMPnpTD8+SrY0n1fWlFAv8eo8jS0IrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9838
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

> arun.r.murthy@intel.comm; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: Re: [PATCH] drm/i915/pps: Don't block DC states while the VDD
> override is held
>=20
> On Mon, 28 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > intel_pps_vdd_on_unlocked() takes the AUX power domain and holds it
> > until
> > edp_panel_vdd_schedule_off() drops it, panel_power_cycle_delay * 5 ms
> > after the last AUX transfer. That is seconds on a typical panel.
> > The AUX domains now block DC states on Xe3p_LPD, so that reference
> > keeps DC_off up for all of it. DC3co arms with a 1 ms put delay and
> > never gets a window, and its residency counter does not increment.
> > Nothing in the panel power sequence needs DC states off for as long as
> > the override is held. Take AUX IO instead, which powers up the same
> > well without blocking DC states, the same split
> > intel_ddi_main_link_aux_domain() makes for PSR. AUX transfers still
> > take the DC state blocking domain around each transfer.
> >
> > Bspec: 49277
> > Fixes: 2827c44f148c ("drm/i915/xe3plpd: Map AUX power domains to
> > DC_off")
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_pps.c | 21 +++++++++++++++++----
> >  1 file changed, 17 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_pps.c
> > b/drivers/gpu/drm/i915/display/intel_pps.c
> > index d4c98b150fa2..bdbaa10bce23 100644
> > --- a/drivers/gpu/drm/i915/display/intel_pps.c
> > +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> > @@ -11,6 +11,7 @@
> >  #include "g4x_dp.h"
> >  #include "intel_de.h"
> >  #include "intel_display_jiffies.h"
> > +#include "intel_display_power.h"
> >  #include "intel_display_power_well.h"
> >  #include "intel_display_regs.h"
> >  #include "intel_display_types.h"
> > @@ -734,6 +735,18 @@ static  u32 ilk_get_pp_control(struct intel_dp
> *intel_dp)
> >  	return control;
> >  }
> >
> > +static enum intel_display_power_domain
> > +intel_pps_vdd_power_domain(struct intel_dp *intel_dp) {
> > +	struct intel_display *display =3D to_intel_display(intel_dp);
> > +	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
> > +
> > +	if (DISPLAY_VER(display) >=3D 35 && !intel_encoder_is_tc(&dig_port-
> >base))
> > +		return intel_display_power_aux_io_domain(display,
> > +dig_port->aux_ch);
>=20
> Seems like this is something that the power domain framework should take
> care of instead of hacking together locally.

Actually it does not at least not for Xe3p which now has DC_OFF when taking=
 AUX domain,
Because of that when PPS take AUX power domain it also takes DC_OFF(exiting=
 DC states) which is not required
And since it keeps the reference for longer than what a normal aux transact=
ion would DC3CO does not increment its
Counter.

>=20
> Cc: Imre, which you should pretty much always do when doing anything
> related to power domains.
>=20

Sure will keep in mind going forward.

Regards,
Suraj Kandpal

>=20
> BR,
> Jani.
>=20
> > +
> > +	return intel_aux_power_domain(dig_port); }
> > +
> >  /*
> >   * Must be paired with intel_pps_vdd_off_unlocked().
> >   * Must hold pps_mutex around the whole on/off sequence.
> > @@ -760,7 +773,7 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp
> > *intel_dp)
> >
> >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> >  	intel_dp->pps.vdd_wakeref =3D intel_display_power_get(display,
> > -
> intel_aux_power_domain(dig_port));
> > +
> intel_pps_vdd_power_domain(intel_dp));
> >
> >  	pp_stat_reg =3D _pp_stat_reg(intel_dp);
> >  	pp_ctrl_reg =3D _pp_ctrl_reg(intel_dp); @@ -862,7 +875,7 @@ static
> > void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
> >  	}
> >
> >  	intel_display_power_put(display,
> > -				intel_aux_power_domain(dig_port),
> > +				intel_pps_vdd_power_domain(intel_dp),
> >  				fetch_and_zero(&intel_dp-
> >pps.vdd_wakeref));
> >  }
> >
> > @@ -1064,7 +1077,7 @@ void intel_pps_off_unlocked(struct intel_dp
> > *intel_dp)
> >
> >  	/* We got a reference when we enabled the VDD. */
> >  	intel_display_power_put(display,
> > -				intel_aux_power_domain(dig_port),
> > +				intel_pps_vdd_power_domain(intel_dp),
> >  				fetch_and_zero(&intel_dp-
> >pps.vdd_wakeref));
> >  }
> >
> > @@ -1336,7 +1349,7 @@ static void pps_vdd_init(struct intel_dp
> *intel_dp)
> >  		    pps_name(intel_dp));
> >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> >  	intel_dp->pps.vdd_wakeref =3D intel_display_power_get(display,
> > -
> intel_aux_power_domain(dig_port));
> > +
> intel_pps_vdd_power_domain(intel_dp));
> >  }
> >
> >  bool intel_pps_have_panel_power_or_vdd(struct intel_dp *intel_dp)
>=20
> --
> Jani Nikula, Intel
