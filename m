Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836B1CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD0110E927;
	Tue, 13 Oct 2026 18:52:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DD210E927
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791917572; x=1823453572;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e1dBSe3iBzUOMumG2wsqswWRj3iWdQaInxInikK9ywE=;
 b=OECej0W02ttXjBfJfbGf1zkVtZcWM9BhP+Y23MkmcfqXrXdCbkaFV98a
 BimsKOKMXG5iltUpSMFuRq/kgg7DDafKqg+DJUx6piLv3WD0JlftEw1E8
 bjlS+av3HjqW0g0QjLYMcLtjoIMfbMQ2l5fPY0om/1nFR722VlNEKqRyS
 0CuMyx6xnRCWq9aRq3YyZSWZbKNc6VUXN1vYnfV7JLFD0j7y648odc80+
 swHcW/rMuM+wHkUzKKl7XrWbKd1Lloen3JxGZMxR5+0OrjyRM77GgJXwC
 xGflYrFAe3HHHUr9aN1PqwWk2TiOS1V7r3zXGhq+uAxbU1U3FyfY0WnGK A==;
X-CSE-ConnectionGUID: X3q7rcRwTmWzrHA8oRdSWw==
X-CSE-MsgGUID: JkHVSJ3aTDSbLbAbmfaoyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="542188"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="542188"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:52:51 -0700
X-CSE-ConnectionGUID: zHye9kzhSfGNdCbaQ3YU3A==
X-CSE-MsgGUID: rbmGLu8rT76Sp93SLHje3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3075624"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:52:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:52:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 11:52:50 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:52:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZuwrvw+mkGHCqkvNPcctJOQ/CSMGpqwuOLeDXA8e87hhJELZWAGjEh/VmBYAvS6U5bIhhShI2Ej+IEnepQsox2USuoNGqIyejzVUdoXC45oKEQhU0EAOQ+KxWLdBPa99XW6SVivBvjvTTtUulNU9sdSvjk+pybwx4WLl9v2vbQcDzXBDztLznDlI5YFS+W2Nuvldqx1BqBMoqqze+x6CzUf4Zc6ilNqP1cPUNOaLLXjRyp/CjyO8nVfpcDLQNGVh5rnRM5xiQ5dI42tNxPr644dGVPSzlT0RhUbCD02+LJrnNWqcS4ECxMIVogBY99BsL/j7kJFJCEo8X28szdh8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEkoKg/Dr34RtVS34Y/y1KBX8qkQfL2DO+Ny9Op8GhA=;
 b=AjZDUqECwgCE1Bt2JkoxbM0yFW76qrCRQAll6Syxlh60kn0/JRDCFLkDq2UZlaonHc5pvw2jvk4bxfTxXzMrUo5miR8b1JbQ7G7GMxFrz/BgehO9iNygDLeuB9v5NzkZBS0na1zABGxU1k1vRTpvn//NAOpz7maK3dz9kQK0uMBYmxXpPKO+jN5p3p3KXKq8atPoXxxRWqyQKkXelySMFOFqIOr9bIXQRBjZDZiHNyXbPkAe762mJ+zp/e/iz+u+WpV8CCgaMQoUSaaGQCaLes6ekjD0b1SSTbQ3wcw4mkBPYzHg5/Qe1WqKKnwx3qwO8nxsdZJ/xLa8nyYhM9Hbpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22)
 by DS7PR11MB8826.namprd11.prod.outlook.com (2603:10b6:8:256::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 18:52:45 +0000
Received: from DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb]) by DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 18:52:45 +0000
Date: Tue, 13 Oct 2026 14:52:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jia.yao@intel.com>
Subject: Re: [PATCH v10 0/4] drm/xe/forcewake: add delayed release and
 lifecycle handling
