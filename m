Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A122ACF042D
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 23:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA0810E617;
	Tue,  8 Oct 2024 23:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9RRRHMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CC210E615
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 23:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728431760; x=1759967760;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xbNPLoNJns9pTDzyY6JrwoSZugpNqtxvjO5E0cL4Blg=;
 b=X9RRRHMFuzYjRbjwsM+6UmRG0m8StkrjYMFqJRNYwl2zdY8RBgOdLvO/
 A7HAGThi+nzZ6mBEt03z92QPXFS8uODbwiI8VUdiH9r+QMtvtQpRjw88i
 Gw23oA+05XIr8ORidrd+xt/KHUsve4RZSTRR1UmGm7UG0SwukDAIueMZq
 0RcP5P906ItKQQYyXnbmdNYzJ9a+XE8Lk7P9vMJEXAbxjwIA/1DevbEpR
 o5hshmwmw23XfKoSYuCSNs0JvSNDH94pbxXNP73jaHlxUdJePov1DXxH9
 MJPADWm5btLM3UE2WTcVp6fcJ/pIqTs0oSxI9jtBEjJNKfCP0x8Pz6vbk A==;
X-CSE-ConnectionGUID: vEcIBNzTR72LfzZ55lnARA==
X-CSE-MsgGUID: LTSkKJHNRb6KvI/uXV7OAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27574761"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="27574761"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 16:55:56 -0700
X-CSE-ConnectionGUID: Se7s0B3rS9CPpTlv5u+Rig==
X-CSE-MsgGUID: WFEtytMSSGu3TV4bEjKaqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="106800703"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 16:55:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 16:55:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 16:55:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 16:55:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPGC1Z53JX9uH2fUu0ERqtJQ6kpFHjyCEj41e3s58nRhDMxIDBKyhefUw1Me+6DaRSypVVL1CHQT3kBrQxi08Xn4ksGC3+2YV3RoH5llPQXwP49iBY9Ld70Uwco5t1f/b3lF7nEcCcAgUbiSeyveUYAOsPCbqBHPbMhdsDP+wkTZSLOKiarY8IqiuwA0+bkMt5ylKnSi+85El9KJYgPKUbECVZqNUu56epw3kz0wPeGuTwJfy+uegRVhRM3YF6OvqhW+gPSUliI+e7Ebqgn56L6N4XHr7d+QX4jxLsishtRcOGdKn1lgu5CtBfdivFq+Qd5F1bMrnVSb1k42mJjw/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hprjdSrNhvimHF46IdDY+DzKvCa9l4iLTegVngvpOTc=;
 b=Q3QMTtu/q9pM70IuS9VWQX1NL/kGmqVbNd8l7nrFfsNY5zRZo82+SRkacGLACaZqwkO/fFGeaClQ2Z8nkM0AVyn7KR/WoS6Zx7uANGZTeBz5KrkUshUOgNHfoWqst5Qx+miLr668WQ5NrBjmYQtW3zAydZCFSOikNn8DYTMHRPYyW8/stFTAA72qaz7YmFTrlI0L1BgmbQJJFsLC2dvdorK0q/N9Z5PEPw1f695EuWshnR//KHyxxP2UPsxWu+dCjEIKFDM1fty1dfrcXF0zhSiWYw3/0na6Zl8uecJyWcXy8VeuC7ftLeuVK36+Y4/Z/GbcmcQFu7FXA1xB1U8W1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BL3PR11MB6338.namprd11.prod.outlook.com (2603:10b6:208:3b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 23:55:49 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 23:55:49 +0000
