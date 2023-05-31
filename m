Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED32C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 13:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC5C10E4BB;
	Wed, 31 May 2023 13:04:13 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA82810E4BB
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 13:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685538250; x=1717074250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cLz0GUy2Ey5mjLeDlvMBOpXLpzyDvTThPAPUrauTZ/Y=;
 b=eYNEpiM3UHxbKuio7100Lyhvif9XuVTaWi7O4H2rCpdtKWsAIjoix3DH
 2PglSCqXiUMaBBmEaFeJS0oY/uOuAxBQyozCqn/LcTEpSA/pyTF9sFhIV
 WTCbr3CYztb7VckFmGiMh365l4zKbFUNLp4OS6cyzefZGEdBS/3uleAAZ
 UdwwQa0HKgCfNiU12BUCnRkLcB+3eUI7yaucXvhTXdswmOIntIoFrft+f
 etyhLJ+DOrVA+tD25oP71OskjZNKdJxIOncru69oJgSbjwIr0rM8VyI2w
 lc2Y5ZbPTWHucRy5E6MfJ1Q+IaQIo3zAEvHSLnVJ2uprWnyLHedVcUsSG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="352725949"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="352725949"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 06:04:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="684385964"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="684385964"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 31 May 2023 06:04:03 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 06:04:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 06:04:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 06:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqJ/+Qs3oTeA+DLZNwsMp3Emyi0LhIneaeBpc6p56USvTbiG/lQlD/bO+bNgzWuqR8q65AHOzkjRa/qDlX7ldCTuViPgbiZ5UxNHdV/xJ6LFWF72YM2/OkUErYi+RPu8O7graZmWQPUCete4u9GoArwPXy71+qPT3UM+5dJHAWG+lSmXetNpt3TQdp05LK9tsAGtvMAYx5rYwgaXJgouYD935irU6FR4PZfUe8di1qiC/t/mrwuqBJGT4ecV7ae3qbM5opPHbTx24mYxYDWxr6Kk5av9zlmlNVXU8sGhfDgHhvDQ8kyX6/oZQoQati5b+X5uKzLVo8UnvO7ZAw2PqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLz0GUy2Ey5mjLeDlvMBOpXLpzyDvTThPAPUrauTZ/Y=;
 b=ZoG5cesEv4Y3PNWwxA7y4NGfurVgQyddX1GramHMpz0ZVhlaF6yVSuPc6AOtUENESwxf/NdP4btAvKhMIoKXCRTT6MPo5tvcWVb4Jn9Y/YcKEiz7kRcy63yZ0FbLkA+Lu27vVzwRNxYnZdjs7XezvT5MQhpkveQ46G+iDQO6Ehk9BqZmtZMWfMpV2R8cDfj8in3QVDN3xJuKm3fXZP5uoq/rSj71fOaLL6qX7Ck6G8vJLLc/oG7ovgTNBnLdsUnbS5fEYA4B0YrXjek/e45stoBB0WlIefoToqHfbM/O6bTOFFvD+TvWDl8ZqUoQV/J7nnH6l/WjnA8GGhwjw65AQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 13:04:01 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 13:04:01 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Thread-Topic: [Intel-xe] [PATCH] xe/xe_bo: Reject bo creation of unaligned size
Thread-Index: AQHZbdUs6tWdzGFVDUOcB1PyxL4mEa8z7yeAgDkF3YCAB6zYAIAAAzAA
Date: Wed, 31 May 2023 13:04:00 +0000
Message-ID: <ecf567940266848e2bd22b21a5cccc0b7d3ac8db.camel@intel.com>
References: <20230413065645.187171-1-zbigniew.kempczynski@intel.com>
 <d18c10ec-bb41-f142-70dd-1788259f9045@linux.intel.com>
 <29d1ab33fa487525dbd05ff59650bae6ca9f310a.camel@intel.com>
 <20230531125232.a55ccjzfm7divj3n@zkempczy-mobl2>
