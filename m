Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0266BC55ABF
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 08:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7FB10E2D3;
	Thu,  6 Aug 2026 08:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1nnBX0e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6FB10E2C2;
 Thu,  6 Aug 2026 08:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786004906; x=1817540906;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hrHz3HdgTHdqOQWTn/m4aTsuVCi3EgPO2pi3v4kQKao=;
 b=c1nnBX0eXYthenKjEqt0w5PytYXyeidnvuXm3AxCeSkU6NN+N/TgjRBP
 3a8cQT6LS3YwTN1N3xd80b6nWJ5LsWtIUPQsGXPD4GXBR0a7mbf7WUv/O
 /Q0HPdr4NI82zFeaPP90dH7L4Tr1h/2rv5CUmcWdB8640FUo7kh/7iHhg
 c04POJ5e5OlvR7cqOG1OtV+m/4/Nrt3Rk3fTM547VBqYcNNAtelz8Bl50
 PPseSiaAoSAsB4N1MuKfB1W2eSLRoJ9RvozcVBPWfnrlQQbWF6v+El3db
 F59e3wEWv8tBw8nCEbL4Dv2MKnSwHDMqPzkwvzJfS8aSuD8WyYCdc91DB w==;
X-CSE-ConnectionGUID: Yj8qBoipRZG4zZVq32gjSg==
X-CSE-MsgGUID: tH5y4ExmQRGzGu3qirzsHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97237969"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="97237969"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 01:28:26 -0700
X-CSE-ConnectionGUID: uaggd7sRTIG5heTXFd/jSQ==
X-CSE-MsgGUID: /IbqrzQ3Q8mHljLGtRRnWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="291954522"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 01:28:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 01:28:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 01:28:25 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 01:28:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L16vkgA/rmbMqh4npVLWxFsMyIB6bH+UkI/wlKrixrqrKq0AIzZ7N3ZxaiOju1HnZnI2Wp0j1eJ4Zm/0PCgu3BoDYPjx2M/MtF5qHH4NA/OeLiazvjyZzAFIR0h/6P+ALNlJvsmUwOcZi6Jjj9FLu29q7fM0QmFa03nGUmfGCFEK0LuyfmWx0HCYxizjcTmI3QFRP+Q2dzZRpZ/GZAxd8c7fVdyF/pc6/VLSVdE8abMiM9v82yGMVnZ3vggl5eZT8pTK7x8O9lEVhHaccWw2QW9Yuj6DiTafGuICbGN2DmfmDu667VrQErC7VMtktzzp0wubbzGlSVdKgTPfPOytIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrHz3HdgTHdqOQWTn/m4aTsuVCi3EgPO2pi3v4kQKao=;
 b=OKqXSt9Y3lowkDVI2D5SL3qIjJHSGl4V5nzV8vE3CBE707X3mBVLFzXQcSdU2HQLXOcgHyFv4yk/RO4WkA1cxOQZuZDXh34gYZpZz3K2xFXmFhZrvmg+8kxho+PQzKQ1hAl6nKb6iL1BuZC8zCOZSqUmIFoGbtd84oINXl8t3D06DWIESorLaAq7TbIwMk8v+VhGPBzQUgynGtFAtCmVtDADzvd/S26w4V0m9axSpRj+H2wG/U8cWMEI0W8NpLmgQ/08YW7Bo8PK1qHh0MIMIYEJZtEROKCO0zKAkCvPGcXzud7drxXbN1AYNRY/7iEhmTNZu0WFOmurfADM2FvHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6464.namprd11.prod.outlook.com (2603:10b6:930:30::20)
 by MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 08:28:17 +0000
