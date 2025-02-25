Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2842C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 17:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC4F10E1D6;
	Tue, 25 Feb 2025 17:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bsmwg43M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D97210E1DB
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 17:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740505642; x=1772041642;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/KR35jp4H9r+npzEnBL4i0YeEIABm4kj2H2fldKDjyY=;
 b=Bsmwg43MzK0zmjrjzo9NUMbygJi2nNDaAuMkWu2pwjVQdWtnJLxxhLmb
 e6JMLg4/amRkGNio2lfawHara+KhOM8LP84YanjX18qjaJAue59y9fFoE
 5DCLDg8G1GGk4czyM+v5JL+VQlk5nQ3rA252IwQbp7e6Uu0rt37m2XDms
 vOJdMW+yRjp2LnnS34XyOpYxv/LU9HhNaZis28qNfFuBac/hWZK5ZB0qA
 HGTsfCVSU3789D9xUN2Kf1bHMYADR/QoTMgf6fomIoo2yvgOhL4vgHFMm
 ZVPtM5HKqG2YQ3udbv9nMuyunbaZKJofArZ+YtZw91sq+zNwBTiDNKXf7 g==;
X-CSE-ConnectionGUID: idQdSShfTZ+l4A68e87Hlg==
X-CSE-MsgGUID: LvLwEH1pTUmI/gscZrlYyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41240930"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41240930"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 09:47:22 -0800
X-CSE-ConnectionGUID: z6csVS52QAarrwn86rQwNQ==
X-CSE-MsgGUID: 7N9vQIEGQBaLAXr8adhWvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="121398725"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 09:47:22 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Feb 2025 09:47:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 09:47:21 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 09:47:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EuuIC9QyodlDvtKUSxjWATPlD0+D+gUHaLeOBWOpfS3KypU7LsrB3KOhqv6ZFuKxKwUMVn9uFYVwcGo+/7q287l+i8X1lcBpVMlNqD++VG8e19VXko3ZjcnQmYNK5ZRill3ZT7EVOisPbv/K6omp3PzMxKCvdSfw4NscSp483OEwjknWcW5H3jPXlTNTvdb6gKLxOIuSst+YPI9cydePdnizaHW2qOXXeumi3/4pU/rCQrIkZTPjOGepVITrNj9282q2dVspTQ0s7Qyk24QgQ3TyK/W4/kWtFagACXxGgsLys25dB5X6unzLz1QPqOVWS3wzW7k6Ht/iRJqAcZri/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tupX+g+gnTsN526n0fKwrvehNGp0lOEW9/tfW9KHdQc=;
 b=hNuJwmAaUzDE0A++A29Ammp0YJbopAPp097owblUg6/erl0R6yThDZ9cz45yeUmlE68AIFZFWLx5qGsdAH+aZGgugCYBRGDZ8+8mgArfmxS+jzA5orP1eiDOkJBSkPfjyjWa2/yRvB55YrT4zjVZm0ktcp1Wr/KttJQwPmdUkksE0eiUW8jN7tBK/xOElffzSw4IyznJoM/rC3Ht6P+mBxwuoA/dmwg2di9cnnakhEewqYOCUdR53W2A+HegLhpfnYPJAXyEAPapcRNPzAFYqNR1rx/BqH2w/HoUbV0UhE02LaqVnaC6r9GJKfd5QJY0ZvonVUOlyQpQ/Axhw40/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 17:47:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 17:47:15 +0000
