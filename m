Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DDBE728C4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 16:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32BF10E147;
	Fri, 29 Sep 2023 16:13:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E9310E13E
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 16:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696004038; x=1727540038;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JxOoTGsiiNeh4tQqSWpvnrg3SdF4HBtmdAHKAFD2zbY=;
 b=MbqniCFsGuWt6g/cnW5ISNQpcZpX2msZzqgoivQejPcc73BTF1N+c+Gr
 lD5NX+aO3wzMU04ZD8tjvSE0KcprQBm/mfcy5vrs70RafDJmcMUH7sZqd
 4t5mHGg3cckbXYtMMv63CiY4W4OBbyNRkovHipNtz6eb2z/SBuGtgz53I
 EFkqyj9k+Pznw3qra5BU7uDyFtbBHCkbGoqgZ+wHLBzm9wgKoRGo1q+jA
 3Ra5GyknhYJ5IxjlmilWDfMdkHctRqXQulZyn3iXGSBjEZgwYtg6q8cWD
 IsJ/KNi6741MhEXWLMXbBdtB8mJNFlMMpdLYzByHPGq2YroFQW38rNMRN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="448823081"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="448823081"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 09:10:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="894371"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 09:10:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 09:10:33 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 09:10:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 09:10:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 09:10:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOFRJMHQbAS+/LsbhBGOw9OTzDZ5ioQHW1Ux5VY3Vff6M+ZFPxBNtLMjZd4WFlkudF9zUpi56xmeU67BjtsG19/tMm4gX2m3XUa/udVAC4j8n7Owb4oiSQU26xZcj+Vf8QBZQjn9ABmMaMASxpfkKUtP4ILZcT2GaTPU+CtghLhtVKpKc/3psmkdix4m3z8SKZX3TrmM5qcwHSuNLn0rivx0vf141VabUr4c/8yVtSg9DSPZ1Dyk2PF4SuqGSL65ip7yVLDRQBAIHuP/GqT9OTI9cm70c5oeiyOu9xFcsmm8ElMpXT1x38NohN7FiCiWaX5cGThWFEpa/RZje2aBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkRx11t4BNLk9288Tvev934FKpT8DIEsSwDitjvBmzw=;
 b=Bu0GQw9hYIeDH53mfyoXWYr1emB/IlNCgDqFQY1HzGoeOcobUoEdGvDm03Ty7/EQYBBGnlyixFIcvB2PHPyiyesY9Ee7i5MLaZ1vu2VvwxIdvuSHRnAjGcywKzfUHqOb9OXUCZkQPQ4tZGdBN8xw5UAnPxdxg0AtWSKOiBdDR68K9yqCQBa4e6a8oDQBS+VRYR1yt04zruVABFLYTLmoj3cehMg4q0oTaYzEQe2jaPIEpehcPjpsJdF5pCN4sVPUSEtzyfVoEZJlaNUPek384Yhp2/K0/lrr30N0EMeCkqThb4bMwCe7GfQ7Zj6iWPg5yyvZupBc3mju+qZvnNR7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB7152.namprd11.prod.outlook.com (2603:10b6:303:222::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 16:10:25 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 16:10:25 +0000
Date: Fri, 29 Sep 2023 09:10:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230929161022.GH233750@mdroper-desk1.amr.corp.intel.com>
References: <20230929044351.3145468-1-lucas.demarchi@intel.com>
 <20230929044351.3145468-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929044351.3145468-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe3e49d-39d8-41b7-c4dc-08dbc1069713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XsaytwbtVADwlnzPoNxI5TGXSLNUcfE/zsk0hy6STwSiotAkYN77sV9SAAkUYVh4KFgeCuLkPPy0A/J7qKr7si4Jhzt8KGUWM77mMWWb41WVpZmZRhuwhaHal6F93dYmaW+U4SXVCx06VXd1yA4+o//1G/+fyX60Yma0c+ofN1V+2rG+gD5COWysHudEo6yt4dWVgZA6MdvE1ZRK+4VmetfxpuE39MsFF89rWziGxqzSBEfqa79Jq07lZUSfT/h9xqvou62W0JsuBcjjVyIzyCFrCWMozK86tfUUpJPi14h/v+3QOlLMXia2Hg7qa2fFDMK0CgKLHBmOXTRfjH4WV8BDP04cM41yMPukMPsayR9gv7VbsFVLMxYS58QmYWmEFNFB5U4f0vE0U7r1RnqRebISLDiIAq3FhE/nskQs2GrE8wR2rveIYdpl989Dt0R+zZEE2yD5hIq7F1/DbtfJP9TRYZ8ymE3LiqdDM5+UYdxITV85uikkAvZlekrIbKeB0aEkYEMBXb1FoATE7aZa/tDmpzZh+XJikYfIWMb+iDAW8P+KgnkxuuWGwAGof6+G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(478600001)(33656002)(86362001)(2906002)(38100700002)(6486002)(107886003)(26005)(83380400001)(1076003)(82960400001)(6666004)(6506007)(6512007)(41300700001)(8936002)(8676002)(4326008)(316002)(5660300002)(6862004)(66946007)(6636002)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ynj+Qw5o3BQAfIMzpof/gu1quNqc2wdU8EijGKn3u7glq3GzAJHeyWoAdGqd?=
 =?us-ascii?Q?2LLJqPSpjTS/A1xubupe72pNhMSX8jRowXJHciAgIKGm30JYl0sYdd7GkRdr?=
 =?us-ascii?Q?mdBkBd8K4pPVG44G3mBsYga+2IeCWkLqAq3fKfrBeyhcgfhACy/7brbGyT7f?=
 =?us-ascii?Q?DppcMWoUMnyG76hcmUF285lcLnHbTpIJAqlJdoNMyKzmCdstmwW6zujOEg1P?=
 =?us-ascii?Q?xGDLc+zM7rbKY36QQiDxOYb3RW2/ntpqsBS8URCrqVIMztMLj3GWeMYetfdx?=
 =?us-ascii?Q?Lrzbc4hXjFOpwITP/0nlM8gpzfVQNBLivmz5M2tOiI94pwjXnMpj2jzlQkZD?=
 =?us-ascii?Q?QGRXQG+xO9lxYuBtwid/JnWjS6TDzmcazzMddK5KIwEGzdVhU5Iyi3GcvMO2?=
 =?us-ascii?Q?vSxTo2uf24/ejmK19LuQAEnk1y+rawISDAARzdJrZD5AFL8NkFXX2OXLsboa?=
 =?us-ascii?Q?FL8A/Pz5/EWcYYrdoUYkNp5s/v2bVT9Fz158zrcZuxNJsnYgVFT4PACEx/Nb?=
 =?us-ascii?Q?gLEMULDlZ74qGh6X2OX7ybsXyem9QCfldWYZYANDYGXsULxlyzMam+ew3VFa?=
 =?us-ascii?Q?kPkPgL0F10mTBLDPl8i0pbdXON9hFIQAOB/1DFNCpbxJFMUq2Acmd5KgazH2?=
 =?us-ascii?Q?QZebgiWLbeGmAXM6F+7HxUECoHtJtoYHlvjRF2ePGsW6AKi9II08UhXcfhrP?=
 =?us-ascii?Q?rTvVGO1ojhFIu70U3nxuo5sq3lLKunJrsj2cgfOjkFBUBHehU9yYEfDmHnK1?=
 =?us-ascii?Q?fqmOIa41Wq0GmOgAMctYMx+nDLX/SIOPn+bOB2eDf8B2k0RZz0FLOx5cAEUe?=
 =?us-ascii?Q?8dB+zlsF2zWE58PkeWE5B4xJA06pwQu993JrAc+6m1Fkr2Q4p1pbhnvE9R32?=
 =?us-ascii?Q?6Vjt/24iAu/ohRqqoziR6FTNOGUYBbyV6CoMzEHslQuXc8r4walohuvIgVJ4?=
 =?us-ascii?Q?YqpGNyxpGoVMg9ULlqJbW9QlSFOjm2/lxgIqmxhDpLlqr6ecNMwdv2NUliMC?=
 =?us-ascii?Q?QoP0/odGZ2GJhzOpVRmUZp/TGGdCJ35ru8ro7aQio5YJQNixDmP5J+QqMepk?=
 =?us-ascii?Q?kQDBCV2lx+uI1BA8vjQ2rTKISQqWmDmHbOm7rkcvq6dMRLS0PjVEL6M0oQRg?=
 =?us-ascii?Q?C/uAVCgdDwTJD8hKfJ3EDo5hPD93Xgn3Wr3YOpkGk0Eqed6pe/BX6ym19MHs?=
 =?us-ascii?Q?xtyOYNgeIGZ+vrDRIYgNoPVNwmJAuJCcVQ/7EuFr/OtYy/H1gA4SwDaHI48f?=
 =?us-ascii?Q?5ReSgVwQUAjNA4kQKC+yEdfSCqSDvTi2JSwf6oXK3/kWeI7ZpEUOhwZP51qA?=
 =?us-ascii?Q?SA5DUn8yWQqHVk8O48ygWsXgQ5QzakIstdW+G02cPHMIpJeNY0WhSJDZV8Q2?=
 =?us-ascii?Q?V+/U/RwNe6C3oMAWA0YdJV/RTURwC15eYXgFNVg46Ec3cyPy2hefBCXRWgkp?=
 =?us-ascii?Q?N4XB9WyHsN3zSh4tpKQ3gYOFXbycA39GnZ8cQbt5o+GUzk6riJpyYwD+Xm67?=
 =?us-ascii?Q?V+cpdxMsWmfijwuFtV58oiA/kv1mztiwW4S5LD6hlbzVnjJv+8o7fg5KQzKM?=
 =?us-ascii?Q?Z5ppB6PPLOqGu0vwEQAvdy8tZ31hC+Y9MV7pnPGAHiADlEbKiG6WLvSnAEwH?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe3e49d-39d8-41b7-c4dc-08dbc1069713
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 16:10:25.2972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rOZgOGeGiJbIWOnjhPyeGhUaXd3+DQTsQVitPv1pHXf7CDqI9UfScSyfJZrFd7v/TnOGUKlQmq4sf6QDfGYOSmnYuvE2khv6CBsoQsFb00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7152
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/xe2: Set tile y bits in
 XY_FAST_COPY_BLT
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

On Thu, Sep 28, 2023 at 09:43:50PM -0700, Lucas De Marchi wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> 
> Set bits 30 and 31 of XY_FAST_COPY_BLT for xe2 platforms. Its setting
> Tile-Y for source and destination.

This explanation is actually the opposite of what we're doing.  Setting
these bits marks the Y-major tiling format as Tile4 instead of legacy
TileY (the setting of "0" for these bits to select legacy TileY isn't
supported anymore).

We're also missing the explanation that we're seemingly supposed to set
these bits even in cases when the actual surface is linear or x-tiled.

And this patch also highlights that we're still setting these bits
incorrectly on DG2, PVC, and MTL --- on those platforms it may not be
mandatory to set these bits even when the surface is linear or X-tile,
but when we're working with a Tile4 surface we definitely should be
setting them (bspec 47982).  The simplest fix is probably to just change
the version condition here to start from 12.50 instead of 20.


Matt

> 
> Bspec: 57567
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 2 ++
>  drivers/gpu/drm/xe/xe_migrate.c           | 9 ++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index 1fdf2e4f1c9f..cc7b56763f10 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -57,6 +57,8 @@
>  
>  #define XY_FAST_COPY_BLT_CMD		(2 << 29 | 0x42 << 22)
>  #define   XY_FAST_COPY_BLT_DEPTH_32	(3<<24)
> +#define   XY_FAST_COPY_BLT_D1_SRC_TILE4	REG_BIT(31)
> +#define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
>  
>  #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
>  #define   PVC_MEM_SET_CMD_LEN_DW	7
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 2e6ce2daf414..b682d34bc1e5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -543,12 +543,19 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
>  		      u64 src_ofs, u64 dst_ofs, unsigned int size,
>  		      unsigned int pitch)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +
>  	xe_gt_assert(gt, size / pitch <= S16_MAX);
>  	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
>  	xe_gt_assert(gt, pitch <= U16_MAX);
>  
>  	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
> -	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
> +	if (GRAPHICS_VER(xe) >= 20)
> +		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch |
> +				    XY_FAST_COPY_BLT_D1_SRC_TILE4 |
> +				    XY_FAST_COPY_BLT_D1_DST_TILE4;
> +	else
> +		bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
>  	bb->cs[bb->len++] = 0;
>  	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
>  	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
