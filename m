Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40306C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 18:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024D610EA6B;
	Fri,  3 Nov 2023 18:37:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA1610E193
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 18:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699036634; x=1730572634;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m3f65CO3at20j/NXJYW5uu8oVnCoBQfDOCZyDMc3m2I=;
 b=IUmfzHzRdPgwfuYXwOLqU29GpbuQiCSCvmKa8yVCWN3UPDGr5NiX/a4d
 3aJ150CKZFPrEdB/UX3bMPAsfAUhoONf45d6EfxHP+2tS4izut3AuxMB0
 YG1UOz/CMUkkXdLRsNsrFA+Sa4NOpoYhBKjHZIaOP4syn5xMWm+04TZUg
 08IKz5YUFSA6Xo1zaHCBGibDOQjjeEKLjQs2I1ICgmdGQMgaJr+haUf68
 HUWwD1XFXP1QRbHWZQT6Yrx370pwYzi5WJpA39LEMH1xrGExUuYDZxOS/
 UCQRyaeWXcklunz3vmdsQxIt8qS078t6cDbSaz0due8h1U3hUQ5bhdqhJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="391868502"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="391868502"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 11:37:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="790835462"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="790835462"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 11:37:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 11:37:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 11:37:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 11:37:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 11:37:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N88JC+yUqGN7GV3kiSG7R+zuZ2Ti77BBc9Vn9mzVk5AfrbU3EnBRbR8EF2YCjAfCCCu5INJuYceR5oJmIm9PBYAo2mGDkFX4xxzrlIGYj2+Cx94F7Q+SECA8zZveRmyyZ3wgUXl6MlQOHH0XijIWGhnmeGMHkFrUkO/cJbB9c9ntxVFdYDO9/4lg10IfOIgOLZwnSt0H8uqhnnT5eSI5DHaYWv22S+VHxXLCW02LgDmS3wz6Yu0G+VOndNexVZHgUfbRCc4u1QuKKJM+Q6YPyWUGrWPbQNjfd1h8xbI3fPOjKEzNUuVXhARHsZ4eYdGWDWE1Ch8bQENcnlrEvRGq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s16zYVqgvm7hC27uygz3iz/gAm73s3Mu8Egp13eSgLM=;
 b=P54th3jsK7H+Oi+iSLO0hUaW5xr4QtBct0VJyzmJ8ZNQQAinHGtIJ5qyQAthuE7EJBJcm/62oY1A5mcgkpRmDJ8fxG8oGVu1PaxSF3mkvBSKD+C+VkYcl9BFcaS4928hNhostykvGJP0HK4V5Fj9upnB1gplcNswxxSdaDjnFRylFSqgGr6j625ki//39b/CPZfFwEBQZSSxxVq7jPggiw9fDX7ndJ9/g7Mcub6a9rwQGfhqtR9Yir5touj+PmnaDmZWnDvP6TG6QAdIYQGvAQmRzl62nBAB9DrwOlPvxVb9HOzowgwpwLFBrJkXxP48CzBQK+e7ooauPeP1BYUR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Fri, 3 Nov
 2023 18:37:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 18:37:08 +0000
