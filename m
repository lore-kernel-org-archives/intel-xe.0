Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F069BC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 22:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BD810E0F8;
	Thu, 14 Dec 2023 22:08:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04B910E0F8
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 22:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702591697; x=1734127697;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=46B6cid5idgkuqFd1l9Z1b1brceuZ6isF49jWCYQi8E=;
 b=EsKCRpns97S4rBi1ldPgyNwC1cIxy1Rqjv66uYsRnvu+Y0sY7q8K9nts
 Z2DwfWTYAliN/LSBxOXkhPcd816kGsWcaEYdfJqut98qYMk95Ixev5u3E
 v/YBhJHVt2KfcpOEjRmZygIkZVAY33ILghZ5EDM7miLYp0ruN7Mn/J0EE
 EnuJ8c3Y55oVr3X/bquicSleMFMZTSqiEhvm9qy+qWKX2wC7UgBG7de/z
 0bGhQ/2PBu7J/SYELq+Uilqb8N1SMKRMHIv2UEv1K9aXMvCk4EdMIqiDe
 radlrEnnAijCKu08e0LhLxha+XGiAxgky9YOdXieyD/34vSmj+j1fqUlM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="399031839"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="399031839"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 14:08:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="750697952"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="750697952"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 14:08:17 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 14:08:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 14:08:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 14:08:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOHbiLUxLEl2+bbg5fd18qhm767HSvZur+c29YCwKv8Fh+8sm6yLpO33Z72RQHZcxO8Yp0bWdcSebOXGiROWeEdzpFwMXZt+AMkNhZq2on+x/Y9HsZZsCY6/KDG/B3V27/Mo1o4nIyRCY6vwGsDIR3lwgmVh4Od7OGdF6h0aFpiW/CJOp9DRepGH6MONg5dVF/Ydx8zj50eWY5MbxcCkxJzFw+aPId69zIRo6mCrCX5QVxwFQAMdlAwmsbuAx9Mf66ACZcNKkKsoJPGezNG9NsQ7U7j0dxKrJa2rUwQgo9CJE8vc3KLsjm2Oslll7WKK8bVmv/zfI1PgNp+lqAsLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aVl7iYhvrg83A5kAgLUE+n0IN9gc6F48S0v4p+yi4I=;
 b=fK0OxkdsTPaXl/vwSy4/heG0vIkttcnWVoYCB6NUKDvYNu8SND8cfY7BpLTAcQF8UCZSWgApvHvjJgqe8h5ilETyY4EBye2n08yp4ojNMrl3xFDLyELUd5sny5dau2UT3seoQ/1nYchpWG+/92H+kxNA+1qW2nquSPG+yIwz12cBNw3BF1Rqs3uEc3tULovlefNplq1LQ4lJATBKbvJ33xt+mlAoY32vNL2GfYKGcbzhAdMkX+cIqH5/5LEUO+uF8YVFAmVCsXNUZTIb8h5UjCcyqM5jMzAW57uR0rLJsC7VOiYWYzbIAGkqL6hdqnShrjLIX1SrhEL3KZYF+sbQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 22:08:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 22:08:09 +0000
Date: Thu, 14 Dec 2023 16:08:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 4/8] drm/xe: Move engine base offsets to engine register
 header
