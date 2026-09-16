Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707E6C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB1410EA86;
	Wed, 16 Sep 2026 09:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8WtwTE6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25C910EACE;
 Wed, 16 Sep 2026 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789550180; x=1821086180;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pamoMfM4LbQktz3sTkqdsVJ6Odg0SqdzorDZtylDkAs=;
 b=E8WtwTE6CN1Rkeylg6wYEbM1Q21jMYlxSTe+NjF8Yp7mP0Al3er0lC51
 Xq3vAV/VYLT+aeXjrQ38wkpZ7nWtxT98S1cYbB+dx1Ot0nLDmuYy6qcEM
 tw2UDxCZP/5QV7tIvsQFhMeNaCl6AtNeoJAAjMQQ+bZ5eW7dwcsIGAyMQ
 1Yly5WM0/Y4o0QML1hvBhfEzfivZ2GrgaeJROI3vV5MIVFHmrkQuRVwgp
 N/5XxJ8bRilhzKyCbXE35OsUnj9m9lAWNT3Uz7TZXXRLZX9TI92cCXRYH
 Z0xp78LEMkl7hCbmhDPY5vaP/TCoKGwpvw7MZfnQdaeRdir2RBc/Aa7va w==;
X-CSE-ConnectionGUID: 97j2Wy3USfyMhKSCJRo2Ww==
X-CSE-MsgGUID: Fl6GQ99RQJaZpCwQd7Jubg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100587630"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100587630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:16:19 -0700
X-CSE-ConnectionGUID: 0WJX5h0uTUe+oLbgVrSvvw==
X-CSE-MsgGUID: Q056i0jUQEKRpTWMLGHerg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:16:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:16:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 02:16:18 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.15)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:16:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n08USxLB/t1Z/RcRAozws8o9X2yHvig9MtaDc20V2wAzn8mxuUPEacBVPoK9fRbikIfJISaTEzKcU2G3KbFYMmiDFTYEFfca2BVHByj9LqpTVeBObwrvrGDFoFyac6RLJDrsELkbDzFGJuCEIufEDInI6EajJrL/dA3SRge1jd/3NxmlCVHuM2FZ9S+I6JlyKefIxFgw4UWWuaaoNl9UFzGWU0BEA/Y31av1HbiGPUulEEeQrynWU1K035Kfsp/agG4Pbp793w4NYdn30DOm5BErrGr8L3Vrm4y6jeDCO1bRWOq8n57UUdwcCvTOeBQ6oovcA52jlhNfPt1Lst70xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eoMnRPwjDiPO/BcoCHcdsEO+i4sf1vdDwV0q+eUdxE=;
 b=eL8GPxeOlE5d4hKxz/EGpLTvxgsTGjN3H1VJHkILWGwF7oNr/nRbaMMQRqbAXvhonxlHgyfU7kpvd7y0skBJ8aosglWK/OO9BHi1MiwPWFGW5oyxpmIB0pYtJWnLCiRSdjONIecJNTM+omKEz3JlRJ58zkc3hRblOGEROwl+ZlfxF1OHajF4r69wK17FP3WanYv6plxCxhzvkYBSht07fKWVSMYWuqqed0WSw56YHsQPzfrM8V/cM7DRvmYhl2Yaep44WMqRjAR2uu/HdxryKgAyeC9qCy6EBM8MCr/RwtJAbJMPoLzxl9Df9Zsn9uxZglHYgK+smc/+dSS6KWARiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA4PR11MB9372.namprd11.prod.outlook.com
 (2603:10b6:208:568::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 09:16:13 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 09:16:07 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 02/11] drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte, 
 write_byte, write_data}
Thread-Topic: [PATCH 02/11] drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte, 
 write_byte, write_data}
