Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466F2CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 21:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEF510E0FD;
	Mon, 18 Sep 2023 21:22:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598B210E0FD
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 21:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695072153; x=1726608153;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=4ZIWUzGO9mH2tiDUHJlWHfffaoYSYFeOoOb9fmYh96s=;
 b=jKjBWKooXJVnPa3achUHrl7Uky6AtoGDIjCXiSBPUArFVEnxR0EjxHmL
 GNYkPZguvsxUrPLPeQQoksw5W8iyAyH9JR359XyGl6vQ7HMuAu/wvi3dj
 mZQRdFQlVrM0ew5HKQXLpSBohoaSTNqtlH/cyv6MHAjnbpHchTDNJwBuG
 xrx51Ck4HHMUgE53IL/wqLrcADhKTK9g0GpULBNqq5rapbtApgmchiP7M
 rjXlPq8k6SULzIr67VqI20QzQfNnv4hsCf7ZS8X11EmYjJ24pTlmv0ZQP
 4nk0fKMR2TYG80Ev4K2oqOuDJS6qPhb9954xwmZYf0aBCSLGNjsvLATqh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="378683292"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="378683292"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 14:22:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="836187923"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="836187923"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 14:22:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 14:22:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 14:22:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 14:22:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCmD3SxnQX35bTntxSBCZ6chmZFpD6XDq5qgrUjMjShaxpVfo1gH7AqDZYbVlpAZ6lmQgHUip6d/zBA9TSjHYVQvcbT0sX8fZVudS7g19aJh+h4IpaaKJJVqQIhnFo4kmVqWxZpofF3HghRcLxKCbzGoa79d5PflbzC1w5K/s/QBpGn/RiznXhvedp7eu/9cQEIRdUhx59mRsx++b0Z8g6MbmCT4rJA0l9BJzjLGS60CpfjMRgyfJGkNWMUuLRXXdEnVq0Y7qbHRixDmoybp5jxwfqrpHaah6jf/O+8ySROhdv35AeIVQZPNml2BauF5ljzQqN5xRdxt4KnJZ4qvjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZIWUzGO9mH2tiDUHJlWHfffaoYSYFeOoOb9fmYh96s=;
 b=bnjgM8Ale9bmEHDP0l7By9K+IwZwKF7zho7IYhpI/rqTgkGXOtZd/zlZkluVIXV+cP9O/8/wUiAii3OgnCKq4HMVOdpdj2tYVWFgFaptA//P6zArbWWwEfSdYd65rVDebC4/MZtu9hJknmIaYmnhI5so3PKCD72YtkYyjkEZ7/bsywx4mvKEE4fTL+kicoNu/vRlqR3a+1csrDze75jB1ThSMU5i5AS0fr69H1MWLemSKHgabkZeoAG+i5QQwfYoC8sIaaIEpZ/ZTt0Hww88xPPWYNgbKbKN0PUYzlEyA1OaO5GnnKKY7PhYypIyie+VClOen89/0QROEop9qGRxUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by BL3PR11MB6506.namprd11.prod.outlook.com (2603:10b6:208:38d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 21:22:30 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 21:22:29 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Thread-Topic: [Intel-xe] [PATCH 3/4] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
Thread-Index: AQHZ6f4YL39Nj0wwqkOy9xzAkA6r+bAhGHaA
Date: Mon, 18 Sep 2023 21:22:29 +0000
Message-ID: <c3d4a56c608e9340f4755d27134933b0a6f20a78.camel@intel.com>
References: <20230918070100.1387082-1-jouni.hogander@intel.com>
 <20230918070100.1387082-4-jouni.hogander@intel.com>
