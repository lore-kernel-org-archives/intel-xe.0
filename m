Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB9FC77B61
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 22:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5048B10E1F9;
	Mon, 24 Apr 2023 22:46:29 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2E110E1F9
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 22:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682376386; x=1713912386;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bpZpE+DrIP7pi0zLzpGHBEsMH6QM8AaUhRSRJeBg+Uw=;
 b=kj9JxePRPXdx1azC7QNTivYlv1XQJdcjzRkiJ3+AtLReWRYIcq+y6L1Z
 DmZ6T2XC/FphAL2bjshrRj3EED7U8PGBDVbgsOXrkggRowtOuWO3xwb/u
 6VyHYMFOfy45NfoitDblZ5K+82OGsA+OXsbgpsyp3iD83uZ+wT6wiKyoJ
 UVJrRqx4JYaz3Z2Oq8gBIv/QCoxMzs+houzpVQLE9cRNyDsLatuTeCKSP
 +6TC/kYVFhwX6DEN4u8Z07B15v0cpKKlAK1jY6yf+z3/1OPUjhLy9lzd0
 zhCOsFZ7HF1xJ7JUttekvkYSSVCebwMtx/xDxPQ573wllDtI5vRgmCOv8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="348507621"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="348507621"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 15:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="1022880669"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="1022880669"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 24 Apr 2023 15:46:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 15:46:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 15:46:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 15:46:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErUcJ1h+4973oJng5prAVwxUk3IFSdQkHOURzJ2M3jousV022SFAzI/c2URCIkYsu1rsvXxUGlfkcuUWKwjf518A77DsknCUC9sQD83ju9gc4P5CJM3J2oxm7Vn8XPEAR/lLxQdZ198SId4kZd9och2TJgyuWGNVpCTvrFmo5lJa0/21gYj6pklTKRT23AI7lcrzmPn0NDobz5c82dO4SYbxL1CmxFxzSJTkzZ0vQim5eFYYYiQepfZHiq1mJPIejCnc6rzt+9QV2hn3eZWsMhPDxHkJ/hVsiyxDp2iZB8CodejDVO7IoUhWKaZujDopfIFul7fHrqVNKNLOyzmG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+4ryucFFGejXKzTig+nUmpulMsBnwp/S+cLtCoKbGI=;
 b=Yi3yNX+/3W+H5cdZ7MaVy56z7wDxSyUmwuIfsu8IOK4UqLS7NVfuTuMpLLhHhv9l7FMRhj6FCemT15Al6ZwxqexXOvMEJKZmEdzGqZGndh7xEjSqz+ttfe7fGrpbervtWJ8IG4fshU7nlrsiLBsxy4XaCUL3Yf/YfMFRlEBNrB0aNc4CQo5RFN985Iw9O5dSKuNAECYVrtpyKx7ePP8F6repr/+B7ifgFz3/emPGBqFt9WYJHmokAtzqQo63ihO4NPPgrFfJoMMIUASSPrA9D3cCt0qAfNwSDd36T4vNpvmvFPzTm3NI0NPeaEPAS4C/3bNd0JHpv+CC/PUDWLcpvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7916.namprd11.prod.outlook.com (2603:10b6:610:131::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 22:46:23 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 22:46:23 +0000
Date: Mon, 24 Apr 2023 15:46:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20230424224620.GG10045@mdroper-desk1.amr.corp.intel.com>
References: <20230415040906.13230-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230415040906.13230-1-jose.souza@intel.com>
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 04537234-862a-4988-0233-08db4515ba96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rgOcw5pkWfT9aAZfbUtFDNPyS1mxc2pxKX51lk/l7MuJn0wL2Uq2gQhsMY/Z9XU7gqZMbiuOsy+j9Ab5guydRxEJe4kOv8xT80joH1Bn7zid2EVF9KWROa5uXyhOOYtVHK6z1v/mnijXuFi8V0sWJTlYKpYiuCftrarJxWVUsePMaRXoLzhMZCPs3QcO6YgQHtbWYNw7PS03TaSesqmvdaMHhUc05eA/2dsrrCp7HxYw1D6wuT7hjexqzN1QzKcDVplpcnAmDqbKA32V8yEAEh5q40+S8IGcl+I6o+4kLhRoLXjDcIhQtH8tViczxPqEVu9YrbpKAShWTAWBWyEBUq45hIdtBsYUSLpf7GiXqouMDQv3FQ7ZW1BKqQ1qbLa93Dzh5X1Vh1P/SXfYn8Jx9lSwU6Ptil1d6rvv9kbO5niq6A7l/W5FI9HXNPKU8HqEFPlzOOV2/HCwFUnZ+rL9DX/LY4dHcgm5PJROn/O9+UQfPjxbsiUQtMtLpVGezeUr/cHwCEYVL7EbGayym9Y7b1z0an0chqMv0BVPUySxf6k5+tIAcFF+chqMGzmHCHzV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(478600001)(82960400001)(316002)(4326008)(6636002)(66476007)(66556008)(66946007)(41300700001)(6862004)(2906002)(8936002)(8676002)(5660300002)(38100700002)(6512007)(6506007)(1076003)(26005)(86362001)(186003)(33656002)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eG3haNrL9xyghLsk1afggY/+vL99qiowXxrL1U/iZprB9GBDejCh6aTxyI?=
 =?iso-8859-1?Q?nsBXiQw1dyEO8SzUl+jeRSR9mx3hsWtLEFttSQ8VONt9Cofk2LW0U5LPn8?=
 =?iso-8859-1?Q?MmmfKGLo/V0rlz8FwAFlGwPSfBB9gPitMnn6e6O6q5nuAZ30AuXCuFVuaf?=
 =?iso-8859-1?Q?qlX6iOVyEYmMCJDF/4UMz6zj22lnJjn7PdruVfIL3Rsn0fA2EB/AJsyoO0?=
 =?iso-8859-1?Q?n4yOr0gmNYxlQm5WSJTByH46vkDy22wEtSJP8qQewB5sLdKH21Ya11AUUr?=
 =?iso-8859-1?Q?lj9kdJR6Pvda//0dFSGv6DEq3YQLuEQSaeEWdgbpo8/uSH3AhhoIaZDghr?=
 =?iso-8859-1?Q?EYFU4svymEwJbFrh97II02UIkg+AMtgEkkP/20ZvR1K6ZWgEPJpKKyAV3k?=
 =?iso-8859-1?Q?fkCfgCk7SR5Ww5nnzAcOVf5aNWN2OaiO+20gG1+9hvtABDGycD1/m/O6PO?=
 =?iso-8859-1?Q?tVIQWlWnrOX9U6UDH3TCRvEflwiV6cFX7JPJ6mL4VqeDpKSDdnLA0GLvyd?=
 =?iso-8859-1?Q?hIZTEfp2l5OIdvaaC7wXgveejmpIQsYvvE1Fu6SkBq5cE5v86c6Rd46D8e?=
 =?iso-8859-1?Q?5VUxbyDQ5PlP7JTkRsTCnfmPMLVvuydMT9KqW1/4kHY6HSdp64GC5fRnwy?=
 =?iso-8859-1?Q?VCEmc1ppL7eP+jNb9bbUcrYUU+OO/kCTRMJJSuR4lVprlrFLhPvyIFZqB5?=
 =?iso-8859-1?Q?YQCSmEvv/YY6sVObSStzKy/LEBvoy5rwhWe5YRPoBPR3NEptFiQsQlhnBC?=
 =?iso-8859-1?Q?VOKvshivL9v4jkN08dWLwXt8m1q8Jx+Nrbyjw4J2kWcoUGe3f3CD6LXpGR?=
 =?iso-8859-1?Q?T5QFCoi/14n0xoWYTT/BznCOSP6/JPNbXvCybsAU3wVduJkFagqllbUv2D?=
 =?iso-8859-1?Q?RZVhGkc1T3w4n8xL5uO/LDg4tHEG2JixciOqcVEj9+Hc0QKjVhBQansI4O?=
 =?iso-8859-1?Q?AFqhygNjK1eGl6D4vOVFYYXNXbYfW88gr0HgaDU2kPJmOWoKvEd07jvYEu?=
 =?iso-8859-1?Q?RffhfpOCnVxZamFjSBiSvVVGcquuIuFP+PFxbjcEJcO7o9vOdNnW8JNoZk?=
 =?iso-8859-1?Q?KCav99p0dXewS3jiA09Z/5vMDoXFTVQ8FGWHRQPnFnNGbnLP1Zfo/Rikqy?=
 =?iso-8859-1?Q?pJ568P7T9+FmTp/kvXLJs5LSdYsAY1gVOvl3955wS/xrhsNZLqqDo90+nH?=
 =?iso-8859-1?Q?k/BBULeDrY4d9FXyyjtoSDuy1w/37pBRwesIu0xhO7Vc2PPvUwQVK79MYY?=
 =?iso-8859-1?Q?u6lB0xFGda4sMSwD9i6xsujL23vaRwvxerJoFAPChlpWhdvY5Vxc22ukH+?=
 =?iso-8859-1?Q?PeXqXLcDdDpyDhaQV7MDfUQ/QVmcH92WRxXjoe0QqGi5/8/Mck20K0iTN6?=
 =?iso-8859-1?Q?buHpR4JTJGggO7aAfeD4dWAYCegKBp+Eez94vq8d84V0kstQZHnukN+SQY?=
 =?iso-8859-1?Q?Rirh59mj5Hh3IZXlVf89yu//CVoa6Lu0NcUg7/vzcq0zKCiYP9CXtV5jNG?=
 =?iso-8859-1?Q?mjzSK54CT4YePTmRguL7iO+skWNUDnQKvB6hqXR2WCPOxgRe/71L7OHPEh?=
 =?iso-8859-1?Q?MfDxTE42L1mbCUpfvrzkpzFnxHFfPCgjrXA96zlhEgVbHRkh/sEeUdgGx4?=
 =?iso-8859-1?Q?8KssKfpZ/o5JNcAjMgn7Bd2TDm+TLUiyMbucrXN+Ex9dA7ayCqGaNvlw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04537234-862a-4988-0233-08db4515ba96
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 22:46:23.2924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POJg0qMyTIxpy8JF5B0zTz3KV+8IZLkYn73UNUsam3HC8DT46g5YgWauUN1fhYuWb79fveGifklzAf1BKQLkrRlziVVGyyy8HXNCIH6FE9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7916
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Set default MOCS value for cs
 instructions
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

On Fri, Apr 14, 2023 at 09:09:05PM -0700, José Roberto de Souza wrote:
> CS instructions that dont have a explicit MOCS field will use this
> default MOCS value.
> 
> To do this, it was necessary to initialize part of the mocs earlier
> and add new function that loads another array of rtp entries set
> during run-time.
> 
> This is still missing to handle of mocs read for platforms with
> HAS_L3_CCS_READ(aka PVC).
> 
> This was mainly copied from i915 source code.
> 
> Bspec: 45826
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 16 +++++++++++
>  drivers/gpu/drm/xe/xe_gt.c               |  2 ++
>  drivers/gpu/drm/xe/xe_mocs.c             | 11 ++++++--
>  drivers/gpu/drm/xe/xe_mocs.h             |  1 +
>  drivers/gpu/drm/xe/xe_wa.c               | 36 ++++++++++++++++++++++++
>  5 files changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 2aa67d001c34b..cc874348f76bc 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -89,6 +89,22 @@
>  #define RING_EXECLIST_CONTROL(base)		_MMIO((base) + 0x550)
>  #define	  EL_CTRL_LOAD				REG_BIT(0)
>  
> +#define RING_CMD_CCTL(base)			_MMIO((base) + 0xc4)

It looks like this is at the wrong spot in the header.  An offset of
0xc4 should be much higher up.

> +/*
> + * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
> + * The lsb of each can be considered a separate enabling bit for encryption.
> + * 6:0 == default MOCS value for reads  =>  6:1 == table index for reads.
> + * 13:7 == default MOCS value for writes => 13:8 == table index for writes.
> + * 15:14 == Reserved => 31:30 are set to 0.
> + */
> +#define CMD_CCTL_WRITE_OVERRIDE_MASK REG_GENMASK(13, 7)
> +#define CMD_CCTL_READ_OVERRIDE_MASK REG_GENMASK(6, 0)

I'd be inclined to just define the field as the specific bits we
actually need to set in the driver, even if the way it's represented in
the bspec is a bit confusing on current platforms (on future platforms
they've cleaned this up doc-wise).  I.e.,

  #define CMD_CCTL_WRITE_MOCS_IDX_MASK          REG_GENMASK(13, 8)
  #define CMD_CCTL_READ_MOCS_IDX_MASK           REG_GENMASK(6, 1)

Then people don't get confused about when they do/don't need to left
shift the MOCS index; everything in the kernel driver can just use the
index.

> +#define CMD_CCTL_MOCS_MASK (CMD_CCTL_WRITE_OVERRIDE_MASK | \
> +			    CMD_CCTL_READ_OVERRIDE_MASK)
> +#define CMD_CCTL_MOCS_OVERRIDE(write, read)				      \
> +		(REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, (write) << 1) | \
> +		 REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, (read) << 1))

