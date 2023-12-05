Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CFDC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 22:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C897510E60C;
	Tue,  5 Dec 2023 22:12:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8716D10E60C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 22:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701814334; x=1733350334;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9M2cmyPoajUTCbzvsiKHtxVjvJew07d8jAkO3X+JrH0=;
 b=nNxFmmOr+mlCtg9O9PeyecQbviRFVHC21L2OqjS7EKvYfmMu6JkyEsXp
 wIj/hb3XV5WR2W/VTA/rQ3lk2yfDCNF3Mug212j8+WezSk81PZTVDocyI
 hNn+o2NloGt6ZSV22BYw0Alq+FBVUQZ2XLitNjz6SMPswa/zGdyC+anSA
 L/gOIQK6y+YzuAy/yHcsbBd553XUuNuLofW8/ww8Ei9WAj1VacZC4Ijp4
 mflHvz9OsIUWP62/i2tENi+XWX+ZYvpqomoEvQ5weB4gIglyGqyc8KA+c
 nSL4yi1SzIQwd7eFYXsl3tmkL7aKzZjVppQ/hqc63oP69Lv+OoXs7F6l+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="7264363"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="7264363"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 14:12:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="837095199"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="837095199"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 14:12:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 14:12:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 14:12:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 14:12:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCg4N+y65tl19FdWXTKgAXPaIMTquECTMEZYgiz/QTOgu2j/f97qY+edp/wOi2eYMuFolS2F4cKPpFu6xaQaH6Sdys0fRXEkRnVbNAK29YCkOd4WuW0rBv6lGj/HP2siqUjoeVbv7pAJlW/lNZzkLLmPE3ISDA9qGW4DV2AKcIb/Ve2XDFVmUUNhFdSsmw+U/Xw5jZKPMtX77o/6aQ/gSxHe9ewAU4Uvy+FXuW/nPCTmo0z0DDrLmwH8Jhhz7HtDyhbCD2r4lOA/RZSYvYG6ooXGYc1lmBbFd6Lhot8OSW9ehDxUHNG8IBzHegEcVYqaZH+MDTILhenxsfqw9MyghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfNKHfSlK8z6p7WP0i3V9iOL3W0UuQrka+CJA/v36pw=;
 b=ltx28C7xOuZ8PuVRVJJVR/m9hQuvOyMXjem+cPeTtZISasBS2fAROuoqvQhE05rWOP52EsG4gl6q2xrUbImcGc4/5Y84qVHEeuWZQb1JOvDh5FN8HyVrmICMW42yAXMFQbvJqcNbCBVcXNhzuIv70N1EvtHR+jV54nitFcvdXoNPXRKo60hqP5LulpJyh9uIAtDrSYJPbjc2hFdCZrdfgDNNunV2AoCH3KNn2tSfEsdBJ2DbvscM90x4nsGalx5JCQp5+FdUvD9tvUtN9nX06b8u5VPW6gfeTzUCf/BRH/UG+AMSR5oQk7tV0pgBll4+j5LrOVRvG9JDEfh1mnccSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH0PR11MB5689.namprd11.prod.outlook.com (2603:10b6:610:ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 22:12:11 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 22:12:11 +0000
Date: Tue, 5 Dec 2023 14:12:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231205221208.GN1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231205131716.847721-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231205131716.847721-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH0PR11MB5689:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cb2e348-9a54-434f-dc8d-08dbf5df3a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OOrG79LKpk/ivoRwqz5nR1pDefKg8HzHJHvZJf5Vca1BR3qMrELGGyd9gPEADhXDLltY2u2NfK4lZxl2tnGIR6IV+nr32o7/90vf6qWXbLNSHWHBPr5ZUSdmbD2NzgGicfgKHkEpMoVxkfd68JVvcWRU+PQU0QPwpxcoaVqlnnOKLvzIp9kzcNw9ag+xx3NXjIhJzaf/MFeM/IkmlU2/C7GooB65ICGvZarYE39Zv/Z5EVEqZ+3iSrGGfhwyNOF5+H0X+75PtmEsJvEe1udy30VJQVlz7ZgnosTFhQAe3fKXcVs27oOD0Cn1pK52sCcm2AO1TEmSmcErQSAAWFZZEsIuw0f29kYQpAOh/VCA9E8J4GhXOcCamUWVdnC3veo9hLHoFauzVPa4qECgnrwFG0P+UR5+vq766xDGMpM0hLIu0WtrCh/lWZV0hmGDXV+shyxtmetMDOkln4dAYhN8HFdZSyqY8HfvuYw1d47EPONwKX/Nz2xB5Ehl7XTwyuLPXOJkTgelNTtbvLUBDp0XLXl5YmodSmw3VrIVx8+HXjgRobtt+grZL03AXZ+sR0pp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(136003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(5660300002)(82960400001)(2906002)(33656002)(86362001)(41300700001)(6506007)(478600001)(6486002)(6512007)(38100700002)(6666004)(83380400001)(26005)(1076003)(6862004)(8676002)(4326008)(8936002)(6636002)(66476007)(66556008)(66946007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wXduPanqcy6l4TwNveE7l5A4ofZ/D4kW2yQFEWLHKAOzha9pM76ZcJfls7Bw?=
 =?us-ascii?Q?ukUxOQorKxCXMqZaGHjEBaduNnHCfYi1T1GexY90OQGpV2q7FbskSOs+/Z3F?=
 =?us-ascii?Q?WpV/lERMDR3bUb3+nZ+pzyFoJxtmYm6ZUUAP2EGBzlbQ+GFJgpmSyYkyuvcH?=
 =?us-ascii?Q?XSe5KjP1w7fgVbQ0EARy21uz+Z0ZMRxsESsL52pQsnbLFMewhcNMfu21PhK3?=
 =?us-ascii?Q?4zERz5YobvRiQzVLtHZl/bIWFhX5HsjlaC8PGU/vj9UORt1Boli+yFQXYhhU?=
 =?us-ascii?Q?9Sy0FzCgn0MOtijAu6K6YyMToCAnpBxfTGUwG2/mtXXSQl8NxBv9cBfnFh5e?=
 =?us-ascii?Q?Kp2ZBQsMpnjnkqQ3dw9J6+oxYaQoQTsAGULBA8DQDCHZekLs+t0J+T7RfXrn?=
 =?us-ascii?Q?WW/mx83bqXPH7YRonPO8Z5RREMT061iDkbH5uN2FcJ1hF981Pe9uJlYvHgzJ?=
 =?us-ascii?Q?u6E6zTrC+48mhHCyAOjxG1iTrFOM/f9i1acX8CALHhoyCXZuvMWoYojU/Kii?=
 =?us-ascii?Q?NHokP0igdlDDpyGA/OVBW8DXKOo+QVvML3Rtr+fzAl+KE+ZFPEUiPE9sa3wQ?=
 =?us-ascii?Q?8LpGdiDKTiHYL+6sQF15v3py9O/B2u0R5+Q7HQzQjDZcbMlJrfzjT7CFZAsL?=
 =?us-ascii?Q?5p4bTBpHObuB55vG3So228j0f+B/gzO/3FANrxTW4VHdBZcYlnRtycGMY3Nd?=
 =?us-ascii?Q?SCUSmhpwvkQa9VHXiFCp2HoNv+oLGSfO2UG0SNlBVj72b+KPIkBjqAl60paG?=
 =?us-ascii?Q?0Mi0X4JxdvtpKEfUwt7xc66U3kb4QMSGxNsH9+NsMDYZOQdleUR019NMat2c?=
 =?us-ascii?Q?dnrpghDZFNHs/42zutPMiFwwYth6UDHoOeEC1O2AF588xg3ZdzntpRmwxJe7?=
 =?us-ascii?Q?9pj+BLKf48WrtniR7jujuN4aPUUaFrlIJx0kDGYOyfbFPWN2oAchcKQRH5lC?=
 =?us-ascii?Q?2ItGvB0n1rV6o9x7ItvQXXzWMviriq+izxGnrF2vL8lX///YxOsF5KZeGcgL?=
 =?us-ascii?Q?0diWc2bFpG1GgG02V8hREc2cgFOFZ8U+8bnfLYu4h/3meIN2g764JD4zLqgo?=
 =?us-ascii?Q?lSWo/Yi+bRsEMVNhcBxmFFY3IgASviOZyuVMQlfxK9lGapaLXKsSLhEthIda?=
 =?us-ascii?Q?MYrHHCbgyhBL41+MTlvUBx+VunVno8vhG2dWn+L/FGp3XeayN1gHcDA8mNYn?=
 =?us-ascii?Q?Ru8YCtEgkFvOZa5eFtj+ljFhQiJA9GMZ/ihB+pvV745hkJ80lXajc5Yf41OG?=
 =?us-ascii?Q?UNuNM3pQzNbLBA2V0uQevBz8mKvsAkWHFKzmEqTxHURwMGf47cXwb2ShtTOy?=
 =?us-ascii?Q?m5KIq7YltAao1qylFz6u6C6ZpRoxDXvaVgfW/lsvzpax5Oun3XmHahb0vHlm?=
 =?us-ascii?Q?+tAHYyc98+ULmo4SpNEQ/054DYHBe1qOXD6il4Zu5VoS7M/fUR+C6UvI7Tzk?=
 =?us-ascii?Q?f/z70L9p7a1uzgASV4aRKpTr0CoqGH2GkdOKwmYMb0ao3BNqryWgnssDMNtm?=
 =?us-ascii?Q?nxgWCSVE/DEwPMOjra6AC7VAbSWgL3rScjKlFCPZIjQJ9IUnkKEDuK2cb9PW?=
 =?us-ascii?Q?TcmG40yOux/HGoU7ZejCZOBIzM8KVo+gyWd+d970o474A/HQC75f1l76zFDz?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb2e348-9a54-434f-dc8d-08dbf5df3a61
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 22:12:11.0238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0XVJm+l7wtsFAwRR669EFIT45JiURkM8mtKwKiyl34YoKhFbHkhR+VsM/smi6bz9Av975FkgtLXCOY8I7ry8HPjO7BhTXvgp+/HMbFzdvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5689
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe2: Add workaround 16021639441
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

On Tue, Dec 05, 2023 at 06:47:16PM +0530, Tejas Upadhyay wrote:
> This workaround applies to graphics 20.04 and on
> non render engine.
> 
> Workaround has three parts :
> 1. Pipe flush before MI_ATOMIC - This part isn't relevant to Xe
>    (at least not right now) since we don't use MI_ATOMIC anywhere
>    in the kernel mode driver.
> 2. Memory-based interrupt masking - Memory-based interrupt processing
>    isn't supported on physical functions, only virtual functions,
>    according to bspec 60352. So this is probably only relevant once
>    SRIOV support lands in the driver.
> 3. Disabling CSB/timestamp updates to the ghwsp and pphwsp - Workaround
>    is added by this change.

This workaround is basically the inverse of Wa_18032095049; that one
applies to RCS and this one applies to the other engines.  The
difference is that the RCS engine workaround is a temporary workaround
needed only for a-step, while this one applies to all steppings.

The CSB reports to gHWSP and ppHWSP have been discussed as part of a
different topic on some internal threads and we've confirmed that
neither the KMD nor the GuC firmware use those for anything, so
disabling them is always "safe" and should have no functional or
performance impact on system operation.  I expect the same is true for
the timestamp updates in the ppHWSP as well.  Given that, it might make
sense to just combine these two workarounds into a single record (and
single patch) and apply it on all steppings.  Disabling the reports for
RCS on higher steppings doesn't have any kind of negative impact and
will simplify the overall situation.  E.g.,

    /*
     * These two workarounds are the same, just applying to different
     * engines.  Although Wa_18032095049 (for the RCS) isn't required on
     * all steppings, disabling these reports has no impact for our
     * driver or the GuC, so we go ahead and treat it the same as
     * Wa_16021639441 which does apply to all steppings.
     */
    { XE_RTP_NAME("18032095049 / 16021639441"),
      XE_RTP_RULES(GRAPHICS_VERSION(2004)),
      XE_RTP_ACTIONS(SET(CSFE_CHICKEN1_REG(0),
                         GHWSP_CSB_REPORT_DIS |
                         PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
                         XE_RTP_ACTION_FLAG(ENGINE_BASE))),
    },

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++++
>  drivers/gpu/drm/xe/xe_rtp.c              |  6 ++++++
>  drivers/gpu/drm/xe/xe_rtp.h              | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_wa.c               |  7 +++++++
>  4 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 444ff9b83bb1..0875b2cc0f01 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -47,6 +47,10 @@
>  #define RING_ESR(base)				XE_REG((base) + 0xb8)
>  
>  #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
> +
> +#define CSFE_CHICKEN1_REG(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
> +#define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
> +#define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
>  /*
>   * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
>   * The lsb of each can be considered a separate enabling bit for encryption.
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index fb44cc7521d8..e84e08a66af3 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -309,6 +309,12 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>  		hwe->engine_id == __ffs(render_compute_mask);
>  }
>  
> +bool xe_rtp_match_non_render(const struct xe_gt *gt,
> +			     const struct xe_hw_engine *hwe)
> +{
> +	return hwe->class == XE_ENGINE_CLASS_RENDER ? false : true;
> +}
> +
>  bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>  					 const struct xe_hw_engine *hwe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index c56fedd126e6..a30f89d80046 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -427,4 +427,14 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>  bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>  					 const struct xe_hw_engine *hwe);
>  
> +/*
> + * xe_rtp_match_non_render - Match when non render engine in GT
> + *
> + * @gt: GT structure
> + * @hwe: Engine instance
> + *
> + * Returns: true if engine is not render, false otherwise.
> + */
> +bool xe_rtp_match_non_render(const struct xe_gt *gt,
> +			     const struct xe_hw_engine *hwe);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 63bd4bb1af03..45a910fe0141 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -596,6 +596,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
>  	},
> +	{ XE_RTP_NAME("16021639441"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> +		       FUNC(xe_rtp_match_non_render)),
> +	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1_REG(0),
> +			     GHWSP_CSB_REPORT_DIS |
> +			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS))

The RTP engine base flag is needed here (also pointed out on the other
workaround's patch).


Matt

> +	},
>  
>  	{}
>  };
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
