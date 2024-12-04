Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67836E7716F
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 21:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297A510E58B;
	Wed,  4 Dec 2024 21:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UoOh/eZl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A5010E362
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Dec 2024 21:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733346158; x=1764882158;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n7VYz7INEnPCAUaxgNOwRzWFidLJckFitfjVZHUTS5E=;
 b=UoOh/eZldQkf0A+LUe7Lfr1S18l9Zq1lHgzJr2okO1J6NVhto6fI7ATl
 9hLGgnFW/jIYyxtFhrMiYvf+wu2A16ET8lWEXNQ1OBemWJhha3T1DUbQi
 w9rswyoW3lUs7te79XwqgWdCIxQmNN7Zf4F3n5g+JxRlOiu7e3fXYrhoQ
 d0mBahX+U+8AuopZikpMjLamO6qfiZa4xhEpgIn0ENuOycZqDub27enbh
 B/nCG+GwdL8aPUZUIH/kyVLAMsjQ6kdTXv7QHUkwYHvlsprxIJI7f5t9y
 +SixhmWdioM2YlhA9x2dJJQUGYYXe6OTBxsKq/whFqtCs+YNZ0PYnY14L w==;
X-CSE-ConnectionGUID: uKARi3GdTCSDNRhqY2jPnA==
X-CSE-MsgGUID: ohywoa5uTwK9KOQzo+KM5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45021881"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="45021881"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 13:02:38 -0800
X-CSE-ConnectionGUID: vhHcPaqZTLyYKLnYBDkGsA==
X-CSE-MsgGUID: 3f2SqIBGTFmgz2rVFqPKoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="94709585"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2024 13:02:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 13:02:37 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 13:02:37 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 13:02:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9LM7L1Kn4WxhSwXo4+37aRCpVTZZ73BVSDlhgfgKcBGsJzuYu7OQfUJxYdv8WDPtzceMFiWx/t3zkRvr75ttAd0otIXhAKIynO53Z2z+nfix7AQZ+CxR8Npw/mOOqfi5N2Akl7dZqHfwrq2+YnOLuO0ivWj3eNvOe/09Df/GXCvN5HI2F0PQIn5Nyz//byBvb9DCNsRtrpfaOPrMY5noZIdjEu3Uq59Y495sprNubL04CGbZkwPMRk21NGwLf+LZ0UxAzOEqyeF6estbeWCmxpojXGqBIRzUNooxfsl1wxQdvpMyyBiFPAbd3Fc1OVsY224qLpirparwu5ypNMz+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dl0BpxoCwPF6Yd6kHSxyhodydZkAHQkj9AnPuT2ef8k=;
 b=IbcFTXRm8LbbpjqibUFHbOWwD0jfqXYmjBqG37Z3oNkLnI6gFBHROgFemI13DVftDgydHnNii5CMdiI2jUtn3dXQ+a8L8o/OqByNNGIOEpivA2c45i1TPk5H0sjI57xzvaTaLaFFuCWvLYlJfsY4QUWXj7zxh/6kRNpt0D5RjCSLxZAiiUzqoFlHEPUOeIKgCghrBrrwSYqynabw1n0XqjMBdicAY7ea2rNxrG7cObmcCWCeOOL+KYTlXw26mUMhBp0nwr/TiJ32PefnTf5Zc8WDgo6Snct5Y+GhPH9z+gLdTSdvYPKV8wiYq2oXExiD7aS6RBTysxbj3oEQHwSJaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB7016.namprd11.prod.outlook.com (2603:10b6:806:2b6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 21:02:34 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 21:02:34 +0000
Date: Wed, 4 Dec 2024 13:03:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 1/2] xe: Allow a GGTT mapped batch to be submitted to
 user exec queue
