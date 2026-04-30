Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D537DCCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 21:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A9310E48C;
	Thu, 30 Apr 2026 21:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oH4FPNHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E747A10E48C
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 21:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777585821; x=1809121821;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=c6CRlJj+k4oxgCjXqV/NTMf1vGuJIHMdg/aZxJcBgEY=;
 b=oH4FPNHKpS9B687MYnvZtcfKOzwzC/a2/cqjxqqk2Bh4cAMDgbE8BFk7
 TkJn5L8CU2LckCVKS92QYrBCUGTk4vnIBdQVxQ4Vz6Y5mzKLs0EYnEpxg
 4GgiKJWTmILoKGfA79CYzCoy7CInybQBEfEht8Yc0gY6qF4OgA17L2nfN
 6q3eYS1cdmdpLh/IfsJc9n54v8ZQUwUcU9BArMLo9QyKwcn9rNhx8fBMo
 qz0pXhQBZSKZ5GT5Vulbn1xEtATZM44oMzNaQy7E4XHM1g5S0UV1JhE7j
 sfdiY+LXiQpXbCX52ZzJickUEXmZrbtzyLA1/0dL+oAPbH249ODGJU6yP Q==;
X-CSE-ConnectionGUID: b/4cuJo0Sq+/2RCIHI0ZnQ==
X-CSE-MsgGUID: 7FpVILdXSeSISFajGRvwUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="88866156"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="88866156"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 14:50:21 -0700
X-CSE-ConnectionGUID: KCXkchOARda8kvFSs6PmGg==
X-CSE-MsgGUID: AeTDHabvQTugelRxiD/7Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="236511098"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 14:50:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 14:50:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 14:50:19 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 14:50:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyZwk3rjfYFnzB9B4/tj33aMlEcbuFdBMJyozHD72KDlsfihWNETKh9OUB9Zhv83WyTs1MYfEy86RYZFwcxI98vG9s1L/aKnpEyaQnaXerUBaPDjrEiRboFXPKSSRvR2+w5O9gIxdG5iaIbNF9PL+WV/CX3z7OovADyNuBN0UyXYcpzvD/SqpH/GyENhoKmGokshVzFkOwVG6rh4uVPUZLjqeaJn/Upjv3q2vNFtMLJnAx3a2IoQUo1Ci7OR1Au1KgAgdewN0iIWXaLZnqTSUqEDZwOfTE9x49D4QPzSJwWMJccKagY9IfWEOLln8GBax5cmvsAeU4V6w30lds6Tgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6CRlJj+k4oxgCjXqV/NTMf1vGuJIHMdg/aZxJcBgEY=;
 b=HpjgAeP/O48cYbcsva8n4lMVwH2W4MZefzY2TvLCgPk48g8YwlWsMURQe9L9R3K5NOF+Xh1fO5H274nm9bHQplMrWu2Pvxmus9t3yEMU9PFvCxtnyEcm5GAJO2NXiicVInrfghgGDWNNUOANBJn1U3l+4tgNUz+ysU/QXIDLd1alWV0RoEjTLrOTZntP5Q5nqDlHR1qRuNtdyhKtJEMNQhWppD7OLaSEv9N7eT04qYyApOlgOTUrinOd1seUbW1YiJHa0Iwk3aP298YrrIok9zemXv29a70+xJAJJsc5v39NugklFxtWs3BVxfShTX9hQnP9NL1VzgDF+fcY1vN2IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ2PR11MB7672.namprd11.prod.outlook.com (2603:10b6:a03:4cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 21:50:15 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 21:50:15 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Wajdeczko,
 Michal" <michal.wajdeczko@intel.com>
CC: "dev@lankhorst.se" <dev@lankhorst.se>
Subject: Re: [PATCH 01/13] drm/xe/ggtt: Rename parameter name in
 xe_ggtt_init_kunit()
Thread-Topic: [PATCH 01/13] drm/xe/ggtt: Rename parameter name in
 xe_ggtt_init_kunit()
Thread-Index: AQHc1xs9k7ONtdHBK0isqW3AZvyET7X2f3AAgADKMwCAAN7LgA==
Date: Thu, 30 Apr 2026 21:50:15 +0000
Message-ID: <9fae3cc7f3bb70c4c0fbf12e689e1320a1377446.camel@intel.com>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
 <20260428142722.582-2-michal.wajdeczko@intel.com>
 <4561363a9ff4fc0449bd56df4c5ea9fa4d756f0b.camel@intel.com>
 <9452d9c122d77d7b60c3705e7613461d7e1c4ad7@intel.com>
In-Reply-To: <9452d9c122d77d7b60c3705e7613461d7e1c4ad7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ2PR11MB7672:EE_
x-ms-office365-filtering-correlation-id: d1e703a9-fe66-4b03-6d61-08dea70276b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: O5Qon2tsvhl94vZLHBU92PVgoy8xECQkxFU8R1Wic5rhJ1hP+Cc7hEEyYL6+ZpFM4KkcI5Bw6eNHJu2wwslkC2yD6PK6ncsEdxm4A7kHXGs/IGBmbmBuQIzkQg9B/Mf0yx/meJVovSP9otYZyKJTitK/M2mGzYeEc8s83OqyiUg2CUT9CJwQCA1q4ciIGLUw/S34gCBgIelqzWjWdYtlcingeV2Lg3jaUmEunmjNcUW2Yc4wLTr0aIzrY4pIATxOSlPjAi99qP8TVvvpf1vARpzGcLZHo/Xk+57h+UZOrnSc0xnOclKnbYy3331GkjSlQlniMhEi3I2yGINO6hxzuwsIr8ct6AtrAPM/yRl/h+pv5GYTy6cixWUTvM9CUMrWCG9kRKmMxqd1uW5ROXYvOz3pt9yE2HHGQ/DXlhh+DsmeYC1Y5Wy6w53I/95tbb4wlJBKBO0VEH7M55OVLIOOfA8c4hMTHOfbhBMC0UV1fOsGRBGhTqO/xs9ysHl214POD9MGD27fuF0hsVaEAxY6ooXPqzaETPvexy2KXOIHl+7KPQC38pnxFBgDd9IuohVP7Og03vOq1KKVi60jOfypb/SK4Gd0vGujA++/381O0mhtiGBGH7sY2gefYwOuUxGtR4SivTfEl733JH98HVaTIV4NLSSxL8vdgRyQvxgiYPzabeVdPgVAaRV4SlqHCZYwo0jCGCjtwNrE1hlxbH/bDgwffl4PnLPNr13jWnkUSp76pY7xsZEkVzRZYnebBk/E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qi91SGQrTEY3NEJ2dWxvQ2dscEpLcUpNcWRyWEs0eUtMc3BNbVRNcVVFcUNp?=
 =?utf-8?B?YkxiOE1QbUxaR1NTUDJSZGhXOHBEdHdaV1M3aFRUQk1yV01yYzRnSSs3cVQy?=
 =?utf-8?B?S2ZVbVBFZ2ZtaEttTm02cmx0RWE1TEw0aXZVODF3OEtrT3N5Q1grN1F1cENN?=
 =?utf-8?B?Tlh5Z0RLMnpKRWpjSzhtU2l6NmJIT21pNkxUdDcvdXlEMEl3NUdLY09NYytT?=
 =?utf-8?B?TUI0V3g3bEtBOTA5bHNtN2xRN0xKbnJyNlNKWWorRlJrcW92WkxpdFN2SklL?=
 =?utf-8?B?Nk04Tkoycnp3dXlwM1ExSDNaTjIyTzRZV2JGdTdTNFJOUjJKbTZReWRYaytj?=
 =?utf-8?B?aVpRRFRHbitraU8wUU1aT0ZtUXZGcEM1djlrdU0wdVA2MU11V2NaRERESTJI?=
 =?utf-8?B?VzlDZjN1ZDdDY09WdzVrYUVHemNvNXZPMG1QbjBxb3FEUmZzcHQ5VndmT2Rh?=
 =?utf-8?B?MFA0djBLNnhCZ3BvVUpOMXdzM21meFA2dEJZUWFmOEdyNUVjQUZVK3BpQldY?=
 =?utf-8?B?OW5UdXg1V29JVlIvdktUK3lpVnJraWRaOEV2NkJENkRsM2Z3ZjdyWHRXU01j?=
 =?utf-8?B?OU10WUthdHBNM0lmVmpydkwzMjBNQUNFd0NrN3VRcXZDeU41UHhqcGtZMVBm?=
 =?utf-8?B?bWFEY0V5bnYxeGR6YjlGQnRoVDhzaWdubXNwU3hMUWZkNktQMndMQXJqNVl0?=
 =?utf-8?B?cURYeFp0Vzg5NVZoZUJ0N3VndVg1ODhFem9hZHdVNFg3ZEFWb3hXMkxIcVBm?=
 =?utf-8?B?VW9OZmRxVC93UitMSFgxNWZaYmJ4cmpodE5kaXBFVGVSUU40dTA2am8wZGJM?=
 =?utf-8?B?Uk12bkNWZTM5RHdyL21UenYyelVzN1RSaTlOa2RibDh5UTFySk83VUZYb3hL?=
 =?utf-8?B?Mkpub3NxY3hzVjlVS2dMWjVMdUFFTzdkRU5pUm93aE9vOUxFWCtISk1oRkVC?=
 =?utf-8?B?N3d3T2ExbWZ1ejE1Y3VRSnl4bnJPb0xFTjY5c1NtZG5oTW0renVBaERWblpK?=
 =?utf-8?B?TkFTYmJlUGR6MEFDWWFUd1hJQ3BmQW1YS29LQ29UbmpIbEhNMnJ0aS84RjVU?=
 =?utf-8?B?K0NCL0FLVVp0NVpkYW1RTDh1QzlTQmVUY3R6TDEraVFydUl2UWU5RzJCT3R5?=
 =?utf-8?B?akh0VURDaUdUNXRXZkdKMUsyTFlSempDR2J2RWhpSXBsVTg1SUpCQXJqVGFv?=
 =?utf-8?B?UnQzcWlWb2M1RlhyQm9hMDFWckVkd3NCYkNnZTNuOEtIdVR6RHJGaE9vc3Ez?=
 =?utf-8?B?dkVZTnl4ZUE1RmdzOVBoN1kwL0FqanBOcHF6NUxQSGdkb2I5TGs4WGNZUGl6?=
 =?utf-8?B?emRaOGhLYSt4OGN0NjlLdlk4NmNXdEFqZGd3WlhReXVpUUc5QUdqWUp0N211?=
 =?utf-8?B?M3lCcEptd0UwZEVRUTFreW1hRk0wYlhYczZoVGJxZUdvY0U0aHBjQ0VyMzFK?=
 =?utf-8?B?SHZ5TEh6OFJhSWtCQjZMakVQR2tHdjRVUmJIZ0h0NXNER2djWHpLLzFDcHkr?=
 =?utf-8?B?d3g2MEd4d0oxZWdPUXlISHhiS01HZ3JlTUdJRHJoRG1VeFZ0NE5sWmdqdnB6?=
 =?utf-8?B?bVFzemEvUlhyOVlESERJa25PNkNpdVZvQ1Q4S0dHMm9Jcmp2T3dpY1BSamxV?=
 =?utf-8?B?RUd2REVQOVVacEl5emIyVWJhQUUvSmRmVjZueE5xTW9PZWVxSmlpYXpsd2I5?=
 =?utf-8?B?WHdHZnFhQ29Ob3AxekgydGdyMmFIb05MMVBMaURaeWVjcGJDdTFXczZJNXo2?=
 =?utf-8?B?R2k5RnZmVFdYSUliRzRURkdXMi9tbHRuTVBJejUvVWVSWk1jNzFGbVk4UHFB?=
 =?utf-8?B?NmEzbW5uUnFxWVdZRlFCZzhMOEcyYXV0bE9qYlRMNmVxWThpeDRLa3B4OTVN?=
 =?utf-8?B?N0UwUkZyWTNaWGRPd3pOdVFSai9PRDF2aTY2cjkwQVdkY0piU3dQSjNLOVd5?=
 =?utf-8?B?KzExRUdvRXFKaVp6cUt5bXJwYTI1eHorRW9BdUF5eDRFUFMvbThnTVFmVmNk?=
 =?utf-8?B?VFBtZVVPVUMzVUtCOVRKNExTak5vVmh3ODJqWnFhbEErRk1RSUpobGNEM3Z3?=
 =?utf-8?B?TXpua3pINTRrYXVRQVRKR1FubnBQTmg4NlBwcExXVjAxNThoRnJIUWNTaHhY?=
 =?utf-8?B?RkpPQTVKeXF0Y1BoQUQ3eTNWZ04zdFJabWJvdElyR1dQN040TTlmWXQ0YVVl?=
 =?utf-8?B?RjAyYVFIT1BIU3ZFZ29kL2VONnNRMU0yY201N0dGdUsrck5VM2dxRWIzK2E1?=
 =?utf-8?B?SWpoY29wRVJRTXVITFowM3cyRVRJTi9GaDVEV2dUK25zQWlHNlY5eWIrVCtl?=
 =?utf-8?B?OUdZSmRiOUJQcFRUQmw3NWVNNDZreDZaOWtyUWVlRGU4VVBQZ0RMRWxkYXJP?=
 =?utf-8?Q?KlxrVx/aK3WBXfnw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C57D8050E0076944B6CE5DD1D527E278@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: S5pRBo5wvKlUS/raoYYcAeZ1dIt1pPEZkPGY2KVoJZXHb94LL9VFTaYlhLme1X+KgbVtVEpUx1dW4VIdV24NlISTMu0nCI6kH/EKDJYi7ZrwHWXNxz8JMT6l9c7eTm/KKM2cUq4U8P75isR1ewPK2UeHa8cUG16AoQQn/VZlV0Cu6FcpL32PpMUQHgc2PhW5z3MoBmmWUXdLgj7FPkFZrYF1Ln99K4y1u4LkqSVgVj2m0hdhbcbmAIR4YK3JWowCr3FtV+BdJJfdzPdKvjPXHg+1pDN75vy10qx8S/907Bic0GwRtNiYO4RorVdT2GOz9K5cFPRwPwEtrdU6b8XgtA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e703a9-fe66-4b03-6d61-08dea70276b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 21:50:15.6301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+BqqOaIdzZnotUYlm8rvpkH6Ef+rJsykrUD0XUo9qk7Ukv64knL2H1aOU65LBwdW7qtOgVu0KpFouChyv5SCp10IpIRA2tSRNqzn7/zB1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7672
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

T24gVGh1LCAyMDI2LTA0LTMwIGF0IDExOjMyICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gV2VkLCAyOSBBcHIgMjAyNiwgIlN1bW1lcnMsIFN0dWFydCIgPHN0dWFydC5zdW1tZXJzQGlu
dGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gT24gVHVlLCAyMDI2LTA0LTI4IGF0IDE2OjI3ICswMjAw
LCBNaWNoYWwgV2FqZGVjemtvIHdyb3RlOg0KPiA+ID4gVGhlIHBhcmFtZXRlciBuYW1lIHdhcyBj
aGFuZ2VkIGJ5IHRoZSBjb21taXQgMjI0MzdmMzBkMmYwDQo+ID4gPiAoImRybS94ZToNCj4gPiA+
IFN0YXJ0IHVzaW5nIGdndHQtPnN0YXJ0IGluIHByZXBhcmF0aW9uIG9mIGJhbGxvb24gcmVtb3Zh
bCIpLCBidXQNCj4gPiA+IHdlDQo+ID4gPiBtaXNzZWQgdGhlbiB0byB1cGRhdGUgdGhlIGZ1bmN0
aW9uIHByb3RvdHlwZS4NCj4gPiA+IA0KPiA+IA0KPiA+IEluY2x1ZGUgdGhlIEZpeGVzOj8NCj4g
DQo+IERvZXMgaXQgcmVhbGx5IG1hdHRlcj8gSXQnbGwgbGVhZCB0byBhIHN0YWJsZSBiYWNrcG9y
dCBvZiBhbg0KPiBpbmNvbnNlcXVlbnRhbCBwYXJhbWV0ZXIgcmVuYW1lLg0KDQpZZWFoIGl0J3Mg
YSBmYWlyIHBvaW50LiBBbnl3YXkgbm90IGEgYmxvY2tlciBmcm9tIG1lLg0KDQotU3R1YXJ0DQoN
Cj4gDQo+IEJSLA0KPiBKYW5pLg0KPiANCj4gDQo+ID4gDQo+ID4gT3RoZXJ3aXNlIHRoZSBjaGFu
Z2UgbG9va3MgZ29vZCBJIGFncmVlOg0KPiA+IFJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8
c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWlj
aGFsIFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4g
PiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4NCj4gPiA+IC0tLQ0K
PiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ2d0dC5oIHwgMiArLQ0KPiA+ID4gwqAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+IA0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9nZ3R0LmgNCj4gPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2dndHQuaA0KPiA+ID4gaW5kZXggYzg2NGNjOTc1YTY5Li5mMGFjN2Vj
MDUwMmEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ2d0dC5oDQo+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ2d0dC5oDQo+ID4gPiBAQCAtMTUsNyAr
MTUsNyBAQCBzdHJ1Y3QgZHJtX2V4ZWM7DQo+ID4gPiDCoA0KPiA+ID4gwqBzdHJ1Y3QgeGVfZ2d0
dCAqeGVfZ2d0dF9hbGxvYyhzdHJ1Y3QgeGVfdGlsZSAqdGlsZSk7DQo+ID4gPiDCoGludCB4ZV9n
Z3R0X2luaXRfZWFybHkoc3RydWN0IHhlX2dndHQgKmdndHQpOw0KPiA+ID4gLWludCB4ZV9nZ3R0
X2luaXRfa3VuaXQoc3RydWN0IHhlX2dndHQgKmdndHQsIHUzMiByZXNlcnZlZCwgdTMyDQo+ID4g
PiBzaXplKTsNCj4gPiA+ICtpbnQgeGVfZ2d0dF9pbml0X2t1bml0KHN0cnVjdCB4ZV9nZ3R0ICpn
Z3R0LCB1MzIgc3RhcnQsIHUzMg0KPiA+ID4gc2l6ZSk7DQo+ID4gPiDCoGludCB4ZV9nZ3R0X2lu
aXQoc3RydWN0IHhlX2dndHQgKmdndHQpOw0KPiA+ID4gwqANCj4gPiA+IMKgdm9pZCB4ZV9nZ3R0
X3NoaWZ0X25vZGVzKHN0cnVjdCB4ZV9nZ3R0ICpnZ3R0LCB1NjQgbmV3X2Jhc2UpOw0KPiA+IA0K
PiANCg0K
