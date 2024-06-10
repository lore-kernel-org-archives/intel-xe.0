Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE66EC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 13:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEED10E14C;
	Mon, 10 Jun 2024 13:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rrf/s9ih";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C61010E14C
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 13:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718027404; x=1749563404;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7VXbE4MYBtRCmmj5LauBBATzflaDydYwO5DMBGkPlvw=;
 b=Rrf/s9ihmQExuqokiTzGOrmhxb0+t++WobghakKtbmnNwuyt+dhHZ+Pt
 h3Nm8/8WekZcS8IqCOS2ZKWUdUg8UsVq3//fLlmyWrZwmynd3Yubatjoh
 QvfhIe9tkE3fST22fcDukMndWjOYNOZZUijGmLEfpFx9z5AmX0YAhNSYg
 AtxPDeXktgZCem551R5LZapfZRhLvoBnI5pen6aUg3P2Yk38TE9aumyzv
 0S+dQ+P43RoIly5sBrOh6pfOhq6GfewiGbYGYERgLb0u+lF4pO2UQ3i46
 +AQoz4qq2pquEL+Z82+6F7uYSJd+Oxe8Ml8NQUredwbIBIExkNFvZ2Bg7 g==;
X-CSE-ConnectionGUID: kSVsojJ9QRaVncNI7SM+Uw==
X-CSE-MsgGUID: fsP7ZXZARruUxXXGi0pCQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14860394"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14860394"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:50:04 -0700
X-CSE-ConnectionGUID: B0OZGK+SRmGSbolaEi2H2w==
X-CSE-MsgGUID: NODSV7aJTeeY3MdmOP1C5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39619137"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 06:50:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 06:50:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 06:50:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 06:50:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FopX73V3SQxSeRpV8PAKMmj5ULw2OYg2o/uVy6vJNVZUgqsFQDpvg6tgXPkbxDBWtjcqHAOP7MoD0MYCWVtYK/RD3V+Y9HDy6s7Dz6qPq6XuXva3Or9thPZiwA2bjNgbDJTO9AMR0lb2zeOlgOXOabwUkeXsw6oeD/l3D0cOS4JM05tyQ7HuejM1FlY7y2/IUE8fx41glDYbvQkdRZsdMvZrMEq2uaC0EVF+WXRMcZnlMRcKB/qO3RgYv9ini0poRpM/I1BdwadlHAgKcd27klWMmo3dYbXTNw1QyUGJDED2It9iAob4E6DZzME2isw9HahCTYl5eyEtAHE1+sNq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BA8FYK4rmriy39oOkcwEy5e+YoqLNWlWXkcjB/g7OG8=;
 b=niA3s5g4CORr5NeL+MMquJXF0GIUWorHdKEGnJtDlqWYIMwczDdcGf2qujE03yzWxolfvCusK0i7unARop2t53fhe0nIzAFgtU7jO6Ri+6PkP0A/vTLp4lQPq3g2bOGbR25xYFdwwyIMEhV59YXwZKVGgXIbNR1GhrtbwNgyuHzdxYfKm3ltpnAJfojx2RzJNiITfWnIJkKjDrS9fbz6Rgp/pdKSKJye1q1PEsxrXsa94OsrdmX0xltorkGlGxdN0T5HrsSVy0yd2hJPj5JExT758F8CTv4tPQqjwiMZ2pXmmoJw5DgNah4zjhDKw5r1no5m1FyYQnee9Uh7DdANnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4611.namprd11.prod.outlook.com (2603:10b6:5:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 13:50:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 13:50:00 +0000
Date: Mon, 10 Jun 2024 08:49:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/6] drm/xe: Add LRC ctx timestamp support functions
Message-ID: <dloqxdmjpfyppmq57mxjbm3rpviu54uu43nykl2kq64oifc4mz@wa7jy3wqtlgw>
References: <20240608002103.2371696-1-matthew.brost@intel.com>
 <20240608002103.2371696-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240608002103.2371696-2-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:303:b9::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4611:EE_
