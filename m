Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EC9C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 11:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC88A10E6EE;
	Wed,  6 Dec 2023 11:46:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3A810E6EF
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701863182; x=1733399182;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mjhOWIVbpeGVU7j4lr9De8+6roV2fwFCZSKg9SmornA=;
 b=Y/XPwS3XgAa7T8kUoUZWFSTpF3/HgrmGjCPuxt07oFfmW+kjtUN0jmhq
 paNHmk5KjvorTO+G+txoLXy47q68Q7ZOWARtAmnQJr2b//1fg2gcrzB+A
 py0VVmpukGmZ5aV4LnqKg44Tw8XEtIlA4Ihwor+zCX/rlmSjno6kKPnx7
 xs9j+m9kwoleOnyE9PGOBi55LUgJF7j2+U8UoLr/kdUk1RY5iv9agG1f+
 ZIw+nWmZ9DdEJl+PxdbVFpConw+gn/S6fqcms9NcPcUTv5Zmoz1WmzYye
 oca/jxdzjA05ZE6F0oSZbpnY+I2qHrGQR98cXij+gm49rJ/R9vY3DIMSO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="934689"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="934689"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 03:46:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="805622626"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="805622626"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 03:46:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 03:46:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 03:46:21 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 03:46:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dd6VbW+IXbx3Y0p5O50x8BX46OAMYk1nZQywJbtE+UVn5H/y/IT4BiDCHUpYTKgHNqlb5K4fKr9bDY/a9PT/g7qPs80r4l6QtJ47+VhizBvFx3Je4QOTDxQOX1Msn97J717N0f6VMtPfoIydGsd0O0B5hmUQzAFJSQWuwctq/bLQdOQrHJ36VeCvg9ppMttAvdVQqIlIucczbAM151x6C2RTM8UT2aozsI4c+Wy8q5pmk+mM5GqBKSvJ1YS0B+8CNMRZAECR7B968l8wiKddQs07BzV1gKyfdgO8ZQWSi/1yzWBXlmn7xcPxhfD/Qj5T910d9mMcMgAxudsN8ajeEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjhOWIVbpeGVU7j4lr9De8+6roV2fwFCZSKg9SmornA=;
 b=c5kwX4B64RsptDC3dJ/ue6jGFnsN5yfLu/iZt7mEfROgKpD18696LWxxSgC7pBl1tr1iDpbV+dBmqscCGzT4lUAKj+i3eVubuoK824S2ZnmSY2lCkEfpvr5inJhfqHhVMqCtVE8EKbEfcHJyPkG2lHMZrK/iz6qQv82haxVGGMr+AypX4CwVQcOElb1wW+ilsHo9t/sJG3GHGWxEcv1E6rspP+3dZjAFvKyk0KsB54SqcUuktvXmeiOrcTin+5IppT0wflP283pps8h3YSQtCXsqU+DaluqY4TtGQHOAzG3Ul6LQnZBM1mACB4uKtVe8JUvVSDO+h7NfQPIqg0MeUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 PH7PR11MB6906.namprd11.prod.outlook.com (2603:10b6:510:202::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 11:46:17 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::83fd:c944:e8ef:8adf]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::83fd:c944:e8ef:8adf%4]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 11:46:17 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>
Thread-Topic: [Intel-xe] LLC configurating, mmap and bo cache management
 questions
Thread-Index: AQHaJ4YS5+oCPjcXB0uWT5v3pcaZKbCb7OYAgAAqcoCAAA09AA==
Date: Wed, 6 Dec 2023 11:46:17 +0000
Message-ID: <36e0e059e0f74ca7c55b2647658456fabe26420d.camel@intel.com>
References: <02c74379-6513-40cc-a195-c4eeb7a7fd79@linux.intel.com>
 <c16bc9f7bd18f531136ebbcf6504d497db9a793a.camel@intel.com>
 <eaa44445-21e2-4b9f-95a0-6b7395203900@linux.intel.com>
