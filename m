Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC006C4450F
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 06:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F4510F44F;
	Fri, 17 Jul 2026 06:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bG2LIiUA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C111F10F44C;
 Fri, 17 Jul 2026 06:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784269752; x=1815805752;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fWbL95IDBtorlnfEPriW+UPddAdaSaQS3Aq+idV5R7k=;
 b=bG2LIiUAGRjQHZHe7C0Na13cYvoUJLaso2C9OyuZ1a2uFy5eMTg4wehm
 TLUbiDno372K7mdnTULjFZDOg3Vrbi7bRkkQpZMeSs0n+XvFElo6Xdbu+
 9EsSB0OAupEQTUUZYTtlHpG/pkSXDQdjFumizkNUXohY3EJ6R0VGsJBZS
 /TEyJbb6vSTcsizDqwVfQeBWwywmI9OQqE2wyI/q/j7mRRnnJBr9NF9CX
 EAPofJBh/qv1g2iMlcawsTNusTj608Jp5oEec8Ss4eb/u9XCt9dvoWFtE
 uw889efGPGlqhK3D8vgn8MUoSn0uNNzkXCsU+XKoHN+rf4YhyHdj05HEm g==;
X-CSE-ConnectionGUID: qrLhZRZWSBWd0g85+LbVnw==
X-CSE-MsgGUID: M2eEpWrJRmymzjd2QBX+jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="95592706"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="95592706"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 23:29:11 -0700
X-CSE-ConnectionGUID: Xkh3N08ZREW7E1tdLCifUw==
X-CSE-MsgGUID: mts9tCZgRoqegf0f/aaNhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="255555128"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 23:29:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 23:29:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 23:29:10 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 23:29:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJVQNOFTgNi23wWSC/RkanXv42EKKWJaxMurjrPB0f5ddCrRRh9mEm53x4zZwyXRHXRqPSuJBNy3ivqfAwE7m+q3XORMxY50w0S8BvqF9KrIAw0SXk6W5F32yjlGoPOzD4Ro3CKaeSUNj+HK5LkxshUmiKxYS+P/y6VwAyRcwH3UYC6Wxr3z6z7wsA8op0v6L0WSC+f7/9Eg3dkKKker1bowYvmTohI9TKrfZSeUhzr2C42DhwN8h9sqSQB3cqk5ze8DfG9hBUxCCazh8dFUF8dlNDnifvBBTBCEmsT6ktaMqROCfU6DIV9UAK7IVz2CNbJFm2D0o265Hzx649HNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6K2TfQDHEFlNk5xcx1JWQJRrP6iIldvED+WtBBpC/yU=;
 b=jm3lEcakDLW7RWY0HqMLY6/ro/Bfjf+RzFMFpHYiAUNf74iCbC3Tn8+i2vpZh2PRLfsjrmMD2NdvmlO+Qelz/XiWYPGAZSFlVDzxELrZsHe4hgyyy1SgSkYW+DDszVaOyeiVW+PutixEehB8U18yQ2cYKobSFkF4RmA4cHl1ovBZ4CuDXoYsVTPzXwfGtFJeGqx2YX5wN7SEe0RAVnlqwX68HxbLE2LZzqSenNRpnefeacU5xD1uENTQURP5m9jFtvHBu4wQKvsQiie65wfqGcIlsmYk0T/bos6LgLXYJrrZVmpTauaEJTUwCueWVlOBoMSKHaave72uiFCzjADVow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH7PR11MB6452.namprd11.prod.outlook.com
 (2603:10b6:510:1f3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Fri, 17 Jul
 2026 06:29:00 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 06:28:58 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 6/6] drm/i915/dp_tunnel: Add UHBR tunneling support
Thread-Topic: [PATCH 6/6] drm/i915/dp_tunnel: Add UHBR tunneling support
Thread-Index: AQHdE6ZLVB3vMOCnpEigAeOeYVrqwrZxQ6gA
Date: Fri, 17 Jul 2026 06:28:57 +0000
Message-ID: <DS4PPFE901A304FBC47CAD60A6F2DFBBB47E3C62@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260714152700.555527-1-imre.deak@intel.com>
 <20260714152700.555527-7-imre.deak@intel.com>
