Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0F0C00A94
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 13:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D5010F651;
	Fri, 12 Apr 2024 13:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikxNM3tz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDCC10F651
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 13:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712928741; x=1744464741;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=QQiFYDuRiLyl4hWiTflnJGERZGHjrVpjLv0LqfMj3ec=;
 b=ikxNM3tzBUM7WCurhl6wHiFLXZPRdiZezPVUtPLYUisesNBrf4IwYc6X
 6NvwHq9jvpKLQ4yF9sv9O2M6rmi0ZfOZ4/mvPTa4R3kv8P7G/pEadBWJk
 Y7RI08olrhN/IT17130BJItkeO5HYE7d7iE8TKD+rgZz00CuZHKBWYBey
 2K8eBZRKDqFmmTOnLoheJqDtt8loRhYeyMAp43n2uwXiDLO+ytNDst0n3
 oKBmTZXtB3nGCmkMf3jtH96sFjTAh1+mGomO2pq9ZIlNL2mLB04wQWDH1
 moaZB/Tz5REAP4cnx3hiCN/OS5iRqnHgkDCUFK5ygjgwxoW6x/fyt2RQp w==;
X-CSE-ConnectionGUID: kx+rf+lvQV+/y9juEWpFKg==
X-CSE-MsgGUID: xJGinsDBSbCySSJkzfcgeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8241479"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8241479"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 06:32:20 -0700
X-CSE-ConnectionGUID: clwNa+nVR+OfjChtY4Kz8A==
X-CSE-MsgGUID: QEa1w/FpSwW35wob70Grsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21297439"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 06:32:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 06:32:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 06:32:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 06:32:19 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 06:32:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzSoCLNhCNWPKTXcY3mO+WlKiYKdRtubGCVk1Khxo/NPpmSXP/g/XNThDPQCAT7EIRdmS4p7nD7kQrmT1RXl6oGuaTIajhW7IeMv0NjOT6NPysAFbgXAfv0pzJPtVrOWrjB+zGxi+Dcj2Vkj1aUVPDgT9ZqMmc+ljOgnrhz9BVZ6tjgqfWdJa4bZQBQepd2VoyUgnu3Uwloitr4z8Kw766/+VBu4qKVRcXcAUBY+jOOjVgijn6LmO2l1/tM+UqMKo1tl0XNlQjfBoI1tFJf7sTBqhUJtTHbJwxZMhSOaV3yJApHyinySn/bgV43fdkduMrrGk9NMImTJD26pkXCWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQiFYDuRiLyl4hWiTflnJGERZGHjrVpjLv0LqfMj3ec=;
 b=OhyziDDuxYtQjh7i2sY6RapSJuWDDICuE6wSe2LuYrOYWmr9HhM4VrvGwv7H7sTA7QEs8FyJVkGSzmjxtWDBKAgsA1C3y2Z3vW2jIl74t82egddR3EamkImag2SpltN2YwDGY+uIXY+w6RLily4Qjzv62l+Jhtw0jdwjZivNY1CeHbJpDexnnR+948zf4PrMuN65xi3jVtw522z9w/7dA4tY2q+eDAHzdO6Wn9lchtizURZlL4fvbgHwC+H6jG2dlIFNHVVonRuPP6pBQmyKZ/TsOoAZudWHsGrXfg3IvidcUF7l4wQrqIlORrJwyJae8GprUGYParkpcy6fMwp1lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB6622.namprd11.prod.outlook.com (2603:10b6:a03:478::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 12 Apr
 2024 13:32:16 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7430.045; Fri, 12 Apr 2024
 13:32:16 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/7] drm/xe: Introduce has_device_atomics_on_smem
 device info
Thread-Topic: [PATCH v2 5/7] drm/xe: Introduce has_device_atomics_on_smem
 device info
