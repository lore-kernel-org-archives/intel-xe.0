Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA24C7EE22
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 00:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B43B10E5FB;
	Fri, 12 May 2023 00:08:06 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066C510E600
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 00:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683850084; x=1715386084;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CB9srfSZ8iIHqp+9mkb8BxxnDxhTmQJorZ9I9qLtBRg=;
 b=EtufVIpXh5GSJie/ZyZIlRGx0QaiGtPUKibZ2Ys9DLmVuGAKn4sqRgEK
 u3sHAME1vkZtgLehgWn41omNZIjM4bEWGmLsfdWlb3YfrwlJXw2JQh56p
 RzIF4wu5kY4K9iTaj7TDMN9Y9H6qaoFebkK6bH18GnDKxkjUItojKDtVk
 PlTibNrMLwoMRURqrX6rKFfNjzr3EzV72oiMCTQuREGHtqm5aRda9aeXG
 XlDcf8k6kTjunnnl8urUFI9jcfHg/Z8wi0hXqwT3wtS4ysqneAHCNLPnW
 yyWLsl96YyAutmRmWF25Y6YSh7uJdInk+gNKzaNR6YNgCXG3XdurkYFk7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416287260"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="416287260"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 17:08:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="730596359"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="730596359"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2023 17:08:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 17:08:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 17:08:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 17:07:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlgrUQukwPAT4BVD63F9WpzzNLYP/IfWLBWC6xr2J9TYI4QOI8tVi54XYm9YwVCU8mxYOJ/VCq+rF7lPisbOour82F97eUCibTDsoGzPO12AxNiopqYm00OpPN2lvGWYtM11leR4pCmHiir8tmGr5YYK9cFFrT+WmHcn7SqROq6+pbyoHC5OGzRWXUs0Ft9tBsjWpvCCSTVT6gR38Zd69ME+/xc+1jQkORoV8/1j33ShO0jYAlAs1TVc63DzZAp7OHVSSr/Nc7LBYK7zbuE+ApNQ44/CJQLCLq3RYuKKk2PDceqQbJ9nJOIEmvU6B0AYI4a2/zOMqk7vLKvnqQGymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxAs2BBLJ88oNo+TEWlTBh+7myFPO1ddtbDBUJUWFjE=;
 b=gPpRHNQq2GO0wLOzLYEeJ/x/i7VSCKGdbVhdHIxo8Jp765GlH1FEfL3q8lqBea/wmpbhlZEivVMkvTuOXMeKorZ0WbwAms4qt/QLYuPhIravB1x5T7p1JfdAcvoQkT6/JBuyZhblG3GmHhRVXoEkrJGkoE8Pl4FH6k9x/758jWHfvdtlG7JnS1Lk4byw5e8KIM7btjGlpYFhPj2IunYvolEBtQeHmqFlDBP1QOAtGJYT+bBmJ87+9WuwXWb/2R4ULLEmFDxPcDEP9GFzpVYYgSUS10yb58mxeaJVSi6FWXj4Zz9LL9BdDC2J0rmUbBJC9gryBcaTuXzgBtBQ6h1ayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5554.namprd11.prod.outlook.com (2603:10b6:208:31d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Fri, 12 May
 2023 00:07:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 00:07:49 +0000
Date: Thu, 11 May 2023 17:07:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <qf2idx37zw7ss2s4lp6zpfomk4v3q6jid3iqfnnxi4avyh6med@qa3htrgeal4n>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR11CA0091.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5554:EE_
X-MS-Office365-Filtering-Correlation-Id: 411dfcb4-db6f-4b9b-6875-08db527cec1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pPWhxpTjqfZRMKxGBssgR+lWZ0N8RaZfihxE7U11eVTovni6VIIh4sYs4B32IiRrOV6JTWz+h/w3h6p+dCMjjlcIyDo/sba9kHXgp7889J7TrshLx9cvC+h8//jJdnq7FB7QPyVBrXdGVvEI9zWUXqJbMNsBoJ/s7HV0ted/PpoLDZTiltOSe5rpF9rxpCj7AGtdggc8Uxrz1ii9fpNPrZ0d7aVLaWiQUzUAOAvu4crlb1VcZsvHrYNQtHKJiJsj4lknIagLITqpzUhPQbFkmJ7nKNCXZOIAdrhOIVAnelA2lyQfUKa6W9VlEFnqJhwKn4Kq4dWSr+IDrQjxkOLAykxwSQJNyRxKYDtwfG48AqXwK7w6TWI8yMXR6AbjGFqyZtaljR73uTHAV4T/Nv1xiEHO2cN8X1AwPSkTiL1CPnQX3zpgcIp+AXjma1fTUiQMafpCwMkfxIqCTfKwkCzIbHimfC7VEY83aMcVVJY738lDdK1b3wSHkLSIZH03hYuvpce1XrcCmpH1/Cr89NLcTfFVQs6+PbWYpOEb5fFbHw5RNTPWPil3pI+I7w33Zac1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199021)(316002)(478600001)(86362001)(6486002)(6666004)(6636002)(4326008)(66946007)(66556008)(66476007)(83380400001)(8676002)(33716001)(41300700001)(8936002)(38100700002)(6862004)(82960400001)(26005)(2906002)(186003)(6512007)(5660300002)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cBbF6s/4O/kXjzGPC7zWFaMdFrSEXxA813d7J4BF4gtSkgzJuYpmTvNv9SA3?=
 =?us-ascii?Q?D9Mqa7Bsdej9WaN5fojAIlYtDKmZUiMBhyhYZRKb6qZr07tMavzHR6ynU+7O?=
 =?us-ascii?Q?i7HTze3N8iuOw9c5hdFS8B2ii47ZQnfJShmdJAGFYR0EN6CjvI12Ez57Izw7?=
 =?us-ascii?Q?cEcnQvj1wODEw3GgRC//U+qnhz8zFOOm7xWhhGY22r2RbGp3PcbimrKAn8gO?=
 =?us-ascii?Q?tBKG7Ibbf2H1N+fbaxIWZO0cSjcwve9OgVVE0vVDP7H+lEIEpCL0RvQdsvOB?=
 =?us-ascii?Q?vjHXQtOEp8ftZ78wK3PivcMClNjVgbJPk0Xk5HLmrkLHMtXDcZi/6FWWrWQh?=
 =?us-ascii?Q?ecKp6nMukFC5DU8s1q1rzwySKvGe0VlPLF/GktWgSpIpy01m/o56YZ+CkF1N?=
 =?us-ascii?Q?GyN565rFdPzDpMtnGJZ/riEyfOQrbVyUfhYLu4p9H8tXCATGvxFA61jv8N8w?=
 =?us-ascii?Q?NfmvbBJdIhW5kSJ7FkGsfWi3HO0Fn5ocZ2c1Oq3HXMl7tzqoEE8qGqcSpbvc?=
 =?us-ascii?Q?7i8c29hPm8JzpvrfJ2FXcQq39jUOW95E33JVOZNjsEQlJhfpWdMz394beuKJ?=
 =?us-ascii?Q?04Fu+z5Nhg77089lOwp/c/o39/cLJi/jStFoPd+/6WD/OEjtOnhmXvyzB9ie?=
 =?us-ascii?Q?38v1llyN+wzfBXy9Ah47fdW8PuDHaKbMLG3oPiZQeiGFc6fD5swN3hQkg7Nd?=
 =?us-ascii?Q?3B5dF9qwlZKnhHnubP5FzpNHQPGiuIDkRWA9sMU9LCVYqz3gS+YlLH/4wq/5?=
 =?us-ascii?Q?IHYev5CzmmmlIvXGknm567CREdzgcJUMnUVk0f0uzXUQQTql62H+cR9YQQmf?=
 =?us-ascii?Q?orHfmL9nN4iJQauBMV5yP0Rip7mWRIGH+F+HTnvB7HmnimpfsbYUs/TY/lOh?=
 =?us-ascii?Q?VEs58JG0gFeGxCrd8If1+61YmZaecxD9VSLSwMxj/Ko4IyeI/Vmr3L+Py3CI?=
 =?us-ascii?Q?2A6iGNgNr1tR7L7V8A7RgHW4b3ggbh5xaRmNbpdSDhDSL1ZJINufdUEaCo8c?=
 =?us-ascii?Q?zpARUBpR+8b7B7i94l0l/e3QfN3c3JdcM5BYRWmeO6Y8tMf66bF3alkBR+eU?=
 =?us-ascii?Q?IldeMalGFdfx9yhvL4LtjROZugCQeBNNtVfHsGGND4x2hw2ZDZKlbdK7uaNa?=
 =?us-ascii?Q?WNr9hRiy7omhykJxKhs7OXTbecyZ9kwljAG1tAbQnXJtc96MJWwSVR4Q6Dno?=
 =?us-ascii?Q?/Y0vOfBug51dW6X16ovOWESZ78G2YXqcDy0VOprKXycnsKrfg+XO6Z7H5Nr7?=
 =?us-ascii?Q?9Os2NELlDo0BRFqNPEYt9m5cZJbY/mT/saRpvnUiWh8fwoVqrGqL0fbzscuw?=
 =?us-ascii?Q?9ITZFWo7UU7n0NjCTwFh/7EjyOgB2KeFXmRfFi6L/VPijKUTgIrpYDK0rc2r?=
 =?us-ascii?Q?6WMlCmzQ+QnEl4zebr1DrBzIKxl0S7xcmr/p1TSe8ioRc+D7RI5TIj0jnq9z?=
 =?us-ascii?Q?t/PKSz1xrb4H1OMVR5pdHR0j5NMabeMvnaVw1eXCaSVGVDk1el8z17dySuGx?=
 =?us-ascii?Q?6iht5c7CTUtdvsX5Wsaq06A2/xTwE6S9/Rvvfu2bPqi7M8U6Hwj+lNzrxh7o?=
 =?us-ascii?Q?AOy4J1ER51WGiCxITPLMLTsYOlajMGQBoS5vGsNUw4+RGqWrPo9uEqfvdcBy?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 411dfcb4-db6f-4b9b-6875-08db527cec1b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 00:07:49.6869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaB3sFSAsZAYXhDpPIhhtmD/IwlCXZo3EpMsw6Z409jH2SXvxxJXwWebtbPtGu2PdBJEclYOIZ3yah+8Xay1MDC/xg6yJNPfjtouNgWOxpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5554
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 03/26] drm/xe: Add backpointer from gt to tile
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

