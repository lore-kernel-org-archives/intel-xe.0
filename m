Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61756CA0EC4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 10:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E43910E5D8;
	Tue, 12 Aug 2025 10:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jr7BFjLe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0EC10E5D8
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754994202; x=1786530202;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lLhBfs/BObdDaW+z1LqR7qXgo0lTQyxD2R2c/sRmzo4=;
 b=jr7BFjLeVPzt5Kto/n+ms3SaM1Wdl1nNiXveJ2WN4+kFHAWIq5jJ0cFA
 Cf+JcH/wgk3MRd8ShFtHs5poimkzrOlNgWRxLS5lBiTVQP2ELQDfSSZos
 7yyWYN+buaPns6zqsVPWABAh95coGJMwqdE5WoRC9+AqiYMv8pVdfxL3Y
 RJGTeqOQqL9SBpdGN+e2EBY7ktW1CCkulkuEQWUjxEvf1krzP5zzgGQb0
 1r3hD3LbudVmMa6C4YcGyoumiL10bpeuPM/yfjJwHTC8dstHzXKNPHDhF
 KV2Y2Lhn+KrW71a9n0xMhFA4Bv9VLOihMAzEqXIZ02vo/iUU2nO6Paljy A==;
X-CSE-ConnectionGUID: 79ncbnjDTsKYoNVFYMWQvA==
X-CSE-MsgGUID: SvLLiNQjRx+xy8AHo7D6iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67971453"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="67971453"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 03:23:22 -0700
X-CSE-ConnectionGUID: t2e0oFjRQXSIJTNAMa45VA==
X-CSE-MsgGUID: IpgO6z6lSUKRJON9rl77ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165663555"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 03:23:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 Aug 2025 03:23:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 12 Aug 2025 03:23:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.73) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 03:23:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyK2wtZGx9PLoNK2OqAExfQBXMbpJHESD3QG7yd5zA4+ocmiJk4ZnXTC32a3jomjuySAVKjXptZ6KPdxNAwLvz/AUxgBfSnBjM9vS7boFEV075D6IJjBGspguMHpqRy4OJn+t8SRlONdaJCnI0jLBi6e4El465gC09V227Iop+5cS2zymP8dS4Q4ztwphxsv2D0O/n6XsFD37eO/fNM93VylvF+EiHpx86G9Gg+SUrtIljsjIuksjBSBjjmtys8tDh1kQPPZE+gHj8DTsUGGs8zpDnmNi9v/jBzS4lUXrhc8sMIu17tO8FBXV/SZ8C2z0trQnxxjw1GvQz7s5PHKpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBvANlfxvL3WdN9WuDRK1PEWRWdSFNawk5E3y1wE0QI=;
 b=hNn6c6cX1xZKd05wkovimZoIPV/aulorK3czgCcdWacss5b3H9nYmvikh5hbpXR/FvKeKIcKg31cBe/eCY1OwM6fFIk5B3fTg0KJePacC0CYObYDOrLs+GX7IWcycZso+DUtq4scNOX/T2r49I4FbyEqGl45yz5eCcO5UfTtFe3MuowpqGgIK+31+sTr+h2sMZtAYfkLtyNTyyPO8KuyghaD4eLGncDjpEljn4JzMaiCtC4o7b4vVAd6YF7+7gzDRCILDvk+gPHQMzBwTrSFT/C9bhRlsU9DsrhBnonxo5iGR4jVjJ3GzZ/ZYL0MdMKXTFgod8g5UU/uyw169L+h5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by MN0PR11MB6060.namprd11.prod.outlook.com (2603:10b6:208:378::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 10:23:19 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%6]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 10:23:19 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kumar, Prashanth" <prashanth.kumar@intel.com>
