Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D52C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 22:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708D010E850;
	Wed, 15 Jan 2025 22:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEpqv/Jm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6329F10E477
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 22:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736981887; x=1768517887;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bpVBCJunQ4DrCG0Y2fz+IBj26pXp/fHG2voSjG0x1uo=;
 b=LEpqv/JmNZioLhnfw30+rYMvNbcPvPwvxAe2l2gtSy+Et4gi5IikRuSA
 NldFxp91FTiL3pIoUtecyt2qX+zLebqxHKA5W8fBNdsfC5BPpNlZIek3E
 W3YspThQ8NVapEAem5cFd/Otb/e4I9erX5KPQaU2DLRxmzFtHw8CC/k47
 eGtdGme1dN9Pr6pmg+NX7HedObpOrdGIISxKdx5eCrGgP1qZRhBx6AZAk
 GGfto8Uy3gxxjsrxsInrHYv5nDFc/0O5ynRZyXWlbcMGC5jkuWwryQR2N
 JmIza8ZQIBIJDkHTt4v/v+ufUDgeKi9bcQrR33rG/Bx0uArkdzbvuQzo6 g==;
X-CSE-ConnectionGUID: pdgDbbhdQnaGwr0J+1OQCQ==
X-CSE-MsgGUID: 3mZlXLeXQtmGXEpiekGiSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="47826613"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="47826613"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 14:58:06 -0800
X-CSE-ConnectionGUID: ymfc1q2mRhWCjGr5/VdAdw==
X-CSE-MsgGUID: oCaXcvNrSRK3KolFEaJS9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109921253"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 14:58:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 14:58:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 14:58:01 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 14:57:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAJLAE5w9f1GAXUboC4yxwfm/E8d+9K21soVNT0bHyx3260sCQWUIKYItSBRIcOWTHfx0C5Wx9wHw8LlB0EIkFnPktF61AbOYyvH2Ri1+fzSAhmnXO3pRahnzIIgsJ8DVTTn6kmTNDkhs/EwuLSj6iJt++cgPYgdsjRIXRXkrjSpjFu8lyhY/0K4bX8SddibqFdOXwmbe7k8mv6yo2qeKPPR6ilIW/0DKV4lsoow9VJukuQ48QS4i9rWOtKRBnV6DTXkMNFXhdpgepuEHQgpmH9g3VXWVBuc6xa2TuQlwAoIyWoy/cPLAvSaFVcsgFeSlnc2ctLqORD0sOzuQx0acw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3hocFI7N2DZC/O8WD1VHFWeL9WoFeSgoVm+cNvumkw=;
 b=PpETwz6PsePIxQIqOv4mP1+QMO6kpFtA3m8WdOP6K0ylGv1bKnhZhp8I9Hm5I07A+WQDGOyraRKHGVmrM/KE4b/8wUwolbalmhL4rfzuXwNslk8Xcwm3+mvEbOSbOEJlMFHV+yfZbkbQQ3SWJtI1i5rGL0fWlWAU4WVc8vGYFB8whWVVDDrh+LY3j0CEQchgSzcz/RYg7GShT9vAfpn8/9JYIpNrr3HNyohTMn8C3xG35Op6K5ox5fVRYJ2OKzMU/UfF4RXY9zsCEzKJ02ePzUbrjLUPyt06TrJVcPCGsvjiaGziMQz0y8Ti7rj9k1T/tr703ODVD+oZNzfN6JQQxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by LV1PR11MB8842.namprd11.prod.outlook.com (2603:10b6:408:2b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Wed, 15 Jan
 2025 22:57:24 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 22:57:24 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/oa: Set stream->pollin in
 xe_oa_buffer_check_unlocked
Thread-Topic: [PATCH] drm/xe/oa: Set stream->pollin in
 xe_oa_buffer_check_unlocked
Thread-Index: AQHbZ5u5upaLgG2P5kyr3riPcIhicrMYbgjA
Date: Wed, 15 Jan 2025 22:57:24 +0000
Message-ID: <CH0PR11MB5444B7A2FF4192998FD5B0EAE5192@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250115222029.3002103-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250115222029.3002103-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|LV1PR11MB8842:EE_
x-ms-office365-filtering-correlation-id: e937ba12-676b-4808-1616-08dd35b7f9fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DF47FiEaXav+Zk8jpqrVk2cNSnP3MYpGvqe9S613Jsj/2K6fPbV99x18lllS?=
 =?us-ascii?Q?zAUpRNlZKD0aYPCiEtNfvX/gL0EBCr2AjIwB8wmpAzTZxh0v8P68gAe8B7gs?=
 =?us-ascii?Q?rsmtQuG8frkq1cZTMxXYYpHOrGEUc5+i/sIODaEurRNbx6mZBeZPc8lyLEw2?=
 =?us-ascii?Q?VE68EOTrBXCbPyXwM20Un6AFuzLOCh4Ho13pVS8iRStMKJa/eUSNJ50KXW/b?=
 =?us-ascii?Q?xSxasgykcLYFDK5hsa35qxPKg7hk6V8mZewb3zg6Fh+KVRyfK7kfaYKQPZKy?=
 =?us-ascii?Q?5aQtEtlvaZRHCEdSmjAaSxamr3yXr+JPTW34Yvv2QDsUC1r7CfENOqI15oRP?=
 =?us-ascii?Q?DSl9pdx/uLvz1PpKL1ACechaTlMlfEbUYK/JFKcfiiZTxED+0JFb2Xm0kxFv?=
 =?us-ascii?Q?jmDDKdL4KpSTLFlIZErO1e3rwk+HDVKFWUvqSXUMNhUOg+d/1xzCnIUb1zbo?=
 =?us-ascii?Q?+KONRCriSH5AcsKX7MUZXhZqoItGFpFh8GRKG4Kh9hHyc8g+/6e8NDCIuTa5?=
 =?us-ascii?Q?+X54sD2den7DDAVW/TSZIFSccA6roR5uBNiLkFapJURxDJu9g+RVG0tewAne?=
 =?us-ascii?Q?6lqADBfzKhCjHUWbBzPNrQx1HfnX990SJamaNcHpHBgHimyoFHqzGrZxZoEM?=
 =?us-ascii?Q?VR4kjON4LhkREkRSywIvPlgEBCRKlUo7iOyvTqNhptC51UHtTIip293kfIAc?=
 =?us-ascii?Q?CpRfZGi6CO1Fk0Ow3JLSEEPXckrVkkAMspf0Z8HmCOXCyY/Nn9FCMAIh6Ik7?=
 =?us-ascii?Q?FUxdLfjrjBwj6HqhnDBsfr0h008pvKrVpHw2QIVJ6N50lkgkhKrWY34GzW1w?=
 =?us-ascii?Q?JHnR6FgkPbPXfVQTfr2ZgZJNyMLRDj8vayYyZV6Aa/RwWFYKA/487QhC+cBA?=
 =?us-ascii?Q?ORVmQMMhtxemCcM7x7FXhLPzb3FlARv/sryL5Wz/k0uQUwott8t6SZ28zcOa?=
 =?us-ascii?Q?rnwJZpWStf+DSMbLQNS56mzieV0rslxy46oieuxPGdHF0SBf7JCPP119tH/a?=
 =?us-ascii?Q?dLnp6c/LeWP2GrkyU9pi0UUdWQp4CG+zwTLjzk5xsPdafOK5Z4XrvRF1GWoK?=
 =?us-ascii?Q?32RCWAG7hJjiszgxTUYZU+MJ1HohjWdODBZv/xGp8U/CulyJiGwpBl0PaMqV?=
 =?us-ascii?Q?FU9/AdfpdZ9lGXCwATNfsHCfNHZ+ZDBXqG15JOzTcLfxzy0Gt4MSicD/X7f4?=
 =?us-ascii?Q?fFY+LXnkzxTtLIVcAD9DSWGQdy3eusm8QVibAZK+14KoRB31iLv+9gbmfIF4?=
 =?us-ascii?Q?O7LMEeARPQDe+FQoF804PVWr2ekfSxfq8XdnAZewTdjvjXACzdHNFFvupQsh?=
 =?us-ascii?Q?p1Ftsr+gmeqVNeTr1d5RijKusHUzsKJ4w/BrQyvpM4g1NhtI32/wny51t9xq?=
 =?us-ascii?Q?z9z5O0DhLw/qufGqu4NAkphWWED/knfE3QOJSQaq0i0daq2J7VvkgszQ0RH/?=
 =?us-ascii?Q?guJRp+lEgYu6egGHh4sZWff8fNbExsJg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zcUzbgjm2Aei5sroKI46Y7sUNJ85jsKlGt2oSaXJdFCkUEkOCvkmHne5F+vh?=
 =?us-ascii?Q?sbA4edHS11TJhVDyonnqtbfkbaxlIPP8SlqTok5YN5HxpXMji9e4ZNvcOY1/?=
 =?us-ascii?Q?IacpqBoyocWI6UBoWOHZWnE2ELtY57KZjG7OD+Q2THR0TTDuPxsWoLqILeaH?=
 =?us-ascii?Q?wM/PNN+KofOF74K42tW5cqiom5+VsrJchWjtLTaQHKc8lxMlD3jn1GWbvSd4?=
 =?us-ascii?Q?QC9LlB1RGX13kOM9AHqkHBeWNi0yqc1Z8kKbPsWvPGh7p+NMYDLJXQjTn3Eq?=
 =?us-ascii?Q?wmUGtkffnVY/n1qfr5OxEe0MCeM1HkiQOVR1oaRTo/E2TW+O8nYZCGl888fQ?=
 =?us-ascii?Q?F/xAswAkBFJB9RWlZwQWU6tUpAVYYSueZdJHIbNWXZWTMcRwbcsihu6IS3gF?=
 =?us-ascii?Q?9TXz2EVIACBfxvhJKRssAgTzwCtMXL99P206KUquJU5R+xA3WjnFiJ5dRZ/F?=
 =?us-ascii?Q?9HaqoVZ0CTftPyOJ2OqHQ5+/ENGhYTlGzwPR2TqoQHUp4A3ZC3xNuNGXgHYy?=
 =?us-ascii?Q?0PD8nBuqh/qTV1jBLzQdHPivT4BbOrWda3y8hT9Yk8GjSWl15x8u5qOHWinn?=
 =?us-ascii?Q?1TA2EM4AlJYKpagVCQu86U8Uk7Fcsgrq72jnvDozjeO6qz40Sw/+l4oA9KZ3?=
 =?us-ascii?Q?xM2qyDMwfpIikDMoDAT/7XeijwWrOHcMgzUv30RgBsff+JZdAUcG2nucYM2v?=
 =?us-ascii?Q?fNq1FdiLxDerJouvUcX6Wuawld9X3pknY73io7tak4IkE0UNE6NUFwGjgEZy?=
 =?us-ascii?Q?IClycK5qwHBxZA2bI16BnQlTaJF09gYymzLuS/LrMkrRsZtYDtxFDyFrtn/a?=
 =?us-ascii?Q?qF8nQ7mJ8Nz3ghzlzXRQ/Mdw82wUKImVCmgjxJ34UivUc8Pl/f67XBEdzK9L?=
 =?us-ascii?Q?EOJ0HWNrvUFSOuRK6uxCtxskA9lBDV80sJZVdCP++Y1dKXzb2dMuDyL8ZLJP?=
 =?us-ascii?Q?Q0KY/7FfAQiRprOoyp82s/XtaMnw7Ap2N+vjRLGxwneCYMSTLKFPint6IYir?=
 =?us-ascii?Q?4X+1djJoiR2kMzUpeulY9QRaSRon/vJNA2lOxjB2gOitx7qwcmiG6P4lNw9W?=
 =?us-ascii?Q?ejNp2MTD0ccKNVOSW6vGp0ov4wTOGSOPQ1oKx2rgfsi7XgqWl3pUzVLPJKll?=
 =?us-ascii?Q?GAWljBAJn6Dbsu/nj/U5A5BEZpE4/mycvQZjWdjNP/aZLFySxo9oOTogt5WW?=
 =?us-ascii?Q?BYbPxq/j25g34zDrHmpeC5kZo2zmZi3p3mU8bn5I3r+yeFxBA3WgDoPnw1x1?=
 =?us-ascii?Q?vu1LqHd+ep82lPk9ABV0EGP11cCJbzMKJMuWOqBFOruNYyIiquyowpvyL9HL?=
 =?us-ascii?Q?StLKuxByRsasjbZM8miXlfZcVugH+MVvylMLmbNrVUJk1wEdyPv6rF9+iHU+?=
 =?us-ascii?Q?wg1pWsN3d+kO2UxMzdFSDntWWoFCJTdtjDHeE2Q6l7/fU3n7OrrEKae5jAXv?=
 =?us-ascii?Q?N/c594bS62R9Kz9bl2Tq8vFSqWBnO33GWN77DrBDUMbakDkFGudKhEAyHYim?=
 =?us-ascii?Q?VD8nFrU+sEzM9s+WNZ2bRg8sIWIgFmepFQjGOUYaaAs3QlXo72kn11zc+GJI?=
 =?us-ascii?Q?0387Me2Rf3JLoVgL/YTOoG+TWI3K6EjLEvuu9FTI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e937ba12-676b-4808-1616-08dd35b7f9fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 22:57:24.5205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W0axm34go7iW2zqzxcj3EN+Rd2eBxQxaFp/kDe/xThIuAgPUgG2M1IPiaH9EFys71zohgVzBrxigqGtks3kzBJg1KGdw+gHj7C+oUe8Wrm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8842
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ashuto=
sh Dixit
Sent: Wednesday, January 15, 2025 2:20 PM
To: intel-xe@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlock=
ed
>=20
> We rely on stream->pollin to decide whether or not to block during
> poll/read calls. However, currently there are blocking read code paths
> which don't even set stream->pollin. The best place to consistently set
> stream->pollin for all code paths is therefore to set it in
> xe_oa_buffer_check_unlocked.
>=20
> Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Minor concern below, but I don't think it's a problem, so I won't block on =
it.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_oa.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index eeb96b5f49e2a..e27c1752aa57c 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -237,7 +237,6 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_=
stream *stream)
>  	u32 tail, hw_tail, partial_report_size, available;
>  	int report_size =3D stream->oa_buffer.format->size;
>  	unsigned long flags;
> -	bool pollin;
> =20
>  	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
> =20
> @@ -282,11 +281,11 @@ static bool xe_oa_buffer_check_unlocked(struct xe_o=
a_stream *stream)
>  	stream->oa_buffer.tail =3D tail;
> =20
>  	available =3D xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->o=
a_buffer.head);
> -	pollin =3D available >=3D stream->wait_num_reports * report_size;
> +	stream->pollin =3D available >=3D stream->wait_num_reports * report_siz=
e;