X-MS-Office365-Filtering-Correlation-Id: d07e1e5c-327f-4976-d4b5-08dc895438da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5luZUJ0XSgud0LW6iXELC12cJBvnxOiv69ZpnO8bkktGp0ZQx7druJWl1Wol?=
 =?us-ascii?Q?7uPrEEl/w2G4SeniBht1ahAASYsy4lWOEDl6Kn2YpNzDM2OIYjVM7qoK3MmR?=
 =?us-ascii?Q?0RS5OuSM467lsXcqRDh1LR487x9NGlKa5N5C038Jx0VeAUhJQMR2o7tvtV8V?=
 =?us-ascii?Q?n5vSzLiXXNzZxzbpU1ZKX/ANfLoa5lXFwhQHmDFWxCBIqKiIyS1rFzd9VwY0?=
 =?us-ascii?Q?WSV67rO4YvvpwAxqOFQIQGJkenjhDrpm3U4MxoyAS5VgWBc0wsw+TDJ1HGW8?=
 =?us-ascii?Q?fGT6tlrn1n6Y6xvrfGtQzj4BnUucVffhizTVTvGWd+QxqWfOEz5YLk3/EPvY?=
 =?us-ascii?Q?P2/47WbEfH4K33V7fNrYjgs0n8n6M9yvOsWlUmjlhEtvXj+i2TiZPc8/+ryR?=
 =?us-ascii?Q?Dzae9TKukLs0TNN1YtbmZshZ8mFWre/edD8p98g3adYWwosd00/yDCqQ0hOS?=
 =?us-ascii?Q?byS8kgiIKQWSY9NgOSW36c4fbfnpFg7m47mq/EKNED1mQyOSsdojd7P3iIF4?=
 =?us-ascii?Q?lu+xQGzuFx2vTLswmODKwtuQ/PBoT5tUZ34l/eR5ViSjHSG41bRmRnd41Qrw?=
 =?us-ascii?Q?zqNl/Cdae7cQK3kRS3YBaGEMoewFwG4u3lkFCgd0Hpmw3mM4r3s28d8FTvD5?=
 =?us-ascii?Q?H6k1wsrheNMhZKmaF5o7t9NOe0t6OaYSPDUuzjESgZs1ZC9OA6fMHY8KCbBq?=
 =?us-ascii?Q?NfNy11L0HwSRfYFOE1Jwj/HTODaSDU6IEZ7uLzsM1mSTUxWrnwbh3TgYPHM3?=
 =?us-ascii?Q?vPLoKFajkaGlp1QqWIZboG568yHHugLxvsFaH2jI9LPbgoSkl8t7YVAb+DfJ?=
 =?us-ascii?Q?gStqpgmipbCDwrjKjmDsrnowM1WNwe/DG/qxExlz9gzAXQKVWxgHUYHbGbWQ?=
 =?us-ascii?Q?QYjh2B6qJr0grpj1ecJSfPSgm0PMSr/JQZjDZMzZDV0WERbBFIHKr47vli+G?=
 =?us-ascii?Q?BrIPQXk6EKlhXSO15ZXi/wNn/yRgygfqHTaoRYr2jXhBXfqI4lBuhLetyqzN?=
 =?us-ascii?Q?/cdq/tXBcnnK9kDo9NBYxXYUhfwoUDjp55JUJnZoxV+YteYVjqHLhxMEqcRa?=
 =?us-ascii?Q?HMvCQhI6dBwKVqPIvd+WdX+pLsQuI+boklQMQbgxo3cAmkdL9qON8vVqWiuW?=
 =?us-ascii?Q?OZIxNLuXzPxkNKIkn2qiW1qYTthWU4MM9AmDkOkq5H8pr5d+1PvudccLJAmV?=
 =?us-ascii?Q?PUdJRcrE1HkC+7VocYYU9Kn8x88exzVFTsXxldYDp5YNHy3RB2dU5BlQysoG?=
 =?us-ascii?Q?HzBnu9/FAGF88lybT1V17s7JKUHq46ryUyjeKAbsD7pDKtSelUao36lqIJM8?=
 =?us-ascii?Q?Vj4Y+ozhZdtHfYZC0oUQFUvl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hUQgbq8VSoFAs5DU/EtW1qn7o8eP/+YvqBkd5riEF3mF96xQEoXE2pax4Zdp?=
 =?us-ascii?Q?juBpQ4fImmDq2/0F8LqmWWDHmPD4gtPNERcGYPEyejBZ4/PJAmDMilU/zoDR?=
 =?us-ascii?Q?skUS0fFZKgqVGQA5AjuXUNeJFg2rK+0Ew2jBvWlDJYaLEs99VrV5whw6Fsgh?=
 =?us-ascii?Q?FctI//ot9S81Sc2Dm3SbOIApGNLdBmWhHIhZcIeqnO+BtJ6J201OCDMSiVI7?=
 =?us-ascii?Q?DLVWcSsENaE9JR63cnhXG2LO8c3ZZ0BdmRtOqz5f0rdRKyxYUrIFYnY7AcJF?=
 =?us-ascii?Q?C6MmLY/wCFX8CyPIp0KuYVgMQiNpHdovoAFFp+z6fID96ID7fCHRx/M/ZX4p?=
 =?us-ascii?Q?xJNnqIhw1v/MDmqb9wFnxajnJ8knnLwzwr5O156WHiZZYENJK/TTm7Ml8Vy3?=
 =?us-ascii?Q?4LCswdN13Is6/1PRcSP57pdiB8yJ2iGrM/jbEWIWW6Hq4O7uhT4tKSRwh1ng?=
 =?us-ascii?Q?Aa5JlatZFAz+aIqtl4kC9Nwvy1BG9/vkd+YE9WuS3aY9Jb//so7/xTsE1Y+n?=
 =?us-ascii?Q?cZEPcCAsIWOdiGmnKgNiomxma6etAOFv8D43w0lSJfDn4cUvfQLDX1aENueP?=
 =?us-ascii?Q?qlExqv3AbjV/ES3TjR20nYA0sK23kKdWG/6DSNdAXerKAC/rIOBJVZUL7+yL?=
 =?us-ascii?Q?ECPmEl4RmF83MOfRDcxpkEcjHMWQhckx6J27BLgMKb9TdRYy1hDoPz3jNBGM?=
 =?us-ascii?Q?mHDDcf+40q5eVnf5yR1ElEEwKIaAdxW/OOmfxKZoDsONN996Wu4tpkNP0qlB?=
 =?us-ascii?Q?XuxxBV0BIxL14WkcGBCio1lMXxcx2B1vKF+aoda2+JzV8+UiMq/d+86B7HLr?=
 =?us-ascii?Q?TMWbVJpv+7jsPdIolPX+WG5XPkvqLssBPTZx97x9DC6ImRaGOaAcZ5y4MGES?=
 =?us-ascii?Q?MsSjWEPxL55Ayv3zDCStAnedu61tYd00nUiJd01qwuQ8MiCthW/nUHTNc5xp?=
 =?us-ascii?Q?U1pXlbnpDROIdguLWvSli4gbK0nIW2oD1+Ga2xDXpV/W195ED8fo4/9U0g5M?=
 =?us-ascii?Q?DYIulNhOYZYVPpIKkInIVDE36PJ1v8DFAyeW5uQX57acQXj+X/tsSRgFEARs?=
 =?us-ascii?Q?LzndyqC1hpH6ZtFZYFQ8+INcR6LQ5GKRHPDAHvvrQsNik7P6GFpB9d4niY3f?=
 =?us-ascii?Q?veTLprtx8+CyRC8xikAkxNQvc+RGnA9yaqmD6UCNQLT+M+5EmDYMGGGofDLZ?=
 =?us-ascii?Q?Wn/qWnW3y9mWghG/YxhY2ArfxfPh3I5aJSonmkd/ydV7Yb5czewAaIc9Z4CO?=
 =?us-ascii?Q?S9B6aBaxx0KqsxqSJ8Ru8uyDAxCz0EuoxlNP//kQMtmF3ecwZcm/WMixSwz4?=
 =?us-ascii?Q?sWvzol9uaCFMzOPFBUgPz55hRP+mhPMyZ48WC70XiVMg4Cpa7SdruqZypQBp?=
 =?us-ascii?Q?0x/CaVvL4+1na2l9A6Awub4CPyYLKvP0I9mPM9ftTgAtAtPofJ9h7pY+9s03?=
 =?us-ascii?Q?I5M0rk/qS6/8yFPYbdivFtJDkTKhqWSjx6Ab70ViN0rHc7oA0jw2rhHMfd/N?=
 =?us-ascii?Q?t6qV+jsCwFW7mnmlQerkwEZm5yAGbuAPuGMXi1lu3zRSG+ao3uBzC7I4zUOF?=
 =?us-ascii?Q?PFSxYf7hNTfWwQdY32kvncSlZMpLkN0YcsVhO2zH6oxj49zilAe4xAA9jmx6?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d07e1e5c-327f-4976-d4b5-08dc895438da
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 13:50:00.6440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+D6IWQTP6Y6B4w6qv83Uq6qmBz6p8oLmnIu7tjSd1slwQJEA8x0uk+CpGeP9Hsq1k3E4E7PIu6iPOJi1RIbL/dYsvnqcoZ/5XyajG+NM1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4611
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

