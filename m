Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6103C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 04:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1F810F8CC;
	Tue, 15 Sep 2026 04:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yh8/V5Dy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D0110E848;
 Tue, 15 Sep 2026 04:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789445007; x=1820981007;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ssb1fvt/h2H7UXs9cEgJI4t3b9v84+Rn05gAAAaCYnY=;
 b=Yh8/V5DyQRxeyk4Z7EvFgFPQabs69OxaPZLE44Aj3/dAuH3KqW97SH6r
 GUkWXvOx0ULIV4Ua+zYByaM8j16kdJuftVx/5rvu7mprrKrvRNTVYe8sp
 PJZFPfHbW43+5HXlo1hgXhxZfD4aqpd0ZKfmzsogj7Z/f30RShmDJmDVV
 XU+gwhj4U9ZF6BHbSboTpDvd0YqglUZI4AuouaCRoSNiA2hGM2dIBW0/e
 HvLSHxI++PIKu7sztHh0Y0Tioh5MEA0/0983bKC/fyYowpeNfkWUii5pS
 NLPsu111xbXM4MreBpb603TG6EI23Ytmvo6O/J9ldshu3QfX6Ht193ZUP A==;
X-CSE-ConnectionGUID: 7CnpzsgHTnK4Qzh2wY7HVQ==
X-CSE-MsgGUID: nQX9kkccSpmWNpEhzDOvTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89842702"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89842702"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 21:03:26 -0700
X-CSE-ConnectionGUID: 52I8DIVTToCJQ/BK8gnNCg==
X-CSE-MsgGUID: aLxB8vEbQzWyB0lXu9i4ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="273352522"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 21:03:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 21:03:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 21:03:26 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 21:03:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiybAIaW11yQfltmebUVbamQv//uK63st9NuL4SwJ+5hy+RYhhYR1BqKF2patiZrTI5ArhpW2Nj873IotGa8CJSmhBuBjKUBYPbQIPUVbbSG470Fi1ez0zwdWyc+BiwE+1HQufbJuQ9vKCj20SyMUhkAy0KY/NRKTx3PvzKrboLoSZsmLQSgXxR3NYimIEQLxD+a3THjajL3lvG8G7oe/Lu8+0PwQR/qteRXjRtL3wtVMWlZunvkeaiH01Lm04l7LSXOapuwO1Ci/v268pLodWTTPoPIew1Rj/0p7DlR7JLQkeAKvzqubR2E8xpjHwccSe1ny4OwcqiG2Hklv1kDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIgOOumeFv4qBFg2ZEvExYdBIo3fM33JbXqNodrY1dM=;
 b=kWYZ8lddmtxjcljJlRDqc6E3QMxjCPSreGHc1GeAWWRBNt9hjfhI/pCnPnls8604fc+891kGcWAQP12vC3AP/KC8+567rwUsFCvTgcP+jrvK8LH2v2nYsAz5VzvslAxcGq/qTQhlFysEfwT5bJYRSKYqZuuN6LMQx9Jna49jf/UbU9Zo8UxlgzHBV8L9XqBj7SgK6kITJHjRq6GQ9gnKvqcHfs+PqH9davd5Q5MYYOgGSpHBMQf8QvtUIXz5M9K78njdLuC3BZe39rkug2JX2cHMwTg389d00Okns5rcgT2owU3ostiLuV2lpdGhptOemLoX4M/WSeUaOYsKXTYZBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS0PR11MB8687.namprd11.prod.outlook.com
 (2603:10b6:8:1be::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 04:03:16 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 04:03:15 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v6 10/13] drm/i915/dp: Introduce helpers to enable/disable
 CMN SDP Transmission line
Thread-Topic: [PATCH v6 10/13] drm/i915/dp: Introduce helpers to
 enable/disable CMN SDP Transmission line
Thread-Index: AQHdQ5J5Grayy16QgEKonUXuGXQwo7bPBv4g
Date: Tue, 15 Sep 2026 04:03:15 +0000
Message-ID: <DS4PPFE901A304F2D1D0A483B9A9AAEB76FE3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
 <20260913145649.3240904-11-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260913145649.3240904-11-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS0PR11MB8687:EE_
