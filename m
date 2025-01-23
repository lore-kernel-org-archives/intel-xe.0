Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB98C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 17:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFD310E2BB;
	Thu, 23 Jan 2025 17:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e+fu0NW8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A36A10E2BB
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 17:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737654284; x=1769190284;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6e1tFgvETeRpU9fxPU7FUeLHUxWWjAcZLNTecWlycic=;
 b=e+fu0NW8eYOoZE6Tia2gFf9qeVllu21nn1LRQwQADREOBWVV57oWwPA2
 F8l6yVr9VfK0v9WSfC2ngRbhwgAJ/+vUuJ25bEEern8X5xJjlQlkYXXg6
 IKYQb/RVB9134viaZFnRM6SFcU9mTe+MMuUKFZX/6tJryGn6EZzfFJuzW
 dvSJ2ejDkgNJSz10q+N7rIeQvAiMv5JwYoRU6QXeME8y+NHrzeBvDM1LA
 fDt6BdclTJA1osE6invtEjuUwczI5DFGG5KSQp492XIyIwsdkF+OCvOnX
 x3cXWchJ7EQ18BnNmBQnlx5mXQwf7ShXSQfEalxlQ1iIcKXUbLdVGnKwk Q==;
X-CSE-ConnectionGUID: v1+HYp67SLOBO+01uaPaJA==
X-CSE-MsgGUID: eQoeoarrQ1qhRHz7DZjMdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38086961"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="38086961"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 09:44:43 -0800
X-CSE-ConnectionGUID: 9kz0cOy2TzquTfIHZN47hw==
X-CSE-MsgGUID: Yau6zq9BRy63ZsUYeWCTcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="108072108"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 09:44:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 09:44:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 09:44:43 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 09:44:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2JF7+HIe5G9fv6eA+IZja9gKZE987FOudDYKw+8F1kdl3QgOqblZqmhpf4qMVLI3fzqbrPWcTJy0Y6TpnSwnwvtIm68scMABPWeSpriAgD2EjW2JvCplVgq5RVoEBVjj1AaTCO8oYgU4V4OqZLv+poxQR5ZrIvsU1dRpgEFFxkT62Ure/kOiSCZ0Dtl1geN5HcBR5pWyyLoVrlYRiPsuskHJgu8wi65oGvEucg7teTd/RBRLcnVTd0sPi2BX3nW78ufsmKud6iT6rL4MFYDXnzOObtrgZx0mNNoPDBB2K28tf/ye92cSAqOzt/UvVNdxFaIwPQc1ziddiseyKTQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMPEePS54gqGWRTWqpuYb9FnGg38LzTEEW6XTlc0obE=;
 b=i6R5XQKphtSXOG+QUjczAtk4wY9TNDdXtLcGwfB3gqiL768kAfpQ9ziUGigxe2KE0fLPrQ2Hz7DOCteEXfC+/tBt/WlwcSb/4XWOQSOQfFPm1VIxRlcnZC4ZyiMqVvCp0GbMPp8PDMBrgcRxPw1BCVBIig2Vt+BdCGnvOLARxmy4MZYaAe6ZJvu8s/jiI/yYNM6IKZVzN4sdxwcIcoIMIeBcWd0ZVtGD0wFLnrGMO2Ru+qoN+dbRD23JhIf9bI1QNKI5ECwR6JmIU74LF9o6K6n9zmiSkI8W6k4x3YRRj0vpmDBQxYg6GShyyijOaU8hUWL9IwrYxZgdSaeZU04U/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8077.namprd11.prod.outlook.com (2603:10b6:a03:527::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 17:44:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 17:44:26 +0000
Date: Thu, 23 Jan 2025 09:45:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe/pf: Add reclaim annotation to the PF master
 mutex
Message-ID: <Z5KAMCcpczq4gL37@lstrano-desk.jf.intel.com>
References: <20250122214955.632-1-michal.wajdeczko@intel.com>
 <20250122214955.632-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122214955.632-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW3PR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:303:2a::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: f653dfff-b15e-49b0-73a8-08dd3bd59486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RhsksZnOQf/Xz6pPCKRZtrBuZf46peY31f+27PoLw9Ik6Vpwexus0Q9Avd?=
 =?iso-8859-1?Q?S7/Ab+mNMkBFEnsI0CyUgLNqrG4UBjXKK3pjdWa0Cot99Q+oBdtwzwFJt7?=
 =?iso-8859-1?Q?WNdQF+tOGqntk8ROiatkw7t5RBCwpWuPnF1cqTh96Q7QCog5+S8z6IJWWN?=
 =?iso-8859-1?Q?J9W+E3yp88HZeZ0Aqke3STUUWAXs//VAh7uYW8AyOumPOpmbQyrqIdYOmq?=
 =?iso-8859-1?Q?Mk0Kd+Qw31UNfFQwcQRqu74ouxvFXpxBh5Ew6OFEywHMp59Hay9ycPFvw+?=
 =?iso-8859-1?Q?57zRvAPXADamgzMUCgpn3iQ/l2FlpN2U5tTaBR1FppkLy6ucr6kPNszx2c?=
 =?iso-8859-1?Q?qaep935eEzJn2yWv2zLM75pitT9RyVLK0fjoMyF7Cx6cMV0LP6aKwn8R8U?=
 =?iso-8859-1?Q?qcMiNbd5tIcSHS2yBCTXYg/kdPv9keOt5N9iSOAyfVcb3Ayvdu2jhhAjul?=
 =?iso-8859-1?Q?2QIa+/QmQ2lGYxHZam6wr5RWVC0YfDv01uJL+X8eYr37akcc2YqCF0cQ9n?=
 =?iso-8859-1?Q?GuBUw5yxDAuaAhBh54pFrTr0P1a+GC5dntiCkEiOkWgWFoTD838OQ3nnRl?=
 =?iso-8859-1?Q?M9anEE+cqvxO6n6+QGWd3BIv/R/WAAfSlKZv24fYv1bQfb8iceag9AvT23?=
 =?iso-8859-1?Q?lLFpJh7L3cAx90flzcnBRgmoyMJZB6D3QQaZ9Ng2oe5GglM6zo1ebMOv/o?=
 =?iso-8859-1?Q?DicyDuZgIYR+9hp7NTQOGz6Dj+R9v6NrnpNjDuGtKZuTYjzcaJqjcep6EH?=
 =?iso-8859-1?Q?qk7EbGypHH0I384PzIurRXBnaxeWID5rMvAAWwcTg32Nh0+Ns7Dbj7esCV?=
 =?iso-8859-1?Q?rsRr7KMFf9mEKcyrN8/4ly8lZeTKGB7/kl/QBKUQeFh5Rrhw2FW8o6TS+E?=
 =?iso-8859-1?Q?Z/DJQoaGlNOF3Uzddbxez4sT4unoMHZrcOnut71uSRY3SH10hd1QeiYksC?=
 =?iso-8859-1?Q?uwQaf+1oUqmSREk4O2+RGL/YOGNJJsM5RbnxGZ0gM55NqTLymYZ/S1RL9x?=
 =?iso-8859-1?Q?6FRcKpkx+eFUplrKcZd7lh773gg5Q6cQ2n167ftX8TIEZp42ldASKA8Rub?=
 =?iso-8859-1?Q?HdEBOUK8AqeswZ/Tt3fR793H3enbGipDjGT4dF1jXgZ3vX4a42c3VoSvNt?=
 =?iso-8859-1?Q?2wmz1fy5rJrCbHjPxDpKbQS4H6I9KaLRTu3+V8++Cvwu9lN2C/CWq7Qqgg?=
 =?iso-8859-1?Q?ie377NJsngafW9uSlVnweSBQd+SgJHc8ufl07GXBqoxNpEi469BwEyw1FW?=
 =?iso-8859-1?Q?dTKFIYuWsiHywunS9UwyVPSXE2xLqRY9KFivpkchc0j61gbCjkD6O/0fQ0?=
 =?iso-8859-1?Q?BKrq0cE4FlQGScIDbt68N9xvyfvazVnfw0LPkMGI1H/pKFex/w8J8gAvWW?=
 =?iso-8859-1?Q?JD+pXQb9LIwFjyuzxlojo0cpZA0E8pVG9rrOlNqc0UNbZRalNrLQMlTtmL?=
 =?iso-8859-1?Q?REfHREXZYZdFSmyK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yXpbanjGc94itRWPHwe+Rn4okJoD/EWXh/cxv0SzKSywZV9Exc9oinxEln?=
 =?iso-8859-1?Q?UqWgkPK0soe8s8VHMN8vyWVT/bixC6Wj1YtM2qhlekRyM/bSN+MTOjyaMt?=
 =?iso-8859-1?Q?Ztx3JFVCvRLjjtw8dRns4IfzR9NGnxG8PqVJ6I/VsbOGMtwuWnPi9hXR3i?=
 =?iso-8859-1?Q?WE4g4pLJ3oTqB7D1EbE+o0byV2ZWlCcBRsmsLPvEbefpt4CayAc5X73Kor?=
 =?iso-8859-1?Q?+nzODYSZXxl31w9LwT5mF3dIRgxvz5QvmGb535jN99XEFG5T/uO6T6TkZl?=
 =?iso-8859-1?Q?OQPii6WH/ykQyjg5PfEbx/Bimbepjxyo2FheDC8+hqMdjezdfbMmf82yGS?=
 =?iso-8859-1?Q?sXoKE15ux+puunjtpndg1PoBPisoUDgT/PSec3QAmgPCACIkUKqyyARXaR?=
 =?iso-8859-1?Q?qvWzR4Redq8bAwhM3edMgjUmIFAxU1viXqwx3Y+WFvLySFnyNLkL/6UmOf?=
 =?iso-8859-1?Q?zri750Srvvyel+nmiFVD0K2ABRt7wPEz59c24GHkrtYqfbPJ+lPe6qn/jN?=
 =?iso-8859-1?Q?fGmUdVlBdyrJfAWQscTXWVkZGvwal8I0qs8FiWwIQMuILRimzMq683cNBd?=
 =?iso-8859-1?Q?91n88aQNyfApVI1gG/c7byDIIyqT7LPduiFHBh8Jm58ofYwBUE6DCtGPEg?=
 =?iso-8859-1?Q?22sZUpw8DUz4ySlbfNETyq8WPzLwrCUM4XLeXfgdgLyW1t7R/oMQHP2WLw?=
 =?iso-8859-1?Q?F4yQVda6tX77y8Aivn5PhzdFChjtxMhKLDSUXfFxN4uoH72QLdlMKcLvln?=
 =?iso-8859-1?Q?m0Sf5x/fPvu41GX/dRXm0cg3zxUvO+R4/3dekxKr8H/mbnDJovblUM7qfc?=
 =?iso-8859-1?Q?bCEb2w0u2blHkAVu+6+hrUKB4q+BCcpD/N/HVzi5Lga/q7DYkIj7Z3wqIR?=
 =?iso-8859-1?Q?LK6HoNN4pXbVTLVcftaGPjX4lwVc3C5XH0eiG9VOE/htMvjGGN1QCtDzrI?=
 =?iso-8859-1?Q?aGtKk1JC6dnjIkcXRFLpQeJcQ3NAJZvl5zrAhXwq4kQ86bVlETKjzMRlSU?=
 =?iso-8859-1?Q?AiBku7Of4iahX3D7NqXJ1JL3DbBgzPoxDF0ehHryx7XjqNG+QWjAQaYTX2?=
 =?iso-8859-1?Q?wAcfglpehJcrfbxHntuLsokKhjECCxllVgC+MTjS7xnliLWiqGzKjLO68d?=
 =?iso-8859-1?Q?r+fIJXeyDU1w+gpx/C8kKmdapda6DbcM2B0nupXmpDABMUJuMiu36aFy2l?=
 =?iso-8859-1?Q?awQN5FCN/uz7V1UQMnfmwvb6qZnyqkLJU2mdQCYbdgqCJfSNSCYdIcc4W0?=
 =?iso-8859-1?Q?PfVH3CAExfg2RP3QN8sPRyXpCaygLcHthf92D2VvsHSZjCBDq+d3XHqfi3?=
 =?iso-8859-1?Q?gR8VeBy0QLxA2Dsb2z3iECzhtTGhq0sgjuUR/384Yh0UzuNen1Es32qmGk?=
 =?iso-8859-1?Q?AZNEkAyfffq+FziIK2oNIn4Wqsy+Ky+xytiXeifgIHrZ+SbDRdVqf+c7tZ?=
 =?iso-8859-1?Q?TLpdC0s7g+gl0UdGPnShkc6Xo9+hBtOxs6uP59N2TddZyJ1oBSeoV5gb4H?=
 =?iso-8859-1?Q?h5SMmGZzC/ky1WYat8ewzhi/mGYiT8BlNbkYpnPeK/tcyS1G7lD+mDYzmj?=
 =?iso-8859-1?Q?cN7Yq2RhUcfwx2qrsIN5y4wtqBuvpC56WeqouPmTuY6hBSMuiABn4Rvu2W?=
 =?iso-8859-1?Q?ZHuQfD2frz1S+11v52yBn9Aiuf2NCDNQiC4dr+s4ZIyDDBgNpjbW15Cw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f653dfff-b15e-49b0-73a8-08dd3bd59486
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 17:44:26.3777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXshgFCmo2pIRL20hWKC/NRKjhiT2HNjjBqjB0pJJ67ObO5r8FUilSCZpk2uwKZis2tYxmR98nhuPP9NWrn1eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8077
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

On Wed, Jan 22, 2025 at 10:49:54PM +0100, Michal Wajdeczko wrote:
> We need to avoid making allocations with PF master mutex held
> as we are doing VFs reprovisioning during reset/resume steps.
> Add annotation around PF master mutex to catch undesired uses.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Awesome to see this fixed.
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sriov_pf.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 0f721ae17b26..2286a08657b0 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -10,6 +10,7 @@
>  #include "xe_module.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> +#include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_printk.h"
>  
>  static unsigned int wanted_max_vfs(struct xe_device *xe)
> @@ -37,6 +38,13 @@ static bool pf_continue_as_native(struct xe_device *xe, const char *why)
>  	return false;
>  }
>  
> +static void pf_primelockdep(struct xe_device *xe)
> +{
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	might_lock(xe_sriov_pf_master_mutex(xe));
> +	fs_reclaim_release(GFP_KERNEL);
> +}
> +
>  /**
>   * xe_sriov_pf_readiness - Check if PF functionality can be enabled.
>   * @xe: the &xe_device to check
> @@ -80,9 +88,18 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>   */
>  int xe_sriov_pf_init_early(struct xe_device *xe)
>  {
> +	int err;
> +
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> -	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
> +	err = drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
> +	if (err)
> +		return err;
> +
> +	if (IS_ENABLED(CONFIG_LOCKDEP))
> +		pf_primelockdep(xe);
> +
> +	return 0;
>  }
>  
>  /**
> -- 
> 2.47.1
> 