Date: Tue, 25 Feb 2025 11:47:12 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
Message-ID: <45qgg5bemip4eihjl6bpen5hbi7babw2itp66q3gjmej2lvs4z@gg5bp37gcweo>
References: <20250213000220.3510885-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250213000220.3510885-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR04CA0074.namprd04.prod.outlook.com
 (2603:10b6:303:6b::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aad0b48-5bfe-44f6-f04a-08dd55c470d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lxjlFBOVVi0J8z2Vlyx/fR6MxuBCmSlvKHVdpiWAKyfc6T6ukFrIEGVTgS0x?=
 =?us-ascii?Q?VUVwJua4Z5ZyLIl6YmloijzHPZppW3mokT1iZjcYcznaEabsOfbjwkYNUI36?=
 =?us-ascii?Q?LkUkjrFlGTWrrSU0+83TK6NciYigRCM9nnYYXFmAskjzAuTlZkSXckKF0wH3?=
 =?us-ascii?Q?DDLEw9KQZFfxYWPbF/I83fYtFWHpQ6YkfSwC7qtO/d6WnUzE7/2jTjLr1ABZ?=
 =?us-ascii?Q?HETr01jS+bqzSnSHj0rp8Ad0N9mhaO05A4WTC0QyuYyEni7SRnH4T9YEPM9o?=
 =?us-ascii?Q?wPANVLaK7pnH92K7wUb/rMKnLUtndgHTRbxDSM8y3jr5j98O771PVfawxvHD?=
 =?us-ascii?Q?qgFee6ofNyg6X9cv4jlD1ceKlh6KFSQNdQ5C3KBiQWKYY6xAkZVod6eY6xrK?=
 =?us-ascii?Q?LrXZ5NveJV8elaNfWX458V71G99X0DFvSWMZuF5QiFrNbUfaCq5ufCSkMW8n?=
 =?us-ascii?Q?I7DN8Ji676tMjODPL5rIdutbDE98iPk9VpxpgD9FErFvuthT9qPeRuUyK4HC?=
 =?us-ascii?Q?zdOhXhofU8KMAD/77pXHTEo2pfW0Sok/Q5+6U/TQULFg45XF+7h54r3G/u8u?=
 =?us-ascii?Q?5Cvxxx0xJ6AQw6B0JMkQKbdg13SUVInXrqxKlX6pe/ZKJyIuYRPa8txUqLnT?=
 =?us-ascii?Q?34kDUmhSPD9AfOW5VLshSmdfK63I+y51VmiMCVEHS62A8hrzQpzYo61BDSae?=
 =?us-ascii?Q?0F2r3dbd63CowaXZkx2Yxu4T6UjcUxEFeCFg7lXrYteg2Wpob/1xDrzXYTzp?=
 =?us-ascii?Q?bN9HINB5S/37So0jF1IekMagsALNGxMQphVU7yIseKURTp1sSTIsNhwoGcrt?=
 =?us-ascii?Q?fdn/lZBTHuL8iCon7gIuYF0C6RXy0EKVCvXVSWKiV5+Qak2HogK3fs+3Nt7E?=
 =?us-ascii?Q?uW80XJgRXKrDDX5Lgl5++SbJrWbU4Xclz9p56h+OcmI62r974grbBSYDNSCl?=
 =?us-ascii?Q?/p6CdHKLwJi+0pRHfaCcfHBKO/DczQjH+P77ra8kvyvbkBs1l3oj88NFPERV?=
 =?us-ascii?Q?UCiyUt/f35RCwyAJcOUkHxq3J/bfwL7+iWaTekLXThSKdkYgt4d3n2sfo5ur?=
 =?us-ascii?Q?s6HMAJauavtWa6gJJIdPnzVQ4t6vmXbl8LiMpbalBrrfmblBBsThHiNXaOPv?=
 =?us-ascii?Q?bk2QBllvX1YXW5V3kYvVEUbrfT0fzhh+5GoEV82CBJob9D7Ng5cqFo4j1xb/?=
 =?us-ascii?Q?gLMGZBlm8vnLkRt4+HuQSq2OElU6jjsPYjOYIyoHQ2dv2EVW0ruR8FxekBUk?=
 =?us-ascii?Q?tvGBrU5EItExWGSGNlHeE98LpTrDP/P45/NMXKfm9tNbjVtiEp/czktRjzIy?=
 =?us-ascii?Q?pQSt4Y054s7QAYrW9jv62HgiS4PAk0l+jaXdCYAW/DDEHrLT+gQcL5T1Z9IQ?=
 =?us-ascii?Q?Y1S0mP/ORdIwfjUlePjBcf3t+ksZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9f1C6y4OGa72i2Gunn5CZb2DVfUAQrX0PQjJz3nvq6MgJlqZNyYg0g+LVImI?=
 =?us-ascii?Q?Lq0Mkh+nZaQ7blDBIoq+kXPuJB1bedyai8lGMoB9GzLhRXYJo+q/mrYe4qF0?=
 =?us-ascii?Q?r8OXsvh1A7IDmYaTPQKNzXpWw0ChZSBdF+IiQxSJIrWg2I3XFmhdZowRT/TB?=
 =?us-ascii?Q?CqmttBVEIEH1qoKyvEYljPYV6RIqSXsk1ZteZPv2ZGS5YBSlOffi6S775F3h?=
 =?us-ascii?Q?zq0Q6sPIYdRjLSp33Dw92/oLb7gofHmU6gnaqGPc+w8bhMbm+/K++kWUbYaZ?=
 =?us-ascii?Q?vQBn1jZZyTwJ9iDS1dXePPngG3vcbmZXQdXlDe/SR2QYZ9PAR4+NMRRhLFoP?=
 =?us-ascii?Q?q29C+nQeLI1NePlQA5w2PS1fprwhTp4v8GolwDzHZblT9Kbkkc6ETaKRKWYC?=
 =?us-ascii?Q?pYLQNJiUiWdtk+h5buIZEMHsSMdMQkvcreT5x1ST3Yq+XfDooW4GbHTm24j/?=
 =?us-ascii?Q?MXuJu6o3ltEzLDNMbZR2Fn5Tzh+QsOmxWUK1fgPNHXhhM80TFy8PixsHasp0?=
 =?us-ascii?Q?mQgOxoyXjPICLpDyqKOAW50MBKpA9GeqmzROCA/txU8wCBGrxIqrHgkW0dcq?=
 =?us-ascii?Q?kIfSGzfywpYrCLEqJCDkZJvAlR5BPwAYBEFChvpgZqKAZSAdlIiQjK4qc2Nx?=
 =?us-ascii?Q?Ybk/PObewuTcHKzKIBI1Je6NMDU1M0Ql3w+/ywog0nB4X5uyGflvVQAG5ZRi?=
 =?us-ascii?Q?1NtGtKXxmMvYvxbnzZjVCSyutgSnVEvXlmwHRM8UnEYQ0ZrPp5Qrtl0uHZOb?=
 =?us-ascii?Q?jOXWztSJTTQHBSpCppVBKwGLDvSFnIxTI9WBb1vcyvnSbW/rzOzsHlxcXepy?=
 =?us-ascii?Q?t3xeqL7STuOfS9uCYbBTAxlnNTtoNF1ZBkmhz4EdlZi8g8cePA8OhR7O4fDX?=
 =?us-ascii?Q?+FfFsHy/fpWlvPbfzo437DTe+lNghPgzLR6Y586BRvqzLwa94a+863bNhydT?=
 =?us-ascii?Q?VKHXwnNVSAabkluEv2Au9ZHLKrBPsIMPcrs62KLFZxeFwRdlgHogJ9GIiV0j?=
 =?us-ascii?Q?2XPPGldJQ0MewIFomdgkzaNrZSoSBl7689/OKEWThiA7LMReU5bPQJgNAeWE?=
 =?us-ascii?Q?lNd95hTXNQrAYyRDn4ncAhJxL/bpGOoTveKDpqvvzg4Uj+KiEp6vK2JStWmz?=
 =?us-ascii?Q?6RUbRnzTbGeTG1tGRANhDE7FbZ74iv8W+RBhjCTUdygCHIZWk7fd4RX+rJFT?=
 =?us-ascii?Q?nsuqOT1UDn66Ih7QOKMd/jP/Mxi6tes9aB11vSj04vKk3J+gapyX2QfPZb5z?=
 =?us-ascii?Q?SzZVhRcPpVBh9HELczI3WiNM4Q7cZBucqNT5McnlJr7dT54BCi4AtVX9bwQw?=
 =?us-ascii?Q?+YhPKXLraW/k4y/UyziitRwCgTHxZaDv/HxSR7+rtvX1MWAPlX/XRoQmnFBR?=
 =?us-ascii?Q?3A8d3xDBWPr0EpuXckqhQc0D7Yg6aD/5gmk0uJmvG6NTrCuPPYCcuTtPTIz8?=
 =?us-ascii?Q?qaK0dZgCH4iPetvpmeY6Ze3OOs9N1S8owVy8R1n+RF4znkUlwgvH7RMpuR68?=
 =?us-ascii?Q?7YJMSzOmrTP/IcT/t02cmrqbvOuVfqOS8SC2zCJRJ5wuPclAfXRnt47QJIg/?=
 =?us-ascii?Q?gXXyjBSNZVuosKeSBvwhhe+8GvqS3F/5CvBHHs1CHZeXQbeFqZ9DAd6D22G4?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aad0b48-5bfe-44f6-f04a-08dd55c470d6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 17:47:15.3691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bu0+IiTgPjy0RFUfhDfCyiECxwfd4sGE9BGkaPjc9D9lL1JF+MH1T6n7e8KSIyQyDIl2UOWpIUwRxBODS8IQdniSP/87lEpule02b7JVT7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6278
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

On Wed, Feb 12, 2025 at 04:02:20PM -0800, Vinay Belgaumkar wrote:
>Define PMU events for GT frequency (actual and requested). This is
>a port from the i915 driver implementation, where an internal timer
>is used to aggregate GT frequencies over certain fixed interval.
>Following PMU events are being added-
>
>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>
>Standard perf commands can be used to monitor GT frequency-
>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>
>     1.001175175                700 M    xe/gt-requested-frequency,gt=0/
>     2.005891881                703 M    xe/gt-requested-frequency,gt=0/
>     3.007318169                700 M    xe/gt-requested-frequency,gt=0/
>
>Actual frequencies will be reported as 0 when GT is in C6.
>
>v2: Use locks while storing/reading samples, keep track of multiple
>clients (Lucas) and other general cleanup.
>
>Cc: Riana Tauro <riana.tauro@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/xe_pmu.c       | 211 ++++++++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_pmu_types.h |  29 ++++
> 2 files changed, 230 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index 3910a82328ee..ed76756403ea 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -8,6 +8,8 @@
>
> #include "xe_device.h"
> #include "xe_gt_idle.h"
>+#include "xe_guc_pc.h"
>+#include "xe_macros.h"
> #include "xe_pm.h"
> #include "xe_pmu.h"
>
>@@ -37,6 +39,17 @@
>
> #define XE_PMU_EVENT_GT_MASK		GENMASK_ULL(63, 60)
> #define XE_PMU_EVENT_ID_MASK		GENMASK_ULL(11, 0)
>+#define XE_HRTIMER_INTERVAL_NS		5000000
>+
>+static struct xe_pmu *event_to_pmu(struct perf_event *event)
>+{
>+	return container_of(event->pmu, typeof(struct xe_pmu), base);
>+}
>+
>+static struct xe_device *event_to_xe(struct perf_event *event)
>+{
>+	return container_of(event->pmu, typeof(struct xe_device), pmu.base);
>+}

we shouldn't add refactors like this in the same patch you are adding a
new feature, it creates noise in the patch and makes it harder to see
what's going on. Please drop both event_to_pmu() and event_to_xe().

>
> static unsigned int config_to_event_id(u64 config)
> {
>@@ -49,10 +62,12 @@ static unsigned int config_to_gt_id(u64 config)
> }
>
> #define XE_PMU_EVENT_GT_C6_RESIDENCY	0x01
>+#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x02
>+#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x03

this will need a rebase

>
> static struct xe_gt *event_to_gt(struct perf_event *event)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = event_to_xe(event);
> 	u64 gt = config_to_gt_id(event->attr.config);
>
> 	return xe_device_get_gt(xe, gt);
>@@ -70,7 +85,7 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>
> static void xe_pmu_event_destroy(struct perf_event *event)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = event_to_xe(event);
>
> 	drm_WARN_ON(&xe->drm, event->parent);
> 	xe_pm_runtime_put(xe);
>@@ -79,7 +94,7 @@ static void xe_pmu_event_destroy(struct perf_event *event)
>
> static int xe_pmu_event_init(struct perf_event *event)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = event_to_xe(event);
> 	struct xe_pmu *pmu = &xe->pmu;
> 	unsigned int id, gt;
>
>@@ -104,6 +119,8 @@ static int xe_pmu_event_init(struct perf_event *event)
> 	if (has_branch_stack(event))
> 		return -EOPNOTSUPP;
>
>+	XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);

