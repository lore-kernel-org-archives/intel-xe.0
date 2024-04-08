Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6777C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 11:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D569B10FFE0;
	Mon,  8 Apr 2024 11:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoky2Ipz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A7F10FFE0
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 11:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712576903; x=1744112903;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fa8yWQC6LUy+Nv2wdRM20W6Bx6HHITe1zmmlop+z1j0=;
 b=aoky2Ipz2j5ACAG3eU1maUg9D0C6mkBlJekuKa+wEPABsCB5qjTYkQ4z
 asXBz59pLoAf4jsPaJVvU0RoiEOgYuavPiz9vgk/D/T30XC0f9NY1FOf/
 8MJAuXdE99GdROCpRhAISOFszyrgPVH9meToCk6WrmurYAyL4acfYa7ue
 XCCCwjvGopJX9kFMNuovbCHmhvvMjpCmFaTnJICCuZLzxCJJ7+KkOmsru
 LMumfQbrZ/qkJ+TEE78iEaBNFZkyGmp2ItLONXiuqvoApjqlNCy6jMmuv
 4Cw3si07Km/WxnQ4xKGpN3Tn8TU26XqANps4HenRDmjaokdY/05C3tvhE w==;
X-CSE-ConnectionGUID: qXRFzNUYSoC1/yLBP8W2pw==
X-CSE-MsgGUID: O+0G0Q7ITfuyYg8Nt61Pgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18570872"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="18570872"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 04:48:13 -0700
X-CSE-ConnectionGUID: iWsDiOYCQAiQmXNKmWJdYQ==
X-CSE-MsgGUID: U0VNOsGeTlefVnU5+2SvFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="24496605"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 04:48:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 04:48:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 04:48:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 04:48:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 04:48:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K16iwAbST0a3R6Abb/vQM72kVONUSswYWO6gR2AeMk7SPt/D3VjSoaTlb6PeSBfwmFWl++j5UVQmB15W9+lyjROLCaudmIOhtrkaPiUHIOZVEPY0TAuZxTaJ4fBagtz2l3hKsYf8O6yTUOkdLyuqbcHTeuGfeS5YsyeVU48iiafCnmGAouHPpy5wlsGzBso+sz/Tz+1Yhh+4mU1ltGzVhj921miJRQd4OkQcfJ550nuzX6XbfgT4jMzQBfJKB2reBr1gYg08YLixhW9W+5mtA6eMLH4SwLFgjdiDhiys/GFcMswh887rxvWp15xgkhcYCXv4/03g4mm7KS5ledQsMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QbNhltnibXWyf9erJfo9MPkSlnGoHb9XreV1i/FRNM=;
 b=W5+v3dMIiQa/LlAIFSVZ48kg+uQ/APCxn91PlgA8jldpZyCkjJsTYpuJ3XVjiPOCOjWx/P7WdrxgfI8pv/X5eNbPDJKANszp1Fi+alBC5/nZOI6o4oUe4X+EIMPpCyOPhd7AiFxfSjBRWVGgB5Ok18egdmZHBSx66jNWWey/WN+u7vt72VYAyaywEFwAax5EKYcLmbnIK+B1INOsUwau9eVDcBGG1rOggAEU/Ck7/lY73H0WtaepzZYihtBkuT7YVnY35js68tmKJE3W4EmWRctrBhxhi2jw7oYvGGtj9d1DBpdGDreQdG7iFG4g0oD9RF2a+R7wn2i3QD+4mopvJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Mon, 8 Apr
 2024 11:48:10 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 11:48:10 +0000
Date: Mon, 8 Apr 2024 13:48:08 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Check pat.ops before dumping PAT settings
Message-ID: <20240408114808.refdhytzjg4d5i7v@intel.com>
References: <20240405143625.935-1-michal.wajdeczko@intel.com>
 <20240408072348.rvt333l6ckepylc4@intel.com>
 <13d417c7-365a-419a-8f9b-c6aaf695f1e6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13d417c7-365a-419a-8f9b-c6aaf695f1e6@intel.com>
