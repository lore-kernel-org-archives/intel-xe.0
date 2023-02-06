Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B3FC61DA4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Feb 2023 22:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C68810E448;
	Mon,  6 Feb 2023 22:39:42 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B619710E448
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Feb 2023 22:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675723180; x=1707259180;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lh/dAv4E5QGC6wkemhFmuJuOSOe1s/TOaIkhz7IpSxg=;
 b=KbxvimG6L+GGhBPYQwu0w1i0Y0bKiZkBpn6kXXMalYpQYrHtzlnDNLM1
 YpJd82miZBvbsJUg+guSuxZm10+n9Rtnamt8FR8s+OEbN1ycFamuDamCS
 ZkGSSQvZCXZuDzPrCsjE+2k3jpbxI8LRIk50AUE7zAN+4w+4nza+XH7Ul
 mPtV2v0fE4dyXXmLxmWNOFy+5Pc4ScApwLwRYM8ScseKP1mrlq+W44WQn
 8yeiqyPNm2y8hrK+07aO8frsxWPPpo7KBPCbVoXwYzhrqwL3xLTTB7KXT
 fBU5oidT5GUr7VBU+m2MnHkE71QO0mnQ6HXeI6fO1slRR3l6OALukfZY1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="331468351"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="331468351"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 14:39:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="730153570"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="730153570"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 06 Feb 2023 14:39:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 14:39:39 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 6 Feb 2023 14:39:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 6 Feb 2023 14:39:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jg4ZuR2kKFLCWOaJ+QlylmeDyTGIMNpbV8ARiA2R4eKzQLRbR03MpMDb9JAGKv8atZNAVD+T8JIDY4ubLikuXtPhtW1BLAfcHef+R8ceBxQupvhUuOj5tMho2N9/WF+7AWMYqu21SQI3Q9wJOwOOOec73sKlWQZorc6eKFEtTvJPbywGTdBlqeVsULrDARo0CjwEFhCB/+OdFXrendTBez9d+qEDkSw8JrbbqlD/1nTsZ4nUPfZXhehGOoeqPU+BREIS/4baER2cMMzF+O+q2WDgQ2sBH/swJGAiIJqsa7P6/Ep6hOz+pp+pNmngSu7U+LpaEv4oZc0UHnWwg3/A8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRlQFp08hCww+t1kfW7Eta1qF/rc/RsqSo6Sb0yj0Hk=;
 b=COq+51xZJlRZbepCJCrwFDrWU5xNRVX8qrhn1S1qG0hmCGUhsMYP+Q7BMtQpRaWQUunrU1iTfMlzOzCQeV0wGuT2BzTBlC+o+JaJ20lPJuF26tOMFuoGQyEcwWudwBrejZxTWbyIDVuqU5JI9QIibERhOiWaCF1WUMT5IlAtSYYYv6/7R2kCkDV5sfntfTo4g2V1SM/WqK/15pJZhXqzo3I2wPTyhMgdUs7G9eI+OIwOYmoZoITOKP6I2xxOP1T0ahbGmMequbaXzpg8uRHzggRNh/EZs9/gXr23TSxrNv3pKeR7YZRoPJ73RqgCMjgQp03GvspYVnKQRpyzb1D8aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 22:39:37 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::e59c:fb1f:1b37:3412%3]) with mapi id 15.20.6064.029; Mon, 6 Feb 2023
 22:39:37 +0000
