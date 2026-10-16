Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88134CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 16:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C12897F6;
	Fri, 16 Oct 2026 16:26:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49B511290F
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 16:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792167994; x=1823703994;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5Q0lKFW3KpOvo0GzPkgCa6aqObvo5BX+WjrYBYOW/1E=;
 b=i3UxMvFyLuyC/RahTwFjP9tX7BWBLvOj/CdbNOJxyVfLoHKP3Nnzor3/
 fuNrytdu5CVKpQqCOs2/vpqP9EZoROCVDMdndT27MXB6N25uJ0lIkMxct
 a322qUAi5yB/IgGz8LP4FKiKtaEQogwBeaEwYZVvxO7KY23co8MDxaWzw
 01FOsWMX1uSLiQqkgB6sWPDd3I+/mbI2GqFKge7Xd1bhlLZUA49RbidlD
 SlRQ6Pe5L1W6RvtHk3FodV3c6zyYaYPZEKT/38drqJ3cKgad9EN2HnImJ
 ViZciPibzoHtnL+oKDQpF2jTji7VFJGMHiOwlL7LpMadMhZYAtZGreOgB A==;
X-CSE-ConnectionGUID: xnbRfswtQZmW08R2TCWHWg==
X-CSE-MsgGUID: nQw2KQq2QKG985hEcLLymg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="855979"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="855979"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 09:26:33 -0700
X-CSE-ConnectionGUID: kSBSs7BbQLeFUyprn37Rnw==
X-CSE-MsgGUID: w5nhn3tER0SyUteYl9sZ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2085618"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 09:26:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 09:26:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 09:26:32 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 09:26:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dd8SQGMNnUDZXAoDxIidmK94ldoZp15ObEsBhDQQWHM0So0ysiL0an4Hv3A9MNgcMIS8VMCxLZMHkIRnHLyGnu6ABfnbedtidi42Hvamw60ZIsVzmmPuaAAqH0QJwOE2nf86dY9kNWtDWX4rvjKotMdaQq2xeNP30NoY5b+XzNewfDKMaL7bW1CGmU4s9eVhYLns3tT5UognfVRIP+3lw3EthDOWGrrqlbIWr0DQ09IIWunA/3Kon1jXT5nZGBqunzequMqe3OwG0j5JYk+WY/IvvXluWgGdjNwWVUFcZYVihr7bR51wXqHzUcC+Ri6v3noBBQn6ydhVaQbYgefO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tcH1kY4FYRjDrMaPcCHh6LVuA83dG7TNwRzcGHWrGg=;
 b=G99pxikCbEqptmagQyU8+uJ/gCpcqP7tFgaGJ3hR2Ohj0C/Bvj+i6dOBaRe+LnxXWZKeCA60QzjpNBjScTNf/INsThQsBZQ4KWsQy1cBnLUTCD3VbKgdWFsbIqWoni7tDvqsDbZHctwLK5SSa86jLVpE42t9U8LCm9sCQo7YeujK5gAcqUpTdgBGrTeqs2u7DoCnKRjZG7HlsQJKlE85CVxqX2k5a9u0058XgsOE4ZGLvgmAF6OqKeD1wHKJGlzkhNScXbD/zoEe6XWXbWySR/+HVY7HVFuN78v12VJhZXPBb2jIlHxZTxEeKhmgZI09jyJWLeOgBEqXcLvehcARUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA6PR11MB284697.namprd11.prod.outlook.com (2603:10b6:208:5eb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 16:26:30 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 16:26:29 +0000
Date: Fri, 16 Oct 2026 09:26:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Charles <daniel.charles@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <x.wang@intel.com>, <jia.yao@intel.com>, 
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Disable scheduling early on FD close to
 avoid CAT error cascade
Message-ID: <atJQM5JzVlw71stS@gsse-cloud1.jf.intel.com>
References: <20261015050136.1069815-1-daniel.charles@intel.com>
 <20261015050136.1069815-3-daniel.charles@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015050136.1069815-3-daniel.charles@intel.com>
X-ClientProxiedBy: MW4PR04CA0224.namprd04.prod.outlook.com
 (2603:10b6:303:87::19) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA6PR11MB284697:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f236aed-18e6-490e-ca0c-08df2ba23b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 0kJelzMt78oDAcImfR2pvXVqQrDyz5/HfVTO7mpmQuFJWJyn9nIhGcvU2ffapxnbcw0PoRdA5exisgByB7Ed2777MCMko5e12RXfKUzPdjq6/WkaktfsQ9vMidtc4zUwXLuEfIKbRmvXTzda0MTO082jzUR4pjm+xx0IV8jWKxcf5gVZKY9ng/lZXmXkA/EXo0z0G9P4JUlOGSRxE7Nnn4Ld8um+KsPFQZP46z+Jre1AXiphg9bCsXQ47Xx1ZMEgXp0JFZ5vS4r3C/kQMk9Ebmq97lmfbd7Ykr4FL9FxnYfEM8z/boJTYatCBjW6Fsmzv/rMKqIHIQhpiOe2LRdnjrLSozvmufh1zOyVTAgx53aR0xdM2UY05lQX0/EanIBqEHehX/NvInuV7RQOUCA5OaaCiOtKCTe12QpcfLtc+r8kylLNziJ87Edp3fEcuhi/I1rBY8T9hpyy6gsYx2/g2UKlvk8I6i6T+G0jBfDOvXkAdDxVZ7aqU/wgJNbwKWv4ggvprQbaPVNeHoH64b9esYfYJjDZMxaKGn6wQ9r/2pWowiF31ZkJI7lEs3xEJq6cdg/Ojy1Ea0jVt1QD0yupP5Roo4v37a82mWYnfP29XYj6z8TCorSGR7UJ6fAkqW+Pnjjz5UPU8o4w3NdOV756ZzdPf9pakFePCHrN2afTrJg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YoBpxuBHfe1Vol9tFonPvsWWt1blOXmErgzzeTEycZgbzXpFuYFawYHlqBiF?=
 =?us-ascii?Q?4wFrtQEFZl97dTsISTIknCwjxj/lfJodiljx8ZQudHDQWyU+S94R2fr2hx1M?=
 =?us-ascii?Q?l6TeH/rK8eNcbZSCG4xo36A40V2lQe2rMwCZemuZ7f+WJKKVx1ZBg4rwA27Y?=
 =?us-ascii?Q?d8dNBZi4eI2/E+whrVwDGD5wbnJvEibVaDDZI+egqt/slmsyHBPNYpDGJtLd?=
 =?us-ascii?Q?LnU4FuO/i1nm6NFakwbabwyEy7hxeMp53gedF34zc6ToSE4H7a/xTfjUpalj?=
 =?us-ascii?Q?9HRi0+pB+dd1ruaeOkhtP3YSBaohBavPnwdtZI/zc9rpfV/cn3i8TtEGC1i1?=
 =?us-ascii?Q?xRiKbo3OHpZrUHHOTKesE/XhDUhcifCdASrniGYf+6BZFk8WmeKaMCuWPjiz?=
 =?us-ascii?Q?/EuY6Gmva+bB557NfsIJEIsBY11w/DUbUfz9ypM9HkB+lQeU7qw/krluR10D?=
 =?us-ascii?Q?pJFEeCH2nYTSbjto/41aiFY5g17AWrdwAIVF/vgBmcqXRiew9wN2CAzTwfIQ?=
 =?us-ascii?Q?hAMLUUTo8meC1inN9yC3XaWE8oqADH95A79fQFN6IRIGNVjDGcEnS9GMHqoP?=
 =?us-ascii?Q?aKUlBAadMdA66SAEb+hf36RMpFidVpAx4fj9BGkVL31UwxNoX/K/J8VLP2/z?=
 =?us-ascii?Q?N9mcygLsabWZ45WBcxhLb0pBhJ4PJvZxkMCzkLJb7ZyBSeTMs8PSyy/5A0KH?=
 =?us-ascii?Q?0TBkTP5cQsPikZfHUc0owp+UlHyqxxMhA3kYupzYf1onySMS1sOEqYnyuPMt?=
 =?us-ascii?Q?j6FB/vmBJvQp3oR3VLMbFzDxKzJ3hCwX+pjWVdBcd0k2GCaR/0dkZVXgxt9d?=
 =?us-ascii?Q?krGGDnvB4c2ExtVTCTVt4Zgxi/0mlaIxBVS8uUtOoU8WOcEMhb0BCyZ7q6qZ?=
 =?us-ascii?Q?1hV5bSa6g2ySRpok0fm2QuZya/v2etGynQMrwA/y6kfov9CRzgmIDhipSpIN?=
 =?us-ascii?Q?bgGphcCoodBo017VyOjBXihwwK8343Ejf6GLDtrvkw1VTHGVOjmg6QaYYTPk?=
 =?us-ascii?Q?Ol+BnMXxveWjUmoipJRJ3bR8+ZnT3FScrD+JDUpzxDrwCCBMCMD+uscTCaep?=
 =?us-ascii?Q?0IbsX/K14Xxs2XNG40+cqhEd8yMgdkVBXcotUZg5W6hPULkBjwgQnzuZPNrA?=
 =?us-ascii?Q?FCczQBOhzCTfSlm7RoSAFZUbhoAqVwL8xuCR57IyXeaKMu+e8PJUckZoAJOk?=
 =?us-ascii?Q?Wg9Q3Q+elIbgEtStjWNJmChygUKo9MlwyuzhFxegC0JHmOYSXkVOTelmADkQ?=
 =?us-ascii?Q?yPmzgy/OjrCKy/oTFeMNpZKgshnSvm+eTP8VeWvoluMmRS4QcOmsHVhqc+73?=
 =?us-ascii?Q?DViAfTNbbtgph2Ri7M9EMbUJCHdw//IxgYn5YeEpnL1rZ5jg6g63MN98H/gT?=
 =?us-ascii?Q?vxKAYj0lorOL4De/E1BuH0cutYf1yeqmuv2BWpHwqEzOynmXmNedEaELHAVH?=
 =?us-ascii?Q?aBXwCERkQHtZVj6NfiyfYV/v3E08Ye2gkh3JYCrYCfOKfYt/C1CfYdMz0wm9?=
 =?us-ascii?Q?6nY6iVgOFwx8FnuLZHBzQOJDOUwedeS0aHasRgrZI0ojTGBY5+sHGl/MsvAS?=
 =?us-ascii?Q?QhiH6RtI9AX+4D7QkDc/0Bsv5tjxPOcNTptWZwywq66x+cYGJVwnPT7szxQz?=
 =?us-ascii?Q?jhmz1XUy9oz/Y5NOFPO1Vwlx3xer/SUgYcnjEsZ5UiPW7TOOtsNCBef9HDx9?=
 =?us-ascii?Q?dD1bBB59MIJC17mfjk2bgF3ep3guiMASY2gLgr5gZ0gQ6oNa/sn8B5tJTKJD?=
 =?us-ascii?Q?UIGkfxtm2w=3D=3D?=
X-Exchange-RoutingPolicyChecked: 1z2d7srrdcY33mLQywOtey4DKYl88jykpLKvbD8gaBzhGe+KliTQJsQzlyLEtlPhDnsGBPVUiN3uwEfRJN1KMoXbgUmTi9ECHBTZTqsp96yQMfu9k4F0KL/WWMgetWrdvyzjald8Irac7bUxCGZEy85P2nwT3AXAEhbWAp/esEGBsLbRssnwwIXukeZTEhD7HjmjNbp+SlO93oyZx1AZ2b1AdkIX5oaqC1zDjZJOWmoFFUWCzes4Np4gj9M+BZ2dYBxnrUpHOTCJ4IsP2/EkwI1WWUwR+f931mdnG2dB10zaJk4lXarmbA68fEO9sNXDJQ4ocuVTPmjaDEsnxat0gQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f236aed-18e6-490e-ca0c-08df2ba23b9d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:26:29.6381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMpCxnz+v//HVPQIj0DQEMC0ImX6Lm3+RfxMKo0N6idQn9Q1be05ZzfBgWBsrQrtYI/9hLOhobdbtlIQbNj/Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR11MB284697
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

On Wed, Oct 14, 2026 at 10:01:35PM -0700, Daniel Charles wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> When an FD is closed with many exec queues, teardown relies on the TDR
> path to clean up scheduling. However, the TDR handling is serialized
> (i.e., only one exec queue is processed at a time), which can make it
> too slow compared to GuC scheduling activity.
> 
> In this window, GuC may continue to schedule contexts backed by
> invalid page tables, leading to a cascade of CAT errors and repeated
> engine resets. This significantly increases recovery time and can
> degrade system stability.
> 
> To mitigate this, eagerly disable scheduling by sending a self-message
> outside of the TDR path. This prevents further scheduling of invalid
> contexts and avoids the CAT error/reset cascade.
> 
> This change improves robustness and reduces recovery latency in
> multiple queue teardown scenarios.
> 
> Cc: Wang Xin <x.wang@intel.com>
> Cc: Jia Yao <jia.yao@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Tested-by: Jia Yao <jia.yao@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 46 ++++++++++++++++++--
>  2 files changed, 43 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index 74b711abe2572..89397e1e65465 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -36,7 +36,7 @@ struct xe_guc_exec_queue {
>  	 * a message needs to sent through the GPU scheduler but memory
>  	 * allocations are not allowed.
>  	 */
> -#define MAX_STATIC_MSG_TYPE	4
> +#define MAX_STATIC_MSG_TYPE	5
>  	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>  	/** @destroy_async: do final destroy async from this worker */
>  	struct work_struct destroy_async;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c4ef3e9bf7a18..609af66b343d5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2045,12 +2045,23 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
>  		guc_exec_queue_send_cgp_sync(q, 0);
>  }
>  
> +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
> +					      bool bound)
> +{
> +	struct xe_exec_queue *q = msg->private_data;
> +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +

Here need to wait for pending_enable/disable here like
disable_scheduling_deregister does. This is the CI bug in prior revs.

Also we really only should issue if exec queue ref count != 0 and if it
zero deregiser message is directly behind this kill message (this is the
healthy queue close path). Gate the entire function on behind this
check.

Since I'm ask for changes, feel free to over as author.

Matt

> +	if (exec_queue_enabled(primary) && bound)
> +		disable_scheduling(primary, true);
> +}
> +
>  #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
>  #define SET_SCHED_PROPS			2
>  #define SUSPEND				3
>  #define RESUME				4
>  #define SET_MULTI_QUEUE_PRIORITY	5
>  #define CGP_SYNC_MSG			6
> +#define KILL				7
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> @@ -2085,6 +2096,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
>  	case CGP_SYNC_MSG:
>  		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
>  		break;
> +	case KILL:
> +		__guc_exec_queue_process_msg_kill(msg, bound);
> +		break;
>  	default:
>  		XE_WARN_ON("Unknown message type");
>  	}
> @@ -2211,8 +2225,19 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	return err;
>  }
>  
> +static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> +				       struct xe_sched_msg *msg,
> +				       u32 opcode);
> +
> +#define STATIC_MSG_CLEANUP	0
> +#define STATIC_MSG_SUSPEND	1
> +#define STATIC_MSG_RESUME	2
> +#define STATIC_MSG_CGP_SYNC	3
> +#define STATIC_MSG_KILL		4
>  static void guc_exec_queue_kill(struct xe_exec_queue *q)
>  {
> +	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL;
> +
>  	trace_xe_exec_queue_kill(q);
>  	set_exec_queue_killed(q);
>  	/*
> @@ -2222,6 +2247,23 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
>  	 * stays set until the queue is torn down.
>  	 */
>  	suspend_wait_wake(q);
> +
> +	/*
> +	 * We eagerly send a message to ourselves to disable scheduling, as the
> +	 * TDR is serialized (i.e., only one exec queue is processed at a time).
> +	 * If an FD is closed with many exec queues, the TDR can be slower than
> +	 * the GuC scheduling contexts with invalid page tables, creating a
> +	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
> +	 * this by immediately disabling scheduling outside of the TDR.
> +	 */
> +	if (kref_read(&q->refcount) && !exec_queue_wedged(q)) {
> +		struct xe_gpu_scheduler *sched = &q->guc->sched;
> +
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg(q, msg, KILL);
> +		xe_sched_msg_unlock(sched);
> +	}
> +
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }
>  
> @@ -2274,10 +2316,6 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
>  	return true;
>  }
>  
> -#define STATIC_MSG_CLEANUP	0
> -#define STATIC_MSG_SUSPEND	1
> -#define STATIC_MSG_RESUME	2
> -#define STATIC_MSG_CGP_SYNC	3
>  static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>  {
>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
> -- 
> 2.43.0
> 
