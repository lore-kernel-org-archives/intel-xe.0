Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D4DC7EE24
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 18:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E564310E1AC;
	Tue, 30 May 2023 18:40:49 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F9910E3ED
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 18:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685472047; x=1717008047;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=KimzVnMkjtmSmzZVWrqsafE5qUtOsb2ozTk0oz7oKsc=;
 b=ZzS8SYg5PH3nNkqM/N74/+1R4zEHQxfGneqrCw0UpdmCRbJh+NewJSB+
 K3uPMVpFmQf78O8Liwjv9cqwOnpmspnlMeWkccjPmRpvVxloA4OPtGPeM
 eHqOcmTBtbFbOqdCfmO6xasgaF6zs7se42ESc1Ad5a5YX8lOL+m6yox3x
 7NDyiibpN/3/1EYHHr+E+ofBMeplcN2QR22VsIUIKGRW+XOlkkB+9dFG6
 cx8I1eW8i8ciGTPqviUw8iXuNz0GPJc2c5weTxITPNWZfhz+fm8XY8i/q
 lXAyROqn8WbatzQWG7pUf6UFcP5c8iZUg9nYQPdhuftI/Ynxk4Tqg0NLN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383273235"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383273235"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 11:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="709731215"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="709731215"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 30 May 2023 11:40:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 11:40:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 11:40:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 11:40:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arPj1vBZbBHEldeOiDFzWC5EK4hEOrOkFRmSqi3/mmxYW3BENReIILuZrjxADAR/Y4Vm4DMlhdmcimQmUYXnn/bEEPQ1UO2hShz5A3Doj8eTNCwOybgOezVrOModrots8bvrfq7mZLVPLz01FPbTUACegj+TAZSNOpD3yqZAqexk0ywqVfqH262igEk1T0nNCPch8reTpNKKU1eN/9kt1vLGivRZkioEMNfB4W8sztQeAEZNpXHtaRrN5Mlh7VHNX+8EkIjyDKt4kRBpS+o4VktdJFP9ajMPmXJVyIXUI+eUlUoH7fzgRwkRrmNEXuyIfjbafFFFg0H/c9C/sas2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KimzVnMkjtmSmzZVWrqsafE5qUtOsb2ozTk0oz7oKsc=;
 b=XleDAurNowwKWSKebma9e/nYz49dzIX0WThwrob8KWC0MmO60pZ25fu83BwaK38fm89v1UStq7Y8dqM/zH+OAsfZs8DSbK0DZIINErx6ysAfKTjWI6zHH/ZIkdGbZxcoKgXVI2/gvy7Uom5rRWdEvjM3cDQzo8dkbf5lAPdXAvI9wrl1eeyhcYOsE0o+SeqEOermlC62c8frzIDT5tIEJMkTEi/R+yYn2G6YaHs/x6lzvb56dBFfMA2F+b5FNaM0nXPcMFJxbQSeM98rwHstjGfsvt0gLDW4eHuo/4zzQ01V+ZsBsMRcxUhNN7yLknHwdq0KuFUHGgrxz5D8SjUeKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB6674.namprd11.prod.outlook.com (2603:10b6:510:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 18:40:42 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 18:40:42 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/3] drm/xe: Add missing TLB invalidation to
 emit_pipe_invalidate()
Thread-Index: AQHZkAUtFGZts1qe1EuhKbIIh8isAK9w+lSAgABe3YCAAAJCAIAAAy0AgAHNygA=
Date: Tue, 30 May 2023 18:40:42 +0000
Message-ID: <faf59c70a4e046654d734fa77629971595dd7331.camel@intel.com>
References: <20230526190609.61529-1-jose.souza@intel.com>
 <20230526190609.61529-2-jose.souza@intel.com>
 <d03fef471646a9e6141231ab38c264ea46ba291c.camel@linux.intel.com>
 <5d211028d654a8d824e899a073fad9e530c13e95.camel@intel.com>
 <495e7460-cb03-f049-9eb1-43512669acb7@linux.intel.com>
 <41f697fa-97dc-50dd-e438-c62bb1190afe@linux.intel.com>
