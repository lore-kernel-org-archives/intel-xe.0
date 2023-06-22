Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFFAEB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 23:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688AF10E5B9;
	Thu, 22 Jun 2023 23:04:40 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C8410E5B7
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 23:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687475078; x=1719011078;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=cWCP7iRmFjgwcPJFcxpUQ9D280G2q+4SYCSPm0YVVyw=;
 b=Oeo+HaYFQceGCThFUCnttgpbN8KuyTCqpgcHJEih+7tBRUahVqM3jgBA
 nkuWDdNP4BBL/KGH3ZPgXJKVluVYhszoYwMs98rYIRMbd1wLTmA8kNu45
 QbiQ+DO71j5IQj3DVLJx+/ywzLNT7IcCAtXdnjNHA2Hm9655CPnWL7UNe
 VHqbVKP39iPNUM7C18HS14DI4W5SrgBL/9T2yOvM4JE35u4ubDNJkdP+i
 k/0s5EOW9d7xCBKIW9bgoAfrZnsgJp+2d3NqkuPNAedKxCxw8MYRfFiVL
 FY62WMO1wcT3IUnBja7SC8DVyMwS2yC61T5dgZZBpJvM/PDkbHPLPlAxC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="340236414"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="340236414"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 16:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="715113669"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="715113669"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 22 Jun 2023 16:04:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 16:04:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 16:04:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 16:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mh7qMeQANWf18z+yoUup3Koe45btCebHPi70+TlgcJZqISPk6c9bSlb3qb2A5qrIYKyf/X2D8ZbhjQ4ZNBzy5ymEjkWNajXkDvz8UtMpsxLRrcuLsnmlvaNWHZW+N1y3Mb8kfp4QQbL2ssRtqDmAbuLD2PG2xk1CYqM2HUJU4w9hy+i6JBnOAGsFgZqdWTjRZ5SaUnQWz/ppvIGWu/EiNSqG1GbnqzzGEyvBom3KhjtWFf9GDflV5ivOkQloIHgV6aTtiLx0YzGhdRfp8pTHlMNI3LX4V29o8jPxMAr7ctx45XLwrrf6/w3d+Vez9f76KMn9TZF1RUyx+aRMYiFfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWCP7iRmFjgwcPJFcxpUQ9D280G2q+4SYCSPm0YVVyw=;
 b=I3UfALrmUydZvOSnPZN7e5hxD67RJO1g0nkwqsGHVcYmEcJpU0xlhqfUJLyBaSDloB8030XUmNFXcNYABb1WhAXhs0JDsazo9KNqDTgyshF8K4tPySLmEZGjcanhdNvQUbyVqWvzRqZ1IMgY2Ny3XX6666EIV0RGxGwCITj7EDF/UtERRfRgb+NUAlQ6wEKByGpJ8FlEldaUzwN4KuKZb+tDiY9uGbghje3Qn+8Nbt13kw3HW4DBj36btvWctwo9A/zL4Y9CjGFqnBLZnU3EbyN2ufb348plA7clk1o+dafNA+wgfmzR/Fpr3CZ3DxXIW5Nfbh7zMnJRMFIPFbBsWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by BL3PR11MB6529.namprd11.prod.outlook.com (2603:10b6:208:38c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 23:04:34 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::73e1:ee27:c348:6ee]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::73e1:ee27:c348:6ee%6]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 23:04:34 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Souza, 
 Jose" <jose.souza@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe: check for negative 'len' in
 xe_engine_create_ioctl
Thread-Index: AQHZpVsKLDiwb8J/xkeGTdtiy1xqc6+XbkyAgAACy4A=
Date: Thu, 22 Jun 2023 23:04:34 +0000
Message-ID: <52b922efece412c928c8a2ada006ee579e01ea6e.camel@intel.com>
References: <20230622224255.760156-1-paulo.r.zanoni@intel.com>
 <8e8133bfabed35b77b9b8b629a8bd6bb9c4fa022.camel@intel.com>
