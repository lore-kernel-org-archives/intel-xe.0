Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C0BC4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 09:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408A010E843;
	Tue, 21 Jul 2026 09:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnmRzs3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9876B10E815;
 Tue, 21 Jul 2026 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784624659; x=1816160659;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tc8+fhjyPKVNCfapdzStOD0NYJ2hEgTxNfj75rmF6mg=;
 b=AnmRzs3oHdXxKVIHSOd6OzNhLhkJbHtrhOqGOmFSQ6KBtbxpQpttgJXy
 QB3diFPerpaKKp8sZI+pXPF7tu9+KOzI6uIRktW8B9YBulL5EeiYLgLqt
 RWRnnx6uxBAqu9Kmoouy79NeckWkgudsPCvXSf+Eqqj01LCiZ03T9loLd
 Fu/bReEHJ49qrX0ULrQ8d8MSrEpss+nFmKiZydU5rkbi+S1+AE+xcwPel
 Z63NWNF+jHwOwPv13PodzcG29W72JM9uo/ewTe8zo5WLObHi/QSkVYemF
 jHLpg9bj4SjikoSpm4S/GsU07VAy1DjVzpZYtk8FbT3g6dXtsB2kf1e/x A==;
X-CSE-ConnectionGUID: 6+Qvs7JJSbCTRoyosI/MhQ==
X-CSE-MsgGUID: tVZkJ9quRTil3NwNsXYNkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85257361"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="85257361"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:04:18 -0700
X-CSE-ConnectionGUID: hEGEjGL/QYKWWtJTSVsJPg==
X-CSE-MsgGUID: a1deYwGkQ9WoIQDmEubcjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="257772991"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:04:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:04:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 02:04:17 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:04:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+bfkhbWCLeSpGM4eowYtr7fHp3knrOTPZW7g6YJpW4forOdP4i0gsa4YEcE6cKvGYU/gRCDvdrx+ixvu4vJHJqmmDGcoZf59oxvg+dA0LgvoVQXawui4ZeHXlCilWy6Foauvb0wmm25N2jsERzx2OAQK7GKxJWWCXBdKRTfxrTrhGRY5KvnxK2rWIxUj8C279v7ahYFbduJdPwGuGB4gouvX+Z+X2owvPSQ/+J0YoqfhdKqg+yZn1/KaDAtcAKP5WfaowAHABnCkwq+YDxGCMYW26AiZQ9fLdsQBxUzOQvQBvW3VfEqWXe0uL96iT3gVGBRDIDGOG885JavRH0KPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tc8+fhjyPKVNCfapdzStOD0NYJ2hEgTxNfj75rmF6mg=;
 b=EAGhJyorhA6X6bDarJiwFHQtyyWqH7sFiODf7vt5KZulHOesC/GlljHp4Fjpfj3uo3B/hCq021hFoyGwubqFUNJAm0bG3yDCw6T1SVOSEtqG6lpOHiQD2amxbE7hS3l1BlBe34DhJkglbd4jIEGpwxhdHx6/XDhT4E9j+VsnWRSMw/S3hC6T6OTHZKVECEVZEIPbx8R4fc0jIRa67n5cYgf2T0Ejv1L6W6NGk/YtKn3xA6KMJi7ZtEeEJuV0Ly9psT8EtUKlz9/40ppatOxLnGmwuWueM6oFDXHFdBe+SMayNt9GdkIdHe/lmiP4q0wp/uJb4YgUxr9h+fAQqTtdqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CHAPR11MB9654.namprd11.prod.outlook.com (2603:10b6:610:302::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 09:04:15 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 09:04:14 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 4/4] drm/i915/fbc: xe2_lpd+ no more surface size
 restrictions for FBC
Thread-Topic: [PATCH 4/4] drm/i915/fbc: xe2_lpd+ no more surface size
 restrictions for FBC
Thread-Index: AQHdFXb+trJAry2ALUikbh+hjcs2VLZ3tN6A
Date: Tue, 21 Jul 2026 09:04:14 +0000
Message-ID: <7d58d47642ea4b927eea13afb3f097ef52756a98.camel@intel.com>
References: <20260716225956.555995-1-vinod.govindapillai@intel.com>
 <20260716225956.555995-5-vinod.govindapillai@intel.com>
