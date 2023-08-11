Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0478EC001B0
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 20:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98A610E6F3;
	Fri, 11 Aug 2023 20:30:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E0110E6F3
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 20:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691785825; x=1723321825;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qtQXjjTr9yIodAoWahsrg9SZK5FH32IioSC9FvjQ3XU=;
 b=JlgsCEOss2sbtfXSXbm9EPRjR2bP+w0zPKr4bH0mFuqnO+dAlXrLpJde
 fFQsFZ+n9OpoI9XdqqUPuIFGB+9/GY9T8LXoIaw016XSYhug+j7oNYMMH
 7r8KRH9AUEEp7LZNJtvLiAnpm1uIvF4bidOEO7xS0JldZQzeWY6bitPiv
 gwrGz+yXyuoc+IU9hqxmVzkTEtAgEzZSX+R0w4v+jzWp+NnAwD7KzUkWf
 hAyobV12/kn7EjO5GLIAyNqCrczuqQ6SJsVvZusBClD15PJAS8WpAOC1d
 /zt3JDERrS1z6U9Pwg4yY+vdmyz+azL4qdRhO1aQP6zFkau606/WS00eW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="370657813"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="370657813"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 13:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="732779908"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="732779908"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 11 Aug 2023 13:30:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 13:30:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 13:30:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 13:30:23 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 13:30:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNQjUeLoqUJFa6mErtSe2aeNd0e4lP7Iu+UkwhgESx/9jb6AJy4esV5rl2mybiQpVOM9FlVStUv6vCnq02KSIJQNChdO0ZbLQYjfxESov1JJ3LkYH72kfWKsNMgIoIe0dGgR+b9R4ZIHcmdBf2/E43cgu6ZFUFl3slZlUzuDW/rOwaTxYHJkJYBkLT+paS3czxtiqQVtC/rM/R0OBrSADz3UvsEXdk89OJe/BXmd5YnFZscxOoubvQt8Ju9Mpa7A/IMC2L2LtAjfBWom/L8YHtXX0YybP2ALUJev9eeb/Mi5c0b4jQ9Rk0lKVsfPf2ZjU6uCmczYpDM3Tis+3drPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+A23HGVSbeOIlQvpwIfTGK6zBWHl2bJd9PSNVJyK4Yw=;
 b=m3+uD6CgB/8QwU7xdrgyyBEm4KRwkw5Mvod2jHeIN0fUjVSmX2kD9LdSkKCkE17TbIAxmWvwshfjlRLZJG28Tv3COjKF0mIvAV1dQpnPly7WSPWAh+9wzCq3xSsvzVgb9DWRUNlbBXMltykgHcvrvy8adi9Bx2eyd2tLzKoN0AhWTKRg4LlgnvwQ7UgXCHzu7wNBWJO5SgRRnlZLSNYhyEdg8a6UbhVPjiisVml4kNl68fSYcdtFrznsedPE2Ai/MvPs8tst+3l4OeldVR3oaDluszkfb1Bi7IyArr8qZ7zrgphXHu3/7ejGE8AvRr4EiuA5cTULicORYjJjyxtvcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19; Fri, 11 Aug 2023 20:30:15 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 20:30:15 +0000
Date: Fri, 11 Aug 2023 13:30:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230811203012.GG209733@mdroper-desk1.amr.corp.intel.com>
References: <20230809120730.383981-1-ravi.kumar.vodapalli@intel.com>
 <ddgqx7khgaapfvaaxgfmwveuic2ilyhgv7ambdbanpo73q25lv@2pv4li27hr2m>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ddgqx7khgaapfvaaxgfmwveuic2ilyhgv7ambdbanpo73q25lv@2pv4li27hr2m>
