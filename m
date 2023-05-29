Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63D1C77B7A
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 16:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD8610E068;
	Mon, 29 May 2023 16:48:39 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6411F10E068
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685378917; x=1716914917;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=du+Am0/VIHLbqQIn5yDnNrAT2uzt/vj56CNQ5MqKRtw=;
 b=afiDqgH9+ETKAJ6XnP6A4IT5NZrJwJDGHG5QqmNoelCjkwUCxKFTdzeH
 AWa1pciAa+aUEJDqdIXlbCFbdaZg8yexSX3x7o2g3Irkn6/TnAjVUnAzK
 bNLyAktvKKxc/QqYdp42UDDVYHhLtjkmERV9zKY6vg9zh7EjZPB64I6cy
 9t0acp5qjZ1nipfFCfvGguIgaEaGQa+RbnwY7OdxzNPyJJp4cgauTQUHp
 Srf9+kIijF/rwrYepsUoH12XnHldsM5u0mngw1bRM/IzTB73qqeiaKyz1
 1LqVqnH16RUTGK9WqpAMMb3ilDwR/HZngmrTVnlzzZJUFKchXsHV50fJl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335093918"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="335093918"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 09:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="1036277678"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="1036277678"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 29 May 2023 09:48:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 09:48:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 09:48:35 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 09:48:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+3bRrtNN5v1g3W7jy5aq+YslnByFWQ+MIrJq+PJFB6osrGZo8VLlt93W02/clX5tC5Jt+z9Uj59F0yFhZHjpNhprefx53UzFScI7wfPpmPhlb734IDfkzZcbG9h2SszpvFMo8M/EIoEqLqKMXxibhtsmrEcdkFaqD9qvcd+gmPC3+yp0GrhVY8EANufPkdkfiRqLEWL7Cv1FNdNVo8zf6fm9fVqYCLj9kDYle1hFSBtlLM5AeogwN5tDOEuzbFymp9MYqACLaiXj0Haox3IzusgkqT28HloKZaw3t9bh4JW9c2od4g1gx6mE/c5NjjsTNtQh87JX9fGIvoQiU6z/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=du+Am0/VIHLbqQIn5yDnNrAT2uzt/vj56CNQ5MqKRtw=;
 b=gvQpgfZZBO5yB4xojXJRuRtGB8CA3TgnB+EQ6hsqLcuJcX1/9GtgvLdw2t6MoJNq3KnMEY9suuFXJ7ZExk5PJNoCUnnrwM1C4wS3Y0NFZUlw9xEYpSghz/MJHoWSk4OFGmWmEpy/9fj/lmwgACcdrtRJSLzyXOxTjy7gmBVOxiurld1Sd9qFn0dE3hJkiTMe/5dilrrcYY+Gas6/8jKIM25N4A4WhKGp28uuK/7rmwGSxipg7D0PAVa9X1REFnNNJ07BdfD94lqA5LuhocehZzakuJPHytt5yEib2uYLNA+tdY5YnIrHFXTQfwgQ/ZKpcBesaLtYCNJZGrOTWXYANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BN9PR11MB5340.namprd11.prod.outlook.com (2603:10b6:408:119::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Mon, 29 May
 2023 16:48:28 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 16:48:28 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/3] drm/xe: Disable interruptable wait on
 xe_bo_move()
Thread-Index: AQHZkAUrljm/3MaEc0a+WHqPJWrM0a9w960AgAAZsgCAAEV+gIAAAcQAgAAiF4A=
Date: Mon, 29 May 2023 16:48:27 +0000
Message-ID: <d6fc4160263a9c6b4e4c6f72e71f2f6b6e251471.camel@intel.com>
References: <20230526190609.61529-1-jose.souza@intel.com>
 <323d497f6ea67a8eb813ffac043393644c57fa67.camel@linux.intel.com>
 <cba9fb1a0374286bf847325d4d574e7d9b9b665d.camel@linux.intel.com>
 <376886023a6aed008f3e9e438722403a6278d348.camel@intel.com>
 <29af556c-008c-4c4c-421b-a08bb59ef3a7@linux.intel.com>
