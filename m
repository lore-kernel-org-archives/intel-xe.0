Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54043C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 21:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1317210EB46;
	Fri, 22 Mar 2024 21:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mStu7RVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D48E10EB46
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 21:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711142927; x=1742678927;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PHvznIo8GjoCgXFlNR12KRXuU1v0OH9e/QQoi8cu7bg=;
 b=mStu7RVBg2j8caStaG/CH+als7qKO4YpZNoTj1yQ9lo3SasoDj85pysV
 9ly5WloZH8fnOF0L7IIf/CF90LW7sjDP8E8G6quwe50TNJ8/MnVfHkBuu
 dV76NU8hehd2TmJnxRisvR4m2p0E1BjEnn/Kp6AauyRZKnk7z/dA8Gp2j
 W08aYUYCHCmLIvw/Rqmq3Xf48mrXWsRK3N6zknCMsrgUUKomwBPQeFSz7
 1Pjnb6iHDpoWgatPuKdXuYqCjnxtL1cUOcnh3rSHuSBsOmcVs1jcPkcGB
 5OdW7TQkbC8I+bXAOUM0aUKTDb3y8tAUjew3QQvYhSNerW26v/oTNEhdJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="16756085"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="16756085"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 14:28:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="19513403"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 14:28:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 14:28:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 14:28:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 14:28:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkPbZ8C4fhG2l7Wmpi33YT1/pV+w1cP8eEeL+1Us1xOai8baTO2R/xclE44jQ9oFLIBDl5QYmua8vwfYHL34gMN91rkhZInEPnCZAcyAV+LjJJTXl3Hxy6Ne5VqhccMVkOxPC6ijBp/ej/LeYgO4cjM6g/2Ru0e6DjGI8AQduwqx9UenImpUH0hcKyEXOdsoW0mY15e0MXjj8V+8HLhYG6Ey1evSbVrmu1taXCX4y08mTDwUPDoYX5nSeV9FkuXDam5caLopynQI0PMd+E43VNgrsujyEIK0caHDmQGE6lAG3EXMU8wd0A0O6uncFD3b+oqAttxuCmmmrmSGFysv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHvznIo8GjoCgXFlNR12KRXuU1v0OH9e/QQoi8cu7bg=;
 b=EFOAl6M/JH+v/O3BakLr6I+dyM3TZX6ELPQhiIq6YpV8UPtGSCFQGXvJyew/D8cuObfC98/9WfiUeKUAew0m5gR4gy4aZ91ddFr0fgr+BMoTEZNAkdWaRAVHzRxkmm6dy6+Y9ETM7IUGc/VsL2rgIiijTn/bw/mwC0zqBqh/iMc6WnqQcWL8HpYzu6x5iAtq6C9TbBPOYQl6FLrLwS/23PkLAeuSHLF51hwflkLuDEnlEs1+Laht0IFjleeKi74dzDy5xx2AhNzzxRdDvOhhiKKwS7ykMJXaClDsSJVc1HCrX73mtPD6yKDj17lEtQvGoYq/6ByEWO47DlXKM4EHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 21:28:43 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 21:28:43 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v6 0/8] drm/xe/guc: Add GuC based register capture for
 error capture
Thread-Topic: [PATCH v6 0/8] drm/xe/guc: Add GuC based register capture for
 error capture
Thread-Index: AQHaegrqUXaKghHnyUW/Q8HLczM2hbFEAAAAgAAb5ICAAC/WAA==
Date: Fri, 22 Mar 2024 21:28:43 +0000
Message-ID: <ec7b3393368e3371228256785e9edcb0016425ab.camel@intel.com>
References: <20240319143621.371087-1-zhanjun.dong@intel.com>
 <c8d124823fe7da90916042fcd09edd6e550bd5bd.camel@intel.com>
 <545e620aef74383ae1137dd4dc3cf98020d60968.camel@intel.com>
