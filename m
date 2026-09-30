Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49144CA5FAB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 05:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029BB10F1B1;
	Wed, 30 Sep 2026 05:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9KZM1Kz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B22910F1B1;
 Wed, 30 Sep 2026 05:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790747859; x=1822283859;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rn3nLliBYZGhukzvzL1v8qXZiGye7aF7Ib5/3ESgVy8=;
 b=J9KZM1Kz455r9iWVqVCq4UIUv2ts5tgBzhh8tvc6DdUDw5ffxVNBbhGk
 UH1Pdw4Zx3dytvVGXyq6wU0fNGHqgPzEJcR2FLqfSk/6ty9jWMvqNjxa9
 0bMSVP1NLT+lTRHT9255841IvzRZXP6AK1ERuBJcsCf3QvROK2Zp1i+9/
 2PkqNHl5g4Uurx8E8ziOjla6llrzjOu7Hv9Zd2iCr5vTn1kQS9kUOxH4/
 XP1RiX2TYjHu14W1DpffA/unR7OKwu5kZbiQVSoirijdNuL6KxdH6RDW7
 kPoECjE3PitfBhvCbVZS2GRp+c0QNJYKSuGQOTeJiC8yphAu1G8mMIlw5 w==;
X-CSE-ConnectionGUID: IvDhCiR4SmSQZ6ziHq/IGw==
X-CSE-MsgGUID: SMXjUGt0QhCAf4oBLqABHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95288422"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="95288422"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 22:57:39 -0700
X-CSE-ConnectionGUID: DQP7tDY0TxqfuX+zQXHWHw==
X-CSE-MsgGUID: 3VSUmlkwREC0jzz2/PTNgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="305102439"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 22:57:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 22:57:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 22:57:38 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 22:57:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUhCvJnvnp/UGBxRCxgIFH+b86YuaI0jKtGuRXO93coamTXePdpg3OCUIheosBrt0jKOgf1ty5eR8P4qt8rUFyrwpbgOuw490H5qi1dNGy7zt7e8rRW8hVXPtpNdMB4g3K/QC9+cXbvLq7OMU3I+ujX/6X83NGkdLBDlZwZyOI2lTvei4/+xftXqt9SbywK4SY+MVOU/v+FfL/bgNsXuKVatvIZzJolSw0IujmRUoxgFlqZspmW8CLB/XbSU/LF3tLLgOzWi1GnwQCiT9OsN5MtbIO3s797fK+WcmWxA5w2D5XIcRgUnI0R1fB04OrURePfzbdvtnUHWN253hwRkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGa7/n0KkmrfmZtXDzWkZEj39UxaV0EAy6yotduT6kc=;
 b=BO5SyAlJBy5uXR6Ny7A+utZhobvybOfQmwbsALhvla2WuILVUVG/qUghbCH8qpRPjvWUCmq2r5WWLbvnv/boR/LMVcnT/esxkNvgfZQfnuc7bfGMnwWYQDbnVZCw9y53YMh8faw02t5DPysvnr8M+vJAo5xwJBk6SvykJEUDxsp5w+l3ZoCoc+B6s6uuBggiiLtSn7OdBu1drjowHTFsQkCekQiWmzujSNPRHQTBFfw/WL5CHDuSoqfs1GBlxmFOa97jOyAvRDV1Z2pLgmgDU2uWIG8Dsv4+hydIQ065sKxLjfMqc0wxUstVfjn0LLWB2toE6R/3PRLe6wLAK2OyEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS4PR11MB086599.namprd11.prod.outlook.com
 (2603:10b6:8:507::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 05:57:36 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 05:57:35 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH v3 07/10] drm/i915/hdmi: Pass pixel clock to DSC slice
 helper
Thread-Topic: [PATCH v3 07/10] drm/i915/hdmi: Pass pixel clock to DSC slice
 helper
