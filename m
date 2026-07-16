Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E265C44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 02:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D9E10E28D;
	Thu, 16 Jul 2026 02:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VULcm2cD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11F710E28D;
 Thu, 16 Jul 2026 02:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784170069; x=1815706069;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bVvYZYvURFHIbc37xTnu7SBzROU9y1VZczKDNnTokyQ=;
 b=VULcm2cDFgIMifATgINUQEI0YxHlnxx0VBzfjo1osJWIgCFVci3TMe8+
 0mGfeEOKuZgFg+Vdc40xa4jQAZ6gj+76gacaACCbvyuMRMT9i8mElJNdC
 upXgscPrxrw2J/ig+AXDVzAHLHpImkF6kQDMlKMy+9N+tS726/2HSkxI2
 s8lhfy1gJqPhKf1IJFxF9Rn56fCP1l1bD2a/nklbGBrSIP7D61d971Lj/
 kUzGk3zh7AXQQE+v8j3wyA280gLkLZxSd/c+7GuqgTORZlKl9+aRBUidA
 UI7DPVYX/FRn6UnDrBGGtxJpTywzCGxuAZdMQ4oK55inrxEza1XzlBIFd g==;
X-CSE-ConnectionGUID: b9Ll/kkNSyuUkIVO9CoPpQ==
X-CSE-MsgGUID: bIGl21A+QH2XwT0OYne2Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84604587"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84604587"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 19:47:49 -0700
X-CSE-ConnectionGUID: TbK1GBhZRkiQAFOMob/wlA==
X-CSE-MsgGUID: PD0K88PqTzSkM4DJutz0PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="258336370"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 19:47:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 19:47:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 19:47:48 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 19:47:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1aY296rcQnVNTrkpsNTSziLHemo3Jfn8kdsdo9RRHwuMOfoaKRMKwJMtgURLIXUJiCVgywL9/KPSQDjyl+rdPIxQIsyALM7ZsBw4mT3iK4gXrozQqghy28SyvKUgkDWpck6CsFkFNgvZ3j7haZErHd/LyHgJ2At8/NuSluf471VjmG7McS6EtdJiQK5yh8NUd5trzIZcFBvoTYvYgWb0m5624Jb+kKVuNDmpwZiZU0riNcHH6enFzKY/K/7EfsYuiNBriZQqoq4xiZHpxm7T1P51QuoTgdQgmorzA2AkEbEduZnxn5j50NimFKpoHGRd52rtBpitMuVMUmxa2gSaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGPRkbFIut7RUKriWpTzrMg/OXlu4oCn5TwjbPaskys=;
 b=YbaZfw9c+UJ/fdjZnT6hZ9H7N7cIPV5G3eiunLOB2+mYJqaadhGjzuhIX/TLAIslG/gws74GEnCEhO6ePbm3yZBCSm3OPcf27PmwdoptT48Kx8VCBzJWCbIJQEiplvmJ57xnRcx8e6EgzohDUH5hrznc/9rLfwfJYHV6a8uc0V1WPPa6HUxuN8bp6NPuYHg1ppyjx/AXQooBn6Kl8ZLGvsFhWRJwL35knC6o5gA2sQX5g9we7bpcNK0r8KS1+sPuwRHkHakAIpLysm9nmAWLmG3XOiCb9sFZYucF+IGGSNy98sbh6mEpAcK/rLt/GH08kSYnDwe/Dvl6hfmFBL8yWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB8094.namprd11.prod.outlook.com
 (2603:10b6:610:156::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 02:47:39 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 02:47:39 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 3/6] drm/i915/dp: Enable SST fallback between UHBR and
 non-UHBR rates
Thread-Topic: [PATCH 3/6] drm/i915/dp: Enable SST fallback between UHBR and
 non-UHBR rates
Thread-Index: AQHdE6VdjuWTUGN0s0OV+Uwg/KynrLZvc38A
Date: Thu, 16 Jul 2026 02:47:39 +0000
Message-ID: <DS4PPFE901A304F00E168ACC008461B419FE3C72@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260714152700.555527-1-imre.deak@intel.com>
 <20260714152700.555527-4-imre.deak@intel.com>
