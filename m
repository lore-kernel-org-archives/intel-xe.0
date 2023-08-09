Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DB7C001E0
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 18:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF1B10E485;
	Wed,  9 Aug 2023 18:26:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF8610E485
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 18:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691605598; x=1723141598;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hIgf8Pn5FWVLCCDxuFLcNBfnVbRIWN7gOYkdZI7+ABk=;
 b=HKh0w7pV2J6+1Mz8i8qfewiYzLFRADgPnhSTF2/tTbMHpySAB+aSWGOn
 eQjIcbojU6HpHO5lsdWqAujgCD552KrR6qc8dVRAzftX18Ij8ygoD5uWa
 4a39WRIfuAZ4XBqQ7AioreorPM4tQF+G309EPsnvYTLkcV5kl5lmcMbjH
 M5s9vHtMOu/pYAkwqyOIgnOUX5V1E2cG427kpGIAdAmctQShFWVYYUazK
 9y6bviG3VPKrJzvpr2dWouhYxlB3T1QyAYxnm5a2diaKOoi5/s1YENflU
 Kh1uNq4Kgs9WWJaIv4pBxXxZiNl4/uuAGEGHcKkSRknda1Xt1kN3P05lc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="435089933"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="435089933"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 11:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="801842802"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="801842802"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 09 Aug 2023 11:26:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 11:26:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 11:26:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 11:26:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 11:26:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Byx724gy4Bc4KoghNXSZQzJMgQabTM87l/D+8NY+qRZKbRnzUdZfuT0AQXhfoZum3oR5+NhEwSMBH/5F0Dh2X3gpmQG8JNFU/Cj7hfwGYNjTyI3+d8rvtfbDlI0Ug1BymwYE9hKfDzBleXy44H+9CsmE/yAGPAM7wF/lbPaBKFI52dXHG7Bqf9PycNWHDSFW41Ixl2F6if3hskd9yGOHTLO+YMlpXCDJGb4Vwpsde9Bp2lqLBPoTm9V1D4egOLGXPmZ55oLMRrDn8n3yb9AgpAvQIpFHfZ3glov0OyP6lqjFjoj0/RVFiNtxmDMwYyhhq3x1qJlZpT2UTdE+/oNzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldQLECtZBMU5pREfmXg8LfiXRC/wcfB52ShaVphR64E=;
 b=ZwD+5+a6lph4O2fc9T6k0YsRkN/UXcdgBrf8H7GiNL6fFiAzHn2j9winu7oO9IV3xG3oaQ4E/+udayOa5dEvdY4nxzmi5giXn/kAv4HMD/06YKQMQ4Nc7WdkjUHBV7dlDaM3K05jDWrXI3qRZogxVS8CWoDrWSG67oey2viMJZLiySemn7EdE9N27BeykMUHEv1dtsZspm8n12TfblG6pnRkYjfHzWDTPyND+/10ydffJeU7ukB10hIAm/LCAr7hgSjKkAKkb2fPhSt2Wv2ky407frLtsLBe2xxK5mItC29sRLAZTa1cUJe0KhqEz4+vhs99opZiU59GD6NqgONYoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN6PR11MB8147.namprd11.prod.outlook.com (2603:10b6:208:46f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 18:26:34 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::14d7:6eea:3377:62e1]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::14d7:6eea:3377:62e1%6]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 18:26:34 +0000