In-Reply-To: <20230918070100.1387082-4-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|BL3PR11MB6506:EE_
x-ms-office365-filtering-correlation-id: d21c8490-d63b-41b3-0f9b-08dbb88d5cf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nNzdiotOPQAcEuq+SV3kVdxIdbOdvUPCAyQQetRVfsza8hIo3RTW2h5K5aMmqwKqikXyOPDVT6ydqEtDX9S7E+Wc1hDsiu5FFXTw2g+3CMidfkBs9Tc9i/qyiL7U3dltihLq27KT/uUuF1vqI8am0Wz6Xv4T9rWxun8+jfCpJUZKhEgM51M6pl3k+61Zn2pHwoAQuXIxY2fyf9SlMJH0KPaup3r6dOXmpNKuQmavOgYcDnFeqZWQEMwbLWWEwVq7kmRfj6XkvPS6gEdhopAb58zwsJLjUwtbvZicNhtcPWjfuclCOSg/2DYhYxQYZp55XTq5uhjd7tjb3E4ZGifac90G1J0/dMzWCjVU/wQgEYsrRuat+G8AcyeVVxnnB6b/os1BoPKI8nrqR2jgLSaR4ZajvZoYJM6KfqwUxPvFG7Fsrb6JjvHXgx1jf6oKEzhiTqWLhWINfrlEE4bNA8rdHw48cTmKPPX1/PzaekBIoiN4DhrXxJsKXyd50V+EmZsh72Zb/EsMbUEwhHllx70ZNe2v0JHdXrRmfm8rwxLD+IoIRZUK+7HoeHlM/JjB1Vo+mqzw0nQjS4gnXAX58B04UymDhREADQLdZa3u7ua6tYy1Fcmjx4+jz2FhjhHNXE90
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199024)(186009)(1800799009)(6506007)(6486002)(71200400001)(6512007)(478600001)(2616005)(26005)(66574015)(2906002)(4744005)(5660300002)(64756008)(66556008)(6636002)(316002)(66446008)(66946007)(66476007)(76116006)(91956017)(110136005)(41300700001)(8676002)(8936002)(82960400001)(36756003)(86362001)(38100700002)(122000001)(38070700005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEg3WEE4cXNva1BJdllUVzdwd21menBEYngwcEsrWmprdkNPRnhnazFWN0tz?=
 =?utf-8?B?YlV4MDJBZitlcExEckdyZmpXMlg1N2g4VGxMZUpoaEN1NHZZaStBSTlUSXM5?=
 =?utf-8?B?bll1OW9sRXRlN0JHdDRVWDZPaVEwd2xCL051dEJPVWNGVTZLNFNRRzJ5bjhP?=
 =?utf-8?B?emgrd1lmMmttaEVielpwMFgvUVIxSUp1ZFRhUHd3MXpjWEhzM2ppNjUrbEcr?=
 =?utf-8?B?RnMxb3V6QXZ1aWVTaHhzN0VuTUxtMjI0NHI4NHpGL28yV3lUS241UW9lemxa?=
 =?utf-8?B?TVB2M2Jlc3NBSVBNZUFTVGVHUkJLazVoeDJMYnhDclhreThsaGRtSVhWeW56?=
 =?utf-8?B?THVVdmtwWHcxVTJEbHdMb0dhK0V5ZDZzZWp4TURpUWV3cG9YTWJ5WXFyVC9R?=
 =?utf-8?B?ZjlXdkI4RnN0c3VNWnVCZmJ6NDV2bHp3USsrY293U0gzSVoxTmc5Q2RnQTlW?=
 =?utf-8?B?NUJjWTljWmxwc0YyQUw3QS9KUWdTbmVPVVFkTEw1Yi9JYVYzdVRlV1BWUTBW?=
 =?utf-8?B?NlNvZlhGWWxXRXhhSENoTnd0MWxoVER4UmVrZ0NvQkV3akxEK3o1NGl0aUNl?=
 =?utf-8?B?cnZ5NGNMSDJPVmtadiswM3hGTnBUZUFmS2NWUGIrYnNaRllWaWxRMEN1S2Qw?=
 =?utf-8?B?OFlVMkprQkw3UysyTkVvQ0JHVnNlaGpqditDVElPdkF2b2hnV2s1Z0FJa0Jy?=
 =?utf-8?B?R05FcXJaZTZkbm5VczkxelpWUSsxVFF4dnhIZnl3U0U4NHhLMnFWVXdaMVdj?=
 =?utf-8?B?VldJbXI4R3h6ekc2RTRwYk1wWnVSbGtuSmMrY0Z4bXJoV1JFaWt5MERjTHgw?=
 =?utf-8?B?d0J1eTRaRExIbCtDRTdYeEhxM1RKL1RqNld3ZzJQVUFIRDJSSHlWbmRqVVFX?=
 =?utf-8?B?ek5iZXlRdkFHS3dCUzVWOHhxbDRGamhzdE9rcnJmdEU1b3BLSUNzY3FmWVJv?=
 =?utf-8?B?cDJsRjArK2FEWVZKdGM3NzNqdE40UDMyd0xVKzlMWDdISldLd0NxWG5BZEU3?=
 =?utf-8?B?Z05LRnQzbXNCUFpVZGcvT2pFNXdDbUZ6UG0vS01yaXlQL1IwZXRMSUM5SmZh?=
 =?utf-8?B?WksxbFROZkFhaUJHcmk0WXFiMHNlSU1HOGVFS1AweTBpU2REQUswaWpGTFBV?=
 =?utf-8?B?c1BpL3Z4NGRaRVFXTk9GZUFnMS9lQzQrRVFtOTE3WmpsNkpxZHI3dllRWEpI?=
 =?utf-8?B?UnpsbUpiNVlhRk9mRkwrQWd6S3N5MWFCODRINHB4QjRvYlhWYXo5MmRmeEI5?=
 =?utf-8?B?VnN4WGxaNnpPaDduWDBBcW13cnBIWDVxbUEzd3hWd2RsazVVN09aWkFnSGxX?=
 =?utf-8?B?MUFmRENUelVzMVc5NjF0NUpkd3lUeXRxYUh6QnBQUFVDKy9OT1I2SlRIQkxX?=
 =?utf-8?B?M3I3c3k0cU9EVXpEQUFjS1NMYWtibkIvTnJRUjFjRHdkN1lOOFJ6SWRVWXVK?=
 =?utf-8?B?d2lkOElVYXFzN1U5Q0daZEpUc292MmxaZW5UTStPZEpDY09CQ3B1cWhMQ2I1?=
 =?utf-8?B?V2w3QnVHdzdXcnhrNVhNQUFzWXVQZ3M0RXllQ1hpcXBESWtIQ3FqVGorbVVq?=
 =?utf-8?B?Ny9wZzR2UTNHbzZWMG9lZG0zRERVTHlvU2RPSkduc0lFTnRpaExteGJHUFJZ?=
 =?utf-8?B?NUtJU2Y4ZnJUbEo5OHBUWXFQVk9oZ0VCU0RtT1N4YzIzYlk1ZmpsLzlvT1BW?=
 =?utf-8?B?bGJ0aGdsWUtIWktVY0xVdXhBK0NMUXRjN1BtTUxMYzhsbUZHQXlDM1RnRmpB?=
 =?utf-8?B?QUJNZERER1ZhLzRJRkEwU0hZRGVyenpOaGs3N1Q0bHhTZlQyOGpVa3RyaEda?=
 =?utf-8?B?Wkc5eVJxNWZpNWFMTHEzR3czTVI2QTM3WVJEQXJaL0cyNzErY0Zuc081WFV4?=
 =?utf-8?B?S2I2V1hXYnFOTkpWbWNTdW5lZVNkOHJ2a0RraWZIYzFJNURJUUNxS0xVUitC?=
 =?utf-8?B?amQxcnpncXpva3FETGJCYjBVV1JMR1pPWFlCb0R1b09LazU0cG1Dcm14RmF3?=
 =?utf-8?B?RkNLcEkwTFJsUHg3aGF4YlZNRzMxMm9uSUIrUnVzd2t5OGJ3NlZnam9hUm10?=
 =?utf-8?B?VVFNZVdvOWVpdTBma3RaYjRvQzF1MzB4MkkweHJJcGNQeHBPdGtXT0k3WFJ1?=
 =?utf-8?B?aFZ0U0pMR1k2Q2F2WGIra3J4NlNrVlVuVU84dHRCeWVNRjhYWldvUk9vSy8v?=
 =?utf-8?Q?NdQ2oB7J9MudosL/ryDBwYs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95FA418DF7859740BA4254996C9B2C24@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21c8490-d63b-41b3-0f9b-08dbb88d5cf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 21:22:29.1951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K31of14NU8BGLI4Kh48jzpzBK0W1KPoYkU5FhvqriPvJN106hKifTe6TPv3+Xhd/Mqqrp6rWDaGJkTbyt0L8LbZ54fO171yCNXtcVCGARyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6506
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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

T24gTW9uLCAyMDIzLTA5LTE4IGF0IDEwOjAwICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IGludGVsX3J1bnRpbWVfcG0gaXMgb2sgZm9yIFhlIGRyaXZlciBhcyB3ZWxsLiBFc3BlY2lh
bGx5IGFzIHRoaXMNCj4gd2hvbGUgc3RydWN0IGlzIGhlcmUganVzdCB0byBraWxsIHNvbWUgYnVp
bGQgcHJvYmxlbXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5p
LmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZV90eXBlcy5oIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KDQpSZXZpZXdlZC1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2Qu
Z292aW5kYXBpbGxhaUBpbnRlbC5jb20+DQoNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
X3R5cGVzLmgNCj4gaW5kZXggYTgyZjI4YzZhM2EwLi5hZTE4MDk3Y2Y4ZWEgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gQEAgLTQwMiw3ICs0MDIsNyBAQCBzdHJ1
Y3QgeGVfZGV2aWNlIHsNCj4gwqDCoMKgwqDCoMKgwqDCoHUzMiBlZHJhbV9zaXplX21iOw0KPiDC
oA0KPiDCoMKgwqDCoMKgwqDCoMKgLyogVG8gc2h1dCB1cCBydW50aW1lIHBtIG1hY3Jvcy4uICov
DQo+IC3CoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ydW50aW1lX3BtIHt9IHJ1bnRpbWVfcG07DQo+
ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBpbnRlbF9ydW50aW1lX3BtIHt9IHJ1bnRpbWVfcG07DQo+
IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqAvKiBGb3IgcGNvZGUgKi8NCj4gwqDCoMKgwqDCoMKgwqDC
oHN0cnVjdCBtdXRleCBzYl9sb2NrOw0KDQo=
