Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39B6C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 07:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834B410E4A9;
	Mon, 10 Feb 2025 07:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NikzzWhZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937D310E4A9
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 07:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739171242; x=1770707242;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/bsLL1tD3XcbrkYFlufKojqLb6/FOXRdgXZvOmBjN+Q=;
 b=NikzzWhZrvw88gum3dsF/71xF9LPU11s8+DUhFa8WATfFz6vH/ap+tk6
 uAOABNzQkqq0CP8xgwiY/z1EG0kPrGwRe9pspWibFy2frsr6k96j8PD3q
 IUWvGvBrA1bLLdbmhG0AwnqgmBDk4JPpj+ubMzlnO5KJcnI9OrW5b9FLr
 fFzLAwdUAxEpl1zj6DaWhJxMWot5ZJOmiNgjgAw1c+HpKQdC96kwtkiuT
 enyNpjKDcFcJPEsQ+9lpwxbuprZfNi/9DTUYg7t96czYXHFwg3tNWlCXM
 54wpwnPEMSncmD6LVhpCGyslve0PAH+Y6Jcml3RXArCE1ecHe+utC91m+ g==;
X-CSE-ConnectionGUID: uyoS3yMgR2ONq1gWrgvOeQ==
X-CSE-MsgGUID: KrZR2KRgQoWvBkCxQxt9lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="38971374"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="38971374"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 23:07:21 -0800
X-CSE-ConnectionGUID: VerKjW8BS8aEY4Qtmv9W4Q==
X-CSE-MsgGUID: fcG8kgAgSeWgqoL9iZpO2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="112046416"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 23:07:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 23:07:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 23:07:20 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 23:07:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ic4g2tFmEOVeKyfOhaWWbgr1DoBTvrlVf0dl177yEUDaPGJt7NJsfr5bNqNYmxuRIBhJwY+MAZYIdHSlTuJsAm9B/qNavzIHQHm3stYQeae9LRkSGOBjPiFt6uXZKif4zl6bN9lywdckpgjL0AE1Mnn5v20a4Vlw2s7fKEs1zEYiMqnBHlECsDlkfqCbyHuiHHHgBucosrQt9K4GM/oILI9kDi00CC58BPYQLwa6Dr7s/kScuTfQLRMbOWkPj8LPT2yP9qiPd32Nuqp+o/8C+BNxCD1N3XM3z0HH+mtEjIyPgjpS/oypblc8SMjQQ1jBcdi7d42eUGj+0AtHTlosKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/vkpDzU1v37HLdOlKffeLmhNSomhpTVo0pcSHZdRyM=;
 b=FkqeJBUajtXpEJWq0Mvv5I+tHOsQZ/03OURBmflkfeNcFmjFhmz9XFZs8RKZa2xE4JNMhPnCiJYZSJXnU0UiVDs7WGs6MVkExQjW5zw0pMYAVjBb8uT9EixzMKHqk5S5jUUe6m67tKYZf5gE7WeBfMJwsTXJTmW+IBLfJim0YXNSbZNQo2Gwv+W/9FFnEJ23ce7IdWsomMIeI2XgoODUBmTVFhe/k4Nt0ricOZliUCiZkeguoOjV2/3sZ1L9n26z8SgKINU77RiaHzRcVO8xqIAkp7HjbcVgRsfWRrCpd4ullNTIxgJRXVyWDsZkiawnGRtPq32KOxTiBVTN1ZKh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.15; Mon, 10 Feb 2025 07:07:15 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8422.010; Mon, 10 Feb 2025
 07:07:15 +0000
