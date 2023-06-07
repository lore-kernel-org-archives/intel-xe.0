Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD65C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 05:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E59610E421;
	Wed,  7 Jun 2023 05:10:07 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D0310E421
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 05:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686114604; x=1717650604;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XNx9uS6cgn6UafOacrjr6Q1JVzUcvZIjYF9ImqLe+cI=;
 b=YLYTWdPPqQDzeKiecaL7y9ZBHM0C+fW6x5FL+DQJy7kj1CHDY0pyVkmX
 awtdtKEzyhqR5cFHk1Q8emhhOfMGE4CgvNDWGSryZIjVOxjhq8tvROIAH
 utrNcO9G/jAuJu5gS5ao7FfR8Wj3GlK563W3dGyeBlsUUj+QHTaIsobUW
 X0TCX8wMPRM4wmp11FmA/B5jVBVD2hD75VUrqBkN2HdL9DfZPSw8NqlnK
 WYDwWW+6mtflAFv6Ea89tNFCk2hkrJdjbgHhJjl/wLQmBRUxho6QdmXhH
 9Ap0cIITYzYCJSk8kinm4X6IlRK8qJwc6htRq0GVT9da8vw39jxL3nUdV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337243945"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="337243945"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 22:10:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="883605305"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="883605305"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 06 Jun 2023 22:10:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 22:10:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 22:10:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 22:10:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 22:10:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcFpM4etDRZaMc+HKBUiGY+J5MXH7QRSih/32X8mX/XNZotolbyVS9sPCoElZ0hZxCzC+c0Pa2Lo/XCSBQSwU8vB312tkUEAbJ2RxhwH8xCJeJGFAHuF5JarxONsglJgR6eu1z5+6E3vD6Y3j0RMboyxJP2FIQJ61zDKJySUlcNsuHpXAyx10q1TjIPRr4x91BtJa9UBi1qGHvoUstY6utUtOLTdwaPmPico6ekF0pGdX+Vk9dqo5FUXpEqNvEpiW7ZxxjheIfBSDvaUSDxzHYols0YrCI7CXhWCkQiYsCv4QW7bMIavnsKiAoy98aZ0P/JJW0GJIMSpTEVycDRktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaZgFbkXWadISa0UKiFHcHwaYe6wfO8q0LpNdv+qp5I=;
 b=FpkiNkdJqT8VBz8yvqSQR6FwvhdmVtZ2vTm2TvZyb/aKXgbqQimwEg7eXoLEbu1QVWkPHONkMACWl2poMvOS2l1A6w+Hy5Ap/nnZseg0QplR338+ihV8b7urVbPCU+1/jOYyZ/LZdl39VoRv1P2pX4/lRp5FPe8DhOD2pdIZhpQmb/iGQ+nfGA76HvkBk5zWRYO7l/BrcX2YU8aMaM+eAdf2F0Vg4NEad3W871si1GDq6BsL2UkdeGtnA1fEfHoEX7mJ3nBrbKLGkhRlTXKE/v+3m6KIR6xSgLcKRpTkTYtMluzNZExN85eECwqZ8a6fB4DTST4dU9zQT5cJ+4gEEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY5PR11MB6161.namprd11.prod.outlook.com (2603:10b6:930:2a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 05:10:00 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 05:10:00 +0000
Message-ID: <bba56f1e-e255-b716-13de-33c7340ff88d@intel.com>
Date: Wed, 7 Jun 2023 10:39:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230524060020.2054682-1-riana.tauro@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230524060020.2054682-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0223.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::16) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY5PR11MB6161:EE_
X-MS-Office365-Filtering-Correlation-Id: d5453499-497b-42c2-ba29-08db67157194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kc7aU29SsEEGm4Fq9Bcs8i6QSBjVk5g2qE3RVgCCT7ZJqrY257h8ucMBV+OeOChNfEP8fEUA+0Bt8AbTbhrX6wnn1QaMRLU3ZHkmLlNyFETK3X0ijyHoRIjefKRAovUqEIe1SSSpDmqyofftWVG3pk6noHAqrkIwrnIezLvcl14fP34+1cKlzsm2jFVgx2VPDmfBoifCaxLK/fPWSJx8eqIPNePJFCSkbhLoaxa08DnQNdQLR6w3XeeQqcegyJsRzHrpBIeSats1WV1lel2sVx7y5/igIRyl3szvEyeNtf9s+kKUFtWuLI2VYz+6kUvoAwbzkYllDW1Dbgca/WAyPkxQvpATx7qLqVP3SntW7D7x1ARXvpeyYZ4fclzLRN0Fr1Fo5JVTWEsxdmIH14aXaclSkDP1pRXZmG+OOU98DP727D7F2wPHBKiCTtt/nU5rJjXXi8qCRUnnSMZTaO6QAXYrQmkVwfDmEvS6fis0/4t83dpYPsy3UzxWQTD/0uDAxSlgvx3YoiPdWHu4fGhtdlWzek0xtebc18Kogdoc1Svk/88QnalmlgqINQJpy0vJ7OgSPHE+bTulHNcZn1OuLLaFFVgS2j/iICzxA639FSs/PjZ9yEnhUzY9ps9gSXpufcvGawTtZhTxEzjNcjvlrnPJQ91EV18DHogxhE5UaDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(31696002)(30864003)(2906002)(83380400001)(2616005)(36756003)(86362001)(82960400001)(38100700002)(6486002)(41300700001)(6666004)(5660300002)(316002)(107886003)(8676002)(8936002)(478600001)(66556008)(66946007)(31686004)(66476007)(4326008)(6512007)(53546011)(6506007)(26005)(186003)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDB2VWpQeGJsdjJrQ1BFN2VlbmV5T0ZudnZkU01kZzBORyt5QTMxWXBObEVW?=
 =?utf-8?B?ZjEzZzBBamc3bVhYb1AwSHRxYk9QV0pLczVMbmg1L0JOL0hyOFFiVTNQcXRY?=
 =?utf-8?B?TEtKWnpXOCtuOXd4bXUxM2MxdTdMcEpJMUNNYkZDM1hMd1RSUkZMdDVscUxP?=
 =?utf-8?B?NWk0czRGNjVSRUsrRzMwWWxHVVZvR0RJVXhtcWZQM1daMTduVHNmK0VnM0RH?=
 =?utf-8?B?Ni9yMyt4cHJHNU5LWEoyeU5xQlE2SGJKYzBkeXNoOCtvYUsxT1hHQm5hVWR6?=
 =?utf-8?B?ZGY3em1JZ0tlU2Ewd29sMXVlZWxEVk9wNWhVOGN3THNhR28ydHJ2NmtwTWV1?=
 =?utf-8?B?SFlrYWJXd0lYeE1WQ3lueFlkUFN4VUl6MWliZTAyYmJmOWJUS1NybW9NOFph?=
 =?utf-8?B?eDEzSjlRaCtiTXp4dkdwQ3o1Uk9hcUU2UUpDSWtlUlAxRCsvU3hKQ0RjdkJ6?=
 =?utf-8?B?NGFWU0ZzRFJqK1NLQjZWenNhWmtiaURVNktyODBaQnA2d0FNVXpTaHliTkJX?=
 =?utf-8?B?aDFrbjh2SzdGWk1vTlZUWXBpYk5QWm9PdEkwd3QvUWJ2aExpdjRUd1NqcG1w?=
 =?utf-8?B?Y3BJaWRHQVhZSmZZYWErZlAyeXcwcGphdjBZbmJjVURCcDhuSnc5V0ozdDk5?=
 =?utf-8?B?YXdETDJzWWhpNDVxd3ZyNGs1ckR4Q3VSQk9pRlB0QTZPYWIxZ1NaNkFnQk1k?=
 =?utf-8?B?Q2xLNCtsR0JzWEpwVkMxWU8vWWJ5TExKL2hqSWRhd3kyVk9jY2ppVnYxWkFD?=
 =?utf-8?B?ZkFEY01BbGhPb09SOURUbWtXd3ZySnpVaENza2JsYkZlWk42ZFN2SzVTRlhu?=
 =?utf-8?B?RlR3YXFXb1JBajhmU0hURmhOemdWampIVWltc242VU1oZmVLcEwwQkFaSkJz?=
 =?utf-8?B?S29jb3FwL3ZrSFBQOEt4dExaQThGMjh6aU9NbmhYenhqNGpmc3RVRVZvT3hv?=
 =?utf-8?B?dzhuNmorRThoNTFsM2VsMlhLTWRnNWVidVk2Z0RtZzl4RkN6WGVUd3paUHRX?=
 =?utf-8?B?VENKNktIZ0lWaks4bE1VMGlqY1BvaXhtbEgreVNwWld1cFR6YnJWS29ycm1k?=
 =?utf-8?B?M3BFVmJ0WHdqaUtHQWJuMVo2VUtHcHQrV3poSHNYY3B0R001TnpRNjRZeWM0?=
 =?utf-8?B?SlR1MTRacnVRaWVTU29hbGd3d2tZQmdka1JxV3NIa3ZSd01ZUHA3WEpUa3J4?=
 =?utf-8?B?QzFBREhLblVEK1BHUi9GdDhIUXJWcHEveVc5Y1QzOW9QSk0wUHhwdWhweVM4?=
 =?utf-8?B?MURYVGpuOUxIUnBCY2pSN0JXWUg0cnN0bDl3LzRSV2JGTXBucHhJamhidzRR?=
 =?utf-8?B?QVFjL0pkajZQdG41MGVDZ2JHbVlJcjFWclZkalBXQ04xb3RFbjZ1TG1KVFVR?=
 =?utf-8?B?TExidDJqU2habVR3aFRNbnpiaVMza25HVldPdFMyUXg5U0xaUGpQOUlJRldy?=
 =?utf-8?B?aHZzejRhYWh1S0V2K25oakR0LzEwQ29TRWgvM1AweS8rRnYwNEh0aGxHMk5U?=
 =?utf-8?B?aUhTN29QelJyMkIvMFdaQXdZU295cWZKOTlKeXZxU21IUDd2RndxOHpUbGJq?=
 =?utf-8?B?eEEzaW1taFBlWGd6ckppUlA2UHVZTDl1UzY1V2pjYnpXWVYwb1VHelRlblZm?=
 =?utf-8?B?TmNveHJHcTJWR2diUno2TzUrMEVLc2pQMGdiRnphTHNQbDlSbW00c1pZUTAv?=
 =?utf-8?B?SFlPcEtHMDZmVEhzL0Y2MjhwcVJqOVBqTkN2aTJJZS9YNHFOOUFNYlRMeDVD?=
 =?utf-8?B?anN0aVROc0NYTWIzQlE4ZkJrSENYUnFpaWZTZ1NpL21GQWpwM0JiRHlnZTZ4?=
 =?utf-8?B?eU8vK0EyRGIzdy9ValppczdRYWdEKzJ1a08zZlBBQ3h6WE14aC8rMVcrb1VN?=
 =?utf-8?B?MXZNc1VObHFDOThkWWQ1RWVsbGE2S1ZmWHB6VU1mS0JpNVVmci85RHBaWDcw?=
 =?utf-8?B?TS90UkNtd2w2ZytlQ2N4NzRXclJVUnppNU1zQzNPQ2I3QmJ1a3dkaVA3d1pN?=
 =?utf-8?B?azZQbXBOSklpcGhTWFh2MUtrT0h0Q013VnByVnp6eFBVaU9pbE1LNTVyYjVS?=
 =?utf-8?B?TzVvWmQxRlY3MWF2Z2hwYXZObUt2eExQQXVVcVltVXlQd1NhMXNMeFE2a1E2?=
 =?utf-8?B?TWRYeVJtMjIwbTE2dkNzYjFXQkcyb3QwYVpUSGFLeHhzb1NMc1Nzck1Ibk1q?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5453499-497b-42c2-ba29-08db67157194
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 05:10:00.1658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mY4Dp1n1OPlh1LxJfcHTU+Lgl/qF2jR6M4RZDO6Jxt4pQqFBBzzRAt0wS8PAq4L9vMT5/xa8S0H/qHVVHXAhqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6161
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: add a new sysfs directory for gtidle
 properties
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Riana,