Message-ID: <erqtupimibq5rxeqr2k3o642xpjawy3r4wzmlxppxqfdcgpgw2@xpfltkcdex7o>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
 <20231214184659.2249559-14-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231214184659.2249559-14-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: fd448d65-ae5d-42c1-807a-08dbfcf12829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cIfKI4GZe3Qd4vtSRuFJM31Z7B6CN70MEtttcZOQgSxuQz06krQewTtrqs8l4MwJR/vcN9dIRFW5yqXzZPoPCYfnYVn8Jz4d5Cuc5+RdcVgTcze55P6ysrd8sVFL+TVbVhF2pT/9PWqS1WQGxiyIn9vyzCU0Zn9wEhEi3QCnBTe+bZBJy9FFKA7jYUj+XRBEfGH43HNTaWF6yt1v5PzBL4jFYLrF2egYKuAY/oFYz2qwQnm9Q4yTKvpDX/pk/CZ3qphwmPm6niT/4h61swuLIKuGt+1DqQqpfxGyKccQLuYtHRix4P0tN/J68zx2g2WDU3EjRqKxFj8r9RFLz1bplfuO3KCobFIM/RYwLpTHc/X/+73HydYxg5B4YWAYuA6MSead775i0AnWvkgizyyNCP+2mOTutJy5kNMOXwsJUq78JeF2jPCtjMWCmDRak6ad7cOvZ0C6LL4W8kQgqKJsu5Lp0QUPexSfJI77LIs5RO01VvQyQ+PTTk72mLWxtcmtYC3mkPfS+8nsm+aYLX2vpfLcRi9w9tJZ75ZmNPXBPvfLBT8UfHVk3UpYh1SrUWmU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(86362001)(82960400001)(6512007)(9686003)(26005)(6506007)(66946007)(478600001)(6666004)(6486002)(66476007)(66556008)(8676002)(316002)(6636002)(83380400001)(6862004)(4326008)(8936002)(41300700001)(33716001)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gTefTdVi+HMPSP12Mld8GZsWpZvutb9l/DnVG2mVb6A9pONTlK/hQKzh5wFu?=
 =?us-ascii?Q?cO5vVyLk/kfPCVmYzBVe5U3Hcn6SnWwwpBzwK/I5nz0G5pCKbKeitj5XXCQW?=
 =?us-ascii?Q?HvG5GIiGJEcVqssTfKdFZh34XmcuW1p9lVRcdb+GlBte3ak/WBlM7WHBUNJM?=
 =?us-ascii?Q?g8f+WlTXa3Sl/zGVJSXrKw5BbQUWNj9AgCkUVUQOn894WwNVDGnmB3dDmOje?=
 =?us-ascii?Q?V/sIqRMbB6ri4rwoVySw/Pelhel6iCgZFZjtcKRNH1ZaR6+BnWOdPNWpbF/a?=
 =?us-ascii?Q?6rE0f7bUsCJFgm0IjvGCMmP72Oht/2gZzOIryO2o5bnK+RSOd52xPFNS74Mh?=
 =?us-ascii?Q?uZQW7FVm70Owvhfy2VHNkThs7mqjhl0YrkZpScCI7Ivasfsc+Jzon7uLhtOP?=
 =?us-ascii?Q?xy4RkmgdJ6pIqUEO2SKJt+YOlFDj5UYL+rGJsL9dHYh9/dUdKsNyed9MK03y?=
 =?us-ascii?Q?Is768/smV9zvX9EkDozFT2FRcSz8u9qHmFFiQcv3ZGrcraS/HRMdjrEcR80F?=
 =?us-ascii?Q?pfdOdnEi2ONoPeOfxFoksZhS36/G5bCv/sOGHgpxDJ9Tns6QmgQQdF2Mu+1m?=
 =?us-ascii?Q?Wq/k1ryaxyPRe4+vKC9C4I76WSe9ghSlDJR7ih4qFtVACqbXPo4nKT/L87FH?=
 =?us-ascii?Q?0v7BFW/CHckgxaHxx+uvvI0QWj5BDd5c8e+ZOuM5EV4iK+tqpTcvTDGGqNsg?=
 =?us-ascii?Q?4GeRKBLb1kKIhU3xQF3HUDeR587BtTsaFZh+4prKfai34X3DIvYhKNEK0NMI?=
 =?us-ascii?Q?oZOSrs+e3G2zwg9RPbSMRV1IgS124B2S2o2W6q0yEGiNjNphB0xBQ4c/bLKt?=
 =?us-ascii?Q?YO4IBVe/aZyXI2tY9PLhGMvejp1U/c+tM/sJ+CW6GPeI5lVyCYSyPYYUGQdk?=
 =?us-ascii?Q?bAC1ubggzkD2k46ouuPJ0ewzXIldE/gKCtXe4+MNi1VeEG9iQ5HZ0OV+OMWo?=
 =?us-ascii?Q?84U0dISGTIUOwyMF922p852cbc2Z2LLjITrhfDuZhv96wyJwl1MkeVUVDuQE?=
 =?us-ascii?Q?SpEQJdC9ZvtYY/A4HABbpDjoene9xDPMuESJszauGYixFdNE/HuR7BrK9vLV?=
 =?us-ascii?Q?7Fo8l3TJOYnvYsFtVrjYRgdUlGTJ4v3ziwqrAuKz1qwpL41yI7DEblr1u3VP?=
 =?us-ascii?Q?sNE6lXaWTdFOhwTWCnrwJUHEJRbZVVWM4T7Suz9F8sGFMh722ToSguOLkhFT?=
 =?us-ascii?Q?ft+9qFizjcc4N13aJQl4Oc+tHCyK+xU+HAfwfMMQZtN3QWNha6/o/yyrWAL6?=
 =?us-ascii?Q?+TT+yqhY6JSde6xh6H8A9WJX3YQzRyOE7PXaJVRVp0u6JSN9h9BJxN+2KkaX?=
 =?us-ascii?Q?O8OtB/EdefRo+1VfQL0CuxrMKMqPsKeRcBtmhTOiqvJ0xtP6wtvjHTWXyktz?=
 =?us-ascii?Q?jCVa0AQc+zafAKYh1zUGTjVq8lbzw9qIkljX9sZoX6Tv1Kx9PiSeXvIn1BN9?=
 =?us-ascii?Q?GlER+i65xWLvQgyWABg0OAXP2SyG19SK29q1bi+gHKVJG+momjcRxpq5urlA?=
 =?us-ascii?Q?1wKzePdjAunPOtrFUBN9LYho1vDRf2HR+mpNdWL08F7rv1V+PRZIEfidELO+?=
 =?us-ascii?Q?NNDRQja4nPSN6MnL6bVg2YuNuEDJ8meV0zUjPoEBVQVZ6Ag3p6kyXYexyG6T?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd448d65-ae5d-42c1-807a-08dbfcf12829
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 22:08:09.5769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ik6B6CCGv9UakjDRPl5mmtBepprdD2rR3pT96AO73ofrt01ired+uP5NeZd6n0cNysxqH9Ysa1K2hh3c9le1H2kFDQ4kM79zeabnNLVfJR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
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

