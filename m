Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A55F45A1D
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 05:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F47510E18C;
	Sat, 11 Apr 2026 05:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGfIxGd5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83DB10E18C
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 05:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775885856; x=1807421856;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TONtE6E6UJb5LAVnyZJ8PBy/HqbeFM5pI1xv5tMkv8M=;
 b=bGfIxGd50WKuIeeVTyqMT+YzWxMYBdVM22PxyEuWUnBOcfEVKWIXJDVR
 6J8bmDzET/+uPofQ3eulOoqYRemzypWuH3p5vuSxQLjdv8AGkxwKtexFW
 RbcukUUSeIQBGiRmvI6a5UZtWk77KfKsDQ02bLJj05/6tWZf5RqUashZ/
 H+Dhn7Qo91FVpNpWuAnxMdA7vN2RqMjhj49O4d+tcrKkbrwD+eGMalA7i
 9MjQCf3knVZrYbLkiqtLZQDFa7FfHcKYCHgWoTGFgAXuE9ZOPFv773v21
 pu12vxdkyHBd2pGFJiHsgok4jS+z0Mcq/7GUwSAm+ii0jS7cypZ6zmo0x w==;
X-CSE-ConnectionGUID: B9OOyytQSSiYbJz71sJ3OA==
X-CSE-MsgGUID: dLgxGuGyQ4ayo/3XfTVTfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="77016760"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="77016760"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 22:37:35 -0700
X-CSE-ConnectionGUID: MznN70hhSIi1qon1w5ZGwA==
X-CSE-MsgGUID: sY2/FEo4TQOutGc6vDtUxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="229549285"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 22:37:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 22:37:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 22:37:34 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 22:37:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUdQnJedTmr3mGv4dtRkXcQpxVqR0f6MK7mTJXW7dBMU7Bzg0TkFbNunAJbvoraFRx4E9orW8FVAfUevxw6c2zbvDXrH8K9DV9cS1XM34TUtkm4hElRtp/ndOV/ZrDbbdShS80MhPFNMC74VV8bSSEGwdWyQUKIOA5GE9kyEzI/BMvIX8/d5ZNJX5BPoC9uTNKgim+/dgnB6atlXq1Bb1cjsLvsWHbd0T5b3U1wbxs0TO/uh848qXrI0PvqjhR5bf+xcmjE173arISDE1z2fIhsuwHJuZ3hC8idwf8RqBXe65tEun3NoMvG86xYJZe+OxJy7Ja+GrPgvQnjwb+fORA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TONtE6E6UJb5LAVnyZJ8PBy/HqbeFM5pI1xv5tMkv8M=;
 b=SZOYwU9Al96gV2fciCjOj2qvEsjUHnCx6BT3/4gHmLFAOaivroSnGFDq6J1/+mFk3lzLrIywANPCzSfaugB3d50YK5Mg2uAN4a9GuiesZcKZ42oB9PZ/zvJKThQhd0eBCAoxccvjoB46S4hEhCnsPVlm8AvdExUih9CZ+jFHaNYwWRn16VksDAB8pBJYQ1Ui2IZos5jAXB9TG/ZBguugkN4H7d2x/q0zpdjYFqPXH4wKt7DljPPnOjrdAnEH+hmRfjXDDMIG7tlURNxdML2qqi1HS/LRFZfZUuu3thjjxnrl125AaZLNGUPcnWMDJkxLHDzrWnCKImCsoaYIcrel5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SA1PR11MB8809.namprd11.prod.outlook.com (2603:10b6:806:46a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Sat, 11 Apr
 2026 05:37:22 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9791.032; Sat, 11 Apr 2026
 05:37:21 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH v2 3/4] drm/xe: Fix kernel-doc comment syntax issues in
 header files
Thread-Topic: [PATCH v2 3/4] drm/xe: Fix kernel-doc comment syntax issues in
 header files
