Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC811C2BD09
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 16:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FAB10E0AD;
	Wed,  3 Jul 2024 16:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbTJaU+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B057C10E129
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jul 2024 16:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720023171; x=1751559171;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ShxR5l4H8nVnQqBC5rSUGMYye1imuNSk/5a/hAbSnj4=;
 b=HbTJaU+culSdbfz3fK8jD8UcjyJxHdp4MZx1lGpRkZU3tVaKT7O5F24L
 LHFA1v6H+qleocn3g/3/RDMM4Q+LjCM6on+0jagQZFR5srxmlQSGib167
 uaWNDibY+xRSKQAxZoj8mEzr91zqW5hejbBGSbXYSmsJCoscZLL33UShW
 uHHemHfJvg3m8NK71n+Qn1q6rmRgY/K+Q24/jHvTUffaSDiWkBls1KkaF
 Lccj0Cq6e3tJL6Doq7ltxZyQtcGd4t+/biIR0wL4YQYmeWtCvYR9uiv1a
 eiQ0QS5hAfP/5WbWSsiIeWqopB6dS7J065qbS4P7AdZiB+Qd12NRTgZJ+ g==;
X-CSE-ConnectionGUID: w8YUKNraRfyrt++fTKGziw==
X-CSE-MsgGUID: Im1V+QvBToSAXflRX1hPWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="39780460"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="39780460"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 09:12:51 -0700
X-CSE-ConnectionGUID: QWxiw/73TUGkopYv4BCoBg==
X-CSE-MsgGUID: kHv/SV8tS9SK3NHiejRA3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46379887"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 09:12:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 09:12:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 09:12:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 09:12:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHe2+F6YRlcVJCO9P0+Mzty0md4vFD1oRWbhg6Sfbr6+3XaWfXNKe9fLZuK1fiS0OXvoqJj9YP7T6++08eb3ef6BjawoVd1+06NW0ZVpdo738qK0R9BugpeE1IdBm5wGL6wNibbuUdhIW35/yuz4Fp+X+4k7yL0YPIBbTtEC+erSunvM4ewNZcuwYpDK1zIactKRYR+nKYJoEoYWX1IbIIGCWhhZI4quVErtszcGh2VLoO/9A419Iw4z2k+Q4okrmYoQSd0hi5eizWtAuKMaEuXP9ugEI4wmux8WVhuSTUv7P/X5Oo+mvyPVihR7+Gm6dnTHq1xTkhW0alx+FwPcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShxR5l4H8nVnQqBC5rSUGMYye1imuNSk/5a/hAbSnj4=;
 b=kUqUUv0OS4dbEdKvkgSA53G7iGxo6xzQGK/PNJaAkHC1mW+TjCd0gOBosz4pBlCLhPmauSAxhxl4YfAN5T24WWFnrA49NcTjgQ4OhKbkkMQ0tA2fdv37DGql7cQQBurLs6B/81hrO2r5Eo33ECZQwRc0XZZHn1NKPnYzV3YW8SlGoxhDwg4Gz6YvkZgZOFIJFXhWY6hOFXWSU3miW/Na4WIUXMCmS4jealkWYe1NNt3Yyj6a5oadoX5nL/Fo2oHGGdQssKsve57A9IRLnDbr2CU0doZjk7LbjQMcR+Nt3PRtcuXgw1rz0KTKcN5djHt/bWLA5OUx8qu7kPudobFgbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ1PR11MB6251.namprd11.prod.outlook.com (2603:10b6:a03:458::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Wed, 3 Jul
 2024 16:12:45 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 16:12:45 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Rename xe perf layer as xe observation layer
Thread-Topic: [PATCH] drm/xe/uapi: Rename xe perf layer as xe observation layer
Thread-Index: AQHazMiaXU/v4ts6Qk6NS82O5bD3q7HlKI2A////eICAAAYVgA==
Date: Wed, 3 Jul 2024 16:12:45 +0000
Message-ID: <cce3d90469f7eae839ea39782dad29f2e7a18fee.camel@intel.com>
References: <20240702214034.2507446-1-ashutosh.dixit@intel.com>
 <405ecbace1f12fe2d70257da79764fd83d604b7e.camel@intel.com>
 <87r0caa2zi.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87r0caa2zi.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ1PR11MB6251:EE_
x-ms-office365-filtering-correlation-id: 41646c37-8f3c-4225-3802-08dc9b7af992
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WHZUQ1E5KzJad0pRV2lvbVZmZitoWlhYcXNLSElPbi8zV2tqR0RwZWlIRDUz?=
 =?utf-8?B?YnhvdzNLMWF1NENwNE95RUlwTG11ekdsVjlodnorTGJTeC81ajU5Y1EzdTFx?=
 =?utf-8?B?Rk5RWmN0SHliYjM3a0kzR1RtQkIrUkZLRWxUc3ZRazdYSE9RMm1vNHJaVkNh?=
 =?utf-8?B?UnU2TEY3d0s1bGw0TThyeXRHUHhycEI5M3JSRTNieThkRXlyRzA4OXpqemQ2?=
 =?utf-8?B?bUpRdFQxZkI1TU1va3FJZWxCcEdYaDZPYjVTcnVLRzA4bDUyZllUR2FkOFBZ?=
 =?utf-8?B?cU9tc3c4WS8yMi9abTNHY1ROL2tIQ3o1VVRpYkhpc0JteHdYNzZ4NzRMM3R5?=
 =?utf-8?B?Nmlwa2ZrSCtKbk51TnBqbFQxbjJaZmdWQ3gwL3o0KzRTbUNiTjlBOXV5RGJ3?=
 =?utf-8?B?VHRwVEpKNWxlMTQ0ZFI5M2Zmb2FqNlVXcDdibnRycDhhYm1xVlhEV2kxblRK?=
 =?utf-8?B?QWZONXJEdDJPUDN4K3NaYmN1bmR2c0JXZXp1anMrTlo2bnVGZHc0V083T3d1?=
 =?utf-8?B?YWlNQVhaZG5rTFEveGM5Z0tBeEJnQlhhay8rcEFYOFo1dTZ5NDJmclViMTlw?=
 =?utf-8?B?OFVvOXhZc1JLQnVPN3VZZGlHL3RDUHJsQ3dTWVQxcTVCbE5LOHFOQ2R4MG9m?=
 =?utf-8?B?OThobnYvUmN3eTZ6RG5PSTV0eXFMc0w4VldveURpaG15MUpicjZlaVlmOHJI?=
 =?utf-8?B?aWcvY1hFMTkyMDJ1c29aOWdxR3RCMnFCZGxVd0hnMVFGMlpLc3FoMW9qNU1k?=
 =?utf-8?B?SUZaZTIwNjdoWmlua202U1p0U2IwUDhtVWFBdnFTV2tHaWw4UUF5Qy9TNWFV?=
 =?utf-8?B?OTNtcFFIVElMWTNYWDlLWnFLSGk0TVBaaUlTRmQvZ2JSTVBrczNJNUR6b2pZ?=
 =?utf-8?B?anl4S1ZtZTR6K0t4RWl1bFYxa3B0b2tYZ0lQQTZVRzVhWHhqNnJ6VTBXVmJV?=
 =?utf-8?B?V3lGU0lZRmhWeDFkS2VPQXB4TzZOWjh5SEg0M2gwTnR1Skc3czM2djJKY29W?=
 =?utf-8?B?a21JK3dPeFRKekFPblcwemZvWnJpZXE3NDlDVjZ5MmRkMmNwemt5bFh2NS9r?=
 =?utf-8?B?ZFAzTXYwY3B5UWZaSDJpdkZ3cTRFdzVRaEZVNCtHbEoyNWk0MkJVNHI2RDZR?=
 =?utf-8?B?RUl5NmxmVTlEMTJ1dnhZZWluby9hY1ZxNEdYNEp1RUFSK1lRbmJSZm9xbWZT?=
 =?utf-8?B?THNlYlBFT3dqSzN6bUJMd3pEenZ3dlViV3BCSG14bzh2MXpON2JLTHpJTitQ?=
 =?utf-8?B?S1VQYmYxQUhSQlJ5b1kzcWNiTTVUQkhuWUhhcGwvWWxiYzNoclJ2SERHUHdw?=
 =?utf-8?B?WEF3MVlmUTlVaWpMenBnTExBSHRJRUlqb0U0UUx0Si9Ea2YyT3lSQ0Q3a25t?=
 =?utf-8?B?MVRwb3UwVzJld0hhenNqZFVmYjg4a0JOenRoc3R0S3NVL2pCRzUweGpVbEF4?=
 =?utf-8?B?UGlXTFZHWmdFSEFaY3VBK2J3MG9iSVRseU5HVzZVS2k5eW9DM2JXbUxobEw3?=
 =?utf-8?B?Tm8zQnhJK2d1Ri9xdUVYV21qY0VqajV6US9Ic2t5bFN3Q2RnQ3o4R05hMzVC?=
 =?utf-8?B?TEhxTkxKWUNUTDdybWM3Rk9wRTI2VlR1Nmt2QXB1ZC9VT213dTlmNS9RemZm?=
 =?utf-8?B?NS9IaGxHUUpIT2ExQ0VBOEtYT2ZkWTNTbTlNdU1yeHJkMDEwMUdXRmU5ak9X?=
 =?utf-8?B?NE1Sa0ZSSlZxdkFRT2FBaEs4RG55eXVMZUl0TnFJSzc0U1lsNUw5QWVpQ2Qr?=
 =?utf-8?B?MG5hN1VYNWdtQURJKzB4SFh3WkxKSzZrWCtxR2ZaZTVtZkFnRnF0Zmp6THFa?=
 =?utf-8?B?Y0JXRm1FbUt2NEthRmxJMDh2RHBpR2JDUWJRdnAvVkpxZWlxbUNwbXJrOU00?=
 =?utf-8?B?YUlUUEFaNjJsOEFCVC9aOGlkcTVhR2ZlUlIxSExEVSswS0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTRuZ0crdEtRc2xBeENDS1YycWtCRU52TXlmd3RLUUdjRXUwZWZqU1N1WjBx?=
 =?utf-8?B?TDdoZXJROFpnek9WZHNQditmTnhIZTVBbnV4RFdVSkY1RU14Qmk5b3FxQ0Jw?=
 =?utf-8?B?NXVhN0JLU2ZUdjRxMXFnUW5OakoxN2paTm1EMEk5MnhJSVZsSHNmVDNlNStV?=
 =?utf-8?B?d0lLcWxEb2E5NG5pUnJsWTl5OVlFWUdCa0YrVHloVlFqK29SMEc5a3dlOGgv?=
 =?utf-8?B?UkJuazRLeUdlc3Z4Q0ZCMVpsMkVCeEg0L3RWTXF0bjFEQzR4Zisvb0xPWHUw?=
 =?utf-8?B?VHFhcDliK1dacmtVS0RXaS9NNnpNVFM5ZDlEZ1dCWW5wOHYrbE5Tdno0ZzVB?=
 =?utf-8?B?d0Izd1JBU3JYQ0UxTkNyTU01WC9IcDg3c3VwcVZLWHFnTlJjbjFFdUxraGhM?=
 =?utf-8?B?YUltUnRWcURmcm4rMVdzSFh3S3ZzSXhTZkVoTG85WEZHeGIwU1MwVXR0dE1K?=
 =?utf-8?B?UXVjZ09GSFh0UXhFK2xiWXRmTmFHdkw1SGdCeFRpZmY2TzljM2RtYUxoNEQ4?=
 =?utf-8?B?WXFyaXA5WXkrVTQ3MEdvYkFRbzRvSUJrRi91L3dMOHlpLzJUcWw1dUJWQ291?=
 =?utf-8?B?M2RsZXdTTGhidDE0OGl6T1J5eWgzZ29LN3VvQ0ZsRTlJWVhKQk5Zb3huWnNi?=
 =?utf-8?B?VHpRWFhOQjFmUmpMYjNxaldPcWhNSndPL3NiS3grT0RaSFpEMEdpN1g5Ly9K?=
 =?utf-8?B?MHhBNUwxOVM5QkhWUm5zL0l4VGV3OU1YN3lqckNyVW5VWm14NzJ6RTBXMEFE?=
 =?utf-8?B?bVpFakdwdE9BK01iSEVlQkVvRDNqdE5JcFlDNDZ5c1FiOUdveHdWMWFkSGVD?=
 =?utf-8?B?VFlzYzR2R0tVQnl0ZzU5S2xKTkNnOVJZL2h5WnRkWWgvNk40c2YyWm9GSDRZ?=
 =?utf-8?B?YksramxySlhpQWxEektkU1grT0ZPRkdMVTlMMnl2T1Z3elBMT1JVRExkSUNt?=
 =?utf-8?B?MnhIMUtrTlNyOFRJei80bUg5eVdxbTVmWXV2UXpsaTBZZFFJeitQaVJtRldW?=
 =?utf-8?B?Nk5NU3VpUXdPRjNyVnBocTJVMzZDNkJrSXFaQ1hyTmV4OXUwVVBveGFsMVFL?=
 =?utf-8?B?N25BWjhOOUxRYkMxVVJJcEZvRGpHRHAyVVhhd1hhNUNyL1ZxYUZxR3VieENr?=
 =?utf-8?B?SFZuZWdFWGZJVHN6Y3BxMXozSXZEOGJPUWhEVW5wYXpZTmI5QWxrclVRaUVX?=
 =?utf-8?B?cHBRdDg4WGQreldoTkNVRkpwOUd6SHN3VXZqS1cxMnNoNHlORWs4aU1CeUR4?=
 =?utf-8?B?UXdneVE5dk1aMDNXOUZETGJWb0xGQ01WZ1gzT2lvU3kxSFBkQldhaE1WeDZC?=
 =?utf-8?B?UmdaZG5XWjZiOGdFdUx4ak4vSFkrb3dqcE8yRjlEdG83RUN2WCttd24xVzBS?=
 =?utf-8?B?cWs4cFVVR0pxL0ppSmRXTE4yc1dKVmJtRDJrT3R6bTJQeGZyS0V1VlZsRHU0?=
 =?utf-8?B?M2ZBZzlQNEJFRk5NcG1HbkJjSmZQeEkvSW5Id2pZVk1JTUlyak5NengvcjVh?=
 =?utf-8?B?MXhveEpQeklJKzdLQ0hvcGo5ditpUm9VYW4ycnRaZVdBVW9RbVl5VHlreDlI?=
 =?utf-8?B?bG9NNm5BRjhWbXgxM3hYRFFaN3hYZUFTL3ZnbVdvUDZwMlU1Tm5LbmJaN2JU?=
 =?utf-8?B?Szk0WkpIVkE3WGdkZmVjRW93LzRIQnlKdXNqMFh3Z0tkcEovTnptdGJ5NU1P?=
 =?utf-8?B?YXVDcWRGQTAvQ1dUTHh2dUs2SnNHQVlQVTVUNWtDeUk0amJKL3NIK1ZHK1pN?=
 =?utf-8?B?ZGxVODlUSFVqQWtBbHN3L3RSUmh6VktOaFNiVkZ4NEdLSy9kWlJWQTdCWlJu?=
 =?utf-8?B?NTBQNXBFVGRVcXIzNG45NUxHQXBxUm5uelU2OTdMdkhRUnhRSEc3ZnpSMU9L?=
 =?utf-8?B?N1k2NURBeWFuVUtPS1NKMjJxcUFMandzS3AvZ0lPVnhmSGVxaDRNNUtSUEwy?=
 =?utf-8?B?TFhlcXR3cjA3SEpsQURHSDk1NlFUczdWdm9aZnk3UDJ6UVZYcHkxMkZWOU1S?=
 =?utf-8?B?cUdSaVlUcTZET3g1cUgrcmZwUlF5VmJYUEhaYm0wQnh2eE9sQllTWDhPalVQ?=
 =?utf-8?B?L29RM01tdklkTm5JQkVtRUNRVXM5VWJKMHJMcUNiT1FnTjMyZXpaS0dXWnVk?=
 =?utf-8?B?c0lKV2piVFVkRDlnVmozUklNS0RVRWh6TlFNdGVQWmY1M05aSzd3aW5KZGpl?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28893165B17EBB4989A9C225E01488EE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41646c37-8f3c-4225-3802-08dc9b7af992
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 16:12:45.5159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cgw4AlT8iq4/HmAF/QLIrW4NOkAE+QhNz+50ZVJhLKlWmEhVG/EDlTfuEk9+YGR4dxPhHwJXthy4Iqyzjl6FXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6251
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

T24gV2VkLCAyMDI0LTA3LTAzIGF0IDA4OjUwIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFdlZCwgMDMgSnVsIDIwMjQgMDg6NTI6NTQgLTA3MDAsIFNvdXphLCBKb3NlIHdyb3Rl
Og0KPiA+IA0KPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgY3RsX3RhYmxlIG9ic2VydmF0aW9uX2N0bF90
YWJsZVtdID0gew0KPiA+ID4gKwl7DQo+ID4gPiArCSAucHJvY25hbWUgPSAieGVfb2JzZXJ2YXRp
b25fcGFyYW5vaWQiLA0KPiA+IA0KPiA+IFRoaXMgd2lsbCBsZWFkIHRvIC9wcm9jL3N5cy9kZXYv
eGUveGVfb2JzZXJ2YXRpb25fcGFyYW5vaWQsIGlzIHRoaXMgdGhlIGludGVudGlvbj8NCj4gPiBC
ZWZvcmUgaXQgd2FzIC9wcm9jL3N5cy9kZXYveGUvcGVyZl9zdHJlYW1fcGFyYW5vaWQNCj4gDQo+
IFllcywgYmFzaWNhbGx5IHRoZSAicGVyZiIgbmFtZSBpcyBwdXJnZWQgYW5kIHJlcGxhY2VkIGJ5
ICJvYnNlcnZhdGlvbiIgKG9yDQo+ICJvcGVuIGEgcGVyZiBzdHJlYW0iIGlzIG5vdyByZXBsYWNl
ZCBieSAib3BlbiBhbiBvYnNlcnZhdGlvbiBzdHJlYW0iKS4NCg0KTXkgbWFpbiBpc3N1ZSBpcyB3
aXRoIHRoZSAieGUveGVfIiB3aHkgZHVwbGljYXRlIGl0Pw0K
