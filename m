Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE409D46C01
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 22:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AF410E77A;
	Wed, 28 Jan 2026 22:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMlTfYQO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1AD10E77B
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 22:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769640333; x=1801176333;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0tBEkHURQ+VcS0JY/zL1xYsCH+13OB0WxSU9bO5od6U=;
 b=DMlTfYQO1Zi66TaWkYuq4fiAzTg5dUOI+r69rgIjvTq+65LvJmzuPsyb
 aYIfVtGEwoMYblHkPlM9q58tU2Bqr7Y17ZDxF7cvf+bE43VNNJuM+y7/I
 046GtoDGUQDX1csTGPV7Oa0XJuOrdjLrlHAGrrZ6NuahKCVLzFltw7DLT
 wVjObx7q2C8YyhqQTNyzUTfj4JJ2qY/MfUOP5ZjUG5e5NJICCxH6z3HzW
 y3ihMXuDvrcK06FMZt5+1fC7CCO0Eec5r6t08N1dPJmZUxLhef2rAb+r9
 kWZFS5Ez1sCxvQrZxpNFKdbEPZe70yd11cmG8gbi3tWYTEnFNERQWVGRJ Q==;
X-CSE-ConnectionGUID: PUCfQuveTLKbSODa3RC5oA==
X-CSE-MsgGUID: b430R9xBTgCvMf+Aa6879w==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81501015"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81501015"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:45:33 -0800
X-CSE-ConnectionGUID: 6X1LvWaDSHmTd2WryUlZAQ==
X-CSE-MsgGUID: IQ2YSD7OSEmgAYOJ+58Sjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="245997991"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:45:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 14:45:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 14:45:32 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 14:45:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbwooMvWf3xQpn3CxsqEZ7i8kfUZ3y8wRWWL1ZPicNNuXWQazsVgBcSBAKvNH0Cyeja0NGtfM6d5vRjrEcjOEqbqKrX8wWicQPr87kaOitstWro2gS5NnDuXPTzup8f4Zdhy5ckTPoh4Iskfkj3UV47tDasWaYoOc7Jsy6WvtxwNCJEPlyOp3E2e+FT2tNGaJ2mvF99dkLntFZs8RvHvobKnbOaCskfqViWW5wERMI0d2gil7rmNVEXStKl60/oMHm/RRxgOy4L74zvBXvgLl+Cl2LDlqajrL8u/XBrceTCwXys0c1KjYKbqGKwphicQ466Dllx+XpkC9eRoCybNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tBEkHURQ+VcS0JY/zL1xYsCH+13OB0WxSU9bO5od6U=;
 b=By+MhicrCDuR5RIf36BOHsPfdGAu1kkAc7fSEd0TjPpfGoloaF0wq0QFEK6X7fUxKWEfJqcTuhYO96kDmpUiPNImOEyv3sg2N9f7FzKkGFQF8iVJLtOjQicWj0LS0V/tBxSfBJV7o9s8KjFvdCkrJkmfCx/Pa7mR0giPO0cSTUJQNrgKCSn8+nMON6LOuwdngoMQYuUarjmsupgj3AYVIaLi6pZa0yrNz11gBQ/iAG1116qsNUZ0Wr3uNJuDVTxcNKXS3NTwmV+trTCpaZ/XZnlqGdYJLhjSEt+ylDXm/VO7KcOASXQgnSEbLpGPYtx/LJPIxR4HA+Oq76ab44Hiyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 22:45:25 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 22:45:25 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ruhl, Michael J"
 <michael.j.ruhl@intel.com>, "Luse, Paul E" <paul.e.luse@intel.com>, "V,
 Mohamed Mansoor" <mohamed.mansoor.v@intel.com>, "Nasim, Kam"
 <kam.nasim@intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>
Subject: RE: [PATCH v6 4/6] drm/xe/sysctrl: Add System Controller
 initialization
Thread-Topic: [PATCH v6 4/6] drm/xe/sysctrl: Add System Controller
 initialization
