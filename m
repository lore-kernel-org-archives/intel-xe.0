Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF14C369C5
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 19:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A66110E068;
	Wed, 16 Apr 2025 19:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxEPF+RR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9C310E068
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 19:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744831282; x=1776367282;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wZOuzPqxQDrG+H1X/klHdn5YyAlqgKiYRXFQljulmco=;
 b=HxEPF+RR5Y5TP/lfC5NL7Ea0OFuedjHXAhDPBSYyqfkpEy+Pc3D62eI3
 Rrx1nYryz0ZEcF036tjCLOWmkIxs4BPAewCha6aGAg6wkv+GsdQbMCCZ7
 bYaKLwGg8Jg52QKdmHv1tSIxIGXKWBtGt+2UrRsWtozPYbw4oKWWiWwQ9
 Sxo8cL1dul0mwf2PsGxqKfDRAA0GLQ0Vd/17yUqfLfXQ/xciRplm8/Vsy
 K9sXL+ihKisWiO+UplSQGKVeid1OYPYe7mlNbAoaLsaA1EfJ/CoewIjPA
 JFqhxuYK67yMQdMS7XkbIl1Fy9h+cYjEEI+ZNRThBK+8X1/nN2vx79evz A==;
X-CSE-ConnectionGUID: uaHQMesGRWm2pjSK4aJkwQ==
X-CSE-MsgGUID: 2BG6wxLrTEWC0rSnteLp0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71788203"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="71788203"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 12:21:22 -0700
X-CSE-ConnectionGUID: 79T3GQ5XQ6S7wjnBhD0ZYg==
X-CSE-MsgGUID: Sp/h8URhSD6zWsWSSHOOag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="167763371"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 12:21:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 12:21:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 12:21:20 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 12:21:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O68QSUX1POc3hkrUj3xgMKwpRzksU5YhgDqkmSf+vj+DPsqBlo7rjeIDBCw8Te5JHYtv0sVLQrNsKiAeV0fSmmAbN+yk9qyA3RovZhADaWS3JN8NQUHpQbL47/7KoH6Y4/4tk+eZNHLUbiQCOWwZFModT1T/0PXiAWB71LMeYqwp8Ha5/kfihUMK8I0+6yMTPqtp/cE+/mXOZy8mAP/NDkb6UeprNHCBBWiINYvd/jJB5rp8GCIHgstGicGqj51vwtbSkM1WuUfithz3uEvT1wvelbezYJTrCbkC7ilFGTGOL2CpOLcZb9YXI+u/iL5Wa9iTizktPQw6GAQC+SyNaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LD3aMbFLz7zXj2nO3uDVtJ8+dLwK+R8UKSuDfxhTuI=;
 b=cK/ZbB2Ui+xJ/c7g91utVz9udko6YJDOssZ9xC8KPN4Wp5iqhCDrJXOXsbgh6Wr784DFP2O8WINnV/XTzE2RpZwp0xFy7f24jqG1U1uFGvvgU2tFzW0DV6fXhCTKXaljTluTM0Y0loxbOJBBCVns4El/ULIcyYfm8FdInuY+bLDlNyU0RgFZ1gvnS18/4/qf3BR9SlNdpzkfPSh4fI8Bqvta/Cps65ydxRJf+wHOLwyWZJji1IQzNYjqDAOPoQ+Z0ogh18kgax68thXjY4DrHDAyYq6NpjvXZDr8pLlAt16PysixhwD+6gEh/XSwyI0Dddg2A6/niaZ8WNk6LRggGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9232.namprd11.prod.outlook.com (2603:10b6:208:56e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 19:21:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 19:21:13 +0000
Date: Wed, 16 Apr 2025 12:22:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <lucas.demarchi@intel.com>, <nirmoy.das@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Do not use CT lock in TLB code
Message-ID: <aAADdyOG0hXPWMgr@lstrano-desk.jf.intel.com>
References: <20250416183032.70948-1-stuart.summers@intel.com>
 <20250416183032.70948-2-stuart.summers@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416183032.70948-2-stuart.summers@intel.com>
X-ClientProxiedBy: MW2PR16CA0061.namprd16.prod.outlook.com
 (2603:10b6:907:1::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a06af9-2121-44f5-783a-08dd7d1bd9da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1wxqDEUu3hUu/1yvOilL2g4NkiMJ8lXQIHBwdGFfsRCji1OAoss0DMU9SW?=
 =?iso-8859-1?Q?IIffAMWGxKIgNDg4zih2bLV2NNXQvVCjUncTF3TVX5jhWFvk+yinTm6hLx?=
 =?iso-8859-1?Q?cibZB0nIfvQbMc/HGm3t1z+TzzKCyKZipPeod/vr21J7jeixKULmDUygIm?=
 =?iso-8859-1?Q?dfcRWj1wbWcgBZGr3JJmLlNjT//1AMwq1G4nW9COBoQkmyskIyFlvrrDzo?=
 =?iso-8859-1?Q?VfhUHulkTBj0fD6AiR6Z+BbUMqADG9DuK2OtDx32Sw+QNyGsGv95mGFjLb?=
 =?iso-8859-1?Q?poB3KiPhMc3xspgDygtPOqV03lbuKUpFfxX/CmXgaIqALb/OM4yiWC3zWA?=
 =?iso-8859-1?Q?7M7suLxw6N5grMBeG92aanL9evKf8ec0iooZWCJJPDKmJvcQfu0N/Q2dWl?=
 =?iso-8859-1?Q?UsCzCptbDme6WC8MIkr/MGq2NqKeT87wCMqMjaDb9qL+Ks+WF4oPHp2ME7?=
 =?iso-8859-1?Q?LbKOyBlO5nauGxKCnYK9OomzfTs7uVhTgE9rTjY7o3e4yocXXyrXTIoAh5?=
 =?iso-8859-1?Q?G2nba5e821f/PvsAJfBceG2noPl/z+OZxaTQ3Wv2iB9pC//bPWQCyEC6sU?=
 =?iso-8859-1?Q?gHk3dyoo7V6q+NGovBPnocKcseRmj3KVyVeJefx5a+OuAngclmxEtjyrFs?=
 =?iso-8859-1?Q?6G8WvfYyc/a7/S6BYdly2I9bRzCml5f6Ytep/ouJX8w7N6VmHHml9+9BVe?=
 =?iso-8859-1?Q?G1jbzgd0zt91k7lYH4BU/3RXqt58cTaff0yjlMJ9KSpVxEQq9SaSbJ5ZIk?=
 =?iso-8859-1?Q?Ahvu9NI7vhylhb2WvW7TyUzo/tn7fdHpeW5LuEZgJtW/WmcRRN/OdWzksf?=
 =?iso-8859-1?Q?azmVL0qA9AbrG66iwmLcAoCJ0wpEZVz8+HebBxrmHVdKIXYZ4B/WdE3pNq?=
 =?iso-8859-1?Q?ah7FXs6dTCQzAQUJ4suzdIIOuw8PfJmPxuKdWvsbXTqdCZWj1Ki+uP2g9/?=
 =?iso-8859-1?Q?k0y5z+FcptXQSzJ3WeahK4AlvAwc6hItxxneRPhCkHw0dD+778KjLa7g1N?=
 =?iso-8859-1?Q?iGRWkeARzBcg9qxsJn3ExgFW7V5NljWrccnI0LZMVHgD+hD6pQ0quy2RTG?=
 =?iso-8859-1?Q?a3/3lgGdEm+QqMwyKzx7KVgRKCeIG1zGf3xhh/9e3isd9t6XI5Igiz2Hbm?=
 =?iso-8859-1?Q?enp6pqeGxmawMMYGQcjG46/eF4iB9KTXvJ6mT6JFzk7hrujxoTJiTwSVL/?=
 =?iso-8859-1?Q?Wr8Z/7AEdtzrypkmVbfikBqtvbw3HByxg0NhWLfF1Gr/gA58cOo21Wpk/Z?=
 =?iso-8859-1?Q?PuQ1QzUEe/PfyH1ZtJVUB39m1j8Dqk9GvpG2HlVn/BkryX94rMAqC5n7fV?=
 =?iso-8859-1?Q?SuEd/snMLmdMottBrczsp4c4n2Irx86sTvbvNzHF2puzHk2NoSG53wdqiX?=
 =?iso-8859-1?Q?5su2ul36FF30cLpDD2/bmM93OZ3UGCd4sfJbR1p9xoJHjlJaSRpuz23Y3K?=
 =?iso-8859-1?Q?kg3FdieeAm3Ladi0UmSytjHkQGVaPS7Jw+aTfRVW/j3vuSAcJyrrLKyMjl?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uA7SX6D9PUrxECAh2HRnqe6oOWrdL6NKqPA+oVVUmL6cnIXlsotHmeBgSl?=
 =?iso-8859-1?Q?3HGtKhVa6tEgJVs2WXs3GCnUc71G2ltb4+2dA9dl2XAJxstzQIFveIK4e/?=
 =?iso-8859-1?Q?SiIAL78Qi9LyIkaI9X2NvlJjo4G0J60tMQ53xj9i8WnlHF3xWM/xGQdjRn?=
 =?iso-8859-1?Q?C7lWSBB4+unIO0xbgHCvTv8HcuG4r8cm7GcPH3RIbEOJ4Psuh/MjG5Hccy?=
 =?iso-8859-1?Q?RSLWUDmpk6NAlxr8q1Veu3WLN8OWlmDwbdRnhVGdd0ZaLsZSvZCReLgNK9?=
 =?iso-8859-1?Q?YdkjoP9ayrutVjRlqasmb9jVGlc41ZgBea6FTqoetyqnBRbYl02fEtxYWO?=
 =?iso-8859-1?Q?JoYwzHiRmDot44mqDoYagL/PndO159oa3T2yYB58FMIFaDDodUaM+cpMTF?=
 =?iso-8859-1?Q?9F0WCEV8BLYx6Hu76BsXFWrxVae32rgXS2voofWeTLEnTg5LAbZfAjzTeZ?=
 =?iso-8859-1?Q?kwLK6Dh86C7Vz/aQ2RMQdTcbl4vlSiWSTjX5PYoV/4HR/ynwa5SKKpUHXw?=
 =?iso-8859-1?Q?QqYVHasDTVjwhs14L5T+2EXGy4aMDLv6Xcrt0981GtJZ6Xs26b2CNWCnds?=
 =?iso-8859-1?Q?wW3QU1TYnOn6Ou00SongX7cm2lLKtuEI0hCn2+FWb1OGCkRagquCSlw10j?=
 =?iso-8859-1?Q?IBBPVMTqEoGfjyJSVW/p//9WRlrsRhWhyLfQYHOI8e/zxD7ttVTuZSuPla?=
 =?iso-8859-1?Q?BQjqeDe63r93W3tx25HK9bDvvwiNkTYDV6WgElUXCuGUXvxVcG3LZy6Dqb?=
 =?iso-8859-1?Q?CL3CtzzxY+qZ5Hu1/vxZtExO1IWSiPGOIC+TPpohBY6mJMO96M6GMuriay?=
 =?iso-8859-1?Q?CBtQsYKH/N2m0r/me3p8um4TcgCilLcdrX+QowfVo4/XXqbZstw/Bn8Uba?=
 =?iso-8859-1?Q?xIHYZI7SA5QJ8mvVHaR4qW48SULfl0Q9gZHWvVU80WR5oEOPC6xpntemTi?=
 =?iso-8859-1?Q?7NtL2hwB0LABqzdhdMOBfmHHdQdYMAio0zp6scw/ErX7qefW+hlEhjxpz2?=
 =?iso-8859-1?Q?90t4sw+uu+70INFhoUVVIXySolgNmNMeoGhAJjCmVnH+us+7nR6TdnrTj2?=
 =?iso-8859-1?Q?tnpNLQ4xq2resOj/+ttY+vQRNUxM+vIKaJJJJUcjaM1k1DMDrsJk1/CMPu?=
 =?iso-8859-1?Q?867wlcSoYVXfgQ8cbxnuZ6ul3tDM7EZvxpuy+ymjBQ8CvCIp4D/Szgupto?=
 =?iso-8859-1?Q?x1jpM3NoGyrfuN6Zw2RiMLgeRDNlHzvMmAFWhpvtoTWAR/4aBHE3zpnmRC?=
 =?iso-8859-1?Q?4Rx8TGC1IsnfBVEmVEnTEo3B1cLiJC/OLQ0DP9KLEPG7H9VADtM3a//KLt?=
 =?iso-8859-1?Q?XZmKEV0/uL5dvQNKkI6kw8olPpdCjuNvRTcXicajHUaHszwNHg+JbfniYY?=
 =?iso-8859-1?Q?D+y6Sc7DEMdDcvq+4CRZPs3zXrZfQDFAil10oIHiOL9eS/z1ggADipTJzt?=
 =?iso-8859-1?Q?jUMJA2LNTl/QIvMy7LM2Lq01LF4ClbIb0pAi4OHFFMvW7vrzsFCTD+h7n/?=
 =?iso-8859-1?Q?4zwc38S+BIproqqC5Nu9GSfY04HCmpMxmwROzQ1VWNOlW+hsrUGnOnw3XJ?=
 =?iso-8859-1?Q?h1LfvM+ysosfjFUzfGHb79SBzLH/ON2RXoI5N4U+TeNnDKe6FBsItHvr2G?=
 =?iso-8859-1?Q?21MPxxm7jLDBxTqYUWn0/VX2ZFVq7tktrV3KJJyfDKIzKh/arKQ56UaA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a06af9-2121-44f5-783a-08dd7d1bd9da
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 19:21:13.0724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWOmw8sIwmmUUmC8qN1+8vSw/QbwsyZ/5mztHULefgAPCRRHYq6UHMyw9hL98vI3KUNZwgkcFvN9OSvFUKWLJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9232
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

On Wed, Apr 16, 2025 at 06:30:32PM +0000, Stuart Summers wrote:
> From: Nirmoy Das <nirmoy.das@intel.com>
> 
> Stop abusing CT lock for GT TLB invalidation fence seqno, add a
> dedicated lock.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 17 ++++++++++-------
>  drivers/gpu/drm/xe/xe_gt_types.h            | 13 ++++++++++---
>  2 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 031c4d43f36b..c2bb53362d74 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
>  #include "xe_gt_tlb_invalidation.h"
>  
>  #include "abi/guc_actions_abi.h"
> @@ -123,7 +125,8 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
>  	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
>  			  xe_gt_tlb_fence_timeout);
>  
> -	return 0;
> +	return drmm_mutex_init(&gt_to_xe(gt)->drm,
> +			       &gt->tlb_invalidation.seqno_lock);
>  }
>  
>  /**
> @@ -142,7 +145,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>  	 * appear.
>  	 */
>  
> -	mutex_lock(&gt->uc.guc.ct.lock);
> +	mutex_lock(&gt->tlb_invalidation.seqno_lock);
>  	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>  	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
>  	/*
> @@ -162,7 +165,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>  				 &gt->tlb_invalidation.pending_fences, link)
>  		invalidation_fence_signal(gt_to_xe(gt), fence);
>  	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
> -	mutex_unlock(&gt->uc.guc.ct.lock);
> +	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
>  }
>  
>  static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
> @@ -195,13 +198,13 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  	 * need to be updated.
>  	 */
>  
> -	mutex_lock(&guc->ct.lock);
> +	mutex_lock(&gt->tlb_invalidation.seqno_lock);
>  	seqno = gt->tlb_invalidation.seqno;
>  	fence->seqno = seqno;
>  	trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
>  	action[1] = seqno;
> -	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
> -				    G2H_LEN_DW_TLB_INVALIDATE, 1);
> +	ret = xe_guc_ct_send(&guc->ct, action, len,
> +			     G2H_LEN_DW_TLB_INVALIDATE, 1);
>  	if (!ret) {
>  		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>  		/*
> @@ -232,7 +235,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  		if (!gt->tlb_invalidation.seqno)
>  			gt->tlb_invalidation.seqno = 1;
>  	}
> -	mutex_unlock(&guc->ct.lock);
> +	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
>  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index be81687cbe2b..4736a608a881 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -187,17 +187,24 @@ struct xe_gt {
>  
>  	/** @tlb_invalidation: TLB invalidation state */
>  	struct {
> -		/** @tlb_invalidation.seqno: TLB invalidation seqno, protected by CT lock */
> +		/** @tlb_invalidation.seqno_lock: TLB invalidation seqno lock */
> +		struct mutex seqno_lock;
> +		/**
> +		 * @tlb_invalidation.seqno: TLB invalidation seqno, protected
> +		 * by @tlb_invalidation.seqno_lock
> +		 */
>  #define TLB_INVALIDATION_SEQNO_MAX	0x100000
>  		int seqno;
>  		/**
>  		 * @tlb_invalidation.seqno_recv: last received TLB invalidation seqno,
> -		 * protected by CT lock
> +		 * protected by @tlb_invalidation.seqno_lock (send) and
> +		 * @tlb_invalidation.pending_lock (send, recv)
>  		 */
>  		int seqno_recv;
>  		/**
>  		 * @tlb_invalidation.pending_fences: list of pending fences waiting TLB
> -		 * invaliations, protected by CT lock
> +		 * invaliations, protected by @tlb_invalidation.seqno_lock
> +		 * (send) and @tlb_invalidation.pending_lock (send, recv)
>  		 */
>  		struct list_head pending_fences;
>  		/**
> -- 
> 2.34.1
> 
