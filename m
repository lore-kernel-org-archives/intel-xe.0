Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853E0C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 16:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B88A10E099;
	Wed,  6 Aug 2025 16:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0ReJXNG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC5810E099
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754497703; x=1786033703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0Q209QQU2oFXJ1ICyaZ2p7MUJLzu5qc5sNy9+45dHh8=;
 b=l0ReJXNG1xqBFQFjGdFG0aFcDIzXcDWbSNWoMYRHc+dOHWnlRdTCxavp
 t8E3Jv1OfLZd0g0ud7ZNhTVJn2T9Y7YOkolggUlg44q6ebk/uRR+qyh4Q
 wh5wd3rYWORE3LowTwX7K61mTtww1Aw/DIH2+intq9vcsQaLmBVLCEE9T
 vWgp7/DcFxsSUFUzt0jzg6jEwBL/Mceq0SlrHczBNUPiBR58+FYF5Ck/g
 MWxHaa+GcUz3oO2SNsin/AtF9n24Ij0eDjfHLjR965Y+Z9v5KcVOLThR9
 shFDFQCGlFafaaz4FA5utKdWgEeUI2hy0PTV8eVHrihzpCD/qUu/pk03s w==;
X-CSE-ConnectionGUID: FnPD0rBBQwCIWB1OfPyZfA==
X-CSE-MsgGUID: onBLBxzcRVq1rgJrjMASEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60660201"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="60660201"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 09:28:23 -0700
X-CSE-ConnectionGUID: ByVmitQ3SJq2DBmBBDypAA==
X-CSE-MsgGUID: wj50BO4ETK2VauEduinlmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="169258299"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 09:28:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 09:28:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 09:28:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.84)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 09:28:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVBo4046KbEJ/4ACJdidhzrjghUJMJUbNNGmVSc8w0t7bIs02ln8H/aV9t5WR0mCpL5NQb57S0vqR89npKUN8796fg21nZnogGIWZAGDV4+ZZsqQkw7OPhC1is5d6HsizxlSQuP+Az5QooFhdbYg4MiRIYxK+kCq7qhJ8KlaAwERWkvDiHL64acv0VATKAm4WMtdqKtqVmLpfQ9YW845wUs4lkIOTEn17M7LyS3qotQ5Lzi8OnVNFi+XXVJ/FzSDztQXpcIUQa5/z1/dolcaWo3OaTQfzoYVi1tKz6ItE325iWIwcJiaWETlBIZsMQL8QwjqoX+sdoOLxcGpvFmobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xLAoQMhCfjWQrydNFdRF3JhZPP3JIetgXsIybNBAug=;
 b=ugsYOhh0iEW3tz4bVdYLj6CrHLXi0aS9Ahl7r3tv7J4p+5Wm4++E382JzW5jBp5DWt6oq1yAuBCVLynNt56OvFLX1Zjyk/ahhIKSiYWCrChKrIZldexVVj/NN3tliuabl4jmVVrIw4d04kY+IFxbEeHGnHY0TiYneKh2OAoKqz3EllNFCmSX1SAwi/oAYPnzfbZxR27ZD8JQ9NeFowYj2pF8kEo+N5tdKqqnCLPAWfe97646Xequ3kb+QtmpWULzsCiB40ScKufiaPTipYp8sGH1cDRQtgobcifSOlndGmQHy7QJdzVg+vAQLFZOZdHGbfCMk5d3Tv4ugCA5Nvy1Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 16:28:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 16:28:19 +0000
Date: Wed, 6 Aug 2025 09:28:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Scale mmio send/recv timeout for CCS
 save/restore with smem size
