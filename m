Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66594C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 18:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466A710E256;
	Fri, 24 Feb 2023 18:06:24 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F2510E256
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677261982; x=1708797982;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3HrKmOjccobkzWEnB8lwOBvBaMfXRhEiGdce3nuTrYs=;
 b=ONy3X2OtSF9Q5SQBk0tx08n0HpGO1rEmuUtT+B5fDiu3Rn35znjnAu27
 7Df4o40jYbmZjyTe8IdG6kSXx3RJsYrh67XaAdbM657k86mRGl+09K1qD
 B+9aDm4ssY+WZPCmtypj/+b3CdQvzmoTKU69OHqOw4G+lbfwYbpNxI4uL
 PCBYcJDsfMyyKv+HG07eu3uqeKU3rZTNr//M8Ll3lXzf9hpjYc4luVsCt
 EKR8UeWzzLgysl9CI8S+/m3LTjePEvWAuubAJoh6q4SvTSF3QQ36gz3cq
 h+aJhf5MX1ctMxNaXTgKJawCPe2kJ3xU19Wsgf8RJKCxbxJZgyFqm7BCF Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361046429"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="361046429"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 10:06:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="782449794"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="782449794"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2023 10:06:21 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 10:06:20 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 10:06:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 10:06:20 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 10:06:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9Y330FVklkLQaUriHFSj24dLapqXa0FZZqGt6pZ/ZIhKwOqWD85xJyLXG0SbyjIN+L3YN0u54VxjS7VwHCmEXVt9bj4PvAYuMimiqbHvbdQMOGHb+gOP7lCODDu/FYzL43U47R3apU+iNbK56DaDtWv1W7k1ItWp7e1poKVy+Rhqq/1BThytGlmxylHKzhOkj1B2EooifW5XOZgd2NLTxmlTxBa4XqYIp5y/jq9Abb7QdfMKSjo8MGeZClTHS15gNfeFA8UPyDYI5r80QmhzKJNTbEWW/lYrhBkd3ntsbkbMlFfdClmklqXD3m+EXMZPQ8UEMTejTiS8Gwzi9B50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+p0VDiS+seZYc27xIURRN0neycLo9ja2rTmi2UvlBtg=;
 b=WBgTN80fyrcCzY1z0f1qHuEDykR/YuIFEbO+NAUQKxbLqXkk5/sMA7r6/GRsMUm/IX2FCeSDyQs+yYJRmlAR8CM/BzFCSxLkGwkjoC5eBjwc3uclnI2r5xW1/1E9Hb/Ro0WsTN/I31uS1o/HBqwrFQBKgz0MJNGmCT3JexHvmbvLctIK/+MyWKhiy0Wy1lXbz9qtjS9UgROI05LOQH2uk23wIXbLVQfUz1XLUKvNbpkn0ssP0nJr8KKjJ8cjA0+Gx2pLUALt2NN7gFxTE9OgWuY4J9uJ/JIJOvrL+1mcPcvitu0K+tM+eiMKfN3mwbZPPlerua9gLwP/0lv+c+4bng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 18:06:17 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 18:06:17 +0000
