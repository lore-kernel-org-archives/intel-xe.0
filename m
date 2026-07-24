Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89163C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 10:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405F710F34F;
	Fri, 24 Jul 2026 10:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TuijhxXA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FED10F35C;
 Fri, 24 Jul 2026 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784888545; x=1816424545;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x+T43DuGIVKdRBiRIdoGt7KkNUkLZ1EY18ZoWFXNMFs=;
 b=TuijhxXAjuNohxJDywzfb2j0wAJA0N8SQxyzoWNmIyGz8gMjywMTdMqZ
 ljb6FxEFEFq0h1pfd3jKqIGgm3E6lQ90TPAG0K/IVyAVxXih3i4hiDDSt
 j/r+43k7ekIgREBkmmNoOk3LovLx747ANIDLPWiClUJUrFNFQd7dKZwnQ
 FWvYs50H+F4K4rMEPPEXV5WVUa+D0KFqAdD2pgmALREjy4kc+EgRYIYWq
 o9Y98g1a+drWULt40CaI0IwtLSCI17lRs7wVUEdApi/zalZeNu07sZ/Ui
 w96ouniEHo6IiGsYo8NJFVPCvvrISDoXWnCb4HdvBTYwu8BW7Gs3ga7AG w==;
X-CSE-ConnectionGUID: w8//Hq/sSzCGLQcWU3KvPA==
X-CSE-MsgGUID: T1vDPdD4SJChyiVADv1Ogg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85316432"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="85316432"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 03:22:25 -0700
X-CSE-ConnectionGUID: 7DTjKQl6TJa/tWWlMx8x1w==
X-CSE-MsgGUID: tjyR5bsmSu+eVOVaMqbn/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="263655952"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 03:22:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 03:22:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 03:22:24 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 03:22:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgcKY9uLwd+nS4R+NqdU/DKJrTGG1XZGu0RCl/2elnzcdYQHLh9mEh7lWGRPURsGo9vu3oBDHApo09EXwoOhc3Kygs3ihO7vDQaA6GeTLeHTrFiYvHuCzfKCXeqEH0rqT3/CcUgCP6ysap7WQls8Qdsa7nPyQRpajf6RFXFauzsaJ3qFUsCEfhaoBxREAsruA2mBa3/17DvC3KYxpQfJyCJqFIdEC0ACc6CydCkepFNbLgVyPK0/lnVnlJpSiGPbGWgrKc6kP4FT3VMbDRkwdnGXMld2pX+TiEBaQHxwtplcKlwjXUvDRYt0CZgGI3trpdrbxDDQpvtP8+mpQLarsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+T43DuGIVKdRBiRIdoGt7KkNUkLZ1EY18ZoWFXNMFs=;
 b=f2thLp3a+4hV7dcvob30Lqq2af8hcTdq8iA7NYMBTdSofGAFU0WPK7Ic3fUQY7ZeG/eR9g275g8k+b3GJcs+YAs3gdfi+gPS9mezHFiSKpvhMXkNQaBcLI/exo4KbhA8n0aNZFNfh2UVzX6JWXgj3iXmimzX9Kr1ZXdWXEov5GQIbhs/CphOyCq+roP0EV717hUiG+7XHABuxZ1i03ZOxaQcteiR3ifZZUnxkVbi1jD0XRq3tEX10cCAJgi/ATYoAMzB9IdU3szbm+N6Xbv31RZPLNxnpGk8gvJKPIZYNCsIXp9us0GzxZReKnPg8C68ZsoggUvHd1FU8ZN9UOeFBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by DSVPR11MB9958.namprd11.prod.outlook.com (2603:10b6:8:3bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:22:21 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 10:22:20 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v6 1/9] drm/i915/vrr: Return from PSR2 compute config in
 case of CMRR enabled
Thread-Topic: [PATCH v6 1/9] drm/i915/vrr: Return from PSR2 compute config in
 case of CMRR enabled
Thread-Index: AQHdGZXJAXQcSF/bzk6YuJ0VXct1aLZ7Sb+AgAErSVA=
Date: Fri, 24 Jul 2026 10:22:20 +0000
Message-ID: <IA1PR11MB6348E7C75695B22DAB65C989B2CF2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260722043923.3241977-2-mitulkumar.ajitkumar.golani@intel.com>
 <1a0e6afe-56fb-4fd9-b618-eedc2fb0167a@intel.com>
