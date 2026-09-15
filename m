Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB44C88E7B
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 03:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B0B10F905;
	Tue, 15 Sep 2026 03:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCFVF9GK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B6010F902;
 Tue, 15 Sep 2026 03:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789444761; x=1820980761;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=THn7YF88h2qFTAqOILxjc1/jrZZuRpcuuHzdTNgl5Ww=;
 b=QCFVF9GKecZ9FBdn1mmvwt45YCEWgAYIBBfwr+mwXq8NzaQXv/1jpCfq
 Ho59brXviLtOcspwqKRjg67BYwHJqkbgvmV9LcoCVH9BRAF2pqMs0UNm6
 gVA+NrVJunwXI4eQ5P2sg36hXQ2N+e1zHVyaPXhg+Uw5BoV0N8gHri9NG
 0gClLkWeb8X1ag7EYBt9imSaLi2obcMY8RZozpYVs9u0gBtt9jONVAqDO
 4g7VJ+CnZC15/niDm/XI4fk7ZwCrkIcClalI/DRVTog3XQF4jdfzTih+I
 Vg0rr5rJaPd2kk5Ma9Fy5I3A3pohMk19V+W3DKPfOmav+Tq2OvGZt7sw/ g==;
X-CSE-ConnectionGUID: XUjNupbTR2CqEBPlq9u7GQ==
X-CSE-MsgGUID: JxiBUUtDQrKwoY4iD3RpdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89930419"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89930419"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 20:59:21 -0700
X-CSE-ConnectionGUID: bPzYY3c6SBi2apxOp/zSlg==
X-CSE-MsgGUID: s4Q2bRtATkaWC/rCSxO9gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269146675"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 20:59:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 20:59:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 20:59:20 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 20:59:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSR8afZcfgpKyPJwWXEp5keoTOPFQFTUSYgRvfeaSzzcg+JbfdDVvICZ2OTSJDf+FbOM0s6GH9VuksASjgq26+7VN+L776VK4ZOrErx4kEUvCNxfVy1VTZ5urzTxxp0yZmXSFbEVH3hPt3dNjQw2Yclpqi4LXnB1kqYpsLNEnDBiwfoH9Gzihh69bYo1CU6AmygSPUSzI/sdsS4hwqVywLT9lYql9byaOxy7TClwf8ef3ucU5ZbGS0BC6IMQxF9k9kxunzogJMFEVuMq7nQFVHNm3om6Lpog+RxM74+E/SzrxmERdl6vpjcwt5yfX0vusjdTm9hGDqSFYzYddaBQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tafd2YT1B9Jl+v2wMBgmDW6E6TmF1RN9NF94pNXETAQ=;
 b=pBBQjJ7LiZk2cwIfaOeCfdiAcugFcRaIY6/QRGwgW7pwgVyEs3l5oEF53lUihghlDlDAKXZ4YSCYfZhl6QoSTyXF5nQsiTWg29k3CHzAI/tKbp7u05dWTvwe7ADNHkI2kpSuU1SMnqiQ7To8rxQHglIYYMyK/VLWvVbv3VpfQc/47WzVsBUWMiEBv6RE42kCORtB7IvzQtCLe0jNKlKoQ8RVf5DnguwcTaYB1GcPzusBBsA90ySnrPsOdcwd/5NODsNkI/ULIA2VnPnsTkmwymZ3Y34xYE6MlN0REH2L51pM5z5bEpNbgY+KqvquA5LtGbRkxgnTIS+bE2GClMbD+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS0PR11MB8687.namprd11.prod.outlook.com
 (2603:10b6:8:1be::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 03:59:17 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 03:59:17 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v6 04/13] drm/i915/dip: Add helper to get AS SDP
 Transmission Line
Thread-Topic: [PATCH v6 04/13] drm/i915/dip: Add helper to get AS SDP
 Transmission Line
Thread-Index: AQHdQ5J1R2J7qgHslE61fXULMOmU9LbPBecw
Date: Tue, 15 Sep 2026 03:59:16 +0000
Message-ID: <DS4PPFE901A304FA90069AC691F162B053FE3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
 <20260913145649.3240904-5-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260913145649.3240904-5-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS0PR11MB8687:EE_