Date: Fri, 3 Nov 2023 14:37:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Message-ID: <ZUU90ZrNCBIMb/3s@intel.com>
References: <20231020232553.3665409-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231020232553.3665409-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd2f6c8-37eb-4f20-3d70-08dbdc9be2a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b2rGX/wfI/2msfkFBWk/C2xwEm0TF/3LNknIrjglWxpJmDru9gfqF5SFe30N+5erwZ1BFW/rTESJc3IGlk+kZd0skI6ObHLZj8JXB3q+R3hLesX/OUnIwszz4CrRZSuZp7J86p63r6HboypMLdz43S23Moe9Fz/spTP0wkKGBCk0NL+AHRoJM8FDHwNuBkL1lBj2vhD2OLrPIfv9mPfSHPfJqT2aV81GWYScKkoVxsJ29d2h7YRxmXI/MHaItzIETtenBO6UdfwQMBIz81HZYRBJt7XytvK9pGE8WA/UMlI+C0AsF//ulO4r/VBBsNLu77zj+KYoM9MRRzEONFQjT1nd2KG+rGQCBKMldQ7YN4tDfSHvRA1MSWwuLhOHhzfJGFJT+smq2QOvbF8IFV+bn3NtYqQyJa4nRZDMhu4nUJdZQGb0YHLGTuNzHz9LGrXwsn7e28uTtvQ0SQeq/wgg24doyafO+GC3NvAuvQddBkwl3omX6G/TnF+xlTYEYRCGv0QFjOKXSUGR/vtpGWBuL6EaHw2aZ86lvj7QgIXHXr1d16o2IO/WkLbxofcO/C78
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(36756003)(6512007)(83380400001)(316002)(6666004)(6636002)(66476007)(37006003)(6862004)(5660300002)(4326008)(44832011)(41300700001)(8936002)(2906002)(8676002)(478600001)(66946007)(6506007)(66556008)(82960400001)(2616005)(6486002)(26005)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hheApc+pN8JKfJ4bdwNt+KvqvdBFe9FNR2NYEihvXEmbKy86UbArOV39K4bT?=
 =?us-ascii?Q?KcPZKdIimfDp/meVVjB5aO5M2JtA0pUPefyVkMVxeYcmGauUyZjHQHLNmIkz?=
 =?us-ascii?Q?icKUUPXV3b0YJtq0Sc9h08D1Jz6NhgvWV7Rw+QmJg6xn4s/psIQKIzW79+EV?=
 =?us-ascii?Q?5tIcuOvVAj3MqxSY9s4cioyMU6h9ZFEBvL7WIO0Z1vDyfvuinpALjRz3Vk65?=
 =?us-ascii?Q?3a2Qfw/624cAi7F/HbUpRp0oaYBeKwi/T3FhIPCfijgwgJXrzCGtow2HKNib?=
 =?us-ascii?Q?Nlkgbr8Z4QHnAc3qMcXftBT1usbu6F+OMHfsHgtOFayBrJBUWOrbndpRszQB?=
 =?us-ascii?Q?pXQMb65pfOcFh16CUIBWWs1dLLdAahDG00JrG3o1QsUBGZSGyCDMi1BiUdxf?=
 =?us-ascii?Q?hsJyp26Csf3sF5vLq85EAOpklGTIO0H2O3o297D3nwVtAXx5D9u/7fdely1i?=
 =?us-ascii?Q?QDyyU1WCj4NFkfz77BXSBfMYJdM4cx9R/AEqo/1uH2w//4ogsj52YHPaSgxB?=
 =?us-ascii?Q?RYU5QPbdDbYhknTWBDDjIu8x1iGT9nmhY2Sus7nxpKDe+HfME3ANLiAeEYWO?=
 =?us-ascii?Q?AaqEi+tw6BWiRlVjN5m7fREMX2/VSDg3ukwLjUZ+xkTsTijzkSN6ElukJ9nN?=
 =?us-ascii?Q?vUL1e+VJPHOvwaHiN3A34abf35Hzx7KaPYrReGvHjphVmon+IcoRmKEs7tQw?=
 =?us-ascii?Q?90plXBScD39nTVgD3yAQZZ+n3Hhi7DuRUCRJI2e32ElRUlDYMahzrjINqkIC?=
 =?us-ascii?Q?DVfp4nGDtP9TgURH9QmtPOpxUJ5dLfrQdtrQZLnaSgmlofgnLCv4EhcyPoun?=
 =?us-ascii?Q?IMSCFpuaHZ5z+PuBSa+6ekgeLWB2O1FXAbaN68TxqFWvdFZXJTnzMijJl0L6?=
 =?us-ascii?Q?mUbCRXEvSu08+ov9bk0XOwXh4c6S2E6RZ2hn5645dOoY2Z8izqZAa0YFqYyf?=
 =?us-ascii?Q?wgKOxqVJRfbgQuC/AjqeYtourE1ST7V/GNI1dQ9WKtYuUDyRlte6ee/W6dm0?=
 =?us-ascii?Q?IXKGPZE/cM9x18vTjkc6BZt8mN15mAzhZUnUWHw52EMfVhNZQK+vHOd4VOau?=
 =?us-ascii?Q?JVGt/hFEAVz60iadWd0S4AxNWHoDdQAizS0TAv5c7Pjtr6UI0npjhXA31VZH?=
 =?us-ascii?Q?vUaKM0ye6zR2+pli/7NE9PknFQfn6SiWmkmmAT8mBVmLjhEBVSwxzayrMefL?=
 =?us-ascii?Q?CPQ4R0fEd46GGmb4JdfRcPaz7ix+qx6c8Kx5qH53TnkMypEJk6xT8og7/2fI?=
 =?us-ascii?Q?35LS4WJMW+FuPfoqV5siZs/7Y8nIINZkO1u0pGWg1FnoGpJqKU48K52zKy1m?=
 =?us-ascii?Q?UhKMdka320ybVc/ih5kgxVCyLCy7ZyC9kZgKVffp8IObDOWxGSxQsthSLKNJ?=
 =?us-ascii?Q?gihCx9kmdVVVosWoGVo86Mwpkd3J5IS0W5a56cztRJzefMnsOanWxkzbfIBv?=
 =?us-ascii?Q?L/Rp/1a8mwnBVOqBMrfNfez8/BPkXeVH3BHPUGKCpruUwucctTXCxu1Q+KU+?=
 =?us-ascii?Q?LaH+IXNSUua6wGlXgH9jahhgcUaYZMxRYE5S3VjTF5mWcOxu56Jn76vcPxG3?=
 =?us-ascii?Q?aOt9+w9/oWP7zF2InLJBWddfXiUHGCZtAJZpjXN9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd2f6c8-37eb-4f20-3d70-08dbdc9be2a4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 18:37:08.7402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4K8VJK9cXkgRPxD4AJAu0YD8SVZn1opHl1S/8CdxzU2BT9SnYJVWtnxp2mJT70U3XE+2Y/J89HQz5uynWZtqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Raise GT frequency before GuC load
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

