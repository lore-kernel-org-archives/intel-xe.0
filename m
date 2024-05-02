Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88457C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 20:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3184910F77A;
	Thu,  2 May 2024 20:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7qYWvlB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A507710F77A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 20:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714680978; x=1746216978;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7FRCTVLsEzxH+8XI/ej094/KNJH2xw6/qidC078626A=;
 b=d7qYWvlBSO5BFtkAYFqDmFWT3q8YcmONsY6nYQSzqZL0k3KAtvl8M/Nj
 v4JTaHzwcoXoV/i6tNuVSv6G8dz7+D4m05xQiYUiqCLRFPOfFd+XwcSUV
 Zk1em23801Y6iyoxeVPq2PD4t8XdAdvmWT/HbHD5F319ysViaplptCxWN
 93/bEa4vXaGqLM97GI1uCuzN0JNzqCkuBFd7YSESYG5SlmkaK3Ye6X457
 yMAC4qaoaCpe20TIkOSS06u6CRKaldz3kbQg4q4uf4rottal6M7zSX9pg
 nXVQ8e+yb7ls0PWF8NtKHm2THaAmb3MHebJVtez5+N3Gn+b4MA2miV86g g==;
X-CSE-ConnectionGUID: YdusBXSBTgi5gr7oOyR95g==
X-CSE-MsgGUID: mC1HClDIQnWF8+s1oMFZAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21882387"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="21882387"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 13:16:17 -0700
X-CSE-ConnectionGUID: fwkoE5oSR2K8hT+n6+ALVQ==
X-CSE-MsgGUID: Jm9cVTJsQ0KZehX5O25e+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27291994"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 13:16:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 13:16:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 13:16:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 13:16:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kM1jPVi6euqTeQA3l7kFtbWhDBeH77cF36tNQZZySaNSPH7ijp5FeNq2ifFaSRFpgNAzrDaJVVj6j0jtn5iGHBLqyFi/3rE1aru3KMRNBVu2Aumb/MAp786UrzIOUXI/SlSknm1MWFBA1rd0j1tVi5HRqpHGpYx0KxrdHKv/bB6IsbysYd6PJoi245RzpJqZjCR8x/3q6eMn1739aYcZrGW/TElYCGGY78cUgpgm8greWuDZzbehPryO42B9CZ2eRjKOSWq/N1rNjtkgeDsxdjaTBZKmygHv0GbH+R/cz7r5yQGUrX5Ij/7LUA1Clj17w2xLKQNGP5ixfyYgmHltkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCTTBws4YAWxnR3f4fs7VTKBvTTcMTzor23m5+uvSgU=;
 b=JIdb35Mpt79nWd5mHKRh8XBEcKw+nkXeXQeDterPszDEZZMOUA6IjwvTupwUsIYZJD0ixDEEX6f9pDqC1uZlXI5WvdEZr+Y3XR+XppQef7qwModflBv0En0cVDI7+LlWXraTFBj5mjmi/z3f2S/PiMKWPOfGwXGn9njzESyNG3lALZaEU899mfuH6GGvC/1ZqNTIHBR7+05xV14V1pnjNWRzuNmCMY34Cs/RCuOsZh5J9nakXT0HtzBjq/LrfdKWWWyyM6Wv4PLuNmbdvGYkdg1AqezV/OoeyycrtnKnWt8/KZadPlbEH7O3cHFKFUCtdf2t7UydiCadig++2SAeEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 20:16:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 20:16:13 +0000
Date: Thu, 2 May 2024 15:16:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Add helpers for manipulating macro
 arguments
