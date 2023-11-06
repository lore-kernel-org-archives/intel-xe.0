Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39881C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 21:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0809210E443;
	Mon,  6 Nov 2023 21:41:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385D110E43F
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 21:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699306906; x=1730842906;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JOtFRx1Gopa6wRJNnNKKnHGF35nRZX4UPnfyVD+Af0k=;
 b=BjqduWp6yB58WKDPxURXSDCXcI8ToshIcKy0mNxd5a0HI6HlZV4U989R
 +BvUrYOC5R59EPkdQQJsbOLE60rp4TNfG0IaAbILIMOJmkaFOy+wUVYwq
 sTopW6ivIkYvPtP+I2s3R/li33j2iLZ1MoLFV8gGVUpDbSHBDW67dLymz
 1x0ihf8ujae6r8YQsH1cFCSZ+TrT9IBoj3QmiT+YhHWl4WxNWdhI+cjte
 SsLFJIGGkWKHDlNTevvPcPfp+cbZ567Nu8QtCiqKNJIFWN2koeNgvNe1y
 U86xN226Eyiq8dhnrlvXcS+08S3VrXRPBy/hT3ZjeLShRbU1OCBJ2VUzz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368713983"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368713983"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 13:41:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="886040915"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="886040915"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2023 13:41:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 13:41:44 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 6 Nov 2023 13:41:44 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 6 Nov 2023 13:41:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SujHFtbWNOGiI/hNA+z8mEwER//akBa5xIi7KnvMo2X8yIUJJJhYCsVlriUNR40bGhRD2Xq2Mb7QrUk4JLhLArph5emqVOqAU/DONVYz7tI/iFSptvd2s7zFGLZ92XvynLTmEGJqdQnnxH2Q70yYP7FaibRri9JjorL+paNpctkmQ7muOmAmv6qjZ4PjzHTSBEZVPxkk4SbkxJ99NDejb6+NnEUVAHrFiPwcI9SnK9UezP42EvMB45LfDgNKbBMdJwziDnqVGeQBN78M6u4lIeulFZGWM8dgXNIN7dn/i+1kLmKPwx44+elpz5V3iyccPnncbX5UX6sE+BHzotct8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UksVGxpN+ESqYq6xvUJlwnHPVhcceeEh8UabbyZdNdI=;
 b=odbFFaJL14xOK5pWaMCn55oO4Uwcr0M4oF8Wdm8l40MydDEPVo3mo9xiZMyub3etEG5GMNNcZ3QA07MmyOO4GtcU4EUx1r5M7vICudwUmg9thj2FSDIg94omvrWLEcHUQsyXUlqmLT16azai5eyECEjq7TYInBpI+Rbre8/Jhw/RFjlVLz/bomjVEySbWEoAzkwW/GRdAoCcpAY85BLkNMEshlURXP8tY+gv96SPjNaCK6MgLxuyWL6t7564oGR+uM9qdG4YnAouSpEZmwlIg6cNIAPsrcAxeGe4ImUrUhv9Qx7IUOIFSo9iYN8L2H2OSmqzalIGIjnh0LtTokOojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB7349.namprd11.prod.outlook.com (2603:10b6:8:106::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.28; Mon, 6 Nov 2023 21:41:42 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 21:41:42 +0000
Date: Mon, 6 Nov 2023 13:41:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20231106214140.GW1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231106210655.175109-3-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231106210655.175109-3-gustavo.sousa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:a03:338::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: e296b888-f24e-4fa1-daa6-08dbdf112a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Wan2LYKYvjHcdf/TNzhol2Pj8xhAOK3rozN9vlaxb03T2ZKaP69FTJ+p1rdlBFeiSswDSREuwfD/6VhHdWCyHT/67a3ZBTX2rQ8le9Tuask2eNuvAVs3rCx0T+u2l8QSJI/JlvqeF98SleLKtyXkGOQ9xeJpeaTEtM7oF2dXjVg8BtHFYyas9yaZDGyGER+GYtHLWiExBXNHIJX+pTiHkl9QmAgkkrCiOgdl6eJ/Rg5P4EN5Gg8LWOeIKk/GQX2Ihs8AYIXIL5KDvSsqghvffesOF4OznW5opHy75SRROhvViTXwv0uZuCp9yx+l5IS821AIfM5YiPfFw/UUyPRVMJJpwC0K+Ia4dHwtdfIkCjN2Ukcb3Y5RnTJPGrmaO3N0hdVWiLDKOggaFfN6w4vFaG+LZi2tTyqAPrwAd261nDd0h67ta5EUFlBqVbUUOI2O8FxOUozo3f7cEl/gZSKxxfwwz06uMbyCkBzx57OV8gXhFaYs/00Y7TwXBxjTVYvrziYJtmynzVPQhxK5pKNC2xlceS3XQlc58GdBB1z44YPjyICK8yYFfvMkdP0PwY4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6512007)(82960400001)(26005)(66899024)(6506007)(316002)(6636002)(478600001)(66946007)(66556008)(66476007)(6862004)(4326008)(8936002)(8676002)(38100700002)(2906002)(41300700001)(33656002)(86362001)(5660300002)(1076003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jL4LNBjsuil4fdWj/g1f0SVEjFyKdIpZQu795YYyYJwacpLWlVWEO6cohHEo?=
 =?us-ascii?Q?SYWm/Y0o363egKTn9cylEY/LVz94gmIq2m2XfhLJ0Cqux1/HgLK/OmPfEQPF?=
 =?us-ascii?Q?VzzonaEqee8n3vVXuOPsQ1DVdQuvrd1Sa56NvXikCF7Fvl68HnfzDnseDgtZ?=
 =?us-ascii?Q?pShADFb3EC/Q7SSSyI5XzkwoDaqQCZpCYj2srcoCUxNaRD1ajGsBSrs5Se70?=
 =?us-ascii?Q?1QlHm0k5X2GjR8SnNzWiNCH1UIPbvdendTZdc+GT62MNDYxvw7Mo9Bbu5alv?=
 =?us-ascii?Q?k0XoWOpbns/T4G1ngc2T9pDSi5gHry9d2RJj+2xbfldR3EJhjdulpO+vZSUf?=
 =?us-ascii?Q?0+4ZHoez2kMkTu1d7uh13Aqu3BkPqbD/oPC0zs7jPTpHmdLzyfuw9A5VjCvp?=
 =?us-ascii?Q?ST4t7+UBYz+kOY8QP8E3kJDki7yHvurFndeurECECQ8NmFLPUrf/+cDMapra?=
 =?us-ascii?Q?edn6SkSjYPpby/ZfL5YVSz+4UaF8CNKe9BSKBhVrih//xU+YSsvgBNgai0WB?=
 =?us-ascii?Q?xC6k3KM6B6QhNah+hw1JamDED74S+lxZZh08ZnX1HRZn+cxediKxJ2eMKSAw?=
 =?us-ascii?Q?4sXxepVDIqgL3bgZE1W+eVM6pn5CeVQMWFlhPP7aIL8yvBp9+6/EGC7h3aJO?=
 =?us-ascii?Q?/dsH049WY0mrRRbViDNRHw/4xwKpd683Mxb8trfZI83C7D1PMWIJfjdmeIa8?=
 =?us-ascii?Q?U1Rzc96tuRTA/GQ7S/J/Pa75/GpyvdZ6FWVQ6MBESnqj46NJMRlm68f8kvtY?=
 =?us-ascii?Q?TGMexW8LhynnwAIcaenyKxi4YOrKCblNJGxbsMHwOZnz+hz+b3zbi4e3Kuoa?=
 =?us-ascii?Q?NitHASja9HHHcQGH7inW6HTzDVEMz8StosOSU1hfrFKF1ERrG30w7BY0DfDb?=
 =?us-ascii?Q?BOlCLyIpfL9tHutQuW66PJd0NatkuMOj2RkINQs1ONK6EU/jUrRQ55TAD/9x?=
 =?us-ascii?Q?bD0TmLIaGA7Gd6/ro0KkwOYMc/+8cJAYfZthNIJjgDiLksQkuWV8K30o37qn?=
 =?us-ascii?Q?a+4L4vSrOdFvuGRiZv1EqLrY5YcRcmRo5WyezHTbOn9TSva67D/0YQM/wAxA?=
 =?us-ascii?Q?voe5fyoHk6+7jQdar763vmxhak05c8NNBWkYTLWJtTd7AD8fynMm9CJxVRa3?=
 =?us-ascii?Q?/iWqiraMt05VgHV+9uvGSWwR/i9sV7p9l9uvWi2ZjrrlVZFi4ErMLItTy+L9?=
 =?us-ascii?Q?iHTYgRWcV33cwVKtV6eiidAhVEbG5gOnssuje7QqYCAn1GMyOIPbzdRfX+r+?=
 =?us-ascii?Q?RNAtIQ34Wpa8rxXiDm1wFjLAwneK5Jg6jD7MbGdfefV6oTCWc8RJdzhqqb5u?=
 =?us-ascii?Q?AlzOpdT52AyQwyDsA+C3GAuSWTvpyIpGut4BjdiFKR7zGQyIAP8TFmuW7Ost?=
 =?us-ascii?Q?V0vHsK9a79X0AgBK7h0DbiViUu7fPiiqYyZDmQfzDkiUUdSbPEYcQy5r2TBC?=
 =?us-ascii?Q?Jk4uDwTwKVyrIqiETr7elXsmEU9ZUy0EpVoO0RsYFvqyrzq7FHW26aPclu3b?=
 =?us-ascii?Q?1u5836rP0ICso1zy+iU+Pf+xGxaJ5wRO8AqvWpHIudf3Y52p8SKtNVm4BgiV?=
 =?us-ascii?Q?UzoAulECJxLgzWZkiu61BlYyI9+/MiKZy9vko+Ys93PnupB0mcbb8K8i1+k0?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e296b888-f24e-4fa1-daa6-08dbdf112a68
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 21:41:42.3330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVcX7vjVKG7USlH8I6onR0ckddZi9rFz+b7mp30bjQYyo8qTCZygIweba7S8kin67sco47A+FPHAtcp7TKpd14Y8LWXFwk0n3CDYtZqoYsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7349
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xelpmp: Add Wa_16021867713
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

On Mon, Nov 06, 2023 at 06:06:57PM -0300, Gustavo Sousa wrote:
> This workaround applies to all steppings of Xe_LPM+. Implement the KMD
> part.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Looks like this is trending to also be needed on LNL's Xe2_LPM as well,
although that isn't quite finalized yet.  We can come back and deal with
that if/when it becomes final.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c               | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 35dd4837dd75..b57dec17eb2d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -118,4 +118,7 @@
>  #define VDBOX_CGCTL3F18(base)			XE_REG((base) + 0x3f18)
>  #define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
>  
> +#define VDBOX_CGCTL3F1C(base)			XE_REG((base) + 0x3f1c)
> +#define   MFXPIPE_CLKGATE_DIS			REG_BIT(3)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 2f1782db267b..614e114a5342 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -248,6 +248,12 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  
>  	/* Xe_LPM+ */
>  
> +	{ XE_RTP_NAME("16021867713"),
> +	  XE_RTP_RULES(MEDIA_VERSION(1300),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
>  	{ XE_RTP_NAME("22016670082"),
>  	  XE_RTP_RULES(MEDIA_VERSION(1300)),
>  	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
