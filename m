Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0646FCE79CE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 13:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6B510E4B8;
	Wed, 20 Sep 2023 13:43:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE2E10E4B8
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 13:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695217379; x=1726753379;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cU/L1GT3SZoTXWIDDkrdKdwBQhc7rfUBo0jA825bGzU=;
 b=kBroWM1HuIRDfkxhb5Nru9zsWhTO3Lz+OimX+GYoTqvvRfPgtG/pZo+T
 2s3L2BVLlPwa28B2z/mBX8Ht/h0Wg7KWl9M4xPDQy1oPP0Q0Huw5Z/mbP
 6UBngYj2QGG2xxSOQbkAZmlOzudm7/oHQ8HZC0IcGWwP/A29ScGktU6ZB
 SBxxnU2uaPPU2/7iHwfCgHv3RBhdNFuro18dmigGhCSM0kOiH7KQRT+b7
 fhaXLMhzMBs0Ulcygn5+hTSzGvj32ev1SGv664/YewBZ1nn/kqLHbTgIC
 nLVPQHIFJbD24y9rorWjmLyW0dPTYPNiM5NdMPJizC9oOsbvyXceJBAB2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466538083"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="466538083"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 06:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="781694452"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="781694452"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 06:42:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 06:42:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 06:42:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 06:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMXytWDNL0Qt5KkHd0XNJJJO8pS/kNKxT6fQF7tD8c4UV2pn9dis1v5a4434rn6PnGVVw98PiX7s79Sxpg/knULgFKxjKAktZj9NrnWyHobKBy0HF7cw+dIaOD4IM1aXonHCrLRfxTM+SrBP5nfx6uFrtmOjFYMbaWTbhlVaWQELtEmDwUPEU88n4UKAZuTZfo80C6ZaBRgA08mISOyAitV9qwoBBeO0VnAHcuHWU0chY4hagg4I8DLHAnRLHnbi0lwx0ivyHnfIjF3eeUTOghEyDWByw3JsCiMR/fSup2Mh6a2cZpHd4HPYtQXC9Y0ecXLxJOHy0v3xjbQRBn1PaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/oSkOiA+XY3zSUOqp34ApT6sq2MhHyeCRuLaUN1Mvg=;
 b=V3nT1hTQvAVMHZTZMNXV6xoMnvQI0BmzimR89B5KkC4TQwUEa51mFVSCM7p36jNvIdHNdB7TQ6NXI6DpKk4eQf6O3TNi0Ux6y+9Zy6EmpPpfIvB/ohrNCIWjLbL6AKgIDZjR0YnHhtsFOTLu08uYyovU9iGtK1dEXapQFofKhIjBRbQEWmEluTPHkNhDpef7Va/h9sE7XSA1+Q5O/WqzXbecAo8V9av9RZf9my7Alg4Uz7eJkOZMCfem/eFF86HfQHvjm+b1uiVFqE8Xn8E04WXWLxyR/7Sd0pBFgbq6/5uR4BBRF0pzrbGsVFsml+tm5IuB2iNLg/56bEqS+6tUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6536.namprd11.prod.outlook.com (2603:10b6:930:40::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 13:42:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 13:42:53 +0000
Date: Wed, 20 Sep 2023 08:42:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <rjqitiiz4ichcg6qmc43m5mmybzzhrzjglhrzhcxdaesxa243u@tceadaeqt7i2>
References: <20230913231411.291933-8-matthew.d.roper@intel.com>
 <20230913231411.291933-14-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230913231411.291933-14-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: 815ad1b4-610d-48a8-9d57-08dbb9df7d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vj/II9fwxvyeaotfJBXh209Za58uKeZnKh7pehwu2oCbT2E48bcvT8BpvUoekCwP0gLfzLrcqz/ssY5kH197HOwYk5hOxPaD+O1/bu+zlDrY966Ox+9YsyAbprVCNNl03DbyHYaEp47crhxf14YCz+sqF0MIn//fhbyu09ZstzAq0erZMwZnkFXwKeTpX0r9OULRO6yL5Ai3zJ0K50dE0/CvL5yN0W6BVFo36iJ4X9kp0J2nheNRLJ1+hVXpln+oTSFE7StXYh+a8lsN2OwD2qwukSlMOwg22q0IflYY6UZHhq2vO2BwxBXRjGtq84gz7xhlJV0c4Ri2Rj4mlRPS/YGCYDMJZpo1GoU53I9hROQhHFTzMnHwGAsoq+Mov1269ipKA+hKqrQuuU470vVOT+4gDn+PXlbf9mfMa7scrI44/j+pmIC2Wd2SRjGNT+S8NwE+iE2GgYW/rKIygybW0BqNSLlZRBYLNF66R9mfvwwR0+YQSkOaBQjXCGjsYsnx9QgpBzMDaxWWlEwxxSCFU7sJPwOww0zOAF5tvrvt7ynNels5bw4kO2klAVlYdxzl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(136003)(376002)(39860400002)(396003)(1800799009)(451199024)(186009)(6486002)(6512007)(66899024)(6506007)(9686003)(82960400001)(38100700002)(33716001)(86362001)(83380400001)(5660300002)(478600001)(41300700001)(66476007)(66946007)(66556008)(6636002)(316002)(6862004)(8676002)(4326008)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CnpmyBHD/nkIipwIMcBt1piE2aIHS7SFPLZio8oXIzn5pk5BsmOo8bbiCG?=
 =?iso-8859-1?Q?c8RBuCjIedHHWj25l48ju2jfqBqAPoQoWEjvGvec02uCM2eC9WUlDGuYO3?=
 =?iso-8859-1?Q?3YtDyfVRwmPmr7Hb0RcrlbfsY5ogAgps2y62/97kCcmZSTmmxnvhaDwpcl?=
 =?iso-8859-1?Q?RNS7a2G2ii3v4rygrFeg+HUTxob3NNmHb6FChMNQRY9B5l/GsGU+wPvJxD?=
 =?iso-8859-1?Q?ExZ1hoNmhBqQIELEd6WauV4MJIKNtj4LGKrsX6Np5x/DEOx0xne++dwHdQ?=
 =?iso-8859-1?Q?TBWHlWtzvuNjGlRX2hvPZ/g3cjvQCrwLC5JZPZ0h69DF2aj/wzdO5RT43i?=
 =?iso-8859-1?Q?TT8j9RWAb2aVGlUrYXSU3umBUIjTZ7TJct0AQdbUDZsz0Zmt9i0nk4Mv3f?=
 =?iso-8859-1?Q?EVsqjLhnVUkNV2Jl5w7jysUDc4V+V4SOqf0Jf1abUsijNaMZnuJoCUJxSR?=
 =?iso-8859-1?Q?2VzCJDpvHK5+M5YkVz3R5vZs0UXT7aZTS7fMPoEzRArlHAdJ8p0l8YMrtx?=
 =?iso-8859-1?Q?Rd0mg2npMHb6RUbibSbTKAUf0NsJA1gmVgL8wmBSLofBEB278oK2v9xTh9?=
 =?iso-8859-1?Q?aXZ3Zk3+mLYi2nb6SAUYNQ6x+8yLWZSAkVuEf9LHHAvN+V/ePQtkcSFYw5?=
 =?iso-8859-1?Q?BmSKwu3N1veslQp8ZUaTf5zhg2Xt9V02MT2gHKdu7W5DBF9iBA0htAfgMr?=
 =?iso-8859-1?Q?P6uP1hAJ3fgAImhvPpK5mQbIXf5zekbmIFegpdIHytpL9f6DK0kUnoFL0v?=
 =?iso-8859-1?Q?M74OVvze1/U9LbTfZ7LuMTSjuvV7rM/7bLBSE6SpEuOrnt1Z11D0lVuPeu?=
 =?iso-8859-1?Q?o9fCCQOKLKaaBzgV9mg+Gk7MYsAgaT9Xk1hbGfHkRu3pNFM0UAac5lTGkq?=
 =?iso-8859-1?Q?TxZHWlPMQgfI/7wRTssJd+GR2G8V0Ci/4O+LE5ScDyd6lE7oCy6u1301yj?=
 =?iso-8859-1?Q?GW9t7MsdjXvN+OIEN5xV1JNERHXJ//AVq+AyhYQDBA3WIUFLbPSLOKxpLz?=
 =?iso-8859-1?Q?wa6WRaZL3a7GOd7EDaAxkfdPvXdzy/9uhQhMqmuqipQ/ErMAigyhKcrkL5?=
 =?iso-8859-1?Q?pOVeg9PF0XkKp/At0bZbWig6iI1eZXck1KvxTsboYwuMfaSdtfQ32f1XKE?=
 =?iso-8859-1?Q?WqDF/wbkH/QMXkEIJFL88KipQXOkOx0hXaLNnP7O4DE7vkgSKJuBoHDFZX?=
 =?iso-8859-1?Q?vBmyZkZvUHpNs/OspHvKb/rjFVuLkPjwSO0BUO/NwsqHA2+Rpo/NG2Vy0K?=
 =?iso-8859-1?Q?6FBm3qzr84Dbj8qMkaaW0zDsEMrgtzDtiW2+yyXtar3oHL1/GJose+aN5q?=
 =?iso-8859-1?Q?V7geb4w8UiN3+QYHok12rCUfPT2JVTXjqmnH9NKSJbbUqMiq+b88Wu095K?=
 =?iso-8859-1?Q?V6b+fXOcl/PQl2C2RBooQkr6kzgMCc2Q0ZDAgUrfCXsV6kTXQAkySZkHgB?=
 =?iso-8859-1?Q?Ysqj2/vxTf7nIS+l8RH02BwPkJ/qAcixN2a4e9BoELVFSIT426TcHlIuiQ?=
 =?iso-8859-1?Q?6q4JHVqy0DnOq6naRV8U6D6N7TiD2/b1sU6zm4yae2XvGKkcWzjKjGMJWK?=
 =?iso-8859-1?Q?/SyDUB5e0OJCPN8xsOcALq0v6O5LBHrXrwfRUNqVovQZreqpYMwi80OBgj?=
 =?iso-8859-1?Q?EujMjHmaCDyFkOsBpDZ7m6DmbOrgLtmbIQM7MU6Hj8CCu3r82wTmkVwys9?=
 =?iso-8859-1?Q?bMJpubmJByFPDBHq75c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 815ad1b4-610d-48a8-9d57-08dbb9df7d43
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 13:42:53.5413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OiTrhCJ8fyevi65m43WCx9GhS2CK4ceGVfY+yEk3MmEbvT4j0dGAI7OqiO7VQdLPQiXFEAeJs3aNjSgCqYlmhJN76Cg235ybBZxv8VE8lno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6536
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] fixup! drm/xe/display: Implement display
 support
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

