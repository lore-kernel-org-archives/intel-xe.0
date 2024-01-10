Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261F1C47073
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 23:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F1610E639;
	Wed, 10 Jan 2024 23:15:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACBA10E639
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 23:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704928550; x=1736464550;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=utGmH5IYXnPC8J4JHrGgUVRu4v5PEqlKzsgwsi0qLRQ=;
 b=hn1Z1gg0wliBplpTFsjujJKKeQYI39u/wnbOKYw/exF8V1jPIF8RABLJ
 6Snw/53yhK37COAYo+MpFqao489Pg99qPNz6BwNf4KPAvSyVJ/f1DtDjK
 Qk3hFHnG04U1eLNUw7jBzF8Ww1rQsDwXy1JaAWlxgOF5U/rRBYmrehdUb
 dsLA765PxbY0HZO+xJ7xfA398XWjsjIwn/fSHbuYP7FBxCZFVhPadQPFE
 wTVl6lSUw4ZFZKYMXCpyUHOMSPuEs5Xg0iTmbzC4PBkhOVmjs7a1oVgqj
 nQKb/GyF9Zr3IDkjASzfWafjlbpW3JtFPKDO6QeJWsXhpV0Als3hbrLvD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5450896"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5450896"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 15:15:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="1113605189"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="1113605189"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 15:15:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 15:15:49 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 15:15:49 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 15:15:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auNZurswBEkwaZwvycFSyHQcDLFqUf/6CL8zz47hyi+JtMp6fXJMtn2Fo/MxkiGbvwOLTPPu5LT6qiH66NZZeL4smqsdV0NDjgEpQlCH5K3de9z8YvgvZKLkWHvQyD73z5Wg+pzh/1AVW/1qWSx1GlnxTg6Z78mRl/HHjMHkrgg9g2yuo2flDPzlHjoli4mzLD3Cdv1nRXZAKJ5mDmRtSpXONKtcQTbOj1GHZPL1gZAO8lRNF2/AZIY5Ev0GhUobW024hftvGOvmU2Lt3+5oT7AysV3hm9fp55hR1cRQ4y2kLiqehyHV0VIZF6C1uujOMLB94qMX7/jInQhBw1zFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/NP2qmewdgMhEtIfAVtpNz2VJoTsHSMrJYYWhWCKf4=;
 b=U1nZt/LHyc+qZneJeueJIS5ZNGOASbcD8NQueMFqYwZkk0+D4nLAdIDNByz/nQBYSyBA7Nj3Mb5QgEHteymnB0zFSDJXcfcjrvV/u+f/9VzrdGuPzLQ93+btzXlcVdxkOsYt29vGVwxdaa3ZaX3PT3ueQ8tNXb/rpcjYrjPYxOEUAO84HIaTeIcAVCMhZlAMQg3LiM06vm4il+QnpJ9BD65TCMySrfZuDDTT3tVwLQQAXu7jP2iVjSGXfoz9QpZUbf9eI+F08tvGKPSxbKiIQNF9+Curdp45bRwKVec1b9QyNkjiGVosScZbpPZZoL1ZGGRN6mUk6QIQ/qTV8FMXkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5308.namprd11.prod.outlook.com (2603:10b6:408:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.25; Wed, 10 Jan
 2024 23:15:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 23:15:38 +0000
Date: Wed, 10 Jan 2024 23:14:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH] drm/xe: Add DRM_XE_LOW_LEVEL_TRACEPOINTS
Message-ID: <ZZ8kz/YWBEAm2mQW@DUT025-TGLU.fm.intel.com>
References: <20240105164530.1328374-1-matthew.brost@intel.com>
 <170447539640.198519.6458162717929687417@gjsousa-mobl2>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <170447539640.198519.6458162717929687417@gjsousa-mobl2>
