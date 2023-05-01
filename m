Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C877C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 14:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4D410E30C;
	Mon,  1 May 2023 14:57:50 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E73010E30C
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 14:57:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQkIh66TQ72nZbqlaq8T4bvQIRCkP4CkwUuqoPn7yRU3RhRP646FFt4V0uNfgH8yO/tHUFsh7dsLrbkGELHNL/bevy82CknR9PLlm/JX/2jERiyjLp5MG4iLD/oof25a2iHAZxZGD1j1NrC24H+mzl6spTBO/AedaAOAQW3ASX44RFNV2IP5PyVvQgUitRgCRhJ8lPPuZFgzgO7YUENnuCkW+EGT1A3tZllEsCoAY0dhsWxu6cBCMWy02afkOiY5F00KuoYHAjgzyqyPW08kpkEEUjmktsSjOv1JCOglmcR/L2u+iu839Y1txGmdw9BVcF/E+6VdaMDK9lR4d0C4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8kJILSie83Q/DngU8CHEw3d+7AERBz7N4rNj30uBkw=;
 b=GGPbGBw2EI2/ES1/K/OcDqTVsM6evYzeS+vGA4nbpjsFq3h58X7TwcxQq7SqOKKhoZEcvYh2sbvuD5kNXjCTrCpao6JOJ8ri3kFUQrtnXjZvEAr4bLfz6mWoh+S4t0N8JdrpWxl3z23Wojw/821lpBLKU068r+keUFhsLtWidzGf86gwGDNfzqcbsrv5zY2Ec8VlWe89Mad71Qt4OMuztHb5r6QlYoZMsnhqCEHQRnRJiBKXfSD2VTaFEASrQchjv6iiARQC7+dN5s1mJwV+SzcMcmyuRk4NrywehcwjQ8vwd7ni36B57rDLKS/LqFtIKZ5b7Cs6s95BxfllZBQo1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8kJILSie83Q/DngU8CHEw3d+7AERBz7N4rNj30uBkw=;
 b=HHTgLEhLc63S5uk6tKdjx65rp72i+LNRyvncr2jrvfMwhhR/CtVhwJmmAceE2LUklium4lcUXMNzriSzgfJ/3kHxhJJuJ5GLbB+OojEE8juCRb8Zws17h+8ZWPRvKCb+ivKHj3OpolFNfgJ3FcFnSyAgZqKDExvR+3YniEDH4Rc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB8227.namprd12.prod.outlook.com (2603:10b6:208:406::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.29; Mon, 1 May
 2023 14:57:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6340.031; Mon, 1 May 2023
 14:57:45 +0000
Message-ID: <0c7a3835-40e3-47b5-eb52-e7f7214c62f3@amd.com>
Date: Mon, 1 May 2023 16:57:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230501075114.3108352-1-matthew.brost@intel.com>
 <20230501075114.3108352-26-matthew.brost@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230501075114.3108352-26-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 602e3726-68f2-427d-6680-08db4a546c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JmBniXkiq2V4CwGcgsXJiO90o6ROzftm6DEXUP83rriSET3MkyBlYegf4wODdJzSchbKxsmJLNFPtlTahnlYIi0TyYTjzNLCegfDEGppv/5Bu0oPdnm8mKGG2DG1hjryorShh+k4ruyg/CrOkN6Gj1gzqdoNOJNwofCqQ49RVrElbjU+dr2Zw0xnCoM87qwm7GBewrtHJMOQYG2z99jJZwhhbP2PcsCUD/YPn8s6pW1WyLGpHeTKqclhjorfOSR5mh23R4pgdvjH0yLH2buG4Fq23QDSS/l2hz/RwQ1S72iB0mMl3l8L7LVTwvHvlJtol6mlDfyXHAY7gcj256o6ip/EYq60cnQ0SB3hQ1qJA/szTuN6fAnI9RvZj+H5hz19hTlOG7xpjkApnTYuGdLrY5NWfXmpEVSCiGdjALir1Jcj4jFgvqXM1BwJJaK8kjG0kbckcvhcn9MDZDjgJl7O8WJZ0Q4uCRsqGB45PHDgdRNe/THwU5yWK2qwt6fcqYmF9Eo4Lc3mWAm72GimZtqee4s1O6ET4wGPKsLP9x28GSHeoBPC3NiOJ+kmciT9A8mZMjvmV9VC+kTb+1PTex6Ygk2y6rTetjLoSZDLPdGFc56WhkNSo7qgDBPTH51vBJ3YeADjC91YHQAeLoYsv54HJ6Dm1QBn7gKzaRbn+gr4fPeqYztslRo+zzMcD+Gih6qP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199021)(86362001)(66574015)(83380400001)(6486002)(6666004)(2616005)(6506007)(6512007)(186003)(30864003)(2906002)(36756003)(5660300002)(38100700002)(66476007)(66556008)(4326008)(66946007)(41300700001)(8676002)(8936002)(31696002)(316002)(478600001)(31686004)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUhqTk9wa2FkSm5RTjA5K21pQkt1MVZyOTJGWE9Gc2dpWTNGaHRjUmx1S2NT?=
 =?utf-8?B?M0tLVlNJSTloaVRMU21za0xDUkpzVmt5RE4zQUxDejlud3B0cDdySmo5bEJu?=
 =?utf-8?B?bktucFFDTHBralE1Sk84NE1Hb1hsVEMvN0dXMkFtN1ZudFA5ZUo1YnZDYzNB?=
 =?utf-8?B?MDFBcVhkZ0VEaTV4bXRKZCtiNVBxbUtTUkh5M0plQlRqaENxeTJ3YlJYMStG?=
 =?utf-8?B?VnF3YW1sYm9lMWw1ZWlNMmJXYXZoN0xKM1UxcjB2NStkRGY5TTNqeTZDTnVJ?=
 =?utf-8?B?S2x2NnZUd25GR3lQbkxlWGRYUld0UWV1RWwzbVBhK1FlajR1WnE2TnpJNHYx?=
 =?utf-8?B?cHFlTTdyMEZJOWRDY0thajNveS9SRGR5Ni9GQmQvN0NBeVNicW12L0lKeGhG?=
 =?utf-8?B?N2txV2xQa1M4cFFQckNObGJ6VUNZVDkvZzB4MjkxTkhUbmo5V0xhdzRVR0l4?=
 =?utf-8?B?N1poVlFYK1R6eHRSdHpjRzVpTERiWkdJUUR0eVhaWnRIbU9RM25FbWdvS2I1?=
 =?utf-8?B?QlQ2U1NwQyswejJRaUFLZGsydC9oaU5TRnZPYVdiS1NrbjZxMXNKckVQSHhP?=
 =?utf-8?B?Y3d6RkJjZ2tXRWwxRkRvUEVGa1c3RzdmSUF3NHRmOG9uOVRqL096djJRc09L?=
 =?utf-8?B?MHhKdXNCWHBhSHN1ak9HUVBTUGZJT2lWRXdNbjRwbFBrb0VKUnNsSTVCS0Zs?=
 =?utf-8?B?Q3pQQzF4S080SlNQZmdrODVQWkN2Q1g0Mk5iUWRFeThSMUw4ZjBkM3hjMVp6?=
 =?utf-8?B?WlVHZkNSMnlOODlsL09SbzVnRXl6cThlSkdYL0pDTFE1bnJhcTJ4eWxUTjd2?=
 =?utf-8?B?R3d6SzlmRU1ESFJpVkdrU005NGswdWl2VzNCK0JFNkl4Mk8zdG10bThkbWFk?=
 =?utf-8?B?MXAvc0E0Y1lMUi9oNXluQkw3ODdiVmVIY1AxRzhNTFZROElzenVGNFlxUVRx?=
 =?utf-8?B?U214WkhrV2V6bGtuVVFGWjZWZG1TVlJyUlc0RGxiS0Q3WnU2eXJ0S2pXZndQ?=
 =?utf-8?B?dVB6NCtQQzRGRkVHT2k1VXc3ZU9pNmlzK3pQY0lSbFFBYjA2eHVFTHBOR0F5?=
 =?utf-8?B?WlhiUW1yQzJ3akZvNENKTjcwVDJMVkc2bG8wbXIySjdSQklhejdybDJtL0RM?=
 =?utf-8?B?WFIyMXl1NGo1VHFXeFgzNEZ1M2dzbnRTcnYyQ3R0YkRvZnVIRDB3WjN2bkxy?=
 =?utf-8?B?cVVyRHNsOHd6cXY3Mjd3SFVTNks4WWNlZlcwVFJSTXlVVk5hYkFCdWtTYklB?=
 =?utf-8?B?a3EzWlJBMUszaU5CSFBWQnFCek5rQm40UzhYTFB3ZXRNYUVEelJUa2F5UDl4?=
 =?utf-8?B?MS96NjJ0OXdjSmYwTCs5QS9tVVBIMGUvdzZpdjdWWkVBZkNlcFFiVVlNSWpH?=
 =?utf-8?B?Uk1wckxzdUIrc0pvNnVqeEhOQUwrSTdoaW16dTlEMDhMTHRWN0hpaFhvWFdD?=
 =?utf-8?B?YTJ4c1JDcmZUcmZlZTcvZmNYMWJNcVVTNDJCbllEdVZta1FVUGNKNVloRXJS?=
 =?utf-8?B?WnpvLzFkMFlLL0FOOU56Z3FhZFJXbVJ1RkFCb2JKUzNWTWJEeDRnY1JoZmwv?=
 =?utf-8?B?d3dKSDgwZ21udkRVaUpOY1F3WlR3bXREcG91U2g4KzBRSzNubGJtQndldjVM?=
 =?utf-8?B?UkZLd3JGby8vRUdqNk1lMHcyRjJBMXdCdk1rRmlMWUtJRmd0WjFubytHaHAr?=
 =?utf-8?B?ellHdDg0NVloYzJsQUpRdVdaQmt1SU4xYWpQeEpZbHdMemNoNnp4ZE93cHFv?=
 =?utf-8?B?UHJ3NUh4ZE5UQ0kxWTcrUWI3SFhVUTZ0YXQzZmhwOEhDV05mVDg4cDRVNVJs?=
 =?utf-8?B?clF6Sm1PYW42QU1UNzBEVFhsZmJhelRtM3FHOXJ0TFV0UkxhYmZXNWlId0FN?=
 =?utf-8?B?VTFFTWk5YmxzYlU5RTV5TENMb2RiekZsb3N3bk9XZlJjN3NSald4N1VZMjl0?=
 =?utf-8?B?Y3dVV3pXeEFEK2IveDBKcWRSdktTNUp3VnNKaXJ0bExQa3BnS09maFZaaEIr?=
 =?utf-8?B?bnVzbnNvSHZCNG9idWQvYnBJK0g2S2NVRGR4RzlIKzJtUXI2eUIzSnBjSjVV?=
 =?utf-8?B?eElzL2xTUmEyU2xOSk5tR2lOUTU3Uy9VcUg0T2x5ZkdRaGx3Tk5jZ0Q3eXJk?=
 =?utf-8?B?UEFXUUxSVzRTQ01WdkJUSlpGQnl1djRlTkNveTlwcmhJUm0yOUF2eS9qWkxv?=
 =?utf-8?Q?Pw7MgOPrkzNLCs/9eRFidyBZSoXW4vkwMq/pj+pTzOF6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602e3726-68f2-427d-6680-08db4a546c1e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 14:57:45.6186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb2aX1uRM0/pbqkODNOZBpLUWpt1j4e19fkJPlqrpz0KjXkVXy9AYYos8mbzhJTu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8227
