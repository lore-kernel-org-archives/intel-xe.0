Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78964EEB570
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 23:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F114110E213;
	Fri,  8 Sep 2023 23:02:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786BF10E213
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 23:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694214167; x=1725750167;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n0k8oGgaBnnWJMihGoW/uXl1uz6GktqMucvWD9PMGfE=;
 b=fxSq9BIccNELVTq+KvISKTBlHucfjydOP7jP+Qa0wwQx3+LbGXGDixGK
 gagQ88iDybSCQ9YCszj8K0krarZFLqw46Pox6ozTJTFgasuQh+VGdJkd/
 WCRrNRq7yd59iYI+gf0i6iRCcLmP58OifDeu/GfWtM6Zqk+2olVasvkTa
 s1RtSi4Ng1AIlFiKI4P7YmOQN+Qg613lme7D+Y34Td5W4WpKvGwWvNFDM
 +ALmfshLo9fj3zCbg2agopNjwwl7O8qbDjHyDdhlWqcYRrYtt/VJhTlqj
 BQVtMHIEgds5TMumTuuSYLSBxg8iup6hvi8rtla6Thfef1qM/JAPGpwsL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="376673654"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; d="scan'208";a="376673654"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 16:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="745765317"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; d="scan'208";a="745765317"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 16:02:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 16:02:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 16:02:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 16:02:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 8 Sep 2023 16:02:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHUB2TXN1rfHgAzGTzCixO3zaDMNKNx3CmIx3ME4W1kLL9PCCu9dNCVhHswDJN0vN0sO/TWEKnyUYyCNTwHaFkfc/h1byvgDz+/P8HUmrIL7EK+06A2UrPSJhq7vm1xIgJAr2DcZISy9v1viJ+PH+9UChrN2zo+1ZHLaIyEOvtSro47LJmWwKRrYiLtBIxHIsncElrc2hGI4dQ1m0csJSp/Q9GfwhVgLeCFbRiKxegEs3pfJQXOoszjNEG8kWdbJhP1qBdnlh4XRoP53tNz/9EapHBrevemM9tJ9oHkKa0OQO63Y+ucwHGfljdpE6mhiRP81bxjJB9kYXqWYuBiu/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7IK5WHCuq727J51BUF9KV4J8jfFD3kli4JgSn0PNjQ=;
 b=dhIjJXO+BjzStsBUM60lgujE/iULHpfq+aUpubEhLLzS0HJKRKRvSleoLpKqb6Od9KYs0Sqv4f1BOujlSy1HWtzqCp1zyZ3KoYRFcvRdH4Rr70h8wwxL2ZV0rtLYFyq96mzUFdoCGopGUelcY0qYPxZ1qFxbSRgfFW5hFu+uuspHcwshQZdWVqywTbvQQYiroNYP1FmNVX8ZvmH8h4YYjQe5GmNm8/SQ1B5xkMLhnRCwwZLdz1n4EBABvc4QzB2PRXxpcoHrhQuPaNFiOyRWMy3mDKJQTx1EEsTMErqowESJBTcDZM2tzgqQQ38C5+CdhksiLNomz04RppMoqB0hRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL3PR11MB5698.namprd11.prod.outlook.com (2603:10b6:208:33d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.30; Fri, 8 Sep 2023 23:02:18 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6745.035; Fri, 8 Sep 2023
 23:02:18 +0000
Date: Fri, 8 Sep 2023 16:02:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230908230215.GZ2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230908225227.1276610-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230908225227.1276610-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL3PR11MB5698:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f5c913-ae63-43d3-ffda-08dbb0bfa658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 617t8gAOQJo7AT0xNkDGTVAA8kIDC8yXiVckU1lW0FRScb0CLUG33ctuoqliaB6BmI8Qd5hXUh4oQGkvEPtLVSGwQ57QOlIwk6MIbGpELF+2GHNqUNW1GvBPVYjaNrdBiZbzzQdpUnIyNvMpPclR0ssGLDH9a5N/+cicR0KBZktYRmKkMw2PT3zWHTRJH3qcKa2/Emt7+QI7ulxgxgrKKk2MTViBfxvuUJ4mPw5zaEBS8NvVlLGwLeuG1XzaI9XI7UZY1hhpSJ+nDgJKE73G2+rKUlfiHvwtzfnKZSxq/aj9RTmkeyEU22MO3bV/rpZPyhJbYjbtulLi9AWruZRMjD+F7diHn4AuHodV/J7Og2lC6aU0MKSBE3UNn3k4C32rSMNuaTTWH2Syq95QhJ5df7TFDbb6f9qqT1g6pXposkiz8+UDwmFA2l13J18+Pjo7ROIZmumx28n+X3B1sgyFaXDsBcV1pTzCTpSdHwe8w0h8eP2VnBOqFEHkUAS7OhTUOMBjOdtE6BsRqJpZDu/3FrD9KqrGsfhZVmafm/jtjrn/8dOjHlx/frwMgV2cLlf/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199024)(186009)(1800799009)(5660300002)(4326008)(6636002)(6862004)(8676002)(8936002)(6506007)(66556008)(15650500001)(6486002)(66946007)(316002)(41300700001)(66476007)(478600001)(2906002)(6666004)(6512007)(1076003)(26005)(83380400001)(82960400001)(38100700002)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b0NGKnXwN8lXIQcpmSvn9pURBnMIT3uRJoc4ysk1+ieazUvh91Fap13Q+uRt?=
 =?us-ascii?Q?bhhZ2lwOw2UA4zCwJp4R7zLG+loKK484XJGSpp6KK9axB/4OEw1d65sbh3XL?=
 =?us-ascii?Q?xpTUnVP/WBWu53smVHm9pn3Wt6+7NfOPEYvf4EXOPkkWKL6AgTWH+L+/hbM5?=
 =?us-ascii?Q?irVEFlNAa1B+k5V3RDsbW2w/goE4KdReoiDxMLdXQ+dfpVLMFsAqKTSJ3q0K?=
 =?us-ascii?Q?kWe1NvV19Jdu5RomhQK3ldu8m2NH7yfBBRUAVSWS71GsM+WN0dp8TXjw6AU4?=
 =?us-ascii?Q?6WV5wFlMuv3EPFX2WHhuchdEuOVb9nla4EclRgdaMPqsdsJV//ZZTAe1Tbvl?=
 =?us-ascii?Q?LH+g5P7qLOwDl6s9ksS4nMfHnACTEtnKD9JOXqpaAT2nQm4CIHcmiB/Zd1Gh?=
 =?us-ascii?Q?oujkfmEQuPqr+/mW33/XgCE+Nro60WcQ0R7W75+qbn4zJ1x4GcRt58ycXYJK?=
 =?us-ascii?Q?AE88HSTCiE4BQm286EFQQuaGOg+w7N9hAq2cXAtMOOKRqqxBtg6Z9KtGR8pY?=
 =?us-ascii?Q?wcVktNp33pkfcW/h6kNP9O3RZlQxwMbl/4vnNM896gbN0wf6U+T2qOJzWYym?=
 =?us-ascii?Q?fE4DvCLg9Lay1FJ0D+WtObVh6LxQR4u55h8yK4PhXstqJfMX27Qc5J8PwLFO?=
 =?us-ascii?Q?s41OV2pcPRJ2e/5rfvKmGlkn9lwoNaIcVaBOn10UmvJVfO6ZWTgY6IWhX376?=
 =?us-ascii?Q?xXW+AW8wukczSelpxx/gR4BGb/silcdjInOKy//XnTIF0XvcPmKOUwHXloF/?=
 =?us-ascii?Q?CGhiWQwFNTpKKn856lEXvr3KI5TfXL7Pt3WkmbI82V+fMwo1+EhzhDlZ4G0p?=
 =?us-ascii?Q?jl3zT11onP8V6GOv/OMTl7ke6mp+/YIf1qAYlL5CJk5FjKt8kCOtMa73cEW3?=
 =?us-ascii?Q?DsesdYsG96WbAaR2H9a33rDkFsEGm6zMt6r36DOZ6OAcFyrMySHbRRpiQTUO?=
 =?us-ascii?Q?X92OrCF/xrt9kvONt3i2K6W3DY6SZI6nrVhD1vl/XLPBr5L4Gy1K37BqvTDi?=
 =?us-ascii?Q?3EPeVjVE/cCNjQRucZkXscf5k7REqMqOMoQUvitxJ/6eN35vMah//yJ6rGZt?=
 =?us-ascii?Q?eHoXNF/xFWz0JU6NNQACHxhOzZk520XQ1h6PlmaAhGgXwyjE7s9stsBHmEC7?=
 =?us-ascii?Q?ynLsc11MUW9TK45R57KV6oS991q57Im57c4DTpZMc0WcRIdgKDz8QQCEdVrF?=
 =?us-ascii?Q?STvlxxoKN2NV1lO26QvPsD53zDrt6hnuo7f0tT+volYLozw0IevSOcI6mMEq?=
 =?us-ascii?Q?Ui+rA2FMV8JCRWT8giVDBBGAiz7NBLEzN5N1/rbj4lPwdEjk4TX/fV2wU/mZ?=
 =?us-ascii?Q?Lmjd0qpRc9wjLvdWCNb6xvHd9qEurVAbJERAnf2kaA1MNXQABh5JnSZp4M3y?=
 =?us-ascii?Q?+hJzRcIuFEm+WaljTmhSaNZ7+nOLgsqdo06pQ/pEdw6847w9oRgJlytQFTj2?=
 =?us-ascii?Q?JnQhOHfoTlfJTSwvUcp0ht5vUSy4mC0I1zojr5p1QKzZnkyM7oc3F9EOthz9?=
 =?us-ascii?Q?SvxQsx/76rPqmh2Yz535362BtyP+eJFrAjUgzwVriPx9C2dlxX7SDEqWcJU6?=
 =?us-ascii?Q?Rf/US7POvhhTpO1fQhqHdT4L+XCetVtgP++Q2YUVeSNpS2FEFpqnrUE1k45C?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f5c913-ae63-43d3-ffda-08dbb0bfa658
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 23:02:18.0109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1crPTS/TNO7NM+ZlZkrwL4tbr11tTeoycH9LrH0yUGSCVUtKVz5sr8AFB7kJRAaerV+2Rx3LWbtB4YLrlfYwgtFBObpDfYl98bVb7VQqpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5698
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mmio: Account for GSI offset when
 checking ranges
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

