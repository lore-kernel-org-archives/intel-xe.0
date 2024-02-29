Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A69C48BF6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 15:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B9710E4F1;
	Thu, 29 Feb 2024 15:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmw0gMTv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E7D10E4F1
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 15:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709222120; x=1740758120;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=VjWWWBiDEWa54ihT/Gz13x5TDyyXXZ4Zrw0qnqU9mfs=;
 b=jmw0gMTvtZmma1LlGy/j3LGeX9RHrnLOwWHG+wfFWdeQi5NoC9l987Jf
 3iPPWDv3dKnyD4lvp929pbjFB3FSK4ISCt29gKPaUayOwiNk8UDHzgfSp
 Pri23/CJtQlrOXZ9+pv15jbT2oVlA+CbVsPTgXUL7Y4JHjZRwKrfjY3vy
 DzDbZSpYGflMQUzrwJseP24cePJN4qAdNchYl6gDmSCHNIJn7cDkEa+Vn
 CyEv1YDh6X2s3qpgGdBX3z/+UBCYRFvfmqASbZlwuGXvegsdO8SCS042Z
 m8X5raOzNN8MrynCWyaOXebn5TTWBrjfFvD/2PJx/0tXgNStXyWr9xopR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14268228"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14268228"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 07:53:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7742735"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 07:52:56 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 07:52:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 07:52:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 07:52:54 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 07:52:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6HXi5NICrw14oSS8hzjLW0VmoiKJsw6CUJXXbeKVj3SQimvoLdU7daDQrrqT81nmdX9z66MgG7hwWvEhUq2oFush+cmjObmHVwHL/zWIAjiN72wYg16e8a4xkLDBzXaCAaqdJIrPMNqHSuvI5u8Iy6JpL8+ykXx2hBEgwpZxr+sX5hbJWNaZV0QLinP+m1edDjWb2toNvR4UwUoHs13OFdn9Ht1kf6iK7FtmUX6RsTHHvnAQjtXtiyI4fgezWggqfYqvbWc76Tf5jfeGGOepGdel61nU6RY/na+TIvs7o5TLZvvGO7Atckg8/NNQZ6Oz/e+ix2hi9ngjsMzLyy44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjWWWBiDEWa54ihT/Gz13x5TDyyXXZ4Zrw0qnqU9mfs=;
 b=L2M2u/2Y6wPjM2/6P/AsMVnO88SMVOiQ20X2cVCcdp/uGgQErfWRmNZiWlHt7QCsiYBAKCQ3mflWnCz0TnMQdP6LOgVDR0MKtZ67E3T3CkIxyxTP8XEvxOj5I9IRKMXFpRc9ZHcZ0KO8tAo2uUZTjbmecbyKa5YqBxFvl1enjvY0JLDJGR6/9+GRQ4DQ8PCvAhqkzjOTCM3DDR7sPETLko9gJwyz4vSEj0yVYJvCr/z8NlwINBEhCQ4xYq7XIUP4e2+6rlOawwjTyTXNypLa9sIQD3uuxSC6eZZgNvFkcp6QobDNN1LhTsVFR9SIJkZ1oYYvafNJ9edzDvGb2ZcPoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA2PR11MB4858.namprd11.prod.outlook.com (2603:10b6:806:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12; Thu, 29 Feb
 2024 15:52:51 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%3]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 15:52:51 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v3 1/3] `drm/xe: Move lrc snapshot capturing to xe_lrc.c
Thread-Topic: [PATCH v3 1/3] `drm/xe: Move lrc snapshot capturing to xe_lrc.c
Thread-Index: AQHaaX62s54pVAGw80WLluEbBDQxnrEhe7OA
Date: Thu, 29 Feb 2024 15:52:51 +0000
Message-ID: <77d9b03571ef089a68ed0ff9c4c0d271ad77f901.camel@intel.com>
References: <20240227131248.92910-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240227131248.92910-1-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA2PR11MB4858:EE_
x-ms-office365-filtering-correlation-id: 5e0fb27a-f680-4fe7-4396-08dc393e7c60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aiqRRpz8Rs7ZuzBT7UCnvH1yhiQhRRjV/PByn/xkYyz2dTtm0wFlzGJ68BNg/QG2+V+SCmYm6XPc9carRaEe83ru8WnTAuDN4pDc14is2dTzfCskBIrRPO6ruuPAFeyIjnBpmit4TeqmRanpuVwX+B+6NiZUrtjgyWXMcmOX/m6+V4Ipe/9hz9ss8yga/XH+cKcA09cneYC4wNWfe+HY3/hKWO+Nax1i4mjH5+z8GeuZsvmQ1BkwcrBdCo8P6Z7NlDu2h9CeFW9HpYGmjWFiilyMUi0W/6dRukUH3JtdnZwHrFU+ppcgxKYBmMqRmdTvSzsSV+2cFkL+KkuT0Hceko1C5Uqo1t1wsljHQ61kYlJvovuG88Glt8Tm2/ah9aDZptxo6i8xNSNv7ag7ifOJgCVEWq3gX4nrT47Y+QVUKAFAeQOkoDr8C5svomJpw7ugSd2tflj5y73RaRaRo+JwFdZI9ITsi4zkrl+LHcCNhT7QrfFHDvdPZ7j74FfH0M0ERsdCJmRgJww/qsGcoL3in3mioCYGN/V0Wi+pjhFLwAbL8ydr3V3y5dLC3DM8NygUlISkLExAPC9YeK2j1f+xIvewfTYnT+WbcVc4FBavLwzSSDuBudorYq26CAeRiikT1vkoDT9zmY1W4xnf3XwzYyFGOljP1B5/LVJweRg5fbvCgyn6b6+w9krNokGco2TRu2UGqNMvuu2+5IMlOwVnmC2GVbyyh8CFk+VpUKL80bs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWJ1YjRZZUluSVZTVkxrblA1eDZpZlJmakRDZzdQVEpjS0VZOU5PbTZjOHZ3?=
 =?utf-8?B?WnA2Qno4Q1ZNbXhYRnF1UTZLeEpxbnRkR1hTZFpqL3BEV0FxaHNXbm9OZjhz?=
 =?utf-8?B?NG81empuNkJWWnA3SlRyK3dlazFxbTR3WEZrR2VJZEQxc3U4dmdZYUJxUk9V?=
 =?utf-8?B?N1RwL2ZMd241bEJaTnRSc003bzhFa3AyUENzcHpyMkZESndoaFhqZWpkZzMr?=
 =?utf-8?B?MG1ReEd4RG1ZeUVnWG5KSGpNVjB2RjVkN0dvL3JiYlRyeTZDTGxCSUoxdGpm?=
 =?utf-8?B?c05wN096UGc1RkRIZFlpbVByL083V2Vodktaa0lCNUlDWGZncWNFK0ZRSGFB?=
 =?utf-8?B?Ym1oWEtkYnB0dnU4RVYxUFVWOWtzT1d2SFJoUGd3Q0VhR3BQRis5dVZmSGE1?=
 =?utf-8?B?L2RseWNscEFndHZ1STRWUUU1SkIwSzFucEQrOHpSeEtmRS8yTmxJSkxJY1Ex?=
 =?utf-8?B?QUVLM3hiNjE1MWlGcUxXd0FYUE41bTdxRlZWR3lBMTNFRkx3TmYzRWc3TTk3?=
 =?utf-8?B?K0pES0NIMDdoeENPL0RXYnBaSGVLYVlJQTc5eGhuVTNPZ3JSZ3kreUJ5T2dn?=
 =?utf-8?B?RUcvTTF3bitwWDZ1MnhNV3FtbE1HNm5COEZRckNYMDE0RThJc2pzTFFVcWFG?=
 =?utf-8?B?d0I4ZmN3ZjBaRllaWXBjOXRZTGU3VDhiZWt2V3AxMzJTQzhrb1FhTWdNek00?=
 =?utf-8?B?eHY0bEpEZDhGbTB3WnV0RWxiL3NkM2JoNXliV01Bbjh6ZHkzZ1g5SHlqRmdL?=
 =?utf-8?B?VS9lME0rR0JscWdxWEgrK0F0dWpPSVRmRWRoMThMQ21TdytGQ3NwSXZpYjZ4?=
 =?utf-8?B?SVJ2c3VZYTk2aGlpNklCVEh2c1dKSjVwQmhFenh4bTAyN0xzcnpKeEUvRFdL?=
 =?utf-8?B?U2Y0b2hkR3BOeVVxQXFsNkdFR3NiTjJLNWdhRFc3VTVlSmZ2NkNDalYxdjZM?=
 =?utf-8?B?TW4yUEl4eVFsa3BnOHI2dlNkYkJ3SjNSRmlWY0NQa1RTVS9FbjhXZjZacCt3?=
 =?utf-8?B?aGljOHQvTGxKWnIrT2t1Sm5KSk1tMkFCOVorV2hnaE1KZVp1RVZOZU1QcVFR?=
 =?utf-8?B?UUR0NVFiVE96eW0xbHE1NkVGc3V0T0JIekNFZmV5ZzIxeGQ2c2sxbGtaSTJm?=
 =?utf-8?B?R285UktFYU5Nd1FJTk5jR2t4UXNwcXU0RU1GdU9pcCtmam84RGVjaldJc1E2?=
 =?utf-8?B?UU5UcW5qUUVhWTJUZ254TUlzWmdYWWMrMEpDclloakhiY1hPWnZJYldWMTha?=
 =?utf-8?B?UDAyMEdZSEQ4SXFWeEhpM2RKQXBtaGxMOFBLakFxaTd0YURoVmVuRFJ6aTBo?=
 =?utf-8?B?QzhQVzdUTFI4MWJSWndTZGdJSkFNZHhQR2F2eGRkVHdDNHlxTVJGMHFnVTRP?=
 =?utf-8?B?UzAyWTRjYUQwWHVpUFFZc05tMENmRVIvc1VZcDBxSk9EOWVna0JSRjhhVkZk?=
 =?utf-8?B?eWo0cHExQllyTnNDcGNuandQMVJrV3ZKSU5CYTJjTkxpTW5PS2pnQWZJbkt4?=
 =?utf-8?B?eXhyTDA2RnlRS1NzWmM4RGFJRnVuUFNhcWtEdHFCL0FPVjB1SWtFMW9NcmNG?=
 =?utf-8?B?cy9ZUmVxYnRDUEUrb2grOUxUNUNuQTVxcFo1cGNUUGZIMlJKalYydFdRVW1v?=
 =?utf-8?B?dkVFRnU2R25vMzQwZWJ2c1VnTTlwWjVSSEViMWlDSmhuMHlrZUJic0RJR29N?=
 =?utf-8?B?YUdzZHZua1lPTzBqMzRyYnVleHFhdmNSeGRSdHRNZk1NM0dXOCtNbm02U0hI?=
 =?utf-8?B?Q25yV01ETjVQc2dSVFVRUUtyQ1NrTmdUNWVYK3p3N1FEL3J1VW5hcUtCVTI0?=
 =?utf-8?B?U3ZLU0xtV01sWWJ5VThBOVU2NDB4WjNQbzNqQ01HU1NQb3dCS3V6bDFEU1Ro?=
 =?utf-8?B?OEh2T3pPejUzVHd2UFlwbU9WYW1hb0RTY0VyVjBVdVc1WHIvV2NvdFd4RlZm?=
 =?utf-8?B?ZUZTWGFLektZQVdiMGgzUW5ucjF2eGk2cnNEQm5MaUFNZHJtWCtMbDFvalEr?=
 =?utf-8?B?eHdrakx2SEZJODVkTjJhZkhUN1JTWVAzMjVwTkFtSlV5ZWJVd3lVY3MweS9X?=
 =?utf-8?B?VzY4dlB3T0V6ZlZyQUVxbEU2b3B4VHp1ZE9xNzJWMWNOOFdwYjN2MTZtWnRQ?=
 =?utf-8?B?Q1U5QysvV1ZsTlNIOWpYTmZJS0plSTlYWWhndFMwblpNaThzRm1IaU5ZRkdp?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <419C883B8298934382733E4486ECCD5C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0fb27a-f680-4fe7-4396-08dc393e7c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 15:52:51.6656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mtzdW/aB3KGgENIDUbEArTjrc7fh1gL/JjxGNg0+MuP9AIZcdQvt5y+2LT8co/e8jPdGtdbzPX1m1nmHpyhUjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4858
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