Message-ID: <237a3917-eb00-455e-8c38-914da68978bf@intel.com>
Date: Mon, 10 Feb 2025 12:37:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] drm/xe: Add engine activity support
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-2-riana.tauro@intel.com>
 <85246c5e-7033-4898-bc08-a97f2180af0e@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <85246c5e-7033-4898-bc08-a97f2180af0e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: d47439ac-5a1a-482a-53ab-08dd49a18c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEtSNGl2WStyRU9VQjlXOGJYMDIvRnVOdXFrekdPYnpDM0tSOFhhb3VScGNz?=
 =?utf-8?B?aWdieWxDKzc1eXNLRTltKzY0UFlIcmZyUDlWdnVSdDcyTzB2amo3NWlld1FU?=
 =?utf-8?B?clU2c1pFYW55bEh0QzNOd3N1QW1NNEZ4Z2hNYkdsenppNWdJYlFYdHZaYnRO?=
 =?utf-8?B?UldaTkRVT3R4SFg2b3VGM2RCZ1NtdlR6YUJGZk9sc1oxREMyREdOUWZHS2Ri?=
 =?utf-8?B?ZE5jRjZIRW94WkhySTNQN2NKWXRIQnp2MHdzbVpRa0FpM3VqNzQ2UWZoUU9k?=
 =?utf-8?B?NUVJZVowQXlLanE5KzJ6YytQd3dYeEozRDB2ZVExcWdhbmZ1VTdWVG43UGI0?=
 =?utf-8?B?dmdwanlGVStaTlNIY0UycjNQaW9kSTFVQ0I0TnV0OFBQdURjcmVhd1VRSVJW?=
 =?utf-8?B?dnN0b3k1c041ODI4alNSMTFWcHFwaDFOaHZlajVPM1hVcHVBL1RxTnZZTDR1?=
 =?utf-8?B?QTZtNXJoUGY4RXBQckhac0hGbWpWcmNobVQ0L21yb0NuWXZPcGdkR2lXTGJa?=
 =?utf-8?B?SzFrSnlEK09JMnRFTStOeC85YittbWRiVy92ZnllaEx5eVJQNit5TzZ3bHlh?=
 =?utf-8?B?NkdjRUo2TWwwL2tBY05vS21Dc0MvUzl4T1FLNEtYbjVNOUh6b2pBcGZRRWhH?=
 =?utf-8?B?R3RnVHRXZ1JIQ0FSOEIwS0FVeW1rMVNHaWdSYkErVUliUndoU3dqNDZJYmg4?=
 =?utf-8?B?UmhRNGxiK2x5VEI3MnVHY2lIdlFFSHpUQ3dhbklKcnRwOSsrNGhMejAvZ3Rn?=
 =?utf-8?B?T252enhqTGxaR1FDVnpsVG1HMWlxU096clVYLzZqSUsrMUtNRFdqdmxUa1Yr?=
 =?utf-8?B?VGNRUWE0T0MxSUE4bFRxdWRsS2kxeE9lMmdrSUhlVHc5UDJRcDdiWEZsbitB?=
 =?utf-8?B?b1EweVFSUUxMOWVoTUZ6RjExSzlUU3VSbnpabG8wRkxPZVJYd0M2SnlJbis1?=
 =?utf-8?B?NDFBcWZacHMySFdWQmhPT2kwTEltWjExYUV3RG0zM3B0L2FuMktNU0dvekZq?=
 =?utf-8?B?QnVQbkQ5OWphWVhMWVcvVXp6M2ZJeGZuN0p6L3o4ZzdPRmY2WC9BbTZuRWow?=
 =?utf-8?B?cjA4bXlUUVRBcUJTUW00eTJJdE8vallFalhmYzBrZ3kyMk1vYisxcS96emVU?=
 =?utf-8?B?YzlmMThycUNQZk5aQ0xpQkR0U0VZL01SRElpaVg0Ry9CZ0pvc2Jpblk3c25w?=
 =?utf-8?B?Nml4V252aWFmNlArczk3SFVCYmIwTHhnaC9DUEhwYkhvOEJ5ZHUxVVVmNW5y?=
 =?utf-8?B?QmMxRUlmUDM4em5GU3pReU1neEpMbHpIOHduQVdNcGd6MlFpSkZ2T1FneXlG?=
 =?utf-8?B?bGJLdVd1QmpONXViSG9pZGhvMzVFV2lHYUVKWGpmNzZSS0RVQVQ4U0NISlhn?=
 =?utf-8?B?a2V3VjVxeGFCWWxpZHFLeDJwMzdKSHRBbGFRakNEQWttYVk2N29tRnJqam81?=
 =?utf-8?B?Q2RvTzJQQmdGNkhQVVBHa3BiVmdCcFVFTSswVnFnZldwRExHTTVjK1laSHBS?=
 =?utf-8?B?NE92bFQ1UTZCTjRmUHFSVUxWNEM3NXpOQzJYWVM1VjlsRHZRMkt2WkI0Y1BK?=
 =?utf-8?B?SGFnS0R1b1ozK0JZcnhRWmpEb0tDK0JqaFVZRUE0RmNEVXdMYzcwRkw3cE1y?=
 =?utf-8?B?L2Z5VUJ0bnU5UmI0aXhFYU9ncm9seTJNTnQ0azZxMmtyRm11QTFVWHhnL0o2?=
 =?utf-8?B?blZ4eWVLdUtYNThtbGZlV1pJMVBpMTZSd3J3R1ZiS2xkdzV1R05scldxMnV1?=
 =?utf-8?B?OXlxUWhQOW9oYysrRy9hL2lmWlhpeVBWN2xTNGM2WmtQTG5zYUY2UDB4YWJG?=
 =?utf-8?B?SlAzTmhtNGVVMVNKOFFORFBkNHJyMDRadUd2MTRYNnBNejZWRXk2K01yYjlX?=
 =?utf-8?Q?QcOp/RTqDfBHI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDlRa3hNMDBOd0FFM0dpTWNLa09jUklCU0NjcWlnSnM3b1owK0J1cmYzZm9F?=
 =?utf-8?B?K3hhMjFqZ2QyeUpqQnd0cmRObG8zRldPdzZKcHh1MU13K200a2RNSUJvQkQ1?=
 =?utf-8?B?MFp2WHRDOEdSUVdQcmtOdnBMTytaMXhaYms3Ynh4aWFLckk0RTkza2JnM21C?=
 =?utf-8?B?UlluaWc0dTIvaTRqcUVieGx2UGhLR0VDUFpyUmUrQlZZUnhvYm9ac3owaWJZ?=
 =?utf-8?B?cXBGWSszZG05OCtsREJjWC9OZUZHTDlhcTVtVEFwMm9PMWFYZWZ4ejFWeHZ3?=
 =?utf-8?B?VmpNV2kwOWxCUG85Y05YOUE0U0ZWTWVyVXhhaXU1elNHSWJPNlpLY21wbUxi?=
 =?utf-8?B?SUxRK25pUyszQzlrZzI2NXcvT2V5R0VMdGR5RVloYXdqd2RRRUhUWXJ4M25p?=
 =?utf-8?B?Vm1Ic3pKK1pTTFN6bzY3UlVpNE1lVmxUNjUvMVdBU21HMmt6Q2VSRGQxWCt2?=
 =?utf-8?B?WjNMU21zejcvTEk4QzVLNFdESVh5N25zZ29MUlB5TkM4a0o1M3JKSGMvYk1U?=
 =?utf-8?B?cjlVQkJKSEgvbFFGSHI2cjBXZnZ4MkhOaGNGYzkrNlkzZ1lST24zd0RhcXBk?=
 =?utf-8?B?OWxwRDZWRDlPbmZxTUFIeU5uMHRzUlpqY2p2VXdPdFl0VHE1ZlFnZzlKV0o2?=
 =?utf-8?B?REJ0ZVR5UHBvTVNDdGZ1bTRRdEI2dlprQVM2TDZKVjBrdXkwdXYvc1cza0hR?=
 =?utf-8?B?aDQvcm1YS3ZhUlBmTXRUMTcvdStTTGc4VVdDcWJoS3ZnZ0Q4SGJ6QzcrQktp?=
 =?utf-8?B?ZVJOemZGWEFlTlVLTURrZkoyQldraDlJbHZNdjBvZDA5Ty9mdVhjQkRLSTJL?=
 =?utf-8?B?YlIzcWlYTSs4VGNoZWZIYUU3ZThkeEFqV2lqMGxlNUJ5ZFBNMktUeUJQU1V1?=
 =?utf-8?B?VUhFWUNxVzg0T3ZRcUhyRVFUb1NMUE8rcC9OcWNQaUExVDRvZWJWS0FUc1BC?=
 =?utf-8?B?TWxkVVNBVHlLMWZaOEs1aExCeDQvbFpQWXJSV1RmMFNjWjNqZ3ZmZ2greFpp?=
 =?utf-8?B?QmM1bDJVaU03N0RORFNFM2pxeWdFb1BWMXl1cnZDdzV4dEhCeUFOOWxLRUNn?=
 =?utf-8?B?OUsrQ1JpeFFmcHQwTU14UkF0aExVcEtsNjYwQWJsMVdWUGo4d1hYMzlnV1Uy?=
 =?utf-8?B?Q3VNemVXdFova3JpMzZCMm9hWHMzUWdjOGJGRHIyWUsvTTltb3cxd2JSNDVR?=
 =?utf-8?B?WnYrY0p6QkdaU0gwYXUvZXdmRkt0WVZObENkcUVha1YvSVZQUHVJeEhjeVlF?=
 =?utf-8?B?NVNpZG13ZmUzZ3NRcTlQR2gzNmJIVDBwRjZHandaV1ljY3FPQ1EwU2FweDUy?=
 =?utf-8?B?ZkVyOHIzVDdkaFJmaW5HeWQ0dVdHTG5GZWVVdEp3RldOUXowKzA3dzgvSjFV?=
 =?utf-8?B?ZFBEVWN4ZUdzSVh1OUg2Q1ZJN1dxS2lVZVprSU5vUGRXaXVjOXFqM2ZpRU5u?=
 =?utf-8?B?cXd6SnViVC9nL0dDMnQ1dmlCRThSMjY2NDFhQjlDUURGa2V1WmJzS2U1U3dQ?=
 =?utf-8?B?RXZQVHFaNFloYjlqOVA4c1NyNEVueTRJNUtNRkh5Y0dQVkszUWZJZEU5d3Yy?=
 =?utf-8?B?bVdJRDR5QVlFcmpRQzJtR0gwZjlRRXAybnJENmwyMSt5WTdBU2g4clpSL3pX?=
 =?utf-8?B?VU5raVJLL3ZsMzRNNmpLTUJQUEduRUJaS1pZcVlYV0FQMERIb01kZEZpdnNR?=
 =?utf-8?B?a2RkeDJ4SkZDWlFaeCs4Q25IaHRobmMxQjZQMWM0UjZSU1ZCb2EzRFN6Rkdv?=
 =?utf-8?B?Um9UalFxVWV4WFV1cmd5YnBnVCtsRDg0U2RnTkE0V2NBakhUQk5PdHdZWVZN?=
 =?utf-8?B?V3RyL3BNckFIblhGcHd6Mk1jVXZXODdUMFBzR2NUa2RlaFhjcldoaFBBbWpE?=
 =?utf-8?B?elVJVVlGTW8yMnd3TVkyQTVLQ0dUbnRjdW12Z2YydFVWdDBaZ1g2a2U2QnJ4?=
 =?utf-8?B?NW15VmdHVEkzU05NQnhvR25BRzRBWHFQWVpJL2p4TVBYVkJHWVk1K3B0TWpU?=
 =?utf-8?B?YWMzUFd1bTZKb1ZHbHFQVGQwWWtaZG1EZHRPcHlGSTh5dG40c1ZaMjRadThD?=
 =?utf-8?B?Q21UQ0hGbFdnMGhlYXRFMjJWcnNsZGFXQXhGalMzc21lcHp2MENwQjEwZUxX?=
 =?utf-8?Q?fciqHQRm2hljZIxM3ocxPsjtb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d47439ac-5a1a-482a-53ab-08dd49a18c3a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 07:07:15.2608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StBKNG0iDkj6Q+Bqb5QEeOsPLXctfDlwqe8OfEUwwytQr5UgW13piiMVTCrkVBMMpolLudayotEojUVlayyp/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
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

