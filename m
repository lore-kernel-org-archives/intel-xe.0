Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1C5CA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAA7112059;
	Fri,  9 Oct 2026 10:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOLHUwoe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256EE112059
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791542582; x=1823078582;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/9gE/jbaQcLtn7WA3T5oX3vSmrcv7+20/BV+xzANY6E=;
 b=XOLHUwoeGLnA5t4bO/K1eKxAvrG0zcF8YVfwuM4MzPY2ORGP5AFT7r8p
 IVBbuI/aoTj1x/fEiIq1auTLJcE4kVoS1p/CQAnOIdbF5oMu8w6Za4Pfi
 PVWM9QR8ocH6XYSEVf5n0IfHpiSqSFemleZY8IRcqTEPr98iUuIyKmwMi
 TmJkkzcpdB+t9A1JAFNAU3+k9bO+WZGvmiqpREoYqr99vlkedjl1ItsdG
 ULAn+5djU2oYj/vyJa4VEoQGNjR60upN5Y8wp4GfCdvA2DoY1oJvgTcdb
 pDJW3No/88viWScJnl9T6MWy0L1o6S6PEqZb21/cEwXyI/1IXa7eo9XPY g==;
X-CSE-ConnectionGUID: jOpwnMc/T2GF4anHmH9/pw==
X-CSE-MsgGUID: y6APxh+JTJ+ORZSFcuNAug==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="345081"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="345081"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:43:01 -0700
X-CSE-ConnectionGUID: 0ZUkCqswQDie61AoiCIY0g==
X-CSE-MsgGUID: uZC719/MQyGOAPEl9bRinw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="374902"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:42:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 03:42:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 03:42:58 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 03:42:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zH7y11WDDLK84ByznFUhZ/nZ9PRP+KdVurGiPBdt8bcC742JwfT4FJ0NjCv3VZLeYXriYQAz6KoZlYMsotF0IpQHwxaaid//zAPiHcb64TcIVtWwu+O2qFk5kQFLx1VAQR3YBL0ETp2W6BeMgkkf269uHseQroCJfgqLnBTNrgjjlTNVAjJafC0nvXnu8xYB0UabtEYr3t0AVC6uGWKDJbPTcTSogrkAbGlq9OTfVOeAnBdu2Ub6P3IuKdUytEDACPvOguaryJgm5K6ei6nWrJVJ2cjBBpyli3oLr33eLmGhNb1Ah6zn8xeFoCxgmZmpI1hakr2kIP9QAMOn/+gL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9gE/jbaQcLtn7WA3T5oX3vSmrcv7+20/BV+xzANY6E=;
 b=SUlGlAOUVQ9x3F5bFl04veQF2/VXHRpaSne64fKcDhXMzi81uNOdbvAghrvLnASroh+75N9XzQ4zRtfbIKRmhi13QEnn1pdUAfHtzMKPUK67bczT5YWKOipjSo+eulr0HDOyylbJqUPkCO005RqUsrCnQHDwdNG13O4p9g/mwYnTCTfO3ntq/rNyo6lJFpbFvCgc9Xogk68/f52A3kFi0wNGYRbEik99FDJ7shdx6S1JhfMKJnHMnoMZx2rxQZkc/ezYCMIfv/W22zeSg8AvvAGSOU6ZB5fHumcmYaCzmovae70ooiMPHCl6Wsvm9Az4dhFrFCFrrC+DBNG7W4Rb9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 10:42:56 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 10:42:55 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 11/12] drm/xe/vram: Report tile vs device VRAM
 visibility errors
Thread-Topic: [PATCH v5 11/12] drm/xe/vram: Report tile vs device VRAM
 visibility errors
Thread-Index: AQHdVqDfDrq6IwJfcESKRuz7MH94F7bzo70AgAFkIPA=
Date: Fri, 9 Oct 2026 10:42:55 +0000
Message-ID: <BL1PR11MB54133F5CE7FB84C7F89CAAA8E2922@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
 <20261007211417.2093611-12-dnyaneshwar.bhadane@intel.com>
 <95a4d919-85da-44f8-b3e5-cd8add83ac19@intel.com>
