Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C84C88E72
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 14:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945D910E1C6;
	Mon, 14 Sep 2026 14:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mgfNCBZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E746710EED3
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 14:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789395115; x=1820931115;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SXyKFlTCszfFrlznw4zJ2UgLxA22MhvHzjwqb7wCkzk=;
 b=mgfNCBZ/0OYYT/mfJkUnYQaeh9nSqQ/ilHjUu4EMSZCbXqpZdzauLMoJ
 6eMZvXA8GJpNBkZO9wO7en9F28ZPDvgqY3TOJ/s+Aez7Up0r0KtgMgU2/
 eU9AqLxi9UgJzpbPzdYbjD2WgaXa0gS7u/WKGaK9Xs229GRqiJvowL8SZ
 c9IYBI1qnmez8n5DRuNd+4MBklEY3goN75wsV9YByKco4eqDmtb4T+Xaj
 o0xwhB7kPOgNOq3GtxbJdVdGOKcg6HouR6yHkVNkq5Nuq/JnkCptLjtFb
 /KwL3kP1B9k8Ztl7pgoHwH9o6RfZZXyIk5zFjPAxhjZRZpviu2Bmcx0Ux w==;
X-CSE-ConnectionGUID: +5BvOIE0RIqiJRTzD2DmZA==
X-CSE-MsgGUID: NKIIGgFpRc+I14BfRfYmdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="88686910"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88686910"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 07:11:40 -0700
X-CSE-ConnectionGUID: bqrJNufGT2mh1UKqb2UtKA==
X-CSE-MsgGUID: gQEto7RvTP2SN2R7h4Lzfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="302543502"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 07:11:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 07:11:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 07:11:39 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 07:11:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZB3BiQg00JwoIayD5YlbzO45831435ttSYt3w4KOrTpV1BFD/yrSD9VC3shpgywc1WMoHCU6RMT8Vc/XI3+sr1XQ5cCUJSASaAZapRJxAskkI+fAvapSVJfpee7oLtVDXK4ChNJrxmMSTRCGEsh4lZJMcYLSzqCV6KZfJ9ZBZ++HEeDL9hB5V5PsuD5FSKM4dh6bosCJcIyRBcxQ7VsSHmnA1jsR9D7T4mxpLOqdv3jQarOgBJ0hqKyWgnLoMdks9GV11ClOB+ygJnn5ka0Eti6dyZ+RWqV7CTHqyiNzw6sEZoa8sn3SDKRlN0FeOshSsbqXWO1iPMcUnSzkm9ZEQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXyKFlTCszfFrlznw4zJ2UgLxA22MhvHzjwqb7wCkzk=;
 b=M1O2sieUbqDPRzrzWihU5JFV1K9zD+dEjlN29ZIYhH5XtRksOQcG3JAq59E34aWfABRPBIpV88VGfT1+W3fn7SSAmQOqDWERTksaOPeaw3czhtAd9L3nmIoFxnJ52Lrb7fOPKOEzCU9K2DUZVUtCbRpzkJjyfJjYM8c2xpgu1QaLA4DdW7FFcT91ZUYckpuSnldhOcjLCSkIAgA3Ik+vL/bAsBWjXzybNnPj1PPQjhEmrFXSi+b3It1JlplwcO5msMtxEXBoOdjsIa8z0nEacn4lACZ2qkICy5Z2JbuhhY8u5lad9ci+Pv3lzSBociaqogvVI2zIVtV/1Cej304YVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by DS7PR11MB7782.namprd11.prod.outlook.com
 (2603:10b6:8:e0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:11:28 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:11:27 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>
Subject: RE: [PATCH v2] drm/xe: Make p2pdma distance check verbose via dynamic
 debug
Thread-Topic: [PATCH v2] drm/xe: Make p2pdma distance check verbose via
 dynamic debug
Thread-Index: AQHdRD7Gv0hkdswm7E+cxaiW3n6E3rbOHMTQ
Date: Mon, 14 Sep 2026 14:11:27 +0000
Message-ID: <CH3PR11MB0461497CA1121C0B7A374831B0C1BB2@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260914114617.112012-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260914114617.112012-1-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|DS7PR11MB7782:EE_
x-ms-office365-filtering-correlation-id: a2e2fcf9-56f1-4dea-f3eb-08df126a1165
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|3023799007|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: b97RzIslK5ACyQ5s3tShz8kUSQAkBhe52QjUIwNPWWF2cXD1HQA7M6Ee45GiRgAzt3ybeaC+Jmg6yrBQWi/dasVyLeO6sKcGByzgDMw0zWXfIB5/sgkJbrv62VJqgxTa3DmchPVhQ5vdT4KxcmBLq9EQ31HgcA4muJetZm/sio+1kyHQhdebCrzPyuxXopGgpH0GADz0UTu9Zy5EQNORdmx+Wqj5DFukhVNEaMf8EHy0271FSlKqqiGyTUGG+UWBwcFs7E7IioSMsjp8IJlfBM6BnBTSOOPlK9VhNbQ9gMCy7foHqILYsq/zDnuPmSCCzq1/fa+U1vEbQSNryk4Mzrt+VWvpSkVckEwBuB2S/2yq7MasiZTWVWQmiIAtn2GzdcfaDmQ2dac/6DIAeUh8ye7KD8pJ2yTl/f5izY6mQwhInuPrrAryBAQOd7JJN8biOIuxoxg270sKDLRzoJZWYEVsXP3MKH6RaekXlZ4AZydfpCz5xmwBHb16RyVgimegQhC8LfFgaCXeXQsnev3/PjmUAIfV7Nm9G8EH/K5Y5Y9I7gzKAQaL3F15i7jvdqCsoV/faqg04ex01EF4u0MxJjbbsrN2/3KKVtAMvqBmgsYEaMgIpvcvxdzVtKX46zopH0MHas0MvOgXU4fw4RZbilEI+Po63En2yrzoEKxaK4G6Kp4lx/kfm+HAf8lrzIg587Yeg/Du4NGztGrqeAJAPBFs0DopAZQTfNDGT24fzE8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB046149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3lBeUY1SnpWMUVuWVVyVkhMWlg0NmVjQ2lqVU9LZmp6QWczeldGT3hFOVlL?=
 =?utf-8?B?RzA2azZjU1ZyUGpoc0twYVh0VnowT0ZiZTZFYWI4Z081Rm5Lajh0RnFPL0hG?=
 =?utf-8?B?VnRvR05VUk5HVHlMRkMvTFdsdmVoRm0wcHlpZ1lwVnRSTG15eDRFMHFkYVhl?=
 =?utf-8?B?M0VyeGFVSURsN0RoY0VPWS9GTWFIU3RQQWxwQytDUlR1ZjE0RERPblczdFYr?=
 =?utf-8?B?TGs3MGVBaDI3Q3lXQ2JoeDVUQlRkMWdZbnA2WllGNDZvNnZ1bkZBTTVzb3JE?=
 =?utf-8?B?MmZ2a3ZSVzQ5VDJsZ0hhbEh2OWVaN0JuUlFJMkp6YUg2WEpIM2I5c3pSYUJi?=
 =?utf-8?B?alArNGQ2N2RlWlJBakNTTk1IU05VeG5aWUV3MnB1WnRHOG00Wm4wU1dMMHh4?=
 =?utf-8?B?cy9qOVVYTHM3TEZsMDd3Z2UyVlVxcnJOL1lZMWYzTnRmbGFHWDlFOVdBeEhy?=
 =?utf-8?B?dktneWRKVzBYSm1pVWhuWlJRdVdJV2U0dHlGRFF4V21qNkd6czkvVnhFZTF0?=
 =?utf-8?B?UXlTT3pWelVqOTBVWTJWb2xDTTZQK1ZEOUUvQTRuT3VCYTlpeGxFa2RRaHJ5?=
 =?utf-8?B?L3NocU9lU1RFdmVqNERKd2FZV2pUZTdDUytKR2xoYmlNRjNBTHY1U0Nyanls?=
 =?utf-8?B?Sm9UalBLVThkcVk4WFJCN09SdFZ5c3FsWDdIWXpvbVRIL1ViUGxZRG8vREpE?=
 =?utf-8?B?TXFNMmNDdk1RUjFlaG1CWkNnTHM0T3h0dytMMHZVTHFpNkNnaVFSRys5SHoy?=
 =?utf-8?B?N2RmY1A1THRtVUdMQTluSGZmLzdvTWExNUZveXQvS1pKaDh2cUxhQW1aSEow?=
 =?utf-8?B?TDduVWswUFA4NEVYNEhlWDNhT2V0N21SRXEvZlpCREdNU0RRZERlcW9RS3Jv?=
 =?utf-8?B?bVI4SDk0UzNwUVFiWEFFRVlvN0tqRmlrODB0T0x6VWFqNmdQSnNCMDd4bGcz?=
 =?utf-8?B?d2U0NisvSHo5RmdXbmhxZXI0T0s1NFRyb01xS3cvbkJGK0w2QWlWTHQ5c3Fi?=
 =?utf-8?B?NEpFTDNDNHA1QWpnNzhZZ3liT1I3S1Nka2czanZOa092V1dPdWpaUTVrTVQ0?=
 =?utf-8?B?Zmo4dE5ZdUJnb0g4Zm1IQXN2dFdLZ0RhaHZKZ0tmMm50Wi9BNXRDdHI4OGMr?=
 =?utf-8?B?K0toMzlHL1ZBNXpaZmRMZ3hiaVh4QWVlV0FwUTJPblNFRDIzWkF1MG5aTksw?=
 =?utf-8?B?Z1VRYmk4S1dvdnNZOFE1b1FZVXN6b28yT2JCSFZsN1FZVG5lcXZZS2NkQkdi?=
 =?utf-8?B?cVVkRUI0YzhqRHVwU0tSVDNjZ0s2SWxaNXBvMTdjRmF1ZEhpTVNZWFlPcnc4?=
 =?utf-8?B?YVdPQzZYcmszQTRCUUhKOG01aHRQcXVlaS9yRHNWMmVSM2hLaW5JOGhjclIz?=
 =?utf-8?B?OUh0RmljV3QzUC9YMVVxOE5JRTVzOHpmb2VrTzQ2Y2NValJQTWNrelRzejZk?=
 =?utf-8?B?bDRUNnNvRVhMaVBrU2V6RUt6elZ1UmRQZ2NVQ21mZnNuVE1sZi9QN0ZqdHlm?=
 =?utf-8?B?S29vZUJTTnJCSkFnS3E4M2ZzcXo5eFFLbVJNY1RPVnhlb09ha3VFcjJwelhp?=
 =?utf-8?B?UVVSbWRVMVJVWlUvbEN6Y01uNWdNOTdhTng3Y2h3WTUwUEsyZkxRU2Jac0w3?=
 =?utf-8?B?UThhMzhDbGdXZk05c3g2MjZZbjZQOGtucmxCR1VGYThsdFFBa3hNUzhWMmUw?=
 =?utf-8?B?OXVMekVGbVZLOFBwN21qMGdMdjBMdTVkYXJ4dUR2eUx5VExINlM1L0FEdTRi?=
 =?utf-8?B?R3IxNWFFZTNnOFNQQWhDMktlUVNSZVJrS2tyQVdLQ09JQ3haTTk1K2lhTndN?=
 =?utf-8?B?T2h0K0VKUlBPRk5LZDhnaDY2MVdROWZqRktjNHY4eXVST3RweTBOeUpiSElm?=
 =?utf-8?B?U2JNbFI4VmMrSVAzRkovVXMzNjJXN1c0Qm5pc0l0MG84V3JOUzNuQzRDWFNG?=
 =?utf-8?B?TlpnSFJWZmxVM2l5aVRaQ3MyaEo2L01RVnA5QzA0YmlQajlPOGMyd0lnMHUr?=
 =?utf-8?B?YzVkaWtldXRQdGZXS2t1MjJ3bXZRT29xWkNua1ZaUnFzSWJEdDlrbzNIbHI1?=
 =?utf-8?B?aUdKaCtqTVRMTkladzdJSG9IYmVOUlRBRExxN05leS8wMlIycDZkekwveERu?=
 =?utf-8?B?aWN1WjIvWkRzT1FOMTRsZW8yeDZkekRmeW9OdEZhNjFYNzNZUTlGRmZBNHVx?=
 =?utf-8?B?MytITk1raVVhU2ExNDRMV0RaWGRVem1sNERlUFFLU2w3amlHLytCeGFKa1Ja?=
 =?utf-8?B?bDN6VGFMZy9sZ1I0bWR0RzMzU3lFelNrR0lramYyN09SdlNOQUMwZG5ZcS9H?=
 =?utf-8?B?K3ZkK1Jhd3VvVC82NW1tZUJVcUdHcWZSQlpNNU92RyttSnVpdG5FUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IgWViNhTvB/K6me+11gZ7YiHK314bhvrlD0UdPZU0aGxEggxoZYTA3N3Tg3k7jxwJcKKlUr1eR4VVsShI1aPs85GFPE4GouOnXf2lsCRdhzUJr+T1M7aPa6hFdVAjGKNEw3bSyiI4KecIzUQMTDhdA7SH483VmlL1/p9B0e94MtNWB7U5I04TMGFIok1C4eCcweZzvmei4S/kGy6/nN9N0l+lSgqZtsNdYY0eMKkoUISd8XmShw2xR4uqjyCeEZpAUfbagR+ISCz9w9aqHSqCSEXMRWeIpzW5QUoiT+P+OdYqeVWlv2gDicczaXquYa2FU56gRfBsu5vqrVbwkRwOA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e2fcf9-56f1-4dea-f3eb-08df126a1165
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 14:11:27.7000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wHA66MHlruW8MpC48I8DqIF99urEv1RvMCFDaLYge6k3M6pPPStVLlKJ3lPnHAw4K2xub65V0s6zHAeCUcjIr3egKGqNWzZ1qMb53SI32E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7782
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSW50ZWwteGUgPGludGVsLXhlLWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGhvbWFzDQo+SGVsbHN0
csO2bQ0KPlNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDE0LCAyMDI2IDc6NDYgQU0NCj5UbzogaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Q2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9t
YXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT47IEJyb3N0LCBNYXR0aGV3DQo+PG1hdHRoZXcu
YnJvc3RAaW50ZWwuY29tPjsgQXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4N
Cj5TdWJqZWN0OiBbUEFUQ0ggdjJdIGRybS94ZTogTWFrZSBwMnBkbWEgZGlzdGFuY2UgY2hlY2sg
dmVyYm9zZSB2aWEgZHluYW1pYw0KPmRlYnVnDQo+DQo+cGNpX3AycGRtYV9kaXN0YW5jZSgpIGNh
biBvcHRpb25hbGx5IHByaW50IGRldGFpbHMgYWJvdXQgaG93IGl0DQo+Y29tcHV0ZWQgdGhlIEFD
Uy9QQ0llIHRvcG9sb2d5IGRpc3RhbmNlIGJldHdlZW4gdGhlIHR3byBkZXZpY2VzLCBidXQNCj54
ZV9kbWFfYnVmX2F0dGFjaCgpIGFsd2F5cyBjYWxsZWQgaXQgd2l0aCB2ZXJib3NlIHNldCB0byBm
YWxzZSwNCj5zaWxlbnRseSBoaWRpbmcgdXNlZnVsIGRpYWdub3N0aWNzIHdoZW5ldmVyIGEgZG1h
LWJ1ZiBhdHRhY2ggdW5zZXQNCj5hdHRhY2gtPnBlZXIycGVlci4NCj4NCj5UaWUgdGhlIHZlcmJv
c2UgYXJndW1lbnQgdG8gYSBkZWRpY2F0ZWQgZHluYW1pYy1kZWJ1ZyBjYWxsc2l0ZSB0YWdnZWQN
Cj4ieGUgZG1hLWJ1ZiBwMnAgZGVidWciIChpbiBhZGRpdGlvbiB0byBrZWVwaW5nIHRoZSBleGlz
dGluZw0KPkRSTV9VVF9EUklWRVIgY2F0ZWdvcnkgYXMgYSBkZWZhdWx0KSwgc28gdGhlIGV4dHJh
IHAycGRtYSBkaXN0YW5jZQ0KPmxvZ2dpbmcgY2FuIGJlIHN3aXRjaGVkIG9uIHdpdGhvdXQgYSBy
ZWNvbXBpbGUgaW4gYW55IG9mIHRoZSBmb2xsb3dpbmcNCj53YXlzOg0KPg0KPiAtIEVuYWJsZSB0
aGUgd2hvbGUgRFJJVkVSIGNhdGVnb3J5IGZvciB4ZSB2aWEgZHJtLmRlYnVnLCB3aGljaCBpcw0K
PiAgIGFscmVhZHkgdXNlZCBlbHNld2hlcmUgaW4gdGhlIGRyaXZlcjoNCj4NCj4gICAgICMgZWNo
byAweDEwID4gL3N5cy9tb2R1bGUvZHJtL3BhcmFtZXRlcnMvZGVidWcNCj4NCj4gLSBFbmFibGUg
ZHluYW1pYyBkZWJ1ZyBmb3IgdGhlIHdob2xlIGZpbGU6DQo+DQo+ICAgICAjIGVjaG8gJ2ZpbGUg
eGVfZG1hX2J1Zi5jICtwJyA+IFwNCj4gICAgICAgICAgICAgL3N5cy9rZXJuZWwvZGVidWcvZHlu
YW1pY19kZWJ1Zy9jb250cm9sDQo+DQo+IC0gRW5hYmxlIGR5bmFtaWMgZGVidWcgZm9yIGp1c3Qg
dGhpcyBjYWxsc2l0ZSBieSBmdW5jdGlvbiBuYW1lOg0KPg0KPiAgICAgIyBlY2hvICdmdW5jIHhl
X2RtYV9idWZfYXR0YWNoICtwJyA+IFwNCj4gICAgICAgICAgICAgL3N5cy9rZXJuZWwvZGVidWcv
ZHluYW1pY19kZWJ1Zy9jb250cm9sDQo+DQo+IC0gRW5hYmxlIGR5bmFtaWMgZGVidWcgYnkgbWF0
Y2hpbmcgdGhlIGZvcm1hdCBzdHJpbmcgdXNlZCB0bw0KPiAgIHJlZ2lzdGVyIHRoZSBjYWxsc2l0
ZToNCj4NCj4gICAgICMgZWNobyAnZm9ybWF0ICJ4ZSBkbWEtYnVmIHAycCBkZWJ1ZyIgK3AnID4g
XA0KPiAgICAgICAgICAgICAvc3lzL2tlcm5lbC9kZWJ1Zy9keW5hbWljX2RlYnVnL2NvbnRyb2wN
Cj4NCj4gLSBFbmFibGUgaXQgYXQgYm9vdCB2aWEgdGhlIGR5bmRiZz0ga2VybmVsIGNvbW1hbmQg
bGluZSBwYXJhbWV0ZXI6DQo+DQo+ICAgICBkeW5kYmc9ImZ1bmMgeGVfZG1hX2J1Zl9hdHRhY2gg
K3AiDQo+DQo+QW55IG9mIHRoZSBhYm92ZSBmbGlwcyB2ZXJib3NlX3AycF9kaXN0IHRvIHRydWUg
Zm9yIHRoYXQgYXR0YWNoIGNhbGwsDQo+Y2F1c2luZyBwY2lfcDJwZG1hX2Rpc3RhbmNlKCkgdG8g
bG9nIGl0cyBkaXN0YW5jZSBjYWxjdWxhdGlvbiB3aXRob3V0DQo+cmVxdWlyaW5nIHRoZSB3aG9s
ZSBEUk1fVVRfRFJJVkVSIGNhdGVnb3J5IHRvIGJlIGVuYWJsZWQuDQo+DQo+djI6DQo+LSBHdWFy
ZCB0aGUgX2R5bmFtaWNfZnVuY19jYWxsKCkgaW52b2NhdGlvbiBhbmQNCj4gIHhlX2RkZWJ1Z19m
bGlwX2Jvb2woKSB3aXRoIGEgQ09ORklHX0RZTkFNSUNfREVCVUcgY2hlY2sgc28gdGhlDQo+ICBi
dWlsZCBkb2VzIG5vdCBicmVhayB3aGVuIGR5bmFtaWMgZGVidWcgaXMgZGlzYWJsZWQuIChTYXNo
aWtvLWJvdCkNCj4NCj5DYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+
DQo+Q2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj5Bc3Npc3RlZC1i
eTogTExNDQo+U2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ry
b21AbGludXguaW50ZWwuY29tPg0KPlJldmlld2VkLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcu
YXVsZEBpbnRlbC5jb20+DQo+LS0tDQo+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kbWFfYnVmLmMg
fCAxOSArKysrKysrKysrKysrKysrKystDQo+IDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kbWFfYnVmLmMNCj5iL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kbWFfYnVmLmMNCj5pbmRleCA1
ZDlmMWNkMjRiN2YuLjZhODViMjkyZGVlNyAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZG1hX2J1Zi5jDQo+KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RtYV9idWYuYw0K
PkBAIC03LDYgKzcsNyBAQA0KPg0KPiAjaW5jbHVkZSA8a3VuaXQvdGVzdC5oPg0KPiAjaW5jbHVk
ZSA8bGludXgvZG1hLWJ1Zi5oPg0KPisjaW5jbHVkZSA8bGludXgvZHluYW1pY19kZWJ1Zy5oPg0K
PiAjaW5jbHVkZSA8bGludXgvcGNpLXAycGRtYS5oPg0KPg0KPiAjaW5jbHVkZSA8ZHJtL2RybV9k
ZXZpY2UuaD4NCj5AQCAtMjIsMTMgKzIzLDI5IEBADQo+DQo+IE1PRFVMRV9JTVBPUlRfTlMoIkRN
QV9CVUYiKTsNCj4NCj4rI2lmIGRlZmluZWQoQ09ORklHX0RZTkFNSUNfREVCVUcpIHx8IFwNCj4r
CShkZWZpbmVkKENPTkZJR19EWU5BTUlDX0RFQlVHX0NPUkUpICYmDQo+ZGVmaW5lZChEWU5BTUlD
X0RFQlVHX01PRFVMRSkpDQo+K3N0YXRpYyB2b2lkIHhlX2RkZWJ1Z19mbGlwX2Jvb2woY29uc3Qg
c3RydWN0IF9kZGVidWcgKmRlc2MsIGJvb2wgKmZsYWcpDQo+K3sNCj4rCSpmbGFnID0gdHJ1ZTsN
Cg0KU2hvd2luZyBteSBpZ25vcmFuY2UgZm9yIHRoZSBkeW5hbWljIGRlYnVnLi4uDQoNClNvIHRo
aXMgY2FuIG9ubHkgYmUgZW5hYmxlZD8NCg0KUmVnYXJkbGVzcywgdGhpcyBpcyB3YXkgdG9vIHVz
ZWZ1bCwgYW5kIEkgd2lzaCBJIGhhZCB0aG91Z2h0IG9mIGl0Li4uDQoNClJldmlld2VkLWJ5OiBN
aWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCg0KTQ0KDQo+K30NCj4r
DQo+KyNkZWZpbmUgeGVfZG1hX2J1Zl9wMnBfZGVidWdfZmxpcChmbGFnKSBcDQo+KwlfZHluYW1p
Y19mdW5jX2NhbGwoInhlIGRtYS1idWYgcDJwIGRlYnVnIiwgeGVfZGRlYnVnX2ZsaXBfYm9vbCwN
Cj5mbGFnKQ0KPisjZWxzZQ0KPisjZGVmaW5lIHhlX2RtYV9idWZfcDJwX2RlYnVnX2ZsaXAoZmxh
ZykgZG8geyB9IHdoaWxlICgwKQ0KPisjZW5kaWYNCj4rDQo+IHN0YXRpYyBpbnQgeGVfZG1hX2J1
Zl9hdHRhY2goc3RydWN0IGRtYV9idWYgKmRtYWJ1ZiwNCj4gCQkJICAgICBzdHJ1Y3QgZG1hX2J1
Zl9hdHRhY2htZW50ICphdHRhY2gpDQo+IHsNCj4gCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
ID0gYXR0YWNoLT5kbWFidWYtPnByaXY7DQo+Kwlib29sIHZlcmJvc2VfcDJwX2Rpc3QgPSBkcm1f
ZGVidWdfZW5hYmxlZChEUk1fVVRfRFJJVkVSKTsNCj4rDQo+Kwl4ZV9kbWFfYnVmX3AycF9kZWJ1
Z19mbGlwKCZ2ZXJib3NlX3AycF9kaXN0KTsNCj4NCj4gCWlmIChhdHRhY2gtPnBlZXIycGVlciAm
Jg0KPi0JICAgIHBjaV9wMnBkbWFfZGlzdGFuY2UodG9fcGNpX2RldihvYmotPmRldi0+ZGV2KSwg
YXR0YWNoLT5kZXYsDQo+ZmFsc2UpIDwgMCkNCj4rCSAgICBwY2lfcDJwZG1hX2Rpc3RhbmNlKHRv
X3BjaV9kZXYob2JqLT5kZXYtPmRldiksIGF0dGFjaC0+ZGV2LA0KPnZlcmJvc2VfcDJwX2Rpc3Qp
IDwgMCkNCj4gCQlhdHRhY2gtPnBlZXIycGVlciA9IGZhbHNlOw0KPg0KPiAJaWYgKCFhdHRhY2gt
PnBlZXIycGVlciAmJiAheGVfYm9fY2FuX21pZ3JhdGUoZ2VtX3RvX3hlX2JvKG9iaiksDQo+WEVf
UExfVFQpKQ0KPi0tDQo+Mi41NS4wDQoNCg==
