Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C89BC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 17:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB8710E2FC;
	Tue,  9 Apr 2024 17:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b2bnk2Os";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51CE10FDBB
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 17:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712684850; x=1744220850;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KMDGRk3GA/7NCD9JrluUtf+vpreLQJrv1irt3Qd+u2A=;
 b=b2bnk2Ose1TaDwF7/k0FeTjg7cjvK42/ttlWctO7I2ZWw5Y8UUQVboib
 8p4lJKYFxeSFmX+el5L25airxOS2uenj5xaKLREey3JxZ6viJBIuTfCLf
 JKDWLk/rsWLoYiUpHLHU6xL4NsiCCAhEClwZaEg9tsz1n7KVXXXSBvKrl
 zrWbgHkZoVxJURimI8xuYv5lfp0XFzf4z3DpGBDwvpjACJuMj72+LTGNc
 dLXge85oyOSO8nOqxUKQI7GRN59bfV24pI/Q45a5pHANyOL9XfhelbrXD
 E5kkfIR9KVv5AffRDoFQwmU43J4G8Gf29gTlcVsHKusc3G3PsMJhnxR/T A==;
X-CSE-ConnectionGUID: xrw62Y+vTwqTo8wuFoNVBQ==
X-CSE-MsgGUID: HyV+2djnSKGA17qSc4GrAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19443161"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="19443161"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 10:47:30 -0700
X-CSE-ConnectionGUID: pweH8X8mSmG/T3sIZtvcww==
X-CSE-MsgGUID: CgQFqRQzSkO7be/bV9zHXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="24779663"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 10:47:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 10:47:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 10:47:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 10:47:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 10:47:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtOyHKvnriOjhB9yYnWbGDnwPRqoEJvl6ofj0fzdWYEGzgKw1i3ufuEYLoI+DsOHN4kxO0LcphKf6rjt7YwyHni4Hy8dgwiZ3CNrwJgmR7MmxE96dTOAa9NBGk/vEBgIECfGm1DZbuDlROUvleeJAqEHNRDXiTDhvf58t8SGbal0FAB73Arz0zwx6sl5GLeZQID7Y0FcFChIZhXeXB7jUYS274ew0ptBvGSzhMJ8Px8G7NSM6Mcqew8r0dtuLAnGeY42rZJ1enwHOrJbpnehicgzbIFMmG283IdzajHWZkgGCI8P3PRvZUcW9e2MCpkSRrMor1nQMqa+EnEhZBz+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QO8tDcqmyUermo6f1cjPWd1oyGI8/116+IWJeXhBhkk=;
 b=kr2U7s6sNQgOx/EEHK5T0yrJ/7865RIjj0YIlbmzkFLAaoeGmGO1TQ9sn2pZn3bxCYdSeNl9XPHvl/fUQBop0q809X72GEXd8ISF59CXdK4tHMk+X7WYIZ3FHHugpOsAmtFT89kQDMVONh1yZNl04e6cSMrTzU9nk8F2QtGI6e4xs4osaBl+twYQJ4qdkZaOo01n6/hz3IPfq6l+rMwFWUSRd4ALtAuDA6jFboqjBruLTXAidZwN1khQrSMBWIzfPzY3OapX4Dcs/yhYiVzB9fXsx09kfzvvs2cI9tO19JKY7Oeuo0uqmbkDM6sX3kNqVFhR59K3Z0VUnHB0PaQY/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB6222.namprd11.prod.outlook.com (2603:10b6:8:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 9 Apr
 2024 17:47:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 17:47:24 +0000
Date: Tue, 9 Apr 2024 13:47:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe: Add proper detection of the SR-IOV PF mode
Message-ID: <ZhV_KLj-fMeX2Ggc@intel.com>
References: <20240404154431.583-1-michal.wajdeczko@intel.com>
 <20240404154431.583-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240404154431.583-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a03:505::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB6222:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tXxovy8PoWk0VReRRLWgI2lkBYpORMRx8yOBW0Rt00xJ434ZM1GyvMLu/dU1KFPeueikTPfOeSZqwlm2Hp8XLNQ/QXByWEsVGcOYjhXBIOKSrd7wlhiISizg7hVk4vOkdZ34lQkkvxA9tKribZxTPTZvLzOtb+LbJ4BHdnb6fJN+vgd9WLzGJs2M7svs4Yk6yRyAP8CouHleBsPNz8otrPdCn8xrLXpbmEV/esZB2nb1fzGRuFm6vx85aqNOJS+7HL1mLfrc9MtAeaWpc6qUE1W1KMOhYp2OQd0nvXmvq3b7cO202Af9THmMStHf2Tgy8ARor7GwpvT0B0vpvePpw9SDgRWSBg8Psa8lHCFYWkXFAB9ICIjfrJ0r9uhKGbnqsiTaxJBIPP3oSoTcOqCJQfjCJ3QKGGyjRIUa+DogvbPIsuYDKQhpdhjgYgSnhFBrEwJzw3NTdzR9kP7vTXK6ENh6SDHPJ51fIjAw3CSXBhw8lPwhehFaQw25de3Em83eyioqUpyKiZWxS334NjiW315LeXc9BveK/sxn+JKrDq/tJDuFo70HwQhErCQGpTonof3NaDbPUMJQoFPLyGMRgqFZXy2ePScsSfQ1rqISkmWNKbYk0n6505mG/MLrgZ+KmPtyNFZ49+tVU9IrGIecTiWAA9gzohbzfm9Kc/zFAe8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KuoVbzTfQ2kGGdWtlxNfws9lW84UC3BejWhnG0O3i4EimrUzdSleyxKNZQ?=
 =?iso-8859-1?Q?BI/TSYEblzc9Iuv/Wh7J3csn/8s41E226SfYju+oiFlON9aACKieUgGxK1?=
 =?iso-8859-1?Q?W1P3w2TvBvYdmaPN0K7+I4xSXT29kXgWbZWDGqUsZllaC5ylkGCLAjHM/a?=
 =?iso-8859-1?Q?AnlizoWC8PdVgI1PcLrhPbpo1UoPJMoPGnHPULn1kY2JWTUvmj0xRClmA7?=
 =?iso-8859-1?Q?o3j52qxjaQ7mOzdY4dHvxQw+DPOpGrg0P5+H9OQGtv6HN0x+Vg006ukk87?=
 =?iso-8859-1?Q?o2//lUsU8LgUKwB+1PVcZ/GBZLxlk342xOX2NHBTSHFhlSPiS1GYmRmaSQ?=
 =?iso-8859-1?Q?ish1/T2VG+OBQ7RE2Nky9qWA5bVVorRT3uyrUaKeE5ejswAdSkXzgcE0K3?=
 =?iso-8859-1?Q?fh6hyh3Ak47epeSbKdgmn4K2sKxe706GuBw18fKQaVKa5LuqzgrXSd4gZv?=
 =?iso-8859-1?Q?hZDlmIaDfEumwVkC6STsi5SnhIFoeKMEuoi5bcgDS4WaIipt/hcbMzamU4?=
 =?iso-8859-1?Q?vzAsYA3LMHxGmGpxrodSPNBoAy4tqskRJIbu401dzuXmHAu1Fz8IE/zoT4?=
 =?iso-8859-1?Q?Hz/a/T/M3UtHTOH/fZWYSq7m45+gkwfQ///9bzg7w/vqnR8QstPlodZ6QE?=
 =?iso-8859-1?Q?/jtu1W0SRAAj4O6YetN/MH2opcZFDqm57SfMS1+6D0CsQpC4PAIyWTT39C?=
 =?iso-8859-1?Q?tpo5n7FHGgi+5WMoqj0xlUIB2893nr/wbkRJEk6KMTEJKUytqfN2i3kAeh?=
 =?iso-8859-1?Q?5mx0hbEmUVixKFRy/ZyxFBttTFrrrp+HWJ7SvWiwGdvvLp3fJmNgoyCYxV?=
 =?iso-8859-1?Q?LoFYezmpzzcxW4A87sDk3dT3f0vwGHKP0yBe6d5IwqDR95t6cjsCwXmuoI?=
 =?iso-8859-1?Q?zIdFM4vM5RxWFm3xNmkUWwB+F47YincEuQw89MDWeBEfFiUMe23Phn+obS?=
 =?iso-8859-1?Q?MdlISJfPxFXF8Nig81yGCzQFRNYEo1eykxsF+OIsKtBbPG7AfG//m/UzK9?=
 =?iso-8859-1?Q?4VZ2aGwdykuFUH0/akdeKsk2b4fabndgG+KM3ROOIHvbhhGl5XPxzZdZaD?=
 =?iso-8859-1?Q?JfVGTgsGOWfsMNlIvIqjFp/hKzY+0C0HRENIetwFW9gNevRoGlQvyRNNcr?=
 =?iso-8859-1?Q?jXxYKgQKJeI+kce3tJuebtb0pH2+8itSLiPBpSPsJNdP+KMkB8/nYILW64?=
 =?iso-8859-1?Q?lo6Vy3CLjUpINDURivt/T118XvrtxO8sMPlNNp40cDMizyX8DAPcA1VdPU?=
 =?iso-8859-1?Q?azWkD1medHII4NYYJDzZ3n4sOypsJM2LKbcwZF4skefrb5O7AHUfg4Aq7n?=
 =?iso-8859-1?Q?SmO7mYJIaoHdtvV4T2yUcbp+zFXmKlEfIP/ShNRfS3eJlyDgtOLPfNjwf9?=
 =?iso-8859-1?Q?2Ed1LexdN04m1KgkwNj9LEtK174iIEDpyU9x/qVmk5keCiHlOv9TFcurTf?=
 =?iso-8859-1?Q?GYpdMr21maiGMiCJeiaA4Du+4gmBs8mS34Ag7esWG/agXiiB65eGFHOg40?=
 =?iso-8859-1?Q?32RDwy00wB2QgxefnW8yjuEmJexFzEMNMqfviWvxikMBTNPQLooC/5BEhq?=
 =?iso-8859-1?Q?4kBhCJs0tV0RW+eK+7UAkJ4mn7ip4Y/tFPrTiyf0CGoLza9uPFQpN53nxY?=
 =?iso-8859-1?Q?fq7MZSEEV8lDZnZlj0YTXy0FC7m/TO6qspB+x0N7EYBf6JY70yNbwLCA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7643010-dd9d-442d-28f6-08dc58bd1d5a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 17:47:24.8037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPU/9GCDbke7UJOfPjsxCn+I0emdRZL7//q1zhMmgOvI5+bbujPoAV0Qg2T9OK8RC/kjTN1tB4JD9HTIgxzfsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6222
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

On Thu, Apr 04, 2024 at 05:44:30PM +0200, Michal Wajdeczko wrote:
> SR-IOV PF mode detection is based on PCI capability as reported by
> the PCI dev_is_pf() function and additionally on 'max_vfs' module
> parameter which could be also used to disable PF capability even
> if SR-IOV PF capability is reported by the hardware.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  3 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  4 ++
>  drivers/gpu/drm/xe/xe_sriov.c        |  3 +
>  drivers/gpu/drm/xe/xe_sriov_pf.c     | 89 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf.h     | 24 ++++++++
>  drivers/gpu/drm/xe/xe_sriov_types.h  | 15 +++++
>  6 files changed, 137 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e5b1715f721e..8d79df05b84f 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -159,7 +159,8 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_gt_sriov_pf_control.o \
>  	xe_lmtt.o \
>  	xe_lmtt_2l.o \
> -	xe_lmtt_ml.o
> +	xe_lmtt_ml.o \
> +	xe_sriov_pf.o
>  
>  # include helpers for tests even when XE is built-in
>  ifdef CONFIG_DRM_XE_KUNIT_TEST
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c710cec835a7..8244b177a6a3 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -321,6 +321,10 @@ struct xe_device {
>  	struct {
>  		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */
>  		enum xe_sriov_mode __mode;
> +
> +		/** @sriov.pf: PF specific data */
> +		struct xe_device_pf pf;
> +
>  		/** @sriov.wq: workqueue used by the virtualization workers */
>  		struct workqueue_struct *wq;
>  	} sriov;
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 3e103edf7174..94fa98d8206e 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -11,6 +11,7 @@
>  #include "xe_device.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf.h"
>  
>  /**
>   * xe_sriov_mode_to_string - Convert enum value to string.
> @@ -58,6 +59,8 @@ void xe_sriov_probe_early(struct xe_device *xe)
>  	if (has_sriov) {
>  		if (test_is_vf(xe))
>  			mode = XE_SRIOV_MODE_VF;
> +		else if (xe_sriov_pf_readiness(xe))
> +			mode = XE_SRIOV_MODE_PF;
>  	}
>  
>  	xe_assert(xe, !xe->sriov.__mode);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> new file mode 100644
> index 000000000000..030c2b69ecc4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_module.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_pf.h"
> +#include "xe_sriov_printk.h"
> +
> +static unsigned int wanted_max_vfs(struct xe_device *xe)
> +{
> +	return xe_modparam.max_vfs;
> +}
> +
> +static int pf_reduce_totalvfs(struct xe_device *xe, int limit)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	int err;
> +
> +	err = pci_sriov_set_totalvfs(pdev, limit);
> +	if (err)
> +		xe_sriov_notice(xe, "Failed to set number of VFs to %d (%pe)\n",
> +				limit, ERR_PTR(err));
> +	return err;
> +}
> +
> +static bool pf_continue_as_native(struct xe_device *xe, const char *why)
> +{
> +	xe_sriov_dbg(xe, "%s, continuing as native\n", why);
> +	pf_reduce_totalvfs(xe, 0);
> +	return false;
> +}
> +
> +/**
> + * xe_sriov_pf_readiness - Check if PF functionality can be enabled.
> + * @xe: the &xe_device to check
> + *
> + * This function is called as part of the SR-IOV probe to validate if all
> + * PF prerequisites are satisfied and we can continue with enabling PF mode.
> + *
> + * Return: true if the PF mode can be turned on.
> + */
> +bool xe_sriov_pf_readiness(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	int totalvfs = pci_sriov_get_totalvfs(pdev);
> +	int newlimit = min_t(u16, wanted_max_vfs(xe), totalvfs);
> +
> +	xe_assert(xe, totalvfs <= U16_MAX);

perhaps we should do this check before the min_t?

should we also check what we are getting from the params?

> +
> +	if (!dev_is_pf(dev))
> +		return false;
> +
> +	if (!xe_device_uc_enabled(xe))
> +		return pf_continue_as_native(xe, "Guc submission disabled");
> +
> +	if (!newlimit)
> +		return pf_continue_as_native(xe, "all VFs disabled");
> +
> +	pf_reduce_totalvfs(xe, newlimit);

do we really need to always call this or only when newlimit != totalvfs?

> +
> +	xe->sriov.pf.device_total_vfs = totalvfs;
> +	xe->sriov.pf.driver_max_vfs = newlimit;
> +
> +	return true;
> +}
> +
> +/**
> + * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
> + * @xe: the &xe_device to print info from
> + * @p: the &drm_printer
> + *
> + * Print SR-IOV PF related information into provided DRM printer.
> + */
> +void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	drm_printf(p, "total: %u\n", xe->sriov.pf.device_total_vfs);
> +	drm_printf(p, "supported: %u\n", xe->sriov.pf.driver_max_vfs);
> +	drm_printf(p, "enabled: %u\n", pci_num_vf(pdev));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
> new file mode 100644
> index 000000000000..ebef2e01838a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_H_
> +#define _XE_SRIOV_PF_H_
> +
> +#include <linux/types.h>
> +
> +struct drm_printer;
> +struct xe_device;
> +
> +#ifdef CONFIG_PCI_IOV
> +bool xe_sriov_pf_readiness(struct xe_device *xe);
> +void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
> +#else
> +static inline bool xe_sriov_pf_readiness(struct xe_device *xe)
> +{
> +	return false;
> +}

missing the vfs_summary function in this block?!

> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> index 1a138108d139..fa583e8fa0c2 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_SRIOV_TYPES_H_
>  
>  #include <linux/build_bug.h>
> +#include <linux/types.h>
>  
>  /**
>   * VFID - Virtual Function Identifier
> @@ -37,4 +38,18 @@ enum xe_sriov_mode {
>  };
>  static_assert(XE_SRIOV_MODE_NONE);
>  
> +/**
> + * struct xe_device_pf - Xe PF related data
> + *
> + * The data in this structure is valid only if driver is running in the
> + * @XE_SRIOV_MODE_PF mode.
> + */
> +struct xe_device_pf {
> +	/** @device_total_vfs: Maximum number of VFs supported by the device. */
> +	u16 device_total_vfs;
> +
> +	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
> +	u16 driver_max_vfs;
> +};
> +
>  #endif
> -- 
> 2.43.0
> 
