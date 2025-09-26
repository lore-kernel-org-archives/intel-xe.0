Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7363CAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 20:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB9E10E0C4;
	Fri, 26 Sep 2025 20:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UO9pmAlC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3218C10E0C4
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 20:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758919182; x=1790455182;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=auL0NffTTY+sJrX0MDkM1amdHdZtScZJPgYmuaZ2D5E=;
 b=UO9pmAlCZuj92OuEtFRELWcD9xyGkk1P8ImseMF/h9hW8lH2zdIOUHJk
 BA6Uw1sMcAU93ni2IE24bTISTipk96UqAI7Cst5L6HAwDs9Uu10rDCzzH
 6kHeqMZALBKBPMQfgoybFMiqgvms96gSRwf1YuewPm4fYPkeG8fUKQVfW
 9OUZEtc1JzbL4qbg1S6GE8fUGnIgN98PF0AHH5dT9fan75OQc6EISOqGY
 jNDfzfzthFug4ylKverdH0spOms7oxTNDaEdllJSyqpcQJh3A+AdJ+oFM
 BXfMyeICAvBTA6cbU4G8Macm3H1ktWanx9b+1nOxeGB7nZhVXgjMpUiJG A==;
X-CSE-ConnectionGUID: 4qbN0PvqRnqy5UoKG0YAvg==
X-CSE-MsgGUID: 3HddH/f3SX6ruYopcRg9WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61147781"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="61147781"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 13:39:41 -0700
X-CSE-ConnectionGUID: 21U30sphSrmbGDsVbTlksg==
X-CSE-MsgGUID: Iih9Y+vVSzWmZ1/0RErHvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="214839350"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 13:39:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 13:39:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 13:39:40 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 13:39:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYvS50opwv0VXtgxJkBXHNw+8p2mtokUiaUvF+30dY3ji5x7bYrur8W8EOYUkEhSH1Z/8T9GBGy2PvHK9O9zr5MV/1Ks+CAktgULRSMagwVXvt8H2+OicUc85DaEkqQ8ExSxsXJ8D8fmqRU5QF0RNAfbPYZjA9zskylGeTnXfRe8WfLIA7lBMtr3Gj6GQ1fdUD3BnpJ24ijNu0Z1vy7u1UQOdDBlXOxJ3jlO5O0GogsgemYV+3gUWM5elY9VAFrFjsxDD7Eemjf5yi6OW9VyhzoeFvm9PcutHCdk3TY7UeHhPWqlj70hiraDiFsFWHWwkv8/O/o74QAs0nkVNzphPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+wrlILTb1KvTCJ+0Ksd29Q8FfxQsDC7mMZG45bjbWs=;
 b=E0g/CZvD8Vu7Xo62C7WQJhVQLns6YmFQ4J5T4VdzRJYh7/KL/kKor35QjO/A25aFb4nH9vpQuFUvKHiY1eXeFQuIftEDwvSMPUJNx25K/OLYkA8zTFTumYiQUxX/re96ZwUqiKWH2bS9qVv1q7SgMJP/yWAfEAY9R0QS1cHelxl/T9V/N/7/OW6RJaeyMUTpYqCWIHk2prH44QPgNvMcex2zddi3Mo6XMHYybbEJ0oHqZjZF/kkWu8dUZjjpq6G7PpbHPPJSUVKVL8rS7qny8DOPgRqiG1yLH3mhGFUm5/+eRnN1l65sGUSnPZETGGsRrXz28/Xp3EdcECVluNtmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB8854.namprd11.prod.outlook.com (2603:10b6:8:256::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Fri, 26 Sep
 2025 20:39:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 20:39:36 +0000
Date: Fri, 26 Sep 2025 13:39:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aNb6BUTmK3rSrNY5@lstrano-desk.jf.intel.com>
References: <20250926131437.2228555-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250926131437.2228555-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:303:16d::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f06465-bc0b-45b9-43d0-08ddfd3cce5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MObgY4yNi8st1CGFdNTHG3sbcwo8w6InImW0HS0jroCM1+8uqaKsRM2UVZu3?=
 =?us-ascii?Q?wypSOPQG9TViC5aeNiqv6QUqomrVUMOamPMBK/N5DwBEsEqRWfTLWWY9s/CI?=
 =?us-ascii?Q?vqHT9nIEmmzjpiZQhnhE7bp/tM9mREPCBdgfMP8CmFaI0VJZtCrjmgRLzf0w?=
 =?us-ascii?Q?OXP3VTlyyKNL1EbzWejZDTM/z1b6hdKzxjAOVPXDMxFJPIO/imP2UGyabPAW?=
 =?us-ascii?Q?/eEN9j0fvMrs83DPTkkUBd2v8uRHu6smJwBQQePv81Tisoti5mpjqysIUFXi?=
 =?us-ascii?Q?KQk7efZUXmuIsRt+R/hiUKZbL/KBmAwmYo1H8HkjTpISGE/l0ssJBiCNGa2a?=
 =?us-ascii?Q?9KCrJCjqmkzOGMkNKNoaXZMgryZ2XGcH/6rNjD9Xwf/cImgkP+ZX7AzpC55y?=
 =?us-ascii?Q?UV51EVpNGMWxQe4b5GwJNMH3v1fO5zc0g1AW7BUGegNpyDAlC47HLogXNyOQ?=
 =?us-ascii?Q?NDQnfBynI0EucCOrDNCJIOU/qXAYD2eKyH/PsTNuSQ+dLHhaXmssSejZ4gku?=
 =?us-ascii?Q?wW2dBNVI8xJW1s8fK8y1rW2jQbeVxm2omYXO5YEDe8N94uKc+sBvtl/Nz2Wk?=
 =?us-ascii?Q?ZJwOoGr2np53RrUId0XhOdD/avu78Qr7TjBq+aYFZGGBFp/EqGbO1g3K/6ch?=
 =?us-ascii?Q?YE0yE+XoPT3jwCHr02EY8jLRlNPowmsxA3bnip/fG4cUxY9qPQFm7NnnOAuJ?=
 =?us-ascii?Q?6iL+TRIYEXjBnWRVgDDsWuv2zHdAlmSRW+BWZQR0u/JGcOc/DjllMGhWGzko?=
 =?us-ascii?Q?WQXzavXb/NWgY0x8ZsTtHnz2o4qIjesKSjM9fo60B0w7iZXfrRuJ0QqqOGhN?=
 =?us-ascii?Q?3yDD1xIR40z3GQUNa+mdzJlK9RO08nFT1vEhe9DZ1bz0OBGmmWf+YyIxUsZe?=
 =?us-ascii?Q?qUXGeRakw9arvgmOw6tpEaaF1qfro0zv0svDf/8v73lr0HFk1PYEbG4FAGtt?=
 =?us-ascii?Q?yLW1c6cNObFMIsFVS2VshJ5wGlsSuJMY+WP+cQYNhAMBIKi4ub88z80mNcDj?=
 =?us-ascii?Q?2pKjCd7xdQ+9q4f6SnkyuDvEbHXv9trHR5za7xe6r1md6q5z41BSMMdL/at9?=
 =?us-ascii?Q?+JsY9LTIO+8tYxNLIQzBUZYA51Shfu/GCueZSxd5KirjfRsbWpuH9vDf4efi?=
 =?us-ascii?Q?AVnbbuyHJQU24rYOpFcjbBV34Bq8mpYOfCpaCe2A0BMXI6ukmAKzofFUhldE?=
 =?us-ascii?Q?xtkI/Lk19kzSc7+//y6/KlkVBMsHkekltAZBO8QNlRYZzhc8yQW3C8fw3XVD?=
 =?us-ascii?Q?00BGapuSSyzhWv0cRrLObLu9q7vCNlLPo5IqfxS8x/iY9K0BLy7Obu1MVO2H?=
 =?us-ascii?Q?fs7d+qBOXKRpKmrR7wIbwAQndt0qEdr1unzFYWm6KISJP3woFIB2DPchCUmz?=
 =?us-ascii?Q?SD2MS0Z2MWnN+AlXvbL7zORHlGrCC6+fm5jlyJ0EFonDhneSmhfg81Fy8cAn?=
 =?us-ascii?Q?knXazhmJ9eXiee1k8CevvaueXxd6vfTn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ZQRbrZyWlVbBAph/p2VyHMBi8OE+uzm+rszDjYOtNJOiC9xFzM1MvtaC/dL?=
 =?us-ascii?Q?g77CZ+G8KmseihE2HV58BIHT/gowrtxYYKfCH3ybuxe3kB6iB7cvW3A9WCw2?=
 =?us-ascii?Q?+z8VJuBI5ltCoy/iJgoo5Ue6IqoMBH42EQCfkb3lRAu6kXU61NEKxcevm8MF?=
 =?us-ascii?Q?borg9klTrzRURWQA21vD3Ko7rbX7wcKqOS+SwfzyOLA8c509hnzB7aWvlJno?=
 =?us-ascii?Q?k34Acjdjm/RYavt8HLZhVY3BI/UUJLUr0pdX95BOHXmgO5sPcaN/2pSuqcrR?=
 =?us-ascii?Q?G3JxzMdDcBctg5WWO90deIgN/JsTsO3KK8VQAoyqySpqYTNoc5bm+raroVUD?=
 =?us-ascii?Q?CczC93zN28C1BJ+i2x1A3wWTcrjnDCaPDaeXuylObAYTAMhnGdS21EOaDd8q?=
 =?us-ascii?Q?sdhKY1nbVPfDj83HQtGu3FvjUhBdwfZ7vAVjgtufObADCp/VWwLxYhmhD381?=
 =?us-ascii?Q?urQjVMfQDsKMzine7HdWWKra1eYmaNtZT9RD8eikvp+Od9Dp2FY9alrNcB+y?=
 =?us-ascii?Q?lEbp/UYdDgEPo024cg2bSnqzj5aHSwSLB9E17itUxQKaFtS30vp8qZc8Z3Jn?=
 =?us-ascii?Q?MaZhe5OBskQZepgEe90K1jzaYvJz9UtFj99Jcr+b5J1V9MUZrPXlq0K/WLGk?=
 =?us-ascii?Q?oactr4E3ZP52RkPVTj8W5apyLBZZJ+hdLpyVOqn0RMUUYhgM+G+eyc+SoMMI?=
 =?us-ascii?Q?Bw3fsyj+IbmewTsETwNXUamPZkkhyvYagQ68B09MIkkDEUe/PC3EVWD5VcgY?=
 =?us-ascii?Q?hciyrGPC/rWpPPVtPvqUy2uKAk+4s6jHKpHxn7wfcsBFCTUIH+Y32JB0A3xf?=
 =?us-ascii?Q?VhooxwV7uY18W+7CyKT9w1chizvKFZL75yhKQFxMVjoXLQkFqWWJbFqWm1QG?=
 =?us-ascii?Q?QkNYS98OO1x071BrTjLBq/x8gDpKUWG69tqsbI5eRVgWjRch7/iq3nA+LITd?=
 =?us-ascii?Q?2asZFlaic26dCv7wQ5g2brN/GLA050VTXPKbcj1MZMAGmNYELXPlfZ1zUYX0?=
 =?us-ascii?Q?rWoNm6cbQfvh0IUhuxdGyLe8Al3sv4bZLGbBBktJ2BB9ZlBanHBJ01f67WK3?=
 =?us-ascii?Q?GrFwh2BoZVTeSnazMLUqNab0lKq7H5y0T8kix/HcgW34GHLEK9zEF/C/Wp12?=
 =?us-ascii?Q?DlcGY4n/u+Br0YuszglG9iQsjQBvmLpes1n+bspVjoV5lnzXu6oZYdL0TEWT?=
 =?us-ascii?Q?oAInJspJQ1mXckTpu8nL/ZK238xACMbPLS5qzJbHXqgZSXMjaDiY1uiJqHdi?=
 =?us-ascii?Q?obhfDcoXaxMDjTvZv5KiEA8CGIHkjpIDyumR3ishC9M+PyiTFb8zBuLYwz7H?=
 =?us-ascii?Q?AWSf6ib/3sxrk9ncjF7cFLmCXIOP0SNu+AN1zgiP90lw1fVx+LJYjK3lIwBQ?=
 =?us-ascii?Q?ctC9FAkHNYv2omOkkBkHP/cC/YtRAxbvIMM7zlTzyRjBU+Yda4VNDrDaimD0?=
 =?us-ascii?Q?GEZ7+XmevY/UnSAFuSD1rmMpT+vGe24zfy0uvUl48oB5klXw1Dnei4fJJBDc?=
 =?us-ascii?Q?0IcVlPDO4RJdmwfZGCzSxl2N71ESL5BZ6j/0X25iZX2DRN/4x2BWCV+RLiDK?=
 =?us-ascii?Q?XH+dHj9P4rfOitdDXnstSQemh22xjPw1MI4cHNq9sXguXZ+LqzHH47nNLJ7h?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f06465-bc0b-45b9-43d0-08ddfd3cce5a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 20:39:35.9960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zg9Lg1SmrCL+J4NKH+FA3PempBxtscLZDnrG9skuJsSX0aa44XL/EFD5Hp7L9b5fXBw2sft8gRK9zoodcUQJHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8854
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

On Fri, Sep 26, 2025 at 01:14:37PM +0000, Satyanarayana K V P wrote:
> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> save/restore while this sequence is being programmed, partial writes may
> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> instruction to write the sequence atomically.
> 
> Since VMOVDQU operates on 128-bit chunks, update EMIT_COPY_CCS_DW to emit

Also s/128-bit/256-bit

Matt

> 8 dwords instead of 5 dwords.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> ---
> V1 -> V2:
> - Use _memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>   (Auld, Matthew)
> - Fix issues reported by patchworks.
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 51 +++++++++++++++++++++++++++------
>  1 file changed, 42 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index e2fff2107f68..88ed4d09a97e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_migrate.h"
>  
> +#include <asm/fpu/api.h>
>  #include <linux/bitfield.h>
>  #include <linux/sizes.h>
>  
> @@ -644,18 +645,39 @@ static void emit_pte(struct xe_migrate *m,
>  	}
>  }
>  
> -#define EMIT_COPY_CCS_DW 5
> +#ifdef CONFIG_X86
> +/*
> + * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> + * save/restore while this sequence is being issued, partial writes may trigger
> + * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> + * write the sequence atomically.
> + */
> +static void memcpy_vmovdqu(void *dst, const void *src)
> +{
> +	kernel_fpu_begin();
> +
> +	asm("vmovdqu (%0), %%ymm0\n"
> +	    "vmovups %%ymm0,   (%1)\n"
> +	    :: "r" (src), "r" (dst) : "memory");
> +
> +	kernel_fpu_end();
> +}
> +#endif
> +
> +#define EMIT_COPY_CCS_DW 8
>  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  			  u64 dst_ofs, bool dst_is_indirect,
>  			  u64 src_ofs, bool src_is_indirect,
>  			  u32 size)
>  {
> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 num_ccs_blks;
>  	u32 num_pages;
>  	u32 ccs_copy_size;
>  	u32 mocs;
> +	u32 i = 0;
>  
>  	if (GRAPHICS_VERx100(xe) >= 2000) {
>  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> @@ -673,14 +695,25 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>  	}
>  
> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> -		ccs_copy_size;
> -	*cs++ = lower_32_bits(src_ofs);
> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> -	*cs++ = lower_32_bits(dst_ofs);
> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> +		  ccs_copy_size;
> +	dw[i++] = lower_32_bits(src_ofs);
> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> +	dw[i++] = lower_32_bits(dst_ofs);
> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> +
> +#ifdef CONFIG_X86
> +	if (IS_SRIOV_VF(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
> +		memcpy_vmovdqu(cs, dw);
> +	else
> +		memcpy(cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW);
> +#else
> +	memcpy(cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW);
> +#endif
> +
> +	cs += EMIT_COPY_CCS_DW;
>  
>  	bb->len = cs - bb->cs;
>  }
> -- 
> 2.43.0
> 
