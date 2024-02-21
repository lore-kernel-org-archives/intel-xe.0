Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77026C48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 17:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EAA10E5E2;
	Wed, 21 Feb 2024 17:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cq9kkOWA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB67710E5E2
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 17:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708538184; x=1740074184;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=OQPXwSEEJZpUCz3Lr1hXVfuCvoMlEWBBjpX/6Uq/HCw=;
 b=Cq9kkOWAeGc2aQTLeswy75m+jDVk6HLhbf8hZNCzRZRSTuWq1qSbqZo7
 ktZWIz98pbb8ICI6JRpHBMV7EZPvxYZUqX9EGLQQHquIJbg5FiZTy6B2e
 j8MwMJM8PBZIVLwcuPLzOyhSYprKfgrgYn4F3ERDCT2zVLX0WlFY7MWfo
 hu+4giMfkq5UOYiNmkX+KqXRbKRh4hXAPoSQw1idR9OAPSLG/VyTjSVyo
 9uADAvvT1P6QyJSfmH/0DAF2u/xNq4GvErSIiCna+qQ/wVVGb1VyUUsaJ
 KNSxgZutNSFgs3mJnH3/YrkIymOfdFgmIsEOyc+uajfAwSYpB0/I/tfuU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13276777"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="13276777"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 09:56:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5144871"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 09:56:24 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 09:56:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 09:56:22 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 09:56:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ds5eTWwI7BchWCNUUVXXXmjjfms1zo46Z3zhgQKh0ngcvSDpI/dXVXy4nC+HVYfW5r9GGNDDYFdjj3d1Syc/vrZQmCrbaaPzX91n8zk8GY5oL/UzA48v0Xh2Q0TNJm+AoK+lF1+NWssSWb3cUy+Gpnder/9CUioKiDXVlzWuB/CJoKgGfQHSWZP8HTlVt0OF/eT5CxVp+1tcYoGLqEajEGOukhNPBwvDsw0uSc+8/e5IK0Ivmtv3DA+dt+aosBUR5lWNJ81w36eNVK7UdSNpf5bksrNQKiWApjHPteX8Jtdycw+hWy2yGc7+x0DovNI5yISJvHDYYd5eNgHROxO5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQPXwSEEJZpUCz3Lr1hXVfuCvoMlEWBBjpX/6Uq/HCw=;
 b=l2O+uCZx8lEl1ctOd4aLicm3z9eWwno9UKLBSwqO7zUw5f498XK45k7bmCwsw+q1dE8UKW2fvWWIfMrS41dFBS+V9ZwbyURRiogYP+koiMZ1RLyJocLx+s8Tj+YUiRRRCtAoKOUS3QqlVU72gfohUpVqUa/tUKHGrYkRf7FCplbeyTPHpGenp1mLtnGRxmRPvGaomfs1UA5YunTt5PGLKRtEyoCcpCThA6GBFlCA1qKT0zeN0QG4xn9j6v1duV30mokD7F6WO2+TbsylvIOPdIZn44naZl6qVwT4d87kxatp69XkPG7nkaiL8vWqtdeVt2ulnhPwudKagJs0HX83/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by MW4PR11MB6668.namprd11.prod.outlook.com (2603:10b6:303:1e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.40; Wed, 21 Feb
 2024 17:56:20 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515%5]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 17:56:20 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v5 9/9] drm/xe: Implement capture of HWSP and HWCTX
Thread-Topic: [PATCH v5 9/9] drm/xe: Implement capture of HWSP and HWCTX
Thread-Index: AQHaZMo2VWRxUxpbIESZZPaEm88TtrEVFPUA
Date: Wed, 21 Feb 2024 17:56:20 +0000
Message-ID: <aa36acf27826fb1df71bb83f55daa74958727497.camel@intel.com>
References: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
 <20240221133024.898315-9-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240221133024.898315-9-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8185:EE_|MW4PR11MB6668:EE_