Date: Wed, 9 Aug 2023 12:26:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Message-ID: <ddgqx7khgaapfvaaxgfmwveuic2ilyhgv7ambdbanpo73q25lv@2pv4li27hr2m>
References: <20230809120730.383981-1-ravi.kumar.vodapalli@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230809120730.383981-1-ravi.kumar.vodapalli@intel.com>
X-ClientProxiedBy: MW4PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:303:dc::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN6PR11MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 03607019-42bb-4c76-c627-08db990628f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v4f02hqYb7fmSOsaqOFHSWqwumTYUDxYcuE+7Su1bxFdOsA0jVNJZ+AWVYcq99ZhsInUHT5NSPEiDuHJiSSKIiheq9aK/4aKVMSpIrlQ9qitCFM7F75phiYnNPH3OQp6iP0twBeGPhAu51xDp2dfFgMMjk/bLW8JNcugEbEJI68mYyAWHE5vK/A5B14wPuwm0Gg3t8ti4alzDjWJw+YuF4t0IoP9CEpTsdDQsM4pV4UwLnxtSfn16e3MjuBnrGexOT28bSdMWVKHJRiknydtBgMrJsZZUKxtlCbvO04YAO1MR/EivnZ3RMsotBpQWLXdNWch+siX5P/bZiK92MMXq+pfzrMDRzEGi1Q9k4H5FM2AFLd9T6Q7WAAXqWY6hIk3ZyYnPC1Zw3yn66KSuODtCEqx/9b7XmXC8Fj8ICTTnuLhA0nDhfRvXx1neFoO0aWRUlJSk3UwlP0cTbDPvoUZJDAuWdI4JnkgMWdN5/+26QiKilOY6vDg8AbU5TLJQFeMuD0/dHKAl+rmJG7ma81nqi6J7yd4X2QRJuvkr74v6v8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(346002)(366004)(376002)(136003)(186006)(451199021)(1800799006)(26005)(6666004)(9686003)(82960400001)(478600001)(966005)(86362001)(6486002)(6506007)(6512007)(41300700001)(33716001)(107886003)(66946007)(5660300002)(316002)(66556008)(6862004)(8676002)(8936002)(4326008)(2906002)(38100700002)(6636002)(66476007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bGnfGKu/cjb1QF3YRK+1VVHwsYnWj789AvAOJ5M1cs2RapZ4w4YNfr+jfnax?=
 =?us-ascii?Q?e4tnmcTaePeo+zBlDJo1gcGXuhQbM9idzIu7rp6aMVga9WloOQAt4B8FkTaE?=
 =?us-ascii?Q?evz8iYO7IsJzcGd9yFP0z1OyV7VE8WfIW91wBIHTh+FqLdYfceLpjcS2smAZ?=
 =?us-ascii?Q?+nqtAGZXOtNn9cWcdstObs77IwjYA+sPTRYzCKOpyKsGO8IUOBiBOZdvWOAC?=
 =?us-ascii?Q?39dxmJv5JPwfQKFyKaJzOTd3SvH2lEnvGhWljH/Qjm7GwaS5OmwqIsFP+5z7?=
 =?us-ascii?Q?61Sd3ilBNe544qPztqcTf1ERmHlvua7AlkqhcO+Wj9zxSZeYuvWbtLoOeCIS?=
 =?us-ascii?Q?O3grS0ITGmbe0BAyaau+hkpdW8cKW1RDLIKdnHAQZjfgjTmzX1pNbBcP1+jK?=
 =?us-ascii?Q?G37HvvFmxdxCQZfdCvKfc450XdH3yyMZ8vf+Zp5aTSe/eqCTu8vhI8TGpRy6?=
 =?us-ascii?Q?sQwNgc8EvdvgDWQ36MEIuLoZqMBJdCQHdq3CsRRZujUEb+425bI1fWxVLQ1J?=
 =?us-ascii?Q?m25YzePkwVk0ZsrHi2RPuHt81alEYvtFAbR5zCz8W5geblao0SE0FY0D/RqS?=
 =?us-ascii?Q?79c6QbqfJziNgSOG7ZEwTTWVsmfERdz7DBe/49OYN2q7G9vq+Pyp66yevbk5?=
 =?us-ascii?Q?0ID8vN3ARwzOxsSkszKV+7755QqAitk2FP3jZtKmbn3PPmuexIAdCk0aVlwr?=
 =?us-ascii?Q?EHbSPh9QAPQfwpsBrsC1+eNAQz7fKe9S8keR7zdTGrJhnzU+Tn5tTBRHHCA5?=
 =?us-ascii?Q?NrvJflJEIE/ivnHldb5BT5C55qQ8YKo+vxP98SwomVkIr8J3jmAQxBtIAZf3?=
 =?us-ascii?Q?z8+SKiw6cFEw3UsPhrB/UUpUHNIqhMkbHcc3y4PGvh1pvYn0kpleehDs1mJu?=
 =?us-ascii?Q?C2AMLnAWQEL9WZrRXVFd7CDrSvA5D/tMT03CecHbH0PBaGB0ydH3Q5qSyj0e?=
 =?us-ascii?Q?UechvKeOKOytJAv/lzYNOCMLQkAlaWLqzpZA7HSwHOH4+8eER5JfcoTe4j8q?=
 =?us-ascii?Q?dNBZD+owNkzTbmj5ARS4alRa+lvtkgu5i7m1eTDoWAwDUh0vJ8Dr8TJDLVRZ?=
 =?us-ascii?Q?j0D5hVptCQmt5eqPttQFETDNicqHYb4EbU5j00WGfL7SCIa5EBy+4FPSo+qH?=
 =?us-ascii?Q?DCJS595suJH616resWa1IcQmOZJaUT3SIujUiKSZrUEwRikvXz7Bl8DexlFc?=
 =?us-ascii?Q?BbUUAl04xFNtfdvdNjAs3KPx/oDTjRAGlf0FiJuD1O0ZPfyxVrCtxsHHMu6M?=
 =?us-ascii?Q?952vLpIpId5ZtnJ1TllEP9LC/Io2lchy7rEIDgnpx9cdNx/d9bva3VfyPD3c?=
 =?us-ascii?Q?GNSTyPtstUZ5LYHDFTAH/Ujh4WW/0Z5xK7uZL/dW8FQ256MOLaG/Cy5kFnvw?=
 =?us-ascii?Q?/7CUj+dtIfqIDQGze8mOUWbVG5+GZkwgfMq08YhxKwAMp8HOSDp9mnhsLbQf?=
 =?us-ascii?Q?Gk9ULPr4vseQWSlw2eiNAFGITKlU8aNuVE/ghSP33cUd2zFxmaBzSHOv2WE2?=
 =?us-ascii?Q?/3ZNWlX3achWrI0281TSC1U81ouFCK3frrvKhICcOXUXDlsz5ngwbzkkpZhS?=
 =?us-ascii?Q?kfd+1LYHcYFdp0ylw4012MZmxEt2UtgRKmyLR6YWU+WZAwseySkik4K2r5sj?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03607019-42bb-4c76-c627-08db990628f2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 18:26:34.2594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIJPt5TsAN1P8chbxn74ieyzZxD14NuB3PwcXg6vaBV9o6cImWLz3I+xj+dYVmnp2j1Ln+dTOWIgcZ3HkEVbkI5a/goFKrMbrnx/Kp89dZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8147
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] Different platforms has different PAT
 encoding in PTE and PDE format,
 add correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


