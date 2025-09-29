Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D867CAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 12:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2318410E14B;
	Mon, 29 Sep 2025 12:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HL6o50iU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6B510E14B
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 12:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759148145; x=1790684145;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YQH5iPe9/gU/wvbCkXdTCJWY3ICFNNSIUryUtzChW64=;
 b=HL6o50iUItgNEWFRS4t6wIBAl3wID4r+HK20OXXFDy3MMmhv1+ESu/60
 f7KTE8Y4aoCK5hpXeC9Yr5SnZrKOWMXQBia9lR7qFlffkXjsfUONf6PkS
 h7+2yCucaWOYIY8AvZMall0srSmn5OFr4mf1ARWjDEIyVQ5mpZ3GzMhck
 uKZ/2DSogQiLsddJgFhpNj5bg5LiY84tqDWjFRckOLZCyr4yjDJ7NmS0e
 3/ZrE8pkhCjcppLBqDw3A9siBQvCSZDGKi3ky4bG201kDExjJXruOGxdX
 XlNlcIA9HMEo6mGmsHJWhqa5doc3Ly6vjYYnSTReYDipFGixxKfgNl7jV g==;
X-CSE-ConnectionGUID: 5v2FEnoPRSKCvIVCcrmloQ==
X-CSE-MsgGUID: dDSC3TEiRW+Uz/1gPAlGpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61433282"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61433282"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 05:15:44 -0700
X-CSE-ConnectionGUID: sLEwwIjgSN63VYC/2xM8wQ==
X-CSE-MsgGUID: LjpVMMpaTNG5yz9qQlRXCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178041616"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 05:15:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 05:15:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 05:15:43 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 05:15:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QF7uRPtKNgOozPvZnvt24FlrDpXrkTiRXcMNhrgFglt41QHDqmJWij6MC7IwfRDX/gY/kSs7ooxCFE1sOPgz/hkmF8Cr9IJur8axrlcrNCW9V94oQyrrcHvo0vlU6Vj0a9zf6FOKTuN1V8lvzeP6rsPoq8Mh0Tvu4+cN81uHom9/4kUbBfiy+vAIXzXYSrR+bgku91c5j/BRXa9w7lz5+EnWriQgwDh7/s4fvX6yF/Q/krRo/Au0pZIQs8PsqeOGxcleCwJWBr0N5PpTirUEhg44N8J0EhRFXT0tmeIjocifcFg1lH18u2ENRyG9zL2fwxIrygaBTZeJc4bwucok1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ50oJAVAV+mnbE612pnWoWkUP1dVo7w46S00+ER4os=;
 b=OJaoKckioQXEK/mY+P27fFCJ5kBNzNRKr0tvbXlAxNS5y0tS2xF6zqRxA3/SNjdPLgwnNh/uZ/bZF8j3CZJDXpxJsaq65RmEJpMsK2E5WjynvCfVceZDZxS6SeXyrH0JZc9VMVZNwjJweeIW6sTTT1h2IcYEmRo8vBphZ/IETmSlLScCpdbZYEpGtcI/braF/ntvRZsgcLqhn2rluR4qPuoS27z6tYQpu7HdrP8oUeuohwkA18hoM/MgaGMtzSV9Ys7xb2CbbtJ580PKvpoJTyqM6JrBpZmMS1Pea6X7IyMGZhwsBPwXUGQCznUVAbYzfjyQFV0RRC/jgzgGXY7IBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7976.namprd11.prod.outlook.com (2603:10b6:806:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 12:15:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 12:15:41 +0000
Date: Mon, 29 Sep 2025 05:15:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/36] drm/xe/vf: Lock querying GGTT config during
 driver init
Message-ID: <aNp4asaemvWydMY8@lstrano-desk.jf.intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-3-matthew.brost@intel.com>
 <ff5ee0cb-05fe-4e82-9994-589bf279d302@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ff5ee0cb-05fe-4e82-9994-589bf279d302@intel.com>
