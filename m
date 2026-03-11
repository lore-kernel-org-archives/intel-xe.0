Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB235104BEC5
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 10:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C3210E07C;
	Wed, 11 Mar 2026 10:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j58Bjjjl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4403F10E07C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 10:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773224202; x=1804760202;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A4NXpWvQkVwiTdrlBzEOckxPpsryroo4X6YiKbZuxeg=;
 b=j58BjjjlcfMLHJTBiTjB5NmLS2YxUqv0LztKd8lQOyvZq9MLoB6ZS2H0
 JHJF2NGAKtC3W7eAl+tagnegUwXQrCdAbSyYuFChVgpIpTG5fQgAC3W/i
 qlrAccfA/ODBaueQpkVqMTjnP6w+MHfmzC812pH8jOfL7Gi46nWDeyEfc
 fvKUp7N1mXokFO1BMosP2pDPGnrd83UYE/P1ijFXFIR47Wr3SOyN879xf
 CWoBFq6ZC2fQA8Hs0A9hwYFTWuar60SWAxzsqQIGDJtVNobEoFFPvGdyG
 S5ZwpI3NZWi1yQfzqo22fCao7KzonHGsB582rTzTEpIt8TO6Z93RgFQlN w==;
X-CSE-ConnectionGUID: f0ON+24+TUO2G6ZKpHD8bg==
X-CSE-MsgGUID: QHPxSYwtTTajcG7FsVfi+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74366630"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74366630"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 03:16:42 -0700
X-CSE-ConnectionGUID: TPIFYfvXQLS+bEjtUuJAwA==
X-CSE-MsgGUID: hu6Qql99TBiOfVYaairWPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="222956776"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 03:16:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 03:16:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 03:16:41 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 03:16:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJxUAajAWcCzzFSHfs85ZzMULGB/q10J6DSJ1BEX1NVTUVWu8JK+B6CNQ7vsj/LXskHk7d/mkUZ/cRmFNYfLN4P+Op2bRZ2+d4h35duLQCgpo613rFX5prwT10XW0Km7UjaJIsBSW6plLtLArDv2ngxgjGRg7qhIwkTjAkgKNuOczRqj6vtm4SlFtfcj1gdy+RnNOrmQKyYiHvJTi1/G/vpzPKWsHSTVdeuhXmwD6T7eAVGtDyBOr9zZ0iKahnqx2RJ7CdBf33RtHvYJ7X5yO9FvOQTNoHTlJi6BujO3sci6Q7gy3MoLqinOO+R5kbFpNtcbo0ZLA4fueGw7sFrGgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4NXpWvQkVwiTdrlBzEOckxPpsryroo4X6YiKbZuxeg=;
 b=acXs2BHM5oSs+kE16lrwaPtnkii2106YXr+neLBsY0akmlO/4lwlIzqsFH/zE18Eo0LWSTXeyhou4s9YRLteP9Ge+0gKPXL1+e6d5EuttUoJXTalOwDqXj2Way6oe06Kta5gHU5efvw+6J6Zan/dHP+iHbw1UUXYe3+/O6rFEhEy0yPwr3zbbzFrA+EZRzSNfugVwOmcQzI8x1CBfosEvr3VHglOj+/qywe8zI3iUfWMCqu5INOCicGDWHQPFeX83psy8NR8zTPJ9FHbQjQeMUkIYtO/5TrfEBvqe7SOYRf1HJ1YakZJ42mczlw7dFDMVOdhD+SgBfE0j7iMsrN5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 by MW4PR11MB7007.namprd11.prod.outlook.com (2603:10b6:303:22c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 10:16:36 +0000
Received: from BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5]) by BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 10:16:36 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>, "Luse, Paul E"
 <paul.e.luse@intel.com>, "V, Mohamed Mansoor" <mohamed.mansoor.v@intel.com>,
 "Nasim, Kam" <kam.nasim@intel.com>
Subject: RE: [PATCH v9 4/6] drm/xe/sysctrl: Add System Controller
 initialization
Thread-Topic: [PATCH v9 4/6] drm/xe/sysctrl: Add System Controller
 initialization
Thread-Index: AQHcsLsYPMv90W9ciEeBtwvMZx9ZrbWpHmvA
Date: Wed, 11 Mar 2026 10:16:36 +0000
Message-ID: <BN9PR11MB524212668EA0731882EB57DA9547A@BN9PR11MB5242.namprd11.prod.outlook.com>
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
 <20260310182336.611041-12-anoop.c.vijay@intel.com>
