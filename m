Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64948C79FAA
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 08:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29F010E25D;
	Tue,  8 Sep 2026 08:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dT5+mTAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A6810E25D;
 Tue,  8 Sep 2026 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788855045; x=1820391045;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GTdGNCJ9qZ1Ncb4a31syzSNXd00nGI9jRavxdiOdyYQ=;
 b=dT5+mTAZC3eBMOXV+tCHgd/mYDE0+r3EYjsCkBdrFWR3qXmCCVRQeYYN
 ca6Do0HkZJ3nLAId9/zURph31QIEJcltOypj293fjHANFOX8GwYeOsEda
 iZDY4oow78dmV0jzdHvwYFzSxeq/JFbDfJ9pg/NAOzBV9e2PO9LmQd9lm
 HOZYrsL9mYgqExsZCgOmZE3dEwXb7gj9TrNeKAYvtxWAyUw3qrRzZ0ORq
 opQeIpLvyxYM5LG3S/GnhdAI7wFptJtJrNQbHSi4POXCZOlRSockXIFM+
 RJontGWK6Nv5UUZs14h8GE0PEyYlxYUCcVGLI0VR/Phz2StL4FvAbpgM8 w==;
X-CSE-ConnectionGUID: MbBidwMGRn2PaAvnLUOHiQ==
X-CSE-MsgGUID: VeX4pTVeQ3en8zUhF+yEzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88399329"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="88399329"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 01:10:45 -0700
X-CSE-ConnectionGUID: dYuY4SDuSHebxgNiDNSQ7A==
X-CSE-MsgGUID: Xt6ahg6YSrCK6ymMKyHIlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="268352707"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 01:10:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 01:10:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 01:10:45 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 01:10:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOXzZZQ/5bIR93RZzO2Vc96NlSEebYcrAN0pFIOe6MWM4MBVQLH8H57O3RLRIQDjWqGO9TePw6WSMcKrfpk0aLEhMAvAXg3Bi6ygQTguVjBa9jFsPHYqaYQRqh2ZPOlu77MLheEVWMROTqgSV5Pdx7S2ZXkQ2TBB8h3t/PpbP7D86Hfd2O3OFt/3uNM/pe6uTCzTobd+NcwRJ+uhCNYVxGWEEID5GJyqPDzdWpUUcXSPSWmFSaD8RuqtlWjeETB6VspH0xO+7Ox93CkapSJFC8MKeq+lV9CmMO7iEms9pLRmNDU+BonlHUn9xYSAmNKQTN9HHqb+Ojvq043uloq23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PO2eUVW59nKsMdFx4xLk5dXPsvM7+EADujpcirvkvjU=;
 b=N32Lk3AFMS7egE97gTIv3KeYVfi1znpcWnwDyJ7KUSaB3HO05mp4I/xf7bPFvqgtx5BtkNHhys++LUyi279cQMtmEYT4BGNml+klr2GpjTbQoeF7P5iuyKm84sRLv0l17AJ5ChMM4aKm71cULu89WlRzhMzTmVuCU7l3/Ce1Z74fm0nPEGA+bvxrvH5mCThdAVyj6b6tqsxYAscS9jBYzEy5m7+WDx3uhR9Rk8MO719tsVIt5CoiugrT/jc5D10GmiD/uzic/KhDHpuwcASxLN9IpDMXxuu/TpGFm0znTNNPsnsHcJXMOplCJBXfFIfSBSC1d2Onmpehd1y1z3I06g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS3PR11MB9820.namprd11.prod.outlook.com
 (2603:10b6:8:366::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 08:10:36 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 08:10:36 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v5 11/12] drm/i915/dip: Enable Common SDP Transmission line
Thread-Topic: [PATCH v5 11/12] drm/i915/dip: Enable Common SDP Transmission
 line
Thread-Index: AQHdP1zOg+LCy/9q9kGWYvYZ7TNfyrbEUoqQ
Date: Tue, 8 Sep 2026 08:10:36 +0000
Message-ID: <DS4PPFE901A304F33780D3462F329ABB79EE3B12@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
 <20260908062224.2897987-12-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260908062224.2897987-12-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS3PR11MB9820:EE_
