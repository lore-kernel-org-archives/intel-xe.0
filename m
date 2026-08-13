Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67087C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 23:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D3710E2DE;
	Thu, 13 Aug 2026 23:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6K/IuK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3F010E2DE
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 23:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786664239; x=1818200239;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rqK7UC912Kn/xXWIJc2KfRB+tPd9LG29wep4vK7CuTw=;
 b=R6K/IuK63w5gathmVS/njnOu20U3WwKzloDepsWZthyW7kxlKei2glgk
 syKtII3cyZz37VjlPffzzlpyWFVbe18tFc8dwoagyri0I4RlSEZlS/TbM
 lIRHSHUFbsWkv16H+rScdL8Cd3IfR1By6hk1n6pjTeA5X+yXWxYY8UB6C
 Q6XWjvKOnY4VjIQ1zIknzH9zidaEVLRXi9rPeN/EQzzIgivOz0IHFTAm9
 nMoNAFAu4ngYT+lTg1NyFmIq85dEKRmQ/69wqf26d6vE9TsI0vkh6JsVD
 WNAQD6N+07FLtH/N7TmwN7cf3Oo+I9JfpOsOanabnh4QBFQOAawF0M2LY A==;
X-CSE-ConnectionGUID: IB4COvR6QVa3nrQUMWKp9g==
X-CSE-MsgGUID: PTXetvPsT4SBO4GdeHIUFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97914428"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97914428"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 16:37:19 -0700
X-CSE-ConnectionGUID: UCkrt36WSNqDDYU7SRWLYw==
X-CSE-MsgGUID: FMm0ytpEQPiLHmM6PUIYjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="260806418"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 16:37:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 16:37:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 16:37:18 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 16:37:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHCcXXzMrJJEogPpdBV1kzNCcO2QKI5kLwTB3MqaIPpBLNGeFX4VdpJjdCq2e4CNwO6UFIxVPSgB1JVI9gTs0TImsuDSt2Zg9Xv2HuQXaliyILrQFEhPxlgk/MqYvbMyc2FEJCUNWdEV0JTXBCYM783iITRLSGVvvw46xQow3cVLckiNa+RztUU+Cuyw1yS8jGGr4VgYunA84neQcPCrshyGLd+B5NXnCYag8wzZzP/LUlf41cOX5gdPD1pSvYHbL4evnQN2AerisGftSFyrWPgL5UoFkONaj/SJqV2NIgeNr0BkCvemKUiJtJL+SqawQtCcECL9+FKXW75tXAz8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSOUzrMzPvGH6gpOJxydHHNfv7mj2o9ksVgN0xk3688=;
 b=Wruc4W9SBZ+RTX/dqxlxC4Sos8g5WtjrdXr5p4+26bRMjDFWuU3gDncx9uUEKPYJc1sTz/B61K4AwFD5psA1TnX/00yCb3B+nt4cG1YvU36i7WJL7njDqBI6Ln3Op/SIxfAg2QgNN5Omh5VCE4cClaGV4ad9rWKPOcQL6JnL552xSsT625JQjgaTtdeZoBJj6KhlQ8WQxSISuc0/WS5MyzXIsE2q2K1ca708j9/25whc7w8diQg4pvGtluNVrdUyFG8WEN2lh1/nEeXXehzNCs45wEpUiv/5VCXny1W1zpyLEx04iSAeG2gHWQMB8oyu6j5C6TxjJ2bdOYbzz++jxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS4PPF25B1C4D24.namprd11.prod.outlook.com (2603:10b6:f:fc02::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 23:37:11 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 23:37:10 +0000
Message-ID: <b801d425-3c3c-44dc-8e62-8a1709e27f42@intel.com>
Date: Fri, 14 Aug 2026 05:07:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/32] drm/xe: Introduce xe_any helpers
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260812191450.11690-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0202.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS4PPF25B1C4D24:EE_
X-MS-Office365-Filtering-Correlation-Id: aa80f591-dd76-4294-14fe-08def993cb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 5UIOEXb8xwsO6UsQjZUcFMYwTKzIhA0bImJjkDdxUsTCu98awHe57eyKAycNI0wjR8LZEynOfN9opTgXekS3vYDoMVKQH5uWSmu3GxbSiTevhiBBpHQj94WhCjWxXjpQrg4UNNsMhCtQoZ/+uVNv92KzwxB3VbY8bjNri/YsXtDwT3C/yDygJVI+e8V6U7Sfv2LA/xPD6bG4tsXJpZCJ9kZYGTALPD9r4fN8tAPp62b/1PRGWsOsXFC2dR6Q4+T3SwVP0geQeiT6J1hblQ0Ncnt4saOEHafnmQRwLrG4DfXDmSv7BVIJjOo6wWXYATK7rF6iVsZH50T5JLmxgLVfg+fQHwf4tOl1mJFxn+LAGvVmfT/54o/a40BiA5Re9B1YP5m4DEMj8Tw151oCZtI4iclHRX/q6W3V80D0tg+Sq2PDe4Kbw22r8MKq9bPmv7E9cMfQcIgjhDDpInc7SOtgA6yDjHwNOUYRfcnmBrNDfSa7FtMUL0dNf6VGzWvDJutDDQmY+UlcZR09X0a+296VBziwZQSJQv0E7kspf8hlmW6FGZ0qzqPmkx6I4J5KmLxvTQk98OOykQ6vuOKbrTMVn3ZprI8OcyGKeeQnDH3cSv4fwIZZkkmHJCqQJ9RP9aSy5gA0ZS+QDiTjwlSjPT3ncJtmykka5KsY1ayaYL6xLUo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGpMRkZRRDgzREYrUE8zN2JGU2ZsajhMalVyNDkxVXFYTnFyNnVMYlhyeTBV?=
 =?utf-8?B?bWRaRVFIS29hRzFpSjlubzdTNFRVTWFidGZsa3hoSkxGWnEzYnEyMTNMaXpv?=
 =?utf-8?B?c2F5aUsrTWtwK3NGVFZBUkhoTDF0d3daTzIyOGFLbTJJT0VwZUVaZWhZQXdU?=
 =?utf-8?B?bGNoRVM0RUtMWGtEbFdmK3VUMUZ0clB1NkdZYzZKSElHZnV4VG96aUJveDU3?=
 =?utf-8?B?SjRNN25rVGxxeUdjdGsvemdHOGhOU1lLVXlqdGRGWWhtTWt4elU1VUxmbVhC?=
 =?utf-8?B?MzArV2tzL0tDbzNiZ05YL01BWDViU1RmMnlHMGV2U3ZoUmF4L0JEaHFvT2gx?=
 =?utf-8?B?SFF3SXZyNU9LQWRNbXR5MEovMkkycFNoc0RpMkRDZUxLTWhTNjNEL1NvT0J3?=
 =?utf-8?B?Y3dpYkMyUmxEcVBOaHFyZFNKRmxBSnNuakVQMk1MbDRVb3NwM3M5empkU0VB?=
 =?utf-8?B?UTJ0UmYxWURBdnlOM2JqU3lBanEra2RITU50R2YwOVZnWENwSnNlNnJidEZL?=
 =?utf-8?B?Zkp6Vzg5WmxrcExvamxURTRxaDlrVncyY2F0TjdYdXh1alRzTVYyc3ZsRUNq?=
 =?utf-8?B?ZFV0cHRQcDlSSldvRkdmdmlBdVZHU2JqK0hiWEl1akxKWHN4Zmg1eXI1ai9G?=
 =?utf-8?B?eGhObDgwZktiWjFuU0J6MkNOOGFqeVN4aC9nUWJzaEdib1dHVS9TTjQwbEwv?=
 =?utf-8?B?bkJSQUxEN20yNGdPaC8yelJVWUVBMEw4aUNWZGJ6cnpKUGtEMGdBeFJZbGFL?=
 =?utf-8?B?cEtaYUNXNTFxaUVMcExlNXQ2Zjl3cldvYnFlcm5DYWFvcGRGYWV1NTdLNlh2?=
 =?utf-8?B?U0lkTVUwU2FMVjB3YitpWUtXNjd1ZkFBNGpBR0MvUGhBUVNDN1g5TFJNdkJH?=
 =?utf-8?B?Z2Nyc0wzS2FsZ0gzUzBZTWFLVVNpNllvbEUyczJ0dU52QjNCeU1sN2FYY1Zr?=
 =?utf-8?B?eHFnODArUnByTWdZc0FoT1FpNVZkRS9ZeVVNMzJiVHNFNktkcXFwODdRV3ps?=
 =?utf-8?B?ZHVSVytLcXo5UUp0NlA1ZHJYdWY5WHBweWljbjl2SUM3aUlVc3BzUnFmZHdu?=
 =?utf-8?B?RHZOdkR1ZThHRjlSaVRyTXBlUjJPQitJOVc1a0J4Z2pNWkMwZzdlRWw2S25R?=
 =?utf-8?B?L1B2UlVOQlFGWUYzWkpUNXJWSmFSekF6NVJLZjFsUEFRUlcxYWJKczNtWUtN?=
 =?utf-8?B?WG4rbWt0d0dMSDJobVRFb3NVUUlaT0M1QVNnQVVIdU9GSkMwb0toRVByZkVu?=
 =?utf-8?B?Ky9YdTVkbXZCSExUS1d2QUU3MG01QTVxaFhtNUx3UmExa2NPMEUxQzN6aFRS?=
 =?utf-8?B?dW0vWWpJa2tHT052S29nUnBkM0UvN3pIT3JpZlRXVFJtclE5bUNpcU9nblhs?=
 =?utf-8?B?ZE5hRFpFZ0ZtTHlUZTBqWkphbncramt4TmRrTEZEWm5LQUJ4QUdtcjRqKzRK?=
 =?utf-8?B?dzBEeDhQRWpXakNaVzJ4UExsMkVzaHNsL1NDaVo2Yk1yL2RmQm50WUVKK0F0?=
 =?utf-8?B?UEdNRDZ6dGVKVnpQREQ5Sko2SXVGZEQvdFd6eTVYTHlOSEZvRnJHRG1kcStp?=
 =?utf-8?B?Y0hkZVlRQUlEMEVwMWEyZ2E5SFExeVpoRXhoV2Q5LzJUWWQ0V1lza1hoWlYw?=
 =?utf-8?B?NzEvZnZwd2dld1I4THhSZmhITEoyMWd6eS94MFk1LzFNQUJhU21GdEV3WWND?=
 =?utf-8?B?R3FPVEFsTzUwamx3MW1OeUxYYlJ5Rlo3THowVmZtZERteVJYdFhrcWlMME9q?=
 =?utf-8?B?a0gwWWFqWnF0MWxsMzJucUVvc1FBdmdNc1NOWm1uN1ZoRTB1b0Y4aHg3d2lp?=
 =?utf-8?B?SHVpcU5hQ3hMc2szQ1V2bWlpRTY2bUlOKzVabXd3aXIrOHN4dkZNbm9iYmV6?=
 =?utf-8?B?Z0FDN3ZLVGZsNDJxem5MK2IxUW9ESmcrT3hrRzFCSWlQY2NMaWVNQUorRjhk?=
 =?utf-8?B?TGJFRWFJS2FZYVFqWWoyMnIvRXNMVktxUS92cmk1QmVGMHlHNnhNaU5xUk95?=
 =?utf-8?B?aE9sd3A0WXhvM2M1aTg4c3JDNkNHQUhBZmN6UTUrVVZteGp5V1pGSjNqRUhM?=
 =?utf-8?B?blp3Y2RGb1JYQVJzT0pRSVJBQ3J4WXhORWpzUi9WSDlpQURWeDFXQXd1enc4?=
 =?utf-8?B?eUFUbndLYzBxQTlZYnB0dDUwRUQxMk4xUnZZaFVuditJdkpsQ0RUQzJnL2I3?=
 =?utf-8?B?a0o2ZlVLQTRZYXhlUmJBS21TbTM5OHpTY3hlRVkyek1tcU00QkdGUEEzdkxI?=
 =?utf-8?B?TGlkQ0ZqOExUU1FZeWQyK3ZXcW16U0lMQ01SdmZKTkNQcnVGckhrdFdJendp?=
 =?utf-8?B?cjA5YTNQdFRlRTNUeWRRTWdVTTRqKzQxc0ZPS2FnTWZlZ284MWZyRDROcWJH?=
 =?utf-8?Q?1ZiCk4CdG1j7rQ4Y=3D?=
