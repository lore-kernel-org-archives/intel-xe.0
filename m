Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF369C56205
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 19:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F98910E35A;
	Thu,  6 Aug 2026 19:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1c/9GyZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719B710E35A
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786043696; x=1817579696;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jaH6Oo8ajivU6mozVfAb9+aqAjvHJAkDrFSlkqai4HI=;
 b=P1c/9GyZ0Vo6knjofcCs383dwCXRaTiSKPfig72j1ivpLBEacnM+6DCN
 Gj8BOE+PoagM1fwInZUphBMGNhyp1UB0pQZ2k5H9dtT/vqUSBGQxyYqhS
 jCNxRivMUXCpuJ3IHIQZbK+erg/c6xSHFeQzAKHaxAt6oVvZwSEf/fm+A
 WkqQ6LtvGDh9cwN2VQHADZNYG0ihwxTD9X2d5/3S9/EH3tzIOg/PgflU6
 I+TIORi1Bgj3AjwZAbHv2TxDrV4BbJZgeEpGtC+4PLtaMA0EBZVB3YZJk
 xi+FL9p8dEy67VwH9bdh+As+b16WWIPO4ALpwkoH3j5LJ65qURO2Oa4vV g==;
X-CSE-ConnectionGUID: ENiO/MutSFOPKw3OSZWG6w==
X-CSE-MsgGUID: w3uOO7C6TUmQWehv2wuYRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86856665"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="86856665"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 12:14:55 -0700
X-CSE-ConnectionGUID: lucoDwkOTSWs9xVe2vWUbQ==
X-CSE-MsgGUID: HYo8GRk/R9OBvXDQtmBX3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="266421253"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 12:14:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 12:14:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 12:14:54 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 12:14:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZOTdKEkP34/NDSKBkQ0kmX23wk8kYMYPF+XJmbQyL6w66L9CwH4a/aFmO5XjlKSTn1vHL4O2l/0BobVOC/84x2Q2E5iQfuo773MjZr4ZXiQDJ7oSdobNJmKnWan1czd5sqhi44Px0sNIDG984PhW0NqIa/zpMM3v8BCo0fZQU90UQ75hLikDcMXxzP3K7nXOl8G4W6r4S6sLlC3h1sfa9hJwoWKdMOAoNLDXTruKRBW/e8Rw7emIMY2T7BO3OLjgEAiZuP6YGyT7X6RiaZsk2p08sSArn5pYM1/JJKtqGxhYTFJrzoUxiKquSV1msacF5iVWokwv/8kFvv1CzsHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1Gkus18Pxv+x3ReZuTJCswwLwBc8tbsqtHDoLcb78M=;
 b=vTHk78LbCMU4fW0HgFny8jjMCJLQpaIXvbh1CnXnpsGywxc4o8AYGsdVY6BigI9PZwqxfKx68OK61V6VVR/Q4xXDUghtlgJLiQioMyuFgNUjKQ+/bczwEulHHgp5+0ThV6oWCX0YNPK6Ci71fWxpzY3TISs0tQaWN2/P8vRbxnOpt+CrJsLUYKdIKFS1q0Bqbz7A5j0cEDLm9S0pbWPFe3Zua2fPgwz8IpqmbZ3OT3dMqUXrQGS7NAO6Od9Q72TkLYBVsWuuVPHZK/wWFEjZ7e9bpEM2C5RlbBkciQUIJ4ErsCry4FvloaoPs6O2XB6dUL4QY2OS4iIoAlbHofwU2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 19:14:52 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 19:14:51 +0000
