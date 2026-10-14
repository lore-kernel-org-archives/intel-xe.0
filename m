Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8E3CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 05:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E5310E065;
	Wed, 14 Oct 2026 05:08:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA3C10E065;
 Wed, 14 Oct 2026 05:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791954497; x=1823490497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=wRpLpd5cu37DofztTGhu9v8Rv/eCKYAH7iitAbg+cT4=;
 b=PoMGMP8/WBzOOdGTcBOrT6atDtsYr7EWTIyLeOa1Juj/b5Stpm9D8IKP
 aoilLPC1+GNnuMSGghlZfLIQS8MYacJFA/T3YSVB4df/mTh7lKl4VSwnD
 1xXjLEVAx6CPFM4JQ1D6PVuosRYsUCiBVYyxm9Wbl9QjGWviuxaKsB5wZ
 OCUOY4RZ615B0jMjkhWEIk27rwqstSw5EtWLZjgCL64Z+QZyzvbF8+gTe
 +FQXF1QLRfZkZ4ikLl3UJOnpmBh4RcSIgV9A4RCJg8kUQqdIQr+hUCCEf
 m4sk2zi5pu/0nObAZflZxMh6F1sfrS072OIBY2sgBFxeZ0r8JsOZL5Gqh g==;
X-CSE-ConnectionGUID: UW2GECw+SWig2f6ssbMZNg==
X-CSE-MsgGUID: Q2U0MkUFRFew0zkVeMmXcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="590766"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; d="scan'208,217";a="590766"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 22:08:11 -0700
X-CSE-ConnectionGUID: EJ8B4r1hQnyXufVNXOjTEg==
X-CSE-MsgGUID: YzA0IOP0TRul9lgraPeRAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; d="scan'208,217";a="1303193"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 22:08:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 22:07:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 22:07:55 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 22:07:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSmxIr9yLEYBFpa9cw1L/bkVQZ7Qc2rLGBycrvJkfTCSyo2DhQI+4202xRv+NcmwK9xaNUWdRR8zEWxVD3pIyyxCC5fUmQNu4ngrPXc+K73dbN7ZOYQYVGvnfyvyKvyBkW/zawdaZaRzdug9e77O70QQErP3Mqbjc+dW2lYj7VO2AABO2RUFytEDi0xwjYAzCC5RS3ZWrVOf8lhy2NJAH3PborE4JxX9nAEa2Gd1ev1dyKpdiRJqpUiwPhj3QWC6CJJSyVqeQ98OQeMMJhqECHh8ggRaX0Nk17MG7azUZaBxiLLxy6JQbqIPYcEdWayP8XVWzAwoMqrWOEo5BljYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRpLpd5cu37DofztTGhu9v8Rv/eCKYAH7iitAbg+cT4=;
 b=Ev+p3Hk6z7uikp/rtRJSEnXpr9cl0IxXBZxVW0wgLLxvA793uvAfzkICe/o2JtI6GyHmf+4xkNVjJpJNP4fWXQO0uBu1GM9gYhVD6tPSyPgAQ+G6fPbSAT/6zmWxpG8gO4iVpMlmgSW5Y4uGwUJ0Lko5AR6a0b+sRgNthEbF5+DupNVc9BSTi4QZ+WA9hTT9A7qrOQvJnUaq4NNLX5E7j7a6OsMiDBnp5KnZcm47tmCA4bi7M2iJHtD3zoJeUBEqLovOak7I2NbcBMUNZI0FY9NMEsNvc+rC+HcD5GkelyesRvPSmNRWnOGxZCmxNFWz6L+lZnG+VEGYTbGP2kBDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from EA3PR11MB406321.namprd11.prod.outlook.com
 (2603:10b6:303:309::12) by SA1PR11MB9614.namprd11.prod.outlook.com
 (2603:10b6:806:4c4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 05:07:47 +0000
Received: from EA3PR11MB406321.namprd11.prod.outlook.com
 ([fe80::d9e7:fbcf:fce2:83c3]) by EA3PR11MB406321.namprd11.prod.outlook.com
 ([fe80::d9e7:fbcf:fce2:83c3%6]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 05:07:47 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvdHVuaW5n?=
 =?utf-8?Q?:_Fix_Xe3p_tuning_register_mismatches?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cmUgZm9yIGRybS94ZS90dW5pbmc6IEZp?=
 =?utf-8?Q?x_Xe3p_tuning_register_mismatches?=
Thread-Index: AQHdWtm+0TbzqALIZE2VPPVMBElGWrb8ebiE
Date: Wed, 14 Oct 2026 05:07:47 +0000
Message-ID: <EA3PR11MB40632112FF583A2D10883EB34FD09D2@EA3PR11MB406321.namprd11.prod.outlook.com>
References: <20261012171901.19508-4-nitin.r.gote@intel.com>
 <179187189070.16050.7417635594372896099@221881a7231d>
In-Reply-To: <179187189070.16050.7417635594372896099@221881a7231d>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA3PR11MB406321:EE_|SA1PR11MB9614:EE_
x-ms-office365-filtering-correlation-id: d581bee7-2567-48f5-0bdf-08df29b11697
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|5023799004|11063799006|4143699003|261009221227099003|261009223027099003|10067099003|18002099003|22082099003|13003099007|8096899003;
x-microsoft-antispam-message-info: WnvoSCCtirmUJm0+P1hl/s5uwmjxXGhRXuvw3rmE4U2ktapKmFLeg8BzQvDApm8S6EHbVq48NDMFcE0FGWtT6BvQ0qaTJ3lYBMTljBbd/XdGF7UQ/A01fNKkyTkremhXK4MQfklYNpNXiziZdjtG5q/wWORLliSeeiSdHm/ko8PVmiPxzRBMWRrTY6G5yuXSVjcUMmfxLFTI4DbVgNkrO2diDYeY7ccYEiFSLY/ne8BVNG5DxXlSpU8W/dP2frW/U8ZiPm7/1nRNjU/TR+W8InhDiYXuseTGmYx8cXDF0k0geTPudq16p8kMlqAFV2zUnnrTjyRYVloS4PobBdP1dOwqMyLO6J1mVfIGWP4ixoovWb1MZAQaaTYsUmApF9WlsgZYl3jQVQePsgD5U3U3mnNobDzqmprBAjgvdu6ffjOffX/X1uf8e+eXbC+trPmY/xhveBc4bYnzsgtNTjGg661GqDDqyfeBBMnbrTDYM7bvsa5WGq3P/+qAlFZUlps3jVqoUUicbqY6XWCWwC6AzNR4ufLLXW78d/Jctq+USWx2EwD5KGTibkpXJTTeTXUYdwyWhlcQBBJbBBCI8LiPTWM7NvmXnNeF0ukNHj6EMy9AYKXXP2r8e7d/ePXE6RjM3rMHOmV1nC72EbOc7672lcWXMaPSq4dDRJ1zyU4qOf0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EA3PR11MB406321.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(5023799004)(11063799006)(4143699003)(261009221227099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUo5TmttenE4MFdaZlVBWU13aG5yNkFUSXNockNLdnN4N2tmSFJxWnBCNEVr?=
 =?utf-8?B?alFTZHBBM01OK0xXd25NRWRkMEZITEdjeGxtRnlPRlBENE42YzVpQXlMaG0y?=
 =?utf-8?B?WFErQitOdURrSzlWSXZrU3pYeHFweSt3Smd4QmZMYzEyWnJXOHRrM2V5MC93?=
 =?utf-8?B?NTM4MHoxdVBWcmNwM1dkQ1RsSy9tSUNlZDdNamxaWlJ4UmwzY3BwcjlucXhY?=
 =?utf-8?B?dk1HV01vejlNUWhKYzVWU0Z4VHE1MlFjM2RQa012Y3dYaTllaGpJdk5KY0x5?=
 =?utf-8?B?Wmh4YU82cUUxUWZmUmVTVUFzVzQ4OFhaVERwUDJTU0IzL01uSnJnV095ZDFL?=
 =?utf-8?B?ZFFuaEZXeThDUjJ5N0NnckZlYkkrYVlOOStaZ2RVZ3NCb3NSOFBjM2xYOHpU?=
 =?utf-8?B?NUZVT01QSDR0VlVYM1hiOWlMZThrcXlSU0YvSTVaR1BqMVprVnVPMTB5SnM5?=
 =?utf-8?B?N3pPazZSK2lZZ1E3T2gyZ1lkWHhYb2NsaFI4T1Bjd3VoSVB1cGZZZEtMZklp?=
 =?utf-8?B?WHFDdWpWNFF5Z08vR3B0V2V3REFvTUNEby9qOW96S1ZuSmFmNUdNbkV6b1I1?=
 =?utf-8?B?M2FTVko1MnFrZHkrK01UN1pjS0ZPZ0V2bTJRQ1pTVU5hRzM2MkdIbUdsZjF4?=
 =?utf-8?B?QU1oTHROQndHZGhFVzNJZERpdUg5cUlrYTg4ZGFjbmN0TEpMcE9qQmRTQXdN?=
 =?utf-8?B?RUNSUzJ1MWgwdWVKelRER2szZnNMRm15elBDZ0YweFFRaEY2emFuSnBBTFBs?=
 =?utf-8?B?ZStTcURTcHJsbHlMbTVlb2FpbGtGZGpTOEo1Nk1IRGp2NlFBU0MyWkc0WmQx?=
 =?utf-8?B?ankrSk5FM1FxbEtFYzZINlBhZ2pCdzBhS3ZGVE5JOWFaYWJOMUoyQy9LTytl?=
 =?utf-8?B?K0xOVWJYSFlWcXZ0ZHk2RDJUUE5LeE1uMXRzbW5ZaHZKSTg4SmxFamdEb1hP?=
 =?utf-8?B?enhXd1lWbFpONmVXVTJyUFhPbkoyVVBJR0UzdW8zd1hha0o3VU92dU5vNFNW?=
 =?utf-8?B?ajJqMTZDS0F4aXluMnFOb2hXTHY1R1V5VHBseS9MeEgybThqeE91L0tQbEdh?=
 =?utf-8?B?NUh5Tnp0UzZEa21zZUxLazV3VlpiL3ZDZGtWODlSdjYzRlZMT2JXZ3NhUjF0?=
 =?utf-8?B?U1dXdkcrNFlmMU1hRXIxUzZwUkhFd0dIZ3d3U3RVb0JzZjd1L0NvSjhyZE8x?=
 =?utf-8?B?YUVSVGNTOXN5WVRpalJtOTc5SFVqWGd4bUJWZW1PeHUraXVpT1JHc1phajYr?=
 =?utf-8?B?Q1BxcnozbkovKzhOZ25NMk9IUHJEdnY0QnRuS1FMRnlrU1lJa0xIOHM1QlNN?=
 =?utf-8?B?elk1NitDTytaUnNQMHVVc256c05aVGRxRC9JSWRmemU4ZHdDNW9zZWJvQzlD?=
 =?utf-8?B?TXczb0NZUHVBWTgxR3dVcjBERGNwREYrSWNDUFI1TUxrZlhseERuUDNMd0ty?=
 =?utf-8?B?M1NmMmFBTG5lWEU5SzlreWx0NWpKS0lxdU14cmR3aXRHdjJya29oWnVLV2Nu?=
 =?utf-8?B?NEpnNGh0TGpMM0txekxIaXczYnMyUmE4alBJTFJINlZNVUZRKy81ZEVCcEtw?=
 =?utf-8?B?ODJ0SlVwVG5sY0NITkp2WkRQRXVQVEFoYzFLQnhsbitkK1ROUkVrLzdncXAx?=
 =?utf-8?B?RGdWVTdvSFFEb0tnTHoyYThkdjF3ai9yMXAyRHBPZVpoU3VWVEZSVGZZUGtT?=
 =?utf-8?B?bDhOdUsySjlrUGR0clVvSlRXZmpRM3BlVHVDc3hlYTdESUdLTlVONTB5ZU5i?=
 =?utf-8?B?bFpGVGtYUGN4anVrNEF5RVkvNHRRRGZ2R1BTVmZSQ2VUZGVtQ0k2MGNWM1Mx?=
 =?utf-8?B?NnZLd1lRZjNJMUZBcWtiSkNhTkxaUkw3ZjF3RC83VjR0cTQwWDJqQ3VWV3JG?=
 =?utf-8?B?YVRBa216VXVYaGtVamhkN3lNcGhBZTR5eUFzUUxSNzZTYjRnSjA5eS9LdnNv?=
 =?utf-8?B?MHNLUFZPMzhMdE5MTHBMcnRYL25DeVE5Ty9yckFhaEhKeFlYektMelVDdy9P?=
 =?utf-8?B?NWJpK0lIVVFld2J6SUI0a1hselgxV3c4aEJVYU9yZDNWQkZGNkQ2aFJHb3hV?=
 =?utf-8?B?S3NrTXNVZlFvczYvNmhHTXdkcFBDU1JUL0ZZMFBVVUp2c0dIazY2RjdQYU5C?=
 =?utf-8?B?SUpNUHV6aHJYQmJlQU40d3hSbFplL3hBK25OWTdUR3lvaUYrWTZsenNlb09n?=
 =?utf-8?B?ZFVyNnoxNXova2VNd0FIdEE2OU4yVVkzZlYxZVFqaWwwL1I5M25vSUVERCtv?=
 =?utf-8?B?dXoycDhpakVvTnkvYmlBZXMvaTNheWRmMWFuL2xvOUJybThJKzFjd3h2WXZY?=
 =?utf-8?B?YncyNmkxUUlDZk9vSTRoUzhsU1MvOFhwUFh4Q0pqYWJjWEpWSWY2QT09?=
Content-Type: multipart/alternative;
 boundary="_000_EA3PR11MB40632112FF583A2D10883EB34FD09D2EA3PR11MB406321_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: p+TKAzZD9QPWsIVEayF+f2KSi/0Gr8whvGRhIv5BczoiCIJr3JTVI6IlGx9CB7xWSeYjjAwY46dLwLCzdBVOnCia3smNHieyQC+wYTtmXwbmw1ubYI8D2t/j0uYXyTrKvJkeEGswGX/J0RtoJJcSJnC65CTYuLrrl8w3TJDXdT4bOuiTQ5dhixxQkZGZilFx6zGPoV33zT7smaJuOJd2QBQVe3VAkon/Fp1g4/JBcMX7UWIDMszMl60q3zbk87TM2+czDxMbLjLDy+OBpPN0539sWJXuzjGNXvC7zAHWtPR5xsccZngmVcONorvzMYF2hEihhQO3Ln+MKYqelm0e5Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA3PR11MB406321.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d581bee7-2567-48f5-0bdf-08df29b11697
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 05:07:47.4676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eELEJphy5rSVy1JFeEAmWevnNJY4IPpQ8KAbX7oASHsuZ91/UkD4GwQb7P2pWusLYN+kCE6DbbsdgM0NwKZthw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9614
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

--_000_EA3PR11MB40632112FF583A2D10883EB34FD09D2EA3PR11MB406321_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0kgdGVhbSwNCg0KUmVwb3J0ZWQgZmFpbHVyZXMgYXJlIG5vdCByZWxhdGVkIHRvIG15IHBh
dGNoLiBDb3VsZCB5b3UgcGxlYXNlIHJlLXJlcG9ydD8NCg0KVGhhbmtzLA0KTml0aW4NCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IFBhdGNod29yayA8cGF0Y2h3b3Jr
QGVtZXJpbC5mcmVlZGVza3RvcC5vcmc+DQpTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDEzLCAyMDI2
IDExOjQxIEFNDQpUbzogR290ZSwgTml0aW4gUiA8bml0aW4uci5nb3RlQGludGVsLmNvbT4NCkNj
OiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGludGVsLXhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4NClN1YmplY3Q6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvdHVu
aW5nOiBGaXggWGUzcCB0dW5pbmcgcmVnaXN0ZXIgbWlzbWF0Y2hlcw0KDQpQYXRjaCBEZXRhaWxz
DQpTZXJpZXM6DQpkcm0veGUvdHVuaW5nOiBGaXggWGUzcCB0dW5pbmcgcmVnaXN0ZXIgbWlzbWF0
Y2hlcw0KVVJMOg0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNzU5
NzMvDQpTdGF0ZToNCmZhaWx1cmUNCkRldGFpbHM6DQpodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0xNzU5NzN2MS9pbmRleC5odG1sDQpDSSBCdWcgTG9nIC0g
Y2hhbmdlcyBmcm9tIHhlLTU5MzMtMjIwOTBlYzE3MWNhN2NkN2QyNjVlYzlhYzY5ZmRlZTgyNGJk
YzY1Y19GVUxMIC0+IHhlLXB3LTE3NTk3M3YxX0ZVTEwNClN1bW1hcnkNCg0KRkFJTFVSRQ0KDQpT
ZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCB4ZS1wdy0xNzU5NzN2MV9GVUxMIGFi
c29sdXRlbHkgbmVlZCB0byBiZQ0KdmVyaWZpZWQgbWFudWFsbHkuDQoNCklmIHlvdSB0aGluayB0
aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0K
aW50cm9kdWNlZCBpbiB4ZS1wdy0xNzU5NzN2MV9GVUxMLCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVn
IHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVt
DQp0byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZh
bHNlIHBvc2l0aXZlcyBpbiBDSS4NCg0KUGFydGljaXBhdGluZyBob3N0cyAoMyAtPiAzKQ0KDQpO
byBjaGFuZ2VzIGluIHBhcnRpY2lwYXRpbmcgaG9zdHMNCg0KUG9zc2libGUgbmV3IGlzc3Vlcw0K
DQpIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1
Y2VkIGluIHhlLXB3LTE3NTk3M3YxX0ZVTEw6DQoNCklHVCBjaGFuZ2VzDQpQb3NzaWJsZSByZWdy
ZXNzaW9ucw0KDQogICogICBpZ3RAa21zX2FzeW5jX2ZsaXBzQGFzeW5jLWZsaXAtc3VzcGVuZC1y
ZXN1bWVAcGlwZS1jLWVkcC0xOg0KICAgICAqICAgc2hhcmQtcHRsOiBQQVNTPGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLTU5MzMtMjIwOTBlYzE3MWNhN2NkN2Qy
NjVlYzlhYzY5ZmRlZTgyNGJkYzY1Yy9zaGFyZC1wdGwtMy9pZ3RAa21zX2FzeW5jX2ZsaXBzQGFz
eW5jLWZsaXAtc3VzcGVuZC1yZXN1bWVAcGlwZS1jLWVkcC0xLmh0bWw+IC0+IERNRVNHLVdBUk48
aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUveGUtcHctMTc1OTczdjEv
c2hhcmQtcHRsLTgvaWd0QGttc19hc3luY19mbGlwc0Bhc3luYy1mbGlwLXN1c3BlbmQtcmVzdW1l
QHBpcGUtYy1lZHAtMS5odG1sPg0KDQo=

--_000_EA3PR11MB40632112FF583A2D10883EB34FD09D2EA3PR11MB406321_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxwIGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIg
c3R5bGU9InRleHQtYWxpZ246IGxlZnQ7IHRleHQtaW5kZW50OiAwcHg7IGJhY2tncm91bmQtY29s
b3I6IHJnYigyNTUsIDI1NSwgMjU1KTsgbWFyZ2luOiAwY207Ij4NCjxzcGFuIHN0eWxlPSJmb250
LWZhbWlseTogQXB0b3MsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsgY29sb3I6IHJnYigz
NiwgMzYsIDM2KTsiPkhpIENJIHRlYW0sPC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJlbGVtZW50VG9Q
cm9vZiIgc3R5bGU9InRleHQtYWxpZ246IGxlZnQ7IHRleHQtaW5kZW50OiAwcHg7IGJhY2tncm91
bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsgbWFyZ2luOiAwY207Ij4NCjxzcGFuIHN0eWxl
PSJmb250LWZhbWlseTogQXB0b3MsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsgY29sb3I6
IHJnYigzNiwgMzYsIDM2KTsiPlJlcG9ydGVkIGZhaWx1cmVzIGFyZSBub3QgcmVsYXRlZCB0byBt
eSBwYXRjaC4gQ291bGQgeW91IHBsZWFzZSByZS1yZXBvcnQ/PC9zcGFuPjwvcD4NCjxkaXYgc3R5
bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRT
ZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50
VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBB
cHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQt
c2l6ZTogMTFwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KVGhhbmtzLDwvZGl2Pg0KPGRpdiBj
bGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0Vt
YmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5z
LXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCk5pdGluPC9k
aXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwg
c2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+
DQo8L2Rpdj4NCjxociBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyB3aWR0aDogOTglOyI+
DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8Yj5Gcm9t
OjwvYj4gUGF0Y2h3b3JrICZsdDtwYXRjaHdvcmtAZW1lcmlsLmZyZWVkZXNrdG9wLm9yZyZndDs8
YnI+DQo8Yj5TZW50OjwvYj4gVHVlc2RheSwgT2N0b2JlciAxMywgMjAyNiAxMTo0MSBBTTxicj4N
CjxiPlRvOjwvYj4gR290ZSwgTml0aW4gUiAmbHQ7bml0aW4uci5nb3RlQGludGVsLmNvbSZndDs8
YnI+DQo8Yj5DYzo8L2I+IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyAmbHQ7aW50ZWwt
eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiDinJcgWGUu
Q0kuRlVMTDogZmFpbHVyZSBmb3IgZHJtL3hlL3R1bmluZzogRml4IFhlM3AgdHVuaW5nIHJlZ2lz
dGVyIG1pc21hdGNoZXMNCjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmks
IEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJn
YigwLCAwLCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2PjxiPlBhdGNoIERldGFpbHM8L2I+PC9k
aXY+DQo8dGFibGU+DQo8dGJvZHk+DQo8dHI+DQo8dGQgc3R5bGU9InBhZGRpbmc6IDJwdDsiPg0K
PGRpdj48Yj5TZXJpZXM6PC9iPjwvZGl2Pg0KPC90ZD4NCjx0ZCBzdHlsZT0icGFkZGluZzogMnB0
OyI+DQo8ZGl2PmRybS94ZS90dW5pbmc6IEZpeCBYZTNwIHR1bmluZyByZWdpc3RlciBtaXNtYXRj
aGVzPC9kaXY+DQo8L3RkPg0KPC90cj4NCjx0cj4NCjx0ZCBzdHlsZT0icGFkZGluZzogMnB0OyI+
DQo8ZGl2PjxiPlVSTDo8L2I+PC9kaXY+DQo8L3RkPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7
Ij4NCjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy8xNzU5NzMvIiBpZD0iT1dBYWVmOGNmNjYtNWNhNS0wYmYzLWJjODEtOTBhOTU4ZjIyMmVkIiBj
bGFzcz0iT1dBQXV0b0xpbmsiIGRhdGEtYXV0aD0iTm90QXBwbGljYWJsZSI+aHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNzU5NzMvPC9hPjwvZGl2Pg0KPC90ZD4NCjwv
dHI+DQo8dHI+DQo8dGQgc3R5bGU9InBhZGRpbmc6IDJwdDsiPg0KPGRpdj48Yj5TdGF0ZTo8L2I+
PC9kaXY+DQo8L3RkPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+ZmFpbHVyZTwv
ZGl2Pg0KPC90ZD4NCjwvdHI+DQo8dHI+DQo8dGQgc3R5bGU9InBhZGRpbmc6IDJwdDsiPg0KPGRp
dj48Yj5EZXRhaWxzOjwvYj48L2Rpdj4NCjwvdGQ+DQo8dGQgc3R5bGU9InBhZGRpbmc6IDJwdDsi
Pg0KPGRpdj48YSBocmVmPSJodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14
ZS94ZS1wdy0xNzU5NzN2MS9pbmRleC5odG1sIiBpZD0iT1dBZDliNGUzMzctNjc5Mi0xNTg0LWQz
N2MtNTg2ZmVjMzY2NDgxIiBjbGFzcz0iT1dBQXV0b0xpbmsiIGRhdGEtYXV0aD0iTm90QXBwbGlj
YWJsZSI+aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUveGUtcHctMTc1
OTczdjEvaW5kZXguaHRtbDwvYT48L2Rpdj4NCjwvdGQ+DQo8L3RyPg0KPC90Ym9keT4NCjwvdGFi
bGU+DQo8aDE+Q0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSB4ZS01OTMzLTIyMDkwZWMxNzFjYTdj
ZDdkMjY1ZWM5YWM2OWZkZWU4MjRiZGM2NWNfRlVMTCAtJmd0OyB4ZS1wdy0xNzU5NzN2MV9GVUxM
PC9oMT4NCjxoMj5TdW1tYXJ5PC9oMj4NCjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAxZW07IG1hcmdp
bi1ib3R0b206IDFlbTsiPjxiPkZBSUxVUkU8L2I+PC9wPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6
IDFlbTsgbWFyZ2luLWJvdHRvbTogMWVtOyI+U2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29taW5n
IHdpdGggeGUtcHctMTc1OTczdjFfRlVMTCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmU8YnI+DQp2ZXJp
ZmllZCBtYW51YWxseS48L3A+DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDogMWVtOyBtYXJnaW4tYm90
dG9tOiAxZW07Ij5JZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5n
IHRvIGRvIHdpdGggdGhlIGNoYW5nZXM8YnI+DQppbnRyb2R1Y2VkIGluIHhlLXB3LTE3NTk3M3Yx
X0ZVTEwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW08YnI+DQp0byBkb2N1bWVudCB0aGlzIG5ldyBm
YWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS48L3A+
DQo8aDI+UGFydGljaXBhdGluZyBob3N0cyAoMyAtJmd0OyAzKTwvaDI+DQo8cCBzdHlsZT0ibWFy
Z2luLXRvcDogMWVtOyBtYXJnaW4tYm90dG9tOiAxZW07Ij5ObyBjaGFuZ2VzIGluIHBhcnRpY2lw
YXRpbmcgaG9zdHM8L3A+DQo8aDI+UG9zc2libGUgbmV3IGlzc3VlczwvaDI+DQo8cCBzdHlsZT0i
bWFyZ2luLXRvcDogMWVtOyBtYXJnaW4tYm90dG9tOiAxZW07Ij5IZXJlIGFyZSB0aGUgdW5rbm93
biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIHhlLXB3LTE3NTk3M3Yx
X0ZVTEw6PC9wPg0KPGgzPklHVCBjaGFuZ2VzPC9oMz4NCjxoND5Qb3NzaWJsZSByZWdyZXNzaW9u
czwvaDQ+DQo8dWw+DQo8bGk+aWd0QGttc19hc3luY19mbGlwc0Bhc3luYy1mbGlwLXN1c3BlbmQt
cmVzdW1lQHBpcGUtYy1lZHAtMTo8L2xpPjx1bD4NCjxsaT5zaGFyZC1wdGw6IDxhIGhyZWY9Imh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLTU5MzMtMjIwOTBlYzE3
MWNhN2NkN2QyNjVlYzlhYzY5ZmRlZTgyNGJkYzY1Yy9zaGFyZC1wdGwtMy9pZ3RAa21zX2FzeW5j
X2ZsaXBzQGFzeW5jLWZsaXAtc3VzcGVuZC1yZXN1bWVAcGlwZS1jLWVkcC0xLmh0bWwiIGlkPSJP
V0FiY2NmOTIzNS1lYjA4LTM5OWEtMWExZi1jYWMyOWY2NDQ0ZWYiIGNsYXNzPSJPV0FBdXRvTGlu
ayIgZGF0YS1hdXRoPSJOb3RBcHBsaWNhYmxlIj4NClBBU1M8L2E+IC0mZ3Q7IDxhIGhyZWY9Imh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE3NTk3M3YxL3No
YXJkLXB0bC04L2lndEBrbXNfYXN5bmNfZmxpcHNAYXN5bmMtZmxpcC1zdXNwZW5kLXJlc3VtZUBw
aXBlLWMtZWRwLTEuaHRtbCIgaWQ9Ik9XQTg4NWFhYzM2LTExY2YtYWNiOC1jZTg2LWE2NGEyOTdl
YzkzNiIgY2xhc3M9Ik9XQUF1dG9MaW5rIiBkYXRhLWF1dGg9Ik5vdEFwcGxpY2FibGUiPg0KRE1F
U0ctV0FSTjwvYT48L2xpPjwvdWw+DQo8L3VsPg0KPGgyPjxicj4NCjwvaDI+DQo8L2JvZHk+DQo8
L2h0bWw+DQo=

--_000_EA3PR11MB40632112FF583A2D10883EB34FD09D2EA3PR11MB406321_--
