Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087E6CAC5A5
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 03:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C202B10E549;
	Tue, 23 Sep 2025 03:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpPZ1v0k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C867C10E549
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 03:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758599281; x=1790135281;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pgSXCcQOcoLIR6t8jWsA6nXZh8NigR5Rf/Nit95QhVw=;
 b=hpPZ1v0ktQddoc74X2yk9wjw167dJu1IGu8CpsysCw2Ds3IpXnw/rtWI
 pfVK/mHawF1bi7yuke+NXYKWri976RAo8rTTEAg+dZvuEMozDnIfzpa55
 gPsbpsh5WPweAw5qtFsFtKVWYCK9pkZU5cmT2p6lvnO1sCGjNP+E2ewTO
 3Bfx79Dk4bXh7h2TMyOuwVmxCXGHSO9xbRZEHC059pRUL0GwZo0zPJxLC
 ao8E491GaUr3w/O7gqMOuO73uqSmzTmvciL8CRU3rFg1XANm8kgE0brT1
 pDac+IE8TP0ZlhpD/7nTxBEheeYxU/OIPHQqvbP7A0VH17jpyy6C168ml A==;
X-CSE-ConnectionGUID: czj/uFypRYG5eiGLovgNjQ==
X-CSE-MsgGUID: +B45nYiaTxqaDYY4UU3IHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72297673"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="72297673"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 20:48:01 -0700
X-CSE-ConnectionGUID: ZQKc+li6RfCQE/UQlfQgGQ==
X-CSE-MsgGUID: 8r0xKMSBT5+PlW12+AmdTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="180945801"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 20:48:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 20:47:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 20:47:59 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 20:47:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4cnNvMIS3d09aSYOtk35XidJCXHNubql6IxeTPxSlI5dSX+fXuiChBQTzM8JBqKH8nzDuAZV1Ip2kbpCJiJYuq24lCIZ7gYUXXOOZ502tuhZGu8DVgYBtuIBNekxWedb1YtLPdvJ07dBcrrecfFseYckLJ8DFAi8aWmWrjYwbKl4ugbVuILN0OTRgI9FLKsXt8Dn0dDeCoWmmX6wFr4Kz07PduGUmBQ0zR9QpbP+KaPWTv7Ovt6Yelxn/burjM4qn53SacGr1ZPzYz/OZpid0QKUrg/5SXZtBkmVCcaIGQhtUouovDn7A0S4N66JjoXBmetGPSkhEiX6PCft+aqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcbQBI5AFtaqo6Z2j7Q0hLnqz07GI0+R+omMQoNqey8=;
 b=iyk1lvly/9dwnl68kBy0wozsovrAoXdeEfAFHszIsupdFNTwGD1kXehjUcwn4SNSTtdGOmb8hKzgxI5IbZ1rMeg685r+/AIoGO9HY0Z/ucS/rNQEHAU8bdfCEVdUAmBagTxD0qGulpbj99pTSlxyM5A6XnNEjobuPMXuBSkT5qvP5gMPTlbnBM5LtK9TsqDeBayU/Ycwt4hvag24/efo9XMC7+Crou49TqXj+YwlFmoNEyR+q/LqV13Zwo/qc2z0FQIpic2fp/fWtr7dNEjatpyhSDY1g2JU+7KifBZE0mRhNH/PLtwq16vJ2gdUe0ohhlS+PeSbFCF6FT4UjnsnqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 03:47:52 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 03:47:52 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/configfs: Fix engine class parsing