Date: Mon, 6 Feb 2023 14:39:33 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <Y+GBpdMmLUNZ52Ss@nvishwa1-DESK>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS0PR11MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b5cfc8-428f-4cc9-bd59-08db08930654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCCUMqDbj3Hrgd8DtdKnc+gGgN3rVa83jZLg+X8+QAnIqCc7N4RwxR5om56hHZTVmxd3UhTrS/xJ48BMpk7Btsm0CKgCA2siqLSUMshpq0h6BVmxfHlhWaIUVqLPejV8SuJky7yWZD01KGo6/TBJUATZCz3uTyrDPxLHF9C3w94T0fFHVPMs0QbsRwf1ocslMU5Oy/YvbTzAZUWu4JfXdE50MS1ghfmy2pRKbeXAEXk6/LvriWrFhdCqXq5U/5D52F07i6Z9CxUf4EOg2+f/ovsp0/JtVu0N4C+zU+iDHES00T7zDGwhdjGf8vq+sQ2uX5Dk4eERdr5u+mZpwGn5FHpPXD7p+T3vNqzSQSG3jztqKcILTJFTGl1h52Q74rQlQazXMW4crgZK0Y8KXGxEor0cHeyCB+ivz3lr3CKq6Iufms0dNdetccEGBhf2M51gZROfw7y6Ww6ZQVIptl8unkulNQH9PicqT5lugyUKzth+CfFLM/b1WOGEL0syVYIGfdBVuB03alAkGmjeMkGb6WgejjP7NDl3la+P5ecP04iO2T7zQDhlKfrJvM6aCzqo5LIaeAqcg6fGhLN+dlmxxm14f/eJj+7VLBZpXLrmBTFZj20nWwEY4B84RmGHrd/B/N71dGZepaVBcmODqkdUjYXicJKjHARdFQw7BKV0G4fW+A7TPVCiREewlx4TbAKO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199018)(8936002)(4326008)(6666004)(316002)(6506007)(8676002)(6486002)(6636002)(66556008)(2906002)(5660300002)(66476007)(66946007)(6862004)(41300700001)(44832011)(82960400001)(6512007)(26005)(86362001)(38100700002)(478600001)(33716001)(83380400001)(186003)(9686003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eopiME3KAJUU4nnAZjbFwec9dXgKjxH+FDUY8/UFhyyxAW/6Y1tjdqNAC5J2?=
 =?us-ascii?Q?Bz3zKm/BC4YE+x1uTzbA4hfNvZcDYXCI3Iihp5/74fk8ZWNYe9vdFG4BzmMg?=
 =?us-ascii?Q?9/yIxFwyd3GPLFzeMpYeS4pr4fEBUpYXXUYJsol2ry3oFWY5p/L3UGWfXPet?=
 =?us-ascii?Q?lcnJ7xgUKsriFomj+r3oVy7ZH8CVILPXbgvx/d4jpQV0E0qh/rncve3aOde7?=
 =?us-ascii?Q?Kh2hSCVSH/H+8pcjmHvaZgQDH3ITz17Zs6NlJP2ADmtIfq9Y8bTJnxlCdQ+N?=
 =?us-ascii?Q?JC29P7EzJ+aXFjIABd9iYzA1BsuHEFG3o1+ht/9Q24YWtDSeOZr24CU+/ynT?=
 =?us-ascii?Q?SURf3U4ZiHTLNJjhZ6bgSMhxlbPEmFCFshSBqvxI5j2WXdj4+P3Rjp6UoyEY?=
 =?us-ascii?Q?CW+vVVPqz7Rl5Vm+lfKlp5Ig8zNzeczohq+3QHgxveBOVW9h8jbN4YVliVWi?=
 =?us-ascii?Q?/WwwdrDszMfF6nvOaLBoSW0ZAre0NpbjuPLafXHMhv+fE+RDmU664/jwJIc5?=
 =?us-ascii?Q?psImTnHQMQv6e6Bg0hUtkVV91gzDcD8d7lhYEmYskiKZpjeclFzPycVUoO5G?=
 =?us-ascii?Q?VIadGg2RFlirhG7JA4vVE8A7cVjxZRqBhM8EcpuLo2t/S1JctXX0WwrePbti?=
 =?us-ascii?Q?+4ofK+FQBOIefdV54lfZeSxP1wDLGoTzXIs4pasvHpi0GimjTrE1sGMX4Mp9?=
 =?us-ascii?Q?2quj3hgSSo7nDbWxPh4xJpg9Do6dL6nP1CZoTKoqwii0ekkOJufl6wI/iO2i?=
 =?us-ascii?Q?Wd7S2WmmvhiTlb/gngPUtksIMSlLPd7hozbM6NcWQZli2sJGrmPvL1LcRzo4?=
 =?us-ascii?Q?gi7zqHZ4IIh1TS1N132joyS51edcGyWSasnanhPIXsOHtwmhSO22PEnTLiEN?=
 =?us-ascii?Q?8BsSveSJcOeffSTCfVWm81lB73nAX2QboFYeUQHWRqKZru7xHmaLtW+j48od?=
 =?us-ascii?Q?y5MbAmagqLzgmR90rWAZIc7v6LDLrYG3LsqoHFSc4XClW1iqBWR1s7LWQTCu?=
 =?us-ascii?Q?zfZvpQ1NAEFRVG8TIjK7UzOXNowGJEHNmaBq8kc+lQCsn22ZKuaNNHSm/cE5?=
 =?us-ascii?Q?onTooEzqH+tMMRfryoiw765S8W9ug6zH8WhmURQ+aucKbUWv+0f79+7mqmBy?=
 =?us-ascii?Q?k6I61q2769mfuCJ6HwKI5JLw7ax2g0gkKU68IMKXEMDolOeAeat/elweL4dc?=
 =?us-ascii?Q?WtMCOvHw3J9wcBLBxr3yi2kzS3O2e+0yL6Nq2gzO/UIfyBmV2ZtLNvk3y0UK?=
 =?us-ascii?Q?NaY5Ys6PeVjn0KsrKPyxypn401rLrwzzGduTHptKl9raJv1b76/QxXjsZ3Vy?=
 =?us-ascii?Q?ASKgqJsCViJkmzDm5+6aX1rG+xzbctA0t35qCv4y62gjyZfWR2S9dmPz7pc0?=
 =?us-ascii?Q?nFHOBYYfDfASGHaBq6uPQfUV2vALvMvkMRw/0KmmGKHswkSmG+T01KfbbCDy?=
 =?us-ascii?Q?HZhaakrmnmdGUgNdUkIuydBRV4x+GVj4FuL4tOgQNUgSwMus+S6he6ninEb4?=
 =?us-ascii?Q?etustNMIH+d9UgZCDcGLEl4Xb+W63otix6Ax40JCfNyWrwl6YWhEBV+53p9k?=
 =?us-ascii?Q?UtaNLWgAidRObdmRAUTLOxTorH9Szz5zMoBbdy9ijiU6ApB9xNn5iUMyj2JT?=
 =?us-ascii?Q?+CHECfIH6JNjfFZaYCsfKu0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b5cfc8-428f-4cc9-bd59-08db08930654
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 22:39:36.4497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hd7RvjryQxpe43FRorPMNUHCFPGO9Spgj29u0a0IcEyLGjbVLTf5tqbdkhKwT0gIS/UwJ2fUhwI7+XDAQCEHn3mGqXFTJ20Kb9eMv8lkWrJAjv6aWNPIPjnPHNQ0fslC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8230
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/22] TLB Invalidation
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

