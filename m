Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45948C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 17:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B5210E342;
	Mon, 24 Jul 2023 17:18:53 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19BE10E342
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690219130; x=1721755130;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LZ7a+vYLwV+0G2pHK9exwG2kaS25dKZDIw83SkisYE4=;
 b=U1HldiUjdf2u0imQyE+TvB9HZ6R6uP7IyWDS/DncsO0ilUs+0nuTiIRl
 jY6CEgjaoQSgbSulLwNByCOcRh+4ZEp21g9m0iUH4RX7bxOVq2Kpdzw7g
 RWZXh+GaSOXC6JhM+tMLTrgk6ZT4SL/W5+hdv7ohaEvKtzPrZpeHN0g+e
 Tw6AE5tE9fl9xNl4k1bXiqLRJ/VIPCzIUo5Gl0woMTfFEsLVnqitNPHBI
 PkaS6Ibw8lbZ7bi8JpmqEF1DDvG9RjXqCFd4uymq/uobrTn12Ngl/pjg1
 eFDizwBJp2W3RaeduueXjfQRUKUVE56Z/76kgV7FZBPssbsQ5wnCMy+gO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="371103103"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="371103103"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 10:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="760875338"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="760875338"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 24 Jul 2023 10:18:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 10:18:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 10:18:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 10:18:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 10:18:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkzBAU1hMyNSDZGg/ohJ4iML0EC34juJwMCX7/D9adlZWHTSME3BevRkeg36HI4v65SztDKMnssXEUUIiQW/6G6LNb1dx5er6+/0PliU6/CaXgsSsmok/3r9AfLcvbXHwm03RYKjFn0E0oZdLMHukVJLVmmSm9piRUwLP5VS8LGwl7RrCC2BqcNGTkwNwaKOiKYiCwIqnQMijQIMpp9Ss08BdaWPxaYEZXZTLrhwhQRhCyRoFlwpM80Giw2vcQkQGDly9+Qz4MzPzF+3knhMzWfHHKSwc8LZT+uIvBKR4RbXlhFpNIvllsqKkR6mGr9ZSxm/OrVT4YqkJjFfvZaByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okORSmLpQOmnVy8acMb/4i0NgKyO6RPKwvUQgsPBTYQ=;
 b=HU6dNSyxIUudATpylqQDslZjF3qtJAuoG61xmRLyurxlHlEjfovCNW1MzLjwHaMv6j+rgsX4SSM9mAppx3bTSZdR4zvMWKVBai2MgaA1AgRZJO5HSXsYf4dv5297T0uGpRZ4/1TDGtB4a16SIRy+YSZAlCiO08N+qzBGlZnESu36589hD3SUv0l3S4GJjTPOLfmIL6iZOn9lGozgoLIW/+36BIAuNFAOkM+1o9xcpHjmS6m3Z4EEksmU1B7cq2D10Opons5V7vfMG7CQ3TQUEN0iwDw31BFtktsMyOIemyOgNL5vFuAZHNV1ekI/XWYyGoL2vlXH63IEjWOSnb/OYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 17:18:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 17:18:45 +0000
