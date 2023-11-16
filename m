Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1103CC54E76
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 23:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B882910E040;
	Thu, 16 Nov 2023 23:04:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D7710E040
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 23:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700175893; x=1731711893;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ivGGVMzF4oM+YZX/9OuVs8TZvFTcVu4Bqge18uwdizY=;
 b=LkPP8X8gZ1Z6W56UUV/Dw/5/oX/4AfSNj2UWPfl10dEkq1mOOViBXIFC
 SGWXYys9bMeFqQiaDwGdN4AJf1AEkcuAy8zWZnKD/plDmlddSFqEVuRPo
 2bUNYvILf7LJ31Wy1INA5EmGc7ONbcPCK5W3gbUsAMcL+Xy+V84IShjgV
 fmjMvH7CCupJqXq9IZJ7ek4EoQHoOlboH/eDJ6LbIjpdje4p5KJxye0S9
 EY2hEtTKKeUQJfq69WMbREeZ7ekevUcjkEx4ehDnB3kIk2sCEFt+mpJ1F
 g+0AXtNTQr2fOSqWQA8fcXVQPQpRu65C7tUsF+K32xSMH+neEb5hD9RF+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="371377252"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="371377252"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 15:04:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1096928944"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="1096928944"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 15:04:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 15:04:52 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 15:04:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 15:04:51 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 15:04:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEJYV05a2Uklfkfol/Tg/2z6/rJKXGK38TibMJ6if0/mXCZfqYMskUCPJphPdDPdxoQDiQTh96xn7mMgxdTVpYZlsbPuBAczhL82iwIa8/8ds5xct3KzMJwPhB9scdD7KZPHa/f1r9gvc89WlXlmKY3UwO8K08gBqh0+6pfpk2gQkW3v16sPurfkK+Jq3nrWlKor7dat3jz1vnmTx4yZQp5SO9C0Gq5BmmGj/d8U06jBjcuhBrusmzfuzlZzk93JH70Qa1dQJI46pHaxchpyinZ1k6TeSRvQPkcErvfSL/8BygRWLNFtgPQ6zZ+8mMJCOnzc9/vO2dMJGSY12EsBKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQJVSm3DOq10jQ9PEY6rWG7Gdku62HI3g/hmED/ycTo=;
 b=enalBS32l3ogulZ8o/EpccfVJFuMLNmLdEziu2Xvi/UevILZVaTRNNgZfokXpRf1SqgziimZMMFj8txyiZQTp66q4yIQpt6Aw8G5UQd9XV/Sbx3RhDVK3wUwPj4P2tI6W6sQQdynXMzOIBrnipmo8sYD12MpwuxVQdxrlojrVLjdIRuau+c6OHttnL8dZsgr4QvTmq1KZp9BMnwgWKnxewRRp9ePzoy7s8j6M01f8U30Y45NRRIDe4Jg53FyItKufNFNE9mL7Vu4FAFx7LnQe8x3mGjWUeBdzl8dQelM/lUzhdpPBpZLvmgn1kkQnDPA7kQNpQ1Uqms7tnTzbW/NuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 23:04:48 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 23:04:48 +0000
