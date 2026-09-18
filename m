Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CE1C88E75
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 03:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1927410F158;
	Fri, 18 Sep 2026 03:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPhh+AuR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8D010F157;
 Fri, 18 Sep 2026 03:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789702685; x=1821238685;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1qxI3BPWqYQr1KzcO1kaFVgzwfdFRYq8ENfOxqhWijA=;
 b=OPhh+AuRbfimpW3dJ/gGPVM6rvvHCk8UplJY36vUUSKhYQK0wOQiHbRc
 jPMJYwSKJ64dtEy45xuxFAkcYarz77CW1YOnpbeZRnd/VQj8wQDh6VXVV
 EJr7ntomX18jM6YRvfeuTd8xozHKf05p7wJ0aqPxmPWVxyoRhw8ol0U36
 n3n0wV2baX0Nz3OAzclDeaUezQLD/n2omg4jPGkFn5+dmj3JC0S0DN8F2
 AbFcOHLUYsqit0hn/kKQackRf9HAnAICotD5/LdPhdXELfW8kYVARj4UZ
 btLApQNz7aKINmUpSPefosHIXzrneL8+q8LDTHVzRLAl9zV5WFIn8WXWc Q==;
X-CSE-ConnectionGUID: cWnxv+RcTLaX8Ba7mEJ/+w==
X-CSE-MsgGUID: TrnrVhJ7QAeb0D7bV/7hUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100844048"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100844048"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:38:04 -0700
X-CSE-ConnectionGUID: b5iRvE5YS/edRUY4NiPSmA==
X-CSE-MsgGUID: LNOofcgmQXOLY8jbl+3WaQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:38:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:38:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 20:38:03 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:38:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noITsPFNd/+mCAL8zDYNSnDoJhpppYgirTbb9JUj+9hFp8lGHAuymQBxPMqAcndVl07EBefQWcbKzhsw5c8xqqA0wBbceEi1WxatpXykeK9n6pEv2UuauOAAKfACJ6hPhGGYEYYqDjeYPdRO2sQy7X/gUBRD12TBM+3lrEntVSectsDzDdo+qMrhq4TZz3m1loHsPMrh4nxtz8pJs1x6FzHJSMAxb+HS2LYIGS7jlOMUpd6HChxH5/7w4YWwwZUdFqIyNtmefRza2B3egzSNbzxW3hbw9AACYBf/inS74IfP8isCXcJABAqTtbCXqc2KsWteKuGPDMPW+CkqGXFzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+Jwl3FkDHxUywHlCpbZ9vFJVLHJZQulZYsXj33VdpQ=;
 b=Jb+lGSAKXEROaN4erp+quiP3GNyrZc0m0Z9f/iyZ4jLH7PegteuMA6jBIXYp3mXvGIb/6DGLs4wPNejyOc7CY+RV/Js1+0PHSaa00V8I0SLw7cEg6vnA4sRIjcWjBIQjjcr60VEmKZAQClowt5hE+qpo67cg4wEEqpUbRlZtsJQBLsW9bA7CVRrI3DtORUJtyYqNq3nROEKScZbsX1db63uRKWROfXTNX4Umzwia0iQh16MaKtyN3nE7sRVpuQQHQXXyHlJd9AobgZvLJ1m9inVLt3zpbqSgIFf8ipa57C8KLFyAMYipDoYBJiyzy+CtpI9O5FhIFJd+lTn4j894bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH0PR11MB5109.namprd11.prod.outlook.com
 (2603:10b6:510:3e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 03:38:01 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 03:38:01 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 08/11] drm/i915/dp: switch link training to
 drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()
Thread-Topic: [PATCH 08/11] drm/i915/dp: switch link training to
 drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()
