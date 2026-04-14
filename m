Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB585EBFD29
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 04:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5587C10E09C;
	Tue, 14 Apr 2026 04:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Up7BveEG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5117110E09C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 04:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776140899; x=1807676899;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+9VVx5qwwl3kH4NiD453xIOxX06uFhnDaThC8/U69/U=;
 b=Up7BveEGZAlCOT0xNwCOnE0bJqDdAO/EKjZ+Gb0XruIL0xDomwQffUlZ
 0kds2OlD/asTOpRrtgnK/BsjxezYEt2QtKi3nDdPOQuNKcrmg/BEjRs+A
 1Ls5WbKGx2GibIcEBTr1XhHp4Qq0A8TMCZmo/gM7fDFXDGnk7Jq/CFnbm
 NMFOMA88ReisfFnOuWGGsoaTBxJsnMai9LQBBwdKK11wBzET/kq9/lAxR
 iuNK851WwzR58MrQVRmksIc2mtNvjqLptW/5qzUXveDoxbXqjB/RhoBpF
 4dqWOJiEOQdqXrQPnB6ELtIwFi2n0JG1bzLuFAsMTei7ua8OTWHKLrQ7/ A==;
X-CSE-ConnectionGUID: N34Jvmk3QEq1ssOM01Oq0g==
X-CSE-MsgGUID: gU2+0eQYR3yvXt4ZCRXhsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76968676"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="76968676"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 21:28:18 -0700
X-CSE-ConnectionGUID: A/F3fVIpSkyd/UpjvAm7Aw==
X-CSE-MsgGUID: /9NBmI4OS62MuJTTw2t0Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="226807548"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 21:28:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 21:28:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 21:28:18 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 21:28:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXXUoMGuw8m0mzpdBjZ0KrqhxwgXJZ1vliVPqMO0hqQYf/l5pPoS62CLGwPKNBqb6LavyT1w4cKX3D2uaZr/mi8gQ+LCLiH319PQ0soknWWGiOaeuwZwfuwEHsDknyfnsElfuSXXmxLszcAcsZxbXYawxhj17Fyt4Zj0PYYNSW2SL7IO13fuEaXlfUsM9uZ4BL0mwRV4aljghRvutGB9REnDl9aAtxiVhDXDwWWISH0OTAIWSn5kmwUBXkFDGO5j9Wnk9EV1arWZRyow36rdXg6Es+0sRgvUzuw+DsbBrXQo29u9KJRN5mRwfvTHpH9s+LR6XOR0Y71NAl6JQ+g1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsQyyM1LWVgPPvh2ks0KCO6j1Nvg5Qf1bsUQpbWvz0c=;
 b=OWCqYbSDFb3BeKiX1+o5xzDeuHKe6A2ZwJV5yaYQRV+rSD1M1Gku8iNKNvGeXfvSAWkBf30Cg6UfCIabRZE7xayBc8iaW7YSM7RRocY2AI0DRV+LcWFsuLa0HpSXAmPht86UsVlylx3BAgbLRWhzysMZVlQimvW9GTf1f3YeZsJl0hOM0JiZffBC4TzTVIcd9AuYemn6daFnvEvGobaeoYqPsBTxo7vvTxoRlAScDVuwW9gy6XWvpuSH7cIZxGtN1Ud1PTcK6C0YxJXCsOxLAjAO+00tXuuvR6lL1TGRBP+XwrpPqjs9IswfYDtz1cKin0YVJneBgqHEN+x/QMx7kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.48; Tue, 14 Apr 2026 04:28:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 04:28:09 +0000
