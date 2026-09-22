Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CD5C982FF
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 12:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DBB10E3B9;
	Tue, 22 Sep 2026 12:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUotCyS7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF3010E3B9;
 Tue, 22 Sep 2026 12:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790078603; x=1821614603;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5Z4Pw1ioz5rXDcX1u4ns1uNUFcezyOAfs3p3B5Lq9PA=;
 b=mUotCyS7l29VrA5tiBrrS1mzfy1j7qgCoYS8rcY5bmZfRlHeILM16OO1
 u3G1iIheakDo+jFv9VmlsrPIdgZm2caJw10+qY0zqZxNKG+PUSSqvqJlh
 xIHkQYkN8cfJBRiYRWK8Ejds/hxXl3QmvqSAYw3CylkSIo9XEkh8nH+C6
 vt3lOX74DXKEGWUYTpGcYSZUHaR9ld3OyASh047y+EdNysUwMHhHYgNLd
 K0pF/em7lOhYwC6tYv+JpKL/GKsxN2dJy4XrwKe8UShLI3e7ntrakzsgF
 UtFr9y12KajsHX05/tm0qzwsq3H6x/FlYwthFGbLhRTmpUIl8eSH06bD8 w==;
X-CSE-ConnectionGUID: H22oaGy0SCqrJoD+u9g7YA==
X-CSE-MsgGUID: OVmx5O4BSqeA+yitI6Yedg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78226659"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="78226659"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 05:03:16 -0700
X-CSE-ConnectionGUID: BD2I7d9vQua4J/ZCDFdFIQ==
X-CSE-MsgGUID: U1L9xapSQuSb+3bd7gJY7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="301028409"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 05:03:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 05:03:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 05:03:15 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 05:03:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1jBp+EMWArLzHx+hh6WsGWJRcPPIuuap8I7dbfG+PJBhXTsOfesUqX5rGt79v8cy1GOCXq9PmbpE2v28vpErjKbWWYF+ugS8Xw9ksI5AukgPNqkySPvBpqXy2Y0nRIG1znZjSiF1/i76DyE04utlOcUMD4CMKLKx7lz61ivgc3t57s01uRmCxTmtmEWWi1jaEtSCmcHjqfdBD//WQ12jr3VGbZ0TUXMmHfeQyPQudN04DuAt1XIvQYryWW9OXTjo0BdU0GjW4uk+D1r5nSEU3Qug7Lq2QKS8fAJhVgEJ2O06flIBDdQDkZGL4iWYhNrk/mYyPessnP9pFLb0/0tIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0r6AJqdoYjcnh7rXY0dh1pGQd/jPi0iy9wib1XJImYI=;
 b=ey4UnTQvg4WocuPzUu8pZk76ys+LMfU6zsJLoZaKmvyr+NHuawlYr5P0vTyiyh5OSPhHzosZiHMQkfnqKwC0bNH5qyhigvdnGoTCJxL7/hyY4dnmwZVDN+jikO8zsflTF4DkVJCUv6+0adnoYLaCUD8zgCQMCXrnrpqZFuKaz6WrlYlcODWKx5zKuMkugrvb1mquzUnlNYlgykPL/c2FBrMGIPzt6hLcISKSEvWKijy1CvyAav2hFVRnov8DZnzRTnS6RDZVxSC18Zo1kL1s0lrkTOr9xaofiwXQRT9pKA3i+PTSs00dQy5jPoJXxhzcnpKjrMR/iHoTJk5HUaPKWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA4PR11MB9229.namprd11.prod.outlook.com
 (2603:10b6:208:563::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 12:03:07 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 12:03:07 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/i915/hdcp: switch to
 drm_dp_dpcd_{read_byte,read_data,write_data}()
Thread-Topic: [PATCH v2] drm/i915/hdcp: switch to
 drm_dp_dpcd_{read_byte,read_data,write_data}()
Thread-Index: AQHdSa1dCpnYUnDkBEaVsnzGSBJu/7bagSDw
Date: Tue, 22 Sep 2026 12:03:07 +0000
Message-ID: <DS4PPFE901A304F108943697D7853999374E3832@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <e168dad72f78fdb74419da94b0a38d732159fc82.1789547331.git.jani.nikula@intel.com>
 <20260921094103.701841-1-jani.nikula@intel.com>
In-Reply-To: <20260921094103.701841-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA4PR11MB9229:EE_
x-ms-office365-filtering-correlation-id: bd8a1d89-e110-406a-92c4-08df18a176e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10070799003|38070700021|5023799004|6133799003|3023799007|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: tDHXR85Jo1pZNmc6aDVb5JDuzc9YUz7hfY6PsLJiW5uI8trbNnMSH6buMb/5eVWw+O3xbxiFypdeIN3GpfPkSqkyBsfXtvJ2UQv2243Lp/a05V0PR2ziCbamuRzm2zJ8MNFGNQe+mQrMniHwZ/yDOSx4OhYm/9TfoXmvx92lOA8gcFnemHphGPtYMvunklWvNA4e3BLaEHu12lcvnrAhkr7x4II+dC6nqFOn8bT9mJ6nU3TSkymYOiJRpijdfhlmrYN4JFi6JHADyyqpX2eMxQcDw/4DdTLmDd2/B+fxPn6OwjsieOzN4g0OPWFoanYXPKu5w+E4X1pk4QkWCvdL4+ODm2Z/xkkDusDQpiKYJYidKtfe76K/JYdvO5rkS1swvMInU6uL15aDnfAQA+W0e2VHkwRi5EzTu8xxHlN6vPAmTfWzgyVNufoDw0dM/kunGCqeWwiH665t4bXmGSUWNRyp9n4tPt7dta1BmcHa7fORDMG3QiIsFtPBC9OUO2mNgXkX4Cjgg/aYpUJ6uxlXDBJF4YyvrjkQOIhgvl1dP/hqFO2n6mkYMZuETgwLFrW0FWKc0Q6Rr3RhFZZxIwPfgJKADF0moKH++LUPsdmd4CyRor2SFivO3FwE8tAhQXt0i5ZbNmT3PUP9J+t9Bil9u3NW+5rSsITq7vB2VeRts4qtQxPymwd94jiev0rNpUI/roUTPoGn5TZ2qm6q9SZLfg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10070799003)(38070700021)(5023799004)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3oSwu0CioTnrqDdnj+tQxY+EZEcmWYW0n4t2GFwCpBgpES/exXj7urpFnBBZ?=
 =?us-ascii?Q?LTykLiTginJOyheRp6xRRyEASAcd1eP+i0xX9zab5L+7cLx1TRIT+Z0zcpr/?=
 =?us-ascii?Q?gcMpijQ+zOz0hlGKUlARM8co36NupAHzcTiyESNCgA14eLhnBxlOBmksTvLz?=
 =?us-ascii?Q?03fY47eusV8U6y6+dVsrGSqpn71e8BhBAsdU9mp+FX3zLSCeS1TU1dnNrAxk?=
 =?us-ascii?Q?r7UZ8Ahu7uP+Qpu3CHJLGUyHukoldQp8a5hPfGzGhcHtYYXRDGtRSwT1SA+H?=
 =?us-ascii?Q?NhFCzTnLdmL2fzkNkTsIvfY/14IGgdXTdMXP4i4N+BuXyg1DGoo9NRkPoIn6?=
 =?us-ascii?Q?GPaIwk0eZq4QXnwi9j8hIVcCupGTliKbEyMeQ0W12gDW37hysBKmLfjb5tq3?=
 =?us-ascii?Q?ZpmbgahUb52RmQNzItP7zwkEUyAS98gn/UoP5cpaaQa0k1bimAZonREzk+Ka?=
 =?us-ascii?Q?XkWW7Mz0GRG8MiYWzrRwQoGGwEA1rdr/DOe4/5lsjhjFx1wwkzr/vL8VFSyt?=
 =?us-ascii?Q?Kwi3IGn5ANSkHhV2fTpjnyE/U45Ra35+pvI6vd23pZ4QCv6S1Z0cjJvuQ3YM?=
 =?us-ascii?Q?mhpocavr3b2MGA2srw8EYRbEU8dKx+YYOMPuUpqceaRmJN4WjoCi9ZFTDFqG?=
 =?us-ascii?Q?D1diolculwJCYt5NqdOeIlSL/cg8ODKlE3+/A3rKa3hantIGKZPVWHEzK3KV?=
 =?us-ascii?Q?qzeolK4hIET7YgBzsE4atiASqHAmthh/NREgZSo2XTm6cnfOAnf+MTTShW8M?=
 =?us-ascii?Q?2Mop6wNvMXAQcPqCscK54hojbvfaIElkFEJ/bHztFORb1eX4jT3SEB5nI4hG?=
 =?us-ascii?Q?99Sr5yndmWzvHp8MfQTKHp0sKgBGWocZac+Z8p5l6Fx9UjOGKpcVpPLjFdjc?=
 =?us-ascii?Q?ngTex220T0B18DugM3MUeaGMDf/NMCaJ+4VWNBrmZfGxX3HBajXQRP8x/wJg?=
 =?us-ascii?Q?uIDr7/IubwdzGomueaQMSrN/p1HQsGGSZHYpRL7yzqQCMfjX5d/PFwRZnKd8?=
 =?us-ascii?Q?mBsjQZ5shQCqtwFuG1QSB48laDoNA9YldrinwCRwyjy4DH6xwYTcveXRkW5X?=
 =?us-ascii?Q?B3vmHIEdk5ePWGdJ/Lh/1vgBi2yqIHpzzs9vWZxOA3GCxGYuesBpT9iO6wKP?=
 =?us-ascii?Q?pRg3JC9YHiLc56HyPCQy6qlNftnpIur6n5/a1DYHX6VXvRVaL5ICRJ7I3npe?=
 =?us-ascii?Q?5h7kWrtq68A2u6MepLK8eHNQCDFF+icOtKkkcFQ5Ug+ppFn3ITHYXTZCOGsC?=
 =?us-ascii?Q?WUZhpafSVY4EjdPJwz3nUk350wJrQNlHSARnsNpugEdihtmO7IS9d5dgyRaJ?=
 =?us-ascii?Q?s+y9f6vsDdJuwyPidHABC+KdiNvj7tx8MFpBzoIyjL6DmUUM0riZD762SDfS?=
 =?us-ascii?Q?L0ZxsnX2m2GVPx92/YHvUmA/y02JSSeaLESJ3J0nTEu/niozs3KW3++D+EEv?=
 =?us-ascii?Q?GF93FS7+KFc+CTw7u+uapnWYNKoaIEKFFvZpUIzW84pEkYeUmrrYHjqAt87w?=
 =?us-ascii?Q?iKf92NvxgxG/pNRGxO0UfRSh5ri8qADPSBjEeUXi5Og5FDXwGS78tduPh8UF?=
 =?us-ascii?Q?O7e/NHFyiByBoXC9FPHGNEggwZdvsZZFIUdZHyqOrDA8pgBH7dEX6BVyWPmS?=
 =?us-ascii?Q?8zMtxGpa0p8rSVmeBG8vakxax01KjqXd46xA44PnfyKHtCbFiz//EA4jb3Dr?=
 =?us-ascii?Q?19b1US4mjc7Vo21y0IX6/bMkgpzG3KfzQlIr5x9OdQzn9JTnUA/WldFgQhNH?=
 =?us-ascii?Q?U1pMt6DvQbP5p/u5weVTq95ukmRhRxe1CG+tRLya6rOSPcaBf76Ln9/a8IHM?=