In-Reply-To: <20260310182336.611041-12-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5242:EE_|MW4PR11MB7007:EE_
x-ms-office365-filtering-correlation-id: 04c43fa0-aa3b-42d7-123b-08de7f57470f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003|7053199007;
x-microsoft-antispam-message-info: t8C1DXPLtH5sWuPfnniElQhm0bn/DiCKdbNBGGRZ5qBVzr5BzaT1aLh1pDOlr/tBhj+Jl9B51yJ+CmYjA17EdeENM20u5grc19SiG0a6S1b4PDcCTUHm4IONmHMXoOEDBJ5THXx4qnuwj/BC8hB+34A0THvzyRM0HvAsVuZK7WRJdpQ8ji+PJuzFcxUm195OZ7jfdEi3m3b++1WMLwC9fJAW8udGDcezGWllZwkkHEpBukt+Qk9rZvqA/nIKGeeuJp3V7QRvUUWaICBbmjk89ljOmNAw5DlLjRTV3eZKAs8UJArVd6/UeQwpjYl2xXqzNQX6fZL8u2EE8HOWud2mF+p6C3fT0WLc68AJ90Iy1lQ3OGjduUpXw5BypT6MUrGfA2hNtk5HX6cI00t8SflMbHXKCN8df5aYdcGYz2NV/qDah9m9QwnKDORcGXWRNI0UBok2ge3lkYqUDgPCURzvuuvIpP9oP5cCoBAAbgb10y2LZbUdiYFEqzm1lAxI5LukGzQjHw2rR8oJsrmhMq+QzL5Twy3kwSdFodXlHyjs+UwaYD7haD64CHz4eZb7YbfZwFsEey8HBcApnXa/MaiJlrouv2YS/ZLn+C+UZQiHpjrLvox5Og2bpt2bf7oXr6avIMZmG5HWCt/Jcyx8WKgNArbUzYgHWvsqj4U6yLS78HI9yGIZm+anKGL5CWILHkxpcrGoUz5JqCm1OOVXTlAtExP/8wJYYg/Gg4OTXKadPm51fxuP2JW4kzT+vik+M9LE9amswU94gIEipytI8t1V1S627u6eFtH32UCIjq5omJI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5242.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjNkRGV3T0xyVkI4L1FFdWd2bWU0WTlKaktpaGg1aUdleitNYytaMk5FZzZE?=
 =?utf-8?B?VE5kU0hpNzFUV2dEeXRiOWdLbmZVYlpRWThyL04xTlMwWmUzbUZ2Vm9nVCth?=
 =?utf-8?B?K1hyQnVsbDdHcGhhaTVhQkppMWJCd1lyYnhtMzQwZHIzcURZZ3hla3JGdE13?=
 =?utf-8?B?eHkxaGo1YU9iUFJySFh4cUJTc29rN0tUZGkreHJSZHRBTVA3SlJjRk5SNi9O?=
 =?utf-8?B?UVJUbUl1SEFUaFc0WE1vVnBScm9McEhRMGJwYVRkU2YzcWJwSVY0Q2JrUW90?=
 =?utf-8?B?MnJuRGZkMXR6bHgrNlY4UytBcmNjck1xWGo3eW81WTloZE81bEhZK1VYdkNZ?=
 =?utf-8?B?Q0w1R2NMREJhcGFIdmJ1UEFOMXFFZFFzSG4rT0pTWnNXelJ5UHdpV3B0bm1y?=
 =?utf-8?B?TVNUZ28vREIwRXhEVS9WdThrNi9semZ0SmxSaFlWcFBPSlkxcG1JMXBGdCt6?=
 =?utf-8?B?YndPK2NRRFNuY0JaYjZwRFR6bTl2UHlzeGYza0doMGpsU2NyMDlkNWI3cEFL?=
 =?utf-8?B?eFdHU1RjWHdIV3pDMVZSU091UlJjV0x3dGlOeEpHQ0lmd1ZpREd3MTlYT2c0?=
 =?utf-8?B?MmtvRCtMZm8waWtrRW8rbXQzSnM3YkhYSUVOcG5NdmdnR3dteGhLclMvLzBS?=
 =?utf-8?B?ZVFTUkNlRkdrMTQwZDZ1QjlmR3dkOHVlQitiM3V1QTE3RkxRNnRITWxpYTJp?=
 =?utf-8?B?U0YveXdHVkR3TzBTQ1Jrb2RrOUVVQkpqUDZDb3N4SThQQzJmZXgvc1czZGtn?=
 =?utf-8?B?amZramhsZ3BTWjVZd2Q3ZUVQM1c0ZEJPNHdrL1VKZ2dDN3NFd2VocHQvZHQy?=
 =?utf-8?B?MDBleDk1QXhPK0p2MGVRMUl2d0lwZGZseWZZREVXOER4Z1hwdFlUbHdINnk2?=
 =?utf-8?B?U2JwKzVmWjBDOGxUK0lEMk5GU2M2OUhtem5xbURWNEhWMTl1L21wd0FvZkhh?=
 =?utf-8?B?YzlWR2ZOK0lRaEpiRnpPN3BZRVZWMGhTU1BNVEZyZm1WVHQ1Q3dwbk5yQkpJ?=
 =?utf-8?B?VEMwRU9lTy9xOGxMVW9QQVJnUXZmOGNnREhEOUdTVVRRRHRZdmtaTnI1cG5O?=
 =?utf-8?B?aGt2TGNIa0p6Tk9oSkNGZWwyamZIdm9lVTg1eVpyMGF5QzFKZy9GQ2FFbXZF?=
 =?utf-8?B?UG5NVUFRcFVRRGZCRTNMTklQZU44emJ4QzFZRFhFM2pVRUJ6M0R6anZ3QVIw?=
 =?utf-8?B?SXZEYlBSRzNjVEszWEovbjYzRlorWXByUGRhaTdQeUYwVStaazQvcVlyL0ky?=
 =?utf-8?B?WXREdEJoa2hXNFQ3NDlXLzBhRm5qOFREekFkRk1NQW5JSkpXWEc3ZElrZHow?=
 =?utf-8?B?UllLN0R1NDl0dHBNNXI3OGE1djNRaVUrQndNS3d2LzREMUlSbjA1SHl1T2FD?=
 =?utf-8?B?YWl5L2JwNXgvVlM4WUgybDlub2kremF2SXcvc0s4bTVuTXRWNU9tYnZxalFF?=
 =?utf-8?B?bXFWek4welh5UHhncG5nenJKZWw5aVdUN0NnTVVnTHZ0aWVMcjhYakwrekly?=
 =?utf-8?B?dVVhR0Z6OE02UG1ZR0x1eWtBSXZ4cTdzZ3BrQlZHdmR4WGY3TU1uSk9lOFBs?=
 =?utf-8?B?dTVwUmFuc2JZNUMyVFczVE4zTkc4d3F5U0twNEMvOXdWWXdCR1VUVVJVdURU?=
 =?utf-8?B?cFdnR2Y5ejV1Z1JGYm14YWQ0RG1qUHdBZDRVZytaNyt5Rm1sTHVWY21JUjJw?=
 =?utf-8?B?VUFDTExqZ3NwL0RsMEJYcXh1UG05YkF2RU1ibzlnU0VUWVBaRTJsL1hSd3VF?=
 =?utf-8?B?Q2F2eEdXdXpnSXVvL3JuRGx5ZUQxTWlpZk14d3NVc3NGRXp2cjFrSDJhQ2lu?=
 =?utf-8?B?dUVnakhBUXNudVBGc1NmenJXREc3WS9iMXVjd3RsYkJQdjk3Z00wLzU0RFhw?=
 =?utf-8?B?dGJ5SjFDUyswWFpTTy9LZC83RTR1LzAvOXZtTmJteXBWQ1pxQkU4MUlaRWRu?=
 =?utf-8?B?UytLVEQ0YS8yQzFiakdMK2dIZTVUNVZZWXhOaTQwdnpOdjdLVEdWUHlEYlox?=
 =?utf-8?B?ckVBVVBXL215SVJWMFFVUitVcThUekpocDRpS1dycHdLOWZDN0Q3WGVBeXVa?=
 =?utf-8?B?aXRhNGRLa2dlV3dqM25IZUEyL09Gd1pDZThyV0c1aDJpcG01TnVSNURUN1dz?=
 =?utf-8?B?RkR1cUhMWTFLdVFvbTFDemJRWW5ZeXdsVm1PR1ZFbGJKR1JKbEpKZzZGMTg1?=
 =?utf-8?B?MzBTa284VkJENzNSd3pIYkpVQzhqZk90d3pKM3BHRFNDbEZvS2J2aFNYK0lK?=
 =?utf-8?B?UEpHazVodGRTYmhyYzJmdTc1OENubFRJUzhVeTU5a0VQQ3hLZVI4YzQ4K3Fq?=
 =?utf-8?B?cTd2QmFERi84TG9YaVkrU1dhdWZBRC9BaHFCV09lQkMzVHZuQ25JQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ym/c0ecyQxTKYgFD6qYT9UVmarZywaN6dJuk5qwaNLgipMt22kfcxTU71b+kPnNNqx9HIZn2qxJfMAcmDzeBfQH/etZDV2JMVArZUaZV0ZMnPcQrmDdXtOrkQr+0xdA7dh+8P1s42ksKAyxYR7tJ0DiPehrBzRixaG5cNdfnlYBckH+44Y1ORJmdg9oyHfwzsX/FA2sklXm1+9DiD81wnMdlbHHW5E0i/6zJF8TfCFKZrIvQhYeSkmYrLtJ4oojs9AmVsPxsMMpwaGM3rdiZwrrGeWq4c/8BsnE7w9LVcMjXjoNdld9X1TLi1qOtsL/iqv0292mzPHxaAMuJaSvNWg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5242.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c43fa0-aa3b-42d7-123b-08de7f57470f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 10:16:36.4222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2q7Wcc4+Zg9DA6RJFFZYnfHhrntw4jq14fKhQXGLlfGGG4j8lXoTjqNM4Epg0AjHBEiswVJ8yZYmUWMGt1FBqz1kLqZCx690lg3MhIgnNjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7007
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmlqYXksIEFub29wIEMg
PGFub29wLmMudmlqYXlAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAxMCwgMjAy
NiAxMTo1MyBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBO
ZXJsaWdlIFJhbWFwcGEsIFVtZXNoIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPjsg
TmlsYXdhciwNCj4gQmFkYWwgPGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPjsgVml2aSwgUm9kcmln
byA8cm9kcmlnby52aXZpQGludGVsLmNvbT47DQo+IElkZGFtc2V0dHksIEFyYXZpbmQgPGFyYXZp
bmQuaWRkYW1zZXR0eUBpbnRlbC5jb20+OyBUYXVybywgUmlhbmENCj4gPHJpYW5hLnRhdXJvQGlu
dGVsLmNvbT47IEd1cHRhLCBBbnNodW1hbiA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPjsNCj4g
Um9wZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47IFJ1aGwsIE1pY2hh
ZWwgSg0KPiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPjsgTHVzZSwgUGF1bCBFIDxwYXVsLmUu
bHVzZUBpbnRlbC5jb20+OyBWLA0KPiBNb2hhbWVkIE1hbnNvb3IgPG1vaGFtZWQubWFuc29vci52
QGludGVsLmNvbT47IE5hc2ltLCBLYW0NCj4gPGthbS5uYXNpbUBpbnRlbC5jb20+OyBWaWpheSwg
QW5vb3AgQyA8YW5vb3AuYy52aWpheUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2OSA0
LzZdIGRybS94ZS9zeXNjdHJsOiBBZGQgU3lzdGVtIENvbnRyb2xsZXIgaW5pdGlhbGl6YXRpb24N
Cj4gDQo+IEZyb206IEFub29wIFZpamF5IDxhbm9vcC5jLnZpamF5QGludGVsLmNvbT4NCj4gDQo+
IEFkZCBpbml0aWFsaXphdGlvbiBpbmZyYXN0cnVjdHVyZSBmb3IgU3lzdGVtIENvbnRyb2xsZXIg
c3Vic3lzdGVtOg0KPiAtIHhlX3N5c2N0cmxfaW5pdCgpIGFuZCBjbGVhbnVwIGhhbmRsZXINCj4g
LSBJbnRlZ3JhdGlvbiBpbnRvIHhlX2RldmljZV9wcm9iZSgpDQo+IC0gTWFrZWZpbGUgYnVpbGQg
aW5jbHVzaW9uDQo+IA0KPiBJbml0aWFsaXphdGlvbiBmbG93IHdpbGwgY2hlY2sgcGxhdGZvcm0g
c3VwcG9ydCB2aWEgaGFzX3N5c2N0cmwgZmxhZyBhbmQgY29uZmlndXJlDQo+IG1haWxib3ggcmVn
aW9uIHRocm91Z2ggU09DIHJlbWFwcGVyIGludGVyZmFjZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTog
QW5vb3AgVmlqYXkgPGFub29wLmMudmlqYXlAaW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTogVW1l
c2ggTmVybGlnZSBSYW1hcHBhIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPg0KPiAt
LS0NCj4gdjg6IChNYXR0LCBNaWNoYWwsIFNodWljaGVuZykNCj4gLSBGaXhlZCBpbmNsdWRlIG9y
ZGVyDQo+IC0gQWRkZWQgVkYgY2hlY2sNCj4gLSBDb252ZXJ0ZWQgcnVudGltZSBjaGVja3MgdG8g
YXNzZXJ0aW9ucw0KPiAtIEFkZGVkIHNjX3RvX3hlKCkgaGVscGVyDQo+IC0gRml4ZWQga2VybmVs
LWRvYyBzeW50YXgNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUgICAgIHwg
IDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jICB8ICA1ICsrICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfc3lzY3RybC5jIHwgODINCj4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrICBkcml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybC5oIHwgMjENCj4gKysrKysr
KysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDEwOSBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5c2N0cmwuYyAgY3JlYXRlIG1vZGUgMTAw
NjQ0DQo+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsLmgNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZp
bGUgaW5kZXgNCj4gZjYzZmRmODAwNTVhLi43NmE4NjgxODk4NmEgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFr
ZWZpbGUNCj4gQEAgLTEyMyw2ICsxMjMsNyBAQCB4ZS15ICs9IHhlX2JiLm8gXA0KPiAgCXhlX3N0
ZXAubyBcDQo+ICAJeGVfc3Vydml2YWJpbGl0eV9tb2RlLm8gXA0KPiAgCXhlX3N5bmMubyBcDQo+
ICsJeGVfc3lzY3RybC5vIFwNCj4gIAl4ZV90aWxlLm8gXA0KPiAgCXhlX3RpbGVfc3lzZnMubyBc
DQo+ICAJeGVfdGxiX2ludmFsLm8gXA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+IGluZGV4IGU3
N2EzYTNkYjczZC4uYzcwZDRhZTQxM2E5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+
IEBAIC02NSw2ICs2NSw3IEBADQo+ICAjaW5jbHVkZSAieGVfc3Vydml2YWJpbGl0eV9tb2RlLmgi
DQo+ICAjaW5jbHVkZSAieGVfc3Jpb3YuaCINCj4gICNpbmNsdWRlICJ4ZV9zdm0uaCINCj4gKyNp
bmNsdWRlICJ4ZV9zeXNjdHJsLmgiDQo+ICAjaW5jbHVkZSAieGVfdGlsZS5oIg0KPiAgI2luY2x1
ZGUgInhlX3R0bV9zdG9sZW5fbWdyLmgiDQo+ICAjaW5jbHVkZSAieGVfdHRtX3N5c19tZ3IuaCIN
Cj4gQEAgLTk4NSw2ICs5ODYsMTAgQEAgaW50IHhlX2RldmljZV9wcm9iZShzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSkNCj4gIAlpZiAoZXJyKQ0KPiAgCQlnb3RvIGVycl91bnJlZ2lzdGVyX2Rpc3BsYXk7
DQo+IA0KPiArCWVyciA9IHhlX3N5c2N0cmxfaW5pdCh4ZSk7DQo+ICsJaWYgKGVycikNCj4gKwkJ
Z290byBlcnJfdW5yZWdpc3Rlcl9kaXNwbGF5Ow0KPiArDQo+ICAJZXJyID0geGVfZGV2aWNlX3N5
c2ZzX2luaXQoeGUpOw0KPiAgCWlmIChlcnIpDQo+ICAJCWdvdG8gZXJyX3VucmVnaXN0ZXJfZGlz
cGxheTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsLmMgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybC5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uMjc1MWZlMjVhNmZmDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5c2N0cmwuYw0KPiBAQCAtMCwwICsxLDgyIEBADQo+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKp
IDIwMjYgSW50ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgv
ZGV2aWNlLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4NCj4gKw0KPiArI2luY2x1ZGUg
PGRybS9kcm1fbWFuYWdlZC5oPg0KPiArDQo+ICsjaW5jbHVkZSAicmVncy94ZV9zeXNjdHJsX3Jl
Z3MuaCINCj4gKyNpbmNsdWRlICJ4ZV9hc3NlcnQuaCINCj4gKyNpbmNsdWRlICJ4ZV9kZXZpY2Uu
aCINCj4gKyNpbmNsdWRlICJ4ZV9tbWlvLmgiDQo+ICsjaW5jbHVkZSAieGVfcHJpbnRrLmgiDQo+
ICsjaW5jbHVkZSAieGVfc29jX3JlbWFwcGVyLmgiDQo+ICsjaW5jbHVkZSAieGVfc3Jpb3YuaCIN
Cj4gKyNpbmNsdWRlICJ4ZV9zeXNjdHJsLmgiDQo+ICsjaW5jbHVkZSAieGVfc3lzY3RybF9tYWls
Ym94LmgiDQo+ICsjaW5jbHVkZSAieGVfc3lzY3RybF90eXBlcy5oIg0KPiArDQo+ICsvKioNCj4g
KyAqIERPQzogU3lzdGVtIENvbnRyb2xsZXIgKHN5c2N0cmwpDQo+ICsgKg0KPiArICogVGhlIFN5
c3RlbSBDb250cm9sbGVyIChzeXNjdHJsKSBpcyBhbiBlbWJlZGRlZCBtaWNyb2NvbnRyb2xsZXIg
aW4NCj4gK0ludGVsIEdQVXMNCk5pdHBpY2sgLCBpdCBzaG91bGQgYmUgaW50ZWwgZEdQVQ0KPiAr
ICogcmVzcG9uc2libGUgZm9yIG1hbmFnaW5nIHZhcmlvdXMgbG93LWxldmVsIHBsYXRmb3JtIGZ1
bmN0aW9ucy4NCj4gK0NvbW11bmljYXRpb24NCj4gKyAqIGJldHdlZW4gdGhlIGRyaXZlciBhbmQg
dGhlIFN5c3RlbSBDb250cm9sbGVyIG9jY3VycyB2aWEgYSBtYWlsYm94DQo+ICtpbnRlcmZhY2Us
DQo+ICsgKiBlbmFibGluZyB0aGUgZXhjaGFuZ2Ugb2YgY29tbWFuZHMgYW5kIHJlc3BvbnNlcy4N
Cj4gKyAqDQo+ICsgKiBUaGlzIG1vZHVsZSBwcm92aWRlcyBpbml0aWFsaXphdGlvbiByb3V0aW5l
cyBhbmQgaGVscGVyIGZ1bmN0aW9ucyB0bw0KPiAraW50ZXJhY3QNCj4gKyAqIHdpdGggdGhlIFN5
c3RlbSBDb250cm9sbGVyIHRocm91Z2ggdGhlIG1haWxib3guDQo+ICsgKi8NCj4gK3N0YXRpYyB2
b2lkIHN5c2N0cmxfZmluaSh2b2lkICphcmcpDQo+ICt7DQo+ICsJc3RydWN0IHhlX2RldmljZSAq
eGUgPSBhcmc7DQo+ICsNCj4gKwl4ZS0+c29jX3JlbWFwcGVyLnNldF9zeXNjdHJsX3JlZ2lvbih4
ZSwgMCk7IH0NCj4gKw0KPiArLyoqDQo+ICsgKiB4ZV9zeXNjdHJsX2luaXQoKSAtIEluaXRpYWxp
emUgU3lzdGVtIENvbnRyb2xsZXIgc3Vic3lzdGVtDQo+ICsgKiBAeGU6IHhlIGRldmljZSBpbnN0
YW5jZQ0KPiArICoNCj4gKyAqIEVudHJ5IHBvaW50IGZvciBTeXN0ZW0gQ29udHJvbGxlciBpbml0
aWFsaXphdGlvbiwgY2FsbGVkIGZyb20NCj4geGVfZGV2aWNlX3Byb2JlLg0KPiArICogVGhpcyBm
dW5jdGlvbiBjaGVja3MgcGxhdGZvcm0gc3VwcG9ydCBhbmQgaW5pdGlhbGl6ZXMgdGhlIHN5c3Rl
bSBjb250cm9sbGVyLg0KPiArICoNCj4gKyAqIFJldHVybjogMCBvbiBzdWNjZXNzLCBlcnJvciBj
b2RlIG9uIGZhaWx1cmUgICovIGludA0KPiAreGVfc3lzY3RybF9pbml0KHN0cnVjdCB4ZV9kZXZp
Y2UgKnhlKSB7DQo+ICsJc3RydWN0IHhlX3RpbGUgKnRpbGUgPSB4ZV9kZXZpY2VfZ2V0X3Jvb3Rf
dGlsZSh4ZSk7DQo+ICsJc3RydWN0IHhlX3N5c2N0cmwgKnNjID0gJnhlLT5zYzsNCj4gKwlpbnQg
cmV0Ow0KPiArDQo+ICsJaWYgKCF4ZS0+aW5mby5oYXNfc3lzY3RybCkNCj4gKwkJcmV0dXJuIDA7
DQo+ICsNCj4gKwlpZiAoSVNfU1JJT1ZfVkYoeGUpKQ0KPiArCQlyZXR1cm4gMDsNCj4gKw0KPiAr
CXhlX2Fzc2VydCh4ZSwgeGUtPnNvY19yZW1hcHBlci5zZXRfc3lzY3RybF9yZWdpb24pOw0KPiAr
DQo+ICsJeGUtPnNvY19yZW1hcHBlci5zZXRfc3lzY3RybF9yZWdpb24oeGUsIFNZU0NUUkxfTUFJ
TEJPWF9JTkRFWCk7DQo+ICsNCj4gKwlyZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoeGUt
PmRybS5kZXYsIHN5c2N0cmxfZmluaSwgeGUpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiBy
ZXQ7DQo+ICsNCj4gKwlzYy0+bW1pbyA9IGRldm1fa3phbGxvYyh4ZS0+ZHJtLmRldiwgc2l6ZW9m
KCpzYy0+bW1pbyksDQo+IEdGUF9LRVJORUwpOw0KPiArCWlmICghc2MtPm1taW8pDQo+ICsJCXJl
dHVybiAtRU5PTUVNOw0KPiArDQo+ICsJeGVfbW1pb19pbml0KHNjLT5tbWlvLCB0aWxlLCB0aWxl
LT5tbWlvLnJlZ3MsIHRpbGUtPm1taW8ucmVnc19zaXplKTsNCj4gKwlzYy0+bW1pby0+YWRqX29m
ZnNldCA9IFNZU0NUUkxfQkFTRTsNCj4gKwlzYy0+bW1pby0+YWRqX2xpbWl0ID0gVTMyX01BWDsN
Cj4gKw0KPiArCXJldCA9IGRybW1fbXV0ZXhfaW5pdCgmeGUtPmRybSwgJnNjLT5jbWRfbG9jayk7
DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXJldHVybiAwOw0KPiAr
fQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5c2N0cmwuaCBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXgg
MDAwMDAwMDAwMDAwLi5kNWQ4NzM1MDM4YWUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybC5oDQo+IEBAIC0wLDAgKzEsMjEgQEANCj4gKy8qIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgwqkg
MjAyNiBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKyNpZm5kZWYgX1hFX1NZU0NU
UkxfSF8NCj4gKyNkZWZpbmUgX1hFX1NZU0NUUkxfSF8NCj4gKw0KPiArI2luY2x1ZGUgPGxpbnV4
L2NvbnRhaW5lcl9vZi5oPg0KPiArDQo+ICsjaW5jbHVkZSAieGVfZGV2aWNlX3R5cGVzLmgiDQo+
ICsjaW5jbHVkZSAieGVfc3lzY3RybF90eXBlcy5oIg0KPiArDQo+ICtzdGF0aWMgaW5saW5lIHN0
cnVjdCB4ZV9kZXZpY2UgKnNjX3RvX3hlKHN0cnVjdCB4ZV9zeXNjdHJsICpzYykgew0KPiArCXJl
dHVybiBjb250YWluZXJfb2Yoc2MsIHN0cnVjdCB4ZV9kZXZpY2UsIHNjKTsgfQ0KPiArDQo+ICtp
bnQgeGVfc3lzY3RybF9pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gKw0KPiArI2VuZGlm
DQo+IC0tDQo+IDIuNDMuMA0KDQo=
