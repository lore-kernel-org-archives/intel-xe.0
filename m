Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3B4C4707C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 21:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0316310E0CF;
	Fri, 12 Jan 2024 21:15:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35A910E0CF
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 21:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705094144; x=1736630144;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xym3oPJllKzxElUpp1Bx+gI9n17V0XbYWg5B4EumyO8=;
 b=BxRPDBuJkPXwz6fbd481q0BUIHr6MB2r9BumjSwTfyV/tb00QFkqk9hk
 msQfB0o0aq1IQvP7pA4vkHhUpacrcatb8ioQkZAQ4Fz0wUpOcfHCzHL2N
 TkNrDP/GiNdyHM/4l5PCubUeDsCK8npHhAmcsHuH3F8EBtXb0vzMADmlr
 7PswTRPxNqO6gSxMTC81lhhcgEZd1tCANhCWCXrC6qJiDBNg9kO8wlao0
 5vnmPDFMzHay37ezwiZ/DXZTYgeGNjF6g/7/tjE8jQVT06y3+oeuwdHR5
 wahFI9OrJWY60nIUZ6GS2CJ3ySRRXWXfJfhjjzOowwjYPo8V1XcH//hM2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6645148"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="6645148"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 13:15:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="956219818"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="956219818"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 13:15:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 13:15:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 13:15:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 13:15:42 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 13:15:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNBVlyeJobwtKHFiiq8NXEex9E5FoBh/V5VZc7jGTzG6zS0xMw+QD3rJzNFH+jghc+LjkTawHHjh44+ntG1+8Lh+ENB1YZzJDOmf2KRSzDTKsClEQF5YtVSnB/URrcfqKuVc1wGS+5RWw3aij/tsrRCR1HgU00VeDy9p4fVqVzQPEEA3ukgOWEiIOnQUn45kbVUqtipV1Na6fNPHdWUycSkXNliTqnx34oo0VKjwvWrnA71G464mx2eRvg97yV9s+Cz2/eoz6IOAgwozF5yrdEWvwvWAdUGHnfQ5zCjpN65nK81JiTPQwUa+/tZ/h0sEMkx/NS1iAvgZYut2QGgJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVtzoWbyya6JKnhyeafSADXpN9wKi7vTQaWbN5XCUq8=;
 b=DKHL2AWvmFCVrQdreo4bzxrmBGIv7YKgccPg6aQbskdn0KD2g8wOC3Gp+K/xedndPfeCE+Ta87hASAPT07/PcQOOsYYP4/sRcMQ8hOroBQ/8zK7AyYcbjx0s0pvdBbV85wie4K6/RpAEBFgK3nIXAglc/bEn2dMA3dH+IJe2nB9vxvTpm58QY6xlJCUswR5ict5JAzBibDuWCZscSApHcU2bZ8Mzys9fUU5iMWh2QfmezRARv8MX7gvnnjxDZHlCrlua2zYaaFE8TrIQVIPgrSV6eys9O5sTEwXmLi9fj3jRq7RRCGlD/3sInB0NuaUX60fUuS1w87MN06H2u+OsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 21:15:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Fri, 12 Jan 2024
 21:15:41 +0000
Date: Fri, 12 Jan 2024 16:15:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/8] drm/xe/vf: Don't try to capture engine data
 unavailable to VF
