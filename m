Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17406C61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 20:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D4A10EEC8;
	Tue,  1 Sep 2026 20:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9ewr3tc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCC210EEC8
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 20:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788293292; x=1819829292;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ASWO+7ZvMM0QIvwN9q8Z3xR+GQXl32v6TPlqMjyc8MA=;
 b=R9ewr3tckvQGTx3xVy6DU8L4kt4pXtcX4dqpwrJgUm9bt0u9ITW651h+
 ZaukqgpmIR00nAxvVm1+P9ua2WzzoQ/csitsBx57W/paZs4t0QZ+Cjgnk
 XSU+KviTTvBMW0YooBbsH+XAyd8q9+Bju9RH+shIT+DiA3Y/rsgz42VLZ
 Rw1K8U9Vd0shjn6gTaX2yff9pNA3hY6ENu/xTOjUbD/j5ZfXw8+KUsWAA
 ZTV5hDis2T47UT54Z5uMz9595p2blWaQUms6owtxt93/g/9uMABmdxJVM
 XQdZsmQNuhH17xbQhCFNgKivjwwe/wh6R6FtkksnPT4bSTlp+M40jV12x A==;
X-CSE-ConnectionGUID: 7dtyiNjlSDeJt35oYuK6Zw==
X-CSE-MsgGUID: jBXGv9OFTH2y/Kmnt3xFGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88863190"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="88863190"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 13:08:12 -0700
X-CSE-ConnectionGUID: Xt+JQVS1Rn6BCjvEn19wyA==
X-CSE-MsgGUID: QtE31L+KRVOIw7JXf1ziHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="265954951"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 13:08:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 13:08:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 13:08:11 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 13:08:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sz/p+esRXCsZxx96dF225wTDP/ZozcdND0MS0W+JgdzkrkyT3I642wXJczJHC+aygJu5shrSX7xqeCxw+4zoR2wJ8FaYBUypHZXfgxLQlkOK5/QgUMOYBymOMjPNVuUvrFa3PhZWNxOMwHGtSlc1jOh5bFJ/pO9bAcJ9eGaNfYRzKxi07D9SQXINTnp2c1nw/GAhZ7XWhPx0pO4ZRQ9Z54BWFL5UBcAVshjrdwBm9hGA1TbczKEWYa47PGsFI+s2g17oIYpEkm6G7uJQLSMiFgZNia46Z3Ro8H7tAeXp8VldCJaR+0OE+oZjVBEqtqV9ogcnl8+Ow/eeHGR2QkDNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lg8RoqyOaPt3X9NWtKHsIq1v9vWXAhqOcsWTwzZkQbE=;
 b=x7jeVyg2SS0TotG/zCJUzptbGyDpq/AjmCPVY8G617iBOMwy7d6AfVDy6dS0/qvbcvVdB34z4fRQrd1tLMKP3psBp15SFE8SsbOX3owV0QNvsA4hJBWieNET8areeKJFkUutOQ1nAB9iTzT1x4cCAkQ/IDmksTl/hwLc15RakrjCysJ14Kv32r05UwV6sMxDd8Vxov8sC3P/oyhgK/ycIawLXWsylJv6/7MR2sPZ31lVsXCGg04glxgym504cTqksChvjS2iXlvoPrG0l5QAM+MC33bY6UGxblDAG/a+uDqyA0gp9yIzPzhRiKHgoIyFcbYAASTPqKDzRwtXBozQVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB243846.namprd11.prod.outlook.com (2603:10b6:610:362::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 20:07:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 20:07:50 +0000
Date: Tue, 1 Sep 2026 13:07:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/migrate: support 4K PTEs for identity map
Message-ID: <apcwlHEFUzrmRIBG@gsse-cloud1.jf.intel.com>
References: <20260828151405.662533-7-matthew.auld@intel.com>
 <20260828151405.662533-8-matthew.auld@intel.com>
 <apHljQtQ+Ojgtw2P@gsse-cloud1.jf.intel.com>
 <5dd32f3a-901a-4fb0-9517-6298a1f71eac@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5dd32f3a-901a-4fb0-9517-6298a1f71eac@intel.com>
X-ClientProxiedBy: MW4PR04CA0292.namprd04.prod.outlook.com
 (2603:10b6:303:89::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB243846:EE_
X-MS-Office365-Filtering-Correlation-Id: 056f39fa-bf5c-4a0e-d945-08df0864b31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 0CWcgryEL83zcL93nqicylq399EqlROX8RQFqFdB/pQvMQk04O5qg/i/KokYX9z34WXcuFmP/7L2SyEIARWoH7v72dGF7t963UF5trVWma5I2HPVEzsha1TlK072NAD2BycqlAULfIm35+/q0EBlnFU0ZF+qarsemEJ+GgXAPRS6Uix54F94rNGVHvDdyt6GOEKEbUvlJ7xxnLGZCzdMrUpiq8IozQ5gIZe6ROZ80BMyCVOVdCIedUwfGevLA43wugemgLyHG0IjEDL3wzh+EHafGtK/Wpl824Fw0FlBwO5N9nsVhiTm8GbMHDgSNSRr7y0fFfcWGh8LOdvR/3ZKRPkhvgD6ttEtVo8F4WN2IBYyawMXV+C5oGfCVdoomBhu/f5vfzhRUC5znC9m0ALEm8W9Luelcd+pqTOWdT4dqc/EvAqXh1Cw/vhVPUNzYTaVKsNQ1uKchMFhIyCM5RRS30SHc5OLfVJM6hhMxPyroEugiucmcHg/GrOoUpV8JOlEzrtTvfmK0cNDVDp3MoYzlyPzO6fcFwF+rpZ2sY4VGCpFhv1uxUMPAkuxtBs4rP3glNXL+jHOsZzCW7OnOK1cK1CmRTQErKMGKrP/7MszXsRkEioWAKRf7j0/a0Ta3nAD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TCpB9v01vLR9HcZPkDIikddP9zAKWJmMUqSj2P8XIEqbQ1YhseRDKPoz/R?=
 =?iso-8859-1?Q?x4jus4v3SK8IJnlJZNDLlGChlLn1WrNrcvCzn6gS4d3avZgNCLqQFUJAY5?=
 =?iso-8859-1?Q?Z4nZ/jMBkK8EotPUV9vZsaqkDArwc6cSoPrcWZ0O8VRQmv3XJYji5qNIH5?=
 =?iso-8859-1?Q?NckrViE1WHr+MymsPy/84v7zXiFhrl2wFA5sM8yURO6xjuRw5Oc6kYjaze?=
 =?iso-8859-1?Q?QMIvMURAgZw46KY2DsbQHxetPkGk5fFKRRuvWpFb4R+cpuViuP/uIK4KIW?=
 =?iso-8859-1?Q?Sbpq16DHwFsc+MZfkhlLnvaVtLJQuJh1praGMAO4wEKTFu5/rd54FZr7ra?=
 =?iso-8859-1?Q?8Ks+qmQ/GUhM9DwcjNgFqJ8BwXb824ph09BvoqqQSBhLOw15caloO0dcsy?=
 =?iso-8859-1?Q?25HvjTpJDVADIkOgWN7Sh0VjalpStLBHQyTqDAT/Aiakbwf+ld+VoaAFUa?=
 =?iso-8859-1?Q?nBAwv2XcIrT3R9U/zTAmMPfHlnvD6hDTJGNLT1YsKBHIB26zgjHea8lW/S?=
 =?iso-8859-1?Q?YJvb9Z9aIeYnQYLIDElbYekeZUttsvnpxNZXz9esst+GI8yY/VdgYLyQRD?=
 =?iso-8859-1?Q?70JdHTFMzXsmuvJQ93fNXHQxy2XK5+QwxfZaaX1brMW5kXQt5940KZSAQC?=
 =?iso-8859-1?Q?i9EhexTy/7+Ac3fBYEmDheH7fFqnb9qZb3vz7QAaf8oHi0bEHaD+yt7PO8?=
 =?iso-8859-1?Q?9nLzS1hvL8i8Md70tN2+tjoopR4kqn2c8gFtpImE6DcrTT0efUaqixG540?=
 =?iso-8859-1?Q?E7OOq+SinL40nfHH/mAdw2cRxC9qQg1K7ASQN86FMNS9uBBFgQ/LQXBNXJ?=
 =?iso-8859-1?Q?UtdFvIbP9haipI0dj7/42EbxKHhzW7/UEcIME/6xFlSaWzjnUA8IToGZfY?=
 =?iso-8859-1?Q?aulZVQvLFSlJCVLYnSc5rg4VnA2Gz4DkifzWQLiNmbqc8UOt0T5vcHrJ4R?=
 =?iso-8859-1?Q?Cph3Czbl9heyk2CSkAyTXVXw+UMiTBfvN4l1wx1aQ38boUXAEMRti4k9cn?=
 =?iso-8859-1?Q?z5JG0dPRbJ5ca/tFfrcOzp4ulOFZVAqU3a25YgBxJ774VbwN5TAX+pgplu?=
 =?iso-8859-1?Q?nfcqvlPf4nlCTPsI7kgQhwVzpIj7M2Tb5+KxD9g46by1qcE6I9Gr8cQn/K?=
 =?iso-8859-1?Q?Bqr7sioHhJxFk5qvS81JwOZpvvabGjVFZXifdbAv4/wrz3x8xSK49XtsIz?=
 =?iso-8859-1?Q?8asAWKOOjXVmRtEFt3TC7SqN0D6mNhFugrCv8Gr4CC4bQ9yjK2MXy4j/uF?=
 =?iso-8859-1?Q?fzfbmoBmirhk+ds7CYjIaHVMouTdC7ecdwCwcoAN3C7zfiRDFCxjUH0PwK?=
 =?iso-8859-1?Q?6dAmgkOyT8hD5qbW82veqaK2jJ+P2jZZdan5i36NshZHaBDOB4aI0NiKl/?=
 =?iso-8859-1?Q?2azX5Wk15HFnMVQ6vtg3cMq7WSYJwF9kEba7n0KnThk22ajyy7Qg3eQCOG?=
 =?iso-8859-1?Q?ulHFigSDwGSnvKZb4BqSaddEuvGRlP3A9SJfA7l6/FMpdpWMyi7gdhKFsL?=
 =?iso-8859-1?Q?xJhyIRsEm5pilVP3FylBavRwrPPjkmVezgpYZR6vQ1KtOw/SxpVCttYBsn?=
 =?iso-8859-1?Q?uLjr8tlVOEKdF+mK+Pqfm44olX9IOS0kRNEmmi+G+Ae6DIv/4Jg+0RDsMT?=
 =?iso-8859-1?Q?PY97RSARZYzIPLf6gGThpEr3zsJupE+i+TtjjU4EdUn3UhUu+8JqVZbUOa?=
 =?iso-8859-1?Q?q43mimMzDraz9Xfp6SOogpqFVeDtowosfS9uYpEwzRV5mMMnW8r+CaHmMA?=
 =?iso-8859-1?Q?+tmv/iUOZdMJv0uRSufo8BrtIG+hxi9Eh/jTTtf/I9/v0K4bGgd5AoEgrD?=
 =?iso-8859-1?Q?Y7sw2Je+JpdvlXtCds3B+hfbgOX0yyw=3D?=
X-Exchange-RoutingPolicyChecked: 4RX1GTGhhaOx4ke3+9nL8HEJlmB/TTXZDTEpXTDbi52ALLXvv7K1OjpFt71sfXitoNbpjxrRcvSa1yC9uLaMXuksOp2W8rt6BQpR+moTFpscCkErafhHGPGGgwdOfU/gQf3qgiYZuSvy5+CDIWOubS/t+o3yHO97mkzI+M4qZIVoYAb3VadnDaSgpS2j5oju3lRpSIIvzGBOkXupDRNK9fhi1f+Ne3q9cIw/HgjSYWJhnr5/wNkguS97shudHS9jau0WxICFTXAangrULHA571rhqoFhqI9lZkNSYsaOl1GTp7LEvTso8MxorcEvoOnAnYWk+QIDJIVB41eiccnTGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 056f39fa-bf5c-4a0e-d945-08df0864b31d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 20:07:50.6220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKZcthQpz6sO7uMFJG/FxWKhjpOJsYb2fPOYpjVinChmb3iHXRpT9ZsKxte+xuKqzUF3PwD/zIwAqv3v6aF/OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB243846
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

On Tue, Sep 01, 2026 at 09:48:14AM +0100, Matthew Auld wrote:
> On 28/08/2026 20:46, Matthew Brost wrote:
> > On Fri, Aug 28, 2026 at 04:14:07PM +0100, Matthew Auld wrote:
> > > When VRAM limit (usable_size) is no longer 2M aligned (e.g. because flat
> > > CCS storage size rounds it down to 4K), we must map the tail of the
> > > identity mapping using 4K pages.
> > > 
> > > This removes the 2M alignment assert (which pops) and introduces a 4K
> > > fallback in the identity map programming loop to handle the last 2M
> > > chunk of usable VRAM.
> > > 
> > > Might be possible to skip backporting this. The assert that pops should
> > > be harmless and is only on debug builds plus only a stray write would
> > > hit CCS, which technically get mapped.
> > > 
> > 
> > This LGTM, better than what I had in mind. One question though.
> > 
> > > Assisted-by: Gemini:gemini-3.1-pro-preview
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_migrate.c | 57 +++++++++++++++++++++------------
> > >   1 file changed, 37 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 75b83687f1b5..0bf000d7c901 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -87,7 +87,7 @@ struct xe_migrate {
> > >   #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
> > >   #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
> > >   #define NUM_KERNEL_PDE 15
> > > -#define NUM_PT_SLOTS 32
> > > +#define NUM_PT_SLOTS 48
> > 
> > Why this change? Can't we just steal more PTs from user-space VM binds?
> > Did testing show that this was actually a problem?
> 
> Yeah, my local v1 did exactly that. But I got doubts since it felt a bit
> scary taking away slots from userspace and wasn't sure if there could be
> some impact.
> 

Yes, it possible large binds return -ENOBUFS eariler the more PTs one steals.

> Can revert back to that approach if you prefer? It should be somewhere in my
> reflog.

I'm fine either way as CI is passing which it is. We can tweak in place
as needed into follow up.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> > 
> > Also, in general, power-of-two values are preferred.
> 
> Yeah, I think it was just the assert:
> 
> /* Must be a multiple of 64K to support all platforms */
> BUILD_BUG_ON(NUM_PT_SLOTS * XE_PAGE_SIZE % SZ_64K);
> 
> So just went with the minimal to satisfy that. Will make this a power-of-two
> instead if preferred.
> 
> > 
> > Eventually, we'll be able to drop the need for these PTs once CPU binds
> > land as well [1].
> > 
> > Not blocker.
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/149888/
> > 
> > >   #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
> > >   #define MAX_NUM_PTE 512
> > >   #define IDENTITY_OFFSET 256ULL
> > > @@ -163,22 +163,20 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
> > >   }
> > >   static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
> > > -					u64 map_ofs, u64 vram_offset, u16 pat_index, u64 pt_2m_ofs)
> > > +					u64 map_ofs, u64 vram_offset, u16 pat_index, u64 pt_2m_ofs,
> > > +					u64 pt_4k_ofs)
> > >   {
> > >   	struct xe_vram_region *vram = xe->mem.vram;
> > >   	resource_size_t dpa_base = xe_vram_region_dpa_base(vram);
> > >   	u64 pos, ofs, flags;
> > >   	u64 entry;
> > > -	/* XXX: Unclear if this should be usable_size? */
> > > -	u64 vram_limit = xe_vram_region_actual_physical_size(vram) + dpa_base;
> > > +	u64 vram_limit = xe_vram_region_usable_size(vram) + dpa_base;
> > >   	u32 level = 2;
> > >   	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
> > >   	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
> > >   					    true, 0);
> > > -	xe_assert(xe, IS_ALIGNED(xe_vram_region_usable_size(vram), SZ_2M));
> > > -
> > >   	/*
> > >   	 * Use 1GB pages when possible, last chunk always use 2M
> > >   	 * pages as mixing reserved memory (stolen, WOCPM) with a single
> > > @@ -196,8 +194,24 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
> > >   							    true, 0);
> > >   			for (ofs = pt_2m_ofs; pos < vram_limit;
> > > -			     pos += SZ_2M, ofs += 8)
> > > +			     pos += SZ_2M, ofs += 8) {
> > > +				if (pos + SZ_2M > vram_limit) {
> > > +					entry = vm->pt_ops->pde_encode_bo(bo, pt_4k_ofs);
> > > +					xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
> > > +
> > > +					flags = vm->pt_ops->pte_encode_addr(xe, 0,
> > > +									    pat_index,
> > > +									    level - 2,
> > > +									    true, 0);
> > > +
> > > +					for (ofs = pt_4k_ofs; pos < vram_limit;
> > > +					     pos += SZ_4K, ofs += 8)
> > > +						xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> > > +					break;
> > > +				}
> > > +
> > >   				xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> > > +			}
> > >   			break;	/* Ensure pos == vram_limit assert correct */
> > >   		}
> > > @@ -242,16 +256,17 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> > >   	u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
> > >   	u8 id = tile->id;
> > >   	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> > > -#define VRAM_IDENTITY_MAP_COUNT	2
> > > -	u32 num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
> > > -#undef VRAM_IDENTITY_MAP_COUNT
> > > +#define VRAM_IDENTITY_MAP_PT_COUNT	4
> > > +	u32 num_setup = num_level + VRAM_IDENTITY_MAP_PT_COUNT;
> > > +#undef VRAM_IDENTITY_MAP_PT_COUNT
> > >   	u32 map_ofs, level, i;
> > >   	struct xe_bo *bo = m->pt_bo, *batch = tile->mem.kernel_bb_pool->bo;
> > > -	u64 entry, pt29_ofs;
> > > +	u64 entry;
> > > -	/* PT30 & PT31 reserved for 2M identity map */
> > > -	pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
> > > -	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs);
> > > +	/* PT44..PT47 reserved for 4K and 2M identity map */
> > > +	u64 l1_pt_ofs = xe_bo_size(bo) - 5 * XE_PAGE_SIZE;
> > > +
> > > +	entry = vm->pt_ops->pde_encode_bo(bo, l1_pt_ofs);
> > >   	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
> > >   	map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
> > > @@ -347,11 +362,12 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> > >   	/* Identity map the entire vram at 256GiB offset */
> > >   	if (IS_DGFX(xe)) {
> > > -		u64 pt30_ofs = xe_bo_size(bo) - 2 * XE_PAGE_SIZE;
> > > +		u64 pt46_ofs = xe_bo_size(bo) - 2 * XE_PAGE_SIZE;
> > >   		resource_size_t actual_phy_size = xe_vram_region_actual_physical_size(xe->mem.vram);
> > > +		u64 pt44_ofs = xe_bo_size(bo) - 4 * XE_PAGE_SIZE;
> > >   		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
> > > -					    pat_index, pt30_ofs);
> > > +					    pat_index, pt46_ofs, pt44_ofs);
> > >   		xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
> > >   		/*
> > > @@ -362,12 +378,13 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> > >   			u16 comp_pat_index = xe_cache_pat_idx(xe, XE_CACHE_NONE_COMPRESSION);
> > >   			u64 vram_offset = IDENTITY_OFFSET +
> > >   				DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
> > > -			u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
> > > +			u64 pt47_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
> > >   			xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET -
> > >   							  IDENTITY_OFFSET / 2) * SZ_1G);
> > > +			u64 pt45_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
> > >   			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
> > > -						    comp_pat_index, pt31_ofs);
> > > +						    comp_pat_index, pt47_ofs, pt45_ofs);
> > >   		}
> > >   	}
> > > @@ -381,8 +398,8 @@ static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
> > >   	 * Example layout created above, with root level = 3:
> > >   	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
> > >   	 * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
> > > -	 * [PT9...PT26]: Userspace PT's for VM_BIND, 4 KiB PTE's
> > > -	 * [PT27 = PDE 0] [PT28 = PDE 1] [PT29 = PDE 2] [PT30 & PT31 = 2M vram identity map]
> > > +	 * [PT9...PT40]: Userspace PT's for VM_BIND, 4 KiB PTE's
> > > +	 * [PT41 = PDE 0] [PT44...PT47 = 4K and 2M vram identity maps]
> > >   	 *
> > >   	 * This makes the lowest part of the VM point to the pagetables.
> > >   	 * Hence the lowest 2M in the vm should point to itself, with a few writes
> > > -- 
> > > 2.55.0
> > > 
> 
