Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B89606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 18:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L4GYSt41;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=De4BhIMA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA9D10E5A0;
	Thu, 19 Nov 2026 18:35:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA47310E5A0
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 18:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795113334; x=1826649334;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=guKvLRJt5JeWTKsHNFFzgrBx3CYFAvr0Z0yvR39gtTY=;
 b=L4GYSt41bZPqH52xLdEkzRxSRZzrCoRMdhyeAdEuhbiB5jZDqpN80AW+
 FhyNkC0l3YOWZIDW7pm7mmCZBTqzsng2bffDUgaAqTIoP7hQ8AjrdGXhy
 nBkS7f/pxgjSUO9om1bMwtutktNjzmZRJiSs8BxE4VASFF+cI5kv2GA2m
 ZW2s8YH8zlNCJgYJ+44XMsmVUGpxMIjw2G+rRcn+ylpzfZumZAFuH2yXD
 +ngk3Cc0nYYbpCbuc9HjIhiTeozqKaPtuUWFcOn6YSjdRpANc1J8nDqBP
 0TMaHxKZatl69uK96TLFrGuemIBBN6wD0rO+kzFowJEOe3Ps9HYafH3a+ A==;
X-CSE-ConnectionGUID: ZC7GbaDCRJWMVmID8X8rYA==
X-CSE-MsgGUID: FFhmQj29SAyx+CGUb7LRMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3876179"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3876179"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 10:35:29 -0800
X-CSE-ConnectionGUID: NY/KzZasSKCVQjcocWqx+g==
X-CSE-MsgGUID: 5qvdmnybSs6oR4nfhkJwOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10397159"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 10:35:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 10:35:18 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 10:35:18 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 10:35:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9hQj/FogfATSid+dn4UA0HURzjJMr7yRR58DvQbJVYGfqCuXzT+HYT8vTWcvooE2m7clCdQcsX0IE0onAc6eK/al8ekUakQc4J9UZ5VRqbtKcE9kuPjJSRB/jsgopvr5tz3UW6wfY18og2qVWIx+QbXZ7o44lBsMRvtgpaYNevpZCqOBzmhVc2HHTMFUrcwCdfX8Zl2DRSCZmVfyvVOTP77iw+l+V7kBrYpEN585x0QwKn2txQVDHNPoQwwWX1xVF5rlPLqJn4jdWqggtRNSUDSiBCwlQD5o2v4yeckUoQb0L6NPzYWaK8+zry2eAoEpZ4ZJKNYFLXqqRHNgn9UsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NeA0jq2MTsZmgzxK8BkJgoPHmrtHT5CZ2GV3wS0XCA=;
 b=ooYCOwcdnUEivLudI0Npr/jCw3CZgOZBMH2M20RnoYtSgja1GBA3Lnr0wnB9dymCVRiZZij4d92ZalBPgvrhvpJMTzThYFRX/83epn8HAdOFLl/HGCdzYO1bVOtWKz6ut8dg3+wAMkYHAOtZZvBWon8JOA7an2zoNjkRsxlbV9Ej3C01itoTwOUhWxzjJGj/zZfWy2MWrvO3yc1mwYiFrvNGyID4UqXwxJ/5vWPSpfyXOPTUeACywGeH91Uj+EwrrfrCRPWuZTR3I1ulwhLdInt9BksPsDt3puJoF2ywPwV4Z8YXB+rD+evgTlzZ/68ElyY4vSu6LhJutnboFWkeEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NeA0jq2MTsZmgzxK8BkJgoPHmrtHT5CZ2GV3wS0XCA=;
 b=De4BhIMAx3w1LNynBUPcMOnkAgKi6UnkBffWkNPVWKCK+giBnB6omoGDnblzIiNfqeIytkLSaiM/gna4MV83OvPItnRxTv+FLDBzUDtc3HCiAsuB/Omd0vM9acsD+pOVhh1i3lwrL50GC78xR2jTHN89CMZJ6cMoQwsYMopJxaw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8) by DM3PPF67FA1A8F8.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 18:35:16 +0000
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f]) by LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 18:35:16 +0000
Message-ID: <8b40e8a8-4e46-499d-9b3e-70aff38fb4ef@intel.com>
Date: Thu, 19 Nov 2026 10:35:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Add sysfs to disable RPe
To: "Anirban, Sk" <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20261118012453.626087-3-vinay.belgaumkar@intel.com>
 <20261118012453.626087-4-vinay.belgaumkar@intel.com>
 <35f34587-ba42-4adf-9d1b-ac6ecb7e06e0@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <35f34587-ba42-4adf-9d1b-ac6ecb7e06e0@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:a03:114::23) To LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB183078:EE_|DM3PPF67FA1A8F8:EE_
