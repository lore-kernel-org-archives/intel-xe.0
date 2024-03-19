Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BB8C54E60
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 09:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA83D10F416;
	Tue, 19 Mar 2024 09:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhcDopng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C1910F416
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710840497; x=1742376497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=erp4RJeMUjhpM0wRg/JizZSTh086xTxPA5IgvIruhMU=;
 b=RhcDopngS/buI/gIjX0Rk6Q0ZTL+60pO7PF549OOy+ljfXXLNZv3hon4
 HucH5KDR7nMMxT73a7uiskI/wReDR8oEW7eyGou5AIpdmZn9Q4gZ9M+aW
 RSw/KikvsQhe0fDBptXAOlxVD55Q3VUE0Y1ByjRt2N3Ov40i3mHcI1Grh
 /oamQcshfLyo+EJvpsrXVpO9diiOmyWRfFqfmJ+uNVEFY/OZTYkw0Zfox
 2nQwyuE3GpNyL9fv38hdV2KIGnA7jJarC56r0L4hEVAOstE09FWBwlk2q
 5Du+SsxDLfgqXGI0feKsg++UukmFdN0+5tKPOxIWOzMcWK9ipRHT1mZBb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5626584"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5626584"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="51175052"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 02:28:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 02:28:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 02:28:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 02:28:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEAyN+YTBKuD48G2/4dF0zxhA8/u+dg0GkgnexBJ0GpkYUj1cOYOo6gRuzsEL/HE0VdgmwWodTwHCZr3cu31Fe8tr8MZfcCY8/20EXbQp3lSzmBBiPaV9jUaP6oXXtsVMJMFRejJRASIOZc/CJGoHV4zXa6cfgJaRR40nMI8Dm63uPVDW996l0StQtHbDiYBNikRKjY6N44SmpKKMXQTlRkQYS2UWSQCboZllTE1YlnWdeilg5RV0QU+qxSc0M/OlOwZf7184pqBBlX3Pf4CKeZ0GYoI7IjVkjtQSr8TMlAZuXPNRadFhPKu2QA047oMReKclETYnksT+t/ygwSkyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erp4RJeMUjhpM0wRg/JizZSTh086xTxPA5IgvIruhMU=;
 b=C5dbkfwycMZiww3xITMq05+snx+dmu/ju5W+bG7cuh53x3A5NUbVcooKGKO5m6Ucy3hNeF9n/qNrjRXxxAM7XmSNHlHKd6WKCIjj7mfgJNyUGkOy+q3WCLTuwjMa6X9lCIlYh9Pt/VMoCynUQW+l1WP5a3mMsStWhJ0kVPfEBbMIcUPB+8Q0TzbUmeTdHtHmLgs9+n8HVbHAgI9V4f0i3RI433VmSSiAmBG4/Hl8rEiijufihfhPLF+SvTrhW5+R51/MDu7jRrxUTmy8vIs/IIwEH2wj5+qyjdsF/4qt+2y9CWOKJSUCv2YBJBecu8LXHKJl95RXQkJaVnO6CxlNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13; Tue, 19 Mar
 2024 09:28:14 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::81be:4798:fcb1:288c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::81be:4798:fcb1:288c%3]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 09:28:14 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Zeng, 
 Oak" <oak.zeng@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 3/8] drm/xe: Helper to get tile from memory region
Thread-Topic: [PATCH 3/8] drm/xe: Helper to get tile from memory region
Thread-Index: AQHaeacvpklCMsbAukWDSHg/90uqc7E+zDcA
Date: Tue, 19 Mar 2024 09:28:13 +0000
Message-ID: <8c0f400c8e79011e83b74c7e6ed894add7bc3de8.camel@intel.com>
References: <20240319025511.1598354-1-oak.zeng@intel.com>
 <20240319025511.1598354-4-oak.zeng@intel.com>
