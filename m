Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F1EC5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 05:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EE810E46D;
	Tue, 10 Jun 2025 05:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LzXVvV4f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F0110E46D
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 05:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749531860; x=1781067860;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ddOsmkFZVuChRaM7MT7A4zM/zliU0alQDVQH1H9yCWo=;
 b=LzXVvV4f4p2DEM2877TxHSlybGTp7VMvfRHEP3oXON60pRXELvdieYJc
 J2bFmzAnfyUsDeWK2PJwGJKdeoNnOxtXHXhyEg4bMnLyI+v04cfzmVNF4
 xNd2Jqxufbm/jixqhRi5AFXcHXW5W2CvRoaHNckcm7ko99AZ0sorF9oi7
 ojowKxcxfgpCmAqkG29NAaMo2LS2Qbv/nvGCVc2b9Wezz6aXLC6qGyYLh
 gffPg/ftM7zFF5Oz/ZsDoKHUUsZSX3GwamHTlaG6diFJP/3TrLrsQhab9
 /BlF2HoK2Fv3aF0byMd2pig0Cg31P8NPMGds4wD12uaIMhIv3XoS1vnvn Q==;
X-CSE-ConnectionGUID: ZqcyqXvOQJSnwT3HSLUEsA==
X-CSE-MsgGUID: FPLZ/SjvT9OqrY1wbISkrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="77024910"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="77024910"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 22:04:19 -0700
X-CSE-ConnectionGUID: PUGfQhZYSfKRgI9QJaFoGg==
X-CSE-MsgGUID: 5nit5fdwRn+eIuV0SKg8Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="151972121"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 22:04:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 22:04:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 22:04:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.74)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 22:04:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkVHQQ+/g6UhVbQ4mpqa4h8MG5xAoPmfrij1i3oKMTQz4Bg4c0Q/aE3xOrmemamiV1bt/WZfohXj9HIvdMUe7sTKRkqZbWsfg+4ua04p8raIYRtojAmGIMMxiGomdcYhPpOK/xEHu/xsU9yQy6jGxcEQyX2o1uiP5G+bV/AzkHnpHgVJAcHgHhBDrekj1n4LrAYmQf+lT9t8+lj5JONTBnNHFf8hCku3A1oiIygjpZCAE+ThDwWFa8zynPKleWFNfs67MrN90T1M5Lz3LBPutXrZhsWJuCUBqYXk/v/r8b08lO/taC+/RZk+7/bwOrH6WKWux7bnhKdmoAvdcrYsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OzeNMKOCfhql+bOANl8WAl7R6TI40iSFtnEirU2NFk=;
 b=FHhKilov/WBWVrUrSyiuMQ/POcHnHiYVffqa2MduoERDYnuAjw7E3g3ujKEIaE0IhbPeUeP73xgFPLAw7Rq5J3ap65RWGxI8ujDm/yCkxcSDdCfkiGmKHs+o0/+WazQ5fvc3Mp/+xFSB7WE1Vhw3CYiXuHFjXKjzkT5Cxxc9ovP+3kI7HRo5xt0m/AHQ6lFt9Lwoy2bfDtrJRs4aWRlwsl1U66nCGeM+TTqoffym5DTH+bqUXTxZFXU7hfIilst5BqWpLbz0xN4iN1RHE+/FjUJynl0oFNeLmudbJxeWcHgCSFrBsqEw6FecK00iyo1JSnaQiJxq6CXmSdkJHbdS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB6171.namprd11.prod.outlook.com (2603:10b6:208:3e9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Tue, 10 Jun
 2025 05:04:00 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 05:03:59 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH 4/4] drm/xe: Drop unnecessary include from xe_tile.h
Thread-Topic: [PATCH 4/4] drm/xe: Drop unnecessary include from xe_tile.h
Thread-Index: AQHb1MYxrQwPHyPtQUy3u3InVpDjtLP74HtA
Date: Tue, 10 Jun 2025 05:03:59 +0000
Message-ID: <SJ1PR11MB6204BA3D54A1EA160BBD000E816AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250603202826.681-1-michal.wajdeczko@intel.com>
 <20250603202826.681-5-michal.wajdeczko@intel.com>