Message-ID: <ZaGr-fRmu2EqiZh-@intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
 <20240112152649.849-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240112152649.849-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: 528865b0-4fd9-4931-0f2c-08dc13b3a155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zjkECMVzjDTs9twKeDVksi4FpXrcU5g4rcOZDWPIQ3qCFRiVN6MCrHXZ+cVukNDfxoR1WGOr9AiKgA72Y4Fe5Nx8ZbjEdrf4J6y+uRGnlwp6bHo+M/0a+kg4SXvfp84raPerFdp54PSqftOnH9gr2/Wn9cSfoz5vDWLC+U7bZIQ9QgplawngkVgZsF4zoXTPudLBKBFN5+RtmZF9DJ4rtYdcR3ZVAYngFquyYEkTLeJK5WMD1qUN5qUneNhDq8LQS2c29LblN0OXEmE/wo24+xI38K6pePWGmwm/jsJVVLrEpbnIUUdTfeUxcCWnBZCt2khViUhDHLkOJvveeNzLaTF49suxhq6UjtUChx3Qq39hOUT/MXa46MPkF0SJz85PHFayNl+wCFEDLROZMtc61uuV5kWwXvTLvEccD0GXlBODygI2Tqgqj+we8xCP8FqF9mgjdyrayDBbKDAodYk97QxPe51J5TQah56AX9zRy3scYrC947f2sTLbxzPD7TKi36YHgIh0wzAolukLZYBqn402HUe/3f/AHiUym+EF27Xlx1nGYusugyiPiCrmk8Sf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6486002)(6666004)(6512007)(6506007)(2616005)(36756003)(26005)(83380400001)(38100700002)(86362001)(82960400001)(41300700001)(478600001)(8936002)(8676002)(44832011)(4326008)(6862004)(5660300002)(66946007)(66476007)(66556008)(37006003)(316002)(6636002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q/uzdelCGSibDGndMBTtF9fgJ0mObsvuLsOjAvvgPiJj16a2byS2F9mZGDxa?=
 =?us-ascii?Q?J7TBJQ38GTMjdZP/UCS2d/07KLVh4FPfzEXkSkC5FOXI94mmI6rO64sDjxuI?=
 =?us-ascii?Q?+Dvc90Td0tfWdjRjiZiNEoA2jDukegjOXnf/gXq09D0YyoEyyGcC1P4kSEwb?=
 =?us-ascii?Q?OyKFW5qNOH0iQDudCVUeqnYV3XOdph9MYKuxvOxvAVz7Ylyrf3jox1Pu5vBs?=
 =?us-ascii?Q?0anHLFVU3djgmR0k2CdMsv/sqq4G8qhc0oG5/1E78ijiYJ71lKQrJp7tQk/F?=
 =?us-ascii?Q?WEP7cV1eRzPYHnL2TYe+p/Z7MJf47ao42tUZm9vpeimBmnFlUz6RE4lzb/ZU?=
 =?us-ascii?Q?SwrATmdv+wUoOGAQwsWzdP3X5izLPGtbZKhlEQcptqviHpA2DJlxbdbGn6nd?=
 =?us-ascii?Q?o8caOysu/Ypi1FCQsl21Yw0nrJ7XVjDiax/5WkfByqyjAdSKpmvqYNXy75k5?=
 =?us-ascii?Q?Yml6hel7CN8C/Wt+IErSbhpeOUnL4SON+H8OIWlsoNRs6Kju1l82V9KCbpqh?=
 =?us-ascii?Q?NiGoLdwss62eTpnIGs2mwlJQBWc61soo0DrQK+x1tMsyzIIu+F0d0Q2CKC7d?=
 =?us-ascii?Q?hQIZOsFEETE6nC0R7sNkvgbqPHBDFd5N1RGRjAQzT/JRvO0pg31Cx+7jmsuH?=
 =?us-ascii?Q?Hmo+z9RokVKLJOQoKUu9VNuwZJCp9+RZiqdI1OMeFGxWLcoisRvZRwRqcafC?=
 =?us-ascii?Q?+rp03egzzXMMXYH2xGPORku0gNVVjYHGWGTZWw0Zvbvpt43FFObQpC6bbHMB?=
 =?us-ascii?Q?nBTzjQNWgIZef81dIRoGDbXliHNph/nLjQ+D7dwFH9sMQ+LwKFAdTlZI81Dj?=
 =?us-ascii?Q?6UetQO/eEV4KPWuGSMGsBCgWhlYSTIamn38VdxC1XdDNnrCtx7tWaNRqu/vG?=
 =?us-ascii?Q?G0t7s5EgAFXhTRaugG/pTF3NKKlTpy9yZy6Pf5pH2XNoW8Rgz8+IdS42ocGx?=
 =?us-ascii?Q?H2B7RQ+WwVWYofwHnlS20gZ+ZWJaux4vF9KLeFURtScZXsGsOWQJlHxeYHbr?=
 =?us-ascii?Q?oq79wD++wilMgk7qhDNn0KabKpMT5d3qhelUBLlF3nF3SMfkF7BGYNxvF5Pd?=
 =?us-ascii?Q?QKDy6UwDUP+pXxVIZPsewerhf/bCt1aaKTtI0JX8GY1WoqNcLcu4DsIdtTZl?=
 =?us-ascii?Q?GS0A1qRPycPZFUbhJgPD/bP7JPZ4K5/wKbXjHiVY7qRw8bC4aMNOa9xzhq4a?=
 =?us-ascii?Q?Y1rN16mI8Jgj8MVIRRrVlfnLQ94jr8uJ+EOtO946CZos+KkSFDbPF13mVPXM?=
 =?us-ascii?Q?xQPLWlyfQXY6b+AmK4V9ggtnHX+pTRBK625jDkOtBsM2IIHTiNgkmabWaFIL?=
 =?us-ascii?Q?fETVxFnMw+bwsLqPO9RabZjUnAhKEduf/2WE9IfRViSne6ak2nMlBn7tfpts?=
 =?us-ascii?Q?7yXXtcGVP785+Wkviz6z3yxLObuk5AaCMsxV3o1KkhTpnzxCqTORE9VASymt?=
 =?us-ascii?Q?JZNzPiFdZkkWhcvEVMdVKRe6OB4xWEgPaFvcd7q64ZbaWxVX/Sl8C6NaF9Vz?=
 =?us-ascii?Q?53+z5muTFlbQZ/58py9E5StNwawL3im39AD292DUvHQJ7siYk365eokJGxIX?=
 =?us-ascii?Q?AZNZfVXR4lmveUAQCDQi1rlgydAkdSJngEi/BcTa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 528865b0-4fd9-4931-0f2c-08dc13b3a155
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 21:15:40.8966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0B/9b7HS0U2hJpgE5GJBKlA85jaXdm60fkJA735b1Id6A2opETSAWIjuv2iH9+Uo6it0oucQ48Rm9kC4FDWr4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 04:26:43PM +0100, Michal Wajdeczko wrote:
> Don't capture engine ring registers as thoe are not available for
> the VF driver.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index e279ef6c527c..5722f7ef8ce5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -25,6 +25,7 @@
>  #include "xe_reg_sr.h"
>  #include "xe_rtp.h"
>  #include "xe_sched_job.h"
> +#include "xe_sriov.h"
>  #include "xe_tuning.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
> @@ -771,6 +772,10 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  						    hwe->domain);
>  	snapshot->mmio_base = hwe->mmio_base;
>  
> +	/* no more VF accessible data below this point */
> +	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
> +		return snapshot;
> +

I haven't carefully verified all the registers below this point, but they
all seems to be related to the CS, so it looks like this is the right way
to go. Maybe split in a separated function?! But anyways:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
>  	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
>  							   RING_HWS_PGA(0));
> -- 
> 2.25.1
> 
