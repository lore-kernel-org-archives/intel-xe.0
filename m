Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4BFC021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 22:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D989D10E032;
	Fri, 14 Feb 2025 22:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgBks+kt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851FE10E032
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 22:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739571644; x=1771107644;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GjC2Fv98AfxzAIzko/2YarYJ+Pn9xchVE9CXSh35/Ek=;
 b=JgBks+ktmgF8A/LEuIRQyVeQAfj9zsLXDODpGDbh+d3drED2cHaXxJjs
 1wFfEGyS/qhHGtQhjH1+meZ7MiENwry5FGj0UcNnPviJFKrCtiHmL/Z1X
 f6ZzNGD6f33hf0oRjDqkYIxE2lb7BllCPwVQesVV0ipsW2NY1hvXgG0ol
 W/pEdZEXNyaCOtJhGsqim3x5+lvYD5ux149bpPx1M5X/RPOiknA9Smf6V
 OCnE9vzBm66WzwZltQovGeleOoQdDwyPDCFm5FoyD0uYSSp331Att9wI3
 ELUNkKYXLgyOKte0WZd3iN4L50CQ3o5MOO+gdLbQS7PWRLB+c67zI1EhI A==;
X-CSE-ConnectionGUID: yjhMTIInRMad2GVNlaDiTg==
X-CSE-MsgGUID: TaG/xk4sSZuRrKyUeFu0bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51763961"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51763961"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:20:44 -0800
X-CSE-ConnectionGUID: 8Gz0Sc1jQd6UbFMG3DQFFA==
X-CSE-MsgGUID: 1QlscSL2RWSncVMChYJ5aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144495003"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 14:20:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 14:20:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 14:20:43 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 14:20:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjNckaRjy/q0xHH7j927DbWRn17LCRcNhweCe7JirJXSoc5/D19u6ICZ5a0w02/tkAgEaeJCwopUpADLwQsEisAA3+uE7NJXBlFBOIP7+rm7wODkp5Ql4B/1xQsTXGt0bTSvHR1vk0QGeKQ6Tl63xx5/LUxSFglPJcrkW2eT7tbJFdGnzt9BJlhxylsxT6bPgJXN2msHab4+hKLw+oWCSA/IXSuytZK4C7q1JOMEX/3OaVwACxw1XqQTVtL12TLyY3cyqTjQ/eKD3L2FCd7piMj9ED7tKxdlEvQcEH2lBk5flGY58GIDmchuxAUEaY+kIUTrNEAqZbuB/n0fuNHuVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VOgiLKd8ehssqAh9e0DlvwHV9waRYQs1JKdfbbi0wc=;
 b=ZOlr4wyojZ3uUm+Jivmidmu7R0cnPWsC2XXA4dNuZUivGpzSphF33l7rZASYRAh3A5WWvoDeTu7v5cVHnNaoCKTnvNv6LBxyEJp66xxs76/F17GAA8vjnwCvmQgcuIiTEOOeR4nizYU9n+B5TWZaBNwqfdbRO0Yfm85qBXpJm/+4vraDcwbgh4rqOK/Gun5QG2VqcoYC0IJM+je/BllthRFnGN/EuRKlw6rMWUBi7BfxcCqdbrZ0wx9gS9OjSegVLrexdS0QgN8Bkgy7Q4GokbSTolRC82Z2MwI7QQKdCzZQbWwxLS3WhZXMaTsT+XtrjaBSqUVoa7sQmNDF/KMXoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 22:20:12 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 22:20:12 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 9/9] drm/xe: Stop ignoring errors from
 xe_ttm_sys_mgr_init()
Thread-Topic: [PATCH 9/9] drm/xe: Stop ignoring errors from
 xe_ttm_sys_mgr_init()
