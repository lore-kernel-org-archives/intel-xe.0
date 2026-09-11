Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DA1C88E50
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694BB10F54C;
	Fri, 11 Sep 2026 08:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzhJkqUQ";
	dkim-atps=neutral
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 11 Sep 2026 08:18:06 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D30310F54C;
 Fri, 11 Sep 2026 08:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789114687; x=1820650687;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=C/1TYrPyzy87sPDqbIsYno+eF0wCxcQfuwAuuxf3zII=;
 b=lzhJkqUQXvptKXo2Q6mLZQjjZ452ko8eJZDEbTqK2CWuSmkzqBbuBTHf
 u1HDhNIxbArO1Q/gMzd/2rD/iDgfRyrOMagi8BsPVvdR8hI1Qr90u9Y44
 /019u3nvKJqSXBThWwC6smdMsr72XFdrRAorR1uzNT+wdMYMl8WKfhV1m
 gU+D+p+dPvYjgKHh7SGs8L0UGhtDcxdcoc//v9dFIKiwLtXCC9oaTVgMm
 7+s/NaY4NddNUkWVprA+gskksAulBGbycjPdOSxsvxxZkH+QPFLTI7F/f
 5Qearqx0Ek7158J7+EzsZqUHfKToWQ5CbjdNkm6HEUvmYNInZSF82fgpW A==;
