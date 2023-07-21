Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4A1EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 20:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E390B10E6F4;
	Fri, 21 Jul 2023 20:35:32 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D403110E6F4
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 20:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689971730; x=1721507730;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=N9Atm5EPqtEL8nyxvMO01NetLe4wfBL6PgNIBfc2pq0=;
 b=Py//lwix3o2fv+avxrPXi+atn5jyEz9F0qX7tze0GpMr14rAH87+eGJV
 X1rvgvCr8Zs0HomZUdWFs/sG3eCmMaoGbkL0lxZUYEpKPEDaSKpp2lJvJ
 6A0NyA5Uaxcty9dYLCqg8ErGrQKp3zr3EzBmCgNcZvSayswOgKDKgO0ys
 f4fqh6MlSzesO0agsTzcQDKw/rdznsD4a9BAHWoKJiWuUHkDJPQMSJj2l
 MnzOlBzZTfdlpQgw5B3U6ta9CoQxlG68dptmLQXJFEWEeHvu3R2Eb+wST
 56i+RhAkyg1CS8zSgetrv6AO6+2iTtO8Zm6k7bbUJTvtgRyvYJS1ouKGj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="364574597"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="364574597"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 13:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="718967909"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="718967909"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 21 Jul 2023 13:35:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:35:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 13:35:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 13:35:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9xljpaFSnH7VEMSktp6NWocgQvVLNSwEiHPttugSrP2w/U09x9Ey+9WPPzO17JIkWUgfzDYf9Wbc6dSkSWh1fyG7HHee/cmEBvSCQzq1AMTrNZtsVS7Kovf9HG/BSzVEu0JGVJA/fOUmYFFEdSOOAUowEuW4/5wL+PR8a+YkazjGtuyqpnfhbre+9HPCOXsqJbFzbupwy3LN11rqI++m4y+RC5yudYRDsQoVoE4mO9WVY0hw/MGSva8V2YhjsBb3QlibyF1lPGNFfaZixMl91iGp5hExClu+tlVjL2saqZOtabnRydP9qnkMO98eUXrE5Q40ARdRcv7yRvACfyFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9Atm5EPqtEL8nyxvMO01NetLe4wfBL6PgNIBfc2pq0=;
 b=crQdV3XcrNATTZXSy/NVngdGKreyyRS7Hl+EKCqE2+YRPsFOq7fSBzYQCgkigpAMrl6RQ9WgaeY55J77Ri8otEa8LgNny92e6rly8BGXip7tHEJCfkVFP/9o3X23guX6vrkknZ/9/bxjZ/jNN126sCsrY5cVoBewUB71m9+37zLLNLDAnYlkrK6YwyyrIju+jRfYea52NtZwf41vHT4OUTyPVKlf8iObZMc2ruyfGCKWImpr1ob928L85Ug8ykV3R1LVoceLeU15BUKx4/uDsqMwqJJraGNxs2BKc5iv7iQmNMjDBdn1/Az1PV7D3JRuz9hRG1wIHHCorVHxVZkr3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 20:35:27 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 20:35:21 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/3] drm/xe: Invert guc vs execlists
 parameters and info.
Thread-Index: AQHZvBEScNfW3Ys9vE6kbyeHgFgbj6/ErZYA
Date: Fri, 21 Jul 2023 20:35:20 +0000
Message-ID: <99c711d701b68fd2eaf5b41ab3df53715bcd382b.camel@intel.com>
References: <20230721202144.269837-1-rodrigo.vivi@intel.com>
 <20230721202144.269837-3-rodrigo.vivi@intel.com>
