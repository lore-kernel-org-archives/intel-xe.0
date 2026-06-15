Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B8ACD98CE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 22:26:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1754B10E48D;
	Mon, 15 Jun 2026 22:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4bIZhYd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C1A10E48D
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 22:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781562370; x=1813098370;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HnPJxfd/kpPlx49rIoFWviSwX19JraNIUvrlXZrg/mI=;
 b=W4bIZhYd3kdhDeVe/5T3D/ZWhuP3whady+Y4fE9Kvgzut3SKlccpC8Yg
 guKLPHV7ESHs8QjUxLT8wEd3cEHLdcnIwTxmO9g9KsY52hWB5U93JkmnI
 hICqxnpvhEglUYEQ+5J0dALbEMzTbU80WPWUd/b1MmN4Y229N6rhGAYhQ
 IlEamOO+U76/uMgsqw1SNTpQsrHYviymaYU/bPhiE2IxLC8aTH2HMYlbK
 KFt+aUNchi1W9Ey6NHvHQ8mfT/KkZ0O1jssDP5gyollGuv37eLZwQJFJB
 ZSF+zQYpj5JToF9BLz8BNNi4+bLqDBm8ioKF26SmQpVTJOsPmeJW+5ef8 g==;
X-CSE-ConnectionGUID: q3CEdFzwRxOM4ujkRKXnXA==
X-CSE-MsgGUID: 992KOME8TJao2vZkHngTDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82358176"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="82358176"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 15:26:09 -0700
X-CSE-ConnectionGUID: 1R9fV6IqThqqanZehCiWkA==
X-CSE-MsgGUID: qreLM8LBT4qScn4095wC9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="246702211"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 15:26:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 15:26:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 15:26:08 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 15:26:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYPiP896C88Ien/0hghWZb0nm4QIa2J8JqTOZAUBWX7p4ZJjkxhGW6jcF3D5GskGyLsruIq898BFWeU8qU6Z9zpYkzQziN2BwYgTy0zCAZbOmEI5/5ZRHf2aPGtIZAHBnL0St8zfmGqV+AQb9ahxLhRW6jHOx+35Urrw9WhxGYIOo69OxolI+QE6rNjlLE7TPZkh0jiLdf9bF0ZeLlk5ypq9lwpl7d2raDqeX+n+7cCCR0j7vt0qF7l7tGYKeJgnKkicTxnJwHwXDrkdTErePyje1uBhRK5tNQ4DxeZGG9X06nEJoOh1M1gxJO3uGegP3aX9NcZxC64aEnOkg+Ws2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnPJxfd/kpPlx49rIoFWviSwX19JraNIUvrlXZrg/mI=;
 b=mf1v+t92CRpFkvPfoEaj2rguT3lCl4I5ed2lYvzZMIzSPLDHgdFSzBitJQEsrQXWw/1BkMr09pYsKIALp/T44z1sFUg3X+oFLsOH9nPh5UArArCLJ1eHqPXXdblctf+zweIY/ciVQT/xtkDkcvvW0EBBA4475PfcMunF5ydZstjkzDdxbGbl1HclIGdo1UsONV/9v1gia1maAfAEIdMVxlwbCRBHC05KKmTKNpjC9Xao0BAi4U3AhvlGFIvwXLicTC4vjIt5wbgIbfDAdbTPi72PiCMoP6HUUAXJgGqVD1iEG+F6yEhXDQXvyM1sPsYUTvd0Dyk8os4NaVW5PYkTWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 22:26:06 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 22:26:06 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Wang, 
 X" <x.wang@intel.com>
