Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A86C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 16:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C925D10E6D7;
	Fri, 12 May 2023 16:20:12 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8E410E6D7
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683908411; x=1715444411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5CQDLxC65iM71MOdRrvHeQzlqmquiZwQdAtOhswZZbw=;
 b=b8OQL8keR8V7zmeCoFyVhd6+CaudduplS38tgPFPGH9JA3j8sYvBU/bN
 uObq3ejuw7xnI7daTZWIEx+t0WvBce5ZxfkS/5yTmMe8gGD1gBbBROzK/
 F7UES9Jh5lk7AJ+O/Wg2gCM+e8bX+hTJsqjy8grOsSkM21079d6gVgPK9
 lin8AbKc8Np3DS3Yii1kIibeQWD4ATC0bLV8WPP22zb8a8WbqUJRD1oTb
 umjgitn1FzwmaE3gq7zfl2I4+vHYO1gZEH7vDv5DIv6L9rxxl3woVkuJc
 i9Z92hDAPwr1N4Gl/bnC+0Tk0A/DqVxJCLInZc6i8whcl/R3JxWkSqG6G w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349665403"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="349665403"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 09:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="946681915"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="946681915"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 12 May 2023 09:20:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 09:20:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 09:20:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 09:20:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1aE13ml4KanqR0WwHhvoFZZ1/LAWTIYJUUe8CO6A/dQWF//udE8ndbAhMbG6JZcl7KisS53T/tyV7hxgPwz8RFqcHTNmazAAB6+up0PesccQrAXXo1I3VKO/yKJ4cLhI2J+/i9z5ewn9CEVF27j8UCtAd49z6j6C8XTN5gjA2w9ZKGG0bZbA8IC1xVBi/YYDoFRxfSvEwZiqPtF3JXBm/rXJclQU2/LpjV/YTbhfDRNKJffBZzsD6rBKi178xQKPN1gP7u73PXb0a6HPg3z42kDbq7bILXrMsN6KfcIPvbmq440OuKNV4pjOF5ZgUEe/GhN16qeQbC/zKOWyg+dcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xLts5rz5TQDSOMoXOxS/v7eVR+MzS6JxRW0MO8e8w8=;
 b=FQ3aSdhdmM63YmMybVPvYaBOYat8ugvwUbMxntZbebeVwptxBws2NbSOnrI1tJtLZ8QBG1FyA04VTxpsEnVXYqNMlCbnrfAAbJm1NgfIwhWbTiFoOieeyYnanAvMmq3oR4qRxoAZbFwnFk1H6tkW9KXzqzgLZWQUWkrp6Z4aTvXh5VNRtyrkM3eUy5lnpHFASd7HULbrGdIZZ3Ily/bAJpMGko9WzdUHVX238aj1zya4ADCIdxdV5vO/Xp7VNXo73QTrHpwboUvwGTXnUrl65Uxcn7FJb8e6eBlcXqecXw3ERhfs9vGYvtl5aEHou/kbsr6P9mpI2IYJwLgduz2x7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB5187.namprd11.prod.outlook.com (2603:10b6:303:94::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.20; Fri, 12 May 2023 16:20:06 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 16:20:05 +0000
Date: Fri, 12 May 2023 09:20:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230512162002.GB10045@mdroper-desk1.amr.corp.intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-4-matthew.d.roper@intel.com>
 <qf2idx37zw7ss2s4lp6zpfomk4v3q6jid3iqfnnxi4avyh6med@qa3htrgeal4n>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <qf2idx37zw7ss2s4lp6zpfomk4v3q6jid3iqfnnxi4avyh6med@qa3htrgeal4n>
X-ClientProxiedBy: BYAPR01CA0001.prod.exchangelabs.com (2603:10b6:a02:80::14)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a986c25-fa03-4ad4-2acb-08db5304be83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hReva/l1RPMoL4mo030kE8498cDGADhxkx4QbZ0gemlnLa+b9j9WO9tlJ/kKY7JeJ6Y5Z0e43kMVzs/g2iYeIzsfvRzgk5hCXqcqES/hQfupP9Z/+xEGwtJk4qgkPiYyTPa071uyhnuCJdIUOuHmsJIsPmsMES1BBMD861+j4envALOsfijOyw3yyD+HSYcgBUVmroRujP3mLmfrLym4pkzZBK+OfRbZ8kb9k5Znymxu/rYDZrepbP6bOnCm7Aur+ANKtwOiEserxIWKJaZ9+cnO5KIXwzWrzkhQymLvFn6ccSdEpzyhS8UppRhu4UTIdXxHvAW3HQK3dBeNaO5XQj9VbKuW4DFqm/CGvv2hGuPis/9nNiM8Dxjijifg9Oa+jpC5mnfL71k3vnaNUWOHKXayjv6KYT2UGog/0PkLyYEus32TsTyGrXuEdskp6W3wW99Oi7VsABeljEJ6pLW+LXt7JoICCs28sinLLL7Cn0jAEwnDLiwhfphX5uen3HoC0ADJy7frgx3Fsob8nRFsqbNETZpjYA2EYSOlbrSp1Q1TMFuNzMH6gRkkIknPh+el
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(316002)(478600001)(86362001)(6486002)(6666004)(6636002)(66556008)(4326008)(66946007)(66476007)(83380400001)(8676002)(41300700001)(33656002)(8936002)(38100700002)(6862004)(82960400001)(26005)(2906002)(186003)(1076003)(6512007)(5660300002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oEMe3ypG7qkHiKVV8I9kx7FNDJus44rtycZEKYLEbzaFHJsGxMZg35nOzJTA?=
 =?us-ascii?Q?9Ptbp+G/OOQcuFVOTD3PDkMlrW40rp0OaoFP4JR86n9GFhQZhXaVgvYvE+qW?=
 =?us-ascii?Q?AjgOhq6PRGVresfGylQfc+40ppIblE25FHXxdGrxCM3zkyPjCQEhRjuCKN2Y?=
 =?us-ascii?Q?1p/8uOYow60LGcaV2VBV7VyW1qJGhWSH8uO1bgbNUpMuCqFfzBYWP/4hFfkn?=
 =?us-ascii?Q?5BUApz/tJ+4VnxyxnPd91OFArsmUbgjiT4ptqxxNTDgkuf5JBq80JLCYoftz?=
 =?us-ascii?Q?For1hAa1+uIvUkBLaDKQRQpYxe5fz26KByKeAO3c8tJcj9I26q5ipYXtMAW4?=
 =?us-ascii?Q?ePrrR5+SoVpH3qC/7LnkOSBG7DNEBIkCZF6CW9gsXGc+stUFBMbCpy4ljr/+?=
 =?us-ascii?Q?8ZhF+GLtIy3aPFjW03Akfi8IQXTllbyGovaGkMAOFryvv4PYQ+r6zjrNMz64?=
 =?us-ascii?Q?cJZ1iW3kpJjEe12L68q6ykQWc9BZ4KHN1spCPz5J2MrgNhAA64A3uYobXA8E?=
 =?us-ascii?Q?71TIX6jqBXNl0Iazkceq6q6uyth5rG338DoMjmmq2MCmM+n61Va19KcdXs3D?=
 =?us-ascii?Q?LltjQlID5QBdTh9mqTcDv4r2Q3XrpStrakerdA/L81glZirhZkLB1aTnkjBC?=
 =?us-ascii?Q?+4QzGlOxme7KtwSwXDUd+XY7f722U3OM/gJjEBEMxNFKYxDglCaSs+6UUuWq?=
 =?us-ascii?Q?ygeV3leJx9W2Coe0W0LdjAcrJcG/amhh2TtfR1OcMA9deIWndfVE+Ln0xR32?=
 =?us-ascii?Q?4+OmpHlQm3I2wKg4EP1WaOkzNeZIR8hnqSzrkDcnT0FJmI60MHVVYhqCbUgk?=
 =?us-ascii?Q?uuTSRtWtih0gJxm0Vwo1clkqX+NAzXwXPjPJ9edKU/oA2Psmr75NJ/tO7Zt0?=
 =?us-ascii?Q?qeQtcSrheLZFrCJAOLPxvPDFwMjSIpBLd8m8z6EuYrB25giE0WvrEqJx96eh?=
 =?us-ascii?Q?jt3p3olFJ3+pfyhnaF6Ty9h9LhNI1eZkF1DW70uy4zpDAIguJmW1j+c7h3fv?=
 =?us-ascii?Q?mV/DV+fsAre/edWooli0yWSg/QHM5GTPoVgCqbALbEXt4Ngio2eS5FQvOFx3?=
 =?us-ascii?Q?swDeQb1OxbSDANCv8Oze765U/ha0jkAko5Ek9lsR1CCvVbh9xGEdrs9ubXku?=
 =?us-ascii?Q?2DLvleFk0zvRxPutTT+2ypQKYmbqj4AxkcapGQe+p0KCRlG0y0px10HvoGEY?=
 =?us-ascii?Q?2L7NYuetIuNSw10zPTchU6i8oNgreY3U6hAz92HVkgfLyMU7VoXsfYnaJ2+I?=
 =?us-ascii?Q?WcuDOJ07zbxTIor12BL/ExqUw+VzKMmm3ttLrD5AugjIviYqlGPQs62SNZMC?=
 =?us-ascii?Q?xeaAocRsmzyn6EyfCGMC4zmRAkyf4y8uC2KavXuykwernjP9E0S6ufrL9daX?=
 =?us-ascii?Q?828RNAhlLj9sQvtYMLQHTCEV14sxQ2MMBIDIx7UYX3LxdvaC3wC5rCB1G4K1?=
 =?us-ascii?Q?29EhEVkkxCrxIpdWZCnSsXs0LghGWeo0iaABYTwEgaqLd4H+wC4dZjlOs+wM?=
 =?us-ascii?Q?HxIm703W9KZtHmi+0CfeETBhFjqaqAIW84X53YApxzQWS+9S3ZGOnwE/ns7h?=
 =?us-ascii?Q?f4bJ2yWAVbNax1k2oY1lVXYPwv3E0DNsAhFDkeWJhFYS+dETxe88UQ/n5vSG?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a986c25-fa03-4ad4-2acb-08db5304be83
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 16:20:04.7283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqmSuXOrKIeDlm9P9MMYbrEhRyI96R10RQjiDz/X8e/OKB9YEYZWW7BVz1hCNUV6DpwctHanr77NMRz2YBqQpQDQlDEgXLXv+widEIQkLCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5187
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 03/26] drm/xe: Add backpointer from gt to tile
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

On Thu, May 11, 2023 at 05:07:46PM -0700, Lucas De Marchi wrote:
> On Wed, May 10, 2023 at 08:46:59PM -0700, Matt Roper wrote:
> > Rather than a backpointer to the xe_device, a GT should have a
> > backpointer to its tile (which can then be used to lookup the device if
> > necessary).
> > 
> > The gt_to_xe() helper macro (which moves from xe_gt.h to xe_gt_types.h)
> > can and should still be used to jump directly from an xe_gt to
> > xe_device.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_bb.c                  |  2 +-
> > drivers/gpu/drm/xe/xe_gt.h                  |  5 -----
> > drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  4 ++--
> > drivers/gpu/drm/xe/xe_gt_types.h            | 14 ++++++++++++--
> > drivers/gpu/drm/xe/xe_mocs.c                | 14 +++++++-------
> > drivers/gpu/drm/xe/xe_pci.c                 | 11 +++++++----
> > drivers/gpu/drm/xe/xe_pt.c                  |  2 +-
> > 7 files changed, 30 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> > index 3deb2d55f421..bf7c94b769d7 100644
> > --- a/drivers/gpu/drm/xe/xe_bb.c
> > +++ b/drivers/gpu/drm/xe/xe_bb.c
> > @@ -16,7 +16,7 @@
> > 
> > static int bb_prefetch(struct xe_gt *gt)
> > {
> > -	struct xe_device *xe = gt->xe;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > 
> > 	if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
> > 		/*
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 086369f7ee6d..f4e98f499b36 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -49,11 +49,6 @@ static inline bool xe_gt_is_media_type(struct xe_gt *gt)
> > 	return gt->info.type == XE_GT_TYPE_MEDIA;
> > }
> > 
> > -#define gt_to_xe(gt__)								\
> > -	_Generic(gt__,								\
> > -		 const struct xe_gt *: (const struct xe_device *)((gt__)->xe),	\
> > -		 struct xe_gt *: (gt__)->xe)
> > -
> > static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
> > {
> > 	struct xe_device *xe = gt_to_xe(gt);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index c815a42e2cdb..c9e8825c02aa 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -322,8 +322,8 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > 		TLB_INVALIDATION_SEQNO_MAX;
> > 	if (!expected_seqno)
> > 		expected_seqno = 1;
> > -	if (drm_WARN_ON(&gt->xe->drm, expected_seqno != msg[0])) {
> > -		drm_err(&gt->xe->drm, "TLB expected_seqno(%d) != msg(%u)\n",
> > +	if (drm_WARN_ON(&gt_to_xe(gt)->drm, expected_seqno != msg[0])) {
> > +		drm_err(&gt_to_xe(gt)->drm, "TLB expected_seqno(%d) != msg(%u)\n",
> > 			expected_seqno, msg[0]);
> > 	}
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index e0ed4508269b..c4376d50786b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -76,6 +76,16 @@ enum xe_steering_type {
> > 	NUM_STEERING_TYPES
> > };
> > 
> > +#define gt_to_tile(gt__)							\
> > +	_Generic(gt__,								\
> > +		 const struct xe_gt *: (const struct xe_tile *)((gt__)->tile),	\
> > +		 struct xe_gt *: (gt__)->tile)
> > +
> > +#define gt_to_xe(gt__)										\
> > +	_Generic(gt__,										\
> > +		 const struct xe_gt *: (const struct xe_device *)(gt_to_tile(gt__)->xe),	\
> > +		 struct xe_gt *: gt_to_tile(gt__)->xe)
> > +
> > /**
> >  * struct xe_gt - A "Graphics Technology" unit of the GPU
> >  *
> > @@ -90,8 +100,8 @@ enum xe_steering_type {
> >  * within a tile.
> >  */
> > struct xe_gt {
> > -	/** @xe: backpointer to XE device */
> > -	struct xe_device *xe;
> > +	/** @tile: Backpointer to GT's tile */
> > +	struct xe_tile *tile;
> > 
> > 	/** @info: GT info */
> > 	struct {
> > diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> > index 817afd301d52..d57fbf16a3ef 100644
> > --- a/drivers/gpu/drm/xe/xe_mocs.c
> > +++ b/drivers/gpu/drm/xe/xe_mocs.c
> > @@ -471,7 +471,7 @@ static void __init_mocs_table(struct xe_gt *gt,
> > 	unsigned int i;
> > 	u32 mocs;
> > 
> > -	mocs_dbg(&gt->xe->drm, "entries:%d\n", info->n_entries);
> > +	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> > 	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
> > 		      "Unused entries index should have been defined\n");
> > 	for (i = 0;
> > @@ -479,7 +479,7 @@ static void __init_mocs_table(struct xe_gt *gt,
> > 	     i++) {
> > 		struct xe_reg reg = XE_REG(addr + i * 4);
> > 
> > -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
> > +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
> > 		xe_mmio_write32(gt, reg, mocs);
> > 	}
> > }
> > @@ -508,13 +508,13 @@ static void init_l3cc_table(struct xe_gt *gt,
> > 	unsigned int i;
> > 	u32 l3cc;
> > 
> > -	mocs_dbg(&gt->xe->drm, "entries:%d\n", info->n_entries);
> > +	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> > 	for (i = 0;
> > 	     i < (info->n_entries + 1) / 2 ?
> > 	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
> > 				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
> > 	     i++) {
> > -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
> > +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
> > 			 l3cc);
> > 		xe_mmio_write32(gt, LNCFCMOCS(i), l3cc);
> > 	}
> > @@ -524,7 +524,7 @@ void xe_mocs_init_early(struct xe_gt *gt)
> > {
> > 	struct xe_mocs_info table;
> > 
> > -	get_mocs_settings(gt->xe, &table);
> > +	get_mocs_settings(gt_to_xe(gt), &table);
> > 	gt->mocs.uc_index = table.uc_index;
> > 	gt->mocs.wb_index = table.wb_index;
> > }
> > @@ -537,8 +537,8 @@ void xe_mocs_init(struct xe_gt *gt)
> > 	/*
> > 	 * LLC and eDRAM control values are not applicable to dgfx
> > 	 */
> > -	flags = get_mocs_settings(gt->xe, &table);
> > -	mocs_dbg(&gt->xe->drm, "flag:0x%x\n", flags);
> > +	flags = get_mocs_settings(gt_to_xe(gt), &table);
> > +	mocs_dbg(&gt_to_xe(gt)->drm, "flag:0x%x\n", flags);
> > 
> > 	if (flags & HAS_GLOBAL_MOCS)
> > 		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).addr);
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index e79b16d8bf7f..87c328106aca 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -471,6 +471,7 @@ static int xe_info_init(struct xe_device *xe,
> > {
> > 	const struct xe_graphics_desc *graphics_desc = NULL;
> > 	const struct xe_media_desc *media_desc = NULL;
> > +	struct xe_tile *tile;
> > 	struct xe_gt *gt;
> > 	u8 id;
> > 
> > @@ -525,13 +526,15 @@ static int xe_info_init(struct xe_device *xe,
> > 	xe->info.step = xe_step_get(xe);
> > 
> > 	for (id = 0; id < xe->info.tile_count; ++id) {
> > -		xe->tiles[id].xe = xe;
> > -		xe->tiles[id].id = id;
> > +		tile = &xe->tiles[id];
> > +		tile->xe = xe;
> > +		tile->id = id;
> > 
> > -		gt = &xe->tiles[id].primary_gt;
> > +		gt = &tile->primary_gt;
> 
> these seem to have been squash in the wrong patch, changing the style
> from using xe->tiles[i].* to declaring a local var. Maybe squash it in
> the previous one to avoid the back and forth here?
> 
> otherwise,
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> > 		gt->info.id = id;
> > -		gt->xe = xe;
> > +		gt->tile = tile;
> > 
> > +		gt->info.id = id;
> 
> the gt than has the id of the tile? Because right now there can only be
> primary_gt? Looks odd, but it's a consequence of removing the only
> platform with 1 tile and multiple gts.

Yeah, deciding how we want to number GTs is a bit of an open question.
Right now at the end of this series, the numbering is

 * PVC:  0 = root tile primary, 1 = remote tile primary
 * MTL:  0 = root tile primary, 1 = root tile media
 * everything else:  only has GT0

Some day we may have a platform with multiple tiles and separate
graphics/media GTs within each tile.  In that case would all graphics
GTs get even numbers and all media GTs get odd?  Or would all primary
GTs get gt_id = tile_id and all media GTs get gt_id = tile_id +
tile_count?

The bigger open question is whether uapi should still expose GTs (like
it does today) or whether it should be converted to just expose tiles
and keep the graphics vs media separation an internal implementation
detail.  If uapi changes to only expose tiles, then we probably don't
even need IDs for the GTs...


Matt

> 
> Lucas De Marchi
> 
> > 		if (id == 0) {
> > 			gt->info.type = XE_GT_TYPE_MAIN;
> > 			gt->info.vram_id = id;
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index f15282996c3b..61126cefe0b5 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -695,7 +695,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> > 		 * TODO: Suballocate the pt bo to avoid wasting a lot of
> > 		 * memory.
> > 		 */
> > -		if (GRAPHICS_VERx100(xe_walk->gt->xe) >= 1250 && level == 1 &&
> > +		if (GRAPHICS_VERx100(gt_to_xe(xe_walk->gt)) >= 1250 && level == 1 &&
> > 		    covers && xe_pt_scan_64K(addr, next, xe_walk)) {
> > 			walk->shifts = xe_compact_pt_shifts;
> > 			flags |= XE_PDE_64K;
> > -- 
> > 2.40.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