x-ms-office365-filtering-correlation-id: 9bc30a27-d1f6-4a23-4116-08dc33066902
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IGz1XnKemU5mTQuC6t5euDi35xyuaJAz7zLg7NQ15roC18EmuSFBWPTxLIlsN1FIu11qFl4V1o2z08B1w30E/yI8+wkuQiNJL6KoxXLmX2D5Moze/ta4AjeEy5ln8DnM5D4+YBR01U8HxFgwm1ITiUQxLDR66VP2z1z+qQZKKF1kXn9jqy1/tRQ4bBVV+u+gci+gz31fsseUJLqjBfr5bmPxdmZSqudfwsnOurYH0rp+de2b/kXhcnt4Op3sxFKEg1AJ0KaBF6mVbU6zbpG7hhO8EpOjExHFmhBzoP3wsoIommK9t1stXGhJTDjJegJoQNUR09Us0crtPu6zDLMx+uRkWenS7Vuc1XsshRra3lDiunbAB7EzVuo+MJ9q2TGqw5s/Q+kKRGO1gKRz+LbgzvoFa5UTq0nI6Re798nb3O6uV/RhxTFA72eI6ocbM+c/Y9B9F1wi7KqLrIvJVR2UK4HFucR5/onDcfi6FqrjgCXCX1sKYv/uujH0WB/RvTYQXhLRYT21a4XdKy5lWaC3naMsdhFo8tOwF21S1e7CP1LIbPRFUEGv018jE5ebt2Xizh5w0an9KKhTLVIwcSIqjHXDKlTjwA7bROAiahM5jEdRJdrOaKTHTyCydBg9Bk0G
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkY3ZFZLTjN3YlhVanVVc1dDQ1BrVklzSEJPRml3QVA4UmpwM0pZc1FwYmlU?=
 =?utf-8?B?QTJoaXdaYU5nVkRobkVUaklLdUZENmQ5UTFDcG5MQTh2SmtZaGRkaHoxWjVh?=
 =?utf-8?B?RVJrai9KREV5Z2FsaDdTK2oxbW41dkpMRjlOaDVzcTl3bmpYRFVxL0s0M2xQ?=
 =?utf-8?B?ZkhtQ3RxWDVpRFBMMXIyRHRlazl1OXZDUlVQWTRXdzlwaUp2b2xRa2hhM3pM?=
 =?utf-8?B?Mm52N0laSGZWcTNtVDQweCtoNTdzbmluRENXZmFidVFPeHUyTWhEaXFocWpq?=
 =?utf-8?B?bW9ReTloamlOM1gxa29CNVRXTjZ1KzBHUnlaMzNVNWs1aE5pSUNyY1lvbFFy?=
 =?utf-8?B?c3grS0RTNzU4eHFSeEUzbzh0S3cvUjF6aW9Pb2t3ejRNb0IxbkF6TzRSYUFD?=
 =?utf-8?B?NVR0Wm1VMll6dDh0Q2NnZUVwTjRzV2x4eUFjQTBta2hMTTR6dFJvd3ZYUmxo?=
 =?utf-8?B?MjlRKzgzb1U0M3BEaVBESHdEK0NtcGZVdSt0UE5hSUdHaXQ3S2xkdm9ZVFIv?=
 =?utf-8?B?VjU0dmpNOUxtZllGUGg4OFdDMG8vTWN1UVlRdnF1dGVuTVRPR0dBNXlleEpQ?=
 =?utf-8?B?UkVoWU9ZeFRNTjB4bkY5Y0IwQXJJNUg3RXJQTGlrekd5ck1ReVIwcjczd0hX?=
 =?utf-8?B?RjdwNW1WSTgrM0E0dENUQjdWTXlBc2VWMUNVRi9LenFwWHNtYzkrajVRRkJv?=
 =?utf-8?B?ZFdTSEdaNzhzZXVEQmdLVC8walR6U1pQUFF5QVh5d2FmZi85QkNUaEFqYUJL?=
 =?utf-8?B?Y1lXWFVQTDVyaVloZENjZUxNRmNXOXZMSHladTNDUnVyVVBDWktyYnVrV2Za?=
 =?utf-8?B?dEI3czFqVTlGK1EvVDY2eGFQUGxqVGJpS3BJT3BkRTFDeWJSZm1zZlFSZDlS?=
 =?utf-8?B?OGpDWjdWYnYyVi9ZWWtJcUNvNURsV3RMWDZpTHYzV1NENFRvZG55aFpXTWNk?=
 =?utf-8?B?ZnZ2NmlvMWNTOTcxMFFrc0hqbXdETkxUMDI4RVU3UmhDSWNBaDdKLy9xZGJG?=
 =?utf-8?B?cDdYVmMxRU9UWUVTVnhyUHlIMXJ0SVh1L0tGd0ZBeGhrUGxWY2tiSWxqTUVS?=
 =?utf-8?B?bnd6RVk4b1ppTUFqdW1TcW5FYWFDMDF1OUltSWpYaFZ5TFB2bWJ2eXdUV1ox?=
 =?utf-8?B?TzhTeWNZWlVZWitHZU9Fc25WN0FvTHZLK3JSZXd4L3MyOXJTRi9jRGUrN3kx?=
 =?utf-8?B?N3ErdEp4REVYL3ZkQzVyTlhNWjhaQi9NWWtwZU1PQSswNGQya2hrV2x5Z1B0?=
 =?utf-8?B?eFNXQlRRbHR6WldCMldkVjd4MGN4Q0lkOStWZVN1RllZSXlrSzRFM2xpNXBn?=
 =?utf-8?B?cTBqaUlxWEdjbi9lYzVTSjMrL2ZFVXZ5ZzRWajZyMzlkblJZYUdRSlVWMUZP?=
 =?utf-8?B?UENDQkZEcHNmbzRBaU42amJCWnNhZmNVQ2dvUXltM1R1a2NNV252bHh1bHJj?=
 =?utf-8?B?N203d2VXQkZKczE0RUxTQVBwSWV5UjNWemlNSnQwZExyT2RwTmt4R3Q4eHVX?=
 =?utf-8?B?QUovYnlzY01rRU5NV0hCRjlSV29JWWdzbTNmTTJ2RC95MVhUSS9YYXBLRGs3?=
 =?utf-8?B?S3o5dmkrSXNKTW94RjduSGk4RGFQQmd2UERoRk5XeGs0cU0yYTcxMFhDeFpT?=
 =?utf-8?B?VHBJcFlibGlYTEQ4bkZHQ2ZmWENJZlZRbXFnSU9oYW1Qd1laWkVzQWJyUW9j?=
 =?utf-8?B?Q3RGMS8wQnYrNWEvU2hmNzdZbkNoWEJmd0lYUDl3Y1k1Y1RSVGJFSzAzYnJI?=
 =?utf-8?B?aDhDOWg1aVRqUGZnUUVEM3B1WGVKSnZIRytXYWZTZzRxMEFua2JvWW81UUtK?=
 =?utf-8?B?S2tLNzRBdTcxeWtWWDU2aUxPaUE3MHFIalJ0bytXclVYaUFXYnc0dUorNjhx?=
 =?utf-8?B?b0FBL1drS3RxNTMrNGFHUXFJbHp4Y0dIQ2UwdVB6bTZVbW9lK21jVlJzc2ZB?=
 =?utf-8?B?b2NLa1ZYbDExeHJHM2RJMHRmbFB1eUFtcVBFRGJpWXVmYnZzVjF4akRMZVZu?=
 =?utf-8?B?dE5lZ2xDK2N3bFNPMUlVQjVTbENYb3Y5cnVIQzJ1eGk4ekZ5UmxMUUFENkFk?=
 =?utf-8?B?bkdxRWpGeis4ZFYxcUM4NTJKUnBaYnNTbFU5ZUVsdkh4aDBrUExnOEVMMmZR?=
 =?utf-8?B?bnBTVGM2TG1OdkFUaWE0Q0pWQWQva1RsY2tLV3d6bjV1V3dSRGJOSXd3STJk?=
 =?utf-8?B?cWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98BB57C0DAFEB842A5CE3BEEF61A3E6D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc30a27-d1f6-4a23-4116-08dc33066902
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 17:56:20.3962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EXnd2cQfjZpQxG1u0GEZqb3P0YoQpavXg8+6T0ySaMi8PNaduq+NGlGp5Wd/uxbCWBX+Dey31kMUtfGPg9E4fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6668
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