In-Reply-To: <29af556c-008c-4c4c-421b-a08bb59ef3a7@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BN9PR11MB5340:EE_
x-ms-office365-filtering-correlation-id: 4dc2deed-e262-48df-8dbd-08db60648697
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lu0e4SwrigNJFmeCXAlgCWaqZMaH4xkvWsFO1bpqJcoHghuzekJrcuPAO6YJVohze/6vwx8U3LqtGhHgUWpqKTXQXAcPyQnKrWx3UMq4h39Lg0G2AjLjZGOuL+2Ne0qWpUB08aS3ATbRQQix9EblwRxelMVIIMHxTjhMg2cGhFNSbHPDWC8GNIAh933g10m/lXXfAqACYqas2X4ILoWD3FtfAJKuxFn4gqTGk6u3/0gvSPno5bZ6x1ChWXxgzW5Z/ttS9slUHLoHeq+O1mxw9wrEdpD7UGx7XeyMvNkiSgHeze+XyR9kyeWfNbZCVJ1etoqKV0DHNATw8vFv1/pZ8QHIPYdDh+YxB1xLIEIKrgkFfbuBWK5jRWZH6jD1fkXtkCtBdb/KdINdxHSNXF3BCpYZ1lbWdc1Y5YZlifKH/S4uyWaLfughcOPAkt+4fUJ0wscABaNBHdxcew2xNjTw/v8R5HLxv1qv2zThvE+frZEWJ8qUHskpNWV5tPZdnPEvxr/t+qoQt9CVQ20pflNoULq+PkHtzi7uHUajPWXnNXqD0OORuC1AAFZ81BPt3oG2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(6506007)(6512007)(186003)(2906002)(2616005)(53546011)(110136005)(478600001)(26005)(66574015)(83380400001)(86362001)(122000001)(6486002)(8676002)(82960400001)(41300700001)(38100700002)(8936002)(966005)(5660300002)(76116006)(64756008)(66946007)(66446008)(66476007)(66556008)(36756003)(316002)(71200400001)(38070700005)(91956017)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1pKa0s4S0VJQXc1WVdzZ2JuN3ZRR3FGbEdLUG5ubUU4azRSSXpZUy9IZmQ4?=
 =?utf-8?B?QUpqckNmaUl0UG9Oc2pYSHMyMDBKc2o4K1NYNVl3emxwOEovTVBSZmRYUlVN?=
 =?utf-8?B?ak1Rc2diTjYwOUFJUVlTUE0yNGx1L0xGOTVFM1FXY2RoNG1YSXRnMENQa0VD?=
 =?utf-8?B?RDg0Rm5uRmltMmUxbzAzUGNkdUhQUUpqamdHaUdwTUhTT294aGw2bDVqSTlV?=
 =?utf-8?B?UEdoTUxJYkszUTg1MkhZN2E1clJoVnU3WTltOTZQUlFVTjB2a2hoQnZjemZK?=
 =?utf-8?B?KzRPZkhtckdRcU5BNkhHRlpIUHY5SzVNL3ZzS3VoTEJYdXdRYmpvYVhMU2wz?=
 =?utf-8?B?VE1UdW1vdlhraEo0NndEblUrcEROSDloeUNCOVU3QTFTaWF2N0p0R3ZWcW5n?=
 =?utf-8?B?SEFiV056R1N2VENiSDgzNHc3ZXR1MjVGajJ0bUt1Q3RtYkFhN0h1bElqYThZ?=
 =?utf-8?B?c3RLakF5UDJFS0VPVVh3dUh1TDVSM2hmN0ZFdFhJM2t5YXUyV0g2WFowcGo2?=
 =?utf-8?B?VHUyUnJXSDdZdFA1dmRqUVV1bUpWN3BXWWc0K1l6aHk5SFQ2eE9CeXNzbUNh?=
 =?utf-8?B?RlFQNk9oWTlhWisydTdTOVFsL2Q4OWwzc2psR2xMSllnY1c4TEpwQ2hMVHhr?=
 =?utf-8?B?R0lHNEt3ZlU5T0ZJOGZuVkgrN0dYM25qemY0ajdaam8wOXBZdWluSGRNcHQw?=
 =?utf-8?B?SUh6QjE2RXV5UHRnN05yejI4bWIzN0luTkk2OFV1RUhFcXVKeGt0eUJBcits?=
 =?utf-8?B?T2E4VlZHcXgwbXBtcXBDZWtNSUxhZkpmNHJSd3l1WUpyWFkxc2ZNU092UGN4?=
 =?utf-8?B?MDZTTjhBYkNyNS9jS2JWN2FINWFDSmQrZjNFOEVDK080VGhPcEdJRlprdnp5?=
 =?utf-8?B?ak1ObmFWYUJSMUlKUTFBOWdsRFlrZ1grMG82ampiMnV0UW9tbGZrYmZMS1h5?=
 =?utf-8?B?VGZFV24zcmYxRU9YVkQ2eXdsSDZqVVJyN2dqYnk2NHBFT25sOTJnZy9JbEdl?=
 =?utf-8?B?Z2wrdWg1R3lxMittTmJwOUtvVVlHVTNwdHV1NHBBZUhVZFZzMWpFYkp4aDVi?=
 =?utf-8?B?NlNUcjJXMnFnZHp5TG0zV2tadmwvWHVkQnpiNXRObHFXSUlRU1J1ZjZHMm9S?=
 =?utf-8?B?enpjcUdlR0xkUEMrSGZoQWlwRkwyWHRWVDh4bnRLM1Y0MWRSUS80bytuYlA0?=
 =?utf-8?B?dWV2aytwVTd5Y3ZvM3A4RFhoNXpNTUFqZm1WNVRXSmRyVTAxTEJhZXR2aXR4?=
 =?utf-8?B?Q1Rnd0YxcHBUWldpclRDM0VwcndZcUQ3Q3RMMFdLbWNzc0hqdDZYVjFFWWI0?=
 =?utf-8?B?OXpKK05MdDc3QTAyWGQwdW9MdFhueUd5NmQxRllKMWFwMWtnVDUybjhJb3h4?=
 =?utf-8?B?aFo3MnBpZXFJNm9MSmVhRXdPZmQ3SGFmaFV6VlVLNUZ0QTJuWFZZNk5FQVl3?=
 =?utf-8?B?Z2FISnNmdTZ6bHVwa1ZQMXVqOXI4UTRqeVZkQURQYmt3anVnRWdneHlIc2pX?=
 =?utf-8?B?cDZUait4L3orVndxUlJiMDRxUS84VFNNMEMyT3k2RXBTZElMTXVYSFYzVXp5?=
 =?utf-8?B?M1k2bVptTUtRVmVEOWZQT2ZQajBlSkk1cFh2SUNhNlF0WTYwUUEva2hIc1JD?=
 =?utf-8?B?Rld3eUoxTm43SlB0RnBMVFAxbVRvMlJlUXc5RlpjZmxxVW10eUtuV1R3RW5E?=
 =?utf-8?B?VGl2QzU5MWtqZWpIWktPTmFHREp0Si9MNDU4cW5BTGt2eTB5LzViN1JnalBM?=
 =?utf-8?B?ZUFEa25aU2xzY1A1R0s4SUdzY3ZQd3VZT3NLZkhPSldWMGFxU1g5UGQ0RGw3?=
 =?utf-8?B?MnRYcnRnVzI5UnAvWG9JdEJPSnVyWGRLMGc1bVpTZVhieUFPVFBiZTlqMGpZ?=
 =?utf-8?B?MlJrMFp4UEwyeGNZYUdoOEE0cUhicXlieE9pMUR3Q2lvYmlkQlM4WTZCaGZh?=
 =?utf-8?B?c3ZwdTg0VHR1TmZPSkw2YlVBRTRJdkozMGhnRWFRNmJEaEhiTXM5UU5TVUk4?=
 =?utf-8?B?QkNWMkw2Zk9HNk83VWxlOUR4aU1xNmtGWmNsRzR6WGNuQ2ljQ0I4RytoY25I?=
 =?utf-8?B?MG1Iemd2YXVXRXEwZGozV3hPcTZSVjlQWXVEdnk0eGhRb0ZGWEt3ZXowMDkv?=
 =?utf-8?Q?nHcTMQFUNMHz3QBDv7aeTOVJm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DD3106E0D0D5B4DA3A5C3FE0D7E83D3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc2deed-e262-48df-8dbd-08db60648697
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 16:48:27.3967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O78q6b9h/RkewUu4zdTuscFnlUb0uQs82EhrjEe87Fxkf1Ii8/1UW63FUgYs+kNKvwJaRKbBjv9fMIuNwmMq6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5340
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Disable interruptable wait on
 xe_bo_move()
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

