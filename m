Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AF7C982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 14:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF70110E407;
	Tue, 22 Sep 2026 14:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Faxy3lzE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B011A10E407;
 Tue, 22 Sep 2026 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790087891; x=1821623891;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pTY2H6KDb9ZNF5tm9gnNnTVzTEeEQg2E0AKZaJ9XVdk=;
 b=Faxy3lzEJKdq0AqiWVV7whyYruapQ9e4dYY7rtDodGtOEcg4RgdCShRn
 XcNPPHJ9uy91QAcY4vs26Phl207bV3pLc0BKX1puCODJrnGjefBndLoPT
 SqzP6NLl1hZnHNyp7TdqJAXS12yVVqSOqRkbgaRVWz36gyn43GYt53CIc
 LCiBVsRYZYFkQ44qn8GRlfc2ys8DVxh2ugI/7FPukE7tCidrvqspUmWMT
 yfwDRgyGmzY5Ox8t37o663HqAwPQ12hQTGNaAsdcFudGNRclqWjBRD2qc
 CPsIgraCMACHMU7Ub/OoyGa0Jrxi/WjZAV1sVDIYic4t1MESn3Bg2QwGI Q==;
X-CSE-ConnectionGUID: WAYMFqwBTGSBnIdvGdT/hA==
X-CSE-MsgGUID: Jv4NC2FRQI6b83murQdkCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94525247"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="94525247"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 07:38:10 -0700
X-CSE-ConnectionGUID: h9Z+oCwBRw6AY2h2RTiy/A==
X-CSE-MsgGUID: jZIHoDJ1SN+jgqIz3tPE1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="272361201"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 07:38:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 07:38:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 07:38:10 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 07:38:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JH8XTMcgo8NfZb/y7xXYeQoR5i8yHXkVLLm5AzEgG2fVHBsOwkJJQKJvzlr+fFin5+Qm3kqbGE5waVoq1jI/qbvN6GdjuZhqQJvHmuUiCG1tuTw/vreWT5gh4rAkc2nqocdRiDiWT+F0BbtW2NLBfFboyhhj/+KJ7YnuboMo2oiYCcPh3yvVzRVnUDxZr1WdVB4TKCPbERgT/zn4eZqemcfCa0EpT+CRKkkyKkGssBg9ucIlRHNuk7ELmM0Ve+achZrZvhznHMMpCw/06NjfLfsm0cOCJrGDNH4DWefNFtZBAL5PMJkFBehNF37VZ+6J3Jh+SJGRM4fxTQPS/ncptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjMCiL45/7jrBP0UVoPsM5qKg4e0r8TNsH608kPlo8o=;
 b=R9+skaf15yVJR0maOsGJV5jikFtUv+WQMs++Ja+q9imYFl8grAciJ8TOSvHP3xPfBRYxM/BaZ68KXuVPf2nvcO2jRK+mVfDXUNQXDyAxvUUSLjUhJJ3KbnVK1dqeBBrWOXDipioIAk0haqXVCjsXyqdWOnP/spKfSCeYHhhDbfjGAoQqichRtnwm5AMlHggPlF84QVfduTt64q32I0vLX1OPv6Kh8y1k6XzCszWDGYAfEBCliltAxd2yoFX2Zp0TpJcGkcI945tGRUTxBSpZqpi0aPxuv9cMGT9k0+zIVmipH9Xz1Uje6mTSHOj2SFpDA8G1/QZnZDd/Uj+fCtP55Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by SA1PR11MB8489.namprd11.prod.outlook.com (2603:10b6:806:3a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 14:38:04 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%5]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 14:38:04 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH 5/8] drm/i915/dp: log DPCD access errors
Thread-Topic: [PATCH 5/8] drm/i915/dp: log DPCD access errors
Thread-Index: AQHdSYyZUwjuocfgy02V2yOFJ+rZbbbarMSA
Date: Tue, 22 Sep 2026 14:38:04 +0000
Message-ID: <MW4PR11MB688717C740DD1B0432FBCD69E3832@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
 <20260921053710.1586776-6-suraj.kandpal@intel.com>
