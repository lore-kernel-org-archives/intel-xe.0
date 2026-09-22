Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549B4C982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 08:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E69510EC02;
	Tue, 22 Sep 2026 08:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzK+46ua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A172C10EC02;
 Tue, 22 Sep 2026 08:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790067486; x=1821603486;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ogUS+iyWRlAnYwBQpgKUqe4ltxWd1JbEGrwJLtXQxm0=;
 b=JzK+46ualnQ24dIXnn29ySlhrESf2X8YDSI3/Dj+rSSz2ORqOR14IB0I
 tTZwBEfR8YvNd1bQzgiTQzd38S2z68pd+WtEtzWcaZ/v3ifFU6iG7eaMk
 vhe9ALjHk5ncRMsFy6VsbrSKFvuSjYAkqW7MkhXZSm4gBljZoCsukrPG+
 s1GaVPG39EI/sim/rAlfBgBcW34QcP/W+3oBsN3FILF/UKaFjUbJrLCtC
 Vbqnoh6Q8xlYzHGv29idUDKGcca/jKpywGStlEqvDwe4qtn0toY6k+bDZ
 KhdV+8O9TvewOPPQ2D36D6UvF0LSmJVnRwOx6d3vWrz97BVzcyW9PPTS4 w==;
X-CSE-ConnectionGUID: i7mQoO00T0+4kfQsmt1kxA==
X-CSE-MsgGUID: j1JZDzRGTymMwf/UhPMQGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101313239"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101313239"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:58:06 -0700
X-CSE-ConnectionGUID: c6+ATD+PRaydhU6chxOphg==
X-CSE-MsgGUID: csZQmfjvRniBYCgqwM74xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="272245794"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:58:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:58:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 01:58:05 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:58:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4SICaTKYpZapGmhVhAVvB76SwuLCP1uRy/0VVnXToNVZNISAZiVgLAagNertbBV0vU0dMMf/zupFZc+0AN9iBqIKlNyvbVLaVjBEFIlqPKMU6tZ70VNxliyYMGCUWVhuSRbdJgMEDD8kvSvXO3pQdfX9hxme+e/VjWBn9cHt4dFyG/lm8IEB4LBzxCnQRD5MZQrZA4clRPA7dzD1lRs2dSVe6GGxBGzRME+XsH58jROG4oCfBxueK54tZt1OGu/1eNIrdKUKrUTn6DNnpAbpCPXVryeu+xBgPD1p5BAe3XwryEjw181ll0ev+1Fqwbxum+4PQ9cu8sDZW3jhC0mXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pasI9AqNQ+i1YKbB3YVxgjwh3pDMYdrkbVeHh1Genyk=;
 b=fuPbQabHZQte9VbX5rgksBtQbbOuhfxBCOAUuTva4NCufU6YtZFsiTDjhV3QHCU8UvqRZAw16VrI/VXPAb7DilZ9uxJWqlH4XVdQAZwwq3GbcHYmDM+/fBRp9XpAlO9IIlnaPb67AKnVP1gj6t9Y5hE3M3CW+UYNxy9ijE3ltnoMrv/Gwg6p6vvxKWCykkD2QQhpXiDW2oHk5csmmfhgdHUxTvPkv6LczWEOc6tyhbaju3NaSUZ83nnuXPvUOpUJ6mty95uYkN5p+cVbNWt0ZKOmqiecXIDwTnAO3WrFaLc1GzH4x8/U0qkVSRI5pkSfMv8JgNR5PIcR0kJYY6Feow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by DS4PR11MB872716.namprd11.prod.outlook.com (2603:10b6:8:509::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 08:58:03 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 08:58:03 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH 8/8] drm/i915/psr: log DPCD access errors
Thread-Topic: [PATCH 8/8] drm/i915/psr: log DPCD access errors
Thread-Index: AQHdSYyVj70671QGGEWHVMs6hme2F7baTb1Q
Date: Tue, 22 Sep 2026 08:58:03 +0000
Message-ID: <MW4PR11MB688706E5A7B9AD81E1680F43E3832@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
 <20260921053710.1586776-9-suraj.kandpal@intel.com>
