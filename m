Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92601C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 22:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C01010E5DE;
	Tue, 31 Oct 2023 22:53:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD5B10E5DE
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 22:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698792809; x=1730328809;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=DCqAMROIcql1MjF80rlVF5ze66uoixArwi+OVJj3kwk=;
 b=i0uIKCBnN6A1/6oz3HPD/dPJat8kBM2d69cTMuFtK2qu5yVwJaiLg+Dy
 gW5VdDuK4FJ3kdLhZfs9vAYLlh2EnzQz758YJPd//C0zQNC7+2CD+yRyP
 IIMKNOrGFIm0nvNnWifKsV5lZrsmY0GmRsRQbEVltb2EuAb05H1NH2rY2
 h7Rj0gjErjcFgIR2Szd9dJ5vYkYUCQSP1/OHl/AyTyAK20KlvSzNmE49m
 4RVPVEKIhgjbcN1n2q6BE7AwQCUUxdZuKUpLoTST6YQUn7I/1WHeMAA8j
 4D/VVoIv4nRA59Wmab1CElTTBCgfPGNcNnXc0SHbUFXatErsOVj6mSnXU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="419506729"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="419506729"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 15:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="764389007"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="764389007"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2023 15:53:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:53:28 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:53:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 15:53:27 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 15:53:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6oQNPke+YKFaWFG/zyeXNjBg8YNg2PcRLvuZ6tqPQfSqA8GMeISadI73qqfnbvRqNsnORLRvQ2rVodBjpmx/Sh4x2B3hL/WCQaKYaryScbk/p9oJVgvY5j+7OkAvMImgFIhJZTeOcG8BP/RvUifuz/wgo0Edf1vXs83rL2a4dJc4uZFqjfMxFk41I4XVE15ZL6Zyl1vBa/Oy9Xc3uls1xG2x0OSIrTtLCydFZSrjocbPlxhwgMOIj+49E61PUNWbMDYcFKp63Ax/RiFO6wkfyonHtRNYqk4py0JUR+uTu8QVFAyxHF73j/DQB/NSo8ymVdePZB1qQuxSSkKMAE9NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCqAMROIcql1MjF80rlVF5ze66uoixArwi+OVJj3kwk=;
 b=aBn54z2+wdTSVG1aP74hywPWr+RTdzCHnbPfbAGzJkv8uLekEPALVyJQ9BFQNh0A1d822jZLl2VCxRvfjGqPg7DqBrE9EQSgS/I804+7xDy6b5C/QbRry/pB9Klmrfb4QZeG20SfCL8EaUlrSycL0WDkGL99Ne0Oj6xFfgkudo70CjvCxvFXjsORz1Nh0UUdIkFzwOhs+KHHSLJiTIlKaVLw4FpL95PNK96NkhZLGXtbayJ/mqDIjmT9+v0dbJvJilgiGe/GZbxJL8YOYMRb5FHZIEylbEC+SPxAe1JZYaGOLEJaF0eaDCvuFUa1jj/MepPAvfej5Ss4h1GnZbrinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB6687.namprd11.prod.outlook.com (2603:10b6:806:25a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Tue, 31 Oct
 2023 22:53:17 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::4ada:1428:b59d:fd4f%7]) with mapi id 15.20.6954.019; Tue, 31 Oct 2023
 22:53:16 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Welty, 
 Brian" <brian.welty@intel.com>
