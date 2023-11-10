Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591E4C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 15:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B81310E103;
	Fri, 10 Nov 2023 15:55:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFE810E103
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699631725; x=1731167725;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=MH1Yjx+IrpC7TFGe3UYndmjRkN/HqktST+qXcLnCo20=;
 b=MzOOL/1NwQSj/AJwfYXUJbVVCQAiyDN2MxzJ8BoiLZP9GXMZWaE48Wj7
 71oYcKSaIcEKJTtIc5Oy1jrZD+PWies+hHY3LBgw6Mlux01Rn0JcyUr70
 w6Wf4xbnfEog56bh5ihDVBTCWOaB51fzhwmDbuFtijXnk13bmD1CBKeNm
 lcUxXQc3/WEmKpe4Si288l7Flax+ijrCKiOaPXuuSFDbkqtkHKFG0nwhB
 KyklE90miVRpwFtwErw8uD3/GqTog06j6tROCj/6m7TKGVreD52AIalHi
 JONBp5ZrEDF1hZP7i7bLEN/CKPF4f/I6NvI2YOMW5RsBSiHvD+Kfyxv65 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="3186156"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="3186156"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="740189274"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="740189274"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Nov 2023 07:55:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 07:55:23 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 07:55:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 07:55:22 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 10 Nov 2023 07:55:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSCUpV++tPncR1BpZqc8NORt3ryFWB2Z2bzpKRV+6m60dNsAXKhEgV83uMk/Bc1wljPQ7I2yO6IVneYDq4TrAIuuw5pMMSZbZ4zt+xhfValPbfx1nHRM51gDHNIw5oNomh3sXkkUBCTRRw2lIwxqfvLQdB2rNIx6Q3ZQfLDWkTg6JiV5FvUk+Sbo4lPNPcKSJAjJUykIVFZrNFa9UxXx6YCAb4Bg99Tx3ZgjscHaPkAbIb1LG6G3+9JR4gKDtmE/paDCCivgAgNRbwa9V3s58yYRTbJosBOvhTSt53Z58vqGAONxA4uEqPx9dH9WZ4gBw0UnS69j+uhv7qMsM1gFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MH1Yjx+IrpC7TFGe3UYndmjRkN/HqktST+qXcLnCo20=;
 b=aN1x1oIiUAENRAEW99NK953voBWrn8aQIANI1ZJyL+eQJEK4FMTBULWik+l4NgVVlaFZQUkTQgNimXLIPZp5M93vWKwD25bTgYduvl98HDVOk0lF1k5B+e0S3THTDlu1F1BAf6foJG2Tk21j33AtFSKDqPM7CKWqCjFyZSCrD3K5zT3pWmpKqeG2XaHFDhZR7MZxJ/zxs5opJRO+kLBh5I6YKYLO4K2ZwqdWKMdT0FHZ+YIubs0QZ7faUYIm9FFCNNuYTlMogqD47Ip/u980hyn+/V/lNkwxQAqJ9QZGP6Es+3m4B5Y/Ys0a1CECCaz4ayXlPxwEg5RnwwyaMRIYXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.30; Fri, 10 Nov
 2023 15:55:20 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15%6]) with mapi id 15.20.6977.020; Fri, 10 Nov 2023
 15:55:19 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v1 5/7] drm/xe/uapi: Remove unused
 QUERY_CONFIG_MEM_REGION_COUNT
Thread-Index: AQHaE+yJe8fa03grWkiv6rXFN8I3nLBztL8A
Date: Fri, 10 Nov 2023 15:55:19 +0000
Message-ID: <2a7705093f8f1ec4c8528f110e8f700373e7f08c.camel@intel.com>
References: <20231110154156.6-1-francois.dugast@intel.com>
 <20231110154156.6-6-francois.dugast@intel.com>