On Wed, May 10, 2023 at 08:46:59PM -0700, Matt Roper wrote:
>Rather than a backpointer to the xe_device, a GT should have a
>backpointer to its tile (which can then be used to lookup the device if
>necessary).
>
>The gt_to_xe() helper macro (which moves from xe_gt.h to xe_gt_types.h)
>can and should still be used to jump directly from an xe_gt to
>xe_device.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_bb.c                  |  2 +-
> drivers/gpu/drm/xe/xe_gt.h                  |  5 -----
> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  4 ++--
> drivers/gpu/drm/xe/xe_gt_types.h            | 14 ++++++++++++--
> drivers/gpu/drm/xe/xe_mocs.c                | 14 +++++++-------
> drivers/gpu/drm/xe/xe_pci.c                 | 11 +++++++----
> drivers/gpu/drm/xe/xe_pt.c                  |  2 +-
> 7 files changed, 30 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
>index 3deb2d55f421..bf7c94b769d7 100644
>--- a/drivers/gpu/drm/xe/xe_bb.c
>+++ b/drivers/gpu/drm/xe/xe_bb.c
>@@ -16,7 +16,7 @@
>
> static int bb_prefetch(struct xe_gt *gt)
> {
>-	struct xe_device *xe = gt->xe;
>+	struct xe_device *xe = gt_to_xe(gt);
>
> 	if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
> 		/*
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index 086369f7ee6d..f4e98f499b36 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -49,11 +49,6 @@ static inline bool xe_gt_is_media_type(struct xe_gt *gt)
> 	return gt->info.type == XE_GT_TYPE_MEDIA;
> }
>
>-#define gt_to_xe(gt__)								\
>-	_Generic(gt__,								\
>-		 const struct xe_gt *: (const struct xe_device *)((gt__)->xe),	\
>-		 struct xe_gt *: (gt__)->xe)
>-
> static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>index c815a42e2cdb..c9e8825c02aa 100644
>--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>@@ -322,8 +322,8 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> 		TLB_INVALIDATION_SEQNO_MAX;
> 	if (!expected_seqno)
> 		expected_seqno = 1;
>-	if (drm_WARN_ON(&gt->xe->drm, expected_seqno != msg[0])) {
>-		drm_err(&gt->xe->drm, "TLB expected_seqno(%d) != msg(%u)\n",
>+	if (drm_WARN_ON(&gt_to_xe(gt)->drm, expected_seqno != msg[0])) {
>+		drm_err(&gt_to_xe(gt)->drm, "TLB expected_seqno(%d) != msg(%u)\n",
> 			expected_seqno, msg[0]);
> 	}
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index e0ed4508269b..c4376d50786b 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -76,6 +76,16 @@ enum xe_steering_type {
> 	NUM_STEERING_TYPES
> };
>
>+#define gt_to_tile(gt__)							\
>+	_Generic(gt__,								\
>+		 const struct xe_gt *: (const struct xe_tile *)((gt__)->tile),	\
>+		 struct xe_gt *: (gt__)->tile)
>+
>+#define gt_to_xe(gt__)										\
>+	_Generic(gt__,										\
>+		 const struct xe_gt *: (const struct xe_device *)(gt_to_tile(gt__)->xe),	\
>+		 struct xe_gt *: gt_to_tile(gt__)->xe)
>+
> /**
>  * struct xe_gt - A "Graphics Technology" unit of the GPU
>  *
>@@ -90,8 +100,8 @@ enum xe_steering_type {
>  * within a tile.
>  */
> struct xe_gt {
>-	/** @xe: backpointer to XE device */
>-	struct xe_device *xe;
>+	/** @tile: Backpointer to GT's tile */
>+	struct xe_tile *tile;
>
> 	/** @info: GT info */
> 	struct {
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index 817afd301d52..d57fbf16a3ef 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -471,7 +471,7 @@ static void __init_mocs_table(struct xe_gt *gt,
> 	unsigned int i;
> 	u32 mocs;
>
>-	mocs_dbg(&gt->xe->drm, "entries:%d\n", info->n_entries);
>+	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> 	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
> 		      "Unused entries index should have been defined\n");
> 	for (i = 0;
>@@ -479,7 +479,7 @@ static void __init_mocs_table(struct xe_gt *gt,
> 	     i++) {
> 		struct xe_reg reg = XE_REG(addr + i * 4);
>
>-		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
>+		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
> 		xe_mmio_write32(gt, reg, mocs);
> 	}
> }
>@@ -508,13 +508,13 @@ static void init_l3cc_table(struct xe_gt *gt,
> 	unsigned int i;
> 	u32 l3cc;
>
>-	mocs_dbg(&gt->xe->drm, "entries:%d\n", info->n_entries);
>+	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> 	for (i = 0;
> 	     i < (info->n_entries + 1) / 2 ?
> 	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
> 				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
> 	     i++) {
>-		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
>+		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
> 			 l3cc);
> 		xe_mmio_write32(gt, LNCFCMOCS(i), l3cc);
> 	}
>@@ -524,7 +524,7 @@ void xe_mocs_init_early(struct xe_gt *gt)
> {
> 	struct xe_mocs_info table;
>
>-	get_mocs_settings(gt->xe, &table);
>+	get_mocs_settings(gt_to_xe(gt), &table);
> 	gt->mocs.uc_index = table.uc_index;
> 	gt->mocs.wb_index = table.wb_index;
> }
>@@ -537,8 +537,8 @@ void xe_mocs_init(struct xe_gt *gt)
> 	/*
> 	 * LLC and eDRAM control values are not applicable to dgfx
> 	 */
>-	flags = get_mocs_settings(gt->xe, &table);
>-	mocs_dbg(&gt->xe->drm, "flag:0x%x\n", flags);
>+	flags = get_mocs_settings(gt_to_xe(gt), &table);
>+	mocs_dbg(&gt_to_xe(gt)->drm, "flag:0x%x\n", flags);
>
> 	if (flags & HAS_GLOBAL_MOCS)
> 		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).addr);
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index e79b16d8bf7f..87c328106aca 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -471,6 +471,7 @@ static int xe_info_init(struct xe_device *xe,
> {
> 	const struct xe_graphics_desc *graphics_desc = NULL;
> 	const struct xe_media_desc *media_desc = NULL;
>+	struct xe_tile *tile;
> 	struct xe_gt *gt;
> 	u8 id;
>
>@@ -525,13 +526,15 @@ static int xe_info_init(struct xe_device *xe,
> 	xe->info.step = xe_step_get(xe);
>
> 	for (id = 0; id < xe->info.tile_count; ++id) {
>-		xe->tiles[id].xe = xe;
>-		xe->tiles[id].id = id;
>+		tile = &xe->tiles[id];
>+		tile->xe = xe;
>+		tile->id = id;
>
>-		gt = &xe->tiles[id].primary_gt;
>+		gt = &tile->primary_gt;

these seem to have been squash in the wrong patch, changing the style
from using xe->tiles[i].* to declaring a local var. Maybe squash it in
the previous one to avoid the back and forth here?

otherwise,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

> 		gt->info.id = id;
>-		gt->xe = xe;
>+		gt->tile = tile;
>
>+		gt->info.id = id;

the gt than has the id of the tile? Because right now there can only be
primary_gt? Looks odd, but it's a consequence of removing the only
platform with 1 tile and multiple gts.

Lucas De Marchi

> 		if (id == 0) {
> 			gt->info.type = XE_GT_TYPE_MAIN;
> 			gt->info.vram_id = id;
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index f15282996c3b..61126cefe0b5 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -695,7 +695,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> 		 * TODO: Suballocate the pt bo to avoid wasting a lot of
> 		 * memory.
> 		 */
>-		if (GRAPHICS_VERx100(xe_walk->gt->xe) >= 1250 && level == 1 &&
>+		if (GRAPHICS_VERx100(gt_to_xe(xe_walk->gt)) >= 1250 && level == 1 &&
> 		    covers && xe_pt_scan_64K(addr, next, xe_walk)) {
> 			walk->shifts = xe_compact_pt_shifts;
> 			flags |= XE_PDE_64K;
>-- 
>2.40.0
>
