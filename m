Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685E3C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 07:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1818E10EA8F;
	Tue,  8 Sep 2026 07:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mmvuvodj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6494E10EA8F;
 Tue,  8 Sep 2026 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788853774; x=1820389774;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=onyKoq6Sc5k/hck8d5iZgw7qQ38s1h9nd7vhE8TJba0=;
 b=MmvuvodjH3TkNaRUGaCSLzDOWnOgstAPsNvOcAvGqzpCFh39PvceYCS4
 tjuJ9krHoC29bCID9nr1ldCpBxMUIxTvKtOGGsSghLPqQ2YU0+j+l3WiW
 cb+3RPzut7LPKhsMrN5suRAIeX/2dx/jSnUGgVWWohWZJsvesuJzAVHsC
 K5kTD10gIpKIsgH0LwfBVxCnOCB3S0JYLzcdc2imTz5B2NgXJ+RwwPaOH
 Jaod+dXSje0MSDXBUYQ/3+UnN5ckFutL523uY9lNNnraSd+hObRRtQI97
 rhwIQJNSl1DpCZAiMDLCBOMewni/j5GrcvyK2eMP9Ll7REqSkb24Tjoq2 A==;
X-CSE-ConnectionGUID: lps8IlKHROKmfUGb2UsrSw==
X-CSE-MsgGUID: UrQuB3qdR+CBchtuPiAheg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93111090"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93111090"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:49:33 -0700
X-CSE-ConnectionGUID: nDcG2oogQ6GBwl0OZSvKMA==
X-CSE-MsgGUID: GsTBkbXASYe0EsD9gUgLPQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:49:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:49:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 00:49:32 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:49:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFcoNDTmb6dGusDt98TnDbo0xLN3JTu21fc5IN0s55NI0elV5XAe1lhBZbUMozPWjNxRpkaPnTTM5nIiGyG362vw9N0WTMGgX0aBcMKy+3ZtUSjVuMyvTuF6bj0KbWF1QssXW0ZT+69nX9J+dBQhjmxmZaHkN6dm5dLo8r04WsYXXUzEPAGy+80NJ9LeHHZzOlh7Y1NK63aKqjeDrQ/XpP5s8GQ6S5I8Wew9uCYsD0o3TReLX/UPxtE0vO0AUgNyAGVC2dSiw8p1T6aw3ZIdIJBxtcuwLNdg6rp29Kpty52wNVofvMtB1oDPiEAHKO9Ty5p/wFrf1Tsg874ZTne3kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLm7BGUteVlIxHWPm1nR0SKm7ORvSUIF9r2eVtGSHDI=;
 b=guA8k71+wdFw/+rZQI5as/xpU23ywrRZnunlks3iHPqPp0GwpXbuJKvVFlLFrtr1YP1/T2GGKgc7lgyqm9M+7UM+53mX2ibWhWLKOFo+5wZLMLpetOO0nazsPS6OGpHT7kVpTLXGRd4r74/d2RZaxFcstCbn/E27s0XUIMSripPJ4nQ7/tT2bV/UTB2firkOvk7OvhJHYzyY3R3OMvagwDtRt61mv+XORW9nCDVEorWA9olDIKyFmSeNkPCcM2ksnW6LyTULhyJABi7Uyx2QRR+S2QNhBHHG8e0VEnowaq43XI4GMAHQoXVuLnSgRjIzQnA2nf5idN2UJ4bxalPOqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA0PR11MB7284.namprd11.prod.outlook.com
 (2603:10b6:208:438::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 07:49:24 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 07:49:23 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v5 07/12] drm/i915/dip_regs: Add register definitions for
 common SDP Transmission Line
Thread-Topic: [PATCH v5 07/12] drm/i915/dip_regs: Add register definitions for
 common SDP Transmission Line
Thread-Index: AQHdP1zK5eqcpC+w90eAkaK2DpQ/YbbETj4A
Date: Tue, 8 Sep 2026 07:49:23 +0000
Message-ID: <DS4PPFE901A304F36EEA75687EF1B7E280AE3B12@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
 <20260908062224.2897987-8-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260908062224.2897987-8-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA0PR11MB7284:EE_