Thread-Index: AQHcxgTq2kk1w0VYt0a3TlRpKAutjbXZXbIQ
Date: Sat, 11 Apr 2026 05:37:21 +0000
Message-ID: <SA1PR11MB8839270174C6470768F3FA38AA262@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260406203122.3392365-1-shuicheng.lin@intel.com>
 <20260406203122.3392365-4-shuicheng.lin@intel.com>
In-Reply-To: <20260406203122.3392365-4-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SA1PR11MB8809:EE_
x-ms-office365-filtering-correlation-id: a11b7950-e18d-469e-11e3-08de978c6764
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: BzFMfb54AwuaE1XexBjjhzZpTRIcNmRFs5sMthFZM3v1XkSXQrOZOVLKXm2Uz8Rwo+/W5O+zTgsskhXkA6SoHwlCfR5/h2NThAgqAj0wGaJLsq7FkgG0ehaRHgvybnrJCurrc1ccf6xVnDBaJp6acmdjWPBzauHjA716pfteBo54pgTR9YJDiYXHbSK051uR296U4F8nd5yxjemetI65b7VWh98dnzC3O1tDiUTCKnuXSDnKxRMusNV0Tcm0HdQ0a1e9GAaPzoZTa1gc40IryMNM7Cd/JviL4CEe20j/xsP2RTCKiaQKBFVQIDgAwclPkLcBrtAF+CSq2b6bdYcJW8gqCvyj1ai7WSQ1eRN7Z0PhOprPBr1O0FWWzr1QMPYv1aQNSCicH4dUXRDDZ0SbcJ/ktGxvjOWvjr4X8KmgAdAk+qACPgrRAXsOHAjBShdwdCrILWAIIKhb9bhkLFGCGbadAqfc1P5loW7CIBqTWYDfds3pJoNZmmehZlfDOK/RyZ+Sp6VL+8+q1GAITJQHoG3M5GOiAkRq7PwW/03YtemFmCZmSFfsvoGL3MBRAbVThHNIexcbPn/UmP/DEwBeOFcg5anU2iGh1rwQKQLChlSEtg6BeVxemsX5r+Dnlxlq0CVVgDY9mdM8sdl8z6AB576MVrb/x9boAv6J1Nv6QU6GCNdEI43ly3399IEGXo1/kwOAUT9wGasf0aUXjlQ6yyrVqe9DYxa3FvXpimsRrj6MXFqc8lZ/3N0J5l8E2VGv9pjCnJGEJtiRFGp7+TNF+KmDANR6HxNXB9/wCeH2hBw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmNJazIwaEk3U3FXSFB4VzRvOVFtaHVEN3FLby9oSlNxUTNJNTY1SE9sbTQy?=
 =?utf-8?B?REZiTXVSQVAyU3I3T1Q0MkFWcFNNVUgwbVBpZ1RGdWxLdjZpY0RWQW5ZM1BR?=
 =?utf-8?B?aDMvK25qVGZVMGtFZ0RiREdUZFVOdm1FM1AyLzVUZ0VlYUxmaDBhaFJTR2Nm?=
 =?utf-8?B?eXFMcGgvbzZjVGJKWTNSaE9jTjdiaEtLVnRjeHFBVHcybzMyN3ZEVWJJTWRK?=
 =?utf-8?B?SUxZemkwZi9pdERXSEJ5WEUrWGk0ZUVla2pUT3RvbG13TmFLUThpVUsrSDV4?=
 =?utf-8?B?emtlSnU3bXlFSkhXcmZwL1lEcTkzVndnOStKM3ZXQkhVVEVtYXpRWW5idnF2?=
 =?utf-8?B?a2NWQ3lCREVEYnRWZ3ozMm5IaDFyQzVhQm1tY1AyYmhrekZZZDF2R1Bqc3ps?=
 =?utf-8?B?aTRxa3Z2N0Z2VGF3TjJuMzhLODUyMjJxZVQ0ckpEb1JwRkVsczZodEoweEFQ?=
 =?utf-8?B?WEdFZm1SMGx1Y0ZaeHR6WGllZlJ3ZzYzeDM5NUNaazFXb0pBRVVtRjdWVVRY?=
 =?utf-8?B?TnkyWGFBUnFtR0xVV1hJcE96U3JoczdkWFphaHZsT1JUOFdVTWNsZmx5cTFS?=
 =?utf-8?B?RGJhNWhraGQzQUM3ZVRYSFJjaXJXalI2RFdmZzJTMDRtTVZaYk9SbUFiaEov?=
 =?utf-8?B?aEVCcStqRjRqbzNaNHNwOVczSzhiNzlhTjErcVF3bEVLYnR4K3dKTzBHN2Iz?=
 =?utf-8?B?MXkzVzhNR2tvK1hoY1BSY3BDNVVZQytNQnBvNHlPUC9QWWhJSGNWS2hrNWJM?=
 =?utf-8?B?cjNDNURHeTlWcXg5N0tRQkRPSTAzcmxlV0x6Qmc2MTNFckZ4RWNLZ3lFTVA4?=
 =?utf-8?B?eWQ0TndTZ0x1SFh5OU5sOFRacFQ3aGlyYmMrL1ZLTm9XVUFMQmlrZDF0VnVX?=
 =?utf-8?B?NlFvdGZWeVV2b1ExZVFlcFJEdEtqZys3dkNrSjY3TG00QmcyK3hvUUFTd1RH?=
 =?utf-8?B?bDZpYVljQmFuTWpMdUhVOW5IMW4xT1ZGZE1Mc00wTndaVk1QREZKSG1BUWdq?=
 =?utf-8?B?dk0xSDhlNTRwOEs1KzQyMWtwdFhybitXb2NZQWdYdUVuWXNXcVpWTlRsbVI1?=
 =?utf-8?B?ckFtWFQrWktVWjU3WVFLdGgvdGFrMFc0M1JxaloxOVpqeitJNXZBbVNLRVQ4?=
 =?utf-8?B?ZnNvaGRxdFRLVWN5WVRsQ2dlUXp1a1JNaCtveHVXSzZqa3pDNW9Wdk00MW1B?=
 =?utf-8?B?UmFXSW5ZWUNVQzVjUzI0b3lRcnNzNEhIT2ZYa3ZmbmkyUGZGYUJHSmh0OFc2?=
 =?utf-8?B?UHNkQS9LWlEvSmVsbDRKTzlUU1ZtaXNsT1dIdmtJTkl1Z3gvUDBpd0VzVEdG?=
 =?utf-8?B?NUNtSHpISDhvdTg1dlBwdVlra1pCZ1hkTnV0QWVMZm5HRmpmOWJscW5Odkhl?=
 =?utf-8?B?cExqNG93YWpiRXFEZWQ0OTJIRE9ZcjdWVGlnUFExWHJUSkVDZFZxQXJrNlFU?=
 =?utf-8?B?cUlIdzhlQklRMEFIWmlqdjJ4b1NscFB4eHR1VTFoMzMrUXlzbHBWc2FmRE5B?=
 =?utf-8?B?NEdlc1UvaUtmalFKbVh2cFYzdmhBWENycVkxMkIrYXo4MDg0a3dBUDFLVHN0?=
 =?utf-8?B?UXNuRWY2dkZNNkVLRXJ6aGM3Y2QyeTU5a2c5WHVya2ZjYiswc3pVUmZYVGhZ?=
 =?utf-8?B?UytRVUxJR05KTnlPSUpMTnBUMWxrSE15SGdCLzhtb0Y3RFQyZGVWNzQxYlZN?=
 =?utf-8?B?Q0lqRXZldXIxWnI0M3gxb3hqeTA0RUNmcW5LUHQ4Q0t0ZnlPMi9YOWdCM0M0?=
 =?utf-8?B?dFVNNDFXSUg2L2pKRW9RUG9VYVdleDgvREJLNnBGZE51Q1lJK1ZObnd6UCtj?=
 =?utf-8?B?ZDJaODVnajhTUVgxak1iVG5JK2F4M1JKbDQyaStOcVIxTSt6bDl6YnIyRWtv?=
 =?utf-8?B?d2wxZjZsVDQ4UGNBTmxVK1hFMy9VTWdoSkVBdXZHRUFyR1d5NFFVeTU3R3NU?=
 =?utf-8?B?SzdyQ3ZORzdHOVFYZDV4N1NaSlJSQTV3ZitJQkdHS1JVUFVjRm5lUmczMkdq?=
 =?utf-8?B?cmtEWU9wVklLS0VpMmh4UWUzaHkxbkdqUHpKakhBVCt3Q3BqcXoydjRXNU1u?=
 =?utf-8?B?SHZjZzN2SEM2TmtuVm9SbjNqS29kTkgxaDdZWmtWRFVhaHZUZ0NYWitzTGhH?=
 =?utf-8?B?T0V0cm9PZXU5TjRCUFVGZkVicU5FZVh6SjhNTDBaZnRhRzNoeGYvdXQ0NHY4?=
 =?utf-8?B?dURjSXpVYkc2aVpsaG40eExmTEVKZFFjM2dCSzQ4K1l6Q1lybjNLQmxXMnQ2?=
 =?utf-8?B?TGVZVkdEbkhyL08wRmRvZFYybGV4dzFXVHdzZDlBZi9Oekl3bVBlb3d6Rm90?=
 =?utf-8?B?ZEFZdm1rODh2dVNXS2lFR2ZhdGlrL1ZQbHF1Um1lSURCdHJrUGdRZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dEtfhHqbazhW+teyq+NItVf3ODvOoNuxsUl7UBAAQoINY9ykgI+tGbipCKNWl5xk270q0h2cBMUFsCwgyySeMIzDFSFSqQxib9CbkBGAn76KM2pDCbKacINBCME8Ghu4MG16hCWe55xeihwYA/XYr+6Zi77vTjNUKBC0P9+FBnSSkfOtzLHb3QaQdVcvaeEtRwbY2435aretOiACRbK0Apx9QYMueUpe9aqINM1axMLcmpHF+PZdEOSKE56OEE1YZ57F+arrjJzyDYgT+iyj9W2Qsg7zmX50cQFJI7GVLdXdGDiD079Uuh+wtNMF9HrLor6ufAQKFKnmO9T1mp/N5A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11b7950-e18d-469e-11e3-08de978c6764
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2026 05:37:21.8625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhMNfExTHy5L7V31MetCwc1BchnjUnZqXc2c/8HhlLP5N1ckraG50P4YG1JM6J8Sv/GOI47eD23Io4+kaF1sFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8809
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

