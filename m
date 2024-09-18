Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EB3CCD192
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 09:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E18F10E576;
	Wed, 18 Sep 2024 09:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVTXKJsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07ACE10E576
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 09:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726652362; x=1758188362;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hB61CMgiPlWOGC2LQ6dVNEUOusCgvaDgEy8D+H3X1zk=;
 b=YVTXKJsWpzoHRfzylKOF5TdvtZIZ76zeA634LDJNVnNGzVdpDs2gM0Fw
 vNoowvitOHNE686ldvA+Y8QQa+SYEJmHG2SWVBguGzwwhnlvfU6+2geUN
 hxIWzEF4c+yKapraYtPe2qwow+R210LYW2aOaexTDGHIJTBpmldQ1kYxG
 90bC4cnsB6YVaUcl8L3uoKnxpWn9JVv9bhO20lRK3rkvk5Qdh45w9g5No
 C24FItsPuGd8VqSyWzk6QbIyZQrXyUvD6c3TtLO85/c1xLKiXG/4l6WSU
 DGQxai5my1sHN0F6xIQ6xUDwMr2qBDUkwk9WJgZiMhlOn++3AmCFvyaZ4 g==;
X-CSE-ConnectionGUID: ssKQ68IaSHSXV8kwnshJXA==
X-CSE-MsgGUID: Oze3Yq4fRuemKiIcks6isA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36913748"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="36913748"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 02:39:21 -0700
X-CSE-ConnectionGUID: 4xddW0ExTyq7U+93u7g6/A==
X-CSE-MsgGUID: ETHFYTt5Qnynr9PjNBTHYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="100322059"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 02:39:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 02:39:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 02:39:18 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 02:39:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNfWnOPbkEhQBdstlkzfA4hpi7fBySpzcV7gabezmHSx5GMDTWDW8M9as+0jeFNdJFkEvTjkyn4rdlOJGNyVQTR+8OpXlkzgIdx7Q7T34/rBItwoEKAVui/OOHvfg/SzP5wodKNgLj5gB3Rkjd1zyUPBLijH/R9ac7LVSrolpJJh1kJsOrEkjNFl4eFhnI59Glwv7kyUjVv3S+6xuii7DNN4dLcpY6QBYgNpTHpqVKAYggQmx3IRlPCXFZTFRmg3jgHQLGyfeXx1T7BclAbtjVeb9X0wX2DTHAbCUqn0Ku60fg++7bD6q70v9G490brxPpGkkMqezkvwDnpwKrBnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGXMyhbyT7DjyHAfWcgq6tUNJN8n1+5q2K2mWGZIVWw=;
 b=wM9JSqYvQLkKh6miJtWPOrkN9N8rOMrLYy72Q+fNKubdtaiTIMVAjVcYEsgmzJGCH4yslq4yzcASYFNBy9S9fISI9WbZT2d7n5WjczslkpKQYz6ciWE4d4mM8XGFSTjJR50Hs2S0dz2/dlI5jCUdl2quDF+Lq9gO3Pd9UjMQwVtgAzHH8YBf08mVTHN0rBxDmgWgvQWeTsbRVkcR3d38uzy3+LhCOsDldlOcBFUmz4oQZGWyHPk3EAcQ30BuyVJfaic8/i0+8ujdhbjyY7Zp3lLje7NMlSE4KTxSrZn6WcJlIaWQs/EMH9pK0QrbuYeYOtcdiZ1j1qCpcOj/c1teng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 09:39:16 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 09:39:15 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivekanandan, Balasubramani"
 <balasubramani.vivekanandan@intel.com>