X-Exchange-RoutingPolicyChecked: P0SUMRRZbBR1bSZW6mluCPdQASgmhrOGT2vUlrsjovpZshj8Zp2LJB8BfRljY0IULgn/nMWkABptYsvZskyRWXp7Khc2U4f4AwEUQbASKD1dbGsVKVmGYKRYIQ1ilQZPPkOo4pAato8iGqnkbBZMlzPPNoAMBxez+j6PlnXDNlSDyGb2xBtrqrbpTGn9bRBVx91RrLSA9e4CshOhXNw165Ct3MBjDqBKOAMLS5hCleeBbUlbLynbBMSh/az/gGJsI/sOocIW14PmZpKXLrQquhJauhj4deFbT7DJ37WdJYEa1p7PFg2z286aP+sUr5Zds4HBQDU3xi+4XRTPS4R38Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa80f591-dd76-4294-14fe-08def993cb88
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 23:37:10.6204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/DMeAS3JIm3zoqj5jgqnLywg1P2dj5jB8SPlK0+OQzSOaq3mG3FNYmjqrljGOKfZKBX7LhGZCKiByN/n4DZzx3ZSApW8xZTgBfGykrp3sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF25B1C4D24
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


On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
> In upcoming patches we want to define macros that will work with
> either xe_device or xe_tile or xe_gt pointers. To make them work
> and to allow compiler optimizations, introduce set of helpers
> that will return either expected pointer type or NULL or make
> necessary conversions to/from the struct xe/device/pci_dev.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v2
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com> #v2
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
> v2: add include (Sashiko) and const support (Mallesh)
>      reuse existing to_xe() helpers (Michal)
> v3: fix another typo and fix to_pdev (Sashiko)
>      use assoc macros/helpers (Jani)
>      add support for drm_device (Michal)
> ---
>   drivers/gpu/drm/xe/xe_any.h | 137 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 137 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_any.h
>
> diff --git a/drivers/gpu/drm/xe/xe_any.h b/drivers/gpu/drm/xe/xe_any.h
> new file mode 100644
> index 000000000000..5d97afa76915
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_any.h
> @@ -0,0 +1,137 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_ANY_H_
> +#define _XE_ANY_H_
> +
> +#include "xe_device.h"
> +
> +#define __xe_any_to_self_assoc(type, any) \
> +	const type * : (any), \
> +	type * : (any)
> +
> +/**
> + * xe_any_if_type() - Get the pointer only if it is @type pointer.
> + * @any: any pointer
> + * @type: data type to look for
> + *
> + * Return: the @type pointer or NULL.
> + */
> +#define xe_any_if_type(any, type)						\
> +	_Generic((any),								\
> +		 __xe_any_to_self_assoc(type, (any)),				\
> +		 default : NULL)
> +
> +/**
> + * xe_any_if_gt() - Get the pointer only if it is &xe_gt.
> + * @any: any pointer
> + *
> + * Return: the @xe_gt pointer or NULL.
> + */
> +#define xe_any_if_gt(any)	xe_any_if_type((any), struct xe_gt)
> +
> +/**
> + * xe_any_if_tile() - Get the pointer only if it is &xe_tile.
> + * @any: any pointer
> + *
> + * Return: the @xe_tile pointer or NULL.
> + */
> +#define xe_any_if_tile(any)	xe_any_if_type((any), struct xe_tile)
> +
> +/**
> + * xe_any_if_xe() - Get the pointer only if it is &xe_device.
> + * @any: any pointer
> + *
> + * Return: the @xe_device pointer or NULL.
> + */
> +#define xe_any_if_xe(any)	xe_any_if_type((any), struct xe_device)
> +
> +/**
> + * xe_any_if_pdev() - Get the pointer only if it is &pci_dev.
> + * @any: any pointer
> + *
> + * Return: the @pci_dev pointer or NULL.
> + */
> +#define xe_any_if_pdev(any)	xe_any_if_type((any), struct pci_dev)
> +
> +#define __xe_any_to_other_assoc(const, from, other, p) \
> +	const struct from * : __##from##_to_##other((const struct from *)(p))
> +
> +#define __xe_tile_to_xe_device(p)	tile_to_xe(p)
> +#define __xe_gt_to_xe_device(p)		gt_to_xe(p)
> +#define __pci_dev_to_xe_device(p)	pdev_to_xe_device(p)
> +#define __device_to_xe_device(p)	kdev_to_xe_device(p)
> +#define __drm_device_to_xe_device(p)	to_xe_device(p)
> +#define __pci_dev_to_device(p)		(&(p)->dev)
> +
> +/**
> + * xe_any_to_xe() - Obtain the &xe_device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @xe_device pointer or backpointer.
> + */
> +#define xe_any_to_xe(any)							\
> +	_Generic((any),								\
> +		 __xe_any_to_self_assoc(struct xe_device, (any)),		\
> +		 __xe_any_to_other_assoc(/* */, xe_tile, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(const, xe_tile, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(/* */, xe_gt, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(const, xe_gt, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(, drm_device, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(, pci_dev, xe_device, (any)),		\
> +		 __xe_any_to_other_assoc(, device, xe_device, (any)))
> +
> +/**
> + * xe_any_to_drm() - Obtain the &drm_device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @drm_device pointer or backpointer.
> + */
> +#define xe_any_to_drm(any)							\
> +	_Generic((any),								\
> +		 __xe_any_to_self_assoc(struct drm_device, (any)),		\
> +		 default : &xe_any_to_xe(any)->drm)
> +
> +/**
> + * xe_any_to_dev() - Obtain the &device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @device pointer or backpointer.
> + */
> +#define xe_any_to_dev(any)							\
> +	_Generic((any),								\
> +		 __xe_any_to_self_assoc(struct device, (any)),			\
> +		 __xe_any_to_other_assoc(, pci_dev, device, (any)),		\
> +		 default : xe_any_to_drm(any)->dev)
> +
> +/**
> + * xe_any_to_pdev() - Obtain the &pci_dev pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @pci_dev pointer or backpointer.
> + */
> +#define xe_any_to_pdev(any)							\
> +	_Generic((any),								\
> +		 __xe_any_to_self_assoc(struct pci_dev, (any)),			\
> +		 default : to_pci_dev(xe_any_to_dev(any)))
> +
> +#define __xe_tile_to_id(p)		((p)->id)
> +#define __xe_gt_to_id(p)		((p)->info.id)
> +
> +/**
> + * xe_any_id() - Get the identifier of the underlying object.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the identifier of the object, or 0 if not applicable/available.
> + */
> +#define xe_any_id(any)								\
> +	_Generic((any),								\
> +		 __xe_any_to_other_assoc(/* */, xe_tile, id, (any)),		\
> +		 __xe_any_to_other_assoc(const, xe_tile, id, (any)),		\
> +		 __xe_any_to_other_assoc(/* */, xe_gt, id, (any)),		\
> +		 __xe_any_to_other_assoc(const, xe_gt, id, (any)),		\
> +		 default : 0)
> +
> +#endif
