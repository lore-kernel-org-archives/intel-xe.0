Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05676C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 00:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E9110E060;
	Thu,  7 Dec 2023 00:01:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300C210E060
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 00:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701907313; x=1733443313;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UToFGg6kM/1b63ryPYLzDWx1XJcfrfTHgWKez17d1PE=;
 b=T+STcPKLNceYqrrIRjSYiGYKQB9p0o9L+nY/n1YXzEmVVKWshxdyfAg6
 jxVOEJ5E6rIEgknJSb9EdryFsXDKTh77xvhLhFAQKcjo2VXMkSM4ewZiO
 ju2y0aU15kqW/j047teRqDxBv2jwJUF1vL3MK3KSMieMN/p/uq5+yHiJu
 ohoJdFCjEfQmq3qsP5yz48Yi+iHC4A3085Y7Vp80OoOJnor/kcLMLAEDy
 74UXncWiAP1c0ULytih8BZItBf8O4s3JzCQcEvipaNBglSx0U0B6m3Q45
 ea4hBKzlPW6iBpkws84q/nPFQ6N32SnZYbYxj7miSSJpL2Sp/02T7YJve Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12860499"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12860499"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 16:01:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1103001317"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="1103001317"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 16:01:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:01:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 16:01:50 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 16:01:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htia6vZ2fXy51QhxFTqB3Aa8fVIUoeSKdqMYqFjJIUYIgso2f/ZiP+TlfHmtOAqj4V63sk0k6XTYtDPeOEklhf9xfwl8Nc1LJNwO8S0vz3INAe474TAn01zfZRPkah+NmvFc/24xCA80AuYurCM4kHkomM0akHAI2UsJNBCJowATyZAQndkaOh55+31qSTG5e294F7p+os9TTzY17NSE/uc+s/MqPzkSHvjkGjSjwp3OUdYnpizbt7MMyOkKqYVX+nvoWc0JaTJTV3d84l+mN3C3adTONQNOCm5oXhKedtq9Ad0LkooEbK8eC8uZkO0S3d8LXCmjp5xmma9hSQYgxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uke4JmY216SQXW1hTjuAvcLBxRC96PMbe22vgjb9kHY=;
 b=T4WBlx0eXJ3mCigEa8EzySIVFjag2pAR0Vrf7iE0zluP3tT+K43dR8xJHjmVXVufee1t+lAyvjPi1Olh0Pgn1dUmN3ZEZYY1pHuCC+8Tge/ew4BmD52NIzZfQpvQfjm+zVHTW6d4hCkVmZKIz64NwcprsU/sN65s2F4An5qKOlxKlZkwy3bd7j2+iqE4iNPGC44RS9gUl9+ha/Vat7fGa41kK+Pb5gVnwYbaXBmkuPdVOd0r/AG3yvgXDMwQnQyxzBABE5ejdFly+C8+TZwnDleFuS1U1LqJA3HvNIFMsnZn1JU06Is7WjBn9KQE90QGuJiCLpjk3+7oSL1J1fMQ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6858.namprd11.prod.outlook.com (2603:10b6:510:1ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Thu, 7 Dec
 2023 00:01:48 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 00:01:48 +0000
Date: Wed, 6 Dec 2023 16:01:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <20231207000146.GT1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-6-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231206043126.984049-6-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b350764-ce88-4efa-e20b-08dbf6b7b530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQNCMLRq1G8mrgtX2YfExww4Yz2tpviuzyaFa6fyyO0FeZAriZnAQbQqoqowlLLY0vPxgrVkMWrBInUfdwSUvF6izZ2Kd5eEoqeS7cWvk4dTqq1eqOW55YapcRDUMiKhjhq3CIyK4x3aSEC49C00xZijE+WPWuwtO+ktpmoFYWdm/N7tFnoryvRNG/RMbsPi1c7Ah3KSeL2rw+56ztqJtnUQaBAi+dWlVNT7c9MAZgmrWuFbivoO9eYQYNA4+ECc6DJ3/DcweN0dDxAOGBYJdcNqFJhe37i0kC8sGPaQapfU3Ccvwy+UBX9o8zWlA5zoPegsp0XGchlouLuobt4GgzSIeMpqNgDQnVE77OtmR8rm2Nbnkof+pqLmgEnGWSbyaekWX52CAeUmALj38CV2hmQoVDHZgbR0+wZPiDY+C+AXQPXcLfbpSH0uztpKkITVBtCQmB9s1y5mwbxMMFSLlIh9SJljSiVGifVmbjRJuBr1dzy/OWjBQuSu7rgJbCM5Pgf1wp8Ftw8Pd3DLd3fHxfnJbywNsQ6vMqua0ZB4c/iI1U2Gpwob+CkhMn+cHmGv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(316002)(6512007)(5660300002)(15650500001)(38100700002)(2906002)(41300700001)(86362001)(33656002)(82960400001)(6506007)(66574015)(26005)(6862004)(1076003)(478600001)(8676002)(6486002)(4326008)(66946007)(66556008)(66476007)(83380400001)(8936002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jxqO1FRJ4rKYvcFCuDmmWyDsCTqI8fmFqoPVKgzm/H0rupcJ1zvwjuipD0?=
 =?iso-8859-1?Q?H3XGTaKYu2XI6KHAptiaIk4xSgIMWXVwHdKsOYnHi6bxB0qfPi+Nd6YLlP?=
 =?iso-8859-1?Q?3et1sHHMjcWRWtJwIAHM95kWBT4yMlbhJJR8awV4cFSPGToI84Ahdwes0/?=
 =?iso-8859-1?Q?mOnzNDFyusQM9UcEt9Mc4oEeYNsPqUuz7Q+5IGzpKTOCa1DmkRfgXxlTS3?=
 =?iso-8859-1?Q?rWTlbMN8eNZYnyEfEItRj94uL/6CoUoNgs0mgNUu9FefDm8VqAaRXMjSdO?=
 =?iso-8859-1?Q?GzYDrnjKlicbso6ISSrCBbIW+9EKQQralBnACh0r74plaFFhwhJrhxBevV?=
 =?iso-8859-1?Q?VGhaUuiThvPfC2EH/+Fq6q46wp+LXVC9cmh+uGFO+LiZ5p/SDH2G4wrtsz?=
 =?iso-8859-1?Q?QP5jEC8TY1x8mSTyuJpPt255QmBdGrmf5MWtnQWovQHa+2rTtjAMrctVFs?=
 =?iso-8859-1?Q?XdLc2cQhKKU2XDXN+0n6JLCExlWBjEMRVy7urh5Vdq75xhG25KH5QeQP42?=
 =?iso-8859-1?Q?nttp+VWNvskO7ahxSKXcM8ss0d+9L8DQsaLcYKeLTbhuPoOVR+dcqQ4kFN?=
 =?iso-8859-1?Q?NNDoIWXactoMJhFlNH/R3x/15nR5+u8T0sSw3x5l3Gfyd2fc4iWNlb53pM?=
 =?iso-8859-1?Q?qlJoacfUoh0z/cfaS8CZOdTjkG6He2HsT4s0JSNuBeSnqigMuTpK1Y95Sv?=
 =?iso-8859-1?Q?bMIUByrPr5gRBoMraSrVSDYaPOh0qM8hmmwrA8RLKLX6q96OxVQl5Ke/Ue?=
 =?iso-8859-1?Q?TznOcwsskVIt9819k96SH6Eenu7rCDaOh+9wINp6ueNjtG6kzsq/dev0n9?=
 =?iso-8859-1?Q?4kCuXG7VH2XmxrikJtxZ9xsmKBQO37VToQnRRWIWYUjTDjYmnLYa/n0xcf?=
 =?iso-8859-1?Q?GMBKIgAjEy8Kkr04HUzOQcoCqKKcpfs26Sn7p4l0ii2Jsh2ekg1b9mq8dY?=
 =?iso-8859-1?Q?O6GkfWwuS3Y7LQ63GALQ49ozWMVaVMb60QqSpHSJNF1baU/+pQ/Am9biUp?=
 =?iso-8859-1?Q?KFvrTzpKa6GM9TDxkG6Kqutz+0/ztXXWyu9riQlycysOJbKcbsCj8wNNnJ?=
 =?iso-8859-1?Q?cQl0fJd/3WuNfAvWylWy1Md+qwdPmnMg3c2P35pA8E6/eeG+QVoXX+EReL?=
 =?iso-8859-1?Q?QzM7uH5KXcxRW4kRH684LJlQNhkLXsYC30wXXpS3rQ+fTooJPh55lln45Z?=
 =?iso-8859-1?Q?ReJ7Cp0otCuPMyzlDhfJjvyg6Ho4EQcR80hYqYNDCL9xb1UH7ykq+eXct1?=
 =?iso-8859-1?Q?0LoH+5R/rbfELIOgrH94h7UiYL2RIGPKJVZgIKG9+01q3DY87FfKqJXIS9?=
 =?iso-8859-1?Q?E4Jp0EUGdIOFDC+XXNhRdGd4FSZd7GgbmsMal286AmkeQvSzWI8qGU7Mts?=
 =?iso-8859-1?Q?st7NVWCmg47dM9dTF8kms4t1hOUA5eRDMSqdarEiK0lRzVuPTLoxypv4Dk?=
 =?iso-8859-1?Q?ce6kZ0a7qY3KcBS5FhJAooHTejqpEnPcKUgSCfhiS4HAmbvXIK0On+5/eq?=
 =?iso-8859-1?Q?nlIfGOMLnt7JqFqDOU8gEDvXjQFvryv5Pg4irDBPLQpcyjjy28pk1lwvur?=
 =?iso-8859-1?Q?cx2o60xujVBwznmUA/7qGIMRAJWsk1i5MnzMVm0oQD8mld8k4f0pp8EvBR?=
 =?iso-8859-1?Q?RFd/iADXAYGDlLh5gLVIwrXvr9D014Md6fPfpAxEAEapB+Xz/z56A/Fw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b350764-ce88-4efa-e20b-08dbf6b7b530
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 00:01:48.3550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfAYd2/7xafufHQ/0pQUg6JGCr+wmzzyYWgde6vYOEz/m1LH0oAdAVjB2OxQPpSKF10UcfRo+rnlPBzV1sso6w/Yxe6eeYzKZ/jrWiNEKpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6858
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 5/9] drm/xe/xe2: Update chunk size for
 each iteration of ccs copy
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

On Wed, Dec 06, 2023 at 10:01:22AM +0530, Himal Prasad Ghimiray wrote:
> In xe2 platform XY_CTRL_SURF_COPY_BLT can handle ccs copy for
> max of 1024 main surface pages.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 34 ++++++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index b4dd1b6d78f0..98dca906a023 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -672,11 +672,24 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  		u32 update_idx;
>  		u64 ccs_ofs, ccs_size;
>  		u32 ccs_pt;
> +
>  		bool usm = xe->info.supports_usm;
> +		u32 avail_pts = NUM_PT_PER_BLIT;
>  
>  		src_L0 = xe_migrate_res_sizes(&src_it);
>  		dst_L0 = xe_migrate_res_sizes(&dst_it);
>  
> +		/* In IGFX the XY_CTRL_SURF_COPY_BLT can handle max of 1024
> +		 * pages. Hence limit the processing size to SZ_4M per
> +		 * iteration.
> +		 */
> +		if (!IS_DGFX(xe) && GRAPHICS_VER(xe) >= 20) {

Where is the igpu limitation coming from?  The change to expressing copy
size in terms of pages seems to be a general Xe2 IP change that we'd
expect all future platforms, both igpu and dgpu to follow.


> +			src_L0 = min_t(u64, src_L0, SZ_4M);
> +			dst_L0 = min_t(u64, dst_L0, SZ_4M);
> +
> +			avail_pts = SZ_4M / SZ_2M;

What does the SZ_2M here represent?  It's not super obvious.

Also, even though you have a comment above, it still might be nicer to
"show the work" for SZ_4M instead of using a magic number.  E.g.,

        XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) / ...


Matt

> +		}
> +
>  		drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
>  			pass++, src_L0, dst_L0);
>  
> @@ -684,18 +697,18 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  
>  		batch_size += pte_update_size(m, src_is_vram, src, &src_it, &src_L0,
>  					      &src_L0_ofs, &src_L0_pt, 0, 0,
> -					      NUM_PT_PER_BLIT);
> +					      avail_pts);
>  
>  		batch_size += pte_update_size(m, dst_is_vram, dst, &dst_it, &src_L0,
>  					      &dst_L0_ofs, &dst_L0_pt, 0,
> -					      NUM_PT_PER_BLIT, NUM_PT_PER_BLIT);
> +					      avail_pts, avail_pts);
>  
>  		if (copy_system_ccs) {
>  			ccs_size = xe_device_ccs_bytes(xe, src_L0);
>  			batch_size += pte_update_size(m, false, NULL, &ccs_it, &ccs_size,
>  						      &ccs_ofs, &ccs_pt, 0,
> -						      2 * NUM_PT_PER_BLIT,
> -						      NUM_PT_PER_BLIT);
> +						      2 * avail_pts,
> +						      avail_pts);
>  		}
>  
>  		/* Add copy commands size here */
> @@ -923,8 +936,19 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		struct xe_bb *bb;
>  		u32 batch_size, update_idx;
>  		bool usm = xe->info.supports_usm;
> +		u32 avail_pts = NUM_PT_PER_BLIT;
>  
>  		clear_L0 = xe_migrate_res_sizes(&src_it);
> +
> +		/* In IGFX the XY_CTRL_SURF_COPY_BLT can handle max of 1024
> +		 * pages. Hence limit the processing size to SZ_4M per
> +		 * iteration.
> +		 */
> +		if (!IS_DGFX(xe) && GRAPHICS_VER(xe) >= 20) {
> +			clear_L0 = min_t(u64, clear_L0, SZ_4M);
> +			avail_pts = SZ_4M / SZ_2M;
> +		}
> +
>  		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, clear_L0);
>  
>  		/* Calculate final sizes and batch size.. */
> @@ -932,7 +956,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  			pte_update_size(m, clear_vram, src, &src_it,
>  					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
>  					emit_clear_cmd_len(gt), 0,
> -					NUM_PT_PER_BLIT);
> +					avail_pts);
>  		if (xe_device_has_flat_ccs(xe) && clear_vram)
>  			batch_size += EMIT_COPY_CCS_DW;
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
