Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B07C6FA8E
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 21:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FA010ED24;
	Fri, 24 Feb 2023 21:22:13 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC83510E5D5
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 21:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677273730; x=1708809730;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6ei1WLHaO1mmeseMfY6Et9PH4T+zgn56pve/VrHNZ9w=;
 b=l5o2XjXbD4dKBJCcxoaSPTmBoePbCm5gaxNiXi6zDDZjgoHsasEit93N
 gqhbFM834VpPKWqUxuDss1M+cYTFIKgzHYzplpv4Cva8L5KxOsLgxA/Pc
 orbKWFfdfSO9cv5vqoSLRocM4dC5CZu2OefY+OQqk+XqyZM3+cJEPDppR
 ar7m6WB81LZApwyxIQsnZGSBPWwCYnMH0+zI5TOQiH1ANwjt1LL5wWu/S
 O2j86Hr0R2gIMTl/k+Ozkw1IKJ+Uo8RRX6rYXPsZoAw3ID9gZQcZi3vwV
 wC/LS0QzdG/NcNSNpGowyc/yi/ZUAJdFps4SbVj7ItaSK3HWBwaEOj+uS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="321784070"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="321784070"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 13:22:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="703315423"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="703315423"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 24 Feb 2023 13:22:10 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 13:22:09 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 13:22:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 13:22:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 13:22:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T94wcCJbRyx79YLaq0klPKuyxbDI5u2pLnbtubLeoM2Z71Hz3o6gcNrTL+IFX9lHJ0Cz7lr8LDybBymX5cxt37HocRidWVLsHrYbFxCbBDAvHmDIGRcXeKwW2VqomHIi/QkP1fUKURpWKrW5DpX8RgrdOfHmfU6U7erOy1JOBhjIwca77FUXk9Ly+VWKETNO1TJJzucAlPi89xoWygIV8q4fqATmpEb2LNkhjTBbv9lV/zFs1FqnIbXi6RJt9gS6FkMxs2bEbvQWzXwNyIMvgEC6IRleD1YxkEPvh+fFpjb900plZZvfOwD18OeNKak/OnsIQ24yVd1Sm9+uSPa/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ei1WLHaO1mmeseMfY6Et9PH4T+zgn56pve/VrHNZ9w=;
 b=DGbZ0rn/Cl9F4Ro5camSQ29FnaFRUMpq540o5kjfungFAJW3vnHVCNsJDciT7q7pm3LBU2BKnU0a9SiDJ5AP89Om0d4EyYgXov0NqYrfPPBDiV81hATiLPwgiWVrm9YVj8ijGBaP7eBetBLAZE4hUrNGaiCIpJMsDonoJyBcQKvV+HbUmysAWPCI9cQPF86C8BJWiyN5qVQZ9P+xtfKoiOXtSvY3XxM4d4WKi1xgQEBulUzdkDm7sZK8Yz9Z19yW5phVDfJwlhk4lGxhkduZ4DiXJ2YLHa3YZdkL9Hcx9CWfMZFD0ew0eGSHNNquprAJ0kkMzZ+nwheNfxb+Ec1Ykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5466.namprd11.prod.outlook.com (2603:10b6:408:11f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 21:22:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 21:22:06 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 05/11] drm/xe: Remove dependency on
 intel_gt_regs.h
Thread-Index: AQHZSH3l1MGXPENx7EGuGFGT5ybtUa7ebCgAgAAUYwCAAArUgIAAD7iA
Date: Fri, 24 Feb 2023 21:22:06 +0000
Message-ID: <89528cd9e8618bd255aaa2f069db80b6cbba7419.camel@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-6-lucas.demarchi@intel.com>
 <Y/j8lmaf2b49It/M@mdroper-desk1.amr.corp.intel.com>
 <20230224182914.ytykgqzkp4o4ibcg@ldmartin-desk2.lan>
 <Y/kDHFFeDZY6blAt@mdroper-desk1.amr.corp.intel.com>
 <5996d61189ec584381319540402a66c03dfd840d.camel@intel.com>
 <20230224202547.zfsbspdjigtroyt6@ldmartin-desk2.lan>