T24gTW9uLCAyMDIzLTA1LTI5IGF0IDE2OjQ2ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gT24gNS8yOS8yMyAxNjo0MCwgU291emEsIEpvc2Ugd3JvdGU6DQo+ID4gT24gTW9uLCAy
MDIzLTA1LTI5IGF0IDEyOjMxICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90ZToNCj4gPiA+
IE9uIE1vbiwgMjAyMy0wNS0yOSBhdCAxMDo1OSArMDIwMCwgVGhvbWFzIEhlbGxzdHLDtm0gd3Jv
dGU6DQo+ID4gPiA+IE9uIEZyaSwgMjAyMy0wNS0yNiBhdCAxMjowNiAtMDcwMCwgSm9zw6kgUm9i
ZXJ0byBkZSBTb3V6YSB3cm90ZToNCj4gPiA+ID4gPiBBbGwgdGhlIFhlIHVzZXJzIG9mIGRtYV9y
ZXN2X3dhaXRfdGltZW91dCgpIGFsc28gZGlzYWJsZSB0aGUNCj4gPiA+ID4gPiBpbnRlcnJ1cHRh
YmxlIHdhaXQuDQo+ID4gPiA+ID4gQW5kIGRvaW5nIHNvIHRoaXMgYXZvaWRzIERSTV9JT0NUTF9Y
RV9FWEVDIGZhaWxzIHdoZW4gdW5kZXIgbWVtb3J5DQo+ID4gPiA+ID4gcHJlc3N1cmUuDQo+ID4g
PiA+IEludGVycnVwdGlibGUgd2FpdHMgYXJlIGNydWNpYWwgZm9yIHNpZ25hbCBkZWxpdmVyeSBs
YXRlbmN5IGFuZCBmb3INCj4gPiA+ID4gdXNlciBleHBlcmllbmNlIChiZWluZyBhYmxlIHRvIGN0
cmwtYyBhd2F5IGZyb20gc29tdGV0aGluZyB0aGF0IGlzDQo+ID4gPiA+IHN0dWNrKS4NCj4gPiA+
ID4gDQo+ID4gPiA+IFVuaW50ZXJydXB0aWJsZSB3YWl0cyBzaG91bGQgb25seSBldmVyIGJlIHVz
ZWQgaW4gc2l0dWF0aW9ucyB3aGVyZQ0KPiA+ID4gPiBpdCdzDQo+ID4gPiA+IGltcG9zc2libGUg
dG8gcmVjb3ZlciBmcm9tIGFuIGVycm9yLCBsaWtlIGluIGVycm9yIG9yIHBvc3NpYmx5DQo+ID4g
PiA+IGRlc3RydWN0aW9uIHBhdGhzLg0KPiA+ID4gPiANCj4gPiA+ID4gSW4gdGhpcyBjYXNlIGV4
ZWNidWYgc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlIHRoZSAtRUlOVFIgcmV0dXJuZWQNCj4gPiA+
ID4gZnJvbQ0KPiA+ID4gPiB0aGUgaW9jdGwgYW5kIHJlc3RhcnQuIElmIGl0IGRvZXNuJ3QgdGhl
cmUncyBhbiBlcnJvciBlbHNld2hlcmUuDQo+ID4gPiA+IA0KPiA+ID4gPiBCdXQgTWFhcnRlbiBo
YWQgYSBwYXRjaCB0byByZXR1cm4gdGhlIHJlYWwgZXJyb3IgY29kZSByYXRoZXIgdGhhbg0KPiA+
ID4gPiByZXdyaXRpbmcgaXQgdG8gLUVUSU1FLg0KPiA+IFRoaXMgcGF0Y2g/IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC81Mzk2MzMvP3Nlcmllcz0xMTg0MjgmcmV2PTEN
Cj4gPiANCj4gPiBUaGlzIHdvdWxkIGNhdXNlIGl0IHRvIHJldHVybiBFUkVTVEFSVFNZUyB0byB1
c2VyLXNwYWNlLg0KPiANCj4gRVJFU1RBUlRTWVMgaXMgYSBzcGVjaWFsIGVycm9yIGNvZGUgdGhh
dCBpcyBuZXZlciBmb3J3YXJkZWQgdG8gDQo+IHVzZXItc3BhY2UsIHRoZSBrZXJuZWwncyBzaWdu
YWwgaGFuZGxpbmcgZnVuY3Rpb25hbGl0eSBjb252ZXJ0cyBpdCB0byANCj4gRUlOVFIgaWZmIHRo
ZXJlIGlzIGEgc2lnbmFsIHBlbmRpbmcsIGFuZCBpZiBub3QsIGp1c3QgcmVzdGFydHMgdGhlIA0K
PiBzeXN0ZW0gY2FsbCBpbnRlcm5hbGx5IHdpdGhvdXQgcmV0dXJuaW5nIHRvIHVzZXItc3BhY2Uu
IFNvIHVzZXItc3BhY2UgDQo+IHNob3VsZCBqdXN0IHNlZSB0aGUgRUlOVFIuDQoNCk9rYXkuIFRl
c3RlZCBhbmQgaXQgaW5kZWVkIGRvbid0IHJldHVybiBFUkVTVEFSVFNZUyB0byB1c2VyLXNwYWNl
Lg0KDQp0aGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLg0KDQo+IA0KPiAvVGhvbWFzDQo+IA0K
PiANCj4gPiANCj4gPiA+ID4gL1Rob21hcw0KPiA+ID4gVXBvbiBjbG9zZXIgaW5zcGVjdGlvbiBv
ZiB0aGUgY29kZSwgdGhhdCBib29sIG5vdyBzZXQgdG8gdHJ1ZSBzaG91bGQNCj4gPiA+IHJlYWxs
eSBiZSBjdHgtPmludGVycnVwdGlibGUuIFN0aWxsIE1hYXJ0ZW4ncyBwYXRjaCB3b3VsZCBiZSBu
ZWVkZWQgdG8NCj4gPiA+IGF2b2lkIHRoZSAtRVRJTUUgcmV3cml0ZSwgdGhvdWdoLg0KPiA+ID4g
DQo+ID4gPiAvVGhvbWFzDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4g
PiA+ID4gTGluazogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwv
LS9pc3N1ZXMvMjM5DQo+ID4gPiA+ID4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVs
bHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+ID4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gPiA+
ID4gPiAtLS0NCj4gPiA+ID4gPiAgwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyB8IDIgKy0N
Cj4gPiA+ID4gPiAgwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2JvLmMNCj4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ID4gPiA+
ID4gaW5kZXggMGRiOWMwNTA5N2QwNy4uNmVkN2UwODI2OWU4MiAxMDA2NDQNCj4gPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9iby5jDQo+ID4gPiA+ID4gQEAgLTYwOSw3ICs2MDksNyBAQCBzdGF0aWMg
aW50IHhlX2JvX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0DQo+ID4gPiA+ID4gKnR0bV9i
bywgYm9vbCBldmljdCwNCj4gPiA+ID4gPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXdfbWVt
LT5tZW1fdHlwZSA9PSBYRV9QTF9TWVNURU0pIHsNCj4gPiA+ID4gPiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBsb25nIHRpbWVvdXQgPSBkbWFfcmVzdl93YWl0X3RpbWVvdXQodHRt
X2JvLQ0KPiA+ID4gPiA+ID4gYmFzZS5yZXN2LA0KPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+ID4gPiA+ID4gRE1BX1JFU1Zf
VVNBR0VfQk9PS0tFRVAsDQo+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB0cnVlLA0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFsc2UsDQo+ID4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gPiA+ID4gPiBNQVhfU0NI
RURVTEVfVElNRU9VVCk7DQo+ID4gPiA+ID4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWYgKHRpbWVvdXQgPD0gMCkgew0KPiA+ID4gPiA+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSAtRVRJTUU7DQoNCg==
