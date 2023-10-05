Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F04E92728
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 18:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B3710E480;
	Thu,  5 Oct 2023 18:51:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A45510E480
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 18:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696531889; x=1728067889;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=jZ+c67AXXTZ797C5kqEpYw10eYPAKJd99BmRFjhKJAQ=;
 b=aNMdI7EXpPpszX2UgTpwVR/SD2Ip7CY1Kdsa+E0VRW1dg+30BUs/nW0q
 quZX24wNBZhdZFfm0tEMZtpB9xkPlQBm6epdWMvwaXAjCqL7ggzc7e7dG
 S8rwTnNLivzsprB7+f77T37wk9zqy/sDuRAuek71GC6tTaushU5MxECJE
 dIavCOj3/i9a95RLbNgQ48cupMVX/gBqt2iTdZHy9NO208joS9BG/Ry1C
 3gAgQJLzsaEhPfrbdgyFlhfzY8Wdik44LviC36UkpNeZDnMe4Ssgvg+Sz
 C/s/ynm1QDCr0XdgirJtYrurl3zt0HuLBMlIEqyl3q5LEY17L+L7jp/oe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="383483529"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="383483529"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 11:51:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="868044557"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="868044557"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 11:51:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 11:51:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 11:51:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 11:51:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POl0h5Vhv9I2Fow7hMihu/MAu3I2aGpo6ks9zp1gzMifwLahrvUuaIHz0SeN+lP9Fp/J/rEmIgctT6lK+p06sE9vJJtMP7Ww4XyApr16ASfmTnVjAYBrTLpXDxWYm1jkDzTevPt2907JVNQYgBVoeY+emclWxbK65Vl7XPGDaCXrGVcmxVQke7HLAx+kW4eCvze6zzl8r68UaME8ggleXkPYbDcsXZ5CRfQohLuNAxz2CmPGmbLKddWNLqOfIHHu7/Bi9i+DdzpsaEZa1XGx/mNyLJoejFLIrxZyll2QHuzVDlR9eKJJbjD3SfiFT9IsoT3hlRr6kTvJX5ogy5M8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZ+c67AXXTZ797C5kqEpYw10eYPAKJd99BmRFjhKJAQ=;
 b=gHHC2pYjaalRnZFi1hL4IP9xpSy+BWPhZzrp08IM+nbtsJxYo6j0Tu8tGkkpajkVxDDvw2wQZTh9BGK1gMLFuKblg8/nPvAWYAVk83B9g/hriBG8h2oH1sLfUYKu0RgjriCwmpImSq0u2TqWMnmVIzeXRr47UjWj6DHUgIH9T1xsAzc1s1eXoLU9nDB2TlZI2viXY5w4oeJRt1VOGcL/S4XZicXPRsOkPaZVJ23y/mhl46VTjPMzUmyyQ23m2aM3elOLnn2wz6e4dNEZt4bXULAwpXNGK81w9vv2SnSkepXKRy+QHlW3mO2IiDK3Fm4yRBQQAD/J1q1tT6H7Ktw3ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM4PR11MB5535.namprd11.prod.outlook.com (2603:10b6:5:398::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 18:51:25 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 18:51:25 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v3 0/3] Enable remapped display page table on
 Xe