It looks like we call xe_oa_buffer_check_unlocked in two places.

The first is below, where we call it during xe_oa_poll_check_timer_cb.  I s=
ee we're
operating on the stream->pollin value here because we're migrating the
"stream->polling =3D true" code from xe_oa_poll_check_timer_cb into the
xe_oa_buffer_check_unlocked function.

However, the second location is during xe_oa_wait_unlocked.  There, we perf=
orm
xe_oa_buffer_check_unlocked in a wait_event_interruptible loop.  Is it safe=
 to be
modifying the stream->pollin value in that case?

I'm sure it's fine, but it's something to consider.
-Jonathan Cavitt

> =20
>  	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
> =20
> -	return pollin;
> +	return stream->pollin;
>  }
> =20
>  static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hr=
timer)
> @@ -294,10 +293,8 @@ static enum hrtimer_restart xe_oa_poll_check_timer_c=
b(struct hrtimer *hrtimer)
>  	struct xe_oa_stream *stream =3D
>  		container_of(hrtimer, typeof(*stream), poll_check_timer);
> =20
> -	if (xe_oa_buffer_check_unlocked(stream)) {
> -		stream->pollin =3D true;
> +	if (xe_oa_buffer_check_unlocked(stream))
>  		wake_up(&stream->poll_wq);
> -	}
> =20
>  	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_period_ns));
> =20
> --=20
> 2.47.1
>=20
>=20
