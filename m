Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335B1606A339
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nDeJ9RO2;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=mPlWZE6B
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D3C10ED91;
	Mon, 16 Nov 2026 09:34:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946F010E9DC;
 Mon, 16 Nov 2026 09:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794821653; x=1826357653;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=As4o+CIFalVBk/STo3zFza5p56CKXXd9khSWZzhHnf8=;
 b=nDeJ9RO2hzB0bm8nTsfsPxs408+n090avKmhSNAlmhRIwr9WfaMYV7nl
 RXiU7hKdhhEjTPmmPUf3ynq0RtycPD/MH76gYCjJGaR2+7HJIzaQJQDG0
 LUKkPHS6RERN4lS3SjvxYO1avbc+5WmLEY6YgN4X+PHcDm892B58zvYwr
 AqVHEqn4cAEO0+AR8lqyH9YN/9thyoN72KmPh0pB2qtcNfU/brwjI2CVl
 qjxljbDwrBxTszam+Mbx8IEPo1w2ZBUuJnPaiSAbMrLu0tSyLw2xUlgFh
 NFtAkNGZDifFTQgAx/mswRxDSqg6lK0d1KEKA5I4tLz1ooRucMP9Gu3eC A==;
X-CSE-ConnectionGUID: DJh9pcuNSu28oBD4wG9b1w==
X-CSE-MsgGUID: BEKwAHfOQqur8+W5KtEu6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3446027"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3446027"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:34:08 -0800
X-CSE-ConnectionGUID: 5XoW8Z41RwGTIj9t32JFtg==
X-CSE-MsgGUID: VmYm/wfnTu+QTUJPzJxnPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9519171"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:34:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:34:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:34:05 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:34:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7Rz3LDZMO0fd7CyZWZJdKhq4PJs+gKQnhdbMWJf7x9BkZ8pmuNeLwL6rK6q+S3P6FhFiGfi1Fl04DAftHZBJciBwDrNDvgy4IhaBpT0aINjOR1LtK5e4ud+NaWNYQ0qZ0JszJL6V2AatARqRae/wSHMfDZABjpIH4/MgC7e0hMgoXMerayw5QRcdWQtyagWuR9+WkGgXPllIA8TaJ6scQ/WUKtp/Sn0meNybGUGxr8Gfb2PLVm9O8xQdrdSp4gnXlFpGlMd5HjHjdTL3ui+zNF5lUZdczere36S4aLQq6b1zCPSI1o68gGTI6tT2IEvyV91c13y7yuRvHP5g4K4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=As4o+CIFalVBk/STo3zFza5p56CKXXd9khSWZzhHnf8=;
 b=id9keEBql1PNZuPTE9M/ydlIMK/re4HZGDHNdKGQZIztGKOokRy8PHWgqXinewDnAig84p/ayQwp2NY0EJ17Pd/S1mAuA4ZwlU45icHEPzemSeFQsLAr7YOqY07Nq+x30UM17dE9ivyOyO+FjHG7eXWha4EMGyPBg+X7/5/lqZ9SfD6w7NSNjzS+vO1bkMhGnbW0JYeT51E+Jj2TV6lD3KbepeGOnYnYlLwX0Xlg5OdMneOeWKKF+r3KTEQO/15yzUNDI+mL3Coq7BB9pX0QSEMSu3YIwqPA4Pxx7gt8RxYYCQVLtYO5HLcLrKB/v+l/NVnTb6Z0tdGgRQlQ9C6PCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=As4o+CIFalVBk/STo3zFza5p56CKXXd9khSWZzhHnf8=;
 b=mPlWZE6BPk+QX9PevewWDsx7K1PALM/jml42G5j+htRgVpqQMQUwNLh6fC+5NLJjutNvANSMo/qVScjonLovMp2Hj+zYE6WJOW5gOgfsm7pmVOM0Qj9qg7wdk7xescjA9WUqbe4Wsta7JFj2fKxGOTUSNVC0LUu9OUcWnKpSjpU=
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 by PH7PR11MB7500.namprd11.prod.outlook.com (2603:10b6:510:275::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 09:34:03 +0000
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e]) by SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:34:03 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH v4 6/7] drm/i915/display: Program and enable the DP symbol
 based timing generator