Message-ID: <63591af8-7d95-44b2-b3c0-3890b850d80b@intel.com>
Date: Tue, 8 Oct 2024 16:55:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] drm/xe/pxp: Add spport for PXP-using queues
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-8-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240816190024.2176976-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0011.namprd16.prod.outlook.com (2603:10b6:907::24)
 To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BL3PR11MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d91e92-25a4-4b35-3abb-08dce7f4bbd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVI1L2ZEVlZmV2pCRHFQclNhVk5TVnBPUWJkRllCL2RhalhWdm5GNE9XOEd5?=
 =?utf-8?B?ZEp1eXRHbXlGWmwzaVk1K2p3a24xMEVmY2huTm1Uak9sSTFnSTlWTzJxZzZp?=
 =?utf-8?B?VlZjQmV1aVRLS1NxUDQwbHNwVnI2VXZoN2Z3WUw2L0ZCV3JnbEtnQkx4RXYv?=
 =?utf-8?B?OWZ5bE9NTGpkeTdMcFpaUDJoNjZqZGRSaVB3MnkrL1VKZC9yQ2ZENDJjVXhP?=
 =?utf-8?B?dFFCNlpJVWtRN1RuK3BNam5rK1I5cWFmaTRLUW5GdGxEb0t0YWdrZWMxOFpt?=
 =?utf-8?B?V2c1SWR2RVFZWGZLVy92a2hJZ1JIWkh4b3JaZVRaUkk0THlzV1BVMEdsK3A1?=
 =?utf-8?B?VGdqd24xUE1zRDJRamRFakI2NWp2cXdUdmFRL1V1Qzg3TmF1VXFGNHdqVnpa?=
 =?utf-8?B?MG90L0R4SExwVnJpRXplblM2N3FFeGVKMTROZ3RtSk00Tk9YOUxoZ0RrQVF0?=
 =?utf-8?B?T1ExTmxsNHVCRE1kUVFVanF4SjhwcjRGbXdUQnVraWFNajl2TmYyb3RVSXJB?=
 =?utf-8?B?b2ppT2FuWndtTW5WY2xQYzhzNWdrRFA3d3ZRbUdoWjhURUdHbWVCWkZsZ2xo?=
 =?utf-8?B?QTh5Yzk0UVQxd0FReDk4QytWZndvMG1VSjVmV3pqRDdjTDNXcUtpa0lPUmJU?=
 =?utf-8?B?eWxYOG1YWlJjdVBYUkZzZ2RrVk95RHJ3SE9nWDdseHJSWWZpc0REQW8rWVIx?=
 =?utf-8?B?czFoeHpKT3RMaWowTUtEd3dTa3UyaGNjc29NcXhDbk9tVmQwTkh4MzhTZC9E?=
 =?utf-8?B?RHBFUWhwbW1CenZKMjY5eFdBRkJ4Vm1OZGhxdHh4dDljMzhuR0d6QlhXc2Jk?=
 =?utf-8?B?MDFYVnNUem1TbzhpMEQ1WkYwNzUyakFxWVV6bHZGMThNeUxNYXJ2SzZjQVY5?=
 =?utf-8?B?Yitpa2tXUUs3SGlibXBaVS9BWkRvVUtWdDRhcXZFLzdVTjR5ZkQvMktUNmZz?=
 =?utf-8?B?SmtVN0NhWk1QZlFCTW1wK0dBZHZPSkpyMnhUdFYyVDBXZ2tTS1pGUXJVcUZ0?=
 =?utf-8?B?VGd6dlF1OTQ1OFgxR3JpYkswWllDV0NuNGI5ejZ2V3pUTlNpWHJvdTFacHZ3?=
 =?utf-8?B?Nml0d1c1Ulljc0Rja2xuYThzYmxzODBwMFl3SCtmMzUzN2l1L3pwNm1EY0Fl?=
 =?utf-8?B?aFRkdG5UaGcvY0JBeGZuOWtvb1B2V2lETzM5d1JtU3JtWkZDK1V4OUN0Z3Zm?=
 =?utf-8?B?MTBWYmlIN0ZURDljdGgrczdIVnVmMVZnaVV4SlUwd01DdmJiYjhTZ0lCMW53?=
 =?utf-8?B?OGZKcmZWQWw4cEtuZ3A1WG1BL2tYUDdYTjBqblJsOHpQY0tsYllSdnc1Q3Nv?=
 =?utf-8?B?RHdZOE5jMDh4NnFWenFYUUVqTlR0RFZQbmNZUG1UK2FaUS8xSGQ2N2J6ZDgw?=
 =?utf-8?B?ZmIvazl2NGp4eEhZQm14Zk9ucTJxc0tDSk1zVkI3TmxqL1UxQmdJbmxpK01D?=
 =?utf-8?B?MnFvN0hGS1ZJTXV4ZlVTa1FiTVNqRHBvcU9HUHdFRWJWMVY0QWU1NHRuOFF1?=
 =?utf-8?B?ck9VYkhMTGtOc2lYWS9uWTJMb2NhaWJiL1hzTmxYcEc2N0pRM3FtSVZMZ3RT?=
 =?utf-8?B?VjJtb1pZaGNZSmV2TjRIVExsWms1cVB5aTUxdEVES1B5K01kNnhGOEFvbGdG?=
 =?utf-8?B?NHJTZjNDNjNLWmtRcWFHR3ZUZzhYcUFtdEdhK2hWcjFSM1BRY08vMXBUem9r?=
 =?utf-8?B?RlltV0FsdGIxaWRKMHFVOU8xaWhTVTc1T0xveTZNNS9GMGVPTGxxTGVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVltVlQ5NWF0dXlERTd0SDE1SmQ4ZlJjVWgrNENEbHZNSXhKdEx6VzZaeGRQ?=
 =?utf-8?B?UllFaXJhVkhJcnlBUWNyU3NwVTdjV2p3SlI2VFdpeUpSU0kyM1hwN2thNzk1?=
 =?utf-8?B?Q1o1YmEzNlNNWGZQSkFiMHRtNFo5ZndZRlRQcFlrSUN3eWNtdDk1bmlJY1o4?=
 =?utf-8?B?SklDOW5ScHlJaWFybVloSC9XclBKb3JBNXdGNkpvd2w2Wm0yZWlWa0NYK1BK?=
 =?utf-8?B?aFdpRE93ckREbWF2L3lUcFJiVGIxTmo2bi9VMGZuVm5pUVhmMEZwWFVNY053?=
 =?utf-8?B?YXJrRk1WRFJTcDQwT1NNMFlZQ2xnTHpMOE5oVTdFZVBockYvajFPNjhxT3Rs?=
 =?utf-8?B?L05ld2dIOEhVTkZUVitEckxhc0krVzdIa1FBZFFaKzAzbXZsM3BSUi8vRE9j?=
 =?utf-8?B?MlcvaUl6T09PaFNwV2lMYmwxZnhmSEhJditVaUwyUHdnNDVtOFlWYzhvcmZJ?=
 =?utf-8?B?dXRGbEVrRUhoTUx0eWw4T0YrYiswa0RHWlJYeEI1WUV2L2xBcnltWDh6MkRs?=
 =?utf-8?B?VEh3aFhGZWJKWDk1NEQ4M0FEc2tTNUpsR3JtWlJlbHgwSy9sRjZpVVJnemxO?=
 =?utf-8?B?bFRRd3YwYitjQ0ZwTWdwTWFmRkk1QnRoNWJPU2VNaHNvVThYMU5zVjJsV1lt?=
 =?utf-8?B?RDdEYXlPRHVqS2ExNzMrUEhaSkpPYVpJMDdMTm4zdkpsVzAyU2V6TUNvZU12?=
 =?utf-8?B?K0hUR3lwYmE1aGd4YnoyVm1PMjNZRzNSTmthaC80S0cya3ovNlh0ZWZSOVVr?=
 =?utf-8?B?b1lienVYSi9pUnAxWEMwN3FHa1ZFNXdBdXVmZm5vc0xDUEZMUUFFSTBrWHZT?=
 =?utf-8?B?UWt2T3RsWGlOU01HRnVSMlhUdmNNM1VmeVJKeUpLRUZJOGx2Z0JpUUhYaVdm?=
 =?utf-8?B?Rm1hMWxBSDdOOFlhUmJaOFlZVEJla2VndkNBV3h5MUIzMXN0TkFaNU83ZXR5?=
 =?utf-8?B?RG9VRHNxSWFjU2x5YjRDZzlaR3plM2xtbzQ2UmozS2JlVkxFV2NpYW8vU294?=
 =?utf-8?B?ZVBVakVXclZtaCtnN2o5dG9vZW9uYldFeDNQVDEvd3R0VFNMV0ZKOXp0QkxL?=
 =?utf-8?B?VXBjS0Y4N1dXWi9CQXpZU2lRM2V1Ym11RGNBbzZIcmQwbmN6SkFJYjMwTklx?=
 =?utf-8?B?V3cwOExwdzd6WTVGRWVjQVZrcjBwdnFSalVicUxhWkFHQzJJSkJ1Nk5VOWNK?=
 =?utf-8?B?ZlY5UDdHckdWKzd3LzhDdnR3elJ0RE1tS1oyYW45bmxES3RHbUxwNU55OGxo?=
 =?utf-8?B?NVF0RzVUbTFudytwc2JGQ21VanlvUzlyRWlHblhJOVZLUm1pb3FaOXgwc1c2?=
 =?utf-8?B?MnFWc29uSnZUdUc1VVpJRVNFcTBRbXQ4MUUvUjQrS1VrdTJ1U2I5NFIxMkVk?=
 =?utf-8?B?aWYzYzlvbHZpYlQ1VTl6bVh3cXd0S01nTW82d3RGZFdIMndpYUc2T0FFQnJu?=
 =?utf-8?B?TE5EbmV0c3Rlc05IMEZhYis4ckhXaWFXMnlkaUNUSHFDeDBBQnV1Vkw2TXUz?=
 =?utf-8?B?UnI5Wk1JSVFDRm5qY3A3cTJ4d0FaaTVIUzQ3V2pyS3BpcmhheHJJQUMrVlo4?=
 =?utf-8?B?S0RrVzlQRUNZbnFYUGhqblhjRFRnYkVzZUhMWUMrMm9SQkRNcG4vbGRPZU9K?=
 =?utf-8?B?VE5kYWphQzdGc0o4dU84RVMyMXlPZHAxTUJSU3BwamwxamZ3RWVOaEFPcE9Z?=
 =?utf-8?B?QUROUHRzMTZhZTUzRld2NzFYek1VTi9FanRDOHVoT0tPcmJEMWM4c0pvR09F?=
 =?utf-8?B?aUFxUElkb2lGU2JTTHM0ajVGVUxPQVBPc256VzBXbU5sbkgrVkp2UHo0OFhI?=
 =?utf-8?B?M2toa1ZOQzJsZjVXOXlWMGdFUC9oY0EwcFZ3Mmp1SWpPYzdONzI2M3JlYUZh?=
 =?utf-8?B?WWgvSnRaKzJPQlVkSURzb0I4bC9qT0plKytaUndMcWxTZk1GYjlCV0oyNjlw?=
 =?utf-8?B?QlFBV01VZXJ6VXYxOTZ5SHcxZGIzM3dEMVFyU1BXRTRrOEFQek9zclhDVWFu?=
 =?utf-8?B?c1hRbUE4cEJxYkxsSDY5TFk5SlhydU15M1VMWHp3LzVIb0dTL21LVFFnUUxw?=
 =?utf-8?B?V2gzbWUwU2dkME1Ocm9HQ3B4VzU0aEprZkxweW5rOUpTU2lqd29jTTFBZnZB?=
 =?utf-8?B?MVkrV3pPcDBIaEdIVmpveGRneXFUa0RjMVh2aExRNWxEY256R0g2R2pLVmRH?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d91e92-25a4-4b35-3abb-08dce7f4bbd9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 23:55:49.0903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nijk5zVZ4Qcv5njHPIeK9E0ukQO3ztj9IAM/OHUxiMBpEo1hZUU7dcy/lya4tKgTrET76YHq+RXBDMppT99rHBBFp/XcXbcRbC1B/hIexVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6338
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

