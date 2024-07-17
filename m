Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A34C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 12:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409F810E13A;
	Wed, 17 Jul 2024 12:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kzrcYlss";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECC010E13A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721220096; x=1752756096;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=43OOAFHKKPMn25YVGx8d9HvT8MiTVpcXVG4nAycbAgI=;
 b=kzrcYlsskUear30IHBye47Mee+NwChRKVrr8P33z+D+MEmFx9l+sEUjY
 GlivWrysQwCReD7N6vxPkF6b88X3a7cze55JxDpw2StOGNy8YSDHpIjNP
 I/1o7xU/6IlZgeVJa/CwYHq8N7wta7qFC/0c/r6/GQY72q/hchlevqDIz
 OGlelqEwKF0yjaoEYRdz29rxRhY12ETedKQTx9Mz7NsXT6UalFpjqdMCJ
 EHhnhWIYu6HnTilaR/fC3KXMMN+CDEcFnn+bMvaGhVBnvPmH5+AHtBq3k
 BSZAYQqbiH0uqQEQb3JOykAxq+UsDIwviIhkW11mPtnhGKMRLnPIjo1W1 Q==;
X-CSE-ConnectionGUID: 7ygd3IjdQZO6JFk09PcprQ==
X-CSE-MsgGUID: wVowtFNSRB+IbL0fD4mwvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29329902"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="29329902"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 05:41:34 -0700
X-CSE-ConnectionGUID: ZZ6iF3Y9TgmrgXOZrSQHuw==
X-CSE-MsgGUID: 540QALX6Rk+ABBcSNv/fgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="50327179"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 05:41:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 05:41:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 05:41:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 05:41:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 05:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mteNSXY8H8c6aeGae793vw5AH7sfJd/qgHc0Pgkq4FqUgkTSyU4pqPHVPTeAWw4bSIlprE/5k1SaG8/IK8Lj+Hs2tqyQ+QACey6HOcugmKY3MdxWBCmx2FHBNZ483Ute09RNvYyZSPvGbu+7YWUQ2iTXj0UhPAeUIZx7kRaegfhM0szjUduYzh8LKVUw+XtQfDkZQ5mFrMsnFfclpYBOU+9HkZhJkhq8ABTR8Bbk0j6a09k7aEyH/WiuZF4emxnbkVk9bK7/3XMQ37X5EXZG6h9G0xdP6WbNWfElQfupWUeUBR/BkTK0MQYO8xyZmRaBypairVOEshUuS5V6tak6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvCP5WgsvmzdDOpM8FUKHGccN58DZdWS/40MVq2Wxuw=;
 b=YxyDJDgP8GeVavMOfvuWy3nqXjxlrMdfO0rxcLOYErJ4e6HlQI9OA5wUAdGZ9yfJ0mePcOzlaWAKA2IrobXF74U5H81RsxZXniOAxXjsIm5vR0uYgiuWJh+pH6U14Vp/WP91ZzaZ98TDZ1/b6hyPUt//801b2Fqz+FAeepW7M5O1jOX6BbdCoejFzCoxqD6EYRNgiGp+LxaTcRihqGrFePourADonDyBUvI+ydDSgV2LcBBTPBm1nbqihLHiSIv0PEdmxNWsWCbYEYyFIZ4+ollHXQOolZBDjNxSvjZNaYCFvPh3GcE9uQLhk7EMWBcfGg9a0NBvfQ6Pe3fYRPvNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7039.namprd11.prod.outlook.com (2603:10b6:806:2b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 12:41:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 12:41:30 +0000
