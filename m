Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C392CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 15:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2261C10E801;
	Thu,  2 Oct 2025 15:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAt3yASd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE30410E801
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759419924; x=1790955924;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sDhVDSQeunPxolQXfd7UBdQlxkjbMKIQYKYRr27YHdQ=;
 b=eAt3yASdyLmKk5suk0Yx5q8R0AeZDCDd7BjhR199kXy+ffJ+hK79ZCdr
 H5YfNs24Q8g939PIQpuKzZRhYpHLlCOlY1zG7jX+U5oi589XmpXRdzmFZ
 Zn/9wI+wuXXzp52q4oO1E+GdhjCqL5yEgQkcXFECa1VKwRYsIVc0lEf2U
 t0G1XHFMhixEF2920gXVaZkUdFm+g9wMb+fRh2U7AYT5up1kVLZpdGSg9
 IJy5iH48St9emTXv79mWR6dzAe7RDvfULdnSHVatJoLyJGwdur0YWW3Zh
 UQTEx07GC7p2bzERyd6Ql41rzeMIKm0C+QPk5NQwKNgnPAyR+y2Q9udKb A==;
X-CSE-ConnectionGUID: Iqo/tYxyQvCsC14dlLqCXQ==
X-CSE-MsgGUID: e2lVsicwSViA6Y0rrqz6cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="72381377"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="72381377"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 08:45:23 -0700
X-CSE-ConnectionGUID: SISvAXQjR82eNZ0RbvqcqA==
X-CSE-MsgGUID: x6AdPSl+RzqswtpB0RAYEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="178878190"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 08:45:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 08:45:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 08:45:22 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 08:45:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDLBjgGLKL2avylQ7aVVTtrvXJ5e0GJta0LHICqzfKH5mgUqVecXznYAlXvGKk26BJYitoainLPLlM/ruXSuQYhhsdx/lMi7JkSXvAKG1hoRkFHpk/PLfzR9QqTKqXI2WT5ZYaztqX1tKlqQAqqaFjgNtM7hi+yBTD3QmS5i6LPJZxiADzN3jlkeHutFSNCdXM4NR18pTXQQdPcbjn/0F7HYPLK0Nz5aiB6w/N+NMar0FjZLHFnC4+DjmEkXpA1McydF/cak+ESpVZQp8/G+w3sAVQAfVwnCjMiKIW2t7KI8GJRvCnQXfTx0sXuJ08HNdBY/1T2J82WqT7iZl1iEiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e63qMP6QvnuU3HzTnRYBfixMHPfSzhQZkA0bbQdx7Ac=;
 b=P7+skqdgiVO9ahObgZO2juJJ5ih1wTcJc/ElwbUy3qZFag1Co4znPyRNly6u7W1rZz6U6NbHW7wl/TGLWVt9/u0Gz8556BkF+cLXkWIDn4cPlQgDmie9krofRS9SOArITvCB13ZQjUHteRPH48euqy9nsdkxHf9l/YI5JFHLsa2fV3BaWNfruM+U850ZuT6CAzLMYJ5A1gbGMK9RxL3JnM7LnH9oFAfLewsPJa0rPhGKL8OnQWtffkO4z/jOi4fxHOk9/+vxCPhrN+Rwc0SvUoZBoCx8vi+9OCe1y5oPWyEEoAXf1vtluwEpwTJBvYwezuA4a9/HwNuN0u3pJVFRVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4714.namprd11.prod.outlook.com (2603:10b6:303:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.19; Thu, 2 Oct
 2025 15:45:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 15:45:09 +0000
Date: Thu, 2 Oct 2025 10:45:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe/doc: Add documentation for Execution Queues
Message-ID: <p7deapqvq7khczgzsxdfq5cql5ehxmmdbopjtwbmbnlweo6xp3@777lqlmjao6q>
References: <20251002044319.450181-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251002044319.450181-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4714:EE_
X-MS-Office365-Filtering-Correlation-Id: bd808f14-c390-4149-566c-08de01caaae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sf4mND5b8jVbndEvZdwo9Sbke3faQ4fPoZX7KIHwOnQjP19ZUVkTn/+yuXlS?=
 =?us-ascii?Q?TQCMbbVZSQJadUQBSHMPbXTNRi0aZL7boOdFiiURkrVL8CKXPGM1HuQXP1+q?=
 =?us-ascii?Q?zOG6rm+SM38nFE2U9uzScK6s2Pkoo2T4anLSIuMQoqx88H6R8lUqU7Al5pee?=
 =?us-ascii?Q?XZDJ8vX0WfE+a2Nac8tqk8jKM36GDLwHHma51Eii3zUkJtDvWRAgJiHwZnbn?=
 =?us-ascii?Q?7dvr21THnAeW2LU1ZqLctCcWQ6nMJ5yamIlF+qs81UTcKgG7QM8LbhCiKNwH?=
 =?us-ascii?Q?GHFfn7pDieNiCx9FPun485F05ju6pw2SGfEpcq/DPGpNlMkc5WJSnVQk5+t8?=
 =?us-ascii?Q?yxIxK2fKrUMRrP7fYvZknv5Q6eYiFQNy9e4F4kH+a4W2bZ+h7fWDxIEvNAFz?=
 =?us-ascii?Q?7p4BxceAu9nZ5mBKTXJlGMvpRToBqFIstXaW9iHhM0brw4H28ll7r1Xw4PbG?=
 =?us-ascii?Q?fw8ZtnErrPjO6LuH15vtXFbYA0TUgUlZxCGajSSap8weLHoI3vQSbBobe5Rs?=
 =?us-ascii?Q?K3gkq/hD8SkPWQWlEW/aMuwhJVm5FY9HKEjGmegTnU0NwslJKVED2xliqDqp?=
 =?us-ascii?Q?jZTweo91A061mHQAxnbITyAdtogSZhhM/Wb5rS9yJmROOS34def4vuWQf7BY?=
 =?us-ascii?Q?34T1jhRp1t9fghKLeThw3+eff3XHgj4EfrE3oECImVeeUsdTaXFmd2TpIL5/?=
 =?us-ascii?Q?hbIHr2aC1qyRAxHU11m/IomiXFZ6xMBNjnnJ8RpTJ5FGVfjc8iOG0cr2/mjL?=
 =?us-ascii?Q?lTkGX8hRYspyj0ZH93d2j9KB+wD0X4QoFmeDsRQiJoA83r/8K6za3bwrOL58?=
 =?us-ascii?Q?CixWIDuk/Y4joZuT41OiP6gUkf8jRO1wqJTkc6lkC6tPpC3vEbz9YbJ/SL30?=
 =?us-ascii?Q?R3lRLzIu/C+PYtIgk6x7wiT1RVqFuT67Kok1JfPsISC085+jPTbccB4b12s4?=
 =?us-ascii?Q?59P4OwOIiLtpczXqx4Nq0mc5wcCDLSQJ2EcvAY3dHrM1WlBRLdzGprQaGMYv?=
 =?us-ascii?Q?+zNzkQODECqEES/AupMW9CKi6ypb9reMdd+K9Yz/HqHD7tte6vf2zwdBXhwt?=
 =?us-ascii?Q?NFulNeNt6SdaliIhuQINC6I9J40PTgITjmjfZPqNe2EeZ/1bbjQh1wAtPHnH?=
 =?us-ascii?Q?tMcX9v21iSeHH4npLy6CQ4J7kA7Fxg0FJeMN1uWVZzYeZC6XtgM0QBe85y8F?=
 =?us-ascii?Q?BMezTronK7cA/lxLenBsifI7Rp8a4NsYzMTNxX5aN0TKpIdG+wjoxiNCuRBH?=
 =?us-ascii?Q?6rp0uPxwAtp1UGT3n5Y60xMM/5JKK2P0rw9OJJM8D0QGQVgSwiD7TR5naSQv?=
 =?us-ascii?Q?cMBkOhShE6DdaJCxzbXyLAxLFdoHb4E1rJypwIkkb3pBukrcOXSURXgXBdDf?=
 =?us-ascii?Q?+aLVr4zXxnTipcKR1prRc2P+g6YshAJc/faj0GM2Ys5tiGDjdV5T/VQCxYGa?=
 =?us-ascii?Q?FMn74hvO1Nx3cnONCtQU3IwHYr31gJHz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gS+d8/2Ah7B+Gzzn+gxlrreLX4Otq5cF8u6wFQsg4XTWNDu+HRZjDsZXnYpL?=
 =?us-ascii?Q?KMc2g8c9pWndgl5ptGxFhWwuDa3vrJ143NQ3hjxqV7/aoT0epCJfYmqvtnBQ?=
 =?us-ascii?Q?ctQzZQndxs6Mln1jPJCpA5Rr/jmdfJ/9yCgE40ZSMGTwi9rw8GwD8oDW/cTY?=
 =?us-ascii?Q?JAsIvO64WBa13gXk5jUIqWF84+MuishKzipxRIHQ46GEAIlILraRBVqWubCG?=
 =?us-ascii?Q?ugiYjtZw2p5cpRcr2EH86R4sFJ/EE8USOTQt5AlZPcgVy++pd7XTCVIFxGxQ?=
 =?us-ascii?Q?eRKjot1qdlV5WmMxzu/AOXCZ2OIejtYkb3hAB4x6ABHrznCvUoYLZn/1dUI4?=
 =?us-ascii?Q?7toLuh2XGiDsehhMwEqlIC1a2ksiuU/+dn5+wuJVmVJ39810DSSEpXWlmi/Q?=
 =?us-ascii?Q?PpW4UDsdElBTpm8ebd6Q7dP4O63nu7afhFV6QbgI3VzPBpB+XPniOMQAQrrN?=
 =?us-ascii?Q?x1Vw91IY2NM/SHu5GXAZR0vrjw7l9UR1jCpv3ltwHC9rTC5IoTHENUBRjtM2?=
 =?us-ascii?Q?hAvPtBi1R8RlyJ5Isr5J8Nm4wI1w9zxRIU3BzVTZM+tU51j6jq2IOlOowg2j?=
 =?us-ascii?Q?dHOszBt3WO74qla55YPxTeRj7X3VbXGniueaBOBTeztfR+F6UOSnWNVMHPoJ?=
 =?us-ascii?Q?kGz4u93ZV1D2fz9Ilta4AlpD+m2Leae01h0GKBlkuFFEZ2MvONRUoAbh1Ple?=
 =?us-ascii?Q?xVLst12wROaZp8mUrBa7XqDL7JcUl1DB3jCT4aA5GNvuKToq7Nyemc2s3sZt?=
 =?us-ascii?Q?kL8qqP20gdG1bbLO9JhaAJIQlv/GktURI4D0WkzdocVHBdTyuGWvo+hQ17Yp?=
 =?us-ascii?Q?DTNMno4WzVWSOvRU399ZTKsOCnlVGigziaCe+LxPhpLS/gQAQVpRZB5F/zNV?=
 =?us-ascii?Q?0g+A2krLOcn69YPaiACCZTydVKGS1XSEXNke/N+J/b0Z8lLo7x5smwz8joe1?=
 =?us-ascii?Q?+1fKN7jFtFjml0bYSOMtBLMF3bx1DuuAgCFom70EWI56W4EyNALkaXi75Oq1?=
 =?us-ascii?Q?4imdmCWLEW1jPJCWQYV6lpLlFwYdf2klRBAQkT581OzVNozDlPRfQw5Ul5od?=
 =?us-ascii?Q?08paF2Hq4vMbqGIsHeQJW7adKfQcaJCCCZz4F8QsJYHO/sAkGheSIPiYzWxi?=
 =?us-ascii?Q?QCZyvR9SYMvl4ePDdOVTSZv4LtRPg0+dw9wX/APi7/M+FOevvimMir4QXMlL?=
 =?us-ascii?Q?bwOqEy4vXgHZAVCDgpaaqIn47jVVCsJF95p5lTIvyPE6CwBf75FvGhUuHJwd?=
 =?us-ascii?Q?FJsbwcqVtUwPv10IrKviWll5YcQpSGQk4YSLWGZadwZob655X/cPPGofUNX7?=
 =?us-ascii?Q?Cn8aGleFkL0XdQsEEQbgPlN3PP06bIJl1sb04gYRTHgxD9IIumlh0Ewxgc4T?=
 =?us-ascii?Q?S7eMlw0/GB7Lsjf6wWNCNBWUurdCbTeZpVwEmcIfGqGm7zm1PxFiH5LfqLpN?=
 =?us-ascii?Q?Z4BZYgKBGO0jbOJf/KOHAlvzDFLNligu5p4zlq1I8cvptGUDf/7iB/M0j9Qz?=
 =?us-ascii?Q?mVXtxwopCKJ6yRFALmrePZZ4mdzrZUrj32lGh8lllK8NFB56lh3hqi9VOiRb?=
 =?us-ascii?Q?jJD8HQM2teaRChYb91LkC3FyhQRLqpnQgi2u4wKWm6EZ5Ah7bEjhLkrRLRfU?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd808f14-c390-4149-566c-08de01caaae4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 15:45:09.8350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+g/ADEN0m8Ago+cNftjdR+9xI8shAQ5CZwUzIeUN7jb2tCThBsfz8ToNR8Absmos98aAdLcioTdQEw/UdCvLpFoI5LcCLMPJDS97Vi6X9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4714
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

On Wed, Oct 01, 2025 at 09:43:20PM -0700, Niranjana Vishwanathapura wrote:
>Add documentation for Xe Execution Queues and add xe_exec_queue.rst
>file.
>
>v2: Add info about how Execution queue interfaces
>    with other components in the driver (Matt Brost)
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>---
> Documentation/gpu/xe/index.rst         |  1 +
> Documentation/gpu/xe/xe_exec_queue.rst | 20 ++++++++++++++++++++
> drivers/gpu/drm/xe/xe_exec_queue.c     | 24 ++++++++++++++++++++++++
> 3 files changed, 45 insertions(+)
> create mode 100644 Documentation/gpu/xe/xe_exec_queue.rst
>
>diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
>index 88b22fad880e..bc432c95d1a3 100644
>--- a/Documentation/gpu/xe/index.rst
>+++ b/Documentation/gpu/xe/index.rst
>@@ -14,6 +14,7 @@ DG2, etc is provided to prototype the driver.
>    xe_mm
>    xe_map
>    xe_migrate
>+   xe_exec_queue
>    xe_cs
>    xe_pm
>    xe_gt_freq
>diff --git a/Documentation/gpu/xe/xe_exec_queue.rst b/Documentation/gpu/xe/xe_exec_queue.rst
>new file mode 100644
>index 000000000000..6877a154d771
>--- /dev/null
>+++ b/Documentation/gpu/xe/xe_exec_queue.rst
>@@ -0,0 +1,20 @@
>+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>+
>+================
>+Execution Queue
>+================

		 ^ one too many

>+
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.c
>+   :doc: Execution Queue
>+
>+Internal API
>+============
>+
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue_types.h
>+   :internal:
>+
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.h
>+   :internal:
>+
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.c
>+   :internal:
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 37b2b93b73d6..c2fc88f2176a 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -28,6 +28,30 @@
> #include "xe_vm.h"
> #include "xe_pxp.h"
>
>+/**
>+ * DOC: Execution Queue
>+ *
>+ * An Execution queue is an interface for the HW context of execution.
>+ * The user creates an execution queue, submits the GPU jobs through those
>+ * queues and in the end destroys them.
>+ *
>+ * Execution queues can also be created by XeKMD itself for driver internal
>+ * operations like object migration etc.
>+ *
>+ * An execution queue is associated with a specified HW engine or a group of
>+ * engines (belonging to the same tile and engine class) and any GPU job
>+ * submitted on the queue will be run on one of these engines.
>+ *
>+ * An execution queue is tied to an address space (VM). It holds a reference
>+ * of the associated VM and the underlying Logical Ring Context/s (LRC/s)
>+ * until the queue is destroyed.
>+ *
>+ * The execution queue sits on top of the submission backend. It opaquely
>+ * handles the GuC and Execlist backends whichever the platform uses, and
>+ * the ring operations the different engine classes support.
>+ *

trailing line.

I fixed those while applying.

Merged to drm-xe-next, thanks!

[1/1] drm/xe/doc: Add documentation for Execution Queues
       commit: b56bc81078e96d5af984b929da5433c2cf776206
--
Lucas De Marchi