In-Reply-To: <20240319025511.1598354-4-oak.zeng@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 (3.50.3-1.fc39) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|MN6PR11MB8217:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IG1W5g+XbfPLZDungJ/EnhhHuoY7kIsn7OvGBRqvbUMdxETIJXpiBuUa2BqRAXR43GQt7TYYQKVLeKn9pfz6DIiRpmPAlWzja1byP39QkwRFNvcPE/htEeSyEPSOmDyjpMATM6LpxsuhgixiY+UluAI0fAwnZktSqVo6WJrDwsDgDbfG0uZNa3Xv+LSS7PWmeH4dCAVxZM5piMNVYFIECR8sUMZRpEKHJampjBB9V6HhYht6kV+IGG2oU0QXlK9BbcNlOxJx7FnZlIQp+/n4ca6kFavKoD7jlKFGLR2ioE13Gk1JCV7snZElszLekWm/h66mMTLPiuozJTN0YJLZ8FcDVJZ/r8ZCi6Hdn618gd3N5OYmEFtnBKaTQBBNfzlmLfSIbQHrqDrEh5hOad8J9wt5DSd0fTq2V93tn+4DiknvO+wZ7rz64gVTtlzSodBxfewssNVOWnVjGjzl3+jGZ8deQrPwhA3Odw9PxuJ01LFtp53rwL6ZW1RaJOssUsv8gF+WuNcxjRqBTsKrRLsUEhupidRvq0WQA724uVp9gG5NU+z+VL9CAUfMdJfenC1cijH+ejsGLVW/FWMEMKZ3detGjcokqLgq59Go91/QnbZaATSVqb3QOtS4rR8xodKU+U3lEmRhTx69UKfYVGb0G38fSGu/U+auJGLd9gy1B0U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1F1RENCWEhnNmJ1MW5oUDlPUzRlTTdqSDkyWnBqRitQV0FsQ0JHQWh6VVR3?=
 =?utf-8?B?bVI4ZFdGV2pzVW80SGsvaWMrUEE5MnJLYzZHQ3hPbUw5M29Bb2dKakRSSHVV?=
 =?utf-8?B?QWNnbEJyY3Roc2d1Q0R5WXQ0NGJYczB3blZPSmJ0UlllL25VbVdscG1TVU5p?=
 =?utf-8?B?TCt3UUhxbGI5UnBmRklBeVBQdERzV01VNkt5eUNZd2tPTmMxVEdWczVlMm1B?=
 =?utf-8?B?QXZaMDRIcmREQjNPOUxQcm9SN20xSXMyc0NRM2dCamcxZ0Zrd2lNUjhZdjJN?=
 =?utf-8?B?Y2JsazBoT3ZTTHNsMXJkczV1bDRTWWZsd3plQzNrdjJsem5GSDBGb1l6ZEdM?=
 =?utf-8?B?cDBUa1ZqKzhCc0pRNUVnQXMrZFFIbGM1OFNhSEVnY01JU1lrZ0dQNDhpZjJI?=
 =?utf-8?B?WmZVT1M3NGRCV0dXdXJQb25acjNNaHBHa2U5UWEwb3IwREUzemh4TFhuSTI3?=
 =?utf-8?B?Z0RrVUdVUFpEc2tNeEJWbGR5aVRzQmFyOHQrc1NGZzlFMFpNU04ydFZ3dlpH?=
 =?utf-8?B?TjBQRlBlWTZ5K0h2NzY0Z09pWDdicHZBcXE3aEQrNHR6V0NUMzB5bS9PYmJ1?=
 =?utf-8?B?czJXQkRmSG1jZVZRYUdxSVdTd1pjL0NIaWZPUVFtdzdrKzlOWHByVmFzUFRN?=
 =?utf-8?B?azJHVlN6YjBEbzdjWW9BelZSRFNKT2VHcXQxNVp2b1krZmZHWnRTaFBVazZv?=
 =?utf-8?B?ZjBZRm4vRm43NDR0OGQ0MTB6MDVOa1hmV3doRTJCZlNlR1Q5ay9mQUZuZnFu?=
 =?utf-8?B?K3A5eUg3MjB0b01KTnJhbXdub042Y0J2YjV1RUIrbzQ2U1paemZEdGpqNXdI?=
 =?utf-8?B?emlrMmVVNWZ3TWYzMkZQWElWK2VEa29JMGxRVE1VUit5ajk2ckMzclhzNjNY?=
 =?utf-8?B?QXpFSFlMalo4dFlZcHZ1WThVRlVYUnoybkcwK2VwQW00NWgyYkJXdm9WUFdr?=
 =?utf-8?B?ZFpNN3J6Sm1Nb2FXeXJIZkhIRTduN0pkNWZ3aW1mcng5cUN5a2c5dVh2NUxx?=
 =?utf-8?B?bGYvT1QrSzR3bkFmNjQwaUFwdmVOMHBReWx1R1VYN3kxTWZVV25hV1dGdWhv?=
 =?utf-8?B?S3JvSUhkTG5OVjJOUFZUbndrU1EwNHk5dUhKMWFlTXd3d1V0WTZkUE9FSjFy?=
 =?utf-8?B?U05SblVrelpzVDlBclZ1THc3ZUlQN2k3ZDRRaUVkTnd1S0FHdzkxVkJ4ZVp3?=
 =?utf-8?B?ZDhVY1BiWlROYTVzWHZWOGhhTDYrYU9UMmh3NndaNXlaSmcweFhEMlNaajdz?=
 =?utf-8?B?WTlDQlQzbUZQclZOQktjdWVsSStsVjltTHpXWTgzSHVKckNKdmV6K1ZJY3d5?=
 =?utf-8?B?QVJaS3RrMUJDMFBzU3FMbXA4N3NocklvdjV2SkFNS0cxQWU5cTBGUVFYNnkr?=
 =?utf-8?B?eElQb1JmK2sydzFqV0laUjBXb3ZLM0ZWajJ0aG5pa0QwSE9UTFhSaWY2d1ox?=
 =?utf-8?B?Ukg4NURQd1BILzFjYjJaSHllRTgvenBOREkraTlOUUM3Q01FOFQ4dnFzTTcv?=
 =?utf-8?B?TzVtMTBSK25nTHRJa3RqbGY1ZkFqSjRob2JQQzZmdmk5emJTT0lOV21yUFIw?=
 =?utf-8?B?alVUck5PSCtHSzg5Ni9QVDU2aWV5aUlGaENRU28yRjRMcHBobGJwcndUazZP?=
 =?utf-8?B?cmwzQ1JYZy81U2xVRXZLYm1RQU5jSExkTlN1djBSL2dRbkZsUkpiYzNxOEh2?=
 =?utf-8?B?QjAzL2J2Smo5aVRpa2FmdThmRlo3Mm9jMUZVOVZ0MmZ6YlVkTlU5QzZyY2lF?=
 =?utf-8?B?SURxS2hVV283T0JtbGEwZHB6clc3MENaQmQ2dVByQzZLVUVtK1YxYjF0RHNN?=
 =?utf-8?B?dEhZNEM5S3VBYW1zbnVsNFV5Tmx1OVIzNGc4Y0RJZEN6VENCRCtPN0RZZ0N3?=
 =?utf-8?B?YWpPS2pVUTZINFcrZEJwL2t2ZlNTUXBZQUdWdEZUYUwxcGN3b1A5dEZmUko0?=
 =?utf-8?B?U2RsMDNubGxsZk5FalQweFI5LzJwKzNrY0twaUFaMTdlRTNzU1VHTysrcVZt?=
 =?utf-8?B?OG1INUZMSVY2YjlMai9qKzJsblo4Y3piY25uVGNtRXFmZE5PZEphRk9XSEJs?=
 =?utf-8?B?OXhEUEFJMm5yUGI5S0UwVEIybS9wTVE1WHJBdThtVVJ4bmJXRWhoNTFxNWlm?=
 =?utf-8?B?NzRyandIemI1bjl2R0ZkdHJhSEhvem84QWNQOGRvYWtkT2xOTFlMN3NMRnVM?=
 =?utf-8?Q?60uldiOSkNgv+F1fBozusG7MHlg0eDX3gc4/zeCt5wzX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D6766A368A39643B91A3568494D31F1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f84358cc-f5c0-4c67-617d-08dc47f6e6df
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 09:28:14.0134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R5ixAm5jZE+TiQPRfkXdbqwk0tTjyKUiKR/rgRPHVsVCjp8ehhohI986+yWbKkAcopV0l7PsbucaxIR7Gz5hY3wrwnxS74xf1Owik3Ci88M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
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

