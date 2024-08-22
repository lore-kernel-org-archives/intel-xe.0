Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A937C52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 16:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C6E10EB47;
	Thu, 22 Aug 2024 16:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuSiqetl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6C710EB47
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724342961; x=1755878961;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6pKTCnzPe0lEdZomnH+GRrFuv/HsknST6MyvuqCnRZI=;
 b=IuSiqetlvJGAQrh4QC6en2MIzs2mjBElz7HsGRi0UE65fRQjyrJdL4+r
 FRmFKU+MnJkMUFb/NVm0sJbnyIxXPM3NPStVT979eyz8oxEx9OjBViyz4
 FnxBa9SwuKJY5Ocz0UNcRm8UWRdRSHgvVyh64rfzgusLrp7c7E9ArrD3g
 PJFhxKHmx498IzINbgNfLrwcjqmUzjqHuvi4qB1aSR70edRsvhEx6YadI
 nBcF3MVr/yk4lV4jKI7ucOxEJlqOkOQh9M1ozU8SvaBYn9316piWU8xtk
 bBVNa0N0k9brmuca1lP+aY5fmFer+HQTuOXpxwU4xmtxrUvfjcz2dGgMP A==;
X-CSE-ConnectionGUID: O7x/QPgRRtqfUKNcB2Ujbw==
X-CSE-MsgGUID: XtAH7hQvRfOd8r6YoJp9Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40282943"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="40282943"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 09:09:20 -0700
X-CSE-ConnectionGUID: MjVvtBRfReOhjwD+pawNqA==
X-CSE-MsgGUID: dagVw6miSuiZMs4suc/jBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="65834883"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 09:09:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 09:09:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 09:09:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 09:09:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEhWep9MloaLq04T2heiFIkmXmy+QefgLW6IdX4gjLN0nKq5KLn5ZAC3mYWuTmDOLUNO9Ya3sx76llIzuNJTQe+XCCbPqb9FuaidMTQXXwl2ZRl5OibQh7wzWQls0iBIfSFHUAj0D+TCZuCef/QQgFIdOpTzS+jxTK6PU8j1uOw5fiDA4tVu0g5/TjNQxedwqd8VIAEfXfqSA7Zinj+0QMB/uYU2xECv/cWvhioNPvaGZmVz2H7LVhBxwNEwlLLnkjVRVj4gc/c+62uUAMiJ9YN5sG+AweMNOtCo/Z8zxPvYvc0M17/1gBlFA4mbC+zW4XHHFJEHCPlj+qIa6Kq7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1L0JnWk7MeHcHJy3UFaB5sIv5UHsd0kaHSNfsUkxzwI=;
 b=YhOyMLdBouTVVEq0h/ASepYutTrxzqM4dYKFqZmOMcVLwZh57g5+kbf0FQ01+SydJwXIs0iYrBZ4rzy3VDxLEQz/+YrAyKMR6cKe2saYUrDBk5/EGXDkEZ51itP33oSsmAu7KnfC9ag6hoVsXJP6RtRwRQ7K32lrhXWBrryhDHJOKnMPbCIuY2EKJfUR6y3FslpCRjp7NFFdEOILDKmmpFuTCYS4hrsD6N80HE39XbWqQFPOjHEKbmLVqgp56GAHdgTld8GAXlC4IyuEiYSgVxrZTbgWz1s9DezW8kcMcDpGf2li7nuufKFYY+Sd0caokjfoWtLfGVSEhDFxC33SuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 16:09:15 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 16:09:14 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Levi, Ilia" <ilia.levi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Elbaz, Koby" <koby.elbaz@intel.com>,
 "Avizrat, Yaron" <yaron.avizrat@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 5/5] drm/xe: separate memirq reset/postinstall from vf
Thread-Topic: [PATCH 5/5] drm/xe: separate memirq reset/postinstall from vf
Thread-Index: AQHa9JR69cH2vjdg/kSnF80u7wixE7IzbFMQ
Date: Thu, 22 Aug 2024 16:09:14 +0000
Message-ID: <CH0PR11MB54442CC53E85046BD660408AE58F2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240822130815.1355437-1-ilia.levi@intel.com>
 <20240822130815.1355437-6-ilia.levi@intel.com>
