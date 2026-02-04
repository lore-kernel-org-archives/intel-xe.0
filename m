Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11B0E8B386
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 00:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6BC10E243;
	Wed,  4 Feb 2026 00:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nm74epcd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7F810E243
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 00:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770164607; x=1801700607;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BNeQNyMcRFlOGgJQIUxgos/0zxmCgiRn+FUYntwUIgE=;
 b=nm74epcdip61GFWUIECcfj4luP/9d+FPE6b65LvpIm3w943DXhHN1Lig
 oVnWq40FDnFgEuEJ/azI/p+OQyDKLmuhaHm3AxxmXvoYErhNhjcvSeOzz
 HnPsH9waxnzvvdqlFtxCIYuEIeheCgx4qYMfO4rZophcn+0S5qYkqlwV3
 W6w2rxKUkaw6/2YG3QF8yg7BGDl00PKJnjecG1XZ3y40H/OP8j3CAA/7M
 GY19yqrrJC1zQa1p+frYQx6RlE2UGIFVupnSBPvoCmTxktZODzCjhZMVI
 cdRC4TYW/22nHcbdn079QOdfN6py2byH7zqkOYhBKl1bmxdmaLGmAj7QZ w==;
X-CSE-ConnectionGUID: 7hNbvbfKSlOXVZrvccHNKA==
X-CSE-MsgGUID: vAjVJw0LSBOsJS9nRMQG5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="73947559"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="73947559"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 16:23:08 -0800
X-CSE-ConnectionGUID: FH0m1PKUT26QcZWvD4ypLA==
X-CSE-MsgGUID: 9WIA40OJTiWKfT9h8oHUaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="232930007"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 16:23:09 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 16:23:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 16:23:08 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 16:23:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IN1g+vWDjyce24rVFmXzTjUtfzcfjJptqMhrYf0vvO07dm3Ov3rlxPqmgRhwU0CFboIEJ8aaEqR8r4XOuPknKgB/GbyIHB3EGmf4SMuSRM0O7oYiEFmejXuP8IjVorGJyPeFiypALyEK896CJ0ge/gVIc+Q6e7p+0uVzKHHS+D17Bl9oX3Qrd2aDrrwpK4L/XMRlR4GP2RQ59Uk9KDdi0b0CnXI5qVTo3/AstR4JO3Cf2CtHdVs21gvyR1iT3OEcIbbaCEzx68cIfYbkrvZmVjCPNRB6AMkgZ8m7gR6x1snDjfXixP5eTHRLuFh2+FgTIXsH3AnWmEpNz/cZ3TiS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Yzh0vYNl+hhJ/Zbw23tvJaHLxsLl3wNAw5lOPUESUk=;
 b=UKCBsdL7UAQSuGUIY92omcMbq/SoN5nzpTq9yHPMgC7fsaA54+uaWngO/rE2UJi/r78wDidFHkVHWAdaiUeg+1Cgixf4C9T+Vt1AFmHdRqE/5ecOWfOZLa5lXvvthMr5znwSRRTgO5RISREjAMoI5dltdOUlNPmMIDYLmQF5tzqHTbSa1emapVYNMvm+uYG98cg9DONQruUUF+eQsvxoLc/diRdqsUT7OVu9b5VVjjwoCVq2/CqMOsgAC0GsSx0tCgnnDGV+W+YVwudbSyHpwJ8YozjhYNGMPDTfVjueyszKX4fzkup/iAe/G/35mm3dZ+kJIuaX1A/nW9bPsGePjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA1PR11MB7366.namprd11.prod.outlook.com (2603:10b6:208:422::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 00:23:00 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%3]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 00:23:00 +0000