On 24-05-2023 11:30, Riana Tauro wrote:
> Add a new sysfs directory under devices/gt#/ called gtidle
> to contain idle properties of GT such as name, idle_status,
> idle_residency_ms
> 
> v2:
>      - abstract using function pointers (Anshuman)
>      - use device_attr (Badal)
>      - move rc functions to guc_pc
>      - change name to gt_idle (Rodrigo)
> 
> v3:
>      - return error for drmm_add_action_or_reset
>      - replace file and functions with gt_idle prefix
>        to gt_idle_sysfs (Himal)
>      - use enum for gt idle state
>      - move multiplier to gt idle and initialize (Anshuman)
>      - correct doc annotation (Rodrigo)
>      - remove return variable
>      - use kobj_gt instead of new gtidle kobj
>      - move residency_ms to gtidle file
>      - retain xe_guc_pc prefix for functions in guc_rc file (Michal)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                 |   1 +
>   drivers/gpu/drm/xe/xe_gt.c                  |   5 +
>   drivers/gpu/drm/xe/xe_gt_idle_sysfs.c       | 157 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_idle_sysfs.h       |  13 ++
>   drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h |  38 +++++
>   drivers/gpu/drm/xe/xe_gt_types.h            |   4 +
>   drivers/gpu/drm/xe/xe_guc_pc.c              |  46 +++---
>   drivers/gpu/drm/xe/xe_guc_pc.h              |   2 +
>   8 files changed, 237 insertions(+), 29 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cd1614b68734..84f0985054fa 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -45,6 +45,7 @@ xe-y += xe_bb.o \
>   	xe_gt.o \
>   	xe_gt_clock.o \
>   	xe_gt_debugfs.o \
> +	xe_gt_idle_sysfs.o \
>   	xe_gt_mcr.o \
>   	xe_gt_pagefault.o \
>   	xe_gt_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 80d42c7c7cfa..eb1e1e3d2d71 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -18,6 +18,7 @@
>   #include "xe_force_wake.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt_clock.h"
> +#include "xe_gt_idle_sysfs.h"
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_pagefault.h"
>   #include "xe_gt_printk.h"
> @@ -383,6 +384,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   	if (err)
>   		goto err_force_wake;
>   
> +	err = xe_gt_idle_sysfs_init(&gt->gtidle);
> +	if (err)
> +		goto err_force_wake;
> +
>   	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>   	gt->info.engine_mask = gt->info.__engine_mask;
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> new file mode 100644
> index 000000000000..b7de53287f6b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_idle_sysfs.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_guc_pc.h"
> +
> +/**
> + * DOC: Xe GT Idle
> + *
> + * Provides sysfs entries for idle properties of GT
> + *
> + * device/gt#/gtidle/name - name of the state
> + * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle state in ms
> + * device/gt#/gtidle/idle_status - Provides current idle state
> + */
> +
> +static struct xe_gt_idle *dev_to_gtidle(struct device *dev)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +
> +	return &kobj_to_gt(kobj->parent)->gtidle;
> +}
> +
> +static struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle)
> +{
> +	return container_of(gtidle, struct xe_gt, gtidle);
> +}
> +
> +static struct xe_guc_pc *gtidle_to_pc(struct xe_gt_idle *gtidle)
> +{
> +	return &gtidle_to_gt(gtidle)->uc.guc.pc;
> +}
> +
> +static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
> +{
> +	switch (state) {
> +	case GT_IDLE_RC0:
> +		return "rc0";
> +	case GT_IDLE_RC6:
> +		return "rc6";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
> +static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
> +{
> +	u64 delta, overflow_residency, prev_residency;
> +
> +	overflow_residency = BIT_ULL(32);
> +	/*
> +	 * Counter wrap handling
> +	 * Store previous hw counter values for counter wrap-around handling
> +	 * Relying on sufficient frequency of queries otherwise counters can still wrap.
> +	 */
> +	prev_residency = gtidle->prev_residency;
> +	gtidle->prev_residency = cur_residency;
> +
> +	/* delta */
> +	if (cur_residency >= prev_residency)
> +		delta = cur_residency - prev_residency;
> +	else
> +		delta = cur_residency + (overflow_residency - prev_residency);
> +
> +	/* Add delta to extended raw driver copy of idle residency */
> +	cur_residency = gtidle->cur_residency + delta;
> +	gtidle->cur_residency = cur_residency;
> +
> +	/* residency multiplier in ns, convert to ms */
> +	return mul_u64_u32_div(cur_residency, gtidle->residency_multiplier, 1e6);
> +}
> +
> +static ssize_t name_show(struct device *dev,
> +			 struct device_attribute *attr, char *buff)
> +{
> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
> +
> +	return sysfs_emit(buff, gtidle->name);
> +}
> +static DEVICE_ATTR_RO(name);
> +
> +static ssize_t idle_status_show(struct device *dev,
> +				struct device_attribute *attr, char *buff)
> +{
> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
> +	enum xe_gt_idle_state state;
> +
> +	state = gtidle->idle_status(pc);
> +
> +	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
> +}
> +static DEVICE_ATTR_RO(idle_status);
> +
> +static ssize_t idle_residency_ms_show(struct device *dev,
> +				      struct device_attribute *attr, char *buff)
> +{
> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
> +	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
> +	u64 residency;
> +
> +	residency = gtidle->idle_residency(pc);
> +	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
> +}
> +static DEVICE_ATTR_RO(idle_residency_ms);
> +
> +static const struct attribute *gt_idle_attrs[] = {
> +	&dev_attr_name.attr,
> +	&dev_attr_idle_status.attr,
> +	&dev_attr_idle_residency_ms.attr,
> +	NULL,
> +};
> +
> +static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, gt_idle_attrs);
> +	kobject_put(kobj);
> +}
> +
> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
> +{
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct kobject *kobj;
> +	int err;
> +
> +	kobj = kobject_create_and_add("gtidle", gt->sysfs);
> +	if (!kobj)
> +		return -ENOMEM;
> +
> +	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
> +	/* Multiplier for  RC6 Residency counter in units of 1.28us */
> +	gtidle->residency_multiplier = 1280;
> +	gtidle->idle_residency = xe_guc_pc_rc6_residency;
> +	gtidle->idle_status = xe_guc_pc_rc_status;
> +
> +	err = sysfs_create_files(kobj, gt_idle_attrs);
> +	if (err) {
> +		kobject_put(kobj);
> +		return err;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
> new file mode 100644
> index 000000000000..a654561fda19
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_IDLE_SYSFS_H_
> +#define _XE_GT_IDLE_SYSFS_H_
> +
> +#include "xe_gt_idle_sysfs_types.h"
> +
> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
> +
> +#endif /* _XE_GT_IDLE_SYSFS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
> new file mode 100644
> index 000000000000..b9cfb37aae75
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_IDLE_SYSFS_TYPES_H_
> +#define _XE_GT_IDLE_SYSFS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_guc_pc;
> +
> +/* States of GT Idle */
> +enum xe_gt_idle_state {
> +	GT_IDLE_RC0,
> +	GT_IDLE_RC6,
> +	GT_IDLE_UNKNOWN,
> +};
> +
> +/**
> + * struct xe_gt_idle - A struct that contains idle properties based of gt
> + */
> +struct xe_gt_idle {
> +	/** @name: name */
> +	char name[16];
> +	/** @residency_multiplier: residency multiplier in ns */
> +	u32 residency_multiplier;
> +	/** @cur_residency: raw driver copy of idle residency */
> +	u64 cur_residency;
> +	/** @prev_residency: previous residency counter */
> +	u64 prev_residency;
> +	/** @idle_status: get the current idle state */
> +	enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
> +	/** @idle_residency: get idle residency counter */
> +	u64 (*idle_residency)(struct xe_guc_pc *pc);
> +};
> +
> +#endif /* _XE_GT_IDLE_SYSFS_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7c47d67aa8be..8dec660f5fc6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -7,6 +7,7 @@
>   #define _XE_GT_TYPES_H_
>   
>   #include "xe_force_wake_types.h"
> +#include "xe_gt_idle_sysfs_types.h"
>   #include "xe_hw_engine_types.h"
>   #include "xe_hw_fence_types.h"
>   #include "xe_reg_sr_types.h"
> @@ -287,6 +288,9 @@ struct xe_gt {
>   	/** @uc: micro controllers on the GT */
>   	struct xe_uc uc;
>   
> +	/** @gtidle: idle properties of GT */
> +	struct xe_gt_idle gtidle;
> +
>   	/** @engine_ops: submission backend engine operations */
>   	const struct xe_engine_ops *engine_ops;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e799faa1c6b8..31c56a0dc210 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -76,12 +76,7 @@
>    *
>    * Render-C states is also a GuC PC feature that is now enabled in Xe for
>    * all platforms.
> - * Xe's GuC PC provides a sysfs API for Render-C States:
>    *
> - * device/gt#/rc* *read-only* files:
> - * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
> - * - rc6_residency: Provide the rc6_residency counter in units of 1.28 uSec.
> - *                  Prone to overflows.
>    */
>   
>   static struct xe_guc *
> @@ -580,10 +575,12 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>   }
>   static DEVICE_ATTR_RW(freq_max);
>   
> -static ssize_t rc_status_show(struct device *dev,
> -			      struct device_attribute *attr, char *buff)
> +/**
> + * xe_guc_pc_rc_status - get the current Render C state
> + * @pc - XE_GuC_PC instance
> + */
> +enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	u32 reg;
>   
> @@ -593,37 +590,30 @@ static ssize_t rc_status_show(struct device *dev,
>   
>   	switch (REG_FIELD_GET(RCN_MASK, reg)) {
>   	case GT_RC6:
> -		return sysfs_emit(buff, "rc6\n");
> +		return GT_IDLE_RC6;
>   	case GT_RC0:
> -		return sysfs_emit(buff, "rc0\n");
> +		return GT_IDLE_RC0;
>   	default:
> -		return -ENOENT;
> +		return GT_IDLE_UNKNOWN;
>   	}
>   }
> -static DEVICE_ATTR_RO(rc_status);
>   
> -static ssize_t rc6_residency_show(struct device *dev,
> -				  struct device_attribute *attr, char *buff)
> +/**
> + * xe_guc_pc_rc6_residency - rc6 residency counter
> + * @pc - Xe_GuC_PC instance
> + */
> +u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc)
>   {
> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>   	struct xe_gt *gt = pc_to_gt(pc);
> -	u32 reg;
> -	ssize_t ret;
> +	u64 reg;
>   
> -	xe_device_mem_access_get(pc_to_xe(pc));
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (ret)
> -		goto out;
It would be good to mention in commit message about removal of Forcewake 
calls.
> +	xe_device_mem_access_get(gt_to_xe(gt));
>   
>   	reg = xe_mmio_read32(gt, GT_GFX_RC6);
> -	ret = sysfs_emit(buff, "%u\n", reg);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -out:
> -	xe_device_mem_access_put(pc_to_xe(pc));
> -	return ret;
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +	return reg;
>   }
> -static DEVICE_ATTR_RO(rc6_residency);
>   
>   static const struct attribute *pc_attrs[] = {
>   	&dev_attr_freq_act.attr,
> @@ -633,8 +623,6 @@ static const struct attribute *pc_attrs[] = {
>   	&dev_attr_freq_rpn.attr,
>   	&dev_attr_freq_min.attr,
>   	&dev_attr_freq_max.attr,
> -	&dev_attr_rc_status.attr,
> -	&dev_attr_rc6_residency.attr,
>   	NULL
>   };
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index da29e4934868..976179dbc9a8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -12,4 +12,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc);
>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
>   
> +enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
> +u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
As xe_gt_idle_sysfs.c is the only consumer of above funtions, how about 
moving these functions under xe_gt_idle_sysfs.c as static functions?

Regards,
Badal
>   #endif /* _XE_GUC_PC_H_ */
