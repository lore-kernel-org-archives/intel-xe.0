Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EABC4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 17:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B38410EB55;
	Fri, 12 Jan 2024 17:40:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B77610EB55
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 17:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705081199; x=1736617199;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=KGofNr6ddtAX4LGUQ5S7pY5OjHwUtwgrhGidibELH2I=;
 b=NKl2QGSKh4BVDs7LDvXlQccFbIC3IqbfTjtXm+tEjWZ7i8xaPey/I/aX
 HlYkWKb8HcmkG3rJvnNCyPJj0cOXhNl+An+L5ZfTDxs5uAodwEMWwTmr9
 M82gpCPXQXsBCMxdpu/EH5RbpvJSBxHr2Br+toEqTVYfB29vRGZlSn+1A
 idiMOuNdZ7VlV87TmBMmjTzH7IkWfet/CLKXYz/ULxO6R9OqUrQDzZHn7
 /JZWTUuDiYBqh/nY1p2ngA8wSfSgnDFMGcINt5KhybGC4VVUqVhuJb4S3
 w8oVyXn3waLMaWTlxTCCorG3bculsezg5ezTCrC3txBU4aAthOYMfL54C w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12719436"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="12719436"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 09:39:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="31459846"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 09:39:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 09:39:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 09:39:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 09:39:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZa+xJlV+zgsXxzUtxMjGg/N/Y+TwSH+GCSFxtihedJ/EAbH4mcd/+++H/boukrDDp9+/gU+p1h9BPAG3gio+jyEGt8/0ScN7v1q3C9KbJMxsPSuWu+ilwWvFUZ9dE1BwMxollzPP2MGOK6CWMY03V8rhWgCQ6tnUiR0vFxM7hpTtidIbKGafyC66TzD1ev2dAHnfhioNrvIiTL+HU5iiwR9Z3jYBSRULC/X6v7m/8bd7GIJ3JafW8oNyGeMcUJOCCaMMYVbRabBwp1b8ID3L4Rh49RMjcxXjH5NMQ5dKM05fwe6QXbLDzbmTMClTvQGIfOqxGkn/SunidQzaX9EdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGofNr6ddtAX4LGUQ5S7pY5OjHwUtwgrhGidibELH2I=;
 b=KsFB6yagrrKs0H0ht/h8yBdHQRIEC7iYq1C1g0WkrV6RYjUBr0AZTqXuBdkho/ejPQNGA7FaoqoC/l6fcwaciMmk7Y5erfj4t3s7OQc2M0Z2bzZnKaauai9vW8mDWtWtc79IDefpayYYHR2F8EGO7KXp8hYl829eIjKI/RkHniSK4NwsTosJh/3OgHrXbeD+Tb/PNl6qMaDadSdvvN2PELgzSAaLfrKf4toBolK/IlOZ13xwAhbazO+vTu5vHhbIqvI32OHfLBbrf5PJULaxAl9zSp11SPBAsFjedHM0OPWHz8VTxcs7ONMYWjilnDD9lGgZZ5+5ziPCaM+Y1E6SkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH0PR11MB5539.namprd11.prod.outlook.com (2603:10b6:610:d6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 17:39:54 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7159.026; Fri, 12 Jan 2024
 17:39:54 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Add uapi for dumpable bos
Thread-Topic: [PATCH 1/4] drm/xe: Add uapi for dumpable bos
Thread-Index: AQHaRVTAzG6ihv8EBU2ECLp1QXZ5VbDWcgeA
Date: Fri, 12 Jan 2024 17:39:54 +0000
Message-ID: <8520698b83f1d50cbd6d8b9c8c02d652f22cad7b.camel@intel.com>
References: <20240112124148.166954-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240112124148.166954-1-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH0PR11MB5539:EE_
x-ms-office365-filtering-correlation-id: 161138f1-6f87-4fbc-6bdd-08dc13957ccc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LVnc2Plk0kTG6Ez/ANWS6jL0QtjQ89BzMovnRA5iyf40Ao1qf2LEwBAHMQQ2CR1l+P48Wo7ZNgvtxMU1eCASF3AQGWfQ9tWh6F/lQ+BM4OHVZcx1dAwjPVVyD8Dp0XTFzJklovpd9ljoN6eGU2yen3lqBgont5LLDHQNe4R8JCmPuAvjp7KMTGmx9tZWUF7tZOVBoDSDj025FapNi4cZ32hLQACfxZuPXch8CaHpO+CWi7ZxOH+OZcy0atyiS4PUIq66SV3K7yHxrDdn/sf2QSsxqbhHmZ930kef+TfiKDRcwqXxqLyDk9ezpr0l1sC0lM8exrcCNzTbzsAt0NJqoTo6wfzJXd+t3bQqrXQjyR32+FG7SlT2O/AHk4M7i8+9sHM/i5wxVveRVBatHwOtA2hWMoqaniG9z/xNSxQD4uRkCKTH+CQtfrm00ouPvgnYPDAMH4VXpDaneLGQb7tWmfx1c7bvG5l7LKGyvhUJ0TQFSfFCIPy9AT9knYYJup/xoNAqpalqFOUXfvMgjHJ38tU4j7WrU6eF6fdw0QYyTPtAZCBDJrTWaZ4MoeLrLgkWrkrnD2oa4e2mpFfm2qUuuI4tARTYYbL0MmwcPkCQeGT6gBQ45hzDxhmsFXNCYP/G
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(110136005)(2906002)(5660300002)(71200400001)(8676002)(8936002)(41300700001)(66556008)(66946007)(66476007)(316002)(91956017)(64756008)(76116006)(66446008)(38070700009)(6512007)(82960400001)(38100700002)(122000001)(6486002)(86362001)(26005)(2616005)(478600001)(83380400001)(36756003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZW5helhWUXRpK2RMWDdlbHpoMHl3ZGdERGZ4Mm5GcktBdXhWYUNLVVpqNGpU?=
 =?utf-8?B?UlJwY2NURGV0Z3lrdkV5TUxpcGJLMUhUeDd0dWtCSUlHaHJjSXlKRFFqWFFM?=
 =?utf-8?B?bnl1eVp1RUk5Tk9hMWlpYmdqRkluQUdYd2dBSkI2Qkk2WUwxUkYyRGlXRURW?=
 =?utf-8?B?U3pTazlLWEF6ODVKbUtvUzRrRnc1aFdNbjFsczVLSklaa2M1Z0p5N1Fhc0h0?=
 =?utf-8?B?M2svZFBXTEJOY041cGphN3VWY1A0OVRrR1FuQ2ZRb1pkTmU1VWpacUttTGdZ?=
 =?utf-8?B?VmRtTzFhRS9nY0VmVXZ1ZGU0TndmYVA0ZDdqZFN1OGNNNHpYTjU1R1ZFeHhz?=
 =?utf-8?B?amJLWVNLVjQ2M05acTh4bnFVYmc4TWR2S1dNR2FNdHhUUXBucE5hY0lqV0dZ?=
 =?utf-8?B?MWw3WDVYUDNjOERrU3dIdkprRDYxNnkrTXVYWVJ6WDJvUGxYSE01cFpUd042?=
 =?utf-8?B?WVh0Mi9mU1BwOVFDZnNsTlJUcjVwdFJONi81VmRReVNwaERzaE5WckZzd2Ro?=
 =?utf-8?B?TXVhMkI4U0RDSDBPR2YvQlBCcDF5OWdEdlIwZXExOW1aalRES3dzMjBoREx1?=
 =?utf-8?B?aDNqMjh2TGZiWlhINnR6Zm5sUTlXZDRKNFdGa0c1dVBkY1hVelVoNHUrRFRt?=
 =?utf-8?B?SlllOU1KNERuTjlqWE1VNjE5clpLa3czaDlVcDJxRlBHSUFBZFFjR3pnMUhq?=
 =?utf-8?B?clZpUjg3Y01IeHFybUtOOElQVVAvUDIxSUNlZEVYRE01bklwWXRONkZ0c21k?=
 =?utf-8?B?UkZ6ZDBTa3hicm1pQzg5SWI2WCtjVmRtOVUvZDJhMFNiMlo2YW95RmZlSzJt?=
 =?utf-8?B?djg2aURXV09UbkhZeklHZmZCRi8xdmpvZEhhU3A2QnZybzZFd2lhcHZBUDVR?=
 =?utf-8?B?d1c1RVhWdHlLRTRDc0lNOEIyN1VRQndUQm8raTBqdGdxYnJuMGdiTXhsWHU0?=
 =?utf-8?B?cnJOTXpEMFpzTlFmTUtUdnB0OGVCbkFLakxSbWp1Q1ZqekcrS3JJL2xBTy9L?=
 =?utf-8?B?VklxZVJ0eTkrbVg0WFU0NmxMS1BtQ1JkYjNpaXRoOWV3UFJBZ3pUUlFUVU9N?=
 =?utf-8?B?YzVNNnVrTFZLNkI3STdxMXo4N0VJY0JWczR2OVIrKzd4Uk5lejJkc1VRTmFl?=
 =?utf-8?B?VncrZElHRXJTR0F4VXFRMW9yOFdrV2s0RytuVnRkSUhzeFJDamxkU09iSGhM?=
 =?utf-8?B?T3NTRzA1Nkh1L05KdnB6bTFOd0NEdnpMSE9uSlRFTElvRWxiL1d5cEY4ZjJ1?=
 =?utf-8?B?M3pxa21FeC9USjlWNW43TWpNRU1EV3RCWGtHYk1VNnE4NTNyMHVUZDFQOHlL?=
 =?utf-8?B?OVZvNGdnaStaUVlTQ0pwaENWWEhKOEEwZlFQRS9jOGlVRlpqaHVyY1FnR0V6?=
 =?utf-8?B?Zk93cHcveGhRanBEa2NVM1NqbXEraURZUFBjdHlCS2MvVnJZS3ZwN214M1hq?=
 =?utf-8?B?dEdBQXRmRmMvU1ZhbmtGeEFiUUxveEJ5TEFxc1B4dFNJd0d2K0RNcFNLc1Nh?=
 =?utf-8?B?ODZsbFo3Um13amthdVVpaEUzN3NlSm10bFRWRkdKR1NYSVFrTUxmbm1icDgw?=
 =?utf-8?B?OStNLzJrZk1GV21CNFBoRGEraldSamtOY2NvSjVtY3JWTXR4SnJQRG9uaUZo?=
 =?utf-8?B?a0ZXdmVPdlhibXNhWmhudnQyVHZFNTRYLzZyTDlKTjh5eU53SWJHU2RkRTkz?=
 =?utf-8?B?SW1YVkpUeFNBM2NzOTUrNXM1QXNBWlZYUjIvN2ZQNFFUcFVXdWE2QkJKdVJL?=
 =?utf-8?B?M3NpRVkySWRSRkJNc1o4UysyRFlVTWl6ZFhzcFV6SDdwbFVUR0FIZVlFUlZN?=
 =?utf-8?B?d3hBdXhzYjNjV2pRWmdzK3V4N2pWTktmRmlNVlB5bUYrSVRUOHR4OW5mWStL?=
 =?utf-8?B?R1lHekpzUGpPYy9YUVpodGRmRFVTTlNDTU9zSDRIeUdCTnBQM1kyQllySll0?=
 =?utf-8?B?UjAxS2xRcGNsRFR2ZFBHU3Z3NHFPMFY2Um9qY2pRUFJrVzRlYnh4UXgyOHJL?=
 =?utf-8?B?WVVVTXNmQ3NpNHUvWkFhdXVJM1JWMjFTN3lkK29rQ3FsTzBPS0xpMTg2Y3Va?=
 =?utf-8?B?bk5GZEI3WUxTQmRFT1c5VEtJR0ordGZqRnpWeTd2REVEcndURE9FajZUSGIy?=
 =?utf-8?B?ZmJnWmk2c29GaG9lK1FoYXE5aTlJQkg2KzJNNzFTTTBPRGs2TkpTb2M3cFFT?=
 =?utf-8?B?d2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <52A7128529F2DC47A8D92139C8F3FFC2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161138f1-6f87-4fbc-6bdd-08dc13957ccc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2024 17:39:54.4507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQgDNyBWn4yzgYuySmUWTwNV1JA7tq+TkUG4W3bMK5fl/Uep+BQTEJ8nSf8P6+j/XIHsVjXX9zfGNV7NMkF3TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5539
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

T24gRnJpLCAyMDI0LTAxLTEyIGF0IDEzOjQxICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gQWRkIHRoZSBmbGFnIFhFX1ZNX0JJTkRfRkxBR19EVU1QQUJMRSB0byBub3RpZnkgZGV2
Y29yZWR1bXAgdGhhdCB0aGlzDQo+IG1hcHBpbmcgc2hvdWxkIGJlIGR1bXBlZC4NCj4gDQo+IFRo
aXMgaXMgbm90IGhvb2tlZCB1cCwgYnV0IHRoZSB1YXBpIHNob3VsZCBiZSByZWFkeSBiZWZvcmUg
bWVyZ2luZy4NCj4gDQo+IEl0J3MgbGlrZWx5IGVhc2llciB0byBkdW1wIHRoZSBjb250ZW50cyBv
ZiB0aGUgYm8ncyBhdCBkZXZjb3JlZHVtcA0KPiByZWFkb3V0IHRpbWUsIHNvIGl0J3MgYmV0dGVy
IGlmIHRoZSBib3Mgd2lsbCBzdGF5IHVubW9kaWZpZWQgYWZ0ZXINCj4gYSBoYW5nLiBUaGUgTkVF
RFNfQ1BVX01BUFBJTkcgZmxhZyBpcyByZW1vdmVkIGFzIHJlcXVpcmVtZW50Lg0KDQpJIHRoaW5r
IHRoYXQgaXQgd2lsbCBhbHNvIG5lZWQgYSB1QVBJIHRvIHF1ZXJ5IGlmIERSTV9YRV9WTV9CSU5E
X0ZMQUdfRFVNUEFCTEUgaXMgc3VwcG9ydGVkIGJ5IHJ1bm5pbmcgWGUgS01EIHZlcnNpb24uDQoN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMg
fCA4ICsrKy0tLS0tDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICB8IDEgKw0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdm0uYw0KPiBpbmRleCBhN2U3YTBiMjQwOTkuLjBhM2I5YzBhZDc3MiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3ZtLmMNCj4gQEAgLTI2ODcsMTIgKzI2ODcsMTMgQEAgc3RhdGljIGludCB2bV9iaW5kX2lv
Y3RsX29wc19leGVjdXRlKHN0cnVjdCB4ZV92bSAqdm0sDQo+ICAjaWZkZWYgVEVTVF9WTV9BU1lO
Q19PUFNfRVJST1INCj4gICNkZWZpbmUgU1VQUE9SVEVEX0ZMQUdTCVwNCj4gIAkoRk9SQ0VfQVNZ
TkNfT1BfRVJST1IgfCBEUk1fWEVfVk1fQklORF9GTEFHX1JFQURPTkxZIHwgXA0KPiAtCSBEUk1f
WEVfVk1fQklORF9GTEFHX0lNTUVESUFURSB8IERSTV9YRV9WTV9CSU5EX0ZMQUdfTlVMTCB8IDB4
ZmZmZikNCj4gKwkgRFJNX1hFX1ZNX0JJTkRfRkxBR19JTU1FRElBVEUgfCBEUk1fWEVfVk1fQklO
RF9GTEFHX05VTEwgfCBcDQo+ICsJIERSTV9YRV9WTV9CSU5EX0ZMQUdfRFVNUEFCTEUgfCAweGZm
ZmYpDQo+ICAjZWxzZQ0KPiAgI2RlZmluZSBTVVBQT1JURURfRkxBR1MJXA0KPiAgCShEUk1fWEVf
Vk1fQklORF9GTEFHX1JFQURPTkxZIHwgXA0KPiAgCSBEUk1fWEVfVk1fQklORF9GTEFHX0lNTUVE
SUFURSB8IERSTV9YRV9WTV9CSU5EX0ZMQUdfTlVMTCB8IFwNCj4gLQkgMHhmZmZmKQ0KPiArCSBE
Uk1fWEVfVk1fQklORF9GTEFHX0RVTVBBQkxFIHwgMHhmZmZmKQ0KPiAgI2VuZGlmDQo+ICAjZGVm
aW5lIFhFXzY0S19QQUdFX01BU0sgMHhmZmZmdWxsDQo+ICAjZGVmaW5lIEFMTF9EUk1fWEVfU1lO
Q1NfRkxBR1MgKERSTV9YRV9TWU5DU19GTEFHX1dBSVRfRk9SX09QKQ0KPiBAQCAtMjkxOSw5ICsy
OTIwLDYgQEAgaW50IHhlX3ZtX2JpbmRfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxlKQ0KPiAgCQl1MTYgcGF0X2luZGV4ID0gYmlu
ZF9vcHNbaV0ucGF0X2luZGV4Ow0KPiAgCQl1MTYgY29oX21vZGU7DQo+ICANCj4gLQkJaWYgKCFv
YmopDQo+IC0JCQljb250aW51ZTsNCj4gLQ0KPiAgCQlnZW1fb2JqID0gZHJtX2dlbV9vYmplY3Rf
bG9va3VwKGZpbGUsIG9iaik7DQo+ICAJCWlmIChYRV9JT0NUTF9EQkcoeGUsICFnZW1fb2JqKSkg
ew0KPiAgCQkJZXJyID0gLUVOT0VOVDsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0v
eGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4IDUwYmJlYTA5OTJk
OS4uMGY5NzVmNTdmM2U1IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5o
DQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTkzMCw2ICs5MzAsNyBA
QCBzdHJ1Y3QgZHJtX3hlX3ZtX2JpbmRfb3Agew0KPiAgI2RlZmluZSBEUk1fWEVfVk1fQklORF9G
TEFHX1JFQURPTkxZCSgxIDw8IDApDQo+ICAjZGVmaW5lIERSTV9YRV9WTV9CSU5EX0ZMQUdfSU1N
RURJQVRFCSgxIDw8IDEpDQo+ICAjZGVmaW5lIERSTV9YRV9WTV9CSU5EX0ZMQUdfTlVMTAkoMSA8
PCAyKQ0KPiArI2RlZmluZSBEUk1fWEVfVk1fQklORF9GTEFHX0RVTVBBQkxFCSgxIDw8IDMpDQo+
ICAJLyoqIEBmbGFnczogQmluZCBmbGFncyAqLw0KPiAgCV9fdTMyIGZsYWdzOw0KPiAgDQoNCg==
