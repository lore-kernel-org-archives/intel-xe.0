Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9953FC9830D
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 03:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3823710F2BF;
	Thu, 24 Sep 2026 03:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIqMrYBU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1A910F2BF;
 Thu, 24 Sep 2026 03:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790221256; x=1821757256;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VhqfslLM52lvxZ4wLsMfqJYldY/JxxCphfyXK1eVsHw=;
 b=oIqMrYBUAH7uuVdSqfC6XP/8AR2XnAXEXpY02mombNDwFWkeJJLvX1LD
 B9qCLnK8exEnz15L+zckv6bGFYnJgepk+XGj13OUA2LWrCHWB0sEOcLpE
 nfUDuGeJROfr/iGnqrbJacujFeNdSTAWZLr0OIGMr83NgSsWqTGDpR9ps
 nIpqxgsYj5+HJ8tSi8kAmgU65WoCWAAF8LwAHREuXirDdRIIHMz6ybX8w
 zDXsRiT/QSGKKZf37yALqvpBsuOfN2SZh2CkR5wT10Tuo2RgU/lKBGlVt
 2FeWaRAJikVBPMKE+2tss/4ECgkkbIrkyU+h6ieHwzkVecHeg1w+KE5kq g==;
X-CSE-ConnectionGUID: AdvIgWItRt6R3Gr2JOK92Q==
X-CSE-MsgGUID: pLAklkegSaSewNAS1nN+DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89888079"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="89888079"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 20:40:55 -0700
X-CSE-ConnectionGUID: biB2s6Q5RuqyTokE3/DLmw==
X-CSE-MsgGUID: zZrgc3EwRBaKJjlY2LLONg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="273082987"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 20:40:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 20:40:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 20:40:54 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 20:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzyQ+gjx9H4HIeBxc3rB63rExkJLAR39oCo1s1UWU9AtRvF3wYcu9qmIyP1g4FnqtBJKoUNfARNvZpcZ4nt2vZJDcw9MzuBFmYCzu/Hr49+A7qB8GciivaghrJuRh1q/mLk8/wAZyFJ6yzfs/PRj6oDTFHgtCoBUDatl2UPyXAmXKhrI7shXgJdY54PvIJ+9l+aL1CyN7T6R4P7ePn5yjnLRDHHf8w3YDjL7jdPQ4JprPzkQAh9iL2BpFcf9Otqq6Aue2tUaf57ejchQ/wYhSrIsZ5helmn0d4M8XGT33aYCOkTw/q1h5XoZY1lZqYqoYfiTI7GeT98OzzZhlIcF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAnxcXnICSASLch9+pLQwo/QIgc8tpc729Mxtc3Ba7A=;
 b=ITy68r+I9GtyseU6UI2TRYn4CCAwkPiymvMnkWxT7/oZWMp8Lu6y7KzqELudOBsEwsg/CioRbwMqwYyzk/+pbN/bxi1Ej9/X1CaZepcoDkOHLRzGJxyqwSAQwHnx0sq5zlOzBnpUP5HdQ2wowGsu9E91zwuliojo92vpbpThKhuknNWUg2uDoMy7L1n1omqlRVGFu+pYRHTq2DnoFqUumjU28QvqrJ1XRDSHwnyddiff3Hh0ZGayQnxrBHpc1GDh5UuqFk2Dkhc1O848QpeW1MQjloNstpfAV/AJio2bUi1PKyRdFWmr9vIcgyfaoLNo11v2zNyz+0eNCfFX0suT/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB7721.namprd11.prod.outlook.com
 (2603:10b6:610:12b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 03:40:52 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 03:40:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v2] drm/i915/display: Update the CMN_SDP_TL in fastset path
Thread-Topic: [PATCH v2] drm/i915/display: Update the CMN_SDP_TL in fastset
 path
