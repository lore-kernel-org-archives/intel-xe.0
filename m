Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AF9CD5BBF
	for <intel-xe@archiver.kernel.org>; Sat, 23 May 2026 01:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3305010E027;
	Sat, 23 May 2026 01:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iE+o+skR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FA210E027
 for <intel-xe@lists.freedesktop.org>; Sat, 23 May 2026 01:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779498440; x=1811034440;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pUhBQ6EXAHpiFelFOTzjNfcfVpLmN1q7YYcAaKejb94=;
 b=iE+o+skR3XXqtb/VEu886vYbYxdRYdwLiH/JOe9lBCi+nlAyYpxXZRJF
 HsWT/99gJ1IdOZfpF8ayuTRp10hb7ylS2k87yTLsZJ22dPjUaU1/Qgvwu
 GJMIYk5maWu/3eh0APIx3K4bxGGqYxrF/MXwGIRatGlNaEj2lIRT5mENr
 +CGUl7CMBFdXqLJkJ3Sq+aYeZhldfjgSHP6fN0Oy8cHTID2ZlEDGCAw+d
 AmkdyY7wLkt4/DZg7aE8eLgTwD0CY7DshjkFn9HJRhc4+UfYsBs7nFb6R
 o0zBExK0ISCRKjxQk/bhOopTPmMsYXnVLKc+QYDRoFQbEVnq8mbFX1BFw g==;
X-CSE-ConnectionGUID: ktil/ym7RhGtZd62DBmDrw==
X-CSE-MsgGUID: olmMIsBcSHygAR63YjzpuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91816548"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="91816548"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 18:07:20 -0700
X-CSE-ConnectionGUID: 2jnNlC7IS8iKcTGHt7EFuQ==
X-CSE-MsgGUID: fD1NyWUPQJaX4HL1Thpg6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="241121871"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 18:07:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 18:07:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 22 May 2026 18:07:19 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 18:07:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfyJNZtQWNh5Uqv3VmtccwNkPvdDKmAUmkov0Twc2p/Z5Vn7n8awab9A8lESuqR4LGcnCZ8FHid3gVkCcBOzP8ZHJvjp1zn9NeXjAiPW4XKpjIZNipm8x/fvp/v0furCE4NDZwowB3BYbSQISTnL5u8zwPyG9VA0fmktm62Pwdm+/UPIpj/o6FOssIrP+8L9OeOODycULyuvaBjcA1qvX+HIQabgBb4X63TbBp9rtayIr7eRk/7GFJjaSWYY04S/rcTmmj3GiQilMqK9U1lx1bBczzGJjhQYzVQARzFNwqnTrZ4UqhTbkPp5W6pq5fyJpkeEnvRbhYQCY645WsI5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYkpgbs0JDCWLvrA8U2KVa+z8Tky6nzrD4iKo8+tUgY=;
 b=kqNWUwSg+PWnc9lTW412BSMUK8b0DW59mBs5IVbZKR8b2Q+RgKPx5f5FUpLqZJFe+IoPzKAkpjD/Dc5P3fNg93+UkkKIaOLkEwLjzzwZ3dGZgL9Pwxz4k7+vP0CxhY8wNLOcEQkrGc712G8C0qasw7Rx47T7choQ+AYc0LCqFUhCtfnvqcWKy4iIMe9T5Ji5NFYauw0w2/YuC5Mj0d8GttUj4BaLERu21DXm9QQEkm5kiW8byQGBI+Ymart6HfHwgoZJ3L/VHQD+dyAP2rnaH2D//9WvRtdjfvy3o0JaYY3+8WcBlTDgwkwHTB5yo2Q3oCKWIa9VsCtbsK/m5TCRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB6123.namprd11.prod.outlook.com (2603:10b6:208:3ed::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Sat, 23 May
 2026 01:07:09 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 01:07:09 +0000
