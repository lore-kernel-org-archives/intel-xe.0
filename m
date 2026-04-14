Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA3EF531DC
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 00:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BCA10E03A;
	Tue, 14 Apr 2026 00:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqt3pYGC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E545210E03A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 00:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776126459; x=1807662459;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3GU0v46pkF0WSU6+sZqL7ItMOfz6D8RzfvPYuO7ykiI=;
 b=gqt3pYGCiq/gI1NUGDc84lqZcevXqAG5ZEn0Yp239HN8WFO8PrCXIj1h
 V+V9hlxRvfEYYXQ56zcr8XhzwJcCPWTAwEo+Pc+1YYibRWVYelF1U4ufr
 +YunJnsrztnw1nFftp6SJr17/kywMuej/h5sPuGrQ9Q5XGLBx4zXdj28h
 AlPrp3LZZSg3rbnFAn3lKdGvg0bQcMTegneMyle83wkI2xZwg8lkiYHis
 oSlmDSmt+l88MQN2Ya6dQO6Cjmoc8n2rwbwBVeJALwmVe8v23ucHdnT+7
 eVDTJS1RiEFhyB5uJMlq9SsapUNBBxzIsiqE3bNLQ2ss2ZW3Rz9c/HrTY Q==;
X-CSE-ConnectionGUID: fXB+bq14TQSIXj7tuwYVog==
X-CSE-MsgGUID: 0cQphDmaQr2WJHYBlA/6oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88455110"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="88455110"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 17:27:38 -0700
X-CSE-ConnectionGUID: 2Ieb1N2VR3y6/xvsibdgIA==
X-CSE-MsgGUID: zyUHd85aTVGQONUkK8Uvgg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 17:27:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 17:27:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 17:27:37 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 17:27:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLj3QsO/wZZrWEJoHOhxD+duSYOo8qvVORgG8D3wNCKv6204cXAievkYvgBl5yw/sV59/D2/+hVCSyDPIh5Co0EKa9x/jyXv0l4oVNRN6oB1mzN1AfJPlQogMyfTNV1uPMr/SCbrmBrhC7jyNtAKAXvXrfZkRVVZRhzvxd6W6ZtG0wjp26EM99fkH0YhhyqRyaF0U0kLySwWe+oWVyD0kWbH/likWAp3y86YlWHo0G2zh2yTXl4ToqYOWqmilY0Dt0lVtSQB+vacbb7qpWD2L90EunajeEvXOaxSqzOIsFqnWrp2rmNW9kC/2B+8TS5AojCjs+AyJWKjf2b0J+TUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GU0v46pkF0WSU6+sZqL7ItMOfz6D8RzfvPYuO7ykiI=;
 b=LTMpCG7i3Y7DUCf/rivibTFDOds2y7K+yilTuIcqyZEdCFpSRc6vywl7+dAoNAfOahRoVP8V8lxOFdBrA4hF0ynXsZGJsdmQmwbXIPuR5U6TDWf6NXpqNMnlhYdCTFR8ajmPfzqH6w2TbdQ28et8ENAGw6wt32JaVFz4d+oMY4BzBlLqNAO1/OxXPWEU6ZWgBnYI3Kf9tGuAz/IGclmIW9fl1LmpkgF9AOzb9Si+OzVhvSkon6E3kKSAe17rASvbrs+sKZuOcJkH6lOrC9US65wFOfLeqkHUw4p5xGefpfuOxLSTbdbf4YUk61X7aTe6NKpLz0FSjg426V29cWELWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 00:27:28 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 00:27:27 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/xe/ras: Clean up coding style in xe_drm_ras
Thread-Topic: [PATCH 2/2] drm/xe/ras: Clean up coding style in xe_drm_ras
Thread-Index: AQHcxuK9+28Nrvdr+kqJ2oqpTI38rbXZUMaAgAMicICAAUbFMA==
Date: Tue, 14 Apr 2026 00:27:27 +0000
Message-ID: <DM4PR11MB5456D44F0891F8E46BE9827DEA252@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260407225913.3397059-1-shuicheng.lin@intel.com>
 <20260407225913.3397059-3-shuicheng.lin@intel.com>
 <SA1PR11MB8839B6A60B4934022AC2F0FEAA262@SA1PR11MB8839.namprd11.prod.outlook.com>
 <bddccc37-87b3-4451-ac34-35f2ce22ac10@intel.com>