Thread-Index: AQHdS81+aHDHYHwrN0es8KUtsOWRFrbdFSjg
Date: Thu, 24 Sep 2026 03:40:51 +0000
Message-ID: <DS4PPFE901A304F74C57373B533C00942ACE3812@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260923133307.323439-1-ankit.k.nautiyal@intel.com>
 <20260924021950.350207-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260924021950.350207-1-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB7721:EE_
x-ms-office365-filtering-correlation-id: 9c8df881-3ef2-4ca2-6cbe-08df19eda1b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: dhkPzou9nfS2gbY1cGO2/vgw2kseZJjubDyBPp/BLwBWnt8u/qWXQnRMzGytFfsJX+ttscvlKLRrRV5pOz1Ruj0dqWiKlGEknmHFPi+AxLWCPKYAB5vuxRvRWB0mI0E81gWK/0jFwAArHvT8GsgHVo0IuGkpWB3mdbokBfSd56hoMvYZRyK3lyBMsGzMCd/8p9wB4AMzaoI46Oayj5MunaLoPhxRGVJS/KnHi6+rkJzAB4ucLV478k0TgIbSCOZIF3w9d25V6SXf82vK0SkruzX45/9y1zhhDCRr6Tcdo0wnfTpBtN2jPuDcHdGA9gv4fPHyrQsdz8Rzjm0CM5ZeZucMIpRORmFp9XGj+kPg/gsLUMx8LirD20liX+UqO6CPl82tgOou5oT5IQzB6DySPkXbj6INM7kw634rbQiY7tIhAaCj3LCukByUQ67m0dXPFTvUkKDhihEOVzNFnLL9C9tuYKwkt3Cc18nkJTh81E4QsEmlCufJ9zEjmv4VmYsPFYaeNOmOH73Yoayqnxj1Olw1+IG5MsHsOoDpH/wtT2vV5RCP5399MIXbKU414c0o3pConOCNGEBtt2hdDcZYgOgr89Nw1OBRlMOQDkSvuM9ptU6yOLA49YmRtXF1+N407z+Cs/eRAwSpW/0hDr9b4KVdykzNA7XcpOCqypPbdXRL1pr84kHVvrA3nYkRLMzAblx2LhqtVORrwkH29oG5zF5dX57gvxrUOc8+aR20jHs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ovF/6xm+iVgHzRPqs1fC426XJDd5dncLrvq9tBM9p06IIQqRObH34ixrb0Q0?=
 =?us-ascii?Q?NpRbsHCCxpj6V700hOJ0wXO35iDDw3hecEfy21h1icwk896BZ4LCFRUYWngR?=
 =?us-ascii?Q?phgn3GtmcoljLfDyA2tG0H2cswHhNKvUYZkY+/im0pPdWsvmaiLG0JHdv5Pm?=
 =?us-ascii?Q?fi3K9+CFRZhR7VyGmsZGjpVkjKopgp+O5WxvoX/XHZfV7hLd6Hi/xTa+8+w4?=
 =?us-ascii?Q?o3+grC8u3swHdeMNrqKNMwiywSJHupzJKWYEiZBN9BeJ+v5Ia1kiOEtPF99F?=
 =?us-ascii?Q?ea58Ou9EEwxDjlarZpU/eaN2tv95QGJvA3Eqr6DrvMbcCjQDfe+TNBuDxkfc?=
 =?us-ascii?Q?18qAQtmS7CtCBxUxJfRvd8Bt71o/T+LImDqpVfrsLg3GssraRqfYn0LMFBlv?=
 =?us-ascii?Q?aFwIlxyVRyZolaWFi6S3FGCd6XRiES4G3P4k+hGfr3dnnqE+5vyDhZvhdBQb?=
 =?us-ascii?Q?MjW/f5gBtTpVqX80wC1tvUT3xYJjhevd3UxB0xfwIzNMc22ltucbve2EQB8l?=
 =?us-ascii?Q?QKNxh3aI+PmVHXcFrdDiq8aUmPyPEabRJ2oLVWiGtFaNygfjhjXaujgwHk5G?=
 =?us-ascii?Q?DM+kxfr+2KFZIFL9oCUxDrd42eTGkVvorTuQHv0QVv0rxwXXB3wwNYWC2+jc?=
 =?us-ascii?Q?kiy5rdwn/v4TrdPkZhiYPGPEPMyXne+/00DaIJ0G47Uf/XNnljxVAep5bno5?=
 =?us-ascii?Q?RwIbDa0E2+Gfm2t7W4Ojcf96PFAtG/NmVEIavT1iA3HyyyIFGywWSm0Wc+Se?=
 =?us-ascii?Q?ynDriFSe3CR107bLiH7sN8wVQ55I4domsXCXJZgChC8pjjV0bzlI7B8Ofy3H?=
 =?us-ascii?Q?gOr/ln8P479LgtGBchMNba5B62GRP06+FLqZdSA1sIYPnEvmmW1lRPMrBt1Z?=
 =?us-ascii?Q?a3t/6Ohim/i+0dS+4zatv3nx5YlmHlRxCejgofGWK7Rf2A6QGPAQ9cBrHjnC?=
 =?us-ascii?Q?lwSNRY89AxndAsTCQd760bIBKK0u7zKGsNxpPNwtuwCYgFKRepbi9bVixpDk?=
 =?us-ascii?Q?++TQwBggS8Z68rKu7omYpM0JVItc5sKeqfgDGTm24vq9/u0f0xvPCj7eCxtF?=
 =?us-ascii?Q?4zkyy9irRXMMCLX20X0wW206aMuLtP0kHYHSltL4A4527JYTmwEJKc25DDkX?=
 =?us-ascii?Q?DfZI8WDRlhnlJlmk8VyLM9JH6ej6er1S57L1VzRZixMWvPxqwFP758Ie3Cdh?=
 =?us-ascii?Q?IdIdG6g5aedTsgfLdq60zIZt8ApoisOUwqnYGcvtguGmgikOYQq3AG+lBN2L?=
 =?us-ascii?Q?DHfR8DRqTvckLDI18vSzPHtTO3YC7CojYcK9fH8hLQ5n6w2VkvRtp2kLI78s?=
 =?us-ascii?Q?APxNe/usMa0ssOGwKuwDvvHwARiTkEibUS+uk+5iYABnAERSwF61jsDV7CxY?=
 =?us-ascii?Q?NfR0t7JkcTsai98YunV3KsIydH576FnNxnrSrep+iLwm6woCrtyjOhTLs9Ae?=
 =?us-ascii?Q?rGKM+bF8YcISOMrj1im9zekBE1ql63B4P7rjGerWjUy10myUfdlxnlV5bq3/?=
 =?us-ascii?Q?dEp9+4IOM0eyr1jualYUjJTtIyCwfT67Wx9MaBGIviXvLLD6W0xS9n9VjA2u?=
 =?us-ascii?Q?B3PQW2G2hYTavCqPtIeUdedl7Nf10UR0nVF3zfYp781j7XGrr//Q/VfwT+zK?=
 =?us-ascii?Q?G7h0nLFeHfFLnSmJyTjEXzdyT8eXhSgFhjvFs/tG/yEUaNkSC2hNcD1ODizy?=
 =?us-ascii?Q?8xPvQSaYV7k5BVqQAsPjjmaveEWRudAT9zSEf20GCMISmA6f++g0L/MkUAS5?=
 =?us-ascii?Q?gxLc8Ylg0w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ytEnswAhy7ZwziaMTkjcB0xRnkx74xTaJkRs+8qPvLqkkCpGgvZR6rc2yPUX4vSJjEKVy+UoBmkO0odi9+/S/0WYdcny/in4sJutCw6oOaGv85/ZodATS8KqoVnYKBrsbuJO+vRR4e5b/hkXOrvCa3K6K9OYVouFjZ/ge7S9VMm6C+zWUmonUxiTC4QuGdcN6x8c9LMwXu1mUciZhnoknIR8ZNfu1OLHxAimKNme0VLEo/+qs5r7Lr3QCLMamUYUSLfMNa287vgEDkXA+cUn6R1p3gI4I7FEzoNAh5ccyD28In+lZMdbRw8jcxc8mFmz1zZKi6G0by6d/spOg+7yKg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8df881-3ef2-4ca2-6cbe-08df19eda1b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 03:40:52.0504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xa4PN9fPPGa30wSEDhhNM0lpZADXq94R8XiaZiP+zRQml7ZP1E4qwHsvE6E/GG5A8N8bWYaeBEA2lLOVsb8h3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7721
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