In-Reply-To: <20240822130815.1355437-6-ilia.levi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB7521:EE_
x-ms-office365-filtering-correlation-id: 2f40b0c6-2083-44fe-f07c-08dcc2c4c4a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?klRPnj8UkYlcAoWwVhFzPTygWZ/OWzoDBBBfSxUb8u0g0oXRMwJITdp/J2cP?=
 =?us-ascii?Q?IUNfxHmE/Gyt5C4wnf7DyLj9nwjRCluLiTrb7JVrjwjuhNaKdXNHsvJMay7M?=
 =?us-ascii?Q?eOxwcWK15VZ/s1TNxpTDcugkoJ/NId9UnJ23zEKWFi9d2IhQr+3ciuPf1aZ1?=
 =?us-ascii?Q?q0iTfh4v3j6sjzZ+a7igcfqHdL6iP/rBqtMMRXa9MIKu64BqPP63A5rJxaaw?=
 =?us-ascii?Q?8znaDByiZK19xzzEejkBFuZorR2becge3BZ60xFALMiKlD/t3wmnMfmi8mAK?=
 =?us-ascii?Q?4eNUTfgiC5IOnG44juYqcBJI3d52d2An+ghXfLdbwwfTpp6lc8FWJYtUOM77?=
 =?us-ascii?Q?8r7XNutUp0GQ+7u6nKtVSxB7joft4nRNip8ZvmvToRN2+TJdIhkStI7m0UPu?=
 =?us-ascii?Q?YG2BTTK9SfwpShCe9q5jnZ9FPep2gCJq6gt9UEjHE3bVGv6UJJz99gu49gQN?=
 =?us-ascii?Q?hTNCBlUW+mnNV7hcnjDGkDDEhcSQxPGvJ746dBEEH9Ls4nF0+9ySgyJ/JA/8?=
 =?us-ascii?Q?PWy1hnmkiWUMpfVHyblAipRrtcPbqqSzGLtSsg6dZejEqJDkbslkjtKKTVG+?=
 =?us-ascii?Q?rbfbwzdIxfjJ1SDsg2PEfc5A9+Bo0G2qxfZzQkhLQpdAyr0wYrilENJxBNFx?=
 =?us-ascii?Q?fbVKhWZVwOHLwoMi0B1uR3ZYiLwlCnw8jIAlO8qYPMF9S9uuw5u6qucG2Czv?=
 =?us-ascii?Q?kmuikt4mL5K1Bb0AXnIcqc1LbZ6VQMoY7W2T5SgRC3ZK9zDKvLAM5K3pv+5I?=
 =?us-ascii?Q?Z20RnTBQsr61IH8zZb44otywG1Bij+EeisHmS9XDLN1+3EfE/jo9wpUJx4d+?=
 =?us-ascii?Q?tCFB+KLZRITAlEn3+P8cYsaFmuu+HVf976FX1sXMKoOqJY+gpci5F7RP9KlN?=
 =?us-ascii?Q?+XtmZaNEPictIlc/crcUEUTLqqaYr9E8XgY0ovr+VEt63Ry4n4C8m6bL++K1?=
 =?us-ascii?Q?GMA4y20KqCtyie7YwRXZOyoXuNHAhmUKyg/JCD72GJa3FP/+QSJAB8ylq6ck?=
 =?us-ascii?Q?nZeXaD1ZSw8G+DzsU4BkCT7hkgGCwpLCVuYcdnhDPD5BSnihnGVZ9Lknw66o?=
 =?us-ascii?Q?+9FCQWDRiCxk5GgkjiRWp7obGHublnl2RMrxGyAqtGQObJrDI0t4qvmXExJj?=
 =?us-ascii?Q?dq9VTFh1PosIlOQcwPkNXlKVvqPXEeJSOWaim9ePM80Jrwi02rwZE3OR6r97?=
 =?us-ascii?Q?o514vX3ho3kYsIE08VsFPLpv+vt6r+lzyRKH0TawV3j2O+ZdPyZ66FnidD6i?=
 =?us-ascii?Q?wPIq9InuuZCRDSd8XrBFuAYaxnHKs+9stHmFIoLkku+zTlP6xdzMGDEvSZ/D?=
 =?us-ascii?Q?W/vJgo4OvGoRCn/BSd45O8jDreD6Dj97Bdn/hAkjV8ekwRxMjP6OcQPNE/QP?=
 =?us-ascii?Q?Ubkglc/wUj2TQhZ9SeYc+TsOwL5OVw+A8QXaVtQCvg/9ZMJ8vg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QtuYuEGWe4wRq8gkTvEzn1S162aS8ndqogiNwXvC5YynFoZOzHgnSghdO2Py?=
 =?us-ascii?Q?2/zKmGtvxYxcYdJEcqpQoY9Hz8T3/qjACyYMJYMxWHZuBZEmS0chiyZj5L9W?=
 =?us-ascii?Q?WLVbwFs1yy1GfNUy1nTBNYa3HMN2HMOtzstSbAVmvMWZ6U5Y6Zq/KfQ+GXng?=
 =?us-ascii?Q?JkOOlJqaKWmVam5Dje9rtSbFXQxn8y5Qcqd9PnM2Og1Vv343eTtlES0LlFQm?=
 =?us-ascii?Q?Qtg/M8Ge7t9APlR6tqBOQfm3UrS0LDx+nQ9nbPnb2DYQzDvvgEJY51FkvwTl?=
 =?us-ascii?Q?kTOBgJIl7njTft4R/OTZzdlUfHczIWYn+G3hLxnHIbjJuyxzm0fXSt6lEjMQ?=
 =?us-ascii?Q?NCPFV/LQCy3TRo9OJBab/91oL0zAjqHZ/so8AKf/tuJCUzjMDwpIbLh5wimA?=
 =?us-ascii?Q?Eas6y+n7zDi8Kp67U4PlrBTJIh8iMouOeKNA+uXpa0Hzlbn3EHyOKR49w6d/?=
 =?us-ascii?Q?lavlRK9Qa75idK3TYE4Nh1RCjqm8DKYlHs9DbOr9p6jigP5mpr3XXGTqPDb2?=
 =?us-ascii?Q?a1k8js2jkTP374bxGAmsM7v0M6FH+ZSy2oTlgjyfg2bcm3Dryl+QDVVViEKx?=
 =?us-ascii?Q?IlcWJw3hV7iGe6Z/B+n1wewp37IUy+VS6htf9sfg/4vp5Td99206xNeoG0Cl?=
 =?us-ascii?Q?D4uSw67OKuW+MB7ICUeIOKdzd5y8RqAXGKxf395GZTPRvxS4THfBhjSTlhRN?=
 =?us-ascii?Q?m2uHws5fudadMVkzpFNu9iqe/DTeQro++2c+HuDygSmYGzbWHSkgz8hjJZgP?=
 =?us-ascii?Q?yTPjMTlAgQBhcWCWKCFY1p3VQNZufUYeV8M9pMHp0loabya+KN1UepqLpEh7?=
 =?us-ascii?Q?oHxXBt5KuWIrQTUGICLREHzcQsO8eugXn/kqlFzuxByZ8wVGwLG54rbAqdjc?=
 =?us-ascii?Q?jLREbd8ZcFH6a87Vbkc05MQlA33pZRud1kHpMK8Mir/4O39wpz8uaMxt1DFT?=
 =?us-ascii?Q?xYxV7MzpWHKzsVCuI0mGsHB3G5EktIwW1gTti5O+QzuR4n6bxKW+8xJR2Ga2?=
 =?us-ascii?Q?k2VqZJcIgwUaTxO1lif4DeMTYTxHTlpLllmBbUCugGkrhesX7nOPmbRusfHN?=
 =?us-ascii?Q?s+r6g6DEOAjdT27D3kd2ybn1WhBPbXq5bQTD1BhuysktCDV++yBqHbUnnly7?=
 =?us-ascii?Q?6HyPMQF21EsExeEiS/QjW4LImf1ilSsjVFDea44XQpZLRG9ztliZF5dkoqkN?=
 =?us-ascii?Q?SarZiVebWjNje/+ADAxS7qY0i3PmXwki8AAu8LXmxxzM4sBtF3HglaHbXDXS?=
 =?us-ascii?Q?SobiS64lbgS7/r0TFdBN6o3wwsGeGzUZJuEtE+jSq+84GVmjDvNwLqQYMH0a?=
 =?us-ascii?Q?DNwst4kjkHhAi19mNWBZ31SLFIUv5yc0nSUUwXJMxC/dbyOu7t/cFLexWHEh?=
 =?us-ascii?Q?Icb3JahAY5wmnb8F5jBo/HyAvZj0MkaYXwRrOTYSzOg/2f/Fs1TY187xVYKm?=
 =?us-ascii?Q?O5px7IivsnxcUe2ecJG303auBiHZ6I21Zt8oen8BzXm4NtbEhjdVEaXC9EiC?=
 =?us-ascii?Q?X//uuhmbY3Vlcp9o9owKz9LwBG4y7jSWeUNoT8EJguRSKK2wscICFnyYeXgq?=
 =?us-ascii?Q?BiBsQKkdf7uMFTlSr+PzPQVKLoOk1IllyfqTEzfL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f40b0c6-2083-44fe-f07c-08dcc2c4c4a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 16:09:14.7763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DmF6hE/HRCFOTs5dOu3VTIYDKlzLFT6zlwsRLxTT4RyaCgKJb5HvA+F/KoBUVcvdisaI+QSPzWwo/xO+mdaFGglUD9V3i91MPScoU1N57jA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ilia L=
