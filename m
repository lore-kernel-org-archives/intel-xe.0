Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0507CD66BA4
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 00:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C28910E059;
	Wed, 27 Nov 2024 00:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HW4p8vEG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798DC10E059
 for <Intel-Xe@lists.freedesktop.org>; Wed, 27 Nov 2024 00:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732668963; x=1764204963;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HjGUKheKzy+0PuJCnZ2Eg8A0EdWe/JiBJEqhqQh8wDA=;
 b=HW4p8vEGvkWJMnII1UtxLtir9U8rYyei0D96h9ZwTqHeHQgh6UKUtVfN
 A+bIw8P8huCOuZ0uvtJsCeqDkpvTnCMZtPBZxdy/uf+KXLFGyZ4T5yBct
 E4U/Cm10t2efGEdnUXX+Df2aSzVmNQM1LJhXy97jQ9iuqNiLjNqXbKewA
 DEQbx1+jYU8xQbIdZIId2cFvgEsqcZ7A0LisZC3WjlbwXnFzjj8zbUySj
 9xVWi2f5U8AoPkwvyq0Z+iwS9AMHt8eQSS8CjRmWBgyJHsP5JFdeFrc81
 YnhkjJk335adiYl6pwXEXjOmUIydEf5S5Ik5L3/5TakCm/qKYCNIFSf7j g==;
