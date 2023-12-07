Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBBBC10F07
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 14:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456E810E8CE;
	Thu,  7 Dec 2023 14:17:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F44810E8C9
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701958649; x=1733494649;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=f/DUciHa18D6t0Kd+8yRYmJP+t6q4sOF8q8MBXAzGd8=;
 b=eGL7NQu4ZW+i8upCo0PmBMonbe8v2cAKPOgqeqd/iCue71uiHaqybmDB
 rX0Y9ct1K4nu648hEMKODKN6xsNJZp9sIpU4OIrH4JJAQx90DieRFp6Pc
 A9dXm5PxJlEIyMbpLRgbzLEz2CL1QL9I2xCh7GTGv9oEGl7RzB6gqqKeG
 KzPL48E+iyxoKVY2FO0SPdQxstIb4NispBUR1sZYD6O0NvdHigr19mTnN
 5tJemLZTWybPA7aZ8FHZWbBfA55aiA1XtdJerl6Oh5vilMxiSdVTC/qBn
 nobH0s2+xPLzxOWTi32rqWYkboiuD5Hw1o4XJrDXF+fJnZAaorp/jHRs2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726261"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="460726261"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:17:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="915599694"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="915599694"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 06:17:28 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 06:17:28 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 06:17:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 06:17:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 06:17:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xo1JyIm1GGQ81h2q7rzeU//iiv5BxUU7bDzoQ+V7+39V1NwywOf0grmQdY8BOujdDLi02zxwPtOReWostBPoVTZT2+/R1CgXltXQ34EQCF0JtRY0t424TlGdbtq/Ieq31eeUV5t8qAg2dOawY7mgk6zB+6KQfXHqYeWzNfnkmMv3QwuL0SMbSuZamJr40fQRpR96/l91aIxJaRssfH0UfPHdQmBj4Ph3YFu+Qn+opmXzVPRU3xdknGJgxlmyXm1VRhVnio4Fg+Xw14Te8tfabc6iGDBL/0y+k1M9sAs96TxadlL3HzvtNIs8UhnutCc6sKZJv8MfIy3IBI31cYV2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtvijJkO8tPGPS8DHQevGTkH6kuiOXWX05yiAF10Nes=;
 b=iRbLD28H01rXyXNkOP1U+6PReLp3A0X0oSIdlwEf7fke8u1eSt9MZg48iQXQjIWoYwaTkmbvKh8oXsxTh5kSxGuarkORo4txGwIvvJYVokT0qZHehrQL6kr21y1IiWEPYQYY8/TNNXD9ZDTURIHgnUGcKFaMFMnnwai/9p5WuWlcjELAZXuEUSnzanhm3tvsNaXrU/sYbs6QJG/micXjM5EsMSVGep4BH1I+7LhJNHB2iwj666S6Bm4jTgMx7OEyzchxrgjobwXWX7hSMkDS4DIIT0dfPwz4FjZ2IXSlENMzriIGF+vc/APJHE68epPWlD161bAomUYf+5QALzM7ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6695.namprd11.prod.outlook.com (2603:10b6:a03:44e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 14:17:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Thu, 7 Dec 2023
 14:17:25 +0000
Date: Thu, 7 Dec 2023 08:17:23 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/5] drm/xe: Introduce SR-IOV logging macros
Message-ID: <jopjlg22ed6zq6bhnmq3vopltaufixvycm47xuymf263dn7xkq@4qcwggedos4l>
References: <20231128151507.1015-1-michal.wajdeczko@intel.com>
 <20231128151507.1015-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231128151507.1015-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:74::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: 279a65ab-17ab-478f-e9c2-08dbf72f3c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TmPa4l4C6sxdytO3h8R91WQ+EwXWRRSlymvJiSdBBvujcwb9VnTPNSb0sm/h7p8hq64xp/gROR31u3eDFPdljM9RiMVKReue8rETQWiyWs8rXI3frq3v9N/3OWp0hZDuwNplG6ivy+tkmYNLB5VVBcXVRHicmwPPMtquwfegILPapw0rKJ5MeUa4imtvRJasdNMGu+0UvcgUunLMwnBDNiXVex7oHdexqBonm9flhj47VQuiLE0GLj+QniJo2rR561XLknyzwgarjSd0U30STLSfTNgyvKNeEh8By/XdCfbIka/GiGzUOwNZbrVEWejN3/Ls9hpvZ4y1uJcjQhZQ/75f5dk9zoPkJ9IZ7IZKlXYjxOnXKlG73oHbdzJbdKKxeQOrtZisXu+ZEOcsC3f1NcEwfwJ2iwm9W0A9lFi8dHqDeYgfOi6kT+bRIgLE7u3/T8A3nRAcfib2nqhY2pHNBmsEPfmzW/AmyEFbhsMOTw5xmMC+X4dbkylYWDyYt8NuJ2l1W0kRcZBUxGbJ3zJLBzyQO/jfPZ3XVwseyrxId8WbxriviTtcVD8qt0PPo7Ia
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(346002)(396003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(83380400001)(6512007)(9686003)(6506007)(26005)(316002)(33716001)(66946007)(66556008)(66476007)(6636002)(5660300002)(2906002)(6862004)(8676002)(86362001)(8936002)(4326008)(41300700001)(38100700002)(82960400001)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/8B78bYkbGSlfIP+Qx+4RpAPidUM7j2vJjFkrNy2y1DTbOMYJHjbKsqgK6?=
 =?iso-8859-1?Q?VapZeJUZJwCuVvqv8A3B/02RGxzn6TgjNymuPtB1jCVtxDrToTgbNEAqqW?=
 =?iso-8859-1?Q?eTPt4SMzWNvqmeurbR80l1mBO/Aoy38/60SLJiPIiv9g6OT50D2gcEAPV9?=
 =?iso-8859-1?Q?Nsd5Qb9FRfMzqPdkR0EtDR6eGrSw+FRjqSmQNrKaKUGhFw5lHTlhq72THX?=
 =?iso-8859-1?Q?PiUkfi1l1uvhXFpHzL4908Pro3+LZjSl/WcqC2ERgFsxiqaZv7P68W8YG9?=
 =?iso-8859-1?Q?JtSwFdzeeMx8mRUl+eK3lfjcTIv+DleJmbDtHyMQVfatZs0pkPQG5rKsBV?=
 =?iso-8859-1?Q?8hVZTjNsPhS+AyzTwC204vohrPt0snUF3W+FTMoKfK5JgEhrjrexXgJbHO?=
 =?iso-8859-1?Q?JsDCl953J+aozQ8gT859ZFrWgu3LnQQeTnl8FknwryvnHvF7fyfYxMSA47?=
 =?iso-8859-1?Q?oDYHU+yutboJjuzLkMUaMk145OPPwT5aOARgXrxQmwK07gMGpIRCu4V353?=
 =?iso-8859-1?Q?XK72qQXlpGlylXLxp0PiJ9rpADZ0JAX20V2P83brs6dZFZ+znIhw6uMTds?=
 =?iso-8859-1?Q?LR77t1gvZRd3nHLOgIN+y6DzyUPmYFL7sWOt8CEdGMVEQg1lK9siRst1T2?=
 =?iso-8859-1?Q?vYzBfbpxGLOyciC5PpgFNz93hYlU+b6wiJgVNqAQ0NSUXZuE9y1wHnAKCE?=
 =?iso-8859-1?Q?lPtXYQN8dM7J+2wvV9I9mslsJDyrTJti6Hb4Lv/KOg6Yc700KNQ4ZBdrwO?=
 =?iso-8859-1?Q?dWLpQKdPtqfHQpn2sJ6vvgMGo2/t6c3+1a8rinLa+6dh56VE/RTjuSPth+?=
 =?iso-8859-1?Q?2N+2GR9vtPxhlv/gCsCThzSPeLkcoiplKwDnaoKW0t+qzOKMMp2dWAYY7W?=
 =?iso-8859-1?Q?ChAEFKQqfFuXuD0ZeUHpROn5POczcKH/Q9wOISXIrAV3cIpbrpVhzRQ9dd?=
 =?iso-8859-1?Q?2BXeInphbA+nzSxaYEhhoxFctg3CrDHCnn2UdU1UZZGs3S68DzxJSuz/RG?=
 =?iso-8859-1?Q?t+QrvXzq+IqF3ReMEKr7+HxebnlAEJ/+xCCCuWgpFK4vmWf7DX5/QV1ssi?=
 =?iso-8859-1?Q?7FIL+kRVJbwQ96YEmDOMKBIuBfHXh+QRfI1TewDRwIH8X3o8Mmb3DXildy?=
 =?iso-8859-1?Q?xl1NbsUeE7qbLmeXGO2iBSFGTu8BLZxRi3/GeY/pGVGMI3Ajo8TTREx+BF?=
 =?iso-8859-1?Q?N5jAaXMIqw7VfJ4rLCcB42vqKtiq7TFTEN/wgu+LWZ5EnE8B7nxzwPVM8k?=
 =?iso-8859-1?Q?v1or9VC++tgdQhlD9AkynreGyq94kn9HNEyKtVMicNRkNBtFkmaY7NEMUS?=
 =?iso-8859-1?Q?Fx2XqJ/sJJVXERHIBfH7Z01FsRJqY+2cMs15UVUTR7aYxbHxVE3nOlCT8d?=
 =?iso-8859-1?Q?rbDQzGpDTNwPIWRgKIPaleLjxsyGSlRMnKcoQH02eiydj4YMvBiY92/24R?=
 =?iso-8859-1?Q?XO7ywS0el4vMwlrh0ge2wLqPT6Um2CkUVSt0sYUy/1t+m0dWQ5TeviyS+D?=
 =?iso-8859-1?Q?6Ei56gGHsOatBUhORFhrt/2jIA9lehn46scyurSP0MQbu/tfqqNUXkvmrP?=
 =?iso-8859-1?Q?A1KeffcCrXS/MCfILolmHsbxegAl07ZBYzEzeG6GoZK7Y2l5asGuvSrFAx?=
 =?iso-8859-1?Q?tXNT4t1jV1OFdO46WyLfxk7yzrJpFpHgoxLHVVXlou3rAPYL1g51zbIw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 279a65ab-17ab-478f-e9c2-08dbf72f3c42
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 14:17:25.1993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nb92tx0lZDa+BwfYaODMBaWJ+1jz40FZJB55k+FpNd0+L/qd/+cjBYYWQni/ol5WPETVgPcMs76gw2hkdyuarPjKNreveF7owU9wwgzL3hI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6695
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

On Tue, Nov 28, 2023 at 04:15:04PM +0100, Michal Wajdeczko wrote:
>To simplify logging and help identify SR-IOV specific messages
>define set of helper macros that will prefix messages based on
>the current SR-IOV mode.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


>---
> drivers/gpu/drm/xe/xe_sriov_printk.h | 46 ++++++++++++++++++++++++++++
> 1 file changed, 46 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_sriov_printk.h
>
>diff --git a/drivers/gpu/drm/xe/xe_sriov_printk.h b/drivers/gpu/drm/xe/xe_sriov_printk.h
>new file mode 100644
>index 000000000000..117e1d541692
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sriov_printk.h
>@@ -0,0 +1,46 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_SRIOV_PRINTK_H_
>+#define _XE_SRIOV_PRINTK_H_
>+
>+#include <drm/drm_print.h>
>+
>+#include "xe_device_types.h"
>+#include "xe_sriov_types.h"
>+
>+#define xe_sriov_printk_prefix(xe) \
>+	((xe)->sriov.__mode == XE_SRIOV_MODE_PF ? "PF: " : \
>+	 (xe)->sriov.__mode == XE_SRIOV_MODE_VF ? "VF: " : "")
>+
>+#define xe_sriov_printk(xe, _level, fmt, ...) \
>+	drm_##_level(&(xe)->drm, "%s" fmt, xe_sriov_printk_prefix(xe), ##__VA_ARGS__)
>+
>+#define xe_sriov_err(xe, fmt, ...) \
>+	xe_sriov_printk((xe), err, fmt, ##__VA_ARGS__)
>+
>+#define xe_sriov_err_ratelimited(xe, fmt, ...) \
>+	xe_sriov_printk((xe), err_ratelimited, fmt, ##__VA_ARGS__)
>+
>+#define xe_sriov_warn(xe, fmt, ...) \
>+	xe_sriov_printk((xe), warn, fmt, ##__VA_ARGS__)
>+
>+#define xe_sriov_notice(xe, fmt, ...) \
>+	xe_sriov_printk((xe), notice, fmt, ##__VA_ARGS__)
>+
>+#define xe_sriov_info(xe, fmt, ...) \
>+	xe_sriov_printk((xe), info, fmt, ##__VA_ARGS__)
>+
>+#define xe_sriov_dbg(xe, fmt, ...) \
>+	xe_sriov_printk((xe), dbg, fmt, ##__VA_ARGS__)
>+
>+/* for low level noisy debug messages */
>+#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
>+#define xe_sriov_dbg_verbose(xe, fmt, ...) xe_sriov_dbg(xe, fmt, ##__VA_ARGS__)
>+#else
>+#define xe_sriov_dbg_verbose(xe, fmt, ...) typecheck(struct xe_device *, (xe))
>+#endif
>+
>+#endif
>-- 
>2.25.1
>
