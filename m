Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF80C47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 23:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F2C10E9A6;
	Thu, 25 Jan 2024 23:23:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D148510E9A6
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 23:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706225021; x=1737761021;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SwxbBWpLkHuoRjJkMm2KMCNjsknc3n2RTRoARhpgffo=;
 b=FDjeRN8DrcTpeCBFMMY1nt8fjzFhIE2lFIkVUvjTETngmJcn3l1aeL8k
 f1+dKsVtoFa+wmVdi85l+YhNSnl3iPSqdRlF7m1anfPEjwC+1ebucYhYJ
 +bJvhLAcwXgku/JV7DLbV/VCRV/mvaC42zWoJNTj/sF8glNP1D54srsYJ
 hdzJE5SGwChOh7JjKu02t0VxWiOapXfierGzCS8yXxGLEL6WjzqZNoE26
 iXN/w+VZQNNo+WsI7x7NLPU1p30cZtjXja9/GxnWEV78uT1kdNtFfBAKM
 KAfbsgI+EY1UbUlrX3ZPwBebzJSgvsfGMo53SN7ysvRZUcWqLAUBksUFz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2219680"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2219680"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 15:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="857231685"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="857231685"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 15:23:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 15:23:34 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 15:23:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 15:23:33 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 15:23:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iq0+gJTsXmlIc9c6c/Vk99iQTW/K0jAVjdZfOEjWM7xEqtA9k4nm//RXtjfkvS/dUJZhbyFQ7VXfkI52iatUgRLd93Nb5BH1OTawYUojzCczIcBt/FNE3EFwC20wJ+lm+sZ9YWKJrFlBiK6FbTTG0SxYqsIWitHcSqQOs2ufsuHTMbZWGDCdXFJgTSE0xcyUYYGQpvtuSjZ1gVC46vOh0zJYIHETnb27jEJ0S6udvTTls2mXJ5orom8K3H6tsKXucKhnk/yi7WZ4HFGUzMxr5WaDIeDcNZ6EGbhhzHwPazBgjvt/NXb9c3vay26k+iRI3DQygITe6uV8BglhIioa3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWWJBI/VKFt62LBrIMH5UPV1stASlmOuxrL/jIxnujA=;
 b=RdnzsRCZDkh6IGmbmxg50M1CBaw9E44462/FHQULsrEUJGWhQo9vMnJjqCNQ9gr4RKIPhCGblH9Aay5tYIjQ0soBK0RfBgAuWECcGxrwDQoqp5sWe9ilumy47FHh5cTMT4qD8WjNsoEWvRVrM45oOvcrremIQuAv6wYKu3w1LqhLe0fI2oBmm8KHow2S4fftVrHSg+noahFxpqK0/jmjKQHOgHSKv2uD/ue5mN86yRa1ex/tcDSCdlXS7eOAXJw0s8/Gs4/OhRUdloR/qg2mew2kc/sv7fX/mXJBFLz5IDzDEStJ8aECgcpJcXNmE9AcaXKgUmhPcZ2Ik45RKADOwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Thu, 25 Jan
 2024 23:23:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.035; Thu, 25 Jan 2024
 23:23:31 +0000
