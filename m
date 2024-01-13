Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9285EC4707C
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jan 2024 04:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF8310E07D;
	Sat, 13 Jan 2024 04:38:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E0B10E07D
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jan 2024 04:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705120682; x=1736656682;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9dV7I6wAwVwTycOEEaps8gFtUxOzlIvJlActvbDGKB8=;
 b=Mfyicy12zRDYW1qNwTc63aUyqSDUzhyZRdTvnXt+Vd2tqAIc2y4AB2dh
 F5lSpKbbTGsbKhxS70cr2AGmxNYPqYhadxrwcS28joxXVsga58V65QeFR
 hJkeswJaoT+c3rAO72ODKJGFs1gO1NwLV//ZvAJU9PUsXEVqFK5ezUmS2
 MYFitd7YtCUPXPLa7esrA+R32hh6T+X7svyQIukhUt8zD2kdI3LQO8Olu
 VnxpL9UJ0MBZLpobIvJN1Io1OZpIAJFfGZbOGrkRJYjQqo3FiJlJriBVo
 eiKZdCmYgRWZcoEAfpHxhXGC5E4w0Gsl9eYUzAmyDc38NKAm40XKqMYhm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="430520613"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="430520613"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 20:38:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="926598075"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="926598075"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 20:38:01 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 20:38:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 20:38:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 20:38:00 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 20:38:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vf3eRDMSGVb0L7VCB+huYTAxTQyQVbBE2guceBvaZF+Fy9XKdpdY4IF2ff/p0kmZzQeVvQ2f7zg884d9kS4cB8hiHga9GKN/E+uCiaRGHiVtV2obN3m9MVPOMYsoUDshUOWYqtWiIIQbjIaEG0afyOWyjGwWEtKr1hWKxSv674/avxgz95T7Zct2wWfVXSYU+doTeERKxcN8/7GQc2f4XdDC6o25wQmcrvqT95X1esgXw0Lyg6kcN/jNfoOzlCdOiSCZllAgTcVYR9AENO57n+AJ6YthqHLANN+jPOgvsu16DgdLkcrwY4MxP/WeF9DrSAlSa+VyL4qyXq00IBhwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4gxtmGQspUUV7ch6bzURDA6Rhei8oo/4vGsqNsdQTQ=;
 b=ZaTDWIkSxpYAaNRM8vVEarfbKzuR9obgLh0iqmpLR39o9NylQhibnC90CZQz01oxf5ig9M+WDC9dMSq6nkrRZRDxi9yf84/xx1Mp7iRDy41j02Y8AA/HgrAYWSz007MC33CWC57+ctE8ezu6HN7o5wQpV0ofnno10sfSl78+oBz17tKGw9UGMBtLk6Gt3cJHWoKs9q+BUQ0e0Qcqwix0huvjWcFFlPQiwqPiPj9GefBF+niCb/kqDdwfRfnyub4jpZgNKTHLLzLn9F6h1TwqZHpTn2ZsHqJzyF2dHP9070g5dFKDArSqr44QtGw1Mj/u08PgcnwUOqI2T4bqf+ZXvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Sat, 13 Jan
 2024 04:37:58 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515%5]) with mapi id 15.20.7181.015; Sat, 13 Jan 2024
 04:37:58 +0000