Thread-Topic: [PATCH] drm/xe/configfs: Fix engine class parsing
Thread-Index: AQHcLA4AXtcjB5V3Kk+EFpE2MPFnZrSgIQZA
Date: Tue, 23 Sep 2025 03:47:52 +0000
Message-ID: <CH0PR11MB544419DE8C1C5AE7B3A714F1E51DA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250922221209.110737-2-lucas.demarchi@intel.com>
In-Reply-To: <20250922221209.110737-2-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB6939:EE_
x-ms-office365-filtering-correlation-id: eeb9adaf-3df4-4688-f6c4-08ddfa53f8f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kakBNE2WwCeEB1FfqGEvhY8HFZ4EUdHM5v+ru/JYfoEccAfCrtO6bikog1J+?=
 =?us-ascii?Q?LIRxSac3B91K/aV4oACNkRZX2a///rJll7rwuEWUhAI+hAas1mj/jWepGOXK?=
 =?us-ascii?Q?krC4hLsmAF/3kQkDhma9Ru5aH2dh5Idamjsivbe7DuJOvI2sdhqHTdUYf9Qk?=
 =?us-ascii?Q?18cWyXhQseUhhLi+teCMpD0JINhXlb92kE7q10c6wjdraZOk9AEYkRDo6s+c?=
 =?us-ascii?Q?q64EQ2Ldlj4aOnpmiAgx9BXvnVCxQ9/1XDxrLuREJUgv1lhaqSKuLfyRDW4P?=
 =?us-ascii?Q?DhlqjkC3ECSK9cUEc5UacfhVqLL/8BL1ukplMqp86Iq0sAUQ2jEYFpE3jZ0m?=
 =?us-ascii?Q?jQmgTtXmo/GVzU16XCWjkAeZtUfJRL/xAPhpfFs8StIacVTOZsDRT7uvRLyc?=
 =?us-ascii?Q?xpBTdiSGXcOVchyZ6i9aaU9FEzTmTa9I7k30Wu4zpJzgd4xbzqYtsZCuvbmG?=
 =?us-ascii?Q?qgkA5iLe3t4EUrU0I7D86XDWd8ihQHt1G3QSrjHLXWL9TvLtC7Ecp4of2WVL?=
 =?us-ascii?Q?tNk0WW4gdh5TZH9+cSI8aheM9OPnr/m3dVv0k9G8+MAvarvHPVVzts7s87Ij?=
 =?us-ascii?Q?p+H+1NqqJOfbZx+/MKGCmRTpWSFqBq3wv6XEwvRz9Rsuy5ADofzeGv9HdGQ+?=
 =?us-ascii?Q?eEAo4/MyGiLPbSx3X8gARyUmSPR4VqZO7fLJFncuM9ppUB0gerF3gzWOe/uU?=
 =?us-ascii?Q?d9lrRKpne4ihTHXGsjg1Wri5qwhG7qcvAbSDMt63Us72gf5xw7Z3jagg/pq/?=
 =?us-ascii?Q?CP7OTBwvP0+ELYB9zwt5c70Qh87TPqZkRR+G0T9migBg9DgzkvTihooPv4VF?=
 =?us-ascii?Q?xPMIlQ2/tEL2+YjvW2JtUofZ5aWeAJATQW56wECiADANQuCKHOUUs4CbpdIL?=
 =?us-ascii?Q?ke+Gp+6UFY74YyLRU9iSt/5G6D3ZhA9FC/3Z5B3iftQBIVVrzDuvGodge5Cy?=
 =?us-ascii?Q?2PXlEVTRTYzpgz13Px1ni/cqFch4x8I4hXz063oYWn9yrvAlGAP2nJ8uxWYc?=
 =?us-ascii?Q?4585BKymCHcG9mOONt1AUSf+16YGFYIwAk9+l3AUFk6KJNtxasd7cbME8XXW?=
 =?us-ascii?Q?rMLeOdiO0unvY+4bJUls1pZYHzktxAgAYDTQ6Fu/LQZqqXMoMbqD/0cw4waf?=
 =?us-ascii?Q?pwS4gDXoATOZTRbHyg6pUkP6zGan9y3uqBQiKJT8bEbGxLjq02YR4nByGPeq?=
 =?us-ascii?Q?MkT0/OTgIewBkE8SqvaEE+WC2heDg/5Bt8tRQP/Iu3Uh9qFXYIXcZtYloZ6p?=
 =?us-ascii?Q?e7EtfZl4Fi//3R3iNkQo4E8PYan2RKOnVOR/LtEe1K4vHGA2eVz0Kkxtg4Ct?=
 =?us-ascii?Q?T9TqbawK/uauIU1XL0XltAFcA4to81qpOEqpBaTbzS+gPCbdWuolgMqG9EWh?=
 =?us-ascii?Q?k/3iNX92/YpZ0OMbn4WfFS/D3a7XB0br/fclwx9oA4azUBTkDImZL6H9FOIJ?=
 =?us-ascii?Q?YN6DJH5k6Pg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oVHHS2+J0AnlxPZmjoqX08oeKl5IY9wOBDHrvp60HAeL23GbGwQuDXbdjSNF?=
 =?us-ascii?Q?sYgjZU0y33C2qK3ID8LRQ6H3bxWw+dIowEFqEP0BLrYkbkrwg4ZctKrgF7Cf?=
 =?us-ascii?Q?RF3Cu/kCCBi72jGiHU0f363SylVdTx2Bku7kxxj3stVKdXwyi2ZIXn+YYH3L?=
 =?us-ascii?Q?5LWmI90BgH6zYNysID4olKrYv2lWlG4pveuLC+Ik/grNn9dE6clcG82i6SAF?=
 =?us-ascii?Q?GEbw941KcYn8i3gpXiDyhJYxJyqF4kMVCkzRxXUcZjnRLhnscnFvy9d2XJvh?=
 =?us-ascii?Q?YjAv3o6afxobUPmzTHRJvOnaJNdbk/xih+e++BjwlzrT/Q7oHpO7rRabR2CY?=
 =?us-ascii?Q?Hr1I95OlxagHT/fheNhFYq8ytQ5+ri+TZcjjRY5l3B9vj6GIsSgR3F3UwyAB?=
 =?us-ascii?Q?EhOVWcXteLBH/GkfjwdbrwiQiEzY3zvY8moUW4G8vTG5j6DdamGh8sf+qdVG?=
 =?us-ascii?Q?tHXCcW3+XOorIGpVv0a0F4M4Ik6I4oQWpPoD7Gide5H+byfIzDE/rUMn51qd?=
 =?us-ascii?Q?Sb6REMzRL7l0NCSbGWH5Fichw9Rm5GJH3Tq2RSPGsLDijB5efL+50rWozny1?=
 =?us-ascii?Q?prwAxaeT0yhJuTtYOLyTA3SKQTTTmYLZK4nyMKJof6TBbc5+vqC97XzYlzoP?=
 =?us-ascii?Q?U2P4lcTdogKS2X1EY0YXRODMcPTFNQc3xhGctufIdzfaV/9iX6lF0PlPPuRi?=
 =?us-ascii?Q?yL5HIiegC7YJr6aKDo8NiQPBK9RsEU9DUc25GNd2rQyGLGFOmgdGjcCF8lhM?=
 =?us-ascii?Q?TZvFbstrN/Fc3/2XvyATGLo+U6Pmc+0Ou/L2zzPsecdCwoMr0DvP8TgNFY7S?=
 =?us-ascii?Q?xZNvCGd96uFzvYN6+ZDCs7bif8SUiimeSs05AxxfdQRBzduqawmNVTk7iMJO?=
 =?us-ascii?Q?r9QEh8ERKpl5NRMMrQBvd3LrLLQR1ONONElX00zw4mv6vVSEVMDX3jRMLsCy?=
 =?us-ascii?Q?2IPJmn291uA3GiAm5pWmVL82ryo6iy0BQkK1jdpky7DEFmt3Zsm4nasP6X2a?=
 =?us-ascii?Q?enj8mZRyNCj95pN/4kgHKVDFNhdyue++ldrhZw3wvfF9HdMJLV4UrsYQg3gQ?=
 =?us-ascii?Q?4fnUOHYXKP/XQyd8TjYF91cekKVcgolOeE/YxJfo1ScGtffzqFcECK1kqMnT?=
 =?us-ascii?Q?VFuWhZKMJPjAyfGleS+TeUCsEIS34sqQhH/r+U8rS3PQvbHddkeFi3k1QhGq?=
 =?us-ascii?Q?3PIG867WPYoLq6+VgBfSzbyW+DTqT9F9Q01yZhTWFDWPpf1UIVeMivK89DNG?=
 =?us-ascii?Q?U5bMrnpxlaQ1SIyyHBiHPlY+DQNnGnR1IrWoypoD2rKEHKxVTxPLkA80DcJM?=
 =?us-ascii?Q?0kvyuU9pDUdLtu7glPvhNMMYw47//YR/jdnxnQRpbf0pyc6VdkQYOm3R1+zx?=
 =?us-ascii?Q?pf+OoipQTKtM5yJgXT6IcLH4DVb+L0ktcBav1VPjFpcRJh3vDUxBMQ/+0R0i?=
 =?us-ascii?Q?Itqn5tJOguztVpQVe9zqnynKsxmrzGKZFbphc8XMaeKprI+YO1yEsoLtjExd?=
 =?us-ascii?Q?p1Is7bP3dpDr+BC6DUhWV/+n+RtkfrSAYOH613cWorV22pqxsOuG5vxpkSb4?=
 =?us-ascii?Q?DYa6EuwIj0xI9I6weCfZxLFfeYNVjnOncr7gIlff?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb9adaf-3df4-4688-f6c4-08ddfa53f8f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 03:47:52.1592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AQqJ2jsUEFZTo2S6BxX6/mfRDQ7nxpCq/V7kXb7fFv4XwrrGrOUVdq8y6KCda+j/bMsIdv3BV3JZhSgJo5g6KdmvPWhcGfQGLRimWR09+94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
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