Thread-Index: AQHZ97qWKRh35fjCp0q8IFqoMs950LA7imgA
Date: Thu, 5 Oct 2023 18:51:24 +0000
Message-ID: <207b0d110d5fac0e4a50ed0317d61134e3da1166.camel@intel.com>
References: <20231005183404.324835-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231005183404.324835-1-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM4PR11MB5535:EE_
x-ms-office365-filtering-correlation-id: 7093e95c-974d-446b-185e-08dbc5d41347
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8iKU+Iqcog/7hfbqbCOmdCUv5Ti51e3B3WCnxspCb8XemlZkGKibWz8jhvXxGPB8Aa6xVDxlQKTxqUFVvbX2lmF+cGs+KY2l+pckPsv2ADeMWhL6xNtqrdRbvNOt73U4Nm4LRTCKooxD3A9I4SfX6LjcHff58p8sX+fgQi31TySDbmYDjQ2uXbOiXVrz4mH/tXpt3vohDntRGcm2tfOUr9EZZoxswa3JjISnE87NG1fUr6aQGuaxJVYr6RGtAlRD26GYKHQLOi1Ey+Y6QwO9u+2Cj4SsMWJyCzi9Ig+u6lfYncnamgK9TUk5Z2Jb2iE32RPcc2pn/86s00jygAAOolPEAwInCODuW415s7b+DFyzzbM6tRZHYiBo7S1EyDSyA4C8w0HCWcJD+0hWKNiaqWQcnVYObowOqA0A2VperYGC6Vo6Ha13LsKpyZOWD+6Hy63G55tOJNexfsKEqeNavHwLuqzHU3ZQNullkcUvp0Ygi2jDUHs/q8SR72EbpEvMCzMRZZWiQEx53coLAagqRdgS5Q7KoOyxECiGT1Cem7/mbWAnonsjRs0l8l1WArgXsCfC9kgwUgxgD+c36Ef21iEfuW0MeYF2LHkgOsBRReQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(478600001)(6486002)(966005)(36756003)(71200400001)(38070700005)(38100700002)(41300700001)(316002)(8676002)(8936002)(66476007)(6506007)(64756008)(66446008)(76116006)(91956017)(66556008)(86362001)(66946007)(5660300002)(110136005)(83380400001)(4744005)(122000001)(6512007)(2906002)(26005)(2616005)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkpNYUx0UnV4Yi94ME45QXNYaE8vQVk0Z2lzWGJFZHJzN1NZWkpGU2FiWmhQ?=
 =?utf-8?B?c0svMS96WEtTRmlkUWQxSG1abHk2empvT3RyTnc2UmhZRjRwRFhtSW4vQWpR?=
 =?utf-8?B?ZG1WcDhrdjZCd01LY0R4bWgwV1d6cVhEWnB0MzZCRTFPT2JFRnZ3OFRTVTJ2?=
 =?utf-8?B?a1pTKy91TXhMMmhKa3pQbmhQeVBrV293b3d2NDlpYkprb3NhT3pWTWw4VXYw?=
 =?utf-8?B?ZkNNbHhRZHNVMW5wcTlvTFZBaUx6bWREUGw2MGZjamFOYmVYbExMdDZnSHI0?=
 =?utf-8?B?cFJJaGpYNVliRElhTThTRHhQb21ESXBiWFhaOVRJS0txbmxOK1o1WTYrQm5o?=
 =?utf-8?B?ZlFqY3dOZWtsTHp6VkR0VTRWcnNtaExKQllYbnlieEdMTEVPZkxRS08zaUMz?=
 =?utf-8?B?Y3dENzhwTUJmRXE1cUdNSWQwRHBjVzU4NUFCeFJVSEVMcEdVY0VHSGV6dVNI?=
 =?utf-8?B?MHYvSkx1eENrVUFKL0JPS0ovcUxHaS9kbzlWdEt3bWxnaWtFUzJxUE9Zakw2?=
 =?utf-8?B?SzdNdVhJZ0Q1TXNTSmRqcXE3Y1VSZnZFelc5bjk0ZTdXeW9XU05oV2l0Y3JF?=
 =?utf-8?B?Zi9VcVBMQi9nOGlKeXdzRnMrRG94Q0NzMERKektTQkt0eWJ3WjBLMkd3YjBE?=
 =?utf-8?B?VTZEbVJXdlpHUXlzK2FBdTFvb3h0dnNhY0crUG92QzJmMW9YTnNhenVFUURr?=
 =?utf-8?B?MjJ6TktpWmVaSVg4U1gzMit5cGF5M3FPaGZxOEtWelNIamVYREZrandpK2pC?=
 =?utf-8?B?OW41R0FtZHdaV09nc3B0QUFHd2trb3pBUjBCOUFyekM0NmNGSDA5UTNJbTFE?=
 =?utf-8?B?V3NBQ1RZK2N4WVhYU2t1b3h1Z3o1TTF3QmRPdUFGYTQ5eWV2dkJzL04rbXFB?=
 =?utf-8?B?TVk4cjJxaU8vaTlPa1hGL3kwdjU4Q0U4L3c1RG9wMGhrNjEvVWhIa0hFZk5i?=
 =?utf-8?B?OWRtekpLd1NscDA0b2tBZ1lKSGVyUXlUVThJY05nWUNRMlgxUnFONEY1Sjd6?=
 =?utf-8?B?Z1Q0T3dVTGNVV0dDeTZRdTlFaFNiWHk0dUp6dm9oV25kSHlISWRQcWxoWmQ3?=
 =?utf-8?B?TTJUKzE1SU1vZWgyUE9LbFdOVEV3RFdITmxJQU5vNDNqM0Y5c0ZFT1hLUzRU?=
 =?utf-8?B?ZjRWQ216bDlXcUZqSnZrWXJiYlp6dE5mSFNheFBCdk5wUVZEMVBtVCsyRUp6?=
 =?utf-8?B?STFuMkR4RDZqLzExbGUwNFdFZFJKR3Q0SWxhUFRpVVhYRkx1c0FXMjF0KzFo?=
 =?utf-8?B?eHAvZUR0LzVGY2YzNUJ0VHNEWkRFU1FDc3FxOFdXcktVOWFmYWt0MzNWbFg0?=
 =?utf-8?B?VDcyRzM4N0VRR2xlK0daRXJiV1JBSzNqWDJPZ1I1dUVaeXJwRHZBZEVLL3Z3?=
 =?utf-8?B?MUpUUEZzd0R3aE16NnJwS0hleG4wUlI5ZzQydFIyL01oVFVua3VMaVd1Z2NP?=
 =?utf-8?B?U24vTkVxaXZxdFNObmQxNXFLb0tKWFdGSXc2TlE2K21jMHNRK2J3N0UyWjNa?=
 =?utf-8?B?WElTNU9kQ200SElFYlpiZXNPZEV3WVNvcDBkdzIwS2RyR2pJSEdiS25KWTNZ?=
 =?utf-8?B?TWJvZm9LOW5Od0NLVHlCUmw2WksyM2Z3WnJ4VHVzaHJKSk5nbm53ekJDd1M5?=
 =?utf-8?B?eVNSNVU3ZVlNSDdvdFBlMVBNS3lGb1EvZlF4T1djdTlpZ1hWZE1iYUxRcm5M?=
 =?utf-8?B?T1V5WlR1MXVMMXJTcDRFUWFUS3ZIM1IrQUM2YzQ5Q0E3RUkzejgxR0tqZGM4?=
 =?utf-8?B?VU40MGJkQS9mYW8yTktwZ0tFQTVob3pCWU5CKy9IUWtxS0JrVTNCY0lLN1Yv?=
 =?utf-8?B?alhOWk10U1gxa3VHQ0pmQ1VPd1had2NwTElCMFFIWmc1ZnFvNloxc3dJbzhX?=
 =?utf-8?B?b1NDMXNyV25SRWRGZ0xUODJmSVVXVkR6cXR1UWVzRDk5eUZRSGM3UmUxRHlm?=
 =?utf-8?B?dHFwTWJHTlEzUHZNbEUyK3V1bDNoNlFZOXJsSERPRUlHZDY1Y2x6SkxnZ1Ro?=
 =?utf-8?B?ZTU4Wkcvbk9RVjBwaHIwZU12aHNVS01DMlNoSU41Q05ycEFoaytQUGZmSGM5?=
 =?utf-8?B?WjEzanRqMDVjMlZWV2ZwZmRuSnhydkJldnFWVEt1em9xclRBSTJHRTZZR0N4?=
 =?utf-8?B?bThKemV1WUFUT0NndEdwTFNldU5ucFdFdkoxcGpaV0hza3gwY0E5djgwcGwy?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C0C27069836CC48B48DFC8AC39E2A65@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7093e95c-974d-446b-185e-08dbc5d41347
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 18:51:24.9646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4qlpUeY706NM0HnWF0wF72zXWaO3lHUe7hyiFpqJcGVaWZtc6/JFI9nclNBOOwNrI+OIse6RaCWbieR6yi8u5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5535
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 0/3] Enable remapped display page table on
 Xe
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

