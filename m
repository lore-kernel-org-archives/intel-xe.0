Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601D5C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 22:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122C810E077;
	Tue, 18 Aug 2026 22:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tcs+Ra/l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE2A10E077
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 22:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787093584; x=1818629584;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=u49BhAcoZhzu0bzFbUWRTLR7ja+u+bAB4kUUBpvkYC4=;
 b=Tcs+Ra/lWYJ7vkMbJvA/0Ia+zovY4cNqznhiSUtdzJGYlebsAvLU7pwb
 f1PZtx9AMCxAocfZjyvCGBLBCaRn9tICLyIzCLkiKGeL2pXz9RxnzxdWf
 wRS7pAjbXJyjZ2F09sbrugoGUaPiyUChtnVxxLdu9sTJTcylwQSYDs91K
 24VPY+Bz9N1tVURTk0Xg9iOlFcIkVRm+im5NND5nRRiGpHZdLR88PKlib
 /cLZ1aKfq83K56trf0hw9aUWzCiUK9PnzcxguRa97GeL1STXt+FiHfcmW
 ZFja/LENNmAsbClFvKEmSSe6xVoLAQVRRGKIDAH4kwUj0I7R+oHHFL3oW Q==;
X-CSE-ConnectionGUID: 8B1QJMLITTC2BYctx1Z50w==
X-CSE-MsgGUID: ovUgVpzSSCyAtD+5y68cfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87802121"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87802121"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 15:53:03 -0700
X-CSE-ConnectionGUID: kNScXnOFRm6gqXHT3FO7BA==
X-CSE-MsgGUID: 9mSdstq7Rkav5rtc2CnTkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="270559435"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 15:53:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 15:53:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 15:53:02 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 15:53:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ButwbK0cqBvQiqYmQzYUYHaoGZq/om1WUixOhj3oouGlI2hXnRLasND48nT1dpWJcS0R+uuwq6A6u3uOTBPM2TVpqWssKI3bindyRSb25BFiXLWtC6Sqipi28Ku6i5+DJ8f4X2W61JXmvyEse25cCdF5m49tgNPWr9yOxRKjm/IuLliOJTcO/fyK0D6sOLShCssHJ2d1GxMWHRvFnh5NmDDCrO0TzxAMLmksLoXLZZs5SGIPK9hRia+r2ARYL0Gb4JpgzMHR3o/2XyR6b/lYob7Kv3tHYJ5I4jScAnBr4Ycv+bWeDVxL2VV49nZhH6KJGMcRvTeXDep1rUNzU2a6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oSECCyjTgXsSJMtWGHJHim5rIOPrfifkL+RT10CvL8=;
 b=jLgSOkJlRUWCdzo2q7oEx5199StsghNYklJ8Sex4IP3QrEd6cZHC9s1bjfD+480B/F9SDdmP1dM7i52R/N1mrg1Vj5yTBjZjIS42xelmzdsgI79iukkhfaC93IL6545B5+/ZECwgwL/5hAWwDNTP+zORJa4XNmoRP/eX3xWHjcd9QWA07s3PCe3ZtfE344d5HYwlV0Et6Gt6nHyN5QbhM58VUu0aVXs8zgtLGVHwtNcV2EUT3LrsL+Omsm+kbOIn06Ph2sNbAy+yxCysxVD94e3cNR302NeKbftUePoqeQ9QVwp3CWU/w6eg/sIajTfdd/6DWBagRUTC3HVV6DppCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 22:52:59 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 22:52:59 +0000
Date: Tue, 18 Aug 2026 15:52:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH 4/4] drm/xe/ras: Report CSC errors using SIGID
Message-ID: <aoTiRIIMwU+GwUrd@soc-5CG1426VCC.clients.intel.com>
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
 <20260811235254.153783-10-umesh.nerlige.ramappa@intel.com>
 <3520b3ac-9798-4077-a7b8-45b06c01ed2b@intel.com>
 <an9eDL/b0zkDOCtd@soc-5CG1426VCC.clients.intel.com>
 <a228f329-abd6-4a4b-bf1a-24db61084d10@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a228f329-abd6-4a4b-bf1a-24db61084d10@intel.com>
