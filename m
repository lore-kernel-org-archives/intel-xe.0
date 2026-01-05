Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822BBC2A075
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 08:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B3810E05E;
	Mon,  5 Jan 2026 08:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOyge9gn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E744A10E05E
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 08:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767602613; x=1799138613;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=TlRkFRJsmrEeZu7kTF4dT043JV0/g7r9M7cHiu4dDyc=;
 b=LOyge9gnUrwYlH7wDamDw+Rd6l/m/8mQT2DzywtUejvZ/VY3vPEtuQh7
 3Hl8S1wZBTguuwYUBVmvFvpJoAaPkszlBImICyUqeCO6a3mrGGqAqUpXD
 7N1p6lMOgwwvTx0snXRyPz+gyuayfK9WiA5HRpZc2xzSvHzFvF7zYxt7c
 ON2Yor9psS2bmd1x/YDZgQl1BhKBcmfbxvTWzWL59QO+MULgc+Cj9utw0
 xWdiKDhEA1X3A2Ab315wjchQtm49YukyleCcmghBDdCQoBxo8UttHSi1j
 A2vScvW6FYgij4xXmJWKh2mgNzbQRDq1BSFy6Mgi04Eq1eUBlkqU/L3eG A==;
X-CSE-ConnectionGUID: XJ6SNDBOS1aY0b1EGZG3sg==
X-CSE-MsgGUID: SMe2NpJrRVOHINSNlI85vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="72814259"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="72814259"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:43:32 -0800
X-CSE-ConnectionGUID: TqLLisw2SoOku9FU4oZRbA==
X-CSE-MsgGUID: fmunwfQQSDyP2JI08mcScg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="225872840"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:43:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 00:43:31 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 00:43:31 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 00:43:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2P8nxjn7ZZ9zocFigtv78w0RDre0SXAKv7WoSbiAPo6AAXVsrzmKII/oPb5PqeCyUhpoZM5g6MvUTPrQh4kzYZQqT+jWmmL7Z7r9akc3Ds+B5lT3UTNqTyMD/m2AhzzkF+Q5wx96jvWNVZxd0sF16v2YjKYFGp61h1tLV+NZ9EYd2wLL0KdKo9RmR93N5iiKClpr3MJt1f38P+9T68jL0SCiER5Sf7Z0Xe6vrv9mGCQoqonTqn3WfuWGwdzzlGjVcAK2VaVzYrvBNYwANcfTuVvgY5uBtDooYlYiYW4FC2UJ43mKoPzzW3VSFAQiy6X8QB+TLCOkFkB6+F9WeLlZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9jlIXvPxwVPIPZfprzwRis2X6u2knfRIkOjwNkQajA=;
 b=vj9maKJILpaoPa2AyExO5oxNrR6GNTMahFlWYR+G0syEbyvsHAbnXmnW8nNWgPqgsaSns1sdaU56FTNbJnQNaV4Z85Kl6wHUD8JzPERKa1aRGCEffmxJNbMRjkxWdzK43rMAzByYfKH9r0lDZ5mH83kAfaN0QfUbIYAeLK0bZVLahfMUvWXj+ZBACzDJnt/2HvyvW5dSFCwsO0hesQfTx7d7VVtftgQgCbNKFqXtgLZPXL5n/ZakDLmMrFvPooKtifAfdoK1lRaKnyHKT4XZurFEZ7pGrY8usNFVTaaJGJTvQvJAGSXUq0+V6CXrsSpEtNL2rLnVEZt1Qq5YiPHJNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SN7PR11MB6726.namprd11.prod.outlook.com (2603:10b6:806:266::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 08:43:22 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%3]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 08:43:22 +0000
Date: Mon, 5 Jan 2026 14:13:15 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 drm/xe/device: Convert wait for lmem init into an assert
Message-ID: <aVt5o9ceKpl9yeJZ@bvivekan-mob1>
References: <20251219145024.2955946-2-balasubramani.vivekanandan@intel.com>
 <176642523129.111846.14484091187192005892@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <176642523129.111846.14484091187192005892@a3b018990fe9>
