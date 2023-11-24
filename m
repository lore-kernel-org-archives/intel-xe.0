Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83859C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 18:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276F310E373;
	Fri, 24 Nov 2023 18:45:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100B510E373
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 18:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700851513; x=1732387513;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ctzsOgiNCKTBSi8TVVCXN4jv6c+nOvF//G2Bkzpj/7Y=;
 b=F5lfjoAuzJo0DDcz/Wk3S3xZs0WkXGcyVy5CVQxyzd+/sMjO6iDHf98R
 ZrA3efOUKEr7diS1su6aYVK4nNSG1yfSg77G74iEiHHC7tv4X0GV+7aM5
 MmGGMbi32EvHC9WWMP4ZE/lVvbe0eCA39y7RjJ2ovkj5HNtPl22elmag1
 J99g3IMwr5a+YVEFKLwLRQK0aa06423jxsBM8+8CyFT0mPLWjY4wpqRyn
 bMTueb3omrgu04KVeP7ZWRjWWqO15TnEa2nXtYKiQ6lLKbtU1a5qLbHFw
 XB8jf/i2Zx3mo2Tqc2X0YxhZ1nR3tqZLJSdQ3ysthgs121xkBtQgRyMqR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="392220602"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="392220602"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 10:45:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1099167365"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="1099167365"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Nov 2023 10:45:12 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 10:45:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 24 Nov 2023 10:45:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 24 Nov 2023 10:45:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLE71vq+j6z+QMH1DWDRHa+KsyQT3qninE/tFV+0HpTxAeg5mbfhP0od7Q14oXlbZ9kgeysxzr8lSL9DWQRaCjhbXoGI0cnsXyauFqk7fBuwfpLfHV+3KSne3Vx4BpUppEmxhCa9NP1MrBrYEo2RNidvuVzo014mkRAMiVthhL5w8ewzydNgPiayWNMmu+jz1jc15dWtxAx8ftoVImGsF2ZyHd4FO3dQpIp1Xq4vIFjKYZXonv7Ai60BJ2pS61lE6+L5X+3RY/QZRXiO59Xkv/Nuk4GzaMAwMnL5w9f6OFeVnpQTW6tHcEx5qI64FRpo7/e/CD2wP3IovD8OYoNy2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctzsOgiNCKTBSi8TVVCXN4jv6c+nOvF//G2Bkzpj/7Y=;
 b=VLrUVXFC3XSDQZGGakB4iLyPFzPIlmDKOtQHNUaDnWaREmUWmlupIga7AEkPFVWqODEm35th11ig2euyp/92WEuFhp8ahVw9BFTp34TwE1Z1+LGHyY0/xfQiiZJWRARm6OR070zhDwxpN4u8vx11CIf9/uutWN1/uSaNN/yQWd5hpalXb4AWhjTyhDrNSZVp1/CBGlMSpD5ZfKx/zMYqWg3aHbupwmbbIV/6cQIxm47fOENHRkd/M7+DbjHP6hkhbQrfnO2iTafY+VliBYU2ed3KIb6GsiTLePdwWruewVc6CGX+6KpsRLg+dFB9ahAy1TJ+d6OiziY2oe9BKSYwKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 18:45:05 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 18:45:04 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v2 12/14] drm/xe/uapi: Add Tile ID information to the GT
 info query
