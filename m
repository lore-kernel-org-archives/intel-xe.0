Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E6B606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 17:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FQ6hMLkH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C3110E331;
	Wed, 21 Oct 2026 17:08:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE93310E331;
 Wed, 21 Oct 2026 17:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792602522; x=1824138522;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RMHMgDibHp0SBkS3M/5woATYpANTQiFaMCUoOL4FagA=;
 b=FQ6hMLkHdpDlH0Q+h6JKaVqMDltAxgC+gytZQSk0yop87CF/irw1TALi
 0JxNPFLbogrJFwpoL0Ds1o8AaL4uhBqnJJiaEJUOpxunnpPd1hGr+gVAe
 fBYs88ym6XWXvjHVjhhjpJpS6Ugxo1zWDSj2E09BAnlz+BQnhOHSOskfu
 oNdY0y7MmjiHIFfJApY0siNHmGrqc74N+sLBZHfNuyYCZBVgaa309Pxqc
 SayYbsucgbqS7RQBbbVgxyBNkI1q2O6nFNdja/jY9jM2Pi22FQtWc5sEI
 Ej21wKHuNFblVbOq/W7QOzWhunACe60s5cVe87nfSuXqS3yBsgtQxWFbW g==;
X-CSE-ConnectionGUID: YWqMZTc3TiGEoCEWIszxAA==
X-CSE-MsgGUID: VflffZ5iSVukPK+ParEUBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1231685"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1231685"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:08:42 -0700
X-CSE-ConnectionGUID: S+9/VE3CTu2QVrVRY0465A==
X-CSE-MsgGUID: 2zgm96w9To6nxhXGsLmvOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3554703"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:08:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 10:08:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 10:08:41 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 10:08:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZ2TeISJ7MWtZRpFMrHU6nq7IDPn/wdFp1+djjyKs4R7eoYE9vsUgiMDRlKBKijat9EXXYRZSW3EJ4kPap3LF3H7p5TzwuEiQ2zm3hmFCOPu0UgTRS4Wfte5zmiaGGjlQjs6rDgCj1DeGXA4fkM6HIYFDZrtwhwCsgn32+oQcR9j8Qe6bf+QYMeanWC0X7YdWOC0eXJ65C94hcLkxZdZrM+IqJ58HqZIgIqFVDV0kfxLgMUYqARTn5G4ZDb+ezqVMAPsqI8/u3nYlcJ0LXY6CbJM5UBVNemi4XvLTPKH1o0XYV3/Kimmezc96tvY8jccbOEqUN4QFJOjhjjkgBNrFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+olW8RhFAhx2sP1bNaW9FcQswaS6q+6Gep1Ts2pyWtY=;
 b=VVK59lmrnoDnem7HyaGGghEUMBFbRGM0vth5kxl4VClj28GssM7n9cQDU60+KvlxJ+fkilVL5btjqNv21nuFcF6RDHpX4FCwqAPEnh7Xh/EqyYjY+CfmYfju7bn+x3E9aRj5z9moz7Ykfvft6ZThUbVVkc9U2kRqKnWHXBGQBEH+fIfA0d5WHV7AsaiuTqkmskUavgkVUFjeeDCA4YaS0Rry1gmB65pszwYXbxViZtMf/RF5O6hjryQOKGnVXx3LGhfvDXQM1x/JcO9CSTSdvwanoFbi9gqa9DnQVVB9MUaYDUbrJKi4RwZCJg6COpQ0+SMHvsb29IQLYquiPQJ4sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by DS4PPF641CF4859.namprd11.prod.outlook.com (2603:10b6:f:fc02::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 17:08:39 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Wed, 21 Oct 2026
 17:08:38 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 03/11] drm/i915/display_wa: Add support for
 Wa_14014191401
Thread-Topic: [PATCH v6 03/11] drm/i915/display_wa: Add support for
 Wa_14014191401