Subject: RE: [PATCH] drm/xe: Decrement client count immediately on file close
Thread-Topic: [PATCH] drm/xe: Decrement client count immediately on file close
Thread-Index: AQHbCaEPPmFS3sVFGUKU+fz+xX0tYrJdSZ6A
Date: Wed, 18 Sep 2024 09:39:15 +0000
Message-ID: <SJ1PR11MB6204E9E9031470ED7D32AF5281622@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240918081150.280055-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240918081150.280055-1-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS7PR11MB7905:EE_
x-ms-office365-filtering-correlation-id: c97468b9-4443-466c-17fc-08dcd7c5c2ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?If+rkqfmXUgDGmq+HgN6pOek/PyDuGfXQ1RR80t3rqtmNDaUHygluZsOeiO6?=
 =?us-ascii?Q?KQG7i9MuWSBAWZrkEjkRTs76zs/L86Z0TXf+EPKTVpGFIw1vXR0m7EFVUPy1?=
 =?us-ascii?Q?zwNioBT+6uZmwa/Wc1sKtMBzi/3MgnMt1gnICiybKES8Sckq+Wej11WS9a4W?=
 =?us-ascii?Q?fiTPT4mWnQ01p1oH5kIyKB1gfcV5d1gVIvoZtdukMHIFusBcl5CgecrQ5QgW?=
 =?us-ascii?Q?OnxJ7Tw1MQcV10l3yM4f92hTQLECHRFPy+3QaxeUIk2LeXqBUBDCFQ44zv0/?=
 =?us-ascii?Q?DyoEGcw9Bboy27oFToMLBMDYG075lBiYuF1cpVX68FhvqrteNUCSBuDTPX7k?=
 =?us-ascii?Q?LYfS5ndYineT8jkppW3fHs09z6VPQK8FXtl3eM5Ca/J0vh+d37ZKJejX8i9y?=
 =?us-ascii?Q?zRn7xcrnRMzwUaaDT1QU6RIGgnHPbhW6jSzDu5MUYpWG9JPaaI1sBRsxSs8L?=
 =?us-ascii?Q?0sRG65Pf/iZChP6ndNVGI1+V/8w78xbO2Q7pE8DNpKwKowzvE7dlT0xexod7?=
 =?us-ascii?Q?Ep2LRrQwrzIDopLRSup5hTdhTumotpFScTPM3Zjq6PRlGdLfzZA8CtFwSESJ?=
 =?us-ascii?Q?/AwFbIfrSnCyYEKV/Avbtul6O01Z3M33Lqm+PIRJvr4k8GBcI8p7W0LlfgID?=
 =?us-ascii?Q?Ubmtu4nunVIE6bgX43QT1+/vztpAVqvl1AOhkOddrp+QhkchZXsVmJWigwj8?=
 =?us-ascii?Q?tsyhP9y++SKD7vvaups+i2LVckvbAorOla/y/5iT3uObOUCOgQPSzSgSn1un?=
 =?us-ascii?Q?rNrBxfC4FSjMwt1JC1jz+GWkB5nkoFWe5nBZSjObPtFbCk8DHjrgeSa+x9r0?=
 =?us-ascii?Q?O76sdZe0jOsZ5qhU7ELHVUFzGM5pN6q/N0Zc6a6w9DUV0DGm+3yxMiiZZ66d?=
 =?us-ascii?Q?mmATauo1IYQLW+Gb19uLX36sRf4PO3Z3inhKZUKImaP8kjvXrlu1XU1m7KIG?=
 =?us-ascii?Q?qMjY86+ouFn6kxHjPsltF0iL8xME0130FLR82nWo6exaVXopGVpYgpz3Gl7m?=
 =?us-ascii?Q?dMqkgpCdVIrFhpR6QraUPWrsRbU2uGlAm3IVGFx44UZzRV+47j/lT6YQiLBD?=
 =?us-ascii?Q?YO6CPCi7YjsmsjgT//XG9DDcuDpmPI6ghS5N7ewAR3Ve1WzrpbfD/buO3yeV?=
 =?us-ascii?Q?e7vUfamntPAwrGR7cTypCVedxoLSq72r4ggtoaJ/0hZ7RJNtaWmnRrHLd0cn?=
 =?us-ascii?Q?kKC5kbf3kyUZKOew4rObZ600PHNc7Dh0HSmn2MOE4R8EOQ/jJmgsLFKnnvEG?=
 =?us-ascii?Q?3bzxM0impTfFyoSnI9yJo74m3G2D3vWRQoqcwBz7NxZpj9EhDhbvptUP+FAw?=
 =?us-ascii?Q?YHrWp8hP6rj3uO4oyR+HhrJxfUTuSrD4Mg/wzyz0hBZGPVFPjZDw0u1BgB9Z?=
 =?us-ascii?Q?/DwKzBmzPppyzSSe9MzmJUMg3PX7j947JGCAXiXLMLg9HzIV8g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?86bSpNZXPDEssxtcNyO+ecbmruttLsyQZ3PWslEBW15aOd8GMbvq5OBDLtoB?=
 =?us-ascii?Q?0WTzwwCPmeaQohwsJ65Ny1g5QkllKil4JWbytSGttnI6MQWw2zyP2aHZJsV5?=
 =?us-ascii?Q?vk5W0FbQv/+8idtjpkISUJKL3CSc5d9zRIADxzW5dRZ7fB6jy9Lh0v5CtXmr?=
 =?us-ascii?Q?bYYTeg8g2yq/UW7sOwC5ufOEXqT+BfLSx2vI3fzicylnXqZU/vefKFu6F4oT?=
 =?us-ascii?Q?nWCfyvDpq1iIMA/BovnFeRjyhHbX1nwY6Suq2LVyMdp6lQqNBOMVHCKnkGwm?=
 =?us-ascii?Q?HqDikDlSrhos3rRNykBgToaTwYIttwsQR3Jzl7IjCBBamkjNYj1Doe9OLp5Z?=
 =?us-ascii?Q?hULpxWGbI5egH5OLmukwfzKEOUV3XK82NZ0moc+l6SlOkYjmyt4X9ObPup6b?=
 =?us-ascii?Q?MpPHkiQOmHW00AWM0wyZTLarCxx6ZIM8CZEnZPPO0XXe0fJUw6FAyUa26ps9?=
 =?us-ascii?Q?TtqqDrIpFdIciurmYeXRDOesya0gmgNicZHTDKrVgipF9m7VmQ7DgUfXhT6J?=
 =?us-ascii?Q?u1JgD59P39mqscBlW6wShddgi3jDQ3m4m4adyXIuKZ0ATLFXldqglw+/M9wc?=
 =?us-ascii?Q?EF8gNILmjjQKOEwQ2/7SK7F2weipz2hjqaACHY3tx2BvJ0diWOjc8szK88L8?=
 =?us-ascii?Q?yC2ijttNVxOZXjEKq5WuNViksIODSFMjGaXFEUcMAzh3wn4O3xEV2inLsrdd?=
 =?us-ascii?Q?NWJlGCOZ2MGPxW+U7835oiF8u3cFeJim0Qmc1gJ71AbBc7oRN0KQZcJjtolO?=
 =?us-ascii?Q?vS+xaZem7JO2H+xIOmL5sw+80H7ybTlWoWEXad4BL8/O1rJLZcyK/xGP1N2S?=
 =?us-ascii?Q?9+jJnBmii9CA1yz/57yVlDKWDsjPzoHEMLuVwIySEdVpwHidwqU4pg9qK7nP?=
 =?us-ascii?Q?jixulzETf8Epy8qAgBLoaOj2kjHSlNIwLt6J5AxDx/NUOJoHQO7kI7K2y5Fq?=
 =?us-ascii?Q?xLZ56rY9SlyKnhDYtzGmzwp8HUC8IQgLFb6lExNtNWM/r2UJ4JFHUjL5Rm9k?=
 =?us-ascii?Q?YU5nitKZr7D8HceIjSS8FpBAHzep/rEOHgSWWTLeT37a11XoAZ1nnnJB+ecB?=
 =?us-ascii?Q?RdWoiGupQVzWqsbEfp8IyGeX5OUUaZ2ut4SIfkNxpMmMVE2LsojYfgNDKwxf?=
 =?us-ascii?Q?AU0MXkhEfYrOPclXwozP3I3dz0QOTUhJ4RB8Ig4f8VWbw0VG/B+QnrDSeN8A?=
 =?us-ascii?Q?BcMGjxSAualmJO99GytLxb6Vfx+07wcGk9sbVckfdrSGLSkh97ytZdWkwLg8?=
 =?us-ascii?Q?cdElDNz1U0tQaGTwGY9StvB5XEQKubsAA29TQNv0pJa01bijjEUtr/Gwlwoj?=
 =?us-ascii?Q?3OEkGlN8ke+4xMjFhTF4EahQXh6p9zRvAh7Lpu+LgTDmxvWORsc7yceDpL5n?=
 =?us-ascii?Q?5Khrs4/X2zAAmjyTkacsyNz306lWUx7EXrkJuxcWFgsUVXwldOq2l9VZc6K1?=
 =?us-ascii?Q?8/Kc52ELYiEd/JLFploPoGigME9iRzaFfhXY2sje4BEumn69cs84Fmmib1JM?=
 =?us-ascii?Q?Tz48A6S1KkgH7J+T4gcNnoJ0qsbEim/UwAAFOEE0FoGuGP5reXoIcBNN2I3z?=
 =?us-ascii?Q?SI3YPd1jndSjPm5tzRANhtyovMybDdykogEHSK1l?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97468b9-4443-466c-17fc-08dcd7c5c2ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 09:39:15.8495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3CqyxviXCFDH0awZjspiTC9QO812oQgpyS08hZ2crlL33kNZyiJF8aLJy0xRTD30pbvLHmUPzar/9eVuyqimGAbxnUL9eOIZCk7OoTgYZf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Balasubramani Vivekanandan
