Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B08C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 17:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0364510E74B;
	Thu, 30 Nov 2023 17:20:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01B410E74B
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 17:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701364845; x=1732900845;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6Qq52ONEs1UwvO33dp/0GrIGA65fa8bjHpc5EE8yZlU=;
 b=EP5Azy3lcgdC/TFDqF+vSwToNeTk7p4S5l8cd3d//7WEOrOks1580l4Q
 DIQZDN8hZC3nLfewJ1lbTCVJbp9Qwv4ExiJiZOmpm8oTjzGJh1dUteTPd
 pIp5IeSwXvusaIJ0QXUsNHVQEOzjQ6qQHqu6JRwQjhfptRouUoLsyzZZX
 zHDShL3uq6l6HS28y0crpqq8TU9F4yM85VlrGjgpzxOpS66DWQewxZka9
 PxpUN2p0ByaEOxkIpMk0y5GmtfMcWjP3rWlI9Ie9r38zajPjusB6irfaU
 Nij2yoyqpUaad7tdSFyRmWBkWIFAvqGc6TYmx1MUFW7D8j6wSN4CwbXUr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="244208"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="244208"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 09:20:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="835464806"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="835464806"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 09:20:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 09:20:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 09:20:43 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 09:20:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYOalb+snmZ0DM4nqdLb7C6Mh/Fxl4P8I20dd0GxvyEAAFR+EG7Ipi4WQ+wTOQUQU1esZuWMFpMR8VCmfD3dJG4DsuCoxNcsZG/pwptaT6k9W1MarH/LPOYWOZHKrUBPS1JZ2p65gtJNsWQ0kIFPfagB8QgnPJRrxXx0ySTprlwihv3jsWCGhLwJ2i88yLdutArBS2UpSqjaxPyJ/Ptfcy/T4fvBI6AqazYUeZ77Tp2qSO/ABfoigD9h1Fl8aWKoJ3jCJxUdFI6ZJqO5F9gxEjDW7YloQ/IUzAXaf7OyvmLJ/6+2M1g+W4CTb4HlEWpDnFbM/jgeA17VeRSAmDD6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmNK49adONNgLLbqv5VeX9KczZ8Qsy8H/lmG2Pu13n0=;
 b=Z0xdEEvRnlxmxHodeQguWuB60uNa0MqJVlR5TXUpl5ebOio0IjuWyT65ekbR4+fxmwrPtlWeN1XSnXahF8K/OQSuvHmt7JAI4QfIUZsC6ziNJtccGjaOXMPUiubbO6j464524+B5hb70AprRhl4WYDKcpFED8OdD/5RhqaSp2kf7YcDzlbkrfPPyJkEmh/s11tOfewjhi741mp9FSVp41/0uykVb2kDdVaDUD4a/N74Ldg81PoFVh3XbMcNWPBvUAM5iJuKp5hAwyt2TSNTaTqog9jjAI7EYHF0YqUauc5lYR0DyueNdnTLe1n4DrIgV6gOKCtmXAjFwY46F6YBGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB6374.namprd11.prod.outlook.com (2603:10b6:8:ca::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.24; Thu, 30 Nov 2023 17:20:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 17:20:36 +0000
Date: Thu, 30 Nov 2023 09:20:33 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231130172033.GS5757@mdroper-desk1.amr.corp.intel.com>
References: <20231130114441.614774-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231130114441.614774-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: bfbbb823-3f86-4198-7e72-08dbf1c8aa76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wf3xGuiLimkTfb6XArVmbBj3R0YKo3Ha9jixYiBML6xfPW3Q0YZ/3px5Os/H/PF3DoIb+crHYtvCOI6DulteveWJM4ZgIqr3HOTCQXcHsuXr6k9MYCyFOn6kPP+IRVVrcxdErEO1WY/mNnp77GPCU11X53h41FQqMvQ3X597iDbdNiS3J9qjrFn/4UfH6Tb1M1R1RkK5VGg0ECw1o/LtPmnBueeBPZnXG3BeQUMR1FzPmFCMOPsXnZ59hjWonwamSWW0X8iuBEFeoO5OuE/teyfGH5maQ+y4pLKlXhhIUNYQ5wcf9w1JYOhiAmuil0r/0L+D5dSsxhXmpnjRSkWV7uhvPcK7jdk6xE5ncjhmNYIpXu6dL+GpX0lDaWgEVF2VTWFD7eg+jRQLzqaKT7ASCjMKzXrmqRHMW5M3qCtJxVfDBvKU6nVog4poOefdARIYr6wBi0bHGF4edyN9jK0MSPjAaYkZe6eb6VQZ8wTkhx4GRYwBvqe+i4cSUulZcUYp9pc+68ZfFe1u272iLzIc5Kdi0W3AJhbrRUTaO2VKH7ufFFv4FN/Khpq1wET1Yx7w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(39860400002)(376002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(26005)(1076003)(107886003)(82960400001)(33656002)(86362001)(38100700002)(8936002)(5660300002)(6512007)(6666004)(6506007)(6862004)(6636002)(4326008)(66556008)(66476007)(8676002)(66946007)(316002)(2906002)(6486002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wRc1cIdGKPbxi2Qcx4vL9Z5Q9NP4LqoYI/noJQmW4zvJ4d4PKD/RbfxG3IGm?=
 =?us-ascii?Q?CtEB9R97dhxBvuO1ki6TnheHPzs9Tlet0TRl+8cqDGrBVlim3VqNxwbU05wq?=
 =?us-ascii?Q?wwHVgSKXlibXWA8J81o4JMNfj5dMecg1alv7wMLf9pUzWein3mAFGvFNT+ew?=
 =?us-ascii?Q?I/5tk/Sr1LQTTHEsKj0YJuYF1nwZzmXoVb+WfYg2ljtf1wPnk773qoXSPTzR?=
 =?us-ascii?Q?95U3l7FfYliYG3G72ULn0gKc5UGgZ6TVF2ek1OQTU7yA246c8ewC9d+yTlNC?=
 =?us-ascii?Q?c1qfvVjOEyNff9+0dkg3mbETEEGFAg4HUP0efGInDRPKxRrDvixMcyFmm95V?=
 =?us-ascii?Q?yTZTCp+w1N2FtFlqWkEPtNPPofSpR0N0vnslU/iYMGJTIqeE9Eao4LzerOWW?=
 =?us-ascii?Q?gMRA2tLjwyVLO0heTAqaRTGw21ArEuhx9oKTd61QM9Xj2n0xSTVGxIKJ5ljB?=
 =?us-ascii?Q?vgGdM6WhNxygOMG/PKk2od010SlNFqevgFk2AgwCpKaSeuhOKxBylyOTTFhS?=
 =?us-ascii?Q?zVpyOooYEBYOrm/KEehbeTJ16E1vyYxtY74qC8OmohYmkhXv0Mp1eilxYT8+?=
 =?us-ascii?Q?KBaa/hlSFh5rfqi1hTcFxETIdHRDwRgy1CgGKGCkDV4z+h91YkCoWTD+3zdt?=
 =?us-ascii?Q?cXU+0y5jLf4ZcqHU0kwPOkXLEEvCnKAX6sgrJW/aD4CBVcY/8UHMEAAm1NGX?=
 =?us-ascii?Q?+WG66BtWonVLq3e4QCDUgwJiaepcsngjL65l/McZPn3g0PMd7K/SjOjbZ5lx?=
 =?us-ascii?Q?m9quw7oD6L3HOWyfYLKRuW0zJFh/G8Zmoq2Y6FrwZPMT60VqcEqEbHK90/oG?=
 =?us-ascii?Q?izjnid6xi8nY6jxtFXKQYsvv0dTjWcbKBr836YwRnzF8div2/iLKJJLu/oGJ?=
 =?us-ascii?Q?VmM8LysvSiPaCSYBlOpbk2P30H+UwtbrGcXy3q1vjKC9ZV9PMZ3c/PTuMqBi?=
 =?us-ascii?Q?1L1ljmHIfPUBDzboo14KbIQpo9+ePvQ/JNfpj2SSnldEIeP2BAP2ZG1U/Lk5?=
 =?us-ascii?Q?onuBYw8gl5g/D1k9y0K0fBkgQ/hHhK/uqwYG4LlBcPVKA2bGzUxtTjan3VFk?=
 =?us-ascii?Q?8MQVPUVwpsIUQiHKRqjF4niOpp2Pq28DsEO7cyyMmtH6/IiUAyKaGQ/V3SfT?=
 =?us-ascii?Q?gxz4swpIYxndObY1Wi0UWiDbFhxk/bqwXNFdVDLN4hWWxwMmy2WXjyT1c1iv?=
 =?us-ascii?Q?WAQIsQ4MyZlVGOJ0T46AFdGgyRdC9KejcJSq2U6XZt9dxMJmdJvF8r4+Fwo+?=
 =?us-ascii?Q?FMdxnqVtaDKV3m5UKVOuHsCKLkbLCmvwkAyzQQtPZJzSbQDn3Cp3h39/6J/p?=
 =?us-ascii?Q?h+CkSwdqG+VU2mmxqs2nj7pMVrR2clVVeNB08fDn/41FbJxaMpHYs9y8ApJV?=
 =?us-ascii?Q?qUg1RqJRObscow+xXZ9mKlv9nFcFkkmCtJPx/1Mk3pnFbllHe6t3wMQXBHrJ?=
 =?us-ascii?Q?p8eCS7sR+3riScsauLRNM03JXdbTGCglGqvVoeMJ9BPKFxa6p2qCcdBIDvvk?=
 =?us-ascii?Q?JP0gMs2ViitDR+vr0HqO73ImwiMZnY2R4+1qtyiRXT6DX73HrJlxVzog+/kw?=
 =?us-ascii?Q?ViVwIAubU5HHunuWPHMelcho7cpjDMj57yk74ceCIhGJwBUAvrQyUh8DLn7l?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbbb823-3f86-4198-7e72-08dbf1c8aa76
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 17:20:35.9971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGwhc5aVVE40kMMkV/Qqsla32JAXzm2V7bPwbYroN0p0wAFOxWPsjMFxBn+EZfWg6CuwlutBSUe4Hku99y+PGLtR7acgixU8A688C+zaLp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6374
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3] drm/xe/xe2: Add workaround 16020292621
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 05:14:41PM +0530, Tejas Upadhyay wrote:
> Workaround applies to Graphics 20.04 as part of ring
> submission
> 
> V3(MattR):
>   - Pass hwe and rename API name to hint end of ring work
>   - Use existing RING_NOPID API
> V2:
>   - Marking this WA for 20.04 instead of 20.00
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
>  drivers/gpu/drm/xe/xe_ring_ops.c          | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules        |  1 +
>  3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index 4402f72481dc..f1c5bf203b3d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -48,6 +48,7 @@
>  #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
>  #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
>  #define   PIPE_CONTROL_GLOBAL_GTT_IVB			(1<<24)
> +#define   PIPE_CONTROL_LRI_POST_SYNC			BIT(23)
>  #define   PIPE_CONTROL_STORE_DATA_INDEX			(1<<21)
>  #define   PIPE_CONTROL_CS_STALL				(1<<20)
>  #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 59e0aa2d6a4c..f69279f716d6 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -7,6 +7,7 @@
>  
>  #include "generated/xe_wa_oob.h"
>  #include "instructions/xe_mi_commands.h"
> +#include "regs/xe_engine_regs.h"
>  #include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
> @@ -184,6 +185,20 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  	return i;
>  }
>  
> +static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
> +{
> +	if (XE_WA(hwe->gt, 16020292621)) {
> +		dw[i++] = GFX_OP_PIPE_CONTROL(6);
> +		dw[i++] = PIPE_CONTROL_LRI_POST_SYNC;
> +		dw[i++] = RING_NOPID(hwe->mmio_base).addr;
> +		dw[i++] = 0;
> +		dw[i++] = 0;
> +		dw[i++] = 0;
> +	}
> +
> +	return i;
> +}
> +
>  static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
>  			      int i)
>  {
> @@ -342,6 +357,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  
>  	i = emit_user_interrupt(dw, i);
>  
> +	i = emit_pipe_control_to_ring_end(job->q->hwe, dw, i);
> +
>  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>  
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index c7b7d40b5d57..d8fa1e958dc3 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -21,3 +21,4 @@
>  22010954014	PLATFORM(DG2)
>  14019821291	MEDIA_VERSION_RANGE(1300, 2000)
>  14015076503	MEDIA_VERSION(1300)
> +16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0), ENGINE_CLASS(RENDER)

I don't think ENGINE_CLASS() works on OOB workarounds.  The workarounds
get applied with XE_WA() which only takes a GT pointer, no reference to
any specific engine to compare against.  And xe_wa_process_oob() that
figures out which OOB workarounds are relevant during initialization
also uses a GT context, not an engine context.

For now, it's probably best to just add an explicit check for engine
class to the callsite.  If we encounter more engine-centric OOB
workarounds like this in the future, it might be worth extending the OOB
framework to support that down the road.

I wonder if we should add some checks to the OOB handling to catch any
"illegal" rules like this?


Matt

> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
