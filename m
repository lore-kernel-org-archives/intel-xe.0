Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46861C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 18:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050DA10E141;
	Fri, 14 Aug 2026 18:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvkKwFrQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BD510E141
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 18:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786733431; x=1818269431;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Krqs9GOFqUZBDQZ1igV6HITGkodbHbexkUV2OYHsRlI=;
 b=JvkKwFrQN3/wGQb1u6kSEusD2BMdbd6T7RC4X7RA28vZCr11xX4SLe9c
 zymg4v1Shls4BSwxQzaFPGbKOFPw/4QwXX2PeykMumV97Rqzg6rLwC0cf
 +9uowUr5dIwD/T9GAp7rPQ1BwETPrgr3mfz4Q20CtZR4GU8KMUCfzSMip
 HimsW+ExcgmADlbI1nFBTNNVv7i0eVQYyFdddw37HQn2U2QhFN3YBXhnf
 2i2L/DOawzTTkddjJcVaD1DcczMa9M0Oordtplpg0AjfkrTP8I9RKq0w6
 2hASK2Uc2F+Oo4pIfKNRMSBswtywB0GWYBY8hKUya2tAKJRT4oRYmB51t Q==;
X-CSE-ConnectionGUID: iUKici4BSnOOAODu1S8Mgg==
X-CSE-MsgGUID: pqUwWybrQ8u3gaO7MUpoUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="89835019"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="89835019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:50:31 -0700
X-CSE-ConnectionGUID: esCc05RJRM2wJCeCc2l8tw==
X-CSE-MsgGUID: lM92Z8UGQL+CIJWpYUcZ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="258076357"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 11:50:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:50:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 11:50:31 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 11:50:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlhTdv9NmllAfPlnc00jT/nOErmNbcZzstEQ+iHV6vDShmptrjfUHCS3Yl9PI7BrH6KdqeSU3Yl3sEDa9LvldQQ75KvfhfRBlHMd7PxMDUatcfJ9QdAxLwJuWge3/4TIyiJBTVZZi6tBproMauiYDxET5cU/9xeecSnD7HZ/yJEKaP7qFlPvU4x0YMJGJ7UKTyhy95K95Z3PasAsZuu+OtzXvqmZoBftqwP+BeD0u1xRCs4fhGOEirJ7YBsl0cLxYIanW4jyGHikZ1h/8OU6UwABPRmWC9Qdwk0TWjZQP5nxc2jdx9esYKKvLtFnG7hTWTrWtwIzlNjFsUtLYZjM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Btqn9UZ9vxCr8QHYeqjbu6z4EMZPaoOF0K+DCjiFDtI=;
 b=RKY78Svh4ro3m8t42WnSjNiQlwJrartwejRuY1DDDiIjUJmmWvzbplelSTZLeEcGVpQ9HVYrzhcSEQye7NSuV4c1rGRjI8J9EyDMzadjpqXXlhZEvQgeP65HxlRtRFoao3V4DQRNJPMxKTuA/+pU3JFbWIoLjLKrRrqI2vBq93nEln7Hdh3RVwH/0G2vQ2j1NMlfnZpMa2WkpP26CRo6waYsFmE9igiFNpaWqdVnQXoD8Y3pAGlc9HE91UQ/FVpIWDRq6gdyMf72cOZkMgzXZFbNHMW6rTAqsQJBqbojzW60KuanUAG1EWDar6ANzdKrG2fQU4dyasYapRhdH9hKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MN0PR11MB6157.namprd11.prod.outlook.com (2603:10b6:208:3cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 18:50:22 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 18:50:22 +0000
Date: Fri, 14 Aug 2026 14:50:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v5 31/33] drm/xe/gt: Report 'Fault response' pagefault
 error using SIGID
