Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CABC25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 06:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935EA10E545;
	Thu,  6 Jun 2024 06:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jqj7HrBH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1674910E545
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 06:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717654099; x=1749190099;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1SVqJp7tsqYfFysBbNexeEK5iGpUPKTUfw4ntupJ+w4=;
 b=Jqj7HrBHjqtIiC6vbnw0eoc35gytZKm9QIrwDktkxLH5MarmADGaTjO7
 y4n4NewQzBklKUqfiFZZRUH9RFOXWANqk6VlWMnTLVTJCCSclcLnLPJXN
 BjPTfQe1zI70z+MlVEYtdQipzn0r+gqxwXeCNWBePKAyqCAC51kedxQa2
 mPDBDTfFAbyCpNtJ4Rr5/q2V51fa00x0zs6MZ9Y3p+WDPUd4/LpepqEyK
 XDMI3FjSDaU2B3/yXTaXkUuLMS25xzjchL1EF78QtMQa0GMtE83e0fTbA
 plCadAgs/6i74esadvyS03oS+4013FqxHQBZRKqizBrRwcFMqUwlS9MDt g==;
X-CSE-ConnectionGUID: yseDqtURQAGBxOXMUrc8OQ==
X-CSE-MsgGUID: mVSooROkTemN8Oi6TJZg9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14140115"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="14140115"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 23:08:17 -0700
X-CSE-ConnectionGUID: 8LkGqSadRbCiVWDNTN4p0w==
X-CSE-MsgGUID: KtA4HRvFT2usv5v7YHboCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="69006624"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 23:08:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 23:08:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 23:08:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 23:08:15 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 23:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fd/GZ8bQ9LLSpAv/GfHjPEnI4djRMjDPCnDIcV8ATEEdYhiKIRCmFApZB5scRM0hRyxKryd9669KS5OJGGMfcE7t43dt5kjATEcY0O1Ftj7cAEZgywzAbYpO2OhvcuSHtzUASm1IGgeJDevQrdNjWlzvnleiGH40bp6wEi0zHU9ObXZC68Q9odME+j4/v+njctOI040l4Bhwwk8Fmb5Xpa8MVL7ULBwQU6kkwNIBT8Tm205cUL/VZeUrAk8Z48S2ev12ZxMq1qS/daEEFxAYgiqz6HR4F+5Pz9OqcNnlYoH12PUHy+Lp0oAonXZxx9bOYHdv9+IcJTBbCGWKljFRvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEFeXoBGDnif1BKLOuy8Z0lQY4TGq3JGmSS1pMWB2/M=;
 b=b+LXM4e9z3kvgkpX7tif2c0V9Im76vaSyxM1FM4XDxWFokCIw5DOm4uFcwjx050dv7l8lWR3jFxTcmxXPoQt3pluat3Vv9YObVebVz2hqxFcYTLvYy3QXFlKTQKD0suFTz/JhiDWphQ9PG7ylzOZPBTJiwjwEqy6LvGchCLvxjJ+uflFRs1aAUnZ1pkyvyv3LNeGbfO78zGz9xTEd2nGXAkkdT/ZK7rlnnWma5tPdtEMHOjajmhz/+L1LKY7j5W2u1dUD+n8V4/K737+o536RWeQtrrNJDSEg8kCTY8akkL7P9Jn9cMT4Mvy0flp4cmLtJThgmekcFxyIoTqo9zm8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 06:08:11 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%7]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 06:08:11 +0000
