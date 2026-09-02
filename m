Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBACC61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 07:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11FB10F03A;
	Wed,  2 Sep 2026 07:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsxzuJ/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A42410F02E;
 Wed,  2 Sep 2026 07:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788333897; x=1819869897;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1o2Gj7Xg/es6fxIWAztNQTxE1/gB3uO8Yn0sm+BfkZM=;
 b=jsxzuJ/NJ/l+GZMQRSd4ncgLF8SMj2kAi3D5ZMwkUVmWmaf7ngfD/DL7
 hWoGCPM+3Su5vLKQA3C7uPMj6/V+roEZpOouLHWFo+gqhT7j9xu+b4oBm
 jnYVA30vDJz4kD7Os1GFKJyvjyABcc58so3qw1eHOtSlCuMtmPdSM76j4
 NoB2KVyX1oypW5bKC6vYS/QXqK5A71X/AQeRPSZ51WL4h/ADGl3Zpcr7J
 vk7bv81QqBWs6XJzSMweVUH/tsaWQZRo4pMxnmvPcFIwgkhMR+BLWdYx0
 YOrkk0B5NkUWaDMZOtwi70Ypamj29arbGtPiTovlnevWc+Kkjr6MGnD5a w==;
X-CSE-ConnectionGUID: QfTJ+ctxSuS/lWW/R1P+lg==
X-CSE-MsgGUID: NEnxb8z0Rn68j2F9VqllFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99945400"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="99945400"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:24:57 -0700
X-CSE-ConnectionGUID: L9I3n1/CQkCvUz/tlx9Y7g==
X-CSE-MsgGUID: cu+QQH+HRF2LTMasB5e3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="267555168"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:24:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:24:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 00:24:56 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:24:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyXcUyFzlVooGykeTB8Kf9Pm/FXlbrSBKUQico7V8TA9zroiFGGbS/yLWnUbCDT+vub8HF/H50INC5pka9LvwLl7vF/4MMQP7EYVswIGE/aBd/pUtfnNyYzo5yG9s2vCAgunKMtqgZOE9ul/ejhw9ySpMtyc8jlRJ/pydFqmuLyZBfgTa9j4kc0yZrRmnsmceSkMr8iq7HY1MjKy/D+kDcq3wNEEXFTgN2tUAf6v6n65swfZWnBzqrtoY7hUGXJYh+cUqKxEVIaCo2ncZphOLg/rLIJ/0x/xINOZ8rPnP3XdY9GLka4C1RtfFfsKupIp6mCEUZO5O1sISLR1InTtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1o2Gj7Xg/es6fxIWAztNQTxE1/gB3uO8Yn0sm+BfkZM=;
 b=HnOZ2Y1EY9Jo3OW9aCyid9p0ebdobKIg5Dp1QvjBfMkqRaSersniViUhdjMIUwzZQ5gQsGGnI84beR+uZrVI35fxcxCBqtkmfhu+4bqQM4xW5rMpe5dtR/VkuwqfNt18BpAY1tze+ViH8r6ushtTMUoQS1iko8Dtknz+jyYX//lvJjnkdoiufqtuZoEsGX1U0HlaiFyc4bRZMOzwUdEapN8Pj2H/ihsa/HG8jbTkMZI04UlwpBT2/3YmMCCjVGFhfRbRpN6Jk4XiRyYV/BgxlwuBcMcqfklVOw+w/nJXUhMSCVkWa1T1XQXY/fMIUHrbHC4e/rsF3yrgJ6wGHLrqWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 07:24:53 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 07:24:53 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna, 
 Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v5 07/15] drm/i915/alpm: table based establishment period
