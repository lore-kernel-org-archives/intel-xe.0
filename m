Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC3DC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 13:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3977F10F659;
	Fri, 12 Apr 2024 13:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRq3OSaH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7018F10F656
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 13:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712929079; x=1744465079;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=WSeTwkWvVItVglQDs3IOYfxDhiDkmw4yCD+7XJjUq1I=;
 b=WRq3OSaHeLffclYhctg00ft1HXr3UFtd6lehHSq/MnLd5ruBQEc+cnup
 ZDfYUJLMjXahjSJ5c8BfgcXrXPYTvXoyK0EPnIpc2LmMXGQi5Ix2nlQeb
 fPP93BJysuDwrmtlhNZMGf3kV+47phVFUXDi7WSxFYaNJviD2Jo8rY+6a
 9K2T7/jySRFbWbA4uNJKuCyUWBsdF62F0FZc+zstlOvUf6PnxUNbfj1eQ
 PlGK+TFGgV9kUPRPE16/YB3DNcXiGCuY5UJMZMm15LGzYyhEz+hcToGx1
 viKrmd6+hveOJcaWSiaeixTLCjD2pYVvGrbdyBS4xu4gnB1Dzjg5RWJOt A==;
X-CSE-ConnectionGUID: ACDrVue9TfCthtwmfd1GwA==
X-CSE-MsgGUID: JzXC1GebRk2BDwuN+LYNlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8938090"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8938090"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 06:37:58 -0700
X-CSE-ConnectionGUID: GVhYPeTuTAqihMYX1Vi9jQ==
X-CSE-MsgGUID: UXyZ4anUSGCDiJPR2//f2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="26020374"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 06:37:55 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 06:37:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 06:37:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 06:37:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkRhi58fQ6KlJx7o9afAu71ZVr+q6hv9StCzpLbOPiVIusVQG13mN6vGCj4ImvKMKzWC/3ncboPje6hMaC+VF9lwMIoxD75Vxp/G4/KtX7cAG6kf6LdzpTtwdz7Nw0/OYMwrgD36j1MSLLEYKcX6GrFGLW0m/4ZFl1gxIKuYUD0YjiDG4DwGd6q56niE7/deW57SaqGxcKwAe5vNiQFdlW0QHUstUYHMX3ZYSnRWPfTF2vOmJKOBwWCHq/7lTt0PRJbiZKgbAy3JgBt5hMmOAN5NIrycHBNUr89yWKbgWVFHfeVUvZSJRlD4cvnPSsv8yYmt/TqrxlLz3WLTcW6Z9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSeTwkWvVItVglQDs3IOYfxDhiDkmw4yCD+7XJjUq1I=;
 b=GarvUVuf5wxV0tH0s5VqRefOvN0fU8r4MdXnFtIsq7PyqUCKMOmgTCi2ghnwjeWrMockGsY1yKiMfTUDsLGDSti7+IJsYxNPaTZQDgU/Hxf23pWHe7mhp/5kdQIRHaUAlGdFuKhAhY893kIPWNGRipHPyuBZdoDjvRrFkFTOJZg4DnCZGOF17927EokA0a7otx1YZWCQMSdXWZez8Ayr8qtcAClblRJlniyKxl2poFtGHUVUagQfk5j5LKfOjVUfuffUsHDIewaNZzabM0lruYEqRF8iL4JyLEXx0+HEMINw1TZoc8LJP8TEjF/hoGto3HyE+D8rA8OJ96VoJVn0fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CO1PR11MB5137.namprd11.prod.outlook.com (2603:10b6:303:92::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 12 Apr
 2024 13:37:52 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7430.045; Fri, 12 Apr 2024
 13:37:52 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/7] drm/xe/uapi: Add a query flag for
 has_device_atomics_on_smem
Thread-Topic: [PATCH v2 7/7] drm/xe/uapi: Add a query flag for
 has_device_atomics_on_smem