Date: Fri, 24 Feb 2023 10:06:14 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/j8lmaf2b49It/M@mdroper-desk1.amr.corp.intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230217005226.106499-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::36) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 0423e4db-6ced-45eb-5398-08db1691d315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NDwr/cpJ03tEtrWXfsKTVzbilAqQ6v2wz2hqdtcmTQxOgma2EMjD+iYq0gWuezGQCdMxeWTH0v/34lFSBE2rg7jchbby8gJNPIXvPmE2cWsuUcuzxC3wC2poNQ8EFTKRFU4slPFvX2BisZAy6W96eGjI+yZw89hjkP3bZLcwCgQRZ0wvcqGv2j6fNYxAR3CmJXi/ZyOBoYpWKxZudwj5SY+vxG4eHO6kNm8h6wdeH5d0Lmh7CraP59bU/UNot/PSeXLEVH2UsrZa+hAbMqQUhnMAFic/bSVi0n7Kwl3DUgf0IIFgTr+nS4Rc4ODsVrWp8+wVDR0ZoGkqwssmwmQWOJtaOZLv9yIsZBj9ctMBXohN/bfBOdZ2AtaLvxfsDkQysUi85DyRttlw30Ru1y2Du7eTsr2vzlS0nYjaHHoUAE1/Tk24lgVRFgjyb0TWKob/fLg/hBW91BLdHc0rW8GqX8GXZsEsyjUxTQBmVXTf7donCh/DDV1A4RD2hgsnwOPbyj/kNdRwNZQWB8byYc7pLfikFS6LHaABzNXwe4ASF5T1qQoUIsyawkJdXSVGQmYNuYlHHGjl8i6Iy7VbhMH8kXBN0J3zobXm+8LTa6l3eNIZCiO1vFoQU++0LVl6AWbVpEh9JH2IuyCrfT6ZiW3ZMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199018)(30864003)(2906002)(66574015)(83380400001)(26005)(186003)(82960400001)(38100700002)(8676002)(66946007)(316002)(66556008)(4326008)(66476007)(5660300002)(41300700001)(6506007)(6666004)(107886003)(6512007)(478600001)(86362001)(6862004)(6486002)(8936002)(6636002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iX3qaxnT/RnNEq2SUnhVYQMxhfprmpChAiegJFUwM8M4P/APXVj47EBokJ?=
 =?iso-8859-1?Q?IoiXZjuLdYyodQ7/KIxwedc87KAtsPiTLFEI5wcObSn9KdjazyN4qIuCtk?=
 =?iso-8859-1?Q?rVAvG5W1AK5CDlw5sQR/XaE9iMc7fIwG7CY2p7UReQnauilAdtAz3TDKFa?=
 =?iso-8859-1?Q?HNXAadbdEv0cFUhip3aBrzFL1C0uW4hQN7TGRsB/gDjQmVAlRpF7Efm+Pz?=
 =?iso-8859-1?Q?WJ59RqaGqus3m6nOLpxqdHBcXI7hnzHddGLbSQ1wPNJ8vDYtl65Q7FELr5?=
 =?iso-8859-1?Q?7ly8vSW8JrzVfygDyipGSpj1jxJEo2ZY8oVC6JcpUz5j0p7LjnUt3JhDAb?=
 =?iso-8859-1?Q?LSWOaxTsNumCquZtGjkLruhnvv8da0C7/nWtIBYx1Bka5WIgbxgLOsN2Mn?=
 =?iso-8859-1?Q?52XQQ4GtAvFj/UvHHgHMfYhNRN89pE63LB86jXih+wrHUEbJ5uSBD04IWp?=
 =?iso-8859-1?Q?qdchvWs+xtQKZm7HsmW5JK8Y3+WBshBKMqlXxCcmizY00/Sq1ljhYCrvJp?=
 =?iso-8859-1?Q?Up8QA1SFnpjj7qzK7N9MbqEqaJXHKB4Fd3+dYUcQ3OMJPGJ20C0i/sZEHe?=
 =?iso-8859-1?Q?jLLtizmg4pjnCWekb3pIVDy+2tpNxs/sObmuIuT2Bio1RoOV+IIPX7kSWt?=
 =?iso-8859-1?Q?c4nEkj/TLWKLjgHFtuyWG4Rs9WicALwTv3kuH87E38oE2YOJ27DGMabwhk?=
 =?iso-8859-1?Q?NdA2aAyVn69YhwukRxCs1eTHt8S4XYV271BRrziyZdJvetb3Bh5cdOP55N?=
 =?iso-8859-1?Q?7O05FjRSutlduaNzC3jetbTMJzJNlwOPKjlRQ17ulPfOIBk9B+LXLlY2dL?=
 =?iso-8859-1?Q?rYLFJe5LwftXNhvUicMncUy8c34aRDk0LmDLHzm2gtvsyGuKQ+ItGltkRe?=
 =?iso-8859-1?Q?00TvRb2cmnT8G1pLadfu8Ja9yXBOo6w/7XuEhmb2a+UXjzvUAJd7C7QAC1?=
 =?iso-8859-1?Q?9hejDAYebrCoKXwHWGK9Ar++4G9AVCurwWKgCnTEfuZtr14LO5haK7sCMD?=
 =?iso-8859-1?Q?dIAdl/vbUOBOxSCuRzgb13p2B25sipkvckrRD1YX2dTOGRkt+MinDYG6tp?=
 =?iso-8859-1?Q?UgiF0mSavRnmb4Ii+p+++f3GU+V6kSPaLarECIrjIRuV1VEVG3JYqxuTEw?=
 =?iso-8859-1?Q?kXJF95k/uDlVMSTQGSim3m55i114tARDm7mbUS8mqy/sBfQmQAYhT1n5mf?=
 =?iso-8859-1?Q?T4ojLpvU0ypAXDTV6qaLhjUAAXbRBGQd1+8+rTNwZd7hKmcC5ZQuhAi9Q0?=
 =?iso-8859-1?Q?M9YSD9Omjj6h2US/uZBkhdOvLxw7JWDL9EQbhr/mecRnuCnaYd0B6jhdQ+?=
 =?iso-8859-1?Q?O7ZAGVMuOvIS5QGfRlryuJMm6yYi7uf1QVU3/FfL8KcnYjH9CVT4AEGkYj?=
 =?iso-8859-1?Q?edfpCOdHIxZIb72/XtV72ExhDd8Du5k297WI/C7f3mzAH7xJPLICz4UDJt?=
 =?iso-8859-1?Q?+PcUQClGz6vtx289OBDHNyXnB9zxfzjADxe18ReAijzgoZUWPkKbrO4cCj?=
 =?iso-8859-1?Q?cy49b55RQ7kIIkFtvoAdnFyQ+EGq1/Ei6P5mUoNjUv8T3Y/heNO7lAmvEL?=
 =?iso-8859-1?Q?XoGoN81vsz6Qg7DTCEVoTS9CUkFV5xG8d2bX0x1gZN8ENIqz/ns3UTTXgr?=
 =?iso-8859-1?Q?Vm8uWH81cedgaGVBjU0QmQNGWLofv7P2yGZxLIxmuBzimIk5i5MkgWsA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0423e4db-6ced-45eb-5398-08db1691d315
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 18:06:17.2860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32q+MokArjaZ343WVcQ3DQVlc2QAQN7oOLoX3HvRUKj9SIDZEjlFMe6WtCubPe3WCacvAyOkC1mTbQMg7T+0Uselno+AZGk8q4fx5g9YMT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/11] drm/xe: Remove dependency on
 intel_gt_regs.h
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 04:52:20PM -0800, Lucas De Marchi wrote:
> Create regs/xe_gt_regs.h file with all the registers and bit
> definitions used by the xe driver. Eventually the registers may be
> defined in a different way and since xe doesn't supported below gen12,
> the number of registers touched is much smaller, so create a new header.
> 
> The definitions themselves are direct copy from the
> gt/intel_gt_regs.h file, just sorting the registers by address.
> Cleaning those up and adhering to a common coding style is left for
> later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg_defs.h  |   2 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h  | 287 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_execlist.c      |   2 +-
>  drivers/gpu/drm/xe/xe_force_wake.c    |   3 +-
>  drivers/gpu/drm/xe/xe_ggtt.c          |   2 +-
>  drivers/gpu/drm/xe/xe_gt.c            |   3 +-
>  drivers/gpu/drm/xe/xe_gt_clock.c      |   2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.c        |   3 +-
>  drivers/gpu/drm/xe/xe_guc.c           |   2 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c       |   4 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c        |   2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c     |   2 +-
>  drivers/gpu/drm/xe/xe_irq.c           |   2 +-
>  drivers/gpu/drm/xe/xe_lrc.c           |   2 +-
>  drivers/gpu/drm/xe/xe_mmio.c          |   2 +-
>  drivers/gpu/drm/xe/xe_mocs.c          |   3 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c        |   3 +-
>  drivers/gpu/drm/xe/xe_reg_whitelist.c |   3 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c      |   2 +-
>  drivers/gpu/drm/xe/xe_tuning.c        |   3 +-
>  drivers/gpu/drm/xe/xe_wa.c            |   2 +-
>  21 files changed, 308 insertions(+), 28 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_regs.h
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
> index b5e06b6a9478..a6080c983a77 100644
> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> @@ -136,6 +136,8 @@ typedef struct {
>  	u32 reg;
>  } i915_mcr_reg_t;
>  
> +#define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })

