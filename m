Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A418E7F127
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 20:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C4510E436;
	Tue, 26 Sep 2023 20:49:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A2B10E436
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 20:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695761357; x=1727297357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ltaKa96sGaCeEqWYp+lvaIhsdI0GC8723spHiZB9AyE=;
 b=TbcNTGAF8VHHM/HA4HWnL2VTVMrGchx0/e3M1u/pVEjsHtSqiuZ6rkIC
 o5rVt6lQ6qve4hn2zx6E7rtsHcqrFmFumRksp8vOVuKZXgx1+qMQCoVck
 6LmkoXiHnIswSo9TBxH/Y58dQk/ojc/JHACRP5YppacOYiSlJFr4DBIfY
 v31B0/thbuvE/GWOECY5Ck8V9RmvAwydlTgwoHHwDazfaQ08+GjP0U66e
 6P4k3LhqpjX0LObzvzEgaZCooUB3XI1HQtOntd5SLEBjElSYv6KrzImH9
 +SeQoWAxFZGYmhVWQd9AuZz0EfFhvRqBYkdr6feb58TprYl4xM63BZvh3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412583400"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="412583400"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 13:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814616151"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="814616151"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 13:49:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 13:49:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 13:49:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 13:49:03 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 13:49:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXcyG63paAlZ1Oyw6AbP7+JjtlJw0S5mzm65JzJDmq2fXup7ogio10y5aeStZz0SiYv65QkwGZCQJ81nx+C+vc2v4KNPMV/O8eLrddPASlJ3ydnmt7SPxZ13c1fCAnK812dcMJsBINNOE6u+7ynIrDJ1/BxZmy+2AjDNbdG6YV0p2bUhb3w3AdixJ1UukE8huQgc8N3wpu7elFe7zKb55yylUo03fPwvBCd90qzhsL110zVQPTcC0Ofr8EMAGUb+4qpJcrZqrmafNMgOsjjtMdO7pP21kn5wJ+Bu4/PIPIWH3sWN18p+qTyvY7q7go/fAaXn/Uox25zMu5fpya3Gqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGolKIisAVSBAW3nXBdeiDrx3+YoyEKaOCyjsAQHcYc=;
 b=haDR/g/9lJBM6OIBp0IjUtzWM3Of1LayGYR6P68L0eRn95qwN6IKSlawAOOZiT9mJEgLnWqn6YsGzG95P5YsL/bcRB5lGAcaQrxDRbnsiT/30jZIgO9L0/wVFCMTRcrL7v3gHZ3K7aiJCBdfjgVh6tsSckXlpQY/ljnEAILTciw1teLJ7pqbYYaNU2/R2I5ufEGsaq+1Ql8Y1uQtlwuMnH96TV/iKbBO00cKHftyYsktXEJaYXbqlkQ4vnHMP1F4Jnzz+Zs5UZCk6Hx1yMIpQ4ORni9CnAlyYMcCWgChXvAM6GNVh0Pf54gPiSJFPgoDoLF0s2M7hxXEvmKIhx9i0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Tue, 26 Sep
 2023 20:49:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 20:49:01 +0000
