Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E066BCD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 14:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDDE10E399;
	Mon, 25 May 2026 14:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7+kx2Hw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB63010E399
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 14:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779718325; x=1811254325;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1UjWBxDOpsPbi+HcZgFXhA6EyDi8jmqwpzwAs8f4P50=;
 b=A7+kx2HwBJ7ItBFO2b8/ZeR6PtJ41dbhbEY1qqL4g6loofdGEx529fDV
 vStrHpgg1gMo6PZzY0hf/B8LlHytt7pRchMFPZATXY405zUR7TiI4lJ6z
 hwwwpeca4BvbVpW2IOukKGSpo8JZaeAaBxGFumKw3Rnm+N/r1gEkMtLRG
 dUtqtg6R02zEaesT9X9sonDKmlHz5obvMg6kpaPjuRXO8dybC4EGOw4Ik
 zxnJWxTUB3OsAMrAtTTyJP5itv/3TBdEHoTIhn00cfo+A0RuFxkpQ151C
 uj+0wbKfewID1GEKiDB5w+8IQZtmxzZZQQyRR1rOIlDVfQ/nF2HWFUUd2 w==;
X-CSE-ConnectionGUID: sC6wT3snTBaqC7micColLQ==
X-CSE-MsgGUID: JxffEgocR9CRqXNpQ4DEnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="79573687"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="79573687"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:12:05 -0700
X-CSE-ConnectionGUID: N5J1yGXFSvi1zQg4VzkzNg==
X-CSE-MsgGUID: JWqCdSN/TZatOpu+FCOVmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="246581233"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:12:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 07:12:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 07:12:03 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 07:12:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lT4CceLPT2VJdEkK2zHMd13u1VuuB1XnCg8DhROX202Bc7DkKBFdEQEqqj9JsHzPfKUanBEalOHZOdqkNKu3QutmKPS31cLFwgccbkQbaToIJ18fqlgQMJChHP9qHgZnp30xgU2gfeE0DJPvO2mDDVGlvDcO5DqjW7uNfUjJGR5vodIH3zyskybSsJ/QTVjFw9I1B9uet74LLVlLa6lXNctwscUJLXShrRU48Ncss9k0fKBhXqfGQ+2Bg9bEbjIkaFQc/kbNyQkDl1InrazfiefBH20Sp9T37rCyU3PlU9JbJ961XOEE2vh2uCOu6Z1Yi/xl4dpj6aUPaQdVBnOm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UjWBxDOpsPbi+HcZgFXhA6EyDi8jmqwpzwAs8f4P50=;
 b=ZrfzIH8XGssZVm7NEMoD+BTy6hpgsCoqcgDNY9DbVMCp1u4cPft/+PJkciiQ8om1NL2T+v2kT2SCeRx58BI6E7V3aUrT3LlowV5sLJYWhL93tR/x+3YfrhqwQvjH7E4HK7mtzwd1O4zrXqN6twdxX1B85GfnS7/wbqvNEHmBSTxuq5Vx6cxGW11+kbqvamOPEhsgw/w4mEby7lobVg3ZZOdryGkUuq+1IsF+MPDBhgIOg1B85D2KknN6zx+S1Pe88kUZQhbz9NPrIYr26jYHuS3LiPsy5v8JaIaulxyzM3GH79x7P2CHslwjtHyxeCMw58O57TM7W7cLS/br7SFz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 IA3PR11MB9301.namprd11.prod.outlook.com (2603:10b6:208:573::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 14:12:00 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%4]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 14:11:59 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Levi, 
 Ilia" <ilia.levi@intel.com>
