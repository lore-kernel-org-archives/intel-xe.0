Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7198BCE7A81
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 05:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5BB10E04F;
	Mon, 25 Sep 2023 05:39:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C54510E04F
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 05:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695620343; x=1727156343;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Zzhi/PRbp0Ff0sdXylMdN8P/lOfCFvI7QqawjgkxPOM=;
 b=cNGRe6IGdPxpN6Zao4MBa+CtguQCgLbCcLsJRCk8vTK9AijFZguQDhuf
 QZOlsou0pbKyI0U55K4LiTdTj/jQXxpZndOkKPYCXtf/pRvIkeF45o2Cf
 gULkjZPJMVtv8YNWsRv7w/S1rg3PkggiCz5kacerZprbcB65JaBtQoPzy
 JCyGu3Yz8bMSgFeFjhcvnnsT8sOz6/i/YFec2QCmmfPPRqPLA8D5VMH1A
 wdW48zSnijIzheSmX9HlEKgPEbNL19vBPsS5r3NzzWrW3fAge4VmaMKLO
 WRdgLAQTfwlFUPkpaUz7OhDF70BtEtzpT9MUIINPF3U7gBmO6YWPdEO7D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371489278"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="371489278"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2023 22:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="813800918"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="813800918"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2023 22:38:56 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 24 Sep 2023 22:38:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 24 Sep 2023 22:38:55 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 24 Sep 2023 22:38:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhIoHMnfioZEcZbWv7o33JVGhiXcrXIUMKXD9Mu7svIjxITWyJBpmrkGx19St+YRC0yk/fd65gt9mpidV+IyynCWU/ge9NFIRiVQMyGpafIJ8xtDH91hkojlWNUjsB9F0zkCs4p1RyIIw5pvSb+rPl9EeXUQeB/pyywcKE1DnS8QSab0GYxRprM5HuLBAYUUSC1wnRFjm9PHPl7OaVO60U6EJ6D4C+ZU339FGy5uNndtryHePHEiiZPL3F/4FVsLsefFWeY1CWc5zt6eTqmNRR32Q498nMcODJuFLxYcECwHoPSgf1g1AlABkVZJXFrAmffjKEB1OvgXe1nInr/nbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zzhi/PRbp0Ff0sdXylMdN8P/lOfCFvI7QqawjgkxPOM=;
 b=RobtQnW8Db8H6zvCOWTmsFbwVmoX5wLxHbpZx2BDQjVdstLz8Wm9i5F1vdXb+/aKwVaYJT1eFU0HOcPm49hSmQBFflukucMUsnMnLYBjFXSxY1EsxoJowL/oBruiRB9gvnHRt6gvMGcFreG2oRwzfS2Zr5owbVqFdQDTm1PHQaLaVivvW0knv20fQ5z8aeNUIL2F+XLJ/Ex0pcEtM4jw6mQl5Ogfvm8WRaogYQ0TPzWfu0VC7bLcDSAl4jh9TVElOokcFn82VPfS1GfwNuTkBmEbjVwN0Ss/z69LzZrk0gIygtLQ29n6H8NY+1+NiyvRRMVyAnmTpUR9pBKd3CA30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by PH7PR11MB6354.namprd11.prod.outlook.com (2603:10b6:510:1fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Mon, 25 Sep
 2023 05:38:53 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::1a8f:9320:34f8:8010]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::1a8f:9320:34f8:8010%5]) with mapi id 15.20.6792.026; Mon, 25 Sep 2023
 05:38:53 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 0/4] Xe runtime pm refactoring
Thread-Index: AQHZ7HzdZXrKd5ZsZk+Gjw8VFo9XwLAleHIAgAWTtIA=
Date: Mon, 25 Sep 2023 05:38:52 +0000
Message-ID: <c073a58f037afe0446fe62ff49e7acf4eaa6791a.camel@intel.com>
References: <20230921111434.3051325-1-jouni.hogander@intel.com>
 <ZQxvRsTev0CAbyYh@intel.com>