Message-ID: <Z1DDkQuDAiGBQ+ny@lstrano-desk.jf.intel.com>
References: <20241127003127.42560-1-umesh.nerlige.ramappa@intel.com>
 <20241127003127.42560-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241127003127.42560-2-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::12) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: b65d3300-03eb-48e0-62a7-08dd14a6f973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Itls+EsrvmmpFs4oSVXzKLMcCKvhJ4B4Yn5Y4CWiIjE69dGCr6R1O94EP25f?=
 =?us-ascii?Q?FgjY2rEQF9J7uwJKKr+La3ZtNzV5jks+tqffSTsmU1aSdJY+tX18f3DnhB0h?=
 =?us-ascii?Q?5wqyi7dBLEvrgTX0/jTU/uFnZDKfc9gxDEkkB2gm4byx1RHdym8Zzh1yr1FS?=
 =?us-ascii?Q?D20FRkbCAEJDjHT0KdHfgHPixV4Hm/m8DspPxECgl94RZTZ9LVtKbEG1Ci3Z?=
 =?us-ascii?Q?afJAXK95wLsKWWgWpma2CcynAUn5JRBiz6pQT8aRwE8iyQ1TpjcidgAp90V8?=
 =?us-ascii?Q?Vg/BpCoDZaydRcQw+mRIa9X12W0xihBPjJLFy94GuvvaZtsV7yB9GfpNZYsE?=
 =?us-ascii?Q?Z4vKdq0KaIVhPvaMWeIGWmt9YH/pO8tUL+96eCyPLUmjjWCUGjIFgQQZgg/k?=
 =?us-ascii?Q?WIFQWMemiowJVIyvlqdQc1E7agq3Gbj4PjrvO6XhnhhE+V6h1uc+NarlAmFi?=
 =?us-ascii?Q?3YP0UfRr4Zpj9L5OwIF3iivUNOl8vwhEhrqk4ph5zvfZFPMJSGQBRm9UcSMS?=
 =?us-ascii?Q?NdcEjIXFHVtRe7gpWuCp9JsppGNjeMxOiTVljptUXmxQDQqhRWXZIVw/rDLI?=
 =?us-ascii?Q?68PYFfuntiWpHdRGrdW8b6VP1m4dEiHL3aapykUl940ORA/goSEu/Hgc3JO+?=
 =?us-ascii?Q?sIb1TurR7Q0Bj2dgxcLrGBsnYBo5G/ipgrAP0I8NeYGIyj/+dBx1rAZ6yHLb?=
 =?us-ascii?Q?8krRd4zjpJXoXa0g3RP0NYGaaxnRi3O+qSGeJo7KOO25vZ/ZFTFNWAuzHd3j?=
 =?us-ascii?Q?g9zHZm9iofWAMvn8dOe/caTPYdYJSKbW+WhidGdUn5o5+QpGH2DM23wycoXo?=
 =?us-ascii?Q?UynIrLKeu6Lmdgit3Dr2WoG4mpw4ppDRsQDPqZGgofhyYxRTtv7eh7yxHWEf?=
 =?us-ascii?Q?lmjkRmX3Tl/VKs75dbYSo45+o99W5RzJLSvCQ/XEZZc2ZnnfObP1algw6uNb?=
 =?us-ascii?Q?jVwoThliclC+qEFaXswdVRD38MtEDUAoHUKcKw+xEUV/n56UbxFN0sMXn4VH?=
 =?us-ascii?Q?u7FG2gfv2Twz7ZqNrBbdrz8HADhkM31s/642dsd+H2FgSkpsSMs6H8UD9rf3?=
 =?us-ascii?Q?NW90hJN/huRMZkZsdyS6650itEKZrAS0d31SyvBV315YJ+5XZoNyoAJZ8T8F?=
 =?us-ascii?Q?bSfb6gQGjX7eti/LTfA1NThqK8M80Ajo6GzoWvT0BrggMgzNTHoBUjpMfpIF?=
 =?us-ascii?Q?/7all7UJYEVO7+UOekvFYDCT32/2dkWrEEXQNtAU+JTKsKJtv6Ot44Oor7fD?=
 =?us-ascii?Q?lVWV9twmY43HvhRl34MYyW5DOYcFEDa3jYeUlCh5D1eho1cXCkvasPCO4G29?=
 =?us-ascii?Q?WA5poJBMcFNKK2bH/kxSnWG6uAF9TegY8VQ1ViaHe3lXsg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Wt43rAb7wyuOFMnxHKLuPwSo5kvZceW7WfYZBSVS7Wr8lCl1iTvJf9OukhX?=
 =?us-ascii?Q?Jq2GzJZP3cSLusMhdH/VQse9SW3kZTw3G/LX2YRQAEOrLDDpfEXkndQBWCq3?=
 =?us-ascii?Q?/vBK2rnnZ6iyjSdr0KPVrfsdcPvv+SM5NBkpclDK+xOhsSISBqqp3NE1WIGi?=
 =?us-ascii?Q?a6Dcw3L5z4FprQJMVZR0kBta4iQpXVLqNzy8181rgsnz9ucHJOF/wg9Gbc9/?=
 =?us-ascii?Q?XmSzdqzLPIyCEFXRaJonhhFNIOPqabmDiefVbz4Ic4vZh7vHczI/wsBWOayA?=
 =?us-ascii?Q?foMU+BCoDXbnPGqrmTzOQqQgYuixQjachM/ZxqxLO38LEKFwLqafjDPkXZyl?=
 =?us-ascii?Q?xzR+UNvSJqYM9fU/OtL8/jRwWfr1X1aLVxoiRWDT3ufATZjz6V9ronaDZMWo?=
 =?us-ascii?Q?DB0n5JiuBXC/QCKhvpVRLqZi10ZrvU41GjqvoCGtvsgrZDnIQcmmRfoSEerw?=
 =?us-ascii?Q?tmkIQqv+CTzCYnKTzRgTVIBHwQFMJX8qZjjozLEfT+gEoAq5VahWVQcnzHNJ?=
 =?us-ascii?Q?gFzj9We5j4XBHeWkZghjQdefwQ42/YVa//EllaGkXQUX4nZvgUrv4Miiez9L?=
 =?us-ascii?Q?OcFvqiohmzyHQmEuTl+mfqEuVbdrb40iHA0TX53QumXDzIqptajh6kxcUoEk?=
 =?us-ascii?Q?lbh1j5yzJwNvdk0C7jFEBZBHZjrc4QvJB6tSboFjJtJXNwxlybM/7gLcTcNT?=
 =?us-ascii?Q?nyI+x/XMEG6xkAAGd+56rq7DTfhulPtFhyNs8tpCFae440WWy3oYPFMfx+WF?=
 =?us-ascii?Q?++uw+BUtsOw705b/r8qpqKd8j5AFMUFMzLzb2mye6dSrdddapDdp+9ZYSy0B?=
 =?us-ascii?Q?lRWWkFAV9sx9ZSOPXpoAXkbcSx+KCy0t5ZwV+umBeNtg81JMInckf7VXzP5t?=
 =?us-ascii?Q?stAUg8sT9vTIU+Vb2HiMxYJKTGpFhgQLmEvFugkXzoxbfzc5KqIYxXrL3hs+?=
 =?us-ascii?Q?4S1Nt2nHecW8CnVgCEgpxP21Zb8qNEdcccdBnNqulALiQyils14gHa6+lMK1?=
 =?us-ascii?Q?uD2HTqV/eRX4Bv3rFrQdsajzNH0R7gUJql5mMHiBF3vhAcWvjhJPBy92r/9T?=
 =?us-ascii?Q?yV8iAL21P1m82CZzC2lfjT3mYM8UwsFA3fAKik2/TYZ6BUEq8W8xWmf2g3Qg?=
 =?us-ascii?Q?FuJwxB763VFmHbS+1nDwj07c8wTZvlAppvlpDY/2//QC3oe6W8LvwduQ8fVJ?=
 =?us-ascii?Q?Fmh/U6296gC5MUzzgyhUADE1zfmVDh+ucMbS/8jToHcl+RS5mNQSmQ6DdlgX?=
 =?us-ascii?Q?FCK+XNUB8NDwUmaU1bh+YsFXAU2ZZSBmtiVGzpVHB9Y95PGkW1uK5wUTlHRR?=
 =?us-ascii?Q?isRJvUbrjp7seqU87pGoA2vXAGfSnzQKv1DGWjLCuFgo0cTb4+KtS4tZdaZb?=
 =?us-ascii?Q?gIkpCOU+/c4QwV1vKYX2QfNDean9RwWQRgAlzZ4w5aX6D/bfDL04bY4JXLZk?=
 =?us-ascii?Q?wl3g+IdhzDJ/JuFwMQ8/lBnSBwKZiFdZC/hUBQBVcYK13nykt+NLZEcDSFwT?=
 =?us-ascii?Q?ea6DEiFDQHSavcrah+1JD/4UShvNkGg/c8NeGV+R/7zKyvJ6pqVEtC7YfnTD?=
 =?us-ascii?Q?YqQEIn3UMclkMktP+NfwfvrC7zWbB/5u1NIXuYX7g66ClbAD5NmVsFDQcnR4?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b65d3300-03eb-48e0-62a7-08dd14a6f973
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 21:02:34.0911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3VhUKCnSIAqe/1qfnKrZX3Tnkax4h+xnzu+qs+E8ppiBQTlZulWPqFDZ2K19A2E0aqh83LSN2y4Dlk4k1aUcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7016
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