Thread-Index: AQHdRbWY3IqJU/lq5UWx1SoYrg57p7bQ7DuQ
Date: Wed, 16 Sep 2026 09:16:06 +0000
Message-ID: <DS4PPFE901A304F3439245166797C8A3327E3B92@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <a890746215c6c7a1e36a6bc880ae644dd06f1956.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <a890746215c6c7a1e36a6bc880ae644dd06f1956.1789547331.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA4PR11MB9372:EE_
x-ms-office365-filtering-correlation-id: 9818a1b7-30cd-4c33-98a2-08df13d323d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|10067099003|22082099003|6133799003|18002099003;
x-microsoft-antispam-message-info: q25tzHur+x7+1Jto4QU+fJ0Oe+rodwreXyCNgYQt79KFdYBusWv+fyKo0s0bhAm8Uoe2J095KpLioUr8s5msHOsPVh1Stkt4Zqgc7Pcl4RqZmCzh5Rxzeg/qpGfad+CpI9sg1CuLUIe/NO4KEPYp8ZxZR+IgxDOYX7MxVR9i39k+hZEsRs9ZEOihpL6csua5kryatI/gd5MU+nD6AmE2qVmyJBxPfGUa7/5UmAZZ5WGmd2YSA0ZPcl88I9jp2mQBzAf8iJi5kJJH7YalHxkvDaK3w7fEqnq+5a8zxpjwc/I3viI18NcZqxIlxtRDKmr5pfPIk4aP0RCcNcoWjDzlxYdkZDIRtHgabjcT34kKbYZ6wi54/893iw80icf0fC02i6BjnIRUeofytpBMxvKSMWR3k49r/NmFZ2oNAGilaHgvN1TgkEFKY53an1kfx8cVpgWHYmHULuIf0K5VHleqeCffroFRi8BBj2mnGFIS3+HsKn0owYfVDsbqUKEon4Hz7Ejw+QuBzYMjvH9loh+36DeG6mcNinIUQuEFKysg4XWL3jwxEacuQCjJdQ4FiN6Xvh8V9ErtUlT7nEjrKxSniZACuG+DaOP3H/Ot3JfeMEfgm6AVpY/gFOYEpMB3F3N/ryQcSySM6T6eb8CBAO7fvgaaQeB4FkKnuouobFHpLHizpDT5aBoG5C0e7KRxbefLJ0V/Po/80opFTxWRFg76xEXGuiq7qqPu4cGwvV1XuAY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+pndt/7mKs5NryxTRk4cTZf4IK2onHTzVDqMm5TLx5BJCXO0m3IU/PhsG+ud?=
 =?us-ascii?Q?FD7NQIH9oDJGEkTJb5xXixtxm1YfBnx+hCS9Ogv6m4o9RM3TGUr35bqCW3pA?=
 =?us-ascii?Q?+jFWpQy8VVpkhrEuQy/1g/GxtSl8uJgjsQImqTHElKMHNI3Gg3oz5irYWc2x?=
 =?us-ascii?Q?6sy4cGWqTNW+yRVKDnFdUmcSsGL2fAeVKttNUKBOh74xoZwgJ10YOobZd1he?=
 =?us-ascii?Q?WM5g+wlmzuymhhL+KdLA7yjS1wj4cz6deH3zgHxXlBIrBYYeOZTYipgIOR76?=
 =?us-ascii?Q?7vrJhd/qYlvg4qcGNn3eMO/cSZ5QpNSZq/f9wEKKGWRFucbuWHN8tUL/fUhk?=
 =?us-ascii?Q?e4qVrfk81otBvUjTO0hRCsREiBkZW5fb0NzQqnx8DGqIavINgyNiNTpEO/+k?=
 =?us-ascii?Q?IKM0zfv811g/J9hbUHkos+g82HJMKY6h3o/UnT/O/QmhcZ9g4wPjTSgOnjvO?=
 =?us-ascii?Q?+gKRNtDKmYFzvABahBSxkxFS0GN04TVFZLWIDnax4dKl/8PdMd8msbHHEKVR?=
 =?us-ascii?Q?L4Zfg2rBw3gfOKd2a33a3NkBf0udZ66y0Jfwim2q0eIMnxsXstWNYzEDZEnk?=
 =?us-ascii?Q?T8bZKxHITa7r75vG4q5wENV2nzyMqPvFLgDXgJLvBRLs47Sgjs9CTyL8MPIQ?=
 =?us-ascii?Q?8vjjrOdSOyXekoyfz2LmQz3UbMv3kcLSlUCZujWOnIs42cxl9TGvibuM7sI4?=
 =?us-ascii?Q?5MHbjtoKN9wY89tB1shegKhIlMka2G7bxADVbDW2BGIKQg2QHgsYo+iRJm/u?=
 =?us-ascii?Q?87U9YwmguItXybjiONKBUM1y5Wm7LhXIyhpqMP5wkwEVIXlXVuJTpwQ9ppVG?=
 =?us-ascii?Q?5dJAN40ytJ7nz5VoAyNGvfU4nL2HpRHJQqtI8vpbKLFFWoPh8h0DIetxiu8G?=
 =?us-ascii?Q?prNQU7Noyljs6Mp17lzIJyngZbxbVxwiLe0WfM2Rk+AQAOBKExBMg509r0TA?=
 =?us-ascii?Q?JkYlKlLb2K7NaR/L1OK2osG671scOfnoQj3whksfsBXLMTDkh6tkyE1eZAoD?=
 =?us-ascii?Q?ilmN8vGsTWr/CeNnGe6cxu0teo9lvGUJ5ZcHusTPXhyvcOYKrVGq3LAEZq5D?=
 =?us-ascii?Q?o9rsXQxKSsacs6DFMSUMGZ+TdYKu4v5dysNKRNZgRlj+HrTvyjzT4G1QTuEu?=
 =?us-ascii?Q?rha91E2ngnogJEjqzwc+tU5vOLE9Rabmz33nv17UTygG8Qy6Fd1yLnGyKWbR?=
 =?us-ascii?Q?KZvAMV+F1bPGb8UF6hxj9AhLP6jaAPtwNVUGUKNVwQMYM9cjAqDuWGQ9N6MA?=
 =?us-ascii?Q?acQa/sjYTfWQGunZFPwYjxHWNtlpHHLUI48GJVV6lxcHGD4s/yH31/Vr71RF?=
 =?us-ascii?Q?Q2v7RKOzW5yO3GEFUarn9gYDN/LEra7xQYq0rTESzsmp69BZAYTCz7vS0vRq?=
 =?us-ascii?Q?r/1AjEmj35rlPNVvXmC7bpxlzaC8LPuvbSRj3gTvJvU7O4G0Do1v5tOgI7JO?=
 =?us-ascii?Q?Fka4ZTXJrs6vaoyT/duNjoB50l8CMvhrei2fT1W2MRDBk3okDYerFOO+Z8sN?=
 =?us-ascii?Q?IegXtRtIXDqhElYKrCSvIRiEBcLn9WHlzBV7a6TiNx1qwObpAIVy4AIl81bs?=
 =?us-ascii?Q?skeT4+2Ce+gkoRNEVzlkjwfB2oYHGjPfVUuH8dPuvEXxaS+iS2zjVot820OP?=
 =?us-ascii?Q?9gvHgZZ83e2rhyAUna2rujnLbSArO3mzmZ6VMBnbjtLpbg1gAjwthuq0N+yx?=
 =?us-ascii?Q?WxrmMURgqxpcFsqeS4SDApd//RJzsZvMYqhmBjia/pQEpxYnUd/qs8BLqxip?=
 =?us-ascii?Q?zmQlsmSqAg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: exyvdvRyYM3YR9bYncsIVbqYuRHqtQePt/DEi1SQBqTGvXo2WU1xvyMk1xNQfWboyeOELZQrXta12r/SbfE3vylvN1DRGDw9OzosWD8kmvVL8pQJU79laxkdGsmIRUeH6qGJUsqM5+Zl7TSrnq7EdIo8Lo6MHFtCBcLzRV2akeFf0vKVn+WWATme6phaTtASmuSsgMWuKIGMtZ/oZsen78x6Y2Pj5bbKRWw5Voo4KqTBI+nrCLJnw2xX7gADARbSvZxyk8fKmX52JFv4PlU4ZzF07zszRnT3qOMRsdCxAxEiiKdJYt6yRpSn+Dkunreq49nyzyaqkILK1Lktf8J39g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9818a1b7-30cd-4c33-98a2-08df13d323d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 09:16:06.9646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FI8AzYS/xS8+cxz6eLqM3Nm1+MCAuAFzj3ZfJ4yg/hk4azwH/Awik3MOQZqe6B1YXyhWp8SF+0SqYqICK9yYWg==
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

