Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E8DC4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 20:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEC610E3FA;
	Mon,  6 Nov 2023 20:30:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D0C10E3FA
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 20:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699302654; x=1730838654;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LNQIaTrOIy9i6eaJpTdx8dVnFDSsBFPG57qHl/qXxSo=;
 b=AeZZqxhx80TzzvFW5sMh2YdvzLZSADxbDmlXISj4MbpJ7uNzB8iLLjJo
 4Zp4o3gRlI1O9hu9qxjbDHzdZr7J6BL1LZapCvsuUs59czUKAMn3ufCP+
 5biOuHjDnL0PARianVpjx+uEmTSn1eB5ez7Eds3SReWULn1mDfvB2WViC
 AIXpr7XLUJAkBsW0jLpt2mEmfGUOyIjOtBBnDjdrft9Hs/UCU/Qi+rVyV
 I0jImGHwxWoQffjPvBcUFuRj1YGspxSs3UE0+UBOCEoDTpJZ6SOOuqZjh
 r0dLv5NgxaccgqSsbfUSJ1hJMeXqF5k/WgRT5/XQ19NHOs2R+S2Rw0arZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="389171213"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="389171213"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 12:30:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="1093902772"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="1093902772"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2023 12:30:52 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 12:30:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 6 Nov 2023 12:30:53 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 6 Nov 2023 12:30:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogMSWgFSkf9BL4DaCJ+YLoVmeHG9qVD1pX2/5PJaWYlPnALw5lPeSHqyUTIkXtoxp/3oSf9OfgOUXoPSxAllr92W4CGzE/bXj9MVg5wi88eWIzKZICoJhoBvqCWLz5VvBRGpa+KN9ZE8nQ1rvBTsO8HVtm3QcZBbg6EibZFZirVCH6y0QhWMTlHmgGgGSe8GeCHAwIA7UAoUnA68wFdnRR+ecVxYqjGGmaTdOEjNFzVqIN6G6eDsmlSvdbFMomNZd6EGTP3/rkfMrHRAHKfm1r4RwIv/6iFf+xo3x8DhAQWCvsWG2RJKIVbboemf/OdxPcD1h75u0ZMYFsA13fNQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNQIaTrOIy9i6eaJpTdx8dVnFDSsBFPG57qHl/qXxSo=;
 b=eAZXgux3NqcWTvbWrgTw6IpSqwAOKoQp/EOHNgMsXpMtHnqAIbLZ7gu75yaUsOUtaoCAy923nOmX5ZYPoJQbJ2+g7EX79UPlozy9mUfKRKsjwV1gxqRFqqxOXtfOj/oPCA3uaYS6L7NpXrxVCEMBF7pB54/C4ZvOv87+/4u0HNncdoahKsqYPyFYOMBLmQdheRiqk3aW84X5tLMurqQDSgQbxEd3Nt/2PRArfDsyhg9HBaAZbQ7zbIqIPYQoH4o7gNc2lK8cE2uJtSO81aJSEN7a4RfK7dNyFdj82HSeUOCW5dMNOhz2jDtlpuUU/u1hBA8Tix++qNlwMJI1FmbNpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by PH7PR11MB7643.namprd11.prod.outlook.com (2603:10b6:510:27c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Mon, 6 Nov
 2023 20:30:46 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::dfa4:95a8:ac5:bc37]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::dfa4:95a8:ac5:bc37%4]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 20:30:46 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Prevent null ptr dereference
Thread-Index: AQHaDppBx+gpPkJdIE6uyU2+b8lfP7BtufkAgAAHEmA=
Date: Mon, 6 Nov 2023 20:30:46 +0000
Message-ID: <PH0PR11MB5782FE8704BD97023EC56EDB82AAA@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20231103211924.426715-1-pallavi.mishra@intel.com>
 <921e39ea-5e8c-4787-9077-a16666af24ed@intel.com>
