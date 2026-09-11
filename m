Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CB2C88E50
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 15:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FF910E3DD;
	Fri, 11 Sep 2026 15:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jr3UDsPY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C52A10E3C1;
 Fri, 11 Sep 2026 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789140992; x=1820676992;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sjI0hgO5RJz1GXOPtM2cqA28Ulee1aE1h6HnRVLtgCA=;
 b=Jr3UDsPYRyVQ8j7Gb9+VGhAZcGzvtMFWPb3/MtJwR124F7QlSY9Z4GFK
 alvnXO9t4pjGrsASrsfE4rSh0ZdqnmpWKxy2uQmb8XwdNN7HrPf9ptuaU
 eVR17MnfyOHuti6PoM0jkoYl6Eq6L90flpfJA6H9Xpii5FLYlXmAV34mu
 LEdBXCDZYmaJ3b8Ff7LABRhJSRu9BHqkkmS7JzhLZZcaLyCUlITQeWesA
 bxgySMK9C6aMo9mm+JeSk53WbSWo+HdvSD4E1GrIaQUZ9vNJ/bjHdR80W
 bP/qdUyk9dl4Ug+FGQxqxE5w9nW/GSD+QFfdtCsOi0WzQ0+Y5IMLl5/uF w==;
X-CSE-ConnectionGUID: 5qY9Z4T+SfqpOxPoaiji+A==
X-CSE-MsgGUID: fClGAbRkTXC9B1sM4sr5TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="99934795"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="99934795"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 08:36:31 -0700
X-CSE-ConnectionGUID: aj0qJLp/R/CFTzCpA3BFCg==
X-CSE-MsgGUID: tPLzGE4FSmSoHEOW4HtdeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="296937889"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 08:36:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 08:36:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 08:36:30 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 08:36:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5pRASHv7plK/a7Y8vCs+Ef8n2ZMUG+VE6CwHK1xne5Z2epwSX5ExyEgLsa6lrR5oF/CfvQ8J4OPqAk0gOK6SWv9MBCO0N2YqN1zwA2ww5+c2AXTi4enxC4T4MwVTI/aKCgUMXxVRM72nyCOEfxJ0WmeTc6Q0Dw27g4IQ5WhkiNxnMvjE+PHk6FXSXwXbfnXaAcoYF9cXt+mhnXG1zgrj6ij13yvyQJTxw//JfBPCWDIR9wqSmhaw4pcjtaFYUcSrZYeFcirP4CawSzyWgCSgtIJlIzWstLYwrLQZ/V2PFSsRHrpOwoaVs6oPWpOW91ANfGJ43Z4N8LlI/UIAniheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjI0hgO5RJz1GXOPtM2cqA28Ulee1aE1h6HnRVLtgCA=;
 b=SACRgZy1ilbXofUMr41b+ygh7tsBUbSVwL7k6KhWw32L5i5HPSxEQfQpZ505VLWi9hJQw7bzdO/u24oxwjmA0nygl8nFOHKGHFKokZhIzYQpLuPL9qvyzHinuA2Ng6os5SXcaOjofJyOsjN2/XUkBtyj7xL6ULcCf5CZk6uIxVeUnY6fauPq6eS18P8M7aOW5VbnFEFii9+BpVf2QdPE1NnYcKcwrIYrdw+Ks3j5XTK3L4PZLiQVxKifKGjbuH3inuE26i/xM/jsUcauOadrtw80qrvBmoCC7TnVswQ2Cqh5v9zAFLmxYhCpV2PWAZjCHxZzd/0vgLayYAt6Ne9jbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by CH2PR11MB8778.namprd11.prod.outlook.com (2603:10b6:610:281::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 15:36:14 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:36:14 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
CC: "Deak, Imre" <imre.deak@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: Re: [PATCH v5 06/10] drm/i915/hotplug: add helpers to track HPDs can
 generate PME
Thread-Topic: [PATCH v5 06/10] drm/i915/hotplug: add helpers to track HPDs can
 generate PME
Thread-Index: AQHdQcRkO6HmofWcfEOSQjqFtI4sMLbJV5mAgAAragA=
Date: Fri, 11 Sep 2026 15:36:13 +0000
Message-ID: <5b664c22c7f83a3c899e4488159555954ea968ca.camel@intel.com>
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
 <20260911080448.778316-7-vinod.govindapillai@intel.com>
 <8005a243080166f9f328f7a58af857858626f027@intel.com>
In-Reply-To: <8005a243080166f9f328f7a58af857858626f027@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|CH2PR11MB8778:EE_
x-ms-office365-filtering-correlation-id: 4372c086-3338-4eb4-1f10-08df101a69df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|366016|376014|1800799024|4143699003|10067099003|11063799006|56012099006|5023799004|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: eOOYD8xF5PY+msU3zylh1RxLmp9fGRXbW5Xb72eXRZurBSjJDzEE+Wm2GRgzOtOafNn0Di9mRRB5blr9sDWkYN9clSNMXvA8jhGAzeUAhGC/2hlubbkVOWzMj55tlSlyWjobtikqZsxvbOcC0FHVrVEsx0VLkx+kFK5YKL/Rk6TZZKObE1+lXSvlmx9qunrmOWHghXHd8t1RJh3Lo/SJllEAAYW3ba7tkEKttxKb0a/XRyQyO/B5oAVQDQvD7HAYv5FW8g3JsUdqsRhZ7dzY/5mOofzu0YfTNbI7OCxw7YwPnucSZ/8T58yYy6tUrIMSMxR3HisJXeQRKSj2ZxMuqqgEwHSYQoFTqx0MC6aqszWc74HVH+alf94WVC6/ZM58K80fG2Rfmg+CSNcnfT8rc4My4Hqyl+y90BeywTbMc54FOpTDScwXQ/EL2rVts4ng/kz4UoRJJamAv6mT04Hw3lX6SNt9Jr5Ld9541C7tTjQRyJWasXKJXiJMrLA0svFnr0mFzSam+O0+uWM1wv7I/KKn2T281IT8QLmsyPsNAWkVIIIqFzhzkXtUAWsAEr5QPSLv3IjA4xS0QpCeen7+Xy8wPqX3GG9uVQrBF6O03QGkq67ElXfPEYciTVvpYY4z+k+b4BM4pyr8WRHiXA7uNqV0aIRUNm35OJkexjkzRhCuE9sAjfXpUOvXH7p77ObWhxMilPNPYS1VcKzXMwIcACDkOq2BOvryWmRDegHn1jQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(366016)(376014)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(5023799004)(6133799003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0diMTN3WGhMYlhLaElpQW5EdHRabXZvbXFxcWxGbjBRWVhLdUJKUnNLdURm?=
 =?utf-8?B?ZUorMUUrNTNzQmVTVGJyYk5VVC9BT3NlbG5FZCtjcUtBdUxsa1RGMUZNMHVJ?=
 =?utf-8?B?NDRVeEZkajQvb3JwWExLTTBWQTVhOWFmMjN6SElWOFBsRlhRUkNuLzFUeHhz?=
 =?utf-8?B?MmFFYktQaXBGdzQ4TUdaVmdCWFVBTzgxK0dsd0t3RGxtZzdBQmdDNS9tRy9T?=
 =?utf-8?B?NGZ4Z3hkbUI3Yno3b2ZmWjhPbmdsYWY0QTc3NHAwUDFWcStIUTJ2MUJyc3JS?=
 =?utf-8?B?MlJPK3NsWGZrRTl6dUNSMkZVeTZGMzVFTkJRaVJ6OXZwZ2xncld1U3FNL2Ew?=
 =?utf-8?B?cVpjR05GYlA0cWxOVkR5S0R0ak9kSmE4NTIyT0NkTTY0R2xJS0JSRHNTSENX?=
 =?utf-8?B?aXYwak5UZUdscXlRK1hKSEVCWDdlelVaay90ZUszL3A2eUpURGRRbEFuVWJT?=
 =?utf-8?B?WllmRXMwWUxUbXBFRWdwL3FwWDlTQmozeHp1RHplbXo2YjNYMDZXNDI0enMr?=
 =?utf-8?B?T0xFUFlZd2IxUGx2RHF0ejRZdSs1L2xVb1ZQWWwrVk9SRXhVYm9YOGpsc3dT?=
 =?utf-8?B?a1FYeStRVjlucU9rRVpHQ2R4WllydDhOek0vcEZTaGNPNjhSVEIyOGNVT1FV?=
 =?utf-8?B?UFVRSncrWnFEMDJoTzRMYzNWb2UxTnNSN091NVM3SDlYNGpqQWZKbno1enYw?=
 =?utf-8?B?ZktjOUltSENFdHpzbkgxbWsza0VveVJZVGFCUDFldHFVUlZ3UjhmM3Rna1J1?=
 =?utf-8?B?VW5xVno3cjd2S3dPQW94UmhVRnBpQUlGOUNYWTYxSExjc2o2dWYwamhhMG01?=
 =?utf-8?B?RWM0eW1mTzFUY2hlbVJKZWZ3dTc1eVgyQ1BHMktPTksxSVBBTGlubFVZSU5T?=
 =?utf-8?B?aGlaM3BISEhvT3ZPeHJ5SEVqZ3RuVEtnR2hsRS9YZk93RXVMVlY4bWFTUnoy?=
 =?utf-8?B?cFpVeG1seGZuQjFmVys2Y0hLUjJQSEo5bng4bDliOWZxY2VpS0YvWU5xRE5R?=
 =?utf-8?B?by9nRjJ4ZWtadUhHUHNMVXdNM3UyTFNlMmx3Nld5TktkTW5UMW90WWpBeFFJ?=
 =?utf-8?B?K0xZOGpUVzNEOTJWUWJCRG4xajhYcDJ4TnpQeDhlRk5iOWdNcnFuaDg3czdo?=
 =?utf-8?B?VzYvcnBYcEh3TWM2Z3VzMngvYWR2eTVsZHJUN09Md1Fmc0s1VFNOUW45Q1RW?=
 =?utf-8?B?SmRPU0hTMjUzL0RXQ1lLMjhDUElsS3piTVZLMm1lV3E0Wjc2ZGRIMUdxcXJz?=
 =?utf-8?B?eXpXQlpHcmtEM0tCQnYrUDhZb2FFc3IraEh4ZTJEbE9YeHNKRnNzVVJKRng2?=
 =?utf-8?B?MHBSSG9EcjZlVXdodWNUMEFvVzR6Z0FBdVFvVVpZWkozREZpcXhOR2tNMEt1?=
 =?utf-8?B?UWx6YUFPTVBjaksvUGcxQm5ZNVV3Tk04RTJqUHZzendCT1hHdVRZSmtMYkx0?=
 =?utf-8?B?enNUVnhsVFFiYUxCRVRVaTlHNGNhNHpGdGtXUmV3djBDWlhrM0JYaUQrVnBN?=
 =?utf-8?B?YkQ2ZG5OSW1VclpFUHQ2SDU1anNESk5RbnBQVFdFUEVvekttWDd5VFZYUFVj?=
 =?utf-8?B?NkdIRCtma0ViYjcxNXBBOHloQUtvTjBUYXIxak1uZVEvQjFiNmtxSCtQdTly?=
 =?utf-8?B?blZGaEhLMGxoRGtxRW9CbVZLc3dyN0RXN0dUOTI1bW1sOFZGakpTN0VyWTRk?=
 =?utf-8?B?NlJRbklEclVyWDFCWkt1YVA1ejJwRHN6TzVtTUV5b3o0QkEwLzFjZ0hvNm94?=
 =?utf-8?B?RzE5ay9EZE54MHpjc2dYdld6NkdIVW1EVUg3N2taUkF5VkRZWGUrSU8wb2Nu?=
 =?utf-8?B?Z0V5OXRJUVZhN2dhTk1KL2tuazcrSVRlMW8yU0FGT1NxK1VXdU04d1NwYURk?=
 =?utf-8?B?Q083d3FhdzdBOUEzMDBEdXBTc0tRczNxMEhMUFA0dVRVNm1HSElpR1N4MGdi?=
 =?utf-8?B?NXRHWGFNc1YxNUVIK0tiYjBZSHd6UDZldzhYYkZwb085Ym53YkVTU0VVNC8z?=
 =?utf-8?B?UkovZk5FQXdFUmh0UEx5WE11K2pGV3hRWjJwK0E0THVUekFYTjU3Z0Q4Wi9K?=
 =?utf-8?B?LzJKUlI3VTBSNUtLWXJJQWp6NVQ4ZWFnZEdSenBPS2V3S2ZRL2x3NFAzNDk1?=
 =?utf-8?B?VHNoTmhmcFZYaDJiUk1QcWlTT2RYbHBiREZDRmp4c1VGUE9RNEZyMVNyNURx?=
 =?utf-8?B?bG9ZK1RTRldTUnFmbmNpV3hqbmluQ1U2WEg0Ump2Z0RWeURyZUJKWUl2bkY4?=
 =?utf-8?B?WGxxTG9MVUIrRHFibWh2SmR3dnNaTXBLUHhmbCsxUmtWWTcyUzdFTGRhNmNx?=
 =?utf-8?B?RUtNV2VuOSsvRUFpZkNBUjFsQVdETFpMNkNXV0lxWDU3TzlLZFRFMGZmQ1Fo?=
 =?utf-8?Q?xThGu6kMzwRtf5fe/i8hENi+JEriO9K4zKDQRcTHkLpBJ?=
x-ms-exchange-antispam-messagedata-1: re8hEcV7ZAJWte6LOE7y4pTkcq6cebcTp7P9VirHuf5wiWYyEZzmuiAN
Content-Type: text/plain; charset="utf-8"
Content-ID: <1030373BD16E9C45B9E6A3C237CBC3BB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Wbhxprd29oFi7EA+YVAwHyT8Zbo7QmvEhUNu9jH8AOPsc5Che5/6F04GOUtkwXqqOJxgY6OceGOwym9N5mqeHUGVEjcdkXgBykRjhmBBg+R3CJ/G0GY7JNQvBKH61fbOdTT7FqeJ8kP58Ibqynz+AAeeggogxlLTAg1jCTQU67T7WpPMBJsBWRrMhAEQ0pGqfFoS7a4FRdmCle4p92lAoX/MJgk3BtbT+dPiuN9nN3nN463j3HYd/riKHoipQsAAnkM/7YU660HPVOqu6j1rOUwnw42smb9HSC7pUWLQcP7TB57Cm9nsoav3fLLhFJSKmzxW8HB6bhWpYIDt53St7w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4372c086-3338-4eb4-1f10-08df101a69df
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 15:36:14.0454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QghChetxjrj2oz4Xogrb13ENM9IVO710rJe/HZjniAcccL3b75a4tgwjrHcVLy1OL8bXZ6ym/lBYyFBdxLiYXI/c/VcyT71u1Z9f09juWR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8778
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

T24gRnJpLCAyMDI2LTA5LTExIGF0IDE2OjAwICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gRnJpLCAxMSBTZXAgMjAyNiwgVmlub2QgR292aW5kYXBpbGxhaQ0KPiA8dmlub2QuZ292aW5k
YXBpbGxhaUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+IEFzIE5WTCsgZGV2aWNlcyBjYW4gZ2VuZXJh
dGUgUE1FIGZyb20gSFBEcywgaW50cm9kdWNlIGEgZmxhZyB0bw0KPiA+IGtlZXAgdHJhY2sgb2Yg
c3VjaCBhIGNhcGFiaWxpdHkgYW5kIGhlbHBlciBmdW5jdGlvbnMgdG8gYWNjZXNzDQo+ID4gdGhp
cyBmbGFnLiBUaGUgcGxhbiBpcywgdGhpcyBmbGFnIHdpbGwgYmUgc2V0IHRvIHRydWUgZnJvbSBw
bQ0KPiA+IHJ1bnRpbWUNCj4gPiBzdXNwZW5kIGlmIFBNRSBpcyBlbmFibGVkIGFuZCB0aGlzIGZs
YWcgd2lsbCBjbGVhcmVkIG9uIGVhcmx5DQo+ID4gcnVudGltZQ0KPiA+IHJlc3VtZSB1bmNvbmRp
dGlvbmFsbHkuIFRoaXMgaXMgYSBwbGFjZSBob2xkZXIgZm9yIHRoZSBmbGFnIGFuZA0KPiA+IGxh
dGVyDQo+ID4gb24gdGhpcyBmbGFnIHdpbGwgYmUgdXNlZCBmb3IgY29uZGl0aW9uYWwgSVJRIHJl
c2V0cyBhbmQgdG8gZGVjaWRlDQo+ID4gd2hldGhlciB0byBkbyBIUEQgcG9sbGluZy4NCj4gDQo+
IFdoYXQncyB0aGUgcmF0aW9uYWxlIGZvciBkdXBsaWNhdGluZyB0aGUgc3RhdGUgaW4gYSBmbGFn
PyBXaHkgY2FuJ3QNCj4geW91DQo+IHVzZSBpbnRlbF9kaXNwbGF5X3JwbV9wbWVfZW5hYmxlZCgp
IGFuZCBoYXZlIGEgc2luZ2xlIHBvaW50IG9mIHRydXRoPw0KPiBUaGlzIHdvdWxkIGRvZGdlIHRo
ZSBleHRyYSBlcnJvciBwYXRoIGNsZWFyaW5nIHRvby4NCj4gDQo+IEkgZG9uJ3QgdW5kZXJzdGFu
ZC4NCj4gDQo+IEJSLA0KPiBKYW5pLg0KPiANCg0KQWguLiEgWWVzLi4geW91IGFyZSByaWdodC4g
Tm8gcmF0aW9uYWxlIDooIEkga2luZCBvZiBvdmVybG9va2VkIHRoYXQNCnByb3Zpc2lvbiBhbmQg
d2FzIGZpeGF0ZWQgb24gdGhlIHN0ZXBzIEkgcHJlcGFyZWQgYmVmb3JlIGFuZCBmaXR0aW5nIG15
DQp3aG9sZSBsb2dpYyBpbnRvIHRoYXQgOigNCg0KVGhhbmtzLiBUaGlzIGlzIHByZXR0eSBjbGVh
bi4gV2lsbCB1cGRhdGUuwqANClBhdGNoZXMgNiwgNyxhbmQgOCBhcmUgaW5kZWVkIHJlZHVuZGFu
dCBhbmQgd2lsbCByZW1vdmUgdGhvc2UgYW5kIHVzZQ0KdGhlIHJwbV9wbWVfZW5hYmxlZCBkaXJl
Y3RseSBpbiBhdm9pZGluZyB0aGUgSFBEIHJlc2V0cyBhbmQgSFBEIHBvbGxpbmcNCg0KKyAgICAg
ICBib29sIHJlc2V0X2hwZCA9ICFpbnRlbF9kaXNwbGF5X3JwbV9wbWVfZW5hYmxlZChkaXNwbGF5
KTsNCg0KYW5kDQoNCisgICAgICAgaWYgKGludGVsX2Rpc3BsYXlfcnBtX3BtZV9lbmFibGVkKGRp
c3BsYXkpKSB7DQorICAgICAgICAgICAgICAgZHJtX2RiZ19rbXMoZGlzcGxheS0+ZHJtLCAiUE1F
IHdha2UgY2FwYWJsZSBkZXZpY2UsDQpza2lwcGluZyBIUEQgcG9sbGluZy5cbiIpOw0KKyAgICAg
ICAgICAgICAgIHJldHVybjsNCisgICAgICAgfQ0KDQoNCkJlZm9yZSBzZW5kIGEgbmV3IHJldmlz
aW9uLCBob3BlIHRoZXJlIGFyZSBubyBvdGhlciBjb21tZW50cy4gRllJDQpASm91bmkuDQoNCkJS
DQpWaW5vZA0KDQo+ID4gDQo+ID4gQnNwZWM6IDUyOTc5LCA1Mjk4MCwgNjg4NTcsIDY4ODY3LCA2
ODk3MA0KPiA+IEFzc2lzdGVkLWJ5OiBHaXRIdWJfQ29waWxvdDpjbGF1ZGUtb3B1cy01DQo+ID4g
U2lnbmVkLW9mZi1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBp
bnRlbC5jb20+DQoNCg==