In-Reply-To: <20231110154156.6-6-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ2PR11MB7715:EE_
x-ms-office365-filtering-correlation-id: b73a4928-9f36-40fa-2961-08dbe2057099
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BkRFMTTIiVcsHIJa7ZdqaNSduTWERkqiRv3yqWF3TBByLzMZohxLbFhMJQRmX8NihHamiahBwqq730WmDZnpFaM3/w0VUG9/Gf+0CEtdiISsDfb9e422AOGl6+TEdVb2oQTskBVLlZHaprqGMiZUez1VK87VV1sfkK2bonBideH0FvspjtbqdVIH+iAfEvuIAvbVkXl/glYY1z68f1GWE8iTs8LV5+qacXTwBkCjze2y78YiJW8twHqKrsTk9WbPVPWpstIQa+cgpBZJ5kxH0vno45XuB18lcmB3bwlOopD6QHyRWYvcw9aeCZ1HLyr99eCPIVoxvy+1uqKqRvWABqPWONKkCKx8I1xOOb4J6V9BSvK32vuZEu0+rKxNU8TzpgLCgha9XySBx/BMJ8QAke8QIOi+3jtBuK32hD3ymIeP8lrzH0UUvth/xTrxA52S+tXl2kAFzrur7nd1F8V54p6t7rwmmomJJO86vfKxC5KaUfDUAgYoyb0bq25w5XFvSsh/MLhGnGiIb72TlTqutXvGcHljU8u23vJzguNQE2Y7MNgh91NlIFs20gluAr9gHle1QysmqN2xErcfpOkAYV64qtM0BBeG2yZMAxbCQmYflDr47g8uVHsZcW3dOroY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8936002)(316002)(2616005)(8676002)(6506007)(2906002)(6486002)(4001150100001)(478600001)(71200400001)(5660300002)(26005)(66476007)(6512007)(66556008)(83380400001)(110136005)(91956017)(76116006)(66946007)(41300700001)(6636002)(64756008)(66446008)(82960400001)(86362001)(122000001)(38100700002)(36756003)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHR4c0JUUjhwQXd3UGlQZFdKQnNMOS9PcVd4aGdzSmJDQ3VHTmY5Z2RBVUFK?=
 =?utf-8?B?TnVra01YU3Z1eHlQaXFUM2xPZjBsd3I3d1huaWZ2QnY2WUZMVWxaNnpSVjV0?=
 =?utf-8?B?MUloZHpZNDBvM2thamRFQUVaMmVyYXhveCtUcm9zaW1KVGI1bk9wd2x2R2lG?=
 =?utf-8?B?YmZSRFByMHpsYmx4Mmc1UFJORkdMODg1YnkvdUJJb1VUUWUyOUxERUM0cGgw?=
 =?utf-8?B?TTU4M3VJOHJJR0ZzTDRnUG9RNU5EQWUvRDN1Tm5aVjljRUluYm1BdzB6OWVE?=
 =?utf-8?B?RXpKeTdxTm1vTFMzdXlsdEE2bFdQUTZrRWlVTkJKMng0dCthZEhETU1mVlZB?=
 =?utf-8?B?TE1QdjVmRHVEdkVIRmlCNjNyNW4zK1lIOWZiK24xc1A1NkNXZUZtRWFuYjQ3?=
 =?utf-8?B?amU0Y2ZrZFViNUx6bzRtZGp6R1Ztc1dOeWFkaXp5WFVCRWJNVURCa3Qvc1lE?=
 =?utf-8?B?NlBocDkrZGY1b2NNV3ZmSkpLV0dTWXVISFQ3Z1RKWEQ5R295OXZSWVAwSlhH?=
 =?utf-8?B?VGpKeE5ISnZHZ1l6VXBIbklqY3dMNHRuRnB2TXo3a2dXSXdiaEFhREhnL1dx?=
 =?utf-8?B?S0toWVZvektkZjNHcWFLSnVUQlhmY1d5ZUx6NUNjL1pJcU9qN1JBQkRleUZG?=
 =?utf-8?B?aklqdXlLOXI5cEdKdEpqTUNScDZZOGtlOTh2Y0hHQ29tWGkydXFsaXNPOHJn?=
 =?utf-8?B?NEUzRjE1WjJHekZva0hKd1F4eXRSOGIzanVISHQxT3d4SzhZQ2RDbjFjTHBv?=
 =?utf-8?B?djA5OFk3NUVrbmsyNWdraXJkTEpjano0eURXaXJBd0Z2dGxCeUNwdVhDZEJu?=
 =?utf-8?B?cUtzcHAzMTE3S0Jjb2tzOWdGQUVkUmRTVS8wdWdnVzMxWFBGbitGQ3I3cXVR?=
 =?utf-8?B?aDlCbDBwdkxwSnpoeko5U0NISkpVQlgyTWNRd25WVlJ3WndNQ29XT3JHUWRh?=
 =?utf-8?B?VjFNNUgwaTlLQkFnRk9ZTWdFMlduK3I2dWY3aWdYRlk4ZFBTWlBGWXh5NS9P?=
 =?utf-8?B?dDJWWCs2V2JtWjQ0b0JUb1Uvb2tvd2JZd2llYkdOOEZJUkdlVjlQeVcyNFpG?=
 =?utf-8?B?K0wrV3FUZUNlODZYUmdWb0dIUXVxYmprR0w5TlMwa1JtZFAwOUNuRnBSNzJP?=
 =?utf-8?B?OHBrTWFncGEvelhjbDVHVlRRUlJhNEsxVW1Dc0dnSDVsdEhtL210cTRqVThr?=
 =?utf-8?B?QjE3cTlMTFBMN0kwMXIzUmlzU1JpWUdvb1hwMFdLSkpiekRocWpRd01yYnFm?=
 =?utf-8?B?UXkvKzBpdWdYTFh4SUsvcHRnc3JqZ2tQOU4xaCtPODcvSjdzMGlJYkFyY3Q1?=
 =?utf-8?B?QysxVlF4QXYwUS9QRUhweE93TGtTbm0yTHkxS012ekQxdU5NWk10Q0hDSzBx?=
 =?utf-8?B?Qk9HZnhIV2JpOXIwR0crU2tPOEhFbERnUW5VYzloeUpUa1pCOURicDhlT0h6?=
 =?utf-8?B?bll4Q05oVW41YVlXc3crUURacExFY09hSWdMY2ZhQkxSV01BSkVRR0diWklE?=
 =?utf-8?B?TloxOWxBRjA0MlVQS2ZZbHlFcDgzWTJ4Nk1oT0YvQmxyWDhBRW5xaGFmQjhi?=
 =?utf-8?B?ZHhmZ3ZZdDc5OU1GWXBmYXRsZ21uMGZlTEpuVlV6WCtJU3VGaGQzc0dVVCtz?=
 =?utf-8?B?N3lxeDExUmZWY3RFUUZwVzNwTEsxRThEaHI3N05YMlVVdHdvdjJqNVlSczlF?=
 =?utf-8?B?TnBUY2RlOUFwMTFwUGFOMTB4elEvN2NOajAyTnZLc1IvUDRqemV1SUpJMWVD?=
 =?utf-8?B?WkFGbG9tNW9hblVqZVhkNUpvM1BhSVJwRFlSa01oLys3SDRqMThDbzE2QzJN?=
 =?utf-8?B?ZVY3TDNLRGh2b294NEV0T0lhTnBZRnIvSTk1RnJwTjdVVDhhNzEyN0ZEWlYv?=
 =?utf-8?B?OVlkZllKeVNZYm56b256QnFROFlUQzZJcE16MkIyeXdUQWVPZFVTSFVmUVQw?=
 =?utf-8?B?dVhrVmlvRXlLVkhPcm82SktYVm9WM2V6WHRsaXN4MWNsdkVGM3NXZGo5eHdN?=
 =?utf-8?B?cVVJczZid0M4RVh4OHBJODJKYVhheXYxUUFTdC80SmEwcnp4OG55VUtFbEs5?=
 =?utf-8?B?V0ZFNThFM3pEcEVyM2tWZHQvTUZ4ZUtqOTRmOW5QeitNajlCdlhvZFpJbFo5?=
 =?utf-8?B?c3dENkJYMi95Nm1HL1hOM21KMjN3dlhGTkdGK0RPeDI5Yi85LzVNSDFoQ2Z4?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3E3B29987FB5A4B9F33D9847D62DD49@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b73a4928-9f36-40fa-2961-08dbe2057099
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 15:55:19.4518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MI1tT5g4Cn3bL6JcBPoCnuZVltFbyzx6iLn5TYdUvVICaczSmXlWF//ZjWucKP8YaiYV09Hy+FlYQQP/Xh4QkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7715
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 5/7] drm/xe/uapi: Remove unused
 QUERY_CONFIG_MEM_REGION_COUNT
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