x-ms-office365-filtering-correlation-id: 45f41f36-5291-46c4-97d3-08df12de44f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 67eKWGAe/NBdTK+D+n3EW2YIWBBjX+0kad5ERn40RAUBf0/0dzYvJ/n73Kmw4iUBJKlHBBKaKXeNiFoh4LdNyVXpKg9YgqPSJDUQr4EatFv9Uh3jzY59u+ORAbtg1NDiTuKimeDSUhtYKM6AzdZa+axadVT3urSHGeo3d8x5ALztTgggOKvjyO79uzRZ8boqjgYrSx7VQaVRw+TISpzjdr3dXpD7Mkw8yweGQxTPTCyYy14Sp1qAsVBwGXMpn4Y21pTIJvTNMrBaB+J/lGNFtEJm1K0Br5h9roirMSMxhkeU/pSCKR3Nj5rSLMnARuv8ax9tdbPwUTgde34LnDcdpmNaqnZVo9Y8V4AiUUKjGM1fucotXY560eIYCFxRWEtl5NFfA4pb2THoUpIXSzg8oDkqrtqF/8U69Y0vkaXgFjevlIG06X7eBjrncq/IwTjIl/WCoRJwQSq8HwhgQBxGgWO9lGpDjGXqO4vBUHN+RT9kWb3B6NtMKt0eODusdZo3WrAAqYxEP/KFWJbei6q3rLy1eFr5eQPUKibluThF9HjXfmAnUkh7K3OVq9cRM59hs8jScJErbUkxfcHk7bQyx7gC95pD/oBJYTuy15iOFwdnSGR3YZHTN4gjvgcqDzcC7u1vrcriea/sSUgjZEzNem8PwEnOQHJle26QZNXTfhAkpgsMKQL3qmkJsK6sXNgYjVZg5RSEK/SVhArKLhG9P9F4gu/g8JNSghxP51q9i0s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mCp8+N6aAX1Dydr6tcOu29xpXzSBcR9I4iWPzKrdqIPxaZItZD0ssSEh4/Bg?=
 =?us-ascii?Q?WYG6L7FIvodIHTFXUhQxdKk/nMdMzx2v0TQHl+vOdXLkPmbSFO+1voj/WQtM?=
 =?us-ascii?Q?radzuSaxdWbqOJMktxpZ7yzpTAf8i/P7/y+LK3BHUosLKvXs5L4Zk8pA8XSw?=
 =?us-ascii?Q?7e1FZRR5tEka1eTa1/pQL/Jhyh/MY08+vZuGfOyB3rWJuHdcZVu8DbWHL6R0?=
 =?us-ascii?Q?gHImj5UaNZr63L0o/QkcjMmPAI5KZjY8ufSWN8EIXwkVie9MarmX2qa8ue93?=
 =?us-ascii?Q?sJ6J2+jrpSU/+UPJFy4J+vKQF2Pb9Vobu5uasRniCMDblYiboBq67NzdKIoS?=
 =?us-ascii?Q?CGAeoSm+WtLlcUugDQdSak0EX4LquSse6eTCiQ18luVRn2D5I8tYZpKYr/Zg?=
 =?us-ascii?Q?tKN0gF8XYpWAZOW8Nu/ouJhThUP7IpdHKDTH0zQw5Dvw+kEbHvPfagoLPqAr?=
 =?us-ascii?Q?J/Iq311uER7s2tcL61WLAJR/ib2QhWa5h17BuwNaZ06x0EOPhNcF+jmdCRIc?=
 =?us-ascii?Q?lnSh7m1tAxDa6Ajqoec7Un27Qnb70C+bID69BlYa5bmavbb/xOUMXzkMXfiG?=
 =?us-ascii?Q?pGRQ2fbCob6D2iyAcC3YIRE91TsHHVMgFojsSMiQUJ4EZFwIxdm0ysv4ROXM?=
 =?us-ascii?Q?HxGGwunNzWpDUeWrxeVh7mP0NSdwdMQzK+Bb3QcCPhgRXyQHfmDRclgRSj1n?=
 =?us-ascii?Q?oiQd7PTO/AJ4RfseQwbPaOZQuCBFLtjglkL42vkj50Dy+jJVJMm1T2vJUbN+?=
 =?us-ascii?Q?T/vKoZLLPwdzQbCiaoTbzzpbWxhPwhLXQMFZ98Be8p9unf2QJZtAu8UVbleH?=
 =?us-ascii?Q?cewP6thYbL2UJgfjkXC5G8wL3W1dsJg33cBNJ/Z0EGH5QzY28WkFdbKKwSff?=
 =?us-ascii?Q?Y7Slnov+EsCkzimna6gUiemfkm8X9rhnUh9MUJ5Sx7yNG0Uu45p47dKIcexe?=
 =?us-ascii?Q?cGMOKt+PJ80GAkTV38WxKyJn8p3vt4SPYXfdg3RW++/ZRp8uLt3dJQQUtJXW?=
 =?us-ascii?Q?iL5nkp90sNORdfeX5bMdWn80s3vLHvhS/bmnLumEBZfx+psXbs4vux6XjWvu?=
 =?us-ascii?Q?V/VtLd4LsTbfb0H6Cy+Pto5+EhoZBB1gDhq3nYdBibRMtlNwzkKxME0W/Mkg?=
 =?us-ascii?Q?gAOnSaiB51/Vat20BEg3DestQMEH2Kg0uQR61lSVvDhdqqURm34calYsg5Ki?=
 =?us-ascii?Q?2DpLnXQWVw5BKwXpm99FFVbA7t9is7okkYTxgF9MYg0fJBaZsczmngjojHRS?=
 =?us-ascii?Q?Nf+8b3JIDzaHavvtaC9fckU5vYWwAP4dUJFV/imyD+DUcAmUE36j5IFbXxos?=
 =?us-ascii?Q?BwY3F/LEYj/OrjNVz8MTwDYMNMu0lRm2t0N2j39QCmYY0fA7gFU6PSc+6rBg?=
 =?us-ascii?Q?v/htgrQheh4KHpeyibr9NCZtLnN+Oq7ke/Ka0G3ZiHuviybUGCpN4/SLxZbc?=
 =?us-ascii?Q?58b3TIn2XA8QCdNcmk8Gdo4vgngcUpYnxre4OEffPOX2HUbFCaNXz+aCppJS?=
 =?us-ascii?Q?JDtjrDRKfLEsOQlrKmz+ekagy00MzwxBZq64NsQ8wls6fq+QhVo3X5oKUhqW?=
 =?us-ascii?Q?bKdf2YnTe3e4eru7BaUPUvI/jLaJtwbyq3lSzmguQzxLddsistF1hd9MR/OX?=
 =?us-ascii?Q?jmDPv9Y691x1fEudyZeA9jO8AmiO02vMMdjySksLgOhbXRiZktsYwwTt2qJk?=
 =?us-ascii?Q?Ah4CM6wY1TzK6N6HZ7CoUCqhz7LhvyRAZrhszQeN4a9ZKpoSQuM16EETbAvH?=
 =?us-ascii?Q?cGmrQxfPqA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OiibZJNmu2+uIgY/fItVWsFgfBDQfZQmAMI8fgg+2lLFCvx6PZ306xAjo3SvGPxI0BEvO4ywwZ4fAUr7o+pNQFTbxVxUkOKKZcMO7Gxn1c0Tr1v2Bz11TPYCy5S9uEjsdd8rnXjWgpjr3TNqzeLP00W79xh/eNliCgUvtumLjtqKBCNz0QfzbjMvLkrqBpL+TGsmGv+KphZ/cIdy6kEIjYwTB1ZQDdCVkpvATOxPnEn6+FxYoO+D/MwzShatpsTL7iTrD3bBwkJiC9WEa/iVq0KLOKrkisdgRJbYraDPk58hOmq26Bc6ELUzfMa1OzCQzwMsF7/5HzEfcjWnIaZ+oQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f41f36-5291-46c4-97d3-08df12de44f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 04:03:15.8434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OzvD3pjDpnpsvzpBKoxHJAy3vS0Z+SGVOnwKCK8n9CqldhRhIlwngu9SbRR3Kqv26OyEfQJ/APGfbdioKI4uSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
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

