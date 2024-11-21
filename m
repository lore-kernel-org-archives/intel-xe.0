Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634FCE65D00
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 23:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2895B10EA7E;
	Thu, 21 Nov 2024 23:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAjLPe++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F5F10EA7E
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 23:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732230712; x=1763766712;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TCA+iuU4/JaW5MxSPrkjpa9b6r3CqPaSo2XURgxSDsQ=;
 b=IAjLPe++GABh3ZjjGKBzpMENIVyTK1FBGjx4cGfWd5ytKyIj4TbGOtwh
 axREhrnJZyT/dVFmHfovqzuAZvckfdk71QnM1pepWttoz0WcNUqE0jWgF
 2/p61IioNTr/Su8OBpa3pgOq/plpZ8zP5ElBBZq4Pnw5AufFxYqyqFvgy
 /WIQjHQ/h49cNMFeDinscfu0TUEMYL2oINyfv/c5M7Dgpvp6PK720Izjq
 oi46M9RtrknHpKOHfI5hrW5KpsugYZCK8PGYg69jMLLGvxp51v4QGWFJ9
 PQg2Pc/ILaSgT5pFbt34X+6b+xLeQooSr1y+WdM8e3n1tKEVZK9/Q1pE6 Q==;
X-CSE-ConnectionGUID: 7kwwbCAiSUmisAMaikYrZQ==
X-CSE-MsgGUID: capWNowXQn2MCn+NFnIndA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32430495"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="32430495"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 15:11:52 -0800
X-CSE-ConnectionGUID: tfSn+G4bR4y//fkoO1Qx1g==
X-CSE-MsgGUID: smtb6wGSSAS/3OvcwPRBxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="95200689"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 15:11:52 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 15:11:52 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 15:11:52 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 15:11:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ohzt6J372PvBx/Y8ttXvSLRp1XPnanAG+7QJHSb4n6bv0faRVctsx3PkaMVZG4FgTdplOxYVYiMjylPJd54DtvKBP1O9i7QbhsMbYh+NvkKLgYx7jj7ynlgRM6Sgades4n5MgEPNkeddVuScUKHvNMtov84nLLAjxrG9K+WAbm3bjIrcKE374xGcvVCcX5X6Y7LfR0s1d/7Y+Xp3hpeowgeVV751jzo2CPwt6Gi+L/W9hFXgumMxyfe7M9JL/mW06AyNs8b7iQoWxciWDyF4CgBZWtb8Sr6pYvx76SRqKfxvwmx8D/0GDXMZq2gLWrIbrYElWEwJf9jI1EW8MmJ6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ge3kLMsggDKxZWhMxSDW3PIv0CA9nnsDZUA8aMCKCno=;
 b=MkvVVhyM+vS135LLjjCzy3DunLb1VlWzQUoSpb5Qg+pbuHO/BjrQV3ikGZvF4e12wRmG4sTfhM6qlQivfnpJrgOOAFvFJagGYI/lpJBO8XzmG0nwAjc8XRC3mvgrCu/gDDtCehFC01Pbf7NNATA9Izd7M33cw+X5UrLw4ELoajntV/I4P+8CCTm4XCrHR02G18D5cFRGm9IH5rYwPytbcnvzqLcUIPdwRzSpwntctCxYKQjyVBbb6leIY9PpX7gvEeb4FULuJlUTyq4asC4/GZ8ml05JTYFe6NpIotQn0EKOduMZ/9FuoB8LGVeqe1l81TegNYMiFsMxU0wYncUWEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 23:11:43 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 23:11:43 +0000
