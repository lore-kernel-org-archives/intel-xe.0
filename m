Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F39E7C4E9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 18:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0E610E0A4;
	Wed,  4 Oct 2023 18:13:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5547A10E0A4
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 18:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696443232; x=1727979232;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RK4kbFKbJtk6dOCnt2DcBJEUy5AdpkwgIZC7hno5WOE=;
 b=JDADe0JMyM+lMhgCDAONzRTygWOJkB0jliY23EHtOFjT+81KTSc0/Th9
 4kdawJGTl1mDmsM01VNb8kpPtMkV23T/DOERihWiVesR3tsOJN6vHGpwq
 yYk41CYe5FlT/WFJbnYZySF7Qw2TpQrqKcOfOS3tRGSSkNpXE3AakcoUM
 Dy5svSq63qm5Fbu3JwqTreKD3aKcBDKKwB8/SqZgLJrnEL+84GTJHefQ3
 DulRGHxhsqP10v4/V/ID6WIIVOHv/Y9Ka7/acu2Qgx16WAaginbHyVCuL
 qbPrMDlfOi6FmsPinlqi1Ke/lnDWM9Cwj9fCyge2HIZUqdPhy/qsSviiL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="414173772"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="414173772"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 11:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="875223718"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="875223718"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 11:13:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 11:13:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 11:13:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 11:13:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgijhRb0guSYy/V+1tt/JTyeDg78It8gppAlNggh3PpqVqhENQcp6WiZTe1I9cnuaVC+76nlf5n/TXfMTyU7neijREVdTCTR2iI9vcAvSXHmNHxKpVjMGJYv1HrghlFBL83tvhsH5K7UMAJEr36z6PDebh5qNpNzJJgHS3qdjxvQQtD09897JssAD9d36sxqOHgQ8T3LQWBKAUHA4Wa5TWRv79W/gmghcQ+r0Ncq3MEIzUl8H+ZLkZVr3g0xrzIEq6n+R7W7buw60Egbk4BHLYGeh2o5ACvK+jEfozCEQwlRarj8uHbuj2dFBerm38jaIyaUC05xzXNkueMm9r0hfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5uDTBaPGRLhSikeRFrGfaHHEe0OJaoXmhzhPaVzHAA=;
 b=ANnVimOOAFyLWCxU1ylH0Exb5qkFKTM/IpO1bJLyDQuGCGC+iwtEUDru6/rrPsmLjhNhcUHZKZhgFMFVkD8seUvFxTEQcsV4R+rQymungYHfZEdgie7JzsUDodBASX741W4ropmO2jXO0V9sBWr2Rffer475/B8iPL7EF5ociGIdwM6Vcow97zidKEU+K973meESBwuuHq6H3ZzUIMmEtdUHWw4zDA+4w/aeHTOp5HqrXyR5Zir3gcHUVM9T8K7z9DoQdqccdKdBppbmLS7VjQIiaRB6UZzeK/Xs3LaXK2X9Zd0z1+jLPL0IfuXAAs2X7EBF4XhzBHAk9tg5ZTEJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8704.namprd11.prod.outlook.com (2603:10b6:610:1c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Wed, 4 Oct
 2023 18:13:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 18:13:23 +0000
Date: Wed, 4 Oct 2023 13:12:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <k7tpx6gx4ppopvx3cvxk5x6m7tylgnb2jrontprj7qjcmxzqcx@rb5zvuxgay7t>
References: <20231003203716.108979-1-anusha.srivatsa@intel.com>
 <20231003203716.108979-2-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231003203716.108979-2-anusha.srivatsa@intel.com>
X-ClientProxiedBy: MW4P222CA0023.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: e933c30a-0e86-4ec9-83fa-08dbc5059886
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7m0zoLxsM21Jk4QWu06SYRfaiM8l60txyRJq5DhSrMSXFt7T8n0lTB/xJ96ENpd9Fd/shUXn4qv1blXKRotQyn1jypnviJ8Yh8zSFYnt8tTsBZ6Hc1msCj2XVL35Ip82HDSfrIWTwKLA10/8eRJAYu33GQe2gv7MfACKXHZHT3l+Z8H8KEWGjFpMm7ezS1K1NOnT8ZbievJqa4Q/ObJ635IHMimvenqiy6OsFLuv/5n6camxw8+9UsbV2MI4Cgt+J3Og+CqUXfz1Y6Wf4QTsSjnKeMofC2b7pa+JPYPKIpqJcllz5ocLCEt1XDR2GGAnvVMQUnhRSExa4mQ8jrPUh8RaTQqcgkg0I2Ru7rzzBCV1c5RxXy0dGA1kYRw/ksrKYL8faknB8Fk/ZLFRXqWXw8sj9VoEIVr3KGVY2xyWdAlqs3ZsR4pS71E2R8z2y+Iuq4hzD8TinxC9X7DqeVb2qpUYG3QQz0ZoORwTjc/73agG6HeBHyAZcu56zuTjZ4DbXLU43FEvB+rpJjhsmbPv/I4w7CWg0JmQJJG50WZ4Ziqlqy2ZJi3OCf2v1Ulcxm2B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(39860400002)(376002)(346002)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6512007)(6666004)(6506007)(6486002)(26005)(2906002)(83380400001)(107886003)(66946007)(33716001)(82960400001)(6636002)(41300700001)(6862004)(66476007)(66556008)(8676002)(5660300002)(4326008)(316002)(8936002)(478600001)(86362001)(38100700002)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TCLGY//wDBCW84iF+yYrx/PlZnweRDfRXbTApnxsgfiYEJIdlCGlswbAHTaj?=
 =?us-ascii?Q?NRLRjXlf2THxxQtQe4AFLRxgizy8rW1nNNrA8eY0Cjd5C3Qf6eKKytw4I2Ta?=
 =?us-ascii?Q?UMX8n+0lsgagoJbvUknEJnyFcBIhY1ddIXgBICEurk3WpU/b+Vp3lluhaCoh?=
 =?us-ascii?Q?dyyNvtCe8thZaih4F3VLkpZcAbf5ca62zqpertCy2TL4h6u7s7nMsbQjT+B4?=
 =?us-ascii?Q?fz+/aLqx7Bt2H39IrXgLljV5wHKF+h86xCNF5ly0RhokDkV7x6jVEeWCWRxg?=
 =?us-ascii?Q?VsXV/iARcuhfOH0OfIWm/t5VA/8DtQ+1WCcN9yG/Fr1kBa3MeWQBGuzeR77j?=
 =?us-ascii?Q?CG2f+ijDQnPdP8c4lZpzVTq8p0Tjm7kZk8dn4Gh+6+ngo2jmQmdpQyfUSRw+?=
 =?us-ascii?Q?+mMKY7UPvt844LcizLSZpAPPROpSh90jfy49PLblYa7fp52hEkBd7Ll4iP0Q?=
 =?us-ascii?Q?WIjNZQbXuHskxMgUf6On6lqzlViPiYNqv/sFEWm9zw44HUDm4G+HM2gpAqSN?=
 =?us-ascii?Q?QHAHbwVbBkzW/m09JZJkYyv6l0OatIIYgRhVE5VGSKP+k1zo6p/ZkNkUx5aL?=
 =?us-ascii?Q?9hFA2e7/J3nqZ3+Vwgs7A0fmnaXoFT9GwasvDSGzlxCkUsy1u6PkrK7y/lwF?=
 =?us-ascii?Q?t8NvLrCAiDzENd1CyQmpacenYhrT9cMISS5OZwJSnY4dYqLHI8TTcLGkpbwn?=
 =?us-ascii?Q?BAOvBZhyDPdNmJ09XrAEwUUvpZFnFbIjVWkVB3GNG8NvyPd3pbDfb66IAi0l?=
 =?us-ascii?Q?5m/5Kdzswn1r/lcc/rTJYa9E2L5CKvJ+Gjj6oq4Ug3W9LxPuhwAaPva96jbI?=
 =?us-ascii?Q?sD0cTzI8RBL1HflSMx0quP/b0c5Js6ZPyOQdBanA9VYZjVioxDRYjD8QHvIJ?=
 =?us-ascii?Q?9vn9CFHw/pOgApL/SZsPXHTNsHR2QAMZO0j7GWpy8eOt1oAxQ24xA7TcZzVX?=
 =?us-ascii?Q?1CQd7PCwavTrbB8xDvKiaAS7/DYgRDTLRZUsysQyHB+7yoMsjB21fbafmE8g?=
 =?us-ascii?Q?TKRN1dO9zL1qAxEWyerO2fjbevm8ZJLZm3oYQfskwxKbTHY+ROy8lm68LnCk?=
 =?us-ascii?Q?5AUtoJ+eCuEVFZSJBirUQJizRYhezyW6ofhO09qupH9elITuhIXbnecrTeob?=
 =?us-ascii?Q?dKkgNmyeRNRdAEVLdjIL9nxcd3iFoXWohqrIEeiFkcCMHYdIRZwICmG6iA2n?=
 =?us-ascii?Q?fRB9KGyOOoCJ+lfgUfAinpRg/Sh5NdOtMGj5e0m/SPhxpKYqH9/JiuEf7Pom?=
 =?us-ascii?Q?sICIePWZzj//Rng5xBKLRlZuZmxWsKuLIgtMeR4/HZHEe0UTCCkLQtw7UHWy?=
 =?us-ascii?Q?VytT837TH9CqMTN/GCvTMzPLN0VoYbBCf3yHFCdXjU0mswbK6Z/BLobXv9MI?=
 =?us-ascii?Q?+p8U/h0NQ8Ex/Lwhp0VxJBCENo16OxSQYPcztmN3GugZA6l2k8o7TzkA/ar4?=
 =?us-ascii?Q?OGc3ClhpJX/3aKNb4Va6JeakCsJgFN36eWdO7VrwpTBm1owbqyU/yt9gScr8?=
 =?us-ascii?Q?uqKJykrkOcoq2pYb/Z6NehFKXHETl9JWHgbnt4h+BSm+QGyjBdIqNhAiO5CB?=
 =?us-ascii?Q?z+8OaMr9mAnm/1fD6W+l6iM/d/DZzgX6CNOmZ0yE/0HXLYsARi2Bl67Mg1jF?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e933c30a-0e86-4ec9-83fa-08dbc5059886
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 18:13:22.9460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+tQUxh+rgA1dUaXICXHiegQ6Nqy4xwhUqlT6g9dvrNo5TNFj9LTWiNPFBhzLr0FXjQ+NzALBEL0ahEKywXJBORd+n7Maof0wq4+yQbR4/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8704
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe/rplu: s/ADLP/ALDERLAKE_P
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 01:37:12PM -0700, Anusha Srivatsa wrote:
>i915 now uses full names for platforms. So we now have
>ALDERLAKE instead of ADL. Extend this to xe driver as well.
>This will make it easier for macro magic usages.
>
>v2: Do not make changes to compat-i915-headers/i915_drv.h
>file with the rest of the changes (Jani)
>
>Cc: Jani Nikula <jani.nikula@intel.com>
>Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

