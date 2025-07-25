Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB3AC87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 16:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2C310E367;
	Fri, 25 Jul 2025 16:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBkNOPit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A6210E367
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 16:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753460043; x=1784996043;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tBTGVUALfUpy+U/zLdqI+fp7L6ZjPRcfThQyJ+qM4Oo=;
 b=cBkNOPit3weiEUAoWTd/OazELUn4I/HRDHKEcipKAvJCY6nG5ZwB2j13
 +szQ+Kap5lYhzRrZltEnuLIxVrQyL06bBB0tLYBSv5m3S+ijwhAr7H88e
 bP1jjaQIYp3wVMRUUf3aFvaEHkgR5oRFmeRnNgNoDPeuUxfWgfSs4efyk
 nhlQmNhKybTewXILReqmqUo1ETNEqPg0xdbvO5I6iCv0KkrHcBnSbYU5/
 c2J33fH+Pffiwy+BHIp3UmbOcwSd3QeyBxfhK4zNz4suU9tCFNJNFDJpx
 y9na0kxp0RofkvaTOgjGvDL6/HClZhpTrL1rhftcD0UQyfyK3V8XK55hV w==;
X-CSE-ConnectionGUID: l8ABi40pTKC8XIYn1Mlb2Q==
X-CSE-MsgGUID: l/qBHEIaSfGg8leBknd2yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55945463"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55945463"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 09:14:03 -0700
X-CSE-ConnectionGUID: yZiuHirDT5OEuiKX6xuuqg==
X-CSE-MsgGUID: BdmZa9SRTqeUbJlbErGvnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="160975781"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 09:14:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 09:14:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 09:14:02 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 25 Jul 2025 09:14:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgzmAiCXkFSytPGFgVq+wbAcYTGMUiqvNAhKKARk9GCZNZIvf6W5QDLz2wvErCTovBoxRDiCdq6cnMU3YHi4tcfXApFs939wcjaGShCDaeLPzDkKztl/IdNh/bezc5AY+x+w8G1m5U464sMeZY5cG9jcdDX32aNShrLDD9NfV2tK1YQmlJ7T+RYib1VCgogrSIm4al4JsdL1NLhh0IoIZgOVtzMY/CH2dq/JSPW7fMpewJLcMbpoEqsrKM0EZhbm5UF+JFYYAcr6sDhDfYe8MoxB/TXM5Kqi71VJbKUhIJQRy9XL6P6Ztf9Cl3cAdWVDOhfdlfYTGlvuA1TCMgAJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5kLG9gmVkLYmvY/n887iqbGG/vfQKV3KWbHUH6APr0=;
 b=qsqlBANnD9cK9lHr56iojxXa2PcOTpMVyjgic6AoHVAahKYGCrXQkJkuqu8s8ognLpVi6SYvvUenUNQY9rJV9cahOuFY0OZcv/iqusSmAPCG5QMSOpq914GbSwwmOtNE0ffY1yEA3Lc0I3d58mm2l9BpoexFyRs7egTRNWPXY6BGbR74CsQVDkFRzqO30jbMVHgj1koMdrhxo7TxHN1mhb4m6LcV4bdyDBQYbbKpHf6bJXCscf3eh9nuPd7OzwtBVBv60I7Aw+AHolYyywtS8BkyZlCsOjiEb9zG47eOxMMZfFdMAa/Ic/nKPDxNXP7VwIx0lYR8dyNp5+f9P7qA9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA2PR11MB4777.namprd11.prod.outlook.com (2603:10b6:806:115::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Fri, 25 Jul
 2025 16:14:00 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.8943.029; Fri, 25 Jul 2025
 16:13:59 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v2] drm/xe/xe_guc_ads: Consolidate guc_waklv_enable
 functions
Thread-Topic: [PATCH v2] drm/xe/xe_guc_ads: Consolidate guc_waklv_enable
 functions