X-ClientProxiedBy: BY5PR20CA0031.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5308:EE_
X-MS-Office365-Filtering-Correlation-Id: 926a7dbe-806b-4802-e43b-08dc12320e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UE3HmwCOl6zfiMAy62xYAgcqRrstvyXekLptDqbzzScwh9BY3WL0+FJb2wjael468MBRPYjYt7hqQK/d2KUmElaA15WVn3tvAkuFaE71IjSh4Llkt6pN6QRNl6pVKoh9GbrYuaUo9/T+w/RVxGWh4Kj8YN8AFVze7Xw9jCYY3IMdr7WNkAShYze/8F4i/9kZZdM5PJP7GuKUSRQIjbzI6UzpVcoHx+eoB0eQQXjixU+uOACZ9XGYj3qDC28bl87wAa4tsrwfJjDUAHbBZy+SS+gk3imhajw+YKpWY/wwGBFlLGQYwlQJR7aOpeSoREnzkBkqwQUo60Iv/s9NJlgiOvBiF72AkFnUQ97sbh0Lky1xWbPBb0kUWrjC8gytZh/2rGFLhxW8uWgtI0n0ckSIBC+WqG64LMozbDCxvjq65qoxB1jg3QN+5bQ9FAaTYpz32Yln8RJjQ46J30JI1XFjI6gF7gCM3pCIf4nxGztHznXltfR7uqfTVaMC+/S3xN0iH9t72vr4AueU1ScuAuUc+LaRrlklLWVcI9Kq7C5z3aIdMgIb6hVG6BAE2I56Zj1D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(396003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(66574015)(6512007)(6506007)(26005)(38100700002)(30864003)(6862004)(4326008)(8936002)(44832011)(8676002)(2906002)(66476007)(6636002)(6486002)(478600001)(5660300002)(6666004)(66556008)(316002)(41300700001)(82960400001)(66946007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FRcbym3fuGd8k3o0bY3ntPPdHOldvdiwlsmUuHo+ct1OCmvi0Zda7FEYKc?=
 =?iso-8859-1?Q?XMlPi/seigEJAK0+c8ilGO51gwg2J8KVNTyYBTngaQG9hJeMB6gA+jOcOM?=
 =?iso-8859-1?Q?RCaXF4gYpj+nsdbK5OeKBdEgV5ixh9n47hImWuAELujAWmi4RdyEwvsXZg?=
 =?iso-8859-1?Q?Lh5WsQx2Gp0X2dec+Hhy92tHPd1qj2/sON8qyLmgXoOulrQxirGtSCxS1d?=
 =?iso-8859-1?Q?EOU8/ecPL8ZAuIrVyMj4YL6GlR7yc5ZpwqLWNmt1+eT45FAbQCO4rI+9Mt?=
 =?iso-8859-1?Q?Cwhm7e+MzudXySY53YW6Zib++f1UYh28KQG7D6gHIntQpm20orglmOHpZ2?=
 =?iso-8859-1?Q?9QW/c6NmPQNdoByshbLmzLxNulKKGWIwDVInicoC12jsIEO/GKgA96Jcj9?=
 =?iso-8859-1?Q?N1GzU3Fbv/koopP/trsBuAdwnY9LAGmd3jCZpvwtHm+FWcwl5oRkV+PRte?=
 =?iso-8859-1?Q?NSKERPmDvkTn/dSFMtC8aIcJT2fEYoXUTdNi21VpbmesJUSkEx4GdEV0jJ?=
 =?iso-8859-1?Q?W2DnbY7sMtK5jhyrVIhqE4h0lW71X40hjCD1KUaHXD/xzOMa7EjO6XRLRP?=
 =?iso-8859-1?Q?hNZp58QCgezwztnysovWP2pQwhjfhlOUNfIFJuN39+4kktfNOAaLZqW9bh?=
 =?iso-8859-1?Q?co7fld5MM/i0+lEaCJMNyghtT4oOGfGa8QtZl/FE12rsechs0BU+/euDak?=
 =?iso-8859-1?Q?/u2pKfGOPRbs44LjHIHWPT62f/v6EjWgjwRO+9MLeQmU9/VEPCEqccNMZg?=
 =?iso-8859-1?Q?RCpV/+4paFKYUUL8SkGbRAQB/utnqzG/64jWZ6uGFGPdXHT06lgT6b4Zkr?=
 =?iso-8859-1?Q?XLqn3tefv77LGixrp5J5jsJL8PDuCJXyHfgWuay3aehOGRr6Vm2yxM2SN5?=
 =?iso-8859-1?Q?W4OBVd0iRV6ai/zBpfmeAAIqguZ2cvK42dgrzVFuJ6m6ETZ40xSYiOXnUQ?=
 =?iso-8859-1?Q?ZhHiKC3fNOib6og4VJRMFG+TNXJakb5kxhwECe8gNDt6XMJJ86fc+XnxhK?=
 =?iso-8859-1?Q?Cw47dm0GaU1igyoi2/1Y/joF2VnJGz3PSG81RU9oqKtpxZ/xIofZl/EcZn?=
 =?iso-8859-1?Q?3tCDS5ImipzHUYlXaPaHeyJzQzqfK1KI8Yp32qLv36xMvxoKi8exTTBQjU?=
 =?iso-8859-1?Q?3oDb9sZcoj3ee39f6bW/tL3ttcwoyv3uGc/b8lkVqk5D/9K5nhOh1ApYWm?=
 =?iso-8859-1?Q?THmyXnJTq2NxjEtLkqfP618KK233SQlUQGytRwGNwtljNkGRoI6yZ/GhTI?=
 =?iso-8859-1?Q?WX8BGL/EdSrAj/kjEYSLXRWSQtgWwx0WT3JjyLsYoRYwPjSTebql6zSd0X?=
 =?iso-8859-1?Q?uNyQICz2TDQMja2bvEUGrBxFXJ1xDszlahrdqC6OgabBgF0AadeXtPiVA3?=
 =?iso-8859-1?Q?xekKuAXp9MJFH8rGgw+iZygJjeoU/iQTAYlCVAT8GsDAJ5q5+F51jl2jz8?=
 =?iso-8859-1?Q?40ZLbrJs6YpG0SAruRP3Gbs1pW+VDaTQX2c5bVUJDnQWDGeW0jYEYNetVG?=
 =?iso-8859-1?Q?cIzRpVK0kaKNdes9/qupRVpZzJXNRbmjsi/CYk1Ui7egckN8MTwlDQNuQ4?=
 =?iso-8859-1?Q?fTSm2Yd77LlXOg64sTXmLv49xGdvBtTnz1zfuJGt+oa+Tt/7WDRLgXzbIr?=
 =?iso-8859-1?Q?opgzVhvnrl9ECvx7wV8GC6FNO6SptCkPalbIOAkbUTYzDgi6sHDmRMhg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 926a7dbe-806b-4802-e43b-08dc12320e77
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 23:15:38.1780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHCdJYhgJL8JUZFlDDkaEtpvuU3WLCFy6/+arTfc2tBNADZHImINYDrVVqiOIi653mbm92MnIGVUjyRoqMHsyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5308
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

On Fri, Jan 05, 2024 at 02:23:16PM -0300, Gustavo Sousa wrote:
> Quoting Matthew Brost (2024-01-05 13:45:30-03:00)
> >Trace events are uABI. The Xe trace events currently implemented are
> >developer only and subject to change. Hide all Xe behind
> >DRM_XE_LOW_LEVEL_TRACEPOINTS so these are free to change going forward.
> >
> >Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >---
> > drivers/gpu/drm/xe/Kconfig.debug |  10 +
> > drivers/gpu/drm/xe/Makefile      |   4 +-
> > drivers/gpu/drm/xe/xe_trace.h    | 339 +++++++++++++++++++++++++++++++
> > 3 files changed, 352 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> >index 549065f57a78..a8785e71e224 100644
> >--- a/drivers/gpu/drm/xe/Kconfig.debug
> >+++ b/drivers/gpu/drm/xe/Kconfig.debug
> >@@ -105,3 +105,13 @@ config DRM_XE_USERPTR_INVAL_INJECT
> > 
> >          Recomended for driver developers only.
> >          If in doubt, say "N".
> >+
> >+config DRM_XE_LOW_LEVEL_TRACEPOINTS
> >+       bool "Enable low level trace events"
> >+       default n
> >+       help
> >+         Choose this option to enable low level trace events.
> >+
> >+         Recomended for driver developers only.
> >+
> >+         If in doubt, say "N".
> >diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> >index 53bd2a8ba1ae..9d33e6975ba0 100644
> >--- a/drivers/gpu/drm/xe/Makefile
> >+++ b/drivers/gpu/drm/xe/Makefile
> >@@ -129,7 +129,6 @@ xe-y += xe_bb.o \
> >         xe_sync.o \
> >         xe_tile.o \
> >         xe_tile_sysfs.o \
> >-        xe_trace.o \
> >         xe_ttm_sys_mgr.o \
> >         xe_ttm_stolen_mgr.o \
> >         xe_ttm_vram_mgr.o \
> >@@ -142,6 +141,9 @@ xe-y += xe_bb.o \
> >         xe_wa.o \
> >         xe_wopcm.o
> > 
> >+# trace support
> >+xe-$(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS) += xe_trace.o
> >+
> > # graphics hardware monitoring (HWMON) support
> > xe-$(CONFIG_HWMON) += xe_hwmon.o
> > 
> >diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> >index 95163c303f3e..7163ac9b8eae 100644
> >--- a/drivers/gpu/drm/xe/xe_trace.h
> >+++ b/drivers/gpu/drm/xe/xe_trace.h
> >@@ -21,6 +21,7 @@
> > #include "xe_sched_job.h"
> > #include "xe_vm.h"
> > 
> >+#if defined(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS)
> > DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
> >                     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> >                     TP_ARGS(fence),
> >@@ -597,6 +598,344 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
> >                              __entry->tail, __entry->_head)
> > 
> > );
> >+#else
> >+#if !defined(TRACE_HEADER_MULTI_READ)
> 
> I wonder if we could have XE_* variants of the macros used above so that
> we do not need to declare an empty trace_* function for each event
> added.
> 
> For example, here's is a foo.h file that I created to test the idea:
> 
>     #if !defined(CONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS)
>     #define _XE_TP_PROTO(...) __VA_ARGS__
>     #define XE_DEFINE_EVENT(__unused, __fn, __proto, ...) \
>         static inline void trace_ ## __fn(_XE_ ## __proto) { }
>     #else
>     #define XE_DEFINE_EVENT(...) DEFINE_EVENT(__VA_ARGS__)
>     #endif
> 
>     XE_DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_create,
>              TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
>              TP_ARGS(fence)
>     );
> 
> Output of `gcc -E foo.h`:
> 
>     # 0 "/tmp/foo.h"
>     # 0 "<built-in>"
>     # 0 "<command-line>"
>     # 1 "/usr/include/stdc-predef.h" 1 3 4
>     # 0 "<command-line>" 2
>     # 1 "/tmp/foo.h"
>     # 9 "/tmp/foo.h"
>     static inline void trace_xe_gt_tlb_invalidation_fence_create(struct xe_gt_tlb_invalidation_fence *fence) { }
>     
>     
>      ;
> 
> Output of `gcc -E -DCONFIG_DRM_XE_LOW_LEVEL_TRACEPOINTS foo.h`:
>     # 0 "/tmp/foo.h"
>     # 0 "<built-in>"
>     # 0 "<command-line>"
>     # 1 "/usr/include/stdc-predef.h" 1 3 4
>     # 0 "<command-line>" 2
>     # 1 "/tmp/foo.h"
>     # 9 "/tmp/foo.h"
>     DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_create, TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence), TP_ARGS(fence))
>     
>     
>      ;
> 
> Well, this is an isolated example, not sure it would work with the
> kernel code. But I believe it is worth a try.
> 

