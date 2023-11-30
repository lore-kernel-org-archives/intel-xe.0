Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BCDC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 00:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6958F10E0EC;
	Thu, 30 Nov 2023 00:40:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39FF10E0EC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 00:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701304834; x=1732840834;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bSCes7/UPHj2w/wVYekn3EdED4a8OhRmeADhb5RhJX0=;
 b=ngeag30vXIpBISrJ3ARt2gSQfZA5BSrTf0vttGbGvyYannekdtHYvhmx
 DTH/FfOct3vo0RJgR5hfr7a1aO1X2FTVhv0vlZ73jh3UcMSGT9AZUSiz0
 pcW8yDE0kutC2br0j0iEazjytQoewaYw3HZjnUe1gOlH+Vov+PvIxpwfj
 ikd0NAIxbHYe5Sg2RmRg6rNliIij3G3NoZOIQHHsLKXmheM5y5yZjQaUR
 aMeV1k7VyQ8VgL24KPOFaDucgLz59S4NlcgN19WSbM/AalKoNiEXhePD4
 /WKpUO+oDIXZVRBCDzGc7M9CbhMUL8flVzqRkCXNTp7KSAw8YJoCqP8wv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="457566568"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="457566568"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 16:40:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="942520721"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="942520721"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 16:40:34 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 16:40:34 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 16:40:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 16:40:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 16:40:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJ7MPX2nUlwDZlMmgBQC1845F4HPntKnOH0wWYE1zKVEBbgEHTbGgU88DTIlkx3xH0MQu7WF4Kbk1QngudsI4eesGpK/u9V4hfCx388k6UqOeDdkgw/ze/2TfQND2CHDwfRFZTFKVC7xJ/LrFwpkBX12O2qkHLZlhy6IJlMZv/qdne8lltLqli2RWzpifuvGO9uF1GNGyadcuQMeS/B5vNHNplweu8q9Db3qMhdRwngUE/KBZbSMccJgwKlKuwADbHkufoXsmKNDI1VWX/XbvyBsGTCfy9umciF/oWQnnb3EQLLcQ0e99YJedfzATTdrx4/1FHGJ1GftYhKypZuisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJD8tHEgSjIvIDeOSEvDstQnWEnD7Y3FAOYO8Qd3J0I=;
 b=l6j2b30U90kAbfqmKAOtglegIJvp8AryoCDeGaPF4jNl8+5ywUMZyBkWHVKRBaeWH/RorLNREywAmzo5kitrQB49evxaQ3QsQYdldbEwjkFentEI0AwL7mdzf8vhiPsFbxMsiZyAh+u8Gsd5cjQvHRl4ytIkW0luhEKMm8RkfU2DmAkrkH63B+habfr9yxC7B3wFITCLxbz+XHiCg0JuGjK0NjzS8EkYLCHXFvZd1d06aTzIkanv0jvCCgitr6/Q7hIk8D0MeNUyjPO9t7GD2e0gypdU167+gl67kz6R4A/M1QJQycJ9ZSfxJ6rEgGcYaayJ2j3KEwBPZWj0MfA1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV8PR11MB8511.namprd11.prod.outlook.com (2603:10b6:408:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 00:40:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 00:40:24 +0000
Date: Wed, 29 Nov 2023 16:40:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231130004022.GW1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231128114232.4057798-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231128114232.4057798-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV8PR11MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2c97e5-e131-45db-dc8d-08dbf13cf0c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zAjXi3vhQBW4mGZwwJXb7EHKbJs/gkg6H0716XHrwlr78lBdvPHpGM12WbEszGXa4p2QOvN9x+XU9efRwnGQfw4kh/WThFvdgYDp7Hp4NHqHVIVJ7Do47NrfVryTUQPqeNOzz/CziQFIoB56VxxBofnLouP4/ZGUVjVx3pslAGD2wqYKfa5trog4UtfyCGdI7JLgzequbN3Pyz1EbwYasmJWHDbGYsuprmCSEfA2LB+zY8E/vMcpgjbNz8Uu4YpFb72qUJj1ts6n/IcKMpnU6u5u9zs91YbxOJpU+q9FIWDk9Cw0t6Eheazl20M+dY3AEwmUup8+5oGxWhiu3R7MBFFxKjNH918wj49lGnsMBqadWsE+kqNjCIwzg4/JArFvA4b9INADxTW9Ix2z8TFGilToGw/LpYDBFn2sRtEGUGCNK1GYp0vqHwXUFoW8VMCnhUmq4nLxcbu/1y9QyaswYh2XnbBDDaDbDvGdJ0o5lgGlzP5IV78j1i0auXPXJ0KhC+PWwUp1qi9EMBqzXOJFbqLxd9fDHxUI7aJOPDGnv0zFUEkd6n6EdyIh4393QuIW4BD+miKmj7lUgWYjvRTH/1NC3QDGPkIEKEThufU84j/dfT0UV+T/WuDjIWyvJxkA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(66556008)(66946007)(66476007)(6636002)(316002)(8936002)(4326008)(8676002)(6862004)(2906002)(38100700002)(6486002)(6512007)(478600001)(86362001)(33656002)(82960400001)(41300700001)(6506007)(5660300002)(26005)(202311291699003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RO9Pw2dHrnfXA3ZXfUgnUWxaYE0nTCO2LehrIQ1mb8YAFEkn7OIqfbaAdzvq?=
 =?us-ascii?Q?zN4S4LhaPKOVEkqhqq8OYUJNCAAEPGDyzWVs91SYPJ5B3NHFiX9IGM0RKigC?=
 =?us-ascii?Q?1mA/MTvnpwiyYcV0sKY2mJF20kkqk5K9favXvAk9UFrj68VPqM1SxlAqKxhT?=
 =?us-ascii?Q?ogFCAXhiLdiXWD0tYwCdEA7wuuYtUVWa+xDMSpekbPPIaJNtJUBqDM2zB6MP?=
 =?us-ascii?Q?1qGSouUou8E0NUBYQ7Cqk/KjcEPP9LrKEBw7DV661HHUESS8uaLLIC3WenWG?=
 =?us-ascii?Q?toiMPM+bXoTF4tNtNRuCxQgy7T4iuiFQ1Rlhn4noI29GbZLTcEHWyr+ZEnZI?=
 =?us-ascii?Q?tccGvn1papEtwiB6tFkP0JaxAYY6SOevT8GrbXPFyWRbEPXQsOzkfTdznBYp?=
 =?us-ascii?Q?1B6xeHpLCtlQzG+rrTnMSdAg2od0B+uvYc5pxbVF8MDS/G1TzkGyhLtp3t0X?=
 =?us-ascii?Q?zfnv4/mLT6Gdbf0pNjcjPOkniEnIZ2R0CBSVoCTaF6RpgcyeXFLX7fOVlX7I?=
 =?us-ascii?Q?vTM3onD83+pm3IsjNu4ZT5RblYlHUJqBfwH0gzLkt47UM4Pqpfpulp9MfYqD?=
 =?us-ascii?Q?I6nmrGKTP5m7cqvRyTgKtGmSHr69ghsthWKCLCY5lemrA/d+kNaN0O89RF4/?=
 =?us-ascii?Q?aCsUI4A6GtH5yM3p/DF9zpxE+ewsNECrPgY+ap3G4792Zj0YGm1HcZELTj3m?=
 =?us-ascii?Q?o6PbkaLzxRKESN6a54VbC6jvfjsScvPl4iKCxFCo/llBoc/IoNj0WaOAqh+S?=
 =?us-ascii?Q?Jpl+IogFURbO0zd/BFjB9wyI0blaItoiet5roKeRV6N9sIIuytGUbwTAZ1Ci?=
 =?us-ascii?Q?XmC96wspV+Wu7ESkELPS1lTB158xv/S3Et3q3ZAZVuromqnySmmQNbpjHgzY?=
 =?us-ascii?Q?32wFrEJgCKDTJ9mQlx4TzOGQMJGE0gj90+GnA4vBzWW571ldmEUApWt2WG6t?=
 =?us-ascii?Q?JAvGc5Y9b6vbtcdqLZkL5kC5KeAMKagdes0heL4B4owUw63+hnLJ/WkC0tMi?=
 =?us-ascii?Q?m9f/4DYEaMbOezbqd6HX71febZNMSeFa6XNQpUzgI3KdhuC9S7nvgP2f3mPj?=
 =?us-ascii?Q?0eLnVOQSO+i6tcNKlTKwhME+yaMdh+KZ/nnetHcOmJpFjH6gbLWcZ4p5s+mc?=
 =?us-ascii?Q?I6mO6j2rXsSKDCuhjoz0YTW0bVVuC07IldSXYwOLqp4z2wCagFsdJrjr2f0e?=
 =?us-ascii?Q?+sc80yqYx2SAKM4srD6zJps0C5jlo9uWLTAv5tyK83SV/5JtbG86tmzV3at/?=
 =?us-ascii?Q?dTm3Wd/Fnd75HqIeaeMReureTHLMOH8+GyZZkBLGKwgsOgHNKZBQx3Qefsub?=
 =?us-ascii?Q?RvIWYNfjMT+6lc7WqL8cBmZLAnLyDeaPwPDpUVvF6Zv0dbD+tJOhPwFGcVBA?=
 =?us-ascii?Q?SPkXMfAuqZwRUgbil2b1BvytVWoGMqXCCRA1rtk+A9QAMuNbP/wg3L4LgUXY?=
 =?us-ascii?Q?owTjKEFAXBwj6HAncayNEXdZEEGYydap7Vka60P1puS0PQ2uuM1V2oCbdhVu?=
 =?us-ascii?Q?pxbB7pBS/K2cjsUkVrSzOqZI/Xu/AmFe9kyVsQBeUDqMJwaVN/mQVysiexPk?=
 =?us-ascii?Q?fpiE3aKUEf7ZhiBHJQOdJaNcA6Dw+uHMfeeB5xQx1i5zJrWNEN9Gt3OHs/AE?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2c97e5-e131-45db-dc8d-08dbf13cf0c5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 00:40:24.4002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99MbC0seyasGf0yyqXCCNp3WGZWbr2Uf90CP5FInnrPVlCWhV3V8GLBv+Q/LyEjSO5YbW29HbydPjkzlToVjn/GVENvnZZEkKf8+gGSktmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8511
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2] drm/xe/xe2: Add workaround 16020292621
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

On Tue, Nov 28, 2023 at 05:12:32PM +0530, Tejas Upadhyay wrote:
> Workaround applies to Graphics 20.04 as part of ring
> submission
> 
> V2:
>   - Marking this WA for 20.04 instead of 20.00
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  1 +
>  drivers/gpu/drm/xe/xe_ring_ops.c          | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules        |  2 ++
>  4 files changed, 22 insertions(+)
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
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 18b13224480d..efc05762556e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -60,6 +60,7 @@
>  #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
>  #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
>  
> +#define RCS_NOPID				XE_REG(0x2094)

We already have RING_NOPID() as a parameterized macro; no need to add a
one-off definition for the RCS-specific instance.

>  #define FF_SLICE_CS_CHICKEN1			XE_REG(0x20e0, XE_REG_OPTION_MASKED)
>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>  
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 59e0aa2d6a4c..ed161e4ac4b2 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -184,6 +184,22 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  	return i;
>  }
>  
> +static int emit_pipe_control(struct xe_sched_job *job, u32 *dw, int i)

It might be worth putting something about "end of ring" in the function
name here to make it more obvious what kind of pipe control is being
emitted here.

> +{
> +	struct xe_gt *gt = job->q->gt;

Wouldn't it make more sense to pass GT or hwe as a parameter rather than
job?

This function is going to get called on both RCS and CCS engines, but we
only need this workaround on RCS engines according to the workaround
details.  We probably want to bail out here if we're on a CCS engine.


Matt

> +
> +	if (XE_WA(gt, 16020292621)) {
> +		dw[i++] = GFX_OP_PIPE_CONTROL(6);
> +		dw[i++] = PIPE_CONTROL_LRI_POST_SYNC;
> +		dw[i++] = RCS_NOPID.addr;
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
> @@ -342,6 +358,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  
>  	i = emit_user_interrupt(dw, i);
>  
> +	i = emit_pipe_control(job, dw, i);
> +
>  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>  
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 752842d734be..defae8259778 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -20,3 +20,5 @@
>  16017236439	PLATFORM(PVC)
>  22010954014	PLATFORM(DG2)
>  14019821291	MEDIA_VERSION_RANGE(1300, 2000)
> +16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> +		ENGINE_CLASS(RENDER)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