> Subject: [PATCH v2] drm/i915/display: Update the CMN_SDP_TL in fastset pa=
th
>=20
> Commit bfa597238073 ("drm/i915/dip: Enable Common SDP Transmission line")
> enabled the CMN_SDP_TL for the modeset path, but missed to add it to the
> fastset path.
>=20
> Since dip.cmn_sdp_tl is already skipped from the strict pipe-config compa=
rison
> during fastsets, it was always intended to get updated without full modes=
et, but
> the update to the register was missed.
>=20
> During a fastset, if CMN_SDP_TL changes, update the register similar to t=
he
> EMP_AS_SDP_TL, which gets updated in intel_vrr_set_transcoder_timings().
>=20
> v2: Update cmn_sdp_changed() to also compare gmp_sdp_tl, pps_sdp_tl and
>     vsc_ext_sdp_tl, not just cmn_sdp_tl. (Sashiko)
>=20
> Fixes: bfa597238073 ("drm/i915/dip: Enable Common SDP Transmission line")
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index e3e0d2f8faef..d5d4453f283b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -69,6 +69,7 @@
>  #include "intel_cx0_phy.h"
>  #include "intel_ddi.h"
>  #include "intel_de.h"
> +#include "intel_dip.h"
>  #include "intel_display_driver.h"
>  #include "intel_display_power.h"
>  #include "intel_display_regs.h"
> @@ -999,6 +1000,15 @@ static bool cmrr_params_changed(const struct
> intel_crtc_state *old_crtc_state,
>  		old_crtc_state->vrr.cmrr.cmrr_n !=3D new_crtc_state-
> >vrr.cmrr.cmrr_n;  }
>=20
> +static bool cmn_sdp_changed(const struct intel_crtc_state *old_crtc_stat=
e,
> +			    const struct intel_crtc_state *new_crtc_state) {
> +	return old_crtc_state->dip.cmn_sdp_tl !=3D new_crtc_state-
> >dip.cmn_sdp_tl ||
> +		old_crtc_state->dip.gmp_sdp_tl !=3D new_crtc_state-
> >dip.gmp_sdp_tl ||
> +		old_crtc_state->dip.pps_sdp_tl !=3D new_crtc_state-
> >dip.pps_sdp_tl ||
> +		old_crtc_state->dip.vsc_ext_sdp_tl !=3D
> +new_crtc_state->dip.vsc_ext_sdp_tl;
> +}
> +
>  static bool intel_crtc_vrr_enabling(struct intel_atomic_state *state,
>  				    struct intel_crtc *crtc)
>  {
> @@ -6924,6 +6934,9 @@ static void intel_pre_update_crtc(struct
> intel_atomic_state *state,
>  		if (vrr_params_changed(old_crtc_state, new_crtc_state) ||
>  		    cmrr_params_changed(old_crtc_state, new_crtc_state))
>  			intel_vrr_set_transcoder_timings(new_crtc_state);
> +
> +		if (cmn_sdp_changed(old_crtc_state, new_crtc_state))
> +
> 	intel_dip_cmn_sdp_transmission_line_enable(new_crtc_state);
>  	}
>=20
>  	intel_fbc_update(state, crtc);
> --
> 2.50.1