Message-ID: <468b8d94-46d3-45d0-b62d-e1d5b7a99ca3@intel.com>
Date: Tue, 3 Feb 2026 16:22:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] drm/xe: Add a wrapper for SLPC set/unset params
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>
References: <20260128022320.1054591-1-vinay.belgaumkar@intel.com>
 <20260128022320.1054591-3-vinay.belgaumkar@intel.com>
 <fd704376-8dd5-46c2-8861-0c4586ad3fff@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <fd704376-8dd5-46c2-8861-0c4586ad3fff@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA1PR11MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9e322e-8759-4b98-9942-08de63838dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OC9hQVRQR2pvRlBVRTBSWmJIK3lVTm50c0RSRmFjRFZLV2hvUUo2MGgxZys3?=
 =?utf-8?B?UjNtbzAxNjV3NHFRVG9VOUJRajNtMHM4UWZIeE01UUhyQXpvblNDQXhtVlls?=
 =?utf-8?B?b0FFSzlwT0NaZjZoc0F2L3FhS3M5ZjE2WmkwYUlkWFJrSitxNmV0SExRSjFz?=
 =?utf-8?B?cGVZb0JBRUpjbG5vRzZkWDNXejlRM04ya1VrY0NLOTkvcTFRSkUwaUFnU1hh?=
 =?utf-8?B?R0lSS053MHpxZTlXZnlSaWUzN1U3VmtRbkorZFpsbUFydlgwTW5yTWRJaHJH?=
 =?utf-8?B?WUtFc29WTVNZa0dZMWY3ZWk0L1dOSnFMUnlmeEhjclJPSXZrOEtCSzdVVEFF?=
 =?utf-8?B?ejNCRnE0bnVBTXRmOW5MQXY4ZEVkRkFBSHk4bVZMRmNTNXlQSmVmWUdvVkJn?=
 =?utf-8?B?Q2NSaDNxZXpnTWF2WVZrcUcxeU9ZYTE4cG5BRlM4SXg4UTF1bG9XUVQxNWww?=
 =?utf-8?B?SmpvNWtQdlhNcnhmRHlxKzdWR3JMUDhaUXlwMVRiZ0dwWHpPY05YeWd0UFVE?=
 =?utf-8?B?RkNIYVZOYi9WQ3BMNE5ZajFBSWhQbkhnUitRYUhuTUhNM2doaFk3ODg5NlRR?=
 =?utf-8?B?MnpIcHhzenFXYWNOdGIzMHUrQXU1NzhqQmhHc3FjSldxUUY2OWFtN2t3TmtJ?=
 =?utf-8?B?N0lBZW9jR21NdkVPOUlJQVRyQ3hGUHE1RW5TSzY3ZUhtVlpidVpSYWxURDNP?=
 =?utf-8?B?dUg4bFg3UU5obnVSL0R1N1FPRDNzNE1JNmRFNDhYQ3RTRElUOXRHMzlxeE1K?=
 =?utf-8?B?WGVKSGt2blUyTEZUbWUyaUZKYlZEWmlsT0UrejR3WXI0TUJTOEU3VEJJUTJt?=
 =?utf-8?B?dzd2VkVWR1FCaGlYMkplSS9BNEdZNGo4UWdMNDN0M1B3Y3NnMytaM21TK2xF?=
 =?utf-8?B?bC9mVGpVWE56aGNYUjFCUWNvcWM4WUlidi83aUFTR1JCS3pxNkhLR1Y1T2Ex?=
 =?utf-8?B?bS9Rb3ZuYWVsRysrYmVSU3NqaW1qL3IxU1dFenlrVTdmanA3SWtVUnRST2dz?=
 =?utf-8?B?WXlKVDlmV3FKMWFpYUREb0YwcU9ZcXRVQ3lXVm9GaHNEWEF1Q2lrNGMxRnI0?=
 =?utf-8?B?UUtvUm1DWmpqdTFHMEJFWUFYY00wZnlMVyt0ODUyeEd6U1ExNEppWm9UWmc5?=
 =?utf-8?B?emtwdmIyUk5GLzY5VlZjZTJudWFBS1NsVGtCcUkzTkhSRytOZkFCWDA3Mysz?=
 =?utf-8?B?MzdXNU1ScTN1dll6QnplZ1hNd3B2dU8vaUorT3FNdFRidGtxQUFXWFVYcUN6?=
 =?utf-8?B?RTZENHlHUXlFL3ltU3EwMjNtQWJ0RmxwQmkxcFdOaWkzc2lIaE1GQ3RuM0lu?=
 =?utf-8?B?OVNjWW9FbWIwOTB4OHJaS1g1NEkyNkRCY0FaY0hyZzJCOVJMWHdhR1RxMk9v?=
 =?utf-8?B?MUFUSUR2K0pVZDNnMktiQk1leGZQK3BkVDNuNWlnY1p6UTMycE5EcUJzb2dx?=
 =?utf-8?B?WERtYmdSaTB6clovT0xOTGlycmIyaTQ0YVJscnY3RlhLOEx3SVZtU3NjdlpV?=
 =?utf-8?B?RHFBdmI3cWtuTURIOGVObVNsMGdrd29ZOXFxam9UVS82OUJoOTlOQ0NNcmg4?=
 =?utf-8?B?cFovYkZFU0RWVXh3Y2E1UFVDc01aTkhsTzFYWld0RDJwZm44Zmt1dUZZU1Er?=
 =?utf-8?B?eDNkVkRTb1NWTEY4TVRmL0hMaktHeU9hSnlnNGtRcHpqdWo4QzkrK2ZLNnBo?=
 =?utf-8?B?dWt5Mnd6NXEyektjZEJQcC9KblBvWkxCK09UUkRTNUpxVlVoOUovN1BaN2Yw?=
 =?utf-8?B?V3p6U09xZlVBa25jd0E5bVNHY3psdVdiMXhuWWpyQzhIQ1F6MUx3VEloZVo2?=
 =?utf-8?B?MUlaaFAzVmFkUVl3bjJsdVNOSVE5SnpBMzFxYXFsNjg3dkJUOUhjVW1EV3lw?=
 =?utf-8?B?TnhEMG4waGo3azEwb0RhVVdLT2psRGk3VlFhVmVUSEp6ZFNybXVjYVk2Y0pT?=
 =?utf-8?B?Q0tWREtCTFd1cnZqYVllOXJCTGgrL1Joc2VLM0k4UlZjNEhVZHJuallrRkhu?=
 =?utf-8?B?TDZyYzZ1SDg3cGI3VmNsTlovQm53VnNWeVI3RHpseGdWaFVJS0gxUnQ5bklU?=
 =?utf-8?B?bXo5aTJEYTVJU05DWUdsdWdCSjZwdjBQRUtyOGVQaEZsTUgyWGx3U3B2TG00?=
 =?utf-8?Q?B8Hg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1NHTDFPMVNQNW5ERmpyTFEwbWRuaW5DMS9EQlhsNytQd3ZQOVc3WEhtdE5y?=
 =?utf-8?B?VzVBT01OMUJLWGNTWGI3ME1DRGNuYmRaanBSaXlPaWxEaU0zRmxGbUNWeVh4?=
 =?utf-8?B?N1hrdUJLVU9vV3BCZmVaTmRodmxuWUNHUVh0ZkNNTXNxbVlLU0NsVWhldkNC?=
 =?utf-8?B?aHc2K3R4YU01SE1TZEptWkNkMkJoM1ZYR3RnVy9LTitpRWd2YXY3eUlOYWUz?=
 =?utf-8?B?Qmwxa21LNTE5UWtoRThXVzJmR0pHY1VXU29BNnRyTmx3ZldQdHh1MHpBM1RT?=
 =?utf-8?B?dklCTHgvR1orbmp6TitDZWRzSTlZcnBaY2VYQVN2RUxFNkh5ZmFjdlJFZTJi?=
 =?utf-8?B?NGxuM3BtUzdOemRSVFYrRlliOUxWWUNJbG5qUjJDNThTell1M0s5Y25ad0ZE?=
 =?utf-8?B?REtkc2VUQjJvUWxjejVOVmtrQ0lMd2pLOFlaZkg2VjZXL1RlRVhuenp0ZjJj?=
 =?utf-8?B?eTc5bVFBMEVuaFpOYzA4MGRIaDdXaGpTL1d3bVlQZVNiQkhybXBMcFFFUEZB?=
 =?utf-8?B?Z0gvaEtCSGVjMDFPaHZmM09SWHdxUi9kbXF4S1QyaHlFWVdpQmFZTEhmMjVo?=
 =?utf-8?B?MVAxMlFsdzFQVWR4NDJZYjFzVkZ4SWkrRjg0T3lxYTJsMUZIam9RT2lrQzB5?=
 =?utf-8?B?aFRnREhrRjVKK2pJWlNlTEVoWVpQMjBiKzZLdTU1WGd1ZkdjK0pjSHdNdlVk?=
 =?utf-8?B?M2dVdFZxMHhVQlhRWU9vc01Sc21ZVWdiV0xPYUl5dlU2a2FJR1FWK1B0cVRq?=
 =?utf-8?B?Y0ZKbHFTOUtGVGx4a0V0bW5GNlNYVHdoaklFMUxLdTRBNEdrSUYveTZyc1VF?=
 =?utf-8?B?M0NINW0yWXhhYVZWK0JaNzFEbE9CMmh0eFY3V21BcjdXV3pHSWxpcjJHNDhR?=
 =?utf-8?B?S3JheVc0REp1SHRCald0enZyaDZ6OGQ3RG1JakpMNVlybVhuU3phWXh6aWFo?=
 =?utf-8?B?aUNDRW1YNEFmWE0zZ0dwQ3A1R1dWcDB1ZGt5WFVtaFhlb1VDbkdFYndkVUwy?=
 =?utf-8?B?c0huYXRsbDBwRGRJekVuNkQwK0xxdW9vamMySjJJYkpYblVGYjQxRkdDMmVn?=
 =?utf-8?B?bXVoOXdtRlZFNjB2S0pkTXZIcVlpM0JYMjRDUWVjdDROK2tZbDJvMVpXcEtO?=
 =?utf-8?B?SDRET284UU1LR1JJV09CR01lNU5YS2gxSXdLbmR0aFFmeUVjUEJjVzhPZE9s?=
 =?utf-8?B?YTNuVVNjMDV1eCtTZEdYQjhyTmMvVUF0L1VDNUdoZjlORzVMYXdZcTdrRGxh?=
 =?utf-8?B?N0hRdURRaWR5Z2lKRDVSd0JMSmI0aW5rRkt3QXMvdnd4dzlMbmZRSHBOQm9V?=
 =?utf-8?B?Q3JEeUtGaG1QRlA1WmpUcmpjQnpicjIreVFodzBZTmRQQ1U4M1pvaTJ6bzQ2?=
 =?utf-8?B?QUtJNTlmaTZ3WXVGK0E2d2o2MTg2SEo4NUhhZHluWmF5ZW92QnNQU09MYnF6?=
 =?utf-8?B?ZzlEQ2FvbDJRZXpkaFBBb21TZnc5enVGVjJ6Ung1QjhwWWdsZkJKdVNJK3g2?=
 =?utf-8?B?Rm5LL01LUy9Yd1FScytxbitkS3hXT0ZpWTZjYk8zaW1rZjNoWHIzMXExYVI4?=
 =?utf-8?B?MEpURDBReWJhY3lyREdZdmZLb1lVL2JNR2NSQWNIcmgyM0xsMi90VTFSSnJo?=
 =?utf-8?B?WXp3WlltTlVvZ0VNRnZUUDlTOVpYOUE4UmNybzBYYjhSdFFnVVBIWllqRUVo?=
 =?utf-8?B?aTRoNWVWaHhZWU1pS3dGMFo2N3ZhcFFTbExvUEd1Q1hZMUZQL2M3K2lYSm01?=
 =?utf-8?B?VkQ4VWVlYXhRTHZJck5TK203WmJ0czltS1FyWEFMeWk4U1E2aStMNVNJWHFS?=
 =?utf-8?B?Qlk3dEhiSlB3T2RxcUVwNXJFV3dkV0dCellaZWkxZHJrWDk4ZWdUeFFSTGdj?=
 =?utf-8?B?aGplTUF0Q2pLZVByczU1T0VWWFNwTTJvYVArZmdpa295TTBCYmxXZktzTEYy?=
 =?utf-8?B?bmFVQXV5WldEYnNUOGIxaERaZ2cvUkY1TTYxd1UyaGlzUXFxZ0FEUFo4V2hF?=
 =?utf-8?B?elF3TjRMdU8wMWlXZjh3M1VTOStNcm9vdG5tWFpJbFJoendkZ0haSTJ6OEFP?=
 =?utf-8?B?NTlWdGY1SXAvUk1LV2ZZcGp5SlhvREE0ZmxUeHNIMUI4RlRxR21BQUtyUzI5?=
 =?utf-8?B?cEs4SzFoWmpOYkk5KytpeHh6MCtVVFU4cW5nRzlVc2d4QkgxVUZ5dERKQ3JK?=
 =?utf-8?B?a3hSdzZ6Mko0aWRSMTFHbXJDbjU2bnh2V3JtbHptUkFldWRUajk5N1VXRkhT?=
 =?utf-8?B?Rk1aQ3VlMFVtS2RwY3BlT0lNRjFMRklOSUx1TE5wMXFySW9kaHRyK0RhSGwz?=
 =?utf-8?B?UnVnVGRzNVlLdzBUS1VqWGlENW5HQjdpT2MzSm00a1VwWFE1c1NvbWxVMmhZ?=
 =?utf-8?Q?qLNSk+WhYuYY6BQE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9e322e-8759-4b98-9942-08de63838dbd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 00:23:00.5177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQizdOGyQrYLuGH60r+5FQjwaX7+nAIJyuPAIuN57W7P5akqcGUlwVuPlZ0jjtjPbqDtMYUC0JIykaWeqgqvPctO0ZRLAIt/q5nvLYwab3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7366
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