In-Reply-To: <bddccc37-87b3-4451-ac34-35f2ce22ac10@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MW6PR11MB8338:EE_
x-ms-office365-filtering-correlation-id: b45af0ac-c2d2-4a40-9b3f-08de99bc9bb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: pBAL4m8NVn1TYyDYEfR0Vbtyzg/pSM8eHutfQAVVyKKzSOXSWeIBo74IqN2p0m55lv9wnRILVYn9FH7+o9ROXlIulZumqEn/pgcaLP8trbGVB6Hh5AOTIyKhWtqzCGfKz6QjNpE0gHYQjyMy72L5Gx8YcCqnQMtBZxjs695h/tISniGg1w9qE3X0xUxjN5CwSSiyMJ4/ensbyB6M5XuXH7JITAXfBWy20bSy7bObIejlFyKHl6nUbg/MBJLUrRZwkOh3HkPH4KMFsPr+4FgY595AVsmxc6HsOqTPh6cfQh970Tx1ShjMk+ORKOLgW24qXrNfc8J1jBh7+UrVATwDLikkzl5YPq5xWtC70dGH3k7U+caJfTx85WdO4HOLymymg2jZJuyD68fsC2xOto1L2p1qtt+LzSLT9wPzGuGDoOvzfRWDC3Fd+Sff3XNbUI5EVFYKwNf+GdIzM4yKmRYpm9vKoTsC4mkYu4P2PMNDqBEq9VZcZDZLvBXFHvO+IoScUtdVuvmGxd39+YJk2H3I45kd6mIHs/PEnPg2V/r0/XkJpPP+MO8wETAEGq+LUZB8tBU3YsB1DZ2YtmTtloK7NpM6zK2nwBnO0qPFNNnsB38Vgnw0ROP0rItxYpxKPv8L6AtXwrwyDgVEnaAqcRc9CHXbb6nZYwnpRc+2YBk0NaKOlaFYKuVs98HHRWc8wjyVG3KsrYb141pHEUzXOr1h0HrWxLd5ouHKlTO1mpGEYMhaqft/bGrw2ntGal1uwHmy1ygjpFUALNBITENtw3NmuE5csleRK0gWF6+J6BNkiVo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkhkaThld1NPb3ZLY1FYbWtSRjJzYklWVzg2Y1UyMFJVamFOMEdJS2wxU1pM?=
 =?utf-8?B?NFMwYlY2VGFJc0Vhb2xhQnV3d1BIZmxkVmJjUXppR0RkZ3JQaUUzUGFFQnRq?=
 =?utf-8?B?R3N4dHdqSGRIcUZxOW40ZHAyODRiKzMybHlIbVN0L0ZveWhOcWp2eTRCWjBZ?=
 =?utf-8?B?TCt5QUhhQVdYcFhrSWg1QmdrNS9jaWZHWlJTNjhQMUFrYnpBMjJjbElRbjVS?=
 =?utf-8?B?ZnFVemJqT2RSUXJ1SGhrVjVTZ1E1U081SHRoQnRnOEZsN0huY0VWWU1xN3lj?=
 =?utf-8?B?Vmk3K2taZzIrbzZDQXczS3J5UDJZeWFReGlCOEpWRkFVTUd5LzQwMTlnNnBX?=
 =?utf-8?B?Y1YyM1pycytFYkdLakpSeG9ZbWcrWDVlZWcrTlFRbUtlcThlQ3d5M2k5d3JW?=
 =?utf-8?B?OFpQRWVHTXp3bk5BSFNjUVlVeGh6aEdPWEs2ZHA4R2UvcTlpMmx2WVNpWUxl?=
 =?utf-8?B?ZTBKaWV2UmUyQ0FqTnZ3VDJoZmJjQkgrSVhXSk8vSUZNamJsNjcrYW0rOGpu?=
 =?utf-8?B?UVg0M084bWp2YWZZNGdCSE1QY0dlaGdJS1dDeXBGbXhYS29DV0h0SmtzZ2Mw?=
 =?utf-8?B?TXQ4ZjZQczlxVjFkMnVBVjBpZUZ1NUN3ZWRRVGFzNzF6OXM4Tzd5Z1FkNHA5?=
 =?utf-8?B?SVFMUXRNb2UyNDJSR3FGN3RncXlGNXl4bGUzWXE2Ykdyb2tJM0plaVhrc0Nx?=
 =?utf-8?B?MXNLTHNRKzJHdnA0VmNTbFllaTloUXZJTkl2ek0xMjg4bG1HUmR6T04zYnNo?=
 =?utf-8?B?WDVBbndUTDNpeDRsMDJkb3BHN1orNk94QU8rR2lGdi9ZeHI1TlVQVi8rTkc1?=
 =?utf-8?B?VE1XYVFOQ0V4eWFoMWlYeUFMYjR6LzVOck5WRXFRWVhSdHlwMnUyZm5CN2xH?=
 =?utf-8?B?QkJVOFdOSUdoNmUxTjVkKzQ4SkVraW9UYVJ0aWFQcWxzTG1acUFTOHVaNmZR?=
 =?utf-8?B?SjY0dEpNQWNBbks5RXFYSkpna3dYZnFkU1J0Y055VlBmVC9VbnFDdVpzSzky?=
 =?utf-8?B?SmdEdVh0Rkg1UDAzcU1aWVdUQkJCSkxIeVkrZzB6MGloU1V2TURtbXVrSW1X?=
 =?utf-8?B?T1pjcE8rWXJuWVdwYmtpd0N4YkJsaW5qZkd2dk9VemtDaWh1YU84d2tRVTVU?=
 =?utf-8?B?akdiVkszaDliZktZNUpCV2ZIMDZOTWhmSGRZZS9RTVNOVnd1SDlQOFdaUVlF?=
 =?utf-8?B?N3VXTkx1Vy8rQXh4Sk41eUtORm02cS8wMzFraGZ3TGJ3S2cySFlINGsvcjVR?=
 =?utf-8?B?U04veE9OWUhHUFJIK0Z4YlkrWWtWMFdpdXlmUWViNElYS2VybzI1MmxtUnR4?=
 =?utf-8?B?TnZXUWl5K0E1UGlBeUJkdG91VzRFM1lCU0t2bmNERDRnSzcxd094OEI0Q01U?=
 =?utf-8?B?YUhmTDhBZUk3dWFidzNTL0pNSmxFaHZQZlQyNzZyVzBMYWk1dERUWllGczNZ?=
 =?utf-8?B?K2ZhYXFqenh1OHlzV3RhL0lON0MrTHlFVTF4R2hMNy9mTExVS2R5Q1RoSXQ1?=
 =?utf-8?B?R2dKNUdYejNHeTNHR1QySTl4T1NERnFIOUd3dEJXbkV0QW95NGc5enNoWXVE?=
 =?utf-8?B?WWRnSGNxSEcxYjgvLzNDei8vRm45NDhCbGxCMWdvUDlTNHFENnJGVG1ZU0ly?=
 =?utf-8?B?RUQrS0hDdGlvdlBvTWFyQ3JFRy9NZndCeTlNNFh3VTlJVFpKc2ZMSmxKLzhm?=
 =?utf-8?B?RzluL1FkMnhpMjYxdFV3eHZmYkM3dW5PVlY2VzFNS0NZWExRRHhVU0JieFp0?=
 =?utf-8?B?angxb3U0R2pPdGFkWEFvT2VGNndIR0dZdC9MMmxYYnEybURLekVISlVTaTJI?=
 =?utf-8?B?eElZZFUvUnRMQ1pmb05ocms0U1FwaGxzZFR6TS9MVFNleUFJd05GM0k3VGNr?=
 =?utf-8?B?cHpObVhtTEpJM3p6QU1EeEhjdWJFK2V6by9LWFZBT3M1elBxMHFLYldFOFVm?=
 =?utf-8?B?M1dzdzdtamV3emNHNlRYQUNtVUxQMjVFcmI5aWE5ZE4vOVg3UUJEOGZ4ZHla?=
 =?utf-8?B?RFUxVG1ZZXYzeFdsUDZucmNvNzJRR21xZVFHZmt3NFJnYUl1MjlMeHBjUk56?=
 =?utf-8?B?aEUzTGdqWXVtclZlL2hUdTZ0TFVjUU04L1VhMEdITUx3bHpkc3Zsa3pVeHZF?=
 =?utf-8?B?VCtoK3NJdUVlQ2lXazlQS0NEY0JRQU5tZzFYTExjZVFjalYvMEVZTHVwMmN3?=
 =?utf-8?B?UXZNb0VreUltcXZxazBqQVhvWi95ZlVUTmtQanNTOHNqSlJCZGlYZDVJTXNY?=
 =?utf-8?B?bFhlZ2luQkE3c1hWZmZyMVZjNFVIb2V6Q1U1ODU1Z1NCcGswYVFPMnRDeS9n?=
 =?utf-8?B?UE1DZysxRzR1eDBMVUxIMmlCanN2cmF3dnpHN1JxdE9LYjZ5Qy9BQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bQvyNMmXp4INm5zg4tFl8kBB8qmFeTkSdXjUTDbFTZZgD4nAaDcc2vHppUnWsD2OGzkhZ04zIHrENuyFNxJQ15A4v5xdb/7KEhI0Lm7iLnR3ePfCIVDq+Fw/bWqjqozZIOiML1BDFr6YUPrla6WmXrxHVCioMJPGNvwmTeuCh/qkLG4c8nFiZJ1P7ngkg0ngK6aGWUbH1nx0QwgBpimZVdnZsUm+FVO7kdvl8Hnqkj3NrxchMLh2CGiwsCBl2CWyE92K37KKVKsU8V9Aj/rmMGvWokBUE/ZKPL+gbZHw7yW3dtu3+DLZ8zrVdIot8ZGaSZEw6nUe7aB6YYaCxuy5wA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b45af0ac-c2d2-4a40-9b3f-08de99bc9bb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 00:27:27.8182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7PCYfbV74+2g0iqU2ibOimLKAJLuCZGnr47klvccze+dCAF0Foln41wIsDbjlawmH6leAwKJIMFsKMRdx0vezQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8338
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

