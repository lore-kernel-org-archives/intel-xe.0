Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19B2C61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 09:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF25310E495;
	Wed,  2 Sep 2026 09:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbRalQlS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860D710E1CC;
 Wed,  2 Sep 2026 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788342589; x=1819878589;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=D0iiv5e0d8Z3js3wzQbvsH+68eMnR4cfHPay1fMwq3c=;
 b=jbRalQlS6TNQkABEFfw34ciFJWG4ye4FZBpCjiZHcs9hPJQM+Awo3fO5
 Q4E1bFAvfCkt1oJwhgyh5NTAF+OLK3XVoTi/X88zMpA1YdmL/04Nb6jbf
 BYTLB+Ximr0hZD7dsahHAa+tN1QRy3jFQHyDsKs8cr9FXonv/XRXLKivf
 Hw5K/HlTysAXPPpdQFcOF1KgXkG608+XKlSrYnHdWFwvLp/gqqnNgGo/z
 n+wN/Aa+Lf18QLDljA7cisgP0EtdbG9mUBSJ6gzGn+sFElNRerzIH+QPg
 SlxCJjDYlFZbAIYEHPAX3yaiSaShPEee3jwbdz+/L3/8/Lz8m/kiqUZNZ g==;
X-CSE-ConnectionGUID: QyS6W9vJTM6Eagg0SFSJbg==
X-CSE-MsgGUID: rumx1BxHRHKrKzqZwc7+DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88721412"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88721412"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:49:49 -0700
X-CSE-ConnectionGUID: N1B37NZORj++f71Awv6d8Q==
X-CSE-MsgGUID: HThOYmhhRrWwD3owgBy7Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="266126983"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:49:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 02:49:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 02:49:48 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 02:49:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYTNgItvioMuZpcUR5uHgKpsnpZsOaWFHPAsXxQR84X/lk2KF6epVv2bEErGpoKBBrfmDg+BH7DB7Wsbb+6bSmizbvvhQvB/7MORwwVXUUf0AHPl8e1DF4YADjshiNNAm9oV4jG5iYAw+a0qUcolxkQ/YjYWfDmO8Myq42ZLCIuPlX6Z9pKZ396jjmi3epGsQ4I4gFFwLAv63AehhPXaangKuNCbujsAOEEvukPX+vCwpbbcABKi7sWVRawBKtvTUmbofnVo01UchmNK7NyYW9gzSV0NZAp8w8HqrAUdM/NUXaMl0VT+6hZd7CU46CVVuHOBjjnGa1dEDlaAZ3d1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0iiv5e0d8Z3js3wzQbvsH+68eMnR4cfHPay1fMwq3c=;
 b=E+ttb54b6di1Phbz+2M8h4MGlc9/F5qooAqoK1/arVvTKUwXhU62HQMSolYG+a4i571d4ZeNtau2txYmUZvT0ay/jY+fZIGSkMYIXT3o0v9jLwK8j/PfuStAmKinn/TFN+T5IlCccBn9AwYH4/zonfruwvRQRkANYpsw+N2ioqOPqAxbuwvdDsfhzu21zV8/zNwTUOa8hFK0CvWhILP3v0ujm/2CuJnQHYldcC65oHPwFS/APuspikmA1BF6CRa0Ig1Zb8N4oxm96MnV2leKG880F4F7KkfD69+ZqOc4umcsr1oQqdu9tETda3AF42UsAQqhhiUEHHJtX/CdAn+gHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA3PR11MB8895.namprd11.prod.outlook.com (2603:10b6:208:579::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:49:44 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 09:49:44 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna, 
 Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v5 12/15] drm/i915/alpm: Replace is_edp() with
 alpm_is_possible()
Thread-Topic: [PATCH v5 12/15] drm/i915/alpm: Replace is_edp() with
 alpm_is_possible()
