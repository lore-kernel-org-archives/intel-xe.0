Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FB2C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 18:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B721126F6;
	Fri, 22 Mar 2024 18:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMV9A7y8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBCD1126F7
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 18:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711132654; x=1742668654;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XbzQH+vqloIRnFctuVFore9sW67py/EqlT9GYfzeFlw=;
 b=CMV9A7y8ogDNomliqlUWOb+cvQGl16cY70uYI3A/VyYXYGfOOw811o1m
 y2rrIfGAp3xroOUFR19+7RErDc1Baeb5Ax0nZhe6S3jBv1F2NJDeQ15+p
 GaosNk5OX8SBfI6AYzzYPlfv/40c6ZziZDkEYwZeZYoTBEvK7UWjYdRGh
 rBrwDBXG05uKwssUh2+//Gh7y5W4F8YqBibm8B4nRCZQ+TLtAfO/1j4m0
 Ll5b+XgxVzOWETRoAzE2GKkij314VWeQxj9hm88zK0qL+gb5hbDcPChkK
 nXiX3NQZ9n09L84mTuEqqBfej602wgt+GrQRNZiTiX7pj69Hx3lbUUKOU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6027579"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6027579"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:37:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19559330"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 11:37:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 11:37:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 11:37:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 11:37:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fwu7lXuWSNm1CaEZZ7q65JbetctGn6EcQ/WEu+tnZtCBpkVuXb6z6tlVYzLEUL+S+QxW3EDmLXl5t2rko553dAeZCMRq/KIkeiM17gA6BpVjvaQYV7QbYhx+UTwuKZqpKGPIpIzvwI7ShkrgjbQfK4araOOXGHpCIsqxUicwfcyRYvHz/kTStX8o0lavaGXX96R1DYsMTG3emBsW+Cufcn1aveY7KjLmCo0Ur1yRJp3UfXSzd4deWo+z3lDYgaFa41uQsAwT9TNtZESENHsi8mb56OMmUmGDbQzhGLy66XrgvlRxiNDlUg1zPMvEu4bVqDUGzmH3BINl67CWGzMETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbzQH+vqloIRnFctuVFore9sW67py/EqlT9GYfzeFlw=;
 b=h8vv81+M93QvZWAkhdfj39+OOgWahwUIs926aaG0/UeLTQsM+gpswIwkK4mTf3Iu8TRcT8wkaJDhh7Ei/MnKOpA2Z5f+ROSaK/sq8zouPmmL1Hzg4jOXrTViCfLejOMJCrzUgRxu85EQ/vW7CYkjPHQWgqNJrsutGWNbsz1W4BKGo19MX0iLV0vQkUsdIVQJYkI99KUSpE/9ve65NR6auOPOFbj05zP6YYIiNr6W6HjDvi4p1npLaEeVR/iLJqti35vi2dy26VS3Qxauiocwub2ZjqiPF4dzuYFO5+Ivne89swR7UNIUEvJYENXDE/11ihPF41sGE420M4HEhflzcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 22 Mar
 2024 18:37:30 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 18:37:30 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v6 0/8] drm/xe/guc: Add GuC based register capture for
 error capture
Thread-Topic: [PATCH v6 0/8] drm/xe/guc: Add GuC based register capture for
 error capture
Thread-Index: AQHaegrqUXaKghHnyUW/Q8HLczM2hbFEAAAAgAAb5IA=
Date: Fri, 22 Mar 2024 18:37:30 +0000
Message-ID: <545e620aef74383ae1137dd4dc3cf98020d60968.camel@intel.com>
References: <20240319143621.371087-1-zhanjun.dong@intel.com>
 <c8d124823fe7da90916042fcd09edd6e550bd5bd.camel@intel.com>
