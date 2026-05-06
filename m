Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA81CD342C
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 05:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2227010EC9A;
	Wed,  6 May 2026 05:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/sDaL9D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EF110EC9E
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 05:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778043814; x=1809579814;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mjnmtqVYGE4EkcBOTuHAODoeZ7Eeh4hSOHrPdH9d/Jw=;
 b=d/sDaL9DeWV5fQhQp89nL7SN1abIILWaIK8zTp9SNpoFl+DvDoStLSC/
 s2kuCOnebwK4Wlqd3SUDzB5TlL2SwQIczNOxGD0m4IdPZPXY8JhGDtKgJ
 Trzkvi6jBcxq/z1UL6lqFT6uqytofVW8JJ31jfb5YEmsWhmNEMNy4yECH
 BF3Hw3zVyfn/oL4XnvpbcPbQ9LAcs0+m45dBOndXR8KQXxi4dZYolud83
 iRK2SiIE6qcRRhLoN1oSr7E3OvugPJxKRgDFPiEjndV7BZA0lbY2aXoIB
 H7zdR0FzNuyaiSbcUFslxkIWNMS/aC9LulmLoXKy+0snjO8amyvFcADJp w==;
X-CSE-ConnectionGUID: 92Rh5K4KRHWqIr/gOaSqJA==
X-CSE-MsgGUID: f98nvxq7QoaWyrh8Zh73Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78953177"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78953177"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 22:03:34 -0700
X-CSE-ConnectionGUID: bM1hG3VNRUisYZTRvxoo0A==
X-CSE-MsgGUID: d/hJ8QQQTxGzYWdA0Gte9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="236266624"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 22:03:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 22:03:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 22:03:33 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 22:03:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neAfB0X1DXbFTSwheoPH/fgqScKnxm0xtMuHLSXtZNSx9SGcou+HXwOEUE7YvhbT/Zrs0xLhsgqnTFfHihb9RrPYE1QqnTL0/yP8tBqJb45FNwAn3X/CuK2ZKw8/picv0wB9teuH32zdFXqGUM/83JoXJsFWRLq/Dsu6JrlyCUuFsd1w1jGZ+VPKgQcIPXlmQzo8zyC1Ons8D1JVwYVxuO/zHnKqm4oibPx8x4DJzvLWvnlU9cDkbZU2XQ2hzrlIPaVDS3CiUD90QoeP5iCna7PeDbla2/6TPGQJhiVjClpsOhR+dUDTvKH6lxsq8Y0jwHhgLP1V+6qJPp+BPhcjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOB7D69y0qHi2kxQsesuT/o2z6UB0ozPvKnp/kmkqLk=;
 b=IowTPnZY8KngpWYtpWnelG+WP9wl+bMRXlm1E56WZPlconhf82ARDfLugVdrMPQ2b3agly1LajwqpJ26C71l06S1IK39FrI0VjFcbfWldQzdGc0LFmJaWOLhYfsly0e5RC5+/TFFbK/Gh7k9za7vskKshiMvSnQ1dkyo7zPV8j3QkubwHcfpVb+0EGP4q1xHU87FAds6QaDmIy8IQB7W9QLrDW58JOz8bnivfoSI5cHWEZ4z9sGcYYBEx8LisftsXymieFRMJjXXcVl4toayPafrRuQrhdjzH2/QZ6OSBbwqoM3Yho9281nQjxWKCV4VNlAk/OigMnffQVe538qkSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS3PR11MB9866.namprd11.prod.outlook.com (2603:10b6:8:366::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 05:03:30 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 05:03:29 +0000
Date: Tue, 5 May 2026 22:03:26 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 09/11] drm/xe/multi_queue: Add trace event for the
 multi queue timestamp