Date: Wed, 17 Jul 2024 12:40:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/pm: Add trace for pm functions
Message-ID: <Zpe7ydKbfUkBpSGG@DUT025-TGLU.fm.intel.com>
References: <20240717112908.14394-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717112908.14394-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BY3PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: 337f2328-1f30-4376-87bf-08dca65dc892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fKMYLOvq02SecNJqkGNvzabL5Lfok2lEMVr8X6thsqJqZnwXFuenww8MolVz?=
 =?us-ascii?Q?pYUt+3ETxg4Vqi9aZW9OOuB/MTPCVbBgsQDgVoWjAFa/hG6wHhaf0Ee95+07?=
 =?us-ascii?Q?L8vqRMWG1Cz4iabPjhd8cfYgjB8HOX6agbGitUEDPlSiHVd3ILsB3GH4M0Pa?=
 =?us-ascii?Q?6w9LJbPUBnhA8jOHKfhIdSdSZQClscnv/SltfU21c65qBu8p7NKd6A6bgoF/?=
 =?us-ascii?Q?yXjEeY06q0AtzaB+zaF5ptaYuZYJbPO1TbNYPL0jKGmZbzAvnG94J2LTl9xk?=
 =?us-ascii?Q?2aJOCZVwCQ2dAsc0skTFf+ngsP83QwSAXuExtaP2LOLlARIKQ3V7B+qRsDWd?=
 =?us-ascii?Q?0UecAk/SgfX9raBqXBs6wQ3Pa3iKQm2gJFjGS2ACI+Exj6oP7eWA1VXuYVt3?=
 =?us-ascii?Q?dog+5f0mJ7UjXDguDzRoz2XH6v9m5qEDIZfoZrey1seFyaY1Yaghmb04HTBS?=
 =?us-ascii?Q?2Tcn2LIGBBGGVEpl8CaxXIAnFWsr6hO8G8jVx9PhskJBl1tLUzxJQWbKLbAC?=
 =?us-ascii?Q?sJ9RHT2OVfj5uKBzmKB/kCKg4xoouMCjr5y5pN5bW8XdSPvVwqphRGL7Nj9K?=
 =?us-ascii?Q?eaxeyTX/OFLi2eDiFJwcezjfZrPSHJ2Nzgp2J1CcFh3VKjq7gglkCs1mdQfn?=
 =?us-ascii?Q?WVYoA1PrvfwfNZuN7xhIOsjd0K81/mQJYMW2rhhinrRRmN1XnUBGcgV7TKwq?=
 =?us-ascii?Q?+eXdBOz4RC1IkOyjUxNShkD5RocLEpvaKz3QztpsLjpk+TXZhDjZlg1D1T2x?=
 =?us-ascii?Q?iO8JC9GEpxl3tzvdBetpdBk9M6Ams2VpMcheDoWYZMVQlb9SKIJKCw5fbzLD?=
 =?us-ascii?Q?fko+bh2WoeBP/jkaoIa1PmF2XgDCYwLrDgAvndnGMxL51aOJ+9CR5fVYznue?=
 =?us-ascii?Q?ragFcq/Kb/4Gy9jFpSPhjsiW4pQ9Y/Ih6uz0LGNmSeMuSqyefEExnYyPE2v3?=
 =?us-ascii?Q?8dkt5j0Vpyjklv33eLFpKVUGr2QNMJFfwayXfYcUz85Ei+GpmWX1m1mk3O6B?=
 =?us-ascii?Q?1sPWiBnUbYreWLX/UjbCke6qjaVBXLfyHRwaUMY22RL9updbxqXsXIZmK2AD?=
 =?us-ascii?Q?LK96GiQhwPExleQm+2vkD5+2VQ8PQckhJIUmPHSY5VZotbX3ExL5ycT7Nm7c?=
 =?us-ascii?Q?azfNLShrQvPKIpxe3507DeLat+BTV/yRRvKspkwM0n25FgsHH30Ba0mzXLmX?=
 =?us-ascii?Q?2C010YLKYCJF0W4t3qRP3R4FJtLoaMYvQELEDRBqT94UE6Z/wxiLRnUdRbNV?=
 =?us-ascii?Q?/CuGITO5CRLrI7MtcWMAw9bsPQlFZ9oo8WG/RHcZBJi6EsBgid/uC/qtywuV?=
 =?us-ascii?Q?TZmWjHuXJ/EHDnq0Ub/61qH2NRjj5Ig+jCnUCe2wFjuvHQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YhoTfT8ZBOEB625cct1Q88f369H6sDotWuH1WMB5xc3VMntc16QinYlP0gCE?=
 =?us-ascii?Q?qarEDfw30o20WqW32c5H+KCSUflbrSn8Wuypkzc97oT0E8T0X2fdSZJrMzQq?=
 =?us-ascii?Q?WE9h3C5yej/IyN/Hnrjg9hXa9OmZ1ROqX1IJKSIqkL6fZmA2Re5Q5QEjQisM?=
 =?us-ascii?Q?xmamehjBY4MXb7I+zKYj6E83TKEioZMR2GvjLdxffsIFaUKuVczuqsnc3cQn?=
 =?us-ascii?Q?9VoTGeoYUCT4sHxOQXIYPlST6XfloA3ujuddFVI8TxV6LSUjFhL80FEkhxLP?=
 =?us-ascii?Q?IotVZnYbcLBlzkVN2lSDkJvmH9bxscF/ZNEmU2V9X7mOqPjEEOqCKeBhPyfB?=
 =?us-ascii?Q?4R3q5pgKMFPoNzk7u4cZFjRY495YbY2F2VwNmOc3t1W84aMydVmb2WNmCFGq?=
 =?us-ascii?Q?fRwDPdv+7njRE6adHzrI+hbEqDXWONZ/SOcrGMcFjZZXcMg7XR4svBAv8X1Q?=
 =?us-ascii?Q?UUJ25bgKSzIDKHGSJUcSv70vo3T6FdZiHAwcGdc7zw6Eh9y1KjjVky6FSV3K?=
 =?us-ascii?Q?xubJAYDs7LaHfC/tmee2LS9nZkQIc8nH9uyx2qOrf8RXI+kCWCvoSGnTp+xt?=
 =?us-ascii?Q?BvsSpcODbRrItCwzX9IAozw35FER94qyosfbWL5ntNrsw9Re1/YkmgbzyqJ1?=
 =?us-ascii?Q?PaexBdObXafKsGb6C9PdJTD7jpyXkTn86QhSN0hZedqkzMjX1+KF3mvW9Trh?=
 =?us-ascii?Q?O4N/mL9ioYDoV3dknDAfAf2yxO8E5WK/fLTvEVfe5KxZGDrFI8C20v8PIUzi?=
 =?us-ascii?Q?HRXgbuNDrR+4CQj81a4Bej4Tj/x4W7JY4XbH3SPOu5C9w6spx/7Pz4fy/K6N?=
 =?us-ascii?Q?zawVHyk4fc4oyN30yinNkqRo+RvsbP3n2lxGU1fL4VcR+S8bYPN/RQ9ChguG?=
 =?us-ascii?Q?zRHyEVbmIJUZakrCzfv6AY5cZQ/UUVw1R82kS1HZewIkxUzsy0HzIC9upb9p?=
 =?us-ascii?Q?OAjsuQ31FYuOq0DGk9UG9vfIhlnFMVhg01oSSAWFml3r1XQbO+5JJVfPMo25?=
 =?us-ascii?Q?QNDm/JULD//Z6cLBxWenJijBwjLMihlAckwXG9rBxkNuRLAOjFQ9dcvZYJZb?=
 =?us-ascii?Q?W1q2OyFiZwE2YQnDb7KCcDbTxHCKzaQ9oPC9nnppKuIkZuETGO+lkQkkauf7?=
 =?us-ascii?Q?zZjXfY0NQW+QD+H5dtAcfQkiFZhFNu+x67C00UZ/BlCjJlzw9ShZdlsLX5PJ?=
 =?us-ascii?Q?wtjs9E4CfQb94+YeJRqTWL/cyAQ64dvA2y+IyYffQZ8pcIcEF+flby7jjJTc?=
 =?us-ascii?Q?RUWa3+zpHpySGlXmgUlrCm0qGn3VF5PvnoqAPD9E/zKPE9ET0BQez6N7LV6P?=
 =?us-ascii?Q?QuFVi1oXnor8MY3m8eMrnoBvDZ1zX9z2q6hX6E+c8UpeiLltKBRqaKO5te2l?=
 =?us-ascii?Q?EnP0gH4L0e12he4C23aYKO53ZayB7wk8BQ6noVVarMdmgn66CoCU6yoUKJGS?=
 =?us-ascii?Q?VwICnDYmnNKjB+pZj3DuCOBfFdM2bI+n93qyySN5g8VeAZu2HfVFPhSvAVeO?=
 =?us-ascii?Q?inbwvTp/uVIjB15oFqWeBECXBNAGONT+4+iJKa6q0oB+z905+XhrEnNEjdL6?=
 =?us-ascii?Q?s2NlheRH5zgzR4DFPtU+KZUCFZfcVlH4zwObs9iajfpmuFQ4W/uyJfkb1ySB?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 337f2328-1f30-4376-87bf-08dca65dc892
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 12:41:30.8080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybS6am2Y6XEV533kzzggtEqg4naCid2MTnIbgyXPIzlv61A0zvwNhAwpJloMbbMO/JC7/677qRKdIIbcsgMTlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7039
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

