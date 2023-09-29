Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BF1E77345
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 22:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD41610E4FE;
	Fri, 29 Sep 2023 22:12:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DD310E165
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 22:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696025568; x=1727561568;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=12618NaH8xbb1DOT0Vx272eyjdANHZ+E865ZIynL7SA=;
 b=GeD/yc8WGS+uaHYvevwtQFE8WhD3sVdIh6WJ6AEN9m7fl6sViHtfHrdx
 EkZiSqBcOwb9gT1ISlBhW6LHkY+EgOlVjabPOQ+rS4uy5kENts909rklK
 UC1O9xOH3ikBceUqbBpaUPXtakJEfZFZk8iqCNk1Eghj7BoFQrSfepeZi
 X1uvkIM3RIjnz/ZC5w+9iQ6QtufEIKTX9emWNkYMv4LDWNvegT8j0T6PN
 4LdW+JTzS82N0Xu3PzMOHDoUlgkIUetWZ39qPO2XgdNthkrRFXuxoXIZq
 F0BTzWQKqcHPo+rnCrgKbms3qw1sU09qh4fpcvqvDrDvjj7oGwnntobCZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="413294385"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="413294385"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 15:12:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="743561412"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="743561412"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 15:12:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 15:12:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 15:12:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 15:12:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBIzx1l1Cxr+QVeu1gH0qmPS3ylGXATJ568NtYeKw9+DxnUAt4vXU9hmshHoMzV184N5fFMb6iK36R20GZdEyuB8pcAF0bt3QvVW9tMWkAYrZdP9eluKkebhE+JjufSAGLkIdkpWNhSg9342Nrl9Jyh1B7ka/lrkuZWLJeyBBkscHWsdMd05XXU5pJGJYHusYo1UdTg4WDysAv9pU1R3qFHxMaZUfJ9ckWFcJYOvvHlPv9ReO8GFIzyAoG1/A4gireKd1JENEqgpSenVDFCZzBlalz7EK+PmOscih/LxxgB+rkvQgJWx2q0ZyrcZs4t0ZFqsEAMk9Qr445fF0s+85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCuFIWhiu51R06NUDwgqrelfA5cTMmUUtSVeDeh06oc=;
 b=Fag8z+HYNiWti/O/gvqmVOsq0Hfr2BMQU98wN7LD6OkfXEfXf/jl+BujJoE+Z9Q73DtuObzRkfG5U9dfyqMZcd6MHMjtMrrKhTHc6lR95tOFQBy+ysETb23bE1PBUfo5Pgej2CFC+TpYp90RwpxiWFyWgXcdpuK5oUiNsjPnSEdoeN7jnom2b4QILQxQbiNGiK5pm7soie7RtjSjJlma3MqR3fFB6leEgy1nlS/x8/5syJpzQBVFcaFq5gzMYxwbHAf5sfXbPLuDuU0mjJHEY6GjKtva5vfwKSe04cBZAb/5DvbL+cU8wvK2fCo8IAyiKw9OKf+o+mKpQLGx41QgvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ1PR11MB6106.namprd11.prod.outlook.com (2603:10b6:a03:48b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Fri, 29 Sep
 2023 22:12:44 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 22:12:44 +0000
Date: Fri, 29 Sep 2023 15:12:41 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZRdL2Rn9FrBT+WvR@nvishwa1-DESK>
References: <20230929210130.1203203-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230929210130.1203203-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY5PR20CA0036.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::49) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ1PR11MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: e3eedb53-ad93-4481-d62e-08dbc13934b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ou1wGm5s1CdO2aDEYMXn/gTZvF8pwD+dxhd3SnOEhrm5ONRhQ0HdWWUZIL/2cKXfUHjQwU5tn5v+64gY/h3fgS0n/XQW58QAa/H/9StRCGOikiHNjYbFgiOdv5o3S21oHJ7le+RbM0PhAfUxc4fOt2mgYLhHdA3TeFb6AZ2fxCH8lAJFOPEgNFEvcjYXSpRLQet+KR7q/8l9pV44S3hZ5KqCNIHxuoou01dejdyTboUOS8ZfxS5D/O7l3ie7X6jTVR+tFLhSEN/Qx5lSfl1DGkp5x87chrT/gaBcJkYJjWVotW+8OFAQveGNcNeIzO6+omXmtjCMkXAKtZVyfZw5cZqqQiUme3ZQB0kjX5Lw49S2cdz4kkURARY2aeSnUYd4LYSLmNoILxrSKk4/MWti07SWDNyMlfbHs+uxU3l7ExaN8kd8d5eeUdQHnjX1D4nK1BGs6B8DzOzou/vo/CIg9HL9Vtu1Fs2y6EknpURFceEnmm0SpVO+4U4Gw9zW8TT/kZROyUeFZtAJpnc/bMB4loDnq4G5gVHQH8Q69CtCOgWYH6oNpgWD1MPh/7Ihoswyvo+j1A+HyVPIjq4Qjw/0OVQLg5h01FjmuKXpKnT8FQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(39860400002)(136003)(366004)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2906002)(41300700001)(83380400001)(6666004)(30864003)(6506007)(66946007)(8676002)(4326008)(8936002)(6636002)(316002)(66556008)(33716001)(66476007)(6862004)(86362001)(6486002)(26005)(44832011)(38100700002)(82960400001)(478600001)(5660300002)(6512007)(9686003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0VJivAfMXhO+JIMa1urOyFz6BTFqZ/+ELVnbvaMT7zMWh5Xbkh7nWsIIAp?=
 =?iso-8859-1?Q?tecuXbwuqekHIMO2M0xGKo9oGhKVf7NhC8LMgkZtPBu1eaGr0VpGUCMf+8?=
 =?iso-8859-1?Q?enPJsCIOaimyx7p4eCdwLghMGFA7yI1zG+98YZSfEd50f6A8UkxprVWWGw?=
 =?iso-8859-1?Q?GRgJ+jl8W5E82r/yfka1Im9TqWP9zXY/GKRTjyxRGhH40qd0D4cf5s71Tb?=
 =?iso-8859-1?Q?/GgDm8XEQnaKsWop5BEagZhBgW+ftdCJfBlLeN3Htclydkoq4S8EosyiDJ?=
 =?iso-8859-1?Q?l+zaVjc1IQu1Jw3WKf4CADQ/P6OVJ+QKJlUCmcyvn58vEAbqFce3ssNtBp?=
 =?iso-8859-1?Q?b3vbCWReB0hVZx+Osux09CpzJx1djs4qe49sVlRW/oGSTYY2ajvqacDAIi?=
 =?iso-8859-1?Q?0Ekd5KVMsqEIkIdjZlR+LDdZyF2rosS/i4I5yL2b0DeSusy3IzaTRW9Vpo?=
 =?iso-8859-1?Q?kUo5p5rXhtpnk9EqMFM2NxBE+yxxi8Uj/qHif6/bnXJVqAeVrph7WC406F?=
 =?iso-8859-1?Q?3dd7ZKCwOWX/Suw1jvBs2gSymg8UyXqviv8YQKD3JEfv4TYoz6Q0sRfLDv?=
 =?iso-8859-1?Q?T9TuHlHMGGJABdcTIYY7+JtAUG3Va1upoXePRRy9VX+qLIs5POdEZdCCvR?=
 =?iso-8859-1?Q?GG7IOPZQkaL9qBSviFZFAQOrupC6UVqYllaS9gaolxbYohWcs0OSsiBiXi?=
 =?iso-8859-1?Q?cxh6XXsbwrJZ//NtczkMOrhTE75iXHrAReMhCYmTaMX8ucMptahTeZvj7m?=
 =?iso-8859-1?Q?4wkFIKJXIiL/9+0y4Xdm+sIJBwO2IBRZ+IQQQE1HV5KESc8v4qepAPBKvu?=
 =?iso-8859-1?Q?2FDUlgzxUHZ3HtKRHewzn3i22swliQ2YnN84OExqDsTpY2jBe+YMK+9ECC?=
 =?iso-8859-1?Q?CWlehVUJA2pDq+QoLBJFsqNfeDu6VS5nl/W3STwPRcIMi12DvvshC9FNAM?=
 =?iso-8859-1?Q?xcfl7/nSoLWqlaFtS1qP7Q0SV4+vbhRG6qL2pgG9k9Z65TKhLDam9VPePl?=
 =?iso-8859-1?Q?Yi5d/Zd65PbIJOqIz/e4J9upLAEeUi8NMr6p4B7OSHFucFxG5mjYhe8cu5?=
 =?iso-8859-1?Q?9daiRB7B2d0zVknyhQeOgWnSbdY7AW0fRpfmmdqERY0wtkED4k2iVOli3D?=
 =?iso-8859-1?Q?iCcBFdkbW3Oonsxgie8Q1pnHmU/p7kAmLMhsHdP8QmDKYGCAxOOUycuLra?=
 =?iso-8859-1?Q?i08exwg2M9TaX9qZg5ZQ94fwb/o9j/yz7Q4UZ+GQcqTFdRpGtlUWFCHX9X?=
 =?iso-8859-1?Q?o3Ku/3ChN7Bu7hp1OTfhgzlGfBt9mc7L+xgWF8cCHUEfYjoewm+jxSNfc2?=
 =?iso-8859-1?Q?OmvIE0UZcMRvFWCoyiAgpYIALvqQQD9FnbijZ2JiF8KZkLnVr4MwJUcLmn?=
 =?iso-8859-1?Q?6++pxuvKBEv3L8DUoXOPvIYzXXIP7QhbgEP8KBMma9Rc+lPhEpuyOFNQ8v?=
 =?iso-8859-1?Q?11J7NAzZjlZG3P+cea7/rwzOs1u2yk8Y3XJxcReBfMx6PkRFoIzVYKCjmQ?=
 =?iso-8859-1?Q?XWnZxASx/GKhpmmJQjTO1++q/Mqd5MbUXPUq4goZh5Zz75B70ZIytGTDyl?=
 =?iso-8859-1?Q?Y1C35fHPhv5oHSTZTsBUztWpnW/HFXjhmJG8hcfdTo8bWK/WYeSobBxpEv?=
 =?iso-8859-1?Q?6vVLK3oJMi+ivA/NrvcVO6WF9Acy6B2U1tLWAYzN3ZLT/FPBN+7kIf1avJ?=
 =?iso-8859-1?Q?BZJP2aRWI6IaHoXnK+0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3eedb53-ad93-4481-d62e-08dbc13934b1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 22:12:44.6020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uiOyt+zQ178cnixdFNHjykF3JYjswBIjozzvIV5Jq6Xl+KEPpCVBReoBTIFRSMm4UqLChdCbkR+jO+eveC4dtrn1G7OIhM/XENPe8C9TdOyY7E+bM0txtRkkg+LpJLL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6106
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Kill xe_bo_doc.h
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

On Fri, Sep 29, 2023 at 05:01:26PM -0400, Rodrigo Vivi wrote:
>Keep the documentation inside the code.
>No update to the documentation itself at this time.
>Let's first ensure that the entire documentation is closer
>to the relevant code, otherwise it will get very easily outdated.
>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> Documentation/gpu/xe/xe_mm.rst |   2 +-
> drivers/gpu/drm/xe/xe_bo.c     | 170 +++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_bo_doc.h | 179 ---------------------------------
> 3 files changed, 171 insertions(+), 180 deletions(-)
> delete mode 100644 drivers/gpu/drm/xe/xe_bo_doc.h
>
>diff --git a/Documentation/gpu/xe/xe_mm.rst b/Documentation/gpu/xe/xe_mm.rst
>index 6c8fd8b4a466..bcb5ad56da9a 100644
>--- a/Documentation/gpu/xe/xe_mm.rst
>+++ b/Documentation/gpu/xe/xe_mm.rst
>@@ -4,7 +4,7 @@
> Memory Management
> =================
>
>-.. kernel-doc:: drivers/gpu/drm/xe/xe_bo_doc.h
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_bo.c
>    :doc: Buffer Objects (BO)
>
> Pagetable building
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 61789c0e88fb..8ced990e3982 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -27,6 +27,176 @@
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_vm.h"
>
>+/**
>+ * DOC: Buffer Objects (BO)
>+ *
>+ * BO management
>+ * =============
>+ *
>+ * TTM manages (placement, eviction, etc...) all BOs in XE.
>+ *
>+ * BO creation
>+ * ===========
>+ *
>+ * Create a chunk of memory which can be used by the GPU. Placement rules
>+ * (sysmem or vram region) passed in upon creation. TTM handles placement of BO
>+ * and can trigger eviction of other BOs to make space for the new BO.
>+ *
>+ * Kernel BOs
>+ * ----------
>+ *
>+ * A kernel BO is created as part of driver load (e.g. uC firmware images, GuC
>+ * ADS, etc...) or a BO created as part of a user operation which requires
>+ * a kernel BO (e.g. engine state, memory for page tables, etc...). These BOs
>+ * are typically mapped in the GGTT (any kernel BOs aside memory for page tables
>+ * are in the GGTT), are pinned (can't move or be evicted at runtime), have a
>+ * vmap (XE can access the memory via xe_map layer) and have contiguous physical
>+ * memory.
>+ *
>+ * More details of why kernel BOs are pinned and contiguous below.
>+ *
>+ * User BOs
>+ * --------
>+ *
>+ * A user BO is created via the DRM_IOCTL_XE_GEM_CREATE IOCTL. Once it is
>+ * created the BO can be mmap'd (via DRM_IOCTL_XE_GEM_MMAP_OFFSET) for user
>+ * access and it can be bound for GPU access (via DRM_IOCTL_XE_VM_BIND). All
>+ * user BOs are evictable and user BOs are never pinned by XE. The allocation of
>+ * the backing store can be defered from creation time until first use which is
>+ * either mmap, bind, or pagefault.
>+ *
>+ * Private BOs
>+ * ~~~~~~~~~~~
>+ *
>+ * A private BO is a user BO created with a valid VM argument passed into the
>+ * create IOCTL. If a BO is private it cannot be exported via prime FD and
>+ * mappings can only be created for the BO within the VM it is tied to. Lastly,
>+ * the BO dma-resv slots / lock point to the VM's dma-resv slots / lock (all
>+ * private BOs to a VM share common dma-resv slots / lock).
>+ *
>+ * External BOs
>+ * ~~~~~~~~~~~~
>+ *
>+ * An external BO is a user BO created with a NULL VM argument passed into the
>+ * create IOCTL. An external BO can be shared with different UMDs / devices via
>+ * prime FD and the BO can be mapped into multiple VMs. An external BO has its
>+ * own unique dma-resv slots / lock. An external BO will be in an array of all
>+ * VMs which has a mapping of the BO. This allows VMs to lookup and lock all
>+ * external BOs mapped in the VM as needed.
>+ *
>+ * BO placement
>+ * ~~~~~~~~~~~~
>+ *
>+ * When a user BO is created, a mask of valid placements is passed indicating
>+ * which memory regions are considered valid.
>+ *
>+ * The memory region information is available via query uAPI (TODO: add link).
>+ *
>+ * BO validation
>+ * =============
>+ *
>+ * BO validation (ttm_bo_validate) refers to ensuring a BO has a valid
>+ * placement. If a BO was swapped to temporary storage, a validation call will
>+ * trigger a move back to a valid (location where GPU can access BO) placement.
>+ * Validation of a BO may evict other BOs to make room for the BO being
>+ * validated.
>+ *
>+ * BO eviction / moving
>+ * ====================
>+ *
>+ * All eviction (or in other words, moving a BO from one memory location to
>+ * another) is routed through TTM with a callback into XE.
>+ *
>+ * Runtime eviction
>+ * ----------------
>+ *
>+ * Runtime evictions refers to during normal operations where TTM decides it
>+ * needs to move a BO. Typically this is because TTM needs to make room for
>+ * another BO and the evicted BO is first BO on LRU list that is not locked.
>+ *
>+ * An example of this is a new BO which can only be placed in VRAM but there is
>+ * not space in VRAM. There could be multiple BOs which have sysmem and VRAM
>+ * placement rules which currently reside in VRAM, TTM trigger a will move of
>+ * one (or multiple) of these BO(s) until there is room in VRAM to place the new
>+ * BO. The evicted BO(s) are valid but still need new bindings before the BO
>+ * used again (exec or compute mode rebind worker).
>+ *
>+ * Another example would be, TTM can't find a BO to evict which has another
>+ * valid placement. In this case TTM will evict one (or multiple) unlocked BO(s)
>+ * to a temporary unreachable (invalid) placement. The evicted BO(s) are invalid
>+ * and before next use need to be moved to a valid placement and rebound.
>+ *
>+ * In both cases, moves of these BOs are scheduled behind the fences in the BO's
>+ * dma-resv slots.
>+ *
>+ * WW locking tries to ensures if 2 VMs use 51% of the memory forward progress
>+ * is made on both VMs.
>+ *
>+ * Runtime eviction uses per a GT migration engine (TODO: link to migration
>+ * engine doc) to do a GPU memcpy from one location to another.
>+ *
>+ * Rebinds after runtime eviction
>+ * ------------------------------
>+ *
>+ * When BOs are moved, every mapping (VMA) of the BO needs to rebound before
>+ * the BO is used again. Every VMA is added to an evicted list of its VM when
>+ * the BO is moved. This is safe because of the VM locking structure (TODO: link
>+ * to VM locking doc). On the next use of a VM (exec or compute mode rebind
>+ * worker) the evicted VMA list is checked and rebinds are triggered. In the
>+ * case of faulting VM, the rebind is done in the page fault handler.
>+ *
>+ * Suspend / resume eviction of VRAM
>+ * ---------------------------------
>+ *
>+ * During device suspend / resume VRAM may lose power which means the contents
>+ * of VRAM's memory is blown away. Thus BOs present in VRAM at the time of
>+ * suspend must be moved to sysmem in order for their contents to be saved.
>+ *
>+ * A simple TTM call (ttm_resource_manager_evict_all) can move all non-pinned
>+ * (user) BOs to sysmem. External BOs that are pinned need to be manually
>+ * evicted with a simple loop + xe_bo_evict call. It gets a little trickier
>+ * with kernel BOs.
>+ *
>+ * Some kernel BOs are used by the GT migration engine to do moves, thus we
>+ * can't move all of the BOs via the GT migration engine. For simplity, use a
>+ * TTM memcpy (CPU) to move any kernel (pinned) BO on either suspend or resume.
>+ *
>+ * Some kernel BOs need to be restored to the exact same physical location. TTM
>+ * makes this rather easy but the caveat is the memory must be contiguous. Again
>+ * for simplity, we enforce that all kernel (pinned) BOs are contiguous and
>+ * restored to the same physical location.
>+ *
>+ * Pinned external BOs in VRAM are restored on resume via the GPU.
>+ *
>+ * Rebinds after suspend / resume
>+ * ------------------------------
>+ *
>+ * Most kernel BOs have GGTT mappings which must be restored during the resume
>+ * process. All user BOs are rebound after validation on their next use.
>+ *
>+ * Future work
>+ * ===========
>+ *
>+ * Trim the list of BOs which is saved / restored via TTM memcpy on suspend /
>+ * resume. All we really need to save / restore via TTM memcpy is the memory
>+ * required for the GuC to load and the memory for the GT migrate engine to
>+ * operate.
>+ *
>+ * Do not require kernel BOs to be contiguous in physical memory / restored to
>+ * the same physical address on resume. In all likelihood the only memory that
>+ * needs to be restored to the same physical address is memory used for page
>+ * tables. All of that memory is allocated 1 page at time so the contiguous
>+ * requirement isn't needed. Some work on the vmap code would need to be done if
>+ * kernel BOs are not contiguous too.
>+ *
>+ * Make some kernel BO evictable rather than pinned. An example of this would be
>+ * engine state, in all likelihood if the dma-slots of these BOs where properly
>+ * used rather than pinning we could safely evict + rebind these BOs as needed.
>+ *
>+ * Some kernel BOs do not need to be restored on resume (e.g. GuC ADS as that is
>+ * repopulated on resume), add flag to mark such objects as no save / restore.
>+ */
>+
> static const struct ttm_place sys_placement_flags = {
> 	.fpfn = 0,
> 	.lpfn = 0,
>diff --git a/drivers/gpu/drm/xe/xe_bo_doc.h b/drivers/gpu/drm/xe/xe_bo_doc.h
>deleted file mode 100644
>index f57d440cc95a..000000000000
>--- a/drivers/gpu/drm/xe/xe_bo_doc.h
>+++ /dev/null
>@@ -1,179 +0,0 @@
>-/* SPDX-License-Identifier: MIT */
>-/*
>- * Copyright © 2022 Intel Corporation
>- */
>-
>-#ifndef _XE_BO_DOC_H_
>-#define _XE_BO_DOC_H_
>-
>-/**
>- * DOC: Buffer Objects (BO)
>- *
>- * BO management
>- * =============
>- *
>- * TTM manages (placement, eviction, etc...) all BOs in XE.
>- *
>- * BO creation
>- * ===========
>- *
>- * Create a chunk of memory which can be used by the GPU. Placement rules
>- * (sysmem or vram region) passed in upon creation. TTM handles placement of BO
>- * and can trigger eviction of other BOs to make space for the new BO.
>- *
>- * Kernel BOs
>- * ----------
>- *
>- * A kernel BO is created as part of driver load (e.g. uC firmware images, GuC
>- * ADS, etc...) or a BO created as part of a user operation which requires
>- * a kernel BO (e.g. engine state, memory for page tables, etc...). These BOs
>- * are typically mapped in the GGTT (any kernel BOs aside memory for page tables
>- * are in the GGTT), are pinned (can't move or be evicted at runtime), have a
>- * vmap (XE can access the memory via xe_map layer) and have contiguous physical
>- * memory.
>- *
>- * More details of why kernel BOs are pinned and contiguous below.
>- *
>- * User BOs
>- * --------
>- *
>- * A user BO is created via the DRM_IOCTL_XE_GEM_CREATE IOCTL. Once it is
>- * created the BO can be mmap'd (via DRM_IOCTL_XE_GEM_MMAP_OFFSET) for user
>- * access and it can be bound for GPU access (via DRM_IOCTL_XE_VM_BIND). All
>- * user BOs are evictable and user BOs are never pinned by XE. The allocation of
>- * the backing store can be defered from creation time until first use which is
>- * either mmap, bind, or pagefault.
>- *
>- * Private BOs
>- * ~~~~~~~~~~~
>- *
>- * A private BO is a user BO created with a valid VM argument passed into the
>- * create IOCTL. If a BO is private it cannot be exported via prime FD and
>- * mappings can only be created for the BO within the VM it is tied to. Lastly,
>- * the BO dma-resv slots / lock point to the VM's dma-resv slots / lock (all
>- * private BOs to a VM share common dma-resv slots / lock).
>- *
>- * External BOs
>- * ~~~~~~~~~~~~
>- *
>- * An external BO is a user BO created with a NULL VM argument passed into the
>- * create IOCTL. An external BO can be shared with different UMDs / devices via
>- * prime FD and the BO can be mapped into multiple VMs. An external BO has its
>- * own unique dma-resv slots / lock. An external BO will be in an array of all
>- * VMs which has a mapping of the BO. This allows VMs to lookup and lock all
>- * external BOs mapped in the VM as needed.
>- *
>- * BO placement
>- * ~~~~~~~~~~~~
>- *
>- * When a user BO is created, a mask of valid placements is passed indicating
>- * which memory regions are considered valid.
>- *
>- * The memory region information is available via query uAPI (TODO: add link).
>- *
>- * BO validation
>- * =============
>- *
>- * BO validation (ttm_bo_validate) refers to ensuring a BO has a valid
>- * placement. If a BO was swapped to temporary storage, a validation call will
>- * trigger a move back to a valid (location where GPU can access BO) placement.
>- * Validation of a BO may evict other BOs to make room for the BO being
>- * validated.
>- *
>- * BO eviction / moving
>- * ====================
>- *
>- * All eviction (or in other words, moving a BO from one memory location to
>- * another) is routed through TTM with a callback into XE.
>- *
>- * Runtime eviction
>- * ----------------
>- *
>- * Runtime evictions refers to during normal operations where TTM decides it
>- * needs to move a BO. Typically this is because TTM needs to make room for
>- * another BO and the evicted BO is first BO on LRU list that is not locked.
>- *
>- * An example of this is a new BO which can only be placed in VRAM but there is
>- * not space in VRAM. There could be multiple BOs which have sysmem and VRAM
>- * placement rules which currently reside in VRAM, TTM trigger a will move of
>- * one (or multiple) of these BO(s) until there is room in VRAM to place the new
>- * BO. The evicted BO(s) are valid but still need new bindings before the BO
>- * used again (exec or compute mode rebind worker).
>- *
>- * Another example would be, TTM can't find a BO to evict which has another
>- * valid placement. In this case TTM will evict one (or multiple) unlocked BO(s)
>- * to a temporary unreachable (invalid) placement. The evicted BO(s) are invalid
>- * and before next use need to be moved to a valid placement and rebound.
>- *
>- * In both cases, moves of these BOs are scheduled behind the fences in the BO's
>- * dma-resv slots.
>- *
>- * WW locking tries to ensures if 2 VMs use 51% of the memory forward progress
>- * is made on both VMs.
>- *
>- * Runtime eviction uses per a GT migration engine (TODO: link to migration
>- * engine doc) to do a GPU memcpy from one location to another.
>- *
>- * Rebinds after runtime eviction
>- * ------------------------------
>- *
>- * When BOs are moved, every mapping (VMA) of the BO needs to rebound before
>- * the BO is used again. Every VMA is added to an evicted list of its VM when
>- * the BO is moved. This is safe because of the VM locking structure (TODO: link
>- * to VM locking doc). On the next use of a VM (exec or compute mode rebind
>- * worker) the evicted VMA list is checked and rebinds are triggered. In the
>- * case of faulting VM, the rebind is done in the page fault handler.
>- *
>- * Suspend / resume eviction of VRAM
>- * ---------------------------------
>- *
>- * During device suspend / resume VRAM may lose power which means the contents
>- * of VRAM's memory is blown away. Thus BOs present in VRAM at the time of
>- * suspend must be moved to sysmem in order for their contents to be saved.
>- *
>- * A simple TTM call (ttm_resource_manager_evict_all) can move all non-pinned
>- * (user) BOs to sysmem. External BOs that are pinned need to be manually
>- * evicted with a simple loop + xe_bo_evict call. It gets a little trickier
>- * with kernel BOs.
>- *
>- * Some kernel BOs are used by the GT migration engine to do moves, thus we
>- * can't move all of the BOs via the GT migration engine. For simplity, use a
>- * TTM memcpy (CPU) to move any kernel (pinned) BO on either suspend or resume.
>- *
>- * Some kernel BOs need to be restored to the exact same physical location. TTM
>- * makes this rather easy but the caveat is the memory must be contiguous. Again
>- * for simplity, we enforce that all kernel (pinned) BOs are contiguous and
>- * restored to the same physical location.
>- *
>- * Pinned external BOs in VRAM are restored on resume via the GPU.
>- *
>- * Rebinds after suspend / resume
>- * ------------------------------
>- *
>- * Most kernel BOs have GGTT mappings which must be restored during the resume
>- * process. All user BOs are rebound after validation on their next use.
>- *
>- * Future work
>- * ===========
>- *
>- * Trim the list of BOs which is saved / restored via TTM memcpy on suspend /
>- * resume. All we really need to save / restore via TTM memcpy is the memory
>- * required for the GuC to load and the memory for the GT migrate engine to
>- * operate.
>- *
>- * Do not require kernel BOs to be contiguous in physical memory / restored to
>- * the same physical address on resume. In all likelihood the only memory that
>- * needs to be restored to the same physical address is memory used for page
>- * tables. All of that memory is allocated 1 page at time so the contiguous
>- * requirement isn't needed. Some work on the vmap code would need to be done if
>- * kernel BOs are not contiguous too.
>- *
>- * Make some kernel BO evictable rather than pinned. An example of this would be
>- * engine state, in all likelihood if the dma-slots of these BOs where properly
>- * used rather than pinning we could safely evict + rebind these BOs as needed.
>- *
>- * Some kernel BOs do not need to be restored on resume (e.g. GuC ADS as that is
>- * repopulated on resume), add flag to mark such objects as no save / restore.
>- */
>-
>-#endif
>-- 
>2.41.0
>