On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
> Userspace is required to mark a queue as using PXP to guarantee that the
> PXP instructions will work. When a PXP queue is created, the driver will
> do the following:
> - Start the default PXP session if it is not already running;
> - set the relevant bits in the context control register;
> - assign an rpm ref to the queue to keep for its lifetime (this is
>    required because PXP HWDRM sessions are killed by the HW suspend flow).
>
> When a PXP invalidation occurs, all the PXP queue will be killed.
"all the PXP queue" -> should be 'queues' or should not say 'all'?

> On submission of a valid PXP queue, the driver will validate all
> encrypted objects mapped to the VM to ensured they were encrypted with
> the current key.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
>   drivers/gpu/drm/xe/xe_exec_queue.c       |  58 ++++-
>   drivers/gpu/drm/xe/xe_exec_queue.h       |   5 +
>   drivers/gpu/drm/xe/xe_exec_queue_types.h |   8 +
>   drivers/gpu/drm/xe/xe_hw_engine.c        |   2 +-
>   drivers/gpu/drm/xe/xe_lrc.c              |  16 +-
>   drivers/gpu/drm/xe/xe_lrc.h              |   4 +-
>   drivers/gpu/drm/xe/xe_pxp.c              | 295 ++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pxp.h              |   7 +
>   drivers/gpu/drm/xe/xe_pxp_submit.c       |   4 +-
>   drivers/gpu/drm/xe/xe_pxp_types.h        |  26 ++
>   include/uapi/drm/xe_drm.h                |  40 ++-
>   12 files changed, 450 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 81b71903675e..3692e887f503 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -130,6 +130,7 @@
>   #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>   
>   #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
> +#define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
>   #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
>   #define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
>   #define	  CTX_CTRL_INDIRECT_RING_STATE_ENABLE	REG_BIT(4)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index e98e8794eddf..504ba4aa2357 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -22,6 +22,8 @@
>   #include "xe_ring_ops_types.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
> +#include "xe_pxp.h"
> +#include "xe_pxp_types.h"
>   
>   enum xe_exec_queue_sched_prop {
>   	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
> @@ -35,6 +37,8 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>   
>   static void __xe_exec_queue_free(struct xe_exec_queue *q)
>   {
> +	if (xe_exec_queue_uses_pxp(q))
> +		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
>   	if (q->vm)
>   		xe_vm_put(q->vm);
>   
> @@ -73,6 +77,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>   	q->ops = gt->exec_queue_ops;
>   	INIT_LIST_HEAD(&q->lr.link);
>   	INIT_LIST_HEAD(&q->multi_gt_link);
> +	INIT_LIST_HEAD(&q->pxp.link);
>   
>   	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>   	q->sched_props.preempt_timeout_us =
> @@ -107,6 +112,21 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   {
>   	struct xe_vm *vm = q->vm;
>   	int i, err;
> +	u32 flags = 0;
> +
> +	/*
> +	 * PXP workloads executing on RCS or CCS must run in isolation (i.e. no
> +	 * other workload can use the EUs at the same time). On MTL this is done
> +	 * by setting the RUNALONE bit in the LRC, while starting on Xe2 there
> +	 * is a dedicated bit for it.
> +	 */
> +	if (xe_exec_queue_uses_pxp(q) &&
> +	    (q->class == XE_ENGINE_CLASS_RENDER || q->class == XE_ENGINE_CLASS_COMPUTE)) {
> +		if (GRAPHICS_VER(gt_to_xe(q->gt)) >= 20)
> +			flags |= XE_LRC_CREATE_PXP;
> +		else
> +			flags |= XE_LRC_CREATE_RUNALONE;
> +	}
>   
>   	if (vm) {
>   		err = xe_vm_lock(vm, true);
> @@ -115,7 +135,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   	}
>   
>   	for (i = 0; i < q->width; ++i) {
> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
> +		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, flags);
>   		if (IS_ERR(q->lrc[i])) {
>   			err = PTR_ERR(q->lrc[i]);
>   			goto err_unlock;
> @@ -160,6 +180,17 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>   	if (err)
>   		goto err_post_alloc;
>   
> +	/*
> +	 * we can only add the queue to the PXP list after the init is complete,
> +	 * because the PXP termination can call exec_queue_kill and that will
> +	 * go bad if the queue is only half-initialized.
> +	 */
Not following how this comment relates to this code block. The comment 
implies there should be a wait of some kind.

> +	if (xe_exec_queue_uses_pxp(q)) {
> +		err = xe_pxp_exec_queue_add(xe->pxp, q);
> +		if (err)
> +			goto err_post_alloc;
> +	}
> +
>   	return q;
>   
>   err_post_alloc:
> @@ -197,6 +228,9 @@ void xe_exec_queue_destroy(struct kref *ref)
>   	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
>   	struct xe_exec_queue *eq, *next;
>   
> +	if (xe_exec_queue_uses_pxp(q))
> +		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
> +
>   	xe_exec_queue_last_fence_put_unlocked(q);
>   	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
>   		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
> @@ -343,6 +377,24 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
>   	return 0;
>   }
>   
> +static int
> +exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value)
> +{
> +	BUILD_BUG_ON(DRM_XE_PXP_TYPE_NONE != 0);
Why a build bug for something that is a simple 'enum { X=0 }'? It's not 
like there is some complex macro calculation that could be broken by 
some seemingly unrelated change.

> +
> +	if (value == DRM_XE_PXP_TYPE_NONE)
> +		return 0;
This doesn't need to shut any existing PXP down? Is it not possible to 
dynamically change the type?

> +
> +	if (!xe_pxp_is_enabled(xe->pxp))
> +		return -ENODEV;
> +
> +	/* we only support HWDRM sessions right now */
> +	if (XE_IOCTL_DBG(xe, value != DRM_XE_PXP_TYPE_HWDRM))
> +		return -EINVAL;
> +
> +	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
> +}
> +
>   typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>   					     struct xe_exec_queue *q,
>   					     u64 value);
> @@ -350,6 +402,7 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>   static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
>   };
>   
>   static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -369,7 +422,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>   			 ARRAY_SIZE(exec_queue_set_property_funcs)) ||
>   	    XE_IOCTL_DBG(xe, ext.pad) ||
>   	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
>   		return -EINVAL;
>   
>   	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index ded77b0f3b90..7fa97719667a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -53,6 +53,11 @@ static inline bool xe_exec_queue_is_parallel(struct xe_exec_queue *q)
>   	return q->width > 1;
>   }
>   
> +static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
> +{
> +	return q->pxp.type;
> +}
> +
>   bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>   
>   bool xe_exec_queue_ring_full(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 1408b02eea53..28b56217f1df 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -130,6 +130,14 @@ struct xe_exec_queue {
>   		spinlock_t lock;
>   	} lr;
>   
> +	/** @pxp: PXP info tracking */
> +	struct {
> +		/** @pxp.type: PXP session type used by this queue */
> +		u8 type;
> +		/** @pxp.link: link into the list of PXP exec queues */
> +		struct list_head link;
> +	} pxp;
> +
>   	/** @ops: submission backend exec queue operations */
>   	const struct xe_exec_queue_ops *ops;
>   
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index e195022ca836..469932e7d7a6 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -557,7 +557,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   		goto err_name;
>   	}
>   
> -	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K);
> +	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K, 0);
>   	if (IS_ERR(hwe->kernel_lrc)) {
>   		err = PTR_ERR(hwe->kernel_lrc);
>   		goto err_hwsp;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 974a9cd8c379..4f3e676db646 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -893,7 +893,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>   #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>   
>   static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> -		       struct xe_vm *vm, u32 ring_size)
> +		       struct xe_vm *vm, u32 ring_size, u32 init_flags)
>   {
>   	struct xe_gt *gt = hwe->gt;
>   	struct xe_tile *tile = gt_to_tile(gt);
> @@ -981,6 +981,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   				     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
>   	}
>   
> +	if (init_flags & XE_LRC_CREATE_RUNALONE)
> +		xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL,
> +				     xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL) |
> +				     _MASKED_BIT_ENABLE(CTX_CTRL_RUN_ALONE));
> +
> +	if (init_flags & XE_LRC_CREATE_PXP)
> +		xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL,
> +				     xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL) |
> +				     _MASKED_BIT_ENABLE(CTX_CTRL_PXP_ENABLE));
> +
>   	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
>   
>   	if (xe->info.has_asid && vm)
> @@ -1029,7 +1039,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>    * upon failure.
>    */
>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size)
> +			     u32 ring_size, u32 flags)
>   {
>   	struct xe_lrc *lrc;
>   	int err;
> @@ -1038,7 +1048,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>   	if (!lrc)
>   		return ERR_PTR(-ENOMEM);
>   
> -	err = xe_lrc_init(lrc, hwe, vm, ring_size);
> +	err = xe_lrc_init(lrc, hwe, vm, ring_size, flags);
>   	if (err) {
>   		kfree(lrc);
>   		return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index d411c3fbcbc6..cc8091bba2a0 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -23,8 +23,10 @@ struct xe_vm;
>   #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
>   #define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
>   
> +#define XE_LRC_CREATE_RUNALONE 0x1
> +#define XE_LRC_CREATE_PXP 0x2
>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size);
> +			     u32 ring_size, u32 flags);
>   void xe_lrc_destroy(struct kref *ref);
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 382eb0cb0018..acdc25c8e8a1 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -6,11 +6,17 @@
>   #include "xe_pxp.h"
>   
>   #include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
>   
>   #include "xe_device_types.h"
> +#include "xe_exec_queue.h"
> +#include "xe_exec_queue_types.h"
>   #include "xe_force_wake.h"
> +#include "xe_guc_submit.h"
> +#include "xe_gsc_proxy.h"
>   #include "xe_gt.h"
>   #include "xe_gt_types.h"
> +#include "xe_huc.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_submit.h"
> @@ -27,18 +33,45 @@
>    * integrated parts.
>    */
>   
> -#define ARB_SESSION 0xF /* TODO: move to UAPI */
> +#define ARB_SESSION DRM_XE_PXP_HWDRM_DEFAULT_SESSION /* shorter define */
Is this really worthwhile?