Thread-Index: AQHajL0pju6ArYRTAUyw6pKwOKtwt7FkohWA
Date: Fri, 12 Apr 2024 13:31:57 +0000
Message-ID: <2fc9b73615bb9fb5115773fcc6e4fc9243a6d234.camel@intel.com>
References: <20240412092249.3636-1-nirmoy.das@intel.com>
 <20240412092249.3636-6-nirmoy.das@intel.com>
In-Reply-To: <20240412092249.3636-6-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB6622:EE_
x-ms-office365-filtering-correlation-id: 02e0c280-fc23-48cc-b4b8-08dc5af4ecf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qC6nGUAN5s3udJ0TgjIBSb7LSxiHF7XhbpW2OxZ7j7o+6x3gRuibwfv3eWZ4e+k03Zcpt7VXOF7QcJRuPX/8BmioxYsOwC1TfVtXr5Ey7fbb25fXVKJv5Sm2F2/86X4Kx5e1+/rn/F1Dc7/JUCnxJvwBZsm8epRA+7SSbpDKeoILY/5NfmEyJi5ToJ8kAHdJl7mYyssa4WhSwHT/UQ4QitNgvVm69gsMMBP1788vHurJ5LnLTfmbwnrCp4Ae2UoAF7z2MKJo8AroGVUwuhvAcOs8Pxh45ywXK8h6cgTgyY1tPrK9wlJukYWAM8/h8HFqFqSedkFrRwZMxh/ysVfHAFat3/M+T7lSrguhhiIg+NFJSJN4bNBlE1zu3JrnZQPODN70Zeu5NDYPChZIoVCZYG/YC5sCZ52C1cnOjq5Itzql2qzg2Np819FCKt9c8wAdia6twD7XBw0+VhH0X0uAAREoGZCZi4sNgyvBU41PxEMM/t4rG7ArnibapVLh9zbrX44mu5Bvc0kvJUdhFfLQ/tdbqhbyfnfQamZ3syazu2SNx49QQKHYvM8oKpTPNig7iqrpP/Prr4U84IsRnIGRLspzK+Cm70TB/CRMlA9pgJiGRcMnL3etlSiovyixRNFgvOMCtgPspYLzbtybKvvbWuvCrBjBch6VHhY0w5x/vaUzWiRfYE/4f6JkROkqLy7rfwuiSQlGinOgr3IbUiDYog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2dhT1gzajZRdUFzUkpZdU12a1lGZER6Y3RuRVF2MG44QUFTTDcwejR4ZkNv?=
 =?utf-8?B?ZTRTd1JyM1I3UXlFc0VPdCtVSGFaVmROWEFoOUY4U0g2TkEzRVBhQ2tSVmFn?=
 =?utf-8?B?TkQ1TkM0YWlZalNpR0RkSWRkZVRvaGNtVEtibTdiVDFxdmJGeE5oSUk4TWli?=
 =?utf-8?B?Ylo4UjZ2R3FseEs4UlNNb3VtS1lQWFN4L1hRTTVqZURMaWlGTmdvOHdJOUdi?=
 =?utf-8?B?Y205THdYc1RLaVZPeWFrRWRHZEFQMGpBZFpkZEpuaHFpbGpOKzNhNjBZdkln?=
 =?utf-8?B?YzRVYk05RGVjeUJvUHBUSFpRUTNHZ0V1MCs2UlNXbjVFb3ZrSCs1bS90V2ZJ?=
 =?utf-8?B?ZUZzQmgwUnN4WGprME5xNkJRYkdkMlpSL01yQXp3Ykl2Z2xKem9QN3BndVJV?=
 =?utf-8?B?eUxFL00vam9hRENRa2REdWtlOHVyUkxwalpTUmdiQ0Qwci9BUWpYd2dzdGcx?=
 =?utf-8?B?cytIQTlIb1F1Zlh2SHI5SWR0bGQrRlJXcU83WGNUTXhyVFozWkJzUXE2bnlu?=
 =?utf-8?B?RUpKNEdpenVrNlNIS3pvQ3VFdWFEWmtPQVVMSUxXRGZKQUxYK0JnYXVlVHhu?=
 =?utf-8?B?Ym92UnpibDV1dTNZRnRLSUllZlRRdEZIcWtYb1lrSytUY1JRc0pSeVRnaytF?=
 =?utf-8?B?aWpWMzJoMWFWd0ttdkwrS2RMS1YrTjFNMk1BcS9TMVd3ZG80bUFTU0tRRC9w?=
 =?utf-8?B?RG50TlJOK2dLNHhaOHRiUlhtQ05qQmFvZWtvK0I4RXhMNVdFMUV5YWNEalZC?=
 =?utf-8?B?RVEwRWxaNDg0T2czNEF0bGthZUl2Z1NIdHBkN2F4VkphZ0d4dGJMdkNZVWsr?=
 =?utf-8?B?K1Nib1lGbDRIMFBXVWJ2emhlWWFrRkc5V0NGNG5oN1IxaDVBbTNENkN2d2lr?=
 =?utf-8?B?bzhZUnZmNHZvcUxhZmpSYXR3ZEs3Q0RtYm9DY3RIWThNcWlDTERBMlBrajJ0?=
 =?utf-8?B?YXYveDFNbU5LeXlMWm10Ui93bHBzYjJEWWFOb1JWSmwrWGVlMTB2YTloYkJJ?=
 =?utf-8?B?cVJGREliTVNEY1hVbEh2ejNBdnBFbXZnZlJNRVBrbU9pb3JURW12ekhvcFpR?=
 =?utf-8?B?WGM1MzVoYnUrZ3dvNGw5SkszUk4wT29VL0pPZmJ6aklvdnc4bFk1TVVVdmNX?=
 =?utf-8?B?SWdYKzNOKyt6YjBhY2dCcXhLN1hTRytoTm5jL1VOQXBtSHJveiswWUI4YXpx?=
 =?utf-8?B?YXVtNWpjTGxBbGdxL24xUUJDVkw1T1Q2V3VjVGZ5emxNRHRWYWg3MEhkb0Va?=
 =?utf-8?B?TkxmVDB1UU8yalZaNm1kdWFGSitOdk5jYURlcURSdTFvZWhMVW94ZVJSN1kz?=
 =?utf-8?B?Z1FXak9QaVdsZlZta0VmYXJxL0dheDVnV1dmYVYwV2wrWGNmTXJxZ0d4SmhZ?=
 =?utf-8?B?amcybzFOQUdUR0JGdHRlV3IvdWU5SHpXYjRyTGZSSWVLTFlFOHNRNGZmR1Rv?=
 =?utf-8?B?SlFQOGlCeFEybjd1cVg3Skc4US9yZi9GRXJqOFBkOFpKcDZ2UEZZWWZLclcy?=
 =?utf-8?B?OEwvaUo5cFVraVUwNDRCZjd1SlZSZkVDY1d0SjZZWnJRcTVSL2Jneithckc3?=
 =?utf-8?B?Z2QvREExQVVnR05VOURRenF6YVc5b096Z3djTU56UGxKN1VTY2diTW9tem9J?=
 =?utf-8?B?eFpMKy8vMld0MTFrcDB1YUdlMWF2YmZTWXBLcExuOVZFQkxRRW8rdGtVc0lk?=
 =?utf-8?B?aDM4RjdwYmF0YkNwZXo5eWtQRDAycDhncGozaW9uNHhWMDVEZDRkNlNQWjlF?=
 =?utf-8?B?cnppY1dQOGZmbVVYWUFTWHA3OG5jYmRjUGlrT1c1M1V0NjJtQjFOeTlsQVNv?=
 =?utf-8?B?dDRXRnVETmNIQ3d2WUdwUDB6VGFLei9wSU90M2I2S3RxRStHdWs1eS9jV2JO?=
 =?utf-8?B?QmpMYmtGNnJrWEZrT1dGTFdGSEZzZXc4L09sQktRZEhqTEQ0Zi94WmZnQmxU?=
 =?utf-8?B?WmRCTmpwK3NLeFlZRDJmaTAwcnViMkMrcTZQd2pZZmZ5R3lxSkwzQS9pekor?=
 =?utf-8?B?cXkxWHhwMWt0NGVQazR4RW53dDgrK09ZbjRwMVlIU1Fzc09DWEozUXdHOXk2?=
 =?utf-8?B?aHdFZTR1VXlvWTlpV3plK2hzNnJnQWpLZHVPOVJ3QXZCUmdMTmplNjlxOW8r?=
 =?utf-8?B?UWZUTkdSVFI4WWJPU2JYZ2o3amNDVDNpNkpXcHlueDBsdGtHKyt6VnhKMW03?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D3924ABEBB9264687392EB354EFC5D0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e0c280-fc23-48cc-b4b8-08dc5af4ecf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 13:31:57.3329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3WqaiTui0krF7CwvoAQ6jhHhQtaGcVpVURRO8OYQYsx6DmbK0vf+udANsUVzKiiNAmqWpkDd5gJhgK+xVJtBzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6622
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