As Ashutosh said, please take a look on kernel documentation on how to
write proper commit messages.
	
	https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

It's a good idea to check checkpatch on the patch before submitting too.
Yes, sometimes we forget, but it's good to create the habit.

On Wed, Aug 09, 2023 at 05:37:30PM +0530, Ravi Kumar Vodapalli wrote:
>Bspec: 45101, 71582
>Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       |  3 ++
> drivers/gpu/drm/xe/xe_device_types.h |  5 ++
> drivers/gpu/drm/xe/xe_pat.c          | 76 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_pat.h          | 25 +++++++++
> drivers/gpu/drm/xe/xe_pt.c           | 28 +++-------
> drivers/gpu/drm/xe/xe_pt_types.h     |  3 +-
> 6 files changed, 119 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 766df07de979..0675a60f17f9 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -34,6 +34,7 @@
> #include "xe_vm.h"
> #include "xe_vm_madvise.h"
> #include "xe_wait_user_fence.h"
>+#include "xe_pat.h"

all the includes are alphabetically sorted. Do not simply append here.

>
> #ifdef CONFIG_LOCKDEP
> struct lockdep_map xe_device_mem_access_lockdep_map = {
>@@ -292,6 +293,8 @@ int xe_device_probe(struct xe_device *xe)
> 			goto err_irq_shutdown;
> 	}
>
>+	xe_pte_pat_init(xe);
>+
> 	err = xe_mmio_probe_vram(xe);
> 	if (err)
> 		goto err_irq_shutdown;
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index bfedcc7571b0..3c64834c32fc 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -23,6 +23,8 @@
> #include "intel_display_device.h"
> #endif
>
>+#include "xe_pt_types.h"
>+
> struct xe_ggtt;
>
> #define XE_BO_INVALID_OFFSET	LONG_MAX
>@@ -470,6 +472,9 @@ struct xe_device {
> 		u32 lvds_channel_mode;
> 	} params;
> #endif
>+	const u32 *pte_pat_table;
>+	u64 (*ppgtt_pte_encode)(struct xe_device *xe, u64 pte_pat, enum xe_cache_level cache);
>+	u64 (*ppgtt_pde_encode)(struct xe_device *xe, u64 pde_pat, enum xe_cache_level cache);

A few lines above we have:

		/* private: */

	#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)                                          
		/*                                                                     
		 * Any fields below this point are the ones used by display.           
		 * They are temporarily added here so xe_device can be desguised as    
		 * drm_i915_private during build. After cleanup these should go away,  
		 * migrating to the right sub-structs                                  
		 */                                                                    


