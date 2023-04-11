Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FB5C76196
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 15:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA20E10E58F;
	Tue, 11 Apr 2023 15:23:07 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1025910E58F
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 15:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681226586; x=1712762586;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rCEd4Q5jK3sMWAgeq61NUGmn3e6fgQf0QibtL+oNVKA=;
 b=MGSQwBJ6Bhinp5/x1tYyqjOIFn0/BJ/lMJmX+nBIKDrN3Xu7/BHTU80L
 17O06vleyrcxYBMaaoPtnE28pEdkb7/lcS9ituesorEfKUzPEB+vOqiNR
 VB2Fy3Zqe/PJh30FEWczVOJe5n0o6Sx7WTmiz3l6YLnMGdkuwkJQGc39R
 X8QsEAQWf4eXW/QcPdfKlqg8PkQ6hhy5WCP14VaLPvXOwLxL9BSn0z6BA
 7AUJnoR90QLjd8cPik9fCbo3L7z/6E37s4vXvaw9X2u4anU4xhe08JDlN
 pm5PrxKFSIpYrm7O5o8Rl0/UuM+806HWKheEzCrfpGj1GEgqmEKDNJZcm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="408786446"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="408786446"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 08:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="721219508"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="721219508"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 11 Apr 2023 08:23:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 08:23:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 08:23:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 08:23:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfWvOajaLrO4RrSeP93VoEtSRGGdjbiYpS9Mccxafzng0razOe4ZqLwvoIX8QV62mJ75E4wy7YSfMQltT/8vYAFAFz/bxRZrmepCHCl7G7HOT72b+maEbPomv8JS13V4l/k4TJ/XKixA7ayaoNWP4Eqqo3o7m3vIkBpeADt/j8W87QQLr9P+A8VzXTDUnUHS4Sy5ovpZKjbdAF1s4DHDlWk58IOrpTZEKOT3tcfSIioLCZqT9OBsAIHIKDlQudpEB8d70dOz2MfAz8X2meeEeBL6WT/Mg4ICLKaHax9klohD2Ade85//2HItGBxhBcaBLjMHAL3aufqbhcKkAwDKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYuX+5nXMset7SkA33e4rkzIwa1LtWqcTefaGIJZQcY=;
 b=oCzVrt0D8so0IibdnJgbIel83SCs+32DcORNQoOhJjRQVmfff25KtXc1rKn+1GwyqrWcDcw4v3jJ4dcnMmo9IzdAoYi5AS/VqvfxSpe1T7V02fgpD8el5fBSd9YlPNoaMG+cE75KFKd5nxHZRhaP69ICgIdhoYI4+c/A7k07u/4Gd8x9zsm7SEnn1nJJzFlI6Am7h7ROFQ0x+EDcAR35WnbPJTSkaDtfLTYZ+j9z8jadomgRI7GGSsM30BACcnSoaAmHlGq+4qFxEkk+ze/a5ilv7B8Va+AuEuWtFfzxHPAzIqL9ydYYpUBNtsWAj1B6L0Ntp332uazeXdP7JzFpcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7778.namprd11.prod.outlook.com (2603:10b6:930:76::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.35; Tue, 11 Apr 2023 15:23:02 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 15:23:02 +0000
Date: Tue, 11 Apr 2023 08:22:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230411152259.GW4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230410183910.2696628-1-matthew.d.roper@intel.com>
 <20230411070133.byyciicbo4a7z3qt@ldmartin-desk2.lan>
 <87leiyetsa.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87leiyetsa.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0162.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c3de70-7ecc-4945-62ff-08db3aa0a38f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Cc+borbgV2i9izTSMH8pitvCxCZDrBbp7siCC3AOyO1+osYPdTg3GXZuDaEvDVck6cR5bblsdQM2O3Pj8HAWi0HDLm/lhsfrU2muIt+1sJRjr6Ld1yLtw0xzXGe+rvEhRNavKY7uQoSEQgq765wjhB8liAms/u++UehgifXsDhCOOIhgr2IPYdH5Uo3un0kQeKFX2A4pPGVLq/o4UxKDD1rAnqX3l+P+P0WPBVa1ZcHACzYr7rqD5ZalSaJo4sHR9c8jFES8ObTAZzz8O+M4oaLC5fY4SrM21ZybzTiTmDHiImMqoHh9oP0KacJR0gVtYtHhbJQuviJdpBv/tCPOGWlxSstIlY/xrrZ2FXkf5GJQFjMuSQ/xG0Vw7jkEUlNt7S7nnD7h1+Uks3/oRm7oO6n0uk4nK6fZl7DuthUFpkyGPlgPnBbljPbSu3Cb0A+SRmp+iXCt1Le2bsFjAXNdBo083t/2Sj3U+R5AYlAPeVmMESQB1lRQa/Ks5VX3xPDCauJ/a3cm/zriIe81AOeg5FKg0BofUSc3tj+0h7ucZdeh5aDkOKgGB47VkWKr5tk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199021)(41300700001)(5660300002)(478600001)(38100700002)(33656002)(8676002)(8936002)(82960400001)(83380400001)(2906002)(186003)(1076003)(26005)(86362001)(66946007)(4326008)(6916009)(6506007)(316002)(6512007)(66556008)(66476007)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sd11aAzBFZEehGIOer6L0XohMJmghF3ZFvS9Wk8ycsgH/H4XzWfvl6rY9hgT?=
 =?us-ascii?Q?H4LciJdfa2PpXNJWxYhbLe979CjjyxiOtfbXq9qzbp8uGFeHfaGDapdpnz0V?=
 =?us-ascii?Q?lW66HbJMhVe1zT0ag8FaLOTU56XkcHi/8AQ3Qtzd1jvwndaVkI0tW7mAO73Y?=
 =?us-ascii?Q?PRNbsb9TUS5hKm1hZ5NeH/Tfyf0f+ISLDzSbo1WpPZ2SgL7DS+4qFRkdk4Wc?=
 =?us-ascii?Q?N9ebW391Cmz/y7jTX/Yu54MK+Kk1VwfIhNIgm4BLM5hcbz2B7hHiSxKtdb3P?=
 =?us-ascii?Q?nhBYBEdVOuQ/bqXHPkZ2/2AiJh3In2gFvBH5LazaSXNltBsJQdOYaQYnBoP6?=
 =?us-ascii?Q?evxugyqHvnATYNLZMKi6SGYuH19mqX56t90QH9YU0B834aPJfF5bcIfdEDM8?=
 =?us-ascii?Q?ZIw8z7kZKtKnPo1haHiSnlezxxstHexhwdcnqsr/HrHw7voGHX1F38SsD5i7?=
 =?us-ascii?Q?u+rIfMIwcky08x9dtS/bTSlg3OF3lJvdvl9kkRQaJD5XSAqBNsaBXkk7dVYe?=
 =?us-ascii?Q?jpO1zKOJPoz5Qda/cLL7kAdVghSs7dfyvUiAawKz1XiPa5zWVh95gFDWmBlh?=
 =?us-ascii?Q?H7pG1DrAs4S3OAQtf43UL1473288S4KVK0lE0AI2wufbSusfVcMz1RyBK2z/?=
 =?us-ascii?Q?qNQkld3t6gQtupOFazogu13M4r23NdjmN+pNnwbAVQ9PRoGQLfRPYAoPpWo9?=
 =?us-ascii?Q?WyN1Wk1Yskl1R0BPztOTA4hXA6xYPF5yabObuSHI0wcN2l1m7oSOPfWh5kyT?=
 =?us-ascii?Q?y0+GOxKj7xhdW3mj7ui+cq7tNAaKs1sL8jmeEtADOYRt6LmONhRknRUk4Ukt?=
 =?us-ascii?Q?q4cTka3RYjCU1SXZwnsTF+5c2Sk7WBYzOJ6ER3wefMcvAg0s09nrDB3EcUjD?=
 =?us-ascii?Q?B3+tXEXrSBQ1x6pwU2guTUI9/ZPwBE70nCNS+PDzE0YD2cxWN4c5dBIPWsAc?=
 =?us-ascii?Q?p66Y2PV0PiuuuCws90Y01iPyfCwKlIOFoQeVf7N2DxD/QLAarM69yAXqK4CL?=
 =?us-ascii?Q?v6AXr/YxKi0S1slBhBbXdSdePDAMrKRNlI9i5pZDf/wE9sn7ufB3XKUnhxN9?=
 =?us-ascii?Q?H5NnYmXIWtdLKoukAN43Aw6I7etQyPCUzsK8CwEf0Fn/cGil+Sy+j+FCl1jA?=
 =?us-ascii?Q?YDHO/iGhLIykH9Scn4ZZv+PaZJKmuZtu21t7q616M577oZ+f8LHRTBz2DGQ3?=
 =?us-ascii?Q?rESgHH2q9BPvLCXLMHdtQTpa9tH1YaA5Y3D1G843gUSvGNTraaZNmRdwAq/k?=
 =?us-ascii?Q?jhkKr9RNo21avCUCWKe+AFVxt/hdggbTsuYIdTFflBhrK8hCQ9xMAMRBuySJ?=
 =?us-ascii?Q?mynI4zqgGUncrSJZGX2/jUXyFMgWkBhnJ0UR/fBIJUG0OYguL2b2LhoqkrQl?=
 =?us-ascii?Q?5EYYf/pE8xsxXoq3qWkfAyLkuEnSv0cHqQtWxn22YRQZLjNQBCrPUyZPgOs8?=
 =?us-ascii?Q?F/XPUHe3RWoWoHyjDDDn6hde/nmgDUAVPOUTqMmPURHbD7zeoKHq7oREkszy?=
 =?us-ascii?Q?ghZuth6oVmFqEAgEAZ539Om4jijp0+zoBCFtUxJ5n2Scy7IoM3G8+QIXBmml?=
 =?us-ascii?Q?Tt2eU26CjL1meRCjuTio12Erq55/dXETsw/2Hna6MlTxv6WEjaFxzFSwyeRG?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c3de70-7ecc-4945-62ff-08db3aa0a38f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 15:23:01.8560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcdyztqMP0pt83C0mD9qOK5OJsIgOwwC6gPNPgOhocbYzjcFLc+uB/yaYWT4v6RXm2P63zcnYrjsOjiqctByoZWdKb9CaWmIfqFCNheXI2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7778
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Use packed bitfields for
 xe->info feature flags
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 10:56:37AM +0300, Jani Nikula wrote:
> On Tue, 11 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > On Mon, Apr 10, 2023 at 11:39:08AM -0700, Matt Roper wrote:
> >>Replace 'bool' fields with single bits to allow the various device
> >>feature flags to pack more tightly.
> >
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >
> > but a  digression:
> >
> > for structs like the descriptors in xe_pci.c, this justification is
> > enough as we will be maintaining several of those as they extend to
> > each platform. Also the access to struct members is contained in
> > one place.
> >
> > However this reasoning can't be generalized to structs like xe_device,
> > that has one allocated per device. The gain should be very minimal if
> > any at all.
> >
> > 1) Each place accessing one of these fields will have more
> > instructions generated to use the right bit although in most cases
> > the compiler should swap a cmpb with testb since we are likely just
> > checking if the feature is available or not.
> >
> > 2) It also limits the ability to pass them by address.
> >
> > 3) We also need to be careful when changing
> > bool -> u8 as they don't have the same semantics in cases like
> > `b = true; b++;`, which may not be obvious in some cases.
> >
> > for (1), the pro/con should be really small, (2) we should get a
> > compiler error if we tried. But for (3)... we need to check all the
> > fields we are converting to make sure this doesn't introduce bugs.  I'm
> > on the fence on the need for this change, but I'm ok with it.  I double
> > checked all the members in the struct and didn't find use cases that
> > would introduce a bug, hence my r-b above.
> 
> bloat-o-meter results with both might be interesting, for code and
> data. Does the data saving matter if we bloat code more?