Message-ID: <44ab2a65-df39-4ea3-a2b5-732ddc404ce2@intel.com>
Date: Thu, 6 Jun 2024 11:38:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
To: Riana Tauro <riana.tauro@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
 <40338a61-40df-4d29-9960-e0f96e9c9e8a@intel.com>
 <00281173-2316-4c6a-b69a-02b6902e08ec@intel.com>
 <b75a1731-8286-4a0f-8eed-015364c32052@intel.com>
 <20240603210336.GA2906448@mdroper-desk1.amr.corp.intel.com>
 <8cc78563-5b65-40b7-b5d4-49fed52c6b88@intel.com>
 <20240605210915.GD2906448@mdroper-desk1.amr.corp.intel.com>
 <722e0474-dd1c-4925-8e44-f385d3fd0e48@intel.com>
 <efe0b528-46b4-4073-ad8b-d9906faeaf63@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <efe0b528-46b4-4073-ad8b-d9906faeaf63@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::18) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|PH0PR11MB5191:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f09f057-6fb8-498e-0200-08dc85ef0b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QURnQU5lUW8vQzl3UFhGaStuTXdwNjRTZFlTZmdaZmxBcmxMNUNSbXg1V3V2?=
 =?utf-8?B?dXNoYWN0OXY1NXhqck9WakNuOTEzaVZyTkxSVGgreWk4dEtyYTRyaUR3cGk0?=
 =?utf-8?B?ZWRuYjJ5TWVhMEttQ08wTWN2MS9yQjNuOE9lcmpSTlVrUHBXcjV0bVJOT1RP?=
 =?utf-8?B?MGZ5YmpjeFZyWW1qZWozU0pTb3VMOU1RaGlBbmFHR1ZFSjE3WXJucHpHL0dN?=
 =?utf-8?B?YUpwYXpab3FMRE42bWVCaGY2MFk3MTNLbXV4TElmV2NNNUV4dDEyRzdzN29t?=
 =?utf-8?B?YmJJYjlxaDNUQ2RhQmk5SURsWnloQ001R3BGelIvZTJkTjZGcVlHNmZPWkdV?=
 =?utf-8?B?enBrenlZSlVPNnFxVUdWMEx2V1VOeWtYdWhlVjc3VCt3M2Y4aDNBaHRjcUwx?=
 =?utf-8?B?T0RWVlc2NXQvYjRnVHJ4UlNtMUFoWnlRbkhBR0orWEZXcS82ZjY5MWpkRkxh?=
 =?utf-8?B?RnBOdjc5RG5ndWszbjhpQ01KM0tvb1ZDRGhON2srNmN4SWxmbUhEM2FKRURN?=
 =?utf-8?B?SlJsZjVNRnhYY0ZXNG5waHhjbFA4eU1xbktTajhqLzUvTWNzM29BWXg4ZXpZ?=
 =?utf-8?B?V3FtNS9kcW9ySkRqZVJORXlHcXRzMEdQMzd1S3doZVpUeEY5a3lDM1lCMUY5?=
 =?utf-8?B?UzFhamJrSC85UXptT1JsN2s0WDY1dUhhby9RNlRKTHlzT3N5WXQ5UVFJVUhH?=
 =?utf-8?B?aVd5WXhrRXhqQUN3V1BxUE95LzhCalNXZHFNZkc5dGZLd2sxTG5MYzM5Smpl?=
 =?utf-8?B?UmZUWTJNdTB5WjAyOUcrVmlGbytvRzRGWGZlQWxlSi9kakUyZ0dmMGY4QVFr?=
 =?utf-8?B?MGV6NjRDMXc1dnVvVmFzR3V0THB3UWd4cjA3dFRPaFloN1hpNDAzWXM4dVBo?=
 =?utf-8?B?Y2xlVmlkMkVhODh0YUQ3WVBCSHUyQS9tWWxUdmRRb1dsb3dscEFreGQzcU45?=
 =?utf-8?B?U1JudHc2M0R4UTZsb081NWhCMlZGcWViSlBtWEJzNXFNRE0wUTRwY0FVSmpX?=
 =?utf-8?B?WFdPY3pZd0l2VS9ZZlAzSDgxWi9CNWJyUlRxNkhONjVjN1ltWjVFbHhvYmQ2?=
 =?utf-8?B?QndKUDRPajRvS2Y4ZkZvR1IxRi9zRFRpZkJRYWs4Ny9ONXJYUFcrMWxmRFBw?=
 =?utf-8?B?dXJnZnBIM2lGK3VhUkFsTEVrRUk3a0dMamxBU3pvYlF0TGQvR3Nwb3JqVXdJ?=
 =?utf-8?B?My9IakUwSHhSRkNIK3dzVThYb04xcDlveXgwNU0yL2c0TjlXa3VZbm56TTBX?=
 =?utf-8?B?cEY3VE5iTCtFNmROWnltNGVFQWJoNTZmUkVzU0xBa0xYN2RwK0F2OEpOVG9n?=
 =?utf-8?B?RXhjbGhndE95YlU5a1FVMkg1V2JKbmpEbnpMTXBhVmNSUHhUWkhxR20xeFdl?=
 =?utf-8?B?TEF6dmd6THRNSjVETk9oZmlxcTBwdnAvbTcrVm1obDd5bkYvMGNYNzVHcFVi?=
 =?utf-8?B?SjhVd2tHbGZGSUhCZ2lnQmZSSnlQcDQ4azNHL2xHcm9IbHN6WXgzMk5PTFZs?=
 =?utf-8?B?Z2lQcGUzNXVzMHVYNDJyZ3Z4bzRmaGNTZytLMzBZZEVuRzhIWXQ1dC9tVHhr?=
 =?utf-8?B?cWpyZmRBYWYwVW9BVU1ESXI3endLSFpXTWFMa2xvQlR2VzN3WmJNSElTRXRv?=
 =?utf-8?B?MmdrY3hkZXRDY3M3bm5TaUh3empsKzl5Z0dodk0zWlo1a1d3c21kdEJiYkpI?=
 =?utf-8?B?TVYyckJyZ0lyaGxqcUNDaU5hYlgvM25JbzJIZlRWaU1VcExwcUtGUmpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHBiS2hXbTF4L1lqMmlDSzd2S2Mvek9XMnF0NVQrT3hTeFBQekdISDA1dEJR?=
 =?utf-8?B?dFRFeWN5dkVYMVl0L0Vhc3FEWkVHWHhQeG05MFErV3Rid0tXcGxHeTNWMytB?=
 =?utf-8?B?a3NOTFU2ODB6TDh2T1FoNkR0dFNqYTVkcC8zdUZFejVDRmh4bWZubnlnczJm?=
 =?utf-8?B?elEraG1PN0l4VVpFVk0vSFd5dmRCZU9MNTBEZ2tZQmpqWVRpMFhvUDFDOFp2?=
 =?utf-8?B?M3BzY2JGd2Uyd1I3OFkzSXU0a1ZkVDZPUEoyMU8wOWVZZ1dMaldSbTRqNHA3?=
 =?utf-8?B?eXBzK1Q5eUUxS0RuUTNXQXVUS0p5eWo3VzVTVVpTZ2lmTjRBK3ZkZlZzTXpm?=
 =?utf-8?B?WjBobFowcEphMkMwOCtCL05RdStIWDc3U1BTUFlzMGR5azFNOTdkQ1gvcTJC?=
 =?utf-8?B?eFpaeEx5M3l3Yjg5YzdOMVZscWhaNGpFZ3lWZVhqdXpVNDBhS2pXZEZ0YmJ3?=
 =?utf-8?B?OEpvZ3JXYnc0UkgxbVdUYmVhSUl3b1dBeUpNRnRUQWREcDQ5SXU5cnFmcERr?=
 =?utf-8?B?a2dXNnkyR0VVUHZ4KzUxemJCM0I4Y0pPNlVqaWpDMXg1a1ovQWVCOEZrYUlj?=
 =?utf-8?B?N2hrNEpINmJjQWl0V1pSMGZiK3grK3BrTWVaa0VybkJBUnJ5aFNhTjVkclA0?=
 =?utf-8?B?R2ZoQVpSd1JlVDA4S2NvRFZFZk9tN09EMU93Y2doRWhNM21kN2JTY3BRVTZi?=
 =?utf-8?B?OVFRdHJEc1lGWkpiSksvVFRiVUFwZ0RDMWtwTmhvVEYvdjhuSFpVczNpblhp?=
 =?utf-8?B?K3p4ajFLWENxVlNacnNFS0VUZnlxWkNFVmRwd2Zrdm03ekl0cmdvR1Q0TGli?=
 =?utf-8?B?L1YrajJJZ3kzTVZjUUlkNDZKa0RpMHVSL3hVdFh2ZSt1M1BCaGM0UU5Ta2FI?=
 =?utf-8?B?T2greEs3NE1jSGlNNkpsejdrc3pGRXEzL2pJZzkvaGFZalhxRHJlVUNRYm8w?=
 =?utf-8?B?Z2xnVFFpVjk3eE5vRWxnK1BvOVhJSExPeGczTGpQTHlhMVNzRmJENFg0VkxK?=
 =?utf-8?B?Uk9OWUVJUmdHdFJoMXl4R0kzYU0rc3RxSE1xYWJUSlg5RU5iSzcvZzZFV1Jl?=
 =?utf-8?B?VnpYbWVIMlVZYlhqNXRWcGNTOGpleWlkaXJRNGFjTStxdVFONkIxT1U0a0VR?=
 =?utf-8?B?dGNaMm85Mm9yejJNNHJXWE5FTnNhY0h6R1kvdmtWRks3UVZuSVdnUHFaNTkv?=
 =?utf-8?B?ZGF5SmZCUi9wR1lqZkVNZGJMQ0kzNnh4RXptVEFTY1VLUEo0cVU1NzlHeFZa?=
 =?utf-8?B?Mm15WGk4WURvSEJmYXFKUTJGMTZCS05Qd2RXWk9CSEp2MWRVMWJQdVJEdlEr?=
 =?utf-8?B?Q1pQTytpcVYxK1Mvc2FMeVF6dVpjcHAzRlZuaE1rQ3l5bEpIM2twdkRlT21w?=
 =?utf-8?B?YkNFREM1RU51MnJKa0lYTGpjRFdvcnRxTlZ3c1d1NW5wQm03TW5Zb09hek5X?=
 =?utf-8?B?cVJLUjdEMzQwd1U2NGduQkFYWitzNU5vMmR0NWMwaUJaa055RVZ1NHFnancx?=
 =?utf-8?B?bkhEcDJ4RW9TdHFmK1RZcStLNHBqMVBZRWY5R1kweXpUekFwSkZtNEUvR0FU?=
 =?utf-8?B?eWMzVzJ4K2l2WjkxcWxFY1lxM2ljc21Ud3JjT2E1bEhDTzM3eUU3S2U4eWpR?=
 =?utf-8?B?Rjg0VGcxTWNrbUxLd0pIVDEzeVUwMjNVemIzRVY2UjM0UmtJRzJJaWV4K0lu?=
 =?utf-8?B?bXBENFRnNU5WMEIvazRLb1A4djJDcTVtNEVuSElORzBEWkRab3J5SXE5ay9N?=
 =?utf-8?B?K2NpSExtTDk2NzhwSWlVN05EYlJqL1FYOXJ4TGF3UWdvQTd3dm9uN0NkcTQw?=
 =?utf-8?B?UytSKzZZU0RmSlBtKzRQb2d0eEJWbldjNWR0NHZRVHdmMkkyQVc4cEFyTXJI?=
 =?utf-8?B?dnNnT1lOWE9LVGF1OW13NDNwanE5cmNaKytEZEduNmFhZmpEdno4dThiVGlL?=
 =?utf-8?B?N1ptNW9lVlRLUFNGd1BiWHR3T1lpN0wwZWd3d29jOU9ua0lRUWNJVUFnaTlU?=
 =?utf-8?B?bVNzYUpiVmtXVWo2SWZML2tKc3BKMEx1Sm5PWHNDT29KNk94NCs4cTk3VFhh?=
 =?utf-8?B?cmk5eitsVTNnLyszVHc4SGE0WEgyNTdPMjBhclBKR3JPcytxVVlKZjhac2x1?=
 =?utf-8?B?RmN5UGpWTjdOREJZMjF0Zlg4NkxqLzVKN2cvM0pPOUE1VUpkNDlNTEhmOXJ3?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f09f057-6fb8-498e-0200-08dc85ef0b5a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 06:08:11.7151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryFl/pdjWWFkTRVXrw7QFvLp5NULIFfQjq2P0giA0+2W++CgQrWXFxEb64LQtbcpTu8E+5dq95IW8Z//YS+7iKTSQcYp23/O3UE2l8K2BwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5191
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