Date: Fri, 12 Jan 2024 20:37:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 5/8] drm/xe/vf: Don't check if LMEM is initialized if VF
Message-ID: <20240113043755.GA5549@mdroper-desk1.amr.corp.intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
 <20240112152649.849-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240112152649.849-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0039.namprd02.prod.outlook.com
 (2603:10b6:a03:54::16) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DM8PR11MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 597ba428-4d20-47d4-ca62-08dc13f16ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Je4zcMlFjmx1pGGteq8Ax5Az3c24haYNn/nJxkWygz9okiZCbR5Y8+v/s9Pjnh3WY/2/6x23FG0sk+UfvIllOmJBHHzrkhVuNtXtGmN2ZT0hpnloW7Ht/k/BakpSeanSyJBLkLZRKHEoQd73eYfC2jpR+XcSrVQ5iYPigMxmReVZoYZcJIm1wIwL9uj+ejuzvpf5HbJHow1CKu3VB1y1ETcZGbXF2hUbh1S0K1Ss2f0P4Lc/80UQwD+SO2b4z0rI0eRNR3Y5CvQexfsNQdmdbrL2i2F2l2qspy1NZKYIzzvJJIPEBg81EKIiDnLdo4wLoBh9EAzCLiCjH4AxXIpJrN4/t1pfAWK+CTppMwz++yApzR2Thd+Onh7hjgvSAT9bjFXTuPVqXSUX/FMYGVnD3UGMCNCdPmFqVSvSHDfXMLbuZ/jFdIDo9ukWHFnzKke+COpgCGciSR5puscKtrb5Cw9QMH/mtZEsW6m+iX3SiimExqkM1qhgTUinWi+fhm0G5fDlegYNWcB2hTP1GDS3fvySUYExFtUo7B8OGYCDCTJTFQJzf+dv/0psTQ1QduML
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(396003)(136003)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(38100700002)(86362001)(6486002)(82960400001)(41300700001)(1076003)(83380400001)(26005)(107886003)(6506007)(6512007)(478600001)(6666004)(33656002)(8676002)(8936002)(6862004)(5660300002)(4326008)(66946007)(316002)(2906002)(66476007)(6636002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1vKL3N0mJqoJmnh65DHJyrNTxHKH0uSsZy/PePrp1B3uBJHbmQBwn/t1YsBI?=
 =?us-ascii?Q?2QVOlBNTLZSZt3f5x3ZirDKXPDHODuWl+5RVx8W7NA4RLNdwcyvmAp8/M41o?=
 =?us-ascii?Q?SHioyZ6J05iQAVorId9EB36ARta1jWxuj2pJnQaPXDrWUSOHeJ6o1/u788tv?=
 =?us-ascii?Q?EmJ7gbdGDBEoYExuswY7Ps9upWCjH8U4hwFdvTUAT8w8MQnM4vDjs8MoRa1G?=
 =?us-ascii?Q?POD1d8lQ7MhtW5LT6t4B1eN0TJKQq2q9bvtgYKf9vca7qgQROK7PjDPfFdtX?=
 =?us-ascii?Q?HvAhp2yyBV9VYh7gyqCI4mv8DUVDNkjYCzmPM8MClduZsEku5AsCA0BVYUTO?=
 =?us-ascii?Q?YXudG769ZR3v3+lqhhSXgpvLJRyLWW6xVGP6Yr9y4JiEwFcjhb1SmW46TtfG?=
 =?us-ascii?Q?df0RZMB340NsgdLgZeR/OR0YWyF2sD8QwT8ailILdvk20EE0RSyMmPQZKbIt?=
 =?us-ascii?Q?1fLpvU/Fv0XLQyBQjuV7QHUX3W90kEfMAo6++eyY8OMnk9Ag6cbpFlO/CeDk?=
 =?us-ascii?Q?zavTRA0++IkdbsDyQSD/3kRcVr8GWi0tMyXVZ9Gs8KwnDGJVO5UUpp23XXyD?=
 =?us-ascii?Q?QQZ3WlPqNZgz8BaSXw2BLdLH+k/ticfS4mHRybdR5lWdzauPD2XqHceaFelS?=
 =?us-ascii?Q?OxWZwlv0kY+eLmV9z1JcoFCQirevXyPHUKXbRawo4wQEB2lNUWpqF2aaL/SV?=
 =?us-ascii?Q?VwuPkVa6WpZtakYKh1mj2oFx2HgRtGo6+e3W9CyiTVJ3GqGvii6p74Y359gC?=
 =?us-ascii?Q?V9nWPQHPMtONI1lo4CuCVCnlYQdNf2xhaoZNojBMoAFFlWbY0TaZf9O5WQvg?=
 =?us-ascii?Q?2220Mj3O9C4s/wCqAZFPi8OKqxPxha432/jsDoSj5bfQcLYb6+o0Kcw+vgLF?=
 =?us-ascii?Q?zcSOjbcaq77qy6CosgYuljt7onnTd8W2cK9mvs9AVVV/OQhpEfVhy7er3qiL?=
 =?us-ascii?Q?dWhkN+eiNp3y0hRJQHqRvTcx/hFzJEUckiVJw2Xlxhz94Gf6NHjSLFWgjVzw?=
 =?us-ascii?Q?fWchnTGA57WhR6YTZ1Yn9c/qyi6zl+Q2YWOmW0RVmf+QRiLujHFD/xk61u91?=
 =?us-ascii?Q?lzh0DAaOJrRawZXI4fcS1UugPCYuY+904lRiMNBAvQKQVeB/Zi1l4NBg4oNi?=
 =?us-ascii?Q?DGUvGmNfQbuibEc0E5hZFSiISv4NzGAz8MtCGAHhV7GO+uPo0mtR0/0Kaaks?=
 =?us-ascii?Q?ErQ5vaf2UlukAxbttcGEeXdNtzCJeKgM1rcAz4+aqnDbBUT15TJ1j/3wKC5t?=
 =?us-ascii?Q?WCGYuWQ7+nhnMwGbaS15tBZioerjTP2Q0sP0PZEQk7I/6I/glcGtUmZvrGho?=
 =?us-ascii?Q?yaEVgjgZuIiuWbangWL7cc6aQBQwy04Q0OA25cnf00cI4vVT7nRQC8bHB0Vm?=
 =?us-ascii?Q?090YXHswlv4Dp5GwIX4oBtk56ndZPzaLCHu/BBDiUbpwRcBXuwnCE2r5QlTN?=
 =?us-ascii?Q?ea47TCIdBzYxGVgGLcT119k7OajR9UnKHkKg9PdnLU1i4MIqxHmWKbW3xYry?=
 =?us-ascii?Q?6Sdeq8ExL48WfAY3gnIEjKcg0e+NarTDLerhz1X+NUajahPTE9mxNuJ9ErH/?=
 =?us-ascii?Q?tuFhWiD3QpVj9HyP6lMfoy6YZgUGMaQgNCOdGcGMIHbpWSE6FTohfptOTquE?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 597ba428-4d20-47d4-ca62-08dc13f16ac4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2024 04:37:58.0344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJmuonkr5qA2MpncdeI5T28fiQ/aqjh5sBVREVgslc4jq00YBMFru6VePnodLZkIalZ5plF4JlE5I0pXpNfMmxpQrKmRi2MMHtNBk7pu9ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5624
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 04:26:46PM +0100, Michal Wajdeczko wrote:
> It is PF driver responsibility to verify that LMEM was correctly
> initialized, also VF drivers don't have access to GU_CNTL register.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index c8c5d74b6e90..d8ddd64c6e8f 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -20,6 +20,7 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
> +#include "xe_sriov.h"
>  #include "xe_tile.h"
>  
>  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> @@ -363,13 +364,19 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
>  {
>  	struct xe_gt *gt = xe_root_mmio_gt(xe);
>  
> +	if (!IS_DGFX(xe))
> +		return 0;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return 0;
> +
>  	/*
>  	 * The boot firmware initializes local memory and assesses its health.
>  	 * If memory training fails, the punit will have been instructed to
>  	 * keep the GT powered down; we won't be able to communicate with it
>  	 * and we should not continue with driver initialization.
>  	 */
> -	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
> +	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
>  		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
>  		return -ENODEV;
>  	}
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
