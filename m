Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF91C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 15:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD20910E172;
	Fri,  3 Nov 2023 15:39:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C279110E172
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699025957; x=1730561957;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MdunNYof2hRTeYwOo8ShL9MitQ5ZsJq6Z34f6Nga8Nw=;
 b=KzyIAwX5RxFeq7nik9fqWrkz8W2X7/UXPwsVDoq5jCrDrr+UpFuzIauU
 gUJMy5AEXUruKcKF4fuubdPF6sdC/TGj9oHKxTTcA4lA9sRpTBHQpYVyz
 ioxYTdSnKmvj85QWyWFugTCwy13nLrlqnyO1lFVsBylp61UvRwO0gy/lM
 1tckvuQDIXNF32KgyVmK7vj+6KFme37jlUL4OfML267ybmYFYRWL1YAfN
 i8s+iB+QcsCoavzm2x6S0TakqSB/fxyuV2bli8hqjg8z1wHR4Fts9lY5s
 qlSthaiUivYSsJdbBaI1rI2onONXFq8i/81IPnMR1MHngkWeHz6VYX4Kh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="420078701"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="420078701"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="905381608"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="905381608"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 08:39:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 08:38:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 08:38:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 08:38:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INg0CEKxP5jqTY7nEt1TGb8MbTj/7aLPGR1iA7FhC0kVyfUPRW2aq2r57+mYB/MPID6sBMEKZtwXWMZG514zoTtbXmAK77EO7x1safeti+GnrTrhPVDGRI1EoRQvFQMDJkNgGFeMPC32LcDILORvV5Iw/Fm8d78Z2JH1X70bapGXKU5E+dMvS5356YdQ5FjbXZtPWT0FnhHaNckWEwHu80GmwSpmhhWpPbb5YK+Lz4w7MsunJvmqVQRFG28ueDAkyrSXdNgdKsd7YhVNPODq9v1ch4GVv1BlWcBI/4vPQ4u5meLQbRbOJ7weFK5Ap5C1TgRkdCP5KDfakI7b6N41nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdunNYof2hRTeYwOo8ShL9MitQ5ZsJq6Z34f6Nga8Nw=;
 b=VaZcyiG8QasOCeIoDHiD/9mULhz3as4ZEyXq2/CwitICepoRUY32Mk7MorWxShc6TMf67mcEEzNaqagIED4NbaXoCYiJ4o0drAcGfkBE4ncKgmMaTntYaLkmqsGX/khQSvOnIwzd+fHytHWFId8XIvHP8sRjfM98e4ATD9CkSIG/CeaXinhCTAGoiSPo0LQoOucCBEKRe7SSzHuecbZlQX4LmIrTHms4rsOjR/dGi2X0lYktxXpmnZJRgcFlA3wPB6dfrRTFUN9CAX+tFw8bWGg2R7yRTbccdXyuGJcmzRhDWN3BYbT2SODf6BCFXzN2ClH7EWVqNBGmQ/YDlQlxKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH0PR11MB7493.namprd11.prod.outlook.com (2603:10b6:510:284::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 15:38:56 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f%7]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 15:38:56 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [Intel-xe] [RFC v2 0/2] drm/xe/pvc: Enable fixed CCS mode
Thread-Index: AQHaDR9FQ9iUkzkupkKNfE8iiuxKDrBnXiiAgACvaQCAAK/lgA==
Date: Fri, 3 Nov 2023 15:38:56 +0000
Message-ID: <f8ee52c0faa2852d75ee85b079f8a526fa802376.camel@intel.com>
References: <20231101235749.4720-1-niranjana.vishwanathapura@intel.com>
 <1984105530cb00a1e782aea061e21f645bac5ee7.camel@intel.com>
 <ZUSAgnXJfrs7K/Xa@nvishwa1-DESK>
