Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E776C7115D
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 06:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2D810E181;
	Mon, 23 Jun 2025 06:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WAs5TCZS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4403210E181
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 06:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750659687; x=1782195687;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zhcbfhaJEQEbsZ7gkyz/0zoeV+PGBOhliewpT1Oxtm4=;
 b=WAs5TCZSdIMM5ugBU5aeMueiHxjYtbrvmfTQ4WgJBwaRQsTNrMZAp2wb
 CyD3ix3v0Xha/oHruZxy5MDtT9xjv4Q2+x45Z2tWeZlazqvl/2dLnrPnu
 dsf2Y/xSCJIF1QXrAxGk4/Zir37WhwBHZQUtBpNYDD+hIwnF225HPy5EI
 z8lk4QwJd07VtFERDQ4oLKPgTf5VQikp3yOn1hTGKhCowviqm6aoWcpGM
 tnbHFqW7diCJrqk/zyd7KGHqOi+qOb2sxDoZloO5Y0laa4r6grBrQ2OXo
 4aLd3DpEJPbo2TtMHClUKpjN1CSLZtAMnvdZALRryUuOycuVx5D3PEpH+ A==;
X-CSE-ConnectionGUID: RN0IwmsqQYK8TEDWPdSATw==
X-CSE-MsgGUID: 4wOAPiW2QwuO7VaxrK5FHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52820525"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52820525"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:21:26 -0700
X-CSE-ConnectionGUID: b5/MoTxMQKixhNpFKlzyYw==
X-CSE-MsgGUID: bmWOnogRSy6lc/i5CFJohA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="157002116"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:21:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:21:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 23:21:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:21:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdOUQXlflrMi7M0XHRp4NPM5z1miLG5K1sYKmjoV9Di/m/dpq2/UYH6+8xNdrRml62z7zTtXPotntysx7bHHi4pseILGXSTXfWmj+3kmk+VNBQ8tjqKDdGatTUFnV5sNS6dRtDLUZUyklu3UYch06oo9rywPbPq7ef6NZjD2HMIj0FzNbLx/+sQV/cdGuPPg2D7pcrs+TE5mYsTTZVFSk9xPIxHVrQRKN9MeqHSGhg+KtqiJlI8uL6BDU1euN1g5CcILWvM9L3TZLaNVqoFekxjJYtjhDdCFSNvsH2l1fUt+CWUM1vTspqFP2kNAHcOAGloVeYzWbUzpV3WkJvbkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0iP8P/MIXlk/2nvIpT0evYj83z2Kr6ZPmGKZgonBjk=;
 b=bqExIbDxLMx0W7fd8R9CBF2zrJATqNZ8fUjIII0tIjIikycmzmWcs68fawF4izKLGdPW577w1Bc4MrqCjLsS3sSX8kvhcR/zIGHLQfIcmTshtDSONg7dshPwEVkbdQXBjQbldxisC8XH8pur4s1gsYoQEDBoY64iVNfFa9UDF5P5UYbhrljMs/cuPrr5fktCFBhuZ3s/9wakYR/BLQaxZ7LmKqkftFAu5XoL0tHZDD0xSnNXvX0FEWXj4x+82ssrd5pAKvgzhAqNkKa6vislxrNvGFVhnbok1MhvooDeu3KtBLSTaGy4GVFqW+iWg8NcRg6t1ZwAYymDAJ1FkMpwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MN2PR11MB4520.namprd11.prod.outlook.com
 (2603:10b6:208:265::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 06:21:22 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Mon, 23 Jun 2025
 06:21:21 +0000
Message-ID: <75f7122f-fd83-4ee6-a8f8-2901a9cfde16@intel.com>
Date: Mon, 23 Jun 2025 11:51:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/20] drm/xe/vm: Add attributes struct as member of vma
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-4-himal.prasad.ghimiray@intel.com>
 <aFjVisKVDa1g5THP@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aFjVisKVDa1g5THP@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MN2PR11MB4520:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d99ba24-fa71-4819-43fe-08ddb21e2c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGhCMzRFbWZ5MGxxSzV6RmpBUklBQkp6VjhwS2hKS1RTZFZMd3k3OXJhT2RK?=
 =?utf-8?B?aHhTMGZJS21xS2w3REorV3M3MkFDYlZpZ2gzdkw2eHJXRjRqM3IyMUUxQk9k?=
 =?utf-8?B?ODdESHFuNHoyZ3JPZWRHbW5GbG1uZ2I4c3ZHYlp0L1Rtbmt5TTVtL280a0JS?=
 =?utf-8?B?MzlzS2g3b3poRUZOY0dqY2xyWS8zelloYzlIaEhpa2htK0I2RFVDZS9BQXRN?=
 =?utf-8?B?aGtrd1hoMnU2UStXN2Z1dlZTTVBTTzJZQVJmcENxTEtHVjBJY0EyYlZRSGpY?=
 =?utf-8?B?TXFrblNkMzFqOWR6Q2JxVzFGMWNNSVRTTmg4MjFUUHU5bnJ1RHpIR0xIbXBE?=
 =?utf-8?B?VW9jaGhMd1BhSEJMWlQ5SWp0VUo1RG9IZDdESzZHMWttSjhteVpLaGlVMHpZ?=
 =?utf-8?B?bUtSZUtZTUoyUXNxVWdNRmhzVlg0ellHRS9uejFwQmR3R0J3UUphWVllYmJD?=
 =?utf-8?B?eGl2L2xNRmE1RUV2eEtCWnFXSkpDb2c2WG9ZQ0dFNldSdTNLd1BqcWJBWFVU?=
 =?utf-8?B?aEFuaHJRNzkxZXFMYmRXSXJYajYvaTdFUUx0aEIxS0d2NkRWQlFtSHEvaDFI?=
 =?utf-8?B?OERMbmtKRzliVnl3NGxUaXA4Z1pXUlNhdEM0Wnc5OENZRkgrMGQwSVBFdENU?=
 =?utf-8?B?SkVWRWRaQjRVTUkzZ0UvNjZWOG1mRWpldmthOExFWHg4cFpkWlY1K3VwbEFS?=
 =?utf-8?B?d3ozeGJwSkk0U20vZGFpdUgrOTRXR0V3UGgyMUt6S3Z6UEpSclJwWnR1NDM3?=
 =?utf-8?B?cG1VVW14KzRmVmhKY1RnRGhmQ21kU0lPYjRBTzFIZ29ldWhXd1NmTEpEeXo0?=
 =?utf-8?B?ZmJZQkJsUG5NZkJpSVl1eWoyaHF5R3kzM2R4bUJOc3d1UDJnOGQxNUxFdm12?=
 =?utf-8?B?UEliN0RFUDFDMkIxZ1JHN2RPMUNRV1d6TTY0dXRSWWYzVzlOQ2pkNktVNTJU?=
 =?utf-8?B?d1l2bVY3L21TbHphZUJMT09FaDBNVHRZNk9Eams1b2g2ZmFscXRPQ2h1RzUv?=
 =?utf-8?B?ZmgyTDBGemlqUEk0K0tsSnE2U0VyMHFWeVRhOExicjJDVHNHMjRvYTlxaWRZ?=
 =?utf-8?B?S0U5TExQZlJYczZUZFEwTFNjN0lRTWtwV2wrRktzNDVUV0pHR1dOVHpZY20z?=
 =?utf-8?B?L0RjcnNwaHA1MkZyQkp0S1lnYVZZZHpJM1BsQ0t1RTJBZjFjcVBqcTgvY0s4?=
 =?utf-8?B?b1d2Lyt6TzFDRjBGUm1XbjBoNjVBUGZ4T05sU2ZiOEZzMWtlY1dLdmJOS2NZ?=
 =?utf-8?B?UDJDbzhUY3lYSnVUU005QXptSEk5Rlo3WVh6YlFiUzNodzVqZ3N0Ukkxcm9t?=
 =?utf-8?B?S1dIQjhjb05ubXdWTVg2bUw2T0NMUGhGamJTRzhrbnpOM0RvVG12Uko3ckRQ?=
 =?utf-8?B?alQrb1VlZnhTR1N0MVBHQ1J5WXpMaENQNFVQZDRnM1E0ZHVXRXMrYTZVZUJX?=
 =?utf-8?B?NXhuOXZBM3lkWkZ2TE82OWRPRER3eDExMzFVOGFacllmcDdjNThxNVlmOWpD?=
 =?utf-8?B?ZldYV1NzZDliOFBRVkRmbXFVRkJLTmRkVmdaeWFlcmFmeGhhOExPNjFXYkdN?=
 =?utf-8?B?b3JTZldLamJpVHVKbUVWMXdTV2owaWw3ak9JaFRxc056a05uL3Y2eWZycnRE?=
 =?utf-8?B?WFN4bkRrbzVPWmNYTXpLNkZORklWOGoxc1dnZFRvd1QvblBnUkt5THZ2dzV1?=
 =?utf-8?B?NTlkTmFScXAweGVQSmZqN2R0c0w3Q0lkTm05eUQyWlg4dTE4MkFIckhwc2lI?=
 =?utf-8?B?azkxclRwQjRKdXh5c00wVzlCQmQwZVlWS2dkc0FaVDJDamlhbmdQK2pYUVlC?=
 =?utf-8?B?WDIwaUN0bHVGdS9oR3Y4NnlHUXZHTjdMRmxnN1ZDVnRFTlVIR2NqZmdCU0JV?=
 =?utf-8?B?YW1DQVBoYUVGMDRGOGtYdy9ueGROSnQyeUNKOXhOdml3MWxMZ2hBR01KeU85?=
 =?utf-8?Q?SJGEZ+TvrIc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ti9MQWlTcVMvN2xLbWhkM3VOcitRSVlmeFpyOUV3dFd5SHVYbWVLbkdyNUhP?=
 =?utf-8?B?YnA3TE53alJ0R1Z4ekZhVmdLcWlnOVVRNHBUdStPREJ2dTFIcWZJL1RkVU54?=
 =?utf-8?B?ZmRZY01CVWFqc2FDR3M0OEZ2ZFlZY2FxSGZPUUJ4UGdLUjNleGxWczUwVWQ4?=
 =?utf-8?B?MnFsNUQxZXZsejZYOXN2c291VjhFZGp3NUtxMWdSUmJ6YkZ3S2xEOCtKazVt?=
 =?utf-8?B?WlBzYnFQUlNKczdIZHJHOHFsOHJjVlUzNkErVHFFdHhzNktFYzE4aTk1R29t?=
 =?utf-8?B?cTZyU2s4eC84WTZqOWxrNVNkd0VJWnlSdTZlWXJVbnRYOHhTZFgrdExjcXdC?=
 =?utf-8?B?YURDQUNvWWl1UlR0N0pZS1drcUQxb0tlWWtmajdvczI3RWFxTkYwYTk1dlAw?=
 =?utf-8?B?bW9vbXpzNWxnMENKWGRuVDBYa2lUYVNBVkNaM1pjYnkrU20wRmpFRkFsclpT?=
 =?utf-8?B?Mk5uZ3RlazhTYVBSVC92aFF5aFBHdWxSM0tBZ2xSZzhmR0FCakRpRHl1aTVY?=
 =?utf-8?B?eDVwbVB4U1ZFaG5zMCtHNkUreTU0cHVzbTl5Y1R6UmM5cGdoako0UFluRHBn?=
 =?utf-8?B?eDVrWkhIY05VcTl1bTRqRmY0blBEOTBKbUlQZWdzVzZGK0cyU2lmWTFqUmRL?=
 =?utf-8?B?ZnpTTnlteVdORE1IUTNheXE1NndmY042dkN0eWJFVkVjWmp4NTN0M1pNTkhr?=
 =?utf-8?B?RDBCSXFIYndNTkRocmNrZFJyc3hQZnlZVnB6cDdDVU5sMVAwei8yUUNreDBs?=
 =?utf-8?B?Q3lZM3NqVC9YMTJyNDJjMzdjeUdhS1ZDWHJORUJyK2xNNGwyODY0aEdoQzlq?=
 =?utf-8?B?dmE0cjVleTBpWVU2bTd5dVc1RlhMSXdtWEZ3c2NQZ1hrK2xUenpYc1pOZlFx?=
 =?utf-8?B?ak9zVm42UWdPenFtamhIaWV2dW9XcXBIZHIwL0MvNlIwWWhManVVaHQwUnZ1?=
 =?utf-8?B?Y0diQTkyNGQ3RDBGMjJmQ3FWZFlXejVmUmQ0ZnJBdVFRSWRlRUJ3NXQ2bkNM?=
 =?utf-8?B?dUdYVmxOTE0xVUpQeHpaYmNTbHFVdVR4MVYwUzJtdmZyWlcyVTlheHczcHRY?=
 =?utf-8?B?VTdkS08vTFRJZG93NjdieHRCY0pCcmJnV0lNbVgzTXY0aUQrcVRJQXBqZVMy?=
 =?utf-8?B?ZEN3aENDSEZiMi9SdkNrQjZEV2xrVWZ3a1JxdTk0Y0p3bWY2MnVCSHZFZU5J?=
 =?utf-8?B?T0QwcmozMUN3TXdHVE1CZTVNVktZZVpzdloxUmZtSjl1TkNQRGN1QUt4SHBN?=
 =?utf-8?B?aG9NdTZwNG1keDlFbmx6elM3RU04K0VYS1UyVllIRXdtdFpzTUhjeXRtWE9v?=
 =?utf-8?B?MW81djlFMEhGWG80QmFKdGlHcHJCQmY3V3gxdCtBUTI1S0FoUm1uWVBsNlhi?=
 =?utf-8?B?N1lvb3hYVlMzd29udUNhejhsWHZVaktqSVZ2bWk0Z01jbk0vTURtNkxoVHJF?=
 =?utf-8?B?WGcwUEJPdk56dWhES2pDdllQVXRlZDJRbWc0M2hNZGh5azdUcnhBRzJwSGFq?=
 =?utf-8?B?L2ZUSTRKNXZ4VzVCUkJUV3JsVy9yVlhqYUJmWHlKQ3N5WUV4Q2EzalNkNXdY?=
 =?utf-8?B?MXVSOXkya2UxYysxU2RZZmNOcnhucWRBYTRDZnNkQXRuYWlpaDFXQUMyNjFm?=
 =?utf-8?B?MEVMS0QwcGswWTVDZGxoelZxc2VPQUVHMkVWZnQ2VTBmdzdBZ0ZiaUJFRHg1?=
 =?utf-8?B?T3VYNHRUektVTXN1UUwwMXdOR2dSeS90MTFqV203SmJHdWpUTWVObTRtM3ow?=
 =?utf-8?B?VVozSXFJZG5DcXZmemp5REpqU0hnK0dRVmpqSUYySnkweURUemt4ZzEvRmtv?=
 =?utf-8?B?VTJSNHAvUjl6Z1hSdG1JZ2NvZ3ljRVpjcWtFYkMwYktZVk4xSllaTXpvZVk3?=
 =?utf-8?B?MjZTWmhSQXowWEVSc3J4aEdTSkNQbWk1a3VZTXJmeStKaVB5KzY1dG1CZ3k2?=
 =?utf-8?B?akJpcTBiSktpNVhEUHE4cjA0VkJCbjBHdHhhUUMralIxMWVNTUdtQ0dtZCtT?=
 =?utf-8?B?d1B1M1VQa2lwckl3eC9VT3NaTk5iMUdpWWgvajNaNkQ0bXFWaVREWWRHczVF?=
 =?utf-8?B?eG9sTnhkR1F1eGp5ZGd4QVh2bzdQT2RkZThzbXNzZ2JmSHdad3Q5SWcxdFNO?=
 =?utf-8?B?b2MvbW5aTVRobVlXZUowMGc1M2V5S0oyMTRQZUJsNnRkZTdveWF0d1RsOXRZ?=
 =?utf-8?Q?fv9zcDziS5kFjZI/U2YeQNg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d99ba24-fa71-4819-43fe-08ddb21e2c1e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 06:21:21.9280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixYVq1DZfJ05yNWE6gnBvjvDMoegHJpQ28aQDu74NKo7ppTqojnGyk9ruHmLMZleIsbzaWO0VR/Bu6Lz+5NXqA5W6uj8VRjDzwpRLgoLMuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4520
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



