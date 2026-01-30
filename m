Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552B9D73EA9
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 00:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BD610E0BA;
	Fri, 30 Jan 2026 00:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvKs9dDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E54110E0BA
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 00:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769734440; x=1801270440;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cNDcDwZAN+0qaDT8/ols9rwWVGBY4gCbdJsPzPEQt2w=;
 b=LvKs9dDkk2FcsYS4Hcf9dVwszmj5lWuG59ZmXE34UApo0DD0FrAcSPuy
 JE7C1uzqbJAB/im9lBiN4geyFHwMkG1LdH8LqrY8HFgVMJyFqwwSkDEMG
 X/ityG3nnRdMI+3ln6++1jeo7jtUI5kx8lfHE/ibV7A5OpNmxn3mmM0Fi
 QHOiuPxKsuhvrYPCUKy7yUCu2yeg/VyxzEwJ+9ZUsleG+SPcqyouucpPg
 iAQhFCXgsurOb5VobFtNdVSyp262V9XPxgBmGr+k744CwRdJfjsMz0uiX
 kkzT9FI9V99/VbNHtVf+2+FSHE/6nSrBR4YQnKz21cYS9DFKpjisoJeen g==;
X-CSE-ConnectionGUID: cgFt4ggNQdqWLtTz+nNdmA==
X-CSE-MsgGUID: HAxk0WF7SZif22wqQOSwcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82415183"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82415183"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 16:53:59 -0800
X-CSE-ConnectionGUID: qTcjGjJtROS/6nvT5QcyhA==
X-CSE-MsgGUID: k1Mql0shQhqy7xWeSj3zXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208518408"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 16:53:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 16:53:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 16:53:58 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 16:53:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZKG6Ji5msRYQqEwYoNMpQzITM0rbgInO0LApP7L4cRi3bdmfViE3D+CricAyJ/Z/p+gCgd6ZCrvmYX54SufAKqZTg4Qnwg/19PrR6x2gFdwwJIPPSmVrZGjsFqfZK39fh2fXsC/XV91Wkj7BjWWe4e7PvnV1VFqpvZ6I4ptwF6brv+htL/D2GYQ1bL0tgqhBTACiDNrZTkpXj+aCkfwp8YJZk9juT7wHR/h4hseDnY63N+WfG6A2mdscN790ZrAnc8uqBTUlKIO34qjjX2Vvci90PTCeJu7TFCn1R3630Rdg4XXJ7Ys2TC8vKdZBvhpXj/Kr+11UqedJxTLYpqRjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYlUF+MxFC16rEJR4h1qIvajWccZNp1/ZVMlxsWrznA=;
 b=pTrolMvLbX/CVx8zb6WKgAM2djufyA0cD7DgWF9kbZ024NeYU2VKFPeuzE09hL54kRTWINspYsYTDOEGzd59osphoWErbQGH8mg/iMwBBBlFTz62qBcSdIIf6TIkl10Sgo0f7rcxnphXPtqzv6IFoBsfmGo2M6w4NUVlCG7q9njJy49XNDIxw5KQgFzkJ6ujQTHH3i2tOHhxrKXCn0fd7NlVAWLSsWcM/ZZLe/RIL2hPmLtkPTAMEFM+fzV6CSAZBZnPZNGWgVzfvKKWkTNzr3s5ibtTzsfaM6JRlIqiAVElVS3AYRvmcKVcdwAR9gSO0TmIvJaHvHw86pBY7duNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6031.namprd11.prod.outlook.com (2603:10b6:510:1d2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 00:53:51 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 00:53:51 +0000
Message-ID: <1388cdc4-a85d-400f-9e42-cb50873d9614@intel.com>
Date: Thu, 29 Jan 2026 16:53:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/tests: Fix g2g_test_array indexing
To: Pallavi Mishra <pallavi.mishra@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <niranjana.vishwanathapura@intel.com>, <stuart.summers@intel.com>
References: <20260129054722.2150674-1-pallavi.mishra@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260129054722.2150674-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::6) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c979a22-68f7-4f80-8543-08de5f9a0922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ymx6TmlDSnVDd2tFMjNSTVpud3JyTGxTeXg0QitLZDRWZVNycWJaT2dBOVJH?=
 =?utf-8?B?VGM3ZDFPZlRoUnpqTWR4OWNpc3doUEVZUkRsTW02MDhoUEZBdFFaWVZQTDhX?=
 =?utf-8?B?WFVYMDRaYzl0eGUwdmhzMnJ5MmN6b0oya2dMZ0ZQZTBVRFprckc5a2VpbkRT?=
 =?utf-8?B?a2w0TWFKeDMxd1VQS0JOV0pQUHo0WnJjSHJWVGxRNDd0Y0JNbCtMRzltSkI2?=
 =?utf-8?B?VlJwOUlpcDZYMnpVMzRMWSthWDNLaWtUYk5lcXkyM0dzbnBOamg0YmhqN0lH?=
 =?utf-8?B?MXZBazNWNkRhSkVGVGJjbE9XWGxsSVowNVJvRjBMT3VqRVFXMnVIS3E0UVJj?=
 =?utf-8?B?TFA1ZWJ0NHdmMWtRNmFkak9KMVpQc2NxMVFBYk5JTUlIN01Xc3JGbHRTaHM5?=
 =?utf-8?B?SEN5c01oenMzS2NUcmludVd5MFdCTm9CTlY5Y0dOdmFSc0txVUZDSnh5OUJp?=
 =?utf-8?B?VTY3ZFdrU0o5SmNoK1ZWRzZGN0ZMMXpWbmNSV3JFZVRETHgzb3VaZjg3SXJy?=
 =?utf-8?B?bmh5K2thQ2hRNlIyd3RXR2prV3VIS0JybHVZOWZ5Q2txbzNQOHMzNDBLNXpB?=
 =?utf-8?B?UVlRS09EbHFwSkpBdHVkWldjVStVRXB0ZWRma09Nb2pVWWVURmRTSjdQVzFa?=
 =?utf-8?B?Q1ByMjltaW9DaExPUGZyMStac3dPb01qTU9WakJkdU9pMnBzSFIxZVBiWXNI?=
 =?utf-8?B?WHVweEpBSDhKc0o1MmFsNVM2eEZpSjRtSitZWHlZVjlqMzQxOGczcFNjQ1dT?=
 =?utf-8?B?dFhjdVR2d2FsYnVqUjZVbVAxODA0WndlK1d0c1FtUEE0Y3BvYlNETWhVSGx6?=
 =?utf-8?B?aCtHbEk0NlZPRXducDBVUlN4cjR1ejMydVF0ZHBaSTlJQUVZbDJGSVgxR2hP?=
 =?utf-8?B?ZjA2YmJKTHIyM0pIajF4aWprOGc2R2tITVF1RkFBMFlPRXNVMnFjLzFaQnp0?=
 =?utf-8?B?QzQxdm83Y0RRczcySWd1MndWeTZkNWwrNWtCS2hiTzFXbHkxTFlNNjJXNlU1?=
 =?utf-8?B?clRudlpHWDdURGJ2cU9VWkhkc2U2aFJFZXFOY3FIbksvQ1dMVFQxSmJjR29I?=
 =?utf-8?B?KzZtODV2ZzJDa0w2dW9zRUpMR3MvdWYyc1oxVVBXa0JzSGJXeHFqZGd1eEZN?=
 =?utf-8?B?bjQ0amkvSGFzN3ppaUFGaTBhNTVTc3NWUnI1aDBtWk1QckFXQTZxR1Fmek9U?=
 =?utf-8?B?bER0Vnc5dzgrMTdVWFpTSTY2dXFqclVaSXprSkJVZ2xDWjcvdHlQaTVkdE40?=
 =?utf-8?B?dGFJS1owc3JHOHk2VzBBeForZTdGeGxFcG9jT2RFMTBxT2J3RnVRajBqbTJa?=
 =?utf-8?B?QzFYdmduWFZJKzVLUmRYZ0YveWwvVlR1eWdLSERzQStPbzNPS0lCeVM3akZz?=
 =?utf-8?B?R0g1NkNmcFVHTlYxKzRqU3F3UlZpTDJWQjlZT0ZSdmgxMEZnaU1STWhhQkMy?=
 =?utf-8?B?RjZLRHJXYkhUM0F2ZHBud1hvWFhBS3RYWXgyTTRSK0NlRGRVUHR5WDc0OGdF?=
 =?utf-8?B?TVlpSi8wM1Q5NDNRdnNYZ2YzcjBLWFgwVEtJa3NiYnBWenRNakNIODZlMnN6?=
 =?utf-8?B?a0RMYlEra21QeVRJbFRqK0ZkNCtNVE9PVVBLTWpQSUlROG9PVXdZekdBTUtF?=
 =?utf-8?B?K2RhYU9RdFB2VUlRbTFhRGtlajY1dnhjV3RNY0MzWXdWbkk5RlUzTFdRRzRs?=
 =?utf-8?B?ditucXhLSTI3MTdEREt4dWZoZzVFODJVcFVjRW4xeDhSTnNLSTRrMEpMV0pT?=
 =?utf-8?B?dklDL2E4L1dSZWtXd1BUbW1uR3Q2dnBFbG1LaGY4RyszRDg4enVUVVdsd1hk?=
 =?utf-8?B?RC9qdHUzVnFRYVlDVzZTY3hEZU9FQitqa2Y4UTljU1NtWG56dkU0NGdSd3Jh?=
 =?utf-8?B?U1d1NHU5WDJiY2pkLzhSbEE2ckFza2FYY3VvQ3hRRVBPb25OTTN2R0NEbTF0?=
 =?utf-8?B?eGtKZHV3ZnIyYms3THY1ZW5KalllaGdweFlxQ1gzWE0zRkdxT1hJUHRLcldC?=
 =?utf-8?B?UjhySTRXV1BkSVZIWTBvUkYxMUZ0enpSWXgxU2pMUGNtTkFpcmNHNUpwbTNO?=
 =?utf-8?B?Q3VrT1IzazdCZW5YOWhmMjZHWGIyc0F3NE5Za3dUQW1QRmJLTTZTUXJ1WUFa?=
 =?utf-8?Q?qI6k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm9meC9hQ2VtVFNEaFJCS01pK24wMkxWeGdQbzl6RU1pbHVZaXIySW5PMlhM?=
 =?utf-8?B?VW1Xb1dJTnl2dTFwWXU4TkRIOFJTYi9GYm5QSXlPeWp2Y3c5Tmg1ODh1THF3?=
 =?utf-8?B?VENDV2ZwdGNzQWlObUI3cnhPOUNxNVVsUlgySjRJZnRuM2phTVpRV1EzbjNR?=
 =?utf-8?B?R3NtQVRJSmZ0OWhqSnl5aTVoZENpT3NqaCtyUU9UbUNFblgvS01jNHRQTE9Y?=
 =?utf-8?B?MGszdHJHZzh6VXRacjVMLzFib24rRE5LTEpad0tXaTBWWEppbVZ2VDZOTmpH?=
 =?utf-8?B?Zk1OSzFqcXNvNEw0WmovYzdKYncxc2lYditjVlUybmthS2ZMcmRYc3c2VEYz?=
 =?utf-8?B?S281bVh3NjFxclk2MWNleFduWkY1WEMveHZzOGNjbUpaTlFuU1VaN0xTMWFi?=
 =?utf-8?B?S0pham5kY2o4RmgzOHdwWCt3elltSE4xamlNc3dYWXZMYnJBbmhGTXl6Y1Aw?=
 =?utf-8?B?LzNKVUNNUmhmMEo3TXlUdis2a1NuQ3NibExJWXJPVWZZS3hVTld3TjUwZFhW?=
 =?utf-8?B?ZWFhNU90NlcvWnlmWFA0VGhJb1NUNHFyQURNajlHd3ZaUXo1aXl3d3hKbkow?=
 =?utf-8?B?a2o1K2xLZFUxaG9ycmJTM0lXbWNGNWtReG1FVE51VitVSTdHaU1NMnJqNUFU?=
 =?utf-8?B?dU0yVGVVeE9YOHJKY3BhVVBRcEJJa204aTdsdVVnTi9ScFd4YnFBb29wZS9i?=
 =?utf-8?B?T0lUa0RBaDIxNENYeUhPckVxazA2R0dnaGRXRHkrL0l0Z0FSUjZBczNoU1BJ?=
 =?utf-8?B?OVhzVWp1MmJkdHllcVlvVTcxdUUzcXlzb2QyamlxMHpaRTc3eFlNZXplU3hC?=
 =?utf-8?B?WDNBdDhpZU8wVkJEUE9ueis4cnV5MnpzRjJoMVBrVVgyMkQ3K3RFNzlHRTVN?=
 =?utf-8?B?MGx3bXMzaUtiM3M2OWtxdlVYYnRiZE5mdkp3ampwZWxUTi90VUcrWFlmbUtq?=
 =?utf-8?B?NEFiZ1RxVy9RcVcwSHpvaVN1YnNMLzRhNjR1aFQ4aGRqVGxlQmxLMzB2ZFdJ?=
 =?utf-8?B?TmR0ejI0NVFzYWg3VkdTdHZ3V2dLeHA5NGFFOTJxUnVmVU9OWmdwb1BXN0RU?=
 =?utf-8?B?THVoekRtNXFIWVlaY2hYMHVNVWhaZUJhS1Z0aXVZcERLRmZJWklzV3dIRE1a?=
 =?utf-8?B?Y3ppL2ZkMHlRMzZCcHZkZE1TMUt2d1FyQ1hIWlpUTXhhVXFIdWRjb1h2cERz?=
 =?utf-8?B?WStzRUxuSUwvREFsWHpNNnc2SGx6ZThIWFQ3NmpNRm1OTGRwMnQ0YUpjVE4z?=
 =?utf-8?B?dFcyRzRLNVlpbHhRcWxNdlhiM3RHYWV3WEtnOVc5T2JxS0dzYXkyczJjeUlQ?=
 =?utf-8?B?cnhERWFBTEVPSWRpZHNsalFWcFU5eG1OajFObzZXRWJUbEZwRFVENXRSem1v?=
 =?utf-8?B?eXJsL1VjcjJIZHJuc3U1RzVXMWp2MXRGNGppODdiZm5keXg1U2tSSmwySHhh?=
 =?utf-8?B?MllHcmpqRmQrcWFpcUkvK21zOVRBaThrblJTR1VtNU4ySUdYYzUyU2pkRHlW?=
 =?utf-8?B?bk5hdHlibWhMOXAyWE5XeE1BbUlwdWhLczdLVnZSSjNnckJ4M0pFcHd6Sk5M?=
 =?utf-8?B?bkpkMWhreHpOVkl3ckZOU0dTK1RSNTZua0dtd1ZNWXBvYUxFcWNrNU9BU1hQ?=
 =?utf-8?B?RjFTem1aRVdMdDJKbzg1VVl0TUMyYWpjYk1tdkVoY0Z0aHdaWHdVbWtHcFYz?=
 =?utf-8?B?TEthWlpzRENRNEFPT3RoRXlUcWk2OHAzZEs5TWFzWTQvbFhvdERZcHB3eTcy?=
 =?utf-8?B?NUorcnNETUJmdnY1aE9Nby9sMkdwTkRhVVRYVzhSZFZHOUdFKzY4OFQ3UW1r?=
 =?utf-8?B?T2x6WGJoSE9FYUFmcnh4YVVaSTBOczdpamhHNXV5WEJRSlFYYjE3dTdpRk55?=
 =?utf-8?B?Nm9qdGw0MFIxMFhUTnhiQU9PRkx6RkZtbXNGbHJkMUhzZUY2UHZlM1ZvK3lx?=
 =?utf-8?B?NFFrYVFSV0RiQ0xrQmVQQ01xenRTdmhpTUVGekp4d0JoN1NZWE02bzIwSmVt?=
 =?utf-8?B?VTNGbVYyaU90dFJ2ZGlVb0JXVWlYTCtPZC9yWkNmcGltOElrQUVKaUNHZFRY?=
 =?utf-8?B?V050bFl0LzM4WFFGSE94bWI5d3JMM011ajByZVIxMy9RZ3BLZ2Z5amNxUzVq?=
 =?utf-8?B?NTlZK3hwaTdLYUsrUzhxYVVEK3FCeWNWZnl0Tlc2eXpkeEVFWHZEZE8yWVlQ?=
 =?utf-8?B?bENZZmxiZHM1enhhQmNRU1RMR0lzcXpRaWJZSlFMTUU0bEZtRzBZZUtrWVBO?=
 =?utf-8?B?MGxNMjZ6aEhERTRYSGs0T2MwbjgzalAwNEJZVlI4TW84NEpZRHNPOUsraW13?=
 =?utf-8?B?TVJuT3Avd0pVaFZRUlZYc0h1elZscXVXUkVqN0U5QXU4c3FTek81Y0orTEpm?=
 =?utf-8?Q?AVc11Xz/fW76WH6Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c979a22-68f7-4f80-8543-08de5f9a0922
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 00:53:51.7417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWQ60TuGAf3cxEUj2TH2aIu4Ae9LEyzHWEbs9z4JVgeZL0950Z+rs2eo6jxb79rW+aVvWBki4rAWhxTa2sopKobLj1fTjjU+jxrmAYJHM8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6031
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