Date: Thu, 6 Aug 2026 12:14:49 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH 4/4] drm/xe/sysctrl: Add better sysctrl error reporting
Message-ID: <anTdKWZiIQyeEcY7@soc-5CG1426VCC.clients.intel.com>
References: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
 <20260806110039.1245282-10-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260806110039.1245282-10-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: MW4PR04CA0291.namprd04.prod.outlook.com
 (2603:10b6:303:89::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB4824:EE_
X-MS-Office365-Filtering-Correlation-Id: 813378eb-8b2f-4d5c-f804-08def3eefd91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|4143699003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: c+PerRyERgiQDx8MNOzjhKODUL4w4zcK2k8cSoQhYKi3SasEKzHHe5G0+sq84RUYVSFdgzDO1Rc3WxmO3+WOIbQrA7J9mbyXh35dKe3oCzeRRMojXEycCJAgTenvVWcXxzM5DaA6cXf2r3562bLhWxKOmIpurow/3mzKZbR35bC91+EkOPJxSwq0TTbVeL2Ugk1/02rN951tLDJTm6gZ69WDlvfgkFOWENFRio6ZtaNjEJR7U4UvnT0gjrukRnb2iBiIS0dq8qIxv3Oe79QqYXJ3rtwJghgG5O5Jaw0EuTZ69L25HDNp1bl447Qoy8pJb/0dISZ+XFEF2qa/OdifU1+PH1pk3lc1bp7kqYlHN0uvY55sMljIH31oJoNjYK6wQPIZspP77b7IS5r8AAJmd9snFFgRcwy2h+4qzd5aHb0daupyI9wSxWa6skrt2/8TVZLEd1O5MHGQdYj/tnnTh8JoZ+rrmpzmWwqVyDaG92F4WTOsBK1VSI383aSVNmOlFuQ4PW5YZavvmFXpXihIraDJbWK+Y9p3MHg10XxGji6vS5pD2cVOEh2PlI75ggnWKEBdZrrzoe/J8dJTYvTnnJZpJGJE3C+GHMPxwwvnZyenaxHwqbf64+/N8dv/cLuJO+8BrZ2+1o7wmsp7jYhM6/eYMBEVwBrEhJxgKHtG3WA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azRRaExzSENYc29tZ0I5eS9nVzJIdUgzUm1FVFRROXdqSUVxb2JEbjcrVWFy?=
 =?utf-8?B?bTN2NlRkdmk0QnJ6b3BPb0J2UWV4NXhXS3FkblcwYTVuclNZT0ZROFNvN0xj?=
 =?utf-8?B?SkljcnNaVnEvSGJscEM0V0Y5bGZqMHhjVUcvWlBYZjBZRzh0YkdhRFcrVDEz?=
 =?utf-8?B?QXR3dnY5RmpIeWd0TEF3MythdHd0Tno4K1dxQy9WTmdxQ01ZSHprWUZ2K2or?=
 =?utf-8?B?NlBBanhVQXdnVXFKY0ZUV3Y3ZjJMRnBZSlA5MXl4U29mTHNIMWVOZTZrRGlS?=
 =?utf-8?B?ZUFvMU04V1RxeXh0cG5zaWc5OHRVcndQQlRPRnY3MUJCeWZ0RHFxZ0FDcTU1?=
 =?utf-8?B?M2d6c3p4KzdSdHVYYktBaFVLdDUvSWQ5RkF6NnlyUlNYcFN1ejI4eEY5UVI2?=
 =?utf-8?B?aS9FL0VlYjJQMGM3QjlWZHBXYzA1RE9oTjl3dWIyTlV0a3dVUE1NRjZGTjU5?=
 =?utf-8?B?RUh2SXphUFZ2K1VXMGkveUlHRnhEemNYMHdic1U2WWJVMllyY3lzL0JnTGRU?=
 =?utf-8?B?VnNwcjZoZW9WMEtiRjhiVGdhSk5SV0RnZEtBanljOUx3MUxYaEcrRG9PRmZ2?=
 =?utf-8?B?L295TkhXUUg2YzJWRVNBek9rOTRTUko1b2llTHdXR3FkbVhEc2VTaXBwMmgv?=
 =?utf-8?B?S3FTZEplZ2twNlZFREVVaHBHeWVST3k3c1ZmNHFtZE9pbzlDcEw4cFhyTEdB?=
 =?utf-8?B?NnRqeGZQMER4K2taZkNWUkxTQWYvMGphM2VKVUFXajRnK2FQVnlCeVpNdG45?=
 =?utf-8?B?RjY2KzBEbjA2L2VnUk5QQ2ZtZHFvSzlmaTNTQW1SMDVjazNxZFNBMGorc3hF?=
 =?utf-8?B?WW9PbVNDaktkN2FMdFFJRWlPNHFOM215UDN1QlJ1UjNmcCtqVzJmZ3ltZm4v?=
 =?utf-8?B?Zk5STy9YYWJnSzlyZzIwbU45Rk1ZVjU4dlZ6eEVVZmVKU3ZUWmZmcURLSmtI?=
 =?utf-8?B?cVRsWU1mUHlyaEV1RFphZndPYk56RFlPQklMOHZKM0RNVmtBblo1dlJnTjFG?=
 =?utf-8?B?N2lZaENKYXZmTUZzTElnVkdmdWtPU0VhbWsrNVliYmVTZG1pUkp3M0twU0pU?=
 =?utf-8?B?bk1VT0pTMHZyMHpibW44Y0Iya0VOWEpSSFBaMCswT3BCcXNGMStML1VRZGlU?=
 =?utf-8?B?d1NJb2RQbVEyVnZoTnB3TFR1dmVTRVBzSnpFQnlMTEkvWDJ1b2RGdzhmKzhY?=
 =?utf-8?B?dnA5Ylk0TG9CdTlscVlxbHQ0cTd6enpEdFdwcUEyVzFIUERKMUFaRG5NdGJn?=
 =?utf-8?B?V01ITlRlMmpRZlZEY1dNMjd4U0d3a21VNnpoSjlJeTZzNmtFd1Y5WWlmK2l3?=
 =?utf-8?B?RlYyN0hxVll0ZTdEU3FaYXo5K3JyVjdRWVRGV0U0RjR1UGJYOExFd3NyeDRW?=
 =?utf-8?B?Nm0rOG00YUhLakJoNmJkT2JteDRjT3J0R3cvdXErZzZBME5WR0hza3R6MUpv?=
 =?utf-8?B?bzRxaDg5RDJGQ0FrWE9IK1R1SVBFMlFkYldRWFRvYStQYUUzUWliTnEyUm04?=
 =?utf-8?B?dGZlckNNSnQwSXp1clF6Ri9rL2J3Wm15cmdFWGxkbmN6UUJ0d1gwQ2Y2ckY0?=
 =?utf-8?B?NFdFR2oybmxOR0NtTFYyY0N6LzRxU3hSQk1hYjNqOWdqR0NIb0M0U1FKQ2xT?=
 =?utf-8?B?YkpGbnFscFN0cElJc0pMS1VJdkVJcTdsUXB3QUtqRjRmMlp6dE9TS01XVTMw?=
 =?utf-8?B?eHhjbVJyM3BtaXh4V2ZUc21HVDM4VzEvQzg0WjBVZE9WekhuK0V1dmFuSEht?=
 =?utf-8?B?ME8xRldvbXhNTHNSQWlQbTNjOXQwaldmaklJdzNIZkNHTmI4MUw2VzBwdDFa?=
 =?utf-8?B?ZVBWaG9Bbm4yTDJBUXl6VjRla0VHWDV3SXpHR01obE1JM3Y2M3VwL2hPdThS?=
 =?utf-8?B?cDlWT1ViVUhUbG55YWFHWmtlRXMxL2F6VlQvaWkweHZGV2E3K214bmVXL1Jl?=
 =?utf-8?B?VFluK0tSVGZSSVFJVmtOaTFpcEVSNEhZZnBHZXJqOE1vTVk4V3NZMXM0TjFw?=
 =?utf-8?B?cXlrRHJ3ZkJ5NjQ1ZVorRnVuZWRoUEY2bTZhTHdNeFd0MU5iZWFSSzJGVGNp?=
 =?utf-8?B?dTJvcVhKMWc0UW9MaDAyWlIraVdacFg1eEtYZk9mM3NzWDdLZStndVdIa1d1?=
 =?utf-8?B?T3dUaXd2amVqVFJ3ZVA1S3NyV1VibXVoeEdpVW9EWGpuSzJwNVl6MGJMa0tu?=
 =?utf-8?B?bXNYY3c3OExqQUNyTkpiSW1ZSWlublVuMkpnaDcwZ0t4SnQwMmx2WFBKam5o?=
 =?utf-8?B?a3NTdXQvK254TkFJSlVmT3Nnc2hzMk1PNkY2VGF3R252aC91b3IvNzNtb2lZ?=
 =?utf-8?B?TEE1QzdnUTgvYnpMMjNlalROWVhLajh6R1lzc0RqbWEwaVRlNHkxem1mUjd4?=
 =?utf-8?Q?BoavaIGvNH9x6qyMrHJWZrV4Ac+Cqya42838o?=
X-Exchange-RoutingPolicyChecked: ChvJtIV8GQcoLc/YThHUuibk6PpG8PR/CWpheYC7umo/rXllz1cAC+Hz8dOm+L5tfycIfh4mcqxsWlKHrtMa7RPu+II6PqtBH4NqGv1gbqItWOCMd9bwrQTSGLJUgSwH4v9wDq/1bADEOiUXeNSBhcuECBm7RAOB8kwyacKELz335H5eDFdDU4jOwPmhS5suvv3jtfe3NARgSFWWlgdzi1FYjLhVFvbPHgPe2HSqQVuplm9iz1zo2d/j9S9PMfAnxzleZOLKpyzRmOIm+BRvYwxWZmT52XCk4t9uEuGEmfSEuX9YQKSHaQj1fICgJzkMIfzyYB3Dlqq6gnQ4/gY3ug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 813378eb-8b2f-4d5c-f804-08def3eefd91
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 19:14:51.7119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDMduM7KUxo6keuOCZKSnmEoAhQqZT0BKJUPi1bdLzAaH8tJfVUAiUaDoB96pKtsaMNHpML3lZ0P5hoGBKryLg24sLxJ96VbSMyJ/Icwuuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4824
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

On Thu, Aug 06, 2026 at 04:30:44PM +0530, Mallesh Koujalagi wrote:
>Switch sysctrl error messages to xe_log_err() with SYSCTRL tags so
>tools can reliably detect and categorize common sysctrl failures.
>
>Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>---
> drivers/gpu/drm/xe/xe_sysctrl_event.c   | 11 ++++++----
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 29 ++++++++++++++++---------
> 2 files changed, 26 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>index da395148ee9d..1805a0b4d0d0 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>@@ -5,6 +5,7 @@
>
> #include "xe_device.h"
> #include "xe_irq.h"
>+#include "xe_log.h"
> #include "xe_printk.h"
> #include "xe_ras.h"
> #include "xe_sysctrl.h"
>@@ -25,13 +26,15 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c

This seems to be running in a worker started from probe, but it does not 
fail probe. Do we still need to report this as xe_log_err/SIG_ID?

>
> 		ret = xe_sysctrl_send_command(sc, command, &len);
> 		if (ret) {
>-			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
>+			xe_log_err(xe, SYSCTRL, ret,
>+				   "sysctrl: failed to get pending event\n");
> 			return;
> 		}
>
> 		if (len != sizeof(*response)) {
>-			xe_err(xe, "sysctrl: unexpected event response length %zu (expected %zu)\n",
>-			       len, sizeof(*response));
>+			xe_log_err(xe, SYSCTRL, 0,
>+				   "sysctrl: unexpected event response length %zu (expected %zu)\n",
>+				   len, sizeof(*response));
> 			return;
> 		}
>
>@@ -41,7 +44,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
> 			xe_warn(xe, "sysctrl: unexpected event %#x\n", response->event);
>
> 		if (!--count) {
>-			xe_err(xe, "sysctrl: event flooding\n");
>+			xe_log_err(xe, SYSCTRL, 0, "sysctrl: event flooding\n");
> 			return;
> 		}
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>index e13eebaac1d0..5c8edf9871c6 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -11,6 +11,7 @@
>
> #include "regs/xe_sysctrl_regs.h"
> #include "xe_device.h"
>+#include "xe_log.h"
> #include "xe_mmio.h"
> #include "xe_pm.h"
> #include "xe_printk.h"
>@@ -115,7 +116,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
> 	xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
>
> 	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr)) {
>-		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
>+		xe_log_err(xe, SYSCTRL, -EINVAL,
>+			   "sysctrl: Input data too large: %zu bytes\n", data_in_len);
> 		return -EINVAL;
> 	}
>
>@@ -149,7 +151,7 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> 	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>
> 	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>-		xe_err(xe, "sysctrl: Mailbox busy\n");
>+		xe_log_err(xe, SYSCTRL, -EBUSY, "sysctrl: Mailbox busy\n");
> 		return -EBUSY;
> 	}
>
>@@ -160,7 +162,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> 		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
>
> 		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
>-			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>+			xe_log_err(xe, SYSCTRL, -EIO,
>+				   "sysctrl: Failed to write frame %u\n", frame);
> 			sc->phase_bit = 0;
> 			return -EIO;
> 		}
>@@ -174,7 +177,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> 		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>
> 		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>-			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>+			xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
>+				   "sysctrl: Frame %u acknowledgment timeout\n", frame);
> 			sc->phase_bit = 0;
> 			return -ETIMEDOUT;
> 		}
>@@ -194,7 +198,8 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
> 	int ret;
>
> 	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>-		xe_err(xe, "sysctrl: Response frame timeout\n");
>+		xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
>+			   "sysctrl: Response frame timeout\n");
> 		return -ETIMEDOUT;
> 	}
>
>@@ -249,13 +254,15 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
> 	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
> 	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
> 	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
>-		xe_err(xe, "sysctrl: Response header mismatch\n");
>+		xe_log_err(xe, SYSCTRL, -EPROTO,
>+			   "sysctrl: Response header mismatch\n");
> 		return -EPROTO;
> 	}
>
> 	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
>-		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
>-		       XE_SYSCTRL_HDR_RESULT(hdr));
>+		xe_log_err(xe, SYSCTRL, -EIO,
>+			   "sysctrl: Firmware error: 0x%02lx\n",
>+			   XE_SYSCTRL_HDR_RESULT(hdr));

Other than this ^ one "Firmware error", I am not sure if we want to 
report every sysctrl mailbox error using xe_log_err. Are there callers 
in the probe path that are using these functions and would probe benefit 
from reporting all of these?

Thanks,
Umesh
> 		return -EIO;
> 	}
>
>@@ -381,7 +388,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
> 				      cmd->data_in, cmd->data_in_len,
> 				      &mbox_cmd, &cmd_size);
> 	if (ret) {
>-		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
>+		xe_log_err(xe, SYSCTRL, ret,
>+			   "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
> 		return ret;
> 	}
>
>@@ -391,7 +399,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
> 				   cmd->data_out, cmd->data_out_len, rdata_len,
> 				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
> 	if (ret)
>-		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
>+		xe_log_err(xe, SYSCTRL, ret,
>+			   "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
>
> 	kfree(mbox_cmd);
>
>-- 
>2.48.1
>
