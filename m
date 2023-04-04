Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C06C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 17:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FB610E731;
	Tue,  4 Apr 2023 17:42:45 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8935310E18E
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 17:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680630163; x=1712166163;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V9qfP0gOkUE9fd9mzPS009HtutffqU8GNT9stsDd2TY=;
 b=mQN9ayTeVU2Hm4Fjqkc1NzLQ/UrVIPXzI4txA4uesPSSoQQRD8v528q/
 /x4h2FDiqj39zwkKPkklkECoDPam38AvgfoRLI991RcyQONSTyE9psRw0
 fJeguG4llaxUdGn5O0gG+miutFSz5PtP9evVPp7eT4xe1NlWao6UeWI/R
 eq60rJJ2mNdTExnvsN/mCnrHnVpDB0k3/i2YsnWN8nIspVenO8RmD9FT4
 MW89+lk+D/1SvdUk0ei5pnhofUl76xCqAQVWeYlkjw9Bv1rGXXi7r/6Up
 CU0WF2ZdK4MPhcy7tYowlastitUzpkHmgZ0sIG5fRSxMoc4KpBHPUhAY4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="342278309"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="342278309"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 10:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="688980266"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="688980266"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 04 Apr 2023 10:42:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 10:42:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 10:42:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 10:42:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WX51zXCDku2OaMzIrsNiNxSKG7SSh3/e6opSCyRkP3xDmb/25/0EWXBicZfu6QWsTUTRMCNBy5Vpx8levs57j+9koIPbIi0uLKTNxMYVGoa1itJeF0WtyEU802MzGAgnbTxl5hrtG50sa494EvUvCV1Lweg+u5PBi3bYS0vTGyuvJ2ngHVELInMayrmRbowDuPvELyLIotboUHbwOyb9KPkj/L+vOaCDgfJMqIelSxm5rcP8zvp1oroYqukqMnm4wedc7Pnes+x1Qj7Ai7wYGMoz8x5bQzIRF9i1kSf8oLFp0+1a+zlGmKa3rwfxAJvdRrfjvkRWlxzJ1RzOfhuyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9z2YFjuYVvwjg2z2UZX1BhsHNe4FkFi311VT+aYTpY=;
 b=g/iU8vTEjAUgyaGY6uxq9sxZUn2lIXHGtCxmOZiHfbXU9H4yQb+kIy2y8V+ej+uIlu/CKqz4/YQgtPgKZYLSLbWCp7v669kfQoxuTxGpiAcRNDzmhwGMrypXLBSoWopbK2UFIHd7hzLBkXgoIaEQ0FxlRAE3WrPSLf2xEi2Hxayk04y6wSLn0CcRDgRsl0au7Wjk/Beo0YhCZPiS6yN/+wmOCfajRKvGm/OVvMwJD4EhypXcdQUD14Kvfq1Nhevv0rjb4srzMsLTCySJ4ei2QMgM/7nUwcqD0aX1viShNlVa8ilGYDTFWnPwjGvShDevKjecaRvzHTOXhsKhTedCWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7713.namprd11.prod.outlook.com (2603:10b6:a03:4f6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 17:42:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 17:42:39 +0000
Date: Tue, 4 Apr 2023 10:42:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <20230404174235.34qocr4sg4f2essm@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230331102419.521392-1-maarten.lankhorst@linux.intel.com>
 <20230331102419.521392-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230331102419.521392-2-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f5e9663-59f5-42f6-4500-08db3533fbcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7/3+/FuAOMFjcHyScZfsnyVuDYEKjday16d6sj7tKSkem6J2UyI5TNmGjwepITdnNrmq92UgTLFMXzVQESBFKdsTxlvHPUZEoU/H3wmToiG8oaqFf+q9+vwwkDrnFYMkJYtuvlFQpW8Z6eb65TuW3VXzNpdgUp2I9BcJKHlV3PSngS/nVW3rEW1j6ruWmGyFcBpoT2+YDhRnEmHzH9svrO55nii9DfAXcdYK8OM863RO55QMANeWtR55IyB96VCEX3eXyiZV8IFByAhxQqkJfrCIfiLJlGVnBOlX4eljUs2qvPgpQwysMUjJ4c6hQtztmOvFMujo0LtViMcPvm+l4WhF0TmYdlJz+ovCzIOKQdzQRPJTklpIM57ejmYneUXhHmxWVdexw8qvWOWaMCuns2HJOVUyjqEbrdii4MkOqGAWiUYA6n7LLH3+N3E9YLt3tiIPYWA1d7IPdCcUmEAZ00tHSABWRvLOoV0BJBja8JNptifcjycBK6qiop53pRJAfFexNX4RbTYzfgEOnNE5sDQtcDr3WFtyHBYluIurRVYL214H/9WGZsysYVy/LLqN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(2906002)(8936002)(82960400001)(38100700002)(5660300002)(41300700001)(4326008)(6916009)(8676002)(66556008)(66476007)(66946007)(83380400001)(316002)(6506007)(1076003)(6512007)(6486002)(478600001)(26005)(186003)(36756003)(9686003)(6666004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mbZILVvEzCmbc+ZLA13EdsHqFkBaayvfwCNaHL6QKnB/4EvwU8BIog+PxOva?=
 =?us-ascii?Q?qw3bUDgFdv2ybWrC6BBeyI147Pm9rVXp1bwqjZ7j1MJDr0IP1dpLjokjY/0E?=
 =?us-ascii?Q?DcBAytDbbCrR/VnqNaBmikPoZFuseZXeEcKaq11ycGJqOmCTKu8DShoiCETJ?=
 =?us-ascii?Q?Qv1RTbhPk+xKBEdCUoDJBfv89eRH+yIx36G1kP8myKaI8ziqsbbLeRS/ZhJi?=
 =?us-ascii?Q?OlQfBGuKErUCFEyDySXVwCrrF1qYev98wIhyuv5liaQZGVFhyi+Elbfnzftu?=
 =?us-ascii?Q?o/dT2y/MEd6s6ya+MvX+qmzhzo9JlsFGrcqJ6UThSdnDEp0ajYQy/6l2DZFf?=
 =?us-ascii?Q?T/dsvL+Cv4zKPKafPRhT05oApFzUITTi+Y8kV3sRHl//2OgRulJvDNG1xeZo?=
 =?us-ascii?Q?S1tsoDOX7LRnB2RxavDtEXnXnpcmzMjx19lm0bKRUCIhtXFunAuLcI4IbH5B?=
 =?us-ascii?Q?THYSJDFDfypBqY558BgqaddS0InOqW0Vv4B3vdxxOQ/asLnBbR+Rh7sxkfOn?=
 =?us-ascii?Q?oIePSSqUoBzcYQl6NrTl/SLe7BHWq5TuMe9jGVMObZqPPGxl0H90/yuDTc7r?=
 =?us-ascii?Q?6JtW5Lx1REBfGYe8s7+jZxGIdqtTtcLOLiO+cbBUknbWniCSyh8fgIW1bdU8?=
 =?us-ascii?Q?ruespkdELiUSkS2jQ1RnyecIuTM72Akdh/EngB0EV4WzO107ennihsgO7ch0?=
 =?us-ascii?Q?Xbx0Y4NrkguD1rJm1UjMnYkEEjDhMgmzZridzqRn7Sb9NHQ54d2hNM3jcXAr?=
 =?us-ascii?Q?Sdo84e20k4jaS8JbcCWMkxZ0sSAmrvQUWOMsZtrYAysZvWs8XadJ3V+/FACp?=
 =?us-ascii?Q?NuB9fOwgB1LZv+hMoNeT6pLpVz7nNrdVbBhUCYZpzPo0n+FmtsvRByy8L+tq?=
 =?us-ascii?Q?aiiENiuvGzTNgdye5pIbu2LqtXIbI+8V+jwVIR9vcd/JEfvkWBAL61G6Pw+m?=
 =?us-ascii?Q?XsUo012zp2ljRBQoXlA0m1X2pzCZNha3kihpKFKsIIHW6d7/sfl+sp83ZOWp?=
 =?us-ascii?Q?X9U0xPw3xOaMFfMB9TyRTuCXZgbcjsP8hg9S1b0n629+XGWuC5PNP1Gc6Y6s?=
 =?us-ascii?Q?jO+o/dVpM6ZpJjmUHWDMUpxR7P2bd/GmA8gJk5Ivxp2VP66cgVWywocENI49?=
 =?us-ascii?Q?rEefkrxvFOcQfK6A6NZF8B/rInRebvX7ipDjYm4Sy11peJ0A7LCZnx1rYwij?=
 =?us-ascii?Q?aZle4BbKCVuyh1L9YrX2dMJX/Hwj6pjD4GL9IoTA13gDWfFELIrP/x/xtURu?=
 =?us-ascii?Q?436jJ7OEeSHUkdjL5Nf/BqxRfrEX6vFvSrlBdxqBCphztiwYSVPnWmvSU6RC?=
 =?us-ascii?Q?Gsubfz/l9zevPFdtXUHdMe/rYCgf/5JeJ9dNCJX94kdwGgJYeqdUBCSHEJD7?=
 =?us-ascii?Q?6IyM3DLTIUJ/f5vcg9vP4BEQbbp6cli4tGpNoE52DOwtXhfXfqE+ekE/yWvl?=
 =?us-ascii?Q?F9uOI3OsNiSIHPpy/bU4L4/nKUka0mGNjlGFla+IN7MoOozceDQdpOfQ8c95?=
 =?us-ascii?Q?Zij1St2zEB0KWcEakMw+u8M5I07S2f4DCgLeLxi9SLIJQm4qK6k8+SjzVbZe?=
 =?us-ascii?Q?NjKAGS6XhYlt0sfWh+FpFxDIvWUYLivIj+rr1+fzjIDI8MMSR2xFIhGfNTV/?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5e9663-59f5-42f6-4500-08db3533fbcc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 17:42:39.0765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3/yDcbE1RaBARz9ZKBER1F+o4KEozjysOElF/g2YuNB5mAG9bD1yt8gaMUbeVOyVXCDt5z9XN8TnWfATbCxBJa9Mr/KEW/TPqFjhEIFidw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7713
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe: Fix meteorlake stolen memory
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

On Fri, Mar 31, 2023 at 12:24:14PM +0200, Maarten Lankhorst wrote:
>MTL should use bar2 to access stolen memory, not the physical addresses
>directly. Correct the GPU address to point to stolen base, and set the
>VRAM flag to indicate it's in device memory.

humn... shouldn't the commit message point that for integrated the
address for stolen is an offset from the base rather than the physical
address?  It was already using bar2, but with the wrong address.

>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_bo.c             | 3 ++-
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 3 ++-
> 2 files changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index e4d079b61d52..9b2f95f3ce49 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -47,7 +47,8 @@ bool mem_type_is_vram(u32 mem_type)
>
> static bool resource_is_stolen_vram(struct xe_device *xe, struct ttm_resource *res)
> {
>-	return res->mem_type == XE_PL_STOLEN && IS_DGFX(xe);
>+	return res->mem_type == XE_PL_STOLEN &&
>+	       (IS_DGFX(xe) || !xe_ttm_stolen_cpu_access_needs_ggtt(xe));
> }
>
> static bool resource_is_vram(struct ttm_resource *res)
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>index 31887fec1073..bd1b73fa84a5 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -94,7 +94,8 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
> 	if (drm_WARN_ON(&xe->drm, (ggc & GGMS_MASK) != GGMS_MASK))
> 		return 0;
>
>-	mgr->stolen_base = mgr->io_base = pci_resource_start(pdev, 2) + SZ_8M;
>+	mgr->io_base = pci_resource_start(pdev, 2) + SZ_8M;
>+	mgr->stolen_base = SZ_8M;
>
> 	/* return valid GMS value, -EIO if invalid */
> 	gms = REG_FIELD_GET(GMS_MASK, ggc);
>-- 
>2.34.1
>