Should there be a corresponding removal of this definition from
drivers/gpu/drm/i915/gt/intel_gt_regs.h ?

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +
>  #define INVALID_MMIO_REG _MMIO(0)
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> new file mode 100644
> index 000000000000..da40133252fb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -0,0 +1,287 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_REGS_H_
> +#define _XE_GT_REGS_H_
> +
> +#include "i915_reg_defs.h"
> +
> +/* RPM unit config (Gen8+) */
> +#define RPM_CONFIG0				_MMIO(0xd00)
> +#define   GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT	3
> +#define   GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK	(0x7 << GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT)
> +#define   GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ	0
> +#define   GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ	1
> +#define   GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ	2
> +#define   GEN11_RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ	3
> +#define   GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT	1
> +#define   GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK	(0x3 << GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT)
> +
> +#define FORCEWAKE_ACK_MEDIA_VDBOX_GEN11(n)	_MMIO(0xd50 + (n) * 4)
> +#define FORCEWAKE_ACK_MEDIA_VEBOX_GEN11(n)	_MMIO(0xd70 + (n) * 4)
> +#define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
> +
> +#define GEN9_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
> +#define LNCFCMOCS_REG_COUNT			32
> +
> +#define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> +#define MTL_MCR_SELECTOR			_MMIO(0xfd4)
> +#define SF_MCR_SELECTOR				_MMIO(0xfd8)
> +#define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
> +#define GAM_MCR_SELECTOR			_MMIO(0xfe0)
> +#define   GEN11_MCR_MULTICAST			REG_BIT(31)
> +#define   GEN11_MCR_SLICE(slice)		(((slice) & 0xf) << 27)
> +#define   GEN11_MCR_SLICE_MASK			GEN11_MCR_SLICE(0xf)
> +#define   GEN11_MCR_SUBSLICE(subslice)		(((subslice) & 0x7) << 24)
> +#define   GEN11_MCR_SUBSLICE_MASK		GEN11_MCR_SUBSLICE(0x7)
> +#define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
> +#define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
> +
> +#define GEN7_FF_SLICE_CS_CHICKEN1		_MMIO(0x20e0)
> +#define   GEN9_FFSC_PERCTX_PREEMPT_CTRL		(1 << 14)
> +
> +#define GEN9_CS_DEBUG_MODE1			_MMIO(0x20ec)
> +#define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
> +
> +#define PS_INVOCATION_COUNT			_MMIO(0x2348)
> +
> +#define GEN8_CS_CHICKEN1			_MMIO(0x2580)
> +#define   GEN9_PREEMPT_3D_OBJECT_LEVEL		(1 << 0)
> +#define   GEN9_PREEMPT_GPGPU_LEVEL(hi, lo)	(((hi) << 2) | ((lo) << 1))
> +#define   GEN9_PREEMPT_GPGPU_MID_THREAD_LEVEL	GEN9_PREEMPT_GPGPU_LEVEL(0, 0)
> +#define   GEN9_PREEMPT_GPGPU_THREAD_GROUP_LEVEL	GEN9_PREEMPT_GPGPU_LEVEL(0, 1)
> +#define   GEN9_PREEMPT_GPGPU_COMMAND_LEVEL	GEN9_PREEMPT_GPGPU_LEVEL(1, 0)
> +#define   GEN9_PREEMPT_GPGPU_LEVEL_MASK		GEN9_PREEMPT_GPGPU_LEVEL(1, 1)
> +
> +#define GEN12_GLOBAL_MOCS(i)			_MMIO(0x4000 + (i) * 4) /* Global MOCS regs */
> +#define GEN12_GFX_CCS_AUX_NV			_MMIO(0x4208)
> +
> +#define GEN12_VD0_AUX_NV			_MMIO(0x4218)
> +#define GEN12_VE0_AUX_NV			_MMIO(0x4238)
> +
> +#define GEN12_VE1_AUX_NV			_MMIO(0x42b8)
> +#define   AUX_INV				REG_BIT(0)
> +
> +#define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
> +#define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
> +#define XEHP_FLAT_CCS_BASE_ADDR			MCR_REG(0x4910)
> +
> +#define GEN12_FF_MODE2				_MMIO(0x6604)
> +#define XEHP_FF_MODE2				MCR_REG(0x6604)
> +#define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
> +#define   FF_MODE2_GS_TIMER_224			REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
> +#define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
> +#define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
> +
> +#define HIZ_CHICKEN				_MMIO(0x7018)
> +#define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
> +
> +/* GEN7 chicken */
> +#define GEN7_COMMON_SLICE_CHICKEN1		_MMIO(0x7010)
> +
> +#define GEN11_COMMON_SLICE_CHICKEN3		_MMIO(0x7304)
> +#define XEHP_COMMON_SLICE_CHICKEN3		MCR_REG(0x7304)
> +#define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
> +#define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE	REG_BIT(12)
> +#define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC	REG_BIT(11)
> +#define   GEN12_DISABLE_CPS_AWARE_COLOR_PIPE	REG_BIT(9)
> +
> +#define XEHP_SQCM				MCR_REG(0x8724)
> +#define   EN_32B_ACCESS				REG_BIT(30)
> +
> +#define	GEN10_MIRROR_FUSE3			_MMIO(0x9118)
> +#define   GEN10_L3BANK_PAIR_COUNT		4
> +#define   GEN10_L3BANK_MASK			0x0F
> +/* on Xe_HP the same fuses indicates mslices instead of L3 banks */
> +#define   GEN12_MAX_MSLICES			4
> +#define   GEN12_MEML3_EN_MASK			0x0F
> +
> +/* Fuse readout registers for GT */
> +#define XEHP_FUSE4				_MMIO(0x9114)
> +#define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
> +
> +#define GEN11_GT_VEBOX_VDBOX_DISABLE		_MMIO(0x9140)
> +#define   GEN11_GT_VDBOX_DISABLE_MASK		0xff
> +#define   GEN11_GT_VEBOX_DISABLE_SHIFT		16
> +#define   GEN11_GT_VEBOX_DISABLE_MASK		(0x0f << GEN11_GT_VEBOX_DISABLE_SHIFT)
> +
> +#define GEN6_GDRST				_MMIO(0x941c)
> +#define   GEN11_GRDOM_GUC			REG_BIT(3)
> +#define   GEN6_GRDOM_FULL			(1 << 0)
> +#define   GEN11_GRDOM_FULL			GEN6_GRDOM_FULL
> +
> +#define GEN7_MISCCPCTL				_MMIO(0x9424)
> +#define   GEN7_DOP_CLOCK_GATE_ENABLE		(1 << 0)
> +#define   GEN12_DOP_CLOCK_GATE_RENDER_ENABLE	REG_BIT(1)
> +
> +#define UNSLCGCTL9430				_MMIO(0x9430)
> +#define   MSQDUNIT_CLKGATE_DIS			REG_BIT(3)
> +
> +#define UNSLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x9434)
> +#define   VFUNIT_CLKGATE_DIS			REG_BIT(20)
> +#define   TSGUNIT_CLKGATE_DIS			REG_BIT(17) /* XEHPSDV */
> +#define   CG3DDISCFEG_CLKGATE_DIS		REG_BIT(17) /* DG2 */
> +#define   GAMEDIA_CLKGATE_DIS			REG_BIT(11)
> +#define   HSUNIT_CLKGATE_DIS			REG_BIT(8)
> +#define   VSUNIT_CLKGATE_DIS			REG_BIT(3)
> +
> +#define UNSLCGCTL9440				_MMIO(0x9440)
> +#define   GAMTLBOACS_CLKGATE_DIS		REG_BIT(28)
> +#define   GAMTLBVDBOX5_CLKGATE_DIS		REG_BIT(27)
> +#define   GAMTLBVDBOX6_CLKGATE_DIS		REG_BIT(26)
> +#define   GAMTLBVDBOX3_CLKGATE_DIS		REG_BIT(24)
> +#define   GAMTLBVDBOX4_CLKGATE_DIS		REG_BIT(23)
> +#define   GAMTLBVDBOX7_CLKGATE_DIS		REG_BIT(22)
> +#define   GAMTLBVDBOX2_CLKGATE_DIS		REG_BIT(21)
> +#define   GAMTLBVDBOX0_CLKGATE_DIS		REG_BIT(17)
> +#define   GAMTLBKCR_CLKGATE_DIS			REG_BIT(16)
> +#define   GAMTLBGUC_CLKGATE_DIS			REG_BIT(15)
> +#define   GAMTLBBLT_CLKGATE_DIS			REG_BIT(14)
> +#define   GAMTLBVDBOX1_CLKGATE_DIS		REG_BIT(6)
> +
> +#define UNSLCGCTL9444				_MMIO(0x9444)
> +#define   GAMTLBGFXA0_CLKGATE_DIS		REG_BIT(30)
> +#define   GAMTLBGFXA1_CLKGATE_DIS		REG_BIT(29)
> +#define   GAMTLBCOMPA0_CLKGATE_DIS		REG_BIT(28)
> +#define   GAMTLBCOMPA1_CLKGATE_DIS		REG_BIT(27)
> +#define   GAMTLBCOMPB0_CLKGATE_DIS		REG_BIT(26)
> +#define   GAMTLBCOMPB1_CLKGATE_DIS		REG_BIT(25)
> +#define   GAMTLBCOMPC0_CLKGATE_DIS		REG_BIT(24)
> +#define   GAMTLBCOMPC1_CLKGATE_DIS		REG_BIT(23)
> +#define   GAMTLBCOMPD0_CLKGATE_DIS		REG_BIT(22)
> +#define   GAMTLBCOMPD1_CLKGATE_DIS		REG_BIT(21)
> +#define   GAMTLBMERT_CLKGATE_DIS		REG_BIT(20)
> +#define   GAMTLBVEBOX3_CLKGATE_DIS		REG_BIT(19)
> +#define   GAMTLBVEBOX2_CLKGATE_DIS		REG_BIT(18)
> +#define   GAMTLBVEBOX1_CLKGATE_DIS		REG_BIT(17)
> +#define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
> +#define   LTCDD_CLKGATE_DIS			REG_BIT(10)
> +
> +#define GEN11_SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
> +#define XEHP_SLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x94d4)
> +#define   SARBUNIT_CLKGATE_DIS			(1 << 5)
> +#define   RCCUNIT_CLKGATE_DIS			(1 << 7)
> +#define   MSCUNIT_CLKGATE_DIS			(1 << 10)
> +#define   NODEDSS_CLKGATE_DIS			REG_BIT(12)
> +#define   L3_CLKGATE_DIS			REG_BIT(16)
> +#define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
> +
> +#define UNSLICE_UNIT_LEVEL_CLKGATE2		_MMIO(0x94e4)
> +#define   VSUNIT_CLKGATE_DIS_TGL		REG_BIT(19)
> +#define   PSDUNIT_CLKGATE_DIS			REG_BIT(5)
> +
> +#define GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE	MCR_REG(0x9524)
> +#define   DSS_ROUTER_CLKGATE_DIS		REG_BIT(28)
> +#define   GWUNIT_CLKGATE_DIS			REG_BIT(16)
> +
> +#define SUBSLICE_UNIT_LEVEL_CLKGATE2		MCR_REG(0x9528)
> +#define   CPSSUNIT_CLKGATE_DIS			REG_BIT(9)
> +
> +#define SSMCGCTL9530				MCR_REG(0x9530)
> +#define   RTFUNIT_CLKGATE_DIS			REG_BIT(18)
> +
> +#define GEN10_DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
> +#define   DFR_DISABLE				(1 << 9)
> +
> +#define GEN6_RPNSWREQ				_MMIO(0xa008)
> +#define GEN6_RC_CONTROL				_MMIO(0xa090)
> +#define GEN6_RC_STATE				_MMIO(0xa094)
> +
> +#define GEN6_PMINTRMSK				_MMIO(0xa168)
> +#define   GEN8_PMINTR_DISABLE_REDIRECT_TO_GUC	(1 << 31)
> +#define   ARAT_EXPIRED_INTRMSK			(1 << 9)
> +
> +#define FORCEWAKE_GT_GEN9			_MMIO(0xa188)
> +
> +#define GEN9_PG_ENABLE				_MMIO(0xa210)
> +
> +/* GPM unit config (Gen9+) */
> +#define CTC_MODE				_MMIO(0xa26c)
> +#define   CTC_SOURCE_PARAMETER_MASK		1
> +#define   CTC_SOURCE_CRYSTAL_CLOCK		0
> +#define   CTC_SOURCE_DIVIDE_LOGIC		1
> +#define   CTC_SHIFT_PARAMETER_SHIFT		1
> +#define   CTC_SHIFT_PARAMETER_MASK		(0x3 << CTC_SHIFT_PARAMETER_SHIFT)
> +
> +#define FORCEWAKE_RENDER_GEN9			_MMIO(0xa278)
> +#define FORCEWAKE_MEDIA_VDBOX_GEN11(n)		_MMIO(0xa540 + (n) * 4)
> +#define FORCEWAKE_MEDIA_VEBOX_GEN11(n)		_MMIO(0xa560 + (n) * 4)
> +
> +#define GEN10_SAMPLER_MODE			MCR_REG(0xe18c)
> +#define   ENABLE_SMALLPL			REG_BIT(15)
> +#define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> +#define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
> +
> +#define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
> +#define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
> +#define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
> +#define   GEN12_DISABLE_TDL_PUSH		REG_BIT(9)
> +#define   GEN11_DIS_PICK_2ND_EU			REG_BIT(7)
> +#define   GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX	REG_BIT(4)
> +#define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
> +#define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
> +
> +#define GEN7_ROW_CHICKEN2			_MMIO(0xe4f4)
> +#define   GEN12_DISABLE_READ_SUPPRESSION	REG_BIT(15)
> +#define   GEN12_DISABLE_EARLY_READ		REG_BIT(14)
> +#define   GEN12_ENABLE_LARGE_GRF_MODE		REG_BIT(12)
> +#define   GEN12_PUSH_CONST_DEREF_HOLD_DIS	REG_BIT(8)
> +#define   GEN12_DISABLE_DOP_GATING              REG_BIT(0)
> +
> +#define SARB_CHICKEN1				MCR_REG(0xe90c)
> +#define   COMP_CKN_IN				REG_GENMASK(30, 29)
> +
> +#define GEN12_RCU_MODE				_MMIO(0x14800)
> +#define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
> +
> +#define FORCEWAKE_ACK_GT_GEN9			_MMIO(0x130044)
> +#define   FORCEWAKE_KERNEL			BIT(0)
> +#define   FORCEWAKE_USER			BIT(1)
> +#define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
> +
> +#define GEN6_GT_CORE_STATUS			_MMIO(0x138060)
> +#define   GEN6_RC0				0
> +#define   GEN6_RC6				3
> +
> +#define GEN6_GT_GFX_RC6_LOCKED			_MMIO(0x138104)
> +#define GEN6_GT_GFX_RC6				_MMIO(0x138108)
> +
> +#define GFX_FLSH_CNTL_GEN6			_MMIO(0x101008)
> +#define   GFX_FLSH_CNTL_EN			(1 << 0)
> +
> +#define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
> +
> +#define GEN11_GUC_SG_INTR_ENABLE		_MMIO(0x190038)
> +#define   ENGINE1_MASK				REG_GENMASK(31, 16)
> +#define   ENGINE0_MASK				REG_GENMASK(15, 0)
> +
> +#define GEN11_GPM_WGBOXPERF_INTR_ENABLE		_MMIO(0x19003c)
> +
> +#define GEN11_INTR_IDENTITY_REG(x)		_MMIO(0x190060 + ((x) * 4))
> +#define   GEN11_INTR_DATA_VALID			(1 << 31)
> +#define   GEN11_INTR_ENGINE_INSTANCE(x)		(((x) & GENMASK(25, 20)) >> 20)
> +#define   GEN11_INTR_ENGINE_CLASS(x)		(((x) & GENMASK(18, 16)) >> 16)
> +#define   GEN11_INTR_ENGINE_INTR(x)		((x) & 0xffff)
> +#define   OTHER_GUC_INSTANCE			0
> +
> +#define GEN11_RENDER_COPY_INTR_ENABLE		_MMIO(0x190030)
> +#define GEN11_VCS_VECS_INTR_ENABLE		_MMIO(0x190034)
> +#define GEN12_CCS_RSVD_INTR_ENABLE		_MMIO(0x190048)
> +#define GEN11_IIR_REG_SELECTOR(x)		_MMIO(0x190070 + ((x) * 4))
> +#define GEN11_RCS0_RSVD_INTR_MASK		_MMIO(0x190090)
> +#define GEN11_BCS_RSVD_INTR_MASK		_MMIO(0x1900a0)
> +#define GEN11_VCS0_VCS1_INTR_MASK		_MMIO(0x1900a8)
> +#define GEN11_VCS2_VCS3_INTR_MASK		_MMIO(0x1900ac)
> +#define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
> +#define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
> +#define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
> +#define GEN12_CCS0_CCS1_INTR_MASK		_MMIO(0x190100)
> +#define GEN12_CCS2_CCS3_INTR_MASK		_MMIO(0x190104)
> +#define XEHPC_BCS1_BCS2_INTR_MASK		_MMIO(0x190110)
> +#define XEHPC_BCS3_BCS4_INTR_MASK		_MMIO(0x190114)
> +#define XEHPC_BCS5_BCS6_INTR_MASK		_MMIO(0x190118)
> +#define XEHPC_BCS7_BCS8_INTR_MASK		_MMIO(0x19011c)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index af2fcf1c32f4..b426f8000070 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
> @@ -20,7 +21,6 @@
>  #include "xe_sched_job.h"
>  
>  #include "gt/intel_gpu_commands.h"
> -#include "gt/intel_gt_regs.h"
>  #include "gt/intel_lrc_reg.h"
>  #include "i915_reg.h"
>  
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 188197c3a8fe..e1346d18b580 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -6,11 +6,10 @@
>  
>  #include <drm/drm_util.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>  
>  static struct xe_gt *
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 53a1edaee02d..2c9b2175c5bb 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/i915_drm.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> @@ -17,7 +18,6 @@
>  #include "xe_mmio.h"
>  #include "xe_wopcm.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
>  /* FIXME: Common file, preferably auto-gen */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 5c7c2757bb49..c195b4b9f9b8 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -8,6 +8,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -40,8 +41,6 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
>  {
>  	struct xe_gt *search;
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index e50117103e1e..e9aa7c5452af 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -4,12 +4,12 @@
>   */
>  #include "xe_gt_clock.h"
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
>  static u32 read_reference_ts_freq(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 43910e48bdc9..c4ede7d6d97c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -4,13 +4,12 @@
>   */
>  #include "xe_gt_mcr.h"
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_gt.h"
>  #include "xe_gt_topology.h"
>  #include "xe_gt_types.h"
>  #include "xe_mmio.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  /**
>   * DOC: GT Multicast/Replicated (MCR) Register Support
>   *
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 88cc912fa7eb..a2a124a7fc0b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -4,6 +4,7 @@
>   */
>  #include "xe_guc.h"
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
> @@ -20,7 +21,6 @@
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg_defs.h"
>  
>  /* TODO: move to common file */
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index bde094388a34..3cf04594f12f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
> @@ -19,9 +20,6 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
> -
>  /* Slack of a few additional entries per engine */
>  #define ADS_REGSET_EXTRA_MAX	8
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 1d4ac0c26d3c..f7aaf4826f00 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -8,6 +8,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> @@ -30,7 +31,6 @@
>  #define GEN10_FREQ_INFO_REC	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
>  #define   RPE_MASK		REG_GENMASK(15, 8)
>  
> -#include "gt/intel_gt_regs.h"
>  /* For GEN6_RPNSWREQ.reg to be merged when the definition moves to Xe */
>  #define   REQ_RATIO_MASK	REG_GENMASK(31, 23)
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index ce5d6641499f..caae4f897644 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_execlist.h"
> @@ -21,7 +22,6 @@
>  #include "xe_sched_job.h"
>  #include "xe_wa.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
>  #define MAX_MMIO_BASES 3
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index f30fd2b14c22..d7756c14b4e2 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -8,6 +8,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_display.h"
>  #include "xe_drv.h"
> @@ -16,7 +17,6 @@
>  #include "xe_hw_engine.h"
>  #include "xe_mmio.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
>  static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 60ffe3f80c59..8e341d11f2e3 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -5,6 +5,7 @@
>  #include "xe_lrc.h"
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine_types.h"
> @@ -14,7 +15,6 @@
>  #include "xe_vm.h"
>  
>  #include "gt/intel_gpu_commands.h"
> -#include "gt/intel_gt_regs.h"
>  #include "gt/intel_lrc_reg.h"
>  #include "i915_reg.h"
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 892008dcbaf4..d0cd9e920d34 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -8,13 +8,13 @@
>  #include <drm/xe_drm.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
>  #define XEHP_MTCFG_ADDR		_MMIO(0x101800)
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 99d3cc6c7164..173f5c4321f5 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -4,6 +4,7 @@
>   */
>  #include "xe_mocs.h"
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
> @@ -12,8 +13,6 @@
>  #include "xe_platform_types.h"
>  #include "xe_step_types.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define mocs_dbg drm_dbg
>  #else
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index bd3b64ad9c26..6519c6648460 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_print.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -20,8 +21,6 @@
>  #include "xe_mmio.h"
>  #include "xe_rtp_types.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  #define XE_REG_SR_GROW_STEP_DEFAULT	16
>  
>  static void reg_sr_fini(struct drm_device *drm, void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index e2f3f374b856..66ff9da46070 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -5,12 +5,11 @@
>  #include "xe_reg_whitelist.h"
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_rtp.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  #undef _MMIO
>  #undef MCR_REG
>  #define _MMIO(x)	_XE_RTP_REG(x)
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 5049367bc92d..a7ab0d4451f0 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -4,6 +4,7 @@
>   */
>  #include "xe_ring_ops.h"
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_engine_types.h"
>  #include "xe_gt.h"
>  #include "xe_lrc.h"
> @@ -12,7 +13,6 @@
>  #include "xe_vm_types.h"
>  
>  #include "gt/intel_gpu_commands.h"
> -#include "gt/intel_gt_regs.h"
>  #include "gt/intel_lrc_reg.h"
>  #include "i915_reg.h"
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 5f8c56baaeba..cda2da27f7c6 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -5,12 +5,11 @@
>  
>  #include "xe_tuning.h"
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_rtp.h"
>  
> -#include "gt/intel_gt_regs.h"
> -
>  #undef _MMIO
>  #undef MCR_REG
>  #define _MMIO(x)	_XE_RTP_REG(x)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 92065341c001..155cfd1dcc50 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -8,6 +8,7 @@
>  #include <linux/compiler_types.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -17,7 +18,6 @@
>  #include "xe_rtp.h"
>  #include "xe_step.h"
>  
> -#include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"
>  
>  /**
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