On 23-06-2025 09:48, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 06:25:41PM +0530, Himal Prasad Ghimiray wrote:
>> The attribute of xe_vma will determine the migration policy and the
>> encoding of the page table entries (PTEs) for that vma.
>> This attribute helps manage how memory pages are moved and how their
>> addresses are translated. It will be used by madvise to set the
>> behavior of the vma.
>>
>> v2 (Matthew Brost)
>> - Add docs
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm_types.h | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index bed6088e1bb3..c7663058a7e3 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -77,6 +77,27 @@ struct xe_userptr {
>>   #endif
>>   };
>>   
>> +/**
>> + * struct xe_vma_mem_attr - memory attributes associated with vma
>> + */
>> +struct xe_vma_mem_attr {
>> +	/** @preferred_loc: perferred memory_location*/
>> +	struct {
>> +		/** @preferred_loc.migration_policy: Policy for migration of pages */
>> +		u32 migration_policy;
>> +
>> +		/**
>> +		 * @preferred_loc.devmem_fd: used for determining pagemap_fd requested by user
>> +		 * DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM and DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE mean
>> +		 * system memory or closest device memory respectively.
> 
> Nit, I generally prefer 80 character line wraps. I know checkpatch
> allows 100 but in general I think Xe generally wraps at 80 unless it is
> an odd case with nested code and an 80 character wrap makes the code
> unreadable.
> 
> 80 generally allows 2 windows split vertically in vi on a typical laptop
> which makes navigating the code a bit easier.

Noted. Will address it in next version.

> 
>> +		 */
>> +		u32 devmem_fd;
>> +	} preferred_loc;
>> +
>> +	/** @atomic_access: The atomic access type for the vma */
> 
> I'd reference the uAPI here. e.g., DRM_XE_VMA_ATOMIC_*

Sure

> 
> With the minor nits fixed:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks

> 
> Matt
> 
>> +	u32 atomic_access;
>> +};
>> +
>>   struct xe_vma {
>>   	/** @gpuva: Base GPUVA object */
>>   	struct drm_gpuva gpuva;
>> @@ -135,6 +156,13 @@ struct xe_vma {
>>   	 * Needs to be signalled before UNMAP can be processed.
>>   	 */
>>   	struct xe_user_fence *ufence;
>> +
>> +	/**
>> +	 * @attr: The attributes of vma which determines the migration policy
>> +	 * and encoding of the PTEs for this vma.
>> +	 */
>> +	struct xe_vma_mem_attr attr;
>> +
>>   };
>>   
>>   /**
>> -- 
>> 2.34.1
>>

