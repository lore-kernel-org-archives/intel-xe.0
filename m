Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7376BC5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 18:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0E410EE23;
	Mon, 26 Feb 2024 18:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRswlD4D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B3D10EE1F
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 18:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708973306; x=1740509306;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=APZCW34fm8XRHmE/BZXcb8N+ZUOvksNz9iURvOAOT/Y=;
 b=IRswlD4DL/y0WT/0iq1Sk9ie+jCsdDNDcbMdimhytlzXCpAyIQ6P7k+P
 5xO1nVSpKnS8IX7ozb26Ud6Ih5eC4o1bFt43f+naNWO4Usxl4gKGU8P9k
 lNOU7faXdix/jmcqnOw8HxovfttDxLy2tn6tPGR1GpLCVVZBhw/Q3MY0N
 IULmFlGF+eyZKlU8i1U1Snx4XtZiTkW/isRpq4asRABo0J8oq+g/7ogvy
 n4o1VRkQcGPrLMLPugn8cwIMpx9Y0L7UuFdAX+KcFQOGgIh2kHrVyYKQC
 /4Bn+WFkJZKKVnreTXX1E/rKPMSJbRlWRFSuSe50BaGp8jgzsmQkM7XAa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="13921674"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; d="scan'208";a="13921674"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 10:48:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; d="scan'208";a="44251252"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 10:48:08 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 10:48:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 10:48:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 10:48:06 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 10:48:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhTOsaGGml0sPh3HInpO+hICOBifDX3CXgQv2z0Pu6cj4ZIT0CkClxcN3jp10Qza6DKqbfCqjwDbVbRa7OJDDob2PjOFGLXmfvI28vuRmk4sligJxIWFqNGehGN/a8/8uWt2pnn1kHQCB4zvItEIaX+mq2Izw28Ued+QWf2nyvl9vVutuIbhT7J6psY1SdyzHLdye4E21Gy++RENB8oG7v9qVkfoQtF9MeMFyJSKZMlemiI8EFoQl1ZhMs3+vRxrSU1/gh5AGFnMKgdTP90btTcbQl+FJWAJJovnhuOaUWPJRVf5gekNBL6FlDs+vnPTJywiFF4ojn3pyFKD7Vlq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APZCW34fm8XRHmE/BZXcb8N+ZUOvksNz9iURvOAOT/Y=;
 b=VVbZ74jgjev3lCEYaeeKtf5Z9oalM5F5IsdctsNjohL2wwxDMlCEa14UQMA/XD0oapPNcx81wN1ZzEy+KkxdcqQ5qF+G7/Fj/DdZCh2uBNuJtx42x8Eb6FmWHPjCmhztRRZp1mUcxKAGNwZWkac2+zyt9ebmwSvg4Zl4iaqnLDoExRN5m0IZ6BWV798qcwO1ele1UNRqhUTAj/MWhpOSltGv3Uj0aeuHo0QjHks1WcxVmFjLpqzkUkCJb18SBLpydhPDhD9d5mafb/47O+FY9kPZTi1jXmzAdqc4xgogdB2P5XUQ/uOXzWgYD3SAztkhvOybgqZseVAAkB9K+F0jiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY8PR11MB7876.namprd11.prod.outlook.com (2603:10b6:930:7d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Mon, 26 Feb
 2024 18:48:00 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%3]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 18:48:00 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "dev@lankhorst.se" <dev@lankhorst.se>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: Implement capture of HWSP and HWCTX
Thread-Topic: [PATCH v2 3/3] drm/xe: Implement capture of HWSP and HWCTX
Thread-Index: AQHaaMzijhhGuqZV4ky3ec53xO9+hLEc9wUA
Date: Mon, 26 Feb 2024 18:48:00 +0000
Message-ID: <deba8e27c272308bc406f2fe34650bf957b71f03.camel@intel.com>
References: <20240226155913.77158-1-dev@lankhorst.se>
 <20240226155913.77158-3-dev@lankhorst.se>