T24gRnJpLCAyMDI0LTA0LTEyIGF0IDExOjIyICswMjAwLCBOaXJtb3kgRGFzIHdyb3RlOg0KPiBB
ZGQgaGFzX2RldmljZV9hdG9taWNzX29uX3NtZW0gdG8gc3BlY2lmeSB0aGF0IGEgZGV2aWNlDQo+
IHN1cHBvcnRzIGRldmljZSBhdG9taWNzIG9uIHN5c3RlbSBtZW1vcnkuIEN1cnJlbnRseSBYRTIN
Cj4gc3VwcG9ydHMgdGhpcyBzbyBzZXQgdGhpcyBmb3IgWEUyLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTmlybW95IERhcyA8bmlybW95LmRhc0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oIHwgMiArKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BjaS5jICAgICAgICAgIHwgMiArKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90
eXBlcy5oICAgIHwgMSArDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiBpbmRleCBiZGU0MmZlMjg4ZmYu
LmMwNmJlMWUwMGYxYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rldmlj
ZV90eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0K
PiBAQCAtMjgzLDYgKzI4Myw4IEBAIHN0cnVjdCB4ZV9kZXZpY2Ugew0KPiAgCQl1OCBza2lwX2d1
Y19wYzoxOw0KPiAgCQkvKiogQGluZm8uaGFzX2F0b21pY19lbmFibGVfcHRlX2JpdDogRGV2aWNl
IGhhcyBhdG9taWMgZW5hYmxlIFBURSBiaXQgKi8NCj4gIAkJdTggaGFzX2F0b21pY19lbmFibGVf
cHRlX2JpdDoxOw0KPiArCQkvKiogQGluZm8uaGFzX2RldmljZV9hdG9taWNzX29uX3NtZW06IFN1
cHBvcnRzIGRldmljZSBhdG9taWNzIG9uIFNNRU0gKi8NCj4gKwkJdTggaGFzX2RldmljZV9hdG9t
aWNzX29uX3NtZW06MTsNCj4gIA0KDQpUaGlzIG9uZSBjYW4gYmUgZWFzaWx5IHJlcGxhY2VkIGJ5
IGEgc2ltcGxlIGdmeF9pcCA+PSAyMC4NCg0KSW4gbXkgb3BpbmlvbiBpdCBzaG91bGQgb25seSBi
ZSBhZGRlZCB0byB4ZV9ncmFwaGljc19kZXNjIHdoZW4gZmVhdHVyZSBjaGVjayBpcyBtb3JlIGNv
bXBsZXgsIGxpa2UgdGhlIGhhc19hdG9taWNfZW5hYmxlX3B0ZV9iaXQuDQpPdGhlcndpc2UgaXQg
d2lsbCBnZXQgY29tcGxleCBhbmQgZXJyb3IgcHJvbmUgdG8gYWRkIG5ldyBwbGF0Zm9ybXMuDQoN
Cj4gICNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfRElTUExBWSkNCj4gIAkJc3RydWN0IHsN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY2kuYw0KPiBpbmRleCA5Y2Y0NTU1OWI5MTUuLjRlNDY5OTk2MjMzNyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9wY2kuYw0KPiBAQCAtMTY1LDYgKzE2NSw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgeGVfZ3JhcGhpY3NfZGVzYyBncmFwaGljc194ZWxwZyA9IHsNCj4gIAkuZG1hX21hc2tf
c2l6ZSA9IDQ2LCBcDQo+ICAJLmhhc19hc2lkID0gMSwgXA0KPiAgCS5oYXNfYXRvbWljX2VuYWJs
ZV9wdGVfYml0ID0gMSwgXA0KPiArCS5oYXNfZGV2aWNlX2F0b21pY3Nfb25fc21lbSA9IDEsIFwN
Cj4gIAkuaGFzX2ZsYXRfY2NzID0gMSwgXA0KPiAgCS5oYXNfcmFuZ2VfdGxiX2ludmFsaWRhdGlv
biA9IDEsIFwNCj4gIAkuaGFzX3VzbSA9IDEsIFwNCj4gQEAgLTYzMCw2ICs2MzEsNyBAQCBzdGF0
aWMgaW50IHhlX2luZm9faW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAl4ZS0+aW5mby52
bV9tYXhfbGV2ZWwgPSBncmFwaGljc19kZXNjLT52bV9tYXhfbGV2ZWw7DQo+ICAJeGUtPmluZm8u
aGFzX2FzaWQgPSBncmFwaGljc19kZXNjLT5oYXNfYXNpZDsNCj4gIAl4ZS0+aW5mby5oYXNfYXRv
bWljX2VuYWJsZV9wdGVfYml0ID0gZ3JhcGhpY3NfZGVzYy0+aGFzX2F0b21pY19lbmFibGVfcHRl
X2JpdDsNCj4gKwl4ZS0+aW5mby5oYXNfZGV2aWNlX2F0b21pY3Nfb25fc21lbSA9IGdyYXBoaWNz
X2Rlc2MtPmhhc19kZXZpY2VfYXRvbWljc19vbl9zbWVtOw0KPiAgCXhlLT5pbmZvLmhhc19mbGF0
X2NjcyA9IGdyYXBoaWNzX2Rlc2MtPmhhc19mbGF0X2NjczsNCj4gIAl4ZS0+aW5mby5oYXNfcmFu
Z2VfdGxiX2ludmFsaWRhdGlvbiA9IGdyYXBoaWNzX2Rlc2MtPmhhc19yYW5nZV90bGJfaW52YWxp
ZGF0aW9uOw0KPiAgCXhlLT5pbmZvLmhhc191c20gPSBncmFwaGljc19kZXNjLT5oYXNfdXNtOw0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5oIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5oDQo+IGluZGV4IGUxZjJiNDg3OWZjMi4uZDQwMzgx
NGE3YTg0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpX3R5cGVzLmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5oDQo+IEBAIC0yNiw2ICsy
Niw3IEBAIHN0cnVjdCB4ZV9ncmFwaGljc19kZXNjIHsNCj4gIA0KPiAgCXU4IGhhc19hc2lkOjE7
DQo+ICAJdTggaGFzX2F0b21pY19lbmFibGVfcHRlX2JpdDoxOw0KPiArCXU4IGhhc19kZXZpY2Vf
YXRvbWljc19vbl9zbWVtOjE7DQo+ICAJdTggaGFzX2ZsYXRfY2NzOjE7DQo+ICAJdTggaGFzX3Jh
bmdlX3RsYl9pbnZhbGlkYXRpb246MTsNCj4gIAl1OCBoYXNfdXNtOjE7DQoNCg==
