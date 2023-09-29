Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2722E728F3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCA110E13D;
	Fri, 29 Sep 2023 20:38:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8C110E13D
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696019905; x=1727555905;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VLHjk93C/gM5efUb9NzS2dVvm3Rd6JXLEk3xrJ3XbXc=;
 b=YFg0dIaSVOOHvV4bQ4sTmDd6Q6OdLV4zUI3aLIQWaekg8LOUWWZIO0jD
 f9rNg3SGTt6cq/MdIhqRL3IbDtVykL28Hog7lZznK+3Mw/ZgIUMR6pYih
 lTkUA0SCVD+dQ86JGmoAnGu1TrBJN1lI9ScFRFLfTOgFTCwDTKGSo8NHu
 quGSZ1RrTQuhrmzAmjYp8QrngbBKSkQ3SkRMJESDL/fZ74tGapfEI350Y
 ud0GWwsfgU71pSZal+ytwEK1aDxjDXIhvczOf8dZpiZEQyvftpdgOMZgp
 kT8miNfdzkanumu7Mgqenbp1lRhYflSzB0ctKxVUxyr1TrsB06nj2yOLV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="382278236"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="382278236"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:00:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="785184804"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="785184804"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 13:00:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:00:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:00:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 13:00:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 13:00:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E73pSL+2n7vfiH0mSwmPAseHeJqPqt4C+jafOHmMQyPiPMRMnDn8xXBDp8BcM1G0neNhTkb/2nUjhGBKMUVw1Bh/HP5bSXLQS6hL0Ds8nNdYP7gQCXaecmqzouM8HndUjT6C9jd8BJ9aLdbOHPKjkRXOUoZllAw2b2hr9LMzddfSQWulGbntqSSIq+TYZnDebXgBBk4t3d9x+1ligdmZU8mN0/ujZIDAgpFphsqpdCnWc1nd3FiDvBKWIhIsW87gX0knVpqn/Q/sSmAsUcGbHvdf1AXq/O67r/maQXEE9yfoVOKaPZ4ZY65wt0q3xbAxwUnG1+yWIH8uJEXzX39dog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOu5CaEYvsbbTaKtYSRtlTfdXJIVm33gpwMBEaCa/W4=;
 b=jr8j2YvWbJiNXS7ueggOr5cQtfzuzHF17iuCMCm2YYQ+1diJhn72etoG4zJlaDlzSujK2UcN4EB/4UVYNwkePP03XLT+WIPU8CLt7euTMbV2MHdvDt/wnSCVVvOC+0snM7lD9CL8VzjTQVJ06HZ84hWeliqOPRJhU1d0aIlSOCzy1B86+hm+dd6xHoRTHkjscNPcr4ktcNeZ5920eNB6Wf26g3LMJHv11ukXVlC5PIRYlJ0kUEQQ0SD8ihnYS8eIY7+4r2vNaanHlj6msKqm8IYkODbfpqNdcQnUc0LYxyS15lE4Ys6FU+xOSedB7H3FajKXQ8Gr7yTdPclzhJF8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB8522.namprd11.prod.outlook.com (2603:10b6:806:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 20:00:01 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 20:00:01 +0000
Date: Fri, 29 Sep 2023 12:59:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230929195959.GK233750@mdroper-desk1.amr.corp.intel.com>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
 <20230929050253.3153804-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929050253.3153804-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR21CA0020.namprd21.prod.outlook.com
 (2603:10b6:a03:114::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: c38a0b38-e51f-4753-6fdc-08dbc126aa85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x8X+bHXP9hMq1V44DDypg3oIRlDDhb6rcK8fGMD/81/zAMMCSS+No+nW+KRvV9QI2RCKtD85pxdXKwWDcT+aWXa4ZeFfdaaWuJ9bGWFq8HGbeupixHNHjrzbNo8nRc+OQK42JRPHtITqF8Cf/E5mm9Mze6LMWqghd+A5qMDTfJfYsERvLO/+IhPOWRrCTMKNJJFEqbaYks3QGPJcanMg5hzLeg5hETEnKcrR9mKnSA6+WhZ0LeStPzy6JVvqzSYZ8Hkt79sWYu8hRnZs4ylus85SJ9HNXso03oD1dxQTwOyW4qN32AGLIl+is+FHxm9ttX4uUo8y5XPA9f4KJU7E25vobOKT4PGQkEdzY7Xz9MV2e+06j8i+5OYliiguK8uuZJRBKHiOPMCKIYEU80dcB9QcbJmwm7OG7LEbD3s3cTT7SpadkaR7J99QVOFn0iRaZgPjbYGhzSHA8KtrFHK4PcxMWn8Je+U4YajkolnujBeiGKO5xbI7mwezupxvu70mWoiEBba8EqzNstE/w1nWaekaTNzzq9Emqi7DPSdaNgLiBMObvuIoejCQWciZlhu0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(39860400002)(366004)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(6506007)(66556008)(6486002)(38100700002)(26005)(82960400001)(1076003)(33656002)(86362001)(478600001)(66476007)(83380400001)(2906002)(6636002)(41300700001)(8936002)(66946007)(6862004)(8676002)(316002)(5660300002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F61GGguqNa1Av0WUOfR4t5sLsAg+09xnbOwqYw4hS4mFrc5ySYWBAtNAlsAN?=
 =?us-ascii?Q?26brN3sf0F7HI43Nnwmt0dqds1UT5oliyvAsBsmEZ+ReRNf4ZFq2g7BSiSYK?=
 =?us-ascii?Q?rPx99itCrrkrGBCRxE3WXomSxDVv1n53bpdGlhdSj39dlvP/BtURCEoL/LuG?=
 =?us-ascii?Q?V9RDxlnzPTsTP7tOK/9MMJKUQkuyrpKFAu6YZp4ToG6AEz/mHgqQlu3h3AD5?=
 =?us-ascii?Q?XZh9UcMZehxzt3EHpREjKrJRDMqEzCSnKwjbeWtNWfrnP29+XVDjXwbbR6jP?=
 =?us-ascii?Q?Z0JFlSoNoPDfit12Ap3qri9zOJeXULvOKxpzhidmfvf77LPFVcT85iEf+/eV?=
 =?us-ascii?Q?+srOgYS4YuGEU/PwgNTz/ursKMrJxKt5+D5zBmSFFHZ9LC4BMzvoiQgSBw2N?=
 =?us-ascii?Q?2lG4zvRSkYC6SlNm5iq6DMmBUkYhhjMbzOVq1LylCB6/doMkcs93lM6V5nPI?=
 =?us-ascii?Q?e+w1zS2XCTOg2Y4ZB4cBNfmYlOpvFuNsZY9NLU6sAqpks/9UtN2+JPC5Gx41?=
 =?us-ascii?Q?Z6IXaKFNnBJmE0xwf85L7HE9As9FNuvZAiBFtCwPIYhqaVXEX2lwhWSoMZQy?=
 =?us-ascii?Q?dBVcbv1FyFkzHhUlxT/1U/W0M6eDrThh6emSD82SpJJm+2uy66/XaNr9oIj7?=
 =?us-ascii?Q?ceMppO5ZgK0hl5VlTwQAUN5K/g4kySoVjlDkDVskh3CvHB+dj0JaeYpWq60g?=
 =?us-ascii?Q?rD9jU1AWabcZGD8KdfyGcuNnOTre8o7Veal4vQi+jvor/vYGt8AMAVHrra6U?=
 =?us-ascii?Q?ksXmU7YocNi56RrCHQOFoVpZ4DYCMu8GL944cT4w8VEGicLHT9H11ryKhvOM?=
 =?us-ascii?Q?MfbNBDEx9Ox+w8MgivKqK2Geyp7MC0tjqm45OJ2hLmFIbuifoOu6imp3LTWY?=
 =?us-ascii?Q?zQRxShS+sMsXcLHP7NtP/sFThXIERmD1w/sHecjKShhOMp3V1snT/GQJtJD5?=
 =?us-ascii?Q?egiuYTrStfGP/1ZmFmtuf0Lr1noRMNbctmPMtTL5H6tPH/5q8hte73m+LzzA?=
 =?us-ascii?Q?KDUQqK6mdbroKu3637tfxN8UiR5dhzAtWpE3xrPbumijJWdm2Oc0y4axuhYP?=
 =?us-ascii?Q?WNqiBGqpLgKPL2T4tJx/a1n25FRbbRxsSBNHoP0vAwwiDWFgbuAtmtPbfQYm?=
 =?us-ascii?Q?mqRyFXYEJzVUvocWy4ChUKJEivs3IwS2oHOANe/6tpg4wRQiCcCJwfHyL1FR?=
 =?us-ascii?Q?6T3/SGJQD2vzzaPYGXCggRYP5htybbLPSahL1EAN/8TwMSd4Gd63QZ6GMRxK?=
 =?us-ascii?Q?SqEiApD/1KWA6M9LKUYVKrYbtbikkGCB17QPkA+QfvTR98bexMSykQQ0IlPi?=
 =?us-ascii?Q?NuE1X5kKSjbY7ywZokdb1S9+jV+OKHkorhtsy0eeABLHAtiMYalXvNJqHWxl?=
 =?us-ascii?Q?NjYIAUDh++BFp8+4ROYbiHN5OY1dJ03AZFYBvOL8y3zOE5u9GZ3Eb8TDvBK1?=
 =?us-ascii?Q?OQJ7E/9MjUGJ610qqpuHwdJsuDhfGpcxeM9hvuEo+UyeWc7VEC57kD6oSFp4?=
 =?us-ascii?Q?5RjBpzTJ0CEXAWo46heOnbkCE1DPtDXxM9FdG2rlw2jwHF825DJsNIXllETx?=
 =?us-ascii?Q?qdVbN0P2AjBRwzQxJnV6ocVxNTZe0msWTYMEZ5Cqfc5djzKGFt35/0IK58pl?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c38a0b38-e51f-4753-6fdc-08dbc126aa85
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 20:00:01.8611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awd2yeD28TMXcnTODuynXhp+ZqEvykuyLmq1wN+0osS9dBai7UHj0bdeBBJXPye86A9G/2YESqmI7fNeBPp1IQc6cH7xY8maXu8ChPfljbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8522
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/7] drm/xe/vm: Prefer xe_assert() over
 XE_WARN_ON()
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

On Thu, Sep 28, 2023 at 10:02:48PM -0700, Lucas De Marchi wrote:
> When xelp_pte_encode_addr() was added in commit 99a8844441ba
> ("drm/xe/migrate: Do not hand-encode pte"), there was no xe pointer for
> using xe_assert(). This is not the case anymore, so prefer it over
> XE_WARN_ON().
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index beffbb1039d3..140a70d91d76 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -17,6 +17,7 @@
>  #include <linux/mm.h>
>  #include <linux/swap.h>
>  
> +#include "xe_assert.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
> @@ -1293,7 +1294,7 @@ static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
>  	u64 pte;
>  
>  	/* Avoid passing random bits directly as flags */
> -	XE_WARN_ON(flags & ~XE_PTE_PS64);
> +	xe_assert(xe, !(flags & ~XE_PTE_PS64));
>  
>  	pte = addr;
>  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