In-Reply-To: <1a0e6afe-56fb-4fd9-b618-eedc2fb0167a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|DSVPR11MB9958:EE_
x-ms-office365-filtering-correlation-id: 07201807-e456-41f7-b880-08dee96d7209
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|38070700021|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: edR233vnWBBWIIOF3saAjMyYuKnU86ApRX5fdIPsN/XzPPQHntVOzpUrWyjucdZJGmU7PjeyqwBJ6tv9f/0IpKH1nDLZwc8mp5FSoKq9lZMGp4hq/py+rFFZ+pUGbfOFLlh1B3OvTLiqjzRaZo/znLXv6nYdigqQ0v7vBQowxt67yZe+OboCmq9J236AlTrcO8ak+n+ci3ZtZ5UuQqh+UVJvHo67+R8fzf6lUEoXF/b6USotdR3/RsuIeNC7oI5Qpmnw7KK4MTSvlS1EaNMxUcHL0c0WhS+ZxtxIJWRzD4njMx7gL04wNBrJ0BgYGAPFjAF2yEhzbWauj9ppRoX0elyCJnYCSTFHihOnd4/UswYdiQIY4wC6lW5bHIKSMWKkfhGPkrUzYAsZ/xpx38rcs+EWlPC6eXUudaOkJ64yw9LQ8mZA1QD2GU5GAeJI4CkE7hJR8sEVdREMCAx9fiBiq6+JZi2CG3jN/IG+MB9mCSXaMMuDWTVK3v2wWApZFuaIGc5GN9PdTBLA9qMhPAHDCIEZo46AzDmoHaJmT2nbJRuwnldrbwJiRQGw9Z22XsQXrwCkMckoh/VOz6SrXk5ha+/tG+EZfwD62mgZCRA7HN4R5YbVakvLZo2T8/b6vv18LR/9HIwcLG6MR5saPyq4ybjMv/Hyo50EponiUxr2Aj5ktKlpMtTXUb/PsRmqg/IYKWkaCK7M6Y427mrcnw83hp8rziZvyxHxHMByOLATxcI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXg5NlZaZFg5T1kwT2VxRVRhY2xITDdqeEpXNjRhbTB4S2JraFpnMnNDSXp5?=
 =?utf-8?B?OW1NQW1lc3Z5VnJUdHpWS2MzeFJJZHhqcnlhdy9wWDVGVnBsOTZmRndqTFUr?=
 =?utf-8?B?TTN3SEZHQ3RUTHRJYllXNWc2ek1Nbmt1ZHJHcHFiQmxkcjAzdWIyS3F0Zzhn?=
 =?utf-8?B?NGtuVjdlQlRnOCtJWkRoZ2l2UlE2TDJPS2FyWHBpandHN3lPendrd2dhNzlF?=
 =?utf-8?B?cWc0TUtVcEYzcXhFUlI0UVgxL0FMYmxQRzdHSGhrTkZUUDIyRmN5b2l2UldN?=
 =?utf-8?B?eUxPa0gwSy9hOCtyRUtSTE5ZMHJKeERkYTVOWEx0RUxwUnJ2ZmVsT2dvOFE1?=
 =?utf-8?B?eFZURWFHcnN0S1o5NWUyN29LSFhpejZycU4yOEg5WjNIOWJ6MzR5K3IwRnRv?=
 =?utf-8?B?NmNXckQwckVGYzBaRG1vTit5bjd5WjhRWWZkcEF6RUg5dkR0NmgvQU5na01V?=
 =?utf-8?B?K212Q2lCL0g0SHYzcHNuYjd4OFBzUGRjTVR0aHdpL1Ivd0JNV3RadEhaK0ZJ?=
 =?utf-8?B?M1Z3bDZZWlkyemZJSnJoMkZYem1vc3VoSGl1SjlVbkJpamppOEk0bExra2dj?=
 =?utf-8?B?b0ZtUzc4alBJOEU1WklKVHVldndOM0FYRTVZNlJRV1ppK3dBOG5VNVBOV1Yz?=
 =?utf-8?B?OUg1cnZyNTZNQ3lpMTVaczlraXlteFZxNDU4eGJhYjU5eDJGSmdTWnVhQlkx?=
 =?utf-8?B?OUFqZklCdFRkN0F4bThha2FiUGRBM2VKWXo1dktlMkc5bnQ2UlBRaGRndnUy?=
 =?utf-8?B?eCtCKzBiVHJtWGc1ZVlMR1orR2ROTlFaMXhlc1lNaFJ6M3YvcFRYVnhJTytB?=
 =?utf-8?B?a3NpSElJeG80Y1JlM3FrTWgvb2VUMnRXTG12ZU5qMkV4Ry9XcmVsMkZkeXN6?=
 =?utf-8?B?ZWhVMzQySlFhcE1XdGFiOWFmWTVITDl3eDU2Vy9MemRRSFFhSWFCSDFDTDRG?=
 =?utf-8?B?T2xxWTNxWkhMM09PY3JRQlVDNS9WVkFIT0I5bWE1aC96bFJ1RWMvZWZ0L28x?=
 =?utf-8?B?dlRiQjV4UnFtMDRiQy94a0ZZQUxNU1VKVVpHZGRvQndkRVNKOWtKazNJck9F?=
 =?utf-8?B?bDVZL2FCSGtrNmFGNXEyNnlLdzRuMi82T0N0Wmt5MzFlWUwrS3dOVzZkVGhV?=
 =?utf-8?B?eXNBb0ZRQmpTSXM0b0NVNXY0K0hGYkNFMU1Ya1Vtc1hObEQ1ZDlDYXd3NTEz?=
 =?utf-8?B?Nzl1bUdQZU4rUktTM0NqV3YvbVpyNU0wM2NoYmw4ZmVOVmg1eVJRN2RiT2g1?=
 =?utf-8?B?eExNekdxVW91MzYzcWVnL3poaEF2eGpwYzUrK1Z0cm93Zml1RGhJUlorT3N0?=
 =?utf-8?B?ZDB4WmRVelY1OE9NeGdBTFRjaC9GQW92YytQQW9UMTJ3NVpzcFFTTzFlSWJ6?=
 =?utf-8?B?TzBDaHUvam1FdUhuWUtoVzRhR3dJU2NEZjl2OUJXTHBZN0x6azVxL1BhaDZj?=
 =?utf-8?B?eUlkaGp3SVBZYVVzOHUvcWowNTM1MnJvSkZGczFrL0JLN003QkRlUVBaS0Zl?=
 =?utf-8?B?bXk3L1JWRzR2NFpsN3psNTYvWVNKaU9ySW9kdGdNZk5tdkl4cHdXZmIrVnBx?=
 =?utf-8?B?T3JYcHJkMXJsakc0bGkzQ3JiR05HWStWZzFhc1BzMmhsbVVYOGNhS29OYTNn?=
 =?utf-8?B?UGFiZHJBeEptTzBRUDN1TElyNVQ0ZVJ6TG9MUXZUNERZbHBiQytiMGpiVmRB?=
 =?utf-8?B?WnZkVmUvYWF3c2E0elE1TFdnakNrMk90SEJYM2F1ZUdueDJYUStDUGRyMFpT?=
 =?utf-8?B?K2dlK0xvc2FTSGNGazVGdG1pSFpXUzRjMmNZN0FZWWppN1FOU0VHL016cm1i?=
 =?utf-8?B?cklLVnJscVpXdG1NYklnQ00rbE9xaXVSSlcvaGJrQUNWWitJR3cyQ1JMNk5T?=
 =?utf-8?B?ZDNRV0E5dUl0SVdibHRRc1U5cDcvRlNVc0FMdHkrdlYzeDZCc0dtWDRjak1V?=
 =?utf-8?B?SXNQblY0aG1Fb0ZEM1dOamNrN3NNWHc4blM0cWNBRU40dDhYa09JRFI4Wmdx?=
 =?utf-8?B?aWxqVjFNaU5LK09abnhtR3ZrWVBXeWtmTGxKRmc3WFNmU3UwQzNKZXQrMk9T?=
 =?utf-8?B?cTNCMTdtelZac2pEVC9ibjNxN2VLU1BScHlkWm9mbDFxVnFIT05hdk5FdjRu?=
 =?utf-8?B?cUUxbzR0TjVmWFdZREM3QThBR1Q5Njhxa0JwK21mTzhka1d0TVBWT08zT3g1?=
 =?utf-8?B?WXJSenRBR0NRM1o1RnZ0N3JjN2tmeWw5SmltbHZXSUl5Vlk1bzZNYVhBTi9N?=
 =?utf-8?B?Vm1qeUlsSUpEWjNTVit0RFJXWEhPV296ZVFTZ2ZnY3dhK0VUS0l0TEZ6L1Z4?=
 =?utf-8?B?c3pSSjViQlF2QUFDVjJSRjYyL0N1OE44MVk2UkhVRlpmcDJiWUpueDhFYVlE?=
 =?utf-8?Q?u7uf5U2EWhx0rSxA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ku2owxv42ECO/cJ5NPRqvjybQ4A5qY7x3M97sakS1q5cDUIr9zymDjVqPSv0aacKvjjeNfOMuo/pDQwwMfR9pOeak79PmYod3FivqZ3p6/n3s7tkAlWMThs/ekBbQ/xEi6jpUda7vbf3URUkEJyyW0Li3G7LvfW7oYKqzTDXAPql8bbs45MwMoLAaYvIp/mlRJZjkhZ6h+ZwLCmAFyNKPTH2JRWmcj4lrXWS4m4fpbWzjkSfjC+xlwX7XKohVLaXMxBQuINIqt7XNihpWQnyv1OSeBYAM9m3zAh3kn5rWB+aHgFD6YlQf7t/VdO57xebMNDxLYKNSBY64YADKm0eoQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07201807-e456-41f7-b880-08dee96d7209
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 10:22:20.6869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cAlTEruC+bo+oH/5jUOzuHW2zHYQNSaQO3XretwWy/qaoVhi5kOjyLVKkdi+dvk1xrbYqCVtcoBizRO0U8kCZnHP6QEIWxlgU9tskgCyfg5hUpyciPEhz48ym3HuuGSk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9958
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9yYWgsIENoYWl0YW55
YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gU2VudDogMjMgSnVs
eSAyMDI2IDIxOjQ1DQo+IFRvOiBHb2xhbmksIE1pdHVsa3VtYXIgQWppdGt1bWFyIDxtaXR1bGt1
bWFyLmFqaXRrdW1hci5nb2xhbmlAaW50ZWwuY29tPjsNCj4gaW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTaGFua2Fy
LCBVbWEgPHVtYS5zaGFua2FyQGludGVsLmNvbT47DQo+IE5hdXRpeWFsLCBBbmtpdCBLIDxhbmtp
dC5rLm5hdXRpeWFsQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAxLzldIGRy
bS9pOTE1L3ZycjogUmV0dXJuIGZyb20gUFNSMiBjb21wdXRlIGNvbmZpZyBpbg0KPiBjYXNlIG9m
IENNUlIgZW5hYmxlZA0KPiANCj4gDQo+IA0KPiBPbiA3LzIyLzIwMjYgMTA6MDkgQU0sIE1pdHVs
IEdvbGFuaSB3cm90ZToNCj4gPiBDTVJSIGlzIG11dHVhbGx5IGV4Y2x1c2l2ZSB0byBQU1IyLCBk
byBub3QgZW5hYmxlIFBTUjIgd2hlbiBDTVJSIGlzDQo+ID4gZW5hYmxlZC4NCj4gPg0KPiA+IC0t
djI6DQo+ID4gLSBSZXN0cmljdCBzZWxlY3RpdmUgdXBkYXRlIGNvbmZpZyBjaGVjayAoQW5raXQp
DQo+ID4gLSBDb21taXQgbWVzc2FnZSBjaGFuZ2UNCj4gPg0KPiA+IC0tdjM6DQo+ID4gLSBDb21t
aXQgY2hhbmdlcw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWl0dWwgR29sYW5pIDxtaXR1bGt1
bWFyLmFqaXRrdW1hci5nb2xhbmlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYyB8IDYgKysrKysrDQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiA+IGluZGV4IDQwZTNkNzA5NTk5Ni4uNmE5MGRlZDVk
MWZhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
cHNyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5j
DQo+ID4gQEAgLTE1ODcsNiArMTU4NywxMiBAQCBzdGF0aWMgYm9vbCBpbnRlbF9zZWxfdXBkYXRl
X2NvbmZpZ192YWxpZChzdHJ1Y3QNCj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwNCj4g
PiAgIAlzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwID0gaW50ZWxfYXR0YWNoZWRfZHAoY29ubmVj
dG9yKTsNCj4gPiAgIAlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rp
c3BsYXkoaW50ZWxfZHApOw0KPiA+DQo+ID4gKwlpZiAoY3J0Y19zdGF0ZS0+Y21yci5lbmFibGUp
IHsNCj4gPiArCQlkcm1fZGJnX2ttcyhkaXNwbGF5LT5kcm0sDQo+ID4gKwkJCSAgICAiU2VsZWN0
aXZlIHVwZGF0ZSBjYW5ub3QgYmUgZW5hYmxlZCB3aGVuIENNUlIgaXMNCj4gZW5hYmxlZFxuIik7
DQo+ID4gKwkJZ290byB1bnN1cHBvcnRlZDsNCj4gPiArCX0NCj4gDQo+IFRoaXMgYWxzbyBkaXNh
YmxlcyBwYW5lbCByZXBsYXksIHBsZWFzZSBtYWtlIHN1cmUgdGhhdCB0aGlzIGlzIGRlc2lyZWQu
DQo+IElmIHNvLCBhZGQgaXQgaW4gY29tbWl0IG1lc3NhZ2UuDQoNClRoYW5rcyBmb3IgdGhlIHJl
dmlldywNCg0KVGhlIGNoZWNrIGlzIHBsYWNlZCBpbiBpbnRlbF9zZWxfdXBkYXRlX2NvbmZpZ192
YWxpZCgpLCB3aG9zZSByZXR1cm4gdmFsdWUgb25seSBmZWVkcyBoYXNfc2VsX3VwZGF0ZS4gaGFz
X3BhbmVsX3JlcGxheSBpcyBjb21wdXRlZCBpbmRlcGVuZGVudGx5IGJlZm9yZWhhbmQsIHNvIFBh
bmVsIFJlcGxheSBpcyBub3QgZGlzYWJsZWQsIG9ubHkgU2VsZWN0aXZlIFVwZGF0ZSAoUFNSMiBh
bmQgUGFuZWwgUmVwbGF5IFNlbGVjdGl2ZSBVcGRhdGUpIGlzLiANCg0KKiAgaGFzX3BzciAoYWxv
bmUpOgkJCQkJUFNSMQ0KICogIGhhc19wc3IgKyBoYXNfc2VsX3VwZGF0ZToJCQkJUFNSMg0KICog
IGhhc19wc3IgKyBoYXNfcGFuZWxfcmVwbGF5OgkJCQlQYW5lbCBSZXBsYXkNCiAqICBoYXNfcHNy
ICsgaGFzX3BhbmVsX3JlcGxheSArIGhhc19zZWxfdXBkYXRlOglQYW5lbCBSZXBsYXkgU2VsZWN0
aXZlIFVwZGF0ZQ0KDQoNClBlciB0aGUgbW9kZSB0YWJsZSBpbiBpbnRlbF9wc3IuYyBhdCBzdGFy
dCwgZGlzYWJsaW5nIGhhc19zZWxfdXBkYXRlIHdoZW4gQ01SUiBpcyBlbmFibGVkIHR1cm5zIG9m
ZiBjYXNlIDIgKFBTUjIpIGFuZCBjYXNlIDQgKFBhbmVsIFJlcGxheSBTVSksIHdoaWxlIFBTUjEg
YW5kIFBhbmVsIFJlcGxheSByZW1haW4gZnVuY3Rpb25hbC4gVGhpcyBpcyB0aGUgZGVzaXJlZCBi
ZWhhdmlvdXIgc2luY2UgQ01SUiBpcyBpbmNvbXBhdGlibGUgd2l0aCBzZWxlY3RpdmUgdXBkYXRl
Lg0KDQpBbHRob3VnaCB0aGlzIGlzIGV4cGxpY2l0bHkgY2FsbGVkIG91dCBhcyBwYXJ0IG9mIGNv
ZGUgY29tbWVudCBhdCBzdGFydCBvZiB0aGlzIGZpbGUuDQoNClJlZ2FyZHMsDQpNaXR1bA0KDQo+
IA0KPiA+ICsNCj4gPiAgIAlpZiAoSEFTX1BTUjJfU0VMX0ZFVENIKGRpc3BsYXkpICYmDQo+ID4g
ICAJICAgICFpbnRlbF9wc3IyX3NlbF9mZXRjaF9jb25maWdfdmFsaWQoaW50ZWxfZHAsIGNydGNf
c3RhdGUpICYmDQo+ID4gICAJICAgICFIQVNfUFNSX0hXX1RSQUNLSU5HKGRpc3BsYXkpKSB7DQoN
Cg==
