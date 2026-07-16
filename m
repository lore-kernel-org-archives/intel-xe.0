Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22412C44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 02:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7C210F1AF;
	Thu, 16 Jul 2026 02:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IB8nSVae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CA210E28D;
 Thu, 16 Jul 2026 02:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784170202; x=1815706202;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8TuJuvFMCSA1OrbOh1tPU9JteUv8iX8JXN/DlX0j8U4=;
 b=IB8nSVaeU9to4bmQuQrSh4nbVNOnYDvJwIvu2/LPxr37yQGtnqX8LPu7
 2K7+SMirkEY5jNJFqcEKOzopXXhdYt2QaTsJl2fh5Mo0pW4FEgWJKm5fX
 xz8OjnrntECI6XtsFaEDHbE4CGH8oPhNT+F2zce6bHfYfQ/RZC+Wist7V
 AbYcvXIxfFTvt1+mXObc8zGdO/h49rsf9NC6Q5diXKNM47wTVROSByYHc
 y+UPMeLID+hXI3eJ2Phv3SxExL/YL/bam1OXoWe7Di3MmwpF2AyADaOKb
 jA/FhUtFuXq+KtN3hcqyTxIoBCqOK1WMfVgoHIiQm51wpm2BtClz/yyNA w==;
X-CSE-ConnectionGUID: Yyvl3CkWRDmKEPCnHRDpSw==
X-CSE-MsgGUID: Zg1cte9kS3aCQlXRZkST0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84604673"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84604673"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 19:50:02 -0700
X-CSE-ConnectionGUID: pa9ENGmNRL2XnpvUjABo/w==
X-CSE-MsgGUID: NX/v8O8UThu/u5QTlIY0Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="258336681"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 19:50:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 19:50:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 19:50:00 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 19:50:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfAYkeIpZG+TNu2lTpZvyfC3zGGLl/4KnMeNnrS7txyn58b1oDzAmH/W2wAqRqAsWg/nIVeVYhl1RiAH1txm10sDZeQ3waKcDj/3md+JmpBXYz2EH662gir0hm4YEXPNJF7Lp9kACF2BnwiFVqJG+zcqveWv5SAMF7Mtzf27LjQiIgFP+w9U0AE3yf1P/dKY1J33K0WsU1sJ6T2I9l/yzKYjMyLLmq/foh5Hw9ETO81BBX5XaCDBS6HD/5Ezw4b4h49A497WfsMjhApesJJhD5WthSUiHDm1RH8Qo/zxd9yVASTDN3iU/wOL2wUTt/Wms+aypOItb+/xoasUGNCJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDm13YIIYFJKXFKwXYDxNvGB7Bet07Rc60dDBqR6lYc=;
 b=rtHn/7E8QotYHbx5PYXs4ndkcN4UdfcKOoS7yG85D5M7Pr1ryAM1DSQx7uHf3X5gTesP5dw5WkVBBmKfCCwQLWjeNpqaQ7DoSG7uTjnBfy6OD2+JxSoXlyw9ObT88BfyaB9IYHWJriKGRALrWFT5835NakPDAZlEa+65EkwU4JwKZcr06kAs622LE1GZAk08jIwESR9SvXiJ5sOvpT/wfjeVUODHxlS3niWJ9bYAEbjok/jmLpLOzjmretnehVxnnMr5T1QaTIiZSn4u4EEMBLPr8Mp7hSkZWiKf5AcuSlpmmH+zvGbZoyU/gopVhfFNmbmo7rn8uuk0hKFFisV43A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB8094.namprd11.prod.outlook.com
 (2603:10b6:610:156::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 02:49:53 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 02:49:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 4/6] drm/i915/dp: Remove UHBR dependency from SST fallback
 kunit test
Thread-Topic: [PATCH 4/6] drm/i915/dp: Remove UHBR dependency from SST
 fallback kunit test