Subject: Re: [Intel-xe] [PATCH 25/30] drm: execution context for GEM buffers
 v3
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Just FYI I found time to work a bit on this last week and will probably 
send out the next version this week.

Christian.

Am 01.05.23 um 09:51 schrieb Matthew Brost:
> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>
> This adds the infrastructure for an execution context for GEM buffers
> which is similar to the existinc TTMs execbuf util and intended to replace
> it in the long term.
>
> The basic functionality is that we abstracts the necessary loop to lock
> many different GEM buffers with automated deadlock and duplicate handling.
>
> v2: drop xarray and use dynamic resized array instead, the locking
>      overhead is unecessary and measureable.
> v3: drop duplicate tracking, radeon is really the only one needing that.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   Documentation/gpu/drm-mm.rst |  12 ++
>   drivers/gpu/drm/Kconfig      |   6 +
>   drivers/gpu/drm/Makefile     |   2 +
>   drivers/gpu/drm/drm_exec.c   | 248 +++++++++++++++++++++++++++++++++++
>   include/drm/drm_exec.h       | 115 ++++++++++++++++
>   5 files changed, 383 insertions(+)
>   create mode 100644 drivers/gpu/drm/drm_exec.c
>   create mode 100644 include/drm/drm_exec.h
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index fe40ee686f6e..c9f120cfe730 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -524,6 +524,18 @@ DRM Sync Objects
>   .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
>      :export:
>   
> +DRM Execution context
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_exec.c
> +   :doc: Overview
> +
> +.. kernel-doc:: include/drm/drm_exec.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_exec.c
> +   :export:
> +
>   GPU Scheduler
>   =============
>   
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index e928284b4357..39c9d079d52a 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -201,6 +201,12 @@ config DRM_TTM
>   	  GPU memory types. Will be enabled automatically if a device driver
>   	  uses it.
>   
> +config DRM_EXEC
> +	tristate
> +	depends on DRM
> +	help
> +	  Execution context for command submissions
> +
>   config DRM_BUDDY
>   	tristate
>   	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index ad6267273503..ab728632d8a2 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -80,6 +80,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
>   #
>   # Memory-management helpers
>   #
> +#
> +obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>   
>   obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>   
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> new file mode 100644
> index 000000000000..f645d22a0863
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -0,0 +1,248 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +#include <drm/drm_exec.h>
> +#include <drm/drm_gem.h>
> +#include <linux/dma-resv.h>
> +
> +/**
> + * DOC: Overview
> + *
> + * This component mainly abstracts the retry loop necessary for locking
> + * multiple GEM objects while preparing hardware operations (e.g. command
> + * submissions, page table updates etc..).
> + *
> + * If a contention is detected while locking a GEM object the cleanup procedure
> + * unlocks all previously locked GEM objects and locks the contended one first
> + * before locking any further objects.
> + *
> + * After an object is locked fences slots can optionally be reserved on the
> + * dma_resv object inside the GEM object.
> + *
> + * A typical usage pattern should look like this::
> + *
> + *	struct drm_gem_object *obj;
> + *	struct drm_exec exec;
> + *	unsigned long index;
> + *	int ret;
> + *
> + *	drm_exec_init(&exec, true);
> + *	drm_exec_while_not_all_locked(&exec) {
> + *		ret = drm_exec_prepare_obj(&exec, boA, 1);
> + *		drm_exec_continue_on_contention(&exec);
> + *		if (ret)
> + *			goto error;
> + *
> + *		ret = drm_exec_lock(&exec, boB, 1);
> + *		drm_exec_continue_on_contention(&exec);
> + *		if (ret)
> + *			goto error;
> + *	}
> + *
> + *	drm_exec_for_each_locked_object(&exec, index, obj) {
> + *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
> + *		...
> + *	}
> + *	drm_exec_fini(&exec);
> + *
> + * See struct dma_exec for more details.
> + */
> +
> +/* Dummy value used to initially enter the retry loop */
> +#define DRM_EXEC_DUMMY (void*)~0
> +
> +/* Unlock all objects and drop references */
> +static void drm_exec_unlock_all(struct drm_exec *exec)
> +{
> +	struct drm_gem_object *obj;
> +	unsigned long index;
> +
> +	drm_exec_for_each_locked_object(exec, index, obj) {
> +		dma_resv_unlock(obj->resv);
> +		drm_gem_object_put(obj);
> +	}
> +
> +	if (exec->prelocked) {
> +		drm_gem_object_put(exec->prelocked);
> +		exec->prelocked = NULL;
> +	}
> +}
> +
> +/**
> + * drm_exec_init - initialize a drm_exec object
> + * @exec: the drm_exec object to initialize
> + * @interruptible: if locks should be acquired interruptible
> + *
> + * Initialize the object and make sure that we can track locked and duplicate
> + * objects.
> + */
> +void drm_exec_init(struct drm_exec *exec, bool interruptible)
> +{
> +	exec->interruptible = interruptible;
> +	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
> +
> +	/* If allocation here fails, just delay that till the first use */
> +	exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) : 0;
> +	exec->num_objects = 0;
> +	exec->contended = DRM_EXEC_DUMMY;
> +	exec->prelocked = NULL;
> +}
> +EXPORT_SYMBOL(drm_exec_init);
> +
> +/**
> + * drm_exec_fini - finalize a drm_exec object
> + * @exec: the drm_exec object to finilize
> + *
> + * Unlock all locked objects, drop the references to objects and free all memory
> + * used for tracking the state.
> + */
> +void drm_exec_fini(struct drm_exec *exec)
> +{
> +	drm_exec_unlock_all(exec);
> +	kvfree(exec->objects);
> +	if (exec->contended != DRM_EXEC_DUMMY) {
> +		drm_gem_object_put(exec->contended);
> +		ww_acquire_fini(&exec->ticket);
> +	}
> +}
> +EXPORT_SYMBOL(drm_exec_fini);
> +
> +/**
> + * drm_exec_cleanup - cleanup when contention is detected
> + * @exec: the drm_exec object to cleanup
> + *
> + * Cleanup the current state and return true if we should stay inside the retry
> + * loop, false if there wasn't any contention detected and we can keep the
> + * objects locked.
> + */
> +bool drm_exec_cleanup(struct drm_exec *exec)
> +{
> +	if (likely(!exec->contended)) {
> +		ww_acquire_done(&exec->ticket);
> +		return false;
> +	}
> +
> +	if (likely(exec->contended == DRM_EXEC_DUMMY)) {
> +		exec->contended = NULL;
> +		ww_acquire_init(&exec->ticket, &reservation_ww_class);
> +		return true;
> +	}
> +
> +	drm_exec_unlock_all(exec);
> +	exec->num_objects = 0;
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_exec_cleanup);
> +
> +/* Track the locked object in the xa and reserve fences */
> +static int drm_exec_obj_locked(struct drm_exec *exec,
> +			       struct drm_gem_object *obj)
> +{
> +	if (unlikely(exec->num_objects == exec->max_objects)) {
> +		size_t size = exec->max_objects * sizeof(void *);
> +		void *tmp;
> +
> +		tmp = kvrealloc(exec->objects, size, size + PAGE_SIZE,
> +				GFP_KERNEL);
> +		if (!tmp)
> +			return -ENOMEM;
> +
> +		exec->objects = tmp;
> +		exec->max_objects += PAGE_SIZE / sizeof(void *);
> +	}
> +	drm_gem_object_get(obj);
> +	exec->objects[exec->num_objects++] = obj;
> +
> +	return 0;
> +}
> +
> +/* Make sure the contended object is locked first */
> +static int drm_exec_lock_contended(struct drm_exec *exec)
> +{
> +	struct drm_gem_object *obj = exec->contended;
> +	int ret;
> +
> +	if (likely(!obj))
> +		return 0;
> +
> +	if (exec->interruptible) {
> +		ret = dma_resv_lock_slow_interruptible(obj->resv,
> +						       &exec->ticket);
> +		if (unlikely(ret))
> +			goto error_dropref;
> +	} else {
> +		dma_resv_lock_slow(obj->resv, &exec->ticket);
> +	}
> +
> +	ret = drm_exec_obj_locked(exec, obj);
> +	if (unlikely(ret)) {
> +		dma_resv_unlock(obj->resv);
> +		goto error_dropref;
> +	}
> +
> +	swap(exec->prelocked, obj);
> +
> +error_dropref:
> +	/* Always cleanup the contention so that error handling can kick in */
> +	drm_gem_object_put(obj);
> +	exec->contended = NULL;
> +	return ret;
> +}
> +
> +/**
> + * drm_exec_prepare_obj - prepare a GEM object for use
> + * @exec: the drm_exec object with the state
> + * @obj: the GEM object to prepare
> + * @num_fences: how many fences to reserve
> + *
> + * Prepare a GEM object for use by locking it and reserving fence slots. All
> + * succesfully locked objects are put into the locked container. Duplicates
> + * detected as well and automatically moved into the duplicates container.
> + *
> + * Returns: -EDEADLK if a contention is detected, -ENOMEM when memory
> + * allocation failed and zero for success.
> + */
> +int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
> +			 unsigned int num_fences)
> +{
> +	int ret;
> +
> +	ret = drm_exec_lock_contended(exec);
> +	if (unlikely(ret))
> +		return ret;
> +
> +	if (exec->prelocked == obj) {
> +		drm_gem_object_put(exec->prelocked);
> +		exec->prelocked = NULL;
> +
> +		return dma_resv_reserve_fences(obj->resv, num_fences);
> +	}
> +
> +	if (exec->interruptible)
> +		ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
> +	else
> +		ret = dma_resv_lock(obj->resv, &exec->ticket);
> +
> +	if (unlikely(ret == -EDEADLK)) {
> +		drm_gem_object_get(obj);
> +		exec->contended = obj;
> +		return -EDEADLK;
> +	}
> +
> +	if (unlikely(ret))
> +		return ret;
> +
> +	ret = drm_exec_obj_locked(exec, obj);
> +	if (ret)
> +		goto error_unlock;
> +
> +	/* Keep locked when reserving fences fails */
> +	return dma_resv_reserve_fences(obj->resv, num_fences);
> +
> +error_unlock:
> +	dma_resv_unlock(obj->resv);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_exec_prepare_obj);
> +
> +MODULE_DESCRIPTION("DRM execution context");
> +MODULE_LICENSE("Dual MIT/GPL");
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> new file mode 100644
> index 000000000000..65e518c01db3
> --- /dev/null
> +++ b/include/drm/drm_exec.h
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +#ifndef __DRM_EXEC_H__
> +#define __DRM_EXEC_H__
> +
> +#include <linux/ww_mutex.h>
> +
> +struct drm_gem_object;
> +
> +/**
> + * struct drm_exec - Execution context
> + */
> +struct drm_exec {
> +	/**
> +	 * @interruptible: If locks should be taken interruptible
> +	 */
> +	bool			interruptible;
> +
> +	/**
> +	 * @ticket: WW ticket used for acquiring locks
> +	 */
> +	struct ww_acquire_ctx	ticket;
> +
> +	/**
> +	 * @num_objects: number of objects locked
> +	 */
> +	unsigned int		num_objects;
> +
> +	/**
> +	 * @max_objects: maximum objects in array
> +	 */
> +	unsigned int		max_objects;
> +
> +	/**
> +	 * @objects: array of the locked objects
> +	 */
> +	struct drm_gem_object	**objects;
> +
> +	/**
> +	 * @contended: contended GEM object we backet of for
> +	 */
> +	struct drm_gem_object	*contended;
> +
> +	/**
> +	 * @prelocked: already locked GEM object because of contention
> +	 */
> +	struct drm_gem_object *prelocked;
> +};
> +
> +/**
> + * drm_exec_for_each_locked_object - iterate over all the locked objects
> + * @exec: drm_exec object
> + * @index: unsigned long index for the iteration
> + * @obj: the current GEM object
> + *
> + * Iterate over all the locked GEM objects inside the drm_exec object.
> + */
> +#define drm_exec_for_each_locked_object(exec, index, obj)	\
> +	for (index = 0, obj = (exec)->objects[0];		\
> +	     index < (exec)->num_objects;			\
> +	     ++index, obj = (exec)->objects[index])
> +
> +/**
> + * drm_exec_while_not_all_locked - loop until all GEM objects are prepared
> + * @exec: drm_exec object
> + *
> + * Core functionality of the drm_exec object. Loops until all GEM objects are
> + * prepared and no more contention exists.
> + *
> + * At the beginning of the loop it is guaranteed that no GEM object is locked.
> + */
> +#define drm_exec_while_not_all_locked(exec)	\
> +	while (drm_exec_cleanup(exec))
> +
> +/**
> + * drm_exec_continue_on_contention - continue the loop when we need to cleanup
> + * @exec: drm_exec object
> + *
> + * Control flow helper to continue when a contention was detected and we need to
> + * clean up and re-start the loop to prepare all GEM objects.
> + */
> +#define drm_exec_continue_on_contention(exec)		\
> +	if (unlikely(drm_exec_is_contended(exec)))	\
> +		continue
> +
> +/**
> + * drm_exec_break_on_contention - break a subordinal loop on contention
> + * @exec: drm_exec object
> + *
> + * Control flow helper to break a subordinal loop when a contention was detected
> + * and we need to clean up and re-start the loop to prepare all GEM objects.
> + */
> +#define drm_exec_break_on_contention(exec)		\
> +	if (unlikely(drm_exec_is_contended(exec)))	\
> +		break
> +
> +/**
> + * drm_exec_is_contended - check for contention
> + * @exec: drm_exec object
> + *
> + * Returns true if the drm_exec object has run into some contention while
> + * locking a GEM object and needs to clean up.
> + */
> +static inline bool drm_exec_is_contended(struct drm_exec *exec)
> +{
> +	return !!exec->contended;
> +}
> +
> +void drm_exec_init(struct drm_exec *exec, bool interruptible);
> +void drm_exec_fini(struct drm_exec *exec);
> +bool drm_exec_cleanup(struct drm_exec *exec);
> +int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
> +			 unsigned int num_fences);
> +
> +#endif

