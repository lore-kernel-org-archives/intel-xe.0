Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D347C44501
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 21:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E3C10E250;
	Wed, 15 Jul 2026 21:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/E3lcMy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31DB10E250
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 21:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784150862; x=1815686862;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LLiy1v5lEV+/SSiD0DI9FXeUVaa/aGyeszTcvynrV9Q=;
 b=c/E3lcMy9+oaqRgxsa+vB5IGb6W8p81FiXOOXQakG5QagoPu/zbrnKjB
 WvvmVtPeasYQMygDUUiffNfJVeRzYsWc71+ZFMgd9OKFBMGdql6QRhuq0
 vspRCh7MiaSdbZMs+Ru7e+IXqm3TLESM9EY9SbaVWjw4+gwCYTpU5FIlx
 DmFS34Rsc14nGNA5NtE9/JbM9gO3lPICQaYNO9/0WaFYmFsLacd3jGyVH
 sCcnHwgR3oM9/h/NHVSBe1D4n6gpZQgT0vmu48crgVbqGvkRkpZe6LAES
 xkqOuQ0yYuTgwC1NJxiaq/k443B/OhBjeyuoHL5yXFDB98gS5yOc+xhC+ g==;
X-CSE-ConnectionGUID: /7qlqgBZSKi0leJOdSDmXw==
X-CSE-MsgGUID: GM8MA3THSumR+bv+MMNAeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96171746"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="96171746"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 14:27:42 -0700
X-CSE-ConnectionGUID: 37pf99o3Rzyo/ZMtKkp9LA==
X-CSE-MsgGUID: v8i65OtRTey06zvOQXMHJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="294526771"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 14:27:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 14:27:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 14:27:41 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 14:27:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1tDLsDio+5NUIlMUJ3y3IiQ/C/ejeq/9ui1pqrZ8/6+dahAEvpXwV5chys2dYsGjBxySCbDd4PyuuKDvZ2a81zhojvbl++/FYg0abL5AIIhSmHPvzsp22ClwKT4euApvoNArEa1dA8Ec7KFx9Yno+xTrqJHd/i0zDIOxxJNiZZ0PmnM8u8ee7obw42c+508IdjITjx/jGBr0R9QGX1xKttd6FCoqkoXrZShlGfC4lQ394RAzvIn46DQntR/3aeuXi7el+SgsnhxzLhJg/arQy+JnshsucCd4U99K8GjSouCMROLMIGKbcNxpQNR9VRNdzOAgL8FKbz9gzw/BWs3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7BN5EXXEM7+N7GYoXjc5Ox0OIIDUsbK7zaenMhldD4=;
 b=rmSVnE/g6IDQZ6x+BS2b9yo+XySDrMxbbAOgFyXLXmwHNwoMF5J7pJ+1TLJDfnbWXwVreY9QILzFJXc+TiT4pWSgYLrRKeB4yQaZGbeb2ldmC1w5BovWR9yU+8c5g+JDGyrjWnHmi3tiizDve+SMZ3ML0jBT4PY2md/LXuoDzMPWpQFR/Yc666RWqO0FJsB1D5J5F1ocGr20GqIS+ctW1/6tWwGZdUmyx6Evlap0yRyJQeCfoFXB8iutPUM4teQRvosB/uDxS2tRwvXbcBIxF8o761XSqSwO+ugn7gWER7lqJm3AbR0LJcMArTzK4Vfsr0ssQzFp+pfHq7OR3CHiQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 21:27:36 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 21:27:36 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Varun Gupta <varun.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH v7] drm/xe: Add debugfs knob to control GPGPU preemption
 granularity
In-Reply-To: <20260714115926.3038446-1-varun.gupta@intel.com>
References: <20260618042421.483657-1-varun.gupta@intel.com>
 <20260714115926.3038446-1-varun.gupta@intel.com>