In-Reply-To: <20250603202826.681-5-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB6171:EE_
x-ms-office365-filtering-correlation-id: 35ffec32-b204-4d88-8f1b-08dda7dc361d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?fXJx9TlPkI2StfwwVIH5kujzlq5lN68OwewBENbuLQ63hsTZN2ALeTcOHRNk?=
 =?us-ascii?Q?cDHz6BbsG3wYY2BHdDhRwnHykq9ymMZx1t/A1eQImt+VEhq9X1hYEsxh5b1g?=
 =?us-ascii?Q?0VfU7RXuioIyliDiheb/NThwsnyirHI0FnOgTr9bO/w1x7ssyw3LXi6U108i?=
 =?us-ascii?Q?llz5hZDY4TPJcPhGkbzVny546NvLcZ/uKMTwzWJD1NE/VZWR7PnPcJKYE4hv?=
 =?us-ascii?Q?E8MaoOYxNYg/xG8nUB8ofcBFVhemN5gE1vfUqfxhcK84NelMHLOlBYqXvmZ/?=
 =?us-ascii?Q?O59GkkAwm6GZEL6gbhj9dYOAZ/9Uo16lYs0IFcmcc6HVLtQblnWvaocPtoq2?=
 =?us-ascii?Q?M9i0GQ2WxIByEQoqGaUvYcRV3qrX876LtREYTcoMGfVuZlhqzphPZgDqfwUm?=
 =?us-ascii?Q?wR+NTa1uoEpwF3Cv7wrWX0PhP7memBtGEmIdzrNil3ImoeoSouB7eL5ZXhEI?=
 =?us-ascii?Q?mEPaJ4mPcZfMLZbOrQWIvloqckvwa7DW32Gp55yppAWY4rR/IyXos6RxVFPL?=
 =?us-ascii?Q?t0yw6pNk0V37fXpGoCD3CO44qPZA5B0tns6PWTzq6MM/1HGTA7zTIcOGnPNG?=
 =?us-ascii?Q?MRqr81xbRqyJy4j+hS3nNCIYmXPgAYCtcF/uCFAqdh2qNrWN/iKVg0o3H8T3?=
 =?us-ascii?Q?7bYE2w2g7xbTLeWIq5h8d5fh9/RF0VKtMXjNH1PgWEZNxIXkt+JfOulA+at8?=
 =?us-ascii?Q?Yyj+1SpCRtlSWajH44B5sY7jqPCNh6qLhEFqU/64gWUAaxS1wFMHASW3A56C?=
 =?us-ascii?Q?/F71Kt5LtIw1ZuJZP1puAd2tLbM+X43XwckeyVBXSV/GKH26LwL9AE+/sPKn?=
 =?us-ascii?Q?wKxy19TDn+OVyP9blCkikmQghAocDA5J0cQSS7mRXGlqnfCBfiX9oQYUpsyH?=
 =?us-ascii?Q?Zws9ohRqbWn5C/PNt8Z/RrxIgH+ike5a4qcBcyT9QUTGOEWPj/jSYbkDradS?=
 =?us-ascii?Q?tXX1ETNfd0zdubqKNkw8xYoN9QlusXGmDoV2MT6WzRezRq2RsPqlC04X8rRv?=
 =?us-ascii?Q?Irgme5e98wwem+Aokfh+OlWIaodv9lkWIhDvBnGP3igKioULj3BCQGXHS6J7?=
 =?us-ascii?Q?5Qso7JHtibq29kqBjRZLQ8bLcczfjN3uuoGO3Ijz9rf0ioJR0klrP57L+9vh?=
 =?us-ascii?Q?uUJ6USkrn6+NeiAH8NqN4w5M12+cXjcNlVcfw+ej8SXzvYNk7/NNos2wW9gc?=
 =?us-ascii?Q?/yF8OyoOz51cyRXiNNQkq2ei9MTvOQtkSwS6ClFYd/aK/mfx5pyHXchNbqO5?=
 =?us-ascii?Q?1Z9FfKeDsNtXVfTh1kQ56D0SQbBCgii9o7taJKQQV/28EBG5HoPA+NUhEN1R?=
 =?us-ascii?Q?4h7yryrK2HfBJJOUU+xlwDSWbWBe5eMKG9odC/NN2vkPtvh56s956lyOHwdT?=
 =?us-ascii?Q?wQy+Fzq6rfU+2tA3Nj+CMdubUAZJGieOR1nHZN8lAP2gRi2jwhMuEokW6bJR?=
 =?us-ascii?Q?Usadtcmltyk2fGT7zSejgvDTuw9WW8a99eO26tUj5LyOmvaY4u/mFA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Sto9DSJQY7pU6izhr4oKVQLauy8chd4Vl19Dh6pDSwlxBE2U5Ok1nugxuRqA?=
 =?us-ascii?Q?NQM38x45Kt0OHqBhjHD6TW4ytjInM7oejh8t5Y/zyoPxnKVFVciRiBOBhgZG?=
 =?us-ascii?Q?X/xl+PYoJKRLUjlC5HsxmthqZw7bxm64xX4q7FMSZf7hibUAFL2v1Qt8jd/v?=
 =?us-ascii?Q?Q0jYgJLv7EdKjKneka+ColxWjncOlWZjywpzysDHMvZqiEOakkNDBxATfahl?=
 =?us-ascii?Q?cxMLb7RdgJiCbnenkRtqlLsVQm4yamvmx+67iq0v3bLSwxrqqjqLIhzvvOY6?=
 =?us-ascii?Q?gnYs3bzKunJctrwy7NldHCcrppPkJb8o13W01qnSQpqZVIdV4g8vEeYS4e0U?=
 =?us-ascii?Q?YwbmFmroivk7pSa14g31wfIdV2xFqegURI0EVXOXGAlbFoeyKIJllZThvyj/?=
 =?us-ascii?Q?iYTqM495b8J7vV0ucgFgGO7C0Cc49DQCuRWoWloRUXl61CJvhsAHuGx8oN1n?=
 =?us-ascii?Q?Q3i8yB2TG0Tcr6Ijiiss/ONkxql5zhxrYyMJ5OfNmMB8xaWnpi3YhlcdTWiG?=
 =?us-ascii?Q?uXptMQU67j9qCHjw4SLP/TfdEKpxzm/4jgGB+eWGyG/HhECjjShjKYDb9oJz?=
 =?us-ascii?Q?tOOuPSLw8psWZD4ya0VEuJF9znoBD4sHwM6KQUj5zLai8eTbIdsR/opz3rRC?=
 =?us-ascii?Q?+mws/+m0Qy9H/PyVJ8VuvsqHxaZYqomTbibX83vQzwVxGV2fxcEuObd2DXH1?=
 =?us-ascii?Q?JIRbMHwV1HYxeQSQujcGa4jiX9btOR/xTPBdVabYZzIABvD1vS0Kvca8sxEq?=
 =?us-ascii?Q?2xfoK4ilnEkcQRBVyztdDRerwFEk6pmmpSt54m1fpkb3FLVCKYgr7n0jxud7?=
 =?us-ascii?Q?mV5Hx81CMvp9nDpSCEXxiNoAWeAOioquNvNQfNYcJ/66bpFuSgzoPrQLTYu+?=
 =?us-ascii?Q?9sTB9jMHiKUYBjGBlaM5kRgvefwaBgczL9edWQGVgdDYp7wtHQZxPdh88sGM?=
 =?us-ascii?Q?Vga0aVCQVGncmDK21RQjNA9SkvjPYa/vXOPjp7RumywlxpKNQd8jY3hibdNA?=
 =?us-ascii?Q?u2AXXF8LAwkunclVQlsW0l8G7FzXH23HiOxRog5XenxW9X0N8i+o3bi27JkJ?=
 =?us-ascii?Q?G9cBDjzwRHHf0PSzSxFyJ2yHYbyvtZ5HviwPx6QvqUOQSbaPPoEBph6OeXmy?=
 =?us-ascii?Q?He9JeQSu+d1AHuYpHp/hdzap6xfT/dvwBqghjQummr95jh0ANAjFNvl+fDJs?=
 =?us-ascii?Q?G7+/6mlqZ/CQ7JJZLUQLvM1IPbs8o2ySobGyMaoSL9y2NX7SUIaHhb/6PMKP?=
 =?us-ascii?Q?aSGXOOePAYSlrAIJaJgPuHHqeghQ1k0B1TDsBGOBevwHsRQN/lAZ98FBLPjo?=
 =?us-ascii?Q?RwLbwTCV4UfYvsg2vmj+DTyrG/shIUAz7O0kgpbGfA8RLkxt6DRw5/6Qn4yn?=
 =?us-ascii?Q?ercJE5OdbiwnOyY+QnZ6QuB9tb/xM70vFtP/pl/8OIJpikLBb98CySg2u/+m?=
 =?us-ascii?Q?TJda/1cKPUd0l3BtUKRv+oH1o3JOkTD9kc03/rvgOHTz3eywA5wOxMrXh60s?=
 =?us-ascii?Q?H8ZvWYV4gu4VblfIZXGhzia66TG0TSuC8wMkeygXQcLNf7dZcaRGie70AqMT?=
 =?us-ascii?Q?bW3fSrGM+z5bDUwQatIFFz+TMaIQdtJmcxlvfwTd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ffec32-b204-4d88-8f1b-08dda7dc361d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 05:03:59.8783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ief6n0dShpjXK7ThWNcIS7g34dLMWHV8BpBkpK0pGDvBRAV8TiM35smotTm7aNSFxLwtieKrhQniud0MhjtI6jZbCHLYRtWKWRidym0nncw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6171
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Mich=
al
> Wajdeczko
> Sent: 04 June 2025 01:58
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: [PATCH 4/4] drm/xe: Drop unnecessary include from xe_tile.h
>=20
> We don't need to include xe_device_types.h there.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> ---
>  drivers/gpu/drm/xe/xe_tile.h       | 3 ++-
>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h =
index
> eb939316d55b..5ade71bda89a 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -6,8 +6,9 @@
>  #ifndef _XE_TILE_H_
>  #define _XE_TILE_H_
>=20
> -#include "xe_device_types.h"
> +#include <linux/types.h>
>=20
> +struct xe_device;
>  struct xe_tile;
>=20
>  int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id=
); diff --git
> a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index b804234a6551..6dcac829839d 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -7,8 +7,8 @@
>  #include <linux/sysfs.h>
>  #include <drm/drm_managed.h>
>=20
> +#include "xe_device_types.h"
>  #include "xe_pm.h"
> -#include "xe_tile.h"
>  #include "xe_tile_sysfs.h"
>  #include "xe_vram_freq.h"
>=20
> --
> 2.47.1

