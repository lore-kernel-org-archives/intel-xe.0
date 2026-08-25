Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3639FC61DB6
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 07:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D9610E14E;
	Tue, 25 Aug 2026 07:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEFejUtz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B18110E907;
 Tue, 25 Aug 2026 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787644273; x=1819180273;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jSj5KGcn26PZOeUsmcMtkUgxn1HamcX6Y4ASl297F6E=;
 b=hEFejUtz9TqnaVm2YKjY9bBfHCn4yeh1Ps2RJxSe/+467DJJP9LW/WXV
 PrrOh8GNfokZjVDR3GBqyzomSNX98lxBR26iFGlR9a710WTU2czR7LAoH
 9Ole59n9FKOlKt828Q4B/tIcIPTfxGVfe2h8s2xV4DzBHESjJ8bXB5mO5
 LP4an6uIIxmw1OelCdeb7nPGk45gv8lDj+DsCDcgnBfQ/wia6+GRIGwza
 giL6NebEN1uRFMR9Ri5v26iOUF6qbdqahhVdGStsGtURb6bUGQS0StNSd
 67kcqyrIpM+YmTMh+QQOEV01oWdLtTt+B6vjAYquYg27yX7THhIv0j9ko Q==;
X-CSE-ConnectionGUID: QHoAk4fbR6WNh8C7/o15tA==
X-CSE-MsgGUID: rO5sczZ0SbmKOXRdpkqljg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99627194"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="99627194"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:51:12 -0700
X-CSE-ConnectionGUID: Y3H2JwQjQNmClQYUIBnsxA==
X-CSE-MsgGUID: lXPw2Mx7TFydCeKkXqUbVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="305449112"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:51:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:51:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 00:51:11 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:51:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUOV2HcG1nPPu5XgWNeVokwHTI8T+v1IZaCKkhQGOCJfJFRUQXkLTfg23kPebGAFXYOVfS2wir4oMO58825J2ArM5sF3aJp1fFYnuLGvgVUjnIjRjJEpfYV1mv+16aqIf5UgTJXg06CPYf2v7U+/yezWAOjuTcdXV7p7JF3Uev6dujFbg/QIbHHuNTS95cH8BOrgzUoM7oK68gdr4PjhRg2U1yj506EtmoqhvLtZ4JbCOEAEBoQN8umWgjjGAfA8jQIgqrVd9aE6YV/3qr/NcD/OxavUtT1FwJ/x0e38tJ7TUGiRPA/+7gyrVz6VbqIyjSJbsmVTeaBs5AaGCKG0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNkVGNWT2LHk7C2pv5soCVasBjadKOcN+nD1Dmmg14M=;
 b=QLnXI/GbMZ/Y8wTsVf1zd03SYyw5vPSMXNae81FIlJ95pjRlAZ8y3DdEm/1g38K/93Ch9MuWXddoj8+XXwq4BNUhGQttXmwhLNSq6I30GGWZR4EeiKBjpz6349tFP+4jKfD1/e69nZJUimZUJ38SujtLdawLjnOHSxIdQ6ISWD3LF/7y1XNC/ta9lYyptsSYSsPFDhFTnvxhf5eoPBHMe93XcVhH+gZfaG6Iw2H+T94YQRVeT3QGHbFgCPyZ+PUPUimtjCPB80j1kNnPd5JffpxsN18RwTft8d76Hxn1tkCAcPvnceNvThRKwJgydStCswrtsW9806bNsR5XyUuH8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DM4PR11MB7760.namprd11.prod.outlook.com
 (2603:10b6:8:100::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 07:51:09 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0339.010; Tue, 25 Aug 2026
 07:51:09 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3] drm/i915/dp: Gate UHBR SST SDP splitting on sink
 capability
Thread-Topic: [PATCH v3] drm/i915/dp: Gate UHBR SST SDP splitting on sink
 capability
