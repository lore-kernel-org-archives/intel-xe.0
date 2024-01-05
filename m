Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35F5C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 16:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA8710E635;
	Fri,  5 Jan 2024 16:54:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A422A10E635
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 16:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704473674; x=1736009674;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tC23xTsigOtRT2uWsI0M5VFX/lL/7KjyRRP+fO37lZY=;
 b=Om+vnRNouzPjSzHrWV+9r8E1az5/Eu2MECbmpy2vEXbxf/2sUgiUel+/
 l4/XOsPBHCs1i5Rry1rNsvrX98QU/Y47HhC5b7rFvaO2lJnGuxPkFXB2O
 qwZ6WMZvKYmxLrcgVBnFb1JRYEqmA988VIOEpVCtYrgsHJdEHNG+9la5z
 y6TfNiOUTMRgV7S9g4dewcksYJmD0F0Gdd3n8tkYl6TkVAOmUnr8f96QU
 IUpDEWFJk7Dvim4TAyMke82/PpgnzVplQT9Sh3KiyjLcicEbGQE0oas/U
 LmqBHhiBMe91nYPx1eGH3X/9bQijx9PX3gNJkMzL2rDJA8IaT28xfZKmd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="4303712"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; 
   d="scan'208";a="4303712"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 08:54:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="15290270"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 08:54:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 08:54:32 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 08:54:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 08:54:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFKLki1G7Nx8b6fqhVoLrS1cafbtrHr93Wi+kjE79bE3yCRfGysw9q2LjXUR4C1/OTOpUFU9hmFJRpUEEFxj+0+MHsh20nyCXLQS7uVGJStdrw6iGs+95frczJ5WnxedyEXr0EkE4NslQ3I6LziaaIEeffji4h+lR28b+zryfPRuPk3aBoOIbuR4np7hXG0EViEjX9zpT4oue7N8P6DjAs9jwFM9tUywIdsYimb4OdIOO9hFWL95ZMnNduH4wfq0LBCQutSut4E3nfb3+ELjmKMppvL7zAJe9G3c4dZa1YPNoB6BOVADN0JwB22Rw/G4g4pDdi2XToCFY3BD65GtJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Sr6uWPnfnUEgyiNYUsBH12WqEPFFU+s5Rs1q3U/R9Y=;
 b=n6u0lLhYIfTU7s1r7YASNiti1zFkYZgmarOWUN3iCCME78kyt1pLxgQTOQ47K5VuIDFELA/aYiSO6wZ4RtWC0y+48Z8An7RQP8Dt96NY+2PfOXuupMFZ6nH+HvcAWwyva0L7FFkYGVDh0PVBhaq6ZwXed9myVE9C2FWEWmYlVQlRNqDGRPQ7ICWE719APiSoHkMDvrKW8DI+zNiitmerdub8oaqn+gLqhJi/NPPNWyKk9nIemeYdFH6lxvv9wxOKXtZaByr/xVrfmWWjhnM3OJax6sKsZgtLPszx+4yjmCH2D43oUtENTpLuPG1P6Y5i1YsA3z3EPjsyqUBz1+sASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Fri, 5 Jan
 2024 16:54:30 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515%5]) with mapi id 15.20.7159.013; Fri, 5 Jan 2024
 16:54:30 +0000
