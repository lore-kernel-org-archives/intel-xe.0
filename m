Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4363FC47DD3
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 20:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED31810E6F7;
	Mon, 22 Jan 2024 20:27:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD0510EC8B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 20:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705955228; x=1737491228;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dxHQN3uN7KUvG+bRFSR4rfMP0E/gj5hlpkLVS/jpobA=;
 b=J7p8YM7v9DvPL9OsVTv/OiYvV/tmY6KpbiDlISQv9nEQ7PDWzmZHPvmk
 P4XE43oLnvKX73lp1rIlHtJ1wMEbbEfGp/sXiHBBAb6yVqOCF3VrA8I4W
 qvpwazExm3xjS7HhYWbqA+V1DIyMORK+pP+N5JHryPnwEvxCS7A77zyBo
 DuGWvTL8OAKB67G8b7x5tbo3C+MVBvHBHNBzH6Hta9IJpq3EIq8rPKLSG
 xflTJazyaSONqrCD82i3g4eWtuy9ZJ6e3uqzZrUV6L56R+q2cBvWTZ4eO
 BAFKHR8wvkAFuWjyKQiwNM+EHnRJeY9+MR4dWbpOx7L/lqKbN8qtuayQW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="400177489"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="400177489"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 12:27:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="34160334"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 12:27:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:27:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 12:27:05 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 12:27:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBeqwFWHMg/JYFs0z3P/hRkxzILaPzpzG2Tv0gS4bMVWdjz5C/OOqn/rmSh8WXtL9cDVRQtnmhCD71ZbRsPYcS18LuiUkGI2A2ZVdjKKCKUnPMaFRNaqwaf275sKakOuBLE2wnv7p3NkQ5t46zMLbmvtNJpXOB22vNqLlqIL2J/RgFI4dOwB3w+S8N0v9jKCDtWM/yTyOZI21z16H44TORiyw9J8rlRETcM502S+sr34u/YVM1mrDIJdE0+n3ftSSk58GqJlE2DvTNLq3lWhimREDuq4+hm6wYGclKIpFxT5i6uOmwrNxTxoOUD2ummWT/hnndKmvOfS1L4Cqf3J6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxHQN3uN7KUvG+bRFSR4rfMP0E/gj5hlpkLVS/jpobA=;
 b=dKIyVVkoA5dKb2stqrlGUPs84lrvka0OzmCbfU1F2z/ejFYTdSYpCy78rlo3d+jerbSP2/rwFcifA/CuKmef2BsHVlaA2N13RtOf/CVxgrobC0G23AdDhSEx0PIdus7ify6JyMv8RkDDyKNcz6AQnXFC4Gxip3mndZXQpFSRsvQhvjRuKLCciO2neklzGw3vU6RZt54wk00Zzo98Is3/PCjJ7l20TA7Yxm4MGNIfrwMkbTZ6X1a/d88GSKRkhEpKgWUdbCwDpFst0GXI9nemhwWHy7EW7P3SHVrZGlPoNjsX/7hcP7T7wZhRaXLzF59HqC94f9LqndnEcXLl46KhEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5678.namprd11.prod.outlook.com (2603:10b6:a03:3b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 20:26:57 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::98c3:e090:252e:7967%4]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 20:26:57 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 5/9] drm/xe: Nuke xe from xe_devcoredump