Thread-Index: AQHckC5G5kuegy0bg02FuKbivxFI9bVoK0HQ
Date: Wed, 28 Jan 2026 22:45:25 +0000
Message-ID: <DM4PR11MB54568D9070B28925B9BE0464EA91A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
 <20260128081403.3138456-12-anoop.c.vijay@intel.com>
In-Reply-To: <20260128081403.3138456-12-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB8550:EE_
x-ms-office365-filtering-correlation-id: acc4e515-15a1-4df6-0fe9-08de5ebeedb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UUkxcnRYMnBqZ1RUQTJoNVhHVWkvUytsd1Y1V1RSZHBQM1prdEg1RWpYYWZD?=
 =?utf-8?B?aTNyZXRFT0s0RWRtRm9pWnhqcW1mOVJxQmNoRkJiZUN5THhCMXY1UFpMNVpC?=
 =?utf-8?B?aWFZeTVvMExRekJreUFIaENET2pNYW84TERiZFZKRkprYTZ6Ym0vdTk3dGVL?=
 =?utf-8?B?b0kxRS9aUElicGh3UzltaEdjM1gxb1VMSXFpTTNCelBzVWRldzkyVnE5UFNR?=
 =?utf-8?B?WVE0MU9yM3Z1ZGJnd005Y29ZQ0tncm1lSTNid293RkdBVWNOeml1TXVybko4?=
 =?utf-8?B?VGZrdmxLZ3hyWWdiVGswNU1oL0lLa1Q1WThGTFJJZ1p2U0tNQWNhbnhIZDhR?=
 =?utf-8?B?eGF1RU9ldUpWWG1Lelc2dXVmZGY1TTI2eEFzc1NJQ3Y2dVBWYjVtd1ppN2lt?=
 =?utf-8?B?MVFVR2tjempTcGF5eWUvNWlMemYxQ0VzbXNQN3JycGlJK2hqV0RVbmhCckRE?=
 =?utf-8?B?OWtHckhTaEFIQUlhV0NaWmltZGVoSU1qeFJFS3JkMzU3citENnZ2Uk4ramUw?=
 =?utf-8?B?c0NUOFMwTTZsb0RrUHBWdkw4YUlMYXI3WGJSU0hWRitVd3M1RjExZ2F0dG5j?=
 =?utf-8?B?dURXTU5SNzZrakw4VlpXODB2OS9CNXd5ZEJ6bUJ2UWljQ09pSjhibUFENWhG?=
 =?utf-8?B?ODVQT3pjVmZRT0RJalI3M1ZLUFppWm5PQlpIZjF4a2FiQ3FnTS84NG50ekFO?=
 =?utf-8?B?YlJEVlMydEU4QStvU0hWOHNtR2pZRGJYc3VyUmdVYVRPaE42Rm1nOFY5MU9j?=
 =?utf-8?B?UUJ1cTNHMmdLSzdQWWs4NVh6RTBYbWsvVjhGRzI5Wlh0MHZHekxyTWVTeS9a?=
 =?utf-8?B?MElnK1JSS3poTWxhQjBJL1g1V2lnQ0JDUmxDMUNqWlZyemYyRDZidlBNR0VV?=
 =?utf-8?B?ZGY3S3E4bDJ3MktRdFpvamVqSGJOdzA5S2JWMzh3VDhNblRSRzQvYkIyY3VS?=
 =?utf-8?B?QjFFVW4wMEd1NGd5NFpJdVJ0NnlzL2JZL0xSNGExZHB2SUtLWEgwNTVLQ2Zz?=
 =?utf-8?B?aUMycDE4VWEydDJEZElJcklTS2RlRFRPaEFBRDNIUjMrOEZjelFpY3ZFalVM?=
 =?utf-8?B?cGEyaUsxVVJFWE8rQUhpYVl5dzRBNjVWalBPemVtSUVMbURmL3J6QlVLWE1k?=
 =?utf-8?B?U3hsQUZHKy9wa21tanQzSGp3VXVQTkdxWXNwQ2RkbVE2SmhBYy9rSU1jMFgr?=
 =?utf-8?B?THgrQ0o1YmhCcmZlak9GV3FFdmtSZ1NMd3hhNkZDWlpNRkdWZm1tdkRpY0hL?=
 =?utf-8?B?c1lQL1ZkQWVpUURrNzhOTTdrSEwzbCs2Z3I0eGJic3o2allGU3pYSmF0NDlW?=
 =?utf-8?B?ZG9pMmx5Q3B5WGQ0NGxJNEp5Um1zZE1mcldPUExHS2VtQnJOMXhSbmcrNnlC?=
 =?utf-8?B?dVVvSzBjOG5OQ2tSTGtGc0hwcjlCL1lmT0FmbEhNSDFmdHMycG9COWp4ek1W?=
 =?utf-8?B?aGNLbjY5Z0ZCVzhxL3RCSmVqckRTZnRzdUpMRWJaODlWckdicUhyVlJMd1h1?=
 =?utf-8?B?NnNLYWRvMXo2WFhpR1d6cXN3UzRCR1kwTitxS3hUdWVzTXJEcG5mRVBpWDI2?=
 =?utf-8?B?L24wOFlYS28zU0xnbkdOWFc2VjZqNW5sWHRodmM1dXhxL1prT0dmd1pJZksz?=
 =?utf-8?B?ZmNiQ1NKNjZEZWRqRllhMERqR09KQ00wMTBGckxVbEdhT0lJNUtYUG9ZWnJH?=
 =?utf-8?B?MjhGanl0Y1Q2ZGpOZFVtWGpyMWNvajN5dkJqWnhjZ3FHTXBzM0g2ZlAvYXJx?=
 =?utf-8?B?QjZ4d1F4eE96S0dodThEOVBGYjZzcnlPR09EOHh4SWt6cEIwY1lYUmhjMGZ3?=
 =?utf-8?B?dFY1T2k1N2x0WU9uZys4U25KRFBIZklSbWc3WDQxTXMwc2UweWlrcmVteFVQ?=
 =?utf-8?B?MDBYS1B4VVo3cEFpTk44WFl5SGFFU0NLRnBFenVnNHpsakpxRENyK2xnaWxu?=
 =?utf-8?B?dXJKWm5lL0h0N2s1VlRUa3N1VUVKTTZwUEkxS1h5TUM5WU93b0R2cGdFdU1Y?=
 =?utf-8?B?TU9IZCt5THVXRXJiVjJKMC9JaGZaOGRwc3RUOHlRZ2lqYVdiYmFFUERWMDNI?=
 =?utf-8?B?eEpPV3pOb0pkMllBaVNRaUZkemRpVkROOUJaYjdtZDFhNXUrellrOEtEY3lv?=
 =?utf-8?B?cDNtbVNkMFA2dnl2TEdZN0lERkxWNHM0SVNsWkFaTGdtQW1DTWpLdTIyL1Nh?=
 =?utf-8?Q?y8YBgOHFTWVBqhpFR6dezqY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ME42Q0Y1M3VJUERoNTBVRGgxVTRtOGNneWwwSG5RbFg1cnBlQ0QzZEV1bXVJ?=
 =?utf-8?B?SEMxUk1HRklCRngvbmpXUktNY3M1NDA3ckJOVktIWEFtelp5TUcxMWZuanNR?=
 =?utf-8?B?YzFUVkVXNlEvcWRuSW43WUpIelNFc3JUY2c0TjJPbHdKcDRMdjNKV0JGZGQ1?=
 =?utf-8?B?cmlkYW5CSHJIaWdGM2M5d3plRXFlT2dibXgzZWZXNlZockRQd251WjNMY0J0?=
 =?utf-8?B?WExqSitMeE9nZ1dvQkt1Vk9IS2FZek5MOWNKazRMZjB6cjZzZWdyaG5FUTUr?=
 =?utf-8?B?SWxIc2pTN0RUbUtXUVNsWlpucmdVSkVTM2o1MGNVdVNLNWsyQkFYSUVCZ1Uz?=
 =?utf-8?B?cGJsQ1lQMExhYVJFU2hiUThKb0ZpY3FIcEE5RGVNR3JiRlJMNmJtbEpOMXhL?=
 =?utf-8?B?WXdtaUFEQjArV0RjTjZLMWVQdktWSGZ6SjVNMUEycFhJWWJQcHE3VkMvTU5P?=
 =?utf-8?B?aXhnU2Q2bDB6ZHFLUXdiTkdNcWJRL0VaZkIvWTNna29QVitoODVPaEhtT1Vq?=
 =?utf-8?B?dEdnMW9HS1VGYWg0dXMwUDFZNmlVWFBGUUVHNzJudDI5YzZQVktpMGpDd3lD?=
 =?utf-8?B?L2ZBUWtjU3U1bmk3Sk1PNWlNSmFQbTNEUnMwa0ZFVm9rakRTa0JscGwzVzJo?=
 =?utf-8?B?NzhFTFcvWHBOTHNIN2tHajhkOEVNSWJoUDN4RWxHUDJoejF2ZXpxclBud01i?=
 =?utf-8?B?QU5uSFQwTXZkVFk5MXRiZHV5UExGNnhxcndwYUwzY1pKUHYvMjBXTXJUcEMx?=
 =?utf-8?B?OTBHOHp1ZkZlZ09BZkwrcFVBcGpHN0RScW0xRHpLczhhclRZakptU1cvSk9a?=
 =?utf-8?B?YWF4K0RrU0c5aEljVU1ESHZKSVB6S0VQY29OSWR1ZCtjK2tLbGlzY3pDeG1Q?=
 =?utf-8?B?QmZJejExS2hYVXFFcXF0VENuMi9QLzVFbVVUUytPTzRTMkN0aWxOUDFuU2Ur?=
 =?utf-8?B?N1dmbzNIVzhlRlBrUEpGQVFlbk5XVHNWakdXRUswVXUyNGc2Yitzd0JtQjYx?=
 =?utf-8?B?amJHTmlERG5rMkF4cjJucGtNalRpT2hCcHRxMVpTRmtMT01QdFZ6cVFzaGd6?=
 =?utf-8?B?UkIva2MvTjN4L3JCVGFmcFFCN3pjQmRDaUhzOG9WUE5ucC9LNG9VSitJRnhk?=
 =?utf-8?B?Vm16ZDNRWFVDOVZrU0g3Yy9ucnFyWit0RWRwNXJYVi9zeHB3cFN0Qk9BVUxo?=
 =?utf-8?B?THlyWTFUZlF1K2JoUTlPeTR4NkY2WEttN21nbUNUVm42NHhFYUp3VFZiN25O?=
 =?utf-8?B?NGdIVE5zVCt5bWt2WGFrMHZHYWlVcC8xRkhRRjhPWVVGZVJpckZUaXMwZDY4?=
 =?utf-8?B?TC9yTXA0cFZYais5ZkJkMFYzVVZJMlp0ZG5TclNzQXkwYUV2TGNMU1ZJVnZ0?=
 =?utf-8?B?OFFZa05oR0doZlZsOGFKR3RCOW9EUkdPa1NWNEg2b2RldTdPeXI0NDlDL1R6?=
 =?utf-8?B?cUdDV0NCZnYwVUs1RlBzNU1sYUFZOStUck92MFY5dXVBVjArVEVLa3pIOFlT?=
 =?utf-8?B?M00zaXExajJkNE42NDdlV3lkWUJKVHM4ZytlSmt3K2ZUd3BlR1Z2czNPVnJ3?=
 =?utf-8?B?VTZGekpseTFGamovY0Qzb1RUTjlWVGsrMjg1dlZsWWI4MWJsVFRlbWRvTEpw?=
 =?utf-8?B?TkFpSnlIWXZlS2g1MGJnb3VtNkZvOFRVUG11c3BJNk5TM0k4YVpyOHUvSGN3?=
 =?utf-8?B?SHZtOGd0K1VLTmtqRHJiWTlEb0FCTWNpMUs3ZC9PaEZUTCtRdXgyZWduRTJz?=
 =?utf-8?B?UnU5WGZoL2NTZkplL3FRVTV4b0lNc3o1WW9HeFI2N29QWGd1MmttNzl3R3Va?=
 =?utf-8?B?cmJpS1NhUTFQOHpSMGJ4RXRCTmlnYmRyMEErOE9aY0NVcWdER3l6SThMcEJE?=
 =?utf-8?B?Q2YvR0hFb2lKcUpZcWJLS29uSXZ1YXBnQ2lJRU9wSFg1VFphWGovMktvQU5y?=
 =?utf-8?B?SlhrQUVMNFVlMXJLV1FQUGdidm9lRnFRbkF2cUQzOFMzTTRLNW1UeUFyTXhu?=
 =?utf-8?B?VnBwMEJYU2p3TGdjTjg2aDROWEFZMUgzdnVCMzFVYjE2MnJHSXdJbkptV2xF?=
 =?utf-8?B?djJlaG9JbjFCZkR6aWkyWFZxK3JOa1B6RGpDQ3JmTS8xUUFMT2lLckZVazlq?=
 =?utf-8?B?REpOWnFqa3Frb1l5ajBmUWRTdnFwT1cwR3daWk03NzZaZnAzZTNoTWdEaDls?=
 =?utf-8?B?dS90KzdxaXFDMXFGZ3AwSnlLclBOa2trRVFQM1V4YkJGTmVjUzh2T3UzdFZ3?=
 =?utf-8?B?T1hLRlcxUkUyUzUxZTk2eGtMVHh3OUcxT1NoYzgwQ0tnYTgwaFBrQTNlblN1?=
 =?utf-8?B?NEZnbnNPakhQbDNQZkF5czFtSVp1Sy95QXhMVyt5eklEUlFWQnhiUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acc4e515-15a1-4df6-0fe9-08de5ebeedb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 22:45:25.7823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JWdKPiXzp3Hl/8D/t5/0F/kGmP8bnwoArdnfG86HzpkW5HfaJpTVage2nMABHPS/3f8aA8q/eIxTMsD2ipXpuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
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