Subject: RE: [PATCH v3 08/13] drm/xe/configfs: Use guard() for dev->lock
Thread-Topic: [PATCH v3 08/13] drm/xe/configfs: Use guard() for dev->lock
Thread-Index: AQHcCIohJkmStC2It0WMyFkWwbuBbLReyoTg
Date: Tue, 12 Aug 2025 10:23:19 +0000
Message-ID: <IA1PR11MB62667CF4B56B35417C6F33F6E22BA@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-8-a111e9f1e4b7@intel.com>
In-Reply-To: <20250808-psmi-v3-8-a111e9f1e4b7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|MN0PR11MB6060:EE_
x-ms-office365-filtering-correlation-id: 33bf15a5-05fc-49a5-12ae-08ddd98a4209
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gsfYtEu82oPBJH19fprm1YDFbYkftAc9EB3EiuiGhLxhThF/LZocv4zgXBM6?=
 =?us-ascii?Q?v1vYulloGx4Kwb69btwWV49JqSYHv5qDGnLWqad0q4zmRgHIiG9ajDkgIEjR?=
 =?us-ascii?Q?a3BPe18Hk+KrE+m1YRrUvm89RwacTWLI4Bf9EWmy0FMtSTGsoIQJiCEXOZQ7?=
 =?us-ascii?Q?d1nZrGDakivzCyjY5Dqen1QTPVSC4DFRRYoAAf8rMHtlDL552OMtvVeCzgPs?=
 =?us-ascii?Q?L2JvqowAoxI6FulrsMXSzpYxVpx39GANNTT1kNcjIqEQCOd0tJanqvWNhHAb?=
 =?us-ascii?Q?7IZusqd4T22tAHYtaWmQvameBKjnoyaoCG+o1gmyRm4mexiJ9VNZGpELda4s?=
 =?us-ascii?Q?uBzZ8nMVoRHzg4/QKFW+RwMO9GaFdtWIXOwI5/OUwodCjqz1Vy2KxMQYqkmd?=
 =?us-ascii?Q?Z8nmOJI4dMB3py0OCc7DAxPewIrZjrG238asG/nDFxr0n+D7jVnFc3Q1lGzr?=
 =?us-ascii?Q?jbhXlXLd/pix/afR9REyQ/0IPGLmSloCfswMxgHW8n+9rtiOjd/1GYjersbP?=
 =?us-ascii?Q?Z3wLPDuV669OQZ59OHUwM4WjoDGD4AGE75b7SXeE+iXh/0bsPyw0fc1grycm?=
 =?us-ascii?Q?qauake+FIIJ7X7Am8MH4JhBqB797O4kX0ICpZr8Z139vMQBDly/t8o9FGX4b?=
 =?us-ascii?Q?OPNMHldusTiVKAadmIX6ySCSetUVImcnDh+4tvoqfrzVBNgnV0niYVdHVavk?=
 =?us-ascii?Q?24TIQhqqdneVhggRi9eksvaIAgTz+LPJFhv0fYeO0ctGSgikdY+KE/FPm3F2?=
 =?us-ascii?Q?/ftYn4+L3M7xV9ly5TyMAiQWNjnrOtygnp0WdZJGFHQy3F0LV6Tt78ZQQMBr?=
 =?us-ascii?Q?Tqe+jOLnIwzdtipdi5sw5mW8Jqtw0QW/5kav8r2T2++XGXU/lS4XzoD61RMb?=
 =?us-ascii?Q?BDaAU/s6mjvNATW6hMDza2qJqBr9+V781v5c9ztc+mWaRvmdn0S2rllFvGYz?=
 =?us-ascii?Q?wD2oDKzBFKLS3WQxIU9LWccono38L1oEGUFmHcgbBowff7URd9uLWEJpRKMJ?=
 =?us-ascii?Q?9B9FuR4oEWaPIL4R02kR0RWYzxgo0mk7f+DKUTJ6y4ixhjzIu2neQ9WEL6yS?=
 =?us-ascii?Q?stuWWFAxTuawAn95V5SQkxp8pa/t5m1eruFMpWmO/AGhgYt9GBdYX6z4Ctof?=
 =?us-ascii?Q?802zIM8KC4TLj4EFADx2Is6hXFyT4tiPOK1iKBdhasZfAp+sL47sl52O7Rvm?=
 =?us-ascii?Q?qwybujQdjOjFo+2psHUoVS1W+Zd/j7dV1QfiQTCwWwvSBCt7IKD66MAisn9m?=
 =?us-ascii?Q?/5Vr+6zPMWXn/jV7pfv0d2s14//BU2hhQOoks2KfMRacdGJXH528rYr+whbE?=
 =?us-ascii?Q?DTSU5uY38ilHrT/hYPRbFDAe7Sf86iLDs48UHWaY7Czn3KGM34FOnNMCdJjI?=
 =?us-ascii?Q?ihhvXxI681e9K6f/Er5eBp/4iJef4CZn6N8fRfyCjuY5BA0KbDso4n03qjne?=
 =?us-ascii?Q?GFXhwPdxteprZ6/Eh6cwMezOyauP8y130OnHF5hQE7F9cniCuQdrHO1+/PHP?=
 =?us-ascii?Q?MVld/7GdyEXO/mI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rHilCEPjCCbE15gFVQNtlhWnkLKhsTuP7w5hhARkW5+RhWssvCq8hCPPomoX?=
 =?us-ascii?Q?GjhFopVnj1ox1Sl5CXrMiYBwxYQ5wGEJXxeoitZpU8JjDEIVoYU+5nGZMq5Y?=
 =?us-ascii?Q?TxEEzxwjYPeiWZnkD/ih0GtPXOjN+mJaqxJGNKtQbFhnx+9bmQjaWHkaoFd9?=
 =?us-ascii?Q?FJguA5P51wfwEKnbyrTXITMLjqKltq/+OYsmEPsQnoXmQ0YSagQjsQx9m/nu?=
 =?us-ascii?Q?mm4yKU0CUu7aYaH34P8QBhnNJcheu3CaFQ59Bp9I8/j0e9n4wzKl2anboFbQ?=
 =?us-ascii?Q?piDhC97HtEgkbzaEvLgSvk8A5Sy6luqQ1Huis/glTkZnxl3/Q/jpYpwDmUiT?=
 =?us-ascii?Q?wl8WHeQn1Oapf5KVIR+qWVBi3RW6kYtg+XC1LCsjlkB63o7XaPL+Ez3Dfcpb?=
 =?us-ascii?Q?I9cvgnxl76bQfVSgejHIn6wgHbNTetbs1Wsh0NPsgADYSZDuJZZ50Pj2s3z7?=
 =?us-ascii?Q?9hvY8eQzM2IMSRwhVUEAo2F80CfDPn6I+9l6gpz9FgqGT6WVYHMg5y6h8v7c?=
 =?us-ascii?Q?54KswjOx0tYTWjmcjddfkjrt4X439pck3uNx0j2rTaWf2gUg7vyumICK3p70?=
 =?us-ascii?Q?t/Mkd8qNbn3yUjfNeGm9pIfvPCVVSrur1+mPaFjwNaBqnGBtU37gus32t7J/?=
 =?us-ascii?Q?yR9x7SUi6Xw43E/nUtzDhaRKF5splspquWhuV/JwXX26xmoKaIZ41sAMZGqx?=
 =?us-ascii?Q?NV2zSCjq70/CpDiTuZV2sf91eYKV3dCCxh+1pExdu+hXrtUN2nJJ89WN4S7T?=
 =?us-ascii?Q?6DlnsZaqqujg1oOpBBCnF/PWlcueGYk8kGIRXaWKA7IwKLAr/5vNShg7ZluH?=
 =?us-ascii?Q?NQt79r1EeOwFvl2zXvUZxB7DlTUJnrDeO7rm74ZlKNYhX8I/4W7qSb1WkrpO?=
 =?us-ascii?Q?AZv7OTYB/mRgrFsbf5mVASzTzKTf3z+4ORHaKMZJy4YN4qUnQQoK9DbKNGgk?=
 =?us-ascii?Q?NLugz1/9A0gW+6VPbNDdOnp1LQByxX3ShhUvT7wT6hTmfAUp/mtyZEvJDK1T?=
 =?us-ascii?Q?FTJI/zwSvsRnQX0AQaMndUZJ4FKyYv2ySA617Kaqj9UNLiDJxs0TvaTgWFH/?=
 =?us-ascii?Q?afVgvZd6WWTunoe1kNijOuxkQLzUmlElBgKYD6wdpxoPCBAph6ByvenilnKR?=
 =?us-ascii?Q?mFRaDHGK77szbmm2skZ8NnlD8rnPaR6++Jiee7ISwTdyHg7fboXQdRcbSQKO?=
 =?us-ascii?Q?B9fdJKW2DLBBbP42mqiKrkmXC/unrhGR6Bjmu1EGSO6LdHBshRQNv8dijfEL?=
 =?us-ascii?Q?MnddCuSJS+VcFR2k9tXNKIRZWAL7dtNeH2RSgdNMh7upnNol827OPOFPLxUV?=
 =?us-ascii?Q?3od5+AQS5k3k/mDMO1VHfheGQmMs0aui6jYIUo5xLumiNdMbkcP9Nbt55fgU?=
 =?us-ascii?Q?DwoqdyIjUafCC24B8TbwdK73CaTusmxWUQOrdAIglGTk6IFbhibiMo75oGxd?=
 =?us-ascii?Q?ZVl6FkBxM5feMNxfJYU+8eA4vDyw1wEcvdbILEq1/LdXlD7tHvlpUM4hlvBd?=
 =?us-ascii?Q?sbAfFl+qGo2vkAcPLrQ6MtZkbsRiUm7l6K8x5Dn8hkPkHoOTFP4srPAqh1n4?=
 =?us-ascii?Q?1ToHVP9/hYd8UrL+6nYG1qx1CPMV7cdg35YkD53eXIKzx0zRew1oXZ6rqwvY?=
 =?us-ascii?Q?Kg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bf15a5-05fc-49a5-12ae-08ddd98a4209
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 10:23:19.2723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f/h8B08ghWYnawoYnzL01qOSfN4EA7EbO4yXrCqIfUi13YYK89wKgZxDQXdmB3tbUDgnWEBOtuERpCHbID4T7QKOuZwQONQm07/n2E4apGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6060
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Friday, August 8, 2025 11:00 PM
> To: intel-xe@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Kumar, Prashanth
> <prashanth.kumar@intel.com>; Bhadane, Dnyaneshwar
> <dnyaneshwar.bhadane@intel.com>
> Subject: [PATCH v3 08/13] drm/xe/configfs: Use guard() for dev->lock
>=20
> Instead of the manual lock()/unlock() pattern, use guard() which will mak=
e
> things easier for handling errors or early returns.
>=20

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> b/drivers/gpu/drm/xe/xe_configfs.c
> index 8cf6b1375b7d4..4c2d4ff6a70f5 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -5,6 +5,7 @@
>=20
>  #include <linux/bitops.h>
>  #include <linux/configfs.h>
> +#include <linux/cleanup.h>
>  #include <linux/find.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
> @@ -164,9 +165,8 @@ static ssize_t survivability_mode_store(struct
> config_item *item, const char *pa
>  	if (ret)
>  		return ret;
>=20
> -	mutex_lock(&dev->lock);
> +	guard(mutex)(&dev->lock);
>  	dev->config.survivability_mode =3D survivability_mode;
> -	mutex_unlock(&dev->lock);
>=20
>  	return len;
>  }
> @@ -248,9 +248,8 @@ static ssize_t engines_allowed_store(struct
> config_item *item, const char *page,
>  		val |=3D mask;
>  	}
>=20
> -	mutex_lock(&dev->lock);
> +	guard(mutex)(&dev->lock);
>  	dev->config.engines_allowed =3D val;
> -	mutex_unlock(&dev->lock);
>=20
>  	return len;
>  }
> @@ -272,9 +271,8 @@ static ssize_t enable_psmi_store(struct config_item
> *item, const char *page, siz
>  	if (ret)
>  		return ret;
>=20
> -	mutex_lock(&dev->lock);
> +	guard(mutex)(&dev->lock);
>  	dev->config.enable_psmi =3D val;
> -	mutex_unlock(&dev->lock);
>=20
>  	return len;
>  }
> @@ -454,9 +452,8 @@ void xe_configfs_clear_survivability_mode(struct
> pci_dev *pdev)
>  	if (!dev)
>  		return;
>=20
> -	mutex_lock(&dev->lock);
> +	guard(mutex)(&dev->lock);
>  	dev->config.survivability_mode =3D 0;
> -	mutex_unlock(&dev->lock);
>=20
>  	config_group_put(&dev->group);
>  }
>=20
> --
> 2.50.1

