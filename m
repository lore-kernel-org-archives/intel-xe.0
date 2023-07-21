Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559C7C001DF
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 16:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5B110E6BF;
	Fri, 21 Jul 2023 16:14:42 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B5E10E6BF
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 16:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689956080; x=1721492080;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=17ZcnVNlBjTz6yfbi6+1+ggVMAIdIivxCQYDoBeXdiM=;
 b=ZUvcIw+0meitDVpIAqFlTcChUe4DXTSwqkrmkcbtSTMiFXPXXhyARxRX
 UcEqoHipRYvDOBHvJbzmSJe4V1GKrXZOSHoqtC4KHmxcoydhMYzJwYmlk
 jbPdkqfJcGH+nRS6LWrX31NB3uqEpGA4k8zhk4V2gESOP8Gh4AjhYmClE
 J3iejyMXY+hxzrkWafN6XfpcLFDS2tm8pP93/1pEqs/EuDIz32yCZoRA8
 KxV1+EZ3a1hL+29LG+EDKsbGZP0NLm8dTsn1e57RbCUpeHArMN4YRMUtH
 SSyaPEVtjjPk/xvToKFtqUEDRn5u247JEq1Dj44kKj5zbg2sC2gDikXmC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351938406"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="351938406"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 09:14:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795014001"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="795014001"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 09:14:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 09:14:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 09:14:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 09:14:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGZS+vNdCljlF5eW5CE2WpZV+FvIB0ULRlA6kefa6sUSMb0exe7DLisoFAgQgN+N6jwzLWYwfddnBSbWsPalWV4XYaXgsZy8tL4x/9QfoynBeaSIsoQrFxJ+PnAl7xRNYeiWiceKp8k1X5vBg0rOtIH6bH9x28ES677n1yHcLsoKiVtyw01wAMVSVqYiORpwmjI0Vr3SO3kUEl5uVWFNmfUdonIor2Km8xJTknFcUfc9wrCOUHMgka9hhIYinBAd+w9NTNZTjVIzTjWkJc+kkfpaHwAFeHIcwTQnIvSvV+xJkyP+6TBEI/Z7WhUzziP6qN/75wnn0UdaT8J7KoCteQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agA/ZgdAFZhCCSmkFyaEl+0b+AK5f69D3W3kVtWDeuM=;
 b=Vj785V7ZO5Di3niliWi0wwvApJTw5TRVpejcJsRUBMwRcXmoic/57Ffh1KNOwXR0gFrU25RlxiItMP6VOkbrHdD2yICak3RmkH/X7THTX71KeFhYsUFaLErcIc4R5+XNPrlU1E2PJ9uqQe3syAhlhmR93KnlvdvIi74H5F+ZcYiT2bHty5Omzh3+EiwxJb2VXMbaunQ7vZcVsPzfeghGNL8zBHAiLezgPS8LUBTypI7pm2WQH6hyyyEQOsfDvG1hltwKe+N92FpAO2T2xeTrI/qnvzuEAZ9Aok4W5RLOyL2WDjOYGj+rgjz4GZ5AHFoJtLpMmaT37cwBKiC/DrsLTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 16:14:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 16:14:32 +0000