VGhhbmtzLCB0aGlzIGZpeGVzIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUv
a2VybmVsLy0vaXNzdWVzLzYwNg0KQ2FuIHlvdSBwbGVhc2UgY2xvc2UgdGhpcyBidWcgd2hlbiB0
aGlzIGdldHMgbWVyZ2VkPw0KDQpUZXN0ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpv
c2Uuc291emFAaW50ZWwuY29tPg0KDQpPbiBUaHUsIDIwMjMtMTAtMDUgYXQgMjE6MzQgKzAzMDAs
IEp1aGEtUGVra2EgSGVpa2tpbGEgd3JvdGU6DQo+IEhlcmUgYWRkZWQgd3JpdGluZyBvZiByZW1h
cHBlZCBkaXNwbGF5IHBhZ2UgdGFibGUgYW5kIHRha2VuIGludG8gdXNlDQo+IHdoZXJlIG5lZWRl
ZC4NCj4gDQo+IHYyLiBjb3VwbGUgb2YgdGhpbmdzIGZpeGVkIGFmdGVyIGZvcmdvdCB0byBydW4g
Y2hlY2twYXRjaA0KPiANCj4gdjMuIHJlYmFzZQ0KPiANCj4gL0p1aGEtUGVra2ENCj4gDQo+IEp1
aGEtUGVra2EgSGVpa2tpbGEgKDMpOg0KPiAgIGRybS94ZS9kaXNwbGF5OiBBZGQgd3JpdGluZyBv
ZiByZW1hcHBlZCBkcHQNCj4gICBkcm0veGUvZGlzcGxheTogRW5hYmxlIHJlbWFwcGVkIGRpc3Bs
YXkgcGFnZSB0YWJsZXMNCj4gICBkcm0veGUvZGlzcGxheTogRG9uJ3QgdHJ5IHRvIHVzZSB2cmFt
IGlmIG5vdCBhdmFpbGFibGUNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9m
Yl9waW4uYyB8IDYzICsrKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNTIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0KDQo=
