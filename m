Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1BFCD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 21:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78E81123E6;
	Wed,  3 Jun 2026 21:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwZlTZMk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6ACF1123E6
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 21:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780522860; x=1812058860;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/KAnqNtJm2mvb/5pl8ct7kbq51bogSqQ8Q92+1UK/Mk=;
 b=mwZlTZMkDFJcw7yxySYwuLmGsTKxN7AR3kM92vtUKRRUX66D7wNVXy9t
 EA8VfnZ9gpw4f6QtjvAyLp0uRM2f6M5sP4yqHL3EpkybJS1v/vzbAr3Gy
 5/b0Wn7+0evDYIBISpjP8XJslF77LESQyk2MJeQN5vUXyh1J3vfiUhj0d
 hHVW204ZamrjLKg1RFYhwKZ08cpSjvx0Rkqwx7x7trick8PbwkY5aJ669
 lGWzDXp0WSU4npm+y//mDFQgGoanaOgPSiXl6BmU043zSHICNcwkzgPFd
 zJXPZnfyi1Bg+2ZQmnxpnR4Ax/xDBaE2wpXAh8EeYGwBTvu9K8F36UQEx Q==;
X-CSE-ConnectionGUID: aZJ3Gh6ERm2f4aDQ7jKJsA==
X-CSE-MsgGUID: wtoz4DRzQHGCeFiV3S+fTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="98918682"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="98918682"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 14:41:00 -0700
X-CSE-ConnectionGUID: ohjqthuESCiF8BGnqfqXzw==
X-CSE-MsgGUID: FGHuwh31S+WDbmmQVMux7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="238015798"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 14:40:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 14:40:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 14:40:59 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 14:40:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZbhYuZgNuFRRYPd9TJo4XlJs6/J8TL3QzCo/MNUkAMXTcg6tSN6pcDdugi0lVyRTgT0fuTpDYpsK5m7FkFTgkqSfLy56gCfeeYXDB943MfNQvxfwSgbZ6QrM2q7U+4Qf7ZfY/lqnLgTBo/RpF5j1nDIAof/y05fFm4+EKgwyx2WLskEeU4WIBOA+cpt3OTiXQ3jbSmObeiJs6cyE7bQygZhdPT5twugW0/FUQhwial2pWA17w8gLLP+f8+FYA0hWnp4kVXIqBlvgyPLX92bWkZ/jwIC2W41jDh6W7M3VtsckIbaxYnf8viPD9v/r/T1V5WEw8kTTawHdRB+xX6qgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXM+i4d7P5mvOJip+fRnKZdAjtmxCh6HQvfHBU3bPeA=;
 b=tw/WF3pwIsNLv/VwxFlVRu/0p/9IR2MaMVXx28pr7Tg75bK5TTO821cNxfo/NePfDWSOraX2jld4QFnmcoWJmhG+YmwWGxm4JPVg4RNT6O15o+BmOa4+CfBJ/s7WJPir/DT3rC+GUiFfZ302n8HabOCkd47x/iFmVzSN9PUp+yO+FSvIRYnT5etxC2S2jOpf/m/CYy6Ws6O1b+ahV9zknJw9sMb7PMjz1sG+t/Vo1P1RmnQFRLXe+w2AERy6POf+/M99JYID6XeauW3BhLJtjSuSgLbWJUCDFBWZ+jDK4x/leHKqdnEw6sM68QEhKSHM64Y0pR0n2g+rp928hwmuPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ0PR11MB5167.namprd11.prod.outlook.com (2603:10b6:a03:2d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 21:40:56 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 21:40:56 +0000
Date: Wed, 3 Jun 2026 14:40:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/multi_queue: skip submit when primary queue is
 suspended
Message-ID: <aiCfZd85gn23AH5A@nvishwa1-desk>
References: <20260601234642.817231-2-niranjana.vishwanathapura@intel.com>
 <61f82f17-1f19-4604-883d-9e6fb39489db@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <61f82f17-1f19-4604-883d-9e6fb39489db@intel.com>
X-ClientProxiedBy: SJ0PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::18) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ0PR11MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aec4d41-9f1c-47a4-d384-08dec1b8cb7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: +udv4PDlLNIoHmjREZZ9/jWliOCwpKgHHH2Mt93Gb3mqNrnxuDGbo2jlpVo5XzRxMAkRo6AY8A+kJoeDIyfVCuiReYcahb6NRtv/VvzsuRspmsIOkBR2pvQc3rKFiQTOALyzzzzdm7GDDEuHIvrQmkuH58dl7TlRV7gIxyMbqgG/wYxSrykl6koCvP0rWU4/DQg7zxpcmQ3FGevmQqdUigIVuOIzcazptOrLjvfNYf+AMotFYOYaKGZVQ6Baidx8cjCPcfeVlRJP2hY+aVTx/l+qa98W8V9NGpzDYdMcWVdwFHs7HhWp/GVRNh2G2tsJymj1RgEIMkvlS5ZYGZ6gxTJkPuP1ZRmXdghWd3Mt0nC4PQdjNLUFZf/p4AYGQaSo/qIcZjo43zidEwHI1dJ7ZnIFso2Gt+s1p14q3lr/W1894I5vOtfiF3zfm0idUkkv+UwLJx4EMOv1ILu3kDMdTMnVW6Xo5XsAkMQ4lF8koINZEkZuy/jO80YP1zgiehFBZP6T4vHCpnxL81m0V84eUFuodh0zYQs6TUfyDjbtmyYHzqy9+fG30gV9eKqiqlwx7BlrPRQOOGJrLquYZu3WgIXb5cy4LvhXG+bdYgi0/tyBXl4G1Hkyu7MLT7n3BKaugYXxpRkdsWIKx34bTwTmyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n8XwQOn4UAorF+c4R/jKbdMm2AqHxV8EqoQsuDSJstPtqtd04rE0aKYNkRW1?=
 =?us-ascii?Q?uTXEMrKyD9iyuveH9mei0w+8vrE81CoEwYSLOEKyq2FusaOLqm9BQAvqoJNh?=
 =?us-ascii?Q?RvqnwSTR7HcfYRShdKKkDLMwsNuLEn3CNzXwBhkXnSMzdXvFnUmLzJy9UxXU?=
 =?us-ascii?Q?eCIRYN1EPDxXlmKgsm4lNTLkRszXrxN+qhzeq/IpfrCmIl9GxbU1uaN8X353?=
 =?us-ascii?Q?WwmbbPwVVIHObOlzdRuygS0023sPHAf4tNORD6rZsuMa7PFDHEUGRHyovZGF?=
 =?us-ascii?Q?kHUYOdfDCjWNr2zCxeedYWMCW02bBAVgtp4EfJf9PmSaDqmAGhAg3Oi6eIaS?=
 =?us-ascii?Q?3ZMw6deIPIN0PS6AiO8A8aLS2Dgyje1NFcfcrSWeQ4+bV3YyPzOjTcHNamXu?=
 =?us-ascii?Q?BIMpHK3XdtZnistVUyYt0MqH1vDzpaQ9qxhjt8IKWSvmxa6KbbeSEz02Jnde?=
 =?us-ascii?Q?khajpwhWv16pNGK0TwwoX5NJ7oEsp5R9g4eoaOvvzsQZiAh1YhfPRIMWvSCl?=
 =?us-ascii?Q?C2l5XNlIG3Ftjv4YXa3aB5QkwLkPYOezAY8LxqYMG1Fe0lKT3pcGpfSPPcN/?=
 =?us-ascii?Q?2ARNFITmzkDvEtR82EYTa9FuiDF2DEfGaG/+saKi+Or4j1NS4m0G1ho6am+h?=
 =?us-ascii?Q?udQcSQ/kAEJrtJyagGiIArNjd/e2k9MINi24jcel9et7pSADl/pwW/S2R6zS?=
 =?us-ascii?Q?YGQgUk398PmBs0ClYZdH2YMSDYO553usvEVQbSNZd/p0zUBu+CgFaHE44IWH?=
 =?us-ascii?Q?bsr7FKkrmQ53bek5AqbDAtC+mTAgTKOVq7RLXKCxguCh1//1VdRLhiQwOPVU?=
 =?us-ascii?Q?Edkx2tJ+WLTxMamN61Wmuwn6HOfkXASNMk1OVQPX05QfPruciSd6+VBl0lUv?=
 =?us-ascii?Q?DVYPHTqEw4Vu7ASzAFszhoksig1f6wAgB0xAzg28HJGFWQqPTfh/m9ZJ/LMq?=
 =?us-ascii?Q?wHS2FOZljpGGfwoSXSL0L/skDLt6w9v6zYGHZIrY1OvI2JXcm8d+Iwnvsx8L?=
 =?us-ascii?Q?JOgbLxU5NSOPmssCXDwOe2TC/OjQQ68BlF1gwn7/cDEXoqXk1E78S1OkXfm2?=
 =?us-ascii?Q?Gz8HD2kUbEkhmDqavBSTMyFP2EtkrbHQw2obCgMgRlsMlSHMx2hkUOYNd85Y?=
 =?us-ascii?Q?pndn8L2/bbHVwnZNS5riIT5KTVGbLS0XqkxwwDtIkUyuTLpWP17FXZDLh6Ze?=
 =?us-ascii?Q?FFkJ+4BKZAnDyENacrUrmLdW5LIwNzRaKXnuZaMAulrhYg/9kJapDTf9dxg3?=
 =?us-ascii?Q?dPwVHWOrJpekEHR+dhdU+NyvjcenoJWt8e/KFZeL03vIvRiHb88CppAC4oap?=
 =?us-ascii?Q?poXUdleqVahY0WZwXzBpPj34w+IatdNNLSJyEjl2a34lx1jVkwyvfUarQO3D?=
 =?us-ascii?Q?d1eJ2SAuGQs37mxtl5LfS7m0OB18zE8FXltGUFZnxXpsyzzkm5Xz2xeE619O?=
 =?us-ascii?Q?8cxsvXrcF6ZGedDTCVpLr5ZpOc0puJ35S/E+w5UC7b87TbMI3vO19F+RdMud?=
 =?us-ascii?Q?0fVw+0z4OGCSn276ytFjhhQYUEvxQ/MptwUhIpsFFXknm7c1Y7T16kTAcLvV?=
 =?us-ascii?Q?hymTqQGeudtGV8vKioNDimym0OfK7Q/zJn61mHCaxMxG3ah5VZtu4wWIVikk?=
 =?us-ascii?Q?e3nbv83il9YInJXOFP5EWFdTaXZnq4Y6mgeuOxk5ZDUT0fYDaJDFuy36SRJ9?=
 =?us-ascii?Q?DUmGHvEiZzxuPWXmg09s9tNyuz3SD2riSZibd17dNfJSFPvBjNsKcbCIGQRj?=
 =?us-ascii?Q?fa5I/MblcN/0EAUF1OC1+cJubQa7joBDib+eYIVVsFmoZ+dKO1MX?=