x-ms-exchange-antispam-messagedata-1: OLxkVFTIvtH03g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iJC7BGkX0G3+h6Iehs3pSafr1SnIGJFjqzpt/EP9ZM+G+3xH+1GZf54l/N96qnuUyOgDLZqfIBxGNQVkMadMedWMhHuTKXkbcVuNRdU019J7NqVCpgR95GheajmUFGB2aGl76vf01+It/h21lkzUSv8Azl0zyjqfUKTKizV+2t2ckKbK7+x7s8sKLEbVmdh641D7wcU/9UTgMFi2r+bI8+w7Sh5gAPGop5rC5VzBztGfZgwGZOxuhdmHaOr0swi19CSOZ6wHYr2tZNUwS5ONVIYEmmWmnk66IuWb5ti8+P4/DyaNbvpqwgvws2d6eURTJNWu+wti8KMCAARKgiQzqA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8a1d89-e110-406a-92c4-08df18a176e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 12:03:07.3277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d7dTyTBpcnCP8Xq2CgYh7+o2IeWqBbfvCfgB4wZMBE3B/264ttgmApGOHmkxERIa+pR3B+kPI1ZCE02qCJSqVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9229
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

> Subject: [PATCH v2] drm/i915/hdcp: switch to
> drm_dp_dpcd_{read_byte,read_data,write_data}()
>=20
> Switch to the modern DPCD access functions that return negative error cod=
es on
> errors, -EIO for incomplete access, and 0 on success.
>=20
> This simplifies error handling all over the place. Convert the error logg=
ing to use
> %pe and ERR_PTR() while at it.
>=20
> Add comments to the read/write places that depend on the functions that r=
eturn
> the number of bytes read/written for incomplete access.
>=20
> v2: return length from get_receiver_id_list_rx_info() (Sashiko)
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>