Thread-Index: AQHdUAPJHn2uHNhxd0GvHh2V5ehFuLbmoQdw
Date: Wed, 30 Sep 2026 05:57:35 +0000
Message-ID: <DS4PPFE901A304FE1DA7F5C13F1A42281BFE38B2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260929104835.1050882-1-ankit.k.nautiyal@intel.com>
 <20260929104835.1050882-8-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260929104835.1050882-8-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS4PR11MB086599:EE_
x-ms-office365-filtering-correlation-id: f58d256e-a9d3-4b54-8440-08df1eb7b9fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|3023799007|38070700021|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: qaziji9Hkc3Dr8qCUgqqMobwGFi7s5gR2hdAop5q5kzPR1mMHxebwFu6ls1CCP78lO3R/k7KiXIheJhKXzeG2rDzzv2tr+HXMaOfrfs+E5qfPm+u1ScoAjpJXiuYKNAWfXqtH6hSyeOOExsDUgk3QKSkXA8taPEsCRmgEsFAK0MOSJ+Z58+CkTWVR0KS4TjGW6Rz+7pDY/rDcwjoKqb2iiMqFFiCsfN8toCi6EJegQZgEdkE4C33+6lzGkqTNTqpCow9odz9MVeNRriZE0Ueo12iXKiRhPGV2rhwaXi5Mfenr1CCdFcYJJycD3+ax6uRTYhrjLjpmp9rJncO6iYz6buaa8ZRmQ4DMViw163HRHn3a6Q+H3m52uFhAAy3tNzypvSyF20yTjGyikYnNbOcgK5uM2G6YPlMLMwoVjR63CTO185VP539r9cX/X4y6Q9P6IgTXaaWAk1pl+8Es4QPhbaEtB1Rl1L5jAAQmx/l8xTjB28t2CXrewcOCAcbOxWzWslCfcC1OV9z7Eot1zr4gV3YIhJ3jP65q1bvF9pW3lOtKy/WsI1kVi3HqWyTxqnv3RHN3bUOWR/irlTvd1rcnhOjpJb4Braa08TbINg0xv69MufkisWnfCueTwKjqKi19sAAZTBEWpmUxY8CbKxVqzLvVg4+fzcansxpeDd5qabs5Sjc1i02bK3zfg5cdXkPzRrFscBbrjMkubvp9kXH/xdEHLP7Cm8/KlsxUHRJZjk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(3023799007)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DAlrse8SKHeRCNFBtBZ0FKny8gci3j4yQXsrg2fAz+2Ww7gt8ZkEkAX3p0oY?=
 =?us-ascii?Q?VxL9HhZGsSmG6f9lwIck0MNIU9rP7TROwF0kZmpeCnmiv1tuMTH7deJg+Tx1?=
 =?us-ascii?Q?Tb6t4YJRoQXwFLeszcywDMckw2lXAsKNp2brg8KuUmtrZkQCfipOd6qAtNGG?=
 =?us-ascii?Q?NTonDlSWQzQxSwTDKroyrrQ5AIpYGbv8MdRQbtJmHVywfLn7QdnCPEb6GQxJ?=
 =?us-ascii?Q?kAWmlrxm9UBSVQSnAyS9BSqAy39m0kSu+Nfxeuq2vk5RwUhLWf+Rdhyy9/RW?=
 =?us-ascii?Q?MLJq0vsgS+vDktPeYkszNhmwFYhpVYTsgN9Qy4E/SopSb0hq7G9rSJsjMfxe?=
 =?us-ascii?Q?JQkVrBKPwlijBZUnLZ31xHsXAS6/Mp8LHbnrEN0jigO5GlL1ImL3ouY4E7RQ?=
 =?us-ascii?Q?fMII7c7J6XKPI0yqys2uVDtMhXlFGq/l3Jr7gAfz2o+4pX3yJWi+QQuHV60M?=
 =?us-ascii?Q?6aKjBW6i4H5LbW1UWLiB1OP0MdmiH3Sh4A5HC98wgW/N/TO+kcSiYDi25xyc?=
 =?us-ascii?Q?5Iw5//fY+nkP+aUhLJ06MyxzWPJobpBu3x44a06mKU1TacUNGqEs+FiJRCcz?=
 =?us-ascii?Q?uodoOQ/u79CTrH+H26E5HhaeRxIhiudnsiqULLjtjNOfIhXJiZ+GTPmCCSZe?=
 =?us-ascii?Q?/ofXOlX4jMXC/2XcwEgla5dyF5QT4yPP9revCKyCBSEsIa1qp6S4M63XBChs?=
 =?us-ascii?Q?nMNsQCuKFerxpy0rf/3z78HiLHTM/q6QhaqLWcPiLY+v1Hnj9H52RBMVVUus?=
 =?us-ascii?Q?KM8Mck5ZXKxOAVA3VjLEZVQIt3fZByiri13RZ6PdxFD4/jyt68fGewwifUJj?=
 =?us-ascii?Q?4VukDJPoCICsxqbUoly1tNQkaCUi020L8hc5mrf0g0jGIlmIh4pwvc8vxWVv?=
 =?us-ascii?Q?xatKErNGE9sm6/c2cT6Kl6Q0CETu0IGi1obd34uEuiT6UEethtOGrqJYws8F?=
 =?us-ascii?Q?w3yg4y1FbS+QqZgft9WO6njhz0/OlLyKREzWxT7MJKo8hRy24hmAr9GQ5p7x?=
 =?us-ascii?Q?AhKA5gehOEAROBLhF7p/loDyGxZjAosr4zZQEkTYwQKByf13vfQ5vI+gRqsc?=
 =?us-ascii?Q?V5euQLBDuBLNjOKwvzaElflnpCPn8AEp0C5gh+syNVeHZI3Hba2OXC9MVGRq?=
 =?us-ascii?Q?LqMyVdbTTrrDzAfOBZsjS70sLoh/2nIR5J2cduwpxi7iDehSOi7jmctVyD1V?=
 =?us-ascii?Q?dT8gmnBJOnWgcmHD9HkquhIcVHWPyum2p1Xk+8urSYrfVMMDuYgGysi5JntA?=
 =?us-ascii?Q?B2edLR8ncF5K3M2nO+WSOmfvE95WGyTzYxQkWRQ4qVU04AsrUYtkWN9bP4Rl?=
 =?us-ascii?Q?X7bDzXP+rmXA+Z2uygcarm8rdfl5m1TwsaUZwRjwnD3YOPVR446MDUq387cY?=
 =?us-ascii?Q?AM/BkhnCVWjbkl/D4mhIrWOZN/SDw2yHF2GUTY8H3APD0w9UkC03H/0NQ6Uw?=
 =?us-ascii?Q?vN+wsfv1qtuEcuctq1G5oASAbPBRpJ+OH0wu2WRvTFUT6FeZTSjL9Hygp+jy?=
 =?us-ascii?Q?VSA55qpEJquW0VcmrfF6DNVJeZS0Z+WYeDMlYnZmApyel8yFYYCUvpbPlVwV?=
 =?us-ascii?Q?/COOluxN8C5iKQ6R0pzq6odo5uVu+kwfnq3dCoI60i7aS1iHMFGdsHdCyHva?=
 =?us-ascii?Q?ABOJqeP80K6SiqdAojy3IYuvzbsnYs2eYZeN7/WTpLjO6Eg3XtSJ3fGSt4Kv?=
 =?us-ascii?Q?k/EzO3MCz4VfSXqqKRBsv7qONv71lfuMc21GeEVJtuEz63GEGpa9hNQyQiYt?=
 =?us-ascii?Q?hR3O9LPUMQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: o8CTZEpyyorr+pcQi+aP1EVihkplsOzQ7CBGsZu8g3ud5tbt6x9n1vBaC6wFIZY1PC+jBfexGHUiNIFmaCnKO6QqNXmDD7rqw4SOuVZgk/gTkkECybmJuqDhFvY1NqnoYUHz5IC0iuKGzjmNRA9c+O2qYl2f4UFWvXx5016YmZRexNIQS8ZyHtQesNAAyzpzCEWn+sCNWSESf09XP4G+cRJu/D3GHP3/Gq7e2ewtfE5OWUaGkhwEtM16xBC+CHD75Cs6uDzKcX/LgukG2T7pqpCed76SgpzDWtKHARe6HxrxnV3Nq4oahJdlRsoGVsJv/xW1kzxrmISvOIZi8NEz6w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f58d256e-a9d3-4b54-8440-08df1eb7b9fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 05:57:35.7679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCJJnPsV8/UgChhPF7c9PrXM/HLOpf2gB40vJJ8TwBpfsFmaw93mZYH2HN16RzB3IhsQy9gqqvHeCYjtErpGHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB086599
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