Date: Thu, 25 Jan 2024 15:23:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Subject: Re: [PATCH] drm/xe: Add xe mocs suspend resume kunit
Message-ID: <20240125232328.GE5506@mdroper-desk1.amr.corp.intel.com>
References: <20240125111637.3476519-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240125111637.3476519-1-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: BYAPR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::43) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: b17f2453-3a66-46d8-fd3d-08dc1dfca4b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LwLPS5nMYdMjdU2KMRMiV9i2ihN0K9VIqQKQ1FfS3iCblHZ0DV0NgYC4/z2XJHwakqnUsVLtXz2r1R5PF/z8jx0IdJf+B6c10M6SL9WykXhn3wwXEFPjEVqXu9MPtKTI2+kb2mR0uB+7TLhc1dmo7oP4SBrnUUF+MobJY02ESLhYyUWLyKnVsfvGTWxwY7hlDuoI/z0QODTc3KVlNSuQlN9tr0GjWBL0RrMBj7Nr/mz90LGOwT2LF96OlwXjWdan/v5voDTJz7tL+sXFvNwJijPxvZ4Mzj8yqc+JeW0iPhdr/zLzui+Ut2lf5sQjr7PGNEmKdWjVKPC/hLHGg8JTdcerv31tX1R7llKZMLmhERy5B9oMsbfk5VOB9UsA+7j0LZ4uaWkPwCDwFvzRJs8ui/G3L+4hXAiwNLrKN0eQt+PcoNzxnovf8zg0OZe0gJUgBIrLlyyh/3+8dRI+idFClOrkEiiNcL5Irjxia8AoGGswCXs0vvUfAZKJjOS5P2/Gfj/MRhFreQpNUafz44Mx5zO5t5yfMs/KwxBYR73bFdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(396003)(376002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2906002)(83380400001)(38100700002)(4326008)(6862004)(8936002)(33656002)(82960400001)(41300700001)(86362001)(15650500001)(8676002)(5660300002)(66946007)(66556008)(66476007)(6636002)(1076003)(316002)(107886003)(6506007)(6512007)(478600001)(6486002)(966005)(6666004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gro+BBclQgubh1CpIkLLYCAZanmf5sRzzVmb+BCSF6gylo7znxqMx7jFswxK?=
 =?us-ascii?Q?GfnmZ8r3qj8YxxfFfFp90Asgjmo8nbd7/odAdZfirkrNjfcaM+Cont/oN0zX?=
 =?us-ascii?Q?9QnGPHRHa1UqtDbSG6w36n+dkyQmNtAJj72l03jndgNl+1Ht1DdqX1qQl/n9?=
 =?us-ascii?Q?iWkaOEe3ZtChnoqPG2vQd1puV6V+NUaAK9wjngYCe0DeJu5PSky5I7s7mVZn?=
 =?us-ascii?Q?zQ0gnlri3LTcIcWiZ7mP91FJrYyALJvG2Ogs8qAkYLeg8ZZMyMF0z9j0cL5M?=
 =?us-ascii?Q?Kpl09vCtsfneQ2FhJ8W3QE4QgB/lyyaLoSLFk+uPAgC5PMwztwoxWKUkhIaE?=
 =?us-ascii?Q?W7SJRAFTptj5wvbzSmk8OuJhvK1wnyd3bJQ8BP+4f69vg2BNKmVywQFdcjIh?=
 =?us-ascii?Q?WOqU5Gni/cB0C0sghgZyBrSnHO6YVxbbkP15FU1+E5TQ95ILE+ggK1DaYLOk?=
 =?us-ascii?Q?CWoqmdupgZTpYskxGtf+9JM5Ln864GFMx3nsDMwS5UK9aP7hCoIhTWr92/5W?=
 =?us-ascii?Q?1slApLMGGLsRxFbiKEWmF/VXmNtybE3jeYcHE3qvtH8INHV4GEM8A65HRa8K?=
 =?us-ascii?Q?ZV1AFndADO7tX/LNf5hlq9lDZS03nTbCMZWSyhHWZDzI2O4MBzoxVtvcB3rZ?=
 =?us-ascii?Q?vq7Pa/E/cHZlgoNUCZfOS5eC+wEuUDo+3cQkj44NoAsV3ni0C3v+dgjetYe/?=
 =?us-ascii?Q?3LbJH2VmPvHg8ZQ0pidEvHnbUxfEtNiqrWjWWweOWxaAtMhhEILqWsjwdrYC?=
 =?us-ascii?Q?z6bc+R9Cc/Nx2UcM8/LVNyrccRlwnnV7Q+/08GSGdqlJG7P5vgS1VE6OstI7?=
 =?us-ascii?Q?JxX0wLC4bZcmF+k7ctPGel9aXs0oXONgu0W9CZ8I3GT9K2NIYW1ol/9fsM8v?=
 =?us-ascii?Q?h9cS+VKU3veFb2joqG3G5dm0BEwFgyAm2mOfhKs4xuAk2VSm8QgV5J4Sv6VB?=
 =?us-ascii?Q?sZmTrv58DaH7pbmiFOd8hrvVS0xNk/1kpk02T9+uo0Yw3YkeUrPVDbc2SmLv?=
 =?us-ascii?Q?GFHWFi6gS3vfZI8c7nDJTjZfAovOSrHfvV8DH1+6cQV8UfewC1f1RXe4dac+?=
 =?us-ascii?Q?tNZsz9NV5w6KrxqWO+2eJZU/OqTwfONLigxhcH1HQYgI9d2BZQDE6k4CeYv8?=
 =?us-ascii?Q?iTrDmmlmB+s/ZwlU/NFaodP31evPCfBFKXxrSHJ/B4cfaDsbaBfoMrT6K9k9?=
 =?us-ascii?Q?2z0aTBGz63z++AmT0fbo3ELFjKMKZ5k4MNdZTuEsH1R/GLM5f+mEXLJ6R9OK?=
 =?us-ascii?Q?0PJXsdB8psE/aQaG4gpjEYJdXHfGh7nQD0U/bL0kEk2LTxPo+KHL/7tglLiw?=
 =?us-ascii?Q?lP8KT8kTEvQj1iYBy8Z3zpowHQEWFuFNal6+2Rw9+JxlXyaDn2i3dKAWQu6c?=
 =?us-ascii?Q?MAsre7Qy+QH+vbhqrZRFypL06oAeb/NGnMMWRFKMC6YJuKDIwS4Ae5nS0nko?=
 =?us-ascii?Q?bsNy2abmU94N6Ioy0NO0AgK6RXMZhDVPQbnx+hisQQaC8K4u4Mse1FFpp5ez?=
 =?us-ascii?Q?GDMDa0iZTP3GdbaezCTlZqmEsyc6NxGJjdoENaenM6HPyBSnPjfaXbuVq+4k?=
 =?us-ascii?Q?jFiyLnjVQLPrqUic0SImQP+4UYRXh+V228GXH/xHypSjB38okkVK+t6C71/6?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b17f2453-3a66-46d8-fd3d-08dc1dfca4b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 23:23:31.2785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhsAViyJUUwM4hpJyv9QIoAWWjWqbIJuMncJYHzVduPqcH6wKmoR8wSkItJB7fIjplLunHk7TjulXSx4WO5/aAJQab8dtieTfa+/FvWkFL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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

On Thu, Jan 25, 2024 at 04:46:37PM +0530, Janga Rahul Kumar wrote:
> This kunit verifies the mocs register content with
> the KMD programmed values before and after suspend resume.
> Add helper function to check mocs values and use it.

Before we add more tests here, I think we need to fix
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1166 otherwise
we'll just be adding more failing tests to the test suite.  Basically
check_mocs_table() needs to be updated to not try to confirm the final
table entry on platforms where table entry 63 is readonly and can't be
updated by the driver.  It should be a simple fix, so you can provide
that as the first patch of a series, and then add this new test as the
second patch.

More comments below.

> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_mocs.c      | 53 +++++++++++++++++++------
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c |  1 +
>  drivers/gpu/drm/xe/tests/xe_mocs_test.h |  1 +
>  3 files changed, 43 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index df5c36b70ab4..a36f804e5ce0 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -103,6 +103,14 @@ static void read_mocs_table(struct xe_gt *gt,
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  }
>  
> +static void check_mocs_table(struct xe_gt *gt, struct live_mocs *mocs, unsigned int flags)
> +{
> +	if (flags & HAS_GLOBAL_MOCS)
> +		read_mocs_table(gt, &(mocs->table));
> +	if (flags & HAS_LNCF_MOCS)
> +		read_l3cc_table(gt, &(mocs->table));

You don't need the extra parentheses on these.

> +}
> +
>  static int mocs_kernel_test_run_device(struct xe_device *xe)
>  {
>  	/* Basic check the system is configured with the expected mocs table */
> @@ -115,10 +123,7 @@ static int mocs_kernel_test_run_device(struct xe_device *xe)
>  
>  	for_each_gt(gt, xe, id) {
>  		flags = live_mocs_init(&mocs, gt);
> -		if (flags & HAS_GLOBAL_MOCS)
> -			read_mocs_table(gt, &mocs.table);
> -		if (flags & HAS_LNCF_MOCS)
> -			read_l3cc_table(gt, &mocs.table);
> +		check_mocs_table(gt, &mocs, flags);
>  	}
>  	return 0;
>  }
> @@ -142,19 +147,13 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
>  	for_each_gt(gt, xe, id) {
>  		flags = live_mocs_init(&mocs, gt);
>  		kunit_info(test, "mocs_reset_test before reset\n");
> -		if (flags & HAS_GLOBAL_MOCS)
> -			read_mocs_table(gt, &mocs.table);
> -		if (flags & HAS_LNCF_MOCS)
> -			read_l3cc_table(gt, &mocs.table);
> +		check_mocs_table(gt, &mocs, flags);
>  
>  		xe_gt_reset_async(gt);
>  		flush_work(&gt->reset.worker);
>  
>  		kunit_info(test, "mocs_reset_test after reset\n");
> -		if (flags & HAS_GLOBAL_MOCS)
> -			read_mocs_table(gt, &mocs.table);
> -		if (flags & HAS_LNCF_MOCS)
> -			read_l3cc_table(gt, &mocs.table);
> +		check_mocs_table(gt, &mocs, flags);
>  	}
>  	return 0;
>  }
> @@ -164,3 +163,33 @@ void xe_live_mocs_reset_kunit(struct kunit *test)
>  	xe_call_for_each_device(mocs_reset_test_run_device);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_reset_kunit);
> +
> +static int mocs_suspend_resume_test_run_device(struct xe_device *xe)
> +{
> +	/* Check the mocs setup is retained over suspend resume */
> +
> +	struct live_mocs mocs;
> +	struct xe_gt *gt;
> +	unsigned int flags;
> +	int id;
> +	struct kunit *test = xe_cur_kunit();
> +
> +	for_each_gt(gt, xe, id) {
> +		flags = live_mocs_init(&mocs, gt);
> +		kunit_info(test, "mocs_suspend_resume_test before suspend resume\n");
> +		check_mocs_table(gt, &mocs, flags);
> +
> +		xe_gt_suspend(gt);
> +		xe_gt_resume(gt);

Hmm, usually our suspend-based tests do a true suspend (e.g., entering
S3 or S0ix or whatever) to make sure nothing important gets lost during
a platform-level suspend.  Here we're just calling the functions that
are invoked to prepare for a suspend and recover after a resume, without
actually doing the actual suspend/resume itself.  So this isn't really
testing the same thing, although it probably could still catch certain
types of driver implementation bugs.

Part of the problem with doing this testing in kunit rather than a
userspace IGT test is that it isn't really possible to do a true a true
suspend/resume in a kunit test the same way it is from a userspace IGT.

I'm not really sure what the best path forward is.  We could keep these
tests in kunit (and probably rename this new one slightly to make it
clear that it isn't a "real" suspend test) and just live with not having
full coverage.  Or we could rewrite these as IGT tests instead, assisted
by some debugfs entries.  E.g., if we added something like expected_mocs
and current_mocs entries under debugfs (one which dumps the software
MOCS table, one which dumps the current values in the registers), then
the various MOCS kunit tests could be re-written in IGT by doing
something like

   general mocs test:
      read expected_mocs
      read current_mocs
      assert(expected matches current)

   engine reset mocs test:
      read current_mocs
      trigger an engine reset by submitting a spinner
      read current_mocs
      assert(first read matches second)

   gt reset mocs test:
      read current_mocs
      trigger an full GT reset via debugfs
      read current_mocs
      assert(first read matches second)

   suspend mocs test:
      read current_mocs
      trigger a suspend/resume cycle
      read current_mocs
      assert(first read matches second)

While we're at it, it would probably be good to have all the same tests
for PAT as well.


Matt

> +
> +		kunit_info(test, "mocs_suspend_resume_test after suspend resume\n");
> +		check_mocs_table(gt, &mocs, flags);
> +	}
> +	return 0;
> +}
> +
> +void xe_live_mocs_suspend_resume_kunit(struct kunit *test)
> +{
> +	xe_call_for_each_device(mocs_suspend_resume_test_run_device);
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_suspend_resume_kunit);
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> index 4f62e7a4270b..0d813472cdd3 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> @@ -10,6 +10,7 @@
>  static struct kunit_case xe_mocs_tests[] = {
>  	KUNIT_CASE(xe_live_mocs_kernel_kunit),
>  	KUNIT_CASE(xe_live_mocs_reset_kunit),
> +	KUNIT_CASE(xe_live_mocs_suspend_resume_kunit),
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.h b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> index e7699d495411..117164cc0df7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> @@ -10,5 +10,6 @@ struct kunit;
>  
>  void xe_live_mocs_kernel_kunit(struct kunit *test);
>  void xe_live_mocs_reset_kunit(struct kunit *test);
> +void xe_live_mocs_suspend_resume_kunit(struct kunit *test);
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