x-ms-office365-filtering-correlation-id: 78ca748a-0129-477c-5fb7-08df12ddb695
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: DgQ89wfZo/k1T/SWBGMw6hbCw8LaVUjzWloit8K+74i55yloLRYnlc3KP0O+hF9qTYiChXvXs5j2au1iqDJ8/IiMxGVrAJ5IFSPQPpqn/8RqU1eH4iP3JhDLwt9gy/iJew/j0ZJzDtD1VFrnwAx9bi/w804TOJlCAoJXAAHMgKmc4QWX4EaEBXUssf78ML5jVNt1sP9oFqi+RFLdsfgtKBIwPSQ3oYSh5CI35xJEWYPQNve84XDrlJo0/L2jZfYVcp4WoWx8kWUsbay0tDIFicAX8Y5U/r+PP1fJLOdbBdNKH8imklgBoPaoKNyCOjXuRPmmXFMYavhSyQXIPK2A9zf08oq7Mrp+MfjqCNzvEJNCzaQZ5PE9M1Ac5+veudEvEZBGkfO6slb+Uwises1a+ySPxUaWEoPZoM0Cp6epdHOdiQJyUh9zrxnfAmjpk7kQxtlpEzOAWc+HhWQI0FnHzFSrTARoC/U3v05c8BNkLzJoA3DctxPfdbYxCL18YIJ3AH9Xo2HV4mavgpa7Y8sGdSMbMnT80n3Jofnu+ucwPhn3QaJ+glV1jDs1rp+MwsY9W+lzTkxPkymSIugD+BJUygEP+o3imMYiCKYVvtwB5z1MkBjFMI/+6zuWqa4CnCGgAMvnpapd55Kk/MPCxfafNPp+Hv0ApKUjo659nv+vFym+2YYwOjYQOGXPaQoS+kCTL/by9KH90OCnY7hxmK7mLqKtlP9rLQLZukIJkBD2Kro=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+KXR88McO2E360GngMqQr0WfHS/yMrdRd0/2lqo/57y/TD1JlbllO1d7iSaM?=
 =?us-ascii?Q?EENFj8ebqFZPD1vWai3tGdK36TGVmem9nBrZiBWhYH1EgZM0GvaCGlYRFjaZ?=
 =?us-ascii?Q?Bj/dz9ZgwJdwGVvszzYzVjhVxD9yrfx+KJ+T1FYZvKmRIyDzHtu7jr0EghdX?=
 =?us-ascii?Q?VV1HZegzPzj+W9PrZ7zMTyrVAOiKy2pM7hRUI7ArlT/J6i28bNv0zRKywLru?=
 =?us-ascii?Q?QpeNgjNSjtDZGJeTIc2XR3oS7c0O+zjB2xMfpcWPjA+ThiUSIyBLwNb1e1mH?=
 =?us-ascii?Q?AKOv/xzgE0gxo0M8GdHw6/N6KhUJ4MYvsDKJR0s31fdSZy8Ng0cEU0zWY01G?=
 =?us-ascii?Q?1hm2ZkP4uiDdQD/BrX2d9NMm/v9tBau/yo+rUTaazcMR9qH7CkINiq2JTYnA?=
 =?us-ascii?Q?zlogf879dK5TguS9v4ZN+QqIWw2c5LVqPdwrWA4+qohccUw3RYqFs3L8ToNk?=
 =?us-ascii?Q?5GDNhSgVZyLDIn9aWHrudQLZuhHpYYmkiEe2GWjXjJ4m+WLspAkGXLz0P/hB?=
 =?us-ascii?Q?cuxq2oHWao8Fen/TEgy2gh2y8FJbt3+XrhvAFtLKM8qVwYWakMflEWCQe+8B?=
 =?us-ascii?Q?p/dShf12NpCxGPy5ErFHw97SIvexoOJenpR+vN5rkNaOjxydKWQ3Bmwdn8F3?=
 =?us-ascii?Q?O9kFMm2Ax4Q7ZckAo0kamMAQuf7JEKu8FYS4vfNuJO2N7+3FuRvv6l6w/6uj?=
 =?us-ascii?Q?ozmVExzSQQqdqnE4JQDuCNfA/X+ZWs610OjrB21RX3Mv/FcHyOxZ3SBYdRv9?=
 =?us-ascii?Q?b2oBIRNTyb3QN2TvNfCw/ck9WZP4Mf6ggn939T7/uR9A2mY1PdckdtDXsuEO?=
 =?us-ascii?Q?tkWhpp/YarGwrqbjbJexOl6jxw3bfNFv8Ga1OgopUXIVQiK0LqzPfqq6G/zE?=
 =?us-ascii?Q?zPv4U31qpOZ7w+FfZKvZFTXPsL8mR5PHjhCSFRZP2pfg9vZD8IYyWjvRST0T?=
 =?us-ascii?Q?Ftndw0vSA0dUkAoOrvesSc3C3sQUBMKmmXnh0h/xDwKFwH6kaNS0xlJSXThZ?=
 =?us-ascii?Q?o1p72TfiSlWjt8FxBxX/vVfU6b0Az/f/wDwaJyTPaAZdgXwxKfgo3JQX3XBV?=
 =?us-ascii?Q?jnVTbqQaRDJGI6PI7Y4R8TNcXk0eF6fDfXZ2Mawww2d9a8Q7u7Gd+N0s8DH5?=
 =?us-ascii?Q?tTmnqkYldMgkvxGguaFBmWWTWxB/XHoDbtxlrTGbCVKWhjWIqDfGrApyacny?=
 =?us-ascii?Q?a3Y7b2QXoU7J1RwQn9Wf2FEKv1XJQ9Q/r6RQ/Hb1To7Uynn6LFBZXf75RT2t?=
 =?us-ascii?Q?dCOWEhffUO6zXSQhfb2sxFwaharSTsjH/fU/GrJg8LDc8NoeGKoQdRclykhq?=
 =?us-ascii?Q?42egBxUmFnVg4eL+WRkV5ZxTex+N6dGQgpgxFJoEAO0dV6lJsXBXjQloc+V2?=
 =?us-ascii?Q?2FDiGh7ZHgvBcGTPlUpMiBOp/It16lOmFrtVsW8V2n+jJQizjaOpR/4O0pNm?=
 =?us-ascii?Q?FI4/ZZOeLfrD9/5KohQKNy2nRAZc0aEuOdScZ7Bzko/yZnu/WbETcl2lSEgq?=
 =?us-ascii?Q?nEiVEd3S1fdVRMd2Ryntrs36dBm7zcwnHavBomgEGmwecfZZG5fM1hqfwzC6?=
 =?us-ascii?Q?g47jUzhFoTSkhkR/BLUSQVHygFsoZAgk73+cvqLgHinZw4r2522aXWcsX9WS?=
 =?us-ascii?Q?xjVK6uEMGXoR0Zq6s9qEj461enXH2KimPToslS342tmSWFru7FokLWFWXvly?=
 =?us-ascii?Q?VdoIeA15Gem/7DnTNZUUgFr/w9Sp/uWtqE3MgXO/jm0l07C/+nMPsVos+/lm?=
 =?us-ascii?Q?JiJHQpyDUw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Lu5yTmm+HVkAmQTo3/H+loUa+tAt62X/Q5cFlnF7x1a1udfUjyTU2LwALHFiVgcMz9EZUaYnbEFhwPNjRSZjQMA5upBGnkaK8xL4jyIssCIOkxEHKgpAv80Fv1cedO364pOu9yf23oQZI2CeRd9waZPkn7BAp+koksgT4zKKrX8owgwsvO/FItSPEjZc4hO7JBk3SBbSbDjRkouk0tc7NPGW4FvTFFP+KYYoUpV8b/Hh2KTQB0071E/be0A+x5If/S7dXlT4CK7CXs8Ud0uZlcys3xrR+DL/4v1/ffTL2kFlKXCV6waSN4xtyqv2b1NBrHCJBmxRaUIbmqw6h/ZWVA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ca748a-0129-477c-5fb7-08df12ddb695
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 03:59:17.0173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: erWrDkQy2ZKxtadF+iNsIfy7fi2c53X9UZXzkFgJQTCJzaY3rTjVDhnrliTL7s5w1pVg9ks/E2TRDO1mBBFbVQ==
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

