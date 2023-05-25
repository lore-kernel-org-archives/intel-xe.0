Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1BAC77B7E
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 19:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA50C10E741;
	Thu, 25 May 2023 19:44:03 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4DF10E034
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 19:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685043841; x=1716579841;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ypwdKhhqo5fF/85fgq4pDz4O/3SnVKNBHOpxUNaM+M8=;
 b=LiyKxi8fI02ZsXU4Y6i8pH+4Vwo1vYI+b6VhvvFd2Xxe12vc+J++8feM
 ppT8P+75HtPwdCEWQehyBm0ncrqaSnNXOhAJdaHEmCIh5hH/Q+YwxsPKl
 sulnfpN9urgPmK+lwccwXM2jEJDzUu1ytAPBKNPpCRPxg5PfQ0R0BCKw8
 ATE/MVUcfWII2l07VImQv503zZO96U4QNz0Ehy+UfyePRLF+cBGYTHg6M
 /HJNtU1iPOhY5mZSoURIdPthqKyBEPloQFTYqal0Q2evp5d4nGZjVTvk3
 T5bBQFeBmCi0fJJ9RiAg+hmMamtLq9FBcNrAQthM5/c4QNGlgpSrvRLH0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="333626365"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="333626365"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 12:44:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737939391"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737939391"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 25 May 2023 12:44:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 12:44:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 12:44:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 12:43:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSBZxBhFoR6hD1hbbWSDaonAdXCodpMlQojWW470h7BNv/31k/o/ZA6j4gRsbEboYz1ZRTBjasVqcFwVSMQ+ffEyfNlYFinEmMAjCKl7/OL9y+C8XI5UzuJmSR6L09PXkjl44nb4pqIhcFKilvR5zVsm+a9mfKCr0p1k3TcMSTjkkpFAv/joS2+9kH8VO/FbC9q9XRd+mHLyEFdCdF+voaRvKrs5VHq/aoO6HMyubtLomoEkB2qKHFGKV2vM9vbsUuAGKVsWReioEI9I+C6UBpfUHlIO1Jue00eO2xF/LYuCfMglTeu88lkioM6vLKCCk7JjqySGYB9ydLophXvOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypwdKhhqo5fF/85fgq4pDz4O/3SnVKNBHOpxUNaM+M8=;
 b=Aszesgjlq1o4QhM+G56HfA7T+l4wMLnVF4jghwYtoW9cI9JG183rnSDtdWEBePSSy1wYUwe+UzSaVTF0ijPYWAn3m3Kh0pf2OcvtwAfZKx8gZcmiBg/oGE2hoH0DvWRT0VJPyP7gv+hPy7DR21PSBAdHgbR/sypRjYjLhMAeqtfClQOhTqSmjEMfSjMhu9C8wmFjCgTbWct2FES4VvgeotP4LMY6TFt0VGroVVjC84YmvgrFsrqjdu6KZnNLLzr5d9LILlzNl7nchWqQ1JFExlNddx3HoNq9ksODaxBe1RlpN0UHs/UgPQ/z2jwu0Dx7muFTUrypQqhHm/kPGgEMMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH0PR11MB5460.namprd11.prod.outlook.com (2603:10b6:610:d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 19:43:57 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 19:43:57 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "kode54@gmail.com" <kode54@gmail.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 0/2] Update Xe uAPI in a minimally invasive
 way
Thread-Index: AQHZjqwfKfiIn+DR10+1CO+1iyKMRa9q+zoAgAAeaoCAAAnAgIAAORgAgAAIpQA=
Date: Thu, 25 May 2023 19:43:57 +0000
Message-ID: <cd0ce7292aee8d8453477c32d47cecf6ce552682.camel@intel.com>
References: <20230525015607.2192395-1-kode54@gmail.com>
 <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
 <can3buqui3msmblc7bkxo7mb5nfwpdlmsg7abo4sit2hqgpc33@rukg2yblkk67>
 <1918VR.US05UYXGP19H3@gmail.com>
 <3bpbea4zj7y2h66rn4vzb2vum5klwtbn2jtn5imlf2kov36zzf@knqmclpzpstx>
