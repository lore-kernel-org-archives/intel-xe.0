Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA17C5DF9D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 08:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C80F10E61C;
	Thu, 27 Aug 2026 08:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TgAeAWSl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E69510E61C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 08:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787819276; x=1819355276;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iWvNdU1jwVhl4kjPraeumN4+V39wzPTPuUWLrS0Ku38=;
 b=TgAeAWSl38EtBRa8pahd4mas5GLTfo6cda29YNg6Op+GJo4nkGPWh+k+
 1f5S9MSIFrU8u3frkgtPCpq6pZc7s2q3y9/Gt6C4lZ7uPi1zWRkIF/VXW
 6rBRWfdaIEP9p/1giKOzejRshG/qelEGqXjRrrK3jrbr7ebrGIHU7HFA+
 /0kGTMBsevM6lce07uA+HT9Gq7fiO6MGFQZXbgBsgPF5zU6Iv5Y6O5KCv
 lPktUpvU/Ki/6iR+1OZL6j+mvH2KHfV8CRpm6JV4jBMaP1E8aLOXD3Fkh
 EyCj8imoFJhbSG6vsdqa+iSAcOS6i4M8CdFUh19gMH4U1hxjWiswMvkox g==;
X-CSE-ConnectionGUID: fcH8e9vJSpm/owUZCUNEmQ==
X-CSE-MsgGUID: xR3UDiktT5a06j+2wK7Prg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88519245"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88519245"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 01:27:56 -0700
X-CSE-ConnectionGUID: o1oc9DepQ5SIgnG7/W2v0A==
X-CSE-MsgGUID: 8SVIRcUBTYasBjFyEDJTUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="266026414"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 01:27:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 01:27:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 01:27:55 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 01:27:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIXnYFywLCo/w5d0slpeTSX10rpneJrx+WjmahCBfMZzZ+uBcR9Y81gDZ8+DLCuXbjKi/Vgr71F9bUDs+lZzOYznmonhs9PCi6LPjhEVvAuc0eh3nikIKlif9NiXyY2SULtZuDsmqUhOFPKFi/DzruiquqKRy3Afa7kyWMHwlgPZmM8Q2mlI4YyxpiKvJI+/1/5Wx125i2BC0nONLnoXo70UtwZfgwbg1arIR9GXytcpd6pdfP+BTH0sacr0O8KB2BaWaX1nw3m/6VTULpMl/SaFZJqcmFg9i0cXyuI7+xsnaCIwL18HPIVIingWz7mJGEK0Nay+HqJtW+F5qPyCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWvNdU1jwVhl4kjPraeumN4+V39wzPTPuUWLrS0Ku38=;
 b=FJ0KzT+N4keYWLsrU57a108/hfCfQONZKfm+F4q8WtiLQ4yC7I4Dsh44JFaxF195+cFqO17OJOM9mRG91GxwKrTARnshL5vKI07SNbKIghaRl9IBZvbfVdJ0Q+Vl0VljicRHm6eiF30GTVbCzZK8fl6IhZ4OOMjgf+TGiACGDS8PLRGQrDdYrpL3Y0FFG19rYsKg9JQBd9cjlrFVe5ZwhXE/vH62tbyqCkU+TGzPHKEdki4dr5qhl2tANVNMoe8ajAV54Vi9gcQDGlX4Pj/FcRIIn9xdVghWw0zT4lOtJ4FSGPt68QqvegKmFjh1L08UlA8qOckXP71+sDJxrZBV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA3PR11MB894536.namprd11.prod.outlook.com (2603:10b6:806:532::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 08:27:48 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 08:27:48 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>
Subject: RE: [PATCH V18 05/14] drm/xe: Guard teardown paths against purged BOs
Thread-Topic: [PATCH V18 05/14] drm/xe: Guard teardown paths against purged BOs
Thread-Index: AQHdNWIY50SXixkIrUiPbgLlAb0VU7axalQAgAAmo2A=
Date: Thu, 27 Aug 2026 08:27:48 +0000
Message-ID: <DS0PR11MB87180057BDFBC8A581502A7381AD2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-21-tejas.upadhyay@intel.com>
 <18bdabbf-855e-43ed-ba99-94adeea35a26@intel.com>
In-Reply-To: <18bdabbf-855e-43ed-ba99-94adeea35a26@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA3PR11MB894536:EE_
x-ms-office365-filtering-correlation-id: 071edcec-11bc-48f3-77ed-08df0415140a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10070799003|56012099006|10067099003|18002099003|22082099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: V87pwgSS3050Wwd88HqvpnrHQ9TOjNWM6LxatgRMxN8CW5qfCxoq/iHVHq2oS0pgMBnXM7XQ9ozhEA646UgIiSUa9dhdNpMldydy6Ku+WTtzZn4Sc3GZNW2t+tkmdSCYBIRh6cfnBmd7Vjzo2LEi2WfJy8tZJeoZzQBWJ289XCotHiOcBMw7790qnyC3JLatFXadWC7rVdcNOm5CQqkYQJIxBKzNi4+Q2JZQFCPTLSZrA3DAiv+CyFrDM57utU8LDJsp31C7ttYF/oR94SrQOgT+awQOzMzoHl8pFtJrO7ISFXa6v+8STeWifiS6YwERmEpmUPbU0mxJxYGMUFSK5gR6/vqphSb+nU+Qya+nFZVpnI4IkGltUS+DwR/eUpzEMh7uK5eJblwsNvZW5J4S169QDYpddl0Joc0Fl9TWc8biPWVYhozSU30dT/8plKif+bNr0xQg1mH4mqZxejDE0YgbyigbyKRtgGPUr8+xahFhM5aawsYUx5blZJBp+k2PB6FZP/dFxSEKKVjMGUlrclUFweay8cvwsExmrUA6tWpUjP9PU3hcdkFJxgc6g7kRHrF+1F0p/fAcDm26hsAQDwOouBnKCb7sOnXiTcX2w+WlBLo3pUyby4yEa/PTpO1eWMlisMNPcRrKAC/YvD4i9mwigveehamDGjROzGbWq/7MA/goN8h5kIdDC6IpUN2POE9W1Dfwc4iOKPn5/13QTdZFt2cbMFB9dpKsQIMBhTo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10070799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djNxVG9oRkQ1emIxWDU4eklKMUdveTM2RFc1RTBTQlZDRUs4UTVzMzFZYnBz?=
 =?utf-8?B?OGFmMk9HNk1wVEFzNmY4UmJtaFRFZ1Uza0JjY1FFQU16TzFjeDFwV3FjdFAw?=
 =?utf-8?B?TmFqVEFQbG5jMktCemNZWk5lWDFMMTR0bVYzRm5xbWpxMHZ2TkF1R09kOXhR?=
 =?utf-8?B?dWdIa3MxblduUlFuQXVSeXpxNDQrK3JBbDF2UmE2cTBRMTFpR0FQK21kVUo2?=
 =?utf-8?B?Y3QreEIveXhCYUpGMC9PMFRhQnhCU1ZIcy82d0IzQ1cxZHllMUdKTVZCUUJ3?=
 =?utf-8?B?Znc5c21zZllFQVl4dmZlQVlhVUJVSFJjWUphU1dIc2RLa3EwYWUrMFNuWXRK?=
 =?utf-8?B?TUUxRmFDZXNDL2M3N0gwWGcrMy9yVWVlcnlQREg1N0g0TTFtZWhENXF2YUpD?=
 =?utf-8?B?SWMrM053SUpGRU0rcDhzZmMzWFNYSk1hVk1iSlc1dHhReUVqeTlEYXBGa2Fz?=
 =?utf-8?B?ZFl5VjBBNk9waXpWaWVIcGZ2d21jQUl0Y2NRb0w5cTRubXJHc1BrTlZlMVhw?=
 =?utf-8?B?YVFpcFIzUWwzVjNNZzdMZHJsaFQ4NzA0eGdSL3RvaWU0Y0w0NVQwSngxa04z?=
 =?utf-8?B?R3FSUmRYRFNjRmtjbnE0ZkJEUitPY1ZoWEhHUE1GaEZQQ2JtdU5ET1FJOENz?=
 =?utf-8?B?dnZDcmFCVW1xZENzMkZ3Ui83NVF6a2tha1hmRkFQVlJMMXFHbjVxUDJPTFNj?=
 =?utf-8?B?VlFQOW1XRTZoVUtiVnVkb3U5S2VwQTZIQVdHWVo2S2tldEUrUGo2VWRsSXdp?=
 =?utf-8?B?ZlRKTGk3eE5sTytwTi9FRDIzc1ViUGc0Q1JQZ0hoRUtrV2ZTVEEwR3JTcUNY?=
 =?utf-8?B?UjRNR3c0dnE5NEdFNEpHaklUeWdkOWUyQTIwN2hGaFFteGJBbTArZnFqV3ZR?=
 =?utf-8?B?b245TUZFM0lOdmtRd0p5TFBMQkVDRVRRVXM3ck5ZNDJXSXcvZGo2ZkpES1A3?=
 =?utf-8?B?SXlIdmFkZGozNE9lZ2ZicFl4MWt6bmg0OVM0aXk4MUppSzFvbWpVdEZkdHMr?=
 =?utf-8?B?QWcrOENNS3FadktuS1Q4VUR0NjJmQ0lNOURXRVRIUmYyMlJEYXNQQXYybm1O?=
 =?utf-8?B?Z1Y2c0xkbTlTUU04b3JWV1ZHZ1lpSHpiMVc2QlpWUWJubEpTRGZVSXUzOE1t?=
 =?utf-8?B?UkNUaG9xb256UC8vamNZZzhPWE1WRG5tRXk3cTJOMjdhRFd0R0F1dHliUzNh?=
 =?utf-8?B?czdsZUtxUXhYeXk5b3V1NTZoaG9MclppMXVVS2JjakRyVG9VOGpMVnBnNkZ3?=
 =?utf-8?B?bTdWbjJsd2xybWdCQnB2bEYrSGY3bDdnWGVaQVg5OFhkRitqT3hIVTVGd0FI?=
 =?utf-8?B?NWVZQzFSSHpKUk80MGtBcUVrcU1LelZxMXFGSHRnZ3pkR3VlSFI5dVF1aExx?=
 =?utf-8?B?aHpISDJYdzBxM0FOWFNjcHVUM0c5S1Z5WXl1SGx5d1kyKzFHRmNRMGhqaEd1?=
 =?utf-8?B?eGpJVUNTdlRNR3dkT05BTzlpdHJJdVR5ZWpvUDdUWUZUMUlHQXYrTnR6cWlq?=
 =?utf-8?B?RXQ5ZVBxbk13T1FudkF5ZFQ1ZldFZzZzeHE3OUM3a1ZONkxoRldiYTQrVEsx?=
 =?utf-8?B?ZW42bkNpL213YjNhY2YxRWt5MjZmQ1ZIRkZueEZaSVJQekF6OFgwNllmcnlO?=
 =?utf-8?B?K3NEREFadUpwRHovQUJWY3hGbGs5TXNzUU5wakozVmcrWUxMb09vTC92ZlNZ?=
 =?utf-8?B?djJPTllXbVViL1NwRlhCVVZvQ01ldjZnai9PWVJNNi9MUjQrQUd2REg3K2ZL?=
 =?utf-8?B?Mmd3RnRWVUdleXBESXRHZXBCV2R5RVRpTE9tbUZkSjVFLy9iY211MzRJTnpP?=
 =?utf-8?B?SjBIbER0YUJnM2dpNUtCWDNpekJ1cG8vckJacU1UVityeE45c2w1UlpzM2xr?=
 =?utf-8?B?bzlUSVVoMHBNT3hIalR4OVJ0bGVwRnRydFR2MEcrSnNTVTh0WE1yQktrOE4x?=
 =?utf-8?B?SG52cjgzQU9xRi84ZVZ3NUcvUEhrNVExeDdXWFFqcURGb28xaTNEU29yL3gw?=
 =?utf-8?B?WktZcjZuRnVEL3VEZk05d2VMWnk1UkdYTFQyeEpUcVZMRFp1YWxvdllpTkgx?=
 =?utf-8?B?cUN2ZGZab3Q2am02UVMra1o2aTlyL0hCMHllbmg5UEI5Slp1MFhrQnNwLzgw?=
 =?utf-8?B?Z1hmTkkvZm5BZ05zYXFNVGlYWWpaZ2VVSTMzeUFEaUU1N2xWV0FUQUl6OGNK?=
 =?utf-8?B?S0llZEpFdEJPN3Y4WjVWNmlHZmVkZS9WRFVUdXpQNTQ2emdCRU9xV2REK0NP?=
 =?utf-8?B?MXY3T1MwRGdRZWV6SDF6VUhKbzBZY1ZuMVJXdGhTKzhIVzkzWTAvMTlFZHV5?=
 =?utf-8?B?NU40Y3JwTFB6dG9teFd5TG05Vzh3dm5TM0tHZXBrNTROa1hvcmVLL0xOL25z?=
 =?utf-8?Q?iG7tpe7NW0fIxY0CBIo99OSsuz+QO+x1qB2ZnuRz2/+qf?=
x-ms-exchange-antispam-messagedata-1: OOYXNQaGoCPxsw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IRyLH+lc49DArJklqG9TsDP+GGUoXRdE5E2Zd3P8msDGvJt7CYog3pMF0yQdmaFgYz+EvTDfow58xQ70kLbKweeywOa4WyoMLnPh1jktPOBIj3Uv3xvJLId4EV1qv+MRVLJliDvqZvovlJiImYaVGrlbooEzjgzi3AXLm6/HmVme4MjQR/acFORNgBh3f7/zB49d924UZdyvghD5Kfe0kDI2hjNqA4MoKY3taYAt+DC+UgIi6ocITZAfhZwVu34Bv2MUUAM0NLN8ie2uKeSRmx3BU38Tn9TSjTcIpQ7lsLoQ+EXPKKpjwwd9KHzSVbYnn+aSSHSbMTvB9cQV1GBAAQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071edcec-11bc-48f3-77ed-08df0415140a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 08:27:48.6836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXQU/cwZUOC7yKVfqT0bpqubrOTWGIIOqlJtfZk4Rhv80m9KmVr8WotQ/j/eWN2U5bMXxELr57j/mJh5H1A8KlJkYFiyDzikGgUWaXKWkAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB894536
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2hpbWlyYXksIEhpbWFs
IFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gU2VudDogMjcgQXVn
dXN0IDIwMjYgMTE6MzkNCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50
ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogVml2aSwg
Um9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IFdhamRlY3prbywgTWljaGFsDQo+IDxt
aWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMTggMDUv
MTRdIGRybS94ZTogR3VhcmQgdGVhcmRvd24gcGF0aHMgYWdhaW5zdA0KPiBwdXJnZWQgQk9zDQo+
IA0KPiANCj4gDQo+IE9uIDI2LTA4LTIwMjYgMTk6MjEsIFRlamFzIFVwYWRoeWF5IHdyb3RlOg0K
PiA+IFZSQU0gcGFnZSBvZmZsaW5pbmcgY2FuIHB1cmdlIEJPcyB0aGF0IGFyZSBzdGlsbCByZWZl
cmVuY2VkIGJ5IHBhZ2UNCj4gPiB0YWJsZXMsIGV4ZWMgcXVldWVzLCBhbmQgRE1BLWJ1ZiBleHBv
cnRzLiBBZGQgeGVfYm9faXNfcHVyZ2VkKCkgZ3VhcmRzDQo+ID4gaW4gdGhlIHRlYXJkb3duIHBh
dGhzIHRvIHByZXZlbnQgdW5waW5uaW5nIG9yIG1hcHBpbmcgYW4NCj4gPiBhbHJlYWR5LXB1cmdl
ZCBCTzoNCj4gPg0KPiA+IC0geGVfYm9fdW5waW5fbWFwX25vX3ZtKCk6IHNraXAgdW5waW4gaWYg
cHVyZ2VkDQo+ID4gLSB4ZV9kbWFfYnVmX21hcCgpOiByZXR1cm4gLUVOT0VOVCBlYXJseSBpZiBw
dXJnZWQNCj4gPiAtIHhlX2V4ZWNfcXVldWVfdXBkYXRlX3J1bl90aWNrcygpOiBza2lwIExSQyB0
aW1lc3RhbXAgcmVhZCBpZiBwdXJnZWQNCj4gPiAtIHhlX3B0X2Rlc3Ryb3koKTogc2tpcCB1bnBp
biBpZiBwdXJnZWQNCj4gPg0KPiA+IHYzKFNhc2hpa28pOg0KPiA+IC0gUmVtb3ZlIGRtYV9yZXN2
IGlzIGFscmVhZHkgaGVsZA0KPiA+IHYyKEhpbWFsKToNCj4gPiAtIHRha2UgZG1hX3Jlc3YgbG9j
ayBiZWZvcmUgY2FsbGluZyB4ZV9ib19pc19wdXJnZWQoKQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4g
PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5oICAgICAgICAgfCAzICsrLQ0KPiA+ICAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RtYV9idWYuYyAgICB8IDMgKysrDQo+ID4gICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZXhlY19xdWV1ZS5jIHwgOCArKysrKystLQ0KPiA+ICAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3B0LmMgICAgICAgICB8IDMgKystDQo+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2JvLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaA0KPiA+
IGluZGV4IGVlZGU2NzhhZDMwMy4uZGZjZDBlNTcwNzNiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9iby5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Jv
LmgNCj4gPiBAQCAtMzY0LDcgKzM2NCw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB4ZV9ib191bnBp
bl9tYXBfbm9fdm0oc3RydWN0DQo+IHhlX2JvICpibykNCj4gPiAgIHsNCj4gPiAgIAlpZiAobGlr
ZWx5KGJvKSkgew0KPiA+ICAgCQl4ZV9ib19sb2NrKGJvLCBmYWxzZSk7DQo+ID4gLQkJeGVfYm9f
dW5waW4oYm8pOw0KPiA+ICsJCWlmICgheGVfYm9faXNfcHVyZ2VkKGJvKSkNCj4gPiArCQkJeGVf
Ym9fdW5waW4oYm8pOw0KPiA+ICAgCQl4ZV9ib191bmxvY2soYm8pOw0KPiA+DQo+ID4gICAJCXhl
X2JvX3B1dChibyk7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kbWFf
YnVmLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kbWFfYnVmLmMgaW5kZXggYmYwNzI4
ODM4ZWFkLi41ZDlmMWNkMjRiN2YNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZG1hX2J1Zi5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RtYV9i
dWYuYw0KPiA+IEBAIC0xMDQsNiArMTA0LDkgQEAgc3RhdGljIHN0cnVjdCBzZ190YWJsZSAqeGVf
ZG1hX2J1Zl9tYXAoc3RydWN0DQo+IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLA0KPiA+ICAg
CXN0cnVjdCBzZ190YWJsZSAqc2d0Ow0KPiA+ICAgCWludCByID0gMDsNCj4gPg0KPiA+ICsJaWYg
KHhlX2JvX2lzX3B1cmdlZChibykpDQo+ID4gKwkJcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7DQo+
ID4gKw0KPiA+ICAgCWlmICghYXR0YWNoLT5wZWVyMnBlZXIgJiYgIXhlX2JvX2Nhbl9taWdyYXRl
KGJvLCBYRV9QTF9UVCkpDQo+ID4gICAJCXJldHVybiBFUlJfUFRSKC1FT1BOT1RTVVBQKTsNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5jDQo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5jDQo+ID4gaW5kZXggOTFlZDZj
MGZhYzg0Li45MWU0ZjNjYjU2MTcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2V4ZWNfcXVldWUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1
ZXVlLmMNCj4gPiBAQCAtMTU3Miw4ICsxNTcyLDEyIEBAIHZvaWQgeGVfZXhlY19xdWV1ZV91cGRh
dGVfcnVuX3RpY2tzKHN0cnVjdA0KPiB4ZV9leGVjX3F1ZXVlICpxKQ0KPiA+ICAgCSAqIGVycm9y
cy4NCj4gPiAgIAkgKi8NCj4gPiAgIAlscmMgPSBxLT5scmNbMF07DQo+ID4gLQluZXdfdHMgPSB4
ZV9scmNfdXBkYXRlX3RpbWVzdGFtcChscmMsICZvbGRfdHMpOw0KPiA+IC0JcS0+eGVmLT5ydW5f
dGlja3NbcS0+Y2xhc3NdICs9IChuZXdfdHMgLSBvbGRfdHMpICogcS0+d2lkdGg7DQo+ID4gKwl4
ZV9ib19sb2NrKGxyYy0+Ym8sIGZhbHNlKTsNCj4gPiArCWlmICgheGVfYm9faXNfcHVyZ2VkKGxy
Yy0+Ym8pKSB7DQo+ID4gKwkJbmV3X3RzID0geGVfbHJjX3VwZGF0ZV90aW1lc3RhbXAobHJjLCAm
b2xkX3RzKTsNCj4gPiArCQlxLT54ZWYtPnJ1bl90aWNrc1txLT5jbGFzc10gKz0gKG5ld190cyAt
IG9sZF90cykgKiBxLT53aWR0aDsNCj4gPiArCX0NCj4gPiArCXhlX2JvX3VubG9jayhscmMtPmJv
KTsNCj4gPg0KPiA+ICAgCWRybV9kZXZfZXhpdChpZHgpOw0KPiA+ICAgfQ0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
dC5jDQo+ID4gaW5kZXggNWQ5OTBjMWMzNzQwLi5kYmYxYWEyNmEyMWIgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcHQuYw0KPiA+IEBAIC0yMTIsNyArMjEyLDggQEAgdm9pZCB4ZV9wdF9kZXN0cm95KHN0
cnVjdCB4ZV9wdCAqcHQsIHUzMiBmbGFncywNCj4gc3RydWN0IGxsaXN0X2hlYWQgKmRlZmVycmVk
KQ0KPiA+ICAgCQlyZXR1cm47DQo+ID4NCj4gPiAgIAlYRV9XQVJOX09OKCFsaXN0X2VtcHR5KCZw
dC0+Ym8tPnR0bS5iYXNlLmdwdXZhLmxpc3QpKTsNCj4gPiAtCXhlX2JvX3VucGluKHB0LT5ibyk7
DQo+ID4gKwlpZiAoIXhlX2JvX2lzX3B1cmdlZChwdC0+Ym8pKQ0KPiA+ICsJCXhlX2JvX3VucGlu
KHB0LT5ibyk7DQo+IA0KPiBJTU8sIG1vdmluZyBwdXJnZSBjaGVjayB3aXRoaW4geGVfYm9fdW5w
aW4gc2VlbXMgYmV0dGVyLCB3aXRoIGNvbW1lbnQNCj4gd2hhdCBtaWdodCBjYXVzZSBwdXJnZS4N
Cg0KQWNrLCBhZ3JlZSBvbiB0aGlzLCBsZXQgbWUgbW92ZSBpdCBpbiB4ZV9ib191bnBpbg0KDQpU
ZWphcw0KPiANCj4gPiAgIAl4ZV9ib19wdXRfZGVmZXJyZWQocHQtPmJvLCBkZWZlcnJlZCk7DQo+
ID4NCj4gPiAgIAlpZiAocHQtPmxldmVsID4gMCAmJiBwdC0+bnVtX2xpdmUpIHsNCg0K
