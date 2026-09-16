Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D24C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:30:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4128510E803;
	Wed, 16 Sep 2026 09:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ab/CwjyC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3A510E995;
 Wed, 16 Sep 2026 09:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789551041; x=1821087041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8kSXSQKl2LEAL7NG5v4+nbVQFgKVlvvITAiPbJaK/Xw=;
 b=ab/CwjyC0Hlx/L/BNXsyjztKSSrvj5o1K+C22F4JzoFhCaKeGOS31/bp
 ZVWOJWNR5rZ8GcTVNHNs3/J22rSuGWEN3Et6LXY5BOaq/p7QVq9K+d+zy
 04GEgziFwu3gt72+5X/eYREb8d3ddWW4qBhcGhxJT1xBB1WTyiVawv4tr
 s+AKcduVQj0DpR3zXmSGIH5SNZAZax3hq1TrppEEHd8hZ8y6m2oWn5lFr
 MbapD3sM1peWoO5ojq5bUUby5I2xsAkwuMf56EaoY1EuABUyYovNyg0L5
 pN2uEdDGSmsAkYYC5AH27gg1Ax+uG/Yee7hGbkgiuIzy/km9rSWAoyfGX A==;
X-CSE-ConnectionGUID: /ObBVqz+S+OmVkIEfoAo7A==
X-CSE-MsgGUID: HFT5AUCAQmeZv3A64C2P+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77485121"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77485121"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:30:41 -0700
X-CSE-ConnectionGUID: gxe63C99RBOTVXLkKzCv9w==
X-CSE-MsgGUID: RbQf1Wl1SM2y/XT+rgJ4og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311558352"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:30:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:30:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 02:30:40 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:30:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrEMz3qMkqysZYGCQCqbSOobWGcVvJRDvi9EWGK5Xa4hqJKWUArONM30fjZBNEvk+KEUj9QUtBXLf68OtCEzckSdXMq3t49keLVOubfVil4WWUukY+sl2CH/nzY7ZfjV1XV0e4JrVGcGQUPAgod+qJLihEe1gBLZrJ/yx0ta5ZPUt66x/3gMu0EMYpOxhdhBfkxTBWVJxyWydrNSBPzymF9AzXIvOa5xndx/8q3j5GsFsutnaGz51g6B8wZwT08wIvJdJqEvj4T2653sY7ln6ibMbLhBKE2eO/5ihj0VV1Riq2gbRkH0/E/6uSpYhIygakeFnMcTng4/DFEM6SSkrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EaCnZfdtZet2lhrQdxKnYPeBs/8mq0Kh2cA9oCCGm0=;
 b=ZldHKFilQiWtr3mEIhMl5bm+ARiElih9uYGScJmSh9P/5YvyVM5/5fLilni4xv3ZqpNmoKTwpmZ2x6m8YLmPeIAjFC6H1Jy/9dQZ99pDB4IDOKtQJ8rKcbUVDaEMxNPsO66mbmm92xFRSFToH7FNZ+j0GgO2V8cZF1q/R63rsBfBsnqzLZopFurtq581umMKTXs18r08ydiZWqZZ2e8HLEsFbS8FtFHJrXprJS22jJ3ZJMZH6QH5xJkYHuW+W0kde4sQhyImpv9l1Jz1by3CPaQtd18Umu4JtmJWaAqfEpMSGRTPJxa616hB4enXiVakFJMVw4RCS9EtZmq3rwK1mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by EAYPR11MB9948.namprd11.prod.outlook.com
 (2603:10b6:303:2d2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 09:30:32 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 09:30:32 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 11/11] drm/i915/psr: switch to drm_dp_dpcd_{read_byte,
 read_data, write_byte, write_data}()
Thread-Topic: [PATCH 11/11] drm/i915/psr: switch to drm_dp_dpcd_{read_byte,
 read_data, write_byte, write_data}()