x-ms-office365-filtering-correlation-id: ed6b4ced-cd79-478b-32e4-08df0d7db33a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: 6ZXudCPwD6rZU37fRYfqPGTcwWJPsSV+drkJl5luf4j4E2wTjZpszy39CJq4ckJJP1RVuJPufbz78WNWTM/bZvbKvtVe0a60LvW+r1J3k/995Wrrj8nZWTj4ohs8fM6w1pgUOlj/ZDOKdtf8SLlH/a3XIyw3Wy90vc8nQKJWO0/LtppcM6Z9BmGaludiShboRgVTZgVm3UIg14lAwcX/9hrSwNUimijxcdeeOP/T6r2fFe0Uye+4HfMaLbWNeUQJP3DhlG4yiI/JWnpKBLYlW3TsYB2U6q6smJGCJUAyCUPDe5j2TFt0owVy0I7zwChKUc9UbhYXqs3ai2MPVmtUSqRqTKjlSTWiq4w3L0WiHkQ6cQCuL06Gr1pKRE6LV7CgSHETKLyhSp5C8gdipfzhiGoZ7Ua6fYzKjiO9YYG0FjlMDv9PyrzN2yhRs+LDpBGU09higY5IJiLg+XomzzeN8AH83CUCkPJW/G1EeN2nEK/gp2xQPXWvXyBNbpdNvz+a80e262rfDYJd1kPVbqF3guXp9Q3BPZJFdyXZskShL3ZSKmMInH+o+NxhpidGVA+/OP9MqXZKXcCsbV3lg0lXng3TJFU4ZD4CpfMJ50ykv9SBXxOFEnhZRI90qhckdBS4heid3EGLhRsyVa6uU+9cCfy8TyElq9mAcOfMbAEj8/H1A3obE/ROAIEzkD64VByHR8wtNra5xMixwAmDs+eOdCxEk13HAHrSn+ULNkTzDto=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4acHK2VIIV0i1tEvAGgWcG56uEE+2Fhg6ED5nZ7QCs6xIXMVx/De69cXKLpg?=
 =?us-ascii?Q?91HeJqOKcPYDUCl0SW8DipQolb9Y2ukWZr08f3GOWZt3sz58RjvwEv/J3ID/?=
 =?us-ascii?Q?hG2+rKjNczAvuotK7vhF7F5u9WMNcj7gtBGRlg7+Cl95StNF/F2mQty2dp03?=
 =?us-ascii?Q?9Xt8L4wAqkyp44kG5VXVFUHx3ym6dCmDzYrnZniCBA4fkNalfbnD7Pkwm/5M?=
 =?us-ascii?Q?hAa5HhiXulXVPLtc5bPLQ4zpYp6en8WRFou/ambcNlNkt8zP3iMQlnKooveQ?=
 =?us-ascii?Q?U1v9IyxKVNFYUSAlY6Ta8A98CNatLeJuwszeds1wJ9Otx5BoE6aVfBX60dBQ?=
 =?us-ascii?Q?iLpQbfxgZIe7EL3xQnCtDgoglPsEaYdduM+2sqW10cb8CljYsYZ+BCMoW35x?=
 =?us-ascii?Q?Xp32xsFqZHz7LJ3of5STabuq/09lKILOeX4gKP4I41uZaJwGMY0qxwkoMv1P?=
 =?us-ascii?Q?yBcBbgfmWS1FIWLa0zEo5Bl+Ns5GL86JCjDv7F3ShOppd9uNoWAzexG/4fZf?=
 =?us-ascii?Q?MRK0MX/TuHsZWpnlaGfvhT14bQC19d36x8KsjJmC0rXNeBDv3b+TNIEpMo7x?=
 =?us-ascii?Q?cvlPAe9eVCKKQBpuanj3Dr6zj56oFn6XAhIVGVbUYLwkxXzeGp+HZQ9bW9IA?=
 =?us-ascii?Q?2Uj96dLV6WhSQvmbiJMIQNd2QqbtkXp7WVLulaEJ0RpTsIDKiQ9UcQ4QcssF?=
 =?us-ascii?Q?j/tAKB9J7G5opc3Lp9Bl9cqnnmS4fwWDvKaTKhFcyAyYlggEgMB6LbfE2l/m?=
 =?us-ascii?Q?3N079vTtppplYSOh/Qui7riEbOGIofKdI1fli3VJpEU1oAWfvwdksyp7MIaw?=
 =?us-ascii?Q?7TyycfTVeRcAtrybcw+GvH5d77jWP6JzIcVJSM0kzz1+R+sQP2MZ5ZJCjoMO?=
 =?us-ascii?Q?5aqSg/eSlCsxdWzinp4aIONrkNq5msgVcV1O9FRdrl20QluJc5l9bmuoGpz1?=
 =?us-ascii?Q?xvqP26kbFBSqGnm47VmOQhEgZxIqikQWNuh8iorie/zcZQiY/pmbp15ikyZ7?=
 =?us-ascii?Q?NzCdQN4kxTcpZDLNNIYi0xyPa/eFcL6ispCbFnh37vijRvnsptJEOMYp745O?=
 =?us-ascii?Q?Ez3gJYM4z5rHHKmwRrEHbKuXn7i+6avtodrF0FZL8+mCt6LT6cvkXhXpyjRN?=
 =?us-ascii?Q?873VQzgUH4NMyoZ1OWL7Kdy79FI1LrlivDstcRZUvlExJBQARkIpE84OBQCN?=
 =?us-ascii?Q?U84DhXb1fqmi4ipg5iV9A6Fw7w0h1YsrNgKBhBkzwaWjzlQoCNe1RCaroy4X?=
 =?us-ascii?Q?M5e/9r7hv9cuGFvR8ECj2B0DgN9gDcJjoR59of8euadUFyK/JhSBfq8EaCfP?=
 =?us-ascii?Q?oZHbKeiI2lYd6sSa8Rv376nOzaPQR6UnAAgfMNlJ3ZJ/RMbyIioSxexuLYt3?=
 =?us-ascii?Q?HnuJsaSPkTfIhyfLDbHtSWH8OPde+rkAlHzKtsWUNYPD0veLQyOOvc6wjnDY?=
 =?us-ascii?Q?kzDKOCxmXK+AuLPZLMHqkdeEb5Km/5u0PXmdYGz0bc4rDaoYChoFgutB/zrh?=
 =?us-ascii?Q?zUsL1CWeHI+ga7juD8Gr8XDgFdQynHQTZTht1JxRaQXIETaImDeciP9mJ4w5?=
 =?us-ascii?Q?JJhiSmw4zNfj8gv6wM6iX0UXdkDHCeyxtBT0C9G0afijeVE+rSTx4G1XkDhr?=
 =?us-ascii?Q?h9HEvlMsO9EUuPSpfgnNf4DVWSN+d9/75saLTLTeFVw0k6QhRccBhgmuD9s6?=
 =?us-ascii?Q?m0FaqakQrm84IEtk6m/qHFrRARt0+Suv2AIun37F6xAQYBsBG6fy1u2BN6yq?=
 =?us-ascii?Q?MrrP4QmCIA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: G3ZHU7erGi34v6aqklp+DmKk1aR+ymS3Uy/fbcTUBF/vEsRfi/4TfTBRdMv2sAgrbpfQfeFFm7axs7QhUKxOt1sKlgQa/FwRmUq6I5azkArn5jNGm29mUb1PJMgYVsPavyP7m5w2sy4WWW6YbKKFhusL/jOI1mwqd/JrybO1HMNXSCYS/X6CCMYd4kyqYsnCbkax2tdbcWRrCFwBY9koHPNMWLJ0KWGM7/gAmkcL8lvoY4vP6GBUVXSohJxGye7h8Dtdp5ZMFQKkdEgaHmFqo1qr3GJwMYS0QsKODVG69lbHsSDvbiIoI12EG0KM4smpE6VK21i3hKkH1+8Mz9U3iw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6b4ced-cd79-478b-32e4-08df0d7db33a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 07:49:23.8449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UJfgLC9F977A/TcseGFsdiOSU3w/R07g9JSs/9bCi8UGkg1TfNvLxMNkAFjFXAwFrkqiNOVto4B8voNLP+MC3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7284
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