Date: Tue, 26 Sep 2023 15:48:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <qcu3mi36jezi3b4q6ytpti5voubzu6hvp2ejimcb56fszimmfz@2q7rm5ngxj54>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-10-lucas.demarchi@intel.com>
 <20230925234201.GF2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230925234201.GF2706891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a68f610-2080-4bed-e5a8-08dbbed20313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h46Eqydm4Eow3u8nG7sifbIhJdg4QQDqFtZItcoy7S8xulASoCzI25nJYLi/Qe8WunwAUGEOjaIErRyGBxoG9kYC1w8nWVeiTdrZ8VXFgNncoOvIqWEbV9Z4GUFEd65NqweKflXT1blS0UAEtGoGyLE56IrTh1c9+sg96e55gVjXgGiijbwHTstbhuLEbIuvHO/S0WG5iV2oXVexBqYK2qHCR0OCmRv0UWUJ4qY2Vkz04oB6VZfbq+NACPZ5CbYPtFgNge0hEL8y7yrLQBpRF4zPvAdwDAKG4+zZrD16x9q9Yam5DRAM70gad3FpTzowwoL0irG8qkUhY3yw6VPRnjHeozqplcuahtFpn3Uo0AwD4mijUhA9a3jRtW5e8CmT338igL6iT13DOwckSgaCbp7qtEFhfeCxYI70doa0jQQTq7vFbWxPi7ppACrVK9m/MZWgi2mNL9wafJWwQ5qTYJSpTIPlz3BWZEU3pwPu9KADvfS8NxEcc0uycL/UdczjfezgQjrz1l63LUOlEoq9nAI0EFPwn9nZ8ikOUzvKwP7Mv+/aHzWi78qtMTJ6+PUz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(1800799009)(186009)(451199024)(478600001)(66946007)(6666004)(9686003)(6506007)(6486002)(6512007)(83380400001)(8936002)(8676002)(66556008)(66476007)(6636002)(316002)(5660300002)(107886003)(6862004)(38100700002)(82960400001)(86362001)(4326008)(26005)(41300700001)(33716001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MGVv5bhdEq74rJzN344FAM9b4fG0B5TdMZYzYQ0jP6SZIO8JKbqx11ovcu+q?=
 =?us-ascii?Q?NoQoQFoEa5qff4+O4E2DL7ByyJ9pQEqaGQIWWdgorpN3FZWSOzZIRMnEh4tI?=
 =?us-ascii?Q?uTYlIxzSNKdCoiybS7k3SiIoqZVmhf0+tdepAKBLavBCitJar6Z24H7FQOny?=
 =?us-ascii?Q?HvjdcgxOZLyUVBxb5jeWUN7zUpAv8u6ihFFRMM5aXKiH7+noFe/T6fggJAZr?=
 =?us-ascii?Q?TOEElSf04xE7DhV026GMUO7sYzJ4DCSokp21LgvnRFvDNuKrTH+7nLIRjkV+?=
 =?us-ascii?Q?s0320NFD4mET9G8Aae/9Ks1o2u1Xa3f6osG2TicHWuPJ10dms9p1OXXpEoBY?=
 =?us-ascii?Q?A+eIUfq5KFXJKN+hlb36O5bv/hisjttSIcn/8+u9+3cJBgywxjImdKlE7WPJ?=
 =?us-ascii?Q?88iwzLgmWpRVsJlChGBeZSXrAKeYbnTkloX807nOoZyEd3JxtOslOsYa4Idl?=
 =?us-ascii?Q?n6NB9YQfabQnBiBa4Lcu4R55Jg/EnlIQLjrmFHMGFVruStqORiUvnxaVD5F5?=
 =?us-ascii?Q?fxQUYkUg5YyKmwqs/3cxpAiCWTQJysFHJHnIq+dFaGPwoEC5vBwt5fqYttYU?=
 =?us-ascii?Q?+3IriYu/1rJ386rk4iisEQCF84XrnXTUnWLB7GsIMggHHR9OOq/V2SSnlJr/?=
 =?us-ascii?Q?e4TP1NIFj3Kc7Paa/+ZB9OuBzBqc88k7ykCG8bHh3ppMRB3+HYfz4c2SemSD?=
 =?us-ascii?Q?CxIdhNsy0OXpBeY3LTQfmKDc3GPlapBh9a5QW80+TeZrmOrQOY8+fWQuJZOb?=
 =?us-ascii?Q?1FfPkgKjzjlubZBu4B+X/SkroN+WGWoficlwfz1huOL2bFm5+mu22NIB5Hwj?=
 =?us-ascii?Q?zHeabVOr2nlKPTwIb1tglQrDjxtS1XdfApVlYIj7I5nV1XqUfvzgb3R/gxAg?=
 =?us-ascii?Q?JKfFvF6rTsZH9hDaDh6CyMB1EhMwEROOViQsJlXhB6tC/07PWFUj2pbQlPKk?=
 =?us-ascii?Q?XF1i6hzkEyTVCcaPViDa7WA1jPlhcYDfAHV1UhsjSxWMdYmOK6OfBcy6AYwx?=
 =?us-ascii?Q?s8yMkaghLOX5UPGjUb1AnHAN1zgiiTLXped4OlEmrZMowSfsdAAhXTJmusR/?=
 =?us-ascii?Q?rhouEwTx8sukETZTx1uqDy9fX3sR8ACGOl3fDwx+JIrbtEimx8u4REGFIfFz?=
 =?us-ascii?Q?3TsJ7x4jpmtFnigieISbGXiiCU/v/BurgokT3+Yd4XqOApNe0QxSEOPXEppx?=
 =?us-ascii?Q?bojdILKwpRpO9+N8tt+iBdvkfXYqQUzrM5GdLBVfacf6MEv+rWfBP5WleIxZ?=
 =?us-ascii?Q?26dQ3eKKHxLdjvnsKB9BboRfBWlGNxsP9FSw3nNS6tNwcnfosDTIvwJO7nZZ?=
 =?us-ascii?Q?iHKtuAVHZT6WaoTIOL74OsqOim+idSwgPaHi4+X/UvyGzgZ2s7q9Z+Hq3qkr?=
 =?us-ascii?Q?F38yVhK6wLorbhYtNNnYopBQ7AV/o/2FceN8MDQ+VtLTSWG+ipV4o77qaeV9?=
 =?us-ascii?Q?hJgRu5gycjfPYHTtVJ7ejJk+bC19iH9MHyuUGRFA8JkDT/4GFNtN3wAfdCZd?=
 =?us-ascii?Q?E+7CHTcAXh+dSzXaUHwqsOwgeaHQavmmX/9UM5X5svPKZIsbfM7QzvvsxQGx?=
 =?us-ascii?Q?K/H3jPM8bVpzy07iKHt9wMOB2cavBqXmxubWNL/+MT4BXo6AuIOo4AOkgJrF?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a68f610-2080-4bed-e5a8-08dbbed20313
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 20:49:01.0079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LE1hrxCx39perfqRvExR7WyBaQFYsaohgzY2KNmW4c+FD58GSAmvf8Egruu2uKwzyPUe2L2BiL3H2wkxDcrv19o9gM9s9L7Jeq6QUwWT7IQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4860
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 9/9] fixup! drm/xe/display: Implement display
 support
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 04:42:04PM -0700, Matt Roper wrote:
>On Mon, Sep 25, 2023 at 03:10:49PM -0700, Lucas De Marchi wrote:
>> Fix build break due to previous commit. Squash on "Implement display
>> support" to be moved above the previous commit.
>
>I know Matt Auld's series is going to come through and replace all the
>hardcoded cache settings with the proper PAT index for whatever object
>we're operating on, but for the time being should we at least switch the
>hardcoding in this patch to be CACHE_WT rather than CACHE_WB?  Since
>display is never coherent (regardless of the platform's CPU<->GT
>coherency behavior), WB would pretty much always be the wrong thing for
>surfaces that we're mapping into a DPT.

