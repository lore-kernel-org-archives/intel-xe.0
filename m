Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F29FC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7A410E029;
	Wed, 16 Sep 2026 09:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMSqwCJ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF7710E029;
 Wed, 16 Sep 2026 09:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789550253; x=1821086253;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oujoaiScGKudUy6n2MnzB6ILCSad5oYb9BM4dvnZaO8=;
 b=YMSqwCJ+BrCt5NzPggdGGDQzvgSL4/cxe8dWlxVmSiS4Bryi871gYnaG
 sWewx2t7fXewNvMgPTTs/u9fWgX5cmSZDSiJvwTwfZiuVDXS849tEZhzu
 0vBhmRg5UZtdXuPiCkDIYVP93EucDSFpr45TT50JbqlN/UeFlubMNIdZI
 EoE9xeg80iIsviOxy/AOuhK3c6b43b6tdGz5UtO6+zq4Saeb5NUm96mZH
 4r9Gf9AvGFRsPPxn5QmC/6T9zoX/IO+QQgzwCjCZqj5TvzhGVaga9cU5v
 lidN+BO2lDY/QL568J8tqpU8PlKiNqgT98ENA1kAzymZNzeC3co2dSqN5 g==;
X-CSE-ConnectionGUID: uQA0YKpDTxe9EV2mIrZNpA==
X-CSE-MsgGUID: 4xaqy3KYR/6pmQEpGKhKkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100520326"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100520326"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:17:33 -0700
X-CSE-ConnectionGUID: EiY+7UrwRiKyET7CFstyMg==
X-CSE-MsgGUID: 2ylOuS7OQxGYj/y7FrnJfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270008272"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:17:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:17:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 02:17:32 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:17:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKcC2HS6+qOrpn/jiC0lS8bny1hTGPM7I5nf0Ho6rec/CNiKS7NTxk2S8uvW/4iQxT/WJdY/BFwBopIy3a/0XQE+uNE9nGmN4Dz7HacX90w1DkApLOUFJafp2Rl9lW50AV68s2i32fyRrK1L/fs7O7NHllA+c90MBy585jGURs03NLViA8wumFST+3ZMFtGhPTuAJNUtLVGVfxsRzIqvaZGSsnVBM1p/SfkgcKsSMaUc9iWZTMCnABvGqvBQ/TBPqLWbLDAD9TAbAWxGwPn9NiMKXd6VblZvBEVZql+nETJC+momraJ1r0mTOrJ1DdgZuIR+aOdYyWoRswxTwtceWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfII5X5ECs7IhnaKvNENptzx+c69g/MCpL0PEiaKsK0=;
 b=mTsRYZaZH6BgKt5RE1MDx36Shwy17QgWiMmM6w7IhAYSdGXwfxrsayu3mwOR4pOSkXBzL29LMRuy8w3Ar+mNORnMjKTuaToO5BB0o1rkc/ULfqhXFPObJmUBMzD83bf5Kq2eojuIozX6K23BND+lj6LZXY9STno4DEQlLe6v4WiiBx8xK8FZJRTUYO+0q3GuJ/UdaAkQfgwCjMZe0H8bFKs/P0W7Rw8ns4cchl17xG30IQJdwcRxLQCmCs3B4Z2cl6i2Vr6O7RVHBTYmeKBuxiiZAQrDhN4FRIBjPYh2UlkCQgXsthT26MZYefRjiKO84/PCrHIff/N8ljZFVcqndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA4PR11MB9372.namprd11.prod.outlook.com
 (2603:10b6:208:568::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 09:17:27 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 09:17:27 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 03/11] drm/i915/alpm: switch to drm_dp_dpcd_{read_byte,
 write_byte}
Thread-Topic: [PATCH 03/11] drm/i915/alpm: switch to drm_dp_dpcd_{read_byte,
 write_byte}
