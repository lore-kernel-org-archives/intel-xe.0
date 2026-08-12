Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A13C5CFEB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 09:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26F210E3E8;
	Wed, 12 Aug 2026 09:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlUheVMa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCFA10E3E8;
 Wed, 12 Aug 2026 09:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786525884; x=1818061884;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bLeMCye7jF2bD8IkAYqAzRuPcMWTxMmgKplO10FI28U=;
 b=LlUheVMavoLlIub0uRBiBAULB9sJ8lqEQ5gOD9hda2HY+51aQgLqu+6r
 juUcO7ThZlAwrNPhIu2Lpf3vwGQea+yTzSlGrD440SfrYURmt/jf3W1Ir
 mUavgKonee9NbrtGwshjuf/iPBIg7zTdvKc4XL/hst8eqa5RX5Sh+FwVn
 4sB3z9ft+xaSoSIcZRaVSwMepJiNm8JHO71DUVrH1aRo2VS56vB0sXMDa
 2BwwMGVyRB20htJ1UsZ845ZPV93xE4HyQNQvsbc4Xgmuf11k5FWVkWqhe
 CbCCIPTK6NSwqQ5Znc0vxye21WtXgNMavb/0GOHMJDlJinNFzC4Y4q4fa g==;
X-CSE-ConnectionGUID: HVLOPniMTr65tixuwNFZfw==
X-CSE-MsgGUID: 8OIxQs1RRsmU62/h5+47QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104605308"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="104605308"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:11:09 -0700
X-CSE-ConnectionGUID: itOcDcSbRuqhJKUO+nQpfw==
X-CSE-MsgGUID: EjZLjahTTi6Jn2PHWMX7CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="288337622"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:11:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:11:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 02:11:09 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:11:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eo4AxBUlA6OSlxjGtMp1iqegb1Sn5GGQ0nrKW5a6/sKVXb405NZoP2xSaslns2uCUdn4DYIBJTIjg4A8lyt+N30OAN1bFXCR2tRo65aJIvRhZSzT9iHYu1GcJWrJ2Eti1rlUO6vDhaMlbCkAuDuqKmz9C5D555fkcEdHqNCSFeX2bM2w1HvtuJmrb3cB9dWewWWDnFrmSWKhBtzfYvCk0Aun1nv6b2GG7d1LV7N2kyL0FrJIDWtJ+IfL7TlhiczWJLesWcAc4Ha0ee9YLEt/rFKf1SCKFeLvx4+NChX2Lq3U69XZwSb9K30Qm46l0oBODdia+aP3WPe3vyOgHjI0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLeMCye7jF2bD8IkAYqAzRuPcMWTxMmgKplO10FI28U=;
 b=KCGa9XCnfFkhAshYCBr5OxVoioRqHt50Ng7rXKc5/lEYOFCiHeZA6FMjygpnQTJA4oFLShZQNmXvpTmivIg/zru+w6TZqJWQ8pXWGD/HfeR1r0Q4jKm75ZHFXWHyLi2hOAdx0UKVVhBU/Qk+NkAVwHUY6dO6OUr8q2a0t3+pFq6K7z7KZ6LqwyhsUszf/MSS+XwAFZFDhbbK19rzEg6VSV8V2N8z6oTB6Dajdm1AH8fX9Rrf877FxAouv0sQ9TcXjIHFoo8a+51oytvrlMnftA7XUAj4uCZcI+oStfJdSqDGJlIokaSKLIiRanZF7ZXozX4UmSZU0GXtwGqGjtubJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB7297.namprd11.prod.outlook.com
 (2603:10b6:610:140::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 09:11:05 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 09:11:05 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/3] drm/i915/cx0: program DDI_CLK_VALFREQ with DDI
 clock frequency
Thread-Topic: [PATCH v2 2/3] drm/i915/cx0: program DDI_CLK_VALFREQ with DDI
 clock frequency
Thread-Index: AQHdKbsZQLw9kt38Q0m7t95/zWj2WraZx7yAgAAJYmCAAE4zgIAAAedQ
Date: Wed, 12 Aug 2026 09:11:05 +0000
Message-ID: <DS4PPFE901A304FFA6E05BB74604B8235E9E3DC2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260811175844.2613721-1-suraj.kandpal@intel.com>
 <20260811175844.2613721-3-suraj.kandpal@intel.com>
 <d760d5c7-6e2e-45c3-b38e-108571d94cf1@intel.com>
 <DS4PPFE901A304FE6C52090B8408482686DE3DC2@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <2c220c302172f25fcc8e526d2bde0699693c3e62@intel.com>
