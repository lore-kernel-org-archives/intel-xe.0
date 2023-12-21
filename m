Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FA5C35274
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 13:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3838710E44E;
	Thu, 21 Dec 2023 13:46:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3908010E44E
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 13:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703166398; x=1734702398;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=a3VvU2Mu+QCc6wG7YqudSKURMT6BHnfdQGmVc85NfxE=;
 b=e5Eo7OmhQf3LnM2UNSzhDrK9RDHDP+aesFbWw+LfdijI6xTdlArUqGAo
 nhV7IPSH33KRJX/kayutippt4G9c+2GdfCTJ4QmFFaL44nzvBudeeZA1z
 4wclhhqumV9I73e0bND97CfkqZ+JdcHhMMqJWoy/0mH5NgN0jSo9WKXMM
 98kYVax/TTG2+5CxzvNPvYwkxleW/8v0CS8wjgBXYRumglOBsgWgZqcVF
 etESBjIJVehfIDEqbfgUBEehY2OfBwvoa2ZvjVNHCkaDm678RCk56RKa4
 X4NQ78SauuNZZJE78CNPPtUBL3NI2eSawuvJbLrO5u46BOd2q5kOiGcek A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="17530944"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="17530944"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 05:46:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="810972825"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="810972825"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 05:46:37 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 05:46:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 05:46:37 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 05:46:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7569KjDfFoZm/fPS8Up8ndcolWcLau0LLSq432+SMPXspDrWgiAVWeEZkbcfWYChqz2taOu82RZL6F/MtqTwPi8ibtY1+JmFWz1esLbhjP5grNx3aoHZ4s6NtTBd/a9NnOwv/yQZVWoLbiGfifR0Mga5rxOjGcyf+7VRtcUTdTkFxb3Tca5DNe2gAXht6fAMHBPcLJ5U/dkvez6nBiUpBspoSZX9lJJ6xeB2p+gAEc3/sY9ZNLwyUsOQeZ4uBbUo4h9TYxSB5+WdxfgJ0hgXycTboa+vHeDZRyjCkCLZXrDDO5ZucuT9tBysr6PlljTR5avw3L9IS8/0FAyHQDrww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3VvU2Mu+QCc6wG7YqudSKURMT6BHnfdQGmVc85NfxE=;
 b=SX1iR5JeQ2cwuoQIuikoRKPrFjNsZVLivY8zi5erBvzaAL7xCULB53IFX+Xx7EGx56eEV8ecozc4C+XLkcG2QFW8TUA97EuRpGLnNOrntUzdkWevbJ39NHYrQUaPy69S9by8s3Z3TH4mq48qQ7CW1RouHRUtGRR43HdyJeEw1xR4YuXdoWtTExKpRGR1710lg11Zm9Lif60D1DeuZQm8ZRyTB02qDn3RBTbFn+n/IVr0xZ9hpnjbyd2zfNdN6YESdX4u1MEr9qLTIqrR3kyRvn1ZK1R+loMe9kdZ+ZEeOvOWOiwYL14zSJIaiR2D7SvPpHyoXdRJrI0hQmdW9J6gJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Thu, 21 Dec
 2023 13:46:35 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 13:46:34 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/exec: reserve fence slot for CPU bind
Thread-Topic: [PATCH 2/2] drm/xe/exec: reserve fence slot for CPU bind
Thread-Index: AQHaLeyhkzf+aRhi1EiyZ5Dd133cULCzzF0A
Date: Thu, 21 Dec 2023 13:46:34 +0000
Message-ID: <5d282e3cc82df8af4403f54c2d36e4e5be242519.camel@intel.com>
References: <20231213174703.536989-3-matthew.auld@intel.com>
 <20231213174703.536989-4-matthew.auld@intel.com>
