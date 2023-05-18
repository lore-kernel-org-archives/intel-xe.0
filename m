Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFF8C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 01:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C9210E4C8;
	Thu, 18 May 2023 01:55:11 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFC310E4C8
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 01:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684374908; x=1715910908;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FviqFRDz67bUaByEG3RVDxvWxeqenO/s+xZ0mWgYLOw=;
 b=aKUKt7vcRLrP5VgzLKRinpVqOKddfT3PwspPFgUv/3EViw5rSy+i1w3C
 ReEFQ540ulV5eTkdzUDNjJkXibkvxkeM/apLdXZBbAxs10wTWm2nK71t0
 2YgH7dLPHERUPjlIcs+Ts8ARHSSMYEmdnTxtjSwqQ/yQIfoPJCHJzvI3B
 5Y9XJv4AlmqWy7hQ9Kr/nXm4qbBDIK8gLf5hYbrZWX4PkWf57uBjvufcc
 grbwu+kNUiU3Kn23fYQX3VIKAmGHSQqvY7Tr85aOzuydL/7iNBUi7HBp1
 8KxYr6TG2EZW4GZJB+rZkiQvoTdxT/TaK0iW511wKmRHiC9XnzNqr9Lf1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="355120826"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="355120826"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 18:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="734897374"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="734897374"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 17 May 2023 18:55:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 18:55:06 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 18:55:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 18:55:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 18:55:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWcQQKWvx/krHeBOmPBRIX3pq9Lr1Pe3PuItmx8BzoZc4G1A6MLxhRga4xwvT6OTv3Eiijvy53jJoV0C9z63DMEuQLaukVQo7zyiLr3VI9tbair0WAjMqCjFqOGwzKVBWoah6DYiEeXO3K3NGP23IC1Wauv3eRywbZY2/pXXS/Gsa2853YwtFIGmVtjhXrq2pVRXIuGDsq+LNXgv3vZaGR+/CTdNSmiMtN87osyUllgfapdjZTdX7/x/pq/YodyKdQS1PJBl9Tb6mpCG3AFUPxMeEcNjO3S9ZVragpRiPa4yA5eXZKbdE6Y5Br1xYF/bAyPl+moU2JaYZXirc+trYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2PqxSFQpz12ucFk/3ayogNqFFjEfEbufIEPieJYP9o=;
 b=OFp4rW+frqPAXAbxFmFokEr0h+GaUNvYH/UrC4JtlBk+r4F8SPlx1XZzeSR7CgwQLrRbvCIcdONTbKZsk5zOo2J52dfBxPUSXqz5tipAp1XdxbPGWfBD+p4kWXp1PPNASEwHsTi51SiAzVbjqCKgBE8ZyUWchMCZrJTjWpwp4EuOnW2hYsN1K8qHKzJs71MMZkuivXVFH/7WTr4nq5adHxjJg5urp6ZjaDbuutJzGmV6qdOgDDr+FF2r+l0YbVfQ/P3TtCwSZRAgITIzh2+/clOrPqDDl56Sy17xthHvqgMGV6urRCCUJqyWB/SqBdjzdIP/e2YbkIEe9tBjqfd95w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8506.namprd11.prod.outlook.com (2603:10b6:408:1bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 01:55:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 01:55:02 +0000
Date: Thu, 18 May 2023 01:54:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZGWFS8zXNkG7DIee@DUT025-TGLU.fm.intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
 <20230516145416.1851984-7-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230516145416.1851984-7-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: 0509ea3e-13f2-4ecf-49c3-08db5742e496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3n7HGUfoVqc+jbkBzwPp47lQh/4nMfKUDhORnlWSOfxT9J4fdE4Ho79IFkl2e3KR3OPl37TwpQp6PqwHXy2Gjk3Kukb8eHl+6YlXQBLV9GMI6bcNkqauqV8b8AptsXJaHpR8khtpKECVdzf+5W1w24Ya4khjcAdN06p1HPHoO94UM9GkAYsQEKKDiWHP3aIOL7MDvo6MXBYOqUVYD2Hsa+5DIOMD7y8MavWXbHm38ihfdDnreIwGs35Z7olqWAhOmsC5AAUwlVDDKJy+gOkalQIZO75igzbFaZ8v5PZItevhr0mGPUzTIRH/EQvwjUBKC43GH9jtqaNLwDln0BTRg5F2kRyo1ZCn3C31ccVM+ysm2zLp7xBuIVggMl2a1kasGfHPz4KdxyDHJkCsbNr4RmLwzJdnFGvh3xm4R40SGJZ+Kbbi2NAOz7R9f2YURM9TmEr7fRE3ZvjwxFrRxz9fNSKbsNFgUHAUPUd3NC/bbxKJg+vE7aFvN+2G6vFXt0B8Wq/WwmZyaU6WXT5wyekJUHWJWN5+vXNQpWhkltL8xFUdPaELn+FodXr4HP/eNysV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(451199021)(5660300002)(6862004)(86362001)(8936002)(66556008)(8676002)(44832011)(26005)(107886003)(6512007)(6506007)(83380400001)(82960400001)(38100700002)(186003)(45080400002)(508600001)(6666004)(6486002)(316002)(66476007)(66946007)(6636002)(4326008)(2906002)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pNmAaNAAZlFMA8TTDSpdgZiU9Y0kHG1YuQ9pYEtgdJ/YZUoNRZ5WZRwynKIg?=
 =?us-ascii?Q?ay54PvSimuc4OwjFNqLVF8Kmul6DDLHzu2poVu0n1MQOVK6jI49sqdcBEEbZ?=
 =?us-ascii?Q?IUSZJEliVCfvNQqYmen00cba7SpzvhwQZyAlVf5SLww6cv9VAhMLVv70eD+g?=
 =?us-ascii?Q?HWwSmxXLwdvrjLD3RAIH2MSHXVDfjAiCK02KAL28VQz/BGi+FIebwws91IqA?=
 =?us-ascii?Q?b+UbqitHw4+kQ4qfgM1c+nCC9EjnMvGUMZb7BqmlhvqyFfQgUDn+eX/pX1M9?=
 =?us-ascii?Q?glPUOpQjKIirvEQXxTOiKbaJoODcteIrgLrpa/t1zlS0oIbSkg9xzG3i0csU?=
 =?us-ascii?Q?YyYlhHnVNbol0Pynai0BqgcpZU8ODBLw42MmIAOM/EaG3cbA4OV2fMfp8ra0?=
 =?us-ascii?Q?nlM+IXYtIelG74BEUzvm0/diOvXx3UCIZEFKrgEto9mkvEuGnPb+BCZfSH57?=
 =?us-ascii?Q?Rs4ja8Sjr7qNUXjzJ5o1C5HzH4piQUktQEZopHqvvtuPzYejFnApg3t79Zoo?=
 =?us-ascii?Q?bAem2dPHOnFAoScfliEj6huvSQb/GdcWvlg0Rfc2GzBKVNneiJS8K3PP8pbP?=
 =?us-ascii?Q?Xfo0ENl2Bu/6NZmD9WaIXlUVcTjvCE7wL5kPlDO2RjibGYbP0IZjQUJQUpfe?=
 =?us-ascii?Q?iopzfLSx58aLH70bQk3R18hHbC2eC7/J1i+h7CizncXFrN1Jv4hqWlzkgPC4?=
 =?us-ascii?Q?hBwuxiI+wIvAVbvjfgwg3DINEYzT1XApJDfhS+/primTekBlKS2Jw3RX68s1?=
 =?us-ascii?Q?JBUvke41T/8ZUl+/dKWEpIzgwWMI3EFj+/9Lz1c69wcXqH/9FxD5F2fsSxZ+?=
 =?us-ascii?Q?AvaxWmCEizscMyn8KEgDYazp5+z5Vznb1D+qu+lqwV4Bl84tKPybtltmBSqd?=
 =?us-ascii?Q?MHNfykip+0Tg/qOepzx5CIHlzOa/60+ccrGDyNsEAuMJkK0c6qsOvhMnT+K7?=
 =?us-ascii?Q?9XyWHyhluCe77XIP02+CZgzF5PvEQ8/t6aKP9Dif/+HSE0k4QFXlJj1FYB3X?=
 =?us-ascii?Q?1Dd5zvn3R0omqT389V4yiheJuKBe7SieTJhu2Q6pw2Rd0XuO6phvOmWuJzyL?=
 =?us-ascii?Q?+Q42bJU6fUtxeRWKnfMmaIBOhgAZenPmHIM/vnlIUI+nT0bC28je0I3XnpLU?=
 =?us-ascii?Q?XT8KNJ5cG+Wrrt+3ANbOtfknxMFQiKPu5ScKjix7SAD8ygf0l6CT1tl4H879?=
 =?us-ascii?Q?XDgohkC3/4QEGwFehFXjU+zr6RD/jb8FH1dWNYlzmZUzp6SXS6gnWFboIfZN?=
 =?us-ascii?Q?TXlu6Ja0m3MaoA1qfLOhCyXUou1S1aHFo6erQF12XuK5GIYgBsKRSFOqJ35V?=
 =?us-ascii?Q?YcxG18ulm+pKCic/elOnSBqN4H21uEJO3KYs38+LGQj2bmd2JJpV1B/1VHE8?=
 =?us-ascii?Q?qi65CWH8dqbqeXK3yAXFh7Yeqo0WHgg5w3dUiLtq9v02mYlDP93Sqg045JAB?=
 =?us-ascii?Q?HpsK4K8oHqOTwdq93tuOJ26JGViilshSz9IZke5cquSIwhX/BJjsjxXf7MTg?=
 =?us-ascii?Q?SN9hMr2k4EO3fjpAL5fM0MphvH6pCtLUgrJG4bVPOUGvNutsKK+TiivGh9/3?=
 =?us-ascii?Q?7eIvrEwCst/aRB0dVlULRuD95LRh6d44RcTzR77CM5J3rJTGz7rwMeoKirHn?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0509ea3e-13f2-4ecf-49c3-08db5742e496
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 01:55:02.0423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QK3LYc0tG1yVMiIaOR+F5rENMKYvLS3yyNvOBZoQdTwqvTcgioQ3D2lmRec1CG9AIXkor7qTxg/P2XPjlbzkDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8506
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 07/11] drm/xe: Convert GuC Engine print to
 snapshot capture and print.
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

