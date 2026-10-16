Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDFACC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 04:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F35610E08B;
	Fri, 16 Oct 2026 04:52:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5935710E08B
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 04:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792126364; x=1823662364;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t7OZ2HnC1wUJFIB/qwIuCv/yd75AKxi4fPofigPXV+E=;
 b=SL2dnPWoy4TN81qRe3HxF/8d6IKcKFzP3eOE1C1y5W8x7dWQYTxK2Gda
 2FR9H9kJy/27Yf9BkpZgQZRC5Wc2Y4dQf/acA0BbFQ4pbkaCy4/p2rHrU
 AFBplGLg4s/6VxwWKfmySFM9QExm6Sw0JkEv8+/wg3W/b1y7FUpUVrMYb
 jcQ3ULc5bF12wEsiYYr3+3PJqiuEjvy3Zb7v/8aMMJPsqob0HdLubzHW2
 QmucCeN8WojO5qOWO1m6P9jVFthLCFxtsYRoPioeFrtFRbp/h3FzDjVml
 8F+k2eRyKGFg70d9bOcnXVpkDtylusMfLGaQJZJCkqKmebE5oy2VWRGWM Q==;
X-CSE-ConnectionGUID: TMxx4T/yQp+S+9dqB0FXww==
X-CSE-MsgGUID: tc6QiwEGTReDNqXddmIziw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="798385"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="798385"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 21:52:42 -0700
X-CSE-ConnectionGUID: GgP0ijLPTRmqWxQr9fH/rQ==
X-CSE-MsgGUID: O4JpB9scSjG/R18LpnJSlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1869486"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 21:52:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 21:52:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 21:52:41 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 21:52:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjqoQjbgVIrILVvD4zfPFnlid2EAZuqCXCk02DJA7euY57tELFPRAXFhtqNiDKHpWEsVGTwYd2/c0W0fmk77p9NS1cOF7il50Q2+86sp0K4/5cl3g7HMe1xdk7fJZF9v7RKaewZM6TUAF0KShUL3KAesFkM4k3AAc9xO0ABvnmEgh0e+oRFMqg817OeXxkfx7vJwAvFYKe+FI4G4y7GSbaD8/8eoCnIyDo31fJpewwrJwVL3tZTfOKFFpXdv4lYBzsLOrcQ8Ocjvvlhb2Qjagw0ELYBLxyXOqRodRPvBxm2sYpb2ibm7YaUMZmIZcz+NuXZyWiVkdavVHbVK0jVC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiAk2zn5Z8UWOJE3EtTRx2Kw+Ka1T0QBm4P6GSGwH1g=;
 b=dqa2EzNx9H6Mz5MPSlC+5NgGaRxRFNGreEUbgtDT5O4yB+37huAI/Njozm5NkVF035ziBL3XLF6fx24d/lcOYWzVH6VJ4uQxh2HdUIkxzlrzRoEIb1kvhr5UP/y2hpQVPSpxJH6i2MnYia/M5s7vDgclm1aQs4V2g4JTas/9wJS0bdgOIDape78fksJtvMq8CWBVkvcU1R4HihBzi21ET2P6StETRgvvL4e3qAzh4eZgk1FgP7MmEOvWDS7XcKNaxCtXlQjkG8Ag6VIlVLH8hOY1qtfY/ZJD1mpSroi4GZ7hqpPABA4hQuaXV2UwiXs+qaXtxqJNPYiHXKaD1dNB+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5424.namprd11.prod.outlook.com (2603:10b6:5:39c::8) by
 BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.15; Fri, 16 Oct 2026 04:52:19 +0000