Message-ID: <8b2daa25-5694-4c63-9ba0-d6a7037f7c13@intel.com>
Date: Fri, 22 May 2026 18:07:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] drm/xe/guc: refactor to_guc_class() to accept hwe
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260522123720.39656-12-matthew.auld@intel.com>
 <20260522123720.39656-14-matthew.auld@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260522123720.39656-14-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 4128ac43-b9bd-4f19-cfce-08deb8679d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|5023799004|4143699003|11063799006|3023799007|6133799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: m+E7svC0AZGnZPn0FAkrDQE2Y9yjHEuIR62bwBxR2ukWGCfsKmAbFm8M4zSDr4cS3dcV/mRVes+D/lNA0YOuux8sJrP/8kLHbqudaCQLJv1gQOphb3ETtAU5fPYs3cQx1GpoSehvsbEhxY4XeZw3gpDPrvKJ+PBkoxOeqV2O7JnpOirf+MjRojnPnAfnSx7sgzju41MnK5KiKroie4T85Bu4e/h06W24QLyyd/ru/Q7pt9UDSXQabt4J6jUWkPeQY1SeusJn1mGHIPNeICAlkdCMJ3ClYgM/Rj5coG+eVO311xLm1dsHo3t5pMdiQfKBhmEIkpvvxPhD8igzuYsIo0yV76WNof3WV1lSOg6G+rgzx+ljbkRF9eUKT396CHHIkkxbGJqokfNdYLkxta7Wkb8ogODDftNiPD2flNSzmVS4gKNn2JY0eaLmCtVsLj8N7LQOYjHCfyQJas4uUsHZ5jRK2JjjavJUktW0VwVsdVsHP4Es3X5nYkn3mNlLUF3aSCJbCaDmjPqI5tf5z/3k+gNgAxQPY4Zw5w/dU7oZpN49/UE2Pv6CM9yNqvnE2MsAyXZOURAYGcicOmx2LADqyAfWSsZPbiL0GzEVbYkyVVlFkbFwhWJAzM2vv1pF/zX2DkVD3PoY0AMuesZnm3cIKfJHrgLViJW2O1H5JPeaTh4Wqhq4+vdmhfHTiX0wdzcb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(5023799004)(4143699003)(11063799006)(3023799007)(6133799003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnhRQnplMWp3V0Yyd3hEc203VlBNUjJYeFpjb0FuelRYSmVpMG94ZGxZb2dh?=
 =?utf-8?B?TElKTzI0RnhkZDJ4U3FSZ1kvR0V0U3RMWnpwNVo0MmZrU2tTcFJLNk1DMUtT?=
 =?utf-8?B?d2dsTlRTL1RrdExBZ1pJUGZiWHNyRlA0bWF0NCtDcTF4RXFLUXdHMzUrYllt?=
 =?utf-8?B?TnV3YkMrbDhuTHo3RmkxaXJ3Zy9lcXZSRkp4VW9UOTRsNFBsL2RvQWJRbUJS?=
 =?utf-8?B?akp0aDNFYnpHRGViOUw2b3JkSmRCV2cyckpXYmdjU0hwY3BYMzNzME02VVJT?=
 =?utf-8?B?Q1R2cVExT1dCZkVqMlVtMFRpQmk4QXhCS0dkQjkySmNGMUpFTVc1YnRGTlht?=
 =?utf-8?B?U1YxdTFMT1FUc3F2Q3BoR1c5RjVTR25kMWFJY0JERDhEcThPRkx6NzVEMjZ4?=
 =?utf-8?B?d1pDSnFBdXplbWEvNW5USjZiWHV1c3IzZ0JiZDRjT2l1Y0xNU2RuZmg5d242?=
 =?utf-8?B?TEttbHhIUnJkTjYvTy82Q0taMzhHWElNemhsVnBpTHk4YUNLc0hLNGJwMkFs?=
 =?utf-8?B?RlZRV0VZL1luRGFhTmVlOXJjRHUvYTVzL1NObjg1N2hTcjJYZURZSFFNZlo3?=
 =?utf-8?B?N0tEY29ydVlsczcydG93T2NDRUZNeXpCRlVLMW4yWUU4amJaQWdqYkZ0dGxW?=
 =?utf-8?B?bFBNaEptaUo2Wnl0VFpKQVpiQVhjUTFhdjBIQllJWElPVE1wWndHREs5TDdq?=
 =?utf-8?B?QlZGNGJWZE5oemRQdi9LakNadFV4Q1ZQS2tzZ3ZvalpCOFd5Mk0vMEVzcDdZ?=
 =?utf-8?B?SGk4M09WUmxOMVdOZzNWOU9COWtrVVNScXgvNmNhcW9aU25nd3dMeUNLR0NJ?=
 =?utf-8?B?cS93THpyUlN3Vm1iVjNIRkNkUm9WTXQwUEVXNkhhL1NsT3NyeDFvT2NBVUND?=
 =?utf-8?B?Tk1Ob2ZZQkFZanA4KzFHblhlWWs0V05qR2U4SWg1QjFjaWRGNlhGWHBXd3U0?=
 =?utf-8?B?RzI1Tm5DaVhlWTV6OHgxeG1YcmZXZXVFV29jQU85MUtUcHViVHFlWWc2MFd2?=
 =?utf-8?B?MTJndVBPaW4wZ2ZobFI1czJldkVVVHcxaU1wbGFzaEtjUGd5bkJtZFoweVpG?=
 =?utf-8?B?WUpxbmE1Ym9oRHVGVVd0alFyM2JjWks3bURLZld1dWJDNmVISHlrS1UyLzIy?=
 =?utf-8?B?c2VlRDEyYWoyUmlEK3Z0NFJPY3NOc2I2Z29IdDl5QUFXZHJYd3hWSEZiYkg1?=
 =?utf-8?B?OGVIVXFMOWZLRTN3T0xMVmM4Ump2RlZoemVZS3RWMWE3Q3B2RnZmajFkbk5N?=
 =?utf-8?B?b29sTjNaU0kzNURvcUVYaERKTHNKWlhLcnhpWTVZd3V6MS9tWFNHUzhUb20z?=
 =?utf-8?B?WGhLWm14MkVXSnB5ZXBERXFHRXJLbzF1VTZzNU5UQVBvY3hObmliMWdxa0k5?=
 =?utf-8?B?Y0tYdU4xMHZvdEUySTM4TVBJQWJ4dFJaMDExUDZ6dXpsbXZoV0g4NHhEamFj?=
 =?utf-8?B?U1FVbGQ4MkFZUUk5bnZFSzNnMDdqWmRFTjZOOUVnOE1TN2xaVXdOYkhjZndz?=
 =?utf-8?B?NFAyVHFHaU1NSmZlN1VhMTFKVHZrcmlnK3hqcFZBWHE2N0JZTzZldzB6bFVB?=
 =?utf-8?B?TzB2UmFwUVVqK240SlliWlNKbEtyREVOWHlrR2ZkTzZRV3dOVUVPYjdKNVRa?=
 =?utf-8?B?WmtMOEFvbkRzZW9RK1dad2JRUzNuTWtWMVdpVUp4Um9kd2tvYm9MTElXZ2Jt?=
 =?utf-8?B?Nmw2MXZQWFA1VUx1dEFxRStUOWNWeWdON082UHN4eE9kOXV5MjJuL3ByZVB4?=
 =?utf-8?B?WDVLVWVVWmczamcycUpGWENGL3YvMFhxMGwzMm9yYXk1L1J6VkdhVCtWenMr?=
 =?utf-8?B?SWRqdHM3cTYzeXE0SmM5UUlGWWVPTjFBZ0tkTldOeGlTYnYwdkVRT1Z5ZW44?=
 =?utf-8?B?VUg5SUZEQkVTaDVqWS9QNG1remp4UGxiQjQ0Vldzd1NZTnNlVjNOdHQwL25Q?=
 =?utf-8?B?R2hxZTViWlIzMUNuMmlWdEhNUkhhOCswU0h6TmNaZE5qSnlEcVdaTldnY05S?=
 =?utf-8?B?Q016NjRtcXUzeWorTTc0UlRxR0ZNUjdiZVg3UjMwU2t0UCt1V25RMTlPb3Q3?=
 =?utf-8?B?K0VVZ3ZxM0h3ajlnaEIrZk9yRjZRQ0RDTmxvdnhva2JnOTJ3ZnVlM2haWS96?=
 =?utf-8?B?L0NOeGRXY0pMaXpUV0VUVG1mQmZSRWk0Z0xvcmhNM0E2bTI3V2p0ODljc0xy?=
 =?utf-8?B?ZG15VjdjZTZXTHRKN3oveFRUbFkrMWJRMXErRnE2aGJnV1dBYXdOM2lObllD?=
 =?utf-8?B?SjNLODlMQTBTOUtqcjJQN25IRVJuN2RmVjZIaWZTMUJYMEhNZzdrSytGalB6?=
 =?utf-8?B?dmRHbURtMkNWVS9ibEYzMDcwZDdIUXhlajRObGNNKzdvNmFvdHVkVUo4WTU4?=
 =?utf-8?Q?pemfLQr6jDyruUeQ=3D?=
X-Exchange-RoutingPolicyChecked: XA4CzPI94kMku4dZqnQdUTp1bqV7gFJc06RqyjaKjXaAWuO/HK5o6rAve0VHECf37nqsT4Y2d51Vms3gz8WOc4zZB03xRJFBj3sUUcqMQLq1seu9Ye7zoxrasLqZpfsyHX/ftkyYzXdVAgTw5UsD5wWuC3m84GmuhbRcN7PBHKRdA8rjScxOzakd1lklXqfxNp4tCmlN2E/qWSyEnh+kbOxh/eLwDcgSXy+2PSZ3qmrZwstC2A3X/yBj707BkYt8ube5ZSFVfcyLixOjzcxQahCYuP5uk5Cprs7YNhUlq65F73hSpDxi69qb7yVFDBJvktCK8tfCyQBm8u5hauTqCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4128ac43-b9bd-4f19-cfce-08deb8679d0f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 01:07:09.1408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlAWztPY5dsScLege07f6y6Gc1veTJB6jKZ6BEeoVaVQeCCChNjS9qmsgiUEVLUPVYpu9MxLCi99s3qPIkQC8sRfOazNkKUWxQyvfNEfxaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6123
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



On 5/22/2026 5:37 AM, Matthew Auld wrote:
> Rather then inferring the GuC engine class from the generic hw engine
> class, pass in the hwe itself, which gives the complete view, like
> instance etc.  On future GuC version, there is dedicated PAGING class to
> identify the KMD reserved BCS engine, so we need more info here in order
> to return the correct GuC specific engine class.
>
> With this everything should now be using the new hwe based interface. No
> functional changes.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  2 +-
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  2 +-
>   drivers/gpu/drm/xe/xe_guc.h                 | 21 +---------------
>   drivers/gpu/drm/xe/xe_guc_ads.c             | 27 ++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_guc_capture.c         | 12 ++++-----
>   drivers/gpu/drm/xe/xe_guc_capture.h         |  4 +--
>   drivers/gpu/drm/xe/xe_guc_engine_activity.c |  4 +--
>   drivers/gpu/drm/xe/xe_guc_submit.c          |  2 +-
>   8 files changed, 38 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index ffa27f66bba7..f28c7ae0e8c2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -381,7 +381,7 @@ static ssize_t sched_group_engines_read(struct file *file, char __user *buf,
>   
>   	if (group < num_groups) {
>   		for_each_hw_engine(hwe, gt, id) {
> -			u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
> +			u8 guc_class = xe_hwe_to_guc_class(hwe);
>   			u32 mask = groups[group].engines[guc_class];
>   
>   			if (mask & BIT(hwe->logical_instance)) {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index e8458d63742d..cf117bf52d41 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -471,7 +471,7 @@ static void pf_sched_group_media_slices(struct xe_gt *gt, struct guc_sched_group
>   		return;
>   
>   	for_each_hw_engine(hwe, gt, id) {
> -		u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
> +		u8 guc_class = xe_hwe_to_guc_class(hwe);
>   
>   		switch (hwe->class) {
>   		case XE_ENGINE_CLASS_VIDEO_DECODE:
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 02514914f404..12faf0ba7229 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -67,26 +67,7 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
>   int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
>   #endif
>   
> -static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
> -{
> -	switch (class) {
> -	case XE_ENGINE_CLASS_RENDER:
> -		return GUC_RENDER_CLASS;
> -	case XE_ENGINE_CLASS_VIDEO_DECODE:
> -		return GUC_VIDEO_CLASS;
> -	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> -		return GUC_VIDEOENHANCE_CLASS;
> -	case XE_ENGINE_CLASS_COPY:
> -		return GUC_BLITTER_CLASS;
> -	case XE_ENGINE_CLASS_COMPUTE:
> -		return GUC_COMPUTE_CLASS;
> -	case XE_ENGINE_CLASS_OTHER:
> -		return GUC_GSC_OTHER_CLASS;
> -	default:
> -		XE_WARN_ON(class);
> -		return -1;
> -	}
> -}
> +u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe);
>   
>   static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index ffe60d77b713..6626803d75b5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -279,7 +279,7 @@ static u32 engine_enable_mask(struct xe_gt *gt, u16 guc_class)
>   	u32 mask = 0;
>   
>   	for_each_hw_engine(hwe, gt, id) {
> -		if (xe_engine_class_to_guc_class(hwe->class) == guc_class)
> +		if (xe_hwe_to_guc_class(hwe) == guc_class)
>   			mask |= BIT(hwe->instance);
>   	}
>   
> @@ -504,6 +504,27 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
>   		       engine_enable_mask(gt, GUC_GSC_OTHER_CLASS));
>   }
>   
> +u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe)
> +{
> +	switch (hwe->class) {
> +	case XE_ENGINE_CLASS_RENDER:
> +		return GUC_RENDER_CLASS;
> +	case XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return GUC_VIDEO_CLASS;
> +	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return GUC_VIDEOENHANCE_CLASS;
> +	case XE_ENGINE_CLASS_COPY:
> +		return GUC_BLITTER_CLASS;
> +	case XE_ENGINE_CLASS_COMPUTE:
> +		return GUC_COMPUTE_CLASS;
> +	case XE_ENGINE_CLASS_OTHER:
> +		return GUC_GSC_OTHER_CLASS;
> +	default:
> +		XE_WARN_ON(hwe->class);
> +		return -1;
> +	}
> +}
> +
>   /*
>    * Write the offsets corresponding to the golden LRCs. The actual data is
>    * populated later by guc_golden_lrc_populate()
> @@ -574,7 +595,7 @@ static void guc_mapping_table_init(struct xe_gt *gt,
>   	for_each_hw_engine(hwe, gt, id) {
>   		u8 guc_class;
>   
> -		guc_class = xe_engine_class_to_guc_class(hwe->class);
> +		guc_class = xe_hwe_to_guc_class(hwe);
>   		info_map_write(xe, info_map,
>   			       mapping_table[guc_class][hwe->logical_instance],
>   			       hwe->instance);
> @@ -824,7 +845,7 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
>   		 * 2. Record in the header (ads.reg_state_list) the address
>   		 * location and number of entries
>   		 */
> -		gc = xe_engine_class_to_guc_class(hwe->class);
> +		gc = xe_hwe_to_guc_class(hwe);
>   		ads_blob_write(ads, ads.reg_state_list[gc][hwe->instance].address, addr);
>   		ads_blob_write(ads, ads.reg_state_list[gc][hwe->instance].count, count);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 21f7caf9ea08..50c6b9466c14 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -440,7 +440,7 @@ static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
>   	 * to be extended
>   	 */
>   	for_each_hw_engine(hwe, gt, id) {
> -		if (xe_engine_class_to_guc_capture_class(hwe->class) ==
> +		if (xe_hwe_to_guc_capture_class(hwe) ==
>   		    GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
>   			has_rcs_ccs = true;
>   			break;
> @@ -812,7 +812,7 @@ static int guc_capture_output_size_est(struct xe_guc *guc)
>   	for_each_hw_engine(hwe, gt, id) {
>   		enum guc_capture_list_class_type capture_class;
>   
> -		capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
> +		capture_class = xe_hwe_to_guc_capture_class(hwe);
>   		capture_size += sizeof(struct guc_state_capture_group_header_t) +
>   					 (3 * sizeof(struct guc_state_capture_header_t));
>   
> @@ -1620,7 +1620,7 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
>   	if (!new)
>   		return;
>   
> -	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
> +	capture_class = xe_hwe_to_guc_capture_class(hwe);
>   	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
>   		struct gcap_reg_list_info *reginfo = &new->reginfo[type];
>   		/*
> @@ -1662,7 +1662,7 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
>   		}
>   	}
>   
> -	new->eng_class = xe_engine_class_to_guc_class(hwe->class);
> +	new->eng_class = xe_hwe_to_guc_class(hwe);
>   	new->eng_inst = hwe->instance;
>   	new->guc_id = guc_id;
>   	new->lrca = lrca;
> @@ -1826,7 +1826,7 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   
>   	xe_gt_assert(gt, snapshot->hwe);
>   
> -	capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
> +	capture_class = xe_hwe_to_guc_capture_class(snapshot->hwe);
>   
>   	drm_printf(p, "%s (physical), logical instance=%d\n",
>   		   snapshot->name ? snapshot->name : "",
> @@ -1898,7 +1898,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   	for_each_hw_engine(hwe, q->gt, id) {
>   		if (hwe != q->hwe)
>   			continue;
> -		guc_class = xe_engine_class_to_guc_class(hwe->class);
> +		guc_class = xe_hwe_to_guc_class(hwe);
>   		break;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index dca97d52b192..eb954f4d1ffd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -35,9 +35,9 @@ static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16
>   }
>   
>   static inline enum guc_capture_list_class_type
> -xe_engine_class_to_guc_capture_class(enum xe_engine_class class)
> +xe_hwe_to_guc_capture_class(struct xe_hw_engine *hwe)
>   {
> -	return xe_guc_class_to_capture_class(xe_engine_class_to_guc_class(class));
> +	return xe_guc_class_to_capture_class(xe_hwe_to_guc_class(hwe));
>   }
>   
>   void xe_guc_capture_process(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> index 2b99c1ebdd58..150d891d5a09 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> @@ -27,7 +27,7 @@ static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_eng
>   {
>   	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>   	struct engine_activity_buffer *buffer;
> -	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
> +	u16 guc_class = xe_hwe_to_guc_class(hwe);
>   	size_t offset;
>   
>   	if (engine_activity->num_functions) {
> @@ -150,7 +150,7 @@ static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine
>   {
>   	struct xe_guc *guc = &hwe->gt->uc.guc;
>   	struct engine_activity_group *eag = &guc->engine_activity.eag[index];
> -	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
> +	u16 guc_class = xe_hwe_to_guc_class(hwe);
>   
>   	return &eag->engine[guc_class][hwe->logical_instance];
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index afd8cc7bd231..1ee4f2434876 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -985,7 +985,7 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>   
>   	memset(&info, 0, sizeof(info));
>   	info.context_idx = q->guc->id;
> -	info.engine_class = xe_engine_class_to_guc_class(q->class);
> +	info.engine_class = xe_hwe_to_guc_class(q->hwe);
>   	info.engine_submit_mask = q->logical_mask;
>   	info.hwlrca_lo = lower_32_bits(xe_lrc_descriptor(lrc));
>   	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));