In-Reply-To: <3bpbea4zj7y2h66rn4vzb2vum5klwtbn2jtn5imlf2kov36zzf@knqmclpzpstx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH0PR11MB5460:EE_
x-ms-office365-filtering-correlation-id: 48c4d6d3-a683-4dbb-35d7-08db5d58612a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7eairTetNJxpXDV6tnOelYesgJNPuzth+J9Xg9W2Aci+sbi3h7jbAobELSr1MtQIfQ/JInppZVuh22CKDs9ZzLLmek1HE0Yx4xzAAK+s1CZjvazlKx9kujRlRxKPKZf8KgH4/0HZwHbNA4l1Q01yvMX/aX04ED1aLN1mxOMXG7rPBii/wkV58NDD9MA8ZYShBpWe5Ia5b1sdCLAy4e5L0Nc5axhlNauIedRvVki42yJHzsp7rK7JsLR1unz/exsiBbQNM1hIMqXhDFOlFuTYKUPvV7RU6wOt9AXcQnlbteCas8WzAI6bF87xwdoO/3rnpWYWQnkKLRo7+6ykYu7CKIiQQEUmLZTQ5zh84VlyogQ8t+zIvMEk1i9CgKaPo0Slly/iXqZnLFV7OBGcZkAknUuedUd0sTaE9DlKvz2mUo1iULNqQ74jSNakm74lwJ+t89eC2mYNXg3Tb/NCy1y0Fv7GI/SUZMP5Qm1E1YI+tc9LwAJBgAnCY95L51HzrPI1Oo7U+RIEDq9FG7+NfZjUV6Z5umaHQbZJyZQ75FwGDIvcEpqv0zdYAwBr7b0w0M/QjVHrjmeBvhHGCiyLOZqQ1TWzFoeh82HgbFGqsQF0kwtx3jWNCKWzetzfAHMpLCJV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199021)(91956017)(66476007)(66946007)(66556008)(66446008)(64756008)(76116006)(478600001)(54906003)(6636002)(4326008)(110136005)(316002)(38070700005)(86362001)(36756003)(83380400001)(2616005)(107886003)(6506007)(6512007)(186003)(26005)(41300700001)(5660300002)(8676002)(8936002)(15650500001)(2906002)(6486002)(71200400001)(38100700002)(82960400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDhSazBueHBtODdpaklJYU5OZmFybmF1QyttZW5rQzh1NGxhT0gyNFRKZmd4?=
 =?utf-8?B?UFN2ZnRld1JJZ2FTbmpmOFRqYjg4NWdnTTE2NHZVVGJ6NnVWNWFDbjRpYTJ1?=
 =?utf-8?B?aFFrdVBOQU9rNjkvcUVKaStHQVQ0clFKT1RzckhIYW00S0t2QitRcVRxTTg3?=
 =?utf-8?B?alpib1pjamdidlBUQngrbTRkSTFNSXpnSVpiWmduVGVpcXp2NkQ5TkVQZnNu?=
 =?utf-8?B?R0NVYnplOG1VTGtUTjVNbnhTVnVxYXUwQkpnT1pUT1JkclJubmZiamFYd09E?=
 =?utf-8?B?c3UwTFdTTkhyVmRYend1aVR3MzkxZTBCRk1uWTZoMWJZNVQ1am1lanRvZTh6?=
 =?utf-8?B?QkcwZzQ5WU9SdXo3TkdDdXlvUkNHaWRtNEowT24wMUpRa3lOR3I3U2pKakZ3?=
 =?utf-8?B?ZXU4Q2JDNTdDK3B4bmwvR3hSNUllSkd4YXcwRDNJbjJSVkdEY2hJRVd3NkF5?=
 =?utf-8?B?YmZlZFUzVG5ZdDhSbkZlMmd1QkF1WlB2Nk13b3ZsUkl0UmFFRWluNDZUMXBV?=
 =?utf-8?B?M3ZCNnM4dmVIQ0FaYTMvRHVZUURGSTU1V0lvU0RvTFlyVkxzRjR4UDZYVjVY?=
 =?utf-8?B?bWFDWDl6TzNFejhlenRYSG1YdE5LQmhVYUpiU053YkRGb2VqSHlyMkc5a3dl?=
 =?utf-8?B?WW9sSmVOZURDYmNqZ2NWQ25WV20rdzNwUVJtV1h5cVVCMW5uSUlaWnZEb2N0?=
 =?utf-8?B?MjJPeWhhMk01RWY3ZW5kSlROeWMzSHQxbkdJSURCNjRSZ3dpQ1d2a1JHcytY?=
 =?utf-8?B?K0ZLbSs3d2o1bTRjWngvZzVta0lZekNkcENxMFoxbkdPUGQxb2h5Q3ZpdHRl?=
 =?utf-8?B?VmVQVUU0QUNsTkdtODFZaXBJWkhjK1FIT1huZGRwOG9qbnlQZ0lFV21XRDZE?=
 =?utf-8?B?NnRqR1JlbDk1SS9QL09xSklPaEVMRWZabHh0VDZyQW54eDVOWmpCTlludzVo?=
 =?utf-8?B?disraldxSEdjckF1QUxLTHZFU2Y2em1PQzc0R3dpNXdraGs2aVAvdEhUUjdz?=
 =?utf-8?B?dFVTTHVzZ0I2OEVCSVZhUEViekNKMHRLbzV2bnN3OTBJOE1oQWE4TGsvbmFY?=
 =?utf-8?B?Rmx2RkpTcWhmdFQ3c09MM25yck92ZmFGcHdacjBhYSt4ZXE2SkR2ajg2WXFk?=
 =?utf-8?B?WUUwalBoWXJWV2JSSlExeWgvV3dxWlcxdlErOXZROVRxWFZJNVAraXVNZWw0?=
 =?utf-8?B?ck9HYUF5N2orbkl6NERFU21Ld1JQM1RaTU5TZEVxZDNiZnJDNEcrNWZMVkFH?=
 =?utf-8?B?NndhY1Y1NFNqTGxUNW45ZnorMUNFeW1RUkpqN1B5UU5aZ2kwTm9KZG9oWCtr?=
 =?utf-8?B?TEhJYVZFTGtDbWtFRjhLZThma0tSdGk2N2k1Z3FUbGp2dmVWczNZK1h4d0Fp?=
 =?utf-8?B?SnpwRjVXZlJhQlN0eXB1WFYvcDJCV3M0MXRraVNxcTlCeldNU0Q1Q1llcW4y?=
 =?utf-8?B?VW5uRTBvYTFDYkJOaldkejlET0UxK2tORHhzOTFvd2dlUG1STGJlbE1rLzVK?=
 =?utf-8?B?MllmdGlNMnhTN2x4NGszZm5FeGIrWk5sVXJQZzh0Vno0SXBvL29mckhWZ0ZH?=
 =?utf-8?B?YkV3WWp5QzJOOWhzRWdtVVlXRzI5a3ZCQUV6Q3hkTS9pRGpsd1NtaFY3YjBl?=
 =?utf-8?B?SE5kUCsxL2JrSlV6akNXSzJjSW9Zenh4QUhWMUFES2p3RWxmRGM0VVN0RkFn?=
 =?utf-8?B?WW1xZkh4Vks0Vm5uMGtJajFhQnNlMDhVS1N6S0FVcUVqTzN0Y2NhcnBQbE4r?=
 =?utf-8?B?Q1RmSmFyc001M0JwUnlxWFZzU0JpbkpPVTd0QmFaSHphRCt3dVg2bURrSlNx?=
 =?utf-8?B?aG9ZOHNKc0JBeVBDSkNFVFNrQldYejAyVFFQRWtqTW1HZlJuZGdEdlMveHdG?=
 =?utf-8?B?aG5GUGJaUUUvN0pZZEtxeHVwVTdMSVZERnRiaC95dUNPcnVHemp0VWJheHJI?=
 =?utf-8?B?NlhrRVlWeTJmWnhENnAxQUQwY0FJc3l5d2RQUFdNeC9rendZY2tmSHJyanJk?=
 =?utf-8?B?eGpPNUpWd3BaT3R3empUdWhoM3BZTXUyeVo4RUIrY0lENkVzQ3IrU3ZuQkRB?=
 =?utf-8?B?TlZWL2lzUlNjTjg2MFYvY1RiR0pWYUdoMG5WRElHQzFDZ0xjU2ZFNGJVVEp5?=
 =?utf-8?Q?SP3PaYZAvLMsVPPrio78jI5bG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFDC34669E9CF1498F07E66A5614C5E0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c4d6d3-a683-4dbb-35d7-08db5d58612a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 19:43:57.1690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijChwNyDN+1MYcfewnFxJXGl21Jx7z1JFdoJ6w2EoMYTQKynvPRYpNwXwHKpAJFXJzZ/EKoL2vkMkN3i5LYGsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5460
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/2] Update Xe uAPI in a minimally
 invasive way
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
Cc: "Hazubski, Filip" <filip.hazubski@intel.com>, "Yu,
 Effie" <effie.yu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA1LTI1IGF0IDEyOjEyIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFRodSwgTWF5IDI1LCAyMDIzIGF0IDA4OjQ4OjM3QU0gLTA3MDAsIGtvZGU1NEBnbWFp