I know this comes from i915, but personally I don't see much value in
these two macros; it's easy enough (and more transparent) to just OR the
read and write mask/values together at the point they're used.

> +
>  #define VDBOX_CGCTL3F10(base)			_MMIO((base) + 0x3f10)
>  #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 4186f7f0d42f5..126434b4c3d7b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -390,6 +390,8 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	/* Rerun MCR init as we now have hw engine list */
>  	xe_gt_mcr_init(gt);
>  
> +	xe_mocs_init_early(gt);
> +
>  	err = xe_hw_engines_init_early(gt);
>  	if (err)
>  		goto err_force_wake;
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index e09c6242aafc0..b1a522bd1b418 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -517,6 +517,15 @@ static void init_l3cc_table(struct xe_gt *gt,
>  	}
>  }
>  
> +void xe_mocs_init_early(struct xe_gt *gt)
> +{
> +	struct xe_mocs_info table;
> +
> +	get_mocs_settings(gt->xe, &table);
> +	gt->mocs.uc_index = table.uc_index;
> +	gt->mocs.wb_index = table.wb_index;
> +}
> +
>  void xe_mocs_init(struct xe_gt *gt)
>  {
>  	struct xe_mocs_info table;
> @@ -527,8 +536,6 @@ void xe_mocs_init(struct xe_gt *gt)
>  	 */
>  	flags = get_mocs_settings(gt->xe, &table);
>  	mocs_dbg(&gt->xe->drm, "flag:0x%x\n", flags);
> -	gt->mocs.uc_index = table.uc_index;
> -	gt->mocs.wb_index = table.wb_index;
>  
>  	if (flags & HAS_GLOBAL_MOCS)
>  		__init_mocs_table(gt, &table, GEN12_GLOBAL_MOCS(0).reg);
> diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
> index 63500a1d6660a..25f7b35a76daf 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.h
> +++ b/drivers/gpu/drm/xe/xe_mocs.h
> @@ -11,6 +11,7 @@
>  struct xe_engine;
>  struct xe_gt;
>  
> +void xe_mocs_init_early(struct xe_gt *gt);
>  void xe_mocs_init(struct xe_gt *gt);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a7d681b7538d4..5ef3561101466 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c

I don't think this is the right file (or function name) for this.
i915's register programming infrastructure referred to everything as a
"workaround" even though we wound up using it for a bunch of other
non-WA things in the end.  In Xe the RTP/SR infrastructure can be used
from multiple places, so we're keeping xe_wa.c focused on real, official
workarounds and putting things that are more tuning/policy focused in
xe_tuning.c


Matt

> @@ -631,6 +631,41 @@ void xe_wa_process_gt(struct xe_gt *gt)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
>  
> +/**
> + * xe_wa_process_runtime_was_engine - process engine runtime workarounds
> + *
> + * For workarounds that program values that are only available in run-time.
> + */
> +static void
> +xe_wa_process_runtime_was_engine(struct xe_reg_sr *sr,
> +				 struct xe_gt *gt, struct xe_hw_engine *hwe)
> +{
> +	u8 mocs_w = gt->mocs.uc_index;
> +	/* TODO: missing handling of HAS_L3_CCS_READ platforms */
> +	u8 mocs_r = gt->mocs.uc_index;
> +	struct xe_rtp_entry engine_was[] = {
> +		/*
> +		 * RING_CMD_CCTL specifies the default MOCS entry that will be
> +		 * used by the command streamer when executing commands that
> +		 * don't have a way to explicitly specify a MOCS setting.
> +		 * The default should usually reference whichever MOCS entry
> +		 * corresponds to uncached behavior, although use of a WB cached
> +		 * entry is recommended by the spec in certain circumstances on
> +		 * specific platforms.
> +		 */
> +		{ XE_RTP_NAME("RING_CMD_CCTL_default_MOCS"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED)),
> +		  XE_RTP_ACTIONS(FIELD_SET(RING_CMD_CCTL(0),
> +					   CMD_CCTL_MOCS_MASK,
> +					   CMD_CCTL_MOCS_OVERRIDE(mocs_w, mocs_r),
> +					   XE_RTP_ACTION_FLAG(MASKED_REG, ENGINE_BASE))),
> +		},
> +		{}
> +	};
> +
> +	xe_rtp_process(engine_was, &hwe->reg_sr, hwe->gt, hwe);
> +}
> +
>  /**
>   * xe_wa_process_engine - process engine workaround table
>   * @hwe: engine instance to process workarounds for
> @@ -642,6 +677,7 @@ EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
>  void xe_wa_process_engine(struct xe_hw_engine *hwe)
>  {
>  	xe_rtp_process(engine_was, &hwe->reg_sr, hwe->gt, hwe);
> +	xe_wa_process_runtime_was_engine(&hwe->reg_sr, hwe->gt, hwe);
>  }
>  
>  /**
> -- 
> 2.40.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