CC: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/memirq: Size report pages from static engine mask
Thread-Topic: [PATCH] drm/xe/memirq: Size report pages from static engine mask
Thread-Index: AQHc+soDY3DQM0KAm0m7ueXNM20LfbZANlKA
Date: Mon, 15 Jun 2026 22:26:06 +0000
Message-ID: <c81950909eac486e56ea541baa61edf1616b0e51.camel@intel.com>
References: <20260613001652.2614612-1-x.wang@intel.com>
In-Reply-To: <20260613001652.2614612-1-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|SJ0PR11MB5813:EE_
x-ms-office365-filtering-correlation-id: cd569224-2d06-4b73-387e-08decb2d177c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|6133799003|22082099003|18002099003|56012099006|11063799006|5023799004;
x-microsoft-antispam-message-info: QuJy8gyFG1FJAN7hPcBkkFU5swQ1VfxOK+CynmN5AuO8ZziNkqPVcLbnjMpwIf5ldTuncVvmH4PwQWJJacfBRVWyKxUXiYonZj0DuO1knv6Vdfh5R92hCNPePeTUD7ary0plabvnuopPGV/KsvqC5Y4e+abkoxoYmPSpTPRPUYc09MzXM+nThRLmGAAxLCPYn0eyBia0oSbBY7ivj6KiENTAH30V8SaS4WV36jRquo5eLc/yOlSlh8gehslvSSgSYBp4sUs+mJcHGsO6iItDGIAhIk13Jy9UdXHBvqUq9O8ZmYwzcWdKliRH8Tvo9Ry0CS7R8bTNX2CX2uQ/Ajbt5ZsYLkeK1qpVafDsxwD9gZxjdLlp/ZSHdsxLCQ3xGgPmSoAR79Ehzx+XcxnoRzTuzpv1APCsITXCRhieHAeuM5iOaz24svdhtgf1mpX+9Nsd7vYTfpg+RJddocAIwd9hwn3K0PPgFMkwlJi+Vswnj840sUwwNgVdupJoG2ttxKYVNZ1IsDzBxz+3UKo+XQeZlAsjLqXo0uOmovYj3VVYnPcBXWv9UADELcWy9upHhneS0O6/XHam6U18b8oZaBSPnMBFiWYUZFc1TdvIxwekwNGPY93SSfDhvvep69X3WK17u1DKgyAjOV31a8O+Ew56NCnID3x5sOPsdlZHExFNN+WyvcUlaytPfS1D2vau9rMSFHzfq+1hlH6yczkDAUQwHnIfM85UFtju80S2NtGkJ+kxpMMdTYEnzmU+hOzGjJLr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHZKdHRjNUVtWVpWYTJlSlBlWVM0QWJvTTMrLzdObjVPTG9KYjUwY0d1TnNE?=
 =?utf-8?B?SDhQODhRUmwvbCtaY0IrQlVBd2hBUS83NTFWbjBRTVEvc2NzeWRaUGJMbjVv?=
 =?utf-8?B?TWNFUm5tUlJyUnNFQjRVU2kyMHljVy9aczR1SFYySVpqTTlkWGg0eDh2dFVl?=
 =?utf-8?B?MmFTQ2o2SzVNM3hNOUt0WW1PcTA5MXE1K2lJYUc1WlkrWFJ3Z2pJcWR1cy84?=
 =?utf-8?B?bHRYcndmWEkrcGs1UXozZ3ZtRG1HMXJrTUlvWG9tQTArQ2ZBN3d0ZUFqL3Za?=
 =?utf-8?B?ZXVkNjg1Sk5ud0xmRmRrblBGWDlLTWc3a2NxWG8zNmR2dzRyNjBLZXpra1Zp?=
 =?utf-8?B?RzRFRFpLU2NmZ3dSeGo0V3dvL2NuaTBQS0o1RmVEdDlpcUhCak1QSzRQMWRw?=
 =?utf-8?B?eEl3Tm02T0NWVzF1RXVNU0dPbGF0UlpNTlM2cFpKOFYzNW9PU0hkU1ZIQkZa?=
 =?utf-8?B?eVcwTThyWHh5ZzNWejJpNDBJYVlCTHI3UEU1MGxJREZXcGxnMFFNamFMQmlo?=
 =?utf-8?B?TUMvS2N2L2F2NTU5UDJORXhjYmFQYUpVbEx6UXRDc3l4djY2WVFyQi8wRTcv?=
 =?utf-8?B?MmRveTlqaVNkcEtKK1h4OFdqQ3V6MFVsNmVTVGFDNVh1M3pPdzdwRnp3MFBm?=
 =?utf-8?B?VkRuVmJwVnBtTzRMWUlOUXlxSjB5REwyYS9HVGdzZTNMNmZMZGtpbEtUTWk2?=
 =?utf-8?B?SWdlaTkxM3hFZmFNVUFJN3BNMkhlZnJYOGRacmpwQ3ZvVi80aENnLy9LZHBj?=
 =?utf-8?B?QUF6a1hoekxrVURxTjM5WEwwaFFHTStTUmVDY29UeFg5M1BGMzVHemxNdmVa?=
 =?utf-8?B?WXZtTGplN0ltbVFtMkhmMGEwWUlhc0wvcHBZUGhNQkY2S3JUWnFkUFlYOGhF?=
 =?utf-8?B?QWgweG9yRld1MDY5aEZIZzdsS0FXL0w3aHp2eXg1TFVuZW5FUnM3SWluTzRR?=
 =?utf-8?B?YWt2TGxzRWQ5M3ZEeG5XejZZWDVsR3BYMzRiWVMreGJ1ekhjdVdSa2FhaGxG?=
 =?utf-8?B?NW1QcjhIeStYaHhtN1AzcHRkNU52L2FEYkg4Nk9ha0xLZktNdTFSK2xvdDA1?=
 =?utf-8?B?RDhCU0lpZHVQdkFCbkNjM1FTUmZyamwzQkd4QzFleE0weVFwZHRnaFp1a2Z3?=
 =?utf-8?B?Y0t0ME9pM3dIUjlDcVZHNjVxNnVKZ3c3L2Y3TlQycWVja0hkWHRNVnZ1MzVN?=
 =?utf-8?B?citIcmZVZ25EVGNXbU9mb3hJa3BPenBJb0duYmY2SWxtNUx5ZFF3SWhMOC9V?=
 =?utf-8?B?R2R6b0k0OGxaRk44aGJHZzZrMkF5K3BYMEc1dHJzN3Y1c3lJM1p6QUpCekZw?=
 =?utf-8?B?RUpYUW9GWFptL0FQb0NtRWVDZXYydm80LzhJOWREamo1SzVnNmVtQ2hhUjZU?=
 =?utf-8?B?N0dFRTlpVjZnUmx6emZSR0VYWkY5ZlpPU1FLUHFUdjhwK0hBV3F2UnB4RFhl?=
 =?utf-8?B?V2NZc3A1Wm1LMjJNM1pGcExXWVZ3QTBXSVVWdXZwN0pmMU5xbWVHSVNZa3da?=
 =?utf-8?B?Uy9PTDB0dDFPajBlUEJvTmhqWVBkelgzMnVBcG0xUlBZWVcxTUZ1MXZwRTNi?=
 =?utf-8?B?R1FGcEIwUlZxcjNVTHhPZ0hpbklFTmR3dmhmSkR6M2p4SjAwZE9WOERFQnF4?=
 =?utf-8?B?ZENsQWorMFJuaTRwUEJ4MFczb25lTW9TSlZNaVJVWVlYT3Z4TllwMWx6VmNo?=
 =?utf-8?B?S1dOTzJhbDF0ODlZRHlPM3FVbHo0dDhVRXJVU3NndFdOeTZ3VmVIcWtwMDFE?=
 =?utf-8?B?YXo2VElUcVBuNURGeDVVVzgrNGh6QUN3a3NId3lFaEtqT09GSnpBMm52NkZI?=
 =?utf-8?B?QmNXTzNFWFFINjVPeThHM3l6OXhBZWVGSkNTcGR4ZEw4Q0dteGh5Y2pNZVB6?=
 =?utf-8?B?RkVyazJNbXdHWnBEdGhQZUlpRk8wQVJFU3BNTXBWUm1jTWw1bDM2Q3RYRTdh?=
 =?utf-8?B?T1JhMEJKRjROUTNHamY2VFBadDJqMWhobERMQzJxWGxQbU1NZktYVGhqbHMx?=
 =?utf-8?B?SEkvK1hxNFQ3RXZUUzZCT3Q1cTIveW5wSC9jMmlDVVVPeDgrTTZKeDRvWGtn?=
 =?utf-8?B?UEE1TkRraEg0bThnSGFnMisxMGlTRlBEbnk2aVlUSkJacmJ5NG5XSFlNL3J3?=
 =?utf-8?B?WDMvRUMzaVp5Mmt1aEc2dFA3c0cvSTNnb3FSbkpJU2lsQlF5YkdXYXdBOGJG?=
 =?utf-8?B?QmhiZFlPRTZUVGdGcGJPSW1PTS9aSEpLSzlSSloxQXZ3VElMNS9HRmRYeUFF?=
 =?utf-8?B?NFRzaG1PdWErYkR5SmpyVnB3QVUwNkkrTFVMZEU3SmtuaVd4dktPRjZEMUtU?=
 =?utf-8?B?YlJoLzRzRlJaSlFVSmx1U3ZDRWVrVmpXUm5Zc2lVbTV5cFJqU3Z6dldKL0Rq?=
 =?utf-8?Q?e6pBJZMusPIbauC4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <666D5510ECEB4045AE971C26C0FD3CB3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Vy/gsLC1HPoFkW2WX4Zx0cNxDS9/Pz4NzNw7IC0gHPVnNOmcfis77TKAYBScToiG6RE3ga/31KCBM56XPiExmcP6k+vJoCDqRAv6j0CqISCCph5Dj9t5oNGSNbspw9dd5QKu0SmwuqGraCKnoFlGAnZwBtRlwMKp6wsOrXJJWggdIKV/j642bQ8N7cPLA2Lil5O3xbyDhMXt7Bsx2kRZduhmHeUIdMSIIWTldMgGoUoSi2sNBa82V5dz3YDGMcZ0kSjiJJb73gMpgkyk2apuHxgH7kIygmv2oSviBV7ZvJ/eeJ8DQyg1l+YPIreDdQr8E7csrplO8GVW78WHC8E6oA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd569224-2d06-4b73-387e-08decb2d177c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 22:26:06.1007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pwpE2/T0P57R/7d8ta4/lUvxk1PaQ25wPhfkVr5hKXZXS2g+R9Mm5HEp3KsUgvD54e1exmP06ZWh3jGXcmG+TCva628mmVNjChuzdhXId4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
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