CC: "Elbaz, Koby" <koby.elbaz@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 0/4] drm/xe/mmio_gem: fix fault handler and destroy path
Thread-Topic: [PATCH 0/4] drm/xe/mmio_gem: fix fault handler and destroy path
Thread-Index: AQHc7EYtxwQe3F59Q0edqwq3kjVPKLYeyFeA
Date: Mon, 25 May 2026 14:11:58 +0000
Message-ID: <77634462951f6f3a615a3032e0c69f83b5842f66.camel@intel.com>
References: <20260525125801.975038-6-ilia.levi@intel.com>
In-Reply-To: <20260525125801.975038-6-ilia.levi@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|IA3PR11MB9301:EE_
x-ms-office365-filtering-correlation-id: 6af87059-0a86-4f09-38c7-08deba6795c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700021|56012099003|22082099003|18002099003|11063799006;
x-microsoft-antispam-message-info: /62syKx/qGbfmrsUTrgvSYA5D2NXEhbL76flV+FQU0ZvcFe5nRl3GEjreHiM++kU7BfXM29fAB5pa3GFDthI0M2pL5VU57V7t5FEZ2PBPQi1Fbmkxca7eP3hQi9QV8WWYDs+p1s6KzqchXu1KDwb6+cZOJ27IwlSl/kV7NoUuOUy0HYZWgjSXuz4E8bxOXlgblptTEiSLV6lWpfH3d8PGqLzW3MpzGxEmAjqIs3sQc8H9zmvr6meKBDmp+JGy23MVh8l9YkpWnpSpk1w5IbHTM75m5paTnWodYnChkdkrIuqhQxmv3pGbiCBlQBgn0ibAxS+PjKUn1WjrE9dTHIAEfNi64bWWXfxigqRDD2mEogCCDFD2qzonJO4ijbIbBgC7+gWlgkyH/QyS0Hq6k5Ai26OY367gY71HmvBCOHDnzaMVuI7psLnaspRZ30857L41v0zkvOo2XJxC+99386nfZ6lxrehDPi7fW3WgPdgAadrpTvaM2kpsrOgUpB5QRZPv8opwoofEuhXX6QJf+qutgxj2v3njc0PtzmNzqfNVBfUvF5C887NB5OLwOBFvhORE7CzqCilxAMT9jtrYTrRzgzuVOu9p9TI1P/Y2yBmKvL5+FYQBfGVxed/sO2X5YH9AVQuTOQ/XadRknKAbmM2IJqlN4MqIM1fbS66659BtfXOZEzWcn4wX5AgVAnHOhM4IVmPJh8MtA+Q8+8E49VU3oRffjiKDxT5sPYDLERHZU8SDUq3l8AKkIBUkkLiG0BA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021)(56012099003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3NsMEtjRitMT1ZPYmZmWnZJcUR6YTRIS2syVy9XK3dxOVNkckRPMGZmUTBV?=
 =?utf-8?B?Y2FCNWc3SFViQkk4b21oWlB5M0JWT0FrOW9tSWcyaDQ1UTFZdFpQbWNndkpv?=
 =?utf-8?B?N256N0V4aURKd3FWSkpJZFZVbXVKeVBOZ0tsTEhXY1ZzWnJpNGVxMlpFano1?=
 =?utf-8?B?U0FHaERzcGx2bzlsVnBlTFJyeG1CR05TamtYTnZ2c1JCVXJYNmdwWVVNMGRj?=
 =?utf-8?B?aHl3bkxkOFJxVHhpUTN3bUdSdXcvM3dKNVVnbEFRTHV3SmhJeWtOS3JEcm50?=
 =?utf-8?B?OUl4ZFh0NkU2UmhhSkVBUXpZZFpScjNzSEFCQ1NVWkI1UFJHUURoRXQ0Z1VC?=
 =?utf-8?B?eEJzRDRZaWtYRWt6T08rYVh4Mi9uam1rNU8wbVZRSzI2S0FSa1RmL2Q2bUFJ?=
 =?utf-8?B?Z0ljYlBBWnQ2YjI5R1Zua3dSaDBDNDVkaXBPNVRZRlhEdWdLT2M2SDB3cXk2?=
 =?utf-8?B?dXNrNlFBdFNTQVo0L0JVeGUzZG94cXluZkpCbEQ2bk5Oc3dHeFhjNTdCbm55?=
 =?utf-8?B?SmRPcGJNMGtncG11RFpOVmMxN0g2cVBuSStlb0M3ODZwZFRPTkZhOUVTTjJ3?=
 =?utf-8?B?eE9CMnZ6cVR4djJETUFWajJ1SmlYUElsTWxzdmJuZ3E5Z1Zsd0tseG1RcHRo?=
 =?utf-8?B?b3ZiR3lGdXRPNktzTXZabllOenF3b3NjQXlsMzVwWE1tbFJCUXA4NDJvbmdD?=
 =?utf-8?B?dFZ4K0NTQ0lJSWlkR3dId2RwaXkvcEF1WHVDTVpRWG1RZFUrVnR4NmNLTjVp?=
 =?utf-8?B?Y1RiZ05veERkSjQzd3RpYVROQ095WDVQQVdJTm1hY1cxY2tuMnhVZGJ6aGZo?=
 =?utf-8?B?VEdQZ3JNL2Zvb3k3azBVYWtEbU0wNHlXMUxqYmxlbmxtWWwyUXlRTHNaZ2lo?=
 =?utf-8?B?TThrOXZIT2lxZnVxL1Nhc0Q5TkwxVnpPUDVDOTQxRloyWUwrTzJjZzBhaC9p?=
 =?utf-8?B?R2JTY0VreS9CcU1NTVlHWEFFVkZLQmdhdFFWdjVrd0dvL3V1UVVTNlN2MzJQ?=
 =?utf-8?B?VS9kWHhSWEZUTng5OGtUZzBObkhMSDdFMzhMcjNTU0ZESDgzUEFiOVRScFFx?=
 =?utf-8?B?UUlmYy9PL1cwZ3FQQjJadlhoWFpsem9PenN0a3ZYM2w0SDFoMmcvbE9wK3or?=
 =?utf-8?B?NktraThjMkM0UTJxWVV0azEwMXBva2pVci9Fai8yK3ZWcWl2UnE5dktwZVdq?=
 =?utf-8?B?WXE3cUFZODk3NmpaSVdxVjBqdTVVOW1YNUpuTk5SeEVLWExPRFFBYlFYYXI4?=
 =?utf-8?B?emUrRCtzSzZwR25IUTZmNFV5a2ZVdU1aZjhjTWYxZFJHeXNRSGs5U1AwQ3Ux?=
 =?utf-8?B?NUZFVEFKM3Nia2ExMk9RVmt0NmFOeVh0WE00YkJ0cHFMK0VwRmlsL3BVZGcx?=
 =?utf-8?B?WitkSzFkWit5bkc1dU9FeUh5VlRoSitGWmNXSFJxT3c0Q09IVFlsU1E0djJk?=
 =?utf-8?B?QTM3TGpGNUREeTFkbjhZY3lHamFaOC90ajB1ekYyTEVYaUlVbFg5aG5zVXpv?=
 =?utf-8?B?dnc3VkJKaGphRUhFU3h3aXpFT3NINWNtTFFpQjdNbVhkTjBRQ3pCbmgyV1gw?=
 =?utf-8?B?UlRzSHRNOTM5K0pwWElHbDdIRURrL01rTGNLUWRtTDFyc2xOYzNxaFdob3g5?=
 =?utf-8?B?bEpOZVJSSnVOeEFqelNndklNK0Rrc1VsbmZ1M3NHMU1XcnFwcUNhc2x2Nzdr?=
 =?utf-8?B?QnlZUXl4bllSSC94NEFSNnJKZTVWcE5DRkgyZHR3WUgzdjBwb0EvYS9FeUNM?=
 =?utf-8?B?NVczVTlqbXozU3QyaWFWNVJIYUFyY2FnaUVoYThxcVBjWTRkRUVLdU5Tc1hy?=
 =?utf-8?B?QzczMFB6a0F2N2tJamp5RTlSdmtKbkpUYjd0c2RvTkNkQzJmNjlrU2pya0di?=
 =?utf-8?B?aytVeHUvNzl1K0lYOXQxTk5Fb1djRzl3TGRKeWhFZVg2UklOYnJ6QUxmamda?=
 =?utf-8?B?MWtVTDEyaEtTZDdUZ1JOdlhOTmljbXFYOEM1dEZGOUQwUjd3RzBRVFZCdzNU?=
 =?utf-8?B?QWduKzJERGt0OElidHdJbnVlOGZTckM1WEpqNFBWTG9FcFBTVi9hT2FOaDdC?=
 =?utf-8?B?dFU0cXNjR0lIRldiQ05Fb0pMdWZZZitPN3FibUdrc0FOVU9Zd3BaRnRVVUtN?=
 =?utf-8?B?RTBWWmo5d1BiRGVsLzZ0SlZvQ0tFL0t3Um1kWXRVMVU4K2RKYjJlTWVIOEZU?=
 =?utf-8?B?aml6VjhoTEdISVFHMmhtWnVLTHYydllpY3hKOUl5ZFc2TWgrWk5nOU5rbFQr?=
 =?utf-8?B?OTJKOU0zWUdCVFR0TEsySE5INm9UQmhmWkhCc1NFaHZXYTNsNW9ENW9mSEpp?=
 =?utf-8?B?YnVFKy9lQUs3RUZ4ZGhvbVhCK3BKN0luc21WWUhiTlZNQ0VYeWdGZnpHNHV1?=
 =?utf-8?Q?k0rbbXYmOPhUoviEq7JVo9wWz2w1yR7Lo1aMn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA49661CB765A742A859456A7BECBAE7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NEi6UQz1CTfV7062SflWb6CQvlU5QZsIKBKChS8ly8C9tDTeF/fm0neV4idpp0G5NNIV3TuyT76mp/S7hQ5C7ruwPYl1CoiQ73Awo2LvZvI+weix4dtI4LDrzYk8gRBb85lXmXrnwSETP72rw77rO+6se+apZoVAmLBgfE1MOTzxNEZk0MaF7Z6g3mOwJfSPIQJUiUrSEF65/B8UgN/rxpFUcfyWxuqNRRBbHeVrNN1KVPMDFFm6ZvCbne0StApEmRgAm/p/l4WMYFxy+7tvfB3qqBeTshQnRv7bVwBu7FM8jOj+4KeZd2L+hofPsZX1mZbWR5st9idZD0JMLwG9tg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af87059-0a86-4f09-38c7-08deba6795c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 14:11:59.0320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F/308c9PMu0D/nkxchKIl8mwZhT9tF7gMyYCasOsVU9/AlgjxNfK8bdmnwU7PkCeWgbHTt/r5dkQ/5KbV9As2krPfqEdvECeIcEiuZQNyGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9301
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

SGksIElsaWENCg0KT24gTW9uLCAyMDI2LTA1LTI1IGF0IDE1OjU4ICswMzAwLCBJbGlhIExldmkg
d3JvdGU6DQo+IFRoaXMgc2VyaWVzIGZpeGVzIHNldmVyYWwgaXNzdWVzIGluIHhlX21taW9fZ2Vt
LCBpbnRyb2R1Y2VkIGJ5DQo+IDFmZmNmOGI4YWU4YSAoImRybS94ZTogU3VwcG9ydCBmb3IgbW1h
cC1pbmcgbW1pbyByZWdpb25zIik6DQo+IHNwbGl0IFZNQSBmYXVsdCBoYW5kbGluZywgYSByYi10
cmVlIGxlYWsgb24gZGVzdHJveSwgZHVtbXkgcGFnZQ0KPiBhY2N1bXVsYXRpb24sIGFuZCB1c2Ut
YWZ0ZXItZnJlZSAvIE1NSU8gYWNjZXNzIGFmdGVyIGRlc3Ryb3kuDQo+IA0KPiBJbGlhIExldmkg
KDMpOg0KPiDCoCBkcm0veGUvbW1pb19nZW06IGZpeCBmYXVsdCBoYW5kbGluZyBmb3Igc3BsaXQg
Vk1BDQo+IMKgIGRybS94ZS9tbWlvX2dlbTogY2FjaGUgdGhlIGR1bW15IHBhZ2UgcGVyIG9iamVj
dA0KPiDCoCBkcm0veGUvbW1pb19nZW06IGZpeCBkZXN0cm95IGZsb3cNCj4gDQo+IFNodWljaGVu
ZyBMaW4gKDEpOg0KPiDCoCBkcm0veGUvbW1pb19nZW06IFJldm9rZSBkcm1fdm1hX25vZGUgb24g
eGVfbW1pb19nZW0gZGVzdHJveQ0KPiANCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pb19n
ZW0uYyB8IDg1ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAtLQ0KPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9tbWlvX2dlbS5oIHzCoCAyICstDQo+IMKgMiBmaWxlcyBjaGFuZ2Vk
LCA1OCBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkNCg0KQ291bGQgaW9fcmVtYXBfcGZu
X3JhbmdlKCkgYmUgdXNlZCBoZXJlIGluc3RlYWQgb2YgYSBmYXVsdCBoYW5kbGVyPw0KDQpPdGhl
ciBkcml2ZXJzIHNvbWV0aW1lcyBleHBvcnQgbW1pbyByYW5nZXMgd2l0aCBkb29yYmVsbHMgd2l0
aCBkbWEtYnVmLg0KSXMgdGhhdCBhIGZ1dHVyZSBwb3RlbnRpYWwgYXBwbGljYXRpb24gaGVyZT8g
QW55IGltcGxpY2F0aW9ucyBmb3IgdGhlDQpkZXNpZ24/DQoNClRoYW5rcywNClRob21hcw0K
