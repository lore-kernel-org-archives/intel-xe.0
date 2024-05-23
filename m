Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DAFC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 17:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF9410EF95;
	Thu, 23 May 2024 17:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aj8KBU9V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924F110E278
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 17:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716485424; x=1748021424;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RIehlogBpviHUleQwYZvYPKszubkROJ+1wC6WTYF148=;
 b=aj8KBU9Vlty7orMbS1eEv4Rd91kz7kFwbBO8vs7K90T+0YVpPz2l2N9M
 g7c+KdfQM4L2l53n0dNwqP9KR4YQMghOkCfbuvvioW393aj9Nye97ZWoo
 SC9VnF0Ya4fticgslw33ePDTapKlOHYkzG2h4erKPYGRWl25rjOM394N/
 zxOZXeA+LK+qK+W1exovYU7tm9b5ieXUnBSdgApRgkihDQMMfT+Uj6P10
 8wPgX6LhHfNpSPo6I4lIKUnXxs+ojsFNEmqJKOdZAt4kOaErYt0mGpcKu
 kf5McNS2jtR09nGtz5thEv/GdTRgEALyewUcwN0SjjF5MRsJKj3Rlb1V9 g==;
X-CSE-ConnectionGUID: N/shQJkYRnSV66yIhavy6A==
X-CSE-MsgGUID: D3qN98YBTMeGj4Jr088nSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12698482"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12698482"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:30:03 -0700
X-CSE-ConnectionGUID: lYWEL0ysQKy7AiuoWj4xYw==
X-CSE-MsgGUID: ewT0weeBTI6GeMraYPEa3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33804824"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 10:30:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 10:30:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 10:30:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 10:30:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieWBs5ZxMIq7Mht9r0qMBD7aEvesBHEJJzlot9CNY70hcvMobAmYj7iPuH94qunsyRvzUtuXWtOl1HMAY5Dfd1x3XOR1AQ9t9p5put7y0Gl02M22dsi0lxyQeh9ZcBdX4TXQUUK+Ma19TQvt/LG1SBST0nW2PwWz+gHVQf9UwMuFbeMEM6ItRCu3FYVU0JjOCFTyxu2Xif8zmCWFjNdHFNNCkfT0JefK1In56psP5mke1GRNjKQR3KIPB3URy8XPpE8YRGbMRjl+f51CTSpGwLpM9J2leqzURKn4zfNn4FsfthiN+kioVdlBRncasMIKV+tFvfbJQ4WEOpcYo4dwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZPFF0n2tn/bXtYcBFIwMlXuAqK51HANGHQAY3Dy8zE=;
 b=Hg++Pq/yKAlkJBBQD4MLhAuySJTHGf1UiYH5TiQ6CU42reX2R9lJyPcJjC41TR/3Zlxcv18RdE4C6jfmpdkt/Ss82pjO5i791jIkvWhlHatkjQIuPc5EBQpURhLNK1v1ACB7L28jCpnxfLpRQsk5PnEv5QObj3IyOMMhPdvgbwSNOdd6mpCsuRl3k/sRRuePYXC4vC2Gqcnyy8bQ2iag2yeSB/To5LY1W11c/LVp8El4a8agdgaN0phMsADIkXQpQyRnpm1Ry5ZGtU1I8yhqNyVUAbCAer79DhJT0yl6S5P1BGFR2fmXrm+VMmg/5IVyhVMyixc+L1jNK4iZfBFzVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB6149.namprd11.prod.outlook.com (2603:10b6:8:9e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 17:30:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 17:30:00 +0000
Date: Thu, 23 May 2024 13:29:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/hwmon: Add HWMON support for BMG
Message-ID: <Zk99FOCBzVrDZH06@intel.com>
References: <20240523144351.4040131-1-balasubramani.vivekanandan@intel.com>
 <20240523144351.4040131-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240523144351.4040131-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 5023b10f-c616-42bc-1b90-08dc7b4df93a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LBl23i+aLVoX3FdU7W9hkLbGj98bhJ9TVtnCpvguj5tKM19UAFtjXqIjPcB/?=
 =?us-ascii?Q?KSVPC2gclVin+xFPQ/lgD6Mnkzf0aX0gDE4RRuRw9XV2DadztrjA83gyeuRY?=
 =?us-ascii?Q?h9b08MVaOaFSv3noJM/3a6PQ8DVXO3ElVkuQYHkn6+SFNVbBYhSTJlgEqDjd?=
 =?us-ascii?Q?CiA+CpRQ/vsK88o/2FJkmypaNzzjY94N8FC83012r55rc+nR0l0cRB0JtZcd?=
 =?us-ascii?Q?9vofspZGJLrBOCLRgb3mCjYmTJ2X7LP7h7dOVgqPRPYrs7ggfoaRDy8cspmK?=
 =?us-ascii?Q?IK04OL52djqG7GoCnSG37HO/BEFFkqItkJP6qVb7osvT01KJn9Pvphasx5YF?=
 =?us-ascii?Q?ZBpL+esD33+xgbzkU6F5iwyRw5pHk69WX2I2N2Adr8lxWz4wHDkGnTPBkrMP?=
 =?us-ascii?Q?HC0kOO3vpPrC5H3b5cqVo31CUfN38JweWj4Gqnp0T+xzJtuHWwAOCiTnuZlt?=
 =?us-ascii?Q?46WlcrzBtXZUT4NNzmwjg0dJuYevpimMZY+Kty78hnVh0mYNmJ9FU8o4NeST?=
 =?us-ascii?Q?JRty/NvVamk5nVdUq5h7X3Rf9wo/Gf2w6VOojYE2BGqcNxFJQsAOi/Y0eEM3?=
 =?us-ascii?Q?0i6SwgmiGIQ4UCSe0xteY5DkT3OeF3LiDAxaccdJGNDcXfE7bPTh9ArK1hrT?=
 =?us-ascii?Q?o0ZrG7Fl1/kfxphCZinFOcN+ZGFd9ppaBRWXazm08LTPu/9FOmuH5pl53QOQ?=
 =?us-ascii?Q?7+acqxqUFSFFBwKFIuuGzu3CbUqJ4NGXtPCZKrgs14yw3fNFol/yOPVsxE/U?=
 =?us-ascii?Q?2kAXQMaz9gttrgum2+SGYF2wjB0sY/C/koMg2ycR46dXfo+mQEmQLriebBja?=
 =?us-ascii?Q?jyB39fE6Rk6pvP+HUNe6nuPjMF8h6y+QQUSfgpsqwI37lx/RHDW8IHNLlNxb?=
 =?us-ascii?Q?ovHRIkBe7jLQi+E1zoCEdCx+vvgK5xhajmmS0rUUH2UBxBbvxoSp4Rxaqb3L?=
 =?us-ascii?Q?KUNr7yGkXHsV4PzFh1E2iCcPB6BTif0h8TOlusY/vz72sT/e3jCzyHaanDAj?=
 =?us-ascii?Q?lnRfUhsGhfp4pNwSjoMgeqFssxv8UI3XzhsA7skeXZUv8r939xOuTkfjYwSZ?=
 =?us-ascii?Q?WNqYuwuHXsjDR3on/7/pc/r/O+N5M+lTz2SUBH/V5fbSICA2ruHXhuATpOb6?=
 =?us-ascii?Q?HnZxwp8T2Z9VQfFDH0fY8H15sU+9OeP1GJszU22hlLeSjqa43YGr9zPHWNMr?=
 =?us-ascii?Q?EYIKOO3AjJkuQmXESpmYNwZ5JAu1UktUUVLNHObYS3X+zAVDy1YrYTjyeKAy?=
 =?us-ascii?Q?djVrawPSpOeVwmYNsYMc9+r9lkWBuoyjOLLJSdCnOA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZnyTHL9kYFBpFlMjFa0os//hnA9Lm4Przmf1lK7N1c3/cqYrtlxGkWtVLj//?=
 =?us-ascii?Q?ipCI5jeEL4QRWwgP6msa5Koj3kVlVB/tXA2ISCNABzXtavPAWpsnR/bC0EGK?=
 =?us-ascii?Q?0DfbLRnW5F2RsGCxxvSQG18BI/TwhWIsy/7JJYtw3WTpNPP4akmuvxoyVn60?=
 =?us-ascii?Q?FzFKw52kQi1hpTTtA1Ju+QvmT/qW3PzTmnpnWtdYN9QJLCM7dBegQquz3zF0?=
 =?us-ascii?Q?q74G+m4Fbv2+dSdMeUvJaGDRETS3rF7puLLqc0cUs8Nz3fpNDnack6MjZhVK?=
 =?us-ascii?Q?Atv/RXf13zcOL49Hz8DLSj6dBuLyU80WS9r47ugvDOqFUB4tW1a9o4oEM7G5?=
 =?us-ascii?Q?KMN30JxnLvkd26/e5CLexiZDI2AFxX+IjjBz/0seeuQAsLVQ1stag5j0kRqO?=
 =?us-ascii?Q?wWaNNxRe8KnOwdi4f2R7fSeD1kSAX8Y05weqA8ER8+TdIEuVWq+t3BRJUWfM?=
 =?us-ascii?Q?YCkNl+x7wGdG1VS/nJaZnjpVI//t9xzJNtb2/3C+MSVQvS0amB5TagVvJd70?=
 =?us-ascii?Q?rBbfkg+MppHJ2OUOYfc4fVF9R+Q7uK1mm4xX5AKnlPM7oU/eI4xyyy75FXtn?=
 =?us-ascii?Q?mgMQ+mKLa2o7W+PhGYLJflEVEp/0HDxgvG5QOWxT25G1/cx+jTCXO0eSlhxD?=
 =?us-ascii?Q?02FJMetfx63OG//QRId0Qg8oKrEpKjFek4vSoihe5Bl7z35uNRDYibXPZpL2?=
 =?us-ascii?Q?HMPzC+GbNepzZabzoh9hYdhXZdEkhEMePPTD/EGKzT2l4b/+UYpTH0eHtoSD?=
 =?us-ascii?Q?rLQfedOOh337Oicxba3hw034P6N9L5IFMjIbyi+QpCtzY/5c/J52ci4nKv3m?=
 =?us-ascii?Q?Ii4b1HM7eVoMZNKOXwDtG1tuxUGQKb+2kArjN0nbjKdiS3PFwECBIhCflC5k?=
 =?us-ascii?Q?gxos3cdWvuAwwiPmomb6E9QN2e0iu4+3ql9hr4ufZ5EmLe6jNr2QlOJytd6L?=
 =?us-ascii?Q?XUhnfAwLk6sMVtG8aXjsaJey/+7SDJwOBAPN77UN9avHsxM8E5L8Tvc5SLns?=
 =?us-ascii?Q?c7qDHQgkejhn5fvlpj/L4mxaO6j0gbHVJZf2UQYMrc7f2V/7072PcIlzPJ+A?=
 =?us-ascii?Q?caLUvClGCwsP+UK/UGDafWXbrMewUrMkJcL5cStmQYt3rOrbq2PzFFLM8GcG?=
 =?us-ascii?Q?vb7/IWxg1VczLdsqyEr/JCfJ5m/486ULIx87k0B15hg5aUC6jjQVWNcPkKXT?=
 =?us-ascii?Q?XOS2cFQvFfayXDJL9PsUM0vSSf9dt/Qh+P7LaxFwVOO3eyTiws4oYN+TDJx5?=
 =?us-ascii?Q?onQdXem/AgzXb7y5UqmbLtwYNDaVrlNIPR/MlOylz2AVlNZ30d9vJRF8S6DF?=
 =?us-ascii?Q?rCLLZLHU3ltOF54EstrzICdAtwLDpPbm2fYqrQi00UaXsGQ9Z1swQ1lipZpy?=
 =?us-ascii?Q?UyTijYzkHdWK0au133V6YQkxq1OMymY1sZ3vlvG+nLyRwVwmxJ1+k64HrD2Y?=
 =?us-ascii?Q?tBvWYphmq1elQ1fQ8a//VubsyhgEV9Jjdu+wKrR1oVG3Vr06SXN1FgO9ca7e?=
 =?us-ascii?Q?BUaIx5zJ0OhQydzZC7oiAUgsKlVlhNJTp/m6gZx39JnJ3fgZOGwzM7hm7tlE?=
 =?us-ascii?Q?UnoGTXRjh0LzRmcHrAyT28xm6B/4OJlvPi62sNXIaVHP2+ktcsRz6Xt6a8gq?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5023b10f-c616-42bc-1b90-08dc7b4df93a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 17:30:00.6088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nCRU0+j9enll74Ay9WZlFogXBOYur0I7fzHckidOoPzAm5vEEBjzf2J0I6zbbVztdxjTjpAKo501158ZuS6RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6149
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

On Thu, May 23, 2024 at 08:13:50PM +0530, Balasubramani Vivekanandan wrote:
> From: Karthik Poosa <karthik.poosa@intel.com>
> 
> Add HWMON support for BMG. Exposing the pkg power, current,
> energy info.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  5 +++++
>  drivers/gpu/drm/xe/xe_hwmon.c           | 16 ++++++++++++----
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index 3dae858508c8..beba16d592fc 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -18,4 +18,9 @@
>  #define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
>  #define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
>  
> +#define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
> +#define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
> +#define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
> +
>  #endif /* _XE_PCODE_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index dca275117232..8daa070d7b1a 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -86,19 +86,25 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  
>  	switch (hwmon_reg) {
>  	case REG_PKG_RAPL_LIMIT:
> -		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
> +		if (xe->info.platform == XE_BATTLEMAGE && channel == CHANNEL_PKG)
> +			return BMG_PACKAGE_RAPL_LIMIT;
> +		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>  			return PVC_GT0_PACKAGE_RAPL_LIMIT;
>  		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>  			return PCU_CR_PACKAGE_RAPL_LIMIT;
>  		break;
>  	case REG_PKG_POWER_SKU:
> -		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
> +		if (xe->info.platform == XE_BATTLEMAGE)
> +			return BMG_PACKAGE_POWER_SKU;
> +		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>  			return PVC_GT0_PACKAGE_POWER_SKU;
>  		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>  			return PCU_CR_PACKAGE_POWER_SKU;
>  		break;
>  	case REG_PKG_POWER_SKU_UNIT:
> -		if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_BATTLEMAGE)
> +			return BMG_PACKAGE_POWER_SKU_UNIT;
> +		else if (xe->info.platform == XE_PVC)
>  			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>  		else if (xe->info.platform == XE_DG2)
>  			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
> @@ -108,7 +114,9 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  			return GT_PERF_STATUS;
>  		break;
>  	case REG_PKG_ENERGY_STATUS:
> -		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
> +		if (xe->info.platform == XE_BATTLEMAGE && channel == CHANNEL_PKG)
> +			return BMG_PACKAGE_ENERGY_STATUS;
> +		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>  			return PVC_GT0_PLATFORM_ENERGY_STATUS;
>  		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>  			return PCU_CR_PACKAGE_ENERGY_STATUS;
> -- 
> 2.25.1
> 