Thread-Index: AQHajL0cJKQYyiodik2lfOH8g7VFhrFko78A
Date: Fri, 12 Apr 2024 13:37:52 +0000
Message-ID: <cad95cdadee68a240fa5e645ced1f42c1c775ef1.camel@intel.com>
References: <20240412092249.3636-1-nirmoy.das@intel.com>
 <20240412092249.3636-8-nirmoy.das@intel.com>
In-Reply-To: <20240412092249.3636-8-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CO1PR11MB5137:EE_
x-ms-office365-filtering-correlation-id: 942b05df-13ae-4b97-dbdf-08dc5af5c0a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /orL8I1vSXAKGGZAHmpc6S9jJOdiuPFjHyJO4Tlb6Qgu5vZ1sy/VcAVozkVY+WONi4anpdI0fsIoJuK9raKj/0wpVqv8MLWCl879w3vpVVohSNpViEHG5UKIAcaKTfXJUz7cJ0d06lTNDIa5+MzAm+kjsF+tWJT2r5S3maSLrtJ8OIi2fbor3H1cncndmq9AdALvbGheGR/zqNu2bx/h+z2HRgKiWYvctDUjtqidRHI6QbLxiPD1+4j22Mqp0ElBUtFd3NBBqrOxo8qIpLlzkcZ4IdTijUE792DNnwEdH9ARMMWByNtIe/Rue0hV/Cq4iDi9GC9ayek0aEy3a3LqVcd9Tdj4dNQ/NfZuBh8af4W6K+9JwyJkUNbIhaww8SGkMC7ThD7aNJQtOrSYFvXf7N6w8gV8n6ZcPMQHi2qzs4qhUnE1ppsSsPSHldRTtecVYZJYUY7u0EfqCmU+ZeziFuT0NTtFPxW4X40OwmGC7dMU9Dtchm5K8YDRIf15+RGGieGprZCzFGc9GVEe/R3wkmgGyDhf8tWC9mpN0UiqotEawroixyrG8Be0WLKL7H9rHpL3tXUsWaDk+vePh+mhc8y10WUARwX7cgf6vlhPZ53VBwE19MzqmUuUfbUsFkILkx35PYCNXmEp3mqfvBy4kqp+qEfLI1c0NPZcg64a8Qxdw/BMeP3a3ds5RCK1YKbG8Ps4xXhFEYYwmkxBrhoWgo1kXbzOCIz9gg7tW0yQmHE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUErR0MxVHFheENidko4RkIwMHFiR2lWM3RQeFUwY2FpRURESkJ1VEtsV3cz?=
 =?utf-8?B?WU9qQUp0a1hiMTlJVGtiVnBuQ3VYdkwwb2U4QUdyaHUvT2xVUDUzRkprdHJ4?=
 =?utf-8?B?ekJQL0V6dEdxTDRaR0kwR1FHTWVUZDJMUEVTZEZPM3dvMWFTbG1UdnBGTk42?=
 =?utf-8?B?YWdOY04vYWRrcHJRV2d5WmQzRGtFbk9YeTFjVnEyOGxQeUR2cFR0cWljMSt5?=
 =?utf-8?B?VnZmRzA3OFl2MCthYytqenBFRFNReFJrYnAwV1F0eXdmcXVOWTdEYkUxdVJK?=
 =?utf-8?B?YVlnbHdCdEs2TjdxV2pPM0ZEYnM3Ynh1R0d0ZnZWUGpFMENOSDhFK1lqeEVM?=
 =?utf-8?B?TnpkZUV4ZXJIMElvS2ZaYVc1bmpFSm8yRG5EYi9PSldXdnJ5eHBMZmFueTRo?=
 =?utf-8?B?b1E4R1BaNFpHMGlFcnBZNXJ0VzlKSCtSQ1V2RmlkdWhDam5ZaWQ0aHBuYWFV?=
 =?utf-8?B?RytIOHRQQURXa0JDVkM5V3NWdzRYS0dYOGtaWGpCWnJHRzkzRHZ0ZGtod2lB?=
 =?utf-8?B?NnFTMEhQRXNJTGY3OWZVck0vNjZMQ1ozZzJuNzUwT01nVGtiT3BIY2NyMzZu?=
 =?utf-8?B?MEVnaldaZm9HaWpDQjEveml6OXVLVi80aTR3T2hjeGRDb1QzZUVRUTRCQ1pw?=
 =?utf-8?B?WlVoeVMwOWtoSE9kaUxUY0NxN1dFbWF5OFJRbHVMS0VsQmNHTHV0MGgvbFY5?=
 =?utf-8?B?d0F6ZktzUytJc3p6VzNJNDN2TlROS1haaUtCdU1ZVk12Q0pFd3ZJWGs3VDNT?=
 =?utf-8?B?TEFlVndia3Z0TGNtWHdraEZmbmthVmU5NU04aDZ2SHkzTEphWkZ0K3hpSmZ2?=
 =?utf-8?B?L2I0U3JZNm5LbklUZ0hGdVlIUUZWUFBBOElXcDZvbVFpMVZyTVhJaHYvSGk1?=
 =?utf-8?B?SXRtQW9TU2U3Z01zYjlCUUI5d0VDU1A3QlRsSHgxeUFLazZibVprMm9iQ2xp?=
 =?utf-8?B?S1pDWHJwTS9NNkR0aWxlTEM2Tk5tVHJFSW55bUU4T2FGUkZlSU42T3Q1Rk03?=
 =?utf-8?B?anJWYm03MnVuT1NsYWRKRVlSMFc4SklVUG1RdTZSTFFKOTV5a1lsZlNYYnQ2?=
 =?utf-8?B?czdESkNQUlRyd2hmZWw4QnZqSEprelA1SHQySGZNd3gvdDhYU1BzcGdHOW9L?=
 =?utf-8?B?OG5GNzVnaTV4UXNjcEZrZTR2bjVMZXowOC9MUTQ4YTI1ckh5eGlNVXc3NUIy?=
 =?utf-8?B?SkdwRTJRS0Y5ZUM4UVBPOUpVTUJuOUVTTndhNk5EV2ZwVWtLOTFndDFOZnlx?=
 =?utf-8?B?UUxtaUQrNHZCbTc0aWlSOXZKMm5lbVR2OFMxZTRpMmRKODZCdFVYcXB0REZy?=
 =?utf-8?B?SXpoTUgzMUoydXQyTWpWVmQxY1crZlVvNTQwTjVmWlJCUEkvMEY1NWhnTFAy?=
 =?utf-8?B?cUpPVy8wK3FYYjIvalNNY0dOcHNTbzBKUnRTVzZhUlRFRm8zZlBldmxwV05C?=
 =?utf-8?B?ZWtLK3IwSmpjNktLSUxQYlYvSGFHR0pYTisxQm9rekVzOHhHYnpIeDRpZ3BH?=
 =?utf-8?B?OXJhdTVNajZIMDlMckxzekNRMzFDYURzQll1RFE3VVhwVUxnZGRjZDhIbjU0?=
 =?utf-8?B?bEw2YmQ2QmZLVEJCMXhjOHAvYkM4RTF4Qyt1SkVuSW1hU2tjMkFMazh6aXFF?=
 =?utf-8?B?VzBoTlhqbk9wWEpWOTczL3VYODRveVhQYUwzLzczSlRaYkhueU53ak9XbmRX?=
 =?utf-8?B?bDI2SmU0TzBCczBzRE9BRUFrWDVZZTlTWENTTVBHSGVVVkFYaWYwazNobFNO?=
 =?utf-8?B?SmpoeGxiNDNSY3c5ZFNDY0tQQmZxN3lFL1Yreit5YVhiZnp4YVlFbzN4S3FF?=
 =?utf-8?B?S2VtUStKbHhBelYwdWxsTURBalhFT3B4ZWc3Rm5LM1RYU2dTUkxYQTJaQVZn?=
 =?utf-8?B?T2tBejVjZkE0enFDYUJtTGJyRFpFdktib3lzaTZvK0x0c0VQZTZNVjhSaVlk?=
 =?utf-8?B?TldZRTlBR2o4TWhBUGJFREw3ZExwSjZqMkFGOFlncDNNeGFCSk5OaVpZUmFt?=
 =?utf-8?B?b3pDYWZhalMraUE4MjlNTXlUd2VNTUhxK0lUMXlJbU1KWFpET2EzeGNmZHNa?=
 =?utf-8?B?TUNVNVRrbUJNUC9Za2xOYkxKcmhIbEx4dUFtRVBsbzdaZ00vQ0dvaVFaNzA5?=
 =?utf-8?B?WmI2cjZYOGdvbDVOekZEYlRUZ1AwdERwZklmR0tuVnVvbW1jM3ZDbEFDdU1o?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E72F7D00AF37048902F94E1EE425E39@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942b05df-13ae-4b97-dbdf-08dc5af5c0a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 13:37:52.4936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jR9I21FEnqgxC43nbAIMwECzkq+6yAF66Z5a7AOq8LjbfcYvZBbDYYLXKLgr30peqjjqd3wYX2dvxwbCWamTMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5137
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