In-Reply-To: <20231213174703.536989-4-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY5PR11MB6391:EE_
x-ms-office365-filtering-correlation-id: 9a9e36dd-162b-498a-3df4-08dc022b3f56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I4TnUgmCL8rdS0vQ671iz51xyEJACJFInSKXGwR6R6QPG86kOdCFXh331egDq93QCSpl39VrjDCWfElxEctDUb3Q7GB88ksGJrj9PlZ+0Fnq6U0uoAijpz9IU4ZPUTUtZhNTOc9GfjmGOEm2b+9eYw8VSvgI/a1jpvEe+KO6qqNCJCTFmWXEBVm/sbNMCns4XAak1AG6BvZuI9PwShey1C7/tUu0UVj5L3pnUKCgcp7yAHbaVMzOZCY4CcweLM+5Flnk8DXgxs2WAzYfGZgKUAxoL4xhcKM4f66zHgOeTiqh3SQ9VHuFo4C/AtScLolKDMN4zL7cKNmvNSFeuKbJZaRpSsAOfuT9mhyicGPAciAJ7/zhdu8QupQHb6H/QBs5NsleZ+Qh76nOuTPvrE83f1Xky08eRbCSMOyBvy5scuiqTEwskghQvRRvvz+9JU/27TTFculDGTjv8Xm8ut1gDipuXeZvtYX/jdkaXA9Nf1SafVl4J2g6osOCYBcV6bMkw8YG8Dcmzp4PU3vQLcWWXnvErreAXIiakb45S2qaO1D5WxEcac4ZT6Q6mdE2YhfC3BRks3HQLgJ3QfutzQy+YWHaXBj+XQ5XVVdeDhwsTlg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(366004)(346002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(4001150100001)(6506007)(38100700002)(122000001)(82960400001)(2906002)(5660300002)(83380400001)(86362001)(8676002)(36756003)(26005)(2616005)(8936002)(41300700001)(6512007)(316002)(76116006)(66946007)(91956017)(110136005)(6636002)(66446008)(66476007)(66556008)(64756008)(6486002)(966005)(38070700009)(71200400001)(66574015)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzR5eVJRa0xzK1hFNGdMWHBUSDdreHVxakVXWFczMVNuOE51Q05lZE1nSUxz?=
 =?utf-8?B?RldNZ0tMVG5XWjR2VkJMOEJnLy9NRzNRWkhZWm14cGFDTFJ1VG15OUJSbVRH?=
 =?utf-8?B?RGErY2xBaE1aUHFhb2NGNEs2dE1GL0Q2SDd0T0JOZmhhd1lIMnVzcVZjMVFF?=
 =?utf-8?B?UEsvMTdBemMwTUIrenZTUis2OEwwMGp5RWc3a2lhczA4Q0RWeFVnR2VIcWFt?=
 =?utf-8?B?c09wYmlncGRsWE5yTk5WRGY1ck1sU3RtanJiV2R4RXhNUDVNb1pzYmpKUnEx?=
 =?utf-8?B?VlYvMkxhNDBxOFVxTHpWSWRqSjNCMisvY1dBNHVuUjRhWHAzd2ZoSDhQbXQ4?=
 =?utf-8?B?VmxqbFdsNGFEaVIvY1hLdEJZbzZLbDVsZE5CWDNXbVp3TVdPMnhwWXl1Y00w?=
 =?utf-8?B?OUxpSU5WWXhuNjN3VXdzQzdKOCs1d1B0bmpINWJnQWlwNUVaR3k1T0hpM0p2?=
 =?utf-8?B?SUNiNDRud1FGcjZZY0t2WHIySFJQS2VQUFlXN3dXdG5ZU0xBc3FlUDlyc0Vv?=
 =?utf-8?B?VVREWERJZHdveTV5aXk3RHRZN1FEYXBZL1g1L0NjTjQ0RVhBdmpQRXNPTnYy?=
 =?utf-8?B?YjZvUkMyOHZRYXFnMnBLWDdhR2I1ZEdGQ2NkR3FydWlJVWVFRTlrWk0wdTk5?=
 =?utf-8?B?ajdhNzgrRExzNXNuK1M2NUcveUZUd0xENTk3UXpZMEpPd1lFcXdObzFwUjk0?=
 =?utf-8?B?WVVhK1dQNkp4YkU4T3lrbVY4d05aQ2tubnkzYUNBUEFlVllQcHlHT1M3UHZw?=
 =?utf-8?B?ZWlsenEzam9UbC9zb1I4UzA1ZDhFWHI1K0NQNVkwbkFsYk1oUU85dGl0M1Fa?=
 =?utf-8?B?QlhYM0ErdlpyT1pqTEp4SUpEV2lvbzRkRlFjRXNCQ0lxbnkrVUNBVm91YzZx?=
 =?utf-8?B?anZiVUlNYTRrT3M4dEdjcExXeTkzN0xkaSsxQnRQdTU0VlZkbGtYYmx0K3Rt?=
 =?utf-8?B?cE1uMVdEOG5GcUpBTmphUjdRU0FTajczRWtSSTN3enVEVUhrbU9tTjQ4QWRO?=
 =?utf-8?B?UlFnUHg1bHlZY2VpYzdIUHVCMkpTODRPdTZETWpRMHYrTCtUY3hJdzNMN0xw?=
 =?utf-8?B?WHQ1ZFRFdUVoeFJNNlZZRUk1bmRjL1dPS1JwREMzNmo0S2FWcE1uRU5jSjVa?=
 =?utf-8?B?UUFtU3pjdVpMbXlwSW1nY0tIRm1xR1RFeDRCY0N2MUtKZUFQMElIVllKdVhP?=
 =?utf-8?B?bm52eEVYZEoybHdNTkJicW9ZSGVPT1BROHNRWWxwbGtadjlKMG9YWFZsR0p1?=
 =?utf-8?B?UzRQclVVbmpSVEdkM1BSMTkzb2tWVytDZTBhVnhYYUtHVUoyYXNhVXRGYU80?=
 =?utf-8?B?RE8rcGlQZFB3WXB2Nnk0THIrc1NIZE9BTkpLSWU4T3ROKzBYRWJ1VXhMTTlO?=
 =?utf-8?B?Z2phc3FxdnR0bDFvdEtCYzRpbUplU1FYR01TbTNjRnNiQnBRb01ZQ1VRanNK?=
 =?utf-8?B?VFhYbzd6ZFpRQUd3akxJRlZtVHdQS1J0dzg3RWFGNkUrc2RNR21yN3R3ejEy?=
 =?utf-8?B?aGpGeVF4akMxNnpNTzZHaWg0SlJod0JIWXNZOE9WQnJOT3JiMXN1TXFMOTk5?=
 =?utf-8?B?UXdER3hhMkJQaE54WTBDMDY0cjdMT3pVZ0FzTHlYOXNQeVRWNG9WRm1QTGNx?=
 =?utf-8?B?SzlzMFM0b3oxeForbU54UjBHcjdCb1Ezd1pyOWJwWFc1RGpxQlZNdFVGRVIz?=
 =?utf-8?B?UEpqNk96WVN4OC9URW1MSmJLT0YxNnh4UHJSaFllcVp6WjNqYThuV3lkZ0w3?=
 =?utf-8?B?WC82ckpkNGdKNzFFN29DenlSendaYmtFNHhDQkxrcXp4T25vUkp1NHkrYlpL?=
 =?utf-8?B?ZzZTMXFUN0ROZnVnb3pLYmh3YTlpU2F6TDEwenRGSzB2emc0RGNiWTN1bzJM?=
 =?utf-8?B?cUF2ZnlRYWt3UXlDWkE3OUMzQm9SOXFaRDUwU25UdEhubnRTM1ZIbnRjTmdC?=
 =?utf-8?B?ZWY0emE2Q3pmY0M2ekl3RU15YjJETU1nRURzbmN0anZSOEg5RFZsS0xwMUdx?=
 =?utf-8?B?TVhRM3J0aTNZWVA4UUJyL1BtbTQ5TEpEM21kUm92bW5zaVJuaVVTMmhDWGE2?=
 =?utf-8?B?TzRqZkZWcUpRTkZsbG5rMXdtZkIzZlY1VkJEUHJGU29rcUhVTWFERTN6QlhZ?=
 =?utf-8?B?RnlxY2dlNWQrVXl5Q05nOXhuTUMzZXVJSENsU1NOaHRDdnFNVU1kSzBlMW1X?=
 =?utf-8?B?Vmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <408D94485EA13C4A96AD30EE0652571B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9e36dd-162b-498a-3df4-08dc022b3f56
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2023 13:46:34.8693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1KXdhB6GNVehFHPqcz0WGDDoulSfGxY187s1doxE/cfoKpahg22YadbkJmRE94IhGymzU8gENRhZFkIfGmnvsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
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

T24gV2VkLCAyMDIzLTEyLTEzIGF0IDE3OjQ3ICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IExvb2tzIHBvc3NpYmxlIHRvIHN3aXRjaCBmcm9tIENQVSBiaW5kaW5nIHRvIEdQVSBiaW5kaW5n
IG1pZCBleGVjLCBhbmQNCj4gaWYgdGhhdCBoYXBwZW5zIGZvciB0aGUgc2FtZSBkbWEtcmVzdiB3
ZSBtaWdodCB1c2UgdHdvIGZlbmNlIHNsb3RzLCBvbmNlDQo+IGZvciB0aGUgZHVtbXkgZmVuY2Us
IGFuZCBhbm90aGVyIGZvciB0aGUgYWN0dWFsIEdQVSBiaW5kLg0KDQpSZXZpZXdlZC1ieTogSm9z
w6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+IFJlZmVy
ZW5jZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNz
dWVzLzY5OA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRl
bC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5p
bnRlbC5jb20+DQo+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jIHwgMTIgKysrKysrKy0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZXhlYy5jDQo+IGluZGV4IDYzZTgyZTUyODViYy4uMGM3OGEzNzdmNDUzIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9leGVjLmMNCj4gQEAgLTEwNywxMiArMTA3LDE0IEBAIHN0YXRpYyBp
bnQgeGVfZXhlY19mbihzdHJ1Y3QgZHJtX2dwdXZtX2V4ZWMgKnZtX2V4ZWMpDQo+ICAJCXJldHVy
biByZXQ7DQo+ICANCj4gIAkvKg0KPiAtCSAqIDEgZmVuY2Ugc2xvdCBmb3IgdGhlIGZpbmFsIHN1
Ym1pdCwgYW5kIG9uZSBtb3JlIGZvciBldmVyeSBwZXItdGlsZQ0KPiAtCSAqIGJpbmQuIE5vdGUg
dGhhdCB0aGVyZSBhcmUgcG90ZW50aWFsbHkgbWFueSB2bWEgcGVyIG9iamVjdC9kbWEtcmVzdiwN
Cj4gLQkgKiBob3dldmVyIHRoZSBmZW5jZSBzbG90IHdpbGwganVzdCBiZSByZS11c2VkLCBzaW5j
ZSB0aGV5IGFyZSBsYXJnZWx5DQo+IC0JICogdGhlIHNhbWUgdGltZWxpbmUgYW5kIHRoZSBzZXFu
byBzaG91bGQgYmUgaW4gb3JkZXIuDQo+ICsJICogMSBmZW5jZSBzbG90IGZvciB0aGUgZmluYWwg
c3VibWl0LCBhbmQgMSBtb3JlIGZvciBldmVyeSBwZXItdGlsZSBmb3INCj4gKwkgKiBHUFUgYmlu
ZCBhbmQgMSBleHRyYSBmb3IgQ1BVIGJpbmQuIE5vdGUgdGhhdCB0aGVyZSBhcmUgcG90ZW50aWFs
bHkNCj4gKwkgKiBtYW55IHZtYSBwZXIgb2JqZWN0L2RtYS1yZXN2LCBob3dldmVyIHRoZSBmZW5j
ZSBzbG90IHdpbGwganVzdCBiZQ0KPiArCSAqIHJlLXVzZWQsIHNpbmNlIHRoZXkgYXJlIGxhcmdl
bHkgdGhlIHNhbWUgdGltZWxpbmUgYW5kIHRoZSBzZXFubw0KPiArCSAqIHNob3VsZCBiZSBpbiBv
cmRlci4gSW4gdGhlIGNhc2Ugb2YgQ1BVIGJpbmQgdGhlcmUgaXMgZHVtbXkgZmVuY2UgdXNlZA0K
PiArCSAqIGZvciBhbGwgQ1BVIGJpbmRzLCBzbyBubyBuZWVkIHRvIGhhdmUgYSBwZXItdGlsZSBz
bG90IGZvciB0aGF0Lg0KPiAgCSAqLw0KPiAtCW51bV9mZW5jZXMgPSAxICsgdm0tPnhlLT5pbmZv
LnRpbGVfY291bnQ7DQo+ICsJbnVtX2ZlbmNlcyA9IDEgKyAxICsgdm0tPnhlLT5pbmZvLnRpbGVf
Y291bnQ7DQo+ICANCj4gIAkvKg0KPiAgCSAqIFdlIGRvbid0IGtub3cgdXBmcm9udCBleGFjdGx5
IGhvdyBtYW55IGZlbmNlIHNsb3RzIHdlIHdpbGwgbmVlZCBhdA0KDQo=