On 06-06-2024 11:00, Riana Tauro wrote:
> 
> 
> On 6/6/2024 10:04 AM, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 06-06-2024 02:39, Matt Roper wrote:
>>> On Tue, Jun 04, 2024 at 04:22:00PM +0530, Nilawar, Badal wrote:
>>>>
>>>>
>>>> On 04-06-2024 02:33, Matt Roper wrote:
>>>>> On Thu, May 30, 2024 at 10:09:30PM +0530, Ghimiray, Himal Prasad 
>>>>> wrote:
>>>>>>
>>>>>> On 30-05-2024 20:14, Nilawar, Badal wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 30-05-2024 19:51, Nilawar, Badal wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 30-05-2024 19:55, Himal Prasad Ghimiray wrote:
>>>>>>>>> Make sure that the assertion condition covers the wakefulness 
>>>>>>>>> of all
>>>>>>>>> domains for XE_FORCEWAKE_ALL.
>>>>>>>>>
>>>>>>>>> Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of
>>>>>>>>> XE_WARN_ON macro")
>>>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>>>>>> Signed-off-by: Himal Prasad Ghimiray 
>>>>>>>>> <himal.prasad.ghimiray@intel.com>
>>>>>>>>> ---
>>>>>>>>>     drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
>>>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>>>> b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>>>> index 83cb157da7cc..9008928b187f 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>>>> @@ -32,7 +32,7 @@ static inline void
>>>>>>>>>     xe_force_wake_assert_held(struct xe_force_wake *fw,
>>>>>>>>>                   enum xe_force_wake_domains domain)
>>>>>>>>>     {
>>>>>>>>> -    xe_gt_assert(fw->gt, fw->awake_domains & domain);
>>>>>>>>> +    xe_gt_assert(fw->gt, (fw->awake_domains & domain) == domain);
>>>>>>>> This will always assert for when domain FORCEWAKE_ALL (0xFF).
>>>>>>>> Not all the platforms support all the domains.
>>>>>>>> e.g. MTL GT0 support GT and RENDER domain. So for forcewake all use
>>>>>>>> case only bits for GT and RENDER will be set.
>>>>>>> I think to handle this correctly in struct xe_force_wake you can 
>>>>>>> add new
>>>>>>> enum xe_force_wake_domains supported_domains to hold bitmap of 
>>>>>>> supported
>>>>>>> forcewake domains. Use this bit map to check appropriate domains are
>>>>>>> set.
>>>>>>
>>>>>> Hi Badal,
>>>>>>
>>>>>> Thanks for taking time to review this. Agreed the check should be 
>>>>>> based on
>>>>>> supported domains.  Will look into this.
>>>>>
>>>>> I guess the real question here is why we'd ever be passing
>>>>> XE_FORCEWAKE_ALL to xe_force_wake_assert_held().  That assertion is 
>>>>> used
>>>>> to sanity check that we're actually holding a necessary power domain
>>>>> before performing some operation that relies on it.  Nothing in the
>>>>> hardware should ever actually _need_ every single forcewake to be held
>>>>> at once; we just tend to grab XE_FORCEWAKE_ALL in some places of the
>>>>> code because it's simpler to just blindly grab everything at once 
>>>>> (even
>>>>> the ones we don't truly need) than it is to figure out the specific 
>>>>> set
>>>>> of domains that will get used.
>>>>
>>>> In the save/restore code path, both at the top level and in subsequent
>>>> levels, xe_forcewake_get() is called with XE_FORCEWAKE_ALL, as I 
>>>> believe it
>>>> accesses registers from different domains. In my opinion at subsequent
>>>> levels we should
>>>> %s/xe_forcewake_get/xe_force_wake_assert_held(XE_FORCEWAKE_ALL).
>>>
>>> We just grab FORCEWAKE_ALL because we're lazy and don't want to add the
>>> code complexity to figure out the exact subset of power domains
>>> that are actually needed (which may vary by platform).  We usually do
>>> FORCEWAKE_ALL in places like device initialization or suspend/resume
>>> that aren't in a hot path and are only going to take a couple
>>> miliseconds total.  If multiple levels of the call stack grab forcewake
>>> redundantly, that's fine; forcewake is reference counted, so the calls
>>> lower in the callstack just increment the reference count and return
>>> immediately, as we'd expect (assuming every get has a paired put).
>>
>>
>> Agreed, the subsequent calls to xe_forcewake_get() and 
>> xe_forcewake_put() merely increment and decrement the reference count. 
>> However, if we are confident that the caller is already managing 
>> xe_forcewake_get()/put() properly and the function operates 
>> synchronously, would it be reasonable to acquire spinlocks solely for 
>> the purpose of incrementing and decrementing the reference count?
>>
>>
>>>
>>> xe_force_wake_assert_held() is intended for places where we know we need
>>> a specific forcewake domain and need to make sure the function never
>>> accidentally gets called from somewhere that the domain wasn't already
>>> held.  I don't think calling it with FORCEWAKE_ALL make sense since that
>>> implies you don't actually know which domains were necessary; if you do
>>> that it will just impair our ability to do more focused forcewake
>>> acquisition in the future.
>>
>> I believe this is the gap: After xe_force_wake_get of FORCEWAKE_ALL, 
>> the assumption is xe_force_wake_assert_held can handle the enum 
>> FORCEWAKE_ALL to confirm whether all domains are awake or not. 
>> However, this is broken: the function is written in a way that it 
>> can't handle more than one domain at a time.
>>
>> For example, the caller of xe_gt_idle_disable_c6 uses force_wake_get 
>> with all domains and simply relies on 
>> xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL); within 
>> xe_gt_idle_disable_c6 to proceed with register write, without actually 
>> caring for actual domain it needs.
>>
>> If we see no real use of xe_force_wake_assert_held with 
>> XE_FORCEWAKE_ALL, I will proceed with dropping patches [2/3] and [3/3] 
>> from https://lore.kernel.org/intel-xe/ZmDhQJLrleUjetIX@intel.com/T/#t 
>> and will add a BUILD_BUG_ON if the user calls 
>> xe_force_wake_assert_held with more than one domain.
>>
>> And from BSPEC, it looks like xe_force_wake_assert_held inside 
>> xe_gt_idle_disable_c6 should use XE_FORCEWAKE_GT.
> 
> Hi Himal
> 
> xe_gt_idle_disable_c6 issue is fixed in 
> https://patchwork.freedesktop.org/series/133519/ and RB'd.
> 
> Will push it

Thanks Riana, for updating.

> 
> Thanks,
> Riana
>>
>>
>> BR
>> Himal
>>
>>
>>>
>>>
>>> Matt
>>>
>>>>
>>>> Regards,
>>>> Badal
>>>>>
>>>>>
>>>>> Matt
>>>>>
>>>>>>
>>>>>> BR
>>>>>>
>>>>>> Himal
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> Regards,
>>>>>>> Badal
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Badal
>>>>>>>>>     }
>>>>>>>>>     #endif
>>>>>
>>>
