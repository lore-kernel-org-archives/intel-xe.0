Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E95C55184
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 10:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358D110E159;
	Fri, 20 Feb 2026 10:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3+cpSaq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE8010E159
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771583763; x=1803119763;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wiBP7Cjz55PqNCFi12h5rAK2vamKB6oIBaLVwMPz7Ok=;
 b=k3+cpSaqpl+toa6B0nbegI9GPRYSFX23UQUd6vb3uSG0jy9Wn0exxW/v
 +fI+y7vQSZpgVCu+u8ODXmGuxrnbIgOSqmMG44vQqHHTNoUrhEwQUY3MF
 r7c11O3a64LZBmOteshfrUPpF3nT2pMutmOhGupFJeTgltXw9u2zvpJpX
 jyb6G975RSvs9+laJF3EdeyyJsjNT15zsd0ziFjqtQlEQREcAeBITKtev
 bH4ZBsnqPgvAWLH0Wz1oy2mqbuYg9wlNFetGgiwmkZ/jRYTU61YMQbaIR
 nTmIh4g/aO+NG4lbvZ6JpgVJ00tPiLVrTsU1D6RoPQpATavvjtkUFRcsO g==;
X-CSE-ConnectionGUID: nsIIrUsmTRugITQpw4KdiQ==
X-CSE-MsgGUID: gHmiRKuMSNuBe1yVvhV6qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72581162"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72581162"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:36:03 -0800
X-CSE-ConnectionGUID: 8djSw4kNS9CnQ6YLjNJfkA==
X-CSE-MsgGUID: +QDaHdrZTGSFhBaqXWapwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214671637"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 02:36:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 02:36:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 02:36:02 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 02:35:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/qusxUn17GO2/Y+1G9FhEwoInVK4Rl/ujzLc/OOfq9N1SlDFpJVpK34Ybzzb0c1Vji87rS3tXU1TCmKwTrMJ45A/f02iN1sL3oDN+B7yGhONpcQfUlba1p6lOtXFQtciNhdQq7PUFJSbUmpAKCMQrcYdyK6AjCNeIPhvEh1orPVB+FOIfIrYaCcBV1bK54LMoa02cEps0WHwU/x0em5nRUTI+vI847UsHanH/XeNmpNfsFo72lp8WTdUhFSEqm5vTWF4A/5mrMCo1O14pyYtHWal2p8lIRJ1nTbmUUzZ2AqyhFeQv4Qh38E8EEKqIf8ECDEy5uqU0j6vByzqTE/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXxSXNPfl4hk/8VDnd2665V5DhIP71keKbdSN/odLV0=;
 b=ZBJT5hCi5qmOgfg4zsgfK7bh6JXfb1VCtbB53s+EcepXmmM3/KdnjpZ8wo1HEUI9PT/5qCbJi++gVeYbeCwm31oZ+fM45TQ7A/iMcEQTTE+BiUOnIEOZOiu/9aMEpNyQ2ERjGIbhGI1kKjP7KS4Xzep8wH4nHtPJpPZRv3WNNCagzX66EONA5j4ZjIIw3i11BKT6FcuVjZvowryEnRYjsgJ/JXZLqOPXDBxvH2rtcuYVDFyuqn+dq5WPVVGmg7Ncr5NbeZtyiTOEHTx+8eJ9dS04vWw/0aggue19nqmH2dYCljwKz6BxMXSPCRLBfE+jCpQIINz3qm96jijMCMtPHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6872.namprd11.prod.outlook.com (2603:10b6:806:2b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 10:35:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 10:35:55 +0000
Message-ID: <3c654590-6125-45ca-b1da-d0a398564182@intel.com>
Date: Fri, 20 Feb 2026 11:35:50 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGRybS94ZS9wZjog?=
 =?UTF-8?Q?Allow_to_change_VFs_VRAM_quota_using_sysfs_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
 <177145124768.264211.2026521057912641856@a3b018990fe9>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177145124768.264211.2026521057912641856@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d47f8e-c48d-46ad-8a1d-08de706bd39c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnB3dVZqdncwSzcvaG50WldZenlGMEtibW0rTm5sckg5WEtwdzF0c2Q5YkdL?=
 =?utf-8?B?ZXNDb0p0Q2phM2FjdU9RbnBZTWZadjlXc3NOeDhVRjNGSzd4N3JBZlc3YjBL?=
 =?utf-8?B?TU42UzVTaElZMW5ma2dpakl1MDhNU2VnK0ZwN0dmM0xaalNVL1RLVkxpNmRV?=
 =?utf-8?B?QUpXVzVVUEpXTWVGSWNmNXBEVzVXM1V6ZklxVWJ5d2xBMmVEbXBlMUtaMGNl?=
 =?utf-8?B?WU9YZTZPTE14aWVHVXoremszYTVldmlHallFeUlvSGVEbW43TElTazZiQXlV?=
 =?utf-8?B?NlJyTi8rL2x1ZVM1UXNoazlCWHJKOFNUTWNxREVENktGSkZxWlBIT2JJbU5z?=
 =?utf-8?B?UGtGK0o2cmN5dEVqRDd1bTBiY1J2S2JmVnBXekJxOEJ1MitSNTZtdW5DUDFh?=
 =?utf-8?B?Qm5KRTdIZURSUTZtRFJUei82alVmaGtGc2ozUm9TN0RoMHU3VDM1SmVDOEdR?=
 =?utf-8?B?b203U21mamE5U2xxM0RoaWRoNWtTd0dLWXlPNXdoRVVGMW1yL25ITEZQVDlX?=
 =?utf-8?B?cDBnUjhKcmcrZW1PR0cxWHRLdUJvdnhCZUVFVUpWdFJwa2ZzUE85WmJIa05m?=
 =?utf-8?B?Wm4xRklFWnY2NHd2Q3Rxc3RYRlVyT3VKSU1kcDRxaXpzeEZVaHRjdXA4eSs5?=
 =?utf-8?B?VERJeEVMbGR5VGoyUUd3c3VVc0E1UkRDRXdrbDF0bTZ6TUc1MDRsRzQxZUpQ?=
 =?utf-8?B?b1ZyaU5YdWszMmF1Y1JWZnhzQnRwWkNLekFXUEovL25JKytnSFoyMW5YTjBv?=
 =?utf-8?B?bEZ2cS9pNzRQWDkwK05uUWQwYSt5ZHBTTHB0Znhqa2hnaERRekxIQjUxZXJr?=
 =?utf-8?B?bW5EbUR1VmllV3R5d1QvS0s3YlhtWEpKQWJ1eVBJc0IycGJZSVlkYTJyN3Ax?=
 =?utf-8?B?Ym45RnNzaHBnOHhtZ09PWndOWnlqUHpWYVBRMldaY2RPL3Z4SEtETldXa2g0?=
 =?utf-8?B?S2FFbHB6S1N1OFdFVHNjbHEwYnhVYTUrdDlQblBSK0RMSHQrWHl2Q0s2c09Y?=
 =?utf-8?B?VTcxTytwLzFoeHJtSm9pVjljMm82VVo2S215d3F6VnJVYmNjSHozTUF1QU5l?=
 =?utf-8?B?bjArNHpQYk93WG81c1BTUk5MTVQwVEJWd3U0aVhibEg4UlVSd0NTRkJxSXNz?=
 =?utf-8?B?VXZEcVVINU5aZ2c3am1ONjhzUS9CZFc3R3NWNmllSC83ZDErRzFVRi81UFJD?=
 =?utf-8?B?MHRGOUc4MkNtZ1lhQmJMMEZMeGMxbVdnSlpTY0FjL3dzVUxGYVhDYXQyaU1Z?=
 =?utf-8?B?R2pHSDhyTitvMmlSRUxmbUx3SHNMZWJwUXNVV240NUF6eEQ1UFBEeWlWUjA2?=
 =?utf-8?B?RVVORFVLV3poaFRvaW93N3Q0ZWRLaEVrandoVDNjNC9rVzlBa20wcXVscnNM?=
 =?utf-8?B?NUhiRFpWOUhWNWdzODFkeGJKekVzUjVCWWNMU3NCMTAvQjJ5c1hOTlZIUll4?=
 =?utf-8?B?dmFteExBcHU5bm1pRDJKcHoyV0FOejVYdWlqQ0VKbEo3amJESUczNURUL2NZ?=
 =?utf-8?B?eVp5TWs0aXc4NklEbXo4YzVta1ZsQ1UyOVBvcXorSHd6T0lGS1hnNHA4NUI1?=
 =?utf-8?B?VkFVL1RESkdMTGhNc1NMQkdDQ1ZwU1A1NGwxbTMrK0hPMlBvT1UzajB5NkRi?=
 =?utf-8?B?S1lNSjQycXZsN2tYMllPRlY3SVNsT3VBd1czMG5xTnpEUEFxNWk0NzBLdTBp?=
 =?utf-8?B?VHpyZ29wNy9EWWlxalMrMTZmZ1hweHVEMGwzTUNlVStoWXVpdU8wVUhnZEpw?=
 =?utf-8?B?S2dEVytnN2hHVjZtMmU4alhFOHU0Q3gvb09IZlJYZ1FPVEx3Y2tCdmdwU2Js?=
 =?utf-8?B?RDArU0ZXUXM4S2FtK1ZCbTZMaWFIRE90SUQzSm05aitHQ1RCWWFMRm5hdFFt?=
 =?utf-8?B?anladTlZTUcxSnhVL2JSelpoWncyYzBrUjNYaHdOOGY5RkpCODd5eFU2c0Rm?=
 =?utf-8?B?RmROZXI2YThOdnBVcGhNcHRBbjkwbXFMa0tlQUFlNTEwcm0veVV3dVRTZzBy?=
 =?utf-8?B?M0ZhTW9yL09UeWlERXc3YjI3YSswVEVSc25tWFhMVXlMUzd5S2t6cTlsTjFh?=
 =?utf-8?Q?QQKvsj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDBXOXhaSWZYQlhZVURVWVUyWUNuRVZnd1R6eXdOdzdRZTNnL2lHUVc1RTkw?=
 =?utf-8?B?ZWpZbmIyUXFKa3JBeVVxT2pUeWFGQUhlQXQvSGorcHc5aXZWNGVBejNTb0dm?=
 =?utf-8?B?anROOWEzdkZPZkxGM213L2M3ZGdBMDRobmFobXpPVEl5bjZHYXl0d3JUNnBW?=
 =?utf-8?B?SndtTXRPWGdlY08yeGFGcEdaSEQ2T0FFNzU3TFYxZUJkbTgycWE1Q0VXdlND?=
 =?utf-8?B?K2dBdjBNdU5STSt6S1dBdk9TeWRkMVdObldTUnpnTmViU3UvbnM4ckhqZEto?=
 =?utf-8?B?YlA5RVNBQUJxUi9DNHVReFN3VjJmMnpORkdCM1ZlZEx2VHk1Z1c3cGc2aDI1?=
 =?utf-8?B?YThLaUlhRm8vUFdRWjRLc1F4ZmdMZ0FWY0FoMmFkUHNhanNPck1zYiswR3JB?=
 =?utf-8?B?SnlGckR4ZTJkR0k0Vkx6UlYxU21uU3pxZTEzMnJKUEVuR0dFRExvVFo1WHNL?=
 =?utf-8?B?WDBTVFptbStxMlphS2dKTTJIYncvbXR6NC9lcUFrWTNMdEszd3JHQWRwbENS?=
 =?utf-8?B?bWg2RVpaR1hyVjJOaXNUVlJuTHcvQjVUT1V3bkwrT1dIM3lReXV1SllYVE5v?=
 =?utf-8?B?Uk45SFBkRDVPN3QrWEJ6RG1Tc2JXTlRpT1ZZRUovV2ZCTmhvNElSVjMvNTh1?=
 =?utf-8?B?QWk2RGwyK0IwcDQ1d0VIelhCTzR1OW5OVGIyUDZRZlR5K243c1FOUmt2K1do?=
 =?utf-8?B?L0YwaGFiWG9DZzBXcmlCY3ZhYmxGODczb3dzK1dvVkZjZnhyWGwwdnBlQ3lJ?=
 =?utf-8?B?akx0NWV0ZmxJaEFmV3VFQmVvMzRuZVBiRDRYdkd1Z1Jsc1VBMlZCWmVZWE5p?=
 =?utf-8?B?SHUwcXI5VzN5NDgzZVY4Zy82d1lnNmpsaDZ5S2ZhRVVWZkloUDB2REkzc1JB?=
 =?utf-8?B?SEZTNSttZDI1OHRONHRwRGk4U2NNVUJFaE8rSUY2ZXFaaDg5OWRVT0dIYjV5?=
 =?utf-8?B?Tk1RNWxpTTdKL2NzaGdtbjgvNXo0aXYzM1lBcmhnRGFRL0FBNDdDb2lFeHFW?=
 =?utf-8?B?TGlWWTZZQXZwZW54SlNCVE53Rm0wV04waXZyRDJkcHIyWitTNnJ3MlY1QklN?=
 =?utf-8?B?V05ZS05rYS9pMU5uc2JxSHVESEUvLzc4TW5IUTh4bzdGSS85OUJFRERtUzcz?=
 =?utf-8?B?bWMzMzdmU2FFWXZGcncyRHBseTdnYmV1SitjTDNWeGRrUmJLM3ZvM1piNmls?=
 =?utf-8?B?aElaZitzSTdaVUsrNGdudjlzb0NuUVNnZmdjYXJuNmxFM012UVY2c1liMUFF?=
 =?utf-8?B?eVhzL09jMDB5cUN6djZ1MVhjKzhzTnhjc2NuM243bXlqZExhMnZiN2NZK2s2?=
 =?utf-8?B?enFJTWJEKzE0aGM2dEM2dDVRYjM1U29pQ1Q0UDVsYkZZTVM4dm8zcVg3MWVB?=
 =?utf-8?B?bUlic0dmdFFpME9vNDJLdEZQSG9RVk1PSCtkRnNXekQ5QjR0OEs4UEZoaHJn?=
 =?utf-8?B?QjJXMlNZQkUxUXM2aUJTUWw4NllPcmRhT0o1cmE4Sm9oMjI3TXhSc3M0d3lF?=
 =?utf-8?B?NDRMWXFCU0I2ZEFyUUdQSVRoUG53cUdoSmVUS1pobm9oZStQZ3pJMnBiQ0x0?=
 =?utf-8?B?NTB6clVJNXUvbGtTV09XcW13VjlVYUcvRkw3anpxV0gzVEFNNE9CVldDcGVw?=
 =?utf-8?B?V2hwVEtPSXZabStYbk9WbE16bFRQcHFhcEQxT2EyL3VPTFV4STdzY25veDNW?=
 =?utf-8?B?dm56YmlPaDlZUHJvdDdQYXlkUnhYK3h2eW9xYUZRZGVYUldwWUk2OGVsN2dP?=
 =?utf-8?B?ZXFORmVVdG9DMHVWWnZLUEE2cVY2Um1lU0NYUW5oUmh4QnZTVTNIRUFvRit1?=
 =?utf-8?B?NEJndTI5QittSUN3a1I2UU9SVzk3c1FVTlEwellhZ0l1Uk5GcGhTbllvektz?=
 =?utf-8?B?Y1lDamFNVk5rcEZrZzd3d3ZtTG1XMVo4MTJJaVFIREhtaG5xQ1dSbFdpNUJl?=
 =?utf-8?B?N2RDVlAzQWlBZExDemNONU43cU9lZklUMHh3elp3L1c4RzNXZFZoekh2Wm96?=
 =?utf-8?B?YlZPK2NiMEdpY0Zsc3FubEhOLy92WEw5ekN4QmxhRUtoWHltMTUxeERsMmlF?=
 =?utf-8?B?bDVObGlwNEw1a3lYSTdXS2swTEpacWNMR2c0ZHVlMUloQXhGaUdmdWNSUkR2?=
 =?utf-8?B?am5sMWE3bHU4Wkg3aHJJQXN4U3BkVTNvd3dyaDF3VzFxb2RyQi8yWG9kYmFr?=
 =?utf-8?B?aVFHd0NLWnI2K3hmakNXYlplM2NZa1F2Q3ZXSURzOStUM0RpWXJWcVFQM2I4?=
 =?utf-8?B?RjBtcmNXb3ZIY1FHRGJNOTFJS3lSM1B1VVJGQlk1TGdOdkl3K3Azek10N0p4?=
 =?utf-8?B?cGxZOXhLYWVnYU15Tk9QUjk4WFdnOTk1dzQwSnpoemwycmZkOEUwZGd4QlU1?=
 =?utf-8?Q?sZK1XFvEfzHx60f8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d47f8e-c48d-46ad-8a1d-08de706bd39c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 10:35:54.9707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yU7RxSF2OVJi3ybQ/aNSzX7H1OTZuSLt8RIY7u0cfQlNoeCTerl831Dmq+g9my5pNcR3rLZvywmqWfathvwpEtz3xk/y+rnxfqLA1r6uQYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6872
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



On 2/18/2026 10:47 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Allow to change VFs VRAM quota using sysfs (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/161625/ <https://patchwork.freedesktop.org/series/161625/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161625v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161625v2/index.html>
> 
> 
>   CI Bug Log - changes from xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5_BAT -> xe-pw-161625v2_BAT
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-161625v2_BAT absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-161625v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (13 -> 14)
> 
> Additional (1): bat-bmg-2
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-161625v2_BAT:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_evict@evict-small-multi-vm:
>       o bat-bmg-2: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161625v2/bat-bmg-2/igt@xe_evict@evict-small-multi-vm.html>

must be unrelated, looks more like a glitch in the CI

