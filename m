Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C819C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 14:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B69B10E92F;
	Thu, 11 Jan 2024 14:52:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE8910E0C5
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704984735; x=1736520735;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hvxbUkaQRcUcylhZ9m4vYFdY+/Isbf6Jz2/sZhADuvg=;
 b=UUYTnigelUri3ShDi9+Kr+JCeB5b5cMw9AC4BSlTx80vuV18PAcb8clV
 2N/yUGu2PjQiMa2gt2Rsr24U0guVUFZMJdgXtk67vXE1B0FSqJ4Wi7ikb
 NTwJ+aCrlBFLVtDuk/vCU59WkwXjzZRViOZ7Mp7E29jqqoI4yhBK1jG3x
 IrCz4IOCboXjUYVIqTjat0i3Qch1rbvTHkRO8JyGeomxRkXmHhrLKooQL
 AIOVt+4hHwv3TuLcyAT7sX4aW8cVYeBj4o5xrXEKvenQTzYDWgM1Z9VC2
 vPXTTh1kraLScw64h8fG6n/SDtz2GhYtaIqV59KBSihKGs7a6QyBO0ODY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="6226630"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="6226630"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 06:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="901583427"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="901583427"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 06:52:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 06:52:09 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 06:52:09 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 06:52:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYZvaIVJZwBUoBrAjm5hvEQ09ry0AOK3MPugAs10avY1A90U8kXH8Pa/IARHHVcVea3ZhUg3UZ+OaISU64+eDyIrU2NvwdRw+f2hydFAnEz1s6eEyfdS7A4uxPLO/1ONM8WrujpSL3WcyYWkb+jZmwlGcEIFKPRuFt/seEVv5rGnC7b+Qx9APwQI+FEHfW7RDTYzwBbonUSTcZMOsekf9BMdGZSYm0y2rI88O/M3z0Xd4jBFAJqn2RDpdqNFP4bMLbvVHy/Hy0oTEuZmdm+4no5bOeOWX6YGq4ab9xKet9YfLw7X28KesA1w6lC9Zje6NFj5RIzKI+FUQM+BKOHD7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xem2tVVGb97UXQUC7FBC+RmacHo0JIucHquM53gXuA=;
 b=Q+SdEd7+JDI794FXozBX9vFGErFSvoja3i2wLWLJf/f5OjuJcsIb31dK38JV+43CJ767HlXBjl3PahCqSKpVSO7InHh9MgGfzSUTutUJ/OQkBQ2ZvKkXlMCDq8dGjWoPRPoJGBvz11c9i26/XgYQJrd61grKN1N3oB2QtJf/HA1rm1yorl5mbJ+Ma3Av3L0sIrEHsrozBSsJ5btC/TnLZfP98Ka5Y4uTlANQl4c45iTaiMs4w7Vx0aTkbQhhEEhwuxuEzRALrMI/NsMq/1ZjEIJ/Dx5npcbiE7mcRvekAAhD5fY1n4OA0FxYRxtz89j8QXCCNDbo4Evu4+aALsxFwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM8PR11MB5574.namprd11.prod.outlook.com (2603:10b6:8:39::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Thu, 11 Jan
 2024 14:52:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 14:52:05 +0000
Date: Thu, 11 Jan 2024 08:52:03 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Add DRM_XE_LOW_LEVEL_TRACEPOINTS
Message-ID: <nzbnpizowkvrsb2g62aashk5ne7kicycifa6kuvrvbgqvznrht@crh6l4ruujnh>
References: <20240105164530.1328374-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240105164530.1328374-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM8PR11MB5574:EE_
X-MS-Office365-Filtering-Correlation-Id: a1424747-f4ee-4410-a0b3-08dc12b4e0b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LEzY2GP0limsPNDjuE2J9E6HQoMp1h4GM+mMNEeERT8X2St08KFARCOaZfN+UIpix09lC3e8fNFnEmSkgmBkh8owG4ifKXevnwmJxQJUD+W5Ap8iEVJvg4WLGvjifSwrw9LTCVp0TKag555cxKPzFTmdbHmCo5duOEK3vWfzL3loGJZsTjUMHW+1scxXIfoqRHkthqvX56eowExocSyLR6m7y/NPKAhp72K6FPhGgOA4Q/kOXClkSmQ4yQyNJVV+GKLbvjSupUEVpzPBAuwPweCYCZiGHJcbwxNkMV0EPrVcZOkLDQ2UJ/GRN8sj9z84mavBKHa8lWR3Ebj14cRVgEzBfT6Dms4ppcagSNBhDp3p3t+p+QG5qDNcadPDfW7LGZmyxeHV/35OfZPm0IfNQPa3k/8yDL89ZtdBBdgN7m3xvd/1wQmSG/D2I7BLIUXkGDVxGrhS3LBVM/fVg7rUXzOM2skmPc1jcUO9HwRJAsa3cR8ucWOvwV2WoqBK5YJORrPavBI2002TtJcEcAQV+GhNogNCCAVlK9k3C1fpesUt8SqfPRUuaYEl0bIVizTK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(396003)(346002)(366004)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6506007)(9686003)(26005)(6512007)(83380400001)(66574015)(41300700001)(86362001)(33716001)(6486002)(6862004)(316002)(4326008)(8676002)(8936002)(5660300002)(2906002)(66556008)(66946007)(6636002)(66476007)(478600001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Rs6x2/6ws9FXcVNQjlSGD+EkbXHyJtLarr1sQUoPgT3nuyHw1dFv9PdOnG?=
 =?iso-8859-1?Q?z31QI1H2ueI70uvPaxZctn4KG9GPbzQvGFMNbqmq0Ie7PqE/w9Nsw6KS+x?=
 =?iso-8859-1?Q?l4wOYWuCmrkloOAUD09kdrgkf+n2pg406qikl18pzbtAzTalXHdB9ioDuP?=
 =?iso-8859-1?Q?1oxqhD2D375MrCC6SF3Oyu6PPn1VoGgZUxqYJZXfoaelJ8P0uue6X20/+Y?=
 =?iso-8859-1?Q?wyv5Tmn6NoDyh74bLgHRPcVSMOOFkk8knmdRcKdNWSTbCacOM+NfJNQbnU?=
 =?iso-8859-1?Q?IwHLL9u/3T8pjUBXggczOYPQJD/jgGk606azFjnFv0Uqkde/3MzFHpb3v8?=
 =?iso-8859-1?Q?xzUit1Hs0t5YRPgR32vQ+hz2wllGpn2FHWSt8OBqNNrbob0wkSw8HsX3nD?=
 =?iso-8859-1?Q?lIkH229DF4kxwyWsQT4Ay8qbWgsXcId63ojQVehpF3qNhiMh5+fC/dm4/J?=
 =?iso-8859-1?Q?rHGxgLi1J+dbbGoE/QdNtDBIqtn7OT3mfnvXUmunhyB2RWgLljeBcdAXqq?=
 =?iso-8859-1?Q?yr22T8Xf7FE/XvDsRzGtz9xGVan45gGGYLscP5w/0SWqFNAy3tcfS/Zug2?=
 =?iso-8859-1?Q?lOG/N5BwHrPP2UnqaRszwbh76h642ce/J3MJMtc0FABoVdhI9fpSy1X5mh?=
 =?iso-8859-1?Q?1O2K7gdcWkL79xAFmfTnahaipjWFv+OaYrlE9dxN8u60aOh4xiyqLQQEb7?=
 =?iso-8859-1?Q?J7RhNP6YnAfllh/bbWoaQ0tc31GEAZAEysHvhtZMy31EtRS6OIMqBVvsko?=
 =?iso-8859-1?Q?laKMRXhuj1vMRn4kdV/1YUgMRinNmFHne5WMbQEURf5+qzis2GsU4Wq/or?=
 =?iso-8859-1?Q?q7uODy9ZXap5DA07uEurwHKJLAEJpkzGy8HT3bpLIzclhOOddabPfcsFfw?=
 =?iso-8859-1?Q?Xq3ZjReFdzvBvNQMcqP1AshIUxOIt1oHv1h2b1eRpm3Q/q8gybtjz8TvL1?=
 =?iso-8859-1?Q?imA79+HW3pn3zeLBQvPbrwHf4+v73mVn3IpAMSz/1QDQ0KjTKX/HHH1Qk9?=
 =?iso-8859-1?Q?QB+1VciDQizPBYf0upJ8WkjjY4oItZzUZInd8ApEJZP73RE7yin0TtWHqz?=
 =?iso-8859-1?Q?bEKLewEVlHNv4+Wd/nFN2cHKiUo5dy7aeQ40ov4x9AtdnkiOVhdFVUgO3h?=
 =?iso-8859-1?Q?hOT1RflLLumKzVPvjVjqn+fAai8misRAQCvmCYfWgcZZBHSR2V2CGIPdc3?=
 =?iso-8859-1?Q?RIJVSH/WTpIuIB5T7LwwRPRASHtGhJWwwdEgLcxxyIyRVCbZ0UW3V/lY5V?=
 =?iso-8859-1?Q?MSVRKf/i25mxWVYrZIvIr5G2eTvZniShh72qbSHOxAaWbF/WeHzJt8Qm5T?=
 =?iso-8859-1?Q?3p4IkCyydu5PRA0PJOB4cFYiwwzIWDLmpgz8BhfQI2xQqr0ycF6d208g1D?=
 =?iso-8859-1?Q?71GdnnXlG4p+xobasBpDZgq2ykXft5cuFO8FUM0//5GrolXQkPtHw0xdK5?=
 =?iso-8859-1?Q?PVCQcVlqyjYbLnRinMz+9C25XYcY6gGh+hTOqXDUhU87bJUa/SUu+7Nx+V?=
 =?iso-8859-1?Q?xdHfgZX7fBmC+tu+48Ksyf2ozvyGFeSrKi55X9rgujqoSRDvKxFMczDnX0?=
 =?iso-8859-1?Q?DV+pPlm52SXqmko7E0AZC3yIw8WmpVDVmpovp4ENvyGi24os1cYl07uwK/?=
 =?iso-8859-1?Q?DaSRyDifMZNzH8zK2mNf5G7N/a3DFu0nifXpvOMBq3RZKySKH++4YkPg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1424747-f4ee-4410-a0b3-08dc12b4e0b3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 14:52:05.6133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCq+6gRvfybDrzvXxDwdREJsOHBwBdhTH+tgc851+sfj5x1XVABZ1QjoUC+L6MJTcPr5Jl1qoyZQW4rYLvk+menM4qrn1v23s+XfiGjj43M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5574
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

On Fri, Jan 05, 2024 at 08:45:30AM -0800, Matthew Brost wrote:
>Trace events are uABI. The Xe trace events currently implemented are

  ^^^^^^^^^^^^^^^^^^^^^

Reference needed and from all previous discussions I've seen, this is
debatable because of the way tracepoints are implemented: tools should
read what are the supported tracepoints for the running kernel and read
the format it uses before blindly using it.

If it was simply UABI and couldn't change like it's implicit here,
moving it behind a config option wouldn't really change that.
The distro may have chosen to enable that config and end
users making use of that. 

Just looking at the latest pull requests for 6.8, I see several
tracepoints changing signature without regard to uabi.

2dd6e29a3ea8 ("svcrdma: Update some svcrdma DMA-related tracepoints")
848760a9e701 ("svcrdma: DMA error tracepoints should report completion IDs")
c13fbb7de2fc ("bcachefs: Improve would_deadlock trace event")
f6e70c59edee ("nfs: print fileid in lookup tracepoints")

>developer only and subject to change. Hide all Xe behind
>DRM_XE_LOW_LEVEL_TRACEPOINTS so these are free to change going forward.

I'm not against moving them behind a more advanced config option,
but the justification above would need to be reworded.

Lucas De Marchi

>
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig.debug |  10 +
> drivers/gpu/drm/xe/Makefile      |   4 +-
> drivers/gpu/drm/xe/xe_trace.h    | 339 +++++++++++++++++++++++++++++++
> 3 files changed, 352 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>index 549065f57a78..a8785e71e224 100644
>--- a/drivers/gpu/drm/xe/Kconfig.debug
>+++ b/drivers/gpu/drm/xe/Kconfig.debug
>@@ -105,3 +105,13 @@ config DRM_XE_USERPTR_INVAL_INJECT
>
> 	 Recomended for driver developers only.
> 	 If in doubt, say "N".
>+
>+config DRM_XE_LOW_LEVEL_TRACEPOINTS
>+       bool "Enable low level trace events"
>+       default n
>+       help
>+         Choose this option to enable low level trace events.
>+
>+	 Recomended for driver developers only.
>+
>+	 If in doubt, say "N".
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 53bd2a8ba1ae..9d33e6975ba0 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -129,7 +129,6 @@ xe-y += xe_bb.o \
> 	xe_sync.o \
> 	xe_tile.o \
> 	xe_tile_sysfs.o \
>-	xe_trace.o \
> 	xe_ttm_sys_mgr.o \
> 	xe_ttm_stolen_mgr.o \
> 	xe_ttm_vram_mgr.o \
>@@ -142,6 +141,9 @@ xe-y += xe_bb.o \
> 	xe_wa.o \
> 	xe_wopcm.o
>
>+# trace support
>+xe-$(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS) += xe_trace.o
>+
> # graphics hardware monitoring (HWMON) support
> xe-$(CONFIG_HWMON) += xe_hwmon.o
>
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index 95163c303f3e..7163ac9b8eae 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -21,6 +21,7 @@
> #include "xe_sched_job.h"
> #include "xe_vm.h"
>
>+#if defined(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS)
> DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
> 		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> 		    TP_ARGS(fence),
>@@ -597,6 +598,344 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
> 			     __entry->tail, __entry->_head)
>
> );
>+#else
>+#if !defined(TRACE_HEADER_MULTI_READ)
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_create(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_work_func(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_cb(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_send(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_recv(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_gt_tlb_invalidation_fence_timeout(struct xe_gt_tlb_invalidation_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_bo_cpu_fault(struct xe_bo *bo)
>+{
>+}
>+
>+static inline void
>+trace_xe_bo_move(struct xe_bo *bo)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_create(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_supress_resume(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_submit(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_scheduling_enable(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_scheduling_disable(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_scheduling_done(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_register(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_deregister(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_deregister_done(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_close(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_kill(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_cleanup_entity(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_destroy(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_reset(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_memory_cat_error(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_stop(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_resubmit(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_exec_queue_lr_cleanup(struct xe_exec_queue *q)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_create(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_exec(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_run(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_free(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_timedout(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_set_error(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_job_ban(struct xe_sched_job *job)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_msg_add(struct xe_sched_msg *msg)
>+{
>+}
>+
>+static inline void
>+trace_xe_sched_msg_recv(struct xe_sched_msg *msg)
>+{
>+}
>+
>+static inline void
>+trace_xe_hw_fence_create(struct xe_hw_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_hw_fence_signal(struct xe_hw_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_hw_fence_try_signal(struct xe_hw_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_hw_fence_free(struct xe_hw_fence *fence)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_flush(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_pagefault(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_acc(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_fail(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_bind(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_pf_bind(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_unbind(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_userptr_rebind_worker(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_userptr_rebind_exec(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_rebind_worker(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_rebind_exec(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_userptr_invalidate(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_usm_invalidate(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_evict(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vma_userptr_invalidate_complete(struct xe_vma *vma)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_kill(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_create(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_free(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_cpu_bind(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_restart(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_rebind_worker_enter(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_rebind_worker_retry(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_vm_rebind_worker_exit(struct xe_vm *vm)
>+{
>+}
>+
>+static inline void
>+trace_xe_guc_ct_h2g_flow_control(u32 _head, u32 _tail, u32 size, u32 space, u32 len)
>+{
>+}
>+
>+static inline void
>+trace_xe_guc_ct_g2h_flow_control(u32 _head, u32 _tail, u32 size, u32 space, u32 len)
>+{
>+}
>+
>+static inline void
>+trace_xe_guc_ctb_h2g(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)
>+{
>+}
>+
>+static inline void
>+trace_xe_guc_ctb_g2h(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)
>+{
>+}
>+#endif
>+#endif
>
> #endif
>
>-- 
>2.34.1
>