Thread-Index: AQHdNFm6GLUykyiwR06MenDRParPXba7GA0A
Date: Wed, 2 Sep 2026 09:49:44 +0000
Message-ID: <1fcd07b004289a4263428763806a6f5b79439669.camel@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-13-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-13-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA3PR11MB8895:EE_
x-ms-office365-filtering-correlation-id: 96c380f9-67f1-4c85-4d16-08df08d7849a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|38070700021|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: x1+p31qXY3mgOPb2eDw6FKyVCBLg9khloRZaUHk/ODM0A07tVWda4Ky1dx7pVcbkFnfyYvaopuUVL7jjt8jUo3qEPFdJT8sdygzupZHF3/i+k1R5o8HH7RevDIdXxWvGoMrGH9tl5ivyGzHLs77WGIZuXnKwO40QEd0ZOfei+Z53aS/IKOCLEnIhCWQZ7Pi97CHE85X+H3obCC6nhVZtE1+4cBnamX8EU3mD7bqZNiRf5p6GykNsYs2MmBjHV/x6uAByqdQ4q/ourIb11MbeswMMfNuHHeZaok/3PX7W8I7IV9Tyw/jjRtW2pXZ2iUH7brCMipcOFYimqkzPSJGsHECsEP2yUZwTjoIbtrNWoRbVy2knA307WC6JxjJwcr63fBZpDuNVMYUAc4XVzCfteNo8KfS8feT+LxyiPaHZLvhh9vQDmt4vRB6Cv6UmvglVL/baSKIbzMWKm+ZigmBU87RdD2bZGXReh7J5oiSOs7ebisFezVfl5rn6hINFtGR1+8PgDAYYMPd4nVuufku+7P8+vYqWxhLt+rgOmw/AmcAZBnFciF/uZ4K/gO777xclA3awWx25yEqqLMQ5WrJbMUHL9n48s4w6DtVTOHcRYXN5Az8S0yzyuurnjyyKZQlDMi5x0gpVcPA2sdU+7mR8eQfo9wF/r7fQj+RLvPUGNmOMALW0l2eYo+1DDHeyqA3+x3YqqYK79kWZiGi3mOd7bF8Y0VAzBx0nMLjnuXHhkO8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUVDUHRzYmI3QTVRSTNTZUFtVi9oNllyNHFlV3ZDRVE4U3ZLOVgvQ3Nwa3or?=
 =?utf-8?B?MVJCRE9rV2FPT0dUZmRLQmluMFB3bVUwaGVOWmduNzVhZEhBUkdBYU9lTW9U?=
 =?utf-8?B?Z0tzbmlzUjlpTWxVdlB4S1pLdzNtRHJjRFZGczcwQzBobHl1cmZ5dENielJl?=
 =?utf-8?B?ZVd6cHNFMDNVQzV6b0dSS2lNZ0c3OERSU0l1VXk2ei9GWGQvd25oWG43NjA2?=
 =?utf-8?B?K0xiUERkUUZXSUdCQTlBL0xUZkJrOTZrdVBZdWZDZ0lwT21oUFZGU1MyR0d3?=
 =?utf-8?B?MXhaRWpiL013RFk3U3AvS3pZVHFtU3NkTE5EZEFCeGlRL3hDVTVrUnVrbnUv?=
 =?utf-8?B?Q3F1TVVxd0gvVnpDWk5LT2U1OEwzVHFxM3VReGpoM2svNDVHdTY4N3RXS3dM?=
 =?utf-8?B?aHlNQzJTOHl4ZE9Vd3hjck1Xd05LMUNmc0FqaDlNcXVmOFF4VW1SMWhGcjZR?=
 =?utf-8?B?OTJ0NXFXelYzMjNqdXNjTEVzYWNpcWdSRlRUU21WK1lLZWpua3l6UWNyV1hm?=
 =?utf-8?B?Rm01YndRREFvQ2ZDYVRYSVpqRWM0MkNsTXFCVVVjOC9UWkRPT0duc3Y1bjJZ?=
 =?utf-8?B?TUptODJVc2k4cVBjdWIwRDcyNTUxT0FLbDJSVWJlcE5qRjdnSWJjNXhTamtj?=
 =?utf-8?B?ZjVBK0xvaWdQd3dsL25Ka1JDeDByZ25paTN5ZnBMbW4wSVI4NG1zOGVrMFZW?=
 =?utf-8?B?dXpMTkVsd3ovWGh5emw1V2E1NUJpR3dlUFhZd2ZINGNIaHYxRDB0QXNnT29j?=
 =?utf-8?B?amJXcDkxZlFwdzc3ZWVPcFY1U0dhQU5mSFMySC9GSkVzdjRsUC83dUhNUXVV?=
 =?utf-8?B?ZkZiMmR2STJINWVvcm1PU3JrTklRZzU3dWJkcit4UkM2T25VWWR3MEovWS9N?=
 =?utf-8?B?MjNJWUwzODhkUko2WklBY0JVZHZNQmwzTmVnbmI4dkV1cWhTYmJocGZhbDdi?=
 =?utf-8?B?S0ZxcmRmMjNUYy8rRENHTWtpbEtpZGFOdjVhdGVYOUdPVlB5RUlRM1hpWTd4?=
 =?utf-8?B?ZmhUN0VIajdlWHVwNjVoaDdUS0RYU2FxUkExOXlBOTllN0huNkozUlBpRXc2?=
 =?utf-8?B?TXJTc25tSG5VMWxEUXYyeG5MaXpuNkRHNjRwQVlMaVZFNi9ZSDhsa3Q5c01Z?=
 =?utf-8?B?V3RjRFpHS3ZOL0psdDNMbkNhc2JXNERvY3lSMHFuMlRlQlg3TktwZ0xYa25j?=
 =?utf-8?B?K2xNVTdUKzVGRTFHMHZ6RCswOFZhTERPcFplTmdWK2VXTFpLMGd0SjNpMnAv?=
 =?utf-8?B?Sm43dlhFYW1vK2tldm03YzhyeTVHNlNseXdVLzhOSldqVVU0andnOUdwUmlO?=
 =?utf-8?B?QkFFaFpPSHlVemVwTE1sdmFuL21pa0NGWVlmdU5VSTU0QzBxdWJhdDIwQ3JR?=
 =?utf-8?B?QWtzVG43ZHFxWDZFZ2pVRG90Ym54cTlxZVlXU0cvYmRsRnhEakozSXcrOEJO?=
 =?utf-8?B?ZFgwY1FWaUZSME81M0N4bmVuY1I0Nyt4ZDRUaHN0MUo4d243anREckVNRDFR?=
 =?utf-8?B?c2Q4YVU0T1R6YlRyM1VkRk1NZmNiMW9Zb05wMlJqNTdkWWpodCtzcjlvQ0tC?=
 =?utf-8?B?Q29pNmdBbGxFeG05ZDlkeVprNmtPSzhmckdEYlNWRVVtYWZkcjMzL3h2UkEv?=
 =?utf-8?B?N25nK1IwWHdKVDliZFdacGI1SGZwODN1WDZIa3NXV2ZzNGNVZ2FNMG9VdTNw?=
 =?utf-8?B?azhQM054UHZtbHB2V1pGbW8wUnNxUDJOd1NDS2VsYnQ1L0YzcVk0QmNNMTRv?=
 =?utf-8?B?WGVqdzdYelFnY0RlMVErOXJ2aSt5bU9nRm40SjI1TUlMTXo4c09ETldrbkVp?=
 =?utf-8?B?c2tIeTlJc3hCb0JjNkV6bDk2UXhlejhFelBuUnhSRDBTZW0rNHR5YmN1UWRi?=
 =?utf-8?B?OXA5WmxDWDFXVEJkM1pZUUZvSm15Uk1TNkZTSWJmcDJoMmIrV1NYbkhOditF?=
 =?utf-8?B?d0o4dWJVbktJOHhWSmhYZW1sWjQwRlFtd29kWVZQSkliWGVEMkRHQWdpT3Qv?=
 =?utf-8?B?TDlHTDRjNE5KcklwUUp0Mk4wNFc5cjRqTHF6U01IMkd2b3p1bFBHa3pMMllh?=
 =?utf-8?B?YmxtRE5VeURjUlFSeHV4Q2kybExycGJSWnRJKzJOeHVRUkkxSUQwOExJRnBC?=
 =?utf-8?B?SFo0YTlsaUpRT1M1VFV4UThES013eHhZQ2NkMVlJTVd4MkVnVWVNeWMydytk?=
 =?utf-8?B?U3dwTjBPc0d0OXIxSjk3OS9Xa1hMWEtldUppRTBRYjg2WHFwNC8rcllmTEEx?=
 =?utf-8?B?b2E0VExZRUNrWnNFUkNoMXArSWZFYzVLRm9uU0pPQVZBSDBveEZ6TGZsTnBK?=
 =?utf-8?B?L1IrcnJiUHpQY0daRURORERvY2l5aUVjOTAvMDBPaDgrUUtRUHhod0Q0TkxF?=
 =?utf-8?Q?6RugGQb/bHAe7uC8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA45BC9BF2578844A83A9847C2B413EE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: n03uLOJy5+IvWe7YPaqGrgb4Tw+tLhdyGNMljGdgA7voLSxUGZZPTM9MoTiNRcxyFg08geo7G+Nh/ujf4+cIk1nHk5YJUQTW4gt5Wss9aT8rYdJliy3dGkysyauT9q0PsMr4k0boEsCV67a63LkGQnpzJ0hL/PtY+FUUCmr9NLNK14KhOkdhvTJ3Mq6Oq8nbPGWTRZ80NzVhoPfoUxEhoVutShnXX+xocC6AiM9gj2i3MQql2jDvW2rUdLaWk6Wk0rTmmV+GXnWKS3AUlfQxkXOC7PKWHBfex808QUi6dg9ALPy6yJptj1OEnsP0DV5CXBykZ7NNuR2cUR9S/VPjdg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c380f9-67f1-4c85-4d16-08df08d7849a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 09:49:44.4978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3aw1pQzMgnJwlWA2js2j6Jx/UCytfmuVPnq5kMgNw6R4ioY5cbWznETLkAxeHyWtiwHuME8y0OvCQSFCAggdYIPlkxV1tIIokq2BMdujuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8895
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
PiBBZGQgYSBzZXBhcmF0ZSBhbHBtX2lzX3Bvc3NpYmxlKCkgd2hpY2ggd2lsbCBjaGVjayBmb3Ig
Ym90aCBlZHAgYW5kDQo+IGRwLg0KPiANCj4gQ2M6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9n
YW5kZXJAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNo
Lm1hbm5hQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9hbHBtLmMgfCAxNiArKysrKysrKysrKysrLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmggfMKgIDEgKw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+IGluZGV4IGQyM2YzYmRmMTMzOS4uZjNmNmY0
MGY5NjI0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2FscG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0u
Yw0KPiBAQCAtNzIsNiArNzIsMTYgQEAgdm9pZCBpbnRlbF9hbHBtX2luaXQoc3RydWN0IGludGVs
X2RwICppbnRlbF9kcCkNCj4gwqAJbXV0ZXhfaW5pdCgmaW50ZWxfZHAtPmFscG0ubG9jayk7DQo+
IMKgfQ0KPiDCoA0KPiArYm9vbCBpbnRlbF9hbHBtX2lzX3Bvc3NpYmxlKHN0cnVjdCBpbnRlbF9k
cCAqaW50ZWxfZHApDQo+ICt7DQo+ICsJc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0
b19pbnRlbF9kaXNwbGF5KGludGVsX2RwKTsNCj4gKw0KPiArCXJldHVybiAoRElTUExBWV9WRVIo
ZGlzcGxheSkgPj0gMTIgJiYgaW50ZWxfZHAtPmFscG1fZHBjZCkNCj4gfHwNCj4gKwkJKERJU1BM
QVlfVkVSKGRpc3BsYXkpID49IDM1ICYmDQoNCk5vdCBzdXJlIGlmIHlvdSBhcmUgZ29pbmcgdG8g
Zml4IHRoYXQgaW50ZWxfYWxwbV9zb3VyY2Vfc3VwcG9ydGVkLg0KTWF5YmUgdGhhdCBjb3VsZCBi
ZSByZXVzZWQgaGVyZT8gV2hlcmUgdGhhdCBkaXNwbGF5IHZlcnNpb24gMTIgaXMNCmNvbWluZyBm
cm9tPw0KDQpCUiwNCkpvdW5pIEjDtmdhbmRlcg0KDQoNCj4gKwkJaW50ZWxfZHAtDQo+ID5sdHRw
cl9jb21tb25fY2Fwc1tEUF9MVFRQUl9BTFBNX0NBUEFCSUxJVElFUyAtDQo+ICsJCQkJCcKgwqDC
oA0KPiBEUF9MVF9UVU5BQkxFX1BIWV9SRVBFQVRFUl9GSUVMRF9EQVRBX1NUUlVDVFVSRV9SRVZd
KTsNCj4gK30NCj4gKw0KPiDCoHN0YXRpYyBpbnQgZ2V0X3NpbGVuY2VfcGVyaW9kX3N5bWJvbHMo
Y29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNfc3RhdGUpDQo+IMKgew0KPiDC
oAlyZXR1cm4gU0lMRU5DRV9QRVJJT0RfVElNRSAqDQo+IGludGVsX2RwX2xpbmtfc3ltYm9sX2Ns
b2NrKGNydGNfc3RhdGUtPnBvcnRfY2xvY2spIC8NCj4gQEAgLTUxOSw3ICs1MjksNyBAQCB2b2lk
IGludGVsX2FscG1fbG9iZl9jb21wdXRlX2NvbmZpZyhzdHJ1Y3QNCj4gaW50ZWxfZHAgKmludGVs
X2RwLA0KPiDCoAlpZiAoaW50ZWxfZHAtPmFscG0uc2lua19hbHBtX2Vycm9yKQ0KPiDCoAkJcmV0
dXJuOw0KPiDCoA0KPiAtCWlmICghaW50ZWxfZHBfaXNfZWRwKGludGVsX2RwKSkNCj4gKwlpZiAo
IWludGVsX2FscG1faXNfcG9zc2libGUoaW50ZWxfZHApKQ0KPiDCoAkJcmV0dXJuOw0KPiDCoA0K
PiDCoAlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPCAyMCkNCj4gQEAgLTY4NSw3ICs2OTUsNyBA
QCB2b2lkIGludGVsX2FscG1fbG9iZl9kaXNhYmxlKGNvbnN0IHN0cnVjdA0KPiBpbnRlbF9jcnRj
X3N0YXRlICpuZXdfY3J0Y19zdGF0ZSkNCj4gwqANCj4gwqAJCWludGVsX2RwID0gZW5jX3RvX2lu
dGVsX2RwKGVuY29kZXIpOw0KPiDCoA0KPiAtCQlpZiAoIWludGVsX2RwX2lzX2VkcChpbnRlbF9k
cCkpDQo+ICsJCWlmICghaW50ZWxfYWxwbV9pc19wb3NzaWJsZShpbnRlbF9kcCkpDQo+IMKgCQkJ
Y29udGludWU7DQo+IMKgDQo+IMKgCQltdXRleF9sb2NrKCZpbnRlbF9kcC0+YWxwbS5sb2NrKTsN
Cj4gQEAgLTcyNiw3ICs3MzYsNyBAQCB2b2lkIGludGVsX2FscG1fbG9iZl9lbmFibGUoY29uc3Qg
c3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlKQ0KPiDCoA0KPiDCoAkJ
aW50ZWxfZHAgPSBlbmNfdG9faW50ZWxfZHAoZW5jb2Rlcik7DQo+IMKgDQo+IC0JCWlmIChpbnRl
bF9kcF9pc19lZHAoaW50ZWxfZHApKSB7DQo+ICsJCWlmIChpbnRlbF9hbHBtX2lzX3Bvc3NpYmxl
KGludGVsX2RwKSkgew0KPiDCoAkJCWludGVsX2FscG1fZW5hYmxlX3NpbmsoaW50ZWxfZHAsDQo+
IG5ld19jcnRjX3N0YXRlKTsNCj4gwqAJCQlpbnRlbF9hbHBtX2NvbmZpZ3VyZShpbnRlbF9kcCwN
Cj4gbmV3X2NydGNfc3RhdGUpOw0KPiDCoAkJfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2FscG0uaA0KPiBpbmRleCA3MjgwODY1ZWQ1ZjAuLmIwZjZlMmE5ZWVkZSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4gQEAg
LTE4LDYgKzE4LDcgQEAgc3RydWN0IGludGVsX2NydGM7DQo+IMKgYm9vbCBpbnRlbF9hbHBtX3Nv
dXJjZV9zdXBwb3J0ZWQoc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yKTsNCj4gwqB2
b2lkIGludGVsX2FscG1faW5pdF9kcGNkKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApOw0KPiDC
oHZvaWQgaW50ZWxfYWxwbV9pbml0KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApOw0KPiArYm9v
bCBpbnRlbF9hbHBtX2lzX3Bvc3NpYmxlKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApOw0KPiDC
oGJvb2wgaW50ZWxfYWxwbV9jb21wdXRlX3BhcmFtcyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2Rw
LA0KPiDCoAkJCcKgwqDCoMKgwqDCoCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0
ZSk7DQo+IMKgdm9pZCBpbnRlbF9hbHBtX2xvYmZfY29tcHV0ZV9jb25maWcoc3RydWN0IGludGVs
X2RwICppbnRlbF9kcCwNCg0K