I don't like the very super long name, but if it was decided to keep it
like that on i915, it's better to keep it consistent.

And hopefully this will stop soon as we move away from
platform/subplatform.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pci.c            | 2 +-
> drivers/gpu/drm/xe/xe_platform_types.h | 2 +-
> drivers/gpu/drm/xe/xe_step.c           | 2 +-
> 3 files changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 32d9ef1e6dc2..ba67f6fcfb4f 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -240,7 +240,7 @@ static const struct xe_device_desc adl_p_desc = {
> 	.has_llc = true,
> 	.require_force_probe = true,
> 	.subplatforms = (const struct xe_subplatform_desc[]) {
>-		{ XE_SUBPLATFORM_ADLP_RPLU, "RPLU", adlp_rplu_ids },
>+		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
> 		{},
> 	},
> };
>diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
>index e378a64a0f86..b6fe4342f9f6 100644
>--- a/drivers/gpu/drm/xe/xe_platform_types.h
>+++ b/drivers/gpu/drm/xe/xe_platform_types.h
>@@ -27,7 +27,7 @@ enum xe_platform {
> enum xe_subplatform {
> 	XE_SUBPLATFORM_UNINITIALIZED = 0,
> 	XE_SUBPLATFORM_NONE,
>-	XE_SUBPLATFORM_ADLP_RPLU,
>+	XE_SUBPLATFORM_ALDERLAKE_P_RPLU,
> 	XE_SUBPLATFORM_DG2_G10,
> 	XE_SUBPLATFORM_DG2_G11,
> 	XE_SUBPLATFORM_DG2_G12,
>diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
>index 371cac951e0f..903c65405d3a 100644
>--- a/drivers/gpu/drm/xe/xe_step.c
>+++ b/drivers/gpu/drm/xe/xe_step.c
>@@ -143,7 +143,7 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
> 	} else if (xe->info.platform == XE_ALDERLAKE_N) {
> 		revids = adln_revids;
> 		size = ARRAY_SIZE(adln_revids);
>-	} else if (xe->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU) {
>+	} else if (xe->info.subplatform == XE_SUBPLATFORM_ALDERLAKE_P_RPLU) {
> 		revids = adlp_rpl_revids;
> 		size = ARRAY_SIZE(adlp_rpl_revids);
> 	} else if (xe->info.platform == XE_ALDERLAKE_P) {
>-- 
>2.25.1
>
