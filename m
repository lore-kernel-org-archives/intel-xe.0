Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17798CCFA02
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 18:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE0910E160;
	Sat,  1 Nov 2025 18:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Th+u+mDt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4996010E160
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 18:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762021980; x=1793557980;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YKt9CtLPeYDBli3YgZfqMZg+N+g08qEuc8a/FLVir4o=;
 b=Th+u+mDtItlqcu1NOmmIz7h+M9W/iAmiesjfX86IKsf30qdN8ja7YrCI
 Dci6PvO4dLC4PZq0sIBxegh18CvMkvghePTpTbmSf1jAACNV0Z0yPKu1z
 uZujp5RWljQy3bJbDPxsSdUdhKbVU6F1YO2h7vNSbPyaxsPTHg09lwFyr
 /gVaEu+gK4pckhqVtihyo0OAOn6djnLpCMnxJ+LpZehlVh5NKiFNqs/UA
 VxXRlGqsPUzUP3//BYe7ZE5mLMrZ0XM777PFa7JjTNKzwFw6gNcHPnTCT
 LQTXWwy4EP4n2Ibkzvlu0ha0YwMf96XYoIBU83civseW2JciscTvBzZfK w==;
X-CSE-ConnectionGUID: MHwUIwIOSwyEV7Q2njUlmg==
X-CSE-MsgGUID: ohtkjbleSaCr8lRYnFTODg==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="63854833"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; d="scan'208";a="63854833"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 11:33:00 -0700
X-CSE-ConnectionGUID: 3QZaCMDhTzyHOOYh4vVGHQ==
X-CSE-MsgGUID: Jz4ebqfgRa2IKrtvId12Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; d="scan'208";a="186829508"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 11:33:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 11:32:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 1 Nov 2025 11:32:59 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 11:32:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKYjZqWn16dtdl3ZwZWP1UdSUKrjpeHT1CT7uGaDH4vzqEsi7JA0ZYUll28dlkmcWoYt5dFAQYDOo/Q/w5B7EC41v5G+Oy6iXWXs5jftsYxYCOKm6THYddpxinWih1YS2WjzLfAVT7O3MiPdMV5h0BddbkXlH1a4hy5Fuva5/tJRTIRdnw5fo59UIZ3QkaWgV4ajyzyVuvz8QtSatBZsMWA6qTP0knnorwpRuy25PaESShgqtEwwB1Dhwlwe/V5b1D/HF41JOPZ0Glm3Oj+qZejVIX9xJm9h+EQx7Qqo/M8GLBCmKj0H1ufb4oGPz/GbNmokbBhxKwlYw2m/pWgdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTjjB5rmsieejedpPcEXaqxEn+KIASEyEIVxIpnEJ5w=;
 b=JMxhqwEB5Epoq83zHUC4UK9AW/2OYh/m/r0LCZ09/wE6FwJhyrbuhrZZcuFBecL9SGo7YFJs5+LRVOCBVVe8RTqwbsK00m9cOUM4T+wNLGwf3eStCa9RGmzkOMUYjXrglpP1uc/wNIzsBWVZJeZqWpFYKcORITgdIzCbPwnP9jbJFRiuHwK1f50FN1A3ry3yRmbL20G6cUsNkf15v4c8utMGL0sZYvFC4T08INwiqUvaBvDrjtj4GgbXZEeupSAd3xFyBBCeQZXLz2g+vea7WmNvhKsNOgkjjV/8I3073C5lF8ZHkk5som41wmbrcO4R4PcmbxoEVTmeFoK/iyj5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6916.namprd11.prod.outlook.com (2603:10b6:930:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 18:32:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Sat, 1 Nov 2025
 18:32:51 +0000
Date: Sat, 1 Nov 2025 11:32:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 12/16] drm/xe/multi_queue: Tracepoint support
Message-ID: <aQZSUY+hUP6ETaf/@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-13-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-13-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2a25c4-81a5-4d66-da33-08de19751089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4BjbTXzp0PmkoBsgU9SwzQ6zoyNt1gnYDspzQJvO/domo5fBALZUvei7tZMl?=
 =?us-ascii?Q?4mIZBMHSGbglCreceSsX4OgsLb/Jt2Ox461M3YWfvm7/Bde7VvO6581RDG0g?=
 =?us-ascii?Q?56OvnSKKYqvfdFr1F5Qhsy5sdK3aOWntkRhbi2g/6IO11qJMMx8BtK7hV7c6?=
 =?us-ascii?Q?lJc5BeXkCPQNZEgsR+yQflH5Go/4IQzY4T5k9YQgG+5XKzNezqEq5NvmdBlS?=
 =?us-ascii?Q?Q1/rsTZIm8O87rI2Q/0aH4vv7sY29OMlBVlmr9PwenJ22dbMoEU00pDrO8up?=
 =?us-ascii?Q?Jx2xzsND2c+Z7m0K0y1a4pmd7s89wQyIf2BkZ241kgrcjm82a5g06xS9rz4T?=
 =?us-ascii?Q?Br1Te9CRqRoL9RJhDfMbByTABiQ8+uRtocD+aW+n4naphexac0Jz9tO9x3oy?=
 =?us-ascii?Q?uQD3t9pyAqccgnV+tIrRHEQ6bOUyeyrFzN/yy3xlhUrYkMxpov3saCXMWlQA?=
 =?us-ascii?Q?IkGEgJvp6+14ZA/xRCmY2LCJkqghJj3gyxrfXaZUydznFN1YFeRD2micP+O5?=
 =?us-ascii?Q?qv13Aqjpy9K1OnSIxq/aSnumgZKqOPxNArveU0eaIlR6gURsZVwx2dE8ZkTS?=
 =?us-ascii?Q?8+sTO8Gk1N9NGXoau1gfpkAu6p78GaUxTQkRhIeduju5kULbG3V6yBSy/3c8?=
 =?us-ascii?Q?BSYtBSvQApHnVKc2mTSMf01ugbCfLiKGdoicWtdMsOkoVmZjXl7A2maBvJf7?=
 =?us-ascii?Q?sngfzWn4VBQ/pW6EScyzNTs5UcUOMOSLfTAKE6PRLXT6p7iTqiOkSj0u1GC9?=
 =?us-ascii?Q?PqiAm9vz747+rHII6iHIqzZrXPsm+iqCZ18d7GOjnZunzG+QgSzNJH14YXzD?=
 =?us-ascii?Q?NpaT3eU9+yJ+SAD8SQfXOv19DZ6YI8ZbzcsaJv/E523N6uUEN5ijD/HLQTJE?=
 =?us-ascii?Q?0vinkhnWrTOHGqxDWEAuaTetrPQt8XcebGzmT2/RO3Uj0qtDVfzmUO/usxer?=
 =?us-ascii?Q?U0vLOPS1mb7sEhGWRDU/PqUcX7Ym0It/sn3LE+r2yzttygU1wljCsRbuo9cC?=
 =?us-ascii?Q?5XKf70EHS+1QIBZxOJOaV1aY67Kg54FpSWGnyWa7pPgWwM4gUsyqp4kHvfu0?=
 =?us-ascii?Q?W8fSoJaZHedt0E6u2Owk3prfApjDdpbfES7wW6mB1qJ4jAdLPYw32pEY7pB9?=
 =?us-ascii?Q?qQzm1jRjoY7uiRM8JsA1iF6e7rRVUklYND0ZFUNQ78r8a3gJ3OKlqmym5Y1P?=
 =?us-ascii?Q?d1khs9Tmsg2qPjwzEbkHofhHvz+BsDn+nqKizkSAEI8EzaA41I3Hj6HJAu9n?=
 =?us-ascii?Q?PBOXzTHD2qEwwDvsRKfm8cZsGGA6vrEx/qSJOeQJw5Fi7IenFO8oxBkNbUmj?=
 =?us-ascii?Q?EPbskTwfKVzrkr5og46fyUGFcsrkNy3NtIYuK0GJqqNViXpHXYXIXEJ1HP2C?=
 =?us-ascii?Q?LFNDACQhZgESBEUx5t7aKhrYQuEDZeBue7e2eWpfqqYsrl3oZ4vg7OPHWajm?=
 =?us-ascii?Q?j5nMfmzZVBuaU2kfkbAhnOSX5u3KZ2hz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vXNrOq+HGVQv7t70wiM//6AN+2FneuILAJRoxHNAKRKSBfpD6f6VMsUQ+EZN?=
 =?us-ascii?Q?5b8HOqqYFCQrwvzg/VoVbnhyowXS4G+jKsK2J5tRXNtLfMxSKD6wiZMt0oYB?=
 =?us-ascii?Q?EpeZ5K1qUIm0CV4PtwDTiKWjEWbacmjQrstsR9ZLMCXCtLublOHF4JWe8k4M?=
 =?us-ascii?Q?RsRaAnaRHAwgKfEN15RRAfdKPUCXR8bsUiJN3GWFA9qd7l3ULIyqQ5kXbRJp?=
 =?us-ascii?Q?vZLdeAzX6HTJMxt6PkCkic7t6O3/tHPBO7IGsHBrIZvQM6TIkiHrtRWvieVQ?=
 =?us-ascii?Q?a1y6+lUeIg+R5XDyt73dkTnwERNO1sBREbzvg8h8C30XhGZa7Uog4/bMaIN5?=
 =?us-ascii?Q?IJHVBOpGEg9HrwJYTL7Pt8DT/jnTTz+soP8vWmKkQBKoUbGzhTV0sMW+xBYO?=
 =?us-ascii?Q?8bKUKuqPleWZNXUmxkIjhALuhhI1mAPtEsyx9/V0qek180obR8uWr4KSEkyb?=
 =?us-ascii?Q?DwNbZLAWsdnaFxGsPCVEsZOfVu/4uroJcMOCEJ725KQs6KOmzc3+L8WNnIcV?=
 =?us-ascii?Q?5m81Mf++ccyWDxdGJP3VzaeTm6EHSoNe0HKwuqnziNkeyPAltDbQ8AJ35qxv?=
 =?us-ascii?Q?SbtLz55auwQw4oxtTkF11Uu7pfaH04YZxG9qFDMe4yYKbahMhuqsUAYZGXiM?=
 =?us-ascii?Q?u+u4ReocrPvO8MU4otuwKIFwMAWrPYcuHk6eEs6f7F2pIgY2WL/4GYK0PBd+?=
 =?us-ascii?Q?DcfonDbQhoqCESO/iFnOqcpZ9McNhmzjlzJ0Bel9roSisF4lCIWESqDgQueR?=
 =?us-ascii?Q?rVNFD+XMwBnnjVJZd6yBb/NcFM8PE5D5VqkOWKB7yu2rNKeHbVxSsxblfV3x?=
 =?us-ascii?Q?x3ZgHZ3r/qiVAGDexEkADzCaEbwZ+GAj1kXAXJ1NUNfYK9F9IBSPBmUKZNaZ?=
 =?us-ascii?Q?XGbIUIoW3EKb8S7mF4osNPaHSIOwEA40/qPrk2BISTuhRkUmMMa3h7rt/u23?=
 =?us-ascii?Q?ZUldnDSNLxcsCsGQ4VMI7PqPPg5nfvWlz7h3ziM47Fppzsws3QwlD+DdZNLy?=
 =?us-ascii?Q?9gDjKwhgxAe5AEM6A5rctNLqwUpTS7zUngCByISWJZSBDUiwptMCMJPb1oov?=
 =?us-ascii?Q?jL9swOZso528ZpamKNmTg9vUmdwNrQVazgw2N51So0xn1Xh/Rkqp/iPFjpp/?=
 =?us-ascii?Q?f4oZtPgI62Pbw3k3EZzqv27ITE164p+PAknBR7l/s6cVtO7J4W5ltWL/a6D5?=
 =?us-ascii?Q?eagXq9DcVsVsTvTTLxzEqQP3G8msBJhPOs4XrAKiYk8xgYrNcHSFMbi7+d/o?=
 =?us-ascii?Q?ZeuFUltJ8NBMYi/isY+spVfTLhwVueVohgG//FUUxZtzBx3jz+DrEo+p3EEe?=
 =?us-ascii?Q?kSQCXlXXH9gUXA9aLqdCIkSCP0igmyY5XAEWOFi39MybEsL9/0gW1q9IMva7?=
 =?us-ascii?Q?hdpfJo5ozk44NF/HjoVS1vvm3fktSrsbKMUk4jEqI1jQYWulwSXGOjKH1IZD?=
 =?us-ascii?Q?Xsg7VutIeR6gOUyrYFuuzm0h/OiThOhmI2R4U2zM7Cy7KqBiU4gDP+6Pesa9?=
 =?us-ascii?Q?uZvy0nYej9klZ+kbGWQdcmx2yUrpzivsyGglM7qjs1bYOp1yrnJqoLvF6GQo?=
 =?us-ascii?Q?wzoM0kwveBir9BbSsjcigy83zykEIrz+egGAWD4oD/oAlBB/QelZ9/waJ6EX?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2a25c4-81a5-4d66-da33-08de19751089
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 18:32:51.3921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pC+9oFRPaxhPU7HsP0KPN0hWkNDqJ7XQS4nQHWzjQt7/pErsQWxenCNJZgxW2uJdkswG9FD9qGTqUz44qZjJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6916
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

