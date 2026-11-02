Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A6606A329
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hqcFTVOq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCC910E626;
	Mon,  2 Nov 2026 10:38:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2585E10ECDC;
 Mon,  2 Nov 2026 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793615904; x=1825151904;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QEc0ARrwV59+umE+m1n480H/umHkWgzP8OcVyWLdb5w=;
 b=hqcFTVOq+FFN8V0KeDL8HMed5hYOo4cnlHE6+J4PmcJWezvbNDAo6rg/
 JXZe/sbsdLzggTtdXVKgoM4uNomdLdYeuvQUPrzAlAOeW+xtWmlIbYTj+
 YqTnYSbxDCBisQgn64Xm7nTUKCt2+GHOBvAp7rVBp0uKPaXhdqNIdXBCM
 hGcqgswgFHkAg5rCumIA5jWAfr5sRdkGm5XKFo/yDmiDbdY0HIykdd8LA
 7jXb+uHcwZMdQIUQAWr56ZcTa98uZIJpw2FhiHXvQWHP1WZskw2xMaHlR
 /QTmt/wJzE7j7tLBZWWdW9zwAKoaZ/EB5XDDPA61fWoSznKCRixZPsgdl g==;
X-CSE-ConnectionGUID: YLfj+oldTvCvq15bwVm+ZQ==
X-CSE-MsgGUID: oVxgYbtZRVakGG0kOQ0Gcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2328611"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2328611"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:38:23 -0800
X-CSE-ConnectionGUID: vpYwu8w4Q++kAx7WkLJhrA==
X-CSE-MsgGUID: 5rvV4c2XQ5Gm1C/3Vp/U5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6637934"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:38:23 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 02:38:22 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 02:38:22 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 02:38:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVOleKy68iefNgXiPmK+Piej/9dkoLZvMZTxP//IoX2Xy2HnaWHcDwvQWGkAyeufOsUvzgOq8nCA+BOOO/qi3LlO59EJcYVFPzMipgiHVcXEhHQKSofzrYMFXNKEHz48XazOUMgF2ogfIP0QG+5trhvrseRElz9B4wBpcLu0C6qGzIceDIoclKBtR+KizWD5LJDpNnuFmQEuEMoXtw6EgcNoGWSsOgJET94fgJiwWQLSaBNgJxrgIePTIMTSNFQewgLFQj8v6XsaZ5dl2QFI+rbKkoqNzyO2IkCYdMYFTuGZxuhB8CtNL8Cddsuksd6Oy2lPe1MsT30hz9QhmOQttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEc0ARrwV59+umE+m1n480H/umHkWgzP8OcVyWLdb5w=;
 b=yP/uglhEKh+clu54kBCQ1/4cEJcXTgaKe3ntRkbuR5IkBe0xD4oP3R2CzYi0YD1n9OW55fC5aSy6afplSkOaZ37vZusdcnhoYAu0LoMkXfuIe76RiiabYw97sQ3241j/nLwJcUftsmzj3ziaCa7JBTywRaWkM52IfrQXOaDfmTH3Q/p8uOpMZ0sqfCXKMrrLBRoRCO8tCZ2WnU0blz6OZMJJ2tC7pHKI/pSZxM6JByZUhawWHVzMB1503PG8gN6Rl7TvtRzmvE1s2BtAvgFpKI68F7dHG2bkbS0WaUo7kj3Tq1X3acWmeaminiJHYlX5y71FZIZOSl7ZtXdNt4qf8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by CH3PR11MB870661.namprd11.prod.outlook.com
 (2603:10b6:610:367::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:38:08 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:38:08 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Coelho, Luciano" <luciano.coelho@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v2 2/3] drm/i915/dp: don't touch the AUX engine while it's
 still busy
Thread-Topic: [PATCH v2 2/3] drm/i915/dp: don't touch the AUX engine while
 it's still busy
Thread-Index: AQHdX92SdLhXZTWVFUuzFasjRCuDNbcarLCg
Date: Mon, 2 Nov 2026 10:38:07 +0000
Message-ID: <DS4PPF69154114FAFE969E97C94E7347338EF6A2@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20261019150226.734375-1-luciano.coelho@intel.com>
 <20261019150226.734375-3-luciano.coelho@intel.com>
In-Reply-To: <20261019150226.734375-3-luciano.coelho@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|CH3PR11MB870661:EE_
x-ms-office365-filtering-correlation-id: d8068e32-a429-4211-063d-08df38cd6271
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|10067099003|18002099003|22082099003|38070700021|56012099006|11063799006|4143699003|261021123027099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003|261021121427099003;
x-microsoft-antispam-message-info: /pvUNPB/3Ygpzbri1q9PGgqlyHl0UJowyRwAvEIbnDOwQKevUinXjmOV0oA3U4rCCvCF+5dCrXDs9OXo9tMzY15jyIZz2zeALWXrlguALCHnAqfMEI7swBiTL7bxL9Jju4WpEV6hng3sg7P6qlzXGp4F3chCIeKkpc+07q5hqqtd/iuVwUWDID6X4bRmDgyZjwjMgKe0TD2ob7CGvlLjKAgQtvnFXoqeNzVgTY2jqDev9ulE1fGnYnDGMHQkF/zCDbELT4ipIjpLGnkPoGeIcKmqFBbqNMGjtA3hcRCwzDnWpQPD0rJa4r3UgzZ2GQxpV7ySO2lOF/s7LcsevHpZRXVeEg8e2gArrb1i43g2eZTsTD2TdzMKGM4dpb9m4TmKKMUpa1hrbrkP1rlX7hj+Ueitnfzovz2C+tatilsraPNeh+jD8xp1+fsjwrH+mNEaJEJtaasiIbsoK4A9085A0BCGzJNGCL1XVvHmmZIleBR5V68xKFHd1XxXDqemVt6mPLoyhhwaeSiPomPx3gtJ7zjBrbG9jtcvQptrxdCEFtBVs5MvgpDiv/c8IyE9ojdeJJfpvP9YqR3+nrucS39+YBdDAXbG7y1bmlz0mUBcLGAb+UYSyXhPhUnheHE0HPIwGwQwvrAwbM7SS1s49fyVm+SjVvbz2jT11lHjWgT1kQQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(4143699003)(261021123027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjM5WExzWGVPNUo4NTMxSEt0R0k4VEdWTGppVDNsMkVKd0Rmcjh2VE83Vm9Y?=
 =?utf-8?B?eU5kMXNjOTROQ3NzaGJsNmMxR1FVZ1dzUmtJZk9PZlBtWW1mQWtkc01DQnZC?=
 =?utf-8?B?L1MvV1Voc09mdGRCZzIvanZXMDlBQUhCeXZKdUZ3VWxzcDAyeTMxSkhmT094?=
 =?utf-8?B?clVRQmJtTWtudytSbkN5U0h4blNWTXRvQTFNZjl6eE9BNnl2UmFpelMyVTNr?=
 =?utf-8?B?ZGY4UVF0Z1MrMUJtRDBxaG1ReEVHZnFPWUxXRTFFWjlmb0lpZlgwUGlRUVlZ?=
 =?utf-8?B?TUZrb3lmK1RhbnYwdWVtWDZIKzZWcG80VDlrVXAzZGlET1RlZm1KaXFsc1hI?=
 =?utf-8?B?bkV1S0w3SGQvM3E1L3JiR29kaXc0MWRQTktGK0o2QlIvSk12U21ZbnRWcUNF?=
 =?utf-8?B?c3dJOUsyQURtbitOVklUYldRU051elAvY2UwN1k5RmhJNFNSS3dTRzJOZkN5?=
 =?utf-8?B?TG1Ua3dPajhaejBhdGlHa01OQklpYmE4RmVBTXJkNGlQVjV4NnZhQkZwY3h5?=
 =?utf-8?B?SzRMaHVkN1VqOWR1QmpIZTZyamhWcnRKSEdPQ1l3SXo2ZFY2RFBKK1lzcUMw?=
 =?utf-8?B?cGhQamhrRndYamRSckJwS3hBTndHTGhqajNVNTRQQnlGVGZBSDR4VXpwRU8z?=
 =?utf-8?B?aG1jSkV2RUU5enJyanRJVDl3QUxOaWxCazBVTUl6TTkxanNHM1dwTGJ0aGlX?=
 =?utf-8?B?NzBEeklJSk5NTmhEanpvY2xnS3k2dHVaUGxYa3NHSHBhc3dIKy83dGtpOVFs?=
 =?utf-8?B?RTFTTHpSMFczNWFnNDRmem1wY290UlZSdk5hRE9PWUQxNkdwdmgxZmZYZWtW?=
 =?utf-8?B?ejBTQlBVMFB0NzlzL2h6aUNaSmV2RU4ra0xaR3drNTgzZ2loR2JqQVVESkV0?=
 =?utf-8?B?NE5jVkhEcGd5V002MENBYUM0a05SSlpWQTFhUTFodk5QZzBBMDQrNWhoQ3ZW?=
 =?utf-8?B?emNtd1BYWHZycjZ4Mk1wV2p3WUdVME9rUUgrYjlNUlc0YUJtVnE0Mml0OUxE?=
 =?utf-8?B?bzlzeFQ5dXlZN2E3aGJHbklCNTRFdFBpVUM2cVF5cjQ0UnpsOXgwaWxWY0tm?=
 =?utf-8?B?OUFMTmhwd0s4NXZCM3J4eEpNMTg1K014WlpCUW9oaWdKb2tHenp4a2VoZmx2?=
 =?utf-8?B?R0k3bmFqa3dtS2lQWWs5eHVpRmt2RnV5L2VmTjhuZExiUkRlL1VhRnkxdElU?=
 =?utf-8?B?R0VIOWtIbmJVdlplTEpKMk92S1hPS1ZqV3NHTzRnaTEyeGZOQnF2c1RMQWpo?=
 =?utf-8?B?MkhiZGZpU3NKMVkvQStTSDYwQ3Q1blBCYWtkdDJSMDE4ekxTUkd5VXh2RjVz?=
 =?utf-8?B?bk44NG9HN1JXV1QxcmhoeXo1U01ZbWhJZ3gxS0ppK0tlSGxnZzM3dU9jdGJI?=
 =?utf-8?B?VnBtWnJLZXdyUW5UOThQaGduMFBnalV6YnU2TFIyNmM1TW8yZFR4d2c1dkRk?=
 =?utf-8?B?UTR6ZGxqaTFEbkxnV25UaDYycnhadTdiRVFGdzlWRUxXR2NTUU9KcGFLajZE?=
 =?utf-8?B?NWxFRjBtRVJEK3lacjlBM2RuUFFRbThmU0tTTGhXWDJQei9nMkczWTlpdjdW?=
 =?utf-8?B?QTNZMU1xQkFjcU8vb1ZxTW9DYkJGUXBVTG9YQzVJM1dWb1h3bTBpZUtmd3Jp?=
 =?utf-8?B?dFhtNi81K3J1c1A1L3lmWFA4dnh5KytLNFppSnZLYjFNalhuZXBhcWVCVE50?=
 =?utf-8?B?YjNrR0ZQUFh4Mktvbm0ydDNJNVBqaHA2VzgyMDhFUUE5SDhNVjBpMURlOVBl?=
 =?utf-8?B?dlFKakhKZWFqMGMxTWVxbHBmazlZc01kQ0Z4NFpnTEhqWU44UzNacm1RWE9p?=
 =?utf-8?B?M0doalljSzh2QXRHNmorUnFrcXhGM1JYMklTc21Tb2tDQWZGTVFzTzJ1U29v?=
 =?utf-8?B?amFCUFgzSVJCUDNYZkhMaHhhYktmTEl3YjRWbTM5WXdOWGNKclFFdk94QnJp?=
 =?utf-8?B?R2VZQ0doRUZWRzBnM01qdU1COC8yTkNoZGtESkNVMXdaU0ZpS2R0M1VFRUN6?=
 =?utf-8?B?cW96N3VScHFqdXlrb3pYaktmRWZZbUdQUlcvVjg4WXNNbzdRQ0tBKzZ0RG00?=
 =?utf-8?B?OHBoeHBtTHRZY3lvajl4cFA2cXlCYXJQZjFjYUpTMk95Rk5qa3FlcWxFR09N?=
 =?utf-8?B?blBsQ3I0U2Q1TDFtT3FQdmJla1lLdENZLy9wMmZYN0JYZEpCUnN1T3lYTCtv?=
 =?utf-8?B?N0kveGZKK0hGTCs1NzM1Mk9KNGxIejQxN21zSWw2YlF4RFNjQ1lVTjZJYlFD?=
 =?utf-8?B?VHNmUk40ZUJpZU9RTnRzSENNTkN0NS9NS3lKMFlLOGpxdi9lbWw0Y3oxL0Fa?=
 =?utf-8?B?NUhra2lLUmpnNUpua0J0K2h4WDcralFGK2VRNkhkcFUwRFkzdklQdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: a/4spciVfLxX8MDGZxzv9ivJTNuwBFYRQ6rGFMbWuzq6b0saQyJymLbCRrCQRPTjGWDwn+YMSKv0uXYp+gldDnV5N3RUDYxp3w7da/ctab9933JRmAzKExnpXJZxsdliqhfcSbHh2WZ2hWZF+KffZW8U0ljZon3TL6CJJUlJy2Uw4lLq1HthkT1k7lU9m0CkOy1gZmjcYHDixeCFLkNuDlV2KrDZhX+TSs1OEPZcoH3sZ4s5z3OkADWsjRaBhuOlgn2bljwO690bxg7tTlLUWvVxq7EFWHthWbE5jjW87i9we1xe4tsuX/MNm0yyqv5ZvjzRbfDlPeNcJGsx5uZllA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8068e32-a429-4211-063d-08df38cd6271
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 10:38:07.5321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yz6MRsqHT2Ay+Ox6S7kSaL1nMoDNqiRImtkibjUWVKIscxSWfPhzm5/32eAOYxgyp/uqBgz6AGevvXzTAV6hjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB870661
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEx1Y2EgQ29lbGhv
DQo+IFNlbnQ6IE1vbmRheSwgMTkgT2N0b2JlciAyMDI2IDE3LjUzDQo+IFRvOiBpbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbQ0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMi8z
XSBkcm0vaTkxNS9kcDogZG9uJ3QgdG91Y2ggdGhlIEFVWCBlbmdpbmUgd2hpbGUgaXQncyBzdGls
bCBidXN5DQo+IA0KPiBXaGVuIGFuIEFVWCB0cmFuc2FjdGlvbiBkb2Vzbid0IGZpbmlzaCB3aXRo
aW4gdGhlIGRyaXZlcidzIDEwbXMNCj4gdGltZW91dCwgaW50ZWxfZHBfYXV4X3hmZXIoKSB3cml0
ZXMgUE9SVF9BVVhfQ1RMIHdpdGggU2VuZCBCdXN5IHN0aWxsDQo+IHNldCBhbmQgcmUtdHJpZ2dl
cnMgdGhlIHRyYW5zYWN0aW9uLiAgVGhlIEJzcGVjIGV4cGxpY2l0bHkgZm9yYmlkcw0KPiBjaGFu
Z2luZyB0aGUgcmVnaXN0ZXIgb3Igd3JpdGluZyBTZW5kIEJ1c3kgYWdhaW4gd2hpbGUgaXQgaXMg
YXNzZXJ0ZWQuDQo+IA0KPiBJbiB0aGUgYnVncyBtZW50aW9uZWQgaGVyZSwgd2UgY2FuIG9ic2Vy
dmUgdGhhdCBvbiBOVkxfUyB3aXRoIGFuIExUVFBSDQo+IGRvY2sgdGhlIGVuZ2luZSBjYW4gcmVt
YWluIGJ1c3kgZm9yIHVwIHRvIH4yMG1zLiAgUmUtdHJpZ2dlcmluZyBpdA0KPiBjYXVzZXMgcmVw
ZWF0ZWQgMTBtcyBlcnJvcnMgYW5kIGNhbiBsZWFkIHRvICJub3QgZG9uZSIgZm9sbG93ZWQgYnkg
YQ0KPiAibm90IHN0YXJ0ZWQiIFdBUk4uDQo+IA0KPiBHaXZlIGVhY2ggYXR0ZW1wdCB1cCB0byAx
MDBtcyB0byBmaW5pc2guICBJZiB0aGUgZW5naW5lIHJlbWFpbnMgYnVzeSwNCj4gcmV0dXJuIC1F
QlVTWSB3aXRob3V0IHRvdWNoaW5nIHRoZSBjb250cm9sIHJlZ2lzdGVyIGFuZCBsZXQgdGhlIERS
TQ0KPiBoZWxwZXJzIHJldHJ5LiAgRGVtb3RlIHRoZSAxMG1zIGVycm9yIHRvIGEgZGVidWcgbWVz
c2FnZSwgc2luY2UgaXQgY2FuDQo+IG9jY3VyIHdoaWxlIGEgdHJhbnNhY3Rpb24gaXMgc3RpbGwg
aW4gcHJvZ3Jlc3MsIGFuZCB0dXJuIHRoZQ0KPiBwcmUtdHJhbnNhY3Rpb24gIm5vdCBzdGFydGVk
IiBXQVJOIGludG8gYSBwbGFpbiBlcnJvciwgc2luY2UgdGhlDQo+IGJhY2t0cmFjZSBkb2Vzbid0
IGFkZCBhbnl0aGluZy4NCj4gDQo+IFRoZSAxMDBtcyBhcHBsaWVzIHBlciBhdHRlbXB0LCBub3Qg
cGVyIHRyYW5zZmVyLCBzbyBhIG1pc2JlaGF2aW5nDQo+IGVuZ2luZSBjYW4ga2VlcCBpbnRlbF9k
cF9hdXhfeGZlcigpIGJ1c3kgZm9yIHVwIHRvIDUgeCAxMDBtcyBwZXIgY2xvY2sNCj4gZGl2aWRl
ciBpbnN0ZWFkIG9mIDUgeCAxMG1zLg0KPiANCj4gQnNwZWM6IDY5Njk1DQo+IENsb3NlczogaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvOTA5MA0K
PiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0v
aXNzdWVzLzkwOTINCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBDb2VsaG8gPGx1Y2lhbm8uY29lbGhv
QGludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRl
bC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
X2F1eC5jIHwgNzEgKysrKysrKysrKysrKystLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNDkg
aW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9hdXguYyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4LmMNCj4gaW5kZXggMzk0MzI2ZDE3ZTBkLi5hNjg3MWE1
NDkyZDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHBfYXV4LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9h
dXguYw0KPiBAQCAtNTQsMzUgKzU0LDUyIEBAIHN0YXRpYyB2b2lkIGludGVsX2RwX2F1eF91bnBh
Y2sodTMyIHNyYywgdTggKmRzdCwgaW50IGRzdF9ieXRlcykNCj4gIAkJZHN0W2ldID0gc3JjID4+
ICgoMyAtIGkpICogOCk7DQo+ICB9DQo+IA0KPiAtc3RhdGljIHUzMg0KPiAtaW50ZWxfZHBfYXV4
X3dhaXRfZG9uZShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKQ0KPiArc3RhdGljIGJvb2wNCj4g
K19faW50ZWxfZHBfYXV4X3dhaXRfZG9uZShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLCB1bnNp
Z25lZCBpbnQgdGltZW91dF9tcywNCj4gKwkJCSB1MzIgKnN0YXR1cykNCj4gIHsNCj4gIAlzdHJ1
Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoaW50ZWxfZHApOw0K
PiAgCWludGVsX3JlZ190IGNoX2N0bCA9IGludGVsX2RwLT5hdXhfY2hfY3RsX3JlZyhpbnRlbF9k
cCk7DQo+IC0JY29uc3QgdW5zaWduZWQgaW50IHRpbWVvdXRfbXMgPSAxMDsNCj4gLQlib29sIGRv
bmUgPSB0cnVlOw0KPiAtCXUzMiBzdGF0dXM7DQo+IC0JaW50IHJldDsNCj4gDQo+ICAJaWYgKGlu
dGVsX3BhcmVudF9pcnFfZW5hYmxlZChkaXNwbGF5KSkgew0KPiAtI2RlZmluZSBDICgoKHN0YXR1
cyA9IGludGVsX2RlX3JlYWQoZGlzcGxheSwgY2hfY3RsKSkgJiBEUF9BVVhfQ0hfQ1RMX1NFTkRf
QlVTWSkgPT0gMCkNCj4gLQkJZG9uZSA9IHdhaXRfZXZlbnRfdGltZW91dChkaXNwbGF5LT5nbWJ1
cy53YWl0X3F1ZXVlLCBDLA0KPiArI2RlZmluZSBDICgoKCpzdGF0dXMgPSBpbnRlbF9kZV9yZWFk
KGRpc3BsYXksIGNoX2N0bCkpICYgRFBfQVVYX0NIX0NUTF9TRU5EX0JVU1kpID09IDApDQo+ICsJ
CXJldHVybiB3YWl0X2V2ZW50X3RpbWVvdXQoZGlzcGxheS0+Z21idXMud2FpdF9xdWV1ZSwgQywN
Cj4gIAkJCQkJICBtc2Vjc190b19qaWZmaWVzX3RpbWVvdXQodGltZW91dF9tcykpOw0KPiAtDQo+
ICAjdW5kZWYgQw0KPiAgCX0gZWxzZSB7DQo+IC0JCXJldCA9IGludGVsX2RlX3dhaXRfbXMoZGlz
cGxheSwgY2hfY3RsLA0KPiAtCQkJCSAgICAgICBEUF9BVVhfQ0hfQ1RMX1NFTkRfQlVTWSwgMCwN
Cj4gLQkJCQkgICAgICAgdGltZW91dF9tcywgJnN0YXR1cyk7DQo+IC0NCj4gLQkJaWYgKHJldCA9
PSAtRVRJTUVET1VUKQ0KPiAtCQkJZG9uZSA9IGZhbHNlOw0KPiArCQlyZXR1cm4gaW50ZWxfZGVf
d2FpdF9tcyhkaXNwbGF5LCBjaF9jdGwsDQo+ICsJCQkJCURQX0FVWF9DSF9DVExfU0VORF9CVVNZ
LCAwLA0KPiArCQkJCQl0aW1lb3V0X21zLCBzdGF0dXMpID09IDA7DQo+ICAJfQ0KPiArfQ0KPiAN
Cj4gLQlpZiAoIWRvbmUpDQo+IC0JCWRybV9lcnIoZGlzcGxheS0+ZHJtLA0KPiAtCQkJIiVzOiBk
aWQgbm90IGNvbXBsZXRlIG9yIHRpbWVvdXQgd2l0aGluICV1bXMgKHN0YXR1cyAweCUwOHgpXG4i
LA0KPiAtCQkJaW50ZWxfZHAtPmF1eC5uYW1lLCB0aW1lb3V0X21zLCBzdGF0dXMpOw0KPiArc3Rh
dGljIHUzMg0KPiAraW50ZWxfZHBfYXV4X3dhaXRfZG9uZShzdHJ1Y3QgaW50ZWxfZHAgKmludGVs
X2RwKQ0KPiArew0KPiArCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxf
ZGlzcGxheShpbnRlbF9kcCk7DQo+ICsJLyoNCj4gKwkgKiBUaGUgSFcgdGltZW91dCBpcyA0bXMs
IGJ1dCBhIGRvd25zdHJlYW0gTFRUUFIgcmVjb3ZlcmluZyBmcm9tIGENCj4gKwkgKiBwb3dlciBz
dGF0ZSB0cmFuc2l0aW9uIGNhbiBrZWVwIHRoZSBlbmdpbmUgYnVzeSBtdWNoIGxvbmdlciwgc28N
Cj4gKwkgKiBnaXZlIGl0IHVwIHRvIDEwMG1zIGJlZm9yZSBnaXZpbmcgdXAuDQo+ICsJICovDQo+
ICsJY29uc3QgdW5zaWduZWQgaW50IHRpbWVvdXRfbXMgPSAxMDsNCj4gKwljb25zdCB1bnNpZ25l
ZCBpbnQgc3R1Y2tfdGltZW91dF9tcyA9IDEwMDsNCj4gKwl1MzIgc3RhdHVzOw0KPiArDQo+ICsJ
aWYgKF9faW50ZWxfZHBfYXV4X3dhaXRfZG9uZShpbnRlbF9kcCwgdGltZW91dF9tcywgJnN0YXR1
cykpDQo+ICsJCXJldHVybiBzdGF0dXM7DQo+ICsNCj4gKwlkcm1fZGJnX2ttcyhkaXNwbGF5LT5k
cm0sDQo+ICsJCSAgICAiJXM6IGRpZCBub3QgY29tcGxldGUgb3IgdGltZW91dCB3aXRoaW4gJXVt
cyAoc3RhdHVzIDB4JTA4eCksIHdhaXRpbmcgZm9yIHRoZSBBVVggZW5naW5lIHRvIHJlY292ZXJc
biIsDQo+ICsJCSAgICBpbnRlbF9kcC0+YXV4Lm5hbWUsIHRpbWVvdXRfbXMsIHN0YXR1cyk7DQo+
ICsNCj4gKwlpZiAoX19pbnRlbF9kcF9hdXhfd2FpdF9kb25lKGludGVsX2RwLCBzdHVja190aW1l
b3V0X21zIC0gdGltZW91dF9tcywNCj4gKwkJCQkgICAgICZzdGF0dXMpKQ0KPiArCQlyZXR1cm4g
c3RhdHVzOw0KPiArDQo+ICsJZHJtX2VycihkaXNwbGF5LT5kcm0sDQo+ICsJCSIlczogZGlkIG5v
dCBjb21wbGV0ZSBvciB0aW1lb3V0IHdpdGhpbiAldW1zIChzdGF0dXMgMHglMDh4KVxuIiwNCj4g
KwkJaW50ZWxfZHAtPmF1eC5uYW1lLCBzdHVja190aW1lb3V0X21zLCBzdGF0dXMpOw0KPiANCj4g
IAlyZXR1cm4gc3RhdHVzOw0KPiAgfQ0KPiBAQCAtMzMzLDkgKzM1MCw5IEBAIGludGVsX2RwX2F1
eF94ZmVyKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ICAJCWNvbnN0IHUzMiBzdGF0dXMg
PSBpbnRlbF9kZV9yZWFkKGRpc3BsYXksIGNoX2N0bCk7DQo+IA0KPiAgCQlpZiAoc3RhdHVzICE9
IGludGVsX2RwLT5hdXhfYnVzeV9sYXN0X3N0YXR1cykgew0KPiAtCQkJZHJtX1dBUk4oZGlzcGxh
eS0+ZHJtLCAxLA0KPiAtCQkJCSAiJXM6IG5vdCBzdGFydGVkIChzdGF0dXMgMHglMDh4KVxuIiwN
Cj4gLQkJCQkgaW50ZWxfZHAtPmF1eC5uYW1lLCBzdGF0dXMpOw0KPiArCQkJZHJtX2VycihkaXNw
bGF5LT5kcm0sDQo+ICsJCQkJIiVzOiBub3Qgc3RhcnRlZCAoc3RhdHVzIDB4JTA4eClcbiIsDQo+
ICsJCQkJaW50ZWxfZHAtPmF1eC5uYW1lLCBzdGF0dXMpOw0KPiAgCQkJaW50ZWxfZHAtPmF1eF9i
dXN5X2xhc3Rfc3RhdHVzID0gc3RhdHVzOw0KPiAgCQl9DQo+IA0KPiBAQCAtMzY5LDYgKzM4Niwx
NiBAQCBpbnRlbF9kcF9hdXhfeGZlcihzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiANCj4g
IAkJCXN0YXR1cyA9IGludGVsX2RwX2F1eF93YWl0X2RvbmUoaW50ZWxfZHApOw0KPiANCj4gKwkJ
CS8qDQo+ICsJCQkgKiBUaGUgYnNwZWNzIHNwZWNpZnkgdGhhdCB3ZSBjYW5ub3QgY2hhbmdlIGFu
eSBmaWVsZHMNCj4gKwkJCSAqIHdoaWxlIFNlbmQgQnVzeSBpcyBhc3NlcnRlZC4gIExlYXZlIHRo
ZSBzdHVjayBlbmdpbmUNCj4gKwkJCSAqIGFsb25lLCB0aGUgY2FsbGVyIHdpbGwgcmV0cnkgdGhl
IHRyYW5zYWN0aW9uIGxhdGVyLg0KPiArCQkJICovDQo+ICsJCQlpZiAoc3RhdHVzICYgRFBfQVVY
X0NIX0NUTF9TRU5EX0JVU1kpIHsNCj4gKwkJCQlyZXQgPSAtRUJVU1k7DQo+ICsJCQkJZ290byBv
dXQ7DQo+ICsJCQl9DQo+ICsNCj4gIAkJCS8qIENsZWFyIGRvbmUgc3RhdHVzIGFuZCBhbnkgZXJy
b3JzICovDQo+ICAJCQlpbnRlbF9kZV93cml0ZShkaXNwbGF5LCBjaF9jdGwsDQo+ICAJCQkJICAg
ICAgIHN0YXR1cyB8IERQX0FVWF9DSF9DVExfRE9ORSB8DQo+IC0tDQo+IDIuNTMuMA0KDQo=
