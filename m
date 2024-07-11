Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191E8C3DA4B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 18:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB84310EB4D;
	Thu, 11 Jul 2024 18:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkgUxdVG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D9F10EB4D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 18:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720722908; x=1752258908;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LouScm+iLjGrj8fEIyPPd8+8RH8nYG7Gr7nJQdm56Zk=;
 b=VkgUxdVGt7rDtA5c5VJ9ykWiZApmoxNaQFOTqPQzaecKI8PX7HPTQxJo
 ddxg0vswQ9/78fja1LNJ+Zc3/Xpm0NNYXDANYPos0trGHDCZpeHz7JQQm
 Fh/ww+XZ92AdnAZX8l2q29FCuORh0xYUm3kFUMdpbvrNKMAoAg2hGoEOo
 POUGVZX/KUUKQr08Q5lBPP048yizR5xWJhPCMABPerMCibYnBmFjMRprX
 hZ6ifthw8PGBK463+P0vgPZCgQnQEg1iR/SSlbPqjqhbhPVOdGp2aONQ4
 vmmNs0PbCFcEY4gGyULA2eKwsLZs9Wen3vXulGJuh58kMuKboOAOTNv1d w==;
X-CSE-ConnectionGUID: 1zOqIJcFTIGua/ayp7mzGw==
X-CSE-MsgGUID: Zq2GjGm8THW9KCb/wgwdDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="40656258"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="40656258"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 11:35:08 -0700
X-CSE-ConnectionGUID: fyf0Ws60Sr+zM9l3oI++jA==
X-CSE-MsgGUID: Lk4v+lYBTTugw1lrQ5Z/iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="79783122"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 11:35:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 11:35:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 11:35:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 11:35:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 11:35:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9X1ojgb5BlH1KSsNZbGy0cd6TLFsRT7PzpbZhwF0ND17hLtMsmg/zqhG/I1eydb6S4PvN4/2d4hPC7KG0PbT5LWJOpl8kPDy/2EUizL6QEmNlzLyzL2isuCZ/kuj+F4SHUxsdtRAZ+6CqpA5dhj56mai/aZf08QBilqNppMAydQukHfVtLFeFe5AcPzzB1JuikVbj4gOWwBXT61/ZIiOBYBRVDW05baBkgdldV5si5SHJOvm/0clRM46SKMvSS11TUJqjc26yi4GqVK1DXUWp/HVK6OssHi1tuEXY8fycZfEWoLxo7cAEoNEE8tr8TwLNCqd7NoIoPVRGS02nESdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9v/UXi8uOkMVYayWlkLAkuCARDcBqpj0uc0pS6IyhTs=;
 b=h7Yn+zPoKZzRM5cw+xkzGWAD6ydpulNQr8ewEvrx0u5jBM/mRsd/aKfMeo5z3qZEVvjosiWdbI0wcDiT2rlAoRG4mZMfNQQYdfioOAuoANzAkQ6GqEnUJBLHkuHj8XNXuFHGz7rvFHlqQkp8RhoM4kxG7s/Bq/U1iIgpU30uT0ZYcuvqAmWmy//SJ2SiyFU5m06WRn8XAz2J6LYcZQzUhkYxyeSfKj8qbdt8n3txgTvzEEWj1yskfndq9AAGAlnE7dyKSicST8URcYYm87WOGw8k/QZVtU1Mbk9KxQhLKl/a4Fios7Mkhc/8KcSCNoKOjAXcpp1/wqeU8ghPr10zFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA2PR11MB5052.namprd11.prod.outlook.com (2603:10b6:806:fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.21; Thu, 11 Jul
 2024 18:35:03 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 18:35:03 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 03/12] drm/xe: Remove unnecessary drm_mm.h includes
