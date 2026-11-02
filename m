Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75539606A330
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 10:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jyCTVqC7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA5510ECD5;
	Mon,  2 Nov 2026 10:46:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEF310ECD5;
 Mon,  2 Nov 2026 10:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793616385; x=1825152385;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yd1A0XoO9tZ8Ex2vGoSbjYPATU2KkpXH23gOy4EcA2U=;
 b=jyCTVqC7jdl3wa/3QhYHuoc7wTj5kExr+q0xYQvPMh+V/o+onI/oBRAN
 w2cOYmyAY/b8OcyuWZAkYG+rnsbdiV1jv2zNX4hXvdP5/3dzuA3+IyvEH
 cIXHSrJ0z4z+S2yIB7tG04uycKkUsjmJop1lw9fMNPf3Dr9ICqexU6i3E
 hvqZq6+nhWpNJH/UZr2cmZhkSh/YUTQKcUNuVksZ+7sgwwWgjkJzqPgEg
 9l7NCkq6LyULfZyO+F6zM5hcUuoZ/IgeKLp00W78xFF5ugXAcS7a7WngI
 LkVJM7slw1/u2PO7Mit22OWbWeNayQR1AN5H4C/OcW+95Xkn1SOtBAIM0 A==;
X-CSE-ConnectionGUID: /MKdSSfYQx+m9MupSoIexA==
X-CSE-MsgGUID: xGvyVgbqT8+uR7IObGNCOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2304995"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2304995"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:46:24 -0800
X-CSE-ConnectionGUID: khjk+Q7tSS6FtpHWXjhElg==
X-CSE-MsgGUID: e2yRsHniQYCZE1ZbLcqeNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5943859"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:46:22 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 02:46:21 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 02:46:21 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 02:46:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kq+R8EwaTovbODqNlu5aK3SVVrZA1xDrGmTuRxo1RMhO6NPByO4AXI87fFNVBIMtIKChDAf45Urc6+ZYdcy4XxySLRJFB6BFHzJrXJwJHcEL5Qnmq9/3HNhtwaQOAuSyDFHWlKjqqmd5yhshZsKw4W6BFAX/rjvelOxiPf86FxUU5qxDHhC48PFuF9ppCOJX3SoDHsxbKttKFSB1l57s5Up//JKiNe0Ta/ZcC/QzkMSCGtQBbW5v9sIPNlnU3bryLjTvBig4LcnOisez+0cJcPK7d4/EQ8zrtSYa6nxywC4ahlAInZ0VrMXssMzYwE+LwUDuFOl6lzZLCg2/SNOYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yd1A0XoO9tZ8Ex2vGoSbjYPATU2KkpXH23gOy4EcA2U=;
 b=Q6+CbZjtLOl5NH4pvDcSryyi/vswAf6vrzCJtXvMQMxUOc3j8+0sI9z5DHOHFlmWzV3GChHAQ38FFoYhyOGAKHiN5A677207iCukCA3PrYBdV+gbOAuP3lf3TjaLVl+EpRT9oqFNX5Y70AFjjHOliCHUevUxKdmTQBMDjNwIzwu17ZDw6i25X2KRnjIVeFDizoJzJT3lvK6RcymlYUKAZc3XbjmdxZqn53ixT87QUEzXjtiHdpg4M1dhHzt4/nE436m2ylUD/a9NTtcUfPlLkFCUkLC6fUChmHQ0/zNgSX8Ab1XhIHjsiaaBHX1hsLTB+kqcthugQZfWtx4ZV2lB7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by CH3PR11MB870661.namprd11.prod.outlook.com
 (2603:10b6:610:367::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:46:14 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:46:14 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Coelho, Luciano" <luciano.coelho@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v2 3/3] drm/i915/dp: only complain about a busy AUX engine
 when it's unexpected
Thread-Topic: [PATCH v2 3/3] drm/i915/dp: only complain about a busy AUX
 engine when it's unexpected
Thread-Index: AQHdX92WgABP4ZjoKUaRH7gP9b0cjrcarvQQ
Date: Mon, 2 Nov 2026 10:46:14 +0000
Message-ID: <DS4PPF69154114F795B3785BF7D47129008EF6A2@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20261019150226.734375-1-luciano.coelho@intel.com>
 <20261019150226.734375-4-luciano.coelho@intel.com>
In-Reply-To: <20261019150226.734375-4-luciano.coelho@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|CH3PR11MB870661:EE_
x-ms-office365-filtering-correlation-id: 4e09fa4f-74ef-45d3-e2de-08df38ce8475
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|18002099003|22082099003|38070700021|56012099006|11063799006|4143699003|261021123027099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003|261021121427099003;
x-microsoft-antispam-message-info: wy+N2Z0MgIrDDK0ySVJ7Z6tZpk+W3tlVGwdf7ZPc7TSs/OE7xGIxoOeVeT7/MeHHj8S+PDKk8Blh+LsaKcnYacoDYPWLRLerTwhEW1QdOM0LOcohPdm8Uk9ky5TuQQXHVCDMipsPZk1/qO3UypF9qzwUmXzmp23iBWV37zUaGW58U9cQw18MbY8Us3/XoeFYEhSocRsaG0+LIzaBCFMu+obvA87zoXauUQh9wu77cmOA5mLxiv0lDF3Axw+kG80eobDDbo2+a7t7iDgLX07TO3rPUdrTRygr+5GNhJ0VFIc9dS6lkgKGvs77pjdUkJwHyR4Zcbat0+c7/gPPk8DyGG9yfGhj4oyvMbhn7hJaSqcS4p2jGJdEcIEYLONJdNUtSuO8BKSwAmFJ8g2jIYgDmApeD3zlWE5D/sQ93H4qZeRgGU8YkRU5xLEqXVGhRqpPDVYo1Q9cxCPNllI5OsTeN3TCar1pxfUmOB+SGgdCZafei/zR6jVF76oznvuCw5qJLuZFL27NEGmKOFwNJrpPyVb/Nua2k4IYC5xk0sbGXPkiFyPUHoZjKcD+7shkNZUhpkm+oplCk7c2B/9kLrkgsUK3Z//jn7njaprUDdL6YthkL4QABJRmWgIbtcjSrWOIWla3Zhb2fB6BR9v5iUoC4fQmdVCrkhxbzlI/9l++gwZrqwsWTjD67GEbRNcP5Qq0c20P1eJQhgEXuhQx0K0TKcMaQLqsJBsQGYrKCqlSOCk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(4143699003)(261021123027099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uzl2ck1hVVVLWHdYMDBxMmVGQ2IrdkxhbU1Ha1M2QzhUdzRhalQ2NExZczFB?=
 =?utf-8?B?c0p0bEZaRlUyTDZMMSswRXVBbEd6T2FWU2xNcUo0dzhwY084bzU4QVo5M3hu?=
 =?utf-8?B?aGVUWTU4dS96OWtrZm0yd3VPeHFaVldDVG5xMGpqOTYxUWp0djkrVTd6ZkUy?=
 =?utf-8?B?L0ZoYU1ZaUYzSk8rQis4cUFBNGx6OVB6cC9hUmtRUlVLT3FvaFlWTnNRbjZq?=
 =?utf-8?B?b3B3M29md25MUTdaVzRmOUNoWkNVcHJzZXcwN3hBZklWVVMxcXpGQ2JJYTQ5?=
 =?utf-8?B?WkdnRDh6d1hTU3ZMQTEyN3luRDRNODRQMHdPczBVajFUNHVHSVZFb2Q4M0U3?=
 =?utf-8?B?K21CcDZ4VVdWNWk5SytFT3VNZ1RuaytUZVJPWmN1azNudmI4bU9oTW9CNUlw?=
 =?utf-8?B?d3RpZzdFWDJLZ3hvZDNQcU15NGR3OUNKN3hSQmlZd25ONC81RUhoUDBqMWw0?=
 =?utf-8?B?elR2REd4a01BM2FjdEtkSlhndWZDQlFGYVFPRk1oaGZ6RnV6MXBWcGxqclNj?=
 =?utf-8?B?Vm1UeUg3blZOaTJWL2pUbVFpTTNVajBzWUdUNms0UnB2b0JOWkxhMDJ2MFdS?=
 =?utf-8?B?ZFdOT0FGMXZpa0JvWEEvN1ZXcTdza2RzakhnZTM3WVhDN0JZQnNIZDhhalRZ?=
 =?utf-8?B?eEFsaXhUNEgvQ2NYWkZRMWxMWUJtcktBUndkUWtDUHkzSWNvNHBlNm45d1BK?=
 =?utf-8?B?MVNPY3J6ZXQrbzBxMkI5ZTZxQjNEZ3NueHpqY0lqTXBOalRvSHJWRmhyODhD?=
 =?utf-8?B?dldzbXRhM3Mzc3g1SFd1d04rRmhuNHdoVlVUakZkbUVpbHMvTW5MRzB4WjM0?=
 =?utf-8?B?RWE4NUhud1hXRWhsMUNDVWpMTFM0UkhFRFcwNjljcXJDTnUxL2JFYk9ZUlVs?=
 =?utf-8?B?bkk1ZzdLNTUyRmhEcWdUZ2xiU3JKRTMwM3o4V3VTMThYNUFvQVlaQy9ncldw?=
 =?utf-8?B?c3Znb3FweEpPcnlpTGJXbGNwRzVXYjllUjUxdklvcFNaaEl1K0loOTZqNlBM?=
 =?utf-8?B?b2FnVnNCWFZGTkptVXVHN1FQaDR2UWd1YjlqaTdUOXN6a016WitKcXplQzFX?=
 =?utf-8?B?Qk1XSDA1cmJFcXhLdEJhVlRtU3hFZ0Y1N2ZHWEozcWYxWlFiS3VyZ1BIeEts?=
 =?utf-8?B?cVlrRFQ0eGF3dlRUTklRSkgxU1B0YU5RMUxZVVg5UlA3RUplTUE0eGY3SGZV?=
 =?utf-8?B?Q09BNGt0bzJSZFk1bWliR0RRNWtld1F1L3F3MWE3cWFMVlJPRzc2WFUrVGhv?=
 =?utf-8?B?ZFFGNm1Wdm5mRG15K2JPaWJ2K3hBaVJEbC8yZ0djbVFDMmE4NUxEclozWHNR?=
 =?utf-8?B?SUtjeUhnVmZmT2pBTnJpWmZmNlVDa0xJRjM5cnY0Q1d5NnkxTFQzV0lnbEw2?=
 =?utf-8?B?YlM0WDVKRkNodHNxOEFZTkFTaFlJWWkzeVVPcTgxYVV4NklTZ1JQWGZVbnhn?=
 =?utf-8?B?WnZPRk9EWndQTDZlRllDL1pnVTM1MlBMNjJ2eEdBZWVhWUJTQWlQSVkwbHpn?=
 =?utf-8?B?VGVzRTI1Nml1U3FrY2RCRStjb05Pa3dxczUrbDBTYXN5UnlLdzV4K2VuODZW?=
 =?utf-8?B?Tk1SeG1RUjBlMVJUcTRtcjFmNjltQzI1clVaTVZhQ2xINWFndlRvOFVOdDdO?=
 =?utf-8?B?RzlSY3dDNGNpQWEvQnhsUW1xOWxoL1M2VVpQMGhwckhmUTdvNy9VbFhDdSs2?=
 =?utf-8?B?S0JXMStNa2pvOWFEWkZNZk1ETS9lVzRmcHo2ckZtT3Ztc1JxZ3h5NUxUZlhk?=
 =?utf-8?B?bEJCWlBUSUYvVU1nUWhFcnZFTW05ZEVhSTN2K1A4L3FJaGJrSUVKeGFMeDBJ?=
 =?utf-8?B?SGhScUlYdDh5czgzblpjZVB0b1JyTmx0eFhUVGNNcXFmai9oejZOcGdpdnRS?=
 =?utf-8?B?dzhvRkdmdXFNa2YydXI2VHNySmdqVE0veHFBaTVDeTlKRFp1d3lrOUxJcWFD?=
 =?utf-8?B?clo0VFlzQ2NYYmc1TWQrRlJZSENOMnVrYngwVExhYmxLdzBiUVV1VUMwdzVz?=
 =?utf-8?B?bkNDNitJZmpaWkJMcjNFdlluMUR0OVBpTEx3dUFXbWlMM2J2SWx2TFU2MHVx?=
 =?utf-8?B?SHdRb2pFZVFtNUNzVUN0T2Z2QnQ4WTZaemFYaUVOWlhDeHNRWG9DeHVsTzRX?=
 =?utf-8?B?U2RkUE5ScWZtY0d4cmlSRmozWjhMSS8za2hOaStiTXgyTlJYK2dzUjE3YWIx?=
 =?utf-8?B?Y0dqOEpuclZ3NEU3Ryt1Mlp6YnVvNldIVFBGSS90UE1ueGM0cllmbXl0M3BO?=
 =?utf-8?B?VFozWms2OVgxL0VQSHB1bThHOXZqM3hhcSs2UzVYeXhxSmtFMjA3ODZ1dEdU?=
 =?utf-8?B?LytnY3RHQmJTWVhaYTRidTd6UEk5T2pQQVpwTWRScXhLL3dMYWYzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZXcfnOtFdIQPTt+qwlSad+alYcBpl5P9SFMxMWoG18UrjTjjv1LnTHfq33405dL0hauV+59+3jrB5rWtanPW1QCFgzMx2+tOV04y6G7AMMomrNoI/kf+akCzg+xm368lfbmconwVgNdfL45A3pO7h4mnxciQYIRT0puenhxFXAacJ3pWUgACeRkEN97Joy3UH1Zu23Vj8AMSpKvj0/ko4fswdaOlMODqnJYEuYlmrN0PrwscfF1LGtd6qZli2C/m2SRn1M+jBIIp7PuPkulJOet/z3dzz7jRMza/N0p77UGUTTMgOMsULHzxrIDbSRk8/QvHOQ/R7woVz3x7Aq999w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e09fa4f-74ef-45d3-e2de-08df38ce8475
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 10:46:14.6170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xOHFi/intbsuy/xL60WM6U7SgdCT4kRQ6EnBrXN24/dGKT1vVCWTaypCNbBJrsg1UdhDGqKbRhfp7DtBir8jdA==
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEx1Y2EgQ29lbGhv
DQo+IFNlbnQ6IE1vbmRheSwgMTkgT2N0b2JlciAyMDI2IDE3LjUzDQo+IFRvOiBpbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbQ0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMy8z
XSBkcm0vaTkxNS9kcDogb25seSBjb21wbGFpbiBhYm91dCBhIGJ1c3kgQVVYIGVuZ2luZSB3aGVu
IGl0J3MgdW5leHBlY3RlZA0KPiANCj4gV2hlbiBpbnRlbF9kcF9hdXhfeGZlcigpIGdpdmVzIHVw
IG9uIGEgdHJhbnNhY3Rpb24gYmVjYXVzZSB0aGUgQVVYDQo+IGVuZ2luZSBpcyBzdGlsbCBidXN5
LCB0aGUgRFJNIGhlbHBlcnMgcmV0cnkgYWxtb3N0IGltbWVkaWF0ZWx5LiAgSWYNCj4gdGhlIGVu
Z2luZSBzdGlsbCBoYXNuJ3QgcmVjb3ZlcmVkIGJ5IHRoZW4sIHRoZSBwcmUtdHJhbnNhY3Rpb24g
YnVzeQ0KPiBjaGVjayByZXBvcnRzICJub3Qgc3RhcnRlZCIgYXMgYW4gZXJyb3IsIGV2ZW4gdGhv
dWdoIHRoaXMgaXMgdGhlDQo+IGV4cGVjdGVkIG91dGNvbWUgb2Ygb3VyIG93biBlYXJsaWVyIGRl
Y2lzaW9uIHRvIGxlYXZlIHRoZSBlbmdpbmUNCj4gYWxvbmUuDQo+IA0KPiBSZW1lbWJlciB3aGVu
IHdlIGxlZnQgdGhlIGVuZ2luZSBidXN5IGFuZCBvbmx5IGxvZyBhIGRlYnVnIG1lc3NhZ2UgaW4N
Cj4gdGhhdCBjYXNlLiAgS2VlcCB0aGUgZXJyb3IgZm9yIHRoZSB1bmV4cGVjdGVkIGNhc2VzLCBu
YW1lbHkgd2hlbg0KPiBzb21lb25lIGVsc2UgaXMgdXNpbmcgdGhlIGNoYW5uZWwgb3IgdGhlIGVu
Z2luZSBpcyBodW5nIHdpdGhvdXQgdXMNCj4gaGF2aW5nIGdpdmVuIHVwIG9uIGl0IGZpcnN0Lg0K
PiANCj4gT25jZSB3ZSBsZWF2ZSB0aGUgZW5naW5lIGJ1c3ksIGxhdGVyIHRyYW5zZmVycyBmYWls
IHRoZSBidXN5IGNoZWNrDQo+IGJlZm9yZSBhIG5ldyB0cmFuc2FjdGlvbiBpcyBzdGFydGVkLCBz
byB0aGUgMTAwbXMgdGltZW91dCBlcnJvciBpcyBub3QNCj4gcmVwb3J0ZWQgYWdhaW4gZXZlbiBp
ZiB0aGUgZW5naW5lIG5ldmVyIHJlY292ZXJzLiAgVG8gc3RpbGwgY2F0Y2ggYQ0KPiBwZXJtYW5l
bnRseSBodW5nIGVuZ2luZSwgb25seSB0cmVhdCB0aGUgYnVzeSBzdGF0ZSBhcyBleHBlY3RlZCBm
b3IgdXANCj4gdG8gMXMgYWZ0ZXIgd2UgbGVmdCBpdCBidXN5LCB3aGljaCBjb3ZlcnMgdGhlIGxv
bmdlc3QgTFRUUFIgc3RhbGwNCj4gd2UndmUgc2VlbiwgYW5kIHJlcG9ydCB0aGUgIm5vdCBzdGFy
dGVkIiBlcnJvciBhZ2FpbiBhZnRlciB0aGF0Lg0KPiANCj4gRm9yIHRoYXQgdG8gd29yaywgYXV4
X2J1c3lfbGFzdF9zdGF0dXMgaGFzIHRvIGJlIHJlc2V0IGFzIHdlbGwsIHNpbmNlDQo+IGEgaHVu
ZyBlbmdpbmUgdGVuZHMgdG8gY29tZSBiYWNrIHdpdGggdGhlIHNhbWUgQ0hfQ1RMIHZhbHVlIGFu
ZCB3b3VsZA0KPiBvdGhlcndpc2UgYmUgZGVkdXBsaWNhdGVkIGF3YXkuICBDbGVhciBpdCB3aGVu
ZXZlciBhIHRyYW5zZmVyIGZpbmRzDQo+IHRoZSBlbmdpbmUgaWRsZS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEx1Y2EgQ29lbGhvIDxsdWNpYW5vLmNvZWxob0BpbnRlbC5jb20+DQoNClJldmlld2Vk
LWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgLi4u
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oICAgIHwgIDggKysrKysNCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4LmMgICB8IDM1ICsrKysr
KysrKysrKysrKy0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheV90eXBlcy5oDQo+IGluZGV4IDBlMzA4M2U4NTJkNS4uYWQ4MzFjM2NkNzcw
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXlfdHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXlfdHlwZXMuaA0KPiBAQCAtMTg5MSw2ICsxODkxLDE0IEBAIHN0cnVjdCBpbnRlbF9kcCB7
DQo+ICAJc3RydWN0IGRybV9kcF9kZXNjIGRlc2M7DQo+ICAJc3RydWN0IGRybV9kcF9hdXggYXV4
Ow0KPiAgCXUzMiBhdXhfYnVzeV9sYXN0X3N0YXR1czsNCj4gKw0KPiArCXN0cnVjdCB7DQo+ICsJ
CS8qIFRPRE86IG1vdmUgdGhlIHJlc3Qgb2YgdGhlIGF1eCBzcGVjaWZpYyBmaWVsZHMgaGVyZSAq
Lw0KPiArCQkvKiB3ZSBsZWZ0IHRoZSBBVVggZW5naW5lIGJ1c3kgYW5kIGFyZSB3YWl0aW5nIGZv
ciBpdCB0byByZWNvdmVyICovDQo+ICsJCWJvb2wgbGVmdF9idXN5Ow0KPiArCQl1NjQgbGVmdF9i
dXN5X3NpbmNlOw0KPiArCX0gZHBfYXV4Ow0KPiArDQo+ICAJdTggdHJhaW5fc2V0WzRdOw0KPiAN
Cj4gIAlzdHJ1Y3QgaW50ZWxfcHBzIHBwczsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RwX2F1eC5jDQo+IGluZGV4IGE2ODcxYTU0OTJkNy4uNjZkMmI5NTJkYTVjIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1eC5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4LmMNCj4g
QEAgLTM0OCwxOCArMzQ4LDM5IEBAIGludGVsX2RwX2F1eF94ZmVyKHN0cnVjdCBpbnRlbF9kcCAq
aW50ZWxfZHAsDQo+IA0KPiAgCWlmICh0cnkgPT0gMykgew0KPiAgCQljb25zdCB1MzIgc3RhdHVz
ID0gaW50ZWxfZGVfcmVhZChkaXNwbGF5LCBjaF9jdGwpOw0KPiAtDQo+IC0JCWlmIChzdGF0dXMg
IT0gaW50ZWxfZHAtPmF1eF9idXN5X2xhc3Rfc3RhdHVzKSB7DQo+IC0JCQlkcm1fZXJyKGRpc3Bs
YXktPmRybSwNCj4gLQkJCQkiJXM6IG5vdCBzdGFydGVkIChzdGF0dXMgMHglMDh4KVxuIiwNCj4g
LQkJCQlpbnRlbF9kcC0+YXV4Lm5hbWUsIHN0YXR1cyk7DQo+IC0JCQlpbnRlbF9kcC0+YXV4X2J1
c3lfbGFzdF9zdGF0dXMgPSBzdGF0dXM7DQo+ICsJCS8qDQo+ICsJCSAqIElmIHdlIHJlY2VudGx5
IGxlZnQgdGhlIGVuZ2luZSBidXN5IG91cnNlbHZlcywgdHJlYXQgaXQgYXMNCj4gKwkJICogc3Rp
bGwgcmVjb3ZlcmluZyBmb3IgdXAgdG8gYSBzZWNvbmQsIHRoZSBsb25nZXN0IExUVFBSDQo+ICsJ
CSAqIHN0YWxsIHdlJ3ZlIHNlZW4uICBPdGhlcndpc2Ugc29tZW9uZSBlbHNlIGlzIHVzaW5nIHRo
ZQ0KPiArCQkgKiBjaGFubmVsLCBvciBpdCdzIGh1bmcuDQo+ICsJCSAqLw0KPiArCQljb25zdCB1
bnNpZ25lZCBpbnQgbGVmdF9idXN5X3RpbWVvdXRfbXMgPSAxMDAwOw0KPiArDQo+ICsJCWlmIChp
bnRlbF9kcC0+ZHBfYXV4LmxlZnRfYnVzeSAmJg0KPiArCQkgICAgdGltZV9pc19hZnRlcl9qaWZm
aWVzNjQoaW50ZWxfZHAtPmRwX2F1eC5sZWZ0X2J1c3lfc2luY2UgKw0KPiArCQkJCQkgICAgbXNl
Y3NfdG9famlmZmllcyhsZWZ0X2J1c3lfdGltZW91dF9tcykpKSB7DQo+ICsJCQlkcm1fZGJnX2tt
cyhkaXNwbGF5LT5kcm0sDQo+ICsJCQkJICAgICIlczogbm90IHN0YXJ0ZWQsIHN0aWxsIHdhaXRp
bmcgZm9yIHRoZSBBVVggZW5naW5lIHRvIHJlY292ZXIgKHN0YXR1cyAweCUwOHgpXG4iLA0KPiAr
CQkJCSAgICBpbnRlbF9kcC0+YXV4Lm5hbWUsIHN0YXR1cyk7DQo+ICsJCX0gZWxzZSB7DQo+ICsJ
CQlpbnRlbF9kcC0+ZHBfYXV4LmxlZnRfYnVzeSA9IGZhbHNlOw0KPiArDQo+ICsJCQlpZiAoc3Rh
dHVzICE9IGludGVsX2RwLT5hdXhfYnVzeV9sYXN0X3N0YXR1cykgew0KPiArCQkJCWRybV9lcnIo
ZGlzcGxheS0+ZHJtLA0KPiArCQkJCQkiJXM6IG5vdCBzdGFydGVkIChzdGF0dXMgMHglMDh4KVxu
IiwNCj4gKwkJCQkJaW50ZWxfZHAtPmF1eC5uYW1lLCBzdGF0dXMpOw0KPiArCQkJCWludGVsX2Rw
LT5hdXhfYnVzeV9sYXN0X3N0YXR1cyA9IHN0YXR1czsNCj4gKwkJCX0NCj4gIAkJfQ0KPiANCj4g
IAkJcmV0ID0gLUVCVVNZOw0KPiAgCQlnb3RvIG91dDsNCj4gIAl9DQo+IA0KPiArCS8qIHRoZSBl
bmdpbmUgcmVjb3ZlcmVkLCByZXBvcnQgYSBuZXcgYnVzeSBwZXJpb2QgYWdhaW4gKi8NCj4gKwlp
bnRlbF9kcC0+ZHBfYXV4LmxlZnRfYnVzeSA9IGZhbHNlOw0KPiArCWludGVsX2RwLT5hdXhfYnVz
eV9sYXN0X3N0YXR1cyA9IDA7DQo+ICsNCj4gIAkvKiBPbmx5IDUgZGF0YSByZWdpc3RlcnMhICov
DQo+ICAJaWYgKGRybV9XQVJOX09OKGRpc3BsYXktPmRybSwgc2VuZF9ieXRlcyA+IDIwIHx8IHJl
Y3Zfc2l6ZSA+IDIwKSkgew0KPiAgCQlyZXQgPSAtRTJCSUc7DQo+IEBAIC0zOTIsNiArNDEzLDgg
QEAgaW50ZWxfZHBfYXV4X3hmZXIoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4gIAkJCSAq
IGFsb25lLCB0aGUgY2FsbGVyIHdpbGwgcmV0cnkgdGhlIHRyYW5zYWN0aW9uIGxhdGVyLg0KPiAg
CQkJICovDQo+ICAJCQlpZiAoc3RhdHVzICYgRFBfQVVYX0NIX0NUTF9TRU5EX0JVU1kpIHsNCj4g
KwkJCQlpbnRlbF9kcC0+ZHBfYXV4LmxlZnRfYnVzeSA9IHRydWU7DQo+ICsJCQkJaW50ZWxfZHAt
PmRwX2F1eC5sZWZ0X2J1c3lfc2luY2UgPSBnZXRfamlmZmllc182NCgpOw0KPiAgCQkJCXJldCA9
IC1FQlVTWTsNCj4gIAkJCQlnb3RvIG91dDsNCj4gIAkJCX0NCj4gLS0NCj4gMi41My4wDQoNCg==
