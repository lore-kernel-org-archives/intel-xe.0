Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B602BC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 18:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8F3113EB8;
	Thu, 18 Apr 2024 18:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gs4MBtWI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05177113EB8
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 18:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713463848; x=1744999848;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=aLN3qxmQcuQpRioI5nu9bDiI/HaUQ8Yrc90FFeqs8uM=;
 b=Gs4MBtWI51szWONKqQ2WoNXGEMb6QuALBQFDiCvmilA615rFDJmENeR0
 ay7YLvh8JnldF47SiqJ9jhLODzw/eyuasaAuJSzm5tVE4jjYtkeBxno2g
 /XtoFSuhFOEyKdxyclIiSKCEey4URMhLKSyHn6Z9pyc7s7SlRPe3sgI9k
 8cl7kfH4Kfm1bnPQZlPlG9kBB0vGcXkB+UaszMTK7r90ZP+OP3gP2qNLE
 7M1BbMtYQZbHMECEfCcPkvzhe2nrvhKS1/Qo4ONYhO501gM5CbuS8N7mr
 tjQVe1PBk+qQeAWxnQMwHz0xEcx4RhiFZJDYSlKUcBtyAKGSOPTewMVJM w==;
X-CSE-ConnectionGUID: ma29KOLUSZ66S8zVJ7RBsQ==
X-CSE-MsgGUID: uodYAlmdSBqmqkkx3AaiAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8906331"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8906331"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 11:10:48 -0700
X-CSE-ConnectionGUID: ajYbN+edSiGuTA5mAhpMLA==
X-CSE-MsgGUID: aPA9sjRNRRCstFNQkyAX4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23693372"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 11:10:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 11:10:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 11:10:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 11:10:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 11:10:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxTBzSwwy5RcUzN+3mtLIaW2xrTy/9bJr6xxApgqqOAjtN/icY8NvU+EW51P6QigOWVj/xNrRSBcNLySPebL5wVbWOyGDMeUfcnbfTMDN5upFOVyw42rwb83l8cPiH8/3Fwb31LFimUGHgni72rfXRkVGYMdlTM9vk5/z7k3euSnq6CmU0KsBuHNsj0PpCbmM5hP7LL1wQXBjkVuNgIsE3ASr19GOAD5LdIAMBtkm+yYlmv5oll6PSvK0xLKRG9Ls0Ojc08EAhuPQoETJP5GQwulB85wmMDjsmPZY0BhM1it3PnkScT4YnYd6l/MybEDEH/NPkeMmVSn3xNmcKTZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLN3qxmQcuQpRioI5nu9bDiI/HaUQ8Yrc90FFeqs8uM=;
 b=QoYQOmefNeIUALMKb3qkauf2LrvRO4WGPrNL/9ZJ0OF970Dj+K2HFQG14iWAjzjGQuRZmizw96qxHYm7alJB4fMr+jQklV3YVAAa32meEJzQBvlzcDmIPlxaC/gFrABYKdOFy0unG+fOFrKXp4ZjjrBHawYlqETUB2x0qp+f9YxQeGgIZq70T3QX4sYxOSSFJ81vBIk2oGrAh1sxq56Fg3x2kDf2/olVjBO728KxcfoKY4iy/tvf69BQ4I/b/4oTIpGzbWQLyzDshvBQklbA30VyWBz7m0fEqwAcWYdU9ui9g0jOTRIkQFGhMGbpjbJL+LvKLZ1L8moIW4t+byxZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.29; Thu, 18 Apr 2024 18:10:44 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840%2]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 18:10:44 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 1/7] drm/xe/guc: Update GuC ADS size for error capture
Thread-Topic: [PATCH v7 1/7] drm/xe/guc: Update GuC ADS size for error capture
Thread-Index: AQHagIcXkabb6oHAKEmQ5se3Q12SZrFudmUA
Date: Thu, 18 Apr 2024 18:10:44 +0000
Message-ID: <5f0174ae7d0b7afbba6f857f7ff98136e62db11a.camel@intel.com>
References: <20240327204041.178879-1-zhanjun.dong@intel.com>
 <20240327204041.178879-2-zhanjun.dong@intel.com>
