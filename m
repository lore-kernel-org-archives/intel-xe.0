Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5372C0015E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 20:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73DD10E07C;
	Fri,  7 Jul 2023 20:45:56 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109B310E07C
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jul 2023 20:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688762754; x=1720298754;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l724DBzYm4sFWwyjFU+OX4XBTEpm5gTowdqeToihwU4=;
 b=aljgZj7/kvIFxkoAzh/uKEELQ2gRaJ1FrFDYW9Cd2x07E5vOX6jAC8H5
 MdaMkA3PdGfkpTQGHNmWoy8bKh+O5G4gfsIK5wYpOEDnxiVLKwj8fNb63
 HM8OCXASTHek/qzzQcJT5EFasfpW8EmtNIUsutScbi7DrERycXC3y6Dzq
 YL9bZOEngTJPNz5LWD2J3IBsDZiJoG/cXI8MdbaZWhNpqfgp4emM9R3KO
 TFG24oW4KANtNUobRL0bqNN2AVerGPkgVz29N+TY8MgCmsGF9R8lxN0ja
 BKyqScfUo/lMVfSjzX03VQsK9ooUSXZMWsWyZgo38vDLyRJToTtNTaz42 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="366565189"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="366565189"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 13:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="810160283"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="810160283"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2023 13:45:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 13:45:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 7 Jul 2023 13:45:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 7 Jul 2023 13:45:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiASbj01Z5SN5IdKaMDlo/M0S50/3OCTlhD8Y1nP6oIWIpz5dL8kKV5WHvpAj2A9QXWmi5d3YXzqAj/8LpI234yKuYSM5E+PoTcsVNUDgvqDUm6F02J476075pTbsm3+ohPbJsa2BpcO1vrpOVtVUWcgtxSY7fVwem1C7HzPeMt0sDR6FA2AMTBPwaBcN1UDjyMECsBNNjo0FT5yT5Bw2UPq5XuaWHtNzeaK2gywhintCjjoYpzyK1rQjZDzLXq2uLFzT8BE8XAxoeFGIUd6DZ3tUgQy/LQWMl15DdaBplZC0/+T9pe36eF7mAxBcnqtaMDe9KEZJu6bN2sH3V0iuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r58HC5o0KmAWvniYJMDp9BpFUhZZBOj9A5475xma3xU=;
 b=XE2JRukvInYXiw17oJ3bWsdTYvWBPBO5PN5SiszGzA5d2poaR6hrqlRboy7tCooKcNBblQpcPusZQuHkRcUaChMxMtstjOoF4ID2ZSjBTG/8uoVvYhJfkjimjYy9WMPcEiDI/KCqfB5ufAwJZv09n79MQhfcy6iRGE4Euld6X7kSvaNmVTRwV45D+HEnfzE8mhLYwUtajM8UAUoOppizHNDGuiycDUabKRORvginKozUaP/Gf8DDg7juRfRM8YRP75w+7MWWZ1n6tMKvxhZJtMlvcaRdC3fKOiWFlnukPm6fDneWp6YNhw7FdJtUYJOWV2lwzmf9jQMKCxe7eFSxXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5927.namprd11.prod.outlook.com (2603:10b6:510:14e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 20:45:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f1c:4be6:c116:1bb6]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f1c:4be6:c116:1bb6%4]) with mapi id 15.20.6565.019; Fri, 7 Jul 2023
 20:45:50 +0000
