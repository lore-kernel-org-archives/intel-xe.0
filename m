Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9EA606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F4QM3FR0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075A810EC20;
	Mon, 26 Oct 2026 08:06:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149DA10EC15;
 Mon, 26 Oct 2026 08:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793001978; x=1824537978;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e/PBokJ1C4p98zkXak513GCRtHrx3XKnBIosOvftzTQ=;
 b=F4QM3FR079DFMBwQrMvDOvXwECMsh7IuvHguym18pcYo2Mc01uV938QP
 moYY3izDWHcnHKr6nYSIV3KwmiZ+DVAKHlFfCmmbRP+ef139xhjyAYHQa
 EWlJE0Ar81of/bgZ303oJH4yyfJLITVdTLRIjEQNIpY4XMAA30DQZoo0k
 Stig5m8mQT6qyoXkmC3HB+UyYOkdrr7vfrNDF1ZTibN4NyBP5Unjw7RRE
 wg98wDIOXvFXGGv3C16i0XI/UiIksBK07LVqZPFjWo39qdM1pC9S2TJr6
 xCMFpQQcHDVsUgAl3h2cfLA+d2cQ+0t2uzZZNiiKhDqUP37liPGctwQqS g==;
X-CSE-ConnectionGUID: nYf3CIMMSka9aRvVmwvzaQ==
X-CSE-MsgGUID: MDrbNUStSau0KyFLK44Ynw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1560523"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1560523"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 01:06:17 -0700
X-CSE-ConnectionGUID: AECfEAlOTOqcj9Qkw6zHLQ==
X-CSE-MsgGUID: U+CNZeEVRNGeSFZgddo5tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4586438"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 01:06:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 01:06:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 01:06:16 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 01:06:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZNuuI5/GqW0NbcnAEkWZet0BwTTkUYQvRH3DDXjkBJ1Y6fJ/a4H91yG1pg0X6R+HzTHU9uyHzTqHoB5p+RjO+b3IMWoZQamE0i9gsibDSPJUxXDwi3perF512Ez75i6R3J+cB/SzxCm4ke/l3Ozrz3QMNwv9z+vet2ikl9CAMouxNUB3urjI0ZQhYrGB1YD05PavmAnRl6KjLBPpGFZ/rt4mDrU1phYxXbCw14PP+YCWnrATI2kzT2xbLBs5hytYmohmTUQmwhqNnIPD9J9gJKXIoBHMH/uTSietOoI3FKw4VefyRZgIByvj2z/l4Cz3Mu6T6lihWtsGWL28mgzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/PBokJ1C4p98zkXak513GCRtHrx3XKnBIosOvftzTQ=;
 b=ie3x8+FW9RlAO8y63SQwdsk85pLF+7Uma8UhBiAzm1tvxlxldoEfPqe7l1ffyDj2rU/wbM15abi+suKfmtzMM8KgUp1BkuavGcrIF41wumApYvzpnolfuy3yEIylo19/0+MOD5oacGOgjHxM6otb+AOpxLw6PoI/EOGodomD8hNwlcJOx6cOfcJV+HDroKqmbSvI5AIakUCbS3PpZaiB0mqkfjnsqZqtVAccr0YYX6byFysdkbjSLXwQMaj83FzbXduOABoFEeXXJb+moyv9lc+oTzxBUcJ01lZVc0PdTma6DDm25dGBY5dVDYJmKOTgVafTPObJ8oNaPx+C5T7Jlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by MW4PR11MB7101.namprd11.prod.outlook.com
 (2603:10b6:303:219::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Mon, 26 Oct
 2026 08:06:08 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 08:06:07 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH v3 0/9] drm/i915/psr: PSR2 and Panel Replay with the joiner
Thread-Topic: [PATCH v3 0/9] drm/i915/psr: PSR2 and Panel Replay with the
 joiner
