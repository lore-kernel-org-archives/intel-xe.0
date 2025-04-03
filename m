Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28221C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 20:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D7710EA5A;
	Thu,  3 Apr 2025 20:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3O4j380";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48CD10EA43
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 20:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743712057; x=1775248057;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nOFORp1TuL7Of0Lv8FIn59OB7x9OeWr8OXCl0AxSCw4=;
 b=Q3O4j3805aimJdgFpBFZJrS6yoeXs+NWComYbmuv2ZINifYx1xm6hyqv
 SDUEzGIz3t1IbL3jkoH1yrxVTS5b+YIZLHot5GSJWbM1kTdmlo4wKOK3U
 Mt1I6awnTTZxaqeonLDyKyq2cc64/i5IAZOYgnnRxCYoj/A/88CzmD94R
 uHovlVYq7FyKPOznfDDnQJpiw8AbR0Cka6N63p5L4k9Yf1oyyo7uPIiL3
 g2FucBdjvThBGMUKKnDWVKDIyb3r+1dIM4iDAyaa/AkCA0u5WZBCrfpWT
 A8zErmYuyzfXHbMX4FTfCeOfzVEdy+yreb0JO7ZpUdXAGoVngqwgaAIx4 w==;
X-CSE-ConnectionGUID: lGJz87+oR5aAT92LkKGamA==
X-CSE-MsgGUID: CH0FH/a4TFmB/7s+3np3gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55809220"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="55809220"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:27:37 -0700
X-CSE-ConnectionGUID: WUVnKYZcSpmRtyLQOjcZ8A==
X-CSE-MsgGUID: kSAvpvnGRcu4DKho2xYkzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="131834294"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 13:27:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 13:27:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 13:27:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 13:27:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5r9QtySQehon5z4qjmMPZntTdJkz3KE7kABgzN/upgfzx87rbqmrjejv1ie5wzzlDUTm1lQl11owTOz8vHUVnJNCOlE25gZ0YzQNOBIBQGAz29m0UTYyaQg+sjfhBjWj6b24fMV99dCWoAbbU966dn06lVyMHijasp+TR+0BMbpWtlM1E2gGPxP+7USaNa0gOnZBtXMayOv9Vy0+Kiz0xANbR/t/4+YVcEkgNQUCCGMqc9+MjZR5mqIXbLiznK2D80h6P0d5qP+xu8+nkd30vbl3MwgsAoF6PITtxBKmor62rjmLVXLGAkjm+gn8Q4CJDiLqtzQpNkfufZHrOJoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nN3wakREUfHwEv9PJVXrOrOH9z6Dxr7vDIuNUe8tsh8=;
 b=HpLHKa9FhhWgjh1lYyZX3krNoDWEKJ+lkD5hsA74INXL0U/UtODLwjk7N0eSrrU7qYtdPnanwqB8syD9yswuKV2MNrAGnlYecMSAPV5lsCN0nuI7ATwkbTpHoCRaqleOXFwm9MG/YphjO3WUcOYGkLMglEUtuBRQxDoml6vdyDax4SMsvyH7oM7WKIM6RwSMchDY6Wv5FrMFyUvVo3LPwYeamq1EHH3NpsPYLM3nqP8VBs1PTHG8MaUbK+tqaqkSgHDD9C9Myyi2n/DP5mAWWEwE6ZC+TPin2amM3uO0YG888zHQJiElHwVmQ8Iwlfx2w2RjHxb/+9VsBMHKQlQAXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4836.namprd11.prod.outlook.com (2603:10b6:303:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Thu, 3 Apr
 2025 20:27:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 20:27:32 +0000
Date: Thu, 3 Apr 2025 13:28:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe/vf: Don't expose privileged GT debugfs
 files if VF
Message-ID: <Z+7vf3ejc0/r6yRf@lstrano-desk.jf.intel.com>
References: <20250403142635.1821-1-michal.wajdeczko@intel.com>
 <20250403142635.1821-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250403142635.1821-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:303:b6::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4836:EE_
X-MS-Office365-Filtering-Correlation-Id: d196e296-094c-4faa-f164-08dd72edf693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ex9YI1ZVToygcLHhNcIF6P6tYYDpHY5Hf5IK5M80mjCLngIKt7KTt+mL/6/s?=
 =?us-ascii?Q?uaKbF3DN5EbT6nb4AuYJ/LGx2Fa3/4k4NhnQKOd1nmrZdysCegT9jfYBg0Vt?=
 =?us-ascii?Q?jZdIchyHcqLI25tbahYNmyAs3Y6/AIqruElYWSSqR8FGVMWXsSOzjkwZDjeW?=
 =?us-ascii?Q?lYf7y0n8dJnTDhjE+5LO4/rCHhSAc2SMrincwpgRUKDj8lo3ndQYwjSAUshs?=
 =?us-ascii?Q?Ed1/LXowUkUWS7k+tbcdsjP8fbkgYN/OTY7dgKjD+K1L7cmQRM+1kbbzbHKm?=
 =?us-ascii?Q?iWJil46UgxZr/4YAC/J4WqUZTpI5Wiazz+u9UY17CCaTcxVAXAzX1w3Jw5P3?=
 =?us-ascii?Q?IcIw8XQn30cLq/W3zu4zQ49nrw9vqvyAXmfxNyqdfDojs3wQk2arokwwww8B?=
 =?us-ascii?Q?3nvXfgbwdZq1q/n1B5xpYszsWPINK7Krhb9WJDgVdq8Ah5ZThErXVUj67xE1?=
 =?us-ascii?Q?upmNaX3le5moz+YKA50QYSqTVB2bUnGH4yiYshIrLfSJvrp5xoBqK5+gySRr?=
 =?us-ascii?Q?fTnYaujR4ceV3xVPoHvNZ9Okjeg4iV92a55RdReoga3D3dHvQBKJRD9fVYqC?=
 =?us-ascii?Q?B2bNFYAx6aSrDuIvMMPUp/ujglFPgzAzzfVcky+CusN1dPhQkZoDMQFIG5cq?=
 =?us-ascii?Q?RqN3HoJOsSJWo844VhO83ghB4bkQlwOg9MAxO9J6HzjCy4peV85ODTHsdQHg?=
 =?us-ascii?Q?NyRXCrbbxLrsnuI8BqD4Ga3Myaoy/3Q9Jz/H8Ya7mGzcAw7+UFFf2/nooJDw?=
 =?us-ascii?Q?duLYFZ4B88jp6qXW0miZPZvvIRY02K/8KNRhx3nH+2LJPIBbxS/H5CZnYmJO?=
 =?us-ascii?Q?9t6MWXsNBkSkjoBZ8eMHFGUnWmBtLxm+0FgDK93sGOpWp3hApQvto2w1A5xH?=
 =?us-ascii?Q?0euiABFBK+Jj3QHgJIPFoG2WRT4ZYBhsVQOI4VdKT/8936DLeIyKT7N8eOyt?=
 =?us-ascii?Q?ek8xfA6TUnaf+rr0WmTLmaA2CgrG2jQI00hMLOfK3KvYH4e9jfJxKu74ZodM?=
 =?us-ascii?Q?2jOwtkQPLaCHSOqdilLu7A1AMjsQWZXT8NRAa1+aBwPet6Kw4dk8v11L6YT3?=
 =?us-ascii?Q?wDfg0s7I1FToz/Z07v1uu0ZhFRCSxpKSyBuxQ35AbT6kFNHAIJLh67XMymAY?=
 =?us-ascii?Q?C4m+9Nk/9gJII0jI+bqReomMBVKNvxiIlzFrUyaNgSfpEyUAOIOgBZrpOThg?=
 =?us-ascii?Q?rkkqbyYyXys/cpoGkitxlaGXIajaC/oLuVPv6cwLV/LT/zpNBXXPFc2G9kTU?=
 =?us-ascii?Q?ntR4vMN89b1r2Lx45kVK0c2jv1NIAOCF45koFA3P/9VhKBag7cOSvzpOoq0N?=
 =?us-ascii?Q?yhzIhylOkycdZirgUHv6NRraNCNtafUDk/UfJk/1XoFgX7p7sDDQdg1apm9t?=
 =?us-ascii?Q?LWDykB3rxm42GKGNolvuZD3WrV8q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jyQcTP7Ci+j0zYqeX/hrPKJzzO8xwhVtDuCbwSuVGUn8V+Oizn4woFK1i1Sw?=
 =?us-ascii?Q?QjAvuTxQngPS5Ns2HC6HI+zkiuXpDnMiVWweOzBn5k2QR/oygqYZf/J89Hj4?=
 =?us-ascii?Q?SdSHMykdyZkg26ebBi0yHIGAtS4uXTm0mVC9SJfU87dTlvf/ag5Tn4ve5nRI?=
 =?us-ascii?Q?huVtcsWc+G83mMsZErLhCm18z3QWXvCWAHLGM+OfNs/9FnGk4bp7jQg38yTY?=
 =?us-ascii?Q?yeqD/ahvu7oqeQHikwUs2cxKTVif38NJKgXWalWHCIbLLtbCEtVqVs0lkrtH?=
 =?us-ascii?Q?oLN/pRD7uBcWHaio0QPUAJXb5cy4waVVB1nvGzHqbP25Bx9pzLohioZe5WeM?=
 =?us-ascii?Q?/GT19ocmx1bzo7IN/lConHedyqjdSZ7ZKQkSgJFNMoSEWVaZ5OFUj7KMCReF?=
 =?us-ascii?Q?fsALb0cjKjB+k4iHF+/uHEPNbesuWp07f8/KsH1rv8LsxPsavg9jbvPo7/hf?=
 =?us-ascii?Q?PYJVSO3foQOMWPvcmbTm/OQs5U/ofpkL1eI+zXUixIvI2TCDoRYKPL39kRtK?=
 =?us-ascii?Q?7QWrVCA+h2MPJ973NLm3Y820RTdWLtFMjhoS8rHEwN4hq2wqbE47hyq3toqY?=
 =?us-ascii?Q?fH567WaYXxEiAeUSvCq234fHFcWLUDxGz4PuPX15xDZVFkmPIbGFYTcJfxTy?=
 =?us-ascii?Q?b3e2vsQ8Pr1+yxOH7uQzMuQ0/1gW6BAZa7qquBxgDAx5LIIlty9Nd4IY0aGi?=
 =?us-ascii?Q?Pf76PU8/eG2NnvPEcCiawb2sdjItfeoZGbk+5N8ut/NHDqP/k4EFJBf9g8cR?=
 =?us-ascii?Q?UYSyfmwVQWM9mQ6+D5hgLXcSLZI6BeaeImCyDC6E107+zn0TUH6UyiXUJNUU?=
 =?us-ascii?Q?0MuFM/tfkqKTLuS8ql8IBEWmQhEeH9d3+EuNgP/1hhac6polT3XQrQL3xtYm?=
 =?us-ascii?Q?J6MAyOFdzx0/7Pj5+nBvQ9uV3Rkjb7h7AAj4ha3iWwLdmMSPYgisZkKSTCqZ?=
 =?us-ascii?Q?BJETIXLdRP81a3roXN52Qnm/KcX6k2Fdr0aSi5ypR/zUUlLx13kfR5LNekxX?=
 =?us-ascii?Q?XR+Jx0SyuT4vgu2BT0lnTcW2c/nrfM0mgLudubi2PZTIQtvWGsZGIEYCg7td?=
 =?us-ascii?Q?SXA+ebGmKDm/+q+MZO9CEjPhkeCo1W90/JK5O2qgUwXQMwzbwTgL5wNN1eSw?=
 =?us-ascii?Q?P8fb0DjU8Skne4LRtXhXfm4yuD6KqPG4dGADQmomSlBmR2Sm2iiGvuqfecOh?=
 =?us-ascii?Q?UeZSeKaJFkFRZ4Y4S/0Y0dFpe46CqlpUbwfowVjcH5HAb9N60MyP3zFSDBHt?=
 =?us-ascii?Q?j6aRA0h6mqPkdGOj0kUNJ2UqiLFDbA/wL2iEPSJYc7fr55Bgd+FAgnHVQNkM?=
 =?us-ascii?Q?mUDMEXIZEK+ipj7Bg6h3+dmA8YDOmKiLeMISC17TkiOnUHTCDFAhFrIUIQQI?=
 =?us-ascii?Q?oPh7iuJVXtKelzouxDjvvHFYyyIsLi216cwNpQA/V+7ySBfZVeEs5HB+MDW7?=
 =?us-ascii?Q?v+5mgdMOtLMizJrLOeZ0HBw/4GgvvCXV3oh1qynpWR4N7K8otEIumXfi0ar/?=
 =?us-ascii?Q?21rvvHc+UUYaTa433XbFyVw/iylBWHPU5lzVT/k7SjZKWkDjJcZjbuvKaQmW?=
 =?us-ascii?Q?LLl5VqKmN5MSGWcm8yh5Sv0kUfhr9cAmxeLpaU7luDixnmAkzCrSXDqNiTfG?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d196e296-094c-4faa-f164-08dd72edf693
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 20:27:32.8171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7otG0VLz1rig8vq6k2G5nWbIOIiWaYBQ5rovBI4DCZhldYt5LvEXc//9B7xtvI0yimE4SJcfLWM3HkhGn9kmoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4836
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

On Thu, Apr 03, 2025 at 04:26:35PM +0200, Michal Wajdeczko wrote:
> Some of the debugfs files require access to the registers that are
> not accessible to the VFs. Don't expose those files on VF drivers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2: avoid "privileged" word, make it clear it's about VF/PF (Lucas)
>     add hint for developers where to add new files (Lucas)
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 2d63a69cbfa3..a88076e9cc7d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -299,20 +299,20 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> -static const struct drm_info_list debugfs_list[] = {
> -	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> +/*
> + * only for GT debugfs files which can be safely used on the VF as well:
> + * - without access to the GT privileged registers
> + * - without access to the PF specific data
> + */
> +static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
>  	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},

Probably don't expose the reset ones to VF either.

Matt

>  	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
>  	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
> -	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>  	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
> -	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
>  	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
>  	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
>  	{"tunings", .show = xe_gt_debugfs_simple_show, .data = tunings},
> -	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> -	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
>  	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
>  	{"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data = ccs_default_lrc},
>  	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
> @@ -322,6 +322,15 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>  };
>  
> +/* everything else should be added here */
> +static const struct drm_info_list pf_only_debugfs_list[] = {
> +	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> +	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
> +	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> +	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
> +	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
> +};
> +
>  void xe_gt_debugfs_register(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -345,10 +354,15 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	 */
>  	root->d_inode->i_private = gt;
>  
> -	drm_debugfs_create_files(debugfs_list,
> -				 ARRAY_SIZE(debugfs_list),
> +	drm_debugfs_create_files(vf_safe_debugfs_list,
> +				 ARRAY_SIZE(vf_safe_debugfs_list),
>  				 root, minor);
>  
> +	if (!IS_SRIOV_VF(xe))
> +		drm_debugfs_create_files(pf_only_debugfs_list,
> +					 ARRAY_SIZE(pf_only_debugfs_list),
> +					 root, minor);
> +
>  	xe_uc_debugfs_register(&gt->uc, root);
>  
>  	if (IS_SRIOV_PF(xe))
> -- 
> 2.47.1
> 