On Fri, Oct 31, 2025 at 11:29:32AM -0700, Niranjana Vishwanathapura wrote:
> Add xe_exec_queue_create_multi_queue event with
> multi-queue information.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c |  5 +++-
>  drivers/gpu/drm/xe/xe_trace.h      | 41 ++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 605352145d76..bc7296edf1be 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2001,7 +2001,10 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  		mutex_unlock(&group->list_lock);
>  	}
>  
> -	trace_xe_exec_queue_create(q);
> +	if (xe_exec_queue_is_multi_queue(q))
> +		trace_xe_exec_queue_create_multi_queue(q);
> +	else
> +		trace_xe_exec_queue_create(q);
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index c9d0748dae9d..6d12fcc13f43 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -13,6 +13,7 @@
>  #include <linux/types.h>
>  
>  #include "xe_exec_queue_types.h"
> +#include "xe_exec_queue.h"
>  #include "xe_gpu_scheduler_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_guc_exec_queue_types.h"
> @@ -97,11 +98,51 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
>  			      __entry->guc_state, __entry->flags)
>  );
>  
> +DECLARE_EVENT_CLASS(xe_exec_queue_multi_queue,
> +		    TP_PROTO(struct xe_exec_queue *q),
> +		    TP_ARGS(q),
> +
> +		    TP_STRUCT__entry(
> +			     __string(dev, __dev_name_eq(q))
> +			     __field(enum xe_engine_class, class)
> +			     __field(u32, logical_mask)
> +			     __field(u8, gt_id)
> +			     __field(u16, width)
> +			     __field(u32, guc_id)
> +			     __field(u32, guc_state)
> +			     __field(u32, flags)
> +			     __field(u32, primary)
> +			     ),
> +
> +		    TP_fast_assign(
> +			   __assign_str(dev);
> +			   __entry->class = q->class;
> +			   __entry->logical_mask = q->logical_mask;
> +			   __entry->gt_id = q->gt->info.id;
> +			   __entry->width = q->width;
> +			   __entry->guc_id = q->guc->id;
> +			   __entry->guc_state = atomic_read(&q->guc->state);
> +			   __entry->flags = q->flags;
> +			   __entry->primary = xe_exec_queue_multi_queue_primary(q)->guc->id;
> +			   ),
> +
> +		    TP_printk("dev=%s, %d:0x%x, gt=%d, width=%d guc_id=%d, guc_state=0x%x, flags=0x%x, primary=%d",
> +			      __get_str(dev), __entry->class, __entry->logical_mask,
> +			      __entry->gt_id, __entry->width, __entry->guc_id,
> +			      __entry->guc_state, __entry->flags,
> +			      __entry->primary)
> +);
> +
>  DEFINE_EVENT(xe_exec_queue, xe_exec_queue_create,
>  	     TP_PROTO(struct xe_exec_queue *q),
>  	     TP_ARGS(q)
>  );
>  
> +DEFINE_EVENT(xe_exec_queue_multi_queue, xe_exec_queue_create_multi_queue,
> +	     TP_PROTO(struct xe_exec_queue *q),
> +	     TP_ARGS(q)
> +);
> +
>  DEFINE_EVENT(xe_exec_queue, xe_exec_queue_supress_resume,
>  	     TP_PROTO(struct xe_exec_queue *q),
>  	     TP_ARGS(q)
> -- 
> 2.43.0
> 