Thread-Index: AQHdYtVrK9as141gTEOQe+ouX9RUOrcPe7JA
Date: Mon, 26 Oct 2026 08:06:07 +0000
Message-ID: <DS4PPF69154114FA4993381ADB7FBE5C284EF612@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20261023100052.683192-1-mika.kahola@intel.com>
In-Reply-To: <20261023100052.683192-1-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|MW4PR11MB7101:EE_
x-ms-office365-filtering-correlation-id: 0d83f9b6-50f2-4ea1-5d85-08df3337fd4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|260925021311599003|22082099003|18002099003|261022105027099003|261022075727099003|261021121427099003|5023799004|11063799006|10067099003|261009223027099003|38070700021|261022115727099003|261021123027099003|260925022911599003|56012099006|260925021911599003;
x-microsoft-antispam-message-info: INS8pteSWHns/R7W5hwlpikdMu/qQNfaNz0O6eQkyrV61p3obEHzxYy94WrHCJhQE/Js4LuDXaZLn8UI0D2VvqDC2Y170mzsTvL/7n8UD/4/p3+uc2Cl9a7/RgwnztkSQ9pn8xrdvSbeY25D0uEMsGjYtOr9EuZWKN1D6iJPUk+wePtbMhV5qV5WamEWGktMI09xIOOoyH3V0UlKiqDgTpDa4H6SvKQW+3Ii8ZBhl3y5m3YqBUDXQZ9wbrMzzb39q58q2xDAUB8yYj7daoonF+3+ZJ/Ix7V8TS6UUuTPDjPFY/Pg7NDKYVEktJAcWA5ct6f/VbCjep+bwnPb8GY4SdJXqHj3eKFjUCoPEThErvN+CpUy/OE9ci7CGIs7HDWvnHO0tH4My98S90188jYr7ME4kNt182hhF5rG1ekLDcvak5kRXC3H+ILZ1E2XYVGoh0yq53oHL1IEfFQ/8qhAfcvYv1mq8tNqzd6K/6+5URANUvdmjHisVeyxLRSNijjj5Q8hagCDnDOF45FYYgZugA4DHMGb2vnY4Jrjrg3TX1XEShhCVKH40fw3X+OdJS5RHI6ONaIGquUqFfSsU3FiMCjLkNLxlC4AfL3w5E8dt4Zm76l+43pxWkxe6DX+1rshXP4lmnguYMp5rtqlPldhRP406G0DlXj578GNStbrjobipcIi0JL3hvApQG6OD/zb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(260925021311599003)(22082099003)(18002099003)(261022105027099003)(261022075727099003)(261021121427099003)(5023799004)(11063799006)(10067099003)(261009223027099003)(38070700021)(261022115727099003)(261021123027099003)(260925022911599003)(56012099006)(260925021911599003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEkwMFVtTHNGS0tRZ1ljWnRONU13SGNqbThGbVNuOHEzSkJGdVV3Y3ZrODBa?=
 =?utf-8?B?VHB6cStPcWJzSEp4ZmFXeFBZWEluWlgyeVpvbTRibHdiZ2gxckQ2ZXZlTDlt?=
 =?utf-8?B?TU5uWDBSV0o2dVZzWXBCZE9ZTDhObEF6TTE5THdFZnNkdzFFaGhKVGsvT29s?=
 =?utf-8?B?dHgybkR6Z0VyaXpsTCtCQ1drRkpiVlNpR2p6MWtYaFY1MGdIbWliQU9FUTRM?=
 =?utf-8?B?U2o4OU5udGVQaDVHZTRBdXQ0V28xbU1VYlVOVnRqTi9xYlB5dU1mTTFzYkJ1?=
 =?utf-8?B?czRhdGlnMnZPWnh6TVBRdnV6NndMWVdlMllyTnAxOTVBRDBBc1hXYjdsTEpi?=
 =?utf-8?B?clZ5aFk4bVg2NHl6WnNDOENuTXd0cVE4VkxzbDhycDIyMVUycTR0VWIzWWVE?=
 =?utf-8?B?UHBTcDNQaUs5Vm5SWnRpVXk0bVBuNi9vQ3dqcWcrVzBOa0FSbUV2STRva3Fr?=
 =?utf-8?B?T2lBSTQvZmM2U1ZmeVJZVVBzN1d0ZWs1UDgxM3p2d3BpdmRDZHFEZ2wwaEUw?=
 =?utf-8?B?YXF0R0xZd1hybUFYblRndnpQeTNDT2hSejlGaDd1cXl0aklScTM4dUR3dFpE?=
 =?utf-8?B?SEROOUhpMU1YNnNjUTJJRms0c2czVkpIKzMxZENabXZiaDV5cFNOdW41Q1BY?=
 =?utf-8?B?bng5TU9zK2ovTmovUm1WT3UzdnhuY2xkc1FrTGw5aTNuTm13SEJHdUN4YmVC?=
 =?utf-8?B?SXkrejExclZFNGpEeWpWQnlySXF6TWhRcWR5TmdmbDZSWEJvREpySGZiVGwv?=
 =?utf-8?B?Y2RyRWlzUkR0R2hzRTRLM1FGaElUMVRwK1dzeWZRTjAwd1VzMnlZMmcwTHVx?=
 =?utf-8?B?UkNOWHFsRHBaSGNJeTJVcmpCVTVjcVRiSk0wWi9kYVAxZXE5RlNhdWZpcndw?=
 =?utf-8?B?Z0o1cUo3RDU5bTRHcTRnbDRtT1BMV3FReTQ1WW5HM0ZOanI2NGpnOE82QWdP?=
 =?utf-8?B?TCtIb0lFMXZ1TDFXbmVwVm1DeHpGdHNodlNQTllRWHBuOUhKemgrMjgxQ09L?=
 =?utf-8?B?T2paMGc3eEdGYldqTjRSQ0MvREdCOHd5eFlJcjdCUmhKY2ZBbUhDak4zYm9t?=
 =?utf-8?B?anZ0ZXV1WW4wSWJ3eVhEMGZoSmx2aDNjaWh4V01CYXF0d3lwVll5dnM4MkY5?=
 =?utf-8?B?bWdqUktPZHpRbHRLNW5yL04zd3FZYnhmcHI0L0F0ZHAvTnd6VXJ0c0VPa1Ja?=
 =?utf-8?B?UEFkcmxpajVmVHRDVUx0YWJ0elhoSEdXRUFUZ0F3K2tYbTRYNm43ckNBQlRS?=
 =?utf-8?B?U1lLelRDNGJQQm1Sbk5iSUFkV214S25Ebm4ra29CMVRWcGNTYk96eG92SHhs?=
 =?utf-8?B?MlR4eTZDdWF5NElvNFVZVk1kcjlabzlmSHdaTXNRQUhqaWRKRmFUT2xPQWZF?=
 =?utf-8?B?ZnZaRm5OWGxENG1KSFJ3NE1hYm95bC9lMGNMK3VnUTdFNUI3c2Rpak1MZU1k?=
 =?utf-8?B?R3FBVC9sZUgwQ3NlNWhkaVdsanhqRUVnSmhsVjh2YmtBdTFLZlJBRVZDck9X?=
 =?utf-8?B?SStEU01KaWNrMDdraFB5SncvRVNFdDlHZnpXWWw4ZmVGMmR6UzY0dmdUVHVX?=
 =?utf-8?B?bWJRcXBRdTMrU0p6ZWtvWFV1VTA2TFh0TkxtMEZaQ0tyRjE0WmNFSHk5M2tC?=
 =?utf-8?B?ZExnalRXOVF5TmtEeE9EY1BERGRxT0lUMUZpc2xYY1pFMzJrUmljeDNhaFZV?=
 =?utf-8?B?ZWJQM00yMU9VTjZYaldQWVhpN0hCemllcXAvN3dIQzIyNFREeUhvWDlmS0pU?=
 =?utf-8?B?eU1wV1FDa0pjbTd5U1FseEZ0dHhINW1seFNCeVZWbUI5SDdvWTZXeTY1ZkMw?=
 =?utf-8?B?dzNQbGg3TmtXalcycEw0Y3AwN2g2VjRNaUdheXB5U3ZXdHN0cDhmVDFPMjRt?=
 =?utf-8?B?aW0yZGdSaHJNZkZrNlR2OWJaMTNKQjJ4S1d3ZEVHUUx2UXRGYkdJRGFmU25M?=
 =?utf-8?B?QVdPNWw3YWg5b1h4OUxqdGxiWjZoOWVSRG5VdlUyOGFheVhRNjdqbkpMMXdQ?=
 =?utf-8?B?c256SnpNd1IyTkV4ZFZFZUhGdURoY2RZbjF3TEZwcEE4UUdFTllkQ0w5NUg4?=
 =?utf-8?B?U2V3OUFlbEJmY0V2NEN3R1A2Mmc2TEhYRUdhSlpENTB6eE1DOUM1Y2VyTEg3?=
 =?utf-8?B?QWRwK2hRdnVERDE2eSt0cWJuaW5WN3lBM1ZEVXdReVFEMHV3bmdUK3FFVGtJ?=
 =?utf-8?B?MjRnMzd5UWhiMU92Y25kZGFPOUQ5T3ovRVA4dDVmNWVjVzBFMGlIVzFVMitX?=
 =?utf-8?B?UlIvS21Wdjg2UXRna2o2OWsxdm5ldGhBUWNOTVZNdWJuTDUzZldHV3Uzdlpt?=
 =?utf-8?B?N1NHMzVmZ1h0bUZWUHI5RzhUMm9VV1RvWkpRNk1jNURsN3BPS0d1UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CGgDXvglGBwjRpgRcOdwAk7T0RFd6aFJquJy9X+XtCjFyX8rx2Zoi6L4XyYyxFtPRujiSeiO9izG6I02etX+kbJJitis6+P5z3mKc4jxm2qxpOmE93M/Op3WM67RZfi0cHjovLCjBOkQseEFT09mJmKnVYHDaz23D1ViAwJOJ6FPfSyd5hDAVHeXjiudJMrB6CL+WjcTu/TNe3rd8CPYcyHdOoueongEdrslW1TgMYUg2Gn7jiu6JmNlg66aNnJFskP6c5lF8m0vzQLxo9LUD5pffZXDz47zx1qYGu9FZn0IQkJSZ+OlyxY80yOQvfcZPmecxKZI3DmKzy2dD6UyXQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d83f9b6-50f2-4ea1-5d85-08df3337fd4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 08:06:07.5245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ha1mH4A8Bfp7tm0Muckprrrs8v8WTxxfXWkdWcafWLHKVyOK1qZqeBtRRnkR4/t/3lT5W6lm6p1xooXHZl11BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7101
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IEpvdW5pIGZvciByZXZpZXdpbmcgdGhlIHNlcmllcy4NCg0KVGhlIHNlcmllcyBp
cyBub3cgbWVyZ2VkLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEth
aG9sYSwgTWlrYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIDIzIE9j
dG9iZXIgMjAyNiAxMy4wMQ0KPiBUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBIb2dhbmRlciwgSm91bmkgPGpv
dW5pLmhvZ2FuZGVyQGludGVsLmNvbT47IEthaG9sYSwgTWlrYSA8bWlrYS5rYWhvbGFAaW50ZWwu
Y29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjMgMC85XSBkcm0vaTkxNS9wc3I6IFBTUjIgYW5kIFBh
bmVsIFJlcGxheSB3aXRoIHRoZSBqb2luZXINCj4gDQo+IFRoaXMgaXMgdjMgb2YgWzFdLCB3aXRo
IHRoZSBmb2xsb3dpbmcgY2hhbmdlcw0KPiANCj4gLSBBbGwgcGlwZSBwbGFuZXMgYXJlIGluIHRo
ZSBzdGF0ZSBiZWZvcmUgdGhlIHNlbGVjdGl2ZSBmZXRjaCBjaGVjayBydW5zLA0KPiAgIHNvIHRo
ZSBsb2NhbCBkcm1fYXRvbWljX2FkZF9hZmZlY3RlZF9wbGFuZXMoKSBhbmQgdGhlIHBsYW5lIHN1
cHBvcnQNCj4gICByZWNoZWNrIGFyZSBnb25lLiBUaGUgcGxhbmUgbG9vcCBub3cgcnVucyBvbiBm
dWxsIHVwZGF0ZSBhcyB3ZWxsLA0KPiAgIHBsYW5lIHN0YXRlcyBjb21lIG91dCBvZiB0aGUgZHVw
bGljYXRlIHdpdGggYSB6ZXJvIHNpemVkIGFyZWEuDQo+IC0gTmV3IHBhdGNoIHJlc29sdmluZyB0
aGUgUFNSIGVuY29kZXJzIHRocm91Z2ggdGhlIGpvaW5lciBwcmltYXJ5LiBUaGUNCj4gICBzZWNv
bmRhcnkgaGFzIGEgemVybyB1YXBpLmVuY29kZXJfbWFzaywgc28gaW50ZWxfcHNyX2xvY2soKSwN
Cj4gICBpbnRlbF9wc3Jfd2FpdF9mb3JfaWRsZV9sb2NrZWQoKSBhbmQgdGhlIFBTUjJfTUFOX1RS
S19DVEwNCj4gICBwcm9ncmFtbWluZyB3ZXJlIGFsbCBzaWxlbnRseSBkb2luZyBub3RoaW5nIGZv
ciBpdCAoSm91bmkpDQo+IC0gQXBwbHkgdGhlIFNVIGFyZWEgV0FzIG9uIHRoZSBtZXJnZWQgYXJl
YSBpbnN0ZWFkIG9mIHBlciBwaXBlLg0KPiAgIFdhIDE0MDE5ODM0ODM2IHdhcyBza2lwcGVkIGFs
dG9nZXRoZXIgd2hlbiBvbmx5IGEgc2Vjb25kYXJ5IHBpcGUgaGFkDQo+ICAgZGFtYWdlLCBhcyBp
dCBsb29rcyBhdCB1YXBpLmVuY29kZXJfbWFzayAoSm91bmkpDQo+IC0gQmFjayB0byBwaXBlX3Ny
YyBmb3IgdGhlIHNlbGVjdGl2ZSBmZXRjaCBhcmVhIChKb3VuaSkNCj4gLSBTcGxpdCB0aGUgbWVy
Z2UgcGF0Y2ggdXAsIHRoZSBoZWxwZXIgZXh0cmFjdGlvbiBhbmQgdGhlIGFsaWdubWVudA0KPiAg
IGxvb3AgY29uZGl0aW9uIGFyZSBub3cgc2VwYXJhdGUgcGF0Y2hlcywgbGVhdmluZyB0aGUgbWVy
Z2UgcGF0Y2gNCj4gICB3aXRoIG9ubHkgdGhlIGpvaW5lciBoYW5kbGluZw0KPiANCj4gWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2ludGVsLXhlLzIwMjYxMDEyMTI0MTQ1LjE5NjAwNTAtMS1t
aWthLmthaG9sYUBpbnRlbC5jb20vDQo+IA0KPiBNaWthIEthaG9sYSAoOSk6DQo+ICAgZHJtL2k5
MTUvcHNyOiBUcmFjayBhbGwgam9pbmVkIHBpcGVzIGZvciBmcm9udGJ1ZmZlciB0cmFja2luZw0K
PiAgIGRybS9pOTE1L3BzcjogRXhjbHVkZSB0aGUgam9pbmVyIHNlY29uZGFyeSBmcm9tIGFjdGl2
ZV9ub25fcHNyX3BpcGVzDQo+ICAgZHJtL2k5MTUvcHNyOiBUYWtlIHRoZSBzZWxlY3RpdmUgZmV0
Y2ggYXJlYSBmcm9tIHBpcGVfc3JjDQo+ICAgZHJtL2k5MTUvcHNyOiBTcGxpdCB0aGUgc2VsZWN0
aXZlIGZldGNoIGNhbGN1bGF0aW9uIGludG8gaGVscGVycw0KPiAgIGRybS9pOTE1L3BzcjogRGVy
aXZlIHRoZSBhbGlnbm1lbnQgbG9vcCBjb25kaXRpb24gZnJvbSB0aGUgU1UgYXJlYQ0KPiAgIGRy
bS9pOTE1L3BzcjogTWVyZ2UgdGhlIHNlbGVjdGl2ZSBmZXRjaCBhcmVhIGFjcm9zcyBqb2luZWQg
cGlwZXMNCj4gICBkcm0vaTkxNS9wc3I6IFJlc29sdmUgdGhlIFBTUiBlbmNvZGVycyB0aHJvdWdo
IHRoZSBqb2luZXIgcHJpbWFyeQ0KPiAgIGRybS9pOTE1L3BzcjogQWxsb3cgUGFuZWwgUmVwbGF5
IGFuZCBQU1IyIHdpdGggam9pbmVyDQo+ICAgZHJtL2k5MTUvZGlzcGxheTogQWxsb3cgZm9yY2lu
ZyB0aGUgam9pbmVyIG9uIGVEUA0KPiANCj4gIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXlfZGVidWdmcy5jICB8ICAgNSArLQ0KPiAgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheV90eXBlcy5oICAgIHwgICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZHAuYyAgICAgICB8ICAxMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9wc3IuYyAgICAgIHwgMzY0ICsrKysrKysrKysrKystLS0tLQ0KPiAgNCBmaWxl
cyBjaGFuZ2VkLCAyNzQgaW5zZXJ0aW9ucygrKSwgMTA4IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0N
Cj4gMi40My4wDQoNCg==
