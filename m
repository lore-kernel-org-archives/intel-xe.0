Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CD3C982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 08:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8332B10EC01;
	Tue, 22 Sep 2026 08:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReWpxOqV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3591010EB4B;
 Tue, 22 Sep 2026 08:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790067314; x=1821603314;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3DmdYAdTI1I96SxwyQmmZBP0BPF//8vd03gO/JbnN2I=;
 b=ReWpxOqV0nsD9g0tAhNkBAD8YgRQZZtYFwH1ZU78K+x2XIpsVKt47xKv
 d2J6TPOw8acLmIv5FS4GK/jUeu/4FfYB2z3B8lSyZY8cUWJitj0Ii2OQS
 7laL7jCeygcNtKkd/Ol5bz0UK/KP6fRMcc2qr/4BM13uM/7sJFtjKxPhu
 A7C8qwpaKL5ccVqkVfCYvF+9D19Xz+RGtos+hiBmBDEYYZ2x7u81m7zk7
 IC9QvMGMt2+YIFpbH27CXEdJJzOvDfe5pI3idojQrqLx8AspUgSdBEaiS
 E5a/ldjANAvOYdoHiHfRJojs1OuuBhNggP7LlUb5l2CsBOPNBmQLpvueN Q==;
X-CSE-ConnectionGUID: wcvvpzCiTfW4N/+vgWYd7A==
X-CSE-MsgGUID: tRFbVyTzSyKIqyV1Sjvc1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89785738"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="89785738"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:55:08 -0700
X-CSE-ConnectionGUID: 2mfIw0omQPKlyCC7WAFoQg==
X-CSE-MsgGUID: 6c3q7iRJScaalYZM+7oFNw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:55:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:55:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 01:55:07 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:55:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdN1VnnDS+/fkkgQTU9Ghb26wBjMXxfqBj/muq8PnG/waOxrvBk/Rhc5q//ScLT0+n7f68odxtyYZLiagotTi2130mQgHIfeEi3FgWAGoPU3D4dpgULIexIVyYKM6aG9IDSwcEwtoICBJGiqT9IqbBwHlQEOoLYqUGf0M7YBiMJ9FicDObkzj8OmYo9F2R0vqALzvLYZzniNTnSeF5BlmwvzhbT1fe7M4MF/4tTykVNrVt6ZYm6Pae0BwB7hfSq/nXtinPz5e5+1jeYaSxmKVTjhIraisQzIhV3FE7mM0EKH7K2VPbQc4UAJtX3K1ZF2H7lbrxthxuPQkCOdNExHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+UaYROpcT2p+hLIrrK7++SX0XsXpWBhP5bbo120bUU=;
 b=Qy7ZNZIfjKrLMyeP/e3cGo71K12Zh4QeY1GM6gIeGaVyJYDsMsq4OsR06NaD0ixKKng0bkl6r9WnKuIU9ZMuPNJ97nF0v6kkgZ9fAYSLIHYKMGUVs8q/5SFOSCmZJr0kVyM2P2uSUZzLiK7yr1TYp32/6Su9KTOjbHLC76aVZuETJhOa0QVLal0SXAokEf+Giml1YevcjhZ4ls/pBPhuu2AgKI27vt80knAJZ666S5iKBS+rop6KeCspsW3pSbUvqJ2SRruhnI+IFoiPS+CIvjJ+hhg+HcI3jcVZ4l7qUvqufpLaO/PbGCabTmUUZ80PlLR1Kts25gTM8fIiM1Egvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by PH7PR11MB7549.namprd11.prod.outlook.com (2603:10b6:510:27b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Tue, 22 Sep
 2026 08:55:05 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 08:55:05 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH 7/8] drm/i915/dptest: log DPCD access errors
Thread-Topic: [PATCH 7/8] drm/i915/dptest: log DPCD access errors
Thread-Index: AQHdSYyWI17iZbpmc02frzs0e5rPu7baTPdg
Date: Tue, 22 Sep 2026 08:55:05 +0000
Message-ID: <MW4PR11MB6887941DFA7ADD518473FDDFE3832@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
 <20260921053710.1586776-8-suraj.kandpal@intel.com>