In-Reply-To: <2c220c302172f25fcc8e526d2bde0699693c3e62@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB7297:EE_
x-ms-office365-filtering-correlation-id: 8102e796-2413-4cd2-6bde-08def851a3d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: O0uY79qlbMbMre12CLnLfruMYAiuQqbsRMFERXv30Tz1P4d7Y1bdyv6btZ1rDwNQXuWQTs/EhZsYzlTqfnDukbTNsN3OfERaWJU6Lt/U/XAGeD7lhKS77kFvkVskA1hfFWNYpjDlJiAUXWbnOZwflrALq7TSinyevgbiO6AApXXgKgXnJjj4aLmAZ0tr/RZdeyoe8PIiEEWwIE4VAO8Zn1JTIW9Gn4uklW7efTDNo2r/XfF9+JQFF+wgZqlI+jk/HeGbFimDWNsaZOJYPHDXk6RTAQdK2NZUYtQ6LO++OBdgwfXbXqu8D+L13oRxZtiO0xu8IdzZUSSpXaLkTOfZ9d4P9RTYc0R8YhgzCswv4hrJdGK8J54LkQ5Q4OYG2yljHeEi0NsnXgwL5uGeovcJpUWcHVga9WxvTr3a8+DhXTtW7l5iRShUIM00NhmGhkG0B5kUruYal9TsGZbnQTvCUOzP3rMmfT6BQQZB5KMB1Ly8D+5s/U7kbigxac16X45gqs1feSTcy8leoXjhOM0f7eNtuPtFxIeXAQlE0B+AK4+a8h6A4QD72AGAf7CjGDP2Gr3KK5yMtlXXS88PLewtx9oQrx6seKHDW4vVgseBVccpxOclwNgsED1NZeZErjZJld43gOqr0kSaF6hZv140+U18Spba+ccfZgR0wCIxwwajljMGFXZ5TPX7irg1JQcDxoFRPZhwSNjzlgtQCWIc7lIJBXASOKunG/tJ8SCjjJY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?07GCl280hn7St8x9PnJpztwL34bVmPvFHuP0X+Od4hnt3Sa8go6uV+605eTI?=
 =?us-ascii?Q?+MrAW9gFe2XIxGJS2ibDgyzyF2/B8RnTYubtve0ZfhT1cJs2fWZoXDbW5oKz?=
 =?us-ascii?Q?6EN9awIzX0dvJX0OkSQ+JLCOrwwLhs/lgF/R4ly/pSjh89pxocLIGUw0aGGp?=
 =?us-ascii?Q?iyR8/QNrGdOf1ln0PuTs72F/WPFPqN1HFDunEBY+9qfdpoqh7y/ntybeqfUa?=
 =?us-ascii?Q?a8Ba1lQpqTuQj6Pi8JvtV++7JrYNCkrkazDJ+OAmm9/zQMuYUziIz+S6Co8S?=
 =?us-ascii?Q?cia+gCQPzU4QLR99N+IXcx+Y8dOZRk722XL/ZoOC8+RQMmPoqSzkFFdWFyqr?=
 =?us-ascii?Q?gYcH6A+kxfkxz8Iubmz6bGD0Hd0t9LcmxsBEZAtyqm3jlFuIXOl+JNlfrhMQ?=
 =?us-ascii?Q?ECqeZt1350wehs3UNwJmgjbszuPWitpBENKPh18Rnqkzrdo5kN+ZZo3Z2InY?=
 =?us-ascii?Q?GKJEh3bH9zwkv8f42p3cqTRQZDFQl4KidtB7CxoG0jmLueZ6rAK2xa+FZXHy?=
 =?us-ascii?Q?Hn1COcU39RZ/4auSK4REGY6F/788jCa9UNqzPSzvDHn1+I0q2K7ns8Was9ut?=
 =?us-ascii?Q?B0wuK0f2VSA6aVL1x8Sv4HNDF1sl8/0XpwbTKB1LjwGNt3z60OBj+yaJNHf8?=
 =?us-ascii?Q?+4nbKnVL90OCRL0DAhZIJPI0J2Ra9i3LrXjDywB4TBBB4QKpJ4goWIjGplWj?=
 =?us-ascii?Q?2OGcVTScxSqrkStWNiFOqQQZ6p6ckUaQ5c5zMWfzThfTWVSMiFCnbB2y5MSK?=
 =?us-ascii?Q?diFVo9yBl6B4e7RMUvjwxf4MBsZJ6pMcgpdfEuFIQy55BRt5vpOPL8mq1eAn?=
 =?us-ascii?Q?ayGQ+03CY1bj2fmzSPOV6s+p0q0vVsJPF8qZowkd3xKEvDvm36kBwW9tl0n7?=
 =?us-ascii?Q?DirC1kL7ewPO+nI7vSgSEKbnqGLKe2ELC1kSXBffS/zJul5SaEgSqGZZqMlq?=
 =?us-ascii?Q?+uH6MLMIj5yhg07wqHHlD54RT+jkNc2ZzIrLnZq/cNnf9Za3B5/PxWIztmGh?=
 =?us-ascii?Q?cKt+hyzRu+Qncg9X+opdg1naMXlVhYA+XXNLd7qhqlguG4tSFzPQD/yoUU2L?=
 =?us-ascii?Q?JrVY/dhKcyOZ+3GtrpMmapWDYyrhlSDZswkm4m8pFcoWeIuTgMy8HRMwZkSI?=
 =?us-ascii?Q?HD8FhBHCG7V7n70PUS9yA8wTjgm2WP6G+RgPifieJssSyZCm5qKsmSNLDeie?=
 =?us-ascii?Q?V1vQl2jOgzxC8fnK1WLo3yuyn3+DrpK9hHhJ/qDxPAwSDUtmkTQ4QetPoKJ3?=
 =?us-ascii?Q?BMCr4n+dVkFTP0tlzO7M2kU55ZDeDNm9ibW0Hro/xUVIb7BXOAgV4yybV61l?=
 =?us-ascii?Q?B57VsS4wTcsLvTJsWHZ+bwIoWzAJfjBsLQtXvEOV7nWG9tYZb86R9y/U4og3?=
 =?us-ascii?Q?hLhq/HX2nG2TiklbIDZTezR7cLd3IArVZBcLgMFu7ZxSK1BeEuq8+Rrhv3yd?=
 =?us-ascii?Q?hHo8nI4QM/yxHzOOnzQW6xmISmSjCHOTrnQN3zWTvACIWxx95jPzX8c+KT9n?=
 =?us-ascii?Q?cP2MZAe7Ghx5a2Hr3H+1zoHGuxOID7qjv4USwlSAGGfUnZi5ALFg2bL7nOFh?=
 =?us-ascii?Q?uhXCbMMPbNRNxMmP0CxYhzpCFIBYReY/zeOlpy3oksI3870MKBno1grmjvi9?=
 =?us-ascii?Q?S8OEQRwJz14Utf+p+TGcZUGP7tp2VPfAlmq65BoTCyWWYZ7zpvC/ocxQdnok?=
 =?us-ascii?Q?lDf8sNInoHR/V49RuBz5HZTPInOZnMYEG9V/lVLULBZvG8FAnWKH2UPYdBnx?=
 =?us-ascii?Q?tRI5aogm9g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qj/MZ0VC/Im23Hym8SOcd7M4+N4BBTUVUEuGoVEPPAP60lNrA+yjuClkdAnvznyHGedGo1UfSbu0I0kJD4FbDJMd+VISIlp9Tzh6YyBF12zTk0VAjGy7RyE2YEZRcNF1oIAuFNROkpZkwlt7l1Wi5jzNPjjYdarZ0N0uWeh6fNaMhzqUEGSvIre5u9XIly+AjlYKPreRoozBoJgs2ftHy3Yk7aOfLte/rBRw8N6uoMobGYwIWchCfXOwQI+s+QIE6WAxv9vfZ+Yz8b39reyTNmCAdRbtctAPNyMriBIMTLU9vw2ovNPGYBMCfi6A3T7oKkGUIbywfhyC0klaiq4Esg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8102e796-2413-4cd2-6bde-08def851a3d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 09:11:05.7332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BBRF9qQQqaw/YMJkAgslw9m34bNpckv1k/OX/G60dxiM0ZIOuDBTvj3kGRf6XB1tFrsZMyzLE0CP7vZ3RbdmIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
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