Message-ID: <afrLnnwqAkKeNNjn@nvishwa1-desk>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
 <20260505234408.3552147-22-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260505234408.3552147-22-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR08CA0005.namprd08.prod.outlook.com
 (2603:10b6:a03:100::18) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS3PR11MB9866:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1ab17d-2c5a-4227-6676-08deab2cd056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: JQvQFYI2K7cp56iNEtX+YBflcMIM+tgMUrxy5bwifOAW4/+iblKPSnJy7Dxvz6vpijmMKMLWpcbYCju1WUkIrmhBMkQfoCT/cWYQ5PNE2RI4gQADUjHQN4a6Fmzca5srpFDl6jwmyqZTkAz+EG2znAoT2DAGogmhvUWo3CNvX6wkmkFIz1FiWiJtmH2SaRmSsbVT3XShdp8lQY972HEbgfxCljsobHLXYUXS/5XorXdpwS6tKSzEhcQa9H4cBqXg1u9KAIm6RMSMF09aiJ55lU7LOJIbEWg2ROK7trxt9fnb0wQ5ttBXHCbRSL122Pt2wEwMpYz1LboXxUIcy7gv7vWccX3bKTXUIAq0UF6Zubumo27EEWrJXapQN36zuEFj3PENjxWjE0hH8a1j661z9WCVJilqm7VrmDyTLKXUSPaPnIbFNMJCZvnPAEMeZWRetbNjbG+6btUZRO9ypzR+YplxVmZ2SR4mX48hgpMn66U67nlLOqA9cV8LT/xauLGI4Wv58grRWQXHcOSQNU4n9t1KeJFng0g1yQUAtgKkCWa/INUuhzomKwxAYifjtlslMq76bmqbaf6Gq2XiYhHWW4lf81u3dBHGnaEpLc9QYAabt2Sq2Rqb1cCfaNfhaRSzgH+0frFXJccy4OjNpTflCJWAkm8kV4ZpKPJXdVaKRA+HZrtUyV5YuHqZKjk04zoC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5AWEc7+U8Ut7FQ0/E5uzfT+Z5OuMz6ZZ9G8ilnRp58GX7lPE0sAFPrbSuAME?=
 =?us-ascii?Q?1MpjCbO/HV8HaaxRwvxyXJNR6H/xCMJuKiWM5xEg13w/AAU2V1hDxxQ3Hn0z?=
 =?us-ascii?Q?hnXGUF5M8JKEYulmHwKPrUdxdIWBYcCbssH94WCfXOkB34eGtpe0ldYa0Z9Z?=
 =?us-ascii?Q?HQ6J5VT2u1B4itUm0GnCmtvbZxk8Oo2B+th1xiz0EtynhyVdsdPx+5K9Gs6s?=
 =?us-ascii?Q?zDQOqdCx11OGpNjv7HKIyAyMrKEXcOoEPxTNYkPI+xeFHcmnHX90BKiOdFHb?=
 =?us-ascii?Q?3DGVai4caKS/EXJVtfSLPRdJePT5xv4VUTC4ud8x5G3/En4s9MiJb9uSqAK/?=
 =?us-ascii?Q?wgzC88zXMkb5VhkURi2cE0TjzTL4Ejs5t28UCewWru1xDKSJsyIhkehbjQnH?=
 =?us-ascii?Q?m37L6DugTx399I/8RjSsfEyEWAgh4hqmuOjgMZ8IdErvdsTjK+qKKaguHS3Z?=
 =?us-ascii?Q?WRjLAUNZMFQvgpgUYgwJ+g9QvbblS5zXUiQn2Nr5GVi38O+YpxoMtRu9sTpq?=
 =?us-ascii?Q?hCbWSq/sbDr011T/Z7YjqFzfY3BZqSsyIOWNixph20FLwXf87HVRCXjXhRRw?=
 =?us-ascii?Q?Ah+xxyU4hLSnqpyq1xS35v2W9HtIj45yPqXA9GeSiEaaVcA5Iwxh18nMKB6P?=
 =?us-ascii?Q?jiBfiwZercpLtWZFSUgt/kcXd7vkbr5rHGULlLy2R7vNBPO1J8tB6yxnj9qe?=
 =?us-ascii?Q?d4vGU0jtltZsD5omXyHBFhRcpqzlZ1ZIgF38nsm1h6ZwIdX7o1CCfyMUs9H1?=
 =?us-ascii?Q?tkYgv4ux73klZIku3RRS+ykcseBUrBIIxR7k00H0fst1G4oRySv8js5djTxg?=
 =?us-ascii?Q?ytCVPXKnw/DlRqjopQTjwxqGDE78UFSjyh2qshja5XaMgWuzk2GeqiyhQaB6?=
 =?us-ascii?Q?sQNeuKLJ2yK+4eptjp0LCwu2pipPGI5P9focykjTM0GE8aS7u3kcXhlfuOKJ?=
 =?us-ascii?Q?L/ZVhNBZYbiywOMh5hg/jm2+eKfI8kKBkd/NshppqkNZ75GIqelKskMNRc3R?=
 =?us-ascii?Q?TTrcuLgVqa9zITB5a3uJjhVUDmyuRKgW8AmJrnOCGcYtRbIfneaXBuL1Y6f7?=
 =?us-ascii?Q?dsh/Zsevbv4mFwuwZ66e3Y3sWJGHPruGCpE8pdLBKzJFqRWlxdk8JOCN7iJO?=
 =?us-ascii?Q?/uTY2afCtWflh7QCtR5fLJVm6/NOwKxWRQu8fz3F3/1vPXHRtgKNSzFk41dK?=
 =?us-ascii?Q?nusAW9GL38yJrXYzmnOfaarSeZqhKvO2V+X5nb1h5g+WWOtu8FFQoLZUACEM?=
 =?us-ascii?Q?7Lp1PFeaPtW8oGRDffGRNa816DjVnZxhN4+MWSyyV4RWT953fDGYTozy7vES?=
 =?us-ascii?Q?NbyZ7vHHToWL4iwhhvxj333ch6g+DaSyiehjjMBVnXae2OcTfd60UuzNznrs?=
 =?us-ascii?Q?q65lDRRPGfKXAzjZwzkJ8Te9RhPZ10+cwII7+TMP/BiVYpGqDi5Zpgu7AiPC?=
 =?us-ascii?Q?dfmOtB+UXDFBjSLmcFrDuOXrsYZcOfTekGWSlrnRiE8wYmKb7mqklf/EJFFP?=
 =?us-ascii?Q?+eOlIhVVFJ960eyKEm04dBrIRohG9FhiKw5/6n2sbUfMF5wQc17+W6yoQLRP?=
 =?us-ascii?Q?LuiMdm0T3EzK26UPbZEphXcGlVTcGSMP5uoBh+MSdDODJrIPB/RL5eajTPxr?=
 =?us-ascii?Q?tbZnVwtr22Xe+4cawpyO6tkb3qFJd0ejYQTSezGMsPntpgL4tynuREz/6e+6?=
 =?us-ascii?Q?RXkE4hLgiflvoMVt2oewr7kzlv+byuGc4pi/4+E+8ghx1YXxG2U688Nj3USy?=
 =?us-ascii?Q?UpqBWWC7M1yZM75zu0yDOndyxUm+WR61v72l9WInysa9fZel6RP2?=
