Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A6CEE14D3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 20:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F5B10E203;
	Wed,  6 Sep 2023 20:34:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6EC10E203
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 20:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694032463; x=1725568463;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=MFtIfwZjRPbwHUmBoHDE5K0xMKsOJ248l2n0e05jF2A=;
 b=HSVmqK0FITcspMdhWwr4CqOabmYIeDsY2r06S81JT/wYOtuoGgR0dZNU
 Tmt35zHOGGiITXV5ytGOkGWHzI7j1y2DpZPqNqZ/Naga8Sh7PxwBDMDYH
 Ww2dRlSLSHACsPkpgvh/fgCRWiJoSP4XCuZqdR10RW0V4r4d9MQg5gXqE
 bpJ33pfABW7Ucyt4391jhyhBq+gwDrfjcytqm67Zz2dxRVvamUtrhG2FW
 78861TmT1BRr6+aVS7Hjt1wtf5U2wk83+8/kvhUVjxEPgMBqDxKh1nyNi
 x9ONDk3dAASUxAo+V0+AQx4CYUf7SNnwavK0IlTgIG2VpLSEaqYUYYOqj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379886004"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="379886004"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 13:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741708078"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="741708078"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 13:29:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 13:29:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 13:29:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 13:29:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtbnABXpm+aRAAP0c3ICAf+2yB2SEN2sv043FKuFHF8EOPeoqw/ubYXyFK4U/qFQchYtQMzXgAwF2C0hRCaRhsHci/cvm5WdVCsu/GUE77q9zzmWlgvMAvImrkdsc1WuOE4hzVIn6Is8uaiiFFxrFPCTXUF4DbfXXK5PXIeg44fvGfGzuCz601T3qhKW74k2RV1nk45IOnyUEJ/AkMJrAGTLEUoICwlX2oU91RGa7S8lxFCbGL+4DxZiL/lDh1svZ0q9wVWzQ/RhiSqfdVw+RCwEhyMauDplmSwuP8NVJiikP5OdaQED2QZPCYTFQQmeNUcO+QFgFXcKjHTNrnQ5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFtIfwZjRPbwHUmBoHDE5K0xMKsOJ248l2n0e05jF2A=;
 b=JZNqdutEYjeOSJBdoJXJstIoz0bAfWQTKFsV0saefIgx0JxR/IGiEZD8ZCzpwbOPWHWq93HGz5D2LwwT//jb55HiikE2MNABHDZhKMbUn+LrntEZVCc/jQxacr7wmtjATVrBF8mpwT+BBWKwo1Yof0GIgmhsNQGTSmkaIq9+Tx0GrCQZMrCPxfLgutB7sbglyrtUGs+2bsqlMmXkdt/L8+3vRvVFaFVgU1VKyaDmmqdCJRV8b5faKBMG+YGRzIIOR1U7nLy+N+gYbERMRvaMUlJEJqOmm6xk/sHH1ry/GBqMyZxVq6tw5m+leIgf0Sx8xvzXuJKv1g6QWsGeXv3LEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA3PR11MB7488.namprd11.prod.outlook.com (2603:10b6:806:313::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 20:29:03 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de%4]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 20:29:03 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 0/4] Fix LRC workarounds