X-ClientProxiedBy: MW4PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:303:85::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB7054:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eadf4aa-819b-4d3e-03fe-08defd7b7340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|56012099006|10067099003|4143699003|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: Nd9qLzwYvYFn7T0dMG6hlM0IaJLxX+Cju5DQoT7kANSF96MZ62Mz4onbv12LbGBWIXvylFHvPwvG10Rsd2HCvNWnaZ8KmCQWErxDqLEgu+gFi0TFl3VcXA/zo+nUndxrVweWebmnnH6KSNxiauVpc/6FF2Mi6YxSdStqzb4bQVoDEJvwJvU3LtjnAaymF2doYBUELab+udOs2byFRSpgFgnpDpnup9XiqIwJH9hNcj2yJrt6J6U4yGsYj+P9wPH+A0WwWTomkv7d55VSIB0430RmdELKmR8EXUGb45SNR9OJd9A/RDHZmSdJeOYlQAKVNHo1XAvnLYX4miRLPLwosVTGhtb+M/7hYe3QAuSHg3aIgG/eOPonHrxGlHVhTm/BL7fKs8ZVRBWMI+pZduZLzCdezN7Kb3qv+uqq1MGv9DbmNLEnrmtM8gbkFWIaeibYQmYyEdUYg5OTflZlMeliX3qNVfd+Yr/DXrJcdewZytLIeFoukNVHBHrMUqdNZlaQGwZuB4Br5tegOGWjAGg8Qih8MvrEedrmT13ikD13fvkm0csdniQvdDKKTG+0sDStBQqEKPGt7HnryA4zgZhg/pd9k8oZIlFliUpJUp7/Kt4kaNWmdpIdrV1wg1OwYeGVXWSMTqDW0AL+vyeRpRRabiwLkKtkDf19MTkmT8xPwjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(22082099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDN6Y2hxaFlsUXY5empkcityY3FERWZUYi9iWWREV2tVUUlvMEVWbDhxNTNr?=
 =?utf-8?B?RndyVHVsZUtCNnJpQ0hHSkh2M29CclNML3UxWXo2WW52N25IeDBpdW03aUdZ?=
 =?utf-8?B?T24xK2U1TG9oQ2JPSUxqN0lKdi9QQmoydWw5Y3dFWXFKNzlqVHJIam0xKzlF?=
 =?utf-8?B?OUxVYit4TXdzSzkwdUlQMEtkclJkS2JkbmNxcjZ1dEJWYTBtZmR5TUdvN0Na?=
 =?utf-8?B?VGxwdS9QRmswVUlXaERYQ20vVmtyaXcxSFc2NXh2UXpoc2J3dWZQdi94UFpM?=
 =?utf-8?B?VkhxK25lc3JCald6UGtXR0tpN0MvejVaTU9sUHhZMjVVeW9hZVAyRGNudlZY?=
 =?utf-8?B?Qzl4T3NHbENUWWszbzhvekpjZnZoc29sT3lhS1NQL2JXajBEZWdyTzc5WmZk?=
 =?utf-8?B?cGlRdW9JdzJmOHV3SFZtNnc3YzdYM2dUVm8vVCtZQVpCQ3dEN1BiczJQakxz?=
 =?utf-8?B?aFM2amQrS054TmRSS3RZbUZIdGptVDltWGNpdDd3ek1mM2pSd1ZPZWZ0UVpR?=
 =?utf-8?B?QTNRYmc2U2wzbDdPNyswOTh0K1VMRkJoRy9RRjNiVnloajBxKzRxRVFMVTNo?=
 =?utf-8?B?RERCV0ViYXdBR0FKRmRoMUFyQVo4ZzFyNFhueXNza1ZSaldqMUpxUFFiVlpP?=
 =?utf-8?B?eVZTVlpmQzdocnB1bFlad3pBK0F2RGF5TGNhWGlQUm55YWNsRDFCb3VPdEJF?=
 =?utf-8?B?K0pTUjBzU2JCZi9VL3dta2I3d3ovaVJuTTUxTU5rQWgrVGl5WllPMlRLZVpj?=
 =?utf-8?B?Qkl1ek9EUHV1cEFPN24wVzhxdnNCMFBGQklXd0l4K2RWNnZERElqanVvRnJI?=
 =?utf-8?B?VEZkeTVoVzRaYnpENkJ2a3JEVHVhekNzOTY5WXpnUWlEdkxxSWZvZ0pTMmNw?=
 =?utf-8?B?anA1MEN1TUZ6VXNWMWNGTkkzelpOSW5QWVBMNEwvdUZQUzRGNW1DbEpBK0xa?=
 =?utf-8?B?Y3FlMjgyR1ZTMDJVakcvN2lyV2hEVytNZC9NOE41Zyt0MnpwSnZuWXZ1MGl1?=
 =?utf-8?B?QmowRVRxZWRnR2hkb2RoV1RrZjl0b0o2NE4wUXZkYVZ2NWE1WVRnbnF5K21T?=
 =?utf-8?B?K1VXMy8xaHZLdjlweis0eTl2THRMczAzcXFwT2gxN01PYWFsVTd0V1NhNnRm?=
 =?utf-8?B?UWs3YjJsdU0vb004dlNzeGNpYmtteThjYUYveHVUbFgvTGpWOVlvc2twS2cr?=
 =?utf-8?B?a1VrdzhJMGtDdVQ3WjFFOHQ2d05BT2xld2czcURPQ0tJY0xnRm04ekxtUzI2?=
 =?utf-8?B?eU9Dbm1URDAzRHJPVlpSdVhTY3VudnRNTjhvb3FiMUJQeU1oclU1Vytxa0Z1?=
 =?utf-8?B?Nlk2ZkJuTU51bkZrSFhITW84YlpldUp2WUkrY2I3QjNwWlJ2endEaFVyRkVX?=
 =?utf-8?B?SzhaR3dvZ0dBRmhldmhWazkrMklQZ1pmM3h6L2laUGZWSU9BQkZJRnZ4Y3Bo?=
 =?utf-8?B?Tmc3ZXptOWVTYVVCclFCbXlTakZ2MU4rQlVXLy9CeG1GTWR1dGdYZjFaWGRN?=
 =?utf-8?B?aGJmbG5mbFJkR0Z6cW5nOGZLaUE4WHNkS3ZtUkNPV0Jla29qam9GZ3BSSGhX?=
 =?utf-8?B?SWdmeTUxUldQcEU0T1BqVllSWlZvWUNrTkw5akZadXdoWkRxellRa1RCd3dL?=
 =?utf-8?B?TjRLcU16MmdITFA3M0N1dUc0OGMyM05xZTVPUldMOGtOQjI0MXlNNEtNelor?=
 =?utf-8?B?QzZxQUQxYkJVbURod093djd0bEhTdEptNmNhL0gyK2hPbzduaHVJYllJNlBK?=
 =?utf-8?B?WDdGTFl5WGhDYTZGMGh4bDRHOTFRbjk3UytYVFJzb0FQOTExNmozYlorRG10?=
 =?utf-8?B?SWNLeUtaamxpWEhONFUxM1dtRUdrS3Q1S0RGTmdlemRyemxRam1acGhEYmVG?=
 =?utf-8?B?TFhLeUVKRWZ6SUgvV1E2QzZFOG1wbE5mZDViQTY0U3NXUE1JeDhGRDdZalNh?=
 =?utf-8?B?UW9qcFNULzQ2OVRRRmhlaVJIbisvRG1Hcm13QURhT2pLMlZTQk9NWnJTY1cv?=
 =?utf-8?B?a2VaQnBobWFZaHcvQWJoUnNhVFIyd1BNSVdVWkFLdFNFMU9qOG5ySFM1R1ZF?=
 =?utf-8?B?bVRxd2czWVhZMTg3aWliL3FHSHFIUVMzcjdmTVp6NTBKaG0xUERwV1ZUV2xB?=
 =?utf-8?B?QnlJaHg5SXhLUi9MdFRST0owSkhhNnVGTFR3UCtTbjNoV3pDQUJJUldRTXJJ?=
 =?utf-8?B?NnpuR3VBcVY2dkJNSHpCRVRLNm9Ydjdjd3R3SDB4Qzh3UkNZSGZJWDd5OUZD?=
 =?utf-8?B?QWQ5R3NFMnlFTXZaeGFUaGJjUk5Vb0p4eG54NUVKTnlYaHRlTC9TVVdDZlF6?=
 =?utf-8?B?ZTZuOXpjeUVGT0svTjk2WmFFU09BaTA4Vi9TL0pMN1NISUtQRXJSa3RmRFFy?=
 =?utf-8?Q?pru1FL2EfvK0itkaC4pFH9BRtZul+jxhq0O8q?=
X-Exchange-RoutingPolicyChecked: Z016QCHsbZwnCAUod1a9nBwtthnVCyYVS5ZsXoF47j/Erl8B/bJa7B5AehSqlmxVcITgomIX+dm3BZg+/5Qy3wEPDIshXhN3Ru0X/5w3Mv4Cwu1by/Hi5KHjzNOLGcdlylFd8jGZtO+TcqeNnnCEJKJYTHcNo2FAPM+EubwcUSA5bspjXaIN/GEYvun3mWzGH/VTSOpdvTK43gIvIFSDauzkB5Tfnak/lVaMJn28vJ73QThOjFtZYD9JXiEbIs362fYFyyLlgWVBjWtbFtdIAUWvcMFtNJsVP85ZQMlWwvBvtIHd+pkX4U4paP8flQz1eEAjv4b5m4OgQOKvvzo33Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eadf4aa-819b-4d3e-03fe-08defd7b7340
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 22:52:59.1647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtSwiVYMgGEowPAyLw5V4b6rKQu7A2TjMnNvGFvVx2oUZYkuRWMQbc4j5SPn4vjV5BzEM6uHnixRFj3WecG4QIn7+vN8/9WOWer9e3j0yXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7054
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

On Sat, Aug 15, 2026 at 09:59:24AM +0200, Michal Wajdeczko wrote:
>
>
>On 8/14/2026 8:27 PM, Umesh Nerlige Ramappa wrote:
>> On Wed, Aug 12, 2026 at 09:52:22PM +0200, Michal Wajdeczko wrote:
>>>
>>>
>>> On 8/12/2026 1:52 AM, Umesh Nerlige Ramappa wrote:
>>>> Use xe_log_err() to report CSC errors using SIGID.
>>>>
>>>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_ras.c | 5 ++---
>>>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>>> index d1aa3794f2e0..e50ab49bce5a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>> @@ -283,9 +283,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>>>>           * is required.
>>>>           */
>>>>          if (csc_error->hec_fw_error) {
>>>> -            xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
>>>> -                   sev_to_str(counter->common.severity),
>>>> -                   csc_error->hec_fw_error);
>>>> +            xe_log_err(xe, SOC, 0, "[RAS]: CSC %s detected: 0x%x\n",
>>>> +                   sev_to_str(counter->common.severity), csc_error->hec_fw_error);
>>>
>>> hmm, it was assumed that for HW errors we will use 12 byte data
>>> while xe_log_err is mostly for the SW errors where we use errno
>>
>> Not sure I understand what the 12 bytes data is.
>
>IIUC it would be struct xe_ras_error_class
>
>>
>>>
>>> do we still need to use "RAS" prefix ?
>>>
>>> maybe we should add component XE_LOG_COMPONENT_CSC with SIGID_SOC_INTERNAL ?
>>>
>>> shouldn't we use common.severity to select right xe_log/CPER severity ?
>>
>> Not sure how to use this macro to do that though. I thought severity was automatically handled in the backend.
>
>if you plan to report errno-like SW errors from the CSC FW,
>then IMO we should add new CSC component in abi/xe_log_abi.h
>with XE_SIGID_DEVICE_FW:
>
>+	define(DRIVER_FIRMWARE, 18, CSC, DEVICE_FW, "CSC")			\
>
>then you can use
>
>	xe_log_err(xe, CSC, err, "detected: %#x\n", csc_error->hec_fw_error);
>	xe_log_err_fatal(xe, CSC, err, "detected: %#x\n", csc_error->hec_fw_error);
>
>or if you can match counter severity with CPER severity:
>
>	cper_sev = to_cper_sev(counter->common.severity);
>
>	xe_log_comp(xe, cper_sev, CSC, ERR_PTR(err), 0, "detected: %#x\n", csc_error->hec_fw_error);
>
>but if that error is representing HW SIGID - SOC_INTERNAL
>then I guess it is expected that xe_ras_error_class should
>be passed to xe_log() using:
>
>	struct xe_ras_error_class data;
>
>	xe_log_comp(xe, cper_sev, SOC_INTERNAL, &data, sizeof(data), "...\n");

It's just going to be a CPER_SEV_FATAL since it triggers survivability.  
I think I am leaning into the xe_log_comp (SOC_INTERNAL) recommendation 
here since it also matches Aravind/Mallesh's recommendation offline. I 
will post that as the next rev.

Thanks,
Umesh

>
>to allow proper CPER record generation
>
>>
>> Thanks,
>> Umesh
>>>
>>>>              xe_survivability_mode_runtime_enable(xe);
>>>>              return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>>>>          }
>>>