Received: from CY5PR11MB6464.namprd11.prod.outlook.com
 ([fe80::90f:a5c0:ea24:d5e1]) by CY5PR11MB6464.namprd11.prod.outlook.com
 ([fe80::90f:a5c0:ea24:d5e1%5]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 08:28:17 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: RE: [PATCH] drm/i915/dp_mst: Remove duplicate
 intel_pfit_compute_config() call
Thread-Topic: [PATCH] drm/i915/dp_mst: Remove duplicate
 intel_pfit_compute_config() call
Thread-Index: AQHdJXtQAVrwUJdRNkyCBozE/CwjybaQr/1w
Date: Thu, 6 Aug 2026 08:28:16 +0000
Message-ID: <CY5PR11MB64643C4FCD2ECC5AFA80BFADE3D22@CY5PR11MB6464.namprd11.prod.outlook.com>
References: <20260806074819.2631970-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260806074819.2631970-1-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6464:EE_|MN6PR11MB8241:EE_
x-ms-office365-filtering-correlation-id: 5391fe86-2010-4f2f-9817-08def394aa40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: s/g/7BP3TV+ovi1ZkbOxCdKXZ+E5Gato5K4Tw1RlgM6BzrFMH7bGNBZ7BjJ/I56+eWzfjgAkaHzuQpnsPbGdyK1w+LzNxEnp1BcNgHWwt3lFTRdfeXjFShlvr5tIAWMEoePjhJIhqCLUN1VCzrsuNgJerxAi6xaJODk+pOwf/QEg5j41/GkwctaOnl2e9D6RKY9Th6gniU3MqGvnLJNXc8CLABh3uqEtt9gaHSkELi+UM/N1nPMUz2NUAvXUfupZuxj4BxiAg7YUx3GyoVJK1kLZ/b7xdS8iVfkrNVQRP0E/hteivo5+ql8UuWCOFO7vE002ThQSSAOIx2jSDNZjFD4kogAwJKzqDnkUWVzcm4ajzX1OI6UawL7vnH8ZC8un0tFbvhuYFPIpstcD345hS/9JwMoTEmtUY1eL3dbxvsEcatJAg28XtyJF0OYq+3xxxcwnxP4FXfI5Tw5Sm/acF3D12qv+JrpjRdHfcd0Zb06kPibhXDPOs1Cj2Dhjo1PQpFEsyFCD1MQi7TgJwqW1Btnwxqyd5WXUabNiLM4sbyKfMmzUTjeJSo9VHK9ZvpfrWDLtPPtyVeLuboYvYEbVxla51LWdoHMSwVbMXy9Y4oKqwl1BIWvSns9WtJ5EcLEwZykI86pVVu1e/KWvD54PyyHM/rZ/w0TAMvaxHyKsgekLhQHe8payo7pjxrBekRBKeG+xYCPh6J6LG9Ix2xTERyZ5cSUwSDRqF9sVDKymt3E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6464.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0Z5OTZ4ME0zQ1B5WkxYSnNOdzZ6YlNNeEZpajBHYlBKV0o4cG5aYVNOUXN3?=
 =?utf-8?B?U2lUMFMvazVDTlh4MmxKdFRUSlp1ZGZjUXVkaVp6cERRVlFGZzdCSjVaOEdT?=
 =?utf-8?B?UkdpbHFuajdsU1ZyMml6T0IxU09USlZJVkNvSnRZT0Uyd3BDT2hkVnM0Q1Q4?=
 =?utf-8?B?dS9kb1ZFc2Y3cW84M0VTdVJSQ0dNV1BTc0Q5OE9Cb3RaQ0VxbWRJT0hhOFpl?=
 =?utf-8?B?akd3YVZCanlxejQ2eFhSYkdkUmxDMU5sZnlZTVcva1BsYlhsQ3YzNjg3aGE0?=
 =?utf-8?B?N08wdnlGK0JSOHdWYThDVjNYblZUM3JiaFExSnBqc1VJUENrd0V6WU9qTTRU?=
 =?utf-8?B?c0x6aGFtdUtLeityb01GdWFFU1o0b081T01OUktWS05Na0ZFUkNNeVVOaDdJ?=
 =?utf-8?B?ZkxEaGFoaG1wUVpKVFBiTFd4OHJWQVZOUDFqeGszQ3UvYkFrcnNVRU40NEJs?=
 =?utf-8?B?RzJFQ2FsWStRUDZ5ZlU5SS9DR1lUWVdTdmc2UkhCL09rY1ZHUDh6MFcwaFFS?=
 =?utf-8?B?TjRIUlhpekxWczl5QU1MV2wvcE1rMmthRjNTQXRsa3YwTVZFK3dXTlhxNmIr?=
 =?utf-8?B?VDErRXV2RElYVnc2UHVLZTY2NVNBNWJGL25FQzhGRGFOcmVDN1RweWFwdFND?=
 =?utf-8?B?TXNFTXBEVGlBcFRFNTVMcFliYmZjMHlIVUJ3OWJPYkhWOFR1K3puZmptbEFq?=
 =?utf-8?B?TnRpRDdqSUVUU2ptT2ZGTVNaRitZOGJPcGJVbG9IUUhnenlIUWoyVGNrTFpi?=
 =?utf-8?B?MmFUQllFSUZhdVBYM0lTL2hFQ2VpZW5NV09jR0tXbVkxRk50QW9aclBMd0N4?=
 =?utf-8?B?Vit3M000TGFPbUIra2F1NjhWUk1tcE1YTFdBK2pvekpUTnpka3o5dGI5dUhC?=
 =?utf-8?B?WXVYZEdtbnNiV1JQTkFIMUlzRlBNVWxIQ2swRzNRS0pURFFMaUw4SHdOdnM2?=
 =?utf-8?B?TlQ0MHpTNXQ1cit2ek9sbEk4MFFtQkp5ZzhhNDZNbFEwU2srRk5VeHhTZm04?=
 =?utf-8?B?OHU5L2ZXRXpkU2NwYmVJWXZnM2FBeWpVWTh0ZTA4Q1JGbkRENkhRekNLcGY5?=
 =?utf-8?B?RnRiZ1FBbmFFQndaSkhOTDVVVUhnakpPQ3BHeTVKdDJBdW5ya09kcWlhdVZW?=
 =?utf-8?B?SUtiTHVJZ01ZRDhneXhQdWNzNlkwaWJkdmt1eERwbDRETUJ1M0JkT2tCY0xw?=
 =?utf-8?B?dWRMZE1jdXBuUllmTlN5V21UenJ2TXJLa1NnVGVTRXFrUGpkOFZoTkRqeEpO?=
 =?utf-8?B?VHYwaE1rZDhoY1lPU2l1bW1UNUdLUlQ0NjVBSTBTOEVvVGt4SDBORGlvOEQ3?=
 =?utf-8?B?VHNNT0VFb3o1R3l0Ry94REcyaG9SK3haNEQxZ0dtUTBxYlV6TXUxSWFkT2xB?=
 =?utf-8?B?Wk5Ja0luRjBSdWdPWDhqRlhHV0s3VGZrdUY4NDZSTTlxaHQxKyt0RDZMZyt0?=
 =?utf-8?B?MFNzTVhKVVFPZWN0UWpsR3FOUFI3cnhkTjd5MUJOMlJ0OG5UU3QyMFp3aHIy?=
 =?utf-8?B?eTVPYzNvZk53SmFDa1JCKytLRFI3ZFdUYjFWTDdyV2wwMkQ3emd3aHIzOWll?=
 =?utf-8?B?bDdPNkJuSEltLzZLWXQ2RE9KeHRRd1BpZXdRWmRydUc4ek9kb3J4alhXMDJl?=
 =?utf-8?B?UnNZVkY1ZDUrWmFSUWR2YlhEa0JzN3lyYjFlVVpKQzl5R1A4a0N6c0NBZHZa?=
 =?utf-8?B?OE8yck9rRVJQL25WUlhndkM2TGxQRExYcUlPRzF4WC9yaUdkUDI5SVRpSXJj?=
 =?utf-8?B?dTFKT3dwUzdBRWUveEhpOWUwWUZTTDlBdUF0TEZwMXRvTDdoMXg5M0c3eEZJ?=
 =?utf-8?B?Qll5ZWFUYlF1SXdVSTQzcFNXcHpYcC9Da2FuL09Vd3dERHNmZ3ZTbXNnRXFj?=
 =?utf-8?B?dUllcjlCZmN6MVBONGRueTROeVl5bXZkb1R2YURuSFlPU1JNOUU1Q21WU3Z4?=
 =?utf-8?B?RGEwMGVBdnRPcys0a0tZZVRXVWtMWnhtK3BQamk5Z1d6QTJsRUV6aDFFNXhB?=
 =?utf-8?B?bU9WeWFzQklGWTh3WEk5aFQyMDNqV2NaSXNwS2V0c0M4NWV6a2ZUM3NVT0Nk?=
 =?utf-8?B?a2tSM01pUEhHMDlLK0dJTWZQWjV1UWQ4bHdLN21NUjhHR1o3bi90K2k4MUlX?=
 =?utf-8?B?TVduV0JIQU9NbnJxcUpCbjJDSVo3RFpjcUNjY3RKeFRLZWk3UTk3TmNtMFBw?=
 =?utf-8?B?WkJ2bmp4aFVOWjZ4aGhPZ3krazZqTXRDYVNSRzlOQ0gvbU9iaWNKY3U0TEhj?=
 =?utf-8?B?aG5jRnZKZkpRcXg0bjE3NFBXRkJFKzg4TFdVY2hFZm1MTXF4b3JkMk5NTDEw?=
 =?utf-8?B?TVpPWnhVUjh3WVdWSGJaV2pzeVN1MTNrVkJacjl0WFlBOGRPbXZXdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jnEcDXAAciorMSt1xSRIKidqWWEMmuVK/6VKPm2f4vf3PZwikegcPZ18YwiGScUZuaBypvo5kM79yCRQRaBRMn8V+N66y6mlt7H1Lh9JUOMCHVYtoAL9Su0dOgkFOPWg9cGAEu8D/4IQN2wBTqVWCEdB/7ayERZMH/hAox5ix94TXk+Zo54pqbyt02eSBR/obEtZ5r4Rz4G3BfRNa8rEVVotdt4s/GvAWhTEVDqHYcybQ2YMJsOONJu/0jJdC4bj2EymsKpIzIyKr3phvPIO0F6x68kab69VeuZQO+P/ZK2D9VhcLvDuPLcN8DKNeAyFB5WhjBlHBvlO/BsIcG+DhA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6464.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5391fe86-2010-4f2f-9817-08def394aa40
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 08:28:16.9891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0qI/NritpIeIavEaj6Jndvbsv8i1M3UW9SAbstIvgTx36esgxRqYjYXAZvKv5IAUG49v7Q6S0YGapPSOFaoc9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
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
YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNk
YXksIEF1Z3VzdCA2LCAyMDI2IDE6MTggUE0NCj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogQm9yYWgsIENo
YWl0YW55YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT47IFZpdmksDQo+
IFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPjsNCj4gR2FyZywgTmVtZXNhIDxuZW1lc2EuZ2FyZ0Bp
bnRlbC5jb20+OyBKYW5pIE5pa3VsYQ0KPiA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9pOTE1L2RwX21zdDogUmVtb3ZlIGR1cGxpY2F0ZQ0KPiBp
bnRlbF9wZml0X2NvbXB1dGVfY29uZmlnKCkgY2FsbA0KPiANCj4gbXN0X3N0cmVhbV9jb21wdXRl
X2NvbmZpZygpIGNhbGxlZCBpbnRlbF9wZml0X2NvbXB1dGVfY29uZmlnKCkgdHdpY2UgaW4gYQ0K
PiByb3cuIFByb2JhYmx5IGJlY2F1c2Ugb2YgYSBiYWQgbWVyZ2UuIERyb3AgdGhlIHJlZHVuZGFu
dCBkdXBsaWNhdGUgY2FsbC4NCj4gDQo+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBp
bnRlbC5jb20+DQo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPg0KPiBDYzogTmVtZXNhIEdhcmcgPG5lbWVzYS5nYXJnQGludGVsLmNvbT4NCj4gQ2M6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+DQo+IEZpeGVzOiA1Y2U5
YWMxNTMxYjggKCJkcm0vaTkxNS9tc3Q6IENhbGwgaW50ZWxfcGZpdF9jb21wdXRlX2NvbmZpZygp
IGZvcg0KPiBzaGFycG5lc3MgZmlsdGVyIikNCj4gU2lnbmVkLW9mZi1ieTogQ2hhaXRhbnlhIEt1
bWFyIEJvcmFoIDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMgfCA0IC0tLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jDQo+IGluZGV4IDNiZTE2NDNmOGQwMy4uNTdkYWVk
MGIwYjM2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RwX21zdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBf
bXN0LmMNCj4gQEAgLTc2MSwxMCArNzYxLDYgQEAgc3RhdGljIGludCBtc3Rfc3RyZWFtX2NvbXB1
dGVfY29uZmlnKHN0cnVjdA0KPiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCXBpcGVf
Y29uZmlnLT5zaW5rX2Zvcm1hdCA9IElOVEVMX09VVFBVVF9GT1JNQVRfUkdCOw0KPiAgCXBpcGVf
Y29uZmlnLT5vdXRwdXRfZm9ybWF0ID0gSU5URUxfT1VUUFVUX0ZPUk1BVF9SR0I7DQo+IA0KPiAt
CXJldCA9IGludGVsX3BmaXRfY29tcHV0ZV9jb25maWcocGlwZV9jb25maWcsIGNvbm5fc3RhdGUp
Ow0KPiAtCWlmIChyZXQpDQo+IC0JCXJldHVybiByZXQ7DQo+IC0NCj4gIAlyZXQgPSBpbnRlbF9w
Zml0X2NvbXB1dGVfY29uZmlnKHBpcGVfY29uZmlnLCBjb25uX3N0YXRlKTsNCj4gIAlpZiAocmV0
KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAtLQ0KTEdUTSwNClJldmlld2VkLWJ5OiBOZW1lc2EgR2Fy
ZyA8bmVtZXNhLmdhcmdAaW50ZWwuY29tPg0KDQo+IDIuNTAuMQ0KDQo=
