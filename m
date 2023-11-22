Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2679C61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 18:09:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9590410E0A7;
	Wed, 22 Nov 2023 18:09:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824C910E0A7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700676573; x=1732212573;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1J9JTPmWKuUwHEsEKDf8Bxy2mKH+Phh8zqFwoTGc1fI=;
 b=Z0G15jan9MhYSA+r2HIofalPwgSpO4Xxr2T84leRw+cWMIAB+g3KqnOi
 lHJMUcRU5ABD6HsGOJ0AXanquUw+4LQu3oP2OWUgQXjIwXkr29g5WOKjR
 b8ntgT/YkEUUM16QwDLx3hruQUpjg/QvOx6NsEDn4A0ljxYC7ugodnR0k
 6EA/+b2F2nTZMXrMI6UmsWfNjZTqlEOalE4wGrzDSRfgDGvdwdW/4RhNb
 oWEELlRULRrQMUOrUAWr0ZfrOlASlodwDwisvOltaSgoFTgs7s2AQlIFg
 RgKRPLF//WriPs0MHN6ozql6TH7K+BaiT2J0XoNg+gUVWreZJkIiBvbi/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="423203923"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="423203923"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 10:09:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="15038993"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 10:09:32 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 10:09:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 10:09:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 10:09:31 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 10:09:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkZCRP8yCy1Lr+UZXiZW855GvLECto3s6/g/krLhhIINqvRbvP0fL8wISLrPHA+Btqdg+JG3GKLTCwPrdHh2VD4EV8RsBMjziv87XrXg2oQimr+bp5fr65q6kzBsd52jR+6DNR/JSFj1ADlW3zGdcSnJyz5r6apUUROq0ZwkiXJ48NqpEuIN5shQlSZQM26A3ni3PCNSShnsLxZGU+U/1ggDxtC6Edd5oRJrFn3PWJdYMORUYsFFLscKxJudVFvYzd8UjdkP762I8Rn4Y4qjT9gSpRmcvfhpzQLLHzPFw/A/urywiI6YKjhce3Ymn6cgqZ7kEIJ7u45L5ramb/BZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgzB248UdkSssmWVe2iZg4A4wwSnQsntaAgzJUC0qn0=;
 b=RorOzzjlldiOejMlSW/a/TxUbZyuvAvmGa/qCARAd/HcXQcLt5QTkl1QmYOOh8AUUbxnYVPZQiA5fs7MMD8FDrcI7LkRpvFG7Z1rI0Pz3Sn8n5TJ77fCk7J59UvJpgr/nRDA/FY+0lQeAbkkwMpXYdEGIz3oWtJSiY1lHkvON9BkqWdRR6czHx5qKDKFi7g/yWmUNrZqIh8gCuwfZz4UiYQpFjiHJqdGUCXFoJevLuy1KEPIQVHXrK3O1bfp8UeC3y92flrr2+KfcE+hUs6d3+az/Iv0Mz8IygRcEiBNnF1oCX2a0wbJ2XKOw35UfpijOY0e60ebWYg7P0PbT/0o2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB4947.namprd11.prod.outlook.com (2603:10b6:303:99::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 18:09:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 18:09:29 +0000
Date: Wed, 22 Nov 2023 10:09:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231122180927.GE5757@mdroper-desk1.amr.corp.intel.com>
References: <20231120104645.3570901-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231120104645.3570901-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8bd7cf-b449-44cc-9a70-08dbeb862b70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iXvjoSy4ADM56WHbs2aB4iXzAiFX8D8JFjcbSUMIcRdp14EQbIlogpOrcxL4hRcCI7FnxMl8e+Rvw56ZNHJPTdlGHKBKFPzjg5LXp78MPC3fSWAgKQywYHVwrG1wr1GKbPsmdE6gyf/z9MyMwS8nKdvnHZ3qWEsEKf3OJlDNbSAx5J01z3DH4duodwsgP3rSlYxNKccorlVdQqQusAEs6taVwZXWlQ1mG9ghaeIGBHpjfP3S4yaJbH/Tpbo2wXoxg8BTLDS8sIF99v7HlEFDKjy4Q6BOHOKycCZ+HnB5US7Sc8CRnReAEvoJ0tG2vWEndPRdFE75V5G0j24P/NX/N6alpVrBePYkRGa/paSi/sd3I+hVsRLJY12LCdozcyYZeXDGZ2sbK9AScqy80zr+kx7dBQ9flQUS5r4KmAdbvpKXjRLvOr+oPavP32Pc6rIY8sTloFjPwiI47+n7IZgWRp14phPy/wHVoBUpTVHL11hqyuuZMx3xEChviX/jrVS0FpaP/9hcMyXFrMfNZ8iqOmq4uTOVuJXLt+b1PMTMhbljSXuPqCrZQkKv3oF4P8Gm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(346002)(366004)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(66556008)(1076003)(5660300002)(26005)(82960400001)(6506007)(86362001)(66946007)(8936002)(8676002)(6862004)(4326008)(6636002)(66476007)(6512007)(478600001)(33656002)(6486002)(316002)(41300700001)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2++CdzFMxzLzKezDmuaYe6YMxVeGmPEsavPxAjfdsa61DiwkJ1zbArnTfsy1?=
 =?us-ascii?Q?owCKAju1xI1BPmKi81NeyAq2ifZh4B1mz6zTNTITP6NvHM6ZN97BxtZqfFsj?=
 =?us-ascii?Q?nvdGsk/QymtSrQHCNc7pAEuvAIp3IfnSJDGRreUp8gaALhqB8LQMcBeLiX2G?=
 =?us-ascii?Q?S0r3AZZnA04jVGbzrWB8VnX0gIIWkY5ONPOc8lZHzsGw+OBUFopnjFXcisQ6?=
 =?us-ascii?Q?nx2P//cowVQNJsEbSyh4gFHQiXfxL7+NuAugjt4At8cHoMaHln0eMv+3NsXJ?=
 =?us-ascii?Q?/5NO182V15jPJJBvVLAYy5FKH5xDkRfv7L4mXoWNuscNVRQoJRJw0429D+3V?=
 =?us-ascii?Q?wN7pgUTDm8grVznCTq0T17ZPbHbKpK3mjkAXk1ljAUACjMhjLp07d7vHwkI9?=
 =?us-ascii?Q?IeEP85MXfcJiQGQlRUyaUWz8J1MQERfOwGumFC5fr8Npb+3YUaqzNWwW7A6/?=
 =?us-ascii?Q?8BnWsxp6+0ccjHcm5J/2FtGbDiifw9xAXJNJTzMTB/OW7WUt4sAo+d4g0yVX?=
 =?us-ascii?Q?97fClAF1tCnUcd5YV9PPdIpusFbUo1Bube64FfNrivHv8uYiQO5LzH2IF2W3?=
 =?us-ascii?Q?vIx3E0VVIuWTUmnSMqRGSFcsVuFlsQXyqnbcKaDWTzUJX+WmUQQOU2MLU38z?=
 =?us-ascii?Q?arFj7HnmlfhSrInczFXjuz7UOD+g6ykrz15gf8V0u9pwUMPOKi53m5F01+ke?=
 =?us-ascii?Q?e3BtZOMOs8Dvs7zkdHbu17Qhs56nju7iGbE4GJipbP9KOrGx8+WNGEcxrzfI?=
 =?us-ascii?Q?PytNloFrVz7F16625F3OqhVT+dlBcjobs6FuURhh23SZjnBa3YheOOqradIg?=
 =?us-ascii?Q?FRhO4XWdUt821QZDHLIWA/ZQzcumv6S/N2aZPHsxN3qC+ooYlaxejpU7cEW7?=
 =?us-ascii?Q?zCnVEEH0tOOt099C/RRTITdbpzW7pwO1zmNs4lgCwrhOWrV5T6wnwNzgghN+?=
 =?us-ascii?Q?mSKkg6SKqyzSkhn5FHsy0ZXd+d2kIrz9pBdxNld93Dc2eYCg6hG5YuMT4agL?=
 =?us-ascii?Q?RAsJOxJUVig4qPDn0FPdYRViavnSWVtIDm9CdkH6JtVGDKj4xjtJuMs0Y43k?=
 =?us-ascii?Q?Fxidg2ywJk5ZeM7FAq6FVdjF1t8bq9jF36Dy0akRlhNOsI3azRnp6PaQIisB?=
 =?us-ascii?Q?GE0TpodqXoaCuhfjOuw2XXn0qPnk2Z9BLZd3L8u5RX7D5K5X7GplQCfcY1ME?=
 =?us-ascii?Q?Bi8/HY+xjh8XaEylr1NCSZsCFJMTsT+iU0Ji3YocLz1d3rPl8m+5uar8N5kC?=
 =?us-ascii?Q?FQbP6d26sb94UtW1OJhdT4IIshDyBpYB56JAYrhQVKsLEzSXkrayn/VTV4Gn?=
 =?us-ascii?Q?GiypK51Cyju60lKb0Bf/BK9Y1D3rGGyRHItbAjZERohZdycJYE/4BSv/9E2P?=
 =?us-ascii?Q?f/SnXRsIbmfRbFTTcSxtQ2LnGgfMm5tkBM5I1csZ+JnIBjPPhFxkS0XnrSj3?=
 =?us-ascii?Q?PPgD1YIZncnmC6r6/xHW22S32XarlnQ/F480B1QGtqoOWRDG/Ga+W/DiB6bv?=
 =?us-ascii?Q?iKIiEshRwT8I6GLJNlXUhds4K5rY3DwAMlm3EpkZq3CCHinYaIlvbngXxAK9?=
 =?us-ascii?Q?ofmlEPrGl+qN9FrOwQkQsre00FW616zfPiW5e49scLGhe2MLrMOqnfd4lwx1?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8bd7cf-b449-44cc-9a70-08dbeb862b70
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 18:09:29.1779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzqoYiLgP9cYB+pYB0Jy0nKU5mQuEVPaa+oxvOkaUDaPPViPtIS5qmRkn9+FZPwhZIFDt6Q+taN+P9HdmvWNpWPNV2CXKcX7Ua30e/SrOjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4947
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 16020292621
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

On Mon, Nov 20, 2023 at 04:16:45PM +0530, Tejas Upadhyay wrote:
> Workaround applies to Graphics 20.00 as part of ring
> submission

The Xe2_LPG graphics IP used by LNL is version 20.04, not 20.00.  And
according to the WA database, there should be a stepping check as well
since this only applies to A-step hardware.

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c   | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 59e0aa2d6a4c..42eff69dff9e 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -184,6 +184,22 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  	return i;
>  }
>  
> +static int emit_stalling_pipe_control(struct xe_sched_job *job, u32 *dw, int i)
> +{
> +	struct xe_gt *gt = job->q->gt;
> +
> +	if (XE_WA(gt, 16020292621)) {
> +		dw[i++] = GFX_OP_PIPE_CONTROL(6);
> +		dw[i++] = PIPE_CONTROL_CS_STALL;

The workaround asks for a post sync LRI to NOPID which seems to be
missing from the PIPE_CONTROL generated here.

> +		dw[i++] = 0;
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
> @@ -294,6 +310,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  
>  	i = emit_user_interrupt(dw, i);
>  
> +	i = emit_stalling_pipe_control(job, dw, i);

Why are we doing this for video?  I don't see anything asking us to on
this platform.

> +
>  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>  
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> @@ -342,6 +360,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  
>  	i = emit_user_interrupt(dw, i);
>  
> +	i = emit_stalling_pipe_control(job, dw, i);

If we're not checking the engine type here, we should do so inside the
function so that we don't do this on CCS engines.

> +
>  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>  
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> @@ -374,6 +394,8 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  
>  	i = emit_user_interrupt(dw, i);
>  
> +	i = emit_stalling_pipe_control(job, dw, i);

Same here; I don't see anything asking us to do this for BCS engines.


Matt

> +
>  	xe_gt_assert(job->q->gt, i <= MAX_JOB_SIZE_DW);
>  
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 752842d734be..0b9d29f8897c 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -20,3 +20,4 @@
>  16017236439	PLATFORM(PVC)
>  22010954014	PLATFORM(DG2)
>  14019821291	MEDIA_VERSION_RANGE(1300, 2000)
> +16020292621	GRAPHICS_VERSION(2000)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