Thread-Topic: [PATCH v5 07/15] drm/i915/alpm: table based establishment period
Thread-Index: AQHdNFmx99C5RY1hIU6Fsry3sPoIHba675YA
Date: Wed, 2 Sep 2026 07:24:53 +0000
Message-ID: <0be0b8124bdb82443def4ddb6c419a44714e7021.camel@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-8-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-8-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SN7PR11MB6774:EE_
x-ms-office365-filtering-correlation-id: e3d10757-a648-4811-7128-08df08c3483c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|3023799007|22082099003|18002099003|11063799006|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info: BcSVEucWQd53CCspBT5AOZlu+lv7zkAH/9xEM4tbpWhEkw3HCHwAa3sn61ET8ZFV5zxufpSmt1799cSF9tpSqKEqRMyu2GEVIA5GsIiFz2qWp/liBKpGMLrh5i1/5MRW0qD+ydNhOfZZXXJhZe66XVOIoeVYi0Qgf/U4AeckB8VABjEnkgL3d3jQIeuDsm7Ex9t05fzFpBqphZAZEuAtL1piA6q8pm5AIuLr/0RcX1I8lsLCyRfqcYECXqwYLv9oGQ/mLmELVqKPMKVb3H9Y0Bsef77DDpY2NbsL2k/N0hFFhX9prO0bXdhX44hPQjpjAFgaZMM7o0x/DoXQHEMu180vkIv5PZKuVXETztRrXH2t5/fN5Gxj0FH46K4AkfTBvIT/YNY0PCMvT6O2DYP7CktHExTwSJsY9uOOfSJOeR92Rur6uXA4XS+kSlB0MZ7C6Ne/YOiLXeiA9NW1tJPiNTWqdybpMUiEBL6F0qWIsAwcyMrw5hYw7GUbXN9F9oR9fzXZXpj3w+hCtN8kQ3FXijoN01trSVYffQvsBt8mmJN5242RYtmv4uEZhLjaWMRZGbN9Sk2s0HnhA1rx89mSXUFXu/MB7YFKymKpprGabER7Byz8r3lK7cunjxfdrJBF9zxvOxMYhae3mqMCWPor15sXCjJBjPP9gkX7wD99Qtb3/OkWeWQOAiEP3ukjdDKlru+E6TAOrBICSWABTcmfEQ/N+quoRPwxIxI5FDS6NRk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTBMcHl0WHhaeVhlUVNPOU1QelJxQ2EvblZLeWpwN2xrbW96dTNyVm1xdWsw?=
 =?utf-8?B?bjhMbFJjYjVpVVFQYi9xMTh2UXRTbldFVUY4UWpmY2dacFNjQm5uT0F3c0pK?=
 =?utf-8?B?TERod2pOWk81VXFGSjBIRUVrSzJyZysyRDY3UHZoZDZVNUs0UTFORXRDQ3Ew?=
 =?utf-8?B?bzVkaWpNakJWTG8xTHpCbFJyMW1pd2RYNUVLUlhJUUxtbkk3V0JtenJRSXdz?=
 =?utf-8?B?MUZZT0duajd2UTJKaTFsbEFTRGJMZ3ozTUJwSFU3aUdqZG1EemRFWVZpZHBp?=
 =?utf-8?B?WnFtbWxQUElrWTZHQ1RocWN0YWZocjF2UDVWQ2Z2dzVWM3FiVTczekFHQXoy?=
 =?utf-8?B?VUVXT1pWaXhNWHFIb3JKM3YvLzZYY2hTVjg3TVdhMHJ1M1dydVdlUC9icDhJ?=
 =?utf-8?B?dVAyeWdBaGJOcVJYemNUNlpvWFBaSmM0UThQTTJSVHh5OWx5NzBPWk9nc2Vj?=
 =?utf-8?B?SytwbkpSbGxKTndWK0NrZE9Hem0yeGkzMVp5dEJtdFJkVkx5ZENMTUhoRDI2?=
 =?utf-8?B?c2pjdHF6VzNwbFFOdDA1N1hUelh0cGYyQnQ2Yzhsc2FHSzBhbVFZTW95U3Nu?=
 =?utf-8?B?cWtjbDFKNHk3dzc1UHlwYlVHbEw4cFhFN0EvRVpHc1JiNlJzMG1IT1dWV1RW?=
 =?utf-8?B?SjJnRVdWQTFURFdIWGE3Ym85cXpZdG1JN0dnaUIvNDRRV0dmQ2tuTWZsMnJO?=
 =?utf-8?B?ZXlxbktlODU3MXJmWTg1UnhoUjR2eHJnKzBNcEhzMlV3UzFIdXJXdUFnV0lE?=
 =?utf-8?B?Sjl6eTZ3eDBrcW1RalFZQmdMUTdtcEdFMzdBeE9lRHRkMmJFQXYzcVkyTmdS?=
 =?utf-8?B?ai91djBSK3dHY00wS3pJc2U3dXd3YXZpemlOSTRoT0pneng1SEtaTzc1eVYr?=
 =?utf-8?B?dUR4aUE1RFZObXkxVVZXSERKekpFRjFTdTg0OGI2blkybXpXYkJTUlkxZm1r?=
 =?utf-8?B?Y0RiOWdwL1k3cW9CZjJtK1J6THlQdUcxNHd4OHRqeENZSUpQWEx1NFcyMU1F?=
 =?utf-8?B?dXM5TVBQNXJ5MU9mUDJWV3Q1eS9UYWZuSHlrRlFSK3RDRk5leFB2NlFkbHoz?=
 =?utf-8?B?MlJ6Nm1aZ3gvOGh0eCt4VnhkclVBYlc1Vmd6ZlVXUFR4TjZKbHJXTU5ENC9K?=
 =?utf-8?B?c2EvY00rNFhxQ1RudmRaZCtWYTREY2h1b0laU3QyY282WURXeEpDN2tsU3Ex?=
 =?utf-8?B?Nit0ckpYdERYWVdpNFlUaktTUmJmaGhUSTRLRVNveXV3YkpvdUdhUTNQckNk?=
 =?utf-8?B?elRUZG0xQ1lSdW9qeEw4RmpYQTA0ZlZ4dkoyZjA2bDNTNkRuNXRIa0wxVHE3?=
 =?utf-8?B?aDk0SlhvTG05ZkdMNXR1NlBUclBsNkVpTFpJVEpNeEdKTnJGWUdvYUpyQXl3?=
 =?utf-8?B?a2c2TWJ6OGpKZi9rV2RxYmJnVnVqVkxVRnlaLzFMWlJ0Y3didVBQeUhHVGdr?=
 =?utf-8?B?eW8zZjYzS3RKaUNwemtKWlBvMnQyc0NlUjdEYjJibFpTK0xTYmIzaWQ3b0Vk?=
 =?utf-8?B?ZzNuOHlTRUpoRlVtRExOenJxcEdIK3JibnFBMG4zUnFEbFpLc1BLakJhdVpF?=
 =?utf-8?B?M3VxRHUwMi96TkZSRkZhSjFrREdDRzlKdmlOTGhCREdsZ1VJdXY0UEVoZ2xW?=
 =?utf-8?B?a0V5WkRNS2s2MGRQMndKdSsvYVNKSGVkMnlGZ0p2anM5WnlyRzAvV3hIQWsz?=
 =?utf-8?B?dmFielRncjJReTUwQ20rVU9WejM0R2JDazlaeWhuS3lsdHIvSU9yRUJuL0tr?=
 =?utf-8?B?TUM5MzFsQmdneTE4ZHVPK1FrMmJrZ1hvVVdxL041aGZ0cm45MUo1S2RPcjYw?=
 =?utf-8?B?ZEFKWmY1dzdLR3k2NG9uWE5Na2d0RnhZVVJGYjE4eU1aUFNtVHpWY2xWNCtB?=
 =?utf-8?B?QWdiekhabDMvQ2JPdTZPRmY4dWxIaCtMenl1Z3pqbFpUSGxGUitSVGxGUnZm?=
 =?utf-8?B?UXRmaWRGTEExR2xIek93WCtTVXdlQlhBVzZjdkpkMUZPdWUvaVZrYlc5UEEw?=
 =?utf-8?B?ZGhhMDYreDJOQkFTelV1a0pMVEd1UTJkWW00akJldDYyZTFwcjJ1UTBsaFBs?=
 =?utf-8?B?dzRMRHIreFlEY2xnaHNzZFA1Q3hRVnptZkNleGg0TFFHdjhqMkh2SW5ud1pp?=
 =?utf-8?B?cmRTSE96RUh5Z2pSUm1DS2xVa0NnK0g5b041TTdnMkhNNER6bWVPUjN3MUUw?=
 =?utf-8?B?d05wOGVLNm5KRTF6M1VoYlVHWXBtb09YdjhxWFZzMHo1OFJhWkx0elZIc3U4?=
 =?utf-8?B?b1ErSU9TYmN2MnNNaVBSM2orTXlFT0VicG9zbm1oTDlkbksrT2UyQ2JzSFlk?=
 =?utf-8?B?MXkrd2Jia2hnTmdwWm5UbVRabFAwYkcycnZrRU9DWk05eVBkdTJ4SjFxWEdn?=
 =?utf-8?Q?vX55FZ1ffqt4wxxU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38B29D4120BD5A42913EAD8138497CAB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fUYDKfE9rHtPCj3nngyInx7T4SVoG/TpHXR923SdnsixMrkgn7ZHGdOLsPy1ypC810xM5CXsyw32OPUqFPxXl6Ry9ZA/Mo4t3nj9QbaIpYMwUtquvOdg0kxKrhj+3868D1OUVzhuGBbl3JQjJW80ClKgLIsZTql151ePaoPOgKODTKl2vFEwRneO792EwrqzkoCwajeQ+qICi+3A9YdKzIRlLSIFANJm7aNutB38LBg+37HReYJDlMoEo4HFSYBor/NBAhL/dGWHtAC06/NAiY1AXAcXBBAX2doJF8TPrHs/MwKjkscRAzeNbEQPTI9yk9g9IR3LvWq9+CldsCo6TA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d10757-a648-4811-7128-08df08c3483c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 07:24:53.3076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQu80qVTqenXmzv5qbSL0lIfuc8PM7K4QEicaVvxN72AGtEHhvdTy74jqTscl+cUJk9ljmce5xRmfTXzWpXcn6REr6HsE0sEjgUFrrEFvDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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