Hi Michal

Thank you for the review comments

On 2/6/2025 11:58 PM, Michal Wajdeczko wrote:
> 
> 
> On 06.02.2025 11:43, Riana Tauro wrote:
>> GuC provides support to read engine counters to calculate the
>> engine activity. KMD exposes two counters via the PMU interface to
>> calculate engine activity
>>
>> Engine Active Ticks(engine-active-ticks) - active ticks of engine
>> Engine Total Ticks (engine-total-ticks) - total ticks of engine
>>
>> Engine activity percentage can be calculated as below
>> Engine activity % = (engine active ticks/engine total ticks) * 100.
>>
>> v2: fix cosmetic review comments
>>      add forcewake for gpm_ts (Umesh)
>>
>> v3: fix CI hooks error
>>      change function parameters and unpin bo on error
>>      of allocate_activity_buffers
>>      fix kernel-doc (Umesh)
>>      use engine activity (Umesh, Lucas)
>>      rename xe_engine_activity to xe_guc_engine_*
>>      fix commit message to use engine activity (Lucas, Umesh)
>>
>> v4: remove forcewake as engine is already running
>>      when reading gpm timestamp
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 317 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  18 +
>>   .../gpu/drm/xe/xe_guc_engine_activity_types.h |  89 +++++
>>   drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
>>   drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
>>   8 files changed, 451 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 5ce65ccb3c08..aa5673f6aadf 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
>>   	xe_device_sysfs.o \
>>   	xe_dma_buf.o \
>>   	xe_drm_client.o \
>> +	xe_guc_engine_activity.o \
> 
> is this a right spot for this new .o ?
> 
>>   	xe_exec.o \
>>   	xe_exec_queue.o \
>>   	xe_execlist.o \
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index fee385532fb0..ec516e838ee8 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -140,6 +140,7 @@ enum xe_guc_action {
>>   	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>   	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>   	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>> +	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>>   	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>   	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>   	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 096859072396..124cc398798e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -358,6 +358,8 @@
>>   #define   RENDER_AWAKE_STATUS			REG_BIT(1)
>>   #define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
>>   
>> +#define MISC_STATUS_0				XE_REG(0xa500)
>> +
>>   #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>>   #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>>   #define FORCEWAKE_GSC				XE_REG(0xa618)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> new file mode 100644
>> index 000000000000..088209b9c228
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> @@ -0,0 +1,317 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
> 
> shouldn't we have 1 empty line here?
> 
>> +#include "xe_guc_engine_activity.h"
> 
> nit: since we have HDRTEST enabled, it's also OK to include this .h
> inline with rest of xe headers below
> 
>> +
>> +#include "abi/guc_actions_abi.h"
>> +#include "regs/xe_gt_regs.h"
>> +
>> +#include "xe_bo.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_ct.h"
>> +#include "xe_hw_engine.h"
>> +#include "xe_map.h"
>> +#include "xe_mmio.h"
>> +
>> +#define TOTAL_QUANTA 0x8000
>> +
>> +static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> +{
>> +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +	size_t offset = 0;
> 
> no need to initialize here, you set it up just below
> 
>> +
>> +	offset = offsetof(struct guc_engine_activity_data,
>> +			  engine_activity[guc_class][hwe->logical_instance]);
>> +
>> +	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>> +}
>> +
>> +static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>> +{
>> +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> +
>> +	return buffer->metadata_bo->vmap;
>> +}
>> +
>> +static int allocate_engine_activity_group(struct xe_guc *guc)
>> +{
>> +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> +	u32 num_activity_group = 1;
> 
> maybe add some comment that this is for future extension coming soon?
> 
>> +
>> +	engine_activity->eag = kmalloc_array(num_activity_group,
>> +					     sizeof(struct engine_activity_group),
>> +					     GFP_KERNEL);
>> +
>> +	if (!engine_activity->eag)
>> +		return -ENOMEM;
>> +
>> +	memset(engine_activity->eag, 0, num_activity_group * sizeof(struct engine_activity_group));
> 
> can't we just pass _GFP_ZERO to kmalloc_array() ?
> 
>> +	engine_activity->num_activity_group = num_activity_group;
>> +
>> +	return 0;
>> +}
>> +
>> +static int allocate_engine_activity_buffers(struct xe_guc *guc,
>> +					    struct engine_activity_buffer *buffer)
>> +{
>> +	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>> +	u32 size = sizeof(struct guc_engine_activity_data);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_bo *bo, *metadata_bo;
>> +
>> +	metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
>> +						   XE_BO_FLAG_SYSTEM |
>> +						   XE_BO_FLAG_GGTT |
>> +						   XE_BO_FLAG_GGTT_INVALIDATE);
>> +	if (IS_ERR(metadata_bo))
>> +		return PTR_ERR(metadata_bo);
>> +
>> +	bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(size),
>> +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +					  XE_BO_FLAG_GGTT |
>> +					  XE_BO_FLAG_GGTT_INVALIDATE);
>> +
>> +	if (IS_ERR(bo)) {
>> +		xe_bo_unpin_map_no_vm(metadata_bo);
> 
> metadata_bo is managed, you risk UAF on release
> 
>> +		return PTR_ERR(bo);
>> +	}
>> +
>> +	buffer->metadata_bo = metadata_bo;
>> +	buffer->activity_bo = bo;
>> +	return 0;
>> +}
>> +
>> +static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>> +{
>> +	struct xe_guc *guc = &hwe->gt->uc.guc;
>> +	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>> +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +
>> +	return &eag->engine[guc_class][hwe->logical_instance];
>> +}
>> +
>> +static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>> +{
>> +	return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
>> +}
>> +
>> +#define read_engine_activity_record(xe_, map_, field_) \
>> +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
>> +
>> +#define read_metadata_record(xe_, map_, field_) \
>> +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
>> +
>> +static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> +{
>> +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> +	struct guc_engine_activity *cached_activity = &ea->activity;
>> +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>> +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> +	struct iosys_map activity_map, metadata_map;
>> +	struct xe_device *xe =  guc_to_xe(guc);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	u32 last_update_tick, global_change_num;
>> +	u64 active_ticks, gpm_ts;
>> +	u16 change_num;
>> +
>> +	activity_map = engine_activity_map(guc, hwe);
>> +	metadata_map = engine_metadata_map(guc);
>> +	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
>> +
>> +	/* GuC has not initialized activity data yet, return 0 */
>> +	if (!global_change_num)
>> +		goto update;
>> +
>> +	if (global_change_num == cached_metadata->global_change_num)
>> +		goto update;
>> +	else
> 
> 'else' not needed here after 'goto'
> 
>> +		cached_metadata->global_change_num = global_change_num;
>> +
>> +	change_num = read_engine_activity_record(xe, &activity_map, change_num);
>> +
>> +	if (!change_num || change_num == cached_activity->change_num)
>> +		goto update;
>> +
>> +	/* read engine activity values */
>> +	last_update_tick = read_engine_activity_record(xe, &activity_map, last_update_tick);
>> +	active_ticks = read_engine_activity_record(xe, &activity_map, active_ticks);
>> +
>> +	/* activity calculations */
>> +	ea->running = !!last_update_tick;
>> +	ea->total += active_ticks - cached_activity->active_ticks;
>> +	ea->active = 0;
>> +
>> +	/* cache the counter */
>> +	cached_activity->change_num = change_num;
>> +	cached_activity->last_update_tick = last_update_tick;
>> +	cached_activity->active_ticks = active_ticks;
>> +
>> +update:
>> +	if (ea->running) {
>> +		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>> +			 engine_activity->gpm_timestamp_shift;
>> +		ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
>> +	}
>> +
>> +	return ea->total + ea->active;
>> +}
>> +
>> +static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> +{
>> +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>> +	struct guc_engine_activity *cached_activity = &ea->activity;
>> +	struct iosys_map activity_map, metadata_map;
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	ktime_t now, cpu_delta;
>> +	u64 numerator;
>> +	u16 quanta_ratio;
>> +
>> +	activity_map = engine_activity_map(guc, hwe);
>> +	metadata_map = engine_metadata_map(guc);
>> +
>> +	if (!cached_metadata->guc_tsc_frequency_hz)
>> +		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
>> +									     guc_tsc_frequency_hz);
>> +
>> +	quanta_ratio = read_engine_activity_record(xe, &activity_map, quanta_ratio);
>> +	cached_activity->quanta_ratio = quanta_ratio;
>> +
>> +	/* Total ticks calculations */
>> +	now = ktime_get();
>> +	cpu_delta = now - ea->last_cpu_ts;
>> +	ea->last_cpu_ts = now;
>> +	numerator = (ea->quanta_remainder_ns + cpu_delta) * cached_activity->quanta_ratio;
>> +	ea->quanta_ns += numerator / TOTAL_QUANTA;
>> +	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
>> +	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
>> +
>> +	return ea->quanta;
>> +}
>> +
>> +static int enable_engine_activity_stats(struct xe_guc *guc)
>> +{
>> +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>> +	u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>> +	u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>> +	int len = 0;
>> +	u32 action[5];
> 
> magic 5, maybe define action as
> 
> 	u32 action[] = {
> 		XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER,
> 		xe_bo_ggtt_addr(buffer->metadata_bo),
> 		0,
> 		xe_bo_ggtt_addr(buffer->activity_bo),
> 		0,
> 	};
> 
>> +
>> +	action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
>> +	action[len++] = metadata_ggtt_addr;
>> +	action[len++] = 0;
>> +	action[len++] = ggtt_addr;
>> +	action[len++] = 0;
>> +
>> +	/* Blocking here to ensure the buffers are ready before reading them */
>> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> +}
>> +
>> +static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>> +{
>> +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> +	struct engine_activity_group *eag = &engine_activity->eag[0];
>> +	int i, j;
>> +
>> +	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>> +		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>> +			eag->engine[i][j].last_cpu_ts = ktime_get();
> 
> do we need to call ktime_get() inside the loop?
Since we have to loop it again anyway, used it inside loop.
> 
>> +}
>> +
>> +static u32 gpm_timestamp_shift(struct xe_gt *gt)
>> +{
>> +	u32 reg;
>> +
>> +	reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>> +
>> +	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>> +}
>> +
>> +/**
>> + * xe_guc_engine_activity_active_ticks - Get engine active ticks
>> + * @hwe: The hw_engine object
>> + *
>> + * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
>> + */
>> +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
> 
> this function doesn't fit here as it takes hwe, not guc
This function has to have hwe. Even if i move to xe_hw_engine file it 
still needs to come to this layer with the same parameters