In-Reply-To: <20240226155913.77158-3-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY8PR11MB7876:EE_
x-ms-office365-filtering-correlation-id: ff912a90-13bb-45dd-3668-08dc36fb74cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W98phhEEd7Kf/7sRr2C/SCBiByKln+UYvNl3HT3wBcsEQ5m2fdSLTxECv+e4Md6MsKmXoRiOiWv/2/XLhQfm1Gls1yFXwCdaRWKjeccs3F6R0iE2JIY03gyD6C2MQgmBXuPECVz0Z7+KqlZkBQ+Kkwe23dlpOFfqAkalA777l2dApo4MCDqFvBxxIefBTr7vlUa7kXVZ7hKO/5d4eLQTd5hy95898bZhsNOmw9ze9rzcf57nWNoPLjAo71yciXE93T5H2YM7vxtAL3cRTt/2+FvKJu3HQF1pmmB+Py003B0orqGGfm6/VaqESwOd+wnElT9guKTHflA+ivYB6cMLnHahqw8pgxrvY66uZKUOl4p/sNYHdN0Pf2aIle8G6HHbebfcjnOqPLSmwimKxenOKRZCBGVd507xGv65L77/0IKmvo5Nm8KgAPsune9D/428jsNueMY3KA2nLLvSzAjLa4HUn7bqSTgUD8pxS9XAiEvrzGRFjPlY9PO6ZoMSZ6ybfofXph/KrxN1NEd8E9j8I3Jmi8y/LQKPuKOS8KMvFhfYH/PVDMlpvQdBTdC8Wb0wqFIhnqEAOb5bYT+wOrjCW33S7IjeXfxkUn5WIoATbet6o0rygc+6hLcwPfEOBdHKRPwk/Vd12m9UQCqMDvOOH8GoHUzFnFSG70OUGJ2B//Dyde3fxk0RCSuqVakQXIgCMiN7Bad4zUyu53G9X7iriaMZkY2vtuoyX2brcEFO87Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjZ6U21NK0VNOEtyenhrQko5REpPVzNNdW9tR1NVVlBBM1F0elgzZGdkN1hX?=
 =?utf-8?B?QVQxWDFCekhmeFZ6QmNWMlhaNkw1UlpOMWZFSUNtdnd5OS9kK2pialk4SmVP?=
 =?utf-8?B?d09iSCtsdTlMTVU0NFlDa3pwemN1MlhZSVBlTGRaTGhLcXhWMVV1ZDEwNERW?=
 =?utf-8?B?QzJwTXo5YzYrZjg0RkpjV1RhUFNyZWVGYVRhcEdVY0ZKS2ZhUko1NnZIKzlE?=
 =?utf-8?B?YVZzdUl5VFFkU080ZmNJY25LUkNjc2Q4TjR2OStTQWFuNWxSRXBndWFyWnlB?=
 =?utf-8?B?d2U0M1E2VnNwd1Y1d3hNam9KUFlCa0dYM3NoTThLamlKM01ua1k3a0Z2V3RS?=
 =?utf-8?B?OHZUemtwN29ZM2dnNUQ3Y3NoNnJ4WXZBUCtFUjlNYmNiSldCSjh0R1NpaXJt?=
 =?utf-8?B?QVV2S2Ywc2JHYitaVVgvZ0ZEVXhJckhEVWRJd0ZYYW5yREFnbXpHNSs2MWE4?=
 =?utf-8?B?b3BTRUtvb1FjMDhSMGtCOTJQSjhLTDdCZGxvY3kxWTBtZFBQMkJOT0Y0TjVu?=
 =?utf-8?B?T2g0ZE5LcUZvOHdzc0RUaU1WTDVnSzRqZUxtWFB4Q3ZSSzIyTW9ZU0kwMmZl?=
 =?utf-8?B?b3hvSjkwWlozSXR1U21sU3p2WU16Q0h5Mkp1TnUrR2dCOG5kcUJJbWQrUGVq?=
 =?utf-8?B?RHFoMVVtR2hOOTZMY25WWFFjZ3RIamVxMzFwZUxpRlFRVG5HUmJmWmZ4UVk2?=
 =?utf-8?B?WkZMM1plR2xmVWo4LzYrTnlwZkxiUitwd29YZ0FzZEpFRFJzRzg5OU5qa1hI?=
 =?utf-8?B?eUwwcUtpRngwa05WVC95NytnVUc2TzdsS0pGSjBvd0wwWnZ0NERRSm9RUGN3?=
 =?utf-8?B?QTZiT0lGVWVqbGdxaktZODlKN1ZOU2U5NWFGaVQwZk9Pd0tCbXdGbmUxMExw?=
 =?utf-8?B?UnVlWnpucWtUeXRxTWI5OEJSaFpTV2VGL0VUMGg1NUtzTUJUQVUvb3NnWHhE?=
 =?utf-8?B?ejY4QzhaRzV1MU5GMmRoSlRCOW8vVWpFMCtGb1VJLzZiYzJuS3FNNlR6dDMx?=
 =?utf-8?B?dm5mRyt2L1hFRDd6dG1JT3RrRytGR0xWMS83eld1dFgvdHdEMUJNcE5BVFBB?=
 =?utf-8?B?bVVrcWxQV1VlaVNVMzdEYk0zRG1LMUZORzhpNnR0UnQvWkYzSy9RQ0tiTkJ3?=
 =?utf-8?B?QWs0NmVQVnZiOERraE5nT2lSQ0pXNWRpNUUzVlBLU0xZdzB4b24xQXRGSHdk?=
 =?utf-8?B?TldaTWxFT0dpZmV0bWcwSmdMazE3bTFMMWkwSWMxZjhhMTZtMUhGWDczVzcy?=
 =?utf-8?B?MjJtSUJWbzVkbURUeThBSWg1c0xScHJyUm1lOHhXUFFSZzZKcFBXV1Zua1hi?=
 =?utf-8?B?RHBaTWVua1RZbytKSHNrbnlHeVpJaDVuVVdUQjV4dWFZeDBKTEFJTDR6TFFR?=
 =?utf-8?B?WkcySEk1NWpVZ2NjRUN1TVlWaS9jOE9OWHFiUnh1WVdvc0tTRmlIY0g2ekJ5?=
 =?utf-8?B?Qzh3cWYzL0ozYzRYQyt2VmhlR3JQWFZHTHpwN3pkdHRSK1lyOWxjQlRERHps?=
 =?utf-8?B?RVo4RFIvd3VnbnJmY2loUXUwZmN6cXFkenhOb3VITzIrWlhla29CcjVmQjBs?=
 =?utf-8?B?VTMrMHN3RjR6Rkc3cWRzbEgvZllKMXlnWlJFclZ3YXhUTXEwUzNBQlFjcWs5?=
 =?utf-8?B?ZTRHSjd2cS9qK0NQdWoyS0dDM29TVzI1RERMOFF5Ymd3OGlPaUtCcENGb1VR?=
 =?utf-8?B?Wit5VFp2N3g3eFFkbWZsSDFWaDlsTTVEZDZUL0xUWklBT3lmQms1eVhDSFcv?=
 =?utf-8?B?QjdWcGhiN1dJb2xQNkNJRHpER29EQlJHcTBTNlIrc1o2Q2NyRFd1L1JJdTlr?=
 =?utf-8?B?T3I0NmdFV21mRnVzbTdhbFkybEt2UFlPS0RGU2tIWVErSlQ5TVY5SU5BcUEy?=
 =?utf-8?B?TXJpakR3THd5MTAwWGN2SVdBc2piNE9zaW1nbFFaSjFHQ05NN3I4ZGdLYWdE?=
 =?utf-8?B?Vi82WTM4b0xjV012QkFzRncyWSs4dXJhU0ljQmhkRDRkNUZXd2JmM0pXVkUr?=
 =?utf-8?B?RkxRcUJVRzdUVk0yQnZsMGNmOXQ5QXh0UWlZMXNGNmhmYXlCdDBzVHc0ZnR1?=
 =?utf-8?B?eGdxcUNYd3N4TTBjblBPWDdlWDcrN1FRcGMraXl1VnFQWVV4azMwMWtHbWJz?=
 =?utf-8?B?ZW4xUUg2KzdUOWJFNm9CRDd2Um1JMEc2OVlvczRtZVZiNnVOVHpIdi81Q0k0?=
 =?utf-8?B?Tmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFAA512FD7E31C48BEAABD0EF5CD1C43@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff912a90-13bb-45dd-3668-08dc36fb74cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 18:48:00.3968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Omnij4tzCjRWjBAMUbujRG3OvXsMqGVE73Grlq+fPe2IW5upNF08TIs1KXc77GH+Ww4kqvlo7EJb8nBQaWbqCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7876
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

