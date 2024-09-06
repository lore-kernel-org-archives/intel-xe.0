Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FB2CE7AB0
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 03:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C84110E0FD;
	Fri,  6 Sep 2024 03:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWxjx0yL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4273610E0FD
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 03:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725594300; x=1757130300;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W3Fnn7+j5lQ2G03EvhRmdadNydurTlpZcTwz60g/Kn4=;
 b=MWxjx0yLCUeub+09vf2UqiR+WDOeskmcIxku/Ck5vsSuZhUc788sMbqM
 u/cPaHYqicDzjLX3ZpM+tjuZ4htxg4SZaNw3jHTK5/PwRo8K8COoKeFIr
 P4c1SecrF/EqN0MM5cddVPiYakQHkvCpJvGEcYTM69gsO0wb6lT5eTbSL
 nfvT4JCge6QGqh/0tZadSEeJD6ewwmToWZAjIZbYwTx46SWa84v85IIBH
 dbM+yjRjdwvGAwm5wv2IlGlNL1oHcIFjWRsxXEbA1RYtQFjwblu/3fpsa
 eBZ33CbtbsYmh4CuLuS8ZMeQ06zoKo4xew2K9dh9Mey2cnH0VI51FFXeP w==;
X-CSE-ConnectionGUID: zXq80BoAQ2mmPMdCl0aBPQ==
X-CSE-MsgGUID: QfymdmtKSqmaJBhSLCtaRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="23848890"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="23848890"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 20:45:00 -0700
X-CSE-ConnectionGUID: smPx5fJIQemP24YBK8V8KQ==
X-CSE-MsgGUID: UxffCd77SZOSpvCBZvGb7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="66373151"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 20:45:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 20:44:59 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 20:44:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 20:44:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 20:44:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSng8M3/bGA9FIAfWKM+RjJ/BtN77Mla3DpiSrrVASD/7Y5ebGTYbpWHdWAEbaZVFQkRiFpDPFNzXcgf8ALlqjOBO/jpG31uF9RNM9fmukTJhaJGmfyfk4dmMbf7JKuTCZHFFJLQfHvRlEDT7DGFSf3pnmSVe7Erj+6bz1ooKg/EUaRK1g/uDTMEszvpPlqOov0nvlF/baVDDVekOKaNAVEKPts8nmkdgCqncPns9aiWjzP/TliI/zUHmzqeVXTgouXUv/LU4h+e3ZcLG+evpWS5OnUzTeqqn7Dd+So7utOCT1NCr1Ot82V82eVAFZMSSS5J/+SCroqD57/HsUawRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2G6wOsixwwKk0MRVh4U4Iqzr/HcLLpkLfFHytrgFzU=;
 b=VXbMR0lItZiaebYS2dOjOfpLJO0gVU3Tlb7JqBKrnScT8mlbSNwj+W9wRs0vn8/ismQ7yyXRvbqk8OWh7N/ToeW82qBPdeXbS1kZqQEu6J9Ohxhu/52tb5BUGvJgIV8zZ6lTHMHJdRZh2FdQdOgrOnaq++Sw0ob8ViJ6sVPkzCXRPGRTkm5F0WaCUhIGJoQlMaWbFHSdIkSfbc5vvYqN48LWLKeKgAIRhT5zFHOSr7zbYEYEiz1cydT3+e55opJTTObL+BPAA89m41qTNs7Bj6sPY6bxpsc5QE2lEuLc0ih7DQHkopXW10ylhVOGADqPYWXxkWrzj1m/2avTbydl1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7013.namprd11.prod.outlook.com (2603:10b6:806:2be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 03:44:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 03:44:56 +0000
Date: Thu, 5 Sep 2024 22:44:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Koby Elbaz <kelbaz@habana.ai>
Subject: Re: [PATCH 09/43] drm/xe: Switch MMIO interface to take xe_mmio
 instead of xe_gt
Message-ID: <khpssae3waxmeofpm4t4vxvc2bkbadgrn5nts2gkal4yonofq5@bdbbq465bz2e>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
 <20240904002100.2023834-54-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240904002100.2023834-54-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW3PR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:303:2a::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: af6279d9-736d-4737-02aa-08dcce26460f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?htU0ZxowEYEY9dHBYC2ZOfhX48RXV3zeW9JsJ2YcVdkta0cjGt+G/b4QE2JO?=
 =?us-ascii?Q?KoxDp3iQ2VytamDKPFVH+oZRM/aUch45rLpyAx28EW7gMR2GS80dF1G3XHgR?=
 =?us-ascii?Q?nTpUpyv1OtjtPasN9/hsaBjJV1xTgNecx8tqRkKfsgBgzlhBVBJS4RB6HuCe?=
 =?us-ascii?Q?lB2X24Xtmsjb21Fqrl8TPXbBtv2UQt73t46I3j3V5aBX72DphuRWdyNbhgC1?=
 =?us-ascii?Q?6hJHXOZMKsxVpUd/tyi6Cb8Hba43SJzHVfkkQydAbVFwuugbtlQYczhRcakk?=
 =?us-ascii?Q?hk2znYA3tyryYTn+/RsvlV4cfKYsHi9Mb1ZhYiiB6IkoLo55ORE2HfkEhtJU?=
 =?us-ascii?Q?K6YqRTKEUtx5JLvhUEWI/LM0WrcnAcBlaeUp3DAIbBkbs1ASZHByIqmyzJM2?=
 =?us-ascii?Q?UPSBkCT9jSjvSVRwVR44y6vXKjDx5wzzKRifPbhY4DIw+HQwpT8loyLXQ1tp?=
 =?us-ascii?Q?0E0QxVfq3s4sGIGZ8n+sjAe5q+E1jcrTLiIxtr+UXYn8k+3LeYXrA7iTk5p1?=
 =?us-ascii?Q?zHgRh25iP0gyNWMLVju3/jo71Q8LLBS+Tsti4jlJ/yR2fQWDarBA9238ca7b?=
 =?us-ascii?Q?JO/GPQGrOL5wwQlJSFA0OZFHJHT1naPIwSa/BTy2CghEp/GnPP/6hY90PNPa?=
 =?us-ascii?Q?QcR8phBgl9k31JVYDL4QgSOqMAS3K8L9hY8Or64q1Y7cVzpFsKanjGlYJg7F?=
 =?us-ascii?Q?rdXrs4QVseD0IgFVuKidYvBhNhx1WZuYvVMDBK8AMOYPCu8DOao9q7lKDlDB?=
 =?us-ascii?Q?GvfmdjY5BPRzvM8+trGyASlVqyNXqdB2tVQ2Owng1IKyNFyK+SeATbtYPDwW?=
 =?us-ascii?Q?/a5OiT2fqWdUT1wckwa/gNDGaw10j0W28WfQhB8To+4X5gJz38nzVYM7tUG5?=
 =?us-ascii?Q?nEVNE3dhGuyeRqkBc3KCUYhRV/t23o3ZPRBiVtloNSVzq82UGkpOy3fiWVLA?=
 =?us-ascii?Q?3DT1S43IY7dDfvhxvyhF5WrcxGmpId81rdaAHORTj5+gtLipkthdoxCuRdZu?=
 =?us-ascii?Q?rPwtmiwhUjoRvLVo+PZGMVC66uIPAdzM4w5UvhxQb3E059Ygx6kwduYzAv8E?=
 =?us-ascii?Q?oBWV6223jIpQUMSnFBxdu5OXI2g6FYsayMFrPi1xXaXyF7fb+xd4Ks9DMPS4?=
 =?us-ascii?Q?Er1qFLS/SB6eygYyxxNFNSRS4AUPKw+hOQO+cOP56kszYdLEAJLADHBnyfXH?=
 =?us-ascii?Q?s6oRj4Py3Qp+P9gVAxmqPWieTJWr4xfY+ux8Wh/QWGcVUophAITHx8z5VMFy?=
 =?us-ascii?Q?18sGtYMkzsJ1suIQ1t0r9m5Cf5dnSkbdozF0kxZ6UdVLAbxT+Vz91QzhSZXe?=
 =?us-ascii?Q?52tJbwQv17JXLLv+QpfWjEE7yPr6rZwlb6wXi0Rf7Jo/Hw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ohOlo2L9DFZWBP2AFfkVQZj8pGgX40+JLPdWdNgWM1lcVQw/UxFiJcHXpgaO?=
 =?us-ascii?Q?NqzTpZToLG8QA1VKwiwJe+n10gKC9nTuZ/3ZG7cVs2CJ3rZWewIpeNXYxIBi?=
 =?us-ascii?Q?aCJwCp1p2vVMMKOy05mwLPpaoiqBbDajzz7CLAa6UjoqmCwVo6udrH0ehQrb?=
 =?us-ascii?Q?4pjWL6Bj+11aLrDX71wPS6EguF3Zbmg9YO2ZKFJ4mMuQSEm1LX+V+XOV59Im?=
 =?us-ascii?Q?eAqfVJYEf2KqCC6T3b2ujnVmgd3+bU/Hd3GPtcrfnw3Nqb5Fs6lZqYsdCjr+?=
 =?us-ascii?Q?c+68bCkq3Q5gsPbrAUNu1pc+Xj4WKGgRUFoZPXkKv0GwXsSJiRflCthddYLv?=
 =?us-ascii?Q?Iz6gClysNAhSgqoIabjToLR/8xcvFOflOR/vh7qFfWQ0GhZWtlW2EAn+dQ6X?=
 =?us-ascii?Q?8kxvUkgs4VuNV9BO2x0E+iTgoQUH+JXosGkTyY9U/GpE3KWEhsAuYdQxfQtC?=
 =?us-ascii?Q?6zolkcJg9xjxlM+ZNm+5XBED3zY63BrYQcpmfdedNeYPlL7ndu6WxX9o1mrO?=
 =?us-ascii?Q?AfUPQ2oHJbbFlCssubP1VzbW446thY9OuWbx/rDAlLZEnxAWuWOJET1qoTII?=
 =?us-ascii?Q?RBvjhFMSU/98CFT18Ff7r/TftRkuaS89myxcHbNgI2XdhVIma2TSxjrPjWR2?=
 =?us-ascii?Q?oCrzgHHbh5DsVTBP8QfNN6pvOcgN6Vf84Q8bkDZ1yoBZqVruIYUz1miacdTo?=
 =?us-ascii?Q?qxSSsO1dDsEfcZVBlsLk3HCgFQaYayMuEhNYTyr8aaF0qvtLA8C39bjx9RFg?=
 =?us-ascii?Q?mknyUd4/h0MYRYk75ZuWTJr+8vVte3kTybHVku1LVPN+hp6/mO4tp1wsXAb6?=
 =?us-ascii?Q?Z3FYKcHmqtJVbE673ombphUt1releAj6ibCOHLcwXoFCMJq91qXOG5A8+WYg?=
 =?us-ascii?Q?dul7gg2nLZjrB3NgWIrRcC6sXFTGnIa2UjlSeSZTVvM5SxMwOCqqhUMlOqiV?=
 =?us-ascii?Q?xMgY9ClBzZe+tzRDpwZ6s5gUa+S7mrhOrLiSgJzeJANJ2HXNnKNYe/C686fa?=
 =?us-ascii?Q?gYLaH1jqMMOPB2qNX5D5h58cgFdGkgADAas1+6I1oexNJCpz+XAEvUGM9onR?=
 =?us-ascii?Q?Bcu35oh22vCSGmz3oeaqgcmxBZaqIvuvM+bzXQSGPSbiEZJmTxrtU3qosmv4?=
 =?us-ascii?Q?LDbOB3D2fEe0ZOuO2KBLf4Msfgwm0R0ARyiDMkQTzSd/ila/XYV6lUmgMpsO?=
 =?us-ascii?Q?Wu3lKRpnR0IwtZoTJC+H1Ptrzu9Jaa03pcMoe03ph7LjoTx+Tvelbdw2w3NV?=
 =?us-ascii?Q?z96iCPAfrQVG2+1BcL148iybcuiVxK23e8DAEK19NqLKJj7W12La3UGUQA9B?=
 =?us-ascii?Q?MvGv+ftFGLBOAnd4Q0QTD2HMTzvumN+KsPoJLLYYP6LipGp46n4qevz13bOn?=
 =?us-ascii?Q?leqQ9mCEep0QUYl8iWtLRsz2u3oV2rit+Cq3Twr/qxWalyf1OPYboe51jXRi?=
 =?us-ascii?Q?xiIIpkzkhMjARx1e74x67xxs2v5wVciyR7pE8kV3iNtgup9TZoRnblXlTnxo?=
 =?us-ascii?Q?h/LWr+D/csvjEwhrovXfr/J2Ly+IgTz7KZiu2mc6DEA97m8rYuNESHoz8dvh?=
 =?us-ascii?Q?sqa99HEOavOmaU0hpwxIrjIqsKByX+3488mcTbt8YXJZ+mNuQPhhvOY7XW6R?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af6279d9-736d-4737-02aa-08dcce26460f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 03:44:56.1691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odB5WAHAewwo7ODn6A3D0icy+GdAT17zG13ngp4WC09XKVEqtqXKaA8dCgPZibC2xLeFNDmSxX4C+Q8hW9mWi2Qoe6UEIpfOjwudcN+5TyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7013
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

On Tue, Sep 03, 2024 at 05:21:10PM GMT, Matt Roper wrote:
>Since much of the MMIO register access done by the driver is to non-GT
>registers, use of 'xe_gt' in these interfaces has been a long-standing
>design flaw that's been hard to disentangle.
>
>To avoid a flag day across the whole driver, munge the function names
>and add temporary compatibility macros with the original function names
>that can accept either the new xe_mmio or the old xe_gt structure as a
>parameter.  This will allow us to slowly convert parts of the driver
>over to the new interface independently.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_mmio.c  | 131 ++++++++++++++++------------------
> drivers/gpu/drm/xe/xe_mmio.h  |  76 +++++++++++++++-----
> drivers/gpu/drm/xe/xe_trace.h |   6 +-
> 3 files changed, 125 insertions(+), 88 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 8068663e7d28..92f0bda0ae30 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -67,16 +67,16 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>
> 	/* Possibly override number of tile based on configuration register */
> 	if (!xe->info.skip_mtcfg) {
>-		struct xe_gt *gt = xe_root_mmio_gt(xe);
>+		struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> 		u8 tile_count;
> 		u32 mtcfg;
>
> 		/*
> 		 * Although the per-tile mmio regs are not yet initialized, this
>-		 * is fine as it's going to the root gt, that's guaranteed to be
>-		 * initialized earlier in xe_mmio_init()
>+		 * is fine as it's going to the root tile's mmio, that's
>+		 * guaranteed to be initialized earlier in xe_mmio_init()
> 		 */
>-		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
>+		mtcfg = xe_mmio_read64_2x32(mmio, XEHP_MTCFG_ADDR);
> 		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>
> 		if (tile_count < xe->info.tile_count) {
>@@ -187,116 +187,111 @@ int xe_mmio_init(struct xe_device *xe)
> 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
> }
>
>-static void mmio_flush_pending_writes(struct xe_gt *gt)
>+static void mmio_flush_pending_writes(struct xe_mmio *mmio)
> {
> #define DUMMY_REG_OFFSET	0x130030
>-	struct xe_tile *tile = gt_to_tile(gt);
> 	int i;
>
>-	if (tile->xe->info.platform != XE_LUNARLAKE)
>+	if (mmio->xe->info.platform != XE_LUNARLAKE)
> 		return;
>
> 	/* 4 dummy writes */
> 	for (i = 0; i < 4; i++)
>-		writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
>+		writel(0, mmio->regs + DUMMY_REG_OFFSET);
> }
>
>-u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>+u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
> {
>-	struct xe_tile *tile = gt_to_tile(gt);
>-	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>+	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> 	u8 val;
>
> 	/* Wa_15015404425 */
>-	mmio_flush_pending_writes(gt);
>+	mmio_flush_pending_writes(mmio);
>
>-	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);

not sure I understand the plan to replace this. This previously worked
by checking what is the type of the register we have declared and
redirect the access to the other region.

Do you think we'd rather use the separate mmio object in the caller like
below?

	xe_mmio_read8(tile->mmio_ext, A_REG_WITH_EXT_MMIO_SET)

?

Then maybe we could have a field in struct xe_mmio that we can xe_assert
with the type of register being passed... ?

This does look like a more elegant solution. As we don't have any users
for that, this is entirely delegated for when the users show up.

Cc Koby

Lucas De Marchi

>-	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>+	val = readb(mmio->regs + addr);
>+	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
>
> 	return val;
> }
>
>-u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
>+u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
> {
>-	struct xe_tile *tile = gt_to_tile(gt);
>-	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>+	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> 	u16 val;
>
> 	/* Wa_15015404425 */
>-	mmio_flush_pending_writes(gt);
>+	mmio_flush_pending_writes(mmio);
>
>-	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>-	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>+	val = readw(mmio->regs + addr);
>+	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
>
> 	return val;
> }
>
>-void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>+void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
> {
>-	struct xe_tile *tile = gt_to_tile(gt);
>-	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>+	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>
>-	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
>+	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>
>-	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
>-		xe_gt_sriov_vf_write32(gt->mmio.sriov_vf, reg, val);
>+	if (!reg.vf && mmio->sriov_vf)
>+		xe_gt_sriov_vf_write32(mmio->sriov_vf, reg, val);
> 	else
>-		writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>+		writel(val, mmio->regs + addr);
> }
>
>-u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>+u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
> {
>-	struct xe_tile *tile = gt_to_tile(gt);
>-	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>+	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> 	u32 val;
>
> 	/* Wa_15015404425 */
>-	mmio_flush_pending_writes(gt);
>+	mmio_flush_pending_writes(mmio);
>
>-	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
>-		val = xe_gt_sriov_vf_read32(gt->mmio.sriov_vf, reg);
>+	if (!reg.vf && mmio->sriov_vf)
>+		val = xe_gt_sriov_vf_read32(mmio->sriov_vf, reg);
> 	else
>-		val = readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>+		val = readl(mmio->regs + addr);
>
>-	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>+	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
>
> 	return val;
> }
>
>-u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
>+u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set)
> {
> 	u32 old, reg_val;
>
>-	old = xe_mmio_read32(gt, reg);
>+	old = xe_mmio_read32(mmio, reg);
> 	reg_val = (old & ~clr) | set;
>-	xe_mmio_write32(gt, reg, reg_val);
>+	xe_mmio_write32(mmio, reg, reg_val);
>
> 	return old;
> }
>
>-int xe_mmio_write32_and_verify(struct xe_gt *gt,
>-			       struct xe_reg reg, u32 val, u32 mask, u32 eval)
>+int __xe_mmio_write32_and_verify(struct xe_mmio *mmio,
>+				 struct xe_reg reg, u32 val, u32 mask, u32 eval)
> {
> 	u32 reg_val;
>
>-	xe_mmio_write32(gt, reg, val);
>-	reg_val = xe_mmio_read32(gt, reg);
>+	xe_mmio_write32(mmio, reg, val);
>+	reg_val = xe_mmio_read32(mmio, reg);
>
> 	return (reg_val & mask) != eval ? -EINVAL : 0;
> }
>
>-bool xe_mmio_in_range(const struct xe_gt *gt,
>-		      const struct xe_mmio_range *range,
>-		      struct xe_reg reg)
>+bool __xe_mmio_in_range(const struct xe_mmio *mmio,
>+			const struct xe_mmio_range *range,
>+			struct xe_reg reg)
> {
>-	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>+	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>
> 	return range && addr >= range->start && addr <= range->end;
> }
>
> /**
>  * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
>- * @gt: MMIO target GT
>+ * @mmio: MMIO target
>  * @reg: register to read value from
>  *
>  * Although Intel GPUs have some 64-bit registers, the hardware officially
>@@ -316,21 +311,21 @@ bool xe_mmio_in_range(const struct xe_gt *gt,
>  *
>  * Returns the value of the 64-bit register.
>  */
>-u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
>+u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
> {
> 	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
> 	u32 ldw, udw, oldudw, retries;
>
>-	reg.addr = xe_mmio_adjusted_addr(gt, reg.addr);
>-	reg_udw.addr = xe_mmio_adjusted_addr(gt, reg_udw.addr);
>+	reg.addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>+	reg_udw.addr = xe_mmio_adjusted_addr(mmio, reg_udw.addr);
>
> 	/* we shouldn't adjust just one register address */
>-	xe_gt_assert(gt, reg_udw.addr == reg.addr + 0x4);
>+	xe_assert(mmio->xe, reg_udw.addr == reg.addr + 0x4);
>
>-	oldudw = xe_mmio_read32(gt, reg_udw);
>+	oldudw = xe_mmio_read32(mmio, reg_udw);
> 	for (retries = 5; retries; --retries) {
>-		ldw = xe_mmio_read32(gt, reg);
>-		udw = xe_mmio_read32(gt, reg_udw);
>+		ldw = xe_mmio_read32(mmio, reg);
>+		udw = xe_mmio_read32(mmio, reg_udw);
>
> 		if (udw == oldudw)
> 			break;
>@@ -338,14 +333,14 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
> 		oldudw = udw;
> 	}
>
>-	xe_gt_WARN(gt, retries == 0,
>-		   "64-bit read of %#x did not stabilize\n", reg.addr);
>+	drm_WARN(&mmio->xe->drm, retries == 0,
>+		 "64-bit read of %#x did not stabilize\n", reg.addr);
>
> 	return (u64)udw << 32 | ldw;
> }
>
>-static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>-			    u32 *out_val, bool atomic, bool expect_match)
>+static int ____xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>+			      u32 *out_val, bool atomic, bool expect_match)
> {
> 	ktime_t cur = ktime_get_raw();
> 	const ktime_t end = ktime_add_us(cur, timeout_us);
>@@ -355,7 +350,7 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
> 	bool check;
>
> 	for (;;) {
>-		read = xe_mmio_read32(gt, reg);
>+		read = xe_mmio_read32(mmio, reg);
>
> 		check = (read & mask) == val;
> 		if (!expect_match)
>@@ -381,7 +376,7 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
> 	}
>
> 	if (ret != 0) {
>-		read = xe_mmio_read32(gt, reg);
>+		read = xe_mmio_read32(mmio, reg);
>
> 		check = (read & mask) == val;
> 		if (!expect_match)
>@@ -399,7 +394,7 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
>
> /**
>  * xe_mmio_wait32() - Wait for a register to match the desired masked value
>- * @gt: MMIO target GT
>+ * @mmio: MMIO target
>  * @reg: register to read value from
>  * @mask: mask to be applied to the value read from the register
>  * @val: desired value after applying the mask
>@@ -416,15 +411,15 @@ static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 v
>  * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
>  * it is possible that this function succeeds even after @timeout_us has passed.
>  */
>-int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>-		   u32 *out_val, bool atomic)
>+int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>+		     u32 *out_val, bool atomic)
> {
>-	return __xe_mmio_wait32(gt, reg, mask, val, timeout_us, out_val, atomic, true);
>+	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, true);
> }
>
> /**
>  * xe_mmio_wait32_not() - Wait for a register to return anything other than the given masked value
>- * @gt: MMIO target GT
>+ * @mmio: MMIO target
>  * @reg: register to read value from
>  * @mask: mask to be applied to the value read from the register
>  * @val: value not to be matched after applying the mask
>@@ -435,8 +430,8 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 t
>  * This function works exactly like xe_mmio_wait32() with the exception that
>  * @val is expected not to be matched.
>  */
>-int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>-		       u32 *out_val, bool atomic)
>+int __xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>+			 u32 *out_val, bool atomic)
> {
>-	return __xe_mmio_wait32(gt, reg, mask, val, timeout_us, out_val, atomic, false);
>+	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
> }
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index 26551410ecc8..ac6846447c52 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -14,25 +14,67 @@ struct xe_reg;
> int xe_mmio_init(struct xe_device *xe);
> int xe_mmio_probe_tiles(struct xe_device *xe);
>
>-u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
>-u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg);
>-void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>-u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
>-u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
>-int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask, u32 eval);
>-bool xe_mmio_in_range(const struct xe_gt *gt, const struct xe_mmio_range *range, struct xe_reg reg);
>-
>-u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
>-int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>-		   u32 *out_val, bool atomic);
>-int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>-		       u32 *out_val, bool atomic);
>-
>-static inline u32 xe_mmio_adjusted_addr(const struct xe_gt *gt, u32 addr)
>+/*
>+ * Temporary transition helper for xe_gt -> xe_mmio conversion.  Allows
>+ * continued usage of xe_gt as a parameter to MMIO operations which now
>+ * take an xe_mmio structure instead.  Will be removed once the driver-wide
>+ * conversion is complete.
>+ */
>+#define __to_xe_mmio(ptr) \
>+	_Generic(ptr, \
>+		 const struct xe_gt *: (&((const struct xe_gt *)(ptr))->mmio), \
>+		 struct xe_gt *: (&((struct xe_gt *)(ptr))->mmio), \
>+		 const struct xe_mmio *: (ptr), \
>+		 struct xe_mmio *: (ptr))
>+
>+u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
>+#define xe_mmio_read8(p, reg) __xe_mmio_read8(__to_xe_mmio(p), reg)
>+
>+u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
>+#define xe_mmio_read16(p, reg) __xe_mmio_read16(__to_xe_mmio(p), reg)
>+
>+void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
>+#define xe_mmio_write32(p, reg, val) __xe_mmio_write32(__to_xe_mmio(p), reg, val)
>+
>+u32 __xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg);
>+#define xe_mmio_read32(p, reg) __xe_mmio_read32(__to_xe_mmio(p), reg)
>+
>+u32 __xe_mmio_rmw32(struct xe_mmio *mmio, struct xe_reg reg, u32 clr, u32 set);
>+#define xe_mmio_rmw32(p, reg, clr, set) __xe_mmio_rmw32(__to_xe_mmio(p), reg, clr, set)
>+
>+int __xe_mmio_write32_and_verify(struct xe_mmio *mmio, struct xe_reg reg,
>+				 u32 val, u32 mask, u32 eval);
>+#define xe_mmio_write32_and_verify(p, reg, val, mask, eval) \
>+	__xe_mmio_write32_and_verify(__to_xe_mmio(p), reg, val, mask, eval)
>+
>+bool __xe_mmio_in_range(const struct xe_mmio *mmio,
>+			const struct xe_mmio_range *range, struct xe_reg reg);
>+#define xe_mmio_in_range(p, range, reg) __xe_mmio_in_range(__to_xe_mmio(p), range, reg)
>+
>+u64 __xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg);
>+#define xe_mmio_read64_2x32(p, reg) __xe_mmio_read64_2x32(__to_xe_mmio(p), reg)
>+
>+int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val,
>+		     u32 timeout_us, u32 *out_val, bool atomic);
>+#define xe_mmio_wait32(p, reg, mask, val, timeout_us, out_val, atomic) \
>+	__xe_mmio_wait32(__to_xe_mmio(p), reg, mask, val, timeout_us, out_val, atomic)
>+
>+int __xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask,
>+			 u32 val, u32 timeout_us, u32 *out_val, bool atomic);
>+#define xe_mmio_wait32_not(p, reg, mask, val, timeout_us, out_val, atomic) \
>+	__xe_mmio_wait32_not(__to_xe_mmio(p), reg, mask, val, timeout_us, out_val, atomic)
>+
>+static inline u32 __xe_mmio_adjusted_addr(const struct xe_mmio *mmio, u32 addr)
> {
>-	if (addr < gt->mmio.adj_limit)
>-		addr += gt->mmio.adj_offset;
>+	if (addr < mmio->adj_limit)
>+		addr += mmio->adj_offset;
> 	return addr;
> }
>+#define xe_mmio_adjusted_addr(p, addr) __xe_mmio_adjusted_addr(__to_xe_mmio(p), addr)
>+
>+static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>+{
>+	return &xe->tiles[0].mmio;
>+}
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index 8573d7a87d84..d323873dda20 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -342,12 +342,12 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_try_signal,
> );
>
> TRACE_EVENT(xe_reg_rw,
>-	TP_PROTO(struct xe_gt *gt, bool write, u32 reg, u64 val, int len),
>+	TP_PROTO(struct xe_mmio *mmio, bool write, u32 reg, u64 val, int len),
>
>-	TP_ARGS(gt, write, reg, val, len),
>+	TP_ARGS(mmio, write, reg, val, len),
>
> 	TP_STRUCT__entry(
>-		__string(dev, __dev_name_gt(gt))
>+		__string(dev, __dev_name_xe(mmio->xe))
> 		__field(u64, val)
> 		__field(u32, reg)
> 		__field(u16, write)
>-- 
>2.45.2
>
