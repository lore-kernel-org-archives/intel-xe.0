Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3976EC54E66
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 06:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42EC10E4FE;
	Fri, 15 Mar 2024 06:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQSQXS7a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157CB10E4FE
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 06:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710484136; x=1742020136;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TrUsvpRBeR6lVHvQNKGuBwAsPLW6eR7lq8mm5Stxqfs=;
 b=hQSQXS7a/2NiGZxKkNq3fEsKHp06Em9qHQcI/V38gFWWPXZa9H+f4057
 rdeWWFU+zIkQqyRnBmLC/01jepQUu0J6RLuVl4g2Kz+9KnUF5e7Uesw7g
 dMOxKRmHSw1iEiJLgPl5TlDJDVmtW7Osiv0fla+++4/cN3Rr8g5iJljcD
 heooTUZu2IsoXqgxnrwgSwnKYslXpaC/F/lMxPB4ZYIDoGidkxppYlXic
 numm1Jk8qT/CqAbdn+FkmtYEsKxGO3l4vld9wGIYbQhlzhUjNt0aETiM4
 TsuOGITws1XQQP4qwgDscsgckb9RjFmjwC8EZSUCVtCUo79qDNhSyo/VI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5941197"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5941197"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 23:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="17256086"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 23:28:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 23:28:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 23:28:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 23:28:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpN/3BgWcSYlJcYfQSe3WKtjphQMrg9l2igo/PVnBV+KbeGrNIsSMqQxPwkAZ3rnHsJ/syZ48o+eDnbmA3fpwE8eeRn//f+aY7FkP2e+RogB1hi6GuYUazT6ADwoguls8KN3UJwfbC8p1tV3i0m3OYHTb69T632Tjy1Pmq7w+Ediyr9Zs6IbMPZii0f6T7diOBrD9kdJgEQKQWTi6TZv58iigJ534a1kHASVpZaF/oK4Dqzrckrl58x3apg0KlFqPRPsa2Ox3XGa7RwWH5FqS9fAOcZKKDtAzJK58OX6s4NuvQbUuTiCl7ymElwPOcRJxtJw8UHI7y21hXE6HqHt7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrUsvpRBeR6lVHvQNKGuBwAsPLW6eR7lq8mm5Stxqfs=;
 b=WWJH31M1KrFTmQ1QFRQ6GPDotuPydm/bq92PzHOyd8gQaO+7376EjAXg+3XxhC19/Z9Cc1d2kOdTJa8cJgJAzB6i8nkhR6VtSFl6xR1sftvClsJNaU7t7J/lEX8lN96CfnTE2GA7ZEqzKo57FS75tfI+bs48bWU6jCLMUHR+b55ztMNZztU0iuGVCz409U7x2Wkaq5bzOO8o6uxXraWAIBhJVrh82HFWXgvYYAo8p9Dt8zebZOn49GOTHnG4rF3HE3dg3Kh+rPHZlTpJ8+fI6tkYd0y7DX5d2gdKSZqesldX0k65+fXX642rN3m6ACWha6K/IjBeCKfa7IeGj5gxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.20; Fri, 15 Mar 2024 06:28:51 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7cad:cb8a:117e:9f96]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7cad:cb8a:117e:9f96%4]) with mapi id 15.20.7386.015; Fri, 15 Mar 2024
 06:28:51 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Somaiya, Himanshu" <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Thread-Topic: [PATCH 3/3] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Thread-Index: AQHadYBdLhi7/P7GVECxB8LYcw/P7rE2JQIAgAAPGwCAAAL4AIAAAz4AgABi3gCAAWHsAIAAWfaA
Date: Fri, 15 Mar 2024 06:28:50 +0000
Message-ID: <11079d969d1127cf390eca53a843a583402f1562.camel@intel.com>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
 <20240313195459.141463-3-rodrigo.vivi@intel.com>
 <7chi3xtzjj46u4ape5o5uz3mkgqyogyu4egb7772j5mbk5i6z2@glcn273zt7o7>
 <ZfIeINI5VJJaaVto@intel.com>
 <jyhbqihplavieq3dc3ltg3hdqz2i5fsqvdbksbt3q3lz4euyid@hmhhcj43ebll>
 <ZfIjVj-MJD2C6YgD@intel.com>
 <ka3c7ex2v2a6lakwfuy5x6drlwf7h5aqbdryrp3wl7pcgjxdyd@45opwtboy4bq>
 <ZfOfKnlbdIl9lXKa@intel.com>
