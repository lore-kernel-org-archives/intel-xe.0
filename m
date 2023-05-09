Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492B1C7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 20:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E9810E071;
	Tue,  9 May 2023 20:01:22 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C649E10E071
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 20:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683662479; x=1715198479;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YQ+9ddwcQ8VkZ8+5iW2gmLsMSPUMTSFYqpp6nncnKLo=;
 b=TPVHX7ciDXB+ZCfpbl2hvZrLwlAi2KP8exZLatKGHcaPtz26S0RMWrH8
 Equx9RbSwJDjWFYv2wL1kF0uWFavodXZ4I7rDiAtTjjR2j74Q1UvJBg3f
 //V/hAj9T41bGop+P4m3UL1Lpgthrub47H6Ul42Bjkqi1IifJMTym9/ms
 wXrNU2m3uF4eVzcMYxZPHDfUhZLV2gw8YjOTGbl0rmO2qRFEZ8YgUunFS
 oTY+iFg4+i0XT4CxSFL78+HPkBhKLMeOcPxe5Jr6UCnFhLu8UfL/FWCna
 NoM/e+01vK3cl5cyPYD0EIsJAoCQUegBwOUhr1UCGJd22FNriLpUStqBX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="347504002"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="347504002"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 13:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788650716"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="788650716"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 09 May 2023 13:01:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 13:01:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 13:01:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 13:01:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 13:01:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q45NaDBvMkI4KoMnuEyvwYEQF6M9WRVt6/E+rYfa9F7od/+wZg6p4tPtpT3IIq/DWZfyMBJOMr0r39K/4VitWv3F3227rwdOq+Sc9eV2VqANVR9Qo0r2ep8dTKG5ST6tohO3znVBzu5Rsyvd1MG1geJXu0Ixfz81XOcpWOUgFVLuQBABRLP3VELHD3Los4wbIAMU7A/5gcsnBZH8vvDgjiTFvaisQ3up3hcM69xqZ/OlALObwoAuVkeB5nI9/g7JGocqq5VaPaFhj6ME3BByFZezHDL3ep+9dWVyn7yATAfekv9NYACNiFslknlMStEUnbh6czgWmz0rOx/igBAldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gs4oseoioyekpWJC1ItBqM4ID5ggRJd6gNnDLJwIUeo=;
 b=DuS1A8mz/CVft2MPRDd8Qz1YgHK8WUAl6mjm9KIw/B/+hkTTFvW/W4TJS1Ey1rUjkQj7o1wGs2QzPL/txzRAy2oHSW6ZDaTrOLAXgCy92xSTPJ2WbXgxMabY9qiRvRoXpqwrv7dOCQQ6KIo6SuRojZN/rkqyfljoQU5gnky2cxf8/AMcCzhki9R289U43cG7lVghHR5BzWeheudMgq7dquyZ3OSzKANUOoh+C4g4Z6t0IWtsCaOOnzZWs2DdHpYmSrVESIlxd9q1qEi4haDYUWBucCE4YFWa+tJDwBpTceNZ0zmsPzhK6RBf7z2GLQDqp6oUw7QD7PrqhG3LlfDKug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7493.namprd11.prod.outlook.com (2603:10b6:510:284::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 20:01:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 20:01:16 +0000
Date: Tue, 9 May 2023 13:01:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <pxdfpd7h53olaenebo4uyhnykiatcljh6pfjqdeblxwukviu7i@3xj7rpdc2gjc>
X-Patchwork-Hint: comment
References: <20230508225322.2692066-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230508225322.2692066-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 12608839-3909-43db-1238-08db50c82598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Od8fgDMHpuCZGSiBFmzgB76OdQIIMZ6CIQSy6mpbuQyZVpsErtxiwK0M/7aqOO2EZvwC+EtMtnQFdVkDYpNEH6TXAcvQZ6CHlWSQR3rjZEw2NistISp6Ndhk9hMosWO8cXz+hYjb/IfWcCoTdhHKZNfHEb77FoKotvLU2snqsJwhnGnFUb5wdKYlQW1ID1NCf3SwONX8MSYoiLndh2DjwFaO2BIRRMG7hSTz9EyJRWR3A8N0Z+mtvVf3GBor7TQsugOP0XsWq2Ljo0g1wKZG3U7PGIxWF23TV1GMPcubr7A8Rtq7K89vaWv82BpohrzfqN2B//jh58u6S+6Njrv9YWB29TJQmxKQNipONW9HfUJ07HogmtgJJ9245sTA+9K2dVcMo5iIeIytAI6siqypaqCtOjMvCvxvf/2QwV4PP7DgapLpgzXjnRNt5Z0cYZMnsML/0zI2a1Kb1bplBX7R1JcI3XMXdOqziQtNpgIC6wmfPuRwr6OXTj0OumW29B+8l0qOLYGZiW6Ux6bHpy1oW57qy5d9CJtxcc9+Lms6KJVKbbm7W/skSGScoZMiPvcB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(66476007)(478600001)(316002)(6916009)(4326008)(86362001)(66946007)(66556008)(6486002)(33716001)(5660300002)(41300700001)(8936002)(8676002)(186003)(82960400001)(38100700002)(2906002)(26005)(107886003)(6506007)(6512007)(83380400001)(9686003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c4g/+DBzf+m8Q0wddwCP24cgcUbvnkY060vh+2fiF3JAzAUDjqHym8M/eCd1?=
 =?us-ascii?Q?gTD71TWRF5T8J7WxPjfW3d/1v6BdnlrLk3fv2HeoaWJWUM9raMWhs7CwQwHs?=
 =?us-ascii?Q?Z4gSeRNjkWjQXCv3z/PUjnhsHSWlkZmEL+bksyqg67YyAgHDS6v9Exmz8WoI?=
 =?us-ascii?Q?Zarnoenw+CN8P7h/0f0okVVZBBhE/CK8SBaQX74PIPX0LFIOowOA59uEocRB?=
 =?us-ascii?Q?RVyNu1fjwz6ICpfOz1iiKdQi8ykaXuSRigO37e9UJRIm5robAOa447bkTcia?=
 =?us-ascii?Q?kAro0yr8xsKUzb80ks4V1Bblked3mxhJ4+HYZryCAF5+dGgmUemSg9QypjsP?=
 =?us-ascii?Q?p2pOmq5Ytfw3wbH8ru7rtXdG04PQJFO4c9+KHqv5tOEjADDXuzd7a9oQ0c0F?=
 =?us-ascii?Q?uuUQ1hsZ5cCzj1twJ8qOuS3t/R9Gy7S5zXg13f+rleREIo1KfCP7ZsuWQJyG?=
 =?us-ascii?Q?jBnDVPyvou3H22pofWT0VM+O/edGR3fRpWCdpjh95WLALxO3fq8tYrQLw/Py?=
 =?us-ascii?Q?frdCRVKmq37mMZ6ZkL5mCqr0ezW23MXglhMqd3qWO2BjDIn86P/Ukxu0V6ZZ?=
 =?us-ascii?Q?uVE+NQr/+C0ZkWlGUL9seqM/hNYUiGgsYEkpsq4cIJHROJC5qHDBmT7iiyWB?=
 =?us-ascii?Q?A2ozBHvEuR5K5tWlmMbtYc4z1VQaZRNd5I6wxOOehlLzUpPfkAW7LeqCT2l7?=
 =?us-ascii?Q?cgZu1LTppbm2he4oz2mkPE9iHsfjzpfd8uCvWMTchgYiD8WiQIZnT1307+Cj?=
 =?us-ascii?Q?vlLTlDhlaHYN3Cu7OeE+Cw5+dGoysMaTTN6qKyueItxoNIo1jl5TNJt4bOkU?=
 =?us-ascii?Q?W+bO18IEVBHBIyJ+n2hGFb1beyoM/jDz/NiY6WEz43OkghOy4PRP7sHj83L8?=
 =?us-ascii?Q?tlzJY+C+uDYoVI/hwnEv3/GiSElcsy/642YGPYFsM+lWwIS23WyniHBMEkuN?=
 =?us-ascii?Q?FYw3PySa9ZbQfGvFn6TuP8m+uABjYXo1E/aWwqfcgeM2SZUBHw0HVpf81ZeX?=
 =?us-ascii?Q?YC0pG3YZ+gn9e4BVcn1fEBkixVlkndqBQyUyoCwa0IiAiVPiIy0VShToaDBH?=
 =?us-ascii?Q?S78LVQ7+hnbnLvsr0Qq2dbJTjOTc1XbvZ+ZGUB0TsJWFAwB/2axX2kP0KHMw?=
 =?us-ascii?Q?tKHdjdSnRHYI9jCdzyUEVMCJybyjR9BzMFUHZbfomJ7IpAh/e/d7ILwLI92d?=
 =?us-ascii?Q?K2cJbuu078pBV7E2ZF1rPTZf8EjQITpW3RbaurArlakBTA9GT5OQSlWO6HrR?=
 =?us-ascii?Q?74yS74M3ukjlz7xRKCGVJIm96Lf2Cg6j7mhMTr11NIR0pPdJyngNp4wyIfA+?=
 =?us-ascii?Q?N6KVYkmAxhSY03Cf2ma9KyLS0HFSPDLhNMO39YwI7e0+4Zy7y9d7BeJai5oo?=
 =?us-ascii?Q?T47fTKTJ09HDZlKXq8EIDhmm7Hip2/WzdRnrAComgnaI+bQPfV+4pkpbXCIW?=
 =?us-ascii?Q?6eI07194t1O3CCOyLVeWj8oo6NTdhteMD7EpSjD72C/S9HY2cgY1pfKzR2nf?=
 =?us-ascii?Q?BoFSdBoVM3y5pL7xXQl3PP2gW91ubb3oElRoSOUrYzNHUARsN60kQWtfUI0j?=
 =?us-ascii?Q?UzpHJ5O4S3n+rXgju3YBw+2g2g6k+gpK9Sup62ea0uQopBAokaAj+nuof7Dj?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12608839-3909-43db-1238-08db50c82598
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 20:01:16.0099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWpqqPmOC+WzU6ikRydc8IgY2oD6yWrXuOe+LZXoE8wmRJbythkPxbClHufcE01mP23LZl/Nb+nruz7BFn2lY9jG/HKJ4dZ30oQRsAWsRwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7493
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/4] Convert xe_mmio to struct xe_reg
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 03:53:18PM -0700, Lucas De Marchi wrote:
>Now that struct xe_reg is in place, convert xe_mmio to use it so we
>avoid mistakes of passing the wrong argument.
>
>v2:
>  - First 2 patches from v1 already applied
>  - Drop controversial patch, "drm/xe: Use media base for GMD_ID access"
>  - Rebase on latest force pushes with display refactors
>
>Lucas De Marchi (4):
>  drm/xe/mmio: Use struct xe_reg
>  fixup! drm/xe/display: Implement display support
>  drm/xe: Rename reg field to addr
>  drm/xe: Fix indent in xe_hw_engine_print_state()


