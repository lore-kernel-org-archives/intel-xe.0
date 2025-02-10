Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26083C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 05:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C076110E173;
	Mon, 10 Feb 2025 05:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="misnfVhZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322FB10E173
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 05:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739166766; x=1770702766;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PTr76Ix9NBFSeD3Ge74x0kG0z/gxShBr907YDyOzTZo=;
 b=misnfVhZ371knOPCf/fuENjbZ/ZGv2zHxyjHH9YO1pd3iQU9Cq6v+R+v
 LzThHfMCFa2uVkzlqgsD2+n65Co+boXe4uHlLt4I6zXcOs03rmW2V/z0L
 9aYCJRQyPCM8upVZCVj0EswXbsmIdx1kKIDCkDQh2dS1b8h7gcwsGJIbj
 wO1dCdDh93hFkoeJiYjyxWvuIfK3QhPEsZgOUK5Wh3l20egNm4obH6YOa
 Au+ufyR7jHWTOCOxX6dSqVzX5MUoveuScsUKEblMXz8jGy7PhevfL5PWT
 fC+X8LeU2R7m62L2Qy3MMOF7/8VhLS/9ISa2pe322HfR3GL/grgiBMtZH w==;
X-CSE-ConnectionGUID: u5z3BUegQ7u7uirRKRwEHg==
X-CSE-MsgGUID: OUU9S3qmRc+TIayYM4QJKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="51124362"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="51124362"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 21:52:45 -0800
X-CSE-ConnectionGUID: uOhlffweQvuElr/ImByP+A==
X-CSE-MsgGUID: ZQYjiC/3T2iCi0p72NFNfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116161059"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 21:52:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 21:52:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 21:52:44 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 21:52:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENahCfcXh941Ehhp2hPXBneDsFOjukLwQLYSssISAnLJ6gXoTnkiwW0Pzt2tsK6mr+aDC0ICsmm+Yl5lG/FeeuZlcp5VMS7MPLaRIbPSAcWkLzvupXLAvFqiVYWBtpAhF4KiVIUrYUtXiu/3nXh9f0jsQWS087XgT0+D7XNdHLtTXafGMMLp+w8KQXqGr4Je7X+qyfLELICdesF+mg4XDs1G2xwN1cp9m2pAqkYVeV9wGckaxBEQFOpT9/ocwrvfjH2n/33HHl/QI3BADgbwtIdPh6DGCsBSXe5p1d9lhFyqRRV9uXrxDhjx7GRoYHmaZpOXxS/LpZ+NTnxfZGIWMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwMrZD7QV9NuGwX3XNTlx2VJL/ovxje9RG/jr7gsJVY=;
 b=FotwOlz0/62YmPzxPHoCVzmffF47oDnP1xKlyQDayTd+hgEIh0z05VqouTfrvkMsyZ/pv7XBH62c/bpFoqEZ/VNMtrulSdd0yNLWPhaEqUjgaIUMgL1HWXTp1dcEMJfehrNvPDCVFoRcrTaCBm+AAVdIbVbtFyFmmake4Qgo3ow962Lv7u4KcX4gMr3ju5sJMTfyxS7lUZXmxwUjG5IDigndjCkgIivbbukFo84kD6zs4gUAq1hayiR6JVGDenOQ75gp0wRJmRnRf+nobwQqLzOMBuKaO3p1A+1OQdZWyTlF0iahK05ULEZtgGhMFXuCyVg/hlSmsP3svt/gL/yKbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS7PR11MB8826.namprd11.prod.outlook.com (2603:10b6:8:256::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 05:52:13 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 05:52:13 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v3 03/13] drm/xe: Fix xe_tile_init_noalloc() error
 propagation
Thread-Topic: [PATCH v3 03/13] drm/xe: Fix xe_tile_init_noalloc() error
 propagation