On Wed, Sep 13, 2023 at 04:14:18PM -0700, Matt Roper wrote:
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/Makefile                   |   4 +-
> .../drm/xe/display/ext/intel_clock_gating.c   | 124 ------------------
> drivers/gpu/drm/xe/xe_display.c               |   2 -
> 3 files changed, 2 insertions(+), 128 deletions(-)
> delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 9d2311f8141f..bcfa7daf7303 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -147,8 +147,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
> 	display/xe_plane_initial.o \
> 	display/xe_display_rps.o \
> 	display/ext/i915_irq.o \
>-	display/ext/i915_utils.o \
>-	display/ext/intel_clock_gating.o
>+	display/ext/i915_utils.o
>
> # SOC code shared with i915
> xe-$(CONFIG_DRM_XE_DISPLAY) += \
>@@ -183,6 +182,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
> 	i915-display/intel_display_power_map.o \
> 	i915-display/intel_display_power_well.o \
> 	i915-display/intel_display_trace.o \
>+	i915-display/intel_display_wa.o \
> 	i915-display/intel_dkl_phy.o \
> 	i915-display/intel_dmc.o \
> 	i915-display/intel_dp.o \
>diff --git a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
>deleted file mode 100644
>index 88b1aee0351f..000000000000
>--- a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
>+++ /dev/null
>@@ -1,124 +0,0 @@
>-/*
>- * Copyright © 2012 Intel Corporation
>- *
>- * Permission is hereby granted, free of charge, to any person obtaining a
>- * copy of this software and associated documentation files (the "Software"),
>- * to deal in the Software without restriction, including without limitation
>- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>- * and/or sell copies of the Software, and to permit persons to whom the
>- * Software is furnished to do so, subject to the following conditions:
>- *
>- * The above copyright notice and this permission notice (including the next
>- * paragraph) shall be included in all copies or substantial portions of the
>- * Software.
>- *
>- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
>- * IN THE SOFTWARE.
>- *
>- * Authors:
>- *    Eugeni Dodonov <eugeni.dodonov@intel.com>
>- *
>- */
>-
>-#include "intel_de.h"
>-#include "intel_display_trace.h"
>-
>-#include "i915_drv.h"
>-#include "i915_reg.h"
>-#include "intel_clock_gating.h"
>-#include "intel_mchbar_regs.h"
>-
>-static void gen12lp_init_clock_gating(struct drm_i915_private *dev_priv)
>-{
>-	/* Wa_1409120013 */
>-	if (DISPLAY_VER(dev_priv) == 12)
>-		intel_de_write(dev_priv, ILK_DPFC_CHICKEN(INTEL_FBC_A),
>-				   DPFC_CHICKEN_COMP_DUMMY_PIXEL);
>-
>-	/* Wa_1409825376:tgl (pre-prod)*/
>-	if (IS_TIGERLAKE(dev_priv) && IS_DISPLAY_STEP(dev_priv, STEP_A0, STEP_C0))
>-		intel_de_write(dev_priv, GEN9_CLKGATE_DIS_3, intel_de_read(dev_priv, GEN9_CLKGATE_DIS_3) |
>-			   TGL_VRH_GATING_DIS);
>-
>-	/* Wa_14013723622:tgl,rkl,dg1,adl-s */
>-	if (DISPLAY_VER(dev_priv) == 12)
>-		intel_de_rmw(dev_priv, CLKREQ_POLICY,
>-				 CLKREQ_POLICY_MEM_UP_OVRD, 0);
>-}
>-
>-static void adlp_init_clock_gating(struct drm_i915_private *dev_priv)
>-{
>-	gen12lp_init_clock_gating(dev_priv);
>-
>-	/* Wa_22011091694:adlp */
>-	intel_de_rmw(dev_priv, GEN9_CLKGATE_DIS_5, 0, DPCE_GATING_DIS);
>-
>-	/* Bspec/49189 Initialize Sequence */
>-	intel_de_rmw(dev_priv, GEN8_CHICKEN_DCPR_1, DDI_CLOCK_REG_ACCESS, 0);
>-}
>-
>-static void dg1_init_clock_gating(struct drm_i915_private *dev_priv)
>-{
>-	gen12lp_init_clock_gating(dev_priv);
>-
>-	/* Wa_1409836686:dg1[a0] */
>-	if (IS_DG1_GRAPHICS_STEP(dev_priv, STEP_A0, STEP_B0))
>-		intel_de_write(dev_priv, GEN9_CLKGATE_DIS_3, intel_de_read(dev_priv, GEN9_CLKGATE_DIS_3) |
>-			   DPT_GATING_DIS);
>-}
>-
>-static void xehpsdv_init_clock_gating(struct drm_i915_private *dev_priv)
>-{
>-	/* Wa_22010146351:xehpsdv */
>-	if (IS_XEHPSDV_GRAPHICS_STEP(dev_priv, STEP_A0, STEP_B0))
>-		intel_de_rmw(dev_priv, XEHP_CLOCK_GATE_DIS, 0, SGR_DIS);
>-}
>-
>-static void dg2_init_clock_gating(struct drm_i915_private *i915)
>-{
>-	/* Wa_22010954014:dg2 */
>-	intel_de_rmw(i915, XEHP_CLOCK_GATE_DIS, 0,
>-			 SGSI_SIDECLK_DIS);
>-
>-	/*
>-	 * Wa_14010733611:dg2_g10
>-	 * Wa_22010146351:dg2_g10
>-	 */
>-	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_B0))
>-		intel_de_rmw(i915, XEHP_CLOCK_GATE_DIS, 0,
>-				 SGR_DIS | SGGI_DIS);
>-}
>-
>-static void pvc_init_clock_gating(struct drm_i915_private *dev_priv)
>-{
>-	/* Wa_14012385139:pvc */
>-	if (IS_PVC_BD_STEP(dev_priv, STEP_A0, STEP_B0))
>-		intel_de_rmw(dev_priv, XEHP_CLOCK_GATE_DIS, 0, SGR_DIS);
>-
>-	/* Wa_22010954014:pvc */
>-	if (IS_PVC_BD_STEP(dev_priv, STEP_A0, STEP_B0))
>-		intel_de_rmw(dev_priv, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
>-}
>-
>-void intel_clock_gating_init(struct drm_i915_private *dev_priv)
>-{
>-	if (IS_PONTEVECCHIO(dev_priv))
>-		pvc_init_clock_gating(dev_priv);
>-	else if (IS_DG2(dev_priv))
>-		dg2_init_clock_gating(dev_priv);
>-	else if (IS_XEHPSDV(dev_priv))
>-		xehpsdv_init_clock_gating(dev_priv);
>-	else if (IS_ALDERLAKE_P(dev_priv))
>-		adlp_init_clock_gating(dev_priv);
>-	else if (IS_DG1(dev_priv))
>-		dg1_init_clock_gating(dev_priv);
>-	else if (GRAPHICS_VER(dev_priv) == 12)
>-		gen12lp_init_clock_gating(dev_priv);
>-	else
>-		MISSING_CASE(INTEL_DEVID(dev_priv));
>-}
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index 0b569b229ab1..ffaaacc72c54 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -18,7 +18,6 @@
> #include "intel_acpi.h"
> #include "intel_audio.h"
> #include "intel_bw.h"
>-#include "intel_clock_gating.h"
> #include "intel_display.h"
> #include "intel_display_driver.h"
> #include "intel_display_irq.h"
>@@ -399,7 +398,6 @@ void xe_display_pm_resume(struct xe_device *xe)
> 		drm_mode_config_reset(&xe->drm);
>
> 	intel_display_driver_init_hw(xe);
>-	intel_clock_gating_init(xe);
> 	intel_hpd_init(xe);
>
> 	/* MST sideband requires HPD interrupts enabled */
>-- 
>2.41.0
>
