Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8750EC61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 19:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3991110EDF4;
	Wed, 26 Aug 2026 19:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StDjdraw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6465210EDF4
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 19:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787774064; x=1819310064;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=k016UfjAl41AlmyV18C6V1QD79Rj2zhq7tBxW9HrS4w=;
 b=StDjdrawebIrXpHsvK8MQ+ULG2Bw0eIHrHajPNGhhI9c5V073kqWqUpO
 alRPkcrVx8XN9bFDR3JdqIEHpRCrHMkOwtTM5dKw1aFzCIksVpNP+EZYF
 cp5zBSZjCEpo0v7egVFVMZOZC+mr2rerxxexPM59mUJkzf3JG1DnN7h+p
 A+on4xhyu/cLAje3x9TF3RBItJ6Gy/wLWXbnqa3MXTRyVAukAyU601IsA
 G43QOMdmcijXWeA2we3ylEGGLqc2oiCWkSDngPOfFLjMK3BsVMxw1BCnx
 jkRZVfarreOKg2A/AAFcgVfVSKCc5YuQutJLo/Q0lhr5toPjn8p2mD1uA A==;
X-CSE-ConnectionGUID: gz8A4H6IQPuqTMhl2cS03g==
X-CSE-MsgGUID: j3AgCEf2Q4qAW8GSMeVFcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88184553"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88184553"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:54:24 -0700
X-CSE-ConnectionGUID: apvk33EuSrO9J4DBv48uOw==
X-CSE-MsgGUID: E2vYqPuoSVmoRuVNICk2aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="267086587"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:54:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 12:54:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 12:54:23 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 12:54:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSbVwjvRKro0uTPaIB+waAWh7lxCWtFDHMYEYDERUGs0McpwIemlfmwozqIaWjvV3RKMY45AchMTEUtiMMoQENGXA2GWfzaS70EIBba92C4BRyMTJpdia8q+0GnuIjojF3hsuXbEwNxvAEogID2Cqh92Bm/5j/5OFA5Sc1gOCNs2msfWccb/zSayu6Y1Y36BVoX2uTC/CI3yviOL9BwGTOk4JB3j/omKh/KIBaLhrA7fVC0B5tuZxZyzxw19ENYOAMtuBlbrD8gDjEJWejsrhy8ByVYtG8aDuKooYvM/yPTseM72xkGORpJ5VlOtcgDm1iy54jvl8bl/rW527JQ+Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k016UfjAl41AlmyV18C6V1QD79Rj2zhq7tBxW9HrS4w=;
 b=M01mWtEfZkjD7ctWz0aqWgbU0QQEGJ0bIOUT0p8URJww+RyqXGlD3BkgdntgBNw7CUaH05+7lIVHq2Xe0WOCiKs8QdzPcexIBW4WpkA47PVYUUijFO1wzSnck0GX4PWfRnB44meLefcCkrTd30Sw4R6OuzASeUllFKtL+Hel0ZD441p+W478FjLqWw0v0QJNrclp4IMPVOqbXhqvRKsSHKpVm1zrIR+ZNvL76h8eqa66BXb1iQDGPyFK+J421qT387Sz/7oMk3XuYL6dmsT26HDd63fJvbwFOM4gIJUz3NKu3z3vmovuGoneLQ4WxC+cd+TxtM8iALDcAMr2aTGl9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ2PR11MB7475.namprd11.prod.outlook.com (2603:10b6:a03:4c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 19:54:19 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 19:54:19 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p: Restore sampler fault for uninitialized
 surface state
Thread-Topic: [PATCH] drm/xe/xe3p: Restore sampler fault for uninitialized
 surface state
Thread-Index: AQHdNBTRyToR5e7lzE2Aj1cUnmbLgLawvKyAgAAEKoA=
Date: Wed, 26 Aug 2026 19:54:19 +0000
Message-ID: <01f98eeb0492e16dbe8b20695028b0494390f600.camel@intel.com>
References: <20260824220458.520358-1-jose.souza@intel.com>
 <20260826193807.GI681121@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260826193807.GI681121@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ2PR11MB7475:EE_
x-ms-office365-filtering-correlation-id: 4ddca3d4-96e9-4d5d-ebc2-08df03abd108
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|38070700021|11063799006|6133799003|4143699003|10067099003|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: TkbD62Y0QB2GKpWbdwSXe4zkW8cYMrheUiasMSeKj1XKCUx3f1zvsuWPHr4SklNF03ZQ7Bg9EDBpj3DLAwBgLnENZ3TGFos1DEzK+1CBuBC5bAsuIFaS4F0Lr/m0vSn4Xg4JvgQAm1r1iR/D1xHDlXoxP4qEL0XB/q6YoOAQUwB/YfHu9l/S0jCL6adbCl42S6tnD6CI/UewX7X1dyMG4gfg9uaIapqfkNsL1cgZ3hZBlo5pvA9s7a/9STeLYkqd3Us44EhVQliMhMDbQW5S5niYTCu99lGAyMk0CngdSqb4d5qGg4X051DwiO5E5bpdBCuZ/83itJ9mDvO1RidLCz8koDgi5jdC6uvOFrYF63DWW7mvFUWdZ5dDbAuM/GBWhYmpLRQbU+pI2i84BjspNiY7GqnPrCKttJcZLqgnPomIcL8DxXmehokbtRzNHDGMcMpuK1fko4kGpds5ZDsYtqAq6q9FE0Hh6AuaY20QelcVDhh4xknUMv8oULKfCG7dmlnwEgRRI+c05hZ68DxcFs72Sl5J4DxxrTWg9c84iDqvtq80GOz7nxgy/BxC4MQWEG0D7afZormLsnZtNAGRRaWIEpHF5ep+yRAwhppwZ4/TIx6suE2ykLATPZb9z+EOr+0ihkI91vEydEHYPYNN/AjEXUTxbXhn6yO1EO6iC773h049nqYRKvOCjJSXjqKyovuGVDiqFKOzJF42RasJBjcjK6tjurE5sz3fT+czetA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(11063799006)(6133799003)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWZrUDIxMXkrTWltZjNwa1ZQc09kU0VwQ0RKN1A1eUEyMDZUZGFWMGZkcFox?=
 =?utf-8?B?U0JkTmh0MEprWkhjMUV5ZUpSVmgxWmc0cENoQUtYR0pxVjZna2ZkYlF4aGZF?=
 =?utf-8?B?eWFFYTlJSzdPbEhUaVAyR25QYy9SM0xsbkJZdXhpSXduRmZZeU9MZTVKNm1W?=
 =?utf-8?B?MDcvMkdINmpUZmNoQkFxSlZka1NuWVJSRjR3VnFBa1BCR04zZVNqN3dQakRS?=
 =?utf-8?B?cE1kWUxjWE5NUC8xWk5mUFBLVHNqOGdldzFScjhxeU15T3FOUXpEamVQVXBx?=
 =?utf-8?B?MWNqQ1RVVDFyYzE4TGlNZStxYUhFQ1kxb1FjSUpqcGQrMG9wLzYrVjBGaVQr?=
 =?utf-8?B?dVV0V0JhMkJKTm5TNXFZTzNoTUhYZmMvc2pBWDhnK2pJOHl5WXZhNmxha0w0?=
 =?utf-8?B?ZUNXZ3pHcXpxYU5TTzZybExmaDBhQkRuOGZPVHdtTXBYQjMzNHArVEdvMklO?=
 =?utf-8?B?Ujk1VHpYRWRmMGV3UllWU1cxZVVnRmdKa0JxRVY3Mlk4L3BCcUFjVkErc0gz?=
 =?utf-8?B?SU5XVUVhMTNvZzVDSGgyRXpZSlFVYytjUmdRbEFwRndrZzZ1QjNlWjJ0VzRC?=
 =?utf-8?B?UjdsTUdLZnlnQkFhR2RSSVBmQlVpZExRNVAyWkt6VS9uemt6Rml6K1EzUW5v?=
 =?utf-8?B?UW52aHVoRmdKbzlHTS80TUFVVFdBQkc0c2FJQTZUNXg2YWhVazRwQjk3ZHlL?=
 =?utf-8?B?aFZ1V3hEd25TYktyYVJlVHgra2oyMEc2a3I1cXRPMDNFRkMrMHFKZ1hJUjAz?=
 =?utf-8?B?a1FTZEdpTWpvZzVZY3BWNVZYck9kOXpZc1hzd1pSREE5Qll1eUd3U0UxbHk4?=
 =?utf-8?B?Um1oZkdKRUhYNTFDT201b09wRUNqTnk4MWRleU9Kamk3aVVxWm9OSEFLZWh1?=
 =?utf-8?B?UnhqaVpPN1lDNzAxYjRXaWlQMjdaYWR2WjhkcmEyQyttcnFkOG9uTGJVMUNq?=
 =?utf-8?B?TUY1WWZ4MnVGTUJVL2NraHIrK0M3MnZ1N09Zcmd0dkVQMktLTE9qeldRQmdx?=
 =?utf-8?B?OGFBRDdVNXNWbWd2ZHZFZVJrZ20rRjRsSjFKV1R4TktQMnNaSlh5VEdTL05U?=
 =?utf-8?B?WHJkOGVuMHBoN2hFMVZEUzlZTGlrNmJvQVNZc0ZrVVkvOVdGbDZtN1VJaE9F?=
 =?utf-8?B?RENFMytZVEtPTWlCeFFCZ2wvNzdQNkZuUkVZWC8xZEw4eUlXWU9FMy92cElH?=
 =?utf-8?B?VkgxT2RKcXRLUUoza0VqZnNNZy93K01ueWxva0JwYU9GTzVSOVpoVm10ZUw3?=
 =?utf-8?B?MXF1K0FKZXk1VUJQVGNYMUNtakVRdDg3VlBXVkpDbk10Vm4zdE5pKzd3V1NF?=
 =?utf-8?B?M2hweUdEZzNxcmlkMlVxWkNDQkdnRWJZZzVjUWFlQUViOXNHZ3N6TU9ZWFlV?=
 =?utf-8?B?YTFiL2I2Q1JZay9odE1sdXZoQXBsNWRqMFAxY3lnT05VMlAvNGZFMHFTa1Rq?=
 =?utf-8?B?dDhUMVFxWFI3ako5a3VEalNUVmE0TnRmam1EakI4a2JUM2hoWEpsb1FacnVv?=
 =?utf-8?B?ZEhGV1dwcHpGaFJxekd6b09RQlZhYk5BMitocTJ0OXJONXRrQ1NMZUF3UVpX?=
 =?utf-8?B?ZW1ZL1dVUEk5S0dBWGwzUUpXSURINzJ4djdQTnJlYVVEM0xOTGMvNFhQY3Yr?=
 =?utf-8?B?YWhzaVJ1WUVkY2R2dkVQb1p0b3MvWUw5b1BIdlU4Y3RIbFNFNDNLWllLZkJ3?=
 =?utf-8?B?UU51K1owZ1dpa241SFM2MCtNN0VEdFU0U1JsWitveXZ2a2Rva3dYSnNBVjRE?=
 =?utf-8?B?dWRINUdaTm9OcHNoalFIVm9yaVBVOFhUQnYyR1YrNVl2R29la29YNDcrTjBn?=
 =?utf-8?B?S1BmdWwzTG5VcnRVYWZRTHQ1dFloZG9ZU3lGUXA1czVWakdCOEVtYXhIcjZQ?=
 =?utf-8?B?WCt1eG1LaDh4SU9CdVVKVUJYSzM4Y3cvM09weCtHUUZtMkoyVWVBcUc5Rko0?=
 =?utf-8?B?RDYvUklYWS84ZmZyb3pNK29ucXl4d05ydmZmR1p1MW91QnNkNTBqUXk5NkRy?=
 =?utf-8?B?ZG93MkdTZVNYeGU5Y3NTSmxvRFJiZmpnV2ZhN2ZWWTVDMFg2R1o1WjI1WE5a?=
 =?utf-8?B?RWJlNm1mbmhnYXd0K2twNm5mUVFNamNoMWpJT3NTS2VZRnB3dVpkVG5IVVBM?=
 =?utf-8?B?OWVSUkwyVmtkYXRITndlSGhTTXpmTTQ5Szd5MGZseHpxQVdNTnR3ck0zY1Fr?=
 =?utf-8?B?UHFzWmRTaFBxeW1YSTh4UjJjNGRsWG1wblFkREtIUGFXTW1nQ3BQMHA0U21x?=
 =?utf-8?B?a2RqNVhqWXBWRE8vcW9VdzlPMFRlZ2xlUU1LQlV4M0JBeTIwckJ0RHJjMSs3?=
 =?utf-8?B?TEFYKy9TTE1GdnJScDFuV2kyODkxdnlzaG5ESkw0dDNDRzlMemVmZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C36C1FCE0D2B1A459584BBA5F16E42BB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rHyeJfon6K4O6py4dkB7CTU29Oo0viW7aqVqO+Rs1Dl+2wnK9MxlbSzgYWwKvKj9elU4WMdaZtWq82agACrULxD2aBcaAGRDRGRVUltXIjAg7OMF+xzAUig+39F5B2nXdePxcR7XVkkFkAGBrIU5mlUoClCAbk3bLn9gCl/sciqlTfEyGitE6mfLndPRVN4skvlNxl+bRGwk70rG2ShAjFLXf7DYRLwaxq5cfxYISkZpgJnXtoO3j9j6661U0XaJ0dkIKFIetUH0dgi7idCThhaDXXkhXTnkMZFX3w9DooHc0NRXaokNjcF7wf/OsZ6WJuq0I/bKx6y27gwbmymEXQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddca3d4-96e9-4d5d-ebc2-08df03abd108
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 19:54:19.1068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oNAvI6Q2Yh529J9GYFgkfPuVCifAghyjw6actuHfPl4kCIL73q9+Cr6P+MiBKuw9VW5Y7mrUUfu7c0HZ8jE9Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7475
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

T24gV2VkLCAyMDI2LTA4LTI2IGF0IDEyOjM4IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBNb24sIEF1ZyAyNCwgMjAyNiBhdCAwMzowNDo1OFBNIC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphDQo+IHdyb3RlOg0KPiA+IFhlM3AgY2hhbmdlZCB0aGUgZGVmYXVsdCBiZWhhdmlvciBv
ZiBhIGZhdWx0IGluIHNhbXBsZXIgd2hlbg0KPiA+IHN1cmZhY2Ugc3RhdGUNCj4gPiBhZGRyZXNz
IGlzIDB4MC4NCj4gPiBXaXRoIHRoZSBkZWZhdWx0IGJlaGF2aW9yIHNvbWUgZGVmYXVsdCB2YWx1
ZXMgYXJlIHVzZWQgaW5zdGVhZCBvZg0KPiA+IHRyaWdnZXIgdGhlDQo+ID4gZmF1bHQsIHdoYXQg
d291bGQgbWFrZSBwcmV0dHkgaGFyZCB0byBkZWJ1ZyBidWdzLg0KPiA+IA0KPiA+IFNvIGhlcmUg
cHJvZ3JhbWluZyBTQU1QTEVSX01PREUgdG8gY2hhbmdlIGJhY2sgdG8gdGhlIGRlZmF1bHQgYW5k
DQo+ID4gZXhwZWN0ZWQNCj4gPiBiZWhhdmlvci4NCj4gDQo+IFJlYWRpbmcgdGhyb3VnaCB0aGUg
dGlja2V0cyBhc3NvY2lhdGVkIHdpdGggdGhlIG9yaWdpbmFsIGhhcmR3YXJlDQo+IGNoYW5nZSwg
aXQgc291bmRzIGxpa2UgdGhlIGNoYW5nZSBvZiBiZWhhdmlvciBoZXJlIChub3QgZmF1bHRpbmcp
IHdhcw0KPiBkZWxpYmVyYXRlLsKgIEluIHRoZSBpbGxlZ2FsIChidXQgYXBwYXJlbnRseSBxdWl0
ZSBjb21tb24pIGNhc2Ugd2hlcmUNCj4gYXBwbGljYXRpb25zIHdyaXRlIHNoYWRlcnMgdGhhdCBy
ZWZlcmVuY2UgdW5pbml0aWFsaXplZCBkZXNjcmlwdG9ycywNCj4gdGhpcyBhbGxvd3MgSW50ZWwg
aGFyZHdhcmUgdG8gZ3JhY2VmdWxseSBoYW5kbGUgdGhlIG1pc3Rha2UgaW4gdGhlDQo+IHNhbWUN
Cj4gd2F5IHRoYXQgb3RoZXIgdmVuZG9ycycgaGFyZHdhcmUgZG9lcyByYXRoZXIgdGhhbiBmYWls
aW5nLsKgIFNvIGl0DQo+IHNvdW5kcw0KPiBsaWtlIG1ha2luZyB0aGUgY2hhbmdlIGJlbG93IGhh
cyB0aGUgcG90ZW50aWFsIHRvIHJlZ3Jlc3Mgc29tZQ0KPiByZWFsLXdvcmxkIGFwcGxpY2F0aW9u
cyAoZXZlbiB0aG91Z2ggdGhvc2UgYXBwbGljYXRpb25zIGFyZQ0KPiB0ZWNobmljYWxseQ0KPiBi
ZWhhdmluZyBvdXRzaWRlIHRoZSBzcGVjKS4NCj4gDQo+IFRoZXJlIGFyZSBhbHNvIG5vdGVzIGlu
ZGljYXRpbmcgdGhhdCB0aGUgY2hpY2tlbiBiaXQgaGVyZSBpcw0KPiBpbnRlbnRpb25hbGx5IHBs
YWNlZCBpbiBhIHByaXZpbGVnZWQgbG9jYXRpb24gc28gdGhhdCBpdCBjYW4gb25seQ0KPiBldmVy
DQo+IGdldCBzZXQgYnkgcHJpdmlsZWdlZCBzb2Z0d2FyZSBpbiBzcGVjaWZpYyBkZWJ1ZyBzaXR1
YXRpb25zLg0KPiANCj4gU28gbWF5YmUgdGhlIGJlc3Qgc29sdXRpb24gdG8gYXZvaWQgY2F1c2lu
ZyByZWdyZXNzaW9ucyB3b3VsZCBiZSB0bw0KPiBqdXN0DQo+IGxlYXZlIHRoZSBkZWZhdWx0IHNl
dHRpbmcgYmUsIGJ1dCBjcmVhdGUgYSBkZWJ1Z2ZzIGludGVyZmFjZSB0aGF0IGENCj4gcHJpdmls
ZWdlZCB1c2VyIGNhbiB1c2UgdG8gdG9nZ2xlIHRoaXMgYmVoYXZpb3IgYXQgcnVudGltZSBmb3IN
Cj4gZGVkaWNhdGVkDQo+IGRlYnVnIHNpdHVhdGlvbnM/DQoNCk5vdCBzdXJlIHdoYXQgb3RoZXIg
SW50ZWwgZHJpdmVycyBkb2VzIGJ1dCBpbiBBTlYgYW5kIElyaXMgZXZlbiB3aGVuDQphcHBsaWNh
dGlvbiBkb24ndCBwcm92aWRlIGEgc3VyZmFjZSB3ZSBzZXQgYSB2YWxpZCBzdXJmYWNlIHN0YXRl
DQphZGRyZXNzIHRoYXQgcG9pbnRzIHRvIGEgbnVsbCBzdXJmYWNlLg0KDQpTbyBpZiBmb3IgYW55
IHJlYXNvbiBhIGJ1ZyBpcyBpbnRyb2R1Y2VkIGFuZCB3ZSBzZXQgdGhlIGFkZHJlc3MgYXMgMHgw
DQp3b3VsZCBiZSBiZXR0ZXIgdG8gY2F0Y2ggdGhhdCB3aXRoIGEgZmF1bHQgcmlnaHQgYXdheSB0
aGFuIHNwZW5kIGhvdXJzDQpkZWJ1Z2dpbmcgaXQuDQoNCkxpb25lbCB3aGF0IGRvIHlvdSB0aGlu
az8NCg0KPiANCj4gDQo+IE1hdHQNCj4gDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kg
Um9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBk
cml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmggfCAxNSArKysrKysrKy0tLS0tLS0N
Cj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDUgKysrKysNCj4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3Mv
eGVfZ3RfcmVncy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmgN
Cj4gPiBpbmRleCA0OGM1MTVkOTE4ODIuLmU2ZTUxZDA0Y2E1NyAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmgNCj4gPiBAQCAtNTAzLDEzICs1MDMsMTQgQEANCj4g
PiDCoCNkZWZpbmUgU0FNUExFUl9JTlNURE9ORQkJCVhFX1JFR19NQ1IoMHhlMTYwKQ0KPiA+IMKg
I2RlZmluZSBST1dfSU5TVERPTkUJCQkJWEVfUkVHX01DUigweGUxNjQpDQo+ID4gwqANCj4gPiAt
I2RlZmluZSBTQU1QTEVSX01PREUJCQkJWEVfUkVHX01DUigweGUxOGMsDQo+ID4gWEVfUkVHX09Q
VElPTl9NQVNLRUQpDQo+ID4gLSNkZWZpbmXCoMKgIEVOQUJMRV9TTUFMTFBMCQkJUkVHX0JJVCgx
NSkNCj4gPiAtI2RlZmluZcKgwqAgU01QX1dBSVRfRkVUQ0hfTUVSR0lOR19DT1VOVEVSCVJFR19H
RU5NQVNLKDExLA0KPiA+IDEwKQ0KPiA+IC0jZGVmaW5lwqDCoA0KPiA+IFNNUF9GT1JDRV8xMjhC
X09WRVJGRVRDSAkJUkVHX0ZJRUxEX1BSRVAoU01QX1dBSVRfRkVUQ0hfTUVSR0lOR19DT1VOVEVS
LDEpDQo+ID4gLSNkZWZpbmXCoMKgIFNDX0RJU0FCTEVfUE9XRVJfT1BUSU1JWkFUSU9OX0VCQglS
RUdfQklUKDkpDQo+ID4gLSNkZWZpbmXCoMKgIFNBTVBMRVJfRU5BQkxFX0hFQURMRVNTX01TRwkJ
UkVHX0JJVCg1KQ0KPiA+IC0jZGVmaW5lwqDCoCBJTkRJUkVDVF9TVEFURV9CQVNFX0FERFJfT1ZF
UlJJREUJUkVHX0JJVCgwKQ0KPiA+ICsjZGVmaW5lDQo+ID4gU0FNUExFUl9NT0RFCQkJCQlYRV9S
RUdfTUNSKDB4ZTE4YywgWEVfUkVHX09QVElPTl9NQVNLRUQpDQo+ID4gKyNkZWZpbmXCoMKgDQo+
ID4gRU5BQkxFX1NNQUxMUEwJCQkJUkVHX0JJVCgxNSkNCj4gPiArI2RlZmluZcKgwqANCj4gPiBT
TVBfV0FJVF9GRVRDSF9NRVJHSU5HX0NPVU5URVIJCVJFR19HRU5NQVNLKDExLCAxMCkNCj4gPiAr
I2RlZmluZcKgwqANCj4gPiBTTVBfRk9SQ0VfMTI4Ql9PVkVSRkVUQ0gJCQlSRUdfRklFTERfUFJF
UChTTVBfV0FJVF9GRVRDSF9NRVJHSU5HX0NPVU5URVIsMSkNCj4gPiArI2RlZmluZcKgwqAgU0Nf
RElTQUJMRV9QT1dFUl9PUFRJTUlaQVRJT05fRUJCCQlSRUdfQklUKDkpDQo+ID4gKyNkZWZpbmXC
oMKgIFNBTVBMRVJfRU5BQkxFX0hFQURMRVNTX01TRwkJCVJFR19CSVQoNSkNCj4gPiArI2RlZmlu
ZcKgwqAgRk9SQ0VfRkFVTFRfRk9SX1VOSU5JVElBTElaRURfU1VSRkFDRV9TVEFURQlSRUdfQklU
KDQpDQo+ID4gKyNkZWZpbmXCoMKgIElORElSRUNUX1NUQVRFX0JBU0VfQUREUl9PVkVSUklERQkJ
UkVHX0JJVCgwKQ0KPiA+IMKgDQo+ID4gwqAjZGVmaW5lDQo+ID4gSEFMRl9TTElDRV9DSElDS0VO
NwkJCQlYRV9SRUdfTUNSKDB4ZTE5NCwgWEVfUkVHX09QVElPTl9NQVNLRUQpDQo+ID4gwqAjZGVm
aW5lwqDCoA0KPiA+IERHMl9ESVNBQkxFX1JPVU5EX0VOQUJMRV9BTExPV19GT1JfU1NMQQlSRUdf
QklUKDE1KQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0KPiA+
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMNCj4gPiBpbmRleCAxMzk0MzQ5NDZmOGYuLjUy
NzNkZWE4M2RmNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jDQo+ID4gQEAgLTYwMiw2ICs2MDIs
MTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9ydHBfdGFibGVfc3IgZW5naW5lX3dhcw0KPiA+
ID0gWEVfUlRQX1RBQkxFX1NSKA0KPiA+IMKgCQnCoMKgwqDCoMKgwqANCj4gPiBGVU5DKHhlX3J0
cF9tYXRjaF9maXJzdF9yZW5kZXJfb3JfY29tcHV0ZSkpLA0KPiA+IMKgCcKgIFhFX1JUUF9BQ1RJ
T05TKFNFVChST1dfQ0hJQ0tFTjUsIENQU1NfQVdBUkVfRElTKSkNCj4gPiDCoAl9LA0KPiA+ICsJ
eyBYRV9SVFBfTkFNRSgiRm9yY2UgZmF1bHQgZm9yIHVuaW5pdGlhbGl6ZWQgc3VyZmFjZQ0KPiA+
IHN0YXRlIiksDQo+ID4gKwnCoCBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgz
NTAwLA0KPiA+IFhFX1JUUF9FTkRfVkVSU0lPTl9VTkRFRklORUQpLA0KPiA+ICsJCQkJwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqANCj4gPiBGVU5DKHhlX3J0cF9tYXRjaF9maXJzdF9yZW5kZXJf
b3JfY29tcHV0ZSkpLA0KPiA+ICsJwqAgWEVfUlRQX0FDVElPTlMoU0VUKFNBTVBMRVJfTU9ERSwN
Cj4gPiBGT1JDRV9GQVVMVF9GT1JfVU5JTklUSUFMSVpFRF9TVVJGQUNFX1NUQVRFKSkNCj4gPiAr
CX0sDQo+ID4gwqANCj4gPiDCoAkvKiBYZTNwX1hQQyAqLw0KPiA+IMKgDQo+ID4gLS0gDQo+ID4g
Mi41NS4wDQo+ID4gDQo=