Message-ID: <4b114b40-6c4a-42f6-8b0a-6c684078a932@intel.com>
Date: Tue, 14 Apr 2026 09:57:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/ras: Fix error handling in register_nodes()
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20260407225913.3397059-1-shuicheng.lin@intel.com>
 <20260407225913.3397059-2-shuicheng.lin@intel.com>
 <SA1PR11MB8839D98125E6279612D9FBBEAA262@SA1PR11MB8839.namprd11.prod.outlook.com>
 <924eb185-11b8-4d12-a310-09a935af2eff@intel.com>
 <DM4PR11MB545612765F5ADC302787135BEA252@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <DM4PR11MB545612765F5ADC302787135BEA252@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aaa1c9c-daef-4962-557c-08de99de39b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: jtu83IY8NPBlOucOAi9okrtHcquops3XI+yzImWv2DyToNkGDHKcqEypEwtr76L3ThQcEkajLiKrTv3JLjn8LtLOO4uTU+Du7qQyn9q24ARqurkIlSDjpPSJw0M9bR/e9GZCzXU1rwgFl+Xt/H2pSmVw6eadVBpDP/oP4eeRf51RCtUprmH6akuZfv2+XNg+1Qz7f+NZCTLZ7f/WQWXGgRwnCpxgmA2a0eFmtmdCFwK8wgKh3Fs+LxyN7QK8YPdcgX3NaAOYXFd7bAjQJ1Jgh5xHvLZzGRWsX8O8BTcJj5L8C/ST1+dFoX5iXczovUzBU4JAJfaRbb9SxXLWaTNLK0Y83XGb3PF1uKJtzfvc9bvaxv/mAbY6QQoE1fT91mtp2lw3zXngR3OYhWGFeCkmraE8Fs92DXmKKj/3fIf/2iim5HQTrWq4Qs5d/nNIME1Bolq01AbHnEqldqORgsymUVA/jbfbqSfNDyY3d1VlJdb/PEceom/iv+AkgqsWRhAVcVP/2nTRq+YocMkrkj3FdAPa5PuKSvtWyS7UaABTZe/5+aVzsrHbRXGhh/baOfG8z3qLurdDY8PaUR54hCWUnFjc3jalRrkv4XYGT2JYZZ4/7mBB1375JWGnMZtV2U38KJIHePSz4BP9rBDu5orAD+EmyrRmu+ojSHzB4MB45BZkMmxbKrLzuPJxLiBmjhEPkYrqP76JqOF+rZ+wscsdn2rlisgcpCziNlXDkscnbus=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFFQZkZzbnVoSnJjUVExYmgrTnYzcnR5QkV0WGtsNklDY1dEVktnQXRMU1lr?=
 =?utf-8?B?L3JUSEQzMExDZi9NaTZUWHhUQjI2NjVHV08vMnU0RTd3ZW5TNDdkamtaSUdu?=
 =?utf-8?B?SkFUYkxBVFlZazZHbk1JSFJ0TjZibFNuN1NvSEVqVklRSkgxS3JkQlNmUjJH?=
 =?utf-8?B?M2o2UGJ0WDZWaVA0eEV4T1crTjBiTnc5VVkvVzFObUx3cnJNeENVVTUwdGN5?=
 =?utf-8?B?VUR4RDRidDQvOUVsU2xpSGl6RUY4R1Y2SXRkbjlRYThENTNDS3gxVFdlZ2xl?=
 =?utf-8?B?MjJPTkpTQU1HS040WU41N3VRclhmMzV0U1p4NWxwTG9LMTVMcTZxTkpKalhv?=
 =?utf-8?B?bDVKZG5qZGFrbTFJZE9qTXNvMEVCRnBLUXpGSzZxMlRScC9qTXVhVHQwVlk3?=
 =?utf-8?B?QVRBMUZLVzNTaTNPWVBvb3phOHJQL0ZEYnZTbkdZVnRpRzVJVXNkdzZ5QW5T?=
 =?utf-8?B?NUgraDNSZ043NktOazFiVWlpVEVQZjVuZDZkWUhiS2U2WkpRSEVwbDFLY1F0?=
 =?utf-8?B?V2lUQmMyWml5UHl0dE5LbjZLY3g5OCtpZ3BwTlpwbllYVllNbmEyc2dxZ0Q4?=
 =?utf-8?B?dE42aEg1OW55L1dpK0ZKOEJ6QWlsY3pNNmdKUld6RzRoY0grcW9mVVkxYXJx?=
 =?utf-8?B?MTB5TUxzLy83UGNDemk1cUhzSXNJTWNpOFBWN0JDa3dhN0hvSXZyMTNHVk5i?=
 =?utf-8?B?dnBBbjJlc0RKZWtwVExmZ0I5NGx2Q3kxYlF0bDA1RURVcHNreVBrUk5DOCs1?=
 =?utf-8?B?SElzVHFUQ0lJZSttZzBzVWpGLytuTXFzVFQ5bUVsVHF1MmFWMmFselAvZGtx?=
 =?utf-8?B?ZEtGcE1iL3VSWnRDY2kxWEdzOEtrYnRTSC9RekE4Z3ovQWI2cm81MVlDaFcw?=
 =?utf-8?B?Zm5rWm0rNDhXcnc0ZWVvWFQ5WGJYdHJvZkFSNHRBc1JCelU1a3Noa3d4S2NW?=
 =?utf-8?B?MEY2YjZwT0E1OGkzUGIzUndrUlR2WnNFWWZwV1hiSitEZks5aDJ2cFpyQUlM?=
 =?utf-8?B?WGhqbHNMZk5OeHB4UEN4YUtuNTZLNy9EaWFveVJ5RGJQNXNHQ0h3Uk00cWpt?=
 =?utf-8?B?eDRzTkM3OW80dTl5dDN6ajFsUWZnSTJxTkJoRjd0SVJzTGZiQnA5RmJiTEg0?=
 =?utf-8?B?ekVEOXorTnljdGJKUlpWeDIzdmRCMXFiT0dVcHU2NFNScXhTRW9NMWtXbmgv?=
 =?utf-8?B?NTgxV2pyMzNteGgwS0FqWmR5RjA2cktiN1pEZVBIbzJ1Y0ZnS3EwSlNxSVZt?=
 =?utf-8?B?VnpRZ0ppY2RrdVNHelgwMkxRdXBXRGJWaWxKS2tnbkFRZmg1N1pxb1lENXVH?=
 =?utf-8?B?UVVrem5peGV4RFNtemh1WlVWQkxoTUYyTlFBd25UdFNmb0JhbXFHZm5jRnVB?=
 =?utf-8?B?VmY3M3pXMGFsYkZ4bU9LVHFkcDVMNzJRMkV0RWoxbmU3NjhzZnExSkxQd29y?=
 =?utf-8?B?N2NEMU5DTGh4WS90SWNnUld3YmtyMVRMSEJMcEFjNFV0dE1rbWhkdjJsdWd1?=
 =?utf-8?B?MndQQWNvZ2s1aEEvWnRIcGZ2d3lpdk9hYlJxdzBEcWJoazJNeXlPUVIrV295?=
 =?utf-8?B?QmZZaUx4TWRJQmQ5SmZTbDZOWGRvVnA2bDU0MkhTdTNDcUpOOWZJVmUyaFN6?=
 =?utf-8?B?a0tmS3Q0a1crSlpqdngrRERLMkxrcy9LNUdQRDlyQ0xjdkwwYkhxTitqeURx?=
 =?utf-8?B?S2cyYUpsV0FVS0xieFFaU0NHY2F5N3dLNG5PdExzY1JUMWNkdCt3ZXZiNU1Q?=
 =?utf-8?B?ZkhuUldMSnZLRThaT3lvNVJXRHo5SzNVSGltemZCNytnRVViWjZMVWR0bEJx?=
 =?utf-8?B?ckhETU1KRnBheEhiajI2MUlTbHQ1NnN2ck40elYvMlNJekVrWUh4Q2R3UUxm?=
 =?utf-8?B?QmJrV3dRWURGd0haK0lmT3M5SnlOV2x0ZFBMNDJVeXZxdys1M1lWYmRUVjEx?=
 =?utf-8?B?ZHFZK3g2emgxWnozUHNsQmUrUXB3ZzBWdk1adVRoN3lSazdkZGF0eXlVV0hL?=
 =?utf-8?B?eTZ1cXZCUkFQeTRDclRuLzZybm83QkplTmt5UWJ3Mjc1NW00VGQzUFdidTl3?=
 =?utf-8?B?ZTRwZGxiZEZjTWhvVjNEWnE3SGZaZytjR3BVdW42cjV1YnpZR1A4ZjVMbkhD?=
 =?utf-8?B?UDlJcVlIVzAySVRodTNYamp2NEF5QllyZ01FN01rdTA1TVlsVHVBNk1FS2dU?=
 =?utf-8?B?SW5tUkE2b0dZemNZaTVPbDJaY3dCbDZld0xLeE5SWndOSTFweXBTdnpJK2dR?=
 =?utf-8?B?L0twZTB0LzgrUnROangzTi93eU43WC9qUTl5dkY1bWk1TTk0Y05mZGJnbzM5?=
 =?utf-8?B?aGdtQWttWWZaTVd6OUR1QzF0NTRzZDlDSnJIdkxNdzh5TFowQ1NXUT09?=