> ---
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 176 +++++++++----------
>  1 file changed, 88 insertions(+), 88 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index 14ed0ea22dd3..566a921d18a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -60,16 +60,15 @@ int intel_dp_hdcp_write_an_aksv(struct
> intel_digital_port *dig_port,  {
>  	struct intel_display *display =3D to_intel_display(dig_port);
>  	u8 aksv[DRM_HDCP_KSV_LEN] =3D {};
> -	ssize_t dpcd_ret;
> +	int ret;
>=20
>  	/* Output An first, that's easy */
> -	dpcd_ret =3D drm_dp_dpcd_write(&dig_port->dp.aux, DP_AUX_HDCP_AN,
> +	ret =3D drm_dp_dpcd_write_data(&dig_port->dp.aux, DP_AUX_HDCP_AN,
>  				     an, DRM_HDCP_AN_LEN);
> -	if (dpcd_ret !=3D DRM_HDCP_AN_LEN) {
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
> -			    "Failed to write An over DP/AUX (%zd)\n",
> -			    dpcd_ret);
> -		return dpcd_ret >=3D 0 ? -EIO : dpcd_ret;
> +			    "Failed to write An over DP/AUX (%pe)\n",
> ERR_PTR(ret));
> +		return ret;
>  	}
>=20
>  	/*
> @@ -79,14 +78,14 @@ int intel_dp_hdcp_write_an_aksv(struct
> intel_digital_port *dig_port,
>  	 * the destination address which will tickle the hardware to output the
>  	 * Aksv on our behalf after the header is sent.
>  	 */
> -	dpcd_ret =3D drm_dp_dpcd_write(&dig_port->dp.aux,
> DP_AUX_HDCP_AKSV,
> +	ret =3D drm_dp_dpcd_write_data(&dig_port->dp.aux,
> DP_AUX_HDCP_AKSV,
>  				     aksv, DRM_HDCP_KSV_LEN);
> -	if (dpcd_ret !=3D DRM_HDCP_KSV_LEN) {
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
> -			    "Failed to write Aksv over DP/AUX (%zd)\n",
> -			    dpcd_ret);
> -		return dpcd_ret >=3D 0 ? -EIO : dpcd_ret;
> +			    "Failed to write Aksv over DP/AUX (%pe)\n",
> ERR_PTR(ret));
> +		return ret;
>  	}
> +
>  	return 0;
>  }
>=20
> @@ -94,15 +93,16 @@ static int intel_dp_hdcp_read_bksv(struct
> intel_digital_port *dig_port,
>  				   u8 *bksv)
>  {
>  	struct intel_display *display =3D to_intel_display(dig_port);
> -	ssize_t ret;
> +	int ret;
>=20
> -	ret =3D drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BKSV, bksv,
> -			       DRM_HDCP_KSV_LEN);
> -	if (ret !=3D DRM_HDCP_KSV_LEN) {
> +	ret =3D drm_dp_dpcd_read_data(&dig_port->dp.aux,
> DP_AUX_HDCP_BKSV, bksv,
> +				    DRM_HDCP_KSV_LEN);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
> -			    "Read Bksv from DP/AUX failed (%zd)\n", ret);
> -		return ret >=3D 0 ? -EIO : ret;
> +			    "Read Bksv from DP/AUX failed (%pe)\n",
> ERR_PTR(ret));
> +		return ret;
>  	}
> +
>  	return 0;
>  }
>=20
> @@ -110,20 +110,21 @@ static int intel_dp_hdcp_read_bstatus(struct
> intel_digital_port *dig_port,
>  				      u8 *bstatus)
>  {
>  	struct intel_display *display =3D to_intel_display(dig_port);
> -	ssize_t ret;
> +	int ret;
>=20
>  	/*
>  	 * For some reason the HDMI and DP HDCP specs call this register
>  	 * definition by different names. In the HDMI spec, it's called BSTATUS=
,
>  	 * but in DP it's called BINFO.
>  	 */
> -	ret =3D drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BINFO,
> -			       bstatus, DRM_HDCP_BSTATUS_LEN);
> -	if (ret !=3D DRM_HDCP_BSTATUS_LEN) {
> +	ret =3D drm_dp_dpcd_read_data(&dig_port->dp.aux,
> DP_AUX_HDCP_BINFO,
> +				    bstatus, DRM_HDCP_BSTATUS_LEN);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
> -			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
> -		return ret >=3D 0 ? -EIO : ret;
> +			    "Read bstatus from DP/AUX failed (%pe)\n",
> ERR_PTR(ret));
> +		return ret;
>  	}
> +
>  	return 0;
>  }
>=20
> @@ -132,14 +133,13 @@ int intel_dp_hdcp_read_bcaps(struct drm_dp_aux
> *aux,
>  			     struct intel_display *display,
>  			     u8 *bcaps)
>  {
> -	ssize_t ret;
> +	int ret;
>=20
> -	ret =3D drm_dp_dpcd_read(aux, DP_AUX_HDCP_BCAPS,
> -			       bcaps, 1);
> -	if (ret !=3D 1) {
> +	ret =3D drm_dp_dpcd_read_byte(aux, DP_AUX_HDCP_BCAPS, bcaps);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
> -			    "Read bcaps from DP/AUX failed (%zd)\n", ret);
> -		return ret >=3D 0 ? -EIO : ret;
> +			    "Read bcaps from DP/AUX failed (%pe)\n",
> ERR_PTR(ret));
> +		return ret;
>  	}
>=20
>  	return 0;
> @@ -166,16 +166,16 @@ int intel_dp_hdcp_read_ri_prime(struct
> intel_digital_port *dig_port,
>  				u8 *ri_prime)
>  {
>  	struct intel_display *display =3D to_intel_display(dig_port);
> -	ssize_t ret;
> +	int ret;
>=20
> -	ret =3D drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_RI_PRIME,
> -			       ri_prime, DRM_HDCP_RI_LEN);
> -	if (ret !=3D DRM_HDCP_RI_LEN) {
> +	ret =3D drm_dp_dpcd_read_data(&dig_port->dp.aux,
> DP_AUX_HDCP_RI_PRIME,
> +				    ri_prime, DRM_HDCP_RI_LEN);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
> -			    "Read Ri' from DP/AUX failed (%zd)\n",
> -			    ret);
> -		return ret >=3D 0 ? -EIO : ret;
> +			    "Read Ri' from DP/AUX failed (%pe)\n", ERR_PTR(ret));
> +		return ret;
>  	}
> +
>  	return 0;
>  }
>=20
> @@ -184,17 +184,18 @@ int intel_dp_hdcp_read_ksv_ready(struct
> intel_digital_port *dig_port,
>  				 bool *ksv_ready)
>  {
>  	struct intel_display *display =3D to_intel_display(dig_port);
> -	ssize_t ret;
>  	u8 bstatus;
> +	int ret;
>=20
> -	ret =3D drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
> -			       &bstatus, 1);
> -	if (ret !=3D 1) {
> +	ret =3D drm_dp_dpcd_read_byte(&dig_port->dp.aux,
> DP_AUX_HDCP_BSTATUS,
> +				    &bstatus);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
> -			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
> -		return ret >=3D 0 ? -EIO : ret;
> +			    "Read bstatus from DP/AUX failed (%pe)\n",
> ERR_PTR(ret));
> +		return ret;
>  	}
>  	*ksv_ready =3D bstatus & DP_BSTATUS_READY;
> +
>  	return 0;
>  }
>=20
> @@ -203,23 +204,24 @@ int intel_dp_hdcp_read_ksv_fifo(struct
> intel_digital_port *dig_port,
>  				int num_downstream, u8 *ksv_fifo)
>  {
>  	struct intel_display *display =3D to_intel_display(dig_port);
> -	ssize_t ret;
> +	int ret;
>  	int i;
>=20
>  	/* KSV list is read via 15 byte window (3 entries @ 5 bytes each) */
>  	for (i =3D 0; i < num_downstream; i +=3D 3) {
>  		size_t len =3D min(num_downstream - i, 3) *
> DRM_HDCP_KSV_LEN;
> -		ret =3D drm_dp_dpcd_read(&dig_port->dp.aux,
> -				       DP_AUX_HDCP_KSV_FIFO,
> -				       ksv_fifo + i * DRM_HDCP_KSV_LEN,
> -				       len);
> -		if (ret !=3D len) {
> +		ret =3D drm_dp_dpcd_read_data(&dig_port->dp.aux,
> +					    DP_AUX_HDCP_KSV_FIFO,
> +					    ksv_fifo + i * DRM_HDCP_KSV_LEN,
> +					    len);
> +		if (ret < 0) {
>  			drm_dbg_kms(display->drm,
> -				    "Read ksv[%d] from DP/AUX failed (%zd)\n",
> -				    i, ret);
> -			return ret >=3D 0 ? -EIO : ret;
> +				    "Read ksv[%d] from DP/AUX failed (%pe)\n",
> +				    i, ERR_PTR(ret));
> +			return ret;
>  		}
>  	}
> +
>  	return 0;
>  }
>=20
> @@ -228,19 +230,19 @@ int intel_dp_hdcp_read_v_prime_part(struct
> intel_digital_port *dig_port,
>  				    int i, u32 *part)
>  {
>  	struct intel_display *display =3D to_intel_display(dig_port);
> -	ssize_t ret;
> +	int ret;
>=20
>  	if (i >=3D DRM_HDCP_V_PRIME_NUM_PARTS)
>  		return -EINVAL;
>=20
> -	ret =3D drm_dp_dpcd_read(&dig_port->dp.aux,
> -			       DP_AUX_HDCP_V_PRIME(i), part,
> -			       DRM_HDCP_V_PRIME_PART_LEN);
> -	if (ret !=3D DRM_HDCP_V_PRIME_PART_LEN) {
> +	ret =3D drm_dp_dpcd_read_data(&dig_port->dp.aux,
> DP_AUX_HDCP_V_PRIME(i), part,
> +				    DRM_HDCP_V_PRIME_PART_LEN);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
> -			    "Read v'[%d] from DP/AUX failed (%zd)\n", i, ret);
> -		return ret >=3D 0 ? -EIO : ret;
> +			    "Read v'[%d] from DP/AUX failed (%pe)\n", i,
> ERR_PTR(ret));
> +		return ret;
>  	}
> +
>  	return 0;
>  }
>=20
> @@ -258,14 +260,13 @@ bool intel_dp_hdcp_check_link(struct
> intel_digital_port *dig_port,
>  			      struct intel_connector *connector)  {
>  	struct intel_display *display =3D to_intel_display(dig_port);
> -	ssize_t ret;
>  	u8 bstatus;
> +	int ret;
>=20
> -	ret =3D drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
> -			       &bstatus, 1);
> -	if (ret !=3D 1) {
> +	ret =3D drm_dp_dpcd_read_byte(&dig_port->dp.aux,
> DP_AUX_HDCP_BSTATUS, &bstatus);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
> -			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
> +			    "Read bstatus from DP/AUX failed (%pe)\n",
> ERR_PTR(ret));
>  		return false;
>  	}
>=20
> @@ -346,15 +347,14 @@ intel_dp_hdcp2_read_rx_status(struct intel_connecto=
r
> *connector,
>  	struct intel_display *display =3D to_intel_display(connector);
>  	struct intel_digital_port *dig_port =3D intel_attached_dig_port(connect=
or);
>  	struct drm_dp_aux *aux =3D &dig_port->dp.aux;
> -	ssize_t ret;
> +	int ret;
>=20
> -	ret =3D drm_dp_dpcd_read(aux,
> -			       DP_HDCP_2_2_REG_RXSTATUS_OFFSET, rx_status,
> -			       HDCP_2_2_DP_RXSTATUS_LEN);
> -	if (ret !=3D HDCP_2_2_DP_RXSTATUS_LEN) {
> +	ret =3D drm_dp_dpcd_read_data(aux,
> DP_HDCP_2_2_REG_RXSTATUS_OFFSET, rx_status,
> +				    HDCP_2_2_DP_RXSTATUS_LEN);
> +	if (ret < 0) {
>  		drm_dbg_kms(display->drm,
> -			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
> -		return ret >=3D 0 ? -EIO : ret;
> +			    "Read bstatus from DP/AUX failed (%pe)\n",
> ERR_PTR(ret));
> +		return ret;
>  	}
>=20
>  	return 0;
> @@ -474,8 +474,8 @@ int intel_dp_hdcp2_write_msg(struct intel_connector
> *connector,
>  		len =3D bytes_to_write > DP_AUX_MAX_PAYLOAD_BYTES ?
>  				DP_AUX_MAX_PAYLOAD_BYTES :
> bytes_to_write;
>=20
> -		ret =3D drm_dp_dpcd_write(aux,
> -					offset, (void *)byte, len);
> +		/* Note: This may return < len for partial writes. */
> +		ret =3D drm_dp_dpcd_write(aux, offset, byte, len);
>  		if (ret < 0)
>  			return ret;
>=20
> @@ -487,20 +487,20 @@ int intel_dp_hdcp2_write_msg(struct intel_connector
> *connector,
>  	return size;
>  }
>=20
> +/* return number of bytes read on success */
>  static
>  ssize_t get_receiver_id_list_rx_info(struct intel_connector *connector,
>  				     u32 *dev_cnt, u8 *byte)
>  {
>  	struct intel_digital_port *dig_port =3D intel_attached_dig_port(connect=
or);
>  	struct drm_dp_aux *aux =3D &dig_port->dp.aux;
> -	ssize_t ret;
>  	u8 *rx_info =3D byte;
> +	int ret;
>=20
> -	ret =3D drm_dp_dpcd_read(aux,
> -			       DP_HDCP_2_2_REG_RXINFO_OFFSET,
> -			       (void *)rx_info, HDCP_2_2_RXINFO_LEN);
> -	if (ret !=3D HDCP_2_2_RXINFO_LEN)
> -		return ret >=3D 0 ? -EIO : ret;
> +	ret =3D drm_dp_dpcd_read_data(aux,
> DP_HDCP_2_2_REG_RXINFO_OFFSET,
> +				    rx_info, HDCP_2_2_RXINFO_LEN);
> +	if (ret < 0)
> +		return ret;
>=20
>  	*dev_cnt =3D (HDCP_2_2_DEV_COUNT_HI(rx_info[0]) << 4 |
>  		   HDCP_2_2_DEV_COUNT_LO(rx_info[1]));
> @@ -508,7 +508,7 @@ ssize_t get_receiver_id_list_rx_info(struct
> intel_connector *connector,
>  	if (*dev_cnt > HDCP_2_2_MAX_DEVICE_COUNT)
>  		*dev_cnt =3D HDCP_2_2_MAX_DEVICE_COUNT;
>=20
> -	return ret;
> +	return HDCP_2_2_RXINFO_LEN;
>  }
>=20
>  static
> @@ -566,11 +566,11 @@ int intel_dp_hdcp2_read_msg(struct intel_connector
> *connector,
>  					       hdcp2_msg_data-
> >msg_read_timeout);
>  		}
>=20
> -		ret =3D drm_dp_dpcd_read(aux, offset,
> -				       (void *)byte, len);
> +		/* Note: This may return < len for partial reads. */
> +		ret =3D drm_dp_dpcd_read(aux, offset, byte, len);
>  		if (ret < 0) {
> -			drm_dbg_kms(display->drm, "msg_id %d, ret %zd\n",
> -				    msg_id, ret);
> +			drm_dbg_kms(display->drm, "msg_id %d, ret %pe\n",
> +				    msg_id, ERR_PTR(ret));
>  			return ret;
>  		}
>=20
> @@ -660,11 +660,11 @@ int _intel_dp_hdcp2_get_capability(struct
> drm_dp_aux *aux,
>  	 * declare a monitor not capable of HDCP 2.2.
>  	 */
>  	for (i =3D 0; i < 3; i++) {
> -		ret =3D drm_dp_dpcd_read(aux,
> -				       DP_HDCP_2_2_REG_RX_CAPS_OFFSET,
> -				       rx_caps, HDCP_2_2_RXCAPS_LEN);
> -		if (ret !=3D HDCP_2_2_RXCAPS_LEN)
> -			return ret >=3D 0 ? -EIO : ret;
> +		ret =3D drm_dp_dpcd_read_data(aux,
> +
> DP_HDCP_2_2_REG_RX_CAPS_OFFSET,
> +					    rx_caps, HDCP_2_2_RXCAPS_LEN);
> +		if (ret < 0)
> +			return ret;
>=20
>  		if (rx_caps[0] =3D=3D HDCP_2_2_RX_CAPS_VERSION_VAL &&
>  		    HDCP_2_2_DP_HDCP_CAPABLE(rx_caps[2])) {
> --
> 2.47.3