X-ClientProxiedBy: SJ0PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffed864-33fe-474d-606d-08db9aa9c533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zDAkDB/gorEhntpen5HmiSFkyp4YJRLQBm+rpG8PptsbzUaLq2POaILYuBbgRJEy6IAnx09fOL+ECkSUnctr0sgXZoh+IKlwIS7b8Bi2kIjwiPgmRDmMp35DmDPEl5Fr4piXbsoXBHSmRFeFCcb+gFwCAmkym4t54aH2tvjbMOglDBkzSV29F0Y4PVy9Rb0nc+BgipkY3UPPAATxSbGjR/O9Fp4ITVsBGK8XLRU+4XeobrJjHRR5FumcqpCrWP9GViHm/eZq8auxMZNRU6HOJ12hybpLLM++y4k3lfSdI6YzNbZb2ZNs5mBDv0aOSwtS2drRFOYi1rRGJpp2ULcUdExCI/3jEzKj4gn/tW3xhlaAFWoMQ4T3nvOLgfihea1kBftDPtVtF63Xlyl0olURaw/2TgdEH9t/l3XnuXB1b74GhNlURy9PES4q1WbLlhwlaRyI91N+OTbHtKvWBD4qlVXY5A+R2W3BDQv29VQ/oLn1/67Ht2cAo4rZhA4f4DY8K2o5KkwDa9eJVQQjMioNKLNaCfMioaGc9e3lD0cdBtg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199021)(1800799006)(186006)(2906002)(30864003)(6862004)(8676002)(8936002)(5660300002)(41300700001)(316002)(66476007)(66556008)(66946007)(4326008)(6636002)(6486002)(83380400001)(478600001)(6666004)(966005)(6512007)(26005)(1076003)(33656002)(6506007)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XamBeah9d5jAFEsh6SomBQsxvWGA1m4bOC2GLoFw2Kdn/Vgdp85O56wedWms?=
 =?us-ascii?Q?IQRpLNVYpKvKp9lraSwaIMqClgYK/0P/DhiIYmm34z1swAGNTOXZkf4gA7Ax?=
 =?us-ascii?Q?tSPsAqAyHGhsP/m6xYMHoVOHyvVE7t9q0HK2SG7ZW6foEjXbtLt3u28LOywq?=
 =?us-ascii?Q?vqwMo7AK+IPuLw1yQTdHBY12tTa8DU9IKlup+yWXCSzGqJLXT0LFnpeGT+1R?=
 =?us-ascii?Q?3odKULlYvoYA0b4gabg7PlK3p2kr2BQQ9By8K8MtWk5IJkhXtzIePgv+fy6I?=
 =?us-ascii?Q?MbpIzQvhawBeT3qi0X5SlpQMl6T44jMEZzeycW9IZPaxu3/41sRtZ99OFY9B?=
 =?us-ascii?Q?BQSoEReBM3/n5QRhJV7D0jumvy745RnK/i29j/7aTuOKE8I4F4xUvzigOcFT?=
 =?us-ascii?Q?MqRr2DloIbwoc24WzNuOESF2n/NfupGNzAoD95+uAGZa/uG/nXYasWfggAM8?=
 =?us-ascii?Q?xr/U4Oy8ioAHr1DohtVWQvU7VXHlZGLU5Kim/42bRqBPltsU3QR8fLKzCRPe?=
 =?us-ascii?Q?iZ4bWf5GoyVv19VJ/F3qqCrCgklKxgW6n/hu5hEhewiC8s5KuTpnmgu7b2jG?=
 =?us-ascii?Q?wFECKFWoS9j6mH8a7nzcxzuY9IKnAF7riwtuyAzwIO4Qgm17sFDlevlK41Ah?=
 =?us-ascii?Q?L0ggsRRgCdw9FNq61q9V2XRSEiyhcG+3Zu7N91z2nt6DBK4tY/j1zMM+/wd1?=
 =?us-ascii?Q?Q8uVSM48VfFUvbVeU/cGPrlX7JEquX2qW4p7MAkYvD9eryQXnVtnuNmq//RL?=
 =?us-ascii?Q?nPqq+owuRc8oSqoq/yhieFyKPUJ5YhHhq3M8XvAYhddLJl+z+Foya/PJoLjV?=
 =?us-ascii?Q?gpCi05a0EDu1pVhaP1LmW89sxIk0V/3+gCIaO41ksDf2iYzK0aBZvDlefPf3?=
 =?us-ascii?Q?p0Tl86q96xSbAdqGukSb9JwrWf7kQxXO0y5/jMM/X2hQe71dyRZFC22X9USI?=
 =?us-ascii?Q?CBclNg7VsEqUSouZIm9Bh6/nf3jwHgf4GTt+3Qncecl2h164k33NfeME5SeP?=
 =?us-ascii?Q?QY4dsJqLkutXUQEFEfYwH9FlEVDuucOQSyGnNi8G9uR1NWgy/wR4R6bL++gc?=
 =?us-ascii?Q?f24BAO4wBuPMVqo4ECcV4hM1Pxv8auCEtGlCugHyDVOYzz2cdW5bfDhPPFUP?=
 =?us-ascii?Q?BdO3QuhbjbFQgmzEqeWuBQSosctmjPk/hVDmK9leo4sKzC0iJfMdcrhf98+E?=
 =?us-ascii?Q?4seYVyJY0r7kt9AycuD5MhixcyM4zQ5QSyUtvZ03lZ2dIGKOK2mcz6P5Tq0i?=
 =?us-ascii?Q?dePCPpDs8yAr1cX4HWaZMjnNlIr+jXXWez1qJNfZLbr4Cf6nI44aggmv2bQS?=
 =?us-ascii?Q?7nrONaH4qgVj9/nBtpF6kJsWF55t4DO2noZ0Myt+cKXSuDQ6GS4q/cbuGW31?=
 =?us-ascii?Q?PlA+dvqMUmMgXJWpXD6IaT/36s72AghMElwfc7SHKB5wS3hvNkDHjauUDj2o?=
 =?us-ascii?Q?98WZ3V6npu4oPdpD3J/Q1MGy4WyPGBm5sfK+gZuVM1HV49+Jgnicp4d2UpM0?=
 =?us-ascii?Q?umbAdvqa518fQ2Or7G+T7plgd6IaMzlcfGbbX2sIE/HAikQRq8nQXNyzSFqT?=
 =?us-ascii?Q?jifb5Jeoo9NLqhqD9CYvsxQXaLbgk2UH9TKF0t7FvUdlNU+NLPsBkB0xVEiX?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffed864-33fe-474d-606d-08db9aa9c533
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 20:30:15.3661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipW2V6YIg1168Iv2zkggwrz7cwtYtCaPoa4sD1pGhVwgGq+M0oYX8TDSVf46wHPP3HNRM5wm2Dd2m2n/05VjitGBazO0wXfTQQulNWStxQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 09, 2023 at 12:26:30PM -0600, Lucas De Marchi wrote:
> 
> As Ashutosh said, please take a look on kernel documentation on how to
> write proper commit messages.
> 	
> 	https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
> 
> It's a good idea to check checkpatch on the patch before submitting too.
> Yes, sometimes we forget, but it's good to create the habit.
> 
> On Wed, Aug 09, 2023 at 05:37:30PM +0530, Ravi Kumar Vodapalli wrote:
> > Bspec: 45101, 71582
> > Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_device.c       |  3 ++
> > drivers/gpu/drm/xe/xe_device_types.h |  5 ++
> > drivers/gpu/drm/xe/xe_pat.c          | 76 ++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_pat.h          | 25 +++++++++
> > drivers/gpu/drm/xe/xe_pt.c           | 28 +++-------
> > drivers/gpu/drm/xe/xe_pt_types.h     |  3 +-
> > 6 files changed, 119 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 766df07de979..0675a60f17f9 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -34,6 +34,7 @@
> > #include "xe_vm.h"
> > #include "xe_vm_madvise.h"
> > #include "xe_wait_user_fence.h"
> > +#include "xe_pat.h"
> 
> all the includes are alphabetically sorted. Do not simply append here.
> 
> > 
> > #ifdef CONFIG_LOCKDEP
> > struct lockdep_map xe_device_mem_access_lockdep_map = {
> > @@ -292,6 +293,8 @@ int xe_device_probe(struct xe_device *xe)
> > 			goto err_irq_shutdown;
> > 	}
> > 
> > +	xe_pte_pat_init(xe);
> > +
> > 	err = xe_mmio_probe_vram(xe);
> > 	if (err)
> > 		goto err_irq_shutdown;
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index bfedcc7571b0..3c64834c32fc 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -23,6 +23,8 @@
> > #include "intel_display_device.h"
> > #endif
> > 
> > +#include "xe_pt_types.h"
> > +
> > struct xe_ggtt;
> > 
> > #define XE_BO_INVALID_OFFSET	LONG_MAX
> > @@ -470,6 +472,9 @@ struct xe_device {
> > 		u32 lvds_channel_mode;
> > 	} params;
> > #endif
> > +	const u32 *pte_pat_table;
> > +	u64 (*ppgtt_pte_encode)(struct xe_device *xe, u64 pte_pat, enum xe_cache_level cache);
> > +	u64 (*ppgtt_pde_encode)(struct xe_device *xe, u64 pde_pat, enum xe_cache_level cache);
> 
> A few lines above we have:
> 
> 		/* private: */
> 
> 	#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> 		/*                                                                     		
> * Any fields below this point are the ones used by display.           		 *
> They are temporarily added here so xe_device can be desguised as    		 *
> drm_i915_private during build. After cleanup these should go away,  		 *
> migrating to the right sub-structs                                  		 */
> 
> 
> You need to find a proper place in the structure to add new fields. Do
> not simply append. However I'll defer to Matt Roper (Cc'ed) if xe_device
> is the correct place or if this should be on the gt level. Anyway, it
> should probably be a substruct "ops" or "funcs" for this vfunc approach.