In-Reply-To: <20260714152700.555527-7-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH7PR11MB6452:EE_
x-ms-office365-filtering-correlation-id: 25943abd-a3fe-4445-8523-08dee3ccaee1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: 0G5Jp1jjh2dpW5xZ1yfe9H+D57z6LedQWperDLO6AOln6dI2cqa/1XdAyjhaJsxKHAY+gE/TjYv5hmaRurhCj1t6Ei24xojj9Vm4f9bmlY5zjnUq0V+OjLtKvhYJpYsCUFOwp3La6iy9KZb/0xh5R5L76xlJfE77Yl0DXmQIq8syGaONUYJX6jQ/X7xOyv36cLUFhIHwvoQcRwpCMZ3okUEGI1l3TWPSUMFercF6BwHmtsl2sVsoetGzcqJrrOezCfgZIsYUbYmfawVx/xsqCNSBK3d3nvvtBUrb5hA0A/HOk32/c3OxX7BU5UeegapQRyeaibaRNcugQgtdsUV60xmUgPsomQbdNGwcCbX6JWY7r5yBpJUx3p7qtOblz+sDEJXoNgmShQDUfd7HskbfDZiO7J/OkkUvgsG7aAn1p02RuYaF7lz/MdlyqtWTuKwHr+R1eztyReu17CmOLCE3Tra4hMBk6D4yrRy8460PRISaz8rTGj0Ud+XF33SLNPVY758uzZJqw4ealQYg7yfLCVQTenBLCwZS0fUdD6YyU4Am5P7SVrYqi6ZW8O+tM0NsCohStGRf0bL2VrtKeOrWYN7UpzRX3now7txA3q35rhph9W4WaPr9GyVgGDbdJysFtxvwfu6rYPZdts4AIL04IflA5uFAYvZxIyKDu4Ccgj6q50BFzKQe5yl90XQpB7ZKMzRSycp0qXU8Yp2rk6ukONMmU8a61XbbTv0y+XHPgjg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nXh5xnMnps3fOin94tpLQ8RVYgCM13uVh1ZfHxPSh6dUERJu8ccCqlAzKpg3?=
 =?us-ascii?Q?dRth6BpTjZtx42IKDNRMW+PVFBvUjFlzu7eiaYUv7XPG9Hhdle6OoF+7mipz?=
 =?us-ascii?Q?7umDmD/nByoHQix6adb9iiWvUpxUexPhSq5B8ipVMpn0g54FxoU5DzxlS0u2?=
 =?us-ascii?Q?LDz4se9kgLpVlSnyqCpzWx0S1ju5PCFRxmPtWuiNpn1/DMA9CVncwrhZOTK1?=
 =?us-ascii?Q?e9/8TktJgOY9zejoOex8XnNord0MizvF/EXFmt43nWlmjyjoAT8s5/E0R+Bp?=
 =?us-ascii?Q?RHSX0zSNZRUsW8PSw0RQ6OlyW9Rdelr/lkViB+c5UegsKQiAQeQupCDHJY8f?=
 =?us-ascii?Q?qBDHZIfNpONLJXxBl7oCckksgTVo7jCZd89TG20yi48wqu1hkCIhqmUqJdD3?=
 =?us-ascii?Q?qhsMzCrnlmYLsWUUEp6MD6IIzhgNdaAHdalDQba8zJrSZJ+SV3I4doin1ee4?=
 =?us-ascii?Q?QbuI8/5OdP4sI5NWCrizpTboAU3tRxSaZSs8C5Jktijlj9FmL0kxy8sKrK72?=
 =?us-ascii?Q?irbMvep7t8gpN7TkAiRRtmvmKk0NnvoQnF+7T6XnxnmVSr06ES2FxNTTq8Ny?=
 =?us-ascii?Q?Xm/YOzw2cmglU5BilqDiA5FGGzkDRmVrCsYazFVHG0XXDEBDxR4vfHIHA+06?=
 =?us-ascii?Q?e0ZmoLxS3QAYfkdOFUWdxTynax8iswIG4B9CxfrD5uwGv1Mx+Wcyt0sgQPzS?=
 =?us-ascii?Q?nECDggBc6lzEe7uV8v7Ce6HsE2w1H9cYZ6uM/flX+V699Cp1RHu8+OQZPAPD?=
 =?us-ascii?Q?ji8ZZNV51CbGXgLgfC8Qg9Eebi8PzqjxXu+AIXoxw6LPqRaREqrM9ui7anFS?=
 =?us-ascii?Q?QiwJhJKVbq44rQ1fpzltwXbA6C6AbwCTJ4v0ru3+RvqsXrzLR3uW/i3R0xMT?=
 =?us-ascii?Q?Oo8CfLcoC3GpWYPsZ1W4bSx/5iX5IqubIdUYIZ2O/D1p8rRdJWWmWXNIebGh?=
 =?us-ascii?Q?WbQ0I+VBp6yKbzOFCyNgYhbTGokF989g623ySo2NbWKAAxleXogbgUqJli0f?=
 =?us-ascii?Q?7Ney9gH8YO9FJNQylfcD3lYqagZbo/cUKmGNQ8qwCrigxKH5oOZ7Cb2EUSX1?=
 =?us-ascii?Q?bsgf+wJTyJjlzkMqYuhdUwDSX8ke0hS3kXtPtUnRF/BNudprgdKwi1Z0wDm8?=
 =?us-ascii?Q?hf0bY8jgn6Or4zXLxDy9keYaOmfvA0kDYeOdc3HHLjUtFbBz5zjq9MEiCI2Y?=
 =?us-ascii?Q?gaFXvMa6wZBovD/KCMLw1CEEkCRjJRbd/Z3afnJQyKrstDV0NCnrlxdIeQle?=
 =?us-ascii?Q?Jl30tkDl5jqYC8/9MUxa5mGSW+Yd29aOnALVk872PcIyZIVNfbJJHq64Sn8p?=
 =?us-ascii?Q?L+lr6T0v+auf06nWu5pdr1Zmze8jZxlFb3j+r87C4+aAM7y+bXlWYrzsVPGR?=
 =?us-ascii?Q?SJQDCsXOSN57YeXwulYd877rNOoYKdHHPk8zWrYoAz8gMT22Qo3lQlsgLh7J?=
 =?us-ascii?Q?vuTfXkCIKbrQPuq2IEDGxF2krr7HOXwbxw76uNriPpvRjrYhNGs4iM8gata9?=
 =?us-ascii?Q?748sVre6o66iLsppwYkLlcnmcCDNoN58wgUKXIQNXhto6dp5uZqHUsOc+kdc?=
 =?us-ascii?Q?YJbo7aHcgKwrk5ZJrQyF03DWoLTTeOcf71RJYW+zdZzRtZ+JsMJq07HILye2?=
 =?us-ascii?Q?uUAgOxVKdQXawKT72zp5QNLTirGUsNFnMZ07zSUlNFWAfk+MmORYhXHH31mB?=
 =?us-ascii?Q?grrwA3A96XtWfp5yx0CF6CzS7oZFWgxc3BbDbMjx0C8YuDYxqaBhvrbDhBTB?=
 =?us-ascii?Q?PDqCaXI75Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UD6BDFNJCXLgdZTaFix/KhdJ9ogi63/T/Yg0EQ7HfRt0X0JfwAQoVhdU3wbXoqjlsFEtLpA0JyD+RTIcfZ3mSTJ9acQCPY/b6rz1ECzTiKe8aigM5I/DEPUC6exHzA9PNEzIAl4GcODQpsjUkdUCQ8/NpQEzeYyvx1C0vywdBeYtcTF23qdL9QvtFo5EU1bu5/a8H86YVuy5bphbQk6NrWh9RagstP88lRutKANp53eUhsM54kELTCTD6qzHCWxl+UXyXJ5lVl2Ciw8DasgwPV8HgjQmG//wcHtrYeUtek6wbKyozqZPZU0dpALYYfzSJTaMlMEMk8A9CXd6wTZ8rw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25943abd-a3fe-4445-8523-08dee3ccaee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 06:28:57.9943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BjhcsfMQUGkzh6vnLkNCK1c3XA05mi9iaXvrcZFJOAibXJXpBmWQUFyqZ2VshK6hzVtuDvozz33WSZtNVBsmLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6452
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