Thread-Index: AQHb/XXpv1sjTIrTX0WEvMk7AhELqrRDAqkA
Date: Fri, 25 Jul 2025 16:13:59 +0000
Message-ID: <DM4PR11MB5456EABC0B281C9672452262EA59A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250725150749.68071-2-jonathan.cavitt@intel.com>
In-Reply-To: <20250725150749.68071-2-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA2PR11MB4777:EE_
x-ms-office365-filtering-correlation-id: e778648c-587c-42fe-a860-08ddcb9643c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?U4vGXRWnBk17TcGWerSFMCXVNkqJUaZrfDKgWbCNtUVewHW8Bt9AI2dSrR9L?=
 =?us-ascii?Q?QjPWdgDTDVLmchgKOg1UIsILw6QPZGK6EJqhbiS9TkVT867BrOj6GaO07BNR?=
 =?us-ascii?Q?AsmcOnoZYSGjfaVpWOxe3LSe4VxFTGBfxiFKoVGCac4vnn0yOFNtnhlLAkcx?=
 =?us-ascii?Q?n2cT59s0NtPmr2ioIsIwMYpA7y98Q1bb54tLXtVTzjMMb57S02MbZ73uRlqC?=
 =?us-ascii?Q?zEQj563486VJB57ScR/lv6Z/X8G4c6FWKfe3nGVX/CryOCTGdX3coFYFObl/?=
 =?us-ascii?Q?0ksvIRQmhNG26AUiJSEEiVuaEZfGpLXQ7O/nKvR38Uf1U8pD7Z+J33xUMc+g?=
 =?us-ascii?Q?7kZA53RoWTToto2MNi4SMb0Ivr9PXfN0iMAWI4wvYqRSecfTzKN+1bjzSgt4?=
 =?us-ascii?Q?NhPsqXqzKjDO3GluicIekEnasq++jTRrmyzGjOSHudCb5z8K2b8mXrHDXxLI?=
 =?us-ascii?Q?GjJvjTqPT+7+dIm6tx24McRkHz9auik5Lk9idf24GzySmyNCoAaTQKy/Ga/L?=
 =?us-ascii?Q?UUkBkekeAxmqJzwTYbCUWeLGj5fJTAaUKTTZqJy+zV01xGYpucqrBglDHVcq?=
 =?us-ascii?Q?+bYGD1UcYKdOx+J8x5uBNwu1xCIzZIFwMqdsfnkHn4zv3Cwdp3yDqzawkYUm?=
 =?us-ascii?Q?dpWKw1npi6yFJq9SDt4UqGwCz5hVKHcU4O6SmD91YS6fHOsYsP5wt0RP/BqE?=
 =?us-ascii?Q?d2psHvGaFYip6Gm9ZF6GhwhGKD0EprjsW8ztAZGHWl0hyFuB/gktMwfJOKB7?=
 =?us-ascii?Q?4FwVWwPue3yywiEVhNaLV8D7baImEYU/yImdghwYmWy36LcCcPeSsgW6+JoA?=
 =?us-ascii?Q?n+Vcl+3D5mDWRAgoF0Qi5GFTbr5jJKpfjZDVE2wxO8MLPLyOpuxVqTMti9Wp?=
 =?us-ascii?Q?YQfxDYDCr9QA7ItH+xG/SLfP3MclsMEL7SbdeYH9HgPWN0WxIArsO7VVlYsh?=
 =?us-ascii?Q?GyIHijVJhSv0wXIj4WtcxEaLOksvFZ7cEVUVd2iTjDukCeSjIGqTvPqTvbr6?=
 =?us-ascii?Q?Skhj3IbQJRxLCKA1w9wMoz5kgHNccZNdKmHRiUISllr3PDzY+K6H74XqQ8Rd?=
 =?us-ascii?Q?Cp/PsdoBTlc5ziP9SbR09EV5Kk0UowcfQpYDrDUDcUVzASPEdQO2+FSk1qt2?=
 =?us-ascii?Q?AbOln68PhBAWi9QsKFYfI3e+XyTxhMot81/5La5pwWWGUnmhQMzFxFOmmtDa?=
 =?us-ascii?Q?U7gCtPspMSaeTPFUatg4BDoaCkdQYharg7qUubLKSjk7EnEjfvcnlWk7JjfJ?=
 =?us-ascii?Q?O7YgthbpZSA3fZ33dlz54IlpGz/FNDELERKFVA2LGfDQjDpK0hd8DDx0NYVv?=
 =?us-ascii?Q?CeL4hCl93PoWEaijuOq+HuiGqbPglrLB2Hi17/TJtkS7INq6qZ18/VBNLcNx?=
 =?us-ascii?Q?om//Vb5AgOTkRmdn+RP/1ODoHfzPWx3G14qArlcSUZySfb9+cwERlHnzjH02?=
 =?us-ascii?Q?Er4BjRpccfcBM83tZ6YrkoF+xAYzc1boHJwisjXHpLpuKWf0p0EWUA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cPQ7RPEk44EdHjjsEe3dDx34U6M6RfCT3y12oOymSrC389AByZc8Fa7gf44r?=
 =?us-ascii?Q?VEoPRo1Y9TLunq/d1ZC+qk8WYO6rMnLZmmGHp7EqKccGl0zgwbH6R53ADLqg?=
 =?us-ascii?Q?UtgD482uNLduZzE8txsYjVOzNYknjUNt2u/bT/SYY+G/0SKTiy/wx6ASHc6z?=
 =?us-ascii?Q?mQoIIL9nO6ArNtuBFqQHu/3gkQL4u/vqvstrZqG6mjKMP79IxUwtzOpYlVqU?=
 =?us-ascii?Q?npvH0bUZZj6O1HJBqBRja+3d8v8aHcVviW6+ma7KyAZUSQEvAibUcF3DCAH9?=
 =?us-ascii?Q?3h2P5/GRM7p3mfWOazNJ/YHL8jGGFvDD5Trx+cZDfTvdVspdffJWLETiR276?=
 =?us-ascii?Q?5kFD9IiRLHogftstIZyZaE3wxMPgjIn7fFDP8qDpHKgvWzHx/stEPDS3Brxe?=
 =?us-ascii?Q?p2sHwA5lFNy4qmlip7hm6nQhZAGbgCm3M/J7pGiublHsNvOWV6SS5xnGC2F8?=
 =?us-ascii?Q?pBlqUwiTgFk67C+8S2GwQS++N60r7TCSKssV6cetJeoCSf1T6MibxfPHswfC?=
 =?us-ascii?Q?+aqJUsqPM52c204hft2dsa1FijKC5S2GZZjegpu5HamahhgSYLhTCf0ISUmR?=
 =?us-ascii?Q?BZRyrFf2Yl+RNMu/nWUCcNjZ/hIr8xJkJJqtLMm+Dd4APvBaE8+3yhbe6LLc?=
 =?us-ascii?Q?v9qJlKMYo9rstju57UNfKnpVP2s6GYVye4x6dVLsFWTkD0PMeP9RGs09B2zN?=
 =?us-ascii?Q?SuWt7v71yYbkDRmWaJ7XHVzbpuNrKlbCIWLUb9a7l/QyqgWbr8Up/ay5hspG?=
 =?us-ascii?Q?FX+PqLVK6J9B7lBwSJhxnNwPebvQyZxL0irq03L4hQpZrOLtUp19ysG2OaBD?=
 =?us-ascii?Q?nRcGOZaUVz8XtZhgm6eBMmQiIR3sK/6DRMbc7QmQiW0sf2HvaGX2wkDk5sad?=
 =?us-ascii?Q?QKtqaA6BsQtv4pedPnsJTM9d8nD5FPaw+pnagM8WbXdkadwrP2zwv8B1LhBC?=
 =?us-ascii?Q?w9QXbS8aFEGJGJiBYCyN15rjv4vi6iR6iohs9idoFbAW4mHMUv2uCr+FHhdn?=
 =?us-ascii?Q?FDM5JwS/AMW9l/H+LmxA/vTMxfiHOp4XQgGqPR9RcnKVZocrrFd8FYKGNthX?=
 =?us-ascii?Q?9FbKKTRJoilMZAYT05fBoBajZCFilJCYz38EOnb7LU+fvPQc7wQF1h9YE8x1?=
 =?us-ascii?Q?XlvTf44OaxGF5TSCm3F8LEvi4sBcMzI/kea55uEBisLCpX7aK+mSVuv5WI/K?=
 =?us-ascii?Q?Igt2qwlZurVpt2d7xbPcRqXd5vXRt5NsCAlB6uqx30XzNsgdq5ylMzrRx6SD?=
 =?us-ascii?Q?Go5HBzNwXnLGs6DQgqNttxw3xLBeVh/UinHFEEPEohISD8v4DFeOde3gBngy?=
 =?us-ascii?Q?aJrsAB+B5opCzuOFlo+vEong+T/VIBzS3Zvb0+cTtsiI2+/kTQgIBRt7qt+W?=
 =?us-ascii?Q?+63Yjwo8GP57nxtwFKuPG2YokuxTrgKtNdaFcXb5zLBmzjcnCdr3Z7mVJqml?=
 =?us-ascii?Q?eHn1HZZn7A60yUiEexKzaj8jqJdrfNTIyVMd8P1DvmFSDNGIt7wkspviioGp?=
 =?us-ascii?Q?HkC9dGdVG/WDkI3VZg9uX9pqrCxKbUBqmnh5v9yuQY7U2gqdJFUUvBcDWAxo?=
 =?us-ascii?Q?fVc/O4ZhDhtVEzD+rNOS9M+4vDGQb3X7tZefL8XX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e778648c-587c-42fe-a860-08ddcb9643c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 16:13:59.9087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y6/qTARf9P/0omQ+bGoTT8/V10uMswDkO09AT6bSHE05ewEa23BwgkqcJ8mSccezB1db4TepRvfD1kFg6y53jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4777
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

