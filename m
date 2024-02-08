Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FFBC4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 18:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999E110E2C2;
	Thu,  8 Feb 2024 18:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFV2IMYE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35DF10E28B
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 18:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707416356; x=1738952356;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=A8NMAwWEqsmVx+tEi8he5AP5ncgHAqH8+LgmAmLoHkE=;
 b=WFV2IMYEyV1E+A1IZN8PMriD3e/w5oU1RHT4EQQXbPCPyOkpo+5080AY
 7Wg263ojJYxf14t0jCv4ONKMa7VnSDXN+3NLqnWdwoMqPcgc81w/ra5s7
 pm7lkwUJGM6eLrI+8qdFtdtUPem++OJKuVHjGdk1HyCCYt+dBy3UtlnVF
 XYqxWyMxNQpY4CPSUkSy9BolgEqqAZFFIedmKR2ZK9OSFsasUpn8UffV0
 U3at1vf8KfRw1QDBl4oG+RC6G2gVToeOJlIQJobN7BEiMkLziYGS1qOA3
 JYgovaRYLs3X4Pu7N5PfZeuxzsy1GGvG/Q1Vl8sfyqC7MqVQbcO9w6r2+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="11931040"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="11931040"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:19:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6382162"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 10:19:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 10:19:12 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 10:19:12 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 10:19:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWsRkCyJ6/AWK3yalOc9SV+Y35Ml3F5tKhuEYvjQpm4AK/nqfjvJ2jFK8vd0PqxINXci54/rKqDRuBFhr7bnn+sLd7DzplmA2cOsypDNUt0lpBB3CeeYDOUg5RzP9nTK0x5ye4t1zxrZ475r+hsGbLIWgL05hMevFYv5Uan1pZ3qgHOPYKE+ftBQR3NgzfKuk9MnNJEIIv78ppXxeFSBqjeIaN15OrL7cJzQ9VIOBiGr6hp/7+gYU2ssmlhVFtMFgH6bWsByTf0a4NWtwdRImT+Jtkza5RxD7g6f5ABPRbpJmdrBuyH1zAWYNkokyiJUhvDx/M7lbigieYfqyLKjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8NMAwWEqsmVx+tEi8he5AP5ncgHAqH8+LgmAmLoHkE=;
 b=nJRI//EvEE9ppCliF/v0Hci1w3SesWT2eLt1alQKMmCWhWuYCesd0/IwaAs+j7yiV+IqCU2Phs/DfoVhvm/2mI6tazgx16/L6e783gUoRetDh+7dzwpNz4y22lepj3X2IQF2nHocWbVURWGvsDEZjlKJAz2oKq74FU5lA/lFf9sr0q3CfgdR7AtPLIWn5lD3+8kAWN98kstl3I9kdJ/rZB2CBbJ2cPagDEgrEfTeYKg+NZl/bRBRXS+2xZrtq+DgDPsK24rfx7cNtT7b8daCSLDbzQrR3w9+aBCGZ9g1cW/bTMJOZH/6/Pz7OXzo4vrp4d3mxssybD8ywxpgKpPeTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH0PR11MB5562.namprd11.prod.outlook.com (2603:10b6:610:d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Thu, 8 Feb
 2024 18:19:06 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f3a9:7ba0:d19a:a630%7]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 18:19:06 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Add uAPI to query GuC firmware submission
 version
Thread-Topic: [PATCH 1/2] drm/xe: Add uAPI to query GuC firmware submission
 version
Thread-Index: AQHaWfGGBLm5QuaMY0SE0Avfrh8ynrEAvxSAgAADoAA=
Date: Thu, 8 Feb 2024 18:19:06 +0000
Message-ID: <abbb528b9e3c0bf1ba0649794da41b9abc0324aa.camel@intel.com>
References: <20240207181412.96548-1-jose.souza@intel.com>
 <860fc584-567b-45a8-a889-9de9a4b73d54@intel.com>