In-Reply-To: <ZfOfKnlbdIl9lXKa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB5047:EE_
x-ms-office365-filtering-correlation-id: d136275b-6484-4103-c148-08dc44b92dee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xw2hHge8qxJfSebeGqXR4MGSK2PqywPr7Ay3v+8/kvs6sifXxMnp6AOe+QuZFforISkvVgGmXYqfRUh11GQKRtJei+8QAOE4xY0cg5hT6Ym7locJyt6M1/1U/I8+oC8mmRGGeThAfuFkvdDs7NTD1dcGOi/+BoO0Dp6+lQrcOm9CgDoPZ1hAWg9XylJGBjI0OHenBGCUG72ThkUGW9E9t8RCKq5em1+QBn0j3UbaEgaIQCoHhCd2ejPCge7oUlm8syynIG9VKcGM5Xld8Qjz2qZ57nrXVNJ+jPLB5oYLeDErGoFUTZSgql2YYsX1ktrdQnDlT5tVdpPH4DvfsFksJKQ8gG7cUKPbpaR6/AJi8HQZaiFvwEUQkL0rznipAqrjs6XxffoF+k9c7gD0HRVJU97JpQtW5Q3AJXibBsJnpjADKQgP+Sd26MjYAvtN9sALtn/1Lu1SP2msnf6n61fgiURJYAeDC2Smglj24MW7fxVBBNCDltqLAay1n2cqVhHVRU943IA5ib6ebb2qEl/EXeDvQBnjiyZbaBHJlFKUp3zUnhrN7tbiD+9qR2tlfJaXkTl6QT2pNex5gp491HuvLCpqn3mCzNDQttzwosIBIaZ3hgmU6N52cuVsz5fsPHYZKU6vLP8RQ1Lt1MgRgmrYE7IhDLbloxMCxqSA+rrGCcM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VW9XeFVhMG9GODVuYUdScUorZzFOd0kvNzJjWGlnZVQ3NGxjdzdRRHhxYVlW?=
 =?utf-8?B?U2RndnBJSndOUmtUa0svWHdkR0xGWkoyV3pJT3g2bFlNUC9uU2l2a3AreTly?=
 =?utf-8?B?WG84MGd5Z1k3am9mTStseGU0V2lCamZ5M0VYd2tiK2hoeEFDTUhzZXJjeldC?=
 =?utf-8?B?QW16TkU4RHR6Y2lGZlB0eGZmUnQyNzJWbVd5dGRaWDQ1WE1jcnFldmdPdEhl?=
 =?utf-8?B?OXFaT3luZ1dSSmc5SWM0TjhpZlloNUovSlJWMVJ4QXFNUGw1Y0ZoRXBsRGta?=
 =?utf-8?B?dDZSZlJwRGxkMkozMy9pRGR5YVE3cGJ1aEoydThCSytxNGZCTkNyUnVYMmVp?=
 =?utf-8?B?L1c3ZkhZK3N2NThLMnpINzZrS05HUzZVV1c3dXJEMTB2ZGtPTUFQanRSYlFR?=
 =?utf-8?B?TTNyVGZBb3Z3bE1FSDNvaHo0NUFqUFVGT1Z4V0p5UGdBNE5PY2ZGWnR3L2RH?=
 =?utf-8?B?WGpHSXdEeUExTXZwMDhQZXBjQzVLTjZlUEJ5M0Y5YXBOL2tRVkU2TGhTY1lV?=
 =?utf-8?B?Mjl2ZkNQM1BIWFpLTWRpbXFjWHI2cWZpU1lFcDBEaUorT1JHQW1ZR2xacVpn?=
 =?utf-8?B?aElLQUxUeFlHSjk2QU1PWjlmYUFLNVZhZzlsd2VRRmRpR1doWmFVazZSdlVK?=
 =?utf-8?B?NzFXbThNdUNBYmpmajd6M01hcWFhZG1hcE9wUGxvU0ZQa0NOZjU3MnA4dHBO?=
 =?utf-8?B?Z2lIOUxiRmMzQmx6cFQwOFB6d3p1dEsrNzFtc2I3eUkrQkZLVUJyTmMvcWhO?=
 =?utf-8?B?RmZWNUtlNnZXcUpBV1g3QTF0a3FsTnd1SXdiMERCSzh1STRSemFYOUZNVGcz?=
 =?utf-8?B?ODF2K2FxTHhtd2V0Qm1yQVZ6UXRwL1l2OUYzeEVaL2RNOXhLdUdhS2JSYk83?=
 =?utf-8?B?MEhhUDl0VFhUZlNjM2d1S0pnYzR2SVpEdCtCTGpqUmFxTnU0RDB6QlVYdU1i?=
 =?utf-8?B?aVBHb2w3eXRGQlVhdmFMNG9id2hHMkc4RUhNZXR2VFAxa0hJeHVWWS9SUFZy?=
 =?utf-8?B?aW43a2hpTWlnUCtTajEwd2srd0hUY1EwSmJIMU52TDRDdURxeU1pNm1sWis3?=
 =?utf-8?B?RHNvMVhHWGxlZ3F4a1VmTks3Yk5qWXhBbGJJNDJKZU52U0Z1UDk1dWF3b0th?=
 =?utf-8?B?YjBaMllOS2VzL2U1NVFLY2doUjBHZEgxY0tTRnNoSG5VSmFLWW1oTHR5T0dn?=
 =?utf-8?B?WG84TDcxckJ1SC9PU2NOTlV1STVWdEVheHl6WnhEYW8vTkZ5U2Q3dVpVTmdS?=
 =?utf-8?B?cDgyd1NpZEQxcE4yT29pRmhWLzV0U2ZqUUxiMUxuWlh3bitTVmZHVGIvWXV3?=
 =?utf-8?B?QU9jSTVhaFkxMnJCRUNuaWhta3oreGFDU3ZaTzc0bktmcHozRTFvVnhyd1cr?=
 =?utf-8?B?cTE3WElLVW1Yb2V4TVNwRSt4ckRxUUtmdnY3bkczcVJPMjVQbHE2Z2JveCtY?=
 =?utf-8?B?S3FSTk5hdld6dmtYam9nMjRRcVoyalBXcnpjWWdMT3NWYTgyOE9sblRvVy82?=
 =?utf-8?B?SzNBRWo2S1lDcjQ5QWVHL2F0NlFYTkY5RjNCdDVlQVRCZHdtTDJKRzJlR0wv?=
 =?utf-8?B?YUFzd1FjWlJZdTdQZldMSkoweGYyRlNZUHNndStOa3A5elZuSEt4N2FaUE1k?=
 =?utf-8?B?cEpxWUlmRzZuTVdWSXdXYmgxUzMyVUljRnozdXZjcXloYTlGMjFNNkgzK3hZ?=
 =?utf-8?B?L0JlZklodFcya3hBRTF0SVQwVy9QU1p5SW5ZaDAxR2xVSUxzUFdIQTJ5YVJO?=
 =?utf-8?B?RGVpcWlIekZMTFQxcTdtMlV1SXZ1dk1JOEtpWkc5djY0Sld6aWh1K3FxQ1RM?=
 =?utf-8?B?ckI4UHhsVE1uTDN6aDBjeXdBVjlYVUxhYktkWDRmaDhwUzh4S2V1aGZwUXl2?=
 =?utf-8?B?bWdsS1hQa0hhekpuUks2QWY1WW92eGpDMUF1TXlLbXVOMkl4ZTltVllmakNn?=
 =?utf-8?B?YjlOUU1UK1FrenlCekx0Q0pFN0hjRGJUMXl4RlJYZFVCeGdER3BrWEhDbVBU?=
 =?utf-8?B?c0xiZjZlS1MzeGcyVS9DY0gyV2pqMEdnVjh5TktJUDFWcWwxRVJpdDlkRHBl?=
 =?utf-8?B?NEw1T2lYNXgzMllrUGN3UnFUTzZZTDFaZm9jQTBJb3JqTnNUMkZtV2tmWU1o?=
 =?utf-8?B?SFhNRWt2bFVBYUEvVloyeldsdTJhTVBHZVNMVGNGUHYzWm5VMG8zdjQ2RE5B?=
 =?utf-8?Q?ohfxHdkUIrtTXQ/Ij0MstsA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C21D272F986D44B96A8DF59B9B8625D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d136275b-6484-4103-c148-08dc44b92dee
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 06:28:50.9446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e1bbpTRBAsVx/OdE4OTMk8fxsO+QtPTO2O651NDbro3VmHHec9JbvFc+XJXB5CHDulo0eT9XkPVi+Yp8fHfXkZfQa/tH+XxA2LB4oFJD2+6Nh2gP2nZIcHZK5I4Qg+ZR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
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

