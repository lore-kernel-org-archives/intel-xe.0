Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E422E8FDC7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 04:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CE310E093;
	Wed,  4 Oct 2023 04:32:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F12F10E093;
 Wed,  4 Oct 2023 04:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696393942; x=1727929942;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c/XQcbk86VIUPGFb0+gYDFXw/j/0tn3Os/kJg3by3y4=;
 b=W/2zi9j1Ne+f7SQ5nJZXKchJcAf+W760wacOusZPZDk1VyHEHAc16RpG
 hFGDy8G3oiTklTeviPz8zHJ73MI3s0kDDZwiwUDTyy15GwhRJeVbyDZwZ
 u39tAzwEPc2WbsH7Q556bvX708IKnzjE5+w5azM0fV7pSEj4y2upZyR8F
 H0DPj+iBaKXORazQzYYXtVlQmft4O/1bt6OBeL57Dp45bp9y+rH9PHxlV
 fJn+pvvE1hVYVp1X/yXl0cLJUgPZrxe6qpuzvfEoNPX8/d7SqcOGTT9O9
 /LI0vtecOgt3NbLpNVU7IBCaWOBKreCtq5nIZcVc//uL6xeRg24DmBYwq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="413971477"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="413971477"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 21:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="841631713"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="841631713"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 21:32:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 21:32:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 21:32:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 21:32:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 21:32:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxSAhrvfZZKclBP47j7JIkjIv2bhuAOWJTZnpfniE+/hITJvXlpGs0D8XYSMFwju2hQa0GLkCMKkZjPfuLudfaICfhN5C/+CrhhtYu4uUVREh4i6WBljkjCnAMi43uJxqYBCS4FxKUzO9H1X47R7OaDtIkvnxc/ybG5q2/wdo/4OTq8Qnha/7wFw857DH6a+Y9kz/jahmoz4Uq3zknU/mkrf+7faSr5tzwFuHRM0WU7KLq3QCP6CvoVBgD4T6L9dsTYhSih6s+0IEGqsoeCviKPi7NNcGRi43v6tboYixRGzEvA/4iHC1bI7BV0o1q68916S5c7EeENtCe0Ej+D8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgYSLXCvfbEkrYtIilUQWl29ubT1T/TkgGtfviEX3l0=;
 b=QNnsslSGGMylvwkesYHSQqBCYCreTMCaWXDEh/96wmhTfeA1uf+xl+elFhR12TY54ygPyYzzB/1tTxnj/IF5cpMJgz2ZWpuNUy9HpUuqmd7/LYw4tlrv+GWu0owEVL+xNOWZMnx5eTLG0lavvRU7jXBsB+hqY7aFZfknWOUQBCRNsfUiZnQ2IH7lFwjjpSNxkGM0s1O+R9m9J0RibgHLfJRrcKSX8QyioRyTwZMimgkkMQbbet9fcrJB6xKyNICtURyW564ZqpMkhliFCYcqt0dMrfu3fezWxfot4K1GFuPrG6KA3zfU6aJQ6Mz2fJIGru519lMv19dmSTRA4/L0Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Wed, 4 Oct
 2023 04:32:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 04:32:13 +0000
