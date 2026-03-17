Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2B3FD8761
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 12:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6F510E1F1;
	Tue, 17 Mar 2026 12:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/Y3+BSb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C63E10E1F1
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 12:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773751270; x=1805287270;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QBiatdXNa0XVJCHOF6sIbpK/9BmJwK1RQBEzqeTUCNU=;
 b=S/Y3+BSb/rP98J3Uep4OaJ2rk5cIgIIWuCJmJMgukFy9IYSV2Gd91sPZ
 bqL8HUMVWZM3m/XfsilrZfqOa7UU6vflIku/4Fc1WR1qbWspRy7yp0MkM
 1a8oxziQRmTUxdgvCsF6xXuUpKgUe7s9zJKDopgW/Puxc0j0OqTBjK/r9
 OadaoCNivmcBOIDjdCj5ZsHe0y5F4qwNFvjs+6Qd5qJ+AHdN97/tg8Qpl
 91p8lqezeSKVIaa5stDnBazCQoX5y3hawfKaY+HW7BKRS9VZbmlX08jy5
 groGlyi/fwbj9nY/xGrvGAIFzZnm5ON5wIgxR6PHhzPE5neSaONWeGFGN w==;
X-CSE-ConnectionGUID: 8tAXNymyRNGghlA3Pp0GsQ==
X-CSE-MsgGUID: eDJKBpMJSB+rThDnqNfq6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74963720"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74963720"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 05:41:09 -0700
X-CSE-ConnectionGUID: zbqOPPNNSc+aaF5MtTZq6A==
X-CSE-MsgGUID: 1CJBM7J+RRWO+LJMaFckGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="246942962"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 05:41:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 05:41:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 05:41:08 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 05:41:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArveOoOqppDhIN6SbBMAFJHhPHGhl/pccivX11nvNf3bRuTkKwZc+W1muv8tP6k1hV8FzTCpbZG3I628Ic0JAgo4I+rPeK6VULVoPIW1LCliZrbPBStTL1tz+tKiaHAtxf5I9lB5JkLKYSO3dvV8LhbYNNWWyraN1Ng/HkZeR8UlPzsfeEp3sxPgxVib1ZaICB4iZ4iJsJkioC+ybbuL0uZJz4QLO+oFovaK32RHrGErfQ5fFVI+TBKFGoUOqdAIFlwxCJ1jo/cjsHmU5VwNHa0ZGyp851GkRTnUHfuxaGwGY7t0rCdxJnsLVZb2ipuoDytMki2jjQImnOKxco1R7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBiatdXNa0XVJCHOF6sIbpK/9BmJwK1RQBEzqeTUCNU=;
 b=kOXUWsT5xyIXVJBm3FVxdXgYstY3sc/pS6ctCcFLqyKtouXNF/TdMhzegJSogfODESutF8X5eS3/+lml2L39XzXKdyb0deMUtk3dj1rbmRW6fpElwdemeKOj6LK5xZFJwPO7o4zEQd4f3X3PlOyIaBuGL0MpXGqCBgHWfnAQ3hqtPAiKiM/fmYNBexrAvap2bVGRa56cwMw0hFPL4hYMk+nuJbxRCV0jPgaVa4PepRMqhwI3ObhkXVOVJRf29yjVqEtsTEjRB8Ylnze7Eq3qCCBGNpaHfiS/Y1PV+w2iNyPcrEvHY3CdnfxkmmLmDVTp7FUVHBRqYE1Jjbpf74Vb+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by PH7PR11MB7719.namprd11.prod.outlook.com (2603:10b6:510:2b4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Tue, 17 Mar
 2026 12:41:01 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 12:41:01 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe: Fix mismatched include guards in header files
Thread-Topic: [PATCH] drm/xe: Fix mismatched include guards in header files
Thread-Index: AQHctV9U2Y3MBbaQU0ygdHoD4yhxbLWypysA
Date: Tue, 17 Mar 2026 12:41:01 +0000
Message-ID: <SA3PR11MB811839BC0A7222AFB96EAE4DD041A@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260316160451.1688247-2-shuicheng.lin@intel.com>
In-Reply-To: <20260316160451.1688247-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|PH7PR11MB7719:EE_
x-ms-office365-filtering-correlation-id: 3f299d81-cac6-42f5-8459-08de8422720c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: dBRU7YB5VKyohrtpaB7SB6tawA24D4oGS/QUdryPxshf77DaiLOU4HdkZZVngqviH4Vifxd1/FNGTciukrgDpGPlXgttwX7fHUQI1hOt4X/yIo+M1KKDcilUWeK5SO5kDSEmMKU9MChXF3wSk81Jsf5nJ2Y5w9+BjzfyO9N9Yiavc5f+R4lBK98A2KPc2MxhnQxJvqA8Fam6dT4Nf7WsAlaxwZ7Lse9dYPpc8bklngYmDoktXI1c9zFfRHUwstdzJINOVnsbDL80lEDyOp4UymGAYdblPeO6YIY4Yhah8wtREzRkHpLzyIEiUjNOTaOgX/YVlisjhN5xqCUsurNkUJZK2Zg9r8u387etOHmZ12vk1gXToNS7ZwxsjC+QXelKyTsRk5XX8cO8yORgnZu5unmZyy4IDzYAb5XcKz5SDWazACqgWSJj5lR2oJyyrXoWqPSqNt35964JQ61DM8MheRl2BHQss/1VY/pfAWqrG7xr2qOTNqfq/vI3SNi+kTnFGqbPCa6SbYGRInophVsUgmnmut0rHARfXn2elVK7qn+1+JJY8cmO/hYRlQZpQA5sy9wLoSdEuGJdz+EeiXg4SK6t3zcsHnqWjxSrYCcW4T+8sBJTaDrKMJJIj/y1HprLQDn7eoM/K6l3Kd0I7njwsLiEMYBY1/alEvu+ms5oj6bLIBXU+cg6sGPMOeoCLr9mvWMIx0VgoecMsCLc2O+itHFYzgeuW5brfH0ZkWTjoS5o//qhBBmul6kmVevbHW89AMxX62WDZsrlXyPW1m7+3UgJzOJfKUsF3tvDTwoKlk0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dG9ETStpWERSblNFMWpaUnQ0OWtBQWx1T25heUNUQVp1T0Evd2s5dE1WU3dj?=
 =?utf-8?B?VW5NbSt2QUlKNTRidVQzVXZmL3B2RENidUo5MnJmYUNxdFpObk52WVlUSVZk?=
 =?utf-8?B?a093OW1JNlRTVXBoSk5oclRqbFRPbjMrYjZ1WEV1SjB4Tnd0SFdEQ2tya2sy?=
 =?utf-8?B?T25raU5KWE5PbVNKT2FsRHV5T2hhWVRGUDM4YlN1NlZyckN2aWZQRUJjcmtS?=
 =?utf-8?B?Z1R3UXR2L3NERG9NS3plSHF3Wk1hVEFYZ1luT0JpZ3FYRDZNWnVWSjlMaWND?=
 =?utf-8?B?OWltdG4weml5M0EzR0tHMXcxUWYyU3p0OW9vamNSUmxySDRZeHM2ZndqOU9k?=
 =?utf-8?B?YnFwcjBrZURDaW1PN3QyZDRQekxFS0tlZmNQNEpVTXpwdmJRcWtKMURlSmMy?=
 =?utf-8?B?aERsVWEwYlNyR2JySnVubDUrWmJaZXpkL3R1NGE3Y0owUGxlbEZhRkRwalNW?=
 =?utf-8?B?alZMekMxcFZiMFJtL3lLZGJDU29GcmExaEsrRG5BZDlaQk1Bdy9PY2k3R2li?=
 =?utf-8?B?ZVJORkUrTWZFV3d4U2pEc2NWdDg0dGJyMkVZTVJibFlYWE1vSlZZelNKV3Rz?=
 =?utf-8?B?YUJ2MWZOTnV3T21lK1lmSTZHTjJRUWoxNTh6N1pmL3pDMTl2SCsweXp3K054?=
 =?utf-8?B?eGFoMU9BRjJXTzhWMzlJSEsyb1VVZWlxcW9FYVpleGUxN2lMNDdoVU95RC9V?=
 =?utf-8?B?M25BUHBHeTROM0tDRlo3MnRZRGtQREd4andVTzQwMkx1Ykl2dVIyM29iR2lp?=
 =?utf-8?B?ZkJMeUVJakRSMnBKMDhVaDFIWWRkVi9kVzBJdHlIZUozb1NpK2hMK210cXNG?=
 =?utf-8?B?SmNSSkRQZ1V6eFBJTDJ5M1Q1blRkaHQ1bzB2WTBhcTVZSVhONkYyd1QyV3hq?=
 =?utf-8?B?QjRlUjJyd3ozVzJkTWlTOVFpMmo2bUgwR2o2eFhKUS9YbU1EbjFEVFRHRXZJ?=
 =?utf-8?B?RUkwMHE5WklIR3FNR2tLWm9iMnI5eHk4SVUrS0R2TXBhNkZ2aUxsV0ExSXNE?=
 =?utf-8?B?MVI1b2kvMmhpd0pDN2R4ZHRhdEcwSTdsMGZBMG5yZ0hMdjVlczFwanVIWHRp?=
 =?utf-8?B?RzNKb2s2Rkh2V2VDNTdoTEtqRUxackdQOC9GNCt4Q0pUeENVOTJ3Z25PN2U4?=
 =?utf-8?B?UHpxZnN2Sjgya2xQZW51NE5pY3M3MHp6dlM4OEFJNG1qWkRsLzFrSFlNZmJ2?=
 =?utf-8?B?Z1A3MjdnWVQ0NjNzWFhuYlRZbzdjVGRIak16Q3VJaENxUVlhSzg2UndwcUIy?=
 =?utf-8?B?V1hhSXg3bHQ0bjgwekVnQjZ0TkpYU1VsSnVJY2JEbVJ3MmNmSHhQYS9ILzdN?=
 =?utf-8?B?U3ZlUlBNRjZMTlUvOURJZGtVWHc4emErWjUvRlFmcjhCY2xVU2xZVWFNUHhE?=
 =?utf-8?B?Vk56dUdSRW0zSUUxUmpIMWlBbi8xSllSNmRQZmNvdXVKaW5IT3kyaVY3K3ZQ?=
 =?utf-8?B?NXFlWnNIT1J5aXRNT2d6ZjY1SXVDbU5nMFFTai9vcFlpR2NIb29uL1dCdE93?=
 =?utf-8?B?Y3VPcDJhckFaOFptSnlzRnlsZlg5SnhXaG5rQ2NMWU1TTFZOOGo4NmZGYTBu?=
 =?utf-8?B?cXJLUm1jdFdyeCswbDNiUmdGcWQrVVV4c2l3S0VzTmJkVm1oTHF6cjdqUWNi?=
 =?utf-8?B?YnFqK0doaFZ2ZXJVTHozc05JeGZGTDZvM0VvLzN0UFF1c2xIMGFkaWJOeTlP?=
 =?utf-8?B?RFQ4NS81aXhHWXlTd0xkTmhDTlpqRW9LWVB0dTdUcXBVTmRxTyttQlBLcyti?=
 =?utf-8?B?TnJMVit4eEU2aVFYNDNZM0RqbUg0UXlFaVN2RWxMWnRQZVU0aTdGbVdUNkxN?=
 =?utf-8?B?eTNKMHR2VzRVMWYwUmxhUW51TnVvaTFwSG01T2tiUG5qNXl6cTNKMTA2M0xT?=
 =?utf-8?B?d3ZtL0Z5UmFTdnltaUxxdENocUZxdUxTNmhLUG4xNE5IZTZRZXJXb3NSY0VF?=
 =?utf-8?B?THF1OFV1TnI4QXE3UlQ0SXIyWHBDanRnYWtHUVdnbUg2OWF5UlFjeEtHRlNs?=
 =?utf-8?B?VlFYUlU4LzliMU10L0tObWJNVGFvRUxORlJFZk5kM3ZOejNyOXhScUJTTDd5?=
 =?utf-8?B?SnNteWVUSXJPNk1WMUxZSVAyd0lsbVN6RVQ3cFZCR2tnWHNuZ1F5cENxWjZm?=
 =?utf-8?B?MFg5MjZXWEFSWS8rTC9GY3VvZklxQStCZk5PaHp3OCtmTlV1bzhYb3FadEs1?=
 =?utf-8?B?T1lJMk9BVmlJRnVWQTRCRW5UaXBoM21FVzEvT3pkeUduYmJBb3hjQVdJUnJD?=
 =?utf-8?B?SDE4TnVHNk5WaTZNWWpFREdpSUdtVEtBdFBPdzBIM0EyY2Zud1VXZVFyY1Ji?=
 =?utf-8?B?N3Iyeng1aXMwZTNrcVQwc0liUlVmSDVEVGJ5bmNMS2VITk9WOEVHZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: krAXtwyTO4B1JcQFjnV7LltOwONYUZEb8wMQ9EXUzZ/HMAHCYbYjuoNgnF0XRr4py2QC9GAdcCOqQTRsGQdqxcbF4NMZUJ49CERAuxVQooNzCJJFxNQXQgP1/o+Shfw3To0HBA5p6mnuDvg2ZrRYys0TbPiksQFszTVsOMpBdOU4fWLd+Uk24vrWhh6DRX22yjj7mxtY4NSwAQcKMMDrdN9n1CbZCNYAIi7qsFG2Cmh0vbEKHRgCTPc0JKfp24lsgmOU96JqsHNfhYVSgvhMvA8fzSs0LXHb3oVcj3aITSnIcVPtNuBqiUclbjiAa4lvjzkCS9nFg2Oj1zMDZAfSGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f299d81-cac6-42f5-8459-08de8422720c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 12:41:01.0299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x2Hcz0Q6UF4HThv+n2GbIZWjX0q7/Ftf6UbeNZUjzXyf4w2qoiYldbVQid1P8qfp6W7pmqQZRx8O5fBrVr1w+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7719
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

SGksIA0KDQo+IEZpeCBpbmNsdWRlIGd1YXJkIG1hY3JvcyB0aGF0IGRvbid0IG1hdGNoIHRoZWly
IHJlc3BlY3RpdmUgZmlsZSBuYW1lczoNCj4gDQo+IC0geGVfZ3RfaWRsZV90eXBlcy5oOiBfWEVf
R1RfSURMRV9TWVNGU19UWVBFU19IXyAtPiBfWEVfR1RfSURMRV9UWVBFU19IXw0KPiAtIHhlX2d1
Y19leGVjX3F1ZXVlX3R5cGVzLmg6IF9YRV9HVUNfRU5HSU5FX1RZUEVTX0hfIC0+DQo+IF9YRV9H
VUNfRVhFQ19RVUVVRV9UWVBFU19IXw0KPiAtIHhlX2hlY2lfZ3NjLmg6IF9fWEVfSEVDSV9HU0Nf
REVWX0hfXyAtPiBfWEVfSEVDSV9HU0NfSF8NCj4gLSB4ZV9od19lbmdpbmVfY2xhc3Nfc3lzZnMu
aDogX1hFX0VOR0lORV9DTEFTU19TWVNGU19IXyAtPg0KPiBfWEVfSFdfRU5HSU5FX0NMQVNTX1NZ
U0ZTX0hfDQo+IC0geGVfbGF0ZV9iaW5kX2Z3X3R5cGVzLmg6IF9YRV9MQVRFX0JJTkRfVFlQRVNf
SF8gLT4NCj4gX1hFX0xBVEVfQklORF9GV19UWVBFU19IXw0KPiAtIHhlX3BsYXRmb3JtX3R5cGVz
Lmg6IF9YRV9QTEFURk9STV9JTkZPX1RZUEVTX0hfIC0+DQo+IF9YRV9QTEFURk9STV9UWVBFU19I
Xw0KPiAtIHhlX3RpbGVfcHJpbnRrLmg6IF94ZV90aWxlX3ByaW50a19IXyAtPiBfWEVfVElMRV9Q
UklOVEtfSF8NCj4gDQo+IFRoZXNlIGd1YXJkcyBhcHBlYXIgdG8gYmUgbGVmdG92ZXJzIGZyb20g
ZmlsZSByZW5hbWVzIG9yIGNvcHktcGFzdGUgZXJyb3JzLg0KPiBDb3JyZWN0aW5nIHRoZW0gdG8g
Zm9sbG93IHRoZSBzdGFuZGFyZCBjb252ZW50aW9uIG9mIG1hdGNoaW5nIHRoZSBmaWxlIG5hbWUN
Cj4gcHJldmVudHMgcG90ZW50aWFsIGluY2x1ZGUgZ3VhcmQgY29sbGlzaW9ucy4NCj4gDQo+IE5v
IGZ1bmN0aW9uYWwgY2hhbmdlIGV4cGVjdGVkLg0KPg0KIA0KVGhlIHBhdGNoIGxvb2tzIGdvb2Qg
Zm9yIGZpeGluZyB0aGUgZ2VudWluZWx5IG1pc25hbWVkIGd1YXJkcy4NCg0KTml0OiB0aGVyZSBh
cmUgYWxzbyBzb21lIHN0eWxlLW9ubHkgZ3VhcmQgbWlzbWF0Y2hlcyBpbiB4ZS8gKG1pc3Npbmcg
X0ggc3VmZml4LCBfXyB2cyBfIHByZWZpeCksIGUuZy4geGVfbWlncmF0ZS5oLCB4ZV9yZWdfc3Iu
aCwgeGVfbnZtLmgsIGV0Yy4gDQpUaG9zZSBjb3VsZCBiZSBhIGZvbGxvdy11cCBwYXRjaCBpZiBk
ZXNpcmVkLCBidXQgSSdkIGtlZXAgdGhlbSBzZXBhcmF0ZSBzaW5jZSB0aGV5J3JlIGNvc21ldGlj
IHJhdGhlciB0aGFuIGNvcnJlY3RuZXNzIGZpeGVzLg0KDQpSZXZpZXdlZC1ieTogTml0aW4gR290
ZSA8bml0aW4uci5nb3RlQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcg
TGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3RfaWRsZV90eXBlcy5oICAgICAgICAgfCA2ICsrKy0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19leGVjX3F1ZXVlX3R5cGVzLmggIHwgNCArKy0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfaGVjaV9nc2MuaCAgICAgICAgICAgICAgfCA2ICsrKy0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV9jbGFzc19zeXNmcy5oIHwgNCArKy0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfbGF0ZV9iaW5kX2Z3X3R5cGVzLmggICAgfCA0ICsrLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9wbGF0Zm9ybV90eXBlcy5oICAgICAgICB8IDQgKystLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVfcHJpbnRrLmggICAgICAgICAgIHwgNCArKy0tDQo+
ICA3IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9pZGxlX3R5cGVzLmgNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfaWRsZV90eXBlcy5oDQo+IGluZGV4IGEzNjY3YzU2
N2Y4YS4uNWI1ZDJlODM1MTAyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfaWRsZV90eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9pZGxlX3R5
cGVzLmgNCj4gQEAgLTMsOCArMyw4IEBADQo+ICAgKiBDb3B5cmlnaHQgwqkgMjAyMyBJbnRlbCBD
b3Jwb3JhdGlvbg0KPiAgICovDQo+IA0KPiAtI2lmbmRlZiBfWEVfR1RfSURMRV9TWVNGU19UWVBF
U19IXw0KPiAtI2RlZmluZSBfWEVfR1RfSURMRV9TWVNGU19UWVBFU19IXw0KPiArI2lmbmRlZiBf
WEVfR1RfSURMRV9UWVBFU19IXw0KPiArI2RlZmluZSBfWEVfR1RfSURMRV9UWVBFU19IXw0KPiAN
Cj4gICNpbmNsdWRlIDxsaW51eC9zcGlubG9jay5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVz
Lmg+DQo+IEBAIC00MCw0ICs0MCw0IEBAIHN0cnVjdCB4ZV9ndF9pZGxlIHsNCj4gIAl1NjQgKCpp
ZGxlX3Jlc2lkZW5jeSkoc3RydWN0IHhlX2d1Y19wYyAqcGMpOyAgfTsNCj4gDQo+IC0jZW5kaWYg
LyogX1hFX0dUX0lETEVfU1lTRlNfVFlQRVNfSF8gKi8NCj4gKyNlbmRpZiAvKiBfWEVfR1RfSURM
RV9UWVBFU19IXyAqLw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19l
eGVjX3F1ZXVlX3R5cGVzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2V4ZWNfcXVl
dWVfdHlwZXMuaA0KPiBpbmRleCBmZDA5MTVlZDhlYjEuLmU1ZTUzYjQyMWYyOSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19leGVjX3F1ZXVlX3R5cGVzLmgNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19leGVjX3F1ZXVlX3R5cGVzLmgNCj4gQEAgLTMs
OCArMyw4IEBADQo+ICAgKiBDb3B5cmlnaHQgwqkgMjAyMiBJbnRlbCBDb3Jwb3JhdGlvbg0KPiAg
ICovDQo+IA0KPiAtI2lmbmRlZiBfWEVfR1VDX0VOR0lORV9UWVBFU19IXw0KPiAtI2RlZmluZSBf
WEVfR1VDX0VOR0lORV9UWVBFU19IXw0KPiArI2lmbmRlZiBfWEVfR1VDX0VYRUNfUVVFVUVfVFlQ
RVNfSF8NCj4gKyNkZWZpbmUgX1hFX0dVQ19FWEVDX1FVRVVFX1RZUEVTX0hfDQo+IA0KPiAgI2lu
Y2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaGVjaV9nc2MuaA0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9oZWNpX2dzYy5oDQo+IGluZGV4IDc0NWViNjc4Mzk0Mi4uYTc2
ZjQxMjJiNzc4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaGVjaV9nc2Mu
aA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaGVjaV9nc2MuaA0KPiBAQCAtMiw4ICsy
LDggQEANCj4gIC8qDQo+ICAgKiBDb3B5cmlnaHQoYykgMjAyMywgSW50ZWwgQ29ycG9yYXRpb24u
IEFsbCByaWdodHMgcmVzZXJ2ZWQuDQo+ICAgKi8NCj4gLSNpZm5kZWYgX19YRV9IRUNJX0dTQ19E
RVZfSF9fDQo+IC0jZGVmaW5lIF9fWEVfSEVDSV9HU0NfREVWX0hfXw0KPiArI2lmbmRlZiBfWEVf
SEVDSV9HU0NfSF8NCj4gKyNkZWZpbmUgX1hFX0hFQ0lfR1NDX0hfDQo+IA0KPiAgI2luY2x1ZGUg
PGxpbnV4L3R5cGVzLmg+DQo+IA0KPiBAQCAtMzcsNCArMzcsNCBAQCBpbnQgeGVfaGVjaV9nc2Nf
aW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7ICB2b2lkDQo+IHhlX2hlY2lfZ3NjX2lycV9oYW5k
bGVyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1MzIgaWlyKTsgIHZvaWQNCj4geGVfaGVjaV9jc2Nf
aXJxX2hhbmRsZXIoc3RydWN0IHhlX2RldmljZSAqeGUsIHUzMiBpaXIpOw0KPiANCj4gLSNlbmRp
ZiAvKiBfX1hFX0hFQ0lfR1NDX0RFVl9IX18gKi8NCj4gKyNlbmRpZiAvKiBfWEVfSEVDSV9HU0Nf
SF8gKi8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfY2xh
c3Nfc3lzZnMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfY2xhc3Nfc3lz
ZnMuaA0KPiBpbmRleCAyOGEwZDdjOTA5YzAuLjM3MjI1YzFhZTUyOCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV9jbGFzc19zeXNmcy5oDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfY2xhc3Nfc3lzZnMuaA0KPiBAQCAtMyw4ICsz
LDggQEANCj4gICAqIENvcHlyaWdodCDCqSAyMDIzIEludGVsIENvcnBvcmF0aW9uDQo+ICAgKi8N
Cj4gDQo+IC0jaWZuZGVmIF9YRV9FTkdJTkVfQ0xBU1NfU1lTRlNfSF8NCj4gLSNkZWZpbmUgX1hF
X0VOR0lORV9DTEFTU19TWVNGU19IXw0KPiArI2lmbmRlZiBfWEVfSFdfRU5HSU5FX0NMQVNTX1NZ
U0ZTX0hfDQo+ICsjZGVmaW5lIF9YRV9IV19FTkdJTkVfQ0xBU1NfU1lTRlNfSF8NCj4gDQo+ICAj
aW5jbHVkZSA8bGludXgva29iamVjdC5oPg0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9sYXRlX2JpbmRfZndfdHlwZXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9sYXRlX2JpbmRfZndfdHlwZXMuaA0KPiBpbmRleCAyYThhOTg1YzM3ZTcuLjdmZGIyNGU4MTBi
MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xhdGVfYmluZF9md190eXBl
cy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9sYXRlX2JpbmRfZndfdHlwZXMuaA0K
PiBAQCAtMyw4ICszLDggQEANCj4gICAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0
aW9uDQo+ICAgKi8NCj4gDQo+IC0jaWZuZGVmIF9YRV9MQVRFX0JJTkRfVFlQRVNfSF8NCj4gLSNk
ZWZpbmUgX1hFX0xBVEVfQklORF9UWVBFU19IXw0KPiArI2lmbmRlZiBfWEVfTEFURV9CSU5EX0ZX
X1RZUEVTX0hfDQo+ICsjZGVmaW5lIF9YRV9MQVRFX0JJTkRfRldfVFlQRVNfSF8NCj4gDQo+ICAj
aW5jbHVkZSA8bGludXgvaW9zeXMtbWFwLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbGF0Zm9ybV90eXBlcy5oDQo+
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BsYXRmb3JtX3R5cGVzLmgNCj4gaW5kZXggNmNmZjM4
NTIyN2VhLi4zNDQ3ODQ4Yjc0ZTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9wbGF0Zm9ybV90eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbGF0Zm9y
bV90eXBlcy5oDQo+IEBAIC0zLDggKzMsOCBAQA0KPiAgICogQ29weXJpZ2h0IMKpIDIwMjIgSW50
ZWwgQ29ycG9yYXRpb24NCj4gICAqLw0KPiANCj4gLSNpZm5kZWYgX1hFX1BMQVRGT1JNX0lORk9f
VFlQRVNfSF8NCj4gLSNkZWZpbmUgX1hFX1BMQVRGT1JNX0lORk9fVFlQRVNfSF8NCj4gKyNpZm5k
ZWYgX1hFX1BMQVRGT1JNX1RZUEVTX0hfDQo+ICsjZGVmaW5lIF9YRV9QTEFURk9STV9UWVBFU19I
Xw0KPiANCj4gIC8qDQo+ICAgKiBLZWVwIHRoaXMgaW4gZ3JhcGhpY3MgdmVyc2lvbiBiYXNlZCBv
cmRlciBhbmQgY2hyb25vbG9naWNhbCBvcmRlciB3aXRoaW4gYSBkaWZmIC0NCj4gLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3ByaW50ay5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3RpbGVfcHJpbnRrLmgNCj4gaW5kZXggNjM2NDBhNDI2ODVkLi43Mzg0MzNhNzY0YmQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3ByaW50ay5oDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3ByaW50ay5oDQo+IEBAIC0zLDggKzMsOCBAQA0KPiAg
ICogQ29weXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9yYXRpb24NCj4gICAqLw0KPiANCj4gLSNp
Zm5kZWYgX3hlX3RpbGVfcHJpbnRrX0hfDQo+IC0jZGVmaW5lIF94ZV90aWxlX3ByaW50a19IXw0K
PiArI2lmbmRlZiBfWEVfVElMRV9QUklOVEtfSF8NCj4gKyNkZWZpbmUgX1hFX1RJTEVfUFJJTlRL
X0hfDQo+IA0KPiAgI2luY2x1ZGUgInhlX3ByaW50ay5oIg0KPiANCj4gLS0NCj4gMi40My4wDQoN
Cg==
