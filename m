Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C33C9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 07:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FC310E586;
	Fri, 25 Sep 2026 07:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L23neqzi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B983210E586;
 Fri, 25 Sep 2026 07:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790319636; x=1821855636;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cdiMMyqPynwSqHIq5TeKgoKekxo7U9vOGddkaJUi5ps=;
 b=L23neqziqZ7LDcxzQVhY9hER6UJ9Rk04D258zjV3SOmlJ0o/Dn9S3Rmv
 kd6DdQXuaCPwrnsba0MaRxXjFjBw3JDPKbxFNVh7XtTtOKrBi3zMTEGe5
 6i2Ig5peBAoTbJbYHgA0hPAITaQgkRNxL6mJ7y6pL/oCK9hvvM5tCiBoO
 u3Ke6psIY4StO6iAaf7ZqngIuM9O8AHoIzjXf/7Ow+gGOHM6p3Cq/Fvr1
 bYJJDKToiyubvsp/Zdu1+LMjFeFTrIl8ufWrKZtvvsztiD6kBrVofGjEy
 3nzoboFkQ8f8xPSiKB9NeAVIC7cE/aaaMmsfl0YxZp3phTQGXaTgvnMnt Q==;
X-CSE-ConnectionGUID: OJIAU74sRDG2/LC7dkEG2A==
X-CSE-MsgGUID: x2hhAA/XQgGwMmoGl8ufbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="100434467"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="100434467"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 00:00:35 -0700
X-CSE-ConnectionGUID: GTxKszMlQx258W3d2UPocQ==
X-CSE-MsgGUID: DhZRMl9kRieS+F9whND3aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="272834536"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 00:00:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:00:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 00:00:34 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 00:00:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSQVIwvyVtC3sm6FOwViM7vB38xx5BYBFTDBoE+NAqKhyrLmTF8bcWJ82E/tk89rkDzA2ooBgKmw+TAhlqypMtFhoWyArzdNeeRdC62TIb1xjcF6+RLsIpbBUAsZ99G4Vf/YWm0C6MvRbIld0CHJqMhhgATOyERgiKYRZ1UsrpY+x9vjIs0KN2Ko2/azCQJ6Dih6oeuFj7HMTE+mCqC6vzh1E8MQZrzIGFIj1an7XXBvTzVPDjgGnMCjNlNo9Q9FWhKSUKG5NbnaXAL3T2cGP4JAMrP9qOjPmUxLyd7OGMnESNNZIdmUBGw5YuOIC9VDhyMNLkClakQK2di1k5jnMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdiMMyqPynwSqHIq5TeKgoKekxo7U9vOGddkaJUi5ps=;
 b=h2jeeyjjNCi4MNync9s9jjXMV1eDG7EHREoiQhPBJGnjJy6EGyiAGYtgbyY8XSgDMqs2FI2VvV87xkTi5umNQkwnmVhTXekob0zDwSbLPTbG/E620eJJZdbvPYxC4RpoWgAVc6juCg7pPEKwoscATBLdHKfKOKPD6r0Vt583qJ+7EBeLpZfuNnWHjB8rb2QwepyPd7a1vGnGTEkt7ISnBquHz45L6zIsiLWf+AYlrFwa0BBt9elEQ1jWcepWg6o+6O74/idd4AjaDui4OywhnOkoFvAUAGgxv6Sfg4YTQfffgE2so+7n9cguNWZ28aseGQ6VeEyQ3V+9vvbTpT1RFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by IA1PR11MB8832.namprd11.prod.outlook.com
 (2603:10b6:208:59a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Fri, 25 Sep
 2026 07:00:32 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e%7]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 07:00:32 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/psr: Take the selective fetch area from pipe_src
Thread-Topic: [PATCH] drm/i915/psr: Take the selective fetch area from pipe_src
Thread-Index: AQHdS1MR+ebrKXn3cUuT5CTc5n0U1bbdfFaAgAFjv1A=
Date: Fri, 25 Sep 2026 07:00:32 +0000
Message-ID: <DS4PPF69154114F3D2899CD5AB146BADC23EF802@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260923115941.746934-1-mika.kahola@intel.com>
 <20260923115941.746934-3-mika.kahola@intel.com>
 <3004b9170f6165076cf9b2b024d6ad32853db56d.camel@intel.com>