In-Reply-To: <20260921053710.1586776-6-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|SA1PR11MB8489:EE_
x-ms-office365-filtering-correlation-id: 140dc1e8-06b8-49c9-9038-08df18b71ca4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|6133799003|3023799007|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: jbcSUhSO+NUENkDw4/Y7/G0aHdcsx4OeROKIkUCt+J5sQ8V3gvucUMFYDirV0BSrHxMW4BfcLiKTdpj/HyXKjfSMJduSPNXlEMlvD1Rui07WNaKD+l0Kl4+gfdxomNBvPgW0/y3QgIqempxrJwRVcJKoZ/SngAYcVY4aFTax0HVXD/E7+fs3V4D0bSzw9U26esPMVcYtsAvjCTVQVOk5CnPyLCUIj94okQNWWjQUzhAw8YTazjE2xArq5UT0HGeCKrEYguDVPjYShLhgTxOEcM61pHBQL/8xACv8S5Dsg9uuOHvRKHY4eCJcfAsLNHpfT+fan+tSAtbjx5qPgBL6bl0sn29CZ66iMdUvi/9qe22vNN4ibUAl+hxBIhzmX+JUK7cbYvXfnBMLJBAcRbMlGTJylFIq0DeDxe+GqQwoQ0xqdosVv5tgUhsqFTvqii+PyWcVm0wwMJpJ+8KpzlLcz5ufpX5l9BbgNqUsVQwFSC3tMNGsYAHjYduTLpNloySxZhX5DbD6RWKOfQnpL2CJ1qSUm+KmyGIYucAYY3VQimk2+hQPxvmfnsQT3Nxykq38PUr6Jj72Kcm4ui/bwbNVpLwg0khe+SjAonQBZdizLZIG0AxosSyxXZp9rQ3m6q8bjD1J2rRMkC3Rp0zKTbigGjwmgw173mUKP3bJYShHMCW7fKgA0Mk6Ecz6BjWoUlXhREU1DavdjoyGn3lT9y4ssjo3KuqmBAtR9vyFO0O88Xs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(6133799003)(3023799007)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GXt5d4+AhZGdgrh4frTMyYt/Gu+492AISqMV5w71A05HpWDFq4GYRhdgQbaB?=
 =?us-ascii?Q?7hON34iAwOTeWuz9C04N4gc8GKYBikkIS0e6KtdgUgZdmEMzQzWLADsxTKYM?=
 =?us-ascii?Q?Mcpvaze4vVrsjBj8zRvcCzbqjBsCuZBI243vwLGpm8JBrUn35t9fuqdy2uFW?=
 =?us-ascii?Q?AyALkCuBkg2vvn038GIrYZKTdIA3j5Y9z0+OUmx9oZhHVDZmGcjIHZ0bC6tk?=
 =?us-ascii?Q?2+2aaAmUL4rpUYBAL5NcnRmlhLeMXL2MX1rv3aFxYkjApw12Etwvw4pdOs1T?=
 =?us-ascii?Q?77sJAq3qdG3YoBaV/7Sp7cuUBL+z8/3IyB1mL03VHCxKKZd7azBpRzAAWi+V?=
 =?us-ascii?Q?b/7WIwWcPRii2o8VdOqOeBlwm1w1a7q0x+IHRjdfh6a8v7Kwbyp1jnWTr0iu?=
 =?us-ascii?Q?T9sYCOOM3VYsOqUytwj69DzsybmhOpPtgv9feiCEQJj1wOCfKcAQ68y0uYH3?=
 =?us-ascii?Q?YKGpVlNC6cD+GvgRhTxCzI7UVM+nDulYLAPwznCfq44iA9rOdEscZS0LF6ao?=
 =?us-ascii?Q?3rmbG6GvTDrbBoN+4V3/nV9uvVicfpekxiW7som6UFxGiNPbZCkP8BHU71CE?=
 =?us-ascii?Q?Zk6Bp+ehlZ/cNHLdFIyC+7B2YxOAXCZSb7IncJlgem6o/SYSNMAYRPRaqwDV?=
 =?us-ascii?Q?BFriMk6X0BGnd/nDwgy8VeFKbjGIOotNV+IRF1c77fK6SG3mR4GPGu1TX+e+?=
 =?us-ascii?Q?gDZALSiUxt5mk2yO1Zk+6zRctEaPDZwzFeW7oRjf5PLO6uAkpi5Dge0ilxoh?=
 =?us-ascii?Q?+hgogeyQ8BuWVyH+IAkcqWG5eZwoQjiOfkQYSxRtX0X73yZZKW69i6ip4KgL?=
 =?us-ascii?Q?q5+Fkkf8+5gZx2IQex7Tnux3WCAQhxApVdQR8xzC1CQuf1v7Y/UdpgmyeQOW?=
 =?us-ascii?Q?tRYwhahwqv+mBwOfQMzY6XyVkHY2qIFJ9cQqbGlJVYybLXm3ph6Y7rm0jLef?=
 =?us-ascii?Q?25IkiKKojeM2A5tPKWxJ1zDJhrp0etc/OWDmxvG3IoX9ZKDPiQVjZj/VW2wo?=
 =?us-ascii?Q?CsAlZ/nLndSddoBsIFLoYKLCdVOHwWpw1OYVL5WGE9LP7sBHN4XnVAxpLIWy?=
 =?us-ascii?Q?/gw6Fst6bqH6Ts7/BuYO1+LV8a/Z0FhQfGRcIKytWxVrkvvGF0G2vjUgcZiw?=
 =?us-ascii?Q?+e25M+NTz9O9rtXcKnGKLvXCt+cF/oM1pC/pbQ0w6zHj/xMr4Kxc+0OwhpBu?=
 =?us-ascii?Q?MWllF2lDcuf2bbv/DeSvHcMIkq7MB1BRPvaV6t+KOWNH/jU2sWhBXuOvhopX?=
 =?us-ascii?Q?bWpMvxDv7I+O+McwEVsammdNhKhKaio4Pw6HfkTO53L/gcDHJi6iG7LsSrVL?=
 =?us-ascii?Q?zKEHPku12w71BqH26mpSHabRpscIsZTddhfGDk2bH6hC24Pj3CrulJ4zN3Hk?=
 =?us-ascii?Q?AAoAXyFbKplQYGVJgEg9r9UEj1hR4uFHXH2/w3OK1CJUpi1od3xpoAiEiW6q?=
 =?us-ascii?Q?4eakN1W/pOVbCjl+k/eobmJBWfcZE5kDYu/3hWSZmN+kYRbnHEe738eA5CIz?=
 =?us-ascii?Q?2i/TSeJ3LDBi0ukQlrGs7ekZJRyOmPbikpn95ZWJaZFSwbaZPQrsa6ZCA6rc?=
 =?us-ascii?Q?y6tIliLPmoH5Wc4C8nuKyIMHJa/fZfLu1h30CNj5VrkqBjCizqsNCH+1aOAw?=
 =?us-ascii?Q?UNae4wy2p23DJ+34sIc2FvdK7ezVRGVeFeeeBQ3WtQZ2KG0TDmyPWdUGYIIk?=
 =?us-ascii?Q?msAqh6Zxp7VOd5fxlj0uriiiKwhu5eOERS0lH46ATkSJctyQWHBVgovcMMbs?=
 =?us-ascii?Q?8/+auHG7Wg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2ydNsaKuGLEPIymVs3eBjxR6L4qaTbWPEQSiLDV4BK74974hq6+ZrcxaIQ/cL7bdZuUCpq8aLfcXm1mHt5s0HA6HDYA79gqbDRqYLPSDiCnN28X1HNk9WwvwYHO0ZBTvvrBSo9VPW68LAKgb99eBOEppX3QnRHKTQjdX38c97Tr6aghznPD5xYoukKA4XFzyPyVqnlaqbbBdvRArVzMSoYxLBc2jbpOuCIcN7MGcoa4P1GntL2cPOH6Omc1719TbLz4u3xduekKC96xxHjwqFy371l/BtrrDxyu5MrH4RI9mC2X4VfY2yiUWNErVriXhJh6e2PaBMDJz1hZDSlMnSQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140dc1e8-06b8-49c9-9038-08df18b71ca4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 14:38:04.7957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zb7qgFzs/oirPsmPXGRdLAZq70qp56uPqAxouTdop5JaC5Wyzfstsn2nKM3bB991vuyyI/w/Rajn1amW5ujLPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8489
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
> Subject: [PATCH 5/8] drm/i915/dp: log DPCD access errors
>=20
> Now that the DPCD accessors return a proper error code, include it in the
> error messages using %pe and ERR_PTR(), instead of just stating that the
> access failed.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 31 ++++++++++++++-----------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 89ce6ac7f396..b6982618fcda 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3925,7 +3925,7 @@ intel_dp_init_source_oui(struct intel_dp *intel_dp)
>  	 */
>  	ret =3D drm_dp_dpcd_read_data(&intel_dp->aux, DP_SOURCE_OUI,
> buf, sizeof(buf));
>  	if (ret < 0)
> -		drm_dbg_kms(display->drm, "Failed to read source OUI\n");
> +		drm_dbg_kms(display->drm, "Failed to read source OUI
> (%pe)\n",
> +ERR_PTR(ret));
>=20
>  	if (memcmp(oui, buf, sizeof(oui)) =3D=3D 0) {
>  		/* Assume the OUI was written now. */ @@ -3935,7 +3935,7
> @@ intel_dp_init_source_oui(struct intel_dp *intel_dp)
>=20
>  	ret =3D drm_dp_dpcd_write_data(&intel_dp->aux, DP_SOURCE_OUI,
> oui, sizeof(oui));
>  	if (ret < 0) {
> -		drm_dbg_kms(display->drm, "Failed to write source OUI\n");
> +		drm_dbg_kms(display->drm, "Failed to write source OUI
> (%pe)\n",
> +ERR_PTR(ret));
>  		WRITE_ONCE(intel_dp->oui_valid, false);
>  	}
>=20
> @@ -4002,9 +4002,9 @@ void intel_dp_set_power(struct intel_dp *intel_dp,
> u8 mode)
>=20
>  	if (ret < 0)
>  		drm_dbg_kms(display->drm,
> -			    "[ENCODER:%d:%s] Set power to %s failed\n",
> +			    "[ENCODER:%d:%s] Set power to %s failed
> (%pe)\n",
>  			    encoder->base.base.id, encoder->base.name,
> -			    mode =3D=3D DP_SET_POWER_D0 ? "D0" : "D3");
> +			    mode =3D=3D DP_SET_POWER_D0 ? "D0" : "D3",
> ERR_PTR(ret));
>  }
>=20
>  static bool
> @@ -4104,8 +4104,8 @@ static void intel_dp_get_pcon_dsc_cap(struct
> intel_dp *intel_dp)
>  				    intel_dp->pcon_dsc_dpcd,
>  				    sizeof(intel_dp->pcon_dsc_dpcd));
>  	if (ret < 0)
> -		drm_err(display->drm, "Failed to read DPCD register 0x%x\n",
> -			DP_PCON_DSC_ENCODER);
> +		drm_err(display->drm, "Failed to read DPCD register 0x%x
> (%pe)\n",
> +			DP_PCON_DSC_ENCODER, ERR_PTR(ret));
>=20
>  	drm_dbg_kms(display->drm, "PCON ENCODER DSC DPCD: %*ph\n",
>  		    (int)sizeof(intel_dp->pcon_dsc_dpcd), intel_dp-
> >pcon_dsc_dpcd); @@ -4428,8 +4428,9 @@ void
> intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
>  				     DP_PROTOCOL_CONVERTER_CONTROL_0,
> tmp);
>  	if (ret < 0)
>  		drm_dbg_kms(display->drm,
> -			    "Failed to %s protocol converter HDMI mode\n",
> -
> str_enable_disable(intel_dp_has_hdmi_sink(intel_dp)));
> +			    "Failed to %s protocol converter HDMI mode
> (%pe)\n",
> +
> str_enable_disable(intel_dp_has_hdmi_sink(intel_dp)),
> +			    ERR_PTR(ret));
>=20
>  	if (crtc_state->sink_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420) {
>  		switch (crtc_state->output_format) {
> @@ -4465,16 +4466,17 @@ void
> intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
>  				     DP_PROTOCOL_CONVERTER_CONTROL_1,
> tmp);
>  	if (ret < 0)
>  		drm_dbg_kms(display->drm,
> -			    "Failed to %s protocol converter YCbCr 4:2:0
> conversion mode\n",
> -			    str_enable_disable(intel_dp-
> >dfp.ycbcr_444_to_420));
> +			    "Failed to %s protocol converter YCbCr 4:2:0
> conversion mode (%pe)\n",
> +			    str_enable_disable(intel_dp-
> >dfp.ycbcr_444_to_420),
> +			    ERR_PTR(ret));
>=20
>  	tmp =3D rgb_to_ycbcr ? DP_CONVERSION_BT709_RGB_YCBCR_ENABLE :
> 0;
>=20
>  	ret =3D drm_dp_pcon_convert_rgb_to_ycbcr(&intel_dp->aux, tmp);
>  	if (ret < 0)
>  		drm_dbg_kms(display->drm,
> -			    "Failed to %s protocol converter RGB->YCbCr
> conversion mode\n",
> -			    str_enable_disable(tmp));
> +			    "Failed to %s protocol converter RGB->YCbCr
> conversion mode (%pe)\n",
> +			    str_enable_disable(tmp), ERR_PTR(ret));
>  }
>=20
>  static u8 intel_dp_read_dprx_feature_enum(struct intel_dp *intel_dp) @@ =
-
> 4573,7 +4575,8 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
>  	ret =3D drm_dp_dpcd_read_byte(connector-
> >dp.dsc_decompression_aux, DP_FEC_CAPABILITY,
>  				    &connector->dp.fec_capability);
>  	if (ret < 0) {
> -		drm_dbg_kms(display->drm, "Could not read FEC DPCD
> register\n");
> +		drm_dbg_kms(display->drm, "Could not read FEC DPCD
> register (%pe)\n",
> +			    ERR_PTR(ret));
>  		return;
>  	}
>=20
> @@ -4690,7 +4693,7 @@ static void intel_edp_mso_init(struct intel_dp
> *intel_dp)
>=20
>  	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux,
> DP_EDP_MSO_LINK_CAPABILITIES, &mso);
>  	if (ret < 0) {
> -		drm_err(display->drm, "Failed to read MSO cap\n");
> +		drm_err(display->drm, "Failed to read MSO cap (%pe)\n",
> +ERR_PTR(ret));
>  		return;
>  	}
>=20
LGTM,
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
> --
> 2.34.1