Thread-Index: AQHdRbWe1jDrIWwAQUu6fA1p7H5td7bQ7LQQ
Date: Wed, 16 Sep 2026 09:17:26 +0000
Message-ID: <DS4PPFE901A304F56B4951E9213E3714AD7E3B92@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <67868fd8a8c8e057ba82c4b142fabae2d0fa52d6.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <67868fd8a8c8e057ba82c4b142fabae2d0fa52d6.1789547331.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA4PR11MB9372:EE_
x-ms-office365-filtering-correlation-id: 4cda5ef7-8f7d-45aa-f94d-08df13d3538f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|10067099003|22082099003|6133799003|18002099003;
x-microsoft-antispam-message-info: GzWZLjaFTj+Vv9Oz6gvZHSaTr2qWI01+Wd1nEKBAupvJmuf+u8SnwN1KldiDIij3blfzYXtB2gttNwRYvYTxeHMGKM63EJwaI50mK4GzeU3iGHvryUmAB0g+ATSgwK+bk1Y5V5ak4EuG50HuzpDOg20466OksxXTtYHyyrXGvsaVHlrhnGyJ9cWj1iE5eTnkQ2676cHrLmJDWsVolm2gnEpKXgHKklEcpZ+8AXQLRJZMaabFuv/A53YcYdHbphKic7FVLtHy41zWxajAPJO4gylkP8qFCUguQ8F54+c6WFjV1pCYlRsgitdPpvaODw9MyBwqWGc4LEp7WExjP7Fl/qS2Ze7k1yGRksH26wkf74RsDu6pXc52MlriIKqo+JHOfaFC+FJ9FbtPzr7uF7+6wendzCZW1MAXSi9TPGDNhcIxUiHqgTCtLKlhlrGtroukXn6hROVBQ6SVHDfRnDBiL6UuT76MptIK7tfMOldEQiZ1QPsre5JcYCActm2DicP7DkPN/8ZN+DLXMBIcoSnJ5gTBu/f+h35ifiOqZ87TL89s3jEC2zD26QXE1q5w89E4cRXHBCFKRsKvSvbtLULrVuMZZ5t3MjtDH+9OczJukqJWE0c4ilpljYmgUzeWZXjHRwfqvplSmX/XBsR8deHyjZRKGRgjS8lWCNfaePym1JTbQsZFKKyMO8x5SRnnIMmXkQ+8Pn+p2oP5P1inOT2MFVPiAvCDHiKanI/g6Yj1e2M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pBuoMeOVrV4qDoNAsODee7tmP8dYKe1RoY+PBsbV2F3QjF4K2fLBt5fw5fFf?=
 =?us-ascii?Q?kSq+gAC4scc5mb68DG3aPeI4S4Mo6+rzLFpZC7HrCIZd0q1agfzRuNzwoWGV?=
 =?us-ascii?Q?DtPIU1JjXdssJy31dFx+X5g9aGsEmXDaGbUZzrZcbJu6z9ZLAI3I1JYgDti9?=
 =?us-ascii?Q?SH0EyfXPmn+nRNAjUTjFaTBmd63RcrZU5Ltuvk1FcnioxFguvBd43B/2LzEt?=
 =?us-ascii?Q?uxQTTwwZjyD3SQ9zAGxxrQpN4o3XkpLM1o4FuUMMy+hGvnlUM+H7UVYobIJm?=
 =?us-ascii?Q?SyUAlcJo6f/UR7UtEOq1Ez9elz7rgqBdmJmBV1XXOHHw69MSzvymkXqZreu0?=
 =?us-ascii?Q?TXCYeONdN8NhBiktPGMFiNxr+jdEYph5o9QFIAc4Z0/4B2MvGUrDfnGY0TQ3?=
 =?us-ascii?Q?LauYzaIWqZZUKEuf5QnKxpyADfgLjNFLZlq7PzuEddhcAp6RIOndTKLKuXh0?=
 =?us-ascii?Q?Z0UCxp4O9pUwzGUzHhwsyerP2WhB+m+wS1PR8WxsBLxqeFR43hGZvGUHxoHD?=
 =?us-ascii?Q?Krt9Lur04kD5ygRMwBLsS9ZuqVVh+Cbwr2aRiZ+MD5qDd9WJP4OOCuLQVBIP?=
 =?us-ascii?Q?1ail8FdbhaYPtlJrddgTBSYiHTOnONK7bQ0ki+kl46GKo0jwbQc8OImaIA0/?=
 =?us-ascii?Q?COFrz4pdBK6ELuyACTKcHrTxiZGr1A6LZyKE/FtX/DWgte2FSFFHtRNIGHkV?=
 =?us-ascii?Q?neLqsUoJLkbU5RguYSoxF1+9DbCiX7YKliYKgCCkELj9a5e3SoI4OcIki78v?=
 =?us-ascii?Q?p5flVWwz1ZE41BvEbTRqu+M3IxaMw5XBElTGNMVYrbD+ws/1Ru47kwuWhiIk?=
 =?us-ascii?Q?zGcw3vZe/gdFui3145UG+bDI3PNJjlI5PxsKh8JvNP+Q8vP8Z/BZWUuyhwsO?=
 =?us-ascii?Q?9UgCx554NNErNaWuUrR3UxClQ80/GnOgMNH61hMk76UYuAuRGK9Ne7YDpc4s?=
 =?us-ascii?Q?+8cX5GUjXO3+7XXad2dYBU19E4KktBGSfERL+0XjYRemow5AwKws8IC4AwCf?=
 =?us-ascii?Q?w+oUzECwyNYZYfejQRryPxAiTP/+maRzyKUjbleQqwkqX1T2dMs0Yod+6pV7?=
 =?us-ascii?Q?thXLwp4ZB7W/WHwVrsiEBSDys46AjHdGUhxcFGsxumupvgIgduBP6+Vj8MDe?=
 =?us-ascii?Q?Map4TScWqyPq8BV74j1vgMFzwi4rCv6tLDtw4vKjVy7urWrAbXlADXC6ErMN?=
 =?us-ascii?Q?ltK6NuI/H93/VWR9OVmEN/WGWyv7w4zlrzO7kRbTRTbiWkam2JGQnJY3mWKq?=
 =?us-ascii?Q?7RXoZZhdeSM6zXxlCJcKp2FsEAtsbXLdIeVVSPr5Msre1jaT3k1hUS4d84Nq?=
 =?us-ascii?Q?8BMgnzfhKEjdihMXtostlNwPCxYp8hiHkaWpkpfexYWYyr3K5HpsZm0OUqvT?=
 =?us-ascii?Q?RlETMryN6oYb9VR2XNoK34zVaDwHEybKpL/Yycn31StMUd0oxD6G0ctvfDxN?=
 =?us-ascii?Q?mLIZPdW0NT8K2wWfn9Nhv1ko9py2rJp0wRO34xZyQkb+xHQglNwcycupCe5v?=
 =?us-ascii?Q?jvCokWutF0TDE0QY9dHjxKI7Vdhz7Igz0ZwUKuGzfcOYSXM1wokE6O9Nzr5T?=
 =?us-ascii?Q?iu2OiUshKNI3TlWVPZ9gGrU6tTz7PfqiDA5TA/uENtNKnY6N2odm9/HCpgDc?=
 =?us-ascii?Q?IEW03lusssq6qjlZxcV9NPVrRgo52I4vJ8wCvJ3ZGphg8k4hO9O0PmisxVXJ?=
 =?us-ascii?Q?vs9Z5Yuyy8yBYjQohX3qUnJmvDEuotWVFYKYNReef5pm3uzTruHvixEZVkXG?=
 =?us-ascii?Q?BTa8v86NwQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Jia0u6zrMbqfdmrwbAU1vltyETSai0d9NzgXRIZr7ND6j+7zRcGG5WFayANwnByWzZOXxsIUNlAsrjLpfAM9888ob3ydZkESlkrz+LCy2p882zu3clqh00O/Y9RUWtR97ZiOu8i/G8QHQcY59z8JrLlOKUvkgh9X1/G5MtRdsuMLkbokb6D725H4TRv75Axvm2Q55WoQhAjhTeEHfL0xr9SePvACJapUKKnTfd4wlnFbmQIiiKxjftNG31mbopS+7aIVr96Qc2b3DdIwSFbQXJdEzdX+tAbuRAqNG/uL0x7I5lW4OMPlYaIagcx263sIZD8MufuIFsOGkAxwQ2w19g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cda5ef7-8f7d-45aa-f94d-08df13d3538f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 09:17:27.0070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dTHffLxxpM1PPRBm6CYAgW0R79bnpZ3EtHEfURRM43i76gbL+ObvyCnxHAmB5BkjSvlg0CJ1FGea3dxGbw3JWA==
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