On 1/28/2026 9:47 PM, Pallavi Mishra wrote:
> The G2G KUnit test allocates a compact N×N
> matrix sized by gt_count and verifies entries
> using dense indices: idx = (j * gt_count) + i
>
> The producer path currently computes idx using
> gt->info.id. However, gt->info.id values
> are not guaranteed to be contiguous.
> For example, with gt_count=2 and IDs {0,3},
> this formula produces indices beyond the
> allocated range, causing mismatches and
> potential out-of-bounds access.
>
> Update the producer to map each GT to a dense
> index in [0..gt_count-1] and compute:
>      idx = (tx_dense * gt_count) + rx_dense
>
> Additionally, introduce an event-based delay
> in g2g_test_in_order() to ensure ordering
> between sends.
>
> v2: Add single helper function (Daniele)
>
> v3: Modify comment (Daniele)
>
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c | 60 +++++++++++++++++++++-
>   1 file changed, 58 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> index 3b213fcae916..c952ae7ecc85 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> @@ -48,6 +48,38 @@ struct g2g_test_payload  {
>   	u32 seqno;
>   };
>   
> +static int slot_index_from_gts(struct xe_gt *tx_gt, struct xe_gt *rx_gt)
> +{
> +	struct xe_device *xe = gt_to_xe(tx_gt);
> +	int idx = 0, found = 0, id, tx_idx, rx_idx;
> +	struct xe_gt *gt;
> +	struct kunit *test = kunit_get_current_test();
> +
> +	for (id = 0; id < xe->info.tile_count * xe->info.max_gt_per_tile; id++) {
> +		gt = xe_device_get_gt(xe, id);
> +		if (!gt)
> +			continue;
> +		if (gt == tx_gt) {
> +			tx_idx = idx;
> +			found++;
> +		}
> +		if (gt == rx_gt) {
> +			rx_idx = idx;
> +			found++;
> +		}
> +
> +		if (found == 2)
> +			break;
> +
> +		idx++;
> +	}
> +
> +	if (found != 2)
> +		KUNIT_FAIL(test, "GT index not found");
> +
> +	return (tx_idx * xe->info.gt_count) + rx_idx;
> +}
> +
>   static void g2g_test_send(struct kunit *test, struct xe_guc *guc,
>   			  u32 far_tile, u32 far_dev,
>   			  struct g2g_test_payload *payload)
> @@ -163,7 +195,7 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
>   		goto done;
>   	}
>   
> -	idx = (tx_gt->info.id * xe->info.gt_count) + rx_gt->info.id;
> +	idx = slot_index_from_gts(tx_gt, rx_gt);
>   
>   	if (xe->g2g_test_array[idx] != payload->seqno - 1) {
>   		xe_gt_err(rx_gt, "G2G: Seqno mismatch %d vs %d for %d:%d -> %d:%d!\n",
> @@ -180,13 +212,17 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
>   	return ret;
>   }
>   
> +#define G2G_WAIT_TIMEOUT_MS 100
> +#define G2G_WAIT_POLL_MS 1
> +
>   /*
>    * Send the given seqno from all GuCs to all other GuCs in tile/GT order
>    */
>   static void g2g_test_in_order(struct kunit *test, struct xe_device *xe, u32 seqno)
>   {
>   	struct xe_gt *near_gt, *far_gt;
> -	int i, j;
> +	int i, j, waited;
> +	u32 idx;
>   
>   	for_each_gt(near_gt, xe, i) {
>   		u32 near_tile = gt_to_tile(near_gt)->id;
> @@ -205,6 +241,26 @@ static void g2g_test_in_order(struct kunit *test, struct xe_device *xe, u32 seqn
>   			payload.rx_dev = far_dev;
>   			payload.rx_tile = far_tile;
>   			payload.seqno = seqno;
> +
> +			/* Calculate idx for event-based wait */
> +			idx = slot_index_from_gts(near_gt, far_gt);
> +			waited = 0;
> +
> +			/* Wait for previous seqno to be acknowledged before sending,

Nit: should go to a new line after "/*" to follow coding style guidelines.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +			 * to avoid queuing too many back-to-back messages and
> +			 * causing a test timeout. Actual correctness of message
> +			 * will be checked later in xe_guc_g2g_test_notification()
> +			 */
> +			while (xe->g2g_test_array[idx] != (seqno - 1)) {
> +				msleep(G2G_WAIT_POLL_MS);
> +				waited += G2G_WAIT_POLL_MS;
> +				if (waited >= G2G_WAIT_TIMEOUT_MS) {
> +					kunit_info(test, "Timeout waiting! tx gt: %d, rx gt: %d\n",
> +						   near_gt->info.id, far_gt->info.id);
> +					break;
> +				}
> +			}
> +
>   			g2g_test_send(test, &near_gt->uc.guc, far_tile, far_dev, &payload);
>   		}
>   	}