Thread-Topic: [2/2] drm/xe: Fix pagefault and access counter worker functions
Thread-Index: AQHaDEzKQCRtLeDuvUCssGMR3S6v8bBkgXaA
Date: Tue, 31 Oct 2023 22:53:16 +0000
Message-ID: <336cc01975710b80646905be5e9337e6735cc67a.camel@intel.com>
References: <20231031221510.29355-3-brian.welty@intel.com>
In-Reply-To: <20231031221510.29355-3-brian.welty@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB6687:EE_
x-ms-office365-filtering-correlation-id: 1844ee3f-4aaf-4a8a-6ad0-08dbda642b7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O91NWnlr8A0sr/i7rVdsZ32N60YeJDUiGzaxj2HBADA2g1b6/9W5VlPg+q1NJX3UXjT3ooV+eJzU8hxQliDKWElKf5kXg5LqcyKBOEwNtM7mbSLcv7/atrhZM3f+8GS6+XqEdi1/d4SoilJImH94yxgc+aauA7svEb+4nRZ6aGrsvfZ6BjD8W0QJnf9AxUbPNvt0tRh4gkgsEGpfuutJk0FkCufP8YLgAjn5InzgSdvzGlBN4I3ZvjwzwOdOszis+hHLLG8HjI4+BMBTrrMFn2QC+IWAh6li1vuL6R0Ap3M18UXjCrqdi5SK8w+Yee0WQdM2QawyV8a/F2KHY6wha0F/s81chy2a+mvSwZL0IAY8Mh9JZxR1BJpM6xU50EoeHt1owPxtBl+QJWap8nrgj7zjJ6sh+tmJK3x53I1r5btg8cS+oLmBWPjHXTIdkVKuco2rW42ZNURQqT2n/K4Q5E+WvSSwFIssO7I2dxwBUXfL6ztEegxiHrghSlgyF2TarVahO2R1Obb3/3NToWTN7OlRLb/SK6T2/POA/Z/8wNA2F+v9jhQvWVW2phshCFiNtz4sCflxJMdmk40CRi7KP0vXdD+SvGbmoy1OyiCfQCy9bQ8k/XU95ZAb8AJKdAIh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6512007)(36756003)(26005)(5660300002)(71200400001)(6506007)(2616005)(83380400001)(82960400001)(4001150100001)(8676002)(8936002)(316002)(66556008)(64756008)(66476007)(66446008)(122000001)(41300700001)(38070700009)(6636002)(66946007)(86362001)(478600001)(76116006)(110136005)(38100700002)(2906002)(6486002)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGRMamVwVk1RYkxJM1o2UmgrTmVBRFR2OXNNZU02a3Q2QnU3bDJGNHZqRWd5?=
 =?utf-8?B?Ykd3SUIyakRock9pRDYzeXhIcFMyRFlIZGc0a3ArSkdjS0Z3R2pNWWJ3T3Ru?=
 =?utf-8?B?SDJxdVZjdTBRbjhLaFcxTzVsbkRMTDh2WVp1UTl5bzNHalcrTVJma1JCaE9R?=
 =?utf-8?B?bCtGTXlYdEJBM0VpVVpzci9UVWVoaG0yOFhRb3FrUVhadGZVRnd2TFdLQWUw?=
 =?utf-8?B?NGlQY0xpWDk4bGFVVFQwa3U0ZmVad2RtbHZtQXd3QmFXaXNoSVY4eU14ald5?=
 =?utf-8?B?NE5pR29oMklEendwZnVTdS8xVnJhREV2NVRTYkU1c1B6MVNhcHFvWTNEblNu?=
 =?utf-8?B?R3JNbXE0ZVVuc1Nwalk0c0c5RGJ5anhYRUhaZUVHbU5lWGdqd3pORlI3eUhY?=
 =?utf-8?B?dHo2WG9hLzcvTkdmTXFYNGRGQ3JCeVJuQ1I3Qk9ka3FGT0JRTXlqcGhFQU01?=
 =?utf-8?B?QXRuWUVYVWZnaituZ1U2K2ovcFc4dVBlMzdJV3J4NXlSdTBGREhKL3BIeTU1?=
 =?utf-8?B?U2N3YkJXMmtyd2VnSlBsMkNtTVEyaHpMT1NhaTJFdXZkY1YycmxmRHJwY0R3?=
 =?utf-8?B?YVFmbStJOUM3WTArbnpPdHllTzZUMktad0JFdG8weGtvM2Ywc3VBYURqd2Vm?=
 =?utf-8?B?cmFYRmEvMGE3NExDeXJTSVpyTVl1QmJmLzlBb0FzNURlbTE0OXBrS3RibTlQ?=
 =?utf-8?B?cHo4bUZwdmJwQTVRTks5ODVRdU5KaVJDSTVKWW5ra1FUU3d4Rjc0SEQ1Njl0?=
 =?utf-8?B?YUZTaFRtYkpXK2hHbisxdjhLMDFhV2JFUDlrL2xpbHZhTktJZFc0MVBrNmxi?=
 =?utf-8?B?V0dRdndrc2RKNFZ5dm1KR0FmZWc0Vmtacno0YzVBaEVFc1JZdVBjRFoxYngy?=
 =?utf-8?B?SnJRUDV5eHVpZERlMmh1RDNZdjhlMCtya1NsY3B4RUlMd012cmZmd3BnY1hr?=
 =?utf-8?B?MmJnaVlpVjgwbFdlak54T0Z4ZUdpUm5nSndnelFXSWdGSXFoQ0d4TThSNWda?=
 =?utf-8?B?azF5Qm5IQUVGR2pGaW8wQlZncHJ4aWxERGxvY3Q5cnR6Q0ljQmFaaS9ydGJu?=
 =?utf-8?B?SzJVejRPd2RNR2VBV3oySWxsaUszeTN1bHVDU2JnWnhHcHFGYlhKRUQyS3Nj?=
 =?utf-8?B?WnU3cWhlM1p5QUlDL21xVUZkY1RXb3ZweVpJU3dLUjQrTWhZUFJMc1RKally?=
 =?utf-8?B?cFZCNkdOVnJJbDZwU2JNMnVzeW1XTnpYTWc0cU9rMTF1NEEyRU9oUFFqKzZx?=
 =?utf-8?B?MnpqL3JBbTVVNmVNZXRNRE8zVC9FUHA4UXZhR2dmNXNsYkc4Q3VzWFRLUnZj?=
 =?utf-8?B?Y2RpNFVmLzdVUXREcW93WDcvbUl5QjAyRU1pUHIxcnZQSmYwV2tYT2FxeTlM?=
 =?utf-8?B?d1IvOUNMNFNRS1E4eWRDSWx6Vmk0RjZTTjZqSUI4UHhCTTZnQmJSci9VRFMv?=
 =?utf-8?B?cFkyOUNqc1o3R0EvcG0vZTAwbjBwWWZxM2ErVThJV3F4RVRYcjJjY1V3Q0k3?=
 =?utf-8?B?QU54UEtnS3ZMVVp4WWNJVUlXek1IeXlJSDNVb1VLUEJBQmFXZTRZYWM5SGVo?=
 =?utf-8?B?YzdKZkUxdVhLNFQ1ZEVDZm9aYzBDK0FMdEtpK3NKMXFuLzZNcFRCN1RQQmxl?=
 =?utf-8?B?Yi8wVDBOczV5MXBEZnh5c2JJNXRRS3BDbTdHajVSc1I1ZnhZWjQxbUhlZi9R?=
 =?utf-8?B?ZWNMR0hpRkFjRmFwQTBsTVNlSTlzWCtBSnNrWHFWWXIvaFREUUkwVk1aUVFn?=
 =?utf-8?B?TW1oZEJPK29Wejg4aGNtcDYzcHZYWEVpZ2xZdmgyRHJFcFg2U0hzUmFUODJs?=
 =?utf-8?B?Q0Q1U09ITlBsQUxhQ0VEelpjclNzMmhsQzlxb2JVaEdKcDBXOFBoUjY0WlV3?=
 =?utf-8?B?QkZDNGptclc1cDJydUVPR3NmSEltR2hIMjNGTFlWeGNiQ05sRUZNckVTMzZS?=
 =?utf-8?B?amFRRW0yTVNzYklUVmhqUHU3SlJWZEgveG9wdjJmaTd3eVVIZ2VFU0FEdFlE?=
 =?utf-8?B?dTNOSWV4b1ludHpDWGgrb1dBN1pGNkJabXNRV01MaG5nOTNLZzJSeWdBZFdw?=
 =?utf-8?B?ejhjWllyR2JxeEhNQmVLVnZ1d21zRWVTZFNqenJXU29jQktiZE5WM2FTbFFl?=
 =?utf-8?B?NnBxMXFJeVlGMFM5aEFpbTRpSGFrV2lYTmlHcGo0OVIyT2l2MkJoamRSNGU4?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B79686D2945C9479565728A2932277C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1844ee3f-4aaf-4a8a-6ad0-08dbda642b7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 22:53:16.3738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cLktN0XcrcmKUbtMmLtswK9Cgmk4nGOalvEdoPqyO9+arZIQhlm5E7RX4/+jvmnsPk+mWig8I/MFNUaQv2qQml/kMeYiz8yVDKQI8e1YAPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6687
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [2/2] drm/xe: Fix pagefault and access counter
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

