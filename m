Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7849ACD6E4A
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 05:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DEC112662;
	Thu,  4 Jun 2026 05:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IlA8lpHZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BD7112662
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 05:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780551564; x=1812087564;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zY16NLtLASqAAFobqa2U8s2Uxgsxd2XQ83AN5vaipgw=;
 b=IlA8lpHZh75TTo9wC5/u2eSdETt0C+zUt6peEfAm4KKC5TDOVD+OdlOB
 YSeIQTHisAum+IBijDKsM5xMMBVAcaR4vlfQf1UJvB+S95/gEPjdjgVtj
 qg0HWTH6EuSyJrWVps/1y1tMXB9hIMiyfeygJ2zmOTQLdmXlVos+AkT+Z
 t4hefEee6UdDzdTiV/BvWjCEy0oDOs3kCjTor66r/OPUofY8bxih4Rhgo
 2dZHzCUbCuty+OF6JeiIr2iGL6GfDRtGAiakTlTK6alu8bMXmnge/EH++
 dD9g/86tRE1yJgiwbt+iBKvgX4tmJDg7xHQvz58iR9wxTOUStQl7e0TuQ Q==;
X-CSE-ConnectionGUID: UU/OlV2uT52zPggMa6zmEw==
X-CSE-MsgGUID: JKZhFR0qSP+vj+m8oN9mOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="68909296"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="68909296"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 22:38:55 -0700
X-CSE-ConnectionGUID: HpU+eJzZS0C9zj9XCtCltA==
X-CSE-MsgGUID: MaN1FZAVSzaRyp00Oe9+pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="243377922"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 22:38:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 22:38:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 22:38:50 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 22:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqemER7WvEuOPVBlHIesk7esZxHamnA+dbc1s4WR0+gBaydppq76ChYbZx1XoXiIAZxgQ47jvmNnNR+9Sj949xcstFa+X08ZPQZ6B8rD8/6R6jpSMiOYWwpp8/ejMbznp5hSIXwmBR7CFpmSOHPABeMAMmlNEUkBDWX2geNAErccLqawVWAFVJVKMMpqPzHej2XZZDMKhvG/2oeAuZq0GlhtrrtI6jXqxnIKX7l/2aLy1G0fucYoRGSMeUrAHJf/FTqLrc9BOdvXOsLkl1GB9U4DcLepzakpsWYQK6EX7YQm5r1uoZKFGp9sX03xfK38GqDDjiqFV/RafytEOFVAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UN9COxz2CP4D95SWFOViWxeOt/aU5f7a6Fih3+YUufU=;
 b=YfFS3IePkcOmeHTBW/nTgcM+APpTj2712ziPDBTV64OuThYWgt95sgfJ4xHSRGNe3kWYGvHChwP0OMyuPPwp6wddBs5IuZ0mKJEaRE4MLdhMs52iqMhPnu86i9/6HcDIUvaepxxXRn7ReMm1F6ua6neYz7UyRsOTNi2uo4mpoJaEGBC9Ns6HAfG9jaTK4Jmih3Q89szy3RjqCfhYTTnz1/TKWynQ8ZUcmtTzdgqopJuM3il30tqran/6e8LYqC7PvmKx1Y8xSSPrj08Vfx6eWkTw4TZrqd1w7YHiyAfq3PsVOYSpbPgXUnZ2dqS1LqOJC/UM0+dxuNlMBkbD6Txffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CO1PR11MB5187.namprd11.prod.outlook.com (2603:10b6:303:94::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 05:38:47 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 05:38:46 +0000
Message-ID: <a5c8de9c-41e8-4f63-bad5-5dd93ab56d97@intel.com>
Date: Thu, 4 Jun 2026 11:08:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 3/7] drm/xe/svm: Clear CPU_AUTORESET_ACTIVE on first GPU
 fault
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
 <20260406085830.1118431-4-arvind.yadav@intel.com>
 <afLaCi80ZDcEFKB+@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <afLaCi80ZDcEFKB+@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::22) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CO1PR11MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a9b85b-06f0-4249-bdfb-08dec1fb8bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rqeL12ASa/WZCmO336bUcNoMs0MZXtPU7j9KDF/tg5bk3ekorUM0DKT59ypsS9s6gttcULIE0Fugt+L/aQHoVSWY1RbklK+ZCg9byOPkUAGSYlQ9T1QTd3D/yrjLoG3VSuJ2hpahBvJbZiq/ZIkdIGrdqC6RZxa9vhU/lqOzfmpa+Vzv1HE/nXNtRaDQ2Y9nHTGt5j7WBPyFaXal8gTkrtu3/7oYWM4TfRtDdKuV10vR2qo92MhlbirXaQR4yNJ2kTXE3T4LAw1lDmAEj8nX5MzaNu8mI7XEs1WiHs47XJurSblT6KPKGtsd1P4V42x9xYLUU4rz7YEZuEVgNDa0UrOVcTL//xIOERQiaqjRbC2bhUVNjdUIc95JV2Sr4XFeFqmomXARL7Z1F5ZbghmL9kPtWteQd0kf2yprv7rQSXD53zYzS1hJwHdxzZAQ33OSWut82TMexc3WxYweiZWGEiWiESNZImJyrzJt0Qj5Z1jxejOGLf/5LchmOylHxTy85eHaMAnwZjJViKpBJmtowIDwdwDwc7ShkSR+OcA3tHbwVRb4L7dmBpsvvEJdWMMy5l3ZzLh4ygNArEUCnT6Y9KC0RhrNCM0SK0eu/hr2h739EAjwllQKgCBAw9jaItc8ARfJccqCpRV0ZjfCGYpVaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(6133799003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmN0Q2hjZ1dOM1ljOGdCalhQVEREMVdENU04ZDZTNlBvYjNpS1hSUkFvUDEw?=
 =?utf-8?B?dEk5OFIwbDNDeENqc2NUei9mbkljZXJQT0xvZVpuNHJGSGtMSlV6RzFaVXBX?=
 =?utf-8?B?S2dqUStzYkZiZGxud0NwcEhnL0VkZy9ldUJyb3NjOS9GMFQyZ3oybDZzTTcr?=
 =?utf-8?B?Wnk3c0g1N0tRdUZaWEpjZU1ERXlpY243b3NQU0VqV1MzNUZ1R1ZVUS8rL1ZZ?=
 =?utf-8?B?ZkpWUlFUcm1zcVlhNVNJZlhpZ2VxZ2phMk9MQ0VtTE5qbVByYkhyaldxbEh0?=
 =?utf-8?B?L1BEZzh2eU5INDVFdGQ5SXYybnpyOVF0TllwbXBEOWFkcDRCb2pjQ3JhR3d5?=
 =?utf-8?B?YXVzZVpEei8zalp3TnZiODRleTRHSi9lRis1bEpIYzkxT1hGd2hoRzJoNG1u?=
 =?utf-8?B?TGdWNTFrOGNNZE96OTc2ay96MU1LZ21pNHNHMkRHZ3kxcnN1dmdPaElJakRG?=
 =?utf-8?B?c1E0MFJhd2JLUFhlOTFCS3ZGTWVBV1Zqd3JjR1dROFQrOFdmU0Y3OXlibW9Q?=
 =?utf-8?B?TXU1K2FLUWlmYUs1NUN0MFNpMWN1V3JRUVZsUUt0eTBUYnpYYnJSeDZqbTBZ?=
 =?utf-8?B?Qnp5bytsb2o0NThjMXIzRTlYOVQ3cGZZSkZvZ3JtTDdkenZFV0NUZkxCa0hq?=
 =?utf-8?B?R3E2dFhhM2pCYUtDc1pjMlJQSlhWQUlHNWlVcnNvQU9TM04zS3I2MFdmYnU3?=
 =?utf-8?B?amw3SWhVNDFJWWFBTVdRSlYwTkV6UEdtT2xNMkk1WjQ4aWluVjJTWnlNeFhj?=
 =?utf-8?B?SC9QYVRBYVhuVjNmcWpOWkpSZ0ttMDJBenZ0MzF3RTVjd0lHaGVUQ1E3clBv?=
 =?utf-8?B?WDFNV1dXb016dVRxVkxGZXFjRDVtQkc2eHJlbkdBdU1ocEZmUHBWSjhHRCt0?=
 =?utf-8?B?ZXlNSktRSEVtQ2p3RzhWZDZsUTlQQUViRWc5djhxRXF1Qm9xcWdHaXVvQUJm?=
 =?utf-8?B?bnliUG55am55azYrR1VUNmdvYkVFYWM3ZGdXRW5Jbzl0VUtUWWxlZ2E0WTNz?=
 =?utf-8?B?azZzeXpFZG5VZjFuaWtCYitKUW1NMzRTeUhYalpyZnJUNXQ0RStCY1Q2V3Zu?=
 =?utf-8?B?R1hEODlOTjRnODlRZS84SWo1T3puWHpzVzFwbGVBWHB3QVlhR3llY0ZFcG1m?=
 =?utf-8?B?dUdVclA4ODQxZjFmYkI4VkpXN01YL3RYZDY3RDI2c0VaMm1yd2N3Vit1ZHZp?=
 =?utf-8?B?MEo0U0tVUFVGK1NvMFNHMFMwVW1CWWh2OUM2K0pzWmw0aGczL2RlVkpTcWRP?=
 =?utf-8?B?eE9nckZkZExpWFVZUmoyZDNhcmoxNlhHNk1IanAwZ2xQM3d2WDMvbkY3eDZy?=
 =?utf-8?B?Vk9zVkxXRVMzQTYveXhWNXE1ZzRDTjZRUHZRUTdJSVVDaVVRMEUzcFJ4ZHJv?=
 =?utf-8?B?eVVtQlVHUjFYNk40cjRGbWNud1dHc0lPWFdrd1NpKyt0MCtLZGc1UURsa0th?=
 =?utf-8?B?anhnM1VMam9UcHR0QUI4R2xQbUQreFlzSFNYT2FCdk9ialNrU2tMS1dQM1pq?=
 =?utf-8?B?VDVqZi9ZK1JsRXp4SitMZVNrZHVRaTh1N2xQNXpROUZnaWNrOFZERllHRUto?=
 =?utf-8?B?S3p2dXdaRHZGaHJtUVdBbDRGcnZ4azFDbS9kMS9GaVFDRVpsUlYvRzJId1RX?=
 =?utf-8?B?NGFMSzRBdHRyUFp0TVBWVFlXNnJyZU1iWEx1bDVBTitvdXlzcjZzeWQxTm1R?=
 =?utf-8?B?ZkxNRG9ZSWxNS3BJcGdyWTFuK2dDM3FyeU5YR24vUkF1dVpEM1VhYzM4T1Zh?=
 =?utf-8?B?MXBTYjYxK2lhUDByRk5aUkd3UTBxYWphWmVET1BRYVkvTWFNbEhVZkp0TkFT?=
 =?utf-8?B?VjhZVU1mN3NGRHVSVXFhb3hUV3p4bTBqelVJZTd5amc3ZERwM2JxaEwzckdp?=
 =?utf-8?B?eVpTWHdrZTlhbEdoNWVTM0hmYXZQQzFId2EzNERhUUdGSTZNbWFhQ0lhNUEr?=
 =?utf-8?B?T2JYQVZuUCtOUUl2QlRQaldXWnlKcmcxbWxFaXFnd0hBQWdTYUtVZTFoNFpz?=
 =?utf-8?B?RWRRazhVb3FnOFFWRDNaQnpmVHpjOVBzc1BoZ3A0TG5WMGhnSEdMK1ErTkc0?=
 =?utf-8?B?M3pGQnQvK3RJWE9SbkRCZDZTTUQ3VkRYNEptWVRIYUd0ZUQvbjg1bFVBdTBr?=
 =?utf-8?B?Y2RzcktNck9rOU1LTGtsQnhOSmsrR3VacFNDQlg1cnVBWGthVnFUOTVId3gw?=
 =?utf-8?B?YlpoS0dWYTJIWXNoc3YzRy9lSGkxSTNmcWdxZ252MjR1bmhBTGhUTDllWU9U?=
 =?utf-8?B?QnJSRjhTQWR6NDJiemNxNGZpRTBGU2FHdm14RElOQXRPb2xkZ1NVNnV5bjMx?=
 =?utf-8?B?YnVxTTlTK2E3TVZ5TFMzYk1RRWxNSTdyRHhPOXhvUnhpTGVzMm16QT09?=
