Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F28C28B30
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 04:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EB610E094;
	Wed, 26 Mar 2025 04:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xxb0TA5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656F710E094
 for <Intel-Xe@lists.freedesktop.org>; Wed, 26 Mar 2025 04:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742963523; x=1774499523;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bhu/7xYtli1t3MhqulAtQHq5CDVPfmP+yMhwoqmuVXw=;
 b=Xxb0TA5Phsu7pmOHoHFHk+GPINK9e5vFjE41Yvrdqhy2uisBVhV1q080
 VQaRaOx1b4oShZTK+eqC1zsvx+dqNiT5a/trlUlkJ/CCbTDhC93WbiRmw
 Q+eiIbKKGhyFnkVrA9r4udkkmRmQChXy/3pDZl1sYAXtjUoq4OqQIAeO1
 idn8CzMd17Q1noR+ThfaOvIZQKcLGO/v4LlULKGwDahsjPsOXUlmVraqs
 jEvT+2gLHHKbyJr0G1IUy92GnILsOAPsTiTv45uySU0hc/rxoGFkE/i3h
 0yLYyMCjR5wfi4TCSN720lazVs6bOaJA507deCMpwltjd8kgfR0AQCg0F Q==;
X-CSE-ConnectionGUID: 1oI7xYpLSGKCp55y5L5CJg==
X-CSE-MsgGUID: QXlQqR9GSpaxJ+1VWqUSVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44336250"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="44336250"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:32:03 -0700
X-CSE-ConnectionGUID: h0n11tLSTrOaghT9bj0TfQ==
X-CSE-MsgGUID: pDyQud4rRJeHahQmEAuXDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="124372018"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:32:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 21:32:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 21:32:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 21:32:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IO5RC/K19wZUEijnux1WDbPDjNhRkb3P8qQpQJHovzreFiH1BvvcetIlryjcjAmYdZEkWBvXmzK7EOuYAkTxwLwNEH6mHcK//qyonmiqencPj4q4wDuz0O0+tiGFedDqfIPqHdGfMfz6KK2OMJCNvmBxgRU/tDts22u0KldJ1vdxJRFJTsqqQK0jNsmsyxTqohpLoUOfSEH5jzJQPzg+6qmg7cqgqdCtOTw1JKL9GieUu5xNIZwQnMpK8xw5fGfpiV2yQm4CVNzMZ9qF/F99kUgGhw99hCGcXFdhsXeHbSvc17VUbO95akKzWFER7zxreAlX/azY21dThJyy4KMgNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0a/8HvqdEshiAIZmjGFDwhNID8lUym9uUxHIfvpe4s=;
 b=VVM3EF1DqYmhTxsMBbfk8YJ+efqvtCdheJaDQOZfqtlw6ejr/Rzw9C5pKMEs4TaBhm4JRpj3rheeW262fcXEDuLkFs88gp9n5KSuHHqLPLSxeHcQX62T71soNIKnFf1qD090N88PpIxG2UmokFh4Fw3s8teEUiykCXTnYkwVrWNfx5X7BuqrA5jfbhh1sAFmlQIWpS7pKEhCDZVMbk9WZSk6puiBEvhpkKCDWwSu1U+7KXnubUoUhnKqWP8x+QwcG7xSkp6W7mitxD5BipiHcKpKZdevP75xa1/RumilPTMWcpucw/w8ZoYSuejGyWug3oPAX0oo3bFuPYNwYui+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7342.namprd11.prod.outlook.com (2603:10b6:208:425::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 04:31:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 04:31:58 +0000
Date: Tue, 25 Mar 2025 23:31:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Re-word message about ADS size changes
Message-ID: <4ciqwfy3zbcmmvbc6akr4cpgr2fj43w64pvtvhjfd7npdpjrq7@4shklvog4qyw>
References: <20250325203211.3907890-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250325203211.3907890-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4P222CA0027.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9344c5-3137-4ce4-2151-08dd6c1f25a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9M2Rt2ntEyEAes0x3kyU74DEMqmls4yVlVeBeuUbv0WZVnopNy8yw2wemsnf?=
 =?us-ascii?Q?RMOhRdIXEsJPVkl96hFoVwuE7nTKHi4C99o9OJydMmiI6ciI6RRU/yws6V65?=
 =?us-ascii?Q?RqL4VETbm8i5LJjIdCYX10sXTOnW6uhONwqxeTpMYZAJ/Ls3yfy0M1uq91NV?=
 =?us-ascii?Q?Ehw15QG2XZ6tTtdH1BhGZa6YMNC5O2aA6METJo1pI1N7ZT2bB+ah7WdImlV7?=
 =?us-ascii?Q?mqL4R+/OuHKVVXYLHb6eXFSwLOwGJ2gGPTRRM4vydaqW8z3ZKhSLzkZngW2r?=
 =?us-ascii?Q?ILC4GeZNC/2PQe31rWj5RcOlZsukjaaorDmvpYlVC/iYq5gOXxeRI9mnPRuJ?=
 =?us-ascii?Q?KRxWkpEQ3lAbu1vPwq0ZkcA5ayAbnvLXtFnv/0211MbxmRPiWl0MoypB1TpK?=
 =?us-ascii?Q?GfEY9TeW2m4LGIDruNscmTXDOK5kvt6zgfDHl3CkeS/BlzT+WOVXt/pRGM/W?=
 =?us-ascii?Q?UGnpb2AZ3r5gsJyrx+fW0MHBV/Pg9COy0v80OALKTvdBAftsxN0F6xRZVkkV?=
 =?us-ascii?Q?QzCYYyOCYtOB6gWywgcuo7EtiX8zjDaTwQBr2Tfm/tumRTs5lvU8HVmGLt+1?=
 =?us-ascii?Q?+jWPTqdKh/18Ot50vlexhhIIXIOnn9sM+sl75iwmIq0xNG+pAFuYnWhosDM2?=
 =?us-ascii?Q?F0HLd1I3KaSTng5KCzNyVoZmf0o0ePy3xwbRiZswj3pK/+7YPNBDB0FTJ0Zk?=
 =?us-ascii?Q?D/HRriKKZkOkm9NfI/NfJZ0X6FWljWQVdXkCfUNiiqJExx7P6adVfw/kBKmS?=
 =?us-ascii?Q?AqVEMCEORCiv6GQk89xMBDx7Uof64805Ndx5mypNEm1tT+GzcDEAG34C9BnW?=
 =?us-ascii?Q?dolCihiT32E3jfaflrCwtC2hZBHjTijNAiGh3z1oDC99OBjcY3IrcxZUJJ6w?=
 =?us-ascii?Q?zjXc0Q3oJz4KMfJ8gZqlLIeDt/PBQhsoVgBD8xta4bV+mszl2mda64YWK34x?=
 =?us-ascii?Q?dqoWiuczk2uc9LZS1aiw6WchrXi0uG6rANzeW4QaXo9M1x2MnMpnR7Z2ZNR2?=
 =?us-ascii?Q?q0JlQYwVDzxt0ED5qkDe83r1NAjmqpG2UcyJCAyh/JOMR9ZemQQulJzKxRv7?=
 =?us-ascii?Q?rnaxrWrTV2DTUgMHyTpCNBc2oQ1iczOt8xY78vfBN0Z2xCOsun+juG0CpZ+6?=
 =?us-ascii?Q?xBCrRmC4JLTEz7YfpGXBEegYz0oL3oOYh1zCNKx53FSgNItjgmQNu6YZHoOd?=
 =?us-ascii?Q?pk4kBDNe2AgQ7VBRgfW865bYVfINpzFKxD3YjQ8QSa8pUnbC2GKeSnAPIiTy?=
 =?us-ascii?Q?OB2XOoINbGDuqGTj0WHKsWLFq6eNI635MEq3ydKA3OiCk+p4p/QrqBltYKy3?=
 =?us-ascii?Q?+NhpVCkeMn+PPqS74vruI53LO9IXN6BBYBUv/7/jkC1iaan3L3w+Rur1l68N?=
 =?us-ascii?Q?2ZNNjsXycZiUpNzSH8P2B488nhLY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/+LXhBt6kiMwdE1mNKUIqc0IwdCPOqFM99j2kA7umWIvEfrhXYidXruXgUz/?=
 =?us-ascii?Q?GIo0Qkv/5WT0kRKmBTczkQJBaNN0FzZlVpoljScEQW/qLcdjdbbYRpX8EmzA?=
 =?us-ascii?Q?qKs7Q+F+ojoly380N5KEDya7DP5ACXGbuEs83DM3vN7Hh2HMDIfBzZBeq1IH?=
 =?us-ascii?Q?oV1pw91L/O+OUr6kU07XDpSoOZywBp0xRVJyLgRWUo889vmKSf5L+uDWvhZ8?=
 =?us-ascii?Q?2I/n++NkueFHOl8UPwZ0K5hssmkQqwZVZ5Qovdrw9vPBcr9YwXn6NjBLJaya?=
 =?us-ascii?Q?FNn6qIGy6G/pkdYOy0/GYY5bbMCJgfkme5JXgkzvx2+zjUr3mXbHyg7M84wB?=
 =?us-ascii?Q?WtPs3t2aGB5dkZB/E9FDKi2Wbk8S+fFSA3mgGC20OgtWXhy0STOJog3SEgV9?=
 =?us-ascii?Q?0A/XCeB+/b7FmWx/ahXPudVVC6qQVFvzoqg/zurIKfsjY6Eg8Xq0AbGzxLkO?=
 =?us-ascii?Q?GRUWKyiRzVttvAEFtd1Uj55zJk+xjjpxbU4Q800NyUraJ309rTJveORuKOPp?=
 =?us-ascii?Q?RfeyxsY0m+ylnavPnHguaIIwPL6Go2g0Qo4H61WHHXQrOYBu4BZkxJC912Ja?=
 =?us-ascii?Q?tzYK2Z+of3XYs4qCORK/Lq+x6ixlmPq0S64c6K9qOxMernMGP25v1kSMNFkv?=
 =?us-ascii?Q?+fvsVkCl6i2VbkIw1WiRWwbpgS+s6fB5vTPeTjjKWsBG9UHlrFrAAW0AJefS?=
 =?us-ascii?Q?H3w/mh9AANDQ87PQ2nmczyLJQ71x3+rDnZUO875TyhyNGbSDpCOS0YH9Ktny?=
 =?us-ascii?Q?QpcwB2HHOykjhJ1Ki3kQn34DcKGqNu0rkMLf/S3yfj3qT/C5sXipxLCyOgAB?=
 =?us-ascii?Q?lJ+P1jZdSFW/AKe1eaRMphtBYtVWL4nn8RWeZdXtkteRhrQA7eODAxu4nW2F?=
 =?us-ascii?Q?nW0v41K+e4rdMKclxl1tcy0/XyqIGimwWCPPlPy12hwGleRcdv79OJv9TKPz?=
 =?us-ascii?Q?ypg0zanMC+GPrIWonY0OXOcnX1/+JvaZtTYPgfGWYv3IJmMZcTyLCeTcEqi+?=
 =?us-ascii?Q?j7X8bsLO2BUTEGfUDDR1UnjyhVEftqCEK4wK/a/j0mLs2e5413TDfMaVM3F1?=
 =?us-ascii?Q?AGimXMRRQWwVk61RM2BEaHwl/aOsISGpXOhUi03xuKB0zn4hNbFweLWXbajT?=
 =?us-ascii?Q?GjarD7F1sKYZqdX1cS9aJgun2X1xoa7k9A18oq5Ylg1Vf+9qwbtiJqvpzE3R?=
 =?us-ascii?Q?WbJjh0a2muS9BzrwVdmhG9FFzamEPTMYO7sw6GgfwPqa5vAoZlKF5bMmc8xk?=
 =?us-ascii?Q?IoHpVX/JNWNU+pLQa3wmDLpGUUcYlwYluUQvEcKOUSTiS1brw/TR6uTC9SBd?=
 =?us-ascii?Q?fVWaSr9sNzkldb/rdKSIx0pOGWNG67o+UaTpfsrP5Xyt0Ig98qjjfKUOiRSc?=
 =?us-ascii?Q?pW3pTensWlv/pRAcxcyg8jBZU9q328kDG24lLulmexhT8nnCnOgh3dbLfXia?=
 =?us-ascii?Q?8LHOXxyiXsLt8UV5RduxSSWJ1aZ/jxSyH2KQQjHmckx8FJ90lt0osrQePHMA?=
 =?us-ascii?Q?EnPqQMBigt77ABPQgDJCCHHvEfueeugw7G1XjLnL9aNYKWa6BTva2NAMGfWP?=
 =?us-ascii?Q?2X70Ynnsx8Oz6xUHhQYQFSM0ZmvrftKvbBQfV1Z9BPZQQ5oPliXPzlvnVG/r?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9344c5-3137-4ce4-2151-08dd6c1f25a3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 04:31:58.9306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zKGOLFLkDQA40ll2UW1JBEpT9q0fmpo9GXkWUaEekJ5sYrgyIGFC+Vza6feV18CMIywYu+ERIG7Z5PTTNxbmDiMw3BHorVFnipqXXqgn3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7342
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

On Tue, Mar 25, 2025 at 01:32:11PM -0700, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>The error capture list in the ADS is initially allocated using a
>placeholder size. When the actual size is determinied later on, there
>is a debug print about the new size. However, the wording is such that
>some people see it as an unexpected thing and therefore a potential
>problem. So re-word it to be a little less concerning.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_guc_ads.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index e7c9e095a19f..bee4e0cfe7b8 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -682,8 +682,8 @@ static int guc_capture_prep_lists(struct xe_guc_ads *ads)
> 	}
>
> 	if (ads->capture_size != PAGE_ALIGN(total_size))
>-		xe_gt_dbg(gt, "ADS capture alloc size changed from %d to %d\n",
>-			  ads->capture_size, PAGE_ALIGN(total_size));
>+		xe_gt_dbg(gt, "Updated ADS capture size %d (was %d)\n",
>+			  PAGE_ALIGN(total_size), ads->capture_size);
> 	return PAGE_ALIGN(total_size);
> }
>
>-- 
>2.49.0
>