Thread-Index: AQHbfybLQIVrgkBE7UqqkNdD7wU8sbNHXgvA
Date: Fri, 14 Feb 2025 22:20:12 +0000
Message-ID: <CH0PR11MB544416816398A89187A25265E5FE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-10-lucas.demarchi@intel.com>
In-Reply-To: <20250214212313.1767562-10-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5206:EE_
x-ms-office365-filtering-correlation-id: 1f581ad1-528e-4f41-386e-08dd4d45bfb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?sARoP/1S9b/+MLRpzO5EOCdJjESwXqwur1nIhxteLwQqt+hiUKM62AmhF7Sx?=
 =?us-ascii?Q?bVCTToD+F+oywroxFa/UJ5Eh/9Unb/xt4/bpifp2fh79cMprkONGR2zw0yuS?=
 =?us-ascii?Q?8VxsnzjdGWp8AU4FbiuyLv86beFeGm5+0Ae/FXRyfzpG4YnzJl9dy3KZOcXD?=
 =?us-ascii?Q?3BpQg6aCM3AZQMzIZzpdKK3uf9jSPdj5Rozp0rXCeYMUSgaUqkE7OEAj/thq?=
 =?us-ascii?Q?RUQY+8hhHxb1+5ZUwvOlyiirDgtHmn/yq+2o+C0Ihc0UOWJ+Fb/FHQf2I9nP?=
 =?us-ascii?Q?jdsye0KLCF/KEmH5hg2C+2/7UOVI6W6De0BZRHH0x8CRLlqOM1YxAvzHyY8e?=
 =?us-ascii?Q?ilUWMspdYFjC5bRz7xtXNxenA4sFNXFxZttOuwkT+kLlpgEO2HKYPtRvxrOU?=
 =?us-ascii?Q?/HTqFIH2foVIg+4Gc55V0K+F7Pts69aee5TB5puVsqkJnk7t5oZbQXyPH/k/?=
 =?us-ascii?Q?5HlOX9AfU6PakgVa8/dRm1u0Sv1YT5uPRCkhlMr87kwsNua+o14Fyo8J4ONi?=
 =?us-ascii?Q?L0KJJ17DKnmLQI7DdZwKzfXoWRsooaRZIIBvnKrmn1JAyyBb7kmvjICz/aSQ?=
 =?us-ascii?Q?MYQKI6cHNa0L+zmMUWbpx5aR3VVHViKF1dvUTtQqXsaL1OMaZZG2regBjiIC?=
 =?us-ascii?Q?yOsjbH39ocfSUtWpODgWttJUVGwX3klRFtiB/T5BBjwXnS463s/4l1aWeTzg?=
 =?us-ascii?Q?0jnHcg/zlFLpadGFyTWBxMsvuapaEeO0+k2oD1wyle6IUUzOefd9cOihybjy?=
 =?us-ascii?Q?uNHxZIV4P42LSZxSeTBam8zsNPooUzZ64i3tdfR2o84bTtowRaOW+a7cySYN?=
 =?us-ascii?Q?6Rz/IJUpBr9UpaQasQWxfdvCyvAR6DoMhUl+bSAFUP/hF8xYkl2oAInY6giw?=
 =?us-ascii?Q?23skoe8fYUQwAY0Cpf1/6aYZGt+mcErAbq+cpY6dTMR1DfMfgHQgl7P4S9PP?=
 =?us-ascii?Q?DtVfmGg6+WCuLk/sAfV4FEtC+CzfyicB+n4Ybvd2un9blgWn4KGlQK7L/ltp?=
 =?us-ascii?Q?JLSO6MnxmLNM0YvPQDnBc+lnNSQGMtXLrJFuFDknJb1o4BMKWgF6VAViW+vT?=
 =?us-ascii?Q?8XzYjG0U1sacHUgBeidnEmsvuuhXEj2dqmxdzPhOjVIqUl8RC/+gb9e5Rvty?=
 =?us-ascii?Q?1hGYf25jU9F1ZDVpk0YnrJgpVXk0qDBQk28sgCY8BbJaDhdx70tCV7SnA6hd?=
 =?us-ascii?Q?Fhju19a9aptCPCiQXiSgh6qC4q40572DjEAuRX6Oi9LeAnHfeC/dBkwRrsIs?=
 =?us-ascii?Q?fYjiykg36mN+2Jt4FFCcC2xiPQfUeHoPLOX8Ji6EePrws1lcWOBnjU1rfvjN?=
 =?us-ascii?Q?rO7KOOysS2V4URygVdMAOhT9rYrrGvKPeUICM2pkzHBq00sAxR9qMKYNlAzD?=
 =?us-ascii?Q?RkdjDezRSgEuQNQk3V081Jrg99Omvra5UFoOMQXzfjtO/qJgsdjniGFtozOk?=
 =?us-ascii?Q?RJWJQtjdecMYMiSOlSPK/H90649u6cZ8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+7AXA7/2rfqzswCUlZYUNMqpwEgRwbN6P/e0NEPuvmV/07IakFBUDfU1MKJe?=
 =?us-ascii?Q?3W7ha0d5Vr6KNDE/n5ycVsNi9Qvz/9e7aEEbIQamTewmCpJVvPD8iTUDxYrW?=
 =?us-ascii?Q?JN7rCdlPKI64Zd2SeWL9+s2XOL1+dYXe9uywqae8VuV4TzkneM3EbcQRHMqx?=
 =?us-ascii?Q?cOHRPCgtkgrzeuedFeVTiPyQq1DXW+DSBJ6N18AnqeOEJDxa2ZZjIsz7/yFP?=
 =?us-ascii?Q?48U0njV10X/I+s4EAv+CzGxFSJ1Kd6cgLfum1rQXf9HFQzY1nQzbTvKJu+VG?=
 =?us-ascii?Q?CI1bRRCPmYWuT6uEC+pB4NHc6i7GCceUkJ623d276S31S41zoTRlRSjUmTrX?=
 =?us-ascii?Q?AtfrvrC0jlDLOr/5Vy/RG8DiqYvtSJt7HjG8OmSeZU9rFeLXBEA8Ellf4LzN?=
 =?us-ascii?Q?JyEmEh5CHLoObftWv3WQ+cXYe5d+WQCaWcxsCXrQ110nZdueIPr4/8l/iZ5S?=
 =?us-ascii?Q?3bthLR8sHZwOnK5WQTiupV6/J8ymjqxMK1deJ7k8TLTij0V4wescPBFinksK?=
 =?us-ascii?Q?0o9aygPT8LcSj9TW20j6PASmLKA14AXFFCGV6l/5F5GBjRIzbJtkDgz3Ywl1?=
 =?us-ascii?Q?Il8KLRTU7lCbNuO5ykUUjtEOhbpoX7NbPVVn4OpUiWmE3MwPwEJlE/oXYikW?=
 =?us-ascii?Q?mLzbrnxw4xSRIkpfpp2T46gy+XkJBEhzee9cM44WF7RhcX+U5dJWbWLclo4f?=
 =?us-ascii?Q?cTIc3FV6pomD15mqlsMfwejYM7emF33+DlnUVWJBzZfLtn8oKSkUSz1sBhWE?=
 =?us-ascii?Q?ERMjiQbrx0iNd8l2JhEUxyBTcafmtOtAdxQMXYmjNt6GRBQ85ZhhpWKjPwak?=
 =?us-ascii?Q?likYKMjhYEYVrjCVDrMZKl8UzLWH6Zb2Xn+Xh0lcz53G7xs1EwZ/p6Kt4Xla?=
 =?us-ascii?Q?lk2tto18vMQBxH1gBaXhX2xvIWNt4QJtf9hwN6zOjERh/lBO/3045zXSWQ+K?=
 =?us-ascii?Q?pChrJVX2wHbGPtr/8kHY1LWdHph8kHxK6hCXvP7GCd+0KcaPnn1EbY53x7ia?=
 =?us-ascii?Q?EkCMaZSXNKfsGXZJllUug3VK03dnw28O+BuKkhe2+N0e2L0ogOIE2enE3oiw?=
 =?us-ascii?Q?HzKTGRfVpF+4gTreTxq9oKOYpxGFwIyYqiBgvXygt5hef0w1VFYJbuLetdY7?=
 =?us-ascii?Q?Fz38UL9FAA+o68SZ6tuKZTk7BdGR+z9CQXiER+lf+UCiivUNvI7CMkUYRGcm?=
 =?us-ascii?Q?0EHuok3hachGDUVtIoRa7Evrp6gF2NmKucyB0+3UORt9ntsI2yFCinXaBjwg?=
 =?us-ascii?Q?KjQRS9B1QGtI3tJwJa+1kBl1SQIicjbbsR116fEGZpXj+FMOxsbWzO1g4bpe?=
 =?us-ascii?Q?keU8ZFz4Tqari1YJV/BiuQ9sf9E8xPCaQrx/VA52cBnWvBGzd3mByhOyxF4B?=
 =?us-ascii?Q?1ogO7brGu5DIgarD5eV1vA61aciMX6WmK3GOMyROPV+V8Af39kT8+baUedDN?=
 =?us-ascii?Q?uZa1q+rEEc6EwJsDsT9Uz7h9S/tF03Ef2C9jOKYSHrEujtqcz1a8degzNAkl?=
 =?us-ascii?Q?0tMzoGLgrJLh6WnW4b6T8b2DVRwCkriWvONMRsQY1EKuK0ja6pTgQ6rvwUJh?=
 =?us-ascii?Q?Frs2a8aW9BU2KaEL0diY1im9LXdTs5aqUhR3H+5G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f581ad1-528e-4f41-386e-08dd4d45bfb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 22:20:12.0770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDRhGXDwb2NLxGwMSXQ9AWEYHg+VIS6QVDsaXFwA1J9or2mpPrb0ylciSVaEx2hdy2pAtzzLNRpbUwNqjVujfTvM9rvVwOxTjSz2GsoWUiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De Marchi
Sent: Friday, February 14, 2025 1:23 PM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH 9/9] drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_init(=
)
>=20
> xe_ttm_sys_mgr_init() already cleans up after itself, just return error
> if that failed.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 3255c36700f60..8b13b22b62bd6 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -748,6 +748,7 @@ int xe_device_probe(struct xe_device *xe)
>  		return err;
> =20
>  	xe->info.mem_region_mask =3D 1;
> +
>  	err =3D xe_set_dma_info(xe);
>  	if (err)
>  		return err;
> @@ -756,7 +757,9 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
> =20
> -	xe_ttm_sys_mgr_init(xe);
> +	err =3D xe_ttm_sys_mgr_init(xe);
> +	if (err)
> +		return err;
> =20
>  	for_each_gt(gt, xe, id) {
>  		err =3D xe_gt_init_early(gt);
> --=20
> 2.48.1
>=20
>=20
