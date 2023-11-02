Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176F6C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Nov 2023 14:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C2F10E09D;
	Thu,  2 Nov 2023 14:26:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E19210E09D
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Nov 2023 14:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698935203; x=1730471203;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=B+3KPDtSmUG2BJE2IwwqUo285QV5FoYIYX2nPCkkyFw=;
 b=NHkm1crkTkm1bPa6ysQfI4V5P4aW5RjtDniGDbm6Qyoo6RED0g9l8LSJ
 m9UN1dPQzlsJZ4buFo3vWRDyHSOucZTp2BfZR70CyncZDsrPXI7seyyZ/
 luWHVkaHvbrnJxFXEKAtl5ln61cESoMKXAhzlfC9HGrl6d7xTv02sWvy3
 e8vwQ5TbDmj9MmOXJMxwxnKiHhdfW4mzeV/5mlXzl5IpmfeFn1sqc1USM
 yYoLb3a/8X8Kz3Z0qDw3cTIZSOPEL+P3wd+LlKtF0TNsAZ8MCqIP9vbvc
 ZOXvt6gk2IZ2ZcRYiO6qBKGbc5nHDcFdAZk3APyR40tSYZZeYhdnRHmD9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="385898599"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="385898599"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 07:26:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="884903620"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="884903620"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Nov 2023 07:26:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 07:26:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 07:26:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 07:26:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rd6SfJQ5V7sKc0VvnDgNgdOy7QD4MNUp224usNz4Qt+SPFd4zmgUVdXVE02xhfYtRfJFrxTysiPia3FacohVBv6fI8yKRoC1OZ6l3XnQg2FDzV/YBC8DibZTYRNjKnUz/bPs5Ju/DIe3oph1qMG9tjdi3kvKupEdm21RI+3hOa3BOyy3J83YGzroPERh5UjGMZAvpdBbGWRXPkdo74LPKdU/PIDpHikhOly6MXRTdFdp4DF3W9tuNgp9PaNe/u9+4WQNfbLkEvAhDS1HoVrXIPfHxfUv7McBXRbC/OCgE9xxOZr32P5fvMQbXP3X8fbqRuhbPpLaDxlVF3x9DcZiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+3KPDtSmUG2BJE2IwwqUo285QV5FoYIYX2nPCkkyFw=;
 b=kHo1RdGWWIZvFQkUHTNvIYNwrsint8F35B/F/cJbjNsbdl+IzS868aTfu4zdPuucqeOn/Z3KmueiBWKD906RhLyMei2EpNJmDLjte2ijgjUes9miTdKzkBnUZ61uaKtP0uyf3IAmIEYcl+W4EBcUdx3NoGj75ad0WSwaWF5BlLa0lNnuyW6sBNdWxPABprIOulvua3NLkA+Dc7Pahtr0UIhZ0cmlVgx8SQSoff6Ct4kbavThGtWwPaFlC7MfKmXNrgRdMwQOxWP0eWZb1BBl5L3DAtOruMDTCdPMJNTCxOQ4CQf+i276DyXd6eYksuyKajeLjZIUw3HvkUOapXiT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ2PR11MB8539.namprd11.prod.outlook.com (2603:10b6:a03:56e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 14:26:34 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f%7]) with mapi id 15.20.6954.021; Thu, 2 Nov 2023
 14:26:34 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Welty, 
 Brian" <brian.welty@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/1] drm/xe: Fix pagefault and access counter
 worker functions
Thread-Index: AQHaDRYqaqsXL1ubTUee4Iw1dkxZXLBnFvuA
Date: Thu, 2 Nov 2023 14:26:34 +0000
Message-ID: <dfa72eb1f55952cf7141d239f443072525f5e05f.camel@intel.com>
References: <20231101225244.3605-1-brian.welty@intel.com>
 <20231101225244.3605-2-brian.welty@intel.com>