>   
>   bool xe_pxp_is_supported(const struct xe_device *xe)
>   {
>   	return xe->info.has_pxp && IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
>   }
>   
> -static bool pxp_is_enabled(const struct xe_pxp *pxp)
> +bool xe_pxp_is_enabled(const struct xe_pxp *pxp)
>   {
>   	return pxp;
>   }
>   
> +static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
> +{
> +	bool ready;
> +
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GSC));
Again, why warn on this fw and then proceed anyway when others silently 
return an error code to the layer above?

> +
> +	/* PXP requires both HuC authentication via GSC and GSC proxy initialized */
> +	ready = xe_huc_is_authenticated(&pxp->gt->uc.huc, XE_HUC_AUTH_VIA_GSC) &&
> +		xe_gsc_proxy_init_done(&pxp->gt->uc.gsc);
> +
> +	xe_force_wake_put(gt_to_fw(pxp->gt), XE_FW_GSC);
> +
> +	return ready;
> +}
> +
> +static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
> +{
> +	struct xe_gt *gt = pxp->gt;
> +	u32 sip = 0;
> +
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
Same as above.

> +	sip = xe_mmio_read32(gt, KCR_SIP);
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +
> +	return sip & BIT(id);
> +}
> +
>   static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
>   {
>   	struct xe_gt *gt = pxp->gt;
> @@ -56,12 +89,30 @@ static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
>   	return ret;
>   }
>   
> +static void pxp_invalidate_queues(struct xe_pxp *pxp);
> +
>   static void pxp_terminate(struct xe_pxp *pxp)
>   {
>   	int ret = 0;
>   	struct xe_device *xe = pxp->xe;
>   	struct xe_gt *gt = pxp->gt;
Should add a "lockdep_assert_held(pxp->mutex)" here?

>   
> +	pxp_invalidate_queues(pxp);
> +
> +	/*
> +	 * If we have a termination already in progress, we need to wait for
> +	 * it to complete before queueing another one. We update the state
> +	 * to signal that another termination is required and leave it to the
> +	 * pxp_start() call to take care of it.
> +	 */
> +	if (!completion_done(&pxp->termination)) {
> +		pxp->status = XE_PXP_NEEDS_TERMINATION;
> +		return;
> +	}
> +
> +	reinit_completion(&pxp->termination);
> +	pxp->status = XE_PXP_TERMINATION_IN_PROGRESS;
> +
>   	drm_dbg(&xe->drm, "Terminating PXP\n");
>   
>   	/* terminate the hw session */
> @@ -82,13 +133,32 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   	ret = xe_pxp_submit_session_invalidation(&pxp->gsc_res, ARB_SESSION);
>   
>   out:
> -	if (ret)
> +	if (ret) {
>   		drm_err(&xe->drm, "PXP termination failed: %pe\n", ERR_PTR(ret));
> +		pxp->status = XE_PXP_ERROR;
> +		complete_all(&pxp->termination);
> +	}
>   }
>   
>   static void pxp_terminate_complete(struct xe_pxp *pxp)
>   {
> -	/* TODO mark the session as ready to start */
> +	/*
> +	 * We expect PXP to be in one of 2 states when we get here:
> +	 * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event was
> +	 * requested and it is now completing, so we're ready to start.
> +	 * - XE_PXP_NEEDS_TERMINATION: a second termination was requested while
> +	 * the first one was still being processed; we don't update the state
> +	 * in this case so the pxp_start code will automatically issue that
> +	 * second termination.
> +	 */
> +	if (pxp->status == XE_PXP_TERMINATION_IN_PROGRESS)
> +		pxp->status = XE_PXP_READY_TO_START;
> +	else if (pxp->status != XE_PXP_NEEDS_TERMINATION)
> +		drm_err(&pxp->xe->drm,
> +			"PXP termination complete while status was %u\n",
> +			pxp->status);
> +
> +	complete_all(&pxp->termination);
>   }
>   
>   static void pxp_irq_work(struct work_struct *work)
> @@ -112,6 +182,8 @@ static void pxp_irq_work(struct work_struct *work)
>   	if ((events & PXP_TERMINATION_REQUEST) && !xe_pm_runtime_get_if_active(xe))
>   		return;
>   
> +	mutex_lock(&pxp->mutex);
> +
>   	if (events & PXP_TERMINATION_REQUEST) {
>   		events &= ~PXP_TERMINATION_COMPLETE;
>   		pxp_terminate(pxp);
> @@ -120,6 +192,8 @@ static void pxp_irq_work(struct work_struct *work)
>   	if (events & PXP_TERMINATION_COMPLETE)
>   		pxp_terminate_complete(pxp);
>   
> +	mutex_unlock(&pxp->mutex);
> +
>   	if (events & PXP_TERMINATION_REQUEST)
>   		xe_pm_runtime_put(xe);
>   }
> @@ -133,7 +207,7 @@ void xe_pxp_irq_handler(struct xe_device *xe, u16 iir)
>   {
>   	struct xe_pxp *pxp = xe->pxp;
>   
> -	if (!pxp_is_enabled(pxp)) {
> +	if (!xe_pxp_is_enabled(pxp)) {
>   		drm_err(&xe->drm, "PXP irq 0x%x received with PXP disabled!\n", iir);
>   		return;
>   	}
> @@ -230,10 +304,22 @@ int xe_pxp_init(struct xe_device *xe)
>   	if (!pxp)
>   		return -ENOMEM;
>   
> +	INIT_LIST_HEAD(&pxp->queues.list);
> +	spin_lock_init(&pxp->queues.lock);
>   	INIT_WORK(&pxp->irq.work, pxp_irq_work);
>   	pxp->xe = xe;
>   	pxp->gt = gt;
>   
> +	/*
> +	 * we'll use the completion to check if there is a termination pending,
> +	 * so we start it as completed and we reinit it when a termination
> +	 * is triggered.
> +	 */
> +	init_completion(&pxp->termination);
> +	complete_all(&pxp->termination);
> +
> +	mutex_init(&pxp->mutex);
> +
>   	pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
>   	if (!pxp->irq.wq)
>   		return -ENOMEM;
> @@ -256,3 +342,202 @@ int xe_pxp_init(struct xe_device *xe)
>   	destroy_workqueue(pxp->irq.wq);
>   	return err;
>   }
> +
> +static int __pxp_start_arb_session(struct xe_pxp *pxp)
> +{
> +	int ret;
> +
> +	if (pxp_session_is_in_play(pxp, ARB_SESSION))
> +		return -EEXIST;
> +
> +	ret = xe_pxp_submit_session_init(&pxp->gsc_res, ARB_SESSION);
> +	if (ret) {
> +		drm_err(&pxp->xe->drm, "Failed to init PXP arb session\n");
> +		goto out;
> +	}
> +
> +	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, true);
> +	if (ret) {
> +		drm_err(&pxp->xe->drm, "PXP ARB session failed to go in play\n");
> +		goto out;
> +	}
> +
> +	drm_dbg(&pxp->xe->drm, "PXP ARB session is active\n");
> +
> +out:
> +	if (!ret)
> +		pxp->status = XE_PXP_ACTIVE;
> +	else
> +		pxp->status = XE_PXP_ERROR;
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_pxp_exec_queue_set_type - Mark a queue as using PXP
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to mark as using PXP
> + * @type: the type of PXP session this queue will use
> + *
> + * Returns 0 if the selected PXP type is supported, -ENODEV otherwise.
> + */
> +int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type)
> +{
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	/* we only support HWDRM sessions right now */
> +	xe_assert(pxp->xe, type == DRM_XE_PXP_TYPE_HWDRM);
> +
> +	q->pxp.type = type;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_pxp_exec_queue_add - add a queue to the PXP list
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to add to the list
> + *
> + * If PXP is enabled and the prerequisites are done, start the PXP ARB
> + * session (if not already running) and add the queue to the PXP list. Note
> + * that the queue must have previously been marked as using PXP with
> + * xe_pxp_exec_queue_set_type.
> + *
> + * Returns 0 if the PXP ARB session is running and the queue is in the list,
> + * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
> + * other errno value if something goes wrong during the session start.
> + */
> +#define PXP_TERMINATION_TIMEOUT_MS 500
> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	int ret = 0;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	/* we only support HWDRM sessions right now */
> +	xe_assert(pxp->xe, q->pxp.type == DRM_XE_PXP_TYPE_HWDRM);
> +
> +	/*
> +	 * Runtime suspend kills PXP, so we need to turn it off while we have
> +	 * active queues that use PXP
> +	 */
> +	xe_pm_runtime_get(pxp->xe);
> +
> +	if (!pxp_prerequisites_done(pxp)) {
> +		ret = -EBUSY;
Wouldn't EAGAIN be more appropriate? The pre-reqs here are the GSC 
firmware load which is guaranteed to in progress or done (or dead?), in 
which case it is just a matter or re-trying until the firmware init 
completes?

> +		goto out;
> +	}
> +
> +wait_for_termination:
> +	/*
> +	 * if there is a termination in progress, wait for it.
> +	 * We need to wait outside the lock because the completion is done from
> +	 * within the lock
> +	 */
> +	if (!wait_for_completion_timeout(&pxp->termination,
> +					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
> +		return -ETIMEDOUT;
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	/*
> +	 * check if a new termination was issued between the above check and
> +	 * grabbing the mutex
> +	 */
> +	if (!completion_done(&pxp->termination)) {
> +		mutex_unlock(&pxp->mutex);
> +		goto wait_for_termination;
> +	}
> +
> +	/* If PXP is not already active, turn it on */
> +	switch (pxp->status) {
> +	case XE_PXP_ERROR:
> +		ret = -EIO;
> +		break;
> +	case XE_PXP_ACTIVE:
> +		break;
> +	case XE_PXP_READY_TO_START:
> +		ret = __pxp_start_arb_session(pxp);
> +		break;
> +	case XE_PXP_NEEDS_TERMINATION:
> +		pxp_terminate(pxp);
> +		mutex_unlock(&pxp->mutex);
> +		goto wait_for_termination;
> +	default:
> +		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u", pxp->status);
> +		ret = -EIO;
> +		break;
> +	}
> +
> +	/* If everything went ok, add the queue to the list */
> +	if (!ret) {
> +		spin_lock_irq(&pxp->queues.lock);
> +		list_add_tail(&q->pxp.link, &pxp->queues.list);
> +		spin_unlock_irq(&pxp->queues.lock);
> +	}
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +out:
> +	/*
> +	 * in the successful case the PM ref is released from
> +	 * xe_pxp_exec_queue_remove
> +	 */
> +	if (ret)
> +		xe_pm_runtime_put(pxp->xe);
Does the runtime PM get/put need to be mutex protected as well? Is it 
possible for two xe_pxp_exec_queue_add() calls to be running concurrently?

> +
> +	return ret;
> +}
> +
> +/**
> + * xe_pxp_exec_queue_remove - remove a queue from the PXP list
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to remove from the list
> + *
> + * If PXP is enabled and the exec_queue is in the list, the queue will be
> + * removed from the list and its PM reference will be released. It is safe to
> + * call this function multiple times for the same queue.
> + */
> +void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	bool need_pm_put = false;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return;
> +
> +	spin_lock_irq(&pxp->queues.lock);
> +
> +	if (!list_empty(&q->pxp.link)) {
> +		list_del_init(&q->pxp.link);
> +		need_pm_put = true;
> +	}
> +
> +	q->pxp.type = DRM_XE_PXP_TYPE_NONE;
> +
> +	spin_unlock_irq(&pxp->queues.lock);
> +
> +	if (need_pm_put)
> +		xe_pm_runtime_put(pxp->xe);
> +}
> +
> +static void pxp_invalidate_queues(struct xe_pxp *pxp)
> +{
> +	struct xe_exec_queue *tmp, *q;
> +
> +	spin_lock_irq(&pxp->queues.lock);
> +
> +	list_for_each_entry(tmp, &pxp->queues.list,  pxp.link) {
Double space.

> +		q = xe_exec_queue_get_unless_zero(tmp);
> +
> +		if (!q)
> +			continue;
> +
> +		xe_exec_queue_kill(q);
> +		xe_exec_queue_put(q);
> +	}
This doesn't need to empty the list out as well?

> +
> +	spin_unlock_irq(&pxp->queues.lock);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 81bafe2714ff..2e0ab186072a 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -9,10 +9,17 @@
>   #include <linux/types.h>
>   
>   struct xe_device;
> +struct xe_exec_queue;
> +struct xe_pxp;
>   
>   bool xe_pxp_is_supported(const struct xe_device *xe);
> +bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
>   
>   int xe_pxp_init(struct xe_device *xe);
>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>   
> +int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
> +void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
> +
>   #endif /* __XE_PXP_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index c9258c861556..becffa6dfd4c 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -26,8 +26,6 @@
>   #include "instructions/xe_mi_commands.h"
>   #include "regs/xe_gt_regs.h"
>   
> -#define ARB_SESSION 0xF /* TODO: move to UAPI */
> -
>   /*
>    * The VCS is used for kernel-owned GGTT submissions to issue key termination.
>    * Terminations are serialized, so we only need a single queue and a single
> @@ -495,7 +493,7 @@ int xe_pxp_submit_session_init(struct xe_pxp_gsc_client_resources *gsc_res, u32
>   				   FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
>   	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
>   
> -	if (id == ARB_SESSION)
> +	if (id == DRM_XE_PXP_HWDRM_DEFAULT_SESSION)
Would have been clearer to just use the correct name from the start.

>   		msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
>   
>   	ret = gsccs_send_message(gsc_res, &msg_in, sizeof(msg_in),
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index d5cf8faed7be..eb6a0183320a 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -6,7 +6,10 @@
>   #ifndef __XE_PXP_TYPES_H__
>   #define __XE_PXP_TYPES_H__
>   
> +#include <linux/completion.h>
>   #include <linux/iosys-map.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
>   #include <linux/types.h>
>   #include <linux/workqueue.h>
>   
> @@ -16,6 +19,14 @@ struct xe_device;
>   struct xe_gt;
>   struct xe_vm;
>   
> +enum xe_pxp_status {
> +	XE_PXP_ERROR = -1,
> +	XE_PXP_NEEDS_TERMINATION = 0, /* starting status */
> +	XE_PXP_TERMINATION_IN_PROGRESS,
> +	XE_PXP_READY_TO_START,
> +	XE_PXP_ACTIVE
> +};
> +
>   /**
>    * struct xe_pxp_gsc_client_resources - resources for GSC submission by a PXP
>    * client. The GSC FW supports multiple GSC client active at the same time.
> @@ -82,6 +93,21 @@ struct xe_pxp {
>   #define PXP_TERMINATION_REQUEST  BIT(0)
>   #define PXP_TERMINATION_COMPLETE BIT(1)
>   	} irq;
> +
> +	/** @mutex: protects the pxp status and the queue list */
> +	struct mutex mutex;
> +	/** @status: the current pxp status */
> +	enum xe_pxp_status status;
> +	/** @termination: completion struct that tracks terminations */
> +	struct completion termination;
> +
> +	/** @queues: management of exec_queues that use PXP */
> +	struct {
> +		/** @queues.lock: spinlock protecting the queue management */
> +		spinlock_t lock;
> +		/** @queues.list: list of exec_queues that use PXP */
> +		struct list_head list;
> +	} queues;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b6fbe4988f2e..5f4d08123672 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1085,6 +1085,24 @@ struct drm_xe_vm_bind {
>   /**
>    * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>    *
> + * This ioctl supports setting the following properties via the
> + * %DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY extension, which uses the
> + * generic @drm_xe_ext_set_property struct:
> + *
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY - set the queue priority.
> + *    CAP_SYS_NICE is required to set a value above normal.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE - set the queue timeslice
> + *    duration.
Units would be helpful.

> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
> + *    this queue will be used with. Valid values are listed in enum
> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
> + *    there is no need to explicitly set that. When a queue of type
> + *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
> + *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
> + *    Given that going into a power-saving state kills PXP HWDRM sessions,
> + *    runtime PM will be blocked while queues of this type are alive.
> + *    All PXP queues will be killed if a PXP invalidation event occurs.
Seems odd to say 'values are listed in ...' and then go on to describe 
each type and provide extra information about them. Seems like the extra 
details should be part of the enum documentation instead of here?

John.

> + *
>    * The example below shows how to use @drm_xe_exec_queue_create to create
>    * a simple exec_queue (no parallel submission) of class
>    * &DRM_XE_ENGINE_CLASS_RENDER.
> @@ -1108,7 +1126,7 @@ struct drm_xe_exec_queue_create {
>   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> -
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>   	/** @extensions: Pointer to the first extension struct, if any */
>   	__u64 extensions;
>   
> @@ -1694,6 +1712,26 @@ struct drm_xe_oa_stream_info {
>   	__u64 reserved[3];
>   };
>   
> +/**
> + * enum drm_xe_pxp_session_type - Supported PXP session types.
> + *
> + * We currently only support HWDRM sessions, which are used for protected
> + * content that ends up being displayed, but the HW supports multiple types, so
> + * we might extend support in the future.
> + */
> +enum drm_xe_pxp_session_type {
> +	/** @DRM_XE_PXP_TYPE_NONE: PXP not used */
> +	DRM_XE_PXP_TYPE_NONE = 0,
> +	/**
> +	 * @DRM_XE_PXP_TYPE_HWDRM: HWDRM sessions are used for content that ends
> +	 * up on the display.
> +	 */
> +	DRM_XE_PXP_TYPE_HWDRM = 1,
> +};
> +
> +/* ID of the protected content session managed by Xe when PXP is active */
> +#define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
> +
>   #if defined(__cplusplus)
>   }
>   #endif