Date: Wed, 15 Jul 2026 18:27:31 -0300
Message-ID: <87ech46j0c.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::27) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ2PR11MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 90664e3d-d1cf-496b-3190-08dee2b7e3ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|3023799007|18092099006|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: 5enFlcWpwwAtC5r5Knlo9MXhQPnYoUXMkh/OZ59pairIqQWRvPR536j1nq1kIUWM25WUojjUs9a4IZ0msqKoG5khmz6TYg4tbZPFuCyQAmEz/I3In2dmT1560F5HLTY+fLbsfzUBIZIrytpsvfVxEBiDaEbstn2TOW7IPXsHYQMSUX0mTxpXQJC8xh0ROtG/VH6+QzoeBzgNkGfln3B+R4hqWJxa4hrDzGJVP9KR57FjGYS6Gx7wYBqqcBEyeprcerw8e34qDHwmbGegpdpaK8MgWLYAfFksqwfOkFdVMUK00D233xIrmPOr+RAXUkNYEI2cAJbTGbZJKO720M7I5tUOkTC88TNNXuWh7aXtcDSr/d3qLxBVIWHz2Jep4jfpE6oW2F9vYWN0cw9ymPSEqbD/KswluSVlaGk6nFfAfk8CFJoGAOGpLXlU5J3QQPV6vZBzRK40VjaUL2kcYh0iZ98JC7YM1Ir3YFJmlF1MbnJNM9eye714NcBbaVv9fhF/m15CKO84eVYOr+NR3Mso9bqPki/Y2It11bjV1gFcHHjuwysC4BLPvg07hfhkMBucuSsb+XdFb6oDG19Xr5MefW0li4Qw9B9t9FTN0ZZmZ5vWtbTPpSUQsDvRQKCtwBzND59i3agmmTuQN0/fAOo/rWI7ulGr1F/F+Q9ZBpUOOcI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(3023799007)(18092099006)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CCjOe7hlmKYt5t1QoDfJMB/SQTrxxQd+UgoVasVh9UEfrV87G9qCr+L9SxFw?=
 =?us-ascii?Q?LtHutQCvMm/Dqb1mBrkm8BkDZJ9/rwOcYmSvA+SwFQi8KnPJJV7q9Gqkb8n2?=
 =?us-ascii?Q?fMfpj0wpIr4pSirLmzIX28FHXM0VjXHYCRGQKOfL29cNGQj2sYNZZhMrjcqT?=
 =?us-ascii?Q?YT/G47zlC1V9kHBc6PGCabQ7dSg3+6U0VolS0QH15FRf0gPpOh/G3vlQyO/m?=
 =?us-ascii?Q?SDeHoXnyx8Y2BvlAPkfrP1BnftdZiEY73pQU2f3iionkGKMQiE6/o5l6nYrb?=
 =?us-ascii?Q?p6E76FH+dhbqqcmRtj6WiRX2E2hYKMMrPaghZfjQ0jJY/amooItOrUhnkHW2?=
 =?us-ascii?Q?h1G39UbDoqQuGoklJr4EQlQD/d7Lsa58zzeZtZI4YYCFjoO5HlpGscr1iN5h?=
 =?us-ascii?Q?f3cBKkpErtIhdGdUQnkkYeKk5mkfuHd1ZqSEzpVNKzZ/XufCRJ7YSqS7A43J?=
 =?us-ascii?Q?k+EXmEjBA6Bz793tQ703I1u16sQNSIJgAdTgV56yl/GA4Fn3VwRNVcX2o1kz?=
 =?us-ascii?Q?UOmVTTvggqKoHt8fAzOVhnYQcH+MWuf5Or+p5GN6VhQ3WdmSIo8IiJS3ZtJP?=
 =?us-ascii?Q?7+J7FpexGkfzGoMPwbpwjAIPwim99Y2Y4h7OsEc95/cGkQI/Yi8xAHZ21kud?=
 =?us-ascii?Q?8lWh7R9zPUmJEQ9WLfUE0IOw4+na9BA2xKzzgGbUDk5I9mg2x6D0tdbq09Py?=
 =?us-ascii?Q?ppsiAULSc0fMKnwEcJCld2hEeZNlipKXF+lqGE0Cedr1T8IcU+zdtkpd4v7s?=
 =?us-ascii?Q?Id2Kz1LmA77xNjVoNLJs3D99wZUwNDjhZ2uADr7velBuiuKoPEdgYOYLhNzi?=
 =?us-ascii?Q?b0mjmQobqUyf4sBUUAqzq+FwyNax9HVfLV/saSfP/IOjOFVF4CTCgLSgAsN/?=
 =?us-ascii?Q?83z74h0m024Iyil+mBzuD28KN9zrEtcI9hVbgB/OzTwZlM4YxUJ72kcOV9T3?=
 =?us-ascii?Q?YOaiuvOwVLfz6A4cfuY2irsq1tKmuZlwWAHQNzaMZWemWLiHVcrZZm8vnf02?=
 =?us-ascii?Q?PlwGeY+mTEYh8+UQ5OjEYdFmpgrLPrcmniFoBP3LEOtocPpKwzcz/bhQlZ/E?=
 =?us-ascii?Q?bG1AnS/X9hShixxnQSaJ0ggqGgwog83xuRLkTiipWgqyvqmQUxqXgHgCNffc?=
 =?us-ascii?Q?Ov8bjGT3f3YcVd++E1kK7n65QfgeYcCQ3TfWv3IN6dctKXWhe60/Ejf90XqL?=
 =?us-ascii?Q?f9J6FWtnd0oFFF5jWG3hQ+RfpNfwEAQaHpDqEEYLagj345iBdEbVC1zwaT/s?=
 =?us-ascii?Q?m7BXDD9Iuie/rQQC70b2mUxxLO6CR8Fu5NGkOb8K1Cq6jlw3EPLdKe3J864Q?=
 =?us-ascii?Q?Q/iset3ixpEkHO1c6kCbhUqQJDX3+apT0lEuhW8kEBUeJpEnBnS0qiiwynrD?=
 =?us-ascii?Q?+FEvn08fq9smlayO6tFpk3k6uU3bFrJobdAQSRjVDSqUg3cvA1XIRwU+M9ge?=
 =?us-ascii?Q?JRCSWP+iWzL18oJfHPS3AGB+PfWwibbJM1NdEweSY61QIWiz1w0YIA7tKLLJ?=
 =?us-ascii?Q?5ZIzy3Vwytp9OKKTbPYhEG9RWKMts5WG+dnmR6Bnu7mFOixjADHYXRMmL4Fd?=
 =?us-ascii?Q?IXoYcvnJc1hvPBYvgDUOz4j5zOwvw6rxG9wUjw2fOfURr4+sj38HBqZyB/Zw?=
 =?us-ascii?Q?tkIRJZiTAnfuxjkzIqUVgIo8J3ycgNin9N0ww8OHy48TvLDfjORwEokEo9LJ?=
 =?us-ascii?Q?+v4cImFpHBbbGB7/IlOE4hVlTNDxdhdJaTnx5YWkaxPW/9KzMPurRPkb+jJT?=
 =?us-ascii?Q?+Yx1r62cFA=3D=3D?=