-----Original Message-----
From: De Marchi, Lucas <lucas.demarchi@intel.com>=20
Sent: Monday, September 22, 2025 3:12 PM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Cavitt, Jonathan <jonathan=
.cavitt@intel.com>
Subject: [PATCH] drm/xe/configfs: Fix engine class parsing
>=20
> If mask is NULL, only the engine class should be accepted, so the
> pattern string should be completely parsed. This should fix passing e.g.
> rcs0 to ctx_restore_post_bb when it's only expecting the engine class.
>=20
> Reported-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Closes: https://lore.kernel.org/r/20250922155544.67712-1-jonathan.cavitt@=
intel.com
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

With the additional Fixes tag you mentioned in a follow up email:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index 8a9b950e7a6d1..beade13efbae7 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -324,8 +324,8 @@ static const struct engine_info *lookup_engine_info(c=
onst char *pattern, u64 *ma
>  			continue;
> =20
>  		pattern +=3D strlen(engine_info[i].cls);
> -		if (!mask && !*pattern)
> -			return &engine_info[i];
> +		if (!mask)
> +			return *pattern ? NULL : &engine_info[i];
> =20
>  		if (!strcmp(pattern, "*")) {
>  			*mask =3D engine_info[i].mask;
> --=20
> 2.50.1
>=20
>=20