Thread-Index: AQHdE6VeFuDf2BaQpEy+i0APj260tLZvdCPQ
Date: Thu, 16 Jul 2026 02:49:52 +0000
Message-ID: <DS4PPFE901A304FDC2999FAF1AEB98A1F69E3C72@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260714152700.555527-1-imre.deak@intel.com>
 <20260714152700.555527-5-imre.deak@intel.com>
In-Reply-To: <20260714152700.555527-5-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB8094:EE_
x-ms-office365-filtering-correlation-id: 51ad652f-48a7-47af-6917-08dee2e4e95e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|38070700021|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: LhYhOX4Q1JPZlTnqMA7+g7IjYgTuSglOtUryn3jZ/f1M967r7RLZeSPnPspjG5rXlHuk3d58JPP7TcjG9zDK/pTFZ9FPB3prQKlssHpWLsJbyA5FGJ3woFurxOre0ZVQnccLUOYoAeazThtNglGFWfqwEKvyZo213oCryniscY0J1Xvxm67NJ5GNUxAIwYnWkBZUXr/4kUIrzpRPLFcYnzoAHsMS/ogT16ERQ6GmzhdDJoFEVdrE7VCYHgl/0wG5Xw9FrpX02UnwMWb3ojULFVOaR0wiNCm7D5wiSjF71gvZlaJMXhyX9Cq+StKJYBQIIKDq7QtEWygbKuILAhRoMhYhh9Mq+CWy2Ic9xfNy2FGlWz3ALvfmg3ZPWvr7h6syX1Isl1W6OYpu6Rahu+9gQOdQZj85ypLafIpaEdoQnetoFWigNj6LokJu1MeaHWetLN+o3YwOg9cpSJlwFcpQStRjR2YRS2kYR20+P8q9LOBRmB4wD/Gskczd8Igl0NxVVhcp6lbH/AYKeeySgVP1ZtZTOSffBtc1eBuaVX1SFgbT10b1s1eXIrFGPgWaBlT3AJEbssKFLZLj8YEEF3Dn6iABAkAMX/BsiHxTZJzhO3U3lkUgE8kpHGAEgK8p2GtVd0hO8I62RRlnt8ifi8B0LtLhQe2QVxHi0G+NNkJA4FDwaffDOZjAbqaesIsz2fSYBGboPIQgt/X2mjtqb1Xt9fsW0BRnuogF5tKJi8TPwKU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oz4YRut77zB4PgkDkmwQXkrMT3PMXvqqFoCFjLWxD8ewoQ7G7cy8ocOwI3Vk?=
 =?us-ascii?Q?FMQRY3vaA65exaNB3MDM5zm52xwLB740KKlksGVbRh+QyXcbPBmyhHQ4ZdiM?=
 =?us-ascii?Q?evcdhccelO5rVqW1Ruxhi92/VUTaPKfAvKyVDLXbUwzq6sYOQQkpzXbDajhj?=
 =?us-ascii?Q?2KVPALg7LBPXAf+Xk+gWdnyfpE91xnro71zoxWCNy2YiywxJ0dsHUp9OViWi?=
 =?us-ascii?Q?WKv7lWuN5t4zF4X53YGS49TLW1wUJwBbuUNYmbDlb3nglFezzIi+/iETofnO?=
 =?us-ascii?Q?ng2wfZvQ2txuX8dL5YWzep/dVgn2rdvARF6wog3iG1VguNXvgyyZiPgGX/4E?=
 =?us-ascii?Q?wdz737Fv2WaRQTujEiv1nurtw6MGvP5GA2r1EqViL9+ReoDQGXPZJdTG92fs?=
 =?us-ascii?Q?n3JpJkY7on0VnKCLmHdy4OWeK7V9opXS5C3hCwKX8QF7cgEYmU8aACF3o47i?=
 =?us-ascii?Q?nWDEflYvqPW5l7wGNzjBM/Udg/5lc+7ICz9aAFtlEC2EaKkOSzWOpFw0GiCD?=
 =?us-ascii?Q?gM27eze01FmQ40dIJld/smH9eMB7QdyFUSh6pBprNYjxGCdC9XAH2YC4wPLu?=
 =?us-ascii?Q?Z2afXqCCPJwtPLrkkeB8SRPy1CwmCu8I8ozzugckFXAoGpGTJaWiC120ctvr?=
 =?us-ascii?Q?+VsYLbRoQpWjoom0wM3pciuZgwvBZQ9kjN8bKBlTK1wZBknQx/DuivWza4IZ?=
 =?us-ascii?Q?7x8vfz18U0ARxhAo/6eVRyuR5TY8gWeheAaEpkOGaJZfInTu3l80CA32XITO?=
 =?us-ascii?Q?djXijB6oVakUUmQaC8eWCKM4Hdp8mPzb8IUlEtv7afDASHUnCCOUKB+lJVAs?=
 =?us-ascii?Q?oHlxxzMetUv1ftj6E2nJ5fenugXyfsbrTxxXoMSPSsd7xDc0fC2juwYCIriJ?=
 =?us-ascii?Q?QRBOvbUABJ+8PtkHzUN67BnqycFcOTaF0YHjvQy/PU7Pmt4gY3u5m/Hl6876?=
 =?us-ascii?Q?G/8PWqPyHaA1N7xihrFxV6b5GgtVuTGcsxRAaH+6lH4ScfibpY39teLPPiag?=
 =?us-ascii?Q?YL4E8w6935NzN56djT0q0rDS/BJ9dPTtYEqOQz8fYh5Wn9YEI5BO7rf3DX8Y?=
 =?us-ascii?Q?ut0/Bw6s+hD2mCQG7QQ53HJnYhUcSb3RqiL7qC6gOfrU5LQOzHbwpcdgOboQ?=
 =?us-ascii?Q?B8Xcybdz6iDvj+oXV1rz8e/YuHtU1WNi/Qlrn15n7FdSVXmK242VGwUBTLjH?=
 =?us-ascii?Q?/cYnVqkuDW+bNX4W0FB1qGjKJYwcvvSUYWkdtjC+6t3RrY9e4bOYmzXtdJZx?=
 =?us-ascii?Q?q4eq5kEaxVycPMyJe9GM3KfF9BNQUSI6xJX+R9K94PTT6V8C1/A4Wx9y5wXS?=
 =?us-ascii?Q?zLZlGjODs1iH63qQNoOQat5oxG51bMiGGDQYN8FImK6WITajKmuVcSSUw/2L?=
 =?us-ascii?Q?yKGFKMFoPTDe5zcFtURtLXlnK0O4hBRDWIH7Dyqe/sTZxbtP5UarRNnt8TNQ?=
 =?us-ascii?Q?xTJMutsESJiEp2A3BZuL6CVSQLfugTmNXfK8sIiS3sSaGSehvy3y8ltiy4Uj?=
 =?us-ascii?Q?TwBUduYv21vN+KPdUvVxkH7LeCHkM/1T6gLLMD27dluUehJNZVdNqoSXqP53?=
 =?us-ascii?Q?eei38QFW8xGm4eHVc7AAgYwwxDmOstWyFxgJVTmc/zY2gVVuxr9q3qyT9lUk?=
 =?us-ascii?Q?dEn+OHIVxozZV2Al2hA+/AbngYvf1o7eOSl/ZfTjUswDIfeYsoyJjsSbgKJm?=
 =?us-ascii?Q?4tyNpTmOddheVTojFPZDiQ8cGaEcdjQfFASIiDL3zyIoIOQ/dUx8Qaz0iLmK?=
 =?us-ascii?Q?vvCOveXQvQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qFYwwT9RrctgnXduPCsHcQtS/X+cW7cKs6bbGIQ2Enfwpy9jng34r18hvF2O+ZS34/hFu791FTMLd93DImOMYe4LI6V1dlFv/NbUXmBCvJKsOL4v5dHvTlHlgFH2ftiIp5cocGCz5FZHYlUTZJF1dDPm40f9adtJqxE4Qh78DICjihkpuZ7MI5pUVoI2SVvr4wGGJSJQXijLhXP6P7XUEdtLfeVJazkEs/BCNsjD+k4zzTSuoSVJisQTMINk6bzahylHkVNlocOFWPWmpcfEX6cF3MtxPydkJrxBDEUX/GbHV9yNWZBFZUnakgN7Tt4oTX6O2gJc21ju1qZ4w7/Bow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ad652f-48a7-47af-6917-08dee2e4e95e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 02:49:52.8272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PxGKOjWHKZ/aWpRdHzGCPOv1WbGVtPdXcUFqH8hVkFDPk82yJOaelLHqGAFdzGMLE62nPTbrznM0v2tDlVCAnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8094
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