On Fri, Jun 07, 2024 at 05:20:58PM GMT, Matthew Brost wrote:
>LRC ctx timestamp support functions are used to determine how long a job
>has run on the hardware.
>
>v2:
> - Don't use static inlines (Jani)
> - Kernel doc
> - s/ctx_timestamp_job/ctx_job_timestamp
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 66 +++++++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_lrc.h |  5 +++
> 2 files changed, 71 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index c1bb85d2e243..0fef354c6489 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -652,6 +652,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>
> #define LRC_SEQNO_PPHWSP_OFFSET 512
> #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
>+#define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
> #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> #define LRC_PPHWSP_SIZE SZ_4K
>
>@@ -680,6 +681,12 @@ static inline u32 __xe_lrc_start_seqno_offset(struct xe_lrc *lrc)
> 	return xe_lrc_pphwsp_offset(lrc) + LRC_START_SEQNO_PPHWSP_OFFSET;
> }
>
>+static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
>+{
>+	/* The start seqno is stored in the driver-defined portion of PPHWSP */
>+	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
>+}
>+
> static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
> {
> 	/* The parallel is stored in the driver-defined portion of PPHWSP */
>@@ -691,6 +698,11 @@ static inline u32 __xe_lrc_regs_offset(struct xe_lrc *lrc)
> 	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
> }
>
>+static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
>+}
>+
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
> 	/* Indirect ring state page is at the very end of LRC */
>@@ -716,11 +728,65 @@ DECL_MAP_ADDR_HELPERS(pphwsp)
> DECL_MAP_ADDR_HELPERS(seqno)
> DECL_MAP_ADDR_HELPERS(regs)
> DECL_MAP_ADDR_HELPERS(start_seqno)
>+DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
>+DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> DECL_MAP_ADDR_HELPERS(parallel)
> DECL_MAP_ADDR_HELPERS(indirect_ring)
>
> #undef DECL_MAP_ADDR_HELPERS
>
>+/**
>+ * xe_lrc_ctx_timestamp_ggtt_addr() - Get ctx timestamp GGTT address
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: ctx timestamp GGTT address
>+ */
>+u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>+}
>+
>+/**
>+ * xe_lrc_ctx_timestamp_addr() - Read ctx timestamp value
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: ctx timestamp value
>+ */
>+u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>+{
>+	struct xe_device *xe = lrc_to_xe(lrc);
>+	struct iosys_map map;
>+
>+	map = __xe_lrc_ctx_timestamp_map(lrc);
>+	return xe_map_read32(xe, &map);
>+}
>+
>+/**
>+ * xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT address
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: ctx timestamp job GGTT address
>+ */
>+u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
>+}
>+
>+/**
>+ * xe_lrc_ctx_job_timestamp_addr() - Read ctx job timestamp value
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: ctx timestamp job value
>+ */
>+u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc)
>+{
>+	struct xe_device *xe = lrc_to_xe(lrc);
>+	struct iosys_map map;
>+
>+	map = __xe_lrc_ctx_job_timestamp_map(lrc);
>+	return xe_map_read32(xe, &map);
>+}
>+
> u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc)
> {
> 	return __xe_lrc_pphwsp_ggtt_addr(lrc);
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 882c3437ba5c..001af6c79454 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -94,6 +94,11 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
> void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
> void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
>
>+u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
>+u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);

I  think we have some clash here. See the function below where we
read the timestamp and cache it in the LRC. That one does something
slightly different, but apparently the same thing. Why are these
functions not using similar approch with xe_lrc_read_ctx_reg() rather
than defining new helper functions? And why would we return the address
and then having another function to read the value?

Lucas De Marchi

>+u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
>+u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
>+
> /**
>  * xe_lrc_update_timestamp - readout LRC timestamp and update cached value
>  * @lrc: logical ring context for this exec queue
>-- 
>2.34.1
>
