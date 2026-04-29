Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D714FF8875
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 20:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E7810E041;
	Wed, 29 Apr 2026 20:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZV2DioU8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0484B10E041
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 20:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777494551; x=1809030551;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=r3E7Bp2EK4uchNkhduGB5Kwt4bC7z0XAlm9tG69myQw=;
 b=ZV2DioU8gwCG8xgvxw51gMOTtbzW01BW9mEhggPKWQ2fBRdHPfRwPAUN
 qqLmc9bFhNMlVnhNi0daO5hCD80NY09O4lkGe956yvhDHqybLWylySiOR
 TD67Y/oG3xDR5bPrkOTsVkfT0ikLife0rJXG+0MQ4J1KSjT+9i7vzD15c
 ghvZ7dqxTVfT3kJxh/P7GhPdXdbH+Wd3gS4yTOwFE2Dgj6Xs68fn44TEv
 z47tIlRtqJj7oEZ1NqRYTLjZLklE+igkXtAzEcfFC9Ge+uq8Q8tOThyEd
 AqIGhtp3hd8CNiNWHeHYG5RkuvTgz8bM/qcgNLAMZP8lEDbVENNSTrEim w==;
X-CSE-ConnectionGUID: tForE/gZRrK8CuwDRfSFVg==
X-CSE-MsgGUID: pIJc94kURYil7JmBniifAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77601482"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="77601482"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:29:10 -0700
X-CSE-ConnectionGUID: cVzgCHnMThSjhQ6oJsWPQQ==
X-CSE-MsgGUID: TWgQSjU0Slu15+ffWkTrQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="234641916"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:29:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:29:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 13:29:10 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:29:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EeMP4qzLrH2PtH/OdUqGoDz1qyBuypyOYej4nYQUMCq8z7Wu0ZtVEda7aKhjBoble0jqnsVHBpqSLpi17FTkbzhqqgwX8Z39pgUMqdOqRU3Vy343dj7Rlra1aYOqKaTdnKC9zUxOr/z8h8T3qMAy3M36mvM4xEwYUeu76uD4GdXuLZlMkuTTrI+8zYpxJushBCwuNBlwCRAOr9Gy1EG+Fuc/bMu18rVEIPSiCsyTSmMrVS6LdSNvkT//c6Uhxuj+vGqT74fLR4qWCimIX/sGAHPMnYBy7SRFcNynw3SAsw+ZGeH7xwl7ixjV46zYRed8OtzXxnlEY8TMfKQ7m0B8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3E7Bp2EK4uchNkhduGB5Kwt4bC7z0XAlm9tG69myQw=;
 b=UeeoVMrMCIw7yYn5g6bvJIJqimd5+A7J/rQhrpZRRoFRdwNmK5THrQPTkNrC4Q0ofC1lbqCsdl5CZbd9KbjjxpT4/i4jZ3Cojylso2j8AJhwy9KGbFTtj1ntEjllgtL2Cmv3JaasDJqxwtSs7411WdeXlfsmWDqHaj0hsXcDQ46xBaWvxo1qp2/GVekxR7+Bk6ozD6GQZ81GTcIlBVsgFjl1dPvYUpD4Yjij19eXCH2UsKwQtqgG9t1fA6jlZB/kXQX6y5G0DFrBbUkYyyA4Yq8+0rBAwUCJSOiQYjxNz/ABb1mVCDT/ei7awN3wFMDYJFUY8nm+rMX73VsAza1Y1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH8PR11MB6777.namprd11.prod.outlook.com (2603:10b6:510:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 20:29:08 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 20:29:08 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
CC: "dev@lankhorst.se" <dev@lankhorst.se>
Subject: Re: [PATCH 01/13] drm/xe/ggtt: Rename parameter name in
 xe_ggtt_init_kunit()
Thread-Topic: [PATCH 01/13] drm/xe/ggtt: Rename parameter name in
 xe_ggtt_init_kunit()
Thread-Index: AQHc1xs9k7ONtdHBK0isqW3AZvyET7X2f3AA
Date: Wed, 29 Apr 2026 20:29:08 +0000
Message-ID: <4561363a9ff4fc0449bd56df4c5ea9fa4d756f0b.camel@intel.com>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
 <20260428142722.582-2-michal.wajdeczko@intel.com>
In-Reply-To: <20260428142722.582-2-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH8PR11MB6777:EE_
x-ms-office365-filtering-correlation-id: 6c30c5b8-1d2a-4b36-cc79-08dea62df6fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: NMl8jmfVUSJQXl7cGpcvTcmHKGI4LeA4N9qwdlmwI9Nk8H9ZeP1Wqst8O5FAFaKcyfyNLdcKbNKa6hHbmBszdZgkk3DU86I+UOyZyT9THpyM8whRam27aXJ+eJQLZzrbk733mowoJQHlNYuADOUIJ/0AfhjBSlHf+8EGtt4Uaejx/IkZ/Lw+NSoGRIPye9+gW7hAtrHhzuDlzPS9kTGnht8/TSZWBr8W8ukv+kWYSbUnciMi4dQbC/mdayjYcALQmwAmLs7rg827ds3gIRUFLF/rZuN0FP/zY493bhBwtDRPkruY/4ySi1Zhbr4GQerHoMiK3rWBTIzDrfnSo+RUnK6d1wS98NJ7HIv9a2663vh1VH0GzD89wHrMEtI4ofBQPVDJcI+DhPzGUn1H39ic6om9vhiVw8x5hdYKqzqOQil3/6UvkAxlb3co/Gu3fvVv/yzQogbA2zjmqVy/SxDpOh5XKEiLb5MbSus5pM+krQuPQkZAXfBleTZW6vF5Le9MK6NqFR5WIoGf1wpvDpSJ4dpSttmUZofp16CtNMqxuexpUjDCmdS1BI0Dki4PWdP1De7FIJx4Ly5hFWT7XHl22MoL+xtGGxHuKlBKuICWj5wfmMtizWx02wST8UdcPc3wpQSNgsoMjchcDDCwLqireaWpw+6r7YPDvQ4gLazJk/QTp18VezRzJR59MFLKm5PYvxafYqGfMVvdx1PzTisohELpNu4gkmNnFrryGuY4cw3kZ99BTYNgX1Nq9t7OdsJ5dBG4rYEtfWM+M2FEnM0ii0gaytKby8m4LaJLRfv8PBc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlpjZU9TK0dLbU0zR3B6aDNjMVFTUE5yMnFuQm1rSDR4Vm5sOE5FbXBrbU9O?=
 =?utf-8?B?OUVERDBUMkZvZm9oQ0U1cUczbWZPU1F6WmdkcmhPU2FFaVpSVjR1V0pxODdo?=
 =?utf-8?B?amQvZVZnRjdFb1A4dVhYS1JGckFzWit2a3R1SXNPVmpZbnBJYzFnK0ZYUjRO?=
 =?utf-8?B?UDByZWh5R0pab1lmUjhGeEFTejl5c0hVdGdvR0ozc2tEQXdwdkdxbFArd2Vv?=
 =?utf-8?B?Qk1rdzQrQ0E5aXpKK2ZOZ1MwZy92OVYrREdIanVYWWJaVlRsbk5RVmF3ZGZ4?=
 =?utf-8?B?d0pxaldLajd3YnR6YkxPb0FDTnlKV3R3bHdOcGNUaE5jQ3RZL0U5OFU3eDJ4?=
 =?utf-8?B?VFpUQnlLcU1aRG0zR0UzZWpkUVdtR1lxV3cxTUovdnU1cFBaTGQwTHJuZ1Vk?=
 =?utf-8?B?TVhKU0RBSEZxblJzanRRUUJBRkNQTXZrZkxNSG11ZVRmMkR1dXRuS2dja1Bq?=
 =?utf-8?B?dWZyc1R2R1pqTzRiOS9ucTZoM0hyN0pBR2I5WmE0SzkwMnovbUErY1FndzlZ?=
 =?utf-8?B?aTdWbGhheXhWT3NjcVJXMjVTZlRPckQ5eW52TXdLSXo3clR5VXFJemhqL3ZP?=
 =?utf-8?B?ZE5wb1pCZzh3Lys4QVNxdEZQRXRrdWM2Q2NZa3JMakRGWkRjdHdsQkNYSWhX?=
 =?utf-8?B?UzF6a1ZFQU1VdjlaS2xwdGpGSWZWME11SEd6bnBFMFVQUXVtbHdyV2llSFls?=
 =?utf-8?B?d0tNbCtHbWR0VU0zV2k2MzdjQURNbGQ5LzFlMFZidTdMRGhhYzlDQ0tOZ0hW?=
 =?utf-8?B?ZlM2bGd6dGVzZEtJQzlsWFBaNmR3SjZWd3FNSUpSQ1piVTc5TVNGemU1dzNC?=
 =?utf-8?B?RWVEelZRTXp6ZHNTNWdzMzRyd1RuaitLY1ZUNlRDcVB6UzRHeUowVk1zTStp?=
 =?utf-8?B?a2tzdnRHQkNTbWhEamY1Rk94YnNQZHVjTVF4REJaR1BodVVMRXgra3FsWGUz?=
 =?utf-8?B?dXFvTDBHSzdid0VIUDBNTWFTSmM0WkdjV2J6SFY3UHJOWXJhWHBDZXp6OWN1?=
 =?utf-8?B?L3RVdlJqN1B3RHNtMllvazF0NDN6NVNJMHpnWjR4cHkvOUJiUTBkUjNJV2gz?=
 =?utf-8?B?ek9lTjlMSHhXWXBrZEdEMzJGMEJ4SldPZlVNZVh0VWxWTzJXSUtRQTNvSDNW?=
 =?utf-8?B?dFpJcy8yYU5PR0hYaGJTaDJPUmhXRGNCT2JNOTl2MGVjcHJ0eS9oR0pYV2ho?=
 =?utf-8?B?cEJtUzR2Rnh6THJTcmU0SEtKd1FNbEd1aXBwdVZ3M1N1VFlHMGQ0ZHhmUkJj?=
 =?utf-8?B?akhIV1ZtR296N0NUcTlFT2Z0UzBmSkxvbndTM2gweVBVR3lmRWlZRkVsZDha?=
 =?utf-8?B?M29tZU9xaXExNlhOQVgwaW1McFlSclZvRVJZUmEwcWhEUTc2cEorNTJmQWFj?=
 =?utf-8?B?alVnSDdvejV3UDAxUXgxNXlnZ25CK1U5MmJwZHN3WGFqQndON0VqVjdXOENS?=
 =?utf-8?B?cHR1YmoyQXh1Wi9KaGI2VStRZExpWWtCNk9zMlF0N2J0cnN1QzgwOTJodDk5?=
 =?utf-8?B?Z1p3UVdyVndhbE9PVXNCYzBCdW41K3kyaktQM3hta1NvL0c4d1JaejZFbXly?=
 =?utf-8?B?cFVRQ3ZoNEFHay9XRHNiSlJzTlMvUkIxVUtmQ1JwWllkbWVqcHBvL3c4VTBO?=
 =?utf-8?B?MHlFSlNXK3lnckpLRFBMQVQ4VXdNM2RqS1NtOGp1VlBSbzlVMmgyVDN6K1lj?=
 =?utf-8?B?TDRuRWFEaGFyd2lYcHVabXFvM21pL0hKZGhFSXBvNTJ6Tnd0ZjhFQXlzaFZP?=
 =?utf-8?B?TWErY3IycGV0N0FNWFNCeW40cXlKZFNocW1sZU8zTEY1aCtreU5oNXpBWDlI?=
 =?utf-8?B?MHRuZUlOS3FNWjdSaTVXSzk0RmxZVWErVXhUZjFCVkJyTkhlaXV1bElxWnc5?=
 =?utf-8?B?S1BNRXJveG00bnZOR1Nud1BVYmpDYm15ZzIyZEY2Z3N0UFErdkFsVkprcU05?=
 =?utf-8?B?STd6TnhaeVJzTmZNNStnT2ZYZUxrOGs3SmlSL1FwZE9FRkVCL1phVGMwTlJK?=
 =?utf-8?B?ZGRyR0J0RU9KaVcrZ3RWa1l6RmxvSkZ6d2FmYThiMlVGNEJtOUo3b2ZyT1JP?=
 =?utf-8?B?UXRMOUFzSHByQUwrL0ZRWTJjOEJOc1dnZnplOEdDSzFUL3dRbEY3Z0VMczhy?=
 =?utf-8?B?WmRqN2ZFZ1V4bnpaOU92UStwWUhHRWtuMmRBSGQ3Snh5WHVQQk1EVkdSZ1px?=
 =?utf-8?B?cjVsS2NpVVYyQXN4SU03L0FPTHZIWnR5SkVxbVhlaUpFNE5IQVBYVUV5T3ln?=
 =?utf-8?B?UXVIT0N4MlVrN0pqdGFIMXFzdjY5NkRrYTg1bEw0dVZLYWpuSlZsa0NTYXpO?=
 =?utf-8?B?d2ZHSGxSMU1nY25lSVNVZVhYcEdTam1vV1NSazdHTmg0MWhFMlQrTVJndlpt?=
 =?utf-8?Q?CxNemdI8+EZ+GZF0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6D70740A8BA7A439AE0D953F5D50173@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VapbEaeuiKWVxkezd0a+IzcRlDN6eLX4J9cI+d25b3rkkFoSrkX69RMMkllmiq1FPNYelYRSft91ICPSGVKgEiLdv1+VK98EmVoL12xrrUkWwlPRDQOLvT8OR3oXbjVzqRzj+r8Jvsh1qlR2Mzs+OmJrrFqIKmzodyl8y2ZBUSf7OTy3Xzp3Mx71tse2vYSAtkMI4zyaDhE1RdbWdI+n6P0mdtu4HbiHGOPN+vdeQWf3Vgfj80EJDQgLk3HdPObBY6EUx27w9ZPmTnqu8hVoIdFhRCaTc7NmsT2KdI2MIU2gfTPowaD+3TzfrrtOStOqbAFS5SD3tZNUte8iBQgI2A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c30c5b8-1d2a-4b36-cc79-08dea62df6fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 20:29:08.0522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DbGJf8vOwGhDtwPuaG6ZzotiZHoOmBLmz/PTY649Fn0YDac5QLTIA43PX/JXw3OYGiHZiGV7b0kY+O4mnOAgZL2P4iYphD0M8c20ziWgnko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6777
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

T24gVHVlLCAyMDI2LTA0LTI4IGF0IDE2OjI3ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiBUaGUgcGFyYW1ldGVyIG5hbWUgd2FzIGNoYW5nZWQgYnkgdGhlIGNvbW1pdCAyMjQzN2Yz
MGQyZjAgKCJkcm0veGU6DQo+IFN0YXJ0IHVzaW5nIGdndHQtPnN0YXJ0IGluIHByZXBhcmF0aW9u
IG9mIGJhbGxvb24gcmVtb3ZhbCIpLCBidXQgd2UNCj4gbWlzc2VkIHRoZW4gdG8gdXBkYXRlIHRo
ZSBmdW5jdGlvbiBwcm90b3R5cGUuDQo+IA0KDQpJbmNsdWRlIHRoZSBGaXhlczo/DQoNCk90aGVy
d2lzZSB0aGUgY2hhbmdlIGxvb2tzIGdvb2QgSSBhZ3JlZToNClJldmlld2VkLWJ5OiBTdHVhcnQg
U3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IE1p
Y2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiAtLS0NCj4gQ2M6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxkZXZAbGFua2hvcnN0LnNlPg0KPiAtLS0NCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZ2d0dC5oIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9nZ3R0LmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ2d0dC5oDQo+IGluZGV4
IGM4NjRjYzk3NWE2OS4uZjBhYzdlYzA1MDJhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ2d0dC5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9nZ3R0LmgNCj4g
QEAgLTE1LDcgKzE1LDcgQEAgc3RydWN0IGRybV9leGVjOw0KPiDCoA0KPiDCoHN0cnVjdCB4ZV9n
Z3R0ICp4ZV9nZ3R0X2FsbG9jKHN0cnVjdCB4ZV90aWxlICp0aWxlKTsNCj4gwqBpbnQgeGVfZ2d0
dF9pbml0X2Vhcmx5KHN0cnVjdCB4ZV9nZ3R0ICpnZ3R0KTsNCj4gLWludCB4ZV9nZ3R0X2luaXRf
a3VuaXQoc3RydWN0IHhlX2dndHQgKmdndHQsIHUzMiByZXNlcnZlZCwgdTMyDQo+IHNpemUpOw0K
PiAraW50IHhlX2dndHRfaW5pdF9rdW5pdChzdHJ1Y3QgeGVfZ2d0dCAqZ2d0dCwgdTMyIHN0YXJ0
LCB1MzIgc2l6ZSk7DQo+IMKgaW50IHhlX2dndHRfaW5pdChzdHJ1Y3QgeGVfZ2d0dCAqZ2d0dCk7
DQo+IMKgDQo+IMKgdm9pZCB4ZV9nZ3R0X3NoaWZ0X25vZGVzKHN0cnVjdCB4ZV9nZ3R0ICpnZ3R0
LCB1NjQgbmV3X2Jhc2UpOw0KDQo=
