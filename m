Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271A4E6F060
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 14:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CDA10E9E3;
	Fri,  1 Nov 2024 14:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXvMWGlT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFC810E2E6
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 14:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730472052; x=1762008052;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UhzIPmnwfXMvqH2WVOHOvsX0JHg8j458INOFTpcmrXg=;
 b=SXvMWGlTVgt7FNDNNZDRvuW6jKOJWeTphycx99uaOQ1Zn8kP3YcT9dUY
 YFTzZOruz6V14EnhsILYQLd/K7ooAG3MnIJaMJAQcpuETfw4RYDqvS56l
 S85ALTGMSyH5rdDKHi3tv82Or8ScaqfeT/0nI9cHwTFpNAKdSkSFb3ldW
 I+qDXGW/L2egWhrTVOEcXX25ahMw93PX8jBGpXI9tofZBVi942hu9Hd9j
 HCmi0ltc3XxEUCzD3IO1GEoXAitnKVzeWVYWszC1Id1NaP9zLTuBPYYpx
 qBh9HmnzBqM2IqHCnW9paohGAoDX5CAjQ8x8QwAg62L/nKK1UI3Y//B1n w==;
X-CSE-ConnectionGUID: 3inVIitOQ6Cx2DNyTZbblw==
X-CSE-MsgGUID: slc7dnRiQHGoG0Vuac6W6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30423794"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30423794"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 07:40:52 -0700
X-CSE-ConnectionGUID: VYjVGmc6Tf6UMOiFZ1v/8g==
X-CSE-MsgGUID: lmrNPwoDTtmK11vTEOu8XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="83798534"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 07:40:51 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 07:40:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 07:40:51 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 07:40:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQGNmFnS3LrZUgVB/35YhEJ9Z/ZI5wPvPjOnL/wKh+gfN2rMYneUXwfnt4njW2vgLNuc+dUYO3RkIIqmLaprUFRAAIJmNETFZrAKzbI/Q93mc0WArryhUCBVDERIrBmQTWxbfihOqx4FWCa7pX/U6I4aBLgnCX0HSNcr5da3TPYeyBuPAGT7720os5a/9FWu5odOmDNWcGjx+V/v3sw2FGm9lhwdjlF8C60IcwQ50X7sc8nHoyz7tHBk0/Ctrsw4P2TFBrutetUmnlyWZAsPa22IPafmd+csrZWu+tVTz/A8DaWvLb+/sZzoaRPLL+flaVf6HGN+bb//La/VJD+FXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJQcf2T4dnKg+xjbFzjY2nTWeMSrkcpi1GLETvIvcaw=;
 b=mOL7T5ukmJu3n23CxItt0uPicBWZ6hyLln8GeATbLGs67MMeHIUF5qi4isrr4Xu5xQtNHdi3RXMm7+9dzs5TMWMFmQoUgdO6jRkzErVxK16cbvMYD4ZE7BL78egCs+UlQttTICkTWArHoTnLkJuaqh8WxBaoIi6rWTWnS4KgjXAm5ZZ0DlFoswSh5t6SfQvHBliwYLwrk0RKhP9aeKDF6bqyrYWFZ+O+ncVmeTssV8aFstTSN/7fuQl/9PVZAM50HXYNq8HeDa4SwegKoYn1UxkhWop3YBNJB4nhrOI4ECPIOmPbBSMvrbT05TVXwSgbC9QLrdFWiEIS8OLAXuNjhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4910.namprd11.prod.outlook.com (2603:10b6:a03:2d7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 14:40:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 14:40:45 +0000
Date: Fri, 1 Nov 2024 07:41:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Wire up devcoredump in documentation
Message-ID: <ZyTojCiENJyx8su0@lstrano-desk.jf.intel.com>
References: <20241031182916.1441987-1-lucas.demarchi@intel.com>
 <20241031182916.1441987-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241031182916.1441987-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0254.namprd04.prod.outlook.com
 (2603:10b6:303:88::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4910:EE_
X-MS-Office365-Filtering-Correlation-Id: a54a1238-5443-424e-1a18-08dcfa832b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0WnoaabeQm71mUxpukbd0SCPIqXZXLMwPhwuuW7hYkAaDIBmvuPsulrv0hJY?=
 =?us-ascii?Q?NSvDqAC4jaR54Z2DzlbnEhJlxfgeSy81CjC3VVfn8zR+NoA7axHF5rW26qXj?=
 =?us-ascii?Q?c5JG3Ihvy5PseirSbEIZupQ2RMaq5CkIIRFU2HwqsTkn/MmwCG8igKLJSI/a?=
 =?us-ascii?Q?KHo6pAEtfw1PXS0infejeK9aXZzwh3FmceQ9c2IQwi55IHaxEkFgGSMXP1kJ?=
 =?us-ascii?Q?kCxuDuEhW7X3m7AdqNLwjJES92DO55nJw0/8N0k3cuIM/I0A2am1/Fchmg8F?=
 =?us-ascii?Q?bUhx9DHVBKOGG/eehjwP/KpWjrWJw6Q8+BrJhmW1cxm69DYhjFrZUYyWunlh?=
 =?us-ascii?Q?mI5Riequ6HiApBi17CA65dK8kSvSTQpBETnCrmurjTYY2WgpMPcQaWG78fwW?=
 =?us-ascii?Q?1HDOSI3RbdonNSVlaIcKU5Z2buSn7ILzdklZpq1+jjwXtU5F8h5m+KPT7YbS?=
 =?us-ascii?Q?Yq/SyyB9s4vXaDp/AhCnzg/PZlioesNaaaoq0SvmXVDnj9ZgaPxIKpY7a2bg?=
 =?us-ascii?Q?yx00ieV+tA9KyVwHcoVySa1eYnNUdXgboJH9iQrnMPsjXVn1yuV6T8xTzwnm?=
 =?us-ascii?Q?zwBcwHdTH+HYF29W3rFtFTg5kcPDj0jUD8J96qjEQ1oe/YJUxTjU+10BVPCS?=
 =?us-ascii?Q?8iP2tRGXvTkpt0Gty1oHOUbn5+u7DX0Jx6Kbqx7uozmEyGbfoI2DnMfCxwec?=
 =?us-ascii?Q?SmD+nt+2u2YWBtIAS/RmuTw6mRhkSOHrCh9IKvvIa9I1wd7P1ugDhnnCgRSm?=
 =?us-ascii?Q?qeKEVNigyJwlrW9Spc/t/rZ6avLQ+iSMl3yG4asWku0QhSDxcwgbfpPQBA45?=
 =?us-ascii?Q?kitpo4sgSl+v+fh0Oe0GPmfwgDjh7N/DTd2vdU4tt/4A9aJFeGDwolQsJGcR?=
 =?us-ascii?Q?3BX+PPiSJOUxccv2wnKUshlPJ9guWbXmlEwVDNqboNo97ZwnLOy7AU8+3SHu?=
 =?us-ascii?Q?vfNAUXhX2EwtSnxIwll36ZvDM/LmHNrXvAdaAx++er+Wqxvsg25imL0cNFU/?=
 =?us-ascii?Q?TBpv/dXPIq9efmz7MsdMpcxMBnmO+8JjTuQAp3IiFE1eRlZkfbFTrjp7vrKM?=
 =?us-ascii?Q?uURLud0vXVyNq+iPuFq3QvDO1Y+RkxvktUI7aO3UpAGvBBvEUGKsZz0R2tMx?=
 =?us-ascii?Q?T0SCrKDL4jSdHcSOOqyh0hfDd0M0MGwYNxm2Mr2nN7gF3qxPbAOpAR6UOhY1?=
 =?us-ascii?Q?4JiWQtLXCWlLSQdIdVp6YaZrkjRHwm2X+avmIgejU+bfGUNM3AJmvb86yYsc?=
 =?us-ascii?Q?7+ftVaUjj0IBqJjiKTDmceRsF/cK3l3kDTZL9fBkIchH3r4jL0i7WTXBtIWv?=
 =?us-ascii?Q?66ZMypEuiTdyM5kfHoojcrI4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ihb3rTB12bmlRIT6rTnqIEmM4cIdpm9AN5wwiqX96oAW/cTxtWsH4YsULop6?=
 =?us-ascii?Q?BXCXVsxODGWc6WBB31PE2AkUVCzWL5mORCO2/zGg2fX31mBvhzvCrOzT0o1h?=
 =?us-ascii?Q?m9wKwMwEG1XqhPHoQkbiH+8dbMNisPVOxIHca5wJVdSrxF/EEKvZOEWFA8Zz?=
 =?us-ascii?Q?tsC8UmC5FVi4EzY+4w2TWyOPTiHOGaXJidNXMqne2DQPxhPuSp7MS4kRdlAd?=
 =?us-ascii?Q?RYbTwY7DpuP42xQvVqGTHUBW5y8kDN6JAm84nlB9PDKTCXiUI7B+XNqYZJO6?=
 =?us-ascii?Q?etaZjw4OzHg6ZIwWYMqDfJhvsZnSkIhB2Q1HltFHERMsQ9PtBvDkJZyCmCMy?=
 =?us-ascii?Q?eGzVns6mGEyyzmD0KyfROVWcyhWePNCYxKJ6Gql54MiRIJuLFlet75aTB5u/?=
 =?us-ascii?Q?KgIfglpVzf5TNBbhJmTmaGLNqECUy1Ps35Ye5SXZpceBqOJqwNlT7PX5qcj6?=
 =?us-ascii?Q?V4fqfXH9YHfcmC2Z8Vc3Pii2S3ODwbT9HTe06lGAve0ze3bLDvT5Cd2ag8Vw?=
 =?us-ascii?Q?xa8xJUNQ3j6/311nesgqQZJQoMgIiJOUeoM1q0/J1b+k7p+Kny9OtyZYaQpx?=
 =?us-ascii?Q?EogGgo6qidc85y8TZXf5Qv3lYFW1beDkt8CF633yPQGGM9HNTFlkKKf0AAi+?=
 =?us-ascii?Q?sWb5DVNL860Qj26l70ZReXqikTq2U/RJijuXHmtoUutFka/4/+MCRBjUW8f+?=
 =?us-ascii?Q?YQBXMBMqNiKWXScswqpTiE/KJNk1hDWIccq95JJB4o9wNwfSfiZq0LUIZpm1?=
 =?us-ascii?Q?jpxb9GlZLxBm7GuDYDrPLfnYEtEPgW7+KPk2GDDzD/9XfgW1NDZ70EMxQIz+?=
 =?us-ascii?Q?VLCdj/++vewtcLOH9CHVShOxmzYGDqGj8Lhm16I3vW0i0l/pRgP4OFohxJUE?=
 =?us-ascii?Q?u2QxG+cVTmtzjqH+tpBPKG7gpLwzIedBNBH99Z7Zv5stTTT7NZ7Psfjw/fn6?=
 =?us-ascii?Q?Fjq1ewWlGdOxDFtjxq42Ufu+9EIdwwWNYBHhcGxmtUEHCMHTN+lJYBtq7vnb?=
 =?us-ascii?Q?/kouaj9ibQSopvYd6Ji4N6eWFv9uj3KTXsxAGLkJCFwSpDVtUHIX+7yViK4V?=
 =?us-ascii?Q?Gg3lJiZ/GI16bxAy163QX4F4rehYsA4UDnZtSATLX8GmN8S40Lv8F7P3MjDp?=
 =?us-ascii?Q?3Iep26NWHy6jVn2/2L+hSJ7eOPxHCumiW4BVHsIgzf/XqOOdBcj1nRmLcp88?=
 =?us-ascii?Q?kPaQRGpXioKBtcqE0rgBlH5HIayylCtR3c2M9v3Ruekhxe/oPIpfqROQrMu9?=
 =?us-ascii?Q?OFmvJK+K5LabYebyS3G2v6rdknoVqEhlKEMaHbDBFg9Uivs2r3OGmgBkh4jM?=
 =?us-ascii?Q?NSDV7GaQAgKXsern7o50yGrftGNEf89cqgd9o0WN8S9gN544uAvp9uGgigor?=
 =?us-ascii?Q?65nScXB520QJGC1OpvqEcnxCkklD49P9JkxJ12H//KECBa9tvKDi7/mUH6Yg?=
 =?us-ascii?Q?FkYAu1rVF9D57E6qViB3+JQKBnN2ZqOLjXHZ7lk+KwZUEv5TQQywD5a1Ur9F?=
 =?us-ascii?Q?CPDxhUmnSeckDlGo0NmoCAn6oV3yaS61bmyIgnIgXwle3fVQ3zjR59zwEex1?=
 =?us-ascii?Q?m8eIWNVgnRJ3imAhGviApi0+Y7jCVOp8efURr+ODUkgc8OgUTa1QrdPaJWtp?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a54a1238-5443-424e-1a18-08dcfa832b77
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 14:40:45.8624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9D8nogptjVeHGcwdW0TQbvQxAbU4qnbRC/G7pAuG/BELO5wdPRYP0OdjKqF87Z4KtsLxiTaV+ypsPTA3unpOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4910
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

On Thu, Oct 31, 2024 at 11:29:16AM -0700, Lucas De Marchi wrote:
> Add a documentation page to detail the device coredump as implemented by
> xe - it was documented in the source code, but not visible in the
> rendered (html) documentation.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  Documentation/gpu/xe/index.rst          |  1 +
>  Documentation/gpu/xe/xe_devcoredump.rst | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_devcoredump.rst
> 
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 3f07aa3b54325..92cfb25e64d32 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -23,4 +23,5 @@ DG2, etc is provided to prototype the driver.
>     xe_firmware
>     xe_tile
>     xe_debugging
> +   xe_devcoredump
>     xe-drm-usage-stats.rst
> diff --git a/Documentation/gpu/xe/xe_devcoredump.rst b/Documentation/gpu/xe/xe_devcoredump.rst
> new file mode 100644
> index 0000000000000..ae4ec0e34dc01
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_devcoredump.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +==================
> +Xe Device Coredump
> +==================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_devcoredump.c
> +   :doc: Xe device coredump
> +
> +Internal API
> +============
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_devcoredump.c
> +   :internal:
> -- 
> 2.47.0
> 
