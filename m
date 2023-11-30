Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A66C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 22:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F90C10E05A;
	Thu, 30 Nov 2023 22:39:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E002A10E05A
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 22:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701383942; x=1732919942;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+Lx2pwcWz+o2i0xJMQ5n5cR/PaSOU0eL5sAfJx4wnpI=;
 b=TZ28X6VkyEFeLf1528h+NeVF+m9JPW0Qw9CzeV5GZv9KBZqiDyAyoHTv
 pr+9rMJfPaIqTwWLO6Pc46is4wOgc4aJfFgMyAMwCT4aI4aLkVudULvEP
 3VRDIlBFLr6MntAjlEY6otlY2gN8IVAh0UcL0CJ0pgnSr6S69+sCcqlJG
 2ysJEPTiC3ky8vNy7uaJc2ra0WIxxDis5LKE7yRjOls7gJC4S6QDgV0bO
 tkJIs56FCX9zPnNLjl7XS2rv1iXG3mWqiw2iiiStk2mjScFVI7m/jHXUJ
 yD6NMNG4zASid/L0LM5ISH++Dehxw433qasiCW/bc88jcULJ6pRPxGSDz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="383795919"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="383795919"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 14:39:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="887398207"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="887398207"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 14:39:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 14:39:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 14:39:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 14:39:00 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 14:39:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZXg/LxGZzPawhuocayky60CMHKmv9NKC2bwX3M3httsa0qTndET/Ue2MTgF6OhlXcwdJsMQFN6VWy+GyVCK15DwZLaDzOD9wBNkrOl0g1awEZgO1O1bnEDUFINzukNTKHBYOmZ9qv3ElWPgQW8o2WHlT1QPhChV23Cl/pqAWsdaofCo8o/DnsDNOWD/HBVhIXlkkCTsGf/vvl/Cka2PE/yanbFybgILZtFusqt5Ct9DvyjN3Dhox2BMFa8Fo7u/GFCTwtEavo/dYHXCnAftvgzx426iw7YXEslZ46/KwGFkIkDZJfkwkyjFXU75OB0QZD5w9a2X2dUQu2zaRJG8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uX9+srZwgC4OpQgm0nWEMaoJbsWZEPUhEYOPH40wBmU=;
 b=ARb9kwXBgsWKBJZCydN3yyKBCM8QeULY/Zd4E5Qqk3a62FQfu9ZHEE+YeRCqdZsKz16s271V1fIpmVkZOQ6TAq/k3FesN37FcVTZp6gRM72qIfOITe2Y/jm0hgwoKPFCpnnEzhBrnWcPRo7z+oXADczuANZKxTAkGoLc4Z7T/U8/biG0BN/FjZx1ibugYJgKJzU5yXoopQlz4BjGAGGsW/6zz4+Mm71H7mYwtrEJSZ16Jiw0LjqmjbDtdsPamKSvGD/oPfBIOGmDx0T7Lu3RUp+ZsDSlnKJb7biA64TJxZgatC6n34LZqJZTXiyhlbgiTri6f7Zz31FHI9YKNaarKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 22:38:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 22:38:58 +0000