On Thu, Dec 14, 2023 at 10:47:04AM -0800, Matt Roper wrote:
>These offsets are primarily used as parameters for the engine register
>definitions, so it makes more sense to define them in the engine header
>rather than the general register header.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h | 33 ++++++++++++++++++++++++
> drivers/gpu/drm/xe/regs/xe_regs.h        | 28 --------------------
> 2 files changed, 33 insertions(+), 28 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index 7f82bef3a0db..5592774fc690 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -10,6 +10,39 @@
>
> #include "regs/xe_reg_defs.h"
>
>+/*
>+ * These *_BASE values represent the MMIO offset where each hardware engine's
>+ * registers start.  The other definitions in this header are parameterized
>+ * macros that will take one of these values as a parameter.
>+ */
>+#define RENDER_RING_BASE			0x02000
>+#define BSD_RING_BASE				0x1c0000
>+#define BSD2_RING_BASE				0x1c4000
>+#define BSD3_RING_BASE				0x1d0000
>+#define BSD4_RING_BASE				0x1d4000
>+#define XEHP_BSD5_RING_BASE			0x1e0000
>+#define XEHP_BSD6_RING_BASE			0x1e4000
>+#define XEHP_BSD7_RING_BASE			0x1f0000
>+#define XEHP_BSD8_RING_BASE			0x1f4000
>+#define VEBOX_RING_BASE				0x1c8000
>+#define VEBOX2_RING_BASE			0x1d8000
>+#define XEHP_VEBOX3_RING_BASE			0x1e8000
>+#define XEHP_VEBOX4_RING_BASE			0x1f8000
>+#define COMPUTE0_RING_BASE			0x1a000
>+#define COMPUTE1_RING_BASE			0x1c000
>+#define COMPUTE2_RING_BASE			0x1e000
>+#define COMPUTE3_RING_BASE			0x26000
>+#define BLT_RING_BASE				0x22000
>+#define XEHPC_BCS1_RING_BASE			0x3e0000
>+#define XEHPC_BCS2_RING_BASE			0x3e2000
>+#define XEHPC_BCS3_RING_BASE			0x3e4000
>+#define XEHPC_BCS4_RING_BASE			0x3e6000
>+#define XEHPC_BCS5_RING_BASE			0x3e8000
>+#define XEHPC_BCS6_RING_BASE			0x3ea000
>+#define XEHPC_BCS7_RING_BASE			0x3ec000
>+#define XEHPC_BCS8_RING_BASE			0x3ee000
>+#define GSCCS_RING_BASE				0x11a000
>+
> #define RING_TAIL(base)				XE_REG((base) + 0x30)
>
> #define RING_HEAD(base)				XE_REG((base) + 0x34)
>diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>index 4b427ec8cbff..b7d3b42ec003 100644
>--- a/drivers/gpu/drm/xe/regs/xe_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>@@ -7,38 +7,10 @@
>
> #include "regs/xe_reg_defs.h"
>
>-#define RENDER_RING_BASE			0x02000
>-#define BSD_RING_BASE				0x1c0000
>-#define BSD2_RING_BASE				0x1c4000
>-#define BSD3_RING_BASE				0x1d0000
>-#define BSD4_RING_BASE				0x1d4000
>-#define XEHP_BSD5_RING_BASE			0x1e0000
>-#define XEHP_BSD6_RING_BASE			0x1e4000
>-#define XEHP_BSD7_RING_BASE			0x1f0000
>-#define XEHP_BSD8_RING_BASE			0x1f4000
>-#define VEBOX_RING_BASE				0x1c8000
>-#define VEBOX2_RING_BASE			0x1d8000
>-#define XEHP_VEBOX3_RING_BASE			0x1e8000
>-#define XEHP_VEBOX4_RING_BASE			0x1f8000
>-#define COMPUTE0_RING_BASE			0x1a000
>-#define COMPUTE1_RING_BASE			0x1c000
>-#define COMPUTE2_RING_BASE			0x1e000
>-#define COMPUTE3_RING_BASE			0x26000
>-#define BLT_RING_BASE				0x22000
>-#define XEHPC_BCS1_RING_BASE			0x3e0000
>-#define XEHPC_BCS2_RING_BASE			0x3e2000
>-#define XEHPC_BCS3_RING_BASE			0x3e4000
>-#define XEHPC_BCS4_RING_BASE			0x3e6000
>-#define XEHPC_BCS5_RING_BASE			0x3e8000
>-#define XEHPC_BCS6_RING_BASE			0x3ea000
>-#define XEHPC_BCS7_RING_BASE			0x3ec000
>-#define XEHPC_BCS8_RING_BASE			0x3ee000
>-
> #define DG1_GSC_HECI2_BASE			0x00259000
> #define PVC_GSC_HECI2_BASE			0x00285000
> #define DG2_GSC_HECI2_BASE			0x00374000
>
>-#define GSCCS_RING_BASE				0x11a000
> #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
> #define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
> #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)

humn... these bit definitions seem misplaced, but it's unrelated to this
patch, so:


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>-- 
>2.43.0
>