On Tue, Nov 26, 2024 at 04:31:26PM -0800, Umesh Nerlige Ramappa wrote:
> For a OA use case, one of the HW registers needs to be modified by
> submitting an MI_LOAD_REGISTER_IMM command to the users exec queue, so
> that the register is modified in the user's hardware context. In order
> to do this a batch that is mapped in GGTT, needs to be submitted to the
> user exec queue. Since all user submissions use q->vm and hence PPGTT,
> add some plumbing to enable submission of batches mapped in GGTT.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c        | 5 ++++-
>  drivers/gpu/drm/xe/xe_sched_job.c       | 1 +
>  drivers/gpu/drm/xe/xe_sched_job_types.h | 2 ++
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 0be4f489d3e1..9f327f27c072 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -221,7 +221,10 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
>  
>  static u32 get_ppgtt_flag(struct xe_sched_job *job)
>  {
> -	return job->q->vm ? BIT(8) : 0;
> +	if (job->q->vm && !job->ggtt)
> +		return BIT(8);
> +
> +	return 0;
>  }
>  
>  static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 1905ca590965..5710d9ab36fa 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -109,6 +109,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	if (!job)
>  		return ERR_PTR(-ENOMEM);
>  
> +	job->ggtt = false;

Nit: Not needed as the job zero alloc'd.

Otherwise LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  	job->q = q;
>  	kref_init(&job->refcount);
>  	xe_exec_queue_get(job->q);
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index f13f333f00be..d942b20a9f29 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -56,6 +56,8 @@ struct xe_sched_job {
>  	u32 migrate_flush_flags;
>  	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
>  	bool ring_ops_flush_tlb;
> +	/** @ggtt: mapped in ggtt. */
> +	bool ggtt;
>  	/** @ptrs: per instance pointers. */
>  	struct xe_job_ptrs ptrs[];
>  };
> -- 
> 2.34.1
> 