Thread-Index: AQHaHVGpWHEjO3+cjkqYvYL8FiS4F7CJ0gcA
Date: Fri, 24 Nov 2023 18:45:04 +0000
Message-ID: <09a13c69df528c028abaf2c32c8285a65d22c5fb.camel@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-13-francois.dugast@intel.com>
In-Reply-To: <20231122143833.7-13-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN2PR11MB4599:EE_
x-ms-office365-filtering-correlation-id: 1b79e90b-6ca8-4724-645e-08dbed1d7966
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Aofvh32FpgsuiH+O1208e1DxH7WKkQ61vL6eAIvFf8fqtLP8OTvpT7F/fv52sx2uGbV//O39yhXuP26GjUh+fGREVXgtANYNlcbqm3WBZOXK0J6OswNCjyLx48pPoBQRUncR1I6csbOsM2AkMwnL2VfxlMqvtByyFDyBCTDpfapmjqGa92/7SCZuSWdADksacYihSPTRQjmLlV41rvUhGzdz+Hj7b4Wi7W08gAi3/EKzXcFchyTPD6l4Qsgo5TDUBeFgK7uGFVyaLcB8a9V6VS0U4rUxssDyqGXFZwyV1gjXNy9iwSi3NObCrcGbLElrMS6HmgrYpHtqYkX1yAvqghgbAnUChoL3DYa2UbYQQ3blXFMrExvYzhuC10HSQFsQz/xly0GPqZ+fiUw/a3Ig+tgvoWLakKx78BS1v+OhsuQwUnyv0TU4OAAdUtcQTM+orr8rlBEYFOUQfUlEy4gHE1dCkoc+3dBiOxcai5fRH8CruXue1BnC59uyuGAyH3G+coSOJBuXnYqiuYFvO9Rq6VDg1Lzpx7nIb9koULVhT3wWaQGlD+6rSZ5i21U8JNc5WzLE1dYabG/ypim0Loos0uZ7TcbjshJ+TlHiWf3EOobOc4Bj0e5Qj3S1WDx7L9Ms
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(346002)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(4001150100001)(82960400001)(2906002)(122000001)(5660300002)(38100700002)(86362001)(4326008)(8936002)(8676002)(41300700001)(6636002)(316002)(76116006)(64756008)(66446008)(66476007)(66946007)(66556008)(91956017)(110136005)(26005)(107886003)(2616005)(38070700009)(6506007)(478600001)(6512007)(83380400001)(6486002)(71200400001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGVhYTBHWVJUQkhMQ2FiYnFQSDJxbXBUVGlRbWgwbHBSZko2aTR1S2ZkRUxO?=
 =?utf-8?B?ajczNVJsVDJqN0NvOFg0Q1oxTUZjM2dyUThRditucW5DNjZmTWZRZWM4cENO?=
 =?utf-8?B?cGhCVXpFdWZWWDZLcmYyZUF6M1ZFSFFMazdiQTZ6TTV4Q09KUGZZS0J6TDcy?=
 =?utf-8?B?SFVwWWRzSDlPRXU0VDdtR0FnbEw0TVFnNE1CV0RnaW82bHNPS3VtbzBwY20v?=
 =?utf-8?B?YVZDR1RheFdYWFZpazkrNGlrV3BmbSt1cDlCMlZ6M1Q3cjYzQzdyWHZMalpt?=
 =?utf-8?B?OTJVOERpUXRwR0xlaWZJcFc2cW12UDNwckVZYStZdjFhRzZLWlhsSks2RFZo?=
 =?utf-8?B?Q3hCdjBBbkdVZE9jVFM5SXZCenR2RlQ3SHkxR0lPekMxMHJhajBUd2RXVExB?=
 =?utf-8?B?c1NZb3JDZ1VudjNSV25CNnJUQXgxUlp6OW16OUFrcWpkRU9RVDI5RlpxdjNy?=
 =?utf-8?B?RXZXcGFoZjRSbHdmMW9EdGh4cjBvOWtySlZaVy82dWxxTGNkNjNRWUZQQ29Z?=
 =?utf-8?B?STlEaUFUaEI3ZVArQmhkU0RneG9XUW5LMWc4UFRqaVRRb3R3dFh5eUZPS0dM?=
 =?utf-8?B?Y0xjUlFTa2ZpdFZaSWdLcnhvemxKWVZZdk9uMUlGemhzclpoK24zbk0wM3dh?=
 =?utf-8?B?V0dsUWZac0xNUmpZQ3Y4Z2VMSm15QlVLTGdBR29QNGUvRkx3K3liemhUVnhY?=
 =?utf-8?B?Smp3WTIzV1Z2VHlCTzcxcko4ZVhkS21XTGYzUlc3c1l0bk1sc2FpTkRySU5u?=
 =?utf-8?B?ZW1QZ1lQbHIxNHhGM05GUlI3aVVXSGRYcFg5cmRhZ25TVHNCeUV6RWZhenZw?=
 =?utf-8?B?QVVJYkF1WkM4OHJ2KzVxTkJxOVJDVitkZHZoeUZtTitiZ0ViaTRQWnNwc3dD?=
 =?utf-8?B?WFRpSm1KQmlBbFdPUHptL3F3bkNmV042emVYbmVIWFZrWWo1dGRFKytZVmN2?=
 =?utf-8?B?L3VuWEVUL0dNaUNBTjR1Z1NhVGJyY1gxak4vM0pVU3BidzB2a0xVRHByZ1Nj?=
 =?utf-8?B?bElNQUpZazBFQ1RGYTJiTDlGQnhNeXlLbWROdlJDZUltMGVhWmxCZjZlSStp?=
 =?utf-8?B?QVFnYytOQ1NMWVBuMzc5amdOZkNIZzlRZ0Jsa3M2dEthV1JhZ3FKOFFHV0h4?=
 =?utf-8?B?S3F6VWhvbDFqRFgxY1IwdzMvNkk5SHg4NkNuZ0xETUx2T2lGVHhLamh6TDdm?=
 =?utf-8?B?VUlSQnV3RWlrS1VEcVQ2UEJmWlptTGIwRzNvYm9ueDY1SnJoaXphdHNhc3VV?=
 =?utf-8?B?SkN2WVhQcFZ0ZnNTeXcwcDFVK1FNWWhKNS9xRGRvUFV2UlNLMjlzanU5eVV6?=
 =?utf-8?B?QUJiZGZhbUVLZGNXOVdLOVBDQ25pV3JIRDNaUEdhUm1Mb1BWdjF1bEJTRzF1?=
 =?utf-8?B?dE56TDh3N2xNZE1ZZ0d5a2w4OVRVSjJ3TmNidXJkNmZkeUV1cll2bURGWUVk?=
 =?utf-8?B?Y3FEOTVWd0pJeHJsZXFSN1V5RElKZmJqdmpXdEo4a3BscmV5eDlNQzRPQTBS?=
 =?utf-8?B?T3lweWE5WEpUZnFzbFR6UFM0aFdWa0ZscFlDVG85UTEwUnI0b3U0cjNhMzVi?=
 =?utf-8?B?TGJJYkxmN0dOODlRSEtlNmZOb01zRkx4TnQySnJGamttdEYzSnBXMThQa3h0?=
 =?utf-8?B?bHVBUlZ3M1FXdlZtTC9SYjhVSUpUZTVJd2dyMHFEc29BbTByWGROY256L3Bw?=
 =?utf-8?B?T1Vxb0x1bVI0RHpmWTcrWUVIY05GcHdBN0ZkZjNSQURpYUxHUTVCcjlPenNr?=
 =?utf-8?B?eFl0VVlHeEo2LzFoaFJ4K1EydHVSNjNoZjY5TStQVkRQM05aWEdvQTlLVlow?=
 =?utf-8?B?N09rUXJ0MnQ3VExKU0p0UytUb29rNHF2RXhUb05nMytCYlJMV0M4RlFuWnFI?=
 =?utf-8?B?MndWcitSdUxvTnJiR1NuMStucnlwaXROVzcva3RiZFBSZy9CVy9GTFdnb3Jm?=
 =?utf-8?B?eXZLM2RYUysrZWZQT3BMVUhybFduNWFzNWsvUmZ0QkVRaGNMblY5cTM1ZVBN?=
 =?utf-8?B?N2ROdEdINDk3cW1XN2tldkJaWk5vZ1I2NklFOGY0dFN5VGNEaGNwQ0ZlT05a?=
 =?utf-8?B?NGtVTEo3SEpOTjNMUkRIOUtZbFhYbGd6OWoxdjdWNllmRTV0OHAzSVBmQWd0?=
 =?utf-8?B?NCt5dWVBUDhHREY0RWFSTmt2ZWZzMG40QmdYb2VvbmxkbE9nTSswSmlpTTl0?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43B3484BD068E34E8401F5FC10796860@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b79e90b-6ca8-4724-645e-08dbed1d7966
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 18:45:04.9047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VA6bWkNlHZLsLyxTutEFnR1wV6xfAD1YgAdwuis3is+cEDBVsp/qga+0PjNx7V0i7mfwRq5Q35isuA6uppo01w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 12/14] drm/xe/uapi: Add Tile ID
 information to the GT info query
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

