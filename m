Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A28C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF2E10E9A9;
	Wed, 16 Sep 2026 09:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/ZFb0hA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A830F10E95A;
 Wed, 16 Sep 2026 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789550082; x=1821086082;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XiaOaFxpspN2bKGFtICw0jxXvGFihqJnJWiW+UZ8h0w=;
 b=F/ZFb0hAYhSwDu3udyKmHeIkvcvMmDPqcUrBNeNH0R4hz55Sh5oC01Q2
 2cS39N34SJOTkvhFEIcUlq5dbCrivYMhZQ4n09EHUBAULhPLq2nEj45r9
 56ZNrRaaE80rGKBZbmw5ViHF5gNvlxk66u0Hcpl+Gujqvu4pNGQYLYdEI
 T/pN2SHOZr9DFTrb1oBDRpj1MGeoFKkf4bRoW/Z2OJOfOetMF7bW/qMtW
 I7uNDGXGYaS6XyZSP9qQwMmaoxahIjrTn96yMi0jvlqZak0rIebV+LaAQ
 Jw7Txj2+6kYhnaJYfG0R5zLFQq41Gro15jl7r2r/AYrLpjrTD9aVjT+GH g==;
X-CSE-ConnectionGUID: xdaiTkN3S7+lLqmz/zxX2Q==
X-CSE-MsgGUID: bn/98JB7SkCQqHBhSaBc8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100246916"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100246916"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:14:42 -0700
X-CSE-ConnectionGUID: cwDNO3H2SFGvAU1I9iXYKA==
X-CSE-MsgGUID: q5wvZPRJSCepiKZPkhST/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275245439"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:14:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:14:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 02:14:39 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FA+uB+gnAqKWDHeUTHewkEFHYEKHjPQfft+hyCSet/cNzJe5TGuv8UvdiFhLv9UWLgaqwLmY0G6JdI5BC4wf3i37AhA9k6tipecs+HDX+xGMn9Ospgl6ujEHWGPLBiriCsGFMJXwgrglygBe1ewYNb9foSKBVtFgr+VVYH3qQWurZInJZ1gG1UpNbkIqaI8pNnLtikiX8nyBAAvWbbVKTkAiyKLXFqUEsx23ZcjQNBGKi0QuQci51ELfRFFllWCVk6cs0blc5rJ55VVSIkfiXpcFM9v8FryO2Qw1mLfB3F/vPoRd5+lJGcsZRwzefMs/cc09f9zN68WLNFv2Vh3GSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2zG2aoimFnnVcspMGEH9YiKXCMSe9Nx1e6PqmG0Dww=;
 b=Sqpq67+QZ6eoS9jy2gmaTd177WnDTAmHOKk89UezNTlPHn1cGd3KomRmRirDZnZBf0AuKvvyFx2U/3gaXe23BfQAb00O93vqNWsZ2xV1W5BCdfojvyRXAOAmD2vltThvnJ7FY8VxuTdZTSryxYOOgk/KKvhOsRBuwkhzOeaaV3LhA4vt69WG+cdan6PMS+8vbKeWoN+Fjas60Z5zX1DbbxcouJf56+KTbjU/bOzYEh2Zj2e33L/csyoyKm5TLvZNqJS5Z8BWdNpFlmG2HRUEahwHjj/UNwV0SmRvAA1RvxjNXYR+0F7Z+hYH5WdMHcSbW1XiEWkaSbUIwOhSv1do1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA4PR11MB9372.namprd11.prod.outlook.com
 (2603:10b6:208:568::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 09:14:27 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 09:14:26 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 01/11] drm/i915/lspcon: use u8 variable to hold 1-byte
 DPCD reads
Thread-Topic: [PATCH 01/11] drm/i915/lspcon: use u8 variable to hold 1-byte
 DPCD reads