X-CSE-ConnectionGUID: ntvlvxzRTHSGQXxU6Yzrlg==
X-CSE-MsgGUID: 4HDNiiCAQmKgkAnV6KmbeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="50383857"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="50383857"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 16:56:03 -0800
X-CSE-ConnectionGUID: iHpmorUnQhCoMC88ZV1K/w==
X-CSE-MsgGUID: cTnvaLpYS061t2XXlxySFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="91591051"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 16:55:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 16:55:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 16:55:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 16:55:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqKxNN+eH0CD+DMTQwNELG80pGIP8HW0SQeOw3pJnT6hdDA/gco8mFvbJbxbgmTynJKrWhWTuzrs7lBoVDsT4A9SIcX3J9pZoMiXJm0zCpcrtrOeLB9l1WKlyxlP0c1QYXfb30bGQ/Mw91FYXiB27AzpyopOcCXvlUahNcGYpI4R+KFGWmA972AevcvdRbHpsMPg8zRGVEoSoX3cFU2yy1/VWv4DyLutVnyukRfKW2+HrRjdwlkgntWalPEU3hk8/ItKL0GOAdu1H3IqE20w0Yv89FjkRBGEvZyvPqrDMnIwaRONiyDyFS+OEaAwL5UD68RCFOrPGN6YwLRFU6erOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4FyI5o5z15rzjCK4I4GqORXYFzOuYxnGulSQd/H0aQ=;
 b=gza96bTR/gcyO9L7pXkYkFLStw+ne8KagZ3EGKcebxODXlxdTq/B3L1glpAE1UKim6VziOA9Cf6WaXVpvytmSkuHRzKMwqtEa6P+g7gB1Y0pNMCf9BHkQEUZdOBmwPYgdMBP0/eLXQL567xLmqdHLbNp3FNh1NF0O4hhrIUJYjDzm0pN9wG2ot7EiIrsK9Fwd04XjyiiUjCS4biXFjKEIUaNQpVOmX7sKOXA0jZpLqDWJePEBoV3PwVcxp8Sl7yL5L1QQ/oyKKLRwdJ9AXCX+LyccSnrKNvoNDL8aXC7IemfeyEqfyfDcEfwG2mHG0I7h7RwEaVtGBKF/IfHOyZ+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 by CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Wed, 27 Nov
 2024 00:55:43 +0000
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e]) by SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e%4]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 00:55:43 +0000
Message-ID: <97f06eaf-9384-4b59-83c5-013c15dcd969@intel.com>
Date: Tue, 26 Nov 2024 16:55:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/xe: Move the coredump registration to the
 worker thread
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241126191857.2583429-1-John.C.Harrison@Intel.com>
 <20241126191857.2583429-3-John.C.Harrison@Intel.com>
 <Z0ZcmZZQ4x9Pns9w@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Z0ZcmZZQ4x9Pns9w@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0376.namprd04.prod.outlook.com
 (2603:10b6:303:81::21) To SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8450:EE_|CY8PR11MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 2563d663-a163-4b55-882c-08dd0e7e388a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2NwUWU4TXBqYld3OG9MWktiMldZbkNKeTdJV1NQSlE4NVl4UEd3QVpINWdi?=
 =?utf-8?B?RXNSZURBdmhUK0YrakFaUTZjYWN4NnB6bkN1eitiRzNSM1BNQTNHanJRdXFt?=
 =?utf-8?B?cHhHRFg2N1M2WWZLLzVuaDF0eUVCUFRmeWE0Z0VXWUpQaUlwZStHN2tISzdo?=
 =?utf-8?B?TUM4RzVnNTBnNDBocmZWbjMrRTJSUnM3aU5OdmZvWEtzRFFqd2xWakMySUpy?=
 =?utf-8?B?SzdUOHdoUXUvRmI0a1pYbFhEbXBuRHpaM1hmNkoyY3oyQVVJM25Nd3ZmdHRT?=
 =?utf-8?B?NUV1dURDWDN4UXVnMzlYb2p4OFFlVEVXVlZVdzZROU0xaGRjMldZQWxZc09C?=
 =?utf-8?B?TmNJSTJCb1laL2p3dUxxNE92UnFMVjJBcmtYVzI1Zzd2ekVmdEZxaVIrVWRW?=
 =?utf-8?B?ZUVkeU1mT0VqMVVEWFRMV21TbDAzVTFtUzF6Rmc1cGtXMnphaUcyOGxyc1pJ?=
 =?utf-8?B?eFUyV0xpWUZvWkNyR29zWm1uZURuYmFqS3VncVBDWnB4Tld3bUI5c1VyTEhp?=
 =?utf-8?B?ejl4SURSWE5wVS9iKzRwNWZXLzJ5dS9Ec1NaVjQ4VE1QVlZrZGpqa0laQVli?=
 =?utf-8?B?MFIrWVU3cEVVcEZJN1YzZ0JlcG9VaVlxaThydzdwTWczTElOOERwWEhPK01t?=
 =?utf-8?B?YUNUdkpSdjYyOVRJSVBSaUJuMWhJb2RhbGt5MWNsNEIweUh3UXRnaEIwQUpO?=
 =?utf-8?B?a29vUnZOSHJyYU0xdFdyZFRYYmJXWVF2MzltR3dWSVJyem5Tc0ZZTnUyK0kw?=
 =?utf-8?B?TUNOd1N2TG9uelcwL0hseXFUSnMwY0ZEOGo2aEtIVER3TzkrdHZLZVYzU2Vw?=
 =?utf-8?B?d01lR0cvSjI1QXZnQ1NyWldpdnRERk5EMTJIREdMdTBKdUFTYkQxa2NacHI1?=
 =?utf-8?B?MlNWbDVzNnhaZjJBcFAxQmZwQlc1QVNxOThuK244NGxTQUtiUmtCZWVtS3Jl?=
 =?utf-8?B?WnJNTkcrNHU3ang2RElzdnlnSTNwamZiSjhXVDhlaGVaS3dCZDFqV1VWVjg0?=
 =?utf-8?B?a1RMNlVndVU1MUxBekV4TDFuVi9LcUtIN2x4d0hmZWc1SWxqMXVxZXR2NjlN?=
 =?utf-8?B?QmRXUUN6OTdRQS9JT1k0bE5RdWdIQy95YksvZnd0cis3R09UbkNQZEkwZHlC?=
 =?utf-8?B?TzZhVnlQOEpNSkVNR2kyZ3owVmlERlhiUnVvUzRnZERXZE5rRXBhZ3ZXQms3?=
 =?utf-8?B?L25CNXNSR1IrdzVZTUpmK3pITlNsQTV4RHlibk92LzFDMFV6NGxVL2QwLzlz?=
 =?utf-8?B?VUlDQmhCbnRMdEY0c3JQbnAzcXdZR3hGTFBoQVJ0dW1rQXRDWjZZYk5haE53?=
 =?utf-8?B?a0VsKzZLZG1ELzBadmlackJUeUNZVFFrblYzUGRHN08xTUNycEpnZk1GZFd2?=
 =?utf-8?B?QUEzNXRrcDBPdkxWSzFuQ2pkV2paNUE5Ti9HWTJyaktrVFpFaDJuRTQ5dkN4?=
 =?utf-8?B?dU9peDA1YkxYQnpIZHBBUkZSejdPZGkzeHU5Qms3cURGYTkxVFE2UjBnVm9r?=
 =?utf-8?B?TklOc29XOWZ2eHkyQURhRWJXeWcxd0lvTzUwU1dnNE9xWUJiTDl6a01zb3FN?=
 =?utf-8?B?LzJNNkJhWVBIbExxNXdhd0FmUTRVTFdxTGM1OGZSMklFMmh3Rk9jRDFSTS9n?=
 =?utf-8?B?anBPbzdCSlFyQmpJTUJsckpxUklYdXNQWDNORktoOWRBUzk0SXBWaEVxWTZM?=
 =?utf-8?B?bjUwNzZSY0dLb0JGNEFDQkUrUHhyWkxXVE96M0tEVGJhWkppZXlmbUVsSnFR?=
 =?utf-8?B?SDlYa0RTVk01QW40MUxpTUZ6SkNFRnZDTDlPV1p0d015VjRFcHVWeHZnQ1dU?=
 =?utf-8?B?VlF0MlhCU2EzQlZ4MkpJUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUNNaUlhdnBGUXZtNlpzNHRHY0tLOTN2YzFmSVRiN00wc1ZudCtMMVp3Szll?=
 =?utf-8?B?UTBXSVZGdUdxd3lqMUR6TUZEU2c1cndUWHdUUlo0R0xOUjdwVmlpaHhDblgw?=
 =?utf-8?B?Q0p2U2Z1cW5OeDNxWUxMcWtDMEQ3UVBqelBOcGwxZUlaUllldnZOSUgyekcw?=
 =?utf-8?B?OC9QclBRSTFrelhyc1Evdkg2SWlDVWk1V2xsbFh4aDRWOWhGQ0tMd1N6Wlkv?=
 =?utf-8?B?S0tWaHRpR1NaUzlEdWQ3QVdTdWNSRi9zaFFFbjNlMmhyWkduRzJ3ZU5VWG5C?=
 =?utf-8?B?RCtZWXBkSUhocGpsMmU1clBwVnc0QlVsM0FBL0M2OUtXNlhKeHdnVldHMi9p?=
 =?utf-8?B?WFpXZm55bEV3ZnlPTXhkOXpsR1ljcXhaOWNnK3ZZekVZMUNUUEUyblNvWktz?=
 =?utf-8?B?TC94Y2YvenZSTzk1T0ZLekFGbzV0aGlJWVFxNk9VZUdhblFhNHNlOC8wSzEr?=
 =?utf-8?B?ZmNGbW42RnBzRmJaalg2djFNNDUrYWx2Szk2bzBtdFkrd2pGdVhKVVBMWkpU?=
 =?utf-8?B?NkZWNGlWQ3VEYmpnUm9tTlFzOENUNkduWXkzbFJxYTk5SVFPVlcvZ0llU21C?=
 =?utf-8?B?VVQ0MmJ1QmpZUjZIVVo5NTZISWJ6Z1Urdks5Qkl4S3JTL2hsRUVGYWprOUZv?=
 =?utf-8?B?YklyUGpLeGFWSE1VMmFWdDA0ZHJWRmNka0toYVJsTFFLOVhwOEk2SkRWeVZ0?=
 =?utf-8?B?ckM2TW5odUQ5Q1JUTEJKNlZZMkx6YUV6UFNRRGJOQkcwSG1OWllJdkh1TUVh?=
 =?utf-8?B?MUh0RmpiaTUwbU1QK1JNWkNOYzdPTWFMeUl1cmhQd1pmbGVkeHdtNVU3V0x2?=
 =?utf-8?B?ZVg2UHVBWDVSK3JNVGFFa3h1bnZteHpYL1d4bGtIZDdGUldQZWxvRjlTczU1?=
 =?utf-8?B?U2FVTnBjMVJ1QkJFbkY3WXdDclRlSTgwcGZUQUZ1UHVRUWZBTGU2cFEyRTlo?=
 =?utf-8?B?eEx5SnZpSWxRVWIwUVhkQ1ozL2phOTJBWkRwYlR6eS8rTGhZQW1LZE1yWkZX?=
 =?utf-8?B?elBxemllSlJ2QmJBQkl4dDErK09leWl5M1VyYmdWWDlzMk1UMkgzc2pEQUhP?=
 =?utf-8?B?dk1tN0JGZHlyRkpmWWtPayszeTVJSWRPYmQyM0Z5Rm4rUWpHUUEvY0FINEMv?=
 =?utf-8?B?Vi9SMXA3SVA0Rk5SNnh4MS9OWXVsRnFSUENJT3o4Z0ZjTHlXU0JlVzNROGUw?=
 =?utf-8?B?S2N6TDdodmVnRHVOR3piRlVoajc1WXNZMXd6d3d2aUJ6a0lESmxZTVkvbU1E?=
 =?utf-8?B?eXBFU1l3eGFteWtQZ29RZlJPWWVYUzYvTHJDUWo2djZXMmRHY0ZobEV5M2pE?=
 =?utf-8?B?Yy9GS1NZRUpiejcyOVBVSThobHF6MyttVFhhenFuTjI1U3FMbzJyODVxeWIz?=
 =?utf-8?B?L0krVGpkRXRPSkJGcVpDTHkwTWpyTzZKSk5xNjRDUzRDcjZZM1VMMEJZdVZ1?=
 =?utf-8?B?b0R1bE4yc3Qvbm9TMDNPWjNqUFJmd0JYdmZNOEpsTEI3eFp1L2ZnT2xKOXNM?=
 =?utf-8?B?UnFSRnV2WmxXSElKMk9nQ0h6SVlpcjhZSk1qOFc2eFFtaHVKaFNmam5EVFJr?=
 =?utf-8?B?eW5TSS81NDNGVjh6M05Nd0dpNElBWFJPVEYyZUNnNDdCZXhFS3RuOVY1QjZK?=
 =?utf-8?B?ZStOanRlNlQ5bWs1MnJETDJCU3I4Wi9tbW1uaTFzRXdrVGk4SGkzbU5VN3dW?=
 =?utf-8?B?TWtlMTBlalNCMW8wQnhNVXgwU3VoWjlueTJTdFM1b0NNWFVvSnNSb3FUYVdS?=
 =?utf-8?B?RHJKVElFaWVxZ3hSZkg4ZGUvVXBXVk1sTFZMUDhrdk1iRFFMbXNOcGdXQmlV?=
 =?utf-8?B?ZDVTTWt6RE5McWdxRGZPb2VwNDZXWkxOZVRQMkQ4VEVRZnlqNEpnKzZ0NE1M?=
 =?utf-8?B?cVMvV2tUcjZocWQ5RWhTN0hzU1BCa2tLYkNZWlB0TVYwRFpzY2ZXQU5aaEk4?=
 =?utf-8?B?QWpSczUxTW1OTjFKZ21Cam9EOGlDSmxCTUJ1dEJFTFNLcjhNSFNtRE1WNEFm?=
 =?utf-8?B?QXlwTWxSMTFWMkR3bllZWE82aE51YnN6NmZ5YVdkWVhLQWpCSU9Oa2RqZ2hU?=
 =?utf-8?B?SGpZWnJTa2dxN3BKTkpJRzRYOXNkaERMTEN0Z3Fld045QVk2bElkUC9EY1hk?=
 =?utf-8?B?RXkzUGhaUmlVUlJGMEdNeDRKdndsTkFYR2hQNC9YOFQ3eVUzcUhpNnJ3T3VW?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2563d663-a163-4b55-882c-08dd0e7e388a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 00:55:43.5583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4uG4aI/nGJHA9CqIrxNeFkKL0KU8AkJxoUrjTVTYGH+4HvWMpFZ9gvdwNU1L8wG5MZvHX6AHvqWYNqNO/RPYcPO+h4awfBBfZ60QqbNp9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6868
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