You need to find a proper place in the structure to add new fields. Do
not simply append. However I'll defer to Matt Roper (Cc'ed) if xe_device
is the correct place or if this should be on the gt level. Anyway, it
should probably be a substruct "ops" or "funcs" for this vfunc approach.

> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>index b56a65779d26..8f4c33d0f7dc 100644
>--- a/drivers/gpu/drm/xe/xe_pat.c
>+++ b/drivers/gpu/drm/xe/xe_pat.c
>@@ -62,6 +62,24 @@ static const u32 mtl_pat_table[] = {
> 	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
> };
>
>+static const u32 xelp_pte_pat_table[] = {
>+	[XE_CACHE_NONE] = XELP_PAT_UNCACHE,
>+	[XE_CACHE_WT] = XELP_PAT_WT_CACHE,
>+	[XE_CACHE_WB] = XELP_PAT_WB_CACHE,
>+};
>+
>+static const u32 xehpc_pte_pat_table[] = {
>+	[XE_CACHE_NONE] = XEHPC_PAT_CLOS0_UNCACHE,
>+	[XE_CACHE_WT] = XEHPC_PAT_CLOS0_WT_CACHE,
>+	[XE_CACHE_WB] = XEHPC_PAT_CLOS0_WB_CACHE,
>+};
>+
>+static const u32 xelpg_pte_pat_table[] = {
>+	[XE_CACHE_NONE] = XELPG_PAT_UNCACHE,
>+	[XE_CACHE_WT] = XELPG_PAT_WT_CACHE,
>+	[XE_CACHE_WB] = XELPG_PAT_WB_CACHE,
>+};

you added XE_CACHE_LAST but then did nothing with that. Did you mean to
add a static assert to make sure we don't have arrays with fewer
elements than XE_CACHE_LAST?

>+
> static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
> {
> 	for (int i = 0; i < n_entries; i++) {
>@@ -111,3 +129,61 @@ void xe_pat_init(struct xe_gt *gt)
> 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> 	}
> }
>+
>+u32 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
>+{
>+	return xe->pte_pat_table[cache];
>+}
>+
>+static u64 xelp_ppgtt_pde_encode_pat(struct xe_device *xe, u64 pde_pat, enum xe_cache_level cache)
>+{
>+	u32 pat_index = xe_pat_get_index(xe, cache);
>+
>+	pde_pat &= ~(XELP_PDE_PAT_MASK);
>+
>+	if (pat_index & BIT(0))
>+		pde_pat |= BIT(3);
>+
>+	if (pat_index & BIT(1))
>+		pde_pat |= BIT(4);
>+
>+	if (pat_index & BIT(2))
>+		pde_pat |= BIT(12);
>+
>+	return pde_pat;
>+}
>+
>+static u64 xelp_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat, enum xe_cache_level cache)
>+{
>+	u32 pat_index = xe_pat_get_index(xe, cache);
>+
>+	pte_pat &= ~(XELP_PTE_PAT_MASK);
>+
>+	if (pat_index & BIT(0))
>+		pte_pat |= BIT(3);
>+
>+	if (pat_index & BIT(1))
>+		pte_pat |= BIT(4);
>+
>+	if (pat_index & BIT(2))
>+		pte_pat |= BIT(7);
>+
>+	return pte_pat;
>+}
>+
>+void xe_pte_pat_init(struct xe_device *xe)

any non-static function in this file should be xe_pat_*  (there a few
exceptions, but this is usually the rule).

>+{
>+	if (GRAPHICS_VERx100(xe) >= 1270) {
>+		xe->pte_pat_table = xelpg_pte_pat_table;
>+		xe->ppgtt_pte_encode = xelp_ppgtt_pte_encode_pat;
>+		xe->ppgtt_pde_encode = xelp_ppgtt_pde_encode_pat;

setting those don't belong to this file. They should be in the relevant
file that cares about ppgtt (i.e. xe_pt.c).

Also you are missing the necessary changes to xe_ggtt.c that should also
encode the bits.

>+	} else if (GRAPHICS_VERx100(xe) >= 1260) {
>+		xe->pte_pat_table = xehpc_pte_pat_table;
>+		xe->ppgtt_pte_encode = xelp_ppgtt_pte_encode_pat;
>+		xe->ppgtt_pde_encode = xelp_ppgtt_pde_encode_pat;
>+	} else {
>+		xe->pte_pat_table = xelp_pte_pat_table;
>+		xe->ppgtt_pte_encode = xelp_ppgtt_pte_encode_pat;
>+		xe->ppgtt_pde_encode = xelp_ppgtt_pde_encode_pat;
>+	}
>+}
>diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>index 659de4008131..1138ac78943f 100644
>--- a/drivers/gpu/drm/xe/xe_pat.h
>+++ b/drivers/gpu/drm/xe/xe_pat.h
>@@ -6,8 +6,33 @@
> #ifndef _XE_PAT_H_
> #define _XE_PAT_H_
>
>+#include "xe_device_types.h"