In-Reply-To: <20230721202144.269837-3-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA1PR11MB6733:EE_
x-ms-office365-filtering-correlation-id: f7dfdba3-0e83-4628-2984-08db8a2a00ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yel+2okTDc2XAfNgaYCrZ6omysQLDDTsLVUlVtmWJOYWq3JEy73CPgv0JmdxM2XyuNCqGEPBxIGYwSAmmR+Mmf4uK3GsuMmQHCCgdTiL27RD3lOMgnMYEVydhYYyNhv3B4UjPzQsMdgQc+k0/I+CljJkKPruj/9DdY25kkFtWWv6vp4F3WZjWfelykih6OVoofWztIanh5/fqk72c/Seh3bna1VeXtVS2rKB4zLdcK0YPiDux9oX7EbD6acTYl7o/cFxSbaC/3Ohg0eI5y7rIODS58WOhex+RJ0f+e/sl3oy2FWXM1MyX+mlm5wmniswJJiQfPXq/Dhix9g95WZRdERQa+NKERt8D0cBV6OaWxcydC6UvHpegYX5A7CqTpbCPbL746w2p7jwD5NiLhmH9NB/+sfpERRV8AeeNuu/as0P9i5uJq0sjxkcXo8J/f6KUW14wrCSqMrCyAkNq9cAM2Pbnnjndh09Q4bqA9k9lb1Hqt+aO13WP6+MAPDmGAQ/M4EnJaYsHITK9RejU1qodNhUX4GmUQids2i5uQ0U+6yZotucfmcuRzhjLcmJrjCm8LJqF/3781Szf81093ScsrbFYo7HUzCNciZPseOGECJQR6w1JVRrn3WvE53z7NK+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199021)(41300700001)(110136005)(8676002)(8936002)(5660300002)(316002)(6636002)(64756008)(6512007)(6486002)(38100700002)(66446008)(66556008)(66476007)(66946007)(76116006)(91956017)(86362001)(71200400001)(83380400001)(2906002)(36756003)(478600001)(38070700005)(82960400001)(122000001)(6506007)(26005)(186003)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDkrd3dna2FQclJRRWpiQktob1Z4WktTTjdvU2l0MVExWnY0VW91TE9kRHFK?=
 =?utf-8?B?bWc5R2tyZUw0R2JiNncyQTUrVHROamRTd0FOL09VNGU1RmtLU1NqNC81Y0ha?=
 =?utf-8?B?cDRBTDM3UjZvYW92SDlVa2ptVkhNdWo2Y3FwM2M1RkI3L2pDS3JDZFlzVHd0?=
 =?utf-8?B?MDNKNHZGWUdHZmFvdkVUU25FY1lxY1NocEhCRWl4R1l5YkpHVnJQUWo0WFFU?=
 =?utf-8?B?V1dKV0RMcWI1MG9Yc3RuSFUxNnlCU2lpMUxVS1BzT0V0VW1qanBRNDZYM2pW?=
 =?utf-8?B?WTExWGVRVzJ3ME5EbEhMOWU1VDVZSXFKMHdSLy8vc1hhZm0rbHp3UWc2d2dL?=
 =?utf-8?B?RDcycmhFZGFuQ2ZrTzQ3ZVZKTzkxd1hvcTRrMlBaZVBxMHM3MVlDaU9xUVFL?=
 =?utf-8?B?N0RDWnNpWFgxUVZDMmF1aTBYSlc5R0JIZFhOUzAxcS9UdjdVdS9QRmdGQnpa?=
 =?utf-8?B?MHNGUHQ4ZmwrdEhrcW93OWowTEY4c3FwZy9rcUsxTVNUdnJVWEQrUENRZzBI?=
 =?utf-8?B?eEEwRS82R1Ezcm9HUk9aZFZYaGRNR0FlRkJEYXhoYWdWT2J3djdNRy9jalF6?=
 =?utf-8?B?aVd2YThiSThjQ2tjcThhMVoySTZvZk0yb0lDc1pTbUJza2ZUeUEwVDlrRDJ6?=
 =?utf-8?B?eWxjRFN5SkpxNWU2bXI4eHNoUXlpQk8rYTJ6Y1NRK0VieTZHaG14UU1YcTJv?=
 =?utf-8?B?eDRiay8zRHVHQ1ZlMkUxSElrZUp0d1M2dWt2UjErN0NCcmRQd0tvWTlkOWdp?=
 =?utf-8?B?bnFDNExWMUt1T0hkbUUyRWxKcXMyTjB4MWJiZEY2M3crWG5nblhlSmREbUlP?=
 =?utf-8?B?OEpQYUpZUUJ5cjFBK3VVTG1BMWE1cnFkQWZUTTJqdTB4NlFFd2xEMWJVRjEy?=
 =?utf-8?B?RWgwcmNKU0RJc0d5OVQvb2RMdDc4ZEJuSEdNY2lSRjhOM2d4ckVUb3pzdVI2?=
 =?utf-8?B?bkQ1NmJoelNZRjY3VzlLVG9ZWWV2MTNlZFVJcTdNK202NTR3TEtVanBTTDhh?=
 =?utf-8?B?cHhHZVBVb25veis3UVB2MnVuZVRtSlNmemNjYkxycU9NUld6QU9NM3h1bGpS?=
 =?utf-8?B?RzhjVVBhWWN4TW1DbmxwYVgxb0w2STRTMSsvZzJYTnRsZE5GMGpCR2ZKanJ2?=
 =?utf-8?B?Z2N1YW5NUEk0MmZPVHJyUFNNTithb2hVMEI1cmRDNlVjTFpTcmZvU25TSDBW?=
 =?utf-8?B?Z01DMXVUQnRyNUJDNCtUM0ExaGRtMVFqbFpYYVc5ZG8rSnBDK2JJZWE3YWto?=
 =?utf-8?B?amIvLzE2enBocXhtWnFiL1dPYzEyY2hWVWtEUnQraVh3YWxFZU5QUDBmNi9t?=
 =?utf-8?B?cU5Ec3BrV200V2o1Uy8xcXh4TGNLOEpPa3hmQzdaWHQxcmFWaEphbVdWQ2JO?=
 =?utf-8?B?ZG12VGdZZXpUdWRoZ3N3OWllZ0w0RGx0WlFpN2RxSnVZaEkyalZvZU91NDk5?=
 =?utf-8?B?RXkrSlhKYmtnamk3d2taV0pjeFhmRUdDZzNpdENmamQ0b1kvWVArQndKUUZs?=
 =?utf-8?B?TU5BbGhkdnlMby9BYlY0KzI3Qkd1aU5RV3djUnlkZy9DRi9YSHo2K0NuTUtr?=
 =?utf-8?B?S0V6SXd2QnRucDVnVHQxN3UyMVZGR3ovbEhPaHNOaGhpL2E3Nm9aU3FpOTJZ?=
 =?utf-8?B?QzhBSjBOYVlkUFVUWDR0ajJ0T1htTUpYU3l3SUhQTmxWcXR4N1dzSmdnOUtL?=
 =?utf-8?B?RlZDKzlXLzhONjZYTVBuV2pnclQrUGdWY2laeWt6eHdrVDlZdzhHSHFRRXIw?=
 =?utf-8?B?WmtTSG9pelFFbHFHakI4Ri91STB5bmJkaURjQ3ZyQ1hSMldtUmkrN0F2WFdq?=
 =?utf-8?B?R2x4RTVRZWl6SUp4VUFkQkpoNG1EZWxvTzBHUEM1T2FKNWxSY3FKWjdWOHRP?=
 =?utf-8?B?UTFWdU0xVHFpSEg0Y0FFOWkwMHJPcmF1SE4xd291Y0VFNXo2dUJYRTBVQldp?=
 =?utf-8?B?Y05qM3RXNUFWQ21CUittSElPckNvTm8zT2oxU3ZBaC9rL3NNNlAwQXM5MnBD?=
 =?utf-8?B?aEpHRGRwWVVaM1Vad2FuQkNxU1JzNGFCM2x4VVROeVVOdzVPa05laEhHQ0o5?=
 =?utf-8?B?bit4dm5BcDB2ZFdLU01aK1ovQzNKZzFJT24zdVhjVmlaZHFtdjd4NzVwcGp2?=
 =?utf-8?B?VWZ3QnhCZmgwZXpBT1hnODlxNi9iZHFDRit0OHpvdE56aUhrWnFPY1JkbTdl?=
 =?utf-8?B?V1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BE069BA3B8A8843B1357E77B33FEAF0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dfdba3-0e83-4628-2984-08db8a2a00ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 20:35:20.9559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n4vPj8Kud/U5KLrShZmvfJ3cPBYoROhVwtJNBB5nywT+1IHjfPyQ86W9LhjP/DnZkF5OsfsrXEsJoW6H+9z1sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6733
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Invert guc vs execlists
 parameters and info.
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

