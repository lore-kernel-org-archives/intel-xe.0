Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D00DC9831E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 22:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401A210E0DB;
	Thu, 24 Sep 2026 22:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIrA7gqo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A80010E55B
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 22:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790288858; x=1821824858;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lAhO2u70FLnDub4FwXXriujqtl2+nL4QwYu/EyTOIHU=;
 b=BIrA7gqo8n2WhnsuEzcfpqTFgith2YB1BWvbh5DsW52RBsjoMX2pmMnG
 bid6yn2tuzUkTIEC2g0VIUjwYk1PaJ1LEosCa5XlHJ1X1BJ+h4NRq245C
 /Am9jAH6ANeRqvi226pv1W9zObxK8E7YFiVMZdJ0SYXwgtVsI+5Iv3iY0
 A65USk1Vo58r0ri6UWY1jimUaAe98vEdIA/PimzpHQKW9Ur5rtXqxWbJ1
 baKIhugoCE1W7/tcAr4oW16PKzxtnGqUILIaaoWkERL5hg6kcqZfal8RP
 UKEGOr9zghpavE1Y6nKKeLnndCIVV87oabdnVvqXcr5CqrxzqGPAOGqUU g==;
X-CSE-ConnectionGUID: rIa+LT5WR3mQUQ3ut/OGhA==
X-CSE-MsgGUID: wUGC51WfToGLdklKbSuXcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89983801"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="89983801"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 15:27:36 -0700
X-CSE-ConnectionGUID: LcXXsgiRR2Grqx713cghpw==
X-CSE-MsgGUID: sP5R23egTqGgQhakmtiSKg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 15:27:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 15:27:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 15:27:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 15:27:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q74UvWCE/BpTtb+U4ev9JUpLItivSBylJGNgc2PrXSRT8o0gC0+A4HGPoQ37xKh8t1da3Qn/Sicf8+Of95QR3NHtFTy2wN+cwJPO4ezM+oG+S1WTqJAopc5PtWFYvZRMInwdqvEZ39Z3EdHb+Gg7ZlR9nOPuja6oFX03GmRig6uuyOuVoOZH4hd5PPP4eHuR2AZOg4bWt9AwMufN8y3qRVRPVJv0XhO+wXtMKvWHtVdKSKyZj5NE9vLCVPa5ukxLWvNfV2a5A4yWaxZ/OPjklQDxWC8Iouv6D24KPcBmRAQiqaeB8rRFNOeTJwUs2F3vO/ItJ44BHlwWb54Lc3Lmig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BD8obFFf9RWUU4n/pYP/K8jL+hfLMYTXfQpO8goFIsY=;
 b=S7GnB0vRhBmrD3nBNlXwiR0ggZYpFwJwcXWNf32zjMhqm0sl3WC4rQg3VlC2wZF2jxUJ7fK/ZlnRRoV07PeJczmcTMAIB2D6HrXnaCydNhBruonEAs+mnJ6Rcnb0CXoXlA7+A1gmDHEbYvxWvI0nUkpFmsS2B8JqTMwgpPcgBbjulQA8hw7Dnxg6TP6PATFsTjp6JOpr4aVhuaJyMjnnbeSfrgNEMnHbNGMjOuqisCrqpp3mBar9xQzL0gv6rkUHeu13bLHt6eQphDHumdl1GFUU374sbsJ5UJUMBxQcEWU43moXUvWiNMgYh51RjBFifGxZv9PFA9LqE/lRZxQ4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SA1PR11MB5875.namprd11.prod.outlook.com (2603:10b6:806:238::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 22:27:01 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%3]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 22:27:01 +0000
Message-ID: <bba15354-2204-4a26-a848-e5bdf2cad523@intel.com>
Date: Thu, 24 Sep 2026 15:26:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/madvise: Remove unreachable madvise_funcs NULL
 check
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260915011229.203424-1-shuicheng.lin@intel.com>
 <dcb7229c-74ac-428c-a8f9-10dcd8efe3fb@intel.com>
 <DM4PR11MB54561853ADFA943F9045CCCFEA812@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <DM4PR11MB54561853ADFA943F9045CCCFEA812@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SA1PR11MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b230c8-d249-4436-83c8-08df1a8af3bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|366016|376014|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|5023799004|20052099010|22082099003;