Thread-Index: AQHdRbWTyMygagMwUU24E3TS3lkYbrbQ6/mg
Date: Wed, 16 Sep 2026 09:14:26 +0000
Message-ID: <DS4PPFE901A304F5AFECEB0CF447427A5BAE3B92@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <66a74267a3da7619dda8dc2b1bb1bfcedc25df0d.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <66a74267a3da7619dda8dc2b1bb1bfcedc25df0d.1789547331.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA4PR11MB9372:EE_
x-ms-office365-filtering-correlation-id: c229f78c-0833-446b-ea50-08df13d2e821
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: Us1WwZEoyxPY6DhYnZS+dREn9jePZyyDXyIEXEFXOXkDWy9HR5iXE/Gbxb7a0v/njlRdW20dAYt3Bxh/UW3QXJeo5wZptqCirVynYi21lodDOTsbNYSfDnV/PmHKKM1Q9Y0V60rOhinW3dgeMKvryRnP5k3p5kI99BN5ET2CYJlUpXFsRzs0nmYEfjlDQLEM/1Ru6I+8FSCSGwv9qvEyXSaSXQAxNW0Xd3ZtBGu+EKJygjqosR62XW36kwtxiC4p20iibPrEeZM+r32XNFAgEjwH3pcwvsCU0NimdcF4kT2Q/zUrg7fYLAh3f+yzuzuh1jcRv+z0R4tMyfqyg/LGQTCcEjC1oTxOhS2xIiaierUnXHADOUXS1lmPSc6gVc/G9BV7FPcr3+TcAnbdwjifF3dH0uJTEmYMTDJVKsU/HH4mx3Cn6QZXTaAnFcszGI09qD+bHZqG49pcWHoeJAVgEH5aK7PXFXEvMS+YHxadPeKQIXjzkSI3eJA2Gq/3b9jx5pjPU1mwliJHmGl/CAzsFQx4s0DywuDQvTv/+/4DJ1eEjnmxp669L2a92imJo7xuA7Tp0ZeipXW0h2TbgTKAPbsFETrCfETgWMyYA3H0nA8Fa79IfLrC3jndY+x36RkNl1mhJqHTOgC7uAw+ChyKZr0j4wRn+lOVyNIbq8JeoM5eJjsBxg/eVZbOlhkZDGmNKnX8IbFmreVDu1QITsQ1JkEWY3LBhy5RKYAmbzawM6c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wAu3EVL8wH///3tHEZukerVL1nO7Oxdi6yjIkW9U73v+Pw4nrpOm3wol/Op8?=
 =?us-ascii?Q?wNYv70zNCkGZgcT14gvOsff3nUho+saWiKdc4WmRLsZWQb/Zc+zk2t2z91ND?=
 =?us-ascii?Q?X2o8TuHfezJ+a6fY/hITj4x9HdS/1jxxW36a726N0mSVgDJ6yPB/4HfJffO0?=
 =?us-ascii?Q?V0K1QC2Wr9/ESjA3vxoQvry+ovRQlNtbZgyFOtiCSAKBtuCyWh3WC9GEO6jF?=
 =?us-ascii?Q?/lE9rdkcJHO5FdTnztYW8LzPGzJfnPZPN63yAYaMjZkkMAYtcD9ynYwotwYR?=
 =?us-ascii?Q?q7WQMELKA8rer4J2QlGcYqdOsR5L0k6gi9cz1RGHOlAkc1YqWWoBMcNWy1rA?=
 =?us-ascii?Q?EufWa+d7wf1/q+Sz/YDR/9llvl9byZGKwMxAXk++tvmVzuf2OSI1qBv362hH?=
 =?us-ascii?Q?yfXRn6CzeBfm7HiFXjhn3wfIa9K1IEsnOj9/VpTVRjW+hXh332OGTPiiPbSq?=
 =?us-ascii?Q?hlWTXv+EWTbZWzmmNE31V+aTe1j0uldIGhnl15GVOrvztTlY05IQyG6JuloG?=
 =?us-ascii?Q?iCKZNPJbDyWkmiHBhPTwS1e1YGM5Fr7G2cuJouV0Arb80Upr1IsTKdaXzbFi?=
 =?us-ascii?Q?gFG9XhgEXbPlmfeHTd1yy5neynt6+R2t9bGKP1/SVJXfrOfMeryZhwndbcMA?=
 =?us-ascii?Q?LUkCYRWKv2F7sDRJhzG1gz7qDGWDBtcgY8c5KQl9Pkjvk6SfRB9ub0Uoaf6p?=
 =?us-ascii?Q?SUclieH2IjFi6wT1trlzP1OF0psyCAIsXf+hvHkh0rzinAGEZW1qz72cAfwb?=
 =?us-ascii?Q?sUVVMmGwt/2IpYwcGHLoBbWQlHuL+8yCzI0cv1zT38+568s9lwUvyhLMZ9L0?=
 =?us-ascii?Q?X0AiNsrMe4OjgIw6d4ScHR3BMZtzpTmMpVjTQmUdUKyB/2iFItik1AcVKL/k?=
 =?us-ascii?Q?QEjKctOkHRmmOwiIHqOH73iD/J3sRn58DtzaLFPzCv4O8iwFBZnCUwLuK0IG?=
 =?us-ascii?Q?R3tw1oKzv2/fJS4RVsknNWuP3SzBA1+HqOq5EY3c5WWWGAc/KzCWFx8ZmdQr?=
 =?us-ascii?Q?f7sd2pF5XmTtk/OCrHZKwi9mwRfVjWqG1r4kdfq8Bdx324XDXDeKdBZzXvHz?=
 =?us-ascii?Q?w9nGZFu0L+TjZpmt4YvEMGTx9AqBv+9G8lhCDVXSEk7UztC1VDexy+byvZD5?=
 =?us-ascii?Q?UMpcVaHx5aOm9sqVLDSnojXdm6ErWFTYRR29kZYj4rfZP14Y8IZMMdFQfCYt?=
 =?us-ascii?Q?rV5r74Ltt3GQiZOsNzFCFg+BtO7Jon2rcyzgj47DQkCEmXvUS68HawtbhyVJ?=
 =?us-ascii?Q?kKc+miuPzIq0b0brMm7ABbQhfgQB9vbniM4cTIBWUIB05bQ5bH1eeWg1gtQ3?=
 =?us-ascii?Q?PIR1O5ikzjeX+kKHFL2BmIL9jL7JKixqXdeHUjVl7A7IA89gb86h910jSvcQ?=
 =?us-ascii?Q?s/ipUO/gKwsvr/cnMSmSuw9G5naLgGRU/EIV47186Z5MRk/c8JPNF8s8Ddrj?=
 =?us-ascii?Q?2l7A7W7YAporXSEV0Bjy5BjHT2ZVvGxi32qTiy4fRu+/wgPTSlRchQO6i7uU?=
 =?us-ascii?Q?Z8Pk8P5pFkvIzhciz/GQeAqc3+IW57cJtRKnQPFo+YsIpQ5MIxCyfafirhnC?=
 =?us-ascii?Q?nI2cvJGYjqlC1JzIQ0GKzUE5TPKyyvqGIieHH/1mvrIInFLNUkSgiaDAf6HC?=
 =?us-ascii?Q?efjPvrvXfyoFVu2mGMjnonC/kzTbqO170ZzQlFpS/jnlBnMULwlop/iQPB1e?=
 =?us-ascii?Q?VkDRL6R4sj+94PZgrLEMVBcovP6yNmSm/xo0ej4bw9XBbYEMlvfP+4ATAaGw?=
 =?us-ascii?Q?j10dcmmuAw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mRK09Vlc/jLuMTjthpdqzrrsnjdvVvQDvGsavEl/cbB8/bX1/WukOwDJ6EsXlu3AgJKR5SNWrcyEE/eswEIqa9Il+hOii8ASXy+gKT9B8OTxED8mrAWGncw4p8uPXat/cS3k3FNmDdBx6TiqbdmoQdzp4QmLZRYDzwCa97dFSj+nDHqp0WWHJtdHAcMYw+EN1LrhxJe/sUj+KJuuTds8miz6G21d53/ebfccqZ/V2GFeuE8UDSXzxztW881WKqzZgPV4yKzJfdyieUMuYKWUN+TkBVnbF78Oa/iLemhiHQrph2Po8NTAPxn14ixJ1mDxp3zvrIHUhuH5wvQi31ddwA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c229f78c-0833-446b-ea50-08df13d2e821
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 09:14:26.8304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wlzjkFStvm+VS+W9JDGcHzAqRDQ4KMPrFyedoa0w6gg46o+WzE8Cgkaur/nxIfkqX5oez+EHKKunXar0IbQsgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9372
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