I think it might make more sense to keep this closer to what it's
operating on, in a more object-oriented sense.  Since these vfuncs are
specific to PPGTT handling, I think 'xe_vm' might be a better spot for
them than 'xe_device.'  We could also drop the 'ppgtt_' prefix and
assign the function pointers inside xe_vm_create().


Matt

> 
> > };
> > 
> > /**
> > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > index b56a65779d26..8f4c33d0f7dc 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.c
> > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > @@ -62,6 +62,24 @@ static const u32 mtl_pat_table[] = {
> > 	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
> > };
> > 
> > +static const u32 xelp_pte_pat_table[] = {
> > +	[XE_CACHE_NONE] = XELP_PAT_UNCACHE,
> > +	[XE_CACHE_WT] = XELP_PAT_WT_CACHE,
> > +	[XE_CACHE_WB] = XELP_PAT_WB_CACHE,
> > +};
> > +
> > +static const u32 xehpc_pte_pat_table[] = {
> > +	[XE_CACHE_NONE] = XEHPC_PAT_CLOS0_UNCACHE,
> > +	[XE_CACHE_WT] = XEHPC_PAT_CLOS0_WT_CACHE,
> > +	[XE_CACHE_WB] = XEHPC_PAT_CLOS0_WB_CACHE,
> > +};
> > +
> > +static const u32 xelpg_pte_pat_table[] = {
> > +	[XE_CACHE_NONE] = XELPG_PAT_UNCACHE,
> > +	[XE_CACHE_WT] = XELPG_PAT_WT_CACHE,
> > +	[XE_CACHE_WB] = XELPG_PAT_WB_CACHE,
> > +};
> 
> you added XE_CACHE_LAST but then did nothing with that. Did you mean to
> add a static assert to make sure we don't have arrays with fewer
> elements than XE_CACHE_LAST?
> 
> > +
> > static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
> > {
> > 	for (int i = 0; i < n_entries; i++) {
> > @@ -111,3 +129,61 @@ void xe_pat_init(struct xe_gt *gt)
> > 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> > 	}
> > }
> > +
> > +u32 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
> > +{
> > +	return xe->pte_pat_table[cache];
> > +}
> > +
> > +static u64 xelp_ppgtt_pde_encode_pat(struct xe_device *xe, u64 pde_pat, enum xe_cache_level cache)
> > +{
> > +	u32 pat_index = xe_pat_get_index(xe, cache);
> > +
> > +	pde_pat &= ~(XELP_PDE_PAT_MASK);
> > +
> > +	if (pat_index & BIT(0))
> > +		pde_pat |= BIT(3);
> > +
> > +	if (pat_index & BIT(1))
> > +		pde_pat |= BIT(4);
> > +
> > +	if (pat_index & BIT(2))
> > +		pde_pat |= BIT(12);
> > +
> > +	return pde_pat;
> > +}
> > +
> > +static u64 xelp_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat, enum xe_cache_level cache)
> > +{
> > +	u32 pat_index = xe_pat_get_index(xe, cache);
> > +
> > +	pte_pat &= ~(XELP_PTE_PAT_MASK);
> > +
> > +	if (pat_index & BIT(0))
> > +		pte_pat |= BIT(3);
> > +
> > +	if (pat_index & BIT(1))
> > +		pte_pat |= BIT(4);
> > +
> > +	if (pat_index & BIT(2))
> > +		pte_pat |= BIT(7);
> > +
> > +	return pte_pat;
> > +}
> > +
> > +void xe_pte_pat_init(struct xe_device *xe)
> 
> any non-static function in this file should be xe_pat_*  (there a few
> exceptions, but this is usually the rule).
> 
> > +{
> > +	if (GRAPHICS_VERx100(xe) >= 1270) {
> > +		xe->pte_pat_table = xelpg_pte_pat_table;
> > +		xe->ppgtt_pte_encode = xelp_ppgtt_pte_encode_pat;
> > +		xe->ppgtt_pde_encode = xelp_ppgtt_pde_encode_pat;
> 
> setting those don't belong to this file. They should be in the relevant
> file that cares about ppgtt (i.e. xe_pt.c).
> 
> Also you are missing the necessary changes to xe_ggtt.c that should also
> encode the bits.
> 
> > +	} else if (GRAPHICS_VERx100(xe) >= 1260) {
> > +		xe->pte_pat_table = xehpc_pte_pat_table;
> > +		xe->ppgtt_pte_encode = xelp_ppgtt_pte_encode_pat;
> > +		xe->ppgtt_pde_encode = xelp_ppgtt_pde_encode_pat;
> > +	} else {
> > +		xe->pte_pat_table = xelp_pte_pat_table;
> > +		xe->ppgtt_pte_encode = xelp_ppgtt_pte_encode_pat;
> > +		xe->ppgtt_pde_encode = xelp_ppgtt_pde_encode_pat;
> > +	}
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> > index 659de4008131..1138ac78943f 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.h
> > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > @@ -6,8 +6,33 @@
> > #ifndef _XE_PAT_H_
> > #define _XE_PAT_H_
> > 
> > +#include "xe_device_types.h"
> 
> why?  we don't add includes, particularly in headers, that aren't used.
> 
> > +
> > +#define XELP_PTE_PAT_MASK                  (BIT_ULL(7) | BIT_ULL(4) | BIT_ULL(3))
> > +#define XELP_PDE_PAT_MASK                  (BIT_ULL(12) | BIT_ULL(4) | BIT_ULL(3))
> > +#define XELP_PAT_WB_CACHE              0
> > +#define XELP_PAT_WC_CACHE              1
> > +#define XELP_PAT_WT_CACHE              2
> > +#define XELP_PAT_UNCACHE               3
> > +
> > +#define XEHPC_PAT_CLOS0_UNCACHE        0
> > +#define XEHPC_PAT_CLOS0_WC_CACHE       1
> > +#define XEHPC_PAT_CLOS0_WT_CACHE       2
> > +#define XEHPC_PAT_CLOS0_WB_CACHE       3
> > +#define XEHPC_PAT_CLOS1_WT_CACHE       4
> > +#define XEHPC_PAT_CLOS1_WB_CACHE       5
> > +#define XEHPC_PAT_CLOS2_WT_CACHE       6
> > +#define XEHPC_PAT_CLOS2_WB_CACHE       7
> > +
> > +#define XELPG_PAT_WB_CACHE             0
> > +#define XELPG_PAT_WT_CACHE             1
> > +#define XELPG_PAT_UNCACHE              2
> > +#define XELPG_PAT_1_WAY_WB_CACHE       3
> > +#define XELPG_PAT_2_WAY_WB_CACHE       4
> 
> only define what you use.
> 
> > +
> > struct xe_gt;
> > 
> > void xe_pat_init(struct xe_gt *gt);
> > +void xe_pte_pat_init(struct xe_device *xe);
> > 
> > #endif
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 5709518e314b..eccb0942ff46 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -58,19 +58,16 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
> >  * Return: An encoded page directory entry. No errors.
> >  */
> > u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> > -		  const enum xe_cache_level level)
> > +		  const enum xe_cache_level cache)
> > {
> > 	u64 pde;
> > +	struct xe_vm *vm = bo->vm;
> > +	struct xe_device *xe = vm->xe;
> > 
> > 	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> > 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> > 
> > -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> > -
> > -	if (level != XE_CACHE_NONE)
> > -		pde |= PPAT_CACHED_PDE;
> > -	else
> > -		pde |= PPAT_UNCACHED;
> > +	pde = xe->ppgtt_pde_encode(xe, pde, cache);
> > 
> > 	return pde;
> > }
> > @@ -78,6 +75,9 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> > static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> > 			struct xe_vma *vma, u32 pt_level)
> > {
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct xe_device *xe = vm->xe;
> > +
> > 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> > 
> > 	if (unlikely(vma && xe_vma_read_only(vma)))
> > @@ -86,19 +86,7 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> > 	if (unlikely(vma && xe_vma_is_null(vma)))
> > 		pte |= XE_PTE_NULL;
> > 
> > -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> > -
> > -	switch (cache) {
> > -	case XE_CACHE_NONE:
> > -		pte |= PPAT_UNCACHED;
> > -		break;
> > -	case XE_CACHE_WT:
> > -		pte |= PPAT_DISPLAY_ELLC;
> > -		break;
> > -	default:
> > -		pte |= PPAT_CACHED;
> > -		break;
> > -	}
> > +	pte = xe->ppgtt_pte_encode(xe, pte, cache);
> > 
> > 	if (pt_level == 1)
> > 		pte |= XE_PDE_PS_2M;
> > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> > index 2ed64c0a4485..2a94ecbaa844 100644
> > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > @@ -9,9 +9,10 @@
> > #include "xe_pt_walk.h"
> > 
> > enum xe_cache_level {
> > -	XE_CACHE_NONE,
> > +	XE_CACHE_NONE = 0,
> > 	XE_CACHE_WT,
> > 	XE_CACHE_WB,
> > +	XE_CACHE_LAST,
> 
> I can't make sense of these changes here
> 
> Lucas De Marchi
> 
> > };
> > 
> > #define XE_VM_MAX_LEVEL 4
> > -- 
> > 2.25.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
