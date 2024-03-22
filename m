Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B22EC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 14:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41531124C7;
	Fri, 22 Mar 2024 14:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbCNXlAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6BC1124CC
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 14:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711116381; x=1742652381;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=BDdCxr175ExBjBC4W7HKQI8BbN3xil6rhAcWDyQ2yUA=;
 b=mbCNXlAhxHViTl4XwD44dBDRipXSSfjt/P6b8PFJxDWNF//HYbQlh0oI
 uZoEgTonzO6TbOs7qHoFmwqpbrRLfJIA0qaFjNMeVI8JhXZcYmrUZEWuB
 +xBsEDk0ddyW4rBqYOmqaOMZOQBfXyyh6VPyGr9lA05oXQEM6WMjWYKyS
 Zlw22HLOSJXisL3ESBedFyspDnhDXwgqJUYdmz16CQTpPYkYKed5qGCoK
 9Et+ZgjHF8URlhhZd/UWhIDEo6JxuC22LT2ec+OnnU83rZMSGLoRD18jy
 Xc3xGTy1eVbem0nWWpSkCFcWO21/oUWxLSqLjCjktADYlECA2IzShuRYz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="28638911"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="28638911"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="14971076"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 07:04:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 07:04:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 07:04:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 07:04:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2vC3jVgXbeTFUTMQ/4/cJBHLrZq4PZf+jO+nbs6cyIttw3uYuwI8H53XePJ7KS3hzSc7coYgX6151LoOOUpedUa/K9pGEpXa6YoWHq6gPnZTDpHAvYm4f27N1uEcGZ6tzq7ztOCo4qshq9FfzCQrVhimgjieGXwKqFvCd9+IoeQjEMpMTD+f0CMVdLxJDv10MNQWOJvQRx0R+P+sN75GIUtY3Vc71pFGwrtQqlnW+JhXDxLztBHfuDcDBBiahDoOtWTZpSgguKAA0Vwz+AKBDT+eYj2wL+rBsIT3OwlbbSDkXMN5Vb9pDsBb4sW/PEQyUUq76VxmxNPYBatfQR3ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDdCxr175ExBjBC4W7HKQI8BbN3xil6rhAcWDyQ2yUA=;
 b=IQ70WQdOqHD+978IC1xG4jr/Q1oKQcvnYf7j2pETsZej0fYv72csofZvSnACaUl78xYvjwjfBRGPwoBc0LV6jxU4CjABbDHFxNzUhnZfrJZUqpIzRE0oWndqlRjR1U9B+pNkQhAFyJYDhm+0uBmLn0Y5k1yfRBgqr9oJXRg9agUH2qipJ7Ory9uPh3ZsD77gbTatLRZCV9rvOR03YrT9qvkJWuqlhtuPzGy72mvw1/t8nrvfAM+jDXK95DB1j8wguWvYLMwpm04YM5mNlxV2jUEDBDrbC7L+YCVELRL3Lq4NqFc6e23tHf2CNBA/0Yy64kk+l+vhZXySjEz0btmT0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH0PR11MB5189.namprd11.prod.outlook.com (2603:10b6:510:3d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 14:04:43 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 14:04:43 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna, 
 Animesh" <animesh.manna@intel.com>
Subject: Re: [PATCH] drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
Thread-Topic: [PATCH] drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
Thread-Index: AQHafFAbfPqkPY9v60iC6h0dA1GFSbFDyyMA
Date: Fri, 22 Mar 2024 14:04:43 +0000
Message-ID: <efc6a6f2dee18761509c0778a1d508956ee3543a.camel@intel.com>
References: <20240322114214.1501078-1-animesh.manna@intel.com>
In-Reply-To: <20240322114214.1501078-1-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH0PR11MB5189:EE_
x-ms-office365-filtering-correlation-id: c3683486-11dc-43d2-3800-08dc4a79064e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L+AJo+618E2CS25TAjWVu6e6BjniSDM1GHFpDDw8JwO+JNWu1PBb+wcYGqerFC5D7OfMIY1BGKS3Au9p9RQKKe8LLbjsKQnMeRnQD4fZOt8Lw+FsM7Y3x/yoPCbxf5ZdgDmj/n8NNu/NIFwcYJbA4lGoBYaMwg/adjva/XMnqe8nwJFvYHMxKHj20ySHmTV9uhEkoU93idlADP3gwyQu7fbd6sqS/CWhbvaWnwLc6atRmit7Pa4dNd3c3WzYPleQljG5v24J6Wa//r0kNf9OMLkeYh5yvYA2kKc2gmKvTGDJqhkvIYYAlzezkmyJ4sBFOd+hSBl8qwEvUHwVnjoaV43pQarExXrcOmig90xmNS2FGGTyZKJ5fILeg8RWPn9NdMTnsrG+pw/e8f+ZLTnFcffjfz168ZidM6oeSmMYefW2XQKFvxyfNJYicBMZoDatUcNc2djDPgcAP/JmPtihN+ksLxjvOUcUi4916vn394mhzOzhIqeXkYbxQQBw6Byb/t1eHj0hhjQ48JGyvzRCDlRm4v+ksbtEg7EUns7Jn1YgkIUE4EDKC6kseF9p8Pd6uONhEoOrHUIC0aCSI5wavADyQARe1RU/4ZAdxjMs4A5N2KEjF1VemnnuBkd2AUGgXgaKrBbqZVTroKlMhfu4cQNTunqsHAczs4WTB3wuVoA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGMrV1JLQWg3SlpEc3YyV3RUTG11WjhVRnRPc1dOdzhwQWF6MEFGRWtsajZs?=
 =?utf-8?B?TWtJdDEvYzhpVURkUEY0cFZFRXdOZFl2TjU5cmFuaE02eTFXa05GODd6Wk9q?=
 =?utf-8?B?RGxtaC9GaHJQcWdKWEdBTWdLWXZpTWlqWUFXbk9uSHN4ajVDaklac21MSlk1?=
 =?utf-8?B?dnJaajJkNzhYK2RkMVhXZzlES25MOXRwTWkyYldIbDFURTNGNTRYRFdoWFE3?=
 =?utf-8?B?b2FLZDVGMW1CcVFSUEZOSGhDeFNSenRhZkR5TDdlSkE4VkJpM1dlWTFCL29o?=
 =?utf-8?B?SDlpelF6RXNzLzRDQzNjdGNuM3RsUHZWbE1YbDFxa0lrOGxJV2xHbVNIVjFm?=
 =?utf-8?B?bjlVcWdhd2Q1Zkg5cnhzTzhEOFZDUDQ5V3E1U3lXdUhMMGZ5STk4RlQySGF5?=
 =?utf-8?B?empxUlpsZGIzUGgvd2tRbVNFVzI3RUlZcXl5dzAwQUNhYnRLWUYzbTNMRDBx?=
 =?utf-8?B?SWw0TzNrTzFYT2VqUHZ3bmZSd3l5dFltQkUrVlY1bFZQLzdPRWJ6OXVGNjJX?=
 =?utf-8?B?eG5rUHQzNWprUi9GOWdBSVEyU0k0VW1wOC9wb1N5bFJWVCtoakNqK1NmaVJP?=
 =?utf-8?B?cUJ4c2hiV3NUUVVRM1lWZ1BramdPQjlVWVA4aUtING5qeDFCRDYwemo1WGpP?=
 =?utf-8?B?NTA4aGZwQkdBM0R0bW90dlY2WllEbXByVEZydTh6VktiTUVWSkpERWN3WWUw?=
 =?utf-8?B?RXBtbis0NE9rZzFwSHNDTmVTcnUvbTBkVUJYL0p4NGNBWWthb1pzL1EzMjls?=
 =?utf-8?B?aDdKUWozOHp1cW14ckoyVFFvTDI1WG4reE8zVlJjVFVZa2Z6QkM3a0YzMFdH?=
 =?utf-8?B?VE9jbWFxMEZlajhqWSswZ1VvVnRoZzlMODRsU25PdDVjMkVrRGlZaEIvRExU?=
 =?utf-8?B?bmpmL1BKYkhlbGJmK1lLTlRidjBRWlRIR2lhR1BxMFlhcHoyYjh1cEU5OGo0?=
 =?utf-8?B?c1Z0TVU5NkFZR2FTVm9lUllBM1JUUzRTaHhtTWloa09zeWxGR2dUV1pHRXgw?=
 =?utf-8?B?djdCS252TThhMEhIZ290YmRxK3plaSs5TWtYcWxmS1cyUlhaQ2RxUkdKMmps?=
 =?utf-8?B?dHNSQ2krcVpvb1ljOFZvcmJOd0dGTUFZdm5DODRnYzFoQzZkak5HSzRyeVhV?=
 =?utf-8?B?dW9OYmNZa2kxUlhoTmFJck1VTExwMXBQME9XOGNieG9SNkZKTVphSzZEK2Q2?=
 =?utf-8?B?bjUxYjRnNFRtaTRqMjRYdVBjSnloNEJUUHNscFNGU1daSUFDQ2tUMTFrVjZC?=
 =?utf-8?B?UFF5MVhYT0pDN0lVQ01iT1l1QnJHT1doWEZrWXdPZHJtRndRdDJJYmJVelZP?=
 =?utf-8?B?K3AydkVzd0txYzJzQUYvNlFhWEQ2eFBkM1JwWkxnQkNocTYxcC9iRThOZXpJ?=
 =?utf-8?B?ZFhhRy9zZSt4aFl4YUFuMG9XNjhtUFFaMUVJSkN6Q2w2MEZrbFBzZmRNMGVs?=
 =?utf-8?B?RmhLZjZnS1crbzFqMTJndkpiYVJ5NFl5QnMwN0YrM0E0NDdOZitqeUNyUXJW?=
 =?utf-8?B?NG1VYUNLY0VwVEFlcXNMN0FtYzhjRU1SMDQ0aUN5QXNadWEySHowVVJvV1BY?=
 =?utf-8?B?VStmeVREZlVrdjlSbi81bThTVFprWGtscWQrS1U0MFBnaGJNVzc0N0k2b1Zm?=
 =?utf-8?B?VDk4Y1V6V3ZwM0JEUlhqNXRjcllrbnczdk5ub1F2cnFQSlQ4RmZybUFBNW12?=
 =?utf-8?B?dGNOZCtDOTRiNG5JaVYrTDZwSjRPYTJwRTZ4UFZWelJ0WEVNYzZQK2tIVkYv?=
 =?utf-8?B?MUtqTVhEWDJDV3Fjbi91Yk94V3hLR3BOWi9UaFhqMndFd1NCUkhISnVkZTJW?=
 =?utf-8?B?MzA0SUY4VzROcXhjNGhtRUVrOHVsWVhsZVJzQisrL1EyNUVoR3pXZ3pZQmNm?=
 =?utf-8?B?TWhrTCtYNjA1YlVZYkp1L1hVRXNmMlBIaWx6elZDVVdMMml1d05sWk1hTDNm?=
 =?utf-8?B?U2oyTjlJNVZUaGJldXZyTHV3OUZCUXc0SmlyVHhmRks1T1daWkZPK2laa1VW?=
 =?utf-8?B?b0dNOXNBaGhJb3FhaVFxeVBxMVdUVHNFOGt2RUV4ZUZUMUhHTU1jMklPSnV2?=
 =?utf-8?B?YXZzYi9jdGovVHdNQnBPZUEwVkZyemZpb3dwYkpjTm5zK01lTjJ1Q1E1TEZX?=
 =?utf-8?B?QThvSEd3ZGhmbEx4b2xiZUdRc21ZajZkVHlScVk1KzhXZVZIY28vcFhTeVdO?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <877DBEB6D75EB04089E2BADC96A9E13D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3683486-11dc-43d2-3800-08dc4a79064e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 14:04:43.4642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UtwfeEEcncWHc0vD70MCgXNARRLpXJjSSVvkm3Zzhdtxd/M+7DnI38jAbLkRzVzL1vYU/cTKoKWZOwzyklPKlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5189
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

T24gRnJpLCAyMDI0LTAzLTIyIGF0IDE3OjEyICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBUaGlzIHJldmVydHMgY29tbWl0IGMyN2YwMTBhYTE4ODQyNzZlZTVkYWU3MjAzNGQ4NDk4NzA2
MGM3NjkuDQo+IA0KPiBBZnRlciBmaXggZnJvbSBbMV0gZHNiIHRpbWVvdXQgaXNzdWUgaXMgbm90
IHJlcHJvZHVjaWJsZSBvbiBsb2NhbCB0ZXN0aW5nDQo+IHdpdGggeGUgZHJpdmVyLiBDaGVja2lu
ZyBDSSByZXN1bHQgdG8gY29uZmlybSBhbmQgbm90IGZvciByZXZpZXcuDQoNCkhhdmUgeW91IHRl
c3RlZCB3aXRoIGEgZnVsbCBkZXNrdG9wPyBsaWtlIHN0YXJ0aW5nIGdub21lIG9uIFgsIHN0YXJ0
IGdub21lIG9uIHdheWxhbmQuLi4gdGhlIHJ1bm5pbmcgYnJvd3NlciBvbiB0b3A/IEhhdmUgeW91
IHRlc3RlZCB0aGF0IG9uIFRHTCwgREcyDQphbmQgTVRMIGF0IGxlc3Q/DQoNClRoaXMgZmVhdHVy
ZSB3YXMgZW5hYmxlZCBldmVuIGJlaW5nIGNvbXBsZXRlbHkgYnJva2VuIHdpdGggYSBmdWxsIGRl
c2t0b3Agb24gWGUgS01ELCBzbyBwbGVhc2UgbWFrZSBzdXJlIGl0IGlzIGZ1bGx5IHRlc3RlZCBi
ZWZvcmUgZW5hYmxpbmcgaXQgYWdhaW4uDQoNCj4gDQo+IFsxXSBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzEzMDc4My8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuaW1l
c2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHNiLmMgfCA0IC0tLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHNiLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RzYi5jDQo+IGluZGV4IDRiYWFhOTJjZWFlYy4uZTA2ZTk0ZWUyZjVjIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RzYi5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHNiLmMNCj4gQEAgLTQ2OCwxMCArNDY4LDYg
QEAgc3RydWN0IGludGVsX2RzYiAqaW50ZWxfZHNiX3ByZXBhcmUoY29uc3Qgc3RydWN0IGludGVs
X2NydGNfc3RhdGUgKmNydGNfc3RhdGUsDQo+ICAJaWYgKCFIQVNfRFNCKGk5MTUpKQ0KPiAgCQly
ZXR1cm4gTlVMTDsNCj4gIA0KPiAtCS8qIFRPRE86IERTQiBpcyBicm9rZW4gaW4gWGUgS01ELCBz
byBkaXNhYmxpbmcgaXQgdW50aWwgZml4ZWQgKi8NCj4gLQlpZiAoIUlTX0VOQUJMRUQoSTkxNSkp
DQo+IC0JCXJldHVybiBOVUxMOw0KPiAtDQo+ICAJZHNiID0ga3phbGxvYyhzaXplb2YoKmRzYiks
IEdGUF9LRVJORUwpOw0KPiAgCWlmICghZHNiKQ0KPiAgCQlnb3RvIG91dDsNCg0K