In-Reply-To: <921e39ea-5e8c-4787-9077-a16666af24ed@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|PH7PR11MB7643:EE_
x-ms-office365-filtering-correlation-id: 204294c7-f321-4c91-d1ac-08dbdf0741bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GblvoDHPkYm5YECVJ10hniP9yWhqgmW++glfh+0T/+vcX1cSRJL4oLFv2X+o6C4kfDM327B1sDETW5SDdPp2bv8adnKJZzEvmHxr331/ymsPxUg43Pz5Fe25pZRUowPwxmuvVRGNN9AWWR7g+CCg8J2PQGudlGYU5Xvv6XtfTYl97xb8x1uzD6D8ZMarbpFQvIyV3Y1Yk8bgagvXEUSApmH8oLCcbr9dwjYpwxb+fq5PGPA/elp3SIYScyWrwDCV6AjYG3luD9Jn5ejE5NRRbti+OsvPkGtA+lmaR8D4SuCHCK74N1W8IynAhNXv9eR2K3j2L5H+NiwhZuFQ1FYzyF572xOW7DpEfe8Vz+0R20n53WMtyGKl0s7cNHvVokRdtY8UDp9d17jQQ1MTYTcOzOlqarYjG0aWpf16uyKRajvbZ+6FvEEUeBjyWOGLHjcjAR4ARiL/PxQSbts0tQ+/eFn6DXFPZux/KTdfrulHAtvEi71qKByeWpFvv6HwDRnaGK+OnWKvR0VXzH08/G5euLeNX3UsGEmrRdeVcaXuulAJQ5KVW767U2BAY/fSyDaJKgiMBGEOlrtPqaNMYZXzI3PwUQfK5RjjAsGyeganF+EISCaRc306AaaPk7083MOE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(26005)(86362001)(33656002)(122000001)(82960400001)(38070700009)(71200400001)(53546011)(55016003)(5660300002)(41300700001)(478600001)(2906002)(316002)(52536014)(9686003)(8676002)(8936002)(6506007)(66476007)(66556008)(64756008)(110136005)(76116006)(83380400001)(7696005)(66946007)(66446008)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TW9Ua2JZalR3N0xMRFBFa1BXbEg0d0lpcS9rZnp0VXJsUjJYUHdhOXJ3NWx0?=
 =?utf-8?B?WFo3ZUxJR3BwVHJacmV2cWZEOGJQbzIvUnBoWTF0U0VrU2NabGpmZzVub2FK?=
 =?utf-8?B?bkdHZ0pxVzcwVzRpRUd0cHdWVURtek01WXZtMnA4ZFVhOEVReWNtZkIzWWN4?=
 =?utf-8?B?RzMzY3B5M2o1cDBwVXJkVGdVTHcybHVJRDFCN2F3YlkvaThZa3A4N3N3YlVh?=
 =?utf-8?B?Yi9BMjVZR2Q5ZlgrM1A3TExYMXVoYXQvaGsrY3FFcE5aRVJOb3d1blF4VElm?=
 =?utf-8?B?QmsrN3YrRzZabWpEOVJ2WFdaZC9FVUc1OUVqMzhWNmR3TjYrNkV4ck56QWd5?=
 =?utf-8?B?bHlVTjlTajJTaFRQaktWZHV5UlpDV3Q0aTVZcW56ZmhqUmtzdTNPeHVQcHlj?=
 =?utf-8?B?K0ZRMm5BWTFibFhHUHZyN1V1ZHdXbHNMYnlqQ2lTa2xIRExBTFp0eExQMDVE?=
 =?utf-8?B?QjM5SG1EdWJoYjhjMytoN1p0TVUvV3BOQmRid21HMzVsck5TbG84NlVLakov?=
 =?utf-8?B?bDI4bEJobjFqSmZTTGgyRDNla2k0b2xpU2l6V2NTcEdzbWdkdE9zbVBPUk1T?=
 =?utf-8?B?VDJZUmxtM2R2T1hpQUo4SGJ3QjFESUZnc0Y0bjhYblY2UXg1eituREJFSUFy?=
 =?utf-8?B?MGRiUjlXSDhEQWRyUHpQeExLMEYreVNQUnZRTDdwZklDVXlXNFhWYmU2MW9m?=
 =?utf-8?B?NjZHRE82MG0xb2tjRHhHWkhCb3pSY1R4VVBFYkVadGtNSStWVXIwbDBFbm1o?=
 =?utf-8?B?QmZZa21DU1d5TW1ta3FrM1ZIL2xPZzcyd3FrZExBOUJMMHJZR0Q3U0JCTUZa?=
 =?utf-8?B?SzRzQmcvaWhxRDEzSDd0bGJVQVkxSEo2QXpLN1F5WUtJVDN4N2RMa2lGTWN5?=
 =?utf-8?B?OVQ0dWkyaTFTWkpXOEw1aDBBdHdPNVFUb2lRSWgwTmJEYVN5UFF6Ym1Vd2Nh?=
 =?utf-8?B?dmhhNHFUOW9JemdibDhmRmMrQnVER0tPWWRYK0ZKb25yRGFaTFZOQmVDcFRW?=
 =?utf-8?B?OXNpR3cySjdUVzhSVGFZTzJlVnlUb3ZzemtMRG5mcUtkblVXOVBmbDByN09m?=
 =?utf-8?B?aXlFY0svVWQxcGtxdGUxb29SQWluVVVLZ1NRaUYyVktacTFlMmFWdko0aWRG?=
 =?utf-8?B?MUh4NzFGVlRjKytlNFlodlBiZjBacll0cjRjdVZlU01reVdobElrMVJKeDJV?=
 =?utf-8?B?aUFRRGVWYlB2WHo0bzlPdVBrV1g3azVhK3JJNUZSSXEvcVRpaUFmSk9yQ3pn?=
 =?utf-8?B?ZldJayt2QUZsU2d4by9CZEloVURpMUMxREZIeW4zTVFLQzNWSG93ODU2Sjc4?=
 =?utf-8?B?VmtJOWM4b0x2NEJtZFp0cFNvZEZZKzM3Y1M3c3RidlRwMW1qUTRCUWw4ODNK?=
 =?utf-8?B?VFpXR0huTG0wcGpNbzYzaU9FaTdZbUYwU1oySE4xTDllandBZGtiYi9aRUlC?=
 =?utf-8?B?anVwd2hMaHhNWlNOWWVEcy9VeXozVjhCNzZYUnp6Y1FiUStwVzNyNnNaV0Ja?=
 =?utf-8?B?ZEN4L3JyT0JrdmFGYVA4aGhVbW84VDVvRCs0QUZhVk1ZaUJpcTdrSzdTM2l2?=
 =?utf-8?B?NGNYZU16eFNKTnpORUtsb2lhWGZzaXBBVnpSNWNTUnU2bVpvNXNEb3pXaGE4?=
 =?utf-8?B?YjY5TkhPS0haVk9tMGJneXJhZGQ3V0dUcnlVVUR4TS9oNDlqNU9TZGxUUWl1?=
 =?utf-8?B?aUNmVmRwVk1YT2lwM1h0MkZmd1gyZFJ1bzgxeXd2MmRrcHZ1Lyt4eGtyZjZ2?=
 =?utf-8?B?SHVPaUNLNnAyazhVVHJqR1J1KzNCeSs3cnlwdStHSU5Hb3NRSkd0Z2gwdGZX?=
 =?utf-8?B?T1Q1U0dpTE1LTm9tV2xFNS9OT3E4VnVsZGUxZnRBU1A1TVV6NDJGdEcxaUJX?=
 =?utf-8?B?Q1VnLzJwU1BHM2VuOEpTOUxaQ2hSR29BREU0b0E0OEszRGFMTDZWWGJKUDQ3?=
 =?utf-8?B?SzdPZjN4c0VpSUhRK2NZSWZiYTlHdDl5WW5McmMzSWpIcGhuTXR1RHJzOGdQ?=
 =?utf-8?B?MTR0NGpHdzNMZkk4YmphbEZ4Nnc1bzIyaUVDSU5TN1VzQ3hoZVRnN0lHV0s0?=
 =?utf-8?B?TWFDNGxybmNCYUVGU1hqaXU4UWRIcmtOcDBUZy9Ma205NFNTOHdmUzJhbk5G?=
 =?utf-8?Q?RXMX5LJcbIVEPBAudcXdH4m6O?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204294c7-f321-4c91-d1ac-08dbdf0741bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 20:30:46.3632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0awBp3pyzEFzj+yxRgpmmVuZhCoZSI76j+tg8Nsh1qsiIDdgZjSYT55Kjbta8dYSTB80RvOaHD0OzcVdIR1u66JNVRKGCVxmMA0MCoueddc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7643
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Prevent null ptr dereference
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2VsdHksIEJyaWFuIDxi
cmlhbi53ZWx0eUBpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgNiwgMjAyMyAx
MTo1OCBBTQ0KPiBUbzogTWlzaHJhLCBQYWxsYXZpIDxwYWxsYXZpLm1pc2hyYUBpbnRlbC5jb20+
OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtJbnRlbC14
ZV0gW1BBVENIXSBkcm0veGU6IFByZXZlbnQgbnVsbCBwdHIgZGVyZWZlcmVuY2UNCj4gDQo+IA0K
PiANCj4gT24gMTEvMy8yMDIzIDI6MTkgUE0sIFBhbGxhdmkgTWlzaHJhIHdyb3RlOg0KPiA+IElu
IHNjZW5hcmlvcyB3aGVyZSB2bSBpcyBub3QgaW5pdGlhbGl6ZWQsIHVzZSB4ZV9taWdyYXRlIHRv
IGdldCB0aGUNCj4gPiBhZGRyZXNzLg0KPiANCj4gQ2FuIHlvdSBkZXNjcmliZSB0aGlzIHNjZW5h
cmlvPw0KPiBJcyBpdCBsZWdhbCB0byBjYWxsIHhlX21pZ3JhdGVfdXBkYXRlX3BndGFibGVzIHdp
dGhvdXQgYSB2bT8NCj4gV2hhdCBjb2RlIHBhdGggZG9lcyB0aGF0Pw0KDQpJIHNlZSB0aGlzIGlu
IHhlX2xpdmVfa3Rlc3QgaW4gbWlncmF0ZSBzdWJ0ZXN0LiB0ZXN0X3B0X3VwZGF0ZSBwYXNzZXMg
dm0gYXMgTlVMTC4NCg0KPiANCj4gSnVzdCB0cnlpbmcgdG8gdW5kZXJzdGFuZCBpZiBzaG91bGRu
J3QgYmUgaW5zdGVhZCByZXR1cm5pbmcgYW4gZXJyb3IgaWYgdm0gaXMNCj4gTlVMTC4gT3IgdGhh
dCBpc24ndCBzb21lIG90aGVyIGRyaXZlciBidWcuDQo+IA0KPiAtQnJpYW4NCj4gDQo+IA0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogUGFsbGF2aSBNaXNocmEgPHBhbGxhdmkubWlzaHJhQGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMgfCA1
ICsrKystDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUu
Yw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYyBpbmRleCBlNmEzMWY5MGVi
ZGIuLmY3OWVjOGU0YWU0ZQ0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9taWdyYXRlLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5j
DQo+ID4gQEAgLTEyOTYsNyArMTI5NiwxMCBAQCB4ZV9taWdyYXRlX3VwZGF0ZV9wZ3RhYmxlcyhz
dHJ1Y3QgeGVfbWlncmF0ZQ0KPiA+ICptLA0KPiA+DQo+ID4gICAJCQl4ZV90aWxlX2Fzc2VydCh0
aWxlLCBwdF9iby0+c2l6ZSA9PSBTWl80Syk7DQo+ID4NCj4gPiAtCQkJYWRkciA9IHZtLT5wdF9v
cHMtPnB0ZV9lbmNvZGVfYm8ocHRfYm8sIDAsDQo+IHBhdF9pbmRleCwgMCk7DQo+ID4gKwkJCWlm
ICh2bSkNCj4gPiArCQkJCWFkZHIgPSB2bS0+cHRfb3BzLT5wdGVfZW5jb2RlX2JvKHB0X2JvLCAw
LA0KPiBwYXRfaW5kZXgsIDApOw0KPiA+ICsJCQllbHNlDQo+ID4gKwkJCQlhZGRyID0gbS0+cS0+
dm0tPnB0X29wcy0NCj4gPnB0ZV9lbmNvZGVfYm8ocHRfYm8sIDAsIHBhdF9pbmRleCwgMCk7DQo+
ID4gICAJCQliYi0+Y3NbYmItPmxlbisrXSA9IGxvd2VyXzMyX2JpdHMoYWRkcik7DQo+ID4gICAJ
CQliYi0+Y3NbYmItPmxlbisrXSA9IHVwcGVyXzMyX2JpdHMoYWRkcik7DQo+ID4gICAJCX0NCg==