On Fri, Oct 20, 2023 at 04:25:53PM -0700, Vinay Belgaumkar wrote:
> Starting GT freq is usually RPn. Raising freq to RP0 will
> help speed up GuC load times. As an example, this data was
> collected on DG2-
> 
> GuC Load time @RPn ~ 41 ms
> GuC Load time @RP0 ~ 11 ms
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  7 +++++
>  drivers/gpu/drm/xe/xe_guc.c          |  3 ++
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 44 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>  4 files changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cd1821d96a5d..0e6fe2ee4a2c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -244,6 +244,13 @@
>  
>  #define RPNSWREQ				XE_REG(0xa008)
>  #define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
> +#define   SW_REQ_UNSLICE_RATIO_SHIFT		23

please avoid shift and use the REG_FIELD_PREP and REG_FIELD_GET

> +#define   IGNORE_SLICE_RATIO			(0 << 0)

x | 0 = x
so, please avoid it.

> +
> +#define RP_CONTROL				XE_REG(0xa024)
> +#define   RPSWCTL_SHIFT			9

same here

> +#define   RPSWCTL_ENABLE			(0x2 << RPSWCTL_SHIFT)
> +#define   RPSWCTL_DISABLE			(0x0 << RPSWCTL_SHIFT)

Please use REG_GENMASK and REG_FIELD_PREP

something like