> Subject: [PATCH 4/6] drm/i915/dp: Remove UHBR dependency from SST fallbac=
k
> kunit test
>=20
> After fallback between UHBR and non-UHBR link rates got enabled in a prev=
ious
> change, there is no need to test fallback sequences for UHBR and non-UHBR
> rates separately. Make the test simply start from the maximum (UHBR) rate=
.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  .../i915/display/tests/intel_dp_link_test.c   | 47 +++++--------------
>  1 file changed, 12 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> index 776d93f333851..67c6fe9f1812a 100644
> --- a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> +++ b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> @@ -1101,7 +1101,7 @@ static void intel_dp_link_test_fallback_for_edp(str=
uct
> kunit *test)  }
>=20
>  static bool test_fallback_from_target(struct test_config_table *expected=
_table,
> -				      enum intel_output_type output_type, int
> max_rate,
> +				      enum intel_output_type output_type,
>  				      const struct intel_dp_link_config
> *expected_target_config,
>  				      const struct intel_dp_link_config
> *expected_fallback_config)  { @@ -1123,8 +1123,7 @@ static bool
> test_fallback_from_target(struct test_config_table *expected_table,
>  	/* Get the max connector config, optionally filtered to the max_rate
> limit. */
>  	lc_ops->iter_start(&iter, link_caps, fallback_order,
> INTEL_DP_LINK_CAPS_FILTER_ALL);
>  	for_each_dp_link_config(&iter, &iter_config)
> -		if (max_rate =3D=3D 0 || iter_config.rate <=3D max_rate)
> -			break;
> +		break;
>  	lc_ops->iter_end(&iter);
>=20
>  	KUNIT_EXPECT_TRUE(test, link_configs_match(&iter_config, @@ -
> 1236,7 +1235,6 @@ static bool get_fallback_config(const struct
> test_config_table *expected_table,
>=20
>  static bool get_target_config(const struct test_config_table *expected_t=
able,
>  			      enum intel_output_type output_type,
> -			      int max_rate,
>  			      struct intel_dp_link_config *target)  {
>  	struct kunit *test =3D expected_table->test; @@ -1248,20 +1246,17 @@
> static bool get_target_config(const struct test_config_table *expected_ta=
ble,
>  		const struct intel_dp_link_config *config =3D
>  			&config_set->entries[i];
>=20
> -		if (config->rate <=3D max_rate) {
> -			assert_config_is_supported(expected_table, config);
> -			*target =3D *config;
> +		assert_config_is_supported(expected_table, config);
> +		*target =3D *config;
>=20
> -			return true;
> -		}
> +		return true;
>  	}
>=20
>  	return false;
>  }
>=20
>  static void test_fallback_seq(struct kunit *test,
> -			      enum intel_output_type output_type,
> -			      bool uhbr)
> +			      enum intel_output_type output_type)
>  {
>  	struct test_ctx *ctx =3D test->priv;
>  	struct intel_dp_link_caps *link_caps =3D ctx->dev.dig_port.dp.link.caps=
;
> @@ -1273,12 +1268,6 @@ static void test_fallback_seq(struct kunit *test,
>  	struct intel_dp_link_config target_config;
>  	int fallback_count =3D 0;
>  	bool target_found;
> -	int max_rate;
> -
> -	if (uhbr)
> -		max_rate =3D
> expected_table.rates.entries[expected_table.rates.size - 1];
> -	else
> -		max_rate =3D 810000;
>=20
>  	dig_port->base.type =3D output_type;
>  	ctx->dev.dig_port.dp.use_max_params =3D false; @@ -1287,7 +1276,7
> @@ static void test_fallback_seq(struct kunit *test,
>=20
>  	/* Get the initial target config. */
>  	target_found =3D get_target_config(&expected_table, output_type,
> -					 max_rate, &target_config);
> +					 &target_config);
>  	KUNIT_ASSERT_TRUE(test, target_found);
>=20
>  	for (;;) {
> @@ -1296,16 +1285,10 @@ static void test_fallback_seq(struct kunit *test,
>  					 &target_config, &fallback_config))
>  			fallback_config =3D INTEL_DP_LINK_CONFIG_NULL;
>=20
> -		if (!test_fallback_from_target(&expected_table, output_type,
> max_rate,
> +		if (!test_fallback_from_target(&expected_table, output_type,
>  					       &target_config, &fallback_config))
>  			break;
>=20
> -		/*
> -		 * The fallback changed the max rate allowed for the next
> -		 * target.
> -		 */
> -		max_rate =3D fallback_config.rate;
> -
>  		/* Simply select the fallback config as the next target. */
>  		target_config =3D fallback_config;
>=20
> @@ -1314,14 +1297,9 @@ static void test_fallback_seq(struct kunit *test,
>  	}
>  }
>=20
> -static void intel_dp_link_test_fallback_for_sst_max_non_uhbr(struct kuni=
t
> *test)
> +static void intel_dp_link_test_fallback_for_sst(struct kunit *test)
>  {
> -	test_fallback_seq(test, INTEL_OUTPUT_DP, false);
> -}
> -
> -static void intel_dp_link_test_fallback_for_sst_max_uhbr(struct kunit *t=
est) -{
> -	test_fallback_seq(test, INTEL_OUTPUT_DP, true);
> +	test_fallback_seq(test, INTEL_OUTPUT_DP);
>  }
>=20
>  static void intel_dp_link_test_fallback_for_mst(struct kunit *test) @@ -=
1330,7
> +1308,7 @@ static void intel_dp_link_test_fallback_for_mst(struct kunit *=
test)
>=20
>  	ctx->dev.connector.mst.dp =3D &ctx->dev.dig_port.dp;
>=20
> -	test_fallback_seq(test, INTEL_OUTPUT_DP_MST, true);
> +	test_fallback_seq(test, INTEL_OUTPUT_DP_MST);
>  }
>=20
>  static struct kunit_case intel_dp_link_test_cases[] =3D { @@ -1352,8 +13=
30,7
> @@ static struct kunit_case intel_dp_link_test_cases[] =3D {
>=20
> 	KUNIT_CASE(intel_dp_link_caps_test_update_params_expand_disable_
> random),
>=20
>  	KUNIT_CASE(intel_dp_link_test_fallback_for_edp),
> -	KUNIT_CASE(intel_dp_link_test_fallback_for_sst_max_non_uhbr),
> -	KUNIT_CASE(intel_dp_link_test_fallback_for_sst_max_uhbr),
> +	KUNIT_CASE(intel_dp_link_test_fallback_for_sst),
>  	KUNIT_CASE(intel_dp_link_test_fallback_for_mst),
>=20
>  	{}
> --
> 2.49.1

