Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7FEC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 15:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585BD10E148;
	Wed, 24 May 2023 15:20:57 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B6710E148
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 15:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684941655; x=1716477655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DhLRxJMgu+kSyHUMdaYrT/3dNGL5upCtHwg2AeuQQLc=;
 b=iJQDQlkKjOhrrmPWNrcwx8sIbC4yZpxtvRPKMsQD061Xx1ldSoCc/Yon
 0u3EYfXlpixyKlxPdb5rY/wZi2wZsENy3ZSu1Xf9JueFv0AyuyKf1NUjl
 UWPwnz7L748WeO+NIPj93QtuvwurKRDZ4n78lB5DUGU72+ALdLSACR0iU
 aci+a9hAwczFipJOp/Pnf52Wz4dKl5AgDQvrz+Ka8jOXC3MzB7Ae8CMm/
 6jlIYJsPVfPCO7i3e9b3Hj9sut/1crqFk3am7z3dKCnnTTpEbfaSeymmv
 Rw9PtBQSVAc0pFK1ARCpbgUxIbynNU0fj36NAU8pXrq00K76DqN4Fzs+G w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333221919"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="333221919"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 08:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="704394702"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="704394702"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 24 May 2023 08:20:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 08:20:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 08:20:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 08:20:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 08:20:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVR3kDJlQ6j2UKOrBcfgonOqkTq/f1uQ+0y8G3kPaD+CRkWvgI1Q8hEGruWWmuH3ql0uULL5bgyz7Y/g8g7tXDVyeU101ny2jAHpncayqkQbtQCZHdSTl6k++lpdf/XY7GprtXnhlHIotoXIbV/LrMrJSrZ4zX0knaISheKLNZNbz+MFSkN+RHvHr2l8HCHWAyiKpcbzAKKtyup/0E/1/8GURuxBl5m55xfSMMVpMkri5PcCDTtKV7dtKIAAdx2cE27ugfBFTi+lS52KnZwmLOaJqJy7iaTJhBmb7JWgwlMJ8SiGnHAv5LETcnCbGU7/2tnOhpBCxH8RNz95vuuWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhLRxJMgu+kSyHUMdaYrT/3dNGL5upCtHwg2AeuQQLc=;
 b=L1SY8rydZi752CuVIYhfB4G/nA7eJ3EWDFhXjpaYpODTSfQKX1XUnMHpP/K5IUODUSxqoEFi7bLe1e/tm5b5uVwPtys7mDJJlvoZKObsXzqq/28vG2RPqw58lMMVI6V4G2tV2DHg7tscfpF4nSvX1EDROOhXyBPtTwdFKH99zhhOTebbXPFfQsuZqal2MZYcFeKyGvOrggUuPVED/Lqp3g0EMZTgPxOimyEqhn6/tJiIovyV82rSM8FUKDTPYWJd5L5DEyZtHSxDityzBVL0VZhjWK3FWgpQtqHsPfs17bRYhq237pLEcUAhsUfi0ghMYsUAKcRjSJM0q41YW5zjQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA1PR11MB7131.namprd11.prod.outlook.com (2603:10b6:806:2b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 15:20:50 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 15:20:50 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "kode54@gmail.com" <kode54@gmail.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 1/2] drm/xe: Add explicit padding to uAPI definition
Thread-Index: AQHZjfBj5LMCEnxAU0G3ix6Ed9e37a9pisCA
Date: Wed, 24 May 2023 15:20:50 +0000
Message-ID: <69c27df0e4501668452f3748b99677fe1a4954c2.camel@intel.com>
References: <20230524033131.2000480-1-kode54@gmail.com>
 <20230524033131.2000480-2-kode54@gmail.com>