In-Reply-To: <545e620aef74383ae1137dd4dc3cf98020d60968.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|LV3PR11MB8508:EE_
x-ms-office365-filtering-correlation-id: eb5e2905-6f38-4b75-4fba-08dc4ab70cc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ew3PDMu5NBH8rXo+uk6D6RuUsiy2RT+Y9gEDdxtSXQKIUCsIeAysKpFu0yytpLapqWSCnOiHGgyC8vv/bQ0Fh4FKbTw3rk6is35qwvZCjj+vRCgwpt0OBkLxybVfMTfyIgmZ5x/oiBEsZ9nNz6C3EireC4mTjATkVc1L03y+f1QIH+fwzZJGi6yAUl6U5/9fjQwZoR5nCq7mrMPoOdgcz36UnpJK9tESWsQtR7K7Kqd2iY/7MsnMfCGmTyixGkvgLinCv2WRSdfkFjRYGJF128D5WYYCnLrF2BMMOnviVvFjSUhTwwop0+LnpwxT0OucFH4GxZmN3xrPnayksc1tw5AojnmKSgkHGszf1JIHz4Jic0TAn4R+00D/7CoA7Iie2eZuKckfOIRaStHWb2I6JpQ++TSAhjE2Ch+FrFdkG/+fMgHh1xkwoZhOWHJa59lD5gOQZ6N0mL6TSUTtFXpCWppfrkMcWUZwCbkSWN+d70b0x5V5RWwWsqSUnMNdmg4Wmh3mYhiv95Q8LMXQ6REMxU5baVWLw0j4DpF0nznIZOWridKMKpojD1r3m4Jd2szZajJB/54b7tRb37dO1cuUK9RQu+ck4EWuUUV5N5gELA2Y5/dQen8YqpZ1qF1FURcvuln8xFH7UffMg3ydRenRxPlMphIgMMEPy+4oG+4muL7aC1mqfFe+qNyu4MstA0N0PFkkKpHhvOXjI5vHRMLVEX3I68lTMw1C+gmwA/HBF+o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2ZFbENDZDNMUng3Q2FKaVJBaW9zOWRxajFGRDhaMkJlWVphVmdOV2xicS9s?=
 =?utf-8?B?R2o1L1E4ODdzTWt1aFAwUkV0T21uWWtXTlVVNjN0b1QzVkVLR1EzVVltVGYv?=
 =?utf-8?B?Nk5oSG0yNGdqRXJHNEJXOWN0Q2RjOWd1MGlkdnBmSUVTOXQzWVY2STlqOUMr?=
 =?utf-8?B?TVFiU3pkcFZsTlo5amZHRkpzRmtwZlIwR01XWFkrOFYwM0NOeTNETTNhWDFE?=
 =?utf-8?B?YjZaRS9mc0xjb0QzUE1pS2pqL0FqUVRPakRSOGNJN1lxK2lKVVkwSDRORmc3?=
 =?utf-8?B?THlRK0s2M0dkTE5TYkltRjVCYTdzOGd4N2ZBOUxla3Z2Vi9mMDI1ZERtUXps?=
 =?utf-8?B?eGI4NVNPU2VVbjRzRzlUMHBkZFRxeWQ1dVNNazZmcW10akJvN0RFMzRHOEFV?=
 =?utf-8?B?VWo4aDB6MGNDMVJQOFdwajVPV2R2cHB0ZW00ZmU4VGMrTjlPNW9hcEYyeGZa?=
 =?utf-8?B?NmM4Nmd6cTlIWVdLRlRoSE1mT1d2WEdhRERqRzhpSUt2ZlpReTdJamM1RnAy?=
 =?utf-8?B?M2hKTTRJQjZHWkVROUVoakJJb3hWYU05UWVNVXJtV3Z0blphM0wvZEZUMWxz?=
 =?utf-8?B?VGxSaFJ0WVR2VTlVZXZ4YlI1RUlTOHN4QlVnS1VaV3FEZWRFUkxQb0ZZQ2NW?=
 =?utf-8?B?cVUxZVIwTFBNOEhSemkzZmxSaEJhblNPYlMwUzZ1YitMVHZaZlFaWUt6VHZD?=
 =?utf-8?B?NVNJdUNGTktWV2JlZmVCbHlZUUM0andhU1pkQlJieTV6aUlpWEZLMmdnTkhj?=
 =?utf-8?B?ek5CNURKNEg1dHo4VUo4ejJuRjR3aCtneG5uT29XZkVVRjhnZFhHdk44Z1hE?=
 =?utf-8?B?djZUMHZabThrTHhQWTFhRTlCK1daaElYc2EweXB0TXl3NGx5NFB2czg2UU9z?=
 =?utf-8?B?RExBdkdzbVp6a2NldXdYVkNWSXlRUmx2Z2dTK1NMNERrc2VaaDhIb1FaWjcr?=
 =?utf-8?B?MDVsU2sxWUpJdWdlQkdEKzJGY0kvaXZLdkgwd3YxL1ZLR2JHbDUxekFCWkFB?=
 =?utf-8?B?clcrU0ZEY0hTMEdhZTVCakJJWVJxaG5vZGEwbC9hRC93UUVNMDY0Q28rQTJG?=
 =?utf-8?B?dEJSaE9yUjhybVl0aWg3MHBxWlVaZzV2SzRPalhMY2U3OHdtNnltOFg4R1By?=
 =?utf-8?B?bER2b3A3VVlLQXZjWTRsTFNvdnNQWnVsaElZRzVBVGFTVVRsM3oxKzMzTE9Z?=
 =?utf-8?B?WVVQZUkvdFY4VEpNMkNSalJLODFHdnBFeWdOMUx2ZHpHdHZvT0lPcnF2aUtk?=
 =?utf-8?B?TE92Mm1PM01CTmlBcEh6WlVQZzJaRTU1cVhqVkxGc2FTYkFvbTJuQUZkWXZw?=
 =?utf-8?B?WmNQVjMxRUEybXQ4U3MyODZhTDRHSlF5WTdBQUR5cXlqZG5qWWNJYVgvdGd5?=
 =?utf-8?B?cFp1Y1FEMzJNcFhzTEdsYS9BWFoxeVJyTlpzaEVEekhKMzFQcXFyTTJJZzA4?=
 =?utf-8?B?SGNWMC9IUXQzTUh5WHJScU5QWGdmcE5ld0d0bnJZM0pZei9VRllqeXZSblht?=
 =?utf-8?B?QkhJbGxVTWhGMXFXZEwwSDFhN0VEZHdmTmQwOXB5bWZZUmxNMHpQblF0THdW?=
 =?utf-8?B?UVh2TURnN0l2dkdZZ0puVkhzTWFUS3BtdHBRakxMR1pmaEFGSUlka0Y1MU1l?=
 =?utf-8?B?MHBVcmlDMmpoYU5DWlBlRFI5eXYzNmF2R1B2eHVzb1Y0MlBHL1cyUWppQTl1?=
 =?utf-8?B?M04vM2FIWUY1WnBSNmR0Y0VMWURaVkFJdDJjaDM5WnJUV0xBTmFlbExoSGdI?=
 =?utf-8?B?TEVvcnBWWURYQ2R0OHpqQTZSZ2VLMjR3MTgzMjBtOEdOQjYzOFRTNjllSDVY?=
 =?utf-8?B?R1ltbzUzVTZMOHNzVFJDbjYwVFNVcnFWc0pycGlWeFlzb3MyQXBkMGplVzU4?=
 =?utf-8?B?cGZIdWFubUt1T1h2NXdEUitqNjhsRmdSRktZNEVHYklOMGlRWWlVTlBWOE1D?=
 =?utf-8?B?OEpaMmJ6SUR2b0tzbmdCUmJoTldJYkxwU01sWU1QcnB3U0MrQ0RXNWNYajVI?=
 =?utf-8?B?OURzdlJmZ0RHbStoaVkwZVhzWFBOK3BCWDc0OUM1TWJtTkxHdmcvWmVZZ2hD?=
 =?utf-8?B?Q1FwejhXcEhLeGwrQitsZDNDTm5kcGdnTGIzenhySDY5a0t5eEpYWTA0cnha?=
 =?utf-8?B?Y2hJOTRFN2k4eDhMaEttSzNveWhPYTF0VXJHVFNHdlMvc09DUVpwMjFnUTZD?=
 =?utf-8?B?Mmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B10A8C6414AABB499ECDFE5DF92D29A4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5e2905-6f38-4b75-4fba-08dc4ab70cc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 21:28:43.3415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rK/4ndQJ6P94ftA087P8C9oTdsCyqn0vhwqETUNC0Rpaoi93afkWmHgXqmjaoRJl5xlVmsrIpEx5IMSti7u8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
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