On Tue, May 16, 2023 at 10:54:12AM -0400, Rodrigo Vivi wrote:
> The goal is to allow for a snapshot capture to be taken at the time
> of the crash, while the print out can happen at a later time through
> the exposed devcoredump virtual device.
> 
> v2: Handle memory allocation failures. (Matthew)
> Do not use GFP_ATOMIC on cases like debugfs prints. (Matthew)
> v3: checkpatch
> v4: pending_list allocation needs to be atomic because of the
>     spin_lock. (Matthew)
>     get back to GFP_ATOMIC only. (lockdep).
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 237 +++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc_submit.h       |  10 +-
>  drivers/gpu/drm/xe/xe_guc_submit_types.h |  91 +++++++++
>  3 files changed, 298 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 250e56ee2e75..cc8191dfdf89 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1596,75 +1596,234 @@ int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	return 0;
>  }
>  
> -static void guc_engine_wq_print(struct xe_engine *e, struct drm_printer *p)
> +static void
> +guc_engine_wq_snapshot_capture(struct xe_engine *e,
> +			       struct xe_guc_submit_engine_snapshot *snapshot)
>  {
>  	struct xe_guc *guc = engine_to_guc(e);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct iosys_map map = xe_lrc_parallel_map(e->lrc);
>  	int i;
>  
> +	snapshot->guc.wqi_head = e->guc->wqi_head;
> +	snapshot->guc.wqi_tail = e->guc->wqi_tail;
> +	snapshot->parallel.wq_desc.head = parallel_read(xe, map, wq_desc.head);
> +	snapshot->parallel.wq_desc.tail = parallel_read(xe, map, wq_desc.tail);
> +	snapshot->parallel.wq_desc.status = parallel_read(xe, map,
> +							  wq_desc.wq_status);
> +
> +	if (snapshot->parallel.wq_desc.head !=
> +	    snapshot->parallel.wq_desc.tail) {
> +		for (i = snapshot->parallel.wq_desc.head;
> +		     i != snapshot->parallel.wq_desc.tail;
> +		     i = (i + sizeof(u32)) % WQ_SIZE)
> +			snapshot->parallel.wq[i / sizeof(u32)] =
> +				parallel_read(xe, map, wq[i / sizeof(u32)]);
> +	}
> +}
> +
> +static void
> +guc_engine_wq_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
> +			     struct drm_printer *p)
> +{
> +	int i;
> +
>  	drm_printf(p, "\tWQ head: %u (internal), %d (memory)\n",
> -		   e->guc->wqi_head, parallel_read(xe, map, wq_desc.head));
> +		   snapshot->guc.wqi_head, snapshot->parallel.wq_desc.head);
>  	drm_printf(p, "\tWQ tail: %u (internal), %d (memory)\n",
> -		   e->guc->wqi_tail, parallel_read(xe, map, wq_desc.tail));
> -	drm_printf(p, "\tWQ status: %u\n",
> -		   parallel_read(xe, map, wq_desc.wq_status));
> -	if (parallel_read(xe, map, wq_desc.head) !=
> -	    parallel_read(xe, map, wq_desc.tail)) {
> -		for (i = parallel_read(xe, map, wq_desc.head);
> -		     i != parallel_read(xe, map, wq_desc.tail);
> +		   snapshot->guc.wqi_tail, snapshot->parallel.wq_desc.tail);
> +	drm_printf(p, "\tWQ status: %u\n", snapshot->parallel.wq_desc.status);
> +
> +	if (snapshot->parallel.wq_desc.head !=
> +	    snapshot->parallel.wq_desc.tail) {
> +		for (i = snapshot->parallel.wq_desc.head;
> +		     i != snapshot->parallel.wq_desc.tail;
>  		     i = (i + sizeof(u32)) % WQ_SIZE)
>  			drm_printf(p, "\tWQ[%zu]: 0x%08x\n", i / sizeof(u32),
> -				   parallel_read(xe, map, wq[i / sizeof(u32)]));
> +				   snapshot->parallel.wq[i / sizeof(u32)]);
>  	}
>  }
>  
> -static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
> +/**
> + * xe_guc_engine_snapshot_capture - Take a quick snapshot of the GuC Engine.
> + * @e: Xe Engine.
> + *
> + * This can be printed out in a later stage like during dev_coredump
> + * analysis.
> + *
> + * Returns: a GuC Submit Engine snapshot object that must be freed by the
> + * caller, using `xe_guc_engine_snapshot_free`.
> + */
> +struct xe_guc_submit_engine_snapshot *
> +xe_guc_engine_snapshot_capture(struct xe_engine *e)
>  {
> +	struct xe_guc *guc = engine_to_guc(e);
> +	struct xe_device *xe = guc_to_xe(guc);
>  	struct drm_gpu_scheduler *sched = &e->guc->sched;
>  	struct xe_sched_job *job;
> +	struct xe_guc_submit_engine_snapshot *snapshot;
> +	int i;
> +
> +	snapshot = kzalloc(sizeof(*snapshot), GFP_ATOMIC);
> +
> +	if (!snapshot) {
> +		drm_err(&xe->drm, "Skipping GuC Engine snapshot entirely.\n");
> +		return NULL;
> +	}
> +
> +	snapshot->guc.id = e->guc->id;
> +	memcpy(&snapshot->name, &e->name, sizeof(snapshot->name));
> +	snapshot->class = e->class;
> +	snapshot->logical_mask = e->logical_mask;
> +	snapshot->width = e->width;
> +	snapshot->refcount = kref_read(&e->refcount);
> +	snapshot->sched_timeout = sched->timeout;
> +	snapshot->sched_props.timeslice_us = e->sched_props.timeslice_us;
> +	snapshot->sched_props.preempt_timeout_us =
> +		e->sched_props.preempt_timeout_us;
> +
> +	snapshot->lrc = kmalloc_array(e->width, sizeof(struct lrc_snapshot),
> +				      GFP_ATOMIC);
> +
> +	if (!snapshot->lrc) {
> +		drm_err(&xe->drm, "Skipping GuC Engine LRC snapshot.\n");
> +	} else {
> +		for (i = 0; i < e->width; ++i) {
> +			struct xe_lrc *lrc = e->lrc + i;
> +
> +			snapshot->lrc[i].context_desc =
> +				lower_32_bits(xe_lrc_ggtt_addr(lrc));
> +			snapshot->lrc[i].head = xe_lrc_ring_head(lrc);
> +			snapshot->lrc[i].tail.internal = lrc->ring.tail;
> +			snapshot->lrc[i].tail.memory =
> +				xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
> +			snapshot->lrc[i].start_seqno = xe_lrc_start_seqno(lrc);
> +			snapshot->lrc[i].seqno = xe_lrc_seqno(lrc);
> +		}
> +	}
> +
> +	snapshot->schedule_state = atomic_read(&e->guc->state);
> +	snapshot->engine_flags = e->flags;
> +
> +	snapshot->parallel_execution = xe_engine_is_parallel(e);
> +	if (snapshot->parallel_execution)
> +		guc_engine_wq_snapshot_capture(e, snapshot);
> +
> +	spin_lock(&sched->job_list_lock);
> +	snapshot->pending_list_size = list_count_nodes(&sched->pending_list);
> +	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
> +					       sizeof(struct pending_list_snapshot),
> +					       GFP_ATOMIC);
> +
> +	if (!snapshot->pending_list) {
> +		drm_err(&xe->drm, "Skipping GuC Engine pending_list snapshot.\n");
> +	} else {
> +		i = 0;
> +		list_for_each_entry(job, &sched->pending_list, drm.list) {
> +			snapshot->pending_list[i].seqno =
> +				xe_sched_job_seqno(job);
> +			snapshot->pending_list[i].fence =
> +				dma_fence_is_signaled(job->fence) ? 1 : 0;
> +			snapshot->pending_list[i].finished =
> +				dma_fence_is_signaled(&job->drm.s_fence->finished)
> +				? 1 : 0;
> +			i++;
> +		}
> +	}
> +
> +	spin_unlock(&sched->job_list_lock);
> +
> +	return snapshot;
> +}
> +
> +/**
> + * xe_guc_engine_snapshot_print - Print out a given GuC Engine snapshot.
> + * @snapshot: GuC Submit Engine snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given GuC Submit Engine snapshot object.
> + */
> +void
> +xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
> +			     struct drm_printer *p)
> +{
>  	int i;
>  
> -	drm_printf(p, "\nGuC ID: %d\n", e->guc->id);
> -	drm_printf(p, "\tName: %s\n", e->name);
> -	drm_printf(p, "\tClass: %d\n", e->class);
> -	drm_printf(p, "\tLogical mask: 0x%x\n", e->logical_mask);
> -	drm_printf(p, "\tWidth: %d\n", e->width);
> -	drm_printf(p, "\tRef: %d\n", kref_read(&e->refcount));
> -	drm_printf(p, "\tTimeout: %ld (ms)\n", sched->timeout);
> -	drm_printf(p, "\tTimeslice: %u (us)\n", e->sched_props.timeslice_us);
> +	if (!snapshot)
> +		return;
> +
> +	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
> +	drm_printf(p, "\tName: %s\n", snapshot->name);
> +	drm_printf(p, "\tClass: %d\n", snapshot->class);
> +	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
> +	drm_printf(p, "\tWidth: %d\n", snapshot->width);
> +	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
> +	drm_printf(p, "\tTimeout: %ld (ms)\n", snapshot->sched_timeout);
> +	drm_printf(p, "\tTimeslice: %u (us)\n",
> +		   snapshot->sched_props.timeslice_us);
>  	drm_printf(p, "\tPreempt timeout: %u (us)\n",
> -		   e->sched_props.preempt_timeout_us);
> -	for (i = 0; i < e->width; ++i ) {
> -		struct xe_lrc *lrc = e->lrc + i;
> +		   snapshot->sched_props.preempt_timeout_us);
>  
> +	for (i = 0; snapshot->lrc && i < snapshot->width; ++i) {
>  		drm_printf(p, "\tHW Context Desc: 0x%08x\n",
> -			   lower_32_bits(xe_lrc_ggtt_addr(lrc)));
> +			   snapshot->lrc[i].context_desc);
>  		drm_printf(p, "\tLRC Head: (memory) %u\n",
> -			   xe_lrc_ring_head(lrc));
> +			   snapshot->lrc[i].head);
>  		drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
> -			   lrc->ring.tail,
> -			   xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL));
> +			   snapshot->lrc[i].tail.internal,
> +			   snapshot->lrc[i].tail.memory);
>  		drm_printf(p, "\tStart seqno: (memory) %d\n",
> -			   xe_lrc_start_seqno(lrc));
> -		drm_printf(p, "\tSeqno: (memory) %d\n", xe_lrc_seqno(lrc));
> +			   snapshot->lrc[i].start_seqno);
> +		drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->lrc[i].seqno);
>  	}
> -	drm_printf(p, "\tSchedule State: 0x%x\n", atomic_read(&e->guc->state));
> -	drm_printf(p, "\tFlags: 0x%lx\n", e->flags);
> -	if (xe_engine_is_parallel(e))
> -		guc_engine_wq_print(e, p);
> +	drm_printf(p, "\tSchedule State: 0x%x\n", snapshot->schedule_state);
> +	drm_printf(p, "\tFlags: 0x%lx\n", snapshot->engine_flags);
>  
> -	spin_lock(&sched->job_list_lock);
> +	if (snapshot->parallel_execution)
> +		guc_engine_wq_snapshot_print(snapshot, p);
>  
> -	list_for_each_entry(job, &sched->pending_list, drm.list)
> +	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
> +	     i++)
>  		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
> -			   xe_sched_job_seqno(job),
> -			   dma_fence_is_signaled(job->fence) ? 1 : 0,
> -			   dma_fence_is_signaled(&job->drm.s_fence->finished) ?
> -			   1 : 0);
> -	spin_unlock(&sched->job_list_lock);
> +			   snapshot->pending_list[i].seqno,
> +			   snapshot->pending_list[i].fence,
> +			   snapshot->pending_list[i].finished);
> +}
> +
> +/**
> + * xe_guc_engine_snapshot_free - Free all allocated objects for a given
> + * snapshot.
> + * @snapshot: GuC Submit Engine snapshot object.
> + *
> + * This function free all the memory that needed to be allocated at capture
> + * time.
> + */
> +void xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot)
> +{
> +	if (!snapshot)
> +		return;
> +
> +	kfree(snapshot->lrc);
> +	kfree(snapshot->pending_list);
> +	kfree(snapshot);
>  }
>  
> +static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
> +{
> +	struct xe_guc_submit_engine_snapshot *snapshot;
> +
> +	snapshot = xe_guc_engine_snapshot_capture(e);
> +	xe_guc_engine_snapshot_print(snapshot, p);
> +	xe_guc_engine_snapshot_free(snapshot);
> +}
> +
> +/**
> + * xe_guc_submit_print - GuC Submit Print.
> + * @guc: GuC.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function capture and prints snapshots of **all** GuC Engines.
> + */
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
>  {
>  	struct xe_engine *e;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 8002734d6f24..4153c2d22013 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -13,7 +13,6 @@ struct xe_engine;
>  struct xe_guc;
>  
>  int xe_guc_submit_init(struct xe_guc *guc);
> -void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>  
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
> @@ -27,4 +26,13 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  					   u32 len);
>  int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  
> +struct xe_guc_submit_engine_snapshot *
> +xe_guc_engine_snapshot_capture(struct xe_engine *e);
> +void
> +xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
> +			     struct drm_printer *p);
> +void
> +xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot);
> +void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> index d23759959be9..88e855dae056 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> @@ -61,4 +61,95 @@ struct guc_submit_parallel_scratch {
>  	u32 wq[WQ_SIZE / sizeof(u32)];
>  };
>  
> +struct lrc_snapshot {
> +	u32 context_desc;
> +	u32 head;
> +	struct {
> +		u32 internal;
> +		u32 memory;
> +	} tail;
> +	u32 start_seqno;
> +	u32 seqno;
> +};
> +
> +struct pending_list_snapshot {
> +	u32 seqno;
> +	bool fence;
> +	bool finished;
> +};
> +
> +/**
> + * struct xe_guc_submit_engine_snapshot - Snapshot for devcoredump
> + */
> +struct xe_guc_submit_engine_snapshot {
> +	/** @name: name of this engine */
> +	char name[MAX_FENCE_NAME_LEN];
> +	/** @class: class of this engine */
> +	enum xe_engine_class class;
> +	/**
> +	 * @logical_mask: logical mask of where job submitted to engine can run
> +	 */
> +	u32 logical_mask;
> +	/** @width: width (number BB submitted per exec) of this engine */
> +	u16 width;
> +	/** @refcount: ref count of this engine */
> +	u32 refcount;
> +	/**
> +	 * @sched_timeout: the time after which a job is removed from the
> +	 * scheduler.
> +	 */
> +	long sched_timeout;
> +
> +	/** @sched_props: scheduling properties */
> +	struct {
> +		/** @timeslice_us: timeslice period in micro-seconds */
> +		u32 timeslice_us;
> +		/** @preempt_timeout_us: preemption timeout in micro-seconds */
> +		u32 preempt_timeout_us;
> +	} sched_props;
> +
> +	/** @lrc: LRC Snapshot */
> +	struct lrc_snapshot *lrc;
> +
> +	/** @schedule_state: Schedule State at the moment of Crash */
> +	u32 schedule_state;
> +	/** @engine_flags: Flags of the faulty engine */
> +	unsigned long engine_flags;
> +
> +	/** @guc: GuC Engine Snapshot */
> +	struct {
> +		/** @wqi_head: work queue item head */
> +		u32 wqi_head;
> +		/** @wqi_tail: work queue item tail */
> +		u32 wqi_tail;
> +		/** @id: GuC id for this xe_engine */
> +		u16 id;
> +	} guc;
> +
> +	/**
> +	 * @parallel_execution: Indication if the failure was during parallel
> +	 * execution
> +	 */
> +	bool parallel_execution;
> +	/** @parallel: snapshot of the useful parallel scratch */
> +	struct {
> +		/** @wq_desc: Workqueue description */
> +		struct {
> +			/** @head: Workqueue Head */
> +			u32 head;
> +			/** @tail: Workqueue Tail */
> +			u32 tail;
> +			/** @status: Workqueue Status */
> +			u32 status;
> +		} wq_desc;
> +		/** @wq: Workqueue Items */
> +		u32 wq[WQ_SIZE / sizeof(u32)];
> +	} parallel;
> +
> +	/** @pending_list_size: Size of the pending list snapshot array */
> +	int pending_list_size;
> +	/** @pending_list: snapshot of the pending list info */
> +	struct pending_list_snapshot *pending_list;
> +};
> +
>  #endif
> -- 
> 2.39.2
> 