In-Reply-To: <20260714152700.555527-4-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB8094:EE_
x-ms-office365-filtering-correlation-id: 453bb775-f777-41e2-f278-08dee2e49a02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|38070700021|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: 7zbdSDn1HRMr2g4+UHLc3FKuoHjPVRDQFBSH3CketwFght4i3HzWxArD7p21cwygymYL6Ozs0IPsSkrOM01DQ/FiXbBF1YO9+XUa25lwoX6fThMjEce1CGn5bhQvjM3GotNfGe1vJjC1Xzo2z/Ggz2qgRA9FhArDKNWZbgYrTxpLSkc05Evu3xi7kgczPICI+ejFzQrnNPWrHIWCujPaD8Z49JdON1D1EA+30NbXO/Au3yWQ8/iqQalLpcYFqHnLlziF4YqZcQDmbJGYuNJeMwuvOqdXoQqvMJtiQ1Ktuk3dPobf1QUYaU6Z42wMyKyEcJxzyeii6wOK6BXJC7h1SXV4UWbpXieAi6k4s2gtt0C3VcNY294PwPboKyhBoxOu7yzrIUm8OC84VdvBxCFWs24oMPLD9MrkCnWKU06GV8FYHlRV0aONgx/xIv8hRsb+24MhdZzvvkGa7B2WvF6MTUNaTKt/46/DMVgbkisSe2iifYI4Z45TKeoynTvCjPFoWJTh2sb84NsIR2qBaw7kJt5/DzBzQuPa23RfrU2NXgOf/S18EC8BHwbzrDukwUsU1XfZVxlttaBmFTIbUn7KiCqyesQsNZnnXhbeKk7doBBXBDHi3HqlOFXGLJ3mRzm6agrfQduup7SF9jOs7Zu5Hy9mS6klFkur32pMblVVLZ1VvKgD1m9CY8r+UwMBXvwATtsBOSjUe6fz4cUE9RtzultHK2i8iFX7VNySKvz3FWY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ALKoPyAWxVT9RgefgCNbozdTdsogfjc3MOTvgTUCq/ocyGQlnswOrQyqpy+y?=
 =?us-ascii?Q?iCwCjJXz1SZwi4GGFk/GeoxZVxbGkeq+j0hjTPRW53kDwGJFXd07vk0fnyws?=
 =?us-ascii?Q?x7qVPBsqfvXBDSNz6IIn5IxFzkQGLrbD9nvHVwelmZM+nxrn12VlWDqfSKtD?=
 =?us-ascii?Q?+a8qP+jvD9XapS+kXkzyEP8f58ygKx6NeFIS2/G0w98GlC62WERew/aXagyL?=
 =?us-ascii?Q?Pjoh43aDOZgXcKt0Pds3Bu/oVoIsBOt4Jevf9twDr0Gih/Eau+cr85NGGzPM?=
 =?us-ascii?Q?MXaLFgVGIdem0gBeTi2lhYcqdT/lfNRi5y4XS1xnBG3qKFyZFjZpwJhtD461?=
 =?us-ascii?Q?4nmjHPFWff0r3ldvjVpk2+XRMvunpFtpOqXqj3vd9LxNhJyEOFV7T7Ulml3K?=
 =?us-ascii?Q?6O3MMfr+P+MtlOIAtZnz7GeenmUdWW5jAFAoDXB2ZLqijCGY8NGCfe5tOhpK?=
 =?us-ascii?Q?ufvnQV6OCSPq5kOmayVtJoW4ECCSOiOP480t+ftpgu0aONycZpOm61acRBVy?=
 =?us-ascii?Q?oURGDp+/OihRfAQHDXzWCvmZrw0rVcd8be3SO6IBMoJAKO7Rkgl0CqZKWpoy?=
 =?us-ascii?Q?0URKOdKq9DDvbB6yuM8tyiSYH2TcW2xOOQz0aVEpKHqAzbQADVgRLvKkVK8y?=
 =?us-ascii?Q?uXma71I/5d/zRAb675DQ0gEd8a9+WnXwJuZ7V14XHn8dQPaeWMHgQ5sjIl10?=
 =?us-ascii?Q?AyMJx4z050ojIYI3cjpSYgVrWUWe3casGFOVtTSX9er4F3Ee7pHyUlm+gxhA?=
 =?us-ascii?Q?EO6g0aYFjv6F/tL/2mVRNSSd9GrQZ92cC4tVoAOo2n8NCeSGPbqPlsudRFRR?=
 =?us-ascii?Q?EXXPnMe88hOMJUqK0mBNocR+tTsHGeO0PKFRQstcHEVjzY4fBXvLCfMJZGAO?=
 =?us-ascii?Q?eLirJJkO7o6842ysuSm6t52ssTFpt4yB7+ZM8HgV8ElB4SP+PtpjNBkYr6A5?=
 =?us-ascii?Q?2dU6lHGMyoJw4lwk3kYKpR3LbSzrYdFFt75BayEBlo9j9wjLWcU80LmoqyG+?=
 =?us-ascii?Q?casV2APopT/jMnQ3JVb5dxuUmODsFPKIsDDSw9Ar6WVVu14Kn6nr7IrOBqBP?=
 =?us-ascii?Q?IbnOPk964QSgRcEypmBHpQxVs4/DZbvkwi0W7SgtA4Amqh0eT9MkSBKe1OtP?=
 =?us-ascii?Q?iwNDzv2+dyFu0ArUOYbVvZTfWeof55uU0mXU3BRvTmqHDHhqkSFJw6iEbcXG?=
 =?us-ascii?Q?Ye9uYLfrSw+OUjxhbWPWwC643ZWIKK2bsBdRg7qCgIu3dPFFFCgIwcBP29e8?=
 =?us-ascii?Q?PnUx8KZCgO8grCV0upvlsqBpYUAfAXb4rqARJlRFTghr0J0RJFEJrUB0gTAb?=
 =?us-ascii?Q?Bl389QV5KXUQ+bv5MjL9y6XULjXnnqEgnPXm1DaCGmJo+fyITk2hZYrkKQx0?=
 =?us-ascii?Q?8+Je6jxFOz0Jmj1O/yiZSguGBk+zrOQcdUtLqHLovWD4lPykS5VCl6ltosJ8?=
 =?us-ascii?Q?oe/Qw9uaFwVH7eoGm0ax4G2fdFGitG4HanFV/32Tgb1vc2gQ4AzgGshCsI3T?=
 =?us-ascii?Q?rHrDiAlPq6ekJGAs3+2wc5FUx4ZbEy6xLRrQ8yDA/fg9zS4kCB+VzC3Js4A4?=
 =?us-ascii?Q?0OFcgnfRDLUsWcS+q2HvchWxzQPzIRySNIzfLoJK5MPmiX9VxdKup3X6iJ3A?=
 =?us-ascii?Q?p7ON+uao3x0fDX0YnB0ISbdZQNW8eutVvocXVjGZ2l8k4bfpOEyoHPnKaQw4?=
 =?us-ascii?Q?DwCS5aiuOscVJjxDJm4w/N8bOheJHyvAEUBUhHFnW97h+9WovNIF8ntZedRY?=
 =?us-ascii?Q?68AAWjBSwQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NlR2w/UtvNwyNH3znXWNElauyA+HhzIoCqsCE2EpMa0qVGINmEig5VZhXBNTlK9gsZMSyVje9X7d2rns9em5+fe+mPmDCcwkOwJ+cswXTrPqS/Roxy3p4NI3pt12q/X64P0CNlEsR+yrHqn8SA5rn1OQFCRKmbj5MhWCDhwduLkyprcOlu9o8A9xRNpOZqsQ05DzURuR1ZB3anfiQJUkVhvyEueXTmMRVecw+1yFxoHkAIsItAIZURv2WMRo0/qQNEm6TqXdWIERyJOAR/MYsshY7GmxrsJTi8VaVR9ycTstD10wd5fg5iGhwoI3LgY2dyMXCLRiDQI0rTX948vauw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 453bb775-f777-41e2-f278-08dee2e49a02
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 02:47:39.7459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fGKf0u5J9Ov4YnhFgXXqyf4o0nkrqdNY+NR+tidQa1CmBjU/NQCW9XsnBxDc+CP2Yq/nRKqKM3PICXDYePNPFA==
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

