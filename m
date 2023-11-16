Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260DCC54FB9
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 15:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE77F10E622;
	Thu, 16 Nov 2023 15:35:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E19F10E622
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700148914; x=1731684914;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UI35WbuRhPW7dEMfKwVlOr6cHkNEJ49ztuYA9GBkxus=;
 b=AD6flfmWp7lteVjmqJcvKdHdPXLJhOwgWoMUUh7/UFDUL56R0bYPSXsL
 8Sq/gP3fG/FyQ7/FfSIdYZbEuHzj3a33epNtKkwj4EtOWCoAhxHLeY3RZ
 qMVCDesYYTqB7sYxOyBJtImt1cGn8HzGBCmgHbpCSwcSaUknYsjBtqno2
 O+jz7fbpOp0o/HZ0fB9x6FBcvuHtwBH4FeTSRE/rx3G/Z+tzVKZLOF79r
 3ZV6u3gjK5IMTjk2u0Cedu+gquvprdZnhVC+7xrZkqboKQcmvqGP5AkKN
 AjS6qLhQ/nVwkzA5LAerhKgCoejUZn8GkAgXxXVJVIACA38EwBz3Gw9ba Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457603143"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="457603143"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:35:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="758865742"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="758865742"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 07:35:13 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 07:35:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 07:35:02 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 07:35:02 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 07:34:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyfD35L70In1swdEZiAWYkzcPgx/I9yyEa9ugkS7PtGiBdvLkTo55QoJ1h9yoxsZjBrWVXbkH+HUYpOxbmfxq41YYbNIdd2Zqn9HYmAEaEqhwGsfAi4QczDQzfu1utsweOB/oEEmKNMqV2wcwmY9yPCLmvNuT5/pZEDpcysFU27BOjOoTQO6NVjJ44IJQQk4yjrjuTyiZHwIIc8mGV4AYplKBwjXYZM8oei40WkIKwgCrlI33H2KsMZesL9s1cuwm2v9jYX2S9MYu4zC5/4PFg+LtZ/PLqHzr+vZr1IB+5WLxeSdDwTMOELZJs/aoF5yaKMgQWSpWTSakMYVc5/Ryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UI35WbuRhPW7dEMfKwVlOr6cHkNEJ49ztuYA9GBkxus=;
 b=Vb6T6vjjyivZNF8rs7CztbnEsgHNHImw7vqnCQf5K2lkuH4b9gn8mPXS1aapaQdOlfgmM2pIVZlnCgTiV64qpodQ1mxkW7uCcX6q9wMO2BIk43aKEcNTZuBHm9AqZ0F+WjKMvvAFr40B6g1gaHCHbefYh/+HZ1/0rUO4ScJ6e7cRR54w8YRFuJ6rOU9ieGWBnAvT4WArxQd6VYHr2SSZw+QFdbM+OZW18jY0v5WJvR2uKIgmzLn8upr/T0u/oLRi5Rw4/IVvI57Ii9tump6nmjJ781aKtg4IxN9OOMvCL+MPBHAMCY9p/f9xfohv7RkPXlJ7GZVuCjdhH0IFr+5T0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB6747.namprd11.prod.outlook.com (2603:10b6:510:1b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 15:34:29 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 15:34:29 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v1 5/8] drm/xe/uapi: Rename query's mem_usage to
 mem_regions
Thread-Index: AQHaFv9b1EAAPmAosU2FdcaBs89zRbB9FsWA
Date: Thu, 16 Nov 2023 15:34:29 +0000
Message-ID: <9f655df61fe31d12b87249d8c39a4d3bab5e7903.camel@intel.com>
References: <20231114133434.7-1-francois.dugast@intel.com>
 <20231114133434.7-6-francois.dugast@intel.com>
