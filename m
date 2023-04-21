Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0980C7618E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 00:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F9710E308;
	Fri, 21 Apr 2023 00:45:59 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5963210E308
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 00:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682037957; x=1713573957;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1U5H8neO5Tre6R9kF8pNmXQ4q4XlREV2QuzM3lvUCNA=;
 b=QE0NYpDtWJtwYbfpqpkKU5r2xxy/V2rztuHuWGNU9xQdz5tjKU5Ybcw0
 jz3YDNZBatGn7uGgVoTbDVHH23uNtQzA94/H6eVguye/BjfyTOxN/s3of
 RcqaG2biaLwT250uJkHBVrrxw0F+S01xdlJGsqsaqR+OxXJhXtK6Lo32x
 RbmmpN0VgW/+vMuZbnL0L7KcNUR7UK9r16YfYDWPU/NqT3MaW9l2das8p
 dqDOoLLMO9oZtgYjCjx4EjgU2CUcfEJrFlD310UtWmiJADg1h1hPyk7wj
 S08F13/23QjVVEkFK4HQGgmlFM5qZNYjyS/kF1fe15jS6IXB3qdOtvPBX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="334757271"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="334757271"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 17:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="685566222"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="685566222"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 20 Apr 2023 17:45:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 17:45:56 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 17:45:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 17:45:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 17:45:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lngaQsZzf4vQKa/0IBuu7SnkGoKqGC9HC3QL2X1/7/rtmmhyIaQ7aqGLB7FVGLhiVTaNfa28PbrxInNuA/FcLTHwqZvK2pSNlxIAc1Dyb9iELPzr/kJ1zUoDAWNSxEbS/e9M8ve/9sCZxqePTu8jsIc4pVTQ0M0puZ/X7BaFFeLRo0JROXnEttp5F8qG9kZ5qwkUrJ0c+FM8bhYZp/0QdtPg1t6HPqC3p7fPphW/BaqyvKrErUKxuZHne0N6x5Dh5xB6Rni1z+Pnfw1t0qB0Ohj1q+wGGti/YMWb5IWfOcidDrN3cVRPHTeNESFjD6bdG+JSTj95oTy6bboDSF4wqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBME+w+F9oSOzS5fbuo9Fldd+KmHAZWnUO+XOcSyCj0=;
 b=P09bkRN0Ww4qkgMc5Eb+Ez53h9/9YJVoSK7Y1+YyWRziIVBJBzUBYyV0jZV3DRFQppGfa5hgO7XoBX/ydjZJlPaEYF2EzXhoZGYlWXkfWx8ZKICp3xzbKituYKuE5my5dlGdunRPWNfBZuspp4Ln4+rChi8zsYig94gzBaSXNFfh8bMNsyJ/xdeHrZsQM6HCi3Pm0WGYUC37irDjuCWY73XXOOOH+S9bVCQIjtxvKFEUhSA6kOR93dYF8hBDsibuO+J9gsleakPwqow4xhFsXnQs8z8gZgjv6El8NA6ZK6cEfQDo+x57SPOyQuk/TkvsdVo7zRkRNZW2nF3F9z7kvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 00:45:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 00:45:53 +0000