Thread-Index: AQHdYSvMfge4KW7TlUaGbZMi5TuR7rcIOtSw
Date: Wed, 21 Oct 2026 17:08:38 +0000
Message-ID: <BYAPR11MB3783FC1B96A694B9A629492CB2662@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20261021071401.1161586-1-suraj.kandpal@intel.com>
 <20261021071401.1161586-4-suraj.kandpal@intel.com>
In-Reply-To: <20261021071401.1161586-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|DS4PPF641CF4859:EE_
x-ms-office365-filtering-correlation-id: b9e2db1c-00a6-47b0-b39b-08df2f95f359
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261021123027099003|56012099006|38070700021|260925022911599003|260925021311599003|260925021911599003|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|261021121427099003;
x-microsoft-antispam-message-info: LEeu79zQ+p7LsuzJ8GrNyAqYnFF1SyaN/R4j4k0aX2jVeW9MeXu2KIXkcw4TT0K/1tkbymwyEHn/i0XjNxXAKD8mF/+PP2xZC5zWF8qYr8IvSJ7184UTYQCcsQ7tRv0zjO0kPBrJ51KutjNYuzAtG0Ra/irOS+j4v9Pq7J2a5j/9ROxYR1VzZZL/9CpUmTP5GgElqXI8kbLD0HM8zm9XKppfV+2EyQ+QVnaxJT5IphsQLZoPm2j2ew7jafQq7dpeS/VpzAeIS1B85AKGOs0VFXN1ABfPS0ZLEnbEz7kOmQVd2l/WYasuXhi+fyS7nxLIxeSNp3xGoyQJDka/54r0/k3tpqArXeCuoOdJ5eO49fNq/zna1x3ojCOdu7JD+mqRbKn+YvVIfFXyyGeytkxN9h/I2hKa7M4Xzo1AczIFTfyOzl3Gk0gcptw3KNdyXsfK7ce2d4bXZq3RkEWP1apOVvig+5EYo2GlaZFZCJ0j4H5S0ywDPlVjQSaGUxs9dbPHRxj6H90ersjDO8cd8oMKITZDPhpJTb/iZkbbZYPcIQHVPPMGgke3lXHOm0p92FNFYmol/QUM0b1Ooa+8EA/ezSHuJSl3wpLdnMD6JUmpqShbDDJ4uf4HPmVBPddq2Ly0bhIS3c18LxKRgQI/hVMDcy6XjcNwjxVSWm+8C+9U6fwZewlyheQqlxkfeQOllegBLcEqEHKA1/VjBdSSB7mMhg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261021123027099003)(56012099006)(38070700021)(260925022911599003)(260925021311599003)(260925021911599003)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZOH25W9Cjiz2sBXczv3MEd1Cg1l7dBJg8JJbPnLOVTH4/8ulueIrHMOgPV6w?=
 =?us-ascii?Q?adgjVR5P1yrj0s9pAvuWUIZ8fAMv4LJL2bQQP4p40vaZXn5EjQ6Kosn8pZZg?=
 =?us-ascii?Q?wk62LqiaacsG8c5V95znvAjwiGcpcqQZ0Zq+9FTRFmnXJjny/pkEhHi7RdwW?=
 =?us-ascii?Q?JEsR7AslVACu/yrceLhL6KhZaTiwE2PhulwL/ajQ7QZ5bcjgv/ispeGTUQMe?=
 =?us-ascii?Q?3RwihkNaudFtjIpEaehjgKZHeElKGm2T3DZDwmebpQMeIPm5bAUmfRnL1rCQ?=
 =?us-ascii?Q?z0M1lhnQgK8w8hu7rq0o1J96D8jM/vjBhOoYvyIYCKOo15kgck40GDdZIpbY?=
 =?us-ascii?Q?MYndvHI+PzwrKPOwsDANU8FXuqsUDndHd4sd5uzlzesaWKqXvY8ox4eAbTPU?=
 =?us-ascii?Q?6clFnN3rBHu97jNAKkiRtTUXPfgStN7bPdLHdbGyq14PLv46TQfSzweuRFWu?=
 =?us-ascii?Q?Db4TZ9BcQTMPLYsZtbqUYDxdvBNo+4dq+6DFpVRLVOgyxmQlqZ7fnz1ZJhTi?=
 =?us-ascii?Q?hqo88/v9PBjda5XCVg+guzCHr6LEJx8Kj9WqnJX3iVc54il+6x5I/N/Eg1fF?=
 =?us-ascii?Q?/JbEO3YIZC7uJ96GFuV27/YgY9vRZsbfyVPyBzgl5U8N8+E/Mrz5M9aChUZq?=
 =?us-ascii?Q?KMsRkwWXllH8LPf+Zv8/g0aBBMTHlw6OiAgyl8CqlYDaitRdFl8S45ev4BHz?=
 =?us-ascii?Q?WqgM00vDoR+KMOJrqMd6cZvNGkbLGKS85+ZuwJcfWwSd7tfWIUJDox75af0R?=
 =?us-ascii?Q?R3iwmJT13UQmQKS4/8c5cTAT6Trumz2WoQDcug76h7v1vmyVxsxLNL8HWVz0?=
 =?us-ascii?Q?7X6mcLX9JBhyYRdCZQQedyyFkkFJedfz5Cgwti4V+XKHgTenU2854RqeiNHQ?=
 =?us-ascii?Q?Z4QW/KbrQaGnUbAiEDLoAcXLodj+0JFib7hRtYb6tAHojrpX+m2wpesAJ97T?=
 =?us-ascii?Q?Som8yi/SyA73gm235gapwYs8jsqviPo/Kng+L0I0Dm1pu/E72RgK5BlPKMG+?=
 =?us-ascii?Q?jq3fO7XYYAtaHM6cIpxTzrdIQQ66i+pUk0ZwZ5xIe5DPh5jq0WwJGws+0bQF?=
 =?us-ascii?Q?oAxuyR1KW4tNlr6t+UMsUd2iJwfjdJ2PmbARU6QD+ZN+oK0qjh3MRNF6Tzil?=
 =?us-ascii?Q?wy1EIWYZNQtmnBlOklTNtg+QAQIfuxu2soW0j31PBfR5D/vuCNcWalXR/CK8?=
 =?us-ascii?Q?qHnDNkc3pDzb+LmMx6XbkMPVe0zG11RbE27PwmBOeO2s0lVtU2aT7KjEDSp1?=
 =?us-ascii?Q?9oCoE4ggAH/Eaq6Osmzwc+h9T4VbiX27uS3UQSYtRr31ugJ+OulRbWAp/Viz?=
 =?us-ascii?Q?kN5kyUyPDmotOvRVsvB1ZTSpTSrdCdDTCo1GQWco460BWuQZLpTLnPF+Pn7R?=
 =?us-ascii?Q?qrOcexT2jMCIE+u4rb99Er4eltlqVj8NYTSE+n3kDbOM7DgJGygiGqybObIn?=
 =?us-ascii?Q?E3Firghk2P6m7ZbRrylpOwowxvno8JtYC6GZHQ9cW5BoaRor90ZHdFd/fA7O?=
 =?us-ascii?Q?qYfyWSJNfMa2t/7yqRTrCV53LHkjZHl7mh02wplTIQWaxC2er0isGPPFeqHo?=
 =?us-ascii?Q?aPfPEp5GSXzwmrLvBi3HPmSkbg8HakduQPr3ZueLK4ukZ9/DZK6eF09QlNA1?=
 =?us-ascii?Q?X5ML5iysBfDWI+0ncBTs3V0UlVYhfrK5NDG9ZXWQzEI8kubcw7tCLU1sQws5?=
 =?us-ascii?Q?ZbNT10GIPtw52Yy/K1/Ai/O8HEg0091C3jloTitmHOb1rdbeMM91R55/VV+v?=
 =?us-ascii?Q?4aI1sIwpiBrifjGhID5Rlvif6ZFKvXo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Z7/NGEQ4SIoyIqr1dIogp9gq93MJOQ9hwfhJhFXnE0etI5rn3mOArB2RROQw5oPp3qy3u6WKt+QRUxdv+/xtkKwn6FuBWhLfgYNbd7d4KrWhGT9/FlDY04B4VWCZSGsbjHl2KQgam6fh8tsikITuJUdTI3JPqaFR9wxZOHVkudMtD7vDLrGPhdzp/TRGFbgRss3gaNMMK2N35JA4NVUU5TXd7bI2lRfCUC7iPZoZJTydel//sl5PwEuEracrRJ4L7zzoxfkgcULPkX2lepdAVyupXY4fWbYN4r7zAH8N6JwPs3JvoaSpV5j044tsv6G7D3sQg0PBgKZ/cpBZFAhSSA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e2db1c-00a6-47b0-b39b-08df2f95f359
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 17:08:38.9205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9M5Qe1LHBsjY4MXlsLfYTkl+BczJ2lcumI+dphiLNJNstf8yxT6z4pL3I3hWigWjS7N8t3FkPJarfMiWmIb8FWba5aaokRKSFHSUF1++qF01kEH2L2iaoE8fKTe03fTU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF641CF4859
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I think the patch order may need to be adjusted: swap this patch with patch=
 2 and move the current patch 2 to position 3.

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 21 October 2026 12:44
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH v6 03/11] drm/i915/display_wa: Add support for
> Wa_14014191401
>=20
> The DG2 transcoder timing generator DDA only supports a Link M/N ratio of
> up to 4. The Link M/N ratio limit uses a bare platform check for it.
>=20
> Add Wa_14014191401 for DG2 and use it for the limit instead.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
> drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
>  drivers/gpu/drm/i915/display/intel_dp.c         | 3 ++-
>  3 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c
> b/drivers/gpu/drm/i915/display/intel_display_wa.c
> index 2e3ff4861ef4..91395076e903 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
> @@ -94,6 +94,8 @@ bool __intel_display_wa(struct intel_display *display,
> enum intel_display_wa wa,
>  			IS_DISPLAY_STEP(display, STEP_A0, STEP_A2);
>  	case INTEL_DISPLAY_WA_14014143976:
>  		return IS_DISPLAY_STEP(display, STEP_E0, STEP_FOREVER);
> +	case INTEL_DISPLAY_WA_14014191401:
> +		return display->platform.dg2;
>  	case INTEL_DISPLAY_WA_14016740474:
>  		return IS_DISPLAY_VERx100_STEP(display, 1400, STEP_A0,
> STEP_C0);
>  	case INTEL_DISPLAY_WA_14020863754:
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h
> b/drivers/gpu/drm/i915/display/intel_display_wa.h
> index b707147a7587..f41e58d1d6e7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> @@ -31,6 +31,7 @@ enum intel_display_wa {
>  	INTEL_DISPLAY_WA_14011508470,
>  	INTEL_DISPLAY_WA_14011765242,
>  	INTEL_DISPLAY_WA_14014143976,
> +	INTEL_DISPLAY_WA_14014191401,
>  	INTEL_DISPLAY_WA_14016740474,
>  	INTEL_DISPLAY_WA_14020863754,
>  	INTEL_DISPLAY_WA_14025769978,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 7ceb7c02b597..f3a79ae49b18 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -70,6 +70,7 @@
>  #include "intel_display_regs.h"
>  #include "intel_display_rpm.h"
>  #include "intel_display_types.h"
> +#include "intel_display_wa.h"
>  #include "intel_dp.h"
>  #include "intel_dp_aux.h"
>  #include "intel_dp_hdcp.h"
> @@ -1271,7 +1272,7 @@ bool intel_dp_has_dsc(const struct intel_connector
> *connector)  static int  intel_dp_get_max_m_n_ratio(struct intel_display
> *display)  {
> -	if (display->platform.dg2)
> +	if (intel_display_wa(display, INTEL_DISPLAY_WA_14014191401))

With above suggested change is done,=20
LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

>  		return 4;
>=20
>  	return 10;
> --
> 2.34.1