On Fri, July 25, 2025 8:08 AM Jonathan Cavitt wrote:
> Presently, multiple versions of the guc_waklv_enable_.* function exist, a=
ll with
> different numbers of dwords added to the klv_entry array.  This is not ex=
tensible,
> and more duplicates of the function will need to be created if it ever be=
comes
> necessary to support 3 or more dwords per wa in the future.
>=20
> Consolidate the disparate guc_waklv_enable functions into a single
> guc_waklv_enable function that can take an arbitrary number of dword valu=
es.
>=20
> v2: Update length value properly (Shuicheng)
>=20
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Lucas De Marchi <lucas.demarch@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 144 ++++++++++++--------------------
>  1 file changed, 54 insertions(+), 90 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_=
ads.c
> index 8ff8626227ae..4183a82fdb0c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -284,83 +284,41 @@ static size_t calculate_golden_lrc_size(struct
> xe_guc_ads *ads)
>  	return total_size;
>  }
>=20
> -static void guc_waklv_enable_two_word(struct xe_guc_ads *ads,
> -				      enum xe_guc_klv_ids klv_id,
> -				      u32 value1,
> -				      u32 value2,
> -				      u32 *offset, u32 *remain)
> +static void guc_waklv_enable(struct xe_guc_ads *ads,
> +			     enum xe_guc_klv_ids klv_id,
> +			     u32 dwords[], u32 num_dwords,
> +			     u32 *offset, u32 *remain)
>  {
> -	u32 size;
> -	u32 klv_entry[] =3D {
> -			/* 16:16 key/length */
> -			FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -			FIELD_PREP(GUC_KLV_0_LEN, 2),
> -			value1,
> -			value2,
> -			/* 2 dword data */
> -	};
> -
> -	size =3D sizeof(klv_entry);
> +	size_t size =3D sizeof(u32) * (1 + num_dwords);
> +	u32 *klv_entry;
>=20
>  	if (*remain < size) {
>  		drm_warn(&ads_to_xe(ads)->drm,
>  			 "w/a klv buffer too small to add klv id %d\n", klv_id);
> -	} else {
> -		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> -				 klv_entry, size);
> -		*offset +=3D size;
> -		*remain -=3D size;
> +		return;
>  	}
> -}
> -
> -static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
> -				      enum xe_guc_klv_ids klv_id,
> -				      u32 value,
> -				      u32 *offset, u32 *remain)
> -{
> -	u32 size;
> -	u32 klv_entry[] =3D {
> -		/* 16:16 key/length */
> -		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -		FIELD_PREP(GUC_KLV_0_LEN, 1),
> -		value,
> -		/* 1 dword data */
> -	};
> -
> -	size =3D sizeof(klv_entry);
>=20
> -	if (*remain < size) {
> +	klv_entry =3D kzalloc(size, GFP_KERNEL);
> +	if (!klv_entry) {
>  		drm_warn(&ads_to_xe(ads)->drm,
> -			 "w/a klv buffer too small to add klv id %d\n", klv_id);
> -	} else {
> -		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> -				 klv_entry, size);
> -		*offset +=3D size;
> -		*remain -=3D size;
> +			 "w/a klv buffer for klv id %d not allocated!\n", klv_id);
> +		return;
>  	}
> -}
>=20
> -static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
> -				    enum xe_guc_klv_ids klv_id, u32 *offset, u32
> *remain)
> -{
> -	u32 klv_entry[] =3D {
> -		/* 16:16 key/length */
> -		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> -		FIELD_PREP(GUC_KLV_0_LEN, 0),
> -		/* 0 dwords data */
> -	};
> -	u32 size;
> +	/* 16:16 key/length */
> +	klv_entry[0] =3D FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> +		       FIELD_PREP(GUC_KLV_0_LEN, num_dwords);
>=20
> -	size =3D sizeof(klv_entry);
> -
> -	if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
> -		       "w/a klv buffer too small to add klv id %d\n", klv_id))
> -		return;
> +	/* add dwords of data */
> +	for (int i =3D 1; i <=3D num_dwords; i++)
> +		klv_entry[i] =3D dwords[i];
>=20
>  	xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>  			 klv_entry, size);
>  	*offset +=3D size;
>  	*remain -=3D size;
> +
> +	kfree(klv_entry);
>  }
>=20
>  static void guc_waklv_init(struct xe_guc_ads *ads) @@ -373,49 +331,55 @@
> static void guc_waklv_init(struct xe_guc_ads *ads)
>  	remain =3D guc_ads_waklv_size(ads);
>=20
>  	if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
> -		guc_waklv_enable_simple(ads,
> -
> 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKE
> D,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +
> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> +				 NULL, 0, &offset, &remain);
>  	if (XE_WA(gt, 18024947630))
> -		guc_waklv_enable_simple(ads,
> -
> 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +
> GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
> +				 NULL, 0, &offset, &remain);
>  	if (XE_WA(gt, 16022287689))
> -		guc_waklv_enable_simple(ads,
> -
> 	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPU
> TE,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +
> GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
> +				 NULL, 0, &offset, &remain);
>=20
>  	if (XE_WA(gt, 14022866841))
> -		guc_waklv_enable_simple(ads,
> -
> 	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +
> GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
> +				 NULL, 0, &offset, &remain);
>=20
>  	/*
>  	 * On RC6 exit, GuC will write register 0xB04 with the default value
> provided. As of now,
>  	 * the default value for this register is determined to be 0xC40. This =
could
> change in the
>  	 * future, so GuC depends on KMD to send it the correct value.
>  	 */
> -	if (XE_WA(gt, 13011645652))
> -		guc_waklv_enable_one_word(ads,
> -
> GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
> -					  0xC40,
> -					  &offset, &remain);
> +	if (XE_WA(gt, 13011645652)) {
> +		u32 arr[] =3D {
> +			0xC40,
> +		};
> +		guc_waklv_enable(ads,
> +
> GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
> +				 arr, 1, &offset, &remain);
> +	}
>=20
>  	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
> -		guc_waklv_enable_simple(ads,
> -
> 	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> -					&offset, &remain);
> +		guc_waklv_enable(ads,
> +
> GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> +				 NULL, 0, &offset, &remain);
>=20
>  	if (GUC_FIRMWARE_VER(&gt->uc.guc) >=3D MAKE_GUC_VER(70, 44, 0) &&
> XE_WA(gt, 16026508708))
> -		guc_waklv_enable_simple(ads,
> -
> 	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
> -					&offset, &remain);
> -	if (GUC_FIRMWARE_VER(&gt->uc.guc) >=3D MAKE_GUC_VER(70, 47, 0) &&
> XE_WA(gt, 16026007364))
> -		guc_waklv_enable_two_word(ads,
> -
> GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
> -					  0x0,
> -					  0xF,
> -					  &offset, &remain);
> +		guc_waklv_enable(ads,
> +
> GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
> +				 NULL, 0, &offset, &remain);
> +	if (GUC_FIRMWARE_VER(&gt->uc.guc) >=3D MAKE_GUC_VER(70, 47, 0) &&
> XE_WA(gt, 16026007364)) {
> +		u32 arr[] =3D {
> +			0x0,
> +			0xF,
> +		};
> +		guc_waklv_enable(ads,
> +
> GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
> +				 arr, 2, &offset, &remain);
> +	}
>=20
>  	size =3D guc_ads_waklv_size(ads) - remain;
>  	if (!size)
> --
> 2.43.0