In-Reply-To: <41f697fa-97dc-50dd-e438-c62bb1190afe@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB6674:EE_
x-ms-office365-filtering-correlation-id: 3b4a077f-517d-42ad-3e8a-08db613d5f75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rf8PfLKTlR0xrlzqefiLJocjkuU2mGu9TqCQHb9yrfRyBC3jDf1MQ02DmC9NavPYf6epLKQWpkDRl6k7V2BZPSJJMblA00tgsC8GZR0Pcxw0YgXhrJFzwORLNDmxKs02YCyuz6ooKflC/eZ0UNx4FoK/jDP+1QfQ83vCnoKLOfs3ntOJaIjZ43CaJY3dlQ11eefHL/hN3vDg5+4eqWnys3kZf+eW4MyOc13Jvatwi1fiQLI1VKv/DssHoQ6ZFPQWWmnbx/tLL9kfhgs0gFt6iOS4grgkY6boxlwVi78S8NjChNadnAEXfX1Qhk2jEgl6o9gXe7wV9a4GiW+/LqvOq1v11n6WumiBvYgcMRH9a9zeKcs9hId708aAR3e0M8FX7vR/t9aPLZRGoAuvzuQ4d8zSkx9PYVeHOyALULWJ5tHIB5CHnVskrpGsOgcSKo0X8mZhbCjyv39YpiKeQTt+h6UnIo/nmgoqLl/pIoAU1wdDIKpQPXe2RdVj6x4ol4fu1LGethDz5crOznENHB/BqVuIlsMvDL+DU8mD0lWonWTsrS7XnDW6riWpnpfOTpKd9x1ZfYCWnjjYIwqcIlktx0vOCXRv9q1cV3VEZzL/sy7PaZT7aqiWT00vxGEzLhxh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(86362001)(36756003)(38070700005)(110136005)(316002)(91956017)(64756008)(66946007)(66556008)(66476007)(76116006)(66446008)(478600001)(6486002)(71200400001)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38100700002)(82960400001)(122000001)(2616005)(26005)(186003)(53546011)(6506007)(6512007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkxzY3l2c01mRG83Z1FuYis0Rk9xL3dCR3BrbHRYcGx5Ui9KMmZjZkJMUlJy?=
 =?utf-8?B?NHBSM3NXR3VpYkhtVXB0Y21ma0pMMUNEcmpiT1BKTjdkNlJuNnpkeFl3K0w1?=
 =?utf-8?B?dDR0eWN1aFBkWXV0RXRoSU9PSEkvekRKeHlNeUwyWGl2REFjUDdtb3V5RUNk?=
 =?utf-8?B?VTFuZU02Q2VwazZ1Vk8vR3Z6K2FBbEtNVDlPc0JNc2JLQzdtbGZsOGJYcnhT?=
 =?utf-8?B?ZXhiVThmcFhReVZXSXduNkJ0UTFMRTdwaHRFMXVKWk1nN3Btd2l4QVlTa1gz?=
 =?utf-8?B?UjNKTUU1Z3JodlhiZ0pUb2EvM1k4NUpBMFF0RGswQWRCK0NOS0VrMXY3MGVv?=
 =?utf-8?B?T1NqaXNmd1paWUEvK3J5bWhac3FLZjdxeC9nbFJSLzFlRTRZdHYxM2V4V1hK?=
 =?utf-8?B?aGI4SXJmcTRmUUMrYXZDQkdTOTRaK09teFp1RWNUUnBlVnBxUWxVWU13M2JC?=
 =?utf-8?B?Uzdpczk4UHFaaytrYTB1ZjhsVy9RMGFCb2E2OG96L3J2d3FyYUJHTjNMK1ZB?=
 =?utf-8?B?dmFKeW1iNkU2ajc5VVI4N0RpSjNkWklEODFtTkhNL1FzNmRyNDRDYzJSK3Yr?=
 =?utf-8?B?a2FmTWJjUjczblVvSG5UTGk5YUhTY20vQkhjYzdzY0dxOVBFVnRWYU4zRlJO?=
 =?utf-8?B?a0NZS3Y4ZnNJcFFwQW9lYTVJTU9WQ1dGckp5LzJ6bHlaZ2UzQ2VuUUM0NjNa?=
 =?utf-8?B?bXQ0VnIweUo2amRxR3oyNWVzVmltRzhTZWp5TzZhK1RvNWY3VHlUa1o3VEVO?=
 =?utf-8?B?S2U1SFVsbEdRVTBiOXBUU0ZNQXVFQW9wTWMySlRCT01RUC9nQzlXbjFlNGxp?=
 =?utf-8?B?KzFJMVJkWW5rUUo5bExwMExDdm1Bc2ZScHhFcXY1MUkyZlNMSmxhWVUwcXFj?=
 =?utf-8?B?YWpxdGxnVjdvdEo1UGhpSWJISnBQU1hvT0ZtWFNnZFp4RXpES09LYVhuOWNk?=
 =?utf-8?B?blgwektsNmRnWlo0WnhMSmdqUXRFZW5Mc05XVzd2ZDZxRzNkSnBUMHhlWHFW?=
 =?utf-8?B?c2N5YnE4RUlnNzJMakFQWGsxaFhIdVVVZGZ1UmhJV0JObHJvTGNYTllSSmxa?=
 =?utf-8?B?T0FHYXdvZ251OGZRT1c5VUZuQnFGR1lncGxKR3B5NFVvaHdVTGZXRkpDaGta?=
 =?utf-8?B?SnNrN1gwSzVkbmY0MTVZNC91b3FKa0NoMXR6ck04S250MjRPWnpCNzQwNWVB?=
 =?utf-8?B?NERoQzNqMUxwa3hsdlBpdUptQ3B6NFJIeCs1MnJ1VkdTTG5KeGlocmFFWTV1?=
 =?utf-8?B?d0VnT3g2ZUg0cnV3Tk5YU3BpbllqK0tYM3BXYlBDZURYVTkrUVI1VVg1ckhV?=
 =?utf-8?B?M0pQY1dkWXgxNC9HSDJYWmtqeHA1TmpKQ3NUSXNEMWNGUkdpRXJKYzdGcVZ0?=
 =?utf-8?B?aUZlaVdyNmRoSGl4ZjNQUVJKUzJ4bW5jYWdUaXFPYXQvbjA4bFE4b1c4bS9o?=
 =?utf-8?B?QmtzOXc0NVhqRmZzZm9Sc1V3SnRVV2dVdTFkWldId0F1aUNYVjZURzFJNW9u?=
 =?utf-8?B?Nmp3bEpBV3FhTmZBMzBNSUdHZmdMeGU4cUU1SzVUc1ovWnZBU1NTVGViWDJ3?=
 =?utf-8?B?dXkwSFdzVnh2eHArbHgyRlcwMm0vbkRwNTBnR000SlY5dGRDWHlFZHlvczly?=
 =?utf-8?B?ZGZudEw5Z3JidWNQR2EzMXFqc3F1MlhPSENNdzE1bjltOXBOaU80bTVZVFFD?=
 =?utf-8?B?RFJTMkp6ekJDT1dIbUR4SFVnQWZ1NEdNUzl5cnFjYWZubGhVOVZvZjVHMjFw?=
 =?utf-8?B?Z3Z5UlFlS3RvcDlTc0NkZ2xlODFOQzJTUnU5UXFGSzRxa2syNkltZ1N6ak5K?=
 =?utf-8?B?UHRNM2dBbCtDU3IxcU1iUlZkalJGTmhJMGhyMHl2cmJSQjR6MEVGRjNZbXZU?=
 =?utf-8?B?bWQyQXNnM2hNcE9qc29CKzVHVjA5SU12N1QrM0o0eEVkV2lrQzlWNHdGZ3Rt?=
 =?utf-8?B?dGcwb0p0RGY3d1M2TXJwVk0vb0FCRDNBN1F3OUFvMjZoMDNTc3hqQmZKYjVE?=
 =?utf-8?B?dk5JSndZZFkrdkMwWWxSUktBd0VVd1EzS3daY2FES3Z5OXJBQWIwUVRNTEZv?=
 =?utf-8?B?TEIxVjdlbnVrVFVUR3NCU1NqeWV0TXNyblhlc1pLRmtTYmgyYUk1Si9IZ29X?=
 =?utf-8?Q?Ul4DA6BBsglkTm6cAA1nst+BT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B062E932053FA240AA30CF029EAC6FE9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4a077f-517d-42ad-3e8a-08db613d5f75
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 18:40:42.5441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eN+Xplp6AG6Uk5QJcA3lP55pLewRHjKIRYvLBvfZuEHILcOvuuxg/yD4XkbpCOzxs2GZ2o8ev6H/2QZP0cvLQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6674
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add missing TLB invalidation to
 emit_pipe_invalidate()
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

T24gTW9uLCAyMDIzLTA1LTI5IGF0IDE3OjA3ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToKPiBPbiA1LzI5LzIzIDE2OjU2LCBUaG9tYXMgSGVsbHN0csO2bSB3cm90ZToKPiA+IAo+ID4g
T24gNS8yOS8yMyAxNjo0OCwgU291emEsIEpvc2Ugd3JvdGU6Cj4gPiA+IE9uIE1vbiwgMjAyMy0w
NS0yOSBhdCAxMTowOCArMDIwMCwgVGhvbWFzIEhlbGxzdHLDtm0gd3JvdGU6Cj4gPiA+ID4gT24g
RnJpLCAyMDIzLTA1LTI2IGF0IDEyOjA2IC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIHdy
b3RlOgo+ID4gPiA+ID4gaTkxNSBpbnZhbGlkYXRlcyBUTEIgYmVmb3JlIGVtaXQgQkIgc3RhcnQs
IHNvIGRvaW5nIHRoZSBzYW1lIGluIFhlLgo+ID4gPiA+IEhpLCBKb3PDqSwKPiA+ID4gPiAKPiA+
ID4gPiBEbyB5b3Ugc2VlIGFuIGlzc3VlIGJlY2F1c2Ugb2YgbWlzc2luZyBUTEIgZmx1c2hlcz8g
SW4gdGhhdCBjYXNlIHRoYXQKPiA+ID4gPiBuZWVkcyB0byBiZSBhZGRlZCB0byB0aGUgY29tbWl0
IG1lc3NhZ2UuIFdlIGRvIFRMQiBmbHVzaGVzIG9uIHVuYmluZCwKPiA+ID4gPiBidXQgbm90IHN1
cmUgaWYgd2UgZG8gdGhlbSBvbiByZWJpbmQsIHNvIGlmIHRoYXQncyB0aGUgaXNzdWUgd2UgbmVl
ZCB0bwo+ID4gPiA+IGZpZ3VyZSBvdXQgd2hldGhlciB3ZSBzaG91bGQgZG8gdGhlbSBhbHNvIG9u
IHJlYmluZCBvciwgbGlrZSBpbiB0aGlzCj4gPiA+ID4gcGF0Y2gsIG9uIGVhY2ggZXhlYy4KPiA+
ID4gSSBoYXZlIGEgZ3JvdXAgb2YgdGVzdHMgdGhhdCByZXN1bHRzIGZsaXBzIHJhbmRvbWx5LiBJ
dCBmYWlscyB3aGVuIAo+ID4gPiB0aGUgcmVuZGVyZWQgYnVmZmVyIGlzIGNvbXBhcmVkIHRvIGV4
cGVjdGVkIHJlc3VsdC4KPiA+ID4gQW55dGhpbmcgdGhhdCBhZGQgYSBiaXQgb2YgZGVsYXkgYWZ0
ZXIgdGhlIGV4ZWMgZml4ZXMgdGhvc2UgdGVzdHMgc28gCj4gPiA+IEkgd2FzIGxvb2tpbmcgZm9y
IGFueSBtaXNzaW5nIGZsdXNoIGluIFhlIEtNRCBhbmQgTWVzYS4KPiA+ID4gCj4gPiA+IFRoaXMg
b25lIGRpZCBub3QgZml4ZWQgaXQgYnV0IGFzIGk5MTUgd2FzIGRvaW5nIGl0IEkgdGhvdWdodCB3
b3VsZCBiZSAKPiA+ID4gZ29vZCB0byBkbyBpbiBYZSB0b28uCj4gPiAKPiA+IEkgdGhpbmsgbWlz
c2luZyBUTEIgaW52YWxpZGF0aW9ucyBhcmUgbW9yZSBsaWtlbHkgdG8gY2F1c2UgcmFuZG9tIAo+
ID4gb3ZlcndyaXRlcyBvZiBmcmVlZCBtZW1vcnkuIExldCBtZSBkbyBhIHF1aWNrIGNoZWNrIG9u
IHRoZXNlLiBCdXQgdGhlIAo+ID4gcHJvYmxlbSB5b3UncmUgZGVzY3JpYmluZyBpbmRlZWQgc291
bmRzIG1vcmUgbGlrZSBhIG1pc3NpbmcgcmVuZGVyIAo+ID4gY2FjaGUgZmx1c2guCj4gPiAKPiBJ
dCBpbmRlZWQgbG9va3MgbGlrZSB3ZSdyZSBkb2luZyBwcm9wZXIgVExCIGludmFsaWRhdGlvbiBv
biBib3RoIHJlYmluZCAKPiBhbmQgdW5iaW5kLCBzbyB0aGlzIHBhdGNoIHNob3VsZG4ndCByZWFs
bHkgYmUgbmVlZGVkLgo+IAo+IChsb29rIGZvciAiaW52YWxpZGF0aW9uX2ZlbmNlX2luaXQoKSIp
CgpXaXRoIHRoaXMgcGF0Y2ggKyBQSVBFX0NPTlRST0wgZmx1c2ggYXQgdGhlIGVuZCBvZiBiYXRj
aCBidWZmZXIgaW4gTWVzYSwgZml4ZWQgdGhlIGdyb3VwcyBvZiB0aGUgdGVzdHMgdGhhdCB3ZXJl
IGZsaXBwaW5nIHJlc3VsdHMuCkRvIGEgWEVfR1VDX0FDVElPTl9UTEJfSU5WQUxJREFUSU9OIGlz
IHRoZSBzYW1lIGFzIGEgUElQRV9DT05UUk9MX1RMQl9JTlZBTElEQVRFPwoKRG8geW91IHNlZSBh
bnkgUElQRV9DT05UUk9MIGZsdXNoIGF0IHRoZSBlbmQgb2YgYmF0Y2ggYnVmZmVycyB0aGF0IGk5
MTUgZG9lcyBidXQgWGUgZG9uJ3Q/Cgo+IAo+IC9UaG9tYXMKPiAKPiA+IC9UaG9tYXMKPiA+IAo+
ID4gPiAKPiA+ID4gPiBUaGFua3MsCj4gPiA+ID4gVGhvbWFzCj4gPiA+ID4gCj4gPiA+ID4gCj4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXph
QGludGVsLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gwqDCoGRyaXZlcnMvZ3B1L2RybS94
ZS9yZWdzL3hlX2dwdV9jb21tYW5kcy5oIHwgMSArCj4gPiA+ID4gPiDCoMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3Jpbmdfb3BzLmPCoMKgwqDCoMKgwqDCoMKgwqAgfCA2ICsrKystLQo+ID4gPiA+
ID4gwqDCoDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
ID4gPiA+ID4gCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3Mv
eGVfZ3B1X2NvbW1hbmRzLmgKPiA+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVf
Z3B1X2NvbW1hbmRzLmgKPiA+ID4gPiA+IGluZGV4IDBmOWM1YjBiOGEzYmEuLjdjNzMyMGVmZWE3
MzkgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ncHVf
Y29tbWFuZHMuaAo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3B1
X2NvbW1hbmRzLmgKPiA+ID4gPiA+IEBAIC03Myw2ICs3Myw3IEBACj4gPiA+ID4gPiDCoMKgI2Rl
ZmluZQo+ID4gPiA+ID4gUElQRV9DT05UUk9MX1NUT1JFX0RBVEFfSU5ERVjCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMTw8MjEpCj4gPiA+ID4gPiDCoMKg
I2RlZmluZQo+ID4gPiA+ID4gUElQRV9DT05UUk9MX0NTX1NUQUxMwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgxPDwyMCkKPiA+
ID4gPiA+IMKgwqAjZGVmaW5lIFBJUEVfQ09OVFJPTF9HTE9CQUxfU05BUFNIT1RfUkVTRVTCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgKDE8PDE5KQo+ID4gPiA+ID4gKyNkZWZpbmUgUElQRV9DT05UUk9M
X1RMQl9JTlZBTElEQVRFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDE8PDE4
KQo+ID4gPiA+ID4gwqDCoCNkZWZpbmUKPiA+ID4gPiA+IFBJUEVfQ09OVFJPTF9QU0RfU1lOQ8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAoMTw8MTcpCj4gPiA+ID4gPiDCoMKgI2RlZmluZQo+ID4gPiA+ID4gUElQRV9DT05UUk9M
X1FXX1dSSVRFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCgxPDwxNCkKPiA+ID4gPiA+IMKgwqAjZGVmaW5lIFBJUEVfQ09OVFJP
TF9ERVBUSF9TVEFMTMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgx
PDwxMykKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19v
cHMuYwo+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYwo+ID4gPiA+
ID4gaW5kZXggZDJmYTBiNGM4YmNjMC4uNGYzZWYzOTEwOWI5YiAxMDA2NDQKPiA+ID4gPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jCj4gPiA+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYwo+ID4gPiA+ID4gQEAgLTM3LDcgKzM3LDggQEAK
PiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQSVBFX0NPTlRST0xf
SU5ESVJFQ1RfU1RBVEVfRElTQUJMRSB8IFwKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBQSVBFX0NPTlRST0xfRkxVU0hfRU5BQkxFIHwgXAo+ID4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFBJUEVfQ09OVFJPTF9URVhUVVJFX0NBQ0hF
X0lOVkFMSURBVEUgfCBcCj4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
UElQRV9DT05UUk9MX0RDX0ZMVVNIX0VOQUJMRSkKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBQSVBFX0NPTlRST0xfRENfRkxVU0hfRU5BQkxFIHwgXAo+ID4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFBJUEVfQ09OVFJPTF9UTEJfSU5WQUxJREFU
RSkKPiA+ID4gPiA+IMKgIMKgwqBzdGF0aWMgdTMyIHByZXBhcnNlcl9kaXNhYmxlKGJvb2wgc3Rh
dGUpCj4gPiA+ID4gPiDCoMKgewo+ID4gPiA+ID4gQEAgLTExNyw3ICsxMTgsOCBAQCBzdGF0aWMg
aW50IGVtaXRfcGlwZV9pbnZhbGlkYXRlKHUzMiBtYXNrX2ZsYWdzLAo+ID4gPiA+ID4gdTMyICpk
dywgaW50IGkpCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUElQ
RV9DT05UUk9MX0NPTlNUX0NBQ0hFX0lOVkFMSURBVEUgfAo+ID4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoFBJUEVfQ09OVFJPTF9TVEFURV9DQUNIRV9JTlZBTElEQVRF
IHwKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQSVBFX0NPTlRS
T0xfUVdfV1JJVEUgfAo+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFBJ
UEVfQ09OVFJPTF9TVE9SRV9EQVRBX0lOREVYOwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoFBJUEVfQ09OVFJPTF9TVE9SRV9EQVRBX0lOREVYIHwKPiA+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQSVBFX0NPTlRST0xfVExCX0lOVkFMSURBVEU7
Cj4gPiA+ID4gPiDCoCDCoMKgwqDCoMKgwqDCoMKgwqBmbGFncyAmPSB+bWFza19mbGFnczsKCg==
