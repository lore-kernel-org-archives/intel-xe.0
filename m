Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BAEC4707B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 20:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029F910E693;
	Fri,  5 Jan 2024 20:25:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED2E10E693
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 20:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704486319; x=1736022319;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1g3DxU6zVY4cYp/cwnaekLj/bQlc771SvoRAUEL9kMw=;
 b=PKjGi37HSsSlyt86dk3AWC8PWanTkK9qwLD46G3dgyhLrxfCUmuYtugg
 vrOEHs8bAyY7PdzQX4zXYV7xzTJwp2Wg5/mNsHpwC43TA3mWxo701Ydxz
 JVfA0RuNrUtpKCRKJFqXwRTQGjEoRu3EqyPrTYO5WIqH7pft6VXx0Wpwl
 uR+HS7uON6c5zyUKek8fgiSHLEfjE1YquFUN2udPRSqOOP2l5nN0G2Vut
 0/+zgqOtqJhFNqbvDWQWg3sZk/hMnLNyckrw0nSNS876OddM7YoiGOK0M
 0QW+P4x/t3J5XW1VnVOxVGigxpHoXOXdJxPEFQdNaKh8i3cGYccRjrbU1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="397304316"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="397304316"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 12:25:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="784294015"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="784294015"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 12:25:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 12:25:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 12:25:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 12:25:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eG+i9v3k4PblgAUnRuYZyFKS3QgkKlETeMm9Qcq8SqpoyRY+FxBkqxHBexypphRkEYmekDykoO4zx4AXkK3LJsIuUr2z/+y7YklnEJV6w4492ZV4bWd32ej8LRCb8+fTSQnr33RXKZVXonWG3yTEiRuJv5w6e09XjcPT9mgmt9GJL9Bf+0NlCdvJTgAsG0J6EbY3L63HAs6k3beM9KyTlyWU0VOizlaPgoV7PawUMVFjEE9yE+eXUzoiTecWgAV1rgNghKntow3VywrgUF1jiGi96dDOM3Y4hPjbHXBaz51G4xeCe+cjjK9IZJdj0HePoLa4LICMxgztkveBqZpXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8vXrNvCdXGk7hXPK94lwgaKyBRKT/oGk931UqUg4AI=;
 b=mdUlgO0RMapWzO2nThtYP8C/QTO6X/AiG6nei6tw94Jb1AC5e6X6EeUoMAmTx31AG94B4uouQd+JxaoXM3yz6M+WJCB7rc/znmjH599BquMaDncJTKb9bY5X+KM3lndo9UFxN6J2PvBNFFJQxBcHAFxu6ujDqZ1tLUnpPdP3jc4nIu1Qo7rKeRhXR8Wj0pFhD7scXYruPsUAB11v8YNDtknWLs5FOkSWlNkp6PcUzEF9SVGB0JZ1BQgsF1Vz/wyuec5PN3GD6Hlr4XiTdZyJr/Ja3+PThBNS9oudN+S3/WjpSnuZh+/B7IO8vaWPqwdtFh80zlMt27Sg92NvAUmrWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by PH0PR11MB4920.namprd11.prod.outlook.com (2603:10b6:510:41::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Fri, 5 Jan
 2024 20:25:15 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13%7]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 20:25:15 +0000