In-Reply-To: <20240327204041.178879-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB6381:EE_
x-ms-office365-filtering-correlation-id: de817da1-4974-4971-5cbb-08dc5fd2dd81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BaiKnaOcwevzExbFmRuuSNKiczI0WY9xC9tuJr3on1rgllRus/LLbYVjBEUhocivgvN+wVBzPDwaS0xTNsEIh2wHIKkcfBdrmvpVmhJLBWc5sfK+I3afX1D4wLNKMcpKCgXlCQUGIft9ayPEgBXe4S8+K2rr3/4RoSJER6vFhCzC6LaS0INXpz+AbIMz6rezO5teY1gkVUiAjm1JQV1boa3Lrp/pHQl18cvH0vKp1vvoOCBY7xRf/idxfBozOs845zDjjOoQ1pE2Vvlujs96Y4JxNUa5ykP2IjIxOyymipyXwizayHIO7G8XS+CYwIhyRbqMAneByuQKwJ3NZiC1RZEDG3bLzNYbkiozr2dDvgfcihDyACymUv1qNNpVeTkvaGCQISoCm+iFijVEP+MC18en5W3FIog9pM83QjhTVlaKh/eNazxq9DYhRvc22gg7L87qKCY1EK0K0XkdUF4TvaiIahyqiuX1Ck1lQy8+QxVwiaKClVMWEViatSyiPNi090vc+OOApXPHOFWx2kS2Qdw/5lb7HqbIWkGTOxwXE4buw0ZUPV+ODR78QEkqXe6bhTozey7ltP5/tDxnB3jXnEOmGRDV9Vl+Wx/R9gGdKZKvbDhEmHqa+QHsJugK8AvFR8hBM/3UXADJFFzvQ0xbZm9hlpEeZ6B7yhIzZyUBPb2qptcwgqzpjt0KXFflbTydnslxk/gezdPE5qA1KVrz/S5LaTPQYPtQR4MRPvXjJ7I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WCszbmVDWlNJRFZ0TmQ2c2hzcDB6ckd6Mno0NVJ1Y3NnRUNOMU1ESHBXenRW?=
 =?utf-8?B?Tll2alZzY00wZ052dEhtRDB4cDN0bmk4R1c2L3Y4N0dpNHlMcFdEVTZyM1NG?=
 =?utf-8?B?V0Z2WGVJcGM5dENUa09wMTVrK2tpdlZKVDJNYzJzOERlYzdhbTRnbHg3Zmgx?=
 =?utf-8?B?NUdBaVBzbDErZXVaZTMxZ2hITktYaUFVN20raGRWSXdhU1FxZHpzbWZoN3BY?=
 =?utf-8?B?T1J1SldOdEhoVURQaFB5QVFzZHdwNEcvSFpzSEtjOFRDem9rTXN1TlFrYTV5?=
 =?utf-8?B?WS9lT1c0VWVVZEFMQStaQzg0UFBIdE9UZTFuTExuSTFCVG84WDl1czBFU0d2?=
 =?utf-8?B?am9kRkI1T3RKMExTOCt4L2dueWRCaitjMnN3SHpFbFNQZC9MNFN5K2JHNXdE?=
 =?utf-8?B?azh4bEQ3RjBEQjRXQTdRTnoxRzhqWklPbUVsbWtOUkhCeXkyQVRPWWFGdHlM?=
 =?utf-8?B?dGE4OGNMc1dOdnFhazBQMlpuTm5zcU8xMDJpVzQwbmtFdzdVdVJZQStpQUJJ?=
 =?utf-8?B?dG8vcXhMRnpGNi85cnhESGM2aWN4M0M1QU5MTzJPTXNqRUM2YUxDbk55QWdn?=
 =?utf-8?B?QTY3ZkFxQWNuM1NkT0YvbVhWM3BibjFBK0JYSVNrcHZDazZkQ3ZINHZnNWNL?=
 =?utf-8?B?UWF3MXZHVFhjSG5GWDA3RGRMOW1nb0hOZWs4aHhyaVFBVzVPNEJzNXN6UFcz?=
 =?utf-8?B?dEgreFlhSVZUUG1RZEd2TUZMaTJiaXV3bTBITmlMY3RwWFRXUXFvMHBqbldj?=
 =?utf-8?B?YjAvcXlUTk96VVROeGgreDQyVHdSREFuMW9aR2U2d3YvUzVrb0xkVk1LT1Q4?=
 =?utf-8?B?UVFrdkFSRVFzQjlNVFpMZGVVOWtndHhvZUZUOVBrcFB4bHdyS1ZVTnlYeFdr?=
 =?utf-8?B?RDFJbW5nSFVPY0VCb01IeFh4aEhzbXJBMy9MQTFoNHlOeGpPT3hMemsxOXdL?=
 =?utf-8?B?WWhlYW5zZ1NDODNyam52UjRoTWJXZGhHeW5yb3g0ZE9rSDlUcWFlR0R0R2Nq?=
 =?utf-8?B?L2RiWGlHT3lIUUZxaVhnZ3l5ZnJXM1dmdld5dVBnWmtjVkp2a2FOVXZtK2E1?=
 =?utf-8?B?Y1cvWXcyTHk5YXhaKy84RVFKaDJZeE9vUCtYMFR5Qk9oNUgrbEkwS2RiYTdS?=
 =?utf-8?B?RXk1T0w4WG9RejFZUE10a2Q0d0ZaMEIxMVd1eWhwMzdtelZMeExScDd2b0k0?=
 =?utf-8?B?d1BJbGRIaG9mREJDaytQM1hzVWdtdjZoNlgrV0thWTBycm9Rb2dBMTE0TkRF?=
 =?utf-8?B?OWNjcHFIZWt6RG5mUkVqem94WE1pY0gvdDdUQU5UQ0FHaUZYbDE5RDlvdjk3?=
 =?utf-8?B?bnpKMkFqMmZONWtjVGYrTDBHanFpWDQ2aXRiOUpSOGlDMEg4ek82TWlwWWM2?=
 =?utf-8?B?ZE1XbEhwUzlsU3k1ZWpucnJzRjZlKzFJZmxwalZzNXkyMlBwUTFRbkljWndX?=
 =?utf-8?B?bHpoQ1BEVTdEQThKbnJkZWFVZDJ3ZVB6ZGJzbVRhMkVDb2Z6SEVHYS9tNXc4?=
 =?utf-8?B?L1NuRWx2Um1yVHB5bTBnYis1NzJ6alRVYmc4T3oxd3k3OUw0YlJEWEYyU01x?=
 =?utf-8?B?b0xpS3NVVHdrMVppczdxYmw3VHJFT2Y0U05STndUZjVsY2ZESjRJU3J4Rlp1?=
 =?utf-8?B?TCtKVVpsdHlvZjROSnE3OVBMUnBFN3NicUJpK0NoNk5WTzRMcHFPT0pYcVB4?=
 =?utf-8?B?UnpXMUFDNXk0NWZPNlZIVWVnRVJ2L0gwTXNsOGk0bWxKZUVrdFBJMm5KZGZT?=
 =?utf-8?B?YkF2V1dDRVJ0dUQ2bWZ6dDNycWdpS1BTSUdMenliSHdCVkJrSTNuWHVNOXJK?=
 =?utf-8?B?d1I0V2J1OEhTRytwc2loc1gyaGd6ZkhkNmZYUzhwbXA3TDBKbmppcUd5aThn?=
 =?utf-8?B?MjB6N3orem43eldoVk5HUUhqbHRHRmIrNzdXV3BBb2dLM2dPa0RDbXJma3Bj?=
 =?utf-8?B?OGQ3RWd1VVZlSGowei82L2VhdFJ5RXdHNTJqREd3UE8velpNdjVuaHpFNDJi?=
 =?utf-8?B?NEozK01RNE5aTytqcTBCZGRZL1QwVm1LdGd2SVJlenVMVGdwTmErTXZPck1q?=
 =?utf-8?B?S3JRNkdCQUNUUTViVmh6czNZdUxQeVBTUlV2NW1nY3A0a3lGamE3bit4Q2NQ?=
 =?utf-8?B?K0lod1gwV05Pamt1alhqM0R3Vk53aW1ka05DL0d0blc0MjFYK1VqbjZRZjl6?=
 =?utf-8?Q?Wb/sK/Ml2b4rghwS/rCnaDQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <215EF85C3D2CAB429D7195800BC57653@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de817da1-4974-4971-5cbb-08dc5fd2dd81
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 18:10:44.3304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vpXEZfyLw3OT8ixRn+Bn3/XzlDtdUu4RzqWcbDJooNThLa+d4IBZ1o18QoylLfaKIQ1ZQYrkQQ3QYtnVEiioD2U5yvPmSH2BQpadbKp0Cx+50Cp1SIRAshF5JkGG5hin
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
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

