Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65615CD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 19:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B11810E275;
	Mon, 11 May 2026 19:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipw9WCN5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BFB10E275
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 19:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778528729; x=1810064729;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JtpHZxZWWKnTe5xaadiebACJiuxpKAr1o0Jgzzrc42U=;
 b=ipw9WCN50FxDfLJFg69oVogMiFT4gQmC07g0H9F5F2/8yVDaXjTrdrna
 zojWyLarlsndMudl6CyciFNCa0L6AaHW5bUAm3kIwgpgPd5qSQvF7bW1C
 trRELeWc4QycuDZqcVWpfWeMLJleE9EG7k9I0NcRPhLDelqqL9nVC6+YW
 uzAMDVVQHB2dajEBMXnGfunHw4nluD0rKOXPCiIOb5d1Pp6VhLa4sohPG
 vv87H1/27Z7mQY9FBDGCgwE4CoYzmWbgs8lBQh+AF/juNHaSodFBxHG9v
 K/wIro8e54wx9ijHqJkJVnAqvcb+IqRqCLpiR2B48XYDtFYJx4Ym2OTFG A==;
X-CSE-ConnectionGUID: pOccda7nQHOAZCZPycWMcw==
X-CSE-MsgGUID: vIhXlS4XQ+CJn4+b1b4aTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90013754"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90013754"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 12:45:29 -0700
X-CSE-ConnectionGUID: R+TU1aowQ5eeWCvecOpYdw==
X-CSE-MsgGUID: CV71VDYNT/6rhR9vvkxehQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="236712160"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 12:45:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 12:45:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 12:45:28 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 12:45:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5q4c6rblVNq9tjCNeJEfMOF+ZTkpW+Ahp7EUKIYDl/iICFD0vVYAOCOK7GtoOJlIPEopOmTWt5P4JIT4NguOTXIjg9ifNYAZWO895o0g7apedfh/rSokYPu8MH6oZDs98k6VQ1Iur1dv8C6uNeOE+SdWhSZIyzFb8bIh/P64DzrgjCnGaS7jlrTlNN65zeEY37PIHGIOhcvhsPfglScJMPxW5iMLFUgsupsrZrXm8dTltMnPFRhTFM+ywhynFnDjrStvQ1/6D/WQQ2wGvvFAkw8U6CgA8jCQofP3As+rRl4I5Y2j3UfjxtZoSyhQ73raPugF/zdi+/cBx4ziqr8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hfye1xHbqy+GFWfuBTi+i7bhCMVvPYmeqt1k0Me6F7E=;
 b=M4r9LaCDRIuSFzLDHoqmC+sCFFN+Sohcvwt59JIhIc7Vz+yXYl3hg6RL0crTvQsoXGBVPiKKNt4Q2Zp2udCbIR/Eu8mMadPWRFBMVW/r+z+bvdqnT34n44UAIgBWC3Qp+t5LBbPRTzvUbrh3KzSCRU72J356Q6huh5ly7sCWnWEuAagv0o66xG8PcG7ZEUMYTU2Fdl1RhTz4Lu1tDYZHAp0jQuxCrnZSLtNSB+8Jy5stk6iUJY0pighwEqSxHu85zJS0PiXcXp4Hbsa8uDRlXxL7WRYmVBNwlnDj6GMgb6xugb2sBn6/KlEySnvOs03qRVJpyqA0EmB1DEOceVT3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ1PR11MB6274.namprd11.prod.outlook.com (2603:10b6:a03:457::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 19:45:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 19:45:24 +0000
Date: Mon, 11 May 2026 12:45:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/3] drm/xe: Refactor emit_xy_fast_copy and
 emit_mem_copy functions
