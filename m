Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08727C48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 23:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C70488EBA;
	Thu,  8 Feb 2024 23:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LCwGRDvr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7A810F031
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 23:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707436404; x=1738972404;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=BjSStuFpLciNWgrj8GxhvwjVGhUfLSrFnv/j5XUKiNs=;
 b=LCwGRDvre1AUvGLWAQwQAHlEB41a2piZyHbb5P8y1J3pAUI46iN3sUIa
 WXVQiazzZdpYiIWElXnxHY9pC1cM7yYWRQZLJVKmcx9YlS9Q9r1VoWHr1
 9FZbCQ6ju43X2eS7fL4gXPh4CLFlOeq9F+wq7m4r4LcZPr3EgTdWqKFJm
 ml6nsAh2WMD+azZolmuDIUK3/gGlk9JRpuoeuGdrUUUeaPdq1zXk7IyxC
 oAvx1V5lz2ZzJF3nKJvbezX3tMDH8Y5trQMvGCMHdZkS/y38BXbpR0D1V
 dPhwcTabIM+TauJrVdGVLVd4p9LOrCHQeylXT/yrpOw4OWbvPu+yIo0g/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1498719"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="1498719"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 15:53:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="6452909"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 15:53:23 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 15:53:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 15:53:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 15:53:21 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 15:53:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWp34G6b8n0ApIkk9V9qj0i8sSeJQzkLYMvIOHWTK4D3kmmlbkp5sxXY/sQMOX5EyZPrrX3OT3jXYaXp5j5cXDhONAB+OPwSGdQo/UT8ctUOHaqcDWnUby7ciRerBL0VxvzRF9By8nkmkPLTVXdDm+yjF6EMGH9Vv0Fu475+Wijry1AE5L2UtvOlIT8CkXiJPkOzPpRfQ20jfi9XZ4d/94TNrnWXy4It0trGTqSFexfDrpOxUw2TSuyGV9Awj+EZALBL2I0M+FF6BYqqHtyem9a3dTeLsrducrV37Tf9TPK5MBlGbJIsNI0VMfdxgQQOxfrL9IbWQkrtuvF1KZ2htQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjSStuFpLciNWgrj8GxhvwjVGhUfLSrFnv/j5XUKiNs=;
 b=jQnXheSJXzRRb1JTz1SEGp3tF2qzj4gHorqvOq4CkjEslf9tD9RXN2PejK2ec64seq7UzKPz8QJ/KBYQyYCILeumC1qivJ6ZREdcI9HT/Kb5ggg7fgd8B8ZZ3TuzgcNoiUMPoMcf8qJ6+14FIaIzVS2k2R2pT+cJHDf7XVFqE8sb/a8gz4f/9yKlMNRrCKMFZQjzSw+qjGqz4jqMtPNYlU/81UXYNU8FnRpteRyIRQi5LrCIJa7bLtXV76+QADphy9peVFlsa/2Nhp03eYYtkv5MM5O5Nop+I8TRZw2yJ/hJjrZCYCwELiQluPGwDh3I8S0chg+TvNQdywq3TodQxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB7280.namprd11.prod.outlook.com (2603:10b6:8:108::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.34; Thu, 8 Feb 2024 23:53:06 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::89b0:d67c:ea7f:465f]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::89b0:d67c:ea7f:465f%3]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 23:53:06 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 1/1] drm/xe: Add helper macro to loop each dss
Thread-Topic: [PATCH v8 1/1] drm/xe: Add helper macro to loop each dss
Thread-Index: AQHaVKOxl9RTslAo30CA7ierb73WWrEBKqIA
Date: Thu, 8 Feb 2024 23:53:06 +0000
Message-ID: <5e6380adbc46c0b309681f23fddd579362e36853.camel@intel.com>
References: <20240201001417.354270-1-zhanjun.dong@intel.com>
 <20240201001417.354270-2-zhanjun.dong@intel.com>
