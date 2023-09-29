Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B60E71D58
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 21:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D7910E144;
	Fri, 29 Sep 2023 21:41:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F36410E144
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 21:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696023658; x=1727559658;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d1Cb8V0nkghJ6zI+15+EwEm6aNs2KoPXyIt9U3ZoMSg=;
 b=Mc9eIBS4oX+x0U3yGLSFcDkQzp76QpQRIk6BMueC8gbeA1OAvzBltxjO
 fa9Nf20+qIFxDEkMwg6u6/RYhfjnmSXPNPUsqu6E3Ixq5FAaM/rsMMLYk
 SQrFzi3GRrUgkHvCsJa4sFoAfpueyfwWa29tP1dm41nIjDON/lk2VP2xF
 KDeu0uQrB64dXhgMaUSmXHrCr2cBjLB6OgkfzO6YJMwb67GoYkZc+0d6y
 0HhgQFmkWTGjWOy5m5EJpfhRiPwSK+GSLY/S7lYseastIjugUhnydQvL5
 T1JsWhdhDoeudwDSoCDiub7I3WSJ+oN68rtU3IoFoJOXxFrozqfKA6Oeh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="446545775"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="446545775"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 14:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="840418054"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="840418054"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 14:40:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 14:40:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 14:40:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 14:40:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwbEmtz2p1Vxs6Tw/uOK68bkwqabU9v2bmznQniik5ySUY6h1LaZ8ATObQ7+TtElBOyqAfKh7IVryPCecnjOZz6Dv6M3kAQjPaIUYoEOA1hv09g5Z3jTcop54DfpZJvnCWlq7HSJd7KtXaJyLZjteM3UKOPLGhwbe/k1GlOPh0ivVKhsbtuaGoI10AkbLiWHkvgq3zYupoy0gcao6XPf8PU39qm5DzMAk6DYYJ7n+5Gny7MhV/pH3Oq1rBgqFvtbp1/gPyW0vKK7G4ib2mZOTpzeOaRJc+Gwrrdgw11w2krrPvMabesQ+e5bQJqEToLPurQjwmA5U1cFZGhA5UkNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xn9wLzeBIZhbyGO7/gjvvfn6+NaBLaCPVKRVmw/I/dE=;
 b=YSRKhzUhCo3lNQUsTP4GSnlNPcx1yB3nFGa0mGG5t9s9CaHK6IUobAROCWT9gWgXZVIwio5x/z1mnRUx3hb4E60teid+lybTDO035ey1NBOYqgTf4gqmaifoSIqWvkvauJDWMdbpv6PbeILpt8IolXydHWPxxI3qEFkf44dwKr4VYn+kfxJ/lXaq6zewi1PDH3hsYzYnTZ7PPiCSV/C3nBaRwDmPmQn4ry26NLJEx6AgB2sHZWEoWOit+P+udJdl8ySbecVshwjOoiV9brj0awqYVX6M2e7V7GmAnDlbGGBXmYU8NkprUSKWWpYSIsqGg0dfDGCWqqbn7+5V0IC5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB8224.namprd11.prod.outlook.com (2603:10b6:208:44f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.39; Fri, 29 Sep
 2023 21:40:53 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 21:40:53 +0000
Date: Fri, 29 Sep 2023 14:40:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230929214049.GL2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230929213640.3189912-1-lucas.demarchi@intel.com>
 <20230929213640.3189912-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929213640.3189912-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a86c464-db2a-49aa-b7d5-08dbc134c10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ociHzAE/6vvO76uyrshFJLPqFb+4qzoJkSxVvFm9I/xUgEaF3+DmeH56RonATH8NA3okCqzQyGVxXoUpfDONG+KOVvNpm/TUPEnCtPu4EU7M2jc3UTw2CQAlIqDIAPlBl4B7nKt0jjvmn7DqX0Usy4f1IzJl29Ocs4gOErsGEbXjNeC7/5/FJb3HHNO3NditCkHt++rEnDkEOgZa1p3omcK9/L2dFll7w6sBRARh4qpTq6bNjyIQk417oPuhuaF4PvcWgIAr9DEqiGQyiHrXwZ7XhOt20S/mItbNOxMBUEgGsEh2FFlcTaYHa2vmiJVfgcO0N4Q3h8JutrGQDtkBgFlwulzfi2Kbh8nwTt3naPNWVbC5ziSJvQdiu0hk1mgxNdcXduFuA0/raE0H0ktoNRoy7IbwpX6KBk5yNaITkTam28aWzmKiBYoQ0HCOib9T9BwksihWmwImQtCn3nnU9gcZ0/hIeKDVCzApCA0RDOFv+66yHiUKfDQQwl27WZILCmiqQDH8FwOJpuv/xiHvelZCPVXTBiZiuloIVfHW3LXaZ2Jn3vZRVsqMC5/ssmXt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(66946007)(316002)(41300700001)(66476007)(66556008)(6512007)(4326008)(6862004)(8936002)(8676002)(478600001)(6636002)(5660300002)(6666004)(38100700002)(82960400001)(6486002)(6506007)(86362001)(2906002)(26005)(107886003)(33656002)(83380400001)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cXEEUPVkWH/a1IcOSe0o99h9x77eNccw6cQyL9sNhrUQ4U8WHFo0sGTfdeWn?=
 =?us-ascii?Q?FUjUzJSqBPwCmKO3yjWKGTyo7FHriR3Z/M5p13hRhF9JDVbnxBk/NvDTrkWw?=
 =?us-ascii?Q?MRA1OPg0+af+y+RbBP9fMDfbbX6mbaxQ22h0bXxl9SHIrFAynScibQ8RF5aH?=
 =?us-ascii?Q?r6S4GbxRAuKgI2TxhtwizUwyfy5LzHo554LyA+02TaT2EnFIot6sFXn05FKJ?=
 =?us-ascii?Q?4sygBIc0HNW7qor4L1t2vnJ7a2+W+GyL4vnpng1s130vDGMvBevEAsXzoPTS?=
 =?us-ascii?Q?qF94zJc9EuHUmxFMCS0rXKQS3Wmql3uf30CcLHKeIeOE8230Q4eAWLl4CMzg?=
 =?us-ascii?Q?8Hiyjd4mPcimLcFQEStg+W+fTzDMDtxq/yPzDEdsSApj/R3J4DQIPkfH73Aa?=
 =?us-ascii?Q?o6roCZa+0gG1YY1bIaj95z+841Uoi4irB44phXvWshz/VvXxrtc3CAtpghw4?=
 =?us-ascii?Q?yah2Z1/a3uU7LbC6Hs3J/7aNPkCcacEwQPbP6yz9Sa7shGpErBZnkm/qBiEP?=
 =?us-ascii?Q?/e2HDBX3K7sZZN3xP4ZeiWAI1KbwQ2PEF4/H0BFIfKOHEGT4VRBVqrSOeLvd?=
 =?us-ascii?Q?n2MSXfzCn55Xj9FzI1gZcc6rgJO5LKLL6K3d+9ZF5deh0ZJbeE9ZNN1r9Aqj?=
 =?us-ascii?Q?zTvT5FDob7jTb5ZDBw/mA2Kyd/YibTSzxOB0PSFAdzdWV2wsS091kWmcwQqA?=
 =?us-ascii?Q?sjOarh8F0x4eZM7LSZWrdJNZWviYPU/po0ZpWI7cPF2CCmFo+GsvRvOtyZy0?=
 =?us-ascii?Q?PhD2y+W0WBOTgVrLzfkjKydKVG66o2pvc4HkIiGRgUaEJl2eWm1RDeEMyJ75?=
 =?us-ascii?Q?hFd7Mbx4lw8HO0gR2gQvmAKINxOuiCyRDXOHOLv1HRyPYVOBapYPSTIdNKqX?=
 =?us-ascii?Q?rn97SYWnDldT4Vqzyzor2UAeGeDSITcfgGSKXDhAQiUdppzok79YMp6ldcT2?=
 =?us-ascii?Q?50mOQ12Dru/muuCPCfl9MPWPD5O1BkqqFSdi90Gqj2czooiFxmgCvWl1YgWt?=
 =?us-ascii?Q?XdOXcbv0HwV+unwTa2GC6XE4iDKcwiFFED3GMnk+qTva2nzUqdf785qC3NME?=
 =?us-ascii?Q?Hq8zkq4sf/LIiGGAQSelIfatkA7iHPmPkkYnr1lZ3+N2PhelWXDr5p0RJ3N0?=
 =?us-ascii?Q?fgtPgJ7Zu8tWmTMMKMITnXb0hICv6qJNemLktd7OhDbInNM3VhJ9v7fF1zFS?=
 =?us-ascii?Q?girpHOgapAOVbhqH9w1SHZDmPM8Ta5jgHudriIuyOaOw/dHKOwQaYOSH7n6I?=
 =?us-ascii?Q?41uiGWEINHQQ9ky0hJYkwsY0FjnMVWXgP9dGFq/GWNBg38M+sc+k6jt1rXzp?=
 =?us-ascii?Q?KgI8JH3e8mwZDXmWDqoIT4T4nooQb1y6Mw81kM0N1Jomr7G0z7byKIghECva?=
 =?us-ascii?Q?s1GSMBA9qyRaAXitjHK8ZFDZoBRIKIfTMju5uZ5QjnDbkFZj8B+yDzSdhkjY?=
 =?us-ascii?Q?I/dsPP63VJ5sOXdFRiJb+L/Hav05PmPc7A4Zgiz3B39vegs/Asc6TzLd7EBY?=
 =?us-ascii?Q?jNXY05i9NFrW2Bkfrpssy8otEUvlfuctUyR6Whx+ia8oaFqZsZWQaoVtXUge?=
 =?us-ascii?Q?CSitrhywhTBom8G0DlL/B6VVymM60DGVCazc6ocNfRjxq2mkpAzL8zP6plam?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a86c464-db2a-49aa-b7d5-08dbc134c10f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 21:40:53.0316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtjcAx93IXTPcutv5t6URqaMUwjvW56E0Yn7JiUyWeUFQAl5Ogjbg/MB4siu0AeHajdbMVLHpxh8b1KTysW1p4fFSLP/Gn5g8MLDfprLaPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8224
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/4] drm/xe/xe2: Set tile y type in
 XY_FAST_COPY_BLT to Tile4
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

On Fri, Sep 29, 2023 at 02:36:39PM -0700, Lucas De Marchi wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> 
> Set bits 30 and 31 of XY_FAST_COPY_BLT's dword1 for XeHP and above.
> 
> Destination or source being Y-Major is selected on dword0 and there's
> nothing to set on dword1. According to the bspec for Xe2,
> "Behavior is undefined when programmed the value 0". Also for XeHP,
> the only value allowed in those bits is 0b11, not being possible to
> select "Legacy Tile-Y" anymore, only the newer Tile4.
> 
> So, unconditionally set those bits for graphics IP 12.50 and above.
> 
> v2: Reword commit message and extend it to graphics version >= 12.50
>     (Matt Roper)
> 
> Bspec: 57567
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

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
> index 2e6ce2daf414..316773e924e0 100644
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
> +	if (GRAPHICS_VERx100(xe) >= 1250)
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