Thread-Topic: [PATCH v4 6/7] drm/i915/display: Program and enable the DP
 symbol based timing generator
Thread-Index: AQHda3qm8zC1PGsjrUyKwtl8p4kh+rcvHJKAgAFeSlA=
Date: Mon, 16 Nov 2026 09:34:03 +0000
Message-ID: <SJ0PR11MB50391C49FD969E214D8A575BBA7C2@SJ0PR11MB5039.namprd11.prod.outlook.com>
References: <20261103-vlk-64036-dp-symbol-tg-v4-0-6cf8a588b54c@intel.com>
 <20261103-vlk-64036-dp-symbol-tg-v4-6-6cf8a588b54c@intel.com>
 <c859200e-7972-4a7b-b8ab-fe135cd6428e@intel.com>
In-Reply-To: <c859200e-7972-4a7b-b8ab-fe135cd6428e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5039:EE_|PH7PR11MB7500:EE_
x-ms-office365-filtering-correlation-id: e1958708-11bb-4144-351a-08df43c4c079
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|261009223027099003|11063799006|4143699003|261102123227099003|261021123027099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261021121427099003|38070700021|56012099006|260925021311599003|260925022911599003|10067099003|260925021911599003;
x-microsoft-antispam-message-info: W2OV6Sa1qKCfIsupqmX2iuG+kZIEUgwh4Ug4b2o7Y5LStnkL2QCr/L8OIXnD1oo/D96G/l9HBlzlpMnyJIRcjSW5ChZZ+EzhXVNdFx+lkqHKZKdu85NRyAkig6UF9HZclhHFnsFvtO8WnEkxxxNCaBCTm3sbfjSnUNh69LFK0vprbSbtGBX3q4TiPfD55IYTW9petVr1DRHyIPOVmrdH8yNxsw5RPIjI0OaETuteBP4mareG26O75HN/LTP93lSMH7Upvbuwex7+VlBW+vfs7cHLqntyHY5ZhKmI9fJlCiTIc1LeIiAPHhEEvwBEPSGItWRN6jJFvqatdVLDDZf7pSdtHrDaUKSGkFGkqfv938aTl95NkM6b+zL6k8YdBA4a9Wj3qYUpYzqafmQ93IGb8N4K7JRwbJzdqmW0sbrn6slMLYzOBZXUM6u+13w+Yt3g8chV9KMiqb3PHxpmA1I9USeCLa7/Z3G/Gc40L+kpE0EaAJqhMNzZT1poTjunooET0PRVdvlpmaHMEV4Jy3EKxLHNpLnXe2eIk7RMX61XaV88seGIxFiaPi3tJunKc0vGIuScZnDnHUt7ySTyxjOsWk5K7HyrB2xvVG+FgDbnaz61CJm+sX8N512wubmCII+Jr7YwLV2qNuNdutk5lX4CPfno37K4OWQip9/X07c8P/2QopwiBgb5W/93wGAiK0c4QwuJb4mwwDxJ1/Zx50pfl90RVIjqdgtdSk2CYvNrJRQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(11063799006)(4143699003)(261102123227099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(38070700021)(56012099006)(260925021311599003)(260925022911599003)(10067099003)(260925021911599003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXBML2ZwZDJMaFJnajh5Z3NvOW42ZHJ4WS9NQzNqL3ROcGpqMkFlNU9aYy9V?=
 =?utf-8?B?cmFsOTJmRmpjNnpRYVFNbVBGeDdHQ2VGZnh2aHpRYjk3UHpsZEFaajI3QkJK?=
 =?utf-8?B?Q2tOUEZnaGZta0FXT1BMcXZkeGx4TjRGbWcybjhJOFVqZTBkY2dsdkFjY0ZN?=
 =?utf-8?B?K2src2w5TTE1d2dRWGt5WkFQSm1EVXF6aGlzdi9rRExyTmkwdG9CWU9qK0ZM?=
 =?utf-8?B?TlFnNWxBM2NtT3F2QjBHV2NWeGtLZUVWRHRFLzdZV0xwMDVaV3F0TUFjK1Nn?=
 =?utf-8?B?L3g2UlF4VnZxLzRHamJKMkZENHNTWVhSVUJQT2tPM1hVWGd2MGVQMDRyVkFw?=
 =?utf-8?B?cjhpckxzWkdrNFozV1RrRGxwU2pUVXhIcENManhSUlJwV0pzeW52UU9wNTk5?=
 =?utf-8?B?UFJsbXhSTFA4TExweFFLTkFJMi9zZ1Y1ZnVGczl5UGhFeTloNW1oOVU5MzQ5?=
 =?utf-8?B?cHMwR2JmZlErZWt1MkhzVUNnK3pPQ3Q0YWlKdE5acDNTbjg3RGw0UVpXb3Ba?=
 =?utf-8?B?R3lqSVBLNTNIYUZkUmFLS0E5QVpmeUswWjlMVlMvMEQ1dGJ1WndJTjJYeDd6?=
 =?utf-8?B?T1NHS3JsUlhrdGxrcFhkKzhiWjJWek0yMG9oRFA5M0tjY2R2NURCb2RJYkNh?=
 =?utf-8?B?NnhJdm9CV0VZcFBLMEVHemlJRFhqbGRJR0NUWWxDV0djelNYRlVIaVZKbEV1?=
 =?utf-8?B?ekdKUmJ1YkR4Rit6MVFBdENUa2k2NHpENUJScFBld2FHeGU3NVZpL2FPQ2hN?=
 =?utf-8?B?Tjhjb1RkTGQ0US9FZDZ5QWlQWHFPWWVrbldvQmZpMVBIYUtsZkFGL0tpdHFq?=
 =?utf-8?B?QW84K0tTbTV6K0l0Z1kvdDgzdnNpV0VVcmdTTU1zdHFuUExYUWtJMFdhMmJu?=
 =?utf-8?B?WHVFSEdkckhNZ3EvZjl3OVEvYTBFL2NHQ01GaWRKaHlLQy9qWmVpUHZxQWdl?=
 =?utf-8?B?TlBnME9qZDFObHQ5SVB3MFp1ZjJZbzUzNUpHVE5LREVpRk5vVVpoTDdnUFJP?=
 =?utf-8?B?RzRaTmp3SnBEU1BCdEd5MzNUOEh3VVRFTTRJdjdFcE5Na2xFZENZbjh6TUs5?=
 =?utf-8?B?K21uaXZPZDZOMGxjUmQ0d2FjNmZoajdheENZM2srNlBJL3NOUU9HMjlaeGRq?=
 =?utf-8?B?ZmtqK2o5OXNYUFZDejNSYnhTd041WDZSdDNkdFFERmJrTkplTHN4ZmVUVEdh?=
 =?utf-8?B?UGR3eGtuNktQblV2bWhKaXJmV01lNmlaMytzWmtlc1pzVnhKQjlNQUtxK2F4?=
 =?utf-8?B?bXFEenB5dHREYVp1cU9lMUtKU1dMcnZzaW16YlEzRUY1cFdaZlFSaWg2blRJ?=
 =?utf-8?B?OXRqMll1UlY2VS9GUVZMUDdTS0lkM1FjUUZGSW51NFNxR3J5a2RMZDJ5bmp1?=
 =?utf-8?B?c2w4ZUVQYTliRnN0ZGd0M3NSYWR6Zk05RWRHWEtwd1pLMlJ2YjBPekdpVnZ3?=
 =?utf-8?B?eHd0d3ZKbWdzTG8xOHUxQS9yNGhqU3JhQnJpcDNnYVAycmhrRE8yUGIzM2xG?=
 =?utf-8?B?ZEx2dkpWTlpLSTl1ZUxTOFFUVFFRdFBWZ1pvRW9RZkFNdXNpaTdod2E3RlBU?=
 =?utf-8?B?aHZnYXduU0tyK0V5cG50UTJGa2pDTEFVN25YbFN6emVqcEgzR2ZwK3RSWlh5?=
 =?utf-8?B?VElIbHR5MGxpRUVKdXlOUFhBcDg2NDhjbkZ1dk5SZU5YZ2JEZHlWdTZqbDV0?=
 =?utf-8?B?d3RORXpVSWQxRjFCUy8vaTJtcmNPK1V0RnB3cGpnTnNQV2VMeThWdVkwMTRh?=
 =?utf-8?B?MklGckhFdjQ4R0dQSTh2c3NOYlkrK3Yza1JReGtsNFVic3NJNW5LZytwcC8r?=
 =?utf-8?B?MUdlOGo0MVQxallOcnhIWDZRc05GdHB0eWVndGVsMEFjQzFKMkExVGV2Zk5V?=
 =?utf-8?B?M0QraGJVZG5aNjAwcjhrR2FUSlFBTGVZV0FkVDMyRzJuRlBmOUVjekoxK2J6?=
 =?utf-8?B?aHROQzZZUFM2SU10dy9mb1Fwc2RaQXRKOVRvN296amRuRjVHMnIzR0RIS2I2?=
 =?utf-8?B?SFlYVnB6YVVsR2ljUHdrV0RRcTlOb2FxYThmd2VUejkrdjhFUHNtSm1EVmlJ?=
 =?utf-8?B?M05Eb1dzV2FpNXFYMGlhQzc3c29aUjEvOTNkQ09FQ25zd1hDQUZ1anF1Qk0w?=
 =?utf-8?B?NDJOVGIzTU4yRTZsUGxxTVA2MVpXM1U2Qk1CTm5EekxGYTZsN242dHlyMkV6?=
 =?utf-8?B?VTlXRXRBZjZkR1dXUHJHUlM5U2RVcm55SWJHQnJGejVJWTUwVGQzeUZBdlFP?=
 =?utf-8?B?ek5QeDNwczNadFlPSXBYekZEQ0lvZ3JLS3Z3RElPNUxRT0ZTeUZOUW1aZXY2?=
 =?utf-8?B?MWJvcEpWcVprLy9kZ1J0NG1JaDN6ZXd1Qm1XR2lUN1Y5cjhuV2wzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JRE/3Tf3IuF9xsM1cNqL61elXUi78GrlsG3QVLZrmZr5MjYDMokHOavm/7looe2LXgTUWQmahFL0fPhC9lsOarpqOZlXj92oRGWRpWeSzzJJVYLOog73y54YHfZ5it8kTxMe6C8l3COcvV/QXXTjr6ePQ9chTbtJNFQ2ShJUAsj/jkAoKrQgRyqPo+KYr3uPxpTGsAIf28OSG2Oph+ekrEion9ExXvAfSA0krOovRatxT+8mxxjdDN5kfIxbAVm/HRW3jaoTwWDZW3yD45/wLnUMZUVlnfxvUXb4dlc3ODbQCLrf38XGzgvgzXU7ERbl4xT1n/RuFSCneJDuGFtmgg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1958708-11bb-4144-351a-08df43c4c079
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 09:34:03.1292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpX7OBb/xqGpZRP5ljit7ohF5O7o358deZ1bNMVXBoz/wPBYrotXTDk896VrcwJPzShD6XOId+Gftuk7RfQG6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7500
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3JhaCwgQ2hhaXRhbnlhIEt1
bWFyIDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPg0KPiBTZW50OiBTdW5kYXksIE5v
dmVtYmVyIDE1LCAyMDI2IDU6MzcgUE0NCj4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVy
dGh5QGludGVsLmNvbT47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGxpbnV4LmludGVsLmNvbT47IFNoYW5rYXIsIFVtYQ0KPiA8dW1hLnNoYW5rYXJAaW50ZWwuY29t
PjsgS2FuZHBhbCwgU3VyYWogPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY0IDYvN10gZHJtL2k5MTUvZGlzcGxheTogUHJvZ3JhbSBhbmQgZW5hYmxlIHRo
ZSBEUA0KPiBzeW1ib2wgYmFzZWQgdGltaW5nIGdlbmVyYXRvcg0KPiANCj4gDQo+IA0KPiBPbiAx
MS8zLzIwMjYgMzoyOCBQTSwgQXJ1biBSIE11cnRoeSB3cm90ZToNCj4gPiBQcm9ncmFtIHRoZSAx
MjggYml0IExMIHN5bWJvbCBEYXRhIE0vTiBiZWZvcmUgdGhlIExJTktfTiB3cml0ZSB3aGljaA0K
PiA+IGFybXMgdGhlIGRvdWJsZSBidWZmZXJlZCB1cGRhdGUsIHRoZSBMTCBzeW1ib2wgSEFDVC9I
VE9UQUwvQ0hVTktfU0laRQ0KPiA+IGFsb25nIHdpdGggdGhlIG90aGVyIHRyYW5zY29kZXIgdGlt
aW5ncywgYW5kIGVuYWJsZSB0aGUgdGltaW5nDQo+ID4gZ2VuZXJhdG9yIHZpYSBUUkFOU0NPTkYu
RFBfU3ltYm9sX1RHX0VuYWJsZSBiZWZvcmUgdGhlIHRyYW5zY29kZXIgaXMNCj4gPiBlbmFibGVk
Lg0KPiA+DQo+ID4gdjM6IFJlbW92ZSByZWR1bmRhbnQgSEFTX0RQX1NZTUJPTF9URyAoSmFuaSkN
Cj4gPiAgICAgIFVzZSBpbnRlbF9kZV9yZWFkNjRfMngzMigpDQo+ID4NCj4gPiBCc3BlYzogNjg4
NDksIDY4OTIyLCA2OTk2MQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4u
ci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kZGkuYyAgICAgfCAgIDIgKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCAxMDENCj4gKysrKysrKysrKysrKysrKysrKysr
KysrKystDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXku
aCB8ICAgMSArDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDEwMSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGRpLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGRpLmMNCj4gPiBpbmRleA0KPiA+DQo+IGE0NmFiNWQzZDcwZmM3NWM2OTc1ZjQ2ZTE0ZDFi
MGMyNGRjMWJhNWUuLmM4MTRlMDc0MGFhMDY0ZjU2ZDg0NGUzMA0KPiA0YzBhDQo+ID4gOTNkMTA0
NzQ3NWM2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGRpLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rk
aS5jDQo+ID4gQEAgLTQwODMsNiArNDA4Myw3IEBAIHN0YXRpYyB2b2lkIGludGVsX2RkaV9yZWFk
X2Z1bmNfY3RsX2RwX3NzdChzdHJ1Y3QNCj4gaW50ZWxfZW5jb2RlciAqZW5jb2RlciwNCj4gPg0K
PiAJUkVHX0ZJRUxEX0dFVChUUkFOU19ERElfTVNUX1RSQU5TUE9SVF9TRUxFQ1RfTUFTSywNCj4g
ZGRpX2Z1bmNfY3RsKTsNCj4gPg0KPiA+ICAgCWludGVsX2NwdV90cmFuc2NvZGVyX2dldF9tMV9u
MShjcnRjLCBjcHVfdHJhbnNjb2RlciwNCj4gPiAmY3J0Y19zdGF0ZS0+ZHBfbV9uKTsNCj4gPiAr
CWludGVsX2NwdV90cmFuc2NvZGVyX2dldF9sbHN5bV9tX24oY3J0Y19zdGF0ZSk7DQo+ID4gICAJ
aW50ZWxfY3B1X3RyYW5zY29kZXJfZ2V0X20yX24yKGNydGMsIGNwdV90cmFuc2NvZGVyLA0KPiA+
ICZjcnRjX3N0YXRlLT5kcF9tMl9uMik7DQo+ID4NCj4gPiAgIAljcnRjX3N0YXRlLT5lbmhhbmNl
ZF9mcmFtaW5nID0NCj4gPiBAQCAtNDExOSw2ICs0MTIwLDcgQEAgc3RhdGljIHZvaWQgaW50ZWxf
ZGRpX3JlYWRfZnVuY19jdGxfZHBfbXN0KHN0cnVjdA0KPiBpbnRlbF9lbmNvZGVyICplbmNvZGVy
LA0KPiA+DQo+IAlSRUdfRklFTERfR0VUKFRSQU5TX0RESV9NU1RfVFJBTlNQT1JUX1NFTEVDVF9N
QVNLLA0KPiBkZGlfZnVuY19jdGwpOw0KPiA+DQo+ID4gICAJaW50ZWxfY3B1X3RyYW5zY29kZXJf
Z2V0X20xX24xKGNydGMsIGNwdV90cmFuc2NvZGVyLA0KPiA+ICZjcnRjX3N0YXRlLT5kcF9tX24p
Ow0KPiA+ICsJaW50ZWxfY3B1X3RyYW5zY29kZXJfZ2V0X2xsc3ltX21fbihjcnRjX3N0YXRlKTsN
Cj4gPg0KPiA+ICAgCWlmIChESVNQTEFZX1ZFUihkaXNwbGF5KSA+PSAxMSkNCj4gPiAgIAkJY3J0
Y19zdGF0ZS0+ZmVjX2VuYWJsZSA9DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiA+IGluZGV4DQo+ID4NCj4gN2NhZjViZWU4NzE4NzI5
NjY3Mzc2YjQ4N2IwNTg0YjQ3ODkxZjA1YS4uNzFhMmY5NmI1ZThmODQ3NGZkOWVmMjRhYw0KPiAx
YzENCj4gPiBhYzg5YmNkZWZmMGEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiA+IEBAIC01MjEsOSArNTIxLDE0IEBAIHZvaWQg
aW50ZWxfZW5hYmxlX3RyYW5zY29kZXIoY29uc3Qgc3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUg
Km5ld19jcnRjX3N0YXRlKQ0KPiA+ICAgCQlyZXR1cm47DQo+ID4gICAJfQ0KPiA+DQo+ID4gLQkv
KiBXYV8xNDA5MDk4OTQyOmFkbHArICovDQo+ID4gLQlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkg
Pj0gMTMgJiYNCj4gPiAtCSAgICBuZXdfY3J0Y19zdGF0ZS0+ZHNjLmNvbXByZXNzaW9uX2VuYWJs
ZSkgew0KPiA+ICsJLyogVGhlIGVhcmx5IHBpeGVsIGNvdW50IGlzIGluIHN5bWJvbHMgd2l0aCB0
aGUgRFAgc3ltYm9sIFRHLCBubyBzY2FsaW5nDQo+ICovDQo+ID4gKwlpZiAobmV3X2NydGNfc3Rh
dGUtPmRwX3N5bWJvbF90Zy5lbmFibGUpIHsNCj4gPiArCQl2YWwgJj0gflRSQU5TQ09ORl9QSVhF
TF9DT1VOVF9TQ0FMSU5HX01BU0s7DQo+ID4gKwkJdmFsIHw9DQo+IFJFR19GSUVMRF9QUkVQKFRS
QU5TQ09ORl9QSVhFTF9DT1VOVF9TQ0FMSU5HX01BU0ssDQo+ID4gKwkJCQkgICAgICBUUkFOU0NP
TkZfUElYRUxfQ09VTlRfU0NBTElOR19YMSk7DQo+IA0KPiBCc3BlYyBzcGVjaWZpZXMgdGhlIFN5
bWJvbCBURyBIYmxhbmsgZWFybHkgc2V0dGluZyBhcyBhIHBhaXI6IEhibGFuayBFYXJseSBDb3Vu
dA0KPiA9IDk2IHN5bWJvbHMgdG9nZXRoZXIgd2l0aCBFYXJseSBDb3VudCBTY2FsaW5nID0geDEu
IElmIHdlIGFyZSBwcm9ncmFtbWluZw0KPiBvbmUgd2Ugc2hvdWxkIHByb2dyYW0gdGhlIG90aGVy
LiAgV2UgYXJlIGFscmVhZHkgZG9pbmcgaXQgZm9yIHRoZSBwaXhlbCBURyB3aXRoDQo+IERTQzog
V2FfMTQwOTA5ODk0MiBzZXRzIHRoZSB4NCBzY2FsaW5nIGFuZA0KPiBlbmFibGVfYXVkaW9fZHNj
X3dhKCkgcHJvZ3JhbXMgdGhlIG1hdGNoaW5nIGNvdW50Lg0KPiANCk9rLg0KDQpUaGFua3MgYW5k
IFJlZ2FyZHMsDQpBcnVuIFIgTXVydGh5DQotLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQo=