Date: Fri, 5 Jan 2024 08:54:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Subject: Re: [PATCH v2] drm/xe: Add mocs reset kunit
Message-ID: <20240105165427.GB1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231222192352.927101-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231222192352.927101-1-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: BYAPR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:a03:54::24) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|CY5PR11MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc76fb5-c897-422b-e493-08dc0e0efbef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ei7R4PIGTBxHiuV52I8pl5zQuekg1lutZcJ1QgPgawb/sGlHCq73Mhbxhdzu5HMFOW1AOPOexWcQCZYM6IVmHMp07TeOg1jwc+WRjDg2Oqx8AHfp1y1ywBUndzaoCOVzZVFC2g69c+O66qutQ+xl79TduCJ8VojejMB2A3cVnrAcJJmWz2kSjUxqOtaPkrnB59Z6iml/EXUTokEsB2SXZV59NvUIx85yla5kod6bUNLJvB+y9M1KnOmzwTvP5N2hUAVA7LwmUkvndeoDzUNkSvclehYn+yOg+xLEEERnxsKMP9ojxhti6NOKZ/9vnrKQma//4pkx86s8vkDVKsJMdcINmEFy1yjum0wqlv6TWt4sAPhIDyp/yTChbKwxL0DTXrugkSJwP2cN4fyOqssRDToW1Zdp7Jk/LwD3b/sPYQjSeGb+RkKOioiz5Oqa7bG/xVXIgpIMlQX5WfBE7PGiwuTxEUSCMSB7Pm+l9bUUsU5ECgRhPirKGoswEQprjflotFaGQx7egwBf+/O4bvMvAhM4xSmXFDfUmc32n0QCjjomw0WhMepx5EczzkgdxIhQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6512007)(26005)(6506007)(6666004)(478600001)(1076003)(6486002)(38100700002)(33656002)(82960400001)(86362001)(4326008)(41300700001)(2906002)(107886003)(66946007)(66556008)(5660300002)(6862004)(6636002)(316002)(8936002)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xnjXq2FupKVCrLDuZN0zAuOFAGLyzG0ZfHI1WFTi712XxYULiBwpqpcW1bJ2?=
 =?us-ascii?Q?XvANlV9ig29JhAlOxZyfMyoMmZjx0ly9lLdQkLn+7371kS5BCgdX/dtDd0r1?=
 =?us-ascii?Q?QbpszujyL5LBeqzW9ww9M2uQtqWLYfJbNRwxgl4ztaQ2mMzLfsx3QMeXBwEe?=
 =?us-ascii?Q?K1/OhnFsBlLAoE/ojipcm7EHyW/pxQeLzNOcJPYNX1c1WuUsi011hNKBCfPF?=
 =?us-ascii?Q?yEySEIuVyTUaYsZKN6gQGfXNX5PUcxFMKjDmxneZj4US6nM0Rx07Dcv9JUdC?=
 =?us-ascii?Q?seO6byeA3GuhTdlBkcFLZw5vNQRcuH+Fsw1sTm5MRwlqLi5bUXfS9/e6+g8F?=
 =?us-ascii?Q?VGuti2CvzpWhKALLqvxzfhOpnYlYMDTSZ6tB7uiNp2DLy/b7oGF+P0GOCNAk?=
 =?us-ascii?Q?8ve0uxARV/TujJa6OevtFqP7Z2iB78i1OUpjXSI9OHShX8xSaPoCrbGqIJI5?=
 =?us-ascii?Q?j5vtJ0G+jNC2f2AYMBIvUaybh+FQLd2Nq4Kd0kHJ95CteEw+O43Fq+NPdK2E?=
 =?us-ascii?Q?12yk2i/HzDZxR0rc92ZWSZmeceufJ8ir2ucWk5/jXoWMx0plCut/byNemAVM?=
 =?us-ascii?Q?Osir68Y1484uXbrpoFL/sogIkrSKIBPx/lYneEox+4ge54J/+LVFi1g5ksGk?=
 =?us-ascii?Q?ng2r4vYPYP9GInU2FTzR/lMnM2Ys6BSfEoUtUDubz+cCVr2i1ASO3cR4nwHB?=
 =?us-ascii?Q?L6mu6Rlbpaszw8WQqzFztHKAg1z9EuoGe+VnKLXLyUN7oSfKgedGufAVFdbH?=
 =?us-ascii?Q?nPXEM11RDJCc7VhTwGQ8neyfmnUL6xroKalSKMtIJch1E7scFXIqY7PF/5ml?=
 =?us-ascii?Q?lrgxSyGjJlEi1I6th970D9MAI9AJHHX4RSZFdPq28C+d3XgXG5tCTAca4Q7P?=
 =?us-ascii?Q?MNrGvZNsfP8iyVPoKoj1axS5mMzeUFFZwQ7e/CSuVfT9zlmFw4TL0um6jLko?=
 =?us-ascii?Q?wvvXgdbZPoT8OA5oLkXCxwN0ddVtzKIlBYCF75pnfe3idQx1aeR3pklvW74V?=
 =?us-ascii?Q?+6jf3CXmz2CjN8Dl90L0flY8lxF4g0BPAAnbs+ytJ0Muuo+VOGdMW5Z5ygsc?=
 =?us-ascii?Q?+kzdFtkLJF11U4D4Lhs0kVemZFvkRKJVmlb6fOb1/2iLXLt5UR6fvChaHJMw?=
 =?us-ascii?Q?19TtInFl5KmGJr2rz8zbUSAV+zU61hNNs47ji8U9bpfMvi6IlBmK+eFx39Xv?=
 =?us-ascii?Q?utUUlxGI6/7W4ddzoUwV5DPWLTVN3CCG2Y/nhZCaUpvKOCbEA1bYAnwh9slu?=
 =?us-ascii?Q?yC/BoVM5yptPIkAed+xagfwDC4FUzJYC1c+jWcuSPBEiYmCowqm/4yqEIjCy?=
 =?us-ascii?Q?+Az764vfGF7NGjF4jOHCznpstqvfp+mGtFWsHZEyRLSQMEn2XDu1S/SDlAxe?=
 =?us-ascii?Q?AXko2Omjkh50mBaaSXitvq5GM3HWr+UKo8T+FaRkvCGXFLwAqVwaIFYqfEMS?=
 =?us-ascii?Q?VtxfGNQNwp04HHWuLg/3G7NopoZIRPfhTgByiOF0YZhP4vo2K46LvkFMPj0A?=
 =?us-ascii?Q?u4jq0IlhORFpX/QlDspAOZaNI+HRlFPIjhIsQeuynuYJZD/iWCkkWN+t/zMw?=
 =?us-ascii?Q?fp2vT8p9BVI0yuCWA9FXl5vRumw1UJYJFxc7GW1t4VmFp672p0LotG2GGYbs?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc76fb5-c897-422b-e493-08dc0e0efbef
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 16:54:30.1183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4qznn6u+b8u/KVkgw7RcPoC+g7k/QsdS6LtoPXATSV/T1CsefstHb8LGzs5FAichIV/+bRoDQmX671WCaaI3a5d76WzEXZ9XDNIIJTHxug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6392
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
Cc: intel-xe@lists.freedesktop.org, ramadevi.gandi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Dec 23, 2023 at 12:53:52AM +0530, Janga Rahul Kumar wrote:
> From: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
> 
> This kunit verifies the mocs registers content
> with the KMD programmed values before and after
> GT reset.
> 
> v2: Remove extra blank lines between the local variables
> definitions (Matt Roper)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Looks like CI is finally back up and running again and the results are
clean.  Applied to drm-xe-next.  Thanks for the patch.