Received: from DM4PR11MB5424.namprd11.prod.outlook.com
 ([fe80::1d0f:8d61:dd1f:158d]) by DM4PR11MB5424.namprd11.prod.outlook.com
 ([fe80::1d0f:8d61:dd1f:158d%5]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 04:52:19 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Iddamsetty, 
 Aravind" <aravind.iddamsetty@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>, "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
Subject: RE: [PATCH v7 7/7] drm/xe/guc: Report errors that cause a CT shutdown
 using SIGID
Thread-Topic: [PATCH v7 7/7] drm/xe/guc: Report errors that cause a CT
 shutdown using SIGID
Thread-Index: AQHdWqGr7enIPmyurUigTc7MrW4kRrb/mq8g
Date: Fri, 16 Oct 2026 04:52:19 +0000
Message-ID: <DM4PR11MB5424A9B1F80DEF2D65156D09E29B2@DM4PR11MB5424.namprd11.prod.outlook.com>
References: <20261012232907.83649-9-umesh.nerlige.ramappa@intel.com>
 <20261012232907.83649-16-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20261012232907.83649-16-umesh.nerlige.ramappa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5424:EE_|BL3PR11MB6508:EE_
x-ms-office365-filtering-correlation-id: 99c2e657-db9a-4ec1-6c23-08df2b414257
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|11063799006|56012099006|4143699003|261009223027099003|22082099003|18002099003|6133799003|10067099003|3023799007;
x-microsoft-antispam-message-info: 3zSe8fIhpcF1uwIUJ/3EilWM192LV4SpivKzCCJ9bvb1tmvx1bDiFVnGkvbq1XKQRWDU3GtnOl+t4XZ/G0UZgO6HSNlD9NN6hCENUx2Hny5vnro4OzezpihRpnZgncL4B/gmYRUNT8Rlhur1NJF7OSzI+tG8ZJrKo7oiQXcqCFMTmoKdlshl3OiOoqGxrcdux7BO+Yw5IPHUf82qNxem1ZJjTXG+e7NmN0qtGm8FR2RoDoMFEsk2pUhbszAHHiRK8KeUOCHi0akzbrhFCsvAwZGvyfAnkXJg3iKIVLyLpsg4cRwXkXmm335jFdYCNSi1rkaVZOTP+Ll/y8MaUGTzLHqBzJ39vIbtLvAwg++E2bqAwVgX1Qas5tnHKl+AKf66fOUnmVorBXgC9300TqfTtsNL0XyzWBMjOFdl4Trd2sd78gFFJ3Vh3j5hgYe/n9VduTF6C5k68o1yDpHBSrX0TLwZxuQqS4pbCQvbS98gwgO2JUVBA9/MyCfRnVM30hx55d7ITsaN6lbTyAfdx2LBCdMyb0pAy2E+GwDh+JmljJZD1hSxQPqMqDrqIUtXqbSYoffFLWit21+YQNP+9HimLOjfQqQ4wCbQxQbA3eOXP9GMllkXmCk9auQ/U6X94sse5bWVKMfcgTNzT2RBiqsiZ17dP2qNPd4DY0KOTbNutQE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(11063799006)(56012099006)(4143699003)(261009223027099003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CABEOlHX0OJXCa0HRKsE/E4EdjUXmvEJBkqMOZ/ZGfehQpkazyrPP/I/+738?=
 =?us-ascii?Q?CGpmazyBLPR0gERlpOmdwGg17rPMRfL1C6aaR88M8geaTGSTeRWSnBtnf+PQ?=
 =?us-ascii?Q?h1g2EBRoFMHZqpqs9eQbiNW89gqVQ6CGGUYvCtiuEsbk5GX4mIXaSY4viJEp?=
 =?us-ascii?Q?HmV7SQ5moE653G7DDgjODvrzmF2UrGpG97p4eKhkSLqfMf99/O1EC/rt4D94?=
 =?us-ascii?Q?oPfQpWOy4McR0xm8QMHFqYsAx0wAwpgwF0Fc2KicEJop+l163F/oXva3hhix?=
 =?us-ascii?Q?UtZ0hmOgv1zg+9z5byvIHCh0IqFiqbsnGd+0dsoMm5lCcJfNAsrwts86zlIl?=
 =?us-ascii?Q?71mhG3jpM98GythDv9hM91mBiuCHxrZ+hpoH2rWNWnOBP1agyjnHR5CzJkPX?=
 =?us-ascii?Q?lHgpUpnZh6WeWuN4Sx9r4CIDdE7uUzKAEzUZnkqI8Re1OB8bKB1B08bXfk5p?=
 =?us-ascii?Q?YhCtoP782BwZ9Sb6FLIDvrO90d19PkDBmyDXDceq7O/+r69PIYDZQockc/LN?=
 =?us-ascii?Q?5cNZHQYrsitFNPoFfGXs6PFinYwswXBfDy3Y++EnNHSwbrK4j1nwxU4pRpqJ?=
 =?us-ascii?Q?xJStMIUuwBHTBl9KIQdToqs4tXkNIuFnX6tk7QG+rgPjsdW2dszwiQIty1ul?=
 =?us-ascii?Q?Wq7zH47hSdP5+mYGu1B53/kLaGQtixyVrOhqjBy+fvVRiUNuQvZI7/s22Q62?=
 =?us-ascii?Q?yox4PTK8QW6BJEKft4FGUfKd5BCTFLSSmRxJXW8a+39eR4chOoU0shzr9+5e?=
 =?us-ascii?Q?TkCawgXfr9hnsfmTagqBcYv7y8H3IhW1RHn7tcloHJzPwYt3wEn5LQZ1j4Cn?=
 =?us-ascii?Q?dZm8a31Zy7UBcVIVhLAfsbzBE0h+nbpp1zDNk2X9PShX1dcW8ugRPmu1N6SC?=
 =?us-ascii?Q?U+93E2ULAyIsvT3NG8Z4Efr3iXxp7+wzU+6yEN+TgCMdC9LZr9N0b7QNnR3S?=
 =?us-ascii?Q?KjTiU2tzIUuKOs9qI6G+TpaPlam8prt2gO5en25qJTSQCHzErBjg7E2SXEt+?=
 =?us-ascii?Q?bPbW+vuJXWGSA0bafEzHz2jrwXNP/kz4SovqyF2fhWwr73oh1+Y2Wf55RCpW?=
 =?us-ascii?Q?SrLQ/CTvPyg+BellMGb/z1g6EUmuedfGoByUxQEA8Od+oWU6slsF80lBB21t?=
 =?us-ascii?Q?UGLlCo193s4zx9G60t/ZSz4PGWMWtUDDhh36n1Q89CtUQTl+ZgBfD+sABDKV?=
 =?us-ascii?Q?sPInu1vF7/1S/wlTNBfqaYjHCNZqbGix228d904CuJK+4w+lfKyBgeSXH1yx?=
 =?us-ascii?Q?7TM6mPR9JwIVbimxigN4QBF0n94QnJ28tSKwJ+5UpozgdlKP8cffa2LrIV//?=
 =?us-ascii?Q?95YQTy3z1Dn66mchsaq2wDWR4JKf8mermK1teMfBxjTyxnvXCbla0HUtKRKS?=
 =?us-ascii?Q?1SeBiv/cqFJY3Qz0n2lplG1Uvbmvwe57YjfUkWpbsr3dIgGeZtIxdDRRod/9?=
 =?us-ascii?Q?Yw27GyiWzBxAF+0NB80TjOb0UkmAtS3u2DWgaexVsQ1beazJSvD16zbSAcfx?=
 =?us-ascii?Q?xnt6PQqyzao2DtseS1+eIkK1N057G6vfpj/ant3jjvdtjERzjyfUFy9DNtyd?=
 =?us-ascii?Q?SdCQDIZR7ShjPwBIX0am7xLzGCasP/jduYcFJx6+UkzQY2CknesU87pH4am0?=
 =?us-ascii?Q?R0y8i9Ij+xMmEG7Hat/E8iBqeGjfFgNbjqoaWlObJk/igdrkNenUVjVwPrhN?=
 =?us-ascii?Q?aAcDgLmnhDNOorXXCbOTwLx47bAC7+5/N1SJZND18fVExPopRM/iaesCpri7?=
 =?us-ascii?Q?7bIr2+mB+DeeIk4/cTpC03sE+SvahSA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ILuo4R9hjJ98ifMkHi04jZtxhi3YP1zApSK7DR0Ld8RPmpbLsEmCFSoCzzQLqXEeJ4T0qB0R/nXrpVhZSCFL5Mc5Og+ENeuu+aZTeO1ovhLMWjcZAeGN5ng78V3/80jyE9l/rFp/j3jtMDzjXDJq9FQvZwFGaBeuW7XKEk/JGRauqesuXcuK0UOjJnUT584NaxALawOBtCK6cxaRab9hlTjLYrKCNreDDZ90pKK4EAYEW4WoBpT07jhjIPawCPwXiEOK35dMTVQKN9koeR5rACEQZ8QSKllZVFQBM17ri3gx9vv5ujrpKJwUJRGedtELyS7Y1q3jkx/7HTXTC5xrTg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c2e657-db9a-4ec1-6c23-08df2b414257
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 04:52:19.5384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SIZ6n6NnqBctPvi5BhGW7wdbTUb2YRkwzOTiNus21llI7QAhHHMt2B0BTVDIVaYK/v+WyG9kSNOr889I/WhswAXUEq5jwaKDoXBTRRPQZNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Umes=
h
> Nerlige Ramappa
> Sent: Tuesday, October 13, 2026 4:59 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Iddamsetty=
,
> Aravind <aravind.iddamsetty@intel.com>; Koujalagi, Mallesh
> <mallesh.koujalagi@intel.com>; Teres Alexis, Alan Previn
> <alan.previn.teres.alexis@intel.com>; Filipchuk, Julia <julia.filipchuk@i=
ntel.com>;
> Wajdeczko, Michal <michal.wajdeczko@intel.com>
> Subject: [PATCH v7 7/7] drm/xe/guc: Report errors that cause a CT shutdow=
n
> using SIGID
>=20
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>=20
> Convert any errors that can cause the CT to be declared as dead to use th=
e
> xe_log_err() helper. Errors that are escalated to the callers are left fo=
r the caller to
> report with SIGID if needed.
> While at it, update some of the error messages to make what went wrong cl=
earer.
>=20

Hi,

This patch-3 [1] of this series is having the conflict with latest xe from =
the commit [2].=20

[1] https://patchwork.freedesktop.org/patch/759595/?series=3D173177&rev=3D6
[2] 557d40cfae37 ("drm/xe/guc: Add dump_cache to optimize GuC CT/Log compre=
ssion flow").zz

> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

The changes in current patch look good to me after resolving the conflict l=
ocally.
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>


Dnyaneshwar=20

> Assisted-by: Claude:claude-opus-5
> ---
> v2: Use variable err for EPIPE in ct_corrupted
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 85 ++++++++++++++++++++--------------
>  1 file changed, 49 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index 3e23a4396b39..d9999d362dbb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -30,6 +30,7 @@
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
>  #include "xe_guc_tlb_inval.h"
> +#include "xe_log.h"
>  #include "xe_map.h"
>  #include "xe_page_reclaim.h"
>  #include "xe_pm.h"
> @@ -100,10 +101,12 @@
>   *
>   * ``-EPIPE``: G2H descriptor corruption - non-zero status, head/tail ou=
t of
>   *   range, or a declared message length larger than the data actually a=
vailable.
> - * ``-EPROTO``: HXG protocol violation. Either the G2H origin field is n=
ot the
> - *   GuC, or a FAST_REQUEST H2G came back rejected. FAST_REQUEST fences
> aren't
> - *   tracked, so there is no caller to report to and the failure is esca=
lated to a
> - *   reset instead.
> + * ``-EBADMSG``: the G2H origin field is not the GuC.
> + * ``-EINVAL``: a FAST_REQUEST H2G came back rejected. FAST_REQUEST
> fences
> + *   aren't tracked, so there is no caller to report to and the failure =
is
> + *   escalated to a reset instead.
> + * ``-EPROTO``: a FAST_REQUEST H2G got a reply that is neither a rejecti=
on nor
> + *   a valid response type.
>   * ``-EOPNOTSUPP``: G2H carried an HXG type this driver does not handle.
>   *
>   * Reported but not returned
> @@ -761,7 +764,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bo=
ol
> needs_register)
>  	return 0;
>=20
>  err_out:
> -	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
> +	xe_log_err(gt, GUC, err, "CT: Failed to enable\n");
>  	CT_DEAD(ct, NULL, SETUP);
>=20
>  	return err;
> @@ -885,8 +888,9 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32
> cmd_len)
>=20
>  			desc_write(xe, h2g, status, desc_status |
> GUC_CTB_STATUS_OVERFLOW);
>=20
> -			xe_gt_err(ct_to_gt(ct), "CT: invalid head offset %u >=3D
> %u)\n",
> -				  h2g->info.head, h2g->info.size);
> +			xe_log_err(ct_to_gt(ct), GUC, -EPIPE,
> +				   "CT: invalid head offset %u >=3D %u)\n",
> +				   h2g->info.head, h2g->info.size);
>  			CT_DEAD(ct, h2g, H2G_HAS_ROOM);
>  			return false;
>  		}
> @@ -955,12 +959,13 @@ static void __g2h_release_space(struct xe_guc_ct *c=
t,
> u32 g2h_len)
>  	bad |=3D !ct->g2h_outstanding;
>=20
>  	if (bad) {
> -		xe_gt_err(ct_to_gt(ct), "Invalid G2H release: %d + %d vs %d - %d
> -> %d vs %d, outstanding =3D %d!\n",
> -			  ct->ctbs.g2h.info.space, g2h_len,
> -			  ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
> -			  ct->ctbs.g2h.info.space + g2h_len,
> -			  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
> -			  ct->g2h_outstanding);
> +		xe_log_err(ct_to_gt(ct), GUC, -ETOOMANYREFS,
> +			   "CT: Invalid G2H release: %d + %d vs %d - %d -> %d vs
> %d, outstanding =3D %d!\n",
> +			   ct->ctbs.g2h.info.space, g2h_len,
> +			   ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
> +			   ct->ctbs.g2h.info.space + g2h_len,
> +			   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
> +			   ct->g2h_outstanding);
>  		CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
>  		return;
>  	}
> @@ -1023,15 +1028,16 @@ static int ct_corrupted(struct xe_guc_ct *ct, str=
uct
> guc_ctb *ctb,  {
>  	struct va_format vaf;
>  	va_list va_args;
> +	int err =3D -EPIPE;
>=20
>  	va_start(va_args, msg);
>  	vaf.fmt =3D msg;
>  	vaf.va  =3D &va_args;
> -	xe_gt_err(ct_to_gt(ct), "GUC: CT: %pV", &vaf);
> +	xe_log_err(ct_to_gt(ct), GUC, err, "CT: %pV", &vaf);
>  	va_end(va_args);
>=20
>  	process_ct_dead(ct, ctb, reason_code);
> -	return -EPIPE;
> +	return err;
>  }
>=20
>  #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header
> and one DW HxG header */ @@ -1313,7 +1319,7 @@ static int
> guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return ret;
>=20
>  broken:
> -	xe_gt_err(gt, "No forward progress on H2G\n");
> +	xe_log_err(gt, GUC, -EDEADLK, "CT: No forward progress on H2G\n");
>  	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
>=20
>  	return -EDEADLK;
> @@ -1665,14 +1671,14 @@ static int parse_g2h_event(struct xe_guc_ct *ct, =
u32
> *msg, u32 len)
>=20
>  static void guc_handle_crash_dump_msg(struct xe_guc_ct *ct)  {
> -	xe_gt_err(ct_to_gt(ct), "GuC Crash dump notification\n");
> +	xe_log_err(ct_to_gt(ct), GUC, -EHOSTDOWN, "Crash dump
> +notification\n");
>  	CT_DEAD(ct, NULL, CRASH);
>  	kick_reset(ct);
>  }
>=20
>  static void guc_handle_exception_msg(struct xe_guc_ct *ct)  {
> -	xe_gt_err(ct_to_gt(ct), "GuC Exception notification\n");
> +	xe_log_err(ct_to_gt(ct), GUC, -EHOSTDOWN, "Exception notification\n");
>  	CT_DEAD(ct, NULL, CRASH);
>  	kick_reset(ct);
>  }
> @@ -1697,14 +1703,21 @@ static int parse_g2h_response(struct xe_guc_ct *c=
t,
> u32 *msg, u32 len)
>  	 * failure to trigger a reset.
>  	 */
>  	if (fence & CT_SEQNO_UNTRACKED) {
> -		if (type =3D=3D GUC_HXG_TYPE_RESPONSE_FAILURE)
> -			xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed!
> e=3D0x%x, h=3D%u\n",
> -				  fence,
> -
> FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> -				  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT,
> hxg[0]));
> -		else
> -			xe_gt_err(gt, "unexpected response %u for FAST_REQ
> H2G fence 0x%x!\n",
> -				  type, fence);
> +		int err;
> +
> +		if (type =3D=3D GUC_HXG_TYPE_RESPONSE_FAILURE) {
> +			err =3D -EINVAL;
> +			xe_log_err(gt, GUC, err,
> +				   "CT: FAST_REQ H2G fence 0x%x failed!
> e=3D0x%x, h=3D%u\n",
> +				   fence,
> +
> FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
> +				   FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT,
> hxg[0]));
> +		} else {
> +			err =3D -EPROTO;
> +			xe_log_err(gt, GUC, err,
> +				   "CT: unexpected response %u for FAST_REQ
> H2G fence 0x%x!\n",
> +				    type, fence);
> +		}
>=20
>  		fast_req_report(ct, fence);
>=20
> @@ -1714,7 +1727,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct,
> u32 *msg, u32 len)
>=20
>  		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
>=20
> -		return -EPROTO;
> +		return err;
>  	}
>=20
>  	/* don't erase as we still expect a final response with the same fence =
*/
> @@ -1780,10 +1793,12 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u3=
2
> *msg, u32 len)
>=20
>  	origin =3D FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>  	if (unlikely(origin !=3D GUC_HXG_ORIGIN_GUC)) {
> -		xe_gt_err(gt, "Invalid G2H origin=3D%u\n", origin);
> +		int err =3D -EBADMSG;
> +
> +		xe_log_err(gt, GUC, err, "CT: Invalid G2H origin=3D%u\n", origin);
>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
>=20
> -		return -EPROTO;
> +		return err;
>  	}
>=20
>  	type =3D FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]); @@ -1798,7
> +1813,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 l=
en)
>  		ret =3D parse_g2h_response(ct, msg, len);
>  		break;
>  	default:
> -		xe_gt_err(gt, "Unexpected G2H message type=3D%u\n", type);
> +		xe_log_err(gt, GUC, -EOPNOTSUPP, "CT: Unexpected G2H
> message type
> +%u\n", type);
>  		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
>=20
>  		ret =3D -EOPNOTSUPP;
> @@ -1898,8 +1913,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u3=
2
> *msg, u32 len)
>  	}
>=20
>  	if (ret) {
> -		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg
> %*ph\n",
> -			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) *
> hxg_len, hxg);
> +		xe_log_err(gt, GUC, ret, "CT: G2H action %#04x failed len %u
> msg %*ph\n",
> +			   action, hxg_len, (int)sizeof(u32) * hxg_len, hxg);
>  		CT_DEAD(ct, NULL, PROCESS_FAILED);
>  	}
>=20
> @@ -2082,8 +2097,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32
> *msg, u32 len)
>  	}
>=20
>  	if (ret) {
> -		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
> -			  action, ERR_PTR(ret));
> +		xe_log_err(gt, GUC, ret, "CT: G2H action 0x%04x failed\n",
> action);
>  		CT_DEAD(ct, NULL, FAST_G2H);
>  	}
>  }
> @@ -2202,8 +2216,7 @@ static void receive_g2h(struct xe_guc_ct *ct)
>  		mutex_unlock(&ct->lock);
>=20
>  		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed, forcing GT
> reset(%pe)\n",
> -				  ERR_PTR(ret));
> +			xe_log_err(ct_to_gt(ct), GUC, ret, "CT: dequeue failed,
> forcing GT
> +reset\n");
>  			CT_DEAD(ct, NULL, G2H_RECV);
>  			kick_reset(ct);
>  		}
> --
> 2.55.0