evi
Sent: Thursday, August 22, 2024 6:08 AM
To: intel-xe@lists.freedesktop.org
Cc: Levi, Ilia <ilia.levi@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@i=
ntel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>=
; Elbaz, Koby <koby.elbaz@intel.com>; Avizrat, Yaron <yaron.avizrat@intel.c=
om>
Subject: [PATCH 5/5] drm/xe: separate memirq reset/postinstall from vf
>=20
> Up until now only VF used Memory Based Interrupts (memirq).
> Moving reset/postinstall flows out of VF to cater for other usages.
>=20
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device.c |  2 +-
>  drivers/gpu/drm/xe/xe_device.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_irq.c    | 36 +++++++++++++++++++---------------
>  3 files changed, 27 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index c4f8bfd08b09..a23fb0c81ca6 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -660,7 +660,7 @@ int xe_device_probe(struct xe_device *xe)
>  		err =3D xe_ggtt_init_early(tile->mem.ggtt);
>  		if (err)
>  			return err;
> -		if (IS_SRIOV_VF(xe)) {
> +		if (xe_device_needs_memirq(xe)) {
>  			err =3D xe_memirq_init(&tile->memirq, false);
>  			if (err)
>  				return err;
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_devic=
e.h
> index f052c06a2d2f..4ba07617084c 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -9,6 +9,7 @@
>  #include <drm/drm_util.h>
> =20
>  #include "xe_device_types.h"
> +#include "xe_sriov.h"
> =20
>  static inline struct xe_device *to_xe_device(const struct drm_device *de=
v)
>  {
> @@ -154,6 +155,11 @@ static inline bool xe_device_has_memirq(struct xe_de=
vice *xe)
>  	return GRAPHICS_VERx100(xe) >=3D 1250;
>  }
> =20
> +static inline bool xe_device_needs_memirq(struct xe_device *xe)
> +{
> +	return IS_SRIOV_VF(xe) && xe_device_has_memirq(xe);
> +}
> +
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
> =20
>  void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *=
p);
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 18a5272d9bb0..a080d4869b16 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -559,17 +559,15 @@ static void vf_irq_reset(struct xe_device *xe)
> =20
>  	xe_assert(xe, IS_SRIOV_VF(xe));
> =20
> -	if (GRAPHICS_VERx100(xe) < 1210)
> -		xelp_intr_disable(xe);
> -	else
> +	if (GRAPHICS_VERx100(xe) >=3D 1210) {
>  		xe_assert(xe, xe_device_has_memirq(xe));
> -
> -	for_each_tile(tile, xe, id) {
> -		if (xe_device_has_memirq(xe))
> -			xe_memirq_reset(&tile->memirq);
> -		else
> -			gt_irq_reset(tile);
> +		return;
>  	}
> +
> +	xelp_intr_disable(xe);
> +
> +	for_each_tile(tile, xe, id)
> +		gt_irq_reset(tile);
>  }
> =20
>  static void xe_irq_reset(struct xe_device *xe)
> @@ -577,6 +575,11 @@ static void xe_irq_reset(struct xe_device *xe)
>  	struct xe_tile *tile;
>  	u8 id;
> =20
> +	if (xe_device_needs_memirq(xe)) {
> +		for_each_tile(tile, xe, id)
> +			xe_memirq_reset(&tile->memirq);
> +	}
> +
>  	if (IS_SRIOV_VF(xe))
>  		return vf_irq_reset(xe);
> =20
> @@ -604,13 +607,6 @@ static void xe_irq_reset(struct xe_device *xe)
> =20
>  static void vf_irq_postinstall(struct xe_device *xe)
>  {
> -	struct xe_tile *tile;
> -	unsigned int id;
> -
> -	for_each_tile(tile, xe, id)
> -		if (xe_device_has_memirq(xe))
> -			xe_memirq_postinstall(&tile->memirq);
> -
>  	if (GRAPHICS_VERx100(xe) < 1210)
>  		xelp_intr_enable(xe, true);
>  	else
> @@ -619,6 +615,14 @@ static void vf_irq_postinstall(struct xe_device *xe)
> =20
>  static void xe_irq_postinstall(struct xe_device *xe)
>  {
> +	struct xe_tile *tile;
> +	unsigned int id;
> +
> +	if (xe_device_needs_memirq(xe)) {
> +		for_each_tile(tile, xe, id)
> +			xe_memirq_postinstall(&tile->memirq);
> +	}
> +
>  	if (IS_SRIOV_VF(xe))
>  		return vf_irq_postinstall(xe);
> =20
> --=20
> 2.43.2
>=20
>=20
