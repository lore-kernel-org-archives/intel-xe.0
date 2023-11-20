Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B469AC2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 20:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5889210E0F4;
	Mon, 20 Nov 2023 20:23:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD2C10E0F4
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 20:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700511809; x=1732047809;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uUridbPNvmQnpTM/zPbYamy1u2qTO8FKIstxqt9Qqec=;
 b=Mq56xPZkRByGaadhXXa66R7hG++ip7iG6xfBy68yKa4QswTxFHbaMzUv
 oO0U01Knw65MyQJGnVLkbe6WyyhqzbW9ywiRKuXO7VrsqeLc+6szs/wyp
 zFhDfsgdEfIYURxuk7nocZULiaRbc7/GGhw9nYNFkBsGobYLXUQogbwbi
 0pbPghjyXeajhw7pErwpZbnxESJ26+dcl52kV2BNQ8YXaAuHJbrYRSkSt
 lDibtyJ8Qq7rwpsKepCapURk9TVXrvjjb/Uu+mLbrdo2ir5hfZmz6MMF9
 Y9ycjUv559Pzus+NLGD0BQ0Ms3fxyevTtgL9Xefa/CCy8+KhwLXluIW5T g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="390557845"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="390557845"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 12:23:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="7678619"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 12:23:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 12:23:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 12:23:28 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 12:23:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpNBtBa6gpBiXd5YDITnTen4kJ4b4ryE9cIAPr5Af+3J7JrZP68LAm4XsMw8n+VzYkApdZxUMFrQxT++xLqZK1jXxYRIqGebwzzdBVQ6gTPKANNxcq0Y3ExX6xXQlDbUEba8A0g30vnmspVjWRSSwCadCWQw/LGbM3O+RP8ois83gjubut5giHTK1rqEMrckMOZkMoQYDa3CnGSDRtukw1d9dT3o5UYCnm8xG5dLWNVdagp2v5vXhLzSlGqc2TEO+U0XAHAfb9zfLQ4MnjrNxQIg1y6nGTnWmTSVwL+3xi++FjSEtW32tHA0TGIJmkLqQhqLRmeg6/vYQTEo6jCg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBSz2u5sYjdGK9tZDL5OHgFYQsBnA8WQWsw59ervnwI=;
 b=b8QbIdu/ZicVmtHW0j2lL6cbx0/RG+cBKPWMwXbnY/vV2UvBviqx+sIefVWytu5g7/jNPtlWe+fI/bx0RZIkPFl4pfAKeOfaaWGWWRxHXdBf942FX2jKQBOC60CjIeKTflRjVovaynHMyr3TkxVfpF1eWa2VEue4RHPnJNU1HznxAHESQUfredM8XakydmYy5UkkGNiVlZpDqsjVZ6yAl9PuAsK6k2nhkg7o7eQy5OrPypjkhPbRRru6fTrMIXCUxHNspct3rXl4HtgOZA/jHJNHSCUa/+YFWs9gwkbjx2XGPwfAdG7Sz/hUiB4ZaQOBChXZoIrKsIFkG3VTPv4sPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5921.namprd11.prod.outlook.com (2603:10b6:806:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 20:23:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 20:23:24 +0000
Date: Mon, 20 Nov 2023 13:22:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Message-ID: <ZVtdjuheTxILciN1@DUT025-TGLU.fm.intel.com>
References: <20231116200819.29227-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231116200819.29227-1-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: SJ2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a03:505::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be5fb23-79cd-4508-a0b7-08dbea068c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6RP3bFf0NxSq2yCqtf1A6btLz9uowxR5OgkQIGh4NQbg7JmQc4SDIdNhfTAWv7tKdJFKHUv0v1UCBG8Gbd2SzCH8tpSmq4eFwvCY+PKxOh8PccFsQgJrWcT2bafyvM3Z989Mj+JkuCZ/P9i8ruRcBY31XhJh0hWZrwh8dev6m9qLx4b5XN9wSh1yKFgDhG4MLrnzNBTiXPrD2IIqIKWS3uISffmpOtwrsdgbKW1K53pG1N+f61GPkmZ5HTXTs5d/U2vJhWH4vyqoCatpGOjI5fjX9xKjCoeCanvkzXJMJU+3dZHGywy698/YKRsFB6kh6SPj1ROBt6VenAXfu+rIxEuHfWR9jz7hp0upGurgnJLLgNAEvQWOydl2TOTg4Q+oHXkiSQdBDACsAwwyxmcX3CczChrwhfktJK9K/QCpmXxzP1qhvk7uTzLlYmozMwW740Odv4kxYgp9s3nNxsVDU6UFeooHDBm5RYNaIyG2XCdgyQ5HR8Y+W+BCo1lfW73djpoc/Ha1sBuCpX4WnCJJ5/njyHXV0elf429Cm0CSc8hbbJXAl+scyO+aAyKSbuxP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(136003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(83380400001)(86362001)(38100700002)(41300700001)(66946007)(66556008)(66476007)(6636002)(8676002)(6862004)(316002)(8936002)(4326008)(5660300002)(2906002)(44832011)(6512007)(6506007)(26005)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L7KEfJxXRGCPjjbz5L9YU7m4cFGaG91gEAah4izlOhLoGi145TTguOvSnI3x?=
 =?us-ascii?Q?emfYnn+GNR6lEQRTQuFubpBodTFdicIUDgyciofyDkhh8+Elw1YI0N5dR1PC?=
 =?us-ascii?Q?1lDMb8Blai1akClfnPyCLdJk6wHXJea84w8HnliKEHPHbiS/PLG5BIl/zzge?=
 =?us-ascii?Q?+rrxulUEnDwfQt08I6ZUCMtKIs/3yFhe51jR6BVvhcL/ZiBU/n8rSmPtxafl?=
 =?us-ascii?Q?13nbBQuCEccpGuvg1KYA6tXGpXTxg94dm1u5vxldEMGdk7JKcF0a+qIbAXUe?=
 =?us-ascii?Q?JJnvAz6IkvzRVIxnqGuApjIwv6dfum2ftOJn5y43WhH9jAqUEfMs3syksuGf?=
 =?us-ascii?Q?faQeuwK6IyIzBsoV3ihBJk/AggbK4FHTL1t1X9Bx+01lg6oaq1SL2/4Z8Nb6?=
 =?us-ascii?Q?QUKL7KaFmMBGWisKwzMqcMU20CRatqRd1jdVlhQnkHpsItYLwDFgc6begm+E?=
 =?us-ascii?Q?Zo1bz3IIdiFK3cR5tTdrGi2sF+s4QRLgwJ8lRocXD4u9wnb5qvATNLY4yX4X?=
 =?us-ascii?Q?omJ4Q8SIVHSonWi0+pEawniUMCy2VujKOidVny8KJukXvTCR23tLo558a0cw?=
 =?us-ascii?Q?onZQ4jEATKBllfRAM5/fGHfP/ZuFrUPpbS4ePM5ailY/aRsqHMxSRlH13u7i?=
 =?us-ascii?Q?N5PsWuCk9KDlSqozXVmvY6johBEYH7TT238WIC7l2rWzb1DXDH0+ziBhkesi?=
 =?us-ascii?Q?QB2clKbCmTVJjwjTPrySSrpAWgFbAgZ4V6xXOuGYqjGZ7cKN9wn1thsVOwBk?=
 =?us-ascii?Q?rGgFczasgUq2N0WXzAI8C7POsGpV/H6m57tIWAsg6tPDDx+1uh5jof+qGS1v?=
 =?us-ascii?Q?2Ir3dNjFjr9mzL5akW6Tk8l5sEWP3foXRu9K7KqaohZ0xCxHZPtZ3aXs1t/2?=
 =?us-ascii?Q?G9szdJZz+3yYdsmiMGx2LjyEk8zlR9/54z4bkcLfgZHBJWPduwA7G1r88OQE?=
 =?us-ascii?Q?oO5smOE2R9CJNqhMu6GLDoRlbAk+EnMM9gkvSyKAtzdUyyvlwOFjIv6+l10w?=
 =?us-ascii?Q?MbJhL0FpKn7Kqd36fLfIWpP+rC8QrNzMbgDg+8jfDP1UkYEkf1k/IAyj2Y2F?=
 =?us-ascii?Q?/31uM103ZvZ1zQgkHaGFqDbra5DsyEdx16eOAV+rOB0/qyEVABgyvXQWaW54?=
 =?us-ascii?Q?53pW5y5tA0EnLJ/COJWgSiG1809DjcOR0hETZBbtFup9FZCfEmEevRrrY6IK?=
 =?us-ascii?Q?eh6Pa6MtEaJ4N7xALJVAgs7o8CshYVa1po8MobSCNht4wZj5cEHpMBEVasDA?=
 =?us-ascii?Q?DERC4+mXtYXEgrKYFqSCUyWdMrsoHwQf9LzILWqlL0B7r7vfFF0O7cXcfRo8?=
 =?us-ascii?Q?XMzieX9tCHGxmpvu8MMCfhYL6ypBXbFokdCmXQOJc0XLTAFsSg+Rb/yjD82x?=
 =?us-ascii?Q?ZVc32qAma4mXOH2W/Yp0EM3xidluo8NhQPJOydJwYpf05Jf+R13jGI2oqIIB?=
 =?us-ascii?Q?jNchr2pjaVZT06XUJ2KkJt2G8fbuWBvRgVZiQX1H+PJI2ZNwomaiRVAf/l1D?=
 =?us-ascii?Q?TGIqI+bO3S05rzAsNp6WXX0EIaHc1uA1VyIT567Dml7HVa6sGjKiCQ1Y+pPE?=
 =?us-ascii?Q?qcC69ZDraMchKPujs9BGKaHeE5X1G//+AcpOZrPMsZb/mIVqX0m/Ezv3nL/0?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be5fb23-79cd-4508-a0b7-08dbea068c0b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 20:23:24.5063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yNSRdHtJUVqRn2ZUcBRIeKro3LxjA65a3yylf0nbYPUxwb5tx9tZ4dkriA1JIvoCrFSIbXOM+XJ0nqoXWLXTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5921
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] RFC: drm/xe: Return correct error code for
 xe_wait_user_fence_ioctl
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 01:38:19AM +0530, Bommu Krishnaiah wrote:
> return correct error code if exec_queue is reset/engine is hung
> remove the num_engines/instances members from drm_xe_wait_user_fence structure
> and add a exec_queue_id member
> 
> Need to validated the changes
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c      | 24 ++++------
>  drivers/gpu/drm/xe/xe_guc_submit.h      | 20 ++++++++
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 64 +++++++------------------
>  include/uapi/drm/xe_drm.h               | 16 ++-----
>  4 files changed, 50 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e9e925c7353..de2d2f7303d5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -42,21 +42,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>  	return &q->gt->uc.guc;
>  }
>  
> -/*
> - * Helpers for engine state, using an atomic as some of the bits can transition
> - * as the same time (e.g. a suspend can be happning at the same time as schedule
> - * engine done being processed).
> - */
> -#define EXEC_QUEUE_STATE_REGISTERED		(1 << 0)
> -#define ENGINE_STATE_ENABLED		(1 << 1)
> -#define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
> -#define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
> -#define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
> -#define ENGINE_STATE_SUSPENDED		(1 << 5)
> -#define EXEC_QUEUE_STATE_RESET		(1 << 6)
> -#define ENGINE_STATE_KILLED		(1 << 7)
> -
> -static bool exec_queue_registered(struct xe_exec_queue *q)
> +bool exec_queue_registered(struct xe_exec_queue *q)