X-CSE-ConnectionGUID: Ul5KOpdlQ0e2LnoqCgfMCA==
X-CSE-MsgGUID: zOWEaTq5QSGRVGeTXzy9mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="84838"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="84838"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:10:59 -0700
X-CSE-ConnectionGUID: jnhzF+ItTtiLV8ivUttUrA==
X-CSE-MsgGUID: V3Tq27I+TFS7pCwiRdNU/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="153840"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:11:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 01:10:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 01:10:59 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 01:10:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/XviHOr6Fp8TbePyeUsxsygEes/nkT+VJUME10YQT+18DHcTEeYBc9bY4ap2sTqH9JSzG6juviUdrudzd5NTHeozs3zJhB5Ydt4PMW/TOZOv3qJq2w7kmV2r556LSORfzh16Edf4+KXD3P+hxVIYH5or7+eGKJg1YTQciHG1ySxpIa8LMPChkKspyNbWCqhcg3wZkgESHNZEJLAaSVKLHxfkaRHh0U73xvx5jYrU4ntEgloihtqiU1dkPXlGhweLD1APm/YHagAySrR1XPYNLfdTlKVpA7tR/TyWTRBtzuuwAdkwWvvsLFA05d0y1nXo2WKR38tB3z8QMlVY0TpGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/1TYrPyzy87sPDqbIsYno+eF0wCxcQfuwAuuxf3zII=;
 b=UpwnQ69iQpIgxuDBXLTqO5Vm+n1Md8qN5e9zjBQ5SYovE11orXnLRFnEkASnAlD0Ap+WPIHNqtcztYPA/aI75E3AtNmsW+e4clu047xem7NtwOrW4xixv8RT2wjMsGWdcTQbOZC6fEDR59AgFlha1IZfHjUzJ42puhiiJ5uS5+59JmkTHGuJj6swLkb8feJ6sSywdww1apbxxDHPnXl1YbDklEhj4Xf39HqjR6PcS/pjKEsuxTJJI0dtVQ6LgN2hTEQ3xbjxZpkyulorea9brG4NODGA3HWNzG3urSLmqon4HFy251bLiFKqtvR2syThBQfDA3qS68uLqLaq33xVSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SA1PR11MB8837.namprd11.prod.outlook.com (2603:10b6:806:468::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 08:10:51 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 08:10:51 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
CC: "Deak, Imre" <imre.deak@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/pm: handle the PME capability and runtime
 pm routines
Thread-Topic: [PATCH v2 5/5] drm/xe/pm: handle the PME capability and runtime
 pm routines
Thread-Index: AQHdO3sIPw27qI2T70W8nAoUfZPQvra+MkmAgAYK34CAABbBgIAEvzsA
Date: Fri, 11 Sep 2026 08:10:51 +0000
Message-ID: <62449e515db66adae42557cbe920b6b6cef14313.camel@intel.com>
References: <20260903080410.489411-1-vinod.govindapillai@intel.com>
 <20260903080410.489411-6-vinod.govindapillai@intel.com>
 <f5e074540e36b2c9fee11a9bfd14beabcc8cf016@intel.com>
 <83e32e6c3fafdc6a5da34593718a8a403ccd3695.camel@intel.com>
 <72062813fd0dd71f67e0d201e628091bb8cd7d5f.camel@intel.com>
In-Reply-To: <72062813fd0dd71f67e0d201e628091bb8cd7d5f.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SA1PR11MB8837:EE_
x-ms-office365-filtering-correlation-id: 61b92221-25ae-4ab6-8deb-08df0fdc31d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|23010399003|11063799006|4143699003|5023799004|56012099006|10067099003|6133799003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: fsZhOEhXjURi3THtOyOalyd8Ngr2+S0LJ7+tvZWGIFHLWL3s5ImoodcpC5Yncwu5BDaArmwAooPoNBoYM9tGbtxflv62OdWHR7A1HZuo02uOIhpDLPSuCQBRY9dUjaVIkRE3iuAbPS6tOdE/c4pfV10czDtWZRigHpulvuGkdVFmIlzFSaYEk41ByqQeFbasuTeW0epDnqEVV8BuevVD6N5UBkYhBA8iK4rH5CuT9ZXrhfgK+XNPTmOY8CILUUXWZ6ccRkjVwTnwZab48lySdjjQw2/lrXvS2aRWJr5U1V/pjMVRwvC1k0R2U6JNzIcpQYmR5rKsiuv5Qzwoa3p63MOWanPFHN/cspsKwx2UFppIfWC9Xj7a2Ed2ATxr2UifD+Lp7n/Dhev9hW/ZI9coWoDvdyB6HfMXDdmlZY/eOCF0imoVCidAI8hstk/F5TmUVY2g2oTjSKKGbLnenIWh4dDjVMMYU9xBtW2CBbgn1g+TK9T2FPY38bCfqEueHuvYZQEp4DpLfredrpZLoxTvS4tH+Y16sToKmQxMkv9hAFA0ZLnv6HQDYGLN3Q+tIkA14ojva0KL9hVNbvcVYFr22r4IWubPgiyJMbFmt2K7bpYaX6wAGMiCGz7yxjrrgQBQ3Xin00raTHUW1DAYTvrjvr1EyOcuNpBSy+V+Hr+v9KObGneYW3CMzpI2gt0Pe10t33ZPT0cERxsZRoh+m/mT1K7MdXfHxnGT8alvSjx5qrE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(23010399003)(11063799006)(4143699003)(5023799004)(56012099006)(10067099003)(6133799003)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akJ1bDdqTE9uaWM3QUxESWR6TFdQYzdGRWx6TmlKbFFHWVFEbXU4WHIwV25I?=
 =?utf-8?B?OFpVVm42TlZrSEFzNWdzU2xNL0ZuMkp1Yy8xSHhveEpYdmVSTkNxbHoxakoz?=
 =?utf-8?B?dzVJVGVEeGswS1dad21KT0t0SVU2ek05cmpNOE1WTVlxYmZwajBrM1VvbDhi?=
 =?utf-8?B?Snhra1l4QzBUY2kxbTIwS0Qxd25DT2tUUCtKVktCU2tMZWk2d1psd3drVko3?=
 =?utf-8?B?K2k1WmxEbVJsOHNjR25TOHlqTUgvMTdlR0NhRnZ6eTVERHJVQ2tnUWZCSTRD?=
 =?utf-8?B?L3dXL0x5V0I5dHZlV2szeHBBOHlpZjFwbHJNa2pyVnhZWS96MmtidFhPU0tI?=
 =?utf-8?B?WDNOSDJXZ0c4SmFxZkk0MTJpZEZlNHQvS2hwNGllajFiUTZUVExISnUzbWN6?=
 =?utf-8?B?Q0M2N05oQ3M4WDZNa2ZvbHZsSmVIaE1KMEdId0t1VmJVdUYxV1FuRnNscm55?=
 =?utf-8?B?dHRmNENBVFRyWFNzUzlMQlNneWFIRTJYNm1YbjBHRnhiclR3cjg3ZXI2SHdJ?=
 =?utf-8?B?ZXpqV0p3bDNpd2s1b1lyTjh2YXJJaS9mdFMyeUZmT0l3ZEZlYkEvQXI0Mkpp?=
 =?utf-8?B?TnUrTGRUTFpuT25teVhsdVdwVTRXVUdDaVU3Z0dvalhCUUlMcm1HWlIvRGhC?=
 =?utf-8?B?U296TU5TYnBWTU5mZlFzMjIySndwcUZYb29OTzJMTjd3WmE0RU9ZdUR4K3JK?=
 =?utf-8?B?ejRwUHhJRkcwQWl1Vk5lTnFoRDBrMHRIOG9TVzNZSjNVTjdqNzM4RjVNOGps?=
 =?utf-8?B?bjZSYzZyQzFkOHAvQ3c3ZG0yUlRJMWpXTjhQazJSbzMzbXlTS1lhd1BtcmxG?=
 =?utf-8?B?ZzFCeTNnRFhmUnJCd3UxbWpLUi9OODdjM3E3NHloKzZTM2kvQTNCL05IRHoy?=
 =?utf-8?B?M3Y1ZUxBTjdrZnFmdnBjbkRDQk5SdDlVOWJGc2V3WnA2WEpjOUtpWFUreFJL?=
 =?utf-8?B?RXVLb3grYkZjU2kwNTI5dGUvM2QwTlRrK25TM2hnQ3ByQTAwSUFDblJPRk9h?=
 =?utf-8?B?eUkyN0t5RWZKOWVHcWlHZXhvTGNCc2VzYVBSUElwdnNlOCtTb3prWFkrZjdY?=
 =?utf-8?B?Tm5sQlVDUTdLbnlVM0xpd2d2d0dueVVsbk16YkorWnFkRUxObS9pTHUrREhv?=
 =?utf-8?B?VkJjeGxLdVd3eGJBNzNmTStNQVVwNWU1QVpaZ3dDT29rV1l1U0dSSEtRU00r?=
 =?utf-8?B?RkZmZzdVMGhvSU1pM2xtVDBwSDYzdGNjekhmcngyTVoweUxyTkpiWGFaVW5i?=
 =?utf-8?B?eThydjM4V0lVVnE4MGJwVXpoSlYzVDlwVm5NZmFNQjgyN1EvYmhFRVI2bHlJ?=
 =?utf-8?B?VnZlVHBVSEk1Ym0ydENKRk5WS1IyUEtQaFRYUWZQQjN4TlNieHdtVlRwdzZQ?=
 =?utf-8?B?T1UxSjZTUnlwTTRSRlNjODMrcyt0dVdrT3ZxY2N4dE1HSkFpY0tvaUF0S1Bs?=
 =?utf-8?B?Y1RPaDI0UE5xSXhaNldVd1pqNDU5NlFpMWFQWnVHSXZDeTJPUVZ2TVhFTW9n?=
 =?utf-8?B?eW9kenZjT3gvNnVkdXBWSXJObWIzVlFZTHQvWmtDbWJyVW92aFpwRjBiOTNR?=
 =?utf-8?B?SE5aR0h1UWlzalczVFE5ZEVLczRiU0dZb1BXWTY0R2QxOEVPM25TamJnZW5S?=
 =?utf-8?B?WGNTMFRjZGM4S2tIdExjS2NPMUxFN0JmTDJXMUZ1bk4yZWtDZjVyMlA4Mk1w?=
 =?utf-8?B?TlJQa2Z0MW80Tjlqa2lzS2tDWTVLUVFQT2NrV0U2dVg0VXJYN1ZuWE4wVXBT?=
 =?utf-8?B?NWZiTnZNUlcvNWdyMU5UK2ZzdnhGZ3ZTRVJMOWV0Ymh3WTNFdERJSERGNThV?=
 =?utf-8?B?NVh2UEFDbFo2Zy81STNBMi9HZlQxeS9FVjFwaEVPbitKUnFQWWhPVWM4T1Y1?=
 =?utf-8?B?K1dZUktnYlBDamRPWVdyb3dqT3RLcDNiN2NscFhlenJsY1FnYXBlZjNpRGJt?=
 =?utf-8?B?RDhTbzZKMVpTNUt5czFydEFueTg1a2c2NzM3NE9IczIxWFdERlZLa2JoWDQy?=
 =?utf-8?B?dFRkWXRyeXMrSVNtVnpPMFFDd1pIeGszOUFld28xa0lkU0xEM2cxWW5iVmhw?=
 =?utf-8?B?TUNxVWMxK0RRcFFsd3Y4R1diWWVXUG52b0dmdTBkUDdLY2hIRnBxc1g4aDFP?=
 =?utf-8?B?S0FueDcwc05xeXJ0V0xKbWhZMWcrRzVYWXoxVUVEU1psZGk0eE9Cek1PZ2VH?=
 =?utf-8?B?akJQVHd0d2gwOXZwcWl1cVlwSUFOUjdaRVlUd01FdktyUW5TeWdiV3RJVUdH?=
 =?utf-8?B?UmVMSWtXa05UY0dCTHpPczlBa3Z6MHo0alRKc01seU5OQ1JVdTBXZlg1VHRK?=
 =?utf-8?B?ajBSR0hHREJrRTYyQkZaQ1J1RUNvR0hJekxLZkJMdTFqMTNhK21kVjZEQ3hr?=
 =?utf-8?Q?nhy0xK7QlqFY0mquX9iKQ6gHfGSDIHl1gvyHvA+pcHim/?=
x-ms-exchange-antispam-messagedata-1: KXyBAXJwQQySkhOk35qcBh9/KaUsQ+HQv8WVaHifQLgtryylJUJU555b
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C4AFBE83F8F87438A18047C41AF384C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tT82mdt9inZ97svCGvWV888fhKGCW/cy+3IKoO0xPCDmfyW9USt1g1wietPIJ6debOze4eUdlV4QTkaYhu3mx5dosAY7tx0y/H/TPwmpkg06QG5SS312Rk0IraQqHIWCQLHqxx79ke5ziD3ITqBFBzHVjsloWb90zjQVEVUOeXHE+TjcgPdrm9XoTN3H1UeRuT0GS3MRh+wGYqH+YCWm1tH9jvl5MSbVuCeBEjhFpWTOBVq2M1u+zc+qePesaHK0LvJpHVhuNEBZu3+6UBragl4CNVusur4hLoMFhTnEMxASTve9cKwMjnraEIaH8SqdXx/lz3IoIR7Z97KEDRFFNw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b92221-25ae-4ab6-8deb-08df0fdc31d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 08:10:51.2569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jrs0BxVIMEXlufojaC46PDYAkc6k8KPPbcC7LRzqzDIvISLxHDCcCOh9L9AZG/Wm73umCf57ShsKVUMCF1y6T8y0a5uiN03bUlUHB4k/+A8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8837
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

SGkNCg0KSSBub3RpY2VkIHNvbWUgbG9ja2RlcCBzcGxhdCBpbiBrZXJuZWwgbG9nIGluIHNvbWUg
c2NlbmFyaW9zIGR1cmluZw0KdGVzaW5nIGFuZCBmaWd1cmVkIG91dCB0aGF0IGlzIGNvbWluZyBm
cm9tIHRoZSBwY2kgcG1lIGFwaXMgd2hpY2ggZG8NCmttYWxsb2MuIFNvIEkgdXBkYXRlZCB0aGUg
c2VyaWVzIHRvIGhhbmRsZSB0aGF0LiBBbHNvIHRyaWVkIHRvIGF2b2lkDQphbnkgZXhwbGljaXQg
Y3Jvc3MgZGlzcGxheSBjYWxscyBhbmQgYWxsIHRoZSByZWxldmFudCBjYWxscyBhcmUgd3JhcHBl
ZA0KdG8gdGhlIGludGVsIHBhcmVudCBpbnRlcmZhY2VzLg0KDQpCUg0KVmlub2QNCg0KT24gVHVl
LCAyMDI2LTA5LTA4IGF0IDEwOjQxICswMzAwLCBHb3ZpbmRhcGlsbGFpLCBWaW5vZCB3cm90ZToN
Cj4gT24gVHVlLCAyMDI2LTA5LTA4IGF0IDA2OjE5ICswMDAwLCBIb2dhbmRlciwgSm91bmkgd3Jv
dGU6DQo+ID4gT24gRnJpLCAyMDI2LTA5LTA0IGF0IDEzOjAzICswMzAwLCBKYW5pIE5pa3VsYSB3
cm90ZToNCj4gPiA+IE9uIFRodSwgMDMgU2VwIDIwMjYsIFZpbm9kIEdvdmluZGFwaWxsYWkNCj4g
PiA+IDx2aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4gd3JvdGU6DQo+ID4gPiA+IER1cmlu
ZyB0aGUgcnVudGltZSBzdXNwZW5kLCBjaGVjayBpZiBkZXZpY2UgaXMgY2FwYWJsZSBvZg0KPiA+
ID4gPiB3YWtldXANCj4gPiA+ID4gZnJvbSBQTUUuIElmIHllcyB1cGRhdGUgdGhlIGhlbHBlciBz
byB0aGF0IElSUSByZXNldCBhbmQgSFBEDQo+ID4gPiA+IHBvbGxpbmcgY2FuIGJlIGhhbmRsZWQg
YWNjb3JkaW5nbHkuIEZvciBQTUUgY2FwYWJsZSBkZXZpY2VzLA0KPiA+ID4gPiBIUEQgcmVsYXRl
ZCBJUlFzIGFyZSBub3QgcmVzZXQgZHVyaW5nIHJ1bnRpbWUgc3VzcGVuZCBhbmQNCj4gPiA+ID4g
ZG8gbm90IHN0YXJ0IHBvbGxpbmcgZm9yIEhQRHMgZXZlcnkgMTBzLiBJbnN0ZWFkIFBNRSBjYW4g
YmUNCj4gPiA+ID4gZ2VuZXJhdGVkIGZyb20gSFBEcyBhbmQgY29ycmVzcG9uZGluZyBydW50aW1l
IHJlc3VtZSBjYWxscw0KPiA+ID4gPiBjYW4gYmUgaW52b2tlZCBieSBQTUUuDQo+ID4gPiA+IA0K
PiA+ID4gPiBCc3BlYzogNTI5NzksIDUyOTgwLCA2ODg1NywgNjg4NjcsIDY4OTcwDQo+ID4gPiA+
IEFzc2lzdGVkLWJ5OiBHaXRIdWJfQ29waWxvdDpjbGF1ZGUtb3B1cy01DQo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkNCj4gPiA+ID4gPHZpbm9kLmdvdmluZGFwaWxs
YWlAaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
ZGlzcGxheS94ZV9kaXNwbGF5LmMgfCAxMCArKysrKysrKysrDQo+ID4gPiA+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheS5oIHzCoCA0ICsrKysNCj4gPiA+ID4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcGNpLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNiArKysr
KysrKysrKysrKystDQo+ID4gPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheS5jDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL2Rpc3BsYXkveGVfZGlzcGxheS5jDQo+ID4gPiA+IGluZGV4IDdiMjVjMDgxNDY3NC4uZmY0
YTc0YzVjNzYzIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxh
eS94ZV9kaXNwbGF5LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkv
eGVfZGlzcGxheS5jDQo+ID4gPiA+IEBAIC0yMzYsNiArMjM2LDE2IEBAIHZvaWQgeGVfZGlzcGxh
eV9pcnFfcG9zdGluc3RhbGwoc3RydWN0DQo+ID4gPiA+IHhlX2RldmljZSAqeGUpDQo+ID4gPiA+
IMKgCWludGVsX2Rpc3BsYXlfaXJxX3Bvc3RpbnN0YWxsKGRpc3BsYXkpOw0KPiA+ID4gPiDCoH0N
Cj4gPiA+ID4gwqANCj4gPiA+ID4gK3ZvaWQgeGVfZGlzcGxheV9zZXRfcG1lX2NhcGFibGUoc3Ry
dWN0IHhlX2RldmljZSAqeGUsIGJvb2wNCj4gPiA+ID4gcG1lX2Zyb21faHBkKQ0KPiA+ID4gPiAr
ew0KPiA+ID4gPiArCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0geGUtPmRpc3BsYXk7
DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlpZiAoIXhlLT5pbmZvLnByb2JlX2Rpc3BsYXkpDQo+ID4g
PiA+ICsJCXJldHVybjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCWludGVsX2hwZF9zZXRfcG1lX2Nh
cGFibGUoZGlzcGxheSwgcG1lX2Zyb21faHBkKTsNCj4gPiA+IA0KPiA+ID4gVGhlIGRvd25zaWRl
IHdpdGggdGhpcyBpcyB0aGF0IEkndmUgYmVlbiB0cnlpbmcgaGFyZCB0byAqcmVkdWNlKg0KPiA+
ID4gdGhlDQo+ID4gPiBudW1iZXIgb2YgZGlyZWN0IGxvdy1sZXZlbCBjYWxscyBmcm9tIGk5MTUg
YW5kIHhlIGNvcmUgdG8NCj4gPiA+IGRpc3BsYXkuDQo+ID4gPiANCj4gPiA+IFRoZXJlIGFyZSAx
MDArIGNhbGxzIGFscmVhZHkuIElNTyB3ZSBuZWVkIHRvIGRyb3AgdGhlbSB0byB0aGUNCj4gPiA+
IGJhbGxwYXJrDQo+ID4gPiBvZiBsZXNzIHRoYW4gaGFsZi4NCj4gPiA+IA0KPiA+ID4gVGhpcyB3
b3VsZCBnbyBkaXJlY3RseSB0byBhIFRPRE8gbGlzdCBvZiB0aGluZ3MgdG8gcmVmYWN0b3IgYW5k
DQo+ID4gPiBjbGVhbg0KPiA+ID4gdXAuDQo+ID4gPiANCj4gPiA+IEZlZWxzIGxpa2UgaXQgd291
bGQgYmUgbW9yZSBjbGVhbiB3aXRoIGEgcGFyZW50IGludGVyZmFjZSBmb3IgdGhlDQo+ID4gPiBk
aXNwbGF5IHRvIGFzayBpZiBwbWUgaXMgYXZhaWxhYmxlLCB3aGVuIG5lZWRlZCwgZXZlbiB0aG91
Z2ggdGhlDQo+ID4gPiBwYXJlbnQNCj4gPiA+IGludGVyZmFjZSBpcyBhbHNvIHRvbyBiaWcuLi4N
Cj4gPiANCj4gPiBXb3VsZCBpdCBiZSBvayB0byBzb2x2ZSB0aGlzIGJ5IGRvaW5nIGFsbCB0aGlz
IGluIGRpc3BsYXkgcnVudGltZQ0KPiA+IGNhbGxiYWNrcz8NCj4gPiANCj4gPiBQb3NzaWJsZSBk
M2NvbGQgZW50cnkgY291bGQgYmUgZm91bmQgb3V0IGJ5IHVzaW5nIHBjaV90YXJnZXRfc3RhdGUu
DQo+ID4gDQo+ID4gSXMgaXQgb2sgdG8gYWNjZXMgcGNpIGRldmljZSAocGNpX2VuYWJsZV93YWtl
IGFuZCBwY2lfdGFyZ2V0X3N0YXRlKQ0KPiA+IGluDQo+ID4gZGlzcGxheSBwbSBydW50aW1lIGNh
bGxiYWNrcy4NCj4gPiANCj4gPiBCUiwNCj4gPiBKb3VuaSBIw7ZnYW5kZXINCj4gPiANCj4gPiA+
IA0KPiA+ID4gQlIsDQo+ID4gPiBKYW5pLg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IA0KPiANCj4g
PiA+IA0KPiBCdHcsIHRoZXJlIGlzIGFuIHVwZGF0ZWQgdmVyc2lvbiBvZiB0aGlzIHBhdGNoLi4g
dGhlIGRpZmYgaXMgDQo+IA0KPiArI2RlZmluZSBIQVNfUE1fUE1FX1NVUFBPUlQoeGUpIChHUkFQ
SElDU19WRVJ4MTAwKHhlKSA+PSAzNTAwKQ0KPiArYm9vbCB4ZV9wbV9wbWVfc3VwcG9ydGVkKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiArew0KPiArCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9f
cGNpX2Rldih4ZS0+ZHJtLmRldik7DQo+ICsNCj4gKwlpZiAoIUhBU19QTV9QTUVfU1VQUE9SVCh4
ZSkpDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKw0KPiArCWlmICghZGV2aWNlX21heV93YWtldXAo
JnBkZXYtPmRldikpDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKw0KPiArCXJldHVybiBwY2lfZGV2
X3J1bl93YWtlKHBkZXYpOw0KPiArfQ0KPiANCj4gQmVjYXVzZSBJIG5vdGljZWQgdGhhdCB3ZSBu
ZWVkIHRvIGNhbGwgInBjaV9kZXZfcnVuX3dha2UiIHRvIHNlZSB0aGUNCj4gaHcNCj4gcG9saWN5
IGFsc28gc3VwcG9ydHMgUE1FLiBkZXZpY2VfbWF5X3dha2V1cCgpIGNoZWNrIHRoZSBhbnkgdXNl
cg0KPiBjb250cm9sbGVkIGNoYW5nZXMgdG8gdGhlIHdha2V1cCBwb2xpY3kgdGhyb3VnaCBkZWJ1
Z2ZzLg0KPiBIQVNfUE1fUE1FX1NVUFBPUlQoKSBmb3IgdGhlIGJzcGVjLi4gd2hpY2ggaXMgbm90
IHJlYWxseSBuZWVkZWQgSQ0KPiB0aGluaw0KPiAtIHBjaV9kZXZfcnVuX3dha2UoKSBzaG91bGQg
aGFuZGxlIHRoYXQuIEJ1dCBhbnl3YXkgdGhpcyBnaXZlcyBhDQo+IGNsYXJpdHkgd2hlbiB0aGlz
IGZlYXR1cmUgd2FzIGludHJvZHVjZWQgYW5kIGlmIGFueSBvdGhlciBjb2RlDQo+IHZhcmlhdGlv
bnMgYXJlIHJlcXVpcmVkIGluIGZ1dHVyZS4NCj4gDQo+IEFsc28gbm90ZSwgcGNpX3RhcmdldF9z
dGF0ZSgpIGlzIGEgc3RhdGljIGZ1bmN0aW9uLiBCdXQgYW55d2F5DQo+IHBjaV9kZXZfcnVuX3dh
a2UoKSB1c2UgdGhhdCBpbnRlcm5hbGx5IHRvIHNlZSByZXR1cm4gaWYgUE1FIGlmDQo+IHN1cHBv
cnRlZC4NCj4gDQo+IFRyeWluZyB0byBzb2x2ZSB0d28gdGhpbmdzIGhlcmUuLg0KPiANCj4gMS4g
aWYgUE1FIGlzIHN1cHBvcnRlZCB3ZSBuZWVkIHRvIGF2b2lkIEhQRCBJUlEgcmVzZXRzIGR1cmlu
ZyB4ZSBJUlENCj4gcmVzZXRzIHdoaWNoIGlzIHBhcnQgb2YgdGhlIHN1c3BlbmQgcm91dGluZS4N
Cj4gDQo+IDIuIEF2b2lkIEhQRCBwb2xsaW5nDQo+IA0KPiBXZWxsLi4gSSB3YXNuJ3Qgc3VwZXIg
aGFwcHkgYWJvdXQgdGhpcyBpbnRlbF9ocGRfc2V0X3BtZV9jYXBhYmxlKCkNCj4gaW50ZXJmYWNl
LiBUaGUgYWx0ZXJuYXRpdmUgaXMgImtlZXBfSHBkIiBwbHVtYmVkIGluIHRvIHRoZSBJUlEgcmVz
ZXQNCj4gY2FsbHMgaW4gdGhlIHByZXZpb3VzIGl0ZXJhdGlvbiwgdG8gYXZvaWQgcmVzZXR0aW5n
IEhQRCBJUlFzIGZvciBQTUUuDQo+IA0KPiBTbyBmYXIgaW50ZWxfaHBkX2luaXQsIGludGVsX2hw
ZF9wb2xsX2VuYWJsZS9kaXNhYmxlIGFyZSBiZWluZyBjYWxsZWQNCj4gZnJvbSB4ZWRpc3BsYXkg
YW5kIGhhdmUgY29tbW9uIGltcGxlbWVudGF0aW9uIGZvciB4ZSBhbmQgaTkxNS4gVGhhdHMNCj4g
dGhlIHJlYXNvbiBJIGRpZG50IG1vdmUgdGhpcyB0byB0aGUgaW50ZWxfcGFyZW50IGludGVyZmFj
ZS4NCj4gDQo+IEFsc28gSSB3YW50ZWQgdG8ga2VlcCBhIHNpbmdsZSBwb2ludCBjaGVjayBmb3Ig
dGhlIHBtZV9jYXBhYmxpdHkgaW4NCj4geGVfcGNpX3J1bnRpbWVfc3VzcGVuZCgpIHNvIHRoYXQg
dGhlIHNvdXJjZSBvZiB0aGUgbG9naWMgZm9yIGF2b2lkaW5nDQo+IEhQRCBJUlEgcmVzZXRzIGFu
ZCBhdm9pZGluZyBIUEQgcG9sbGluZyBmcm9tIGEgc2luZ2xlIGNhbGwgdG8gY2hlY2sNCj4gcG1l
DQo+IGNhcGFiaWxpdHkgLSBhcyAvc3lzL2J1cy9wY2kvZGV2aWNlcy8wMDAwOjAwOjAyLjAvcG93
ZXIvd2FrZXVwIGNvdWxkDQo+IGFmZmVjdCB0aGUgd2FrZXVwIHBvbGljeS4NCj4gDQo+IEJSDQo+
IFZpbm9kIA0KDQo=