In-Reply-To: <860fc584-567b-45a8-a889-9de9a4b73d54@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH0PR11MB5562:EE_
x-ms-office365-filtering-correlation-id: ba93940c-96a8-4bd9-121f-08dc28d26fe4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OHq740RXxFvJtqlRFlrLNcZOJ/Lsg7mirYCeZOcSlfOCe4GpZnzX0nLbG0/m4RQtzMvN8NYbRAVm66eDfbxdFRlaKQ5Tl8ihVXhoMSAHfv7PjOq+QvQeqNHZQQBWWtbeU7gGmAHumR8AEQo5TaQMyMdOV/7BJ/CMdUnkYttaa5/qBJLiC2b1AIWukZ24c0JWMjemOwDqqP3dLKKzPDfjkxsoqchTOBgbm398gDX4l1vyIkO1oCUBC4Z3xetEC50XUsIWCfC40xuw5Dhf93HGW7BCvqM8aBaIsXusB8rChtytlzx9AKDbYvMJJpmEyD+wQt3oIiDI3XWoThDveapuuMzYRavdkkfDpG0WI3zZxXCslVwfGwp8Hj/RUhLGiVoOpDwwxvpZoCYT/x29Wk4UGdOAzw8nkbbgO/cPlbPeXDrxvUenhsWQmnwF3RkZttp6irvoIpE0GwFYZy1uQWVEmq27AtKEigQTLjp044G0qNAKoFRj6JhqqL6lR31cy2J88YjbPyo7dLVu6h/yxMCQAm95TeuUYhYZVKbz039hU8PAVb5e4O85DN7Kf/8uBH197oaNUvoAGkz2Njx4ErWi31rEN5+sfk/LO36xhZnUCXYr2oOj1GFDgXwIR4ziiCfPPIuN423RAxTv77hnUnDslA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(396003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82960400001)(6636002)(66446008)(8936002)(316002)(66556008)(110136005)(66476007)(66946007)(64756008)(54906003)(6486002)(86362001)(5660300002)(966005)(26005)(4326008)(2906002)(38100700002)(107886003)(8676002)(122000001)(6512007)(2616005)(71200400001)(83380400001)(53546011)(6506007)(76116006)(478600001)(38070700009)(36756003)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djBwTWVOOXRYclptWXRQdDFTN0k0SkVTdkUvVUtxa25yZnU2Mm1PYTAvRDNC?=
 =?utf-8?B?SG50QjJYQ1J4NlZzQmNWbFRYY1ZrSGlxSzlvL1ZjbzlLOHE1VkRHZDlSbFJE?=
 =?utf-8?B?TkFraWM5dk8wWWs0dnhnTW9vNnF4dDhoOWdGOUx4dHBRY2k5RWJPOFpKS25h?=
 =?utf-8?B?TTBqc2U5NURuUER3VTk5dEJ0Y3NsZEZWV1phL3ZtcmdjUWFNM3BsU1ZFaGdr?=
 =?utf-8?B?NHBEVFlCZjNrdWFsYUpscUxYR1hvZERseWRKb21XSmZDOHAwSDg3Z1d1aGtl?=
 =?utf-8?B?UVBRSURwcEN4NmpqV3FmTnp5VndodS9ROVRZN0ZvakJpdEh2cGJPSTNldWJQ?=
 =?utf-8?B?QXAzZTZRT2xmLzRZRWVqdG1naDU1cEdvOHo2SkovRlVXZ0FueXV5Z0NqUWtZ?=
 =?utf-8?B?ZU5EWFd3K1NMMW4veWJOVWM2ZDRhRkd0R2xRTmovV0w5WFlYWVFUUlU4N0Y5?=
 =?utf-8?B?N3pZR0hPblhxc3lzRkd2VnNEQ1pRaDlTOFRxK2F0S21uS1JiTVFSRG9kQ05O?=
 =?utf-8?B?Z3hoRUY1T0JYUjJrSDdxOVRQbkxrcDdURkRCbUlVVkJ3ZmYzL2lDSVUySElV?=
 =?utf-8?B?eDZvSHY5RE5ydE56bS8zcmdJaHNId1l6SVh6YkYzMjUvMDU1OFpBaGhqUTFo?=
 =?utf-8?B?T2tDMXNNMVBveUZWdjBWZGNpMjU4MEk1MVQ3MjhlaGlNK1ZuVWN4VkFydC9S?=
 =?utf-8?B?MFNJQjJFYW1UWXdxMlkxR0NVRzEvSXo2VnM1c0tielczMjdEQ2ZWQnhXcFpU?=
 =?utf-8?B?a1F5c1l4cGFhQnNLYUwydkUxaHFOYVJxaVlNcXVuYnpacDF6QnhrcTZJOU9u?=
 =?utf-8?B?OURoNmsrMC95SEdMNFlOSGtMcFI0UUxHN2lnaHJiYjYyYlJ2UzJaK3pHc053?=
 =?utf-8?B?YWVNTVJZb0NXSllZc2pVUHNCWHBxUnBpRU1uQkdTb1pFaVNBeENWMVBSMnlZ?=
 =?utf-8?B?WXU4MVpXUUNndmxIR1pKL2JFNklFc3VZeStqVnhsVG04OWo4TkxqRWZlZ2xu?=
 =?utf-8?B?TDV4Y1FNUDY2VUtJeC85a2N2UjRSa3QzOEhvNzZ6SmhXR2hMV01EeUIrbTAz?=
 =?utf-8?B?dzNDUkZwZ3NQbllmdjZBcURWV3FDYjZGSW4rVURTL3Q2dnFxTnk4Nm9JSmFF?=
 =?utf-8?B?QUIyVlp0SHlzeEFZMmRibmJ0b0QyUzlMbk4wTHZseG5UMStaSjdieENSOG41?=
 =?utf-8?B?ZkhSU2lTVEtYd29hZDNuZzJ6ZWtUM0FnQ283SGRHb1JWaWx3b2YyM2FPMFJB?=
 =?utf-8?B?QkpWbVY4akhqdmxpcHVDbng3NEowQ3hSVXU1b1pXZDJncWJrM3kxUllTNk9x?=
 =?utf-8?B?blJKczU5VG8yMEp1R0xSdU1iVlc2N2xZN3NVV2wyU1dJTnBxSkJwUm1xeENk?=
 =?utf-8?B?SWFpRHE5ekw5KzVKUkJDQWFvTG5CTWVCaW5SUzFGYTBlTkozamdoTDhla2g0?=
 =?utf-8?B?bVZUT0ptSVZLN2xhaE8wRXRjWlZQT0xMWEZRdG9pUXhHY0hVeUZJSFR2dTBO?=
 =?utf-8?B?Rys3SVdGbHA3bEdjNHBWOUo4TWZHS1BwbkZlZmF2TE9YYjRvUjl5ZFhmNFdv?=
 =?utf-8?B?YkpNMUxyajNXdVJzekxqb2F1dnNYRlp1Y2VHZ3NBUk1VNExzTTNHTlFIaWVI?=
 =?utf-8?B?YUp1OEtuRFJmanVRUUVCN2xlQmtaODR0YUlxK1E2TXJXd1QvS0M3ZEN1bkNG?=
 =?utf-8?B?elJrMlJRZUxaQzg0WDdqc1JDUDhIeXQwdXg1dTJyMVlQZ0RSLzlNUkxZa3BF?=
 =?utf-8?B?a3VGL3BOTXJSbGpTTGVEUCtNSFJLZWZXUzMyNTJZNnhDK25QVnNOMFhXVFR3?=
 =?utf-8?B?c1hHNmNseEhlNDJsVGNaZUVYaHhianQyQnp3d1BmUVBNQURoZU1UT1JyS3VU?=
 =?utf-8?B?RWQ2K0FiNGZHWTNyUjBYZ0ZGTE5PUkM0dWtmQ0JHTFQ3dzREbDByak4zMWVB?=
 =?utf-8?B?K1JyTjM5dWdpMTl5aEpISUNXdVNnSWdERmdObmM3MTF1UGp5TWw5ZDJTQ2c2?=
 =?utf-8?B?Wnp4cUxTcG0xNU1qa3dXUjY0K3BZelp4RGwrQ2hoT1hIbVg0d3RabFIxYnM5?=
 =?utf-8?B?T0hxS1BQSUZ2Ykt4eFpVcjQxV1R3b3ExTFhQUW9YUFJwb3NQTHJjWUZqTTUv?=
 =?utf-8?B?a1VIQ3RYT2V6KzVqdHRiSzI1dHk2MGIvSTJSeGptZjZEa21hdkdETFVkZyth?=
 =?utf-8?B?eGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0F5C7D72D74C047952430A927A62858@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba93940c-96a8-4bd9-121f-08dc28d26fe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2024 18:19:06.4896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SR4/rKS5mgcAff958Q+6hroU3QmQmGmaa/655BB51vxJnPptQiuOXJtXpPQEmTX/9qpIRLc1LX7t6hGS/hMiaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5562
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