In-Reply-To: <20260716225956.555995-5-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CHAPR11MB9654:EE_
x-ms-office365-filtering-correlation-id: 8c57248a-1dbb-4436-c473-08dee70709c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|10070799003|376014|366016|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: mJBhdviNIf6RZArOBXKEU8cipOUs++m0rAS6j782sR7sFNr6pTausA05tRKfochGTbYhbS5DfpvCrvD/ZlV7IjjrLEO8NLxBqZCsIigoKKEbtDJi2gPOesmbndKQnt9EmfAD2B8cqGozFGRp18lQB1XvRn4WmWn4oITe28L0duE968jpEjYM7UB/NJXFZdOF22wTuVJmRTARBmimledN9QzlnRHNG5U86MMnaf0D4UoxRhc4fWP8YCFHypSH0dKz0g1RI4QDkuCNElfgcaJuXe5t0gVGz7F2HZc+U0uU3oAn60JJ/xozhEcxRCqVA99pVLsrtEuw2AExiwm++XE+f+nD/uHcEIsAk2nP9kZly8niSTTVrwJRMQpgz4PApm74aPENwaiSEh97vw63QvBKznP9wsYINjjhTGmW2C4jo73l3hlYSqFUmPtu3DfJTGRRj9sUkAzhI2dIWnzk5J9QzC1C5ja+TGOPyTE2mvbO8jDZ7zMN2E61kLB65XRA+KPVWmwkPGvPH9fTJurZzavLYsG7kpjmj3nQfh49XP5FDBW1lL+8y8REbvdr2TJDPhFOfF+CIu7dI4pbWUY9+1oCZMCOs8GahR9cAXaPELVdGLYm9wQhKL28iTpwKaGwFgeWjJZ/4lfFpBIfVnAmpyH3ezHY71UMsdsMKKX13yAP6ZIIY5nzQ4vvmTTWa79hBksUIDV7zZ5nbVlruubBn8fuB9dlnwpFfa9f01OydDxyI/U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WllHY2FyaHAxSnRZVFFFenNKVG1Ic21wYVJIWCtsdWthR0V6aGI5ZklUZ3Qz?=
 =?utf-8?B?Ty8wK1dsYlhReDBmaENJQS85djlENU5TUkZMc2JhZVVDcHdlV1R5aFpNcXYr?=
 =?utf-8?B?dnB1OGhMcE1INjhKMCtyNjRMYzBrNy9NRUN1V3ZPUFZwUFQwaGpxQmU4N01m?=
 =?utf-8?B?NXYrTHF0L3JMa1FqdjlLMXpiK29OdzcvUkE2Y1hKanh1SVZjbm11ZXNldUVO?=
 =?utf-8?B?azdLS24rS0dDWFFhSTNDanF3VUp5Mkd2WUc5SGdzTytWZVByMHlHaUY3RjlK?=
 =?utf-8?B?dTk5aVI0SXFBRWhnT3RqbTFpTnFFWEdmSHl3OVFDRW9xQTlMWFJXaDJYWWtm?=
 =?utf-8?B?S3UwZEJYaW1WRzJEQnBlMlBrUGhKMWxITUFhZWJZR2F3WWpsRHFvT3E4WTFz?=
 =?utf-8?B?Mmx4Ykc0SHh3LzhsSTF3WXhYM0ZaUHM4U3Z0am1adUZOZzF6SGxsbWNoYkg4?=
 =?utf-8?B?Y0MraUNWREd6anVBQzZvNXUyMU1mVlMvT3hEcU5SSmxGSWNLcEJpMkd1ZDFv?=
 =?utf-8?B?OUwzUFNrMEVVNmJaUVBoTWs3YUtTdXd6cUd3RU1COUYwZ3Z2Mnd1WjFtVFI4?=
 =?utf-8?B?Tks5V1hLa2RxaW5Tdy9zSlMrZmtIOWxzZEFScGdQbVhpVGtyNEQ1c1BPU21X?=
 =?utf-8?B?aUhhbi9wWU0rK0p3YnNkSWEyZ3dGWVBDdEtDMklWYUdUY2wyM3B5d3Q0czY0?=
 =?utf-8?B?TllNcVdScStLWVhxTFhXK09rUWt4Yy95Y2Rpb0pDZzIwQnVUWkJqaEtIaGVB?=
 =?utf-8?B?ZEFjU3lvMUh6Mndjb0hodkhUZGVhRGJVa3AyQS9OU0R0K3RmR0dqdmdwOXh0?=
 =?utf-8?B?YzhyR1p3MU1OVlMrMyttYURJOVJqeEFBOUYxVHFMb0JZeTc1VHF6L2dmQ3Jo?=
 =?utf-8?B?cWIzOVJuQjFtM2hvVWg5MExPSG1aUTNqZ0hhMFVmRnA2alhIc1JmZzdydTRy?=
 =?utf-8?B?ellkQk9teERZYTdINktOb1dLWklOaExmdFpGOG94dW9yNktzYWQ1U1Z0dmFs?=
 =?utf-8?B?QW5iZWlwTnVVOFYxL2VoR3NGeldiZHFvdjVPOC81RTBCRW9JVEFNRk8vTVl2?=
 =?utf-8?B?S0VYN05VcFdVTlhiM2g1eFl4R0VoY0ZocVU2SGY5YkQyQkl6R1dsck8xcEFa?=
 =?utf-8?B?c04wYk1JanlENncxVjZOSGt3cldrRTdZZTFLN0l3ejNjTXg4SWVVNldiVEVF?=
 =?utf-8?B?TXU5cktKNG5zem11SUQwa0haRjZhTmo1T29FL3ZQdDZWVnEzbjZBMFFnYnU1?=
 =?utf-8?B?a21Vb3pJWndFS2lRK3N1UDZxVDNsNzc3NnBDV1ZMVUs1RGZuK0VEOG9qUzJh?=
 =?utf-8?B?d3d2Vk9LMG4yei9pUW9nNlpTZWJDRERDUzJFOVVBeGpDOTlSRzZZcjVFUDVC?=
 =?utf-8?B?UUlyL29yOElMNGhxMHprNjBaOTJXaHlNeDR3UzlURndMT0tLajNiT0h2VmU4?=
 =?utf-8?B?VVlLNm1HcUJuQTJORTNjM3ZaTldISEQ1SHdIUGJ6MSs3Q2ZEM0NJVEpuQXhn?=
 =?utf-8?B?SWZnWE54Z05DMHB3d2gzeVFwZmNhTXZQakdoTHVjUUVmbTRhSlBoS3lIZndm?=
 =?utf-8?B?V25BRnlCa2NmSVpOc2d4aGJ5dzg2R3ljdVk4UnB0ZFQ0RWN4bEFnd1dCVlN4?=
 =?utf-8?B?T0JJK3c0OVV4YnF4YUw0K1RmOXBBY2ZJUjErN3VrU2p1djBXbzFLeDB2VG1t?=
 =?utf-8?B?NytjeG5IU1hMMGRLY0duTENTT3BjVUJlRU9hQkVZYklqSjZkZEhXOSt3ZHJF?=
 =?utf-8?B?c3BZZXVKMWRSaDg3Ym1KWDJzZjY5N1pmckVhNkNXV3JBWmMrV2JTQjAyMTNV?=
 =?utf-8?B?YUhvUlpTTkMrVnNQQVpORlRzSjdobnlPendRRmpuZEFyRmFjb1Y0SjBLd1NM?=
 =?utf-8?B?eHZMTWt6bk1TS290OFhjNzh5eE81R2Y4OEJ5bUQ1QldTY00yTW1CWDF4R1hQ?=
 =?utf-8?B?d2w2OW1Ha2MrTUgvbXhjSzFMZW1FQU9aZm9YdXk0dG5ZbFA4NGJwZjlpTG42?=
 =?utf-8?B?eXk1NWhXMGVuUzRWQ09raTllUnFteTdEb0M0V0xxLzg5Zit2MEVRYlFuL2Fi?=
 =?utf-8?B?cmZDY2FVYlRZWklNclRuYUNzRnlNWGpWZHFJMEQyOWJ6WUtjL0VldlFxZlVT?=
 =?utf-8?B?Mk0vM1ZRb255VDBoS1VJWG5kSmVTVU0yTFlDRExwMFRVekN2cUVaUjlDMkgw?=
 =?utf-8?B?a1BiYUs3MGM4NVY0S054bTBZYmI5WERtV2M3SWN0eVFUbkp3a2k5UGVxWFRm?=
 =?utf-8?B?Kyt0NjlIdVRsNGRqU1F1TWkwT1Zac3NMdWc2ZzV6SmtYVEQzSTA1dW5mMWpU?=
 =?utf-8?B?NTdlYnBpT1o2V0lhN3FEZVE2WEl0UWdHYTVLVFg0ZWpYNk4zb3Z1QytYSk5o?=
 =?utf-8?Q?Bf5QcnRPObMTOWF8fiRIAk8SkYHEFfMMm05tOJgkJBq41?=
