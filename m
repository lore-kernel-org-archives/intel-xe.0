Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF1BC6FA8E
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 09:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15EC10E424;
	Thu,  2 Mar 2023 09:34:35 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793E010E46A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 09:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677749673; x=1709285673;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BLsUlyQJV2D7Krkes76FbKizxEChqGMs7uM5XjCSLvk=;
 b=Rjj465IYX0a8r+AVvzKCh6wCYQGsaT0RPxET1b7ZMONAKWNSlscy/moh
 mCdWhyJKBaBNlUaf2zcXG3LAU7hPCU0HeA9K68GMGvtuPIIpXBM0uzNAU
 hxj/XIyVxg2uQ/VE7AYYI2EVQzgOpQLNFYXbnfvbNF20i+EmQfquNCMbM
 nOTlGFzwsB4Se6SBBWqXOpDLwEVju/BgMusibr8gfXuP8ICpQqERAwvKm
 etAwhhArM5i2RRXDSRxv0vC6BZYj3hXr/hJ5fsVIh6XAFV+O9RbLIiSkC
 3X1oDOXaXDbHKmnAtbRSOzcs+dLFp6JWu6CFQ1q9ORyjLHwyDTBmHM6Dz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332158377"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="332158377"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 01:34:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798763013"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="798763013"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 02 Mar 2023 01:34:32 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 01:34:31 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 01:34:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 01:34:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 2 Mar 2023 01:34:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A07GsBevk11ihd/0UH2CrAowdMDrd58EwW1KazmqJfUfiyg1RUL9bFw5HHCJEsnMdbG4lJ+Jwaey2kfHu9H4h6Xgh4+h5MG6le2oDBVSpvJqedhYHhk8S4l6K58LJDqNsgWUqFqG9aioqArdELkppB890h8S2loHyfjvdIm9hu7yj+L23EH0xeThnTokK8MSpNU+7jf90JvbUPpGusvL9XUO5CSc63TKzPbXYv26C6svOF5K7oH+nkY9cxldB8dlwC3j0TJWqRysv/7bijMK1MtXfNpZFUg6Uwf+tduIU1J8cfqcC7MWQiLPkejIAEIsbCmaOxBuWPqMNUG+QsgBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rO/LW9smjMkVsIzXupBv72hPV0rw4WH3ieOIK9k5uU=;
 b=oaZcfXmH8UI/xd3zKFW2r1QLDppjYEemdp/emmc6QxvPrRURMoqCTqOOaiIixLcA9ti23aH1PDafjzGWXTQnAs6rN4rOxyLAGrF2m2/QamP5VPZbuo2eWvxiH4fn0R7KcQ06WvqLBXZyAuwOI23hk8XmVgS9DdmVrebFa8d+Fs4O23AoQ6GfT/hcAgZABYTVzNOJT/D4wv44aqW/hNCzcd7+Dh9zEq/YAl29Fn6Lcf6VcEEoeVRZCN4LdwrAYeBWtbyoFWE7/XAhV7VSRnXJStVs1ogDJclGCYo/IpYfhW089q/ztIBMM02m8w6mchyVRlqK/ChF/TexFimAXJqHig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA2PR11MB4780.namprd11.prod.outlook.com (2603:10b6:806:11d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 09:34:29 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412%5]) with mapi id 15.20.6134.026; Thu, 2 Mar 2023
 09:34:29 +0000