Thread-Index: AQHZ4GBqvnGHPIvedUutgTN19Pwn97AOQMmA
Date: Wed, 6 Sep 2023 20:29:03 +0000
Message-ID: <86d0f250ff448197ee59632030a4bd5ff0ab3912.camel@intel.com>
References: <20230906012053.1733755-1-lucas.demarchi@intel.com>
In-Reply-To: <20230906012053.1733755-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA3PR11MB7488:EE_
x-ms-office365-filtering-correlation-id: ce571b42-428a-4cbf-c0ea-08dbaf17e924
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RovqCyiWef1ijsN3ne/S2CMwDjWIZFIwEBRNUEOtCHC301qm5zNG7HUU5kDT9LfKc8hbKxgYvqpE2vhUSXYd6nL8zKvsKlnJkxGN+9km6MhH2r+3t0cPB9rnxL+ars+tV7FCr19dt76wEg5aDEllXjXBfjns01r1iTLGXZ6KdiSjqI8Pr6lFGEPZauXMA469uSHaH4Bd/UkAudQiRUuhmokFzhuzQP3hW3YInV6avJOTsBovO+tAELIcKgx5YXyG4sP0eXAt58zfn4PVdfL8YhhtJJ0yre41ZDmf+W6WKGV5U4aVd/B+1HrIjRoBWIiEJyDbZFnqq8vl9TRABMp5U+1kEqxn4mQn13CrKw2ScGyKE2KecQVjZOnjPRnhwBHwyDrFvRisRn2NKIa6ubMiSzTNMM3ffvmtfIkQZhCCoIaLp6oefV+Rxs0YJBD1r71GktTt9bSbn/AFyQhXhnS68fWRXIML/2PNdcIukPtLRMcRWLcLFscKZqzriE3VVf3yNfgbuDZ4dRDR5uf7ecT3VibrvTMLCRlWJ8eEWeQATWVd8eIz/2u2EBAaG6O44BLs5MpXJEoZdD5Jcaf77sTlU7qagY/EUDpWK2AJvMqnpBuDMT2GRAgfXTK3o84UDSD2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(1800799009)(186009)(451199024)(38070700005)(122000001)(82960400001)(6486002)(6506007)(71200400001)(36756003)(86362001)(38100700002)(2616005)(4744005)(2906002)(26005)(478600001)(6512007)(83380400001)(110136005)(91956017)(41300700001)(8936002)(8676002)(5660300002)(316002)(66446008)(64756008)(66946007)(66556008)(66476007)(6636002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0MyTEwrWUx3eExYTmZPRmJJalZCOWg4R1hTellsTTA1cURrcFVBeE5BdEpl?=
 =?utf-8?B?UGlHQUZxTXdDWGtoZXZRUGc0MURoSURPQVBoWGVDRDFaL0tHbUJpSEpTQTNa?=
 =?utf-8?B?dUJvQmdsazFqa2Zib0IzUkNDVjVnT0tpVytKMlRpZjF0d1V5MFUxRUllRExX?=
 =?utf-8?B?MGZscldNZlBGRXlJekdRSWZ0d01TNjd4WGkyVTVjcjBoU0NTZW93WkJVcXh5?=
 =?utf-8?B?OC9aWUNxLzVCb0FTWklBL0VZcEhTT2VpMEtVd2szWnBDR2FNc1lFeWMvSUww?=
 =?utf-8?B?TXZ0aVEzcGNURFdpeHhHZVcrMm1aL2pkVXBwYlh5OUJRSVdjNVB0VVNtU09r?=
 =?utf-8?B?c1NnVnpnYnpqUVhQcFZSczJDZ0E4RkxjZUNWc2ozWnRPbVJCRndEY1ZNUHFk?=
 =?utf-8?B?VHFmejFxdkY4c3kzUHJBS1NxZkVZYytjQnpkdTZrUHNTWVh2Q3ZrRFlISEVi?=
 =?utf-8?B?VFBZVEpWYVpieW9wMFBncVhrMkErNlhFbmhqRnpCNFhSU0U1NFE2S1R5bE1L?=
 =?utf-8?B?cERKR1dqNlZ0WU9tVCsxWFhmTVhkU2k5b2NldkROeDd5THBzRW1BMnNGcTdB?=
 =?utf-8?B?OXg5SGxidmlCTzMxa3Ftd0h1RExiME53OG1wd3FnbDU2b3BhMGEydFFnc040?=
 =?utf-8?B?TXlRZEhiUTFPODU1MVZUZFBnZ090c1kvZ1RRaEx5bDBVN2kydjRtbEpjZmgy?=
 =?utf-8?B?dEdzQjk1SWdHVHErS09sZEVNVkhBNHBjN2czNHM0N1dTc3NjUy9rb1NxYmZV?=
 =?utf-8?B?OGFUM05ScFhBeURFOVlDRzFQSksySGY5NllYeTloVk5LdDVGcGt1YnhZeG5J?=
 =?utf-8?B?by8wQmhWOHcxRk5obVpCUlNMcGhwL3liYzlvSTdVYkRkTmdWQjk1OVp4VGN6?=
 =?utf-8?B?K2VVcWJrTjZuL3U5eVlTbkJsSi9HVVRTZ1ZDNFp3b0RpVzZKOHlMWDlOK3c4?=
 =?utf-8?B?aDl3ZDlwbnk2SHlJeDJMNDZKSTk5U1dqMFBzTElMUUtFQzViQVZkV1JIaDZG?=
 =?utf-8?B?c21RVVVDYWc3MnJVVFc5N0t0QlhYckZPVFBkcU1ONXdnM1Q0VUFMallJcUth?=
 =?utf-8?B?SmkxNG9NSk45TE9XMnIyRnpndUtZSlpOcXpXU0c0ZGMyL1Vic0pSZDVaZ1hY?=
 =?utf-8?B?OUNack5IUmx2bzA4eE8wbU9NSVdGMXpZODZZU3hFZys3MXVEazhBTHhBTFZS?=
 =?utf-8?B?YThGblJLWTF0dXVPU0tCZzlRZER4MDQwdkhXOE9zTUdiQTdLczhQUXVDcnda?=
 =?utf-8?B?MG9pMGxoaFp3Nk5wMlRpR2tyTTZ2SnhzclQ4ZkhKNFYzR2JDTFBaWktKNEt2?=
 =?utf-8?B?NlNqcFBJeVlaclUzWW91QnBaZENOTVVrM05GdGxUZFZKTVFkN1RkWGpvOHFO?=
 =?utf-8?B?MGhSZUlVUkdnRzNibERpaEdmaFF1K3cvL3NnQXB0dDV1ZEc0U3pEeUxySC9U?=
 =?utf-8?B?Q2c4bWpPNkRrcFU3a2d4VW40NXRKMm5BN0VaTnNtbUFBUGFzam4rWFFleTJ6?=
 =?utf-8?B?Rm5SaFRrMGpiWk9FOU1TalpJUGtvWmdGdlY1WDBOYm9JRWlVM2hrZWlIdEtO?=
 =?utf-8?B?VFcvNmdVQ1o5aGMxLzZpWXVUWTBBSkRaWmZyQm5PWWU3UmJYYm52Ty9CT00y?=
 =?utf-8?B?L1JRY0xoMzJZK3JEaHhFWVcrczBtU2xDVTVDSXpPMUJ4d0ROTStCVzhmM2N3?=
 =?utf-8?B?dWhoM25xYlVkWGZtMlp3RGx2dWEya3FKMEFmOVNRbUs3dkhkVzVVVWNhU2xV?=
 =?utf-8?B?Q1RYOUFpdUl1U3hPNFZYMnRqemlucG1TbWgvZEFRTjg0MGczaFlpZjhXV1B1?=
 =?utf-8?B?SDg2OFBuUE5XNkNuRktVem9nMzhJOGg0dHRLYjRkeGZBRU5qT1kvZWJCODI0?=
 =?utf-8?B?d0ZCYWdaaUo2TmdVRk9LcytEcmV0OWRoaGF0ZEYvaUJvbHVLYjZWakJyclVu?=
 =?utf-8?B?RXdvTUNlRVJHTWtFK00yREhXVS9sRExCVTduc01iZVNVSFBOdnA0dXMrZldT?=
 =?utf-8?B?Vk0yc1FjN25vbFpncGxMZVB4L3lQdWJYSGFvdnN0TnRsRDhxRWlTT241L1Bz?=
 =?utf-8?B?Y3F5UitjTFNWWmhLWWIxSlBuNGJWL3hZc3VRVjJDTEtmQU5wTEU2WVRVcjJw?=
 =?utf-8?B?K2ZieWNVREswRHdPTjMwNmJLckc2UXVQMjlKQTBwU2UyN0NoekE2SzFLRjE5?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F25F1959E52ED9479F2D2A0C2180265C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce571b42-428a-4cbf-c0ea-08dbaf17e924
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 20:29:03.3250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3nJjFgevEDIGoXZxVGSKCdOBhq2segXHYYopNbXYfI2JExM5IkhhlK21bUd2EyubNALorr1yMaxAOIMo7UiPkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7488
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/4] Fix LRC workarounds
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