> Subject: [PATCH v6 10/13] drm/i915/dp: Introduce helpers to enable/disabl=
e
> CMN SDP Transmission line
>=20
> Introduce helpers to program or disable CMN_SDP_TL and stagger registers
> using the state stored in crtc_state.
>=20
> v2:
> - Use HAS_COMMON_SDP_TL(display) instead of checking crtc_state-
> >dip.cmn_sdp_tl,
>   since 0 is a valid transmission line value. (Sashiko)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dip.c | 56 ++++++++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_dip.h |  2 +
>  2 files changed, 58 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c
> b/drivers/gpu/drm/i915/display/intel_dip.c
> index d1acc7eb5a39..f8e8577b2755 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
> @@ -4,6 +4,8 @@
>   *
>   */
>=20
> +#include <drm/drm_print.h>
> +
>  #include "intel_de.h"
>  #include "intel_dip.h"
>  #include "intel_dip_regs.h"
> @@ -61,3 +63,57 @@ void intel_dip_sdp_transmission_line_get_config(struct
> intel_crtc_state *crtc_st  {
>  	crtc_state->dip.emp_as_sdp_tl =3D
> intel_dip_read_emp_as_sdp_tl(crtc_state);
>  }
> +
> +static int intel_dip_sdp_tl_to_stagger(const struct intel_crtc_state *cr=
tc_state,
> +				       u16 sdp_transmission_line)
> +{
> +	return sdp_transmission_line - crtc_state->dip.cmn_sdp_tl; }
> +
> +void intel_dip_cmn_sdp_transmission_line_enable(const struct
> +intel_crtc_state *crtc_state) {
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +	enum transcoder cpu_transcoder =3D crtc_state->cpu_transcoder;
> +	int gmp_stagger;
> +	int pps_stagger;
> +	int vsc_ext_stagger;
> +
> +	if (!HAS_COMMON_SDP_TL(display))
> +		return;
> +
> +	gmp_stagger =3D intel_dip_sdp_tl_to_stagger(crtc_state,
> +						  crtc_state->dip.gmp_sdp_tl);
> +
> +	pps_stagger =3D intel_dip_sdp_tl_to_stagger(crtc_state,
> +						  crtc_state->dip.pps_sdp_tl);
> +
> +	vsc_ext_stagger =3D intel_dip_sdp_tl_to_stagger(crtc_state,
> +						      crtc_state-
> >dip.vsc_ext_sdp_tl);
> +
> +	if (drm_WARN_ON(display->drm, gmp_stagger < 0))
> +		return;
> +	if (drm_WARN_ON(display->drm, pps_stagger < 0))
> +		return;
> +	if (drm_WARN_ON(display->drm, vsc_ext_stagger < 0))
> +		return;
> +
> +	intel_de_write(display, CMN_SDP_TL_STGR_CTL(display,
> cpu_transcoder),
> +		       GMP_STAGGER(gmp_stagger) |
> +		       PPS_STAGGER(pps_stagger) |
> +		       VSC_EXT_STAGGER(vsc_ext_stagger));
> +
> +	intel_de_write(display, CMN_SDP_TL(display, cpu_transcoder),
> +		       TRANSMISSION_LINE_ENABLE |
> +		       BASE_TRANSMISSION_LINE(crtc_state->dip.cmn_sdp_tl));
> +}
> +
> +void intel_dip_cmn_sdp_transmission_line_disable(const struct
> +intel_crtc_state *old_crtc_state) {
> +	struct intel_display *display =3D to_intel_display(old_crtc_state);
> +	enum transcoder cpu_transcoder =3D old_crtc_state->cpu_transcoder;
> +
> +	if (!HAS_COMMON_SDP_TL(display))
> +		return;
> +
> +	intel_de_write(display, CMN_SDP_TL(display, cpu_transcoder), 0); }
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.h
> b/drivers/gpu/drm/i915/display/intel_dip.h
> index 8ff22eb5663b..7c64c84cb1be 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.h
> +++ b/drivers/gpu/drm/i915/display/intel_dip.h
> @@ -47,5 +47,7 @@ void intel_dip_write_emp_as_sdp_tl(const struct
> intel_crtc_state *crtc_state);
>=20
>  void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state
> *crtc_state);  void intel_dip_sdp_transmission_line_get_config(struct
> intel_crtc_state *crtc_state);
> +void intel_dip_cmn_sdp_transmission_line_enable(const struct
> +intel_crtc_state *crtc_state); void
> +intel_dip_cmn_sdp_transmission_line_disable(const struct
> +intel_crtc_state *old_crtc_state);
>=20
>  #endif /* __INTEL_DIP_H__ */
> --
> 2.50.1

