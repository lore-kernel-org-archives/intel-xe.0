Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E404C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 06:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED4610E55A;
	Fri,  3 Jul 2026 06:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5Ow6a8v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B68410E55A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 06:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783061070; x=1814597070;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TMbIV4d7oxMOHJ5sZSbJFcGNWwLf575aFg2M2Dw3UgY=;
 b=g5Ow6a8vRFFS4mWCwxAs1Qrkchp2GGf9Ob3IowrX7jfzElFLLPZlsZxy
 8fInxxlwolmMQwVITwm3cf7rciObDFQ32hO3iKagcxsucVW8hZU6noraW
 EJzaAQJICMwxJjFOVnaUUkijzjJXHZkUhCLwN1hipydHIADt0kbXZKYIB
 fODvh9UZeRThnBT5+1qtCTrwWpx8dVTww/9I63TkIxRHRbA/uPsYuJ/VY
 HuTlQlcVoxbMoJvLH6q88qbW/SzkSqY7I8+VGIJghv8cZCsLHIwEvPnhr
 0t7ApD05HAplh690Y2ezgeiRWynEweNFrtO8TGEyo0gBUF8NAnnueBHAy w==;
X-CSE-ConnectionGUID: QGIXn93OS8y0ChQs43+VTA==
X-CSE-MsgGUID: HlETq5JMQjyklZI5MDglDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="109357999"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="109357999"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 23:44:30 -0700
X-CSE-ConnectionGUID: nUuwX6HiQve/ZBUsoaUmvg==
X-CSE-MsgGUID: hI2Wr8TzQYeipmgMEmS5Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="251312446"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 23:44:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 23:44:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 23:44:29 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 23:44:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eI/PuGzqlLKQiXJISSoy8i/fRbFJuIYmp801Y8B21L1NUi8EJiRH8heoRC5Tx5VybyLHGcyZz8Irwl94Hd7NdU4iZuztDoO25CzbXLpIHA7kyu/QeGEWSzrYKLACSgTVBiBsQb66sZ0dNtK1nyEahuw2ABRqi4Y7qYFN/1zIyu3JN4RHuK9qMizBCsvzn29W349GrhR+S/tQiPpa3T+iUsL8C5PY+JX/Ez3VyWxei2r0knFfC1190GLti3XG0tmLwSsqRUloRbW88Pmy9JCd4cGsB0G/XdpWRmG9vAelLobNjXc7RA+pZak9qogT+7HAnClY+kDRCj7pL/wKtO78nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMFJZSxqHW5YAvtQI2NvUkPTXZrQ0dvIa0vkNKkrfNc=;
 b=FT3kvWMImSC+isadTuIvNdiBi5LROFzbVlq5r9UX1kqnpHEntqKPoubaGFGzZgRmOUXSg3L5yZCc9TL0TRmFi8MjRJHsvN4391Y9xjf6chYXK+Wp0wkvGTR3CMJZp1KlMa0RRzvG9HniH0sKazkVe6gOnwWj3oKNjGqftreBB2b3vI8q9w6ZIUbm8IRBOZ9UKpsgu2KOYv2D0f92FDH18bJu2t9KICg06AANi/xq6GNWqOFrFFZ5Yr6vsNuFaMXOOZwO07vZU4e08rV2jjeRBqwUn7cMjrWJSltJmIuZl+4BeouGrfxCd+K+fbwzaSPUZPbtN9maRTDJGoNOeeDzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 06:44:22 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 06:44:22 +0000