> Subject: RE: [PATCH v2 2/3] drm/i915/cx0: program DDI_CLK_VALFREQ with DD=
I
> clock frequency
>=20
> On Wed, 12 Aug 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
> >> Subject: Re: [PATCH v2 2/3] drm/i915/cx0: program DDI_CLK_VALFREQ
> >> with DDI clock frequency
> >>
> >>
> >> On 8/11/2026 11:28 PM, Suraj Kandpal wrote:
> >> > DDI_CLK_VALFREQ is programmed with the port clock, which for DP is
> >> > the symbol clock computed assuming 8b/10b encoding (link_rate /
> >> > 10). For DP 128b/132b (UHBR) rates and for HDMI FRL the port clock
> >> > needs to be modfied.
> >> > On silicon DDI_CLK_VALFREQ is a scratch register with no functional
> >> > impact, so the bug is not observed.
> >> > Use intel_ddi_link_symbol_clock() to write the correct DDI clock in
> >> > kHz.
> >>
> >> Perhaps can be re-phrased as :
> >>
> >> DDI_CLK_VALFREQ does not configure hardware, it only records the
> >> frequency software intends to set, so there is no functional impact.
> >>
> >> Patch LGTM.
> >>
> >> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >
> > Thanks for the review
> >
> > Pushed to din with above mentioned changes in commit message
>=20
> Process nitpick #1. This series was pushed before there were xe CI result=
s
> AFAICS.
>=20
> I understand the series is the same as v1, with just the commit message
> changed. But that's process nitpick #2. Please don't send a v2 to just ch=
ange the
> commit message, on the same day, with no other review comments in yet. Wa=
it
> out for the review comments, and if the only thing that needs changing in=
 the
> end is the commit message, you don't have to resend anything at all. Just=
 fix
> the commit message and push. Ask in the review thread if you're unsure ab=
out
> the wording.
>=20
> In this case, going slower would've gone faster, and saved a full v2 CI r=
ound on
> dozens of machines, just for a commit message wording change.
>=20

Sure Jani will keep it in mind going forward

Regards,
Suraj Kandpal

> BR,
> Jani.
>=20
>=20
> --
> Jani Nikula, Intel