x-ms-exchange-antispam-messagedata-1: tr5r8+OYIkxOf7gNjIfa02QZRbwPAwu1b3g=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C39F9666D50C7640AEA179F36570353D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XbNtO5bHfPoZGu/YaNSEJQvvhYLq4vJPt1ns/yzD3OYG6C/fZ81X3rfFW97LtcbwGTB2GeefmLvT3/E9wwkVcXDFLjMBHUjwOS9IywS2JbtAPIeCF/fIxWArdRqb5973GEDH7GkZc2W+rk9LUGyy97+5kKztSJwXubr+qgSVbpHSqOZOAwtx6OEp1yOGOhct6ys7JnJYBYQ30g7uvSU3liEhEbbBtpeBfh5TLJMKwugxp5T1ANDGx+zWvcPnpW8GItxkBgFzyi7npvyzAES7fSZUWKUFm21Q7IAUbX5Sw5SE68xyw3bMpQ5YVdipoTJF0Z90vDHcC+/GXpOCIlEbgg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c57248a-1dbb-4436-c473-08dee70709c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 09:04:14.7082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3BaXhK7btoJXoCwnQClfm4/WKYywSg4OfNzeNg2m+6y4Km4Sb07j7zrM6vTRZSC7c+AGKh9OgLpTc6FefVfedvE/0LSjiZl3C8xwHJb+QA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9654
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