Thread-Topic: [PATCH 03/12] drm/xe: Remove unnecessary drm_mm.h includes
Thread-Index: AQHa07WU2yBFQ19OfkaX4OVF0jAvwrHx2OXQ
Date: Thu, 11 Jul 2024 18:35:03 +0000
Message-ID: <CH0PR11MB5444E0CD1B01183F3D20B428E5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-3-rodrigo.vivi@intel.com>
In-Reply-To: <20240711171155.173717-3-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA2PR11MB5052:EE_
x-ms-office365-filtering-correlation-id: 9e821444-d455-4bf8-ac1b-08dca1d82ddb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?YJsEhaoCUZ8yXniKe8rCERQAbsRI5e0/MIJ5bCpTd20e4pVZiswhf6G5kPuQ?=
 =?us-ascii?Q?j9I45eh+vRYDs1iEM2TdaswCeRn9GzHukTkvuNcucMuSIq6g0O3j9koD3dcT?=
 =?us-ascii?Q?ROqQHoIlWtolPhX+F5LBEsB5z9HIozFLocciH63Dm1DibdaIbGJuZZSZPwRs?=
 =?us-ascii?Q?OsYKBZNKKWVtqzIsOgBoS7FuGoMypqBIsH+Je5qgqdJfZJ1FGL4PnxjSLFw8?=
 =?us-ascii?Q?hCu315FgR3kRrC9yU0XmW/DG++jsiE5ZFXDsuiW7HyN/jvIbqf2VxoHZAL/Z?=
 =?us-ascii?Q?Ib+u7Wb5fhhtHErmjD0g5yBTQz+hs6Zu55BgB8+xCbKONdPL7oN/mdShdKv5?=
 =?us-ascii?Q?/U00bgO0Hjz0HuUigbFjaMJ/fmM5A2c4/D+e1ZhAeudNBUfH9bj+EoG602wb?=
 =?us-ascii?Q?kEWUPvlo/pNgbtb626/X4ktYw4XHEaOnw0qpiryYJmqzO78fUsGJEylQMnT9?=
 =?us-ascii?Q?J5A3Zs3QdP3TUqpBzrZ9cl9rOddtBT/ZuWa9fGwLZHs6FpGb5EPiaKgjYQ6Y?=
 =?us-ascii?Q?DOnzD9oWOSDPsj13Liwgvrk5DOfRoM42eV87uU7chL6ApTIMweRwCr4HS5MM?=
 =?us-ascii?Q?HvbMT6MDIBCQ7/eFtd//PkkBosOtpooeR3IJ3BiDR0bJCmSjfKeB3Gp61chS?=
 =?us-ascii?Q?2p7zrr1pZq5IxObhsk9NBxfdsGCLglFv4nGCx3mMhalRJKJZsRG+hEOou8oA?=
 =?us-ascii?Q?6hsR98vr095TSxFjOZltJIQfehiadQEMHWdiySmsoacEXpiTTTf4/nXa5Rkr?=
 =?us-ascii?Q?OmVDTVRSmyLH+daKuTze5dEMB9h9dl/epxi9+9mxfBT+vNM5zhkKDqVqI+9E?=
 =?us-ascii?Q?DwVST4GSr0I2liM8TXvRzkT8tUFbb5O51gzTRNa3Oqit0bQadZ8D1+7VQN3e?=
 =?us-ascii?Q?4yBRVQJrhWevCIf5DcT3QwrXo1eTJhhBzkfZ1Jhc8c/mNoAZ8P7WpBGVxbQd?=
 =?us-ascii?Q?r86xgZc0cOYtU9fEM1eh1wsDu6pMFI59ufNum5NBACrZdRt1ZNBsbf4Nmr9B?=
 =?us-ascii?Q?sRgMaAv4rCgGTFTeijjiEZRU9eI8vjlUNWkf/BfndJEc9BsBadgGwF9/LD8d?=
 =?us-ascii?Q?GmPBH27hcyMLufOXDHc6UqW77HZWRdcQHgBziibz6RjhMLS2byhDPJYZ5ZEH?=
 =?us-ascii?Q?P3mJRLAWApvRRUj1jNER0cCBnHXWLjYwrdPspeJzNOZHcw79ywLSs9An2Xpf?=
 =?us-ascii?Q?YA0WiBnnn2KXSyQ6Dcnz9Y4r1ig6Ez0nfZicsMP/dAAjx7QcsvGDje2OYt6V?=
 =?us-ascii?Q?XTmAF28Eri+i7j1aEfL8dTZEokZ+94MNjgQlRFNvgMo2044+t20En0RWdHab?=
 =?us-ascii?Q?eRskWe9XOfsR9kCvCQBSrN4FaQ2o49rDV8o45UqHHQn7yu0xTQaDZVhIDPqM?=
 =?us-ascii?Q?XTp9HdXHcS2OerztvkYK48x6xb2zIZZqpor8aibWUxtEZBW6aw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MSSQyO9n6GaDutm7PyIzFGHhYbs4RO9lltM4/aiMImsQPbt1oixbcJxQbmWE?=
 =?us-ascii?Q?wgeD2YIyOn+PJxc72o4JxWNgUN4VqU3zOEpPfp+Hc/vUow3q1Tle+GWvzqzc?=
 =?us-ascii?Q?Ick16Y3TRPh8myzLYQ79mK/4rnzSxoe2qjUHfqnSzlrQAXvBTxgBCK1eE77+?=
 =?us-ascii?Q?6ApDETtIXkv2dkJut6Jy4A29eohs1WcOqbTVhnO5wkUyJqmGsxgPWaeQfvW/?=
 =?us-ascii?Q?naNfzO8OQh3gLRL/z5RAGh0Y/BuCIhmtb/Ypg60tqMrnmvI5dvCh+MHWma3T?=
 =?us-ascii?Q?Spwvqz6KY1TawWbw6RUtjM+ly+d5zCB8fFqMdK6pR4sOCu1Ig2MU3MoeEo/M?=
 =?us-ascii?Q?AFdKOAB+m2tLxhfleF0Foysr3rbaWNDuH+Qe7udRFY1+qq44Lx+Ajiru7zKv?=
 =?us-ascii?Q?Ym1O6jFFVriAuHQo4TH+qcZcOk/dzhZUtzD5WBbkmtmdm2yXo8Vi/E6puabg?=
 =?us-ascii?Q?uSUol44tEOM6dj5MfAug2OSU9pq7QxLoNAPysE72l9pE14hpix9p6imoVXVF?=
 =?us-ascii?Q?7d4gk6+OCIL87STC13HhIuuEsX46jkvts+rOZHrwp9hjRvyS4cQQyweLaZxF?=
 =?us-ascii?Q?He3JSG3i8H2HAsrFTloi8yCiXJJXBHw1rV7GVs7JCv7yKvP71S/1WMD2vqTy?=
 =?us-ascii?Q?yDi+yFfVBLKeb9yolf2t63HbP0r2mWOp+7d08t/hiVWDgOc4XZ89SVhv7+Zc?=
 =?us-ascii?Q?zPBK7Pmfa6XMlNFPLVh/hT8SNIw9cT5Vzge0iMZK237Z8Vah1c+4DnLWgn1q?=
 =?us-ascii?Q?7EsVjbki0hLBBKcL6Hi9d0V7HIep14u1Sfr/Muc9Go4A5EvJv041pOmtzWs2?=
 =?us-ascii?Q?RsKeTWha5RPhF6h5MhkXcHq1zUck4J/TFjVzcsy8HE0Q8S//ALoBjC2/WOBU?=
 =?us-ascii?Q?KWO7FMnlAbV7s66NuLieErmjgG+eDoucJmp6v+goCQ8Woui5yGEw7ZBJkwRB?=
 =?us-ascii?Q?BRyEJVQiFxdY3MCu1R0ixAjkPofMHZSbWcDaoYfVNB1c2Tvv6Xw+jN2h2kMG?=
 =?us-ascii?Q?P7byOQ3uDKeDd9DuN8DkZ1+5zyKKiGXyWDMCXlNzixJ9tdIsRH+BgVAXb9GS?=
 =?us-ascii?Q?mMfwIjqamAgTjB0KgJBDfDeuUnMPoR/G94adX6crRikdHEIrSjp90xf4j0PO?=
 =?us-ascii?Q?j2eIgzC1CSXmkti4fcxKZB12Fg9GTNnJFJJcWF903Q6IbUZXfU1uuGyJoIsz?=
 =?us-ascii?Q?vrKiYHl9xxzOl/Dez+59vYIX/dzPDnP/6gAkuDdrGtdp36Tn1LzknAMoD7p3?=
 =?us-ascii?Q?kv77+Gr+Virz74I460jOi70Pe5CVR2dKh4uIC6G+YzA6t24C3LxU5Z//Wyyc?=
 =?us-ascii?Q?r92752fneuk32Rh6HAYGo0TAs3EojBK1RFmXosVsmsKRBCOHvKo3rE+xGRs8?=
 =?us-ascii?Q?kDV8Rl2QpEr+8xlcP6jwpRW2vjK5wyktv7vK9cGtgljLTuKNO1kG7pD9s5pp?=
 =?us-ascii?Q?LRgl45TAP4QKY5uIVmmqUm+QoO1r4m6kBd+QxY8znPUjqaObhfYCGYNbSLxZ?=
 =?us-ascii?Q?wRz9aClnQA7Vc9oqKMDEG8uSYDbJwRmdm2TFURQs3aKz+7chH4uw2azzup7L?=
 =?us-ascii?Q?iBXH2+Cliw5K78ItsFZUpIfE9nyEYxcYDprwf+Hg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e821444-d455-4bf8-ac1b-08dca1d82ddb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 18:35:03.3852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1qJPaZDGzNsaTlgpzaPLGer+dJKORkwLmJ5r+TWCT7PbbG5etU4BmmuT4VFD7XCxW/ltn5OIZq7CkSvcP/puuRU/hhRzUB7w0jCJUJYt5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5052
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrig=
o Vivi
Sent: Thursday, July 11, 2024 10:12 AM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: [PATCH 03/12] drm/xe: Remove unnecessary drm_mm.h includes
>=20
> These includes are no longer necessary, and where appropriate
> replace by the linux/types.h one.

s/replace/are replaced/
But otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.h        | 2 +-
>  drivers/gpu/drm/xe/xe_res_cursor.h     | 1 -
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migr=
ate.h
> index 453e0ecf5034..f2af9355c051 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -6,7 +6,7 @@
>  #ifndef _XE_MIGRATE_
>  #define _XE_MIGRATE_
> =20
> -#include <drm/drm_mm.h>
> +#include <linux/types.h>
> =20
>  struct dma_fence;
>  struct iosys_map;
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_r=
es_cursor.h
> index 655af89b31a9..dca374b6521c 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -26,7 +26,6 @@
> =20
>  #include <linux/scatterlist.h>
> =20
> -#include <drm/drm_mm.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/ttm/ttm_range_manager.h>
>  #include <drm/ttm/ttm_resource.h>
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/=
xe_ttm_stolen_mgr.c
> index f46fd2df84de..f7113cf6109d 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -5,7 +5,6 @@
>   */
> =20
>  #include <drm/drm_managed.h>
> -#include <drm/drm_mm.h>
> =20
>  #include <drm/ttm/ttm_device.h>
>  #include <drm/ttm/ttm_placement.h>
> --=20
> 2.45.2
>=20
>=20
