Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896B0CCA472
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D4E10E696;
	Tue,  7 Oct 2025 11:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7SWL2El";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC4D10E6A6
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836470; x=1791372470;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3cK5rhMpyYn0erHk0Mae491keXrrckSLnAogoa0Ofkg=;
 b=H7SWL2ElGtKrrDvQcFV6tynD3fkI4EFoXk+fKWkwYx/mab/a74ENjDBh
 cFnOtaW1Bg8v+PazDFL8fHG7JAZU6T5Vv+IlMWXvse4FRC2OXZLTKu0v2
 J7nDgJaXiilD2gdkaFewRcfRD2p+PGLVW9mIYfELY4tUiChNq2BeS59Hw
 KvjFfgGZOa8spEVDFiCO4GjNZqHeXeeDHaUQLQBVHkSLjVHihiDkC/rB4
 qaIKcAN9cGV7Cpr+/AAm0XY73rIoy4YnEoRcLqYhsYFAtpJg0uyysSQUX
 fQ/MWOsgDVeEgR+pwZRcXvFFBa7YWtJOGEYwOF6ome1fzbVV2ac3pthEo Q==;
X-CSE-ConnectionGUID: LVC7plkOR/+0dA3IiRoMFg==
X-CSE-MsgGUID: PHfyLzSPRWyDJ2RpMiGnxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="49570929"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49570929"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:27:49 -0700
X-CSE-ConnectionGUID: OYFOphwWQuu6MiYRHYeDPQ==
X-CSE-MsgGUID: S4K5Y+AER4avO1vVjHqPsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="185297970"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:27:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 04:27:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 04:27:48 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 04:27:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7FPJpBSUywpKTiJwXDWpvBBjN48pLQSGTzDq94W/kYTJf+uErbBNSeXnh6eFMELoaNNZHZJOqsOSJweVer1JGJcrnXfRdlsEWw2vUnVRUEa66mhcA10uzchGKhUk5ev760h5m9qbzMyHUdNZArnNk/qXBOmaHWOMOnbCWmzHrSUYqVZ3QEPddZ/gP/K6WC1Ph4IWLavZgSbnGei+54cwhoxgPR350MFAtdUJ/WXFcRJ5zTblWgRllybohivYRmxE52t+sUL8aTrojRvClle/z2cu+bAteJlquDm3cYZXko/dMMc5QO6bgt9GQ3UT6WPju8RI2odgYl/IPGToQSZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G65/yJCpMaVY8HgP/zMgIaRKX8ocx5pitMrmVsghj1c=;
 b=V9hM78oDIWs+jglKMVV1smtYKC/6pVEhGNodFUYyweGf5Gkfy1G9zrlSY3KMTEpQnxZvtisLyl9dGfx0NPxWJwRRte+uRpDiaiHNllK9qSiuEtxVA0qna4LIDBxkJDYHgXHwIrsfbtr3rfvx0+orHPnTUuZOP06Dkj7oc6iJpD7CWUB6T4W1ts5IXmmskl6GwPecgR0KLQ4pLJnGbXgOdML2kFIRA15syRnswTH5y6uHzF4sVORcMv0z4SHqXNSpILWCm7qtRq+RLQAIC0F5Yc/yKL9eM7nxIfuwJPFVHtOBIpLl6FYdkoSAIesYvpO2eyVod8+Yaq64NkWZijapKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by DS0PR11MB6469.namprd11.prod.outlook.com (2603:10b6:8:c3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 7 Oct
 2025 11:27:36 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%6]) with mapi id 15.20.9137.018; Tue, 7 Oct 2025
 11:27:36 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: RE: [PATCH] drm/xe: Move declarations under conditional branch