In-Reply-To: <eaa44445-21e2-4b9f-95a0-6b7395203900@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3114:EE_|PH7PR11MB6906:EE_
x-ms-office365-filtering-correlation-id: 3076c65a-f78f-46f8-d929-08dbf650f51d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qR5oe1vpta3h+np1i3HFlBPjgNSuQPmgBwzNWpBLUvwMXVHIuBYRi4Dy8hnNRhA3/zUzt9Gu/9eahGmXxzoJZf0hsKJBp6CEvQcMVsU1BOXhdQlOJEl4O+6Li3Z3NJB/Ekh/Iu+kzlUFFfFXuUVXujtZJQE9Qayr0m0mh5JAGxPt5M9FLvAhEv4AaI2V/Y7ASDYQy6Hfb0AGUTI3oqGl64B1Z1peA6e9ZjGrWwA2bfKq+duJ3geOKdRCkKLQHmWIjHgLXe3hk7hJKWsG4JzA/Pwil61bVIMk+1yv+joKikrzajy2YHv1SRXScuURF326rkG2hq4429DnLnWeuUZZZLhKzgmRLFzAwQqOg0ePdqrW9dEqPnjEJIzwBhAmdBRRlfaXMgjAyzNgk3FymFu86ggBfFIYuazj0cnrg+Qn/qeaUew/pe1pIGIKesilL1Elax0u5MNRUqZozSEQs45siqZeXw+o+9pH8DVJZGWI7roR76ofaolZLEUJjWzp0mxRIO13AVRtYtMc/XnILNTcc3lSacwScND3p4WpcpHp7yREwaKmQER3YlwjJ9wEE3Mj0aE4stOetlKXOeBWmHqkaVjwBjP9uAoxNX7D4m7PoF7GIJIB5qaxFsHbfweBaSb3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(376002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6486002)(478600001)(5660300002)(71200400001)(53546011)(64756008)(66476007)(54906003)(66946007)(316002)(66556008)(66446008)(8936002)(4326008)(8676002)(6506007)(86362001)(76116006)(110136005)(91956017)(66899024)(38070700009)(82960400001)(83380400001)(122000001)(36756003)(38100700002)(41300700001)(2616005)(2906002)(26005)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWZOK3Vza0hpaVdjWnNpN3l0N0x2TXhVNllIZlhaajFCV3luUnUrWDI3cU9Z?=
 =?utf-8?B?NzdENi9sTGtwY2cvOURVT2VMS3ozTGtPSDNrVXR5K1d6WFh4aHc2YzFlanhX?=
 =?utf-8?B?VnJ5aUR5UW9taTNFaGs3MVNVTnBYQktVV0JzL2poNlN6VDRGbko3ck9Tb21q?=
 =?utf-8?B?TkNiRStnbTl2THlOTHdBMkp4eER3dEJDdTJOZmJMMkdCYTlVM2ZVRGxwMHhm?=
 =?utf-8?B?Z1dTL2ZzaG1YYTQ1aWpRdC9Hd09DNU1zS0R4Q0U5Q2FHRDVNQlB3ZGdUVzBu?=
 =?utf-8?B?RGpYRTc5OFYyM3BlS2RPT3NvbTZrOHRUOFdsM3JEYlBHRDZFZzNKQ09zaGpF?=
 =?utf-8?B?Zm90YkxLUzh3T0IrUWxlN0hCVmhjZDBpUTE5S1JXbituaE16eDkrcVFCRjgr?=
 =?utf-8?B?cVlIMTlHcXN1SXNSRFpWOEZ0Z2pGaHQvYmErak9DMFFNTjZlQXUzUlZ2S3Vo?=
 =?utf-8?B?N29YS2VXc3gxeko2cmVtc0k3TVlDRUhtZHFkRy9CUE5IK2FwQTN0QW9xVHo0?=
 =?utf-8?B?OFMxRzNldmMvSE5iaEI0Mm45V1BwMEFnNituV2VUOGErNlB3cjdZNysxYStx?=
 =?utf-8?B?bDVla01ieWJhcGI5MFpNRHVjRCtqeDJnWS9qeWJnQ1pvZjd2KzZZNWg1NWNq?=
 =?utf-8?B?VHVsUS96SFFiQzlWTEh3UGZyWExBcGRBVTBZMlhKdmU3cWhmM0xvckE0dTlW?=
 =?utf-8?B?bXNiYmVBTTlsTStPWkY0WGNJNkJNL3pqY2hkR2wydXA5T283RmIzemQxdDNj?=
 =?utf-8?B?a3kxdFRzOU41THIzTUlHUkdCT1ZWNm5YWDAvdCtmQ2FNZzM1Rk1DYjBxZkk4?=
 =?utf-8?B?b3R5S1VDNkpCUUJRWFpCWlFrWWZqNGdQS1JzSGl2NytMNmpTOE1qQ3pQbkt2?=
 =?utf-8?B?UmtoejJRUHc4Ty85ZlhucGkvU0JkRjh1YS8yUlVUVFFvSzBkcko0YmNOT1Nj?=
 =?utf-8?B?dE9wcXQyclVDWTVIYmx2ZHNsQTF0UXkwc01ZRThSMEp0N2FDWkNRNVd3L1Zl?=
 =?utf-8?B?NUxQb1U1REhCYy92N3pSallWeC96VDdzNldxWmY5MVdJYS9FZDA0aFljUXlh?=
 =?utf-8?B?MFNSaUIrZ1Y2NmNXVXdEdG5Rd09nTlhxYkxkajFabkhVNm1vQVVvMUI2QmFa?=
 =?utf-8?B?bEFjZU0vd0JvK05qMndVRUdjTDdRV3RUQVV4OHNqVW9zZE8zV01NdTNCRnB6?=
 =?utf-8?B?NVdvK29HKzE3TDhwL1dPUE0wanBjdkpHYTF4RXlYL29qd0R1bTVGU2FOQ2dU?=
 =?utf-8?B?cVFscS91bjhwTGhWWEpHV3RxTUdIckhVWUpsdFYvUXJaMnIvcHVGTTgydktL?=
 =?utf-8?B?WUlmb2ZHYWlBZUVlejBjRUpwMDJnWVRCbjNPWkJVdHBGQWdkM3d6NlpoSTlq?=
 =?utf-8?B?ck9EY1JMKzd0NzJPZjZrdlJ0UXR6TW8vNVhrL29zL0NGemlLdjZDUnR3NjBt?=
 =?utf-8?B?NjJMdlg3dWY0TlhzYlhwNE5IWjgxeXAwaFRWa05ONndQQzRSVlRyeHByek1s?=
 =?utf-8?B?WWcrQlV2bmx4L2s2TFUrYytsSWJpRFV1ZklLWmVIV1JRUUpKaldKenI0b2Zw?=
 =?utf-8?B?Nmo0Qno2dzc4NXZySWxHOHNDVHR4R0hLbzBERHpNV2loVG1FVHIxbXlHZkph?=
 =?utf-8?B?MlNXc3lMY3dBMUZyakF0dVRDZnJZc3Y5OTJYcGFudzM5NVZWL0daeFd6S3ZZ?=
 =?utf-8?B?NXNUMXdNUDcvaVBxOGlJSmhuNUFIS3dFdEhFU0RTZXZFMFZNdkhMTXNCN0d5?=
 =?utf-8?B?QUpMVEZZUXEzcVVIMkZOemNlMkg5QTcyZWswM09EQkR3bWJ0KzZRem9NWkhM?=
 =?utf-8?B?WHpPaWZjb1NCS3hKUm0wQmtiNWJCMEhUemlFdXFRd1VlQWMxbVN2NE0ySG1H?=
 =?utf-8?B?VHhHMUloWVZ2akRTUS9hL3h0YXNRTjY0WU5mRDhCSEYrVXl4MUMzU1Uxa1Q2?=
 =?utf-8?B?L1RlYWJ4NUxCRjNDa1l0a054QlBRQU1JK2lVZm9ZUm9UbkJRaDVmaURTUnVH?=
 =?utf-8?B?aGMwT3JNZTRhdVhXcXVubVNsN1hjdG52cmV5d21rWUJEVTh5TDVpbUkrQzk4?=
 =?utf-8?B?enEvcS9UZC9odHZ1YnhITHFrUWZlb294UjZSUkJGSHhvZmtZZUpEeitYaEpm?=
 =?utf-8?B?VkYrREpOVGZ1T29TUlcxdTJRSWZhOGgzYVFzbDd6MHFBQ2VHSG5TNzJIZHJ6?=
 =?utf-8?Q?K7SfP96X86o839xFu8rSMIM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32559BE33B3E4F43B625655FBCF5BDE0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3076c65a-f78f-46f8-d929-08dbf650f51d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 11:46:17.3190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZMvw4PbBKmBrZNBWg9lyMrBo5CxXFHMaYII1GGFHQSaRV2Zsaz+n2XTX/P20lBKuaktM39q9fywaAiyk5PKAUiHw4cyrup+IqX3ZsFpa0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6906
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] LLC configurating,
 mmap and bo cache management questions
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>, "Santa,
 Carlos" <carlos.santa@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SGksIFR2cnRrby4NCg0KT24gV2VkLCAyMDIzLTEyLTA2IGF0IDEwOjU4ICswMDAwLCBUdnJ0a28g