> Subject: [PATCH v5 07/12] drm/i915/dip_regs: Add register definitions for
> common SDP Transmission Line
>=20
> From: Arun R Murthy <arun.r.murthy@intel.com>
>=20
> Add registers definitions for common SDP transmission line CMN_SDP_TL and
> CMN_SDP_TL_STGR_CTL.
>=20
> v2: Move all registers to intel_dip_regs.h (Ankit)
>=20
> Bspec: 74384
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dip_regs.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dip_regs.h
> b/drivers/gpu/drm/i915/display/intel_dip_regs.h
> index 85dcbf42e77d..7e69c5cf63da 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_dip_regs.h
> @@ -14,4 +14,23 @@
>  #define   EMP_AS_SDP_DB_TL_MASK			REG_GENMASK(12, 0)
>  #define   EMP_AS_SDP_DB_TL(db_transmit_line)
> 	REG_FIELD_PREP(EMP_AS_SDP_DB_TL_MASK, (db_transmit_line))
>=20
> +/* COMMON SDP TRANSMISSION LINE */
> +#define _CMN_SDP_TL_A			0x6020c
> +#define CMN_SDP_TL(display, trans)	_MMIO_TRANS2(display, (trans),
> _CMN_SDP_TL_A)
> +#define  TRANSMISSION_LINE_ENABLE	REG_BIT(31)
> +#define  BASE_TRANSMISSION_LINE_MASK	REG_GENMASK(12, 0)
> +#define  BASE_TRANSMISSION_LINE(x)
> 	REG_FIELD_PREP(BASE_TRANSMISSION_LINE_MASK, x)
> +
> +#define _CMN_SDP_TL_STGR_CTL_A			0x60214
> +#define CMN_SDP_TL_STGR_CTL(display, trans)
> 	_MMIO_TRANS2(display, (trans), _CMN_SDP_TL_STGR_CTL_A)
> +#define  VSC_EXT_STAGGER_MASK			REG_GENMASK(11, 8)
> +#define  VSC_EXT_STAGGER(x)
> 	REG_FIELD_PREP(VSC_EXT_STAGGER_MASK, x)
> +#define  VSC_EXT_STAGGER_DEFAULT		0x2
> +#define  PPS_STAGGER_MASK			REG_GENMASK(7, 4)
> +#define  PPS_STAGGER(x)
> 	REG_FIELD_PREP(PPS_STAGGER_MASK, x)
> +#define  PPS_STAGGER_DEFAULT			0x1
> +#define  GMP_STAGGER_MASK			REG_GENMASK(3, 0)
> +#define  GMP_STAGGER(x)
> 	REG_FIELD_PREP(GMP_STAGGER_MASK, x)
> +#define  GMP_STAGGER_DEFAULT			0x0
> +
>  #endif /* __INTEL_DIP_REGS_H__ */
> --
> 2.50.1