> Subject: [PATCH 6/6] drm/i915/dp_tunnel: Add UHBR tunneling support
>=20
> Add support for UHBR link rates on Thunderbolt tunneled links.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 37 +++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index e0b95fbf7db0a..eab22b161ea1a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -191,6 +191,29 @@ static void intel_dp_set_default_sink_rates(struct
> intel_dp *intel_dp)
>  	intel_dp->num_sink_rates =3D 1;
>  }
>=20
> +static bool dprx_supports_128b132b(struct intel_dp *intel_dp) {
> +	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
> +		return drm_dp_tunnel_128b132b_supported(intel_dp->tunnel);
> +	else
> +		return drm_dp_128b132b_supported(intel_dp->dpcd);
> +}
> +
> +static u8 dprx_128b132b_link_rates(struct intel_dp *intel_dp, u8
> +no_bwa_rates) {
> +	u8 ret;
> +
> +	if (!intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
> +		return no_bwa_rates;
> +
> +	ret =3D drm_dp_tunnel_128b132b_dprx_rates(intel_dp->tunnel);
> +	static_assert(DP_TUNNELING_10GBPS_PER_LANE_SUPPORT =3D=3D
> DP_UHBR10 &&
> +		      DP_TUNNELING_13_5GBPS_PER_LANE_SUPPORT =3D=3D
> DP_UHBR13_5 &&
> +		      DP_TUNNELING_20GBPS_PER_LANE_SUPPORT =3D=3D
> DP_UHBR20);
> +
> +	return ret;
> +}
> +
>  /* update sink rates from dpcd */
>  static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)  { @=
@ -
> 199,6 +222,7 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp
> *intel_dp)
>  	};
>  	int i, max_rate;
>  	int max_lttpr_rate;
> +	u8 uhbr_rates =3D 0;
>=20
>  	if (drm_dp_has_quirk(&intel_dp->desc,
> DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS)) {
>  		/* Needed, e.g., for Apple MBP 2017, 15 inch eDP Retina panel
> */ @@ -224,17 +248,20 @@ static void intel_dp_set_dpcd_sink_rates(struct
> intel_dp *intel_dp)
>  		intel_dp->sink_rates[i] =3D dp_rates[i];
>  	}
>=20
> +	/*
> +	 * The following register must be read unconditionally for the later
> +	 * DP tunnel 128b132b detection to work, see DP Standard v2.1 5.14.3 .
> +	 */
> +	drm_dp_dpcd_read_byte(&intel_dp->aux,
> +DP_128B132B_SUPPORTED_LINK_RATES, &uhbr_rates);
> +
>  	/*
>  	 * Sink rates for 128b/132b. If set, sink should support all 8b/10b
>  	 * rates and 10 Gbps.
>  	 */
> -	if (drm_dp_128b132b_supported(intel_dp->dpcd)) {
> -		u8 uhbr_rates =3D 0;
> -
> +	if (dprx_supports_128b132b(intel_dp)) {
>  		BUILD_BUG_ON(ARRAY_SIZE(intel_dp->sink_rates) <
> ARRAY_SIZE(dp_rates) + 3);
>=20
> -		drm_dp_dpcd_readb(&intel_dp->aux,
> -				  DP_128B132B_SUPPORTED_LINK_RATES,
> &uhbr_rates);
> +		uhbr_rates =3D dprx_128b132b_link_rates(intel_dp, uhbr_rates);
>=20
>  		if (drm_dp_lttpr_count(intel_dp->lttpr_common_caps)) {
>  			/* We have a repeater */
> --
> 2.49.1