Date: Thu, 30 Nov 2023 14:38:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231130223856.GA1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231130180135.628368-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231130180135.628368-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY3PR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9bedaa-c113-4588-c1de-08dbf1f52462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vb7eMffXA5SC6OcSdBdVXS98yBHfsmi2V9vLsSu4gfDa235ApJIGNAVKac/7eV5M5uk6FaEA5NoK/KwF8lsajZeFv5Gvv9XFwu7ENf5eDLNVcSJT58ykPZ2LWtvjsSRMjz7j8i7rdOgbvEXkqrb3+soKuVfTMl9HFIlu83ykhmkXXoJc3gXsdbHns/XTWpySKunf50s1k3KKIHn7J//63tt8cvvOMK3UUCcOcJaQPsK/YXX9TWSaasSq8LSfq90hvbNGxc8+WmJ6dQirbVB7sz2Rdz+Z7Lb9r85ZmCo2f9FHGJHjv3ITQ8jVoL1ZD1qdBaPLgHIy6yDqGGjuD1s8qgIgLig3vlymqkEqEO3DCvKqOx3Cag6YCnDl9kb6qliu70F8HG5n6flBw7pd0tLOyQcV4yBM5Q35JWdbRW215LAopn0D49Yaxjv2JFI4xdtF1+m2com0YQ2rA9KDkUH0QIGZ7Q0e37yYTbBOBe5T1Rw/rZsPIU54DJqNobbgqagQeq/Vp0sNavSRMDd8Qby2CkeItKNVd2Qu8Ol6pA14xDmFtz0Pr/DUJc9drbGxXIW1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(316002)(6636002)(6512007)(66556008)(66476007)(66946007)(4326008)(8676002)(6862004)(1076003)(8936002)(26005)(478600001)(6486002)(6506007)(82960400001)(2906002)(38100700002)(5660300002)(33656002)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lV4sPyAOhdy8MIvEWKD8W7b85n+yHN56c3/e7S2wIvW7GL0b9nDKUkSgCIRz?=
 =?us-ascii?Q?JeGER3qSSIBhxv4Fv2HD7aQJYUCmNrdQ4qMMR6YDHwo7mRtCfM2BuRexrCHW?=
 =?us-ascii?Q?Y8ss+eTFmwO4KxiEX+X4/mt4q0iOUq3mWOQPo3KfavoC7fJSdU6mUyNgT2CC?=
 =?us-ascii?Q?pE4yOutytVMGG7NYJB5UoAHgPpmSHLd1ZRD+im6PxraulaHgDtDbxPSIoaOI?=
 =?us-ascii?Q?F8ogLooS5HWuHjOcRVF8CBLsv88vZgNSx6CuvQMZ8hhl/hHLj3tXaduNsCPr?=
 =?us-ascii?Q?Re19GgQ12gvqejZJQy0Pc++L/fR5yvUXa+f44ozju2iyU1YLnA5cVpckozEE?=
 =?us-ascii?Q?rDNmQ+4Kkwrv0jVFYQCG5SM6bEwGkkXsjTpHuhQEcM+4wNWc/Bawxldn70gf?=
 =?us-ascii?Q?ccQ/9QBvCnKSv3bZjpOvRCRGvhNJYfpfX14lF8B5FP4v3oHP5JR9NcsaFuxO?=
 =?us-ascii?Q?qMzLrqLoF677ko97SZcHh4oCxVtW5oUkVHEB72F8XmmeRaMu7vTXTki6bSOp?=
 =?us-ascii?Q?M7oVPtjoc5xXXLU/zPUwT9saHuEHXWnnAGzhU5lL51gaT3ONsfcgpmi1CoQ+?=
 =?us-ascii?Q?dgNQUKMjbvCF6uKiJ4iAyZF+JhJuc7MwEXpfYnL5W/eKTDWH4HG2HAW4GUDE?=
 =?us-ascii?Q?9r4Y7AXKcOL7tU4IkPy9h5FsZysJ0Iu6AArxriML5bmSB/EA9rsS51POXzSw?=
 =?us-ascii?Q?3ceXvNFJ5Q24RHK9BLxRtcBKdHEBR+GkuVoax4CWhRBbBgS94y7REjya2S9H?=
 =?us-ascii?Q?tESJjSCQTjfC8IFjjVJWzWOPbYpjabqFP/CJGt4GE+1VXPQS+/V12Lwu04BR?=
 =?us-ascii?Q?DNFqQbZVI4ChDGrIVV5+KooWVsIMeomkrGLQeMUunxdsiUznHypVAcVW5DnK?=
 =?us-ascii?Q?mi/FvGVwRfi50mg8d5jMTZZrve17578hnxhW6pD4dqD1/G0IwsZb0Ltwagec?=
 =?us-ascii?Q?brtF1fjXb4efE4AXmE/GHpYptA8qbCaan2NtFHHFdmSGjg1GN6p3QSWR+KCO?=
 =?us-ascii?Q?GQqSea4PnYrQ3Bd7uWsqMqsxjRTzyVTV0SZSuVLYbk2Kyf9soUQIu9RCdUzi?=
 =?us-ascii?Q?lcpUymWZXAmJyhyY+A858LCBsFBFk/yfQLYyDhrbb2M7muh0BAvdESfBz8YZ?=
 =?us-ascii?Q?QTEegFnGv+t2A6jw9eskL/TtY3Vks34vY8xnpDnaF97OnwTeGOHxmgxKB5FK?=
 =?us-ascii?Q?zpop8JmA9QF/089RWpZZ3PCvXn2Lzhl/7Kt0PxVyJ2KqNSoSVpymgbiNZTSL?=
 =?us-ascii?Q?6HIIBjHm1qmdAw4eDVjW80MvsTAlyl2UTWkYCBXFxFzD81rhERWIkTukDTYX?=
 =?us-ascii?Q?k+n0xH4QnCJUz+K4cyQjsBg3OdaPBYAQqIfSq/w+WgKUDnbeIgW1S3/uhjJR?=
 =?us-ascii?Q?3BE9yfOkWW0IgRKoG8vALnehvc23/m1VKdWr6+k7Xsl/THcvZOgCFwpnPAIJ?=
 =?us-ascii?Q?yF69Zggxo2EvU81CUXs+S6jS26w7rWWnY5VK/YAsV/kAZok0RK2NIoLXPS9r?=
 =?us-ascii?Q?8Y7N98ELljmS+06mcEPcMmYbbP9WqgH+SLdHU9RNXynj3VwVw7jcX0cDsf8M?=
 =?us-ascii?Q?ZiXJq/+vxyv2VGPwE9Hm04PvdEHujaSWg9ZDTc1QyELbszHuBkQtqaWTsFf8?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9bedaa-c113-4588-c1de-08dbf1f52462
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 22:38:58.3848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/4OJlJjnjTK8/Ryyr9NyDdpLqCBFgHdk78eGoRadC/eE0wVJQrvPb5L04Ftw0YCefzYvJXPbu9doAzCGIEjr1JxN/XOLlHSIE3B0ojod/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V4] drm/xe/xe2: Add workaround 16020292621
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

On Thu, Nov 30, 2023 at 11:31:35PM +0530, Tejas Upadhyay wrote:
> Workaround applies to Graphics 20.04 as part of ring
> submission
> 
> V4(MattR):
>   - Rule for engine in oob WA not supported, add explicitly
> V3(MattR):
>   - Pass hwe and rename API name to hint end of ring work
>   - Use existing RING_NOPID API
> V2:
>   - Marking this WA for 20.04 instead of 20.00
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
>  drivers/gpu/drm/xe/xe_ring_ops.c          | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules        |  1 +
>  3 files changed, 22 insertions(+)
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
> index 59e0aa2d6a4c..1201e42ef823 100644
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
> @@ -184,6 +185,23 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  	return i;
>  }
>  
> +static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
> +{
> +	if (hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return i;
> +
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
> @@ -342,6 +360,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  
>  	i = emit_user_interrupt(dw, i);
>  
> +	i = emit_pipe_control_to_ring_end(job->q->hwe, dw, i);
> +
>  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>  
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index c7b7d40b5d57..727bdc429212 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -21,3 +21,4 @@
>  22010954014	PLATFORM(DG2)
>  14019821291	MEDIA_VERSION_RANGE(1300, 2000)
>  14015076503	MEDIA_VERSION(1300)
> +16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
