Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A681EDE980
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 05:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A494810E251;
	Thu, 14 Sep 2023 05:40:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775ED10E251
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 05:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694670055; x=1726206055;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Eqs+4Uv7fVqPiSMlFfOnxQNmzj5YQoP7F5yyM7XmGdU=;
 b=eb75ZsQB4ZRGOsBYqwTYhOAPjl3B3mf5fzh9zNe4E2DpIuFdGo+MG4FX
 Ewe7WKGp1zLximHJjtWHpGuy6xcb45QdKGAkL1M3ZK3isRhJhrKPgNf4k
 fVcy9dsmCTIpFAmwXsHzga/e5/5/zxuwKJ8A/b1pZuK+oJjUz4yM3IiQH
 gtTfeqqWIcLe1hTp7ZmNtFCFBigplCn9o8OHMkroxVO3m6SwFQUB7S5p/
 TN+idvrs9Nc80viX/oa2oNRchNCWmpT2k2evdTSLwfzbTVCg9SKfSIi62
 hsm2JQNfW0B3wlmS6HFH5VjX1Azjfh1Wob0Hra1RBEtcrO5fISVHknnNu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="465230755"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="465230755"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 22:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779494755"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="779494755"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 22:40:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 22:40:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 22:40:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 22:40:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 22:40:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcA00Z9G6vEm5ONg7sD3ZZ5fYnHJOA2CgVx2fiND0K6rfVLrX3vUCfsE3R3a1kStcUd2ann9jREdVprs2L1Tshhl8yhNRwnKvgXqWenphwbPAeGjFOZY+sfuEu+Me2nZ1RRpROi/FYEpxDWcss+qCg8xFiUmJTnlV9m196YKTh9y1/fHr/+TMV27hGA8izXsvqVlQ8Xae8W/O9XzArq2OGE4ro0k0dpWpyKmaQbv77LsJ6U3Nlk1sGu4tR3R5xdUnZZo/j7shc1rHEaN0BMIWPuUnF0Vjqxxb7xfz6ng3kBKncXHKObLVkrawt7dkjyd0CD88xk9UrwS0vR1CHo4JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eqs+4Uv7fVqPiSMlFfOnxQNmzj5YQoP7F5yyM7XmGdU=;
 b=CXZy61+2dDjJ5AbNuJGMw313pTa84OUBh8jx1nojC4cpFu4TD+T6Ifgia/ivogic2nf+b8lhvIGEX6ghb98mHJzykMbt2FA0KMTe17IUZhEfOvZFRghKGtt+hbD/SLTFGQjJMfZGhYM507vqtDmKPcL0xotrRP1Ua1ylMfdHl9VZfhmnPrv4W2yM1Qp201bYScttN2ExWqIPkagn9nZ67tl+8G6DcZRN7gcCAAbeFuRphn1g4q4yCwdhIPnJ1b3nrI5du3PaGcTwLvnygKWLsTp4Yv560TPMxdo3vpLLD/ARBUs3mFY2a55dlCyR+EmjHBAZhqYIoKdk7h0xUEFLRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH0PR11MB5126.namprd11.prod.outlook.com (2603:10b6:510:3a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20; Thu, 14 Sep 2023 05:40:50 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 05:40:49 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [PATCH v2 0/5] FBC refactoring
Thread-Index: AQHZ2/DZTBExULNRvEiXvcZdDJMfobAXctEAgAJxQoA=
Date: Thu, 14 Sep 2023 05:40:49 +0000
Message-ID: <e13379685190d845b556d0c4509731ec0212c6e3.camel@intel.com>
References: <20230831095154.3121578-1-jouni.hogander@intel.com>
 <4a223d04-6578-9ebb-59b4-92e8bbf955b5@linux.intel.com>
In-Reply-To: <4a223d04-6578-9ebb-59b4-92e8bbf955b5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH0PR11MB5126:EE_
x-ms-office365-filtering-correlation-id: d1f8a123-abf9-4a60-ed89-08dbb4e526d6
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 13ZxilVZx/QJUjdWceYsbxZl4nak6F9kah9QncTCPbPUX4J+oCy+U4PJnTq9oOW44NVz+X2d4HTmk47CIMakGn6OXbdmQJxdVm48MzF/075wLsXJyypbtu9SBVLkZoElQbvbL1Hf/9acYVKtoeMEnHpz+pGdadbyO2CgfF4/k4KpSs+9/1QXo0uobUIyxhfiPCLztSdZR4Vo49gdh1mANtq6EwUFg6pQMjrIv0I51xM7h64lf/NjCPMZh/slyGMNrIjCKS612PS6uRrhjM1GwDKzbQqT5LCQyYmu7HMoVTAKMulzV9dyiy58s5hua5fnUyLOty9LVWhy2Zpz/NEcuRvdB7bficSRgAiDzEkSsn9DpshCRb7SDR3lJjE5/VYkSdbgqXuciYdXeAEhYqyNeve+BC2xvO3ImO+5mmhSxcRtI+QZANk4XmfYUKB769kK5QZXITJouMvKg/wLxuvoG2wyy8Di3Tl3yQ6LHhMCQqArx81PV2hVWiNLS7dXJ6G7zlG+upvYiFSwmxKR0k5UeL8jURYi2VP9oZ9CjZKHeFCQR0DitRlBMHb4lEq/ZWT2YV1RSLrgXN1bEC5SOBU/NkL0PO7uwYCWZlJNqCqDVcGRxBdpcznjk6qInrBi4jih
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199024)(186009)(1800799009)(5660300002)(122000001)(38070700005)(71200400001)(38100700002)(2906002)(478600001)(4326008)(8936002)(8676002)(110136005)(41300700001)(316002)(54906003)(76116006)(66446008)(66556008)(91956017)(64756008)(66476007)(66946007)(83380400001)(2616005)(26005)(36756003)(6506007)(6486002)(6512007)(53546011)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFcxdzJtdHNQZWxPNlh2eUNZVTVWZzVva0oxcHRwbnZ6VHBGa0Q2YUZJZkVp?=
 =?utf-8?B?ME8yWGlSVi9vS0pXWFlUUU02ME8xV0Q5N2w2MmdjSWF6NlBrUDVrTFpvb0Fp?=
 =?utf-8?B?UFg1TEkvWVBlQ3hKdGl1K1BkY21xajh4WEJZUWlBeUhKQ24yNkZvLzBaTVhz?=
 =?utf-8?B?aEV6eGdDb0RwVERFc0o0dDQ3QW5vMEkrOTNralh3cHBEWHhVcVM4MGJWWk00?=
 =?utf-8?B?SWs5MG0xN1hyWmxJYStNSGd5bUdoWHhHNmpWTmR2UEFYemx1MVc2Z3JDZURq?=
 =?utf-8?B?cTdvK3VyWjhWRG5JSTNsOUNnN0dyYzhodWhXUXJZMXF5UUNqYVpPYVJEdEoz?=
 =?utf-8?B?cW1FSlEraXE0QTVBdnQ4S0lFVHVNNlh2ZmNHRkc0dWo4anJPRjJyNTEzNWc3?=
 =?utf-8?B?M2ovVjIxcWdQckhPQyt0dFJiTjJKY3VlSmFYMEV6by9Pb09jMUR3ZmJabW11?=
 =?utf-8?B?dTBRU1FZYllYaUY0c0RxcGtzRWxTNmVIOXF3UUtiaU9VbW1acjF3TjA5QTlq?=
 =?utf-8?B?QUMyYlhRRUxvNzJlais3bWQ2V01yUHJhditkUllhRm5FVU5TL1FhMlRTOHEz?=
 =?utf-8?B?SlRMY0ljSXczV29DTGw4amh6S2ZPNE5kV3RiQnFPbmVXMm1rTFl5SGtmMmVz?=
 =?utf-8?B?elZyNkRpZkZGa2pZWWVEWkxHTm5WTGQ5M09haTlUUUlWSXVJbkZkSldTWVlp?=
 =?utf-8?B?Umxpa0J4cW53Z08vZzJ2eXdpZGdEZFp5MGJHd2JHeFdWc2RMLzl1RXhSaTcy?=
 =?utf-8?B?b2szR0tuL1d4Vm5nWW5PcnhFY0o4Slc5U2Fzb01iL2RzVlpQdWJKUWxnT2xl?=
 =?utf-8?B?cm9KVkhLVFhkN2xNQ0R4cURkRjh4Rk9MV0NCZkJlRm9uWGtBN1pzSEdSZzJy?=
 =?utf-8?B?UnBSVGZVTGYwV3Baa2NOTnZuZE1weWdDdG9IOEZCY2Y2anBLREpyUDI2YkNK?=
 =?utf-8?B?MFRKYUNPMWtZQWUzVERmeWt2dVdvRWoxWDdNZHNCNms5RWN3eEwyNUoxN1hZ?=
 =?utf-8?B?R05NQzlHSWZFYTZQNE5EVkdOK0p2YjIwQVVuTC81V0NZOHBaZWVLUTZMRldJ?=
 =?utf-8?B?ajBmQnhKOWdaeFl4SEh2ZjI1NWFCNis2Zm55eithNUpLUk5uN0syMzJUWWl6?=
 =?utf-8?B?eFhyRVdMdEZ6RHNuaWFZVDBVV3oyRlNacmlsK05NQnpoZ0Z6R2llTmxteWs2?=
 =?utf-8?B?ZC9FWGcrUjdvMUEzWklUb2U1akVxcGR5VHVlc1BxVkFSdytPWHRYZC9uODJo?=
 =?utf-8?B?OFFJeXlzeUFjZm9HOWlkOUZhaXIyTFBUNWRnOWVRV3hMNXc0T2pJczZtcGY0?=
 =?utf-8?B?MmFuY0I4VXVPcGxEaFlhQytxME5NL050OERhYkxTZ0NoWWJLaFd1cnR6akk0?=
 =?utf-8?B?bW90Z2l4VldtbW1GbFBLQitrdzNyNm5LeHZoc3F4dnhWZGNRUlViUTdqLzRp?=
 =?utf-8?B?UkpCUnpHM1FveU1SbGl4VzYwYWY5UzlwQmJDUzlpQW9hRFMvTERydmVGTXBG?=
 =?utf-8?B?blR5bGF6NkdMOElOYVAweHhZQ0NLQlVKenA1dzJSdllQQ0hnb3YycFlqcUtC?=
 =?utf-8?B?TkIzUDJiUTFMZnBBSmUwQmJsczkrRWdjamJuZE80TGF3MFU3Mkl1Q2RaN2Fp?=
 =?utf-8?B?REw5aWFDSTh4SUluSzlSU3d2aGNGRHBYYTcxaGdSS2tLM0FaTlQ5MUNKbWxP?=
 =?utf-8?B?VFRuWkNMcWE3SnRMNzdnZVc0Ymo2dXZRRUhyK1ZpblpYQTdYUnVVa2MzYzk3?=
 =?utf-8?B?b2w0WHhUNy9iMnNjUjhybllQOG9yYWxLOFBYcUNIY2FpUG5Sc1p4NDRlNGZZ?=
 =?utf-8?B?TjdjNjl3ZzNUa0NpS3RybzRxSFVWSVJCQlZQRjZUTnpJYzJvaEE0djhzUFhj?=
 =?utf-8?B?MTlIdUFQZWU0QzdNV0llV2V4aERrWnh3cEtWS2ZMTlJLdVlzekNqTEV1Umxh?=
 =?utf-8?B?SFJJUVJKVnFHelNVQjErOGROWVR1cU0yOHBuWjBhc0xpRlV6cXpjQ2FBVCt6?=
 =?utf-8?B?T1FiOG52eFduZUFJMGRlY1MwZ0k4Wk55SXlSUTRlblovTHovb3JDZHE4VHhs?=
 =?utf-8?B?cmQ2S0NaeFlNb1RvNzZSKzhqV3hxVzZwRW1HNmgzakdLU1hrc2NNZXZ1RXgz?=
 =?utf-8?B?L0ttaFNMaGphVmY0cWZGYUl4SlJLL0F0c0xFdENCMDIyWmpubW51RHRPZU5L?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CDE9D2D8406D04B84517CD9B75A5BFC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f8a123-abf9-4a60-ed89-08dbb4e526d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 05:40:49.5181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2s4I7SF0yuatEF0PnNVVKwr/gbLUvtTRe1cuzCw8/glj22HHiZQ9c0Dz6OiDH38cF7EC1eLKN8zsUU/FHYe7r9ZEyFxdA9sFtrnWY7sTdsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5126
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/5] FBC refactoring
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTEyIGF0IDE4OjIyICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+DQoNClRoYW5rIHlvdSBNYWFydGVuIGZvciB0aGUgcmV2aWV3LiBUaGVz
ZSBhcmUgbm93IG1lcmdlZC4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KPiANCj4gT24gMjAy
My0wOC0zMSAxMTo1MSwgSm91bmkgSMO2Z2FuZGVyIHdyb3RlOg0KPiA+IFRoZXNlIHBhdGNoZXMg
YXJlIGNsZWFuaW5nIHVwIGFsbCAjaWZkZWZzIGFkZGVkIGludG8gaW50ZWxfZmJjLmMNCj4gPiBm
b3INCj4gPiBYZSBidWlsZC7CoCBJOTE1IHBhcnQgb2YgdGhlIHJlZmFjdG9yaW5nIGlzIGFscmVh
ZHkgbWVyZ2VkIGludG8gZHJtLQ0KPiA+IHRpcA0KPiA+IGFuZCB0aGVzZSBwYXRjaGVzIGFyZSBp
bXBsZW1lbnRpbmcgaW50ZXJmYWNlcyBvciBhZGRpbmcgZW1wdHkNCj4gPiBkZWZpbmVzDQo+ID4g
Zm9yIFhlLg0KPiA+IA0KPiA+IHYyOiBBZGQgcGFyZW50aGVzaXMgYXJvdW5kIHBhcmFtZXRlciBp
bg0KPiA+IGk5MTVfZ2VtX3N0b2xlbl9ub2RlX2FsbG9jYXRlZA0KPiA+IA0KPiA+IENjOiBNYWFy
dGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiA+IENj
OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiA+IENj
OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KPiA+IENjOiBKYW5pIE5pa3Vs
YSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiA+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28u
dml2aUBpbnRlbC5jb20+DQo+ID4gDQo+ID4gSm91bmkgSMO2Z2FuZGVyICg1KToNCj4gPiDCoMKg
IFJldmVydCAiZHJtL2k5MTUvZGlzcGxheTogSW1wbGVtZW50IEZCQyBzdXBwb3J0Ig0KPiA+IMKg
wqAgZml4dXAhIGRybS9pOTE1L2Rpc3BsYXk6IFJlbWFpbmluZyBjaGFuZ2VzIHRvIG1ha2UgeGUg
Y29tcGlsZQ0KPiA+IMKgwqAgZHJtL3hlOiBYZSBzdG9sZW4gbWVtb3J5IGhhbmRsaW5nIGZvciBm
YmMgc3VwcG9ydA0KPiA+IMKgwqAgZHJtL3hlOiBBZGQgaTkxNV9nZW0uaCBjb21wYXRpYmlsaXR5
IGhlYWRlcg0KPiA+IMKgwqAgZHJtL3hlOiBBZGQgWGUgaW1wbGVtZW50YXRpb24gZm9yIGZlbmNl
IGNoZWNrcyB1c2VkIGJ5IGZiYyBjb2RlDQo+ID4gDQo+ID4gwqAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9mYmMuY8KgwqDCoMKgwqAgfCAxMDEgKysrLS0tLS0tLS0tLQ0KPiA+
IC0tLS0tDQo+ID4gwqAgLi4uL2dwdS9kcm0veGUvY29tcGF0LWk5MTUtaGVhZGVycy9pOTE1X2Ry
di5oIHzCoMKgIDMgKw0KPiA+IMKgIC4uLi9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMv
aTkxNV9nZW0uaCB8wqDCoCA5ICsrDQo+ID4gwqAgLi4uL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMv
aTkxNV9nZW1fc3RvbGVuLmjCoCB8wqAgNzkNCj4gPiArKysrKysrKysrKysrKw0KPiA+IMKgIC4u
Li9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaTkxNV92bWEuaCB8wqDCoCAxICsNCj4g
PiDCoCAuLi4veGUvY29tcGF0LWk5MTUtaGVhZGVycy9pbnRlbF9ndF90eXBlcy5owqDCoCB8wqAg
MTEgKysNCj4gPiDCoCA2IGZpbGVzIGNoYW5nZWQsIDExNSBpbnNlcnRpb25zKCspLCA4OSBkZWxl
dGlvbnMoLSkNCj4gPiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL2Nv
bXBhdC1pOTE1LQ0KPiA+IGhlYWRlcnMvaTkxNV9nZW0uaA0KPiA+IMKgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0veGUvY29tcGF0LWk5MTUtDQo+ID4gaGVhZGVycy9pOTE1X2dl
bV9zdG9sZW4uaA0KPiA+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUv
Y29tcGF0LWk5MTUtDQo+ID4gaGVhZGVycy9pbnRlbF9ndF90eXBlcy5oDQo+ID4gDQoNCg==
