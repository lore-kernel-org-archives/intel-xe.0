Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6937C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 23:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5C910E6FF;
	Thu,  8 Aug 2024 23:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYNPs/aU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C8E10E6FF
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 23:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723159476; x=1754695476;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tAND13Hpw4+ByKKcyLXfPC+qDRmRgG6YaiXlqlIVVMk=;
 b=KYNPs/aUTvpqTXic9OeFhRnQFvPb5WucD6EADT61oWNTEbQVbG3uHzBz
 eCmeg5mrNW97aF2MrD6lAwpCW5GkCN+bIaRYQeSJLQJsaDZMbf2+76YCI
 rP58cbnXVoo+r7EwwmftlEVfe+koZzQ/ZyFPReuwXmMMfKuZe02vnqb9k
 E6aS/vpdcUDtCEHRO+hYUeqYysrSwqtykpHdpWgdhD70rOhbVR45T4yKn
 h68GZX3CMbnwupgtOkdHpfroMw1e/hf7+OUSjZXdI2jpVSGUaSUB63Wvw
 hDyyzyGc+OSmn+gtNSP8j9GMyN+kfeE4mwT8jIdBpHoCqcllbJm6kFNnV A==;
X-CSE-ConnectionGUID: kUlB0UzRQxuUopZH6lwMjQ==
X-CSE-MsgGUID: JIIOm4qwQX+kThWVQ2JIxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32464970"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="32464970"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 16:24:32 -0700
X-CSE-ConnectionGUID: L4/kr9sEQEO38MXSio/Z5Q==
X-CSE-MsgGUID: qxHIBJUURmyUN+ZvNRGLtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57356388"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 16:20:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 16:20:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 16:20:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 16:20:55 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 16:20:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5sQpze9L69T4qs4YZYCC2JRXhvJ1gGJxHrB6YnoAoKNdVvJ4z7M3IUkO1bPC7rv1edriZP+kp9sVxa5a2nyndG0Nbc8c7eaEVJg7sqFt5UmKBcJBk9vRKIWnnCho3XBEd2pfSsvtcniffMsqUqB2WxEs0uPJPRZfXRiA3jop6Fk3dEpa+IvFX9Wx7Dm1I8CPK9wxCzeLwmruSeRtGCcfyX7MYO19xK3kHUaTCGqumKSuh51NKj27HO4+vk7S69e4pQWcpx8UxM8blJCsHUPPcqp2hm8YJxT0jkiQFhn/fAvfEcOHi+SxPBbHOizhJBwbpN/XMWm2UG0aqvTA8wsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BQWdmB9dBgiPLOe8LcO9/3eMSbLdUT3ir67YF2ulJc=;
 b=mCjkZ7AZvYNOTxPtmnV9j1igJPQ+WUoPp6Sq3/v2ofHaaGljrZPuEZdsllnK1LYheaU7Qdndahw0gU5aT/i6zUHamDOxwYJBTrPQuxad+4IsZY1XbF0lHFd0dxa1zhyo0myMYqe34RXghUXCXCr47pbbbTwu/9ywWty5dlqIVQTkXEeIGo0lIBdE5yFSyNbHji5GPcfZrk2+uz4KqdrBCUZcINeOK/XtgdrkVNxgdKo2X//y2RFOFxXXe+o9kpNNof+QM8Vvg6gPhd7F9eGjuHo1K3bSt1BT0YXj01k6xq7//+36VtqnVqMnIiX5p/Xl8DLcXHshWN5DPTPWvUjEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 8 Aug
 2024 23:20:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 23:20:52 +0000
Date: Thu, 8 Aug 2024 23:19:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jose Souza <jose.souza@intel.com>, "Lionel
 Landwerlin" <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 5/8] drm/xe/oa: Signal output fences