Message-ID: <aJOCoZMciuSkCYgg@lstrano-desk.jf.intel.com>
References: <20250806082910.15845-1-satyanarayana.k.v.p@intel.com>
 <20250806082910.15845-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250806082910.15845-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:303:b9::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e9c13d-4fdc-481c-24d0-08ddd5064110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ehtuv5aEiGOw9QKVihTjXGGgSxOt6q8yWtaHhYoRJm1bmIcQdNCyZbpvFh2B?=
 =?us-ascii?Q?VIJgCj7/8+Z740eHrNdYuqsNE0CZYoRmIPh8xlj6y0NRVNOYwRR01jUoRu2w?=
 =?us-ascii?Q?CvaQYN5scjIHGHsZ26e+Ut80PzRTd7ji1LBJBrR4Vyinh0UGgOw324OgBfmw?=
 =?us-ascii?Q?WmcvTiKANoW9FYI4LIvccFguYregcqPKAgmKjqMBb542EFfQ41eqAITYJS3v?=
 =?us-ascii?Q?nh5BFcVLrHmF/rlTTEUlV08OgPltjZB0iehI+psMyhEsKlpqkM9iKxFy9Gn0?=
 =?us-ascii?Q?+mNe1AgP62HBJOHenktaZTI7qKpZkQGeXKy7T/dQLL/+Q0NBwOVQIksUqDW4?=
 =?us-ascii?Q?ep4RUI1J+i2DnBQPARKwgU5Ct+L87gvrba1Vig6s6Rku9AtWwhiiW8LQQ4ez?=
 =?us-ascii?Q?/wXveZc1rxmQGLb8zmgzlDI6hMzbPyqsZhARQpnjsZnVtkBtdEj5uGUikXD0?=
 =?us-ascii?Q?sgTaMt7hZkkEZ/EtmKl9L8dcZn79q+iGIAQAw8hXvOynqVyrZ4zs5Py/ulQC?=
 =?us-ascii?Q?2pmYO8QAIF3G2mpo96IWUC0Dw4DckL2PXXGjzWzBbcTqNWBvzSgeECTvSrTA?=
 =?us-ascii?Q?vAHS00nmInxkG1m6UU1oy6QzaPS6ekjGKP8n1OR2Ahi+3mrJ/nyXpSKMGalK?=
 =?us-ascii?Q?2PYJbvMQCA29K3cVpfkD12YzfZwucm+vssiZ5fMC4iw8M/qMZJyWyPWL5j08?=
 =?us-ascii?Q?vT32qO4xlNJNPCrjuwix4pu3Q6h3Frf5isbwiPWOGbmBpDoGz10DLB8VMDN8?=
 =?us-ascii?Q?zYC/ynwuAQtkZfnZzrrVw6ejEwhKVKD4H9sUHXPGUowedsenBxupXDJfxBwD?=
 =?us-ascii?Q?jXht6tRZbpazGw9JmcYQK5kRh8QlKe5by9gOValc/EWQ/IhhXhn/lvssNeQF?=
 =?us-ascii?Q?XXHT+Nmq/ycEwhlpyEOHuqioACxgcdqqxuql64ApADQ05E+DXhmWtWnoKj27?=
 =?us-ascii?Q?nKVmRE/vV5W2Q6BK5GtWuhkEsZPaPfilE0NIFgsAOihu7JN0JMFhxJe4FtUq?=
 =?us-ascii?Q?HazNU4PHHfGl1/vTueDiQcpToKNwnVZasvd0i/hHPWbv3LdOPCq0iZ2cs/jF?=
 =?us-ascii?Q?LzV0d6BDBSCOM9dfKi0bIEkHMr5czN9tDf3cgQY4JaEKaATBBdWICDEriWzH?=
 =?us-ascii?Q?KKzpP8oF5cLG6Y2Z0CmCYNqOpcBORvmgxIvOFUsE5mbCHnwdCR7KW2pW6+ig?=
 =?us-ascii?Q?xoss9ZEhgTy7QoORLXx4Nab7Z8H/IMxTc95jhIHmB5e0XU+tqAzyIxiTR8Ei?=
 =?us-ascii?Q?CXHWOm0ASksNDocEmw53BiAQ0HBUT3W1O7fkWiSvaPhT/nakfm4CuVyOGJ6T?=
 =?us-ascii?Q?IemoVFAPkeQ/oKcRFo0bPOAiJje4rpKvqw/SejJQtGcd1YendPlv58zjEy2A?=
 =?us-ascii?Q?RhY5rMPmRdAw1q9lJbIMz+pxMvSVno9Z3N2+Oo/eXgNKeuT3DTRNCrcM4b5E?=
 =?us-ascii?Q?oGarBqrdSPw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JhKoGh6oU1dPaSs1HDfTcVc98GimXo69EgFynn/DkuT0f/2iwqrpEJZFsS41?=
 =?us-ascii?Q?3yQVCNnD49RfGHCN4MFFhdyD0OR+Kq7a7A2GRRBO1ZLXwiGQPoql2dcNVJOI?=
 =?us-ascii?Q?TN3YvQKZmJlDiVVXpk+v4IKR/2zEeMPFfcTB8h42w2VBSxJv7g9ejjToENWX?=
 =?us-ascii?Q?id7p23wAsyWeiiTNzmqjcsORL/wqqaa8PSw7uuA93AthJWPfHVj0s/HIFEp2?=
 =?us-ascii?Q?LWsJNKEHOwgmIW8+kzySH233M7rMqxfAPmNU6pzFmtlR4R+5lPZGqzxRDmFN?=
 =?us-ascii?Q?wIVV56+TMN8ADVlkhp5CK6cghSzoYPJsLhvyUcvSEmhIjpwZ1GKueqdNY1r2?=
 =?us-ascii?Q?Zx+f/XWRv2mD8bVubWc7qQKTSUkYRS6dI4UgNV7D0s6AjjpV0ELb9cbUe6aO?=
 =?us-ascii?Q?1tB+ZeYThiN0XwTc2PFAzdtbY6mFwFykzI0E48eENJMIwFIsrGlPeO/rI3qy?=
 =?us-ascii?Q?GTh9YvOH3f1ixm+xSMTDzBdaeDoz/aeUFb0bLMjvuwFIuPBXr33HcYGEzSBG?=
 =?us-ascii?Q?iCt9iL2EEGuP+r9eyE9m/hFjee28A71JRqlxBsBgs0/HF8lxP00h3cbMA0QK?=
 =?us-ascii?Q?FUTG+l+GPFY0G/1jpWwBG/aLfrOFSlDI1kasvbM9UN5tAQhH6NAvI4n7alSA?=
 =?us-ascii?Q?yQMO0Ti+Wjnttbk2lriDuL9HVRR+2CTCW0bbaIazM3wVte3TdCsxNfYwGXXz?=
 =?us-ascii?Q?u1ULqwQviWsGWR7WDPVJZoPQ7qum8YqFjO4uUD0LL8Lk3Hminv5zqVy6nZLb?=
 =?us-ascii?Q?7GvOfxa+dFeiQJZt8i5DxRybIkRghAqRl4MJjDG9gQcBtIuG44u6lpQMlAwf?=
 =?us-ascii?Q?eJRi/8XmFzqboOhf7paoVE2vPa7pvynWaUi45H75QPDGxb4w995sSwixEllY?=
 =?us-ascii?Q?xZMWEVFpn7f2AyelRp+ZYusv9AjwLAaSRPwEgKnO0LkFR5aUIZ1uWZNbFycq?=
 =?us-ascii?Q?2vvAqRThn7JbN1djYFtyy6/QYfn6zDAmbfXu6G/RFWlR1pc1+exdOR4+pSag?=
 =?us-ascii?Q?/PbVh/Uv5ajyykOfLwe0ZVVL3Yi8zCXqqNG80Q3JLMuY+uoWyX/KEQoL1XVc?=
 =?us-ascii?Q?j/ZTWTMpyMLkmTE5QkTF9V8kENYpU+7YO2eWXi/Th/v3Ml8yK3/P/mhIVXya?=
 =?us-ascii?Q?p2pHjbrjhX6UlHRHMANm0z3SElEXzfY5/3GOaY+4FNLN3atjWrxv1kuJfiMs?=
 =?us-ascii?Q?QVDRRNSq4yVeznR88kQMsE1GitSzn3jVwTNYicchn58uhRSA8mFpwKwi9KnK?=
 =?us-ascii?Q?aHcLBniMA7jIku3rbk1zY93BUdFi5GkN5kpqVEUJCCZv0es2PVajJFuCsX/R?=
 =?us-ascii?Q?BV5EG8VNBmn8vnKBukvPrQXZKhT8o/LK0UkudDoyuUJz6rLPYewttfH/2cLe?=
 =?us-ascii?Q?bqaW5o6O0Q1hlegkPjw+qDelkRufhbEDDXaTksh+TqMpDqv8093TNgaSSQ0T?=
 =?us-ascii?Q?socdE90ih5Ee9LbjyJ8FpWgZgrWa1Kgsy76mqEpx9R1bXHTS3jk3dE/V7Pt/?=
 =?us-ascii?Q?ZD2nsqpj984HY8A4P4E1N7CFe+Bm08XvMizaFxIlu17kBzdEp8lOJFYPgCmV?=
 =?us-ascii?Q?h9oWkzJD0DVjkZnL3ipddnPXpRY9ob4g2SVkPU5ZYhZZBK4djYHX5jD5nNrD?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e9c13d-4fdc-481c-24d0-08ddd5064110
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 16:28:19.5777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wp2xSEq0Ss435DD5BzR4Scx76If6fJLxPbutXLUZMPKR5h1jxW37mTDw/qYm/k+tgaIWLhb5pH5e2GEd2estWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
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