Message-ID: <as597xuyHECbO4hZ@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260930220820.2184643-1-zongyao.bai@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260930220820.2184643-1-zongyao.bai@intel.com>
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To DS0PR11MB7192.namprd11.prod.outlook.com
 (2603:10b6:8:13a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7192:EE_|DS7PR11MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 704de9fc-ab6e-4e63-3301-08df295b299b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|10067099003|18002099003|22082099003|4143699003|11063799006|261009221727099003|261009220027099003|261009223027099003|261009221227099003|261009223327099003|56012099006;
X-Microsoft-Antispam-Message-Info: JVk0he5CE9oax8NFtg7CLHItc6rubuWYV2K9pqjCDEov3S2lUI0OpbUxkaHRK86T2R/4baGHcMN6xc6lKY8RRfhg1X9qhrtUaPi4aoRfRvXS1ohVPq8B8GjRLm3lDf9eGFnyCAxvfXLsQUHk0e+CLU4Q6UhTz9vdEvi2NcI/t2lVNCoJJHht5NEOD4SFwBKsBso0oITTZu78+Mmje+fODfqRamUbCkjsrGUZq1YOzNAOin2uY+LQe/GlQeoCLa0tMB45vxQ/Jf/DWwpa3MJe7Ev/2G7bAJdVb8DhAoHPHaudYYqpZfRhVA3Ja42RqelB+SVsoPSHpwyXbFxyPTSEujA/co6Aqx7tu8RJ9rLPhbmAM5T4nTw9IefakmXlDpHwj55KzNgYdgJXPRzxTCxNvdxwvqUJvOVBnhZt0RKic7HVtuOirugzRS7y5EJsG5M0QC4c2gUmSUFfuHkyoE4SouV5vd/JNOkPIVNCGi2FI0Gq4ljErdISHOvm88Go3w8CRmFfV+JpgcyZPwjyWkX1GSQghhzCpcFjckvEBvI1ujt4FTOmKYzT3LzH+1B03ODVorM72GaxBRzfTmpE6ZyH4IQe8dAd4tepnLfR9s6XIX+9X7sNzsd6AoEUG0Z1t6Yg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7192.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(261009221727099003)(261009220027099003)(261009223027099003)(261009221227099003)(261009223327099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q8cNpN8FI+XHDZv7pXvp0N4UZkwNs1SQjK7BVsNBu2OPpKgF8/q7sEpfFcqK?=
 =?us-ascii?Q?wckUwn7u3CjXLN18scoYLNP1CDbM9nxIlHTbyMCpjuXtrtM13yralEle89yM?=
 =?us-ascii?Q?MLn2Osg1i9pqudyh62G1ncbdredOoSqybUz6ACQ7GjMHqLas8iHxWejH30NV?=
 =?us-ascii?Q?cSAqw99hMPHLvfoKmXH65PgtPuziWlbT1UxGLKqzbFfo+oPZxUvS30JMjXXH?=
 =?us-ascii?Q?c3c4ng+hulOo68t9tWwRlJCFDE0iPDl4Gm5H26aEzH8MxuodW0xn7sEZvS47?=
 =?us-ascii?Q?NZihhiLSFJy1fJ71NIPRl6rkxz+KZ2cTh4H6sTEaDLFH/2ojDdI5QzyeDR74?=
 =?us-ascii?Q?EYVbpDy2c2wlm8tMoHqTa0Qc/yNb6cn5bqRJdrNAAfLm+Jkk7LoVFfgYMXBo?=
 =?us-ascii?Q?bC/lOu7yScUmYgXVkLRxz9hMffVLxrkV1zA0d6hR0eB06q5XyDNV1QPr1r03?=
 =?us-ascii?Q?EnxCv2FuvzpjNTCFJNlbHEgxrdCOC+eFkUJPzW6+bPSi5F/Vefio1RfHY+zw?=
 =?us-ascii?Q?bgu0GcO4QFhDKNXYvoUhAC8ypaqGJwPov9Kk5QZ+Nf7/Niv6SR5NaG2t9T5Y?=
 =?us-ascii?Q?l2CeFZlSUWWUPL4E8TLH8XwdHHGNFu0w6lXqU1HjYb/17Va0nXyjWsUCRb9J?=
 =?us-ascii?Q?dIACvd7SDu9GM805+pbTi2sW5fmIchTVpB6f3lrxjpBmUdz+ONVwS7jXI6HP?=
 =?us-ascii?Q?39BdjSKUHsklQSs8Z/DFoICYcjEY0NrbGL0rMaW3gJ1zJFveJ5/ofkKQHaBK?=
 =?us-ascii?Q?Pn6r7x282iPw8xy6S/MSrpmUBcBNLSgZ5g7eq3nJif5sekn8eVh8Fw3ZT8z+?=
 =?us-ascii?Q?P0wFXIa8qJIUUJ+IfKKWcYk6pgBiGMgXj6q+O12OtoCivnbMZDVyAL54lFnF?=
 =?us-ascii?Q?3FcYpH0FHiTyJ58nFJ6o3hCnHfqLQTHLalkj7CszaREpS/oFjfonebxo7Qtl?=
 =?us-ascii?Q?dkc73xCv/C7tGXEg21fQZxmrLqmP8t+V2boqysWx70iuU+cJhlpPWE7fs7ey?=
 =?us-ascii?Q?8fzX6GVkFWGBkjKTQHM48UIBTsO+d1Cljw77vHn+Y0mFVg1j5EKFkrCeuAtQ?=
 =?us-ascii?Q?/yVJMoDiSxHz00tmS7FEJRYfGSDSg421J8y45/pncltVEuojiQL1oW9ev3uq?=
 =?us-ascii?Q?o1nQXYhDILu8TTmsKeJtMb9VQGuKvQQ4tUzPWn5ShJaPoFS85gx67kj70DDB?=
 =?us-ascii?Q?Tulc6Lpmxx6xFnM9g58u89OAFvAgVqLu4hvMcTwnEVj67GDj6bAKtDkMCged?=
 =?us-ascii?Q?tS1AalOAQCe2Ap7158Gf7oddugrwjfex/y1xzSlbu1J2TJW2QMyA44Q0l9Fr?=
 =?us-ascii?Q?PZFHWZRhnGMVyKDdX/6hO2AMKvHT6VKD/aC1mzce4mFRtyFC+e+A1QvpVCrZ?=
 =?us-ascii?Q?bel2CEVl2SZsjf47Eq3nISgTHngf24IaawXg4yqJBeXHGKZnDkUk7H+iIRge?=
 =?us-ascii?Q?CEYHzwCgsQfh3KVcgx7Bw8k01HZPXU9KiB7+2sBRUXg0ePMp9sY0hqFI0jGy?=
 =?us-ascii?Q?L77jLn+ERtsmtIiu9oQoTBrzyzfGEcsdkEWzU6bQ4QsZei2EFvyXLsEbbr/3?=
 =?us-ascii?Q?642bJSHYLXFP9b8qXr2WZMltVBzh+7LIgAmSJJwGQ3X6kvbmvBEB3H5rJ5H2?=
 =?us-ascii?Q?E1T62jRPEjinS+o1+aQw9xaVV2ZMw3jWtl4n9DAeKXmkFrQLpTmpJrFXXDlV?=
 =?us-ascii?Q?y5ryZvvz09UHINu/iezV5YfYo3aidFkZpVJjLD4/+ChHaaGvwhEigHlbvmb7?=
 =?us-ascii?Q?9e9V5xak+cfOE/BsPcVIq5b/nkzPGuU=3D?=
X-Exchange-RoutingPolicyChecked: ELW8lpBOIQ8u6N61dmGw5mBNLlzzqAkyfPM4Rs6bIxISAVvyqJupOGZ5SwhcyA8ewQA6tKjL3LbLOAcPCuwDpH/4bgeR/18zKGRSTIqzmVe3UXf39ObKCpMoKNEswNsphe6ZfPyBxTwj6gMbn9Q2dHS3f9hHtllyHtKBksms1tVDTVFV9oDOqoWSXYk+mGUlwJqPDhqj3O2jFawGW665XPcZIwvv58DitvDhf0gKFZv3ceXzMzC+LfDOzq9QU+32JVeR2j52C5fIzKG9MwM+U0336gihcYHCDMud7/Ryii/POpxWY3fMVOqFdXLRiDA9k9AD7/eo7foUH8d/2vG5hA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 704de9fc-ab6e-4e63-3301-08df295b299b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7192.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:52:43.3446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dmr6dlw0xiJ0I39N9LarSKNFrnCD9sPr71UoknDk13Du7fvYY3Di9oyx2Rj6+euwE1cgYS+ysM+ULfe3Wl9omA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8826
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

On Wed, Sep 30, 2026 at 03:08:16PM -0700, Zongyao Bai wrote:
> From: "Bai, Zongyao" <zongyao.bai@intel.com>
> 
> Engine-cycle queries used by profiling tools such as VTune and PTI can
> arrive in bursts. Releasing forcewake immediately after every query makes
> the next query issue another wake request and wait for its ACK.
> 
> Add an opt-in delayed-release path with a bind-time configurable hold
> interval, defaulting to 100 us. When the final overlapping forcewake
> reference is dropped after a delayed-release request, keep the domain awake
> for that interval. A get for the same domain before expiry cancels the
> pending release and reuses the awake domain without another wake request or
> ACK wait.
> 
> Only engine-cycle queries request delayed release. Existing callers
> continue to use the immediate-release API. Delayed-release state is per
> domain, so a put that drops the final overlapping reference honors any
> recorded delayed-release request.
> 
> Protect engine-cycle MMIO access with drm_dev_enter()/drm_dev_exit() so
> drm_dev_unplug() waits for admitted queries to drop their forcewake
> references before teardown. For system and runtime suspend, synchronously
> drain delayed state while keeping delayed release available after resume.
> 
> For shutdown, removal, post-registration probe unwind, and devres teardown,
> permanently disable new delayed releases and settle pending state with
> xe_force_wake_stop(). Register the device-wide stop action after the
> Driver-FLR action so reverse devres ordering settles delayed forcewake
> state before Driver-FLR while MMIO is still valid. Keep the per-GT cleanup
> as an idempotent fallback for earlier probe failures.
> 
> For PCI error recovery, use xe_force_wake_stop_nosettle() before
> pci_disable_device() on reset and on paths returning
> PCI_ERS_RESULT_DISCONNECT. It disables delayed release, cancels timers, and
> discards delayed-release bookkeeping without accessing MMIO.

I'm having a hard time reviewing this series. The patches seems to mix
multiple stuff into one. And the solution looks a lot over-engineering.

why not using a simple histeresis timed put with a delayed queue?

> 
> v10:
>  - Please ignore v6~v9 in this series:
>    https://patchwork.freedesktop.org/series/167697
>    Those revisions used incorrect Root msg-id(s) by mistake.
>    Created v10 to clean up the threading mess in previous revisions.
>    No functional changes relative to v6.
>    Rebase onto drm-xe-next at fa8b3b6c4a4b.
> 
> v6:
>  - Add a permanent delayed-release disable state and clear stale recorded
>    requests on the immediate-release path.
>  - Keep flush for system/runtime suspend and use terminal stop for
>    shutdown, remove, probe unwind, and devres teardown.
>  - Order the device-wide stop before Driver-FLR while retaining per-GT
>    cleanup for earlier probe failures.
>  - Add a no-MMIO stop for PCI reset and disconnect handling.
>  - Use the configfs group lock when reading the hold interval.
>  - Document the per-domain drain and discard state transitions.
> 
> v5:
>  - Split the original patch into four patches: unplug synchronization,
>    delayed-release infrastructure, power-boundary flushing, and opt-in
>    enablement/configuration.
>  - Preserve a newer hold interval when an older timer callback is running,
>    and settle an outstanding sleep ACK before waking a domain again.
>    (Sashiko, Matt)
>  - Synchronously cancel delayed-release timers during forcewake cleanup.
>    (Sashiko, Matt)
>  - Flush delayed releases during shutdown, device removal, and
>    post-registration probe unwind in addition to system/runtime suspend.
>    (Matt)
> 
> Zongyao Bai (4):
>   drm/xe/forcewake: synchronize engine-cycle access with unplug
>   drm/xe/forcewake: add delayed-release state machine
>   drm/xe/forcewake: quiesce delayed release across PM and teardown
>   drm/xe/forcewake: enable configurable delayed forcewake release
> 
>  drivers/gpu/drm/xe/xe_configfs.c         |  78 ++++++
>  drivers/gpu/drm/xe/xe_configfs.h         |   5 +
>  drivers/gpu/drm/xe/xe_defaults.h         |   1 +
>  drivers/gpu/drm/xe/xe_device.c           |  33 ++-
>  drivers/gpu/drm/xe/xe_device.h           |   1 +
>  drivers/gpu/drm/xe/xe_device_types.h     |   3 +
>  drivers/gpu/drm/xe/xe_force_wake.c       | 337 +++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_force_wake.h       |  48 +++-
>  drivers/gpu/drm/xe/xe_force_wake_types.h | 123 +++++++++
>  drivers/gpu/drm/xe/xe_gt.c               |  18 +-
>  drivers/gpu/drm/xe/xe_pci_error.c        |  23 +-
>  drivers/gpu/drm/xe/xe_query.c            |  81 ++++--
>  12 files changed, 696 insertions(+), 55 deletions(-)
> 
> 
> base-commit: fa8b3b6c4a4b297bf95935065b63f8852cfc5481
> -- 
> 2.43.0
