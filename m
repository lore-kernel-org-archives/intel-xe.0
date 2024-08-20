Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B996C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB6F10E20A;
	Tue, 20 Aug 2024 20:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9qBtw9I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C345310E20A
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724184669; x=1755720669;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=8dR4qbsNfpMQYW7p8piVhysfVbopHx6p+XkUmpzcSvg=;
 b=B9qBtw9IHzrXAkRCVmR27wJw0crD+TwFe3I750pRxdep0lcI4hSsfXlG
 VYmDHPnXDZB9WOdjjmJkzGJpx+2w7kPdbMdeTWthQLmzyWMWfP4iRedYV
 Uxe19SN+qVPN4nEs3t3HKF+pZGyYKAgKO1YXB4tzt75iZrpOr2tCkmPwA
 rNjRgur9eYLynULh5m9NMU74sL65xd0CCld/866MASZATUu5Qh+Csqjps
 oDmxv6cd0w4ks6nVYwL106iHkIOMMk0Snr2qpT0bu+l2lPaKsl9LdVqV8
 I1FTz0cDYFcLjjg3sj7jwHa04gKaFazCCKxUBaYigepp/24QB4pQ/Q1xJ g==;
X-CSE-ConnectionGUID: Bu9SkIq6Ri6AWxzN+uo7tA==
X-CSE-MsgGUID: iqjqIIo2RlykOuM46Zo/MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33665676"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33665676"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:11:08 -0700
X-CSE-ConnectionGUID: 2+3yMR42TKyv3xcrkl/spQ==
X-CSE-MsgGUID: hrAqBzpUT4iLUmPpDNzLYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65541117"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:11:08 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:11:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:11:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:11:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCp3/pAkW3X4PYiSjJ3yoNnTX3vSxDvKCWHIUhyrNmvPhm4stDRcoX24SKhqQyVGyK0mTLnscVRvsEpExWMPbfo2CNDP0OjniaOAoHrXaSkU1W8gUOzW5dIcOtDl8J45yfwASR28wKyW99MxCFwlzeg1yY7HZjROKNFDF8tkxWNefAtM3ybofuUHQomUJ1/fzIFFarzb05aUdabxoh5mOJSvtf5NQY7ye9hLtzyQ3mKR83RJK87HiJbXXd8vMd+iw+JAQJkhphWcdOxt0PHGNBMyVMsXL6+75ugpS8RVsDFjpYZuPblAACEzcINMXkaOgsTOoaZ0uLBMdgmq1EtqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKwWWDQCFf5JtDni9nsQgy+ElP+Au03PQJf1X09T4js=;
 b=d+W9TtLiJ7dLvO9cWgU+V2HOF58AGFmYMrUjtXXBV3wvr+eVMuuMcgcLD1oI2Z6UmGHoYiobrrF69SZxkN2BHgtGqFRgjwuv2+QVRSdeqclebst8msxsMN3hXUk4QevPB1G9l40ClrcJQx0+6yeFetmXYdqURLT7DJ/EtF43c89BzyEoShuv8nN1udvmmjVlamXzzsexhaS0NjuPu68REQqJX0RYYcpknXN6r3yYXqeEZyY0Lrn+Fu/KiRvkZYunWxXaYB1vhyX5cNo5RA6sHTif+6FM46rhN8VKZi22lZv/JVRkcjoruzuSo+7lWf3ghv6ZrVWQmxxEBLQcahtjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8028.namprd11.prod.outlook.com (2603:10b6:806:2df::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:11:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Tue, 20 Aug 2024
 20:11:05 +0000
Date: Tue, 20 Aug 2024 20:09:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for drm/xe:
 Invalidate media_gt TLBs in PT code (rev2)
Message-ID: <ZsT4CYbG3eSGnaT8@DUT025-TGLU.fm.intel.com>
References: <20240820161632.987369-1-matthew.brost@intel.com>
 <172417800506.700411.7337988742670153679@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172417800506.700411.7337988742670153679@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 40135716-8a45-471f-2906-08dcc1543873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uw+dq5KRWYdiN01l/flUnYol+B3TXmztb5TP/hgHbUVFjrHKSVzYCN7qlMqm?=
 =?us-ascii?Q?IDon6l9+Thgq1Qk3U3/8L9gjsnyKJEKo7oi35hxUJBu1b7cwlsHK/uOh/MGe?=
 =?us-ascii?Q?JJmjjk0L0+J6M9AA0xVFCQnfdRikpCtp3uuqYFFTx78MrxZjsA8Xd4mnTBJ8?=
 =?us-ascii?Q?DxNkRaqHPjDb1g6pncORNvBT2/jmROxvRsXHgm0A9HlimeqCtA5qtl0HwuOi?=
 =?us-ascii?Q?ALMdBuyg10VmCzhJT5NfuwxOE7TOqHNelvWvGzLMPvSdyRmXBN999WL6zv35?=
 =?us-ascii?Q?W/gzYbe2g7fanjazu76LCN6md+NXdaad/CDZgQfo/Tmapdrgu+v/n9QUCJks?=
 =?us-ascii?Q?cPWex9L/s9+NY/IhaGhfIqyysH4R+P+DLt2IX3IhbGGxrlKtbgBUm0OT3aHt?=
 =?us-ascii?Q?NQVG2JN9hAbsO2G6LG+y4C0b4mXsmEn16zYkJVQozmGWdnDJvx2BFSu2oGB6?=
 =?us-ascii?Q?6EPTWhi0o3YZGWJO29QqjB0EVjB1a7zNGmYtGvxk9Aedb2u/OtoK8A3jQX52?=
 =?us-ascii?Q?H8lurJg9CHL8CyoCj9/38jJc93u8cq5Z07rD5zG4kr2lb9h1eDoApVOiKun/?=
 =?us-ascii?Q?8ENLBF1pg+lXztQSJM4WLk7ie/Y5J/vZp6+RPY2/m1xAAAXk3Bt8oLNgUeWq?=
 =?us-ascii?Q?iU0sYm7XrXfa3x9NoZksj3I9kaN51K1XZRQ09OejFKON3PPWSd7HFLB3bW3P?=
 =?us-ascii?Q?vklM3bIQ+Te3AT5y3lZmeHVF8ufQtCuBgo2B0BmZcy9dGIOm+Ib3ASiZa8At?=
 =?us-ascii?Q?3kwSWkeAw093fviYbG1MIoYNfbEXWCErMHtfWlAHPktHRvgB/SIIvACCpWbP?=
 =?us-ascii?Q?ZuUj9jRtS8vJLlxo5/DL0F4a/Eu8zxS/B6JUHwPUkagd4vVSdOZqa6AcrPmY?=
 =?us-ascii?Q?dnOqYjgGpGN9d728MCKIWsabGOnbSsUSgVUSL1StdOOCU7YHhUi246zAnnVI?=
 =?us-ascii?Q?94hIvFf6bwAOtbprTiUf+e9Opo6K5dFM3VIZlppREbNozHQZ234r5/rxnQbu?=
 =?us-ascii?Q?aSIiNXmze5bd6euSf4K/gfRd92VsYdVfs/MkIlY1ecVrHHNEIjeLq+cgmIUk?=
 =?us-ascii?Q?eUNfHLNeiD27zsN6U0Y5FpcLMH2WMUuZPDO8dmBWzCnV4lGIpdK5kkxdXEDY?=
 =?us-ascii?Q?TlB/MK9+4V3nOKzox0EFqbgA3tmVJL7O5UeLnk8d0BkB0VEyHZQ3w3Y1zkse?=
 =?us-ascii?Q?FTZiX94tQBWr4TC71GZvwf7RC1l3Ze6yw4cJFtzfXorwaf60IpVQ1/X3RirU?=
 =?us-ascii?Q?A33qHH6UWdeBAlO+VB9STgakpqaQlOllifuA6YvxSmWMIFyWc99SD0NykZh4?=
 =?us-ascii?Q?XnY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GBlpvpnazP3MfYolDXTuhn19asDDgTMc/PxA2Im90F9X2ZLJ9909XhO+MNU8?=
 =?us-ascii?Q?XT/VNCCDdj0zzt1gp3gtiYXeV146jrkTxZxtHYSA46VqYe5FXxkIA3Of0eVl?=
 =?us-ascii?Q?9xk9PQ3L4A5qXc59saSQ2XD+Rxok0hGTrVMIorNu0jeAycaqgaLBR3tmQZU5?=
 =?us-ascii?Q?agxOZdG8T4vU0r9YNOh2wQxCLF8ZLhtSMLcU9Y4lgnebfznfXN0gPFYR2fz8?=
 =?us-ascii?Q?8qXr91KnlphtErsV7Suik1Ci9URe7DVADz4SCO+8z5c1JHIGHPh6lnqcXMcn?=
 =?us-ascii?Q?1dUep9u8Y2ZLbaMQnyKcyEGSg2gm16b77D/UXvfRMqivhK4EHbULZTzKskRZ?=
 =?us-ascii?Q?7ltxKTkF/NGSugQsMulSG8pxymxqT6FDyqbs0kn0RvkVhrA02VDhuytSbOyE?=
 =?us-ascii?Q?GTMCEUwDWmVOCgbsxJSMaH/0kz54n+vOiqWXI5++Iapxlvb7lywgYLzCtRWV?=
 =?us-ascii?Q?/gheh+E4EpE51M3GsUyVgT2zO2ILLdBaRUDAnCslqjIlaxzbJH6PLczWE8A2?=
 =?us-ascii?Q?9UZft4DiEgyHgJNWLU7Zc7pg6y2aHJjCxJJYy3nSMcZlweX8nQq2GvPE4cfg?=
 =?us-ascii?Q?BGPExLMWhicVZFTJ3Iy0bhoIFUpd0mqxY8FNMmTEaHFWItZuUhT4vXuhYd9L?=
 =?us-ascii?Q?l2bGMtnmY4OqPvLeMWkEa4X070dVVCm+WmWoKlAbZn2HOYQ8ZSTtcW5OsmmI?=
 =?us-ascii?Q?J+D0yCpyQRsI3EKvow0K4VqAX6xrxsdXZ4bHtcVVZhmWoJYncRS2Rw4TsFwZ?=
 =?us-ascii?Q?s2N4FgqCy2hFmny4W2/kGPduQwTqTPAu0zCubD6aZxd7TF9vsciLp7s3sOd8?=
 =?us-ascii?Q?B2JqVR6i6YNl9bSJccxahPeObS1pqtbSGHplJ6e/VYTX6MocL+in/KqaDCvc?=
 =?us-ascii?Q?7EEoZy+OJMmez9JeDQ3aWPu4V+gwwIEGqCwvCWZG/xaH+ZjUTrkfSbp3A9Af?=
 =?us-ascii?Q?07oy/f/gS5XDl+GRESduLGLTVDxS7kXWRhfgbB3Q95X8W8wjkKkI00Qm0MSx?=
 =?us-ascii?Q?fsWbGgpvNPc2MQ6/01agMpjxrx3PnDM3QncTEL5cnJQjmM0bRvjiRM6+LqtV?=
 =?us-ascii?Q?PrwuJ17iGzzl8HkoIX921p89nHcR1gkBZufdoh09JzfyYg5oFoTdY4H7eT1k?=
 =?us-ascii?Q?0SCvrhuK724PYMPUISoEDEdqgPAV8lDPCMEJSTAcvOW3zd4A+x8cRlWti+Fr?=
 =?us-ascii?Q?8Ly+kfJQNlPQbB1ZYuPgIhPt06G0bPKWiCNZftTneNNV6drmMZOgpMgr3h2v?=
 =?us-ascii?Q?3R0j7LrY8xKF4h23Fg4N4M1RoIULNC/Ar8Cdt7LgxgDnkCD+ddLtMAEitsjx?=
 =?us-ascii?Q?aEaHieAK7RJ163hf+iMg+nyEPSq8WVCxzpleJ2GRBbxdwFxGK/eKlSlE0Ak+?=
 =?us-ascii?Q?5x7PyJcGsmb3JeFq85pyXtApurmhekJ8deNgiKveqcajoWzsMmlDrSFrlB1V?=
 =?us-ascii?Q?Y7KdezYOXgsYNiFNlBcYHlZdWfqAykgY7SpbV8nW2hkUMYX2yv0vNebanL+1?=
 =?us-ascii?Q?uhqFXNDSmeFxr4ua8YU5i4g94bnm0FgSUxGSQX6e90Mo/KVEvNslTcN0fI2/?=
 =?us-ascii?Q?W9bG5Ci8LO7mldNtOn/C6h9qxIG5f7bp9GLF4bWY5Pub2lsE0QpCxpHHNS0z?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40135716-8a45-471f-2906-08dcc1543873
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:11:04.9247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/CmYOhWOOm2WFd/WqNGBAsWlQKZf3LXsWU5IPjJ8WUjO6GMA19nvC6eNwIL/DdRnkHPAUu6nVsmSQwYpJ2Xaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8028
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

On Tue, Aug 20, 2024 at 06:20:05PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  drm/xe: Invalidate media_gt TLBs in PT code (rev2)
>    URL:     [1]https://patchwork.freedesktop.org/series/137419/
>    State:   failure
>    Details:
>    [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137419v2/index.html
> 
>  CI Bug Log - changes from xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b_BAT
>                              -> xe-pw-137419v2_BAT
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with xe-pw-137419v2_BAT absolutely need
>    to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in xe-pw-137419v2_BAT, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    xe-pw-137419v2_BAT:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
>           + bat-lnl-1: [3]PASS -> [4]DMESG-WARN

While this failure is related to TLB timeouts, honestly don't think it
is related. The timeout is on the primary GT, tried to recreate this on
a LNL in RIL without any luck (i.e. this test works). I've seen several
TLB timeouts in the past on LNL is CI too, we likely have another issue
going on which needs to be debugged.

Matt

> 
> Known issues
> 
>    Here are the changes found in xe-pw-137419v2_BAT that come from known
>    issues:
> 
>   IGT changes
> 
>     Warnings
> 
>      * igt@kms_frontbuffer_tracking@basic:
>           + bat-adlp-7: [5]DMESG-WARN ([6]Intel XE#324) -> [7]DMESG-FAIL
>             ([8]Intel XE#324)
> 
> Build changes
> 
>      * Linux: xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b ->
>        xe-pw-137419v2
> 
>    IGT_7979: 403645635240cf6b72455731d0f086278b05e456 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b:
>    aadc820a10ab50bd57179c0feb238bedde6a9d3b
>    xe-pw-137419v2: 137419v2
> 
> References
> 
>    1. https://patchwork.freedesktop.org/series/137419/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137419v2/index.html
>    3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
>    4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137419v2/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
>    5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    6. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>    7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137419v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    8. https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
