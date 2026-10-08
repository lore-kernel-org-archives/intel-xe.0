Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B90CA6011
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 17:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ED110E0CB;
	Thu,  8 Oct 2026 17:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMf52NCK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B3510E0CB
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 17:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791481272; x=1823017272;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HD6Hvo9kfzKw5sYLUIpZJP8WHLq3ZsWTzHaAKckdCAA=;
 b=jMf52NCKo7XGH7x+g4i69o8uQLdNhYTtaIxjtmbSFRCm1/co+SbglXO6
 jUc/bena7wNGHB0iokbmHr2vetklOeyrvEGbHOZcJMlwSkZKD38rnhffb
 33+CLcrD6oOhGyslfDDPOprTaDigahH0in10yaj5RlBeix+hWKMVzpjvP
 jKUvtJZoLu5eQx3qvYkfvJY/c7gOpUvsgG7ECWNFbXQM12OpYL3k/cOK5
 SLbZMiHVHowztI7zp6Ljuf+D6xOnKzhnQ+n6mTyIOhO8Nl8rl3ROatcBy
 UoCX+XU9J8KzaUDGQ1IZgC5LqO9MOH78UT1bl1Op7+ZUl3QiZPT6nQxzA g==;
X-CSE-ConnectionGUID: G3US0OTeRNClC1vu9xBbpA==
X-CSE-MsgGUID: 9ku4Lc9tR4ycJLWyuIJivw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="171136"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="171136"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 10:41:11 -0700
X-CSE-ConnectionGUID: HkhaUq6zQzSC5L9USM/PNg==
X-CSE-MsgGUID: LMaE+8j6RbyETzNjpvPs6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="194590"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 10:41:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 10:41:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 10:41:10 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 10:41:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnhQQtZWsGcA/e+0+fOSqgCra3qol53Va9ue0EmExIa92VIfBhpJuBoya+PtSkJmyz9IrjHp0A7qyFHNt+2ojeUwqY6Zc/HqPBMpRjd+XuoZtf2hEKnJcyhKSPAWNoeDSE2UZbAx87Pk9Ayxm+CMYmtP4tRbYIQucR/Y6VFY11rirPBFRncWPDPTMr2mWnYWJCeIG4D/UpytKWV9YOQDNF7iAQ3F529zfbtGZGV3kEEcN/ByWTd/7UEpCU3DfIWgpNS1RGjuLgCWIRbz2rBL8sn8dfggf5FT/81bbPy4obYGqQDpSWUIYbepAhsSUmqH5YAcMah5bNLVKAdXU1khFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HD6Hvo9kfzKw5sYLUIpZJP8WHLq3ZsWTzHaAKckdCAA=;
 b=Hb9V6SV7A6mEr4AYaEDHrQ9v5D2kcWMVDNxrWkk9IlSmMOra/bqlSghQmh+se/6Tgm3L2Iu25iz8Rbmavwc+BYWqmkFt3Fl8kTxHrK8CDIOGzm25tUihK5+i2iGbCDMLvw1A5KFVOO17zkTEYrDR6dwxSP8FK1/gI+83bNf+zUY/bKPlBZnZjUf7D0G99hQTQUjYLtEqJvNQU12WkDv3kuNNa8aqM5ZmGQURWE73oWVcq07tY1HFF9D5r1nlrD0MHhyTww4F5LPDyOjjm4Bf7STRqT1+87BiNU9EH8hJoI5G+Flay4BpePv2rRH8lTfwAiRL3apCMtESH9I+LYyJwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 17:40:58 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 17:40:58 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vijay, 
 Anoop C" <anoop.c.vijay@intel.com>
CC: "Nasim, Kam" <kam.nasim@intel.com>, "Luse, Paul E"
 <paul.e.luse@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Ruhl, Michael J"
 <michael.j.ruhl@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Nerlige Ramappa,
 Umesh" <umesh.nerlige.ramappa@intel.com>, "V, Mohamed Mansoor"
 <mohamed.mansoor.v@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v1] drm/xe/sysctrl: Add mailbox control state to error
 messages