X-Exchange-RoutingPolicyChecked: PBPI5gge11AFerS5EdA5KfJ/EnlEl5oHiqeyv+tW94ZDqQlmVW9EOdLa3PIk6rEQSl6ffQQbVvOwjJEqcYJPQo8kGdDIwpQAsO/g6IxsHQg7Upp8vU+ULemzEntIYvCOFaHftITUKvOFAPWfEql77DhpPUa6W0OSOlG/fnrfBnCDXLXpqWF2ioa60eDoqVGtGLwsRMO9yOV57wivvll1YlAHGvv5B9jJOoLby6iEBzKf9LRRCbBwuTBz0c/7m7m1ZK3PxXjJOzPOPAUefv+ytnFUaU3grOyiUo0yIt1gvuXAEWyxmCxMZKkV3DHr95wNOqO4seUopFcwd7IsF1icOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90664e3d-d1cf-496b-3190-08dee2b7e3ce
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 21:27:36.7333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41bEsTVNB/ouyx6R3WU0NdqeVnG+Zw8troNp2n6BTSRp90oTVQ0wSDtnKE7Cc2Z+SIWQOlrUsanN4NOJRJmusw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8568
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

Varun Gupta <varun.gupta@intel.com> writes:

> Introduce a per-GT debugfs knob, 'gpgpu_preemption_level', to allow
> overriding the GPGPU preemption level on a per-context basis for newly
> created LRCs.
> Add an RTP rule to enable per-context control via FF_SLICE_CS_CHICKEN1,
> allowing the preemption level to be programmed directly into the LRC
> image at CTX_CS_CHICKEN1 during context initialization.
>
> v7:
>   - Restrict XEHP_FUSE4 read to Xe2+ primary GTs to prevent invalid
>     Media GT accesses and SR-IOV warnings. (Sashiko)
>
> v6:
>   - Add missing xe_gt_printk.h include to fix compilation failure.
>
> v5:
>   - Use correct offset for CTX_CS_CHICKEN1. (Matt)
>   - Restrict to the RCS engine. (Matt)
>   - Drop LRC layout table modifications; dummy layouts do not need late
>     context registers. (Matt)
>   - Stash WMTP fuse state at boot to remove pm/forcewake from debugfs.
>     (Matt)
>   - Rename debugfs knob to 'gpgpu_preemption_level'. (Matt)
>   - Use simple_write_to_buffer() and remove unnecessary READ_ONCE/
>     WRITE_ONCE macros. (Matt)
>   - Do not restrict debugfs visibility for SR-IOV VFs. (Matt)
>
> v4
>   - Fix incorrect NOP padding in the RCS context layout. (Sashiko)
>
> v3:
>   - Wrapped XEHP_FUSE4 forcewake read with xe_pm_runtime_get/put to
>     prevent PCIe aborts/timeouts when the GPU is in D3hot/D3cold. (sashiko)
>   - Fixed NOP macro truncation by splitting padding offsets larger than
>     0x7f into multiple NOPs, ensuring correct context layout. (sashiko)
>   - Converted CTX_CS_CHICKEN1 initialization to a read-modify-write
>     sequence to avoid overwriting golden context mask bits. (sashiko)
>   - Removed the FF_SLICE_CS_CHICKEN1 workaround for CCS engines, as
>     compute engines lack this 3D fixed-function register, which was
>     causing GuC "illegal register" panics on initialization.
>
> v2:
>   - Dropped the WA BB/MI_LRI path; per Bspec, CS_CHICKEN1 is context
>     save/restore state at DW 0x00E2, so we map CTX_CS_CHICKEN1 and program
>     it directly in LRC init via xe_lrc_write_ctx_reg(). (Matt)
>   - Split Xe2 CCS context offsets into a dedicated xe2_ccs_offsets array
>     to map CS_CHICKEN1 without polluting other XCS engines.
>   - Converted the debugfs interface from a binary boolean to a
>     multi-option string knob ("default", "mid-thread", "thread-group",
>     "command"). (Gustavo)
>   - Restricted file creation to the Physical Function
>     (!IS_SRIOV_VF). (Gustavo)
>   - Added kernel tainting (TAINT_USER) when deviating from
>     defaults. (Gustavo)
>   - Added power-safe hardware fuse check (FUSE4 register 0x9114[20],
>     CFEG_WMTP_DISABLE) before allowing MTP selection. (Matt)
>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  2 +
>  drivers/gpu/drm/xe/xe_gt.c              |  5 ++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c      | 65 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h        | 34 +++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.c             | 29 +++++++++++
>  drivers/gpu/drm/xe/xe_wa.c              |  6 +++
>  6 files changed, 141 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 4ab86fc369fd..6f7abc0181b5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -37,6 +37,8 @@
>  #define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
>  #define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
>  
> +#define CTX_CS_CHICKEN1			(0x12e + 1)
> +
>  #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
>  #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
>  #define INDIRECT_CTX_RING_START		(0x06 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 783eb6d631b5..688cadb9b589 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -607,6 +607,11 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>  	 * on pre-MTL platforms, reading it there will (correctly) return 0.
>  	 */
>  	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);