T24gTW9uLCAyMDI0LTAyLTI2IGF0IDE2OjU5ICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gRnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbT4NCj4gDQo+IER1bXAgdGhlIEhXQ1RYIGFuZCBIV1NQIGFzIHBhcnQgb2YgTFJDIGNh
cHR1cmUuDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAtIFVzZSBzYW1lIGxheW91dCBmb3Ig
SFdTUCBhbmQgSFdDVFggYXMgVk0gYm8ncywgdG8gc2ltcGxpZnkgZHVtcGluZy4NCg0KUmV2aWV3
ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQpX
aWxsIGRvIG1vcmUgdGVzdGluZyB0byBjaGVjayBpZiB0aGVyZSBpcyBubyB3YXJuaW5ncy4NCg0K
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZj
b3JlZHVtcC5jIHwgIDQgKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYyAgICAgICAg
IHwgNzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9scmMuaCAgICAgICAgIHwgIDEgKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVk
dW1wLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiBpbmRleCA3MDAy
ZTNiNjk4ZjIuLjYyZDAxNmUzY2E2NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmNvcmVkdW1wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVk
dW1wLmMNCj4gQEAgLTY0LDggKzY0LDEyIEBAIHN0YXRpYyBzdHJ1Y3QgeGVfZ3VjICpleGVjX3F1
ZXVlX3RvX2d1YyhzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAqcSkNCj4gIHN0YXRpYyB2b2lkIHhlX2Rl
dmNvcmVkdW1wX2RlZmVycmVkX3NuYXBfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+
ICB7DQo+ICAJc3RydWN0IHhlX2RldmNvcmVkdW1wX3NuYXBzaG90ICpzcyA9IGNvbnRhaW5lcl9v
Zih3b3JrLCB0eXBlb2YoKnNzKSwgd29yayk7DQo+ICsJaW50IGk7DQo+ICANCj4gIAl4ZV9mb3Jj
ZV93YWtlX2dldChndF90b19mdyhzcy0+Z3QpLCBYRV9GT1JDRVdBS0VfQUxMKTsNCj4gKwlmb3Ig
KGkgPSAwOyBpIDwgQVJSQVlfU0laRShzcy0+bHJjKTsgaSsrKQ0KPiArCQl4ZV9scmNfc25hcHNo
b3RfY2FwdHVyZV9kZWxheWVkKHNzLT5scmNbaV0pOw0KPiArDQo+ICAJaWYgKHNzLT52bSkNCj4g
IAkJeGVfdm1fc25hcHNob3RfY2FwdHVyZV9kZWxheWVkKHNzLT52bSk7DQo+ICAJeGVfZm9yY2Vf
d2FrZV9wdXQoZ3RfdG9fZncoc3MtPmd0KSwgWEVfRk9SQ0VXQUtFX0FMTCk7DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
bHJjLmMNCj4gaW5kZXggODIzM2Q0NTEyZmM2Li4yNTQ0MGUyMjcxOTggMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfbHJjLmMNCj4gQEAgLTUsNiArNSw4IEBADQo+ICANCj4gICNpbmNsdWRlICJ4ZV9scmMuaCIN
Cj4gIA0KPiArI2luY2x1ZGUgPGxpbnV4L2FzY2lpODUuaD4NCj4gKw0KPiAgI2luY2x1ZGUgImlu
c3RydWN0aW9ucy94ZV9taV9jb21tYW5kcy5oIg0KPiAgI2luY2x1ZGUgImluc3RydWN0aW9ucy94
ZV9nZnhwaXBlX2NvbW1hbmRzLmgiDQo+ICAjaW5jbHVkZSAicmVncy94ZV9lbmdpbmVfcmVncy5o
Ig0KPiBAQCAtMzIsNiArMzQsMTAgQEANCj4gICNkZWZpbmUgRU5HSU5FX0lOU1RBTkNFX1NISUZU
CQkJNDgNCj4gIA0KPiAgc3RydWN0IHhlX2xyY19zbmFwc2hvdCB7DQo+ICsJc3RydWN0IHhlX2Jv
ICpscmNfYm87DQo+ICsJdm9pZCAqbHJjX3NuYXBzaG90Ow0KPiArCXVuc2lnbmVkIGxvbmcgbHJj
X3NpemUsIGxyY19vZmZzZXQ7DQo+ICsNCj4gIAl1MzIgY29udGV4dF9kZXNjOw0KPiAgCXUzMiBo
ZWFkOw0KPiAgCXN0cnVjdCB7DQo+IEBAIC0xMzI1LDExICsxMzMxLDQ3IEBAIHN0cnVjdCB4ZV9s
cmNfc25hcHNob3QgKnhlX2xyY19zbmFwc2hvdF9jYXB0dXJlKHN0cnVjdCB4ZV9scmMgKmxyYykN
Cj4gIAlzbmFwc2hvdC0+dGFpbC5tZW1vcnkgPSB4ZV9scmNfcmVhZF9jdHhfcmVnKGxyYywgQ1RY
X1JJTkdfVEFJTCk7DQo+ICAJc25hcHNob3QtPnN0YXJ0X3NlcW5vID0geGVfbHJjX3N0YXJ0X3Nl
cW5vKGxyYyk7DQo+ICAJc25hcHNob3QtPnNlcW5vID0geGVfbHJjX3NlcW5vKGxyYyk7DQo+ICsJ
c25hcHNob3QtPmxyY19ibyA9IHhlX2JvX2dldChscmMtPmJvKTsNCj4gKwlzbmFwc2hvdC0+bHJj
X29mZnNldCA9IHhlX2xyY19wcGh3c3Bfb2Zmc2V0KGxyYyk7DQo+ICsJc25hcHNob3QtPmxyY19z
aXplID0gbHJjLT5iby0+c2l6ZSAtIHNuYXBzaG90LT5scmNfb2Zmc2V0Ow0KPiArCXNuYXBzaG90
LT5scmNfc25hcHNob3QgPSBOVUxMOw0KPiAgCXJldHVybiBzbmFwc2hvdDsNCj4gIH0NCj4gIA0K
PiArdm9pZCB4ZV9scmNfc25hcHNob3RfY2FwdHVyZV9kZWxheWVkKHN0cnVjdCB4ZV9scmNfc25h
cHNob3QgKnNuYXBzaG90KQ0KPiArew0KPiArCXN0cnVjdCB4ZV9ibyAqYm87DQo+ICsJc3RydWN0
IGlvc3lzX21hcCBzcmM7DQo+ICsNCj4gKwlpZiAoIXNuYXBzaG90KQ0KPiArCQlyZXR1cm47DQo+
ICsNCj4gKwlibyA9IHNuYXBzaG90LT5scmNfYm87DQo+ICsJc25hcHNob3QtPmxyY19ibyA9IE5V
TEw7DQo+ICsNCj4gKwlzbmFwc2hvdC0+bHJjX3NuYXBzaG90ID0ga3ZtYWxsb2Moc25hcHNob3Qt
PmxyY19zaXplLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIXNuYXBzaG90LT5scmNfc25hcHNob3Qp
DQo+ICsJCWdvdG8gcHV0X2JvOw0KPiArDQo+ICsJZG1hX3Jlc3ZfbG9jayhiby0+dHRtLmJhc2Uu
cmVzdiwgTlVMTCk7DQo+ICsJaWYgKCF0dG1fYm9fdm1hcCgmYm8tPnR0bSwgJnNyYykpIHsNCj4g
KwkJeGVfbWFwX21lbWNweV9mcm9tKHhlX2JvX2RldmljZShibyksDQo+ICsJCQkJICAgc25hcHNo
b3QtPmxyY19zbmFwc2hvdCwgJnNyYywgc25hcHNob3QtPmxyY19vZmZzZXQsDQo+ICsJCQkJICAg
c25hcHNob3QtPmxyY19zaXplKTsNCj4gKwkJdHRtX2JvX3Z1bm1hcCgmYm8tPnR0bSwgJnNyYyk7
DQo+ICsJfSBlbHNlIHsNCj4gKwkJa3ZmcmVlKHNuYXBzaG90LT5scmNfc25hcHNob3QpOw0KPiAr
CQlzbmFwc2hvdC0+bHJjX3NuYXBzaG90ID0gTlVMTDsNCj4gKwl9DQo+ICsJZG1hX3Jlc3ZfdW5s
b2NrKGJvLT50dG0uYmFzZS5yZXN2KTsNCj4gK3B1dF9ibzoNCj4gKwl4ZV9ib19wdXQoYm8pOw0K
PiArfQ0KPiArDQo+ICB2b2lkIHhlX2xyY19zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfbHJjX3Nu
YXBzaG90ICpzbmFwc2hvdCwgc3RydWN0IGRybV9wcmludGVyICpwKQ0KPiAgew0KPiArCXVuc2ln
bmVkIGxvbmcgaTsNCj4gKw0KPiAgCWlmICghc25hcHNob3QpDQo+ICAJCXJldHVybjsNCj4gIA0K
PiBAQCAtMTMzOSw5ICsxMzgxLDM3IEBAIHZvaWQgeGVfbHJjX3NuYXBzaG90X3ByaW50KHN0cnVj
dCB4ZV9scmNfc25hcHNob3QgKnNuYXBzaG90LCBzdHJ1Y3QgZHJtX3ByaW50ZXINCj4gIAkJICAg
c25hcHNob3QtPnRhaWwuaW50ZXJuYWwsIHNuYXBzaG90LT50YWlsLm1lbW9yeSk7DQo+ICAJZHJt
X3ByaW50ZihwLCAiXHRTdGFydCBzZXFubzogKG1lbW9yeSkgJWRcbiIsIHNuYXBzaG90LT5zdGFy
dF9zZXFubyk7DQo+ICAJZHJtX3ByaW50ZihwLCAiXHRTZXFubzogKG1lbW9yeSkgJWRcbiIsIHNu
YXBzaG90LT5zZXFubyk7DQo+ICsNCj4gKwlpZiAoIXNuYXBzaG90LT5scmNfc25hcHNob3QpDQo+
ICsJCXJldHVybjsNCj4gKw0KPiArCWRybV9wcmludGYocCwgIlx0W0hXU1BdLmxlbmd0aDogMHgl
eFxuIiwgTFJDX1BQSFdTUF9TSVpFKTsNCj4gKwlkcm1fcHV0cyhwLCAiXHRbSFdTUF0uZGF0YTog
Iik7DQo+ICsJZm9yIChpID0gMDsgaSA8IExSQ19QUEhXU1BfU0laRTsgaSArPSBzaXplb2YodTMy
KSkgew0KPiArCQl1MzIgKnZhbCA9IHNuYXBzaG90LT5scmNfc25hcHNob3QgKyBpOw0KPiArCQlj
aGFyIGR1bXBlZFtBU0NJSTg1X0JVRlNaXTsNCj4gKw0KPiArCQlkcm1fcHV0cyhwLCBhc2NpaTg1
X2VuY29kZSgqdmFsLCBkdW1wZWQpKTsNCj4gKwl9DQo+ICsNCj4gKwlkcm1fcHJpbnRmKHAsICJc
blx0W0hXQ1RYXS5sZW5ndGg6IDB4JWx4XG4iLCBzbmFwc2hvdC0+bHJjX3NpemUgLSBMUkNfUFBI
V1NQX1NJWkUpOw0KPiArCWRybV9wdXRzKHAsICJcdFtIV0NUWF0uZGF0YTogIik7DQo+ICsJZm9y
ICg7IGkgPCBzbmFwc2hvdC0+bHJjX3NpemU7IGkgKz0gc2l6ZW9mKHUzMikpIHsNCj4gKwkJdTMy
ICp2YWwgPSBzbmFwc2hvdC0+bHJjX3NuYXBzaG90ICsgaTsNCj4gKwkJY2hhciBkdW1wZWRbQVND
SUk4NV9CVUZTWl07DQo+ICsNCj4gKwkJZHJtX3B1dHMocCwgYXNjaWk4NV9lbmNvZGUoKnZhbCwg
ZHVtcGVkKSk7DQo+ICsJfQ0KPiArCWRybV9wdXRzKHAsICJcbiIpOw0KPiAgfQ0KPiAgDQo+ICB2
b2lkIHhlX2xyY19zbmFwc2hvdF9mcmVlKHN0cnVjdCB4ZV9scmNfc25hcHNob3QgKnNuYXBzaG90
KQ0KPiAgew0KPiArCWlmICghc25hcHNob3QpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCWt2ZnJl
ZShzbmFwc2hvdC0+bHJjX3NuYXBzaG90KTsNCj4gKwlpZiAoc25hcHNob3QtPmxyY19ibykNCj4g
KwkJeGVfYm9fcHV0KHNuYXBzaG90LT5scmNfYm8pOw0KPiAgCWtmcmVlKHNuYXBzaG90KTsNCj4g
IH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaCBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9scmMuaA0KPiBpbmRleCBkNmRkNDA0NWQ2ZDcuLmQzMmZhMzFmYWEyYyAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5oDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9scmMuaA0KPiBAQCAtNTYsNiArNTYsNyBAQCB2b2lkIHhlX2xyY19k
dW1wX2RlZmF1bHQoc3RydWN0IGRybV9wcmludGVyICpwLA0KPiAgdm9pZCB4ZV9scmNfZW1pdF9o
d2Vfc3RhdGVfaW5zdHJ1Y3Rpb25zKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxLCBzdHJ1Y3QgeGVf
YmIgKmJiKTsNCj4gIA0KPiAgc3RydWN0IHhlX2xyY19zbmFwc2hvdCAqeGVfbHJjX3NuYXBzaG90
X2NhcHR1cmUoc3RydWN0IHhlX2xyYyAqbHJjKTsNCj4gK3ZvaWQgeGVfbHJjX3NuYXBzaG90X2Nh
cHR1cmVfZGVsYXllZChzdHJ1Y3QgeGVfbHJjX3NuYXBzaG90ICpzbmFwc2hvdCk7DQo+ICB2b2lk
IHhlX2xyY19zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfbHJjX3NuYXBzaG90ICpzbmFwc2hvdCwg
c3RydWN0IGRybV9wcmludGVyICpwKTsNCj4gIHZvaWQgeGVfbHJjX3NuYXBzaG90X2ZyZWUoc3Ry
dWN0IHhlX2xyY19zbmFwc2hvdCAqc25hcHNob3QpOw0KPiAgDQoNCg==