Date: Tue, 3 Oct 2023 21:32:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231004043210.GB53570@mdroper-desk1.amr.corp.intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
 <20231004031023.3444455-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231004031023.3444455-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fef3f24-a58d-4872-1d84-08dbc492e1cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ceHT/3stu3a/NA4FmdobVGgC0Z9lKh3xGsVchbPeFRncIvylxGomi1COMIV1UBBMm7Q2sSZW7FwLpZYB8b4c73jubMYybprmTW5gspCTJBLOs8WXRL0pFocimizkhAyqDy9rpBdeqOKDSJohfNVhv9OmKAiucKA+tme/RZMFinvnLxxM9k05c9WMzxGB/l+zYlot/ev7A2i08KCKEEvnE6sBJb/lK27cQkx5RpNNVSvFRqR2qlOAmWbvqDOjCgAZr7B67XSYg8/XGg4SV+1TyExWlNDsm8bnK92/M4vGk5/a4TBYM7dO8kpoJ4gZAvq5w1zkSi205F8+0NmdlG8Tj3/IfvYWIRXzzPLqS16pL310zigCVrsF90OG1SwsuKj7/xraB3kYZxlxldKsi4PLKxsqHgwvl9Pja3yeiZBhXF6eAZkESmo7y8YPlrVloeAgPVntrwKLJ/9hLs9iPm3pftEXU9A9X0Mio7AXSXd2igKQ7ipBVBxX3yfqCcR9vsBrQfVU0cUlRetWdQdi8jbVQu7uJ9eRCAVmxjT/bL1jQ5Z7aBGViBdPxMXHmqjXEBne
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(396003)(346002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(478600001)(41300700001)(38100700002)(86362001)(66476007)(6636002)(66556008)(6506007)(66946007)(450100002)(6862004)(4326008)(8676002)(5660300002)(6512007)(2906002)(6486002)(316002)(33656002)(8936002)(26005)(83380400001)(1076003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gz6NIrLHwjnwgiBMBREj7zAR/49EAp2Q+70sU9kbapU5JKwbDIN8Wot46xKC?=
 =?us-ascii?Q?i7khzen3h5uhS6xAJx4Xf+iRs8KfybzH3V99AcfTwHFVjMrA7qyBVni8ACSQ?=
 =?us-ascii?Q?U5y4uhEYC66Pk4+dqE4P+bx/MEmRy2dgbps+DqIHPPgJfHPlnSzZ5BJEo6wI?=
 =?us-ascii?Q?pJ7+T+L2P5iKpbuGhCQx1E5ZQnNbTYQvLfCpZ1iVMsjlOKzNPrPKhgYZr9nF?=
 =?us-ascii?Q?r/2XDpkSeYyppAyRBiwhfM+53Jke6HzCps7xWZyDkmzOsbADS0w/SJPj7VbL?=
 =?us-ascii?Q?LNzlQQ6hXOzDmA+qHvfi3eE2FQIul+IE96ECw6hFxLpkzttLBZAr3mEo1RPO?=
 =?us-ascii?Q?FFz2Qn1+z4Mvl54Qu47CyPDBmD4Iqs1YjKC+RADNs29UIXo/KWJlB8V8sCph?=
 =?us-ascii?Q?IJOc4llYSnJuIRpwjKPXi6/rO6TGr8m3JJyhD4ih6HMkWDvUHajKSH47x1EJ?=
 =?us-ascii?Q?n7CkGmGZg2bO5FbOM+yBp7m8gLMfYrG/tIwn6ZXu1bQlyYamVNK6mZAMv1oO?=
 =?us-ascii?Q?/ZPw476iWBLMrRYu8FsrOchACsUPq5LfocyaX+cMsirfaRXcOzmSkcd1RNoW?=
 =?us-ascii?Q?fPV7NFNlI9LTnnwI9SgHVceOCgn5L8ZqiURLkcXHLhyvxDPlUH5woU4Y69DI?=
 =?us-ascii?Q?wv8sct7yZ2I4JzNDSSHZbUCeXaqDB1kfXwfpfGCQAqBeKbqIZ0K7RK3aqGhr?=
 =?us-ascii?Q?fqClaLiAAhOYMGkjChDdU3pCkIN9Eb8UWI3sGmKztyI/0Zqhd+7KApJlUje0?=
 =?us-ascii?Q?5yv3VHroP2JyHaTxayG36Xg2eYDvPlMiXyOwvvRDlGtKecBhIzauQwdEIAPW?=
 =?us-ascii?Q?upQlLPnB4KtoAsRLOLQgk6PAzEA/MVXGbYN7bTu+JGs3URwc3DNzBlfCa6qI?=
 =?us-ascii?Q?pUycRMktHIXFsdfy3HS9ATnYpeeUXEgF7KCrUwmaYHvrQEnQcbwMnXaMu28e?=
 =?us-ascii?Q?ubM6lfh3YH+OB+Ve8KJYqYoavTmMJ6i6uVlDP0P1oXFAnvZf4Jvd1DhRP+kR?=
 =?us-ascii?Q?xrZqGC2MsmRKWVXW0sA2o/4QtjrgNIrvM9aIAEkDzDwXS46dHAy2lC/mTsmz?=
 =?us-ascii?Q?B8U7qsBuI3iJNW9XSJnFUfBNxV+XqnxemRYfFce1fdkobl6evH2kErNGo4a1?=
 =?us-ascii?Q?dOZONpZq7nXEZHGs/3VMICVFV0NHEGCrP3abQiUQI5Q1IwiXpTFl9BxSxpKM?=
 =?us-ascii?Q?nE0Va8Da+Yj6hN9P51iLoOjEYZbQnUgmmscKj6kRMIoAMixiQgj++9/r5wKS?=
 =?us-ascii?Q?quNoc1L+ClUyjRzIiVMunO2koARGKdlRna4hJdzPLmKcFy9iP+c0IZCms8K6?=
 =?us-ascii?Q?q12ictU5Q5HeR5b7cnqGhtqY1KXm8G9ANd4WeqhNDGU2AgxAwneTvZ48KFHZ?=
 =?us-ascii?Q?E+VfHCUzrYQKLRnlut9MRU8br1u7D3+yA78/js1HvapbgK8xKXOYZ13WUp+z?=
 =?us-ascii?Q?rT7d7tbo9+5Kz413b21f3NEo27hz389QMaXhQSOjbdPohrEEqcHZhPBsnOBr?=
 =?us-ascii?Q?dESyxzs5lhNvejJD3Es8u6zGKw64F4RIoPJWuEk6TZsNTmrwxJuP7QQrbe6Y?=
 =?us-ascii?Q?luVU2GJWe8oxjmAF3Lpnm1f1tSAjlfeUw5KKDutAld5gCiLI5rycSP933+H7?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fef3f24-a58d-4872-1d84-08dbc492e1cc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 04:32:13.6590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBqVHDY3/BTQ43L9J3RKc/AOA9VicXsdL7GP1xNAL0EKn3oW8CbuglVLDwdgMm7gLaQsCxFMXvlFYAEe1pkN5T4HjOnPWRtM+tRRWzKWkgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t v2 02/13] lib/gpu_cmds: Remove prefix
 from gen7_fill_binding_table()
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 08:10:12PM -0700, Lucas De Marchi wrote:
> This function is used by pretty much all versions. It's odd to have a
> gen7 function end up calling next-gen functions and it's error prone:
> when adding something to e.g. a gen8 function to realize that behavior
> breaks previous platforms.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/gpu_cmds.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index bb35204fb..648451f74 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -259,8 +259,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  }
>  
>  static uint32_t
> -gen7_fill_binding_table(struct intel_bb *ibb,
> -			struct intel_buf *buf)
> +fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
>  {
>  	uint32_t binding_table_offset;
>  	uint32_t *binding_table;
> @@ -321,7 +320,7 @@ gen7_fill_interface_descriptor(struct intel_bb *ibb,
>  	uint32_t offset;
>  	uint32_t binding_table_offset, kernel_offset;
>  
> -	binding_table_offset = gen7_fill_binding_table(ibb, buf);
> +	binding_table_offset = fill_binding_table(ibb, buf);
>  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
>  
>  	intel_bb_ptr_align(ibb, 64);
> @@ -357,7 +356,7 @@ gen8_fill_interface_descriptor(struct intel_bb *ibb,
>  	uint32_t offset;
>  	uint32_t binding_table_offset, kernel_offset;
>  
> -	binding_table_offset = gen7_fill_binding_table(ibb, buf);
> +	binding_table_offset = fill_binding_table(ibb, buf);
>  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
>  
>  	intel_bb_ptr_align(ibb, 64);
> @@ -803,7 +802,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>  {
>  	uint32_t binding_table_offset, kernel_offset;
>  
> -	binding_table_offset = gen7_fill_binding_table(ibb, dst);
> +	binding_table_offset = fill_binding_table(ibb, dst);
>  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
>  
>  	memset(idd, 0, sizeof(*idd));
> -- 
> 2.40.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