In-Reply-To: <95a4d919-85da-44f8-b3e5-cd8add83ac19@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|IA1PR11MB7824:EE_
x-ms-office365-filtering-correlation-id: 47cc9edf-1b0a-4be7-fcfa-08df25f213f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|38070700021|4143699003|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: tlE9DmloRyD6ZGdZCnnAU5VFHPLeF5xaQEbUHqrXzpAqJineXfGM5Ga8JwJs93FLw5ayhh/NnN37SBCXfbMr+gE81liGYAA6n6dGkhSn7Kc6/gN3ailpZpcbENqGKNysLygTWCspyfJ87Ss1hgbS+JP+BtfJ1n9MBxuevAYglb3y/39NJ89vNb3N0jyB+eVl1gFTevcI7xy4baO7UztL0ahXx5mfjQMAA2Np2idR8+tV39pV7AWdaObCVtU47bK3ThqxLwpM7wzT6l5LH8Uh23O8S0fEZTxuR1Gnhf8274ZQHLtHXqmtxcdzEQz9yjf+O/3pcGIF9qnjms/LFjkyhCL9qcYeJcY0cN5Vmbif/0C/chy+kTniB0aZBDWjEc0Ic8SHrA+9kYdnhrLOGFztIY3G+ledXfZwnxNc5WW7u7nbGkHvXhd2SAAAMX4RVlf+gfe2hYdifPY6LzniHJOdlKu0PADzg+UJVUBhbB5sHKXUnd1/xlLcJGf2sA7+gHr7jyGWjh4bg1a14/FhH3moHA7Mi1g6koeF8aYZ9QzrMOprYAKEZ3/LZZq1JLTZv2bV/tn6kQtr/AKg4FtvbW8Com1PCG5FCUBtW6xQZ9xCWf/GIiILASsaCgdjdnKsjDCU0ZO2wAxa28ws334XkuetLM5Sxi/JSJu7WlwMpPz+9F4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5413.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(4143699003)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0ZYa0dIU21ObnRmcHg5SWJhZHpyTXhaU2FBRzF0T1MwY28wYmNnUGJ1SDlG?=
 =?utf-8?B?bldwaVB3d29DeWlUeEFuaVNKSm9xK2VCSGNNN0ZhZWxJczVwTGdZMzdFNnVq?=
 =?utf-8?B?L3RxRGw2Y0txR0k3MXRGUTZBMU54VnU5WlFwR2FiME5lUmpEM0lwVk41eDZE?=
 =?utf-8?B?eWRtWUIxZmtsZHArT1dGZ1E4ckI3ZEpKYUxZajZRVEtwdm9uaS9BTmxEK3RT?=
 =?utf-8?B?dnFMb1ZoNHpYTjJOVjNGb2RZa0ROdWdZQ0tpTEYxdHpZTGpxWEMwQUJ5aXZO?=
 =?utf-8?B?YXZtb2dOa2xicm5EUStLYU1ENklxVkJBLzBhTE5rZ1BuYWVhemRncVNyajR0?=
 =?utf-8?B?NnNpYXRlb1BmdHNsakJ1MlJxLzJYdG9MeXpTUDFHbUgva002MDdmNEdidHBV?=
 =?utf-8?B?aVlEMTZ5NFFRTUxld0E4Tmp3N1NTeDJuc0JGeWlJc3JTQXIyKzlEbThUc0pS?=
 =?utf-8?B?cTI3S2hCRzU0UVZ4TW9HSVdQbVAyY3NJSnhkdWpZZi9JMktGdTJOclZKWjd4?=
 =?utf-8?B?ankyVDhZMlNxR2lhWWtvU2RwTE9NaVFpb2pEZVVHQ3BmaWpGYTRCZFhUQ3JP?=
 =?utf-8?B?N0luYko4ejF6b3gzcFVSVklZbkVCdDRHTTNqb1lKZklXM09kaEMycFJvazlw?=
 =?utf-8?B?c0xEQzhPMDhGaXMzaXladHFOWjM4ZXVRNnE3V2Y2WWVldmxaUy9OZFpPdEJB?=
 =?utf-8?B?NjJydmlqSks4cXZRSjBKVEFRc0VaTGpzVkxQdlUvZm90YW9vVTZoS0E0V3RC?=
 =?utf-8?B?L2FOM1VyRG9rdzZKc0ZYeENoRU84ZXB4SVk5UitwODF0ZUw1RTlidUVwTUtQ?=
 =?utf-8?B?Uzc4UDRqR1BWMTEzQnJUZTM5RVBlRTVsR2N0aGpETDNOeURIby9Id0w1WEZk?=
 =?utf-8?B?TXpFN2F4VDh5cDh2a0RhSStMU3dlK3NmNzBNV3h1SFAvVFdKV0FGQ0MrOWZK?=
 =?utf-8?B?L2hiMmsxdEpld1dXTXlRUmdqZTYrTEJWWS9KM0NKRFFEUmRZckJEdStvNE9T?=
 =?utf-8?B?S3lHUHF0b3FRSThhR2xWZXI2b0ZuVldFVkh2d0FiWDhNWmNnQm5aYzFWYzBO?=
 =?utf-8?B?dWsyZjI4MUdWOHNhQ2JNMmhFZks2ZHJZaVF4L1ZMNlhKR0RwM1c2Q01zZ3RQ?=
 =?utf-8?B?cCszQjNuZUxDKys3SjRxcWphZkNyQ0UyNTlOMU40WkR5RWJobDlNaWtad0Fx?=
 =?utf-8?B?RFJ3S1E1WG5SMnA4dGdOQVZmUUNzSm4yZVRaL1FvbzQrUzV5bGY1WGY3MGZw?=
 =?utf-8?B?cmJaVVZEVEdaRmg1bElndFVhVVlwZktYYk96aWtCSGhOSDJkZ3laK0UzU2dS?=
 =?utf-8?B?aU1BZjdPNU5PdHpJeTBTQ041dUhVbldxM1p4ZGJCbVRaTGZjSC9pYVV4a0d6?=
 =?utf-8?B?SDV0Z3YvZU1pbmVsRkZKaTY5NFpVR1Z6Q29LZWI3QnJLK1dEaTRWU2hBTHBV?=
 =?utf-8?B?T2E0eXlicVV3NWRPOXoxbEthMko5LysxaVYzTmMydU5PRmRhS203VW1aeEhR?=
 =?utf-8?B?OGU3Z0cxVHI3S3o5Zm1PZmNJMlVsVWpZYTVFcHJ0bEdndE0vdGd4NURQQUFa?=
 =?utf-8?B?TVd1dzNoQnRhT3V5eDNTeE94enpsdGlLbWFXTTJBbWNLR0VZQ1dWRk0yc2tt?=
 =?utf-8?B?RU1RNGxIL0xiM3lnclh0WUFOVWVHQTkwbkxqZ01UL2puOGdUQ29YMEtIRjVE?=
 =?utf-8?B?VDFNRFgxQzg0UE9LL24wYkZ4T283MHZhSFRvcEZva1p0Smc0Z0hqS3Z4WHhD?=
 =?utf-8?B?WmhIaU1IenFpMis5cGdQaG13ODl0RnVNRk9xVlVlbWxzSVZrZi9QU1RVYm5j?=
 =?utf-8?B?VDFxVGRLYWhTQWJ0d09BSGpiRkxkTzhEa2YzclVGZXFzK2FiZVhCd0JvbWYr?=
 =?utf-8?B?NDE0eVgzTEhCU21XZHZFWjlTTnFYYnRORUR0b0cvVkY1MzIwVUhhQkdJRnNV?=
 =?utf-8?B?VG40WUQ3cnZIWCt1ZmV1UHFFazVWaU80MSt6cUoxSDdmUkhmODZabW5rUWl0?=
 =?utf-8?B?cjQ5NDBoT0R5UDJtYkJRRCt2RzlhcFdaOFdZVEtlUkFUVXV4ZDdqTVZ4aW1I?=
 =?utf-8?B?VDIwZ0ZHR2EvUUp3TWg5WDE4WWNlYzI0a1N1V3F3b2p6b1kzOTRJZU13Q1Fk?=
 =?utf-8?B?TzBPWDA3UnRraFl6bkdnQTVhbjA5cnJxRXVjaVF0K0xBNmp2SC9RRzRQbjlk?=
 =?utf-8?B?eGVWWDI0RVBpWnIweTFaV2ZZR3RwdGx0NGhUSyswRGdxMllWNjcxY1ovQ1hJ?=
 =?utf-8?B?T1BrMUFqNFZOOUN3ZjJJM051bEt4T1d6LzNMaWhvU2tyMS9ERjRBTVVxdU4x?=
 =?utf-8?B?QXphYkRiUmQ5MzhHMnZNMzA5MUcrakxYd3ZDb1RQZkIwVCt5N21HcHp2MWN2?=
 =?utf-8?Q?btT2VxsFAnRwYSdw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VC8m+nI0YdqCMHgsBlWOSFWJ2nt/Lh90GM5LfZF7iKL9Mnt7p7wqch0yhKI9cAyO61fCvR1KNQLe1UbkXBQMNjPVhA0vW9d277JYt/NdRr7LKCHSR2nJ0ur7KtElUUUME24O0F1ft4nuGNRPj0nwVPHVkUr0nuaibOxNNM2wLkKVq9VAw1T/DbYHHY0oACio4EIM2olDcTtiVJbmqxBLt0xKLgeTTlie+hqwerg1+tPkeOGOFnrzBBxPd5zqZDyoIYUcCKntKA2wlhHGJ+w22sD8Sv50f8Ght5oq2Y8H60RR2Pqos87uGrxRY5SXHBe9/v5ny5s+cniOrSJMcCxbsQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47cc9edf-1b0a-4be7-fcfa-08df25f213f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 10:42:55.6573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bfKJVnv7fOF1uQvjMttObgynGo0LFk2kiy0wkqzP9H8Iw0wHaswGQ8XtzPsMh4MQzW+1E5iOyVBPzKOh9EI6pmSXbRKW17NnrEV7U6k7M0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7824
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS291amFsYWdpLCBNYWxs
ZXNoIDxtYWxsZXNoLmtvdWphbGFnaUBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3Rv
YmVyIDgsIDIwMjYgNjo1NiBQTQ0KPiBUbzogQmhhZGFuZSwgRG55YW5lc2h3YXIgPGRueWFuZXNo
d2FyLmJoYWRhbmVAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDExLzEyXSBkcm0veGUvdnJhbTogUmVwb3J0IHRp
bGUgdnMgZGV2aWNlIFZSQU0gdmlzaWJpbGl0eQ0KPiBlcnJvcnMNCj4gDQo+IA0KPiBPbiAwOC0x
MC0yMDI2IDAyOjQ0IGFtLCBEbnlhbmVzaHdhciBCaGFkYW5lIHdyb3RlOg0KPiA+IERlcml2ZSB0
aGUgb3duaW5nIHRpbGUgb2YgYSBzdHJ1Y3QgeGVfdnJhbV9yZWdpb24gaW5zaWRlDQo+ID4gdnJh
bV9yZWdpb25faW5pdCgpIGZyb20gdnJhbS0+aWQsIHNvIHRoZSAibm8gQ1BVIHZpc2libGUgVlJB
TSINCj4gPiBlcnJvciBjYW4gZGlzdGluZ3Vpc2ggYSBwZXItdGlsZSByZWdpb24gZnJvbSB0aGUg
ZGV2aWNlLXdpZGUgcmVnaW9uDQo+ID4gd2l0aG91dCBjaGFuZ2luZyB0aGUgZnVuY3Rpb24ncyBz
aWduYXR1cmUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEbnlhbmVzaHdhciBCaGFkYW5lIDxk
bnlhbmVzaHdhci5iaGFkYW5lQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV92cmFtLmMgfCA0ICsrKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdnJhbS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnJhbS5jIGlu
ZGV4IGRjZWRkOGNmZDczMS4uMjQ0MWZmZTc3ZWRiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92cmFtLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnJh
bS5jDQo+ID4gQEAgLTI0NCw2ICsyNDQsNyBAQCBzdGF0aWMgaW50IHZyYW1fcmVnaW9uX2luaXQo
c3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdA0KPiB4ZV92cmFtX3JlZ2lvbiAqdnJhbSwNCj4g
PiAgIAkJCSAgICBzdHJ1Y3QgeGVfdnJhbV9yZWdpb24gKmxtZW1fYmFyLCB1NjQgb2Zmc2V0LCB1
NjQNCj4gdXNhYmxlX3NpemUsDQo+ID4gICAJCQkgICAgdTY0IHJlZ2lvbl9zaXplLCByZXNvdXJj
ZV9zaXplX3QgcmVtYWluX2lvX3NpemUpDQo+ID4gICB7DQo+ID4gKwlzdHJ1Y3QgeGVfdGlsZSAq
dGlsZSA9IHZyYW0gIT0geGUtPm1lbS52cmFtID8gJnhlLT50aWxlc1t2cmFtLT5pZF0gOg0KPiA+
ICtOVUxMOw0KPiANCj4gaG1tLCB3ZSBhcmUgbm90IHVzaW5nIHRpbGUgcG9pbnRlciByaWdodD8N
Cj4gDQo+IElNTywgd2UgY2FuIG1ha2UgaXQgYm9vbC4NCj4gDQo+IGJvb2wgaXNfdGlsZSA9IHZy
YW0gIT0geGUtPm1lbS52cmFtOw0KSGkgLCBJIGFtIGdvaW5nIHRvIHJldXNlIHRoZSB2YXJpYWJs
ZSB0aWxlIGluIGFzIHBlciB0aGUgaW1wbGVtZW50YXRpb24gb2YgcGF0Y2ggMTIuDQpodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNzU2NzQ5Lz9zZXJpZXM9MTcyNDc1JnJl
dj00DQoNCkRueWFuZXNod2FyLCANCg0KPiANCj4gPiAgIAkvKiBDaGVjayBpZiBWUkFNIHJlZ2lv
biBpcyBhbHJlYWR5IGluaXRpYWxpemVkICovDQo+ID4gICAJaWYgKHZyYW0tPm1hcHBpbmcpDQo+
ID4gICAJCXJldHVybiAwOw0KPiA+IEBAIC0yNTMsNyArMjU0LDggQEAgc3RhdGljIGludCB2cmFt
X3JlZ2lvbl9pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QNCj4geGVfdnJhbV9yZWdp
b24gKnZyYW0sDQo+ID4gICAJdnJhbS0+aW9fc2l6ZSA9IG1pbl90KHU2NCwgdXNhYmxlX3NpemUs
IHJlbWFpbl9pb19zaXplKTsNCj4gPg0KPiA+ICAgCWlmICghdnJhbS0+aW9fc2l6ZSkgew0KPiA+
IC0JCWRybV9lcnIoJnhlLT5kcm0sICJUaWxlIHdpdGhvdXQgYW55IENQVSB2aXNpYmxlIFZSQU0u
DQo+IEFib3J0aW5nLlxuIik7DQo+ID4gKwkJZHJtX2VycigmeGUtPmRybSwgIiVzIHdpdGhvdXQg
YW55IENQVSB2aXNpYmxlIFZSQU0uDQo+IEFib3J0aW5nLlxuIiwNCj4gPiArCQkJdGlsZSA/ICJU
aWxlIiA6ICJEZXZpY2UiKTsNCj4gPiAgIAkJcmV0dXJuIC1FTk9ERVY7DQo+ID4gICAJfQ0KPiA+
DQo=
