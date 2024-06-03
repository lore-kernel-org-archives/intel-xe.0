Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399A0C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 13:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B540910E02F;
	Mon,  3 Jun 2024 13:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZv6uTfi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A7F10E02F
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 13:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717420842; x=1748956842;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CcxUsMenwE0Rb/J/ffbtfuhsqFINatTxBady9vOpSxc=;
 b=dZv6uTfi+w1diexlUjyQcJuFCUafzyFQF5QGyTiB2MYdTGDJVyr4NfjH
 dlCYgcvuV0CeqKUQ0HLJvPeMN8Dao0DAQhYVRBlGwGBoanmtzEwGjRz1G
 NKIfi3YUSI2XZyGJ+iAKlFVCIvalgLCS2ubgEJhasA38SjlZregxGYnSx
 N/djtzciSsMZT5mK2FR215sr3uiy/zIYOEiTRYQqQ/v3ldEFoWs+ET7J4
 GVrYVhUH1FGmJ3QBj+LhR77kX9wncJVwOIkKwXf1p/uE/63Ymu+LyiEcp
 T/CFNHhaDVPxFt1lVYpyJFNj1fapmqW8bmxOBiHHkJcmvjwoV52WfcAuD w==;
X-CSE-ConnectionGUID: i3tITjjCRuGN/JuN0wGvCQ==
X-CSE-MsgGUID: M5bJCQvPQ+iMAVqCoHQnUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13721724"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="13721724"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 06:20:41 -0700
X-CSE-ConnectionGUID: Yvlp42J5RuShQMIOUfNWNg==
X-CSE-MsgGUID: qUBGcUoFTDeQIhAwZlFuZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="41809767"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 06:20:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 06:20:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 06:20:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 06:20:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDjFZRqjb5LegZpC4Gz/FjV/D4d+2swvbJkEz/Zd+eO8ICivXLAqt2MQn7b98qJo/QDvSuwyQJEyGl9c7IzfStKHY1th1sHbmvKhy3mj4ffBj4biKD6kwy59B8CY/5RtAsaTH/k885rWl8UnzY4048jR3Z0foS6sCEu1MwmxVxD3bii9KLqj8TTqRjVmCZkGEHRN8rBbM1Gu0qFEq1phX1WwddTgSejiriHxo4WRlBexbUrZSOCzc7njgyd2PKg72d4bicdfV2nfEeL2oK9k8pIpd/lb/iWS07bDCDehCJXK4EmgaCuzKNEIaCgq/3y8dMULgpvsCoZW08Dq+C6ldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcxUsMenwE0Rb/J/ffbtfuhsqFINatTxBady9vOpSxc=;
 b=CAAB7yd9hNorgzNW4PZO4nI2W/N6beXNz/BKSJP+mybnkgopR+SGoUQgwKlACQ0pI6UtUQMcoq9vhQErIud9scrGHYKugKIwYzvPJz3UZZe7Lddg1lwmLQunhu00iApk/6/0RBNecCRbiOsAE8xrA9M9FYYNQrYdkc9vl8nif+22In0Bv1FauHtqfml6pQfX9N0DhPvWYAzrwe2KpEOJSPQipk3/aL+WsTnkUZhA/2E/4wSJiaHiTOhUgdJ6ontXFX9p3AxF1WLtIMru8C6xGfDmuwL1H8+WDFkGskqoN+BEi5ximkmHqvJOqUU+yKRIskoi8mTtiqLhP9YliCngxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH0PR11MB5927.namprd11.prod.outlook.com (2603:10b6:510:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 13:20:38 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 13:20:38 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mishra, Pallavi" <pallavi.mishra@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2: Enable Priority Mem Read
Thread-Topic: [PATCH v2] drm/xe/xe2: Enable Priority Mem Read
Thread-Index: AQHasljTNLcFRRGQFkyYbD/fJreQ8LGwARKAgAHX7oCABDPwgA==
Date: Mon, 3 Jun 2024 13:20:38 +0000
Message-ID: <dad00e0721e5fb903c191918fecaadce789f8be3.camel@intel.com>
References: <20240530062509.1529357-1-pallavi.mishra@intel.com>
 <ce9f3893305f99323f79f0ee39f179543f11483f.camel@intel.com>
 <20240531210939.GX4990@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240531210939.GX4990@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH0PR11MB5927:EE_
x-ms-office365-filtering-correlation-id: 569ffcb7-b1a0-4030-0584-08dc83cff595
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?clMzOXpHWFZRdjlmcExBLzlUclZCR1N1Mm9kaEVZWGN1dXV4dkV4aGRXVmhS?=
 =?utf-8?B?OURnVVhCbEpxVWV6NFprdjFnZmhGakwvZTZySkNrd3hqQlpFdXdNNUc0WUl6?=
 =?utf-8?B?YjJ6V3lyc3kvWWVrZjRLZHNNRFBMTlhNblBENS9NdURTc2JxSjh0WEd6Viti?=
 =?utf-8?B?TGp6cEZRTmRxdnNsQlFhbExKUlNvSmdVQVNVOGxZL1Zzc204RStIUXM4OHM4?=
 =?utf-8?B?RU83cERNeTY3MFVXUXptS0h4c0NTekRMcG9ySldUbG40UXM3YkVCQTRrWnlq?=
 =?utf-8?B?R3ZQOVZuQ2lPR3hqL2tWNmdaYmJhdndlRUZzN0ZKYkNoYy9kK2s0cEkrUW9F?=
 =?utf-8?B?MmkraVU5UjdNNEgyaHZNOExjSTI4ZDArbzFKT0FsUUhSNnE2Tzd5UTZzUCt1?=
 =?utf-8?B?YkJUNFl3NGx4NFN5V3RHM01OMUJQUkZZRk96VTQxS0lSd2QwbTFQNjJvSkla?=
 =?utf-8?B?UXdlSkhDbGZNclZnMFl1Nkp4R1FMR3EzVFJnaGw4T1NoNFVGVUZHRWptU0R2?=
 =?utf-8?B?RUM4YzFiZSt4MEQ1S1g2N2tlY0VMR1ZaUVkvQ2JCeExlejNCVzRxdFZmWnY1?=
 =?utf-8?B?Rk9hTyswSkdWeXYxY0MyY1FueDdRNHFGS1hpVzZwK1U1K2p6OTI3WStDYVAv?=
 =?utf-8?B?VGlvTEdlc0xJN1pUTUZERVdhcmNpencxdFpKTHpydUpIM2E5Nk1KN1NFYlQx?=
 =?utf-8?B?SmowVzUzRnI2MDZ2YTZ6WHRaQzE3d0tKanc1aGlvK2dab1QraGpQK29yTzcy?=
 =?utf-8?B?RXBDWEN4MzJXU0pVOG1TY3k3bmp6eFlEWGtjbnNYT0l3Z0x3SDFMczk1WGVU?=
 =?utf-8?B?Q0UrcFhJS0xSNkxmYUFOa1BMbjdUM0lXMFdjenZwQ05qMzgwQmkzaTFVZ0g4?=
 =?utf-8?B?TlBwLzdvYW1Ubk0yRTdxSFpGS0UwRHU5L1lDQUdZbnBVR0NielZTSzJEelRa?=
 =?utf-8?B?SEo5Y1RtaGJVQXFuZnRvL082aHNlanlxUUdUS1Z3Q2YvSUtHZWNmZW53WlZ0?=
 =?utf-8?B?eUp5WW5JeTJrSktuTWRJWmZadkIvaWJZZUVZaGxFSUxQeFdHL09rU25WbFJk?=
 =?utf-8?B?VGZGeE9vMlBmd01mQVM2NFBsUktQenlLK010Z3JQTHZpUEdDalBCYkFzd0o5?=
 =?utf-8?B?bHBWS3dXdkJVUDd3Vml4VDJ5VEtpYUsrd1BORzY0c2h6dXEzUkhrRE1xQUI1?=
 =?utf-8?B?cndxYTZUK3V2RE1iaGxOdmZwYXh5QzliY05MS1BwYzJsTGZqZmVQbVJHelZh?=
 =?utf-8?B?TVR0Q1gvVU9xMXVXSEoxbCtFRnplVExLVWJPUm5iM2c0UVZwZ1QrQWE4cVZO?=
 =?utf-8?B?RCtQTGZJbEFyRm9VeUZyL2VsRHRMR0tUVmZaU1dVVVg3c3M4ZzFWdFhrU0J1?=
 =?utf-8?B?OXNzOGg1VVA4eDdIODZpMVByMjVlRUthRWNvN0xUbWptWG5naG9kcGVBZ1VW?=
 =?utf-8?B?M2xCYktSbHdrSG5ONWwweGZJemdFU0tQTUNLd092b3p0SFBvUStwQURzdzZ2?=
 =?utf-8?B?UlVxWVZtajZ0L2NjSXpXU3M2RjhmMUFtQ1YxVTBsUnphWjlLME5aV2xJR3dW?=
 =?utf-8?B?TnRmTzR6Sm1nc2pUZkxjRDVZeEpFL1J0VHBsZytmOVVJa3RXamhoL0ZkTDk2?=
 =?utf-8?B?dlZZUUYxVTJlVTZsTHlUL1ZrMS9Gd2RXNHd2eWZscUpURTFWKzZGU3h5TzRy?=
 =?utf-8?B?VlRQRnRFVzNrOVdseFU4MHdxNGZsdlNNVE5lZmI1ckpIaTNPNjF1TGtZOXJE?=
 =?utf-8?B?N2NMUGs0dnE2RndZVDdVdnk5RXJVU2E2bGpqSmxMcjZPdjR6N0VNTmw2T2cy?=
 =?utf-8?B?U1B3RGZDU1VnTWVTRCt2Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3JlaUdhbmlGM1dwVlIyRlJXRm5RdjEvM0FqSkxnNDJNS2VKa2xPNWlzeWdM?=
 =?utf-8?B?ZEVxWGZlZ3dnWGJGZk45VktKVXNId1ZFbWYzZlVPM0p4N29EKzBCMEVDVGJv?=
 =?utf-8?B?UjRRbVErZkJQVVZYd042NkoxamdJMlFqNzh2NXNROHczUTViU01pSlFzOU5v?=
 =?utf-8?B?cE93RS9mTXJCM3l1ZmZkZnFjR0dGMW5rcytMVzlWN2FRTzBpbW1OQjVEVHpS?=
 =?utf-8?B?RThKck9VNVFIa0w2cUlMNVRDaXVic1VMVGlwSmxHcjNKZ3lJM2NYbG5BU2Y5?=
 =?utf-8?B?THNzN0pLOVlpKzdaRXREZysveWVjZ0E3WmZYQy9vOHVZei8xeTBEOTNwdkVp?=
 =?utf-8?B?MVRQM3lQK25HVnorbS9WdXBNMm5FeE8xQUdYak5yNllhVjlNcVBzL1JHQ2Qv?=
 =?utf-8?B?MWxCaFEwWkxMdS9GbjBCOVB6Z1BZTjFEY3IwemprTlhTV3BnRlBiTGllaWlV?=
 =?utf-8?B?bHhHVW94a3RrTDQzbCtyN0txL1lJRjk0QzZvYzUxb2RHVWVEdWpPcjgzd0pa?=
 =?utf-8?B?SDNkOVU3b0pKSzRKNFJ1aFRhVERzNzdDQ0N0RXk4MTZwQzFJUGo1MzRrOWZj?=
 =?utf-8?B?UUM4VkhLd1VuVC9qRTQ4YzNZamdpQVU0eEZsNmJYbGdlMU00L1RwbHRpNnlE?=
 =?utf-8?B?N0RPS08yNHFvQVBPdVdnczM5b1g1WkZLWktZem41Njg2dko2ekNaRmZOeW9L?=
 =?utf-8?B?S0hBYldpRFVZZklCOTFFaEdGSFhaT3RLM3pGK2hKVEVkQzNWVVpUMmROeW5h?=
 =?utf-8?B?ay96UXBmNUFvZG1PbFZpbEI4Tllmb0h6RVBUYUNkWHluZzFBeU5HSE5XNG1O?=
 =?utf-8?B?bFhlaUEzc3AxcGdBeEpNcWUyUEI2V0pobXM1SXBlcS9pa041QUxPSDZLTnlB?=
 =?utf-8?B?T3dsVFhNWEs4RFdiUmhwaUl3aCtER0dISUZkejFyankzQ2F5MGFpR0lJQlJu?=
 =?utf-8?B?d3J0bktJRTgzOWFISFFtaDh2NXdXTlphbUtGSkNQQUt5V3JsQzJpY2kvUkVp?=
 =?utf-8?B?MXVxbXpGZFZlN3lobkJQOG1wRTBXVk1BdHZlcno0K3hMZUphZHgwVkJXK3dN?=
 =?utf-8?B?b09yYXBrVU9DZ1NHYzBacFgvQlBlT2N0VTNLNjNLaTJSWmxTQjdRWVFBQVIx?=
 =?utf-8?B?US9abTNXUTdDazQzbmVEMmxFeXhTVGVqTVkzZW1WMDVjN2h0YmZsMWtTbDR6?=
 =?utf-8?B?TmlITTcwYWMrZVpkRng2cWRTM2pMNW16MEVkZEIzK1AwYWpRMzMvVk5IQVdC?=
 =?utf-8?B?VHFiOVlGL0J3TUl6TVNMUDVtYld4bW9sb2NWeG9QZFh2MzQzSmlhU25keUFy?=
 =?utf-8?B?eDh5aFdvYkkwQWtBaDdLZmQydzNLZVVnc0JPUXpZUHVQZ2xLUkY0TU5MN1lU?=
 =?utf-8?B?cXU0d2FuSVJHbnMvdm04cEZCYnVVS0IrNWtURG5qQ0dnWU96MHBLbEdHM1JB?=
 =?utf-8?B?R252OFhJNjc5Vnlna2MyWWtaMFNxMXYvaUFIcHRWTTd0b05EREZYajF2cFBU?=
 =?utf-8?B?YllBd1BjVVBYMDZLNzc5cnczVGVXRU4zYVJML0RCc20vRmgzd2JaOEk4THFz?=
 =?utf-8?B?NWdpYXY0TmFXbEtSMHRLTUUzUmtOcmtwN0l4a1c1STdMbVM1VitaUVlhdkJ0?=
 =?utf-8?B?dnlpR25zQVRQNkxmak1rRE9kcDFMdEc4ckV4dDZaUXV0MUFOdzdlS2JKcWYv?=
 =?utf-8?B?Wm8vNVdEaUFTdUkrdlBQWmdBeUdqZWxSZE1DYi82U1laNmNwR0lFT1Z5TUp1?=
 =?utf-8?B?TWNmQnA4TzVTZzkxclk2cnl6Z0ZjUUJkU3U0anpsT3p6d2U4YnJUOEVEU0Q4?=
 =?utf-8?B?QUY4ZldTYkwvb3FQTDQ2TVV5N29PdmNGN3dUdkJWNVRRWmRGeFVzd29FT09v?=
 =?utf-8?B?RitUb0k0RUZBa2JHbnZBZ2pYa09UOGl5eldBZGIxcVBZRWpOaUZjTmJWVDhs?=
 =?utf-8?B?OHdqcW50NTZPTnh5UUpkUGFVMnJMNjFOdlpQWUFiWHA4Qm8wbkR2RSt6aUJO?=
 =?utf-8?B?R0gzTkNlS2U3bVRYR0I3KzRsWUIzTE5aTnVrU2NscVlnVCtXZjJxMUxMckQv?=
 =?utf-8?B?QVFDeUZIb2xQcm1TZXlwMGN6WFpNeURFTDZNbncwMVh6TG8ySWVLWFp4TXV2?=
 =?utf-8?B?SkZEZ2dQc01EL21WYnhueEhKZXJaS3Q0QkxWam5iTFphR3A0RkJ3andBR2pP?=
 =?utf-8?B?N2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30A3202B9BE16C4A883B3075AF63B35C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 569ffcb7-b1a0-4030-0584-08dc83cff595
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 13:20:38.1334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9vPhC/qB9CJsI49G13UeFPsHejuHzeYYhD3RuG5Y6wTn88NA3WGNtKIDHGmQwRcQQq8ZU+rjf8AATXZjAjgTYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5927
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

T24gRnJpLCAyMDI0LTA1LTMxIGF0IDE0OjA5IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBUaHUsIE1heSAzMCwgMjAyNCBhdCAxMDowMDozNkFNIC0wNzAwLCBTb3V6YSwgSm9zZSB3cm90
ZToNCj4gPiBPbiBUaHUsIDIwMjQtMDUtMzAgYXQgMTE6NTUgKzA1MzAsIFBhbGxhdmkgTWlzaHJh
IHdyb3RlOg0KPiA+ID4gRW5hYmxlIGZlYXR1cmUgdG8gYWxsb3cgbWVtb3J5IHJlYWRzIHRvIHRh
a2UgYQ0KPiA+ID4gcHJpb3JpdHkgbWVtb3J5IHBhdGguIFRoaXMgd2lsbCByZWR1Y2UgbGF0ZW5j
eQ0KPiA+ID4gb24gdGhlIHJlYWQgcGF0aCwgYnV0IG1heSBpbnRyb2R1Y2UgcmVhZCBhZnRlcg0K
PiA+ID4gd3JpdGUgKFJBVykgaGF6YXJkcyBhcyByZWFkIGFuZCB3cml0ZXMgd2lsbCBubw0KPiA+
ID4gbG9uZ2VyIGJlIG9yZGVyZWQuDQo+ID4gPiANCj4gPiA+IFRvIGF2b2lkIFJBVyBoYXphcmRz
LCBTVyBjYW4gdXNlIHRoZSBNSV9NRU1fRkVOQ0UNCj4gPiA+IGNvbW1hbmQgb3IgYW55IG90aGVy
IE1JIGNvbW1hbmQgdGhhdCBnZW5lcmF0ZXMNCj4gPiA+IG5vbiBwb3N0ZWQgbWVtb3J5IHdyaXRl
cy4gVGhpcyB3aWxsIGVuc3VyZSBkYXRhDQo+ID4gPiBpcyBjb2hlcmVudCBpbiBtZW1vcnkgcHJp
b3IgdG8gZXhlY3V0aW9uIG9mDQo+ID4gPiBjb21tYW5kcyB3aGljaCByZWFkIGRhdGEgZnJvbSBt
ZW1vcnkuDQo+ID4gDQo+ID4gVGhpcyBoYXMgdGhlIHBvdGVudGlhbCB0byBjYXVzZSBpc3N1ZXMg
aW4gVU1EcywgTWVzYSBmb3IgZXhhbXBsZSBkb24ndCBoYXZlIGFueSBNSV9NRU1fRkVOQ0UgaW5z
dHJ1Y3Rpb24gaW4gdGhlIGNvZGUgYmFzZS4NCj4gPiANCj4gPiBTbyBwbGVhc2UgYmVmb3JlIG1l
cmdpbmcgdGhpcyBzeW5jIHdpdGggYWxsIFVNRHMgb3IgbWVyZ2UgaXQgYmVoaW5kIGEgcnVuLXRp
bWUgb3IgYnVpbGQgdGltZSBwYXJhbWV0ZXIgd2l0aCBpdCBkaXNhYmxlZCBieSBkZWZhdWx0Lg0K
PiANCj4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIG1ha2UgdGhpcyB0aGUgZGVmYXVsdCBBU0FQ
IHNvIHRoYXQgd2UgY2FuIHN0YXJ0DQo+IHVuY292ZXJpbmcgYW55IGhpZGRlbiB1c2Vyc3BhY2Ug
YnVncyByaWdodCBhd2F5PyAgT25jZSBmb3JjZV9wcm9iZSBnZXRzDQo+IGxpZnRlZCBhbmQgdGhl
IHBsYXRmb3JtIGJlY29tZXMgZ2VuZXJhbGx5IHVzYWJsZSwgaXQgd2lsbCBiZSB0b28gbGF0ZSB0
bw0KPiBmaXggc2luY2UgYXQgdGhhdCBwb2ludCBhbnkgZmFpbHVyZXMgd2lsbCBuZWVkIHRvIGJl
IHRyZWF0ZWQgYXMga2VybmVsDQo+IHJlZ3Jlc3Npb25zLCBldmVuIGlmIHRoZSBtaXN0YWtlIGl0
c2VsZiBsaWVzIGluIHVzZXJzcGFjZS4gIEkgZG9uJ3Qgc2VlDQo+IG11Y2ggYmVuZWZpdCBpbiBh
cnRpZmljaWFsbHkgaGlkaW5nIHByb2JsZW1zIHdoZW4gd2UgZG9uJ3QgaGF2ZSBtdWNoDQo+IHRp
bWUgbGVmdCB0byBkaXNjb3ZlciBhbmQgZml4IHRoZW0uDQoNCkNoYW5nZXMgbGlrZSBzaG91bGQg
bm90IGJlIG1lcmdlZCB0aGlzIGxhdGUgb24gdGhlIHByb2dyYW0gYXQgbGVhc3Qgd2l0aG91dCBh
Y2tzIGZyb20gYWxsIFVNRHMuDQpNZXNhIGZvciBleGFtcGxlIGlzIGxhdGUgb24gTE5MIHVwc3Ry
ZWFtaW5nIHRoaXMgYWRkaXRpb25hbCBmZWF0dXJlIGNvdWxkIGNhdXNlIGV2ZW4gbW9yZSBkZWxh
eXMuDQoNCg0KPiANCj4gDQo+IE1hdHQNCj4gDQo+ID4gDQo+ID4gPiANCj4gPiA+IE5vIHBhdHRl
cm4gaWRlbnRpZmllZCBpbiBLTUQgdGhhdCBjb3VsZCBsZWFkIHRvIGENCj4gPiA+IGhhemFyZC4N
Cj4gPiA+IA0KPiA+ID4gdjI6IE1vZGlmeSBjb21taXQgbWVzc2FnZSwgZW5hYmxlIHByaW9yaXR5
IG1lbQ0KPiA+ID4gcmVhZCBmZWF0dXJlIGZvciBtZWRpYSwgbW9kaWZ5IHZlcnNpb24gcmFuZ2Us
DQo+ID4gPiBtb2RpZnkgYnNwZWMgZGV0YWlsIChNYXR0IFJvcGVyKQ0KPiA+ID4gDQo+ID4gPiBC
c3BlYzogNjAyOTgsIDYwMjM3LCA2MDE4NywgNjAxODgNCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogUGFsbGF2aSBNaXNocmEgPHBhbGxhdmkubWlzaHJhQGludGVsLmNvbT4NCj4gPiA+IC0t
LQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmggfCAgMSAr
DQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jICAgICAgICB8IDExICsr
KysrKysrKysrDQo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspDQo+ID4g
PiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVf
cmVncy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaA0KPiA+ID4g
aW5kZXggMjYzZmZjN2JjMmVmLi40ZThmOWE2MWYwYmYgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oDQo+ID4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oDQo+ID4gPiBAQCAtMTA0LDYgKzEwNCw3
IEBADQo+ID4gPiAgI2RlZmluZSBDU0ZFX0NISUNLRU4xKGJhc2UpCQkJWEVfUkVHKChiYXNlKSAr
IDB4ZDQsIFhFX1JFR19PUFRJT05fTUFTS0VEKQ0KPiA+ID4gICNkZWZpbmUgICBHSFdTUF9DU0Jf
UkVQT1JUX0RJUwkJCVJFR19CSVQoMTUpDQo+ID4gPiAgI2RlZmluZSAgIFBQSFdTUF9DU0JfQU5E
X1RJTUVTVEFNUF9SRVBPUlRfRElTCVJFR19CSVQoMTQpDQo+ID4gPiArI2RlZmluZSAgIENTX1BS
SU9SSVRZX01FTV9SRUFECQkJUkVHX0JJVCg3KQ0KPiA+ID4gIA0KPiA+ID4gICNkZWZpbmUgRkZf
U0xJQ0VfQ1NfQ0hJQ0tFTjEoYmFzZSkJCVhFX1JFRygoYmFzZSkgKyAweGUwLCBYRV9SRUdfT1BU
SU9OX01BU0tFRCkNCj4gPiA+ICAjZGVmaW5lICAgRkZTQ19QRVJDVFhfUFJFRU1QVF9DVFJMCQlS
RUdfQklUKDE0KQ0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19l
bmdpbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+ID4gaW5kZXgg
OWVlZjc4OWJlODk3Li5mMDNlNWNjOTA2M2UgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9od19lbmdpbmUuYw0KPiA+ID4gQEAgLTQyNCw2ICs0MjQsMTcgQEAgaHdfZW5naW5lX3NldHVw
X2RlZmF1bHRfc3RhdGUoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiA+ID4gIAkJCQkJICAg
MHhBLA0KPiA+ID4gIAkJCQkJICAgWEVfUlRQX0FDVElPTl9GTEFHKEVOR0lORV9CQVNFKSkpDQo+
ID4gPiAgCQl9LA0KPiA+ID4gKwkJLyogRW5hYmxlIFByaW9yaXR5IE1lbSBSZWFkICovDQo+ID4g
PiArCQl7IFhFX1JUUF9OQU1FKCJQcmlvcml0eV9NZW1fUmVhZCIpLA0KPiA+ID4gKwkJICBYRV9S
VFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgyMDAxLCBYRV9SVFBfRU5EX1ZFUlNJT05f
VU5ERUZJTkVEKSksDQo+ID4gPiArCQkgIFhFX1JUUF9BQ1RJT05TKFNFVChDU0ZFX0NISUNLRU4x
KDApLCBDU19QUklPUklUWV9NRU1fUkVBRCwNCj4gPiA+ICsJCQkJICAgICBYRV9SVFBfQUNUSU9O
X0ZMQUcoRU5HSU5FX0JBU0UpKSkNCj4gPiA+ICsJCX0sDQo+ID4gPiArCQl7IFhFX1JUUF9OQU1F
KCJQcmlvcml0eV9NZW1fUmVhZF9Gb3JfTWVkaWEiKSwNCj4gPiA+ICsJCSAgWEVfUlRQX1JVTEVT
KE1FRElBX1ZFUlNJT05fUkFOR0UoMTMwMSwgWEVfUlRQX0VORF9WRVJTSU9OX1VOREVGSU5FRCkp
LA0KPiA+ID4gKwkJICBYRV9SVFBfQUNUSU9OUyhTRVQoQ1NGRV9DSElDS0VOMSgwKSwgQ1NfUFJJ
T1JJVFlfTUVNX1JFQUQsDQo+ID4gPiArCQkJCSAgICAgWEVfUlRQX0FDVElPTl9GTEFHKEVOR0lO
RV9CQVNFKSkpDQo+ID4gPiArCQl9LA0KPiA+ID4gIAkJe30NCj4gPiA+ICAJfTsNCj4gPiA+ICAN
Cj4gPiANCj4gDQoNCg==