Can add an additional parameter guc along with hwe.

Will fix the rest of the review comments

Thank you
Riana
> 
>> +{
>> +	struct xe_guc *guc =  &hwe->gt->uc.guc;
>> +
>> +	return get_engine_active_ticks(guc, hwe);
>> +}
>> +
>> +/**
>> + * xe_guc_engine_activity_total_ticks - Get engine total ticks
>> + * @hwe: The hw_engine object
>> + *
>> + * Return: accumulated quanta of ticks allocated for the engine
>> + */
>> +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
> 
> ditto
> 
>> +{
>> +	struct xe_guc *guc =  &hwe->gt->uc.guc;
>> +
>> +	return get_engine_total_ticks(guc, hwe);
>> +}
>> +
>> +/**
>> + * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>> + * @guc: The GuC object
>> + *
>> + * Enable engine activity stats and set initial timestamps
>> + */
>> +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>> +{
>> +	int ret;
>> +
>> +	ret = enable_engine_activity_stats(guc);
>> +	if (ret)
>> +		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>> +	else
>> +		engine_activity_set_cpu_ts(guc);
>> +}
>> +
>> +static void engine_activity_fini(void *arg)
>> +{
>> +	struct xe_guc_engine_activity *engine_activity = arg;
>> +
>> +	kfree(engine_activity->eag);
>> +}
>> +
>> +/**
>> + * xe_guc_engine_activity_init - Initialize the engine activity data
>> + * @guc: The GuC object
>> + *
>> + * Return: 0 on success, negative error code otherwise.
>> + */
>> +int xe_guc_engine_activity_init(struct xe_guc *guc)
>> +{
>> +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	int ret;
> 
> this feature likely will not work on VF
> shouldn't we at least assert here that we don't call this init() when
> running as VF ?
> 
>> +
>> +	ret = allocate_engine_activity_group(guc);
>> +	if (ret) {
>> +		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
> 
> nit: it's nicer to print error codes as %pe
> 
>> +		return ret;
>> +	}
>> +
>> +	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
>> +	if (ret) {
>> +		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
> 
> nit: it's nicer to print error codes as %pe
> 
>> +		kfree(engine_activity->eag);
>> +		return ret;
>> +	}
>> +
>> +	engine_activity->gpm_timestamp_shift = gpm_timestamp_shift(gt);
>> +
>> +	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, engine_activity_fini,
>> +					engine_activity);
> 
> engine_activity->eag is just a plain memory
> can't we just make it drm_managed ?
> 
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> new file mode 100644
>> index 000000000000..c00f3da5513d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_ENGINE_ACTIVITY_H_
>> +#define _XE_GUC_ENGINE_ACTIVITY_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_hw_engine;
>> +struct xe_guc;
>> +
>> +int xe_guc_engine_activity_init(struct xe_guc *guc);
>> +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>> +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>> +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> new file mode 100644
>> index 000000000000..a2ab327d3eec
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>> @@ -0,0 +1,89 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>> +#define _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#include "xe_guc_fwif.h"
>> +/**
>> + * struct engine_activity - Engine specific activity data
>> + *
>> + * Contains engine specific activity data and snapshot of the
>> + * structures from GuC
>> + */
>> +struct engine_activity {
>> +	/** @active: current activity */
>> +	u64 active;
>> +
>> +	/** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>> +	u64 last_cpu_ts;
>> +
>> +	/** @quanta: total quanta used on HW */
>> +	u64 quanta;
>> +
>> +	/** @quanta_ns: total quanta_ns used on HW */
>> +	u64 quanta_ns;
>> +
>> +	/**
>> +	 * @quanta_remainder_ns: remainder when the CPU time is scaled as
>> +	 * per the quanta_ratio. This remainder is used in subsequent
>> +	 * quanta calculations.
>> +	 */
>> +	u64 quanta_remainder_ns;
>> +
>> +	/** @total: total engine activity */
>> +	u64 total;
>> +
>> +	/** @running: true if engine is running some work */
>> +	bool running;
>> +
>> +	/** @metadata: snapshot of engine activity metadata */
>> +	struct guc_engine_activity_metadata metadata;
>> +
>> +	/** @activity: snapshot of engine activity counter */
>> +	struct guc_engine_activity activity;
>> +};
>> +
>> +/**
>> + * struct engine_activity_group - Activity data for all engines
>> + */
>> +struct engine_activity_group {
>> +	/** @engine: engine specific activity data */
>> +	struct engine_activity engine[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> +};
>> +
>> +/**
>> + * struct engine_activity_buffer - engine activity buffers
>> + *
>> + * This contains the buffers allocated for metadata and activity data
>> + */
>> +struct engine_activity_buffer {
>> +	/** @activity_bo: object allocated to hold activity data */
>> +	struct xe_bo *activity_bo;
>> +
>> +	/** @metadata_bo: object allocated to hold activity metadata */
>> +	struct xe_bo *metadata_bo;
>> +};
>> +
>> +/**
>> + * struct xe_guc_engine_activity - Data used by engine activity implementation
>> + */
>> +struct xe_guc_engine_activity {
>> +	/** @gpm_timestamp_shift: Right shift value for the gpm timestamp */
>> +	u32 gpm_timestamp_shift;
>> +
>> +	/** @num_activity_group: number of activity groups */
>> +	u32 num_activity_group;
>> +
>> +	/** @eag: holds the device level engine activity data */
>> +	struct engine_activity_group *eag;
>> +
>> +	/** @device_buffer: buffer object for global engine activity */
>> +	struct engine_activity_buffer device_buffer;
>> +};
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index 057153f89b30..6f57578b07cb 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -208,6 +208,25 @@ struct guc_engine_usage {
>>   	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>   } __packed;
>>   
>> +/* Engine Activity stats */
>> +struct guc_engine_activity {
>> +	u16 change_num;
>> +	u16 quanta_ratio;
>> +	u32 last_update_tick;
>> +	u64 active_ticks;
>> +} __packed;
>> +
>> +struct guc_engine_activity_data {
>> +	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> +} __packed;
>> +
>> +struct guc_engine_activity_metadata {
>> +	u32 guc_tsc_frequency_hz;
>> +	u32 lag_latency_usec;
>> +	u32 global_change_num;
>> +	u32 reserved;
>> +} __packed;
>> +
>>   /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>>   enum xe_guc_recv_message {
>>   	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>> index 573aa6308380..63bac64429a5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -13,6 +13,7 @@
>>   #include "xe_guc_ads_types.h"
>>   #include "xe_guc_buf_types.h"
>>   #include "xe_guc_ct_types.h"
>> +#include "xe_guc_engine_activity_types.h"
>>   #include "xe_guc_fwif.h"
>>   #include "xe_guc_log_types.h"
>>   #include "xe_guc_pc_types.h"
>> @@ -103,6 +104,9 @@ struct xe_guc {
>>   	/** @relay: GuC Relay Communication used in SR-IOV */
>>   	struct xe_guc_relay relay;
>>   
>> +	/** @engine_activity: Device specific engine activity */
>> +	struct xe_guc_engine_activity engine_activity;
>> +
>>   	/**
>>   	 * @notify_reg: Register which is written to notify GuC of H2G messages
>>   	 */
> 