bC5jb20gd3JvdGU6DQo+ID4gDQo+ID4gDQo+ID4gT24gVGh1LCBNYXkgMjUgMjAyMyBhdCAwODox
Mzo0MyBBTSAtMDc6MDA6MDAsIEx1Y2FzIERlIE1hcmNoaSANCj4gPiA8bHVjYXMuZGVtYXJjaGlA
aW50ZWwuY29tPiB3cm90ZToNCj4gPiA+IE9uIFRodSwgTWF5IDI1LCAyMDIzIGF0IDAxOjI0OjU1
UE0gKzAwMDAsIEpvc2UgU291emEgd3JvdGU6DQo+ID4gPiA+IEhpDQo+ID4gPiA+IA0KPiA+ID4g
PiBQbGFubmluZyB0byBwdXNoIHRoaXMgdG9kYXksDQo+ID4gPiA+IENocmlzdG9waGVyIGFscmVh
ZHkgaGF2ZSBzZW50IHRoZSBNZXNhIE1SIGFuZCBJR1QgcGF0Y2ggc2VyaWVzLg0KPiA+ID4gDQo+
ID4gPiB0aGUgd2hvbGUgcG9pbnQgb2YgdGhpcyBzZXJpZXMgaXMgYmVpbmcgYWJsZSB0byBmaXgg
aXQgd2l0aG91dCANCj4gPiA+IGhhdmluZyB0bw0KPiA+ID4gc3luY2hyb25pemUgd2l0aCB0aGUg
bWVzYSAvIG1lZGlhIC8gaWd0IC8gaW50ZWwtY29tcHV0ZSB1cGRhdGVzLiBUaGVyZQ0KPiA+ID4g
YXJlIHNvbWUgcmVvcmRlcmluZyBpbiB0aGUgc3RydWN0cyB0aGF0IHdvdWxkIGJldHRlciBiZSBk
b25lIGJlZm9yZQ0KPiA+ID4gYXBwbHlpbmcgdXBzdHJlYW0gYW5kIHdoZW4gdGhhdCBpcyBkb25l
LCB0aGVuIHdlIG5lZWQgdG8gc3luYyBhbGwgdGhlDQo+ID4gPiBVTURzLiBCdXQgbm90IGZvciB0
aGlzLg0KPiA+IA0KPiA+IFVuZm9ydHVuYXRlbHksIGFsbCB1c2Vyc3BhY2Ugc29mdHdhcmUgd2hp
Y2ggaXMgYWxzbyBidWlsdCBmb3IgbXVsdGlsaWIgDQo+ID4gbXVzdCBzeW5jaHJvbml6ZSB3aXRo
IHRoaXMgY2hhbmdlLCBvciBlbHNlIHRoZWlyIDMyLWJpdCB1c2Vyc3BhY2Ugd2lsbCANCj4gPiBz
aW1wbHkgZmFpbC4gSW4gbXkgZXhwZXJpZW5jZSwgYXBwcyBjb25zdW1pbmcgTWVzYSAzMi1iaXQg
d2l0aG91dCB0aGlzIA0KPiA+IGNoYW5nZSB3aWxsIGZhaWwgc3BlY3RhY3VsYXJseSwgb2Z0ZW4g
Y3Jhc2hpbmcgb24gc3RhcnR1cC4NCj4gPiANCj4gPiBJIHN1cHBvc2Ugb25seSBNZXNhIHJlYWxs
eSBtYXR0ZXJzLCBzaW5jZSBtb3N0IHVzZXJzIHdvbid0IGJlIA0KPiA+IGluc3RhbGxpbmcgcHJv
cHJpZXRhcnkgc29mdHdhcmUgdGhhdCBjb25zdW1lcyAzMi1iaXQgT3BlbkNMIG9yIFZBLUFQSSwg
DQo+ID4gYnV0IHRoZXJlIG1heSB5ZXQgYmUgY2FzZXMgZm9yIHRoYXQuIFRoaXMgaXMgdXN1YWxs
eSBwcm9wcmlldGFyeSANCj4gPiBzb2Z0d2FyZSwgb2Z0ZW4gaW52b2x2aW5nIHVzZSBvZiBXaW5l
LCBzdWNoIGFzIFN0ZWFtJ3MgUHJvdG9uIA0KPiA+IGRpc3RyaWJ1dGlvbi4NCj4gDQo+IHllcywg
YnV0IDMyYml0IHdhcyBuZXZlciBwcm9wZXJseSBzdXBwb3J0ZWQgYmVmb3JlIHRoaXMgcGF0Y2gu
IFNvIGlmDQo+IHRoZXkgZG9uJ3Qgc3luY2hyb25pemUsIHRoZXkgd2lsbCBjb250aW51ZSBpbiB0
aGUgY3VycmVudCBzdGF0ZSBvZg0KPiBub3Qgd29ya2luZyBhdCBhbGwuDQo+IA0KPiBBbmQgSSdk
IHN0aWxsIHRyeSB0byBwYWNrIHRoZSBzdHJ1Y3RzIHByb3Blcmx5IGJlZm9yZSBoYXZpbmcgdGhl
DQo+IGRlZmluaXRlIHVhcGkgaW4gcGxhY2UsIHdoaWNoIG9ubHkgaGFwcGVucyB3aGVuIHRoaXMg
YWxsIGlzIG1lcmdlZA0KPiB1cHN0cmVhbSwgd2hpY2ggaXMgKlRIRSogbW9zdCBpbXBvcnRhbnQg
c3luY2hyb25pemF0aW9uIHBvaW50Lg0KPiBJIGFsc28gc3luYydlZCB3aXRoIEpvc2UgdG8gY2xh
cmlmeSBvbiB0aGF0Lg0KPiANCj4gSSdtIGFib3V0IHRvIHB1c2ggaXQsIGJ1dCBzaW5jZSBpdCdz
IHlvdXIgcGF0Y2ggSSdkIHJhdGhlciBsZXQgeW91DQo+IGNvbmZpcm0geW91IGFyZSBvayB3aXRo
IGl0IGZpcnN0Lg0KDQpDaHJpc3RvcGhlciwgdW50aWwgWGUgaXMgbm90IGVuYWJsZWQgYnkgZGVm
YXVsdCBmb3IgdGhlIGZpcnN0IHBsYXRmb3JtIHVBUEkgY2FuIGJyZWFrLg0KDQpXYXMgYWxzbyBh
Ym91dCB0byBwdXNoIHRoaXMgdG8gWGUgYW5kIE1lc2EgYnV0IGxldHMgd2FpdCBmb3IgeW91IGFj
ayB0aGVuLg0KDQo+IA0KPiB0aGFua3MNCj4gTHVjYXMgRGUgTWFyY2hpDQo+IA0KPiA+IA0KPiA+
ID4gDQo+ID4gPiBMdWNhcyBEZSBNYXJjaGkNCj4gPiA+IA0KPiA+ID4gPiBJdCBzaG91bGQgbm90
IGJyZWFrIDY0IGJpdHMgQUJJIGJ1dCB3b3VsZCBiZSBnb29kIHRvIHVwZGF0ZSANCj4gPiA+ID4g
aW50ZWwtY29tcHV0ZSBhbmQgbWVkaWEgYXMgd2VsbC4NCj4gPiA+ID4gDQo+ID4gPiA+IE9uIFdl
ZCwgMjAyMy0wNS0yNCBhdCAxODo1NiAtMDcwMCwgQ2hyaXN0b3BoZXIgU25vd2hpbGwgd3JvdGU6
DQo+ID4gPiA+ID4gVGhpcyBzZXJpZXMgdGFrZXMgb2ZmIGZyb20gbWxhbmtob3JzdCdzIGF0dGVt
cHQgdG8gZG8gdGhlIHNhbWUsIA0KPiA+ID4gPiA+IGV4Y2VwdA0KPiA+ID4gPiA+IGluc3RlYWQs
IGl0IHRyaWVzIHRvIGJlIGFzIG1pbmltYWxseSBpbnZhc2l2ZSB0byB0aGUgb3JpZ2luYWwgDQo+
ID4gPiA+ID4gdUFQSSBhcw0KPiA+ID4gPiA+IHBvc3NpYmxlLCBieSBvbmx5IGluc2VydGluZyBw
YWRkaW5nIHdoZXJlIGFwcHJvcHJpYXRlIHRvIGVuc3VyZSBhbGwNCj4gPiA+ID4gPiAzMi1iaXQg
bWVtYmVycyBhcmUgMzItYml0IGFsaWduZWQsIGFuZCBhbGwgNjQtYml0IG1lbWJlcnMgYXJlIDY0
LWJpdA0KPiA+ID4gPiA+IGFsaWduZWQuIFRoaXMgc2hvdWxkIGhhdmUgemVybyBlZmZlY3Qgb24g
NjQtYml0IGhvc3RzIHZlcnN1cyA2NC1iaXQNCj4gPiA+ID4gPiB1c2Vyc3BhY2UsIHNvIGV4aXN0
aW5nIG5hdGl2ZSBzb2Z0d2FyZSB3aWxsIG9wZXJhdGUgdGhlIHNhbWUgd2l0aCBvcg0KPiA+ID4g
PiA+IHdpdGhvdXQgdGhlIHVwZGF0ZS4gVGhlIG9ubHkgcmVhbCBjaGFuZ2UgaXMgMzItYml0IGNv
bXBhdCANCj4gPiA+ID4gPiBzdXBwb3J0IGZvcg0KPiA+ID4gPiA+IG11bHRpbGliIHVzZXJzcGFj
ZSwgd2hpY2ggd2FzIHByZXZpb3VzbHkgYnJva2VuLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEFs
c28gaW50cm9kdWNlcyBmaWVsZCB2YWxpZGF0aW9uIGFnYWluc3QgYWxsIG9mIHRoZSBwYWRkaW5n
IGFuZA0KPiA+ID4gPiA+IHJlc2VydmVkIGZpZWxkcywgd2hpY2ggbXVzdCBiZSB6ZXJvLCBpbiBh
IHNlcGFyYXRlIGNvbW1pdC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiB2MjoNCj4gPiA+ID4gPiAg
UmVtb3ZlZCBleHRlbnNpb25zIGNoZWNrcyB3aGVyZSB0aGVyZSB3ZXJlIG5vbmUgb3JpZ2luYWxs
eS4gDQo+ID4gPiA+ID4gKEpvc8OpKQ0KPiA+ID4gPiA+ICBNb3ZlZCBleHRyYW5lb3VzIHBhcmVu
dGhlc2VzIHRvIHRoZSBjb3JyZWN0IHBsYWNlcy4gKEx1Y2FzKQ0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IA0KPiA+ID4gPiA+IDxtYWFydGVu
Lmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20gDQo+ID4gPiA+ID4gPG1haWx0bzptYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+Pg0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waGVyIFNub3doaWxsIDxrb2RlNTRAZ21haWwuY29tIA0KPiA+ID4gPiA+IDxtYWlsdG86a29k
ZTU0QGdtYWlsLmNvbT4+DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQ2hyaXN0b3BoZXIgU25vd2hp
bGwgKDIpOg0KPiA+ID4gPiA+ICBkcm0veGU6IEFkZCBleHBsaWNpdCBwYWRkaW5nIHRvIHVBUEkg
ZGVmaW5pdGlvbg0KPiA+ID4gPiA+ICBkcm0veGU6IFZhbGlkYXRlIHVBUEkgcGFkZGluZyBhbmQg
cmVzZXJ2ZWQgZmllbGRzDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2JvLmMgICAgICAgICAgICAgIHwgIDYgKysrLS0NCj4gPiA+ID4gPiBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZW5naW5lLmMgICAgICAgICAgfCAxOCArKysrKysrKysrLS0tDQo+ID4gPiA+ID4g
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYyAgICAgICAgICAgIHwgIDQgKystDQo+ID4gPiA+
ID4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYyAgICAgICAgICAgIHwgIDMgKystDQo+ID4g
PiA+ID4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgICAgICAgICAgIHwgIDMgKystDQo+
ID4gPiA+ID4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5bmMuYyAgICAgICAgICAgIHwgIDQgKyst
DQo+ID4gPiA+ID4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgICAgICAgICAgICAgIHwgMjIg
KysrKysrKysrKysrKy0tLQ0KPiA+ID4gPiA+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV9tYWR2
aXNlLmMgICAgICB8ICA0ICsrLQ0KPiA+ID4gPiA+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV93YWl0
X3VzZXJfZmVuY2UuYyB8ICAzICsrLQ0KPiA+ID4gPiA+IGluY2x1ZGUvdWFwaS9kcm0veGVfZHJt
LmggICAgICAgICAgICAgICB8IDM0IA0KPiA+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysr
Ky0NCj4gPiA+ID4gPiAxMCBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNlcnRpb25zKCspLCAxNiBkZWxl
dGlvbnMoLSkNCj4gPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gDQoNCg==