#define   RPSWCTL_MASK		REG_GENMASK(something, 9)
#define   RPSWCTL_ENABLE	REG_FIELD_PREP(RPSWCTL_MASK, 2)
#define   RPSWCTL_DISABLE	REG_FIELD_PREP(RPSWCTL_MASK, 0)

>  #define RC_CONTROL				XE_REG(0xa090)
>  #define RC_STATE				XE_REG(0xa094)
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 84f0b5488783..5af97982564a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -447,6 +447,9 @@ static int __xe_guc_upload(struct xe_guc *guc)
>  {
>  	int ret;
>  
> +	/* Raise GT freq to speed up GuC load */
> +	xe_guc_pc_request_rp0(&guc->pc);
> +

I have a strange feeling with this. Semantically...

guc_load asking guc_pc to do something...

we will need to have a xe_freq component that is detached from
the xe_guc_pc and then xe_freq exposes the sysfs and functions
like this and then it requests to guc_pc when it makes sense.

that can be done later, I agree, but we would need to at least
give this function a better name....

>  	guc_write_params(guc);
>  	guc_prepare_xfer(guc);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index d9375d1d582f..e1543478c627 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -247,6 +247,12 @@ static u32 decode_freq(u32 raw)
>  				 GEN9_FREQ_SCALER);
>  }
>  
> +static u32 encode_freq(u32 freq)
> +{
> +	return DIV_ROUND_CLOSEST(freq * GEN9_FREQ_SCALER,
> +				 GT_FREQUENCY_MULTIPLIER);
> +}
> +
>  static u32 pc_get_min_freq(struct xe_guc_pc *pc)
>  {
>  	u32 freq;
> @@ -257,6 +263,28 @@ static u32 pc_get_min_freq(struct xe_guc_pc *pc)
>  	return decode_freq(freq);
>  }
>  
> +static void pc_set_manual_rp_ctrl(struct xe_guc_pc *pc, bool enable)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 state = enable ? RPSWCTL_ENABLE : RPSWCTL_DISABLE;
> +
> +	/* Allow/Disallow punit to process software freq requests */
> +	xe_mmio_write32(gt, RP_CONTROL, state);
> +}
> +
> +static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	pc_set_manual_rp_ctrl(pc, true);
> +
> +	/* Req freq is in units of 16.66 Mhz */
> +	xe_mmio_write32(gt, RPNSWREQ, (encode_freq(freq) << SW_REQ_UNSLICE_RATIO_SHIFT)
> +			| IGNORE_SLICE_RATIO);
> +
> +	pc_set_manual_rp_ctrl(pc, false);
> +}
> +
>  static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>  {
>  	/*
> @@ -685,6 +713,20 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>  	else
>  		tgl_init_fused_rp_values(pc);
>  }
> +
> +/**
> + * xe_guc_pc_request_rp0 - Request RP0
> + * @pc: Xe_GuC_PC instance

some more information here on the purpose and usage of this function
is needed. Specially because it should be avoided on regular cases.

> + */
> +void xe_guc_pc_request_rp0(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> +	pc_init_fused_rp_values(pc);
> +	pc_set_cur_freq(pc, pc->rp0_freq);
> +}
> +
>  static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>  {
>  	int ret;
> @@ -918,8 +960,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  
>  	pc->bo = bo;
>  
> -	pc_init_fused_rp_values(pc);
> -

hmmm... this also shows that we are then calling a function
of this component before the component is initialized!!

so, maybe we need a function called xe_guc_pc_init_early()
and then this function by itself sets this pc->rp* stuff
and manually force the freq to rp0. And we document that
the pre_init or init_early needs to be called before GuC
is loaded for faster loading of GuC.

>  	err = sysfs_create_files(gt->sysfs, pc_attrs);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 43ea582545b5..8bed5d9fc12a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -17,4 +17,5 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>  enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
> +void xe_guc_pc_request_rp0(struct xe_guc_pc *pc);
>  #endif /* _XE_GUC_PC_H_ */
> -- 
> 2.38.1
> 