X-ClientProxiedBy: MW4PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:303:b4::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: fbdbd9e4-a2cb-4e02-5ef8-08ddff51e81c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L/NkXKRP3HPPyg9i07HLo1rHy6CH0c3v4ztVuLyv+68E5FfHwK3MWALIAH77?=
 =?us-ascii?Q?Q4rFO2BIbePhAhDbZ65W/nqZem3t+s9/fYPdtkBbQFwkGCOjeX8ddpco/wSp?=
 =?us-ascii?Q?2a0nK85CPouG0g9GEgzDf370VXaM+bg0Vi8vSN8dpw2ZF75k7U3X67i/d/zf?=
 =?us-ascii?Q?Yx4FXHf6y+hzwkdZ4MiWzfjFbloTYKjum6iYM6A3WUZvCcpfJxqgdStUnyWE?=
 =?us-ascii?Q?H9MZ+4RZf0czq1sPOs9jwi7AUszXa3V/Bpne1EZJiLUXJcYMkKQ2Hs980PS4?=
 =?us-ascii?Q?b+AHehHzgKVr1ypcklLmDU5dHZlj3UcHaphoYcVxEPtitL6nKEwtgKcMHGQA?=
 =?us-ascii?Q?zTdW1OLOltDuu+BKYxrmjjerSYjHsT1bqRc1lJ8zy1kcIywpg4bDUU7als3W?=
 =?us-ascii?Q?tOBQO5BfYv6OY9PIfRS4BhFJXMeHczACSPFKT/HOtYs3taNKcYlZtLG8Uded?=
 =?us-ascii?Q?QEkpa7wEHUzKreoXTNfOA3hdSfEyP7YbT5M7DcHEPOFVUPOcQn7zlyXUYDS0?=
 =?us-ascii?Q?k/hsq2QhZkyCNL6SXkldBFlrp2rrWGhHO4Ya31gtGhnPPVoj3OKzydxRCmDT?=
 =?us-ascii?Q?G1FepCDV7KEmcnodeFnWOzyE1o5deduR2hgwd6B5HA00FH5lDxUDLXjFuWWE?=
 =?us-ascii?Q?SPGEqxlDh2iQ9bmvencbV+K7iChmmmcB3mtEeP2QXu81e991076vfV1NN6VD?=
 =?us-ascii?Q?Uw1MJ4kKtgGnajaq/Vzm8gtczuSmubs7Mxa+g/N4AxX1fbXgwhj/uiDQriZd?=
 =?us-ascii?Q?z/mFxSyWMRrJlkmkcdDodHr9DMTkBs8Ek5BKrj4QTxiNdwTtkCBSbz2Lw79y?=
 =?us-ascii?Q?0sCQYnxbuJco4RDxxlSRzJQUdvdYeQrBhhbIll5gaf8gHs944x2IbIu7B9cp?=
 =?us-ascii?Q?G2d2fUY2/IP/FMHjeJWKDvehh2v55UX+McmsPuaDe2c8zQ5xNOtuoqcPgcSf?=
 =?us-ascii?Q?g27IHO/4UGfGLHxsD5bcpw4Q4GVVzm16QfnEMTkl2m2Jv8udvwHwg+OqPg7s?=
 =?us-ascii?Q?hRa9TMbusTloNWZENYtGPXDRJ3ysDwlEWX0wd5cZ01qwHcBrvUFe+Kww9e1H?=
 =?us-ascii?Q?m1bbMqb8sxWeDPb8PGa9PJ9ZrLXSWo3B7YO8y6t8kmoeRkqXdb7fo7UkCwMm?=
 =?us-ascii?Q?NLpmxg18TT79lhsuLLBdJeorqA66wWAufrMG4ArMcfxNlzhDEruedwQZdnnY?=
 =?us-ascii?Q?k2YFogg9Vxvjxu8tKEhfpjwMi2Jp9I1VtFtlZuNEQVWoUsjUZ0BqT8gYhM2a?=
 =?us-ascii?Q?HPPn5W1llKAyMx8aT/DO9AreCAfhoNrRqZQjiHf7VJSJdApT0uKvvmbug57u?=
 =?us-ascii?Q?MDW6H133iZi9ZFm5fbGPTmKkbH/3E5nsXetivhbRLKqLgn1qBjEOk+AyzQbL?=
 =?us-ascii?Q?JE8nuWx1YRTTHFgfofhJzYS0RXTfq6QRcpDT6ksMEMVVM3pVzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tOqntBZfij4AF0injAyvZv36U6uEkeXJxmuMm80IupKzbJucXBX7DFUs9KxX?=
 =?us-ascii?Q?H/aWEqqJNtLt77T1HPLIynU56lhGw/EY7+y3umDr5vbloHpI4kgFADLLMNVf?=
 =?us-ascii?Q?0DY326+1iejiBimRuMvW+QJvF7gI12hVIfVTStuo8d3+BW2l2y/kQoZ3QkaU?=
 =?us-ascii?Q?gRmAx1stStifsWra2mmomhCQDjoifSfeteL2+nt/SM0a0/aO+JPJKD0Uh9F5?=
 =?us-ascii?Q?3oAJW2O9+R6zLI9OCn0BRmynVgoDzLWb2qCjcvzYM6Xgk7Nsqnc8DhsksWKC?=
 =?us-ascii?Q?3G0rKjhxM/Y7pyI/Lo0qPNlm3EIiPyB00pnjenim+Urs89lOiMROXVbmf4A9?=
 =?us-ascii?Q?H23+IO01gMqpiN/Cte4u4RiS4p83rbN0MRmnsU4vO1MpMG7kwH53/A2cMO4s?=
 =?us-ascii?Q?aQYyPTUFeBEaYCa9+VYPhOqxw7QY4DuN8v/tam1WMcpQP0f7ZHTkzB/0PNXy?=
 =?us-ascii?Q?h5MJuX1Fo9EIi0gUR8+TX6nKwKzSek3YoxXr1cDwBYhi4J23UkBJzKonRQfU?=
 =?us-ascii?Q?CyS7LSup+I0UzOQ3K1nTVQomu+vmZueNbEEfpFNZa6YoNOr07H0sTL1vEJ7W?=
 =?us-ascii?Q?sBc+pnKCTjq8gN8H465XYjvuY60FZkkqbZaqDEK1VZz4mzmS6Ofu/S9w8O2q?=
 =?us-ascii?Q?4LlWKJnp90vhyN9aJ2egXvV9CK3D+1HTJJCk5hLUwekghOlgliyww3ZzeE6S?=
 =?us-ascii?Q?h1EyDoEYUQCtnkeKmfuKi2T1+PCsukVXwmsfiVvh4Q22BQefVafNEH9wSVoJ?=
 =?us-ascii?Q?vcC7miu+UmdgnA8LCiQ97A8IpJGlLQbUxK0n+jFVR2NHHWGLZTIl0CTCKv6L?=
 =?us-ascii?Q?+eF2ke1Q4FTGuPEwLz4xBLl92vKiVdi23Fo4G6gSL1g8RIMgJP9Fc4ejgmb9?=
 =?us-ascii?Q?6y7QIAW0/h0GjvwwRkSooMHeaU0Hn9KuHqtHOBdycIvpjQX08Y76iJRlVQfo?=
 =?us-ascii?Q?VkRQlWtBk31SR67RNLuA/4+Etk7pFUD9CpL+M9TIlSXcg1/ZUUZAiI6vqi1C?=
 =?us-ascii?Q?P5g0ZDrnim4NWshy5Jc6UQspo7hwZRnZiOCCs+QZCfcaCevxaBBS3OrI64jO?=
 =?us-ascii?Q?a1OPk/BFsXyzZS24RnQUpfTEKCe9tqhkLOf50K1yzKGSzsfCbSPRp5cFdBKH?=
 =?us-ascii?Q?txJirAAbN2fkmkCDuWrImixC4xMYMUr0Hf+iZtKm1bmV/L/0axFNJbJ5YS/1?=
 =?us-ascii?Q?RW2XhVMQ5uFf2mhW4QwdHGP+t5hLoXAIHVe52HRXd+YtKK9XVI2RKmyBAVV0?=
 =?us-ascii?Q?0w2aPBcuTBzwKqyPNVIIUv7lmcrt1VSBTMGCxtNcWZJ+oa72zrxVr7UGtG+N?=
 =?us-ascii?Q?wLmoH3ImhoqkRmFBPZn+sTGCwPL/AAfjp2xUY7+j1sXMqN5IEwUwhWsGZNjS?=
 =?us-ascii?Q?4b7RCeV3x7pDiJODR/pgw9MZIjN6NUcUv2LvtaNDUq/LmzFISrsXhnCWQgVi?=
 =?us-ascii?Q?TUbIQKM+qu4sekX6ujfnfvDuUN/2QmQIAljj5o41wQ5vDx4fJHpVwWO/Y7g+?=
 =?us-ascii?Q?KRmEN7526jUobb6lq0LEnlwBIqs7Jn/r44dI5punf+4KcCEupItZyakDzydQ?=
 =?us-ascii?Q?3rljoszUNMwUvj6j6miNQXItUBLZwLV/JZyDe6Cwrrj6LMbNTor8s1WnrBus?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdbd9e4-a2cb-4e02-5ef8-08ddff51e81c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 12:15:41.1183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRu/8WgOfYt+E54suvNQwFVMp9u3quPqlIr+zHYx3R2ODy1NTaO3NWUv6Rj3RS2DUP5ZJezhbV1PuwHkb7So/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7976
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