Date: Thu, 2 Mar 2023 01:34:18 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Maarten Lankhorst <dev@mblankhorst.nl>
Message-ID: <ZABtmq8b5xdEDqNG@nvishwa1-DESK>
References: <20230223215618.24326-1-niranjana.vishwanathapura@intel.com>
 <52d3aae1-a023-5ac2-b7b9-e23acb0a9fcd@mblankhorst.nl>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <52d3aae1-a023-5ac2-b7b9-e23acb0a9fcd@mblankhorst.nl>
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA2PR11MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e02964d-81cc-482e-d419-08db1b015207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hub7S+9KqEhTkttmMmG/0yXpt529VnNcktjIyFlKEFnbitNvWFtKKmibp3p52eHV9KNoskcPmFWggv7dU3syyn/+mit3p+MNHGCVkkbY4W3cgvkDVx8uMaX/IceglNbwS3frM09wSXWN5bt8vD5AyIxFnUNOEf1zq4XGYWp5NVTZrIHhDVJs0zvEUh+jxZ7RJEZMJQbRpvxfOn1tApYFsYEvnxh3ZY3RGOaabipY1i7pZiYfCFZI96CKzaK7IExpxtQfg6Vbk+UcazjuN5KAcW27uN27Es9QYKM55iQ0A2K7bMEgACq+f6tDNWqAevSXSSj0QmUYqu3P+NGQalpL+u+yotM6tD4pJdEswZPcq6Ddl+UMgoAL8jJ1h3t+Ud6qdGgk7u/N1Pw5hYs9DcVr1iH3yyN3LNzBUYhAAD2CqQyLFIrvQ8+EOBjd8NWWlg5vm1+pCAoyrogIz/mW6Yftwic3XtpLpozRR0B+OjNAOsT+0aYB0EWM00Vf+LarWSPjQsAHjG7SePoL4R2vI3pyTuCUDkhjDGL66kWBMJ1tMDBjQtXVy7vOao7ZGnxwUDxzRbEW8eSx2D90mAojBke007DKtfN01NznBm3sXbUK2dY6IDIC92g8fCNjdbM4ImRCTT6gzM36vIabidTuJ5YWsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199018)(107886003)(6666004)(53546011)(6486002)(6506007)(186003)(9686003)(26005)(6512007)(316002)(41300700001)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007)(44832011)(2906002)(8936002)(5660300002)(478600001)(82960400001)(38100700002)(33716001)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rz11TYVgNXbR3OYLCM0msjepKwcRDVHUbSU4m92cJvkY7/cA3eWJ2acxuIVL?=
 =?us-ascii?Q?QPpwHcu4JNLJnmh8T1SBUCs84tzPzDgu8LLVBwjn091SxPmFsQ80YGJPMNHQ?=
 =?us-ascii?Q?2wtI5sMzcTcPMbNjqMd/yWwAIze0s7FaGnfsqX3kZTFUnY4BLXFnrg0wniuu?=
 =?us-ascii?Q?OuWmpiqOqvAnXEta/OUJ+dQ1MJZuF148XqJvQQ5oAUyl2a0W/wVNTv+lHpil?=
 =?us-ascii?Q?CBkwK6kqQvynAL8pYD1fI7wz4VpMeEqdQ0gfkiCWMeP2WBogtIWfdtvPKTkz?=
 =?us-ascii?Q?6z5bPcmgxD4Pbb5jo+wITD14Vav32BjAudX67euKzhQPQFC0hukD6MVAEFX5?=
 =?us-ascii?Q?IUzbWO14Tghcyvv6LY2gfzPrt/t3IvcYR4t8zDjdUPcWjM6vwX14Z4DQm2eZ?=
 =?us-ascii?Q?dlzZ8eDYgiuG4Lg4bb+M8BOaaExNyr8JnxZGTjKI5iL6zOelYYutXvLuSOjz?=
 =?us-ascii?Q?btqhmTbfISK4mF5851aFJSZrDRIcSs1G+L8QwK+tLKm2QodiWmHXekyZE4SU?=
 =?us-ascii?Q?+uTE7kuoRNBS3ELEgQ7xY7520VMkawcL+A2eQyLJRJKNTcWj0JrOrOWg6nwi?=
 =?us-ascii?Q?vKsqhjvr/Z7MpRqL+lI6ngoYHU7e4xXkTRzaahUMJNlmv11PH8iVsGJtYaNg?=
 =?us-ascii?Q?Gnx8eroyC9pQXO+Tx+DCyuo1dxWRlC6TjOb4B8wM3eU1u6tKnsvNh6IzkVC7?=
 =?us-ascii?Q?4UazmhxBdUUORLrxe4Je009kvGpP7x6ZOiBfmuSd7AYyBi18tW+PTTk6/7N1?=
 =?us-ascii?Q?RlgrDQsO0T7KNzN/Lg4IX08aOtgCUCRIc9vhlwZywcPGI+XwEt49aaKk1MAX?=
 =?us-ascii?Q?n5bQfbzrq7GB6WHmSXjK10FNq68zZ46pn9gS3vcUS+Kh5pjjiZ/pq8LK08SI?=
 =?us-ascii?Q?Ic1Ny+Ubl2pe0BSoeS1qkq8ctxLsndKN0tRr0UjAeb2Qc1Sgk1PQ58y5FmjV?=
 =?us-ascii?Q?Qp8p41zR/CzdEOqoZ9qMjUfOslMncfW8qYx2MONg0jX82C2OBEhxkJtnQ99u?=
 =?us-ascii?Q?q07FczpLi1lglHhOTd3IX3OpmH8JWK3UOOIlpL5x7WkpjHm6Cz1WyXWM+dkt?=
 =?us-ascii?Q?Ny7x/zsi89vlIG4AX37eg4vvd6ObrUHNxcLM6sTsfK6STTElHqTpk5LNp7+g?=
 =?us-ascii?Q?N+wcYNcmL/OSaDlEiN6KQF+Jw+yI7D9YYANOQTFOrjk++/yWFHTlSUvkGzfo?=
 =?us-ascii?Q?SyxP+mxN5fue8D/jFc2ncHLPhLJDb1kgzeRLlJvPTrhd6I+0dVByBRU7myfI?=
 =?us-ascii?Q?bZDn8NBLz8qcQOD4V+al+QNV1aN9wz8prIr0zYyGyjMNI1xT0UerUqBWdh0z?=
 =?us-ascii?Q?ETLuk3nezAI6ulTQ92IwguuY0Wtxjvi5DLTJrTIjFX6yowMiGdozGv5ic64z?=
 =?us-ascii?Q?Z341Jxifzn1ddqssAMumDoyMxv5sNKUcLSefWagwpvRMqDN0HavLSWB7Mez1?=
 =?us-ascii?Q?mI98T3rfnXEAI+ntivaJHbin6Uw93HTIMxtd8ESgVeuWgjwOMUpBfRTxHUKN?=
 =?us-ascii?Q?rvj+JR11MLMjNVs4FC7jVzHIeWqOdL0vpFiGIs+6EVLNw5NuEN2Tkf6H7a//?=
 =?us-ascii?Q?4fmbOOnXsCYzGtMNZVfurVf+JYjaL9wO+mcYNKFdPyGsvUOhuVA9gtD+sB0b?=
 =?us-ascii?Q?uenFOwXMLVb8PYYhcAGY7ME=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e02964d-81cc-482e-d419-08db1b015207
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 09:34:28.9937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +INKr+e3aWZI/IU/eDUAKFrPaMOGrCj8Ntu/Ap02qU7dbbh3NaNhXjuCCO0h+LcvQYBq+nflz7IuHsEJZn73Hy9GnQ7p1QFxaUsjmbfqniTIlIVa8TzFwyKXsbQPOKSH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/migrate: Some cleanups and fixes
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 12:04:16PM +0100, Maarten Lankhorst wrote:
>   Hey,
>
>   Some quick notes.
>
>   On 2023-02-23 22:56, Niranjana Vishwanathapura wrote:
>
> Some minor fixes and cleanups in migration code.
>
> 1) Remove unused 'struct xe_bo *bo' from emit_pte()
> 2) Use 'false' for is_vram of  emit_pte() where it is obvious
>
>   This is a matter of personal taste. I originally put in those original
>   calls to make it clear what is false exactly, instead of having to infer
>   it from the context.