T24gV2VkLCAyMDI0LTAzLTI3IGF0IDEzOjQwIC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQph
bGFuOnNuaXANCg0KPiArDQo+ICsvKioNCj4gKyAqIHN0cnVjdCB4ZV9ndWNfc3RhdGVfY2FwdHVy
ZQ0KPiArICoNCj4gKyAqIEludGVybmFsIGNvbnRleHQgb2YgdGhlIHhlX2d1Y19jYXB0dXJlIG1v
ZHVsZS4NCj4gKyAqLw0KPiArc3RydWN0IHhlX2d1Y19zdGF0ZV9jYXB0dXJlIHsNCmFsYW46c25p
cC4uDQoNCj4gKyNkZWZpbmUgUFJFQUxMT0NfTk9ERVNfTUFYX0NPVU5UICgzICogR1VDX01BWF9F
TkdJTkVfQ0xBU1NFUyAqIEdVQ19NQVhfSU5TVEFOQ0VTX1BFUl9DTEFTUykNCj4gKyNkZWZpbmUg
UFJFQUxMT0NfTk9ERVNfREVGQVVMVF9OVU1SRUdTIDY0DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKg
LyoqDQo+ICvCoMKgwqDCoMKgwqDCoCAqIEBtYXhfbW1pb19wZXJfbm9kZTogTWF4IE1NSU8gcGVy
IG5vZGUuDQo+ICvCoMKgwqDCoMKgwqDCoCAqLw0KPiArwqDCoMKgwqDCoMKgwqBpbnQgbWF4X21t
aW9fcGVyX25vZGU7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgLyoqDQo+ICvCoMKgwqDCoMKgwqDC
oCAqIEBvdXRsaXN0OiBQb29sIG9mIHByZS1hbGxvY2F0ZWQgbm9kZXMgZm9yIGVycm9yIGNhcHR1
cmUgb3V0cHV0DQo+ICvCoMKgwqDCoMKgwqDCoCAqDQo+ICvCoMKgwqDCoMKgwqDCoCAqIEEgbGlu
a2VkIGxpc3Qgb2YgcGFyc2VkIEd1QyBlcnJvci1jYXB0dXJlIG91dHB1dCBkYXRhIGJlZm9yZQ0K
PiArwqDCoMKgwqDCoMKgwqAgKiByZXBvcnRpbmcgd2l0aCBmb3JtYXR0aW5nIHZpYSBpOTE1X2dw
dV9jb3JlZHVtcC4gRWFjaCBub2RlIGluIHRoaXMgbGlua2VkIGxpc3Qgc2hhbGwNCmFsYW46IGkg
dGhpbmsgdSBtZWFudCB0byByZXBsYWNlICJpOTE1IiB3aXRoIHRoZSBuZXdlciB4ZS1kZXYtY29y
ZWR1bXAgdmFyaWF0aW9uIGluIGFib3ZlIGNvbW1lbnQNCmFsYW46c25pcA0K