Date: Thu, 20 Apr 2023 17:45:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <5dea56i3dsmuqk73oizuk7qr7eoenobb3nqwc3xkfy2k7izrhw@rjyzpbnexy7w>
X-Patchwork-Hint: comment
References: <20230420224814.4136897-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230420224814.4136897-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3a21f3-d8df-4ea9-c1ac-08db4201c28e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S9k1lNIjaehRD4otWu+iUPjqAjMfDG44g514AyJ/odKqmWhU1v4nH4amEIpQX1nVUhIxswQiSpMiEma7BYHiUw/cGak+WUBejCKD3giuJUkVzSEgiFdUVGWPQkiTktvyb/nvP5bv3rbr+AReCYgpxvWxZIqA3ZrRCDdY4xroxTRxNX3r3kljbmk8sw21Kw8eBgTvzFJqoE8gqGezBwSjTDUvmOmIwUoEYbMT8semeCmMlC8syByt2WbiILVwtuDsCIvQ3+yakOs+KZm64LgimYi34OH2fZbYlDooFrv97RqkxGrl8QLuPxTa0b7udWfKebCtQHmlGhPXyc8qpGavAkF2Yxw53NyNMTrgW6PSJ7tyB2I9ZFCKT8mcVX1vMr+Vxt+0rzMxdW3/q1MmTCUrb6lgvdmTZn5Jhlh7NBhJCQwWfWhC9dpMQgxikfr8EppNllL4T0lJN7TeUbYreJ5X8akU/+W+Cj5PHu9I7vfZX42EbWwxgcUgq4UmEUkTrmkv0E9f83Dk7ud9s3JpCJcAUBXE/xSqK4xAbXs++L6AMjM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(6862004)(8936002)(8676002)(5660300002)(41300700001)(26005)(186003)(9686003)(6512007)(6506007)(38100700002)(83380400001)(82960400001)(2906002)(4326008)(6636002)(316002)(66946007)(66556008)(66476007)(33716001)(966005)(86362001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AzV+LC1mF1V1utQaAQ0PwhbPRRj+/h0kVO14btW8OgGvjIf0RApa9HyRA9kZ?=
 =?us-ascii?Q?TT4FeyX7oIxHIcbK+W82fBcSv3TO8v5n0EUbJw+pLrtgBPYO31xVBBO/X0Uh?=
 =?us-ascii?Q?PwqosmWcRQ/1iRnlUs50N7CNIHQqWqZ9I4Wnx+FsKgUUgnVxyM7z31kpv8Lf?=
 =?us-ascii?Q?VE6jeC5OqS6PT/IDDtkjU2L/ADsld1R6SRXuoq8tktTJqb+juEweaKERErYT?=
 =?us-ascii?Q?X14ZeNm3gHY4q11zi70YQCYGGDiVnQ9pKEVeVJpxFbdQodDvI6g5kloOTQik?=
 =?us-ascii?Q?LH70Kt2+GhMnD3hJ6QsgNtg/xH6eVb2As/V4D5GlvvmHfTf85QGTDg8iKodT?=
 =?us-ascii?Q?ELXDZY/xfPwwfL0EZnS7rJW8LfUCCGhOqt3DWxdQfl71UmGUSF7KC1EoCZuv?=
 =?us-ascii?Q?kb8zGOnXpbJRkBz/1PxL7+DZbmltrSOtKBlnDwePE0s52Ht+d25rG/QgIOS+?=
 =?us-ascii?Q?Uh2w9Hgb2d/slnNy34+kKZq1D22iSmjqAlqLYzXCqtzC/9YT5j3Tw+75FAAU?=
 =?us-ascii?Q?RVsbWljEWdebXeM6GmvXZwyUFxirrl4s1yiuBaUTdo3zAB49OsuOpw7tVTBU?=
 =?us-ascii?Q?6c6njEKcL/YgOg1pm7xLUTmVeCz+efogVY9ApujuKAMr8he08tKj6jqw+jaM?=
 =?us-ascii?Q?glEEQAcXHQcXv/zwy4NvN634uGu9MgtiLFEKrfj3kgGmsZ85xLV5Zzq7z/Lu?=
 =?us-ascii?Q?6fF1Q2JEdy0OLSPdzx53qHPQtp5ynXOwFc44xAdOv2rvP0oFcrRiYr1MSaHD?=
 =?us-ascii?Q?byDbZcsS9eAEuVyolFyTuRFI6NJfCx76XKLjEwb9TgQ4PNHF6dTyZhbYkLEI?=
 =?us-ascii?Q?AU3EH9JjBokRrYMHJBtYPSWxtAg9fDQBoNpoQmb8xImgC9Voc9CDIXcYL1vu?=
 =?us-ascii?Q?I6veyA4QW5NlAeAc5Kc3SBb8DvBend8wejzv973gasvVq4ULub1jGR8RYsgn?=
 =?us-ascii?Q?PV7YCQVKGmEskiRuuMUixEhEa7r03QLHdwRCxkVWjMSJfgWFN/xW+P4Miwit?=
 =?us-ascii?Q?rvIN7Ja+2EDNZptEHhjFt7vy8Mdm9RH8WC0SBjYdcs/gWt28MB1UPevDEIEA?=
 =?us-ascii?Q?ZK6DOg2tReYNC1DXHYf154WG+++dJ719eov4/pnSSao8qYjP7zeC5hVE3few?=
 =?us-ascii?Q?B5t0nZ6iAkDFsZQIMowdqsJBPQCSWtnnwwo/5f1VfOPdz9dfuwTXPBoKRJuo?=
 =?us-ascii?Q?NOubivpX7F8CBOFa4nJNjii8JNfpQl1NRnfPVUmdYsm/tlbwOFtMd3ZjUsr2?=
 =?us-ascii?Q?OvWA6Cra4/0UToqvpOFxgN6kJdCZu62XjltC6AhVIzbL5UYSIdE6pLkzW9fI?=
 =?us-ascii?Q?X5d2mb88WxN8Xy9DTLgAdLnpBZvyto8UqAVovI4naRlVEFVadj8y/T4YQn2D?=
 =?us-ascii?Q?gqyzzl2jZNfmJYoAaK7MnyM7ZQO/Vlt+xrI6fLWEC6dvhKC2Sgl43dMkeDNi?=
 =?us-ascii?Q?eoXgIKBsceiCqZHgW2IQKyQo402JTRIAOyxBuR+eJmkXqQhSxL8Sq2hlxgv8?=
 =?us-ascii?Q?stSyDo2PLymazMXCE2X2eUj7lDFnp2+0bHomqr9FN9Parp+ewnfdfLXyhr+m?=
 =?us-ascii?Q?QcCUfgcbUcbQQovQkkmqvdS0m1w+ZqyjHgeWmpBEIXmKQ3mrLbOkSfAp1PWO?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3a21f3-d8df-4ea9-c1ac-08db4201c28e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 00:45:53.1549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPBVS19Q9b6FcdNPy2ayOtULqfKfXBYd8UPhov5oIFD8YzZJb50rd7bu5Va4wH6rdykyJJNbr+X4Ao0z1QyhPYrkdS0hDwb9JvLZW4okWlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7854
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Fix xe_mmio_rmw32 operation
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

On Thu, Apr 20, 2023 at 03:48:14PM -0700, Matt Roper wrote:
>xe_mmio_rmw32 was failing to invert the passed in mask, resulting in a
>register update that wasn't the expected RMW operation.  Fortunately the
>impact of this mistake was limited, since this function isn't heavily
>used in Xe right now; this will mostly fix some GuC PM interrupt
>unmasking.  The display code also had a wrapper that was using
>xe_mmio_rmw32, but that wrapper was working around the misimplementation
>by inverting the 'clear' mask passed; that wrapper can now go pack to
>passing the 'clear' parameter properly.
>
>v2:
> - Rename parameters as 'clr' and 'set' to clarify semantics.  (Lucas)
> - Undo xe_de.h's workaround for this misimplementation.  (Maarten)

the display part should be done as a fixup commit as we are rebasing and
moving the display part to the top.

With the split:

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Link: https://lore.kernel.org/r/20230412225248.3229571-5-matthew.d.roper@intel.com
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/display/xe_de.h | 2 +-
> drivers/gpu/drm/xe/xe_mmio.h       | 6 +++---
> 2 files changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_de.h b/drivers/gpu/drm/xe/display/xe_de.h
>index 9f92fdb4159a..000379f8702e 100644
>--- a/drivers/gpu/drm/xe/display/xe_de.h
>+++ b/drivers/gpu/drm/xe/display/xe_de.h
>@@ -45,7 +45,7 @@ intel_de_write(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
> static inline u32
> intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u32 set)
> {
>-	return xe_mmio_rmw32(to_gt(i915), reg.reg, ~clear, set);
>+	return xe_mmio_rmw32(to_gt(i915), reg.reg, clear, set);
> }
>
> static inline int
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index 388a633b438b..a36c52bc098b 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -34,13 +34,13 @@ static inline u32 xe_mmio_read32(struct xe_gt *gt, u32 reg)
> 	return readl(gt->mmio.regs + reg);
> }
>
>-static inline u32 xe_mmio_rmw32(struct xe_gt *gt, u32 reg, u32 mask,
>-				 u32 val)
>+static inline u32 xe_mmio_rmw32(struct xe_gt *gt, u32 reg, u32 clr,
>+				 u32 set)
> {
> 	u32 old, reg_val;
>
> 	old = xe_mmio_read32(gt, reg);
>-	reg_val = (old & mask) | val;
>+	reg_val = (old & ~clr) | set;
> 	xe_mmio_write32(gt, reg, reg_val);
>
> 	return old;
>-- 
>2.40.0
>