cGxlYXNlIGp1c3QgcmVtZW1iZXIgdG8gcmVtb3ZlIHRoZSAnYCcgYmVmb3JlIHB1c2hpbmcuDQoN
Ck9uIFR1ZSwgMjAyNC0wMi0yNyBhdCAxNDoxMiArMDEwMCwgTWFhcnRlbiBMYW5raG9yc3Qgd3Jv
dGU6DQo+IFRoaXMgYWxsb3dzIHRoZSBkdW1waW5nIG9mIEhXU1AgYW5kIEhXIENvbnRleHQgd2l0
aG91dCBleHBvcnRpbmcgbW9yZQ0KPiBmdW5jdGlvbnMuDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHYx
Og0KPiAtIEdGUF9LRVJORUwgLT4gR0ZQX05PV0FJVC4gKFNvdXphKQ0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4NCj4gUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50
ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgICAg
ICAgfCAzMyArKysrKystLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19z
dWJtaXRfdHlwZXMuaCB8IDEzICstLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMu
YyAgICAgICAgICAgICAgfCA0NSArKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9scmMuaCAgICAgICAgICAgICAgfCAgNCArKysNCj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9scmNfdHlwZXMuaCAgICAgICAgfCAgMiArKw0KPiAgNSBmaWxlcyBjaGFuZ2Vk
LCA2MyBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19zdWJtaXQuYw0KPiBpbmRleCBmZjc3YmM4ZGExYjIuLjczNDg2ODllYzVhZSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IEBAIC0xODE0LDIxICsxODE0LDE0IEBA
IHhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90X2NhcHR1cmUoc3RydWN0IHhlX3NjaGVkX2pvYiAq
am9iKQ0KPiAgCXNuYXBzaG90LT5zY2hlZF9wcm9wcy5wcmVlbXB0X3RpbWVvdXRfdXMgPQ0KPiAg
CQlxLT5zY2hlZF9wcm9wcy5wcmVlbXB0X3RpbWVvdXRfdXM7DQo+ICANCj4gLQlzbmFwc2hvdC0+
bHJjID0ga21hbGxvY19hcnJheShxLT53aWR0aCwgc2l6ZW9mKHN0cnVjdCBscmNfc25hcHNob3Qp
LA0KPiArCXNuYXBzaG90LT5scmMgPSBrbWFsbG9jX2FycmF5KHEtPndpZHRoLCBzaXplb2Yoc3Ry
dWN0IHhlX2xyY19zbmFwc2hvdCAqKSwNCj4gIAkJCQkgICAgICBHRlBfQVRPTUlDKTsNCj4gIA0K
PiAgCWlmIChzbmFwc2hvdC0+bHJjKSB7DQo+ICAJCWZvciAoaSA9IDA7IGkgPCBxLT53aWR0aDsg
KytpKSB7DQo+ICAJCQlzdHJ1Y3QgeGVfbHJjICpscmMgPSBxLT5scmMgKyBpOw0KPiAgDQo+IC0J
CQlzbmFwc2hvdC0+bHJjW2ldLmNvbnRleHRfZGVzYyA9DQo+IC0JCQkJbG93ZXJfMzJfYml0cyh4
ZV9scmNfZ2d0dF9hZGRyKGxyYykpOw0KPiAtCQkJc25hcHNob3QtPmxyY1tpXS5oZWFkID0geGVf
bHJjX3JpbmdfaGVhZChscmMpOw0KPiAtCQkJc25hcHNob3QtPmxyY1tpXS50YWlsLmludGVybmFs
ID0gbHJjLT5yaW5nLnRhaWw7DQo+IC0JCQlzbmFwc2hvdC0+bHJjW2ldLnRhaWwubWVtb3J5ID0N
Cj4gLQkJCQl4ZV9scmNfcmVhZF9jdHhfcmVnKGxyYywgQ1RYX1JJTkdfVEFJTCk7DQo+IC0JCQlz
bmFwc2hvdC0+bHJjW2ldLnN0YXJ0X3NlcW5vID0geGVfbHJjX3N0YXJ0X3NlcW5vKGxyYyk7DQo+
IC0JCQlzbmFwc2hvdC0+bHJjW2ldLnNlcW5vID0geGVfbHJjX3NlcW5vKGxyYyk7DQo+ICsJCQlz
bmFwc2hvdC0+bHJjW2ldID0geGVfbHJjX3NuYXBzaG90X2NhcHR1cmUobHJjKTsNCj4gIAkJfQ0K
PiAgCX0NCj4gIA0KPiBAQCAtMTg5NCwxOCArMTg4Nyw5IEBAIHhlX2d1Y19leGVjX3F1ZXVlX3Nu
YXBzaG90X3ByaW50KHN0cnVjdCB4ZV9ndWNfc3VibWl0X2V4ZWNfcXVldWVfc25hcHNob3QgKnNu
YXBzDQo+ICAJZHJtX3ByaW50ZihwLCAiXHRQcmVlbXB0IHRpbWVvdXQ6ICV1ICh1cylcbiIsDQo+
ICAJCSAgIHNuYXBzaG90LT5zY2hlZF9wcm9wcy5wcmVlbXB0X3RpbWVvdXRfdXMpOw0KPiAgDQo+
IC0JZm9yIChpID0gMDsgc25hcHNob3QtPmxyYyAmJiBpIDwgc25hcHNob3QtPndpZHRoOyArK2kp
IHsNCj4gLQkJZHJtX3ByaW50ZihwLCAiXHRIVyBDb250ZXh0IERlc2M6IDB4JTA4eFxuIiwNCj4g
LQkJCSAgIHNuYXBzaG90LT5scmNbaV0uY29udGV4dF9kZXNjKTsNCj4gLQkJZHJtX3ByaW50Zihw
LCAiXHRMUkMgSGVhZDogKG1lbW9yeSkgJXVcbiIsDQo+IC0JCQkgICBzbmFwc2hvdC0+bHJjW2ld
LmhlYWQpOw0KPiAtCQlkcm1fcHJpbnRmKHAsICJcdExSQyBUYWlsOiAoaW50ZXJuYWwpICV1LCAo
bWVtb3J5KSAldVxuIiwNCj4gLQkJCSAgIHNuYXBzaG90LT5scmNbaV0udGFpbC5pbnRlcm5hbCwN
Cj4gLQkJCSAgIHNuYXBzaG90LT5scmNbaV0udGFpbC5tZW1vcnkpOw0KPiAtCQlkcm1fcHJpbnRm
KHAsICJcdFN0YXJ0IHNlcW5vOiAobWVtb3J5KSAlZFxuIiwNCj4gLQkJCSAgIHNuYXBzaG90LT5s
cmNbaV0uc3RhcnRfc2Vxbm8pOw0KPiAtCQlkcm1fcHJpbnRmKHAsICJcdFNlcW5vOiAobWVtb3J5
KSAlZFxuIiwgc25hcHNob3QtPmxyY1tpXS5zZXFubyk7DQo+IC0JfQ0KPiArCWZvciAoaSA9IDA7
IHNuYXBzaG90LT5scmMgJiYgaSA8IHNuYXBzaG90LT53aWR0aDsgKytpKQ0KPiArCQl4ZV9scmNf
c25hcHNob3RfcHJpbnQoc25hcHNob3QtPmxyY1tpXSwgcCk7DQo+ICsNCj4gIAlkcm1fcHJpbnRm
KHAsICJcdFNjaGVkdWxlIFN0YXRlOiAweCV4XG4iLCBzbmFwc2hvdC0+c2NoZWR1bGVfc3RhdGUp
Ow0KPiAgCWRybV9wcmludGYocCwgIlx0RmxhZ3M6IDB4JWx4XG4iLCBzbmFwc2hvdC0+ZXhlY19x
dWV1ZV9mbGFncyk7DQo+ICANCj4gQEAgLTE5MzAsMTAgKzE5MTQsMTUgQEAgeGVfZ3VjX2V4ZWNf
cXVldWVfc25hcHNob3RfcHJpbnQoc3RydWN0IHhlX2d1Y19zdWJtaXRfZXhlY19xdWV1ZV9zbmFw
c2hvdCAqc25hcHMNCj4gICAqLw0KPiAgdm9pZCB4ZV9ndWNfZXhlY19xdWV1ZV9zbmFwc2hvdF9m
cmVlKHN0cnVjdCB4ZV9ndWNfc3VibWl0X2V4ZWNfcXVldWVfc25hcHNob3QgKnNuYXBzaG90KQ0K
PiAgew0KPiArCWludCBpOw0KPiAgCWlmICghc25hcHNob3QpDQo+ICAJCXJldHVybjsNCj4gIA0K
PiAtCWtmcmVlKHNuYXBzaG90LT5scmMpOw0KPiArCWlmIChzbmFwc2hvdC0+bHJjKSB7DQo+ICsJ
CWZvciAoaSA9IDA7IGkgPCBzbmFwc2hvdC0+d2lkdGg7IGkrKykNCj4gKwkJCXhlX2xyY19zbmFw
c2hvdF9mcmVlKHNuYXBzaG90LT5scmNbaV0pOw0KPiArCQlrZnJlZShzbmFwc2hvdC0+bHJjKTsN
Cj4gKwl9DQo+ICAJa2ZyZWUoc25hcHNob3QtPnBlbmRpbmdfbGlzdCk7DQo+ICAJa2ZyZWUoc25h
cHNob3QpOw0KPiAgfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19z
dWJtaXRfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0X3R5cGVzLmgN
Cj4gaW5kZXggNzJmYzBmNDJiMGE1Li5kYzc0NTZjMzQ1ODMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0X3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19zdWJtaXRfdHlwZXMuaA0KPiBAQCAtNjEsMTcgKzYxLDYgQEAgc3RydWN0
IGd1Y19zdWJtaXRfcGFyYWxsZWxfc2NyYXRjaCB7DQo+ICAJdTMyIHdxW1dRX1NJWkUgLyBzaXpl
b2YodTMyKV07DQo+ICB9Ow0KPiAgDQo+IC1zdHJ1Y3QgbHJjX3NuYXBzaG90IHsNCj4gLQl1MzIg
Y29udGV4dF9kZXNjOw0KPiAtCXUzMiBoZWFkOw0KPiAtCXN0cnVjdCB7DQo+IC0JCXUzMiBpbnRl
cm5hbDsNCj4gLQkJdTMyIG1lbW9yeTsNCj4gLQl9IHRhaWw7DQo+IC0JdTMyIHN0YXJ0X3NlcW5v
Ow0KPiAtCXUzMiBzZXFubzsNCj4gLX07DQo+IC0NCj4gIHN0cnVjdCBwZW5kaW5nX2xpc3Rfc25h
cHNob3Qgew0KPiAgCXUzMiBzZXFubzsNCj4gIAlib29sIGZlbmNlOw0KPiBAQCAtMTA5LDcgKzk4
LDcgQEAgc3RydWN0IHhlX2d1Y19zdWJtaXRfZXhlY19xdWV1ZV9zbmFwc2hvdCB7DQo+ICAJfSBz
Y2hlZF9wcm9wczsNCj4gIA0KPiAgCS8qKiBAbHJjOiBMUkMgU25hcHNob3QgKi8NCj4gLQlzdHJ1
Y3QgbHJjX3NuYXBzaG90ICpscmM7DQo+ICsJc3RydWN0IHhlX2xyY19zbmFwc2hvdCAqKmxyYzsN
Cj4gIA0KPiAgCS8qKiBAc2NoZWR1bGVfc3RhdGU6IFNjaGVkdWxlIFN0YXRlIGF0IHRoZSBtb21l
bnQgb2YgQ3Jhc2ggKi8NCj4gIAl1MzIgc2NoZWR1bGVfc3RhdGU7DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMN
Cj4gaW5kZXggN2FkODUzYjA3ODhhLi44MjMzZDQ1MTJmYzYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9scmMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJj
LmMNCj4gQEAgLTMxLDYgKzMxLDE3IEBADQo+ICAjZGVmaW5lIEVOR0lORV9DTEFTU19TSElGVAkJ
CTYxDQo+ICAjZGVmaW5lIEVOR0lORV9JTlNUQU5DRV9TSElGVAkJCTQ4DQo+ICANCj4gK3N0cnVj
dCB4ZV9scmNfc25hcHNob3Qgew0KPiArCXUzMiBjb250ZXh0X2Rlc2M7DQo+ICsJdTMyIGhlYWQ7
DQo+ICsJc3RydWN0IHsNCj4gKwkJdTMyIGludGVybmFsOw0KPiArCQl1MzIgbWVtb3J5Ow0KPiAr
CX0gdGFpbDsNCj4gKwl1MzIgc3RhcnRfc2Vxbm87DQo+ICsJdTMyIHNlcW5vOw0KPiArfTsNCj4g
Kw0KPiAgc3RhdGljIHN0cnVjdCB4ZV9kZXZpY2UgKg0KPiAgbHJjX3RvX3hlKHN0cnVjdCB4ZV9s
cmMgKmxyYykNCj4gIHsNCj4gQEAgLTEzMDAsMyArMTMxMSwzNyBAQCB2b2lkIHhlX2xyY19lbWl0
X2h3ZV9zdGF0ZV9pbnN0cnVjdGlvbnMoc3RydWN0IHhlX2V4ZWNfcXVldWUgKnEsIHN0cnVjdCB4
ZV9iYiAqYg0KPiAgCQliYi0+bGVuICs9IG51bV9kdzsNCj4gIAl9DQo+ICB9DQo+ICsNCj4gK3N0
cnVjdCB4ZV9scmNfc25hcHNob3QgKnhlX2xyY19zbmFwc2hvdF9jYXB0dXJlKHN0cnVjdCB4ZV9s
cmMgKmxyYykNCj4gK3sNCj4gKwlzdHJ1Y3QgeGVfbHJjX3NuYXBzaG90ICpzbmFwc2hvdCA9IGtt
YWxsb2Moc2l6ZW9mKCpzbmFwc2hvdCksIEdGUF9OT1dBSVQpOw0KPiArDQo+ICsJaWYgKCFzbmFw
c2hvdCkNCj4gKwkJcmV0dXJuIE5VTEw7DQo+ICsNCj4gKwlzbmFwc2hvdC0+Y29udGV4dF9kZXNj
ID0gbG93ZXJfMzJfYml0cyh4ZV9scmNfZ2d0dF9hZGRyKGxyYykpOw0KPiArCXNuYXBzaG90LT5o
ZWFkID0geGVfbHJjX3JpbmdfaGVhZChscmMpOw0KPiArCXNuYXBzaG90LT50YWlsLmludGVybmFs
ID0gbHJjLT5yaW5nLnRhaWw7DQo+ICsJc25hcHNob3QtPnRhaWwubWVtb3J5ID0geGVfbHJjX3Jl
YWRfY3R4X3JlZyhscmMsIENUWF9SSU5HX1RBSUwpOw0KPiArCXNuYXBzaG90LT5zdGFydF9zZXFu
byA9IHhlX2xyY19zdGFydF9zZXFubyhscmMpOw0KPiArCXNuYXBzaG90LT5zZXFubyA9IHhlX2xy
Y19zZXFubyhscmMpOw0KPiArCXJldHVybiBzbmFwc2hvdDsNCj4gK30NCj4gKw0KPiArdm9pZCB4
ZV9scmNfc25hcHNob3RfcHJpbnQoc3RydWN0IHhlX2xyY19zbmFwc2hvdCAqc25hcHNob3QsIHN0
cnVjdCBkcm1fcHJpbnRlciAqcCkNCj4gK3sNCj4gKwlpZiAoIXNuYXBzaG90KQ0KPiArCQlyZXR1
cm47DQo+ICsNCj4gKwlkcm1fcHJpbnRmKHAsICJcdEhXIENvbnRleHQgRGVzYzogMHglMDh4XG4i
LCBzbmFwc2hvdC0+Y29udGV4dF9kZXNjKTsNCj4gKwlkcm1fcHJpbnRmKHAsICJcdExSQyBIZWFk
OiAobWVtb3J5KSAldVxuIiwgc25hcHNob3QtPmhlYWQpOw0KPiArCWRybV9wcmludGYocCwgIlx0
TFJDIFRhaWw6IChpbnRlcm5hbCkgJXUsIChtZW1vcnkpICV1XG4iLA0KPiArCQkgICBzbmFwc2hv
dC0+dGFpbC5pbnRlcm5hbCwgc25hcHNob3QtPnRhaWwubWVtb3J5KTsNCj4gKwlkcm1fcHJpbnRm
KHAsICJcdFN0YXJ0IHNlcW5vOiAobWVtb3J5KSAlZFxuIiwgc25hcHNob3QtPnN0YXJ0X3NlcW5v
KTsNCj4gKwlkcm1fcHJpbnRmKHAsICJcdFNlcW5vOiAobWVtb3J5KSAlZFxuIiwgc25hcHNob3Qt
PnNlcW5vKTsNCj4gK30NCj4gKw0KPiArdm9pZCB4ZV9scmNfc25hcHNob3RfZnJlZShzdHJ1Y3Qg
eGVfbHJjX3NuYXBzaG90ICpzbmFwc2hvdCkNCj4gK3sNCj4gKwlrZnJlZShzbmFwc2hvdCk7DQo+
ICt9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmggYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfbHJjLmgNCj4gaW5kZXggMjhiMWQzZjQwNGQ0Li5kNmRkNDA0NWQ2ZDcg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaA0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfbHJjLmgNCj4gQEAgLTU1LDQgKzU1LDggQEAgdm9pZCB4ZV9scmNf
ZHVtcF9kZWZhdWx0KHN0cnVjdCBkcm1fcHJpbnRlciAqcCwNCj4gIA0KPiAgdm9pZCB4ZV9scmNf
ZW1pdF9od2Vfc3RhdGVfaW5zdHJ1Y3Rpb25zKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxLCBzdHJ1
Y3QgeGVfYmIgKmJiKTsNCj4gIA0KPiArc3RydWN0IHhlX2xyY19zbmFwc2hvdCAqeGVfbHJjX3Nu
YXBzaG90X2NhcHR1cmUoc3RydWN0IHhlX2xyYyAqbHJjKTsNCj4gK3ZvaWQgeGVfbHJjX3NuYXBz
aG90X3ByaW50KHN0cnVjdCB4ZV9scmNfc25hcHNob3QgKnNuYXBzaG90LCBzdHJ1Y3QgZHJtX3By
aW50ZXIgKnApOw0KPiArdm9pZCB4ZV9scmNfc25hcHNob3RfZnJlZShzdHJ1Y3QgeGVfbHJjX3Nu
YXBzaG90ICpzbmFwc2hvdCk7DQo+ICsNCj4gICNlbmRpZg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2xyY190eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyY190
eXBlcy5oDQo+IGluZGV4IDI0ZjIwZWQ2NmZkMS4uYjcxNmRmMGRmYjRlIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjX3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2xyY190eXBlcy5oDQo+IEBAIC00Myw0ICs0Myw2IEBAIHN0cnVjdCB4ZV9scmMg
ew0KPiAgCXN0cnVjdCB4ZV9od19mZW5jZV9jdHggZmVuY2VfY3R4Ow0KPiAgfTsNCj4gIA0KPiAr
c3RydWN0IHhlX2xyY19zbmFwc2hvdDsNCj4gKw0KPiAgI2VuZGlmDQoNCg==