Message-ID: <54e7ce32-2879-4af1-983c-7e37a66491c7@intel.com>
Date: Fri, 3 Jul 2026 12:14:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside pm
 block signalling
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>
References: <20260617082104.610620-2-tejas.upadhyay@intel.com>
 <e8e282bf-c7e5-4fe5-b228-cddcea4f8b35@intel.com>
 <DS0PR11MB87184F6177D8A066EFD592F081E42@DS0PR11MB8718.namprd11.prod.outlook.com>
 <7a8afb2e-0713-4f5d-8790-c96a330b1101@intel.com>
 <DS0PR11MB87186743D50FFEB027D2489081EE2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <DS0PR11MB87186743D50FFEB027D2489081EE2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0134.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::17) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c6ce897-cf07-4f3d-c9d5-08ded8ce8395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|4143699003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: UHSfn+mltxOa4D0KFB/egExlbAD0pBey1j+kEZvqVlESYVrOyc9dL/ycUZSY24a4/a8PVCueLm0oQxJ1K3qhBlHLXymM9nhJs7QHofbiKY2oLp5azpd50ioV/UgMnNS1SUxNw/NeacUfwUilVNVh1RPO6bBXpEbtgX6iC3dee/RMtH9jxk/MDrE7vvjBmNicPAVAJUMLgs8+51bda9Q9XT19zroucSS7kYuBygLrQ6AeJNhStoX3BFabv+P5g53muyJq5g3chDA7YSm2fF8B1kElVo3ducNfqBZY1NDC8N1UPDVjAk3shuBKpfL94HN+/4Vi9mI0CRF1iufKN46wrXphrHRv2kXkRdw87y07VEjAvZRtveopQDcS/u53G2yQJGpaXUzIZ67Xozrgn2YHzD1Dvp1FxuVvXHgAf4DfYNZxu/37Upvv5Plihbu/sM5wblpFwBFbSjJbtRQL2mazsGNJprJa2FCfLpg+P03blEjIf2buoQZHhVZqOr7OQ88lmtias1dvYYrs+bjac80aoisWXYI3wr/6Kqt0SKAZQqMl6CmN+GGWkUwSpZr25rciLVaaXHEpi1dqGV2bpQ/GVDLZftuwp/zE+TSglKu8kYpjwpIuDIkFoCDEt69sQFOviYQF4qyggNcRoF1dd4sPdqJzz3G3nMxUNQPomeyVZLw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(4143699003)(56012099006)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2hKVzlKQXdXd0pWdUQzU2RCZXJTRUFPajA3MWVjVWhVaUNEZndWSE9lMlBL?=
 =?utf-8?B?MlF5WDJEUTVpYjhqcHFRMWV4ZnJ5VnFkY1BWalRnNFNjdWI3WS8vYTRjTDJJ?=
 =?utf-8?B?ektqTmRZRHJOREhoRkZIMnZ4U29HZ3JiT3FMa0krclMvc0trOStZWmphYWd6?=
 =?utf-8?B?LzFJZzZkZVVKNEd1MnFVbHZvOXRrOXZncTJSU0tPSkRPZy93S0FKS1creGlT?=
 =?utf-8?B?VTBjUnNYOXNucUVoeWpDdWpOdk9PbFgwZnVWYU9KdG9TZXFEckorMGxycnNt?=
 =?utf-8?B?SHo2K1JOVEUzeVkzaXpHRUpmeFVFZWdBZ1E0RzQ0bG8vMzVEYkZMWTZBM2dD?=
 =?utf-8?B?Sld6R1ArMVpXQWJrRWFjTko5ckc0c2tPWmxHeHdKc2lITVlCY0FhVmVseHQr?=
 =?utf-8?B?RHlReW5IaFQvTmRUaDArekVMRjF5M0ZsUGZhMmM0N2w5TDVWa0xZcHFBKzV3?=
 =?utf-8?B?WUNxd3FYeUMzZGdJK1NMTXI0YTVZb1pwRVhpQXpvQVUrVlYzV20zdGRjNEx1?=
 =?utf-8?B?OFZoUmhDWHhrYWF1TjZLd2ljblBRdTIzdjVVd3BEU0NTVE9xQUpHNnFJcEFY?=
 =?utf-8?B?R1FjVXJucFFZdXMyc0tLaElpRjlUNWtmakNhT05FMC90QkwwNUlmVkFwRlNx?=
 =?utf-8?B?c2IyQk1BcUp4clRzcWVTdFpMNldPUzhDdGptM2s4STlPdU1mc0s0YkROUDFW?=
 =?utf-8?B?RUphY1docVpBODJjYWhiMmR4VG4wdmxzZnh6bXJRK2F3NXlqbE40WFI1cmk5?=
 =?utf-8?B?bkdmNUVqb2hPZEFLMG5UeXViT3JHVFp2dmhqaHFORi8xNkRVakRVcisxVWQ2?=
 =?utf-8?B?SVl2NUE3SmhTcmxYQnhoeXlOQXVDZmNpNVhxcW9GWTBldjZsUjJ1NXg2eFdE?=
 =?utf-8?B?LzZWS01hN0pjMWNXQzVuUnFBZHhUUlpucjM0M1BWRlYwbmJ4dldqL3pSM3Ft?=
 =?utf-8?B?S1MxajNZWU9Tb1pOUkUvVjBxNGNPWEZBSitNd1FCRGZkalVEMW85cEY1bDY0?=
 =?utf-8?B?OXdXL1dNRzVTNlF2UGZCeUtrUzJGNkxINnIvRXJETVlsNUUxbkxJRENvRXlv?=
 =?utf-8?B?OHJvUU83QXhwYkJVdVZXUThhWm5jcG5ERDBRYXJ3Sk9vOFdkaVYrT083eTNp?=
 =?utf-8?B?QUw3TnZ4aS9mRW5oSFk4amNUR3NqaSsxLzE5M2x2YzE3MXIwN0VNY2FZUzA2?=
 =?utf-8?B?aDhneG5ibytEaGFHNTVsQnh4N2UwQnVDZ2s0SURJeG9EQzYycUpYMmxsOWxI?=
 =?utf-8?B?L1g5eGlvZ1pDSHpFeWlnS0J1U1pwLzczbzVhZnEzWEFNL2h3Z096UUNLWTNv?=
 =?utf-8?B?RlJGMW82L3cxbWxYOXJZTk83MDQ3L1NCdTFFVEpXTGZRdUtseHJXMC9kVHJk?=
 =?utf-8?B?MzdVTEpvUVBRTjBPeGNxb0I0M1dvZTFyN0lvUzdaRG5vSXBVYUdvWEZTdXZx?=
 =?utf-8?B?S2h1aVBqTEpiODNxVUtIZDFVakhkeGp5N0ZWWUp3dXZRL3BwNk5YcFVCY0F6?=
 =?utf-8?B?WjkzSVRvd25ycmVhZ1lob2I5L0hqVkloQzVFQnBaRE5VUk9GdWlVdDA1M3ZD?=
 =?utf-8?B?VzgvMVl5MTF6NW1SSU1LYXk3bmlpTEF3TXRneXVkcUdVT3ZXRjB1YzNFbUdo?=
 =?utf-8?B?OHJKZDZhUVBEZFhObVFDMG55aUttUVd1ZWx1WHM1NGl2ZU5vZUpwbk51dHI5?=
 =?utf-8?B?Q2loYlZrTE9JRzdFMW40TlhwUVNkTTdja29yTVIweVEvM3REaXdpQUg5SGJn?=
 =?utf-8?B?RmV2TlByVHlwaGRrT2hlbklJeXVlcGF4QTAreTZKc2VsWU1rN3J4Vjk3TkZS?=
 =?utf-8?B?Y0tDSy84MWxrT0xqYnJMNlN4V2VuSUIvVWhNTEMybmQrRWRkQXUySzZPZndW?=
 =?utf-8?B?ck9aQ1UrcGMxYnNaaUhDSjNzZmFFZGtXRHRhcktHVUh1ZGRvWDI5aGhpWmhs?=
 =?utf-8?B?aVVITHpDUWppWi9TR2piWHJwc2JHR0hGS3lrZXMzSVV0clVNck40QUdSZTgr?=
 =?utf-8?B?NGw1SnhhV09ZQW9xYzB1Z3VYY2tQb3NmQU5lSkIxUzZNYW80UURRSU1ITXVD?=
 =?utf-8?B?dERxR09Xdy8yOXBiR2pPdzFTci9Xb2ZBUm1Wc2lYaDJmZ0J6RVNad3lsRDc1?=
 =?utf-8?B?WlBGUW5ZN1NFRUtkRzB0MjNSUmM1TVgwMUJHK3NkVWFYRHV4Y0x5ZGR5SE9K?=
 =?utf-8?B?YXlqQ3lqNlBVemZmQTd1NlhyMFhLYVlVUDVrMjFESzFJSTNySVZVMldic25y?=
 =?utf-8?B?ckVHZFdlTmZ5ekJ5MnBDWFIrOFc5cjNzRUgwR0VsUFVLM29CWFdlTGZXK2JG?=
 =?utf-8?B?eFVjajU2S1l1aXkwR3lWQTVLdDl6TnI3dDRQZFR4RTJOR0dVWUpkQT09?=