Message-ID: <an9jak3zcIhELJ_N@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-32-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260814171801.13347-32-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::18) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MN0PR11MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: 72612058-d436-4c1f-913d-08defa34e53e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|4143699003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: UPsW9AE9ZG7hV1sCzVFZdvwO9hAyCnNRhGdKALole/9R2c1JQ5Ba1sQfHCi1btnW4wLyKhlW76h0BbN+wYD8A18nunHoqsQJ3i/0LWgbuDSzlgqwdMrs8/1genB2foRi02NZkE2J94MvltcAfX6OaBIzFLyZSlHYsY9BYAIOdixwKG+qO3qRWn+c7f4eo9wwvXR5E2CBmVggvoD+RNqfOlBvmjCgCBmDxVFjUcUobbBdfpbTrguc2ttfyLcT1VKtNt4GU82DzHZr/r8Ak4CEoc5HqA2uHcJalScFhTcTOPNvTmSFn8/AKzKXM5tU3SRIe/JnrFQWLv+vEOjGtog9CwGPesdMYIz0fTnK6rxWyluOCNLssD6T3PfXkxn0n6zUrTnmZdj24UwEAM7jbtpe7PK6ZCbAQ4JpVJk7AKL64+WM4Q+Q+GZTJ+q7yYUWbebPuemPh6/AvnbI0MNGgD9XtQ+xXvSS4DwN/lCs4AcPjhNOCUWrkujf2aL4nckQSTMRyM5iMyE1oRO2Z3BkXP25lRqI93Cn5kG7b7i252l9x5Waukf1VRpAB6emjhgNV3BN8QNFg9vy6CNqkUsPUJv37OvTp84sxj92ZivnGQ4c6XIJdantMOzEVSTmuhGrnjzpRd+sNnJv1sswExCX9WMZveC1HAmmIed4+pTWBpJ89eI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3eUryI4soFo4MYcIpazetHkTwHV5qQdBq9YHXwKpuLMz5M2GSpJp/eAKxuFC?=
 =?us-ascii?Q?ib0XakSinsuCOLC8gQArmdJv8L8q/FS6/P4/pfURgzI7sJ01TUR4xC2tj39E?=
 =?us-ascii?Q?O531iahpt8U1yQvP5jpOH+Npv2Gw9V9cIw63fwbZ3L5tOcHPtWwSIWC5uKeJ?=
 =?us-ascii?Q?MzS3NxXwOZ+FhH+utp9J5MBieq2wi5oRN35TZRk8j7JwEA1vaHCDTzG0b1+0?=
 =?us-ascii?Q?zsiF0CCx4mJmCSayAKmEdBGXLOQqoDnVLPEAcpZ0L6KB52YvYrg4gCgl6LVW?=
 =?us-ascii?Q?XGgeKG3KHCw5XbJmzPoBCQL1GLQ3rOrsBGytqt1iPMYgaJBdWOxlfzEbN6/Z?=
 =?us-ascii?Q?td6GaTCjoa+CADQlOQrSIHVcl7h0OOB5b/HoEgDiEXj3QO0w2VzePQhzGqck?=
 =?us-ascii?Q?iXF1RbEXjEBfXwThoNfDNvz0yv47kk2VupKod+QiQWWCl0lba8ttoLYXXGkE?=
 =?us-ascii?Q?Vq77LCQEAE2cOOdMY/4cUwlZbPpWqK3j69wjMcoJTNRN52ixmMqaHDHIOn9d?=
 =?us-ascii?Q?rdv3ywPsnnZj2PjJ74xNgtuiy2N59q53b9HgJM5MRmWpfmzyuWSEXnAJR9PR?=
 =?us-ascii?Q?YmiWJrMpresiF0CtyDy2QRqQBBdVctfpTqKGCN7C5jKCKVawAyMjpz5vFreK?=
 =?us-ascii?Q?PKYtNzqXzvIhcEerJrQmi1JrnF51tYXq32bmG/hFB82pjC7zq5aiBVsLt/cA?=
 =?us-ascii?Q?ulmzSfQgNkgXgJaaDLRgbkz1OAyn66eZn6MvGwLKabdDo3MQhwpU8OQI8sPw?=
 =?us-ascii?Q?JxM0XfSMgC3qQGGKiX4ClBIQQKbGmJqJUURVodw1tbY7/03bQFeUCGsupmep?=
 =?us-ascii?Q?YDDvUEysuQ/8ctfju4wgdyORgAttWAGpzdXCEsry33x1qiEMpAubve2Hmxcn?=
 =?us-ascii?Q?/Le0AfU7gzbrmOwaEai35fmQT7pxcKIzSK1sRcprBPf/mY7jciYvcvfInUvE?=
 =?us-ascii?Q?dx49e+K1gR7WnxWq1eBakBPmM2ea55IFZbLZSIA7r9HzfT1atnfbqrhv9gdq?=
 =?us-ascii?Q?f1f7uqQQC+HrRL3a00Y2n/W+kzdsoOCf2kCcWUJ5EPUNydzHcTojIiIljL16?=
 =?us-ascii?Q?ZKdlXZoGHFeBFAX1gIsCmv4x+mnt7iffhEWo11MgDiwzpGKrnTlpAtbfVy2b?=
 =?us-ascii?Q?a32ATMt22MCT9PE9+QXDFSOC1CLIq1ngy8d5Bh6M0V4pVG4ho7Z6Q3HqoleE?=
 =?us-ascii?Q?8L9zfmBulT5lFVI0wMjbca/aXWbXnbKMebZB02dTpjFJ03jP6soMLME9+AYL?=
 =?us-ascii?Q?9fjW+4h4kwQq+F/NohxUL5sEERV+zoh8hxzXiFfCPzlYQdMQPRdncA0KMD6c?=
 =?us-ascii?Q?zhct2xxPpeNpogAhWrYHQ+cBlj8EmEzfTSse/DQ8D7eCEnCeL+kRxsPOvRGf?=
 =?us-ascii?Q?KTcIAjdJwj8pS8BF92w7A/5nPjbmfc7rNYKvA/tipg1SEALDOlyoVzgbh3P9?=
 =?us-ascii?Q?scN4/MA+tgerJuTk3ApfPQX+etsdQ8lxASvNzc5R7/H7CoCJZvWcasj/rTXn?=
 =?us-ascii?Q?+/zVp/an+ijaH1dGGNTeP0i+6QYdSaN/9GXM/khZQhLrX7GVCZmsjpUJ4ZBK?=
 =?us-ascii?Q?2TgpmqAiY9t/pvzNpzkGCLM7uxjKYrDNp3FH3i7b/hf8q76isLcDrxhi84bs?=
 =?us-ascii?Q?+2Sv0KZOWwC+aQ0gsqx9hiK73R2ENKXUa+BrkKExESiMSgst5XLVoipfsRoF?=
 =?us-ascii?Q?MTYASHunRP0jCeByOEJXzYlNeGtBhNvoRBmRuLzDgw/ntQUe3oPqqJL/IByt?=
 =?us-ascii?Q?qpUSr5a8Cg=3D=3D?=