Date: Fri, 7 Jul 2023 17:45:44 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <lzir6k5qzo3fqmifxhvkchjdqpiyvflz6rsdwmfhku3zmmjsae@2kabinwrdena>
X-Patchwork-Hint: comment
References: <20230706161130.520247-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230706161130.520247-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0009.namprd08.prod.outlook.com
 (2603:10b6:a03:100::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 06014b65-6b63-4791-8475-08db7f2b259e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aCr4mJC7w04PMZB3iKsO2l/zSkp1dPMxpTv6pOpS1hVGtpJukUkwOdHKo31gXmwgNdiO5Ts3rKRNOigFI4BiRp7pzq49ADtGF2d93WqFuL9S/FW0Pimp30Hp+hDPmW00B1Tb8aNUS1dVM+iFm+3fFEZJbuCrn82T1L/MaTYRcs+UTPTOV8vXJXG2dktuO3wSguqQZqJRXd+cmU03nmKux89DxDLhEeXz1exlufoU+18gZf+hHX78m4DNzC/dtAqLFK888XMQizfcK3arpP8HUaSECtC5jPo03WwvQkTklj+9ksOeB21uFaCSN4wShc3LFj9RzvOUCYOgaGS+TGogYoOj/Ikzaljt/5HyoAZqhy/PoGQwNhRAbJvipdbClgijVAIzHohiULm9DSbUsK+gkCi84xTImSM1XdNvABt8nkVWXikE2AAc03DVpuJCrHJCFR1Z8MjRWiafbnfPOvesIutn2SObRP5QaLStucB0xD06qH4b1jcrhRLe/FG3K9065ZQEdIq+SOHar7Qzf8VMYPJ+FLpSqUIEZ+0Rgpfo0cwwPwckXWCftjQm2Cg+S8My
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(82960400001)(86362001)(33716001)(38100700002)(6512007)(41300700001)(8676002)(9686003)(26005)(5660300002)(186003)(6506007)(2906002)(8936002)(83380400001)(66946007)(478600001)(6666004)(316002)(6486002)(6916009)(66556008)(66476007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OK57aAZAHqYxc5BQ08YTGyo97UdTlDH2F+nwWK/XCmVaIiC2TL059y57hfZD?=
 =?us-ascii?Q?59mr2oFEmnW6Czv215EY0KRPO/L7Kc4OEWI2k9MFzSxboBK8NHnA3G6B8YTV?=
 =?us-ascii?Q?rhIjoVNSBCZQVIWWVQICtcfTI17d2bnrz/PQ3woGcrWx46FSqEKd6mg3M8+J?=
 =?us-ascii?Q?RaCh8oCxecp67Rh7PCbQJXEN/14e4QOTt9FvcBgU8yXbV8wekv2BSxHJJjld?=
 =?us-ascii?Q?Yst/wbZT7DXPH+oqvdCHc8QDZTEJLJFg3Jd21JD30G1TQEMhPiIP5fHxuFcF?=
 =?us-ascii?Q?LGpWo65u8T9IwIOai0TUM4mzoL1wjzbTFzDKXS6H8GtNuVs+Y2oZhIeLKj39?=
 =?us-ascii?Q?H43dEi53tSpju/eD36KTmEr8OlHJxSMexz3m1lhp50rr3E8T3AnZJYDP2BQQ?=
 =?us-ascii?Q?JjsUpmFCTNrhYhNirZFvdmk3EMwm0I2KxPJLdWtDntOdEYt+pamOytcPFFKr?=
 =?us-ascii?Q?XV5wOsxWhp7DKJdnBUcsqkz04DTE2DUt8qDGBcidQ9linJ7zOI1C+NjGhN8A?=
 =?us-ascii?Q?r/v/6wLgsMYveXEqxX5gOZoQCphJyGVhodf1DnCQ+7MWNCIDIjBlQXKChm56?=
 =?us-ascii?Q?lZCdZJn2IJWSHIvZCYWh/I55d8Xu/NH5vVQBdulpbNlUNR6OMDiZGV8vaxfk?=
 =?us-ascii?Q?UxVW5Pqwn7zSxjDBbsV90++8Z++mY6FMmYdFLCsvp91cPhcmqhSa31N2mn7J?=
 =?us-ascii?Q?H9IAKJ+BMmMyftoKwxZilxSN4jCU7Qi+7iUXDhsvuZ09ZE5dF6pXI0bo2u3Q?=
 =?us-ascii?Q?tv8qG2hyfuKxF8Ua+34XYFk3890iWfUybgE+0YxFBMFS5F6/yvfyzqXyqdEL?=
 =?us-ascii?Q?Buv6x9mwCH1T4H8refca1LOyQQkSMjmn+3vWRUXp4l1QmFC61mY+QLo3pPn/?=
 =?us-ascii?Q?knZvCVFj+0/sM2J0zgHVCct39AC+tlWQMk6MpFIiV3KH1o3m5nZBbUKKI+La?=
 =?us-ascii?Q?CRX1Qo+V+i9taSEbigsRWpMkQ+xH0O7A280B3pa/RgvZGzZmgqtxqYPmC+3K?=
 =?us-ascii?Q?PsvNwQ9+bEWLaA9xt+Qrxt+pVO+GBOZMAugk4PoaGBXFvxioc7A645urUEvO?=
 =?us-ascii?Q?4GNa0SDPJAc8aTiQ6lBOVcnWFTvpCE1B7OpMRrVXLge/8ati2vDAHIcxFrFC?=
 =?us-ascii?Q?gz3HiQi2PQMgSUE+p1It/3dmmtEGvHU0tuxQNPL6vRnYVbtu7mFtpQLbKZyl?=
 =?us-ascii?Q?d2ywiUjhpb2+j+z9TSs77m2oUKFYJfxglOnXI0RcpTENSGJQ4jdpdf7k8XEW?=
 =?us-ascii?Q?Xisj1yj/PkzPCSRv0g+gx5g1FW2Fp4mVawLf/bFZuWiOM+5QuNaCjPpxkAmy?=
 =?us-ascii?Q?gG0ANyFG5X5qP+JDfOPCrbtWCBUpwmen9b0Q4e4KzTWfJCxTFTnE6Kqjup0O?=
 =?us-ascii?Q?SC3p9U5vApdAYBJJ9oDf2WR0BK66NK5B3C2+bUB//qPvyiE+jWx6YhAkyvn+?=
 =?us-ascii?Q?BvcUYnv672s8x8MvL1Mle4+/BV/mRoQUb24DtxUTsc9HsLKlx6N98H6mDrnI?=
 =?us-ascii?Q?zdNjKCBlScS6eYdUH4cveM74KisGpArByhcNouN8g/YB9anY+V7IA1eu+uyJ?=
 =?us-ascii?Q?UTljJPyH3suHIiyaij1vVPSSSyChhlnNk+X2Ce2tg9tqkEpOAK36xdTRKheW?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06014b65-6b63-4791-8475-08db7f2b259e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 20:45:49.7995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTMWHWj2EHWKOXRfGq5163Ymn8TYuLZwuQyuN4Xoaia1ps1SQ6XlwrH2CDoOj2qsGQA6hERcaHjrILnDnlTPUvH6nBcm+6PVSHDuidRVBAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5927
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix bo refcounting in
 intel_framebuffer
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

On Thu, Jul 06, 2023 at 06:11:30PM +0200, Maarten Lankhorst wrote:
>Seems we have various confused refcounting mechanisms.
>intel_frontbuffer.c was holding a reference on the bo, but it should be
>handled in the framebuffer.
>
>A few rebases before, there was code that explicitly adds a refcount in
>intel_fb_init, but chunks of that have disappeared. The changes in
>xe_plane_initial are reminders of it.
>
>By adding a refcount, we match how drm_gem_framebuffer_helper handles
>things. In i915, this is opaquely (and accidentally?) handled through
>intel_frontbuffer_get(), not going to duplicate that mistake in xe.
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

since it's display and a regression due to rebase, this should be
squashed in the initial display commit (the i915 partin the commits that
come before it, and the xe part in that commit).

+Jani

thanks
Lucas De Marchi


>---
> drivers/gpu/drm/i915/display/intel_fb.c          | 10 +++++++---
> drivers/gpu/drm/i915/display/intel_frontbuffer.c |  4 ----
> drivers/gpu/drm/xe/display/xe_plane_initial.c    |  5 ++---
> 3 files changed, 9 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
>index d3e8721610794..2ef0a5227c2d3 100644
>--- a/drivers/gpu/drm/i915/display/intel_fb.c
>+++ b/drivers/gpu/drm/i915/display/intel_fb.c
>@@ -1895,7 +1895,8 @@ static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
> 		xe_bo_lock_no_vm(bo, NULL);
> 		xe_bo_unpin(bo);
> 		xe_bo_unlock_no_vm(bo);
>-        }
>+	}
>+	xe_bo_put(intel_fb_obj(fb));
> #endif
> }
>
>@@ -1905,10 +1906,10 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
>
> 	drm_framebuffer_cleanup(fb);
>
>-	intel_user_framebuffer_destroy_vm(fb);
>-
> 	intel_frontbuffer_put(intel_fb->frontbuffer);
>
>+	intel_user_framebuffer_destroy_vm(fb);
>+
> 	kfree(intel_fb);
> }
>
>@@ -2125,6 +2126,9 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
>
> 		intel_fb->dpt_vm = vm;
> 	}
>+#else
>+	/* Hold a reference to object while fb is alive */
>+	xe_bo_get(obj);
> #endif
>
> 	ret = drm_framebuffer_init(&dev_priv->drm, fb, &intel_fb_funcs);
>diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
>index 64fdc78803815..15d414ed0d731 100644
>--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
>+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
>@@ -256,8 +256,6 @@ static void frontbuffer_release(struct kref *ref)
> 	i915_active_fini(&front->write);
>
> 	i915_gem_object_put(obj);
>-#else
>-	xe_bo_get(obj);
> #endif
> 	kfree_rcu(front, rcu);
> }
>@@ -300,8 +298,6 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
> 		rcu_assign_pointer(obj->frontbuffer, front);
> 	}
> 	spin_unlock(&i915->display.fb_tracking.lock);
>-#else
>-	xe_bo_get(obj);
> #endif
>
> 	return front;
>diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>index fad4c66a82264..f6caf64b99d54 100644
>--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
>+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>@@ -166,6 +166,8 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
> 		drm_dbg_kms(&dev_priv->drm, "intel fb init failed\n");
> 		goto err_bo;
> 	}
>+	/* Reference handed over to fb */
>+	xe_bo_put(bo);
>
> 	return true;
>
>@@ -265,9 +267,6 @@ static void plane_config_fini(struct intel_initial_plane_config *plane_config)
> 		else
> 			kfree(fb);
> 	}
>-
>-	if (plane_config->vma)
>-		drm_gem_object_put(&plane_config->vma->bo->ttm.base);
> }
>
> void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
>-- 
>2.39.2
>