On Wed, Jul 17, 2024 at 01:29:08PM +0200, Nirmoy Das wrote:
> Add trace for xe pm function for better debuggability.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
> Example Output: 
>           <idle>-0       [004] d.h2.  3821.138392: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_guc_ct_fast_path+0x2e4/0x430 [xe]
>    kworker/u32:0-53314   [001] .....  3821.138411: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=receive_g2h+0x2cc/0x350 [xe]
>           <idle>-0       [004] d.h2.  3821.138439: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_guc_ct_fast_path+0x2e4/0x430 [xe]
>    kworker/u32:0-53314   [001] .....  3821.138443: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=receive_g2h+0x2cc/0x350 [xe]
>      kworker/0:1-9       [000] .....  3821.138474: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_ggtt_remove_node+0x1f6/0x280 [xe]
>      kworker/0:1-9       [000] .....  3821.138495: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=__guc_exec_queue_fini_async+0x1b3/0x350 [xe]
>      kworker/0:0-21730   [000] .....  3821.138503: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_ggtt_remove_node+0x1f6/0x280 [xe]
>      kworker/0:0-21730   [000] .....  3821.138540: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=__guc_exec_queue_fini_async+0x1b3/0x350 [xe]

Looks very helpful, I didn't know exactly how to get caller function in
output like this, cool.