T24gTW9uZGF5LCBBcHJpbCA2LCAyMDI2IDE6MzEgUE0sIFNodWljaGVuZyBMaW4gd3JvdGU6DQo+
IEZpeCBkb2MgY29tbWVudCBmb3JtYXR0aW5nIHRoYXQgZG9lcyBub3QgY29uZm9ybSB0byBrZXJu
ZWwtZG9jIHN5bnRheA0KPiBydWxlczoNCj4gDQo+IC0geGVfZ3VjX3JlbGF5X3R5cGVzLmg6IEFk
ZCBtaXNzaW5nIHNwYWNlIGFmdGVyICcvKionIGluIG1lbWJlciBkb2MNCj4gICBjb21tZW50ICgv
KipAbG9jayAtPiAvKiogQGxvY2spDQo+IC0geGVfb2FfdHlwZXMuaDogRml4IHN0cnVjdCBkb2N1
bWVudGF0aW9uIHRvIHVzZSBwcm9wZXIga2VybmVsLWRvYw0KPiAgIGZvcm1hdCAoLyoqIEB4ZV9v
YV9idWZmZXI6IC0+IC8qKiBzdHJ1Y3QgeGVfb2FfYnVmZmVyIC0pDQo+IC0geGVfcGFnZWZhdWx0
X3R5cGVzLmg6IFVzZSBkYXNoIGluc3RlYWQgb2YgY29sb24gYXMgc2VwYXJhdG9yIGluDQo+ICAg
c3RydWN0IGRvYyAoc3RydWN0IHhlX3BhZ2VmYXVsdF9xdWV1ZTogLT4gc3RydWN0IHhlX3BhZ2Vm
YXVsdF9xdWV1ZSAtKQ0KPiAtIHhlX3B0X3dhbGsuaDogVXNlIGRhc2ggaW5zdGVhZCBvZiBjb2xv
biBhcyBzZXBhcmF0b3IgaW4gZnVuY3Rpb24NCj4gICBkb2NzICh4ZV9wdF9udW1fZW50cmllczog
LT4geGVfcHRfbnVtX2VudHJpZXMgLSwNCj4gICB4ZV9wdF9vZmZzZXQ6IC0+IHhlX3B0X29mZnNl
dCAtKQ0KPiANCj4gQXNzaXN0ZWQtYnk6IEdpdEh1YiBDb3BpbG90OmNsYXVkZS1zb25uZXQtNC42
DQo+IFNpZ25lZC1vZmYtYnk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29t
Pg0KDQpSZXZpZXdlZC1ieTogQnJpYW4gTmd1eWVuIDxicmlhbjMubmd1eWVuQGludGVsLmNvbT4N
Cg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcmVsYXlfdHlwZXMuaCB8IDIg
Ky0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9vYV90eXBlcy5oICAgICAgICB8IDQgKysrLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdF90eXBlcy5oIHwgMiArLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3B0X3dhbGsuaCAgICAgICAgIHwgNCArKy0tDQo+ICA0IGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3JlbGF5X3R5cGVzLmggYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3JlbGF5X3R5cGVzLmgNCj4gaW5kZXggMjBlZWUxMDg1NmIyLi5iOTlh
NjY4NjQxNmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcmVsYXlf
dHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3JlbGF5X3R5cGVzLmgN
Cj4gQEAgLTE1LDcgKzE1LDcgQEANCj4gICAqIHN0cnVjdCB4ZV9ndWNfcmVsYXkgLSBEYXRhIHVz
ZWQgYnkgdGhlIFZGLVBGIFJlbGF5IENvbW11bmljYXRpb24gb3ZlciBHdUMuDQo+ICAgKi8NCj4g
IHN0cnVjdCB4ZV9ndWNfcmVsYXkgew0KPiAtCS8qKkBsb2NrOiBwcm90ZWN0cyBhbGwgaW50ZXJu
YWwgZGF0YS4gKi8NCj4gKwkvKiogQGxvY2s6IHByb3RlY3RzIGFsbCBpbnRlcm5hbCBkYXRhLiAq
Lw0KPiAgCXNwaW5sb2NrX3QgbG9jazsNCj4gDQo+ICAJLyoqIEB3b3JrZXI6IGRpc3BhdGNoZXMg
aW5jb21pbmcgYWN0aW9uIG1lc3NhZ2VzLiAqLw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX29hX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfb2FfdHlwZXMuaA0K
PiBpbmRleCBhY2Q3OGJjMTQ4MjIuLjBjNDhjMWUwYzJjNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX29hX3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X29hX3R5cGVzLmgNCj4gQEAgLTE1NCw3ICsxNTQsOSBAQCBzdHJ1Y3QgeGVfb2Egew0KPiAgCXUx
NiBvYV91bml0X2lkczsNCj4gIH07DQo+IA0KPiAtLyoqIEB4ZV9vYV9idWZmZXI6IFN0YXRlIG9m
IHRoZSBzdHJlYW0gT0EgYnVmZmVyICovDQo+ICsvKioNCj4gKyAqIHN0cnVjdCB4ZV9vYV9idWZm
ZXIgLSBTdGF0ZSBvZiB0aGUgc3RyZWFtIE9BIGJ1ZmZlcg0KPiArICovDQo+ICBzdHJ1Y3QgeGVf
b2FfYnVmZmVyIHsNCj4gIAkvKiogQGZvcm1hdDogZGF0YSBmb3JtYXQgKi8NCj4gIAljb25zdCBz
dHJ1Y3QgeGVfb2FfZm9ybWF0ICpmb3JtYXQ7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfcGFnZWZhdWx0X3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGFnZWZh
dWx0X3R5cGVzLmgNCj4gaW5kZXggYWEzY2ZhZTAxYjljLi5jNGVlNjI1YjkzZGQgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHRfdHlwZXMuaA0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcGFnZWZhdWx0X3R5cGVzLmgNCj4gQEAgLTExMiw3ICsxMTIs
NyBAQCBzdHJ1Y3QgeGVfcGFnZWZhdWx0IHsNCj4gIH07DQo+IA0KPiAgLyoqDQo+IC0gKiBzdHJ1
Y3QgeGVfcGFnZWZhdWx0X3F1ZXVlOiBYZSBwYWdlZmF1bHQgcXVldWUgKGNvbnN1bWVyKQ0KPiAr
ICogc3RydWN0IHhlX3BhZ2VmYXVsdF9xdWV1ZSAtIFhlIHBhZ2VmYXVsdCBxdWV1ZSAoY29uc3Vt
ZXIpDQo+ICAgKg0KPiAgICogVXNlZCB0byBjYXB0dXJlIGFsbCBkZXZpY2UgcGFnZSBmYXVsdHMg
Zm9yIGRlZmVycmVkIHByb2Nlc3NpbmcuIFNpemUgdGhpcw0KPiAgICogcXVldWUgdG8gYWJzb3Ji
IHRoZSBkZXZpY2XigJlzIHdvcnN0LWNhc2UgbnVtYmVyIG9mIG91dHN0YW5kaW5nIGZhdWx0cy4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdF93YWxrLmggYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcHRfd2Fsay5oDQo+IGluZGV4IDA3YzhmNDA5ZjIzNi4uZGNlZGZjOWEy
OGRmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHRfd2Fsay5oDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdF93YWxrLmgNCj4gQEAgLTExMSw3ICsxMTEsNyBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgeGVfcHRfY292ZXJzKHU2NCBhZGRyLCB1NjQgZW5kLCB1bnNp
Z25lZCBpbnQgbGV2ZWwsDQo+ICB9DQo+IA0KPiAgLyoqDQo+IC0gKiB4ZV9wdF9udW1fZW50cmll
czogTnVtYmVyIG9mIHBhZ2UtdGFibGUgZW50cmllcyBvZiBhIGdpdmVuIHJhbmdlIGF0IHRoaXMN
Cj4gKyAqIHhlX3B0X251bV9lbnRyaWVzIC0gTnVtYmVyIG9mIHBhZ2UtdGFibGUgZW50cmllcyBv
ZiBhIGdpdmVuIHJhbmdlIGF0IHRoaXMNCj4gICAqIGxldmVsDQo+ICAgKiBAYWRkcjogU3RhcnQg
YWRkcmVzcy4NCj4gICAqIEBlbmQ6IEVuZCBhZGRyZXNzLg0KPiBAQCAtMTMyLDcgKzEzMiw3IEBA
IHhlX3B0X251bV9lbnRyaWVzKHU2NCBhZGRyLCB1NjQgZW5kLCB1bnNpZ25lZCBpbnQgbGV2ZWws
DQo+ICB9DQo+IA0KPiAgLyoqDQo+IC0gKiB4ZV9wdF9vZmZzZXQ6IE9mZnNldCBvZiB0aGUgcGFn
ZS10YWJsZSBlbnRyeSBmb3IgYSBnaXZlbiBhZGRyZXNzLg0KPiArICogeGVfcHRfb2Zmc2V0IC0g
T2Zmc2V0IG9mIHRoZSBwYWdlLXRhYmxlIGVudHJ5IGZvciBhIGdpdmVuIGFkZHJlc3MuDQo+ICAg
KiBAYWRkcjogVGhlIGFkZHJlc3MuDQo+ICAgKiBAbGV2ZWw6IFBhZ2UgdGFibGUgbGV2ZWwuDQo+
ICAgKiBAd2FsazogV2FsayBpbmZvLg0KPiAtLQ0KPiAyLjQzLjANCg0K