In-Reply-To: <c8d124823fe7da90916042fcd09edd6e550bd5bd.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW4PR11MB7164:EE_
x-ms-office365-filtering-correlation-id: ccf6fa45-08ba-4f04-6652-08dc4a9f218f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K7DE8BDDTN7XDVW9qhmr2jm3UBDCIfrGH8Lcw4iM4q3/iYOrdBd4GKjUqP5jisIEwG0IHAbF7RgOKV5tOotH0elPT6hEMxePJksX79buvhgSLiNXSVPBZAmfC24ivNp2ZlSTCyzwDYlPxHgC/CcScLlb46biIZTq3sy2jUKVXGftIP3cVGzuF5oSmmVfP84GyEBdQGTeMzZ1tcfTmnKDvowblaCZyxcUH8F70beQPe9x25xGlUG8F8HuwAr+MUunSFLKwh1iKeFAgTd2VcyxcdFsnP69jkrn76xVtH4Ztqgvmcb6roLBhHvEbvh0Ir9JrXPvGQMdKIc2ZsJ8V67DAmTDKDqUvYk2H0KAwdVzMHadberqKOIlEitt0Vkvn3xDEDdvAE5+5IDiJYPKZOlml9lEWY6abw57MyRI02yBRl/fyaVnSV680fyEl/Nxr/OQCwg6tMgi+0MDxUg4g980FIwKgvnTM6z/4eRckR73CvJ0CXW5hD1pELUh6isYjxt67T3cLXN6iW8swYnYxtyRCUKWV+qVLRvFAZAY2tnE4JLTERlzrOINLjJKDnZ/sTIELpX4FERp7P3ZmktYaZR7LKxe7yYi3lrY9hPgmO+8Y+embJrU+UCEK2Br1WdeSz3bmScPeFSS/bO9fFjDZ68YuT+exrFGiyWZ4R+/l6YEMNqEY3gM0bhWcwvw40E7oxrs9U5s+0Q0KRoYrsjGQzGVdsaHwImuQezwtFP/MaT3jJw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXlmRFJlUG1xWlZlK3NuVG1FU0FtWkt3eGxVVDdjMjVMK0FvS3BaMmhtNkhq?=
 =?utf-8?B?ZGlIVWlrb3BIY0RTQjhIU01KSlBXaHhveHZEZTluR1B4Qk1oSEFiVHJSdE9Z?=
 =?utf-8?B?U2FpcnZQY1RUT0FzaGRVU0NsdmVZUlVJcVRGZ0Rrb1BYMGFLeXFGMmpJa2pl?=
 =?utf-8?B?RDMwczhlTll3WmRCOWtOUVlBVm04SGRQMnpENnBtb00zYVloRUVMTHhDTWx3?=
 =?utf-8?B?MnFQZnVWRFRpMlVDVjZoOUZyQzkzeFFBdWsycGpCdmhxL2RYK2lUMk1LVFY5?=
 =?utf-8?B?OUV6Z3Q5SkRpWTVjUU1aMUw2UzFsTy9IcitwN0VBWnJMYUR1N014T2xNcUU1?=
 =?utf-8?B?SHVsbFp5MFdKdzIrYTU5YjNNSmppR28ySUhCb1pxb3RaVm1RQU13WVhVSmgy?=
 =?utf-8?B?WU9DV0dyTHd4NFRkS0JMMmFVUGlodzdid3R3Yi9qUVUrQ2NmUjhMVERCZ0Zi?=
 =?utf-8?B?b0ZwZzJGU0JyVVU1bGRMWEdHK2RUTytiNzhYTjRSdklkYlJCSG1EUnhra0Nq?=
 =?utf-8?B?N1k4NDA0V3ZKRFA4ZlFPUlRkMDl4WlBMcTdzckNNQ2xKUExndW0zMnI4ZTBU?=
 =?utf-8?B?WlU0L3JOTEoxTm9XeTNrbENvMnNvK0tjZTdidHppenlpR1BTNGpFT2xiY3Ji?=
 =?utf-8?B?djdHeklHRHJlWkt4NGVZUGVrUmdqamxnQmM4dG1ZbW5FN2ltUk1Qa282ZFB6?=
 =?utf-8?B?S0t3UlAxY2dEWURMMFRUSllXZmpUbjIrYVZrTWhoL240cWMrR05LaG9rWXRy?=
 =?utf-8?B?Y2x6ZldmNTlDdjVOVzhob0V3NG1BUll2MDRieU1CS1RoZm1pRGY5c01BeTdm?=
 =?utf-8?B?UjhLLzlHcTZGK0xtaEVGMzRMb29ZSjhzZW9KOHVPeXA4dDY1YXVZTzlWVmNV?=
 =?utf-8?B?Z0N5eWU5VGZKZWtXM2hEZWJMc1dCZmdyM211M2VXTXNzNm90b2hrUVZCMzN6?=
 =?utf-8?B?L0VVZ0wyL2xMUXVPL1RuZHZTeEkyQUNXTTdVWHFyTE05a0N5dTArTzh6aFlT?=
 =?utf-8?B?UDE3dENPWDhTcW5CK29aT2k1UUEyN3VPRjluOENZRUJ1cjVWeXlQR3lUTmN6?=
 =?utf-8?B?TlJ5eEdXZGJoVllVaWowemdNWmd6YjVBRXdkeWJyVTdwSDJWa1ZjUGFRY0JW?=
 =?utf-8?B?bVk4cFZnUDcxU0srVFZKYmt3bEw4REhybU9hUlJSRDdWUWVDVHB6aUQveXRP?=
 =?utf-8?B?YXQ3blNHa09pRGphdGszaGZ1V3dxanhWRXNnand2RjRnamE4UGYxTmVMRmdx?=
 =?utf-8?B?a2tpM2N5Wk5OSFBuYWdTWnhucnBWeUErdkhtRkJYejl3bDRBc1pUNFYzY0sr?=
 =?utf-8?B?ZHpqYkxteHRxYVVjMzIwczMrQUs5Q3lTVEVWK2lYSFVGTE1rSk5jUWhNdTd1?=
 =?utf-8?B?K3oyOXkzT204THNpMFpHMlJ2dTRIdEF0a2xEZjlWODZNeGo5eEJqYnI5VGpV?=
 =?utf-8?B?MVF6empGbUJQNEhaM1RUUzRsRUQvbWtoTzZmaUp2TFd6Sy9VN2kzMDFXQmdX?=
 =?utf-8?B?Vlpxa1RnOUozN2ovaVZpRlJYOHJUZlIrVFJOT1FHdzIvQzk0V3UySWpNZmla?=
 =?utf-8?B?R0dDbDZ2eHY3TG9Fcm5lYUVlN1VpVyt0MmpDV0NtNGk2b3Y0UmhIYk1TeU8w?=
 =?utf-8?B?SXppdXBQRllvK2h4MHEwRHIwbGdzRUlNQkpWbnlpamlMM2ZrS3l3TC9Sby82?=
 =?utf-8?B?RUJZUERqMkpSLzh5NW5zNmdHRFBRcjZNdHM2RHVGWGNuTHBVRkdHUzNxTlh0?=
 =?utf-8?B?b012N3BMWUducnloclhRV3hqaDlFYTN6UnVlaldQY1hBVDVISGZ0TTZ2ZTNo?=
 =?utf-8?B?alA2RUg2dzB2RzJSQ3I1ZXljNzM3RVdzVHdNYUtVNkZ5L1VJN0lLVVVjYmNF?=
 =?utf-8?B?U2hMU1ZpVy82NzJWa085anI5WmdhZDA0Y3kyTTdqTXdpMnFEMGlGaU9mM2NV?=
 =?utf-8?B?MndCaGdNcHAzaU5kQUZ4bGNWZFFkZXpOK1ZoZGF3a2dmc0xHUXIvUG1icmZO?=
 =?utf-8?B?emRFRU9XcndQa0pFbGRZcWRsbkh2NU5SL2N4NVcyeGdBdW0rZWZDTThad0F1?=
 =?utf-8?B?U0ZLSUdselQySlhZNmk0ZWdLQlZWSWNaWE01NjlJdXgzUms0eno5LzJBck9r?=
 =?utf-8?B?OWJxUk5KT21rWW1JRktDNjNtdjd1RXVWSzdKMTV5QjJrRm1ZMlNCYlFvb0E5?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B603AD0BAFC7AF4D9BF8DFCAF493F8C8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf6fa45-08ba-4f04-6652-08dc4a9f218f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 18:37:30.2661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: knXIu/yZD+W0825le8uVxedrW76QbtidtZdJDFaMHFRgFXVQQl4hFL9qryJFOpNdNN4cTeRRWY8yqEND61HF1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7164
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