Thread-Topic: [PATCH 5/9] drm/xe: Nuke xe from xe_devcoredump
Thread-Index: AQHaTVUwDKeSoZOCd02tyqVonQEZ87DmQ88AgAAENIA=
Date: Mon, 22 Jan 2024 20:26:57 +0000
Message-ID: <38dfe3b065dc97df697ac5fb7bf51895ba503abc.camel@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-5-jose.souza@intel.com> <Za7MCPKPvfndug9K@intel.com>
In-Reply-To: <Za7MCPKPvfndug9K@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5678:EE_
x-ms-office365-filtering-correlation-id: c7fd6bcb-ef61-41d9-6fac-08dc1b887b4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SfgX0S22lmsMOtWjL/2U7fw/vRxVVTCBJ4oBWZGKrvNc1TSbU7KNIcx6GkizjPs2lJPlm6HdWLtwFtb7snbaWTl9IiJ2DKP/cYVrwL5Gg0OAZcBO25gkJhLVH5F+jDY5E6PQSGIT2OJgL44+l7vUNhzjTwpgCvCqnL1oPWrnNfjWHq6PsZQLGsB31+wwiVEA57B9Bj3hmMhuGuTaW3FZ3QmUKpNS768Cz0JCBdtd4Y5PptswMGZmwqDufzCRFtTlA51W9kD0Ae3sFoQUYn4+OTF/m0u1kYO8rpVIG39NouDkaM/2JqXXzOO6mbGUWSo4DMUb9BzwRztf+dmBh1HJ1WMnspe5fxK3AWE2lDd3fZZRJYHZZ9m1ExwxjDt0CvDtkdxfPS1QtiwhoaD3MgyotYCuVoch4IvPTxGJFOrxZsIb8nmOjiCqSpbmTmJuOpoqE/rX6GK64gOwbJh7gsies+CavTjmawLqstm20FcNl//juPWR3T4FNu5OnnGzw3zwSZbiSXVlmpnqlKf6ogxSZXraNCFUomifgvpQ13EsJkoNNGgBFE/JwEML3tEfM/7QCvLsPYHm+Vs6NqKvQO2PUmYWdGoIc50a/3n/eKpPTJ7GGm2hXUTuPy3IRUW6OS9q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(38070700009)(83380400001)(8676002)(8936002)(4326008)(6862004)(91956017)(64756008)(6636002)(54906003)(66946007)(76116006)(316002)(37006003)(478600001)(66556008)(2616005)(66446008)(6486002)(66476007)(71200400001)(86362001)(26005)(2906002)(5660300002)(6506007)(6512007)(36756003)(41300700001)(122000001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUtWRDdXTmRwbE12VUVxL2grY2VXbnA3WmJlWmMxc2JHSlpGZ290bW8yUk9Y?=
 =?utf-8?B?ZHd1OSsrQUNkMnNrR3Q4Z2s2NU9sOVNha0xZNFhJV2xIeXk0eThXWU5xMmlP?=
 =?utf-8?B?YnhRaVFwWUE3ckNKK2xhZm42RXlsczQ0ejlwK2daWmxDeXMyNmc3amE0VFVh?=
 =?utf-8?B?OWxFRDJVSHRTTGV2aFloVXpaUDdmanlQRGNVOGpzYU5EbkNLeW9LUk1nbG5V?=
 =?utf-8?B?VUwvOGZDK200VUZiS2p0VENseUNDeFY1WnZKVkhNa2JOelpWVlZtaGFWenN0?=
 =?utf-8?B?b0FjQWVYL0xEZjVuRDR4THJCVUI1SElrREN6SGV1ZC9CN0RkVzkzcnAzOXo5?=
 =?utf-8?B?alBUcTBLSDRNVjBOMk5xdllsZ1EvTks2YmQza2ZWODFRTHArbVlrVm5TcjZG?=
 =?utf-8?B?b0YwQktaTHViT3UvRjlLQmx2dzY5Qi9adnh6aVVnaGtKM0tRM2laTDk3RTBL?=
 =?utf-8?B?R2M4Y1ZMWWtrSkNIN2ZsSXVOOStNdHdHc2w3RVVoQkpNQzNpeWthcEw3SWkz?=
 =?utf-8?B?ekd1b3h5Q0d0WTFIckdJcThVOEpCT3g1UTF5RlgxRTRaM2Z3VWtaSGF4eXMw?=
 =?utf-8?B?YjZPUlZ6cmhCVHEwZmtSa2VDMEY2WUU5c0hoT0w5SEg0U1lDQ0k0d2xEY0ZH?=
 =?utf-8?B?MjRTa3BweWpzRzkvNXJQR0VCcHhjdlhZUFdzclJpRU5YR3M0R0o3dE01Zk8v?=
 =?utf-8?B?L3NXOWlOS0ZRemZKWE1mKzdvcGgwUXA2amVFMlVSVGVhOVpMRkRrdjVPS2ZW?=
 =?utf-8?B?cGpabDVUZUo3a2VKeWoyb1NEUXdJSyt5eml3d252ZStVWDFZeW1QL0FYbE9T?=
 =?utf-8?B?eXdUM25sSk5ZLzZ3NUNsYnFpNmdtWWRlKzlUQjVjTi9kK1RhWG5acUNaanU2?=
 =?utf-8?B?Y3lVS0tmaThTK0UrZE1yWWo2aTdPV01aa1B0UWRpSldTYzdRbjU1OSsvT2M5?=
 =?utf-8?B?anU3WFRzUVlBUW5tRDMrakRsWmFRbDk1NGt3NG1qY0MyUlpUSThBY3g0Y29F?=
 =?utf-8?B?Z1ZDbU1GbTlPUlJJYk5YRVY5amNVaDhIelVSczIrK1g0VzR2bllhbVpPQzJw?=
 =?utf-8?B?S3ZnaSsvU2I1MW00YWdubTJZcXhEVTRWNDJpa0YyakNuYk1MRUlFallKZ0tM?=
 =?utf-8?B?WURqTFZUcTBrKzlKODZXMkZueEdqelpjR0FKbWZJS2Z3MGc1aDNicko4YWd5?=
 =?utf-8?B?ek5EUlg5YkgzYjJlYk5CRG40THVZWGtqNHZhN2d0NllPR2Fta0ZScDFsVThH?=
 =?utf-8?B?L1ZodWNzbHhoMkk2SjRkRXBRZGhqK1YxVHBSbGRNTHRmRlZHbjVTbEY0SkFT?=
 =?utf-8?B?TVNiWUQ0SVd5QnQydnBxNVFTcHlNSHNBWWpXVkxwcGp4dXlVeklibVhTV2Fp?=
 =?utf-8?B?V1Y5M0VLQU1wdWIxVTV4L2NNV2ZHZ2xueUUvRExpYnVHL1N3NDIreURZMXRT?=
 =?utf-8?B?S2dXaE9SeUVmbzJSQ1ZhOUdWQnk4WVdpdHNiWFUyaXZwSDNubkI1dW9xNjBw?=
 =?utf-8?B?SmdtRFgycE83Ni9lTE1kaHdjWkVuWmNGUzlqNGdNcTViYndIMnRPbXNPWWgw?=
 =?utf-8?B?NDNKSUJoQWtPQVErS3QxRkQ4ZEdSL3ltUk9MZUlSUVRKaHNWSTRESVBZWUpl?=
 =?utf-8?B?aEh1VnJCUVQxZDlUMUwwTkkrMC9memR0RDJVMWtMNG9aR08xWEs4cmF3aXpW?=
 =?utf-8?B?bjIxMkZpWVozRWNSWGNESk40SzRNOHhwd3FzZ0cyQVVzdEFyV2tiNklTaHIz?=
 =?utf-8?B?cHgreldTSld1U3A0cllnWUw3Qk1PZk9JUDlMVlJZTlFVUTFpd0JyTTMxVE9D?=
 =?utf-8?B?ektnSldpWGYxNE03amZkcEZQaGVTNjNxNVJLNEFsYmFldXByZ3hVY2o3UjdE?=
 =?utf-8?B?M0E5VUhGTGM5ZVFIZy9YWVhLSFpwVkVzWmIydDJ0bUxlODE3K1prRjBVUHRH?=
 =?utf-8?B?OE01VE1YendWSHM3clhkRGdtWHhUSUt0YVErRWtwcnpMcDl5aTErNjJTUkpH?=
 =?utf-8?B?dmY2SlRWUVF1YWlPazBlRkx5ejlSb3ZoMG9raFYzRjJYamQzemNCSk00QS9w?=
 =?utf-8?B?UjdUNkN2SjRnMHp1R0RjZTJ4dzdtMmJEZ3MrZUJEVjlNRERaeDAxS2k2NGg1?=
 =?utf-8?B?NGpqRUYzWWtMZFhNMm5mWVhrcjBjb1M0KzY1TGFyZU5Ba0pqS3kyWnJobDh1?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD1E225B5806D345A0844215ECA3BF6F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fd6bcb-ef61-41d9-6fac-08dc1b887b4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 20:26:57.7209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yvdc1Vv4qE++L1tCHz8ByscJjqdoNCTsoSY8hxlTNHHvX1Gbhh3ojGDQ6yLR4dpXjfKZWzbK2ZLeBZAjSDGqOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5678
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI0LTAxLTIyIGF0IDE1OjExIC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIE1vbiwgSmFuIDIyLCAyMDI0IGF0IDA5OjA0OjQxQU0gLTA4MDAsIEpvc8OpIFJvYmVydG8g
ZGUgU291emEgd3JvdGU6DQo+ID4geGUgaXMgbmV2ZXIgc2V0IGluIHhlX2RldmNvcmVkdW1wIGJ1
dCBpZiB4ZV9kZXZpY2UgaXMgbmVlZGVkDQo+ID4gZGV2Y29yZWR1bXBfdG9feGVfZGV2aWNlKCkg
Y2FuIGJlIHVzZWQuDQo+ID4gDQo+ID4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGlu
dGVsLmNvbT4NCj4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPGRldkBsYW5raG9yc3Quc2U+DQo+
ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcF90
eXBlcy5oIHwgMiAtLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmggICAgICAg
ICAgICB8IDUgKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZjb3JlZHVtcF90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1w
X3R5cGVzLmgNCj4gPiBpbmRleCA5YTEyOTU5ZWQ2YjE0Li5kMjU5MTE5YjJjOTgwIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcF90eXBlcy5oDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wX3R5cGVzLmgNCj4gPiBAQCAt
NDcsOCArNDcsNiBAQCBzdHJ1Y3QgeGVfZGV2Y29yZWR1bXBfc25hcHNob3Qgew0KPiA+ICAgKiBm
b3IgcmVhZGluZyB0aGUgaW5mb3JtYXRpb24uDQo+ID4gICAqLw0KPiA+ICBzdHJ1Y3QgeGVfZGV2
Y29yZWR1bXAgew0KPiA+IC0JLyoqIEB4ZTogWGUgZGV2aWNlLiAqLw0KPiA+IC0Jc3RydWN0IHhl
X2RldmljZSAqeGU7DQo+IA0KPiBnb29kIGNhdGNoLg0KPiANCj4gPiAgCS8qKiBAY2FwdHVyZWQ6
IFRoZSBzbmFwc2hvdCBvZiB0aGUgZmlyc3QgaGFuZyBoYXMgYWxyZWFkeSBiZWVuIHRha2VuLiAq
Lw0KPiA+ICAJYm9vbCBjYXB0dXJlZDsNCj4gPiAgCS8qKiBAc25hcHNob3Q6IFNuYXBzaG90IGlz
IGNhcHR1cmVkIGF0IHRpbWUgb2YgdGhlIGZpcnN0IGNyYXNoICovDQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZpY2UuaA0KPiA+IGluZGV4IGNlMjBmNmZlNjIxOWEuLjc4MWExYWExNjRlY2YgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ID4gQEAgLTM1LDYgKzM1LDExIEBAIHN0YXRpYyBp
bmxpbmUgc3RydWN0IHhlX2RldmljZSAqdHRtX3RvX3hlX2RldmljZShzdHJ1Y3QgdHRtX2Rldmlj
ZSAqdHRtKQ0KPiA+ICAJcmV0dXJuIGNvbnRhaW5lcl9vZih0dG0sIHN0cnVjdCB4ZV9kZXZpY2Us
IHR0bSk7DQo+ID4gIH0NCj4gPiAgDQo+ID4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IHhlX2Rldmlj
ZSAqZGV2Y29yZWR1bXBfdG9feGVfZGV2aWNlKHN0cnVjdCB4ZV9kZXZjb3JlZHVtcCAqZGV2Y29y
ZWR1bXApDQo+ID4gK3sNCj4gPiArCXJldHVybiBjb250YWluZXJfb2YoZGV2Y29yZWR1bXAsIHN0
cnVjdCB4ZV9kZXZpY2UsIGRldmNvcmVkdW1wKTsNCj4gPiArfQ0KPiA+ICsNCj4gDQo+IEJ1dCBu
b3cgdGhpcyBpcyBraW5kIG9mIGR1cGxpY2F0ZWQgd2l0aCB0aGUgY29yZWR1bXBfdG9feGUgdGhh
dCBpcyBpbiB4ZV9kZXZjb3JlZHVtcC5jDQo+IGl0c2VsZi4NCg0Kb2ggbWlzc2VkIHRoYXQsIHdp
bGwgZHJvcCBkZXZjb3JlZHVtcF90b194ZV9kZXZpY2UoKSB0aGVuLg0KDQo+IA0KPiA+ICBzdHJ1
Y3QgeGVfZGV2aWNlICp4ZV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPiA+
ICAJCQkJICAgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCk7DQo+ID4gIGludCB4ZV9k
ZXZpY2VfcHJvYmVfZWFybHkoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+IC0tIA0KPiA+IDIu
NDMuMA0KPiA+IA0KDQo=