DQphbGFuOnNuaXANCg0KT24gVGh1LCAyMDI0LTAzLTE0IGF0IDIxOjA2IC0wNDAwLCBSb2RyaWdv
IFZpdmkgd3JvdGU6DQo+IE9uIFdlZCwgTWFyIDEzLCAyMDI0IGF0IDExOjAwOjA2UE0gLTA1MDAs
IEx1Y2FzIERlIE1hcmNoaSB3cm90ZToNCj4gPiBPbiBXZWQsIE1hciAxMywgMjAyNCBhdCAwNjow
NjoxNFBNIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIE1hciAxMywg
MjAyNCBhdCAwNDo1NDozOFBNIC0wNTAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+ID4gPiA+
IE9uIFdlZCwgTWFyIDEzLCAyMDI0IGF0IDA1OjQ0OjAwUE0gLTA0MDAsIFJvZHJpZ28gVml2aSB3
cm90ZToNCj4gPiA+ID4gPiBPbiBXZWQsIE1hciAxMywgMjAyNCBhdCAwMzo0OTo1NlBNIC0wNTAw
LCBMdWNhcyBEZSBNYXJjaGkNCj4gPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4gPiA+IE9uIFdlZCwg
TWFyIDEzLCAyMDI0IGF0IDAzOjU0OjU5UE0gLTA0MDAsIFJvZHJpZ28gVml2aQ0KPiA+ID4gPiA+
ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiANCj4gPiANCj4gPiBJIHRoaW5rIHdlIGNhbiB1c2UgdGhl
IG1vZHBhcmFtIG9uIHByb2JlIGFuZCBhbHJlYWR5IHB1dCBpdCBpbiBhZHMuDQo+ID4gVGhhdCBk
aWN0YXRlcyB0aGUgZGVmYXVsdCBiZWhhdmlvciBmb3IgdGhlIF9tb2R1bGVfIHJlZ2FyZGxlc3Mg
b2YNCj4gPiB0aGUgZGV2aWNlLg0KPiANCj4gYWdyZWVkLiBJIGFscmVhZHkgc2VudCB0aGUgMyBw
YXRjaGVzIHRoYXQgYWNjb21wbGlzaGVkIHRoYXQuDQphbGFuOiBwZXJzb25hbCBvcGluaW9uIC0g
d2UgcmVhbGx5IG91Z2h0IHRvIGhhdmUgcnVudGltZSBjb250cm9scyBpbg0KdGhlIGNhc2Ugd2Ug
YXJlIGxvb2tpbmcgYXQgYm90aCBpbnRlZ3JhdGVkICsgZGlzY3JldGUgY29tYmluYXRpb24gdGhh
dA0KbmVlZHMgdG8gYmUgZGVidWdnZWQgKGkuZS4gZGVidWdmcykuDQo+IA0KPiA+IFRoZW4gd2Ug
YWxsb3cgZWl0aGVyIHNldHRpbmcgdGhlIHBhcmFtIHRvIGNoYW5nZSB0aGUgZGVmYXVsdA0KPiA+
IGJlaGF2aW9yDQo+ID4gbGlrZSBhYm92ZSBvciB3ZSBjcmVhdGUgYSBkZWJ1Z2ZzIHNvIHdlIGNh
biBzZXQgaXQgcGVyLWRldmljZSBhZnRlcg0KPiA+IHRoZQ0KPiA+IHByb2JlLg0KPiANCj4gSSBo
YXZlIHRoZSA0dGggcGF0Y2ggaW4gaGVyZToNCj4gaHR0cHM6Ly9naXRodWIuY29tL3JvZHJpZ292
aXZpL2xpbnV4L2NvbW1pdHMveGUtYnVzdGVkDQo+IHRoYXQgaXMgdGFyZ2V0aW5nIHRoaXMgZ29h
bC4gSG93ZXZlciBJJ20gc3RpbGwgZGVhbGluZyB3aXRoIHRyeWluZyB0bw0KPiBjaGFuZ2UNCj4g
dGhlIGd1YyBzY2hlZCBwb2xpY3kgb24gdGhlIGZseS4NCj4gDQo+IEknbSBub3QgY29udmluY2Vk
IHRoYXQgaTkxNSBjb2RlIGFyb3VuZCB0aGF0IDB4NTA2IGNvbW1hbmQgaXMgdGhlDQo+IHJpZ2h0
IGNvZGUsDQo+IHNvIEknbSBzdGlsbCBpbnZlc3RpZ2F0aW5nIHRoZSBzcGVjIGFuZCBkb2luZyBz
b21lIGV4cGVyaW1lbnRzLg0KPiANCj4gQnV0IEknZCBsaWtlIHRvIG1vdmUgZm9yd2FyZCB3aXRo
IHRoaXMgZGVmYXVsdCBiZWhhdmlvciB3aXRoIG1vZHVsZQ0KPiBwYXJhbWV0ZXIgc28gd2UgdW5i
bG9jayBvdXIgc3YgdGVhbXMuDQo+IA0KPiB0aG91Z2h0cz8NCmFsYW46IElJUkMgZ3VjIGhhcyBw
cmVlbXB0aW9uIHRpbWluZyBwZXIgY29udGV4dCBhbmQgY2FuIGJlIGNoYW5nZWQgYXQNCnJ1bnRp
bWUgKGJ1dCBtYXkgb25seSBnZXQgdXBkYXRlZCBuZXh0IHRpbWUgdGhlIGNvbnRleHQgaXMgc2No
ZWR1bGVkDQppbnRvIHRoZSBlbmdpbmU/KS4NCg0KQnR3LCBpIGhhdmVudCBoYWQgdGltZSB0byB0
aG9yb3VnaGx5IGdvIHRocnUgYWxsIHRoZSBwYXRjaGVzIG9uIGFib3ZlDQpnaXRodWIgYnV0IGJh
c2VkIG9uIHRoaXMgc2VyaWVzLCBpIGRvbnQgc2VlIHVzIGFsc28gcHJldmVudGluZyB0aGUNCnJ1
bnRpbWUgZ3VjL2d0LXJlc2V0ICh3aGljaCBpcyBhbHNvIHNvbWV0aGluZyB0aGF0IHRoZSB1c2Ut
Y2FzZSBiZWluZw0KdGFyZ2V0dGVkIG5lZWRzIHRvIGF2b2lkKS4gVGhlcmUgYXJlIGEgZmV3IGZ1
bmN0aW9ucyB0aGF0IHNlZW0gdG8gYmUNCmludm9sdmVkIGluIHRoaXMgcnVudGltZSBndWMvZ3Qg
cmVzZXQgKHdoZW4gZ3VjIGZhaWxzIHRvIHJlc2V0IGVuZ2luZSkNCmJ1dCB3ZSBtdXN0IGJlIGNh
cmVmdWwgdG8gYWxzbyBub3QgYmxvY2sgZ3VjZ3QtcmVzZXRzIGZvciB0aGUgcG9zdC1ody0NCmNv
bmZpZyByZWFkdXAgYWZ0ZXIgdGhlIGVhcmx5IHN0YWdlIGd1YyBsb2FkLiBCYXNjaWFsbHkgd2Ug
bmVlZCB0byBmaW5kDQp0aGUgcGF0aHMgZm9yIHdyaXRpbmcgdG8gR0RSU1QgYW5kIGJsb2NrIChl
eGNlcHQgZm9yIHRoYXQgZWFybHkgYm9vdA0KYW5kIGFsc28gc3VzcGVuZC1yZXN1bWUgYW5kIHNo
dXRkb3duKS4NCg0K