Message-ID: <5133b46a-f9e8-4d64-97a3-5016b5037f79@intel.com>
Date: Thu, 21 Nov 2024 15:11:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 topic/xe-for-ci] drm/xe/ptl: Update PTL GuC revision
To: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241121225518.10986-1-matthew.s.atwood@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241121225518.10986-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::8) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 571e845e-8f51-40a2-6676-08dd0a81dd35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWRlZG9SUllQYjkrZFROWUhSWXovQlR6b2hvM1JscXBreEZGUzNDajhrL1p0?=
 =?utf-8?B?cU0zRm1GRFNMSHI1VThod1FSRnNoMEV2YXZCVDZUdnU4cDlZOWlSMEluYlVF?=
 =?utf-8?B?RDM3eStrYVFYam1sZEZMYlpPYnk0djR3a2JkTXdobzhxcHR2ZWlRc2w4WWhZ?=
 =?utf-8?B?UXhFK3FIOGdCOHlDSlQxWlBoSWQvdFdLZ1A3NDMrTTR2cmVjL2pkNk00NVdS?=
 =?utf-8?B?Y2U5UkhpRnozbzNKUjdIQ2VmZkhLaDZ1VC9CN1R3SHZwaTVaK2pHMU5JUEFO?=
 =?utf-8?B?QWZ6cUR4U1RlU1lIRzVOU3Qwbk51MGQ4dUIxcEN0K1RUdmN0R0hjVVptR2Z0?=
 =?utf-8?B?WjNlYnpNcWNDUW1tN2tpT3E0cHo0bUxqb3gwcEl2YnlOalhNcXo5RnlmV0N6?=
 =?utf-8?B?MTJaelU0eHFFMEk2YnRkcnJYVjZMSER0NkhySTFCUWNvV0hrNTJ6bjJhNkpE?=
 =?utf-8?B?RjVCWjBiNTFpTWFqbUluY0Y5ejZzcHUzd3RmRzl1NEh5MTR2aTErS2dMTFRZ?=
 =?utf-8?B?clkxUDhaUnUvQW8vdmpZZVM1NDZIVytDNlg5TWk2Z0wyMWNINFVJb0loTFFM?=
 =?utf-8?B?VHBoNlFWSUxBclh0M1RvTEhEc0M0aGhTb29uVktyZlBFY2pReGRFdHpEUjZR?=
 =?utf-8?B?ajBjck5idndsUUsybXh3dXhmcHBkWWtRSG9IWVFBc2dqaUd1SGFhVDAxclli?=
 =?utf-8?B?MTVMN3RZMnYzeVlCdVVPNjFtVUxaSjdYMDFaNjgxdEtqVGEvWjlTQnVGeVpF?=
 =?utf-8?B?ZWg5cFVxME81dXlYM3FQMHhuMUl6Zy9INGtSUE9zZ1ZXQ1BKNGg5dTErYVh3?=
 =?utf-8?B?SGF0ZmpLZC9PdGwwU0tOWisrUFhQOGtEckJTRnRwQ3ZGQmhJK3Mvd0dyOE5q?=
 =?utf-8?B?V2VCRFZHU1ZteVFFeXpRRHhrYkNidEZ2MXdyUHh1MENNN0hlRjByZ3VSOENG?=
 =?utf-8?B?N2U1REhOZjJ3a2daajRMK3QvMSs1Mlc2NEdOMjZpS0RJM0h3WDNkc09wZmhU?=
 =?utf-8?B?VzdnSlRzWmkzUjlDam9CTzF1bEUySmpyc3kzdFdYNFc1ZjRDUGFjVWc0dXpQ?=
 =?utf-8?B?TmF6TkJpT3lMaU9hT1VQc3pvcjdlS2YrYlNGSU81a3EvYWt6UjZnWnVnM0Fr?=
 =?utf-8?B?ODJPNDVsZUxqRm5iUlg3ODZpa2dPVVF3NGlHcDZPZmNneTkxMEJlU3YzUTU3?=
 =?utf-8?B?MEtmdVFNU2ZRQ0J5clRDTW9scU02UEVNUzFMeG1XNitpM3M4RTNuQjJzSkdC?=
 =?utf-8?B?SnJ2OEQyZlA3S2FUZ0M2TDdUcmQxUk9ESGJiR0RRazFzdVh6S0ZWRnNZWVRu?=
 =?utf-8?B?K0RFNFA1MVlmUElSZHN4VjhITWFoNFBoZFZreWJabGtIRWtHWlpZL085UGh6?=
 =?utf-8?B?TGkyb0M1N0M3V2w5VGNLSVZHOEhqMUM0b3NWOVMyb2dDMXloRzBSWGF0OWZL?=
 =?utf-8?B?ZVcxR0xUWng1NHlCbEhOQVBSdFgrWGhHbXc5SE5lTFh4ZEFIaHd0ZW9Ub1lt?=
 =?utf-8?B?SkFoNE8rcVE5UE44S1JmYzM3U1hzbDh0THBFeTNSd0ZXS2lhT0IrT2E1STBo?=
 =?utf-8?B?azlLRCtFY29qUTZNOTJBYWVMZWoxb01oZWVEYkUyWXlyRXc3a2hxSTRCWlJM?=
 =?utf-8?B?SExDYjBIVDMxT2c2eTBCS0p4dHpyL0o4dDdCbU5CbDRrMENGaytMSjdQZFJ4?=
 =?utf-8?B?dTI1QWhFM2NmZnlnVzlKWks2Vkx4TjlWeGgzSzVrL1QxQWNIRnZ1VjhSYk5Q?=
 =?utf-8?Q?2rIUCaGzuoQ9rZIXuILqkktRjz1FUxBwq28BalR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2drbGFDSVh0RjVCM044OVVMSHQ4QmI5MVcrK2RUTFBkdDhRNzdJQWhjczN3?=
 =?utf-8?B?dnlRV0RSZVM3YTBjN0c3cVMyNGtWSm5BSHBMMjhvNTNHYTFqMTFBRTR0THYz?=
 =?utf-8?B?b21pdVF0VVU5d3ZYQXFwMVJLai9EbGNwNHNpMkJvOWFYZTc3Z2d4Q0ErM2Rq?=
 =?utf-8?B?OFZDdytlY2lmTVQ2cXlnZ05Ldm9CbXdCKzM0Vk10L3VMdWJRcVVqODk5V3pr?=
 =?utf-8?B?bEhhdVNGeWxUVUEyZGhzenhQMzl2Wk52ME1vb3VNaGcrdFU3Rmx4V2U3MGRL?=
 =?utf-8?B?TUxMSjZNRmZTbWdQdjJnOUE2MUNxK2hvdUFObS9FZm1ad0NNMVZvTUdmbzJo?=
 =?utf-8?B?Q0JEZ2VsbjFOZCs1SUtBTlB4Yy9JbmdhZzJWTmFoYURlbHlCcHJUUFRVMHlL?=
 =?utf-8?B?TkU1ZHl0cjhBU1Z2Uk9RRjRMQ2MxNUNxS2JhSUZkbThjL01BWEx0cG05aGVv?=
 =?utf-8?B?RGptQ25wakFRWHpIRnAxaUsvTlY3NTQ2WGpFYU8wL21kRVpSZVpZdDZWajJD?=
 =?utf-8?B?dWRGV0lJQlZpYldqSjNPTU12NjgzT2gxOFZYUENHb1VSbEUxMlRiNnozSXBM?=
 =?utf-8?B?UVBOaUpuSlhQdGlxNmpUUVZEZHB6UWE2USsyblBua0xnbFVuNmhORmJadEQ1?=
 =?utf-8?B?WGpWMEdiamhuMExjL1ErMzB6aXIxa1NtSDJ6RzBHVnhuVjNLOXE5SGg3OFYz?=
 =?utf-8?B?aU1na1dUSGNLVWpEbVQycmVJc3VwYVlyWmY2UUwwU1Ywa3VTbUtyeHNwQUJs?=
 =?utf-8?B?K3dncjBvTm9xa3RNemtJbVF1cjZ5bzMrcjZlUEw5Ni9kMURSdk5HK3B3QjA0?=
 =?utf-8?B?anNnWU1rWXVMdFVrcGJCb2xZYXpzdHJORlI4VkVsdHZBaDhkZHd6SWRJa3lv?=
 =?utf-8?B?NEc5ZVcySVI2TmNyb0ZVdngxU0R4Sm8zWnV5VmtrUnRBVmp4ejNnbzd2ZEZj?=
 =?utf-8?B?Q3NFcDhiWFhCT29WZHYvRU5QSnRYU29EL1BSQVR6NnFRNFFkdGx6SVgzZGtw?=
 =?utf-8?B?L01xeEh3NFB5U0NibmtSNXhuL2Y4Y3h1MXlnWGhYaDlnSVdZVkNTb0tPUzB1?=
 =?utf-8?B?T1owNkt4R29YZUVXdjJpditnVEUySmNEK21QY0ljSmprWGlZV1FuWHVad3JP?=
 =?utf-8?B?MDZYY3ZPbG9pS1Y3ZjVjSjRuWFVRdjQvSmZ5RGJmU3ZOTmRYNEk1RU5LdmJS?=
 =?utf-8?B?VExuSVcyZkR3L0xzYWlNWnR6L0FFQ1FOVVo5TWJQLzdYOXRJYi8xWEJrRDNx?=
 =?utf-8?B?U29zOG5MVndFV3U3Smh6NDVxSzZlakwvKzVBZkI4VkpyTmVQTEliZFpZNDMr?=
 =?utf-8?B?czZaMFJmVFJ2QTlCYU5JYVZneWR0akw2RjNqZE5tSXg3cEF4OEZlaUt1d0Fr?=
 =?utf-8?B?dWV4aGQyZk1pUzY3cW5xUWdteWpvZUZYTTNpcWpsN2xtMGVtSHpJTDlpNmNK?=
 =?utf-8?B?MFpUako3MVRmZytoSHhsZ1hJQU42aitUNzEwRFhlekcvQXR3emxsYzlWUVhY?=
 =?utf-8?B?NnBMMEt4dTRGS2VoeFhaTndIVmw2WVA5WUhQZEtoN2g0Ym9LM1FpMXZ4MzJ0?=
 =?utf-8?B?NHVrMHR1Nzdwd0VpU2tuZTFuMTRvVXZIdE5qb21VMjZRRGFKb2ZvVUo0Qjlo?=
 =?utf-8?B?dUMwY3IzdHpLKzdVWUFHb3VGYzUvTmV2Z2grMzZaYlJEVi9GcUg5aFIzNmNj?=
 =?utf-8?B?NXhoRysvTm5odUxMTG13ZUNhZkRlVXB3Y2kxaUtZMUNKaDYrbzl3bktVNWdn?=
 =?utf-8?B?K2prZFF3c0VNY2RVSEFCUllpMnJMcXNscnBZMXlqbUZiREs0SC9vVEN3eExj?=
 =?utf-8?B?eTI0emhpMmt5YWJ6M05SMi92NjI1S0tXQ1p0N0FrOHFjcDJUNlBXVkFMd0sv?=
 =?utf-8?B?cWw3a3NKK3AremRMN2E0WlJqRWFKYXJvMUVqVk1OZmpCU0kyQS9YNDgzN3NH?=
 =?utf-8?B?ekZvY2hKSi9pdmEvMkJKVklOQUh0aC9mUUxMcjVYcWlEdjY3Q3lNVnhybGNH?=
 =?utf-8?B?cDZzYmtkOW44TnVmQURmbFBqRTYvbFdGcjF3bEs2NTB5T3dLa09lLzlSQlA2?=
 =?utf-8?B?M0VFMktyUDdCaE94QzBPOGV0b1ZvMExwamlkcFUrMmR3T0hSK2pqMnlUcDdG?=
 =?utf-8?B?ZWNsUmZOenJOUVFCUTA0WUFkbDBKRnZLL0NZUXhRUndxd0VhMmkrd2pYT2lm?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 571e845e-8f51-40a2-6676-08dd0a81dd35
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 23:11:43.6973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZVVE0uaF7KnE5wVJkiwXqGujtGR6fkqsio6NlgHBRGhyF9H+LOPRCTgsof4JAnhjQdVuGIYBVLEFh1kW5k0UwgxxTRg+HP/Jrqi/AzKH7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
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

On 11/21/2024 14:55, Matt Atwood wrote:
> Update PTL guc version to 70.36.0.
>
> v2: Fix typo in commit message
>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index b0deb082ab2b..9c14b0adad0c 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -107,7 +107,7 @@ struct fw_blobs_by_type {
>   };
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 33, 2))	\
> +	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 36, 0))	\
>   	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
>   	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>   	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\