Nitpick: Maybe add a blank line here to dissociate initialization of
has_wmtp_disabled from the comment about GMD_ID above.

> +	if (GRAPHICS_VER(gt_to_xe(gt)) >= 20 && xe_gt_is_main_type(gt))
> +		gt->info.has_wmtp_disabled = !!(xe_mmio_read32(&gt->mmio, XEHP_FUSE4) &
> +			CFEG_WMTP_DISABLE);

I think Matt's suggestion was to stash the value of XEHP_FUSE4 and use
it whenever necessary (there are other users).  But I guess keeping a
has_wmtp_disabled member like done in this patch is fine as well.  We
could do the former in a separate patch if we find it useful (we would
need to check if we would need to deal with other fuse registers as
well).

> +	else
> +		gt->info.has_wmtp_disabled = 0;
>  
>  	/*
>  	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c38bcacb27e4..288590003461 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -6,6 +6,8 @@
>  #include "xe_gt_debugfs.h"
>  
>  #include <linux/debugfs.h>
> +#include <linux/panic.h>
> +#include <linux/string.h>
>  
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_managed.h>
> @@ -15,6 +17,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_sriov_pf_debugfs.h"
>  #include "xe_gt_sriov_vf_debugfs.h"
>  #include "xe_gt_stats.h"
> @@ -336,6 +339,65 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>  
> +static const char * const gpgpu_preemption_level_names[] = {
> +	[XE_GPGPU_PREEMPT_DEFAULT]      = "default",
> +	[XE_GPGPU_PREEMPT_MID_THREAD]   = "mid-thread",
> +	[XE_GPGPU_PREEMPT_THREAD_GROUP] = "thread-group",
> +	[XE_GPGPU_PREEMPT_COMMAND]      = "command",
> +};
> +
> +static int gpgpu_preemption_level_show(struct seq_file *m, void *unused)
> +{
> +	struct xe_gt *gt = m->private;
> +
> +	seq_printf(m, "%s\n", gpgpu_preemption_level_names[gt->gpgpu_preemption_level]);
> +
> +	return 0;
> +}
> +
> +static ssize_t gpgpu_preemption_level_write(struct file *file,
> +					    const char __user *ubuf,
> +					    size_t len, loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	struct xe_gt *gt = m->private;
> +	enum xe_gpgpu_preempt_level new_level;
> +	char buf[16];
> +	ssize_t copied;
> +	int idx;
> +
> +	if (*offp)
> +		return -EINVAL;
> +
> +	copied = simple_write_to_buffer(buf, sizeof(buf) - 1, offp, ubuf, len);
> +	if (copied < 0)
> +		return copied;
> +
> +	buf[copied] = '\0';
> +	idx = sysfs_match_string(gpgpu_preemption_level_names, strim(buf));
> +	if (idx < 0)
> +		return idx;
> +
> +	new_level = (enum xe_gpgpu_preempt_level)idx;
> +
> +	if (new_level == XE_GPGPU_PREEMPT_MID_THREAD && gt->info.has_wmtp_disabled) {
> +		xe_gt_warn(gt, "MTP fused off in hardware, cannot select mid-thread\n");
> +		return -EPERM;

I think we should just return -EINVAL here as well with the rationale
that "mid-thread" is an invalid value for the current hardware.

> +	}
> +
> +	if (new_level != XE_GPGPU_PREEMPT_DEFAULT) {
> +		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> +		xe_gt_notice(gt,
> +			     "GPGPU preemption overridden to '%s' (applies to new LRCs only)\n",
> +			     gpgpu_preemption_level_names[new_level]);
> +	}
> +
> +	gt->gpgpu_preemption_level = new_level;
> +
> +	return copied;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(gpgpu_preemption_level);
> +
>  void xe_gt_debugfs_register(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -368,6 +430,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
>  	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>  	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);

Nitpick: Maybe add an blank line here.

> +	if (GRAPHICS_VER(xe) >= 20 && (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK))
> +		debugfs_create_file("gpgpu_preemption_level", 0600, root,
> +				    gt, &gpgpu_preemption_level_fops);
>  
>  	drm_debugfs_create_files(vf_safe_debugfs_list,
>  				 ARRAY_SIZE(vf_safe_debugfs_list),
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index e5588c88800a..97bd943309b3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -35,6 +35,33 @@ enum xe_gt_eu_type {
>  	XE_GT_EU_TYPE_SIMD16,
>  };
>  
> +/**
> + * enum xe_gpgpu_preempt_level - Per-context GPGPU preemption override mode
> + *
> + * Selects the preemption granularity programmed into CS_CHICKEN1[2:1] for
> + * newly created Xe2+ RCS LRCs.
> + *
> + * The per-context override is effective only when
> + * FF_SLICE_CS_CHICKEN1[FFSC_PERCTX_PREEMPT_CTRL] is enabled via RTP.
> + *
> + * This setting is GT-scoped and affects only LRCs created after the value is
> + * changed; existing contexts keep their previously programmed value.
> + *
> + * @XE_GPGPU_PREEMPT_DEFAULT: Keep platform default preemption granularity.
> + * @XE_GPGPU_PREEMPT_MID_THREAD: Force mid-thread preemption level.
> + * @XE_GPGPU_PREEMPT_THREAD_GROUP: Force thread-group preemption level.
> + * @XE_GPGPU_PREEMPT_COMMAND: Force command-level preemption.
> + *
> + * Zero-initialized via kzalloc, so XE_GPGPU_PREEMPT_DEFAULT is the safe
> + * default (no override from platform policy).
> + */
> +enum xe_gpgpu_preempt_level {
> +	XE_GPGPU_PREEMPT_DEFAULT = 0,
> +	XE_GPGPU_PREEMPT_MID_THREAD,
> +	XE_GPGPU_PREEMPT_THREAD_GROUP,
> +	XE_GPGPU_PREEMPT_COMMAND,
> +};
> +
>  #define XE_MAX_DSS_FUSE_REGS		4
>  #define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_REGS		1
> @@ -151,6 +178,8 @@ struct xe_gt {
>  		 * feature.
>  		 */
>  		u8 has_xe2_blt_instructions:1;
> +		/** @info.has_wmtp_disabled: hardware fuse indicates WMTP is disabled */
> +		u8 has_wmtp_disabled:1;
>  		/**
>  		 * @info.num_geometry_xecore_fuse_regs: Number of 32b-bit fuse
>  		 * registers the geometry XeCore mask spans.
> @@ -219,6 +248,11 @@ struct xe_gt {
>  	 */
>  	u32 ccs_mode;
>  
> +	/**
> +	 * @gpgpu_preemption_level: per-GT GPGPU preemption granularity override.
> +	 */
> +	enum xe_gpgpu_preempt_level gpgpu_preemption_level;
> +
>  	/** @usm: unified shared memory state */
>  	struct {
>  		/**
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 3e7c995085d0..1733bbe65288 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1589,6 +1589,35 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
>  	if (xe->info.has_asid && vm)
>  		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
>  
> +	if (GRAPHICS_VER(xe) >= 20 && hwe->class == XE_ENGINE_CLASS_RENDER) {
> +		enum xe_gpgpu_preempt_level level = gt->gpgpu_preemption_level;
> +
> +		if (level != XE_GPGPU_PREEMPT_DEFAULT) {
> +			u32 level_bits;
> +			u32 val;
> +
> +			switch (level) {
> +			case XE_GPGPU_PREEMPT_MID_THREAD:
> +				level_bits = PREEMPT_GPGPU_MID_THREAD_LEVEL;
> +				break;
> +			case XE_GPGPU_PREEMPT_THREAD_GROUP:
> +				level_bits = PREEMPT_GPGPU_THREAD_GROUP_LEVEL;
> +				break;
> +			case XE_GPGPU_PREEMPT_COMMAND:
> +				level_bits = PREEMPT_GPGPU_COMMAND_LEVEL;
> +				break;
> +			default:
> +				level_bits = 0;

If we find an unexpected value, it is probably better to have a warning
(e.g. XE_WARN_ON(true))and avoid programming CS_CHICKEN1.

> +				break;
> +			}
> +
> +			val = xe_lrc_read_ctx_reg(lrc, CTX_CS_CHICKEN1);
> +			val &= ~PREEMPT_GPGPU_LEVEL_MASK;
> +			val |= REG_MASKED_FIELD(PREEMPT_GPGPU_LEVEL_MASK, level_bits);
> +			xe_lrc_write_ctx_reg(lrc, CTX_CS_CHICKEN1, val);
> +		}
> +	}
> +

It would be good to encapsulate this into a function, say
xe_lrc_set_gpgpu_preemption_level(), that is called here. It improves
readability and can also simplify the above logic with some early
returns.

>  	lrc->desc = LRC_VALID;
>  	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
>  	/* TODO: Priority */
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 139434946f8f..70072963aba0 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -347,6 +347,12 @@ static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
>  	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1(RENDER_RING_BASE),
>  			     FFSC_PERCTX_PREEMPT_CTRL))
>  	},
> +	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl-Xe2"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1(RENDER_RING_BASE),
> +			     FFSC_PERCTX_PREEMPT_CTRL))
> +	},

We could re-use the "FtrPerCtxtPreemptionGranularityControl" entry by
combining the rules with an "OR":

XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER), OR,
             GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED), ENGINE_CLASS(RENDER))

That said, we are unconditionally changing a hardware default here only
for the sake of having the gpgpu_preemption_level debugfs entry, which
will only be used for debugging scenarios.

I wonder if we should change FFSC_PERCTX_PREEMPT_CTRL only if needed.
Thoughts?

In that case, we could do that via configfs and then this entry would
use FIELD_SET_FUNC() to defined based on the configured value (and the
debugfs entry would also be created conditioned on the configured
value).  In this case, it would make sense to keep this a separate RTP
entry.

Other option would be to try to make the change of
FFSC_PERCTX_PREEMPT_CTRL at runtime at the right places if
gpgpu_preemption_level is set to a non-default value, but I think this
approach is more complex and perhaps the configfs option would be easier
to implement.

--
Gustavo Sousa

>  	{ XE_RTP_NAME("18032247524"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> -- 
> 2.43.0