In-Reply-To: <20230524033131.2000480-2-kode54@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA1PR11MB7131:EE_
x-ms-office365-filtering-correlation-id: 633deed7-a6ff-4578-8934-08db5c6a7531
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Snwt0fW2S9J+xQ6UsEnkU1AgiR4/LjHenxTPyYABT14nlcBuh7QkU0BhHwMKFgVD6XQr2voCOplXfZCewVbIXX1XKdiFuLDkxtKH9hne8PfN2OMvfEPSJRSL4iOQwwhuJEDwbZnHUucBxLF/GXZeTlMz8R1MY9KLPS/rpxh7ffO0kWzbyM2Vzt0uSmE+1U7i0ALk7n5xyauXOFcOjq18Y5yaxUxjpzQF3O0YSFeO6Hn1UD8DM/odlv9/zKwzNJVby/+1uh7t5pNNRdNja5QYcPLIDuR34ywYfHsCNsgH+5oOFZV5XaF8+rIXmHUFk4re4kAIqqw5dCg2CwCNTTy2jzbZ8jQX2caddAzTzkizDgbrXbBryYMMQn4x3tAvfX5HIKMc/mxeRCw4DF2LqpnbpMDj6keD8fMTNXQLUvU9vVZRHMiETBL1KOC+pD/XZwRkiwXinNPzZ+0nZNWRwFNCMpvGJzsnd7/Qmn9g5sj0ZCCpXNDd9PqXad+LH+HisGu+XqcVmdW0EeZFafp4cdQZYoS6mw7gHYd8L/HEzjbpovzyo96Mg0iWxsEc+0yuxQ1RbW8r1ioAmomJUNyhmlvQqTVC6h11n0oB5FABPGIqYT4mHHBDgza49SOkwrQtD1Je
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199021)(6486002)(41300700001)(478600001)(110136005)(316002)(4326008)(91956017)(66556008)(66446008)(66946007)(66476007)(64756008)(71200400001)(76116006)(5660300002)(8936002)(86362001)(38070700005)(8676002)(107886003)(36756003)(38100700002)(122000001)(6506007)(26005)(82960400001)(6512007)(83380400001)(2906002)(186003)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkdKa011bXprUXBTT0l6S1B6Z3VwODJrRU9UNHFMZ0hxVGRoU3NnRFBUcmQ4?=
 =?utf-8?B?MCtkK1RGVXF3a01XcUdQczBuSjBFa05LNTNtRmR1WkV6TXgxckVnZFNSRS9P?=
 =?utf-8?B?YUVTVXkyRWk2MjVZbEtPLzBrT294ZTFXTE41d29WNFE1NDhXdmdIS0I0U1U5?=
 =?utf-8?B?Nzc0cnF0ZUhYL09iZE1LRUF1WVlsTHpTRXZOYzV5ZEp4Q3YxUXVNVlE0WllG?=
 =?utf-8?B?OXozekJrcVg2dDRuUlRMV013aG1UUGN4eWNueGpxSEdnUmhvMW94a1hPS0JY?=
 =?utf-8?B?dTRNTFdnc2kxVzExUGpFcytHRFBZSlllZnZGWThGUlRFckFqR0ZIUm9xMzNS?=
 =?utf-8?B?QzBxbURCM1VGVzhrNDgxTE5EQXMxaVpXYUZZZlh0bnA1dGlQdWJYZE80d01t?=
 =?utf-8?B?VTlrb2grZU1wcHczb3lXTDhPV2szcFQ1Tm1NWk5NU3hNTTBLdHZEWHhaTnhq?=
 =?utf-8?B?aW5HcFVHa3FNZHlFclpuQjR5UHdaYmlveUdwTTZVU3YvSGRhUy9TbFZoRjUx?=
 =?utf-8?B?RTFVUmRxWksxYWF6VTNoOXZvVlFWUHlWdVRDdDZlc3NpRmY2UWpVZjhnWm9h?=
 =?utf-8?B?UHlMdkJKcHo3K1AxcVh4WXpXUU8vQy9HbElUT2RkZTdwNVFuRmw2ZkZLN3h4?=
 =?utf-8?B?SnlhUkRqRktuRWVQYlh2ckZ1TnB4NmxKVmhQZWRRNmVuNy9xb1ZjeWxDcENN?=
 =?utf-8?B?VlRHcERNdUdhOGhqbm1PQ3RWY2RZUmc3VURTN29qUHlmcFdTUDR6S3Zkc2Qr?=
 =?utf-8?B?TjZMS2ZTcEtvVkZVN01jbE9sbnVHL2RpLzJldSttYTVteWQzVDRaOUVPS2tx?=
 =?utf-8?B?UkhHOHYzMGtaZ3ljQS9TbC8xcExPWUlGV3VXL2g3N3FhRjN2M2RhSkp6SEJZ?=
 =?utf-8?B?T1VuanBIR0xpSlF5Y0tjdlNFWGkvM1RRSjNFVTRYY3l6VGZwLzlOaTVNZnIv?=
 =?utf-8?B?TkxOb2VvZkkyS0pUeTRiRkQ1WFAxQTFldy9DdXN2a2k1YVJ2UFU2Rjd2eFZy?=
 =?utf-8?B?d2dSKzdLYWtwRHA0STJvVTlpT1lkb3VHQ0g3c0hXNG02S2Nvb1E4aHY0K3Ax?=
 =?utf-8?B?VUgrVlUxRHQ4STVWbHVJaGVrN0dVMGEycXRnM083VndadUl4cjlmdm4wNW5u?=
 =?utf-8?B?QWVpZjB3cUdkSVJwWEprZkptd3BXcytMU0gyQUQvWXFrRm4zQ2tOcjFWbXls?=
 =?utf-8?B?a0ROY2xmVmV1MTFvSWp5TUtzSXdpYU0rYzVwUUpLcDc4R3ZGOG9Qd1lqRTJB?=
 =?utf-8?B?SXp2SGxQWUh5OHMyZFRockVTTUhxcEwzRFQzdVdUSWVpU0lTbkhZYXpKREpS?=
 =?utf-8?B?TlpPcVYxUDVVUXF3Q2NqVVAzSC9sd1RTRE1rVTFHdWhObEMrU0hEV01SYmZS?=
 =?utf-8?B?N3NjZWYxTWZzYm5nQU1BVStMK1pqRm1sQjB3N0ZHcUtNRzhYcGEzVXRvT2N3?=
 =?utf-8?B?cnF3RW50aStWY2YvRmU2NGpKWit1eDZnckxmeUdjbG9vc3pSSWJzVFB5WGtu?=
 =?utf-8?B?dVg4U0JZZ0VkMnZvUGJqZmFRYlJXMzlGSUhnUXJRZzJ1OFh0UHZUSHVNYWtw?=
 =?utf-8?B?dmVPbzdtR3RaS1V3VzdQZGdxQWU0TDVPNTV2dmNwaXJNd2g2UnI0NDIvOXVr?=
 =?utf-8?B?b1BnbDhaKzMzbHZoK2tsdnlyUE94YU5HYklnd080N29oU0RsZjgzQ1FEUTd6?=
 =?utf-8?B?c3ZUaTFkMElwc1lHUXBIdXFxcGVyUVBLOXUrSDgwNUN6SHBLTmJSLzIxalQ4?=
 =?utf-8?B?ZU1pUDUwQXo5dGlzWWFMMERFTGlKZjdQdEEyZkU2RE1FQ1dhelFQc2pTT3Ey?=
 =?utf-8?B?V2hGOENJRUhkNXNvTkFTUk5XTS9GV09xT0dPWkV0OHRkQTd1YTN2UEFKeml0?=
 =?utf-8?B?ekV6QnVVK3ArYlk5OTRtaDV6Yy9xVFVPbUhiWUlkNnZJVm9rZGdHMFVEVmxP?=
 =?utf-8?B?ZGQ0R1BFMU9RMlpLYVcvbmhuNUF0Q0h5ZXJZZ2p5aVpBSkNzSFdOa1pHQ0hH?=
 =?utf-8?B?Nm9qWlYxTk0yQWdwQnFDKy92dVVVWTB4MldTaU1UWEVlNi9xMTVicW45dk1S?=
 =?utf-8?B?aWI5MjlJV1BIdHlUMURtaG9JY0tuenFJcDdMYVhqUXpWejI4WkdzdUtjQ2ZQ?=
 =?utf-8?Q?GAN7paR7/IwhmHAf24s2lFPud?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F879189D1E7C047A511663C06D4C0DB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633deed7-a6ff-4578-8934-08db5c6a7531
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2023 15:20:50.5025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YFP7q/zN4xfdif642K24tnDoN/xV4//sLmhPqLw+pLM9ELDAZpTNtIflOosF0hgi4Z0CA2Dr7CjPTmf1KnNznQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7131
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add explicit padding to uAPI
 definition
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

