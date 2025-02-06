Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B8EC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 17:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797CB10E8EC;
	Thu,  6 Feb 2025 17:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsoSe/+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D1510E8EA
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 17:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738861792; x=1770397792;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sRKplCXjmK8gCAvS1RaifIqnMdtNbYAtm/K5vqBp3pg=;
 b=CsoSe/+AAuRDpuRL8iIdmsJt5B/PMoY62TSde5nzCFC4UJqT6Kwrfo0s
 SYJgrr44pXI4SvwWsrs20LjSi5LeSf4+xEwVOFy6vY6NmO1XZLTVG3iMN
 3b5MB9863Eq8zfhYKklZloZnMJBgaBd06FOCxxIKm+uWrivLmdHxO8cgI
 veVYvK9fN8enQZKllkWITvoJatEZdkd4HynvrsjPhUAyO/CxdsKwO7KbC
 9jteowDdgezcpeJ3hue01xBdqKiZFvRIxVWt/IhntNqbNF5neVvF9Azjm
 nd2dWfukuYXQzZ+X0ZYebNwirQMGaVXnwSQmWxeuSIrOAexy1vkNBKsIM g==;
X-CSE-ConnectionGUID: rC0Dqr0KQi+eYhqE4108UQ==
X-CSE-MsgGUID: 3JIvja7gTZuJ5/vfML+YTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64832786"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="64832786"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 09:07:13 -0800
X-CSE-ConnectionGUID: Rw8YSfakQS66CWgIn9sPhg==
X-CSE-MsgGUID: aj9n08D4SZaXFISTJvuQhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111045940"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 09:07:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 09:07:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 09:07:11 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 09:07:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGjQe9Jf/hcLNPgsYjlx6I1lznOJGjKUUCxyBORKnc8M3/fIAmeqiddfHfz+CvPSwjBpAU9aXJ8JFEPm1k+fDqOX1luu15mxu1obq34Hl3rWixIV3k+UBGqHG7Nb6hn7w5hlOKcGWs0rqBm3weI1rIUVA9lgNJ+kqbJ3DDGLyiElY3MLyju2AtAcjGlH69EkH1HJDPkIrx+L18WoqxN8M5dSoCDkg55FX1/HoGDB5OHZw8C34a/G5M9/BTtU2tuurer3jq716AzbGbIvQkeoG6HGzW4/XYU1+o0dBv2ixoldoDmWJqG6XGyPtQtN67Thfxozf+TSMlIKuhG0adtHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIWJhWrifZSc5g38ntSUdXAFBwetuqkqhBwOjP0mKMI=;
 b=qsWKetsj99OIK3Bn6NkLyvFvU4XdPbV5qCac3E4e3jwQRbaOzQNoi4K2QYezWY4M0/hCW6JQUwtuGmSsAKy2pHWqUAPOb68QlZlp2u2BB7rgnuZEU/5nkpeqk8HkI/F5VqtOEaIoI1Eik2+Z1HLsoo09+v+5k5KDzFJBCO5NTmfpCfUoYaEq1kc+GH/NxrvqXxVwt4+uhvyP6lkoHUYkLJxU5FC7Gc8qGmblqzskEO51raM+OozmhxM1xC4WLul54xRJ0ndepzVbGr+hV1rNYi4PrK7vU4kPh8WYUuIEFW4ku6wpSHPzN3jV0590MSBxqVNxBSny69rGVeHTLI+4jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Thu, 6 Feb
 2025 17:06:54 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 17:06:54 +0000
