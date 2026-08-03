Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D250C5516F
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 05:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9934C10E2E9;
	Mon,  3 Aug 2026 05:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTcYHTYp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52CC10E20C;
 Mon,  3 Aug 2026 05:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785733250; x=1817269250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z3KTCanxeum4XyWGFaF4BlhYe+4JtzPi7xMg+Lh+Ho4=;
 b=gTcYHTYpLNyD85EDOOBNRTthmzaqIzwE/khOPCcXghXhml7yq2MaTKOX
 QigwCVyy7qCV1tNaBGunzd0HsuL78x2tBMV+XWWcqV7M19Lxdd5b6zQDG
 U31o+8nPZImePJMzqfG9WDelwUbwzUkTzIdl2TY0Jj0JM/FBTPbJ/+cO9
 wW5tIxXYHtwU5oGwymwIgzBVZvoa/QEzifuZzWbhqR2VorIOgZv2eEwM/
 FyEBNTIcDcKByFt84vXeO3mtQgdZpp6xFooO9WjHC9Twilgy3rX6/GEwq
 +zaxPfdfE+kYCJxcEbarPETMGohS+4rlRlhV3K871XIfCDPv9BdZsuxC1 w==;
X-CSE-ConnectionGUID: ZDnwTis0SNy48DcbHgsOaQ==
X-CSE-MsgGUID: J8/r+CqtQa6a1ZIayVO10g==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="103662577"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="103662577"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:00:50 -0700
X-CSE-ConnectionGUID: afFFjqVgSG+av449uBcjxA==
X-CSE-MsgGUID: P2HsVYxlRN6i/ehpjpzdgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="257203004"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:00:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:00:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 2 Aug 2026 22:00:47 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:00:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c37IC4ODLw0eBbHbuz/ZlOBvyfY4bZjKUVzJQxQd7dU0t7pZhSXpjWR5HcxVPoU9hWqaz8nVFZy8jHAMxLC6TnsB3Ya2cFde+bj8beGDBI19pOd6lwu07ppyE6fUaCllZ9KkGsYp+R2l1JrThaaCHv2m+B+itsgafQ4a12iyRY6AHQ5nD/VvORM9N4NLdw3fQq1f5j3L3LfRIk6EF6Mn7pP0ZzAUFe+cw+pJQOk/FpVqwdWTuSe64qmNELkZEPPJZaN4fkOR1kgrs6P7vhyTsARDMsaQfVgoPAy5rsO9+366AfASLX99TkfYHG9vgofcgQLkJo3YHVJ7558hYoDkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qutxYwL21Qo3M0U4RzYQiAG2rpaV3vBl4eqI6PAGfNM=;
 b=JJRjuffpoeAFQ0q6r++I2BiHamZHZPdMYvgfgmWFFNuoKPCEinMtynMvOhLSYg8rqKAnqzjA/fX/E0tUHGKwa6opHuX5aoo/QtU8SRU70XBpYsW8xmamNvYsgypOINXV/bWRtqp3EM8eQzoMnp9mYobvpHwogSV0K82nJVow9fcdEvVyLuGXe641tt+4aeDo9s6rzKkcyVAcZUaLtqFCu2rxyjbQEe+YGU3puud20axLplodE9MirUjbKbUbPQ2WNGcPYDKh62KreelVHSFnWVeVofKb3aH9zxJpe2jsvJBSXLTvtJiernDtylfOAfBTkKhUZGYCiKZP6pvpDedU5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA3PR11MB245380.namprd11.prod.outlook.com
 (2603:10b6:806:52d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 05:00:39 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0270.012; Mon, 3 Aug 2026
 05:00:39 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 05/14] drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
Thread-Topic: [PATCH 05/14] drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
Thread-Index: AQHdIBldsIpMxJWHsEG7pP44gWgI6raLyaNg
Date: Mon, 3 Aug 2026 05:00:39 +0000
Message-ID: <DS4PPFE901A304F8F7F3CA79920CB9D522BE3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
 <20260730105226.2731341-6-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260730105226.2731341-6-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA3PR11MB245380:EE_