T24gRnJpLCAyMDI2LTA3LTE3IGF0IDAxOjU5ICswMzAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBGcm9tIHhlMl9scGQrIHBsYXRmb3JtcywgZW5hYmxpbmcgRkJDIGRvIG5vdCBkZXBl
bmQgb24gdGhlDQo+IHN1cmZhY2Ugc2l6ZS4gU28gcmVtb3ZlIGl0Lg0KDQpIZXJlIGFsc28gZGlz
cGxheSB2ZXJzaW9uIGlzIG1vcmUgY2xlYXIuIEkgdGhpbmsgaXQgaXMgdXAgdG8geW91IGlmIHlv
dQ0Kd2FudCB0byBjaGFuZ2U6DQoNClJldmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5p
LmhvZ2FuZGVyQGludGVsLmNvbT4NCg0KPiANCj4gQnNwZWM6IDY5NTYwDQo+IFNpZ25lZC1vZmYt
Ynk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0K
PiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jIHwgMyAr
KysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMNCj4gaW5kZXggMjBmMDJlZjkzODdhLi5k
Zjg0NDY0NTcyNDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZmJjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9m
YmMuYw0KPiBAQCAtMTMwNiw2ICsxMzA2LDkgQEAgc3RhdGljIGJvb2wgaW50ZWxfZmJjX3N1cmZh
Y2Vfc2l6ZV9vayhjb25zdA0KPiBzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXQN
Cj4gwqAJc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPQ0KPiB0b19pbnRlbF9kaXNwbGF5
KHBsYW5lX3N0YXRlKTsNCj4gwqAJdW5zaWduZWQgaW50IGVmZmVjdGl2ZV93LCBlZmZlY3RpdmVf
aCwgbWF4X3csIG1heF9oOw0KPiDCoA0KPiArCWlmIChESVNQTEFZX1ZFUihkaXNwbGF5KSA+PSAy
MCkNCj4gKwkJcmV0dXJuIHRydWU7DQo+ICsNCj4gwqAJaW50ZWxfZmJjX21heF9zdXJmYWNlX3Np
emUoZGlzcGxheSwgJm1heF93LCAmbWF4X2gpOw0KPiDCoA0KPiDCoAllZmZlY3RpdmVfdyA9IHBs
YW5lX3N0YXRlLT52aWV3LmNvbG9yX3BsYW5lWzBdLnggKw0KDQo=