Message-ID: <c3f60720-241b-4293-8bae-6f1c345263ee@intel.com>
Date: Thu, 16 Nov 2023 15:04:46 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
 <20231115004615.2424177-6-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231115004615.2424177-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0007.namprd06.prod.outlook.com
 (2603:10b6:303:2a::12) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9a371f-4d50-4047-235d-08dbe6f86e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XUUbsQf6/CllKHDaDGkfBtgaUvBxSl9EBOc0zCAllxSKCSicSwg52o3ZWlgehDF98hIDL6Ua6OE3soYJEkyqVUO4anLsmUnYXkatnxW6irv5RziFCHXSbhC7mxp590F/stw2F5bZCWNDipBrMPGMAxd208NDyhHfEeqcuBI+M22URfxMBMFELbwvL0Tx8k6z1yOc1ru/VZPltT9vXcYfyrt/KBsLlorqhZpe0o07i8TdYqGOsDVNNQwVOMrgfF/tAM5TAIDcXHe/N5tPjDo+NNMx9XVZ7MBmQh70rUhuN7f4clKXJ5b5GCchkk0XzHyfn0kPJOimosgTUSS7wYF2IQdi8B6opL7O9Ot7VO353ONAQUdoVwqcCNQdGy4kJRnDHo+P+P7xQ/5xc8Z/HUIKpd9FgIJ7RtFljowVg7fn0roC82/0+4qfwLdMWQFM8yWzRus29zV+Nu6XbfU4BrQrTgYxlJ9Tqscs9szg3p2La9+RrEY6fqeoNS71alIEUpvw7BoOFhNvDiXSYDHqFSjhUWrQYo/UsSUXrwlGQbK+7yYTw/K5+vC4X4Xy7pmYPk68cIREaebjYFYsUqUcW738wfLM85dkPU3ppT9UxGUadgUBsxX21goq/OPsXCycg0cS0uieZWv2WOwmLxg0xPNsqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38100700002)(31686004)(83380400001)(82960400001)(107886003)(36756003)(53546011)(6512007)(6506007)(26005)(478600001)(2616005)(6486002)(86362001)(5660300002)(41300700001)(66476007)(66946007)(66556008)(316002)(8676002)(8936002)(4326008)(30864003)(31696002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVRTNTBoazhYUTlTc0VjZWR6Y3luNGZhVXpJSTMyWkZHYURtQWVpNFg2citk?=
 =?utf-8?B?NjBkckw3eTE1RzIwRS85SXlJUWljOFJPVS9WYnpERXhZeXVrdCtYclFqNity?=
 =?utf-8?B?dEQ0WEpCNm5rRGhyWWRNb0tqRExxOXNZOGlud05NTXJVMVVaSStxWkVSTHJw?=
 =?utf-8?B?SEU4M3loNVVLZlZobVVDa0xsNGNSSHE2RXQ2b01RT1k2SXhSVlZyWXhCc0dS?=
 =?utf-8?B?RkdPRERQb1M1M0toTDRoYmtMT0lheVhmaEkwRWtMMTNTMTNmZnFNMTJoQURB?=
 =?utf-8?B?Zy9ZYUNVUHBSQzZieXpaeHNZUFJDWjg4Q3FCM09TQ3d3M0hzN1pnRkFVVG1q?=
 =?utf-8?B?cTdEdFcvamNrTkxEdmhCcU1HRFhXRTNBM2RPbXY3SXQyWXVHMEszOURGU2hy?=
 =?utf-8?B?T2dMQjBvbm4yWUlnNERKb3djRk1DQ0kwMWhsSFl3T2tyemk2eGtsdDdFSE84?=
 =?utf-8?B?VHlaRlpTWXlrZE9UeWh2ZVVWYXNnc21yOElIRm1NU1pONzBsdjAvUTV0V2Zj?=
 =?utf-8?B?a3NjNi9CbUpGOEtvTFZsem1BLzFXUW9NcWpGZXVZNEpnaUQySXJZWEtBQ0Rp?=
 =?utf-8?B?QTVZN2F6cFlrUUo3ZU5iMHJVQ2xDWFFoMjBJZmxCdnU0Y214QnBjUWVqalhX?=
 =?utf-8?B?ckFWMUk5TE1DMnRST2d2VEYybDg4Si9vTUJRN3hNSzNidEV2Vngwb0JUbjNJ?=
 =?utf-8?B?UThZcTNxS0YrM3BlamozZW9kS0NkRDRjVElCRHoydzExRTNYNVFJMjZFUCsy?=
 =?utf-8?B?V0czVkJ4a2VtYW92V28zQm5MWVFFUEdYN2hJZU5rbFQwR3ZPOFRQQzBGWVhx?=
 =?utf-8?B?WEs0NUdJYTJHRENFSU5velRKOGxJOE01SllFbjhhYVYrM2dPWGZiNktzQjhH?=
 =?utf-8?B?RzJMMUJwb0VYOVZXNFVyM2NKNkhmSHlBamM0OVhwdFVBcU9nSUVyODJYaDRt?=
 =?utf-8?B?MmxXNFdmOGdlWUFobHNJbXJNR1p3Ti8xQ0o5bGY5LzJEYWtqVnpyYTBSZ2JW?=
 =?utf-8?B?Y1BBdjZDUkFiVXZOSmJGRU1uT2szTU1zVFpJLzZNUDdpRjQ0aVNvWUFUZmJZ?=
 =?utf-8?B?RGkvTFpOSnZHZTdoYzZCME5QUkl6dzF0MG5hMHdFYzZKY1IrSGtKZWFlMVpZ?=
 =?utf-8?B?ZVhHbXB0QVVUNWJjTzlIUW51OVY3cElZTFAzcy8rYjNvejF6a09DakljYVpE?=
 =?utf-8?B?amZvVnVtS0dpR1MzZmsxeDlJVENsOTlQVEFNRHBTWU1VZmtwYzRybE05cjhS?=
 =?utf-8?B?dEwwNjdQZThvclRxVmMrcFBqT2tRWC81UStYU3hkcWN4UDMrQUFZZlQ2SUZj?=
 =?utf-8?B?ZHBmWG9GTmlzZ0pickNBY0tHU2N1MnFxajVmRTl3T3NlS3FwQnNGYUtyYkIy?=
 =?utf-8?B?THFLaUdUK3dHQXNEMFpZZWpmZk5HQlkrVHZISm5wVEk2aDdFTnJyZ3R4VW51?=
 =?utf-8?B?eXZuVUFDK2hzRHF0OGtCRGo2azB0RUJRQUVnc0FvcVB1NVFvWm5XSStDZjc5?=
 =?utf-8?B?Q29HVEpNd2FOaG9mcE5LWE9sSnVhbHluYWx6OERjODE0alJKZEVtaEw1d1hK?=
 =?utf-8?B?YWNxTE5qV0RVRUtveHVFb2dJR09oRVNuRk40K2tZbzdRL01MZ1JPN2l6T1dL?=
 =?utf-8?B?eHBsVGhOLzkzTzN0a3llZWJsalA0L29kME5ZZVp6NllVczVwS0ZyTWtUMUhX?=
 =?utf-8?B?YmtITzJubmRqQjBtZkFnUnQ4M2s5MjIydU12bUJWaXphNWtrVWlxMkFodko3?=
 =?utf-8?B?N0FzZER5TExGT1Q1QkVJeElEMndFazVSUmNPUzBEYS9YR3BKZm9XbDVaRFJ4?=
 =?utf-8?B?M3BsamgxSzdnMU9Talp5RHpHZEdra0Z3OTJ3SnJJNU1ISDIwV05kd3F3bGFv?=
 =?utf-8?B?eFYzc3FoNXNaTk1DM2drZURtVDh2dDhtbFlna1gzUmNwZG90VVVjYldkcW1y?=
 =?utf-8?B?NHlNc2hOOWs5UktvYXZJNjY0dEF2N2pZeTYzUVNud3U2NHJIVHJ5SWFEZG5W?=
 =?utf-8?B?bUQ3UU1nVlhQdVM3bWlMblNYWnVFNVdWWEFrOTNOaHFjWTZ1SDByZFc3ckE2?=
 =?utf-8?B?eXpNTnFRRlY4eUhVZC9DL3ZLN0pXWDdGcFRvbnVHTWlHcFU1UzMrVlM0MXlh?=
 =?utf-8?B?bDZjaU4va0Y4N0M3MG5KMDdQbnplSGVEd0E5d2ZYQ09OSDdUTmtvVld6Z1Q1?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9a371f-4d50-4047-235d-08dbe6f86e45
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 23:04:48.1158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qfLGl3EzOYIAnGj491G+YaUN80MSfnxUGDaSiJ0Pb07l4KYvDmUs8Ba7eJxJeODM7jgedxnb0FM3KIgaRuqxaxcNJJLVsW7y8i02vb8PHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/11] drm/xe/gsc: GSC FW load
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

