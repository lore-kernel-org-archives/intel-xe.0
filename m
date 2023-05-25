Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D02C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 23:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019A310E788;
	Thu, 25 May 2023 23:30:57 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD0710E788
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 23:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685057454; x=1716593454;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jfssokAUzlGhhyk2FfNbGDYSggVsGA2FljHhSPkDMlM=;
 b=fumkn3efnBg04Ji3Mp0A1rep7ymv9lvDesJRj5ZbJ/J1r12winmEVxj8
 GPuRL2ecvqn1M9xR9WvmJnHH8Cxpfw0qC+s42wuMcD60xhzAieyMjyMB3
 Ek8BBt4kPia1nNF/AjkwSBQGfEYS8mV5ZVci5Ivoq9fWlVRq9M1pblOM9
 q68e8oBWCXtDEM0AsUL4HAdALUqbdnQEwedMycjk0IB8KTng5rADSCqaq
 XOUIkV50Vi91//DPXqD0zoThlXW3I9DLdiRNtmcNqlNVKbHAw3D8fwnKB
 4aWPuKB4yhwXfJqA+aWbjpVBzqcrvzH3ohfEaGxYvfclTQo6BnrQHLjwi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357308513"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="357308513"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="849370350"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="849370350"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 25 May 2023 16:30:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:30:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:30:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:30:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaTNuh1gHSX2cTik6orwGcHwAU2NHux01Y3ro7iI1YJFpdSiZHEz+3Wi6Gx4hJbqDeC4QkkiXbeL9wFlZfbDvFBPzSLjSNygxOFCio/Zf8eBi8DoVo4ODb3y2/7GyHLpP8t+bqroO0QzWPxh9mZGZJULL7GrOFBNzM4bKjQcm1S8xWbGmgy+VYSTAwZf5Cexw2K3r74q9XByy8VDjRPhfqTb0vql9EBQhuR/NKsCypkycShKnPsCYTzewIEgsFnGntGKHSf7nN4t6++qGwn3W8eTQLk/HV6R/FoBPpcOuZHRSwBruFlEQocB6uYmdRD22rifgOEBCuu/FHMkvkZPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQAqmIBCPqcNSHcuzpkaHjlJ3yJ1cGXLfa/y7bmNpbo=;
 b=iLKwSZhxppGr6wLvnFyq7POxR9vzjuLF6e/CD4EzeiyzZMQu1w7VRJGz3Fz1wnfesDH8+yW1G7cq9NQKs5dbnOx7RR4wdmSAfcQ3EYg6mrEkNnC8v5K/HKoHY8AtnUF11Vx4Czle1vK8ihCnBYiD+wS70/1ZUxupFLwZ4fmVo9MSFDsKBC8lWAnQZkKkklCIVoWkMnFgNCGK3X2Mzdw5jyShsJKSPyOh1CWNxVqiE76Bwq9ZFuOaQHd/zMfXOGMaQnjjUeu4I7QX0y1i5jjPbZ9DYQjrz/Szot7dFPlrxi1FRGPA7Bcx8XzM2ljV4yT4Dcy/o+E1L8jAuyY6/eN00Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6966.namprd11.prod.outlook.com (2603:10b6:806:2bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 23:30:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 23:30:47 +0000
Date: Thu, 25 May 2023 16:30:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <urodevd2bxewjv45grwtrni2d5gxdl3jrrsjq3rxcpbix2hema@7vkqgdhnmf26>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-9-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230519231827.3572452-9-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0303.namprd04.prod.outlook.com
 (2603:10b6:303:82::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 65edd00b-02cd-4168-7224-08db5d781174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z0/Wgh7GrnxPW3SCuxpj5zauIlAztVEVjISG/CxjtrqB8n7ZWC+GbFEv1/NbzaqxN4YQ95zi91rh0LX3Ug/0Pg1nncmmMRA1xUIoYQnjdgXjUHfjbb3rZRADQz0qNY+kMxtKydXSuTGTKYesGyunVRtYSpHpni6yZfLx5vuzG6yzPgjihffxGPewRB1INt+tduB3nhm+FUH55tKsX659vkqbH9qwRNavnrtCgEpiD4znSmCBe/pIHAefL08N9vAE2OgvU8bUneBBKvxsPCzxv+21jZDXN9GyA9WPvi7FHtXxSkdBQExoChdntMekABud+NbomSug3mXaWFf9F1Rzd5XlT8qv1Shsb963utZurFPzVXkYz+7bRXZMBtGlo3BwnLTDImQXMZfM87jNe36EAQgiJspU03LzkO5m5SSwezL/iQK60k9zM/RYvbgOuJgfDbvUrlA2N4hFdeFxfQnHNgonJBwpa3eWd4b8+wAvLhGWr6yipMtb1Rtkk12dI1LcqYKyOwuJj3+5b18N3fhrkkuiAmr/UcpfCu7UY1hgCzUDMtTRuqTJ8yTNIZRecdhL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(83380400001)(8936002)(6636002)(4326008)(82960400001)(38100700002)(86362001)(66476007)(6862004)(66946007)(5660300002)(2906002)(8676002)(316002)(66556008)(41300700001)(33716001)(6666004)(26005)(9686003)(6512007)(478600001)(6506007)(6486002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w97lx7440eprzDOxN+3Eu93sIcmT50OBEqawTjBKhi29QrNdyfXhqROczRl9?=
 =?us-ascii?Q?rAWwaAy11SvXqYvKjHkPBnAiq5vgEiH9otHN4V8sPjC/8w5WgScZBJ7TFZOa?=
 =?us-ascii?Q?nX65JSTwyAb+AlBnJEhlar9eYfqziqN2moRQqcbU8W5J4xeRkZ7LOqsQosDG?=
 =?us-ascii?Q?eGR53aozYsCN2CooZIV900i01YuYV9YXkCjqRNEOCCOSQNXgjALTJwvAqsiS?=
 =?us-ascii?Q?2tfhY6xad1/TE/I1OQ+6BEGU7vAy7Bw9JQx4/B/GjkwgxQZaVg2Rn0eEEXAm?=
 =?us-ascii?Q?rKQU6vz+2reyQqjqZhNjVD1zQem3trCc8VclkY/ZEk0o90YqEMgcznGKP1mi?=
 =?us-ascii?Q?PKpfDFIF+yzvr4MJz8oOGA1l8DjIkCqibxRR7l5mGdis1vJfQOyrI4WZ87de?=
 =?us-ascii?Q?u4qrsiV0tUMVPzGy/hgtQUcgBXOJwy865Ru4TQ0URj70P4QGxVLmCZe+pHKv?=
 =?us-ascii?Q?ojkfM91UXfQ92/r/eaAetrjxtHTwUpzdlkIjniz13gVJZNIizcj8+ey/dX9w?=
 =?us-ascii?Q?tcDSYKhuUx8B30oN5pzHgHn4HyZVlj5hAvmMDzr4dVQA0B/5UQaUeFT91f+K?=
 =?us-ascii?Q?Lx2d9o+DZ3j4W3Dhj3PcIsVKHCVDKY7kNMKnfGRODj3Iww068AlkBx83z+8Z?=
 =?us-ascii?Q?B6lkGbAHAgsj5e66pXllZjQjMm6TXz9raMm2Tjfu2BOs+AMhQ3C//r4QXBEv?=
 =?us-ascii?Q?lpS1duLYkVNUcaQJRgHu3cucNoLuFOA8FpiRStJqV3cLmhlbN/kpwf6t7X2e?=
 =?us-ascii?Q?2T9XPrQ2kbg7WRKg+puq0DZHb/mS3h5CflA2J99D2VI+X6yF9d1huO8kul/f?=
 =?us-ascii?Q?I4cNo7RnqPc1QCsk1Un9GSxLm8SnG0A4xVwZs0UNrQ0szH7L2R098TNRkKOE?=
 =?us-ascii?Q?vhPB2rpNTTSru8LmhcOM1oFmYTZYpz9qxPdUBBaHsomEQn/1Sxakl7/3UQso?=
 =?us-ascii?Q?dyB1T3I+DBP5yMkC63yxn+BN11uopaZP7/44KoyxwCkAQwqkBOrpsryLX74e?=
 =?us-ascii?Q?RH3L6HMssxcKumWQxQXjEFXouJMDC/+jZniRECP301XOU5pJJrwNfGEl/K5u?=
 =?us-ascii?Q?S1l0PGrHlfYfA1nhJYUyBR7x57gekZSgvZvgNt9mmlxX2s3micpg5cT7bM8w?=
 =?us-ascii?Q?jTtJc3cP/+Eg1KXwn1vv2Mi6feqdTNftmjnqCrawZ0CIki+es1z/cGt6ROnZ?=
 =?us-ascii?Q?P+nKPMFhYWK6mMtV3t36PcI3fxezi/qcmfZhUMhzfZCS/Sl/meaocQZT0Qo0?=
 =?us-ascii?Q?Yk8PvxmSPiZWNgUonxTuumPOvzhMJu+6ZYjZPgZCuK2XgTBBkq8InA10M4Fj?=
 =?us-ascii?Q?eY6IkZSZe3Wvf3bFfWl13d9+NMqGkQV//bfqLSFNq3wuIsE+Oh5iIDBZ8hwH?=
 =?us-ascii?Q?2EZRYzEDC5TIkYrsWgT1rjM7egmyxPc81/Q/l2pcwmBd66uE3oJRRgwryxNg?=
 =?us-ascii?Q?6agco5en2DXHdsKKPK1KalDvqgmLRVYTgRsKZ7odRHMlJ+Ed1q0QoN4T8EC8?=
 =?us-ascii?Q?GnT+aaKh9Caqne6IF1CZR65OTPXBuyfpjU6LL5yKG2ksX43zSeznNkXpj+5J?=
 =?us-ascii?Q?wiDZO4v+vqqksWe1XqFwqz62DGAVGtQRFM9A4x//vJxDtfYK2Q/1lWdhabwc?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65edd00b-02cd-4168-7224-08db5d781174
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 23:30:47.5309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhfKa0zTrfQ8JDdjRtKczS+UupCi+64gbwjB3D9fQqpvwyLFsw2IwkM+Hvxey5V1bZmCtb7ehr79VHZRPtuTxptwCs2caJ+UGGMBUdN7zDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6966
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/30] fixup! drm/xe/display: Implement
 display support
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


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

On Fri, May 19, 2023 at 04:18:05PM -0700, Matt Roper wrote:
>---
> drivers/gpu/drm/xe/display/xe_fb_pin.c        | 6 +++---
> drivers/gpu/drm/xe/display/xe_plane_initial.c | 5 +++--
> 2 files changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>index c7c4df18e439..27e4d29aa73d 100644
>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>@@ -123,7 +123,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
> {
> 	struct xe_bo *bo = intel_fb_obj(&fb->base);
> 	struct xe_device *xe = to_xe_device(fb->base.dev);
>-	struct xe_ggtt *ggtt = to_gt(xe)->mem.ggtt;
>+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
> 	u32 align;
> 	int ret;
>
>@@ -173,7 +173,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
> 					   rot_info->plane[i].dst_stride);
> 	}
>
>-	xe_ggtt_invalidate(to_gt(xe));
>+	xe_ggtt_invalidate(ggtt);
>
> out:
> 	mutex_unlock(&ggtt->lock);
>@@ -238,7 +238,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
> static void __xe_unpin_fb_vma(struct i915_vma *vma)
> {
> 	struct xe_device *xe = to_xe_device(vma->bo->ttm.base.dev);
>-	struct xe_ggtt *ggtt = to_gt(xe)->mem.ggtt;
>+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>
> 	if (vma->dpt)
> 		xe_bo_unpin_map_no_vm(vma->dpt);
>diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>index 34ae461865a7..41540b27775c 100644
>--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
>+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>@@ -52,6 +52,7 @@ initial_plane_bo(struct xe_device *xe,
> 		 struct intel_initial_plane_config *plane_config)
> {
> 	struct xe_gt *gt0 = xe_device_get_gt(xe, 0);
>+	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
> 	struct xe_bo *bo;
> 	resource_size_t phys_base;
> 	u32 base, size, flags;
>@@ -64,7 +65,7 @@ initial_plane_bo(struct xe_device *xe,
>
> 	base = round_down(plane_config->base, page_size);
> 	if (IS_DGFX(xe)) {
>-		u64 __iomem *gte = gt0->mem.ggtt->gsm;
>+		u64 __iomem *gte = tile0->mem.ggtt->gsm;
> 		u64 pte;
>
> 		gte += base / XE_PAGE_SIZE;
>@@ -115,7 +116,7 @@ initial_plane_bo(struct xe_device *xe,
> 			page_size);
> 	size -= base;
>
>-	bo = xe_bo_create_pin_map_at(xe, gt0, NULL, size, phys_base,
>+	bo = xe_bo_create_pin_map_at(xe, &tile0->primary_gt, NULL, size, phys_base,
> 				     ttm_bo_type_kernel, flags);
> 	if (IS_ERR(bo)) {
> 		drm_dbg(&xe->drm,
>-- 
>2.40.0
>