Thanks Maarten for the review.
Ok, will remove update 2)

>
> 3) Pass source bo as 'bo' in xe_migrate_copy() calls
> 4) Kernel-doc fix for function xe_migrate_clear()
> 5) In write_pgtable(), consider 'ofs' while calculating chunk size
>
>   Since you're trying to do a few unrelated things, better to split this up.
>

Ok

> 6) Update xe_migrate_doc.h with 32 page table structs (not 48)
>
>   Docbook updates could be a single patch.
>

Ok

>
> v2: Rebased
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  4 ++--
>  drivers/gpu/drm/xe/xe_migrate.c       | 17 +++++++----------
>  drivers/gpu/drm/xe/xe_migrate_doc.h   |  2 +-
>  3 files changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 03a60d5b42f1..12e8f79e65cb 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -148,7 +148,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>         xe_map_memset(xe, &sysmem->vmap, 0, 0xd0, sysmem->size);
>         xe_map_memset(xe, &bo->vmap, 0, 0xc0, bo->size);
> 
> -       fence = xe_migrate_copy(m, sysmem, bo->ttm.resource,
> +       fence = xe_migrate_copy(m, bo, bo->ttm.resource,
>                                 sysmem->ttm.resource);
>         if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram -> sysmem" :
>                                  "Copying small bo vram -> sysmem", test)) {
> @@ -274,7 +274,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>                 expected |= GEN12_PTE_PS64;
>         xe_res_first(pt->ttm.resource, 0, pt->size, &src_it);
>         emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
> -                &src_it, GEN8_PAGE_SIZE, pt);
> +                &src_it, GEN8_PAGE_SIZE);
>         run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
> 
>         retval = xe_map_rd(xe, &bo->vmap, GEN8_PAGE_SIZE * (NUM_KERNEL_PDE - 1),
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index cbcc355cd391..cf6ad1b1ccd5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -423,7 +423,7 @@ static void emit_pte(struct xe_migrate *m,
>                      struct xe_bb *bb, u32 at_pt,
>                      bool is_vram,
>                      struct xe_res_cursor *cur,
> -                    u32 size, struct xe_bo *bo)
> +                    u32 size)
>  {
>         u32 ptes;
>         u64 ofs = at_pt * GEN8_PAGE_SIZE;
> @@ -672,19 +672,17 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>                         emit_arb_clear(bb);
> 
>                 if (!src_is_vram)
> -                       emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
> -                                bo);
> +                       emit_pte(m, bb, src_L0_pt, false, &src_it, src_L0);
>                 else
>                         xe_res_next(&src_it, src_L0);
> 
>                 if (!dst_is_vram)
> -                       emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
> -                                bo);
> +                       emit_pte(m, bb, dst_L0_pt, false, &dst_it, src_L0);
>                 else
>                         xe_res_next(&dst_it, src_L0);
> 
>                 if (copy_system_ccs)
> -                       emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, bo);
> +                       emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size);
> 
>                 bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>                 update_idx = bb->len;
> @@ -783,7 +781,7 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  }
> 
>  /**
> - * xe_migrate_clear() - Copy content of TTM resources.
> + * xe_migrate_clear() - Clear content of TTM resources.
>   * @m: The migration context.
>   * @bo: The buffer object @dst is currently bound to.
>   * @dst: The dst TTM resource to be cleared.
> @@ -856,8 +854,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>                 /* Preemption is enabled again by the ring ops. */
>                 if (!clear_vram) {
>                         emit_arb_clear(bb);
> -                       emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
> -                                bo);
> +                       emit_pte(m, bb, clear_L0_pt, false, &src_it, clear_L0);
>                 } else {
>                         xe_res_next(&src_it, clear_L0);
>                 }
> @@ -941,7 +938,7 @@ static void write_pgtable(struct xe_gt *gt, struct xe_bb *bb, u64 ppgtt_ofs,
> 
>         do {
>                 u64 addr = ppgtt_ofs + ofs * 8;
> -               chunk = min(update->qwords, 0x1ffU);
> +               chunk = min(update->qwords, 0x1ffU - (ofs & 0x1ff));
>
> There is a bug here which should be a separate patch, but we will never hit it.
> A pagetable can hold 512 entries, but the moment we would do more than 511 updates,
> we would update the entry in the PDE above it.

Hmm, it is upto the caller of xe_migrate_update_pgtables() how to update page table
right? Possible that it is updating all 512 entries as physical addresses are not
contiguous. Right?

>
> The correct fix is chunk = min(size, 0x1ffU);
>

Yes I agree we should use 'size' here instead of 'update->qwords'. But I still think
we need '0x1ffU - (ofs & 0x1ff)' here. MI_STORE_DATA_IMM I believe can write across
page boundary. So, yes, '(ofs & 0x1ff)' is not strictly required here. But on the
same logic, we don't need to write at 512 chunk size either. So, I thought this
adjusting to '(ofs & 0x1ff)' is appropriate. Thoughts?

Niranjana

> 
>                 /* Ensure populatefn can do memset64 by aligning bb->cs */
>                 if (!(bb->len & 1))
> diff --git a/drivers/gpu/drm/xe/xe_migrate_doc.h b/drivers/gpu/drm/xe/xe_migrate_doc.h
> index 6a68fdff08dc..584972c4d3be 100644
> --- a/drivers/gpu/drm/xe/xe_migrate_doc.h
> +++ b/drivers/gpu/drm/xe/xe_migrate_doc.h
> @@ -21,7 +21,7 @@
>   * table BOs for updates, and identity map the entire device's VRAM with 1 GB
>   * pages.
>   *
> - * Currently the page structure consists of 48 phyiscal pages with 16 being
> + * Currently the page structure consists of 32 phyiscal pages with 16 being
>   * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
>   * several pages are needed to setup the identity mappings (exact number based
>   * on how many bits of address space the device has), and the rest are reserved