T24gRnJpLCAyMDI0LTAzLTIyIGF0IDExOjM3IC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBPbiBGcmksIDIwMjQtMDMtMjIgYXQgMDk6NTcgLTA3MDAsIEpvc8OpIFJvYmVy
dG8gZGUgU291emEgd3JvdGU6DQo+ID4gT24gVHVlLCAyMDI0LTAzLTE5IGF0IDA3OjM2IC0wNzAw
LCBaaGFuanVuIERvbmcgd3JvdGU6DQo+ID4gPiBQb3J0IEd1QyBiYXNlZCByZWdpc3RlciBjYXB0
dXJlIGZvciBlcnJvciBjYXB0dXJlIGZyb20gaTkxNSB0byBYZS4NCj4gPiA+IA0KPiA+ID4gVGhl
cmUgYXJlIDMgcGFydHMgaW5zaWRlOg0KPiA+ID4gLiBQcmVwYXJlIGZvciBjYXB0dXJlIHJlZ2lz
dGVycw0KPiA+ID4gICAgIFRoZXJlIGlzIGEgYm8gY3JlYXRlIGF0IGd1YyBhZHMgaW5pdCB0aW1l
LCB0aGF0IGlzIHZlcnkgZWFybHkNCj4gPiA+ICAgICBhbmQgZW5naSAgbmUgbWFwIGlzIG5vdCBy
ZWFkeSwgbWFrZSBpdCBoYXJkIHRvIGNhbGN1bGF0ZSB0aGUNCj4gPiA+ICAgICBjYXB0dXJlIGJ1
ZmZlciBzaXplLCBuZXcgZnVuY3Rpb24gY3JlYXRlZCBmb3Igd29yc3QgY2FzZSBzaXplDQo+ID4g
PiAgICAgY2FsdWF0aW9uLiBPdGhlciB0aGFuIHRoYXQsIHRoaXMgcGFydCBiYXNpY2FsbHkgZm9s
bG93cyB0aGUgaTkxNQ0KPiA+ID4gICAgIGRlc2lnbi4NCj4gPiA+IC4gUHJvY2VzcyBjYXB0dXJl
IG5vdGlmaWNhdGlvbiBtZXNzYWdlDQo+ID4gPiAgICAgQmFzaWNhbGx5IGZvbGxvd3MgaTkxNSBk
ZXNpZ24NCj4gPiA+IC4gU3lzZnMgY29tbWFuZCBwcm9jZXNzLg0KPiA+ID4gICAgIFhlIHN3aXRj
aGVkIHRvIGRldmNvcmVkdW1wLCBhZG9wdGVkIGNvbW1hbmQgbGluZSBwcm9jZXNzIHdpdGgNCj4g
PiA+ICAgICBjYXB0dXJlZCBub2RlIGxpc3QuDQo+ID4gDQo+ID4gSnVzdCBzb21lIG5vdGVzIGFm
dGVyIHRyeWluZyB0aGlzIHRvIGRlYnVnIGEgaXNzdWUgd2l0aCB0aGlzIHNlcmllczoNCj4gPiAN
Cj4gPiAtIENPTkZJR19EUk1fWEVfQ0FQVFVSRV9FUlJPUiBpcyBub3QgYSBnb29kIG5hbWUgZm9y
IGEgY29uZmlnIHRvIGVuYWJsZSBHdUMgYmFzZWQgY2FwdHVyZS4NCj4gPiAJLSBpbiBteSBvcGlu
aW9uIHRoaXMgc2hvdWxkIG5vdCBldmVuIGV4aXN0LCBhbHdheXMgY2FwdHVyZSB3aXRoIEd1QyBp
ZiB4ZV9kZXZpY2VfdWNfZW5hYmxlZCgpIGlzIHRydWUuIA0KPiA+IA0KPiA+IC0gY29yZWR1bXAg
ZG9uJ3QgaGF2ZSBzb21lIHJlZ2lzdGVycyBsaWtlIFNBTVBMRVJfSU5TVERPTkUsIFJPV19JTlNU
RE9ORSwgWEVIUEdfSU5TVERPTkVfR0VPTV9TVkcuLi4NCj4gPiBIZXJlIHRoZSBvdXRwdXQgaW4g
TE5MOg0KPiANCj4gYWggdGhpcyBjb3VsZCBleHBsYWluLi4uDQo+IA0KPiBbICAxNTIuMTg5Mzg2
XSB4ZSAwMDAwOjAwOjAyLjA6IFtkcm06eGVfaHdfZW5naW5lX3NuYXBzaG90X2Zyb21fY2FwdHVy
ZSBbeGVdXSBHVDA6IEd1QyBlcnJvciBjYXB0dXJlIGlzIGVtcHR5LCB0YWtlIHNuYXBzaG90IGZy
b20gZW5naW5lLg0KPiBbICAxNTIuMTkwMjE1XSB4ZSAwMDAwOjAwOjAyLjA6IFtkcm1dIFhlIGRl
dmljZSBjb3JlZHVtcCBoYXMgYmVlbiBjcmVhdGVkDQo+IA0KPiBidXQgYm90aCBjb2RlIHBhdGhz
IG5lZWRzIHRvIGR1bXAgdGhlIHNhbWUgcmVnaXN0ZXJzDQoNCkhpIFpoYW5qdW4NCg0KTWVzYSB0
ZWFtIG5lZWRzIHRoZSBJTlNURE9ORSByZWdpc3RlcnMgdG8gZGVidWcgaXNzdWVzIGFuZCBJIGhh
dmUgcGF0Y2hlcyBpbXBsZW1lbnRpbmcgdGhlIGR1bXAgb2YgdGhpcyByZWdpc3RlcnMuDQpEbyB5
b3UgbWluZCBpZiBJIHNlbmQgdGhpcyBwYXRjaGVzIHRoZSBsaXN0Pw0KDQpJIGd1ZXNzIHRoaXMg
R3VDIGJhc2VkIHJlZ2lzdGVyIGNhcHR1cmUgd2lsbCBuZWVkIGFub3RoZXIgdmVyc2lvbiBhbmQg
c29tZW9uZSB3aXRoIGV4cGVyaWVuY2Ugb24gR3VDIHRvIHJldmlldywgc28gaXQgd2lsbCB0YWtl
IGEgd2hpbGUuLi4NCg0KPiANCj4gPiANCj4gPiAqKioqIEhXIEVuZ2luZXMgKioqKg0KPiA+IHJj
czAgKHBoeXNpY2FsKSwgbG9naWNhbCBpbnN0YW5jZT0wDQo+ID4gCUZvcmNld2FrZTogZG9tYWlu
IDB4MiwgcmVmIDENCj4gPiAJSFdTVEFNOiAweGZmZmZmZmZmDQo+ID4gCVJJTkdfSFdTX1BHQTog
MHgwMTY5MzAwMA0KPiA+IAlSSU5HX1NUQVJUOiAweDAyOWQ1MDAwDQo+ID4gCVJJTkdfSEVBRDog
MHgwMDAwMTkxNA0KPiA+IAlSSU5HX1RBSUw6IDB4MDAwMDE5NjgNCj4gPiAJUklOR19DVEw6IDB4
MDAwMDMwMDENCj4gPiAJUklOR19NSV9NT0RFOiAweDAwMDAxMDAwDQo+ID4gCVJJTkdfTU9ERTog
MHgwMDAwMDAwOA0KPiA+IAlSSU5HX0lNUjogMHgwMDAwMDAwMA0KPiA+IAlSSU5HX0VTUjogMHgw
MDAwMDAwMA0KPiA+IAlSSU5HX0VNUjogMHhmZmZmZmZmZg0KPiA+IAlSSU5HX0VJUjogMHgwMDAw
MDAwMA0KPiA+IAlJUEVIUjogMHg3YTAwMDAwNA0KPiA+IAlBQ1RIRDogMHgwMDAwZWZmZWZmZmY5
MjA4DQo+ID4gCVJJTkdfQkJBRERSOiAweDAwMDBlZmZlZmZmZjkyMDkNCj4gPiAJUklOR19ETUFf
RkFERDogMHgwMDAwMDAwMDAyOWQ2OTY4DQo+ID4gCVJJTkdfRVhFQ0xJU1RfU1RBVFVTOiAweDAw
MDAwMDAwNDAwMDI3OWMNCj4gPiAJUklOR19FWEVDTElTVF9TUV9DT05URU5UUzogMHgwMDAwMDAw
MDAyOWQ5NzE5DQo+ID4gDQo+ID4gLSBhIGxvdCBvZiBzdHlsZSBpc3N1ZXMsIHNlZSAnQ0kuY2hl
Y2twYXRjaCcNCj4gPiANCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogWmhhbmp1biBEb25n
IDx6aGFuanVuLmRvbmdAaW50ZWwuY29tPg0KPiA+ID4gQ2M6IEFsYW4gUHJldmluIDxhbGFuLnBy
ZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KPiA+ID4gDQo+ID4gPiBDaGFuZ2VzIGZyb20g
cHJpb3IgcmV2czoNCj4gPiA+ICAgdjY6LSAgQ2hhbmdlIGhhcmRjb2RlZCByZWdpc3RlciBzbmFw
c2hvdCBmaWxsIHRvIGZvbGxvdyBtYXBwaW5nIHRhYmxlcw0KPiA+ID4gICAgICAgICBXaGVuIGNh
cHR1cmUgaXMgZW1wdHksIHRha2Ugc25hcHNob3QgZnJvbSBlbmdpbmUNCj4gPiA+ICAgdjU6LSAg
U3BsaXQgZHNzIGhlbHBlciBjb2RlIG91dCBhcyBhbiBzdGFuZGFsb25lIHBhdGNoDQo+ID4gPiAg
ICAgICAgIFJlbW92ZSBvbGQgcGxhdGZvcm0gcmVnaXN0ZXJzIGRlZmluaXRpb24uDQo+ID4gPiAg
ICAgICAgIFNwbGl0IHJlZ2lzdGVyIG1hcCB0YWJsZSB0byAzMiBhbmQgNjRiaXQgZWFjaA0KPiA+
ID4gICB2NDotICBNb3ZlIHJlZ2lzdGVyIG1hcCB0YWJsZSB0byB4ZV9od19lbmdpbmUuYw0KPiA+
ID4gICB2MzotICBSZW1vdmUgY29uZGl0aW9uIGNvbXBpbGF0aW9uIGluIGNvZGUNCj4gPiA+ICAg
djI6LSAgU3BsaXQgaW50byBtdWx0aXBsZSBjaHVua3MNCj4gPiA+IA0KPiA+ID4gWmhhbmp1biBE
b25nICg4KToNCj4gPiA+ICAgZHJtL3hlL2d1YzogQWRkIGtjb25maWcgZm9yIEd1QyBiYXNlZCBy
ZWdpc3RlciBjYXB0dXJlDQo+ID4gPiAgIGRybS94ZS9ndWM6IFVwZGF0ZSBHdUMgQURTIHNpemUg
Zm9yIGVycm9yIGNhcHR1cmUNCj4gPiA+ICAgZHJtL3hlL2d1YzogQWRkIFhFX0xQIHN0ZWVyZWQg
cmVnaXN0ZXIgbGlzdHMNCj4gPiA+ICAgZHJtL3hlL2d1YzogQWRkIGNhcHR1cmUgc2l6ZSBjaGVj
ayBpbiBHdUMgbG9nIGJ1ZmZlcg0KPiA+ID4gICBkcm0veGUvZ3VjOiBDaGVjayBzaXppbmcgb2Yg
Z3VjX2NhcHR1cmUgb3V0cHV0DQo+ID4gPiAgIGRybS94ZS9ndWM6IEV4dHJhY3QgR3VDIGVycm9y
IGNhcHR1cmUgbGlzdHMgb24gRzJIIG5vdGlmaWNhdGlvbg0KPiA+ID4gICBkcm0veGUvZ3VjOiBQ
cmUtYWxsb2NhdGUgb3V0cHV0IG5vZGVzIGZvciBleHRyYWN0aW9uDQo+ID4gPiAgIGRybS94ZS9n
dWM6IFBsdW1iIEd1Qy1jYXB0dXJlIGludG8gZGV2IGNvcmVkdW1wDQo+ID4gPiANCj4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0veGUvS2NvbmZpZyAgICAgICAgICAgICAgIHwgICAxMSArDQo+ID4gPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlICAgICAgICAgICAgICB8ICAgIDEgKw0KPiA+ID4g
IGRyaXZlcnMvZ3B1L2RybS94ZS9hYmkvZ3VjX2FjdGlvbnNfYWJpLmggfCAgICA3ICsNCj4gPiA+
ICBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmggICAgIHwgICAgNSArDQo+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3ByaW50ay5oICAgICAgICB8ICAgIDMgKw0KPiA+
ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyAgICAgICAgICAgICAgfCAgICA2ICsNCj4g
PiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jICAgICAgICAgIHwgIDIyOSArKyst
DQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hZHNfdHlwZXMuaCAgICB8ICAgIDIg
Kw0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZS5jICAgICAgfCAxMzMy
ICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X2NhcHR1cmUuaCAgICAgIHwgICAyMSArDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19jYXB0dXJlX2Z3aWYuaCB8ICAyMjEgKysrKw0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfY3QuYyAgICAgICAgICAgfCAgICAyICsNCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX2Z3aWYuaCAgICAgICAgIHwgICA2OCArKw0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfbG9nLmMgICAgICAgICAgfCAgMTc5ICsrKw0KPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfbG9nLmggICAgICAgICAgfCAgIDE1ICsNCj4gPiA+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX2xvZ190eXBlcy5oICAgIHwgICAyNiArDQo+ID4gPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyAgICAgICB8ICAgMjEgKy0NCj4gPiA+ICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5oICAgICAgIHwgICAgMyArDQo+ID4gPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y190eXBlcy5oICAgICAgICB8ICAgIDIgKw0KPiA+ID4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyAgICAgICAgfCAgMjYxICsrKystDQo+ID4gPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5oICAgICAgICB8ICAgIDQgKw0KPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfdHlwZXMuaCAgfCAgMTE3ICstDQo+ID4gPiAg
MjIgZmlsZXMgY2hhbmdlZCwgMjQyMSBpbnNlcnRpb25zKCspLCAxMTUgZGVsZXRpb25zKC0pDQo+
ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVy
ZS5jDQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
Y2FwdHVyZS5oDQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfY2FwdHVyZV9md2lmLmgNCj4gPiA+IA0KPiA+IA0KPiANCg0K
