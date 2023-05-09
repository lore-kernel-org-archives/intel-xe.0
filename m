Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAE5C7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 05:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E50310E31F;
	Tue,  9 May 2023 05:45:23 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E3410E31F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 05:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683611121; x=1715147121;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Q07KnBGzcRm5QphKPx8cn2U1YHcOTl8ZWQD9c4QpSp4=;
 b=foSxwxht9ra4IK6dqRMgOIzl9TzvoT1g8u2Fw1AsciYchqxEPMxgCQX2
 1OzhQVe6tGdK6Zv4zRVvc2C8eFs28YwzuSg0NpRBU2GU8jDsbNrn8J6o0
 /ctTZGua7BVVjXWuiYm9oYT12wDS4EsXuZJrvl+rIjDKPN24YSm2hxH5B
 vfqjEt+5GMaef+D1/W58BupjrTm1UV2Bih52p/6I97eCT6cEAAZug2e3n
 /ybTS+1oV8MPYlSf+5QL4ovFSFfGj1vbci03jpu6nptKfNxGoD6ouHJ/c
 a6Y60jxR6f7xNQNBfwiVwLiC0IVEM1roXjz831qaQ12ikC+6uY/tqheMG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347276153"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="347276153"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="731554817"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="731554817"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 08 May 2023 22:45:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 22:45:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 22:45:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 22:45:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 22:45:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RH30ytAE7djnXgm0lFsC+Z200eAQQ2J47INXpzZKoTqUnDd/hUJYvJ4RwicZ+amCcJpPfdktWLwMiFp1ua+sZwn7FrRcLXQWEyIBHjOCzL5JyivafefvcR3sEKVrSaDvSoPRZ1e+UR5jzpEZQ05UnmqLnzKyoCIxPz5ruL9O26GRbg5m/4F4VAyB8oVjNZ9dAxwcMw6wjeIrKm5HqJS7X6TSmtaQZJhAlIliRitGv/Ies77heHxrQswx0b/wM489D0A7k258noBoKqXHc949doBirY1C8y9ne6ht+SDGNlgYHBchshGo1uNuLGRp+dhpW543Fnnh0siNHtX1y0ohlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q07KnBGzcRm5QphKPx8cn2U1YHcOTl8ZWQD9c4QpSp4=;
 b=RMk9rFrUkijk23khI1sl54Z3+SvNVv0DNdV8DwPrz3Xt55RcXBUzj7YCtXQO1InnW/xY+pq82l+4jfXX4lCoALYq6h74Es2ycFn89U+N79aitOq4F6JhLZxEdZURioCjB+EQu9DLHxlgeV8w0cfAYMQXPyxHSdUeHjJcB2C2qGx+EsilyOBhOpmNvjkkS63TguKX8uuwnSk6Icj8qCrZrXM1F6QoNHLK0a503Nceno2MKsuWyBXISKVx0Z4Ngubu42lNrlZEBGk3bxXDIM6/fM4yHxiAASkUazZDVYadRv0mRjB9jL5uMOV2Z5hWFel93LgChsNtHvzqEcTR0PNB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 DM4PR11MB5261.namprd11.prod.outlook.com (2603:10b6:5:388::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.32; Tue, 9 May 2023 05:45:17 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::9f1b:8dde:50b2:1b4f]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::9f1b:8dde:50b2:1b4f%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 05:45:17 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Thread-Topic: [RFC] drm/xe: Handle -EDEADLK case in preempt worker
Thread-Index: AQHZgXY0dzgbduLazEe0t2ed3pDml69Q960AgAB4QAA=
Date: Tue, 9 May 2023 05:45:17 +0000
Message-ID: <29be850f19294a89192909498a8c92b5b565b80c.camel@intel.com>
References: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
 <ZFl5Cp4qc0AXQgD3@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZFl5Cp4qc0AXQgD3@DUT025-TGLU.fm.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3114:EE_|DM4PR11MB5261:EE_
