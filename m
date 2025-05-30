Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5667DC5AD49
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 21:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A0210E89B;
	Fri, 30 May 2025 21:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1DYtBDP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1DA10E89B
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 21:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748641640; x=1780177640;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HIB9ErjiYQS4W637WxuQZ7UTdqvFqvNzh1dUFHGXBa4=;
 b=U1DYtBDPwYXFqV2CDDHfIMIZqObrxrTL6P95LZUlWn59FMzxIzQI780t
 J44/RHfJqj/evpPffGgosvlBOGm2/WVUfD5b9V5Rf7BUke1/2kabSzcfG
 146/0wo4Ah5ErGTgP76pqnUWnzfO+3uy126LTVwJrzF+tSG063tIVz9u+
 al0brN18QTW/uCL+xSCr+PQ5Nc/Bcb3q7UU4DWQI0/XSCs0zbDA9daWP4
 F3vZSa9iqi95aS7fBaFT4SmhXWkccwz4q91iZZDY1Jw45652ZN56U3DV/
 10RCJlqTyFrIvAjgQ7W2JLGPZmFKL7raysu2i/1Ig5ZeHwc4FMVn8aXYT w==;
X-CSE-ConnectionGUID: Gtf0MLuEQOKyArdC9D6AFQ==
X-CSE-MsgGUID: F4jG/J5ORO6pITqxm/Vb4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="76132996"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="76132996"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 14:47:20 -0700
X-CSE-ConnectionGUID: xwqzGFtkR3aMiobODmzG5g==
X-CSE-MsgGUID: O/K1b268Sau2uajEdckKzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="143902524"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 14:47:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 14:47:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 14:47:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.61) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 14:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kauCU03zvZIpB0v1E4UD3oV6j0pCoZDmWiprCLwnI/YNyIUMPQjDOoMrUwOto82Gyam3opxGNkNoZ5/4jNvGAszSO/4jx6ogtS4TJ1rXIFHruDLSJphKuv2HYJhcgmFdZ4lG6BZbBh560TsVSCb3UEogBx3lxzkgxeRV3I2QQyz/kvao3Nl/zIesC8dbcSO0dbaWrwrDlaJZeZOTs/VP1wQcZ1nliy1zsOnxg4VX6x7rOO9KuBUx745cWlIw+d1RrLgGqHIk2MH2HlKp/927OU2iqCmBTVjKQelnJjprbIu+wQdv3jvu+3MMO32Rx948YwMyzy1UT5CuSX8kLaJLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyBzz8CUrrw8xAvdffUcV+/1WcvO8VtssAjDxancd3A=;
 b=JCH7hr7p26AzG/Tw+KwHo/wKPdyJ/rVvZGcx7rFT+mKzLMaZQnKVRfFLVLtntF30q+Rt3lkMEKmQbMWLvaka8HHihybdXXjQh9vQhmb4S0+FJhNF5ePdEyAY/hWG2EDRjj0wuzi4lff/Yy1WjBVlBd0NEKTQEtJDrwjPo0IL7Tm4hdlso0ipviFEjN5hThCvbHHL3h+4aibe5M5II8rgaE4jfLIpRbW6oQ6h1/i8WmF2udXDGITRyiWROVEJlUG6ucgmwassiCC9W4p/zydhptv0wO1SNbpmCqxsjcfnBySr/ar2Zhl2nrNrO/TMJe+5Bzd4mDbqsHeTFhWoxoUoKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6347.namprd11.prod.outlook.com (2603:10b6:208:388::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 21:46:49 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 21:46:49 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Use GT-oriented printer to dump topology on init
Thread-Topic: [PATCH] drm/xe: Use GT-oriented printer to dump topology on init
Thread-Index: AQHb0aauwmkSu66t+0291ZZt3yJvzLPrsVAg
Date: Fri, 30 May 2025 21:46:49 +0000
Message-ID: <CH0PR11MB54443585B57FC0012042009FE561A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250530210524.505-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250530210524.505-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6347:EE_
x-ms-office365-filtering-correlation-id: ac54cebc-a2eb-442f-d64d-08dd9fc37b36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Qg7sGydbHXnf1/+KlytoeE+/zqXDyJ8rFqDAcraeaU51T5Vaoz2jOyjJHmOp?=
 =?us-ascii?Q?WzVgM7m+env8Cs3XXpYRIb+nJnmvG2jry9ttDH/ePMCfipMKUdpNVl6Veomt?=
 =?us-ascii?Q?aGNq580LL/Sg8xc4JrlgZ/mZdXaGd2V4F7hig9lsEvWsS8/sxveg2CRdplEh?=
 =?us-ascii?Q?m3K6nn6RPgF6ieF1f6fI8sFqoWBYLNWDkc5foSgt6t2iqCHDMWDLd9iKjLpx?=
 =?us-ascii?Q?lwqNxQXlzqquYumj77GDpuLEl13vvLFdhpum/vTgYdO8U0F37b52l3CFEY5g?=
 =?us-ascii?Q?w84p4cIvGSnTkrpWKtVXvMBgv6RQ3RW2Wt+SXFwBP/xYQ6NP8J4lbPBxxt3u?=
 =?us-ascii?Q?daRHXyPqPkKwLSsqESFCOHYfXx385qRVrqFQiWizJ4tApvgP7D3tNpoyP2mP?=
 =?us-ascii?Q?tXrqcECb45HnzOO2RNfLHgcNtsGfLHnq/2SXtdFC81ZGIo5jBYGeSua8pcGz?=
 =?us-ascii?Q?ASohVP/pv6qJw5Hnf6mxTxOcqoq3gUI5XXLE9HfHUbcvAazxik8E1rYeOZxy?=
 =?us-ascii?Q?0+fs0hWK9BgoQq5sU42gWg+32ES5mb7L9Vav74ZCvY4D1FhV6d02+WKc6lE2?=
 =?us-ascii?Q?+CXYjG23JTD7JcKyxi8rP8En2gGggZsjoy0f+TXyVOueOJJ1PiP64j8cw1yu?=
 =?us-ascii?Q?aElydxY7c8BRuXyu4T3+Ou71Wsn3YAxDmn9XHMxcearOjs3n92rSyZXIwTNq?=
 =?us-ascii?Q?crygpkE7MdWMVtKupe8Q0kUJOUygk8l3QFJQP/oXOi5OU6dCgSxSUjumTsc3?=
 =?us-ascii?Q?xgV9svwifPtQsLiy9rqP/tbO4qGHXhYprOj8/RejDnEUsmFrBsN5N009PNjr?=
 =?us-ascii?Q?KDAKFO1BSgBmzOndHPRV3oj4Z9ieaMlQrpf68K3qlcQezvdIsW8VmWkfTRJc?=
 =?us-ascii?Q?DifsXyotiImlt2BlH5o8/LcRHOHwwgJXuIxRPh9P3Y+QqRWceE0cM3EP87nW?=
 =?us-ascii?Q?EV6jirUPeVca5MUJrreikFvWc32Tc9qJcK5u+vF1jNNJvEtihezoH+SpHc3l?=
 =?us-ascii?Q?YFOLs9mN12W422yJnFW3NVy0srE1AjM+W2eRNV+OIdtxfQj/29ubr7CY7/MB?=
 =?us-ascii?Q?BD2eAsFgC2tz0foghPe0ETAkvPK3D927HV4bTH6BP2hxRQZyd+bHGySkwCj8?=
 =?us-ascii?Q?oIv2paJBT7q/+9Rp2BS+OmK309jAeHkoX9kK5/APhVij250dHBnb2E6Kqclo?=
 =?us-ascii?Q?dZFoTYOeLoPS5CICfu5rthd782uuSgLxOERY6qF1irIXTDia2G91m4biuvZg?=
 =?us-ascii?Q?1Q0AYxC+q/f0lH9zJOx5y7doIyepQZZjcmExmTTJiQKVwSC44TNzpurGAwMV?=
 =?us-ascii?Q?9aYMxUtV3lzZf4+edpDYOIyGnHaS6cgJpkapdunwM9QYZyGMC5St4DdP69TK?=
 =?us-ascii?Q?/DSV++/gMDtmfWrZnVhHkUHORc0ERAtxd+OSkbXkuoc5ALgrGcf01xqeIDTm?=
 =?us-ascii?Q?byNUzm4xKNpRe8Fq4wum1dSL04XfWEinsEU6CQ3Dtcd9Ck0w/4AdEOdoZ+6z?=
 =?us-ascii?Q?1lK6n2CNOIyP284=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Wa/UpNMKniWi8cIgF8ie2aOkUXS3xCjyMM/ss73TQ1TeeSvQprwS1IN0Yf6T?=
 =?us-ascii?Q?Bdf5NiZilXEmxu4bsFVXwhfjad20i92U9s0ICJzSZrM538bTOtWwJetn6ytq?=
 =?us-ascii?Q?jub6JfkqiSojGmAUVwXffDA1ZFS//5NT3zqUyNZp9RzDZD5OwkNi4V5hyAJk?=
 =?us-ascii?Q?dOhuOkSLzs11X9Y7BWEKussYqchv7rjStrXN2D42ZHv09VhfAtd86hqA3EnL?=
 =?us-ascii?Q?B37fzT/f+KH7UzNptYhBtV2SKBkLJ/AKTt7Z9tXRG5Nnr+dcHWhXxCG43MCE?=
 =?us-ascii?Q?/jrlZBBvREOnoobYUX/Ifl/HU0hnRkZR7oSJ2KmtvM99uiHruX6zq99KOBrN?=
 =?us-ascii?Q?C38Z6RhAUWIj36R9vGtYc9RgbNBGXvwHovKGZZA9oOV/SbyFEOlbApK8GV8w?=
 =?us-ascii?Q?zKhdFKs3Bk1jw/g6HUFiuXBfQlI+SpdkXdzQk9qgXRKVXvMGqYvVolSnrBsD?=
 =?us-ascii?Q?+qGRfsd7ykmkmAmdiIgDITaP0xowjYeW8gbv7YMSGXIMH8o3YwGX4u/ARWUg?=
 =?us-ascii?Q?252xN+zDvtDlGH9Nrc6ksyYWa7TIwbouPkK72n3VwtoYQOq+bcLv0N2VGJPb?=
 =?us-ascii?Q?fqMPmj/rx3tlGScA5aDSuz0p5QRCmT7y3ULETYEs7ZPmRiOZOlTvMlljeaYZ?=
 =?us-ascii?Q?VUTz6u77ED+ZSUVjtbrsADIUWWghLmK+fi9d8J63GssvI0I2yepdDP8cqD/I?=
 =?us-ascii?Q?FKhogoTLPJ5UVQ94oc02Gbr5s4zI7oM2eoWKlVD3EarycmxABskrr+U1+m+h?=
 =?us-ascii?Q?e6aLow9bMY1OmSI0Af21ZDEmO5XWHLl88DD9jln56X+MtGTMZWfCEC74jDnL?=
 =?us-ascii?Q?tiDzgvWWhRi3yOxF/osiDvvRJ5QNCMF5lL4g9ZF53FFrWzds+UD1K4I+e223?=
 =?us-ascii?Q?1s2D15FRjl0O0bK9WLPLku/i5xIiK/re9A1KiWBRaG++KGUakBOTq/Uwj9o0?=
 =?us-ascii?Q?rJHNTaAM3LC4qa69/CHYq3CTBIOWGmCDZMd5A+y03nW39/3qXKmF9Gf2psw+?=
 =?us-ascii?Q?vG6G6mOfORJfsQjkxWnk9Fi2KJySkh7XbSlOru4ho0kscfGn74LwLuIeujB+?=
 =?us-ascii?Q?pCUPysL0BfCCFq1USouXN4SINkPRgHtixyO80Ldf7BUW+KgJU7DvRGCF8Z/Y?=
 =?us-ascii?Q?DhYfF6BJHCU/f6fIA9sxOPeH5tmORm10HG20gWyt8dVfRHcN2AmqAFpYXlhj?=
 =?us-ascii?Q?N7EM/Q5Hq1nudR9ZWBRiZmpbspS9B+Qb0wVzNfAcqY+TllaTVymvrl7A24+j?=
 =?us-ascii?Q?/zOFsJeW2KM8X3REe4YZWlY8FnDHc2Gk49hk8rLRgHMTve9B1N/LBWjU5adn?=
 =?us-ascii?Q?/f7063bB/5jW8toPerMkFV1Ezu69pAYWwtZWYtMN7R/jMsuODXxyPvGL7BfS?=
 =?us-ascii?Q?zibpPezE3JyT1seewOSaGIGaIW60DsBENn0EqvvlOTes5sRiXG22nI2tIqop?=
 =?us-ascii?Q?AE0v4RLGCN+sSz1QkzmJnvNcHfRtt0+zfocYu4K1xEjFu66LMUvWGsRp4xSi?=
 =?us-ascii?Q?87zoWNOhCEJrErgKoLbQqgI9CVJqvMfgDc+9oMagbkJD9UZEgx/NTKYflT09?=
 =?us-ascii?Q?wB1sfFZlxU4yQCnp7i3JkJ1jylre0jbvttiUEU4g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac54cebc-a2eb-442f-d64d-08dd9fc37b36
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 21:46:49.0655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5smWcdkCzqCGJS7iz5n5ypAxC9rZhivbzyKl5u3CuNxDjwGY4vi2x1sAP2Y4s8oz0QyW0BEtjx9DwMOf/beBbw6aXcU3IE7bwocXEt3WCT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6347
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Friday, May 30, 2025 2:05 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Roper, Matthew D <matth=
ew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Use GT-oriented printer to dump topology on init
>=20
> During the probe we dump the discovered GT topology, but instead
> of a generic printer we can use our own GT-oriented printer which
> contains information about the source GT.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_=
gt_topology.c
> index 516c81e3b8dd..acec6559e2f2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -12,6 +12,7 @@
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_mmio.h"
>  #include "xe_wa.h"
> =20
> @@ -243,8 +244,7 @@ xe_gt_topology_init(struct xe_gt *gt)
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_type)=
;
>  	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
> =20
> -	p =3D drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology")=
;
> -
> +	p =3D xe_gt_dbg_printer(gt);

LGTM, though the lack of a .prefix field might be a bit of a dealbreaker fo=
r some.
Maybe we can update xe_gt_dbg_printer to include an optional prefix string?
It shouldn't be too difficult to update the function to have such a field, =
since
xe_gt_dbg_printer is currently only used in one other place in the code, as=
 far
as I can tell.
Though, if that's not necessary, you can have my
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  	xe_gt_topology_dump(gt, &p);
>  }
> =20
> --=20
> 2.47.1
>=20
>=20