X-ClientProxiedBy: DB7PR05CA0048.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::25) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7925:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HbpiaGfruBFSNRBw7gMkz7CIKerKeYSrmInRfq0hzSOuHs58PRhVnV7ccdrRre+LcNyZRrEsnPH2AxAF+r04gi1h6fg8eTw+7xCtivZMQw0eiyN2zhIye+4nvJ7gmDGNV84fzxmEjfCkmZXtudHyPr/UJio5Byn52lKVHC0qE4GwwYueh/Qbvt4q7bT9lK1bMdqB0IYhYKDGFf4TCWbpw9w1vgiHsCTg2PWsGjl6P4eK1GxqBNKiZX1bpEXjK79TwbKWed8edWudH7aqcqe/IliskvISzvlC+slYj8vRFOfZCeYpg2xlwqSOTXsIw4C3PrLvoQf2FRmhAW3932nuMWe02irdcNWp/SKFPp0tnIYRtFZSX+auhezgPCbQ9x43+Iy14DA60LhIEliRHyUQnMc5uhzvooOYaz3eTsVsi1QgBTIKGwBkoYiA6bKj4f6WrzRH0+mri5B7yNInTxMes8Xpoh4kopt93r96Y0qDHUmWOSlYKyErnEAHSD6T4DLgTclAVfPUY3LGZ/8cohkhCotEORJ49WAeznqQw+QLtOP62cpqJPgLW7giSnq3F6ns29qyfMqPbTsSSV5mEtVUwoTuHUpJpcZPjoMqkfRfV+ITyb4rpqvaPtQY28mI5Q3vjiE2u3FOQ3LOOiV2PLHo2vfB5ZH8kV/jJv9PhSzcQzI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXI2eHpYK09mVDdaa0VVTXBoM2JPTkFTMmdrdWJOV0p1MHFYWDJXTm5oQWJC?=
 =?utf-8?B?a2wxNDlIOWp3aDUzQmJoUFJlKzdwQXg3M0sxa2gzRnhyZjFPdmxHWWxTR05S?=
 =?utf-8?B?LzFvMkhIYUR0Mkl1amJSQm52aWQxSWhGTzBhangrWGdvUXZOUG5TRzIrYkx2?=
 =?utf-8?B?L29TalUyWGtoSE1SSzFCQ1V3V2s1SnlNbEpyV29SQmlLam9GMDVFWnE2QkVK?=
 =?utf-8?B?TDRXRFdoOWN6bzFwdU9oWUlMU0VONGwwaERvUU1HNytrVmJlVCtaV2YzMjIw?=
 =?utf-8?B?RHB2bnlLdjBNb2JsUWp2THdNMklPcTdoblJuY0JjZHVQTnI5eDJ0c1lTLzc1?=
 =?utf-8?B?STlMTHlPZWVlVmxtQ0ZnQjRwK2hzcG5zWW9Jai9Qbm5WcmdIQ1pjblpOWHZS?=
 =?utf-8?B?K2QzZGpKQjdMV2MxTE5QQ3BRV0M5am9lUDYyZW5XY210S281RzYyNXJLUldY?=
 =?utf-8?B?VXNxamVjaGhpd29LeERTVzkvSWFGeTdIenlWWWRVajhIS29KaWJJc3pNMkpJ?=
 =?utf-8?B?QXRXUG05UHN4ckM0YU5IRVNQdTRkQUxzc1dudWtQTEIrQzJwOWswc3RhdVA5?=
 =?utf-8?B?WDdEaFE3clQ0bTRwTzg0YWltV1VScURzRWd2M2ppTDlMWm1VeWppTC9FYTRI?=
 =?utf-8?B?M3VyamVyNzdyTmFERXJUQUl1QlBNRCtoSkUwb1dzbW1UWEZQUm1nM3JWVktq?=
 =?utf-8?B?dmV6RG9qMEhqNEJ4U3ljODZiUnBBZTBtZVY0NDhsVmhkQWJiWFBrUm1YNm9o?=
 =?utf-8?B?R09QeU83NmozNUM5eWRlcGlMUGswbGdHcGJDU3VHeFdTQXpIRFVlZ0pSU3RS?=
 =?utf-8?B?UGtjeGhhemlFeWZnNHUxSGJFUUpPY1dUbFVBVGJ3K3hhNG5IVlB6ZWdNaW5X?=
 =?utf-8?B?eUJjd3o4eHVReC9Ea2duZHFoNEk0WjFKb3RsVWp0SDV0NkFYaVFzTmNBeThu?=
 =?utf-8?B?YmlGRzZQZUJEMzdMK244a2R3YmY3REN3ME1yVE8xR2ltWGYwQmEvdWwwVGlI?=
 =?utf-8?B?WFNRMTZYc2cralB1b1IvSHNmYkNXNi85bEpQRW9kUyt1ZDN3KzBvSlhBeDJ3?=
 =?utf-8?B?bGdlTE9mTk9zYXFLbkFjN21wRDl3cjNuSWtkbTVQa2RLR1pTYUhiRlBrcDNv?=
 =?utf-8?B?MUlra0lzZE1PNnpyQzdVaTdOOUNSd2R3WTNxWjV1bzFNY3BNMDBCUGRqd0Zu?=
 =?utf-8?B?WHA1UnBmWmdGM3Fxak1YTVVBYnd3NGI4UlI0VFQ1bXhXSmUxTlVmVlorM01D?=
 =?utf-8?B?Q2x4WUxnN3hmSGd0TkJ4NFB5WGs5cWlmbUJpTHBYUTFUOXpuTVE3WG9CL3Bx?=
 =?utf-8?B?c2xYTkFFYk5SVlFXTXNLTUhjbVZxdVh4eVZWMXpCdXJaQmVMZ0tHMmI4cDdq?=
 =?utf-8?B?bmtCdEN5Yy9oaWxBTzduNjVGUVZ4Nk8vRTBxd1JlM2Jpa01kTGhsMHNiRm8y?=
 =?utf-8?B?U1NKL1VSWHE4a2JJci9VK2R5c2tQUzJQeFduKzZlTjFMYUN5am1MODNSelJo?=
 =?utf-8?B?dFdyNmNlZUFYdnpjTStPUUZhNktOaWhaT21zazlBTTc0Qms0alk3Nm5rVStz?=
 =?utf-8?B?azZFbGNRRXhnRW55a201S1IxblFxNGRPUWpPMEM4RzBLb3cxQ1dUVjBvR0N0?=
 =?utf-8?B?SnIyVjQvVlA4QVJCSWRxMmQ0T2dackdGdVFjU2pSLy93NjRIeHorVC9ra0VQ?=
 =?utf-8?B?UVI2eEw4NXBoTjhBTTVjNDhvQ1A2OEg4Q2hxQXJkU2FWazFXWU1vZVJBVEN5?=
 =?utf-8?B?VWJlamFkU0x6RzUxMEFTSG5HKzVHbE1jc2I2eE9Ubi82UjBTSUZNVk9GL1Jw?=
 =?utf-8?B?K0xZN0tDRTVkNjB0eWt3M2xoR1AzM3IzS1d4ZU96a1l4by94NUdjWnErVWFZ?=
 =?utf-8?B?OUhRcWFMdGJOK3RkZmZrT0hORTFlTm9GS1BqR3cwR05DL3piTEF6TDBZR2NN?=
 =?utf-8?B?UEdjOU9NZ0hYSDZQa3VOclJRUnR5ekFKdVRFdDcxcFZxaTdza1UrQTk2OWVQ?=
 =?utf-8?B?MTVpOVVxc1h6aWhMUlgvZkVjaDlNdVM4RzhWTXRXZ3JuZUJ5R1lCbU93Vm5i?=
 =?utf-8?B?cHBRYUZzcEFPQjQ2WE5qN1plMVFOK29aT3hMbFpvb0VvQklLYWxhRitDZHZq?=
 =?utf-8?B?azBhK2VoWmo1Y000Qm9GbnZKSXVDOGZUSkRhUXBTQ1NQVExvNjduTmdNUVZS?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b36f7ad-9fb2-42da-425c-08dc57c1c39a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 11:48:10.3392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDqBVb+NqLJt1iCqULBoPglR4K82igTSmZIO6BhWXJOLEW+qfN6TmBZM9tvNEKbSJdqdaZtFWp661HPxwgdmYGl7GX4NEI3tgA5IQYVMom8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7925
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-kwi-08 11:06:27 +0200]:
> 
> 
> On 08.04.2024 09:23, Piotr Piórkowski wrote:
> > Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-kwi-05 16:36:25 +0200]:
> >> We may leave pat.ops unset when running on brand new platform or
> >> when running as a VF.  While the former is unlikely, the latter
> >> is valid (future) use case and will cause NPD when someone will
> >> try to dump PAT settings by debugfs.
> >>
> >> It's better to check pointer to pat.ops instead of specific .dump
> >> hook, as we have this hook always defined for every .ops variant.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_pat.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> >> index 66d8e3dd8237..f0031c2e9818 100644
> >> --- a/drivers/gpu/drm/xe/xe_pat.c
> >> +++ b/drivers/gpu/drm/xe/xe_pat.c
> >> @@ -447,7 +447,7 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
> >>  {
> >>  	struct xe_device *xe = gt_to_xe(gt);
> >>  
> >> -	if (!xe->pat.ops->dump)
> >> +	if (!xe->pat.ops)
> > 
> > You are right that we currently have a dump pointer set for each xe_pat_ops structure,
> > and in this situation it is enough to check the ops for the cases you listed.
> > But I assume that since we are verifying the dump pointer here, that formally, for some
> > future case, we may not set this pointer.
> > Therefore, it seems to me that it would be more correct for you to check both pointers
> > here: ops and dump.
> 
> that was also my first choice but after looking at xe_pat_init() and
> reviewing existing ops that choice didn't hold as IMO keeping runtime
> check for future potential lack of .dump hook is very questionable
> 
> what I was considered instead was to add to xe_pat_init_early():
> 
> 	xe_assert(xe, !xe->pat.ops || xe->pat.ops.dump);
> 
> to perform early checkout of the selected .ops and make sure that we
> didn't miss to setup .dump hoot but then realized that the other hook
> .program_media is used without any extra runtime or debug check while
> some .ops may have it unset. so finally decided to just go with quick
> fix to close existing gap, postpone further fixes to follow up series
> (that likely could be done by the PAT code owners)

Yes, you are right that the other pointers are also not checked.
However, we have a small difference here:
If someone in the future forgets to set program_media or program_graphics,
and he tests it on a newly added platform, he will quickly find out about it
during device probe, because it is called in:
xe_device_probe() -> xe_gt_init_hwconfig() -> xe_pat_init()
The dump() is called only in dump_pat_on_error() or in debugfs.
So in the case of dump(), there is a higher chance that the end user has face
a NULL pointer. And I think we prefer to avoid the NULL pointer (even more so
in this case, where dump is not a critical functionality).

[Intentionally I'm ignoring the fact here that I guess we have tests checking debugfs]

Piotr

> 
> Michal
> 
> > 
> > Thanks,
> > Piotr
> > 
> >>  		return;
> >>  
> >>  	xe->pat.ops->dump(gt, p);
> >> -- 
> >> 2.43.0
> >>
> > 

-- 