Message-ID: <ZrVSgjTbzPameTeb@DUT025-TGLU.fm.intel.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808174139.4027534-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR16CA0007.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: d01e160f-ec60-433f-b850-08dcb800bef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NDk/PcB/iHM43e0NeqLhkLfj/k2GKxlSzwvSSIlz4PP0jeOg7nbhM91yoJoa?=
 =?us-ascii?Q?iDnkb1mG0rF561MhHCJqA8s7yD2hHe+tQH3/clee/E2wX2FpHfJlokoPtcPS?=
 =?us-ascii?Q?sbsM3W/nkovKjW3LpThII1ZjfRXKnerkMAIyMrDz4tY2ZNAXtrxIg1k5CopD?=
 =?us-ascii?Q?ndKoBAJnqSKpdKL7I4eC/50/dA3k6TP335D0ccocnJp2DpD/LMaKE8YNNuMd?=
 =?us-ascii?Q?UEF+w0mQvpoW6cqoSHgK4CPnnMWnVjXzw2FrA56+o68DcZLMJnJBNv544J2k?=
 =?us-ascii?Q?nGO7X7TUqnWf6UKe6x6Ov/Qy9JYxsIH+rTE9vpub0fJddkmEQn+aYq7p+ijK?=
 =?us-ascii?Q?kpXsqC7n7WYttmZ5uJep+vJ3zjfpKfXnNh6t8YKZbtrSOI1D1tc161NWVfp5?=
 =?us-ascii?Q?1ZAIavSPmHBnTYtuxlCC+y/VBTfi6rt9VcQnr8ytSMMEc04Ug2bnPO6m7rca?=
 =?us-ascii?Q?vr5XsXbYnV9efa1gND7RMXhZ/BvtJmcFhFHEYdTHzATEcVdfvjMCcVfxRt9+?=
 =?us-ascii?Q?qh5Eq2ItaxKbqUC/Qmd9W5neuvUzJtUP0Ny89Zn1p7SrfzWJckvrAs8mMOVP?=
 =?us-ascii?Q?28cia1hpF6PPD54QO9nT0dbwMHs6S06NHB1rk+RATkcrmi3XH9AuMa/F66jn?=
 =?us-ascii?Q?5WdCDJnJ/WGajERMi7RtQIjZuMTGDkop+4vUEDG75gqbbtU562cJiTOo7Q2d?=
 =?us-ascii?Q?efaFK5cEkZSukSyCSRbc0jZy5gaT+Zgzw1SXTisiG0c1WlaS197w+4ReAyEo?=
 =?us-ascii?Q?mgMGo/XxXkDo1wWduUPRXWK920lVIJdsdyBexYe7Sa3s2K0V6hTcuNl8ftfX?=
 =?us-ascii?Q?bPh9PnC7H54TclBOrfMLxWMq0RuPYewpjIYfnFRJ2Wn4zmVh9pMhkm1ylkw8?=
 =?us-ascii?Q?+7zr9ZaD+dp8bBiu68U6OMfzOWjYDuD9UN7AdX+nAhDFmtNc66USCjXQ7/so?=
 =?us-ascii?Q?MoUmfAx+dV+Cuw9J64Uom9j/Ph4Zfv9hsBObslxbJ98BuruXGQi5z4l2FuQB?=
 =?us-ascii?Q?L4+acodcU3Ks9Np87nijFLVDv2ubNpylRG//TvgDZm40OS7CeUT/GnvSoQ9O?=
 =?us-ascii?Q?UKWjti/q0c5Oe74wcXs2jbmK0uaqbAV/DsRy6oHDk++biOLPJVNt/2TNU9T/?=
 =?us-ascii?Q?f5Pmdyzu1NecaKyzJI8YOMmJV7+L9s+gne8Ua3WCeirScbsG6AWYzo3PzeXA?=
 =?us-ascii?Q?TICs1nEhDZRtaFjFdAcvY63vzrY8N6Q3sS8oSjE01avbsDzuILUY66G0onzT?=
 =?us-ascii?Q?Yz02Apfv+nOrp4dh2aBwQUZRmRSp2MXjd4Ef8G0p/6OVwXd4Gxg3vwXmK3lZ?=
 =?us-ascii?Q?1/23yB8ZqSvIdLz9jLKNzY2yucfsZFmeQ0THzJKUgEf1dw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FibDcqZMoqWRkXLcfXnFOFeXO9DrdBVQSRKbsuWdgU9R9k0lQ4de6xssreB+?=
 =?us-ascii?Q?Cz6G47Sz+lt3C8YsGLZhMv1z28TccRtL3j5GB8+mpTA7Q7FC3ha49g/9h/FW?=
 =?us-ascii?Q?jEACyxd005FmHlqOz74YJqLbTKZOJjRkGitv13pyD7TeUe0cgDeAZ6AX6agd?=
 =?us-ascii?Q?PQ3HqI4ZEn3bzFAwalgum4R7TiydGWMn9kLDnLoKqqvh0p1BUox7NI/8bPmN?=
 =?us-ascii?Q?zvt+0+MlmOjgoc+HWaUxWYZNcBedNFoUpmdljbVrZ5Lp3j6LNoFWMRv0npEz?=
 =?us-ascii?Q?J505a1R9bxiJPzIu++XowncRhq016J8PBJBfy5T6KlPrMyAbADKgvHxwmQBB?=
 =?us-ascii?Q?ju2crwr33xzsdsH7jZ9qCMpzGh/Hv2YTFASsudU23l/u33h/P2vHNwdoV/OO?=
 =?us-ascii?Q?rDLlsTgWOK77bT+2u0lDtv5adS67Bpmxf2b1oQK3781i7nq0/mNwNHb8LVPx?=
 =?us-ascii?Q?jccbTyJF5Og2q3uhPanSr32MGD8XM34tssgP91dzcN4E279gRfWmtE5n5+7r?=
 =?us-ascii?Q?5wpg03C3EDIHsBlyYR1f6IzXSrx9NoAkHZZ/Z+8OlPVi07fE44antn8Gk+Lo?=
 =?us-ascii?Q?lC6C2e8SNCQ1feq5H7w4nWxe2FdXowdjISvU1eMqLuBp31BdN2EASXRzU76M?=
 =?us-ascii?Q?GLO/OM0QoQODpxeXOr/5EjesrabHcPkR/YW8VQFr2LXmx0VbJkI169m4Tqzr?=
 =?us-ascii?Q?Zv4uKD2swh02cdCtsCGozmrBIRegnaXck+UPyETxTczPspF7LZU1/KNzYDg9?=
 =?us-ascii?Q?RCnJh5PT33E/bELGYPW4M5/aHVP5X40e1pU5bR7Fd1KNgwvIgukzEul8tvmC?=
 =?us-ascii?Q?i3a5LyQa4xgF3D4b8mG/K3qXsCkLM8FLqQFEwNlCfC38OlAzth/x9pEC3wtn?=
 =?us-ascii?Q?HOmJgyXLat6AgDMJMJNhoZzqdNQIQ1n8boE/3TyU4Gtll4UGS5HJOPFJWSSt?=
 =?us-ascii?Q?rdWGbvSxho/xS8QHPpC8QNXHzd3ufb0IrbZCJr1JgDu1qmgZ+LRAvV17lWfj?=
 =?us-ascii?Q?Emf2sbao5v630kHFbxS0c9jRAeqzYkyEh5Wm8aZjkPRnVnwHhTR66p6yc5RI?=
 =?us-ascii?Q?B6dvUT3GUyt/nKBV1JitAIZym7NWhtOuPG8tsOuMoMXS3VtBfMcmQ1VjiIhF?=
 =?us-ascii?Q?k6e0py5yB4fWz/W+wBhBC5XJdlCPqAm1FtC0JtJWDoo0Q/B2I2K0K7nDM7/2?=
 =?us-ascii?Q?ZIc+bWXSYajvmPDtXPf7sgURqmZyIERFkUVw5pikfsKEReVvEyh0px10iru3?=
 =?us-ascii?Q?G+pCJw2dEgcMqawKv6F26hjdbx/ANH+Th5oj6tHlNrqIyZ4InxVkxDwLuXX3?=
 =?us-ascii?Q?ipXC+Kl3XyJF/FbxQ+6mfuxLDNBzaQeqk5baM0GrRfuN9Exsyn6sHiSysbak?=
 =?us-ascii?Q?9Eow40jAa/Od9SAF6/rL+InLMHETV7liiQNhPb8Tl9qEpfLo4tamrWksbGvw?=
 =?us-ascii?Q?mhVmSYWZV7nchl9lcYB6MwtV/XO1yOED2lnda+bVWBJglvuLUtakS9YQlMFw?=
 =?us-ascii?Q?TYunx5c3xw87W+INoyxTwfsXM/jz9q6nhxBOvFQXNmf5WOnVWNU4cdEfmPVS?=
 =?us-ascii?Q?FFblRVnLTxycEXaSpNV40PWTrJieq3rJlyz6KuK7Hp3Gmp9/XPqy5OLP0bGL?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d01e160f-ec60-433f-b850-08dcb800bef3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 23:20:52.3829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOZ6tNZGmxSnwNdYCiDls1C2LenveB53R/JahckQeg2L9lYIKxP3N7sx0qkS28YpI3y/IH7VvD8zs5mEF4i+6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
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