In-Reply-To: <ZUSAgnXJfrs7K/Xa@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH0PR11MB7493:EE_
x-ms-office365-filtering-correlation-id: dbf6fe53-796b-4ee7-70be-08dbdc82fdc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lUVRNmbTwk1iXbeKrMV8uCB/NY00WwHJ/ocklBrxEa+2OXKwJiKxaM7VjuMC2kOSUKMrFfbuW2pZXZHcMpZ+rZ60RqwLWxvfJeoFiEDBNkCdKy6sx6RBkM6O65DAqAjSOBG3ZlIOo1qZxVHyeh8q9WMXAJ0LjGvqy2kFOXvmF4MNCZn/yKxOtVhT0LM0MqO2FbcU1Rvo7D9/+kMxbZIPbqXS9dV9/obhRsefXNdWBS9azzBZgskUdbYcW+mlQz4NeVV+WbCnXzu+be/w+Y2X8kZN6D6kCamdNMEvP6WMxdB9GU3eJ9ZRt2jMmI7aM8qYZVB1PhYbWW+/ifRscCrjrk/fBwKJ7ZDRjn2ShiL1VLyNzSp2BA1ZtItV1WIbKF1/qgylq6AhFUrMBW/u35NFg89VnAHOJHh1ouVGSdd+/4AEZh9hUTSK4WU9l0lVmAh60viLsmH3y4A43ZtqWIu/2DnDX73CjKJt4DB4w6I8TttsoWOPHbEzREZUuWuvpAVLgmNMNdzBU7OdTqCfCb1l6RtXlWg412zJaFHbqVmKet4NyO6u8LFI1VnWpHC5bem0flMDKhIC42rvfrxnizwY9fB+nHrBLdzSfeobSoIxMJM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(2616005)(6512007)(38070700009)(36756003)(86362001)(82960400001)(122000001)(38100700002)(71200400001)(2906002)(5660300002)(6506007)(478600001)(6862004)(4326008)(8936002)(8676002)(37006003)(66946007)(64756008)(66446008)(66476007)(6636002)(26005)(66556008)(316002)(41300700001)(76116006)(91956017)(6486002)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YitPWFczRWJsaGdhamdwVXdLZkZSU2JnbGRBb0pUQkxlYmJYVTJENjZybW5G?=
 =?utf-8?B?bTF3cktDUFNYejR6NFFpQjRpZ3c3aTRLTVRUN29IY1FydlAyWktHbTRFNVRk?=
 =?utf-8?B?NjZlTDhtdG1lZ3p3Y2R1WkpWMFFCanJ3TERYNEhtaVcrY2VJMFh1aUR3RmlT?=
 =?utf-8?B?VFRHY1NqZDlTTDRvdDBvakZSQVBLT1RrSGJnWThiVEw3dUZyN1hDbTdyWXRD?=
 =?utf-8?B?dXp2VkM5UDJ4bWpBL0ZJeHNtdys1b2hORnhHaEwwYTA4NlpqbThHa0Q5R2JD?=
 =?utf-8?B?UW9McGhzSUQvV2Z0dGRkMzhtUDFNNHlVb3doOWxuMkxTSmx6cWF3c1dBbWVn?=
 =?utf-8?B?bmFPbmtzelJRY0dOOW43dG9qWUJNWFdSM0JEUEx0dTlQRDd2QjNHTWdhZ2hC?=
 =?utf-8?B?blRUamRLRTkxU0tmR0NZdmlKV0VxSm9nK1IyNFpBckVIS2phbHZrdFhJa0U4?=
 =?utf-8?B?ZTN4REhaL2VkclpNOHZZRHVxalE3NDBRbktlQkxNQW9DKy9uZDc3NlR6MVRF?=
 =?utf-8?B?U2NnNW56WThrUkNPS3lXY0ZTMSt5ZXFybDFSVjNSMmVYWEdEY1NodTBvb2Vv?=
 =?utf-8?B?QkVEWHA5R0NXOTNqM0xhajhtTW5ZQTQrK1pROXdIRGtBNVJ6MEUxbVhNVU5O?=
 =?utf-8?B?NmJjcEN2ZEduZVV3TlBKdjJmSXN2TEtDdHlKNmEzTm1aS1VCY1lKL0JwcWVD?=
 =?utf-8?B?ZW9lNnVPM0ZBNUxZeWM2WXFyRFdIOEFsZGZIam1heUJKTEc3T2tsWFZvcmVr?=
 =?utf-8?B?dmtMWUJxWHlLMGFNMWplY2xJMVlqNjdIV09YWm5jVmFXdEZjUGx4SE50OVBI?=
 =?utf-8?B?TlZHNXoyNEhycnVhWWxaVzlsM0RaYzJHTDQvTmdFLzFOaU1iZUM0bW5wd2ln?=
 =?utf-8?B?L2wzbUZqN2RWU1I4Rzd6TWtvajd5TmY1eU9hb0lUVmovWGdlamltbnJSbnht?=
 =?utf-8?B?S0kvb05oWE05L3cvamRMUS9wemdud25MdDg4OVdDeHYvUGRMTk40SzcxODlv?=
 =?utf-8?B?Rkg4RHo1ZndiYTBzYVR5OEJ2YXNqZFdUY09mSU1ZSE9ta1k1aXU2WkxDbW9t?=
 =?utf-8?B?ekJsTE11ZXFIdkh3c1h5Ryt2b080UG9NSXNkeWJBQjJDOTNiVW5FTHBUa0JI?=
 =?utf-8?B?eGE4eEYwRFVaejNvaWovb0lDd1BSMEhXSWNjVCtNUVpmOXRqZmVuSHVPd3NP?=
 =?utf-8?B?NXNXUnpFWHFuTGl1YWVGYXViUUJRc24wb1NPVDJvNUEwdFNpRHFYNVYvQkE4?=
 =?utf-8?B?N09QUHBlbk1BcVI4VXgwMGdyMW5HUkJVQ2lVeWVualBNMVkyQW9FdWdoWEV1?=
 =?utf-8?B?TjdKazd5Zkpqd0wvNGV6dDBxaWE4aWg4Tk5laHMveFBsQWoya2dLQkNDUzI0?=
 =?utf-8?B?YWsyQ084MlZsTlhkbUNHdzBoMWt3eTVhK1J0eXc3VURoMTB1c08wWVc2YzRn?=
 =?utf-8?B?VjRHc0FYc21CU3FqdTZ3MDZmamFKc1duZ2lLcDlhNGxWZ0NudE16R1d5SFZD?=
 =?utf-8?B?bW5MdmpQUnhjeFN0dWErbEE4cEl0NlRuOGo4K1V2YWpMaHNIb1NTU2VmVlZJ?=
 =?utf-8?B?QWwra3l3Z1Y3SzdwSlRVclZvZ2t1bXdoQXNpVWh4TTcycWYwUU93T0JQMjZh?=
 =?utf-8?B?aHpYcFFVU1pHbGpna1pSUWRCR3d4T2lzd1UrRlp0RlZYVHNDZDR2RVVZVU94?=
 =?utf-8?B?R1JpZlByT05pVzVwT1UwbU1yeDVwamFmQitBdSs2UHkyU2RuR2h6TEpWRzBO?=
 =?utf-8?B?cGhuSGlSVE9abEdNMHkybythYlBwV2xUOE1uYXQxYUFDcEpVUUJCYXdWcitI?=
 =?utf-8?B?dnhlRlBmcUlnQmZKeXNjNGduVVYrdU9SREdvekZDNGQya2RXVnRXT1l6dDBB?=
 =?utf-8?B?d0M5enNGU2x2c3E4b0kwNzlxUzNVRG5kZUp4OVp0SHZuWGdZZlh4dDQ3S3pn?=
 =?utf-8?B?UWo4QW1kS2x3MWpyWS9WdUt5MHBUbE12TXB0YjUwL0F1TnAyT1Z5c3dEUlR0?=
 =?utf-8?B?UUlsMXU1eXpYKzdidG00bms2NXNOV25mRlhRY2FqcXRUZzA5Y1RqZzdEUWNU?=
 =?utf-8?B?MVVwOVVHcTRnQnhiYm4wU3FnN280VlF4UlJ3L3lzNW1PZnJIL0VMeFlpQVlS?=
 =?utf-8?B?aTBhWkVLUit3MG9vT3RLOHZUZUpSbGxYQlA5MzJoRnNmMnJhMFJHRVh0TlB2?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D14D7EE4039B4438F98412461C5F580@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf6fe53-796b-4ee7-70be-08dbdc82fdc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 15:38:56.3809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4WD7n3AO0//zYafo2sHVEr/f0QC9UucMW2MbtDXoTN9wiC1M7WQ7izGfZkF9usjQebPv455ThtSfmJV8jKPlsn97mGAM9PXQU/p4KXQBW+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7493
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 0/2] drm/xe/pvc: Enable fixed CCS mode
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

