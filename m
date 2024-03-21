Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2904C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 19:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C89112051;
	Thu, 21 Mar 2024 19:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSlqmulv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2944112051
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 19:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711048226; x=1742584226;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=4XNwtP448JraTMi6lfrDGo0cJfTE8cubo45P0f3UN3Y=;
 b=PSlqmulvNbCZsU8gljEs2BZWm7E16eL1jSdp/F8cfk0zP236my/fsM8S
 /yr13mFr/TwESHw/ZiIIXgizcPLO42h2o4pnKfspV9ng0omO6yvjRu2J6
 XYMKtG4LvPmHi7KLQr11eCGvomm8Aq4tv7v4sDikyxw4gSVbCSXE6naYr
 6Qj1MKLzZTXNT/x4paHuBY27qpprWkMu+4/qh5iOmdwxtW9j/lnt7nHEu
 9PXRLy+HaatSbt7TNZAQbFkJuScAifDsYZUTi4f8FFI+9Ycwyf6hBUOpl
 96iR72pneyYBax49A3y7k/rYrqTMpsl2JzKPD3TYjcjAuqE1lQCeu1LLk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16612336"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="16612336"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 12:10:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14663128"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 12:10:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 12:10:24 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 12:10:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 12:10:24 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 12:10:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGYENjbfGrbmLB2kkGq7AgVyDFiUHVuopTzm+08gc/5ms1J6HP0OENqmdYssCCnRukDWW1iALZMAzyu9KilABDFGi/fsWdYPhEVsAUMIL4H80OH6Bxc7npYaGTTP2xxVVmjhfLreShSymEv72qi7Agr399Rw0iQD6djk7oLKUReB+BKgEzW1f1KwGntm26Y+bIRLPj6ZKB6UPEwcbpPL5ng4ThBq1MX8qKos0UAyH/d9h53nAGndijDhQguYkBNnetIi0vDH1Ti4bGYBZ1fWaRoyXWy4h6FPOP5dzvJgagmyUQf2Jbqt6nno6ZHuUqpcd7sg/FfzmfhIMoC1jK89cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XNwtP448JraTMi6lfrDGo0cJfTE8cubo45P0f3UN3Y=;
 b=LCF+FismxnYdBvI6TilrOZFCTqUe4r+Kty36FfQc9CsOHvcRhJQ4lKbgQ8FJjngCMxtFr60o54MQ++WJeDTOag7XlUw3GL+RGoE+xbDx7xITwlSsbkcEHEO4jfl4FcHWjtXLEU1knpKFPGtBS7vuFryhmqmB02ix+0Uv39GSddss+iaLy4cPz7X1jPFV0J27cv40nqxPongCscfwf4f6mrciQAUqInFLGtBS7AQvnt1kpodOEY6lwp2MVgxK14CEgndxEc+PFrvDgIgKOV3IMnTZzOaIGJppEyXCLytPKKyw0Cy/s1MJ+RCCPi+Q8CIfJ1uWku6TfFCAhzRvSp1F3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY5PR11MB6284.namprd11.prod.outlook.com (2603:10b6:930:20::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13; Thu, 21 Mar
 2024 19:10:21 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 19:10:21 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/xe: remove unused struct xe_device members
Thread-Topic: [PATCH] drm/xe: remove unused struct xe_device members
Thread-Index: AQHae6sbP0qBmPEnHkmXE5RqMahQ+7FCj3wA
Date: Thu, 21 Mar 2024 19:10:21 +0000
Message-ID: <e8feb9d32ad698a111acd6ee475ee304b5893db4.camel@intel.com>
References: <20240321161548.3509672-1-jani.nikula@intel.com>
In-Reply-To: <20240321161548.3509672-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY5PR11MB6284:EE_
x-ms-office365-filtering-correlation-id: ef8eb3ed-989f-481c-3b41-08dc49da8dff
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U8NeBpjA4CbtyPcP4ZOMWiQcBjoMp1ZyFB44cjrBU4THH7EEGsN/exHrMgM8RBelhfiM0+4+wIRkQX40WKX8lwqi39p/EWodoo6nqpM4RMqXapg0fQ3P/0k7ge6nMBaoqlL/iGemua+csGnKrU0kmK8yS8SRymQB7ioqEqefO/FSq9MZkCva3S+iJtgo8z8qvTjtqhRHCK8MxGdHjfXmQuBN4GvQoMJxQd3SY2xYJUyr57MASXUAanVMvBfbIx0/kGQzZXAtuC5iLNec44TtWueqEMJE9cheSaFfi4nDb5blEMNK6lJgMcsIRYes97txFzGhJqwREnT4I//3Cd+nasw+TzynQ1DTHAYag2dMUbVe1j/OBxy5JOWAXHc9+O8yzo0NyjT37plm1ioP2PTq48dnA7FJf9olGD73JF668BsoxHOji8vu9ADHeDSk5+H8B9HFlYBke8oy0veT3BSGYgHFb2X22AGzp9v7OnwESVqHaX9bB6pGgZqeBgDVinS5l2XvYE6wB5ON0jm4n+7xYqvhrO4qfkiOjSWdaR8hPfWFAGXRQr0N2N8ql+WmvKASg5m/ydqpLNAUueioYTEWfxhW5zcoeTP7chbzcXtGnli+2imETsDQdLFHMu79BwdZ5vk3SU+kN+rHoj1fBq7I7oju8ZJQeWbfB9vsprQEDg14UrGJhKF8YQOSqMAVhSAAFJ+9kfK/94dskpXNKhYlET/Rlrjo6N/ED4nFEbzdqKQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjBmdGR0YTR0aE8xSTd0dU1IOGd1cUo2NEVGb1FYSVQrQWszZE10QWM1OFRO?=
 =?utf-8?B?TUNlSkg0NkdIU3BSSnpmeThpV01xTHFZU0VGWjBvYjhzWVBxWjlNYlFhcVVp?=
 =?utf-8?B?VC9YQzBQQUYyMVFFdk9ZdXpYV05xeG90VTl4M2JJak5vM0dmMU9zSFVPWXN6?=
 =?utf-8?B?aTdyMDFMRTNpclBMb1gxNFRVOWk5OG5oU0JrN2ZJYi9VcG1YMWRQZEhnQ0p4?=
 =?utf-8?B?cGR5dEVzNFpQMVFzV2huM3hjMGVIZlh5U2JTcjlyUVNUVlRoL2tHZ0tjM3Ey?=
 =?utf-8?B?VVR0ZGFqUWdCbkU3dUw3SEYvU2hROEx1Z3REeVRZdHpGMzVReHdnSG85MWNV?=
 =?utf-8?B?WlBwMWN2bzZ6ZmE2S3JYTWxlZlU5MWhvRVk3Y211d09DSGdrUWR2dW9UU2Qv?=
 =?utf-8?B?U25FV3pSYUx6eEZlaVlJRnFiSkZQZnpVUkJxZG9peGszK3hMRy85VGw4NTdI?=
 =?utf-8?B?N0VBeWdjYzJleWdLSzFQd3dXbkt3eU5URFBMcUI0dzRydWVlKzBTUlhpenNw?=
 =?utf-8?B?MDY4bEduWitqWXMvN3R2V01ETE9xNnpBQzZZbHR3bFRqdjN2Sm4rMW5CbVhy?=
 =?utf-8?B?Yy93RTRrTTVaTEhsM3FWZGtjNGhNWmVvSXJ5T2x3WmFPMmRNVS90aTJNV2Zz?=
 =?utf-8?B?YzNpUkk3cHowV3YzRlF5eU9neTZpZ3BPUVphVnI5WDNnblQ5TGZabHNjMmtP?=
 =?utf-8?B?TmlRYXJxd0pKL3Bqc2M1S2cyekU2ZnlGbEU4QjBLQ1NmaXZPa2U4NzBWQlNP?=
 =?utf-8?B?NFVadFFSU1lybnl3bFJab0lXLzhWdzN6bWFpWVRWSWtiL1A3VUtZOVJtYmJx?=
 =?utf-8?B?cXYranVYMDhNcDN5MHFoY25qa1UyUm1TMHIvQjVjcnFBRHphRGp5Y1c1eFdL?=
 =?utf-8?B?R3YzYVF5TEtyWnpiSUZBVUdwZmZoUmh4bmt1VnlUd2FyQmFLNDM0YURlK2NH?=
 =?utf-8?B?MVpOa3Aya3gvS2x3UkxuTUVMWHRYRStmdWYzS2xvYUxOaFlGb1YwSlYyK2pq?=
 =?utf-8?B?akRIMnM3TUs1TXV5b09YQm9pRzBVRTdRemMwaDRmQlNpS1VtTHlTWmFwQXJO?=
 =?utf-8?B?L2tTY0M1eWttdnRGSElEMG5zOEhCeS8yVU51S1h1OVZGZHVnOUlmd0dwWjBK?=
 =?utf-8?B?QTFOL1hUeHdhRE95NEo2U3gxT0lJRjZZZU1MM1cwMFVJUy90M0pQWVhncGFq?=
 =?utf-8?B?UGw0RjZ2dzM4R2hNOXkwWVZFeC9vSWNpSmZxNnpYNytuQUorRHRmcGFVRmRC?=
 =?utf-8?B?ekthbUpDYWlZbkNYR29yWXFHN0NkY3crbE54dkEyclFmcS9ZWTQ0dmFSSEhG?=
 =?utf-8?B?SXNWdCtNY1NOYXBadTdVWTRzTVZGOUhxVmcxYUJsMmxWQ1NVZWJDM3EyWTEy?=
 =?utf-8?B?R0w5Sk5wV09IMlI3N2V1TFhTbFZGeS9sUkh0NjhYd2lFNHdtbGN0dk56R1d3?=
 =?utf-8?B?aEs2LzhlVERFMUdtNGNjaHFsUnJMSjRMdnJRRE1aclBKZXdraG1UOHFseXZs?=
 =?utf-8?B?cWJmaXJpOVVjZFpCYzVxUjlMcDAydlRLK1I0S3NHbEdVOE84dlBVLzdjWFpo?=
 =?utf-8?B?bUpTZm5oUlFlcllMcU45Z0wzKzJKcWJXL3B1VmVNbW1yc1Rpemk3UnlWdDBW?=
 =?utf-8?B?c0g1Ynh0cHFOakhtYThzOHVLeVljQW5GNnp4bkdZTlp0UTdCTFhMTU1SQVVp?=
 =?utf-8?B?U0ROUTZsNmxSc1JEOUJXWGtWcTFJRmt3WjdCMjRMV241RzRiYVRKaGk3K3p3?=
 =?utf-8?B?d2psbWZUQzFza2o2ZmJzSVJsYzdRREh3YnMrRTFZMzFzdU1zZlplcXRQbTh1?=
 =?utf-8?B?UW1PL3kwNVljRXN3dHRpNHZDV0FVaFJTOTFuaU9hdmlSSEZtOUJrQ0RvcVE0?=
 =?utf-8?B?OGxnalZWcmpDY3R3U0ttU3NFSnB2RzMzYVpSN005c1Iwc1FIU2pZWlJ1Y3Rw?=
 =?utf-8?B?d0kwREJSOWJMS3pLYUFIbHVnTDNhQmdmeDE2akg2ZE5FN2ZRMldNQnp0b25y?=
 =?utf-8?B?M3N4S3hidFB2Q1V4NTJ3MU5PdEZwTzV4ajVhd1VDUk9MdVBuV25hN0txbVpW?=
 =?utf-8?B?S3dKWEtQUkVFbjY4dmtud05DbUxQTkN2YUQzL21UZHE0aWdaWElBYlpzMGZo?=
 =?utf-8?B?eXQ3RE4vYUh0Y3ZPN2ZNSG53U1FBWTlac3gxVWhOeDZFUDBmb3VBZndxczJq?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A613F61F20FCF4F8935E23C5BE3FA04@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8eb3ed-989f-481c-3b41-08dc49da8dff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 19:10:21.3460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AK/jKfc5lpFlykSULjDrFmRq7k2pkaa8fwykS1X3EbYdytRUaKZWeiC0LkkaywOjQroDW1O1e0uWR2R+cdsicA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6284
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

T24gVGh1LCAyMDI0LTAzLTIxIGF0IDE4OjE1ICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
bW9kZXNldF9yZXN0b3JlX3N0YXRlIGhhcyBiZWVuIHVudXNlZCBzaW5jZSBjb21taXQgNmFmMGZm
YzBkYjkzDQo+ICgiZHJtL2k5MTUvZGlzcGxheTogbW92ZSByZXN0b3JlIHN0YXRlIGFuZCBjdHgg
dW5kZXIgZGlzcGxheQ0KPiBzdWItc3RydWN0IikuDQo+IA0KPiBtZW1iZXIgZ2xvYmFsX29ial9s
aXN0IGhhcyBiZWVuIHVudXNlZCBzaW5jZSBjb21taXQgZTI5MjVlMTljMDA2DQo+ICgiZHJtL2k5
MTUvZGlzcGxheTogbW92ZSBnbG9iYWxfb2JqX2xpc3QgdW5kZXIgZGlzcGxheSBzdWItc3RydWN0
IikuDQo+IA0KPiBodGlfc3RhdGUgaGFzIGJlZW4gdW51c2VkIHNpbmNlIGNvbW1pdCA2Mjc0OTkx
MjU0MGIgKCJkcm0vaTkxNS9kaXNwbGF5Og0KPiBtb3ZlIGh0aSB1bmRlciBkaXNwbGF5IHN1Yi1z
dHJ1Y3QiKS4NCj4gDQo+IHNucHNfcGh5X2ZhaWxlZF9jYWxpYnJhdGlvbiBoYXMgYmVlbiB1bnVz
ZWQgc2luY2UgY29tbWl0IDNhN2UyZDU4ZjgwMA0KPiAoImRybS9pOTE1OiBtb3ZlIHNucHNfcGh5
X2ZhaWxlZF9jYWxpYnJhdGlvbiB0byBkaXNwbGF5IHN1Yi1zdHJ1Y3QgdW5kZXINCj4gc25wcyIp
Lg0KPiANCg0KUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFA
aW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBp
bnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5o
IHwgNSArLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlw
ZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiBpbmRleCA5Nzg1
ZWVmMmU1YTQuLjFkZjNkY2MxN2Q3NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZV90eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vf
dHlwZXMuaA0KPiBAQCAtNDk4LDEwICs0OTgsNyBAQCBzdHJ1Y3QgeGVfZGV2aWNlIHsNCj4gIAlz
dHJ1Y3QgbXV0ZXggc2JfbG9jazsNCj4gIA0KPiAgCS8qIFNob3VsZCBiZSBpbiBzdHJ1Y3QgaW50
ZWxfZGlzcGxheSAqLw0KPiAtCXUzMiBza2xfcHJlZmVycmVkX3Zjb19mcmVxLCBtYXhfZG90Y2xr
X2ZyZXEsIGh0aV9zdGF0ZTsNCj4gLQl1OCBzbnBzX3BoeV9mYWlsZWRfY2FsaWJyYXRpb247DQo+
IC0Jc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm1vZGVzZXRfcmVzdG9yZV9zdGF0ZTsNCj4gLQlz
dHJ1Y3QgbGlzdF9oZWFkIGdsb2JhbF9vYmpfbGlzdDsNCj4gKwl1MzIgc2tsX3ByZWZlcnJlZF92
Y29fZnJlcSwgbWF4X2RvdGNsa19mcmVxOw0KPiAgDQo+ICAJdW5pb24gew0KPiAgCQkvKiBvbmx5
IHRvIGFsbG93IGJ1aWxkLCBub3QgdXNlZCBmdW5jdGlvbmFsbHkgKi8NCg0K