In-Reply-To: <20231101225244.3605-2-brian.welty@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ2PR11MB8539:EE_
x-ms-office365-filtering-correlation-id: 20e7f432-b813-47d5-efed-08dbdbafb75d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EL8lkJvIr/g4DgNC+cII3djrDvfONJU5DzLKBm68C7tXdRlP/Og/wQeGNUrCFThxESY/EOM9slcsIvyf4V7ZkBbaYjbMvETdHN715+lXXMISr3JhNu0lXXkY7GBKkkcoBZPfM9X/oOVbrToAnBsOJAYkfFD2sLUdYlF55xE2AqXbKeoONRsiGJrPPb5A2ImcgibB/ya+ofzQQ+Rb7w+fKERDt8exJYL3+czJhPYCm3UwkPE0PYDYTg+1ex/g2klAuPG5TdkxdvCkxtjqIegoS2RNh64g5llnTjOAtCg7s/w2Ip5KXw8x3+hKD/IYb7oVyXelJuxhKkxVi51is91WAZ5nSKawGwwVsAUm3JYRsjtPRjQEJBNNuPuwtPfHzIH2MGvYG6dq71Ij5klUdrD/3deACatJgY+Bcu2eiI3HEftSvVSwg5BmzZxf7UZ6cLH5g1+flYTHD1zROGOUBIgZN4jXhDGCkhZrhy+eGAxVkNFFZ3wddcsFjO22zkndsVRAfXQ1ogXPCDnuxocdG6S0ZURrd+PrBsgwLXKfcHCvYxUpZ0B1cf6gy+crQFw8x1vrkcNxFzd6QbPyHGXld4wMOMDN8eYZkj0bXQ+L6QG/uN7izrmjOMhO72EeZn2Gps2S
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(26005)(107886003)(38100700002)(91956017)(110136005)(76116006)(316002)(6636002)(64756008)(66446008)(66476007)(66556008)(66946007)(5660300002)(8936002)(8676002)(4326008)(6512007)(2616005)(2906002)(6486002)(71200400001)(478600001)(41300700001)(6506007)(86362001)(122000001)(82960400001)(36756003)(38070700009)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uk96NDJyZU1KYlVMb3FlcTFOd0wvRlFoa1dEMXBGbXBGREx4RzFxaWR6THJ4?=
 =?utf-8?B?NUJPM083c3owRHpseEtBWVZBS2REQThzUFZnRk1vZE5QbFVVVDVHaWtJMytW?=
 =?utf-8?B?YUVwSnk1V1Q2NExZdlZ2WVM1SEJpak9LTUJPRFRSbjRJb21ZYUg3akQzOHRr?=
 =?utf-8?B?UExqTzI3cDBYWm5KRXhsejIzZzQ0aXcyTFcyRFhocTcycUtkakFxYnliQXdr?=
 =?utf-8?B?RnRFb0FkRXAwSlRxRCtibXJCU3RJTi9LNEJqQXM5L3pCOGpublBsVWp1SWtR?=
 =?utf-8?B?bFF5OXFibi9adXRhZEZyTVIweWQyQmRpZnVRSHl3dGtMNnk4blZmTjhXUWkr?=
 =?utf-8?B?aHovWjZvcVpPL0F5bHpDVkpsSDM3c3cveDNYOXFnWC8xbmZoaXRoNThta2h0?=
 =?utf-8?B?Snd0bW5Sa2hkS1BNOUdWVEo4RWJXb1R1OWxSRjlvTVJDVFh1NXRrekhZRlh6?=
 =?utf-8?B?Mkc0cHVSVDZuanIwaEFYUFdudzh0RXJ3UXR4bE1Zb2l6VDRSeUxoZ0FDd2Vs?=
 =?utf-8?B?bUVGSGJlNUdyL2w0dGZNN0xqbmZTZVE0bER4ZHVmZWs2NlNYenR3YzZsQTgz?=
 =?utf-8?B?NElPbHFyMkU4SkMrTEhkY0orVnFwM2YrY0UxTkdsTkFXU2s3V1FwQTZlUGZK?=
 =?utf-8?B?QmxxUm1zTUh1WklqaStEbS9VaGV2Z2ZGK1h1N2drWWNFOXpmQld6NjhzNkww?=
 =?utf-8?B?NnBTeWUreE9YMlluZ25LdmV3ZklHblRkejMwV2JmV2w5dlg5SjBmazVNMXI4?=
 =?utf-8?B?Lys0d21EaXJkc095UVhaMFFiOFJkNnlMdzh6eGV2ckE2aWJ6bHdtdUJuVmI1?=
 =?utf-8?B?OG52NGJ0alc5RzZmVHV2NmhmUkVKMThPZFFEczFDRkN0eUhYUkFURGxaMElR?=
 =?utf-8?B?TTIraURIbFpmWkVxOFZRazZ1RHJLczdpR0dmNFg5RExRM2x6Q3FhNURTNW5r?=
 =?utf-8?B?SE5yREEwbWxjRGhJdUt5OUlMZnFteWE3RnFkRnVKb1UyNDdSWE8rM3puQkha?=
 =?utf-8?B?ZklvTVdBQ0xIcW1CVXQyQmR4YWM2SGp5OCtnOWxNTUw2ZWExTDhuUE9temNP?=
 =?utf-8?B?TlNPR1pDRUlQZHdsNEpNdlpFWHpudXZkSmlBM0w1N3V0M1B3TnViNjhTRzlm?=
 =?utf-8?B?c1pWL0h1Z1YxRlU2Ukk2cTJmSDQwRVQ3NjVwdmdmalU2RFJoRGtlUEY2QUt1?=
 =?utf-8?B?dW80c0M0US9saSt3U3ZqQ3JlVDkzRWppamN5bU5aUWZQcVpMaWtvb24rZGtk?=
 =?utf-8?B?bzQwTEVsRk1maDlIMFBxMnEvUkpYQUREVmEzdnZzWWIvdFl6aGJVMmpOaHZI?=
 =?utf-8?B?eXQrMlNxQ1hrOGtEbDJZbGR0aHBpV3pYSFZTVnhKVFZNbVJTdjZnWjF0Sy92?=
 =?utf-8?B?NmhYcGhLV0hubE8rRGcwTXJxdnBnRy9UNE1CNTRIVnU5dUdvd2N2QnBpUHo2?=
 =?utf-8?B?TDVuajZVdE1JNW5ZbUoyVHNUT0QyMDBSRzNUQ1FuWllPSWZiOHQ5VHdaOFN3?=
 =?utf-8?B?UURUNGZxQWZneFhqMFlxOWRqWWJSbnFneGkwTlJPNkxCbnJ6REJUdGsreUNj?=
 =?utf-8?B?N2EzTmNlV2pWWmdhTURLdkxqVW9Fcnhmc1RMaGk0UUxjT0YyVFUyTUgxelhH?=
 =?utf-8?B?NUovTm9lMXdRVFZYc0Z1ZXVWbFM1WGFsL09FaHVRNFl5UG1sYk82akFLUzRE?=
 =?utf-8?B?aThVbnB6TXZhRmhaUzgzK3VFZEpESlhLYW1mSTlUZm5tdDgveDRGenhweTJ3?=
 =?utf-8?B?dUZhdXFjYkJPbUhycEYyeSthTXRmZmp5TGpGbmxoU04wWmx1c04vRjJwNHNn?=
 =?utf-8?B?ZVNZcXlFOGxDZm8zd1hJaUFweGFGV2xaNzI1a3JpNGpFM0VScERDR3JObTZh?=
 =?utf-8?B?SUV2ZUdOZEU0TjF2cnpxQytBMW5RWTl2UDRWQndib08zc2ZxWGFDQytqdWZY?=
 =?utf-8?B?UFlDb1R2M1JERFJLWXNveE5wdXBwaS9qTllWNkhpSWRGSHM2dGhBNkxsZ3Fv?=
 =?utf-8?B?NHo2T0pxN2E3ZzVzdFlNQ2g3bHFhZU1Qa242cUgwdjgzcUZodTVxSHd6d3Bl?=
 =?utf-8?B?Z1VmVStnSHQ3Z2NYaSthd0dRbW9Yd0w4UGQ1VnJBTkE2YzdVYlhleGc3RGhZ?=
 =?utf-8?B?Rk1yKzk3REx4Vk13Yldqb0hxYWQxN3pXSVMrUE5iak1ORVlhaU84bHd5enhn?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D743F5D07243AC44997D513810BC96E4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e7f432-b813-47d5-efed-08dbdbafb75d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 14:26:34.5124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DxlDajRwoUIIndWgEb5gRtqXU8uv/r9Y9QElWf3NNPYDNCB+fuSBtR+oMeKM8OM1vg2B1GTsfA1O78nbIvnRIKw9TRjYYs6sVfG1chScW7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8539
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Fix pagefault and access counter
 worker functions
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