Thread-Topic: [PATCH v1] drm/xe/sysctrl: Add mailbox control state to error
 messages
Thread-Index: AQHdV0eIIijuGVUHFk69W1cTmmAtlbbz6ckA
Date: Thu, 8 Oct 2026 17:40:58 +0000
Message-ID: <21d4bf46db2bbd21562a695037733259d4ed4383.camel@intel.com>
References: <20261008170710.3584183-2-anoop.c.vijay@intel.com>
In-Reply-To: <20261008170710.3584183-2-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|IA1PR11MB6292:EE_
x-ms-office365-filtering-correlation-id: 95fc44c2-77ca-4424-6308-08df25635006
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|3023799007|11063799006|10067099003|38070700021|56012099006;
x-microsoft-antispam-message-info: h5hrU2D/oxTlL3G9AFOvuGgVnLHMHEUSvRdXlGEfNJO6NqO000a75EprJ4KgBnhMzZctU2lb8NkJPVTR/xyV8Kj7Y/xCWR5UuIuh+k2mp4twn9m/3oB1sGWfRL7fBhA57V3x3hxbVr8VuXqgMd/E0v0uxHhGnGjRXtKtNpR0gONMVSal7Nc2CQT5Lawv6rtV0xk3zoDmmMaKQVhNjpzvAqojvG/6H+WFbgaZytZSVvSOwZ0s55k53tITvKZ45338Mnqd2s5NxnCqmZX4HiyrswlHlnAWTuf/DH5F1znDd9igusl5gN3rzTKPWzbJ7soEBD9TUllWgNdhH0a55PtUBLkV38KJ3fNOmoDxuoYEvcDOtE38brsnXnX3Z2JcWjDcNAdGiFGyI0isJ8wKoM88zEmJQTAf1nvJ8solPDJqUE7mGL7YExAdvrRV2P1TFK1IgsNfWeiMNrbHwHiYPaw24bM8hWZ4c41dbEh8PNXvafYO2KwYtP7Aku1VHBuli0x2Jd9sO/rDKcPlYc1weuYyKPT5NSJH+ksmoh+o3VmYjWfJ7ewysjveYydms1RZQ4Psi+ADkxloBqcSnCCL/vChLNuOk9OuyZxTnUubiARDdhhlgY2R+P61fOiUZKhR2XvHbMpNR68ZyA6ichbFmOiAT15ytWRLB3qg8JbxoduD116NLSIsrQiDrgGD7cF7iRHD8MlA/HScyRf4+pVdI360xYG1wtH41ESVhzW8aaaocNE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mjlkdm1HUkRUaHFseEFpV0tUU0hFbHQydHF2aVBCeUZieE9YVVFuNzhHMFpq?=
 =?utf-8?B?OHIyYit3NVJFbStEZnFuOUZWUjJoUEVEbTJzWGtubW5teWVuVzZlTkV2UFEx?=
 =?utf-8?B?Q1Q0RjNVVm1FOEtkVUROc2Jlc2tUeGRvNWd6cDFUZnp3NVdtVWV2emtFWWtl?=
 =?utf-8?B?bVMzRXMrOVJ2NEhtSlBXMVZGYmFQSmFQQUlmOXQxcFl2dVpsdSt2U0hpdGNs?=
 =?utf-8?B?SVR3Nkc0RlpBWDhiZnJaZEUxWW91QW9OSkMxQm1GNU9iYjdHUlZzamhSWmJ4?=
 =?utf-8?B?ME50ZXh1cUU4NGNqMWlQSjMyRGhFbGUxVFV5azFwYkRwaW11bUJYbEdXVW1q?=
 =?utf-8?B?MmRYZTJUMzV4UXhVRm5WU2RjOGErM0J4LzhKeCtmdExNVEhHOUlaeHZFMnRR?=
 =?utf-8?B?K3NNL0VTTGR6dEVSRGlqV21vSGFuamlPQW5uSnpFMXVxc2wydEFqZkVRaXJt?=
 =?utf-8?B?RUdWUHdPV3BYaENiOEZJZFkwblRoRHBkbEdVUnAxTWxqaWJ2RVlGeW9qUjhW?=
 =?utf-8?B?N0ZZMFhFdjhxSyt3LzdCRjF6QkxnMGlmU3B3MHgxbk9qSWRvdzBjOWVFRTFR?=
 =?utf-8?B?ZTNPMkQycysrWm9pUnlZaUFGcVR6SFZQcTdKYmlGWDFoZHMva0NJekJ3TnJL?=
 =?utf-8?B?NVQvWEUvN2w1RUhsYzg5UE1hMXZBbURkOUEzTWI3N0lSajl3ZEVBbUhMWUVk?=
 =?utf-8?B?U2Q0RkxRcERyYXJyQUpZaDJwREtiaHVwcklKQVZ1N0Fac2tZUXdOSmZsM1ZY?=
 =?utf-8?B?SkxSQlZVbkF1MWE0emZvRGdsR3ZQdzBlWWVBdnVOc0lsczVKc1VVcnNJamdX?=
 =?utf-8?B?eHE3RE1ZVHArVUJqb0gyb1oxWWNhb3hnMlhCZ2grUTVFQnJsSjI2alBCdGpP?=
 =?utf-8?B?UDk4ZnVUTHZidTVwK3g2TkVNWXNnZlk3aVZpMno0dzNVSXl4OCtaTExVTG9l?=
 =?utf-8?B?V3hrWjVRaGh3OENzU3dXbHdQVzlZaXA0bEY5K1AvTStLYmNTSFRadlA1Nk1n?=
 =?utf-8?B?WFFvYnZreHJmVmlzVlZzcnRyZ3VXODV6a1B3VnlUbWpGTGpyWTNvRzcrdzRr?=
 =?utf-8?B?MEJwbkl2eThiT0ZEUC90R3JpMTdRbXkvL3poRzdYbzZCZmR0QnBLS0F1Rmhz?=
 =?utf-8?B?THZnOGhCUXFqcjRvR1hmSWtRK3RZMnFhTTJNd1p3UVdxR050alBUd1BsT1E3?=
 =?utf-8?B?cDd0TlcyZkFTamJaUXAySWlMVFRKL3ZsVHh4QXd5TTltNnl1aHN0RUh6Slhj?=
 =?utf-8?B?bzBKWWpheW1hWHZjNlFsNVNGd2hlOTF0TE5jOVhBRytiN0dFTXl4WmloNjVu?=
 =?utf-8?B?OHRuKzhWWTBQRW1BZHNZdnloSEdueHh0a2tFR3NxQXZpMTFGcVMrZk55R0Rk?=
 =?utf-8?B?c1NOMHNXN2tsUEZKRVk5SDhkMkRpOGdtL09LQld2L3d4MWlGdklNTTJZMXBC?=
 =?utf-8?B?aEt3c3QrWS80eUVVRUtlajJyK2Y4QnVuYUJ5M3pOTXhzYWpIaEFPVHRSdXZP?=
 =?utf-8?B?T21Dc3ZHNlhkQ25NNnhVNlVmNXhtYm1rdms4TjUxbVZRNU1UMENVb09RT0ZP?=
 =?utf-8?B?aHhFUjZLNlB6RnROVk14bkMrai9hRjFUQkZOVjRQWUM1UWJWY0J4dk1aN0Fx?=
 =?utf-8?B?UTNEV1FXdXVxU0pVcy9VRk84RmNTbXVDK3ZBZVhUWGFFcUMrVWExK21Nak02?=
 =?utf-8?B?YTlDVHVVbmNiMEdubmNUUldqaW5ib2JHWXo5S2dhTkI5d0pNNG9ZYWdrcGZT?=
 =?utf-8?B?UElXNTc3Q2YrMjRFVXFrM1V0SmNqaUFRL25zdVlvRG1kOXovOE8zOUdaTHFT?=
 =?utf-8?B?RHVMTjNXUHdSc0Y2dzV5U0xqV25iSjFwVTc1clRiemlaM2FRRzd6N0svZlRy?=
 =?utf-8?B?My9SUFliR0NSOXpRRUFKZUVPbzNDeEhkRy9rUnE4Nkhud0ZaSngxR05hWkhP?=
 =?utf-8?B?aC9VNGtnYUs0Ulp4RFNRL2ZqOVliOXoydUkyeVAreWtUN050UjRCWWFGNGFv?=
 =?utf-8?B?aEJmUEEvWG84SGZsb3djRFdCTnJabFQyTEM0NlBjZ2RkTi84bFVLNVJXYzA3?=
 =?utf-8?B?V2VYSkJicXJTZ1RLVXcxdmJnTXNQUHBlc2k5cHRKTkZFbTdPYkJHZjBLeWJT?=
 =?utf-8?B?RVQ5UTlGS25RYmNjUmJZb3FpNXAyNzVDN1NkV1k2V3hXZXNhVklqemo0UWIx?=
 =?utf-8?B?T0Zxd2c3bDFWREgzRmF2NlBpQzdBU0RYdWlHV1FBaVdhbncwTFB1aldPMHIv?=
 =?utf-8?B?d3VWRkZTMW5wNElZUkVqYXllTmt1ck5MdlcwNnRXL09GUFJzUWZuNmZMZ0lw?=
 =?utf-8?B?WW5PVkVxM2JCMTE5SlRmckQ0ZGFMSmpCcHd5SWtLbkpLeVVnSkRoMG9VRTdw?=
 =?utf-8?Q?S0zkJaVln/uS8OOUdybn4coVuEXtYUQ9EEx/t?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E7FFCCBADEEF547B1590A1D28DBE4F9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uXGej5jyfNv3T5jJDWKCDjmZYOCxLHfKSgTPh3TZ5Dk3Q9yuoLppFUYin9DnZTC4RM20aHkb4KhWKrYe57zCXC5lOa3Svn0Rm/Ec2BLC+Y+KfBtuY5CzUI4oHv7ysaKnB2p84d7v8sXHi7S5M9HjWlG5pCsNjckrES9n55MjsDehoSc4dYVR5qhCrRKTVLX+W0y7H8mzXy5HpP7jnXPPAYRfFKaSfOXHh7lgLdfgg7oh2XB0hgafFuMoNh7kQ55GyUiziV6INiiAzKz/ho3jkRxwbT41ItwlwEwjBtvJrVXbwFSFmI7d+EAdtdMeUj9PfpqlhV/V5Qlp/ZgISAfGVQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95fc44c2-77ca-4424-6308-08df25635006
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 17:40:58.3937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oL86OQWvKgo4Z6zSOs8BxeLo2D57vnJPpwoODc7CxpivcNS0X0a552ZTK/amPrm+RQfxcs2NvEt2l4dblhVIVz6EY6Qr3MEyvRlm6MrSvLUJ7QaZKVkmxkPEPVlOo4Nx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDEwOjA3IC0wNzAwLCBBbm9vcCwgVmlqYXkgd3JvdGU6DQo+
IEZyb206IEFub29wIFZpamF5IDxhbm9vcC5jLnZpamF5QGludGVsLmNvbT4NCj4gDQo+IEluY2x1
ZGUgZGVjb2RlZCBtYWlsYm94IGNvbnRyb2wgcmVnaXN0ZXIgaW5mb3JtYXRpb24gaW4gbWFpbGJv
eA0KPiBidXN5LCB0aW1lb3V0IGFuZCBmaXJtd2FyZSBlcnJvciBwYXRocyB0byBwcm92aWRlIGFk
ZGl0aW9uYWwNCj4gY29udGV4dCBmb3IgZmFpbHVyZSBkZWJ1Z2dpbmcNCj4gDQo+IA0KPiANCj4g
DQphbGFuOiBzbmlwDQo+ICsNCj4gK3N0YXRpYyB2b2lkIHN5c2N0cmxfbWJfY3RybF9kZXNjKHUz
MiBjdHJsX3JlZywgY2hhciAqYnVmLCBzaXplX3Qgc2l6ZSkNCj4gK3sNCj4gKwlzY25wcmludGYo
YnVmLCBzaXplLA0KPiArCQkgICJmcmFtZT0ldS8ldSBidXN5PSVkIHJlc3A9JWQgY3RybD0lIzAx
MHgiLA0KPiArCQkgICh1MzIpUkVHX0ZJRUxEX0dFVChTWVNDVFJMX0ZSQU1FX0NVUlJFTlRfTUFT
SywgY3RybF9yZWcpLA0KPiArCQkgICh1MzIpUkVHX0ZJRUxEX0dFVChTWVNDVFJMX0ZSQU1FX1RP
VEFMX01BU0ssIGN0cmxfcmVnKSwNCj4gKwkJICAhIShjdHJsX3JlZyAmIFNZU0NUUkxfTUJfQ1RS
TF9SVU5fQlVTWSksDQo+ICsJCSAgISEoY3RybF9yZWcgJiBTWVNDVFJMX01CX0NUUkxfUlVOX0JV
U1lfT1VUKSwNCj4gKwkJICBjdHJsX3JlZyk7DQo+ICB9DQphbGFuOiBidHcsIGFyZSB0aGUgbWVh
bmluZ3Mgb2YgdGhlIGN0cl9yZWcgdmFsdWVzIGJhc2VkIG9uIGEgcHJlZGVmaW5lZCBody1wcm90
b2NvbCBzcGVjPw0KaWYgc28sIGNvdWxkIHdlIGluY2x1ZGUgYSBoZWxwZXIgZm9yIGhleC0+c3Ry
aW5nIGNvbnZlcnNpb24/IChvZmMgbmVlZCB0byBhbHNvIGNoZWNrIGZvcg0Kc2l6ZSBvZiB0aGUg
Y2hhcl9kZXNjIC0gd2hpY2ggaXNudCBpbiB0aGlzIGZ1bmN0aW9uIChkb250IHdhbnQgYW4gb3Zl
cmZsb3cgaWYgZnV0dXJlDQpkZXZlbG9lcHJzIGRlY2lkZWQgdG8gYWRkIG1vcmUgY29udGVudCku
IEltIG5vdCB0b28gZmFtaWxpYXIgd2l0aCB0aGUgbWFpbGJveCByZWdpc3Rlcg0Kc3BlYyBidXQg
ZnJvbSBjb2RlIGkgdGhvdWdodCB0aGUgc2FtZSBjdHJsIHJlZ2lzdGVyIGJpdG1hc2tzIG1lYW4g
ZGlmZmVyZW50IHRoaW5ncw0KZGVwZW5kaW5nIG9uIHJlYWQgdnMgd3JpdGUgLSBzbyBtaWdodCBh
bHNvIG5lZWQgdG8gaGF2ZSB0d28gaGVscGVycyBvciBleHRyYSBwYXJhbT8NCkkgdW5kZXJzdGFu
ZCB0aGlzIHByb3ZpZGVzIGxpdHRsZSBiZW5lZml0IGZvciBhIGRldmVsb3BlciB3aG8ga25vd3Mg
dGhlIGNvZGUgd2VsbCwNCmJ1dCBwcm92aWRlcyBhIGxvdCBvZiBlZmZpY2llbmN5IHdoZW4gc29t
ZW9uZSBlbHNlIGlzIGRlYnVnZ2luZyB0aGUgY29kZS4NCj4gIA0KPiAgc3RhdGljIHZvaWQgc3lz
Y3RybF93cml0ZV9mcmFtZShzdHJ1Y3QgeGVfc3lzY3RybCAqc2MsIGNvbnN0IHZvaWQgKmZyYW1l
LA0KPiBAQCAtMTI4LDE3ICsxNDAsMjQgQEAgc3RhdGljIGludCBzeXNjdHJsX3NlbmRfZnJhbWVz
KHN0cnVjdCB4ZV9zeXNjdHJsICpzYywNCj4gIAkJCSAgICAgICBjb25zdCB1OCAqbWJveF9jbWQs
DQo+ICAJCQkgICAgICAgc2l6ZV90IGNtZF9zaXplLCB1bnNpZ25lZCBpbnQgdGltZW91dF9tcykN
Cj4gIHsNCj4gKwljb25zdCBzdHJ1Y3QgeGVfc3lzY3RybF9tYWlsYm94X21zZ19oZHIgKmhkciA9
DQo+ICsJCShjb25zdCBzdHJ1Y3QgeGVfc3lzY3RybF9tYWlsYm94X21zZ19oZHIgKiltYm94X2Nt
ZDsNCj4gDQo+IA0KPiANCmFsYW46IHNuaXANCj4gIA0KPiAtc3RhdGljIGludCBzeXNjdHJsX3By
b2Nlc3NfZnJhbWUoc3RydWN0IHhlX3N5c2N0cmwgKnNjLCB2b2lkICpvdXQsDQo+IC0JCQkJIHNp
emVfdCBmcmFtZV9zaXplLCB1bnNpZ25lZCBpbnQgdGltZW91dF9tcywNCj4gK3N0YXRpYyBpbnQg
c3lzY3RybF9wcm9jZXNzX2ZyYW1lKHN0cnVjdCB4ZV9zeXNjdHJsICpzYywNCj4gKwkJCQkgY29u
c3Qgc3RydWN0IHhlX3N5c2N0cmxfbWFpbGJveF9tc2dfaGRyICpyZXEsDQo+ICsJCQkJIHZvaWQg
Km91dCwgc2l6ZV90IGZyYW1lX3NpemUsIHVuc2lnbmVkIGludCB0aW1lb3V0X21zLA0KPiAgCQkJ
CSBib29sICpkb25lKQ0KYWxhbjogYXJlIHdlIHVzaW5nICdkb25lJyBpbiB0aGlzIGZ1bmN0aW9u
Pw0KPiAgew0KPiAgCXUzMiBjdXJyX2ZyYW1lLCB0b3RhbF9mcmFtZXMsIGN0cmxfcmVnOw0KPiAg
CXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gc2NfdG9feGUoc2MpOw0KPiArCWNoYXIgY3RybF9kZXNj
WzQ4XTsNCj4gIAlpbnQgcmV0Ow0KPiAgDQo+IC0JcmV0ID0gc3lzY3RybF93YWl0X2JpdF9zZXQo
c2MsIFNZU0NUUkxfTUJfQ1RSTF9SVU5fQlVTWV9PVVQsIHRpbWVvdXRfbXMpOw0KPiArCXJldCA9
IHN5c2N0cmxfd2FpdF9iaXRfc2V0KHNjLCBTWVNDVFJMX01CX0NUUkxfUlVOX0JVU1lfT1VULCB0
aW1lb3V0X21zLCAmY3RybF9yZWcpOw0KPiAgCWlmIChyZXQpIHsNCj4gLQkJeGVfbG9nX2Vycih4
ZSwgU1lTQ1RSTCwgcmV0LCAiUmVzcG9uc2UgZnJhbWUgdGltZW91dFxuIik7DQo+ICsJCXN5c2N0
cmxfbWJfY3RybF9kZXNjKGN0cmxfcmVnLCBjdHJsX2Rlc2MsIHNpemVvZihjdHJsX2Rlc2MpKTsN
Cj4gKwkJeGVfbG9nX2Vycih4ZSwgU1lTQ1RSTCwgcmV0LA0KPiArCQkJICAgIlJlc3BvbnNlIGZy
YW1lIHRpbWVvdXQgJSN4LiUjeCAlc1xuIiwNCj4gKwkJCSAgICh1MzIpWEVfU1lTQ1RSTF9IRFJf
R1JPVVBfSUQocmVxKSwgKHUzMilYRV9TWVNDVFJMX0hEUl9DT01NQU5EKHJlcSksDQo+ICsJCQkg
ICBjdHJsX2Rlc2MpOw0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgCX0NCj4gIA0KYWxhbjogc25pcA0K