X-Microsoft-Antispam-Message-Info: ejbOvDJjIGbpuZjEXLdDX3W7LliGqt2oP7XhX1Xee/P3hkkBt0S1/Nu/5jh9nQT48PSQGZfZbAg+p7amnW1kTOZfFrhHpdvOaHavbf0vcGoMfJK/XThhEe1laRPRTWBWEhJ+r+WkRyqOu12O4MTVdjDhTLfK+JbMp6j53A8VRbFoDYRK3zMK+i9xSdzxVn4+e1H+UqXGYlL+xFnasDUX0ev/0RPVQ0+JGYhWhJbrvHyQATgWwI0l6BEzaasA2HQdkvz28MSDkza9OoS2LHayazqkjJvxaDzLIrQ66gSMMGAzIhw1d8zR6XhqIDvPix23TqcPeVnXznbPWxTi6RLS4nziPCUPpaMwn4BR/ftApxBwOxtwjx7Ydm00sqLWJidPEgyKoL1bRaPWeVDgPrCDOIHfQJlOjXxIhAluNmTM7/lIfiLgypxMb4SsBvXRDNEoH2PnSoEt/WU2S2ylYGtquj2DQkkvNM8kw++k/VDbychuXfTgzZijfHYzegqNJc/USgCJWDz5P9K9udN+j46RE7aM/QEXa/FP5jYiYdr1/j3bR73iziTWLM7czLqulfM8gfOkY6q0yOnhLmxiiqGyIYy9y1A/0oE1aQwmzCrSW7o+XIXq6VIQ1NSsZvdVmJfzjZ1LhHQjy6c5La7HDKByZu0C6gOT3nUblXUs1IWF4aE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(5023799004)(20052099010)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVJIckV5NlhGOE1LZXcranFJRU5jWDVrTTlaVEZsbmFXVG5VSlE3VGc4S2dT?=
 =?utf-8?B?OVFoK0JzMUVzNmp0bmFCYjBBcGNLYVlEdFpFbzNoYmg5cVpXd0c1eStUZm1h?=
 =?utf-8?B?OFVKdFY3RWl3d2tQaGhxbnRpNWJrTFFmcnE2eDZ4SVhlN3Z6cEg0Nm9FczRL?=
 =?utf-8?B?OFBKaVR5cWEvcy82OHBzZy8vc2swand2TkVyK3ZJVEllaUlPbG9VaXd0Mzhn?=
 =?utf-8?B?RFdCSmc5ZlNwaUxJd3RtRHVkajhtSVBVSFFWdnFGdEllN0FoQXpVcUVpM2dS?=
 =?utf-8?B?Nm5oUFBIT1ppSm1uaUJBTmVFVW9IM3Y3VFAwM0hjQ2ZnT0JuZ3ovOTdGaFc0?=
 =?utf-8?B?cGxZMERFczVyVHNwYVRhU1hLSUp3cTFtNEFHUUxKOFhCcUJMR0JBZ0FsVllQ?=
 =?utf-8?B?Wm1sK1dKWnF0cVdXOG01WUdUczRDK05YL3p4RS9qa0FXL0R2YTVoU0h5ZEs4?=
 =?utf-8?B?YzF6cmhQd1gzdWl6TitZc1JORGhNTUxCeE00dmlKVWJYSFUwYW1idk5tSmRr?=
 =?utf-8?B?dnhCb29ieFpzVzdudTAvazdsSkdRUDk2S29zTzE5Mk1lTEdPeEc4Unk2SlZM?=
 =?utf-8?B?bGRNQThVdHFadGlzWUd6cGFGZmRxMUs2bGw1cS96bXlYd1hkMGtLZzhGVm40?=
 =?utf-8?B?OFdjNitNczZkeXAwTHZOSk9LTUZIY3BxeEtqZ0F4dnZrWjVjTmUvemV4UU1U?=
 =?utf-8?B?cW9aUTlVM1lwM3VwOHRPNVpEWUlJTnVLTXRLVnBmY3VLYW9zdHErNG5Lazlz?=
 =?utf-8?B?ZnVoT05kRmczZWJhRXpyUXJrQ01XQmVVR1R3K2tPUjh2UHVIZnA5eEZlYXJz?=
 =?utf-8?B?WldsM0JzNHg5S1d0WTluSU4yMUZMTkxzOXRaV2QzN3hXcnJhZ2RkZlZNaWF4?=
 =?utf-8?B?cHZJaDJLQmplTkZrZVZDT2VVS2J1Z21NeGRoVVp0VEdJa2N5MmUzM0VJT1pL?=
 =?utf-8?B?UUVCRHBKbWVrM1pJaEhMcytyRnAzeHZyUHkySDVBcGdyN0pUdkY3aGlDTUdX?=
 =?utf-8?B?MlRVbTV0Nmt6ZFZ4SU1xakhlYmZIUjAzdk41amVCOFFKamZWM1FKMzRyVy84?=
 =?utf-8?B?VDIwOGNZcklTdXJxZU9zcmxXbjdOLzgrTW9WNDJQaGw4cU5QZlBaOVkxQ1lm?=
 =?utf-8?B?MEJZRzZvbTUrbi84RC9oSG12R0ZMSTh2V2ZJalAzS1NRZUpaSFVIdE1mR3lH?=
 =?utf-8?B?YmJxZ3Zpb2tQeThwV2pSMXp1SlRUZ2FjVlI1LzAxWlYrK2dCQnF2SHUvNktD?=
 =?utf-8?B?VHhCOUQ3NHhjOXR0eDJuS01NYVpVZnNZME1Ga09taUtDNllCQTNrRndvd0N4?=
 =?utf-8?B?UmFtZWdmL0NpSkZkS3c1RDVoWWorWEl1aWpvWFJvTXJPTmVEUm0xdlI3bm9x?=
 =?utf-8?B?QkplcjdkUnhRcGg3ZG02ZEJ1TWd5d2htM3JISFVCMjdsUVdGOUJCQ1pjRnR3?=
 =?utf-8?B?VzE3SmJCeFZHandoQ0xCVHdXcERkZ3ZuK1pQOTFJNTd3Ri8weHRVTzlFdmFz?=
 =?utf-8?B?VlQ1OVNpYjNaTWtXVHpjS0hqaWZUVUNVTnNjczVRN1RhbzhNdUFBYlFCZHda?=
 =?utf-8?B?ekZZUjFTS1RNczd4cVVwbGY0cEtEdm1ya0tycDBkMTZHbk03ajRHanNhKzFi?=
 =?utf-8?B?YjFkc3ZtWXB4cUt5em9iYUthTjJUZFR4eUdhNGlVYTFHT2gvNFdjclJKYlI3?=
 =?utf-8?B?YStybWNNNDRTUHRZblljT0trMzBMOHhYVmwrMExrUGRhRHlOZklZWWNuK2Vy?=
 =?utf-8?B?TFRXSS91alVDdzRFUlU0ZEwrb3dzNC84Qk0vdFd0OFNwNkJDcSsxTGorSGRW?=
 =?utf-8?B?bjhnZXlqWFR2UlNXN21XQlR6TlpGT2tDUEtNWDBlQ1NrNW5NRTg3R244WTJG?=
 =?utf-8?B?Z0xvTndySE12S1ZmSmZiTkNtYVpVbnR1eXl2UVhQdEZIV0ZvUVBibFJSM0Rx?=
 =?utf-8?B?cVp2R3VPbGpMUnczalh5T0VGczQvU245aHhDVEdnNzEwVFFicjFiRXk1T3NV?=
 =?utf-8?B?VnpOQ0tBNmR4ZVR4b0ZlSHptdGx3ODBFdkpUZFNNWE5IaFNMT0JZWm1HZnda?=
 =?utf-8?B?VHU3dkYwdlZhbXRESFl5Tk1VS0xrdytFZUhQL3IyamdQNnBkT0kzbGVVNTdl?=
 =?utf-8?B?NGIwenFnQnNZcUt2TEZmZnRncW8xZ3Zid1daTFQ1MTZncUxWTGNMZFE4S2xQ?=
 =?utf-8?B?RTFDRmJCTWRzWGMzVFp3d2luZkg5N0ptV3dKYzcrcVV2SlNnYkQ2K28wR2VV?=
 =?utf-8?B?YW1FSTA3UnJSUGlPbGl1NFlRVXc4anhqMTBpcGx1cEl6eDdIbEpNNks2ZWF4?=
 =?utf-8?Q?bFHYSGwGLgYNTVcvwW?=
