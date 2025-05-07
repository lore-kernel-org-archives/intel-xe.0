Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A454C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 22:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74CA10E201;
	Wed,  7 May 2025 22:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XcbPIa/l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B3910E201
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 22:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746655968; x=1778191968;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+qHIPtdxFMJ5Ok611Ihh8ZlzIvMuyUiAt3j8t0HT0DQ=;
 b=XcbPIa/lOf76AG3imJvrjopLMMYyzsgcflRn6pjA3DY+6CNMclsOShur
 Y8aEYqpzsBrQXdO7bYacz0eFjXctzRsQh4pAfWRtOITCAM5vZD9jc/uXW
 gK0nnCLoNOR16FqnWARCGaDIgydNawwuxrbo64eKI+rqinrbP746umwLH
 BSJJGWWs8PhfeKSX8sjDXj6+em/CjLcfQWnDnp3L4SIqwyqzKlDeq40oB
 4DcfiT/QsJ6+LKubJk2x4YSuG8ijzRlDPyo/Mdj4COjG/OelLvp7/mjjW
 ZaP2HvCk5wNuXYbSiRBUuFmqykIHzS2s3AnP1PqUMfoCDQ/ujdgXcLtK8 Q==;
X-CSE-ConnectionGUID: a0LY25hNQkyWIe3xwRWkiA==
X-CSE-MsgGUID: GrdeLv6QR/GWPS/MfDb/HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47672074"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="47672074"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 15:12:47 -0700
X-CSE-ConnectionGUID: RE8sLC4CT7KwbSRoEe3E0A==
X-CSE-MsgGUID: zJqyznD6Qmuss99SOOngEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136487106"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 15:12:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 15:12:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 15:12:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 15:12:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rw0bvM/GcIMxL+VTU+khEoogRTg7rvLt88pQM0DXDx51mqFyYtkhK4a6yWZJguiDRbJuAiWgxdkKprz9Sd8AOXmCObGDhC2oESyxQ62MDXwNkujYUVKbDm/hrtqSqC7xwWga4FWekMlxWejyuNJNeH6/lLGaHHe2RmWWSHNGeGSqsxfm67tKMNWLR/eQMoc5OOqdlzdezjwjPNZ7y8hsCx4Uvqop6/DR41kh4777xa6e3Fz7YEKPgsf0T26VS8de3dQOJvEHiTY3tg1+cCNlYtUDxaSir8/5ThcdCks6O5YPJJBr8yB8gKpV1kzBWhFK7IrwX6GtziVrBW8Zcx+EIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m74poiiRX5TUcg/zcVSRz5cAAA8YZj0PWU4E+4AvP5E=;
 b=vbDG/MrKTTAdmjz+MTXa1b9U8SPyCWl/w/iifZ0IezFxIIV6I3LzEMd0bMa3yGRaW6u7uibY7PheWm56cfhOzS4lr7cIv152hxRY8iPu2gdwLXg2YrOtoTEkGx3X+B38sy4IfnrmdnbCAF5NjrXAD/oUwkreLoPGB9TI/A+qYpVhl1IuwNJPv05+tik5Kb5wK2hbv3nFvP0IDfRFWARhtknBXtHtsHvXfM8pLqrl3gHkIVsCu624KG71wtyU1dygQ8wtpdde/k3LllzzflXIU5Y2olMNT1w5d6tEN2f9Ow8FV0ZvMFHo8VFmaK+gOPULU6ixfQkYgt69mIQXJkQAyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH3PPF383C22AA3.namprd11.prod.outlook.com (2603:10b6:518:1::d17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 22:12:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Wed, 7 May 2025
 22:12:35 +0000
Date: Wed, 7 May 2025 17:12:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 4/4] drm/xe: Add WA BB to capture active context
 utilization