X-Exchange-RoutingPolicyChecked: T/2s5bWu+wN9y8/Xcc4xQewRtEzMHCsl6mdlC0jLHML18+apNLihF7C9kBu9KfyHdt5GXU4fIF/ifzPKHgF2BfIxbHSdvb7sB6dFQkEMWzPuQ9qnRsH6OjEW4gujlhDYYeyfHj4bgdriWySH80inVtoRe6//lz4iVZ6VT2MRxCJAbTde0bwa8z0E2276w7me3cVFEPs/UsybBZks7HE6K12hqkdDWOAcQ/W9nRb35W3z7t6Ewc4qPIbvFRvBz7mgscGf6ByLJ2dzrHBtu7qjHzkKQYxbQ1rExB18Lty+6+HbF3bfaZMDhQdmyo1N+IYzVQ/kL5dZGvKWwtwyxIrsSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6ce897-cf07-4f3d-c9d5-08ded8ce8395
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 06:44:22.0011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJmS0eqC7t5RaPBeNprB7iIZkVoANb5F85Hq7QidH8AO00A1Y4m9Yno9LT8UcVzHT8yMPAJHHJydFvAJCw6yLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
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


On 23-06-2026 11:24, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: 17 June 2026 19:43
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>
>> Subject: Re: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside
>> pm block signalling
>>
>> On 17/06/2026 13:11, Upadhyay, Tejas wrote:
>>>
>>>> -----Original Message-----
>>>> From: Auld, Matthew <matthew.auld@intel.com>
>>>> Sent: 17 June 2026 16:55
>>>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>>>> xe@lists.freedesktop.org
>>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>; Nilawar, Badal
>>>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>
>>>> Subject: Re: [PATCH] drm/xe: Move drm_client_dev_suspend/resume
>>>> outside pm block signalling
>>>>
>>>> On 17/06/2026 09:21, Tejas Upadhyay wrote:
>>>>> A circular locking dependency is reported between xe_pm_block_map
>>>>> and
>>>>> dev->clientlist_mutex:
>>>>>
>>>>>      &dev->clientlist_mutex --> &vm->lock --> xe_pm_block_map -->
>>>>> &dev->clientlist_mutex
>>>>>
>>>>> The dependency chain is:
>>>>> 1. xe_pm_suspend() calls xe_pm_block_begin_signalling(), then
>>>>>       xe_display_pm_suspend() which calls drm_client_dev_suspend()
>>>>>       acquiring clientlist_mutex. (xe_pm_block_map ->
>>>>> clientlist_mutex)
>>>>>
>>>>> 2. drm_client_dev_unregister() -> drm_file_free() -> xe_file_close() ->
>>>>>       prelim_xe_eudebug_file_close() acquires discovery_lock.
>>>>>       (clientlist_mutex -> discovery_lock)
>>>>>
>>>>> 3. xe_vm_close_and_put() acquires vm->lock under discovery_lock.
>>>>>       (discovery_lock -> vm->lock)
>>>>>
>>>>> 4. xe_exec_ioctl() holds vm->lock and calls xe_pm_block_on_suspend()
>>>>>       which waits on xe_pm_block_map. (vm->lock -> xe_pm_block_map)
>>>>>
>>>>> Fix this by moving drm_client_dev_suspend() before
>>>>> xe_pm_block_begin_signalling() in xe_pm_suspend(), and
>>>>> drm_client_dev_resume() after xe_pm_block_end_signalling() in
>>>>> xe_pm_resume(). This breaks the xe_pm_block_map -> clientlist_mutex
>>>>> edge in the dependency chain.
>>>> Is this not just hiding the issue from lockdep though? The
>>>> pm_begin/end are not real locks, they are just there as annotations
>>>> to teach lockdep about the hidden pm dependencies. For example, any
>>>> locks you grab in rpm
>>>> suspend()/resume() you are not allowed to hold when waking the device
>>>> up, otherwise you can potentially deadlock. So here moving stuff
>>>> outside the annotations probably doesn't really fix anything, it just
>>>> hides it from lockdep so it doesn't complain.
>>>>
>>>> The above looks like it's complaining that clientlist_mutex is held
>>>> and indirectly ends up waiting on something pm related, but the pm
>>>> side itself can also grab that lock? That seems like a legit
>>>> complaint and should be fixed in the upper layers?
>>> Then it touches the eudebug subsystem as it most likely come from eudebug
>> teardown, since drm_client_dev_suspend/resume doesn't functionally need
>> to be inside the pm_block window (it just blanks/unblanks fbdev console),
>> moving it outside is the minimal fix imo.
>>
>> If it's called in resume() or suspend() and it grabs clientlist_mutex then it is
>> already part of the pm flow. Any locks you grab in here are part of the pm
>> flow. The annotation here is just recording that dependency. If in the upper
>> layers you then grab that same lock and then do something that depends on
>> the pm flow, it has the potential to deadlock.
>>
>> The above seems to be saying you have some kind of locking inversion with
>> clientlist_mutex vs pm flow. Moving that lock outside the annotation likely just
>> gets rids of the lockdep splat, and is not really a proper fix AFAICT.
>>
>> For example, you grab lock A in resume(), but in the upper layers there is a
>> path which can grab lock A and then end up indirectly depending on the
>> resume() completing before continuing. That has the potential to deadlock,
>> and the annotation here will help detect it.
> Before (Deadlock Cycle)
> xe_pm_suspend()
> │
> ├─ xe_pm_block_begin_signalling()   ←── pm_block window STARTS
> │       ▼
> │   ┌─────────────────────────────────────────────┐
> │   │  xe_display_pm_suspend()                    │
> │   │    └─ drm_client_dev_suspend()              │
> │   │         └─ mutex_lock(clientlist_mutex) ❌   │  ← INSIDE pm_block window
> │   │         └─ suspend each client              │
> │   │         └─ mutex_unlock(clientlist_mutex)   │
> │   └─────────────────────────────────────────────┘
> │       ▼
> ├─ ... actual device suspend ...
> │       ▼
> └─ xe_pm_block_end_signalling()     ←── pm_block window ENDS
>
>
> After: Timeline of Suspend (Fixed)
> xe_pm_suspend()
> │
> ├─ xe_display_pm_suspend_early()                  ←── BEFORE pm_block window
> │       └─ intel_display_driver_suspend_clients()
> │             └─ drm_client_dev_suspend()
> │                   └─ mutex_lock(clientlist_mutex) ✅
> │                   └─ suspend each client
> │                   └─ mutex_unlock(clientlist_mutex)
> │                                                     clientlist_mutex RELEASED
> │       ▼
> ├─ xe_pm_block_begin_signalling()   ←── pm_block window STARTS
> │       ▼
> │   ┌─────────────────────────────────────────────┐
> │   │  xe_display_pm_suspend()                    │
> │   │    └─ (no more clientlist_mutex here)        │
> │   │  ... actual device suspend ...              │
> │   └─────────────────────────────────────────────┘
> │       ▼
> ├─ xe_pm_block_end_signalling()     ←── pm_block window ENDS
> │       ▼
> └─ xe_display_pm_resume_late()                    ←── AFTER pm_block window
>          └─ intel_display_driver_resume_clients()
>                └─ drm_client_dev_resume()
>                      └─ mutex_lock(clientlist_mutex) ✅
>
>
> @Auld, Matthew what is the opinion on above redefined approach, does that address your concern? (Note: This is based on latest drm-tip)