On Wed, Aug 06, 2025 at 01:59:10PM +0530, Satyanarayana K V P wrote:
> After VF migration, GUC restores CCS metadata scaled to system memory size.
> The default timeout (50ms) is calibrated for 4GB memory capacity per
> specification. Timeouts for other memory sizes are proportionally derived
> from this baseline.
> 
> This ensures adequate restoration time for CCS metadata across
> different hardware configurations while maintaining spec compliance.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 9e34401e4489..d836ded83491 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -10,6 +10,7 @@
>  #include <generated/xe_wa_oob.h>
>  
>  #include "abi/guc_actions_abi.h"
> +#include "abi/guc_actions_sriov_abi.h"
>  #include "abi/guc_errors_abi.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_gtt_defs.h"
> @@ -1397,6 +1398,36 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
>  	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>  }
>  
> +/*
> + * After VF migration, GUC restores CCS metadata scaled to system memory size.
> + * Default timeout (50ms) is calibrated for 4GB memory capacity per
> + * specification. Timeouts for other memory sizes are proportionally derived
> + * from this baseline.
> + */
> +static u32 guc_mmio_send_recv_timeout(struct xe_guc *guc, const u32 *request)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	u32 timeout = 50000;

Is this really the upper bound? It seems like if could be signicantly
higher if multiple VFs are trying to do things all at the same time.

Scaling the timeout itself, does make sense though.

Matt

> +	u32 action, factor;
> +	struct sysinfo si;
> +	u64 sys_mem_size;
> +
> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]);
> +	if (action != GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE || IS_DGFX(xe) ||
> +	    !xe_device_has_flat_ccs(xe))
> +		return timeout;
> +
> +	si_meminfo(&si);
> +	sys_mem_size = si.totalram * si.mem_unit;
> +
> +	if (sys_mem_size <= SZ_4G)
> +		return timeout;
> +
> +	factor = (sys_mem_size + SZ_4G) / SZ_4G;
> +	timeout *= factor;
> +
> +	return timeout;
> +}
>  int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  			  u32 len, u32 *response_buf)
>  {
> @@ -1439,7 +1470,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  
>  	ret = xe_mmio_wait32(mmio, reply_reg, GUC_HXG_MSG_0_ORIGIN,
>  			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC),
> -			     50000, &reply, false);
> +			     guc_mmio_send_recv_timeout(guc, request), &reply, false);
>  	if (ret) {
>  		/* scratch registers might be cleared during FLR, try once more */
>  		if (!reply && !lost) {
> -- 
> 2.43.0
> 
