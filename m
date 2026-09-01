Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CA3C61DD3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 14:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B4910ED1F;
	Tue,  1 Sep 2026 14:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMHH9sVR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9767C10ED1F;
 Tue,  1 Sep 2026 14:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788273288; x=1819809288;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iz1qX8AXwtbyIMVt/Yus52gGNHRavzLogmHIxCJ9Oa4=;
 b=XMHH9sVRNrEoiv+YiJbJ0F+3fljQODE9f++MYxq1jmrUKTn9ZTT7QBCB
 obmqt9Z3q/CytWS6DyboRpVPMR2dvLrW+2dXVDNhqkrCshRWYQSfwbW6h
 sNe/8JiaQVcuIIDye+1NbuZpIY9qNnRVJh1Tm2JTPDMDg5OC5o2sZuhs1
 Ygq2lT+eSf6ngjMO999arufxqxEVf+1RerSHRHqBcJGG50eNCsLpf/YFy
 u7etMhHpk3iB8cAFAgCFyA/ecbUTE5iA80gmfFDgD9P7SPEks2H+L47yi
 44YZKx1qzkSfap+SPT6uLZ+khSf0zqeZqcPv0FzBndtqyEdtYHRIbg3OC g==;
X-CSE-ConnectionGUID: 193hymuwTs2qALPNYyBpdQ==
X-CSE-MsgGUID: XT9+CsC+RtWmBJBPuCtPkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="106223930"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="106223930"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 07:34:47 -0700
X-CSE-ConnectionGUID: XZWuCS+bQm+IIARmOoMoXA==
X-CSE-MsgGUID: 48Flt246T52lkOP9AR/Wew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="267807821"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 07:34:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 07:34:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 07:34:46 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 07:34:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntG7zgmb/vgZJAKAoV71PyF0xDqeo3EHcCeRlBcbwWa30WEO8wnkr1f+NJUwVuVU6X/OYgxVPruOQlvU5C0pvQHMUeeOCQLFgFVsb4cTMsThmnPSAwHF8toWL04ID5zG8hS/mDcI1W99WCFZ6zck/OTZNL3R7PL2NojqYA+OXNJlWbK7HGCQwxEes02nwtSjcFdu5fPb28nIqmpILFphP5+VD3gN9aL1darowxC70mfvF0H+yu+s4LhGhz9fc7sd19ZIP6IgAVuok+90tNza/DdyVSlEZy7Tuh2EFVenjtO0DbnE+VAiABDyWyud5wfX5zctqwsNZoQdSNxrFyBlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/TbqnXfx69x5KjGeo9BBBQAMqyih1QdC0RbQiIdFoE=;
 b=No5mHAwQ5FZDTEmnPUXMy1kvqGNNyNR/Cs3IYcwhZuxfPro8gucsj/7UR04jJb3hKazZo8HvjCSUDzd7qIBmfkEyfAeHn4dwkTLJ82gqXV+2rb41N1PxKYXzDHbTnOLbRiTRaVzZ/LtpCKnE39MvD2r307c7k5G4YB8SOUL+gh92VsM9IDVHg/myYK1redv3Axmgek9XyI9IPZfDudLLKrOTwrADUaun3QG2y1ReZU3SJwDkhuqor5HYF6/3SbJLbA1AAVulr9IPXOBVB4W96B+0WfKuT5ErIVNIGE4O196tDrcG4X7a32Ee0RJ7UxV83Qeukuqc5BRjIU8vI8ubPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH8PR11MB7966.namprd11.prod.outlook.com (2603:10b6:510:25d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Tue, 1 Sep 2026 14:34:39 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 14:34:39 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [v2 2/2] drm/i915/color: Add YUV buffer support on HDR planes
Thread-Topic: [v2 2/2] drm/i915/color: Add YUV buffer support on HDR planes
Thread-Index: AQHdOg0otZkizGjIRkCofeqlFVUgZba5ybpg
Date: Tue, 1 Sep 2026 14:34:39 +0000
Message-ID: <DM4PR11MB6360F8D2A9A7E0F335BB748AF4A82@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260901120254.629261-1-chaitanya.kumar.borah@intel.com>
 <20260901120254.629261-3-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260901120254.629261-3-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH8PR11MB7966:EE_
x-ms-office365-filtering-correlation-id: dffaadb7-2a85-4f12-85e1-08df083627c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|38070700021|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info: mGUqdPrhtm7RBOjuo27Qw1rnxE67whMeJacSdk/I51O1ysnxnuneu4vo6LTezYW87c3eBY74aKXjJkGFpRq6CyQLojU6ebA7OKk4Pd0EcWSduL3CP4/pA68IJ96mBgpMBtPFX/7judH6zZsQcy4Jj9qDNBuDyoZCtn/MGmyvrM5/xaPXz4V4cDSeuUWLmiM74W452i5mUONfvd6UnaSgvRndVhn9jH+XM8SeQXTIZTyM4QQ+mtBwCs/dsWltkSVAD2DaFqQWiI6iQLGNk73NDk78/0sX0GRicsMhUkLBGthb5wLnvps391mTQ1HIdAjm0aVdDifZS/4olEnadBjMGJiJCsWZLHSbRKj3ZSOQc6fOHyVDlyTMcCou0ndpI9VFbS7+H7M3PAFrrcLcP0kJ9KafgaXEEg9p0ZF4WJNzJHcVAFWqqzg+Lm99REvcdXgM3ODYxkrmAmq6I94fCEtA19EVxiUMtAtEaANmX6fSR+jYDur9ArycJculo9QBJzrpPoyoyiM7vUJCHKKYw5BlHzLjai8vZ7Ub+OY1q3q/ikydHjiqHL5WeQj/C5FiIpXQvwQT+xX7ZmP+qlVMlOI3iqE4526hvH2ycDxZp0u7wGTlq+sGmZH4ISkcRaGEbXzTR3j4ueiXfdoltWld5EIT8o9vnxwqKy5X3TfJInzQj3R5geFRjHGbayKRlh/8fEZoXatGAycvaAv3ZOFu2LuZKgerc1ZmvJvt1+PBIweGEFE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vSWKcg99neQlBqLIiOIAeVIoMUiBtF91w1j8n6BFf0kKgi7gYwRi8aisFV9Z?=
 =?us-ascii?Q?H/Vn/QAR1tR7jDnSDoEix6SS0yu9ajbwKCb4JvTX6ONCohHn3hwGOIfEzsYn?=
 =?us-ascii?Q?zgCl5UKYNjpUo5MU1bSGxsZMedxkW2iCHJSUH5ejYXkY9NvenOWfQcQ31nDN?=
 =?us-ascii?Q?wBNcTO6VUYWiHEOPN+4LQF6bZ3HXlqUr3iM2MWxWmOkyeKK1kb5Bvg91uzKm?=
 =?us-ascii?Q?i2Qx0bmCSgOhvGT6Z9X3wDSaOC3mjkryR5fqg9WFa/dv2HKFMabLU4KwmTxc?=
 =?us-ascii?Q?vnBiNEZecZbNEqsK+SUip2zShBAMxknXyX4honRxfoIiK/mQE/HFzFwskJEm?=
 =?us-ascii?Q?/tE+8/wNgkTFMYXPY8RjuRgkjWHPdIJFBhUVxdEUtMgEL7BLmcVBiHPy1mMD?=
 =?us-ascii?Q?NjuvKQSSWSI3moBzV82vO9oXM+62tibJ6dquzmNVtwoOnVDd0SNbug9kFSJR?=
 =?us-ascii?Q?VId8HPisHrqffp/aaegKVC9vmUuncXPRB8oe5kxGnwLNmRsG6ju1AgMHpq78?=
 =?us-ascii?Q?qEEKCtUIrDOK5gg6jVZtffM3E94tBHWMyYS35sLs3MIPdmjdBK7VyCfgoAo3?=
 =?us-ascii?Q?OnU3bo1n+I2Le5GXs/XTZJ8KAus70i7MW37ycFEjTcEehdx40q3V2igrrNxP?=
 =?us-ascii?Q?pj4HLKO2vhW8YEH5qNO5Hy3D1URxGjrskiyANUYgmaNQC/+Y9L67RLrKTHBu?=
 =?us-ascii?Q?5n8DgaHKixE6chlaL6ARhqNAFhE1VECEsUM6H/Wemk0TtDZMN5kYGCH2mskl?=
 =?us-ascii?Q?dw16uFrrKedyyk2KOaUDQpCWB1hP3MK+rBKdRX02P4yVPdhXVY60J6e/mTni?=
 =?us-ascii?Q?Uh5mLkB5CWcDBhW1S/GTscnrdW2a/cCJ06JrLvCZXY1Yrc+tJmDqLXMizAGr?=
 =?us-ascii?Q?FqKVDw9EZtBwfLGjFuv6nmfoHoxvYiWbMYA1hqPZNXCKhNPYzQXTirhcm5Ev?=
 =?us-ascii?Q?McvsbGiHQmf9VoHZQiQ8HwI4mmGBXX9x3ns725UVFasqrl3O2b1QWryjVy52?=
 =?us-ascii?Q?L9R0Muwttw6X1hRVzUO322378FAd3xLuvH7xYItt0UISqazHOqFnufybqCzN?=
 =?us-ascii?Q?Vk9YzNOFvkNFHsacksNQ+680ILih6o7Di7YHj/baY2U4VaZP6RYTKyCzPcl0?=
 =?us-ascii?Q?Ftmb54RBideT3SyPdq5q2WlZpS1NitXXnZ9W5Dh0XX2HZFKnkgLhzYgct/8P?=
 =?us-ascii?Q?tMBx/QOCrHdAx57qAL+J8ly9cAIUE6wSh2c//tifztPno7AaFBLmZiPbI4n/?=
 =?us-ascii?Q?kU8ExDVrRr3F1e166UhOiXUkb+JI/4sjv9ADYu60fAswCYi8y79BNSkbqoIg?=
 =?us-ascii?Q?cw6FcriHjTD/lkuusq7yr5ZJYOnMo+LX6XdZK/O/p+PEcQh9BYf39modl2HI?=
 =?us-ascii?Q?tUVlX+JmMoB094kLIvhTy4MLrH630ZMQenEMKtsLphZcfE533cVDA+rD+qg4?=
 =?us-ascii?Q?nQIuixr95poot8QJ7t2oCKYxt5Itj8jpch2FprMs3nZNv3d64/hcDleD1p8+?=
 =?us-ascii?Q?2QWnmp8Ym2xAfSTnbvbxprqhVOA+dTnnKZl/jozXE5hVOYDiYjRgUm+kniFe?=
 =?us-ascii?Q?2JaJPtha7utXUBejUUbWPtTYEjSYSTIF2YiVs9CQJBWg8xlU8ggQHY9XOLVB?=
 =?us-ascii?Q?fhsDDuQK14Fb0LlVKV/1mT+rYBuMTAuuMWqx3IG5cAcHr7u0uHl56wH+2gSr?=
 =?us-ascii?Q?H5EuG4DZvHtSW1O3XWTDTgP6tfyd876zlv1mKobOiMd8EKUDVprbNRKpifsM?=
 =?us-ascii?Q?oiy1kxfT5A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: We7tCnI5bD3+2B0bH3Jws5ETTVeCJ6LMr2+cyBjnmT54oVPEvowkCH2HbgONnYGjNmuES+KPBMeNjyzkGcv7oBCa+yoCgbofs+hR6TQyuxIHgfWcc/Gm3LjaJcQop8j+N3c1kHTdJShnzt/x1XcJ20kHGzsuCoY6UOzO8fkQygHToRZwF3JtC8jzvi5TnJFj0giTnPtJO0+LTBNh+qFJkSFgdYCIsxYgJHtxmAB6YY1/xymFH2bYcoHaFrBVRLup4qihTDZrxW7bAGk08V4jN7aYzicOw5DW5o9vcTeIU0EMxvDuElHoolIUHeNn/YML9mAQRGZlb/TLoxUJKmT/Zg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dffaadb7-2a85-4f12-85e1-08df083627c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 14:34:39.7928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PxWPGKHZylWcXO11XgIsNnTK6FmBqg6Cx3KPi4Nh1TZpW3G2q4q2QDrtmHaY6OIuuUDuK48jzZl2UhYKpmp4hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7966
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
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Tuesday, September 1, 2026 5:33 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>
> Subject: [v2 2/2] drm/i915/color: Add YUV buffer support on HDR planes
>=20
> Add the INTEL_PLANE_CB_CSC_FF (fixed function CSC) color block as the fir=
st
> stage for the HDR planes. This enables YUV-to-RGB color space conversion =
on
> HDR planes via the color pipeline.
>=20
> Also in icl_program_input_csc(), account for the color pipeline programmi=
ng, in
> addition to FB format.
>=20
> v2:
>  - Increase MAX_COLOROP to 5 (Sashiko)

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color_pipeline.c | 4 +++-
> drivers/gpu/drm/i915/display/skl_universal_plane.c  | 3 ++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> index 38cfd6ed585d..7fc31fe891a8 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -12,7 +12,7 @@
>  #include "skl_universal_plane.h"
>=20
>  #define MAX_COLOR_PIPELINES 1
> -#define MAX_COLOROP 4
> +#define MAX_COLOROP 5
>  #define PLANE_DEGAMMA_SIZE 128
>  #define PLANE_GAMMA_SIZE 32
>=20
> @@ -31,6 +31,7 @@ static const struct drm_colorop_funcs intel_colorop_fun=
cs =3D
> {
>   * the pipeline totally unusable.
>   */
>  static const enum intel_color_block xe3plpd_primary_plane_pipeline[] =3D=
 {
> +	INTEL_PLANE_CB_CSC_FF,
>  	INTEL_PLANE_CB_PRE_CSC_LUT,
>  	INTEL_PLANE_CB_CSC,
>  	INTEL_PLANE_CB_3DLUT,
> @@ -38,6 +39,7 @@ static const enum intel_color_block
> xe3plpd_primary_plane_pipeline[] =3D {  };
>=20
>  static const enum intel_color_block hdr_plane_pipeline[] =3D {
> +	INTEL_PLANE_CB_CSC_FF,
>  	INTEL_PLANE_CB_PRE_CSC_LUT,
>  	INTEL_PLANE_CB_CSC,
>  	INTEL_PLANE_CB_POST_CSC_LUT,
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 0f604bdb4c62..2e5bf02b480f 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -1626,7 +1626,8 @@ icl_plane_update_noarm(struct intel_dsb *dsb,
>  	intel_de_write_dsb(display, dsb, PLANE_COLOR_CTL(pipe, plane_id),
>  			   plane_color_ctl);
>=20
> -	if (fb->format->is_yuv && icl_is_hdr_plane(display, plane_id))
> +	if (icl_is_hdr_plane(display, plane_id) &&
> +	    (fb->format->is_yuv || plane_state->hw.csc_ff_enable))
>  		icl_program_input_csc(dsb, plane, plane_state);
>=20
>  	skl_write_plane_wm(dsb, plane, crtc_state);
> --
> 2.50.1