X-Exchange-RoutingPolicyChecked: bgLyinu1Y6CFDsWSU8G42Nj5ep27nsaWrH8j/g2nmnu0hCgCUZ2TALTRhFEydBS9ZyJCqq00lJ/gqJIm9OiytDXQ5PD2U+nwqQwlaoNphbNpGd3bTH80ReStUc1uARTh+z/s6HmcJ38G8dDqJodwai0IGY+e8h8lIqoID8X/lbvJwy0sntylYNNxi/n75x30T4yBudS3fpKwRx29AGUMSbkWkjYXKwLVmKKE+W0r34K//NdFx2kVJaNBgxxJn8zQLpuv+hd6q/MPcpStw2sg99NeCf15NS5qcqPZPwJTrNMMDYXfOWeLRRfxen3IM/++n5hUFWAyJm/7MFa8NTP/jw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a9b85b-06f0-4249-bdfb-08dec1fb8bdb
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 05:38:46.4305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBsXFRVs7QjFZSI6sOBkJwbch2hJ25kIIMpbR8IYkjIKyabE9T2qfq7I3kyb7V3Q1cGKuDf6g0GwxH4Do2e5oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5187
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


On 30-04-2026 09:56, Matthew Brost wrote:
> On Mon, Apr 06, 2026 at 02:28:26PM +0530, Arvind Yadav wrote:
>> CPU address mirror VMAs start with cpu_autoreset_active set, indicating
>> they are still CPU-only.
>>
>> Clear cpu_autoreset_active after the first successful GPU fault so
>> subsequent munmap follows the SVM path instead of the autoreset path.
>>
>> Do this in xe_svm_handle_pagefault() on the success path only.
>> Prefetch faults that install no PTEs must not transition this state.
>>
>> v2:
>>    - Move xe_vma_gpu_touch() to the success path in
>>      xe_svm_handle_pagefault() so prefetch faults that find no range do
>>      not transition the state. (Matt)
>>    - Add xe_vma_gpu_touch() helper in xe_vm.h and use
>>      vma->cpu_autoreset_active instead of vma->gpuva.flags. (Matt)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 11 +++++++++++
>>   drivers/gpu/drm/xe/xe_vm.h  | 13 +++++++++++++
>>   2 files changed, 24 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 5933b2b6392b..fd57c9d41db8 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -1388,6 +1388,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   			    bool atomic)
>>   {
>>   	int need_vram, ret;
>> +
>> +	lockdep_assert_held_write(&vm->lock);
>> +
> This looks unrelated... and will change here [1] to read mode.
>
> [1] https://patchwork.freedesktop.org/patch/707294/?series=162167&rev=4
>
> So I'd say drop this part.


Agreed, I dropped this in next version.

>
>>   retry:
>>   	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>>   	if (need_vram < 0)
>> @@ -1406,6 +1409,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   
>>   		goto retry;
>>   	}
>> +
>> +	/*
>> +	 * Mark the VMA as GPU-touched only after a successful fault-in.
>> +	 * Prefetch faults that find no range must not transition this state.
>> +	 */
>> +	if (!ret && xe_vma_has_cpu_autoreset_active(vma))
>> +		xe_vma_gpu_touch(vma);
>> +
>>   	return ret;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index bdf42083da86..8d45f896f90b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -441,4 +441,17 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
>>   	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
>>   
>>   void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
>> +
>> +/**
>> + * xe_vma_gpu_touch() - Mark a VMA as no longer CPU-only
>> + * @vma: VMA to update
>> + *
>> + * Clear cpu_autoreset_active after the first successful GPU fault-in.
>> + * Caller must hold vm->lock in write mode.
>> + */
>> +static inline void xe_vma_gpu_touch(struct xe_vma *vma)
>> +{
>> +	lockdep_assert_held_write(&xe_vma_vm(vma)->lock);
>> +	vma->cpu_autoreset_active = false;
> Write mode VM lock seems fine for now, but will likely have to change
> this to vma->fault_lock with [1]...


Noted. I am keeping this series aligned with the current locking for 
now. Once the parallel fault handling changes land, I will update this 
path to follow the new `vma->fault_lock`.


>
> Also IMO the caller adjusting this is too late. Adjusting auto-reset
> likely should be basically be the first thing handler does, moved to the
> xe_pagefault layer... I noticed in [1] the VMA more than likely needs to
> be refcounted but that's a different issue.


Agreed, I will move the autoreset transition to 
`xe_pagefault_service()` after successful fault handling.

> Lastly - when we call xe_vma_gpu_touch and go from cpu_autoreset_active
> 1 -> 0 shouldn't we remove the auto-reset notifier [2] [3]? Keeping
> notifier around is a non-zero cost as these are entiries in interval
> tree the core MM walks for every notifier trigger, so I think deleting
> the notifier part makes sense if this is possible - still wrapping my
> head around [2] [3], so take this as a suggestion.


I disable only exact-match notifiers after GPU touch. Broader notifiers 
stay active for CPU-only split siblings. Full removal can be revisited 
after the fault-lock changes settle.

Thanks,
Arvind

>
> Matt
>
> [2] https://patchwork.freedesktop.org/patch/716552/?series=161815&rev=2
> [3] https://patchwork.freedesktop.org/patch/716553/?series=161815&rev=2
>
>> +}
>>   #endif
>> -- 
>> 2.43.0
>>