I was going to say that we don't need the other ones. But then I noticed
XE_PMU_MAX_EVENT_TYPES == 64, which is a lot more than we currently
support.

I suggested it before, but what's the issue of keeping a linked list of
the events like rapl_pmu::active_list?

>+
> 	if (!event->parent) {
> 		drm_dev_get(&xe->drm);
> 		xe_pm_runtime_get(xe);
>@@ -113,16 +130,50 @@ static int xe_pmu_event_init(struct perf_event *event)
> 	return 0;
> }
>
>+static u64
>+xe_get_pmu_sample(struct xe_pmu *pmu, unsigned int gt_id, uint32_t id)
>+{
>+	unsigned long flags;
>+	u64 val;
>+
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+	val = pmu->event_sample[gt_id][id];
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>+
>+	return val;
>+}
>+
>+static void
>+xe_store_pmu_sample(struct xe_pmu *pmu, uint32_t gt_id, uint32_t id,
>+		    uint32_t val, uint32_t period)
>+{
>+	unsigned long flags;
>+
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+	pmu->event_sample[gt_id][id] += mul_u32_u32(val, period);
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>+}
>+
> static u64 __xe_pmu_event_read(struct perf_event *event)
> {
> 	struct xe_gt *gt = event_to_gt(event);
>+	struct xe_device *xe = event_to_xe(event);

gt_to_xe() avoids the additional helper and you don't even need it.
You are intested in the pmu, not xe... so you could just have used

	pmu = container_of(event->pmu, typeof(struct xe_pmu), base);

... like is done in other places.

>+	struct xe_pmu *pmu = &xe->pmu;
>+	unsigned long id;
>
> 	if (!gt)
> 		return 0;
>
>-	switch (config_to_event_id(event->attr.config)) {
>+	id = config_to_event_id(event->attr.config);
>+
>+	switch (id) {
> 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
> 		return xe_gt_idle_residency_msec(&gt->gtidle);
>+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>+		return div_u64(xe_get_pmu_sample(pmu, gt->info.id,
>+			       id),

keep in the line above, it doesn't help readability.

>+			       USEC_PER_SEC /* to MHz */);

why is the unit nsec -> usec when storing, couldn't we just use
NSEC_PER_SEC here?

> 	}
>
> 	return 0;
>@@ -143,7 +194,7 @@ static void xe_pmu_event_update(struct perf_event *event)
>
> static void xe_pmu_event_read(struct perf_event *event)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = event_to_xe(event);
> 	struct xe_pmu *pmu = &xe->pmu;
>
> 	if (!pmu->registered) {
>@@ -154,8 +205,105 @@ static void xe_pmu_event_read(struct perf_event *event)
> 	xe_pmu_event_update(event);
> }
>
>+static bool gt_pmu_event_active(struct xe_pmu *pmu, uint32_t id, uint32_t gt_id)
>+{
>+	return pmu->active_mask[gt_id] & BIT_ULL(id);
>+}
>+
>+static bool pmu_needs_timer(struct xe_pmu *pmu)
>+{
>+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+	struct xe_gt *gt;
>+	int i;
>+
>+	for_each_gt(gt, xe, i)
>+		if (gt_pmu_event_active(pmu, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, i) ||
>+		    gt_pmu_event_active(pmu, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, i))
>+			return true;
>+
>+	return false;
>+}
>+
>+static void xe_pmu_start_timer(struct xe_pmu *pmu, uint32_t gt_id)
>+{
>+	/* Timer is per device */
>+	if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
>+		pmu->timer_enabled = true;
>+		pmu->timer_last = ktime_get();
>+		hrtimer_start_range_ns(&pmu->timer,
>+				       ns_to_ktime(XE_HRTIMER_INTERVAL_NS), 0,
>+				       HRTIMER_MODE_REL_PINNED);
>+	}
>+}
>+
>+static void
>+xe_sample_gt_frequency(struct xe_gt *gt, uint32_t period_ns)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	uint32_t act_freq, cur_freq;
>+	int ret;
>+
>+	if (gt_pmu_event_active(pmu, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, gt->info.id)) {
>+

drop this line

>+		/* Actual freq will be 0 when GT is in C6 */
>+		act_freq = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>+		xe_store_pmu_sample(pmu, gt->info.id, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
>+				 act_freq, period_ns / NSEC_PER_USEC);
>+	}
>+
>+	if (gt_pmu_event_active(pmu, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, gt->info.id)) {
>+		ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
>+		if (!ret)
>+			xe_store_pmu_sample(pmu, gt->info.id, XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
>+					 cur_freq, period_ns / NSEC_PER_USEC);
>+	}
>+}
>+
>+static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
>+{
>+	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
>+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+	u64 time_diff_ns;
>+	struct xe_gt *gt;
>+	ktime_t now;
>+	int i;
>+
>+	if (!READ_ONCE(pmu->timer_enabled))
>+		return HRTIMER_NORESTART;
>+
>+	now = ktime_get();
>+	time_diff_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
>+	pmu->timer_last = now;
>+
>+	/*
>+	 * The passed in period includes the time needed for grabbing the forcewake.

I don't think this is true anymore, is it?

xe_sample()
   1. calculate time_diff at the beginning of the function
   2. for each gt, readout freq samples, using the time_diff, may include
      delays on forcewake, but that is not included in the time_diff
   3. htimer is adjusted to timer_last + period

>+	 */
>+	for_each_gt(gt, xe, i)
>+		xe_sample_gt_frequency(gt, time_diff_ns);
>+
>+	hrtimer_forward(hrtimer, now, ns_to_ktime(XE_HRTIMER_INTERVAL_NS));
>+
>+	return HRTIMER_RESTART;
>+}
>+
> static void xe_pmu_enable(struct perf_event *event)
> {
>+	struct xe_pmu *pmu = event_to_pmu(event);
>+	struct xe_gt *gt = event_to_gt(event);
>+	uint32_t id = config_to_event_id(event->attr.config);
>+	unsigned long flags;
>+
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+
>+	/* Update event mask */
>+	pmu->active_mask[gt->info.id] |= BIT_ULL(id);
>+	pmu->n_active[gt->info.id][id]++;
>+
>+	/* Start a timer, if needed, to collect samples */
>+	xe_pmu_start_timer(pmu, gt->info.id);
>+
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
> 	/*
> 	 * Store the current counter value so we can report the correct delta
> 	 * for all listeners. Even when the event was already enabled and has
>@@ -166,7 +314,7 @@ static void xe_pmu_enable(struct perf_event *event)
>
> static void xe_pmu_event_start(struct perf_event *event, int flags)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = event_to_xe(event);
> 	struct xe_pmu *pmu = &xe->pmu;
>
> 	if (!pmu->registered)
>@@ -176,26 +324,53 @@ static void xe_pmu_event_start(struct perf_event *event, int flags)
> 	event->hw.state = 0;
> }
>
>+static void xe_pmu_disable(struct perf_event *event)
>+{
>+	struct xe_device *xe = event_to_xe(event);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	unsigned long flags;
>+	uint32_t id = config_to_event_id(event->attr.config);
>+	uint32_t gt_id = config_to_gt_id(event->attr.config);
>+
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+
>+	if (--pmu->n_active[gt_id][id] == 0) {
>+		pmu->active_mask[gt_id] &= ~BIT_ULL(id);
>+		pmu->timer_enabled &= pmu_needs_timer(pmu);
>+	}
>+
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>+}
>+
> static void xe_pmu_event_stop(struct perf_event *event, int flags)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = event_to_xe(event);
> 	struct xe_pmu *pmu = &xe->pmu;
>+	uint32_t id = config_to_event_id(event->attr.config);
>+
>+	XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);

if not using a linked list as suggested, please drop this. Instead block
the event init from succeeding.

>
>-	if (pmu->registered)
>+	if (pmu->registered) {
> 		if (flags & PERF_EF_UPDATE)
> 			xe_pmu_event_update(event);
>
>+		xe_pmu_disable(event);
>+	}
>+
> 	event->hw.state = PERF_HES_STOPPED;
> }
>
> static int xe_pmu_event_add(struct perf_event *event, int flags)
> {
>-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_device *xe = event_to_xe(event);
> 	struct xe_pmu *pmu = &xe->pmu;
>+	uint32_t id = config_to_event_id(event->attr.config);
>
> 	if (!pmu->registered)
> 		return -ENODEV;
>
>+	XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);

ditto.

Lucas De Marchi

>+
> 	if (flags & PERF_EF_START)
> 		xe_pmu_event_start(event, flags);
>
>@@ -270,6 +445,10 @@ static ssize_t event_attr_show(struct device *dev,
> 	XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
>
> XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>+		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
>+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>+		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>
> static struct attribute *pmu_empty_event_attrs[] = {
> 	/* Empty - all events are added as groups with .attr_update() */
>@@ -283,6 +462,8 @@ static const struct attribute_group pmu_events_attr_group = {
>
> static const struct attribute_group *pmu_events_attr_update[] = {
> 	&pmu_group_gt_c6_residency,
>+	&pmu_group_gt_actual_frequency,
>+	&pmu_group_gt_requested_frequency,
> 	NULL,
> };
>
>@@ -290,8 +471,11 @@ static void set_supported_events(struct xe_pmu *pmu)
> {
> 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>
>-	if (!xe->info.skip_guc_pc)
>+	if (!xe->info.skip_guc_pc) {
> 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>+	}
> }
>
> /**
>@@ -306,6 +490,8 @@ static void xe_pmu_unregister(void *arg)
> 	if (!pmu->registered)
> 		return;
>
>+	hrtimer_cancel(&pmu->timer);
>+
> 	pmu->registered = false;
>
> 	perf_pmu_unregister(&pmu->base);
>@@ -334,6 +520,11 @@ int xe_pmu_register(struct xe_pmu *pmu)
> 	if (IS_SRIOV_VF(xe))
> 		return 0;
>
>+	raw_spin_lock_init(&pmu->lock);
>+
>+	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>+	pmu->timer.function = xe_sample;
>+
> 	name = kasprintf(GFP_KERNEL, "xe_%s",
> 			 dev_name(xe->drm.dev));
> 	if (!name)
>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>index f5ba4d56622c..cd68cba58693 100644
>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>@@ -10,6 +10,7 @@
> #include <linux/spinlock_types.h>
>
> #define XE_PMU_MAX_GT 2
>+#define XE_PMU_MAX_EVENT_TYPES	64
>
> /**
>  * struct xe_pmu - PMU related data per Xe device
>@@ -34,6 +35,34 @@ struct xe_pmu {
> 	 * @supported_events: Bitmap of supported events, indexed by event id
> 	 */
> 	u64 supported_events;
>+	/**
>+	 * @lock: Lock protecting enable mask and sampling
>+	 */
>+	raw_spinlock_t lock;
>+	/**
>+	 * @active_mask: Bit representation of active events
>+	 */
>+	u64 active_mask[XE_PMU_MAX_GT];
>+	/**
>+	 * @n_active: Counts for the enabled events
>+	 */
>+	unsigned int n_active[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>+	/**
>+	 * @timer: Timer for sampling GT frequency.
>+	 */
>+	struct hrtimer timer;
>+	/**
>+	 * @timer_last: Timestmap of the previous timer invocation.
>+	 */
>+	ktime_t timer_last;
>+	/**
>+	 * @timer_enabled: Should the internal sampling timer be running.
>+	 */
>+	bool timer_enabled;
>+	/**
>+	 * @event_sample: Store freq related counters.
>+	 */
>+	u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
> };
>
> #endif
>-- 
>2.38.1
>
