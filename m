Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6576C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 22:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A07410E0E5;
	Fri, 26 May 2023 22:52:26 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC9110E0E5
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 22:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685141544; x=1716677544;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sHevK0gisyk/3MCLtvifMMSmBqFxWBD1Thm41nOka0M=;
 b=TZXdHkOB6cvkSyyypy+AtC3Ls/reC+6MugnVlBMuUQlTVePq6YFYLOu+
 bAARmVJwud7VwASf7abuvxUtxdrwRZ619p4E7or4wrsh/ZaRQcKInoQMt
 UHfMkRlJ53ZJX+wLe1fzU4N02+DPkOPXuiKQViFdxxRPzMLTB7aB18qcP
 SVMBb2b+vccummShMTQ4l0/KM2rZpNJ3b6uHfwf11Bw0ZDClOcULMxmOZ
 K2tQBldnEffXPc31clL7UrmPrsVO+skk+DdRCwhOMhFaF69/L5i8rM86o
 ZAJS8cgKn70N1tFGP04qu1dHgdTZ9pL8s8ZVIwbLWHE6N0C+QB9Qticud Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382575901"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="382575901"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 15:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="705372231"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="705372231"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 26 May 2023 15:52:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 15:52:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 15:52:20 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 15:52:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUTOdzueXzJ5RHfUmn1NgOwndRCtKgu0KxbWxgq7HqRfdAe2tG+FLWWojhAh4SAcvVxtF/8oVSUem6wvJlXntLDCndgconuR+paPGTuglxRIclOhlIp+akJPHeDNLhJXEjThM6rHv01/n6lpHECxqfvQyMkXDleVXWFT4Jnco/7+x1eXY7PzyqTO+r7aJDmDfC0TJRjEKNYPncS/spy5NEFifRmi5g2ZQ1AepAs/ozXydQex6PR76NMCDd8NgCytJC5pU0jenCP0Cy7mDK6fy4tcvAP8ryl+lg+UJiYQCJ9YVEVJmr1DU7f6j71XuFc9OmOomHA7IiyhbsqsN8p1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFc4BIpkwMEcTHzQbpstN7ZNhO0hZj63igrUyEHAXT4=;
 b=eg0Sv1eayqBVYFQkrbTnK2RjwA0omR/byRLR81vtD/HC743JtNzQX2eRz40NOSipAavCBIzLIFN3qZ1Sbz2qjo/mS1I01rPfpmx5/BHKSf8dKBZG8Xy/ekRnSDqtHHod3IxDnZQ+aIRfYakMg7jFtLCwrPa0O01ftP73s73+4/XuSb9a947yBJvpgoxkv9itXZJeHPDqFifFfUM0Ih2aYw72Re0EWkQzYz+LZghmDhNNjASVI/hSCfsqA32+kQ3aZwuN+c1a1aUS5I6BScuG2B6fPjiJWw6dxviMvcGj5UPAdleWBokzcJGJ8gjayiR0jrohgD8c9JVN6nhlgutGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Fri, 26 May
 2023 22:52:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 22:52:18 +0000