Thread-Index: AQHdNGU8JzlKY0DDnUCI32DrE0d1BrauY5ag
Date: Tue, 25 Aug 2026 07:51:09 +0000
Message-ID: <DS4PPFE901A304F509E49BFC04F3EAF48DEE3AF2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260825073204.872441-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260825073204.872441-1-mitulkumar.ajitkumar.golani@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DM4PR11MB7760:EE_
x-ms-office365-filtering-correlation-id: 6498cb3a-b49e-4142-af10-08df027da058
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|6133799003|3023799007|18002099003|22082099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: PL2Whv3KSI2P2Xq+phSrJG4C9BNHx7famAZUpTHotb85kF1cwJpnZNmjN1ML41i8/JKEkgae33LPU875R0cglFLdc/aZDiTxVZhv6WP+KUOxPXlFp/grjNzrKE553azOK4jiFJZSJT7kaNGRQdxiGQDKsi4gQCOcOF6HpxYMEHYwpWmbqmLf6+LwOtRXSAUQlXrXMqEi3NvOLMwRp8g148cyN6+h0LlEWFF1I4+AYC3CrSqR1x81hE/SZAxIdbOsJL3i0Rq3rma8GubEcu/Q7Jyv8xCINRj/BxHomgNB+hJr36botu9NyTNqNi/LTooFVoTaa4Lsbx/EHxtAtqkPp0ASvF9+qZBq16ljyfuBfnHy7MH3CAjwF8daGu2gZbMkkFt9i+7PVK7O2HL4qcNDA2lZsgRW7iusa84/4Rdfy5RPEzOT2tDLhaeG+LRifOfkM0ybCC5b8jkxUKfolKqIGD+vwbVfZeBnLzKJ4bjR4sSBdMzCK7mYaLlKqUhhdqPiOnLrFJyunA2fdXAQm7AE5T/T5LJ5Ota8yF1YPY9c6dHaaQz8uARGDoD8TmCNoW82v8soPoMELwRtPQwLl6WWDnJz4aJeM1pZvplGeGVQ/MSeaNvhEF7sZVUml7a+uQxg16YzRWPj4cP7tmZ8nbHkMoJjwJKLImaa/30ST9iW9AG4+TIm+VmTVSl1TFGqk9iMf6b2M3fZDwuSR0b2bbvg9SZPkk9MN4/HAiixW3XnA+U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IMMUk5Cp3zGmbvEN2L22YsmDObMOzw8i+vIvQLJW9IL4pRuNuZ+15Cr9cN69?=
 =?us-ascii?Q?FMAawY9p72Sx+Y/Wy0c1JIOMRB7Stn+FSOqtuhwqX5EqNwDaH0gb9fYn5oYS?=
 =?us-ascii?Q?bzDE0UWgJ4agW01X3fsnd2F+rOu7D9Y2fsyu2PWMJEynvOOCMU732RZWHD3x?=
 =?us-ascii?Q?RBhfqzcejfN84RYVLy0aitArcHUNjagVndnCa1XSZkSqP6DCKGnurlblAUkF?=
 =?us-ascii?Q?O69rWN94BmHK9Dhl3Cv87dQqKsHyud55zMZA07bPHE9UgnkOZVBi7hLbCwue?=
 =?us-ascii?Q?wPKurlt7KKhiVmDBeZJV5yoctB30+GfAqaJGWutkZwe1CiYDYRL13Ky1jHl7?=
 =?us-ascii?Q?p2+r3RrIybcmlGwZ4gbvFo6O3Y1AueKcm/uWR/win/NGvEy7jrNLhtjHX2wy?=
 =?us-ascii?Q?UpI/2CVTRgIXKgj1TT7Ph5TXf+slUQl3stO8xr3w435hoHPzDpcpB6pOm1qN?=
 =?us-ascii?Q?LobpInjqIPFS59bGALrL6YbkNeEkKYdetwVAyhIDnmWeLbDFEyqKmQt2qNdJ?=
 =?us-ascii?Q?oqEfMuGAGM5q0a9soQ5oQ7XzNP1XYHVh7WXnd5WvxV0c+WQIIC9rfeCHoUX0?=
 =?us-ascii?Q?Z0ZqaQd/A9RIoxS4kQU21WD0GL3izv8vU9oVhQJkuKx6CLNBqVrauII/7vrJ?=
 =?us-ascii?Q?OzdqrOq4dRbSK57SN7YJAZClKz6CZmxyIeS1LfAZjiDxjFYwEvtfwkkaRnXN?=
 =?us-ascii?Q?r43XXTH+bsTyaUCPOmdv7rcrOjrF85+Zv0ugUgBz2Zck3gGEUZ6J+mtjeZuu?=
 =?us-ascii?Q?dLz/JFZYLCWsO/kOmBWYDptQJ4JuOD+9VfCqE7TWyGvXXRcoEHasgkkddbRl?=
 =?us-ascii?Q?401BQgJzZWOkklSAFrZ4xQTq+XlmzPvwuUIt1SmYQnJfchSOWLZsoxYAxAQo?=
 =?us-ascii?Q?PP2jIUu0OXYHpyRpcD5NpUb6wYkjVE3dUl9G38iGxFjt8IK6dsS5sTxXNPnA?=
 =?us-ascii?Q?gaxDevggbFpINNfB7EDKHvn322ase8yQRR4ySH9BbsrrZOX6z/ecKRnjfk1x?=
 =?us-ascii?Q?oPq9xUFVOIp0toGq+iGKhfdiiHHU9yAAgtD/gMdmmLjh9Xb9X/qdaONToOym?=
 =?us-ascii?Q?FEnXFiHcwzMoJrUw6ea4nk0sMkHvxdREhLusGMoeEB5k2/od5u6WOc+Do3p4?=
 =?us-ascii?Q?u+XV7APuLHe46gb/srRm3A6ScOfJm4f2U+W2JvSIws4+RL77Xgrn5mc3rbsb?=
 =?us-ascii?Q?cXtuDIwrNwr3mx+zA9tJwxecMGaoCCskl7YY9b9v5lEdzr0X/NVjLjJ5l+RX?=
 =?us-ascii?Q?OTMR4WIxg6IfbkFcKHkjVl3cszJsaifR6JKi8g74nKrDCBZj+1GRpRL4ndRH?=
 =?us-ascii?Q?BDNPP8EYBX5wmjBIvAv0/LU4Cyf0pLggrhW/vhK04QMQkLDeU3Q/7K7qOmLE?=
 =?us-ascii?Q?0T0UoZcDAfOKGXoE+tW8CJXVq53/YLU2AWMUYjZkn5/fUhtVyYLcp0Xui9jf?=
 =?us-ascii?Q?0tpgUzvajygrjkJyyKsDX5N1tecJ9ZUZ2xaa0lu7C5HHPQYO1nh8kuv3ByXT?=
 =?us-ascii?Q?lm9d9IFTVfDCrNZCjf7Sv/msn4g4C6sW0RR39idJINHa5rG8ZlrvNZf/ew+N?=
 =?us-ascii?Q?OCEm3ooL/drp7qf8PqCwkMkCtfoOGMgWknMVp1vQNCHmXVdRhrIIcLH3eZii?=
 =?us-ascii?Q?yi54XoU+usylGrJ3tEdoGF+Nqz3a0PF6bNPcuoxzvcvrX6rW7UHkqw+xqOJu?=
 =?us-ascii?Q?EtTFBBhNb4n1awWwSyhCBzaqjEAZACm3RP/mPbKHjMdXTatXBbIM1u7e2su2?=
 =?us-ascii?Q?4/9Fq3ER8Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aphFaFeqU9QYVm77KjghtilY5kkjIFFw8Le3C0e3kdyGtEeAjGxzL1xN37f97Z5LauqlebTW+1KSDFToCoK3p3imjX+KyLxm/CFYDrwC8yCFxJuR0XthkaPctE7AE4h69UBrLkcWdH69NMJSdnQikLXS6FupLRX2ovQFwS6UYvA87UjHl6Wqhznq3BKVtalUe+96sT/NxBaRLSfplR7qrfeeSAJ7B096SaVLIKxsKaZE5Q0XC8ZahDwVqm1W+j8w3fE+i4guXcbWufI6TSYtgVNzTGY0zfyNYV5OZxnh4VcpxJTVqabJ5HIv+dHUG5p6iQ0+AFAtVeEa0+Sb4DK6rg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6498cb3a-b49e-4142-af10-08df027da058
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 07:51:09.3987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xAzazEvVAL1LNq1PnjxzzYHi4kW3K53h+pmigp2L8dH2PXNc5rOjzEzRenaQwNhtbuQGYt6rCD+FlJDIlfsJ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7760
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