On Fri, Sep 08, 2023 at 03:52:27PM -0700, Lucas De Marchi wrote:
> Change xe_mmio_in_range() to use the same logic to account for the GT's
> adj_offset as the read and write functions. This is needed when checking
> ranges for the MCR registers if the GT has an offset to adjust.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 4 ++--
>  drivers/gpu/drm/xe/xe_mmio.h   | 6 +++++-
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index e74d3c5743c8..77925b35cf8d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -448,7 +448,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  			continue;
>  
>  		for (int i = 0; gt->steering[type].ranges[i].end > 0; i++) {
> -			if (xe_mmio_in_range(&gt->steering[type].ranges[i], reg)) {
> +			if (xe_mmio_in_range(gt, &gt->steering[type].ranges[i], reg)) {
>  				*group = gt->steering[type].group_target;
>  				*instance = gt->steering[type].instance_target;
>  				return true;
> @@ -459,7 +459,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  	implicit_ranges = gt->steering[IMPLICIT_STEERING].ranges;
>  	if (implicit_ranges)
>  		for (int i = 0; implicit_ranges[i].end > 0; i++)
> -			if (xe_mmio_in_range(&implicit_ranges[i], reg))
> +			if (xe_mmio_in_range(gt, &implicit_ranges[i], reg))
>  				return false;
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index cd9fe08ccf4a..9e0fd4a6fb29 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -127,9 +127,13 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
>  int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  		  struct drm_file *file);
>  
> -static inline bool xe_mmio_in_range(const struct xe_mmio_range *range,
> +static inline bool xe_mmio_in_range(const struct xe_gt *gt,
> +				    const struct xe_mmio_range *range,
>  				    struct xe_reg reg)
>  {
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
> +
>  	return range && reg.addr >= range->start && reg.addr <= range->end;
>  }
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