x-ms-office365-filtering-correlation-id: 72a802f3-db06-44f4-54d4-08df0d80a9d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|38070700021|11063799006|56012099006|3023799007|10067099003|4143699003;
x-microsoft-antispam-message-info: eNRnLmQ8pw7lQS1tCR+kyVmuqVGLF2FOEk9KghBJEBOb4pqG/UHcuatWPy2eKQgTcW5/pf38ZTchta1CAmlqVauO7nnhnUtT4RVBFk6oA0hbpudI6kEbZHWdC+Bi9DXcU5aFAiEVvk0GPLRc0X/Lo42NEXMFQ0XQ0DDTFzmNIRUcD+j9kH5BmrKGypoII/2T4V0Ge8kO2bdfGL7s3flrPsFYDwoC6IE5thulVtb68IkZkDKqrammmrMj2IBh24a0uwST7tryn14cYKLVRiLPe5MlXkbLeyeQT57wHx2lxEZ5TFTUpQK28MkPhLL7A7Xz7UoDRbPlKb75F5k4US0BYRzybtqyoBoWEgb1LM+iiR7DNhZlGQqPKgZBK90Y/5wJfxpFW35/t/XNKtTi2/IVSV6+3bC0ZH/VbVhOsrQcY3+KJ1p+YgJwJ8vXbFRPHv7kXHr7UMZu6hr/cHQdIoWYsqD6dCEGoSSfhcRTa3oO4TDpFA2OMZ4Q3Yk0vHxvT+QOiDKW0DeacZ7siYyA/6NoTFJfi0Db83BsbFhSlTzvaeAhmR5MO+LXGPy/8wxFii/YgpnEWVp8Hv95qKi+xiDe5vhB1lEAaPYuN/iEssi41Ublw4Szt9xJLrhhe0PnO4Qu4u3yOTlBlljR8d0JKFzNAasW57G9MfZIYGRXI3gLx9zHsSaKcjJR9oII1MR5CGqxG/kRwrPn6/jvm/5k6TLB9eYVTS0ZCfwB66OsjHRzZIE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(38070700021)(11063799006)(56012099006)(3023799007)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ubZl3CA53sXpATK+0+VD1sLCLxNLeOdtRSEDgm7LAkvYFcT5EBPAwb4VziZJ?=
 =?us-ascii?Q?PDiSSTm1rEqmJXLlYbQZQKJDJlhJkUYYpc/ayq/ik2EWaAIgNyAwTVAqQHJj?=
 =?us-ascii?Q?XCgRpJXLWzjuTaRRI9g6ltHV1D5ALy5zNcgtTBzJSPqrUEyYccYPHDP6qGY7?=
 =?us-ascii?Q?ZiBBl0R7Aq83XzYlQ9y2/PLxHlaF/T4dX3XNM6eabnCDAFoPKjXaQPpwfp1b?=
 =?us-ascii?Q?4tLcFtSt9aMW0osrvL+NtmuMbH5SpijsMSws2onn/E/K0Ntnd2j77rST0y3A?=
 =?us-ascii?Q?ml3IpYWwTTQBDWLa8yvaXoLUSYYY3/gGi5+CMyAu8QzEtfBZiSgS+lmxegJF?=
 =?us-ascii?Q?ij1a5YwxUdY256WPe0tA9crr0tSPr3rYqH8ocyLRUSzkpge/MkX02S5uzKbu?=
 =?us-ascii?Q?7l3gxiBjqAt+J4JTXztXIRwR5Aa5ejOf8aDPA61AZpEruOITjn/wogYAR/kU?=
 =?us-ascii?Q?Zqr0rHx5Qufx2dEYI5Jw8HwzN4nEriVWav7U3HFsbbkP3uWhWDubr/ihV/nj?=
 =?us-ascii?Q?RuGRjitVamdC8L1vDYReaWbD3hcAUyB/sxcS8Z6dSGi7eFOSfhWCb7cuZ+/h?=
 =?us-ascii?Q?liH8p15GFDG7YBbI+wUHS4veim3g4+dMrHbBgDbmvtzadjfX3zUgSZcw/Ec2?=
 =?us-ascii?Q?bZAgAIaMQzMtZjtNdBUHUP6Oyo+pAy9qb+vyj3HirjJbVD1ov6hZNbQaPj02?=
 =?us-ascii?Q?5Ku1DpTweCu+eTdJ+bZoHyPxppaU0FEYYdyaWa+bdqChw8wwci7seWqzWNYm?=
 =?us-ascii?Q?G36xmRdp7o9maElCYN3Nuw/XZLHmdHW+CjNBoFGJqu2ZpQKAbINK2W6vgVdX?=
 =?us-ascii?Q?vwnmTNEcZkEYPKskvGtuVRsVA1e8XBOYkHmfDD6+jPZyAmvixdpVjQTQgfOq?=
 =?us-ascii?Q?Mb8QLVPFmOnI41zTh2FogEp6yAV/ytmmXmQAeVEOEVt0k7l/aUf8SrMLobOP?=
 =?us-ascii?Q?6xGDkhoxVoHMET3SSqptfufQ77tsMjj6D0dzuvLUIbaVu+B74ovjIodL3sdO?=
 =?us-ascii?Q?P1yIEh6rDolW/DrOBo+RXgbt3Uh1uRnXyT4sq22hda3WlfNBiV4daoR1h8Sq?=
 =?us-ascii?Q?yZEkSEXRUDaFEDKdTfrLGP9PBeqXYQHkJHX2ciZ8oddfBojIKvWtwjWWwARp?=
 =?us-ascii?Q?FAdDfcz9I20EeDhd6yKbWyO1dacVzTBek6A6jzUAWZ+X4/P9I1VNXwD6tTgZ?=
 =?us-ascii?Q?ZcAcFFwfN/YjTU2rpo6KrrA4QR8wZocmVzmPoxGTiBQrdKxnAnFfyS2qyOE4?=
 =?us-ascii?Q?CRtslDtHzi4/hRXEwoK0GtuB1OXb5HIC9Y5KGnYH4XC2QOldGion0QsXkd+g?=
 =?us-ascii?Q?dD1QjqtNWXHAJyK19JHt8tBRntH+RNwYEATfQLGulnmYc9z9o8hg9e7UXQbK?=
 =?us-ascii?Q?6LVcXR21hYsbaDh+WPu7ZyotmFp5aV85hkJPBKtiZuE+Z6bY59N+NtQiDfep?=
 =?us-ascii?Q?/1tOwh+wz7ACAh2WnESw3PADIEIJuPj6eK0xnM/bR+pPF2mM/1zh1PUuJDTF?=
 =?us-ascii?Q?/+fh78RZJq7iIInpOeE+cOMDi5N9/Cc10kIsZXmkgCZdvu17AnKjElp8oeXU?=
 =?us-ascii?Q?3JXJTbTihSUx60Tq0FL2uOknstmfJsH6jASPi+kbRaGucbMyJghs9Uv2fKov?=
 =?us-ascii?Q?SRBZrWlqW1DuFfFcG6OG3uOJp2YtD8+eF1FaxQxelOrdCI9cQDGylcbkK3pW?=
 =?us-ascii?Q?osJtd/GFK+5p+kUQjqMYp4pQlQJ5ry/4fkZikLkriWaaxPWlLcmMMohps8RO?=
 =?us-ascii?Q?xbSQ/0tK4g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vuY8am2do+dyFhqwQj3ikoDIcR+eAkcZAGeWp2wqLAJCU+I7unoKrfaISqvFlnIwlUaJm01asKkGx/fMNaOz0m0DDcVHlbcxX4pV0XObVDKVJfFEPWdtVXFaJCZ+gvYih5GKxcG/VfTzFYBQyu7deahib7S6gxQiTT5EqhZNUXB5KmAicef+dCY1i/Y1bGrGjCLqO+9LAIsDmfEKwBhZpOMLc/de1hFyqpCu8/4l52mMfRej/9XXhKZ32zznmVBogERGH19GnHzm1xq9hsKdxBz0euM000v1A+yMLASkduxch5jhdHS3zHRS1JxcOLP9++05Nx52uMFwQkw5ArcO8A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a802f3-db06-44f4-54d4-08df0d80a9d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 08:10:36.5856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bCcvrd7q+0BR28WnfV02mQh7BD1gsM+9WuDVdiXmgXAJusSrWvJ8LOygdsmNt1g9AoYrlbuqHV+vOG0q4+TeIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9820
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