In-Reply-To: <20260921053710.1586776-9-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|DS4PR11MB872716:EE_
x-ms-office365-filtering-correlation-id: 750c1123-c58e-4f93-8682-08df18879c39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: BWhG57WfTIKoqtN7gMiKfK5OH8PKZMp8fLpoatr8YRm+EaGoSnsG1dMgGqwoS/Al568SBKthRuEA5cW/wW0gqZ99fCh+r1oE3CeETHZ4qI4jMu0g/WaeI3nXwQDXCgZgpyLGm4eY14UHYVNVHFlUVojiWbak2ykaSJ7a7taZO5HkAT4jV+FQGV9RPHMQNjMDWZb311gDJHkrY4ZP/uBsEdhaXGYhTK2ypp0DP+XqkxKCh49eip8d1YUtnp/dVPLwDiYkfOPfLPC5Yx8DGpXOUnABaHkAk9tVwJJNhfp084Kl5NBZLilwMnK2oF26Q1NdGLugAzIKNAihkK3dJsvvhsxC+NHDk4DEZLQlTscvyUKsOq9FZ8JIM8ldHbYqklyHlD8MWdQ5TxD1c+eqvuOHZqZQKEBQU/e3ze+NsCmNwiDc7EJpMhbK5c5+KX81ffd4FUBcuvJJlYW5TJx+M9tjaNbqi7f+PU3e324BVNXD4mxjOkZooETseLNzetcDsAv+mX9JDJL/RcIiN0Z9uttHO7R5iNdKKyM0ckXpdn856aRhP+ra/222ubgbtDCJ9nItkoAynqNwyyuAmr43NHrh3ShB9Vfrw66566a/8VmVQt60muJ0jc28tIuRUyS/CKKiC//zijQq+/kmWsYtSfMLw+FfrjRZQKnbNZiISMts0Y3SwA0ixObYbX5t/ij58v4JSlNiIB03SJl+IQfWnBM2beTT13nN7NL6HgDLy/kzL7Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bSxBp+GRzPnTlxIjbrAhV18Lbrl331UmNVDkoDWtIKDMILhR5RSWzaTKd1bo?=
 =?us-ascii?Q?PiVxRF7sEPoA0+UeptZV2775dchczWKlVfkwmzSL/y59GY+McWT014nhoLoi?=
 =?us-ascii?Q?BMewH2Cagzm4JJdzbA0ZqTJdYIgWrTaECepLUtY96fAnmCxUTgKRF+bLUvUD?=
 =?us-ascii?Q?gDk0YNwFUzXEA5OsYxlEsxIMl39qWTs1I0wGmUNh+7VPdAvYxVkmjrtoANeD?=
 =?us-ascii?Q?0bvcwKQB6NzhMYeFbVIMAa+jAwpbpmW2CFiDj36ZTtTw1GQDc1iA2U82jBG0?=
 =?us-ascii?Q?Ni/5BMGqsYyQRxqtTUz/o/YyK+Euy138GOrCh7/VLKd7muwnj3tEiAxfkyPO?=
 =?us-ascii?Q?rXTE/i/4Qty+1L4+QPB941UTQKhWBuijiy4xSjfI+hV4wlFSUJs229wzlzDW?=
 =?us-ascii?Q?Obm6NB4kMz1DHQMX9A4VnzhV5KH5B/yTxFCaG7MJ3u9tPPkUvjp5cRWN8jas?=
 =?us-ascii?Q?Nqm4Hh0kK+jRAGe8N/zw0thsxWMbgENtsZ1vRlMY4e8s8oiWc+MUzQk91ZPs?=
 =?us-ascii?Q?qdgIZN7zSzE08OMBo9FinDnzFGs124NKlGA0N/wLNiZboM5XlpszP/Lmqqig?=
 =?us-ascii?Q?TPCQb3RsbIQy3QSOKF52IUBa/v3quGNj/BJbDtxctwCaO9BPEFgboieLyyJ+?=
 =?us-ascii?Q?Oc38TU7oY/Sflz6rN4dHlSbr7ISp+TSD5HlIB0FTEAuD3KecehrYWf3crbrQ?=
 =?us-ascii?Q?g0xcxsfqjnQfRnkqwqcetWyzeb873utzS5/9LTQO06Q47jjdsv4nFAZlltRP?=
 =?us-ascii?Q?2c8BU+5IkmWLQPnqt+oxZdYiGJ27QmOcWypiD8h8fPQ36Td9rBMrd0NA3V5M?=
 =?us-ascii?Q?TZs60dC+jT1MVnCRbj/T9Tc7EvkLX0j5CbrM2Zxcv4X1AqT63IXwk+oRJ4x6?=
 =?us-ascii?Q?PxktWT6XDcHqkzPZJCCAJkozoRzCwOs0yF6KRAccoFLLBTs8NqtMFAQDUaci?=
 =?us-ascii?Q?kzfI8XKhzCcqL9SMjBAP5lEysl+oD+cqbh4CSj4WmiUNfvGvljCwTp5lynT5?=
 =?us-ascii?Q?4kyZQp3HbEmjPEJSmpG2V5uTOCCObBrn4OQPenPKTVRNLKmBUu2yMNpe5tRG?=
 =?us-ascii?Q?WhrIUfYd1Mmbt2syOfLY5Ba0NZqBACyOS4QdRLG52YvL5e5LH0gxpdqccnHE?=
 =?us-ascii?Q?6RtKaP8ZiIjRuFrSS+AGHgOcbVBDEqjR+d7K41qZ2JM31tgrDWnksMFXMlCW?=
 =?us-ascii?Q?AbLjWJAN8ncJsxysitL5MpVv+1j5gJnCyb8UcyN3pMLtHAhSeHkWTqUZng0b?=
 =?us-ascii?Q?r1lCM93ozSXxCAY3+XGYhPPO1ud8IzN9TtfzUjoXraYE6F1oDhbFAKXoh+VZ?=
 =?us-ascii?Q?mycucYem/AKhE32WRBZa2/Tqj8ovQzCAtw5ViqX8S44NJ0jdZK9P8uORRSeF?=
 =?us-ascii?Q?Oq9uVWWJIlHripUkQF6elrvv9uPAi66JbGNvxsuBleBPtifUNYUqDsXxJ3yI?=
 =?us-ascii?Q?OaWF8sBlm+sLpIo/os5W0RIz7htgG1JpMRGJZ0z4GaWtvysLfwOdspp8giQW?=
 =?us-ascii?Q?sEqjMTQYN8dNIykVVHXNkskoCwcOG76BR57rfr8tw4UIV3+O9WD0lspBNvwQ?=
 =?us-ascii?Q?ujTIOn6scFf9bI1B9BMHhtZ3g3HDAUhdGekbFf05Js2TA26xcIBAgzVqo9U0?=
 =?us-ascii?Q?jcbaYkd3yB297TG7rXjIHiIPAzBTQXpKRl688i+5SS6OCruLKHMgRI4CDaLV?=
 =?us-ascii?Q?q4wOhLoQjzRHKjNQfRVx9NTt7OVon1x1G/P4FZaJmU2K1Ydl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: F+aBFJev11MhYk9P3RToypbFd6iFDd93RGDgqTC+ccYGCvHAPEpl1mpU6yR/3jDKdbaA7oIPJwq2ZZIxNgEGQF7ntyRF/e8Rv6vabxt1hbbtUwrk/pxT31gR/Z+uI2UADAQ3jmPy55iofCHd1+kSU4S95rPelefUXeX9ErrNZTyygZ0hk78XFleCiPtx8Jzn605/EWsEUHzVQVjjj2V8P55agveh6q76Fy13Aqj1FyqywrNNHc2W1S+u5/f/nCZHrMJJoOFwZ5HKfErHqx3gnGFst8ucDRe+8olwC6L36ED8InZc6scgy0e5OAHtRVxtL626QRP8raTvIQ/tBOKyRA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750c1123-c58e-4f93-8682-08df18879c39
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 08:58:03.0404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ec6IEbljAF6yFdB65nw5PXlEiI329X/jIHuxWM4TGy1uPhsQneJVXnik8meGm9AF0a1hd0K8bECzCr7DhszwPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB872716
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Sura=
j
> Kandpal
> Sent: Monday, September 21, 2026 11:07 AM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH 8/8] drm/i915/psr: log DPCD access errors
>=20
> Now that the DPCD accessors return a proper error code, include it in the
> error messages using %pe and ERR_PTR(), instead of just stating that the
> access failed.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_psr.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c
> b/drivers/gpu/drm/i915/display/intel_psr.c
> index f1d48b69a18f..00d0146b2600 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -478,7 +478,8 @@ static u8 intel_dp_get_sink_sync_latency(struct
> intel_dp *intel_dp)
>  		val &=3D DP_MAX_RESYNC_FRAME_COUNT_MASK;
>  	else
>  		drm_dbg_kms(display->drm,
> -			    "Unable to get sink synchronization latency,
> assuming 8 frames\n");
> +			    "Unable to get sink synchronization latency,
> assuming 8 frames (%pe)\n",
> +			    ERR_PTR(ret));
>  	return val;
>  }
>=20
> @@ -504,7 +505,8 @@ static void _psr_compute_su_granularity(struct
> intel_dp *intel_dp,
>  	ret =3D drm_dp_dpcd_read_data(&intel_dp->aux,
> DP_PSR2_SU_X_GRANULARITY, &w, sizeof(w));
>  	if (ret < 0)
>  		drm_dbg_kms(display->drm,
> -			    "Unable to read selective update x granularity\n");
> +			    "Unable to read selective update x granularity
> (%pe)\n",
> +			    ERR_PTR(ret));
>  	/*
>  	 * Spec says that if the value read is 0 the default granularity should
>  	 * be used instead.
> @@ -515,7 +517,8 @@ static void _psr_compute_su_granularity(struct
> intel_dp *intel_dp,
>  	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> DP_PSR2_SU_Y_GRANULARITY, &y);
>  	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
> -			    "Unable to read selective update y granularity\n");
> +			    "Unable to read selective update y granularity
> (%pe)\n",
> +			    ERR_PTR(ret));
>  		y =3D 4;
>  	}
>  	if (y =3D=3D 0)
> @@ -3835,7 +3838,7 @@ static void psr_capability_changed_check(struct
> intel_dp *intel_dp)
>=20
>  	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_PSR_ESI, &val);
>  	if (ret < 0) {
> -		drm_err(display->drm, "Error reading DP_PSR_ESI\n");
> +		drm_err(display->drm, "Error reading DP_PSR_ESI (%pe)\n",
> +ERR_PTR(ret));
>  		return;
>  	}
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
> --
> 2.34.1