Thread-Topic: [PATCH] drm/xe: Move declarations under conditional branch
Thread-Index: AQHcN3GIcqihqH6J9Ee1NocDXQW5MrS2ivTA
Date: Tue, 7 Oct 2025 11:27:35 +0000
Message-ID: <IA3PR11MB8987986C7E76D28CCA6C2F71D0E0A@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20251007100208.1407021-1-tejas.upadhyay@intel.com>
In-Reply-To: <20251007100208.1407021-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|DS0PR11MB6469:EE_
x-ms-office365-filtering-correlation-id: 148f4b36-5b5d-470f-f0c1-08de059483e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Jid1i8GjZ3RgCCM9L1iFMaA0r479U9XF091X/IcCR8oQCTYllz/8ZpUhKp?=
 =?iso-8859-1?Q?BK+uEIfedqLQntNov4KSYyPeYETk8nPgLtCLGB+XJ4pISReIM9HPG6V7qJ?=
 =?iso-8859-1?Q?hGzuJwMLjqsNU3Wv7P7noaaXI2CvABl7wVn1dIPuQZtkdw5LKwD4G2E98p?=
 =?iso-8859-1?Q?p/1BzfpnzbBx7CzXR4juJu2U+TiLvKMeCD0b38E2Y6MplpLtWLXmRu2We8?=
 =?iso-8859-1?Q?7d4glfdpTXSSm1hoSWL0zvuZo5LxOSCLKo2GVDmWPFLfUMTPdOrI9cIXS4?=
 =?iso-8859-1?Q?ZRk9qkRN8SC6+rT+EL/jGdCXUU4H7Q78ajX/vvk2IubfbUXURUwDklMcLe?=
 =?iso-8859-1?Q?6kDgBa099g9GLcThT19q9uIT2UN//eDY32RIcPMeQIh9FhT6jtMcq/Eot2?=
 =?iso-8859-1?Q?kp+HKH+1Rxd2XXKCJnL7QvChmCtsJhBEYAu8OEUMvJF4ZaHL+LrkJaPYyb?=
 =?iso-8859-1?Q?0mkBm8ieIcfvKOH7jT1q4m7rBA9mLrTlmi2LCVR/5OtUW8DuDjqnZD04x0?=
 =?iso-8859-1?Q?IUsGgUnxLG9J5J9QQ6jssy3womKCe79LuNL7EeWotpjbHAsu5DBC6IKQXp?=
 =?iso-8859-1?Q?T8b8SS36VzfSMoBu8nEJTjDeE7F0D92kZS+Fv94ZNKNzjMteFY5mGyTIn+?=
 =?iso-8859-1?Q?WxtiGlxB3fiDrGM7ipcsY9/pQke5fHf+n3O3WtgMEvM1/lp1RKDNebdXc0?=
 =?iso-8859-1?Q?OjZuig80OzFRDdmyL7v6/VYo7JsUYoPq2UYpYqAbMCz58e3AFIfmYWTSfw?=
 =?iso-8859-1?Q?HiwpwcaEJLm1pHfAfIcAgxJusOEPyA5ta35oswdWt/e4OiQG93AENqWtVq?=
 =?iso-8859-1?Q?Le5NGwJj3VQX554a78FLT6TgAsw4noLsjvvvNH/OAVXWpAw17zC3wdU497?=
 =?iso-8859-1?Q?m9tiLWtVSsuBntWjJz05QLKLEebmnU9k66zMY08B/yjgHt3uVM55mP3N14?=
 =?iso-8859-1?Q?nFBuwG07ioc8ePS7iSLmYa3+sjY8kk/0IznHoJ4GwY0lb0zW+BI9b3HG+R?=
 =?iso-8859-1?Q?dsiFHy8a3F6jRnDyAsyxfsXMvsnI7J4SI6TMIBxiKeyTorND7QJaUZ6pTf?=
 =?iso-8859-1?Q?OkiyZ6Mw3n1X/azMgqwfSSFKSEGMNM2ztkMUsCEnFr0TPqkAibR3pckgR2?=
 =?iso-8859-1?Q?vf7FSeDBQDfgiPZ38cw/lvufPGQFQMCCPGwRCHCtaq6h/we6wwF5EdCa/2?=
 =?iso-8859-1?Q?JSGfjpYZWj8J3PXBC6eWVUjwp8he75whPByuS9+VTPNKHSHAxZA+kZhn+A?=
 =?iso-8859-1?Q?AGBxURq7rDM8oxDQtJSoT2C+Kpe0zWwcElFwhNaUNw51d7abz5/TL7iEk8?=
 =?iso-8859-1?Q?utLW3NjURNheJD76pBcJjnDhoDuzfhkxs6jzaqzwOy6M4fekAmIUseO1ai?=
 =?iso-8859-1?Q?UoyV4NpbXa8XOFTWwytji/NUwzmWD88b72UzmSwadukInqEqO6cxISyvXj?=
 =?iso-8859-1?Q?Sb7y6oAeSp1k0+ZaPUPSrCffMPoQJRtGehiauZK6QWmGohqwjGI9LYGZBK?=
 =?iso-8859-1?Q?Tpvwzj4UlYDpZCuq+uYUtyWS9lZx1zkhZn5Mmr0Q2TVIkTWwN6VKm/wwxf?=
 =?iso-8859-1?Q?K0VnePm+o+bp5Ce2nggMQgcIl/5C?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?COE93+QLpTpUPg0l6rfGaaH9otSILtwjXnBAnYY4CBvGwQH0EoK4wUbr55?=
 =?iso-8859-1?Q?jMU+RAVBOvJFzErXVxk44aQiGOQKhtJ9/cnOlbWUIl7gjLw7A1dNDYYGAR?=
 =?iso-8859-1?Q?A+X2fokSo26BolwaP6gMmGr8imBCRqgQiFubksvXr3vRhTC82BhksBhPr3?=
 =?iso-8859-1?Q?vEnRzsnODxLFKRfT5ewZlA66Qr4CgfAcaEoF5jIbvI8nz3VOXiypodqUEg?=
 =?iso-8859-1?Q?dNObVP8uYWGaQk9zscJrsgsW3GCM5QibWIlZH8z8zSz2xdVwiqRZQWBu0R?=
 =?iso-8859-1?Q?KMJ2k6sLICzBRb0Ni8j7fBe9QmWxvf3Dzy8PdCNidoqTTuCGppbBTApbUz?=
 =?iso-8859-1?Q?99QZfuSsX3E2/OQSF+OFeX3T00HyXY5li38qMuP3Jp0+V1LO5fpb4XQphM?=
 =?iso-8859-1?Q?c7G7KLhmA0lem8JaHtHuh0jnFRI+FOcj5qCDCI/Oyk9UEq+1sBLIxvLhD1?=
 =?iso-8859-1?Q?rPUQYMRRFMstpMWKrmt0V2odRhSvbAEqNZ0HDNY+GW2f6aprRQ8X1KlMlD?=
 =?iso-8859-1?Q?4JeVjiRaQeQi7ogDyjInubPJOS8WToB2jxk4jqbxUkNUrIeSs63jypXdV5?=
 =?iso-8859-1?Q?77IFyh0q35dLG/kUYksMP8GIsNGuD1fYiBt8zAM+hDEvn57xBwpCrjGlmK?=
 =?iso-8859-1?Q?3FWrkeJTfpUbaFWuK7Qod/JhmDYG2S5ajkFW4oaR6lLiIS9wyIFNXkY66h?=
 =?iso-8859-1?Q?gDPv8BvNu0qaf9dahqKncnC5UoneEMtIUbEDzlkdpg6OL6aFgk0uYaAvYT?=
 =?iso-8859-1?Q?VABj8hPNAm+DYzprduYeYR25YNDDk9P1M8KsgX22T3AJh89vWYY7/eeii3?=
 =?iso-8859-1?Q?vLepIWAiHVUf4tymvPvXucRpsXPLSLU47wkcD6Z/DjrHQTjZeVlf0bU0LD?=
 =?iso-8859-1?Q?b60erT4LZCkERhoZJecmAZ5dER027vgjZKD8BE6Gwj4WPGNPLpzKNvA3dR?=
 =?iso-8859-1?Q?ZEwf1DlLvykezytEIZDgeQSwo2nAabZpY1gZUwmehCp2sFwxq4NEH8eUkE?=
 =?iso-8859-1?Q?Rra9+E3/f+Lxz77Kte3/u+x7LZZzWLd/U6iu8Fvca12CppI5L/F2mk+Wy4?=
 =?iso-8859-1?Q?PRZUxQHUTbuAsgfABpoDqWfT5+RojbvKZGDt+OQA5BVsih1QdCwo33tdHP?=
 =?iso-8859-1?Q?NwwnrQ0Xac1ijfo4qIjk02hNi2gU1qohGsj7A4qv3kaj7Fa8nWQzlMbVXv?=
 =?iso-8859-1?Q?WYU8JvByOrK0OHqUuFsrAYGPpOwlw7HylOOh55dNFwUGaCCWAEjpzjd/r0?=
 =?iso-8859-1?Q?54OPCRBneJtVtD3HiY/Nm9VRHWch2ULGYa71gRgILEAxBxjw4RcfrO1kII?=
 =?iso-8859-1?Q?+pyTjCnkujq0QzDiknRQVjsqgIDS/zgiTS7jCEqLVr035f3KGddTcDR/uF?=
 =?iso-8859-1?Q?tfLiLHHZAAmSR5akuNPZQD+X8ESW1XO2PIpw0PM/MYGlpi2LDUUe3miTy5?=
 =?iso-8859-1?Q?iqq4pU8ctAgJeJIsxPxOKauNz/FdRPJiZHL0uDewNtJ/BBB2wV1Eyg5yeR?=
 =?iso-8859-1?Q?/u96OzZt5NlqiRySYGf5rxqYqfOIvcQERzwQ1ql3BlKK8GJx0vrUNRyJb1?=
 =?iso-8859-1?Q?FIU3WS6F9Dz0OMLnviUtXhgwtfU59fBuJC/TkEMP2sR+KW1ma6mmjGoC0J?=
 =?iso-8859-1?Q?xwBLKUc095kI3tjjTM3AhST9Je+D/qg7dL?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148f4b36-5b5d-470f-f0c1-08de059483e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 11:27:35.9025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lDNRvIbop+z2hDWa/DEdvh1EWE+7p0Dkc/WDF+Kc1fOs7IK745gOz8efGgtGnQtF8LXWksUMAMzLTHjU+iEmJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6469
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Teja=
s
> Upadhyay
> Sent: Tuesday, October 7, 2025 3:32 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe: Move declarations under conditional branch
>=20
> The xe_device_shutdown() function was needing a few declarations that wer=
e
> only required under a specific condition. This change moves those declara=
tions to
> be within that conditional branch to avoid unnecessary declarations.
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 386940323630..ab0302d5f25f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -986,12 +986,12 @@ void xe_device_remove(struct xe_device *xe)
>=20
>  void xe_device_shutdown(struct xe_device *xe)  {
> -	struct xe_gt *gt;
> -	u8 id;
> -
>  	drm_dbg(&xe->drm, "Shutting down device\n");
>=20
>  	if (xe_driver_flr_disabled(xe)) {
> +		struct xe_gt *gt;
> +		u8 id;
> +

LGTM, it avoids unused-variable warnings when the=A0other branch is taken.
Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>

>  		xe_display_pm_shutdown(xe);
>=20
>  		xe_irq_suspend(xe);
> --
> 2.34.1