T24gTW9uLCAyMDI0LTAzLTE4IGF0IDIyOjU1IC0wNDAwLCBPYWsgWmVuZyB3cm90ZToNCj4gQSBz
aW1wbGUgaGVscGVyIHRvIHJldHJpZXZlIHRpbGUgZnJvbSBtZW1vcnkgcmVnaW9uDQoNCkFnYWlu
LCBJbXBlcmF0aXZlIGxhbmd1YWdlIGFuZCBrZXJuZWxvYy4NCg0KL1Rob21hcw0KDQoNCj4gDQo+
IHYxOiBtb3ZlIHRoZSBmdW5jdGlvbiB0byB4ZV9kZXZpY2UuaCAoTWF0dCkNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE9hayBaZW5nIDxvYWsuemVuZ0BpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaCB8IDUgKysrKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZS5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+IGluZGV4IDE0
YmUzNGQ5ZjU0My4uNDczNTI2OGNmMDdmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+
IEBAIC0xNzYsNCArMTc2LDkgQEAgdm9pZCB4ZV9kZXZpY2Vfc25hcHNob3RfcHJpbnQoc3RydWN0
IHhlX2RldmljZQ0KPiAqeGUsIHN0cnVjdCBkcm1fcHJpbnRlciAqcCk7DQo+IMKgdTY0IHhlX2Rl
dmljZV9jYW5vbmljYWxpemVfYWRkcihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTY0IGFkZHJlc3Mp
Ow0KPiDCoHU2NCB4ZV9kZXZpY2VfdW5jYW5vbmljYWxpemVfYWRkcihzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwgdTY0DQo+IGFkZHJlc3MpOw0KPiDCoA0KPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgeGVf
dGlsZSAqeGVfbWVtX3JlZ2lvbl90b190aWxlKHN0cnVjdA0KPiB4ZV9tZW1fcmVnaW9uICptcikN
Cj4gK3sNCj4gKwlyZXR1cm4gY29udGFpbmVyX29mKG1yLCBzdHJ1Y3QgeGVfdGlsZSwgbWVtLnZy
YW0pOw0KPiArfQ0KPiArDQo+IMKgI2VuZGlmDQoNCg==