x-ms-office365-filtering-correlation-id: 8ca99880-1d4a-4fa0-3ef0-08def11c29ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|56012099006|10067099003|11063799006|4143699003|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: K5AgCibnmlGOPyPw6x0qsFtX9GSQ3PExUm3Q6nB47AaBGOLXsnMbCE91OKBcv/eosHsUatzDjWktfbUXcTGYxvNzH8gNrFSUj2g3lCGjqLLAVoabgadYQYcMc4ChxP3Bmfup2lnyYoR7h5j7vdpPC59fyTHJnki8Dfq6nyhFogXmEl70PIcjQfOSKRTq03/ZNESo1o68tYPfozdd3VtShSsYSYO0yzJ4ZK14i8cQ3RZc0ZY6SWxTgY/q3CwGqpgJBJkVtp0WdNBJEKovOzmaJyWtooWSxRx0UlssXb32M2MgyeeECnz0QqdKymenXR8g+D73oMCRS8n+VNbFjqf/3DMyPBRZKZynBCnJYSem650SAlZaU52CASGPzx9B+6ZjsUyUkHDN9xRvbsBaarxbcXwzOGH71HuzxczG+d6YtdvPhqY3BcBfLibc5eKNVGNzqJxrWoohv60I9tfv0uVatpu5M3v0DaifMjpcabPJonO5+R/FReLkMZ9qGfKSYKKTkunutmlbwsKQiAXe+zfkBy0rNIP+SpQ3HQCkjrIK+eEL0zlwEzWgpFZ+uM8CSg5sNPwc4qi3vWpIe/8vbOjfk/5jbok7XfdeIP7v2JDp8tuh5UuUVSjE5ZIlbwgpUlsHWdX/Ai/scdAMA7hNaJM16b1+VxP7Gqmq0CRi9WFcp6uRWzTUKJrepRXL6kt8BHGPxFsTYDndK59aOEFbycEJjDZDHlOtEKPUmDOkQa49tHw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(56012099006)(10067099003)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DOOkxJeZn2ee4OkkqyREHfIMbjHxUTibOKP1GicPoY99TTbTxRjAiGGKkhAa?=
 =?us-ascii?Q?DxLVc2vuz8/knDdOiUDBF4PFPHPYo4IQgXl04rUCmemup7NCA/7bWpDNGOCg?=
 =?us-ascii?Q?zS9AplbVGl3hu0U0j7sz56lUMXDzSc+NtVNGgJ3Wpv+5bZUJhQArInXzqQ5v?=
 =?us-ascii?Q?cl3FbqsvZiQZrzwczXYgbyxrMcn46HHnhygeiMDlijHzzNDpuglRTBdIzRtP?=
 =?us-ascii?Q?lf/QCuez2Rns/CrVVD1Fv7GhpvoStcqwUv6qgRHdUSVB1wKCkBZuQFkkuen/?=
 =?us-ascii?Q?np7ppouxpCjJaGOLZp4tzdK0OcRwgVGn35ifEdZjlVXWAQCvLn09WKKsLaHK?=
 =?us-ascii?Q?8WV0CPandpl2IyxysUPm+QNuPddBU5G70VkVUrYhoFD81HkqnAXnGvebzbzl?=
 =?us-ascii?Q?fy6VYErnTHiimfw17+eKwItJo1mWmH6vEcfgpnK9kVzV1oaxaHqvqcBVKJn9?=
 =?us-ascii?Q?mpCVL4D5v1t/Js2TRIFz3mNjMCDCb7aOtuwG5Ul7zeUONX/hyAhE4zSkPmma?=
 =?us-ascii?Q?2uMg5lKPnZXz7VlUyE6IaZYuje+d47ZypnxKOuosdjNir0L2l/73Dlt25ZKK?=
 =?us-ascii?Q?VFzxB78Xw7wbsBDWhNNSr0NP76wZADKe7VriyhP1eEawazsFxFUF0rfpZJUB?=
 =?us-ascii?Q?nGXKQmnQPQF/bqxDqa68bgIEw8xroSsTjNuN4VIiEOjLTOx5Sfm6ar2dcOC0?=
 =?us-ascii?Q?cYQPGAzayDSCnZ8Aqn7RLvbp0WSnZfLx8Cu1zmColSxPzhy3m8r7WOsNXvCg?=
 =?us-ascii?Q?QcacyG/yP7gOHDxLjvPN32SQorGyd5YEzjrnikN6VU7M01dm45B0/hEyQmw+?=
 =?us-ascii?Q?mCcAPNHT5hpCPNVa4w9tL/TlF9B9PGqJ4IB+bA6FRxBdYwOlQ3Dr3w92khHW?=
 =?us-ascii?Q?kwvQhi0h8rFGtl/A6y2NvS+Mchzn5fzmd4yKmxS9hzX3fwsKJmwjO7t0vgyU?=
 =?us-ascii?Q?eLdqurzIG2yoD/IKC2bVhTqgHfgCNCXGkfa07zrMZc2D0GoZsXWZoaKgalbB?=
 =?us-ascii?Q?lldKRnoHjVReTRBVB24N3WKlkFnb5CHxuGYYrfwBYR5mSLWG27LXU5I2Bcam?=
 =?us-ascii?Q?/Hg1JmSsWWGvxF3K2+NmIOToiHaEXQdKt0SbJtzjZDHusUpNZ55I/eEfWEwT?=
 =?us-ascii?Q?cnFfCu1egEosthxmFR/UsBcUODxwMO6UkhO7eute2FkWL3gwsl8m5Uv/Qmrw?=
 =?us-ascii?Q?hO84SQYdsUuf3oCGmODkI8E6eguhXLCY8daWCB6P0+UvXhCwINHTB3n/RIGm?=
 =?us-ascii?Q?i1/6aC0Sj1dNxgLulg1kCcS+bSfpY0LL/aoa8HUgOpAkWEMIsNq0f13AtElA?=
 =?us-ascii?Q?CCMcs3HWd5ygMLVQebCEzEzsjZGZyh94t7DP5bLlF6/aFJiqG9zrrjmopmsH?=
 =?us-ascii?Q?FKwt0X05zBLiXKspNWnRRc6tABctQd7gYl3i3gSDSVcz9/NhYLp5awZTtto3?=
 =?us-ascii?Q?erPibykgva2QeECD2fEmEynPZl6WdLSldWuwCyZVz7WpE1BKJAehbX6WWxvO?=
 =?us-ascii?Q?Pn0muJL1Y7x+x+IbsDdK3vEJDSEhPuNyq7r1Dkis6o7wFCukHkzo964gr5gQ?=
 =?us-ascii?Q?gHPotV1DZTWsXKMUNEJxhpYr9GRvgFGl4CYJqC7UsZyh+c3TMtqEACeUPczK?=
 =?us-ascii?Q?YjFvUh06E8I3qVE59idLqMFpwQfDZ0IYf+LnA5GCia7T9uU02Ad/VIdCIhNs?=
 =?us-ascii?Q?YnM+9ciHJFafmJjH4gEHiLqsKqDlV7VwIqqiy2YlXyLQC7e5mdvMcvPHOnlf?=
 =?us-ascii?Q?6TmcuUmtnA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WGxJ3kpCm3aQdFiWdGpAx3G7TkpjRd1iPFYhaAE24i6PVLDXv58QOmUgWVaSxb6OSksnD6ssZMN+gxsozyzPbmqVdY50ZsLdBV53aK/h2mdCa2O00ld646Ga5FwgmZepiJKO+F1CutnO/NjNfFsHbBz4DtJM6Jr4fPkZ4b7wr1R+YNfJyvLfTRHOTPKKCbf+PaVkBN+KCMD9V+GjtacvWYBkZVKH2kQ3dgyGTyAOccWCsmWaMkV5/GYFtdMiLCxiQRuMstn7NUzCrady3hL5C8e7nPYMHYvgofIO0mu5ZGT3Iqg2m2tJuXFdHKYg+s7XD0xRQZE/nb0z01yuQRCg3g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca99880-1d4a-4fa0-3ef0-08def11c29ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 05:00:39.7861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xeYKnM61AAhwjsWG4iUGVb2l0ro3gGKMPxC3GaVXiqWH68eFLyBGANVGt+3o7TWRDxMf34IEXO5vHIlwqsshrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB245380
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

