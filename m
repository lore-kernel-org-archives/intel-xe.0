Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5699FC27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 14:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1219110E98D;
	Thu,  6 Jun 2024 14:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afEC446n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D9B10E97D
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 14:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717684207; x=1749220207;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AXk9FR2OJu6TOgPh4MGHk0hqZm44a576oGG2LdF92tw=;
 b=afEC446n81J3c2MUJnNovZmTzt1XWmAlA7bHUCAdfpDhWQA3u2/afrsY
 HaQ6ruZuDx03ZUjUdwLsGCt9PCRYTqL3BSujpkqvsoGfx5ggHwWdIkDMD
 ucZQdv/LxJ4f9OQ/uGc0YuzP2eaaESUOVSA0Jq1XPwTSEOYYa93NwVdWm
 h0fN4A4Gq1RDjIWpgvIgt2kH++FCYqQmiyoXHYT09KSGNP8NIswkoiied
 QUCOLb1L3QZsXK4fHDzkMvkO/f5bGd7YAfEGQ5FaGRTvHKk8gF/77iLIJ
 KN/ybdJZ/rqcsv7G/E7EtgaIvltX4SpgQw9wJLbkI99H5E/LWxJWemAno g==;
X-CSE-ConnectionGUID: VnXEqaUbSM21jmQ2b+blbQ==
X-CSE-MsgGUID: ffXekJltQuWYMlc3jaILMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18146995"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="18146995"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 07:30:06 -0700
X-CSE-ConnectionGUID: uki7VUoRRE6491exVfr/mw==
X-CSE-MsgGUID: CNn3OWq2QJi29vj9DMDG2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38056386"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 07:30:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 07:30:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 07:30:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 07:30:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0JRm7Y5QZDcjYXVQCmbnHnXhDw8jLCv2Xfo5xDlGfcLMU04OexgzsUiD9qM1WOa2QuSIrJPXY6a3iiJoVXH48/SX1uiWmlv2+mt0ZXHZXdy1f3iwD0/IsKlzap/sxe7qxek4YOQFBfgKxRTN62OKJjHcW/SthaQ7mMNUdPDrFjBp0FF50UJ69kXYmzuc68sOHMeKn0N9BVgOL9m5tR9M4hEspv6xZyUsnCVfscMfW+/DAlcu/9DC7Zr+zpQy4VqXkM5WaUR/VR2HamCPGH2GfYEH1d9kwEX3yfGQkETFO5Sa344R9dc+Xee6lpmF/tfbYbR0M6Y2JX9/5kYK28ycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqYja3a6hINysyDaRznciYs0WxywrONvfM97Q/q/ALU=;
 b=kPZ0zNVDuB3j9vIxG4lIxaVdWG8f+gsZrKxJPZw1I0vC6+bSqL2RkgebZJCoO2tJWUgzLxRsVKLZ682NgPYO4+CiicJ9Pb+lw3FN4PKzlDbjsCs4KtefxJsvkt1yqfEogjv8M4EimBbuk4Iid4QwrEl6YjC4vpnKMLFyhtYOYR0JOvnBz+hHhlCWRSIRQMIzDmMwoFkXRdtY2OoesDSOPum6Ftt0+6R69yH0aTH8LAe1/kl/DDx9ZsObFkKWzQZYXAwce3YOiLhW/3lru43oET3yKlDOIJkPVuhy4pLjnu6g0zePgoAABcnAtpk88y4lOOljkFoMQ8Q0P0A9CscD9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB7703.namprd11.prod.outlook.com (2603:10b6:a03:4e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Thu, 6 Jun
 2024 14:30:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 14:30:03 +0000
Date: Thu, 6 Jun 2024 09:30:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/xe2lpm: Fixup Wa_14020756599
Message-ID: <dffvvdxj5modzwtejwsdpatbgblotfompg7cx5vjnxo3axywms@xcykxs6ywtra>
References: <20240606135228.998820-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240606135228.998820-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR03CA0325.namprd03.prod.outlook.com
 (2603:10b6:303:dd::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: b062bcf6-30f8-4621-5836-08dc86352762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jEd+AU3imWSpevmT1VAhh46B/AwmXmxe886yql68JLgw6VBqAOPILwiRVDab?=
 =?us-ascii?Q?QS1/cC81Awyx8GsEcSRdEzpZvAOVKJLkiaRNPEUayPxMT4fNWCtzHgrW95iW?=
 =?us-ascii?Q?V2J5bF0G/7YT7bUc3zQkqGQck52snsplaBe1SmjvhL88IARHl+jcNocxr37B?=
 =?us-ascii?Q?PaDqncA/qIMYjW2N/ucPzm++OD3ZyxRbnUfD5YG1aF8ynqWg3AUV4FXv9CCY?=
 =?us-ascii?Q?+gVy0fE+bAY6OE0NhfHD948z4uIlmLdR7hVPfBepvg0lMN4lXtbiOclTTe37?=
 =?us-ascii?Q?NlbGLqcnmr+/8oPAZ8Mqgt/85vclCTJ/VutF28yG+0+tD9Rt3v5tL8gUtn8A?=
 =?us-ascii?Q?wGGoZE581AreZ+6L6FZj+xb/3MDMCHOTn4SDZKSWqdUs2UCuvGwE8ZxINVbu?=
 =?us-ascii?Q?4OvODJ1qQTaFCWFOvmqFQoayj2kBLvHhhWiPmt0QVBcLtFqF7CGTLog/7m/8?=
 =?us-ascii?Q?jQoKsvxhTQUNKK3HUGcJ4bO276R4hAUTMppVhBcYlIIy3/Uw5rcbelXeyR9R?=
 =?us-ascii?Q?kSiCCar8fw1r2k92ES56O6MLQBj46i5oL2Ovqpd5RH6UlZfszmaf/QRAt88x?=
 =?us-ascii?Q?QaFFY1umzkPwVbJT7mTnXsteVOYxz4wOMiTeCd4a1BakFjIiSyjQEri9oaXP?=
 =?us-ascii?Q?CxofFUleB5Ig4GYYK7Uo8BPoHUqky9tYbGnuXpgGuhDz3wbXDTv+0/z4OcAA?=
 =?us-ascii?Q?unbpgAaMucDno+Uw63A8mdEJn7LTEQmOtjycZvl7xiSALinCInyYCnH6PFUF?=
 =?us-ascii?Q?lccQTvgQFI5LccffEeQc43A4DgqeJ5F6HK42Qg6MuS3SnZlwTdTVZWUHKBtL?=
 =?us-ascii?Q?gTGWCCeoNjyQetfScru8DE8yWfyEBJhpndVvy8fgJdWe0FoXU/Yk3fSAB8Er?=
 =?us-ascii?Q?QeFE+JcV4CU2m63VwQs3AstEdgiH0ftmkbwJCfk3Cb6dMmyOXIi9zkdtPFtD?=
 =?us-ascii?Q?8K4EDNy07G8oCwSPcXPGh46fG+k6yKdRJdAWzL9sP6pzzbEkjRJ5ZNhluCdW?=
 =?us-ascii?Q?6GU0vV7uGEhUDXPKrcvBu3E+MNw0nYr8uUCXN4KGYpY4KVmEnLznF0Q4xeYK?=
 =?us-ascii?Q?fokxYLHA8IFh+P6gH+ASgfATjf9AVkdRl+iEkbd0PRGQA8IacB4QIlQos4Ru?=
 =?us-ascii?Q?B4I34FvhzWJztomDZmzjv/cVyCGsUjCXRBVF0EGYKC1e0rgctBO8ckLtSpIZ?=
 =?us-ascii?Q?nPbnhBxGEqHfbweKiMN/E1seqyZYVXA62ytquDAf00bEZmXoV080eMp50Cv1?=
 =?us-ascii?Q?TzvaAMJsv3f6W5o+d59yt1pfjewDaDZ/gSAMZ6KgFg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?96axi4daTLj/8OWyyRa25hZocfIS+JdzDojSP0Iqr0NprE9SJb4Q4y5C6GS3?=
 =?us-ascii?Q?QJE1I9XjmVJr33m/DTDnIM/xe+ea6gmLHDQ/HgyWnh13Kseur5EQJin3ovNX?=
 =?us-ascii?Q?C4l8OcLRo1GN3h9je7oqQmqhx2LAuJgsVpZm6ru5kl/omrwaYsYl2a9qu+E6?=
 =?us-ascii?Q?0Pf0hIf8V9QYccqmcDQdVR5bg45NKYdH0LIAu/IvRdBA+RBC8QbodFKsNeXR?=
 =?us-ascii?Q?+9CRTiFc1xzlNsY5DeJgDnwb14WXsa0lbEMFQhv5GbNQ4kHeIsyciTopu9YP?=
 =?us-ascii?Q?i2OUF5y2O6HlWQ4NzgogDvt4oFOFYAVbhSKIp0k3mzcwzbPCBoUgNfFMjOOq?=
 =?us-ascii?Q?m9nOe37jnMxWIzYSegFBZVzsLnt3jhuCs4IY2VRaiwTDOtW6t8jTllWkuw7q?=
 =?us-ascii?Q?yRIciicEwoO6sP62Nsfjl/j5dder3OfvNOyNWKAFCRCGmOOqJmz8lb0sM490?=
 =?us-ascii?Q?+AR9DxuVb1OcmIMZnNic3pER6k1ZHwDb8jVTYA1mt29W5W3djWQVBLVJlpIq?=
 =?us-ascii?Q?7eKIz7G3axNAOTuoUH+wI58KqWHLkyYIdopTOLPMB+/qFAMTqMvwspzpK8md?=
 =?us-ascii?Q?xCfPc5EjprV3VB97AgaKiAHLJoldpii4CvLwLWmpMEYQneq0gu/4s7tyDhVG?=
 =?us-ascii?Q?kvv97/wiIaWUzEJpYXCcrofwwwIltQD8ybucRMg1rYrDJwJq1QqgIoAjQhOM?=
 =?us-ascii?Q?bpUIGl/cFFDib63s5xgMUXT4uRngvbxpdcOjSwBOHEUppus7z2+1kP0KdU/h?=
 =?us-ascii?Q?gwjM5G5BIXiGPfI3tzB1Y/oby+YbdMvOsdgJ+XBJulLtdobnmZjyo0BropjE?=
 =?us-ascii?Q?UMzkRC7Te+X1PGP7eF7m6qSLCrCHPkLdx029BxBT1NqNZfKQQlZXUJQuvuUB?=
 =?us-ascii?Q?5JOM8KucjnQypVoiXDYp1UxDr1upXFup/8aPzY13XIfdxmFHEpCsHEIjWQ8i?=
 =?us-ascii?Q?mZtvT/XbDe22rF4HvdQzj1J5Ow8ST5VqXOrSi35XdzrCLAeslFvP3zMMHUss?=
 =?us-ascii?Q?pI9ZZvmkQapdSdVK+y/8aMzUEbtjPu8u3oCUjknC/n3K5yflJwaUlj/C58l8?=
 =?us-ascii?Q?MWG5IUzzqyeOa+lQnx4Kzj+F30VbACR2ehl5Y49fsfi+V1W4+YPM1SCYRRM+?=
 =?us-ascii?Q?dlr7DuNh/ZhCVJFJaFCpfx+Z8vLxz8m5iSJ4FAHoL1+r1xGv1oCX8P+d3Rnt?=
 =?us-ascii?Q?GmGDWY2LvlRP+bqFxqYkZMKGY/h+SOwE2nv0Kf48DIyhLbfuq4eebSL5gRQa?=
 =?us-ascii?Q?LcYw5AAUff3+AAIYXrqAsTfB8KUFa0VKiomxemfZx1m6QOqqslZYIACHMAhC?=
 =?us-ascii?Q?XM282pZlINL9xAk49ZfOBiP5opETOYQIMYwBuHIXw6h6WUT//L8b34bQdUDy?=
 =?us-ascii?Q?QohM9JEpfZKllKfD83TMvKgdSCknukbrjOj8vcbVcUGKkN3CtkmDwkhT2oSE?=
 =?us-ascii?Q?IoPR7i+MPFKbUUrYMKuY75H+VpgeeV5Mi61OO1sllPPPP92+OvuXFIS85SUu?=
 =?us-ascii?Q?1zsIPYvAMX1EQ8jsQExVnL7fW/tIQEi5qVcsW/jCDmL7LhQF9fxf2Tl/ptTW?=
 =?us-ascii?Q?OXDH5O99J5qelyejJwtqmD/yRAm5g4NNrRqYHmCzr5ZQRIQofrUb4E3NsTrg?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b062bcf6-30f8-4621-5836-08dc86352762
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 14:30:03.4188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njvOdHj4yHkLnAifMHd93Z/jFpjrEZSilaD1v7u/Lyld8vJm14CoPqPRo+vowQ8tweuuew6pixLlQPGszbGyFK7hQFGO8oH54F2ner9PlOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7703
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 06, 2024 at 07:22:28PM GMT, Tejas Upadhyay wrote:
>In the current situation, Media 2000 is along with xe2_lpg,
>thus WA is already covered.

this needs to be improved to detail the issue the previous approach had.

>
>https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2016

you shouldn't just drop a url in the commit message without saying what
this is. AFAICS should be a Closes:, and in the trailer part

>
>Fixes: 131328aa5699 ("drm/xe/xe2lpm: Add permanent Wa_14020756599")
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/xe_rtp.c |  5 -----
> drivers/gpu/drm/xe/xe_rtp.h | 14 --------------
> drivers/gpu/drm/xe/xe_wa.c  | 13 ++++++-------
> 3 files changed, 6 insertions(+), 26 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index 01c32a932780..eff1c9c2f5cc 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -324,8 +324,3 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
> 	return dss >= dss_per_gslice;
> }
>
>-bool xe_rtp_match_when_media2000(const struct xe_gt *gt,
>-				 const struct xe_hw_engine *hwe)
>-{
>-	return (gt_to_xe(gt))->info.media_verx100 == 2000;
>-}
>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>index a32645f5f80b..337b1ef1959c 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.h
>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>@@ -427,18 +427,4 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
> bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
> 					 const struct xe_hw_engine *hwe);
>
>-/*
>- * xe_rtp_match_when_media2000 - Match when media GT version 2000
>- *
>- * @gt: GT structure
>- * @hwe: Engine instance
>- *
>- * Its one of the case where we need to apply workaround on primary GT
>- * based on if media GT version 2000 is present. Thus this API will help
>- * us to match media version 2000.
>- *
>- * Returns: true if media GT version 2000, false otherwise.
>- */
>-bool xe_rtp_match_when_media2000(const struct xe_gt *gt,
>-				 const struct xe_hw_engine *hwe);
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 26b170a0cdc7..ce6f1b0ca808 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -677,6 +677,12 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> 		       ENGINE_CLASS(RENDER)),
> 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
> 	},
>+	/* This WA is also needed on primary GT when the media version is 2000.

please balance the comment /* and */, this is drm, not net:
https://www.kernel.org/doc/html/v6.9/process/coding-style.html#commenting

>+	 * In the current situation, Media 2000 is along with xe2_lpg, thus WA
>+	 * is already covered below. In the future, Media version 2000 can be
>+	 * used with some other graphics version where WA still needs to be
>+	 * implemented.
>+	 */

Suggested reword:

	/*
	 * This WA is also needed on primary GT when the media version is 2000.
	 * Currently, media version 2000 is always paired with graphics version
	 * 2004, so just checking the latter is sufficient. In the future, media
	 * version 2000 can be used with some other graphics version where WA
	 * still needs to be implemented
	 */

I think the underlying issue with duplicate WAs should be solved when we
implement an OR operation in rtp.

Lucas De Marchi

> 	{ XE_RTP_NAME("14020756599"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
>@@ -705,13 +711,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> 			     DIS_AUTOSTRIP))
> 	},
>
>-	/* Xe2_LPM */
>-
>-	{ XE_RTP_NAME("14020756599"),
>-	  XE_RTP_RULES(ENGINE_CLASS(RENDER), FUNC(xe_rtp_match_when_media2000)),
>-	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
>-	},
>-
> 	{}
> };
>
>-- 
>2.25.1
>