X-Exchange-RoutingPolicyChecked: kMKBLAUkE9mMr9TLKhv1VevlGoIkoOjgwNz2BogWjDbkooeQAoD+RdVj750tHLqCDfnp8jjB7sWRjfMVZwzaPxw00fVBjSljL0CcqIsKqc8DjrlmSITqH4aTeSxFVM3c3hFJwKco3v45Jo1A9c8vgqCb3ZY+NnALIB/reUQeOviJABd95YauEiqgsAanMuw8vpdqzLb74dZg7kiH5qeEKKAdNteXGS47heeJAn/f2b409TVhKuEQpT8HUqFJG+TCjk/J/RWp6z6Xcx7ejiqZXib1Y6XEUUEmMdlKqoPOZfXrF8TD0SEf5oogiL7wTNeBd6FFgV8ETK0/hCYzzVJ4vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aaa1c9c-daef-4962-557c-08de99de39b3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 04:28:06.6637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/iNDXBuFaT74m1ysAcPD+wQ2ZJNfqGS+gnTMDydQwGticKxsZ4QROfmw2lPXifw5AJSekfe4VP/tuJxqlIGqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7859
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


On 4/14/2026 5:45 AM, Lin, Shuicheng wrote:
> On Sun, Apr 12, 2026 9:40 PM Riana Tauro wrote:
>> On 4/11/2026 10:16 AM, Nguyen, Brian3 wrote:
>>> On Tuesday, April 7, 2026 3:59 PM, Shuicheng Lin wrote:
>>>> Fix two issues in register_nodes():
>>>>
>>>> 1. When the loop fails mid-way, previously registered nodes are not
>>>>      cleaned up. Add goto-based error unwinding that walks backwards
>>>>      through completed iterations.
>> This was intentional.  If the previous nodes were registered successfully, why
>> free those?
>> Also the errors are only from lack of memory where the entire gpu might not
>> be accessible
> If it is intentional, then I am OK with it.
>
>>>> 2. When allocate_and_copy_counters() fails, assign_node_params()
>>>>      leaves ras->info[severity] as an ERR_PTR and returns. The caller
>>>>      then passes that ERR_PTR to kfree() via cleanup_node_param(),
>>>>      causing an invalid free. Fix by making assign_node_params()
>>>>      self-contained on error: NULL out the stale ERR_PTR and free
>>>>      device_name before returning.
>> allocate_and_copy_counters returns an error only when it fails allocation and
>> when it is NULL. The kfree in mm/slub.c checks and returns when it is NULL. I
>> don't see an issue here. Please provide better reasoning if you think these are
>> still issues. Thanks Riana
> For error case,
> ras->info[severity] = ERR_PTR(-ENOMEM);
> and it will be freed by: kfree(ras->info[severity]);
> so it would be kfree(ERR_PTR(-ENOMEM)), which is not right.

