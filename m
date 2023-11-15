Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88463C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 16:03:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4669110E0A5;
	Wed, 15 Nov 2023 16:03:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB3A10E0A5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700064211; x=1731600211;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yoh27wD2/WitquJdmtT3zpT2LEAc2RWKo7haHkXhEpo=;
 b=L+DvOguUZ6CRiR0SwPzQHXo5XglISzYsqXgrz1aDIfzGoZzdvmOiuUKC
 WsxulgHweMF+5OOkzC5YB9dASUIue3MEmCstKF+XrO6MRmVPJHFHeI1sP
 fit/S5OtiqhxF6ivBkgAmgZB0gEuzJ2XmA2YKSJbEjnTyH44uSRDyS0s7
 TPbn6q1JJnVsMSu+30cp5Ccbdis0c54OY23OAoC3dOF++KfoKodhRSsb/
 TwiCujPvWIRoNNPTbh59tjTWdEwknT6nFUKISBSDGjgUgXNzgtAhY+etw
 l4uuPg88m73TLnjXV2ChFQZQYIl5xx3B4cFu3ICwCIVvEMYC0+lFQ/4s6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="422000052"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="422000052"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 08:03:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="758530121"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="758530121"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 08:03:24 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 08:03:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 08:03:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 08:03:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9BvCcf4rv5x3ERvOQxNgQFm6N0oKB+yjDrWRcoKlIZY1A6pSNy0gLb42dyiTbrpGqEzOt8VpM9qEN3rsxnov/Gg3zNd1ShGGO/gjIWUr9083OQ9MbIPmKWq8BPUidAT/RKnPZ9pfQcgddBBpCcrZy7/+ROIFtpCNkW8cuXrjcSORBSgI13KkSwE7NUEuQ2/o8lsffYpvipmRrXeXViEreetAP3A+DFkTSwaHNoEhw4VSnOpft/ziXVH38QIsB6z5/pOpQc78a8UPeracey0RllSF55mjVzWzLL4dC7tswS9VOBOxag8gcqrLhPtgkCv6kF5Xc1imYR9gFlpa0UHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5gISYulRf6VV8Qec9P324QGIVYouyW89/WB5bP8GmQ=;
 b=hFOhPs55jR+ASLL4/Wc5Ui6AaLcFCyyNNtUEpgVZTyljAng4E+dk2OpgbjchIUayH5cC0qsIwRkGKktdfASBw71e4v45XSD87CSGPd6y0unuUP2Al1qV34mgixargHsAwhLNCjmgi5Cwmb2Eh41jRd4kL9gpEVH+dgeRvXEpRJ9zC8twQ4GMble0KZlUQjCvjiKeNebjc/+DRLzQj/nOydZ2Duq01n2FMdGKwOMQ/WtN/L43piWB5CSorXC1hvtDPKNVQVTu11uBu65EKH+rKvcjpM4yDeBPm02pEjacEALM2SzZ+O06Nuc9Sy6aQwzjlxOyeswbNi2df6b4FmQ0bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 16:03:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Wed, 15 Nov 2023
 16:03:21 +0000