X-MS-Office365-Filtering-Correlation-Id: e23a436d-3d09-41de-d985-08df466bdb5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|261021123027099003|56012099006|4143699003|261022105027099003|11063799006|261026140227099003|261021121427099003|261028144727099003|10067099003|261102123227099003|22082099003|18002099003|6133799003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info: O+g6cbr8HdYaKKrsFxjfaOWD4QN4wzM1OC7UD8V9FxNNAKFaqbbwVYWxtLXI3do16Q94vVH3rhwWDlnRWHPO2M5qp7dUgBQIn6Wz4kEEApvY0eyWWwp0WtwzDIZxenbK1bpHZOFpjf5eTpYtb1H3vb22C8ihr5/sBbH61A/kpPuhN4FmWDl1OhRh2pPgCaQQX4dMOhWyALn08dU39BWSzsYS3APnMbwTsEaWX8X+SMcXY4Hr+KAnMFG7BSkPa/IE06IBbuqDBrkGEKR5dL3Sd66ldt15LNwCQY0XASZi27UvylH/4ZoiNJlH8/8HnXj5NvOrlc73a4CikP8EujxjvZPrdqFDhppQujfpmh1xVhrpCGMFp47P40r9uIf4O2Xpj6TMVpVw5M7rkugG1zboWOD+tvs0BAB6oBEWLP/p+YmZdZ6VUuwT4jzaNTEdXALGuI10gov6Ilw9Bc4kybZsyyi84NYmjCxMcfCvbFVv6yPUNwP+oSQLHJJ7akogGBfLU5wmPOYh4JCiJ2muuE1Y+C/hueqXWz1YgIO0IsOxy77K8UNN5ZSRZXmqPfpgPnN2PwEBGwMah7smVim/zEHcZ1eDpA9KQI09TB1MsfehSonUy0PnXESakGn1Bl0rSWp0xIVZVTfFxFuTcm7fIvWxNONZ0a4r0gRqv3h2dpvNR6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB183078.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261021123027099003)(56012099006)(4143699003)(261022105027099003)(11063799006)(261026140227099003)(261021121427099003)(261028144727099003)(10067099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzhmYkRQVVNVNVkvc09NUlF0dTdKcytmYlh5UDlnNWgvR3lCeEQ3Z05vMjQ2?=
 =?utf-8?B?cEpiMG81NVJLOHJ3YmNUY1AvS3ZRUXdacHpCRUJVWjVDN1lpcW5xQ1VJOFdB?=
 =?utf-8?B?KzA3WFFSekk1VnphWTFPcTlwVXZBdWlZZjJSQ3ZmbDJLcGh3NndnaU5KK0dH?=
 =?utf-8?B?aXdyald6ek5BR0xWL2tObUl4VnRWZlJ4ZzRzTWRMOHpzWjN1eWlYVHYzNlNr?=
 =?utf-8?B?RS81bUFFZzBVcjFUc0dJU1djSTdhT2NvWDFHdGp6WUM0L3Q5MEJvYmowRTVL?=
 =?utf-8?B?RzV4Ti92TEJNZDE5ckQ4M2d0YW12REN0TUFQdFI5dnNxMGpvSE1CT2dISEtx?=
 =?utf-8?B?LzVBZ0NzY0Qrcnk1bWFLeGxwckZCa291bnJTNCtJRGx3cnQ0MXIxek56S1NF?=
 =?utf-8?B?bFpud0tlaURjSmYzd044YlZBWGUzNWlVaWZVMWpRVVp1d3ZyVHpHbGR6R0Ji?=
 =?utf-8?B?WXJJbis4YTA4VjdvUzBPYmVlVmM4eXQzZHQ1WVdjZG1kTHhkSFFBQzJGOEJs?=
 =?utf-8?B?Tytsd3NKRnVsVS9uRjNSbDc2emZFNVNYMTBkSm16Z3poUi9SeEhDLzNSNlJD?=
 =?utf-8?B?VklWSzZycmdwdUlJUVdwbEN5dWl2YnEwblhFS0NMdEZpS3FTQTB4QXI2ZS9j?=
 =?utf-8?B?c1R2LzNYdVdXRjZZZzF2dGgvR2JFdlg2QURJSW1oa3BIalNJWXZtRzFvN295?=
 =?utf-8?B?YXFZM1ZXM1pEdExVTXdNMWlURDhYemIyajVoL2VrRVJVVzFpZXNnYmFqTktU?=
 =?utf-8?B?UnhHcWI4Z0s1Q3loYWsyMG1rYk1WRDJ3ajcwL2Z2aVE5T3RWakpXaUUrUFgr?=
 =?utf-8?B?TUpmYnVRZGxzUzdBV0dsNStHMUVIZnhZaGJPaHFBWnNDeWZlL043OUZNdzQy?=
 =?utf-8?B?a29RN1JZWUhxZ2I3TzUzRThjUllYVGp0cjFqZXI2MFZ4cTJYOW5DRW03N1gw?=
 =?utf-8?B?dXp4alJLSWQ4OG14Qmt2NU5XTU1xN002dFdZZlVhVnU2UjlqcWRjSkovQ3Y2?=
 =?utf-8?B?ZHdWdnpMdllONWhKbG5sQlBSZjFRR0p2VStKTzZlOGU2Q0M2OFBKMThWR0E3?=
 =?utf-8?B?Z1RpdlJVYlJUYnk4SzRoUFJMQi9YZllkVEVCYzNvUHFpQ2QxZitmOUIrdGRk?=
 =?utf-8?B?OUZCNmtHMXFweld1M2UzdGRycXdHU3pWczF3UmFYRWNydEtYd1Frcm9MNHE2?=
 =?utf-8?B?R1VMWnVHOUFXVTROTFdlRVNyTGt5amwzWVg1OU1HSUIyWFFMK2ZRZUc0UFVs?=
 =?utf-8?B?ZDRzcjFBSklLQjBieTZwNVBRWEM5K0FoR0orUFpUeGxoM2lPNy9HdUozaGNO?=
 =?utf-8?B?QksxZ1lIYmV0SlhVY2RydHdBL2NDU3g3R2NrODJaazN6T3I0bWhJTTZ1NUcz?=
 =?utf-8?B?bkhjV1pLbTJYSUlsSG5TNWFFWU1rcW16TG5CNUxBa1RSdG5nQThlclVKWFRO?=
 =?utf-8?B?ZEJhNElTc3pQN2MvajB2M3NqS0d4cEx3NFF5TUtIREZXQ0NZZ0NrS0ovdldK?=
 =?utf-8?B?N01PMXRpVGNPcE44QmpKYjhES29sU0Y5S2J3ZmRNMGd4OTBQQ3RCQUppU2Vs?=
 =?utf-8?B?ODE2Qi9oTFIxcDh6bEdrMVNtTHV5bzc0Q0hMNlM1SE0wclROMHU1Z005YkVo?=
 =?utf-8?B?MFNFUFo2ZlFySnh4RTlQMHNybHA0VGozZFhkTVlCZXhMRXZrZlNkTVVmeEdr?=
 =?utf-8?B?TmhwdnIwRWM0ZXRWazFTWVNnMzRNdCtQS2p4Q3NwR1pxYmtsWCtXK0hyKytI?=
 =?utf-8?B?enhkajEwOTJ2OFRqYmJtQVprUnVMa1NGTEdJZ01ZZWxsTHlxVUllVXdndm1I?=
 =?utf-8?B?OS9XcmFaSGZ4Y0dYSTJLZlBlc21jRGFleVNaL1dJbzVWaktMNytyTncwNlVq?=
 =?utf-8?B?T2hvZ1BWaVZwVUVnSVNXQjJRVVZyRmdpc2p5M2tGT25ka1pHamhmd2c5bDRW?=
 =?utf-8?B?MXJ6VDluNzRqVzZNUVlUc2wvTjc4OXdwS3dVOGZBbWNacWRiVkUzTGU1VC9R?=
 =?utf-8?B?R1paL3Rqb0NPeWlNb3FaYmgrSUc5Z2ZKejltZ2NJY05Oam9xRTZMOG4zb1k1?=
 =?utf-8?B?ZUlaUEkzTldLWC96Q0UvZDB5SkozcjgxU0lRbFF2UmFRek1WZlZ4VFNYSGFs?=
 =?utf-8?B?OFcrcU9USDYzSmNaNk9CNXVwZVcwdHZvdHRMa0d4ZDdlLzVoNVFUM0h5N2lY?=
 =?utf-8?B?Q1ZiZ0N5bC9vMVN0Y0lUOVVjMXkyTjNsY0xLZWxrRVNjdHVOU0RHVXY5UnBx?=
 =?utf-8?B?ZFIwdlVWVHl3NXdDcmNGMUJqejVzSis3Tlh5bDhLRUppMXQ4c2F4Tm80T05D?=
 =?utf-8?B?bnZjc1dXaUNhRytMZ3kxRDh3Ty9PUlFZSWxSVGVDRTh3K05vaGdINzFVakRZ?=
 =?utf-8?Q?OadNgUjkD0qSusPE=3D?=
X-Exchange-RoutingPolicyChecked: 1kdJXd4t1JGAfwJJ+78T3nuTwCQTH9+VlS0VBwEeEnVZ7DwVnV9z3XeiC+VogPFJ7Q5yydgbcKmejSnLQPi7vH/RWTLXZU9GyRg+Ig/BZ/xN+yJsh+YKJT7laoD5PSV6kxVqgEnjg2QBwCPFaPKhlwBgcrCnMNVP3rbQtbFkCOBWgUHR771xuMNup3HeZPHPCs8rs/YeuVoVC8+I657NauSpQ+656h87jI6oJo3ydWntFoNXyKDG4o+3mbb3XtCjr4GlZUBc5xRLVJkDxu5t1PTTdtxKuMA3PErT0lZpWgORwmXtpgm6JEBneHax+LGtRcN1XJjWiCw1Cb5AzI5XzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e23a436d-3d09-41de-d985-08df466bdb5f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB183078.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 18:35:16.6526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPu6EOouiIMaAuBqrhaPdrV9uhzwLMU6Ryg/r6GCcHrDQ0zIN2aVgotTbx97ea0JpQ9UxjTmZEYRWv9W7CtnNhAvxhJI4iiVJNw1WXT0hzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF67FA1A8F8
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/19/2026 7:56 AM, Anirban, Sk wrote:
> Hi Vinay,
>
>
> On 18-11-2026 06:54, Vinay Belgaumkar wrote:
>> When SLPC is initialized, GuC sets the GT min freq to RPe(efficient) by
>> default. This frequency is desgined for optimal perf/power ratio. 
>> However,
>> certain use cases may want to run at lower frequencies. This sysfs 
>> allows
>> user to disable use of default RPe behavior.
>>
>> Efficient frequency will now be controlled by this interface alone. 
>> Setting
>> min_freq < efficient will not disable RPe. When RPe is enabled, GuC 
>> raises
>> min to RPe and lowers it back when disabled.
>>
>> Update pc_set_mert_freq_cap() to now disable RPe before stashing min 
>> freq.
>> This ensures we are saving the real min freq instead of the elevated 
>> one.
>>
>> $ cat /sys/class/drm/card0/device/tile0/gt1/freq0/use_rpe
>> 1
>>
>> v2: Address Sashiko comments.
>> v3: Disable RPe before stashing freq before mert cap (Sashiko)
>>
>> Cc: Sk Anirban <sk.anirban@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_freq.c      | 35 +++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 76 ++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 +
>>   4 files changed, 105 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c 
>> b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index a40dd074106f..38c4f17ba99c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -242,6 +242,40 @@ static ssize_t power_profile_store(struct 
>> kobject *kobj,
>>   }
>>   static struct kobj_attribute attr_power_profile = 
>> __ATTR_RW(power_profile);
>>   +static ssize_t use_rpe_show(struct kobject *kobj,
>> +                struct kobj_attribute *attr,
>> +                char *buff)
>> +{
>> +    struct device *dev = kobj_to_dev(kobj);
>> +    struct xe_guc_pc *pc = dev_to_pc(dev);
>> +
>> +    return sysfs_emit(buff, "%u\n", pc->use_rpe);
>> +}
>> +
>> +static ssize_t use_rpe_store(struct kobject *kobj,
>> +                 struct kobj_attribute *attr,
>> +                 const char *buff, size_t count)
>> +{
>> +    struct device *dev = kobj_to_dev(kobj);
>> +    struct xe_guc_pc *pc = dev_to_pc(dev);
>> +    int err;
>> +    u32 val;
>> +
>> +    err = kstrtou32(buff, 0, &val);
>> +    if (err)
>> +        return err;
>> +
>> +    if (val > 1)
>> +        return -EINVAL;
>> +
>> +    guard(xe_pm_runtime)(dev_to_xe(dev));
>> +    err = xe_guc_pc_set_use_rpe(pc, val);
>> +
>> +    return err ?: count;
>> +}
>> +
>> +static struct kobj_attribute attr_use_rpe = __ATTR_RW(use_rpe);
>> +
>>   static const struct attribute *freq_attrs[] = {
>>       &attr_act_freq.attr,
>>       &attr_cur_freq.attr,
>> @@ -252,6 +286,7 @@ static const struct attribute *freq_attrs[] = {
>>       &attr_min_freq.attr,
>>       &attr_max_freq.attr,
>>       &attr_power_profile.attr,
>> +    &attr_use_rpe.attr,
>>       NULL
>>   };
>>   diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index ea47b0ded83a..5ff3df99464b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -344,6 +344,21 @@ static void pc_set_cur_freq(struct xe_guc_pc 
>> *pc, u32 freq)
>>       pc_set_manual_rp_ctrl(pc, false);
>>   }
>>   +static int pc_set_ignore_eff_freq(struct xe_guc_pc *pc, u32 val)
>> +{
>> +    struct xe_gt *gt = pc_to_gt(pc);
>> +    int ret;
>> +
>> +    xe_device_assert_mem_access(pc_to_xe(pc));
>> +
>> +    ret = pc_action_set_param(pc, 
>> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY, val);
>> +    if (ret)
>> +        xe_gt_err_once(gt, "Failed to set ignore_eff_freq to %u, 
>> %pe\n",
>> +                   val, ERR_PTR(ret));
>> +
>> +    return ret;
>> +}
>> +
>>   static bool pc_freq_in_range(struct xe_guc_pc *pc, u32 freq)
>>   {
>>       /*
>> @@ -358,13 +373,6 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, 
>> u32 freq)
>>       if (!pc_freq_in_range(pc, freq))
>>           return -EINVAL;
>>   -    /*
>> -     * GuC policy is to elevate minimum frequency to the efficient 
>> levels
>> -     * Our goal is to have the admin choices respected.
>> -     */
>> -    pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -                freq < xe_guc_pc_get_rpe_freq(pc));
>> -
>>       return pc_action_set_param(pc,
>>                      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>                      freq);
>> @@ -1091,12 +1099,23 @@ void xe_guc_pc_remove_flush_freq_limit(struct 
>> xe_guc_pc *pc)
>>   static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>>   {
>>       int ret;
>> +    u32 mert_freq_cap;
>>         if (!XE_GT_WA(pc_to_gt(pc), 22019338487))
>>           return 0;
>>         guard(mutex)(&pc->freq_lock);
>>   +    /*
>> +     * Disable the RPe floor so the min queried below reflects the real
>> +     * underlying minimum (RPn or user_requested_min) instead of a 
>> value
>> +     * GuC may have elevated to RPe. This stays disabled until
>> +     * xe_guc_pc_restore_stashed_freq() reinstates it.
>> +     */
>> +    ret = pc_set_ignore_eff_freq(pc, 1);
>> +    if (ret)
>> +        return ret;
>> +
>>       /*
>>        * Get updated min/max and stash them.
>>        */
>> @@ -1109,7 +1128,9 @@ static int pc_set_mert_freq_cap(struct 
>> xe_guc_pc *pc)
>>       /*
>>        * Ensure min and max are bound by MERT_FREQ_CAP until driver 
>> loads.
>>        */
>> -    ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), 
>> pc_max_freq_cap(pc)));
>> +    mert_freq_cap = min(xe_guc_pc_get_rpe_freq(pc), 
>> pc_max_freq_cap(pc));
>> +
>> +    ret = pc_set_min_freq(pc, mert_freq_cap);
>>       if (!ret)
>>           ret = pc_set_max_freq(pc, min(pc->rp0_freq, 
>> pc_max_freq_cap(pc)));
>>   @@ -1136,9 +1157,11 @@ int xe_guc_pc_restore_stashed_freq(struct 
>> xe_guc_pc *pc)
>>       mutex_lock(&pc->freq_lock);
>>       /* Apply any user min/max request made while the cap was 
>> active, else the stash. */
>>       ret = pc_set_max_freq(pc, pc->user_requested_max ?: 
>> pc->stashed_max_freq);
>> -
>>       if (!ret)
>>           ret = pc_set_min_freq(pc, pc->user_requested_min ?: 
>> pc->stashed_min_freq);
>> +    /* Restore ignore_eff_freq override from pc_set_mert_freq_cap(). */
>> +    if (!ret)
>> +        ret = pc_set_ignore_eff_freq(pc, !pc->use_rpe);
>>       if (!ret)
>>           pc->mert_freq_cap_active = false;
>>       mutex_unlock(&pc->freq_lock);
>> @@ -1192,6 +1215,36 @@ static int pc_action_set_strategy(struct 
>> xe_guc_pc *pc, u32 val)
>>       return ret;
>>   }
>>   +int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val)
> as this is not a static function, better to add description like it's 
> neighbours.
>> +{
>> +    int ret = 0;
>> +
>> +    guard(mutex)(&pc->freq_lock);
>> +
>> +    /* Might be in the middle of a gt reset */
>> +    if (!pc->freq_ready)
>> +        return -EAGAIN;
>> +
>> +    /*
>> +     * While the Wa_22019338487 cap is active, ignore_eff_freq must 
>> stay
>> +     * forced off. xe_guc_pc_restore_stashed_freq() will apply this 
>> value
> In pc_set_mert_freq_cap() we are enabling ignore_eff_freq , so here 
> looks like better to refactor the sentence.
>> +     * once the cap is lifted.
>> +     */
>> +    if (!pc->mert_freq_cap_active) {
>> +        /**
> /* as it's inside function body.
>> +         * If use_rpe == 1, ignore_eff_freq = false. GuC elevates 
>> min_freq to
>> +         * RPe when enabled, and resets it back to the previously 
>> set min
>> +         * when disabled, so no explicit set_min_freq request is 
>> needed here.
>> +         */
>> +        ret = pc_set_ignore_eff_freq(pc, !val);
>> +    }
>> +
>> +    if (!ret)
>> +        pc->use_rpe = val;
>> +
>> +    return ret;
>> +}
>> +
>>   static const char *power_profile_to_string(struct xe_guc_pc *pc)
>>   {
>>       switch (pc->power_profile) {
>> @@ -1340,6 +1393,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>       if (ret)
>>           return ret;
>>   +    ret = pc_set_ignore_eff_freq(pc, !pc->use_rpe);
>> +    if (unlikely(ret))
>> +        return ret;
> If we return from here in that case the pc_init_freqs() will never be 
> called, Imo better to just print error message here.
I will be moving this to after pc_init_freqs as per Sashiko comment. 
Though, if the h2g fails for any reason, we should still continue to 
fail the probe since env may be unstable.
>> +
>>       ret = pc_init_freqs(pc);
>>       if (ret)
>>           return ret;
>> @@ -1426,6 +1483,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>       pc->bo = bo;
>>         pc->power_profile = SLPC_POWER_PROFILE_BASE;
>> +    pc->use_rpe = true;
>
> use_rpe is u32 in the struct, maybe we can use this is bool everywhere.

I'll just define it as bool in the struct and keep the u32 in usage 
functions.

Thanks,

Vinay.

>
> Thanks,
> Anirban
>
>>         return devm_add_action_or_reset(xe->drm.dev, 
>> xe_guc_pc_fini_hw, pc);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h 
>> b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 1025a2b15f5f..dc52f349a6a2 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -31,6 +31,7 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, 
>> u32 *freq);
>>   int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
>>   int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char 
>> *buf);
>>   void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char *profile);
>> +int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val);
>>     enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h 
>> b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 9a6ea2904e33..36bc25fc6753 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -37,6 +37,8 @@ struct xe_guc_pc {
>>       u32 power_profile;
>>       /** @mert_freq_cap_active: Wa_22019338487 min/max cap is 
>> currently in force */
>>       bool mert_freq_cap_active;
>> +    /** @use_rpe: Toggle use of efficient frequency */
>> +    u32 use_rpe;
>>   };
>>     #endif    /* _XE_GUC_PC_TYPES_H_ */
