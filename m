Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D91C531CB
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 08:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302AB10E55A;
	Thu, 23 Jul 2026 08:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdmhUQIQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A85E10E544;
 Thu, 23 Jul 2026 08:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784794831; x=1816330831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iIvGh6idpi9hChdo1T5x5oNGsTJgJkHNGAOMUy7NJPI=;
 b=KdmhUQIQCdC/PpuatsBZk3OAoBy80djIiDrz6BYlVIFj7H5uy3KmVpsv
 IOi8DAooPMtPtHE+baKIec/9xevElJ7JdILB29jpw2FBK+OI20r+gPjoL
 zvB+EYeTTCVFmp6a68MWctR9+Y472hgbTLeZzi2sMq2l1trBvwNN3pVNn
 Zj5CJ17bm3GtrUuxl5SvBabtrsu9qSNMv4uFDm8u+ktoP5psDjGg5Pito
 94gkER4/bu1iw/uPGDH6xgvY726mvj1cjZOSEytTp1RuwgdN+MHvi/YO+
 Yo7coLJtfJn7nsrADXc6hiNr7KZz4jrqXH471Kw3jvP9q3t/jZX1oo1OJ Q==;
X-CSE-ConnectionGUID: xlYrfCuhQC2CBYuA01OSew==
X-CSE-MsgGUID: LH6ss7IJQyOVFLrrRwQiSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85388505"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85388505"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:20:26 -0700
X-CSE-ConnectionGUID: oyG+6U7FRi2s+jBHo69HKw==
X-CSE-MsgGUID: ph8Gq42aRh6c0uNp4+1HKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="260305754"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:20:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 01:20:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 01:20:21 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 01:20:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLWghkRIaSEACvDjGyu/D1w/ojHHc5Uxz4DilsNEZSvbFXtHuVilekMnh2OfSMlyjxpqvFQwi3wVTKdwn7X9GPlqN2wMt0gQTSGAvMNAMCJgZO1TPucJm2PuMyrP6bQvp21pWE1+Y08cbXJmrludd5m1jIhJY7kyWSjxqVbhcWbX9kF+SNrjZeWpPPKdWgSF4J27TIx7hHG7tra8BBlaEtknzPeDC8fRfUBwN4abgG7hxCKW/VniKg3Ej+q9E4/k5xCQl2kS673LKw9RBhJ/JReuF8xSAzmyC93yRxbv6YXivXwzc3QxEemD0hwCTAG/DH1NTlN/yAwI3mXQh0rZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIvGh6idpi9hChdo1T5x5oNGsTJgJkHNGAOMUy7NJPI=;
 b=s+SCdtOEIn+ZKo8znHFgRbwYYIGgt1XiPIo7/HRNzKa4MkctZncfFd7PwJPhbanjiRCrZjvJws4yWUyMtVg0MvARcDaLaBjf4JmWriRa9sbpt1ufFrFj6hu7/wBgbefdaTz/+3WRSwWH1GsILMk0REO/1LXGKAZZfa+IuOE3Rg/BByheBj50lC65fb+E/ad8D+HRoza1F8nFgR6uqxOvl0B9pV2jNt/0ELuvEHw9qhBsUNyc1gz7eis5UvSk06n+JurxASE+34bObGSC463vP5fz3HOjG1lllkMVQoV1baAstAw+qkLTpxuBthX9knDB2kzLyrWCFHEdepRPSyemdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH8PR11MB6855.namprd11.prod.outlook.com (2603:10b6:510:22c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Thu, 23 Jul
 2026 08:20:18 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 08:20:18 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe/display: Expose plane max width/height
 helpers to global scope
Thread-Topic: [PATCH v2 1/3] drm/xe/display: Expose plane max width/height
 helpers to global scope
Thread-Index: AQHdGd2J2yhUgbcUa0GZLaATSVSWJbZ6xHMA
Date: Thu, 23 Jul 2026 08:20:17 +0000
Message-ID: <5dd78fc3809c648e163c02a6407bd8f082f7f472.camel@intel.com>
References: <20260722132448.318112-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260722132448.318112-1-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH8PR11MB6855:EE_
x-ms-office365-filtering-correlation-id: ec9725ac-97f0-49ad-66fd-08dee8933aee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10070799003|38070700021|3023799007|11063799006|10067099003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: MQ9sniPJWIrBXNEpJkNipvsy3WE3C1XaJM3VMg3jtL2duaZFTMEnYCqHgtThy6nKs/phfyKnM5J9EfLVwbqPmZhrMqaeiYVfzxXGSN5XoTlbfJQ1/mF+OL/3qUj1QR1jlHCumzsaoXX0taVVfH4M5vJHUtR4Ousm+FRhHP5WLEPysacLDG81GAuaJFjH1fIpAKRn7/DQEvrmmEXMA0qVt4jWtxJFhqESC+LjjwCWJfvvueixcv+e98ZRkXjb3x5vnDW7tMa31ckW0/8/KRgvyUdm8Nc4hfs9SoSHEjhblMaTHMIaksJHaJK2B/WBCsjScz61CrZkKeGZPz2vDAOm17+TLKmKVBFczzIWMu35ZeiJwxWLIEEz+4bSDpoC7QQExvRWCus99Yk5kMLZX9YZsE95QcFMpRqxrF6AdhXMAm0aHKl/nnn4SwvxIi/lPXkSXyF5J07S2k6DveOUcfSp79ESOjnvtjNfqV8lZpr4FcrNYd0E4wkOHkwXM2+iE3pIbH9cewb5dyowQh/pt/627xja9f1NLEwd9xGMlSW91+aB+iDqkzLsYyVRAhASjhvhksbwLp7pksEniA9fy+llaKvpIc/6wIqMlmvtAY30ehzS/aS8541wu6zELO8x8+zCR3XAd2PsmN1EO8bubptj1dm19LWJKU6sNOLDDFD7FlXvqal/zf3msCzWyFGXsNeg9ksWlLuo2BaMNPXfdfgSnAqdscChYSUkSpUheoClU/g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(38070700021)(3023799007)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGo5d2NBNzFkRGNKZ1VjR0p1ekY0UzlOUjRsd1NOR2xVeisxUVZYbGltVmtM?=
 =?utf-8?B?MmRoZ1k5U0dIeWR6ZHJtSGZGaUtKK2JSeFp3RjhWbzhOT3JPa3M1cWRJa2dC?=
 =?utf-8?B?bjUrcmhFUlFlZURsL0RSNktuMlNvb2l2ZDVOMGoyMndpMUVUaDVTb1BkQTln?=
 =?utf-8?B?dTEra1BBVW94TnNpU0pxZlphMnVPUm5BbVJVRmh3Um5VRnViTzdIWVEzclNT?=
 =?utf-8?B?SGsyeVU3YUhPczgvbTdDVEhlODVHSzhscDAvak44akJwaDFxUDB2SnRuaGNF?=
 =?utf-8?B?QmppVENhMHpTWFQwbkdiUVIyQVg5ZFpkVGIybmROMlFiOHp3RXd5WFRXMU5N?=
 =?utf-8?B?UTRZMHZMczU4M0xnU04rT2xmQW1xM1p1bU1nNklWWVI2UitKSGpCaFA2SmNC?=
 =?utf-8?B?Zm1teFlHaDRRZHJuWXhXczZmMGJHT2RQZldmUzc3ZlZqMzM4SHQ5a0dlVSt2?=
 =?utf-8?B?SEF3S2FIOHBWYk9vWGxyZUNIZ20xRXZ1Vm8xbXFyVHJodnhoVUs0bGphbG5s?=
 =?utf-8?B?TlNsYmtLRWRsNnh6VWZpWmFaajJWbmpvZXAzbko0bWlPeXp5Y1BwZldYcFB0?=
 =?utf-8?B?R0ludndvUVpJNU9lbVgwQkcwcmptUkxQSkxQdmswV0hESmNyYms4cXFBMkZE?=
 =?utf-8?B?RGc2Y3JuNXF0WXIxblVadTFBenI0ZGpsZjl5U3d1VmFxaXJuWEpiNzRBQ1Rw?=
 =?utf-8?B?bWh4cGd6NmhzZFQwckxYN1ByT3c0WXhNWklMTFBMNHJyNGR5TWNudFhuWFRQ?=
 =?utf-8?B?VU9wMDVERWJUeVdERlBmd0NWUGdFL3JhYXJEZTBtU3RvWUc0OC9PM2ZETk1R?=
 =?utf-8?B?NnVGckhJMWQ0cnd1REtjM3FLMkFmNmFTY1BjdWc2c3pGeWpYN1kyZ3VhL1ZX?=
 =?utf-8?B?anRMSGNmbXNMaXA4VGpUVTJDUURYcHUyWmk1RGFCcFM3ZmZYL0VzRXRXbWo1?=
 =?utf-8?B?cHNZelRjZytZY1JGbU0reVp1elFxUnNzczJYK09iL2JWeDh6NGR3bXVwai96?=
 =?utf-8?B?eGlJLzVJVlhBR3FSVE8vbi83L0lWRTd3b1cvSmxaWEJuSUZad1I1U21SUkhR?=
 =?utf-8?B?WVQyYkJyNjVvMHM1SVlSenBYd2VqanRCcE1neHMvUjZXUnJUa1RVaGFtZ2Vk?=
 =?utf-8?B?TktobGpnYTBaMS9KQ1gycmxLT3JiWlROY2lkQkFkcG5wUFVFdDE4QmlJcVc5?=
 =?utf-8?B?dVpaZ1hXeEV0bUxPVFNoMENZQlNMZU1sU056dFZPMW1SMUI5bVkwNEk1NkMx?=
 =?utf-8?B?eElTU0VDWEI2REN4UHRYZjlHRURJNzJpeWVlcGVrVk9NODJtVmZERDZoN0R2?=
 =?utf-8?B?SmdMdTlrTTh5R1M5M28xMTQrR20rNGxFbzE4VitLN2dhWW5TazJVWHUweGI1?=
 =?utf-8?B?cGR1eENGSkZ5c0NiRFJJRG4xMWg4N3VKaWpKME0wOUYxampIM0NDTzdwbGs4?=
 =?utf-8?B?TG12U3JCbjA1UlNGRzhyUGJjaVBldFZEaUxGNWV1aFBBc1VzMU5mVForeGdm?=
 =?utf-8?B?MlpzUWxHbzg5bEVYcCtZZnoyai9GR1ZWOEtmTWJmT0phTDY1RFV1cDBXK3Z6?=
 =?utf-8?B?V1NiM0w0MzNUZ2w2Ti9VanJ0SGZPZXQ5UzAxWmYzMVVMMUNoaURGc1RnNUZz?=
 =?utf-8?B?WE9ZMUxXWEhkUTNzOTd6dm1OUithdjlBUDdaVUl0c3JoNkFsek4rWVFhdnZh?=
 =?utf-8?B?YWtyNWdta2M0NG81UEpULzR5RVZHdUNoeFNyc1dVaVNiY3lHVmM0UElVelVQ?=
 =?utf-8?B?QXpXbjZlS2VoVVhOaHMzdHFydFdqS1dmTlBlVGZVdGl2aEVxYllYd3ltcWpy?=
 =?utf-8?B?c0d4NXB4TENGQlpaYlNUSCt0dU1RNzNuT0cvblBWRjcrSGIraGwvRGNBUWFI?=
 =?utf-8?B?N0xpMVA3Nldjam1WTjBXTW9yUXROUG80cnhLRGFNZW9YYUdxbjZVc1lwM01R?=
 =?utf-8?B?RzFJWjllWHN3bURUVmpKMGZtbTMvZ0hUTEZrR3RvM2FkT3BNcnhDcnpPZU9Z?=
 =?utf-8?B?Uno2RzI2L1hSWVdERDh4dkRSMXhDUW91blc1K2lEZHFabFBBYnBhbldSbnh6?=
 =?utf-8?B?K2J5Y2J2SzQzclZqS2xWL091YmxrK0FpeUk5dXhKb2c2TFQ4VHo2U1ZVOFBr?=
 =?utf-8?B?anl6Q2hvd2Z0MEcvalhJc3NUWGs2MXYvSExSVnQzYkJQQTJoZ3B1ZlZqMVlB?=
 =?utf-8?B?OVVORHAvUGRBYi9NS0owYW80aTdjRUFrd1hObWJIaml1clVsRVdyQlR1TzF6?=
 =?utf-8?B?MmpDdGhYZWU5a040c01EdEpXVTVITjlldGt4SVdWYm5vUmt1Q3ZGOCtIbHpX?=
 =?utf-8?B?eENKRCtpWHdEazNhRVB6bUlUd0xyOEgzalkxZ3R5Z3h3Sk9tVk8xSWw2SFEy?=
 =?utf-8?Q?xLLb3MtHwY8YybCf+pgJ4ok0dxULn46KKLWP0RZYY0lFI?=
x-ms-exchange-antispam-messagedata-1: iJvWLq/nHzIB9niF2WgtiPhddg5PI+X66j0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <66D339D0DD1A444F988F02E1919A59DE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ee/G/UClEmje3PjElxw4gQi7FmaNGG3vmZ7W72Ebh01//JiwjFw1ufKD20WtnZnc2l7I7xYyCq3r1RL5YmVyVO8koX92v7IT36uZYhTMRCL8Nc5ZeUTwoEmThDdiPKf08uIo4jNs2eUW3aT9VSXjP/cJjybUZ0w8egCoGpMNlvKxWM0v1coAQbUt+iwU0mziR8CBNONeA6lru4FxcFlhbICEpxQ67xOCn9qSO4Df/48rzvSD5jTuaYp4xN2uxrNnR6dVkA2X+jDZzpNXSuw+iLguGHDj4RPgJUMhHXldteeC5Z1KwMZyBWkXv6T1QkggTj0HvhO9GGervEl9t7NTYQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9725ac-97f0-49ad-66fd-08dee8933aee
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 08:20:17.9633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pl/gtdnievgyEsHp0RnOHuzZRaRcgW6eWrbXn2r7Ms3lGSol9CjLQqpA1mDvjN4XsJODTw2iWyliJ+xGA8MziHKhMmPh5SQvLMPMrIrNu8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6855
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

T24gV2VkLCAyMDI2LTA3LTIyIGF0IDE2OjI0ICswMzAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBFbmFibGluZyBmZWF0dXJlcyBsaWtlIEZCQyBvbiBwbGF0Zm9ybXMgbWF5IGRlcGVu
ZCBvbiBhIHBsYW5lJ3MNCj4gbWF4aW11bSBzdXBwb3J0ZWQgcmVzb2x1dGlvbnMgb3Igc29tZSBv
dGhlciBhcmJpdHJhcnkgY29uc3RhbnQNCj4gdmFsdWVzIGJlY2F1c2Ugb2YgaHcgcmVzdHJpY3Rp
b25zLiBDdXJyZW50bHkgdGhlIGhlbHBlcnMgdGhhdA0KPiByZXBvcnQgYSBwbGFuZSdzIG1heCB3
aWR0aCBhbmQgaGVpZ2h0IGFyZSBwcml2YXRlIHRvIHNrbF9wbGFuZQ0KPiAvIHNrbF91bml2ZXJz
YWxfcGxhbmUuIENoYW5nZSB0aGUgc2NvcGUgdG8gZ29sYmFsIHNvIHRoYXQNCj4gdGhpcyBjYW4g
YmUgcXVlcmllZCBmcm9tIG90aGVyIGFyZWFzIGFzIHdlbGwuDQo+IA0KPiB2MjogZnVuY3Rpb24g
cGFyYW1ldGVyIGFsaWdubWVudCBmaXhlcw0KPiANCj4gU2lnbmVkLW9mZi1ieTogVmlub2QgR292
aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5
OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCg0KPiAtLS0NCj4g
wqAuLi4vZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jwqDCoCB8IDE2
ICsrKysrKysrLS0tLS0tDQo+IC0tDQo+IMKgLi4uL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91
bml2ZXJzYWxfcGxhbmUuaMKgwqAgfMKgIDkgKysrKysrKysrDQo+IMKgMiBmaWxlcyBjaGFuZ2Vk
LCAxNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gaW5kZXgg
MTY0YjdkNjFjOWEzLi43N2QzMzAxMmJkZGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+IEBAIC0xOTMyLDEwICsx
OTMyLDEwIEBAIHN0YXRpYyBpbnQgaW50ZWxfcGxhbmVfbWluX2hlaWdodChzdHJ1Y3QNCj4gaW50
ZWxfcGxhbmUgKnBsYW5lLA0KPiDCoAlyZXR1cm4gMTsNCj4gwqB9DQo+IMKgDQo+IC1zdGF0aWMg
aW50IGludGVsX3BsYW5lX21heF93aWR0aChzdHJ1Y3QgaW50ZWxfcGxhbmUgKnBsYW5lLA0KPiAt
CQkJCSBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gLQkJCQkgaW50IGNvbG9y
X3BsYW5lLA0KPiAtCQkJCSB1bnNpZ25lZCBpbnQgcm90YXRpb24pDQo+ICtpbnQgaW50ZWxfcGxh
bmVfbWF4X3dpZHRoKHN0cnVjdCBpbnRlbF9wbGFuZSAqcGxhbmUsDQo+ICsJCQnCoCBjb25zdCBz
dHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gKwkJCcKgIGludCBjb2xvcl9wbGFuZSwNCj4g
KwkJCcKgIHVuc2lnbmVkIGludCByb3RhdGlvbikNCj4gwqB7DQo+IMKgCWlmIChwbGFuZS0+bWF4
X3dpZHRoKQ0KPiDCoAkJcmV0dXJuIHBsYW5lLT5tYXhfd2lkdGgoZmIsIGNvbG9yX3BsYW5lLCBy
b3RhdGlvbik7DQo+IEBAIC0xOTQzLDEwICsxOTQzLDEwIEBAIHN0YXRpYyBpbnQgaW50ZWxfcGxh
bmVfbWF4X3dpZHRoKHN0cnVjdA0KPiBpbnRlbF9wbGFuZSAqcGxhbmUsDQo+IMKgCQlyZXR1cm4g
SU5UX01BWDsNCj4gwqB9DQo+IMKgDQo+IC1zdGF0aWMgaW50IGludGVsX3BsYW5lX21heF9oZWln
aHQoc3RydWN0IGludGVsX3BsYW5lICpwbGFuZSwNCj4gLQkJCQnCoCBjb25zdCBzdHJ1Y3QgZHJt
X2ZyYW1lYnVmZmVyICpmYiwNCj4gLQkJCQnCoCBpbnQgY29sb3JfcGxhbmUsDQo+IC0JCQkJwqAg
dW5zaWduZWQgaW50IHJvdGF0aW9uKQ0KPiAraW50IGludGVsX3BsYW5lX21heF9oZWlnaHQoc3Ry
dWN0IGludGVsX3BsYW5lICpwbGFuZSwNCj4gKwkJCcKgwqAgY29uc3Qgc3RydWN0IGRybV9mcmFt
ZWJ1ZmZlciAqZmIsDQo+ICsJCQnCoMKgIGludCBjb2xvcl9wbGFuZSwNCj4gKwkJCcKgwqAgdW5z
aWduZWQgaW50IHJvdGF0aW9uKQ0KPiDCoHsNCj4gwqAJaWYgKHBsYW5lLT5tYXhfaGVpZ2h0KQ0K
PiDCoAkJcmV0dXJuIHBsYW5lLT5tYXhfaGVpZ2h0KGZiLCBjb2xvcl9wbGFuZSwgcm90YXRpb24p
Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVy
c2FsX3BsYW5lLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJz
YWxfcGxhbmUuaA0KPiBpbmRleCA1ZTI0NTFjMjFlZWIuLmFkNzExMDVjYzU1YSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5l
LmgNCj4gQEAgLTgsNiArOCw3IEBADQo+IMKgDQo+IMKgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+
DQo+IMKgDQo+ICtzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyOw0KPiDCoHN0cnVjdCBpbnRlbF9jcnRj
Ow0KPiDCoHN0cnVjdCBpbnRlbF9kaXNwbGF5Ow0KPiDCoHN0cnVjdCBpbnRlbF9pbml0aWFsX3Bs
YW5lX2NvbmZpZzsNCj4gQEAgLTQyLDUgKzQzLDEzIEBAIGJvb2wgaWNsX2lzX2hkcl9wbGFuZShz
dHJ1Y3QgaW50ZWxfZGlzcGxheQ0KPiAqZGlzcGxheSwgZW51bSBwbGFuZV9pZCBwbGFuZV9pZCk7
DQo+IMKgDQo+IMKgdTMyIHNrbF9wbGFuZV9hdXhfZGlzdChjb25zdCBzdHJ1Y3QgaW50ZWxfcGxh
bmVfc3RhdGUgKnBsYW5lX3N0YXRlLA0KPiDCoAkJwqDCoMKgwqDCoMKgIGludCBjb2xvcl9wbGFu
ZSk7DQo+ICtpbnQgaW50ZWxfcGxhbmVfbWF4X3dpZHRoKHN0cnVjdCBpbnRlbF9wbGFuZSAqcGxh
bmUsDQo+ICsJCQnCoCBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gKwkJCcKg
IGludCBjb2xvcl9wbGFuZSwNCj4gKwkJCcKgIHVuc2lnbmVkIGludCByb3RhdGlvbik7DQo+ICtp
bnQgaW50ZWxfcGxhbmVfbWF4X2hlaWdodChzdHJ1Y3QgaW50ZWxfcGxhbmUgKnBsYW5lLA0KPiAr
CQkJwqDCoCBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gKwkJCcKgwqAgaW50
IGNvbG9yX3BsYW5lLA0KPiArCQkJwqDCoCB1bnNpZ25lZCBpbnQgcm90YXRpb24pOw0KPiDCoA0K
PiDCoCNlbmRpZg0KDQo=