> Subject: [PATCH 05/14] drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
>=20
> The FRL bandwidth check considers only the PCON's max FRL rate, ignoring =
the
> HDMI2.1 sink's own max FRL rate. Cap the available bandwidth by the
> minimum of the two, similar to the TMDS case.
>=20
> Move the check into a helper intel_dp_frl_bw_valid() so it can also be us=
ed in
> the compute_config phase in a subsequent change.
>=20
> The DSC case, where both the PCON and HDMI sink support DSC, is left as a
> FIXME and handled later.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 46 +++++++++++++++++--------
>  1 file changed, 31 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 9d6f144d935f..eb76e6b6d616 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -124,6 +124,7 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)  }
>=20
>  static void intel_dp_unset_edid(struct intel_dp *intel_dp);
> +static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
>=20
>  /* Is link rate UHBR and thus 128b/132b? */  bool intel_dp_is_uhbr(const=
 struct
> intel_crtc_state *crtc_state) @@ -1178,6 +1179,33 @@ static int
> frl_required_bw(int clock, int bpc,
>  	return clock * bpc * 3;
>  }
>=20
> +static enum drm_mode_status
> +intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
> +		      int bpc, enum intel_output_format sink_format,
> +		      bool respect_downstream_limits) {
> +	int target_bw;
> +	int max_frl_bw;
> +
> +	if (!respect_downstream_limits)
> +		return MODE_OK;
> +
> +	target_bw =3D frl_required_bw(target_clock, bpc, sink_format);
> +
> +	/* check for MAX FRL BW for both PCON and HDMI2.1 sink */
> +	max_frl_bw =3D min(intel_dp->dfp.pcon_max_frl_bw,
> +			 intel_dp_hdmi_sink_max_frl(intel_dp));
> +
> +	/* converting bw from Gbps to Kbps*/
> +	max_frl_bw =3D max_frl_bw * 1000000;
> +
> +	/* #FIXME check bandwidth with DSC if both PCON and HDMI sink
> support DSC */
> +	if (target_bw > max_frl_bw)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
>  static enum drm_mode_status
>  intel_dp_mode_valid_downstream(struct intel_connector *connector,
>  			       const struct drm_display_mode *mode, @@ -
> 1187,21 +1215,9 @@ intel_dp_mode_valid_downstream(struct intel_connector
> *connector,
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
>=20
>  	/* If PCON supports FRL MODE, check FRL bandwidth constraints */
> -	if (intel_dp->dfp.pcon_max_frl_bw) {
> -		int target_bw, max_frl_bw;
> -
> -		/* Assume 8bpc for the FRL bandwidth check */
> -		target_bw =3D frl_required_bw(target_clock, 8, sink_format);
> -
> -		max_frl_bw =3D intel_dp->dfp.pcon_max_frl_bw;
> -
> -		/* converting bw from Gbps to Kbps*/
> -		max_frl_bw =3D max_frl_bw * 1000000;
> -
> -		if (target_bw > max_frl_bw)
> -			return MODE_CLOCK_HIGH;
> -
> -		return MODE_OK;
> +	if (intel_dp->dfp.pcon_max_frl_bw &&
> intel_dp_hdmi_sink_max_frl(intel_dp)) {
> +		/* Assume 8bpc for the HDMI2.1 FRL BW check */
> +		return intel_dp_frl_bw_valid(intel_dp, target_clock, 8,
> sink_format,
> +true);
>  	}

We can remove these braces not needed.

Regards,
Suraj Kandpal

>=20
>  	if (intel_dp->dfp.max_dotclock &&
> --
> 2.50.1