bloat-o-meter indicates that the code size reduces:

        Total: Before=330210, After=325432, chg -1.45%

Does packing these let the compiler combine multiple feature flag tests
into a single instruction (e.g., HAS_FOO(xe) && HAS_BAR(xe))?

size:

   text    data     bss     dec     hex filename
 467248   66607     880  534735   828cf drivers/gpu/drm/xe/xe.ko.orig
 458855   63394     880  523129   7fb79 drivers/gpu/drm/xe/xe.ko


Matt

> 
> BR,
> Jani.
> 
> 
> 
> >
> >
> > Lucas De Marchi
> >
> >>
> >>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >>---
> >> drivers/gpu/drm/xe/xe_device_types.h | 21 +++++++++++----------
> >> 1 file changed, 11 insertions(+), 10 deletions(-)
> >>
> >>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> >>index f5399b284e3b..9ce6e348dd29 100644
> >>--- a/drivers/gpu/drm/xe/xe_device_types.h
> >>+++ b/drivers/gpu/drm/xe/xe_device_types.h
> >>@@ -67,8 +67,6 @@ struct xe_device {
> >> 		u32 media_verx100;
> >> 		/** @mem_region_mask: mask of valid memory regions */
> >> 		u32 mem_region_mask;
> >>-		/** @is_dgfx: is discrete device */
> >>-		bool is_dgfx;
> >> 		/** @platform: XE platform enum */
> >> 		enum xe_platform platform;
> >> 		/** @subplatform: XE subplatform enum */
> >>@@ -87,22 +85,25 @@ struct xe_device {
> >> 		u8 tile_count;
> >> 		/** @vm_max_level: Max VM level */
> >> 		u8 vm_max_level;
> >>+
> >>+		/** @is_dgfx: is discrete device */
> >>+		u8 is_dgfx:1;
> >> 		/** @supports_usm: Supports unified shared memory */
> >>-		bool supports_usm;
> >>+		u8 supports_usm:1;
> >> 		/** @has_asid: Has address space ID */
> >>-		bool has_asid;
> >>+		u8 has_asid:1;
> >> 		/** @enable_guc: GuC submission enabled */
> >>-		bool enable_guc;
> >>+		u8 enable_guc:1;
> >> 		/** @has_flat_ccs: Whether flat CCS metadata is used */
> >>-		bool has_flat_ccs;
> >>+		u8 has_flat_ccs:1;
> >> 		/** @has_4tile: Whether tile-4 tiling is supported */
> >>-		bool has_4tile;
> >>+		u8 has_4tile:1;
> >> 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
> >>-		bool has_range_tlb_invalidation;
> >>+		u8 has_range_tlb_invalidation:1;
> >> 		/** @has_link_copy_engines: Whether the platform has link copy engines */
> >>-		bool has_link_copy_engine;
> >>+		u8 has_link_copy_engine:1;
> >> 		/** @enable_display: display enabled */
> >>-		bool enable_display;
> >>+		u8 enable_display:1;
> >>
> >> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> >> 		struct xe_device_display_info {
> >>-- 
> >>2.39.2
> >>
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