X-Exchange-RoutingPolicyChecked: tBE/rqh4A0lS8am0z1uYPqhFLaiOtzRvGkoRKWBORoa1vxr2vzy25hH/lJguTZIyfNzUVjdwYZMRPs45zwQ6CpRncKF6oan4SWP4iuazkLSsEztpPM3cFWVUdwftvl172jzl2+O3IJTrMNvAhOcWZnY25SPBrY54SCAEr1F73BTzz02jNhAifiT81RQoSL7PlEHf2EMNfK0XkRiRKphIFBHIq3C4h+FdaGpFJBimTpPLETA1r9MJbN8heISjOtRu90qPSrfvz3Kr+rcfG/Pmr07QPyPykEdeAgs9n6VxsDJHk4yh3jBFcEeaAlhM83rUqpAyDl2zDWedIuyvJHUQMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b230c8-d249-4436-83c8-08df1a8af3bc
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 22:27:00.9717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjPzC3VSt0D4EfHYN7wxIdzQLIq7io8CVLKI5awNFNHFtlqt1bll+XbjEo3RuYPQXp/eeZZrseRbszTb7DqAaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5875
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



On 9/24/2026 13:44, Lin, Shuicheng wrote:
> On Thu, Sep 24, 2026 11:31 AM Xin Wang wrote:
>> On 9/14/2026 18:12, Shuicheng Lin wrote:
>>> The NULL check on madvise_funcs[attr_type] in xe_vm_madvise_ioctl() is
>>> unreachable. madvise_args_are_sane() already validates args->type via
>>> a switch statement whose default case rejects any type not present in
>>> madvise_funcs[]. Every type that passes the sanity check has a
>>> corresponding entry in the table.
>>>
>>> Beyond being dead code, the check's error path (goto err_fini) would
>>> also skip xe_svm_notifier_unlock() if it were somehow reached with
>>> has_svm_userptr_vmas set, since err_fini only tears down the drm_exec.
>>> Removing the check eliminates both the redundancy and the latent
>>> unwind hazard.
>>>
>>> No functional change.
>>>
>>> Assisted-by: LLM
>> The code change looks good to me. One small commit-message nit:
>> Documentation/process/coding-assistants.rst specifies the format
>> "Assisted-by: AGENT_NAME:MODEL_VERSION". Could you replace
>> "Assisted-by: LLM" with the tool and model version used? If it was the same
>> as v1, you could restore its Assisted-by tag.
> Thanks for the review.
> LLM is the latest suggestion of the doc as below.
> "
> -  Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
> +  Assisted-by: LLM [TOOL1] [TOOL2]
> "
>
> Shuicheng
You're right. I checked an older version of the documentation and
missed the update to the Assisted-by format. "Assisted-by: LLM" is
correct here. Sorry for the noise; please disregard my comment about
that tag.

My Reviewed-by stands.

Thanks,
Xin

>> Reviewed-by: Xin Wang <x.wang@intel.com>
>>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>>> ---
>>> Cc: Arvind Yadav <arvind.yadav@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_vm_madvise.c | 6 ------
>>>    1 file changed, 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> index 0474768a38aa..5c7aefc641ee 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -713,12 +713,6 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
>>> void *data, struct drm_file *fil
>>>
>>>    	attr_type = array_index_nospec(args->type,
>>> ARRAY_SIZE(madvise_funcs));
>>>
>>> -	/* Ensure the madvise function exists for this type */
>>> -	if (!madvise_funcs[attr_type]) {
>>> -		err = -EINVAL;
>>> -		goto err_fini;
>>> -	}
>>> -
>>>    	madvise_funcs[attr_type](xe, vm, madvise_range.vmas,
>> madvise_range.num_vmas, args,
>>>    				 &details);
>>>