> Subject: [PATCH 3/6] drm/i915/dp: Enable SST fallback between UHBR and no=
n-
> UHBR rates
>=20
> Enable link training fallback between UHBR and non-UHBR link rates on DP =
SST
> links. This was disabled so far to preserve the fallback behavior.
> There isn't a known issue related to such a fallback and DP MST has been =
using
> this for a while already. Also, enabling UHBR rates over Thunderbolt tunn=
els in
> a follow-up change, which at least on some links supports only 4 lanes an=
d not 1
> or 2 lanes on UHBR, makes a
> UHBR->non-UHBR fallback scenario more likely.
>=20
> At the same time align the corresponding link training fallback kunit tes=
t,
> allowing a UHBR <-> non-UHBR fallback there as well.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  .../gpu/drm/i915/display/intel_dp_link_training.c |  5 -----
>  .../drm/i915/display/tests/intel_dp_link_test.c   | 15 +++------------
>  2 files changed, 3 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index fa55664c9d98e..cb92cff906146 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -1874,11 +1874,6 @@ static bool reduce_link_params(struct intel_dp
> *intel_dp, const struct intel_crt
>  			continue;
>  		}
>=20
> -		if (!is_mst &&
> -		    drm_dp_is_uhbr_rate(config.rate) !=3D
> -		    drm_dp_is_uhbr_rate(old_config.rate))
> -			continue;
> -
>  		*new_link_rate =3D config.rate;
>  		*new_lane_count =3D config.lane_count;
>  		new_found =3D true;
> diff --git a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> index e1c356ba11b59..776d93f333851 100644
> --- a/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> +++ b/drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c
> @@ -1199,11 +1199,6 @@ get_fallback_configs_for_output_type(struct kunit
> *test,
>  	}
>  }
>=20
> -static bool output_type_allows_uhbr_fallback(enum intel_output_type
> output_type) -{
> -	return output_type =3D=3D INTEL_OUTPUT_DP_MST;
> -}
> -
>  static void assert_config_is_supported(const struct test_config_table
> *expected_table,
>  				       const struct intel_dp_link_config *config)  {
> @@ -1230,14 +1225,10 @@ static bool get_fallback_config(const struct
> test_config_table *expected_table,
>  		const struct intel_dp_link_config *config =3D
>  			&config_set->entries[i];
>=20
> -		if (output_type_allows_uhbr_fallback(output_type) ||
> -		    (drm_dp_is_uhbr_rate(target_config->rate) =3D=3D
> -		     drm_dp_is_uhbr_rate(config->rate))) {
> -			assert_config_is_supported(expected_table, config);
> -			*fallback_config =3D *config;
> +		assert_config_is_supported(expected_table, config);
> +		*fallback_config =3D *config;
>=20
> -			return true;
> -		}
> +		return true;
>  	}
>=20
>  	return false;
> --
> 2.49.1