> Subject: [PATCH 02/11] drm/i915/lspcon: switch to drm_dp_dpcd_{read_byte,
> write_byte, write_data}
>=20
> Switch to the modern DPCD access functions that return negative error cod=
es
> on errors, -EIO for incomplete access, and 0 on success.
>=20
> Use 1-byte accessors where sensible. Use local ret variables for the retu=
rn value
> instead of checking inline.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_lspcon.c | 34 +++++++++------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c
> b/drivers/gpu/drm/i915/display/intel_lspcon.c
> index b306bf5f6130..07b5a9d010ff 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -137,9 +137,7 @@ bool intel_lspcon_detect_hdr_capability(struct
> intel_digital_port *dig_port)
>  	u8 hdr_caps;
>  	int ret;
>=20
> -	ret =3D drm_dp_dpcd_read(&intel_dp->aux, get_hdr_status_reg(lspcon),
> -			       &hdr_caps, 1);
> -
> +	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> +get_hdr_status_reg(lspcon), &hdr_caps);
>  	if (ret < 0) {
>  		drm_dbg_kms(display->drm, "HDR capability detection
> failed\n");
>  		lspcon->hdr_supported =3D false;
> @@ -244,10 +242,11 @@ static bool lspcon_wake_native_aux_ch(struct
> intel_lspcon *lspcon)  {
>  	struct intel_dp *intel_dp =3D lspcon_to_intel_dp(lspcon);
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> +	int ret;
>  	u8 rev;
>=20
> -	if (drm_dp_dpcd_readb(&lspcon_to_intel_dp(lspcon)->aux,
> DP_DPCD_REV,
> -			      &rev) !=3D 1) {
> +	ret =3D drm_dp_dpcd_read_byte(&lspcon_to_intel_dp(lspcon)->aux,
> DP_DPCD_REV, &rev);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm, "Native AUX CH down\n");

I was wondering now that we have ret should we add it in the debug message =
using ERR_PTR()
Same for all the changes done below ?

Regards,
Suraj Kandpal

>  		return false;
>  	}
> @@ -331,15 +330,14 @@ static bool lspcon_parade_fw_ready(struct
> drm_dp_aux *aux)  {
>  	u8 avi_if_ctrl;
>  	u8 retry;
> -	ssize_t ret;
> +	int ret;
>=20
>  	/* Check if LSPCON FW is ready for data */
>  	for (retry =3D 0; retry < 5; retry++) {
>  		if (retry)
>  			usleep_range(200, 300);
>=20
> -		ret =3D drm_dp_dpcd_read(aux, LSPCON_PARADE_AVI_IF_CTRL,
> -				       &avi_if_ctrl, 1);
> +		ret =3D drm_dp_dpcd_read_byte(aux,
> LSPCON_PARADE_AVI_IF_CTRL,
> +&avi_if_ctrl);
>  		if (ret < 0) {
>  			drm_err(aux->drm_dev, "Failed to read AVI IF
> control\n");
>  			return false;
> @@ -371,7 +369,7 @@ static bool
> _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
>=20
>  		reg =3D LSPCON_PARADE_AVI_IF_WRITE_OFFSET;
>  		data =3D avi_buf + block_count * 8;
> -		ret =3D drm_dp_dpcd_write(aux, reg, data, 8);
> +		ret =3D drm_dp_dpcd_write_data(aux, reg, data, 8);
>  		if (ret < 0) {
>  			drm_err(aux->drm_dev, "Failed to write AVI IF block
> %d\n",
>  				block_count);
> @@ -386,7 +384,7 @@ static bool
> _lspcon_parade_write_infoframe_blocks(struct drm_dp_aux *aux,
>  		 */
>  		reg =3D LSPCON_PARADE_AVI_IF_CTRL;
>  		avi_if_ctrl =3D LSPCON_PARADE_AVI_IF_KICKOFF | block_count;
> -		ret =3D drm_dp_dpcd_write(aux, reg, &avi_if_ctrl, 1);
> +		ret =3D drm_dp_dpcd_write_byte(aux, reg, avi_if_ctrl);
>  		if (ret < 0) {
>  			drm_err(aux->drm_dev, "Failed to update (0x%x),
> block %d\n",
>  				reg, block_count);
> @@ -445,8 +443,8 @@ static bool _lspcon_write_avi_infoframe_mca(struct
> drm_dp_aux *aux,
>  	while (written < len) {
>  		/* DPCD write for AVI IF can fail on a slow FW day, so retry */
>  		for (retry =3D 0; retry < 5; retry++) {
> -			ret =3D drm_dp_dpcd_write(aux, reg, (void *)data, 1);
> -			if (ret =3D=3D 1) {
> +			ret =3D drm_dp_dpcd_write_byte(aux, reg, *data);
> +			if (!ret) {
>  				break;
>  			} else if (retry < 4) {
>  				mdelay(50);
> @@ -461,9 +459,8 @@ static bool _lspcon_write_avi_infoframe_mca(struct
> drm_dp_aux *aux,
>  		data++;
>  	}
>=20
> -	val =3D 0;
>  	reg =3D LSPCON_MCA_AVI_IF_CTRL;
> -	ret =3D drm_dp_dpcd_read(aux, reg, &val, 1);
> +	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
>  	if (ret < 0) {
>  		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
>  		return false;
> @@ -473,14 +470,13 @@ static bool _lspcon_write_avi_infoframe_mca(struct
> drm_dp_aux *aux,
>  	val &=3D ~LSPCON_MCA_AVI_IF_HANDLED;
>  	val |=3D LSPCON_MCA_AVI_IF_KICKOFF;
>=20
> -	ret =3D drm_dp_dpcd_write(aux, reg, &val, 1);
> +	ret =3D drm_dp_dpcd_write_byte(aux, reg, val);
>  	if (ret < 0) {
>  		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
>  		return false;
>  	}
>=20
> -	val =3D 0;
> -	ret =3D drm_dp_dpcd_read(aux, reg, &val, 1);
> +	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
>  	if (ret < 0) {
>  		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
>  		return false;
> @@ -617,7 +613,7 @@ static bool
> _lspcon_read_avi_infoframe_enabled_mca(struct drm_dp_aux *aux)
>  	u16 reg =3D LSPCON_MCA_AVI_IF_CTRL;
>  	u8 val;
>=20
> -	ret =3D drm_dp_dpcd_read(aux, reg, &val, 1);
> +	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
>  	if (ret < 0) {
>  		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
>  		return false;
> @@ -632,7 +628,7 @@ static bool
> _lspcon_read_avi_infoframe_enabled_parade(struct drm_dp_aux *aux)
>  	u16 reg =3D LSPCON_PARADE_AVI_IF_CTRL;
>  	u8 val;
>=20
> -	ret =3D drm_dp_dpcd_read(aux, reg, &val, 1);
> +	ret =3D drm_dp_dpcd_read_byte(aux, reg, &val);
>  	if (ret < 0) {
>  		drm_err(aux->drm_dev, "DPCD read failed, address 0x%x\n",
> reg);
>  		return false;
> --
> 2.47.3