Matt

> ---
>  drivers/gpu/drm/xe/tests/xe_mocs.c      | 36 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c |  1 +
>  drivers/gpu/drm/xe/tests/xe_mocs_test.h |  1 +
>  3 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index 7dd34f94e809..df5c36b70ab4 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -128,3 +128,39 @@ void xe_live_mocs_kernel_kunit(struct kunit *test)
>  	xe_call_for_each_device(mocs_kernel_test_run_device);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_kernel_kunit);
> +
> +static int mocs_reset_test_run_device(struct xe_device *xe)
> +{
> +	/* Check the mocs setup is retained over GT reset */
> +
> +	struct live_mocs mocs;
> +	struct xe_gt *gt;
> +	unsigned int flags;
> +	int id;
> +	struct kunit *test = xe_cur_kunit();
> +
> +	for_each_gt(gt, xe, id) {
> +		flags = live_mocs_init(&mocs, gt);
> +		kunit_info(test, "mocs_reset_test before reset\n");
> +		if (flags & HAS_GLOBAL_MOCS)
> +			read_mocs_table(gt, &mocs.table);
> +		if (flags & HAS_LNCF_MOCS)
> +			read_l3cc_table(gt, &mocs.table);
> +
> +		xe_gt_reset_async(gt);
> +		flush_work(&gt->reset.worker);
> +
> +		kunit_info(test, "mocs_reset_test after reset\n");
> +		if (flags & HAS_GLOBAL_MOCS)
> +			read_mocs_table(gt, &mocs.table);
> +		if (flags & HAS_LNCF_MOCS)
> +			read_l3cc_table(gt, &mocs.table);
> +	}
> +	return 0;
> +}
> +
> +void xe_live_mocs_reset_kunit(struct kunit *test)
> +{
> +	xe_call_for_each_device(mocs_reset_test_run_device);
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_reset_kunit);
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> index ef56bd517b28..4f62e7a4270b 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> @@ -9,6 +9,7 @@
>  
>  static struct kunit_case xe_mocs_tests[] = {
>  	KUNIT_CASE(xe_live_mocs_kernel_kunit),
> +	KUNIT_CASE(xe_live_mocs_reset_kunit),
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.h b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> index 7faa3575e6c3..e7699d495411 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> @@ -9,5 +9,6 @@
>  struct kunit;
>  
>  void xe_live_mocs_kernel_kunit(struct kunit *test);
> +void xe_live_mocs_reset_kunit(struct kunit *test);
>  
>  #endif
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