X-Exchange-RoutingPolicyChecked: MStF0GcrxwOr6Ve3kCMGq4Ij/kMzy2uQdt+aRGtEcttiZM9A4vhPM86Y+6f37ue6T/YYY+wzFpqBrj6Q6Lv4Sr1YfNyVMF0c17mAqzAbjs6Z5wZqjySsjlHsdrgs5kywBcz+paTWA8/dPHaglR2fU215iRU1PzhhVVvsC0321gO/EVTAhv2qeXoesHa4oTPGDXpseFj0iePWXSG56xiSTJsRg4eJKcMJ4rMd6Y0L9ykrJhMq4LZ7VkGQ2L6/8IHKAPdXFpeK7H+vk97qGIm0Oe3b8t+nYwECz2D9FymlomE0f+KSHiA68nnnaScHy8LiC5NYfzZVdjO/DAC658tpuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72612058-d436-4c1f-913d-08defa34e53e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 18:50:22.6134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJK1czsUpP/isV6gzZq+gLrAeLip00v05aM+PoBJJgFxqehCuAsjMxgT+RFkjT/LpL1vyZH9MIwSuWYDiP4qyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6157
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

On Fri, Aug 14, 2026 at 07:17:57PM +0200, Michal Wajdeczko wrote:
> Report 'Unsuccessful response' error using xe_log_err_info() helper.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: rebased (Michal) reword message (Mallesh)
> v3: use info level helper (Rodrigo/Daniele)

Thank you

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 7e829c61387f..8b1f6f5448ba 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -14,6 +14,7 @@
>  #include "xe_gt_types.h"
>  #include "xe_gt_stats.h"
>  #include "xe_hw_engine.h"
> +#include "xe_log.h"
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
>  #include "xe_svm.h"
> @@ -625,8 +626,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  				xe_pagefault_save_to_vm(gt_to_xe(gt), pf);
>  				xe_pagefault_cache_start_invalidate(cache_start);
>  				xe_pagefault_print(pf);
> -				xe_gt_info(pf->gt, "Fault response: Unsuccessful %pe\n",
> -					   ERR_PTR(err));
> +				xe_log_err_info(pf->gt, PAGEFAULT, err, "Unsuccessful response\n");
>  			} else {
>  				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
>  				xe_gt_dbg(pf->gt, "Prefetch Fault response: Unsuccessful %pe\n",
> -- 
> 2.47.1
> 