In-Reply-To: <8e8133bfabed35b77b9b8b629a8bd6bb9c4fa022.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|BL3PR11MB6529:EE_
x-ms-office365-filtering-correlation-id: 37e66bde-db30-4eea-d98d-08db73750b59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qOnQtJf+xyAWrLsq/bPK6E36P62brE/LQFZ3z95cW5jL0WNGO/md8XZ7HW0BLbMgeF9RhVImAQ4bPmjvWpjtJOaG6XR0SoB6geuUAtQczKwJKnaw5cCD+GK9MYcfiQbupyUEbZYKzGaBC7PDWeahxB5cAaq2paB3i23qrfFpTniwrQXFAVsjvbprZw36CVW8xYZNa5nJs+tHMSqeTcT04gqag3Kb7g3QV5+WxrSbxUkYVaqeNiEGhiwTRtHdS6IMluHxifoAq+8PIy3kIpEBC9z6qXK2DMXvBowjRHRQQ52O+7gsnDmtcCdlyPB/fFV0IWssCEnF/GPliSpkSc2jPEW3gCgLvUVA5YPY5W3yip/YyzlrxVfmFIRd+Mst2BzDJZtm8EoFhrUJiiT/aH+y08/9E/jKy6GoKJXSZtpsYJ+28etCkckaQ3xriwcUJjqa9oHCO7fafYOj87HGxsdV+jTmyFOqIRNb4MD50R45SjKMPFYvy5vzxmJwpLZLepL5jIQtaaAlEHWQ78mjq54m1TlYbvTMK1gdoprtrQutSnZnI0h2ze8xYmf3Jl7oKlAo+GyPgwxHPtRPOGgGp1ABqCDK23RsBa7m7ft67F7pGMQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199021)(66946007)(76116006)(66556008)(316002)(6636002)(66476007)(66446008)(6506007)(6512007)(8676002)(8936002)(41300700001)(186003)(26005)(2616005)(110136005)(64756008)(71200400001)(966005)(6486002)(2906002)(5660300002)(478600001)(82960400001)(38070700005)(122000001)(38100700002)(83380400001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3Y3VjlMYVdYS3RsR0lkYUh6R04yMXQ1S2svWWYyOHBHM1VsWTBoSGkzeUE0?=
 =?utf-8?B?VjdhRFEwM2txTEhyY3A3TTErdlZmT1AwajJKOExReUxKTUFGQkpyZnFFVU5Y?=
 =?utf-8?B?ZDM0eUxlcDRNS2JmU3RvdGlMUk1XbVFKQ3hYVHNtajlyVEw4RytGd290ZTZB?=
 =?utf-8?B?T0NjR04rYXlBMFJFK29obGt1clA5TFl5QkhsQ3VEUDRjbm9iOWJEQmp6dGFx?=
 =?utf-8?B?bitYKzB6V2R3aHV6ZGhnaFE3YVlkd2VlZC9uMnVaUlZQYkgvU2FNcDRBa1Zp?=
 =?utf-8?B?T3JMVlE4d0ZLNHYxbGNYbjdwUWRjRlFrbUpkbkJwaXE4ZkVhdW9xK29hTWhG?=
 =?utf-8?B?WFRuUGNVZDh5S2NiOG8xVXY2TzVBVll4SDBJQlk3bGxURmhOczQ5aWNhTjl3?=
 =?utf-8?B?aC9aY3J2RnliM2ZrMEd6a3NOQW44WW5yTHhZZER3SjVOQ1duK0ZTblMxdlZH?=
 =?utf-8?B?S3lhOWVSeW84RGdhN2EzeHpTYnBISFhFQ1ZHdElOZDQrOGRwd3ZCRGswdEpH?=
 =?utf-8?B?MnFNNkkyaDkwb3dXbi80Q1hwQzNyMnV2aU1pNllVRHFaaThPMkQwOWR6b0hJ?=
 =?utf-8?B?ejVTN3lGKzdkRVBxeFh2VDRuWU5CRWhnbjVScTd1KzFyV1h4SHRMT0JJYWlu?=
 =?utf-8?B?bjhPWmtZQVJscGt1ZDNuSFEyR3VCaDAvRlZsMVM2VkJySFJoTEZ4ZXREeFRG?=
 =?utf-8?B?RVJPSUh4NUd1d21TcjE4bEh1dElRaWZoL04vYUxSZ0RhZGNxUEFqYUJmNEFh?=
 =?utf-8?B?THgrbkxIeGpTSjF4ZE10UkdQc1JiZVZXSFozdTlnVGRKNVg0YVV2dE8rb0Jw?=
 =?utf-8?B?OTJzK29peGFOcFhiNks1WXA3eWxjS3VyRXNDV3AyNHNCM1lZd3I4OVNVREky?=
 =?utf-8?B?TmVRRm5hUkJubDFYQm5NSzZydWpWcit5ajFIemZ2QWM2R3hSTVp6S3RNaXVo?=
 =?utf-8?B?MC91azZwL05UZDRTbms5aGdDL2h2bEF3cWp1dUNGaTZVWlZJazdwaUV4azBW?=
 =?utf-8?B?V1RHSmIwNWZ5TFNzd1ZSTHhEc3MyVGlMV2E2dUtsWjhjcDAxNnBkQ2Exb2w0?=
 =?utf-8?B?UkdGU3ZJV04rK00xblB2VmRpWXlNMDZueGpBdVg4QzBaVEgyQ1AzWTY1Yzkr?=
 =?utf-8?B?TzVqY3VuaDhSOFB0cnNSSk5XSk5MYlhTOGNIQXZOVzdRZjlsT0ZMWWlEelJm?=
 =?utf-8?B?NnZYYkc0dlFzRVJhc3gvSytKcDQ1NlZrV09HMGhkdnhxTnBBRGpJOVJzQjZP?=
 =?utf-8?B?Zm1BQUhadWJxRWFucEFESGhCMnUwbjhvaTV5eldMUDQxclptL1IydGhlZWZu?=
 =?utf-8?B?Wm5GcnQ1Nm1uajYyVmZUUGtoelRDZWh2SnNCNFYxTC9vZkxFU21rdmJjUHhM?=
 =?utf-8?B?bHVmQ0NKUVI0dzBCOWMzbVhQUUFzTUpMUE9RamRCOWFYdXVCay9rQzRmeS9j?=
 =?utf-8?B?aDJxQkpIVi9tYm9DOVZLenUyZGh4aU0yZ0dwN0w5UjlrOHd3ODZPSTNtWnBu?=
 =?utf-8?B?eEJZVForNDN1WW9XeU1OZ08zWU9WU25xZVgwTHFqV2N0MlpWenRRdVNlWU1w?=
 =?utf-8?B?Q1hMRHFCVWY1RVhYZTZxUmhpb24zZ1loRkdhMVZrdndVZ0lob21oVDVvUERz?=
 =?utf-8?B?WWh0anBTKzZhWjlLQXc3N052bHNYeFVudUk1cVVWWFhGb1lMY1V6bFowVlJR?=
 =?utf-8?B?OXRvaW5Dcnp2V1ZuVHVtYzN3TjlhZG9aNEhFRzFNRE5oWU5IKzhPeWhLSHhN?=
 =?utf-8?B?S0pkQjZYVytrTGw4OXo2VlhRTWdPc2M2eElXQ0tqVmpHQytTdHpmVHlrOGtE?=
 =?utf-8?B?N0xOeVV1czdsUnZXMEpBcEpja1JUOXRnWUlPa3FsQno1YzlaSVNLWWo2c05O?=
 =?utf-8?B?ekZGdGhhL0t6YUp1UzlLR3ppbmN1THUrWHc1cGdaNElLdElWTUFxcmZPYWVD?=
 =?utf-8?B?azJzOENpTW5CR1kxM1BwdUd1cTRaUjZYSlkyUyt0ZEdVUFlWNUxtZHNVZnNq?=
 =?utf-8?B?aWtpOVEvbDI3c0x2SXFsNzFZM1J0YW9jbytFajFFNS9rZ0Fmd29yQjRmVFgz?=
 =?utf-8?B?UXF5ZXgyUmU1Y1oxR25vd245RmxndjB5YklOcmpCOFdyRXJIbHBqWG9nUXhD?=
 =?utf-8?B?cS85WTNCSkJIRVdvR2UyT09FS0dGeUs3M3VYYTh1cWdsbmJkc3ZndmtYa095?=
 =?utf-8?B?UHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FD5E87808928547B67B52C207DBE9F5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e66bde-db30-4eea-d98d-08db73750b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 23:04:34.1360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fA2Jfkd5Zg2QMm0vkeAddxB7q8z+/aFUEYo8Z/nsjEsAfBO1yB6ipI9993MW5dyN9KaEr52Z3jGAEyFggyLRgZv14kLlol4z9Bxn2A+dJcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6529
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: check for negative 'len' in
 xe_engine_create_ioctl
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

T24gVGh1LCAyMDIzLTA2LTIyIGF0IDIyOjU0ICswMDAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4g
T24gVGh1LCAyMDIzLTA2LTIyIGF0IDE1OjQyIC0wNzAwLCBQYXVsbyBaYW5vbmkgd3JvdGU6DQo+
ID4gVGhlcmUncyB0aGlzIHNoYXJlZCBtYWNoaW5lIHJ1bm5pbmcgeGUua28gYW5kIEkgb2Z0ZW4g
bG9nIGluIHRvIHNlZSBteQ0KPiA+IHRtdXggY29ycnVwdGVkIGJ5IG1lc3NhZ2VzIHN1Y2ggYXM6
DQo+ID4gDQo+ID4gICAgIHVzZXJjb3B5OiBLZXJuZWwgbWVtb3J5IG92ZXJ3cml0ZSBhdHRlbXB0
IGRldGVjdGVkIHRvIHdyYXBwZWQgYWRkcmVzcyAob2Zmc2V0IDAsIHNpemUgMTg0NDY2NjAxNTE5
NjUxOTg3NTQpIQ0KPiA+IA0KPiA+IEkgYWxzbyBzb21ldGltZXMgc2VlOg0KPiA+IA0KPiA+ICAg
ICBrZXJuZWwgQlVHIGF0IG1tL3VzZXJjb3B5LmM6MTAyIQ0KPiA+IA0KPiA+IFNvbWVvbmUgaXMg
cnVubmluZyBhIHByb2dyYW0gdGhhdCdzIGRlZmluaXRlbHkgc3VibWl0dGluZyByYW5kb20NCj4g
PiBudW1iZXJzIHRvIHRoaXMgaW9jdGwuIElmIHlvdSBwYXNzIHdpZHRoPTY1NTM1IGFuZA0KPiA+
IG51bV9wbGFjZW1lbnRzPTMyNzY5IHRoZW4geW91IGdldCBhIG5lZ2F0aXZlICdsZW4nLCB3aGlj
aCBhdm9pZHMgdGhlDQo+ID4gRUlOVkFMIGNoZWNrLCBsZWFkaW5nIHRvIHRoZSBidWcuDQo+ID4g
DQo+ID4gVmVyeSBzaW1wbGUgcmVwcm9kdWNlcjoNCj4gPiAgICAgaHR0cHM6Ly9wZW9wbGUuZnJl
ZWRlc2t0b3Aub3JnL35wemFub25pL2VuZ2luZS1jcmVhdGUtYnVnLw0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFBhdWxvIFphbm9uaSA8cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZW5naW5lLmMgfCAyICstDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZW5naW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZW5naW5lLmMNCj4gPiBpbmRleCA2ZTZiMjkxM2Y3NjYuLjNkMzVkOWY5NDg5NCAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZW5naW5lLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZW5naW5lLmMNCj4gPiBAQCAtNTMwLDcgKzUzMCw3IEBAIGlu
dCB4ZV9lbmdpbmVfY3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRh
dGEsDQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gIA0KPiA+ICAJbGVuID0gYXJncy0+d2lk
dGggKiBhcmdzLT5udW1fcGxhY2VtZW50czsNCj4gPiAtCWlmIChYRV9JT0NUTF9FUlIoeGUsICFs
ZW4gfHwgbGVuID4gWEVfSFdfRU5HSU5FX01BWF9JTlNUQU5DRSkpDQo+ID4gKwlpZiAoWEVfSU9D
VExfRVJSKHhlLCBsZW4gPD0gMCB8fCBsZW4gPiBYRV9IV19FTkdJTkVfTUFYX0lOU1RBTkNFKSkN
Cj4gPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gDQo+IFdoYXQgYWJvdXQgbWFrZSBsZW4gdW5zaWdu
ZWQ/IFRoZSB1c2VyIHRha2VzIGEgdW5zaWduZWQgbG9uZy4uLg0KDQpJIGtuZXcgc29tZW9uZSB3
YXMgZ29pbmcgdG8gcHJvcG9zZSB0aGlzLiBJdCBpcyBhbm90aGVyIHdheSB0byBmaXggdGhlDQpp
c3N1ZS4gSSBjYW4gZG8gdGhhdCBpZiBpdCdzIG1vcmUgZGVzaXJhYmxlLiBJIGhhZCB0byBtYWtl
IGEgZ3Vlc3Mgb24NCndoaWNoIGFwcHJvYWNoIEkgd291bGQgYmUgbW9yZSBlYXNpbHkgYWNjZXB0
YWJsZSBhbmQgSSBzdXBwb3NlIEkNCmd1ZXNzZWQgd3JvbmcgOikuDQoNClNwZWFraW5nIG9mIGFs
dGVybmF0aXZlIGFwcHJvYWNoZXMsIGFub3RoZXIgdGhpbmcgSSBjb25zaWRlcmVkIHdhcyB0bw0K
YWxzbyBzZXBhcmF0ZWx5IGNoZWNrIHdpZHRoIGFuZCBudW1fcGxhY2VtZW50cywgaW4gY2FzZSB0
aGVyZSBleGlzdGVkDQpzb21lIHZhbHVlcyBmb3IgdGhlbSB3aGVyZSBib3RoIGFyZSA+WEVfSFdf
RU5HSU5FX01BWF9JTlNUQU5DRSBidXQgdGhlDQptdWx0aXBsaWNhdGlvbiByZXN1bHRlZCBpbiBv
dmVyZmxvdywgbGVhdmluZyAnbGVuJyB3aXRoIGEgdmFsaWQgdmFsdWUuDQpCdXQgYXMgZmFyIGFz
IEkgY2hlY2tlZCB0aGlzIGlzIG5vdCB2YWxpZCBzaW5jZSB0aGV5J3JlIHVpbnQxNl90IGFuZA0K
bGVuIGlzIGludC4NCg0KDQo+IA0KPiA+ICANCj4gPiAgCWVyciA9IF9fY29weV9mcm9tX3VzZXIo
ZWNpLCB1c2VyX2VjaSwNCj4gDQoNCg==