> Subject: [PATCH v3] drm/i915/dp: Gate UHBR SST SDP splitting on sink
> capability
>=20
> SDP splitting for 128b/132b (UHBR) SST audio must only be enabled when th=
e
> sink advertises support for it. Previously sdp_split_enable was set for e=
very
> UHBR SST stream carrying audio, regardless of sink capability.
>=20
> In MST mode SDP splitting is inherently supported, so the sink capability=
 check
> (DP_SST_SPLIT_SDP_CAP) is applied only to the SST path.
>=20

[2]

> Fixes: 8853750dbad8 ("drm/i915: Enable SDP split for DP2.0")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>=20
> --v2:
> - Correct the name in the intel_dp struct. (Suraj)
> - Add the Fixes tag. (Suraj)
> - Explain the reasoning for guarding SST separately from MST. (Suraj)
> - Add a separate helper to read capabilities. (Suraj)
>=20
> --v3:
> - Use drm_dp_dpcd_read instead of drm_dp_dpcd_readb. (Suraj)
> - Move Assisted-by above Signed-off-by. (Suraj)
> - Add the versioning diff. (Suraj)

This either needs to be moved below the at [1] which you will have to do af=
ter you make a patch
Then resend it or it needs to move above at [2]
No need to resend can be fixed while merging.