Date: Fri, 26 May 2023 15:52:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <curv6g7uei6wkpfgbhaox25eozgqh7hmkghgvfsjznzmclr4ax@oxrvqdrwvear>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-31-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230519231827.3572452-31-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0083.namprd05.prod.outlook.com
 (2603:10b6:a03:332::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4829:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c936d94-29f1-4178-c814-08db5e3bdb60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W4+OEfwCS24FCIGZWQEsOwNDrtCK6cB1IWjLt30HuvjLa/oTXMq2+69k5cAXau9JmieofLDzlVd7sT5Ts/ZwLKplNLSZi3vAfJvRC8mR5AXHtkXcCFhz6YcPh7dL3VHvHRZjVZMz8gh4I4UTbbTj7FqKbRAqSSqEitstAxPq1h6b291q29/BWb8w9KSdTfp/upsq7zRaMgBBE306zj3YOwFFNbFdbOi+QheRG0UhFZ5IkwWcQSmcw3cAWJMvH1d+6JlJiqnCC1bodxcI2Gw8H9Dq+vliqCQHslwItovwh9hwXryxLYBhIiNJrE+bkEuSYvPpFQc6iHyZa7sX1i1VoI/j7DumFwgjB/EMi/p75bMm5ld6FfjsvjumgON4CUAVaXcmvGJ4Py+8BmrBvm7Z1qwpp/cpqkV25QfmO2LJUFWMidAifMWPW3VIHsogYOYDmOWA9yvJLcJnhCmEx1aefpp5brG1leXW2FOV3nukEe3V19DVwskEZY89TIV9KnfWMZFcqSECs4M15smqZqcP5Ndge6B+r67s9tfKQmIVoPNtlqP+2f5P8cVVq1xqJVcKwm7mgHLlK6B31H5CUJ41tUSJ0WHimGfTxKxtp17RsWelYN7Yesnlga75sRNb4ria
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(83380400001)(2906002)(186003)(33716001)(86362001)(38100700002)(82960400001)(8676002)(6862004)(8936002)(41300700001)(4326008)(5660300002)(66556008)(66946007)(6636002)(66476007)(478600001)(316002)(6486002)(9686003)(6506007)(6512007)(26005)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zUbsX7xUI5TbqBnHXvdUUdOPYkFtEpHh15e8318UU/ncl21lul6ryyFSVxW0?=
 =?us-ascii?Q?EOMNOWFxHLrvVFezwnHMIjSK7hsNu9+ACO3Sh/chLvZrQonf2Gb8PEEhQQIm?=
 =?us-ascii?Q?9nP+itf+xTGt79y6tNu+DSF854kJUvM8bOgrXZqEuWHijU7WZ59quJEsd1dH?=
 =?us-ascii?Q?kK69N5IoXQ71BuzZQGCajmhkUt2TJAILKaM/izYlA+OcV3zyuSUDGzh7BE5C?=
 =?us-ascii?Q?JhNZjrUaYL2TA1i2nlWT3nk0ZDMQphAcwVTa5YmU+Ac9uVzO+sc7Qn6inlgY?=
 =?us-ascii?Q?38bn/9geAZ8/kPHNNFJ9/L+dMaQDiP/L3y7DqKQl9kpOA8u+/1Y/MtvjmuvB?=
 =?us-ascii?Q?sL2bQs6hFODgYlmJmvtSQ0jD8MJ18BxAu+FmJdKqz8zMI/TWeiRo/30JK92n?=
 =?us-ascii?Q?+3Xdfu0rjeLz868jDElq+dWfQSglx7pKRqALfeH03bLKc6LVs2P3SHfZHD84?=
 =?us-ascii?Q?qsXPkn+cEd3nxdr3Dk4S6dU4cAPZV0j3F1jgPCO2GydOjYIlEBduOq02eAHt?=
 =?us-ascii?Q?sjq7nXuSQAZck3qamxv0ziTevWgBtV8wJHv0m+T5ljoYanK1RM7XK29YIQJm?=
 =?us-ascii?Q?+qtPrbHI5SHSb0WY2YScPNTfsQva1gGfRPp4Ot0Oj7WIycb9r8IMwMnR+Jbu?=
 =?us-ascii?Q?+j4UxEXdvM+24l6sSxk+secnwuEvM/Bw5rKKJRFeLKSsEZZn1aAtNrw/Lqlg?=
 =?us-ascii?Q?vjJaFrG91LsCRwHvCVuRiVpOfWI6K54BbBI8T0MZQycZvI7uHKNR3PFjYa7O?=
 =?us-ascii?Q?9XwCvX0R22zhSDZZX9/bAQ5cNdFpmW9so7FlD+Hygmm8h0H8sPxUOP/PNQ6+?=
 =?us-ascii?Q?Ow4v0qFTKJkcRoRiaKhqHhmorF/HPavB5NTi5IfofrZn5JflCXbqjmc73FZ8?=
 =?us-ascii?Q?fp7NzXkulbG+BEGcxkQe8KNgqOCrgpVsvD0YrEDv+WNgAOXOsQl7iAyvfEn1?=
 =?us-ascii?Q?rc3fwDwErbqLHteMewWiPpSml3MElYzOul5ARJO6aA9y0aF7g9cqHYqz2AmV?=
 =?us-ascii?Q?uAIg6Xct9Z28EkPVxrENZhyk5G0Jq//srKFbnagV0osSyFuKAt9TitccX9xd?=
 =?us-ascii?Q?N65EgrwXgG55stLi3bzW8ArGknlX6YDApsFBUDmQt52qcEZqYqXTxPiyxHCD?=
 =?us-ascii?Q?3MavPGfAqc8m/bOvhdtRaMa9OvTfAUhx1sXXeQXlI8VK5FzGLPjauT8/4hIt?=
 =?us-ascii?Q?NSKWwQyxVIq+DYsdXqFOU7ESfbnNn8C4PFCpTox4wfX8wYlQDosQdKAs0M2g?=
 =?us-ascii?Q?kEcOxQW1rFYBQnl5wpk+HffDe2nPKdxvPHx2qjc/JMlEoVV6b6mMfNSJM1ko?=
 =?us-ascii?Q?9GXVp8WBrGZ+pknb4aqxgKkVcSPaEqxsLnPobfz4/xDmlR4rfb538jGznKHZ?=
 =?us-ascii?Q?BkVpaJ4FBdFXglEKV1fdHsCd/TUSHbp5GJ/MLIf5ZQYtByl0etW2TkLx27fP?=
 =?us-ascii?Q?DaZrPPfc60cJoXuU3aRSHQM0qfpeapDrU5ijmGNJZfiU82DoGPv5MR/QOHqm?=
 =?us-ascii?Q?+/BZorAYrwDzbEBZFDsdpvdW4IV5dZpOf0STr58J5GTSATJj8fKe2vLznmtv?=
 =?us-ascii?Q?DAxQI1n3r5GJiq4+86Sij33QqZy6fAnFSDHfUWbLhNgjXmcX2WznuD2/c1hS?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c936d94-29f1-4178-c814-08db5e3bdb60
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 22:52:18.2364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8cOdANjDrEgMlc9/0OGvosFrQYVNsDQQlhzRdXb/YyjuNOOHNyI1NdP6gVnKR4aB6x7okGoeNYcorVpbnMvNNLRIq91H8WMJSDxBxmfNHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 30/30] drm/xe: Add kerneldoc description
 of multi-tile devices
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

