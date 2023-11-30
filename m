Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5677DC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 12:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28D210E6F9;
	Thu, 30 Nov 2023 12:37:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C231010E707
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 12:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701347869; x=1732883869;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EdYRyhjbDEOxU1/8SAURX02RunqPp9kjk3yEITA4iTQ=;
 b=SEa5gsCGwRiIoBsCk5XbBncQIoimQzQAlp1//f9acvDmXZy9sZ9AxJU9
 JHidopUZDdwxrDPzHoLUOkmW8mJiVzDhy3yS7dtN0X+QtODvmeYvGV2h4
 5JjjpTxIt+qz4sdJcph782FWHJyRFkPW2mdOg+xBN6PXFN7Tq8yAcVo68
 HTMXygaifVg5ZfZC7n616OuB6EcmF1VVxj2rAfLTdIYeMt/1XwqCa7n7j
 4L3m3blBZUxvH51nnPPUSQ+29UeUiNXdK63dRImUigToyu1YUD2bc0BFV
 bM/+iTkY2JXdzgtgDYQEM/fxIES3C69NOeBreNyx2nsCm6ijoxX70kT6o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="397210290"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="397210290"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 04:37:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="803682968"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="803682968"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 04:37:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 04:37:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 04:37:49 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 04:37:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERFaARtSAksXlmiFHUgFgt3CIPZY8gdM75sn87uTG1nUqjaRFPHlbsgbCvH1x6ck7jM3XRznYixlBdrvwV0+cjSkPFR58l7xZ0vmhL3ChQGOxYWIrxh47/12Cpve0Kw36XNhGb4dh5n5UoXmxVGaf5w4iLaWLPBnrRedhzHSQiVVVC1Cwpr0Kn/dWEBlWqtwGoFkc95Hh74GGDFoqp4VfLOCDNJ1cxM6YtYTGT8VTyUqessdcSS9Yq+qYZv/gAI/+1d85pxLBI4xuQweNrSKXDX1OPo8Tu04Xm3py7qM2s7DOjIfyRcOJSDoNvtta7WTjuCRn3OdTG9MwC9eqPoAIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CI0i58ogD1rD5CSvUizPo1iyTdnmX/Qow7S9WhSWc3A=;
 b=lN1KYVzkNC7yjwa0HUQggu0uJcEZ/N3mDZMcdWUxmir1wFq0huskx4WWGzCHXiIeOLpx7/XIm/JnFvhLRN87GYcFr2rz0j5tASE8mUMT4U4ffaecJf10rTyf8PkmlqY5l/U5AsIxgL2hVpNpc2QetumzGj9OYXY+wu2YzVePSJI+Xf8e29CrR2L5AZnAZGlqtC/Y9Qyl6FDatUyi1Jw1Y6n7Pxh7ouRD/CQ3mgWz8WnsAWn9pnBcFSB1TetB6sEejfiXwML7uMhtVfrcZk8yXEpwOFuQ4Xagd9ZA8f8xD+Bumk/k2WpTzhppEvzTDxzqfGd0lVzrUf+6GorM5/r8Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY8PR11MB6986.namprd11.prod.outlook.com (2603:10b6:930:56::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 12:37:47 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 12:37:47 +0000
Date: Thu, 30 Nov 2023 13:37:40 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZWiCFLkrNLNIHE0E@fdugast-desk.home>
References: <20231130111423.434744-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231130111423.434744-2-matthew.auld@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZP191CA0057.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::8) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY8PR11MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd4f160-66ec-4819-613d-08dbf1a127fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CSx+np4WOoOSeeu5Kf/JFR+bOl5NT4EmpuRMEN+nkeGDHhOMOpXhSnqlNADHaBczocU00Q3ZUrekpFLCEVwipIwb+vRAx4C2uOokaCQxJhd3SBqgs+vyhD2/TKo32nGo9DpVRVVOFFKlTlvSZ3pGgF8YWwfkwMupF0FATPOK0TmCdkKxQ662QWqorv2z4gpaERtsn2UyoV80O67qJQQutjN5RZgwZQ7RKC9XUsHbu0bgF8XOLNLZ5iYiPXNWVMcsVtorbCNxV/8j9jWrxUwjdFdqMPv2Mx8AVaw433SBGS9EPO7N6qihuWUeJWiUftrZh0TZ8+1gZ1y5MSBbGqPTwyEtwDK3CuuQ0fxtOcVk8eB2thb4wrP80zd4JneuDd/STrLzNf6FQg/gt3YEzQq3gguUkzrYb0vdGyQbq5AULiYf3Ee/o1Ns9ux8vK9zZNMJe1MGu5HoEOw6sFjqWEhKFeXhl8wOXriNTAh6NjoTswS/fvG1d2MaT65lgnyROO8f06Vcqot6qgY3AnRTQMGFlYwaGCBuHAInw2eKMvd1BO5sI+xoElMPe5s558UrV8SI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(82960400001)(5660300002)(38100700002)(2906002)(36756003)(41300700001)(6666004)(316002)(6636002)(66556008)(66476007)(107886003)(86362001)(26005)(66946007)(8676002)(83380400001)(6506007)(36916002)(9686003)(6486002)(478600001)(6512007)(4326008)(44832011)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5s2+AYPTWy8GemDtc78DPvZTccTTKproiYU04DgBwdBYhCTYwp2nq7JOHxYa?=
 =?us-ascii?Q?9qb1r4wDgbOHGxjjrh/vfdXCYOGqf7iTtxg5eYRy2lDvsIk58L1X+HEhHeg5?=
 =?us-ascii?Q?Z9S/Xc/6s3q+p8nV7RooMYriTYkw3+f5hMQm3REX7Xjm+9BLURlB0rqkSQO1?=
 =?us-ascii?Q?tzAy/+VM03V469MVyC4u9MyNfhH/QcJA1ABNZNDiBBcP3VoHknmkKAokYybB?=
 =?us-ascii?Q?57mpBFsq9TOwrU0pA5hMGG1h8pNHJ2g5fkwdapTJ4X6UZVSQ0MoG+WMJZmwY?=
 =?us-ascii?Q?3aPxaRhVqYI1tmjB7pGOkQLG2t9sVt8wsWkYLrKZyICf0dfnGVlLN60RF+Un?=
 =?us-ascii?Q?6VN+W45oXRRWkD2y7EZv2AnmECtSCe9HkyGsxRiUBnyORybkNz/fjNwAienQ?=
 =?us-ascii?Q?EdWW0ku9QeKEnLeWGF2iTutoorMeB0J+qj7Wp9gFWMb9MLsfK5wkQRaOLhLW?=
 =?us-ascii?Q?HqtI864qcH0Fn9H7SsoNph+AiZM1o1U+4ulkqwIKnb8ZdD2eWIZwJANEdjW+?=
 =?us-ascii?Q?hBFm4F0IRRkyekKNfPyCWMMHYpUFnOZQGTv76sQCpMEqY7EiZ/4pIoMvzbF3?=
 =?us-ascii?Q?X/jJrhfxYU9ElWLR4xWdmEvDiEy/pCc9wbviSLXTcwk3aYtqNdBxuQ0U2znB?=
 =?us-ascii?Q?k7R/cP4KeCQEGIrMN5ZYgFQcmWgzqzz7K5vdUbONpx89+HRs69VXsTsbj/TU?=
 =?us-ascii?Q?2Lh7KEDUBruL8JWVNF0TZHQQ7E68y2UZM/nz7z+lBu2LN6YodFkWlC3ufqk1?=
 =?us-ascii?Q?5HajUaGlZX95tqI7UBpg05NLMiuLT/iYmniI6RyyeAX0ONitBRD8l86VF8hV?=
 =?us-ascii?Q?Viy9tYc2cDh16z+v/+7VLt61G+H80JOYPrlZ3hphsWfn5h8VFd8YpRIeVQ+7?=
 =?us-ascii?Q?h4HFUB8HD4jmRD/LD5OD4Ec8C6rv0RGzOa7wyO9cwAY94PaUWxeypqScow4b?=
 =?us-ascii?Q?HEH9RqXEKUCe6fB2Yjl+gIPGtw3gbze7QLKW+hx02YyYo3ek1m8xt3W3PYQJ?=
 =?us-ascii?Q?OwPNJqgiW7sMNejqclDfAbG7Z05jcJnMQk5FJiPCDMW+6ygxk33W2ZwVH0RF?=
 =?us-ascii?Q?PX0EsqZrpbY2sfUFoy/EyABK/kjVjp9ddbOgWp9fgz11CMrWZcV8TeMJGy/K?=
 =?us-ascii?Q?WeJ4c55duky3bUyeykTH9SEKD7yRx6x73f1SPuDBSr2Ad0oK+13LfKn8lQpi?=
 =?us-ascii?Q?9M4obWFNiir5kHkYQES6JrOSUWGjxCB5N8rRUmkCRRtq0CRjUsHj+lpM9Cyl?=
 =?us-ascii?Q?RnCmHmP1Zlg2B3zA6Bf8mrWUoUeLeOUq4vOc0d0OefFZ0jyGBE+Q0i31Xpsc?=
 =?us-ascii?Q?EbN5GfFqkSLlHgDKHKa12sBwr9BWZXi0Tbt07Sf2SU2jwbDBhZ6Ee4OjuXZR?=
 =?us-ascii?Q?NAEMdxcosORVJzYPJaKQ7r3AVq3DCxD0uDznM1ZXduXMPR/Jfc5atUCOWF93?=
 =?us-ascii?Q?QKrHCPvFiJk1aYnQXtMc0z/9cSm1QlPXUGQKrhGpDmMefJqbl9/ICthDzxhP?=
 =?us-ascii?Q?GeCnUZTW34eqHrQhJg7D6BaVmw6MpKiRZ2ySc1yUkIcWBKcz3chX1tMVeIfV?=
 =?us-ascii?Q?mUFILQEgWNKBvQwjFg/3C4a01R0BfehPl5GdJm8aCFyL4ZXWFsw2xSLN9jEg?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd4f160-66ec-4819-613d-08dbf1a127fa
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 12:37:46.9880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qS3/F5VNPG3KnlP80LHjUVLhp/WWVfkcDQy0NcWMBa6F/rO5Sm9Im7K7hB80HXo8lfrO6x+fYUDrr7gmrcgr5VFayEo1gDgL3R9yU3iRBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6986
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/uapi: Add support for CPU
 caching mode
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

On Thu, Nov 30, 2023 at 11:14:24AM +0000, Matthew Auld wrote:
> Add back the padding check. It was removed since we originally used the
> other u16 for the coh_mode, but that was removed and never merged.
> 
> Testcase: igt@xe_create@create-invalid-mbz
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d59501ffc22a..7f012f4c2b2d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1840,7 +1840,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	u32 handle;
>  	int err;
>  
> -	if (XE_IOCTL_DBG(xe, args->extensions) ||
> +	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
> -- 
> 2.43.0
> 