all patches now applied. Let's figure out next how to handle the move of
the display to the top.

thanks

Lucas De Marchi

>
> .../drm/xe/compat-i915-headers/intel_uncore.h | 103 +++++++++----
> drivers/gpu/drm/xe/regs/xe_reg_defs.h         |   6 +-
> drivers/gpu/drm/xe/tests/xe_rtp_test.c        |   2 +-
> drivers/gpu/drm/xe/xe_device.c                |   2 +-
> drivers/gpu/drm/xe/xe_execlist.c              |  18 +--
> drivers/gpu/drm/xe/xe_force_wake.c            |  25 ++--
> drivers/gpu/drm/xe/xe_force_wake_types.h      |   6 +-
> drivers/gpu/drm/xe/xe_ggtt.c                  |   6 +-
> drivers/gpu/drm/xe/xe_gt.c                    |   4 +-
> drivers/gpu/drm/xe/xe_gt_clock.c              |   6 +-
> drivers/gpu/drm/xe/xe_gt_mcr.c                |  39 ++---
> drivers/gpu/drm/xe/xe_gt_topology.c           |  18 +--
> drivers/gpu/drm/xe/xe_guc.c                   |  61 ++++----
> drivers/gpu/drm/xe/xe_guc_ads.c               |   5 +-
> drivers/gpu/drm/xe/xe_guc_pc.c                |  32 ++--
> drivers/gpu/drm/xe/xe_guc_types.h             |   3 +-
> drivers/gpu/drm/xe/xe_huc.c                   |   4 +-
> drivers/gpu/drm/xe/xe_hw_engine.c             | 103 +++++++------
> drivers/gpu/drm/xe/xe_irq.c                   | 140 +++++++++---------
> drivers/gpu/drm/xe/xe_mmio.c                  |  33 +++--
> drivers/gpu/drm/xe/xe_mmio.h                  |  55 +++----
> drivers/gpu/drm/xe/xe_mocs.c                  |  11 +-
> drivers/gpu/drm/xe/xe_pat.c                   |  14 +-
> drivers/gpu/drm/xe/xe_pci.c                   |   4 +-
> drivers/gpu/drm/xe/xe_pcode.c                 |  16 +-
> drivers/gpu/drm/xe/xe_reg_sr.c                |  18 ++-
> drivers/gpu/drm/xe/xe_ring_ops.c              |  11 +-
> drivers/gpu/drm/xe/xe_rtp.c                   |   2 +-
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   4 +-
> drivers/gpu/drm/xe/xe_uc_fw.c                 |  16 +-
> drivers/gpu/drm/xe/xe_wopcm.c                 |  16 +-
> 31 files changed, 429 insertions(+), 354 deletions(-)
>
>-- 
>2.40.1
>