On 11/26/2024 15:41, Matthew Brost wrote:
> On Tue, Nov 26, 2024 at 11:18:56AM -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Adding lockdep checking to the coredump code showed that there was an
>> existing violation. The dev_coredumpm_timeout() call is used to
>> register the dump with the base coredump subsystem. However, that
>> makes multiple memory allocations, only some of which use the GFP_
>> flags passed in. So that also needs to be deferred to the worker
>> function where it is safe to allocate with arbitrary flags.
>>
>> In order to not add protoypes for the callback functions, moving the
>> _timeout call also means moving the worker thread function to later in
>> the file.
>>
> I'd add a fixes tag + CC stable kernel when merging as we could deadlock
> overselves if an devcoredump was done under extreme memory pressure.
Will add this when merging:
Fixes: e799485044cb ("drm/xe: Introduce the dev_coredump infrastructure.")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: intel-xe@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: <stable@vger.kernel.org> # v6.8+


>
> Otherwise LGTM:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c | 63 ++++++++++++++++-------------
>>   1 file changed, 34 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index f4c77f525819..5d19a4e3d5af 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -167,31 +167,6 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>>   	ss->vm = NULL;
>>   }
>>   
>> -static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>> -{
>> -	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
>> -	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
>> -	unsigned int fw_ref;
>> -
>> -	/* keep going if fw fails as we still want to save the memory and SW data */
>> -	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
>> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>> -		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>> -	xe_vm_snapshot_capture_delayed(ss->vm);
>> -	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>> -	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>> -
>> -	/* Calculate devcoredump size */
>> -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
>> -
>> -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
>> -	if (!ss->read.buffer)
>> -		return;
>> -
>> -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
>> -	xe_devcoredump_snapshot_free(ss);
>> -}
>> -
>>   static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>   				   size_t count, void *data, size_t datalen)
>>   {
>> @@ -240,6 +215,40 @@ static void xe_devcoredump_free(void *data)
>>   		 "Xe device coredump has been deleted.\n");
>>   }
>>   
>> +static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>> +{
>> +	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
>> +	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
>> +	unsigned int fw_ref;
>> +
>> +	/*
>> +	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
>> +	 * internally using GFP_KERNEL expliictly. Hence this call must be in the worker
>> +	 * thread and not in the initial capture call.
>> +	 */
>> +	dev_coredumpm_timeout(gt_to_xe(ss->gt)->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
>> +			      xe_devcoredump_read, xe_devcoredump_free,
>> +			      XE_COREDUMP_TIMEOUT_JIFFIES);
>> +
>> +	/* keep going if fw fails as we still want to save the memory and SW data */
>> +	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
>> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>> +	xe_vm_snapshot_capture_delayed(ss->vm);
>> +	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>> +	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>> +
>> +	/* Calculate devcoredump size */
>> +	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
>> +
>> +	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
>> +	if (!ss->read.buffer)
>> +		return;
>> +
>> +	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
>> +	xe_devcoredump_snapshot_free(ss);
>> +}
>> +
>>   static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>>   				 struct xe_exec_queue *q,
>>   				 struct xe_sched_job *job)
>> @@ -328,10 +337,6 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
>>   	drm_info(&xe->drm, "Xe device coredump has been created\n");
>>   	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
>>   		 xe->drm.primary->index);
>> -
>> -	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
>> -			      xe_devcoredump_read, xe_devcoredump_free,
>> -			      XE_COREDUMP_TIMEOUT_JIFFIES);
>>   }
>>   
>>   static void xe_driver_devcoredump_fini(void *arg)
>> -- 
>> 2.47.0
>>