T24gVHVlLCAyMDIzLTA5LTA1IGF0IDE4OjIwIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IFNpbXBsaWZ5IGFuZCBpbXByb3ZlIGxvZ2dpbmcgZm9yIEdUL2VuZ2luZSB3b3JrYXJvdW5k
cywgdGhlbiBhcHBseSB0aGUNCj4gc2FtZSB0byBMUkMgd29ya2Fyb3VuZHMuDQoNClRoYW5rIHlv
dSBmb3IgdGhpcyBzZXJpZXMsIGl0IGZpeGVzIHNvbWUgZmFpbHVyZXMgTWVzYSBoYWQgaW4gQU5W
L1Z1bGthbiBkcml2ZXIuDQoNCj4gDQo+IHYyOiBDb252ZXJ0IHRoZSBhcHBseV9tbWlvIGZ1bmN0
aW9ucyB0byB4ZV9ndF8qIGxvZ2dpbmcgYW5kIHVzZSB0aGVtDQo+ICAgICBmb3IgTFJDIFdBcyB0
b28uDQo+IA0KPiBMdWNhcyBEZSBNYXJjaGkgKDQpOg0KPiAgIGRybS94ZS9yZWdfc3I6IFNpbXBs
aWZ5IGNoZWNrIGZvciBtYXNrZWQgcmVnaXN0ZXJzDQo+ICAgZHJtL3hlL3JlZ19zcjogVXNlIHhl
X2d0X2RiZw0KPiAgIGRybS94ZTogQWRkIGRiZyBtZXNzYWdlcyBmb3IgTFJDIFdBcw0KPiAgIGRy
bS94ZTogRml4IExSQyB3b3JrYXJvdW5kcw0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dC5jICAgICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9yZWdfc3IuYyAgICB8IDE2ICsrKysrKy0tLS0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3J0cF90eXBlcy5oIHwgIDUgKysrLQ0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA0NyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gDQoNCg==