In-Reply-To: <20231114133434.7-6-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB6747:EE_
x-ms-office365-filtering-correlation-id: 513334d6-c7e8-4ace-d5cf-08dbe6b985f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: go1skXZObQ0Y2qYdJFan18PJNpXm6QFZbu6TyZHOV4RjUYl/RQlSfpT1S7allG7WRcOS9jj92RKaXqUV1gn7uRMKYj6Db+mr16wDwNy5euZb5HHpqtxRz6YU+dTvufr30oZT8m/vX1aT7vLcygXwVUHATZ47T2FP/OUSx9KkF1jeUqBKT/m7kEnpu+4O85qJM4nlwL36cFX+S39KaH773HtfkjWQLDixMS1fFjnNIK3Vi6p63PbuoTKUZ+I8zYzFVHfXxHZHXrfU+CbtZ+zivh/xnVSb2BemlH8AzfRTMQ6Ns/ri2GDdDUDhJhfuydGOUNhfyGpkY5FLw6ZZ5Z/HXm6FpQVCHiOxyft9ysK/33WTTBJ4swsUoDVZPmwuQ4KnPqw5bwGFQdsicK9c44F2pzpRGMxLIfOPpVyAFnRWGd2NsW/gfsh8WrhWvH89qSu8vApbzJz+l0WxKib4sMD/zoCuSc0iKnQL3eVjFEp7kOb0dFJmoUxUJh5PgSp7Emc45zEMXPXcnA6CscNW9xil6jaWsrUvDNQR+my9OmgB5UtcMINt6G2cZM4X+qE1ayi5yNxMV9UzL4rgY17EedcqGZMYm2N/drjW0I5Wme72wyJR7qydciCVz02M/NjmaH/8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(91956017)(110136005)(66446008)(66476007)(76116006)(66556008)(64756008)(66946007)(316002)(6636002)(83380400001)(2616005)(26005)(36756003)(6506007)(38070700009)(71200400001)(6512007)(6486002)(107886003)(478600001)(38100700002)(5660300002)(122000001)(4001150100001)(82960400001)(41300700001)(2906002)(86362001)(8936002)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFBhd25FeGkzVGdtVlpUM1B5b25YZWgvU0xSL0c0aEtzdTNDcGFZM1RVMDE5?=
 =?utf-8?B?OEpYV1ZwUmFVQnNsSFlxUmlpR0pucFFieURCbVdzRCt0NE9pbUhkUnlTcnlv?=
 =?utf-8?B?WTBsVlhobDJIZW1JUGh5VGdEeFJnVjNPWndyR2RRMEFVVTJhMFU3OFBSUStT?=
 =?utf-8?B?eUxzMUkzWnE3Q0hDOWkyY3E2dVRUdS9lMXhtcTNJbmRCaUpBOUZJMTlDSEJX?=
 =?utf-8?B?R0xnUlI2Z3lzUmwyMTJLRm9MZVhLT3locWs5OG5tUW9pb2tWUVlwSS9CR1Fs?=
 =?utf-8?B?MHhVM3g1K3pEcTRDZ25SbGJIbWpYSERQZW9YcTh0SWl4MVZ1V0lvRkpkUlBX?=
 =?utf-8?B?SWw5TDQ0dVQwVWtJTkRKaDRLY3RYZHplaWVMWHJpZ2ExSmxYa1hVeU1RK2xB?=
 =?utf-8?B?TDZmdEZFL3RsNU5YWnpJZVErVzhBdjFZdUdEU3diNlVXWkZ0Z3NjNDNsaFN2?=
 =?utf-8?B?cWxkTE51dytreEdwYVNhcmF4MmRoQU4vNmZFbi9BNS9pTUNPUG90cDlJcWg0?=
 =?utf-8?B?SjJLNWVudU5CYjZ6bjErakZ1ZWJKNTdUZGdvc0trT3RwMG52TEFSOGRXNno1?=
 =?utf-8?B?MVMweTJnTjJCMk1jSHZpc0tsWDBRYVNpVVNDUWovWVBERFcrTE5qWHdKczh5?=
 =?utf-8?B?QnF6alR4dUJITEJOWjd2K1VaUU5meTVtVVlwWG9vMGxmdHRYSzRnVUNZc2d2?=
 =?utf-8?B?alNGV25LSHpmd2s1K0ZhRGFjNjE2YWl1SklSNUJZaDhNWDBoL1NyQW8xaklk?=
 =?utf-8?B?RHhWbVNaRi9qc2h4S0VxcTNlYVpWaGswTm53WExsNFY3UTZZTGoxYmpPazBT?=
 =?utf-8?B?aFpmbnNNeDVPcUxZL3UzTkV5RE4vQzRLRzlIVjhvcFljams2Vll0dENGZVd0?=
 =?utf-8?B?cUhUVFBCRmtyZEVBNXpiMS93UDY5d3U3VmFXRGVBeVptZFFEMkFldFRkdFJn?=
 =?utf-8?B?RWEzelh0YTRZUjFuUXFxRXk4ZG56R3NILzd3M0pybnFYR3hCWXorTXVobFVj?=
 =?utf-8?B?WU5hTktTNUFjc3FsSi9LaXFXWHRjMkNiVVRoTDlnYWUxWitnVUZJNXBlaWM1?=
 =?utf-8?B?N3FVaVVVVEFYK1ZSVGhDK2hIY3Y5bmJlU0plVUhGZlpESlREZXVUNnZuZlJ3?=
 =?utf-8?B?UGRXOFIwak9oaTh2ZmFPdkhRWFNTdzdSYnp6eUJ6QkNrcDl3RWgvZmt5VU9a?=
 =?utf-8?B?MWd6Tm15N1JaLzdueXQxNHJZTlg2dmUrekFGOEVrVW44MWZYM2lBVm5ObXdy?=
 =?utf-8?B?bzNSSXdtQm0xbTg4QlBPZlo0a0VWc2l6NXMrK1ZmSDR1Tmc1cXZlTDJ6SnpI?=
 =?utf-8?B?b3VDS1BGRDN2SHVPNmJjWklDWlIzQ1d1dFAxOHE4ZGhnMW5QMWk3ekYvYlpi?=
 =?utf-8?B?RWJ0b2ZjdEtibmdINFpIZHIvbHhtU0srQ20zdGdBdDR5bmFucGR4UjlBaks0?=
 =?utf-8?B?ZW05UFBYV2dDTjBFSFVLSythWGpZbGk0dCtJTjY2U09CS0pTM1dvdmVFb1Ey?=
 =?utf-8?B?ditwYXg0aXkwVTlCNjg1UW1ELzRzUUVoaTVxbk9qblNLcEFCMmhKZnFDTTEy?=
 =?utf-8?B?MlhlZXRXdkpUU3ZjbkVxQUJkWUFpcHdhZVlhMDJoVFU1SDQzQjdWL1lJS3A3?=
 =?utf-8?B?eW45L0JyeTEwaGE4SitNT0V1K2xKL0ZDbUl0ZUt6N3NVVFlhZHgyQjBxKzR5?=
 =?utf-8?B?aFdvSEs4eUhTTjFZTlhwN0NkSnBUdjFrZ0ltQzI1Z1FhQTdIMW4yakh6VHpF?=
 =?utf-8?B?ZHJUdEFuRTB3ZUJ6SldDZ3dDYjJMbTFlR25wTjBCQnd4c0IxWUJkT1k0SWFP?=
 =?utf-8?B?VnBDQjN3Z08wQ3piRG1Jdkg2NUppV3pBUjhqNzlIU1ZZMkpxTUtlYi9ocDFO?=
 =?utf-8?B?RGI0b05JNmRYTk1DWithbU9zOWM3NXMrRVV2QmVzaDFxQk0vU2Fjb3BmMEFq?=
 =?utf-8?B?WkY0UkttbUJldjNlbjUrTStTdnRhdDJFeFR2VVliN3p0Y1BndVNtOEJBdElr?=
 =?utf-8?B?aDVKQVNDSVJsR0FMOXFMcVlRVnIvNVNueHZNL29BNFZLYVpYWnpHZ2hFTkIv?=
 =?utf-8?B?MDZSWVdSYUFPa1B0QlZSRUlaMHU2aW5nTmVwUUhWcEdhbHpBMitQTUp1RDFL?=
 =?utf-8?B?U0x4ZUV5NTM4R1hES3V3Uzk0L2pseW43RHN1OWxpZGRmOFFERWdUME1ReGNI?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E2488D63B75E24D81DE34E6955A99AC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513334d6-c7e8-4ace-d5cf-08dbe6b985f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 15:34:29.3763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Rbnygkdj7dyO9ll+8ibVDF8+MAnRpbhFKdLMyX7LpSEnLH7o9pTAsP32/CIuKEfj2MpPecoxsuxWRF+QbYqcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6747
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 5/8] drm/xe/uapi: Rename query's mem_usage
 to mem_regions
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTExLTE0IGF0IDEzOjM0ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gDQo+ICdV
c2FnZScgZ2l2ZXMgYW4gaW1wcmVzc2lvbiBvZiB0ZWxlbWV0cnkgaW5mb3JtYXRpb24gd2hlcmUg
c29tZW9uZQ0KPiB3b3VsZCBxdWVyeSB0byBzZWUgaG93IHRoZSBtZW1vcnkgaXMgY3VycmVudGx5
IHVzZWQgYW5kIGF2YWlsYWJsZQ0KPiBzaXplLCBldGMuIEhvd2V2ZXIgdGhpcyBBUEkgaXMgbW9y
ZSB0aGFuIHRoaXMuIEl0IGlzIGFib3V0IGEgZ2xvYmFsDQo+IHZpZXcgb2YgYWxsIHRoZSBtZW1v
cnkgcmVnaW9ucyBhdmFpbGFibGUgaW4gdGhlIHN5c3RlbSBhbmQgdXNlcg0KPiBzcGFjZSBuZWVk
cyB0byBoYXZlIHRoaXMgaW5mb3JtYXRpb24gc28gdGhleSBjYW4gdGhlbiB1c2UgdGhlDQo+IG1l
bV9yZWdpb24gbWFza3MgdGhhdCBhcmUgcmV0dXJuZWQgZm9yIHRoZSBlbmdpbmUgYWNjZXNzLg0K
DQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5j
b20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGlu
dGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdh
c3RAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwg
MTYgKysrKysrKystLS0tLS0tLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgfCAx
NCArKysrKysrLS0tLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAx
NSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cXVlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IGluZGV4IDhiNTEzNjQ2
MGVhNi4uZDQ5NTcxNmIyYzk2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cXVlcnkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBAQCAtMjMw
LDcgKzIzMCw3IEBAIHN0YXRpYyBpbnQgcXVlcnlfZW5naW5lcyhzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSwNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIHNpemVfdCBjYWxjX21lbW9y
eV91c2FnZV9zaXplKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiArc3RhdGljIHNpemVfdCBjYWxj
X21lbV9yZWdpb25zX3NpemUoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ICB7DQo+ICAJdTMyIG51
bV9tYW5hZ2VycyA9IDE7DQo+ICAJaW50IGk7DQo+IEBAIC0yMzksMTUgKzIzOSwxNSBAQCBzdGF0
aWMgc2l6ZV90IGNhbGNfbWVtb3J5X3VzYWdlX3NpemUoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+
ICAJCWlmICh0dG1fbWFuYWdlcl90eXBlKCZ4ZS0+dHRtLCBpKSkNCj4gIAkJCW51bV9tYW5hZ2Vy
cysrOw0KPiAgDQo+IC0JcmV0dXJuIG9mZnNldG9mKHN0cnVjdCBkcm1feGVfcXVlcnlfbWVtX3Vz
YWdlLCByZWdpb25zW251bV9tYW5hZ2Vyc10pOw0KPiArCXJldHVybiBvZmZzZXRvZihzdHJ1Y3Qg
ZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb25zLCByZWdpb25zW251bV9tYW5hZ2Vyc10pOw0KPiAgfQ0K
PiAgDQo+IC1zdGF0aWMgaW50IHF1ZXJ5X21lbW9yeV91c2FnZShzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSwNCj4gLQkJCSAgICAgIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5ICpxdWVyeSkNCj4gK3N0
YXRpYyBpbnQgcXVlcnlfbWVtX3JlZ2lvbnMoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICsJCQkg
ICAgIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5ICpxdWVyeSkNCj4gIHsNCj4gLQlzaXplX3Qg
c2l6ZSA9IGNhbGNfbWVtb3J5X3VzYWdlX3NpemUoeGUpOw0KPiAtCXN0cnVjdCBkcm1feGVfcXVl
cnlfbWVtX3VzYWdlICp1c2FnZTsNCj4gLQlzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X21lbV91c2FnZSBf
X3VzZXIgKnF1ZXJ5X3B0ciA9DQo+ICsJc2l6ZV90IHNpemUgPSBjYWxjX21lbV9yZWdpb25zX3Np
emUoeGUpOw0KPiArCXN0cnVjdCBkcm1feGVfcXVlcnlfbWVtX3JlZ2lvbnMgKnVzYWdlOw0KPiAr
CXN0cnVjdCBkcm1feGVfcXVlcnlfbWVtX3JlZ2lvbnMgX191c2VyICpxdWVyeV9wdHIgPQ0KPiAg
CQl1NjRfdG9fdXNlcl9wdHIocXVlcnktPmRhdGEpOw0KPiAgCXN0cnVjdCB0dG1fcmVzb3VyY2Vf
bWFuYWdlciAqbWFuOw0KPiAgCWludCByZXQsIGk7DQo+IEBAIC00OTksNyArNDk5LDcgQEAgc3Rh
dGljIGludCBxdWVyeV9ndF90b3BvbG9neShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIHN0YXRp
YyBpbnQgKCogY29uc3QgeGVfcXVlcnlfZnVuY3NbXSkoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+
ICAJCQkJICAgICAgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5KSA9IHsNCj4gIAlx
dWVyeV9lbmdpbmVzLA0KPiAtCXF1ZXJ5X21lbW9yeV91c2FnZSwNCj4gKwlxdWVyeV9tZW1fcmVn
aW9ucywNCj4gIAlxdWVyeV9jb25maWcsDQo+ICAJcXVlcnlfZ3RfbGlzdCwNCj4gIAlxdWVyeV9o
d2NvbmZpZywNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNs
dWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4IGZkNTFkNDQ0NDExOS4uYzYyN2UzNWJkZGI4
IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1
ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTI5MSwxMyArMjkxLDEzIEBAIHN0cnVjdCBkcm1f
eGVfcXVlcnlfZW5naW5lX2N5Y2xlcyB7DQo+ICB9Ow0KPiAgDQo+ICAvKioNCj4gLSAqIHN0cnVj
dCBkcm1feGVfcXVlcnlfbWVtX3VzYWdlIC0gZGVzY3JpYmUgbWVtb3J5IHJlZ2lvbnMgYW5kIHVz
YWdlDQo+ICsgKiBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb25zIC0gZGVzY3JpYmUgbWVt
b3J5IHJlZ2lvbnMNCj4gICAqDQo+ICAgKiBJZiBhIHF1ZXJ5IGlzIG1hZGUgd2l0aCBhIHN0cnVj
dCBkcm1feGVfZGV2aWNlX3F1ZXJ5IHdoZXJlIC5xdWVyeQ0KPiAtICogaXMgZXF1YWwgdG8gRFJN
X1hFX0RFVklDRV9RVUVSWV9NRU1fVVNBR0UsIHRoZW4gdGhlIHJlcGx5IHVzZXMNCj4gLSAqIHN0
cnVjdCBkcm1feGVfcXVlcnlfbWVtX3VzYWdlIGluIC5kYXRhLg0KPiArICogaXMgZXF1YWwgdG8g
RFJNX1hFX0RFVklDRV9RVUVSWV9NRU1fUkVHSU9OUywgdGhlbiB0aGUgcmVwbHkgdXNlcw0KPiAr
ICogc3RydWN0IGRybV94ZV9xdWVyeV9tZW1fcmVnaW9ucyBpbiAuZGF0YS4NCj4gICAqLw0KPiAt
c3RydWN0IGRybV94ZV9xdWVyeV9tZW1fdXNhZ2Ugew0KPiArc3RydWN0IGRybV94ZV9xdWVyeV9t
ZW1fcmVnaW9ucyB7DQo+ICAJLyoqIEBudW1fcmVnaW9uczogbnVtYmVyIG9mIG1lbW9yeSByZWdp
b25zIHJldHVybmVkIGluIEByZWdpb25zICovDQo+ICAJX191MzIgbnVtX3JlZ2lvbnM7DQo+ICAJ
LyoqIEBwYWQ6IE1CWiAqLw0KPiBAQCAtMzUwLDEyICszNTAsMTIgQEAgc3RydWN0IGRybV94ZV9x
dWVyeV9ndCB7DQo+ICAJX191MzIgY2xvY2tfZnJlcTsNCj4gIAkvKioNCj4gIAkgKiBAbmVhcl9t
ZW1fcmVnaW9uczogQml0IG1hc2sgb2YgaW5zdGFuY2VzIGZyb20NCj4gLQkgKiBkcm1feGVfcXVl
cnlfbWVtX3VzYWdlIHRoYXQgaXMgbmVhciB0aGUgY3VycmVudCBlbmdpbmVzIG9mIHRoaXMgR1Qu
DQo+ICsJICogZHJtX3hlX3F1ZXJ5X21lbV9yZWdpb25zIHRoYXQgaXMgbmVhciB0aGUgY3VycmVu
dCBlbmdpbmVzIG9mIHRoaXMgR1QuDQo+ICAJICovDQo+ICAJX191NjQgbmVhcl9tZW1fcmVnaW9u
czsNCj4gIAkvKioNCj4gIAkgKiBAZmFyX21lbV9yZWdpb25zOiBCaXQgbWFzayBvZiBpbnN0YW5j
ZXMgZnJvbQ0KPiAtCSAqIGRybV94ZV9xdWVyeV9tZW1fdXNhZ2UgdGhhdCBpcyBmYXIgZnJvbSB0
aGUgZW5naW5lcyBvZiB0aGlzIEdULg0KPiArCSAqIGRybV94ZV9xdWVyeV9tZW1fcmVnaW9ucyB0
aGF0IGlzIGZhciBmcm9tIHRoZSBlbmdpbmVzIG9mIHRoaXMgR1QuDQo+ICAJICogSW4gZ2VuZXJh
bCwgaXQgaGFzIGV4dHJhIGluZGlyZWN0aW9ucyB3aGVuIGNvbXBhcmVkIHRvIHRoZQ0KPiAgCSAq
IEBuZWFyX21lbV9yZWdpb25zLiBGb3IgYSBkaXNjcmV0ZSBkZXZpY2UgdGhpcyBjb3VsZCBtZWFu
IHN5c3RlbQ0KPiAgCSAqIG1lbW9yeSBhbmQgbWVtb3J5IGxpdmluZyBpbiBhIGRpZmZlcmVudCBU
aWxlLg0KPiBAQCAtNDY5LDcgKzQ2OSw3IEBAIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5IHsN
Cj4gIAlfX3U2NCBleHRlbnNpb25zOw0KPiAgDQo+ICAjZGVmaW5lIERSTV9YRV9ERVZJQ0VfUVVF
UllfRU5HSU5FUwkJMA0KPiAtI2RlZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZX01FTV9VU0FHRQkJ
MQ0KPiArI2RlZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZX01FTV9SRUdJT05TCQkxDQo+ICAjZGVm
aW5lIERSTV9YRV9ERVZJQ0VfUVVFUllfQ09ORklHCQkyDQo+ICAjZGVmaW5lIERSTV9YRV9ERVZJ
Q0VfUVVFUllfR1RfTElTVAkJMw0KPiAgI2RlZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZX0hXQ09O
RklHCQk0DQoNCg==