> Subject: [PATCH v5 11/12] drm/i915/dip: Enable Common SDP Transmission li=
ne
>=20
> Enable programming of the common SDP transmission line on platforms that
> support it. Compute and program the common base transmission line and per=
-
> SDP stagger values from the crtc state during modeset, and disable the fe=
ature
> on pipe disable.
>=20
> Currently, the stagger values are set as per the default policy of the Ha=
rdware.
> This can be optimized later if we come up with a specific driver policy t=
o
> sequence the SDPs better.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c |  3 +
> drivers/gpu/drm/i915/display/intel_dip.c | 90 ++++++++++++++++++++++++
>  2 files changed, 93 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index dacb4b7588a0..3cdb06e81130 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2737,6 +2737,8 @@ static void mtl_ddi_pre_enable_dp(struct
> intel_atomic_state *state,
>  	/* 6.o Configure and enable FEC if needed */
>  	intel_ddi_enable_fec(encoder, crtc_state);
>=20
> +	intel_dip_cmn_sdp_transmission_line_enable(crtc_state);
> +
>  	/* 7.a 128b/132b SST. */
>  	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
>  		/* VCPID 1, start slot 0 for 128b/132b, tu slots */ @@ -3124,6
> +3126,7 @@ static void intel_ddi_buf_disable(struct intel_encoder *encode=
r,
>  			     DP_TP_CTL_ENABLE, 0);
>  	}
>=20
> +	intel_dip_cmn_sdp_transmission_line_disable(crtc_state);
>  	intel_ddi_disable_fec(encoder, crtc_state);
>=20
>  	if (DISPLAY_VER(display) < 14)
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c
> b/drivers/gpu/drm/i915/display/intel_dip.c
> index 0c80d6305fec..007c8fb87ecd 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
> @@ -10,6 +10,7 @@
>  #include "intel_dip.h"
>  #include "intel_dip_regs.h"
>  #include "intel_display_types.h"
> +#include "intel_hdmi.h"
>=20
>  static int intel_dip_get_as_sdp_transmission_line(const struct intel_crt=
c_state
> *crtc_state)  { @@ -54,14 +55,103 @@ void
> intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
>  		       EMP_AS_SDP_DB_TL(crtc_state->dip.emp_as_sdp_tl));
>  }
>=20
> +static int intel_dip_sdp_stagger_to_tl(struct intel_crtc_state *crtc_sta=
te,
> +				       int stagger)
> +{
> +	return crtc_state->dip.cmn_sdp_tl + stagger; }
> +
> +static
> +void intel_dip_cmn_sdp_tl_compute_config_late(struct intel_crtc_state
> +*crtc_state) {
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +	bool as_sdp;
> +
> +	if (!HAS_COMMON_SDP_TL(display))
> +		return;
> +
> +	as_sdp =3D crtc_state->infoframes.enable &

Since as_sdp is bool does this need to be "&&"

> +		 intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
> +	/*
> +	 * When AS SDP is enabled :
> +	 *  - The common SDP Transmission Line matches the EMP SDP
> Transmission Line.
> +	 *
> +	 * When AS SDP is disabled:
> +	 *  - Bspec mentions the positions as lines of delayed vblank.
> +	 *  - Guardband =3D 1st line of delayed vblank
> +	 *  - Common SDP Transmission line is set to 2nd line of delayed vblank=
.
> +	 */
> +
> +	if (as_sdp)
> +		crtc_state->dip.cmn_sdp_tl =3D crtc_state->dip.emp_as_sdp_tl;
> +	else
> +		crtc_state->dip.cmn_sdp_tl =3D crtc_state->vrr.guardband - 1;
> +

According to Bspec 74384
The transmission line for each SDP type must not be within the V. Active re=
gion and should be positioned at least one line into the V. Blank (see "Tra=
nscoder VRR Function" for definition of Vmin)
(V. Active + 1) <=3D (Vmin - SDP TL)

When Panel Replay and AS SDPs are enabled, the eDP/DP standard requires the=
 VSC SDP indicating PR Active to be sent out before the AS SDP. Therefore, =
the following programming restriction is required for this configuration:
CMN_SDP_TL >=3D EMP_AS_SDP_TL

If PSR1 is going to be used with the Sink, then Software must position CMN_=
SDP_TL on the second line of the VRR Guardband (i.e. CMN_SDP_TL =3D (VRR Gu=
ardband-1))

Don't we need to check these restrictions

Also according to Bspec " crtc_state->dip.cmn_sdp_tl =3D crtc_state->vrr.gu=
ardband - 1 " only when using PSR1

Regards,
Suraj Kandpal

> +	/*
> +	 * Currently we are programming the default stagger values, but these
> +	 * can be optimized if required, based on number of SDPs enabled.
> +	 *
> +	 * Default values of the Transmission lines for SDPs other than AS SDP:
> +	 * VSC : CMN SDP Transmission line
> +	 * GMP : CMN SDP Transmission line
> +	 * PPS : CMN SDP Transmission line + 1
> +	 * VSC_EXT: CMN SDP Transmission line + 2
> +	 */
> +	crtc_state->dip.vsc_sdp_tl =3D crtc_state->dip.cmn_sdp_tl;
> +	crtc_state->dip.gmp_sdp_tl =3D
> +		intel_dip_sdp_stagger_to_tl(crtc_state,
> GMP_STAGGER_DEFAULT);
> +	crtc_state->dip.pps_sdp_tl =3D
> +		intel_dip_sdp_stagger_to_tl(crtc_state,
> PPS_STAGGER_DEFAULT);
> +	crtc_state->dip.vsc_ext_sdp_tl =3D
> +		intel_dip_sdp_stagger_to_tl(crtc_state,
> VSC_EXT_STAGGER_DEFAULT); }
> +
>  void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_=
state)
> {
>  	crtc_state->dip.emp_as_sdp_tl =3D
> intel_dip_get_as_sdp_transmission_line(crtc_state);
> +
> +	intel_dip_cmn_sdp_tl_compute_config_late(crtc_state);
> +}
> +
> +static
> +void intel_dip_cmn_sdp_transmission_line_get_config(struct
> +intel_crtc_state *crtc_state) {
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +	enum transcoder cpu_transcoder =3D crtc_state->cpu_transcoder;
> +	u16 vsc_ext_stagger, pps_stagger, gmp_stagger;
> +	u32 val;
> +
> +	if (!HAS_COMMON_SDP_TL(display))
> +		return;
> +
> +	val =3D intel_de_read(display, CMN_SDP_TL(display, cpu_transcoder));
> +
> +	if (!(val & TRANSMISSION_LINE_ENABLE))
> +		return;
> +
> +	crtc_state->dip.cmn_sdp_tl =3D
> +REG_FIELD_GET(BASE_TRANSMISSION_LINE_MASK, val);
> +
> +	/* SDP VSC uses same transmission line as CMN base transmission line
> */
> +	crtc_state->dip.vsc_sdp_tl =3D crtc_state->dip.cmn_sdp_tl;
> +
> +	val =3D intel_de_read(display, CMN_SDP_TL_STGR_CTL(display,
> +cpu_transcoder));
> +
> +	vsc_ext_stagger =3D REG_FIELD_GET(VSC_EXT_STAGGER_MASK, val);
> +	pps_stagger =3D REG_FIELD_GET(PPS_STAGGER_MASK, val);
> +	gmp_stagger =3D REG_FIELD_GET(GMP_STAGGER_MASK, val);
> +
> +	crtc_state->dip.vsc_ext_sdp_tl =3D
> +		intel_dip_sdp_stagger_to_tl(crtc_state, vsc_ext_stagger);
> +	crtc_state->dip.pps_sdp_tl =3D
> +		intel_dip_sdp_stagger_to_tl(crtc_state, pps_stagger);
> +	crtc_state->dip.gmp_sdp_tl =3D
> +		intel_dip_sdp_stagger_to_tl(crtc_state, gmp_stagger);
>  }
>=20
>  void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state
> *crtc_state)  {
>  	crtc_state->dip.emp_as_sdp_tl =3D
> intel_dip_read_emp_as_sdp_tl(crtc_state);
> +	intel_dip_cmn_sdp_transmission_line_get_config(crtc_state);
>  }
>=20
>  static int intel_dip_sdp_tl_to_stagger(const struct intel_crtc_state *cr=
tc_state,
> --
> 2.50.1