In-Reply-To: <3004b9170f6165076cf9b2b024d6ad32853db56d.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|IA1PR11MB8832:EE_
x-ms-office365-filtering-correlation-id: 1a839c22-e361-4039-d4c8-08df1ad2b110
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|23010399003|11063799006|56012099006|4143699003|10067099003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: LebjdNUGp4YQPwNQMrmaK7HDSsT0MYeTWJw0qV8tVRWk8v0mt5OBzmkhY6woA6pnhp1z6mGpY4zlKpKf+bmF7MEFgeun9zL29lZVrrC8aFqq5WWuNoZ5pEZdXtZwsPUeam0qn2BCt/R1MbAUmghPje1rpX794FuwALWsBCgXIbMZoiXBkcLyJVczI1oNDeMPfykGBB7zza1a+TDmK4vLjNeMw3+Xz2ZnqgrfwbKOksXcOXHEL/vjQyK4DHDnEjNf2NC1YTUXMe37JapCfUJlo9RkPKzCWfoZZYGZAV4gNjVhgIcooFAOflheqj2jbggDgZ95MJcff6eo186qBNG+qAUXGHn4defej/nfTsnulEBgC7d1B6FnJCOK7F//AV2E4FPBpP6EHl2KGFskjPIJQct9Xgdhl+mzc57C6n3Lc+xLBI8JlLZXQjXW4SGzIRDmX0+bPc7AQM7C7UH25stjCBDTgFe9B2rUNbhw3Bbgl39VEbhHQ//eY1DsHmwB4FC/y4j4iBil/mqwVK6/6XwmRA6XiNZKxBcYg/5e6PhwEUp5GGql7Fsd/EVKCDAeIz+ySj+XFABdgoZF9NxSYbXO5Lo2kpgRMPZbp0f5Ake8BY16+DGm3M8DYg87LDs7scTYOG4APpshKAuvxpAWdtGNJT+JrTThhRBzD1CI7x3eh+K6Zc6PqKflUGVLuLejpVRk26jnHvDyOQTJBbtQkSHtm2uB7z39TR4pSTeDe/+KV5g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(38070700021)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGdpcDNSejkyREJ3cGdHZzVZSkhmckdoNG1yU3NIVlhZYlVWY05adVJNSUdv?=
 =?utf-8?B?bElsd0JESFdKQ2tBWDdQZ3FCbTFYUmVYYmFua3hndWoxZ1RxR0tIdXdsdEwr?=
 =?utf-8?B?MmNCSCtHU3ZLenY2UW1PZWRTTUNZQTZSdEtKZnV1OFdsczA0N3BaOFFldDRC?=
 =?utf-8?B?T01NOEFpQWV5MWdXMlF3SlJzeTBBRjBnMnNTbmsyYVZHZ2JOdmV6U0x2ZFM5?=
 =?utf-8?B?Yzd3N3lCZ2ZTMHlWYjJQREtUVkFOMjFreXRHRXRqMW5zeW5SZG9xNmlmVk90?=
 =?utf-8?B?RlRMUURsTGdVQW8wd3NkalEvOU9RSHNXN1pBTFMzWFk2SDlMSE4xbmZpd2pv?=
 =?utf-8?B?Q3Z4MDhqblk0eUdCMExaeHY1UHdWamRLZWc2VUhSMjdLa29ML2tCcS9qUlR1?=
 =?utf-8?B?MHJjU0lkYjNMekQ1cUpKcGhYWGRWa2l6MlZ4M0wzQ1RETUF6WVk0eE1Fc2I5?=
 =?utf-8?B?cnJ5YjVtbEJtZEkyVHZENytTVFlGaHY1ZW9Hd3Y1N3VoS29XTFA5S3pHZjJB?=
 =?utf-8?B?OE9BNk56RGhaaDFGM2dscWlaSTI3eHBLeC9aODJsYmpvRnM2T0dTcHNMbHNF?=
 =?utf-8?B?cjVLZ2pVNU9tdFYxUndmRVVxOWp4MnRVUHd2THArOFk5ZEZsenNjTWp2TDBH?=
 =?utf-8?B?M1ZrQlN2eEhVWGkyQi9kK1dBRjhuVXJQdEUycVVVcmtzL2JVS0tpTDJtODhE?=
 =?utf-8?B?ZHRjc2g5SDBtMTdzaisvTnVhbGMwR2NxZktXbjRadEZaaVJTT2M5RGljOHdU?=
 =?utf-8?B?MVh6bGtLemlEZ3VvbHh5eWlwTEJuajRRTjM0LzhGSWE1SXVwbSt1c1pHeHNW?=
 =?utf-8?B?YWJTY3NZa05QNmtRWEpKazdnTGRyNVBQeTlBZ0Q5K3RWY1RxVWJpQXpXMjVS?=
 =?utf-8?B?RXFMZzVQaWo5N01iQzVycUFMbnhaelhPaHdaS0x4M1lXWE5Wd1pqVnNwOWNL?=
 =?utf-8?B?OVZBMklUSEhFVWFVWGxSYzRuL0N3UFI2V3g2RFhhMmFTZzNzUlc3YlR1MVJz?=
 =?utf-8?B?cHUrSHFiQWI1OHB4RjIxclQyaHlzK053eTc2QzJaWEN1ZFgwbVFjbVBpNUUy?=
 =?utf-8?B?Z1gwc05CVUdQVlF2QVRUNFpHa0xOM3JtWCtuM054c1ZOYjZzZ3lyMGRmbmdC?=
 =?utf-8?B?STVXbEgvVGQrS0R2Tmhwa1hvZU5zQXQ0aUk0ZnFUMWdodFRTWFprYlZUVUk5?=
 =?utf-8?B?bDVpWVY5bml4cVNrWkRjT05UQ1RxcWdGRWNGODNSalkzYlVUN0xxeTR4MFpo?=
 =?utf-8?B?K3V2bGJVWmdUWmdkYUh1dFAvTSthZ2xzai91WkRINkQ1Q1h3U3hKa0VLVjBz?=
 =?utf-8?B?Vk5qK09qUHg4REtvSzhMYlRsaElUL2ZSQ1d0OUxPMlVuYTZ6NWlDWFhxRlVv?=
 =?utf-8?B?Q24yYmVBNzl1NWpVMWpGVDRWVzlHNmJPRDVwY0hCbHVVQVI1dFlVV2NoaG1E?=
 =?utf-8?B?UEMvYWFwUDhvQ0Fuc1MrR1g4cm5nRVJZZnI3QUtCdXRCbENUWnpIdlAzaHg4?=
 =?utf-8?B?eUNMZGE1Yit3TVhvTTNrUGZiMUNHQUU4SnhNakxiMGVDcVhwOE9xRUVXVzZh?=
 =?utf-8?B?Q2xkUjJnWlFkbW9XWVlvZFdWeHIvRnhpL2J0VC9GUERDQ3A5M0pJSitFaFh5?=
 =?utf-8?B?U0pldFdIWGhvWXI2RFRYVHluM3RCUGRudFBxa1p6OVVoSG02bkczemZockdr?=
 =?utf-8?B?dmtpRC90bW9adFFjTDgrdVZuVnRBMExRWlFZUEV4NmVEQlJkNHViT2tVaFdX?=
 =?utf-8?B?Ylk0QzMwK09XbHNvNDFvNVdZc0NHUG9xS3NSc1prTXpGR2ZkOWYyWFVOMmNR?=
 =?utf-8?B?cTJXK2lxejlXMkJvSkpBSFFyM2ZOcGJJbWxXeDlxUzV6U0NubU0zaENNQ1Nu?=
 =?utf-8?B?VTNEeDVUaWpDMVJERndJaVI3cTVGY1loVWxYM3BIUW40dUVYU0VIU2hOU2Zh?=
 =?utf-8?B?ell4clF0eTludlBRbXNmbGNEUDM1N05HemhoYno0aXhkbGMrSGJjYkpoOHF4?=
 =?utf-8?B?eUZyOGg1TndWNnFZSVdqL3NBcEVXZ2V5RGxBTkhsUy9naUJuSVFUNVo4bU0v?=
 =?utf-8?B?K3FXU2tPblVOTnZYMXJMbHgvSnFUY2RJLzdqOFNkZEhMMlFZeUpiZXZIc0xH?=
 =?utf-8?B?U2l2M3Y4RnIyRGMyVWdBT3ZBTlYzeVJZN0djdVBGUVpPdEgyZERPSFM4RUQ1?=
 =?utf-8?B?VWxHUGRjZHNTczE4b2lNdllFcVFqV3pkb2ZQd1VuL1BlVHlKcVJrSDlkaGpo?=
 =?utf-8?B?M2J4S1k5T0hZQ0gxWDBSbWJpMk1rdUxJMFFlbUhCN1VyeVFFWGg4UG9GazlK?=
 =?utf-8?B?eUxQdkwyVXFncDIrSHVTQ2lUY28zeHZjaU9ISEdwUDJZRVowa016VjFMZXRP?=
 =?utf-8?Q?aySPSO69ow9BHH/WlcZkOoXE7etNOul4WOcpZQ7Hzzv5P?=