Message-ID: <aarvdqcouwxr5pqkkv5xum4gcype5335ophwpn363e6dko5ukc@tz5aquyxas4n>
References: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
 <20250507013039.2043897-10-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250507013039.2043897-10-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW3PR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:303:2a::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH3PPF383C22AA3:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c4df36-e65b-4c5e-bf78-08dd8db444ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1gAY8kWp8/BZY1DXyG5X56hYddzG0fzpCALewNKWlLhcWVpA7leqI7P/rjr/?=
 =?us-ascii?Q?DC+nFuhK3yk9gjBBCXMpIz4iW/byLJf9YG1sZMx4bjHOuY2a/7+giRHpDLD1?=
 =?us-ascii?Q?SqCFcWb461ZXmkeWzJCSClXRjHv7YF+KNQAMnFLfWy6MKYu1zYDbt1N7JdE1?=
 =?us-ascii?Q?uf/O4wlbwxCzVHyfs6Ln51P830AFbGLO+bgJKL1upJ9C2I4jhdcFIMVE8cGf?=
 =?us-ascii?Q?Ola0ZjN/49ATgv5zQiKohFVxyJFtFFjSJleIUE2TnnRJZldVKxf3kO8T0gyg?=
 =?us-ascii?Q?OAy4ewBH7aqZJXWvGrlff9/vEM3j4BPvbt2Zhd4T28KdmK5IQkLOf37jPwmA?=
 =?us-ascii?Q?9H96j+La+NjpD3egMNHT3/mLuTPdGZTWel/QBZJ5D7WTtVWPHo9y2g43hVOQ?=
 =?us-ascii?Q?iOZ0A6/B963CS8HyF6vkxGaLtdGQnYDkRbCTirhCSFDpU9siEUL3mm9gu6W8?=
 =?us-ascii?Q?OThgz00wqaAjqGTZ+7BlCrSMqr0ZUz6zfqIJa7MXSX/vgtZu6Gja3tiW3IO2?=
 =?us-ascii?Q?tPDnFxyn5eG2w/GFNwiV748/I2wHahn+67IqlHDA3/yYZ8cay2YjODhGMn+L?=
 =?us-ascii?Q?sLClaJmQJUWslf6l/c22xjNB0pRDAOju92r4a0yOIScbHPJpHqLyKB2ttWGG?=
 =?us-ascii?Q?YQGPm+ukV3AiRsVR8jdC6gUPg3m0hW//5GZdb0k8ayckLH6ybBg4x1XWNfN9?=
 =?us-ascii?Q?an+4pi7SHWwmhCJ8+bluQseJwagFyy1zo4kwzK3OivCWjZyBkiiiawztqAhU?=
 =?us-ascii?Q?YTY+E4R2IHgvcV4ilb7gn1byNG+uGMt4bL7qKbCHfAwDS1QeFr6I/0nGWrag?=
 =?us-ascii?Q?+f90HVeZp/Ams11WO7aYkTTxKY4oJmHO+vCYussyE3mcrvvyfJSwir01SaYZ?=
 =?us-ascii?Q?d4lmqI2TW7hRLO70IP0vVdQB+rHEt9X3/p39zZH+/vI4LLLXDIZldFI7RI0d?=
 =?us-ascii?Q?t4bAMDDhD0IpKIrBlGn4IfNomfkrHr5zqzt+tPwCUI6fKhJGXbVfICcE6Rsl?=
 =?us-ascii?Q?mInvzTIdwXgSleiZovc9Wjr/AY+72CJMJNtTUHxE5JZwT0awUEojFGRYJGPQ?=
 =?us-ascii?Q?NeLGqchMvpeURUHy0tG1EzjGjq5OnFl1uDCCMdtC8vj9wzyBbNgO+xvcXZ/a?=
 =?us-ascii?Q?t0clXjVD5MUnlKxdnYCSkDpFQc/WOOlMyiDofRG/Zxlj+EkOta1FKrA3g9rJ?=
 =?us-ascii?Q?9eI3KSyfBJlnE+I2DT+9zeg/X/LvxGXhfgWZcldaMOLeREGH74rzlFSpDnf5?=
 =?us-ascii?Q?gazxPy/qyHSBvf371p1i+ez82UXhjv9jLetpm8yCnxRtghh68ZYDkL0/TmxD?=
 =?us-ascii?Q?V/hS2bZPUUIJP8EHgwnw6sv4QPP/y47h97l1LROp2ONmHWb4Obx3u7LwtHtG?=
 =?us-ascii?Q?ylx3sRQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e8hlsV06YBl0dyHXOzm+Vhi/bJExAAi41Lh16zLYRAyUdjlGJ434uNmxVHlB?=
 =?us-ascii?Q?xbAoNG4sM1MFPisl70sfionALr3N5Y+FyWd28qXCcNRZUo16f+DFxGSAT7fq?=
 =?us-ascii?Q?X4R6upJAG+PNkp6YS6NiRqRIjYzOV/vUYuzxzGA4bA6H5mwSSJsWA8rs2o89?=
 =?us-ascii?Q?pox/EBFdU1eIfD3eYE9isCAc04Sgee5ZJEIcSjoaitEiheD5lW5CITyD5fqb?=
 =?us-ascii?Q?eBLjm3SLWzIf4zIT2m3LxuxSXoQriWIpfwo6Zvvv8fbRZ43znVOS5H6lUrOa?=
 =?us-ascii?Q?AyEKkY6HwspY6XLtDM7uJXJrxNSFKYciAgktOTXJ6StOS24CxVu6XUv0spyG?=
 =?us-ascii?Q?BO23HYJk8AHobk0jXmLV+o6Gdyi6oWUvw0/qFFSreH6F3gtjEXsJiA74wiOu?=
 =?us-ascii?Q?I8teIiipMSL7ODozqjg3iNqJcBp46HelevYCXUcmWzhGJGxCaBV/OTzaDPHv?=
 =?us-ascii?Q?e1DI1ruwhhaNemyIFypBN8aNsyx6nJTbdYvickqZCk8WacVjXufhuFyciSNe?=
 =?us-ascii?Q?nj3yvdT8GuBXK+0wV4GSpico7gkbkfeIo+QJq5LNRqPCVPLAJMT48eO4Uf6E?=
 =?us-ascii?Q?v/0aKXDIER7Cqc+9n23Ga2l+nydMN1eLgx7mxcUEuhD7krHey2YHa7Lm38+/?=
 =?us-ascii?Q?OXrX5p6TJAzjnMlgBgLGBFkAoTyNgf45hirmz8Z/W9Oiwe7rWxG2P+pxz6t5?=
 =?us-ascii?Q?03u2IlPB9ZFqffJ0bvmdEEgKKTFx84p5YE11FST/K0fGIJSk6YRm0o1QDn4l?=
 =?us-ascii?Q?wS4WN2pg221236JCWhVGOUxMwAE6HHaWeAQk+q41Ay7LLHFSWpW5ARsTcRba?=
 =?us-ascii?Q?jju4imAJYSZnWoUfsTgjqodhYIoHQhDDWv+UB7LlxVQH78RRAwd80KDrzwcl?=
 =?us-ascii?Q?Q4/uVGzX+Khy5AZSZw7EFUOU+2VGsFuozNjFbgTiOPaLDKUyE8xJVPmawvnj?=
 =?us-ascii?Q?vPbkztBhknfuo3mbtzQ35q/tLWZO8oEYnwEf5HVeORlncEJqau1sHnb3+9Bl?=
 =?us-ascii?Q?+l5TOfG0THG5iejrDO4RnZKpuuGrTTwUUJTFZlsVyh3OCYX0Eg5iWH75ofde?=
 =?us-ascii?Q?kb8nBgNlULzljEct4pO0scH/GsN6KB4FCevFNND7leE6N/Cq+SBc3MGsGjG0?=
 =?us-ascii?Q?usrhp9G5ToW7M2AyKJcl9qv9v6Z8t4/B/gfzTtIWfyIl7elPuSJkT4XpTyYl?=
 =?us-ascii?Q?9F96Qvxk0Ug/l36/cTikKHL+b4Q4UjE0BNhdgFRyQeYZBh6KI18vF0iE8by8?=
 =?us-ascii?Q?QFZIj+izaa+1iCdrJ/cZv6Endl9saEupbNDBb8mkzTLngRe/l7ni9NZTf3ed?=
 =?us-ascii?Q?+0ccKfiLdpSb5Fota16Du1WGLa9hlleiDyUT//9amyxvElQEWUY5e2oGcudl?=
 =?us-ascii?Q?hNP0WxQryow33Zx8GxvOFBprAbpqB+fH0hPyQZ/dSSx9O/WZvgcHlBlgTwu1?=
 =?us-ascii?Q?T1jkGEsBoJb5kZv/VY9AU4juybjOwWJ1UxOgH8Hlwso981eSx6pD1p7kMXXI?=
 =?us-ascii?Q?KRDbjrYQf4DOpv1FL/3z/bQGNBQ4ZTivr/KkpnHRUcwmQB4spyYZaT2XrsKn?=
 =?us-ascii?Q?Kw637pAMhbj6JmxHJlk7GlQwH27okGv/Oi6ZbrDATSgROk6Av8Eso7TQa+Iy?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c4df36-e65b-4c5e-bf78-08dd8db444ee
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 22:12:34.8938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdFNiOHaOjvxomjH5ATs79g/lN2yJLKkaNuqxDm1rrXykpdATQdAmu6MvDRNrxElf7Yw+paGgEjjcV7sbutSdLLumpIeGw/NNfAh9DGO+Ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF383C22AA3
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

