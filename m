Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C33F433C7
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 04:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F265C10E72B;
	Thu, 16 Apr 2026 04:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLht23dP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5715910E176
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 04:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776314905; x=1807850905;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W2+WzGlZnQgGeQ66BpYLjbIMpdZln7GZQ8z7uUoBLhU=;
 b=jLht23dPq5xgXaJIAtbepV5+OYOAPQiaAAKkpG/xE7QCfiG6SiSpu597
 lbKVN7peHpYzHXILLEbMQQfbaGrOVwOUSt2KkosnhnOdASwqlpZHrLoa8
 kuqfS9KJSCjY+NUJtzj4qsG6v4MfZl0NEfJqH+7g6IUh1Ei2cLkglIhb1
 xi9gp8Pk7crRUSyG/75FwdCcuxhDpSr1LvzjaCaAkB0Qcne7DmXVbukbY
 oxEeugwLcQS2w8IM/XlS5tVRuSS00up1huvOKwbrMF+ejsHpQXgEOdq0a
 DSjX2r1FCRud1L2Q4jALmuhaYJM23uexRtaS1JQqMs94DqUBQfbD3ihqs A==;
X-CSE-ConnectionGUID: I0DZCMrTSv60zPh38SAlQA==
X-CSE-MsgGUID: 7AW1PO/YThi5Wk6jJM9Fbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77279017"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77279017"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 21:48:25 -0700
X-CSE-ConnectionGUID: KStvrMYJRZa9lMRUpBaGjw==
X-CSE-MsgGUID: S57fW+jWTRuCczxTVAEl6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="229597883"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 21:48:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 21:48:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 21:48:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 21:48:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0vO09K9kTh2GoJp9SEblUnEfSJ8lG0F475vAdw3n7hufhxuqGyrs4IQp2AFy5fZTMs0cHQ2OcwgAsU9DAGhClkiJ9jyMjaXXNKVXVFU8ybbG4p4e3MIlQWtI5fHgs4TaaappBGuyLehIilTV6dtglVJUIBvY1PiG9EIAefl1gCZ9Z0x2h3a554GcGAjjXpPGM7baqbnEGA9LHWUaUXZbLANFbIUZGDfgnBLFjwKRXkfiIBcpesv+IugxqgVCm7xmmaKwmnTNSoCwelcn0waM9bpqkrciLP+2L4fXCOKp3Oksu0URVwSC8pTAhGFpBPFRLPzVvQfgqmNLck1AtZLQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyeUsjWZxnGSJi9F3PDzmeiiRKhKup6ssrJPiY+iZJk=;
 b=PTLUUrYnMd3RCb000NWjGBF2hsQq5l8/q9+F5EJmv3E89m7HzeV1s0KbRKOxqZM4hjjtSUQnM67aDhLruscD2gwWbvoKpc/2DcsDz24cz1a1pajgp5Tn35EPWj+aiDY2OT8h3Sd2qHHeO4bIZUGvv0w3bG9bVehV/f1KyntX/9Wk3HR3PdVuJ7QiBgW/cnJI3cYVPbzxGwDUuWrrU3KD/7T3pUVQKHlW8WjgozgWbmvE9kA6UhD6+fFmmdFDbDsiD2ADbDlxr6onSGNA+3OFkbWeh2iGogZcZCaqEwTlTvbZa7tI4ZukrKnjiHHkoVJ7RAYORfc5rcmj06kWF6yEkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8751.namprd11.prod.outlook.com (2603:10b6:610:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 04:48:16 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 04:48:16 +0000
Message-ID: <a4946e09-bdde-4a9b-b9e0-d494698a3469@intel.com>
Date: Thu, 16 Apr 2026 10:18:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <soham.purkait@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
 <20260402070131.1603828-14-riana.tauro@intel.com>
 <adSNMapnJqvfswlJ@gsse-cloud1.jf.intel.com>
 <4b50d8d0-a7fe-47b2-a8c6-5e9b920aac09@intel.com>
 <c36cdb7a-b8ad-496c-bf1c-61ec15c5ac29@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <c36cdb7a-b8ad-496c-bf1c-61ec15c5ac29@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 3756a1fb-4056-4786-c860-08de9b735f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: JA5ciw0VDtlrFH34CWFGIMkh6V+MY3lDEx16QJeaiNTnjTX8b9w/p06H6a9EOj0fay4145qYRQ1BLd0Z9VhCYEGKjQxGuEiZwWoBGKAl0NCWIw+IDlzLZM3pTMsTtyoywfw2FOZOdpuJ8ctPdBtAs213YzKs9sFi6SjUZoDLaoEFIM7u3VSINfpcHOyZzrPI9hg7oT7brLiaPwmGun9law/krPliMn9p8xv5bm9w9OmtnvdS6YT5Zv9I10nsK7I0mhYC/JVcODkmvzOzNDhwRow6vTzzEWxncLj1Hl5WyrY+2XvEdA/BF22AuqrVZ+Q6wS/OCPeRndgx+hpPguXYBTvB0S0yaiVYWbhApluX1O9f2frM/YqJ7vzm0R4g33sENTWxHZY3gEM2rBlUK60wj2zHBXi9jUj0rmY/vPFO3McRLD+SWKkGeBQp24NKb4sRPa+mozhZWf6urit2K/uv6kO1E29oyw202LblEgxLp20hhw5pE5XZes2xeEviT17F+Pxf0Rc+qH688UtxBKgpXDuMyp+0f7/ZRc2gFNoKfuMgb8qitY0ufFZsLbk8zCuxOLc1ar8ifGOn20SbJMHngW3q1fCxlxW2hUCqoaR+3yBrZ5dFQnfsqGWAgGLgPXEP6RPRjUyNczOwWloviyAbSeHj6y8d9PH7evlUbh4Hhqq6m1XLfTnrvMqOaqxHCZhW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG5GcjFRMFZicmw2RzF6WEJLMnd0WUVBdlRhQjlTK2lFSE1rdG44empuWTlS?=
 =?utf-8?B?cXFXenVWUmdPTnM1d3UvSWFsWThmNXZXSVlYK2JmMDd1ZGgwZ1VwV00vZnBu?=
 =?utf-8?B?R1kvV0tIQU03S3k4WnJDdGVKZnZNTll2bzZTbmhSKytKVnlHV1lJUlF1WFlk?=
 =?utf-8?B?SVdQK0pNb25TUWZPV0FBd1RNSWY1d2N2VTFHRlVrTldrMU5WaFpRM2luSjZL?=
 =?utf-8?B?OXZjR3I2UjljbXFjaWZzWGUralNZNXFHemk1QUxwZFAzTWZXeW0wL2dLMUUw?=
 =?utf-8?B?RWk4SVBLR3ZFcEhSRGZMcEhPNkg4N2Evbkp4RHZ1TXZnN2ppWENJU1NnNWhm?=
 =?utf-8?B?REY2MUFHREVlZUtDQTZuanNIcnEwRFpKSjI1cWh4YkpYd3dDNlkwdmh1eE9K?=
 =?utf-8?B?dkRZMFkyanJDNlQ3OGYvZWswT0wxcHM2dzV4Qm9HVmk1ZXVUWVZheGkyVU9i?=
 =?utf-8?B?bTRBQlVPQTR2TUpsTXkvQWxPOVpVYkk3M0dwV3h1ZHhLUmthVnBHUmxaREE4?=
 =?utf-8?B?R3lPWWt0bW52dWtINDRzNlFpMVJlbERTbmlseGRaWlU4d1ozZE54U2ZxTWxH?=
 =?utf-8?B?NmovV1JEY01WM1l4U3BrdG5MOGdvWXhBaks0MUdwc2JjemZraStlU3crQWhQ?=
 =?utf-8?B?RmNlNDgvVUJrMG1jSlVuRVlCdHlNVHYya0xKM3grL1RuNHlOVXlIZzdrQ3ph?=
 =?utf-8?B?bkd0ZS95UFVOVzRiV2EwUWd0S25VQS9EeElTSFRJKzhDbkVscHE2RkZsYkpz?=
 =?utf-8?B?OER0eHJ5bm9hbTBmNm1WbkFDNUxHQ3A1SHJhSlBhbjhSTUl5Vm9EeVlBRkdV?=
 =?utf-8?B?dmp5Vk51bTI4S1BMRnNLNWtKdW1ObFcyYktNbm1ReHNKRC9mZ3kzOHNlQTN0?=
 =?utf-8?B?TEVkVmQzYjRabnZiMmlBZEx6VWpaL2I3eWhTWFVTcVlMcTlKK3pRTzdxZkgw?=
 =?utf-8?B?SjBDeUswdmlQOWYzRjdET05LN05FbEdaNUh0THp2NUJNZDZrTTF6akwwZEIr?=
 =?utf-8?B?OTlHY3JwaWdTTUNwMzBwK3c5V0F0ejJNajltbEpjTTBkbHVscyt5QXUrYkxw?=
 =?utf-8?B?KzB2eHBWdFp4S1U5Z3hNaGJ6M2dZOG05QVRVQkN2MTNrN050VXhxL3BCSzEy?=
 =?utf-8?B?aW9pbDJSdnZrSFNTSy9vcXVOMm9xcHZzNmsza3c4SnV1Z0RldllCT0VLUmYz?=
 =?utf-8?B?R1hPdE9kS1RGNldIbllSMitadTdhOTNZbVhEVCsvWEN2L3JiWGE0OGRjSUlp?=
 =?utf-8?B?UU5WM3VLb2FBK1M1SUN1T2pTQlgzNndSOEFKSlJVZlpxUFNEamNTL3NCWW1s?=
 =?utf-8?B?Qkt3bFRlSWdRemlIVWZOdzhkVWRMTmZUaVVleVZ4VmxIc3F6eUFtdkNLRVhN?=
 =?utf-8?B?YUlXN1NFNGFJcEpjUnkva0FKaFZMT0Zkck9vMkhuVnpFdmc4c21Dd1ZvN3Yz?=
 =?utf-8?B?MHZkd3BYS2pjUG9oUmRHTm1QSGl5dGU5alNuMG5CdEpXeHJQUG9tejltMVpR?=
 =?utf-8?B?VFFQQ2NWNU5TTVpoVGd0WER5djhlSUZDSm50OFhkK00wbmZDZ0grd1FtMG9I?=
 =?utf-8?B?Qm11ZGh3cnVFclp1aU9VYksxWmQrTUl6SDZscGFKZUZvSFN0SjZFQi8yaTYv?=
 =?utf-8?B?bFozczQyczFIaldVNWxZdWZNL2hFdGgwWEswcDYxRUNwZTFubmxWeWVRTmww?=
 =?utf-8?B?Yzk0T214MnlSa216QWxkY3V4M3Bpd3IrRy9Dd1U4ZmlibXd3N0dhNU44aHp3?=
 =?utf-8?B?ODJXbFlxeEFyY01MVHJ1Tk5qaGJQU09PMkNFRW1IT21jRk5zQy9IYzdQemdC?=
 =?utf-8?B?QzhkWnhSNHk0WWtZREJjV2xhQzgzMndzeE94akU2djN4NDJUQWpnRlp5RUN1?=
 =?utf-8?B?bnczell6d2kydzNBME9RM29FeXNlVXhHMTBWQzNFZVU2bS9QNlZnelFWcExx?=
 =?utf-8?B?eFpuOEVEbWlaTVF3M0E2NStTcm9IbGlVVnVLcDloZlprRTBIL0pURFdtM2dO?=
 =?utf-8?B?Vk41aHc1dW4yZERiYTZtQWNjVTBJRDJjclNyYjJZalc4Tm1lanJFVlNDQVo2?=
 =?utf-8?B?WXpWZmo5bWwrVHltb0l1N1RHZDZRYXpJVzU3VmtlRkFKZTNhUEhmZERxdHlr?=
 =?utf-8?B?WHNvQmVaVnRxY1JIMjY3QjNnZ2lIWnlZb2tCVWxMZXFrTnJ6UTRJdHlBc0kx?=
 =?utf-8?B?c0RGQUJjU1Q0K1NjV1pLKzNVeUF0WnZzME5DOGJFSEV6NTNPUzU4MXlURVN3?=
 =?utf-8?B?aFB0bTVqQk1lakVldDF1ZTh3a2IvN3RTV2NLdlc3aTFoYVFKWUE3RU4vTFM4?=
 =?utf-8?B?QUFaa210aUg2aXM2aThXUnYxV2lVUUlIQ3JKZFJGTFdlelJneWdSZz09?=
X-Exchange-RoutingPolicyChecked: rXAPZIevSE+SzbDQMinpSMzpgDsOR8cVOdGXIfQxiHCf6Y282Mm0sEQNrAhgE0L6jZKxsUkm1p5Kx+POqQLQ8mA6wrhoZZAQm9m+8W00e2AsYm+UG8aOrijat3xvhvx6K4diWVMf/iTn8wQJwMOy9L5Uoj4mjeWzHVia8GrJa3drzVBSzyvzvO0tNJxpmDQhCAeFO39fSwL/bXK4Mf0FC2SD2t9jcUiVsn9CUM6yKTl/aLFkmwmwZpJ5uZov2vPUbzRheRJD9KZ6XtWyalD7isxRUDwrmSYOiJ/+eDieYG+HZ+U4lGjHsjuC74I9qfLX3Awu1uacSSR6dz15bo77Ow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3756a1fb-4056-4786-c860-08de9b735f8c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 04:48:16.4167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T92gc5asR1/XMbrSSYGKicjpJ0bmnfslVIqwafuKJoFAe7RhVuo5yCmOQ6+ELmEyT+XLIjS5ZNFU0mIXLmL+wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8751
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


On 4/14/2026 6:59 PM, Mallesh, Koujalagi wrote:
>
> On 13-04-2026 02:30 pm, Tauro, Riana wrote:
>>
>> On 4/7/2026 10:20 AM, Matthew Brost wrote:
>>> On Thu, Apr 02, 2026 at 12:31:33PM +0530, Riana Tauro wrote:
>>>> Add error_detected, mmio_enabled, slot_reset and resume
>>>> recovery callbacks to handle PCIe Advanced Error Reporting
>>>> (AER) errors.
>>>>
>>>> For fatal errors, the device is wedged and becomes
>>>> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
>>>> error_detected to request a Secondary Bus Reset (SBR).
>>>>
>>>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>>>> error_detected to trigger the mmio_enabled callback. In this callback,
>>>> the device is queried to determine the error cause and attempt
>>>> recovery based on the error type.
>>>>
>>>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>>>> cleanly removes and reprobe the device to restore functionality.
>>>>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>> v2: re-order linux headers
>>>>      reword error messages
>>>>      do not clear in_recovery after remove
>>>>      return PCI_ERS_RESULT_DISCONNECT if probe fails (Michal)
>>>>      only wedge device do not send uevent (Raag)
>>>>      set recovery flag in error_detected and clear on resume
>>>>      add default switch case (Mallesh)
>>>>
>>>> v3: do not set in_recovery for disconnect (Mallesh)
>>>>      return if already wedged or in survivability mode
>>>> ---
>>>>   drivers/gpu/drm/xe/Makefile          |   1 +
>>>>   drivers/gpu/drm/xe/xe_device.h       |  15 ++++
>>>>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>>>>   drivers/gpu/drm/xe/xe_pci.c          |   3 +
>>>>   drivers/gpu/drm/xe/xe_pci_error.c    | 104 
>>>> +++++++++++++++++++++++++++
>>>>   5 files changed, 126 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index 9dacb0579a7d..7f03f06df186 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -100,6 +100,7 @@ xe-y += xe_bb.o \
>>>>       xe_page_reclaim.o \
>>>>       xe_pat.o \
>>>>       xe_pci.o \
>>>> +    xe_pci_error.o \
>>>>       xe_pci_rebar.o \
>>>>       xe_pcode.o \
>>>>       xe_pm.o \
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.h 
>>>> b/drivers/gpu/drm/xe/xe_device.h
>>>> index e4b9de8d8e95..60db2492cb92 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>>> @@ -43,6 +43,21 @@ static inline struct xe_device 
>>>> *ttm_to_xe_device(struct ttm_device *ttm)
>>>>       return container_of(ttm, struct xe_device, ttm);
>>>>   }
>>>>   +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
>>>> +{
>>>> +    return atomic_read(&xe->in_recovery);
>>>> +}
>>>> +
>>>> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
>>>> +{
>>>> +    atomic_set(&xe->in_recovery, 1);
>>>> +}
>>>> +
>>>> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
>>>> +{
>>>> +     atomic_set(&xe->in_recovery, 0);
> nit: Remove white space
>>>> +}
>>>> +
>>>>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>>>>                      const struct pci_device_id *ent);
>>>>   int xe_device_probe_early(struct xe_device *xe);
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index 150c76b2acaf..c9fe86b670bd 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -494,6 +494,9 @@ struct xe_device {
>>>>           bool inconsistent_reset;
>>>>       } wedged;
>>>>   +    /** @in_recovery: Indicates if device is in recovery */
>>>> +    atomic_t in_recovery;
>>>> +
>>>>       /** @bo_device: Struct to control async free of BOs */
>>>>       struct xe_bo_dev {
>>>>           /** @bo_device.async_free: Free worker */
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>> index 1df3f08e2e1c..30d71795dd2e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -1323,6 +1323,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>>>>   };
>>>>   #endif
>>>>   +extern const struct pci_error_handlers xe_pci_error_handlers;
>>>> +
>>>>   static struct pci_driver xe_pci_driver = {
>>>>       .name = DRIVER_NAME,
>>>>       .id_table = pciidlist,
>>>> @@ -1330,6 +1332,7 @@ static struct pci_driver xe_pci_driver = {
>>>>       .remove = xe_pci_remove,
>>>>       .shutdown = xe_pci_shutdown,
>>>>       .sriov_configure = xe_pci_sriov_configure,
>>>> +    .err_handler = &xe_pci_error_handlers,
>>>>   #ifdef CONFIG_PM_SLEEP
>>>>       .driver.pm = &xe_pm_ops,
>>>>   #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c 
>>>> b/drivers/gpu/drm/xe/xe_pci_error.c
>>>> new file mode 100644
>>>> index 000000000000..cd9f39010278
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>>>> @@ -0,0 +1,104 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2026 Intel Corporation
>>>> + */
>>>> +#include <linux/pci.h>
>>>> +
>>>> +#include <drm/drm_drv.h>
>>>> +
>>>> +#include "xe_device.h"
>>>> +#include "xe_gt.h"
>>>> +#include "xe_pci.h"
>>>> +#include "xe_survivability_mode.h"
>>>> +#include "xe_uc.h"
>>>> +
>>>> +static void xe_pci_error_handling(struct pci_dev *pdev)
>>>> +{
>>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> +    struct xe_gt *gt;
>>>> +    u8 id;
>>>> +
>>>> +    /* Return if device is wedged or in survivability mode */
>>>> +    if (xe_survivability_mode_is_boot_enabled(xe) || 
>>>> xe_device_wedged(xe))
>>>> +        return;
>>>> +
>>>> +    /* Wedge the device to prevent userspace access but don't send 
>>>> the event yet */
>>>> +    atomic_set(&xe->wedged.flag, 1);
>>> We can't blindly set '&xe->wedged.flag, 1' as this is tied to a PM ref
>>> [1], [2]. The existing sematic might be wrong but we to normalize
>>> adjustmets to the '&xe->wedged.flag' field with uniform rules, or the
>>> cases when we wedge we also take a PM ref
>>>
>>
>> If the device was already wedged from xe_device_declare_wedged, this 
>> function returns.
>> And the ref is released in fini.
>>
>> PM ref was added to prevent runtime suspend during wedging. But in 
>> case of error_callbacks
>> this is already taken by PCI core drivers/pci/pcie/err.c
>>
>> pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL);
>>
>> I will add a comment here.
>>
>> Thanks
>> Riana
>>
>>>   Matt
>>>
>>> [1] https://patchwork.freedesktop.org/patch/714622/?series=163948&rev=1
>>> [2] 
>>> https://patchwork.freedesktop.org/patch/715028/?series=162055&rev=4#comment_1315905
>>>
>>>> +
>>>> +    for_each_gt(gt, xe, id)
>>>> +        xe_gt_declare_wedged(gt);
>>>> +
>>>> +    pci_disable_device(pdev);
>>>> +}
>>>> +
>>>> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev 
>>>> *pdev, pci_channel_state_t state)
>>>> +{
>>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> +
>>>> +    dev_err(&pdev->dev, "Xe Pci error recovery: error detected 
>>>> state %d\n", state);
>>>> +
>>>> +    if (state == pci_channel_io_perm_failure)
>>>> +        return PCI_ERS_RESULT_DISCONNECT;
>>>> +
>>>> +    xe_device_set_in_recovery(xe);
>>>> +
>>>> +    switch (state) {
>>>> +    case pci_channel_io_normal:
>>>> +        return PCI_ERS_RESULT_CAN_RECOVER;
>>>> +    case pci_channel_io_frozen:
>>>> +        xe_pci_error_handling(pdev);
>>>> +        return PCI_ERS_RESULT_NEED_RESET;
>>>> +    default:
>>>> +        dev_err(&pdev->dev, "Unknown state %d\n", state);
>>>> +        return PCI_ERS_RESULT_NEED_RESET;
>>>> +    }
>>>> +}
>>>> +
>>>> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev 
>>>> *pdev)
>>>> +{
>>>> +    dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
>>>> +
>>>> +    return PCI_ERS_RESULT_NEED_RESET;
>>>> +}
>>>> +
>>>> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>>>> +{
>>>> +    const struct pci_device_id *ent = 
>>>> pci_match_id(pdev->driver->id_table, pdev);
>>>> +
>>>> +    dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
>>>> +
>>>> +    pci_restore_state(pdev);
>
> Is pci_restore_state() needed here? before invoking slot_reset, the 
> PCI core already calls

I have already responded to this in v1. [2/8] drm/xe/xe_pci_error: 
Implement PCI error recovery callbacks - Patchwork 
<https://patchwork.freedesktop.org/patch/700296/?series=160482&rev=1>.

We have seen issues if we don't restore it after SBR. Maybe i missed 
something.
Can you please point to the line of code? I don't see it in 
report_slot_reset or aer_root_reset.

err.c - drivers/pci/pcie/err.c - Linux source code v7.0 - Bootlin Elixir 
Cross Referencer

<https://elixir.bootlin.com/linux/v7.0/source/drivers/pci/pcie/err.c#L148>Thanks
Riana

>
> pci_restore_state() right.
>
> Thanks,
>
> -/Mallesh
>
>>>> +
>>>> +    if (pci_enable_device(pdev)) {
>>>> +        dev_err(&pdev->dev,
>>>> +            "Cannot re-enable PCI device after reset\n");
>>>> +        return PCI_ERS_RESULT_DISCONNECT;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * Secondary Bus Reset wipes out all device memory
>>>> +     * requiring XE KMD to perform a device removal and reprobe.
>>>> +     */
>>>> +    pdev->driver->remove(pdev);
>>>> +
>>>> +    if (!pdev->driver->probe(pdev, ent))
>>>> +        return PCI_ERS_RESULT_RECOVERED;
>>>> +
>>>> +    return PCI_ERS_RESULT_DISCONNECT;
>>>> +}
>>>> +
>>>> +static void xe_pci_error_resume(struct pci_dev *pdev)
>>>> +{
>>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> +
>>>> +    dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
>>>> +
>>>> +    xe_device_clear_in_recovery(xe);
>>>> +}
>>>> +
>>>> +const struct pci_error_handlers xe_pci_error_handlers = {
>>>> +    .error_detected    = xe_pci_error_detected,
>>>> +    .mmio_enabled    = xe_pci_error_mmio_enabled,
>>>> +    .slot_reset    = xe_pci_error_slot_reset,
>>>> +    .resume        = xe_pci_error_resume,
>>>> +};
>>>> -- 
>>>> 2.47.1
>>>>