On Fri, Feb 03, 2023 at 03:23:47PM -0500, Rodrigo Vivi wrote:
>Let's just confirm the reviews on this patch and get them
>merged to drm-xe-next.
>
>Matthew Brost (22):
>  drm/xe: Don't process TLB invalidation done in CT fast-path
>  drm/xe: Break of TLB invalidation into its own file
>  drm/xe: Move TLB invalidation variable to own sub-structure in GT
>  drm/xe: Add TLB invalidation fence
>  drm/xe: Invalidate TLB after unbind is complete
>  drm/xe: Kernel doc GT TLB invalidations
>  drm/xe: Add TLB invalidation fence ftrace
>  drm/xe: Fix build for CONFIG_DRM_XE_DEBUG
>  drm/xe: Add TDR for invalidation fence timeout cleanup
>  drm/xe: Only set VM->asid for platforms that support a ASID
>  drm/xe: Delete debugfs entry to issue TLB invalidation
>  drm/xe: Add has_range_tlb_invalidation device attribute
>  drm/xe: Add range based TLB invalidations
>  drm/xe: Propagate error from bind operations to async fence
>  drm/xe: Use GuC to do GGTT invalidations for the GuC firmware
>  drm/xe: Coalesce GGTT invalidations
>  drm/xe: Lock GGTT on when restoring kernel BOs
>  drm/xe: Propagate VM unbind error to invalidation fence
>  drm/xe: Signal invalidation fence immediately if CT send fails
>  drm/xe: Add has_asid to device info
>  drm/xe: Add TLB invalidation fence after rebinds issued from execs
>  drm/xe: Drop TLB invalidation from ring operations
>

Looks good to me.
Some minor comments on patch ordering.
Patch #8 can be merged with #10
Patch #10 can be simplified if we move #20 before patch #10
Patch #17 should probably put ahead of #16

In any case,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>


> drivers/gpu/drm/xe/Makefile                   |   1 +
> drivers/gpu/drm/xe/xe_bo_evict.c              |   5 +-
> drivers/gpu/drm/xe/xe_device.c                |  14 +
> drivers/gpu/drm/xe/xe_device_types.h          |   4 +
> drivers/gpu/drm/xe/xe_ggtt.c                  |  23 +-
> drivers/gpu/drm/xe/xe_ggtt_types.h            |   2 +
> drivers/gpu/drm/xe/xe_gt.c                    |  19 +
> drivers/gpu/drm/xe/xe_gt.h                    |   1 +
> drivers/gpu/drm/xe/xe_gt_debugfs.c            |  21 --
> drivers/gpu/drm/xe/xe_gt_pagefault.c          | 104 +-----
> drivers/gpu/drm/xe/xe_gt_pagefault.h          |   3 -
> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 342 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 ++
> .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  28 ++
> drivers/gpu/drm/xe/xe_gt_types.h              |  41 ++-
> drivers/gpu/drm/xe/xe_guc.c                   |   2 +
> drivers/gpu/drm/xe/xe_guc_ct.c                |  10 +-
> drivers/gpu/drm/xe/xe_guc_types.h             |   2 +
> drivers/gpu/drm/xe/xe_lrc.c                   |   4 +-
> drivers/gpu/drm/xe/xe_pci.c                   |   7 +
> drivers/gpu/drm/xe/xe_pt.c                    | 130 +++++++
> drivers/gpu/drm/xe/xe_ring_ops.c              |  40 +-
> drivers/gpu/drm/xe/xe_trace.h                 |  55 +++
> drivers/gpu/drm/xe/xe_uc.c                    |   9 +-
> drivers/gpu/drm/xe/xe_uc.h                    |   1 +
> drivers/gpu/drm/xe/xe_vm.c                    |  42 ++-
> 26 files changed, 736 insertions(+), 200 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
>
>-- 
>2.39.1
>
