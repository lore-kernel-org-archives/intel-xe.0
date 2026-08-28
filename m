Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04851C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 04:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51C610E460;
	Fri, 28 Aug 2026 04:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHUiJegt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2905610E460
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 04:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787892926; x=1819428926;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YFcljjyLKxJDhMFyZkpzELnidqHTAeC3u4Q3h9nvORc=;
 b=mHUiJegtUoSo1TOM5AmJsIZNBPHa2+5sYi50qGnwb7HvB3qoT7alHLys
 WQm2MHjHU1Y2TSwgZGpnPMTx7LStHWNDDZ6YqlUVmGs7jQlezJossfe1h
 K/0YZ2+Xu9/qLo99eK1dXjAa4pBiLNTBGc8pRIooN/r8zMltSSzv03nVQ
 aDpjqrxuiM2UDEDTbJbS/wyDzPKszEO3AqVxrY9gM5OmNTNnvw0chcEW1
 4XQpp8orquzVcSdhe/RcR1mrmZIiUeV8XcQ780BpqAdb+eK17kQbBC7cP
 XNC8ePQLMojRli5X0Kl2WsqTbRLm8TTY8Nv2cqeYexZ3oqqB3tr9Ukstm w==;
X-CSE-ConnectionGUID: w0EPs3WYSJmVrFlN8QgIOw==
X-CSE-MsgGUID: qLvvADhRRwCGGMbpruSCTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="75942392"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="75942392"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 21:55:26 -0700
X-CSE-ConnectionGUID: HhJ95d8sSjeOSfwzNxxpFg==
X-CSE-MsgGUID: DUFZi2c8SpCqJynyS+beLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="271585774"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 21:55:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 21:55:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 21:55:25 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 21:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaxV96FOPNCYsQOLH1ISLrWUCIKEgLk7DQ6Rr8KC8vsKWuZ5VDUQ5UYmUnzRAMJi0WismnLAtJTE5YDkokW+detmrrD7nfcedagCT8st/NHo17kBCfnLDTs+gdi9y4Atk66dKYzOrVYIp96w5/Ge6i8KhvtjwWMWHlOAJIMtLXQyWhvHuNKZamxb4zrtKs+pLFe4s7Z5dQkP6P+FwyQ/L1t6mCdovNpmKPZvRHauTXqvsMrYaOKlRV0GZHW537n7LnUHuEdUpssRg44td7M8xgekHKCf53vglBsunykDRyswbvFStqNY9eLNM94rp6n1AeClNuVv/Her0WHWYi2j/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFcljjyLKxJDhMFyZkpzELnidqHTAeC3u4Q3h9nvORc=;
 b=J59HGBVW8+tVG0upgN5FZuhnufHkddzW+s64k0fQhKSTOw41y9Qi6Lu5G8kUX4/exEF5NxeLydug5pP9n0nCjFCmd3+YRxL/qP10iZz2PNjSmR3EmKpRVAZeL5hE+3cGVyH11gxH469If5k2Mw9WY+s7L2KTVrF9VUohHr+fo2rsgLPYvA7jAjOT0epvGVZH+uE5i3Qm4uAozYQvRI6W/bywmtxzy6YBinugwTOqVncNkykY50+SUq4oX9H5iRqylV4Wg1dakcuPDKr+oVMM8Gh6L41iXaN8Brbaugf7sD9FRojCvYlDNsZnHM6XHFcMYKnPdDbNwLlwoN3uUtUSoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 04:55:14 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 04:55:13 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
CC: "Filipchuk, Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH v2 3/6] drm/xe/uc: mark HuC and GSC as only available on
 the media GT
Thread-Topic: [PATCH v2 3/6] drm/xe/uc: mark HuC and GSC as only available on
 the media GT
Thread-Index: AQHdNX4LMnjczNr4tEmMRyqOSgFUY7ay57KA
Date: Fri, 28 Aug 2026 04:55:13 +0000
Message-ID: <a593a7862adedd8050ce0dbba6762f2445ec4f88.camel@intel.com>
References: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
 <20260826171149.708378-4-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260826171149.708378-4-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|IA1PR11MB7271:EE_
