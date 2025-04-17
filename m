Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E6DC369C7
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 00:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9795710E163;
	Thu, 17 Apr 2025 00:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGLR/Buw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A26710E163
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 00:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744850031; x=1776386031;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wN3Ys/DCezc54Lv+jw7goQ0nL+HAbjmH0R4KmYtRi38=;
 b=mGLR/Buws3bUNdKTW1OBPaQN58BhXTRW2YltgHVmNoSt4DGF28NMfph2
 wdMdj6kqwKz0n4tWZHu+tioRqXx68VafT9MyksS34//a3GLgkMboaBDLD
 eVwhaorTWDtctMLHCm9oKMKqA3Uz9miGbn5f9GyHDt+OCyFwxzeFsNyEX
 9NXjuWCviM+1Rye67S+youBDgU7Teow+HNcaPOHy10pZfxB9/dWzEXIJp
 EBy4SHYB/YIJDpl0KlZbBIcfFGVV7WUhJ0X37wSN/rWNSLRslzyrr5rPA
 FKkuZ85EQ3P50Pgo849h9gI8jDixnl09ihHzAKAzdXcB0VZyZXiKgBVUw g==;
X-CSE-ConnectionGUID: o1JdbJDvSKeynbw4SvaEMA==
X-CSE-MsgGUID: UWNRyzd4QKqY+Ea4HqtQ3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71809097"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="71809097"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 17:33:51 -0700
X-CSE-ConnectionGUID: NTzrtd6MQV+jNbpZu4PK5Q==
X-CSE-MsgGUID: J6ybrpJdToWqqADDlTkj+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="135496332"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 17:33:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 17:33:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 17:33:50 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 17:33:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUxH7P05MjSwlSI8Hht4ItEZadF57/QBdaJA2rzIP+WQIRcSgJlHCfvrmJ6ELEeCd685aJ9/YgDFLnuvDaldR6xLUTp6/KxAc/wU/C0f3sIOiWGSFop8hZJDi/TM0jz/Pj8CRfBTrR/t1ochPUlcVYU16ljTZWTy0hEmROIEeEhWrUOqTXmtIaHWHuLp9VKOup8G47xzZ3hgAAwaCrjpI3gXnoqeKCtlykwrimEabQRR6dxbaEDrMwP4Crq6FdJuHnJ24ni7lXHRdCwdGp9jcBMMvuhGbRAhqN7puMOVVSYKJ+yh/rLnlIhewHmdOly2V1ZZEIT1LxE4aTqwi6gXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENH98lQrV+jmFAd+jpQogDKQIOsfm9V2vYDdJV+LvCs=;
 b=MhaIt2ux2R/mTeJxWNROw/q2vnx3tY1JV4uEgJsTxre2pD2WBjE8OxjTfIE8zGXaYG8xoqujHc4aDRGtonTSgN8aCpN8Nn5T4r5J4SPG1+oCArl0Ul5wBJTyZYqMYW1sFBfJk15cDrYiXtxRs78jMk3Dkf5urzzyfUPYTwtMp7PJWyCqOAU1hYsP71AxkyhMvKN58lzv/URmA7l3oKVKnFyR5xcPobTvxPUPrny3d8vHH5wRJQCzVi4R/D+ECtuzcSw8atAW0jRHYqOtjPGudPumeiy2oeyh/GcgAaq65RoYrvqtBIRToW/ABkC6KCCzPghk078CkGSiMIl+Tk9ARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 00:33:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 00:33:42 +0000
Date: Wed, 16 Apr 2025 17:35:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "nirmoy.das@linux.intel.com" <nirmoy.das@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: Re: [PATCH 1/2] drm/xe:
 s/tlb_invalidation.lock/tlb_invalidation.fence_lock
Message-ID: <aABMtTDyjHy0RSpL@lstrano-desk.jf.intel.com>
References: <20250416183032.70948-1-stuart.summers@intel.com>
 <8a326233ac40dcaa1e63428ed4e88d5b94d55845.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a326233ac40dcaa1e63428ed4e88d5b94d55845.camel@intel.com>