I typically do not like adding magic macros like this but that is just
my opinion. Let's get one of the maintainers opinion on this. I'll ping
Lucas / Thomas to chime in.

Matt

> --
> Gustavo Sousa
> 
> >+static inline void
> >+trace_xe_gt_tlb_invalidation_fence_create(struct xe_gt_tlb_invalidation_fence *fence)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_gt_tlb_invalidation_fence_work_func(struct xe_gt_tlb_invalidation_fence *fence)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_gt_tlb_invalidation_fence_cb(struct xe_gt_tlb_invalidation_fence *fence)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_gt_tlb_invalidation_fence_send(struct xe_gt_tlb_invalidation_fence *fence)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_gt_tlb_invalidation_fence_recv(struct xe_gt_tlb_invalidation_fence *fence)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_gt_tlb_invalidation_fence_timeout(struct xe_gt_tlb_invalidation_fence *fence)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_bo_cpu_fault(struct xe_bo *bo)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_bo_move(struct xe_bo *bo)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_create(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_supress_resume(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_submit(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_scheduling_enable(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_scheduling_disable(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_scheduling_done(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_register(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_deregister(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_deregister_done(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_close(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_kill(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_cleanup_entity(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_destroy(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_reset(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_memory_cat_error(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_stop(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_resubmit(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_exec_queue_lr_cleanup(struct xe_exec_queue *q)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_sched_job_create(struct xe_sched_job *job)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_sched_job_exec(struct xe_sched_job *job)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_sched_job_run(struct xe_sched_job *job)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_sched_job_free(struct xe_sched_job *job)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_sched_job_timedout(struct xe_sched_job *job)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_sched_job_set_error(struct xe_sched_job *job)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_sched_job_ban(struct xe_sched_job *job)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_sched_msg_add(struct xe_sched_msg *msg)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_sched_msg_recv(struct xe_sched_msg *msg)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_hw_fence_create(struct xe_hw_fence *fence)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_hw_fence_signal(struct xe_hw_fence *fence)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_hw_fence_try_signal(struct xe_hw_fence *fence)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_hw_fence_free(struct xe_hw_fence *fence)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_flush(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_pagefault(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_acc(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_fail(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_bind(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_pf_bind(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_unbind(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_userptr_rebind_worker(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_userptr_rebind_exec(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_rebind_worker(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_rebind_exec(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_userptr_invalidate(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_usm_invalidate(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_evict(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vma_userptr_invalidate_complete(struct xe_vma *vma)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vm_kill(struct xe_vm *vm)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vm_create(struct xe_vm *vm)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vm_free(struct xe_vm *vm)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vm_cpu_bind(struct xe_vm *vm)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vm_restart(struct xe_vm *vm)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vm_rebind_worker_enter(struct xe_vm *vm)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vm_rebind_worker_retry(struct xe_vm *vm)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_vm_rebind_worker_exit(struct xe_vm *vm)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_guc_ct_h2g_flow_control(u32 _head, u32 _tail, u32 size, u32 space, u32 len)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_guc_ct_g2h_flow_control(u32 _head, u32 _tail, u32 size, u32 space, u32 len)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_guc_ctb_h2g(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)
> >+{
> >+}
> >+
> >+static inline void
> >+trace_xe_guc_ctb_g2h(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)
> >+{
> >+}
> >+#endif
> >+#endif
> > 
> > #endif
> > 
> >-- 
> >2.34.1
> >