T24gVHVlLCAyMDIzLTEwLTMxIGF0IDE1OjE1IC0wNzAwLCBCcmlhbiBXZWx0eSB3cm90ZToKPiBX
aGVuIHByb2Nlc3NpbmcgRzJIIG1lc3NhZ2VzIGZvciBwYWdlZmF1bHQgb3IgYWNjZXNzIGNvdW50
ZXJzLCB3ZQo+IHF1ZXVlIGEKPiB3b3JrIGl0ZW0gYW5kIGNhbGwgcXVldWVfd29yaygpLiBUaGlz
IGZhaWxzIGlmIHRoZSB3b3JrZXIgdGhyZWFkIGlzCj4gYWxyZWFkeQo+IHF1ZXVlZCB0byBydW4u
Cj4gVGhlIGV4cGVjdGF0aW9uIGlzIHRoYXQgdGhlIHdvcmtlciBmdW5jdGlvbiB3aWxsIHByb2Nl
c3MgbW9yZSB0aGFuIGEKPiBzaW5nbGUKPiBpdGVtLCBhbmQgaXMgdXBkYXRlZCBoZXJlIHRvIGNv
bnRpbnVlIGV4ZWN1dGluZyB1bnRpbCBhbGwgcXVldWVkIHdvcmsKPiBpdGVtcwo+IGFyZSBoYW5k
bGVkLgo+IAo+IFRoaXMgcmVzb2x2ZXMgaXNzdWVzIHNlZW4gd2l0aCBzZXZlcmFsIGlndEB4ZV9l
eGVjX2ZhdWx0X21vZGUKPiBzdWJ0ZXN0cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBXZWx0
eSA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0X3BhZ2VmYXVsdC5jIHwgNjYgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAtLQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMKPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYwo+IGluZGV4IGFiNmRhZWJiZDc3Yy4uNjNm
YmE4M2MwODM5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1
bHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYwo+IEBAIC0y
NzYsMTAgKzI3NiwxMCBAQCBzdGF0aWMgdm9pZCBwcmludF9wYWdlZmF1bHQoc3RydWN0IHhlX2Rl
dmljZQo+ICp4ZSwgc3RydWN0IHBhZ2VmYXVsdCAqcGYpCj4gwqAKPiDCoCNkZWZpbmUgUEZfTVNH
X0xFTl9EV8KgwqA0Cj4gwqAKPiAtc3RhdGljIGludCBnZXRfcGFnZWZhdWx0KHN0cnVjdCBwZl9x
dWV1ZSAqcGZfcXVldWUsIHN0cnVjdCBwYWdlZmF1bHQKPiAqcGYpCj4gK3N0YXRpYyBib29sIGdl
dF9wYWdlZmF1bHQoc3RydWN0IHBmX3F1ZXVlICpwZl9xdWV1ZSwgc3RydWN0Cj4gcGFnZWZhdWx0
ICpwZikKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgY29uc3Qgc3RydWN0IHhlX2d1Y19wYWdlZmF1
bHRfZGVzYyAqZGVzYzsKPiAtwqDCoMKgwqDCoMKgwqBpbnQgcmV0ID0gMDsKPiArwqDCoMKgwqDC
oMKgwqBib29sIHJldCA9IGZhbHNlOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHNwaW5fbG9ja19p
cnEoJnBmX3F1ZXVlLT5sb2NrKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHBmX3F1ZXVlLT5oZWFk
ICE9IHBmX3F1ZXVlLT50YWlsKSB7Cj4gQEAgLTMwMyw4ICszMDMsNyBAQCBzdGF0aWMgaW50IGdl
dF9wYWdlZmF1bHQoc3RydWN0IHBmX3F1ZXVlCj4gKnBmX3F1ZXVlLCBzdHJ1Y3QgcGFnZWZhdWx0
ICpwZikKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGZfcXVldWUtPmhl
YWQgPSAocGZfcXVldWUtPmhlYWQgKyBQRl9NU0dfTEVOX0RXKSAlCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUEZfUVVFVUVfTlVNX0RXOwo+IC3CoMKg
wqDCoMKgwqDCoH0gZWxzZSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9
IC0xOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSB0cnVlOwo+IMKgwqDC
oMKgwqDCoMKgwqB9Cj4gwqDCoMKgwqDCoMKgwqDCoHNwaW5fdW5sb2NrX2lycSgmcGZfcXVldWUt
PmxvY2spOwo+IMKgCj4gQEAgLTM1NywyOSArMzU2LDI3IEBAIHN0YXRpYyB2b2lkIHBmX3F1ZXVl
X3dvcmtfZnVuYyhzdHJ1Y3QKPiB3b3JrX3N0cnVjdCAqdykKPiDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IHBhZ2VmYXVsdCBwZiA9IHt9Owo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgcmV0Owo+IMKgCj4g
LcKgwqDCoMKgwqDCoMKgcmV0ID0gZ2V0X3BhZ2VmYXVsdChwZl9xdWV1ZSwgJnBmKTsKPiAtwqDC
oMKgwqDCoMKgwqBpZiAocmV0KQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm47Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoHJldCA9IGhhbmRsZV9wYWdlZmF1bHQoZ3QsICZwZik7
Cj4gLcKgwqDCoMKgwqDCoMKgaWYgKHVubGlrZWx5KHJldCkpIHsKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcHJpbnRfcGFnZWZhdWx0KHhlLCAmcGYpOwo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBwZi5mYXVsdF91bnN1Y2Nlc3NmdWwgPSAxOwo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fZGJnKCZ4ZS0+ZHJtLCAiRmF1bHQgcmVzcG9uc2U6IFVu
c3VjY2Vzc2Z1bAo+ICVkXG4iLCByZXQpOwo+IC3CoMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDC
oMKgwqB3aGlsZSAoZ2V0X3BhZ2VmYXVsdChwZl9xdWV1ZSwgJnBmKSkgewoKU29ycnkgbWF5YmUg
SSdtIG1pc3NpbmcuLi4gZG9uJ3Qgd2Ugd2FudCB0aGlzIHRvIGJlCndoaWxlKCFnZXRfcGFnZWZh
dWx0KCkpCgo/CgotU3R1YXJ0Cgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQg
PSBoYW5kbGVfcGFnZWZhdWx0KGd0LCAmcGYpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpZiAodW5saWtlbHkocmV0KSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcHJpbnRfcGFnZWZhdWx0KHhlLCAmcGYpOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGYuZmF1bHRfdW5zdWNjZXNzZnVs
ID0gMTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRy
bV9kYmcoJnhlLT5kcm0sICJGYXVsdCByZXNwb25zZToKPiBVbnN1Y2Nlc3NmdWwgJWRcbiIsIHJl
dCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IC3CoMKgwqDCoMKg
wqDCoHJlcGx5LmR3MCA9IEZJRUxEX1BSRVAoUEZSX1ZBTElELCAxKSB8Cj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoEZJRUxEX1BSRVAoUEZSX1NVQ0NFU1MsIHBmLmZhdWx0X3Vuc3Vj
Y2Vzc2Z1bCkgfAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBGSUVMRF9QUkVQKFBG
Ul9SRVBMWSwgUEZSX0FDQ0VTUykgfAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBG
SUVMRF9QUkVQKFBGUl9ERVNDX1RZUEUsIEZBVUxUX1JFU1BPTlNFX0RFU0MpIHwKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRklFTERfUFJFUChQRlJfQVNJRCwgcGYuYXNpZCk7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlcGx5LmR3MCA9IEZJRUxEX1BSRVAoUEZS
X1ZBTElELCAxKSB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBGSUVMRF9QUkVQKFBGUl9TVUNDRVNTLAo+IHBmLmZhdWx0X3Vuc3VjY2Vzc2Z1bCkgfAo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRklFTERfUFJF
UChQRlJfUkVQTFksIFBGUl9BQ0NFU1MpIHwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoEZJRUxEX1BSRVAoUEZSX0RFU0NfVFlQRSwKPiBGQVVMVF9SRVNQ
T05TRV9ERVNDKSB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBGSUVMRF9QUkVQKFBGUl9BU0lELCBwZi5hc2lkKTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDC
oHJlcGx5LmR3MSA9IEZJRUxEX1BSRVAoUEZSX1ZGSUQsIHBmLnZmaWQpIHwKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgRklFTERfUFJFUChQRlJfRU5HX0lOU1RBTkNFLCBwZi5lbmdp
bmVfaW5zdGFuY2UpIHwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRklFTERfUFJF
UChQRlJfRU5HX0NMQVNTLCBwZi5lbmdpbmVfY2xhc3MpIHwKPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgRklFTERfUFJFUChQRlJfUERBVEEsIHBmLnBkYXRhKTsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVwbHkuZHcxID0gRklFTERfUFJFUChQRlJfVkZJRCwgcGYu
dmZpZCkgfAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
RklFTERfUFJFUChQRlJfRU5HX0lOU1RBTkNFLAo+IHBmLmVuZ2luZV9pbnN0YW5jZSkgfAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRklFTERfUFJFUChQ
RlJfRU5HX0NMQVNTLCBwZi5lbmdpbmVfY2xhc3MpIHwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEZJRUxEX1BSRVAoUEZSX1BEQVRBLCBwZi5wZGF0YSk7
Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBzZW5kX3BhZ2VmYXVsdF9yZXBseSgmZ3QtPnVjLmd1Yywg
JnJlcGx5KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2VuZF9wYWdlZmF1bHRf
cmVwbHkoJmd0LT51Yy5ndWMsICZyZXBseSk7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+IMKgfQo+IMKg
Cj4gwqBzdGF0aWMgdm9pZCBhY2NfcXVldWVfd29ya19mdW5jKHN0cnVjdCB3b3JrX3N0cnVjdCAq
dyk7Cj4gQEAgLTU0NCwxMCArNTQxLDEwIEBAIHN0YXRpYyBpbnQgaGFuZGxlX2FjYyhzdHJ1Y3Qg
eGVfZ3QgKmd0LCBzdHJ1Y3QKPiBhY2MgKmFjYykKPiDCoAo+IMKgI2RlZmluZSBBQ0NfTVNHX0xF
Tl9EV8KgwqDCoMKgwqDCoMKgIDQKPiDCoAo+IC1zdGF0aWMgaW50IGdldF9hY2Moc3RydWN0IGFj
Y19xdWV1ZSAqYWNjX3F1ZXVlLCBzdHJ1Y3QgYWNjICphY2MpCj4gK3N0YXRpYyBib29sIGdldF9h
Y2Moc3RydWN0IGFjY19xdWV1ZSAqYWNjX3F1ZXVlLCBzdHJ1Y3QgYWNjICphY2MpCj4gwqB7Cj4g
wqDCoMKgwqDCoMKgwqDCoGNvbnN0IHN0cnVjdCB4ZV9ndWNfYWNjX2Rlc2MgKmRlc2M7Cj4gLcKg
wqDCoMKgwqDCoMKgaW50IHJldCA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgYm9vbCByZXQgPSBmYWxz
ZTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBzcGluX2xvY2soJmFjY19xdWV1ZS0+bG9jayk7Cj4g
wqDCoMKgwqDCoMKgwqDCoGlmIChhY2NfcXVldWUtPmhlYWQgIT0gYWNjX3F1ZXVlLT50YWlsKSB7
Cj4gQEAgLTU2Nyw4ICs1NjQsNyBAQCBzdGF0aWMgaW50IGdldF9hY2Moc3RydWN0IGFjY19xdWV1
ZSAqYWNjX3F1ZXVlLAo+IHN0cnVjdCBhY2MgKmFjYykKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgYWNjX3F1ZXVlLT5oZWFkID0gKGFjY19xdWV1ZS0+aGVhZCArIEFDQ19N
U0dfTEVOX0RXKQo+ICUKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQUNDX1FVRVVFX05VTV9EVzsKPiAtwqDCoMKgwqDC
oMKgwqB9IGVsc2Ugewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSAtMTsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gdHJ1ZTsKPiDCoMKgwqDCoMKg
wqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKgwqBzcGluX3VubG9jaygmYWNjX3F1ZXVlLT5sb2NrKTsK
PiDCoAo+IEBAIC01ODMsMTQgKzU3OSwxMiBAQCBzdGF0aWMgdm9pZCBhY2NfcXVldWVfd29ya19m
dW5jKHN0cnVjdAo+IHdvcmtfc3RydWN0ICp3KQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgYWNj
IGFjYyA9IHt9Owo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgcmV0Owo+IMKgCj4gLcKgwqDCoMKgwqDC
oMKgcmV0ID0gZ2V0X2FjYyhhY2NfcXVldWUsICZhY2MpOwo+IC3CoMKgwqDCoMKgwqDCoGlmIChy
ZXQpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiAtCj4gLcKgwqDC
oMKgwqDCoMKgcmV0ID0gaGFuZGxlX2FjYyhndCwgJmFjYyk7Cj4gLcKgwqDCoMKgwqDCoMKgaWYg
KHVubGlrZWx5KHJldCkpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJpbnRf
YWNjKHhlLCAmYWNjKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX3dhcm4o
JnhlLT5kcm0sICJBQ0M6IFVuc3VjY2Vzc2Z1bCAlZFxuIiwgcmV0KTsKPiArwqDCoMKgwqDCoMKg
wqB3aGlsZSAoZ2V0X2FjYyhhY2NfcXVldWUsICZhY2MpKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldCA9IGhhbmRsZV9hY2MoZ3QsICZhY2MpOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpZiAodW5saWtlbHkocmV0KSkgewo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJpbnRfYWNjKHhlLCAmYWNjKTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV93YXJuKCZ4ZS0+
ZHJtLCAiQUNDOiBVbnN1Y2Nlc3NmdWwgJWRcbiIsCj4gcmV0KTsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqB9Cj4gwqAKCg==
