Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734BAEB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 20:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A1F10E46B;
	Wed, 14 Jun 2023 20:59:29 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC1210E46B
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 20:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686776367; x=1718312367;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lp8kCl+NGg2PGetCNpnBrMYWUsrAcNgl0JUkSs0lJP0=;
 b=TvzwCuugi9DNfdLX+uvxoXU5//3X3fU77m4qnOxndBerQ7LQxf6xCm4/
 3EzMKMsK9GI832P3GdtfVHMTkJjKFAusNuwsRwUi3pfhs0KOi6wGcjA0E
 n8hhl9DslN9aKLAq9U6s5N21zSKScXqvZP5WruIru1ok+IRxRoaDATgAh
 ARl30slWhIkjI1tZ3VYjRFZ3YksaBnH1AhhsAuZEqR0EcsSdNIWVIbnz3
 NDilKmEyWHH3cet9l4Tr4wFZD7/vsJ/Xi6cGJnkoPui1IsHMpCaf8fUKr
 C2RwrnDHAB0GRJ3M24KbrcEsb5CTSvoDNHU+9jtN6N8GytDK3hn4Kcjlc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343433192"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="343433192"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 13:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="706367259"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="706367259"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 14 Jun 2023 13:59:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 13:59:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 13:59:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 13:59:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 13:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5+PexLB8ftlw9T7n7cqdc74cFip4bKsYOx1Bz6MuxNZES4lxRJ3tQbahZ0v4+RKEVF0vcUEE4oLWN+NqKQCiqXwN3RKjO6h6/JUDu96A69Vn6Nk6Ry8CjqGFmJDI0aXwkfpqEyNrcxvW/C5Ebe1keUwuwarLnM3wcX2Ch23dEK+CBkobeiB3RJxWKyWYO7iPgtzbXH+DJ/ba0tEnGdLt1B1+2odStcvk4fxaOYfHFAOmwGTy2G3EF/Te9WUQs45tSfakUQ7xuPI1Lm2qNzCbjLH8CK+FP1lpIWPGUKgijAcf83k7WVpD1u+7OJxqGuwC3j1jwyelxuTqRI7BmLdbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8Z9UbBskNm1OdXz1rrTPPGR0mzl8U/9ksxO95NaS3s=;
 b=MeDkvVcHq5Mk6ha9FZ6UasYL2bXoMlVR6ja10q+8Rv08cwyzz02AMt92uBrJEsQ9tAA6WnUf62khoVZYDhSwcVSCtK+p5V+OS+hVhO+n87Ifp3a8b1xguyHCAvHMsVzTGKDdUkiuOHXV3lCsMLbjWBds94DrjKScRpQ41FhOhv7TFU2fXYclBhZzwDJCeogGJzjvux31JgtJeaW6LEedC77/CQtkG+ms8hn/EHAA+Og3L4Us6Xzf0zM2k4InSJ9W8f6SQ7X5fT13v+fn5zAbEjvce0USMtwwJhzo9MFk8JEr8vqq2z0sKV/75Qv0qWGxbNlcyiVgccwUfmawXLUP2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM6PR11MB4626.namprd11.prod.outlook.com (2603:10b6:5:2a9::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.37; Wed, 14 Jun 2023 20:59:22 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.043; Wed, 14 Jun 2023
 20:59:21 +0000
Date: Wed, 14 Jun 2023 13:59:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230614205918.GJ6953@mdroper-desk1.amr.corp.intel.com>
References: <20230613180356.2906441-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230613180356.2906441-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0039.namprd02.prod.outlook.com
 (2603:10b6:a03:54::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM6PR11MB4626:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1708e7-c20a-4898-46a7-08db6d1a39fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oJIPp8P1l21Lw3B1w/ism9h5l8Xrag3vwTQaktSNBpLgMlCCzhBfteMtBl3/AiHMvUnn2KgH+GIznlvw90uag7rW06WEzZRHBD1v6UwjuVLc+ncL2QWaZXG7xqPbW4Ng0wMf19FvDKUvIN6oG5kq2l5tOZck9ysYgM8mOKIHmzTFcPYSZ6hSN+ooauQ5RD+CGv7rfNLuaJ4CIUdXtObeyRr3NibLKlig7KOu77mhxpoS9VxFtz8UBu3F1UVupVR3ijrvFp/zU/HxP8GIDpk/usSWDbvw4srx5SpYBmvBBg20OHT2hcgRHqiWh5tf3exm6u3t3QlxW5Z2ZPur+BPN1D77CbpFOfnmUcuFhcs87s/VbhISxU4neaNcNP9uX74Trn0CmwpvvRLOjvQIMrR0h8HdCBDt1z4ur0xjL5Nqc+gIvPm8+FvqFKAWMHGh3mjNXy3ojef/1KhZRX3zp4DuF+3oZOiwlWD4BHqMkKhBglyc/ukP1Bn2Oi4o++DoEMh2gS4HgCO09+3igQc7fYZt206j8FvlD9RjscNkoxB6sdDH8dv1eELigQ7EtWVcLJoS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199021)(5660300002)(186003)(6506007)(2906002)(6862004)(6512007)(41300700001)(8936002)(26005)(8676002)(6486002)(316002)(33656002)(6666004)(82960400001)(478600001)(38100700002)(4326008)(6636002)(66556008)(66476007)(86362001)(66946007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KHWKdD+14r0KzRazQUFn7+JklJIXqfGZVJA2+YtfjQIzAYm6pGBAZMQLXuz9?=
 =?us-ascii?Q?a9Fcwjn3ZursxVotEidSfRnOiIycRita6PKX6MFxuUNPDbNu5q5bYLI0lJhV?=
 =?us-ascii?Q?wnn/rMxEyFil41HmDbIOP+wFb/972Sx3TbpZrtFVz1/pbHc0bX+0x4dMkvdJ?=
 =?us-ascii?Q?u/9WQBN2nFYivI9YJb1JIVZQE4tW738Nyh5zeSKCR8f+FH1agMOibCvdyX9S?=
 =?us-ascii?Q?dJEl9uGukirbYI96scrwX5TdhaTE6Zkp3UwxyfawF6c/1tiwYWvG1ssZWhek?=
 =?us-ascii?Q?O6L3fmO5KrMwpKaOMX7P3awIDT8NGViy0RliQBRZ4viqSQ86n+Oi8GyjPaNp?=
 =?us-ascii?Q?bJEZXifEWDiN2si84PL6usO/MvzhoP7iw4uu/EUhtVBmgHOpv3GNQQ3q8bS6?=
 =?us-ascii?Q?ADquBb/Z9eo/OASbffjgTV4OsY7z6CW2jCBJhAPfVDJLAmy0FbkP4znxJUYl?=
 =?us-ascii?Q?jYGQNn0S0OuRkWNnVszu43uAUeHrOAZGj2iiRagjAtz6LEj23F+QxB8oZfx7?=
 =?us-ascii?Q?gWNTgLnUiYH+XKeyqLXKq7e3Ph8iCHXpORlwGb/2ZgZ1h2ExCe/Na4z8QrSh?=
 =?us-ascii?Q?7Po1SqWK3f864c7hYzWXHOwxvZgoG9HWY0B5Zz2yBQNezVvd6zzRFLKcuaZQ?=
 =?us-ascii?Q?xtgC6oOwl8Huro3u49jPvnOfRFaNqAUuRP276NdMYTzm43Hh6JYsqvbSoWO0?=
 =?us-ascii?Q?NO9+no94obM4KiMuazKckYSityPVF8BPJ9ejwJo5zmN9GNyk6UKbmNm7KfWh?=
 =?us-ascii?Q?zjEKgwN9HMBUaC6WUT9tlIPeWp+8uiqq8cbZdHVJXGcHdgs6KMIe7cmzlJSA?=
 =?us-ascii?Q?fgGdCDnDpfkWY4MAZmMvxgitHMyGts4c6eMYo85as3cekBMk8kRLTHRB9GbF?=
 =?us-ascii?Q?wMhL29rZw+90iUK8x1ZjMDo26/6PZ1e1USBZwSFxtiKtzKsFAntz2KVYQpc+?=
 =?us-ascii?Q?Tfubv9lOFrorK6RXWXRKB3dsRKFHXg7oiJYQ83lvYt0EgjT63VQ/bMUtZoUP?=
 =?us-ascii?Q?u6Fh0FkmT1DSJ4BVkGlW2lmD2NORAmsBr5Mk4CKW9bSMdZAwISaQNnTWChci?=
 =?us-ascii?Q?P7JNSjsIvh7q6aVnZDbVCsDmmmcOtJHiq5fGKKTq5UI2bFDW1wm49LWcWwUQ?=
 =?us-ascii?Q?u2YEusNY6c0GqdggY1ecu/76c6OQggtrtVoCWuaC21Qs0LO2+oZnofzTtko8?=
 =?us-ascii?Q?18IBL4fleT6uDM6RG5tPUVb/+aWm5LOBI7zw/+SDtgO/pBDHLxNjrk3DTCms?=
 =?us-ascii?Q?gUve+pPoFJFzKGr1boStM5EQX8JiDS9+EncsBmeaUf3PCNVJvcnSoxxPFr5+?=
 =?us-ascii?Q?Hnl3Ndg+B1EUh+sirH93HRjp72XQAm//EBfSZ6wKn3bTDvtXLEbjAP1odJRg?=
 =?us-ascii?Q?fwbVsxftfUs1hZZmB1ikbOsQnObpQQ8VBLgVYkrZ4Ckm5yIw0gwb96D41e0e?=
 =?us-ascii?Q?Ijq8NPbPHBdrCxaORuGdhRFITF9q4uxevRNknyvwz1HdjEJhuqjw8JQQn8gi?=
 =?us-ascii?Q?dvBSQSvQqooeGJEjvcVEIQwImC4yZeqp7Bn72ii2tMogCcAc82iRJqnwd0X7?=
 =?us-ascii?Q?6nLLBJlw67ED0+pYFIgLPmbt3u9UOA8dVxgdTRJQp8BpFL1GnVTZBRI/ZrRd?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1708e7-c20a-4898-46a7-08db6d1a39fb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 20:59:21.4099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/4WRQpFOBYNPtVZKqY5tGWlmsLSo8DEy3ZBXJ9R8NxsRcQL4cCqHaZp+XnlxnUbAVOUmZz7030DNyrsgmRGxKoD9G1zFfjZ/s+em6kFiM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4626
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: Skip applying copy engine
 fuses
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

On Tue, Jun 13, 2023 at 11:03:55AM -0700, Lucas De Marchi wrote:
> Like commit 69a3738ba57f ("drm/i915: Skip applying copy engine fuses"),
> do not apply copy engine fuses for platforms where MEML3_EN is not
> relevant for determining the presence of the copy engines.
> 
> Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 68cd793cdfb5..b7b02c96e998 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -492,6 +492,9 @@ static void read_copy_fuses(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 bcs_mask;
>  
> +	if (GRAPHICS_VERx100(xe) < 1260 || GRAPHICS_VERx100(xe) >= 1270)
> +		return;
> +
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
>  	bcs_mask = xe_mmio_read32(gt, MIRROR_FUSE3);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
