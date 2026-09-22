Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0F4C982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 09:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BA210EC02;
	Tue, 22 Sep 2026 09:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g21wM5Jh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF3010EC02;
 Tue, 22 Sep 2026 08:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790067599; x=1821603599;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VDP0fSZJCysfX2a/i4F82R8tJUEUyXhtTxHUiWLqYmw=;
 b=g21wM5JhF2vi9R9hzAB1IdGIyn1CoPeX/t88XMJWzPDElo0pHVYfTbRZ
 6B984tYNhxi8HcVfDD22i3FE4eU6plJ2Jw0hX/5iOaJUALlGYLhzKMNxJ
 CWL9wvR3+eqE2Uu5X8u45BiwT9nyVpw+HMme41HTBxUpqgeFqOBX7Nycw
 tdzt0EdJHOAHCOGp4r0DLJ1fGCvQVOu8DLkRh5erNjn3C01AwIpkY9EKb
 H7pBaI5wLQS9QxFelEeQh97wW5/cU8qCzFAOxMeLB9pZN11b2VedQIX2J
 wFmosdfr45hJmMf4VXpmnNcl2OipG+wILsr3Ru3wADzPAcjQDM0I2svH1 w==;
X-CSE-ConnectionGUID: oBInEQ8pQx+PzVcQhAKHGw==
X-CSE-MsgGUID: N3EzPuBnSsGbircEOL7Y7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101313537"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101313537"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:59:38 -0700
X-CSE-ConnectionGUID: zOHbRSNzRSGTbszrVkANXA==
X-CSE-MsgGUID: liensNflROKwcW2ne5dDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="272246115"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:59:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:59:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 01:59:37 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:59:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEkjHO568091DZ6mUyWewnbGB5PddyT5Gzs47oRv7cmA7nEw6TB9BwjRxmhQynCMe3kpjW3sjQ23mXE9utdoslhsraO3nQI44hHmVQZCOolPQhvvVKpqpYcqlsdi4sl4mPNuFumuMU18uy4KgiWKfkXtnZtzNFUzLREh3I+KXF9NYhyrojeoGZvJXRftV8jFDiFCnDHB1iG2/mqfUM6Cc/cQX635bE00cr/sj+tJZt2QZ3z2wSG+TSbcS8MzfJ6BYlXA8y1/5qZGuqQA17S9DdDa7GCYh3HkOCRQvASY+uSwzaRvtBkPEu+kqDzqmqcpSP22r/DqFCMAl5Mdn4gUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A86uPSsqdxo84bKaZSEVY2mu6hUN0lK3FzsmnGZzmjI=;
 b=qC3mMIUgYld1c2YW8MufNZzPNbrGInNVZH5VMlisidXP4KhWNtJhyOSkFSRT+hn16pTcdyTYcpAAdBqE0y5xeyC3kd4WL/hgk+UULeGeVhjzlkyuEh6jlRrw5/sD+6C5sketZKBvNa5QdYwzLOAuuPxyXQtVSKZRg9A8id+AnsKstvNtCk1dzlAf19kLf/QuW+0bCyXAiDFlEUGt6UJ/PSO9+kW4lWvAnzpOx9H393XSvH75+qm5zyuxw/s6L/gJ8ncSD3kW7IS8asUDSKCubnFzy3slleaujIqwZrZnL5xFrwQhOYEFP5GrlL6xF/QsSRu0S4qOhBzT8MQS55CWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by DS4PR11MB872716.namprd11.prod.outlook.com (2603:10b6:8:509::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 08:59:35 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 08:59:35 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH 4/8] drm/i915/backlight: log DPCD access errors
Thread-Topic: [PATCH 4/8] drm/i915/backlight: log DPCD access errors
Thread-Index: AQHdSYyV3si3XLVeF0OkSrUi3XlyBbbaTiVQ
Date: Tue, 22 Sep 2026 08:59:35 +0000
Message-ID: <MW4PR11MB688739EBC3D0EB0C88971D2FE3832@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
 <20260921053710.1586776-5-suraj.kandpal@intel.com>