T24gRnJpLCAyMDIzLTExLTEwIGF0IDE1OjQxICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEFzIHBhcnQgb2YgdUFQSSBjbGVhbnVwLCByZW1vdmUgdGhpcyBjb25zdGFudCB3aGljaCBp
cyBub3QgdXNlZC4gTWVtb3J5DQo+IHJlZ2lvbnMgY2FuIGJlIHF1ZXJpZWQgd2l0aCBEUk1fWEVf
REVWSUNFX1FVRVJZX01FTV9VU0FHRS4NCg0KUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUg
U291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGcmFu
Y29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgfCAyIC0tDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oICAgICB8IDQgKystLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1
ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBpbmRleCA0M2JjNjA5NDg1
NWMuLjI3ZjY2ZGU0YzFjZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1
ZXJ5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gQEAgLTMzNCw4
ICszMzQsNiBAQCBzdGF0aWMgaW50IHF1ZXJ5X2NvbmZpZyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwg
c3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5KQ0KPiAgCQl4ZS0+aW5mby52cmFtX2Zs
YWdzICYgWEVfVlJBTV9GTEFHU19ORUVENjRLID8gU1pfNjRLIDogU1pfNEs7DQo+ICAJY29uZmln
LT5pbmZvW1hFX1FVRVJZX0NPTkZJR19WQV9CSVRTXSA9IHhlLT5pbmZvLnZhX2JpdHM7DQo+ICAJ
Y29uZmlnLT5pbmZvW1hFX1FVRVJZX0NPTkZJR19HVF9DT1VOVF0gPSB4ZS0+aW5mby5ndF9jb3Vu
dDsNCj4gLQljb25maWctPmluZm9bWEVfUVVFUllfQ09ORklHX01FTV9SRUdJT05fQ09VTlRdID0N
Cj4gLQkJaHdlaWdodF9sb25nKHhlLT5pbmZvLm1lbV9yZWdpb25fbWFzayk7DQo+ICAJY29uZmln
LT5pbmZvW1hFX1FVRVJZX0NPTkZJR19NQVhfRVhFQ19RVUVVRV9QUklPUklUWV0gPQ0KPiAgCQl4
ZV9leGVjX3F1ZXVlX2RldmljZV9nZXRfbWF4X3ByaW9yaXR5KHhlKTsNCj4gIA0KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJt
LmgNCj4gaW5kZXggMGY4YzVhZmQzNTg0Li4xYWM5YWUwNTkxZGUgMTAwNjQ0DQo+IC0tLSBhL2lu
Y2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0u
aA0KPiBAQCAtMzExLDYgKzMxMSw3IEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfbWVtX3VzYWdlIHsN
Cj4gICAqIElmIGEgcXVlcnkgaXMgbWFkZSB3aXRoIGEgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVl
cnkgd2hlcmUgLnF1ZXJ5DQo+ICAgKiBpcyBlcXVhbCB0byBEUk1fWEVfREVWSUNFX1FVRVJZX0NP
TkZJRywgdGhlbiB0aGUgcmVwbHkgdXNlcw0KPiAgICogc3RydWN0IGRybV94ZV9xdWVyeV9jb25m
aWcgaW4gLmRhdGEuDQo+ICsgKg0KPiAgICovDQo+ICBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2NvbmZp
ZyB7DQo+ICAJLyoqIEBudW1fcGFyYW1zOiBudW1iZXIgb2YgcGFyYW1ldGVycyByZXR1cm5lZCBp
biBpbmZvICovDQo+IEBAIC0zMjUsOCArMzI2LDcgQEAgc3RydWN0IGRybV94ZV9xdWVyeV9jb25m
aWcgew0KPiAgI2RlZmluZSBYRV9RVUVSWV9DT05GSUdfTUlOX0FMSUdOTUVOVAkJMg0KPiAgI2Rl
ZmluZSBYRV9RVUVSWV9DT05GSUdfVkFfQklUUwkJCTMNCj4gICNkZWZpbmUgWEVfUVVFUllfQ09O
RklHX0dUX0NPVU5UCQk0DQo+IC0jZGVmaW5lIFhFX1FVRVJZX0NPTkZJR19NRU1fUkVHSU9OX0NP
VU5UCTUNCj4gLSNkZWZpbmUgWEVfUVVFUllfQ09ORklHX01BWF9FWEVDX1FVRVVFX1BSSU9SSVRZ
CTYNCj4gKyNkZWZpbmUgWEVfUVVFUllfQ09ORklHX01BWF9FWEVDX1FVRVVFX1BSSU9SSVRZCTUN
Cj4gIAkvKiogQGluZm86IGFycmF5IG9mIGVsZW1lbnRzIGNvbnRhaW5pbmcgdGhlIGNvbmZpZyBp
bmZvICovDQo+ICAJX191NjQgaW5mb1tdOw0KPiAgfTsNCg0K