T24gV2VkLCAyMDIzLTExLTAxIGF0IDE1OjUyIC0wNzAwLCBCcmlhbiBXZWx0eSB3cm90ZToKPiBX
aGVuIHByb2Nlc3NpbmcgRzJIIG1lc3NhZ2VzIGZvciBwYWdlZmF1bHQgb3IgYWNjZXNzIGNvdW50
ZXJzLCB3ZQo+IHF1ZXVlIGEKPiB3b3JrIGl0ZW0gYW5kIGNhbGwgcXVldWVfd29yaygpLiBUaGlz
IGZhaWxzIGlmIHRoZSB3b3JrZXIgdGhyZWFkIGlzCj4gYWxyZWFkeQo+IHF1ZXVlZCB0byBydW4u
Cj4gVGhlIGV4cGVjdGF0aW9uIGlzIHRoYXQgdGhlIHdvcmtlciBmdW5jdGlvbiB3aWxsIGRvIG1v
cmUgdGhhbiBwcm9jZXNzCj4gYQo+IHNpbmdsZSBpdGVtIGFuZCByZXR1cm4uIEl0IG5lZWRzIHRv
IGVpdGhlciBwcm9jZXNzIGFsbCBwZW5kaW5nIGl0ZW1zCj4gb3IKPiByZXF1ZXVlIGl0c2VsZiAo
d2hlbiBpdGVtcyBhcmUgcGVuZGluZykgYmVmb3JlIHJldHVybmluZy4KPiAKPiBIZXJlLCB3ZSBj
aG9vc2UgdG8gcmVxdWV1ZSB0aGUgd29ya2VyIGlmIGZhdWx0cyBhcmUgcGVuZGluZy4gVGhpcwo+
IHdpbGwKPiBpbnRyb2R1Y2Ugc29tZSB1bm5lY2Vzc2FyeSBsYXRlbmN5LCBidXQgaWYgdGhpcyBp
cyB0aGUgcHJlZmVyZW5jZSwgd2UKPiBjYW4KPiBzdGFydCBoZXJlIGFuZCB0dW5lIHRoaXMgbGF0
ZXIuCj4gCj4gVGhpcyByZXNvbHZlcyBpc3N1ZXMgc2VlbiB3aXRoIHNldmVyYWwgaWd0QHhlX2V4
ZWNfZmF1bHRfbW9kZQo+IHN1YnRlc3RzCj4gd2hlcmUgdGhlIEdQVSB3aWxsIGhhbmcgd2hlbiBL
TUQgaWdub3JlcyBhIHBlbmRpbmcgcGFnZWZhdWx0Lgo+IAo+IHYyOiByZXF1ZXVlIHRoZSB3b3Jr
ZXIgaW5zdGVhZCBvZiBoYXZpbmcgYW4gaW50ZXJuYWwgcHJvY2Vzc2luZyBsb29wLgo+IMKgwqDC
oCBMaWtlbHksIHdlIHdhbnQgYSBoeWJyaWQgbW9kZWwgd2hpY2ggcHJvY2Vzc2VzIG1vcmUgdGhh
biBhIHNpbmdsZQo+IMKgwqDCoCBmYXVsdCBiZWZvcmUgcmVxdWV1aW5nLsKgIChNYXR0IEIpCgpJ
TU8gd2Ugc2hvdWxkIGtlZXAgdGhpcyBzaW1wbGUuIEVpdGhlciBnbyBvbmUgb3IgdGhlIG90aGVy
LCB1bmxlc3MKdGhlcmUgaXMgYSByZWFsbHkgZ29vZCBwZXJmb3JtYW5jZSByZWFzb24gdG8gZG8g
b3RoZXJ3aXNlIHdoaWNoIEkgZG9uJ3QKc2VlIG9idmlvdXNseSBoZXJlLgoKSSBkb24ndCB1bmRl
cnN0YW5kIHRoZSByZWFzb25pbmcgdG8gdGFrZSB0aGlzIGJhY2sgaW50byB0aGUgcmVxdWV1ZQph
cHByb2FjaC4gSU1PIHRoaXMgaXMgbGVzcyBlYXN5IHRvIHVuZGVyc3RhbmQgYW5kIGFzIEJyaWFu
IG1lbnRpb25lZCwKbGlrZWx5IGxlc3MgcGVyZm9ybWFudC4KClRoZXJlIGNvdWxkIGJlIGEgZG93
bnNpZGUgdGhhdCBob2xkaW5nIHRoZSB0aHJlYWQgb3BlbiBmb3IgbWFueQppbmNvbWluZyBmYXVs
dHMgYXQgdGhlIHNhbWUgdGltZSB3aWxsIGVhdCB1cCBhIENQVSB0byBkbyB0aGF0IHdvcmssCnBl
cmhhcHMgaW1wYWN0aW5nIG51bWEgYWxsb2NhdGlvbiBvZiBzb21lIGFwcGxpY2F0aW9uLCBidXQg
dGhhdCBzZWVtcwpsaWtlIGEgY29ybmVyIGNhc2UgdGhhdCBpc24ndCB3b3J0aCBwdXJzdWluZyBh
dCB0aGlzIHBvaW50IGluIHRoZQppbXBsZW1lbnRhdGlvbiB3aXRob3V0IGFueSB3YXkgdG8gZ2V0
IHRoYXQgcGVyZm9ybWFuY2UgZGF0YS9pbXBhY3QuCgpNYXR0LCB3aGF0IGlzIHlvdXIgcmVhc29u
IHRvIHN3aXRjaCBoZXJlPwoKVGhhbmtzLApTdHVhcnQKCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJp
YW4gV2VsdHkgPGJyaWFuLndlbHR5QGludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF9wYWdlZmF1bHQuYyB8IDMzICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4g
LS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMKPiBpbmRleCBhYjZkYWViYmQ3
N2MuLjliMDgyODE3Yzg3NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rf
cGFnZWZhdWx0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMK
PiBAQCAtMjc2LDEwICsyNzYsMTEgQEAgc3RhdGljIHZvaWQgcHJpbnRfcGFnZWZhdWx0KHN0cnVj
dCB4ZV9kZXZpY2UKPiAqeGUsIHN0cnVjdCBwYWdlZmF1bHQgKnBmKQo+IMKgCj4gwqAjZGVmaW5l
IFBGX01TR19MRU5fRFfCoMKgNAo+IMKgCj4gLXN0YXRpYyBpbnQgZ2V0X3BhZ2VmYXVsdChzdHJ1
Y3QgcGZfcXVldWUgKnBmX3F1ZXVlLCBzdHJ1Y3QgcGFnZWZhdWx0Cj4gKnBmKQo+ICtzdGF0aWMg
Ym9vbCBnZXRfcGFnZWZhdWx0KHN0cnVjdCBwZl9xdWV1ZSAqcGZfcXVldWUsIHN0cnVjdAo+IHBh
Z2VmYXVsdCAqcGYsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBib29sICpwZW5kaW5nKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBjb25zdCBzdHJ1
Y3QgeGVfZ3VjX3BhZ2VmYXVsdF9kZXNjICpkZXNjOwo+IC3CoMKgwqDCoMKgwqDCoGludCByZXQg
PSAwOwo+ICvCoMKgwqDCoMKgwqDCoGJvb2wgcmV0ID0gZmFsc2U7Cj4gwqAKPiDCoMKgwqDCoMKg
wqDCoMKgc3Bpbl9sb2NrX2lycSgmcGZfcXVldWUtPmxvY2spOwo+IMKgwqDCoMKgwqDCoMKgwqBp
ZiAocGZfcXVldWUtPmhlYWQgIT0gcGZfcXVldWUtPnRhaWwpIHsKPiBAQCAtMzAzLDggKzMwNCw4
IEBAIHN0YXRpYyBpbnQgZ2V0X3BhZ2VmYXVsdChzdHJ1Y3QgcGZfcXVldWUKPiAqcGZfcXVldWUs
IHN0cnVjdCBwYWdlZmF1bHQgKnBmKQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBwZl9xdWV1ZS0+aGVhZCA9IChwZl9xdWV1ZS0+aGVhZCArIFBGX01TR19MRU5fRFcpICUK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQRl9RVUVV
RV9OVU1fRFc7Cj4gLcKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmV0ID0gLTE7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpw
ZW5kaW5nID0gcGZfcXVldWUtPmhlYWQgIT0gcGZfcXVldWUtPnRhaWw7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHRydWU7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKg
wqDCoMKgwqDCoMKgc3Bpbl91bmxvY2tfaXJxKCZwZl9xdWV1ZS0+bG9jayk7Cj4gwqAKPiBAQCAt
MzU1LDEwICszNTYsMTAgQEAgc3RhdGljIHZvaWQgcGZfcXVldWVfd29ya19mdW5jKHN0cnVjdAo+
IHdvcmtfc3RydWN0ICp3KQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9
IGd0X3RvX3hlKGd0KTsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d1Y19wYWdlZmF1bHRf
cmVwbHkgcmVwbHkgPSB7fTsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHBhZ2VmYXVsdCBwZiA9
IHt9Owo+ICvCoMKgwqDCoMKgwqDCoGJvb2wgcmVxdWV1ZTsKPiDCoMKgwqDCoMKgwqDCoMKgaW50
IHJldDsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoHJldCA9IGdldF9wYWdlZmF1bHQocGZfcXVldWUs
ICZwZik7Cj4gLcKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiArwqDCoMKgwqDCoMKgwqBpZiAoIWdl
dF9wYWdlZmF1bHQocGZfcXVldWUsICZwZiwgJnJlcXVldWUpKQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHJldCA9IGhhbmRs
ZV9wYWdlZmF1bHQoZ3QsICZwZik7Cj4gQEAgLTM4MCw2ICszODEsMTAgQEAgc3RhdGljIHZvaWQg
cGZfcXVldWVfd29ya19mdW5jKHN0cnVjdAo+IHdvcmtfc3RydWN0ICp3KQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgRklFTERfUFJFUChQRlJfUERBVEEsIHBmLnBkYXRhKTsKPiDC
oAo+IMKgwqDCoMKgwqDCoMKgwqBzZW5kX3BhZ2VmYXVsdF9yZXBseSgmZ3QtPnVjLmd1YywgJnJl
cGx5KTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgLyogVE9ETzogZXZhbHVhdGUgdG8gc2VydmljZSAn
eCcgbnVtYmVyIG9mIGZhdWx0cyBiZWZvcmUKPiByZXF1ZXVlICovCj4gK8KgwqDCoMKgwqDCoMKg
aWYgKHJlcXVldWUpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHF1ZXVlX3dvcmso
Z3QtPnVzbS5wZl93cSwgdyk7Cj4gwqB9Cj4gwqAKPiDCoHN0YXRpYyB2b2lkIGFjY19xdWV1ZV93
b3JrX2Z1bmMoc3RydWN0IHdvcmtfc3RydWN0ICp3KTsKPiBAQCAtNTQ0LDEwICs1NDksMTAgQEAg
c3RhdGljIGludCBoYW5kbGVfYWNjKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdAo+IGFjYyAqYWNj
KQo+IMKgCj4gwqAjZGVmaW5lIEFDQ19NU0dfTEVOX0RXwqDCoMKgwqDCoMKgwqAgNAo+IMKgCj4g
LXN0YXRpYyBpbnQgZ2V0X2FjYyhzdHJ1Y3QgYWNjX3F1ZXVlICphY2NfcXVldWUsIHN0cnVjdCBh
Y2MgKmFjYykKPiArc3RhdGljIGJvb2wgZ2V0X2FjYyhzdHJ1Y3QgYWNjX3F1ZXVlICphY2NfcXVl
dWUsIHN0cnVjdCBhY2MgKmFjYywKPiBib29sICpwZW5kaW5nKQo+IMKgewo+IMKgwqDCoMKgwqDC
oMKgwqBjb25zdCBzdHJ1Y3QgeGVfZ3VjX2FjY19kZXNjICpkZXNjOwo+IC3CoMKgwqDCoMKgwqDC
oGludCByZXQgPSAwOwo+ICvCoMKgwqDCoMKgwqDCoGJvb2wgcmV0ID0gZmFsc2U7Cj4gwqAKPiDC
oMKgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrKCZhY2NfcXVldWUtPmxvY2spOwo+IMKgwqDCoMKgwqDC
oMKgwqBpZiAoYWNjX3F1ZXVlLT5oZWFkICE9IGFjY19xdWV1ZS0+dGFpbCkgewo+IEBAIC01Njcs
OCArNTcyLDggQEAgc3RhdGljIGludCBnZXRfYWNjKHN0cnVjdCBhY2NfcXVldWUgKmFjY19xdWV1
ZSwKPiBzdHJ1Y3QgYWNjICphY2MpCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGFjY19xdWV1ZS0+aGVhZCA9IChhY2NfcXVldWUtPmhlYWQgKyBBQ0NfTVNHX0xFTl9EVykK
PiAlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIEFDQ19RVUVVRV9OVU1fRFc7Cj4gLcKgwqDCoMKgwqDCoMKgfSBlbHNl
IHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gLTE7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpwZW5kaW5nID0gYWNjX3F1ZXVlLT5oZWFkICE9IGFjY19x
dWV1ZS0+dGFpbDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gdHJ1ZTsK
PiDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKgwqBzcGluX3VubG9jaygmYWNjX3F1
ZXVlLT5sb2NrKTsKPiDCoAo+IEBAIC01ODEsMTAgKzU4NiwxMCBAQCBzdGF0aWMgdm9pZCBhY2Nf
cXVldWVfd29ya19mdW5jKHN0cnVjdAo+IHdvcmtfc3RydWN0ICp3KQo+IMKgwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgeGVfZ3QgKmd0ID0gYWNjX3F1ZXVlLT5ndDsKPiDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZShndCk7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVj
dCBhY2MgYWNjID0ge307Cj4gK8KgwqDCoMKgwqDCoMKgYm9vbCByZXF1ZXVlOwo+IMKgwqDCoMKg
wqDCoMKgwqBpbnQgcmV0Owo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgcmV0ID0gZ2V0X2FjYyhhY2Nf
cXVldWUsICZhY2MpOwo+IC3CoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gK8KgwqDCoMKgwqDCoMKg
aWYgKCFnZXRfYWNjKGFjY19xdWV1ZSwgJmFjYywgJnJlcXVldWUpKQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHJldCA9IGhh
bmRsZV9hY2MoZ3QsICZhY2MpOwo+IEBAIC01OTIsNiArNTk3LDEwIEBAIHN0YXRpYyB2b2lkIGFj
Y19xdWV1ZV93b3JrX2Z1bmMoc3RydWN0Cj4gd29ya19zdHJ1Y3QgKncpCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBwcmludF9hY2MoeGUsICZhY2MpOwo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZHJtX3dhcm4oJnhlLT5kcm0sICJBQ0M6IFVuc3VjY2Vzc2Z1bCAl
ZFxuIiwgcmV0KTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqAvKiBU
T0RPOiBldmFsdWF0ZSB0byBzZXJ2aWNlICd4JyBudW1iZXIgb2YgYWNjIGJlZm9yZSByZXF1ZXVl
Cj4gKi8KPiArwqDCoMKgwqDCoMKgwqBpZiAocmVxdWV1ZSkKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcXVldWVfd29yayhndC0+dXNtLmFjY193cSwgdyk7Cj4gwqB9Cj4gwqAKPiDC
oHN0YXRpYyBib29sIGFjY19xdWV1ZV9mdWxsKHN0cnVjdCBhY2NfcXVldWUgKmFjY19xdWV1ZSkK
Cg==