Date: Wed, 15 Nov 2023 09:02:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZVSJDUCjd+8Y2KfU@DUT025-TGLU.fm.intel.com>
References: <20231115113748.1949-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231115113748.1949-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 763735be-746f-4b27-331b-08dbe5f463bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VVOPQebfGV2sCQykhTbCA7XJw+Udatrd6PsNvULnTV/uODnjDx2xjHGK6fQviM2vlvwg2AC748CBxPbBYPGMXTy6JPeiXG/8WyeTFePBp7W6M2QZ0sZ0T187fk3ACWGL62bTs0iH0ocDsVglNQ+nf4wDz7FuHJlDmhsjDRrir19r77ABhPI7l3ou81LiTjvgW4BhKOJeIRlnwlhnwaex7keX2p/oJNX/mPj7x9d9sVnHu9M4GV7vc4va2RF6r+uq0X7g5fDeRS80H7jmt7OthWG6acKAyjQQ2oTGzrEXBGJjGQaIjHSr45tJ29fOx0tIyTMVmpeSgMUZI8VtNIgpJe7/Z1eLL9Gf+FlihTkfbTeZfF920fxF9r3CQ4iZLlXToGyu1s36yswuW74s0MsBpGlzrukB85nL1P4JsYO5Y8xbNZIMdY8Wfay0vEcz/u79BvSJnU7LLb3nIkD+eyFRvm5U50cJZj4hQiIDXuAYWgWh3AiTKN/xLhYRWIhSGl3/AP39/2A5FKRMsPOZqUfzM7ZdveLTk2LjV1eeV4OC9DOTEtXMG378Vqy2KGu+WWTzVb7eJB5Dq8QkNKdyCRJCj73dzyuuKsIZMhj3cfR2sUc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(26005)(83380400001)(82960400001)(6666004)(478600001)(6506007)(6486002)(6512007)(38100700002)(86362001)(44832011)(5660300002)(41300700001)(2906002)(6636002)(316002)(66946007)(66556008)(8936002)(66476007)(4326008)(6862004)(8676002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?REyQscD3DzO+/YMy1VCQahrbafAUNw/OWXjwCKVj+dIEp3UNPGUhPqUFKb2o?=
 =?us-ascii?Q?somelhFNI3KXs25pO7bx1h3/eRr+woiXfVbHUovRPeXERsqcwGxAHU4fXpdm?=
 =?us-ascii?Q?2lJ4YKeMDTHNX+KH4mcJ5GWo7hbkCLIpT0T1mPVTb8Ksh+dhbrJQJSfyZBbW?=
 =?us-ascii?Q?KwkvlJ0n82nFsMyo1g0BfCuwTHHMJkFqAXBYzEChYuiLisBjBlvsJbWMvtb9?=
 =?us-ascii?Q?C7Fq2foh0vIVljAh1h/77ceDyLbxyH3LXJLN6++V9VZfYFmMKVj3zaJaknpw?=
 =?us-ascii?Q?DiEQZVjIQw6ZFfO8fwhZg+/wS7qZJdw2d2PMQiZ0PewTinh08D/SYbE6590M?=
 =?us-ascii?Q?PZT7Yye+LTuhwXymqMTtPoJ6nC1Eb+LbF1TRauhyfu2cD6HdTjly936vNfIK?=
 =?us-ascii?Q?ocKq0fAcpkSlqBSVeLsmh226b+rJ0ahcyfNR82OuulISFpPtHDY5SzBOCsI7?=
 =?us-ascii?Q?kGgd5kTsg4lrjbDoohasemMBiwnvidB1ejlbqk5/pj4mceHbhNot+tG82Wls?=
 =?us-ascii?Q?PYMy/cy93AYs1AoIPkaGbd9v86/jqifTcj1Dj7CCMkn1jdVZMMyGgPgXaBvp?=
 =?us-ascii?Q?qhDeNUlwYkx/MW4gEmuBgO1Jnbv/1HLe61cUzoDLq4ayOaMUS4MZFVRE++1C?=
 =?us-ascii?Q?/g1+M+rV4qz10epXXl01BGGdu4loMAuyljFYn1fnXzoPZugDvRlhlkuI6W5a?=
 =?us-ascii?Q?HFhu/4jZ4P1bjJQiMqaKSKBDj5EkZ8AQcZWQpnEijuktU+ZfGX5lDboySrAz?=
 =?us-ascii?Q?nITI2prw6i6sO7jUCGtFRtRmhiLYTGAc2DD1XRij0Exm0iR5aB6vjLX80zQb?=
 =?us-ascii?Q?Cb0STJkJBXIsDQSjRK1gDl/5Z8xv2JOaxiitFjsBZWBLcY/SWNCamAeFeeE4?=
 =?us-ascii?Q?NvMeCpOTA3KKS9DhYcAxrKruS0GbImzDqLqUsyiMbbYhK76Ea7Qnga4TcQKl?=
 =?us-ascii?Q?xKLcOwO9tCRDhUZdW67grkYQVd0BST1/15VaKZo3fme9kXykAr47erOXKvY6?=
 =?us-ascii?Q?+AbKZ1gnwzpHSfasNjyk6QHPCH9lHle14dqb7L4k0hFvIjW2jO9P8WINv5SE?=
 =?us-ascii?Q?Z0+GwSGIwYJElT+48t/Stb7Wp8xhi1k1OGuLCzOFX4Fi671yTY9tmfMNymwe?=
 =?us-ascii?Q?FlFgq5AxEtxyHkboAmCIM+egqcT6khxsJ5FbcM63sdZ7r9VetQedRxR2d3za?=
 =?us-ascii?Q?DARRprCqfeyBFDhEldCYn2fAB+tXt4WZ/LOcaVA0blRv/82xGS0WQw4HUyfw?=
 =?us-ascii?Q?Om49WlJPyv0G5/M71wif87Mx9D8gjr2R8RKlDq9Gjidx1j+VBxQnk3vLKN0c?=
 =?us-ascii?Q?TTCDrXpIRqE8veY1h3zj/75iNr30vA55YK7EemxJg+Y2HpZaG7XSQ943Ev03?=
 =?us-ascii?Q?+XTfqh95sWKmKCmTTBACJsmaJDe5tdCfNqSPDSziHyZ+R9dFwT/2kAznUyJK?=
 =?us-ascii?Q?kho/PhXlqnvQxxJQ9PBsZEGd4E9H0XkO/XlDtIyv77Y7Utxs4/qwFXU35TT9?=
 =?us-ascii?Q?Ge4pNCaTlPSKKjRkBz0we04fwVEHW7fT4ThFAlXslDueDOCAUmpfmtKKf3Pi?=
 =?us-ascii?Q?JEhrJopYLNVZpM1KIUkQSjS1AoxGCG733QpaNYzQAtUixAjNj6vw68YELpLG?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 763735be-746f-4b27-331b-08dbe5f463bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 16:03:21.2777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhAE89y2gbCZjrsSsVWfKGH8rBRWu4DzqPV35i3Haq2wSZOq8MyzBnE+98aDKY2Udt796nmigqjMRN/yA8fzrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe/guc: Fix wrong assert about
 full_len
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

On Wed, Nov 15, 2023 at 12:37:45PM +0100, Michal Wajdeczko wrote:
> This variable holds full length of the message, including header
> length so it should be checked against GUC_CTB_MSG_MAX_LEN.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a84e111bb36a..c44e75074695 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -419,7 +419,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	full_len = len + GUC_CTB_HDR_LEN;
>  
>  	lockdep_assert_held(&ct->lock);
> -	xe_assert(xe, full_len <= (GUC_CTB_MSG_MAX_LEN - GUC_CTB_HDR_LEN));
> +	xe_assert(xe, full_len <= GUC_CTB_MSG_MAX_LEN);
>  	xe_assert(xe, tail <= h2g->info.size);
>  
>  	/* Command will wrap, zero fill (NOPs), return and check credits again */
> -- 
> 2.25.1
> 