T24gV2VkLCAyMDI0LTAyLTIxIGF0IDE0OjMwICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gQ2FwdHVyZSBib3RoIHRoZSBIV1NQIGFuZCB0aGUgSFcgY3R4IHBhZ2UgdG8gYWxsb3cg
ZWFzaWVyIHJlcGxheWluZyBvZg0KPiBlcnJvciBkdW1wcyBmb3IgZGVidWdnaW5nLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMgfCA2MCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9scmMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYw0KPiBp
bmRleCAyMGYyMzVjZGFjYTM0Li45M2MxMzlmOGQ0ZmVkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfbHJjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5j
DQo+IEBAIC01LDYgKzUsOCBAQA0KPiAgDQo+ICAjaW5jbHVkZSAieGVfbHJjLmgiDQo+ICANCj4g
KyNpbmNsdWRlIDxsaW51eC9hc2NpaTg1Lmg+DQo+ICsNCj4gICNpbmNsdWRlICJpbnN0cnVjdGlv
bnMveGVfbWlfY29tbWFuZHMuaCINCj4gICNpbmNsdWRlICJpbnN0cnVjdGlvbnMveGVfZ2Z4cGlw
ZV9jb21tYW5kcy5oIg0KPiAgI2luY2x1ZGUgInJlZ3MveGVfZW5naW5lX3JlZ3MuaCINCj4gQEAg
LTMyLDYgKzM0LDEwIEBADQo+ICAjZGVmaW5lIEVOR0lORV9JTlNUQU5DRV9TSElGVAkJCTQ4DQo+
ICANCj4gIHN0cnVjdCB4ZV9scmNfc25hcHNob3Qgew0KPiArCXN0cnVjdCB4ZV9ibyAqbHJjX2Jv
Ow0KPiArCXZvaWQgKmxyY19zbmFwc2hvdDsNCj4gKwl1bnNpZ25lZCBsb25nIGxyY19zaXplLCBs
cmNfb2Zmc2V0Ow0KPiArDQo+ICAJdTMyIGNvbnRleHRfZGVzYzsNCj4gIAl1MzIgaGVhZDsNCj4g
IAlzdHJ1Y3Qgew0KPiBAQCAtMTMzMywxOSArMTMzOSw0MyBAQCBzdHJ1Y3QgeGVfbHJjX3NuYXBz
aG90ICp4ZV9scmNfc25hcHNob3RfY2FwdHVyZShzdHJ1Y3QgeGVfbHJjICpscmMpDQo+ICAJc25h
cHNob3QtPnRhaWwubWVtb3J5ID0geGVfbHJjX3JlYWRfY3R4X3JlZyhscmMsIENUWF9SSU5HX1RB
SUwpOw0KPiAgCXNuYXBzaG90LT5zdGFydF9zZXFubyA9IHhlX2xyY19zdGFydF9zZXFubyhscmMp
Ow0KPiAgCXNuYXBzaG90LT5zZXFubyA9IHhlX2xyY19zZXFubyhscmMpOw0KPiArCXNuYXBzaG90
LT5scmNfYm8gPSB4ZV9ib19nZXQobHJjLT5ibyk7DQo+ICsJc25hcHNob3QtPmxyY19vZmZzZXQg
PSB4ZV9scmNfcHBod3NwX29mZnNldChscmMpOw0KPiArCXNuYXBzaG90LT5scmNfc2l6ZSA9IGxy
Yy0+Ym8tPnNpemUgLSBzbmFwc2hvdC0+bHJjX29mZnNldDsNCj4gKwlzbmFwc2hvdC0+bHJjX3Nu
YXBzaG90ID0gTlVMTDsNCj4gIAlyZXR1cm4gc25hcHNob3Q7DQo+ICB9DQo+ICANCj4gIHZvaWQg
eGVfbHJjX3NuYXBzaG90X2NhcHR1cmVfZGVsYXllZChzdHJ1Y3QgeGVfbHJjX3NuYXBzaG90ICpz
bmFwc2hvdCkNCj4gIHsNCj4gKwlzdHJ1Y3QgeGVfYm8gKmJvOw0KPiArCXN0cnVjdCBpb3N5c19t
YXAgc3JjOw0KPiArDQo+ICAJaWYgKCFzbmFwc2hvdCkNCj4gIAkJcmV0dXJuOw0KPiAgDQo+IC0J
LyogVE9ETzogQ29weSBzdGF0dXMgcGFnZSAqLw0KPiArCWJvID0gc25hcHNob3QtPmxyY19ibzsN
Cj4gKwlzbmFwc2hvdC0+bHJjX3NuYXBzaG90ID0ga3ZtYWxsb2Moc25hcHNob3QtPmxyY19zaXpl
LCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIXNuYXBzaG90LT5scmNfc25hcHNob3QpDQo+ICsJCXJl
dHVybjsNCj4gKw0KPiArCWRtYV9yZXN2X2xvY2soYm8tPnR0bS5iYXNlLnJlc3YsIE5VTEwpOw0K
PiArCWlmICghdHRtX2JvX3ZtYXAoJmJvLT50dG0sICZzcmMpKSB7DQo+ICsJCXhlX21hcF9tZW1j
cHlfZnJvbSh4ZV9ib19kZXZpY2UoYm8pLA0KPiArCQkJCSAgIHNuYXBzaG90LT5scmNfc25hcHNo
b3QsICZzcmMsIHNuYXBzaG90LT5scmNfb2Zmc2V0LA0KPiArCQkJCSAgIHNuYXBzaG90LT5scmNf
c2l6ZSk7DQo+ICsJCXR0bV9ib192dW5tYXAoJmJvLT50dG0sICZzcmMpOw0KPiArCX0gZWxzZSB7
DQo+ICsJCWt2ZnJlZShzbmFwc2hvdC0+bHJjX3NuYXBzaG90KTsNCj4gKwkJc25hcHNob3QtPmxy
Y19zbmFwc2hvdCA9IE5VTEw7DQo+ICsJfQ0KPiArCWRtYV9yZXN2X3VubG9jayhiby0+dHRtLmJh
c2UucmVzdik7DQo+ICB9DQo+ICANCj4gIHZvaWQgeGVfbHJjX3NuYXBzaG90X3ByaW50KHN0cnVj
dCB4ZV9scmNfc25hcHNob3QgKnNuYXBzaG90LCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApDQo+ICB7
DQo+ICsJdW5zaWduZWQgbG9uZyBpOw0KPiArDQo+ICAJaWYgKCFzbmFwc2hvdCkNCj4gIAkJcmV0
dXJuOw0KPiAgDQo+IEBAIC0xMzU1LDkgKzEzODUsMzcgQEAgdm9pZCB4ZV9scmNfc25hcHNob3Rf
cHJpbnQoc3RydWN0IHhlX2xyY19zbmFwc2hvdCAqc25hcHNob3QsIHN0cnVjdCBkcm1fcHJpbnRl
cg0KPiAgCQkgICBzbmFwc2hvdC0+dGFpbC5pbnRlcm5hbCwgc25hcHNob3QtPnRhaWwubWVtb3J5
KTsNCj4gIAlkcm1fcHJpbnRmKHAsICJcdFN0YXJ0IHNlcW5vOiAobWVtb3J5KSAlZFxuIiwgc25h
cHNob3QtPnN0YXJ0X3NlcW5vKTsNCj4gIAlkcm1fcHJpbnRmKHAsICJcdFNlcW5vOiAobWVtb3J5
KSAlZFxuIiwgc25hcHNob3QtPnNlcW5vKTsNCj4gKw0KPiArCWlmICghc25hcHNob3QtPmxyY19z
bmFwc2hvdCkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJZHJtX3ByaW50ZihwLCAiXHQgSFdTUCBs
ZW5ndGg6IDB4JXhcbiIsIExSQ19QUEhXU1BfU0laRSk7DQo+ICsJZHJtX3B1dHMocCwgIlx0SFdT
UCBkYXRhOiAiKTsNCg0KZHJtX3ByaW50ZihwLCAiXHRbSFdTUF0ubGVuZ3RoOiAweCV4XG4iLCBM
UkNfUFBIV1NQX1NJWkUpOw0KZHJtX3B1dHMocCwgIlx0W0hXU1BdLmRhdGE6ICIpOw0KDQp0byBt
YWtlIGl0IGNvbnNpc3RlbnQgd2l0aCBWTSBzdGF0ZQ0KDQoNCj4gKw0KPiArCWZvciAoaSA9IDA7
IGkgPCBMUkNfUFBIV1NQX1NJWkU7IGkgKz0gc2l6ZW9mKHUzMikpIHsNCj4gKwkJdTMyICp2YWwg
PSBzbmFwc2hvdC0+bHJjX3NuYXBzaG90ICsgaTsNCj4gKwkJY2hhciBkdW1wZWRbQVNDSUk4NV9C
VUZTWl07DQo+ICsNCj4gKwkJZHJtX3B1dHMocCwgYXNjaWk4NV9lbmNvZGUoKnZhbCwgZHVtcGVk
KSk7DQo+ICsJfQ0KDQpuZXcgbGluZSBoZXJlDQoNCj4gKwlkcm1fcHJpbnRmKHAsICJcblx0SFdD
VFggbGVuZ3RoOiAweCVseFxuIiwgc25hcHNob3QtPmxyY19zaXplIC0gTFJDX1BQSFdTUF9TSVpF
KTsNCj4gKwlkcm1fcHV0cyhwLCAiXHRIV0NUWCBkYXRhOiAiKTsNCg0KZHJtX3ByaW50ZihwLCAi
XG5cdFtIV0NUWF0ubGVuZ3RoOiAweCVseFxuIiwgc25hcHNob3QtPmxyY19zaXplIC0gTFJDX1BQ
SFdTUF9TSVpFKTsNCmRybV9wdXRzKHAsICJcdFtIV0NUWF0uZGF0YTogIik7DQoNCj4gKwlmb3Ig
KDsgaSA8IHNuYXBzaG90LT5scmNfc2l6ZTsgaSArPSBzaXplb2YodTMyKSkgew0KPiArCQl1MzIg
KnZhbCA9IHNuYXBzaG90LT5scmNfc25hcHNob3QgKyBpOw0KPiArCQljaGFyIGR1bXBlZFtBU0NJ
STg1X0JVRlNaXTsNCj4gKw0KPiArCQlkcm1fcHV0cyhwLCBhc2NpaTg1X2VuY29kZSgqdmFsLCBk
dW1wZWQpKTsNCj4gKwl9DQo+ICsJZHJtX3B1dHMocCwgIlxuIik7DQo+ICB9DQo+ICANCj4gIHZv
aWQgeGVfbHJjX3NuYXBzaG90X2ZyZWUoc3RydWN0IHhlX2xyY19zbmFwc2hvdCAqc25hcHNob3Qp
DQo+ICB7DQo+ICsJaWYgKCFzbmFwc2hvdCkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJa3ZmcmVl
KHNuYXBzaG90LT5scmNfc25hcHNob3QpOw0KPiArCWlmIChzbmFwc2hvdC0+bHJjX2JvKQ0KPiAr
CQl4ZV9ib19wdXQoc25hcHNob3QtPmxyY19ibyk7DQo+ICAJa2ZyZWUoc25hcHNob3QpOw0KPiAg
fQ0KDQo=