On Tue, May 06, 2025 at 06:30:43PM -0700, Umesh Nerlige Ramappa wrote:
>Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks
>of the context, but only gets updated when the context switches out. In
>order to check how long a context has been active before it switches
>out, two things are required:
>
>(1) Determine if the context is running:
>
>To do so, we program the WA BB to set an initial value for CTX_TIMESTAMP
>in the LRC. The value chosen is 1 since 0 is the initial value when the
>LRC is initialized. During a query, we just check for this value to
>determine if the context is active. If the context switched out, it
>would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
>Note that WA BB runs as the last part of the context restore, so reusing
>this LRC location will not clobber anything.
>
>(2) Calculate the time that the context has been active for:
>
>The CTX_TIMESTAMP ticks only when the context is active. If a context is
>active, we just use the CTX_TIMESTAMP MMIO as the new value of
>utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
>for the specific engine instance. Since we do not know which instance
>the context is running on until it is scheduled, we also read the
>ENGINE_ID MMIO in the WA BB and store it in the PPHSWP.
>
>Using the above 2 instructions in a WA BB, capture active context
>utilization.
>
>v2: (Matt Brost)
>- This breaks TDR, fix it by saving the CTX_TIMESTAMP register
>  "drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value"
>- Drop tile from LRC if using gt
>  "drm/xe: Save the gt pointer in LRC and drop the tile"
>
>v3:
>- Remove helpers for bb_per_ctx_ptr (Matt)
>- Add define for context active value (Matt)
>- Use 64 bit CTX TIMESTAMP for platforms that support it. For platforms
>  that don't, live with the rare race. (Matt, Lucas)
>- Convert engine id to hwe and get the MMIO value (Lucas)
>- Correct commit message on when WA BB runs (Lucas)
>
>v4:
>- s/GRAPHICS_VER(...)/xe->info.has_64bit_timestamp/ (Matt)
>- Drop support for active utilization on a VF (CI failure)
>- In xe_lrc_init ensure the lrc value is 0 to begin with (CI regression)
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4532
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   1 +
> drivers/gpu/drm/xe/xe_exec_queue.c       |   2 +-
> drivers/gpu/drm/xe/xe_lrc.c              | 156 ++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
> drivers/gpu/drm/xe/xe_lrc_types.h        |   5 +-
> drivers/gpu/drm/xe/xe_trace_lrc.h        |   8 +-
> 7 files changed, 167 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index 52f4c96c01dc..7ade41e2b7b3 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -43,6 +43,10 @@
> #define XEHPC_BCS8_RING_BASE			0x3ee000
> #define GSCCS_RING_BASE				0x11a000
>
>+#define ENGINE_ID(base)				XE_REG((base) + 0x8c)
>+#define   ENGINE_INSTANCE_ID			REG_GENMASK(9, 4)
>+#define   ENGINE_CLASS_ID			REG_GENMASK(2, 0)
>+
> #define RING_TAIL(base)				XE_REG((base) + 0x30)
> #define   TAIL_ADDR				REG_GENMASK(20, 3)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index 8619244b7c7b..994af591a2e8 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -11,6 +11,7 @@
> #define CTX_RING_TAIL			(0x06 + 1)
> #define CTX_RING_START			(0x08 + 1)
> #define CTX_RING_CTL			(0x0a + 1)
>+#define CTX_BB_PER_CTX_PTR		(0x12 + 1)
> #define CTX_TIMESTAMP			(0x22 + 1)
> #define CTX_TIMESTAMP_UDW		(0x24 + 1)
> #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 606922d9dd73..cd9b1c32f30f 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -830,7 +830,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
> {
> 	struct xe_device *xe = gt_to_xe(q->gt);
> 	struct xe_lrc *lrc;
>-	u32 old_ts, new_ts;
>+	u64 old_ts, new_ts;
> 	int idx;
>
> 	/*
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index b5f5547c7c4f..c78a7987739f 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -24,6 +24,7 @@
> #include "xe_hw_fence.h"
> #include "xe_map.h"
> #include "xe_memirq.h"
>+#include "xe_mmio.h"
> #include "xe_sriov.h"
> #include "xe_trace_lrc.h"
> #include "xe_vm.h"
>@@ -655,6 +656,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
> #define LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET (LRC_CTX_JOB_TIMESTAMP_OFFSET + 4)
> #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>+#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
>
> u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> {
>@@ -704,6 +706,11 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
> 	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
> }
>
>+static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
>+{
>+	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
>+}
>+
> static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
> {
> 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
>@@ -745,6 +752,7 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
> DECL_MAP_ADDR_HELPERS(parallel)
> DECL_MAP_ADDR_HELPERS(indirect_ring)
>+DECL_MAP_ADDR_HELPERS(engine_id)
>
> #undef DECL_MAP_ADDR_HELPERS
>
>@@ -932,6 +940,65 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> 	xe_bo_unpin(lrc->bo);
> 	xe_bo_unlock(lrc->bo);
> 	xe_bo_put(lrc->bo);
>+	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
>+}
>+
>+/*
>+ * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
>+ * context run ticks.
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks of the
>+ * context, but only gets updated when the context switches out. In order to
>+ * check how long a context has been running before it switches out, two things
>+ * are required:
>+ *
>+ * (1) Determine if the context is running
>+ * To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP in
>+ * the lrc. The value chosen is 1 since 0 is the initial value when the lrc is
>+ * initialized. During a query, we just check for this value to determine if the
>+ * context is active. If the context switched out, it would overwrite this
>+ * location with the actual CTX_TIMESTAMP MMIO value. Note that wa bb will run
>+ * after the context has been restored, so reusing this lrc location will not
>+ * clobber anything.
>+ *
>+ * (2) Calculate the time that the context has been running for
>+ * The CTX_TIMESTAMP ticks only when the context is active. If a context is
>+ * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
>+ * While doing so, we need to read the CTX_TIMESTAMP MMIO from the specific
>+ * engine instance. Since we do not know which instance the context is running
>+ * on until it is scheduled, we also read the ENGINE_ID MMIO in the wa bb and
>+ * store it in the PPHSWP.
>+ */
>+#define CONTEXT_ACTIVE 1ULL
>+static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>+{
>+	u32 *cmd;
>+
>+	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>+
>+	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>+	*cmd++ = ENGINE_ID(0).addr;
>+	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
>+	*cmd++ = 0;
>+
>+	*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
>+	*cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>+	*cmd++ = 0;
>+	*cmd++ = lower_32_bits(CONTEXT_ACTIVE);
>+
>+	if (lrc_to_xe(lrc)->info.has_64bit_timestamp) {
>+		*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
>+		*cmd++ = __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
>+		*cmd++ = 0;
>+		*cmd++ = upper_32_bits(CONTEXT_ACTIVE);
>+	}
>+
>+	*cmd++ = MI_BATCH_BUFFER_END;
>+
>+	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>+			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>+
> }
>
> #define PVC_CTX_ASID		(0x2e + 1)
>@@ -973,10 +1040,17 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	if (IS_ERR(lrc->bo))
> 		return PTR_ERR(lrc->bo);
>
>+	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
>+						  ttm_bo_type_kernel,
>+						  bo_flags);
>+	if (IS_ERR(lrc->bb_per_ctx_bo)) {
>+		err = PTR_ERR(lrc->bb_per_ctx_bo);
>+		goto err_lrc_finish;
>+	}
>+
> 	lrc->size = lrc_size;
> 	lrc->ring.size = ring_size;
> 	lrc->ring.tail = 0;
>-	lrc->ctx_timestamp = 0;
>
> 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> 			     hwe->fence_irq, hwe->name);
>@@ -1049,7 +1123,11 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 				     xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL) |
> 				     _MASKED_BIT_ENABLE(CTX_CTRL_PXP_ENABLE));
>
>+	lrc->ctx_timestamp = 0;
> 	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
>+	if (lrc_to_xe(lrc)->info.has_64bit_timestamp) {
>+		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
>+	}
>
> 	if (xe->info.has_asid && vm)
> 		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
>@@ -1078,6 +1156,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	map = __xe_lrc_start_seqno_map(lrc);
> 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>
>+	xe_lrc_setup_utilization(lrc);
>+
> 	return 0;
>
> err_lrc_finish:
>@@ -1297,6 +1377,21 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
> 	return __xe_lrc_parallel_map(lrc);
> }
>
>+/**
>+ * xe_lrc_engine_id() - Read engine id value
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: context id value
>+ */
>+static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
>+{
>+	struct xe_device *xe = lrc_to_xe(lrc);
>+	struct iosys_map map;
>+
>+	map = __xe_lrc_engine_id_map(lrc);
>+	return xe_map_read32(xe, &map);
>+}
>+
> static int instr_dw(u32 cmd_header)
> {
> 	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
>@@ -1844,22 +1939,75 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
> 	kfree(snapshot);
> }
>
>+static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
>+{
>+	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
>+	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
>+	struct xe_hw_engine *hwe;
>+	u64 val;
>+
>+	hwe = xe_gt_hw_engine(lrc->gt, class, instance, false);
>+	if (xe_gt_WARN_ONCE(lrc->gt, !hwe || xe_hw_engine_is_reserved(hwe),
>+			    "Unexpected engine class:instance %d:%d for context utilization\n",
>+			    class, instance))
>+		return -1;
>+
>+	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
>+		val = xe_mmio_read64_2x32(&hwe->gt->mmio,
>+					  RING_CTX_TIMESTAMP(hwe->mmio_base));
>+	else
>+		val = xe_mmio_read32(&hwe->gt->mmio,
>+				     RING_CTX_TIMESTAMP(hwe->mmio_base));
>+
>+	*reg_ctx_ts = val;
>+
>+	return 0;
>+}
>+
> /**
>  * xe_lrc_update_timestamp() - Update ctx timestamp
>  * @lrc: Pointer to the lrc.
>  * @old_ts: Old timestamp value
>  *
>  * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>- * update saved value.
>+ * update saved value. With support for active contexts, the calculation may be
>+ * slightly racy, so follow a read-again logic to ensure that the context is
>+ * still active before returning the right timestamp.
>  *
>  * Returns: New ctx timestamp value
>  */
>-u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
>+u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> {
>+	u64 lrc_ts, reg_ts;
>+	u32 engine_id;
>+
> 	*old_ts = lrc->ctx_timestamp;
>
>-	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
>+	lrc_ts = xe_lrc_ctx_timestamp(lrc);
>+	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
>+	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
>+		lrc->ctx_timestamp = lrc_ts;
>+		goto done;
>+	}
>+
>+	if (lrc_ts == CONTEXT_ACTIVE) {
>+		engine_id = xe_lrc_engine_id(lrc);
>+		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
>+			lrc->ctx_timestamp = reg_ts;
>+
>+		/* read lrc again to ensure context is still active */
>+		lrc_ts = xe_lrc_ctx_timestamp(lrc);
>+	}
>+
>+	/*
>+	 * If context switched out, just use the lrc_ts. Note that this needs to
>+	 * be a separate if condition. Do not convert this to an else block
>+	 * corresponding to the above if.

nit: I'd remove this "Do not convert ..." since it's clear enough lrc_ts
may change inside the if. Anyway, this looks good. With or without that:


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi


>+	 */
>+	if (lrc_ts != CONTEXT_ACTIVE)
>+		lrc->ctx_timestamp = lrc_ts;
>
>+done:
> 	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>
> 	return lrc->ctx_timestamp;
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 513093c2b5d6..a0661ac6b1bc 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -138,6 +138,6 @@ u64 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
>  *
>  * Returns the current LRC timestamp
>  */
>-u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts);
>+u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index cd38586ae989..ae24cf6f8dd9 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -52,7 +52,10 @@ struct xe_lrc {
> 	struct xe_hw_fence_ctx fence_ctx;
>
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>-	u32 ctx_timestamp;
>+	u64 ctx_timestamp;
>+
>+	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
>+	struct xe_bo *bb_per_ctx_bo;
> };
>
> struct xe_lrc_snapshot;
>diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
>index 5c669a0b2180..d525cbee1e34 100644
>--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
>@@ -19,12 +19,12 @@
> #define __dev_name_lrc(lrc)	dev_name(gt_to_xe((lrc)->fence_ctx.gt)->drm.dev)
>
> TRACE_EVENT(xe_lrc_update_timestamp,
>-	    TP_PROTO(struct xe_lrc *lrc, uint32_t old),
>+	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
> 	    TP_ARGS(lrc, old),
> 	    TP_STRUCT__entry(
> 		     __field(struct xe_lrc *, lrc)
>-		     __field(u32, old)
>-		     __field(u32, new)
>+		     __field(u64, old)
>+		     __field(u64, new)
> 		     __string(name, lrc->fence_ctx.name)
> 		     __string(device_id, __dev_name_lrc(lrc))
> 	    ),
>@@ -36,7 +36,7 @@ TRACE_EVENT(xe_lrc_update_timestamp,
> 		   __assign_str(name);
> 		   __assign_str(device_id);
> 		   ),
>-	    TP_printk("lrc=:%p lrc->name=%s old=%u new=%u device_id:%s",
>+	    TP_printk("lrc=:%p lrc->name=%s old=%llu new=%llu device_id:%s",
> 		      __entry->lrc, __get_str(name),
> 		      __entry->old, __entry->new,
> 		      __get_str(device_id))
>-- 
>2.43.0
>