In-Reply-To: <20230531125232.a55ccjzfm7divj3n@zkempczy-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY5PR11MB6259:EE_
x-ms-office365-filtering-correlation-id: 566106d8-e041-45cf-55df-08db61d78087
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ke9J6eBE71z9+bFMnAej9dJ+K2xvv0/Dkwp2urPKg0Fnfptmvf5iysfF5XD8JJQdGrBCeer8g/QbdYCh2q7dJhJ0CU2WQPFTIkO7jjCqmO/dFgo2mACoSlD6xtGUMz30u73FTtyQWW+ss53r67wySwUbExe0G4jifIGnZMpdbGgKKrnQA/qquaCNfcSforhadt0h3NFGZxpybUpbM8ks44jpTFrGKRFrzPqJvJwUOaYToDg5NnTodcwUFonqKt2odzy6nuxZJMytPeil2yQMd41fkEkHU9ZuiIWhTnV2mU/J4m5ngkcRf3MvNd1gzKFmIN1+DtRbNvZc0SB5QZgc1TZf0HxSBPGJNLKR3Tw3ZzgL1KNxS06LwfSJK+I9VkmDOuJoyFC7S3dy6Gemn0n1vDIqzjW2VXYhsc/C5cbqMSJZ2kYgE9U4nw82phOZt15m0abt3E2xizX+PbNWSJPjXTxJu7U1B2yPVrxAFFtFE4XdSaEj95ijVocKNVv2gxSkkbHkGSikTgczlbNihrDhKUhJmqolIHGzRGj83MKWL/3gI39AA9wciRou8s5KR1rk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(966005)(2616005)(186003)(38100700002)(83380400001)(41300700001)(53546011)(6486002)(26005)(6506007)(6512007)(66574015)(71200400001)(478600001)(37006003)(54906003)(66946007)(66476007)(66446008)(76116006)(4326008)(66556008)(64756008)(91956017)(6636002)(316002)(122000001)(82960400001)(8676002)(6862004)(8936002)(5660300002)(36756003)(38070700005)(2906002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0VhN0RERHBxaStGQis2dkJ4T3Y3SzJjYkY5R29Hc3h5Z2ZrY09mSVJUVFh4?=
 =?utf-8?B?dzJvMS9ROHJHcTlyLzVkcFRXSFVhZmxFMjFnek1HUEZjeWVKaTJPeEpIZnBF?=
 =?utf-8?B?L2Zmc3gxbGRZYTBzZ1pkZk1TbHpxc0o2K1RENEIvZXdtaFZ3UXYyUGdueG1X?=
 =?utf-8?B?Z3pROUJqdXFBVnAyQmEwMUZQU0pJcWE2UUxaY2x6ckhKYWpjL054T04wUGZD?=
 =?utf-8?B?d1NDUnNqL0FPUTlXQjIwUEZsRGZBVFZjejJCUGNwOEdsWWo0YTBPaDVBVEts?=
 =?utf-8?B?Ui9OTCt3NnQyZzdLbDNpdVZjUUZUaHplOThveHZLazRxNHROWGdhdHZPVHNz?=
 =?utf-8?B?SkpnQ2MwdkVSR0dDcUJPdDcvVlp4cDYzcEJ6d25EYWVsdGRLcU1YRUpsRVJr?=
 =?utf-8?B?amdDV2NOYWYrTTZmaWc1YldjTXJPMkFFTWU1NHM2aVRZTkkycXZWd2VuZGJy?=
 =?utf-8?B?cTJuYjg0MFZNeUYxMEJmZDhObVVaRGk0Y05RVmlVVGp3dWdCN1ljZmtmNkpM?=
 =?utf-8?B?UXVNMEZGeFJYWmZlZktSM0xXQVlTOWRhdklIcnpkZmlIMzkxa2p0aDlKN2VL?=
 =?utf-8?B?UVBVNEFwU0NOSFVVY3ZucjlQM0Jmd2QzRnY4TTBVbHZGNmlUb1VYWkcwRmZL?=
 =?utf-8?B?NzFwL0hiS0tUK1k0RUpNWXpubGY1YmU4Q3FhYmN2c0wrTndpcXRxMklyb2xX?=
 =?utf-8?B?Um9leHMwaW4wbzVSREorS2N0K1N4cUZYZEt3dEUyQ0JHcUhNY1dMTXpYZVY4?=
 =?utf-8?B?R2llei8wZ3AyRVI1azNRalZYS2NuNCtWNGc2Y0t0UVNNbmRqN3B0bHRhQkVr?=
 =?utf-8?B?NDhEbWpDRFBZa3E2QlZmNkp0b1BMUEhVVjYvTFNSck40alFiemdKd3M0a3F4?=
 =?utf-8?B?eXJSZDBjamVzaFNadk1jYVE1dHcyUXE4cDEvY0JqSTNNeWNKcGlhWVpBM0J1?=
 =?utf-8?B?ZzE0VExkZCtYNmM0WER6c3RnL0dpY2xyRlBNODF2REdoVDZIdjdmaUlxRG5n?=
 =?utf-8?B?RDFWcW5RUzU4a0gwVGIzdE9kU0RkeTY5dHVYaUpKSFRMMVo2MU1EbzNnODlN?=
 =?utf-8?B?U0lOYVJUVDdtTE9GR1A5VVE5dmY1aXl6R1pMeDZFT0xZdHpjN2F2VGhXQ2hn?=
 =?utf-8?B?VEVUNGtURncyRlQrRVVucVF0dnJwSFQ1SDF3NTZxaS9VM3V3WlRzTExGcm5i?=
 =?utf-8?B?R0FrLzdDN3MxbnpyTVozSWNFS2MxNThuOGhMVDhMRXRvcXVDa1R4d1Z2cy8z?=
 =?utf-8?B?VTRjRzNoQUNtYmt5NjlYRnJvUnJrV0xNWENZM0RvSEJzbURCam56RDkyM05a?=
 =?utf-8?B?eCtrckNFWkJqdE9VQ3VQZldET2JHd1JvZHhPU2Z1Ymh6N2JWYWxLQkxnQkhP?=
 =?utf-8?B?US9FdllnWEpIaStxeHYzMTRjWUNVV3ZuaUY1aXg2WU5oNE9JVEljL3NoZW5K?=
 =?utf-8?B?aXB0OGRKVXdiakxmcmxJMTdpSU80dEVTVUMzRzlZeDlwYTBMRW1XYVJrTFJU?=
 =?utf-8?B?OWxFMnBTU0dhRG9ObitHRzJDcnJyMFcyN2R1NjZEZ0Yxa1JIQ0JYdUo1Z0VP?=
 =?utf-8?B?TldVN3lhd2laRXBpOC9aMStUNk1XV2lmSXIzZWMwWlBjTWVac2F3RHhndTI0?=
 =?utf-8?B?Z1pTTUN0enJKSWZyN3J6R3RvV1dIcHQycUNVelYySDdUeXZHOXNFSm5NMm5t?=
 =?utf-8?B?WENmWlB6VFUza0lTUy9VbDAwTFYxdVpCVEx2bmlsRXZReE5HOS84UUwrTll4?=
 =?utf-8?B?NWZObDVIWFJUV0xldkFtR2VxaFdybEsxd2IrbnBQZllSdTRzS2tMTHpXbFp5?=
 =?utf-8?B?a2hlQ0dUM3BVdnAxdFplVlRwV0ZSbXBGY1V3UEEzZ05rSHBRM00yUHp5L1ZU?=
 =?utf-8?B?OXh5ZFFrczBYU2VmSDF3Tlo0L01JQmdaYkk3U1pLMU8zZ3lrSmdqNU44UEFu?=
 =?utf-8?B?ckRvQ2c0OXdYV3hlUDlKZWF5RHhDRWNybFAyZ2sxdm11WXNteE9NT2dTd3ph?=
 =?utf-8?B?ZXFRL0Y5Z3NjelFNRFlzZ3NzMmJ2cUt0VkRzZzdKRklsUlhGeFN6WW56bldR?=
 =?utf-8?B?MVpxc0E0VzlQM1JXVmhuVGVkTS80WUFxS2JiNHE2RUExWFlMWk9oTlFKTEVY?=
 =?utf-8?Q?4YTiNRocYchIy2civD8jJ64Td?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <429B1224EC58CA42A5AA213DF41249F5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566106d8-e041-45cf-55df-08db61d78087
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 13:04:00.4804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zx32+2ZQHpB0MF7EI4mDVn4Apkhz4lUCkWnafTJBuTMyGqHXY4CoVnzDYMY7PClvjbGNg5NzrgUzq50n9zyWWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] xe/xe_bo: Reject bo creation of unaligned
 size
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA1LTMxIGF0IDE0OjUyICswMjAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IE9uIEZyaSwgTWF5IDI2LCAyMDIzIGF0IDA1OjQwOjA4UE0gKzAyMDAsIFNvdXph
LCBKb3NlIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyMy0wNC0yMCBhdCAxMDo1MiArMDIwMCwgVGhv
bWFzIEhlbGxzdHLDtm0gd3JvdGU6DQo+ID4gPiArTWFhcnRlbg0KPiA+ID4gDQo+ID4gPiBIaSwg
WmJpZ25pZXcsIE1hdXJvDQo+ID4gPiANCj4gPiA+IE9uIDQvMTMvMjMgMDg6NTYsIFpiaWduaWV3
IEtlbXBjennFhHNraSB3cm90ZToNCj4gPiA+ID4gRnJvbTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFi
IDxtYXVyby5jaGVoYWJAbGludXguaW50ZWwuY29tPg0KPiA+ID4gPiANCj4gPiA+ID4gRm9yIHhl
IGJvIGNyZWF0aW9uIHdlIHJlcXVlc3QgcGFzc2luZyBzaXplIHdoaWNoIG1hdGNoZXMgc3lzdGVt
IG9yDQo+ID4gPiA+IHZyYW0gbWluaW11bSBwYWdlIGFsaWdubWVudC4gVGhpcyB3YXkgd2Ugd2Fu
dCB0byBlbnN1cmUgdXNlcnNwYWNlDQo+ID4gPiA+IGlzIGF3YXJlIG9mIHJlZ2lvbiBjb25zdHJh
aW50cyBhbmQgbm90IGFsaWduZWQgYWxsb2NhdGlvbnMgd2lsbCBiZQ0KPiA+ID4gPiByZWplY3Rl
ZCByZXR1cm5pbmcgRUlOVkFMLg0KPiA+ID4gDQo+ID4gPiBQZXJzb25hbGx5LCBJIHRoaW5rIHRo
ZSBhbGlnbm1lbnQgY29uc3RyYWludHMgaXMgYSBwcm9wZXJ0eSAvIA0KPiA+ID4gcmVzdHJpY3Rp
b24gb2YgdGhlIFhlIEdQVSBiaW5kaW5nIHRoYXQgc2hvdWxkIG5vdCBpbnRlcmZlcmUgd2l0aCBi
byANCj4gPiA+IGNyZWF0aW9uIC8gc2l6ZSB0aGF0IHNob3VsZCBpbnN0ZWFkIHJlZmxlY3QgdGhl
IHNpemUgb2YgdGhlIGRhdGEgd2UgbmVlZCANCj4gPiA+IHRvIHN0b3JlLiBTbyB0aGUgYWxpZ25t
ZW50IGNvbnN0cmFpbnRzIHNob3VsZCBhcHBseSBvbmx5IHRvIHRoZSBHUFUgVkEgDQo+ID4gPiBz
cGFjZSBhbGxvY2F0aW9uLiBUaGlzIHdvdWxkIGFsc28gbWFrZSB0aGUgc2VtYW50aWNzIG9mIGlt
cG9ydGluZyANCj4gPiA+IGRtYS1idWZzIG9mIHVuYWxpZ25lZCBzaXplIHN0cmFpZ2h0Zm9yd2Fy
ZC4NCj4gPiANCj4gPiBTZWNvbmRlZCENCj4gPiBJbiBteSBvcGluaW9uIGl0IHNob3VsZCBvbmx5
IHNldCB0aGUgc2l6ZSBhbGxvY2F0ZWQgYnkgWGUgS01EIGluIGRybV94ZV9nZW1fY3JlYXRlLnNp
emUgYW5kIGxlYXZlIHRoZSByZXN0IGFzIGlzLg0KPiA+IA0KPiANCj4gSSdtIHNvcnJ5IGJ1dCBJ
IGRvbid0IGZvbGxvdy4gV2hpY2ggc3RyYXRlZ3kgdGhlbiBzaG91bGQgYXBwbHk/IFRoaXMNCj4g
d2l0aCByZWplY3QgKGluIHRoaXMgcGF0Y2gpIG9yIGluDQo+IA0KPiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNTI5MjA0Lz9zZXJpZXM9MTE1NzI2JnJldj0xDQoNCklu
IG15IG9waW5pb24gd2Ugc2hvdWxkIGRvIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9wYXRjaC81MjkyMDQvP3Nlcmllcz0xMTU3MjYmcmV2PTENCg0KPiANCj4gPw0KPiAtLQ0KPiBa
Ymlnbmlldw0KPiANCj4gPiA+IA0KPiA+ID4gQWx0aG91Z2ggYWRtaXR0ZWRseSBJJ20gbm90IGZ1
bGx5IHVwLXRvLWRhdGUgd2l0aCB0aGUgZGlzY3Vzc2lvbiANCj4gPiA+IHByZWNlZGluZyB0aGUg
Y2hvaWNlIHRvIHJldHVybiAtRUlOVkFMIGlmIHRoZSBibyBzaXplIGlzIG5vdCBhbGlnbmVkIHRv
IA0KPiA+ID4gb3VyIEdQVSBiaW5kaW5nIGNvbnN0cmFpbnRzLiAoTWFhcnRlbiwgY291bGQgeW91
IHBlcmhhcHMgZmlsbCBpbj8pDQo+ID4gPiANCj4gPiA+IFRoYW5rcywNCj4gPiA+IA0KPiA+ID4g
VGhvbWFzDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWF1cm8uY2hlaGFiQGxpbnV4
LmludGVsLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tp
IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAg
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jIHwgMjMgKysrKysrKysrKysrKysrKy0tLS0tLS0N
Cj4gPiA+ID4gICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICB8ICA1ICsrLS0tDQo+ID4gPiA+
ICAgMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4g
PiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ID4gPiA+IGluZGV4IDNhYjQwNGUzM2ZhZS4u
ZDM5NzJjODRiY2NlIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Ym8uYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiA+ID4gPiBA
QCAtMTA5MCw2ICsxMDkwLDcgQEAgc3RydWN0IHhlX2JvICpfX3hlX2JvX2NyZWF0ZV9sb2NrZWQo
c3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4ZV9ibyAqYm8sDQo+ID4gPiA+ICAgCX07DQo+
ID4gPiA+ICAgCXN0cnVjdCB0dG1fcGxhY2VtZW50ICpwbGFjZW1lbnQ7DQo+ID4gPiA+ICAgCXVp
bnQzMl90IGFsaWdubWVudDsNCj4gPiA+ID4gKwlzaXplX3QgYWxpZ25lZF9zaXplOw0KPiA+ID4g
PiAgIAlpbnQgZXJyOw0KPiA+ID4gPiAgIA0KPiA+ID4gPiAgIAkvKiBPbmx5IGtlcm5lbCBvYmpl
Y3RzIHNob3VsZCBzZXQgR1QgKi8NCj4gPiA+ID4gQEAgLTEwOTgsMjIgKzEwOTksMzAgQEAgc3Ry
dWN0IHhlX2JvICpfX3hlX2JvX2NyZWF0ZV9sb2NrZWQoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0
cnVjdCB4ZV9ibyAqYm8sDQo+ID4gPiA+ICAgCWlmIChYRV9XQVJOX09OKCFzaXplKSkNCj4gPiA+
ID4gICAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiA+ID4gPiAgIA0KPiA+ID4gPiAtCWlm
ICghYm8pIHsNCj4gPiA+ID4gLQkJYm8gPSB4ZV9ib19hbGxvYygpOw0KPiA+ID4gPiAtCQlpZiAo
SVNfRVJSKGJvKSkNCj4gPiA+ID4gLQkJCXJldHVybiBibzsNCj4gPiA+ID4gLQl9DQo+ID4gPiA+
IC0NCj4gPiA+ID4gICAJaWYgKGZsYWdzICYgKFhFX0JPX0NSRUFURV9WUkFNX01BU0sgfCBYRV9C
T19DUkVBVEVfU1RPTEVOX0JJVCkgJiYNCj4gPiA+ID4gICAJICAgICEoZmxhZ3MgJiBYRV9CT19D
UkVBVEVfSUdOT1JFX01JTl9QQUdFX1NJWkVfQklUKSAmJg0KPiA+ID4gPiAgIAkgICAgeGUtPmlu
Zm8udnJhbV9mbGFncyAmIFhFX1ZSQU1fRkxBR1NfTkVFRDY0Sykgew0KPiA+ID4gPiAtCQlzaXpl
ID0gQUxJR04oc2l6ZSwgU1pfNjRLKTsNCj4gPiA+ID4gKwkJYWxpZ25lZF9zaXplID0gQUxJR04o
c2l6ZSwgU1pfNjRLKTsNCj4gPiA+ID4gKwkJaWYgKHR5cGUgIT0gdHRtX2JvX3R5cGVfZGV2aWNl
KQ0KPiA+ID4gPiArCQkJc2l6ZSA9IEFMSUdOKHNpemUsIFNaXzY0Syk7DQo+ID4gPiA+ICAgCQlm
bGFncyB8PSBYRV9CT19JTlRFUk5BTF82NEs7DQo+ID4gPiA+ICAgCQlhbGlnbm1lbnQgPSBTWl82
NEsgPj4gUEFHRV9TSElGVDsNCj4gPiA+ID4gKw0KPiA+ID4gPiAgIAl9IGVsc2Ugew0KPiA+ID4g
PiArCQlhbGlnbmVkX3NpemUgPSBBTElHTihzaXplLCBTWl80Syk7DQo+ID4gPiA+ICsJCWZsYWdz
ICY9IH5YRV9CT19JTlRFUk5BTF82NEs7DQo+ID4gPiA+ICAgCQlhbGlnbm1lbnQgPSBTWl80SyA+
PiBQQUdFX1NISUZUOw0KPiA+ID4gPiAgIAl9DQo+ID4gPiA+ICAgDQo+ID4gPiA+ICsJaWYgKHR5
cGUgPT0gdHRtX2JvX3R5cGVfZGV2aWNlICYmIGFsaWduZWRfc2l6ZSAhPSBzaXplKQ0KPiA+ID4g
PiArCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCWlmICgh
Ym8pIHsNCj4gPiA+ID4gKwkJYm8gPSB4ZV9ib19hbGxvYygpOw0KPiA+ID4gPiArCQlpZiAoSVNf
RVJSKGJvKSkNCj4gPiA+ID4gKwkJCXJldHVybiBibzsNCj4gPiA+ID4gKwl9DQo+ID4gPiA+ICsN
Cj4gPiA+ID4gICAJYm8tPmd0ID0gZ3Q7DQo+ID4gPiA+ICAgCWJvLT5zaXplID0gc2l6ZTsNCj4g
PiA+ID4gICAJYm8tPmZsYWdzID0gZmxhZ3M7DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gPiBp
bmRleCBiMGI4MGFhZTNlZTguLmQzZTY0YWY3ZWFiYiAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvaW5j
bHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hl
X2RybS5oDQo+ID4gPiA+IEBAIC0yNTksOSArMjU5LDggQEAgc3RydWN0IGRybV94ZV9nZW1fY3Jl
YXRlIHsNCj4gPiA+ID4gICAJX191NjQgZXh0ZW5zaW9uczsNCj4gPiA+ID4gICANCj4gPiA+ID4g
ICAJLyoqDQo+ID4gPiA+IC0JICogQHNpemU6IFJlcXVlc3RlZCBzaXplIGZvciB0aGUgb2JqZWN0
DQo+ID4gPiA+IC0JICoNCj4gPiA+ID4gLQkgKiBUaGUgKHBhZ2UtYWxpZ25lZCkgYWxsb2NhdGVk
IHNpemUgZm9yIHRoZSBvYmplY3Qgd2lsbCBiZSByZXR1cm5lZC4NCj4gPiA+ID4gKwkgKiBAc2l6
ZTogU2l6ZSBvZiB0aGUgb2JqZWN0IHRvIGJlIGNyZWF0ZWQsIG11c3QgbWF0Y2ggcmVnaW9uDQo+
ID4gPiA+ICsJICogKHN5c3RlbSBvciB2cmFtKSBtaW5pbXVtIGFsaWdubWVudC4NCj4gPiA+ID4g
ICAJICovDQo+ID4gPiA+ICAgCV9fdTY0IHNpemU7DQo+ID4gPiA+ICAgDQo+ID4gDQoNCg==