I agree with Matthew's concern.
Moving "drm_client_dev_suspend()/resume()" outside the pm_block 
annotation may only hide the dependency from lockdep. It does not change 
the fact that "clientlist_mutex" is still acquired as part of 
suspend/resume flow.

For this trace, the real problematic edge is from eudebug close during 
unbind:
           clientlist_mutex -> registration_lock -> discovery_lock

Lockdep already knows:
           discovery_lock -> clientlist_mutex -> registration_lock

So both paths create the cycle.
I think the proper fix should be in the eudebug/file-close path which 
should avoid taking "discovery_lock" while fbdev/DRM unregister locks 
are already held. One option could be to drain/close eudebug before 
display/fbdev unregister starts, or alternatively skip eudebug 
file-close handling once eudebug teardown has already been marked closed.

~Arvind

>
> Tejas
>>> Tejas
>>>>> The drm_client_dev_suspend/resume calls are safe to move because they
>>>>> only blank/unblank the fbdev console and don't depend on display power
>>>>> state or any operations within the block signalling scope.
>>>>>
>>>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>> Cc: Raag Jadav <raag.jadav@intel.com>
>>>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/display/xe_display.c | 3 ---
>>>>>     drivers/gpu/drm/xe/xe_pm.c              | 5 +++++
>>>>>     2 files changed, 5 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
>>>> b/drivers/gpu/drm/xe/display/xe_display.c
>>>>> index 810d93fefcbc..ec65dcbc3fdc 100644
>>>>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>>>>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>>>>> @@ -304,7 +304,6 @@ void xe_display_pm_suspend(struct xe_device
>> *xe)
>>>>>     	 * properly.
>>>>>     	 */
>>>>>     	intel_display_power_disable(display);
>>>>> -	drm_client_dev_suspend(&xe->drm);
>>>>>
>>>>>     	if (intel_display_device_present(display)) {
>>>>>     		drm_kms_helper_poll_disable(&xe->drm);
>>>>> @@ -461,8 +460,6 @@ void xe_display_pm_resume(struct xe_device
>> *xe)
>>>>>     	intel_opregion_resume(display);
>>>>>
>>>>> -	drm_client_dev_resume(&xe->drm);
>>>>> -
>>>>>     	intel_display_power_enable(display);
>>>>>     }
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>>> index 99562f691080..d00c620d0926 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>>> @@ -10,6 +10,7 @@
>>>>>     #include <linux/suspend.h>
>>>>>     #include <linux/dmi.h>
>>>>>
>>>>> +#include <drm/drm_client_event.h>
>>>>>     #include <drm/drm_managed.h>
>>>>>     #include <drm/ttm/ttm_placement.h>
>>>>>
>>>>> @@ -177,6 +178,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>>>>     	int err;
>>>>>
>>>>>     	drm_dbg(&xe->drm, "Suspending device\n");
>>>>> +	drm_client_dev_suspend(&xe->drm);
>>>>>     	xe_pm_block_begin_signalling();
>>>>>     	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>>>>>
>>>>> @@ -219,6 +221,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>>>>     err:
>>>>>     	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
>>>>>     	xe_pm_block_end_signalling();
>>>>> +	drm_client_dev_resume(&xe->drm);
>>>>>     	return err;
>>>>>     }
>>>>>
>>>>> @@ -292,10 +295,12 @@ int xe_pm_resume(struct xe_device *xe)
>>>>>
>>>>>     	drm_dbg(&xe->drm, "Device resumed\n");
>>>>>     	xe_pm_block_end_signalling();
>>>>> +	drm_client_dev_resume(&xe->drm);
>>>>>     	return 0;
>>>>>     err:
>>>>>     	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
>>>>>     	xe_pm_block_end_signalling();
>>>>> +	drm_client_dev_resume(&xe->drm);
>>>>>     	return err;
>>>>>     }
>>>>>
