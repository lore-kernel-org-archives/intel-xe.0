Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B5AC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 12:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B413E10E106;
	Fri, 10 Nov 2023 12:02:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF3910E106
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 12:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699617728; x=1731153728;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=yU7KPgF7Gs6Vnxdc6LVramyn8BKOT5hrmPdKGaLVO6M=;
 b=aoL/BDJDHLFpKAGbSX+3txz1dsBUdFiIYyJWPBpB2ulFG37G7uHJQ2o7
 mq0LfUTv2+RvPqUwcWbJX1NQ/801wXtps8ZIHT4XVqGmOvGE4Itf1BTHD
 uiuMEKnRthKE4BDgeaK7iB0a3xePlWQVzVL+e3ArctViKrNCRa2oM2D+j
 2bPktVyoC+44sJj0+aRFOO+ql0MVyOJA0Wk6O/RvPby/XQFTRIEXKxuaQ
 EbkYYhvTA+JKLWjIs6R1/LYWC/L9C9Y4onPMAI14WPW8l4YZXVQdTRXkk
 bEugkXKYc9C70cMDpiL08p3+GGAbK6i1Rth6DEV/yGtk/T9E8UVnmUJJe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11723345"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="11723345"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 04:02:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="1010936730"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="1010936730"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Nov 2023 04:02:07 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 04:02:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 04:02:07 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 10 Nov 2023 04:02:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrVtEfXws0M8SotixcjUkYfjdhMmylT/AUm+7nOn4lQQ/xuWNepeCOecxjycWeQDUe0b58PAvvvrQNwMTuX+W0NkPkI56XPw8V1aMHKJ7Knxh/bQ78zfW79V54ytT83H+cdpCbTmvk3cAAUXLLTt1gv5PaOsWvck+5GXUVMHfP/w/R+N5gudZXnk2j2oDEVwd7j5yRZ8ALXjunKcgf+eYppznTJkVWudeODjIBE2ojeXgAs973uosYqrcMvmTgE2Hn6ScF/1c9iI0vNYZHjfA4mAM7SLJyrBJQ6QZyPWJfyhb8gPVSqqqZ7MAwQaVnXtgVwk2qKSj/nhT+PTcJv+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yU7KPgF7Gs6Vnxdc6LVramyn8BKOT5hrmPdKGaLVO6M=;
 b=T0O3P/hQX7LQtb5Rie2ll3PUXfTM2T5g1qa7v4N3uuL4q2WxvBN0uT8ZTpIedtQ3BAZ93QL10qCnDDzxA0iHeANVuYvVSr80kVpJdu8RhTKvM9+iUZ3lmHPkWlAoEh/jb9xNG9jMTT2zzmMbHvW8av7E8Rq5b8igaEgwynVO1wOeiMbBNibo6pdt2Zqf25OycNPUBSMp9wq5dQ2x26rbHteZ3KRSFo5kqAnU2+g5bsJizzZYOu7In4O+CRXqkVrdyKbyMRqResr7kt+5Wq7BsWjH9bBgOP1I94fi5bM1kvtisJnziAECRBnFKa4c39irt64L6tgIxUaJ9bEWR9EFtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CO1PR11MB5121.namprd11.prod.outlook.com (2603:10b6:303:98::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.18; Fri, 10 Nov 2023 12:02:03 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:02:03 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [7/9] drm/i915/display: Use i915_gem_object_get_dma_address to
 get dma address
Thread-Index: AQHaE823+/u6wbd1rkyHAAxC2xO8SA==
Date: Fri, 10 Nov 2023 12:02:03 +0000
Message-ID: <dd21be9151be1b1b6fae57812866fd8a07d9c1fe.camel@intel.com>
References: <20231109150759.44549-8-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231109150759.44549-8-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CO1PR11MB5121:EE_
x-ms-office365-filtering-correlation-id: 875a0f64-bcaa-4576-f058-08dbe1e4da71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xYQO9CozmlQIcHf+nRM7NG75K+Ak6QZjgLyNckYEED27/4HvmiNdgX8M21Cq9QU8c24DFTtJUgFnQleOW4z6A+yow8ao7+JNeXwNY1xrpnzZX6s108pgCPzAVXFx2mYVA9RM/hQvz66DXhNKwee9FZHN3lY5LN5ga81QovmZhp6NgGmGqO12KfABiIReLU7UO4CtZOqEswC9dOD3CAOt327rgO9iz42SMR8Pjqn2QKfQjJxW8OiCDPK2oZzEYoaFBtbP+y+s+uXpCVOaJCeNWYrXCe941Cknr+5/KMGwIB68gsmp/oTGEH4NDpEQvxslyTX3QbIsLGTEQ4LYxLTGxKu4hgzFf9uIwWm3gUJT4epaxLnn5M7Qj6BZHjM0GnzIuF7rlI/OP8N02qE5vuB07ciHO9t1Yn8KPBEuBB5OaMdYRX0siaJK6n4unCwZ/7v2usJSBLC6JnwmJjItGtWC7zJpZl0bu0F41XOu7yaCOu69ZmRNflhDogbOWD9mBhMABOb/LMI6AzqUvjh1o+qw6QAAQ6BTf/59Reno5uADYxP+HXLDBqUQ4If/RqHbO3CxW7dQiGhkOVyR91eC0tv+81iHzgBvGhndJsSplRJEyUQD2xSOYry7KTQf2MNqvCrt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(8676002)(8936002)(38100700002)(6512007)(2906002)(6486002)(36756003)(66446008)(316002)(64756008)(86362001)(41300700001)(5660300002)(122000001)(66946007)(66556008)(91956017)(110136005)(38070700009)(76116006)(83380400001)(26005)(66476007)(2616005)(82960400001)(71200400001)(6506007)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjNuWWdwelpVVDBMOXBLZlJRSmU5QkpPNHBwbEJ1UXR4RkZWeDNUUnAxRExG?=
 =?utf-8?B?VFRhck9lVm95U2RqQUV1YzVHOEd3bUkyQk42Z1hMU2hEQ0RQR0NYd1NXdDVt?=
 =?utf-8?B?QTlMUmgydzNGb1V5NTB4QXJ3MkoxcEZ3R1NjSFNLalQ1YllySzFPeVR3NjJp?=
 =?utf-8?B?Nk5ONFhVNERxMHhuaTgvVkdqL1F1QktENmVYbTNUNU5jV1QrYkYyKzZZa3lG?=
 =?utf-8?B?dUpyNHh0SjI1b0RjLzcya05VMXliMmE3ZVNQZjNRRGpER3lDR09MMTB3cWs2?=
 =?utf-8?B?SnJiMWcxbkpZWkwwM1UxM0JkZUpTT1hqd3VGTDBabzYvcEw3NmZSSUhJeHVD?=
 =?utf-8?B?Y3NmeEJ0N2QvSXpIVk5IMkFDdW5ZYncwUFd2S1RMTCtjUTJaTFpnTkVqMHJx?=
 =?utf-8?B?TWNnajFIMjdmcFg3QkFyT0lMeWZWa0hIYzBXN1hycEhHSVZxYitpa1FCZHNj?=
 =?utf-8?B?M0ZCRHV3cSs1R2ovSllGR0h3S2FkWCtDLzZiV2l0enIrc21CNmZpb2hrdmVM?=
 =?utf-8?B?aGdqdHdYVzczU09acjkwbGk1K1htSGVzMy8zSUNoUGFydld1NjJzb3JWTldB?=
 =?utf-8?B?K0FWdHR1bmdPb1hpdlI5UExBcStaT1BUNmlBSldHQnE5Vm84NFhyUlE5cWFh?=
 =?utf-8?B?azBUdHc5dHRPemxUbThrOUdybTFoVGJ4ZzJEeUJRdkRKWmxnWFdrWVNiL2VZ?=
 =?utf-8?B?bzRwRWhTMzhKUHRFVGFjSHpmRkJyVldwdXZ3RnpEU3pTbFZZYkFsbkM0Mk5u?=
 =?utf-8?B?dkdwSW52YzQ4ZE5ZQzB0R2NySDhibDNWbkVGNTd3Nyt6blRJby93L2pIL1Q2?=
 =?utf-8?B?aklGd3g1THpqY2ZMZGhQRC9qc0tLSGh6K3lOZG1acUIxcGpaWUgzcjFPR091?=
 =?utf-8?B?dFJsU3ZmamZ4QmhBOW81TE9WUGRHL0ROek10WW5HaWFlR2VJNE9QT1NsOVpF?=
 =?utf-8?B?bWdlZWYrWEIzZUpMeEJKZCtpUHZUTVdGZXcwS3k1ZHFlSXA3TkVMSjNxdDFY?=
 =?utf-8?B?U3czWGVuVFllWXVJdFJia3N2WCtqeDcra013UVZmN2YzMXFoYzUvZkFTelE1?=
 =?utf-8?B?c2dobmJYWWVvSVI4cDQzV0VaV1FVM3dMVlNQYlY5cXc5MGRyazhiaGJDa3V5?=
 =?utf-8?B?cUZVK1ZRbW5SRFN1bEdXZ1Z2UzBsMzZVT2NUb1RJVU9VcnAwUDJSTksrUk1r?=
 =?utf-8?B?VDZpWUUydnVtZ0k1cDJkNVc4YlhmRGRLenZDWDhUajV6bFByOU9vNXMwMEtv?=
 =?utf-8?B?T090alVCdHcwTVRacWVnVmIxaEduQ2V0c3o1NTAzSTBpV0I5WWNhU0hkbjZl?=
 =?utf-8?B?R0FrQXlGcFVUcExtWmtVelMrMWlFSm56UnF1YTg2UzBXYmIrdmJ6TW1vVFpq?=
 =?utf-8?B?MmdaOVVSQ0ZIWDQzb1VqT0VBRG9pWTdFcE9vaWtzN2NTQS9XNWhhTzFvNFk5?=
 =?utf-8?B?UnNyclcwSWRERmdUVzJQZU1XOXZaMHlCTDI3a2szRW92Q3hNL1BtcGREaUsw?=
 =?utf-8?B?b1ZQemUvMjgzTnd1UkhHanR1MjJ3Z1pvelZyQzhuaVdtL3NUZG4xYnppQW41?=
 =?utf-8?B?NWhIdWRySkVObGYyVVFHS3lIbXl3VExqMnNqZUdOcElTVmFId0E4S1B1SjQx?=
 =?utf-8?B?c1RkQ2RjVkcrc3h6WTlVcmFCK0lFNjdsTnhTVkhPeXEzclkwQUU4WmlQNXkz?=
 =?utf-8?B?T3lBUithbTMwMTNWK2VDd2NCeGNYQUdTQW1rY3hyZGJhT294YzV5RHBtRDZv?=
 =?utf-8?B?K1hsM1JybjRNOUlIRjZJVDM1eUZMbUQ0ZTVxTVJQOThiSDBDT1YwVEUvaDE4?=
 =?utf-8?B?dUFrVzN2czFrZTNyTnJ0VDVodnNPd2UvWFkxRmwvNFhDa3M1bkdNYk9VR0la?=
 =?utf-8?B?dUZZcU1FZUlrUWQzUlBzYjkrS2VlVmxFTVFXK3ptY3V5Nmg2MFVwN2l4aE9W?=
 =?utf-8?B?VzdpZ21oZ2NqMzBoY0IvZVZNcG1Mdis3V1k2MFpnZGdISkx4TURsdklBNG1w?=
 =?utf-8?B?R2RjQmVjbnFGemp6N0xVQnd3YXhCSUVBUDM0TjVrR3orc1lidlEzNGYxcXZX?=
 =?utf-8?B?UzVhd1lzM0NTMnlMZXhFdFNFRC9mWG91QStQZG8xMUl1M3ZsQU1ydll2N0kz?=
 =?utf-8?B?dE9qeDAyaXRQQkVMTHljd21mNitFQzQwdDRUb0ZLWTMvQXNSWXUvQXkrN1h1?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4A2474C0375A04E92C2EB1CC580881F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 875a0f64-bcaa-4576-f058-08dbe1e4da71
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:02:03.6572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iHmLcuB1O1iShId/y48/f3CJWud2zUwgFRu9DyGwC7Pigr70Q8ph5mp4LAgYXzcYEeGFlSNmlpTldZRau5ftcVsN1E0+y5G8S9Z5htEnw5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5121
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [7/9] drm/i915/display: Use
 i915_gem_object_get_dma_address to get dma address
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

T24gVGh1LCAyMDIzLTExLTA5IGF0IDE2OjA3ICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gV29ya3MgYmV0dGVyIGZvciB4ZSBsaWtlIHRoYXQuIG9iaiBpcyBubyBsb25nZXIgY29u
c3QuDQoNClRoaXMgc2hvdWxkIGJlIHNlbnQgdG8gaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZy4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiAt
LS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N1cnNvci5jIHwgNiAr
KysrLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
Y3Vyc29yLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N1cnNvci5j
DQo+IGluZGV4IGIzNDJmYWQxODBjYTUuLjBkMjFjMzRmNzQ5OTAgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29yLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jdXJzb3IuYw0KPiBAQCAtMjMsNiArMjMsOCBA
QA0KPiDCoCNpbmNsdWRlICJpbnRlbF9wc3IuaCINCj4gwqAjaW5jbHVkZSAic2tsX3dhdGVybWFy
ay5oIg0KPiDCoA0KPiArI2luY2x1ZGUgImdlbS9pOTE1X2dlbV9vYmplY3QuaCINCj4gKw0KPiDC
oC8qIEN1cnNvciBmb3JtYXRzICovDQo+IMKgc3RhdGljIGNvbnN0IHUzMiBpbnRlbF9jdXJzb3Jf
Zm9ybWF0c1tdID0gew0KPiDCoMKgwqDCoMKgwqDCoMKgRFJNX0ZPUk1BVF9BUkdCODg4OCwNCj4g
QEAgLTMzLDExICszNSwxMSBAQCBzdGF0aWMgdTMyIGludGVsX2N1cnNvcl9iYXNlKGNvbnN0IHN0
cnVjdA0KPiBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpDQo+IMKgwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPQ0KPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHRvX2k5MTUocGxhbmVfc3RhdGUtPnVhcGkucGxhbmUtPmRldik7DQo+
IMKgwqDCoMKgwqDCoMKgwqBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IHBsYW5l
X3N0YXRlLT5ody5mYjsNCj4gLcKgwqDCoMKgwqDCoMKgY29uc3Qgc3RydWN0IGRybV9pOTE1X2dl
bV9vYmplY3QgKm9iaiA9IGludGVsX2ZiX29iaihmYik7DQo+ICvCoMKgwqDCoMKgwqDCoHN0cnVj
dCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmogPSBpbnRlbF9mYl9vYmooZmIpOw0KPiDCoMKgwqDC
oMKgwqDCoMKgdTMyIGJhc2U7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoRElTUExBWV9J
TkZPKGRldl9wcml2KS0+Y3Vyc29yX25lZWRzX3BoeXNpY2FsKQ0KPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgYmFzZSA9IHNnX2RtYV9hZGRyZXNzKG9iai0+bW0ucGFnZXMtPnNnbCk7
DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBiYXNlID0gaTkxNV9nZW1fb2JqZWN0
X2dldF9kbWFfYWRkcmVzcyhvYmosIDApOw0KPiDCoMKgwqDCoMKgwqDCoMKgZWxzZQ0KPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJhc2UgPSBpbnRlbF9wbGFuZV9nZ3R0X29mZnNl
dChwbGFuZV9zdGF0ZSk7DQo+IMKgDQoNCg==