T24gRnJpLCAyMDI0LTA0LTEyIGF0IDExOjIyICswMjAwLCBOaXJtb3kgRGFzIHdyb3RlOg0KPiBB
ZGQgYSBxdWVyeSBmbGFnIGZvciB4ZS0+aW5mby5oYXNfZGV2aWNlX2F0b21pY3Nfb25fc21lbQ0K
PiBhcyB0aGlzIGlzIHBsYXRmb3JtIGRlcGVuZGVudC4gVGhpcyBmbGFnIGNhbiBiZSB1c2UgdG8g
aW5mb3JtDQo+IHdoZXRoZXIgRFJNX1hFX1ZNX0JJTkRfRkxBR19ERVZJQ0VfQVRPTUlDUyBjYW4g
YmUgZWZmZWN0aXZlbHkNCj4gYXBwbGllZCBmb3IgYSBnaXZlbiBwbGF0Zm9ybS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAaW50ZWwuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgNCArKystDQo+ICBpbmNsdWRlL3VhcGkv
ZHJtL3hlX2RybS5oICAgICB8IDMgKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9xdWVyeS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gaW5kZXggZGY0
MDdkNzNlNWY1Li5iOGE2MDY2OThlMzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9xdWVyeS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IEBA
IC0zMTIsNyArMzEyLDcgQEAgc3RhdGljIGludCBxdWVyeV9tZW1fcmVnaW9ucyhzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSwNCj4gIA0KPiAgc3RhdGljIGludCBxdWVyeV9jb25maWcoc3RydWN0IHhlX2Rl
dmljZSAqeGUsIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5ICpxdWVyeSkNCj4gIHsNCj4gLQlj
b25zdCB1MzIgbnVtX3BhcmFtcyA9IERSTV9YRV9RVUVSWV9DT05GSUdfTUFYX0VYRUNfUVVFVUVf
UFJJT1JJVFkgKyAxOw0KPiArCWNvbnN0IHUzMiBudW1fcGFyYW1zID0gRFJNX1hFX1FVRVJZX0NP
TkZJR19TVVBQX0RFVl9BVE9NSUNfT05fU01FTSArIDE7DQo+ICAJc2l6ZV90IHNpemUgPQ0KPiAg
CQlzaXplb2Yoc3RydWN0IGRybV94ZV9xdWVyeV9jb25maWcpICsgbnVtX3BhcmFtcyAqIHNpemVv
Zih1NjQpOw0KPiAgCXN0cnVjdCBkcm1feGVfcXVlcnlfY29uZmlnIF9fdXNlciAqcXVlcnlfcHRy
ID0NCj4gQEAgLTM0MSw2ICszNDEsOCBAQCBzdGF0aWMgaW50IHF1ZXJ5X2NvbmZpZyhzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSwgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5KQ0KPiAgCWNv
bmZpZy0+aW5mb1tEUk1fWEVfUVVFUllfQ09ORklHX1ZBX0JJVFNdID0geGUtPmluZm8udmFfYml0
czsNCj4gIAljb25maWctPmluZm9bRFJNX1hFX1FVRVJZX0NPTkZJR19NQVhfRVhFQ19RVUVVRV9Q
UklPUklUWV0gPQ0KPiAgCQl4ZV9leGVjX3F1ZXVlX2RldmljZV9nZXRfbWF4X3ByaW9yaXR5KHhl
KTsNCj4gKwljb25maWctPmluZm9bRFJNX1hFX1FVRVJZX0NPTkZJR19TVVBQX0RFVl9BVE9NSUNf
T05fU01FTV0gPQ0KPiArCQl4ZS0+aW5mby5oYXNfZGV2aWNlX2F0b21pY3Nfb25fc21lbTsNCj4g
IA0KPiAgCWlmIChjb3B5X3RvX3VzZXIocXVlcnlfcHRyLCBjb25maWcsIHNpemUpKSB7DQo+ICAJ
CWtmcmVlKGNvbmZpZyk7DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5o
IGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBpbmRleCBhNDRjMDU3ZDQ0NzEuLjQ4MDRi
OGE1ZDAyOCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiArKysg
Yi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IEBAIC0zOTQsNiArMzk0LDggQEAgc3RydWN0
IGRybV94ZV9xdWVyeV9tZW1fcmVnaW9ucyB7DQo+ICAgKiAgLSAlRFJNX1hFX1FVRVJZX0NPTkZJ
R19WQV9CSVRTIC0gTWF4aW11bSBiaXRzIG9mIGEgdmlydHVhbCBhZGRyZXNzDQo+ICAgKiAgLSAl
RFJNX1hFX1FVRVJZX0NPTkZJR19NQVhfRVhFQ19RVUVVRV9QUklPUklUWSAtIFZhbHVlIG9mIHRo
ZSBoaWdoZXN0DQo+ICAgKiAgICBhdmFpbGFibGUgZXhlYyBxdWV1ZSBwcmlvcml0eQ0KPiArICog
IC0gJURSTV9YRV9RVUVSWV9DT05GSUdfU1VQUF9ERVZfQVRPTUlDX09OX1NNRU0gLSBGbGFnIGlz
IHNldCBpZiB0aGUgZGV2aWNlDQo+ICsgKiAgICBzdXBwb3J0cyBkZXZpY2UgYXRvbWljcyBvbiBz
eXN0ZW0gbWVtb3J5DQo+ICAgKi8NCj4gIHN0cnVjdCBkcm1feGVfcXVlcnlfY29uZmlnIHsNCj4g
IAkvKiogQG51bV9wYXJhbXM6IG51bWJlciBvZiBwYXJhbWV0ZXJzIHJldHVybmVkIGluIGluZm8g
Ki8NCj4gQEAgLTQwOCw2ICs0MTAsNyBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2NvbmZpZyB7DQo+
ICAjZGVmaW5lIERSTV9YRV9RVUVSWV9DT05GSUdfTUlOX0FMSUdOTUVOVAkJMg0KPiAgI2RlZmlu
ZSBEUk1fWEVfUVVFUllfQ09ORklHX1ZBX0JJVFMJCQkzDQo+ICAjZGVmaW5lIERSTV9YRV9RVUVS
WV9DT05GSUdfTUFYX0VYRUNfUVVFVUVfUFJJT1JJVFkJNA0KPiArI2RlZmluZSBEUk1fWEVfUVVF
UllfQ09ORklHX1NVUFBfREVWX0FUT01JQ19PTl9TTUVNCTUNCj4gIAkvKiogQGluZm86IGFycmF5
IG9mIGVsZW1lbnRzIGNvbnRhaW5pbmcgdGhlIGNvbmZpZyBpbmZvICovDQo+ICAJX191NjQgaW5m
b1tdOw0KDQp0aGlzIHdpbGwgdXNlIGEgd2hvbGUgNjRiaXRzIGZvciBqdXN0IG9uZSBiaXQsIGJl
dHRlciBhZGQgYXMgYWRkIGFzIGEgYml0IGluIERSTV9YRV9RVUVSWV9DT05GSUdfRkxBR1MoYWZ0
ZXIgRFJNX1hFX1FVRVJZX0NPTkZJR19GTEFHX0hBU19WUkFNKQ0KDQo+ICB9Ow0KDQo=