In-Reply-To: <20260921053710.1586776-5-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|DS4PR11MB872716:EE_
x-ms-office365-filtering-correlation-id: 99b005e2-6512-4765-9b76-08df1887d380
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: gtd7RCBoIvjy26QI3Y9mrp4Ddeb6r5Parul4OpQXUo5fBxuJFD8z6kBTmNs2qIAF0ak8acU/4t4e91dqt7UmkaauhQvh0k0X9OJcMyB9Uj0ZPw7nmMHaBNFEuhrKgb5yEPx3pWzkNKIfLVURl3Ac2Gf27Evo1HLTD8i/T+tor/tGPmgA80iYU4hAtnnrIHTG4xZKPnPhaex1BoNLabHaOEM5utrlQ0q80z1OedDf5cUKNcJPbwWXwtNW0HLTrwRZcRStNxsGbdFp/LlEKcGeqnAi9OY+mPkauyHyWhnjiIuoefQMu8aXX7BCBwquDIIBNeFk5ItKcWjMxvem1ZFLoF8q58BBh1Wa6Vl7SWtYUcXcf/fec5CvKVOqtI+MeMuge35UWoGLxItWmjITFevcxotg0l0FDOhu4RPVbe9GZ34LHF1064/9h/tMnINHIJlIVi8FcxuYEHzHxMmUBjuRKQqsnuc/hZjtsnuEUTjlTX1lSTewwJ0gIiZSbRyvlT7yTLPEdUe+qXrrp6DMpMFo81UksKy0cMof0WFLhiVCzkpNKWqWcIW4Nj86wPkbER4I3dWXdauVkRQs6NxVHNACZDeH/qR7ZXFcGaF6dliR10SRMjTtEuUN/iOdJkMKtJNq6tGrHXNRYxUrFKY9PNKB47UVd1c7sSXMnVRmU57sT+yr+E5lEJWhEs4cDe5+chRaOwFw/1o2K39dZ1GWu7LQ/TBuV/yu1MhnDFdc0sIw404=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dHMERmpEKmNfS1g7R/rJwH2yiMQ85rtzSmPqsSED2CRNeCPYu8JvIYqSYXvj?=
 =?us-ascii?Q?9wVNtwqNaU9soHevGZtR1/w21DNrQqSMmo/0idnry03+QpOUrdxgbWVQwt6d?=
 =?us-ascii?Q?VBSRC15crG71Gf/s2ExDLlhZa3vHS97DO+K9J84LnUy2BIWY04JO6N6qLN7Y?=
 =?us-ascii?Q?eO+a+iFv4FYXndBYmzZAxJH54H3SWGYq78pJ8QEYSF3d6WMJPyWN3903SH0d?=
 =?us-ascii?Q?VkZzqJs1GjuJ1JnMM2srwPl2dCcZDqaBwzCpJUMlscsw4ojeWTz8alvvZi7C?=
 =?us-ascii?Q?P4YloArTec5d0QCmJt3jY7nJmAkRokA6xSiJ8nC0/tF297oAS0ay3hzGDqfs?=
 =?us-ascii?Q?AiTfHhvgp4IWC1l4U+lt+9Vk/oLPV5Jq+I2v5pWUqc3f0Ra9kfySzn9TXKFy?=
 =?us-ascii?Q?DQ3E99m17RVbFH1bUPnjaHgMBP8LZWLBrMvyKBP4CH3PAFCdpWSShFIeQWmB?=
 =?us-ascii?Q?cG71SJBGbmBmAerR+LFRwizS4g/ZZ90PmPkwq1Kmpitvlqit+khuvYp+irNE?=
 =?us-ascii?Q?hvIlZH/wrfH7bnaCoQ/LpBsF9R6KDggwjLrjgHFtqcHCD6BaSkKY/ftEgEZ2?=
 =?us-ascii?Q?4Bl2PdgAkttwcysmqZDYyzC2CS5hesxmvLiWP7H8nFjzUpMjaFZTjR8DCq7y?=
 =?us-ascii?Q?8oprz5ru4KihlYM1OWIgXaOd8RdqxcQuTZz0gmLptb4DlKK3cUipRvOqSYHV?=
 =?us-ascii?Q?tcbEYsDP09QExEN3d6vRdIUqH7go1G0GlR/fxLWk0ED12oixlFHDo4fqpXCR?=
 =?us-ascii?Q?7/L/CWXhKR+oN6zeWciQ14bq7MOslaUwImVV1mxrAPLHGxvg8OIXOpW6Sy0Y?=
 =?us-ascii?Q?NuWg4nfQE8Gf4SjHOTIHRg3QtCCNvlkoasT4Z5kUNL+n4ObVR3pwql+dotWR?=
 =?us-ascii?Q?GmN87HPIvXoEG8brZOuqAtEbfzHZHnfsuPCk38aGAP3Psjr+HnQ4CmRRoVhH?=
 =?us-ascii?Q?c7dP+ld6DJtTvKoYS1qo33vsNKrbghR51dTUNT1bl+/EyMKrszzNDbYZ4Joa?=
 =?us-ascii?Q?NeaoRKDVQSvbT8/0wEg2mBhKoW9380pNviwcUM81wxSdhdZOSYO9X6GW4zfu?=
 =?us-ascii?Q?vuUe9pghc10HDZjtSB6xXHyXGUei1qeKJEfa+6ufBw3AONkt47sg9lhaQmNW?=
 =?us-ascii?Q?1u1hcKPCEZMehGe1HnrjtW4a77nv9NHleEsYODrV7GMaFZ5Cg1coQbnUoR+C?=
 =?us-ascii?Q?99SiDFJwM3NobQD+LrJ2p52+wo/83VnDHEsbk1yW6FNX2VpxfdF6vHTCgluR?=
 =?us-ascii?Q?MRqwQMVsgxB1dCXPybZ3CSvzPz/0gktRDKKYHrFuWWTUEMpVYO9ltWzb1RJy?=
 =?us-ascii?Q?x12JLaQLco95SlWLB3PRqV3CuTu0GUflQ9d92V83g4mht1SXl/+9WunxpTUx?=
 =?us-ascii?Q?viv1SE5WhDRk0fzqBcqWIimHGhC5KkPsdoJUa3IKEJ7Ly/R4ko7VswSBS80w?=
 =?us-ascii?Q?GmI9Ur20AFY7S73vaO0DWfTldUIhXOiZGu3Xun/tfxSgtOBipuPmoW8CwXwr?=
 =?us-ascii?Q?tJtWL77OjXDP8qy/Psf/VxFPEOdTgmbFbYByy7VT274nw1B/5oI0RDliuqDW?=
 =?us-ascii?Q?GOaD9Xt8qDa5NRG9C6z5SODwTPoaKLoAsifQhD2n1Kd7Wll0outIZkBQrJ7Q?=
 =?us-ascii?Q?gZF8oWhGWZIr+7lj7SOmobEWqIBWQmtcn76EkfscxhJx+wgarJb/C0Ua3hpw?=
 =?us-ascii?Q?dHiHIeISRRo5YmmpOGr3XMemAn4V2g+PFDRucIzmpVF6dGQn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Xskv7bLI80pvvOsNZp6UTFcJrKC+sVedM7MY1+b4d8crd3K2YR8AE3tGi3J4jMAByNEt2QtPnqINRAUPLYVmNHsn5WWqE1kbdVZ4wougywGDgmFUIoCWiwJxusbaol5xENxoxgWm0yN0tMMrONk7cW7DQa3t976VKoFDyH6pF9eHnBxY+leY+f2oCA+Dxd2aLJWmdwP3/tBO8eDSiccVZmuMfWfvTPU2dvFxbT13+S/vwDqq29n8oSuNd2dYloqKF8nF0Oe4zEAA7vJBiMi12xALSp96uxUiGQWV895dbuNFfZJak8uyzTXmGV9H3FJOfk+ryEWZg3oWy/6isHfNqQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b005e2-6512-4765-9b76-08df1887d380
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 08:59:35.7823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w5d+x9/WK98m7u/yeJZTb41lQ8J2VUYddys48lrgJvu+OHD6uDz+Yhky70Ss6u333wSKQuciIO2WjUgOL7+V/w==
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
> Subject: [PATCH 4/8] drm/i915/backlight: log DPCD access errors
>=20
> Now that the DPCD accessors return a proper error code, include it in the
> error messages using %pe and ERR_PTR(), instead of just stating that the
> access failed.
>=20
> Store the brightness control write result in ret as well, so that it can =
be logged
> the same way.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 29 ++++++++++---------
>  1 file changed, 16 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index f30da5f7e3d2..36aebc32971b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -183,8 +183,8 @@ intel_dp_aux_hdr_get_backlight(struct
> intel_connector *connector, enum pipe pipe
>  	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &tmp);
>  	if (ret < 0) {
>  		drm_err(display->drm,
> -			"[CONNECTOR:%d:%s] Failed to read current backlight
> mode from DPCD\n",
> -			connector->base.base.id, connector->base.name);
> +			"[CONNECTOR:%d:%s] Failed to read current backlight
> mode from DPCD (%pe)\n",
> +			connector->base.base.id, connector->base.name,
> ERR_PTR(ret));
>  		return 0;
>  	}
>=20
> @@ -203,8 +203,8 @@ intel_dp_aux_hdr_get_backlight(struct
> intel_connector *connector, enum pipe pipe
>  				    sizeof(buf));
>  	if (ret < 0) {
>  		drm_err(display->drm,
> -			"[CONNECTOR:%d:%s] Failed to read brightness from
> DPCD\n",
> -			connector->base.base.id, connector->base.name);
> +			"[CONNECTOR:%d:%s] Failed to read brightness from
> DPCD (%pe)\n",
> +			connector->base.base.id, connector->base.name,
> ERR_PTR(ret));
>  		return 0;
>  	}
>=20
> @@ -226,8 +226,8 @@ intel_dp_aux_hdr_set_aux_backlight(const struct
> drm_connector_state *conn_state,
>  	ret =3D drm_dp_dpcd_write_data(&intel_dp->aux,
> INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
>  				     sizeof(buf));
>  	if (ret < 0)
> -		drm_err(dev, "[CONNECTOR:%d:%s] Failed to write brightness
> level to DPCD\n",
> -			connector->base.base.id, connector->base.name);
> +		drm_err(dev, "[CONNECTOR:%d:%s] Failed to write brightness
> level to DPCD (%pe)\n",
> +			connector->base.base.id, connector->base.name,
> ERR_PTR(ret));
>  }
>=20
>  static void
> @@ -341,11 +341,14 @@ intel_dp_aux_hdr_enable_backlight(const struct
> intel_crtc_state *crtc_state,
>=20
>  	intel_dp_aux_fill_hdr_tcon_params(conn_state, &ctrl);
>=20
> -	if (ctrl !=3D old_ctrl &&
> -	    drm_dp_dpcd_write_byte(&intel_dp->aux,
> INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl) < 0)
> -		drm_err(display->drm,
> -			"[CONNECTOR:%d:%s] Failed to configure DPCD
> brightness controls\n",
> -			connector->base.base.id, connector->base.name);
> +	if (ctrl !=3D old_ctrl) {
> +		ret =3D drm_dp_dpcd_write_byte(&intel_dp->aux,
> +
> INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl);
> +		if (ret < 0)
> +			drm_err(display->drm,
> +				"[CONNECTOR:%d:%s] Failed to configure
> DPCD brightness controls (%pe)\n",
> +				connector->base.base.id, connector-
> >base.name, ERR_PTR(ret));
> +	}
>=20
>  	if (intel_dp_in_hdr_mode(conn_state)) {
>  		hdr_metadata =3D conn_state->hdr_output_metadata->data;
> @@ -463,8 +466,8 @@ static u32 intel_dp_aux_vesa_get_backlight(struct
> intel_connector *connector, en
>  					    sizeof(buf));
>  		if (ret < 0) {
>  			drm_err(intel_dp->aux.drm_dev,
> -				"[CONNECTOR:%d:%s] Failed to read
> Luminance from DPCD\n",
> -				connector->base.base.id, connector-
> >base.name);
> +				"[CONNECTOR:%d:%s] Failed to read
> Luminance from DPCD (%pe)\n",
> +				connector->base.base.id, connector-
> >base.name, ERR_PTR(ret));
>  			return 0;
>  		}
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>

> --
> 2.34.1