T24gRnJpLCAyMDI2LTA2LTEyIGF0IDE3OjE2IC0wNzAwLCBYaW4gV2FuZyB3cm90ZToNCj4geGVf
bWVtaXJxX2luaXQoKSBpcyBjYWxsZWQgZnJvbSB4ZV90aWxlX2luaXQoKSwgYmVmb3JlIEhXIGVu
Z2luZXMgYXJlDQoNCkNhbiB3ZSBtb3ZlIHRoaXMgdG8geGVfZ3RfaW5pdF9lYXJseSgpIGluc3Rl
YWQ/IFRoaXMgaXMgZGVwZW5kZW50IG9uDQp0aGUgZnVzZXMgb2YgY291cnNlIHdoaWNoIG5lZWQg
dG8gY29tZSBsYXRlciwgc28gSSdtIHRoaW5raW5nIHdlIGhhdmUNCmFuIHhlX3hlX2h3X2VuZ2lu
ZXNfaW5pdF9wcmVmdXNlKCkgb3Igc29tZXRoaW5nIHRoYXQgdXNlcyB0aGUgZW5naW5lcw0KZGVm
aW5lZCBpbiB4ZV9wY2kuYyB0byBjb21lIHVwIHdpdGggYW4gZWFybHkgY291bnQuDQoNCk1heWJl
IEknbSBvdmVydGhpbmtpbmcgdGhhdCB0aG91Z2guLi4gSXQgd291bGQgYmUgbmljZSB0byBoYXZl
DQpldmVyeXRoaW5nIGluIG9uZSBmb3JfZWFjaCBtYWNybywgYnV0IHRoZW4gdGhlIG1hY3JvIHdv
dWxkIG5lZWQgdG8NCmNvbXByZWhlbmQgd2hldGhlciB0aGUgZnVzZXMgd2VyZSByZWFkIGFscmVh
ZHkgb3Igbm90Li4uDQoNCk9uZSBkb3duc2lkZSBvZiB0aGlzIGFwcHJvYWNoIGlzIHdlJ3JlIGFs
bG9jYXRpbmcgbW9yZSBzcGFjZSB0aGFuIHdlDQpyZWFsbHkgbmVlZCB0byBzaW5jZSB3ZSBtaWdo
dCBub3QgYmUgc3VwcG9ydGluZyB0aGUgZnVsbCBlbmdpbmUgc2V0DQp5b3UncmUgcXVlcnlpbmcu
IE1heWJlIHdlIHJlLWFsbG9jYXRlIGFmdGVyIHRoZSBlbmdpbmUgaW5pdGlhbGl6YXRpb24NCmlz
IGRvbmU/DQoNCk9yIG1heWJlIHdlIG1vdmUgdGhlIG1lbWlycSBpbml0IGxhdGVyIGluIHRoZSBs
b2FkIHNlcXVlbmNlPyBUaGF0IG1pZ2h0DQpoYXZlIGNvbnNlcXVlbmNlcyBmb3IgVkYgbG9hZCB0
aG91Z2ggLSB3b3VsZCBuZWVkIE1pY2hhbCdzIGlucHV0IHRoZXJlLg0KDQpPbmUgbWlub3IgY29t
bWVudCBiZWxvdyBhcyB3ZWxsLi4NCg0KPiBpbml0aWFsaXplZC4gaHdlX21heF9jb3VudCgpIHVz
ZXMgZm9yX2VhY2hfaHdfZW5naW5lKCkgdG8gc2l6ZSB0aGUNCj4gbWVtaXJxIEJPLCBidXQgYXQg
dGhpcyBwb2ludCBod2UtPm5hbWUgaXMgc3RpbGwgTlVMTCBzbyB0aGUgaXRlcmF0b3INCj4geWll
bGRzIG5vdGhpbmcgYW5kIHRoZSBCTyBpcyBhbGxvY2F0ZWQgd2l0aCBhIHNpbmdsZSBwYWdlLCB3
aGljaCBpcw0KPiBpbnN1ZmZpY2llbnQgb24gcGxhdGZvcm1zIHdoZXJlIGVuZ2luZSBpbnN0YW5j
ZXMgZG8gbm90IHN0YXJ0IGF0IDAuDQo+IA0KPiBDYzogTWljaGFsIFdhamRlY3prbyA8bWljaGFs
LndhamRlY3prb0BpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFhpbiBXYW5nIDx4LndhbmdA
aW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMg
fCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9od19lbmdpbmUuaCB8wqAgMSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21lbWlycS5j
wqDCoMKgIHzCoCA2ICsrLS0tLQ0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfaHdfZW5naW5lLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4g
aW5kZXggOTgyNjUyOTNmMmRjLi4xNmZmMzc3NTZkZGIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
aHdfZW5naW5lLmMNCj4gQEAgLTEwMTgsNiArMTAxOCwzMiBAQCB1MzIgeGVfaHdfZW5naW5lX21h
c2tfcGVyX2NsYXNzKHN0cnVjdCB4ZV9ndA0KPiAqZ3QsDQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gbWFzazsNCj4gwqB9DQo+IMKgDQo+ICsvKioNCj4gKyAqIHhlX2h3X2VuZ2luZV9tYXhfaW5z
dGFuY2UgLSBHZXQgdGhlIG1heGltdW0gSFcgZW5naW5lIGluc3RhbmNlDQo+IGZvciBhIEdULg0K
PiArICogQGd0OiB0aGUgJnhlX2d0DQo+ICsgKg0KPiArICogQ29tcHV0ZSB0aGUgaGlnaGVzdCBI
VyBlbmdpbmUgaW5zdGFuY2UgcHJlc2VudCBvbiBAZ3QgYmFzZWQgb24NCj4gdGhlIHN0YXRpYw0K
PiArICogZW5naW5lIG1hc2suIFVubGlrZSBpdGVyYXRpbmcgd2l0aCBmb3JfZWFjaF9od19lbmdp
bmUoKSwgdGhpcw0KPiByZWxpZXMgb25seSBvbg0KPiArICogQGd0LT5pbmZvLmVuZ2luZV9tYXNr
IChzZXQgZHVyaW5nIGVhcmx5IFBDSSBwcm9iZSkgYW5kIHRoZSBzdGF0aWMNCj4gZW5naW5lDQo+
ICsgKiBkZXNjcmlwdG9yIHRhYmxlLCBzbyBpdCBpcyB2YWxpZCBldmVuIGJlZm9yZSBodyBlbmdp
bmVzIGFyZQ0KPiBpbml0aWFsaXplZA0KPiArICogKGUuZy4gd2hlbiBzaXppbmcgdGhlIGBNZW1v
cnkgQmFzZWQgSW50ZXJydXB0c2BfIHJlcG9ydCBwYWdlcykuDQo+ICsgKg0KPiArICogUmV0dXJu
OiBUaGUgbWF4aW11bSBlbmdpbmUgaW5zdGFuY2UgdmFsdWUgb24gQGd0Lg0KPiArICovDQo+ICt1
bnNpZ25lZCBpbnQgeGVfaHdfZW5naW5lX21heF9pbnN0YW5jZShzdHJ1Y3QgeGVfZ3QgKmd0KQ0K
PiArew0KPiArwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBpbnQgbWF4X2luc3RhbmNlID0gMDsNCj4g
K8KgwqDCoMKgwqDCoMKgZW51bSB4ZV9od19lbmdpbmVfaWQgaWQ7DQo+ICsNCj4gK8KgwqDCoMKg
wqDCoMKgZm9yIChpZCA9IDA7IGlkIDwgWEVfTlVNX0hXX0VOR0lORVM7ICsraWQpIHsNCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChndC0+aW5mby5lbmdpbmVfbWFzayAmIEJJ
VChpZCkpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
bWF4X2luc3RhbmNlID0gbWF4KG1heF9pbnN0YW5jZSwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKHVuc2lnbmVkDQo+IGludCllbmdpbmVfaW5mb3NbaWRdLmluc3RhbmNlKTsNCg0KV2Ug
Y2FuIGRyb3AgdGhlIGNhc3QgaGVyZSBzaW5jZSB0aGUgdmFyaWFibGUgaXMgdWludCBhbHNvLg0K
DQpUaGFua3MsDQpTdHVhcnQNCg0KPiArwqDCoMKgwqDCoMKgwqB9DQo+ICsNCj4gK8KgwqDCoMKg
wqDCoMKgcmV0dXJuIG1heF9pbnN0YW5jZTsNCj4gK30NCj4gKw0KPiDCoGJvb2wgeGVfaHdfZW5n
aW5lX2lzX3Jlc2VydmVkKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSkNCj4gwqB7DQo+IMKgwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0ID0gaHdlLT5ndDsNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9od19lbmdpbmUuaA0KPiBpbmRleCBjM2VlMzdmOGNmYzAuLjgzOGFiZjcwOTJhNSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5oDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuaA0KPiBAQCAtNTUsNiArNTUsNyBAQCB2b2lkIHhl
X2h3X2VuZ2luZV9oYW5kbGVfaXJxKHN0cnVjdCB4ZV9od19lbmdpbmUNCj4gKmh3ZSwgdTE2IGlu
dHJfdmVjKTsNCj4gwqB2b2lkIHhlX2h3X2VuZ2luZV9lbmFibGVfcmluZyhzdHJ1Y3QgeGVfaHdf
ZW5naW5lICpod2UpOw0KPiDCoHUzMiB4ZV9od19lbmdpbmVfbWFza19wZXJfY2xhc3Moc3RydWN0
IHhlX2d0ICpndCwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVudW0geGVfZW5naW5lX2NsYXNzIGVuZ2luZV9jbGFzcyk7
DQo+ICt1bnNpZ25lZCBpbnQgeGVfaHdfZW5naW5lX21heF9pbnN0YW5jZShzdHJ1Y3QgeGVfZ3Qg
Kmd0KTsNCj4gwqBzdHJ1Y3QgeGVfaHdfZW5naW5lX3NuYXBzaG90ICoNCj4gwqB4ZV9od19lbmdp
bmVfc25hcHNob3RfY2FwdHVyZShzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UsIHN0cnVjdA0KPiB4
ZV9leGVjX3F1ZXVlICpxKTsNCj4gwqB2b2lkIHhlX2h3X2VuZ2luZV9zbmFwc2hvdF9mcmVlKHN0
cnVjdCB4ZV9od19lbmdpbmVfc25hcHNob3QNCj4gKnNuYXBzaG90KTsNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tZW1pcnEuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9tZW1pcnEuYw0KPiBpbmRleCA5ZGZlOTY1Y2I0NmUuLjVhODdhYzQyMzUxZCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21lbWlycS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9tZW1pcnEuYw0KPiBAQCAtMTc1LDEzICsxNzUsMTEgQEAgc3RhdGljIGlubGlu
ZSBib29sDQo+IGh3X3JlcG9ydHNfdG9faW5zdGFuY2VfemVybyhzdHJ1Y3QgeGVfbWVtaXJxICpt
ZW1pcnEpDQo+IMKgc3RhdGljIHVuc2lnbmVkIGludCBod2VfbWF4X2NvdW50KHN0cnVjdCB4ZV90
aWxlICp0aWxlKQ0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGludCBtYXhfaW5z
dGFuY2UgPSAwOw0KPiAtwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBpbnQgZ3RpZCwgaHdlaWQ7DQo+
IC3CoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZTsNCj4gK8KgwqDCoMKgwqDC
oMKgdW5zaWduZWQgaW50IGd0aWQ7DQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0
Ow0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgZm9yX2VhY2hfZ3Rfb25fdGlsZShndCwgdGlsZSwg
Z3RpZCkNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvcl9lYWNoX2h3X2VuZ2lu
ZShod2UsIGd0LCBod2VpZCkNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBtYXhfaW5zdGFuY2UgPSBtYXgobWF4X2luc3RhbmNlLCBod2UtDQo+ID5pbnN0
YW5jZSk7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtYXhfaW5zdGFuY2UgPSBt
YXgobWF4X2luc3RhbmNlLA0KPiB4ZV9od19lbmdpbmVfbWF4X2luc3RhbmNlKGd0KSk7DQo+IMKg
DQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gbWF4X2luc3RhbmNlICsgMTsNCj4gwqB9DQoNCg==
