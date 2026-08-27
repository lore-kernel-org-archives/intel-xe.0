Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97879C61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5851B10E3E7;
	Thu, 27 Aug 2026 10:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2lS1Jev";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B5010E3E6;
 Thu, 27 Aug 2026 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787827868; x=1819363868;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ds67DxdI47SK7VQbjEP7agDVdgcDx4+ojwkchmR/vpw=;
 b=H2lS1Jev1ym8V8ppas8XzCXKEuJwyJy2aAb44At7VjDjOAk0QUsAIQkN
 FzEqqpZ+UqdYWKRH/OvsBZuflH8dK4j3wCy/LMCx/8R3MUz7JK27RXsrd
 3TDJXD6BpwZ+n4Y4ut0XtzrNQ+EZYDVpCXmlnfSmvg2dLzOE00OBrmdTf
 41kb/UcJHdpoM6Em8xDDJzC4WjmKgrx76OyXqH3QJ8tkSDUDKUWj13fZ9
 /QvhPV5xCGSmF7W+SQDG5Gf/vSBylu+3u56eKgpnHrkfzpmIQKegINJcb
 yYZgNS8Ew3QAvxdTUeiUTE3LK3SVD5toGiP9k/Ook4fJfGVnEzwJVnblf Q==;
X-CSE-ConnectionGUID: PGHSHLVRSCWNZi8Xfl4eWA==
X-CSE-MsgGUID: YtaVBoODQpWZ7MTOQOkRHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88378233"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88378233"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:51:07 -0700
X-CSE-ConnectionGUID: pA1z17tCTBaazAENT4L01w==
X-CSE-MsgGUID: xJ1EbaBVS0KcnQn/K9xZ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="266536306"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:51:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:51:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 03:51:07 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.67)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 03:51:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CstKsJUP8o1lUMNx04lNm15+ND583b+NjSYj1CjUf1esFP8KphNAVf2ADdRPwbVHxZpsh0P9HJbNTHInpYJpv69w/hbEtRAAZs181fs8mPC/U6foPA1NuKlcHM5Zk8ia4OXJQIoEfAJNBmlkqORAy5sP1Ab3RVgmYaFzJm1axV/qmeCvVRynELiD1oATVYu3OMD+NnJWcVaw047NbgO6KQUUA++qK0f9QXWTVD1pgrMvMeDMyLXhm2MN0CENdwrfF2jIgMcdgC030q66Wen7fLaENIImoZEV9XfhEySZwwZIddq5ZN8SkvCaVxBTkSDKYJHYQjq9r9aVc/ZV+kxK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds67DxdI47SK7VQbjEP7agDVdgcDx4+ojwkchmR/vpw=;
 b=Zwr2QDWIQGIMKgoRGyi6vWuaFXqcnpZ9ZMC4hpr7z3GzDrmR8glrLUi5hAWG+tiU1upOkEMwc2SEa5xh5nB0HspAS3+4effiCbpzxnn8f5j+jQvPkHNc3rx0BmW32d49pvfbrtgOD8HVKJKF0ggPDSkWT/SnJ1GQ+vc3ysiCmTPVGk8pescwPMDNWfrcJ65FDyRmHBC4p1ziG3ZRvF5fQ5ouAzdv6j4tVFDwWRAodhjSAjzqSSx7sQIapwtNbpfw86Qwtv2lYe6k4OOu5G/bNWpL6Ovd36CB4oxQgwxttEEE9QioVnh0ne2rdIbvNApUsQtgQa+xJ+TRd7Q7dYZXQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 SN7PR11MB7590.namprd11.prod.outlook.com (2603:10b6:806:348::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 10:51:01 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb%6]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 10:51:01 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [PATCH v5 01/15] drm/i915/alpm: Add DPCD definition for DP2.1
 ALPM capability
Thread-Topic: [PATCH v5 01/15] drm/i915/alpm: Add DPCD definition for DP2.1
 ALPM capability