T24gRnJpLCAyMDIzLTA3LTIxIGF0IDE2OjE5IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IFRoZSBtb2R1bGUgcGFyYW1ldGVyIHNob3VsZCByZWZsZWN0IHRoZSBuYW1lIG9mIHRoZSBvcHRp
b25hbCwNCj4gZXhwZXJpbWVudGFsIGFuZCB1bnNhZmUgb3B0aW9uLCByYXRoZXIgdGhhbiB0aGUg
ZGVmYXVsdCBvbmUuDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3Nl
LnNvdXphQGludGVsLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxy
b2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZWJ1Z2ZzLmMgICAgICB8IDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyAg
ICAgICB8IDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaCAgICAgICB8IDcg
Ky0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oIHwgNCArKy0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmMgICAgICAgfCA2ICsrKy0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX21vZHVsZS5oICAgICAgIHwgMiArLQ0KPiAgNiBmaWxlcyBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGVidWdmcy5jDQo+IGluZGV4IDA0NzM0MWQ1Njg5YS4uNDkxNTA2YTFlMTJlIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMNCj4gQEAgLTQ3LDcgKzQ3LDcgQEAgc3RhdGljIGludCBp
bmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkNCj4gIAlkcm1fcHJpbnRmKCZwLCAi
cmV2aWQgJWRcbiIsIHhlLT5pbmZvLnJldmlkKTsNCj4gIAlkcm1fcHJpbnRmKCZwLCAidGlsZV9j
b3VudCAlZFxuIiwgeGUtPmluZm8udGlsZV9jb3VudCk7DQo+ICAJZHJtX3ByaW50ZigmcCwgInZt
X21heF9sZXZlbCAlZFxuIiwgeGUtPmluZm8udm1fbWF4X2xldmVsKTsNCj4gLQlkcm1fcHJpbnRm
KCZwLCAiZW5hYmxlX2d1YyAlc1xuIiwgc3RyX3llc19ubyh4ZS0+aW5mby5lbmFibGVfZ3VjKSk7
DQo+ICsJZHJtX3ByaW50ZigmcCwgImZvcmNlX2V4ZWNsaXN0ICVzXG4iLCBzdHJfeWVzX25vKHhl
LT5pbmZvLmZvcmNlX2V4ZWNsaXN0KSk7DQo+ICAJZHJtX3ByaW50ZigmcCwgInN1cHBvcnRzX3Vz
bSAlc1xuIiwgc3RyX3llc19ubyh4ZS0+aW5mby5zdXBwb3J0c191c20pKTsNCj4gIAlkcm1fcHJp
bnRmKCZwLCAiaGFzX2ZsYXRfY2NzICVzXG4iLCBzdHJfeWVzX25vKHhlLT5pbmZvLmhhc19mbGF0
X2NjcykpOw0KPiAgCWZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpIHsNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2UuYw0KPiBpbmRleCAxYzU3OTQ0MDE0ZTAuLjcyMjE4MDZjMTY5MyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2UuYw0KPiBAQCAtMjAzLDcgKzIwMyw3IEBAIHN0cnVjdCB4ZV9kZXZpY2UgKnhl
X2RldmljZV9jcmVhdGUoc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+ICANCj4gIAl4ZS0+aW5mby5k
ZXZpZCA9IHBkZXYtPmRldmljZTsNCj4gIAl4ZS0+aW5mby5yZXZpZCA9IHBkZXYtPnJldmlzaW9u
Ow0KPiAtCXhlLT5pbmZvLmVuYWJsZV9ndWMgPSBlbmFibGVfZ3VjOw0KPiArCXhlLT5pbmZvLmZv
cmNlX2V4ZWNsaXN0ID0gZm9yY2VfZXhlY2xpc3Q7DQo+ICANCj4gIAlzcGluX2xvY2tfaW5pdCgm
eGUtPmlycS5sb2NrKTsNCj4gIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZS5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+IGluZGV4IDhiMDg1
ZmZkYzVmOC4uMGVlNDQ4NTZhZDA4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+IEBA
IC0xMTIsMTIgKzExMiw3IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHhlX2d0ICp4ZV9yb290X21t
aW9fZ3Qoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ICANCj4gIHN0YXRpYyBpbmxpbmUgYm9vbCB4
ZV9kZXZpY2VfZ3VjX3N1Ym1pc3Npb25fZW5hYmxlZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4g
IHsNCj4gLQlyZXR1cm4geGUtPmluZm8uZW5hYmxlX2d1YzsNCj4gLX0NCj4gLQ0KPiAtc3RhdGlj
IGlubGluZSB2b2lkIHhlX2RldmljZV9ndWNfc3VibWlzc2lvbl9kaXNhYmxlKHN0cnVjdCB4ZV9k
ZXZpY2UgKnhlKQ0KPiAtew0KPiAtCXhlLT5pbmZvLmVuYWJsZV9ndWMgPSBmYWxzZTsNCj4gKwly
ZXR1cm4gIXhlLT5pbmZvLmZvcmNlX2V4ZWNsaXN0Ow0KPiAgfQ0KPiAgDQo+ICAjZGVmaW5lIGZv
cl9lYWNoX3RpbGUodGlsZV9fLCB4ZV9fLCBpZF9fKSBcDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlX3R5cGVzLmgNCj4gaW5kZXggMGNiNmIwZDViZjlhLi5iMTU2ZjY5ZDczMjAgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gQEAgLTIxNyw4ICsyMTcsOCBAQCBz
dHJ1Y3QgeGVfZGV2aWNlIHsNCj4gIAkJdTggc3VwcG9ydHNfdXNtOjE7DQo+ICAJCS8qKiBAaGFz
X2FzaWQ6IEhhcyBhZGRyZXNzIHNwYWNlIElEICovDQo+ICAJCXU4IGhhc19hc2lkOjE7DQo+IC0J
CS8qKiBAZW5hYmxlX2d1YzogR3VDIHN1Ym1pc3Npb24gZW5hYmxlZCAqLw0KPiAtCQl1OCBlbmFi
bGVfZ3VjOjE7DQo+ICsJCS8qKiBAZm9yY2VfZXhlY2xpc3Q6IEZvcmNlZCBleGVjbGlzdCBzdWJt
aXNzaW9uICovDQo+ICsJCXU4IGZvcmNlX2V4ZWNsaXN0OjE7DQo+ICAJCS8qKiBAaGFzX2ZsYXRf
Y2NzOiBXaGV0aGVyIGZsYXQgQ0NTIG1ldGFkYXRhIGlzIHVzZWQgKi8NCj4gIAkJdTggaGFzX2Zs
YXRfY2NzOjE7DQo+ICAJCS8qKiBAaGFzXzR0aWxlOiBXaGV0aGVyIHRpbGUtNCB0aWxpbmcgaXMg
c3VwcG9ydGVkICovDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxl
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmMNCj4gaW5kZXggNzVlNWJlOTM5ZjUz
Li5kZTg1NDk0ZTIyODAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tb2R1
bGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmMNCj4gQEAgLTE0LDkg
KzE0LDkgQEANCj4gICNpbmNsdWRlICJ4ZV9wY2kuaCINCj4gICNpbmNsdWRlICJ4ZV9zY2hlZF9q
b2IuaCINCj4gIA0KPiAtYm9vbCBlbmFibGVfZ3VjID0gdHJ1ZTsNCj4gLW1vZHVsZV9wYXJhbV9u
YW1lZF91bnNhZmUoZW5hYmxlX2d1YywgZW5hYmxlX2d1YywgYm9vbCwgMDQ0NCk7DQo+IC1NT0RV
TEVfUEFSTV9ERVNDKGVuYWJsZV9ndWMsICJFbmFibGUgR3VDIHN1Ym1pc3Npb24iKTsNCj4gK2Jv
b2wgZm9yY2VfZXhlY2xpc3QgPSBmYWxzZTsNCj4gK21vZHVsZV9wYXJhbV9uYW1lZF91bnNhZmUo
Zm9yY2VfZXhlY2xpc3QsIGZvcmNlX2V4ZWNsaXN0LCBib29sLCAwNDQ0KTsNCj4gK01PRFVMRV9Q
QVJNX0RFU0MoZm9yY2VfZXhlY2xpc3QsICJGb3JjZSBFeGVjbGlzdCBzdWJtaXNzaW9uIik7DQo+
ICANCj4gIGJvb2wgZW5hYmxlX2Rpc3BsYXkgPSB0cnVlOw0KPiAgbW9kdWxlX3BhcmFtX25hbWVk
KGVuYWJsZV9kaXNwbGF5LCBlbmFibGVfZGlzcGxheSwgYm9vbCwgMDQ0NCk7DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmggYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfbW9kdWxlLmgNCj4gaW5kZXggNzE2OTkwN2MzMzY1Li4yYzFmOTE5OWY5MDkgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tb2R1bGUuaA0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfbW9kdWxlLmgNCj4gQEAgLTYsNyArNiw3IEBADQo+ICAjaW5jbHVkZSA8bGlu
dXgvdHlwZXMuaD4NCj4gIA0KPiAgLyogTW9kdWxlIG1vZHByb2JlIHZhcmlhYmxlcyAqLw0KPiAt
ZXh0ZXJuIGJvb2wgZW5hYmxlX2d1YzsNCj4gK2V4dGVybiBib29sIGZvcmNlX2V4ZWNsaXN0Ow0K
PiAgZXh0ZXJuIGJvb2wgZW5hYmxlX2Rpc3BsYXk7DQo+ICBleHRlcm4gdTMyIHhlX2ZvcmNlX3Zy
YW1fYmFyX3NpemU7DQo+ICBleHRlcm4gaW50IHhlX2d1Y19sb2dfbGV2ZWw7DQoNCg==