T24gVHVlLCAyMDIzLTA1LTIzIGF0IDIwOjMxIC0wNzAwLCBDaHJpc3RvcGhlciBTbm93aGlsbCB3
cm90ZToNCj4gUGFkIHRoZSB1QVBJIGRlZmluaXRpb24gc28gdGhhdCBpdCB3b3VsZCBhbGlnbiBp
ZGVudGljYWxseSBiZXR3ZWVuDQo+IDY0LWJpdCBhbmQgMzItYml0IHVhcmNoLCBzbyBjb25zdW1l
cnMgdXNpbmcgdGhpcyBoZWFkZXIgd2lsbCB3b3JrDQo+IGNvcnJlY3RseSBmcm9tIDMyLWJpdCBj
b21wYXQgdXNlcnNwYWNlIG9uIGEgNjQtYml0IGtlcm5lbC4gRG8gaXQNCj4gaW4gYSBtaW5pbWFs
bHkgaW52YXNpdmUgd2F5LCBzbyB0aGF0IDY0LWJpdCB1c2Vyc3BhY2Ugd2lsbCBzdGlsbA0KPiB3
b3JrIHdpdGggdGhlIHByZXZpb3VzIGhlYWRlciwgYW5kIHNvIHRoYXQgbm8gZmllbGRzIHN1ZGRl
bmx5DQo+IGNoYW5nZSBzaXplcy4NCj4gDQo+IE9yaWdpbmFsbHkgaW5zcGlyZWQgYnkgbWxhbmto
b3JzdC4NCj4gDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNv
dXphQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBTbm93aGlsbCA8
a29kZTU0QGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIHwg
MzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDMzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBpbmRl
eCBiMGI4MGFhZTNlZTguLmQ1ZmM1NGI1YmU3NCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91YXBp
L2RybS94ZV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IEBAIC05
MSw3ICs5MSw3IEBAIHN0cnVjdCB4ZV91c2VyX2V4dGVuc2lvbiB7DQo+ICAJICovDQo+ICAJX191
MzIgbmFtZTsNCj4gIAkvKioNCj4gLQkgKiBAZmxhZ3M6IE1CWg0KPiArCSAqIEBwYWQ6IE1CWg0K
PiAgCSAqDQo+ICAJICogQWxsIHVuZGVmaW5lZCBiaXRzIG11c3QgYmUgemVyby4NCj4gIAkgKi8N
Cj4gQEAgLTI5MSw2ICsyOTEsOSBAQCBzdHJ1Y3QgZHJtX3hlX2dlbV9jcmVhdGUgew0KPiAgCSAq
Lw0KPiAgCV9fdTMyIGhhbmRsZTsNCj4gIA0KPiArCS8qKiBAcGFkOiBNQlogKi8NCj4gKwlfX3Uz
MiBwYWQ7DQo+ICsNCj4gIAkvKiogQHJlc2VydmVkOiBSZXNlcnZlZCAqLw0KPiAgCV9fdTY0IHJl
c2VydmVkWzJdOw0KPiAgfTsNCj4gQEAgLTMzNSw2ICszMzgsOSBAQCBzdHJ1Y3QgZHJtX3hlX2V4
dF92bV9zZXRfcHJvcGVydHkgew0KPiAgI2RlZmluZSBYRV9WTV9QUk9QRVJUWV9CSU5EX09QX0VS
Uk9SX0NBUFRVUkVfQUREUkVTUwkJMA0KPiAgCV9fdTMyIHByb3BlcnR5Ow0KPiAgDQo+ICsJLyoq
IEBwYWQ6IE1CWiAqLw0KPiArCV9fdTMyIHBhZDsNCj4gKw0KPiAgCS8qKiBAdmFsdWU6IHByb3Bl
cnR5IHZhbHVlICovDQo+ICAJX191NjQgdmFsdWU7DQo+ICANCj4gQEAgLTM3OSw2ICszODUsOSBA
QCBzdHJ1Y3QgZHJtX3hlX3ZtX2JpbmRfb3Agew0KPiAgCSAqLw0KPiAgCV9fdTMyIG9iajsNCj4g
IA0KPiArCS8qKiBAcGFkOiBNQlogKi8NCj4gKwlfX3UzMiBwYWQ7DQo+ICsNCj4gIAl1bmlvbiB7
DQo+ICAJCS8qKg0KPiAgCQkgKiBAb2JqX29mZnNldDogT2Zmc2V0IGludG8gdGhlIG9iamVjdCwg
TUJaIGZvciBDTEVBUl9SQU5HRSwNCj4gQEAgLTQ2OSw2ICs0NzgsOSBAQCBzdHJ1Y3QgZHJtX3hl
X3ZtX2JpbmQgew0KPiAgCS8qKiBAbnVtX2JpbmRzOiBudW1iZXIgb2YgYmluZHMgaW4gdGhpcyBJ
T0NUTCAqLw0KPiAgCV9fdTMyIG51bV9iaW5kczsNCj4gIA0KPiArCS8qKiBAcGFkOiBNQlogKi8N
Cj4gKwlfX3UzMiBwYWQ7DQo+ICsNCj4gIAl1bmlvbiB7DQo+ICAJCS8qKiBAYmluZDogdXNlZCBp
ZiBudW1fYmluZHMgPT0gMSAqLw0KPiAgCQlzdHJ1Y3QgZHJtX3hlX3ZtX2JpbmRfb3AgYmluZDsN
Cj4gQEAgLTQ4Miw2ICs0OTQsOSBAQCBzdHJ1Y3QgZHJtX3hlX3ZtX2JpbmQgew0KPiAgCS8qKiBA
bnVtX3N5bmNzOiBhbW91bnQgb2Ygc3luY3MgdG8gd2FpdCBvbiAqLw0KPiAgCV9fdTMyIG51bV9z
eW5jczsNCj4gIA0KPiArCS8qKiBAcGFkMjogTUJaICovDQo+ICsJX191MzIgcGFkMjsNCj4gKw0K
PiAgCS8qKiBAc3luY3M6IHBvaW50ZXIgdG8gc3RydWN0IGRybV94ZV9zeW5jIGFycmF5ICovDQo+
ICAJX191NjQgc3luY3M7DQo+ICANCj4gQEAgLTQ5Nyw2ICs1MTIsOSBAQCBzdHJ1Y3QgZHJtX3hl
X2V4dF9lbmdpbmVfc2V0X3Byb3BlcnR5IHsNCj4gIAkvKiogQHByb3BlcnR5OiBwcm9wZXJ0eSB0
byBzZXQgKi8NCj4gIAlfX3UzMiBwcm9wZXJ0eTsNCj4gIA0KPiArCS8qKiBAcGFkOiBNQlogKi8N
Cj4gKwlfX3UzMiBwYWQ7DQo+ICsNCj4gIAkvKiogQHZhbHVlOiBwcm9wZXJ0eSB2YWx1ZSAqLw0K
PiAgCV9fdTY0IHZhbHVlOw0KPiAgfTsNCj4gQEAgLTYxMiw2ICs2MzAsOSBAQCBzdHJ1Y3QgZHJt
X3hlX3N5bmMgew0KPiAgI2RlZmluZSBEUk1fWEVfU1lOQ19VU0VSX0ZFTkNFCQkweDMNCj4gICNk
ZWZpbmUgRFJNX1hFX1NZTkNfU0lHTkFMCQkweDEwDQo+ICANCj4gKwkvKiogQHBhZDogTUJaICov
DQo+ICsJX191MzIgcGFkOw0KPiArDQo+ICAJdW5pb24gew0KPiAgCQlfX3UzMiBoYW5kbGU7DQo+
ICAJCS8qKg0KPiBAQCAtNjU2LDYgKzY3Nyw5IEBAIHN0cnVjdCBkcm1feGVfZXhlYyB7DQo+ICAJ
ICovDQo+ICAJX191MTYgbnVtX2JhdGNoX2J1ZmZlcjsNCj4gIA0KPiArCS8qKiBAcGFkOiBNQlog
Ki8NCj4gKwlfX3UxNiBwYWRbM107DQo+ICsNCj4gIAkvKiogQHJlc2VydmVkOiBSZXNlcnZlZCAq
Lw0KPiAgCV9fdTY0IHJlc2VydmVkWzJdOw0KPiAgfTsNCj4gQEAgLTcxOCw2ICs3NDIsOCBAQCBz
dHJ1Y3QgZHJtX3hlX3dhaXRfdXNlcl9mZW5jZSB7DQo+ICAjZGVmaW5lIERSTV9YRV9VRkVOQ0Vf
V0FJVF9BQlNUSU1FCSgxIDw8IDEpDQo+ICAjZGVmaW5lIERSTV9YRV9VRkVOQ0VfV0FJVF9WTV9F
UlJPUgkoMSA8PCAyKQ0KPiAgCV9fdTE2IGZsYWdzOw0KPiArCS8qKiBAcGFkOiBNQlogKi8NCj4g
KwlfX3UzMiBwYWQ7DQo+ICAJLyoqIEB2YWx1ZTogY29tcGFyZSB2YWx1ZSAqLw0KPiAgCV9fdTY0
IHZhbHVlOw0KPiAgCS8qKiBAbWFzazogY29tcGFyaXNvbiBtYXNrICovDQo+IEBAIC03NTAsNiAr
Nzc2LDkgQEAgc3RydWN0IGRybV94ZV92bV9tYWR2aXNlIHsNCj4gIAkvKiogQHZtX2lkOiBUaGUg
SUQgVk0gaW4gd2hpY2ggdGhlIFZNQSBleGlzdHMgKi8NCj4gIAlfX3UzMiB2bV9pZDsNCj4gIA0K
PiArCS8qKiBAcGFkOiBNQlogKi8NCj4gKwlfX3UzMiBwYWQ7DQo+ICsNCj4gIAkvKiogQHJhbmdl
OiBOdW1iZXIgb2YgYnl0ZXMgaW4gdGhlIFZNQSAqLw0KPiAgCV9fdTY0IHJhbmdlOw0KPiAgDQo+
IEBAIC03OTQsNiArODIzLDkgQEAgc3RydWN0IGRybV94ZV92bV9tYWR2aXNlIHsNCj4gIAkvKiog
QHByb3BlcnR5OiBwcm9wZXJ0eSB0byBzZXQgKi8NCj4gIAlfX3UzMiBwcm9wZXJ0eTsNCj4gIA0K
PiArCS8qKiBAcGFkMjogTUJaICovDQo+ICsJX191MzIgcGFkMjsNCj4gKw0KPiAgCS8qKiBAdmFs
dWU6IHByb3BlcnR5IHZhbHVlICovDQo+ICAJX191NjQgdmFsdWU7DQo+ICANCg0K