On 2/3/2026 8:47 AM, Michal Wajdeczko wrote:
>
> On 1/28/2026 3:23 AM, Vinay Belgaumkar wrote:
>> Also, extract out the GuC RC related set/unset param functions
>> into xe_guc_rc file. GuC still allows us to override GuC RC mode
>> using an SLPC H2G interface. Continue to use that interface, but
>> move the related code to the newly created xe_guc_rc file.
>>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> v2: xe_guc_rc functions to use guc pointer instead of gt (Michal W)
>> v3: Assert if runtime pm ref is not held (Michal W)
>> v4: Review comments (Riana)
>> v5: Use noresume instead of full resume, update title (Michal)
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 56 +++++++++++++++++++---------------
>>   drivers/gpu/drm/xe/xe_guc_pc.h |  5 ++-
>>   drivers/gpu/drm/xe/xe_guc_rc.c | 30 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_rc.h |  3 ++
>>   drivers/gpu/drm/xe/xe_oa.c     |  9 +++---
>>   5 files changed, 70 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 878eb273c3e6..21fe73ab4583 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -264,6 +264,37 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>>   	return ret;
>>   }
>>   
>> +/**
>> + * xe_guc_pc_action_set_param() - Set value of SLPC param
>> + * @pc: Xe_GuC_PC instance
>> + * @id: Param id
>> + * @value: Value to set
>> + *
>> + * This function can be used to set any SLPC param.
>> + *
>> + * Return: 0 on Success
>> + */
>> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>> +{
>> +	xe_device_assert_mem_access(pc_to_xe(pc));
>> +	return pc_action_set_param(pc, id, value);
>> +}
>> +
>> +/**
>> + * xe_guc_pc_action_unset_param() - Revert to default value
>> + * @pc: Xe_GuC_PC instance
>> + * @id: Param id
>> + *
>> + * This function can be used revert any SLPC param to its default value.
>> + *
>> + * Return: 0 on Success
>> + */
>> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>> +{
>> +	xe_device_assert_mem_access(pc_to_xe(pc));
>> +	return pc_action_unset_param(pc, id);
>> +}
>> +
>>   static u32 decode_freq(u32 raw)
>>   {
>>   	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
>> @@ -1045,31 +1076,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>   
>> -/**
>> - * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>> - * @pc: Xe_GuC_PC instance
>> - * @mode: new value of the mode.
>> - *
>> - * Return: 0 on success, negative error code on error
>> - */
>> -int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
>> -{
>> -	guard(xe_pm_runtime)(pc_to_xe(pc));
>> -	return pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
>> -}
>> -
>> -/**
>> - * xe_guc_pc_unset_gucrc_mode - unset GUCRC mode override
>> - * @pc: Xe_GuC_PC instance
>> - *
>> - * Return: 0 on success, negative error code on error
>> - */
>> -int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
>> -{
>> -	guard(xe_pm_runtime)(pc_to_xe(pc));
>> -	return pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
>> -}
>> -
>>   static void pc_init_pcode_freq(struct xe_guc_pc *pc)
>>   {
>>   	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 1b95873b262e..0678a4e787b3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -9,15 +9,14 @@
>>   #include <linux/types.h>
>>   
>>   struct xe_guc_pc;
>> -enum slpc_gucrc_mode;
>>   struct drm_printer;
>>   
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>> -int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>> -int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>>   void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
>> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value);
>> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id);
>>   
>>   u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>>   int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
>> index 55eeee7b1011..a20b20e3dab3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_rc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_gt_printk.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_ct.h"
>> +#include "xe_guc_pc.h"
>>   #include "xe_guc_rc.h"
>>   #include "xe_pm.h"
>>   
>> @@ -127,3 +128,32 @@ int xe_guc_rc_enable(struct xe_guc *guc)
>>   
>>   	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
>>   }
>> +
>> +/**
>> + * xe_guc_rc_set_mode() - set GUCRC mode
> nit:
> 	... - Set new GuC RC mode.
ok.
>
>> + * @guc: Xe GuC instance
>> + * @mode: new value of the mode.
>> + *
>> + * Function to set GuC RC mode to one of the enum values.
>> + *
>> + * Returns: 0 on success, negative error code on error
>> + */
>> +int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode)
> nit: maybe instead of exposing enum from the GuC ABI just provide explicitly named helper(s)?
>
> 	int xe_guc_rc_set_no_rc6_mode(guc);
> 	int xe_guc_rc_set_static_mode(guc);
> 	int xe_guc_rc_set_dynamic_mode(guc);
Can add this in a later patch. So far, setting this mode is only done by 
KMD, there is no debugfs/sysfs (yet) for this.
>
>
>> +{
>> +	guard(xe_pm_runtime_noresume)(guc_to_xe(guc));
>> +	return xe_guc_pc_action_set_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
>> +}
>> +
>> +/**
>> + * xe_guc_rc_unset_mode() - revert to default mode
>> + * @guc: Xe GuC instance
>> + *
>> + * Function to revert GuC RC mode to platform defaults.
>> + *
>> + * Returns: 0 on success, negative error code on error
>> + */
>> +int xe_guc_rc_unset_mode(struct xe_guc *guc)
>> +{
>> +	guard(xe_pm_runtime_noresume)(guc_to_xe(guc));
>> +	return xe_guc_pc_action_unset_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
>> index 35fabb82cb0e..36d41329dd0a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_rc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
>> @@ -7,9 +7,12 @@
>>   #define _XE_GUC_RC_H_
>>   
>>   struct xe_guc;
>> +enum slpc_gucrc_mode;
>>   
>>   int xe_guc_rc_init(struct xe_guc *guc);
>>   void xe_guc_rc_disable(struct xe_guc *guc);
>>   int xe_guc_rc_enable(struct xe_guc *guc);
>> +int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode);
>> +int xe_guc_rc_unset_mode(struct xe_guc *guc);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index abf87fe0b345..f7752719b74f 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -29,7 +29,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_printk.h"
>> -#include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_macros.h"
>>   #include "xe_mmio.h"
>>   #include "xe_oa.h"
>> @@ -875,7 +875,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>>   
>>   	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
>>   	if (stream->override_gucrc)
>> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
>> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
>>   
>>   	xe_oa_free_configs(stream);
>>   	xe_file_put(stream->xef);
>> @@ -1765,8 +1765,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>>   	 * state. Prevent this by overriding GUCRC mode.
>>   	 */
>>   	if (XE_GT_WA(stream->gt, 1509372804)) {
>> -		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
>> -						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>> +		ret = xe_guc_rc_set_mode(&gt->uc.guc, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>>   		if (ret)
>>   			goto err_free_configs;
>>   
>> @@ -1824,7 +1823,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>>   	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>>   	xe_pm_runtime_put(stream->oa->xe);
>>   	if (stream->override_gucrc)
>> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
>> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
> nit: it looks that all callers of the unset_mode() always use only WARN,
> there is true error handling, so maybe this WARN should be moved to unset_mode()
Will modify this in a later patch.
>
> nit2: is there any solid reason why these 'unset' in OA are called _after_ RPM and FW are put?
We don't need fwake anyways for H2G messages, but might be a good idea 
to call unset before the runtime put. Will address this separately.
>
>>   err_free_configs:
>>   	xe_oa_free_configs(stream);
>>   exit:
> just nits, so
>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Thanks,

Vinay.

>