> Subject: [PATCH 01/11] drm/i915/lspcon: use u8 variable to hold 1-byte DP=
CD
> reads
>=20
> Passing a pointer to a u32 variable for a 1-byte reads is error prone, an=
d only
> works because it's always initialized to 0 before the read, and the code'=
s
> running on little-endian CPUs. Switch to u8 variables.
>=20
> In _lspcon_write_avi_infoframe_mca(), add a separate variable to hold the
> number of bytes written instead of reusing the same variable for two purp=
oses.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_lspcon.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c
> b/drivers/gpu/drm/i915/display/intel_lspcon.c
> index 9ceabbc981a1..b306bf5f6130 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -435,14 +435,14 @@ static bool
> _lspcon_write_avi_infoframe_parade(struct drm_dp_aux *aux,  static bool
> _lspcon_write_avi_infoframe_mca(struct drm_dp_aux *aux,
>  					    const u8 *buffer, ssize_t len)  {
> -	int ret;
> -	u32 val =3D 0;
> +	int ret, written =3D 0;
>  	u32 retry;
>  	u16 reg;
>  	const u8 *data =3D buffer;
> +	u8 val;
>=20
>  	reg =3D LSPCON_MCA_AVI_IF_WRITE_OFFSET;
> -	while (val < len) {
> +	while (written < len) {
>  		/* DPCD write for AVI IF can fail on a slow FW day, so retry */
>  		for (retry =3D 0; retry < 5; retry++) {
>  			ret =3D drm_dp_dpcd_write(aux, reg, (void *)data, 1);
> @@ -456,7 +456,9 @@ static bool _lspcon_write_avi_infoframe_mca(struct
> drm_dp_aux *aux,
>  				return false;
>  			}
>  		}
> -		val++; reg++; data++;
> +		written++;
> +		reg++;
> +		data++;
>  	}
>=20
>  	val =3D 0;
> @@ -612,8 +614,8 @@ void lspcon_set_infoframes(struct intel_encoder
> *encoder,  static bool _lspcon_read_avi_infoframe_enabled_mca(struct
> drm_dp_aux *aux)  {
>  	int ret;
> -	u32 val =3D 0;
>  	u16 reg =3D LSPCON_MCA_AVI_IF_CTRL;
> +	u8 val;
>=20
>  	ret =3D drm_dp_dpcd_read(aux, reg, &val, 1);
>  	if (ret < 0) {
> @@ -627,8 +629,8 @@ static bool
> _lspcon_read_avi_infoframe_enabled_mca(struct drm_dp_aux *aux)  static
> bool _lspcon_read_avi_infoframe_enabled_parade(struct drm_dp_aux *aux)  {
>  	int ret;
> -	u32 val =3D 0;
>  	u16 reg =3D LSPCON_PARADE_AVI_IF_CTRL;
> +	u8 val;
>=20
>  	ret =3D drm_dp_dpcd_read(aux, reg, &val, 1);
>  	if (ret < 0) {
> --
> 2.47.3