X-Exchange-RoutingPolicyChecked: H3jZqmUbImFqvJDem2Kx7lWrSMckl7tUVcnoooo1UB7T/0iSib9Wg0FIdowo7OoaNZJ+rF1gUNO+0SRSzi9i2XLdcw4wEk9mFY3u8Z6qhWDWPMCJz7PvEHQaDr31zh/eP29vpIPYXArjWvXMz5dzpZ4BdS4JEBj8RBI9GtZ0Y4tasDQt7rxsrLnst5olf+Z3Mb0P3JKHx0TsV6fJpq5uqL97wO7xHc9ZdsXLzu6d0dmFhKU7Mq7c9wx1k/Mbe1XLqnLXMX4bg6YzBAbrm9qGDY9vqM5yjDcYq4iglzg7cxEGlKYRtwoXFTS0qUtG3jAQ2u7PkWXeG5kFFrXqtTjWBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aec4d41-9f1c-47a4-d384-08dec1b8cb7c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 21:40:56.6501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3d8BTFROeXlxMhdaX3xfg2mIS2xrpRq5szfwwyoXK7n0skbtyQvCw4Hnh41nFtDedkkL1NiX8uIrFqieLHnsK1TgXIsXXZIMAHctd0JB8qFfUeCDIwMgb582oVrCwU2t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5167
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