VXJzdWxpbiB3cm90ZToNCj4gDQo+IEhpIFRob21hcywNCj4gDQo+IE9uIDA2LzEyLzIwMjMgMDg6
MjYsIEhlbGxzdHJvbSwgVGhvbWFzIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAyMy0xMi0wNSBhdCAx
NDoxOSArMDAwMCwgVHZydGtvIFVyc3VsaW4gd3JvdGU6DQo+ID4gPiANCj4gPiA+IEhpLA0KPiA+
ID4gDQo+ID4gPiBXZSBhcmUgd29ya2luZyBvbiBhZGRpbmcgeGUgc3VwcG9ydCB0byBDaHJvbWVP
UyBtaW5pZ2JtIGFuZCBoYXZlDQo+ID4gPiBhDQo+ID4gPiBjb3VwbGUgcXVlc3Rpb25zLg0KPiA+
ID4gDQo+ID4gPiBJZiBJIGZvbGxvdyB0aGluZ3MgY29ycmVjdGx5IHdpdGggeGUgbW1hcCBjYWNo
aW5nIG1vZGUgaXMgZml4ZWQNCj4gPiA+IHRvDQo+ID4gPiBvYmplY3QgY2FjaGluZyBtb2RlcyBz
ZXQgYXQgYm8gY3JlYXRlLiBGb3IgZnJhbWVidWZmZXJzIGl0IHdpbGwNCj4gPiA+IGJlIFdDDQo+
ID4gPiBhbmQgZm9yIHRoZSByZXN0IHVzZXJzcGFjZSBjYW4gY2hvb3NlIFdCIG9yIFdDIHZpYQ0K
PiA+ID4gZHJtX3hlX2dlbV9jcmVhdGUtPmNwdV9jYWNoaW5nLiAoVW5sZXNzIGRpc2NyZXRlLCB3
aGVuIFdCIGNhbm5vdA0KPiA+ID4gYmUNCj4gPiA+IHVzZWQNCj4gPiA+IGF0IGFsbC4pDQo+ID4g
PiANCj4gPiA+IEFGQUlDVCBtaW5pZ2JtIGJhc2ljYWxseSBjYXJlcyBhYm91dCB0d28gdHJhbnNp
dGlvbiBwb2ludHMuIExldHMNCj4gPiA+IGNhbGwNCj4gPiA+IHRoZW0gQ1BVIGFjY2VzcyBiZWdp
biBhbmQgZW5kLg0KPiA+ID4gDQo+ID4gPiAxKQ0KPiA+ID4gV2hlbiBhIGJvIGlzIG1tYXBwZWQg
aXQgd2FudHMgdG8gaW52YWxpZGF0ZSB0aGUgY2FjaGUsIHdoaWNoDQo+ID4gPiBsb29rcyB0bw0K
PiA+ID4gYmUNCj4gPiA+IGFib3V0IG1ha2luZyBzdXJlIGFsbCBHUFUgd3JpdGVzIGhhdmUgbGFu
ZGVkIHRvIHRoZSBiYWNraW5nDQo+ID4gPiBzdG9yZS4gSW4NCj4gPiA+IHRoZSBpOTE1IHdvcmxk
IHRoYXQgdHJhbnNsYXRlcyB0byB0aGUgc2V0X2RvbWFpbiBpb2N0bC4NCj4gPiA+IA0KPiA+ID4g
V2hhdCBpcyB0aGUgdWFwaSBmb3IgdGhpcyB3aXRoIHhlLCBvciBpdCBpcyBzb21laG93IGd1YXJh
bnRlZWQgdG8NCj4gPiA+IG5vdA0KPiA+ID4gYmUNCj4gPiA+IG5lZWRlZD8NCj4gPiANCj4gPiBT
aWduYWxsaW5nIGEgdXNlci1mZW5jZSBvciBkbWEtZmVuY2Ugb2J0YWluZWQgYXMgYW4gb3V0LWZl
bmNlIGZyb20NCj4gPiBhbg0KPiA+IGV4ZWMgY2FsbCB3aWxsIGd1YXJhbnRlZSBHUFUgY2FjaGVz
IGFyZSBmbHVzaGVkLiBDdXJyZW50bHkgSSBkb24ndA0KPiA+IHRoaW5rIHRoZXJlIGlzIGFueXRo
aW5nIGxpa2UgZ2VtIHdhaXQgaW4gdGhlIHVBUEksIGFsdGhvdWdoIE1hdHQgaXMNCj4gPiBqdXN0
IGFib3V0IHRvIGFkZCBmdW5jdGlvbmFsaXR5IHRvIHdhaXQgb24gYWxsIG91dHN0YW5kaW5nIHdv
cmsgb24NCj4gPiBhbg0KPiA+IGV4ZWNfcXVldWUuDQo+IA0KPiBQcm9ibGVtIEkgc2VlIGlzIHRo
ZXJlIGFyZSBubyBleGVjcyBvciB0aGVyZWZvcmUgZmVuY2VzIGluIHRoZQ0KPiBtaW5pZ2JtIA0K
PiBBQkkuIEl0J3MganVzdCBidWZmZXJzLCBjcmVhdGVkIG9yIGltcG9ydGVkLCBDUFUgYWNjZXNz
IGFuZCBzb21lDQo+IG90aGVyIA0KPiBzdHVmZi4NCj4gDQo+IEFuZCBpdCBpcyBxdWl0ZSBleHRl
bnNpdmVseSB1c2VkIGluIHRoZSBPUyBzbyBJIGFzc3VtZSBpdCBoYXMgdG8gd29yaw0KPiAoSSAN
Cj4gbWVhbiB0aGUgaW52YWxpZGF0aW9uL2ZsdXNoaW5nIHdhcyBub3QgcHV0IGluIHRoZXJlIGZv
ciBubyByZWFzb24pLA0KPiBpbiANCj4gb3RoZXIgd29yZHMsIHdoZXJlIHRoZSBpOTE1IGJhY2tl
bmQgdG9kYXkgZG9lcw0KPiBEUk1fSTkxNV9HRU1fU0VUX0RPTUFJTiANCj4gb24gImNwdSBhY2Nl
c3MgYmVnaW4iLCB3aGljaCBpcyBidWZmZXIgYmFzZWQsIEkgYW0gbm90IGNsZWFyIGhvdyB0byAN
Cj4gaW1wbGVtZW50IHRoYXQgd2l0aCB4ZS4NCj4gDQo+IEZvciB0aGUgb3V0c3RhbmRpbmcgd29y
ayB5b3UgbWVudGlvbiwgc2luY2UgeW91IHNheSBpdCBpcyBhYm91dCANCj4gZXhlY19xdWV1ZSwg
SSBhc3N1bWUgYWdhaW4gaXQgd2lsbCBub3Qgd29yayBwdXJlbHkgd2l0aCBidWZmZXJzPyBJZg0K
PiBzbyANCj4gaXQgcHJvYmFibHkgd29uJ3QgYmUgdXNlZnVsIGZvciBtaW5pZ2JtLg0KPiANCj4g
QWxzbyBpZiBJIGxvb2sgYXQgYWxsIHRoZSBvdGhlciBtaW5pZ2JtIGJhY2tlbmRzLCBJIHNlZSBh
IG1peCBvZg0KPiBiZWhhdmlvdXJzOg0KPiANCj4gwqAgKiBtc20gYW5kIHZjNCBhcHBlYXIgdG8g
bm90IGNvbmNlcm4gdGhlbXNlbHZlcyB3aXRoIGFueSBvZiB0aGlzLg0KPiANCj4gwqAgKiByb2Nr
Y2hpcCBhcHBlYXJzIHRvIGJlIGRvaW5nIGZ1bGwgYm91bmNlIGJ1ZmZlcmluZyB2aWEgbWVtY3B5
IG9uDQo+IENQVSANCj4gYWNjZXNzIGJlZ2luL2VuZC4NCj4gDQo+IMKgICogaTkxNSBhbmQgYW1k
Z3B1IHJlc3BlY3RpdmVseSB1c2UgDQo+IERSTV9JOTE1X0dFTV9TRVRfRE9NQUlOL0RSTV9BTURH
UFVfR0VNX1dBSVRfSURMRSAoYWxzbyBidWZmZXIgYmFzZWQsDQo+IG5vdCANCj4gZXhlY3V0aW9u
IHF1ZXVlKS4gQW5kZ3B1IGN1cmlvdXNseSBkb2VzIG5vdCBkbyBhbnkgZmx1c2hpbmcgb24gQ1BV
IA0KPiBhY2Nlc3MgZW5kLg0KPiANCj4gRGlnZ2luZyBpbnRvIGdpdCBoaXN0b3J5LCBib3RoIERS
TV9JOTE1X0dFTV9TRVRfRE9NQUlOIG9uIENQVSBhY2Nlc3MgDQo+IGJlZ2luIGFuZCBjbGZsdXNo
aW5nIG9uIGVuZCB3ZXJlIGFkZGVkIHRvIGZpeCB2YXJpb3VzIENUUyB0ZXN0DQo+IGZhaWx1cmVz
LiANCj4gU28gSSBndWVzcyB3ZSBjb3VsZCBhbHNvIHdhaXQgYW5kIHNlZSB3aGF0IGhhcHBlbnMg
dGhlcmUuIElmIHRob3NlIG9yDQo+IHNvbWUgd2lsbCBiZSBmYWlsaW5nIHdpdGggeGUgdG9vIHRo
ZW4gcHJvcG9zZSBhZGRpbmcgc29tZSBuZXcgdWFwaS4NCj4gT3IgDQo+IGlmIG1hbnVhbCB0ZXN0
aW5nIHdpbGwgc3RhcnQgcmVwb3J0aW5nIHZpc3VhbCBjb3JydXB0aW9uIGluIHRoZSBVSSANCj4g
ZWxlbWVudHMgb3Igc3VjaC4NCg0KSW5kZWVkIGl0IHNvdW5kcyBsaWtlIHdlJ2QgbmVlZCBhIERS
TV9YRV9HRU1fV0FJVF9JRExFLCBzaW1pbGFyIHRvDQpBTURHUFUgZm9yIHRoaXMgdXNlLWNhc2Uu
IEknbGwgYnJpbmcgdGhhdCB1cCBmb3IgZGlzY3Vzc2lvbi4NCg0KPiANCj4gPiA+IDIpDQo+ID4g
PiBXaGVuIGEgYm8gaXMgdW5tYXBwZWQsIG9yIENQVSBhY2Nlc3MgZmluaXNoZWQsIGl0IHdhbnRz
IHRvIGZsdXNoDQo+ID4gPiB0aGUNCj4gPiA+IENQVQ0KPiA+ID4gY2FjaGVzLiBUaGF0IGlzIC9h
bG1vc3QvIGNvbXBsZXRlbHkgYSBDUFUgb3BlcmF0aW9uLCB3aGVyZSBpdA0KPiA+ID4ganVzdA0K
PiA+ID4gbmVlZHMNCj4gPiA+IHRvIGVpdGhlciBjbGZsdXNoIG9yIGludmFsaWRhdGUgdGhlIFdD
IGJ1ZmZlciByZXNwZWN0aXZlbHksIGlmDQo+ID4gPiBub3QNCj4gPiA+IHRoZQ0KPiA+ID4gZmFj
dCB0aGF0IGNsZmx1c2ggY2FuIGJlIHNraXBwZWQgb24gcGxhdGZvcm1zIHdpdGggTExDLg0KPiA+
ID4gDQo+ID4gPiBJIGRpZCBub3Qgc2VlIGFuIGVxdWl2YWxlbnQgb2YgYW4gSTkxNV9QQVJBTV9I
QVNfTExDIGluIHhlPyBEaWQgSQ0KPiA+ID4gbWlzcw0KPiA+ID4gaXQgb3Igd2hhdCBpdCBpcyB0
aGUgcGxhbiBmb3IgcXVlcnlpbmcgdGhpcyBkZXRhaWw/DQo+ID4gDQo+ID4gWGVLTUQgaXMgZ2Vu
ZXJhbGx5IGNvaGVyZW50LCBleGNlcHQgaWYgVU1EIHNlbGVjdHMgYSBHUFUgUEFUIGluZGV4DQo+
ID4gd2l0aA0KPiA+IGxpbWl0ZWQgY29oZXJlbmN5IHRvZ2V0aGVyIHdpdGggV0IgaW5zdGVhZCBv
ZiBXQyBtZW1vcnkuIEluIHRoYXQNCj4gPiBjYXNlLA0KPiA+IFVNRCBpcyByZXNwb25zaWJsZSBm
b3IgZG9pbmcgdGhlIG5lZWRlZCBDTEZMVVNILWluZywgd2hlcmVhcyBLTUQNCj4gPiBvbmx5DQo+
ID4gZW5zdXJlcyBpbml0aWFsIGNsZWFyaW5nIG9mIHRoZSBwYWdlcyBpcyBDTEZMVVNIRUQgZm9y
IHNlY3VyaXR5DQo+ID4gcmVhc29ucy4NCj4gPiANCj4gPiBJJ20gbm90IDEwMCUgc3VyZSBpZiBV
TUQgY2FuIGFjdHVhbGx5IHNlbGVjdCBXQiB3aXRoIGxpbWl0ZWQNCj4gPiBjb2hlcmVuY3kNCj4g
PiBQQVQgaW5kZXggaW4gdGhlIGluaXRpYWwgdUFQSSByZXZpc2lvbiwgYnV0IE1hdHRoZXcgaGFz
IHJlY2VpdmVkDQo+ID4gcmVxdWVzdHMgZm9yIHRoYXQgc28gYW55IGFkZGl0aW9uYWwgaW5wdXQg
aGVyZSBvbiBwZXJmb3JtYW5jZQ0KPiA+IGltcGxpY2F0aW9ucyBpcyBhcHByZWNpYXRlZC4NCj4g
PiANCj4gPiBUaGUgdGhpbmtpbmcgaGVyZSBpcyBvdGhlcndpc2UgdGhhdCBHUFUgUEFUIGluZGlj
ZXMgd2l0aCBsaW1pdGVkDQo+ID4gY29oZXJlbmN5IHNob3VsZCBiZSB1c2VkIHRvZ2V0aGVyIHdp
dGggV0MgbWVtb3J5IGluIHRoZSBzYW1lDQo+ID4gc2l0dWF0aW9ucw0KPiA+IGFzIFZSQU0vTE1F
TSBpcyB1c2VkIG9uIERHRlguDQo+IA0KPiBIbSBva2F5LCB0aGlzIHdvdWxkIGJlIHRoZSBWTSBC
SU5EIHNpZGUgb2YgdGhpbmdzIHdoaWNoIGRlYWxzIHdpdGgNCj4gR1BVIA0KPiBQQVRzLiBGcm9t
IHRoZSBDUFUgc2lkZSBpdCBpcyBqdXN0IENQVSBjYWNoaW5nIG1vZGVzIGltcGxpY2l0bHkNCj4g
c2VsZWN0ZWQgDQo+IHZpYSBEUk1fWEVfR0VNX0NQVV9DQUNISU5HX1dCL1dDLg0KPiANCj4gVGhl
IHF1ZXN0aW9uIGFib3V0IHRoZSBhbmFsb2d1ZSBvZiBJOTE1X1BBUkFNX0hBU19MTEMgd2FzIEFG
QUlVIGFib3V0DQo+IGEgDQo+IHBlcmZvcm1hbmNlIG9wdGltaXNhdGlvbiB3aGVyZSBVTUQgaXMg
ZGVjaWRpbmcgd2hldGhlciBpdCBpcyBva2F5IHRvIA0KPiBza2lwIGlzc3VpbmcgY2xmbHVzaCBm
b3IgdGhlIG1hcHBlZCBibyBpZiBEUk1fWEVfR0VNX0NQVV9DQUNISU5HX1dCDQo+IHdhcyANCj4g
dXNlZC4gKElmIERSTV9YRV9HRU1fQ1BVX0NBQ0hJTkdfV0Mgd2FzIHVzZWQgaXQgb2J2aW91c2x5
IG9ubHkgbmVlZHMNCj4gdG8gDQo+IGZsdXNoIHRoZSB3cml0ZSBjb21iaW5lIGJ1ZmZlci4pDQo+
IA0KPiBMb29raW5nIGF0IHdoYXQgTWVzYSBpcyBkb2luZyBpdCBhcHBlYXJzIGl0IGlzIG5vdCB1
c2luZyANCj4gSTkxNV9QQVJBTV9IQVNfTExDIGJ1dCBoYXMgaXRzIG93biBkZXZpY2UgaW5mbyB0
YWJsZXMuIFNvIEkgZ3Vlc3MgDQo+IG1pbmlnYm0geGUgYmFja2VuZCB3aWxsIGhhdmUgdG8gZG8g
dGhlIHNhbWUgaWYgeGUgd2lsbCBub3QgcHJvdmlkZQ0KPiB0aGUgDQo+IGFuYWxvZ3VlIHF1ZXJ5
Lg0KDQpJTU8gY2xmbHVzaGluZyBpbiB0aGlzIGNhc2Ugc2hvdWxkIG5ldmVyIGJlIG5lZWRlZCwg
KEFnYWluLCBzaW1pbGFyIHRvDQpBTUQpLiBXaGF0ZXZlciByZW5kZXJzIGZyb20gLyB0byB0aG9z
ZSBidWZmZXJzIHNob3VsZCBtYWtlIHN1cmUgdGhleQ0KYXJlIGNsZmx1c2hlZCBiZWZvcmUgb3Ig
d2hpbGUgYWNjZXNzaW5nIHRoZW0uIEhvdyBpcyBhIHJlbmRlcmluZyBBUEkNCm1hZGUgYXdhcmUg
b2YgdGhlc2UgYm9zPyBBcmUgdGhleSBpbXBvcnRlZCB1c2luZyBkcm0gcHJpbWU/DQoNCi9UaG9t
YXMNCg0KDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gVHZydGtvDQoNCg==