Date: Mon, 24 Jul 2023 17:17:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZL6yODFgIof9MNab@DUT025-TGLU.fm.intel.com>
References: <20230722075224.22458-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230722075224.22458-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BY5PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:180::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: f098cfd2-95e6-492f-5bc0-08db8c6a0932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MMp3izuY1Ga6rvLGP4VyJT9YFP2NWSwW+LE0uEnDIb5WYtyjl2GX6tJYjF5QX8cQfw+eEMOxyKmCPYujm/tXD6vLRXcnQHj96PLXy/W8mtdG+mHXOJEl7QZLQLc0yyg6nFyRDYjhSxBN4uKAUBFkzu8TIEPzshhDyi2rZTKl1mqKQz8sv/BSRJiHHoNffo5N91cTkrUARbDO7YpmUGJXCm8jZdG9DBDXOuf+VuBoqgxmJf/KboT2EHO33MOBNDxg4ya1rtINWCAT5GwIkTmFR2wlLQeBof3blUG3GOxEQmff6+VkvS5cvueiCbMWDAg987fsrw6dmeEXvu7/wtZkDAw2jyCQa+FaeqZ0NEgohu1hngprz2fgGZpwLqF7UcsEl/k8nPa/NwtLhbpx/5VeVB4jrdG33Jg8kuS2lWnQ7k4mD73HzEcxr4I1YwOKsE5D7njXOtsWHUNYEJKYzO/Nv/iC+/dCXmyFIfn90NWtjrzXgpFmcQd1CLM2tmvGMQmuKolp9nPu0fvmh0pzmGFjAwJTojjYwp3QL6hubnwVkoZIyhpJllRrrU8aUyJB6MdA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(6512007)(6486002)(478600001)(186003)(6506007)(26005)(44832011)(2906002)(41300700001)(6636002)(4326008)(66556008)(6862004)(316002)(5660300002)(8936002)(8676002)(66476007)(82960400001)(66946007)(38100700002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sYeJyRucAgkXqNly7XHua8CAaMt81eqbmiIZLHezbq5eBqn0NT5YNQSewCHX?=
 =?us-ascii?Q?hrKzbwWPpzwcvfKdYjyWVN5Cr+Tg3JAhxNIZBJC9Ej2rXUtzqAhQZEeELcC6?=
 =?us-ascii?Q?kOK9hd7FBSCzjc9PVEOIRUZEKDZ5Ijg6E6uVOMYlqe/wCke8n4mldEYoCsAy?=
 =?us-ascii?Q?nfnDakKDOYQ4jhSLoTBKG8a8wFfQxGnac+JQNJ7h/PXLY9sOuWLGSYm3x4NK?=
 =?us-ascii?Q?SbLWdpskPD+LGp8POiIy5ocnARxboVxWyVwYFzGTF6BKImdPOxBPrSJR3hpY?=
 =?us-ascii?Q?WPzOQD5+014j4o6U2VO0t124fYGLdTN4Nu4zeQM2MPnoH3MwtfNR20SSYTvr?=
 =?us-ascii?Q?X6dRM8KCKZQ70m/jUYN/aT57xi8v7YMOrH2Rn8/X8eeIo4w14DuIYFi7xFdb?=
 =?us-ascii?Q?EdtG7Ar+ZA0vt0W7DrYBz5FW0leZ2guH5zzQHHQ45G9p0yAXS0qybCVwWmzh?=
 =?us-ascii?Q?EfQu3Wnm5tokQxBjhrDiCyc8sViXl0mhQY0Zsx0M62WEaaoxcRWUPVTSo/Me?=
 =?us-ascii?Q?Iutf6oD8noPK/JTsF8y7rcG+kQ7L8xMIM00RZ8xA5qEc9z8aKuT6HiRn1VF7?=
 =?us-ascii?Q?0cYAznvcjlw4ZShDAeB3VjrNho9ZhqNiHjVciXs6XrfRzb0MwiVlnqAhz6JR?=
 =?us-ascii?Q?R5DXkJ3FWqIexeIym/f2H+TROLM/zSrhAFLKOazGt5f3U4S3SUsumraCNNK+?=
 =?us-ascii?Q?Tp9CAZLCGvy8Jzm215tVFLvNdyUKh6zIWDyigumoP+lCwUx3D6PZyAZ94hQV?=
 =?us-ascii?Q?eTyesPETb45vVhAC4sh0HNAxNn6+xU9QkJjR72qpd2ZoALRaNdbMY7UuLZS3?=
 =?us-ascii?Q?St7RaLCJh056NTdrI5rrDhajTm+VzO+2zIaZC0hhiRYxmWV7yPs5JxZnM49G?=
 =?us-ascii?Q?1ArwlAsPeJkLECXgHL9RS+KV+mAPdx0wLgYuWgEiHAV2NsclrNjEANEBy5wd?=
 =?us-ascii?Q?MYxMwuhtabfffqeqWlbfZ0Bkv7dLNkB4lfmNFxaEuPs+h3en/0vECT0azFvc?=
 =?us-ascii?Q?s1Mh6/eT82Pi0m1vQLM6a2DoPHiN5zzXgXn4bJej7oXqnFZJ8KJdueZtgcUb?=
 =?us-ascii?Q?84fdwtB16W85+Ta19m1AUTFD5nnhX/9ARESr4zpj+a6+Qmo46+zeVfekzfCi?=
 =?us-ascii?Q?8yyfBnTU4iUjDtINEq3qkfR+mGlhkxWLLbQ4k531upZAVdmFdTPKBWUNa6fQ?=
 =?us-ascii?Q?amUk6iC74lUsyw/gx1rJCdn3eK+91+RKx93pr2Wf0p4Obz1xVzI1FDoxRnTq?=
 =?us-ascii?Q?d5D448FbN9H3MpbsS0zQmYGsz+Ehv+mpgAyN0Y1GfIIBsg8ZGzAxvoACO1p7?=
 =?us-ascii?Q?wkpnHsBvTskPe2S3ove4R8CNQxv2/7a8Zf+xrBPEpk8xi3WpoJNYiskHepFU?=
 =?us-ascii?Q?rocpMcK1P46wdpc9miQo5wNGz11X49FtAMqoZXAuyAUNgBuxdeIDsOjO0XBg?=
 =?us-ascii?Q?Cis8fUlEw++J/jzp/FsTVB1EmhTUmsmGFXjZx/zjo0M49yFVdc7H/vPkQ7lb?=
 =?us-ascii?Q?Y/pp6jvNSryCYbrl1eAnn1Rb9PaD5dwHsykLxyrMGkMZpuLZ/tHyIQ0FcG6A?=
 =?us-ascii?Q?dthY6UCmAtzHCUHE1VjVNTzw6WvCueI40jhMDUv6H865pUEQztB1XT8AcRdG?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f098cfd2-95e6-492f-5bc0-08db8c6a0932
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:18:45.5634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SoEuybmdbodtv+7TKBxH2rP0/s0/GTh8K2Bo28bDACNo1PpZ5SkMJ0ThCYUmcIUvr5GBuo/THSv8Wbr9yUWvCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8451
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use kvmalloc_array() instead of
 kmalloc()
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

On Sat, Jul 22, 2023 at 12:52:24AM -0700, Niranjana Vishwanathapura wrote:
> Use kvmalloc_array() instead of kmalloc() to avoid
> memory allocation failure in xe_vma_userptr_pin_pages().
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Change makes sense, just wondering if this failure was ever seen?

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 62a99c393d6b..6429d6e5113d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -72,7 +72,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	if (notifier_seq == vma->userptr.notifier_seq)
>  		return 0;
>  
> -	pages = kmalloc(sizeof(*pages) * num_pages, GFP_KERNEL);
> +	pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
>  	if (!pages)
>  		return -ENOMEM;
>  
> @@ -152,7 +152,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  
>  out:
>  	release_pages(pages, pinned);
> -	kfree(pages);
> +	kvfree(pages);
>  
>  	if (!(ret < 0)) {
>  		vma->userptr.notifier_seq = notifier_seq;
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 