Date: Fri, 21 Jul 2023 09:14:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Message-ID: <4etyiovcv7ds5k5zizgy7hlhavkmbkaw3ld4qtkzljoj3ceffe@it5n22pfuoeq>
References: <20230721140745.16187-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230721140745.16187-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c1a76d-0a96-4da3-e87d-08db8a059126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sFT4W6wrcps0sur5HllSNayiBDmc2JsjCQLBa/nlbag54u2Sf6rYpPW5hxi6jxoaN9doxJHBn8yc86Pv/6eKYdCpPug1LvCCcKu9iHEReMFA4K3BmP5YswDX14+/++8xErTy8wM8+JguBM3aPxi62WJyd+nWN7dN/gW9mesypYY4V3YXkRYhw0aV3UiFm2tPH/SXTTcD74p6jev8UPv8+CHLvV/pXkYBJtR+N8vFguzxx5D+U1+c9iQ3AMUgKs3Nnndf59agoDEm9KMiH+yOEhieHTwEC8xsYA3TT4mUZPHQBgPz+3sPlJdRqi38CElJNv3rhQeNetVYpY1oXWV6aT5TmHGkF7YHoxsPYqesaTnc45ziR0SLQr07vucLQRGZVQs1enNu8PmgWVgu2a8b6vmc0vJIF107PO7j2tX6AdBdWWtWvM9gaLz0zw4Jtwkq9UgNXvDx7BBvqd7GZYMwSYKB2cby3Ksh0kF45dRJcz7vjkm9pSEYpghAL4ss/CFgPmAOg4J5tUvT4aiA7cGhk02weEkS0G3ozqPBQx3vd/8jZmPZLeY4e4r34+s5U/Yo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(86362001)(478600001)(6666004)(6486002)(38100700002)(82960400001)(33716001)(6512007)(107886003)(26005)(186003)(6506007)(9686003)(5660300002)(4326008)(6636002)(8936002)(6862004)(8676002)(41300700001)(316002)(66476007)(2906002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t8jelLKrKj//r3yRt5h9w5TzkfKz3AQDvN9+iBrdcxx4G5U/FcywK2QlzY3f?=
 =?us-ascii?Q?xIWF30xlCjrAqCJIN2HQ7+Su5qvydzches3LJlmQpjW+HD/uxqALW+cIdxPW?=
 =?us-ascii?Q?YRhebSuk+dfaThJjQSl//YJLC/VDTBfUvDfPSy4CFPVd725B6sGD8smL4jsu?=
 =?us-ascii?Q?RVvDfaBXyx6UjmlbV3auEweXSFuePdkeO8190e2LJZQ52KglBaz4YcJDnlQB?=
 =?us-ascii?Q?J9xItz/Ogi5SwORCnLBV7qQz51OzLQ0bLswyb6tqzXWWYiMx6bjg/QDFxWov?=
 =?us-ascii?Q?c3Ip9F92iuTmYhFV5JdIJcGwjk6N7JQTj0Kef4rsZhQx77gbQfyUtbPj/ULu?=
 =?us-ascii?Q?KHrYleHLivPS3q9y3KCcerHlQWAD6Id372SChQNFJUJfZkzlXGn0yeCHMgyZ?=
 =?us-ascii?Q?uKcbG01gO/puBzda8vfYJ6t87lWRJhopooHCiRNLVVFZHz8u3muncZu+yD3G?=
 =?us-ascii?Q?taDhMtvaOvk4CCU2GqO6Ee9BSMIQaBgEOEVZrQGw5Cqa4dGnuFwy94h5QTum?=
 =?us-ascii?Q?XgPbu72nV96Es1329S+y2XUSiMcnhgsq8CltOX6XwlnaO5e1cwH/MHNqBxmA?=
 =?us-ascii?Q?cquq0FkZ+J6zsB4WiXeD8C7nlGH7aFI6t9/bP8NyAalHumXnkQOZIaYynDhS?=
 =?us-ascii?Q?rLQYZcebbW9N3aBusADAi2XjL8EewW4zUMubOojQW4hXDQkUnTt7X+KNMFPs?=
 =?us-ascii?Q?sRkwnXxTVo8/tjE5x7RhEyzNb4ENLcLhjlRrixYkkLGxvk+PbwkemjNTHy3w?=
 =?us-ascii?Q?cR/0Ghuya7VzzjS2IsuvqmgY5yPjq8KvzJ1vRCJY8qjsxWb62N5o4p0Kkl8S?=
 =?us-ascii?Q?f9R5tAPT0RvTSb8kF3jXBvSCFCh5BRO7tqzKKWU5G1f4UN1L9NztpUcayNRO?=
 =?us-ascii?Q?mQQaZEGOX7WPjY9vKxElWH+FQFtsvtVU8MTnunz9WKL/Jog6QuuXOPXLz59F?=
 =?us-ascii?Q?cFJyPl9z43wUTJtQW/UjrDJIOfCeSvGtCaNk5KT/YnzGE8sNSeUkDplbV4cb?=
 =?us-ascii?Q?8Ten4ol4ucW27R0Wkdb1ALgst1S1Di9lKaglTpF5+0gFdsAHPuf1KdE7HnJE?=
 =?us-ascii?Q?baFLrDmTqRchxkkY7kmTZdzg0hw5pFtzNcZIdFXE3jCYeQb/3KNSmSIo3gLq?=
 =?us-ascii?Q?/rczpZ9PatIFR7u8SPv0AFnqefPSrpNFz3dtws81+nDm9VzUvLE4tqn5BEnq?=
 =?us-ascii?Q?pFmxBBt7cl39nv0dWvXLS5vILYktD5eLPqx5HIQJQoUSNVhz6NLsxLWUJUlu?=
 =?us-ascii?Q?kT8A4a0RHlYuzrWPR9USmV5BUOpjwH1AWcSqjmF/0a1gfyBM9NMSPe9K0JyA?=
 =?us-ascii?Q?TXkbbKvX3YxBDliRqPWEiSDCZU0D4DgzsSPXdL5cJLkf7XvcHINi7jFKF1s5?=
 =?us-ascii?Q?aGgQXrEHTzk5LlPmRoC/qg1D2d2rhVtJzXVRKGUNTS230KyV1b0/7Mp0ipwQ?=
 =?us-ascii?Q?GddGoVH0h4HL5zmpfVAH+vL4np2KOW6k1w5iZ+Eqy0YMu6S3cPHkqadMuwfA?=
 =?us-ascii?Q?pzL3lSCjWsIOLVkeneuFWsdp7HSl8k+FcAo7wcHzENIrYsxbSwdieL4fuZBy?=
 =?us-ascii?Q?z7PJcbRkwju0JNwytrY586wZEbG0ZK/5cXgqcPWTulTtT6WWJnmvogf1DXgv?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c1a76d-0a96-4da3-e87d-08db8a059126
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 16:14:32.1038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwEJAJNp20LhNbqSpOG2wkfTG6BZZRiPX7n9QcJvzy0E1pwAqkNdNaQlk880a1ZamZZHzBXZfMYBBGb/1rhqVErWuBQnHilb09vKaX4IkUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7453
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Set AE PTE bit if enabled on smem
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
Cc: joonas.lahtinen@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 04:07:44PM +0200, Nirmoy Das wrote:
>Set AE PTE bit on smem if the platform is supported and
>enabled device scoped atomics on system memory by a
>user with madvise ioctl.
>
>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>---
> drivers/gpu/drm/xe/xe_pt.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index 457f1363ec67..d43c91cf4776 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -774,6 +774,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> 		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
> 		xe_walk.cache = XE_CACHE_WB;
> 	} else {
>+		if (tile_to_xe(tile)->info.platform != XE_PVC &&

why the platform check?

Lucas De Marchi

>+		    (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT))
>+			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>+
> 		if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
> 			xe_walk.cache = XE_CACHE_WT;
> 		else
>-- 
>2.39.0
>
