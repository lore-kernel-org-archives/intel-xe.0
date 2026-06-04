Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C17CD6E77
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 20:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BAF112985;
	Thu,  4 Jun 2026 20:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3mBbbks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E97112985
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 20:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780603973; x=1812139973;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vhZRu3l5/jCajXYoiI8SuMLPA0bPehQuurHJ+zMfjTI=;
 b=S3mBbbksSqG9jdilftKzJ6GUAEzU96sJA1/fz8xefjbDZocz1Cfx5c/x
 iymwG4o1TvvrUnpBlcibhcu7oFAIn1zP6tpXGKPPq9C1LB5HlyvRU4NNp
 dmGdM6drL8RAha+X5evvTo4wZtHRsxW14fSfngcQ8Gr2EE/6JFB4UD7IT
 8r+jC1wt6IlYp9eftq1x+l2x6pLZDk5T/mlg4Ho3NIqO+rHWqmkUantpz
 QlLWDKL6r5Iku6rBvWuAeS30CMR2GZbfDSiGv58ZwEOeZQGh4Pc4GyUiL
 38DFzlss4UQNjmsNN9yBoqHVyEsG03nUpJVTBQXmgTdlEzrU23zEzgDpb A==;
X-CSE-ConnectionGUID: +mlmEczvQhy+dhyGvhcy4w==
X-CSE-MsgGUID: PZ+Hho6ETwODMgxIzAL8qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="80475528"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="80475528"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 13:12:53 -0700
X-CSE-ConnectionGUID: wdwybQWUS0O3xMYGv5pRIg==
X-CSE-MsgGUID: q8dmL0qNTq+uXUVcvt7Gpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="248574811"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 13:12:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 13:12:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 13:12:52 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 13:12:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhywtfuZ7LtJnkgRf4eVcYOAU12sLS7938iXT5k+Oxs9dTNsnA/OeVZSZ+9vTDVOwdHSicT4YmlXFfEYpGiamo1R4PlqEBvz0+hk1Lf4HxTnWseiR1OPw7Ha1eLSh9Tvu5W6jNmgsyosiT+2I2oQQco/7aoyKGDHY8i8jpRKQXi7Aam73dNdVhOVIzIQ/XiCn8QUMfMDXMMblraGsLidJfnyWJ3RI5Tm4etNG949wvZ5lm+KAmFUsC6H79bakOGo/UnBTmFZkLXdgPk1FisVkwjLa/f6002ZmVY1TDnptuu3R6ay/EpqXYepUe71H92BpliGFP2E2BnaydfhjeNZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kI87rGyz3qVuO3ckSCXZO8BSgzMDMiQiPxr6me0ZP6g=;
 b=xN0/uGzuP6PHUQXjtD0ZhmCrGq+wqcNzBwrVBD6uTPrAx2hD6LxGfFn1fY0WiGa7YbxCeIOBfCG8diu/V7WO5kfLLxmaDQ+0QAnVffvrVV7OmWwdBUxVO5gI241TAtx666ZI43CNc3znGaNDwZBHJHCdKl1kW7Rd9cBWe6VkRGEuUhwJpAkq27WJ55+FaOPWm5EJCyhhU/oN0/E/diOV3Kcya5jUblqd6HOW4/t2Ysiu/p+Z7mpDp2BDhOFH4d3Uev0tlWgEXRIgjZsrpvVKHrueRrPQURRAE/Rxo1leCD/MuRVrEVs9ZWELdFyw5gzwKfHT+JHsFn9Q2YjpnIqeGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2717.namprd11.prod.outlook.com (2603:10b6:805:60::32)
 by SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 20:12:48 +0000