> Subject: [PATCH v3 07/10] drm/i915/hdmi: Pass pixel clock to DSC slice he=
lper
>=20
> Pass the pixel clock explicitly to the DSC slice-count helper so callers =
can use the
> effective clock for throughput validation.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c   | 1 +
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 3 ++-
> drivers/gpu/drm/i915/display/intel_hdmi.h | 1 +
>  3 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 3478adb3fba8..412edb5b8c5e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4356,6 +4356,7 @@ intel_dp_pcon_dsc_enc_slices(struct intel_dp
> *intel_dp,
>  	int pcon_max_slice_width =3D
> drm_dp_pcon_dsc_max_slice_width(intel_dp->pcon_dsc_dpcd);
>=20
>  	return intel_hdmi_dsc_get_num_slices(&crtc_state-
> >hw.adjusted_mode,
> +					     crtc_state-
> >hw.adjusted_mode.crtc_clock,
>  					     crtc_state->output_format,
>  					     pcon_max_slices,
>  					     pcon_max_slice_width,
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index a15dee6ef329..83a5a6e14ebc 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3217,6 +3217,7 @@ int intel_hdmi_dsc_get_slice_height(int vactive)
>   * and dsc decoder capabilities
>   *
>   * @mode: drm_display_mode for which num of slices are needed
> + * @pixel_clock: pixel clock in kHz used for DSC throughput calculation
>   * @output_format : pipe output format
>   * @src_max_slices: maximum slices supported by the DSC encoder
>   * @src_max_slice_width: maximum slice width supported by DSC encoder
> @@ -3228,6 +3229,7 @@ int intel_hdmi_dsc_get_slice_height(int vactive)
>   */
>  int
>  intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
> +			      int pixel_clock,
>  			      enum intel_output_format output_format,
>  			      int src_max_slices, int src_max_slice_width,
>  			      int hdmi_max_slices, int hdmi_throughput) @@ -
> 3250,7 +3252,6 @@ intel_hdmi_dsc_get_num_slices(const struct
> drm_display_mode *mode,
>  	int max_throughput; /* max clock freq. in khz per slice */
>  	int max_slice_width;
>  	int slice_width;
> -	int pixel_clock =3D mode->crtc_clock;
>=20
>  	if (!hdmi_throughput)
>  		return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h
> b/drivers/gpu/drm/i915/display/intel_hdmi.h
> index db87656eb27f..375f1b4decfb 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
> @@ -62,6 +62,7 @@ void intel_hdmi_dsc_get_min_max_bpp(enum
> intel_output_format output_format, u8 b  bool
> intel_hdmi_dsc_bpp_fits_chunk_bytes(int bpp, int num_slices, int slice_wi=
dth,
>  					 int hdmi_max_chunk_bytes);
>  int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
> +				  int pixel_clock,
>  				  enum intel_output_format output_format,
>  				  int src_max_slices, int src_max_slice_width,
>  				  int hdmi_max_slices, int hdmi_throughput);
> --
> 2.50.1

