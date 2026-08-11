Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056F5C5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 06:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0775B10EA74;
	Tue, 11 Aug 2026 06:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKSKcSia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E051010E2C7;
 Tue, 11 Aug 2026 06:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786428071; x=1817964071;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2RDFbjcTpBtuqWu15TFsCVsKMhDy+UUet0IUAJ62gyE=;
 b=jKSKcSia+1J2pepLMPrLRRklGQM2XPUMHmbCFBHtJP3IQnwii/HZswb3
 MCHMVNVhpCKbvkUY2589Sn7Yp+lapuu3kOKWM3GwRnja+WrZzDfP0drd9
 3DZHREE3DuLV5jr/C7YK5zIpwQ2A15ZPQrcr4+DqoJx3wep7hz0rvVfzK
 yggP17XtTt+kxi9AvQQXHgRllSCZdGoufCKErZOXp3YiRMLhOtIBfU0EV
 VTiMLHvnasWFReEJNijn7wdsdY1eKq+SWwC1Ce5hZgQfTuciZqxdz9a7l
 3drvN48bMH/aoKCYMpXIrpRNf2JzhWef2Dt3ve20ujgeDO8j/onj5PbiC w==;
X-CSE-ConnectionGUID: YQfZhtuARvKHO9vnyqyPag==
X-CSE-MsgGUID: zvtkoF5HSF2BlQD8a2C0iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="112497191"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="112497191"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 23:01:10 -0700
X-CSE-ConnectionGUID: csGW2Su+T6iPGvb5Rpnyxg==
X-CSE-MsgGUID: bASCzG1/T36rwvjriRS73A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="268404485"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 23:01:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 23:01:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 23:01:09 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 23:01:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2CjXJ4p5RM11veIY+Lcg3WvlhrccgdpcTsLAZOgAuaPWne5dpn7Gj+44+pX7g0re3ExizquMhiceC4UDuPQythTCYJSOkgsi9c2O+AgYfkA8a35axzxOCkFgeAB/c0GiMsrHT3DSn1NaMfVv826rH/1ucd1I9Otz3sUqeL36vQU0yxJRImmdPbFjW5cmZBW4fyb0W+ZaWCOlv2kkXtaJD9JiT3C/GyKJl5xbHNzyHvGp90nyA1fXzDPCplC2Y1gONGCkGXdor6a/9meJb0fjW/3vY6yc8sVv2qSxyXCH3PqhbiKFyYOgP6ACdOTj2Y2XWLrLpsAl1NxtAeAaLke8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0U+yyT54FZPjYAuvFc4+L4BsKFg1cD5h+l6D+TGaJ6w=;
 b=kpsbFKa48Dd/WYcBvQ+lk9uO21PSa/nUd349ABSrY+b0ns6SBw3ACZwYbjTx+NibLL6QVMtr0Yx5KyWNyJFUz3EaFmzCoyJvuYJJ2i8X850rNvJIdUnUcJg36LG7SbXTS9FFUU1zVMqkGyqNv79OzADett3QEY5Gq4pDtFTyzT1n8BSizzUPiHM7lT/jJCMg9rmt5rmAb49CnY/ly/qmksEu/QEPJIdJlrCR0CtEV+c4Udp/9iDmJ4R6DmMfcxLRT6kPPxeBnT39PTsRN4ABdjokVt3n+wOCiydibxbUQOJ6LeZ4q7VN8PSTJqvcS8foZ6z3X0F3M4X9GifWV8wgCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA3PR11MB9111.namprd11.prod.outlook.com
 (2603:10b6:208:57d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 06:01:03 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:01:03 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>
Subject: RE: [PATCH v2 1/8] drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
Thread-Topic: [PATCH v2 1/8] drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
Thread-Index: AQHdKU44jOgPZKK2MUGcVQeWg4kVULaYWtbg
Date: Tue, 11 Aug 2026 06:01:03 +0000
Message-ID: <DS4PPFE901A304FBB271468A0943D6D59ADE3DD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260811044234.593986-1-ankit.k.nautiyal@intel.com>
 <20260811044234.593986-2-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260811044234.593986-2-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA3PR11MB9111:EE_
x-ms-office365-filtering-correlation-id: e92f5a3c-ff79-4550-6be5-08def76ded4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|3023799007|4143699003|38070700021;
x-microsoft-antispam-message-info: f48j6bWUHI5GDSnQj4AnNv+qIhC7Rv7eedq3y53tMKwCmac9qpBoirOD3kIL1JxeEqWTvybMigad6qPVCrCVfw7NaNiVwN7RIOiNpNrMbiErKRG9BjlwGKRRJfqKA41/hH+0L+yybJ8xI9SjHeS6G6KfkQw5DQqTvd6JdHVL/LN8bJjmgGrjC31ZQ5sKJiddSTHMncCcBRxiXXIYzjX2dLqGGLUX86zBVV2Re8MAfOcmiN8Xvniu1W+S7fCM18SBYYrNUDLnBxfD/zfAMZedCqJhd2xJyMCTThP4J085DVn/o/WlQEUOGC+/3zSQLYssI3N+g7hL0iQHarsZpazWCeotTs2O1TH2JgAOD1ZT5KXap+zZM/TrzyeTZv8xMWRiPsdjlEerLpcZGyDbclf99cKYTBGu7RYxYyiaXptJ+uvnHRTrVB3zzgwa67u1XrmSTz8uENIV18wWKGFmNFrUii7bZJadsyEbjV7LOB3qpN7rW4MdPWpoqn2u/ZXSEn0Slo78ylhpdgrUTtScBjpnqyB+xrwu9wFlIxY00JDAPz1xjSLUHcc8FCnjUg78JfnzIA6QV4vsPyfNBChIjMGlMokHAN5cZ6Xo+0xOllwV45nk05IbLXc56mc39+bN0YBMD+oIpcrGheKTl3wsNYb/r6x2oUbxl6abaBepDBxoyl+DN8LGCtfGKY+to/O2EoyvMUovFSiw/l3CwNKPfdi5G8xUl1SVh5go5lW2RHAAnJI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(3023799007)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GWMiYISAqCysCkcLh0gZYv4FqRFMsrWIg1jqwHMWMm8tzsvQdS+199qq1xm7?=
 =?us-ascii?Q?mxZPhooClOpoc6JI/42JmbuneJSF8zklVQViZB58TLAS11V3FTEEKJQx94Jr?=
 =?us-ascii?Q?SWeaXFHWMaM1/oOw9VtWdz7ktLbMMYwOhuAUtfxDp8BTE5nVkaW+TPS6AaPp?=
 =?us-ascii?Q?CinX85kg0r5ponSwfre96H1AZXSLrwe+XtwhaVS77R9KlcxgZp6pjw1LIIV6?=
 =?us-ascii?Q?N1ftgOVf+xW8EmnG8Chy+oYrvGesVUrRVKmDIauBpzqXn1ILtAfDdau+51Eo?=
 =?us-ascii?Q?mxs60lar6x76hrOkoUbai8v2GhkFd+GZOMQ96jKqR3kvRBYMuAbKF6Fb+O4I?=
 =?us-ascii?Q?wKRRXzpojBV/dnVp6npw0Xm6Ae/53EBFsI0NVoGgCke3+noQRqxAx07X10QT?=
 =?us-ascii?Q?pIcHp3V5mDBpctEUPwnI7jM+u2rHYn/yPkUX2kry5bFOJxavhYeaBTF6qw18?=
 =?us-ascii?Q?MKENTsdR6XEKaaIKncJqreorJ7cRmWLdIvhux1/2QJ7ZJNkAi6E5iLPREHcM?=
 =?us-ascii?Q?mkTf35x1UYpCT/3HQNTvv6q8E9jUlEZrEfJzUKFa9U15x5lZDBUL135zBhx0?=
 =?us-ascii?Q?jj0sziQ5jTh4hz6RjJ04e/9/9PWTSjXyjK1ucdzEM/kQTyv5E4omhEZjBHMH?=
 =?us-ascii?Q?IORuzCCu6lQx+g63ZhynHpkAsBEWXb0GlOGWtVgh26UMVpyLjznzC3PqCoo6?=
 =?us-ascii?Q?N5tzzzwCDcoqDlMUtPJ+iDDm3x9DjBmaitClAzdWyM6IX64j4uDq/I+jm1Yg?=
 =?us-ascii?Q?FZiApH6goh9MgblGD9Jc205ylAV3kvsJV3doHs4+5U/QUgaFpI7q/oHTniQM?=
 =?us-ascii?Q?37RZ8TeKOuBos1IUJ0toTK/Dze9b67XnAFJPKz4lmNOA87rR4DynrTDZWb85?=
 =?us-ascii?Q?Vzuz9D+WjhMjHxsYm9/ErA56rUnRForRN5wnj4/o2xCy74M1+XcOoSpDFvxL?=
 =?us-ascii?Q?tHNhgIB5612MRSANarI2QHuxUJaLwsTINmrTjv9eTEAL8oa/2r2oZAfxSRtz?=
 =?us-ascii?Q?orhoRmz+llIgGCqE2BHSFUxzCSgbpyXHRbwFI38SYX2kfRpxkwipy8Qhv9ej?=
 =?us-ascii?Q?IzarE62SUBCwsMq6cq3D5qTjCp+EecnCWL8wvthXYW7Zgec7OrpOLuq7yaVt?=
 =?us-ascii?Q?VDaV4STp0cxX6f3Lp2+y29WLlmx2W5+WAgjlWhL5kI96081iBRvv4HbGuAW9?=
 =?us-ascii?Q?ry+AaKQZqlElFahHhQJF/62hdpzAL0iIru9gupe9+SwQ+XSwcqxoL7oLcRZl?=
 =?us-ascii?Q?q5H+QSrPBl69Xej+ek0E7Y1dFRLxsyc+KLEVMczf3bESQe6yz3TETCe8WO39?=
 =?us-ascii?Q?qcVYnM/+8rslkEk98YquwODoam9iVsn8oHdxHDU8U1szVKBKFF73gB4c1xjV?=
 =?us-ascii?Q?Sl/9WJBSre5oyWnAgB2xYR1eRfdixkX9HecWG7jeNQVsvBO4Gl5WO2Fv8xOm?=
 =?us-ascii?Q?OizdlYyLzRtalepJJRh9uPTj2kz9uWQRLgxZrV/iRupIejmnY8MS99KlxtA9?=
 =?us-ascii?Q?FPsxilU2ZDjS4i5CAW60odLxrWtf7o/8DNDP5WCNN15mleMJGut4g8HtAfGb?=
 =?us-ascii?Q?2GWNH1PQDfmvHtqgzgZKQyiFByQlIvrgg3p/jLe6HHQWNw37ix9eiTAoHhem?=
 =?us-ascii?Q?pmRFSqnCriYPFoutIN5qfKQZbZNTKqA8sYdpp5b7obk5C6e9eVcpRo1MuSwk?=
 =?us-ascii?Q?+g8u1AcngCQ7V7sU7CWhoBNvulDUOLo11gyTx2GePlfqDPPy3RWwWjc9nSMN?=
 =?us-ascii?Q?cAJV1L1spw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: U5iXUVOu6a7wt/jFlRyC+F89LJG6XYR3uHdBARLTvrJ8cBGbMDysvL4pQWq7L+QM8dXRzthQ29D2wfOGSQMyKwbmC8uoEl9G1MEeHCiqgDq8a+2KSaKK0bCnC8KlwgsfNVyuZpc9NBv9LVOPDCHjP9ogGLGii4JWTiAseVpJ9eQOT7xSS3k6sZBNeJiY5IAqFsT1YHBUIw6pmUBMrLfTNNtXGtc6DXtZKXNVS1EW8BJ3OO8WSuUjMTw0TJyfXHUZkQtefPgtADODoRCr+B6olWe5CH1H0MOjh/ScTM6aFHu/xjHVjN/TORMi4UvQifE/041enemJQEiOAiC7UeO+lA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e92f5a3c-ff79-4550-6be5-08def76ded4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 06:01:03.7245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yWWxL2o8RJW4itLzqigSfvcXSi/SKJ1FboaFnvvpg5DPJCHeIGSAgLYQ4uOszg0Tpj1jkvtYGCzWLYzfPBrFdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9111
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

> Subject: [PATCH v2 1/8] drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
>=20
> Split the intel_hdmi_dsc_get_bpp() into two helper functions that can be =
called
> independently.
>=20
> While at it, improve the comments in the helper.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 97 ++++++++++++++---------
>  1 file changed, 59 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 9b637e38a1a5..df88d7c141f7 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3325,61 +3325,49 @@ intel_hdmi_dsc_get_num_slices(const struct
> drm_display_mode *mode,
>  	return target_slices;
>  }
>=20
> -/*
> - * intel_hdmi_dsc_get_bpp - get the appropriate compressed bits_per_pixe=
l
> based on
> - * source and sink capabilities.
> - *
> - * @src_fraction_bpp: fractional bpp supported by the source
> - * @slice_width: dsc slice width supported by the source and sink
> - * @num_slices: num of slices supported by the source and sink
> - * @output_format: video output format
> - * @bpc: bits per color
> - * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
> - * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by sin=
k
> - *
> - * @return: compressed bits_per_pixel in step of 1/16 of bits_per_pixel
> - */
> -int
> -intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_=
slices,
> -		       enum intel_output_format output_format, int bpc,
> -		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
> +static void
> +get_dsc_min_max_bpp(enum intel_output_format output_format, u8 bpc,
> +		    bool hdmi_all_bpp, int *min_dsc_bpp, int *max_dsc_bpp)
>  {
> -	int max_dsc_bpp, min_dsc_bpp;
> -	int target_bytes;
> -	bool bpp_found =3D false;
> -	int bpp_decrement_x16;
> -	int bpp_target;
> -	int bpp_target_x16;
> -
>  	/*
> -	 * Get min bpp and max bpp as per Table 7.23, in HDMI2.1 spec
> +	 * Get min bpp and max bpp that can be supported for a
> +	 * given bpc and output format.
>  	 * Start with the max bpp and keep on decrementing with
> -	 * fractional bpp, if supported by PCON DSC encoder
> +	 * fractional bpp, if supported by the DSC encoder
>  	 *
>  	 * for each bpp we check if no of bytes can be supported by HDMI sink
>  	 */
>=20
>  	if (output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420) {
> -		min_dsc_bpp =3D 6;
> -		max_dsc_bpp =3D 3 * bpc / 2;
> +		*min_dsc_bpp =3D 6;
> +		*max_dsc_bpp =3D 3 * bpc / 2;
>  	} else if (output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR444 ||
>  		   output_format =3D=3D INTEL_OUTPUT_FORMAT_RGB) {
> -		min_dsc_bpp =3D 8;
> -		max_dsc_bpp =3D 3 * bpc;
> +		*min_dsc_bpp =3D 8;
> +		*max_dsc_bpp =3D 3 * bpc;
>  	} else {
>  		/* Assuming 4:2:2 encoding */
> -		min_dsc_bpp =3D 7;
> -		max_dsc_bpp =3D 2 * bpc;
> +		*min_dsc_bpp =3D 7;
> +		*max_dsc_bpp =3D 2 * bpc;
>  	}
>=20
>  	/*
> -	 * Taking into account if all dsc_all_bpp supported by HDMI2.1 sink
> -	 * Section 7.7.34 : Source shall not enable compressed Video
> -	 * Transport with bpp_target settings above 12 bpp unless
> -	 * DSC_all_bpp is set to 1.
> +	 * Don't enable DSC bpp_target settings above 12 bpp,
> +	 * unless DSC_all_bpp is set to 1.
>  	 */
>  	if (!hdmi_all_bpp)
> -		max_dsc_bpp =3D min(max_dsc_bpp, 12);
> +		*max_dsc_bpp =3D min(*max_dsc_bpp, 12); }
> +
> +static int
> +get_dsc_compressed_bpp(int num_slices, int slice_width, int
> hdmi_max_chunk_bytes,
> +		       int src_fractional_bpp, int min_dsc_bpp, int max_dsc_bpp)
> {
> +	int target_bytes;
> +	bool bpp_found =3D false;
> +	int bpp_decrement_x16;
> +	int bpp_target;
> +	int bpp_target_x16;
>=20
>  	/*
>  	 * The Sink has a limit of compressed data in bytes for a scanline, @@ =
-
> 3423,6 +3411,39 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int
> slice_width, int num_slices,
>  	return 0;
>  }
>=20
> +/*
> + * intel_hdmi_dsc_get_bpp - get the appropriate compressed
> +bits_per_pixel based on
> + * source and sink capabilities.
> + *
> + * @src_fraction_bpp: fractional bpp supported by the source
> + * @slice_width: dsc slice width supported by the source and sink
> + * @num_slices: num of slices supported by the source and sink
> + * @output_format: video output format
> + * @bpc: bits per color
> + * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
> + * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by
> +sink
> + *
> + * @return: compressed bits_per_pixel in step of 1/16 of bits_per_pixel
> +*/ int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
> +int num_slices,
> +		       enum intel_output_format output_format, int bpc,
> +		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes) {
> +	int max_dsc_bpp, min_dsc_bpp;
> +	int dsc_bpp_x16;
> +
> +	get_dsc_min_max_bpp(output_format, bpc, hdmi_all_bpp,
> +			    &min_dsc_bpp, &max_dsc_bpp);
> +
> +	dsc_bpp_x16 =3D get_dsc_compressed_bpp(num_slices, slice_width,
> +					     hdmi_max_chunk_bytes,
> +					     src_fractional_bpp,
> +					     min_dsc_bpp, max_dsc_bpp);
> +
> +	return dsc_bpp_x16;
> +}
> +
>  int intel_hdmi_sink_max_frl_rate(struct drm_connector *connector)  {
>  	int max_lanes =3D connector->display_info.hdmi.max_lanes;
> --
> 2.50.1