On Wed, Jun 03, 2026 at 02:00:51PM -0700, Daniele Ceraolo Spurio wrote:
>
>
>On 6/1/2026 4:46 PM, Niranjana Vishwanathapura wrote:
>>Return early in submit path when the multi-queue primary exec
>>queue is suspended to avoid submitting while suspended.
>>
>>v2: Remove idle_skip_suspend fix as that feature is being
>>reverted here https://patchwork.freedesktop.org/series/167262/
>>
>>Fixes: bc5775c59258 ("drm/xe/multi_queue: Add GuC interface for multi queue support")
>>Cc: stable@vger.kernel.org # v7.0+
>>Assisted-by: GitHub-Copilot:claude-sonnet-4.6
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>index ab501513d806..30595ecc7f92 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>@@ -1167,9 +1167,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>>  	/*
>>  	 * All queues in a multi-queue group will use the primary queue
>>-	 * of the group to interface with GuC.
>>+	 * of the group to interface with GuC. If primay is suspended,
>>+	 * just return. Jobs will get scheduled once primary is resumed.
>>  	 */
>>  	q = xe_exec_queue_multi_queue_primary(q);
>>+	if (exec_queue_suspended(q))
>>+		return;
>
>I'm not an expert with the suspend/resume flow so this might be a dumb 
>question, but in __guc_exec_queue_process_msg_resume the jobs are only 
>re-scheduled if !exec_queue_enabled(q), so is it possible that this 
>job will just be lost if exec_queue_enabled() is true in that check? 
>It seems weird for a queue to be suspended and enabled at the same 
>time, but if that check is there I assume it is a possible scenario.
>

That is a good question as to whether or not exec_queue_enabled() and
exec_queue_suspended() are both be true at the same time.
But here, all we are doing is to ensure we apply the same check that
was applied few lines above in this function after we switch to the
primary queue.
ie., we have the below check few lines above.

         if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
                 return;

We were not apply this check after we switch to primary queue. I am
trying to ensure that we apply that check for primary also. The
is_parallel() part is not required as multi-queue and parallel queues
are mutually exclusive.

Niranjana

>Daniele
>
>>  	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
>>  		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>