In-Reply-To: <20240201001417.354270-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB7280:EE_
x-ms-office365-filtering-correlation-id: a08a543e-5b22-46a7-85ca-08dc290118a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qeeC/bNuk2kV5bflUJ3gbwRa+rBm7zLHBfGKtikrr8t9WmrfHIn3s7rhezh3o1gziqZ68jp1tKSsVH019YUsONpqO0n9XXBuq6fsv3ryzSJafXA7EGknMHiC+4WKGDwiXTBEhfwBOU7312lb+2Y3v9EG6wcU6H6232iERZ7vvlYh1Su0aW12dlAXqYP0+XWqpW8Fr3KeK7tj+G7Gfi8Trhj3HsXb+CY9KhUt52fqNrQNDsvCO7lUJsNpw2i5mlL5ep7FWlRAIwtyNdglaC2Ssald8RHqJRMkc5ab0Ax2GI95TFGsYFuzWRGl4rTWrjCTlmqorBuktBycmnIgICK/khDQg6CjWQN3wabL3mOoWxqSAMscQNQwRM6Z8jtt9y3MIaASf9c2VV5cJNSPXI0grFE3RHhNCZtfqXGB34GLsSHgiMI57zxWhHQGiRAhj3u6lQXfxFejlo6QTm7tEUfzPXxQtHV8Sk4raZbN7odoKvI6Z8T7LmeDvvaAVkbA8eFYSBvPbcJAbiBeRrs4NlQgpzKJR4V4KL682kRa2uaBk1W6IdTkViJ0sXIV3zNByWa0ow1EOwv0m7nhl9bNY9oPk6AnDy/mjt/4MeF2EnIj+4FaHm2OMguyhzIARRQ+zAWz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(26005)(6512007)(38100700002)(41300700001)(316002)(36756003)(38070700009)(76116006)(71200400001)(64756008)(66446008)(122000001)(6486002)(82960400001)(6506007)(66476007)(66556008)(478600001)(5660300002)(8676002)(8936002)(2906002)(66946007)(110136005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1AzUHJVa3hRaTdTdTF2Z0l3RjRVc2t0QkNjWGhydUxIcStpTXU1OHFvSm1P?=
 =?utf-8?B?MU9vYmd6ZTdjallvKzFTaFFic0hmSjhrZm1DZlJtdC9nVzYwUzErOWJ5Z085?=
 =?utf-8?B?WHI0RWR6K3pTRjNaQ3R3byt4YWxHaGFDYy9yRTd6MEZPNytrSmRabkhQTnFB?=
 =?utf-8?B?cENGK0JXZkk0enUxZkl6SDBxVUR6TjFXa0FURlJ3elJTcXYyN2x3K0pGMGJV?=
 =?utf-8?B?cVhwVXd1MkF5cjBmbGFVOEw5MkE3YlFyQ0JiaE5aWHhUR3BqR0lFSzZVVS9H?=
 =?utf-8?B?ZFhQWEY4cXovWDFIYWxxbGJvRXNtVTQ4UWlUam94Z2RMRUN5TTZUc05tYkNL?=
 =?utf-8?B?aG0zSXg4UjZwSzVCNXhmTDE0RWlaSlNsTk9oOVhNQjVWMTNwVktiSzNTa2ph?=
 =?utf-8?B?NHMxOU9kMUVQNVo1cmdNams5ZzFrZS9ZU2g3Q2ptTW1DRVFpOGlyWlZ5ZmpG?=
 =?utf-8?B?Y2tnOGJBdllDMEtqQVJESnJJZDVZMzZVYldpVVdjcGt1RThZSHlYeVNpVDFk?=
 =?utf-8?B?UU1oQkJwZnRzQittbUhxdnlRNkxjaEY3QzdzR3dtN1pId01BbjF2dWtWNDlI?=
 =?utf-8?B?L2pWTnRLTmtGTUVGNlBRaXlYNGJLRy9WMG5MUFhDbitjb3hoMFIyTWxhQkJo?=
 =?utf-8?B?cDNaYU5GeGtaU0x5US9tVG5HYVA4bk9kOHMwVzRsdlk4cUYvU2hsaGFydFd5?=
 =?utf-8?B?MXRQclBqNGNNSjRxRUVlOVFVaWU5cFRkR0lvVzhqSzhjRjRCSkwrWXBkaGZJ?=
 =?utf-8?B?emdEU2pMMVBjY2NSb2Y2Y0paWlM2b1RDaUtsbmFBcTR2Z3luam1rWHI5dWJ4?=
 =?utf-8?B?RUlmdGFhU2ttM2gwSXpXM01nRkFoWUVaSWpaZ3ZLd3FXWTFqeDJ2TlZUUk5N?=
 =?utf-8?B?VVk5SHRQZUVBRDF6aGtXY0FkZ2I1TXRXaGxKTVFQUU5QdlVSWTkvT2lDUU1t?=
 =?utf-8?B?L2wwN2hyTUtuSGdqZ3dkSE4xbkpMZXpYaHdkTXBMbkRJcmtwcllJTDJuMFZE?=
 =?utf-8?B?YTBlM2I4YmQ1dFVTYjNuSkliNTdMQm5weW1Ncjh6anVFY2ZheFdkZnVySWFv?=
 =?utf-8?B?cFVqYXIxK2VPNUpNWVpJWXNJaUg5S0pzL1dmbnRFaXEyM1dsbXY2bFZkRE5s?=
 =?utf-8?B?NkNSQkdNVm9nbmJIc2g1UHYvc0JNeGNYZysxako1U1daQ3RBd3Nkb21hREZJ?=
 =?utf-8?B?ZWJvV3F3NmNKUmg5UVJHUmFMRlBEU0lxR29veTk5bEdLUVduWW9nNTFXVnRy?=
 =?utf-8?B?NzhmM3IwdWlEYXI1bTUyYWdIdW9HbDlkMEFaR0V0WXhFbCtjSHFGSWp2Wksx?=
 =?utf-8?B?Z0FmMTBxQWJVQ0ZvSEpZS1BIbWNOWlBEYnNFYngzMk1MYVl5SEtkNnNKaGxp?=
 =?utf-8?B?bytxOW9OMmJlK0tGQkNMOWJFT3ZMZm9NZ3E2aHU0SjVjZlIvNmRUZXZzcHJK?=
 =?utf-8?B?eW9GL0JmZ3dRVzJ5R1R0U0NacEcrbFpQNFhVNFJTRk1kYTZNMHk3azZtcW5u?=
 =?utf-8?B?S0Z0Q01zMGhZL2gyVHg1VTlZcDNRcHU2MlFLdDhHbkcxeGN4VmZtZ0NUR1kr?=
 =?utf-8?B?QVdzWE1tb0hCSXROU2tDb28wTXU3NTJPMklHeDZ5OVlyYk8wbGd0T1ZtaFN5?=
 =?utf-8?B?UUJDZWtRazY4U002aGNiRkdJZ09NK1ZtV0YyVmVzZ1cvb3ZzS3djYm9HWDRv?=
 =?utf-8?B?ZTUyV3ZzSXJlRnNlYXZ4TWg2M3IxWUZjb2ozOEdEdHBHMitaSy83dm1XSmpQ?=
 =?utf-8?B?bFNQT1ZyR1dQQ0lhQ0ZsK2tUQjEvVlZxRmRqT3k4ZHdlcFR5K2J1Q2lTRHl0?=
 =?utf-8?B?TThJUkVHY1hoWGdBcG5WcVBSNEc4OTVkNXh0ZVIxSFgwdFBPdHU3SEtGWkk2?=
 =?utf-8?B?NUh4OURXNEY0NXVmbS9PYlRXcVlkWjhVTWpJZGpVWnJ6TC9KTUk2STlIUWdJ?=
 =?utf-8?B?bUNDd2lyWVhCTlB3V0pPdDJ2RWlHV3I4SUlUWm1pRmU3NzRjQUoyYlJKNjNM?=
 =?utf-8?B?UzJBSnorQmFsRnJ6WHhGUE5Wc21zZFBmcmVvTEFqczJHNC84QkhnancrSnIv?=
 =?utf-8?B?OVExRlNzMDlqN1dsTUN4WHU3YTFxWWNJaXBveVkyYWhTT1BUMEF6bWF6ait5?=
 =?utf-8?B?aTlBUU9mZFJwbmkzdEtJYzkydFl3c2krVnhnQnNSYkRGaU84bGRIZzVhKzZw?=
 =?utf-8?Q?LLybF79mzNfd9TMUHQNt80w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17D902377E8F854CA8011AFC77D84E79@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a08a543e-5b22-46a7-85ca-08dc290118a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2024 23:53:06.4222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uEEBjW5h6aPn1tq8TKu7H+51LqSItaugYC956ehTGl7EW34rg9LVnFOg+z3rf3DHgD1gTU0MesimcAIx5FHgJtDyekmygkqKLJkww3EpN1P22kCE++zjJwj6s0+fuvDQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7280
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

T24gV2VkLCAyMDI0LTAxLTMxIGF0IDE2OjE0IC0wODAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IA0KYWxhbjpzbmlwDQoNCg0KPiBAQCAtMTY3LDMgKzE2NCwyOCBAQCBib29sIHhlX2d0X3RvcG9s
b2d5X2hhc19kc3NfaW5fcXVhZHJhbnQoc3RydWN0DQo+IHhlX2d0ICpndCwgaW50IHF1YWQpDQo+
IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcXVhZF9maXJzdCA8IChxdWFkICsgMSkgKiBk
c3NfcGVyX3F1YWQ7DQo+IMKgfQ0KPiArDQo+ICsvKioNCj4gKyAqIHhlX2d0X3RvcG9sb2d5X2dl
dF9uZXh0X2RzcyAtIHJldHVybnMgdGhlIG5leHQgRFNTIGlkIGZyb20gYQ0KPiBzdGFydCBwb3Np
dGlvbg0KPiANCj4gKyAqIEBndDogR1Qgc3RydWN0dXJlDQo+ICsgKiBAZnJvbTogQW4gaW5kZXgg
dG8gc3RhcnQgc2VhcmNoIGZvcm0NCj4gKyAqDQo+ICsgKiBTZWFyY2ggZnJvbSB0b3BvbG9neSBk
c3MgbWFza3MsIHJldHVybnMgdGhlIGRzcyBJRCBpbmRpY2F0ZSB0aGUNCj4gbmV4dCBiaXQgd2Fz
IHNldC4NCj4gKyAqIERlcGVuZHMgb24gcGxhdGZvcm0gY29uc3RydWN0aW9uLCBkc3MgY291bGQg
YmUgb24gZ2VvbWV0cnkgb3Igb24NCj4gY29tcHV0ZSBtYXNrLg0KPiArICogVGhlIGNvbWJpbmVk
IGJpdCBtYXNrIHN1cHBvcnRzIGl0IGFsbC4NCmFsYW46IG5pdC4uIGkgY291bGQgb3ZlciBlZGl0
dGluZyB0aGlzIHNvIGZlZWwgZnJlZSB0byBpZ25vcmUgb3IgY2xpcCwNCmJ1dCBJIGJlbGlldmUg
dGhpcyBkb2N1bWVudGF0aW9uIG1pZ2h0IHJlYWQgYmV0dGVyIGFzOg0KDQpTZWFyY2ggZnJvbSB0
aGlzIEdUJ3MgRFNTLWZ1c2VzLXRvcG9sb2d5IGFuZCByZXR1cm4gdGhlIERTUy1JRCBvZiB0aGUN
Cm5leHQgdmFsaWQgRFNTIGluc3RhbmNlIGFmdGVyIERTUy1JRCAnZnJvbScuIERlcGVuZGluZyBv
biB0aGUgcGxhdGZvcm0NCmNvbnN0cnVjdGlvbiwgRFNTIGluc3RhbmNlcyBjb3VsZCBiZSBmb3Ig
Z2VvbWV0cnkgKFJFTkRFUiBlbmdpbmUpIG9yDQpjb21wdXRlIChDT01QVVRFIGVuZ2luZSkuIEhv
d2V2ZXIsIGFsbCBjdXJyZW50IHBsYXRmb3JtcyB0aGF0IGhhdmUNCmJvdGggZW5naW5lcyBoYXZl
IHRoZSBzYW1lIGluc3RhbmNlcyB0aHVzIHdlIGNhbiBjb21iaW5lIGJvdGggbWFza3MNCmludGVy
bmFsbHkgYmVmb3JlIHBlcmZvcm1pbmcgdGhpcyBvcGVyYXRpb24uDQo+ICsgKg0KPiArICogUmV0
dXJuIC0xIGlmIG5vdCBmb3VuZCBzaW5jZSBnaXZlbiAiZnJvbSIgcG9zaXRpb24uDQo+ICsgKi8N
CmFsYW46c25pcA0KDQphbGFuOiBHb2luZyB0aHJ1IHY2J3MgcmV2aWV3IGNvbW1lbnRzIGZyb20g
TWF0dCwgaXQgbG9va3MgbGlrZSB5b3UndmUNCmFkZHJlc3NlZCB0aGVtIGFsbC4gU2luY2UgYWJv
dmUgaXMgYSBuaXQsIGhlcmUgaXMgbXkgUkI6DQoNClJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8
YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCg==
