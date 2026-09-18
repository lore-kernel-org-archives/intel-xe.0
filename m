Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A097C982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 12:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A075910F34E;
	Fri, 18 Sep 2026 12:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZApBYpQH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF15C10E89E
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 12:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789735878; x=1821271878;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SsKumNtSGT3+4NW1y/jvsrpz3PrGPs7T9fL1z6th9eA=;
 b=ZApBYpQHYnIITfjSPWXySnu5654OMtm8VB1uE+ysBJbIXHpLmOScfrRO
 v+LrFoDbUZQh93d6Tn4ztbOaiKH8/U806BYCmUU+MrNKP5MPRrshmD7mg
 QhTr9n5T7CWUTE0QWHdkwll3NPW8H+vfOW/IsbN652bEfyFn1z0ePbyYC
 dDg+uCFcKk5CV8GIsoaguiR+RHt83ndtV2zB/r7lzD5m3u1EH09n0OM+n
 iygl7WBtr/O+dKjVn6pQIZMywu6YEemMJ+48JueHJC+GhW6wQHyS7TrWX
 AltDAfTUYD1CoUIBNId7NyDyHiIzCsuRQIG5tA/dlgodHlJrKpWERqqTf Q==;
X-CSE-ConnectionGUID: tn2xUoE5TCmWRotcdFWdUw==
X-CSE-MsgGUID: eVgjCvsFRfyX5sM66FNILw==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="753745"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="753745"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 05:51:18 -0700
X-CSE-ConnectionGUID: NsYhmph8T1iTsX0FHJIPPg==
X-CSE-MsgGUID: jwfHDeBXRmWmjn8eLbVPLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; d="scan'208";a="270086094"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 05:51:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 05:51:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 05:51:15 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 05:51:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqwvA0SnWIFGAdAnMCxDsyEKLCfdwtxZjzw6eTVq/viUEmjP3sVwPXOjas/eWmrSd8/9BRDbqCy2dUOb7r2XogxDTK0Tn2UxSGYTkT+Hol6WHvKL4FoiDKHAAULIx3WOm8Yt1iRwrddVU16j2l/LjC0ni82Dh+2yAOj9TvVfQH5hpyUAQ4yFjTGOFl3eIEEzW6appkjNdsSzD+DBdIAoTp2YVS4HDtRYODUflkFNZcWBzmHntoesbx8HWxqqvpWqhqHZy55aIW9rz1EC0YpoB4MGLMND5Czte/a6/RY4GltlxA+Wt4/ZBGIPKmiAva8EyaPAaI7DmQ2o4nwVPKAaOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MejWZZJzkNLND0wiTGNvY9GfBePprAGfV2Mbo0IaEGw=;
 b=iSUUvE8KknNvDpER4iyCtff3o5jR8Na266lwkbq0D7ykPvlJ8SdCbpU3aubFfJP2IWNEEuPuvIw2+KjUKcPRdCxduo6em4yOA3K8QIrA15vhPxQYkjg19fqFYaUDMrBXyVAHV+ZMTok5+LPcygwre0k1lrugQrssTvgpiUF9ynMEHs5lCheTtishKBpwO1USfNo84mEkgw8OGrpV8v8KIBOPSYdV0l8ODKeWqBbO/eEZg9VWOfXHHA4snU86TQsPASEwdPhaGvr7+MqDipusVElqklc0DKSsi0xwPW/hdMp6UAVx5T8DTDyp7nrGQzxiRek7+DZgudtCdnOXhvqqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.16; Fri, 18 Sep
 2026 12:51:10 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 12:51:09 +0000