Message-ID: <nm74vqoumf5tvredns7nluu4m4ud6wimly4ec23ykzh45jfchr@ppjb7yxeruay>
References: <20240502195619.2483-1-michal.wajdeczko@intel.com>
 <20240502195619.2483-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240502195619.2483-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0133.namprd04.prod.outlook.com
 (2603:10b6:303:84::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 3346c49e-20b8-4ef5-04f3-08dc6ae4b6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4K7t2QAHEnQ1xmysZvXdhoqKB7gYTjfyVEu/8owTl4wrUAUnpIt1ivmOK4?=
 =?iso-8859-1?Q?7zX2Wkbs0vxCeoX4eRncFlC7HvxfDcSAVKs3NM+wXlJxLp6tmABn4Hmp4/?=
 =?iso-8859-1?Q?f57wcwSYvqI9cGMcrmOQ92VrwfKTBB0YPuu6B55JDEF5IpLWb5YOfXLKWS?=
 =?iso-8859-1?Q?A0Y7F9n5jegdmEF3kI9S+R1FQ1zKTaaaT+80Latxo0Wa2xcc7VCmAzDOdb?=
 =?iso-8859-1?Q?Tg2jMrewf1Vwh7ht9Bmd+KwGu6xRR1vOYkgSKPT1P0lvOCgBsvTfbjvia3?=
 =?iso-8859-1?Q?vT9SEFATOmEaKkhOpyhRFyi0IBWWZtWJP5uUd+ZhB1IM8PbZ+f3ttxlFwl?=
 =?iso-8859-1?Q?KBNyP4Er+ITdk66SffVhr2jgNkIj4QAtE9hUG7nF70YW1feeLJCLqppuO8?=
 =?iso-8859-1?Q?IpbfXqte7An+JymCTjLfmXbPWmLbJ95R35/PXfmHiDIacG/v+zExXVZwXg?=
 =?iso-8859-1?Q?1byHQhL25FdFZS0QFE+/W9hpdGtQFQBrdQDHnjJHtO+gpsYjXF8InDD9M4?=
 =?iso-8859-1?Q?okHHVEuYchNzFxN22fxWCFOb0UdNEhH03AX2X3vrXK85ueD7kLeG7jHwvw?=
 =?iso-8859-1?Q?rue2tek5LSn8S02qtgWeJYKc+AaoSJvYZXSc7tUh2OsqhwzRyU8d79wD+h?=
 =?iso-8859-1?Q?tPr3YPAlEfoXVXUlW5Rjyr1dbXVQIWLCKbNR9QrtPFP7dhfmU1tyHkABnk?=
 =?iso-8859-1?Q?vTBomCv/lgoj3DgEj3vwhgICuE+44G7f4jGJOJXhNanSMGbLHXPanX2v7b?=
 =?iso-8859-1?Q?Va6zRDTpj+lDdYT36bvrBmt3ZR8HooEockuE4nYGxhcSmgVIe/prYfj47q?=
 =?iso-8859-1?Q?kBl4Km8wmOj6diOuVmMBvExDkswHiHX3glVYIwHEU2uWXYXQ0AnJH2Sgtb?=
 =?iso-8859-1?Q?FA+jU9ekx94ZystR+w9QDemnh7bngWdpx19+nuTxJhB7G6yfPEKCe6z5k4?=
 =?iso-8859-1?Q?IqteDHjre7AZoQX1Ovo1miae2hjAjR7P4pPLPn3YKTqrBRMocr2MR7vEgO?=
 =?iso-8859-1?Q?I06tG4Lqh8sxRu4zZXwZLUSuJ/ok25YcM2HPthG3flyt8A046t9+4EUlLw?=
 =?iso-8859-1?Q?0UuPIkYv43B5XmNS03tzfxeYcR8B+FmpB+xJP5c8G3p5ATOCfFLiEw3luU?=
 =?iso-8859-1?Q?t3idYKUsJph22z7Ja1Fi3RzTr14qdO7c4+wzQgOzmgY73na3LeM3kcHcT5?=
 =?iso-8859-1?Q?uKlpYMNBqGFawh071aIv8iOxL1U9lTSzyrw2/tWHuAykjjoSU8jNUlmPuD?=
 =?iso-8859-1?Q?4gBU3+ZckynZdV7J08GsIbWQ639jSWjG6ZGvg/B3+bGTY3t8vbRbjk7ngO?=
 =?iso-8859-1?Q?Wf9Oerg2RVrN0k8v5hN6ysGqKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/5F1+7jM/7VWtvth/SmRutedSvGb8erTO4UljnQyBp8G9FxVYygZ8YrfbN?=
 =?iso-8859-1?Q?F+k3x6i3b53CszQuByOX0sTGRxB2vaPzvqXxZIc0vmYfffVjQh73O23xbk?=
 =?iso-8859-1?Q?U6ugQZCuHtFz1wuxheGDmwIDDss2pk3Pq8DD5LtUZd/i3gXPxlLbCuQIcx?=
 =?iso-8859-1?Q?aDo6qEMqCVasyhCA2nyScAODzRfe/qE5v599vHcc3ny1b58xNQ7PHJIMwJ?=
 =?iso-8859-1?Q?OpVwai/Mnnb4s9I4B7cwFQqMdqyYr9NjLtIPdl+SebHOLe8/n2dUkpK8h2?=
 =?iso-8859-1?Q?WXPa2EKGzGR3hY3WbIkl8KUsscOMMts1TVrj1s+pGBYtHLVYnRA1zmr9Wq?=
 =?iso-8859-1?Q?c9fkp1log7yxbA8AyudcZzNGB/n+NtR4n181tiivAGTV/kr6MW9tHZGDAG?=
 =?iso-8859-1?Q?88sNI+TqYWumcq9e1ihKqz7+zGl4gVEDBYTaZ3UHPZFTcv2OlnPIhPBWNj?=
 =?iso-8859-1?Q?avMNmUiUA7iWDyZWVgHqu43o0bbdITaDgqQ6bgRv1dq81Qki2RqziNK/Al?=
 =?iso-8859-1?Q?aHa7IFxDq9X5DJN4BmV03jzgBcF/8oZrxDZZ9KIEQZj6m6YS+4iEhxLWne?=
 =?iso-8859-1?Q?dPWRhJBNr1NWH2sjUzb6xvAuYdZDTKs9utU1QNm6Qmypknh9i2tY94P1Le?=
 =?iso-8859-1?Q?UauSo0X0aAqJMPcxIEhtByZjlo6forn7Vd7dmo99Wi+JBMFOa5QcHFORKP?=
 =?iso-8859-1?Q?5kzBjwXNxJa5HKFSTVpzQxORsY+/l926DqLPfdzHLS9WbcPqedUJDbbiAm?=
 =?iso-8859-1?Q?e9QZTbZTrv3J+IlRwL1oM7YZm0bZJyU/PO9BiAZq3a+pevO4DtsNlbaffh?=
 =?iso-8859-1?Q?ilCuZMltnA6b11YlJQxTsUvbq1a8qGZktFh3+/rAq9PWdQImadgD7AF2op?=
 =?iso-8859-1?Q?UsXovi5E+MJWtPP1UhyJ1MmQFOCeNdv5I7TSzhxIFlIIOPPGWBJklKpkjh?=
 =?iso-8859-1?Q?FAaulQyQdFgpBKWe5mxWmUsWM6evTWMUx71a9c3op8yAp9R9ZJCof4eOt0?=
 =?iso-8859-1?Q?VkFSGRO6ysZN+/yJ9MBcbE9TXsptq+zCkJIO/hj6U9YUBtXsbw8dhtrvVG?=
 =?iso-8859-1?Q?PR9TMLzcTprB4+3HovTLcwLT5VeYhAzr1tcVrO1eKPEjJKOVp4DcPtENZU?=
 =?iso-8859-1?Q?KHnsTh3kI05ZK3kUTdIFPhfLYLVjuHgoW+05kQVaabqrSBXni9j60wHx4e?=
 =?iso-8859-1?Q?Ffg1oD391GRgaUkRl56jZqYKnyICuG3ezkIpGj04IIeQjszbrxdtGpQt81?=
 =?iso-8859-1?Q?LLTJ+P5lpe9EEejo+w9mY5aMlof3DUvwzxPSCFeY/iWrB/L8zijwOCjkY6?=
 =?iso-8859-1?Q?UMccUTPTcvMFOv+k5E+Oj8mMJ527v9O9BsNvGsQYSGCpeuYItkYs5RRV+U?=
 =?iso-8859-1?Q?vq0VKA+eDAHB1Bgk4NaC7svwYVMjYSIroy7rLV9loxtbw6BQCyBXVjSqzJ?=
 =?iso-8859-1?Q?jEelyc9oVSRU0HNtEjoNtZfSim6Y0G83bUHqmU6yerY4xzvMaX3tS0Nmnb?=
 =?iso-8859-1?Q?O53N4x6oT1hU3EMdBjlpzAA/vrnA0hNWdNy4OqTNDVk4Fa3g+fLCi/qplv?=
 =?iso-8859-1?Q?yxbSJn2+XttLYK5JtTsDgjMLR5P1yDj6XreHsFR+73pgY1nSKiN+eslaDD?=
 =?iso-8859-1?Q?Sb5sJR7xnvCqmkBqaDiJyCQaq73YMOB8wBGjwaY29yBYx2uMho+zDwTg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3346c49e-20b8-4ef5-04f3-08dc6ae4b6ac
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 20:16:13.1510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WikDLZOspcRH8fp8AMMuUp9/IA4NBmaJHxc4qLYjYF90bGaJNMlwY2FomdKCwvvzCkfTirHZFodBCNiGv148wQWz3SJuqe63Ey+1HBIC1xQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
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

On Thu, May 02, 2024 at 09:56:18PM GMT, Michal Wajdeczko wrote:
>Define generic helpers that will replace private definitions used
>by the RTP code and will allow reuse by the new code.
>
>Put them in new xe_args.h file (instead of infamous xe_macros.h)
>as once we find more potential users outside of the Xe driver we
>may want to move all of these macros as-is to linux/args.h.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>v2: don't pollute linux/args.h yet (Andy)
>---
> drivers/gpu/drm/xe/xe_args.h | 114 +++++++++++++++++++++++++++++++++++
> 1 file changed, 114 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_args.h
>
>diff --git a/drivers/gpu/drm/xe/xe_args.h b/drivers/gpu/drm/xe/xe_args.h
>new file mode 100644
>index 000000000000..6899fcc9405d
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_args.h
>@@ -0,0 +1,114 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_ARGS_H_
>+#define _XE_ARGS_H_
>+

as Andy mentioned, we could add a comment here stating this can
eventually be moved to linux/args.h once more users show up.

or... once we start conflicting with other macros since we are not using
an XE_ prefix anymore.

>+#include <linux/args.h>
>+
>+/**
>+ * CALL_ARGS - Invoke a macro, but allow parameters to be expanded beforehand.
>+ * @f: name of the macro to invoke
>+ * @args: arguments for the macro
>+ *
>+ * This macro allows calling macros which names might generated or we want to
>+ * make sure it's arguments will be correctly expanded.
>+ *
>+ * Example:
>+ *
>+ *	#define foo	X,Y,Z,Q
>+ *	#define bar	COUNT_ARGS(foo)
>+ *	#define buz	CALL_ARGS(COUNT_ARGS, foo)
>+ *
>+ *	With above definitions bar expands to 1 while buz expands to 4.
>+ */
>+#define CALL_ARGS(f, args...)		__CALL_ARGS(f, args)
>+#define __CALL_ARGS(f, args...)		f(args)
>+
>+/**
>+ * DROP_FIRST - Returns all arguments except the first one.
>+ * @args: arguments
>+ *
>+ * This helper macro allows manipulation the argument list before passing it
>+ * to the next level macro.
>+ *
>+ * Example:
>+ *
>+ *	#define foo	X,Y,Z,Q
>+ *	#define bar	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo))
>+ *
>+ *	With above definitions bar expands to 3.
>+ */
>+#define DROP_FIRST(args...)		__DROP_FIRST(args)
>+#define __DROP_FIRST(a, b...)		b
>+
>+/**
>+ * PICK_FIRST - Returns the first argument.
>+ * @args: arguments
>+ *
>+ * This helper macro allows manipulation the argument list before passing it
>+ * to the next level macro.
>+ *
>+ * Example:
>+ *
>+ *	#define foo	X,Y,Z,Q
>+ *	#define bar	PICK_FIRST(foo)
>+ *
>+ *	With above definitions bar expands to X.
>+ */
>+#define PICK_FIRST(args...)		__PICK_FIRST(args)
>+#define __PICK_FIRST(a, b...)		a
>+
>+/**
>+ * PICK_LAST - Returns the last argument.
>+ * @args: arguments
>+ *
>+ * This helper macro allows manipulation the argument list before passing it
>+ * to the next level macro.
>+ *
>+ * Like COUNT_ARGS() this macro works up to 12 arguments.
>+ *
>+ * Example:
>+ *
>+ *	#define foo	X,Y,Z,Q
>+ *	#define bar	PICK_LAST(foo)
>+ *
>+ *	With above definitions bar expands to Q.
>+ */
>+#define PICK_LAST(args...)		__PICK_ARG(COUNT_ARGS(args), args)
>+#define __PICK_ARG(n, args...)		CALL_ARGS(CONCATENATE(PICK_ARG, n), args)
>+#define PICK_ARG1(args...)		PICK_FIRST(args)
>+#define PICK_ARG2(args...)		PICK_ARG1(DROP_FIRST(args))
>+#define PICK_ARG3(args...)		PICK_ARG2(DROP_FIRST(args))
>+#define PICK_ARG4(args...)		PICK_ARG3(DROP_FIRST(args))
>+#define PICK_ARG5(args...)		PICK_ARG4(DROP_FIRST(args))
>+#define PICK_ARG6(args...)		PICK_ARG5(DROP_FIRST(args))
>+#define PICK_ARG7(args...)		PICK_ARG6(DROP_FIRST(args))
>+#define PICK_ARG8(args...)		PICK_ARG7(DROP_FIRST(args))
>+#define PICK_ARG9(args...)		PICK_ARG8(DROP_FIRST(args))
>+#define PICK_ARG10(args...)		PICK_ARG9(DROP_FIRST(args))
>+#define PICK_ARG11(args...)		PICK_ARG10(DROP_FIRST(args))
>+#define PICK_ARG12(args...)		PICK_ARG11(DROP_FIRST(args))
>+
>+/**
>+ * ARGS_SEP_COMMA - Definition of a comma character.
>+ *
>+ * This definition can be used in cases where any intermediate macro expects
>+ * fixed number of arguments, but we want to pass more arguments which can
>+ * be properly evaluated only by the next level macro.
>+ *
>+ * Example:
>+ *
>+ *	#define foo(f)	f(X) f(Y) f(Z) f(Q)
>+ *	#define bar	DROP_FIRST(foo(ARGS_SEP_COMMA __stringify))
>+ *	#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST(foo(ARGS_SEP_COMMA)))
>+ *
>+ *	With above definitions bar expands to
>+ *		"X", "Y", "Z", "Q"
>+ *	and buz expands to 4.
>+ */
>+#define ARGS_SEP_COMMA			,
>+
>+#endif	/* _LINUX_ARGS_H */

		^ wrong one, and anyway can be removed as we don't use
these comments in xe


Eventually we may also add a kunit to make sure we don't have surprises.
As long as the .o match on next patch, not required for now.

with those fixed:


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi

>-- 
>2.43.0
>