Message-ID: <9d34d45b-9996-410a-a676-6c4aaecec295@intel.com>
Date: Fri, 5 Jan 2024 12:25:13 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix compilation without CONFIG_KUNIT
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240105171947.321-1-michal.wajdeczko@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240105171947.321-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|PH0PR11MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a0add4-ec37-4c4f-42b2-08dc0e2c6d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NSZksFi6s6KzSoSSAD2d8G6pKJhRaq6RJkkcQhsKHLnDsRUO/nrjOFR7st29HgHH9ol8RVVPcz4Egz+HCIp31XqGtDzcV8d0cUxFXF3tl5oKCK2XU7BbbSmPUYRvYAZQXscBYwba961EYJs44VpUSdZ+Y0Mb+Ip0A5M92uqkfnpSIYjstMEF4ZmmEgyMZ1s1OqnX0JWiYJYxdUoG5oDX4RUn7JC7SYi5j9ruFi+Be0g+bY/5B+C+yAMNiH48FVburkcqSCusXk4oH3x6jV2uE0whNPoTCKT5FiWJE8bxUCMZsLq62Fr7iWMFBosnZug6CHxALPdxPL0qn/DoNyKs4n59dz2Foo69mI13aI9VybCEm+HIG7f9Jgyf6ECgtT1VLBQzFVc1Mmr/4r/OsnRIBQmnohbgqCJHz8wffy/mcRHJFb8yT3uE3IpwX4fAGxSLzwjZwWogFQLc3zzD06SzXQ+0WX1sVNSjaop7gGWw+lxJmZLLEMblQoo0siA7+P5Hhbi1PpKRHW/FRI8rnPtESl1QvnacJJgs9ILB+v8gVrA3bwPV3UihkRfH7YG57LMsHFE9aPHjBRbRawEcFaDEgnloFoEgt5KLtu+1SvFcu6GbFxYcjoH28pif8bzd7lXJgJuBZg8ZVfw+z2BqbQg4iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(39860400002)(396003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(6486002)(316002)(8676002)(8936002)(66946007)(66556008)(66476007)(82960400001)(83380400001)(2616005)(5660300002)(26005)(31696002)(41300700001)(86362001)(36756003)(2906002)(31686004)(6506007)(53546011)(478600001)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1VlYXpXajFVMldLQkZMdmhXQk4wNUdNT2N2WmlnUEYwb1lSS3A1N0VySHNN?=
 =?utf-8?B?NmM2aHlQK0xCS0h6b3JCbTRwSUh2alRYaXBUNkdXM0IvZ2tqbzYxeUducTM5?=
 =?utf-8?B?VzNGTXV5V3FRVWl5NjQxMjhna2NXVU0ySDBkRTg2NFVlTXpvdzJ6V2RTYk1m?=
 =?utf-8?B?dXltaUZON2NnYlRRVzNYbGpVa2E2WTR0ck5QZG51emJLd29yNWhEdmVEa2E0?=
 =?utf-8?B?ZGR0YUFlanQrejF3ZFhsMEpGQmFXMzJXZi9WTys1VWtlWTFPNjF2MU1NQW1Y?=
 =?utf-8?B?Yk1tODFJbG4yUjZCSzNnSHZkT00xQnZFd29PT0RMR3dXQzhGbEFZdkxyaEVl?=
 =?utf-8?B?a0V0SjJEM1B5T0wvZWNYNGt6dU1qY1pPUXBZbFVWV0JDK3daNENKaXRMY0Rr?=
 =?utf-8?B?b25zRzQxeTRzOVBDK1lESFZDRVhjemlEcFA1ZW5sTWgzbkM1ajNyWnEyZ0ww?=
 =?utf-8?B?RFZiM3ZZRTAvWDlzYnVsQTZBalUycGQrcXlhSFdKUGtLUDhEblRFR3g2am05?=
 =?utf-8?B?UFc1RC9IQjU5NUZOTlF1a0xzUTY1aDk0N3FzV0ZOZ0I3NXVHeWNaL2JwUEpy?=
 =?utf-8?B?TlBCdGQ5eDJIL3lUTU1id0wrV2F5Mjh4YjA5WjJnYlNlVGsremVoZmNMUnF2?=
 =?utf-8?B?VzJKK3l5Sjg1UVdDQ1BqZjY2RW5WQTRDUURaZ3RVQjM5RWJIL1p3bTZabkV2?=
 =?utf-8?B?dmVEWUg1d1k3WXNKYTlZSUhhTElIY3ZnMUpwZHdXcFVQclNKbmdhc2RTME9D?=
 =?utf-8?B?RDNYTFVlYnMvV0hYZ09BQzY3WUVPMzlkQUFJeWhoaFpYby9saUpmL1g4cC9G?=
 =?utf-8?B?eWlVWVlWN09TZEtEUnVMVHpvWVRjVU1KS0lyRjdvMUx3Y1pkdElIbGE3Ynlv?=
 =?utf-8?B?K2U3UFJvZndXT3JqRGMrMG5ZOHI1UUVSN2txNGhiN0hsdDFXNnlzL2RVTllF?=
 =?utf-8?B?SFlTTXBxOVNUSHpxTnZqbXpaZFpCbGlML29JcWs0NU1pR3A5T3pxVGNhU280?=
 =?utf-8?B?SjM2OWpCZnFPeEJneUdzYTEvY0YrM2JNNFBhV1docjdzYy9GRW1tTkVXeHVL?=
 =?utf-8?B?NlBUY1pxeGs4cVVpcDhZUXc4bzI0OHdSZXhyRjNudXozcXA4NGtwb2pmTXdN?=
 =?utf-8?B?N3RlSElVVFJRd0YwUm5XemFaNnRVVVZidEtWd0xWeHlDNWhJNFl6RENWL0Er?=
 =?utf-8?B?Q2RUS3FBRzZNdWFFRlNkWTF3QWorYmNmTFFuR2VUUGpGVWZDdnVtZCtQZUY2?=
 =?utf-8?B?MGZ5T3EyK3QrU043Wk1DanA2SUYvSVNORVQ0alpRMENwWUtwV3k2eTJBcDRt?=
 =?utf-8?B?N3dvUWVHZTJ2L3FTRmFQc1llWU81NmxrWXIvV2orNjlyUzdwTG9UNUZwdG5W?=
 =?utf-8?B?ejFFNXRRSG9ySjY0MlJqQkQ5QTVENjA4S0hnWXZ3anB2TEdqeWZKcS9HUkVE?=
 =?utf-8?B?YWE3MXlhVVpUZllCN29DdUt6cWp4RFJWY2dsWTRxcEtYM2tnWHl1UUZrZmNq?=
 =?utf-8?B?NUN6VkhoQzNXdXFSYW9rMzQya3VhM0c0cVEyejUxWGE2OFVPOTZFelJ2Sldu?=
 =?utf-8?B?YlpUSHdzMGNKSGRwZUp5Z0Q4MXFFMzZ3RjlIQWMxT0o4M2FhT04yNUYzenhK?=
 =?utf-8?B?akovZEZ1N0JiUS9qaXFDYjJqMWJrT1kwQStNb1ZwQ29PRGExV2M2Q0w5YTBq?=
 =?utf-8?B?a3VxdEFYTjVKN0dQNFlFTTcwWTUyZGQ4bXlvdWdxK2VXTlAxTHlHYUpDVS9j?=
 =?utf-8?B?V1RjSTNVbC9DaURTZWd6UmNnZG9OVVRyZm05SG56UVhLM2Z6cWt4a3o4ZEYx?=
 =?utf-8?B?UEdsdEc0WFNPblVQVXU3TXNtZUNlL0lIRnBRaWFKcU5WUTVGWVM1Ly9JNlNT?=
 =?utf-8?B?UEtTcC9vZkM4U0VudzZ2Z2ZucjY4OGw5ZVU5ZVovRjhwdUMxNysrOUo5eWZE?=
 =?utf-8?B?Rmh5NTdDUEFmZmJiSzJPMnQ0WHBVNVFTRjBUbFBEaEg1dDRoeGVmTnE0Z3FC?=
 =?utf-8?B?bWJHN3FBYmpqZlVSZlFOUjBvTjZkdWRaYVNBTXNsVkJVdnMvT2g1bXFTTUVE?=
 =?utf-8?B?VmpSZzhUKy94bVVrZ0hXRXFCK3ZSMGhDZndKNDdmbCtZRkhpU1R3Nzg1Z3N1?=
 =?utf-8?B?UDFuNjZKVzBvNHpsNGNrOEZhYlVDRDR1TEh0em8zcVhFeW1KMmg0VndSSGtu?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a0add4-ec37-4c4f-42b2-08dc0e2c6d2b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 20:25:15.5037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNUh3aXq7jifVXQutAIrrnDuByYy6NeT+MUX/rYlK0ycVYLnSf1PFkR8JaU+KMJB2wS1htLqajHNZfVixEJTJkwercXeF0lQSay/hKSGs80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4920
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


On 1/5/2024 9:19 AM, Michal Wajdeczko wrote:
> It looks that declaration of kunit_get_current_test() was
> available in xe_guc_relay.c only with CONFIG_KUNIT enabled.
> If CONFIG_KUNIT is disabled we fail with:
>
> In file included from ../include/linux/build_bug.h:5,
>                   from ../include/linux/bitfield.h:10,
>                   from ../drivers/gpu/drm/xe/xe_guc_relay.c:6:
> ../drivers/gpu/drm/xe/xe_guc_relay.c: In function ‘xe_guc_relay_process_guc2vf’:
> ../drivers/gpu/drm/xe/xe_guc_relay.c:863:52: error: implicit declaration of function ‘kunit_get_current_test’ [-Werror=implicit-function-declaration]
>    863 |  if (unlikely(!IS_SRIOV_VF(relay_to_xe(relay)) && !kunit_get_current_test()))
>        |                                                    ^~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/compiler.h:77:42: note: in definition of macro ‘unlikely’
>     77 | # define unlikely(x) __builtin_expect(!!(x), 0)
>        |                                          ^
>
> Reported-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Fixes: 9a2c2ecb1b77 ("drm/xe/guc: Introduce Relay Communication for SR-IOV")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_relay.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> index b772088979bd..c0a2d8d5d3b3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> @@ -9,6 +9,7 @@
>   #include <drm/drm_managed.h>
>   
>   #include <kunit/static_stub.h>
> +#include <kunit/test-bug.h>

Compile works with this fix-

Tested-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   
>   #include "abi/guc_actions_sriov_abi.h"
>   #include "abi/guc_relay_actions_abi.h"
