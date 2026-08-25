Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94BBC61DB6
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 07:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7770910E92E;
	Tue, 25 Aug 2026 07:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqzHHh0f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8548310E924;
 Tue, 25 Aug 2026 07:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787644629; x=1819180629;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=817V+EYDLuZsUcJeabBeUeBBgdJ1afUn/3WAiRchZzE=;
 b=XqzHHh0fNOWUKidkfNOTEgtiuDxEA9aAumFUVLz0acNEBGZqlmrBKgu+
 qwrOkf/yFSXNo9nAzV3mtfg+2j1kYdCEMvowr6jV4EGV4i0bA1pO5SfD/
 Wom/cieRLoQo7jgdExiQMEeK4hKSz9t2woG7jEfvkw61zONbdoHWKeGYe
 4wXMympIJRKN6zQjukqc+v4DCtQ4xjXRCgSDZoIvFx7JIylKGh0ODrT5J
 jOH7NEUycX2RJUasafTbnl6w2/gHLZbdwuO9u5J5QmiA4NckN2TDpgJ6M
 xaKeGRBCpluSrYowrzslZr6r13OAZsPtpug9Lh7df0ty3jDqcar2Erjwe w==;
X-CSE-ConnectionGUID: sTUzLbjxST2cM2aSvUS9UQ==
X-CSE-MsgGUID: Y6WtZLFtQNe2DmL5RQi4ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88232382"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88232382"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:57:08 -0700
X-CSE-ConnectionGUID: S7O8kBbQTu+wZMYHqGMNdQ==
X-CSE-MsgGUID: msjE66LpRA+3GJRFB5porQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="264597963"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:57:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:57:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 00:57:07 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:57:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zdo0k/dLgsMp0e1sTMBHPb8xlhD9cEVC3PtuMaMMcp/vputV5/tiojLk9hFgqEmOkFJ2Uc6hdcv4aizwpoyCQkNxw149fmbcfCxzXv6Wfgog0QSz7C3SP9YZ+KCj5nT3O1wGA388kvsuvrnhH7ikllyVgf9Te36Gy/xevw65VpcUdg8eYApEhUWXD1UGXhwBagx+LoA5Zmef4eTSpn641MJoNl9PlsMo6dVSHcgcIsrtEKgnczZURic6t2q293Rpz5JuTaWlfbefGUhW/Nw7F12tgBFa82cD5GTQNXn39RXW2OqDL9fFUCmCjVFLBrxndn+wKPGp720bsNbvGDd0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3QWTJW2lWXENai3SIyj0cxmzw/Ul86fO5yW7Pkpgd0=;
 b=FdhT8lDxJBu7kdPz4aghAG1Ksn5Ty46pEkR6vqQDBJjrZO5jp9PJvc7g6Z0wO1Y42DHEfeasdW/c3JnoQhFS9FYYzcYvCuICmPz9VMXONpva9x2nbO72QQZQHrY3MOnOwWRF807Sam0F4wJZdbjdOY2CWjbxDYlupZe4BmQ51bHbFLkaiA0AaDDwRu2cUHhu4jq4auX7Fb1DqnZWPWrEyCCuaQUCzYd7tihMk0Md/3AC7itKeatK9eRiJnjfyzVChP6QjcRZ6rrjZlPh532xB9Ne5wgcCUYERZ3QXGE/FKouGX6YK6ruZFA+zHxY0FYJK+yOEm9ZXtDamLf+0c6nkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by LV2PR11MB078058.namprd11.prod.outlook.com
 (2603:10b6:408:423::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 07:57:06 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0339.010; Tue, 25 Aug 2026
 07:57:06 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [PATCH v5 02/15] drm/i915/alpm: Move alpm sink capabality readout
 in separate function
Thread-Topic: [PATCH v5 02/15] drm/i915/alpm: Move alpm sink capabality
 readout in separate function
Thread-Index: AQHdNFmt2x+c7qcn2EKZDV06m2OrHbauZZVQ
Date: Tue, 25 Aug 2026 07:57:06 +0000
Message-ID: <DS4PPFE901A304FCAFBDB20533981EAC946E3AF2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-3-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-3-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|LV2PR11MB078058:EE_
x-ms-office365-filtering-correlation-id: 08dfc932-ff06-46a4-a39d-08df027e7509
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|11063799006|10067099003|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: z2Szbzx1rmKAl5M8lZ7NaHLcsTe3L/82u4fEvScIHvPU01H7XoPhf8LDPg7MndOFUCWNyG8TnPRs4cU0MMQ9LdfZxyyNbAJ9ldF+SPCiKuX1LcCibnZ58imu679AZbBlQzW/entHXZereRNpc9+exQBFz7xedk9yiOCff71a9bhR+SsoF02znvSJJCiv1Bzm1t4XtPIk3T3CSDpVpsVZOaqD7MBvP/Eu0HkESz+dTautKKuLGt4S5n0D8+OBAgX8k8+9/n5roxO99mkwH+r4ItrJEezhkYM0NXsmgjLXavq/zkust3GZZvxkGg1Hf3SA7+GZWvFfi8rT8DS6X0OR5AMTT1go86e6HIpQtUugTf6KeHU2n67rMpcugUIqObVo9eTz7d2H9fTEiyJ3Cs2fQrFAlWG1VZjGV7iApBygYcRTsGxpzI+Y90LFJOME05ltPfFN3JsY56lsMuIzZzlyGyZOyicgPU6Xz2hKOKQRQpeR2LES4xy9mfU+XRynJLkYNfklNzhSu5M4Jv4kSB3Ah/XFY679Sef+5yE2Yej5An72T673OrKWObfimO95UYw1al33K4a6jMfT4SP0O6Qzq6ftQ7OViETEvoR/sGKaABzvH+JZhEAe8ROza8FQue1h/G5z/0Q7sdITvRVd3ou/+V2qRAZjGsLG6iU1SjvEKaG4tCWbJ70/MkT1hCVmmAuVygC0ufRlcwM3l6xOnjrUtT70aCDNXxeJncMN3WHjS+Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(11063799006)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c6kW/b1795mDY+5XAR98Vz/NH/jGEhOvSNXn8mzNcT+rX3umGVyNkgDmo8pw?=
 =?us-ascii?Q?ErSSBqfzFy/lT8S1FsVX0A7nkTfwVU6lRizJN6YqU3+TJ8xO7StJ2kOtXHJo?=
 =?us-ascii?Q?Oa2HinIW8WGild5mQiaAUwii+0WMKlp6r+2jjOmA+h3VuGHdm7101NYU75WT?=
 =?us-ascii?Q?tDjt37HqJfGroKF0Y/fgwuRNcYW40kJYqp+clHlPYUwB27VJ20sHpjPJGX81?=
 =?us-ascii?Q?Aj4SKbAkyasxJgI3xajRgccGGX/+iVsup9YkiJKWRRaEalpV4+Vdl7gLB1CG?=
 =?us-ascii?Q?IYxGBYfnPQqFPHwNp7uvA2pL4rH/7c0w/t/y+XrrTtB4+BnKQzmy167awAS/?=
 =?us-ascii?Q?jl5GEZUU+sxT6zwWRfbgrRZBrWAFNniC8ut+tgC+8lmSTxjAGPJctoiGg2v6?=
 =?us-ascii?Q?FjYLXA5rk1ClGdc9fJ3y0aY5waV2bd/RkPXKlfW1YMIzwFJAaDSgq/0rxPe9?=
 =?us-ascii?Q?9z4E3uuRdqVLPKq43tsiqxU3AR6qPBBRzLwttrZ3jvbDovcRDY9a0SRysdhS?=
 =?us-ascii?Q?PhByQQvZEG0GraOLYuteJu1MtF6X5A0ljaMwFai0pLLYBAQtKFvL5DaYHoPm?=
 =?us-ascii?Q?/LsCpYiReQUAGyZhw3TtnGJXYsLQplGNYHiWGMz6d2izpgK06qx0aNSNZXPJ?=
 =?us-ascii?Q?TSlPY0uYFNC9lA+b7uZ428IDi5EgneSl2ZPqy+PkhZGnIAUtx9LlIF292vNn?=
 =?us-ascii?Q?+RofApV+ZzXSC3o9wfVzq8NW/33ADj3Nj6eRCTCnm3Th2PXSpnaHxPz86lH0?=
 =?us-ascii?Q?WC7kHAbCTLYzKXOpX1Q+GJlG6sSUhFqFu5y535rLPt/OGpI7XFDudQkkMN0R?=
 =?us-ascii?Q?x+XL7Syzu+Jn2898lO3191M8avigQfpIu7FhDHz15iet0uSNOZXnXkC7NaTT?=
 =?us-ascii?Q?CjNruobh+efW7NCquQC3E7fK4h6GF+dR2a4ffRj3Jn2oxnX0nwPPTvs0QTwh?=
 =?us-ascii?Q?TDIij7DS7OWCcZtqwIGOWcf2sax0jz6GmKul6iOXW/yimpUkHy2byztbpAw7?=
 =?us-ascii?Q?c/qXoOKfZ2xDOBXU3drCuhhsYXCOqCyBlA522vxa6IE77kIvK4XvlRoOotuh?=
 =?us-ascii?Q?UJkm5nA1xU+UtDIf+405eH1LTy/xphl6tBEqN2vv/1xb/fLM7duIOKkE4fmp?=
 =?us-ascii?Q?yabNIEpQfRNCOjkGwTJ9/+voxiBvR5HOh3jxhtT4bLMGpSjnwzmOwCf886oV?=
 =?us-ascii?Q?8SGjvW9oC48fJ2fukPQ9INl/HqYrHO39GZ0+jCgYi/+KGWoTpxrmQDA4MLRk?=
 =?us-ascii?Q?uA9JsAst2JElZQHoyFKpjDc7+rxtEO2C1UOHlIPxbNWBPKkxPdaLpheYC9B1?=
 =?us-ascii?Q?irmdIrhtJXATWvq9jmDlo0d36SAA4G1rDl7+mLbazY6pq7ZO2wy2PBlT2R8A?=
 =?us-ascii?Q?cgChaB1gI3W08E2vrj05pHPImYqrgaYyw36bW9Kj+Xnuw1h6M8HZupAn+QRA?=
 =?us-ascii?Q?mO8fAUJAJVy7FxloWGA7KSSpSDDCt84DGmRe6nvsS75FOcLHFhcNDYsfIoDw?=
 =?us-ascii?Q?2N4WzdOjaqC/nPxi3MN9XzGw3/3TDf59q2P11UOjUsRJIKWB6nHdZtN50A8f?=
 =?us-ascii?Q?/gr4AHRttApeULPidGh2/67MLL/2z6H6noq7GZZInQn9dsjKkZQ1MuCJh5To?=
 =?us-ascii?Q?/prNGDkIegJyd8rLb32E17vwTodxaIC21wSOgCsEnXjqBgA5G6jFiD0Xvfl3?=
 =?us-ascii?Q?Hnj3L+bJQndrS3Kdd5udZJXIT8+9WrgU2SSxkr2NHVrBv3nPAx7DQ74ae5hk?=
 =?us-ascii?Q?/Sf+Y9/B2w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tBPdE8Iy/Kf6eZbTDUQ8E3onw+8pJ0+Z6V11cHDgpbnsr4CKLbvEx3+HBmNkRqqSwEPUr/DNZz9HUWl4Gr75u9b9Byk8AdwEr8yCiARZU1nuZYkYF1J+YzfUKXeuLeZJd4ULFDZh+RQCYptNLTQO7KoJRaAxa2h7gzldpqJdkDRT823UjLkwndTv6TefvZ4lkR0wV3ZR0uKbCPw2jnN6XYKtMtrH3rXDY/TDcqnVFodo+GNimJar20HrA2b636WOI2ZpdTjtu/Qyya47ahFfgMlZGtDaRJ8inC1Zto8JccLUZxdGZJ3ZworcLEGaGEPkzAmJbtT0lSA106wJnfagxA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08dfc932-ff06-46a4-a39d-08df027e7509
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 07:57:06.1967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iOdzC3p2yPRs6PTekkr49Tm6qSRgJsFSo0WApdFkao/ESR6A9HGBO+rAPp0qSNme4PScplW0NA/tNtWIUDbv9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB078058
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

> Subject: [PATCH v5 02/15] drm/i915/alpm: Move alpm sink capabality readou=
t
> in separate function
>=20
> Non functional change.

Please add a definition as to what the patch is doing something like "Abstr=
act ALPM DPCD initiailization into its own function"

Regards,
Suraj Kandpal

>=20
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c | 10 ++++++++++
> drivers/gpu/drm/i915/display/intel_alpm.h |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c   |  7 +------
>  3 files changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c
> b/drivers/gpu/drm/i915/display/intel_alpm.c
> index f1383764b702..542900e29a01 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -43,6 +43,16 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp
> *intel_dp,
>  		(crtc_state->has_lobf &&
> intel_alpm_aux_less_wake_supported(intel_dp));
>  }
>=20
> +void intel_alpm_init_dpcd(struct intel_dp *intel_dp) {
> +	u8 dpcd;
> +
> +	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_RECEIVER_ALPM_CAP,
> &dpcd) < 0)
> +		return;
> +
> +	intel_dp->alpm_dpcd =3D dpcd;
> +}
> +
>  void intel_alpm_init(struct intel_dp *intel_dp)  {
>  	mutex_init(&intel_dp->alpm.lock);
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h
> b/drivers/gpu/drm/i915/display/intel_alpm.h
> index 1cf70668ab1b..fae68d557960 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> @@ -15,6 +15,7 @@ struct intel_connector;  struct intel_atomic_state;  st=
ruct
> intel_crtc;
>=20
> +void intel_alpm_init_dpcd(struct intel_dp *intel_dp);
>  void intel_alpm_init(struct intel_dp *intel_dp);  bool
> intel_alpm_compute_params(struct intel_dp *intel_dp,
>  			       struct intel_crtc_state *crtc_state); diff --git
> a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 6b60e0a1c8ee..77d516f0bd07 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4764,7 +4764,6 @@ static bool
>  intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector
> *connector)  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> -	int ret;
>=20
>  	/* this function is meant to be called only once */
>  	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] !=3D 0);
> @@ -4804,11 +4803,7 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp,
> struct intel_connector *connector
>  	 */
>  	intel_dp_init_source_oui(intel_dp);
>=20
> -	/* Read the ALPM DPCD caps */
> -	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> DP_RECEIVER_ALPM_CAP,
> -				    &intel_dp->alpm_dpcd);
> -	if (ret < 0)
> -		return false;
> +	intel_alpm_init_dpcd(intel_dp);
>=20
>  	/*
>  	 * This has to be called after intel_dp->edp_dpcd is filled, PSR checks
> --
> 2.29.0