Thread-Index: AQHdRbaJyHSEgNcaCk25oiEbafef8rbTsnpw
Date: Fri, 18 Sep 2026 03:38:01 +0000
Message-ID: <DS4PPFE901A304FBCE89167486155C89EBDE3872@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <c88130676c7b8187a5e5954cdbd36c316950d89f.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <c88130676c7b8187a5e5954cdbd36c316950d89f.1789547331.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH0PR11MB5109:EE_
x-ms-office365-filtering-correlation-id: bcf3106c-b2d0-473f-3b33-08df15363d58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|4143699003|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: Rt+bqDTNo6D563/IrLYk16PkZoK5YT51R5Xmi2S5Q8pG6+i/CfC4QpafIfuCoUY+M7TRKa4L5WtpcnaKPle/us07DNionqLOPJtvGVrCpJ7eAx9+oyvvovhZgyK8D6qw0NKos0fU6anka4DqTCoRQWWowNANlvGFYh8xpEYrpw9UetssyFx6grk+5RZMlONXVgEZNU8IE3PqaF/eScYmOLp+kl457S+mzK9Y8nEA+7CGCaX4LVFuzfKodvQXLlSzfV2jtt90kS8vM5kRBr3wWPpudYdvjGyG3TS7Q77xFURxm/UZncI6e8hVZCLYCZ8uobmivVO8Sv6uXi28/OO6VsOMHGLugSD2pHybH81v8u+tRe22d3C2+Ryd1rqF3NqQN4hkfiCQ2sI4kMXSpTN5NVCH3IxM1tOcodWHD8mjvRqyTGcXe535ejdYRmsD13XeTTgknMtEMiejZmWend2Ou9ZhzVocgarnHoQ1eXlna6sgQ7MNT8Aue6V0eZSYFg7lyVegAKm3ucu1W7KCxhgy9CReDD+gjYJ6cPf5QhFqg5KBwYqN1tEO1bWJ4EaOagiPq5zJF6RDyfS9bXvEQpZJGrx4MVMluZcPhOLr8pvzJjt0GcMxhgxRJRXlCTLCeV2jpVTEEDw57pzqiW2d5RaQyXNi43NvepLrb6q5N5T4WkqgAfJXI3bf9HRxVbutpyddVlmQa4mMMcBCUJZGLKQw5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FFGO0TNL142dsBWY8egik93uP7n0hI21H7gm6BRqvKQZ5k6241epJVB2Q1cp?=
 =?us-ascii?Q?jd83sZB3B7KkvcfU2p7T8+ZM5ofrBMVkjwKTmqtacqlcEJ4s3VW9Opo3uATV?=
 =?us-ascii?Q?DyHbuZXvkEwJvJ2k1ESTPoX/DDPhipFStFMY/bm8plaDzyLc03M6o648n7Zt?=
 =?us-ascii?Q?5LvwOuZYGgFThFAxKjLT81KiOWfiJaJyYxPgQ0kbI8hl8Y5jkRkPsYMkBrtl?=
 =?us-ascii?Q?c5Gs0Ldb+eMD7GIR1rCxSNZuEOBnWIGaT0whDC3fA4l0IlYAe64KWxWmqe8q?=
 =?us-ascii?Q?JG51tk3l4AWWJsC0k17XkD/EOht6UQzi+15PMOgznVT2/zJYzhuqP4vqN8eB?=
 =?us-ascii?Q?9GZS6PkyufVBsTFrzlCUjtfrv1iAtYdYdoEILM4Fneqr/y7Zla5Mgi1EKFdc?=
 =?us-ascii?Q?A8ktA2hQlXampdkZJHqRuSwK+ufg46Whpg4PTJFbUdg6NV1wC9VjSQAPWY9F?=
 =?us-ascii?Q?41pBUqn74V1DvNMNmSaV4pWxEd2GVv9PyaEGJm4BC2B0DzwewRM9KXobhKZ9?=
 =?us-ascii?Q?84TqFKCb988lGxf3Mv4mcc+UzZscGyeJa8AwzgcejB38UX251XXHhdri3MFm?=
 =?us-ascii?Q?fFlbJprs0x2fMx7elgS3BW+7RglqlD0HtXHbfEd/HtTooE1GEso1TYZprGHQ?=
 =?us-ascii?Q?kKDA+I8pKHydq1f2y8KsPVtvcYW4nOM7cSb9uqMtPbBNV91PVyMrPG1mmagl?=
 =?us-ascii?Q?zeXpwgJpX21I69Zelbw4rxnHPirZhAziaa+NVQ7Jq00sJnWHItaSB1WgdyPC?=
 =?us-ascii?Q?InglTX9DiVCx8lHC4+eHcoWS4psCJbb8v1Z4XVqXnMZsKJLvdLY5l1ULUuNC?=
 =?us-ascii?Q?YdxdMInsQjfB7STPOCNUVJU8tfPLyCENZ0IFQDcBGbsYX10xvx2GPcHi1Tv5?=
 =?us-ascii?Q?DTs1h/uAsC+y8pgPPei962Hl12GXr1e0EnWsZuDq1tokawH2V6Un6ABrPTu9?=
 =?us-ascii?Q?KxbIxQy5aatgEwbPqG1Si3HAzLcP8AHZd8F8VUfH67gnauGyxj1O93Fg+tIt?=
 =?us-ascii?Q?Q11KQjYolB78cNsxvc3P3ZC8yAPDc33mKDW7JSLAUWz+ZCuUVytpliNf16zS?=
 =?us-ascii?Q?egWGGthw7nvf4vfFZUfJYSMD5Nk/FPJU7mtpJ3C9fOoxdr1uCmfrHm0wF5fx?=
 =?us-ascii?Q?aVcYKSi+j89CKSwPbi5NUQvrq9pyPDNGSgrL/qsf1GCJ0YMGaonqFeBUUhjp?=
 =?us-ascii?Q?jPIpClUmPisGoYCdkbvpHKpvvpR4h3Jj4Y3M9owlCRe99d1kMFfm3z8xhsnO?=
 =?us-ascii?Q?8+BAwZDSti46caVAgVPDS0HcggKpfGeUSwdG4UwluMAmcu/xRSFhpYrCfbLG?=
 =?us-ascii?Q?kfCoAZc5/EBkO3RnJtivqHwCfRy2wbuQN9/u+lWt4jRpoHbLna91G0unHngk?=
 =?us-ascii?Q?pu3a0fom3nfxJPr0dc1IRX2YBVuuX0bj/Aeo8MnOftLpTAHiPzz3PlxuP1gv?=
 =?us-ascii?Q?CbcpcNVyqZKCBcKRRqo8HeGFAL5FtuEWSuMQ36uLgTFcVCmLyV0NmUqkhEEf?=
 =?us-ascii?Q?7ndr1IBzdi42JTdCo02tUGY+CB2DwpQZ6Pt3UtH4XNO4rZ9vvj4++D6CgTpa?=
 =?us-ascii?Q?9E+iuljV4fnnqq87E5o38gSmqVdE2Xgwxckwg6/hdDV2j8kdPlH+ZQYCqmRS?=
 =?us-ascii?Q?4GkKwws1NAyyw+1DIcPYgHl1h8bUKPDKDD5aexfOdp0RGDX66oW6hIlO7eWb?=
 =?us-ascii?Q?bLZAvYUJGIhpVpJzvM9vQN05AgqDVQ++mx+wdaHZubWN0SYmBUKSCCapPH3v?=
 =?us-ascii?Q?y9Pl9+T7OA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rsmxL/NwkcPFB71tVoFUgcThPlxs44lbrVKFHvWxxobgmsCz5ZHbaweZlIjzwF82/Uvpk8RJAhxetcGmtLzkVEaZ3dXPjdTqNsfM1bGbct7BOJoKi+IqYvGhLacIP/kLgVB+FCKVWPMPn+oIQ35HcZp96101FLoYJ4pxILUmBEeE/2o7E5wmhehdbf3nwHF5wE+XRjY4nGNno9rnT2bhQtHEkZ3cie5z24WhosTU9g0tefkiT+A33KD8QuHzEWY7CkSXqXNfvm3KDEdQLZXW4Id5FvR3I1XoUF47pIXr6ofUm2Z5geENHnOepeL7D0Je8mEMjIV1HdriKuqs8hZxFQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf3106c-b2d0-473f-3b33-08df15363d58
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 03:38:01.0972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C8gNkkOUN/1qrucPUUyME9cK+7MvsspnmQC3KbHZWK5o2pCSGmx2tcC6a14iwQ4TGgpGhPkidbGLGx91vQ/XoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
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

> drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()
>=20
> Switch to the modern DPCD access functions that return negative error cod=
es
> on errors, -EIO for incomplete access, and 0 on success.
>=20
> Use local ret variables for the return value instead of checking inline, =
where
> sensible.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  .../drm/i915/display/intel_dp_link_training.c | 48 ++++++++++---------
>  1 file changed, 26 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index cb92cff90614..6096930fe3a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -929,7 +929,7 @@ intel_dp_set_link_train(struct intel_dp *intel_dp,  {
>  	int reg =3D intel_dp_training_pattern_set_reg(intel_dp, dp_phy);
>  	u8 buf[sizeof(intel_dp->train_set) + 1];
> -	int len;
> +	int ret, len;
>=20
>  	intel_dp_program_link_training_pattern(intel_dp, crtc_state,
>  					       dp_phy, dp_train_pat);
> @@ -939,7 +939,9 @@ intel_dp_set_link_train(struct intel_dp *intel_dp,
>  	memcpy(buf + 1, intel_dp->train_set, crtc_state->lane_count);
>  	len =3D crtc_state->lane_count + 1;
>=20
> -	return drm_dp_dpcd_write(&intel_dp->aux, reg, buf, len) =3D=3D len;
> +	ret =3D drm_dp_dpcd_write_data(&intel_dp->aux, reg, buf, len);
> +
> +	return !ret;
>  }
>=20
>  static char dp_training_pattern_name(u8 train_pat) @@ -1046,10 +1048,10
> @@ intel_dp_update_link_train(struct intel_dp *intel_dp,
>=20
>  	intel_dp_set_signal_levels(intel_dp, crtc_state, dp_phy);
>=20
> -	ret =3D drm_dp_dpcd_write(&intel_dp->aux, reg,
> -				intel_dp->train_set, crtc_state->lane_count);
> +	ret =3D drm_dp_dpcd_write_data(&intel_dp->aux, reg,
> +				     intel_dp->train_set, crtc_state-
> >lane_count);
>=20
> -	return ret =3D=3D crtc_state->lane_count;
> +	return !ret;
>  }
>=20
>  /* 128b/132b */
> @@ -1115,7 +1117,7 @@ void intel_dp_link_training_set_mode(struct intel_d=
p
> *intel_dp, int link_rate,
>  	link_config[0] |=3D pr_with_as_sdp_enable ?
> DP_FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE : 0;
>  	link_config[1] =3D drm_dp_is_uhbr_rate(link_rate) ?
>  			 DP_SET_ANSI_128B132B : DP_SET_ANSI_8B10B;
> -	drm_dp_dpcd_write(&intel_dp->aux, DP_DOWNSPREAD_CTRL,
> link_config, 2);
> +	drm_dp_dpcd_write_data(&intel_dp->aux, DP_DOWNSPREAD_CTRL,
> +link_config, 2);
>  }
>=20
>  static bool
> @@ -1163,8 +1165,8 @@ void intel_dp_link_training_set_bw(struct intel_dp
> *intel_dp,
>  		/* DP and eDP v1.3 and earlier link bw set method. */
>  		u8 link_config[] =3D { link_bw, lane_count };
>=20
> -		drm_dp_dpcd_write(&intel_dp->aux, DP_LINK_BW_SET,
> link_config,
> -				  ARRAY_SIZE(link_config));
> +		drm_dp_dpcd_write_data(&intel_dp->aux, DP_LINK_BW_SET,
> link_config,
> +				       sizeof(link_config));
>  	} else {
>  		/*
>  		 * eDP v1.4 and later link rate set method.
> @@ -1175,8 +1177,8 @@ void intel_dp_link_training_set_bw(struct intel_dp
> *intel_dp,
>  		 * eDP v1.5 sinks allow choosing either, and the last choice
>  		 * shall be active.
>  		 */
> -		drm_dp_dpcd_writeb(&intel_dp->aux, DP_LANE_COUNT_SET,
> lane_count);
> -		drm_dp_dpcd_writeb(&intel_dp->aux, DP_LINK_RATE_SET,
> rate_select);
> +		drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_LANE_COUNT_SET, lane_count);
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_LINK_RATE_SET,
> +rate_select);
>  	}
>  }
>=20
> @@ -1286,8 +1288,8 @@ intel_dp_prepare_link_train(struct intel_dp
> *intel_dp,
>=20
>  		lt_dbg(intel_dp, DP_PHY_DPRX, "Reloading eDP link rates\n");
>=20
> -		drm_dp_dpcd_read(&intel_dp->aux,
> DP_SUPPORTED_LINK_RATES,
> -				 sink_rates, sizeof(sink_rates));
> +		drm_dp_dpcd_read_data(&intel_dp->aux,
> DP_SUPPORTED_LINK_RATES,
> +				      sink_rates, sizeof(sink_rates));
>  	}
>=20
>  	if (link_bw)
> @@ -1612,7 +1614,7 @@ static void intel_dp_stop_post_lt_adj_req(struct
> intel_dp *intel_dp,
>  	if (crtc_state->enhanced_framing)
>  		lane_count |=3D DP_LANE_COUNT_ENHANCED_FRAME_EN;
>=20
> -	drm_dp_dpcd_writeb(&intel_dp->aux, DP_LANE_COUNT_SET,
> lane_count);
> +	drm_dp_dpcd_write_byte(&intel_dp->aux, DP_LANE_COUNT_SET,
> lane_count);
>  }
>=20
>  static bool intel_dp_disable_dpcd_training_pattern(struct intel_dp *inte=
l_dp,
> @@ -1621,7 +1623,7 @@ static bool
> intel_dp_disable_dpcd_training_pattern(struct intel_dp *intel_dp,
>  	int reg =3D intel_dp_training_pattern_set_reg(intel_dp, dp_phy);
>  	u8 val =3D DP_TRAINING_PATTERN_DISABLE;
>=20
> -	return drm_dp_dpcd_write(&intel_dp->aux, reg, &val, 1) =3D=3D 1;
> +	return drm_dp_dpcd_write_byte(&intel_dp->aux, reg, val) =3D=3D 0;
>  }
>=20
>  static int
> @@ -1631,10 +1633,10 @@ intel_dp_128b132b_intra_hop(struct intel_dp
> *intel_dp,
>  	u8 sink_status;
>  	int ret;
>=20
> -	ret =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_SINK_STATUS,
> &sink_status);
> -	if (ret !=3D 1) {
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_SINK_STATUS,
> &sink_status);
> +	if (ret < 0) {
>  		lt_dbg(intel_dp, DP_PHY_DPRX, "Failed to read sink status\n");
> -		return ret < 0 ? ret : -EIO;
> +		return ret;
>  	}
>=20
>  	return sink_status & DP_INTRA_HOP_AUX_REPLY_INDICATION ? 1 : 0;
> @@ -2173,9 +2175,11 @@ intel_dp_128b132b_lane_cds(struct intel_dp
> *intel_dp,  {
>  	u8 link_status[DP_LINK_STATUS_SIZE];
>  	unsigned long deadline;
> +	int ret;
>=20
> -	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_TRAINING_PATTERN_SET,
> -			       DP_TRAINING_PATTERN_2_CDS) !=3D 1) {
> +	ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_TRAINING_PATTERN_SET,
> +				     DP_TRAINING_PATTERN_2_CDS);
> +	if (ret < 0) {
>  		lt_err(intel_dp, DP_PHY_DPRX, "Failed to start 128b/132b TPS2
> CDS\n");
>  		return false;
>  	}
> @@ -2363,9 +2367,9 @@ void intel_dp_128b132b_sdp_crc16(struct intel_dp
> *intel_dp,
>  		return;
>=20
>  	/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
> -	drm_dp_dpcd_writeb(&intel_dp->aux,
> -			   DP_SDP_ERROR_DETECTION_CONFIGURATION,
> -			   DP_SDP_CRC16_128B132B_EN);
> +	drm_dp_dpcd_write_byte(&intel_dp->aux,
> +			       DP_SDP_ERROR_DETECTION_CONFIGURATION,
> +			       DP_SDP_CRC16_128B132B_EN);
>=20
>  	lt_dbg(intel_dp, DP_PHY_DPRX, "DP2.0 SDP CRC16 for 128b/132b
> enabled\n");  }
> --
> 2.47.3

