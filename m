Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA49C001DE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 15:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A7A10E0EC;
	Tue, 25 Jul 2023 15:30:54 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B3E10E0EC
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 15:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690299051; x=1721835051;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QIjCR/GWurcm4uojNmVrsswYFzw/ArWDffy/QGG/ygc=;
 b=Y6p80tztN6mi2dZEabRBtK/0taF50Ypjx/hYgogx8I/hsux3JA4R+5Si
 hRLFHvVqSFCZnL7sPXgbHXRIiuqyKUd1RQWloopEyCVhGwgXdgWf63bIc
 eBaSTZASRsP7AMwkkVQMNueLQSqE+f5UZmCT21zr9JaBbU00v6En0AQ2B
 eDQ/dQHiIuiP8O+P/+L/jfs1iFCWxvC2CyE2hDbUHX315DjDiboG2hhCs
 RZM+KyaLFX0ty3Zxa148yVIqDekfDEivXNIy4kj6Q75fcpDO8onpqpQS8
 U3IAfBPmsqAg+LYtOdWMgCy7bdhUsO2g5XGX1BuKSm/EDnRUWETxa+Nly Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352662513"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="352662513"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 08:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="761248882"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="761248882"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 25 Jul 2023 08:30:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 08:30:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 08:30:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 08:30:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 08:30:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsVS/F9M8o99BFqB3D7ivDFOrqMNjSaZQOEvP69XvsTaJv2UZl/WxdYiWN3NKFXN6edx3XfHte2l/hve2YkstsDQCehNpP7jandm8S+0BztDGINaSz0LMvyBzoo1JmYIrx+bnWDJCdAp3LvUP6raJaEqKBnWfNfaTToPQEoGB4DE8+79DVdCoKVksLUVjkUcS3WHaIVMXP01uNtEeHNyLtYR//IfN+gvGwfI+3L0nowuK/b7DAIGzmE/TgrY75yqxfCzvJ4cfHO+A8gre04y3MQyY20PDdf/yCy06pfjnXWwH/DxU/z9TpaYtvSYeDMjc2iGvEAEo2q/ZW4BQUuQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kr6rOV39fIwyuu50HO8H63rOmqDMyijILNSEbFgqbZM=;
 b=m6+3APtZw5xIbxb0/g9kznrNXiheIXole77FEiyHSV0vy8CfOWlG450l8gd2qIbQyXtTj8yV1S0Jo9DHajA8gX9Yc1UO7v0SWCLxEhs+WvYEWvSMM/EtHWvCLlBG1uHwc07ezIT1SvQ7FKPjZ08szRRWrQAoOQIIwUWKcNUFU0e9JCbw0ffOigwm40zeqAfyDKCB0S98xVaSEmfOgwo/FNw5ejVpj36HozRQx169r2AgUqiAV17vBikWWpNP5bGat1HJIrIBu01niE727GwW6ViRNEVQT6BaeYKzAPw24kQTs5RftM5C5bbXJehj6gqNQ0aNezP/l/dmJ4liRjejEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB7341.namprd11.prod.outlook.com (2603:10b6:208:426::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 15:30:33 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 15:30:33 +0000
Message-ID: <d3dccac2-ba9f-82aa-c3fd-fbd04d4c463d@intel.com>
Date: Tue, 25 Jul 2023 21:00:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230725150951.3757483-1-himal.prasad.ghimiray@intel.com>
 <20230725150951.3757483-4-himal.prasad.ghimiray@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230725150951.3757483-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: b5fb1433-951f-4c13-ff17-08db8d2415b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Z6N1Aq1v9oZpUZNYVRWxqg4eiC5tD42ry9PEOdnLiPgjJaaoozU/wDf+WZ7DBhZ80G/glF8HXOu4ggxhr85K2nQ9Vtmn1JbMoFA3bn+4v4C6dcKROholoE0fYfQ8dQxnGxLvnmDJLgN6OOOk8rpZAHpjvRg74nnrL/nLXZohlGKlo7flYV4kGdFx5qyOv37QKwW7m1BpHCoO0okf/YO+FKTHio/DRaoAwqiP+jhXKYPnrsi8owrmZjVnk6ffb2vEmivYyHHTj2tOQnJ4n+xSt5FvY4bhVNbP4TFX03RmXFsk0oImfIKmY2JIPWI2TJP1vu1dENfIRego37fxj590EJ41f0AoQjVSsh2YDQaQ80tJRx1jwECQ/DqznOtbIIun/a2dQHQQd6HGCvUQ7VaA3itCMsfgt/fbVuw8seVIeocP+lqb0PXRmolDGqBrL1qbS57HNOC9oaF61IrWGrd5S9RHk2cL1nj8DwpcF6fFcZaruAR1TBiBUHXqAjWUliUFk6h/OPNtIhcg+kjFPsclrwmO54x84Nkv1wPwf0fqRZwVVB6qbETdGv/AhHE0GWZ33j3NblUq/LTvACiP6CA9T+qJ1AmjYiGRIjGBCJfwaWffcYpKPwnMjVksjRZYhbnedvGXLm89eyfBVPPoLq73w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199021)(31686004)(6512007)(6486002)(54906003)(478600001)(6666004)(83380400001)(36756003)(86362001)(31696002)(2906002)(2616005)(107886003)(186003)(53546011)(6506007)(26005)(316002)(82960400001)(38100700002)(66946007)(66556008)(41300700001)(8676002)(4326008)(66476007)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmhFNG15UzY1SGY4azdzWFpWS1pBNXN0RFVGNTlVQTl3TmdCd0ZNa3ZLbHU5?=
 =?utf-8?B?OURjRC9IUGpNcVdDU2FjTTZoaVkzSHlBYkt1WmZ6TmxmQ3hHL1hRNjRZYnB1?=
 =?utf-8?B?cUZUOUtDMEQ2M0hGcjkyemlndk0yOXpPalM1aENmREhoY29wTS9GZGhUM0F0?=
 =?utf-8?B?TXhTVHlPQ0xaRUE5YmJkQ3hoWVZNd0RMMk9yRGF6VytSL1dnNE0vNXdJYnJU?=
 =?utf-8?B?bGlQeU5IVGlQaGhjNlVJdlNOU2Q4RkdsVW5TalRpNU1wckJ2V2VBMWFLQTVw?=
 =?utf-8?B?ajNKRHFZQ3dOOTRwZktFMzI5WWUyZUxOdjNzRG4wQzJVMS9JZWF5UkRDZktS?=
 =?utf-8?B?bkJrem8wb0c4ZmNmVTltWC9Cc1ljWmlGTEI3THh3MGFCK0hCa2RHd3dONTZF?=
 =?utf-8?B?TGI2cHFvcng2eUZuem4zZWdJdWV0OGd5Ynd2Q1p3ZEh5aVV4TVlKNkZrb2tu?=
 =?utf-8?B?emVSeWJmZ0lLT29YV0YybWdYZUEwTjQ4R0cxMk9JNWp3Yy9PZVd3QXdmemc2?=
 =?utf-8?B?bkpQOG01Wm5nd3k0VnB2QzJUcjlMaXRPK2JjeHJHT1Q0SitLL2M1cWo2U0Js?=
 =?utf-8?B?QnozMmV4VnZSRUxmS05WbHRVYzNvR3J4b05mbkZ5SDl3N0FtOVBEdmcrSE14?=
 =?utf-8?B?V3h3NFdqZTVQd2RzQ2d0bmF0YkdUU29hVjgxYk1IWUJET3Q5UWVWVHJ2V0Zo?=
 =?utf-8?B?U2Fwa3BYeE1MS0ZieGlpNjhzZDNWMGNDcEtCMG50WDRMTW1GNS9XczBzWUl2?=
 =?utf-8?B?U21mV0V6QTFKUlU2SWhTN1Z1SmdNcFZ5RlVWTi8xQ25xVDJZaVdwOXNYUXJv?=
 =?utf-8?B?cERVN1d1elFJY0V3ZzBLRm9mVy9JOEYyaHdQdUltZ1R4a1RvaCtpRi9ielNB?=
 =?utf-8?B?Y1VWUnpwZC84RjcxdzRxRUhWRmdCQ29vbUxyMnBLUURybFpVQXhRUWdqL0hn?=
 =?utf-8?B?N0Rab28vQ2k5RjFDMFZBcnNTUHN6WmYwKzFiV2pZVjFLbnhUVDdBdHFyeXJw?=
 =?utf-8?B?S3RLdC9oZkgvSEljRitrU2luNHAzcGlKRFcyek9CN0ZVUC9tdEU3RHk5ZDcy?=
 =?utf-8?B?ZmVHbUVuajJLbTI5SXB1RkNycGFISS9uVWVtU3I2NTZrcy9YRGh5RkRLNjJp?=
 =?utf-8?B?dGNKVC9LK1ZzMVBQSVZ6UTJqMFBZT0VrY1FRcFdXSWZ2NllWVnoxTVRqNTJs?=
 =?utf-8?B?TUNVdkhUUWovWlRQdUhlOVJEMVNrRkFiUk4rNUFrNzJCUHpvZEMweGQ2ZFZZ?=
 =?utf-8?B?NkpJMCtGdS9LUHRtZlF3d0cvb1A5T2MxZUZzOG9MY25ZTUJocnJRRG1FRmxj?=
 =?utf-8?B?d2ovLzZoQW54Wk4xN3RZTERWd3ZIRzZ4OFd6TU1BdHFXdTVRbGRxSEpiYStq?=
 =?utf-8?B?RGRMcG9Wd2lxcyt2VnN3bS91WFI0RE9NUEVraW55eE5GWk1mOHh2VXVXN0R4?=
 =?utf-8?B?cjM3allRTCtzMjlrMlBVb21pbU5GSk5rM1M3OGVnOFY2TDIxWFlkSTJUMW9n?=
 =?utf-8?B?TGtyS1k5cmZuNVJmNjJrU0xGRHJ1dG5COVZXSVY4VExhZ0dlU0RTVGdqbGNB?=
 =?utf-8?B?ZjVlRW13RWw5TWx6MFhtbU50QUp6NDBieHRoQ2dDaysvSnIrUVIxa0hIdlJD?=
 =?utf-8?B?ZHppSjg1elFwMmtuUHN0WncrYmZTbEE0czNIZEZIdzUybmpFL210L2FHR1gz?=
 =?utf-8?B?S04xT3ZWSzltcmRLcUV4ajZrTVM0YjcxbitzWTh1M09nSWw3d2Y1MUV5TGZQ?=
 =?utf-8?B?cHI0V0RMMzJOVGFzZFdOQ2dmeHdHT2dudyt5V0N0bVJRdlphUU9Yb2xBNVpw?=
 =?utf-8?B?YkF5U21zaVY5TVdHWi9wYmcyQzB0L1M1b3pGRHUzTnlZTk5pazJrTXZnaTBj?=
 =?utf-8?B?Q21oSEZ3VEdjZXd2VEJ4a21aaU42Q21NOHo2bGE1Y1JqMEtyQ3p3eUQvTGNT?=
 =?utf-8?B?Qm9vZjJrc1dsUVAxZXc0ZEh1UzMzQjMrek5TRzZPVzZqTzNYbGhZS2xOczVt?=
 =?utf-8?B?OUQzS3hlQ1Bxa3Z3OU5pWWdhSERadlZRdXpGTmp4VDMyS25XNlhzcHZlM1FW?=
 =?utf-8?B?YWFUNk9DUUtuWGlmd1ltYVlpa0RMNy9ydFpiZ2JhY1V1SzVVcUtnZ3VlQnFO?=
 =?utf-8?B?S3BFZDZ0QnYzNTA1eHpnNkJ2cVJMVzZ1aXFycFB4RldmckhmNXlzUFNnUTFG?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fb1433-951f-4c13-ff17-08db8d2415b4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 15:30:32.9331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FzrwdN8XEET1TOGDDHnq7UX3xl7d64emja01cHjsPT4p69NsVdcnW26LfNKT2mIPy6c8gkstk4B3bD0J4uaxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7341
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v7 3/3] fault-inject: Include linux/types.h
 by default.
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 "Reviewed-by : Rodrigo Vivi" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Himal,

On 25-07-2023 20:39, Himal Prasad Ghimiray wrote:
> Functions should_fail_alloc_page, should_failslab, and __should_failslab
> are declared irrespective of CONFIG_FAULT_INJECTION. These functions use
> bool and gfp_t types, which are treated as unknown when CONFIG_FAULT_INJECTION
> is disabled because the inclusion of linux/types.h is missing.
> 
Add fixes tag.
Fixes: 6ff1cb355e62 ("[PATCH] fault-injection capabilities infrastructure")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: or Reviewed-by: ?

Regards,
Badal Nilawar
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   include/linux/fault-inject.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/fault-inject.h b/include/linux/fault-inject.h
> index 481abf530b3c..f83ab2b6cd08 100644
> --- a/include/linux/fault-inject.h
> +++ b/include/linux/fault-inject.h
> @@ -2,9 +2,10 @@
>   #ifndef _LINUX_FAULT_INJECT_H
>   #define _LINUX_FAULT_INJECT_H
>   
> +#include <linux/types.h>
> +
>   #ifdef CONFIG_FAULT_INJECTION
>   
> -#include <linux/types.h>
>   #include <linux/debugfs.h>
>   #include <linux/configfs.h>
>   #include <linux/ratelimit.h>