Thread-Index: AQHdNFmsFzo8phsIvUG5jwiu5xGbWLauZWQAgANVeOA=
Date: Thu, 27 Aug 2026 10:51:00 +0000
Message-ID: <DS0PR11MB80496AC44CB005AB1525AF2AF9AD2@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-2-animesh.manna@intel.com>
 <DS4PPFE901A304F3F70FB9295CD69B33A37E3AF2@DS4PPFE901A304F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPFE901A304F3F70FB9295CD69B33A37E3AF2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|SN7PR11MB7590:EE_
x-ms-office365-filtering-correlation-id: dbc9a068-0758-44f4-b69f-08df042915a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 5FtOsIzFvHe64fNwASnYXtxi2ElJMKVAh/w8/FWi7ZRj2Y3dLKrdFaOuzDu+OwEtBZxGZPSwvBJKbIkPmIBj8wstWMExr3PjuodmpmSefo/pmgE6rzP+tS6ZrcoNzc6ecYUAd8ZK7xG4xBtzSG/BDe2YzQlDU7wIvXC4r2MKfy3/QCgsfZvaIVNudX9bWbA0dZ3Vaae9xzwdYVPgd8eBpCcoxXC70g7Z6cliFJ/OlpOTNK7uzYSLHk+srH4jLjH5nyBkfGS7ZxDxG2dhR3AWc6rWr6ek436axiUaqIvbn+Fm6O9I+C3kXvC8D8gMtTF+UR0W1GjGdNplf2jJmx7F7j3AdvramqOJP7rq5oPCKD22Af5H0UnlprFJ5nnD33BwvszMBPv5s3kJ6mFOoFJkgRYG/66WYg1O5jeUhyYlW3KPjrPtfDj0/Waa61+akHIoD4vaeEkjXFNBY6BzcnRLo+ha4h6vHmsZBGT55j1jrkYbXZ+A0gANQUQmiwrwCUfdfVtl4DWC65k/zsLW/3Ry62P1oKlxD1ITsuDvTNgZlGfUvqiluTyGRcU20/WH/05Z8JBmUH5NiiV9gn5hDA2kKeXaBRIKLf7+AOqJA3zo6dXaoWze9gscZFtxg9oJDfMdiOtbNJhmg/YqPiunxfiL+K0ERzDHEA8TD5bQUPah6jDe70+Cbo+xbuR+DFYBqOkWFlVlI5ob1CYnSfpBIR1bP/bzOkMJ7ZEC/yRQwNyJrLY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm0vRGVWZzZFbzNHN056NmVpUDl0ZzlwVFNGbGFpOVQ1YUs5N0Jqam9WZVY2?=
 =?utf-8?B?VFI0WU1GVkFBM3RQdzNzQnBrK2JCUGJ2NkdhaVo5TUtHT3NZQWhMb0RJM1Vn?=
 =?utf-8?B?cHArZHllOGNvbUhTTDNGQmtSQythSVNvM1N2ZUlCTTJFRjRmdEU3VzNpazBo?=
 =?utf-8?B?Z0w1ai9TSFdBT3hEVGlEd3o5Y3JFdjJhU0Y1Q3BVVCtqTVRmS1R3MTUvbVFo?=
 =?utf-8?B?RTh6UE5GRDZKMjJ6M2kwYzA4Q0kzRjhvVFdHQzZSN04xMndOZzVWZ05xS1Ur?=
 =?utf-8?B?K0dTRHEzTGdzaEVJMmJIbGFLQkUvRmlnZXB3S3RKeXVtcmgvMFBYdTdqY3h6?=
 =?utf-8?B?SXZSVXI2Sm9WQnV4MDczWkMycTdUQ3ZKWEcvTW1rVlZwbnVscTJjWHN6NTUw?=
 =?utf-8?B?WWxiRkhpZmtTVjZVeTVFQjJYSDZFV1JHclpNdCtUSSs1NkxZZk4rQWhwSU4y?=
 =?utf-8?B?TSsxNGsyci9vdGhVLzFCblJ3c1FxMlNsTnpoNDJFY3JVREg1UmQzWGd1aEU2?=
 =?utf-8?B?SXFIc1k4SGRESzV1RFNPREdkMHRUZWs0WVNKV3J3aDNycWs1TnJua0hzdEVM?=
 =?utf-8?B?RjRHeFFEZDR6SktIMitJeWN2eDBQeDFzcmU0QmJEM2V6N3V3YUN3R3ZkODZZ?=
 =?utf-8?B?c0cxTk1NaUZaM2ZQV0N1cm9iMFdVbW5BV1lPbW1Tc1F6MEt0Uk05OGZHeVgv?=
 =?utf-8?B?b0tFVVYvUVJ6TlNocWphb0tNdHRiejNrSHRMRWdsam9jS1c3anB6WTJkaGhV?=
 =?utf-8?B?MEprS2RBWkVFdGhJa0ROQXVYdm9KQ1Z4OFlkV2RWZ245MG1VUkRFZGtnY0Ez?=
 =?utf-8?B?UGVPWkJhdWFRTSttdmVCdDJuclR3eFB1N3ArM2N6RFBLZXdVcGtIL0FNTVph?=
 =?utf-8?B?akxhNXFMNFZxZldPTUpWRUo0NkEwcDVxZFpnYTYxSll2UzVLbk4vRlgxbGpr?=
 =?utf-8?B?NWVZVXpUVUZTb09yRlBra25LaUhaN1R2bXpEcmc2L1psS0Vyd0ZmaVNURWwr?=
 =?utf-8?B?Q1pjMlhoVkN0OWRET3dGZDJsNU45NVVsUkx2RUQ0UWZ2QlFKaFMwaWQrd0xo?=
 =?utf-8?B?eXVXUUVEdjd2V0lEdHBISjZyazN6ZDBGVy85ZUg5dVJHZUxpN0czanVCa0sx?=
 =?utf-8?B?aGUzNXFsSUFUOUJYZ1d5N01iYVE3SU54MURRVmh1WUxJSmhVUDNLUUlyQmlI?=
 =?utf-8?B?Nm5xUDY3REZpcitPcXFSNW9pbDdTdUpCSWVRYTZXZ1pwSjcwejhkL0RQM3oy?=
 =?utf-8?B?cnB2UTlpbW5jdUk2Z3BrYjhpVGxtK21yaHZNejBPZENkZFR3WFB2cEJHWHlp?=
 =?utf-8?B?THhCc2gyVEF0YVlJR1FXMDRTRzg2dUQyWU43dmlOazVmNWxLRFpTREFpR3FV?=
 =?utf-8?B?R2lmV1EvNk9zMzk0QTBpL285bUJaalVhd3Jmb3lhUnZRcjVvVldWMmJDK2VB?=
 =?utf-8?B?RUpxQmpJOTJnUkVRT0szOHpGc0ZKWWpIekt2a2hFU0JYYkhBZWt3NG9YL3Y1?=
 =?utf-8?B?VGZrT09Ib2RPRDM2cHNzK2k3V01VRmVHcUUyYjVRRUlrS0RWdlZrQ29iaVUr?=
 =?utf-8?B?aHlGYlJvcWJHUlI4ZGRoSTNWNEIrMExKSjBDT3pGck1SdmRQekVhL1grSmRk?=
 =?utf-8?B?NS9zV1VLZ2pSaEhVSGlpQmNIbHJGUG5TdDg4Vm5mZWpwckhmcHpXakE0Ky8y?=
 =?utf-8?B?TUtHa1hMVGdKbFdxOHBCaW15QmRCSitFb3JLT29oN01Xc2tCbGE4V045YmY0?=
 =?utf-8?B?WlZNYWROMDlzT2d0TWx1SkRSNzRrTEFGeG5NR2I0VW1Bb0VUanZDWDFkaTB5?=
 =?utf-8?B?V3JydFpBQVZmeFRla25ONE9RMW5xZWhlMkRWMTUzRkFwS2owWXBHSEFKL3Vv?=
 =?utf-8?B?UTFoMlZDOEV4VVJYaFNSaTFpemtPankzNFZXZHJDRkJESTZjK1huZVdlUTlC?=
 =?utf-8?B?WVdveHVpUGpaNTdXMGpLRk1GcmR5RlVPR1VVK05BRkErOW9RVUllM2R5eGpU?=
 =?utf-8?B?VDNaZDlGaDBFM1dlQnlDWUZJdmxnZlVNbWpGVFhrOTJJczFGaHdjbWJQbGFr?=
 =?utf-8?B?bmFoZlg0K0NuWWJCZnYvS3lDd3BScG5LWkV6V256WHFZcFB1eStRRGpXSEhr?=
 =?utf-8?B?a2lGcHd5dDVjOWxlQmdhNWp5dG1meFA0ajdQWE9MT2svNXZvbHRkb2dWTFlo?=
 =?utf-8?B?a2FURE9nOWNJWjQwNGhab3VmMnpoazdWMkVFWlduVzVoTVB1TmlZazhsWURK?=
 =?utf-8?B?cEtWU0hHek0veFZHVTNUREdWRjNMR2lRbnRHU2lwZlpmWnBiVlVNbjhjczBO?=
 =?utf-8?B?OWVabFdXYVgyRFpRc3hMRDU4NDV0dmtIMnJTaG1TZ0d2T3U3Z3htQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Gazx5G8QOhQKrWiV8BuT9l8wTfSrWmXAEzYTxrStAye4Cq9wQ6OpRQOz80trEZ+bnSd9N8XJvL4uYZxzj4fX4Yf23qyHS6syLlSyA9J75/CYif57JGHXY3KMKXaaBfNXcTu/QB9PnTzR28YG3qR8GnedpHt1z9XXZzZRDetIdIu2oiuiazEjf2C1lw6QYQFMnTkvB8mV4A5xDNz/DZzemnYHsNQrsjgV1nhr3c/lvThsJaunHqP5R2BW9ImazC18Yk/bbOskjJCoF2roWjaaEjsRgRu33E0X0cvlnotJiz1dg7dS/4y6DCpryNeKB9+VgFKesCr6os2SVg9t3wGsTg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc9a068-0758-44f4-b69f-08df042915a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 10:51:01.2687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Us4MaTZqT6XK2GHdDMZzF17bA8R+iMdhX6cRvfLE7mRFQod6F3FJuRkgaJ150ec4KDYSi63FcjOl+bHA5eaT9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7590
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FuZHBhbCwgU3VyYWog
PHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMjUsIDIw
MjYgMToyNSBQTQ0KPiBUbzogTWFubmEsIEFuaW1lc2ggPGFuaW1lc2gubWFubmFAaW50ZWwuY29t
PjsgaW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBDYzogSG9nYW5kZXIsIEpvdW5pIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+OyBOaWt1bGEsIEphbmkNCj4gPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gU3ViamVj
dDogUkU6IFtQQVRDSCB2NSAwMS8xNV0gZHJtL2k5MTUvYWxwbTogQWRkIERQQ0QgZGVmaW5pdGlv
biBmb3IgRFAyLjENCj4gQUxQTSBjYXBhYmlsaXR5DQo+IA0KPiA+IFN1YmplY3Q6IFtQQVRDSCB2
NSAwMS8xNV0gZHJtL2k5MTUvYWxwbTogQWRkIERQQ0QgZGVmaW5pdGlvbiBmb3IgRFAyLjENCj4g
PiBBTFBNIGNhcGFiaWxpdHkNCj4gPg0KPiA+IEFkZCByZXF1aXJlZCBEUENEIGFkZHJlc3Mgd2hp
Y2ggd2lsbCBiZSBuZWVkZWQgdG8gZW5hYmxlIERQMi4xIEFMUE0uDQo+ID4NCj4gPiBDYzogSm91
bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6
IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiANCj4gRllJLA0K
PiBOZWVkcyB0byBiZSBzZW50IHRvIGRyaS1kZXZlbCB0b28NCg0KWWVzLCByaWdodC4gV2lsbCB0
YWtlIGNhcmUgaW4gbmV4dCB2ZXJzaW9uLg0KDQpSZWdhcmRzLA0KQW5pbWVzaA0KDQo+IA0KPiBS
ZWdhcmRzLA0KPiBTdXJhaiBLYW5kcGFsDQo+IA0KPiA+IC0tLQ0KPiA+ICBpbmNsdWRlL2RybS9k
aXNwbGF5L2RybV9kcC5oIHwgNCArKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
aXNwbGF5L2RybV9kcC5oDQo+ID4gYi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oIGluZGV4
IGU2M2M3ZjA3NWY1NC4uOWYxZTllZjVjZGI2DQo+IDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUv
ZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4gPiArKysgYi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9k
cC5oDQo+ID4gQEAgLTE1NDEsNiArMTU0MSw4IEBADQo+ID4gIC8qIFNlZSBEUF8xMjhCMTMyQl9T
VVBQT1JURURfTElOS19SQVRFUyBmb3IgdmFsdWVzICovDQo+ID4gICNkZWZpbmUgRFBfUEhZX1JF
UEVBVEVSXzEyOEIxMzJCX1JBVEVTDQo+IDB4ZjAwMDcgLyoNCj4gPiAyLjAgKi8NCj4gPiAgI2Rl
ZmluZSBEUF9QSFlfUkVQRUFURVJfRVFfRE9ORSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
MHhmMDAwOCAvKiAyLjAgRTExDQo+ICovDQo+ID4gKyNkZWZpbmUgRFBfTFRUUFJfQUxQTV9DQVBB
QklMSVRJRVMgICAgICAgICAgICAgICAgICAgICAgICAgIDB4ZjAwMDkgLyogMi4xICovDQo+ID4g
KyNkZWZpbmUgRFBfVE9UQUxfTFRUUFJfQ05UICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDB4ZjAwMGEgLyogMi4xICovDQo+ID4NCj4gPiAgZW51bSBkcm1fZHBfcGh5IHsNCj4gPiAg
CURQX1BIWV9EUFJYLA0KPiA+IEBAIC0xNzIwLDcgKzE3MjIsNyBAQCBlbnVtIGRybV9kcF9waHkg
ew0KPiA+ICAjZGVmaW5lIERQX0RTQ19CUkFOQ0hfQ0FQX1NJWkUJCTMNCj4gPiAgI2RlZmluZSBF
RFBfUFNSX1JFQ0VJVkVSX0NBUF9TSVpFCTINCj4gPiAgI2RlZmluZSBFRFBfRElTUExBWV9DVExf
Q0FQX1NJWkUJNQ0KPiA+IC0jZGVmaW5lIERQX0xUVFBSX0NPTU1PTl9DQVBfU0laRQk4DQo+ID4g
KyNkZWZpbmUgRFBfTFRUUFJfQ09NTU9OX0NBUF9TSVpFCTEwDQo+ID4gICNkZWZpbmUgRFBfTFRU
UFJfUEhZX0NBUF9TSVpFCQkzDQo+ID4NCj4gPiAgI2RlZmluZSBEUF9TRFBfQVVESU9fVElNRVNU
QU1QCQkweDAxDQo+ID4gLS0NCj4gPiAyLjI5LjANCg0K