T24gV2VkLCAyMDIzLTExLTIyIGF0IDE0OjM4ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gDQo+IEFz
IGFuIGluZm9ybWF0aW9uIG9ubHkuIFNvIFVzZXJzcGFjZSBjYW4gdXNlIHRoaXMgaW5mb3JtYXRp
b24NCj4gYW5kIGJlIGFibGUgdG8gY29ycmVsYXRlIGRpZmZlcmVudCBHVHMuDQo+IA0KPiBNYWtl
IEFQSSBzeW1tZXRyaWMgYmV0d2VlbiBFbmdpbmUgYW5kIEdUIGluZm8uDQo+IA0KPiBUaGVyZSdz
IG5vIG5lZWQgcmlnaHQgbm93IHRvIGluY2x1ZGUgYSB0aWxlX3F1ZXJ5IGVudHJ5DQo+IHNpbmNl
IHRoZXJlJ3Mgbm8gb3RoZXIgaW5mb3JtYXRpb24gdGhhdCB3ZSBuZWVkIGZyb20gdGlsZQ0KPiB0
aGF0IGlzIG5vdCBhbHJlYWR5IGV4cG9zZWQgdGhyb3VnaCBkaWZmZXJlbnQgcXVlcmllcy4NCj4g
DQo+IEhvd2V2ZXIsIHRoaXMgY291bGQgYmUgYWRkZWQgbGF0ZXIgaWYgd2UgaGF2ZSBkaWZmZXJl
bnQgVGlsZQ0KPiBpbmZvcm1hdGlvbiB0aGF0IGNvdWxkIG1hdHRlciB0byB1c2Vyc3BhY2UuIEJ1
dCBsZXQncyBrZWVwDQo+IHRoZSBBUEkgcmVhZHkgZm9yIGEgZGlyZWN0IHJlZmVyZW5jZSB0byBU
aWxlIElEIGJhc2VkIG9uDQo+IHRoZSBHVCBlbnRyeS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEZy
YW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgMSArDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oICAgICB8IDIgKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfcXVlcnkuYw0KPiBpbmRleCA3N2NhYjY2ZDMzN2YuLjA5NWYxYjhjMjI5MCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gQEAgLTM3Niw2ICszNzYsNyBAQCBzdGF0aWMg
aW50IHF1ZXJ5X2d0X2xpc3Qoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBkcm1feGVfZGV2
aWNlX3F1ZXJ5ICpxdWVyeQ0KPiAgCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0udHlwZSA9IERSTV9Y
RV9RVUVSWV9HVF9UWVBFX01FRElBOw0KPiAgCQllbHNlDQo+ICAJCQlndF9saXN0LT5ndF9saXN0
W2lkXS50eXBlID0gRFJNX1hFX1FVRVJZX0dUX1RZUEVfTUFJTjsNCj4gKwkJZ3RfbGlzdC0+Z3Rf
bGlzdFtpZF0udGlsZV9pZCA9IGd0X3RvX3RpbGUoZ3QpLT5pZDsNCj4gIAkJZ3RfbGlzdC0+Z3Rf
bGlzdFtpZF0uZ3RfaWQgPSBndC0+aW5mby5pZDsNCj4gIAkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0u
cmVmZXJlbmNlX2Nsb2NrID0gZ3QtPmluZm8ucmVmZXJlbmNlX2Nsb2NrOw0KPiAgCQlpZiAoIUlT
X0RHRlgoeGUpKQ0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2lu
Y2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gaW5kZXggNGJhZDg0ZTc3OTNmLi5iMGVmMWY2MmZk
OTkgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gKysrIGIvaW5j
bHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBAQCAtMzc3LDYgKzM3Nyw4IEBAIHN0cnVjdCBkcm1f
eGVfZ3Qgew0KPiAgI2RlZmluZSBEUk1fWEVfUVVFUllfR1RfVFlQRV9NRURJQQkJMQ0KPiAgCS8q
KiBAdHlwZTogR1QgdHlwZTogTWFpbiBvciBNZWRpYSAqLw0KPiAgCV9fdTE2IHR5cGU7DQo+ICsJ
LyoqIEB0aWxlX2lkOiBUaWxlIElEIHdoZXJlIHRoaXMgR1QgbGl2ZXMgKEluZm9ybWF0aW9uIG9u
bHkpICovDQo+ICsJX191MTYgdGlsZV9pZDsNCj4gIAkvKiogQGd0X2lkOiBVbmlxdWUgSUQgb2Yg
dGhpcyBHVCB3aXRoaW4gdGhlIFBDSSBEZXZpY2UgKi8NCj4gIAlfX3UxNiBndF9pZDsNCj4gIAkv
KiogQHJlZmVyZW5jZV9jbG9jazogQSBjbG9jayBmcmVxdWVuY3kgZm9yIHRpbWVzdGFtcCAqLw0K
DQpjaGFuZ2UgaXMgZ29vZCBidXQgaXQgYnJva2UgdGhlIGFsaWdubWVudCBvZiBhIHN0cnVjdCB0
aGF0IHdhcyBhbGlnbmVkIA0K