In-Reply-To: <20230224202547.zfsbspdjigtroyt6@ldmartin-desk2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3 (3.46.3-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|BN9PR11MB5466:EE_
x-ms-office365-filtering-correlation-id: 232de7b2-0a3b-4cc6-02f1-08db16ad2e55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B7qhyZeLQjvyqZsqW5ctAa1Ls+YAmaRSEEWkaRx/saeW+9S71jLbGGHmYC9KcDe3cUBorMgHwgiYx3cPDSJHkcFAi1SbRrzLDhqJVBUFdgTX3VA6ZtAnp8VeO7LMlpdmdMB4D10Vot3pnnVoyQQ7/QVu9/y5/AqF3gOrQ1NJ1WXvv0GvAD3Bd745D0fhE8SLJpUi4wjHZZ5YOXDAzQwLKAcXiYkfRncfkd64U//JgELKdtFxyW2n+0hFhRErIwjRCTmtNhFAoXYLDnn+k9Up8rXn/nJ6xW/gNOocut3JHzV7+/2GpHQkBkhJZcgG+2xceiVwU9FfkEiB+Souc4G5sVLr/WsmISEvoQYeocoKXAiwOHwM/TTE3D04e7uvN5yFCm+qg+OwCJsw1bHiEktFHe72G/J0WJ7x1Z3oYguyaxWhGukRDp0gMvOQOksyyGrF7C6jLIlEIDrV5LIorzPbkNnCV3kAQAGnsmJEst29y8/zMZys2fcvdQQdWJWTYeT0TnzaV0XEzfO8pocLA4YYOVzdnezlIqA7nEQSzl07cyyMeIw45VbavHnPiP6p1YSxkZpr7EwBGtNBlqZXd8yDYcUPbNJ77p5BOrtd0cFiE2loDItnd9THjQQGoppg5a74erPbMZF5vv4e1Dyixx/N+I4CiKxpA/ZUmO2SXSt507sgHmfK/lCABIqXOF5Kfaimx1kMKvUe/ayGU58sMTrxFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(39860400002)(366004)(376002)(396003)(451199018)(71200400001)(36756003)(86362001)(41300700001)(8936002)(6862004)(5660300002)(2906002)(83380400001)(38070700005)(38100700002)(122000001)(82960400001)(478600001)(91956017)(76116006)(66946007)(66446008)(66556008)(6486002)(66899018)(66476007)(64756008)(26005)(186003)(6512007)(4326008)(54906003)(2616005)(8676002)(316002)(37006003)(107886003)(6636002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXdMTGNPSS8wazl1SWdRaFMxK2FrWGZWTzc3WWRnem8rVUZ6Rks0SEM3V0w3?=
 =?utf-8?B?Nmx6ZzFrZFltNUFxZkI4bTUyUjNSbHJXc1RzS0RJQ1VKdFlxT0Fka0ZHenYz?=
 =?utf-8?B?U1ZqSTNOcjQybUc4ZUtyQW96eWJ0bEdrVkdIUmlxcEhXSGZJVElEQ3NLbVlj?=
 =?utf-8?B?d2sxSDQ3emdwMDg2S0FyaEh0WE5xalN4emlUcmZCci9NaWt2eWNRMDFBTTRJ?=
 =?utf-8?B?RUpzUHNaTU45L1duWHJSU1hYZ2F6VnNBU3J5SGRpTlhmSDVWK1BDWE93Z0Fk?=
 =?utf-8?B?RHE5YmUwY0kzMHljZmRwL2JRVnBhMTBXaWhxanFaa1d0cjYrV1doZ1V3aGdW?=
 =?utf-8?B?MVZKVERSK2RRMHd6Z3k4TnVUMXZlbFYzaERYODRPV2o1ZTIvY083djNHMkdB?=
 =?utf-8?B?NmtzQ0RTMzlhYXhFbm12VnUvTHVOSTdPZklsK25FZkw2ejkrTFIxNjl1OFU0?=
 =?utf-8?B?RytaRnBNNEdHZURnY0FYRTRZUVk3OXI2VFlqWnozRnNOU2p6NHdMT054N3hq?=
 =?utf-8?B?cFQwckoycUI3UjNqV1B0Zlk3a3NCM0dVaXB4QWJMYmRYcFJZc053Wmw4aHNX?=
 =?utf-8?B?YWtLUUFOeUcrZENDeFkzUkRTdG8rcnNFc0hzdi9TM1dmK0M2L1l3QnhDNndt?=
 =?utf-8?B?SEcxajdZM0FjM3RSN04vYlhicDYvSjNrOGlNRnVvZlptTzk1T0p6RkdZazN3?=
 =?utf-8?B?bGN1Mkw5VEduQU5JU29DVnlSUm5nWXhneWt4Y0pkK2I5Q1YvU1NMOFd2WjAv?=
 =?utf-8?B?TkllTjFGQ0o5THBVNnhmZS9WTU5qSHdJeFc2MXI1OTNpMDFyTkJLVDZqNzcx?=
 =?utf-8?B?WnZodVVoT05VYUllYms2d0ozT2Q4aWg5RUpXdldwa1dqbHZFNDBadjl4bzZR?=
 =?utf-8?B?QmsrMjRWb2tMZDVyT2kwN3phZWEwYkJzK1NuMWpUWUoxWUFIWldmOG1GV1ho?=
 =?utf-8?B?L00yTldyOG1PK0VsTkFiT1dNS2Q1MjJUTC9GTHQ1RXVpTVN3VW5UeUMvUERW?=
 =?utf-8?B?Wk43dUFhc25LT05vaitWc0hsa3hhdE1jM25yVmxNaE80QWpWVVdnck1WblZk?=
 =?utf-8?B?U0JISVArZUF4dE9PdUZRMHN6cEJLTDF5b0k5SUxLYnl0eGpJQVk2M1V2eTBj?=
 =?utf-8?B?RCtEL09KYlhPbVBDdjRESS9ldU1BYVpCa0NlekNwam13S1g3Q3Q0Mk01RnFL?=
 =?utf-8?B?T1NpWkljRlJxdWtvV2tLQTN2VkJJclgyS1ROYzQ2ejIvZk1JRTg2MnVJNldh?=
 =?utf-8?B?NFdKODR1dzdqRDhlZEN0WnZtY2hKcjQwQlBxVXFXZ1BVblF2cCtYN1NObW5m?=
 =?utf-8?B?enROQURmWmN0Y1IvN0tWNCtOQW5GRTlrcUM3ZU5MTUl2TlBWbWtDVkRDMzVs?=
 =?utf-8?B?NzV0R1A0YUZFVnFnSG1GNzNhdlRNREFRRWVkTjducUpmcDJVd0VrNjZicU5p?=
 =?utf-8?B?bTlxcW0yYkhlR2ZnRFJWaWZDejVyVDZKaDZQcFlNeHZ6WFhtRjVySlNxRlp3?=
 =?utf-8?B?bktJbXIyMUhvd2liczRkOFJCKzZqQWhQWXVpZ3VPYmZrcTl5V3Q1ZDAveGVl?=
 =?utf-8?B?TnI1eVhnaEtLT1YxbzBscExlS01UU1BxdzAyeW4xWC90VGxSK1dGYW1MLzRH?=
 =?utf-8?B?ZXFLSDFGY2psZ1hWYThyc0lvVk8yVk00TzdnUk9WTTR3MmExaU5IYVZ5eUdT?=
 =?utf-8?B?RVpaanBONFdjSFhTRjhYNEcwcUVCdVVLTGRJcWtpVFpMR2c2NnNjbzgxWm9K?=
 =?utf-8?B?MUxpZmdxWVpvcUFMQkNZdUZKeDFjY01ObUkxTlg2RFNaYUR1R0t6RHNqMVJE?=
 =?utf-8?B?UmRPNnk2VGhvcXNKV09EUngyazJRMXpPRjlydkF0V3BIT2duN2NDMVA0QnhD?=
 =?utf-8?B?bGFPUm1DTHhTeUNEUEJFSy8xNHRDRmxrOEwyQW9tM3pVTUp5OUkvd0I5Ky9Q?=
 =?utf-8?B?NDZDQm05V0V5c3B4SkV3NEdiMnFRVXVBMERvZ1pTbFp6S1ozWklYUEtKbnNp?=
 =?utf-8?B?MHFBK0dBcGtpbExib2J5YVJqQ1lPbHkyVU9nemtyeXQvZWoxazYrVDRFNjNV?=
 =?utf-8?B?Z0xjdHl0MWpIZitJcC8xMHNlTSs4a3Z4ZTNRVEZ2QkhxdWtvRzc0ZWF3OXdQ?=
 =?utf-8?B?cDdLVmcvc2cwNFJNUUljc05rdnJRZGxFVTB5RlQxSW9Wbis1MW1qQ05pazhH?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <185FC2B7DEE71043A7D40A362E717930@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232de7b2-0a3b-4cc6-02f1-08db16ad2e55
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 21:22:06.5221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pfwwj7Ac3pF5pXWkpi+HfTfLRUhxsZnI+DYH0evlVSHNSwwHwexnb0RnF0kho6KoBVTOTICk4fhekFgWxUg7Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5466
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/11] drm/xe: Remove dependency on
 intel_gt_regs.h
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTAyLTI0IGF0IDEyOjI1IC0wODAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIEZyaSwgRmViIDI0LCAyMDIzIGF0IDA3OjQ3OjA0UE0gKzAwMDAsIFJvZHJpZ28gVml2
aSB3cm90ZToNCj4gPiBPbiBGcmksIDIwMjMtMDItMjQgYXQgMTA6MzQgLTA4MDAsIE1hdHQgUm9w
ZXIgd3JvdGU6DQo+ID4gPiBPbiBGcmksIEZlYiAyNCwgMjAyMyBhdCAxMDoyOToxNEFNIC0wODAw
LCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+ID4gPiA+IE9uIEZyaSwgRmViIDI0LCAyMDIzIGF0
IDEwOjA2OjE0QU0gLTA4MDAsIE1hdHQgUm9wZXIgd3JvdGU6DQo+ID4gPiA+ID4gT24gVGh1LCBG
ZWIgMTYsIDIwMjMgYXQgMDQ6NTI6MjBQTSAtMDgwMCwgTHVjYXMgRGUgTWFyY2hpDQo+ID4gPiA+
ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiBDcmVhdGUgcmVncy94ZV9ndF9yZWdzLmggZmlsZSB3aXRo
IGFsbCB0aGUgcmVnaXN0ZXJzIGFuZA0KPiA+ID4gPiA+ID4gYml0DQo+ID4gPiA+ID4gPiBkZWZp
bml0aW9ucyB1c2VkIGJ5IHRoZSB4ZSBkcml2ZXIuIEV2ZW50dWFsbHkgdGhlIHJlZ2lzdGVycw0K
PiA+ID4gPiA+ID4gbWF5DQo+ID4gPiA+ID4gPiBiZQ0KPiA+ID4gPiA+ID4gZGVmaW5lZCBpbiBh
IGRpZmZlcmVudCB3YXkgYW5kIHNpbmNlIHhlIGRvZXNuJ3Qgc3VwcG9ydGVkDQo+ID4gPiA+ID4g
PiBiZWxvdw0KPiA+ID4gPiA+ID4gZ2VuMTIsDQo+ID4gPiA+ID4gPiB0aGUgbnVtYmVyIG9mIHJl
Z2lzdGVycyB0b3VjaGVkIGlzIG11Y2ggc21hbGxlciwgc28gY3JlYXRlDQo+ID4gPiA+ID4gPiBh
DQo+ID4gPiA+ID4gPiBuZXcgaGVhZGVyLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBUaGUg
ZGVmaW5pdGlvbnMgdGhlbXNlbHZlcyBhcmUgZGlyZWN0IGNvcHkgZnJvbSB0aGUNCj4gPiA+ID4g
PiA+IGd0L2ludGVsX2d0X3JlZ3MuaCBmaWxlLCBqdXN0IHNvcnRpbmcgdGhlIHJlZ2lzdGVycyBi
eQ0KPiA+ID4gPiA+ID4gYWRkcmVzcy4NCj4gPiA+ID4gPiA+IENsZWFuaW5nIHRob3NlIHVwIGFu
ZCBhZGhlcmluZyB0byBhIGNvbW1vbiBjb2Rpbmcgc3R5bGUgaXMNCj4gPiA+ID4gPiA+IGxlZnQN
Cj4gPiA+ID4gPiA+IGZvcg0KPiA+ID4gPiA+ID4gbGF0ZXIuDQo+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50
ZWwuY29tPg0KPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfcmVnX2RlZnMuaMKgIHzCoMKgIDIgKw0KPiA+ID4gPiA+ID4gwqBkcml2ZXJzL2dw
dS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmjCoCB8IDI4Nw0KPiA+ID4gPiA+ID4gKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gPiA+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4
ZWNsaXN0LmPCoMKgwqDCoMKgIHzCoMKgIDIgKy0NCj4gPiA+ID4gPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2ZvcmNlX3dha2UuY8KgwqDCoCB8wqDCoCAzICstDQo+ID4gPiA+ID4gPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9nZ3R0LmPCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQ0K
PiA+ID4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqAgMyArLQ0KPiA+ID4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rf
Y2xvY2suY8KgwqDCoMKgwqAgfMKgwqAgMiArLQ0KPiA+ID4gPiA+ID4gwqBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3RfbWNyLmPCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICstDQo+ID4gPiA+ID4gPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIg
Ky0NCj4gPiA+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hZHMuY8KgwqDCoMKg
wqDCoCB8wqDCoCA0ICstDQo+ID4gPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
cGMuY8KgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0NCj4gPiA+ID4gPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2h3X2VuZ2luZS5jwqDCoMKgwqAgfMKgwqAgMiArLQ0KPiA+ID4gPiA+ID4gwqBk
cml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICst
DQo+ID4gPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDIgKy0NCj4gPiA+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21t
aW8uY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+ID4gPiA+ID4gPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9tb2NzLmPCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQ0KPiA+ID4g
PiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcmVnX3NyLmPCoMKgwqDCoMKgwqDCoCB8wqDC
oCAzICstDQo+ID4gPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9yZWdfd2hpdGVsaXN0
LmMgfMKgwqAgMyArLQ0KPiA+ID4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19v
cHMuY8KgwqDCoMKgwqAgfMKgwqAgMiArLQ0KPiA+ID4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfdHVuaW5nLmPCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICstDQo+ID4gPiA+ID4gPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICst
DQo+ID4gPiA+ID4gPiDCoDIxIGZpbGVzIGNoYW5nZWQsIDMwOCBpbnNlcnRpb25zKCspLCAyOCBk
ZWxldGlvbnMoLSkNCj4gPiA+ID4gPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS94ZS9yZWdzL3hlX2d0X3JlZ3MuaA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWdfZGVmcy5oDQo+ID4gPiA+ID4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnX2RlZnMuaA0KPiA+ID4gPiA+ID4gaW5k
ZXggYjVlMDZiNmE5NDc4Li5hNjA4MGM5ODNhNzcgMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZ19kZWZzLmgNCj4gPiA+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnX2RlZnMuaA0KPiA+ID4gPiA+ID4gQEAgLTEzNiw2
ICsxMzYsOCBAQCB0eXBlZGVmIHN0cnVjdCB7DQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
dTMyIHJlZzsNCj4gPiA+ID4gPiA+IMKgfSBpOTE1X21jcl9yZWdfdDsNCj4gPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gKyNkZWZpbmUgTUNSX1JFRyhvZmZzZXQpwqDCoMKgwqDCoMKgwqDCoCgoY29u
c3QgaTkxNV9tY3JfcmVnX3Qpew0KPiA+ID4gPiA+ID4gLnJlZyA9DQo+ID4gPiA+ID4gPiAob2Zm
c2V0KSB9KQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNob3VsZCB0aGVyZSBiZSBhIGNvcnJlc3Bv
bmRpbmcgcmVtb3ZhbCBvZiB0aGlzIGRlZmluaXRpb24NCj4gPiA+ID4gPiBmcm9tDQo+ID4gPiA+
ID4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3RfcmVncy5oID8NCj4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiBBc2lkZSBmcm9tIHRoYXQsDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gUmV2aWV3
ZWQtYnk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+ID4gPiA+IA0K
PiA+ID4gPiANCj4gPiA+ID4gZ29vZCBjYXRjaC4gSSB3YXMgdHJ5aW5nIG5vdCB0byBjaGFuZ2Ug
dGhlIGk5MTUgaGVhZGVycywgYnV0DQo+ID4gPiA+IHRoaXMNCj4gPiA+ID4gb25lIHdlbnQgdW5v
dGljZWQgd2hpbGUgZml4aW5nIHRoZSBidWlsZC4NCj4gPiA+ID4gDQo+ID4gPiA+IEkgd29uZGVy
IGlmIHRoaXMgc2hvdWxkIGJlIGEgc2VwYXJhdGUgcGF0Y2ggdG8gbWVyZ2UgaW4NCj4gPiA+ID4g
ZHJtLWludGVsLW5leHQgYnkgaXRzZWxmLiBJdCdzIGhhcm1sZXNzIHRob3VnaCBhbmQgd2UgY291
bGQNCj4gPiA+ID4ga2VlcCBpdA0KPiA+ID4gPiBpbiB0aGUgeGUgYnJhbmNoLCBhcyBsb25nIGFz
IGFsc28gcmVtb3ZpbmcgZnJvbQ0KPiA+ID4gPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRl
bF9ndF9yZWdzLmgNCj4gPiA+ID4gDQo+ID4gPiA+IFJvZHJpZ28gLyBNYXR0LCBhcmUgeW91IG9r
IHdpdGggdGhpcyBhcHByb2FjaD8NCj4gPiANCj4gPiB5ZWFwLCBhbnl0aGluZyB0b3VjaGluZyBv
dXRzaWRlIHhlIG5lZWRzIGEgc2VwYXJhdGVkIHBhdGNoIGFueXdheS4NCj4gPiBhbmQgSSBiZWxp
ZXZlIGl0IGNhbiBhbHJlYWR5IGJlIHNlbnQgZG8gaW50ZWwtZ2Z4LCByaWdodD8hDQo+IA0KPiB0
aGUgcHJvYmxlbSBpcyB0byBkZXBlbmQgb24gdGhhdCBwYXRjaC4gSWYgd2UgYXJlIHJlYmFzaW5n
IHRoZQ0KPiBkcm0teGUtbmV4dCBicmFuY2ggd2l0aCBhIG5vbi1mZi4gVGhlbiB3ZSBjb3VsZCBz
aW1wbHkgaGF2ZSB0aGUgcGF0Y2gNCj4gaW4gYm90aCBwbGFjZXMgYW5kIGhhbmRsZSB0aGUgY29u
ZmxpY3QuIElmIHdlIGFyZSBub3QgcmViYXNpbmcsIHRoZW4NCj4gaXMgaXQgb2sgdG8gaGF2ZSB0
aGUgcGF0Y2ggaW4gYm90aCBwbGFjZXMgYW5kIGRlYWwgd2l0aCBhIHBvc3NpYmxlDQo+IGNvbmZs
aWN0IGluIGEgbWVyZ2UgKG9yIGJhY2ttZXJnZSBpZiB3ZSBhcmUgbm90IHlldCBpbiBkcm0tbmV4
dCk/DQoNCndlIHdpbGwgaGF2ZSB0byByZWJhc2UsIHNvIGxldCdzIGFkZCB0aGUgcGF0Y2ggaW4g
Ym90aCBwbGFjZXMgYW5kDQpkZWFsIHdpdGggdGhlIGNvbmZsaWN0cy4NCg0KPiANCj4gTHVjYXMg
RGUgTWFyY2hpDQoNCg==