> Subject: [PATCH 03/11] drm/i915/alpm: switch to drm_dp_dpcd_{read_byte,
> write_byte}
>=20
> Switch to the modern DPCD access functions that return negative error cod=
es
> on errors, -EIO for incomplete access, and 0 on success.
>=20
> Rename an int r to ret while at it for clarity.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c
> b/drivers/gpu/drm/i915/display/intel_alpm.c
> index 10943539bc7c..9ef9d0e45258 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -628,7 +628,7 @@ void intel_alpm_enable_sink(struct intel_dp *intel_dp=
,
>=20
> intel_alpm_aux_less_wake_supported(intel_dp)))
>  		val |=3D DP_ALPM_MODE_AUX_LESS;
>=20
> -	drm_dp_dpcd_writeb(&intel_dp->aux, DP_RECEIVER_ALPM_CONFIG,
> val);
> +	drm_dp_dpcd_write_byte(&intel_dp->aux,
> DP_RECEIVER_ALPM_CONFIG, val);
>  }
>=20
>  void intel_alpm_lobf_enable(const struct intel_crtc_state *new_crtc_stat=
e)
> @@ -751,11 +751,11 @@ bool intel_alpm_get_error(struct intel_dp *intel_dp=
)
> {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
>  	struct drm_dp_aux *aux =3D &intel_dp->aux;
> +	int ret;
>  	u8 val;
> -	int r;
>=20
> -	r =3D drm_dp_dpcd_readb(aux, DP_RECEIVER_ALPM_STATUS, &val);
> -	if (r !=3D 1) {
> +	ret =3D drm_dp_dpcd_read_byte(aux, DP_RECEIVER_ALPM_STATUS,
> &val);
> +	if (ret < 0) {
>  		drm_err(display->drm, "Error reading ALPM status\n");

Should we maybe use ERR_PTR to document error when reading DPCD=20

Regards,
Suraj Kandpal

>  		return true;
>  	}
> @@ -764,7 +764,7 @@ bool intel_alpm_get_error(struct intel_dp *intel_dp)
>  		drm_dbg_kms(display->drm, "ALPM lock timeout error\n");
>=20
>  		/* Clearing error */
> -		drm_dp_dpcd_writeb(aux, DP_RECEIVER_ALPM_STATUS, val);
> +		drm_dp_dpcd_write_byte(aux, DP_RECEIVER_ALPM_STATUS,
> val);
>  		return true;
>  	}
>=20
> --
> 2.47.3

