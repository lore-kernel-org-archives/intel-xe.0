Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4659BC7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 18:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A4510E906;
	Wed, 12 Apr 2023 18:16:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4277210E906
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681323389; x=1712859389;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CGS2qlLVW2PIzvD8OUkvn0iP4Y9I7Vv05iVO0HiQ0o8=;
 b=XgzFFuB0w+2KKHvBHVDXQ7hhgX16oxdlVdFgTpPKxxwVHqpbI+0B4KhJ
 tTi6Nkh04o8ljaIaQa6Yh8rAPzlrQeYHkB9E6xRKHVz87u8WO5E5IM09m
 T7caxMIpjdpw750c4W7/s2blDbTXKgLwRqtQYOjZCZUSuMixY1cZ2R5a1
 dMetW9ExjaWAu2RoyfaCZcMfMZhsIXZBtfV0vyGl/z6BwgAAs3K1Ox77Q
 N4PM2+i6BgV/0wcrRrLAs4U3as/UE1wD5sDe38Mh11CRB1W2i70gsvLXf
 z5z8s1wTDgp86gvE9ZzPTeVJJfTwofIkHf63jwxHs4c731lonYUpkq/7h g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346662710"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="346662710"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 11:16:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="813086533"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="813086533"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 12 Apr 2023 11:16:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 11:16:28 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 11:16:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 12 Apr 2023 11:16:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 12 Apr 2023 11:16:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvXMnHJBnJSsMI9F3RRV/NqrM9maHEiX+/wpueoPt6eHgv7vNmIl/mIs3R/Wj8o05t/bBCEx4tv3C7CDmJxZHNf+T/H6VbyNpO4Syo/LKXbJJrriTJFpuJIrAz4cK8YxE3EvEAbKLA8TLTGpFMh8cWY3HTZawud2E1YHUet0k/nqI0tDAXcr5HYlMI+QhUR0HdWptLfLl4eMpTGtX0WxdHVNx5hRXlULOcpOe9MEzWzbLO6zrB0U1aArqtjF8VJz37/bm6LU3Sft/XzmWxQek/OnvSHAUQZaSVSqu9kJExCYPvNXijKlkmKGtKcH5dcoG5t8mo5UJdNnZRTyb42GUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8f6ifp1b2x9wrJMX/Ly2i/mzxD1XsS8ApVR3jiusnhE=;
 b=G6X4DIANPZAKD5ktVa+zLs00HQTBMtsY/HQROVZ1AMcpg/n5OlAtIh+ye/QkdJRDEKR3QLVwp1Bn6aoiWKZ9q3VOYFDXXgVGVGRmLtK9knJv0acZmT6hofaG4PQAsISd0j4k8KvD7F/n9eoX/yHqtYodDJpOrR03DCfd5L0S6YW4PD0VncuhBRGmcLTyZrEz3j8kBaeeW6P9+j6uUsY/N8RUXavo+HR55I8Az6hNHQTbA1w7rtoiJw+uToT5Ij0i0fj9p8Nv3b7aYWWSiIWFNFDSQi1mSpC8sith63Bq6/Nj+DyucVvxO5byKvmAnu9YygH+KNn9lZWlK8iCa9eclQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6434.namprd11.prod.outlook.com (2603:10b6:208:3ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Wed, 12 Apr
 2023 18:16:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 18:16:24 +0000
Date: Wed, 12 Apr 2023 11:16:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230412181622.ulh6apdxumv3mxfy@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230412142006.877109-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b93d09-aca5-4cab-aa8d-08db3b82067c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gk+xklBxVzv1JyJQk1SryUft4ysy4C64weO1EjBr0ykjJfHVyFTds4YrRqwNTwVZunWPDVVTHu29gfQ09TapdPHxqtiO1wELIEjfLW5C/pBWPqweAwIsdE5QTsMt5qx/p+g2XWbDRi5xxDL/SbVsaYzfTYIstRgkoMkgVWNfpolOuLFRxWM/8+Jv6h6O6Iz6Rsv/4JEPPfTOxze4LRhLBiecyUwecABstVFZWjNhaxZ4akGssm3mdG25RiAx7KfVKl17RCzmjjr3PpAqA4pEa8EtNjO0f35OdGhQR8UTn2RusleBVVdlFnMgYv2FUPtTr+M9hm8dQdbPkb24wcacO7HaYwId7eO/MSPkD51xbRsY9oxBEjPH09fD/vgN0pDOtbjUhE3AvT2n3aaBJIJew6is2+mixtC7Uf83sV7paacjW6uxe2yPjZzN2mGAqtGzoycn/fNkOrvV8YHoP01kOTAAdglr6D9yqLmQrsv4eDFml38ZQIl2KwaO+AlJ4Vdn0WrTcFhCcUco020S0u3DydnjCW+D0c0D4Rfxs96OlFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199021)(1076003)(82960400001)(9686003)(6512007)(6506007)(6862004)(4326008)(6486002)(5660300002)(86362001)(8676002)(36756003)(8936002)(316002)(41300700001)(66476007)(478600001)(66556008)(66946007)(6636002)(2906002)(966005)(38100700002)(83380400001)(26005)(107886003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BJXWF56MqXbe+JLlW0aCB5iW33FrgRgLcvDc2dSY7Q3s7uoku7nZAqMq3uWt?=
 =?us-ascii?Q?sSRPQm32XLjDLx3zTQUh6DHXN2Y2M6brcZ6JAs/1OUKp0SvUrelma4hTEN/n?=
 =?us-ascii?Q?JPRNZjqHut2Yx8IO2OV76ZrDQHkMieIYtVTpg8piC80dUCLehfR3gGEP0I9I?=
 =?us-ascii?Q?B4J4SkCyIizQtNSrEC+hEXrCMJICZSnKutGRAvaPQT76YqrDuRfOxHUPQO4g?=
 =?us-ascii?Q?DciQmmy1WBpLxFrqN6b54wcmZItGryAb02a0sdDsEgi7+xugqCiz3O1AzeZt?=
 =?us-ascii?Q?QkgGac1vyHGC5Hb6hJiso73VWqQBklozWi9KlL6IP/agPWCIbcvHtAG8R3kP?=
 =?us-ascii?Q?spVsSdBFr4DN5vvOpGdMFhDA5L0ZtYUEgGIh6C6Hg+shO7nirA2Awk3z+6w2?=
 =?us-ascii?Q?g0llQj8iUb2v4rYqSjuMPZluTEbM/93YbhlFyoGZJwap88iGOlU+Pe0BMwpf?=
 =?us-ascii?Q?8v/UjjoPrTXsDfxXrIj8J886Yjoudf8ePt19z8sz0R7l2OP9lMHJ9D9xsYJE?=
 =?us-ascii?Q?qsW4bdsPiqlFwgdmJ8dut4WIxZJuYQwgCCcrjHMedGkR9pwufrHAkEiKhD8c?=
 =?us-ascii?Q?XjymiB2gMWb4pJW5XIolL4EFvK10QNBsCE4IXKCVwbmDUyOWJFcFQe46N8j5?=
 =?us-ascii?Q?XjMIzOiaYzR4LZmOPyrh+AosgkCrj2DQLFER0EvE8K2n5Ed9kwn8tuVNvbXE?=
 =?us-ascii?Q?nXlVs0qYFYBEgTA5oXC33qzD2/H8FbRm+qWaNHhD9WopZ2poY/+g3NbJR1De?=
 =?us-ascii?Q?KqSM2//czily9mPSheYnaU49wSulFgJrBrwlRKuw9ibCKbGA1Xf1GRIbF9jh?=
 =?us-ascii?Q?bELjWTscERzhGOClq5/udgrtYYzHIsF8OP19D8ADvx/qL5L+X2qx2JjB9n3j?=
 =?us-ascii?Q?562WS1uTUfxY6ZAr1LK+/xfsVapxYLxmEZ+z3ICIsgLAvWBxoIVFHuii+edr?=
 =?us-ascii?Q?VZZOG0fVcvq/9U3eutnMWSICYsOUhm8kEYpch8Q2g/IZi2AJjbfrksWpFItf?=
 =?us-ascii?Q?4LaJfu19r6B2t9+emC/d3N+Nm44aL8tzaR1sdiRWY0+Qc3rd9dqQGzc+fEds?=
 =?us-ascii?Q?FDJMKTVj9rFDXbZ9sF2osUklOlF5ByUp50aSnb6VSXC0zUAGktOpwmJSk2Nk?=
 =?us-ascii?Q?S1+y0AGZnHPBTKO8FVuuMvYeKdFgPt1I/2e/nIxXLXEoz2L+jeEGVpfsaRoR?=
 =?us-ascii?Q?ROLCjMxBn0nHixsIQ+CJF9CWq9rOTLntJB+PfHPlA4zrBh8ga6XZtjTCDzxi?=
 =?us-ascii?Q?fGDHXcRg5hGpU6VYOxx+/RK3hH6OTIrPqvZ9I/lik1KQGmOzvCezTF9u1/F2?=
 =?us-ascii?Q?sdcbcWmzfTccgkfzxe1DSih+m/Gr+FHol4iHXbgytRdtJBW+sJVkUnx6Pa+S?=
 =?us-ascii?Q?GpIAMtfKxs/FojJ1PTsVgXSEcdJlJJnd1Yc2mJTBZ/FT51NDxhjEZrkqWgjf?=
 =?us-ascii?Q?15/kGyGyIrO4ic7RbCzzfBpeBYXUV8U0CGB7Um1M9J98G7bsUKdG3Xzw0ZMo?=
 =?us-ascii?Q?41itFXWkVGaZq9vmuc69eBsLe2EPFAPu/gxvUvOTU1XRPaMpqaXnY+++s96e?=
 =?us-ascii?Q?egrSQcOaUZ/c2VPsO20ilJSnAYc33HFc2fxBERwWQeW7ryTVCICMSeKsPngl?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b93d09-aca5-4cab-aa8d-08db3b82067c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 18:16:24.5831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpYp3PUo6wY5OQiusST9fuzz10me4UzNPgQpSl5QwTST1sq+/fAqliBJJAO0yMA+xgAAZJDqOtWgl2Rn90vswWOX9m+BBMoUd8ZXoX2LRtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6434
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/41] xe & i915 display integration ifdef
 cleanups, part 2
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 05:19:25PM +0300, Jani Nikula wrote:
>This continues the ifdef cleanups [1].
>
>BR,
>Jani.