Oh okay. Missed this. You can add this change and drop the first.

Thanks
Riana

> Thanks.
>
> Shuicheng
>
>>>> Fixes: b40db12b542f ("drm/xe/xe_drm_ras: Add support for XE DRM
>> RAS")
>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>> Assisted-by: Claude:claude-opus-4.6
>>>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>>> Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>
>>>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_drm_ras.c | 31 ++++++++++++++++++++++------
>> ---
>>>>    1 file changed, 22 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c
>> b/drivers/gpu/drm/xe/xe_drm_ras.c
>>>> index e07dc23a155e..802e4bcb731c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
>>>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>>>> @@ -73,6 +73,7 @@ static int assign_node_params(struct xe_device *xe,
>> struct drm_ras_node *node,
>>>>    	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>    	struct xe_drm_ras *ras = &xe->ras;
>>>>    	const char *device_name;
>>>> +	int ret;
>>>>
>>>>    	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
>>>>    				pci_domain_nr(pdev->bus), pdev->bus-
>>> number,
>>>> @@ -89,8 +90,11 @@ static int assign_node_params(struct xe_device *xe,
>> struct drm_ras_node *node,
>>>>    	node->priv = xe;
>>>>
>>>>    	ras->info[severity] = allocate_and_copy_counters(xe);
>>>> -	if (IS_ERR(ras->info[severity]))
>>>> -		return PTR_ERR(ras->info[severity]);
>>>> +	if (IS_ERR(ras->info[severity])) {
>>>> +		ret = PTR_ERR(ras->info[severity]);
>>>> +		ras->info[severity] = NULL;
>>>> +		goto err_free_name;
>>>> +	}
>>>>
>>>>    	if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE)
>>>>    		node->query_error_counter =
>> query_correctable_error_counter;
>>>> @@ -98,6 +102,11 @@ static int assign_node_params(struct xe_device
>> *xe, struct drm_ras_node *node,
>>>>    		node->query_error_counter =
>> query_uncorrectable_error_counter;
>>>>    	return 0;
>>>> +
>>>> +err_free_name:
>>>> +	kfree(device_name);
>>>> +	node->device_name = NULL;
>>>> +	return ret;
>>>>    }
>>>>
>>>>    static void cleanup_node_param(struct xe_drm_ras *ras, const enum
>> drm_xe_ras_error_severity severity)
>>>> @@ -114,26 +123,30 @@ static void cleanup_node_param(struct
>> xe_drm_ras *ras, const enum drm_xe_ras_err
>>>>    static int register_nodes(struct xe_device *xe)
>>>>    {
>>>>    	struct xe_drm_ras *ras = &xe->ras;
>>>> -	int i;
>>>> +	int i, ret;
>>>>
>>>>    	for_each_error_severity(i) {
>>>>    		struct drm_ras_node *node = &ras->node[i];
>>>> -		int ret;
>>>>
>>>>    		ret = assign_node_params(xe, node, i);
>>>> -		if (ret) {
>>>> -			cleanup_node_param(ras, i);
>>>> -			return ret;
>>>> -		}
>>>> +		if (ret)
>>>> +			goto err_unwind;
>>>>
>>>>    		ret = drm_ras_node_register(node);
>>>>    		if (ret) {
>>>>    			cleanup_node_param(ras, i);
>>>> -			return ret;
>>>> +			goto err_unwind;
>>>>    		}
>>>>    	}
>>>>
>>>>    	return 0;
>>>> +
>>>> +err_unwind:
>>>> +	while (i--) {
>>>> +		drm_ras_node_unregister(&ras->node[i]);
>>>> +		cleanup_node_param(ras, i);
>>>> +	}
>>>> +	return ret;
>>>>    }
>>>>
>>>>    static void xe_drm_ras_unregister_nodes(struct drm_device *device, void
>> *arg)
>>>> --
>>>> 2.43.0
