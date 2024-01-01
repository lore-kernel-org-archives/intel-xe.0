Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68ACC4706F
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jan 2024 16:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B3C10E0B5;
	Mon,  1 Jan 2024 16:13:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1045010E0B5
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jan 2024 16:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704125602; x=1735661602;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OQjNZAMKoAZma5lMDlgpy62ZAQeacQa4ndewmkVHNuw=;
 b=jea6kSjA37QFNszhb+oBSn+oQ2Ttdyxgx7vwpjI/F4LLFCQ7zdgOhTz4
 csBnQzSo4Vn2NzSi6U/BnVUiq44mdputLgFxwNlfHaGpRJNdCRrbiYA6F
 iKSj9Q3Td3IuL4k6tDN3BJ9YnvHUoauKZh8lwstGno4VXQVhaJJg0WCHu
 DrGHwG0k++UqgCt+lJyA6Pm36PSMCnL4vktFSj0CFUtXPFeBeqJAkciel
 iJEE9XxRvTJmwpu8W7o0e0w029KZifPUOlUgyNYbtxZrVsZBekqUN8QGr
 8lNt9EaFY1Ykoy+M2CqD/KPRdW6JddFvBmMkEnD1efTFNeMwBjDGmfzGC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="3878939"
X-IronPort-AV: E=Sophos;i="6.04,322,1695711600"; 
   d="scan'208";a="3878939"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2024 08:13:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,322,1695711600"; d="scan'208";a="13960040"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jan 2024 08:13:21 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jan 2024 08:13:20 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jan 2024 08:13:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Jan 2024 08:13:20 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Jan 2024 08:13:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2bt+na3gmlnVjaaOo1hVDD+fhvkl49AgjjAikSyy4c/vUk0LkqdoKTXJyzZbdTLWFW9W4Hanx/cc+6KQAY09nGx8ax/UfBODxCzdxroM8MWHYTbosAJ7nMYCqcfzGgbLcCzR2+buIZCzsnEzYg+1Fb7OjB1ZnYjvwYsdrUItHuAmyo1abO6kXdM2mbSLhaSG+jYsTC2Li4i6A24zqCr0YVjyObqAg2ArIr0vohKiwfSeH6RzcFGqHlDl1d8qsexywSPsEpN4GkoTxg1Jypv/ASIPhmmRXQoYw6By2hL233HKNUAs+gljPksXK36LTNs0t6UilDWQQ+qSBoT2HtjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJ6+7AIN/dSNbbtEDhkAYpIp7CgIVnvt6lQJcqH2oUw=;
 b=KRQsaKOXgXJpVW8E8g6SuyCFwv6ITAXjttopBqY90r2Bt3UGKgtni/bMgWELZe+VzWDIoFTVHC2Uwz0fQeJZiSego+fvLYxh7VBiQvWUTgTWyxN0WOrVqGxMbz4BqZNNB4dXKaQl3FiNliP1IRNAI7yZq4CasfM7zrx4zQlKkSHhW678ORFRs5q4QhoTO3UUBuyww26n0daFetiWS5g7km1BTsNixegby3e41X3XzvXQGBlgwzzS61thy5OXR4QmrZhDYEO/i8RucuSfjNyghdDPU1xggDtkAV5sslilP3pem6/+QYTeVSs8LN3rwkqBu6Fq0TY4y/z0lEbvTEaEWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7672.namprd11.prod.outlook.com (2603:10b6:a03:4cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.24; Mon, 1 Jan
 2024 16:13:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7135.023; Mon, 1 Jan 2024
 16:13:12 +0000
Date: Mon, 1 Jan 2024 10:13:07 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Add GuC based register capture for error
 capture
Message-ID: <ghlyiayalybcuzmjkafap3k7xlpjwddzetpaocojgpsefmvgmr@hc635zmrb2kd>
References: <20231229220345.1396456-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231229220345.1396456-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: BYAPR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e2d03c-9f6c-4dba-ccda-08dc0ae48c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n6YuRkPbVWzsUFsRAsQ7zOUVPVHUdFGNQi3nKe5ECr4jJXHcJynsBTPSi8m+t/PTMako5zcFTqiKcdzrE0ifepItyMB3VZJSnHk5HH1Hrv2xf6+iUrMlYmZtyCIBXDtiiDIwPRKUiwPcLOcd12D5Wo6GZTjdlPHVA/v7cWDoZkcGZWlk17kJ8frCv2DuGl5csnGE0LQs/EMUKkJIc9FOn3pZ/PiCXrCcAuA0U4l8nCyWhCRiuvbbEo+gTpYrvAuFEw+Eq0gIZf/tXL4vg5xsWedKdgU7Qbx5XfiFAOPmEgu1bdP/Px0KZwPMwFstHpHC6+taRf13EtGe/usp3An/v9OhV1fA+jrddSd22el12ohCnLnJ+y7IGlOI0AjW5l0FJdTnKtnAzFqGInaGKjoN2+2MQ33t1LHPhapsltpxv+z/3o/jxM4A/sjTv9fSPT5LaOgjDySYjxNSiDGkV+YewC1UK2h3pOjO8ZB3e9IsBwVSE3Bm3/GUBVmlxB3Jtz+zgxkXLo/XqSnoUK2nzFVNlBX1G+7xVN7KyTa7W0gx5e/INje7ei3n4BZ2up0TqXJa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(41300700001)(26005)(38100700002)(6862004)(33716001)(82960400001)(8676002)(8936002)(316002)(5660300002)(4326008)(30864003)(2906002)(6636002)(478600001)(6666004)(6506007)(6512007)(66476007)(66556008)(66946007)(9686003)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1wIpKdR/LLk2+TCiy0Ak1t+RPAR7Q8QkrKQp7FVeZHm+xFRJpIIxJaU18J?=
 =?iso-8859-1?Q?Yj0Vbp+eyPKAosSCPDowNGcgT8yKprJ+Fdem1yv/mQinVOFALQf6jZxNe8?=
 =?iso-8859-1?Q?9oQ/+mHzNgTqACHcVY5sQ/trSF90dz30ZOt+oeK1jYpygCyVeNp+JsNFPQ?=
 =?iso-8859-1?Q?NwCexhvs2ilzvkl++HprQck1pNROb0skIYtF3xXSetVlOHEifh0IwvN7+z?=
 =?iso-8859-1?Q?OAUOstklaT0wV7WTv3xQYrQCoXY7dHBiHrdR7pteWWbf4P6ts0t9q3llBf?=
 =?iso-8859-1?Q?uxCUZMAgz+FdP+4nhYdzRFUh1OyCsOL7Z2Cnghj1mH71L6G1glP2Q2/O2X?=
 =?iso-8859-1?Q?KvvQsUgGnyd3k6IzsZsUuGMZXC5jww5Ua+B29t+s5GWZ1QE7IhDkUIBVpg?=
 =?iso-8859-1?Q?t9tzLYy9jj2wQifoSoBUx6ZYA60bWMr11qh5lJJ6jzT8ml4iOX7DJH706a?=
 =?iso-8859-1?Q?aabGT3dEIYCAualpUMrPohqR5hFK1xWaP7k4e4MkVyyZRYwq1N+mHkl8jh?=
 =?iso-8859-1?Q?Xrj1gkt3ITjVt5Xe24K5Jf5aPTqr1gp9hBsllv/OJtckDFpJWXtERN3zeI?=
 =?iso-8859-1?Q?hsRaYRew5oRnr5dW+7zdnfu5VAjKeic99zPPnHsh2dE25/RHgziUcaoq3p?=
 =?iso-8859-1?Q?+SnupJ9O6NjCGAcUBS2SyckCqVlC7j2U91PlbgWse2AAq7/TsBZXeOA+eL?=
 =?iso-8859-1?Q?5uNyn6lmr1B4Tl7EVv0bi91qnOaRZLU3tmjTHgT6/clcvJX6A0acURYoAh?=
 =?iso-8859-1?Q?p+7pVbWIKmphqYzyIWOo/10eVEQ/lW2C9cWJp7YLEnlxmV2LWhBzMz3x4X?=
 =?iso-8859-1?Q?kCQC2fEz8B7GqUXdLfrjEVZGEPHfP1juqW3/PPoT1yy2JX3zC+unx493LB?=
 =?iso-8859-1?Q?i7zSQpW4jiQExsRCCcKxGmJvTwJaIRygxoQV/Y//3NEBWLq0avc2X4tpOe?=
 =?iso-8859-1?Q?22Gf3iK0Wk2eLYnd6rDeKQ+bfYdrvz2NaCTH0Dvu5ccAQ/Vl6eXcmhwoUe?=
 =?iso-8859-1?Q?PpU5UhIoSv/tdq8HkIYQjzOz+kCOcFueVR74J0i+vr3gEU/0njqzi27JmE?=
 =?iso-8859-1?Q?OMDYZeHTIOIsDMhWr8+gSo4FXfiUdDYxcxIGCHWENkA6BjpiqnTPwausRZ?=
 =?iso-8859-1?Q?knYhJ/Y9sY5mWHeLbUTNn4IrJGH1e8+nCyZ+XrJO7fMkx0vHP9zgMibhNf?=
 =?iso-8859-1?Q?uISvz04fGlLXCL//cM4N5J2h2I6CRB1fLjBbWvaa4ReiyBeqBxmJ+ryjKC?=
 =?iso-8859-1?Q?OP7KBcyMz9qMzAHLedMrVj1Z0hih0C/LlAAyf1yk4QQbZ7Qp8zhD9nTbNB?=
 =?iso-8859-1?Q?fqjfx84c0tDAtaOmvTmgt7EqKlk2iUHcpC8dz1jp0aQtgEtxQH/q3asrGx?=
 =?iso-8859-1?Q?mhQmynsWLgH6UlUWMK1avvhouqgapbUnBUEfHSnbwUXP1cQ6By3ZoFoweA?=
 =?iso-8859-1?Q?ER+xBgWSDU1P3gnTM+HCbtnEdemgWM0MtB66+BDUoUsbcyY6oC/RNxprno?=
 =?iso-8859-1?Q?YzMYRW93MRP/fH63YjIYOt1Buwte4llFHapjYGvGaCEf8ns/uvPmHmU3gd?=
 =?iso-8859-1?Q?6F3Gr/SgcwENdrzhessQ+EvR+liRo70lSj4UwmCmWr++toZUcRpCMr0+ZZ?=
 =?iso-8859-1?Q?PE9IXGb36h2JsmCrJy67Qlwqa+kBXLp50GTVi2OqsV/Y5tpx5Zt/pU0w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e2d03c-9f6c-4dba-ccda-08dc0ae48c6e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 16:13:12.1938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4ED6Apls6ASeEPMmTAhqyD4V7o5Bqvc3VK1uCDgK2oIWa16xeMN8Ne3OQgUyKUrsMH5SwxQ+89fM0uHULoYXsBH1ShpWDb/BkEMt9GkAlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7672
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

On Fri, Dec 29, 2023 at 02:03:45PM -0800, Zhanjun Dong wrote:
>Port GuC based register capture for error capture from i915 to Xe.
>
>There are 3 parts in this commit:
>. Prepare for capture registers
>    There is a bo create at guc ads init time, that is very early
>    and engine map is not ready, make it hard to calculate the
>    capture buffer size, new function created for worst case size
>    caluation. Other than that, this part basically follows the i915
>    design.
>. Process capture notification message
>    Basically follows i915 design
>. Sysfs command process.
>    Xe switched to devcoredump, adopted command line process with
>    captured list.
>
>Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig               |   11 +
> drivers/gpu/drm/xe/Makefile              |    1 +
> drivers/gpu/drm/xe/abi/guc_actions_abi.h |    7 +
> drivers/gpu/drm/xe/regs/xe_engine_regs.h |   19 +
> drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   70 +
> drivers/gpu/drm/xe/regs/xe_reg_defs.h    |    1 -
> drivers/gpu/drm/xe/regs/xe_regs.h        |    4 +
> drivers/gpu/drm/xe/xe_bo_types.h         |    2 +
> drivers/gpu/drm/xe/xe_devcoredump.c      |    1 +
> drivers/gpu/drm/xe/xe_gt_printk.h        |    3 +
> drivers/gpu/drm/xe/xe_gt_topology.c      |    2 +
> drivers/gpu/drm/xe/xe_gt_types.h         |    6 +
> drivers/gpu/drm/xe/xe_guc.c              |    5 +
> drivers/gpu/drm/xe/xe_guc_ads.c          |  255 +++-
> drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
> drivers/gpu/drm/xe/xe_guc_capture.c      | 1574 ++++++++++++++++++++++

mind the reviewer. This can't really possibly be reviewed. It must be
split in sensible chunks (that still build and work)

I skimmed through this patch and think it has too much copy and paste
from i915... it needs to be trimmed down and redesigned. Early feedback:

- Any support fro graphics version < 12 to be removed
- GEN* names are banned in xe, don't add them.
- Each part of the driver you change as pre-requisite, should be a
   separate patch. I will go through some examples below

> drivers/gpu/drm/xe/xe_guc_capture.h      |   33 +
> drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  227 ++++
> drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
> drivers/gpu/drm/xe/xe_guc_fwif.h         |   69 +
> drivers/gpu/drm/xe/xe_guc_log.c          |  179 +++
> drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
> drivers/gpu/drm/xe/xe_guc_log_types.h    |   26 +
> drivers/gpu/drm/xe/xe_guc_submit.c       |   22 +-
> drivers/gpu/drm/xe/xe_guc_submit.h       |    3 +
> drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
> drivers/gpu/drm/xe/xe_hw_engine.c        |   89 +-
> drivers/gpu/drm/xe/xe_hw_engine_types.h  |  126 +-
> drivers/gpu/drm/xe/xe_lrc.c              |    4 +-
> drivers/gpu/drm/xe/xe_lrc_types.h        |    2 +
> 30 files changed, 2632 insertions(+), 130 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
> create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
> create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index a53b0fdc15a7..337f6b613438 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -83,6 +83,17 @@ config DRM_XE_FORCE_PROBE
>
> 	  Use "!*" to block the probe of the driver for all known devices.
>
>+config DRM_XE_CAPTURE_ERROR
>+	bool "Enable capturing GPU state following a hang"
>+	depends on DRM_XE
>+	default y
>+	help
>+	  This option enables capturing the GPU state when a hang is detected.
>+	  This information is vital for triaging hangs and assists in debugging.
>+	  Please report any hang to your Intel representative to help with triaging.
>+
>+	  If in doubt, say "Y".

do we really need a kconfig?

>+
> menu "drm/Xe Debugging"
> depends on DRM_XE
> depends on EXPERT
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index df8601d6a59f..5a97b2b74d1a 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -92,6 +92,7 @@ xe-y += xe_bb.o \
> 	xe_gt_topology.o \
> 	xe_guc.o \
> 	xe_guc_ads.o \
>+	xe_guc_capture.o \
> 	xe_guc_ct.o \
> 	xe_guc_db_mgr.o \
> 	xe_guc_debugfs.o \
>diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>index 3062e0e0d467..dd57620258b2 100644
>--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>@@ -182,6 +182,13 @@ enum xe_guc_sleep_state_status {
> #define GUC_LOG_CONTROL_VERBOSITY_MASK	(0xF << GUC_LOG_CONTROL_VERBOSITY_SHIFT)
> #define GUC_LOG_CONTROL_DEFAULT_LOGGING	(1 << 8)
>
>+enum intel_guc_state_capture_event_status {
>+	INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_SUCCESS = 0x0,
>+	INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE = 0x1,
>+};
>+
>+#define INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_MASK      0x000000FF
>+
> #define XE_GUC_TLB_INVAL_TYPE_SHIFT 0
> #define XE_GUC_TLB_INVAL_MODE_SHIFT 8
> /* Flush PPC or SMRO caches along with TLB invalidation request */
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index 0b1266c88a6a..060628dbac8e 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -64,10 +64,17 @@
>
> #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
> #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
>+#define RING_IPEIR(base)			XE_REG((base) + 0x64)
> #define RING_IPEHR(base)			XE_REG((base) + 0x68)
>+#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
>+#define RING_INSTPS(base)			XE_REG((base) + 0x70)
>+
> #define RING_ACTHD(base)			XE_REG((base) + 0x74)
> #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
> #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
>+#define RING_CMD_BUF_CCTL(base)			XE_REG((base) + 0x84)
>+#define IPEIR(base)				XE_REG((base) + 0x88)
>+
> #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
> #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
> #define RING_NOPID(base)			XE_REG((base) + 0x94)
>@@ -111,9 +118,18 @@
> #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
> #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
>
>+#define RING_BBSTATE(base)			XE_REG((base) + 0x110)
> #define RING_BBADDR(base)			XE_REG((base) + 0x140)
> #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>
>+#define CCID(base)				XE_REG((base) + 0x180)
>+#define   CCID_EN				BIT(0)
>+#define   CCID_EXTENDED_STATE_RESTORE		BIT(2)
>+#define   CCID_EXTENDED_STATE_SAVE		BIT(3)
>+#define RING_BB_PER_CTX_PTR(base)		XE_REG((base) + 0x1c0) /* gen8+ */
>+#define RING_INDIRECT_CTX(base)			XE_REG((base) + 0x1c4) /* gen8+ */
>+#define RING_INDIRECT_CTX_OFFSET(base)		XE_REG((base) + 0x1c8) /* gen8+ */
>+
> #define BCS_SWCTRL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
> #define   BCS_SWCTRL_DISABLE_256B		REG_BIT(2)
>
>@@ -129,6 +145,9 @@
> #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
> #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>
>+#define GEN8_RING_PDP_UDW(base, n)		XE_REG((base) + 0x270 + (n) * 8 + 4)
>+#define GEN8_RING_PDP_LDW(base, n)		XE_REG((base) + 0x270 + (n) * 8)
>+
> #define RING_MODE(base)				XE_REG((base) + 0x29c)
> #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 6aaaf1f63c72..2546d58a7130 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -59,6 +59,38 @@
>
> #define XELP_GLOBAL_MOCS(i)			XE_REG(0x4000 + (i) * 4)
> #define XEHP_GLOBAL_MOCS(i)			XE_REG_MCR(0x4000 + (i) * 4)
>+
>+#define ERROR_GEN6				XE_REG(0x40a0)
>+
>+#define DONE_REG				XE_REG(0x40b0)
>+#define GEN8_PRIVATE_PAT_LO			XE_REG(0x40e0)
>+#define GEN8_PRIVATE_PAT_HI			XE_REG(0x40e0 + 4)
>+#define GEN10_PAT_INDEX(index)			XE_REG(0x40e0 + (index) * 4)
>+#define BSD_HWS_PGA_GEN7			XE_REG(0x4180)
>+
>+#define GEN12_CCS_AUX_INV			XE_REG(0x4208)
>+#define GEN12_VD0_AUX_INV			XE_REG(0x4218)
>+#define GEN12_VE0_AUX_INV			XE_REG(0x4238)
>+#define GEN12_BCS0_AUX_INV			XE_REG(0x4248)
>+
>+#define GEN8_RTCR				XE_REG(0x4260)
>+#define GEN8_M1TCR				XE_REG(0x4264)
>+#define GEN8_M2TCR				XE_REG(0x4268)
>+#define GEN8_BTCR				XE_REG(0x426c)
>+#define GEN8_VTCR				XE_REG(0x4270)
>+
>+#define BLT_HWS_PGA_GEN7			XE_REG(0x4280)
>+
>+#define GEN12_VD2_AUX_INV			XE_REG(0x4298)
>+#define GEN12_CCS0_AUX_INV			XE_REG(0x42c8)
>+#define   AUX_INV				REG_BIT(0)
>+
>+#define VEBOX_HWS_PGA_GEN7			XE_REG(0x4380)
>+
>+#define GEN12_AUX_ERR_DBG			XE_REG(0x43f4)
>+
>+#define GEN7_TLB_RD_ADDR			XE_REG(0x4700)
>+
> #define CCS_AUX_INV				XE_REG(0x4208)
>
> #define VD0_AUX_INV				XE_REG(0x4218)
>@@ -73,6 +105,9 @@
> #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
> #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
>
>+#define GEN8_FAULT_TLB_DATA0			XE_REG(0x4b10)
>+#define GEN8_FAULT_TLB_DATA1			XE_REG(0x4b14)
>+
> #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
> #define   TBIMR_FAST_CLIP			REG_BIT(5)
>
>@@ -94,6 +129,8 @@
> #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
> #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>
>+#define XEHPG_INSTDONE_GEOM_SVG			XE_REG_MCR(0x666c)
>+
> #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
> #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>
>@@ -110,6 +147,10 @@
> #define   FLSH_IGNORES_PSD			REG_BIT(10)
> #define   FD_END_COLLECT			REG_BIT(5)
>
>+#define GEN7_SC_INSTDONE			XE_REG(0x7100)
>+#define GEN12_SC_INSTDONE_EXTRA			XE_REG(0x7104)
>+#define GEN12_SC_INSTDONE_EXTRA2		XE_REG(0x7108)
>+
> #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
> #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>
>@@ -298,6 +339,22 @@
>
> #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
>
>+#define GEN12_FAULT_TLB_DATA0			XE_REG(0xceb8)
>+#define XEHP_FAULT_TLB_DATA0			XE_REG_MCR(0xceb8)
>+#define GEN12_FAULT_TLB_DATA1			XE_REG(0xcebc)
>+#define XEHP_FAULT_TLB_DATA1			XE_REG_MCR(0xcebc)
>+#define   FAULT_VA_HIGH_BITS			(0xf << 0)
>+#define   FAULT_GTT_SEL				BIT(4)
>+
>+#define GEN12_RING_FAULT_REG			XE_REG(0xcec4)
>+#define XEHP_RING_FAULT_REG			XE_REG_MCR(0xcec4)
>+#define XELPMP_RING_FAULT_REG			XE_REG(0xcec4)
>+#define   GEN8_RING_FAULT_ENGINE_ID(x)		(((x) >> 12) & 0x7)
>+#define   RING_FAULT_GTTSEL_MASK		BIT(11)
>+#define   RING_FAULT_SRCID(x)			(((x) >> 3) & 0xff)
>+#define   RING_FAULT_FAULT_TYPE(x)		(((x) >> 1) & 0x3)
>+#define   RING_FAULT_VALID			BIT(0)
>+
> #define XEHP_MERT_MOD_CTRL			XE_REG_MCR(0xcf28)
> #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
> #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
>@@ -316,6 +373,13 @@
> #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
> #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>
>+#define GEN12_GAM_DONE				XE_REG(0xcf68)
>+
>+#define GEN7_SAMPLER_INSTDONE			XE_REG(0xe160)
>+#define GEN8_SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
>+#define GEN7_ROW_INSTDONE			XE_REG(0xe164)
>+#define GEN8_ROW_INSTDONE			XE_REG_MCR(0xe164)
>+
> #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
> #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>
>@@ -478,10 +542,16 @@
> #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>
>+#define GEN12_SFC_DONE(n)			XE_REG(0x1cc000 + (n) * 0x1000)
>+
> #define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
> #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
> #define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> #define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
> #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>

- drop any GEN prefixes/suffixes
- only add registers you're actually using


>+/* 32 fences + sign bit for FENCE_REG_NONE */
>+#define XE_MAX_NUM_FENCE_BITS 6
>+#define XE_MAX_NUM_FENCES (2 ^ (XE_MAX_NUM_FENCE_BITS - 1))
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>index c50e7650c09a..15869c2e2a52 100644
>--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>@@ -57,7 +57,6 @@ struct xe_reg_mcr {
> 	struct xe_reg __reg;
> };
>
>-
> /**
>  * XE_REG_OPTION_MASKED - Register is "masked", with upper 16 bits marking the
>  * written bits on the lower 16 bits.
>diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>index 2c214bb9b671..574a5a78739c 100644
>--- a/drivers/gpu/drm/xe/regs/xe_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>@@ -7,6 +7,10 @@
>
> #include "regs/xe_reg_defs.h"
>
>+#define EIR					XE_REG(0x20b0)
>+
>+#define HSW_GTT_CACHE_EN			XE_REG(0x4024)
>+
> #define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
> #define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
> #define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
>diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>index 64c2249a4e40..cdef4dd1ef06 100644
>--- a/drivers/gpu/drm/xe/xe_bo_types.h
>+++ b/drivers/gpu/drm/xe/xe_bo_types.h
>@@ -44,6 +44,8 @@ struct xe_bo {
> 	struct iosys_map vmap;
> 	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
> 	struct ttm_bo_kmap_obj kmap;
>+	/** @ads_map: contents of the GuC ADS */
>+	struct iosys_map ads_map;


that would be very weird.... a map to the ADS inside each bo?? It sounds
like a bad architecture of the feature, but grepping on this patch it
seems this is not used at all

> 	/** @pinned_link: link to present / evicted list of pinned BO */
> 	struct list_head pinned_link;
> #ifdef CONFIG_PROC_FS
>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>index 68abc0b195be..b032d6e2cc3a 100644
>--- a/drivers/gpu/drm/xe/xe_devcoredump.c
>+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>@@ -14,6 +14,7 @@
> #include "xe_force_wake.h"
> #include "xe_gt.h"
> #include "xe_guc_ct.h"
>+#include "xe_guc_capture.h"
> #include "xe_guc_submit.h"
> #include "xe_hw_engine.h"
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
>index c2b004d3f48e..107360edfcd6 100644
>--- a/drivers/gpu/drm/xe/xe_gt_printk.h
>+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>@@ -22,6 +22,9 @@
> #define xe_gt_notice(_gt, _fmt, ...) \
> 	xe_gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
>
>+#define xe_gt_notice_ratelimited(_gt, _fmt, ...) \
>+	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)

if this is really need, it should be a standalone patch.

>+
> #define xe_gt_info(_gt, _fmt, ...) \
> 	xe_gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>index a8d7f272c30a..696e41aa5596 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>@@ -96,11 +96,13 @@ xe_gt_topology_init(struct xe_gt *gt)
> 	drm_WARN_ON(&xe->drm, num_geometry_regs > 3);
> 	drm_WARN_ON(&xe->drm, num_compute_regs > 3);
>
>+	gt->fuse_topo.g_dss_num_max = num_geometry_regs;

wat?  dss_num_max has nothing to do with how many registers we use.

> 	load_dss_mask(gt, gt->fuse_topo.g_dss_mask,
> 		      num_geometry_regs,
> 		      XELP_GT_GEOMETRY_DSS_ENABLE,
> 		      XE2_GT_GEOMETRY_DSS_1,
> 		      XE2_GT_GEOMETRY_DSS_2);
>+	gt->fuse_topo.c_dss_num_max = num_compute_regs;
> 	load_dss_mask(gt, gt->fuse_topo.c_dss_mask, num_compute_regs,
> 		      XEHP_GT_COMPUTE_DSS_ENABLE,
> 		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index f74684660475..4c0540abfecb 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -328,6 +328,12 @@ struct xe_gt {
>
> 		/** @eu_mask_per_dss: EU mask per DSS*/
> 		xe_eu_mask_t eu_mask_per_dss;
>+		/** @g_dss_num_max: count of dual-subslices usable by geometry */
>+		u8 g_dss_num_max;
>+
>+		/** @c_dss_num_max: count of dual-subslices usable by compute */
>+		u8 c_dss_num_max;


not really needed. check calc_topo_query_size() and xe_query.c in
general on how to derive the info you need.

Lucas De Marchi

>diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>new file mode 100644
>index 000000000000..ace5115cae6c
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>@@ -0,0 +1,1574 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2021-2022 Intel Corporation
>+ */
>+
>+#include <linux/types.h>
>+
>+#include <drm/drm_print.h>
>+
>+#include "abi/guc_actions_abi.h"
>+#include "regs/xe_regs.h"
>+#include "regs/xe_engine_regs.h"
>+#include "regs/xe_gt_regs.h"
>+#include "regs/xe_guc_regs.h"
>+
>+#include "xe_guc_capture_fwif.h"
>+
>+#include "xe_bo.h"
>+#include "xe_device.h"
>+#include "xe_exec_queue_types.h"
>+#include "xe_hw_engine_types.h"
>+#include "xe_gt.h"
>+#include "xe_gt_printk.h"
>+#include "xe_guc.h"
>+#include "xe_guc_capture.h"
>+#include "xe_guc_ct.h"
>+
>+#include "xe_guc_log.h"
>+#include "xe_gt_mcr.h"
>+#include "xe_guc_submit.h"
>+#include "xe_macros.h"
>+#include "xe_map.h"


here you should add kernel-doc on what this feature is about, how it's used etc.


I think this is enough feedback for now


Lucas De Marchi