x-ms-office365-filtering-correlation-id: 1693ae0a-29ee-4671-45b6-08db505091b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OpfpYporUaWIkRjv3iDBmVXv/roRC4ZQGnHr9eF6HVVb9ZbksqEfALI+RBUUWCbpPi8g4yo9rNUjVTr5Ch8tDd4mZ1Ps37dEoj3DedDVjsMqNxtE/cbVpn4dRAeZLE8vqa9SKfFcIxDfcdLqgF1hPGZzDuQPecFCyXJjgdm1pHqCJlDo71RgM2EfFF4Ckh/uyC9NrCw7XaRUaYpP9XeoUyJGwRuWS0dz52yk9WNInHc6/K1NLctjcf8dBL40605BG3x3sqbXI090fkEC6xrseSpscHFwDfJtFbnsvpei8p++/u3GJHJ9LjqnyvpYGa+WlZaezvAFvOyZytQITT2eAMtBrTK5O6iSTaygs4yImuyKKmict1in80KhMnO1A4mef33AUV/xVyayV1VgIxhX50xOrn+gksSBe8gUo3lGGmiQLyp+pq6o8MKXg3p0mzxOyTILM85AUVJ2pWDLeOvI5GdqrXQ4qcTrnL9wZuoUqLlGOWNqs5UnDwwVClmkBY5uxML7yiRhk7iMnrLz7YcuZVO4VWVJpoZt5/rBGTOwguofdysoB+yvkPYMgwtQPuJFl/4QDNumttimSf96aawPDv8VU2kbzt1KZHO48q7O70qfZoDir8B/reVPlyElaxnq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199021)(36756003)(66556008)(38100700002)(2906002)(316002)(86362001)(8676002)(66446008)(6636002)(64756008)(76116006)(82960400001)(66946007)(5660300002)(66476007)(38070700005)(4326008)(8936002)(41300700001)(122000001)(83380400001)(91956017)(186003)(6506007)(26005)(6512007)(478600001)(110136005)(2616005)(71200400001)(6486002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjBpQlV3bkw3NW1mNUdXSjJZUjNNRzRjSURvc1YxUDR0dGNvRkMzRjNPYXZS?=
 =?utf-8?B?UDRoMDBvL2o1M0NISWEzbWFmcEdUZzFpU2JmZXpmVFBFRHlOS3lweDlEa2Zm?=
 =?utf-8?B?UVN6TTkyMVVQcEFzdkgrUkxNNDdNaHVWcEtFaW9nMlZIZE9MQnh2RFp2enMv?=
 =?utf-8?B?WThJOUJvWUFsVXFqN1dYckVkL3A1ZnVyRDhLSTU0WDNGR1JkR2xBcUNnOGRS?=
 =?utf-8?B?d2FLSWJFeTZlS2FLeHNHcHd5WTF0L0Jza09ab05jekV5bUs2S2VFRy9JMzFi?=
 =?utf-8?B?RyswMkQ2RXdENmFCRHhBYTd1bjZuOUtlL0h6NHIwWVNqelBPRkRnbU54U01v?=
 =?utf-8?B?OGxVaWpiWDZjYk9pbktha0F4dmUxRDZyQi9LZ0xXOHZjcWMzR1lXOWd5bkVm?=
 =?utf-8?B?dDllZVBHejN1ajlmWlBTd1B0akVubGNwMjZONWo2MmdhY3drSGZtbzZHSFBJ?=
 =?utf-8?B?RUJTNDBkaWg5RFlXK3h0UTV1M3dpNk52Ky9pYjJaK3FmdDZvTHY0NEtIdHVu?=
 =?utf-8?B?K25FVncxWGdiZW9xRzhVY0pHNEM3d0dVRDZLYkdzd2ZaVXZGaE1ST1pQSHZU?=
 =?utf-8?B?WklYRlZxV1pWcHBXbUxVNWQyUk5YU0pnRyt2bzd4YWR4YVRCblR4SnpyOFcw?=
 =?utf-8?B?RjFHWkxqeDJkTGUxNzN6Wkdmc25SZDZSdGZtczhhR280M08xVFRwL1VGVUwv?=
 =?utf-8?B?T3lrRExISmRtNGd0aEpURUxTa3dxanBNb09ucHhjY2VHaHRlY0dZL01SMXlt?=
 =?utf-8?B?ektQZmt6cjgvZS8yRy9rOCswa1BtZGVVR3p4QitERmVrd21DV01YSFYwMkVR?=
 =?utf-8?B?QkhKUkQ0NzJ0VFhsc1c2eDdpN2ZSSTFQQjdUL2Ivc2NVNjhPWkhSTkE4aWJQ?=
 =?utf-8?B?ZnovUVppb1ZuNTZQUzRTTVVGR1pYNzdCUmltbitTWHJvNXI5ZE15dmZHYjIy?=
 =?utf-8?B?VnFqdWhTaGFnbUlVemd5ZmswcGI5WFdZcFN0M1lBaHZ5WTJOS0M1eGFKTW1N?=
 =?utf-8?B?cnc5UWgrNTZ6d3ExWmpEZGxxRjZMaVFlTitJR3pmV1BPSHJZZVhPbVIwV21R?=
 =?utf-8?B?aEtTN3hEaTBIMll4eUpZUlovQ21VdWc3eVFiUmZKalorMXBkcVdHdUpXbk9S?=
 =?utf-8?B?cjFJbm1KTC95cG5yNkdDcEhYY0tWTWtMVytPU0dlenlLRlBoU3lUZ1RoUVZl?=
 =?utf-8?B?Ulk4aHBMSjVzcGg4cmpHalB1VkE5dmoxZ0xabFJTOWJwZGlpdEt0MnpzLzhv?=
 =?utf-8?B?MDVaTERVWTJDdjNpSGVhRnM3Qng4d1BPV0JicnlLdnN3S3F3ekVncUhUdklR?=
 =?utf-8?B?czFCRUFaVTVjWjJYZEdDOE1pcCtqejFMWGJtb2FHeGVoMHZYWDNLS3hVbTV2?=
 =?utf-8?B?SDFhUVh0ZTErSEpFS2x0dWpDUUlBd3QydHJIQzh1aVZLcTdxcldkY2t6Rkc3?=
 =?utf-8?B?NzFqZFZzc2wzbkF3VGVWaEhvaFNrZ3krNUFaSUorZnd6N1B2QWk5bXljbzJN?=
 =?utf-8?B?THQ5UktFdC9BbmsrWHNrUHViRGtWNGVHQ1l5azRqdTk5K3pJVHNQTU1HQnQ3?=
 =?utf-8?B?bithbEwwVkJ1dFRjUm5lRFYvcUhIY0s5b2J6R3F3UE96MXZnZDVRaS9jSDcr?=
 =?utf-8?B?UjNZTnpiL096ZUhYdUFWRm84N2lDeXJTSytwbGFrMzBKdzhPZC9KZ0JWMHZJ?=
 =?utf-8?B?eFFHTC9IL2JWSjFQVk5EWmE5cUdBNEJFcUVXeEp2bWpzbEc3Qll6clIvNml1?=
 =?utf-8?B?NnNLL2lUTHdES05xSW9IbU0wc0U3WUFjM21JR1hxTFVwa2hDU3BlZFFyemxZ?=
 =?utf-8?B?eUVXdk9QdWYvb0RMUU9KVnFzK2x2YU9wa09ZSEdTKzcrWUVsUzdlTFY2elY2?=
 =?utf-8?B?KzRHcGV4Sysxd2k2ajlZejJDc2Z5Z1F4eFJmZ3NPdDRWcE55NGR4OEl3RHg1?=
 =?utf-8?B?MDZlYUIwRzRFMzJCV255alZseS9rQTlGVFdvSlZGWndDZ1dzUGFoTllERzIx?=
 =?utf-8?B?WWplcFR0NndqVVRDOFRFaW95SDVGQWJhdE1Jam9VOEVubVRQeXgxeW9EbUti?=
 =?utf-8?B?K0haZHRud01mN04zams3MEh0U3BuQjJzbE5MRCtndUpsZkFGSmRXNjllbjYy?=
 =?utf-8?B?VHZ2THdpeVFUOWFIN3cveVIrbU1nYVU4c0RFUElUeVhkM3BrZmtXRFJvc05O?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC411488F530DE4083C8E362DBCBBD65@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1693ae0a-29ee-4671-45b6-08db505091b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 05:45:17.4679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wIkCPmjUTZqQNjDD6XBMF6/K0xklPITpMsA4YVPP2AOoz014dwuxH6W/ysI9UklhD1UjtWUVxn/yj5tcR8cPUjl+8VlWWPoagxm1JQZySb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5261
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: Handle -EDEADLK case in preempt worker
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA1LTA4IGF0IDIyOjM0ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBTdW4sIE1heSAwNywgMjAyMyBhdCAxMToyNzozMFBNIC0wNzAwLCBOaXJhbmphbmEgVmlz
aHdhbmF0aGFwdXJhDQo+IHdyb3RlOg0KPiA+IFdpdGggbXVsdGlwbGUgYWN0aXZlIFZNcywgdW5k
ZXIgbWVtb3J5IHByZXNzdXJlLCBpdCBpcyBwb3NzaWJsZQ0KPiA+IHRoYXQNCj4gPiB0dG1fYm9f
dmFsaWRhdGUoKSBydW4gaW50byAtRURFQURMSyBpbiB0dG1fbWVtX2V2aWN0X3dhaXRfYnVzeSgp
DQo+ID4gYW5kDQo+ID4gcmV0dXJuIC1FTk9NRU0uDQo+ID4gDQo+ID4gVW50aWwgdHRtIHByb3Bl
cmx5IGhhbmRsZXMgbG9ja2luZyBpbiBzdWNoIHNjZW5hcmlvcywgYmVzdCB0aGluZw0KPiA+IHRo
ZQ0KPiA+IGRyaXZlciBjYW4gZG8gaXMgdW53aW5kIHRoZSBsb2NrIGFuZCByZXRyeS4NCj4gPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhDQo+ID4gPG5pcmFu
amFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtLmMgfCAxOCArKysrKysrKysrKysrKysrKysNCj4gPiDCoDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+
IGluZGV4IDkxNTc2Y2VjMDAwZC4uZGYxMjE0ZjAwYTA2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
LmMNCj4gPiBAQCAtMTAsNiArMTAsNyBAQA0KPiA+IMKgI2luY2x1ZGUgPGRybS90dG0vdHRtX2V4
ZWNidWZfdXRpbC5oPg0KPiA+IMKgI2luY2x1ZGUgPGRybS90dG0vdHRtX3R0Lmg+DQo+ID4gwqAj
aW5jbHVkZSA8ZHJtL3hlX2RybS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4NCj4g
PiDCoCNpbmNsdWRlIDxsaW51eC9rdGhyZWFkLmg+DQo+ID4gwqAjaW5jbHVkZSA8bGludXgvbW0u
aD4NCj4gPiDCoCNpbmNsdWRlIDxsaW51eC9zd2FwLmg+DQo+ID4gQEAgLTUwOCwxMSArNTA5LDE1
IEBAIHZvaWQgeGVfdm1fdW5sb2NrX2RtYV9yZXN2KHN0cnVjdCB4ZV92bSAqdm0sDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBrdmZyZWUodHYpOw0KPiA+IMKgfQ0KPiA+IMKg
DQo+ID4gKyNkZWZpbmUgWEVfVk1fUkVCSU5EX1JFVFJZX1RJTUVPVVRfTVMgMTAwMA0KPiA+ICsN
Cj4gPiDCoHN0YXRpYyB2b2lkIHByZWVtcHRfcmViaW5kX3dvcmtfZnVuYyhzdHJ1Y3Qgd29ya19z
dHJ1Y3QgKncpDQo+ID4gwqB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV92bSAqdm0g
PSBjb250YWluZXJfb2Yodywgc3RydWN0IHhlX3ZtLA0KPiA+IHByZWVtcHQucmViaW5kX3dvcmsp
Ow0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfdm1hICp2bWE7DQo+ID4gwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCB0dG1fdmFsaWRhdGVfYnVmZmVyIHR2X29uc3RhY2tbWEVfT05TVEFDS19U
Vl07DQo+ID4gK8KgwqDCoMKgwqDCoMKgY29uc3Qga3RpbWVfdCByZXRyeV9lbmQgPSBrdGltZV9h
ZGRfbXMoa3RpbWVfZ2V0KCksDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oA0KPiA+IFhFX1ZNX1JFQklORF9SRVRSWV9USU1FT1VUX01TKTsNCj4gPiDCoMKgwqDCoMKgwqDC
oMKgc3RydWN0IHR0bV92YWxpZGF0ZV9idWZmZXIgKnR2Ow0KPiA+IMKgwqDCoMKgwqDCoMKgwqBz
dHJ1Y3Qgd3dfYWNxdWlyZV9jdHggd3c7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBsaXN0
X2hlYWQgb2JqczsNCj4gPiBAQCAtNjM3LDYgKzY0MiwxOSBAQCBzdGF0aWMgdm9pZCBwcmVlbXB0
X3JlYmluZF93b3JrX2Z1bmMoc3RydWN0DQo+ID4gd29ya19zdHJ1Y3QgKncpDQo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0cmFjZV94ZV92bV9yZWJpbmRfd29ya2VyX3JldHJ5
KHZtKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gcmV0cnk7DQo+
ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgLyoNCj4gPiAr
wqDCoMKgwqDCoMKgwqAgKiBXaXRoIG11bHRpcGxlIGFjdGl2ZSBWTXMsIHVuZGVyIG1lbW9yeSBw
cmVzc3VyZSwgaXQgaXMNCj4gPiBwb3NzaWJsZSB0aGF0DQo+ID4gK8KgwqDCoMKgwqDCoMKgICog
dHRtX2JvX3ZhbGlkYXRlKCkgcnVuIGludG8gLUVERUFETEsgYW5kIGluIHN1Y2ggY2FzZQ0KPiA+
IHJldHVybnMgLUVOT01FTS4NCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBVbnRpbCB0dG0gcHJvcGVy
bHkgaGFuZGxlcyBsb2NraW5nIGluIHN1Y2ggc2NlbmFyaW9zLA0KPiA+IGJlc3QgdGhpbmcgdGhl
DQo+ID4gK8KgwqDCoMKgwqDCoMKgICogZHJpdmVyIGNhbiBkbyBpcyByZXRyeSB3aXRoIGEgdGlt
ZW91dC4gS2lsbGluZyB0aGUgVk0gb3INCj4gPiBwdXR0aW5nIGl0DQo+ID4gK8KgwqDCoMKgwqDC
oMKgICogaW4gZXJyb3Igc3RhdGUgYWZ0ZXIgdGltZW91dCBvciBvdGhlciBlcnJvciBzY2VuYXJp
b3MgaXMNCj4gPiBzdGlsbCBUQkQuDQo+ID4gK8KgwqDCoMKgwqDCoMKgICovDQo+ID4gK8KgwqDC
oMKgwqDCoMKgaWYgKChlcnIgPT0gLUVOT01FTSkgJiYga3RpbWVfYmVmb3JlKGt0aW1lX2dldCgp
LA0KPiA+IHJldHJ5X2VuZCkpIHsNCj4gDQo+IEknZCBjb21iaW5lIHRoaXMgdGltZXIgd2l0aCB0
aGUgdXNlcnB0ciBjYXNlIHRvbyAoLUVBR0FJTikgYWJvdmUgYXMNCj4gdGhhdA0KPiBjYW4gbGl2
ZWxvY2sgdG9vLCBob3BlZnVsbHkgVGhvbWFzIGFncmVlcz8gTGV0J3MgZ2V0IGhpcyBvcGluaW9u
IG9uDQo+IHRoaXMNCj4gdG9vLg0KDQpObywgdGhlc2UgYXJlIHZlcnkgZGlmZmVyZW50IHRoaW5n
cy4gVGhlIHVzZXJwdHIgLUVBR0FJTiBpcyBwYXJ0IG9mIGENCnNlcWxvY2sgYW5kIHRoZSByZXRy
eSBjb25kaXRpb24gaXMgcmVzb2x2ZWQgb24gZWFjaCByZXRyeSwgc28gdGhlIG9ubHkNCmNoYW5j
ZSBvZiBhIGxpdmVsb2NrIGJhc2ljYWxseSBpcyBpZiB0aGUgdXNlciBjb250aW5vdXNseSBtb2Rp
ZmllcyB0aGUNCmFmZmVjdGVkIG1hcHBpbmcgaGltc2VsZi4gU2VxbG9ja3MgYXJlIHR5cGljYWxs
eSBuZXZlciB0aW1lZCBvdXQuDQoNCi9UaG9tYXMNCg0KDQo+IA0KPiBNYXR0DQo+IA0KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtc2xlZXAoMjApOw0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB0cmFjZV94ZV92bV9yZWJpbmRfd29ya2VyX3JldHJ5KHZtKTsN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byByZXRyeTsNCj4gPiArwqDC
oMKgwqDCoMKgwqB9DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHVwX3dyaXRlKCZ2bS0+bG9jayk7DQo+
ID4gwqANCj4gPiDCoMKgwqDCoMKgwqDCoMKgZnJlZV9wcmVlbXB0X2ZlbmNlcygmcHJlZW1wdF9m
ZW5jZXMpOw0KPiA+IC0tIA0KPiA+IDIuMjEuMC5yYzAuMzIuZzI0M2E0YzdlMjcNCj4gPiANCg0K