On Mon, Sep 29, 2025 at 09:42:55AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/29/2025 4:55 AM, Matthew Brost wrote:
> > From: Tomasz Lis <tomasz.lis@intel.com>
> > 
> > Protect access to GGTT config as this is non-static information.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 96 ++++++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  3 +
> >  drivers/gpu/drm/xe/xe_sriov_vf.c          |  6 ++
> >  3 files changed, 84 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 0461d5513487..016c867e5e2b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -440,18 +440,21 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > +	down_write(&config->lock);
> > +
> 
> still didn't get answer to my earlier question [1]
> 
> [1] https://patchwork.freedesktop.org/patch/676375/?series=154627&rev=2#comment_1240924
> 

Again, this isn't a patch, so I believe Tomasz will need to chime in to
provide an answer or conclusion here.

> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	if (config->ggtt_size && config->ggtt_size != size) {
> >  		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
> >  				size / SZ_1K, config->ggtt_size / SZ_1K);
> > -		return -EREMCHG;
> > +		err = -EREMCHG;
> > +		goto out;
> >  	}
> >  
> >  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
> > @@ -460,8 +463,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
> >  	config->ggtt_shift = start - (s64)config->ggtt_base;
> >  	config->ggtt_base = start;
> >  	config->ggtt_size = size;
> > +	err = config->ggtt_size ? 0 : -ENODATA;
> >  
> > -	return config->ggtt_size ? 0 : -ENODATA;
> > +out:
> > +	up_write(&config->lock);
> > +	return err;
> >  }
> >  
> >  static int vf_get_lmem_info(struct xe_gt *gt)
> > @@ -474,22 +480,28 @@ static int vf_get_lmem_info(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > +	down_write(&config->lock);
> > +
> 
> also, commit message says "Protect access to GGTT config "
> while the patch seems to apply locking to the whole config ...
> 
> what's the rationale to extend this protection?
> just unification?
> 
> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	if (config->lmem_size && config->lmem_size != size) {
> >  		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
> >  				size / SZ_1M, config->lmem_size / SZ_1M);
> > -		return -EREMCHG;
> > +		err = -EREMCHG;
> > +		goto out;
> >  	}
> >  
> >  	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
> >  	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
> >  
> >  	config->lmem_size = size;
> > +	err = config->lmem_size ? 0 : -ENODATA;
> >  
> > -	return config->lmem_size ? 0 : -ENODATA;
> > +out:
> > +	up_write(&config->lock);
> > +	return err;
> >  }
> >  
> >  static int vf_get_submission_cfg(struct xe_gt *gt)
> > @@ -501,23 +513,27 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > +	down_write(&config->lock);
> > +
> >  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
> >  	if (unlikely(err))
> > -		return err;
> > +		goto out;
> >  
> >  	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
> >  		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
> >  				num_ctxs, config->num_ctxs);
> > -		return -EREMCHG;
> > +		err = -EREMCHG;
> > +		goto out;
> >  	}
> >  	if (config->num_dbs && config->num_dbs != num_dbs) {
> >  		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
> >  				num_dbs, config->num_dbs);
> > -		return -EREMCHG;
> > +		err = -EREMCHG;
> > +		goto out;
> >  	}
> >  
> >  	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
> > @@ -525,7 +541,11 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
> >  	config->num_ctxs = num_ctxs;
> >  	config->num_dbs = num_dbs;
> >  
> > -	return config->num_ctxs ? 0 : -ENODATA;
> > +	err = config->num_ctxs ? 0 : -ENODATA;
> > +
> > +out:
> > +	up_write(&config->lock);
> > +	return err;
> >  }
> >  
> >  static void vf_cache_gmdid(struct xe_gt *gt)
> > @@ -579,11 +599,18 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
> >   */
> >  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
> >  {
> > +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	u16 val;
> > +
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
> >  
> > -	return gt->sriov.vf.self_config.num_ctxs;
> > +	down_read(&config->lock);
> > +	xe_gt_assert(gt, config->num_ctxs);
> > +	val = config->num_ctxs;
> > +	up_read(&config->lock);
> > +
> > +	return val;
> >  }
> >  
> >  /**
> > @@ -596,11 +623,18 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
> >   */
> >  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
> >  {
> > +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	u64 val;
> > +
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
> >  
> > -	return gt->sriov.vf.self_config.lmem_size;
> > +	down_read(&config->lock);
> > +	xe_gt_assert(gt, config->lmem_size);
> > +	val = config->lmem_size;
> > +	up_read(&config->lock);
> > +
> > +	return val;
> >  }
> >  
> >  /**
> > @@ -613,11 +647,17 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
> >   */
> >  u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> >  {
> > +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	u64 val;
> > +
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> >  
> > -	return gt->sriov.vf.self_config.ggtt_size;
> > +	down_read(&config->lock);
> > +	val = config->ggtt_size;
> > +	up_read(&config->lock);
> > +
> > +	return val;
> >  }
> >  
> >  /**
> > @@ -630,11 +670,18 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> >   */
> >  u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> >  {
> > +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	u64 val;
> > +
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> >  
> > -	return gt->sriov.vf.self_config.ggtt_base;
> > +	down_read(&config->lock);
> > +	xe_gt_assert(gt, config->ggtt_size);
> > +	val = config->ggtt_base;
> > +	up_read(&config->lock);
> > +
> > +	return val;
> >  }
> >  
> >  /**
> > @@ -648,11 +695,16 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> >  s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> >  {
> >  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	s64 val;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> >  
> > -	return config->ggtt_shift;
> > +	down_read(&config->lock);
> > +	val = config->ggtt_shift;
> > +	up_read(&config->lock);
> > +
> > +	return val;
> >  }
> >  
> >  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
> > @@ -1044,6 +1096,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > +	down_read(&config->lock);
> >  	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
> >  		   config->ggtt_base,
> >  		   config->ggtt_base + config->ggtt_size - 1);
> > @@ -1060,6 +1113,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >  
> >  	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
> >  	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
> > +	up_read(&config->lock);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index 298dedf4b009..d95857bd789b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -6,6 +6,7 @@
> >  #ifndef _XE_GT_SRIOV_VF_TYPES_H_
> >  #define _XE_GT_SRIOV_VF_TYPES_H_
> >  
> > +#include <linux/rwsem.h>
> >  #include <linux/types.h>
> >  #include "xe_uc_fw_types.h"
> >  
> > @@ -25,6 +26,8 @@ struct xe_gt_sriov_vf_selfconfig {
> >  	u16 num_ctxs;
> >  	/** @num_dbs: assigned number of GuC doorbells IDs. */
> >  	u16 num_dbs;
> > +	/** @lock: lock for protecting access to all selfconfig fields. */
> > +	struct rw_semaphore lock;
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > index cdd9f8e78b2a..d6e2ed9b9bbc 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > @@ -197,6 +197,12 @@ static void vf_migration_init_early(struct xe_device *xe)
> >   */
> >  void xe_sriov_vf_init_early(struct xe_device *xe)
> >  {
> > +	struct xe_gt *gt;
> > +	unsigned int id;
> > +
> > +	for_each_gt(gt, xe, id)
> > +		init_rwsem(&gt->sriov.vf.self_config.lock);
> 
> as before, this should be done in
> 
> 	xe_gt_sriov_vf_init_early
> 

I pick up this change but again I think Michal's need some answers to
his questions.

Matt

> > +
> >  	vf_migration_init_early(xe);
> >  }
> >  
> 