x-ms-office365-filtering-correlation-id: db0529d1-e038-4deb-12d4-08df04c08c0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: cPVg34DSuPWxpGBhQE8WkoW/HRQaFQbDUnBfJHlAeoQORA9kO2Hx07IIc24aLlGgF7YD/dYJdeqkoxtSEIJG27zxEJe4ae6Trk+VApwmdlG/N0J9vOwGbjv5xq1ONepp20IK18xXVA10zVC7PLiia7xVoOJSWt+P9I9H6b+had8JzpjuXxxzQTvUgblRuRxHHOH12wtJQ/iSsbEPRwj/a2WlYWl7syNDk1cOprQMP5BepyCKCI0HHkfDzND9107ABh9Xk2quPqsGhnHmpCEjfbyQsSoC1Z6vs6jWnHwIztWqAO+2FSR88/QAVj/+Eq6XJkPf7N6Gj42DXNkt0N5R5pxuS6mmq0YZS7/RhgEdWgO50yqOZ4H3TiHsuY1cIX11JL1QOSGQCSlRZORzFhMyIXWyWeOgwzh4BmTm4gpjISdvw+l9jjzAz41rUZb0NmAm3h+Czuffd6OGVaKWxk49/aGnCosSJSasFLQYXQ/KwSFyW0VUcAmzN/NoHGUnaHBzpuil9JCpY+CKtY4SImVjl3MocPFxu8g/CSlgOpArtKLQKwpFhrSPGieN9i/eCWa9UtLYeSa5ceGDoeMEBS6vHinX7qzyVzkVBSW+Ijh0e8PehaBu/Mj2RSdTOPigpnEkeDtXlF0//y7Nx7P4/p5s+hHvKHFTVYZJ7Jh+m5wN3JVu2q36QxBiNIt1kEmpYR537U1/UewwwNR6+/ssfsSU8ZLmfmu/WYhvzYZz+Uffx3c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnlybTljQWpDbGxzUmh5YTRFQzRFdExPbjE5VUNwTWJ2M1lVRE1LNGlSaTcx?=
 =?utf-8?B?SlJSQTdGdXRLYlFxdm9vTFROc2orOWhoejZubEZYZ2plUmhNTWxwZ2k3WU1C?=
 =?utf-8?B?UlZuQk9CMURsRDMwSVQremR3WCtNa0lpQzl4Z1E5bU1FOTc4a1ljNFQveDNI?=
 =?utf-8?B?K3FOL1RNa0tTTHJLSG9VeHhiZW9TMFYvdVF1V1JER09QbWVHRUJXeVdwQWJv?=
 =?utf-8?B?Um1KcHY2cGhoSWFyeWVvVCtWYXlvQWM1MDdNWWJaYUo3eGd6WWxTbHdoaXV6?=
 =?utf-8?B?bzlnbHMrSnJrbEVJNnA3dTUvQys2bVE0MnlIdEVnV2IwSzNEQWFxTyt0aTdv?=
 =?utf-8?B?djBwTmVlVmpueFhDSGREaHJCdGJSeDZ1WkFRMWJNRGx3SUJGWFpHYWFib29o?=
 =?utf-8?B?ajJkT3g5eEVaQU14bFhqVndTRndDZVRMVml0YVh0T3hNVC9tSCtsZ2k1VWhC?=
 =?utf-8?B?UllBb09pSUhxa3RqZm94VnJEMXNkUXpEbVlrbEpxeUk1Z3pxa1N5UXFyQXpR?=
 =?utf-8?B?NWRDQ1Ntb0IrYVBUa3QwYVZZM1VZbTFoSE1DRGp1WjlQaWJJYzdSbFM1RVZv?=
 =?utf-8?B?KzNETS9wSEduRzM4YW1iY0ZtaG9PQmRDZFl1MnNNcDNOd25TM3FGWHQwMXNF?=
 =?utf-8?B?WXhRc0ZSUTNucVRzcUIwd1dLUEtxYXN0NktjU2xqSW1yMG84NDRONmdzSjV3?=
 =?utf-8?B?ZFEzNFRJdSszb2pWTitFSCtXRkY4K1h5aXZBOW05b1J0RXFXcE1jRy9Cd0Q2?=
 =?utf-8?B?VnkxUWpMd0ZqZHRTTkowa0RQbG1DcWlIaG54azB2UTFBMzNlNUJwSHFkMjJv?=
 =?utf-8?B?b2Q4ZE1tRUROOTVKYktMT2VaOE9ja3NFZFI1Mmcvdm1VUTBUZCtwTHV3TE1P?=
 =?utf-8?B?UXp3UzNodXA1WHM1ZDJIeTg3ZjNkQWZ5V3hqV1FqTGJWbkJaWFZvMTRPL0RM?=
 =?utf-8?B?dnpncUdObTJGdWwwazVTOTdrZnJ2V2JVSURzY1ppTXV4alZOL24zQzVpcmhK?=
 =?utf-8?B?TkNjM0VzaXVxckUxR0hzMWxpbU82ejJuUWlVZFlNTGRHWXhUWFVpRkV0dlJP?=
 =?utf-8?B?V01sRDlqcXkwMmNFZ2Uza3pjL0ZPdytOeUlJdVFNZ1lLd29sZlZuNmdlcHVj?=
 =?utf-8?B?ajVLYUEwZktxZiswZGVlTXgzUDJUd1haVE1vWTVMOHBYSExLdkg3dG42dGw2?=
 =?utf-8?B?VUZpclVURThXMU5Rd01oVDZFSEJ6c1k2ZnNZODZ6TWs2ckpBRndPQUcycERi?=
 =?utf-8?B?Zm5iRWs0Qm9weTJXaUZaS3A4T0RWOW1yWE82SW5UV29uSmhwUDFIRW4rMjBL?=
 =?utf-8?B?cHRydExWOGM0NXB6RFBNSDhKNFJvVHRFcEZHY0x2MThma0htWlU5Rk9Ub1Rl?=
 =?utf-8?B?TUxsVkRvaVVNNFpMV2hSTC9mU1JlUWdPdjRTY3RYa0JUMHMvU2IvTE9ONGZu?=
 =?utf-8?B?TUg5N0xydDNPampkeDF0Qm9BVURzK1NKSFQvdEtQMTBTZFk2TVlkMmppYWRC?=
 =?utf-8?B?OFFYRlFFa09INVJ6eGR2cGh3ZUdRakJXWUNxbjlBQmJuUm5WVEtoSFowNWpQ?=
 =?utf-8?B?aUtUclpVSVpURmcrWE9CRGtIVkZRYUJ0elZidGl4UHptWmFVU1dFSjJvS0wv?=
 =?utf-8?B?VVlqRHRsVU9takhQeGhsYmg2K3B3YlJsc1p0QktsbVdnNjNldHNBcjRJb3BK?=
 =?utf-8?B?WkdYU2RUSnhNSUdDNjNNcmRpOUZPcHRJQXUzTmdwenZYUFFIa01sVUpVWVY5?=
 =?utf-8?B?d3JNMXFWOGRFckI3anc3cHZzLzJrUVlsejR6Q1h6clUxekpKNkNGbXJ6ZEEz?=
 =?utf-8?B?QW1DbFBsQmhRUFAvQTJscWJYWWI5TVRhVVo3aWxwL3RkK3JFRHM0M2kzcEVy?=
 =?utf-8?B?bW1wbHRkUURBWlVuVjI5YnBpL2pVblZNb1VNTDVweUtzZUZQdElZSVJka0dD?=
 =?utf-8?B?VUFRQ1F1ZlpIOFdGZ1JRcXdvcGV6QW9NaWlEZG1PTGtSTmZjZFZQV0pwQUhL?=
 =?utf-8?B?aUhXV3NManM0UmxHV0NjZEhsZStBWTJtMTdnbnBKVzlBb3RSUzIxMmhwRVhT?=
 =?utf-8?B?NlZNSHVZb1BkUjlJYkljS2l2V0c1OUFCQVc2d3pIMm44Z2lpUWlLK2V5eDJE?=
 =?utf-8?B?bDMyUkVGTjM3ckV0UmpGMGhYZ3ZSc3ViSEtFbDQvUzNDclRTMW80WG5aQ01D?=
 =?utf-8?B?NitBWDJaMEk2a1lXbWR3cDBNeEhCdi8yK1ZCbkVQb0w4TUU5bzFSYWtQRkQ2?=
 =?utf-8?B?N3h5Y1grZnJpQ2JtNEZ6c1ZpQ0VGL0xTdkIya3VqV2JMdTFWa0xQZXJEZUZW?=
 =?utf-8?B?SlIzL1p4MEVuRmNWMC9IQnZNck1mM0czV3FRemxUSmw2Vk9tZ1l0MkVuN0M2?=
 =?utf-8?Q?5/fgrl3jON9PAL29gmJBI6cX1vTcPmwVGNVnL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F950B12C2ABF94FB88B7C7F1F0C0BE0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TzSIuXWv1xWXFk4y9mNnqdpPdogDIEUzRV/VHGfnd+Gq1btMy+7UrafHESczn016m9DShDSotfAToqWw6qibrjyPgrsCfq/kiJw2ZzOxZxAQ1JAI9f2KAoOERe60PY7UvX1oNk8YDQ8PQm0I0Pjf1JibxH1ibvF5P1IlfR+AEXyBPvBpH/P/NRnIpzOYshvdxhQLxwUnuoTEq5u324qBDBP+joZi6gcKAAbcZ5WBEP8HlB/hM3aB85dbFl6DK3MmJlnK6MPqeStACeAldsro91gYq1U9fQVAnZAY5Tlg9cFr44pFI0SspMFIB8xvoyCerxTV7YcP8x2NhWRVv7j/gg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db0529d1-e038-4deb-12d4-08df04c08c0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 04:55:13.9175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DF1F0RBcTCKpjz/r/lojzjMnSofBfc4KdU54trdhYEX+6kv42ll7wTmhH5GIunFJca+tj7jTdnNE4rN4ERgsn3UpbN2md/2ZoEnFvMREurMV9UXV9L7kvk/mSeuP6YYH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
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