why?  we don't add includes, particularly in headers, that aren't used.

>+
>+#define XELP_PTE_PAT_MASK                  (BIT_ULL(7) | BIT_ULL(4) | BIT_ULL(3))
>+#define XELP_PDE_PAT_MASK                  (BIT_ULL(12) | BIT_ULL(4) | BIT_ULL(3))
>+#define XELP_PAT_WB_CACHE              0
>+#define XELP_PAT_WC_CACHE              1
>+#define XELP_PAT_WT_CACHE              2
>+#define XELP_PAT_UNCACHE               3
>+
>+#define XEHPC_PAT_CLOS0_UNCACHE        0
>+#define XEHPC_PAT_CLOS0_WC_CACHE       1
>+#define XEHPC_PAT_CLOS0_WT_CACHE       2
>+#define XEHPC_PAT_CLOS0_WB_CACHE       3
>+#define XEHPC_PAT_CLOS1_WT_CACHE       4
>+#define XEHPC_PAT_CLOS1_WB_CACHE       5
>+#define XEHPC_PAT_CLOS2_WT_CACHE       6
>+#define XEHPC_PAT_CLOS2_WB_CACHE       7
>+
>+#define XELPG_PAT_WB_CACHE             0
>+#define XELPG_PAT_WT_CACHE             1
>+#define XELPG_PAT_UNCACHE              2
>+#define XELPG_PAT_1_WAY_WB_CACHE       3
>+#define XELPG_PAT_2_WAY_WB_CACHE       4

only define what you use.

>+
> struct xe_gt;
>
> void xe_pat_init(struct xe_gt *gt);
>+void xe_pte_pat_init(struct xe_device *xe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index 5709518e314b..eccb0942ff46 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -58,19 +58,16 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
>  * Return: An encoded page directory entry. No errors.
>  */
> u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>-		  const enum xe_cache_level level)
>+		  const enum xe_cache_level cache)
> {
> 	u64 pde;
>+	struct xe_vm *vm = bo->vm;
>+	struct xe_device *xe = vm->xe;
>
> 	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>
>-	/* FIXME: I don't think the PPAT handling is correct for MTL */
>-
>-	if (level != XE_CACHE_NONE)
>-		pde |= PPAT_CACHED_PDE;
>-	else
>-		pde |= PPAT_UNCACHED;
>+	pde = xe->ppgtt_pde_encode(xe, pde, cache);
>
> 	return pde;
> }
>@@ -78,6 +75,9 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> 			struct xe_vma *vma, u32 pt_level)
> {
>+	struct xe_vm *vm = xe_vma_vm(vma);
>+	struct xe_device *xe = vm->xe;
>+
> 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>
> 	if (unlikely(vma && xe_vma_read_only(vma)))
>@@ -86,19 +86,7 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> 	if (unlikely(vma && xe_vma_is_null(vma)))
> 		pte |= XE_PTE_NULL;
>
>-	/* FIXME: I don't think the PPAT handling is correct for MTL */
>-
>-	switch (cache) {
>-	case XE_CACHE_NONE:
>-		pte |= PPAT_UNCACHED;
>-		break;
>-	case XE_CACHE_WT:
>-		pte |= PPAT_DISPLAY_ELLC;
>-		break;
>-	default:
>-		pte |= PPAT_CACHED;
>-		break;
>-	}
>+	pte = xe->ppgtt_pte_encode(xe, pte, cache);
>
> 	if (pt_level == 1)
> 		pte |= XE_PDE_PS_2M;
>diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
>index 2ed64c0a4485..2a94ecbaa844 100644
>--- a/drivers/gpu/drm/xe/xe_pt_types.h
>+++ b/drivers/gpu/drm/xe/xe_pt_types.h
>@@ -9,9 +9,10 @@
> #include "xe_pt_walk.h"
>
> enum xe_cache_level {
>-	XE_CACHE_NONE,
>+	XE_CACHE_NONE = 0,
> 	XE_CACHE_WT,
> 	XE_CACHE_WB,
>+	XE_CACHE_LAST,

I can't make sense of these changes here

Lucas De Marchi

> };
>
> #define XE_VM_MAX_LEVEL 4
>-- 
>2.25.1
>