Thread-Index: AQHdRbaLC2WXh/xrd0Cqtv//VXEjPbbQ8IKg
Date: Wed, 16 Sep 2026 09:30:32 +0000
Message-ID: <DS4PPFE901A304FC820C56D38376D7816B1E3B92@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <0a32cfdb64a37e586579a689bd8c3c4944596a31.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <0a32cfdb64a37e586579a689bd8c3c4944596a31.1789547331.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|EAYPR11MB9948:EE_
x-ms-office365-filtering-correlation-id: 06164dfd-0bdc-46fd-0450-08df13d52783
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|38070700021|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: GJTDhg0ucUfDjzudHVIH8Sft3VXqjP5yGBoTik4VUhkPcuzutLFkbr09CbZTWppglfg+f8bcQIq+Zgb4mlhxLLBd1Wq88O2/NXZwcTAARj71rcItOJQmGJHKBgJ3mTpFKgZi0XFJXtEvJeqiSU8YlE+trmJEcSKEKI9O3vI+mILPA0BHyJ+h3ide3ELK+KDNRAePsoMvNfoHCSyJLEZx/28CEXmeqJFlzsbnB4URvhRt/YHY5VZAjA0fPMczjzW8JEzokVa5bkQcE2zsOGkKDiSdxClBzKIbuXYE95UCog7Bq4g6/4GHWVxvKIpFPCMqONDIo+5fViTCdvyJtLxJQBcgadrYC7g2YGxexJ3UTZ7+ejub5IJCf5kG5NGj58J4i91JosBTAPl4rGybrN8xEkD3Qxgyv++YkfsGwvu++R6NVwMQts6Q7Ik96GeN8UNWxUpieMjEQJef0I1RaBnsONh7kUmCdICWB6sF1MYUup9hK1OubVV1iz8vTe13gTszWLVUUuuCJePPfT3LG4Dek4idLOtJc2vJSyx8UFfL567hCfX5FEAmlmyu67MnT8N+tMdHQlbaKIkwSPLWJwIuuHmITUibwb5k3XVJFkg5dy8py7cK96KzIrzr1W4mlPzvBbBbi6z7ynWBAew9jZ83F4k1dZUGzh22v+kd1qFkF1p+79K3djCdtdq31UzzOyvAG7oQyzbC37vGbD8RxOz/vA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5jR3qOXiC/66zX/AJ36H/narAtIVVrux6DjqCOqMrKS1n7FzQX6zS/PDRtEB?=
 =?us-ascii?Q?pxKiBNBbZn/iVLGiXjqXRD5yHesfJFxrb1oSXgWzJTWHUpvRItuUuuNM3AVs?=
 =?us-ascii?Q?X7ZwFkuiw4ZALrBzQWo1B/Dwmh+7O1dvGcMttC8kvu9sMePVjf3Ld93lEGkp?=
 =?us-ascii?Q?0mnjBA75uszKEOT66r2udloFO1cc9xyIC35ULkwNzssPnAOdtb9p2o/FSJcD?=
 =?us-ascii?Q?UceWH9OzceZvfF7nHR9h39Z5w1Svt6Upjim9vfH6RvLFSaEwyAcnxWBAeV4V?=
 =?us-ascii?Q?61RpJcsDC/BtyW+RtDyOitMBpGUPAmB9YcFccrOP9jKuFyHaMhM7zY2RLjhN?=
 =?us-ascii?Q?uzwK/a9d5rQG39DJHnwkQCnbGi1CMPPnhdIN+YlGPgGD8VyRjBpU3oTelyY5?=
 =?us-ascii?Q?5A/Ni1XV0wOca23f7UZWh0CdQ2eYxaBHZWjzusC8rgEW3V10/P3oz6/e4ZiV?=
 =?us-ascii?Q?q1S073x9F1LfttThAx9yP5L2byna3Oy+ErrbWRDhqRc+XjX4wnrPwuAH+R58?=
 =?us-ascii?Q?fE+BqlHNNtAzLLjWWuStlmG34TPuoxKLhbB1BsOfYRm/wsX4J4WKtxpXfVrf?=
 =?us-ascii?Q?aU10VAzbSOvavXwCjo24QtKa6usF6ZZkNlfyQB8IHdQdbBXVgrPUzCDvkRWS?=
 =?us-ascii?Q?n14GDm60mkN1g3eUtDDyrKPoWL7WPoWKXZUgyMkoSYO/8zJwdW1ZIop8CfiC?=
 =?us-ascii?Q?LOp+WFctWNPk8Y+3k0Wu906KyvD8fBRgCKXLtbPBPlM4wmCfb7Z4gFfZe+m8?=
 =?us-ascii?Q?Xh9vvkjw6mBLk6yd9td9qXOKFpzQJ33sXHAyGKE4XxyVgQnoixriYQ+PHnIL?=
 =?us-ascii?Q?ybm6vCay6RPeAZAPsnif5BlUbNlxuO4ROfl9NdM7RB9f9ClUcZxBkEfMPGcw?=
 =?us-ascii?Q?1G7m1SF7XxPDdsj1RRLzEewMteK4C86hatsgEQrhwLRohRl+9DRLRV0hKb5W?=
 =?us-ascii?Q?bqG4t9mL5Ob56XTOWuRCDaXPs/RqEx+S6p7y4EE3dJUXOLUXuYE7oMjLr8fF?=
 =?us-ascii?Q?nukljqev6V/PGMoQovdebJCqgaPwcV+9DaSZomtLEK720RFz+sw9E5xTHjZ+?=
 =?us-ascii?Q?yy0iWol+gl5dSLprVJB1L1s6CaiseyWkANDGquwoOeSSRGJZ4ip/e2+GfCn/?=
 =?us-ascii?Q?YTGZ6s3mdroSmAOptf7tOUgujCl7WRG5Ng50XcI0RIBaUx4J182hI9skM+LG?=
 =?us-ascii?Q?RFlPbidMIuabOSRsMfRd/oaScr/hqg6l0c/oC5ItydTZHo0eodgI2d74umTD?=
 =?us-ascii?Q?aBkljj7SwsXPmAOgevNVKyO1TygmziGXIY6/3+PQPQE0YWVWrRYOy7yU7N0t?=
 =?us-ascii?Q?9gqOA8V/3YNYIAqzyNpSnmFAs0UY1fhYpVCnTzVelTfgxG+/a5MlYvVwrRRb?=
 =?us-ascii?Q?4t0jvvfDsiM/C6IRIgOtDrOUzVQitnaEI/OoL6Uyo7qyQXsCVD2SAHuvQ/rE?=
 =?us-ascii?Q?XEE2/gsET3k46/j3ccp3XjOmdyKOqbIjKcw5s8fpSYZvOqCfbiPvu8KRpJs5?=
 =?us-ascii?Q?99lK1KSc01zNY56C69u4NjITBnTdR/8F/fToXEHSrh2sAP32VMzp526bDxCw?=
 =?us-ascii?Q?ZNFuc0vn9FibYKTnMZilAGe8RXH5oLIEI4IJMBEvxDKnJ11BpzHagG15dUe8?=
 =?us-ascii?Q?jy4wJNmy8zBW7kHpEl9oQ5x8LxPPx3TbyhtymGMqAB0vbms1bdAuQbi6NigJ?=
 =?us-ascii?Q?F0FptZ1QhCvBlSZvAJsWFHr+dk0QHkXjabhnHCVqMKTx6O9G+yIuN9sKWE8d?=
 =?us-ascii?Q?tHvAeEtXnA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kTTPGvkbz42E9e1nGQYURxlj1kBtnF9FdHaGb+Y5a56Lhxhhukwn5hYf6UhGV4tmwKnIWjWVoBaEBVu2xZ4WenzKRDWFE3brv6gMsghIKLzVTyEVMKYzwMJHUqL0kB81zVESyWaQxARSJest73WaF77Oyhpp8XI6c5ApSMTcLo54j5xW/lnCHPG8mfEccwXWV0ERWnTeBKovF3eCdvkoD2KLpayUrYdZWItdraVoS1SWERTS9t7sfzdeLwYG4k9Wbnf5OovfqfUXj4QftxRrFyRBCAgCQpyDUERbt0pcYAuZlk+smmL1oXe5Nyd7P1NuF8ibDv4nU+pduYRcYWE9uw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06164dfd-0bdc-46fd-0450-08df13d52783
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 09:30:32.1617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YFmD3m3HLCZj8gHrYSqqoBtgKmQaRzA+bZYv4ZlljQaswZ7sAKvQg26scdD7NXedoh2TLNJsVAYRS9kygRQXZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9948
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

