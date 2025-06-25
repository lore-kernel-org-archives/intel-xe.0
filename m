Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46E7C7115C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 05:38:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3A910E671;
	Wed, 25 Jun 2025 05:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WYke6iZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0ED10E66A
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 05:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750829905; x=1782365905;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ft6f1SmRiCVqpNXkiHwQbAMFYviMoY8ZEZcToHMYjK8=;
 b=WYke6iZB/ReMn+9MwfQEdXofy/1gtegSsj03f3S1Af8qrHY9ryhlt/6q
 hToKggqkgBtPLzyRZT53B72NkvVAx2sp7gYHplMOcmbbV1WIIfKQHj9Il
 v2gzG6ObtPW7tCSClKVkaUHm9VC2q1880ARJjkR0Tg+cC6Kj/PXM/fxqq
 nE+nYKmQRcgGb1IBgfONvgVBIodcbmosR3Knwezud8QWNX5oydBXVYzRK
 qzbRrTrqajyr+7ymSjvj/Cv6oePZ7iDH885jAYxgk9l74LO7pZCpOYHOA
 USOdQOF8sGW3EEyBKgOnWVZFVKMY7bdaEZqFn3HNbaHf/ZZyS1Uk7XjkS g==;
X-CSE-ConnectionGUID: iXLibqHGSAykn//njXqB2g==
X-CSE-MsgGUID: jbgwViAUSMqoDNPkmg17fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="55714539"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="55714539"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 22:38:25 -0700
X-CSE-ConnectionGUID: +jyKI91BS9qUxvgbi2bIOA==
X-CSE-MsgGUID: z8x4POYTSriyAEPirfKLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="152244894"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 22:38:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 22:38:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 22:38:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.76) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 22:38:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYgI8MvxY6oqjePPGxfj49k1aegnTSXegSBqjyGfcCTD5uWY0oj/SqkdDY7G8WrQJnpf3BuUYz9V0NrQWJ9Kj644h4+fKSrqAj1XoKYdJuY+lDC/PVr0b4wZPZsxYsUsf+t6bllMMPBZ8u2VB9L/NHWExaRm704R0el2mbop+yRQg0tY9Erfa7qMWtU0Tl4rPU4R5U1MGfizMpuvjVUcDVQ3RSxVb2yX2IVdB4ag21SZg3FH0y5FSejeRYgjvyNwO+PKlxij09SM0S6/A2sbN9YfL66oA+c/po6Yb1njLEXZTxHNbqajmqz6ykI5PqJtyf61zcpM6WHdb6nh3isc/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNuL9addTwHDSV8yWv9Iy51ft03WhGT3hsQZWBy2Pwc=;
 b=knZFJB1bmecSBkBXcySuyQjgZo3nZny8Pr2QdRiOhUMhbDbNC4nUzBuHqFVBoFzwFBvaOQuV05c3XQKEQyxEfCQfmh82zMEoozT45W+O+dy4Dy6GMa4Z6Ww6yNs1Nqv+x4QXaZdC9wUc/MaF1COAWmt1CRPFFpr5U+eHCT242worWXQP+8HaIiMesbGgk06kUICp9sqhBpbLzjB3UKb3bm4T79uLROK90wLhjJ1G9F3vu8z/1JPzmvmkkavzKv9xE4vXZTeKiFxpjUmf7zmkE4rNpPv+IDEp7PQrhxtkVXScTD8OREsgoAl4xmlDHdk2Y2v5zH0wmfD0w9Tb29iOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CH3PR11MB7348.namprd11.prod.outlook.com (2603:10b6:610:14d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 05:38:06 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 05:38:06 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "Bai, Zongyao" <zongyao.bai@intel.com>
Subject: RE: [PATCH v2] drm/xe/uapi: Correct sync type definition in comments
Thread-Topic: [PATCH v2] drm/xe/uapi: Correct sync type definition in comments
Thread-Index: AQHb2MlwL6XXmbQhck2ui2r4yIF3zbQTdIWw
Date: Wed, 25 Jun 2025 05:38:06 +0000
Message-ID: <DM4PR11MB54561CC1D8F1FC82EE89E8AAEA7BA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250607023442.1236889-1-shuicheng.lin@intel.com>
 <20250608230133.1250849-1-shuicheng.lin@intel.com>
In-Reply-To: <20250608230133.1250849-1-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CH3PR11MB7348:EE_
x-ms-office365-filtering-correlation-id: 37b83ec1-f240-4851-0737-08ddb3aa7600
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2mJff56lfheCnDPzfydGbyHtEN9yByURu2XoWadd0uqBTqfoL3tmo6Tz8KiF?=
 =?us-ascii?Q?TtLLHd/rOC6gkFyuxzUXp27RaWqPsEZ+BI+Ws3XvUZ5cf4lwPaO33qh2828D?=
 =?us-ascii?Q?ST+nH07QhdYXNZY6vhlO8d5GMFelcbA1Wbw8JNp9bgEMf9vJJ6/mK2D9G1zw?=
 =?us-ascii?Q?5M8xXZERHogtCxeOumUJYnWFaVeiM29BHV8l9LxWdgrDw/6JBTaQglAlSkQP?=
 =?us-ascii?Q?hbal/S1Ez0qb3VoxNzeY8zu34SHjInaeRouNfk2nMEGBCKhkcoC0BP7ijaWZ?=
 =?us-ascii?Q?htPRb2EZuGO9cmvONbmY0F/ZXG1pNuxFnu6y090TTGo+SzEnW9k/d+rzwLYQ?=
 =?us-ascii?Q?KpCtp4oQvkDtYTG1AwWVHzpejGaM/9Wmg4GoGF2VJinFNKvSv7COP+wh9PO1?=
 =?us-ascii?Q?Oe4gjyuMLZyEutXZUCaYmmeLWCUiQCV1N3PJRr8bIjgTuquee+0NdihDaBBU?=
 =?us-ascii?Q?wkayA5Xxsestwiu3oD8zLbXbGYry8VONN8bNfnyWhPLezFLKmxv76clhwYkm?=
 =?us-ascii?Q?gdT8JcfnzJZDLk9vFbbEHMqubWfacMjc5QWeEuaVt2I3MGGlHbf+wbtgI4+S?=
 =?us-ascii?Q?RuAxIjp1O5RZHcprsB7ZfhpWUrCOImMutDyaUThMU1SdvwbqxssAclJrNWIZ?=
 =?us-ascii?Q?/Z1Vpj9IrA6qv/p5OGAZsrDLkTQ+Qf2Iz/3/6e/OSWrLx5IGdRuxojnqxexO?=
 =?us-ascii?Q?XGttD8iJS922PMQTffqzyH+kilrdqlH0xwZlpvPozHxjp/FKDUjEySTbz9FT?=
 =?us-ascii?Q?Vpeo9eOHQZOrOLvA1SRrwbTSRPQimHhXXmzFnH39KWPb8eL+LsH5VUjGfXNl?=
 =?us-ascii?Q?Q3B284MjyedL7P8l0DzUzzBMCssNgpp6b5pAhdFKjg7YH5w5OzB4BaZaKkbF?=
 =?us-ascii?Q?1VK/oA3SG6XflwdBlYyj/l/Ri7TpFoptlU2FhOlWKcPfIt95sdMTCdrz9A9h?=
 =?us-ascii?Q?f9ykupJadpf/u0s3mhI1FAbQD6sF+QMJd50dcQo+kSSs//hLgh2B1WTwuItU?=
 =?us-ascii?Q?xtQPsri6E1HK5ddAy7B6+T36k7ZtaPHAfyCRZw9uPTZjfhv7OhRYhctUK30y?=
 =?us-ascii?Q?L7xf+/z7dnZaGx6f4VHV1EGKhES4edMIChfP37oJvKyiPbbTaAei6Wnb7+IV?=
 =?us-ascii?Q?iKE10zJwSW+0LiZ9tAhHImtUVgt/snIJdaUpCNicmxJL3OOmz/wZ4Jl2F4yb?=
 =?us-ascii?Q?YaksPdkrSEAjaE02dVS+U2ykgSpvt5LgkacsMjxI/BU11PC2mFgGuaWkn9VR?=
 =?us-ascii?Q?11GlQ+aMtJvEgQUNhNDPkrta+M9dH90hvPM4ZHaIzYHKOvy3Peea1Kp+R4y4?=
 =?us-ascii?Q?Sr1JZV0QgrnWaajwWRx8H9iTW+KcI5Z+BWTdxnVhMfPpAzCr9DujeAARQl/E?=
 =?us-ascii?Q?tqwQsaJZ6UsQ1m8C0Aos7xcRiWgF+FRSwGwG+c7aDDH1dqaMofFb73YEZC2B?=
 =?us-ascii?Q?15R+90Mm4cbIWQbhPiy4P/m6YyXFV5vFtValGisCB9xNrLcrBI6heuXvsehI?=
 =?us-ascii?Q?Bcs+v0L2I0qDcU8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ydjMTg/kPoUUKMP0gtIZFTKBaSgjPJGOyZAvck+kbOS7O0Q6uZWuVecRlzn0?=
 =?us-ascii?Q?+FiDaKbkXjj8wT/ddZ/19XYch3k7H0PDRjjWhOI+pu9hMGr6ebNXvbVhz4La?=
 =?us-ascii?Q?xYI4c9ltuP/33xM9wfGX/VdTkW5aNzDvsbquPwYoJXTTgYvhG49kKon3iXtZ?=
 =?us-ascii?Q?ZX7+s6FZUdeBCcq77jtabEyC5iNAfUjxPGViYiwPz+vea4lSYdv+EdyVmgHJ?=
 =?us-ascii?Q?TWFZwgGJoZRG44RmjZ3rJ5NvtaCEO0vI/DLDwQdrWvdkzLh6nzkM/EQhBe8N?=
 =?us-ascii?Q?Dw5tgRnO6Essq9/Itkdrmm/wyrPDJS9M53d6fMHBxgYnx2SHayZczUKkmjjc?=
 =?us-ascii?Q?GpL3vlVOybCUgsjrGZ60PS2wYkIigACO5T0QuC+gCMsxkDX059NyJhMc/7vL?=
 =?us-ascii?Q?OoHgq+UstXoLSTXYj3fmJgQ5+n9gQWSE16WQJ7HmmVboC/Tqy532+09EOAkb?=
 =?us-ascii?Q?S/MR77RJlyHZ1u5UEKkGRIi4xq2UJr3mBYO//AyF1w7KxxzH0UPXAbZLgFZM?=
 =?us-ascii?Q?usZCaqSn+AVpUNPJfzVhIUeCEEjthXfPnCnpaAgFV6wpZ64c0B7kNHNFmq46?=
 =?us-ascii?Q?jLUDXDPF0yo4zZiZnWqsq8pTnvDfP/l8pfgWsnXO7hnf/wZGLdjBnEr2guX7?=
 =?us-ascii?Q?jCXpwOaJ+4K6+Ul7Cj6g5iy+VJoVqVcJekOf63j/PgBNaLDNyNHD+/eUj2Ks?=
 =?us-ascii?Q?r7SiWMFYBKkJZOUCGseLf8d3GzL/zb5RzUZ0m3Y9Jwy7bzYH2dfdy3n17U13?=
 =?us-ascii?Q?maETPMnbG/DqxwcB66RFWEQZF7vXxLn4VJVLs7mP1y/Gr4y+nvsnHqfmse39?=
 =?us-ascii?Q?4bhWvQ5Y6Em/0KMqBY7aforAz8aIlvz4yvAukT+RpuMD4Z0XeRlibS9ROR9m?=
 =?us-ascii?Q?oaE9TtHPMyODGJCNKkIOusxkPAnARdZI8KBb1L/TPhD3KVjVdk5YxwZgW2+g?=
 =?us-ascii?Q?OJYoFTY5GFwoCEScVtHP9q3ZCoNZdpfbbqSB5GLeeqMUCNR2uVu4anOZRHJU?=
 =?us-ascii?Q?69m1JPULpg2rFPw3OkRAb2LjZqAORwwlf+sB4oIfGgKJ0vMkv6kzMWUe022w?=
 =?us-ascii?Q?O2m7BdVWOuWE9Z5aRN/hS7TgiO2AfxeOrBN9acUkTuU4qHZ2cGyE0b9XQ7Az?=
 =?us-ascii?Q?66rDntnfcXcIRass5eOaiWGzV3b4GjL3agK8gHWIQs96D2JF2dY/zABwe/gK?=
 =?us-ascii?Q?SlmK6VC/Fi4S0t908I3jWpP4UBWMcvr9IchvZtdEbLhbY1HlnjdNdnkcyOYG?=
 =?us-ascii?Q?W/Vh+NuOXveaLZDq+Jnmv3yY7M971iC9SBXALyLDSYu2tFa7uYHPIhKFe4a2?=
 =?us-ascii?Q?YW+ej+VEs1cvqA9R+vR0jDZB4lBBSAiYiajtfNlLyXuKmgNmtCDzMhR45qK3?=
 =?us-ascii?Q?h3JleJIkjY/whp6f9bBk9BGQOBzeMl4qTSpY9YHE4RGR8XNtynIpdYKmn/W7?=
 =?us-ascii?Q?xfs44gf3pz+o/ueZgEIaUNzQNt8qoqDY2Ca0xShoyyArh8Hg0eVLh+nAmNiH?=
 =?us-ascii?Q?d4c2F40TAnU5WtuKgZH0AKivIsYwZafQ+KlUC/scxaD+GgD0ar7JRsxB8wpu?=
 =?us-ascii?Q?R0I1HeuCWUNdDMdQ5ABXA7RS+NmFMSfKBzy0Fsne?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b83ec1-f240-4851-0737-08ddb3aa7600
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 05:38:06.1599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wTl2vJPF8mged4OU9k/hwRR/VW0ESjjHNU0yiK3CmgBYICFB9SOYfHNzlst6dO8AeNJDWGFZdXKn2sCSx/5Aog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7348
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

Hi maintainers:
Could you please help me review and merge it?
Thanks.

Shuicheng

On Mon, Jun 9, 2025 7:02 AM Shuicheng Lin wrote:=20
> Commit 37d078e51b4c ("drm/xe/uapi: Split xe_sync types from flags") renam=
ed
> some DRM_XE_SYNC_* defines but later commits kept using the old names.
> Correct them with the new definition.
>=20
> v2: correct fixes tag and update commit message to explain why (Lucas)
>=20
> Fixes: 9329f0667215 ("drm/xe/uapi: Use LR abbrev for long-running vms")
> Fixes: 4b437893a826 ("drm/xe/uapi: More uAPI documentation additions and
> cosmetic updates")
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Zongyao Bai <zongyao.bai@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> 6a702ba7817c..5f1524f466a7 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -925,9 +925,9 @@ struct drm_xe_gem_mmap_offset {
>   *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM
> accepts
>   *    exec submissions to its exec_queues that don't have an upper time
>   *    limit on the job execution time. But exec submissions to these
> - *    don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
> - *    DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ,
> DRM_XE_SYNC_FLAG_DMA_BUF,
> - *    used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGN=
AL.
> + *    don't allow any of the sync types DRM_XE_SYNC_TYPE_SYNCOBJ,
> + *    DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ, used as out-syncobjs, that is,
> + *    together with sync flag DRM_XE_SYNC_FLAG_SIGNAL.
>   *    LR VMs can be created in recoverable page-fault mode using
>   *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
>   *    If that flag is omitted, the UMD can not rely on the slightly
> @@ -1394,7 +1394,7 @@ struct drm_xe_sync {
>=20
>  	/**
>  	 * @timeline_value: Input for the timeline sync object. Needs to be
> -	 * different than 0 when used
> with %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
> +	 * different than 0 when used
> with %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
>  	 */
>  	__u64 timeline_value;
>=20
> --
> 2.25.1