X-Exchange-RoutingPolicyChecked: czrP1v/RATVV4I/MZCQwh7RTckvxfvYFUn/1bx96cRanngIUQnVWWlBIgJ4oaisE1XS3JZLneMRgfnOLIu/Q3BfPx0A3lkEKen8n3XgkSluN54Q3cgVUv+/3zqsX6t7SA7w94L3Ea3AiCHQ6RiMwWswq6SzmLlEIqDrl750IFno/oqn2qCh2LdZiDH6KiiA6HCu50r/wCBCjTSDwVc3hwJs4ga4DGTReMoQLRQPaJO1whebt4TQeUhNo1Qwk/ehAQRnUHmQefqjhY3DNcEyAxVjayvCcxDudP4aIbl6aHwxdkuo7QhbK6To+obGNHTWU1yc+xMZGDUA+Sla+hAQ3MQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1ab17d-2c5a-4227-6676-08deab2cd056
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 05:03:29.6851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdSg0uC24QWHUr+T7TPF1MW2Dly9n9Rq3OKfoXW3mSlSiCmm0Z6Q6n4wEv8ZMw8nWdxbDRul0bk/UtMwBWT67l0jE7yUR5yymTZVoG6KPU3DxVtR4NxmUKuQLA5i4Oyt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9866
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

On Tue, May 05, 2026 at 04:44:18PM -0700, Umesh Nerlige Ramappa wrote:
>Add a trace event for multi queue timestamp capture.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2:
>- Split traces from original patch (Stuart)
>- Print primary lrc in the trace (Niranjana)
>
>v3:
>- Include primary_lrc as well as lrc in the trace (Niranjana)
>---
> drivers/gpu/drm/xe/xe_lrc.c       |  2 ++
> drivers/gpu/drm/xe/xe_trace_lrc.h | 29 +++++++++++++++++++++++++++++
> 2 files changed, 31 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 28060a3d4f11..ea65160a582a 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -2700,6 +2700,8 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> 	*old_ts = lrc->queue_timestamp;
> 	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
>
>+	trace_xe_lrc_update_queue_timestamp(lrc, *old_ts);
>+
> 	return lrc->queue_timestamp;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
>index d525cbee1e34..4f3c1a0de573 100644
>--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
>@@ -12,6 +12,7 @@
> #include <linux/tracepoint.h>
> #include <linux/types.h>
>
>+#include "xe_exec_queue_types.h"
> #include "xe_gt_types.h"
> #include "xe_lrc.h"
> #include "xe_lrc_types.h"
>@@ -42,6 +43,34 @@ TRACE_EVENT(xe_lrc_update_timestamp,
> 		      __get_str(device_id))
> );
>
>+TRACE_EVENT(xe_lrc_update_queue_timestamp,
>+	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
>+	    TP_ARGS(lrc, old),
>+	    TP_STRUCT__entry(
>+		     __field(struct xe_lrc *, lrc)
>+		     __field(struct xe_lrc *, primary_lrc)
>+		     __field(u8, pos)
>+		     __field(u64, old)
>+		     __field(u64, new)
>+		     __string(name, lrc->fence_ctx.name)
>+		     __string(device_id, __dev_name_lrc(lrc))
>+		     ),
>+
>+	    TP_fast_assign(
>+		   __entry->lrc = lrc;
>+		   __entry->primary_lrc = lrc->multi_queue.primary_lrc;
>+		   __entry->pos = lrc->multi_queue.pos;
>+		   __entry->old = old;
>+		   __entry->new = lrc->queue_timestamp;
>+		   __assign_str(name);
>+		   __assign_str(device_id);
>+		   ),
>+	    TP_printk("lrc=:%p primary_lrc:%p pos=%d lrc->name=%s old=%llu new=%llu device_id:%s",
>+		      __entry->lrc, __entry->primary_lrc, __entry->pos, __get_str(name),
>+		      __entry->old, __entry->new,
>+		      __get_str(device_id))

I still think printing 'pos' here does not add much value (we are not printing it in
exec queue trace event also).

BTW, why do we need ':'s before %p? I see it is there in xe_lrc_update_timestamp(),
but that seems to be a mistake (I don't see other trace messages having it while
printing pointer values).

Niranjana

>+);
>+
> #endif
>
> /* This part must be outside protection */
>-- 
>2.51.0
>