Don't export these. This is backend (q->guc) state internal to backend.
If you need to access something like this the proper place to add it
would be a new vfunc in struct xe_exec_queue_ops. 

>  {
>  	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_REGISTERED;
>  }
> @@ -151,7 +137,7 @@ static void clear_exec_queue_suspended(struct xe_exec_queue *q)
>  	atomic_and(~ENGINE_STATE_SUSPENDED, &q->guc->state);
>  }
>  
> -static bool exec_queue_reset(struct xe_exec_queue *q)
> +bool exec_queue_reset(struct xe_exec_queue *q)
>  {
>  	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_RESET;
>  }
> @@ -1681,6 +1667,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (!exec_queue_banned(q))
>  		xe_guc_exec_queue_trigger_cleanup(q);
>  
> +	/* to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);

This should probably be in xe_guc_exec_queue_trigger_cleanup or TDR
itself.

Matt

> +
>  	return 0;
>  }
>  
> @@ -1708,6 +1697,9 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  	if (!exec_queue_banned(q))
>  		xe_guc_exec_queue_trigger_cleanup(q);
>  
> +	/* to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index fc97869c5b86..4a0566e7e9f7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -8,12 +8,32 @@
>  
>  #include <linux/types.h>
>  
> +#include "xe_exec_queue_types.h"
> +#include "xe_guc_exec_queue_types.h"
> +
> +/*
> + * Helpers for engine state, using an atomic as some of the bits can transition
> + * as the same time (e.g. a suspend can be happning at the same time as schedule
> + * engine done being processed).
> + */
> +#define EXEC_QUEUE_STATE_REGISTERED	(1 << 0)
> +#define ENGINE_STATE_ENABLED		(1 << 1)
> +#define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
> +#define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
> +#define EXEC_QUEUE_STATE_DESTROYED	(1 << 4)
> +#define ENGINE_STATE_SUSPENDED		(1 << 5)
> +#define EXEC_QUEUE_STATE_RESET		(1 << 6)
> +#define ENGINE_STATE_KILLED		(1 << 7)
> +
>  struct drm_printer;
>  struct xe_exec_queue;
>  struct xe_guc;
>  
>  int xe_guc_submit_init(struct xe_guc *guc);
>  
> +bool exec_queue_reset(struct xe_exec_queue *q);
> +bool exec_queue_registered(struct xe_exec_queue *q);
> +
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
>  int xe_guc_submit_stop(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 78686908f7fb..5ee1062a4623 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -13,6 +13,10 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> +#include "xe_guc_submit.h"
> +#include "xe_exec_queue.h"
> +#include "xe_exec_queue_types.h"
> +#include "xe_guc_exec_queue_types.h"
>  
>  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  {
> @@ -58,27 +62,6 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
>  	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>  };
>  
> -static int check_hw_engines(struct xe_device *xe,
> -			    struct drm_xe_engine_class_instance *eci,
> -			    int num_engines)
> -{
> -	int i;
> -
> -	for (i = 0; i < num_engines; ++i) {
> -		enum xe_engine_class user_class =
> -			user_to_xe_engine_class[eci[i].engine_class];
> -
> -		if (eci[i].gt_id >= xe->info.tile_count)
> -			return -EINVAL;
> -
> -		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
> -				     user_class, eci[i].engine_instance, true))
> -			return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>  #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_SOFT_OP | \
>  			 DRM_XE_UFENCE_WAIT_ABSTIME)
>  #define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
> @@ -130,14 +113,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
>  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
>  	struct drm_xe_wait_user_fence *args = data;
> -	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
> -	struct drm_xe_engine_class_instance __user *user_eci =
> -		u64_to_user_ptr(args->instances);
> +	struct xe_exec_queue *q = NULL;
>  	u64 addr = args->addr;
>  	int err;
> -	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP;
>  	long timeout;
>  	ktime_t start;
>  
> @@ -151,35 +132,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, no_engines &&
> -			 (args->num_engines || args->instances)))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, addr & 0x7))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
> -		return -EINVAL;
> -
> -	if (!no_engines) {
> -		err = copy_from_user(eci, user_eci,
> -				     sizeof(struct drm_xe_engine_class_instance) *
> -			     args->num_engines);
> -		if (XE_IOCTL_DBG(xe, err))
> -			return -EFAULT;
> -
> -		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
> -						      args->num_engines)))
> -			return -EINVAL;
> -	}
> -
>  	timeout = to_jiffies_timeout(xe, args);
>  
>  	start = ktime_get();
>  
> +	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> +	if (XE_IOCTL_DBG(xe, !q))
> +		return -ENOENT;
> +
>  	/*
>  	 * FIXME: Very simple implementation at the moment, single wait queue
>  	 * for everything. Could be optimized to have a wait queue for every
> @@ -203,6 +166,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  		}
>  
>  		timeout = wait_woken(&w_wait, TASK_INTERRUPTIBLE, timeout);
> +
> +		if (exec_queue_registered(q)) {
> +			if (exec_queue_reset(q)) {
> +				drm_info(&xe->drm, "exec gueue reset detected\n");
> +				err = -EIO;
> +			}
> +		}
>  	}
>  	remove_wait_queue(&xe->ufence_wq, &w_wait);
>  
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index e007dbefd627..0bcd7914db36 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -132,8 +132,7 @@ struct drm_xe_engine_class_instance {
>  #define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>  #define DRM_XE_ENGINE_CLASS_COMPUTE		4
>  	/*
> -	 * Kernel only classes (not actual hardware engine class). Used for
> -	 * creating ordered queues of VM bind operations.
> +	 * Used for creating ordered queues of VM bind operations.
>  	 */
>  #define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
>  #define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
> @@ -955,16 +954,11 @@ struct drm_xe_wait_user_fence {
>  	__s64 timeout;
>  
>  	/**
> -	 * @num_engines: number of engine instances to wait on, must be zero
> -	 * when DRM_XE_UFENCE_WAIT_SOFT_OP set
> -	 */
> -	__u64 num_engines;
> -
> -	/**
> -	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> -	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
> +	 * @exec_queue_id: exec_queue_id, must be of class DRM_XE_ENGINE_CLASS_VM_BIND
> +	 * and exec queue must have same vm_id. If zero, the default VM bind engine
> +	 * is used.
>  	 */
> -	__u64 instances;
> +	__u32 exec_queue_id;
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> -- 
> 2.25.1
> 