T24gU3VuLCBBcHIgMTIsIDIwMjYgOTo0NiBQTSBSaWFuYSBUYXVybyB3cm90ZToNCj4gT24gNC8x
MS8yMDI2IDEwOjI0IEFNLCBOZ3V5ZW4sIEJyaWFuMyB3cm90ZToNCj4gPiBPbiBUdWVzZGF5LCBB
cHJpbCA3LCAyMDI2IDM6NTkgUE0sIFNodWljaGVuZyBMaW4gd3JvdGU6DQo+ID4+IC0gRml4IGxv
bmcgbGluZSBpbiBjbGVhbnVwX25vZGVfcGFyYW0oKSBzaWduYXR1cmUuDQo+IEFsbCBjaGVja3Bh
dGNoIGVycm9ycyB3ZXJlIGZpeGVkIGluIHRoZSBvcmlnaW5hbCBzZXJpZXMuwqAgVGhlIGxpbmUg
bGVuZ3RoIGlzIGluLWxpbmUNCj4gd2l0aCBjaGVja3BhdGNoLg0KPiBQbGVhc2UgcHJvdmlkZSB0
aGUgY2hlY2twYXRjaCBlcnJvciBpZiB5b3UgYXJlIHNlZWluZy4NCg0KSGVyZSBpdCBpczoNCiQg
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1zdHJpY3QgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Ry
bV9yYXMuYyANCkNIRUNLOiBsaW5lIGxlbmd0aCBvZiAxMDEgZXhjZWVkcyAxMDAgY29sdW1ucw0K
IzEwMzogRklMRTogZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RybV9yYXMuYzoxMDM6DQorc3RhdGlj
IHZvaWQgY2xlYW51cF9ub2RlX3BhcmFtKHN0cnVjdCB4ZV9kcm1fcmFzICpyYXMsIGNvbnN0IGVu
dW0gZHJtX3hlX3Jhc19lcnJvcl9zZXZlcml0eSBzZXZlcml0eSkNCg0KPiA+PiAtIERyb3AgdW5u
ZWNlc3NhcnkgY29uc3Qgb24gcGFzcy1ieS12YWx1ZSBlbnVtIHBhcmFtZXRlcnMuDQo+IFRoaXMg
Y2FuIGJlIGFkZGVkIGFzIHBhcnQgb2YgYW55IG90aGVyIGZ1bmN0aW9uYWwgc2VyaWVzLiBBIHBh
dGNoIGp1c3QgZm9yIHRoaXMgaXMNCj4gbm90IG5lY2Vzc2FyeS4NCg0KSSBhbSBPSyB3aXRoIGl0
Lg0KDQo+ID4+IC0gU2ltcGxpZnkgeGVfZHJtX3Jhc19pbml0KCkgYnkgcmVtb3ZpbmcgcmVkdW5k
YW50IGxvY2FsIHZhcmlhYmxlDQo+ID4+ICAgIGFuZCByZWR1bmRhbnQgZXJyb3IgcGF0aC4NCj4g
QW55IHJlYXNvbj8NCg0KVGhpcyBpcyBqdXN0IGNvZGUgcmVmaW5lLiBJZiB5b3UgZG9uJ3QgYWdy
ZWUgd2l0aCBpdCwgSSB3b24ndCBpbnNpc3Qgb24gaXQuDQpTaW5jZSB5b3Ugd2lsbCBoYXZlIG5l
dyBzZXJpZXMsIEkgd2lsbCBkcm9wIGJvdGggcGF0Y2hlcywgYW5kIGZlZWwgZnJlZSB0byBpbnRl
Z3JhdGUgYW55IGNoYW5nZSB0aGF0IHlvdSB0aGluayB3b3J0aC4NClRoYW5rcy4gDQoNClNodWlj
aGVuZw0KDQo+IA0KPiBUaGFua3MNCj4gUmlhbmENCj4gPj4NCj4gPj4gTm8gZnVuY3Rpb25hbCBj
aGFuZ2UuDQo+ID4+DQo+ID4+IENjOiBSaWFuYSBUYXVybyA8cmlhbmEudGF1cm9AaW50ZWwuY29t
Pg0KPiA+PiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQuNg0KPiA+PiBTaWduZWQt
b2ZmLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gPiBSZXZp
ZXdlZC1ieTogQnJpYW4gTmd1eWVuIDxicmlhbjMubmd1eWVuQGludGVsLmNvbT4NCj4gPg0KPiA+
PiAtLS0NCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZHJtX3Jhcy5jIHwgMTkgKysrKysr
KystLS0tLS0tLS0tLQ0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEx
IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RybV9yYXMuYw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kcm1fcmFzLmMgaW5k
ZXggODAyZTRiY2I3MzFjLi45Y2RkYWQyYmU1NDkNCj4gPj4gMTAwNjQ0DQo+ID4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kcm1fcmFzLmMNCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RybV9yYXMuYw0KPiA+PiBAQCAtNjgsNyArNjgsNyBAQCBzdGF0aWMgc3RydWN0IHhl
X2RybV9yYXNfY291bnRlcg0KPiAqYWxsb2NhdGVfYW5kX2NvcHlfY291bnRlcnMoc3RydWN0IHhl
X2RldmljZSAqeA0KPiA+PiAgIH0NCj4gPj4NCj4gPj4gICBzdGF0aWMgaW50IGFzc2lnbl9ub2Rl
X3BhcmFtcyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IGRybV9yYXNfbm9kZQ0KPiAqbm9k
ZSwNCj4gPj4gLQkJCSAgICAgIGNvbnN0IGVudW0gZHJtX3hlX3Jhc19lcnJvcl9zZXZlcml0eSBz
ZXZlcml0eSkNCj4gPj4gKwkJCSAgICAgIGVudW0gZHJtX3hlX3Jhc19lcnJvcl9zZXZlcml0eSBz
ZXZlcml0eSkNCj4gPj4gICB7DQo+ID4+ICAgCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNp
X2Rldih4ZS0+ZHJtLmRldik7DQo+ID4+ICAgCXN0cnVjdCB4ZV9kcm1fcmFzICpyYXMgPSAmeGUt
PnJhczsgQEAgLTEwOSw3ICsxMDksOCBAQCBzdGF0aWMgaW50DQo+ID4+IGFzc2lnbl9ub2RlX3Bh
cmFtcyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IGRybV9yYXNfbm9kZSAqbm9kZSwNCj4g
Pj4gICAJcmV0dXJuIHJldDsNCj4gPj4gICB9DQo+ID4+DQo+ID4+IC1zdGF0aWMgdm9pZCBjbGVh
bnVwX25vZGVfcGFyYW0oc3RydWN0IHhlX2RybV9yYXMgKnJhcywgY29uc3QgZW51bQ0KPiA+PiBk
cm1feGVfcmFzX2Vycm9yX3NldmVyaXR5IHNldmVyaXR5KQ0KPiA+PiArc3RhdGljIHZvaWQgY2xl
YW51cF9ub2RlX3BhcmFtKHN0cnVjdCB4ZV9kcm1fcmFzICpyYXMsDQo+ID4+ICsJCQkgICAgICAg
ZW51bSBkcm1feGVfcmFzX2Vycm9yX3NldmVyaXR5IHNldmVyaXR5KQ0KPiA+PiAgIHsNCj4gPj4g
ICAJc3RydWN0IGRybV9yYXNfbm9kZSAqbm9kZSA9ICZyYXMtPm5vZGVbc2V2ZXJpdHldOw0KPiA+
Pg0KPiA+PiBAQCAtMTc0LDE1ICsxNzUsMTMgQEAgc3RhdGljIHZvaWQgeGVfZHJtX3Jhc191bnJl
Z2lzdGVyX25vZGVzKHN0cnVjdA0KPiBkcm1fZGV2aWNlICpkZXZpY2UsIHZvaWQgKmFyZykNCj4g
Pj4gICBpbnQgeGVfZHJtX3Jhc19pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+PiAgIHsN
Cj4gPj4gICAJc3RydWN0IHhlX2RybV9yYXMgKnJhcyA9ICZ4ZS0+cmFzOw0KPiA+PiAtCXN0cnVj
dCBkcm1fcmFzX25vZGUgKm5vZGU7DQo+ID4+ICAgCWludCBlcnI7DQo+ID4+DQo+ID4+IC0Jbm9k
ZSA9IGRybW1fa2NhbGxvYygmeGUtPmRybSwgRFJNX1hFX1JBU19FUlJfU0VWX01BWCwNCj4gc2l6
ZW9mKCpub2RlKSwgR0ZQX0tFUk5FTCk7DQo+ID4+IC0JaWYgKCFub2RlKQ0KPiA+PiArCXJhcy0+
bm9kZSA9IGRybW1fa2NhbGxvYygmeGUtPmRybSwgRFJNX1hFX1JBU19FUlJfU0VWX01BWCwNCj4g
Pj4gKwkJCQkgc2l6ZW9mKCpyYXMtPm5vZGUpLCBHRlBfS0VSTkVMKTsNCj4gPj4gKwlpZiAoIXJh
cy0+bm9kZSkNCj4gPj4gICAJCXJldHVybiAtRU5PTUVNOw0KPiA+Pg0KPiA+PiAtCXJhcy0+bm9k
ZSA9IG5vZGU7DQo+ID4+IC0NCj4gPj4gICAJZXJyID0gcmVnaXN0ZXJfbm9kZXMoeGUpOw0KPiA+
PiAgIAlpZiAoZXJyKSB7DQo+ID4+ICAgCQlkcm1fZXJyKCZ4ZS0+ZHJtLCAiRmFpbGVkIHRvIHJl
Z2lzdGVyIERSTSBSQVMgbm9kZXMNCj4gKCVwZSlcbiIsDQo+ID4+IEVSUl9QVFIoZXJyKSk7IEBA
IC0xOTAsMTAgKzE4OSw4IEBAIGludCB4ZV9kcm1fcmFzX2luaXQoc3RydWN0DQo+IHhlX2Rldmlj
ZSAqeGUpDQo+ID4+ICAgCX0NCj4gPj4NCj4gPj4gICAJZXJyID0gZHJtbV9hZGRfYWN0aW9uX29y
X3Jlc2V0KCZ4ZS0+ZHJtLA0KPiB4ZV9kcm1fcmFzX3VucmVnaXN0ZXJfbm9kZXMsIHhlKTsNCj4g
Pj4gLQlpZiAoZXJyKSB7DQo+ID4+ICsJaWYgKGVycikNCj4gPj4gICAJCWRybV9lcnIoJnhlLT5k
cm0sICJGYWlsZWQgdG8gYWRkIGFjdGlvbiBmb3IgWGUgRFJNIFJBUw0KPiAoJXBlKVxuIiwgRVJS
X1BUUihlcnIpKTsNCj4gPj4gLQkJcmV0dXJuIGVycjsNCj4gPj4gLQl9DQo+ID4+DQo+ID4+IC0J
cmV0dXJuIDA7DQo+ID4+ICsJcmV0dXJuIGVycjsNCj4gPj4gICB9DQo+ID4+IC0tDQo+ID4+IDIu
NDMuMA0K