T24gVHVlLCAyMDI2LTA4LTI1IGF0IDExOjE1ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBPbmx5IHVzZSB0aGUgdGFibGUgd2hlbiB0aGUgbGluayByYXRlIGlzIGxpc3RlZCAoaWR4IHZh
bGlkKQ0KPiBhbmQgdGhlIExUVFBSIGNvdW50IGlzIHdpdGhpbiB0aGUgdGFibGUgYm91bmRzLiBB
IHplcm8gZW50cnkNCj4gbWVhbnMgdGhlIHJhdGUgaGFzIG5vIHRhYnVsYXRlZCB2YWx1ZSwgc28g
ZmFsbCBiYWNrIHRvIHRoZQ0KPiBjb21wdXRlZCBlc3RhYmxpc2htZW50IHBlcmlvZCBiZWxvdy4N
Cg0KV2hlcmUgdGhlc2UgbnVtYmVycyBhcmUgY29taW5nIGZyb20/DQoNCkJSLA0KSm91bmkgSMO2
Z2FuZGVyDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFu
bmFAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2FscG0uYyB8IDk1DQo+ICsrKysrKysrKysrKysrKysrKysrKysrDQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDk1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfYWxwbS5jDQo+IGluZGV4IGFmMjczMzgwNTUwNS4uMDc4ZTA0YmI2OWQyIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiBAQCAt
MTE1LDYgKzExNSw5MiBAQCBzdGF0aWMgaW50IGdldF90cGh5Ml9wMl90b19wMChjb25zdCBzdHJ1
Y3QNCj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkNCj4gwqAJcmV0dXJuIERJU1BMQVlf
VkVSKGRpc3BsYXkpID49IDM1ID8gKDIwICogMTAwMCkgOiAoMTIgKg0KPiAxMDAwKTsNCj4gwqB9
DQo+IMKgDQo+ICsjZGVmaW5lIERFRkFVTFRfTUFYX0xUVFBSX0NPVU5UIDcNCj4gKyNkZWZpbmUg
TUFYX1NVUFBPUlRFRF9EUF9MSU5LX1JBVEVTIDEyDQo+ICsNCj4gK3N0YXRpYyBjb25zdCB1MzIN
Cj4gZXN0YWJsaXNobWVudF9wZXJpb2RzW0RFRkFVTFRfTUFYX0xUVFBSX0NPVU5UXVtNQVhfU1VQ
UE9SVEVEX0RQX0xJTktfDQo+IFJBVEVTXSA9IHsNCj4gKwkvKiAxNjIwLCAyMTYwLCAyNDMwLCAy
NzAwLCAzMjQwLCA0MzIwLCA1NDAwLCA2NzUwLCA4MTAwLA0KPiAxMDAwMCwgMTM1MDAsIDIwMDAw
ICovDQo+ICsJLyogTm8gUmV0aW1lcnMgKi8NCj4gKwl7IDYxMDcwLCAwLCAwLCA1NjcxMCwgMCwg
MCwgNTM0NTAsIDAsIDUyMzYwLCA1OTA1MCwgNTY3NTAsDQo+IDU0NjIwIH0sDQo+ICsJLyrCoCAx
IFJldGltZXLCoCAqLw0KPiArCXsgMTU1NjcwLCAwLCAwLCAxNTEzMTAsIDAsIDAsIDE0ODA1MCwg
MCwgMTQ2OTYwLCAxNTM2NTAsDQo+IDE1MTM1MCwgMTQ5MjIwIH0sDQo+ICsJLyrCoCAyIFJldGlt
ZXJzICovDQo+ICsJeyAxODExNjAsIDAsIDAsIDE3MjQ1MCwgMCwgMCwgMTY1OTEwLCAwLCAxNjM3
NDAsIDE3NzEyMCwNCj4gMTcyNTIwLCAxNjgyMjAgfSwNCj4gKwkvKsKgIDMgUmV0aW1lcnMgKi8N
Cj4gKwl7IDIwNjY1MCwgMCwgMCwgMTkzNTgwLCAwLCAwLCAxODM3ODAsIDAsIDE4MDUxMCwgMjAw
NTkwLA0KPiAxOTM2OTAsIDE4NzI5MCB9LA0KPiArCS8qwqAgNCBSZXRpbWVycyAqLw0KPiArCXsg
MjMyMTQwLCAwLCAwLCAyMTQ3MTAsIDAsIDAsIDIwMTY1MCwgMCwgMTk3MjkwLCAyMjQwNjAsDQo+
IDIxNDg2MCwgMjA2MzIwIH0sDQo+ICsJLyrCoCA1IFJldGltZXJzICovDQo+ICsJeyAyNTc2MjAs
IDAsIDAsIDIzNTg1MCwgMCwgMCwgMjE5NTEwLCAwLCAyMTQwNzAsIDI0NzUzMCwNCj4gMjM2MDMw
LCAyMjUzNjAgfSwNCj4gKwkvKsKgIDYgUmV0aW1lcnMgKi8NCj4gKwl7IDI4MzExMCwgMCwgMCwg
MjU2OTgwLCAwLCAwLCAyMzczODAsIDAsIDIzMDg1MCwgMjcxMDAwLA0KPiAyNTcyMDAsIDI0NDM5
MCB9LA0KPiArfTsNCj4gKw0KPiArZW51bSBsaW5rX3JhdGVfaWR4IHsNCj4gKwlMSU5LX1JBVEVf
SU5WQUxJRCA9IC0xLA0KPiArCUxJTktfUkFURV8xLA0KPiArCUxJTktfUkFURV8yLA0KPiArCUxJ
TktfUkFURV8zLA0KPiArCUxJTktfUkFURV80LA0KPiArCUxJTktfUkFURV81LA0KPiArCUxJTktf
UkFURV82LA0KPiArCUxJTktfUkFURV83LA0KPiArCUxJTktfUkFURV84LA0KPiArCUxJTktfUkFU
RV85LA0KPiArCUxJTktfUkFURV8xMCwNCj4gKwlMSU5LX1JBVEVfMTEsDQo+ICsJTElOS19SQVRF
XzEyDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgaW50IGdldF9saW5rX3JhdGVfaW5kZXgoaW50IHBv
cnRfY2xvY2spDQo+ICt7DQo+ICsJaW50IGxpbmtfcmF0ZV9pbmRleDsNCj4gKw0KPiArCXN3aXRj
aCAocG9ydF9jbG9jaykgew0KPiArCWNhc2UgMTYyMDAwOg0KPiArCQlsaW5rX3JhdGVfaW5kZXgg
PSBMSU5LX1JBVEVfMTsJLy8gUmF0ZV8xIChSQlIpIC0NCj4gMS42MiBHYnBzL0xhbmUNCj4gKwkJ
YnJlYWs7DQo+ICsJY2FzZSAyMTYwMDA6DQo+ICsJCWxpbmtfcmF0ZV9pbmRleCA9IExJTktfUkFU
RV8yOwkvLyBSYXRlXzLCoMKgwqDCoMKgwqAgLQ0KPiAyLjE2IEdicHMvTGFuZQ0KPiArCQlicmVh
azsNCj4gKwljYXNlIDI0MzAwMDoNCj4gKwkJbGlua19yYXRlX2luZGV4ID0gTElOS19SQVRFXzM7
CS8vIFJhdGVfM8KgwqDCoMKgwqDCoCAtDQo+IDIuNDMgR2Jwcy9MYW5lDQo+ICsJCWJyZWFrOw0K
PiArCWNhc2UgMjcwMDAwOg0KPiArCQlsaW5rX3JhdGVfaW5kZXggPSBMSU5LX1JBVEVfNDsJLy8g
UmF0ZV80IChIQlIpIC0NCj4gMi43MCBHYnBzL0xhbmUNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSAz
MjQwMDA6DQo+ICsJCWxpbmtfcmF0ZV9pbmRleCA9IExJTktfUkFURV81OwkvLyBSYXRlXzUgKFJC
UjIpLQ0KPiAzLjI0IEdicHMvTGFuZQ0KPiArCQlicmVhazsNCj4gKwljYXNlIDQzMjAwMDoNCj4g
KwkJbGlua19yYXRlX2luZGV4ID0gTElOS19SQVRFXzY7CS8vIFJhdGVfNsKgwqDCoMKgwqDCoCAt
DQo+IDQuMzIgR2Jwcy9MYW5lDQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgNTQwMDAwOg0KPiArCQls
aW5rX3JhdGVfaW5kZXggPSBMSU5LX1JBVEVfNzsJLy8gUmF0ZV83IChIQlIyKS0NCj4gNS40MCBH
YnBzL0xhbmUNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSA2NzUwMDA6DQo+ICsJCWxpbmtfcmF0ZV9p
bmRleCA9IExJTktfUkFURV84OwkvLyBSYXRlXzjCoMKgwqDCoMKgwqAgLQ0KPiA2Ljc1IEdicHMv
TGFuZQ0KPiArCQlicmVhazsNCj4gKwljYXNlIDgxMDAwMDoNCj4gKwkJbGlua19yYXRlX2luZGV4
ID0gTElOS19SQVRFXzk7CS8vIFJhdGVfOSAoSEJSMyktDQo+IDguMTAgR2Jwcy9MYW5lDQo+ICsJ
CWJyZWFrOw0KPiArCWNhc2UgMTAwMDAwMDoNCj4gKwkJbGlua19yYXRlX2luZGV4ID0gTElOS19S
QVRFXzEwOwkvLyBSYXRlXzEwDQo+IChVSEJSMTApIC0gMTAuMCBHYnBzL0xhbmUNCj4gKwkJYnJl
YWs7DQo+ICsJY2FzZSAxMzUwMDAwOg0KPiArCQlsaW5rX3JhdGVfaW5kZXggPSBMSU5LX1JBVEVf
MTE7CS8vIFJhdGVfMTENCj4gKFVIQlIxMy41KSAtIDEzLjUgR2Jwcy9MYW5lDQo+ICsJCWJyZWFr
Ow0KPiArCWNhc2UgMjAwMDAwMDoNCj4gKwkJbGlua19yYXRlX2luZGV4ID0gTElOS19SQVRFXzEy
OwkvLyBSYXRlXzEyDQo+IChVSEJSMjApIC0gMjAuMCBHYnBzL0xhbmUNCj4gKwkJYnJlYWs7DQo+
ICsJZGVmYXVsdDoNCj4gKwkJbGlua19yYXRlX2luZGV4ID0gLTE7DQo+ICsJCWJyZWFrOw0KPiAr
CX0NCj4gKw0KPiArCXJldHVybiBsaW5rX3JhdGVfaW5kZXg7DQo+ICt9DQo+ICsNCj4gwqBzdGF0
aWMgaW50IGdldF9lc3RhYmxpc2htZW50X3BlcmlvZChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2Rw
LA0KPiDCoAkJCQnCoMKgwqAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNf
c3RhdGUpDQo+IMKgew0KPiBAQCAtMTI5LDggKzIxNSwxNyBAQCBzdGF0aWMgaW50IGdldF9lc3Rh
Ymxpc2htZW50X3BlcmlvZChzdHJ1Y3QNCj4gaW50ZWxfZHAgKmludGVsX2RwLA0KPiDCoAlpZiAo
aW50ZWxfY3J0Y19oYXNfdHlwZShjcnRjX3N0YXRlLCBJTlRFTF9PVVRQVVRfRURQKSkgew0KPiDC
oAkJdGNkcyA9ICg3ICsgRElWX1JPVU5EX1VQKDY1MDAsIHRtbF9waHlfbG9jaykgKyAxKSAqDQo+
IHRtbF9waHlfbG9jazsNCj4gwqAJfSBlbHNlIHsNCj4gKwkJaW50IGlkeCA9IGdldF9saW5rX3Jh
dGVfaW5kZXgoY3J0Y19zdGF0ZS0NCj4gPnBvcnRfY2xvY2spOw0KPiArDQo+IMKgCQl0Y2RzID0g
NyAqIHRtbF9waHlfbG9jazsNCj4gwqAJCWx0dHByX2NvdW50ID0gZHJtX2RwX2x0dHByX2NvdW50
KGludGVsX2RwLQ0KPiA+bHR0cHJfY29tbW9uX2NhcHMpOw0KPiArDQo+ICsJCWlmIChpZHggIT0g
TElOS19SQVRFX0lOVkFMSUQgJiYNCj4gKwkJwqDCoMKgIGx0dHByX2NvdW50IDwgREVGQVVMVF9N
QVhfTFRUUFJfQ09VTlQgJiYNCj4gKwkJwqDCoMKgIGVzdGFibGlzaG1lbnRfcGVyaW9kc1tsdHRw
cl9jb3VudF1baWR4XSkgew0KPiArCQkJZXN0YWJsaXNobWVudF9wZXJpb2QgPQ0KPiBlc3RhYmxp
c2htZW50X3BlcmlvZHNbbHR0cHJfY291bnRdW2lkeF07DQo+ICsJCQlyZXR1cm4gZXN0YWJsaXNo
bWVudF9wZXJpb2Q7DQo+ICsJCX0NCj4gwqAJfQ0KPiDCoA0KPiDCoAlpZiAobHR0cHJfY291bnQp
IHsNCg0K