>    kworker/u33:0-25711   [002] .....  3821.138601: xe_vm_free: dev=0000:00:02.0, vm=ffff88811185a000, asid=0x00004
>      kworker/1:6-21907   [001] .....  3822.308942: xe_pm_runtime_suspend: dev=0000:00:02.0 caller_function=xe_pci_runtime_suspend+0x3f/0x120 [xe]
>      kworker/1:6-21907   [001] .....  3822.309550: xe_exec_queue_stop: dev=0000:00:02.0, 3:0x2, gt=0, width=1, guc_id=0, guc_state=0x0, flags=0x13
> 
>  drivers/gpu/drm/xe/xe_pm.c    |  7 ++++++
>  drivers/gpu/drm/xe/xe_trace.h | 47 +++++++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index de3b5df65e48..a38452ccf033 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -20,6 +20,7 @@
>  #include "xe_guc.h"
>  #include "xe_irq.h"
>  #include "xe_pcode.h"
> +#include "xe_trace.h"
>  #include "xe_wa.h"
>  
>  /**
> @@ -87,6 +88,7 @@ int xe_pm_suspend(struct xe_device *xe)
>  	int err;
>  
>  	drm_dbg(&xe->drm, "Suspending device\n");
> +	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_suspend_prepare(gt);
> @@ -131,6 +133,7 @@ int xe_pm_resume(struct xe_device *xe)
>  	int err;
>  
>  	drm_dbg(&xe->drm, "Resuming device\n");
> +	trace_xe_pm_resume(xe, __builtin_return_address(0));
>  
>  	for_each_tile(tile, xe, id)
>  		xe_wa_apply_tile_workarounds(tile);
> @@ -326,6 +329,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	u8 id;
>  	int err = 0;
>  
> +	trace_xe_pm_runtime_suspend(xe, __builtin_return_address(0));
>  	/* Disable access_ongoing asserts and prevent recursive pm calls */
>  	xe_pm_write_callback_task(xe, current);
>  
> @@ -399,6 +403,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	u8 id;
>  	int err = 0;
>  
> +	trace_xe_pm_runtime_resume(xe, __builtin_return_address(0));
>  	/* Disable access_ongoing asserts and prevent recursive pm calls */
>  	xe_pm_write_callback_task(xe, current);
>  
> @@ -463,6 +468,7 @@ static void pm_runtime_lockdep_prime(void)
>   */
>  void xe_pm_runtime_get(struct xe_device *xe)
>  {
> +	trace_xe_pm_runtime_get(xe, __builtin_return_address(0));
>  	pm_runtime_get_noresume(xe->drm.dev);
>  
>  	if (xe_pm_read_callback_task(xe) == current)
> @@ -478,6 +484,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
>   */
>  void xe_pm_runtime_put(struct xe_device *xe)
>  {
> +	trace_xe_pm_runtime_put(xe, __builtin_return_address(0));
>  	if (xe_pm_read_callback_task(xe) == current) {
>  		pm_runtime_put_noidle(xe->drm.dev);
>  	} else {
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index baba14fb1e32..73fe28f92d48 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -369,6 +369,53 @@ TRACE_EVENT(xe_reg_rw,
>  		  (u32)(__entry->val >> 32))
>  );
>  
> +DECLARE_EVENT_CLASS(xe_pm_runtime,
> +		    TP_PROTO(struct xe_device *xe, void *caller),
> +		    TP_ARGS(xe, caller),
> +
> +		    TP_STRUCT__entry(
> +			     __string(dev, __dev_name_xe(xe))
> +			     __field(void *, caller)
> +			     ),
> +
> +		    TP_fast_assign(
> +			   __assign_str(dev);
> +			   __entry->caller = caller;

Does it work drop the 'void *caller' argument and do this?

__entry->caller = __builtin_return_address(0);

Unsure if that will produce the correct output though but worth checking
on.

> +			   ),
> +
> +		    TP_printk("dev=%s caller_function=%pS", __get_str(dev), __entry->caller)
> +);
> +
> +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get,
> +		TP_PROTO(struct xe_device *xe, void *caller),
> +		TP_ARGS(xe, caller)
> +);
> +
> +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_put,
> +	     TP_PROTO(struct xe_device *xe, void *caller),
> +	     TP_ARGS(xe, caller)

Nit the alignment looks off here.

> +);
> +
> +DEFINE_EVENT(xe_pm_runtime, xe_pm_resume,
> +		TP_PROTO(struct xe_device *xe, void *caller),
> +		TP_ARGS(xe, caller)
> +);
> +
> +DEFINE_EVENT(xe_pm_runtime, xe_pm_suspend,
> +		TP_PROTO(struct xe_device *xe, void *caller),
> +		TP_ARGS(xe, caller)
> +);
> +
> +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_resume,
> +		TP_PROTO(struct xe_device *xe, void *caller),
> +		TP_ARGS(xe, caller)
> +);
> +
> +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_suspend,
> +	     TP_PROTO(struct xe_device *xe, void *caller),
> +	     TP_ARGS(xe, caller)

Nit the alignment looks off here.

Also a few other look off in patchworks too, double check on all of
these.

Matt

> +);
> +
>  #endif
>  
>  /* This part must be outside protection */
> -- 
> 2.42.0
> 
