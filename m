Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7291C43458
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 05:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F64310E29F;
	Thu, 16 Jul 2026 05:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIErV2BW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC6F10E29F;
 Thu, 16 Jul 2026 05:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784180016; x=1815716016;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RN2SraI+tMVUZcgXNgx1YBsgGC4j6JOyAcL9XNGXEOo=;
 b=VIErV2BWvOPNB6bMoQfolHISRBBZ8ROaU0SIN9Y1txAFXNCFCl1WA3L2
 dlo+ItVgc/EwSeJBsx/DtjLF0yTSSdjFRGzJboMnYeNGDHSiZPX5bBZW4
 bbd8REyCqRCmnJtLcUyUhfJcgP/eDssqCBVlhjspJ3/D3VgO4PMFJIoI4
 y+SjrJjbHEmvMfyu6RovIoOegoU2j6HoHlGtUkCEl8GL0eIz4fkl08miF
 518dnn3+2CW42sbpiNl250cxWNfAdvZ8ccgF+GqSKQ6simzJNUl1Xo7ZC
 hAH3HrQuXVnyhNhH34w29ahTdZt1IRwbWQADX+tVW3o4nRwtGFzSbJ3F/ w==;
X-CSE-ConnectionGUID: 5AQFP81xR6e3lLQMHQfO/Q==
X-CSE-MsgGUID: eabgAoIdQUuGFDclMu9qag==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84791722"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84791722"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:33:33 -0700
X-CSE-ConnectionGUID: t0DNkALFSMaoRVg9nXN6ag==
X-CSE-MsgGUID: 8Uh/LbVoS0ec/fNZTjOk2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="260702847"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:33:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 22:33:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 22:33:32 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.13)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 22:33:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVNnSkX89vPaHau2H5VJlb+sxnB14lSdzvcAgc5c/dntmtr5Od7Yvm1i/YinPoaW4pRSvHXa3yohlPol5llEChNIHbQxoSYhMIZr558OJo5XJOXDv2fUl5ZZescFZkcHLbyVinH+TPOL9FIRunpNGo+culs6MqBgg022xwpXRyr8l3pr7gKDhukJF+8aRphLUSKMre2BK23cq+kF28Tk8xjI625rP8ESYwk1DvGoQFdr6kPhDk3YDq8JsffxkxVOxgRgjI9aPbV2IbpAYkQeB7JuVx3chAcblMJNnKAa+VdYMpCqgxEV7o1+3UFh3u2oqxKm0hyu6OEJflz5n2eokg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cICiWX3+TRMku00Z3aOmyxnI5tYxGmLA5M937HutAAA=;
 b=h6RrmqgL2SrQxdNHnbXCfkprUXOfnuf0c7Em1pCZZQBkXkmUbCfXoHfzMGIIoO+S0ZPw81xgP2IuZWHk0zqumoxn+c3qf2tlkaLSPJeMh07Q9HaW9QoTioAFhbAEKh/IF+gvpkC/RyXK43V6AnPDmVQLnYWebSsw/aCxg83Ke6zX51oV8LSKXofWc2eyn07ycFjbchlqAa0hU104wVy/j4QMwIZr1iOkNVMpIxJuoUMlJoFm01I2DbL9YO4BPfO6sC86N8RUIqL6u83yJU4drepSw6GjsdqaESbq32F9CTW1BvWPo7FdvIrSgGbR4kSWAbM2t/YYcHN1CYtTTY9GQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS0PR11MB7442.namprd11.prod.outlook.com (2603:10b6:8:14d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 05:33:26 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0202.018; Thu, 16 Jul 2026
 05:33:26 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: RE: [PATCH 1/2] drm/i915/dp:
 s/intel_dp_needs_vsc_sdp/intel_dp_needs_vsc_colorimetry
Thread-Topic: [PATCH 1/2] drm/i915/dp:
 s/intel_dp_needs_vsc_sdp/intel_dp_needs_vsc_colorimetry
Thread-Index: AQHdD5suGBu/x9T9d0muaMVrFqJOMrZvqCzQ
Date: Thu, 16 Jul 2026 05:33:26 +0000
Message-ID: <PH7PR11MB605359AFC82D07B1ED71C782E7C72@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260709113951.3557968-1-chaitanya.kumar.borah@intel.com>
 <20260709113951.3557968-2-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260709113951.3557968-2-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS0PR11MB7442:EE_
x-ms-office365-filtering-correlation-id: 7ac7998b-196f-4e0f-ee16-08dee2fbc296
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|38070700021|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: 4/EJN+oJ3AhS+ioRnCGs/Nyp+x/0XGohbKk05udhEFdtKypJLhZGjzJk/qtrP/q/7iYbB0puhWsLEcOQ/PiTzGGU52WRCvtdgja+vYMhs6JopFb/1ydZxn15dP+IVtCcqBwHZ6W9riaze5amanw0EvSb3w4x4ZqQF0y+n14qqKcHSe3lBaLr2Q9YfyckMXugRRMuxPeoMeSH/jzDYaBYDdHYlJdkkYxIhhE9aOcHorbVXTsmnJbgeKm9SI9Ymi2Nn8quifKNe6Ixfua+deVYHfovAU6w8F9RQ+WJJMBqQcHrOHXUHexqYXOOzfufJodFXCjz4zfCOLIBFl5Zz9Gb/u1i3ZDgU8Lh/vdgQQokEdC3OYAOUCdKnstXGCJgmZkNF6nsJzsLyT9EgdsTeePWBCSTgWF/wM+ssqIsKZyUzN58NUWN3C/pjTpFXA6K13f7fzvJnuw5CvORFykyQxlntDsKsrm82Gd0vzOAOJuIwW/0M6gW5+M9nXc4niGEd5QKQxLychn5n9aluNMPm4CwY/hFWkQvZPMl8haJW7APM4seO8rkzb/KYr6cpH8qnRb2P/iZGHCzatJflO4As7gnVC2sGy8yfwJQ2S/q9i2DuO1MDvX1dJOOnkjvRp3EcvXRfLwv2L79tvWRcG4o7LNdszX6FO+HddmalSKNgc8IhLn8rvV1yRcAXl+NHeJf12+BadUAo869rfmTulWGTrCWSUrQdEddebkvcxZkydE4JkM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YLijeuBITjiIZqYhiTya2Wzpgpw9ZD8LUpGKhN34eEXQLYXN8pr2ZIs+InU1?=
 =?us-ascii?Q?gddBFia/V+7uTx4423Wqa28EA2oRSf7+KZw8/pWACpfBWhlH+uujZd4M/DIJ?=
 =?us-ascii?Q?vtq+gFAOR2iCp9ZaEGNhZJwLZlAxZFQmAUdBBtTxEyFd0AJnyED0dyh06L8F?=
 =?us-ascii?Q?JiPbN1oUwp0CZcawahn9B1wUyls8ErhuOgkEQuWYyQ66v7pdSzaqDdgUPnKW?=
 =?us-ascii?Q?uVjs99YMZOyXN22BPBOs0GRR9Uap4zCP//8J5N/s5F3hV9snyNNeqbcvHMx4?=
 =?us-ascii?Q?k1Vr7GLjKPNdyss4f1CSpugiwrBGoX+w/xerCtJzuJfnJF17qOomKevDlOmN?=
 =?us-ascii?Q?KO4yl+henPe/BuKdvh7DbHQn3nP+ksuyVpDCJZeRqeuhDv7rBZmKLKbDOUQ3?=
 =?us-ascii?Q?P5KLVHxtpBZNv3PKzFeM1j33MOrfOhXzPYTK8xZ5Bf+PLZZOiVQm9D+4kufI?=
 =?us-ascii?Q?rcyhuIgKvtZz0wswxQ1icMVBvAnoUG1hLC2uyf3gGOgDTbjhkqFpjbESPykj?=
 =?us-ascii?Q?TbXWBjU84E9CtnG7HwpO/vyVMyGDXF1RfRJlmDwXwsTjlDLuCm3Sc15rU82V?=
 =?us-ascii?Q?Zj2/FxHze3M3LN0z1V2/Goa2DSM52N9DX1YjU8nBnNTgzyVm514rJWs35zuJ?=
 =?us-ascii?Q?FhoPAM+ICclqvVaVBwOZXfonpBpGTAoyutINWSat9eZLRF5zV1MQnPHv8gfw?=
 =?us-ascii?Q?4Z+Dx0UZFiyX6IUJfw36x/JSASzVZmMvI5skKOCQZqR1tJ9m+OdkiuMIudGJ?=
 =?us-ascii?Q?I0yspUrlmKaK+ew7kW9nJ2PxQipNjBCp572EJse0toISprxF3ZOSPOXoVit3?=
 =?us-ascii?Q?zBHPd5l4eLVYHcScyc3QhppS/RGFDMiFQ1I0DeoajVH5P6ZN1BlFZzNjaiSH?=
 =?us-ascii?Q?w5HAmYI4S01zDootvjwPOabn+rt8tFzonB/t3vVaV0JR22hV6/AY1NcNkDi8?=
 =?us-ascii?Q?/Rx8wPGuxt2R/LVRh7+cT6GjnWdBJrPPKhehj12ZAhG0wnWY5KBSZQ1wGp+h?=
 =?us-ascii?Q?ebvhhCwQT6VYC4bxoPgZEZ40UZJ5wAb59qFST4amJtccvWg7quzZbTa51hY5?=
 =?us-ascii?Q?qLvsodEjWjW0ElFQT8fwVqK47OqQTrLCPAFgnf/HCnOgn5pHEFebfPB+MI8y?=
 =?us-ascii?Q?MPVMS0UXp5hl465N/hDldysuMoYTb4LKY2mZ6qIkrvz/Dszv1DGMqEQCmjZS?=
 =?us-ascii?Q?n6sHUUUN9a0FTW8mP4WqIuDptYdJ2teoZBbWuVWGRvL+hJJA9wXIu0x41N61?=
 =?us-ascii?Q?KgaKw6j3iWREjhVNYJj3F7yjWPmc64UIBzAt7clz0uOepr1cG7SArl1N57pL?=
 =?us-ascii?Q?8EoroOaPLL8jeMPZllVNGGXrqUqcWrgRw3bmUoddzBvL6m7fpSiRi5ZV9P+h?=
 =?us-ascii?Q?DhUBRMssnM7T6GQIpnwqK0BfvnXl6eW3IhSWGLsoI3MAE8hsMwvAqFhhi0K/?=
 =?us-ascii?Q?Et8mk7xZ59blP2SUp3zUloQmU11/8KLM0Li5gffnbdnTmv9hrf5DOAHih7F7?=
 =?us-ascii?Q?xYPgLHOBvI9xdYgehcCLK5KeqHssbXwnTzH0bNXs2HBWxE+77YfVZLfsZuK9?=
 =?us-ascii?Q?2QR6oXHQ1+W810Cr4JT/cBCG4041d5rLRsmMEAdkYH9egHnQnQJFTbj2VGMX?=
 =?us-ascii?Q?hXUiuIjSZEcEcEnVWCTsGUy6sW+01QUNHLBzu9AH2IsuFhGu9HqOvMmJl0g1?=
 =?us-ascii?Q?N06lnEXVdx68OTi4VeZLZI7t9oJrRtjzho/WfkIAboKfWd8weS/MV1ZdUM00?=
 =?us-ascii?Q?iDwm751H+g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Xvz6KLJbK71Bk8/LoC6eB0NTEfRUxSKXxlBlzCMVDTHsrgOdH/MhYNFUEz3vWFl6JWwhXJFi/L6J7oPcHA+uQ/UZA4HGjh0fVwei3ChowbuTHLq/hCB7gOQcXXbl5oW4mfWuzi2KqMWiO/anxVaFFFM9wxRYndHxprwVFgm82eZ4LbYg/cqDoSkKfFxJ5KvUzlHRy7xT+0PNgXFhdB70FbYa4HYc6HXIBVB0a8R9Ut1+yyl7tGwhd9jQVi20VpjIraSMKTcfGMq2z7XRVdmwc7Bzq/+Lb19eKTH45jQ2qkpOd1s7J2BLWMX8fZ9XzHRYCOcxpEsGnzVTkp+M1QO2Ig==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac7998b-196f-4e0f-ee16-08dee2fbc296
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 05:33:26.2472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtcxMRBjIkf3JS2lbSRVxzAnUjJ3i7vwLLzb5u1EbCWHXY7xAPhl5mMY+4XcwPe12kUH0ucTxifZgMdQ5Q9ZBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7442
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

Hi Chaitanya,

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Chaitanya Kumar Borah
> Sent: Thursday, July 9, 2026 5:10 PM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Subject: [PATCH 1/2] drm/i915/dp:
> s/intel_dp_needs_vsc_sdp/intel_dp_needs_vsc_colorimetry
>=20
> The function answers whether a VSC SDP with colorimetry payload is
> required by the content being displayed. Rename it to reflect that.
>

Since this helper also controls VSC signaling for YCbCr420 pixel encoding,=
=20
it would be better to update commit message to indicate that it covers both=
 cases.

Apart from this, changes LGTM.
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

> No functional change intended.
>=20
> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
> drivers/gpu/drm/i915/display/intel_dp.c  | 8 ++++----
> drivers/gpu/drm/i915/display/intel_dp.h  | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 2b7eb010511b..c764472bd69a 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -470,7 +470,7 @@ void intel_ddi_set_dp_msa(const struct
> intel_crtc_state *crtc_state,
>  	 * YCBCR 420, HDR BT.2020 signals we should program MSA MISC1
> fields
>  	 * which indicate VSC SDP for the Pixel Encoding/Colorimetry Format.
>  	 */
> -	if (intel_dp_needs_vsc_sdp(crtc_state, conn_state))
> +	if (intel_dp_needs_vsc_colorimetry(crtc_state, conn_state))
>  		temp |=3D DP_MSA_MISC_COLOR_VSC_SDP;
>=20
>  	intel_de_write(display, TRANS_MSA_MISC(display, cpu_transcoder),
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index ade7e51e7590..93282694c29b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3164,7 +3164,7 @@ static void intel_dp_compute_vsc_sdp(struct
> intel_dp *intel_dp,
>  	struct drm_dp_vsc_sdp *vsc;
>=20
>  	if ((!intel_dp->colorimetry_support ||
> -	     !intel_dp_needs_vsc_sdp(crtc_state, conn_state)) &&
> +	     !intel_dp_needs_vsc_colorimetry(crtc_state, conn_state)) &&
>  	    !crtc_state->has_psr)
>  		return;
>=20
> @@ -3174,7 +3174,7 @@ static void intel_dp_compute_vsc_sdp(struct
> intel_dp *intel_dp,
>  	vsc->sdp_type =3D DP_SDP_VSC;
>=20
>  	/* Needs colorimetry */
> -	if (intel_dp_needs_vsc_sdp(crtc_state, conn_state)) {
> +	if (intel_dp_needs_vsc_colorimetry(crtc_state, conn_state)) {
>  		intel_dp_compute_vsc_colorimetry(crtc_state, conn_state,
>  						 vsc);
>  	} else if (crtc_state->has_panel_replay) { @@ -5100,8 +5100,8 @@
> static bool intel_dp_get_and_ack_sink_irq_esi_sst(struct intel_dp *intel_=
dp,
> u8  }
>=20
>  bool
> -intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
> -		       const struct drm_connector_state *conn_state)
> +intel_dp_needs_vsc_colorimetry(const struct intel_crtc_state *crtc_state=
,
> +			       const struct drm_connector_state *conn_state)
>  {
>  	/*
>  	 * As per DP 1.4a spec section 2.2.4.3 [MSA Field for Indication diff -=
-
> git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 02b691df6755..54570aa142f4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -128,8 +128,8 @@ int intel_dp_max_link_data_rate(struct intel_dp
> *intel_dp,  bool intel_dp_joiner_needs_dsc(struct intel_display *display,
>  			       int num_joined_pipes);
>  bool intel_dp_has_joiner(struct intel_dp *intel_dp); -bool
> intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
> -			    const struct drm_connector_state *conn_state);
> +bool intel_dp_needs_vsc_colorimetry(const struct intel_crtc_state
> *crtc_state,
> +				    const struct drm_connector_state
> *conn_state);
>  void intel_dp_set_infoframes(struct intel_encoder *encoder, bool enable,
>  			     const struct intel_crtc_state *crtc_state,
>  			     const struct drm_connector_state *conn_state);
> --
> 2.25.1