T24gVGh1LCAyMDIzLTExLTAyIGF0IDIyOjA5IC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOg0KPiBPbiBUaHUsIE5vdiAwMiwgMjAyMyBhdCAxMTo0MTozNEFNIC0wNzAwLCBT
dW1tZXJzLCBTdHVhcnQgd3JvdGU6DQo+ID4gT24gV2VkLCAyMDIzLTExLTAxIGF0IDE2OjU3IC0w
NzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIHdyb3RlOg0KPiA+ID4gQWxsb3cgc3RhdGlj
IGFzc2lnbm1lbnQgb2YgY29tcHV0ZSBzbGljZXMgdG8gYSB1c2VyIHNlbGVjdGVkDQo+ID4gPiBu
dW1iZXIgb2YgY29tcHV0ZSBlbmdpbmVzLiBBZGQgYSBwZXItdGlsZSAnY2NzX21vZGUnIHN5c2Zz
DQo+ID4gPiBpbnRlcmZhY2UgZm9yIHVzZXIgc2VsZWN0aW9uLiBCeSBkZWZhdWx0IGFzc2lnbiBh
bGwgY29tcHV0ZQ0KPiA+ID4gcmVzb3VyY2VzIHRvIHRoZSBmaXJzdCBhdmFpbGFibGUgY29tcHV0
ZSBlbmdpbmUuIFVzZXIgbXVzdA0KPiA+ID4gZW5zdXJlIHRoZSB0aWxlIGlzIGlkbGUgd2hpbGUg
Y2hhbmdpbmcgdGhlIGNjcyBtb2RlIGFzIHRoaXMNCj4gPiA+IGNhdXNlcyBhIHRpbGUgcmVzZXQu
IFVzZXIgbXVzdCBhbHNvIGVuc3VyZSB0aGF0IHRoZXJlIGFyZSBubw0KPiA+IA0KPiA+IEhvdyB3
aWxsIHRoZSB1c2VyIGtub3cgdGhhdCB0aGUgZGV2aWNlIGlzIGlkbGUgd2hlbiB0aGUgS01EL0d1
QyBhcmUNCj4gPiByZXNwb25zaWJsZSBmb3Igc3VibWlzc2lvbiBtYW5hZ2VtZW50IGJldHdlZW4g
cHJvY2Vzc2VzPyBUaGlzIGlzDQo+ID4gdGhlDQo+ID4gcmVhc29uIHdlIHdlbnQgdGhyb3VnaCB0
aGUgY29udGV4dCBjcmVhdGlvbiBpbnRlcmZhY2UgaW4gaTkxNQ0KPiA+IHJhdGhlcg0KPiA+IHRo
YW4gaGF2aW5nIGEgdXNlci1zcGVjaWZpYyBpbnRlcmZhY2UgbGlrZSBzeXNmcyBvciBpb2N0bC4N
Cj4gPiANCj4gDQo+IEkgdGhpbmsgVU1EIGhhbmRsaW5nIGl0IGlzIHRoZSBzaW1wbGVyIGFwcHJv
YWNoIHdpdGhvdXQgY29tcGxpY2F0aW5nDQo+IHRoaW5ncyBpbiBLTUQuIEFzIHdyaXRpbmcgdG8g
c3lzZnMgbmVlZHMgYWRtaW4gYWNjZXNzLCBhbmQgYWRtaW4NCj4gd2lsbCBoYXZlIHNvbWUgY29u
dHJvbCBvdmVyIHdoYXRzIHJ1bm5pbmcuIFRoZSBwYXRjaCAjMiBoYW5kbGVzIHRoaXMNCj4gY2Fz
ZSBieSByZXR1cm5pbmcgLUVCVVNZIGlmIHVzZXIgdHJpZXMgdG8gY2hhbmdlIGNjc19tb2RlIGlm
IGFueQ0KPiBleGVjX3F1ZXVlIGlzIG9wZW4gKGFzIHRoZXkgYXJlIGFyZSBhc3NvY2lhdGVkIHdp
dGggZW5naW5lcykuDQo+IFRoZXJlIGlzIGFsc28gYSBzdWdnZXN0aW9uIHRvIG9ubHkgYWxsb3cg
Y2NzX21vZGUgY2hhbmdlIG9ubHkNCj4gd2hlbiB0aGVyZSBhcmUgbm8gZHJtIGNsaWVudHMsIG1h
eSBiZSB0aGF0IGlzIGFuIG92ZXJraWxsLCBidXQNCj4gSSBndWVzcyBtb3JlIHNpbXBsZXIgdGhl
IGJldHRlciBhcyBjY3NfbW9kZSBpcyBub3QgZXhlY3RlZCB0byBjaGFuZ2UNCg0KVGhpcyBpcyBu
b3QgdHJ1ZS4gVGhpcyBpcyB0dW5lZCBwZXIgd29ya2xvYWQuIE9mIGNvdXJzZSBpZiBhIHdvcmts
b2FkDQppcyBydW5uaW5nIGFuZCBhbm90aGVyIHN0YXJ0cyB1cCwgdGhhdCBzZWNvbmQgd29ya2xv
YWQgd2lsbCBuZWVkIHRvIHVzZQ0Kd2hhdGV2ZXIgdGhhdCBmaXJzdCBvbmUgd2FzIHVzaW5nLiBC
dXQgaWYgd2UgaGF2ZSBvbmUgd29ya2xvYWQgcnVuLA0KdGhlbiBhbm90aGVyIHNlcXVlbnRpYWxs
eSwgYm90aCB3b3JrbG9hZHMgY2FuIGFuZCB3aWxsIHVzZSBkaWZmZXJlbnQNCm1vZGVzIHRvIGdl
dCB0aGUgYmVzdCBwZXJmb3JtYW5jZS4gVGhpcyBpcyBhbHNvIHRoZSByZWFzb24gSSBkb24ndA0K
dGhpbmsgd2UgY2FuIGp1c3QgbGVhdmUgdGhpcyB0byB0aGUgc3lzYWRtaW4gc2luY2UgdGhpcyBh
ZmZlY3RzDQppbmRpdmlkdWFsIHdvcmtsb2FkIHBlcmZvcm1hbmNlLg0KDQotU3R1YXJ0DQoNCj4g
dGhhdCBvZnRlbi4NCj4gDQo+IE5pcmFuamFuYQ0KPiANCj4gPiBUaGFua3MsDQo+ID4gU3R1YXJ0
DQo+ID4gDQo+ID4gPiBvcGVuIGV4ZWMgcXVldWVzIHdoaWxlIGNoYW5naW5nIHRoZSBjY3MgbW9k
ZS4gQWxzbywgZXJyb3Igd2lsbA0KPiA+ID4gYmUgcmV0dXJuZWQgZm9yIGV4ZWMgcXVldWUgY3Jl
YXRpb24gd2l0aCBkaXNhYmxlZCBjY3MgZW5naW5lcy4NCj4gPiA+IA0KPiA+ID4gU3VwcG9ydCB0
aGlzIG1vZGUgZm9yIFBWQyB3aGljaCBjYW4gYmUgZXh0ZW5kZWQgdG8gb3RoZXINCj4gPiA+IHBs
YXRmb3JtcyBpbiBmdXR1cmUuDQo+ID4gPiANCj4gPiA+IElHVDogaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjU4NzMvDQo+ID4gPiANCj4gPiA+IHYyOiBGaXhlZCBp
c3N1ZSB3aXRoIEhXIGNvbmZpZywgZW5zdXJlIG5vIGV4ZWMgcXVldWUgaXMgY3JlYXRlZA0KPiA+
ID4gwqDCoMKgIHdpdGggZGlzYWJsZWQgQ0NTIGVuZ2luZXMuDQo+ID4gPiANCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmENCj4gPiA+IDxuaXJhbmphbmEudmlz
aHdhbmF0aGFwdXJhQGludGVsLmNvbT4NCj4gPiA+IA0KPiA+ID4gTmlyYW5qYW5hIFZpc2h3YW5h
dGhhcHVyYSAoMik6DQo+ID4gPiDCoCBkcm0veGU6IEVuYWJsZSBGaXhlZCBDQ1MgbW9kZSBzZXR0
aW5nDQo+ID4gPiDCoCBkcm0veGU6IFByZXZlbnQgZXhlY19xdWV1ZXMgY3JlYXRpb24gb24gZGlh
YmxlZCBDQ1MgZW5naW5lcw0KPiA+ID4gDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtl
ZmlsZcKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS9yZWdzL3hlX2d0X3JlZ3MuaCB8IDE0ICsrKysrDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2UuY8KgwqDCoMKgwqDCoCB8wqAgMSArDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8wqAgOSArKysrDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9leGVjX3F1ZXVlLmPCoMKgIHwgNDUgKysrKysrKysrKysrKysrLQ0KPiA+ID4gwqBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjcgKysrKysr
KystLQ0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuaMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAyICsNCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2Njc19tb2RlLmPC
oCB8IDc5DQo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF9jY3NfbW9kZS5owqAgfCAyMiArKysrKysrKw0KPiA+ID4gwqBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaMKgwqDCoMKgIHwgMTYgKysrKysrDQo+ID4g
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmPCoMKgwqDCoMKgIHzCoCAzICsrDQo+
ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuY8KgwqDCoCB8IDE0ICsrKysr
DQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmPCoMKgIHwgNjIgKysr
KysrKysrKysrKysrKysrKysrKw0KPiA+ID4gwqAxMyBmaWxlcyBjaGFuZ2VkLCAyODggaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF9jY3NfbW9kZS5jDQo+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfY2NzX21vZGUuaA0KPiA+ID4gDQo+ID4gDQoNCg==