Date: Fri, 18 Sep 2026 08:50:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Consolidate semaphore instruction definitions
Message-ID: <aq0zsqJp5g5uqO94@intel.com>
References: <20260917-semaphore_inst-v1-1-61e49405f71d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260917-semaphore_inst-v1-1-61e49405f71d@intel.com>
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e01e408-cf43-4a1a-f812-08df1583830a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|11063799006|6133799003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: EVh4qSHXiDn9DrdcSAah+TNjNevYur2JeI/UTvkrgo/uC7k2Jz1iJiGKMvKmqGHQJsrOSolXGdGWOQLD78V580W8/iuFyVm1HJwuank3Sp5HXc+G8uTt2x8Vn2co5sOwitdLpf7fZ5NqQkv1e8zcT/OT28/N4D0hiYJI6lTZThDi+G2wR3a3N2x/f3iQIkr/9xR47WQcXaMb4odSUeRHbI5MxaHlZyxeksEkA46DEkFnsoWcYOx7MINXpSB1f3jNTMGyXjjVhYCstTAfy1fcgQLvwNzWrfhaHpCkvmE1NwV6rvSLd7lDXy+vYDh+yjpQUXuYnqQy4FrwW5X/NH+qGtdzIbCHP8+L3rcwD+KG6QobBQdWNJtbwJYh/c0tgZhWZ5pdYzSLGiHIEoDVuxVl00FGfPFYuJY0HC0eYXHpLM5hfI9T/rYrOnGftF4yr/9jx+6DZhMFWhHwRrqsojurbLumhkJz7eB3mUbwzXLl0x+fGT3AvXnhUslBhKawYsywag+JrkmlkZH6z+lGmW5e38jKTqbrCCKXqqUiKQ08Si5rLkUWitJDmmNZKtvp0RYtf80ZtG99rx8FQuKMCEEkEL9r/NrHUJOjrMLvCMoIhxMM/m2KI5iGht3Y9t9JP65vv+KB1sxollV6ifNwHVHnDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(11063799006)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Hw79s4umiTJ0EUZ98UPb6i0QoFvLQ5nAdxhRaHoqu7zSH5gSbwkXBGNelRE?=
 =?us-ascii?Q?t3JsBOpRt5mt0sDb2bsAZDWgWXg0hZN6E8nK0TN9XBlzN00a7BSJ2GM065TL?=
 =?us-ascii?Q?ypGhvy1kKd2oV7nekXdaw6J0FFE+Hs5r6mpBZikXP8NGoSIC7q58oMeDg9Ip?=
 =?us-ascii?Q?1XfSrLfCsk45Npt5XBCOeRuQGcCmJEXxpPTjaR5Wd03pD4CwLHtrMir+fNx2?=
 =?us-ascii?Q?EczBIVIM7LT1fSgZjzS+M10lPu0L2xYkB14EM1eBbVFMKUkGsxFQrdYS/cOW?=
 =?us-ascii?Q?WlQE26zi694YuhyO55CvPQYIuneb4N/Zc4bz2uFUhz3TC3IT5QyTRJE1YuWz?=
 =?us-ascii?Q?jRyN3loR4gId6DuZrYAaq1KWkNItcRCcg+s4j8BzKsONg7DJHGX63pqTNAP6?=
 =?us-ascii?Q?nouCXOvNPSZiodSnLgbTFN/sbujtx1gK5n2rsLwljGqcbcz6hB5+uNMhlKzi?=
 =?us-ascii?Q?3bPGtiU0eOrXm+zJRcoqkyIeWNhtYQVeUeJqtr1XGpzxRH7mjDCg8xi+wmbe?=
 =?us-ascii?Q?fgyS/WjsXmNlNSWrakd7ThYPzhZ3odi7iBrGbWoP1Gmjvx2CY8HzhidZpQO/?=
 =?us-ascii?Q?uu8Rx9heiCEHYFfkwF6VETtQ18nXnjCJ7hosH6O0IBetB2UyvNte98dSHavS?=
 =?us-ascii?Q?NWHmkAyLoIwgAOr1AlgDMb91582KmncZarggJPosAQVYDTdMlFe1IoMlzQV5?=
 =?us-ascii?Q?mmq6ZCcULZEJ/16bYUgXdPbu/zv8XTcY8Eey7cNDctkMgBbEnl6ILlGGCZVn?=
 =?us-ascii?Q?tUX5ajszp8+SS6RgSSLv9YaKw2bZhjqEu8sP8UywBsjKwtLuELN9OcPk1bgK?=
 =?us-ascii?Q?cfQujzkYmrFe29xp+NnEE0R+Ukq7bLAhvCu6vRiKzLe3jHBh86Q9JQBS0Fa+?=
 =?us-ascii?Q?q0TtSCTYWvx+f7w8C704OGAsEZmrKhhM1i1ZSyJZNlGyrF6zn+7FjEs2EEjG?=
 =?us-ascii?Q?OCXfeo+pC8n9KJinfGr0PNOzPEvbI0RxQxJ1CDCq+LzEdxSQxLIZG7OonXok?=
 =?us-ascii?Q?Sstqwz7BYDzvVUl+PX0+3CCBHWdolFQABZPlivub0YRZUnUsswSdrzbCpkWh?=
 =?us-ascii?Q?14OXpzXYnb0sSveENiVeFKzq7oMN1vh6H+VmAIvnux2b6QgK9DkKRJWdQHM3?=
 =?us-ascii?Q?poQIQOQQOjrEb07PCPL1fFtraRIe/8rxJ6kTBwD1ZkA3/WcycQ8NzCP9LTnc?=
 =?us-ascii?Q?qbA4/3Ri8a1263UwpYr/3ELaXCXkgSd4tpFB0R4gxmIISdkB6sLFMmdQzEGa?=
 =?us-ascii?Q?vyZGOBcLfDjA82BXxFBjsvw17IcURHoF3+GBh+C5VcrM+ePQaEUPauVc0FbS?=
 =?us-ascii?Q?S308FAWvHzwxQCzTy0kODQTDbPFEIanlsdgZYZiKx0k5EVcyaxs8pEClv3ZC?=
 =?us-ascii?Q?Nqp73lwBz+GnjyRd15HsqhnGKptfQ4jO7Zj7XnTjj9n4B7mCRuHmcQEHPYjA?=
 =?us-ascii?Q?oeAhs7XfGx4sml9f6ZhnBjPzZMAle6nwy1zW4R2fj8cDFMDLCyIpSA/gXrkm?=
 =?us-ascii?Q?SGuyCS5ObbexyPTsUDJCuttQW2h7XKy1USUbPdzEkQIOMHBN6gyr9c5qWz3p?=
 =?us-ascii?Q?5T3rXP3KGGOhNOJh4gUQZbdlIzoAEArob1BHiTlcBa5oMcEF7iBFMJYymvYb?=
 =?us-ascii?Q?OKSOvWwXq7ATbYV8oz27e58gE4hLY1xgmWx2Y8LjaxVn1rG+VVhElRwnzcwd?=
 =?us-ascii?Q?fWInCcHZrXzms4/h4N9N0YXKOgPyYsrf3QWKux+1ueWBsNs5s5AycrKce+S9?=
 =?us-ascii?Q?WRmpyPEXuA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 2vHZiXrVfb2GQO3gDRkRLt7S4jlT/2Jm0ouCh2+0beY+QQU15RcaRjnxxMB9C2+Nnfh2rgsIV3sks5CKkr0vSeZzn61S9PMO2znDnr0SeDtz7NAxdNcVds9QwE8mTaJbjHtXl9Mn1bfNCmhkuzQqXrmt9pa6NaFP9GV2ekgwIA0iBEkfDuwpP3MAtOnMtFJV1VBC5hjCzkjWWJSM7mnDpJqF/BTQ0a0veCWrl2wbZZ47b0PTQQO7LA5cpmyCZ0pvRDFopQCojPUxhT+Cc0lEHchdsgdPHD8A5W9MSr9I5jPuX0Of4S062xA9FdrKr3qrbaGHeutB2WFwjjDs6UJvkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e01e408-cf43-4a1a-f812-08df1583830a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 12:51:09.8151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bnHsc4nT3ChBtK/3Hnl30Jry8zAx8doJlXuR4m1ABLOISzQPvrThuTv/IzDdxS5G1fslMbPc8jbccSyTwYNLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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