On Thu, Aug 08, 2024 at 10:41:36AM -0700, Ashutosh Dixit wrote:
> Complete 'struct xe_oa_fence' to include the dma_fence used to signal
> output fences in the xe_sync array. The fences are signalled
> asynchronously. When there are no output fences to signal, the OA
> configuration wait is synchronously re-introduced into the ioctl.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 46 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 416e031ac454b..bc421cd0af6ba 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -96,6 +96,10 @@ struct xe_oa_config_bo {
>  };
>  
>  struct xe_oa_fence {

I don't think you need this at all.

The fence from the job can directly be installed via
xe_sync_entry_signal between xe_sched_job_arm and
xe_sched_job_push.

Then before xe_sync_entry_cleanup check for !num_signal and directly
wait on the job's fence.

Matt 

> +	/* @base: dma fence base */
> +	struct dma_fence base;
> +	/* @lock: lock for the fence */
> +	spinlock_t lock;
>  	/* @xe: pointer to xe device */
>  	struct xe_device *xe;
>  	/* @work: work to signal that OA configuration is applied */
> @@ -953,9 +957,26 @@ static void xe_oa_fence_work_fn(struct work_struct *w)
>  	/* Additional empirical delay needed for NOA programming after registers are written */
>  	usleep_range(us, 2 * us);
>  
> -	kfree(ofence);
> +	/* Now signal fence to indicate new OA configuration is active */
> +	dma_fence_signal(&ofence->base);
> +	dma_fence_put(&ofence->base);
>  }
>  
> +static const char *xe_oa_get_driver_name(struct dma_fence *fence)
> +{
> +	return "xe_oa";
> +}
> +
> +static const char *xe_oa_get_timeline_name(struct dma_fence *fence)
> +{
> +	return "unbound";
> +}
> +
> +static const struct dma_fence_ops xe_oa_fence_ops = {
> +	.get_driver_name = xe_oa_get_driver_name,
> +	.get_timeline_name = xe_oa_get_timeline_name,
> +};
> +
>  static struct xe_oa_fence *xe_oa_fence_init(struct xe_device *xe, struct dma_fence *config_fence)
>  {
>  	struct xe_oa_fence *ofence;
> @@ -967,6 +988,8 @@ static struct xe_oa_fence *xe_oa_fence_init(struct xe_device *xe, struct dma_fen
>  	ofence->xe = xe;
>  	INIT_WORK(&ofence->work, xe_oa_fence_work_fn);
>  	ofence->config_fence = config_fence;
> +	spin_lock_init(&ofence->lock);
> +	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &ofence->lock, 0, 0);
>  
>  	return ofence;
>  }
> @@ -975,8 +998,8 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
>  {
>  	struct xe_oa_config_bo *oa_bo;
>  	struct xe_oa_fence *ofence;
> +	int i, err, num_signal = 0;
>  	struct dma_fence *fence;
> -	int err;
>  
>  	/* Emit OA configuration batch */
>  	oa_bo = xe_oa_alloc_config_buffer(stream, config);
> @@ -989,13 +1012,30 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
>  	if (err)
>  		goto exit;
>  
> +	/* Initialize and set fence to signal */
>  	ofence = xe_oa_fence_init(stream->oa->xe, fence);
>  	if (IS_ERR(ofence)) {
>  		err = PTR_ERR(ofence);
>  		goto put_fence;
>  	}
>  
> -	xe_oa_fence_work_fn(&ofence->work);
> +	for (i = 0; i < stream->num_syncs; i++)
> +		xe_sync_entry_signal(&stream->syncs[i], &ofence->base);
> +
> +	/* Schedule work to signal the fence */
> +	queue_work(system_unbound_wq, &ofence->work);
> +
> +	/* If nothing needs to be signaled we wait synchronously */
> +	for (i = 0; i < stream->num_syncs; i++)
> +		if (stream->syncs[i].flags & DRM_XE_SYNC_FLAG_SIGNAL)
> +			num_signal++;
> +	if (!num_signal)
> +		flush_work(&ofence->work);
> +
> +	/* Done with syncs */
> +	for (i = 0; i < stream->num_syncs; i++)
> +		xe_sync_entry_cleanup(&stream->syncs[i]);
> +	kfree(stream->syncs);
>  
>  	return 0;
>  put_fence:
> -- 
> 2.41.0
> 