On Fri, May 19, 2023 at 04:18:27PM -0700, Matt Roper wrote:
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> Documentation/gpu/xe/index.rst   |  1 +
> Documentation/gpu/xe/xe_tile.rst | 14 ++++++++
> drivers/gpu/drm/xe/xe_tile.c     | 57 ++++++++++++++++++++++++++++++++
> 3 files changed, 72 insertions(+)
> create mode 100644 Documentation/gpu/xe/xe_tile.rst
>
>diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
>index 2fddf9ed251e..5c4d6bb370f3 100644
>--- a/Documentation/gpu/xe/index.rst
>+++ b/Documentation/gpu/xe/index.rst
>@@ -21,3 +21,4 @@ DG2, etc is provided to prototype the driver.
>    xe_wa
>    xe_rtp
>    xe_firmware
>+   xe_tile
>diff --git a/Documentation/gpu/xe/xe_tile.rst b/Documentation/gpu/xe/xe_tile.rst
>new file mode 100644
>index 000000000000..c33f68dd95b6
>--- /dev/null
>+++ b/Documentation/gpu/xe/xe_tile.rst
>@@ -0,0 +1,14 @@
>+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>+
>+==================
>+Multi-tile Devices
>+==================
>+
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_tile.c
>+   :doc: Multi-tile Design
>+
>+Internal API
>+============
>+
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_tile.c
>+   :internal:
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 908eec5c17d9..d2654b78cfb4 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -12,6 +12,63 @@
> #include "xe_tile.h"
> #include "xe_ttm_vram_mgr.h"
>
>+/**
>+ * DOC: Multi-tile Design
>+ *
>+ * Different vendors use the term "tile" a bit differently, but in the Intel
>+ * world, a 'tile' is pretty close to what most people would think of as being
>+ * a complete GPU.  When multiple GPUs are placed behind a single PCI device,
>+ * that's what is referred to as a "multi-tile device."  In such cases, pretty
>+ * much all hardware is replicated per-tile, although certain responsibilities
>+ * like PCI communication, reporting of interrupts to the OS, etc. are handled
>+ * solely by the "root tile."  A multi-tile platform takes care of tying the

". instead of ."

>+ * tiles together in a way such that interrupt notifications from remote tiles
>+ * are forwarded to the root tile, the per-tile vram is combined into a single
>+ * address space, etc.
>+ *
>+ * In contrast, a "GT" (which officially stands for "Graphics Technology") is
>+ * the subset of a GPU/tile that is responsible for implementing graphics
>+ * and/or media operations.  The GT is where a lot of the driver implementation
>+ * happens since it's where the hardware engines, the execution units, and the
>+ * GuC all reside.
>+ *
>+ * Historically most Intel devices were single-tile devices that contained a
>+ * single GT.  PVC is an example of an Intel platform built on a multi-tile
>+ * design (i.e., multiple GPUs behind a single PCI device); each PVC tile only
>+ * has a single GT.  In contrast, platforms like MTL that have separate chips
>+ * for render and media IP are still only a single logical GPU, but the
>+ * graphics and media IP blocks are exposed each exposed as a separate GT

too many exposed words here

other than that,

	
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>+ * within that single GPU.  This is important from a software perspective
>+ * because multi-GT platforms like MTL only replicate a subset of the GPU
>+ * hardware and behave differently than multi-tile platforms like PVC where
>+ * nearly everything is replicated.
>+ *
>+ * Per-tile functionality (shared by all GTs within the tile):
>+ *  - Complete 4MB MMIO space (containing SGunit/SoC registers, GT
>+ *    registers, display registers, etc.)
>+ *  - Global GTT
>+ *  - VRAM (if discrete)
>+ *  - Interrupt flows
>+ *  - Migration context
>+ *  - kernel batchbuffer pool
>+ *  - Primary GT
>+ *  - Media GT (if media version >= 13)
>+ *
>+ * Per-GT functionality:
>+ *  - GuC
>+ *  - Hardware engines
>+ *  - Programmable hardware units (subslices, EUs)
>+ *  - GSI subset of registers (multiple copies of these registers reside
>+ *    within the complete MMIO space provided by the tile, but at different
>+ *    offsets --- 0 for render, 0x380000 for media)
>+ *  - Multicast register steering
>+ *  - TLBs to cache page table translations
>+ *  - Reset capability
>+ *  - Low-level power management (e.g., C6)
>+ *  - Clock frequency
>+ *  - MOCS and PAT programming
>+ */
>+
> /**
>  * xe_tile_alloc - Perform per-tile memory allocation
>  * @tile: Tile to perform allocations for
>-- 
>2.40.0
>