X-ClientProxiedBy: MA5PR01CA0192.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::12) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SN7PR11MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1bd755-0489-4b1a-20d9-08de4c367ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a29ISzRsQlo5UW5tSTVrclRmeHphRW00SDZWS0JyS29nV1IzdkpSKytwS2ZU?=
 =?utf-8?B?amcxcnBzaGZSSU8vaVFvZ0pVTHoyLzlrV0ZwN2pacy9mWm9aY3p2QVV2OWlS?=
 =?utf-8?B?dHRLaCszMXBCOVhQVDVqVFUzODVLVG5udGlzY09IUndtNVA3dVBjZzI1aFYy?=
 =?utf-8?B?d0ZNdlZIZk9KNERhVXoyYTRYODJ5N09VUlJSWnF0Y3lQbXV1ZzRjWWpEVjZV?=
 =?utf-8?B?Nnd5ZVYzb1J3ZThIQVhMamxGd3l6SlVMYkx3M1VZRFNHNm5WNFZGSHBxTVgr?=
 =?utf-8?B?NWFIWU5ZMjVTak5ramdialFxQnJ4eTA0OUlVRjBoUExkcmcyLzBwVnpvTFhP?=
 =?utf-8?B?ODJkalc4YmdZWjhRM2QyQW45S0hSckQ5Skd0Ylh4SThrdTdBVjc3dWxqVld1?=
 =?utf-8?B?NDFXcnBLbURKM2xyalJXMFRIMENDaUI4K0xqakVWaHJISkQrVnM0Y1owWERJ?=
 =?utf-8?B?R0RCeTBDY3diNTVabzRFSDFsMnBla1cxQTNkVDdsS2F0TWdSTTcwYkdQbjRT?=
 =?utf-8?B?WmVhcnFwVmowQnFVRDRKNkN3Ri84RnF6bnpHUzNxSTYrbDdwT3V0ajhPSnAr?=
 =?utf-8?B?S3FnTDZrL21od1RzcGdMZVovMThGdjRQMkJldjFqaGdXeGExYUNjdzNsQjgx?=
 =?utf-8?B?U0l3bkxWYitocnNZV1BVRWdJYmJ6Vis3RkhJVnN6emVKZFVUMUF4K2ZDR05m?=
 =?utf-8?B?T082czVSR0ZHWTFSbjRIL1pHbkc4MzJtcmF1alFyRVdWOU55T1RBeVJja05L?=
 =?utf-8?B?eGxkK0U2a2c2d2xUUlNQRy9mN0g4TXRUZUo0SkFyUWY5VVgrbzd4YjkvajlP?=
 =?utf-8?B?ZVBWNDR4Y1lRU1RoOCthclhjYStHVXZuTWllNWhHaEVrUDE4dHpaYlFkZmlU?=
 =?utf-8?B?azFxbHd1RU1zcnFpREpIbkdZVklNKzhjdFp5d3ZOTmRmUWJPdFkvRVNUU3B2?=
 =?utf-8?B?NlBCdGlWcXNJbUM4eXdub203TlIvM0ZxZ0JyUmlyNWUzZFVXeWlYei9nWDdT?=
 =?utf-8?B?WjB1WExpVU55ZzZSRllDaDQwOWtKM2FsdUJtVWZkNWdJR1JZR2pzcm12aTRQ?=
 =?utf-8?B?V1VIOE5pZ1ZNOHBmaURYaml0eXlEWUIxakR1WGsrSmFnVTc5SlVCdGFNUGUv?=
 =?utf-8?B?YTVHcWpFbFFEZG9JK3JRWm93K0pwSUVsU2NRK0k0dXpRVG9aa29yeWFPRUhz?=
 =?utf-8?B?MmNsVkpMUnBxNENlVWZodEhNV0lWZDRuQXEwdnEwZ0o0MXpKZy8rNEJmcDJp?=
 =?utf-8?B?TGpiTXBwcml4UzMzVEtpYkd2djZPSjEyZDFVanNRTmltMkJlOWE4Qnp4MG16?=
 =?utf-8?B?eTRjTmh2V29BUHdjRnJzRGRSL2lmcUN3QU9kc2lnWTlJVXpCNTBSaG1lOTc5?=
 =?utf-8?B?SHhjVWxQMzZrVC9JaWRlMnpGV3JFRll5YXR5ZTBhVjkydVJvWGpuMi9FMFZm?=
 =?utf-8?B?UTkzUU1IYzg4LzFlVDk4dGhRdDNkck9oQmtlZFNMMDU1TlRwZUxrVFNSLy9a?=
 =?utf-8?B?QUo1WEJVWVU4cVMxZ3BGb3ZNM0w2Rm1DbGtNQkJ3ZWpVWmNPWjQrV0RxRTdh?=
 =?utf-8?B?eWNaYnVxWnB6NVhOU0NodTdKSFozRER2U0pkaVZ6VGwvTi96bmlyMFg3eHF3?=
 =?utf-8?B?NDAvUEZKcllUWTR5dGR2bVJFUllTM1dDbU9TQm9CS1BNdkMrcmVjbVdvc0t6?=
 =?utf-8?B?SmZ5Z0JsT3IvdkY0ZkJXaFF1bEE1WkljRmVjSVUxU2hnRnFJR1pXNzd0N2lM?=
 =?utf-8?B?d0x1bHc4QjJlMmFhbmthRmVFWjFDOVpuRk1QVklnbm5PU2NDS1ZPcGZISXEz?=
 =?utf-8?B?aHhRODhGWVJtWC9WTE9JTHo3V25SR1B4Vi8rMkxXM2JFY0VRVVMybktaRVhq?=
 =?utf-8?B?cjVjN2Z4TFFzTGYyNFg5TDNWclc2V2ErTzFxU3pKT1FUbFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEprQUZ3TFlXYkZaM3JuL3N4aU85S2puZCtNWmdVTnlwTE1aS3QvSzRVU1B2?=
 =?utf-8?B?UE5ZbnFYeWMyM0ZTTk5hbCtvSVRYOUIvSzZwbFhDY3lrWE9ZSG5YTFNSaUFB?=
 =?utf-8?B?Y0lOa1RIbCsrT1UvSC95QzJLS0RKMjBycTJEaGdIUkxrMUVHN1ZoSUUyUDlv?=
 =?utf-8?B?OG9vUWRYRHk4eVg4SENmRDQwbHgvTkh6a2FBMzJjcTIrTER5WDEvaU5nanRp?=
 =?utf-8?B?MGwvRlVsbGVtL01IQ2JZMjhwL09UaWZiMUxFMzVxTDd2emYyd2EybCtxcXhZ?=
 =?utf-8?B?a2FNMjNwYUhxUlNDb09tZUlrc0J4d3IyZHlHZmNXdEM2bjdQSHh3N1dMK29m?=
 =?utf-8?B?WHE4NVpRTGdJUHZER0JJb2FyNWtxNXdCVXRHVWJ5dEIzOXU4SEgzamtlN09T?=
 =?utf-8?B?V3NLQzlDTitrTUlqVHhmZ1phUEVQSlF4bVV5bmR0QktlRy9TVWdFR0NrbWFH?=
 =?utf-8?B?QWlGeVI4UmE3NmYvbDhXdXFPTm5lV2NleFJidUpoZlNLdXQyb1dieWVZQTZQ?=
 =?utf-8?B?TVhKS3ZzcXdIbEJnTmlDcmhKaENEVVJEUnBocVg4YU95ajlkREQ0OTkzcVI3?=
 =?utf-8?B?R2tibmtRVENEcS94ODErZnNVbVhvRzVmUW1OUXFjUTIyTWNPcENxY1d0YlB5?=
 =?utf-8?B?NUJzYXhRejdSeUVSUXZYQ0JlUjVoeWNNQ2Y4RUJUaHUxNDF4QVl1dXBIVzVC?=
 =?utf-8?B?K3VKNGQ4b2ZmTmUrWnZQZEZ5RW1uVGtnLzBGQm9aSnZseW10VkJPMUdiTnQx?=
 =?utf-8?B?Q3lGRW1oK09UZXlxNC93bVRCT2sxd3YwQlAvTXk3OUpjVTNQSFQ0T1BhSXhp?=
 =?utf-8?B?MjRsS0NONHhMTEdaTDRqaTdvV2cwY0s2T0NGcGpMMlpNT2FRWThBVUthcEhU?=
 =?utf-8?B?VHFYbmEzMkExclJEa3NtKzRGWW1EdTkzODEyVG1ZMW9MMmtWL3lQVmZiR3kv?=
 =?utf-8?B?VXNtOVZoWUNkMVlYQTN3Zy9ta3JKVWZjSC9tdktydW1iRDZmSTFTcFF4WFVD?=
 =?utf-8?B?SXF3NXAzWmNsRVJobkNiR20vUTMyTWpjSWxlTnFZZ2RUbHlEZkh2YnJLVDNV?=
 =?utf-8?B?RDJHd1ZvT20rbGE0aW1qZ21Ta0IzaVdwdHczUzBPcEVzNFJjM0pSUVk3czAv?=
 =?utf-8?B?QWg5aXpVVGJpd3FRZlVkdE1hRVM5Y1E0dktuY2Z4bVlRVlhzcm1iOGVISHlD?=
 =?utf-8?B?bml1Ukt4Z2xITmZEQ2RlWEFIUng1SFRBWE01czViNmlua3pJZWNINU5Qdi9z?=
 =?utf-8?B?T1duVnFXYldkRVBTdDdiQ0orZmNFb1VzdEFZY2tDSm5rN0tKVXlmaUZTaHNv?=
 =?utf-8?B?K1JGMzF0eGphSTVyV1NKTy9KeHdNSy95ODhaTzFsaHB6eHkxR0tMR2FJZEFO?=
 =?utf-8?B?RTJlNmE5bGNobktyVUI5dmlHV2pvVXZDdTVIYm9GNVVkbVROWlF3RDZUM3Vp?=
 =?utf-8?B?NUhLWHZqV1E5NklMOUhZRG9LTVF5TEYxRFF1bGdzZTRwNDVqZWFsZmFVdVZ3?=
 =?utf-8?B?OTV6UEtxeGVhb2ZlRDJVcXNCRjNuUVFrT2NneWVXQ2JMZW1JUjBnU3I2MjNn?=
 =?utf-8?B?ekIrYWFqOXU0ckd1TUFoRUNUVHQvNDF3SVc4dFNqcnpLYTQrdWxXNmxaeUUx?=
 =?utf-8?B?dW5hU0l1OWttRXhDUDZvdXY2bFNWMXRkVnJEb2xpT2J2eE9TenZHakdDS1JU?=
 =?utf-8?B?V20xUDFyWWVueUV5RTdoK21OWlU2ajk4Vnd4UytsYjBpT0ErZlN1OFFDZWdz?=
 =?utf-8?B?N0Jsb0V0bmt1aThlVFduMUZUQ0lnbGYzWVdBcUEzSExlTmN5SFFBY3dpZHla?=
 =?utf-8?B?cC9QOGdHT1plTFU3NndmaXRUZ3hESkp5MmM4RStHTTUvMVdKOSt5VTNsYkk5?=
 =?utf-8?B?aXlxaVQxMytTVjJwclVrQWlBNVdkQ3RwZ25rWWNGem14SGtzVEZaMXpiV2RJ?=
 =?utf-8?B?RWhITEEzQ1JmdWpYOW5JRFpTMGV0WkhFNXlpb3dyeFZjTFBRclF1YWN6ZlJa?=
 =?utf-8?B?dGo1YzF0UmNhSjVWUGJxZG80TWI5K1ZqUEZta1Erd0VWcTd2UGZia0M4YVZH?=
 =?utf-8?B?bEFDcUtpaGRWRkdibjJqMTJyUmNhQStEeVBXS1QwT0FJMnVscUFtU094dVBL?=
 =?utf-8?B?WjlUQVBmYWQzYmZBS0lMVVF6RHdRRkpqTUJUVHg0L1Z0M2JmbmMzY2JuWGI0?=
 =?utf-8?B?UjN4VDkvWVB2aHBKazl5MExBMVdEMHI0OWxQbFBxa0dvaWtHQzgzZURmN3Jt?=
 =?utf-8?B?aDdSWHYxeGlwdjh1NHN1M2xtRUVyMmlsUmNGRUdtcVpkRk8zT2prRVNqMHRL?=
 =?utf-8?B?aEE2UHN4Ym5wS2F4YzdTU2xzeEZFTDF1YjhSTUtydUdBTk1NMDNxOUFBNFk4?=
 =?utf-8?Q?faJxYqHOfw5SJ/YS/WJa189eNSu/I0mgsHj/9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1bd755-0489-4b1a-20d9-08de4c367ba7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 08:43:22.2787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbodWSQ1LMvWF4gl+FIYU5A1uJCAF2tDJbAyYTBnD2P1r7MBLv5ACwFtkvdv2arbYU40r4GSDdhGdLsHihUZt7AaNhGhn+MterRWCYwd6bgFyRmcL5EjWk7J87Kyjn70
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6726
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

On 22.12.2025 17:40, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/device: Convert wait for lmem init into an assert
> URL   : https://patchwork.freedesktop.org/series/159300/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72_BAT -> xe-pw-159300v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-159300v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-159300v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-159300v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
>     - bat-bmg-3:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

This failure is unrelated to the patch and can be ignored.

Regards,
Bala

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-159300v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_waitfence@reltime:
>     - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6520]) -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72/bat-dg2-oem2/igt@xe_waitfence@reltime.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html
> 
>   
>   [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72 -> xe-pw-159300v1
> 
>   IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4293-0b9ab258bd57ffe1b88e942940534f4bf5139b72: 0b9ab258bd57ffe1b88e942940534f4bf5139b72
>   xe-pw-159300v1: 159300v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159300v1/index.html