In-Reply-To: <20260921053710.1586776-8-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|PH7PR11MB7549:EE_
x-ms-office365-filtering-correlation-id: c73c22e0-392e-4867-677b-08df18873221
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|56012099006|6133799003|18002099003|22082099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: j+FfxnXuqT+6zNmEJqfaLuueAy6lBQe5URb8DRJQvhUwrr7Z/GnR4llhnwYCoEF3qdZXpXsm22NgpWbf1jgSMUujqlrI1K13217tX+OYe6vGwFxcH7h6KTdSuseDUgkVzFhsQyKOSI29Qxi11tePrr3jr9j3t7A2YvhG7NDUI6dtBP4ntkxKrUHDQTVylRD/+qfA2lx9TEYvAH4jGczBYnv0pvKAT8wp6GSMr25Y9auIAMEMaBIlATA+QdgBoPn+iiATrhI/zrY9BobeEqvYa/KXycDTLGBnpTaf3aGYg+bjC8Hj1t7he06wwVju/s3VuObn2r4dQoh1X5s1tUL52/Usp2EBuAS7oavIB+Sp+V7NsQZpLj35ysKc3iOcMLlCCXl3AKmvJrozrxd8yNV0rHFXBp6l4gmkhFflc5wHFMUZWKtUZifVhok7skikePw5BqO2onv+OMTQCRgjiCmS0WpeqDtaQuCtcSmxoMc26Rh5oR8TMBerNaMgZOE4leu9gc6fUKpCJa4E5czSJoCWhCIP/0Cx0MUX6mTtk0Zx/RKVPWC1gNQjB4j/10ZS1MNv6RB5OhRFnipkNago8hUlFjzwBKIZxJ5gkNeUxrKoVxaHa8mB1HxX3bkgYc3OvtF0Vq5NH83cKio5HKb285b/L/1T4TjCqdsveLl12THXbaIvZtzGA0itSg7pMDrhk1eMwa40ZBir+J4UyTtcD2lgzDn4TApHN7UjJJadpLV/SZY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ux7cPFuMyAQkZ2ct2v0hR3yhpZBcCgkAMI+3brrElvkec7hMEjvRpc2adgSL?=
 =?us-ascii?Q?GY933CWtke4qwNVQlCVMH0vOyo27Uq0EuajLRXJIVJ+44iEk3SwNLkv3c9XQ?=
 =?us-ascii?Q?A6Hse/nGxTSyuHGynqRpdSjmO+n/LXSiUX5ql+2vzlRwoGv1X4H/e/fzzTPr?=
 =?us-ascii?Q?uu4yTxT6NoCZuuPgqut1ebTYr5eCAg9RvDMR4sJiDCKenMoTuF4PY/IkZ3Mi?=
 =?us-ascii?Q?lec1PAwLmXueLPg8MacIzVavVrmsjYoWVAKUGY/eeiksCF506zBIfCpdGREu?=
 =?us-ascii?Q?2wE9V9Xnnnbviwa9kK0QQzIjUUwQuaneKoD1LCKrmM54jkg0SLbcNoRYxheB?=
 =?us-ascii?Q?VNEsRMJ4Xjln36D9iF5UqCS6MdP+6GpSeUfzBGf94le9TMN77MrgtYX4/vXJ?=
 =?us-ascii?Q?8e72ofcgUEWMOWMeCV+/lrhvStftD1Kfrz71pSfpnukP6D4+T9TiS6h8r887?=
 =?us-ascii?Q?dwlirGgW7qcgVOZuugKVWAYohTynA9RXYVtV0sJDula9lF2o/4GkWJHce2kq?=
 =?us-ascii?Q?CE9JdlFfDuWV20qqMRXWcqpAgTcDEyDarDsi8boisT2QuyaMBiq+To3oT2Qe?=
 =?us-ascii?Q?MU1RQaAkv8+bbKnsZMaqx5zStYBPAvNrWL1PrxFWi4Za4vcMEPQyr8xYPNgH?=
 =?us-ascii?Q?iAhJ0A65jM3WzBwUHFDPFmmSvTqmkBO1LSSvcOfQRHZGVnS1qhtwyYXSr3jG?=
 =?us-ascii?Q?NX8VQFWn4aq7TqH/LG1n0giYdXgA+T5MrRZDLnanbJrHY9NRLpSGMHn3CXwU?=
 =?us-ascii?Q?C7fBVHPqpDfq9Dl+HiOLLL3DYgfGk2Prxfj2m4fnA+ms70ILc2Dh5jzvMcxB?=
 =?us-ascii?Q?aVoeVPmv78h79CeZzkuMMmDJ4+s2guKmlT02+9XtHK7rkxeAZix0De0g+9rt?=
 =?us-ascii?Q?LaxlASNeQA4rNJkXbwWS9AyJlCAzR/KVq0d0OWBSoxqJlcz064gBlbs4C7hs?=
 =?us-ascii?Q?8zaLY6iWe0/w5gIHsCgWUkRlNoh152CbhvNirGXIXetTUIdFA/LboFXZNizG?=
 =?us-ascii?Q?/XoVQp/AwpEJSUNFsy9nQwUzSgEU1FvIhrBXmJwBlGNoz2WP5G2JK/Y/kHaD?=
 =?us-ascii?Q?ayrfK1LVoorMzYPAfHWYhHvI3yuzQIKQpXSQkFPdMXkW9DgGwGsbU2nQPU0B?=
 =?us-ascii?Q?/+RYuQedDVD3MB0Yir4WWDQ2EsDDADOKSOvIEfBAE8XOACTZyr8xQMlTou2k?=
 =?us-ascii?Q?FmWxnp+gZEYfYEPHW5tOzlF28XX8WbAulXIYqU3eg+ID9lKsFlpAfnAnKHwO?=
 =?us-ascii?Q?h6zkKMIzs4GzoqYFRWUaNETjEyyzy+s7vBxsGpOOs8efzPOJ4BeM383wUx90?=
 =?us-ascii?Q?LvXGVOqk3H0Bh8vyudGeWhn+dsC3P38ydOmBtTng+jY0+hSU6ajWy/SBwWY1?=
 =?us-ascii?Q?mcWlbVDub/U1CQYWK3fmfC41Wi9VmyAXYHYny18bSPVjvcz07KBl+F44Dm8O?=
 =?us-ascii?Q?tJl8NNmek3m7OiNFcq7LYiqwYvrRaGCCAE0eWq6hbKzbvC0xtjtRswMeHD65?=
 =?us-ascii?Q?/13h2NIqLQpsFVI12CDk4gAEjpkIh7Bqo8bIknC8fSZJfDVHg+VlKYxGzVCh?=
 =?us-ascii?Q?OldfVWmmzdo54etVZkLJqdQwetixSU9Au3zk2DHiT0ds32lyI3epr6ykfiN+?=
 =?us-ascii?Q?WO4sGCuoIQbElUJO00vylym40GAwNTvH+Q2/6AQ4T+NTwE1rJdhQqkHjz6HP?=
 =?us-ascii?Q?sxAZd0ZTczy1uJiO0tZzHP2cqdq8WLTNdWOREfmAZoMQrb3n?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0eq20IKUYQMCkB4orWP1iFN+fFNdNzapTyKAQwLeevvA3A/SGU5f8kHM+GESk+OKfRqfUGuFG5l/xGtcNKtBppEQd0N/I3DQKcSKuHQqCIo/0IxdFpeDU+hUTXY+ilJKc/omuEtyHHYNCV1wA3IpB0GhwQEoWllQ4+x5KhYdByevC3wro7U7679LW9uccOydc+9YRfaQEaLh8+3SPle0NfCGsSDXopLuqJ+lNJfQUWwJAmShyZC571hjRFQfBxz27cHDKSW6NmvzAHOPj91FSBCZDyOfu+7nn1xHWQ5kO516PBEDwsJVDXGvSKCgzZb3LnJFyncC0QOhI/+5By89rQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73c22e0-392e-4867-677b-08df18873221
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 08:55:05.0436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6KSmf1E1lGjsyQZtLpYo23grib9Zba2Mdn/XZ99vvjsSeqpAq3ZSIEVV+f0KRc7EP3r2gnX+wGDujHdMdTkqmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7549
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Su=
raj
> Kandpal
> Sent: Monday, September 21, 2026 11:07 AM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH 7/8] drm/i915/dptest: log DPCD access errors
>=20
> Now that the DPCD accessors return a proper error code, include it in the
> error messages using %pe and ERR_PTR(), instead of just stating that the
> access failed.
>=20
> Store the EDID checksum write result in ret as well, so that it can be lo=
gged
> the same way.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_test.c | 24 +++++++++++---------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_test.c
> b/drivers/gpu/drm/i915/display/intel_dp_test.c
> index 424183a65155..17cf27273124 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_test.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_test.c
> @@ -157,7 +157,7 @@ static u8 intel_dp_autotest_link_training(struct
> intel_dp *intel_dp)
>  	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> DP_TEST_LANE_COUNT,
>  				    &test_lane_count);
>  	if (ret < 0) {
> -		drm_dbg_kms(display->drm, "Lane count read failed\n");
> +		drm_dbg_kms(display->drm, "Lane count read failed
> (%pe)\n",
> +ERR_PTR(ret));
>  		return DP_TEST_NAK;
>  	}
>  	test_lane_count &=3D DP_MAX_LANE_COUNT_MASK; @@ -165,7
> +165,7 @@ static u8 intel_dp_autotest_link_training(struct intel_dp
> *intel_dp)
>  	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_LINK_RATE,
>  				    &test_link_bw);
>  	if (ret < 0) {
> -		drm_dbg_kms(display->drm, "Link Rate read failed\n");
> +		drm_dbg_kms(display->drm, "Link Rate read failed (%pe)\n",
> +ERR_PTR(ret));
>  		return DP_TEST_NAK;
>  	}
>  	test_link_rate =3D drm_dp_bw_code_to_link_rate(test_link_bw);
> @@ -193,7 +193,7 @@ static u8 intel_dp_autotest_video_pattern(struct
> intel_dp *intel_dp)
>  	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_PATTERN,
>  				    &test_pattern);
>  	if (ret < 0) {
> -		drm_dbg_kms(display->drm, "Test pattern read failed\n");
> +		drm_dbg_kms(display->drm, "Test pattern read failed
> (%pe)\n",
> +ERR_PTR(ret));
>  		return DP_TEST_NAK;
>  	}
>  	if (test_pattern !=3D DP_COLOR_RAMP)
> @@ -201,20 +201,20 @@ static u8 intel_dp_autotest_video_pattern(struct
> intel_dp *intel_dp)
>=20
>  	ret =3D drm_dp_dpcd_read_data(&intel_dp->aux,
> DP_TEST_H_WIDTH_HI, &h_width, 2);
>  	if (ret < 0) {
> -		drm_dbg_kms(display->drm, "H Width read failed\n");
> +		drm_dbg_kms(display->drm, "H Width read failed (%pe)\n",
> +ERR_PTR(ret));
>  		return DP_TEST_NAK;
>  	}
>=20
>  	ret =3D drm_dp_dpcd_read_data(&intel_dp->aux,
> DP_TEST_V_HEIGHT_HI,
>  				    &v_height, 2);
>  	if (ret < 0) {
> -		drm_dbg_kms(display->drm, "V Height read failed\n");
> +		drm_dbg_kms(display->drm, "V Height read failed (%pe)\n",
> +ERR_PTR(ret));
>  		return DP_TEST_NAK;
>  	}
>=20
>  	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_MISC0,
> &test_misc);
>  	if (ret < 0) {
> -		drm_dbg_kms(display->drm, "TEST MISC read failed\n");
> +		drm_dbg_kms(display->drm, "TEST MISC read failed
> (%pe)\n",
> +ERR_PTR(ret));
>  		return DP_TEST_NAK;
>  	}
>  	if ((test_misc & DP_TEST_COLOR_FORMAT_MASK) !=3D
> DP_COLOR_FORMAT_RGB) @@ -247,6 +247,7 @@ static u8
> intel_dp_autotest_edid(struct intel_dp *intel_dp)
>  	u8 test_result =3D DP_TEST_ACK;
>  	struct intel_connector *intel_connector =3D intel_dp-
> >attached_connector;
>  	struct drm_connector *connector =3D &intel_connector->base;
> +	int ret;
>=20
>  	if (!intel_connector->detect_edid || connector->edid_corrupt ||
>  	    intel_dp->aux.i2c_defer_count > 6) { @@ -271,10 +272,11 @@
> static u8 intel_dp_autotest_edid(struct intel_dp *intel_dp)
>  		/* We have to write the checksum of the last block read */
>  		block +=3D block->extensions;
>=20
> -		if (drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_TEST_EDID_CHECKSUM,
> -					   block->checksum) < 0)
> +		ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_TEST_EDID_CHECKSUM,
> +					     block->checksum);
> +		if (ret < 0)
>  			drm_dbg_kms(display->drm,
> -				    "Failed to write EDID checksum\n");
> +				    "Failed to write EDID checksum (%pe)\n",
> ERR_PTR(ret));
>=20
>  		test_result =3D DP_TEST_ACK |
> DP_TEST_EDID_CHECKSUM_WRITE;
>  		intel_dp->compliance.test_data.edid =3D
> INTEL_DP_RESOLUTION_PREFERRED; @@ -429,7 +431,7 @@ void
> intel_dp_test_request(struct intel_dp *intel_dp)
>  	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_TEST_REQUEST,
> &request);
>  	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
> -			    "Could not read test request from sink\n");
> +			    "Could not read test request from sink (%pe)\n",
> ERR_PTR(ret));
>  		goto update_status;
>  	}
>=20
> @@ -463,7 +465,7 @@ void intel_dp_test_request(struct intel_dp *intel_dp)
>  	ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux, DP_TEST_RESPONSE,
> response);
>  	if (ret < 0)
>  		drm_dbg_kms(display->drm,
> -			    "Could not write test response to sink\n");
> +			    "Could not write test response to sink (%pe)\n",
> ERR_PTR(ret));
>  }
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
>  /* phy test */
> --
> 2.34.1