Thread-Index: AQHbea7Igu6eNwBlWEiRw2J8yN8rebNADC7g
Date: Mon, 10 Feb 2025 05:52:13 +0000
Message-ID: <SJ1PR11MB6204BD835AA0EC502047AA5181F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-4-lucas.demarchi@intel.com>
In-Reply-To: <20250207221945.2878241-4-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS7PR11MB8826:EE_
x-ms-office365-filtering-correlation-id: 7e219fa4-4ad6-447f-b8b7-08dd4997114e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rowdxTKIS/0FwUZKfTV138AkNcZCmoKz92Qe6qfWB19phm8hNqiKd1y8Iovv?=
 =?us-ascii?Q?8sEkqNxja1SUgGr/34Arl5o18kPn29qmiQCCxvzTvMe060PWFpPNqg75mEaT?=
 =?us-ascii?Q?aiCuzUW+feYLydIcB+3u7bte/mN8O6MjUQ+3DpkEozcTaDUTUvYnvCJXt+EW?=
 =?us-ascii?Q?v04XwIeRH/Z3KOdJeIfu43LOQZJP0j6GpyKdJ3VyCharMH+baQ6PpJA0j5Za?=
 =?us-ascii?Q?yCVR84xMWoy1bmBekxGjUqbYWOo0SpcIibFkWsxizLTNS0PB37coJB7yUfJ0?=
 =?us-ascii?Q?7NlPV/5B1HMnUReiSPPtdv26LLZG9VrisJtjuelTpVzkPFgK4QB1E5rSiwCw?=
 =?us-ascii?Q?n3ozr37H3ptHQ0dCRMGKrO9rAs7pGDXFQYMyIlDRB7Qz37mBWuaNEIXTJj+7?=
 =?us-ascii?Q?Y2z1vT8vsoAI6L1iZOtAXFIlL6osY9A+IgyoIQGdnIPERZFNWUaiT8PRqSTt?=
 =?us-ascii?Q?7Ah03hCs0f7jClZpsX1J8y3EjMq/rIKCiiFImg37GJVGXdRqY5zY+LDWIXYq?=
 =?us-ascii?Q?W3KOeiXoQaFrVb9v6eCND0BrTfrv+g6tZ3ezyss5Q6x5MhHpCYVSvoDpUhuA?=
 =?us-ascii?Q?sJuxSh460yHxs+/hQDdbFqi6Eu+P1LFznY02VkMveqNPp0FZcCY6I73uNQ4G?=
 =?us-ascii?Q?jLKnMr3sS6suEu5DRQFesra/GcU7jUYFNB37y+BiyK46RtJE4MshzX658wPb?=
 =?us-ascii?Q?RTZ284F8A7/1/B3LPLonfutdYMYO34n4BodEGRkVCBnawMGOcoUG07emJMwN?=
 =?us-ascii?Q?k+pKFmV4rR+H7vMTu8gxrOYnlsshENKQJX0qwnbNk90cSMgiziP4AV08sWS4?=
 =?us-ascii?Q?Qn/UoPImuZMFP9MDpE/pOBTqZj00tLLfywlpqxtCcejb38bxc+z8IIOwY5Yy?=
 =?us-ascii?Q?WVxfu9yjFlb47YmwRtnUAF/bGUVXwyv6BscW63DX74PMyi0alRFV2P+sS9mr?=
 =?us-ascii?Q?S9AIB22ija79+n3Jf/IkHhIVGBatoojXwElYtuyoM8cNYm0Kl6qDVd4bk5sM?=
 =?us-ascii?Q?BansVOyHQMkWSbjV/qd9wF+kLr9l9DVF9J9H1PQ+/W73YmkOpO8xpCpy6fYR?=
 =?us-ascii?Q?Idu1vNzFur9NjxObTXZLJHeQ28zIgyIoiQex02HPupkL+QyuaEIrGNddd2N1?=
 =?us-ascii?Q?jQt6Ne2R5bPCgGSmFEXztTCgKsBnFTN64wbXTG3JPo0QcwF68ATJC/wHzxF6?=
 =?us-ascii?Q?hXD2fPLuweIjuco3F9df8uLxUAQV7EiVlafgvmgL76fbU9X6AL0IB3DPbWtN?=
 =?us-ascii?Q?wjkuRULuBy3uUSleH0/uSV472hseXWlKryWpq4SnM3ma5Fd3p6x/oFMRZtup?=
 =?us-ascii?Q?efepQdkDBpoeZ6DNhu74zL+yINFbFkThywnYz6Lpou4Tu6H4YBGFEkyTY1HM?=
 =?us-ascii?Q?LkZ58WgfXnGih88I7nkr+fRZUCa8IOsLPyDrMtahQ27+EtzEBQSnoL6C+K+T?=
 =?us-ascii?Q?c46scI5L9OSjiKnHJH0flYstX2bjI/yC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eiZrRUrFsZpui7+5TiA1pqHgkjQIYMZ4wjWXx9TPt0emE+cDMCi7ryc3B7Wp?=
 =?us-ascii?Q?1SbIA0a/WWhL9bODJVJbvc+zuexE22s21RZAtEIS2pukf8kFEShZgZ/iOJDQ?=
 =?us-ascii?Q?T7TmBiWU7+10qZlegg7svoiCLGEEvIpdaz10oB48ZVMAFDvopD4DBMQ5EWBt?=
 =?us-ascii?Q?gyCmMa+1iwTwqVU6xkdJvFWV/UaAK1ytm8pdw111s62TeQfafkdeZf6yMTHb?=
 =?us-ascii?Q?ekZM5mBfSQcyqr3qHAHg00Xenk2/xmB5NTvlktrHdf2h+4nvr1azz7zmCCK5?=
 =?us-ascii?Q?Bpt3l7KyOLjPjUAkKQ9wsjijt7iJgDIJiL9zlO4JrXuCinwFZbyQefdpbzku?=
 =?us-ascii?Q?0cb9ElG1t7OtrRSg7x+Ql4DsTKG+Z6q6uNHqr2Tz7sRv3Am1AE/hZtz3NaM9?=
 =?us-ascii?Q?dWh3lbsllTZLYHUfRqBYfLGCMnASPJLUtw1IK7J9bNLgrqz/m0tgtobJi4HO?=
 =?us-ascii?Q?3a4f3uX7JYKl+KxULkxSiZIbrEbz/pP2/0PnxhvesD7F4ir3CrSAI7784Gql?=
 =?us-ascii?Q?+3x3kDjIZ/ygUjkA4QH2sotAqpB0KoxlMCzJn3ANUgrHDEpuFAp4sfHsC066?=
 =?us-ascii?Q?ixfDXd8fe+pSsWLkY4YqrGN5jpkvEy90KUfTgQEGRmakXQi0T7/vd7wh3sN2?=
 =?us-ascii?Q?n3rNf6Mr6+SJyhV2/zWJorpMasO/69NE7WM6JvutJOERsB+y8W7ki8qDfc15?=
 =?us-ascii?Q?By/YL4h1D7TXvucxkoAi2zcuHL/W8ArBwXjIfcvgwL1kCYtXjZm8oAfjfQWD?=
 =?us-ascii?Q?Hm9ZMqRGP0BmEk0DhKQb4luGx5bKYLODTU+Plk6XrVdBUd2t7SP5yj2RqYOM?=
 =?us-ascii?Q?FaasIYi7fZTDjd72pcmLjPfOJ8KkIiZ89ZzvnS9JBkxSzGLq3eBSK5QwlCGW?=
 =?us-ascii?Q?nGHWGWprp9N9Wmfvs+3AyHlrwFE+c+LyVre1OoQ2QZUHPBeK4qNPmKGTqPUO?=
 =?us-ascii?Q?v+nve0gRaV9OQ5NNebLLdgW8oHecKg4v85M4eh9kUn6gEKqE79jG+eUpeuri?=
 =?us-ascii?Q?3MvUu/ORUUe1oAb9j/YybPPFYxYLcLiwzu9SQKlJWZXaa0lszgnGaOicD2Kc?=
 =?us-ascii?Q?y5GhE/k3QnKB33qryAqGHe4GhVy6t5uGlHMNMFckNraShZ/uKbYDz5JOMUaT?=
 =?us-ascii?Q?wYWXGM/7N3PIhtcI6wVpCKQjybubk9X7BCCjvZcvHe14Fo/IB/wr6eZPi7J4?=
 =?us-ascii?Q?DvxE1hGAigKHwTMX9B9wIYYmjTvLC6p/srHWfH8xMsceFNEYT4ETbJ7re7Qt?=
 =?us-ascii?Q?YPRIcsiXjEGZvWvKp/VKPLpWjVVZ45oCm/O9r0XxCkZcV8GP8uKCQxQ/Xp4W?=
 =?us-ascii?Q?Ae7naiTyehQiInNqkvRpEt/VG1BNRKQ6RtpTVAwoDQ3lupytcDLj6OmQNv/6?=
 =?us-ascii?Q?H5FcreyTb1rARH6lILnGfwIi5MtN+CmFaDar/+9yivuFQDpvO61Kz0AV/5mC?=
 =?us-ascii?Q?thjP4dWXe8OSeZc1H0UsfAzKC9sPMZ3+6wtX0f2wThTW220966ZMhW4w3sBi?=
 =?us-ascii?Q?/TfsiWkptGY2trIaEz1+jWJnWxTENe785CzgI6KRZQg8avbmgxNvz8pPEeMr?=
 =?us-ascii?Q?Ut6GrGKl5klqVDafqML5syrClKsK47nCtOBVhFEW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e219fa4-4ad6-447f-b8b7-08dd4997114e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 05:52:13.5530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wA3nLOxnc3h6PkrYe1g3QR1ZP30P3uU9V8sL3eFblJqfBFikrk3oxLNdw9FRp7EhbMsPpctJhmIxvYvsGM0C8tK6fEp27ju7aP27APUSkjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8826
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luca=
s
> De Marchi
> Sent: Saturday, February 8, 2025 3:50 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Auld, Matthew <matthew.auld@intel.com>;
> Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; De Marchi, Luc=
as
> <lucas.demarchi@intel.com>
> Subject: [PATCH v3 03/13] drm/xe: Fix xe_tile_init_noalloc() error propag=
ation
>=20
> Propagate the error to the caller so initialization properly stops if sys=
fs creation
> fails.
>=20
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tile.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c =
index
> 2825553b568f7..377438ea6b838 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -172,9 +172,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>=20
>  	xe_wa_apply_tile_workarounds(tile);
>=20
> -	err =3D xe_tile_sysfs_init(tile);
> -
> -	return 0;
> +	return xe_tile_sysfs_init(tile);

Is this really critical that we should fail driver probe without sysfs?

Tejas
>  }
>=20
>  int xe_tile_init(struct xe_tile *tile)
> --
> 2.48.1