I went  through each commit and it all seems reasonable to me and good
riddance of the ifdefs. I left a comment in just one of the patches that
we may need to re-think, but it's not a blocker.

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
>[1] https://lore.kernel.org/r/20230405153920.926583-1-jani.nikula@intel.com
>
>Jani Nikula (41):
>  drm/i915/display: add I915 conditional build to g4x_dp.h
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  drm/i915/display: add I915 conditional build to intel_dpio_phy.h
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/xe/display: Implement display support
>  fixup! drm/xe/display: Implement display support
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/xe/display: Implement display support
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  drm/i915/display: add I915 conditional build to intel_crt.h
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  drm/i915/display: add I915 conditional build to vlv_dsi.h
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/xe/display: Implement display support
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/xe/display: Implement display support
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/xe/display: Implement display support
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/xe/display: Implement display support
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remove all uncore mmio accesses in favor of
>    intel_de
>  drm/i915/display: remove unnecessary i915_debugfs.h includes
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/xe/display: Implement display support
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/xe/display: Implement display support
>  fixup! drm/i915/display: Remaining changes to make xe compile
>  fixup! drm/i915/display: Remaining changes to make xe compile
>
> drivers/gpu/drm/i915/display/g4x_dp.h         |  26 ++++
> .../gpu/drm/i915/display/intel_atomic_plane.c |   5 +-
> drivers/gpu/drm/i915/display/intel_cdclk.c    |  15 --
> drivers/gpu/drm/i915/display/intel_crt.h      |  14 ++
> drivers/gpu/drm/i915/display/intel_crtc.c     |   4 -
> drivers/gpu/drm/i915/display/intel_display.c  |  55 ++------
> .../gpu/drm/i915/display/intel_display_core.h |   4 -
> .../drm/i915/display/intel_display_debugfs.c  |   9 +-
> .../drm/i915/display/intel_display_power.c    |  10 --
> .../i915/display/intel_display_power_map.c    |   8 --
> .../i915/display/intel_display_power_well.c   |  17 +--
> .../drm/i915/display/intel_display_trace.h    |   2 -
> .../drm/i915/display/intel_display_types.h    |   9 +-
> drivers/gpu/drm/i915/display/intel_dp.c       |  10 --
> drivers/gpu/drm/i915/display/intel_dp_aux.c   |   4 -
> drivers/gpu/drm/i915/display/intel_dpio_phy.h | 104 ++++++++++++--
> drivers/gpu/drm/i915/display/intel_dpll.c     |   7 -
> drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   4 -
> drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  20 +--
> drivers/gpu/drm/i915/display/intel_fbc.c      |   3 +-
> drivers/gpu/drm/i915/display/intel_pps.c      |  13 +-
> drivers/gpu/drm/i915/display/intel_sprite.c   |   4 -
> drivers/gpu/drm/i915/display/skl_scaler.c     |   2 -
> .../drm/i915/display/skl_universal_plane.c    |  30 +---
> drivers/gpu/drm/i915/display/vlv_dsi.h        |  13 ++
> .../drm/xe/compat-i915-headers/i915_debugfs.h |  14 ++
> .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   4 -
> .../drm/xe/compat-i915-headers/i915_trace.h   |   6 +
> .../drm/xe/compat-i915-headers/i915_vgpu.h    |  44 ++++++
> .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   1 +
> .../drm/xe/compat-i915-headers/vlv_sideband.h | 132 ++++++++++++++++++
> .../xe/compat-i915-headers/vlv_sideband_reg.h |   1 +
> drivers/gpu/drm/xe/display/ext/i915_irq.h     |   8 +-
> drivers/gpu/drm/xe/xe_device_types.h          |   6 +
> 34 files changed, 383 insertions(+), 225 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_debugfs.h
> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_trace.h
> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h
> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband.h
> create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h
>
>-- 
>2.39.2
>
