Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB72DC54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 15:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7081C10E3A6;
	Tue,  5 Mar 2024 15:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlVRUBJf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F0110E3A6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 15:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709651449; x=1741187449;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U9ifkUS0q4ItFbbjOCAtO6uDmNqbnK4ht6R6pcuvlyE=;
 b=RlVRUBJfZDxcckzUFqPWzTSh3GoA1OE5YmeA1uYjy7QchOuyEKUBqjWq
 U/SgI2sqruy7NjseaqYRuhXqxgzt/SS2ZNx8Zon9tWK2Z4+jh9G6oOVfM
 6Qtj6rF1wX3HMn9fFlZp4evAjkjkEe8WbOW8YBtRjzyTO9sOAMjQZyfcL
 nPE4gC5YdD1dLt1tiYh94QD/foFOVErvfo6IgjpFHY/r1FL0iDXBfT5XA
 UW+IRuRlrj5o2yC1FOR6vyj9INtC17voxmvIefuNi5Di8jFyGmKArU04N
 1cp37xxGZ/pAr6/f8ZTLZ4ChqSWqlGNBGeKOoD0fSPF5HgDcPimWLbW40 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4066144"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4066144"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 07:10:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="13895689"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 07:10:40 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 07:10:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 07:10:39 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 07:10:39 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 07:10:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYvOGBISVEUSNHOfRQCl2gYZUPStB8yH7DZ++rekdjJlPcRdydwLuK99WJIxF9LwkZj4MAR0nJP0Satiz+siHsErQeur5b4zJ+5qGWcQ5F8lJO+BvECBVVAPLxAivwA05WRfaap0NkMllkWoCfCAiOJan1VXU6K+LMoHh0PqzC0MkZhY4Uuu2sMYfIlj7bZZJUeqEC9GMEF0PXsjpuIuGSljdUOUFSF9SoNC4z9t2PHMa3xxMrBjABROjCIIjbb7O04J6tSmOX2gESFBRUAFYnj5fv2CFnvDPk7J40tL0s/In2IkNUhYVG8p3sB/RsorMpmf4qFFhY8k7/G/4Yhwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=st1Cn28f5fSbNFFbWV1NZKikUrPlxsuQFzj/jMjD3wM=;
 b=d9T8lo/iPWjt8GC5rRa/Ia45pL0TZN+aDAj+2WFaEZVwwjbZWq40KXFHGrQ7hdrAw+rhkJkLFeuvoiJwhsCqKbNJOBF52U3jE+6Hdan5pAmMZEqDCH2/BngIZ9CtLfkPNcjYIIhbXUPyOF+s6BKwaY6XGLIBju9Km3mSVhSV5jTbxS3bnn+R8BZ9SWhU/p0YExdhCleCR0taC71nfDdoTvTnO1XqEu4a9yVMIwFQboSLJUJxA5St8gZ27jguP7Ykx9SqSZN8UAh6Vq52m2YGCLwqlLhWY9Urqj0xD6TRadiN3eE5+PzXdEIj4xYiMYNVGk4NP3iOvpbNpDRNgqiAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4912.namprd11.prod.outlook.com (2603:10b6:a03:2ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Tue, 5 Mar
 2024 15:10:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 15:10:38 +0000
Date: Tue, 5 Mar 2024 09:10:35 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 1/4] fix "drm/xe: Cleanup some layering in GGTT"
Message-ID: <5ra44ud7qmbqq6co7m2rmgxpt2kh3tqico4bre2as64376xhxo@mqxd7ruo4uqm>
References: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
 <20240305131250.5330-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240305131250.5330-2-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0004.namprd08.prod.outlook.com
 (2603:10b6:a03:100::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4912:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8ff2c0-3cd9-43f1-092f-08dc3d266a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X9f7oheD20QRMe6eg/4AXxOSci98ATbmmc2cLR+TmOHKlhOrCTzKWiziYaBljtwG7eF1XkWXKdwVdiDheqUvqbHrXs5xum0JqOrHOZq5XZkDQ12K/8ykM5GGhZZhQQqPbxtNg9bb/mL1iBI1PGotZflpM0Dba9kWwQ6jK9idR/rQ5SZQYTeTqMW6RDh3V7sLDP8AImBeXHltm1rn1Yrxx72cCaqn9u3g7yayeDoPI5Rf/M6arHgKyg4F0MNZ4r0Q2xdczqfLzgVsbVDY2/IPmLlp1w510jTuQZu3ly7K00w51crEAW1P/FknMqIbe0I6rhNfT14ENsUP6+ApceqHv/MaglSIO/aXeNUDbdPZFBi2sTEqojDp4UIQq+wH7EkwwwI7LeLgaMFjRsetx1h8Oe52IGqlZwps2pvqwXxO/NEfmkWwxQwxVJXePInbAEkxGWOlRufEfRzcM5JfcFxC98KHdHMLi4j3Q6380M33BhsW5t5qqQqFYXJu6cQqtYvzzWn0khE4CoQ1u9qvDUxmWWxhi3m8YpPiln5nkhRj9c5DO7gTFCbtK319a/gFB405Sj1YB31vbaJfR/3oZwaBtvHx6Zj8AFodBT/qkYFrby7scttyr4rdzfU/lKNjyk4KspCgQzDSZJvYuycLgg+VSgzsyhcl6UohDdU6Efv+2QE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?myJmrGCvaHtLB7OsSIgPujsoLWQo3Qc2dBYQrkPiQp5y5e0vOdYrKc4DM+ue?=
 =?us-ascii?Q?y2BCvfRyi4SshCBSKIlFik5QvWX29p9kzB7MNIWKXi+GyHmiTBbQrBmNyw7K?=
 =?us-ascii?Q?ZANSyPRHI4QrkFA5LJ9hoMEO/7Kpe1/qPzJBwf3Wq8kgFFix4KraEW7GxZ8z?=
 =?us-ascii?Q?1HUfXNtFcmc4OBcvNP15riavMZaPU6GSssHzq+rxBOBW2vMiSNY7tGYKs6RS?=
 =?us-ascii?Q?GXT3o/6KAp1gk6G307eIJBEnfviQugpgmUHOJbqo/toZIfi3R5zOdoq/XDeF?=
 =?us-ascii?Q?jriwNwvDNhO6aLqGOp2w/pffOl0t9CKThk/9121U4GgSTOH2o9JeW59XgKLt?=
 =?us-ascii?Q?oWCl/IEJ4qi9p3fGsiFjgG7SyVQ+y4cd9Y2y5brfPNWokBRtSyo35vN81D10?=
 =?us-ascii?Q?d/34tSqkGzBxVaSPGDwZa3pFpzO6NaJdj2FspzP2dTgZ/lQL04YFlQAI2DSB?=
 =?us-ascii?Q?9ws8WJ8gjb4nv6OHZzcv3IoOlHppcfxbAdljfbW9KN2rLIJIRa4/MuIO2qu0?=
 =?us-ascii?Q?ypKmu4YhTBbalx4VB4BikPWIC291jmmydoks7qRUOMxFDvB9HwOyrtyh0q7i?=
 =?us-ascii?Q?J5JOns8pyZO9V3sOG6/rnEK/5DAwRCWVPsy+eulx5UU9SiMJp62MKkbVbtSR?=
 =?us-ascii?Q?NfP9uj7+pXEkDJoUge3urkw2qa7RPdA1AjXlmWfNs1yN9kcPK3uDeNYp893n?=
 =?us-ascii?Q?CqPBvBMwn17Fg9rpRBjDuAWQSodTS82sEsBta5iwKJIGSgIZUQgmGlxA9gPS?=
 =?us-ascii?Q?LLu6GorYfvpLETT1iw5jTnoULHAuczga+oKYkvKCYJeBv+cPR2Od40f3Df4r?=
 =?us-ascii?Q?5Ze+MiRqfl4bBONk8gkokIi5TfCwmwRTnOvZPN1GdCEHt+SOH97A8G5cXbor?=
 =?us-ascii?Q?6S+ogas7jpiyzdBbdB7oOC2KqXgeujfSmA2/X7k8PmWVhBhdA7tq80WtLEUw?=
 =?us-ascii?Q?DTMapLSAVOQ4BZUxD62c4y4BU6Yy9ng8ApjlEoIuyOxDk27Dz6eRT7IBifW3?=
 =?us-ascii?Q?CrMWYuIRUI18DSmKHgULe57zpNZYaZvrqKFizQ0eI3I6jxrG7fbvPjo/+jBW?=
 =?us-ascii?Q?OkyUtPvWEXX0LAEhCE3nw2ByyN4QmKCLue+33mId4tcN2g1lsQ3FpcdtTK/c?=
 =?us-ascii?Q?1q07nLf07VbdjgbBPMj/H9W8Oux2dQSY5OzxNOnP0d93nzRKfV+jzfvboxJO?=
 =?us-ascii?Q?kWFbldNS8zWOBy/RPBpfs9TkU/oUPh+jFvWgwy8LMNOJXk1KfQxGTomde1ZQ?=
 =?us-ascii?Q?UgODWls/O2qnvLHJ71PaMBeFuGOF1WsC0rd4h1SHGvDJi36+Vs1ahsteF4Vp?=
 =?us-ascii?Q?W6SfOul73BNxfPBndr1wWjIkOfi+3YWAeQi9KFP3hjuMireuXN1IPwc5ccjA?=
 =?us-ascii?Q?0NJSBk0rLioytliJhorl9NJcvx7euG+jOA/bbzwDkj88YHVUpnu06vVAzPex?=
 =?us-ascii?Q?0xpxJpGtzns5lugOeDCGsBhXgjikeelmrJtnHmA4ytjxwKbA9x+lWoUZOG/J?=
 =?us-ascii?Q?smrmxbzTNP3Qx6/dKVxJz5rFC/bLK8myN13ue+mFOa+GtChGAvl216oHeOB+?=
 =?us-ascii?Q?2szsFaqLL6d+Mu0sor4iZ+iTeDYCHNpqdPpwqznnugtzQKGf29itd6VvxG0K?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8ff2c0-3cd9-43f1-092f-08dc3d266a25
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 15:10:38.0198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnCbvEGspglKrmJGsu4hf+Pb/nb3xJssNEVUz8Pye2Vky0vQIAEUoT3Z2sPG9zIOkiSDUXpK81UD2cDQypHCP7W5hNzpkukeTMG31CbqxTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4912
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This needs a better title before merging, like

	Subject: drm/xe: Fix NULL check in xe_ggtt_init()

Lucas De Marchi

On Tue, Mar 05, 2024 at 02:12:47PM +0100, Maarten Lankhorst wrote:
>The null check for GT is after calling gt_to_xe, fix it.
>
>Fixes: 3121fed0c51b ("drm/xe: Cleanup some layering in GGTT")
>Cc: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 717d0e76277a..0435e1202c46 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -251,7 +251,6 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
>
> static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
> {
>-	struct xe_device *xe = gt_to_xe(gt);
> 	int err;
>
> 	if (!gt)
>@@ -265,7 +264,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
> 	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> 	err = xe_gt_tlb_invalidation_ggtt(gt);
> 	if (err)
>-		drm_warn(&xe->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
>+		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
> 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> }
>
>-- 
>2.43.0
>