> Subject: [PATCH 11/11] drm/i915/psr: switch to drm_dp_dpcd_{read_byte,
> read_data, write_byte, write_data}()
>=20
> Switch to the modern DPCD access functions that return negative error cod=
es
> on errors, -EIO for incomplete access, and 0 on success.
>=20
> This flags incomplete reads, and clarifies error handling all over the pl=
ace. Use
> 1-byte accessors where sensible. Rename local int r to ret for clarity an=
d
> consistency.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_psr.c | 65 ++++++++++++------------
>  1 file changed, 33 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c
> b/drivers/gpu/drm/i915/display/intel_psr.c
> index 872e253db178..f1d48b69a18f 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -471,9 +471,10 @@ static u8 intel_dp_get_sink_sync_latency(struct
> intel_dp *intel_dp)  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
>  	u8 val =3D 8; /* assume the worst if we can't read the value */
> +	int ret;
>=20
> -	if (drm_dp_dpcd_readb(&intel_dp->aux,
> -			      DP_SYNCHRONIZATION_LATENCY_IN_SINK, &val)
> =3D=3D 1)
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> DP_SYNCHRONIZATION_LATENCY_IN_SINK, &val);
> +	if (!ret)
>  		val &=3D DP_MAX_RESYNC_FRAME_COUNT_MASK;
>  	else
>  		drm_dbg_kms(display->drm,
> @@ -485,7 +486,7 @@ static void _psr_compute_su_granularity(struct
> intel_dp *intel_dp,
>  					struct intel_connector *connector)  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> -	ssize_t r;
> +	int ret;
>  	__le16 w;
>  	u8 y;
>=20
> @@ -500,19 +501,19 @@ static void _psr_compute_su_granularity(struct
> intel_dp *intel_dp,
>  		goto exit;
>  	}
>=20
> -	r =3D drm_dp_dpcd_read(&intel_dp->aux, DP_PSR2_SU_X_GRANULARITY,
> &w, sizeof(w));
> -	if (r !=3D sizeof(w))
> +	ret =3D drm_dp_dpcd_read_data(&intel_dp->aux,
> DP_PSR2_SU_X_GRANULARITY, &w, sizeof(w));
> +	if (ret < 0)
>  		drm_dbg_kms(display->drm,
>  			    "Unable to read selective update x granularity\n");
>  	/*
>  	 * Spec says that if the value read is 0 the default granularity should
>  	 * be used instead.
>  	 */
> -	if (r !=3D sizeof(w) || w =3D=3D 0)
> +	if (ret < 0 || w =3D=3D 0)
>  		w =3D cpu_to_le16(4);
>=20
> -	r =3D drm_dp_dpcd_read(&intel_dp->aux, DP_PSR2_SU_Y_GRANULARITY,
> &y, 1);
> -	if (r !=3D 1) {
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> DP_PSR2_SU_Y_GRANULARITY, &y);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
>  			    "Unable to read selective update y granularity\n");
>  		y =3D 4;
> @@ -796,11 +797,11 @@ static void _panel_replay_enable_sink(struct intel_=
dp
> *intel_dp,
>  		panel_replay_config[1] |=3D
>  			DP_PANEL_REPLAY_SU_REGION_SCANLINE_CAPTURE;
>=20
> -	drm_dp_dpcd_write(&intel_dp->aux, PANEL_REPLAY_CONFIG,
> -			  panel_replay_config, sizeof(panel_replay_config));
> +	drm_dp_dpcd_write_data(&intel_dp->aux, PANEL_REPLAY_CONFIG,
> +			       panel_replay_config, sizeof(panel_replay_config));
>=20
>  	panel_replay_config_3 =3D intel_dp_as_sdp_transmission_time();
> -	drm_dp_dpcd_writeb(&intel_dp->aux, PANEL_REPLAY_CONFIG3,
> panel_replay_config_3);
> +	drm_dp_dpcd_write_byte(&intel_dp->aux, PANEL_REPLAY_CONFIG3,
> +panel_replay_config_3);
>  }
>=20
>  static void _psr_enable_sink(struct intel_dp *intel_dp, @@ -827,10 +828,=
10
> @@ static void _psr_enable_sink(struct intel_dp *intel_dp,
>=20
>  	if (intel_dp->psr.entry_setup_frames > 0)
>  		val |=3D DP_PSR_FRAME_CAPTURE;
> -	drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_EN_CFG, val);
> +	drm_dp_dpcd_write_byte(&intel_dp->aux, DP_PSR_EN_CFG, val);
>=20
>  	val |=3D DP_PSR_ENABLE;
> -	drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_EN_CFG, val);
> +	drm_dp_dpcd_write_byte(&intel_dp->aux, DP_PSR_EN_CFG, val);
>  }
>=20
>  static void intel_psr_enable_sink(struct intel_dp *intel_dp, @@ -843,7 +=
844,7
> @@ static void intel_psr_enable_sink(struct intel_dp *intel_dp,
>  		_psr_enable_sink(intel_dp, crtc_state);
>=20
>  	if (intel_dp_is_edp(intel_dp))
> -		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
> DP_SET_POWER_D0);
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> +DP_SET_POWER_D0);
>  }
>=20
>  void intel_psr_panel_replay_enable_sink(struct intel_dp *intel_dp) @@ -8=
54,8
> +855,8 @@ void intel_psr_panel_replay_enable_sink(struct intel_dp *intel_=
dp)
>  	 * ensure this bit is cleared/set accordingly.
>  	 */
>  	if (CAN_PANEL_REPLAY(intel_dp) &&
> panel_replay_global_enabled(intel_dp))
> -		drm_dp_dpcd_writeb(&intel_dp->aux, PANEL_REPLAY_CONFIG,
> -				   DP_PANEL_REPLAY_ENABLE);
> +		drm_dp_dpcd_write_byte(&intel_dp->aux,
> PANEL_REPLAY_CONFIG,
> +				       DP_PANEL_REPLAY_ENABLE);
>  }
>=20
>  static u32 intel_psr1_get_tp_time(struct intel_dp *intel_dp) @@ -2373,11
> +2374,11 @@ static void intel_psr_disable_locked(struct intel_dp *intel_d=
p)
>=20
>  	/* Disable PSR on Sink */
>  	if (!intel_dp->psr.panel_replay_enabled) {
> -		drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_EN_CFG, 0);
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_PSR_EN_CFG,
> 0);
>=20
>  		if (intel_dp->psr.sel_update_enabled)
> -			drm_dp_dpcd_writeb(&intel_dp->aux,
> -					   DP_RECEIVER_ALPM_CONFIG, 0);
> +			drm_dp_dpcd_write_byte(&intel_dp->aux,
> +					       DP_RECEIVER_ALPM_CONFIG, 0);
>  	}
>=20
>  	/* Wa_16025596647 */
> @@ -3517,7 +3518,7 @@ static void intel_psr_handle_irq(struct intel_dp
> *intel_dp)
>  	intel_psr_disable_locked(intel_dp);
>  	psr->sink_not_reliable =3D true;
>  	/* let's make sure that sink is awaken */
> -	drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
> DP_SET_POWER_D0);
> +	drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
> DP_SET_POWER_D0);
>  }
>=20
>  static void intel_psr_work(struct work_struct *work) @@ -3796,15 +3797,1=
5
> @@ static int psr_get_status_and_error_status(struct intel_dp *intel_dp,
>  	offset =3D intel_dp->psr.panel_replay_enabled ?
>  		 DP_SINK_DEVICE_PR_AND_FRAME_LOCK_STATUS :
> DP_PSR_STATUS;
>=20
> -	ret =3D drm_dp_dpcd_readb(aux, offset, status);
> -	if (ret !=3D 1)
> +	ret =3D drm_dp_dpcd_read_byte(aux, offset, status);
> +	if (ret < 0)
>  		return ret;
>=20
>  	offset =3D intel_dp->psr.panel_replay_enabled ?
>  		 DP_PANEL_REPLAY_ERROR_STATUS : DP_PSR_ERROR_STATUS;
>=20
> -	ret =3D drm_dp_dpcd_readb(aux, offset, error_status);
> -	if (ret !=3D 1)
> +	ret =3D drm_dp_dpcd_read_byte(aux, offset, error_status);
> +	if (ret < 0)
>  		return ret;
>=20
>  	*status =3D *status & DP_PSR_SINK_STATE_MASK; @@ -3829,11
> +3830,11 @@ static void psr_capability_changed_check(struct intel_dp
> *intel_dp)  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
>  	struct intel_psr *psr =3D &intel_dp->psr;
> +	int ret;
>  	u8 val;
> -	int r;
>=20
> -	r =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_PSR_ESI, &val);
> -	if (r !=3D 1) {
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_PSR_ESI, &val);
> +	if (ret < 0) {
>  		drm_err(display->drm, "Error reading DP_PSR_ESI\n");
>  		return;
>  	}
> @@ -3845,7 +3846,7 @@ static void psr_capability_changed_check(struct
> intel_dp *intel_dp)
>  			    "Sink PSR capability changed, disabling PSR\n");
>=20
>  		/* Clearing it */
> -		drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_ESI, val);
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_PSR_ESI, val);
>  	}
>  }
>=20
> @@ -3913,10 +3914,10 @@ void intel_psr_short_pulse(struct intel_dp
> *intel_dp)
>  			"PSR_ERROR_STATUS unhandled errors %x\n",
>  			error_status & ~errors);
>  	/* clear status register */
> -	drm_dp_dpcd_writeb(&intel_dp->aux,
> -			   panel_replay_enabled ?
> -			   DP_PANEL_REPLAY_ERROR_STATUS :
> DP_PSR_ERROR_STATUS,
> -			   error_status);
> +	drm_dp_dpcd_write_byte(&intel_dp->aux,
> +			       panel_replay_enabled ?
> +			       DP_PANEL_REPLAY_ERROR_STATUS :
> DP_PSR_ERROR_STATUS,
> +			       error_status);
>=20
>  	if (!psr->panel_replay_enabled) {
>  		psr_alpm_check(intel_dp);
> --
> 2.47.3