Received: from SN6PR11MB2717.namprd11.prod.outlook.com
 ([fe80::5d50:a82:a1d8:7b90]) by SN6PR11MB2717.namprd11.prod.outlook.com
 ([fe80::5d50:a82:a1d8:7b90%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 20:12:48 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>
Subject: RE: [PATCH v2] drm/xe/i2c: Report i2c irq handler issue
Thread-Topic: [PATCH v2] drm/xe/i2c: Report i2c irq handler issue
Thread-Index: AQHc9DG7FisjTwCBM06ROB/wFv8iR7Yu1DLw
Date: Thu, 4 Jun 2026 20:12:47 +0000
Message-ID: <SN6PR11MB27173B70C8E504E414610E5EE5102@SN6PR11MB2717.namprd11.prod.outlook.com>
References: <20260604145154.3769802-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260604145154.3769802-1-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2717:EE_|SA2PR11MB4938:EE_
x-ms-office365-filtering-correlation-id: b189aaaa-223c-41a2-3267-08dec275a5b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|38070700021|6133799003|18002099003|22082099003|11063799006|56012099006;
x-microsoft-antispam-message-info: y72HWv7RVOsgucjTc7ka9uOb0qbuWiRh/7VmbDgLFpo4qe+KR5hOLrCw3BdlQAKwlhEkfW9z0Glp4gS5nvRo1+TZ/DkXUtMQAL9diFu83eCxOFY713y2WOM7EFrYnP8aEMsCNplQT4aQYDLs/ZmMzfiVFkDvUgvMMxqvzS77Vt/v83FZv+NbmiSorGldFqaq+4tjDcWxDR7iIodNKuRAHCOR6jQCJKM/SNVa87Tyb1N1oe2msSlOldfLYQ4vYZz1xg4hQXIYeyp5h2rvzWE4LFV2/6aMtz7r7fDhUfN/RbOG92FbAsziKeJe9GvdN2hVaAd0HMl28kClGTiFBKZjF07SiCEU/xeKn5ZRHIvNDNX3V5YtSJtrprZYV6liHje679j1BEqx4IO7n6Cef56BFRq9ix8jvmSGVyhqdenuYXWWTDqjuvvsa9DtACg2rlK6jeOuChgKnxJimSB2IoKRfLt/rswepxTDkQDM/1p3fzxch25iQhjj1Iak0snKn5DgZX+ur5fjMKdGcVg8q742duZ0r1sMS8CnRdzwA6Yn1/mQFs5Fhtd/HAnWjTDfKLU15EF4AJnV6oBAC5ocRAfip+DZ/lFlJze9jB4/FVzIflrWbR1tvifVK8mIcBlRhTLDDQU880JgnJ3pBvM0rfvU/IksJxqEK2IwzWYK5LWe9Jx1PHmmXewenLXdhe3KbUs4gQsZeh9KGxtwM9hP13yfeYNuDA53Yh4G//JCifFRqV4J4g8alQNzPuiSURoYZk0h
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700021)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c0w2g9ReWSNONyUegilbEaNeXmhhfJKj6GbU8TthGJxe9oaIZ8wy/Mk2F23p?=
 =?us-ascii?Q?PjUntXSdP3nuI8Sjuqup139hO8r94+83rXlTczAy+SrARWKkdVddmKuyNgZ/?=
 =?us-ascii?Q?Wd7G5661+PEtMTPl50ljUs3MpHrZs5UwZYNTgD9GUeKRBEdcZpLa6NGFQSQi?=
 =?us-ascii?Q?J//Rw4EDE9V+SQ0jPWvvLEiKm2tXdUIp2sm5OAO4+2TgdUqHKGo5G6hJrG5J?=
 =?us-ascii?Q?Ul1xlN5+f/Yfk4+DdeVxXmPwG3SQNO47SWGpisFse2wjObpw71aHSt2hwXsD?=
 =?us-ascii?Q?s3ka1ogmRoDYC+SS+AslScmLkB7U2iTvg9Ytsaxk04W5EdHVoGolMBzoLxgj?=
 =?us-ascii?Q?FIV6XmOdy8AQwEMSZQfxjzMcs7wBzkr41QzNRu8ac5AfrORsUrLGeY6w8XJK?=
 =?us-ascii?Q?sBwdvT7o6+NZZiOtGyO4WrQJQg71drRijEWB8Yb9Xgt4oR0Oy7o1W5uzA4M8?=
 =?us-ascii?Q?XTRgCjKbp7FuiZ3qyRInGCgxBVgiOdcfspQz8TwzkuvD6z7M9w0uXpGgU5J/?=
 =?us-ascii?Q?iADtwDtS1+NH6WF0bJ3aONmz3lMbliKKKWrZ2kdxB5TDo0fkHPfSBDB8OSI0?=
 =?us-ascii?Q?Qx6ZYK9dVq/GFb65quq6w6yfir+h2UyyuY22UheeW+4l5jc8KAZE0VYNwe3L?=
 =?us-ascii?Q?44losbbcjuRw23fDtntDc/ODVfyig8YzvrPyuTvXW/FlstWeJbswSb0r4yAi?=
 =?us-ascii?Q?NkmWz2Ymkph2l39MqbLpAVXYiQgMF0KLnEZHmBtx063GqqbZe/t3CefnSkpa?=
 =?us-ascii?Q?PxbZSVeUBxICT9jqHvXyo27F01tVuVLoLtbBRzpZSAUxeKOFO2AqL26YEPk1?=
 =?us-ascii?Q?U/1XzoPAtCsZ8LbjoS0N6qmNUAiEyKQvUaht3oBN1Cjyg9+QNObyKQT8p3WI?=
 =?us-ascii?Q?FXlwuNcBDckekd9SQii1UVWnBBqerSKCZCCUSiEDb19HQ/nnxSOKrpgB/Di8?=
 =?us-ascii?Q?d/1y60OiEozdbqt7H7LeaaItPxsfZ1lcSTh/8QyWXkNUTuqdOpd9dwtGNWU+?=
 =?us-ascii?Q?wBR97Nz7nCBYJTMzWOJsxX5CBQ6DLg1gqGcgcaDBmq1A1fzP8hnqyzAcKrOm?=
 =?us-ascii?Q?T1f0Xf8ozxeM25fTn8Y0YukC9v5Ku7B9tglUAs9j1MguDaWasCJ5afyloixU?=
 =?us-ascii?Q?4/CENaAqz2/OuG6pfsRdbJizgOJskyVVWiyWTyPlB/Ow8taIxbBQDxymTmgA?=
 =?us-ascii?Q?pRELiQSMQJT5AOpAGR0Oiy+Nhyd4+rFAG0959rmZQ2H5H7HMJdvF0Tpj+PNm?=
 =?us-ascii?Q?DgqLW9BVqQvO0D0Q3sb/AvAg24IE38yog5+YYGE1kHR0a5hsz1GR8Hx/N5xN?=
 =?us-ascii?Q?HXgfwecEeMPn0znv9/Cr5wtNJfGTghtzQrne5H1lGFNH/sr5GNQPr0p3QHgX?=
 =?us-ascii?Q?WQvDpTHWdegFMndKLBuJUW9kUSzMGS34Dv+t0lYh4cQYaIGgXg0ZKuRQHXXf?=
 =?us-ascii?Q?xH6F7y1TyhxwiHjdICY8DBBuqo66smh1ciR39ckJa1sYzmqVcrkqlThCk8yO?=
 =?us-ascii?Q?7Smg3+zkC4vY7pBRA2giIwHoYoIUk9+1Rz9wgGjNlm8tVUxRNdSZRMppjo2a?=
 =?us-ascii?Q?zv8SSRqBTS4M/+qules8Dts5WTPxrO+65unWIH0Du+hzCvuU9fiLojnedWfI?=
 =?us-ascii?Q?Krfh2UnN7xsi39LE/3Y9v9ilmhavTjz6vBVPbRN9MtRYCNIq6s36Mvbe9v85?=
 =?us-ascii?Q?3IHgI5zQFPaEBmDj5DuN8FygT2GlUJDven6N6VPI/hpWhR/xmeQRHA65O4DR?=
 =?us-ascii?Q?OF4XA2Qnz2VmLLWcifbSp9tyBdXhiXJufDXWe7Stgn/khEyNq6+fUmaljs7e?=
x-ms-exchange-antispam-messagedata-1: 1LtWP9TO+s5nHg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dh9mNG/btQIWrd+V0tZAPFD26rEEEMgd7fBqm6hSkE3ubPzTsf4dWd55xvOOioqJ/d1ORqnhieVr/n4XvHpd74T2yNVUjE55ExyZdHJl8vFTqighziOnOr9yBf4v6/nwYv3/Dou48yNsZbBc5aX18BCe0RuZC2eGsqQlFPHju9p5nISyghv9aPUyGvwDbxKLIQuPXlB8BHlj4QZv6WsH7v0xZ4JRnsO8ifZCbnf1MxS/4w9HK9QAb+6+4As/SYU4sNQqfGvX19OR+vkPeYd5ZR1CMgoTrYpLJaxp6scvr1JjXOURxczBKsCWri8tyZ5PJZ7QLlSZbjyWmIf/RmgF/Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b189aaaa-223c-41a2-3267-08dec275a5b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 20:12:48.0054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBVElcz8L3i22aDQ33C/NkD61UNhcMyXdXZTkpXIKkf8MJBPYeJ1gGPZs9bDFyr2z0STVwHoNu73eow/aBmjfNTgYSkc6BcEynLg8L/3ylk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4938
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

Changes consolidated with 20260604201005.3771198-1-jonathan.cavitt@intel.co=
m,
Ignore.
-Jonathan Cavitt

-----Original Message-----
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Thursday, June 4, 2026 7:52 AM
To: intel-xe@lists.freedesktop.org
Cc: Gupta, Saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Jadav, Raag <raag.jadav@=
intel.com>
Subject: [PATCH v2] drm/xe/i2c: Report i2c irq handler issue
>=20
> xe_i2c_irq_handler() calls generic_handle_irq_safe(), which can return
> an error value.  In all other cases, this is passed to a
> .*_err_ratelimited() error logging helper.  Add the missing error logger.
>=20
> This issue was caught by static analysis.
>=20
> v2:
> - Misc. commit message changes (Jadav)
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_i2c.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 706783863d07..acfc171483b2 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -177,12 +177,15 @@ static bool xe_i2c_irq_present(struct xe_device *xe=
)
>  void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
>  {
>  	struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
> +	int ret;
> =20
>  	if (!(master_ctl & I2C_IRQ) || !xe_i2c_irq_present(xe))
>  		return;
> =20
>  	/* Forward interrupt to I2C adapter */
> -	generic_handle_irq_safe(xe->i2c->adapter_irq);
> +	ret =3D generic_handle_irq_safe(xe->i2c->adapter_irq);
> +	if (ret)
> +		drm_err_ratelimited(&xe->drm, "error handling i2c irq: %d\n", ret);
> =20
>  	/* Deassert after I2C adapter clears the interrupt */
>  	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
> --=20
> 2.53.0
>=20
>=20