X-ClientProxiedBy: MW2PR2101CA0025.namprd21.prod.outlook.com
 (2603:10b6:302:1::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: bd236237-34cc-4943-d5ce-08dd7d478162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DfeXOeTOvK3Fd2yNf+OAe30WJoL6EaK3GEN3SVAL0xupvz3Zy77Cd9jOoN?=
 =?iso-8859-1?Q?tr7A9px/WokCJ1f/ZsKSgob2o0+d1HGYCuIt41c0aZpPk+3pTphglKRTfb?=
 =?iso-8859-1?Q?BPBqUQCMqwkmHfez66jCxB5wF03ASTjlja9I44+MF8wijsosi/fjBsuloB?=
 =?iso-8859-1?Q?f4PlW5lgevkHefIM0OklYX4h9/bkiW2GbofVbHRfavtIiuTdIHtdA/zrzd?=
 =?iso-8859-1?Q?frIANT3HDNFc3xEveGs2OPCpZw5E8PhRS2gpwEbCP90GicFhralxdS3Oyf?=
 =?iso-8859-1?Q?ggofhF5W2d2U4kR6S7twQy6XCIAnA/ZauFR6VdWzDJ6vuRyIZNL/bcSx0P?=
 =?iso-8859-1?Q?qVpk2a7jtkWnTwtmA0qqUlWyIjwOyItHaJxwTuweR6+3BouIiGZfpq7Raq?=
 =?iso-8859-1?Q?rct5WsOOEisxZzmHdVh2ACLmLz9x4EDr4feSxxOPQS2mFMYkGPVee27KI+?=
 =?iso-8859-1?Q?pHOFM4SVc1kxCJZQq7FgAgsyUCsu9ZmzU5hHgZ7d+SwS0ljg55NRHrC5g1?=
 =?iso-8859-1?Q?vD7WQpHDeOZO9cjGXzDY1NkWo/0owRwE64cwrOguDKtF8OXC5Md6fRDbDz?=
 =?iso-8859-1?Q?e+r79Du+tBr9x+9Nr7OW2mDkSRWmcIUXiJqPVNNdSzdptYJ9dyEWfxWr88?=
 =?iso-8859-1?Q?v9vuVQ9F0fBaL/VNKVvcM0i/GFrBpLC3w/C6Ky3byiy46aquUEXPzAk3Yk?=
 =?iso-8859-1?Q?yLcWDTfQdCSsDVC1QkaSitpj+UxetxRAFzATvB9ABQSQBNSHmescOd3OYg?=
 =?iso-8859-1?Q?cideZzh6w3tzntTwpNJqhOcrIfhu6ENOrdIKGDugcwBqL3zTrSrHHEH/vA?=
 =?iso-8859-1?Q?CgoArUbkwaVldd03HPocN80B64HrxvoGcVFozm1pmGg1jtaYihSzcnHZlC?=
 =?iso-8859-1?Q?VET1qNdflsFSpf21eM0uCylTGS1DhnhlsUqWoV9gueytqT1S+aE7pE0V6A?=
 =?iso-8859-1?Q?WompMijEbT908O2LDvTE08ZbXhlZlYD9WE1dvL5+pnqRxz1ZB9pcICZH5B?=
 =?iso-8859-1?Q?ExCGEQz74oYaRseRNo48o0kth0sA7M6UuNl/DjNtGK3Y4DMZw7A54y43mh?=
 =?iso-8859-1?Q?zyCnp5CbIU95tVufL7I8L4VEUcZ6qvq4aOszOatPbWbEysHtY+qmlVScjB?=
 =?iso-8859-1?Q?axa2suWKQqTu0DGVwmPKoCJPt9+c5VBOrAtLeKjhaeJSF6tXfs/kfP0WWr?=
 =?iso-8859-1?Q?0p29hskyrSQ5zopoq2HHi+MBRqaY268hPFNpkv6L7ZBiyCYMMnI13db/sT?=
 =?iso-8859-1?Q?Edj4Cpia+ExjoZZEfeB9HEG3WEfHNsCBxzmndow9KWts6syoa8gN1d9xF9?=
 =?iso-8859-1?Q?oGm+NFqRvLKIDw3xgqLXtja7c14SG5LkbtI2i24/d2XpkNhMrmnTj5xVOd?=
 =?iso-8859-1?Q?tZ7eF+8pGby6rMOE9+gJVKE++fxQZocm1AOqsTs0DDGT9nLSGec/N9iN4Q?=
 =?iso-8859-1?Q?SdSjHlo+lVO+4EeVkNIigJWXpYmjFyBTmlNdzW5n0A/l/LB+ry2vGcvXJo?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?U+me5b0FXmi0xDbjo12xVi3FJIr/gqhoqjqTo2yS/tQkGvmNDpVNnQk1dD?=
 =?iso-8859-1?Q?qEbY+rOdrO95Swq5z80hLx9DIxXtelRmuVUUa61aW9daDMt9q2GRX1wbW5?=
 =?iso-8859-1?Q?yTcWyQkTA1rPIiVsMWRMvqW7wl/e/BlIW/Q4N4IoMWbTPya38R6mG02Nkx?=
 =?iso-8859-1?Q?ouUJgtzcYZ9Z+5N3P99hJizJE8ENlQ6GlS8aSqoaVViE/gnrfQxsw0TDgu?=
 =?iso-8859-1?Q?7wJI180skh2upt803c3hbRk/VnG7R8uPLwbvvs4Uay5pWGEqwuf29Y6sjZ?=
 =?iso-8859-1?Q?c2t29EHitxMxOG9b1ObfCwi3HtiF2kEBOtMQoFlmFJOVbMVARBdIcEvTmU?=
 =?iso-8859-1?Q?BNWB9UQbOGxc45Cc9W9f7CEGGMuG6jNK4u4DsAowZK2C++kBqCHcr1Jelo?=
 =?iso-8859-1?Q?Ek9IYhp4FCTdmciZFEdlFq9XxvPtIqoWzYz7cRi5873ZGDOqZqWmDA4qg3?=
 =?iso-8859-1?Q?ppfgbACntTde891a+v8ge9eXKPYr2Jmnf87c4YDRwDmbS1ua3vTjfycl+y?=
 =?iso-8859-1?Q?++P99VL/WugD5NiWi4ZE/pNvssiKgOOplQWFDG+x4Bu7jVFAYyvldpu80Z?=
 =?iso-8859-1?Q?xCTCjjAdPrm2Je9eOau5tH8O1M55uObMzcwPQWVAk6AvU2s1By2oIfqRKj?=
 =?iso-8859-1?Q?0wdJqny/9FjWxgyTB0oqCVu3435oGIguYfVAsS+vdaI8N/7aBPIk5exZv1?=
 =?iso-8859-1?Q?d2wxwuVmCjIGNWPrZvDumxGUeRM29BVwFwITZS+Ms7Sq929f2tf3GRXDWs?=
 =?iso-8859-1?Q?RVD7XLaE3vyE7cC75r8b6/tPaSoIq9kj9h2vdYsmIJHVRCXR2HJbjNi1b/?=
 =?iso-8859-1?Q?FRnnJr6DJ80RQgTedurZXCSwR2DEvZkTWw8WFg7KWepUGajS8V+oUaKfyT?=
 =?iso-8859-1?Q?SWgqEBVgwNrHt7oV4DCrhFpuROyWVemLvn6lKkmNk3lm5s0vTT/lUYlAWq?=
 =?iso-8859-1?Q?/Y0NDlJUK9okQPFW5t7L8ftN9s0rMfDuUr1k41Ap3xHXSmpBIFwePQ3mc4?=
 =?iso-8859-1?Q?OE8s0GwLprmUhcGdZgpVVHC4o28RGx+MDXh5+FyKBK2R2yYZnJjVFrAsXq?=
 =?iso-8859-1?Q?Wz//MvSq9/m8B87vqVRymFfbKjuDJ0Bny2hRgNzDtfchwmRYgDmfB3iKM3?=
 =?iso-8859-1?Q?XdSL8V0WyMDRWIyLeRU2iPiMQc21CQZksFJPV5zMT+7RogLsZevSVu4em8?=
 =?iso-8859-1?Q?fQ+hfU7Ko7I1veM5ijI1dB3kCMsjWmoR1L7TrnAEaBfWg4AGUh9IoeiS1+?=
 =?iso-8859-1?Q?Q/unkOkJDlROnLUFpOVVB0BIwccIZzchZgn989z15HrpDkZGD+Op78ZlkX?=
 =?iso-8859-1?Q?QV3rba2gXh3uZiJyU4bHfkmAMtH0Lxz3SscJUVviWherym+4ZKvX76Uki2?=
 =?iso-8859-1?Q?P8qMWEROsbmr2zTdIR7tMvRoOy0HtImr1QexMdLe8p7RB3rWoSC6JHN5Je?=
 =?iso-8859-1?Q?S/gwYwgKFzsOG6i9UBcMjXVt3ZDrQGVOOTpbM/yAx4qcxIp2GX+vtucx1K?=
 =?iso-8859-1?Q?LXtIsG4agjdMu4+OJYS2vfPxhtgYpp5Z22wYxfIFg3SF6tXHKrmJ3K6p5d?=
 =?iso-8859-1?Q?kD5S2BAmKfEU8Dg7ALHgPrG8BTOeJqcTwTXyG+8WKmdaNN6+eCYa9ni45Z?=
 =?iso-8859-1?Q?Y7L8kNqRXeY65nFeyy2dElvTHcujtS+3GepwhuRGKgaDgDpSBuspvTLw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd236237-34cc-4943-d5ce-08dd7d478162
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 00:33:42.5016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlScPsuzdcmuSexZstRaCMySoIuezEgkDflV94nUxM1MZIPTLrSssLnZg1eqWZKMPkrwBsYh7LRpSY6kuQlyZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
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

On Wed, Apr 16, 2025 at 01:23:17PM -0600, Summers, Stuart wrote:
> On Wed, 2025-04-16 at 18:30 +0000, Stuart Summers wrote:
> > From: Matthew Brost <matthew.brost@intel.com>
> > 
> > tlb_invalidation.lock is the lock for GT TLB invalidation fences,
> > name
> > this accurately.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> 
> This one makes sense to me and I'm happy to add my:
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 
> But given I posted, maybe good to have one more on here?
> 

It is fine (i.e. ok to merge) as long as you are not the author or
co-author.

Matt

> Thanks,
> Stuart
> 
> > ---
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++----
> >  drivers/gpu/drm/xe/xe_gt_types.h            | 4 ++--
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 084cbdeba8ea..031c4d43f36b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -119,7 +119,7 @@ int xe_gt_tlb_invalidation_init_early(struct
> > xe_gt *gt)
> >         gt->tlb_invalidation.seqno = 1;
> >         INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
> >         spin_lock_init(&gt->tlb_invalidation.pending_lock);
> > -       spin_lock_init(&gt->tlb_invalidation.lock);
> > +       spin_lock_init(&gt->tlb_invalidation.fence_lock);
> >         INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
> >                           xe_gt_tlb_fence_timeout);
> >  
> > @@ -564,11 +564,11 @@ void xe_gt_tlb_invalidation_fence_init(struct
> > xe_gt *gt,
> >  {
> >         xe_pm_runtime_get_noresume(gt_to_xe(gt));
> >  
> > -       spin_lock_irq(&gt->tlb_invalidation.lock);
> > +       spin_lock_irq(&gt->tlb_invalidation.fence_lock);
> >         dma_fence_init(&fence->base, &invalidation_fence_ops,
> > -                      &gt->tlb_invalidation.lock,
> > +                      &gt->tlb_invalidation.fence_lock,
> >                        dma_fence_context_alloc(1), 1);
> > -       spin_unlock_irq(&gt->tlb_invalidation.lock);
> > +       spin_unlock_irq(&gt->tlb_invalidation.fence_lock);
> >         INIT_LIST_HEAD(&fence->link);
> >         if (stack)
> >                 set_bit(FENCE_STACK_BIT, &fence->base.flags);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 7def0959da35..be81687cbe2b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -210,8 +210,8 @@ struct xe_gt {
> >                  * xe_gt_tlb_fence_timeout after the timeut interval
> > is over.
> >                  */
> >                 struct delayed_work fence_tdr;
> > -               /** @tlb_invalidation.lock: protects TLB invalidation
> > fences */
> > -               spinlock_t lock;
> > +               /** @tlb_invalidation.fence_lock: protects TLB
> > invalidation fences */
> > +               spinlock_t fence_lock;
> >         } tlb_invalidation;
> >  
> >         /**
> 
