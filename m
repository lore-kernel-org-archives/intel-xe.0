Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2A5C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 23:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD0B10E561;
	Tue, 23 May 2023 23:31:21 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA7610E554
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 23:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684884680; x=1716420680;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cwhWyQ7Zlczixr2WeHsGOUm8ixYQ6Gn9vmsi4vjj29k=;
 b=EPit52dXNB5WJiJhoFFLy75ZA5hob499c51Wl/TOUQ+lKkrm3CH3EZZE
 /pvfRIaOvNHoQsBN85KQ6tyiZwUCqYkE0TiXxFfLeqnwvW4q5Wi522m+Q
 u/U/o7tf7nb6qkF4yZdubUYbt0jWE3oav6E6kzg1CGiOLQlr5WZey/xvS
 saYLTl64LrLPLTvCnhnQruqVq6RZ4IIkdBsNLeCt6RYvyqZZmlNl2WvsG
 fJzWBQR5c+VYjRZ2OOPZt+AvCtaDPhf21xaWNvZHYplx03HPOGrHj52mo
 yIpS+rcAKgkNCymUwOYBqEi/W2w95p977OoxPc7pDMY3n21MR0vuIyC0o w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="333010983"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="333010983"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 16:31:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="704086030"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="704086030"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 23 May 2023 16:31:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 16:31:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 16:31:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 16:31:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACG3codYZLZmUk4Nrrfr+b631ZFgvVyp+Evkwz4dfey/EvKgfw4U9KAeT69v5c+GmcNzJd6RJT9J+eaxgZzIxq8Ns2HCfPwhjjcl2NnuBydcjQc/CsIDEq/e9OrPlCG35R1KAJmOl36DaJfgoQVxN5H6s3QoeE6Uf/Z8NbXVL2GIqWjqRho6L5om9MEeoHujfG0UjjMPuc86/Bja+MuKiZt+iydD2bZdLlGMV7dpUUlOB9jrf7rqi1t/W0xBSqkJgaGRTjejGQ6vIcrd3HVBOIqgVAJMJ7ds/47l8SR2xUmUmLodeb5aqo/0SvHr2PE33uwo3lm6p3e2JP6h3RsNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cjec/j3aG4ND10xbkH8uGGERIwtBseCpuPcNp/gRdhU=;
 b=khm6UgetPaMgDPmmg+EOeyCmc6YlF5xGLF9A3wjphFbgMnHs0fv32Lhs471rUmm1Z3Vyq/uvemIDxIu6MmQVbuzuUiIwsv5M1HWXZhYC2MgtXbhr+4VBsStit7JlTje0JS2tSbV+Y4UmPfTwFtweYYydJnZZ9gcsLtpu+JAYNJOo3JI36kNRBcyXLGjnMXK9nIdoUhpFr7rmPWGVy6EFx+Ms8QLHeDSiVFwRcLPVtvsZbh5bx2Kp7Hc53GyGNTrokSmTUQMAzwB7nXmzTSVIwCbJxVk/Ca3G60wLH/AMBbkqPNn+nsPzF2x3iLzIZO1iGnYTSPN1YuYV7UEG3/JqUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6465.namprd11.prod.outlook.com (2603:10b6:208:3a7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 23:31:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 23:31:01 +0000
Date: Tue, 23 May 2023 23:30:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Message-ID: <ZG1Mm91KwwDrf8e2@DUT025-TGLU.fm.intel.com>
References: <20230523202412.14671-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230523202412.14671-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fe76da6-f3c8-44cd-68ff-08db5be5c49c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9x3d1UKjx1A6pVJ9AtD13cXQ2aD84p8u5JBI0eivwxHhP7ykWWOPvChPIdDqJWK16JxRImkTqcGIL6lSKJJ31SFuj/RKg5n8mIUp8HBv8nT06WWjh+wMhwihs1uEjVkl2ghD2VxBkBXacDiOFBb8AmQ0x9PfFSUsC6WV1CyO+LHEUMEDUeycz7XXVYwqnROOsHiCBWOErMK2nFjR2DamOo5G59DREowBmdnHZYNqLDAYCbYoOPp2t03oWg3qDMN9XZLg5bugl1IrjAVMNKIKWD9hvXZPmVSRXLPnO+ES+z4RXWJyDfPlDRQdz/gDxl48LZ9YUKMlhgiu5iZq+uTJwQHW8b4Vun8LGSDfsLQF72xM/ha3V1SHxK5pJ5aaRWX+Wr6hhbq+fj2D3Wlf8gN/9JvCqLbMws3FAAakk1Ujx0JpkCAYStZmFNDkHxcNttd5oF1nWPxlMnCtRw0JUh22a9yVndGZ79YJrT5J/9Ftkh3BCE+k1o5fhFNZOwsMxmxBObwDQwYGsj4LuYTVbtreUdhQyLFth+v6bGWORgp5ZOnLd7iIr9sje4SUXWTqjFOn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199021)(82960400001)(478600001)(86362001)(66946007)(66476007)(66556008)(38100700002)(83380400001)(6486002)(4744005)(2906002)(6666004)(316002)(4326008)(6636002)(8936002)(8676002)(26005)(186003)(6862004)(5660300002)(6512007)(41300700001)(6506007)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gDW7Qg3C8dSk5r5Q7i8pjncUUMmjXm7sikwQ3u2MtGsuBy6QDAMRdZDPjtf+?=
 =?us-ascii?Q?W5tfl0K2/GNn26U0YdnolVOVlQI32zBmlfEOCX/5e9/qTOgv1qzdnRiD4up+?=
 =?us-ascii?Q?XxsXS7ZMLb562DH5fITJGz09Ln6m3UExSzVMwEUP5RyZUruS0byTxYYSWuS2?=
 =?us-ascii?Q?++GgzmkBEov6o0uNR3cfnd3Pwb3gTu2zF2ppJU+uEKeEoLMKQjx9vv49KcRY?=
 =?us-ascii?Q?9Gz7CCaGgh5wz0dY8SsgSoKOjf5W0Nu+WMJcBn/ffHs2x+KvR9POMaNwxzRu?=
 =?us-ascii?Q?0cXQov0m2iF0CIWGV+CN6FuqYV9bU3nZQRdmpgOVRs19iZftxDxjDQB0nq/d?=
 =?us-ascii?Q?qkC+dCd6DVmy0Q8epGuEeuXnRy7faQyEQ8ZSeiNwKuOo3ABumjIdeBGsXee2?=
 =?us-ascii?Q?fSMbOKJ0oT7FH4ldN/69FtRqEzizpQZGUxG/Ag4+XfqEd97TGtg32PqLLQV+?=
 =?us-ascii?Q?bTqwpKdfzmCza2Tm0rgKjBmVsaMK64C1F1EwS0ECsb1IA4+I2MmICCVt+gqm?=
 =?us-ascii?Q?ycnKHUyxh57x2hL8duLRfowmUEsEiVY+0MSCGN8IvIwCq8bzcUT0pgD+hys8?=
 =?us-ascii?Q?Ta9/sE2o1kTtO9H6yW0iitoCSP1UELmZPmjNaoWvAy3ZjTluAJgmK0LcA8/+?=
 =?us-ascii?Q?5uDRU+e9vH6W+0lOhAzY8AF2hpv2FFsuT3J5xjrx24iyASy3Kif8jl6wGZKb?=
 =?us-ascii?Q?zt5vB5lEHHOsDyobTj1B8zIP4VFmjx1RFgvTc1FL10TAiXVheDFtK3dE57dx?=
 =?us-ascii?Q?r07Ds7W56/hHmkCTQNzVkBmcDU4i2NvtdkUsp5EnIw1o9nT37kQELgTfspbj?=
 =?us-ascii?Q?DdK0hdjCyWKQXTAQrbCZsn0qKWpoNjQogw3km8YZxHooKjKzEjIHYTAkwD/o?=
 =?us-ascii?Q?cWRjBqjxPx0MsIH0s6eu1m6c+LrF65yfrgv6QwVEWBuwEBLikXFvEqe7S3kD?=
 =?us-ascii?Q?8g6yuEGJsRNMa5/4XaAHgh8Gq7T3JQbRqjrkpomMFs+Ke+tPAWdYoqb7Y9WW?=
 =?us-ascii?Q?V78NNIYHAA7z/XMHGbcLm7F9/pFSPdcWIYeS0KIZwyhiUkv82Wg35RgQAycN?=
 =?us-ascii?Q?r7n6yzuDMtNf53ikslDdpPkI1PPA0sD6ebV0WdVf0QOGonqJBzQRLLPCiaER?=
 =?us-ascii?Q?5f0SG8nkNsci4rw+zlUFDXyJh5z5OUTDIJBdw5d0yOghLL6E9wSnt5OBi3hc?=
 =?us-ascii?Q?80MmuQSw+5cZzgJo0VvG2t/P5pCqQUbtXJaW9VymldPGjXo+NrzXTZYDVw5z?=
 =?us-ascii?Q?aR7NRCwGlH53srhjKiZDZE5hGIgqDsEVL7YuwI4AWcXBniIbk9ViEsO9v2BI?=
 =?us-ascii?Q?AIFUnlQjhIVXZbn5oCraAv5gAfTBBcH8otz+r+cL6wJs8wFg545SMJoJfDwW?=
 =?us-ascii?Q?EuxwxggjvhaWkWpQhYa+FPpkzEeR22M4TrkwyamUGnX6pykjUGcjXQHWwEWk?=
 =?us-ascii?Q?YZ8oZ5BNPCpat/+OQw1CVTPIEEMwZBzT7pLDkmW+MRx3Nn+PqpHOwtXpiIKy?=
 =?us-ascii?Q?/JcQWgm5cGryGlVn4By+n7gz1t3c6hCqwnNzBRqomTYqIR3dv7YNe6/KlExD?=
 =?us-ascii?Q?3SOmQe0SKvvoC+8TGJEGlvN2XDmSs0MFFH/ORlPqCA4O9HBdegCiXjPMr6FA?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe76da6-f3c8-44cd-68ff-08db5be5c49c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 23:31:00.9065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agZGPlzGlYFsZi+YX5CoHEklC/kXE1uif/BLKHdqow03pN5Dy2yzYb18aamIdLtnG4EJ/u+jYDSWl8QE9DOXzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6465
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Do not unbind destroyed vmas
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

On Tue, May 23, 2023 at 10:24:12PM +0200, Nirmoy Das wrote:
> Fix a vma UAF when userspace calls unbind ioctl more
> than once.
> 

I see the problem, yea this is kinda an issue but will conflict with the
GPUVA series where this is also fixed by removing the async worker.

Is this a problem from any UMDs? If it isn't I'd say defer this until
the GPUVA series.

Matt

> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a0306526b269..7a9f1ba432b8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2769,7 +2769,7 @@ static struct xe_vma *vm_unbind_all_lookup_vmas(struct xe_vm *vm,
>  	xe_bo_assert_held(bo);
>  
>  	list_for_each_entry(vma, &bo->vmas, bo_link) {
> -		if (vma->vm != vm)
> +		if (vma->vm != vm || vma->destroyed)
>  			continue;
>  
>  		prep_vma_destroy(vm, vma);
> -- 
> 2.39.0
> 