SSBzZWUgdGhhdCB0aGUgY2hlY2tzIGJlaW5nIHJlbW92ZWQgd2lsbCBub3cgaGFwcGVuIHdpdGhp
biB1Y19md19yZXF1ZXN0DQooYWxvbmcgd2l0aCBvdGhlciB1Yy10eXBlIHZzIGh3LWF0dHJpYnV0
ZSBjaGVja3MgYW5kIG5ldyBvbmUgY29taW5nIGluIG5leHQgcGF0Y2gpLg0KVGh1cywgSSBmZWVs
IHRoaXMgY2hhbmdlIHdlbGNvbWVkIGV2ZW4gd2l0aG91dCB0aGUgV0NMIGNoYW5nZS4NCg0KUmV2
aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29t
Pg0KDQouLi5hbGFuDQoNCg0KT24gV2VkLCAyMDI2LTA4LTI2IGF0IDE3OjExICswMDAwLCBEYW5p
ZWxlIENlcmFvbG8gU3B1cmlvIHdyb3RlOg0KPiBUaGlzIGlzIG1haW5seSBuZWVkZWQgdG8gbWFr
ZSB0aGluZ3Mgc2ltcGxlciBmb3IgYSBmb2xsb3ctdXAgcGF0Y2gsIGJ1dA0KPiBpdCBhbHNvIGFs
bG93cyB1cyB0byBkcm9wIGd0LXR5cGUgY2hlY2tzIGR1cmluZyBHU0MgYW5kIEh1QyBpbml0LA0K
PiBiZWNhdXNlIHVjX2Z3X2luaXQgd2lsbCBub3cgcmV0dXJuICJub3Qgc3VwcG9ydGVkIiBvbiB0
aGUgcHJpbWFyeSBHVC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVy
aW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IENjOiBBbGFuIFByZXZpbiA8
YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCj4gQ2M6IEp1bGlhIEZpbGlwY2h1
ayA8anVsaWEuZmlsaXBjaHVrQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3NjLmMgICB8ICA3IC0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9odWMu
YyAgIHwgMTEgLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV91Y19mdy5jIHwg
MTQgKysrKysrKy0tLS0tLS0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAy
NSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3NjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3NjLmMNCj4gaW5kZXggNTI0YWM1NmJkY2M3
Li5hODgzNDczNWNkY2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9nc2Mu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3NjLmMNCj4gQEAgLTQwMCwxOSArNDAw
LDEyIEBAIHZvaWQgeGVfZ3NjX2h3ZV9pcnFfaGFuZGxlcihzdHJ1Y3QgeGVfaHdfZW5naW5lICpo
d2UsIHUxNiBpbnRyX3ZlYykNCj4gIGludCB4ZV9nc2NfaW5pdChzdHJ1Y3QgeGVfZ3NjICpnc2Mp
DQo+ICB7DQo+ICAJc3RydWN0IHhlX2d0ICpndCA9IGdzY190b19ndChnc2MpOw0KPiAtCXN0cnVj
dCB4ZV90aWxlICp0aWxlID0gZ3RfdG9fdGlsZShndCk7DQo+ICAJaW50IHJldDsNCj4gIA0KPiAg
CWdzYy0+ZncudHlwZSA9IFhFX1VDX0ZXX1RZUEVfR1NDOw0KPiAgCUlOSVRfV09SSygmZ3NjLT53
b3JrLCBnc2Nfd29yayk7DQo+ICAJc3Bpbl9sb2NrX2luaXQoJmdzYy0+bG9jayk7DQo+ICANCj4g
LQkvKiBUaGUgR1NDIHVDIGlzIG9ubHkgYXZhaWxhYmxlIG9uIHRoZSBtZWRpYSBHVCAqLw0KPiAt
CWlmICh0aWxlLT5tZWRpYV9ndCAmJiAoZ3QgIT0gdGlsZS0+bWVkaWFfZ3QpKSB7DQo+IC0JCXhl
X3VjX2Z3X2NoYW5nZV9zdGF0dXMoJmdzYy0+ZncsIFhFX1VDX0ZJUk1XQVJFX05PVF9TVVBQT1JU
RUQpOw0KPiAtCQlyZXR1cm4gMDsNCj4gLQl9DQo+IC0NCj4gIAkvKg0KPiAgCSAqIFN0YXJ0aW5n
IGZyb20gQk1HIHRoZSBHU0MgaXMgbm8gbG9uZ2VyIG5lZWRlZCBmb3IgTUM2IGVudHJ5LCBzbyB0
aGUNCj4gIAkgKiBvbmx5IG1pc3NpbmcgZmVhdHVyZXMgaWYgdGhlIEZXIGlzIGxhY2tpbmcgd291
bGQgYmUgdGhlIGNvbnRlbnQNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9o
dWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9odWMuYw0KPiBpbmRleCA1N2FmZTIxNDQ0YjEu
LjE4MmIxMDY1NTA5ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h1Yy5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9odWMuYw0KPiBAQCAtNzAsMTcgKzcwLDYg
QEAgaW50IHhlX2h1Y19pbml0KHN0cnVjdCB4ZV9odWMgKmh1YykNCj4gIA0KPiAgCWh1Yy0+Zncu
dHlwZSA9IFhFX1VDX0ZXX1RZUEVfSFVDOw0KPiAgDQo+IC0JLyoNCj4gLQkgKiBUaGUgSHVDIGlz
IG9ubHkgYXZhaWxhYmxlIG9uIHRoZSBtZWRpYSBHVCBvbiBtb3N0IHBsYXRmb3Jtcy4gIFRoZQ0K
PiAtCSAqIGV4Y2VwdGlvbiB0byB0aGF0IHJ1bGUgYXJlIHRoZSBvbGQgWGUxIHBsYXRmb3JtcyB3
aGVyZSB0aGVyZSB3YXMNCj4gLQkgKiBubyBzZXBhcmF0ZSBHVCBmb3IgbWVkaWEgSVAsIHNvIHRo
ZSBIdUMgd2FzIHBhcnQgb2YgdGhlIHByaW1hcnkNCj4gLQkgKiBHVC4gIFN1Y2ggcGxhdGZvcm1z
IGhhdmUgZ3JhcGhpY3MgdmVyc2lvbnMgMTIuNTUgYW5kIGVhcmxpZXIuDQo+IC0JICovDQo+IC0J
aWYgKCF4ZV9ndF9pc19tZWRpYV90eXBlKGd0KSAmJiBHUkFQSElDU19WRVJ4MTAwKHhlKSA+IDEy
NTUpIHsNCj4gLQkJeGVfdWNfZndfY2hhbmdlX3N0YXR1cygmaHVjLT5mdywgWEVfVUNfRklSTVdB
UkVfTk9UX1NVUFBPUlRFRCk7DQo+IC0JCXJldHVybiAwOw0KPiAtCX0NCj4gLQ0KPiAgCXJldCA9
IHhlX3VjX2Z3X2luaXQoJmh1Yy0+ZncpOw0KPiAgCWlmIChyZXQpDQo+ICAJCWdvdG8gb3V0Ow0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VjX2Z3LmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdWNfZncuYw0KPiBpbmRleCBmOTE4MTM1Y2M5NmYuLjNhNzRhY2ZhZjJjNyAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VjX2Z3LmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3VjX2Z3LmMNCj4gQEAgLTEzMywxMCArMTMzLDEwIEBAIHN0cnVj
dCBmd19ibG9ic19ieV90eXBlIHsNCj4gIAlmd19kZWYoVElHRVJMQUtFLAlHVF9UWVBFX0FOWSwJ
bWFqb3JfdmVyKGk5MTUsCWd1YywJdGdsLAk3MCwgNDQsIDEpKQ0KPiAgDQo+ICAjZGVmaW5lIFhF
X0hVQ19GSVJNV0FSRV9ERUZTKGZ3X2RlZiwgbW1wX3Zlciwgbm9fdmVyKQkJXA0KPiAtCWZ3X2Rl
ZihQQU5USEVSTEFLRSwJR1RfVFlQRV9BTlksCW5vX3Zlcih4ZSwJaHVjLAkJcHRsKSkJCVwNCj4g
LQlmd19kZWYoQkFUVExFTUFHRSwJR1RfVFlQRV9BTlksCW5vX3Zlcih4ZSwJaHVjLAkJYm1nKSkJ
CVwNCj4gLQlmd19kZWYoTFVOQVJMQUtFLAlHVF9UWVBFX0FOWSwJbm9fdmVyKHhlLAlodWMsCQls
bmwpKQkJXA0KPiAtCWZ3X2RlZihNRVRFT1JMQUtFLAlHVF9UWVBFX0FOWSwJbm9fdmVyKGk5MTUs
CWh1Y19nc2MsCW10bCkpCQlcDQo+ICsJZndfZGVmKFBBTlRIRVJMQUtFLAlHVF9UWVBFX01FRElB
LAlub192ZXIoeGUsCWh1YywJCXB0bCkpCQlcDQo+ICsJZndfZGVmKEJBVFRMRU1BR0UsCUdUX1RZ
UEVfTUVESUEsCW5vX3Zlcih4ZSwJaHVjLAkJYm1nKSkJCVwNCj4gKwlmd19kZWYoTFVOQVJMQUtF
LAlHVF9UWVBFX01FRElBLAlub192ZXIoeGUsCWh1YywJCWxubCkpCQlcDQo+ICsJZndfZGVmKE1F
VEVPUkxBS0UsCUdUX1RZUEVfTUVESUEsCW5vX3ZlcihpOTE1LAlodWNfZ3NjLAltdGwpKQkJXA0K
PiAgCWZ3X2RlZihERzEsCQlHVF9UWVBFX0FOWSwJbm9fdmVyKGk5MTUsCWh1YywJCWRnMSkpCQlc
DQo+ICAJZndfZGVmKEFMREVSTEFLRV9QLAlHVF9UWVBFX0FOWSwJbm9fdmVyKGk5MTUsCWh1YywJ
CXRnbCkpCQlcDQo+ICAJZndfZGVmKEFMREVSTEFLRV9TLAlHVF9UWVBFX0FOWSwJbm9fdmVyKGk5
MTUsCWh1YywJCXRnbCkpCQlcDQo+IEBAIC0xNDUsOSArMTQ1LDkgQEAgc3RydWN0IGZ3X2Jsb2Jz
X2J5X3R5cGUgew0KPiAgDQo+ICAvKiBmb3IgdGhlIEdTQyBGVyB3ZSBtYXRjaCB0aGUgY29tcGF0
aWJpbGl0eSB2ZXJzaW9uIGFuZCBub3QgdGhlIHJlbGVhc2Ugb25lICovDQo+ICAjZGVmaW5lIFhF
X0dTQ19GSVJNV0FSRV9ERUZTKGZ3X2RlZiwgbWFqb3JfdmVyKQkJXA0KPiAtCWZ3X2RlZihQQU5U
SEVSTEFLRSwJR1RfVFlQRV9BTlksCW1ham9yX3Zlcih4ZSwJZ3NjLAlwdGwsCTEwNSwgMSwgMCkp
CVwNCj4gLQlmd19kZWYoTFVOQVJMQUtFLAlHVF9UWVBFX0FOWSwJbWFqb3JfdmVyKHhlLAlnc2Ms
CWxubCwJMTA0LCAxLCAwKSkJXA0KPiAtCWZ3X2RlZihNRVRFT1JMQUtFLAlHVF9UWVBFX0FOWSwJ
bWFqb3JfdmVyKGk5MTUsCWdzYywJbXRsLAkxMDIsIDEsIDApKQ0KPiArCWZ3X2RlZihQQU5USEVS
TEFLRSwJR1RfVFlQRV9NRURJQSwJbWFqb3JfdmVyKHhlLAlnc2MsCXB0bCwJMTA1LCAxLCAwKSkJ
XA0KPiArCWZ3X2RlZihMVU5BUkxBS0UsCUdUX1RZUEVfTUVESUEsCW1ham9yX3Zlcih4ZSwJZ3Nj
LAlsbmwsCTEwNCwgMSwgMCkpCVwNCj4gKwlmd19kZWYoTUVURU9STEFLRSwJR1RfVFlQRV9NRURJ
QSwJbWFqb3JfdmVyKGk5MTUsCWdzYywJbXRsLAkxMDIsIDEsIDApKQ0KPiAgDQo+ICAjZGVmaW5l
IE1BS0VfRldfUEFUSChkaXJfXywgdWNfXywgc2hvcnRuYW1lX18sIHZlcnNpb25fXykJCQlcDQo+
ICAJX19zdHJpbmdpZnkoZGlyX18pICIvIiBfX3N0cmluZ2lmeShzaG9ydG5hbWVfXykgIl8iIF9f
c3RyaW5naWZ5KHVjX18pIHZlcnNpb25fXyAiLmJpbiINCg0K