x-ms-exchange-antispam-messagedata-1: fd4LE/WPkWk/mg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: c7PMoRBRD1t8NAMZ9T0if/tM25uc6Kh4JwxeoHBq1ZGUpKVpmALGlkEzzxsLlQ6/RlD9HxXYv+Muncpd+Nzq3FnPH6E1gtzSTnLr3fFHOkp1fNla9e4t1wRgVDFB/96oYG4d9pOnLFv+aqMzOeZTZVudSuhUVnwlKPePvkuVipaQ2/JE02tlzJGDn3cIBeF1aaqEmoQrzD+UseSQWDGJvlSYyZstsKqevLGeBQfSeMq9szM3G3JhvXMd1yAxKNYnrdE8Ffmqhy9AVG/B3ngk/VwUS0HkN+QSP9hSBbn96O+/uCnEIqbMTj76Rm5h5qEP89OejWZT64MFpRIS7VwIBQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a839c22-e361-4039-d4c8-08df1ad2b110
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 07:00:32.5837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lme7+eC6snjmv6ysWJwOs9v9SEmtxCTk8TjmDi3soS+roXuQsZuh4lWpK6khG4wE2Pa0yYDOnD8I/kFutAtPkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8832
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIb2dhbmRlciwgSm91bmkgPGpv
dW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIDI0IFNlcHRlbWJlciAy
MDI2IDEyLjQ2DQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEthaG9sYSwg
TWlrYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPjsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vaTkxNS9wc3I6IFRha2UgdGhlIHNlbGVj
dGl2ZSBmZXRjaCBhcmVhIGZyb20gcGlwZV9zcmMNCj4gDQo+IE9uIFdlZCwgMjAyNi0wOS0yMyBh
dCAxMTo1OSArMDAwMCwgTWlrYSBLYWhvbGEgd3JvdGU6DQo+ID4gVGhlIGFkanVzdGVkIG1vZGUg
c3BhbnMgYWxsIHRoZSBqb2luZWQgcGlwZXMsIHNvIGl0IGlzIHRoZSB3cm9uZw0KPiA+IHJlZmVy
ZW5jZSBmb3IgYSBwZXItcGlwZSBhcmVhLiBwaXBlX3NyYyBpcyB0aGlzIHBpcGUncyBvd24gc2hh
cmUuDQo+ID4NCj4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZSwgdGhlIHR3byBhcmUgdGhlIHNhbWUg
d2l0aG91dCBhIGpvaW5lci4NCj4gPg0KPiA+IEFzc2lzdGVkLWJ5OiBDb3BpbG90OmNsYXVkZS1v
cHVzLTUNCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9w
c3IuYyB8IDQgKystLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX3Bzci5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX3Bzci5jDQo+ID4gaW5kZXggNzYyNjBjZWI0OWNiLi5jMTk5NGRhMzg1NjcgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiBAQCAtMjkx
Miw4ICsyOTEyLDggQEAgaW50IGludGVsX3BzcjJfc2VsX2ZldGNoX3VwZGF0ZShzdHJ1Y3QNCj4g
PiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiA+IMKgCXN0cnVjdCBkcm1fcmVjdCBkaXNw
bGF5X2FyZWEgPSB7DQo+ID4gwqAJCS54MSA9IDAsDQo+ID4gwqAJCS55MSA9IDAsDQo+ID4gLQkJ
LngyID0gY3J0Y19zdGF0ZS0+aHcuYWRqdXN0ZWRfbW9kZS5jcnRjX2hkaXNwbGF5LA0KPiA+IC0J
CS55MiA9IGNydGNfc3RhdGUtPmh3LmFkanVzdGVkX21vZGUuY3J0Y192ZGlzcGxheSwNCj4gPiAr
CQkueDIgPSBkcm1fcmVjdF93aWR0aCgmY3J0Y19zdGF0ZS0+cGlwZV9zcmMpLA0KPiA+ICsJCS55
MiA9IGRybV9yZWN0X2hlaWdodCgmY3J0Y19zdGF0ZS0+cGlwZV9zcmMpLA0KPiANCj4gSSB0aGlu
ayB5b3Ugc2hvdWxkIHJhdGhlciB1c2UgY3J0Y19zdGF0ZS0+aHcucGlwZV9tb2RlPyBBbHRvdWdo
dA0KPiBzZWxlY3RpdmUgdXBkYXRlIGlzIG5vdCBzdXBwb3J0ZWQgd2l0aCBwaXBlIHNjYWxpbmcu
DQoNClllcywgYm90aCB3aWxsIGVuZCB1cCB0aGUgc2FtZSBvdXRjb21lIGJ1dCBJIGd1ZXNzcyBo
dy5waXBlX21vZGUgaXMgY2xvc2VyIHRvIHRyYW5zY29kZXIgbGV2ZWwgc28gSSBjYW4gc3dpdGNo
IHRvIHVzZSB0aGF0IGluc3RlYWQuDQoNClRoYW5rcyENCg0KLU1pa2EtDQoNCj4gDQo+IEJSLA0K
PiBKb3VuaSBIw7ZnYW5kZXINCj4gDQo+ID4gwqAJfTsNCj4gPiDCoAlib29sIGZ1bGxfdXBkYXRl
ID0gZmFsc2UsIHN1X2FyZWFfY2hhbmdlZDsNCj4gPiDCoAlpbnQgaSwgcmV0Ow0KDQo=
