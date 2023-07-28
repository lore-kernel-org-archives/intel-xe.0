Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61EFC001DE
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 19:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F3910E78B;
	Fri, 28 Jul 2023 19:47:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629C510E78B
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 19:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690573670; x=1722109670;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ytNXzSFflHqp6tUUUPoNaqGHp4DXWCQzWkR9H6cTs2Y=;
 b=Ovrmh4RwBFEOfxUZxDx8Xw8eK7NKs9czYCKcg4/ZZxOOisoSCxUkDmAV
 Qj+9X6rOGERMhAAcCS4MSDSKGHSxgdN5STyfYCwHLdr7XZTK+1GcftwXA
 L3t+eAN1u0Z+MB3sevZppQnv3GEUFUL4yQlWKg3UwbE/x87Y+f556GxZB
 8FHKBunCxJ/2Exo2mx7rzVh6818hyjyKdur21FVtc9S9tzPAtRd1OmQBz
 9mrdZ4kne5w4BkftH8jgUxAFbChovDiFcYToPbO+zmnSzz3vTeV265GpA
 9W5yQ5mw8NJs11oR8rKDcQk1kkOyqPInoLcfSuqPvZ8h1ouvIWgvBWNui Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="366140658"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="366140658"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 12:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="793015278"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="793015278"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 28 Jul 2023 12:47:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 12:47:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 12:47:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 12:47:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 12:47:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXf8ybNLp0+CxmViHGufsTnYj3vP+wJnBqmdmVNxGa1KmvlqYi6tfgi7qgzs3vlI+0HlJ3a2U49cTXgBJx4yQMBRMlY89vUR3HIk+Pz3msakfohSzIlPEbwDF5M0zzkqvLkKCZoDqtMWvTpCwwlQLJUa7THtBNWcmZ+ghrQpFUoyWqYGVCDpUVQfV2/eT2iZdrpt88TrJSJSpZviW91lN5/rUaHtPtxmADOG9yYmWp59o+bL+JhUmhNVUhyCt5zti8oJw1/i7d/jw1BTHczHKHJfzQuBXlUK1Y9MUMB+myZZwAu/q2+xvoqDWvJuFHd0xN407XpU8MR5fs6E7UuD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytNXzSFflHqp6tUUUPoNaqGHp4DXWCQzWkR9H6cTs2Y=;
 b=COfiIvesghrfFocUIFua6+YQnwkC0ZmBzNamSupu4Inngrmikg+FQCiaQW1BPcWLJOfD1XWhsZFAMLvbX9gQ1UNc+1VxMsrIycLxVr5Mu40CsTB/Z1MSWqm3TniGW1jxFrIxbPnLBVXhi4oRz70+8u0uxGA4yemCoJWU98ZvhUtCghh4pOBGrRuF5SQuUB1xv8DjWl/UhAm4ZE5aDxtt1zAC2F1chBMXgSl7lCrVzL6EzlXmDLrizqslKxUD7AcalwoakDeDq2hNLK8BY49I9CFcegSokcIZwVXkIKG2rljCat/LDxpb+uiOoUroxgDptQGs4bj6/1vVD6Z0TDafRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB5962.namprd11.prod.outlook.com (2603:10b6:208:371::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 19:47:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 19:47:47 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Thread-Topic: [RFC] drm/xe: Introduce xe_ASSERT macros
Thread-Index: AQHZwYlPpG4RQH1zOkyHXZSBoSQGOa/Pla+A
Date: Fri, 28 Jul 2023 19:47:46 +0000
Message-ID: <5abeaa6e197e6f63cb3ae7f66084f011be2fa662.camel@intel.com>
References: <20230728192518.1951-1-michal.wajdeczko@intel.com>
In-Reply-To: <20230728192518.1951-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|MN0PR11MB5962:EE_
x-ms-office365-filtering-correlation-id: 572b8c1b-02bd-4eb7-91cd-08db8fa3849a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4vq53+Z8kigKKs3wy7vnCW/a1KEu9+1e5GUlt5hmh+AfkKM77U1lkhNF3Ow8gZiZ79Wnc1BBxAUPZUvlowg2R85CpxNNKMzs6x96aRv0932V7KqcdWtKOMJGhHoNtA0suGh9pL/mSTkSt3eASxnjoVMWDSq/1DoV0UjS3l084hmhNLPZxTIMenbfPhbeotEdQAzELCKH5yDvjErRlk+2jLlC3WBDAqR0i2mRe6PBCaafxNydBMI7WaopBMfDPTPgboR34J4YJGpVd3y+PuXlVC84jAfT1jYxnCIBdqH6cxV+0nJ1+2PqrkqFl0UdIp7QdRGRBJsNfiSWsjZ9BR+qkxymtPt+d+KvTCcxgTUSKubpvSuKQvE3nBJiKHywNR2vnCehQN1qH+RZ6B8x8oLqxYMvGLteRAoy/9oLfag4m0KyhVt9SZci2j3YbNwzyR0jWHJp9BK14XLLcQCRSh/62kBeHl7F7BuZ6jU57f5KR9pPsOow7OczzIFjpjKv4cgzNbZvcV+5KVBLHlnSsDs4y2LEgJAmYAYcJ7saj4ScAtcGnvEqj/VpZZr1bih0WT3bpEd7/TeOa+ihx/uiOvpO7ZmsVSx4nHKrNsSGKU35IevWJVk1wXtlHNlF4Tb3QjSy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(2906002)(316002)(8936002)(8676002)(5660300002)(38070700005)(41300700001)(36756003)(86362001)(6512007)(26005)(6506007)(107886003)(82960400001)(478600001)(6486002)(71200400001)(83380400001)(6636002)(2616005)(186003)(91956017)(66476007)(4326008)(76116006)(66446008)(66946007)(66556008)(38100700002)(64756008)(110136005)(54906003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWUzSVhqY0lWNjlHZEEyOUo3Z25lWDBZbmxkaXBRbGYxcEpCekpnUGdZWENj?=
 =?utf-8?B?Q3c4bXJIeUlpbjNTbC9tWThIYXgvSkM2MEh4Ym4wbkEreFhVU2haUHdYL1Mv?=
 =?utf-8?B?QjlVNHNOY2hWSmZPMUNqOFQ5MU9LTWRkeTVSdjVpcWlVWGpBVU80RGhDTHdn?=
 =?utf-8?B?UkxoSkpJMXU4amREbWxRWnhnTUQ2VjZDczQwMW5EVjJ6aVpxR3dVU3k5cWYw?=
 =?utf-8?B?dlFidFY4UkFPWlZKUks2OStvL0ZMYkNxckpVL2FDeE5qS0VCYnRjS0tIc21j?=
 =?utf-8?B?Tm04SEZ3QXc3bm9QV2duY2YzTU5BYWdLTDBScStLZWN5clJrMjFRWUlXMWRX?=
 =?utf-8?B?dEEwa2hRdk1NN2prUTIvU1N1VmhmWkV0dTBsT2d2Z2UwTTRVeVJScWlObmhU?=
 =?utf-8?B?ZXNXVnB4dDJLa053Z252NVArREtiSyt4UlBmQmVsSFRpdzNMbFpkdW1OVWwz?=
 =?utf-8?B?K1NXM1huTHZtelB4WVJGdWVrYWM0d1hDRVhKcUEwR3dOb3M5TTVKUTBIcHVu?=
 =?utf-8?B?TzM1SytEcjRYRnMxdnNPcy9ta29tWFpnQ3pNaDRWclR0T3BrZ2k5K2NYa0ND?=
 =?utf-8?B?M1pnWVZ2SVJUWmdFSklHS1BNRVdONkc3NUpIVHg3VzNlMU4yNVZZclV5bmtq?=
 =?utf-8?B?SE1BSVF0c1lQa1FnSEZNeEdvTi9QWGRVNzVhT05nK3A1RWpsc1g4MWM4aHp0?=
 =?utf-8?B?aWQvT0RvRURLb0t2NG5zc1VySnJiVGtFZW9YVVE5azcyRGJFbGV6ZWRXN3Jn?=
 =?utf-8?B?ZDJFWkYyZDFpakwwdDVoSFZDaHpzQnBLcXJ5d2kwRW4veHgxU0JVSWRMVTg3?=
 =?utf-8?B?bWI2VVNvMkpuSjR3VEFLWExUNGl1dU1yZkNNVjByWDVTL25jRlpRNEhLNXE4?=
 =?utf-8?B?N0VHTVduK2NlMk91YnpHVkZ5QW9YT3RTdk02Q0NZWGQzRW5pcGVuZGo0RGsx?=
 =?utf-8?B?d2M4OHVBUjFMZ0FkNE9aS0ZEUC91QmJzWjdxMXRYSHRkbUt2dXNWeFZsSUZk?=
 =?utf-8?B?elBwNDRWa25hVS9ld2lTUUczRVduR2kzRE85dTlnMXdHUDkwdlp3dzJqdGhV?=
 =?utf-8?B?UmdleDVPL3pqSjZXWUlycitVL0tNMjMzWGphOEI3T0pCY1IxaGdtWlZjblBP?=
 =?utf-8?B?cHlyb3pvSjdjSjRaV2UvT05hTHYrV2JZRVBpTGZKQk1vb1RTR3IwNVlHTUJ0?=
 =?utf-8?B?YlM0dWhhYUN3YUdsNWcxS3A4bUp4OWlFcGhnTTVmMjJibHJBWm9FRXJ0eEZk?=
 =?utf-8?B?ajBTZ3R5MGphSm85UzRDWTJVdlB6MTlQYW9BZnpCRFlYRm95ZTFrMEN1dHZQ?=
 =?utf-8?B?dGoxNTJIVkFIYmNWR1FUL3Q1emR1alJKbnhWMjRQaWpSditLSTMzdFgrM0lW?=
 =?utf-8?B?dy9kanMzRks5THcvUlNiSVM1TlN4alZLVXlyaUd4cEtTazQyYzVHUW5BUWhU?=
 =?utf-8?B?M2JWb3AvZFZVNEtxZkNMRTJRa0M2YnJqZ1FNRjB4eVBDVE9xcXBCdVhQbmtR?=
 =?utf-8?B?b3lybm5RVjJQZmJsUVh4ZXJuU05MdmloeGhpY3k5bUxoY094d3ZRUjBPWTc0?=
 =?utf-8?B?Y1FRcGQwTmdIVjBlRUZuaU9reEtybWdRcHQ5YW9nL25hYUwvbzF6ZFF5UC9Q?=
 =?utf-8?B?TTd2L2UrTlNRSHBtbTl3WEo2RU9WSEFCdkVGRHpZeDhvYm1oT2dYeTNjckJC?=
 =?utf-8?B?djFlZlhoWjVOLzFEL3RnUk1xQzd3Ulk1UVdFYmg1T0Z4MFhaaGpUZHduOXBW?=
 =?utf-8?B?V1VkTWVZKzRZTCszTHROdHppeUs3cmUvWC85bFdJNHhnenUydGJuSjJGQjQ1?=
 =?utf-8?B?TU1IbDlGVmVXVzVrOFpzeU5FZTBQazFidGc0bVVydnhVNXRGaDd1eUpEWkI0?=
 =?utf-8?B?VVdvM21mUVMxelFSZzEwSWZNNFFzV3VrS0M4ZHd5NXZTbVVsV2ZhUWVGQmNt?=
 =?utf-8?B?aUl3azJnd2VGWlFmVk1YVTRIWkZvQWZMdHVqMnRNRXY2ck1Gd1YvR3MwT1RJ?=
 =?utf-8?B?UHpDY09lN2FzemV0UU9YVW53RGZDT2ZUUjFQOCtHK3E2YXZaYklBQkNPajZk?=
 =?utf-8?B?MEsyM3ZUUTVvUEpIVEo1NG8xYWZWa3BwdmlSVXEvQjFrazFwUmJZSFNtdXQ5?=
 =?utf-8?B?YkJ6NXZJRktJeUI4czhsRml4MWJ0d0Y4bDdsQVlZU0o4Y1ViVmtueXk3bjBr?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3238054FB3450F4CA4AE01A919B2D7B8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 572b8c1b-02bd-4eb7-91cd-08db8fa3849a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 19:47:46.9731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iq5dssf0sPE8WfvU085tNqn5VJFHHAjYKLupzMQFeD6Awwg/N3FLRhg047o7kSCCTHZ8QS2ao/4jCzYMgDYfsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5962
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: Introduce xe_ASSERT macros
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA3LTI4IGF0IDIxOjI1ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Ogo+IEFzIHdlIGFyZSBtb3ZpbmcgYXdheSBmcm9tIHRoZSBjb250cm92ZXJzaWFsIFhFX0JVR19P
TiBtYWNybywKPiByZWx5aW5nIGp1c3Qgb24gV0FSTl9PTiBvciBkcm1fZXJyIGRvZXMgbm90IGNv
dmVyIHRoZSBjYXNlcwo+IHdoZXJlIHdlIHdhbnQgdG8gYW5ub3RhdGUgZnVuY3Rpb25zIHdpdGgg
YWRkaXRpb25hbCBkZXRhaWxlZAo+IGRlYnVnIGNoZWNrcyB0byBhc3NlcnQgdGhhdCBhbGwgcHJl
cmVxdWlzaXRlcyBhcmUgc2F0aXNmaWVkLAo+IHdpdGhvdXQgcGF5aW5nIGZvb3RwcmludCBvciBw
ZXJmb3JtYW5jZSBwZW5hbHR5IG9uIG5vbi1kZWJ1Zwo+IGJ1aWxkcywgd2hlcmUgYWxsIG1pc3Vz
ZXMgaW50cm9kdWNlZCBkdXJpbmcgY29kZSBpbnRlZ3JhdGlvbgo+IHdlcmUgYWxyZWFkeSBmaXhl
ZC4KPiAKPiBJbnRyb2R1Y2UgZmFtaWx5IG9mIHhlX0FTU0VSVCBtYWNyb3MgdGhhdCB0cnkgdG8g
Zm9sbG93IGNsYXNzaWMKPiBhc3NlcnQoKSB1dGlsaXR5IGFuZCBjYW4gYmUgY29tcGlsZWQgb3V0
IG9uIG5vbi1kZWJ1ZyBidWlsZHMuCgpUaGlzIGlzIGluZGVlZCBtdWNoIGJldHRlciBhbmQgY2xl
YXIgdGhlbiB0aGUgWEVfQlVHX09OLgoKQWxzbywgbGV0IG1lIGJlIGNsZWFyIHRoYXQgbXkgaW50
ZW50aW9uIHdpdGggcmVwbHkgaXMgbm90IHRvCmJsb2NrIHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhp
cyBhc3NlcnQgbWFjcm8uCgpCdXQgSSdkIGxpa2UgdG8gcmFpc2UgbXkgY29uY2VybihzPykgd2l0
aCBzdWNoIGFzc2VydCBtYWNyb3M6CgpJbiBtYW55IGNhc2VzIHRoYXQgd2UgY3VycmVudGx5IHVz
ZSB0aGVzZSBtYWNyb3MgYXJlIGFjdHVhbGx5CnZlcnkgdXNlZnVsIG9uIHByb2R1Y3Rpb24gYnVp
bGQuIFdoZW5ldmVyIHdlIHJlY2VpdmUgYnVnIHJlcG9ydHMKd2Ugc2hvdWxkIGJlIGFibGUgdG8g
YXNrIHRoZSByZXBvcnRlciB0byBnZXQgYSBkbWVzZyBvciBlbmFibGUKYSBkcm0uZGVidWcgYW5k
IGdldCBhIG1lc3NhZ2UgYW5kIHdlIGNvdWxkIHNlZSB0aGVzZSwgd2l0aG91dApldmVyIGhhdmlu
ZyB0byBhc2sgdGhlIHJlcG9ydCB0byByZWJ1aWxkIHRoZSBrZXJuZWwgd2l0aCBhIGRlYnVnCmNv
bmZpZy4KClRoZW4sIHdlIGFkZCB0aGlzIGluIHRoZSBjb2RlIGFuZCB3ZSBzdGFydCB1c2luZyB0
aGlzIGV2ZXJ5d2hlcmUKd2l0aG91dCBzdG9wcGluZyB0byB0aGluayBpZiB0aGF0IHdvdWxkIGJl
IGdvb2QgaW4gYSByZXBvcnQgYW5kCndlIGVuZCB1cCB3aXRoIGEgY29kZSBmdWxsIG9mIGFzc2Vy
dHMgYW5kIGJpZyBwcm9ibGVtIHRvIGdldCB0aGUKdXNlZnVsIGluZm9ybWF0aW9uIGZyb20gdGhl
IGJ1ZyByZXBvcnRzLgoKQXNpZGUgZnJvbSB0aGUgZmFjdCB0aGF0IHdlIGVuZCB1cCBnb2luZyBm
YXIgZnJvbSBvdGhlciBkcm0gYW5kCm5vbi1kcm0ga2VybmVsIGRyaXZlcnMgYW5kIHN0YXJ0aW5n
IGZyb20gZGF5IDAgYSBkcml2ZXIgZnVsbCBvZgpkcml2ZXItaXNtcy4KCkkgd291bGQgcHJlZmVy
IHdlIGhhdmUgYSBkcml2ZXIgd2hlcmUgd2UgbWFrZSB1c2FnZSBvZiB0aGUgYWxsCnRoZSBkcm0g
ZXJyb3IsIHdhcm5pbmcsIGRlYnVnLCBpbmZvIHZhcmlhbnRzIG9uIGEgY2FzZSBieSBjYXNlLApj
YXJlZnVsbHkgYW5hbHl6aW5nIHRoZSBuZWVkcyBhbmQgdGhpbmtpbmcgYWJvdXQgdGhlIGJ1ZyBy
ZXBvcnRzCnRoYXQgd2UgbWlnaHQgcmVjZWl2ZSBmcm9tIGVuZCB1c2Vycy4KCj4gCj4gTWFjcm9z
IGFyZSBiYXNlZCBvbiBkcm1fV0FSTiwgYnV0IHVubGlrZWx5IHRvIG9yaWdpbiwgZGlzYWxsb3cK
PiB1c2UgaW4gZXhwcmVzc2lvbnMgc2luY2Ugd2Ugd2lsbCBjb21waWxlIHRoYXQgY29kZSBvdXQu
Cj4gCj4gQXMgd2UgYXJlIG9wZXJhdGluZyBvbiB0aGUgeGUgcG9pbnRlcnMsIHdlIGNhbiBwcmlu
dCBhZGRpdGlvbmFsCj4gaW5mb3JtYXRpb24gYWJvdXQgdGhlIGRldmljZSwgbGlrZSB0aWxlIG9y
IEdUIGlkZW50aWZpZXIsIHRoYXQKPiBpcyBub3QgYXZhaWxhYmxlIGZyb20gZ2VuZXJpYyBXQVJO
IHJlcG9ydDoKPiAKPiBbIF0geGUgMDAwMDowMDowMi4wOiBbZHJtXSBBc3NlcnRpb24gYGZhbHNl
YCBmYWlsZWQhCj4gwqDCoMKgIGdyYXBoaWNzOiBYZV9MUCAxMi4wIG1lZGlhOiBYZV9NIDEyLjAg
R1QwCj4gWyBdIFdBUk5JTkc6IENQVTogNCBQSUQ6IDg0NDIgYXQgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZS5jOjI4MAo+IHhlX2RldmljZV9wcm9iZSsweDJmNS8weDRhMCBbeGVdCj4gWyBd
IFJJUDogMDAxMDp4ZV9kZXZpY2VfcHJvYmUrMHgyZjUvMHg0YTAgW3hlXQo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPgo+IENj
OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+Cj4gQ2M6IEZyYW5jb2lzIER1
Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0
dGhldy5icm9zdEBpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfYXNz
ZXJ0LmggfCA0Nwo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiDCoDEgZmls
ZSBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2Fzc2VydC5oCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9hc3NlcnQuaAo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Fzc2VydC5oCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjY1MzA2NzY4ZDYzNwo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYXNzZXJ0LmgKPiBAQCAt
MCwwICsxLDQ3IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8KPiArLyoK
PiArICogQ29weXJpZ2h0IMKpIDIwMjMgSW50ZWwgQ29ycG9yYXRpb24KPiArICovCj4gKwo+ICsj
aWZuZGVmIF9fWEVfQVNTRVJUX0hfXwo+ICsjZGVmaW5lIF9fWEVfQVNTRVJUX0hfXwo+ICsKPiAr
I2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9ERUJVRykKPiArCj4gKyNkZWZpbmUgeGVfQVNT
RVJUX01TRyh4ZSwgY29uZGl0aW9uLCBmbXQsIGFyZy4uLikKPiAoe8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgXAo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9kZXZpY2UgKl9feGUgPQo+
ICh4ZSk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBcCj4gK8KgwqDCoMKgwqDCoMKgaW50IF9fcGFzc2VkID0KPiAhIShjb25kaXRpb24p
O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4g
wqDCoMKgwqBcCj4gK8KgwqDCoMKgwqDCoMKgZHJtX1dBUk4oJl9feGUtPmRybSwgIV9fcGFzc2Vk
LCAiWyIgRFJNX05BTUUgIl0gQXNzZXJ0aW9uCj4gYCVzYCBmYWlsZWQhXG4iwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgXAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImdy
YXBoaWNzOiAlcyAldS4ldSBtZWRpYTogJXMgJXUuJXUgIgo+IGZtdCzCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oFwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gX19zdHJpbmdpZnkoY29uZGl0
aW9uKSzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgXAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX194ZS0KPiA+aW5mby5n
cmFwaGljc19uYW1lLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4g
wqDCoMKgwqDCoFwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9feGUtPmluZm8u
Z3JhcGhpY3NfdmVyeDEwMCAvIDEwMCwgX194ZS0KPiA+aW5mby5ncmFwaGljc192ZXJ4MTAwICUg
MTAwLMKgwqDCoMKgwqDCoMKgwqDCoMKgXAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgX194ZS0KPiA+aW5mby5tZWRpYV9uYW1lLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgCj4gwqDCoMKgwqDCoFwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIF9feGUtPmluZm8ubWVkaWFfdmVyeDEwMCAvIDEwMCwgX194ZS0KPiA+aW5mby5t
ZWRpYV92ZXJ4MTAwICUgMTAwLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgXAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyMKPiBhcmcpO8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4g
wqDCoMKgwqDCoMKgwqBcCj4gK8KgwqDCoMKgwqDCoMKgKHZvaWQpKF9fcGFzc2VkKTvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgXAo+ICt9KQo+ICsKPiArI2Vsc2UKPiArCj4gKyNkZWZp
bmUgeGVfQVNTRVJUX01TRyh4ZSwgY29uZGl0aW9uLCBmbXQsIGFyZy4uLikKPiAoe8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgXAo+ICvCoMKgwqDCoMKgwqDCoHR5cGVjaGVjayhzdHJ1Y3Qg
eGVfZGV2aWNlICosCj4geGUpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoFwKPiArwqDCoMKgwqDCoMKgwqBCVUlMRF9CVUdfT05fSU5WQUxJRChjb25k
aXRpb24pO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBcCj4gK30pCj4gKwo+ICsjZW5kaWYKPiArCj4gKyNkZWZpbmUgeGVfQVNTRVJUKHhl
LCBjb25kaXRpb24pIFwKPiArwqDCoMKgwqDCoMKgwqB4ZV9BU1NFUlRfTVNHKCh4ZSksIGNvbmRp
dGlvbiwgIiIpCj4gKwo+ICsjZGVmaW5lIHhlX3RpbGVfQVNTRVJUKHRpbGUsIGNvbmRpdGlvbikK
PiAoe8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBcCj4g
K8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3RpbGUgKl9fdGlsZSA9Cj4gKHRpbGUpO8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBcCj4gK8KgwqDC
oMKgwqDCoMKgeGVfQVNTRVJUX01TRyh0aWxlX3RvX3hlKF9fdGlsZSksIGNvbmRpdGlvbiwgInRp
bGUldSAiLAo+IF9fdGlsZS0+aWQpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBcCj4gK30pCj4gKwo+ICsjZGVmaW5lIHhlX2d0X0FTU0VSVChndCwgY29uZGl0aW9uKQo+
ICh7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgXAo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndCAqX19ndCA9Cj4gKGd0KTvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgXAo+ICvCoMKgwqDCoMKgwqDCoHhlX0FTU0VSVF9NU0coZ3RfdG9feGUoX19ndCksIGNvbmRp
dGlvbiwgIkdUJXUgIiwgX19ndC0KPiA+aW5mby5pZCk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoFwKPiArfSkKPiArCj4gKyNlbmRpZiAvKiBfX1hFX0FTU0VS
VF9IX18gKi8KCg==