Message-ID: <e951a82b-a01f-4984-84da-ee16d0a71e93@intel.com>
Date: Thu, 6 Feb 2025 09:06:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix PVC RPe and RPa information
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250109195219.658557-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250109195219.658557-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::32) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|BL3PR11MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 54053be6-51db-4091-2a2a-08dd46d0a7de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2pXd1AybFFXTVlISnZVOWNUekJYWlI3NU9HYnA2Z29LK25RVHdheEF1YXlS?=
 =?utf-8?B?OXhTdGZHTStIVU51dzFVWXFWRkdQUElkdXB5Mlg1RDlKSGZ1Z1hLQklGZzRD?=
 =?utf-8?B?bENDMVZsaVN6bWliOHI3bGROaTVRVWVMWXgwSEgwSnprcmhwNkpTY0pPdmNQ?=
 =?utf-8?B?MVNxUFZqWkxPL0Iya0pVT2pMSENsSDZrVndmT3Q0dG4xUzAzc3NPZ2R1Y3Fw?=
 =?utf-8?B?WGVNTS9EOHdUNlZGM2ZiSnllNm1HNDEvTEhMZzdaK2djNVczeFRKZXY0Rlpp?=
 =?utf-8?B?RDRseXpvczhUc3JnemdmUU4vd3Y4am8wWFJBTGltcWhHWGFRUjQ2aytTNEl4?=
 =?utf-8?B?WXBuV0RIenUzU002ektWMWJQV3QrUURhWm1GK3R5dHlod0Z1YmtJVlZhWU1I?=
 =?utf-8?B?UXJoZTJMY1dPSjJ4MS8wT2JtWHY0TXdoZHd5bUp0MXdpQ3ZKemNQaW1teXp0?=
 =?utf-8?B?aVJXVVRoS3FQdDBZaDl2dENuaW56L2dyNU04dmM4R1Z1UnBZeXpjbHF0Q3B6?=
 =?utf-8?B?eENKWkJqZ1pRelRyRmliMFBoTzRtY1MvR2pwdWdFWUtSaFVUTzBTS0lwQ0Ji?=
 =?utf-8?B?c21oU2RNOWtYMWNjTC96OFhLSGJ2UUR4Rm5nQXFsSXRCU0puTVo5emY5Zm04?=
 =?utf-8?B?bEUyMmJsL1hQT3NwNW04azZNK1kzQmZNcjZFM1UwUmpLV3FhU1BBTHoyQnVL?=
 =?utf-8?B?NGpQbkhNaGxkYThwZFA5cUEyY0FVL2srQWtnaTdPeFlqZlJzNC9DaDI2d1lU?=
 =?utf-8?B?SzZwVnpIZXNzdHFtamF0amhuZTFhNTl1R0tDcGtTa2paK2xUUm00WWdBUENE?=
 =?utf-8?B?eTdnV3hOenB6OGprcCs2Yi9RRFRBVVdpUGRVNkhVeERFK0JVcUl5OU5SQ0wy?=
 =?utf-8?B?WldSY3lDNjQrd1VvT01hSVpLbnRUWXdrSDgrNzdQQ25DV0l4UndBVXBqenZS?=
 =?utf-8?B?MW5TRjQ2YmhRQmhPWnU2UzREcVZ6T2hRVWR6R0E3VmNyL1lEUGpweWtwczFi?=
 =?utf-8?B?bytRMFd5MWpQOGEvTWpza3RXS05zRmdZTGtaOHhxOTI2cXNyMGF3TC9NTm9m?=
 =?utf-8?B?QkZ1bzAveHdoamlweHBVZjMrUlFQczA1MlhwQjFueUxCcE9BSTl3clRDSXhC?=
 =?utf-8?B?cmZLOTFERHA3SGwySjArMzhJZEZPQ2VsZDAvaVF1QlVNY2pIakRsTllGaW1P?=
 =?utf-8?B?TDMvTEE5bGI1OHB6b016TThMUy9GZkFjaVZ4ZFZqMDZUYVVUazhUbVQrVGhy?=
 =?utf-8?B?ZWg3QlFWUzhtS0xEQWJpTnY3bHl6Ri94RXVMWnFLS0VkS1h1SUxEWEZKQWVM?=
 =?utf-8?B?WFJqV0E0Qm5jN0w2ODR4Mk10Y2dSQUswMFlWSldKUnBuMndhQjgrR01QRlI5?=
 =?utf-8?B?Tk9WcmNxYTR5TTZFMmVEUUZhL1NUOGZTTTlEV0F1M1pLNXBQdkZlZlNhYkov?=
 =?utf-8?B?dHZDMzNxNC9JS3locVBGRnNrc0xZMGU1MmJuc3NDL2hSbHdyN2VzSFdGVnN0?=
 =?utf-8?B?VStCejFKUGhZZG1aMEdJUUkvZlFPenR5SXlPaDgrQ2ZGYm9JVk5tNVFDeHF0?=
 =?utf-8?B?eUsybU5jVjZhajJxUStYSzZMcGNwMEE2Z1RDRVZMTmRSUTB0Y3E0ZXdmdno0?=
 =?utf-8?B?VlpSeFFWSjhlZHNBcnVFdUdQUXBqMmQrRlJmZlF2Y0NVYU1Ick92dVdjZ3Iw?=
 =?utf-8?B?R0VYUnVJREQ1VTJvWTc3MHUrQ0dRMmw0aVFRa05LT1FLN2l5YXdpd0pHRVFm?=
 =?utf-8?B?bFZhZEhIVmFJMU15QWJ5NWVnUXJoQXNGd1E2RkZ6YXAwSzFxVDl3bzU5VkJN?=
 =?utf-8?B?ZVJpREJZaG1ZTlF5REFWdjh2OHJCWkl6ajBEdXg2dHU3NHd2YlY0OW5ySlpN?=
 =?utf-8?Q?8GHfIJy7SP9KG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDJxNUVwdHhPeEQ0SzZyVkNRRU5sUFRsWjFkU2hsbnpaNSt4SjljNDMvcGJB?=
 =?utf-8?B?dGk5Yk9CWjhILzM3MDdRb0FGOXBiRWdpRnVoVC9wdDcvcjdjWDF5RGI0eVhp?=
 =?utf-8?B?RWFsak9vVE1zeC9Jc2pUSXBLQmtoVm9QWjRqd2FTYlNEOVZ2WjA3ZWQ0UStN?=
 =?utf-8?B?K1d6S0kzOWV3SFJOZ0ovL05KakpTczlUZ3F0UWxIL01EUTIxeGEzNitPZkhY?=
 =?utf-8?B?bytXS1J5NitnVWZJdHJ4aWYybTViY21oVUVrRjZHOVArMDgyYkM1YVR6bjRU?=
 =?utf-8?B?UCt6b1p2QmpMVkNoTWhEV1RCYUtzUzh6RWpobWVvSm9VNmRXQ25XMTRGbzRZ?=
 =?utf-8?B?ZUFPT09la0QrcGVjK1BvUmNJRUlkT1ZWVWt6czBCelRpYnhEYm5hSHZrUE90?=
 =?utf-8?B?cmNUZlZxVlVTRC9teG1jTTl6b3h2aEV1YXRiK2Rja1drVit3WkJvWUNnUEFn?=
 =?utf-8?B?NnI4N2s1d1FSSWxiNEwxNG5iSEw0NmlYQm5wdnBDanpSK0xkRWU1QXFZa1JN?=
 =?utf-8?B?QjJjUHJWNnFVNFl0UkFBdTl4UWlFaC9saU9qMXZYa1BLV2hrck9hYk9PNlI3?=
 =?utf-8?B?Z0ZlczJTcVVRZ0Q4WmEvdmRwaTlWcHJtUzdvVUlpZm1mamc1UDI5S3pzMmp6?=
 =?utf-8?B?SWFDK1I2ZkZpSDg1QjcxbWduMHpCYnRIZE9qZno3aDJnejZiWElIWTU3VldV?=
 =?utf-8?B?NnV3WDlXbmx4a1hKbzJnbVZBays5d0VwellySnFwZ2M1NWh6eDQvS0dLOHRi?=
 =?utf-8?B?TmhYRVBKY3MyMXBYdVFSdllWcVBFTGdOSUtpUmc1dUNTNEVERWphbEU4VTBa?=
 =?utf-8?B?U1FGMlhCTzBpTFdPbjFUcndvSnZQOGpJVm1JNHZTN3lMMmtWYnJ0N09ULzkz?=
 =?utf-8?B?NkdvcWZuZGl4TXdEZVNIV1N5SCtDeFBQM21UU1NyVERMb2drQnNPSHhlc2dn?=
 =?utf-8?B?enBrSUVNYWdVM21OY05VU3RzL3dLclQ5emlHZUlwNjRlcll6ZDY1ajlnUm9Z?=
 =?utf-8?B?b1BLa1hiTGlBa1pyektJdjQyZStIMlpxaStiWTBad3ZmOWhvMWt5SDFLSE1O?=
 =?utf-8?B?dGxrUjZOOFVqTHdwbmxoNzQyeC9BaXlXZStoRnZiTTF3VWgwSTRoWlYvb2xx?=
 =?utf-8?B?RWlaaHRoVjZ3MlNqUUc2OEQydXo2V0l4T2dVdlEvVzBNTFYyTGFkdjViM0tq?=
 =?utf-8?B?Vk5Tc3ZjbTlBV1EzbGtpUDhtVHdHSlFIY2ZVc0VYbGFEUWhxbkJETDN2aTZn?=
 =?utf-8?B?WmRwZ0U4MjNHSktBUzlLOG9QSVJBWU5hOWdTY09vNHBIMzB5cDAxMkFFS2lW?=
 =?utf-8?B?ZWxGQVY4bmJJZlZNbUFjMGttS203MjEwRldEZjdKb1lqRG5hRWdlTW1lWExn?=
 =?utf-8?B?Q01hcndqc1lIUldXRzd2d0tKNTdLZDRNVW53d2pmeDljU0JSNE1ZRktDcWxM?=
 =?utf-8?B?Ly95aVRRdUUvNERCL1Bjb3JmdG9jdnlDcUNISUdPTjEvWXJ6ZXJSdW8yY1Nn?=
 =?utf-8?B?SjJzM3JlRFlKdkxHRHhreGE0ZDBnUDNjdkRNL0g3SW1uM1ZMV1pzZnplZDhE?=
 =?utf-8?B?d2tjV0phT0FZK2hDUzh3bDU2Ulk4RmFvZ3VhQ1ZNcEM5VktTVnRUMkZmTUFK?=
 =?utf-8?B?eWJ3Nnd6TVRaM29ZRC9sbklIRldGQ29oUThiRGpYYjFrWDVsbFNnbGJuSTJh?=
 =?utf-8?B?QzFiL3c1d0Q4TEU4TVdMSmNFUzd0VS9ZaDRRS0d6TGp2WkdvZlVTc1dXMnpE?=
 =?utf-8?B?UDFnaVpRdGU1L1M3OGNKSUxpOUdmemJ2SUw5VVJJVTRZaW8yUEJEWk5kU2t6?=
 =?utf-8?B?Q1UvUE96NXhucTczWEs4bGZKaTljd0VDdlc2TXJIM3Q3R21ES3hBUGdra0ZU?=
 =?utf-8?B?cVhPN2VYcjdlZ2JSaWRUcUFRUEV1T0N0QzIzM1lPazhjNy9SaG15dEVmZmtw?=
 =?utf-8?B?TTlaNXpOUG1EU1FMTzgzNUVhSUJHYVlSaCtiL0I5UUsrM1pzYTcwMmNTUnVh?=
 =?utf-8?B?NWl1ZmsyemFyWWxWUnR4bER6R3BDTXlKcC9qSHZGanBIZnIza1F1b3JDRjF0?=
 =?utf-8?B?bDdKYkw0UFZGQWczaWZnWHlkK0lNSUNJYnlMcFYyU1RDT1ZwTXBNL2RTbzJP?=
 =?utf-8?B?THVkc3dmZ2Vrdml6bE9BdWZqZ25tVlIvWkJxZkJGT3lvalEyU3paOEhBQm5s?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54053be6-51db-4091-2a2a-08dd46d0a7de
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 17:06:54.1991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1UUK7LJHw1GLUZfefdLCttlPme/Pa1dwxy2hWoS/D7xqGacJNBiFisZ7LZYP4OcHBQ4og7rr2pw6OrVLGmNV1hCGOK4a6W1rorTTLOaGKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
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