T24gV2VkLCBKYW4gMjgsIDIwMjYgMTI6MTQgQU0gQW5vb3AgVmlqYXkgd3JvdGU6DQo+IEZyb206
IEFub29wIFZpamF5IDxhbm9vcC5jLnZpamF5QGludGVsLmNvbT4NCj4gDQo+IEFkZCB0b3AtbGV2
ZWwgU3lzdGVtIENvbnRyb2xsZXIgaW5pdGlhbGl6YXRpb24gYW5kIGNsZWFudXA6DQo+IC0gU09D
IHJlbWFwcGVyIHJlZ2lvbiBjb25maWd1cmF0aW9uDQo+IC0gTWFpbGJveCBpbml0aWFsaXphdGlv
bg0KPiAtIFJlc291cmNlIGNsZWFudXAgb24gZHJpdmVyIHVubG9hZA0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQW5vb3AgVmlqYXkgPGFub29wLmMudmlqYXlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsLmMgfCA4MA0KPiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsLmgNCj4gfCAxMyAr
KysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsLmMgIGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPiBkcml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybC5oDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5c2N0cmwuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9zeXNjdHJsLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggMDAwMDAwMDAwMDAwLi40
MzBiY2NiZGMzYjkNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfc3lzY3RybC5jDQo+IEBAIC0wLDAgKzEsODAgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBNSVQNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAyNiBJbnRlbCBDb3Jwb3Jh
dGlvbg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4NCj4gKyNp
bmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KPiAr
DQo+ICsjaW5jbHVkZSAicmVncy94ZV9zeXNjdHJsX3JlZ3MuaCINCj4gKyNpbmNsdWRlICJ4ZV9k
ZXZpY2UuaCINCj4gKyNpbmNsdWRlICJ4ZV9tbWlvLmgiDQo+ICsjaW5jbHVkZSAieGVfcHJpbnRr
LmgiDQo+ICsjaW5jbHVkZSAieGVfc29jX3JlbWFwcGVyLmgiDQo+ICsjaW5jbHVkZSAieGVfc3lz
Y3RybC5oIg0KPiArI2luY2x1ZGUgInhlX3N5c2N0cmxfbWFpbGJveC5oIg0KPiArI2luY2x1ZGUg
InhlX3N5c2N0cmxfdHlwZXMuaCINCj4gKw0KPiArLyoqDQo+ICsgKiBET0M6IFN5c3RlbSBDb250
cm9sbGVyIChzeXNjdHJsKQ0KPiArICoNCj4gKyAqIFRoZSBTeXN0ZW0gQ29udHJvbGxlciAoc3lz
Y3RybCkgaXMgYW4gZW1iZWRkZWQgbWljcm9jb250cm9sbGVyIGluDQo+ICtJbnRlbCBHUFVzDQo+
ICsgKiByZXNwb25zaWJsZSBmb3IgbWFuYWdpbmcgdmFyaW91cyBsb3ctbGV2ZWwgcGxhdGZvcm0g
ZnVuY3Rpb25zLg0KPiArQ29tbXVuaWNhdGlvbg0KPiArICogYmV0d2VlbiB0aGUgZHJpdmVyIGFu
ZCB0aGUgU3lzdGVtIENvbnRyb2xsZXIgb2NjdXJzIHZpYSBhIG1haWxib3gNCj4gK2ludGVyZmFj
ZSwNCj4gKyAqIGVuYWJsaW5nIHRoZSBleGNoYW5nZSBvZiBjb21tYW5kcyBhbmQgcmVzcG9uc2Vz
Lg0KPiArICoNCj4gKyAqIFRoaXMgbW9kdWxlIHByb3ZpZGVzIGluaXRpYWxpemF0aW9uIHJvdXRp
bmVzIGFuZCBoZWxwZXIgZnVuY3Rpb25zIHRvDQo+ICtpbnRlcmFjdA0KPiArICogd2l0aCB0aGUg
U3lzdGVtIENvbnRyb2xsZXIgdGhyb3VnaCB0aGUgbWFpbGJveC4NCj4gKyAqLw0KPiArDQo+ICtz
dGF0aWMgdm9pZCB4ZV9zeXNjdHJsX2Zpbmkodm9pZCAqYXJnKQ0KPiArew0KPiArCXN0cnVjdCB4
ZV9kZXZpY2UgKnhlID0gYXJnOw0KPiArDQo+ICsJeGUtPnNvY19yZW1hcHBlci5zZXRfc3lzY3Ry
bF9yZWdpb24oeGUsIDApOyB9DQo+ICsNCj4gKy8qKg0KPiArICogeGVfc3lzY3RybF9pbml0IC0g
SW5pdGlhbGl6ZSBTeXN0ZW0gQ29udHJvbGxlciBzdWJzeXN0ZW0NCj4gKyAqIEB4ZTogeGUgZGV2
aWNlIGluc3RhbmNlDQo+ICsgKg0KPiArICogRW50cnkgcG9pbnQgZm9yIFN5c3RlbSBDb250cm9s
bGVyIGluaXRpYWxpemF0aW9uLCBjYWxsZWQgZnJvbQ0KPiB4ZV9kZXZpY2VfcHJvYmUuDQo+ICsg
KiBUaGlzIGZ1bmN0aW9uIGNoZWNrcyBwbGF0Zm9ybSBzdXBwb3J0IGFuZCBpbml0aWFsaXplcyB0
aGUgc3lzdGVtIGNvbnRyb2xsZXIuDQo+ICsgKg0KPiArICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3Ms
IGVycm9yIGNvZGUgb24gZmFpbHVyZSAgKi8gaW50DQo+ICt4ZV9zeXNjdHJsX2luaXQoc3RydWN0
IHhlX2RldmljZSAqeGUpIHsNCj4gKwlzdHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IHhlX2RldmljZV9n
ZXRfcm9vdF90aWxlKHhlKTsNCj4gKwlzdHJ1Y3QgeGVfc3lzY3RybCAqc2MgPSAmeGUtPnNjOw0K
PiArCWludCByZXQ7DQo+ICsNCj4gKwlpZiAoIXhlLT5pbmZvLmhhc19zeXNjdHJsKQ0KPiArCQly
ZXR1cm4gMDsNCg0KSSBndWVzcyBWRiBzaG91bGQgbm90IGhhdmUgc3lzY3RybCwgaXMgdGhhdCBj
b3JyZWN0Pw0KSWYgeWVzLCB3ZSBzaG91bGQgYWRkIGJlbG93IGNvZGU6DQoJaWYgKElTX1NSSU9W
X1ZGKHhlKSkNCgkJcmV0dXJuIDA7DQoNClNodWljaGVuZw0KDQo+ICsNCj4gKwlpZiAoIXhlLT5z
b2NfcmVtYXBwZXIuc2V0X3N5c2N0cmxfcmVnaW9uKQ0KPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4g
Kw0KPiArCXhlLT5zb2NfcmVtYXBwZXIuc2V0X3N5c2N0cmxfcmVnaW9uKHhlLCBTWVNDVFJMX01B
SUxCT1hfSU5ERVgpOw0KPiArDQo+ICsJcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KHhl
LT5kcm0uZGV2LCB4ZV9zeXNjdHJsX2ZpbmksIHhlKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1
cm4gcmV0Ow0KPiArDQo+ICsJc2MtPm1taW8gPSBkZXZtX2t6YWxsb2MoeGUtPmRybS5kZXYsIHNp
emVvZigqc2MtPm1taW8pLA0KPiBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIXNjLT5tbWlvKQ0KPiAr
CQlyZXR1cm4gLUVOT01FTTsNCj4gKw0KPiArCXhlX21taW9faW5pdChzYy0+bW1pbywgdGlsZSwg
dGlsZS0+bW1pby5yZWdzLCB0aWxlLT5tbWlvLnJlZ3Nfc2l6ZSk7DQo+ICsJc2MtPm1taW8tPmFk
al9vZmZzZXQgPSBTWVNDVFJMX0JBU0U7DQo+ICsJc2MtPm1taW8tPmFkal9saW1pdCA9IFUzMl9N
QVg7DQo+ICsNCj4gKwlyZXQgPSBkcm1tX211dGV4X2luaXQoJnhlLT5kcm0sICZzYy0+Y21kX2xv
Y2spOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwl4ZV9zeXNjdHJs
X21haWxib3hfaW5pdChzYyk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfc3lzY3RybC5oIG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4DQo+IDAwMDAwMDAwMDAw
MC4uZWU3ODI2ZmU0Yzk4DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3N5c2N0cmwuaA0KPiBAQCAtMCwwICsxLDEzIEBADQo+ICsvKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogTUlUICovDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjYgSW50ZWwg
Q29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9YRV9TWVNDVFJMX0hfDQo+ICsj
ZGVmaW5lIF9YRV9TWVNDVFJMX0hfDQo+ICsNCj4gK3N0cnVjdCB4ZV9kZXZpY2U7DQo+ICsNCj4g
K2ludCB4ZV9zeXNjdHJsX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiArDQo+ICsjZW5k
aWYgLyogX1hFX1NZU0NUUkxfSF8gKi8NCj4gLS0NCj4gMi40My4wDQoNCg==