T24gRnJpLCAyMDI0LTAzLTIyIGF0IDA5OjU3IC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBPbiBUdWUsIDIwMjQtMDMtMTkgYXQgMDc6MzYgLTA3MDAsIFpoYW5qdW4gRG9u
ZyB3cm90ZToNCj4gPiBQb3J0IEd1QyBiYXNlZCByZWdpc3RlciBjYXB0dXJlIGZvciBlcnJvciBj
YXB0dXJlIGZyb20gaTkxNSB0byBYZS4NCj4gPiANCj4gPiBUaGVyZSBhcmUgMyBwYXJ0cyBpbnNp
ZGU6DQo+ID4gLiBQcmVwYXJlIGZvciBjYXB0dXJlIHJlZ2lzdGVycw0KPiA+ICAgICBUaGVyZSBp
cyBhIGJvIGNyZWF0ZSBhdCBndWMgYWRzIGluaXQgdGltZSwgdGhhdCBpcyB2ZXJ5IGVhcmx5DQo+
ID4gICAgIGFuZCBlbmdpICBuZSBtYXAgaXMgbm90IHJlYWR5LCBtYWtlIGl0IGhhcmQgdG8gY2Fs
Y3VsYXRlIHRoZQ0KPiA+ICAgICBjYXB0dXJlIGJ1ZmZlciBzaXplLCBuZXcgZnVuY3Rpb24gY3Jl
YXRlZCBmb3Igd29yc3QgY2FzZSBzaXplDQo+ID4gICAgIGNhbHVhdGlvbi4gT3RoZXIgdGhhbiB0
aGF0LCB0aGlzIHBhcnQgYmFzaWNhbGx5IGZvbGxvd3MgdGhlIGk5MTUNCj4gPiAgICAgZGVzaWdu
Lg0KPiA+IC4gUHJvY2VzcyBjYXB0dXJlIG5vdGlmaWNhdGlvbiBtZXNzYWdlDQo+ID4gICAgIEJh
c2ljYWxseSBmb2xsb3dzIGk5MTUgZGVzaWduDQo+ID4gLiBTeXNmcyBjb21tYW5kIHByb2Nlc3Mu
DQo+ID4gICAgIFhlIHN3aXRjaGVkIHRvIGRldmNvcmVkdW1wLCBhZG9wdGVkIGNvbW1hbmQgbGlu
ZSBwcm9jZXNzIHdpdGgNCj4gPiAgICAgY2FwdHVyZWQgbm9kZSBsaXN0Lg0KPiANCj4gSnVzdCBz
b21lIG5vdGVzIGFmdGVyIHRyeWluZyB0aGlzIHRvIGRlYnVnIGEgaXNzdWUgd2l0aCB0aGlzIHNl
cmllczoNCj4gDQo+IC0gQ09ORklHX0RSTV9YRV9DQVBUVVJFX0VSUk9SIGlzIG5vdCBhIGdvb2Qg
bmFtZSBmb3IgYSBjb25maWcgdG8gZW5hYmxlIEd1QyBiYXNlZCBjYXB0dXJlLg0KPiAJLSBpbiBt
eSBvcGluaW9uIHRoaXMgc2hvdWxkIG5vdCBldmVuIGV4aXN0LCBhbHdheXMgY2FwdHVyZSB3aXRo
IEd1QyBpZiB4ZV9kZXZpY2VfdWNfZW5hYmxlZCgpIGlzIHRydWUuIA0KPiANCj4gLSBjb3JlZHVt
cCBkb24ndCBoYXZlIHNvbWUgcmVnaXN0ZXJzIGxpa2UgU0FNUExFUl9JTlNURE9ORSwgUk9XX0lO
U1RET05FLCBYRUhQR19JTlNURE9ORV9HRU9NX1NWRy4uLg0KPiBIZXJlIHRoZSBvdXRwdXQgaW4g
TE5MOg0KDQphaCB0aGlzIGNvdWxkIGV4cGxhaW4uLi4NCg0KWyAgMTUyLjE4OTM4Nl0geGUgMDAw
MDowMDowMi4wOiBbZHJtOnhlX2h3X2VuZ2luZV9zbmFwc2hvdF9mcm9tX2NhcHR1cmUgW3hlXV0g
R1QwOiBHdUMgZXJyb3IgY2FwdHVyZSBpcyBlbXB0eSwgdGFrZSBzbmFwc2hvdCBmcm9tIGVuZ2lu
ZS4NClsgIDE1Mi4xOTAyMTVdIHhlIDAwMDA6MDA6MDIuMDogW2RybV0gWGUgZGV2aWNlIGNvcmVk
dW1wIGhhcyBiZWVuIGNyZWF0ZWQNCg0KYnV0IGJvdGggY29kZSBwYXRocyBuZWVkcyB0byBkdW1w
IHRoZSBzYW1lIHJlZ2lzdGVycw0KDQo+IA0KPiAqKioqIEhXIEVuZ2luZXMgKioqKg0KPiByY3Mw
IChwaHlzaWNhbCksIGxvZ2ljYWwgaW5zdGFuY2U9MA0KPiAJRm9yY2V3YWtlOiBkb21haW4gMHgy
LCByZWYgMQ0KPiAJSFdTVEFNOiAweGZmZmZmZmZmDQo+IAlSSU5HX0hXU19QR0E6IDB4MDE2OTMw
MDANCj4gCVJJTkdfU1RBUlQ6IDB4MDI5ZDUwMDANCj4gCVJJTkdfSEVBRDogMHgwMDAwMTkxNA0K
PiAJUklOR19UQUlMOiAweDAwMDAxOTY4DQo+IAlSSU5HX0NUTDogMHgwMDAwMzAwMQ0KPiAJUklO
R19NSV9NT0RFOiAweDAwMDAxMDAwDQo+IAlSSU5HX01PREU6IDB4MDAwMDAwMDgNCj4gCVJJTkdf
SU1SOiAweDAwMDAwMDAwDQo+IAlSSU5HX0VTUjogMHgwMDAwMDAwMA0KPiAJUklOR19FTVI6IDB4
ZmZmZmZmZmYNCj4gCVJJTkdfRUlSOiAweDAwMDAwMDAwDQo+IAlJUEVIUjogMHg3YTAwMDAwNA0K
PiAJQUNUSEQ6IDB4MDAwMGVmZmVmZmZmOTIwOA0KPiAJUklOR19CQkFERFI6IDB4MDAwMGVmZmVm
ZmZmOTIwOQ0KPiAJUklOR19ETUFfRkFERDogMHgwMDAwMDAwMDAyOWQ2OTY4DQo+IAlSSU5HX0VY
RUNMSVNUX1NUQVRVUzogMHgwMDAwMDAwMDQwMDAyNzljDQo+IAlSSU5HX0VYRUNMSVNUX1NRX0NP
TlRFTlRTOiAweDAwMDAwMDAwMDI5ZDk3MTkNCj4gDQo+IC0gYSBsb3Qgb2Ygc3R5bGUgaXNzdWVz
LCBzZWUgJ0NJLmNoZWNrcGF0Y2gnDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFpoYW5q
dW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4gPiBDYzogQWxhbiBQcmV2aW4gPGFs
YW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQo+ID4gDQo+ID4gQ2hhbmdlcyBmcm9t
IHByaW9yIHJldnM6DQo+ID4gICB2NjotICBDaGFuZ2UgaGFyZGNvZGVkIHJlZ2lzdGVyIHNuYXBz
aG90IGZpbGwgdG8gZm9sbG93IG1hcHBpbmcgdGFibGVzDQo+ID4gICAgICAgICBXaGVuIGNhcHR1
cmUgaXMgZW1wdHksIHRha2Ugc25hcHNob3QgZnJvbSBlbmdpbmUNCj4gPiAgIHY1Oi0gIFNwbGl0
IGRzcyBoZWxwZXIgY29kZSBvdXQgYXMgYW4gc3RhbmRhbG9uZSBwYXRjaA0KPiA+ICAgICAgICAg
UmVtb3ZlIG9sZCBwbGF0Zm9ybSByZWdpc3RlcnMgZGVmaW5pdGlvbi4NCj4gPiAgICAgICAgIFNw
bGl0IHJlZ2lzdGVyIG1hcCB0YWJsZSB0byAzMiBhbmQgNjRiaXQgZWFjaA0KPiA+ICAgdjQ6LSAg
TW92ZSByZWdpc3RlciBtYXAgdGFibGUgdG8geGVfaHdfZW5naW5lLmMNCj4gPiAgIHYzOi0gIFJl
bW92ZSBjb25kaXRpb24gY29tcGlsYXRpb24gaW4gY29kZQ0KPiA+ICAgdjI6LSAgU3BsaXQgaW50
byBtdWx0aXBsZSBjaHVua3MNCj4gPiANCj4gPiBaaGFuanVuIERvbmcgKDgpOg0KPiA+ICAgZHJt
L3hlL2d1YzogQWRkIGtjb25maWcgZm9yIEd1QyBiYXNlZCByZWdpc3RlciBjYXB0dXJlDQo+ID4g
ICBkcm0veGUvZ3VjOiBVcGRhdGUgR3VDIEFEUyBzaXplIGZvciBlcnJvciBjYXB0dXJlDQo+ID4g
ICBkcm0veGUvZ3VjOiBBZGQgWEVfTFAgc3RlZXJlZCByZWdpc3RlciBsaXN0cw0KPiA+ICAgZHJt
L3hlL2d1YzogQWRkIGNhcHR1cmUgc2l6ZSBjaGVjayBpbiBHdUMgbG9nIGJ1ZmZlcg0KPiA+ICAg
ZHJtL3hlL2d1YzogQ2hlY2sgc2l6aW5nIG9mIGd1Y19jYXB0dXJlIG91dHB1dA0KPiA+ICAgZHJt
L3hlL2d1YzogRXh0cmFjdCBHdUMgZXJyb3IgY2FwdHVyZSBsaXN0cyBvbiBHMkggbm90aWZpY2F0
aW9uDQo+ID4gICBkcm0veGUvZ3VjOiBQcmUtYWxsb2NhdGUgb3V0cHV0IG5vZGVzIGZvciBleHRy
YWN0aW9uDQo+ID4gICBkcm0veGUvZ3VjOiBQbHVtYiBHdUMtY2FwdHVyZSBpbnRvIGRldiBjb3Jl
ZHVtcA0KPiA+IA0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUvS2NvbmZpZyAgICAgICAgICAgICAg
IHwgICAxMSArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSAgICAgICAgICAgICAg
fCAgICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL2FiaS9ndWNfYWN0aW9uc19hYmkuaCB8
ICAgIDcgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmggICAgIHwg
ICAgNSArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wcmludGsuaCAgICAgICAgfCAg
ICAzICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jICAgICAgICAgICAgICB8ICAg
IDYgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jICAgICAgICAgIHwgIDIy
OSArKystDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzX3R5cGVzLmggICAgfCAg
ICAyICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMgICAgICB8IDEz
MzIgKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X2NhcHR1cmUuaCAgICAgIHwgICAyMSArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
Y2FwdHVyZV9md2lmLmggfCAgMjIxICsrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19jdC5jICAgICAgICAgICB8ICAgIDIgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X2Z3aWYuaCAgICAgICAgIHwgICA2OCArKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X2xvZy5jICAgICAgICAgIHwgIDE3OSArKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19sb2cuaCAgICAgICAgICB8ICAgMTUgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X2xvZ190eXBlcy5oICAgIHwgICAyNiArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
c3VibWl0LmMgICAgICAgfCAgIDIxICstDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
c3VibWl0LmggICAgICAgfCAgICAzICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y190
eXBlcy5oICAgICAgICB8ICAgIDIgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5n
aW5lLmMgICAgICAgIHwgIDI2MSArKysrLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfaHdf
ZW5naW5lLmggICAgICAgIHwgICAgNCArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19l
bmdpbmVfdHlwZXMuaCAgfCAgMTE3ICstDQo+ID4gIDIyIGZpbGVzIGNoYW5nZWQsIDI0MjEgaW5z
ZXJ0aW9ucygrKSwgMTE1IGRlbGV0aW9ucygtKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZS5oDQo+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmVfZndpZi5oDQo+ID4gDQo+IA0K
DQo=