> Sent: Wednesday, September 18, 2024 1:42 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>;
> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; De
> Marchi, Lucas <lucas.demarchi@intel.com>; Vivekanandan, Balasubramani
> <balasubramani.vivekanandan@intel.com>
> Subject: [PATCH] drm/xe: Decrement client count immediately on file close
>=20
> Decrement the client count immediately on file close. It is not required =
to be
> deferred to the resource cleanup function. Otherwise there will be a smal=
l
> time window, where there will be a non-zero client count even after closi=
ng all
> open file handles.
> This affects ccs_mode(xe_compute) igt tests as these tests try to change =
the
> ccs_mode immediately after closing all file handles, but the driver rejec=
ts the
> ccs_mode change request as it sees a non-zero client count.
>=20
> Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
> Signed-off-by: Balasubramani Vivekanandan
> <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 4d3c794f134c..3bccea6212ff 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -107,17 +107,12 @@ static int xe_file_open(struct drm_device *dev,
> struct drm_file *file)  static void xe_file_destroy(struct kref *ref)  {
>  	struct xe_file *xef =3D container_of(ref, struct xe_file, refcount);
> -	struct xe_device *xe =3D xef->xe;
>=20
>  	xa_destroy(&xef->exec_queue.xa);
>  	mutex_destroy(&xef->exec_queue.lock);
>  	xa_destroy(&xef->vm.xa);
>  	mutex_destroy(&xef->vm.lock);
>=20
> -	spin_lock(&xe->clients.lock);
> -	xe->clients.count--;
> -	spin_unlock(&xe->clients.lock);
> -
>  	xe_drm_client_put(xef->client);
>  	kfree(xef->process_name);
>  	kfree(xef);
> @@ -178,6 +173,10 @@ static void xe_file_close(struct drm_device *dev,
> struct drm_file *file)
>=20
>  	xe_file_put(xef);
>=20
> +	spin_lock(&xe->clients.lock);
> +	xe->clients.count--;
> +	spin_unlock(&xe->clients.lock);

The file_close here is sychronus and serialized call with respect to usersp=
ace. Any settings done through sysfs post file_close should not required th=
is change as far as I know. Would please explain scenario better?

Tejas
> +
>  	xe_pm_runtime_put(xe);
>  }
>=20
> --
> 2.34.1

