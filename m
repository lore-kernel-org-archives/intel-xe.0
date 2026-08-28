Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114E8C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 05:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B958F10E472;
	Fri, 28 Aug 2026 05:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xe1lTAmy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF8F10E472
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 05:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787894738; x=1819430738;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mQOzEKjCHlG+B/shYTiBA1jYvX/jvz9LXB/RD9zU9N8=;
 b=Xe1lTAmyDuRCYPPEUArw1aTU9se+YZ5ynYHvKCIjZBMx/vKixLfqK1Gy
 iskSjnxoB/IGZYCJ3wZixDiB2aVpNjWyzRZ45P5A6SpbrOy3oMBN4TJr5
 aI43xvZ2VSv9Jl5fQzrbg9+YB9mdcGbTJUTWKfD+1jnU+DoElvUVtPNLg
 QDLD6uNGODkTwC2V0HG/DYaEE0AWeF+O0YtuUaoF82Zu425S9xdtPo3jI
 /aWZehXC0HWnEah0T5pDSsl0VpY6uPMqWMjimlwc3/FQJ3ESmAVuYouLY
 0D2lATDqDsecPDFGBuAf92DeSGZlxa0ElCUXCGrUhBHabAdHxpvsRFgtD g==;
X-CSE-ConnectionGUID: fVZ5yfefSgyAFXRYYwcrEg==
X-CSE-MsgGUID: 2cZBiowdQdCdDRY6XLc66A==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99751576"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="99751576"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 22:25:37 -0700
X-CSE-ConnectionGUID: A5FYVKQITKWX/vjJfbX0VQ==
X-CSE-MsgGUID: 2qmB+PZwRKmxs29sU2/fkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="266757741"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 22:25:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 22:25:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 22:25:36 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 22:25:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEBkqnq+G4Aw3RXVjB38nTBHR3K8fa7Kps4WXfIrG+L1fXdPinhHtOv3x8/Q+CrjgD8UF375NMwo6oew3vWYLXbkRTPj4WT4O5GtpGK+Ix3/0mdy9X6Uz05snHUKHX28QEieilxf2cQKw0yxP1zTTmGn5TKFZ789SMiO0J25zjXpygdpFe5zseGuY1OJ1Hgcn3GOh3gnDpabjpz2psOZv67JDQ0SaCOnwXNW9WrfekzLX+qkXEV6pwzHtyji0cp/x+GgoASAMnIorq8uTi1PFYsjTzUADOsN6oijdp2piYG89JpSXSAUs9UtSB4tXWpowb9GgSJ72UyeOYH6GAciTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQOzEKjCHlG+B/shYTiBA1jYvX/jvz9LXB/RD9zU9N8=;
 b=RNBnhqvJOTpfP8JkiSyeThHfETbbw2320Cy0mCPYID1YWSJi9s3Z6EFR0Rg5asy09DLtpvsUMAPdjcY/v3IdXe5IiPB+lkcejovSdRiM+8yG41u2RwiBG9OFoEIEZY4MTpRXcXzz7hTBZI91SpD7w7c546Eqxl2IlYLIWGMBuNWnmjo4tVCiH9m7wbNeIA2nvXdAWHqWSI1Q7H58rMmQmwKPLtVtpi+fIKFJlBiLQQwhXJvRBwnw5OnZJ4v0Pdv8wt3wgfpKw4S9UXy2OJlEHMylctD/fDgFuZ2v3i+XCPq5ZB380URd4wCBs935bhtiAYXcBdkTWozS8aS2Nhy2sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by MN0PR11MB6009.namprd11.prod.outlook.com (2603:10b6:208:370::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 05:25:33 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 05:25:33 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "Yadav, Arvind" <arvind.yadav@intel.com>
Subject: RE: [PATCH V18 03/14] drm/xe: Extend BO purge to handle vram pages as
 well
Thread-Topic: [PATCH V18 03/14] drm/xe: Extend BO purge to handle vram pages
 as well
Thread-Index: AQHdNWIa8lHAO7PzpUyTi9OWg/AoNraw7aCAgAB+jxCAAI0KgIAA9vpw
Date: Fri, 28 Aug 2026 05:25:33 +0000
Message-ID: <DS0PR11MB871878E0D13455C28397749A81AC2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-19-tejas.upadhyay@intel.com>
 <ao9rmRZlZMf_kqSV@zenone.zhora.eu>
 <DS0PR11MB8718159BBB829F3009BA9FB281AD2@DS0PR11MB8718.namprd11.prod.outlook.com>
 <apBLqyLbxFisF5xi@zenone.zhora.eu>
In-Reply-To: <apBLqyLbxFisF5xi@zenone.zhora.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|MN0PR11MB6009:EE_
x-ms-office365-filtering-correlation-id: fc567ddd-fdda-408c-e289-08df04c4c878
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|18002099003|22082099003|11063799006|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info: dLQxn5EZUtRQMKcXeiu1oliYWadgloi3zLdtCFWLOwhzR3T7Rm0cVlKM3hzfylRLQYaBGdNgnjEavWQ5DZKHqBWu1on880hmvjzg61FsdyyjTOp6oddSPzLuiInYR7GKwWjreSS1SYoNo+cg6UNTzjJEI/9YV8yhIg+q0HedwQIiGTn/VFrfjQRRRy+PJrZArPEyPKoHqjXnuLi+GTlL1Li6+eQ9x86nH3SuQ0HLPPlIfRKM2venm6U7AoMY81dlUxu9ysDzB/k5BzM266ojLvRjOK4Kh+bBayH9eWIhc0bI4YNPbhi20BPtiM2vjsTTK98nKo9JlDg7TpIZJlmTqaJUoxSIDO8tQWaaGzBO165to0NHFIotw/BSVvXITp0rOf3KTUxJ9Jo2dk7DB2VLIFM2CAGOY+VwBC/Hnbw+/oduXZLps3fZca601lFmaKyfDF9tXK/bWozmWMHsw6aiT9EVJX8MfPmqcrEUct+F006pLkDHq7gzhPn6kSdR/Q/9kpEwr/vizWCQaf7tTi9M+ynsh4jE0Ux7vudkFFIeqMVGW59osUC58O1rBrQDp8VDox07ICJgzvhx6ONC2Og+twV/HhFsSpdEHwgebm5F0/a0HadooCoDGdoZ89rvpCaLyDNrWxXTKjOhHasriMT5+iVGwTpNt1ymwRolSjqstO94PgqIrgDFzTlxkTK8X5J8SDXLGY71JYLNfcV5LSPP3ZiokGHxPTUFXsI7r2cm8dI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hKOkFyXzSzICT9wB1epc/ALUZmuujB+KM9s8/wTxQR8IL6w9UumsqDBe30jW?=
 =?us-ascii?Q?JlWKotoYr0eDQVhvFrj1ckM+j5JlOBcSdWc8j0U3eshJEhRqFVxo2lz8sZYI?=
 =?us-ascii?Q?lhTn0sPVzZAU7Xch7Ad7QiQEJU0gTO2apQKvTXElya25OWz346y/XAHrDb2i?=
 =?us-ascii?Q?35YF6sSIGnN8I5Beo9DutYczQvnM7rmhxmMkVkpepnWDd9bXQ/7T7Hyrwpij?=
 =?us-ascii?Q?frV6jr+wIK89LjfyM9EjSveduw1V/qnBejk+ca5W/NI/GkbCFoqMSkxPBiOX?=
 =?us-ascii?Q?lHFDN0dZVGQr723c0izU0sm+mTl/xaafyprAIs5LyLUx9L/ovvTbZzDdHfeM?=
 =?us-ascii?Q?ThV0eCk5H6VVEjdmZufVqgtlO1LYkKcISU0KI6YXrFVts+hhVMxOVzNTZCpC?=
 =?us-ascii?Q?7+F1yfjiSHXtH8GARo4zWBxSzlurayewcqvuzMjMc8LvkOYSXaznYbRvidGO?=
 =?us-ascii?Q?VpaDVeDTGalnzAnXuAuFy5GD/beLhY6/qs/JEEeWOLcKy0xnFVGpP1BdIuUR?=
 =?us-ascii?Q?6XEBB/Mg2nh6f0w6SwnMi1Lo1fEtxkuQnPGDvvJAl02kpimHKWePofOf+TiN?=
 =?us-ascii?Q?r24BLIn+hVyI6Kdp170n2+z3X8R6dYXBcAeZTJEuAByDqCZtiPPtpQq5SzVq?=
 =?us-ascii?Q?baBdxPtItoh3pRLLj7yN9HDI504uGCf6Yv3+S0eR2rSp1vvhKuxhP3xf2ueV?=
 =?us-ascii?Q?cAjeE9kaoKLbAqOJbzjncCcmDpj6SoX/W9asn+eApSpdmTtN0a6xF8sBESHt?=
 =?us-ascii?Q?bjKd8mjQkuquesEyPOGZ5jwPFtUgXRUOF0BX7Hkaej9VsUiuGq0TwzYx+qbY?=
 =?us-ascii?Q?CyPz4ykgDUj5jMEhbbELYnvy7AVZwtATiOmKnaxYxn5qC9D+CG8DEEcxdrpy?=
 =?us-ascii?Q?69pnW9znLh5OT9VcsoANRulXytIys3CO3w8mCRJrIK66QGN0OLiEq/4krW9f?=
 =?us-ascii?Q?Ga5Q00d473D3WLnTnfldBpq1R+Ybp6lgUgAibYXzElvry2znQB52GmyuJttZ?=
 =?us-ascii?Q?D2yetYk8WNg0ezPi3f9C4RmUXU6Ps0V8fABPME3l0okItUwQ3KnXbeJDhyE5?=
 =?us-ascii?Q?Cnc3BDbKl39JkIj8l2B9y3URI2JD0YL6U64PWwxIEQIK3/CoDRXgdJV3wAv9?=
 =?us-ascii?Q?w9FeLbEv2rBkH+lSTMo1+7TSedwR8JYbLXMhTIbBbY6dooC6dXFaUEO1Av3c?=
 =?us-ascii?Q?FCNZPlbf/UCBnGriwHvvv3qlNo/daBtzm8wNCnFuPom7B4BPLXKr8xKhOdS3?=
 =?us-ascii?Q?5ujy7syf4t/HyG1McTOZ4qMcE0yLUa/8G7F3IV4lY/MAhGnUqKskVuiXL5B+?=
 =?us-ascii?Q?LMkdvv4tmc6s7CgYJqmcJ9BGj+ePYw0tk8JWs/wqbJO3QCP4GBhQKr/TZEWV?=
 =?us-ascii?Q?vbpfpC6ET03oLmIyEDakQrv0oM3VtRYGPYd1F18vuqeTfwc/Yy8S73gyt2L2?=
 =?us-ascii?Q?hvIohq28x0VFQdSLiCyx8Nu/dhFJ+g4T2NiC2HkIaGCNgMJWgwqJQ10QfQtZ?=
 =?us-ascii?Q?Wnl6hA0J1RBKzSUfMYMz3GjOrHRGFikRxOGuCPLhIJNXdFDqnIdqyShUsgCL?=
 =?us-ascii?Q?bAljQfO6k3qGPIXG/vTyQG/1OCTGthWgiv9qA9aUmBGHPp1f7DXuKe6N1QQV?=
 =?us-ascii?Q?hLMzY6uGYtTH89DTRQWDPUshRQ+mn07Z8NkdMDEmC2Lk31MlYwpd9alrafHb?=
 =?us-ascii?Q?6ru+I/0yCPHy8d5GTSD10XhYx4Ra9oBT4CB3kKgN0vX9UXCaz9rkPfBRzo1G?=
 =?us-ascii?Q?b5j/TGzEUg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: h6W/IIav/zmYPTy5gxKOCcb9sEKzI692p6cyhkJYreLMMFLgDTW1Tm+5992Iv48Zm6ANjglE+OOT4lj8qIcivzWVe5W5lCSiHiiIaT1cFs20xpy6jyi9Ovim0A2v1gqJq3sEBtRhPVisrnUzc8YAHeAywMfw/gWTrhE9XMEoTGrRP199PnO7yVFIntf4DSCTJc0rwG5K8seCYUh9bmW+OSn6ylvy0AL9K76wGDfVcsFkTxXlDtWt3ZnLt+KYLwLFuia/DoHSd0Lzbur2P3y809KJcSF5YrevRUi/lMEHv/H7CqW8D1bkQNG9SFROd7vnTRKYcjoznizst6P5ZabTJw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc567ddd-fdda-408c-e289-08df04c4c878
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 05:25:33.2903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1BDTDXGrWSdWp4K6Fx+6YRcgsXp7iA+eJK4ntaWGcUV87zTd1aUSgRweG1hKK80P5reEUjIXwczj5W8xsC13N9kiylq3zG87lDLaACueMnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6009
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
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: 27 August 2026 20:10
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>=
;
> Wajdeczko, Michal <michal.wajdeczko@intel.com>; Yadav, Arvind
> <arvind.yadav@intel.com>
> Subject: Re: [PATCH V18 03/14] drm/xe: Extend BO purge to handle vram
> pages as well
>=20
> > >
> > > Besides, can we split it in two parts?
> >
> > Not sure I understand correctly what split mean here, anyhow I will add=
 little
> elaborative comment here.
>=20
> we can have one patch that is adding xe_ttm_bo_purge() to the library and
> one removing the if statement. They look independent to me and both are
> vaguely hinted in the commit log.

Hi Andi,

I think for such small patch to split does not look good, rather I will mak=
e more descriptive commit message to explain what all it does. I hope that =
is fine.

Tejas
>=20
> Andi