Message-ID: <20260511194521.GV2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260511123746.616662-5-balasubramani.vivekanandan@intel.com>
 <20260511123746.616662-8-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260511123746.616662-8-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ1PR11MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: a6fab451-f2c5-46bb-29d3-08deaf95d7e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799003|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sNvsSc/lElPiLc1r/M9vDhQ3VpDeR/a5jelW2DAU0JVOM2h4gpWcjeTdjvJK/LfpvGGc8ozocFAZdPTLiTyRSVfgxmMYOCVWvLU+Fk4aQJFSxz4jV7bwYTLoKTTnpH9TUQPYe1C7NvySUy9GSZeRDoP1u9jeuNY3YTQkKMVrHlt97gYpPC71F/kGD2zYKRh8X6h+Ifpe30GUal+6CHJ535Zh/4M97Acuk8tBnGdaHiufzyqIG2qcN1jtaYHjhLa4ioiIfHms725Bs8ylMKSNPzuvq8OIuMiOmgsP1TxGpmSLbEzkc7o9neT4ZfyjbqNbdnQGc4q8zgm/TF9imwhXMIJbFM1+70E5mlEHG9R7qG2fhpf8ZWlJw8VfTSGgjOGMcolpYcKsIOOpSLbglPnXEYEtdeR6yVDZfx6GOsNcMWZd0NOPzByum1cqSL3BRyii2R9QGb4Y7HbSGu5l/P2WQpmxlthdFbhvXFkRlz124LqWWdCIaUJMRlWkQ4rlMr/nP43N9ZsR2KMnCQtL95HIUDbI66xCC3kYH4TrsCLe9ZO1oGDLxgUYGrA/Dto1ax3ouyQLAFzcPkg3Qkq74MLUqJTsBEs0iVhT7GITWbIREzzQ/GpYK0HEPTkoH/9ZKs9YgMMY1Mob7MyRfStnTlFJX6NtOU9RKn6s77dKKdNj7sEnUyLEEJBsm4DWrKaBzFvU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(3023799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wvhnC/AG2UzTczDq5Q2BwxxLSoUeos9+MyiWaXAx6p/NqL6+XekCfqRRvOdO?=
 =?us-ascii?Q?Q0PNvwov9D8JbWbLop1adFhEvQKhFBFCmDRAAh/16RcXRsnvix4RDu9pg6dZ?=
 =?us-ascii?Q?e4S5c7/TLxua/UlvE6AfE185dtMwS/lZXiqbW4zmThzrO/FUfxdQKFS09wLh?=
 =?us-ascii?Q?wdQdgqr6gVN/tFc+yyi6Fbyb8NNmSNv/b5ca2GJ4+67/5oe2RHgmxBks8tFV?=
 =?us-ascii?Q?OaR6WIsphPkMpc5U9dA5YwgWGsaqfdk6NKqAZGCC5Vokzz0b8Bys20rRzuuh?=
 =?us-ascii?Q?knd/Mt2h+6k1T/x8ug3Sge6b8OkaKMp5KmUj7QrPVuSoyAxIArsB4p2yqDoV?=
 =?us-ascii?Q?qGNDjOUn4o3WWRFfvvT8YEAF6fAAVCYb2ZQjNMAuazUkOWXJzYCnV6ayO5tC?=
 =?us-ascii?Q?JHVEgrrYzb6udYNmpVgje0bmpFac2zXxOPhnagRL8ILsAVJoHck4G4ipgusF?=
 =?us-ascii?Q?crvtuHTUaVDpwkdmNsX6QJ6aIPYUHGdgnwO33k0CshGpl6z/9U9i2qT7AcXm?=
 =?us-ascii?Q?D42WVfU9Uy8IjdJv/evqtdt1o62W6gNSfN7i8WD3zaOhdgw5FX58etN6kqrm?=
 =?us-ascii?Q?6PVCcEYhfdCzKDR0mahaAriMGPLOrgWRjcNhbpfGYg83rImQi8NcvzwHzlyQ?=
 =?us-ascii?Q?Jxw5sQ923N0B2BlyXNd+HNO0tnXWDJjttumq/T1E2Ss4dy9vEZUP8FQN+o6/?=
 =?us-ascii?Q?fAZgTx+N+A07sTGFJTF7dRIrHNjjYSMYje0j0YsSofn2zmYlaszyUCOOeLk3?=
 =?us-ascii?Q?p/8d0o+0AJTbrcr1/Cuk6d8gMijwlhA+48/4LrntbmLMxtWmFPc9H0yKltEz?=
 =?us-ascii?Q?Kz7Ib3bFUfn9oPPhuhHC/6MXjM0fW+AC7qH+12/JpXFfnqWkl6MuBEVuqs3z?=
 =?us-ascii?Q?StF6IItwonbFcyv4TeWHrQMqDYSuiZaFDuT8lwqSUNVwM+vxZxTLiDKAOWle?=
 =?us-ascii?Q?siA8oju3/ehS+jB8vUZHxtXBM8ZETBsx/VpBMIB2exUkMDnTZjq4OqiFgCc8?=
 =?us-ascii?Q?7Mp/nlEn8+o7Dg3D+vIO6nOkwbKu5Eb9MFKzPC2kcGmpv2nuBuN3lW3KqGB9?=
 =?us-ascii?Q?l3KgPmO5G1vx+QO0oAHMji3oxpio7ny9CUDoc3bdrI42rjbhIL627rbRpPdU?=
 =?us-ascii?Q?46YxZEGpqVjv5dASdiPJkapyMszaroOJN5XOhViQQynFtFZ/LUgrrVIDd58X?=
 =?us-ascii?Q?Hu0UMzt2745VMWW/gIqNGLoCvS7JQH16A/XKiSPugfGWlRJXnm85EOv6aeg4?=
 =?us-ascii?Q?3OlrI/3khJDkHAG0rACEhan1zxYwe1n2fTdsVX8fJng/URVXDNsnYFKlt+uH?=
 =?us-ascii?Q?KlMs9Wr2AGtvcJWmAFPXJ4AjZaoHCfy3BoWO74bU8wcCtTeukOviBwLfLxH0?=
 =?us-ascii?Q?Z0ihHkTd1gMkqc+++tlJys4eEU0pty0j9gkaLe0JvBk3KcLhSC+RrSZq5JYf?=
 =?us-ascii?Q?XpTxoRWf4qdmnUuEAzNW1LWVvseRDHqe1ss93+086krTTc3Nr+V7uahQx6gV?=
 =?us-ascii?Q?wild1Fo15pn3Xr6r3P3ulHSXyLG8orfBZ9jZHtU0xqpF1+jrhJNKQhq5PZWp?=
 =?us-ascii?Q?mL7vCeiFTNLgAklMN0Tt91O1+s8I5KXmY1JXWfrDOMe9wijgMxwt+WAQlUcJ?=
 =?us-ascii?Q?zJizqWMjMFpWmJWQZSz297y0kaRzXeTSHCFyuyxbZW6W11To5bHxkOKSRFCn?=
 =?us-ascii?Q?zOxI+QU9Z5KJpQm6Lt04T2HdWV5Xu07EazwK7ai3YOLzkJwj9RuDKkufkWNe?=
 =?us-ascii?Q?+rD9LAAPTsJkmCGdrzm+yKuUrJUmrnw=3D?=
X-Exchange-RoutingPolicyChecked: IjC2wb/vqOp5nlP4PuaQ3d/ftgK8lcLUJkoePfYIR40b+ogE0kjoDU/LxGbwATjXwTwGpNtpyNcvFXQOHn2Ym/zYrqRo+6PFceXU+J2CZvZfwd6Q3FAqkyA/2dboDbFhMVi2Vc8Te+PWjxsCRoOSft+KcqMXj5Y5yBAQNWD3PFOy3fn9a9eKJ+PSgnQEOlFzlhNVcUIqywiNiQn2GDt57JXgH+g2UPSunD6YDR5INk4Pb07W2y/6IQdxh11T6srUvsmwGTstmYUfQtN1AjOUHfm5fjHM7SehHR5A4F4VXU6BUTvEeYre/gmfAjYodfE8rjFsDkTJMFzRMtBAzwWrkw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fab451-f2c5-46bb-29d3-08deaf95d7e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 19:45:24.2332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4JoiV2nCBaLHX3KouU6k+ivjxXUcxBX8YqFyXms7cIyjLngcFsRgJ1StLoeeSkQUhUVvYU27xCEfUrO6zcRr8epGnrR6IZKXwtMPC2acYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6274
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 11, 2026 at 06:07:50PM +0530, Balasubramani Vivekanandan wrote:
> To perform copy, based on whether the platform supports service copy
> engines, either MEM_COPY or XY_FAST_COPY_BLT instruction is used.
> Length of both the instructions is same today and so they use a common
> define EMIT_COPY_DW.
> This is not true for the future platforms. Implement separate functions
> which return the length of the instruction to help in preparing for it.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  .../gpu/drm/xe/instructions/xe_gpu_commands.h |  2 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c         |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c               | 32 +++++++++++++++----
>  3 files changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> index edd204b8dfe5..18d0fde8c98f 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> @@ -30,7 +30,7 @@
>  #define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
>  #define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK	GENMASK(23, 20)
>  
> -#define MEM_COPY_CMD (2 << 29 | 0x5a << 22 | 0x8)
> +#define MEM_COPY_CMD (2 << 29 | 0x5a << 22)
>  #define   MEM_COPY_PAGE_COPY_MODE REG_BIT(19)
>  #define   MEM_COPY_MATRIX_COPY REG_BIT(17)
>  #define   MEM_COPY_SRC_MOCS_INDEX_MASK	GENMASK(31, 28)
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 50a97705e0ac..3c1be809be82 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -421,7 +421,7 @@ static struct dma_fence *blt_copy(struct xe_tile *tile,
>  					      avail_pts, avail_pts);
>  
>  		/* Add copy commands size here */
> -		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
> +		batch_size += ((copy_only_ccs) ? 0 : emit_copy_cmd_len(xe)) +
>  			((xe_device_has_flat_ccs(xe) && copy_only_ccs) ? EMIT_COPY_CCS_DW : 0);
>  
>  		bb = xe_bb_new(gt, batch_size, xe->info.has_usm);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 4f9be41b2f64..9428dd5e7760 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -728,7 +728,22 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  	bb->len = cs - bb->cs;
>  }
>  
> -#define EMIT_COPY_DW 10
> +static u32 blt_fast_copy_cmd_len(struct xe_device *xe)
> +{
> +	return 10;
> +}
> +
> +static u32 blt_mem_copy_cmd_len(struct xe_device *xe)
> +{
> +	return 10;
> +}
> +
> +static u32 emit_copy_cmd_len(struct xe_device *xe)
> +{
> +	return (xe->info.has_mem_copy_instr) ? blt_mem_copy_cmd_len(xe) :
> +		  blt_fast_copy_cmd_len(xe);
> +}
> +
>  static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  			      u64 dst_ofs, unsigned int size,
>  			      unsigned int pitch)
> @@ -736,6 +751,7 @@ static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 mocs = 0;
>  	u32 tile_y = 0;
> +	u32 len;
>  
>  	xe_gt_assert(gt, !(pitch & 3));
>  	xe_gt_assert(gt, size / pitch <= S16_MAX);
> @@ -748,7 +764,8 @@ static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  	if (GRAPHICS_VERx100(xe) >= 1250)
>  		tile_y = XY_FAST_COPY_BLT_D1_SRC_TILE4 | XY_FAST_COPY_BLT_D1_DST_TILE4;
>  
> -	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
> +	len = blt_fast_copy_cmd_len(xe);
> +	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (len - 2);
>  	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y | mocs;
>  	bb->cs[bb->len++] = 0;
>  	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
> @@ -765,6 +782,7 @@ static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  			  u64 dst_ofs, unsigned int size, unsigned int pitch)
>  {
>  	u32 mode, copy_type, width;
> +	u32 len;
>  
>  	xe_gt_assert(gt, IS_ALIGNED(size, pitch));
>  	xe_gt_assert(gt, pitch <= U16_MAX);
> @@ -790,7 +808,9 @@ static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  
>  	xe_gt_assert(gt, width <= U16_MAX);
>  
> -	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type;
> +	len = blt_mem_copy_cmd_len(gt_to_xe(gt));
> +
> +	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type | (len - 2);
>  	bb->cs[bb->len++] = width - 1;
>  	bb->cs[bb->len++] = size / pitch - 1; /* ignored by hw for page-copy/linear above */
>  	bb->cs[bb->len++] = pitch - 1;
> @@ -967,7 +987,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>  		}
>  
>  		/* Add copy commands size here */
> -		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
> +		batch_size += ((copy_only_ccs) ? 0 : emit_copy_cmd_len(xe)) +
>  			((needs_ccs_emit ? EMIT_COPY_CCS_DW : 0));
>  
>  		bb = xe_bb_new(gt, batch_size, usm);
> @@ -1406,7 +1426,7 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
>  
>  		batch_size += pte_update_size(m, 0, sysmem, &sysmem_it, &vram_L0, &sysmem_L0_ofs,
>  					      &sysmem_L0_pt, 0, avail_pts, avail_pts);
> -		batch_size += EMIT_COPY_DW;
> +		batch_size += emit_copy_cmd_len(xe);
>  
>  		bb = xe_bb_new(gt, batch_size, usm);
>  		if (IS_ERR(bb)) {
> @@ -2216,7 +2236,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
>  
>  	batch_size += pte_update_cmd_size(npages << PAGE_SHIFT);
> -	batch_size += EMIT_COPY_DW;
> +	batch_size += emit_copy_cmd_len(xe);
>  
>  	bb = xe_bb_new(gt, batch_size, use_usm_batch);
>  	if (IS_ERR(bb)) {
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