In-Reply-To: <ZQxvRsTev0CAbyYh@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB6024:EE_|PH7PR11MB6354:EE_
x-ms-office365-filtering-correlation-id: 6539edef-1fa2-4e3c-4ee2-08dbbd89b390
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JB6UwOmG2iWvE69c/M1mPimb2cxicij4vI/RniofdMq19xIehSOYgTmTGtznA9UhYPzVrtVLvUh938OJc6GKgCTfku5nKDhRCCT1A1JBwJixoATwTEOiPIkXyxqksQkVz1UUr269Fv5OswD5fqFbD6/xvsaAbYpD++eousECA37y5/hehdb/xoFzfeL/O8S+1oyHxaO5FiOqyqetgbRiBLjwSatjDvMHPetd7xDH+wdKl4BJfR7TB22j4ATk0zrB29+EdyhL4w/cXsaeNOsm/b2X+OP5cKmV4t6k0oCz4vvXAJfaczZ7vB9/NzGb0DWbucP/NVfEumAbXHO8gbmBoZeq9BLGtTJ+FJsn45tt3Ku/PhyYD2jdNRYPT5vFHs7cw8IONx7mQBC7KWUlSsbf8zICawuSZUsCdTbr/w2ci/JpwwY8qeCBIkjDo9HD5xfshnIVemq2rqKLAMmGw7Cj7Ci95sGROh114sfTB1YKLiecF/aYtUllqTP+9x3wDxjr4UeuD2HMXs4WOgnRR2/nDhcB4qzt8XUCaAjak/fOlsvgZbwgVPyVWwIM8TUBwsRkxJtw4Em2Sk3GTIkr9f9Mrxzx3s7V1l7DdYelZ2sb0BUIzCwUJwDeRtCGwh+3kk63
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(451199024)(6512007)(6506007)(8936002)(6862004)(8676002)(316002)(5660300002)(6636002)(71200400001)(54906003)(64756008)(478600001)(2906002)(2616005)(6486002)(4326008)(76116006)(91956017)(66476007)(66446008)(37006003)(66946007)(66556008)(66574015)(26005)(107886003)(83380400001)(41300700001)(36756003)(82960400001)(122000001)(38070700005)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3BXT3dwMEY0VWUwQ2dKVm8wTmE4emQ1RlVQOXlnbnluYm9HclUyeEtmZ1BK?=
 =?utf-8?B?Z0hzM0Y1WDVFMXRqMCttaWZTbllNU0lLdkF1UW9WSXo5cXdiOUFYRFJTSFZH?=
 =?utf-8?B?aEpmUXo5ZHpYc0JZbUpxVGE4aDF4c1RLUmZGR2xOM3A0bG5Nbi9Ga0htanhy?=
 =?utf-8?B?Q1pDSyt2UFRMK2lYMURxbXFaTmlrSDNSWmQrV094VlhqMEFkRXl1NU8yQVBs?=
 =?utf-8?B?TFV5WkY2NE5TKytjZzlGdXh3czhDNTAvdlk1a2tNZHRzejEzSUJMaFk5UUF1?=
 =?utf-8?B?Z0JuQVJnZnhUNHRHMUVOeDFIUnFNODdsZklOdlM4ajhneXFvVE15dTdWMExh?=
 =?utf-8?B?MlY5ZWxiYk1QejcrTnhVeEwxdExqandVQWhRRVJXZjY4WUdqZGtWTDBNYmpX?=
 =?utf-8?B?RHpXUjNENzcxcmtOVjltMHhvcW9Rajc1QldacnJ3cWUxTHpCVmR2ZW5ObFF5?=
 =?utf-8?B?K3ZFdVFSNlIzUGEvMGdmQ3UweVlIZUJUcjJRcUg3OXNkemFkNEp5NVRUZkFU?=
 =?utf-8?B?cHVMS0NYYmZ2TUN3RUFremtZTjljWG9LaGhpZGtVU01zRmR2WVFOTVVMaFJU?=
 =?utf-8?B?TlovUFg5T2Z0VEt2bkJEKzJTU0VpTTZjWk1EbERWWXZOSXNvTlljRk9VOG9L?=
 =?utf-8?B?VllCUDg5Umt4VUVPa25uQ2U5M2NkZ3lwZEs5VjB6TjdZZEJUUHBTOUFRWTdW?=
 =?utf-8?B?dEdIOW5rRk5mWFdVdW5MNkRna3V4WVN4aHNHTC9mdENSQk96R3dWejk0NWlk?=
 =?utf-8?B?YkJvSzlxQ055MHBZNGo0UkRFejFzNDlyNS85eGY3YTRSS0tJeU15bUNZTkdw?=
 =?utf-8?B?NkFlcDEzTFlUMkRLTDZyVkp4d0QxTVJmcHFBSWVjOVh2NFN3dmQ0OWxhNlZM?=
 =?utf-8?B?K052cndsM0o3L0VnK2ZDQ2lodFhHa2tzUUVxd0FLRXBFbWJtdkFlNnVzbGdv?=
 =?utf-8?B?akczM3RUSUJxeEZNM3hTQXNVOVVHYzM2QThRbFpadlRvMTdIUE5EWC82Uk1D?=
 =?utf-8?B?UnFXaS9RK2p5bUNnSTNlQStsV1g3Y3Jmais0VHNyR0U5S0EwR3NIUXJ0UjFn?=
 =?utf-8?B?eTJwb2lpeDRib3l3eHJLNE5BNkZ3dGVBblJYZ3Bjd0VnV2FxNzk0V3NPdVdN?=
 =?utf-8?B?MWhrcnNNL1J3WjZiTnpCSmxtUENGVjZZc0hZaXh3MDB2NGt4bjVZd01COEda?=
 =?utf-8?B?ZUs5RmkvRDJmeUlPUVJsZm1xRE94WE9CKzZzMlczVUk5MzVKNzNJNU1iVUxp?=
 =?utf-8?B?cWhIblRVNW1iZFFhWGE4Ym9uWGhvQlR6VTYxZ0tqWG1jU2xYVHdHU3R5dXNa?=
 =?utf-8?B?Q2RJSUhJVUhvek9FUEtheWtDQVB5cVEwd3I2VlVPcTROQkN6MGQ2WnRWc0V6?=
 =?utf-8?B?OUMxWENvS3hwSm9JTCtTM2NUd1I1ZFhLOGc2NzN4T3pxRm1BTkZvcVNvekU3?=
 =?utf-8?B?NGZ0bWxHUXBnaHhNWUlweWpWMDArTE1VZ0w3b1V2bU9tU0J5NFVoc2g3YkhC?=
 =?utf-8?B?dEdhNFAvUGpyenN5UDNSbC9maDhOWW13Qi9CcDRvWGhydkphS0hyZFF3NU93?=
 =?utf-8?B?SDNSZzdBdEkvQzRlTEl5eFRXL0xUaURtalhTNm5Hak0wTklNOVZTNjhWVUZJ?=
 =?utf-8?B?am9mSlRNN1JnU2ttTmc2R0lkaCt5TjFvdmExVFJpU2VaNXNXUGhmeU1XZ1Bn?=
 =?utf-8?B?RDlGUUdQVlJ0LzNqT2tVRWtxcE5hY1BCUkkzRXVwUEJIUkx2UlRrR1VSNy9a?=
 =?utf-8?B?SXFyZWhCVFlHYjBqMmpPNjlrMTdRNy9wUFZ6SmRFNExiR2tLR2VZNW90eVlh?=
 =?utf-8?B?bk8wVEIrOXIyeVVGVE1keExPVng3ckd5Q2VjeW0zQ1oyclAwYWNySEtNWWc5?=
 =?utf-8?B?NDg4TTZTaEJhUmVBNGRGRkp5bGs2MTVEM3VZbFVwVVBVUTNxWU9HV0szcEZU?=
 =?utf-8?B?Q092dUV0RU85bVJxbW5iZGFqMDBKSGNtWldiTUQxMWRJLzVzN0puNEl6dU1q?=
 =?utf-8?B?VzlJblpDSTFoMTl5OWNqRjZza0dudTlyZnFNcFJMVVorUy8xQ1huQkdONDNB?=
 =?utf-8?B?S0pxMVhtT3lteGdOZ05MeCsyQWhXTmxucXhidkwram0yQmltYUsrekZEalp5?=
 =?utf-8?B?S1ZTMzd5dHFJcUJXcnd4MVYxN3JmWUFFWW1ZOEpRMkdDK2c2Q0xlbUxkTDhw?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8CCEB134C2B86418B8F378846DE8AD1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6539edef-1fa2-4e3c-4ee2-08dbbd89b390
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 05:38:52.3554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L3b1kon0RaqiUR585lbigrf20HnSGOtUTz9V1vZlRVW3pjc9fsKX2Gsu4NAIagiEQGG54Q7qrdXPfNg6Zlz8ERkixweEggc9H3a1UdvlXiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6354
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/4] Xe runtime pm refactoring
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA5LTIxIGF0IDEyOjI4IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFRodSwgU2VwIDIxLCAyMDIzIGF0IDAyOjE0OjMwUE0gKzAzMDAsIEpvdW5pIEjDtmdhbmRl
ciB3cm90ZToNCj4gPiBUaGVzZSBwYXRjaGVzIGFyZSBkcm9wcGluZyBzb21lIGlmZGVmcyBhZGRl
ZCB0byBidWlsZCBYZSBydW50aW1lIHBtDQo+ID4gY29kZS4NCj4gPiANCj4gPiB2MjoNCj4gPiDC
oCAtIFJlbW92ZSB4ZV9ydW50aW1lX3BtIGNvbXBsZXRlbHkgZnJvbSBEUk0gZHJpdmVyIHBhdGNo
DQo+ID4gwqAgLSBBZGQgeGVfcnVudGltZV9wbSBzdHJ1Y3QgcG9pbnRlciB0byB4ZV9kZXZpY2Ug
aW4gZGlzcGxheSBmaXh1cA0KPiA+IMKgIC0gQWRkIGRlZmluZSAoeGVfcnVudGltZV9wbSAtPiBp
bnRlbF9ydW50aW1lX3BtKSBpbnN0ZWFkIG9mDQo+ID4gcmVuYW1lDQo+ID4gDQo+ID4gQ2M6IEph
bmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+ID4gQ2M6IFJvZHJpZ28gVml2aSA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPiBDYzogVmlub2QgR292aW5kYXBpbGxhaSA8dmlu
b2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+DQo+IA0KPiBmb3IgdGhlIHNlcmllczoNCj4gDQo+
IEFja2VkLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQoNClRoYW5r
IHlvdSBSb2RyaWdvIGFuZCBWaW5vZCBmb3IgY2hlY2tpbmcgbXkgcGF0Y2hlcy4gVGhlc2UgYXJl
IG5vdw0KbWVyZ2VkLg0KDQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IA0KPiA+IA0K
PiA+IEpvdW5pIEjDtmdhbmRlciAoNCk6DQo+ID4gwqAgUmV2ZXJ0ICJGSVhNRTogZHJtL2k5MTU6
IHJ1bnRpbWUgcG0gY2hhbmdlcyINCj4gPiDCoCBkcm0vaTkxNTogUmVtb3ZlIHJ1bnRpbWUgc3Vz
cGVuZGVkIGJvb2xlYW4gZnJvbSBpbnRlbF9ydW50aW1lX3BtDQo+ID4gwqDCoMKgIHN0cnVjdA0K
PiA+IMKgIGZpeHVwISBkcm0veGU6IEludHJvZHVjZSBhIG5ldyBEUk0gZHJpdmVyIGZvciBJbnRl
bCBHUFVzDQo+ID4gwqAgZml4dXAhIGRybS94ZS9kaXNwbGF5OiBJbXBsZW1lbnQgZGlzcGxheSBz
dXBwb3J0DQo+ID4gDQo+ID4gwqAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bv
d2VyLmPCoMKgwqAgfCAyNSArKysrKysrKysrLS0tLS0NCj4gPiAtLS0tDQo+ID4gwqBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X2RyaXZlci5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyAt
LS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ3B1X2Vycm9yLmPCoMKgwqDCoMKg
wqDCoMKgIHzCoCAyICstDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9ydW50aW1l
X3BtLmPCoMKgwqDCoMKgwqAgfMKgIDEgLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfcnVudGltZV9wbS5owqDCoMKgwqDCoMKgIHzCoCA0ICstLQ0KPiA+IMKgLi4uL3hlL2NvbXBh
dC1pOTE1LWhlYWRlcnMvaW50ZWxfcnVudGltZV9wbS5oIHzCoCAyICsrDQo+ID4gwqA2IGZpbGVz
IGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IC0t
IA0KPiA+IDIuMzQuMQ0KPiA+IA0KDQo=