On 1/9/2025 11:52 AM, Rodrigo Vivi wrote:
> A simple lazy buggy copy and paste of the PVC comment has brought
> the attention to the incorrect masks of the PVC register for RPa
> and RPe. So, let's fix them all.
>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index df7f130fb663..e06f8584608c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -362,16 +362,17 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>   	u32 reg;
>   
>   	/*
> -	 * For PVC we still need to use fused RP1 as the approximation for RPe
> -	 * For other platforms than PVC we get the resolved RPe directly from
> +	 * For PVC we still need to use fused RP0 as the approximation for RPa
> +	 * For other platforms than PVC we get the resolved RPa directly from
>   	 * PCODE at a different register
>   	 */
> -	if (xe->info.platform == XE_PVC)
> +	if (xe->info.platform == XE_PVC) {
>   		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> -	else
> +		pc->rpa_freq = REG_FIELD_GET(RP0_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +	} else {
>   		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> -
> -	pc->rpa_freq = REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +		pc->rpa_freq = REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +	}
>   }
>   
>   static void tgl_update_rpe_value(struct xe_guc_pc *pc)
> @@ -385,12 +386,13 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>   	 * For other platforms than PVC we get the resolved RPe directly from
>   	 * PCODE at a different register
>   	 */
> -	if (xe->info.platform == XE_PVC)
> +	if (xe->info.platform == XE_PVC) {
>   		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> -	else
> +		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +	} else {
>   		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> -
> -	pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +	}
>   }
>   
>   static void pc_update_rp_values(struct xe_guc_pc *pc)