.kandpal@intel.com>;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Subject: [PATCH v6 04/13] drm/i915/dip: Add helper to get AS SDP Transmis=
sion
> Line
>=20
> Introduce a DIP helper to compute the Adaptive Sync SDP transmission line=
 and
> use it when programming the EMP_AS_SDP_TL register.
>=20
> Currently the AS SDP transmission line is programmed to the T1 position.
> This can be extended in the future to support programming the T2 position=
 as
> well.
>=20
> While at it, improve the documentation: the AS SDP transmission line
> corresponds to the T1 position, which maps to the start of the VSYNC puls=
e.
>=20
> v2:
> - Move the helper into intel_dip.c and make it static, since intel_dip.c
>   is its only caller.
> - Drop the now unused prototype from intel_dp.h.
> - Add the check HAS_EMP_AS_SDP_TL(). (Suraj)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com> (#v1)

Still stands

Regards,
Suraj Kandpal

> ---
>  drivers/gpu/drm/i915/display/intel_dip.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c
> b/drivers/gpu/drm/i915/display/intel_dip.c
> index b28352a9e23f..0277b15e1c82 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
> @@ -9,6 +9,23 @@
>  #include "intel_dip_regs.h"
>  #include "intel_display_types.h"
>=20
> +static int intel_dip_get_as_sdp_transmission_line(const struct
> +intel_crtc_state *crtc_state) {
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +
> +	if (!HAS_EMP_AS_SDP_TL(display))
> +		return 0;
> +
> +	/*
> +	 * EMP_AS_SDP_TL defines the T1 position as the default AS SDP
> +	 * Transmission Line, which corresponds to the start of the
> +	 * VSYNC pulse.
> +	 *
> +	 * Use the T1 position for now.
> +	 */
> +	return crtc_state->vrr.vsync_start;
> +}
> +
>  u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_sta=
te)  {
>  	struct intel_display *display =3D to_intel_display(crtc_state); @@ -36,=
7
> +53,7 @@ void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state
> *crtc_state)
>  	 * the register is reset to 0.
>  	 */
>  	if (intel_crtc_has_dp_encoder(crtc_state))
> -		transmission_line =3D crtc_state->vrr.vsync_start;
> +		transmission_line =3D
> +intel_dip_get_as_sdp_transmission_line(crtc_state);
>=20
>  	intel_de_write(display,
>  		       EMP_AS_SDP_TL(display, cpu_transcoder),
> --
> 2.50.1