On Thu, Sep 17, 2026 at 03:33:39PM -0700, Matt Roper wrote:
> Drop the definition of MI_SEMAPHORE_WAIT_TOKEN and replace its uses with
> MI_SEMAPHORE_WAIT.  Both #define's were representing the same opcode
> 0x1C and this GPU instruction has always been named "MI_SEMAPHORE_WAIT"
> in the official specs.
> 
> The "*_TOKEN" definition appears to have been copied from i915's code.
> i915 needed two separate definitions to reflect the slightly different
> instruction lengths gen8-gen11 platforms (4 dwords) vs gen12 and later
> platforms (5 dwords, with the extra dword representing a token), but Xe
> only supports newer platforms with the 5-dword form, so only a single
> definition is needed and should match the official name given in the
> specs.
> 
> Bspec: 14054, 45749, 60244
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 7 +------
>  drivers/gpu/drm/xe/xe_ring_ops.c                 | 4 ++--
>  2 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index ad7d98f2dbba..835ef75bbeb1 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -36,6 +36,7 @@
>  
>  #define MI_SEMAPHORE_WAIT		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5))
>  #define   MI_SEMW_GGTT			REG_BIT(22)
> +#define   MI_SEMW_REGISTER_POLL		REG_BIT(16)
>  #define   MI_SEMW_POLL			REG_BIT(15)
>  #define   MI_SEMW_COMPARE_OP_MASK	REG_GENMASK(14, 12)
>  #define     COMPARE_OP_SAD_GT_SDD	0
> @@ -94,10 +95,4 @@
>  #define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
>  #define MI_SET_APPID_SESSION_ID(x)	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
>  
> -#define MI_SEMAPHORE_WAIT_TOKEN		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5)) /* XeLP+ */
> -#define   MI_SEMAPHORE_REGISTER_POLL	REG_BIT(16)
> -#define   MI_SEMAPHORE_POLL		REG_BIT(15)
> -#define   MI_SEMAPHORE_CMP_OP_MASK	REG_GENMASK(14, 12)
> -#define   MI_SEMAPHORE_SAD_EQ_SDD	REG_FIELD_PREP(MI_SEMAPHORE_CMP_OP_MASK, 4)
> -
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 08b4a4283e96..46ab1f0f3564 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -55,8 +55,8 @@ __emit_aux_table_inv(u32 *cmd, const struct xe_reg reg, u32 adj_offset)
>  		 MI_LRI_MMIO_REMAP_EN;
>  	*cmd++ = reg.addr + adj_offset;
>  	*cmd++ = AUX_INV;
> -	*cmd++ = MI_SEMAPHORE_WAIT_TOKEN | MI_SEMAPHORE_REGISTER_POLL |
> -		 MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_EQ_SDD;
> +	*cmd++ = MI_SEMAPHORE_WAIT | MI_SEMW_REGISTER_POLL |
> +		 MI_SEMW_POLL | MI_SEMW_COMPARE(SAD_EQ_SDD);
>  	*cmd++ = 0;
>  	*cmd++ = reg.addr + adj_offset;
>  	*cmd++ = 0;
> 
> ---
> base-commit: e3378d2746241db1a958a23c565333fcc1e30aef
> change-id: 20260914-semaphore_inst-2dbcdbd34dfc
> 
> Best regards,
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
> 