T24gVGh1LCAyMDI0LTAyLTA4IGF0IDEwOjA2IC0wODAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiAyLzcvMjAyNCAxMDoxNCwgSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSB3cm90ZToNCj4gPiBE
dWUgdG8gYSBidWcgaW4gR3VDIGZpcm13YXJlLCBNZXNhIGNhbid0IGVuYWJsZSBieSBkZWZhdWx0
IHRoZSB1c2FnZSBvZg0KPiA+IGNvbXB1dGUgZW5naW5lcyBpbiBERzIgYW5kIG5ld2VyLg0KPiA+
IA0KPiA+IEEgbmV3IEd1QyBmaXJtd2FyZSBmaXhlZCB0aGUgaXNzdWUgYnV0IHVudGlsIG5vdyB0
aGVyZSB3YXMgbm8gd2F5DQo+ID4gZm9yIE1lc2EgdG8ga25vdyBpZiBLTUQgd2FzIHJ1bm5pbmcg
d2l0aCB0aGUgZml4ZWQgR3VDIHZlcnNpb24gb3Igbm90LA0KPiA+IHNvIHRoaXMgdUFQSSBpcyBy
ZXF1aXJlZC4NCj4gPiANCj4gPiBJdCBtYXkgYmUgZXhwYW5kZWQgaW4gZnV0dXJlIHRvIHF1ZXJ5
IG90aGVyIGZpcm13YXJlIHZlcnNpb25zIHRvby4NCj4gPiANCj4gPiBUaGlzIGlzIHF1ZXJ5aW5n
IFhFX1VDX0ZXX1ZFUl9DT01QQVRJQklMSVRZL3N1Ym1pc3Npb24gdmVyc2lvbiBiZWNhdXNlDQo+
ID4gdGhhdCBpcyBhbHNvIHN1cHBvcnRlZCBieSBWRnMsIHdoaWxlIFhFX1VDX0ZXX1ZFUl9SRUxF
QVNFIGRvbid0Lg0KPiA+IA0KPiA+IGk5MTUgdUFQSTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy8xMjk2MjcvDQo+ID4gTWVzYSB1c2FnZTogaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzI1MjMzDQo+ID4gDQo+
ID4gQ2M6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+ID4gQ2M6
IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4gPiBDYzogTHVj
YXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1i
eTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyB8IDQ0ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4gICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAg
ICB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3
NSBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9xdWVyeS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiBpbmRleCA0
ZjFhYjkxZGJlYzU4Li5hOTEyYmE1OGVlYjhhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9xdWVyeS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5
LmMNCj4gPiBAQCAtNTE2LDYgKzUxNiw0OSBAQCBzdGF0aWMgaW50IHF1ZXJ5X2d0X3RvcG9sb2d5
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiA+ICAgCXJldHVybiAwOw0KPiA+ICAgfQ0KPiA+ICAg
DQo+ID4gK3N0YXRpYyBpbnQNCj4gPiArcXVlcnlfdWNfZndfdmVyc2lvbihzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSwgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5KQ0KPiA+ICt7DQo+ID4g
KwlzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X3VjX2Z3X3ZlcnNpb24gX191c2VyICpxdWVyeV9wdHIgPSB1
NjRfdG9fdXNlcl9wdHIocXVlcnktPmRhdGEpOw0KPiA+ICsJc2l6ZV90IHNpemUgPSBzaXplb2Yo
c3RydWN0IGRybV94ZV9xdWVyeV91Y19md192ZXJzaW9uKTsNCj4gPiArCXN0cnVjdCBkcm1feGVf
cXVlcnlfdWNfZndfdmVyc2lvbiByZXNwOw0KPiA+ICsJc3RydWN0IHhlX3VjX2Z3X3ZlcnNpb24g
KnZlcnNpb24gPSBOVUxMOw0KPiA+ICsNCj4gPiArCWlmIChxdWVyeS0+c2l6ZSA9PSAwKSB7DQo+
ID4gKwkJcXVlcnktPnNpemUgPSBzaXplOw0KPiA+ICsJCXJldHVybiAwOw0KPiA+ICsJfSBlbHNl
IGlmIChYRV9JT0NUTF9EQkcoeGUsIHF1ZXJ5LT5zaXplICE9IHNpemUpKSB7DQo+ID4gKwkJcmV0
dXJuIC1FSU5WQUw7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWYgKGNvcHlfZnJvbV91c2VyKCZy
ZXNwLCBxdWVyeV9wdHIsIHNpemUpKQ0KPiA+ICsJCXJldHVybiAtRUZBVUxUOw0KPiA+ICsNCj4g
PiArCWlmIChYRV9JT0NUTF9EQkcoeGUsIHJlc3AucGFkIHx8IHJlc3AucGFkMiB8fCByZXNwLnJl
c2VydmVkKSkNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gU2hvdWxkIHRoaXMgbm90IGFsc28g
dmVyaWZ5IHRoZSB2ZXJzaW9uIGZpZWxkcyBhcmUgemVybyBmaWxsZWQgb24gZW50cnk/DQoNCk90
aGVyIHF1ZXJpZXMgZG9uJ3QgZG8gdGhhdCwgbGlrZSBkcm1feGVfcXVlcnlfZW5naW5lX2N5Y2xl
cy5jcHVfdGltZXN0YW1wLg0KSSBndWVzcyB0aGlzIGlzIGVub3VnaC4NCg0KPiANCj4gPiArDQo+
ID4gKwlzd2l0Y2ggKHJlc3AudWNfdHlwZSkgew0KPiA+ICsJY2FzZSBYRV9RVUVSWV9VQ19UWVBF
X0dVQ19TVUJNSVNTSU9OOiB7DQo+ID4gKwkJc3RydWN0IHhlX2d1YyAqZ3VjID0gJnhlLT50aWxl
c1swXS5wcmltYXJ5X2d0LT51Yy5ndWM7DQo+ID4gKw0KPiA+ICsJCXZlcnNpb24gPSAmZ3VjLT5m
dy52ZXJzaW9ucy5mb3VuZFtYRV9VQ19GV19WRVJfQ09NUEFUSUJJTElUWV07DQo+ID4gKwkJYnJl
YWs7DQo+ID4gKwl9DQo+ID4gKwlkZWZhdWx0Og0KPiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+
ICsJfQ0KPiA+ICsNCj4gPiArCXJlc3AubWFqb3JfdmVyID0gdmVyc2lvbi0+bWFqb3I7DQo+ID4g
KwlyZXNwLm1pbm9yX3ZlciA9IHZlcnNpb24tPm1pbm9yOw0KPiA+ICsJcmVzcC5wYXRjaF92ZXIg
PSB2ZXJzaW9uLT5wYXRjaDsNCj4gPiArCXJlc3AuYnJhbmNoX3ZlciA9IDA7DQo+ID4gKw0KPiA+
ICsJaWYgKGNvcHlfdG9fdXNlcihxdWVyeV9wdHIsICZyZXNwLCBzaXplKSkNCj4gPiArCQlyZXR1
cm4gLUVGQVVMVDsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAg
IHN0YXRpYyBpbnQgKCogY29uc3QgeGVfcXVlcnlfZnVuY3NbXSkoc3RydWN0IHhlX2RldmljZSAq
eGUsDQo+ID4gICAJCQkJICAgICAgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5KSA9
IHsNCj4gPiAgIAlxdWVyeV9lbmdpbmVzLA0KPiA+IEBAIC01MjUsNiArNTY4LDcgQEAgc3RhdGlj
IGludCAoKiBjb25zdCB4ZV9xdWVyeV9mdW5jc1tdKShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4g
PiAgIAlxdWVyeV9od2NvbmZpZywNCj4gPiAgIAlxdWVyeV9ndF90b3BvbG9neSwNCj4gPiAgIAlx
dWVyeV9lbmdpbmVfY3ljbGVzLA0KPiA+ICsJcXVlcnlfdWNfZndfdmVyc2lvbiwNCj4gPiAgIH07
DQo+ID4gICANCj4gPiAgIGludCB4ZV9xdWVyeV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpDQo+ID4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4g
aW5kZXggNTBiYmVhMDk5MmQ5Yy4uNTJhNjlhNmYzMjdlMCAxMDA2NDQNCj4gPiAtLS0gYS9pbmNs
dWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gKysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0u
aA0KPiA+IEBAIC01NzQsNiArNTc0LDM2IEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfZW5naW5lX2N5
Y2xlcyB7DQo+ID4gICAJX191NjQgY3B1X2RlbHRhOw0KPiA+ICAgfTsNCj4gPiAgIA0KPiA+ICsv
KioNCj4gPiArICogc3RydWN0IGRybV94ZV9xdWVyeV91Y19md192ZXJzaW9uIC0gcXVlcnkgYSBt
aWNyby1jb250cm9sbGVyIGZpcm13YXJlIHZlcnNpb24NCj4gPiArICoNCj4gPiArICogR2l2ZW4g
YSB1Y190eXBlIHRoaXMgd2lsbCByZXR1cm4gdGhlIG1ham9yLCBtaW5vciwgcGF0Y2ggYW5kIGJy
YW5jaCB2ZXJzaW9uDQo+ID4gKyAqIG9mIHRoZSBtaWNyby1jb250cm9sbGVyIGZpcm13YXJlLg0K
PiA+ICsgKi8NCj4gPiArc3RydWN0IGRybV94ZV9xdWVyeV91Y19md192ZXJzaW9uIHsNCj4gPiAr
CS8qKiBAdWM6IFRoZSBtaWNyby1jb250cm9sbGVyIHR5cGUgdG8gcXVlcnkgZmlybXdhcmUgdmVy
c2lvbiAqLw0KPiA+ICsjZGVmaW5lIFhFX1FVRVJZX1VDX1RZUEVfR1VDX1NVQk1JU1NJT04gMA0K
PiA+ICsJX191MTYgdWNfdHlwZTsNCj4gPiArDQo+ID4gKwkvKiogQHBhZDogTUJaICovDQo+ID4g
KwlfX3UxNiBwYWQ7DQo+ID4gKw0KPiA+ICsJLyogQG1ham9yX3ZlcjogbWFqb3IgdWMgZncgdmVy
c2lvbiAqLw0KPiA+ICsJX191MzIgbWFqb3JfdmVyOw0KPiA+ICsJLyogQG1pbm9yX3ZlcjogbWlu
b3IgdWMgZncgdmVyc2lvbiAqLw0KPiA+ICsJX191MzIgbWlub3JfdmVyOw0KPiA+ICsJLyogQHBh
dGNoX3ZlcjogcGF0Y2ggdWMgZncgdmVyc2lvbiAqLw0KPiA+ICsJX191MzIgcGF0Y2hfdmVyOw0K
PiA+ICsJLyogQGJyYW5jaF92ZXI6IGJyYW5jaCB1YyBmdyB2ZXJzaW9uICovDQo+ID4gKwlfX3Uz
MiBicmFuY2hfdmVyOw0KPiBUaGUgYnJhbmNoIGNvbXBvbmVudCBzaG91bGQgYmUgZmlyc3QgcmF0
aGVyIHRoYW4gbGFzdCAoZWFybGllciANCj4gYXNzaWdubWVudCBvcmRlciBzaG91bGQgcmVhbGx5
IGhhdmUgYnJhbmNoIGZpcnN0IGFzIHdlbGwgZm9yIA0KPiBjb25zaXN0ZW5jeSkuIElmIHRoZSBi
cmFuY2ggaGFzIGNoYW5nZWQsIHRoYXQgdHJ1bXBzIGV2ZXJ5dGhpbmcgZWxzZS4gSXQgDQo+IGlz
IGEgZnVsbCByZXNldCBvZiBtYWpvci9taW5vci9wYXRjaCBiYWNrIHRvIDEuMC4wLg0KDQpXaWxs
IGNoYW5nZSwgdGhhbmsgeW91Lg0KDQo+IA0KPiBKb2huLg0KPiANCj4gPiArDQo+ID4gKwkvKiog
QHBhZDI6IE1CWiAqLw0KPiA+ICsJX191MzIgcGFkMjsNCj4gPiArDQo+ID4gKwkvKiogQHJlc2Vy
dmVkOiBSZXNlcnZlZCAqLw0KPiA+ICsJX191NjQgcmVzZXJ2ZWQ7DQo+ID4gK307DQo+ID4gKw0K
PiA+ICAgLyoqDQo+ID4gICAgKiBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSAtIElucHV0IG9m
ICZEUk1fSU9DVExfWEVfREVWSUNFX1FVRVJZIC0gbWFpbg0KPiA+ICAgICogc3RydWN0dXJlIHRv
IHF1ZXJ5IGRldmljZSBpbmZvcm1hdGlvbg0KPiA+IEBAIC02NDMsNiArNjczLDcgQEAgc3RydWN0
IGRybV94ZV9kZXZpY2VfcXVlcnkgew0KPiA+ICAgI2RlZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZ
X0hXQ09ORklHCQk0DQo+ID4gICAjZGVmaW5lIERSTV9YRV9ERVZJQ0VfUVVFUllfR1RfVE9QT0xP
R1kJCTUNCj4gPiAgICNkZWZpbmUgRFJNX1hFX0RFVklDRV9RVUVSWV9FTkdJTkVfQ1lDTEVTCTYN
Cj4gPiArI2RlZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZX1VDX0ZXX1ZFUlNJT04JNw0KPiA+ICAg
CS8qKiBAcXVlcnk6IFRoZSB0eXBlIG9mIGRhdGEgdG8gcXVlcnkgKi8NCj4gPiAgIAlfX3UzMiBx
dWVyeTsNCj4gPiAgIA0KPiANCg0K