Regards,
Suraj Kandpal

> ---
>  .../drm/i915/display/intel_display_types.h    |  2 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 44 ++++++++++++++++---
>  2 files changed, 40 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 20a07ea06b5e..5f0fe18c0614 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1951,6 +1951,8 @@ struct intel_dp {
>=20
>  	bool colorimetry_support;
>=20
> +	bool sst_split_sdp_support;
> +
>  	struct {
>  		enum transcoder transcoder;
>  		struct mutex lock;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 6b60e0a1c8ee..0cd5e6b5034c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3409,12 +3409,22 @@ intel_dp_audio_compute_config(struct
> intel_encoder *encoder,
>  			      struct intel_crtc_state *pipe_config,
>  			      struct drm_connector_state *conn_state)  {
> +	struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
> +
>  	pipe_config->has_audio =3D
>  		intel_dp_has_audio(encoder, conn_state) &&
>  		intel_audio_compute_config(encoder, pipe_config,
> conn_state);
>=20
>  	pipe_config->sdp_split_enable =3D pipe_config->has_audio &&
>  					intel_dp_is_uhbr(pipe_config);
> +
> +	/*
> +	 * SDP splitting for UHBR audio requires explicit sink capability in
> +	 * SST mode, whereas in MST mode it is inherently supported.
> +	 */
> +	if (pipe_config->sdp_split_enable &&
> +	    !intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST))
> +		pipe_config->sdp_split_enable =3D intel_dp-
> >sst_split_sdp_support;
>  }
>=20
>  void
> @@ -4456,16 +4466,25 @@ void
> intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
>  			    str_enable_disable(tmp));
>  }
>=20
> -static bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp)
> +static u8 intel_dp_read_dprx_feature_enum(struct intel_dp *intel_dp)
>  {
>  	u8 dprx =3D 0;
>=20
> -	if (drm_dp_dpcd_readb(&intel_dp->aux,
> DP_DPRX_FEATURE_ENUMERATION_LIST,
> -			      &dprx) !=3D 1)
> -		return false;
> +	drm_dp_dpcd_read_data(&intel_dp->aux,
> DP_DPRX_FEATURE_ENUMERATION_LIST,
> +			      &dprx, sizeof(dprx));
> +	return dprx;
> +}
> +
> +static bool intel_dp_get_colorimetry_status(u8 dprx) {
>  	return dprx & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED;
>  }
>=20
> +static bool intel_dp_get_sst_split_sdp_status(u8 dprx) {
> +	return dprx & DP_SST_SPLIT_SDP_CAP;
> +}
> +
>  static int intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
>  				  u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
>  {
> @@ -4765,6 +4784,7 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, stru=
ct
> intel_connector *connector  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
>  	int ret;
> +	u8 dprx;
>=20
>  	/* this function is meant to be called only once */
>  	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] !=3D 0);
> @@ -4776,8 +4796,13 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp,
> struct intel_connector *connector
>  			 drm_dp_is_branch(intel_dp->dpcd));
>  	intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);
>=20
> +	dprx =3D intel_dp_read_dprx_feature_enum(intel_dp);
> +
>  	intel_dp->colorimetry_support =3D
> -		intel_dp_get_colorimetry_status(intel_dp);
> +		intel_dp_get_colorimetry_status(dprx);
> +
> +	intel_dp->sst_split_sdp_support =3D
> +		intel_dp_get_sst_split_sdp_status(dprx);
>=20
>  	/*
>  	 * Read the eDP display control registers.
> @@ -4868,13 +4893,20 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
>  	 * the OUI/ID since we know it won't change.
>  	 */
>  	if (!intel_dp_is_edp(intel_dp)) {
> +		u8 dprx;
> +
>  		drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
>  				 drm_dp_is_branch(intel_dp->dpcd));
>=20
>  		intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);
>=20
> +		dprx =3D intel_dp_read_dprx_feature_enum(intel_dp);
> +
>  		intel_dp->colorimetry_support =3D
> -			intel_dp_get_colorimetry_status(intel_dp);
> +			intel_dp_get_colorimetry_status(dprx);
> +
> +		intel_dp->sst_split_sdp_support =3D
> +			intel_dp_get_sst_split_sdp_status(dprx);
>=20
>  		intel_dp_update_sink_caps(intel_dp);
>  	}
> --
> 2.48.1