makes sense, but this means we are changing the behavior for all the
platforms with display. MTL was using a hack to use index 3 and all
the others were (implicitly) using index 0, which means WB for all the
platforms with display.

Lucas De Marchi

>
>
>Matt
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 32 ++++++++++++++++++--------
>>  1 file changed, 23 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index 3422942a9951..b7a04fba3585 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -17,7 +17,10 @@ static void
>>  write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
>>  		  u32 width, u32 height, u32 src_stride, u32 dst_stride)
>>  {
>> +	struct xe_device *xe = xe_bo_device(bo);
>> +	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>>  	u32 column, row;
>> +
>>  	/* TODO: Maybe rewrite so we can traverse the bo addresses sequentially,
>>  	 * by writing dpt/ggtt in a different order?
>>  	 */
>> @@ -26,8 +29,10 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
>>  		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
>>
>>  		for (row = 0; row < height; row++) {
>> -			iosys_map_wr(map, *dpt_ofs, u64,
>> -				     xe_ggtt_pte_encode(bo, src_idx * XE_PAGE_SIZE));
>> +			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
>> +							      XE_CACHE_WB);
>> +
>> +			iosys_map_wr(map, *dpt_ofs, u64, pte);
>>  			*dpt_ofs += 8;
>>  			src_idx -= src_stride;
>>  		}
>> @@ -46,6 +51,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>>  {
>>  	struct xe_device *xe = to_xe_device(fb->base.dev);
>>  	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
>> +	struct xe_ggtt *ggtt = tile0->mem.ggtt;
>>  	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
>>  	u32 dpt_size, size = bo->ttm.base.size;
>>
>> @@ -76,9 +82,12 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>>  	if (view->type == I915_GTT_VIEW_NORMAL) {
>>  		u32 x;
>>
>> -		for (x = 0; x < size / XE_PAGE_SIZE; x++)
>> -			iosys_map_wr(&dpt->vmap, x * 8, u64,
>> -				     xe_ggtt_pte_encode(bo, x * XE_PAGE_SIZE));
>> +		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
>> +			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
>> +							      XE_CACHE_WB);
>> +
>> +			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
>> +		}
>>  	} else {
>>  		const struct intel_rotation_info *rot_info = &view->rotated;
>>  		u32 i, dpt_ofs = 0;
>> @@ -107,8 +116,10 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
>>  		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
>>
>>  		for (row = 0; row < height; row++) {
>> -			xe_ggtt_set_pte(ggtt, *ggtt_ofs,
>> -					xe_ggtt_pte_encode(bo, src_idx * XE_PAGE_SIZE));
>> +			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
>> +							      XE_CACHE_WB);
>> +
>> +			xe_ggtt_set_pte(ggtt, *ggtt_ofs, pte);
>>  			*ggtt_ofs += XE_PAGE_SIZE;
>>  			src_idx -= src_stride;
>>  		}
>> @@ -150,8 +161,11 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>>  		if (ret)
>>  			goto out_unlock;
>>
>> -		for (x = 0; x < size; x += XE_PAGE_SIZE)
>> -			xe_ggtt_set_pte(ggtt, vma->node.start + x, xe_ggtt_pte_encode(bo, x));
>> +		for (x = 0; x < size; x += XE_PAGE_SIZE) {
>> +			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x, XE_CACHE_WB);
>> +
>> +			xe_ggtt_set_pte(ggtt, vma->node.start + x, pte);
>> +		}
>>  	} else {
>>  		u32 i, ggtt_ofs;
>>  		const struct intel_rotation_info *rot_info = &view->rotated;
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