On 11/14/2023 16:46, Daniele Ceraolo Spurio wrote:
> The GSC FW must be copied in a 4MB stolen memory allocation, whose GGTT
> address is then passed as a parameter to a dedicated load instruction
> submitted via the GSC engine.
>
> Since the GSC load is relatively slow (up to 250ms), we perform it
> asynchronously via a worker. This requires us to make sure that the
> worker has stopped before suspending/unloading.
>
> Note that we can't yet use xe_migrate_copy for the copy because it
> doesn't work with stolen memory right now, so we do a memcpy from the
> CPU side instead.
>
> v2: add comment about timeout value, fix GSC status checking
>      before load (John)
>
> Bspec: 65306, 65346
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/xe/instructions/xe_gsc_commands.h |  34 +++
>   .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
>   drivers/gpu/drm/xe/regs/xe_gsc_regs.h         |  29 ++
>   drivers/gpu/drm/xe/xe_gsc.c                   | 250 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gsc.h                   |   3 +
>   drivers/gpu/drm/xe/xe_gsc_types.h             |  17 ++
>   drivers/gpu/drm/xe/xe_uc.c                    |  12 +-
>   7 files changed, 345 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
> new file mode 100644
> index 000000000000..c7a833d7f965
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GSC_COMMANDS_H_
> +#define _XE_GSC_COMMANDS_H_
> +
> +#include "instructions/xe_instr_defs.h"
> +
> +/*
> + * All GSCCS-specific commands have fixed length, so we can include it in the
> + * defines. Note that the generic GSC command header structure includes an
> + * optional data field in bits 9-21, but there are no commands that actually use
> + * it; some of the commands are instead defined as having an extended length
> + * field spanning bits 0-15, even if the extra bits are not required because the
> + * longest GSCCS command is only 8 dwords. To handle this, the defines below use
> + * a single field for both data and len. If we ever get a commands that does
> + * actually have data and this approach doesn't work for it we can re-work it
> + * at that point.
> + */
> +
> +#define GSC_OPCODE		REG_GENMASK(28, 22)
> +#define GSC_CMD_DATA_AND_LEN	REG_GENMASK(21, 0)
> +
> +#define __GSC_INSTR(op, dl) \
> +	(XE_INSTR_GSC | \
> +	REG_FIELD_PREP(GSC_OPCODE, op) | \
> +	REG_FIELD_PREP(GSC_CMD_DATA_AND_LEN, dl))
> +
> +#define GSC_FW_LOAD __GSC_INSTR(1, 2)
> +#define   GSC_FW_LOAD_LIMIT_VALID REG_BIT(31)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> index e403b4fcc20a..04179b2a48e1 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> @@ -15,6 +15,7 @@
>    */
>   #define XE_INSTR_CMD_TYPE		GENMASK(31, 29)
>   #define   XE_INSTR_MI			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
> +#define   XE_INSTR_GSC			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x2)
>   #define   XE_INSTR_GFXPIPE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
>   
>   /*
> diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> new file mode 100644
> index 000000000000..22d2ad9cb64d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GSC_REGS_H_
> +#define _XE_GSC_REGS_H_
> +
> +#include <linux/compiler.h>
> +#include <linux/types.h>
> +
> +#include "regs/xe_reg_defs.h"
> +
> +/* Definitions of GSC H/W registers, bits, etc */
> +
> +#define MTL_GSC_HECI1_BASE	0x00116000
> +#define MTL_GSC_HECI2_BASE	0x00117000
> +
> +/*
> + * The FWSTS register values are FW defined and can be different between
> + * HECI1 and HECI2
> + */
> +#define HECI_FWSTS1(base)				XE_REG((base) + 0xc40)
> +#define   HECI1_FWSTS1_CURRENT_STATE			REG_GENMASK(3, 0)
> +#define   HECI1_FWSTS1_CURRENT_STATE_RESET		0
> +#define   HECI1_FWSTS1_PROXY_STATE_NORMAL		5
> +#define   HECI1_FWSTS1_INIT_COMPLETE			REG_BIT(9)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 216f36cee0f7..cc9c6cdc31aa 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -5,10 +5,20 @@
>   
>   #include "xe_gsc.h"
>   
> +#include <drm/drm_managed.h>
> +
> +#include "xe_bb.h"
> +#include "xe_bo.h"
>   #include "xe_device.h"
> +#include "xe_exec_queue.h"
>   #include "xe_gt.h"
>   #include "xe_gt_printk.h"
> +#include "xe_map.h"
> +#include "xe_mmio.h"
> +#include "xe_sched_job.h"
>   #include "xe_uc_fw.h"
> +#include "instructions/xe_gsc_commands.h"
> +#include "regs/xe_gsc_regs.h"
>   
>   static struct xe_gt *
>   gsc_to_gt(struct xe_gsc *gsc)
> @@ -16,6 +26,145 @@ gsc_to_gt(struct xe_gsc *gsc)
>   	return container_of(gsc, struct xe_gt, uc.gsc);
>   }
>   
> +static int memcpy_fw(struct xe_gsc *gsc)
> +{
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 fw_size = gsc->fw.size;
> +	void *storage;
> +
> +	/*
> +	 * FIXME: xe_migrate_copy does not work with stolen mem yet, so we use
> +	 * a memcpy for now.
> +	 */
> +	storage = kmalloc(fw_size, GFP_KERNEL);
> +	if (!storage)
> +		return -ENOMEM;
> +
> +	xe_map_memcpy_from(xe, storage, &gsc->fw.bo->vmap, 0, fw_size);
> +	xe_map_memcpy_to(xe, &gsc->private->vmap, 0, storage, fw_size);
> +	xe_map_memset(xe, &gsc->private->vmap, fw_size, 0, gsc->private->size - fw_size);
> +
> +	kfree(storage);
> +
> +	return 0;
> +}
> +
> +static int emit_gsc_upload(struct xe_gsc *gsc)
> +{
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	u32 offset = xe_bo_ggtt_addr(gsc->private);
> +	struct xe_bb *bb;
> +	struct xe_sched_job *job;
> +	struct dma_fence *fence;
> +	long timeout;
> +
> +	bb = xe_bb_new(gt, 4, false);
> +	if (IS_ERR(bb))
> +		return PTR_ERR(bb);
> +
> +	bb->cs[bb->len++] = GSC_FW_LOAD;
> +	bb->cs[bb->len++] = lower_32_bits(offset);
> +	bb->cs[bb->len++] = upper_32_bits(offset);
> +	bb->cs[bb->len++] = (gsc->private->size / SZ_4K) | GSC_FW_LOAD_LIMIT_VALID;
> +
> +	job = xe_bb_create_job(gsc->q, bb);
> +	if (IS_ERR(job)) {
> +		xe_bb_free(bb, NULL);
> +		return PTR_ERR(job);
> +	}
> +
> +	xe_sched_job_arm(job);
> +	fence = dma_fence_get(&job->drm.s_fence->finished);
> +	xe_sched_job_push(job);
> +
> +	timeout = dma_fence_wait_timeout(fence, false, HZ);
> +	dma_fence_put(fence);
> +	xe_bb_free(bb, NULL);
> +	if (timeout < 0)
> +		return timeout;
> +	else if (!timeout)
> +		return -ETIME;
> +
> +	return 0;
> +}
> +
> +static int gsc_fw_is_loaded(struct xe_gt *gt)
> +{
> +	return xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
> +			      HECI1_FWSTS1_INIT_COMPLETE;
> +}
> +
> +static int gsc_fw_wait(struct xe_gt *gt)
> +{
> +	/*
> +	 * GSC load can take up to 250ms from the moment the instruction is
> +	 * executed by the GSCCS. To account for possible submission delays or
> +	 * other issues, we use a 500ms timeout in the wait here.
> +	 */
> +	return xe_mmio_wait32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE),
> +			      HECI1_FWSTS1_INIT_COMPLETE,
> +			      HECI1_FWSTS1_INIT_COMPLETE,
> +			      500, NULL, false);
> +}
> +
> +static int gsc_upload(struct xe_gsc *gsc)
> +{
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	/* we should only be here if the init step were successful */
> +	xe_assert(xe, xe_uc_fw_is_loadable(&gsc->fw) && gsc->q);
> +
> +	if (gsc_fw_is_loaded(gt)) {
> +		xe_gt_err(gt, "GSC already loaded at upload time\n");
> +		return -EEXIST;
> +	}
> +
> +	err = memcpy_fw(gsc);
> +	if (err) {
> +		xe_gt_err(gt, "Failed to memcpy GSC FW\n");
> +		return err;
> +	}
> +
> +	err = emit_gsc_upload(gsc);
> +	if (err) {
> +		xe_gt_err(gt, "Failed to emit GSC FW upload (%pe)\n", ERR_PTR(err));
> +		return err;
> +	}
> +
> +	err = gsc_fw_wait(gt);
> +	if (err) {
> +		xe_gt_err(gt, "Failed to wait for GSC load (%pe)\n", ERR_PTR(err));
> +		return err;
> +	}
> +
> +	xe_gt_dbg(gt, "GSC FW async load completed\n");
> +
> +	return 0;
> +}
> +
> +static void gsc_work(struct work_struct *work)
> +{
> +	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int ret;
> +
> +	xe_device_mem_access_get(xe);
> +	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +
> +	ret = gsc_upload(gsc);
> +	if (ret && ret != -EEXIST)
> +		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> +	else
> +		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
> +
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> +	xe_device_mem_access_put(xe);
> +}
> +
>   int xe_gsc_init(struct xe_gsc *gsc)
>   {
>   	struct xe_gt *gt = gsc_to_gt(gsc);
> @@ -23,6 +172,7 @@ int xe_gsc_init(struct xe_gsc *gsc)
>   	int ret;
>   
>   	gsc->fw.type = XE_UC_FW_TYPE_GSC;
> +	INIT_WORK(&gsc->work, gsc_work);
>   
>   	/* The GSC uC is only available on the media GT */
>   	if (tile->media_gt && (gt != tile->media_gt)) {
> @@ -50,3 +200,103 @@ int xe_gsc_init(struct xe_gsc *gsc)
>   	return ret;
>   }
>   
> +static void free_resources(struct drm_device *drm, void *arg)
> +{
> +	struct xe_gsc *gsc = arg;
> +
> +	if (gsc->wq) {
> +		destroy_workqueue(gsc->wq);
> +		gsc->wq = NULL;
> +	}
> +
> +	if (gsc->q) {
> +		xe_exec_queue_put(gsc->q);
> +		gsc->q = NULL;
> +	}
> +
> +	if (gsc->private) {
> +		xe_bo_unpin_map_no_vm(gsc->private);
> +		gsc->private = NULL;
> +	}
> +}
> +
> +int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
> +{
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_OTHER, 0, true);
> +	struct xe_exec_queue *q;
> +	struct workqueue_struct *wq;
> +	struct xe_bo *bo;
> +	int err;
> +
> +	if (!xe_uc_fw_is_available(&gsc->fw))
> +		return 0;
> +
> +	if (!hwe)
> +		return -ENODEV;
> +
> +	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4M,
> +				  ttm_bo_type_kernel,
> +				  XE_BO_CREATE_STOLEN_BIT |
> +				  XE_BO_CREATE_GGTT_BIT);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	q = xe_exec_queue_create(xe, NULL,
> +				 BIT(hwe->logical_instance), 1, hwe,
> +				 EXEC_QUEUE_FLAG_KERNEL |
> +				 EXEC_QUEUE_FLAG_PERMANENT);
> +	if (IS_ERR(q)) {
> +		xe_gt_err(gt, "Failed to create queue for GSC submission\n");
> +		err = PTR_ERR(q);
> +		goto out_bo;
> +	}
> +
> +	wq = alloc_ordered_workqueue("gsc-ordered-wq", 0);
> +	if (!wq) {
> +		err = -ENOMEM;
> +		goto out_q;
> +	}
> +
> +	gsc->private = bo;
> +	gsc->q = q;
> +	gsc->wq = wq;
> +
> +	err = drmm_add_action_or_reset(&xe->drm, free_resources, gsc);
> +	if (err)
> +		return err;
> +
> +	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOADABLE);
> +
> +	return 0;
> +
> +out_q:
> +	xe_exec_queue_put(q);
> +out_bo:
> +	xe_bo_unpin_map_no_vm(bo);
> +	return err;
> +}
> +
> +void xe_gsc_load_start(struct xe_gsc *gsc)
> +{
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +
> +	if (!xe_uc_fw_is_loadable(&gsc->fw) || !gsc->q)
> +		return;
> +
> +	/* GSC FW survives GT reset and D3Hot */
> +	if (gsc_fw_is_loaded(gt)) {
> +		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
> +		return;
> +	}
> +
> +	queue_work(gsc->wq, &gsc->work);
> +}
> +
> +void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
> +{
> +	if (xe_uc_fw_is_loadable(&gsc->fw) && gsc->wq)
> +		flush_work(&gsc->work);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
> index baa7f21f4204..f870eddc77d4 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.h
> +++ b/drivers/gpu/drm/xe/xe_gsc.h
> @@ -9,5 +9,8 @@
>   #include "xe_gsc_types.h"
>   
>   int xe_gsc_init(struct xe_gsc *gsc);
> +int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
> +void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
> +void xe_gsc_load_start(struct xe_gsc *gsc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
> index 1bc50583fe58..57fefd66a7ea 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_types.h
> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
> @@ -6,8 +6,13 @@
>   #ifndef _XE_GSC_TYPES_H_
>   #define _XE_GSC_TYPES_H_
>   
> +#include <linux/workqueue.h>
> +
>   #include "xe_uc_fw_types.h"
>   
> +struct xe_bo;
> +struct xe_exec_queue;
> +
>   /**
>    * struct xe_gsc - GSC
>    */
> @@ -17,6 +22,18 @@ struct xe_gsc {
>   
>   	/** @security_version: SVN found in the fetched blob */
>   	u32 security_version;
> +
> +	/** @private: Private data for use by the GSC FW */
> +	struct xe_bo *private;
> +
> +	/** @q: Default queue used for submissions to GSC FW */
> +	struct xe_exec_queue *q;
> +
> +	/** @wq: workqueue to handle jobs for delayed load and proxy handling */
> +	struct workqueue_struct *wq;
> +
> +	/** @work: delayed load and proxy handling work */
> +	struct work_struct work;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index b67154c78dff..15dcd1f91e9c 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -74,11 +74,17 @@ int xe_uc_init(struct xe_uc *uc)
>    */
>   int xe_uc_init_post_hwconfig(struct xe_uc *uc)
>   {
> +	int err;
> +
>   	/* GuC submission not enabled, nothing to do */
>   	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>   		return 0;
>   
> -	return xe_guc_init_post_hwconfig(&uc->guc);
> +	err = xe_guc_init_post_hwconfig(&uc->guc);
> +	if (err)
> +		return err;
> +
> +	return xe_gsc_init_post_hwconfig(&uc->gsc);
>   }
>   
>   static int uc_reset(struct xe_uc *uc)
> @@ -173,6 +179,9 @@ int xe_uc_init_hw(struct xe_uc *uc)
>   	ret = xe_huc_auth(&uc->huc);
>   	xe_gt_assert(uc_to_gt(uc), !ret);
>   
> +	/* GSC load is async */
> +	xe_gsc_load_start(&uc->gsc);
> +
>   	return 0;
>   }
>   
> @@ -197,6 +206,7 @@ void xe_uc_gucrc_disable(struct xe_uc *uc)
>   
>   void xe_uc_stop_prepare(struct xe_uc *uc)
>   {
> +	xe_gsc_wait_for_worker_completion(&uc->gsc);
>   	xe_guc_stop_prepare(&uc->guc);
>   }
>   

