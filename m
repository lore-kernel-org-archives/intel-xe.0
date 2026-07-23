Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1755C531C7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 08:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFD010E544;
	Thu, 23 Jul 2026 08:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXSt5FUq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BCB10E544;
 Thu, 23 Jul 2026 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784794872; x=1816330872;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ec6THahtBKuxggPt6VLFkbgzBiFMUyZCc47IYGaE8gQ=;
 b=IXSt5FUqOe/UdzvI9P0MmQ65j0mZ9f5fTsi2zgyJUuCaVZy2huhCBau5
 ewyclM2tyaa71Za7p/wGa5dBn0ynfpwEJHg7akYKO3wQIuIaHi4o5S0+d
 3L6HkWJF+N8COJf6WjMpOwXS4RFEHt9BuvSJDdXJV/tH2CLjaCp2AxGUn
 8/oQxSl+pvCbW7+kxz6IJHyabKyr9dj0QzvnewcB7xlMPphJWUNUNUWjt
 dqaYZvQkw75DSoraRLm1QPG6sCe1iW7y6paHQwZypOr47sORuwB+W95FP
 WQwmId688EkbyC7tjE2du9LGsigTtB8OFetiVwjlsLL4HcmFrsOSwk50X A==;
X-CSE-ConnectionGUID: UYNEembhRCOwNCMMjU4/VA==
X-CSE-MsgGUID: 2nDljFpWSAya9hVRNDFKdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96815245"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96815245"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:21:11 -0700
X-CSE-ConnectionGUID: Yp30LJVERn2Ppknv03Z2mQ==
X-CSE-MsgGUID: 1KClNLNsSFKwxMRmBedEnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="257800706"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:21:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 01:21:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 01:21:10 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 01:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDv6LF0LSVVeg8P12EZ5lTh1GfU5qWjk1j0ZVZWzUKbLpWWJmiY5Lg4JpIOJYAF78QvdnG1nrJtD9lzjilOi4m2yQoGijK47d0e8UFs9dc42sqF0gjDS7M23QYdyPhNOYyZXfE635pCBJmmit5XhcmSFbtOLQzfW2s0tiHKALiHVD1SmuGyFSDEUqdKOU+3taEulaG/lywnWpcyVhCetAgnGERxTFlPS3mxSasIEmn8IRYhkAVg9lyxaNTO7ciUCQdlx3FnEPSnlhRRjhcok2ME4Ep9wGT1b62ZWPztM3ljbyaLfhtTAqbu5/yShGDO9u48d/6dDMK8bN/36vTw8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ec6THahtBKuxggPt6VLFkbgzBiFMUyZCc47IYGaE8gQ=;
 b=RMbRHB3RwsXOnwRW5pw6jlj5zcqz1NBrP+g81WOM/jPUA8coUEPgQXLKAy0DWA/ikG2FJfUFv829reQBNFCrlv62I0e1mUa0zJE+udgC8lo6TeaqA0ZNX3FOPjfBRMERv7dI+sqYIHdusnYKBEFz+g9ySuNAai6/KIpNJe0mKQhJoe7yHGRU1wxcI8JfTNOTSECwT4Agq4LLcDFKV8S/rIl039uXnL9AzWlhJEY9AiVBRO3KU+XOoaf/q6ByWHYlHm+sYIJcm/sP8IoBqlzOWYiq54ot6raNEqXDZzNOvxv9EDVQuFOdevdlT5g0irXRVHZ2BLMGnDIyBBLUf8HKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH8PR11MB6855.namprd11.prod.outlook.com (2603:10b6:510:22c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Thu, 23 Jul
 2026 08:21:08 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 08:21:07 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/i915/fbc: No surface size restrictions from
 LNL onwards
Thread-Topic: [PATCH v2 3/3] drm/i915/fbc: No surface size restrictions from
 LNL onwards
Thread-Index: AQHdGd2TaEjH7BnAW0+HeRZYQWpn9bZ6xK8A
Date: Thu, 23 Jul 2026 08:21:07 +0000
Message-ID: <cc0020703d073aaf8dbaf29f09b60f3e561aeda1.camel@intel.com>
References: <20260722132448.318112-1-vinod.govindapillai@intel.com>
 <20260722132448.318112-3-vinod.govindapillai@intel.com>
In-Reply-To: <20260722132448.318112-3-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH8PR11MB6855:EE_
x-ms-office365-filtering-correlation-id: d7f281da-0235-4310-b031-08dee89358a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10070799003|38070700021|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: 2hTtx6dY1sz5Ki9wQLeqO1VBTs9+Ufb7mtAZ9bGwDKvfZ34m2oziVfKD+WuTYxHvTa1QBxygvCZ3c0SEDKAsu/aliMpEdTAMSvaQrwioEjndunO/aRLQEUXwd0Qhbr/1IQxC7FcA2L/t7nj1G2zy62btFGvKS3Q3XT5rrB1cvVyrr+lqtD2Ax2kYnx/9A02Y69OpoBmRzga4Ejcg/lhrsLYtcpRZ4xkab+XUZgO5Amyd2yhIDAIg4jEv14GaDpo1nv/Ns/wRvz/EeJ2QA1bWTFil6ZVQvtVYwbof8LGbdnym0CUWczI2jEgaNP7i7WE4xWQieafgPk5GgzR4zFfRusqMkIYp/jbFJTQiM+BtBWAne8Lbj4icEkfkMprEejugI/Ysf0//SHOIcpW1FdlmvAfuV6aXnK4J0KhD4MwunKuWOjB7j43sB3koexHBQQex7NClAFRZL/m1Uhm+pQje9DBHBAnTu3UC57ijoNpum/IgmRm4adtPPIbCBY7gdTvbSA6OMoH0dHUiduZNzPmVGmHuiyamyHLHO2X1nGyfH8PdmbqkwPUH/OJwFa62xdxR6I6YT9ENkAoGf89P8KdxDgjMus4zmrExIG5sLWH6ab7hvuP9Mx6Fi61lmY9Tka8lYNSu6rAUCg0JaRbV65eS3PsBjewB1U67vBaiKIQ/6YhMt+lFUKbuU1GRmpLXOTDdeg1WRBPl1RT6xlOqQHSh7OazRGJyr2lCocysRaeeVws=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(38070700021)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OURwVHNPSFAybUpuYnREQTUybE5QNDc0d3JNUkc2aGwvU015dEtqNWIzUlp4?=
 =?utf-8?B?dUxadGlEL1grK2dYam5mSy92VHRvU2FxUHVhVWtmVHNZczZpYTZwNGRyTGsw?=
 =?utf-8?B?bitjUGgyNlBlMzAyc2R2S3J4U0RwRS8wemRybE5nNC9MV1NmSWhjZU9HaEVr?=
 =?utf-8?B?TXoySGFHZXA5WkovU0FyWkcwVVVueGx3L0hzWkNkOE5keDk4aU9kNmVKTllr?=
 =?utf-8?B?bDRUd2dhbXlFZG9mbmZ1cFZ0Z1FRczJ2M082QkJGSGRYSFdzeWYrdWlYSVR2?=
 =?utf-8?B?ZHpUcUtUaDJrcFdvUytMQjYyNlJhMTZTOWV1SytGM3QvTVkzanJDdlRxZzBR?=
 =?utf-8?B?UzFOSlBlaUtHUGdGT3gzK09uZjNhQkdvNmdrbW9zbXRvVC9aR1JCRjEzNkdV?=
 =?utf-8?B?M1NSdGRwUm01V2xINXlXZXJQOGNZeHdzOWhwNDhMMGJxRElJUzNZN0ZoNUlp?=
 =?utf-8?B?RGlWU0tTejNsUXFVektkRytVM2hDNHM5d3FmaTVxZnVMUmhzTUFTK0JsZzJS?=
 =?utf-8?B?ODhIbWNJOUVVOXFIY1oxUHIzZ3ZJTU9EdTg5WmtUNFoyMVZ1VktLTnZVell2?=
 =?utf-8?B?ZVFYVTloOE5MdVoyaHdxWHJSV0lXaFFGZC91WHIvbTdUT0xtR0JveS9GSDFi?=
 =?utf-8?B?SzlHMVdIc0V6aFk4cCtBTWhJL3p0am11Z1NtYi94Z25jaWhSek5iQ01BSnZH?=
 =?utf-8?B?Q1dMM1JNVDk0S0lCMCtqTS9tZ3E1UzY1K2U2Z2JOOUxHTE1ONWtxQ0lBRlI4?=
 =?utf-8?B?YU1ub1NGNzI2SzI1YWtBeXRWZFlnNndUNjF4UURUWGVvVmlkd0RQdnNMUllS?=
 =?utf-8?B?TzVBRVdWOURpZXdFdnlyUG5QMS9zaXo4S0wvdkIraHZNOGdkQVZ6QXRpVWc0?=
 =?utf-8?B?TmRHNm9HbjJDUUwxVmlIMEVWUmxsclVza3dWYjAzQTZTRldpa1ZuNEVuaHhY?=
 =?utf-8?B?UmIzNTg3YkV2WE5MOGFNVVpnaU95WkNqUmJEWHliSkp4NFF2d3RCODV4YWUw?=
 =?utf-8?B?MFFpYU41TzZ1aGpMZVgyT3p0VDB6TWNuVTUzak1ZYjc5ZkNCd1U4d0tlbkxt?=
 =?utf-8?B?Y3dJMUcreVVGdzJtNlFoOFlYV09DRHlYWmlnL1lmVVJmUkozcVh2UUlPRnRI?=
 =?utf-8?B?VWR3d1BLNThvdEE1U2wwMjhyckRpR3dCMjZleFYzZVJLVC9SWlVSRGIwZHlJ?=
 =?utf-8?B?TzVSZGZpSm1nMm5BeGE0VnZ5Q0hUZGFxMUF2VHpoRUx3a05LTEt5RytPNFRE?=
 =?utf-8?B?bDYrWVU2UmFjejByRmZySU40bU5XQ01JQ2dDTi81cE9kblo1aTRQUzJKa2Ft?=
 =?utf-8?B?ZVUzRThVOHZkYTl0VGMvdCtpcWxmTDg5UmhZVDlXQmlRRnRIOEVvd1l1YWgz?=
 =?utf-8?B?RmE4Y0owYzd6c2kzM0ZydytkalJDbVI4ejFMRnppOUh3VmNMVVAvcjlpN2lX?=
 =?utf-8?B?Qlg0UUJhVGhwend0cDk2akNLTXhzcVdSUWozUG9rU0N0VG84c1pySkttOTRF?=
 =?utf-8?B?SThtWndNaDhqTmIrVGJhc1dsZzBkNm9rQmY5c0I0WmJzclpaVytLQjU3enl0?=
 =?utf-8?B?dHQyejY0N09mYm43TEtnQnhUYTl6TU5FK2tPUG45L3VkWSt3Skhlam5HOWc0?=
 =?utf-8?B?VjViNm1DOFRxV1VmUjNWMlFLdXZVU1kzZmFmaVBuUXRyWTExTjlHRzZpSmxW?=
 =?utf-8?B?MHpWd2VUazFRSDNPaDRmbUZNL3A1Q3dRaVdJSDBhSUk0TDFGejFEdUFPT2NK?=
 =?utf-8?B?TGdidSt2Q0FQZ2QzNlpVT3BpaEp1Z0hNWTdiR29qWGdUQXlhWjA5TlVmMWU0?=
 =?utf-8?B?OElqYWoxWjFodkkxcDRBK3pXcG5tS01MMU9JaEdyVityTi95YkVObHVaOEFX?=
 =?utf-8?B?dDdERDN3Ym5KT0EzcFFDQStVcDhmb0JSSzZ3QVVmOW5GUndBUTNTVGRWNmRR?=
 =?utf-8?B?S0dQNnNhTFNNQTZROWlqTG9xK1gvcFIxb2FvcmkybHkwUFZNYmhxYzcreTZq?=
 =?utf-8?B?eEdJK1JaQU8yNWF0ck1idjhMcVZpMTduelhwaGxsR2FaZEpxSVVZUHJhbFky?=
 =?utf-8?B?dVc1bkl3ZGRHVW5ySnlVUHRNTnI0ZFVzeHR6NVBwQ01qbHFNL3FldkIwNXNV?=
 =?utf-8?B?cnJBbUFvK3lQSW1RelIrcDRId3hGOGtZUFZET1pXczBCMWtHVVM0by8zdjhI?=
 =?utf-8?B?VzdkWkhHNnY3NzMyWXVvTTVHUElhUnRDSG1TeHR0WG9WV0dKaVFrMElaa3Jq?=
 =?utf-8?B?U1EzUkJrTERnV3d5d1ZDeEJSdUxVczI2UXJPZU1jQWhUY0twcC9jTlBSdDI1?=
 =?utf-8?B?RDBSR2JiNHNPMXNmNVFZNFVnbFBTTmo2T0xjNzc2NGxJNE10dytvOE5hNlVR?=
 =?utf-8?Q?ocxD7ex/ThCCrb7QMql5SyAqeitXIJHVrxSyQn8FtQKi4?=
x-ms-exchange-antispam-messagedata-1: paYFBMssCTxEezgUKgP/dPa2uq6SlwJLfBU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C4773304E9FFE40B3553D5365501B6F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NV8Za+TKLrQmibB1xUqryfkt0IkMtt5PWOP0szvmrOMBUtw/U3kROfeuS1TH5zFUjr7X72YRPmY1w3lpvu2Po1PxPrWesdipmYyx36xsIRQdQbk9lEcFcbJLyuN40EbMmWXWbl2LdMImVCUiCzKRwhgcc6BhJkg6kdmU/fsgADLwB+OLT9u7MEKYfanYenmKip7TgyFJXMVt6n3zEuiut7OKrdoS8uP3acArNJRhVC5o0keASZvKwbH1LmjeDzsiCwPhe3Guj7FXTH5Ff5z027NmVA6/6DN3eVdDcGcZQdPNfyFp5qU1tt11krb9axgmiagemgH8bF5f9k2v61NogQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f281da-0235-4310-b031-08dee89358a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 08:21:07.7921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gCxZcelVhuQhTzLb/wKNJ/wd1zyOD66XuD/jJSU8nzsC/it/QiiEF2YXNDjerUkJ9YaTyHa96f0tCa4so2fAC6GpWycwBjB9poOx5NDb6vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6855
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

T24gV2VkLCAyMDI2LTA3LTIyIGF0IDE2OjI0ICswMzAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBGcm9tIHhlMl9scGQrIHBsYXRmb3JtcywgZW5hYmxpbmcgRkJDIGRvIG5vdCBkZXBl
bmQgb24gdGhlDQo+IHN1cmZhY2Ugc2l6ZS4gU28gcmVtb3ZlIHRoZSBjaGVjay4NCj4gDQo+IHYy
OiBjaGFuZ2VzIHRvIHBhdGNoIGRlc2NyaXB0aW9uDQo+IA0KPiBCc3BlYzogNjk1NjANCj4gU2ln
bmVkLW9mZi1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRl
bC5jb20+DQoNClJldmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGlu
dGVsLmNvbT4NCg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2ZiYy5jIHwgMyArKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMNCj4gaW5kZXggMjBm
MDJlZjkzODdhLi5kZjg0NDY0NTcyNDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9mYmMuYw0KPiBAQCAtMTMwNiw2ICsxMzA2LDkgQEAgc3RhdGljIGJvb2wgaW50
ZWxfZmJjX3N1cmZhY2Vfc2l6ZV9vayhjb25zdA0KPiBzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUg
KnBsYW5lX3N0YXQNCj4gwqAJc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPQ0KPiB0b19p
bnRlbF9kaXNwbGF5KHBsYW5lX3N0YXRlKTsNCj4gwqAJdW5zaWduZWQgaW50IGVmZmVjdGl2ZV93
LCBlZmZlY3RpdmVfaCwgbWF4X3csIG1heF9oOw0KPiDCoA0KPiArCWlmIChESVNQTEFZX1ZFUihk
aXNwbGF5KSA+PSAyMCkNCj4gKwkJcmV0dXJuIHRydWU7DQo+ICsNCj4gwqAJaW50ZWxfZmJjX21h
eF9zdXJmYWNlX3NpemUoZGlzcGxheSwgJm1heF93LCAmbWF4X2gpOw0KPiDCoA0KPiDCoAllZmZl
Y3RpdmVfdyA9IHBsYW5lX3N0YXRlLT52aWV3LmNvbG9yX3BsYW5lWzBdLnggKw0KDQo=
