Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DA6C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 23:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04B710E061;
	Tue, 16 Jul 2024 23:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0UO2Kgp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1FC10E061
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 23:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721173268; x=1752709268;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+/SiX2HO+rvIjESytWt58RFpKzzScMoJbRWqkkHcF+k=;
 b=h0UO2Kgpzl1V8hhpMznQUKU/NIYTT4flzBjI51Ck2Aox0BmQijnCuqW4
 4kjg52bfnH3DYYcwz/rMXMJKFi71flJTcKd3XvWxs0IuJS6a6KpGD2sVH
 8SKeCgXCncWgy7NvxmFUpno9BALWoDodSv1h9ZXdswTsVV5tOoBe2w3bs
 LXC3dyNrjI8Xu/YADapzdtHsT4a30EFrG0vGoldZiSyV0UUtMXq3UODuN
 QKBNdSC19L3CZwIPHKbTtWwWROYA/ZqCkCajKBHLFZx3EEIEuLlU7TXE5
 ncjeQxqg6Kn9v0iald1tcLmnjTUanDpQXuu1rLm8DCY/gJPVLEMpWCHm9 Q==;
X-CSE-ConnectionGUID: edH8q4bUSqiqqCi3W7hjwQ==
X-CSE-MsgGUID: XyLbMXOhT06IIMa9rdZJZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="36191850"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="36191850"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 16:41:06 -0700
X-CSE-ConnectionGUID: mT0rv2ivQpePu4Bw/o4pKA==
X-CSE-MsgGUID: 620b1IEBTq6IxFYs/HN+tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="50258963"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 16:40:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 16:40:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 16:40:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 16:40:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wN4SehOqFm/YzcKhTt4gpg6TqcKICBPQvk4mb3DlfdqH4W0fqh6cbTYhdO5OhKei4iuXTzbFNncVuCPO5wbq/JPc4meiZu+tUAjKWrUS59FE4s1vcxlq8gQjTaO1EuSiiNL+p9Z/n9EISeMKqBX7dwCntKoZLpmV9KH1unNo1Fv0giH/eVRayyAIALMI9AAdRyFuQCp2anv8YLV6ByplA57+vOX7gs/EOywJakqeIyF3gsHEyM8xpNTxezQ9xCG7B/S49FpcFBVUxHwU7Mn+dCvzNIWHIXbliYWZKH0Zu3T+jrzzj1MQBM6I0+9tCQ5qaFN2G/UkHKVPnlLF3vD/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irAmRHJYC7bcWKzd3vK409NohDfUBjdPLYJslQcHIDE=;
 b=BbNXIH5vqUufMRTxcqHcDBfvAeN0ZDnpVDppMIZdkePWAWf1XDI+4PZ774dp0899geAJDoRhNpzDNBOJkipVB2lGcepQAIt8lipEO2zQu75i3HRzWsbtWR/YEZFo3o7eOfKP00a/bckMJkhNNx0Q+xQd/KMcCmoadF1XLwe/47TzWPa1j1N76zdbLt7vkM2pW0EKiCqzq4vYO0UWPRf4Y5YFYPP5utKv6XnBeTuavjyOduzwsWlLpycgJp5I4Jw7mUMZvVg5Jr5Ye7kXC9Yyr+EjmmynBzl86UT4WRQPt9P3W/jQdk9WWtyt8pPYu+A9YW/10teRwsslXvq62oc0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6968.namprd11.prod.outlook.com (2603:10b6:806:2be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.21; Tue, 16 Jul
 2024 23:40:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 23:40:50 +0000
Date: Tue, 16 Jul 2024 23:40:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <akshatajahagirdar6@gmail.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
Subject: Re: [PATCH v5 8/8] drm/xe/migrate: Parameterize ccs and bo data
 clear in xe_migrate_clear()
Message-ID: <ZpcE0sPclE14E4aj@DUT025-TGLU.fm.intel.com>
References: <cover.1721170212.git.akshata.jahagirdar@intel.com>
 <17bc0b9bf710c178e749029d5dfede725ec29b44.1721170212.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <17bc0b9bf710c178e749029d5dfede725ec29b44.1721170212.git.akshata.jahagirdar@intel.com>
X-ClientProxiedBy: BYAPR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:a03:100::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: aa4bca4a-1cfa-4a07-fa99-08dca5f0b962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DpTzvglCaQJdKCf6DK6/g4lYB7pzmgWywED61G/Wc/9EmEyXS+lpdoYEE3rP?=
 =?us-ascii?Q?yY3mD4yxa1Q0VcdWnGF0RgtX2dR3Oh1euIY0ZtE5xjxTMxoScuTqPhpWGAT9?=
 =?us-ascii?Q?IPQA7kV9zbTGLqUYxrB46YqL3KEzL11hgA4igN4N9KCkiFaxiJQnkYYxQq0s?=
 =?us-ascii?Q?5vmFQlbE0syuix3pZOv5Cx9fzBsWf60aK/5XwouF//44ZCCMN7p6aQBI+n7w?=
 =?us-ascii?Q?SFjRGMhB66PDqbVJYxs2GIhot3xVSXyuEW26WFdBjQ7M6LtQtozG7gV51ZIz?=
 =?us-ascii?Q?eEegxwUZc8SkgjJJwbZOjats7rbUFfQXSDkSynT8ldVZHQX8lMcVT9MkmjMd?=
 =?us-ascii?Q?Q3lL9HC/mEd2TT74I32+OUYQ8UncwlaMqN1bVS5ea+XoQ1T1+oM06msaGWSr?=
 =?us-ascii?Q?ndgkRYpqfqXu7nOQKfW16a/QTuTvA2pehlzewkHT7bW3W4UWIvDu5I798lVw?=
 =?us-ascii?Q?G245M2ZcsyYgvmZkgv58WMDciLyjJugQR5QHQMc52mRNkni0Ao9Y3SnqFcV5?=
 =?us-ascii?Q?Ji+c5Wp9Rgd9h4X6s+wVKITasC8srtUs0Au41ZNbkGyMDzVy5DsSnbBhXnOl?=
 =?us-ascii?Q?DJiPuSEq+SJd7SUejmz138UJP2iQnwel3CPYGul6jODkyPUSKw5cUljwpxR/?=
 =?us-ascii?Q?qKyN4CiiI4nyEt+SWCHHrrPfZEW7eGou5tYX+mr+B0ApLRK7AmC9MpWg/r6H?=
 =?us-ascii?Q?zpSQJQKocZHMXEVZoc+MwvJOXFeWCiLPetq/FZHmP3bIn3SvYnwnPa14wz5D?=
 =?us-ascii?Q?JkRRkTF4vec8oWl7zDYgwx0m+V4pccU2QV/4AcjzAW2ZVpCmWY0hW4TxeD1/?=
 =?us-ascii?Q?vz9VbKl9gBtUEx6qYbIddTYbEIq3pLUmbxL84dsHO8AqCfLuw2FsFt63TNbe?=
 =?us-ascii?Q?0e385YAaH9YkayFWkaL6uC0+OrmBuw4Wqg3iQG2vMfhv2Z4xj1TP/1n306B3?=
 =?us-ascii?Q?XvTiz/BS5Mxlph+EDLYLynTaHGad+/3pE1RvYQZ6d/eg0dHzOL6+DNlAgq5p?=
 =?us-ascii?Q?WiRjf0xT5BaEC7rx7yXUjyLs8kWwldOcrJwPFbcpBd7zwucBUt/HXxNlplxl?=
 =?us-ascii?Q?5BLhT/MZ0MpH2XIaya882wVBgV3fn1jA3ajvOSzxquIbGCF0Bmdvtsk4gtUD?=
 =?us-ascii?Q?Fcus1sePc4fQZBPo5MzsS9UFJyIEnII0G8caqRNDIS3dIkZUPjvsEEjSWeII?=
 =?us-ascii?Q?lWIjzThzXb2kSVO4gZpwpX6QmF94c6c0TOM/6JhBydDAyNja4UxVx+YquAj+?=
 =?us-ascii?Q?YL7hrWeht9cQdRKLKDqEY58SysHeO4xGszcIIcKTX5aeBHegxeHqRW1JxdR+?=
 =?us-ascii?Q?VTuIt8CM5oPvrkznpGscP9pCS+6gpaw+xf96dVHab3YGzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LG7Y+ik0Qv1kJZVYEd9jJulzpHzppsLxpcsDjEplKC2KSm1216DKwmJQNSrr?=
 =?us-ascii?Q?ZfNEH+TntmqxuMVjLBCeqGXPvAgrITZGXttFl4XaSAGJ6+0eFHcGMBUo1tqo?=
 =?us-ascii?Q?CDqzaarP1dyw7Cwa+W4a1U5gL12lEzRIJ7PfKIxpbPS469KfjU4miPXMlc2v?=
 =?us-ascii?Q?NoOi6lqGRE4aUS/blrfO4DgwKGCLAbNzvROjevaycoOW5ilWfCSsRCQbs7V0?=
 =?us-ascii?Q?BlNoYYOuUxtdbui3HfflICboKnfLlDpIQPP6ZGGgP+oY0NryNqJyN9auf04w?=
 =?us-ascii?Q?fFnYMO0oRuLW8awyttBQIxbHG05W1KOhZl5gnte6UGJnNeprVtTDh53rfE9p?=
 =?us-ascii?Q?jQnjYUK1+CG9sNG2ucSaZQTORprx7XETYm88Ai66S1Kw1cAoYEzmSVZSCzFV?=
 =?us-ascii?Q?tzCYpClb7seVvaGpItomT2wvNcR+OdMIEZaBC5kB7hG+6L5K/E3K+D/NCrx9?=
 =?us-ascii?Q?hJNBzyDqbrNAWqR2y6FIO1B3m3WM49K0/Rjx+9WloQn8pYBUn7qIS7TfVcBs?=
 =?us-ascii?Q?wtUdPn/spgf3WAaRoEzeaJZv5vQ+YtEBEp0cdRKiIzmETm//QRAOKmGTYmzH?=
 =?us-ascii?Q?b03RNU4ap30kvXdVRJcSErC0r0ujKeNJsnOAxwY0oLcf8D5m26lU4q/T7V7k?=
 =?us-ascii?Q?e0+nVsPDQYSp/1wU44vXljCQu1zy3SEh5uCJxFNtqamj8tIrmBcAcyKh/Iq8?=
 =?us-ascii?Q?GhGajZX6yrhQ+guTc8DP0oQxQyn+MfKV28xXBwdohLxNzsDDATxLSZFYggLw?=
 =?us-ascii?Q?0G3uKmZnDHWpjzcKI9749G74cliKny3DF/kSEjBV+tQs+bGvnOGxbcqoL+q7?=
 =?us-ascii?Q?JSCv5P6RlxSNHUUokSVwro0hX0cPHExhuOhgfFZ5rRbBX6jqkdB5SlnWPPpj?=
 =?us-ascii?Q?rFdtVYOdp7zt3ISpxt5DET8yA+ve/nFItz9ETCMDytAtDctHFq/qsXs+3AdB?=
 =?us-ascii?Q?3XgugUI49VAuoFz90/6hGruPHpI+y0LEeTqRS8Par5TTBnJjrH8hhrdPJXMc?=
 =?us-ascii?Q?wk0mSax3tNUZOfV7mImEikWXAl/8Mkh+9mv7BG/CbPstqsqIDfCok1EkQ09M?=
 =?us-ascii?Q?eG8cZbuUui7mi46vAJqIQIIpFBhaNhaTQQuxEvbnznFGMKjdnXmSyJs4oxAS?=
 =?us-ascii?Q?xKGvac8QDdMfqsuEZtQE7CNey0FA72oW9lUXAkI0ODH5hjTJWFDn1XLmVFgy?=
 =?us-ascii?Q?UPb/Lyza4P9SAuHb3Yn54D0KWzZpYeNUO4+Hqf8Y+LHErxiusALMjxVKBA9n?=
 =?us-ascii?Q?D8FD474BwYGN39y/eLyYomYX4CpCKuxt+gK06bxkMQkf20E0JK9QFKs1nNVb?=
 =?us-ascii?Q?xUTd4mgPv5w4/KsspITxVAMBizVDuFPhbadT5mEFwk2hc4Q/LWbzf3qSGAi1?=
 =?us-ascii?Q?+r56Rjdv6eRrjfKqc7ovpZTB9zKVSg3xEJbpY/5S5cjCjSLbZ4XANlRg+14X?=
 =?us-ascii?Q?UlxrBlP/8w6VYEIIQw+1YYaxH4v2yqIV30taAdzAEgS0wAMTXiIWf0sev/JC?=
 =?us-ascii?Q?sx9Fl4EdVHUA1mxgA/7T4II4iH/oP/Iy4Umsh6GwUecpywJLSXRtjd6I6UoW?=
 =?us-ascii?Q?G7ZQRxKoVHz/wt95+00fzReYaGW3Et4PIRHRLsSJn3bGeKsde6VMszp34fg0?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4bca4a-1cfa-4a07-fa99-08dca5f0b962
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 23:40:50.1679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfLPqtusP7+vzupKMYg0YWIHdMNqZao/5GlS1Ex4geX0/cs2hq0hYtuXONJDzHOeBEQ5Pu0mULsTuH/WfgE4hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6968
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

On Tue, Jul 16, 2024 at 10:54:09PM +0000, Akshata Jahagirdar wrote:
> Parameterize clearing ccs and bo data in xe_migrate_clear() which  higher
> layers can utilize. This patch will be used later on when doing bo data
> clear for igfx as well.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c      |  3 ++-
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  8 ++++----
>  drivers/gpu/drm/xe/xe_bo.c            | 10 ++++++++--
>  drivers/gpu/drm/xe/xe_migrate.c       | 23 +++++++++++++++--------
>  drivers/gpu/drm/xe/xe_migrate.h       |  4 +++-
>  5 files changed, 32 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index e2e0ea24757a..750759be4d4d 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -35,7 +35,8 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
>  
>  	/* Optionally clear bo *and* CCS data in VRAM. */
>  	if (clear) {
> -		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource);
> +		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource,
> +					 true, true);
>  		if (IS_ERR(fence)) {
>  			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
>  			return PTR_ERR(fence);
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index c20d747fa438..928653d09678 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -104,7 +104,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>  	}
>  
>  	xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
> -	fence = xe_migrate_clear(m, remote, remote->ttm.resource);
> +	fence = xe_migrate_clear(m, remote, remote->ttm.resource, true, true);
>  	if (!sanity_fence_failed(xe, fence, big ? "Clearing remote big bo" :
>  				 "Clearing remote small bo", test)) {
>  		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
> @@ -278,7 +278,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	kunit_info(test, "Clearing small buffer object\n");
>  	xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
>  	expected = 0;
> -	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource);
> +	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource, true, true);
>  	if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
>  		goto out;
>  
> @@ -299,7 +299,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	kunit_info(test, "Clearing big buffer object\n");
>  	xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
>  	expected = 0;
> -	fence = xe_migrate_clear(m, big, big->ttm.resource);
> +	fence = xe_migrate_clear(m, big, big->ttm.resource, true, true);
>  	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
>  		goto out;
>  
> @@ -595,7 +595,7 @@ static void test_clear(struct xe_device *xe, struct xe_tile *tile,
>  
>  	kunit_info(test, "Clear vram buffer object\n");
>  	expected = 0x0000000000000000;
> -	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource);
> +	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource, true, true);
>  	if (sanity_fence_failed(xe, fence, "Clear vram_bo", test))
>  		return;
>  	dma_fence_put(fence);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 31192d983d9e..2a298f5e3e6e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -793,8 +793,14 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  			}
>  		}
>  	} else {
> -		if (move_lacks_source)
> -			fence = xe_migrate_clear(migrate, bo, new_mem);
> +		if (move_lacks_source) {
> +			bool clear_ccs = mem_type_is_vram(new_mem->mem_type) ||
> +					 handle_system_ccs;
> +			bool clear_bo_data = mem_type_is_vram(new_mem->mem_type);
> +
> +			fence = xe_migrate_clear(migrate, bo, new_mem,
> +						 clear_bo_data, clear_ccs);
> +		}
>  		else
>  			fence = xe_migrate_copy(migrate, bo, bo, old_mem,
>  						new_mem, handle_system_ccs);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index b28724caec10..0b5ae923c1de 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1024,9 +1024,12 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>   * @m: The migration context.
>   * @bo: The buffer object @dst is currently bound to.
>   * @dst: The dst TTM resource to be cleared.
> + * @clear_bo_data: clear bo data
> + * @clear_ccs: clear ccs metadata
>   *
> - * Clear the contents of @dst to zero. On flat CCS devices,
> - * the CCS metadata is cleared to zero as well on VRAM destinations.
> + * Clear the contents of @dst to zero when @clear_bo_data is set.
> + * On flat CCS devices, the CCS metadata is cleared to zero with @clear_ccs.
> + * Set both, @clear_bo_data and  @clear_ccs to clear bo as well as CCS metadata
>   * TODO: Eliminate the @bo argument.
>   *
>   * Return: Pointer to a dma_fence representing the last clear batch, or
> @@ -1035,18 +1038,22 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>   */
>  struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  				   struct xe_bo *bo,
> -				   struct ttm_resource *dst)
> +				   struct ttm_resource *dst,
> +				   bool clear_bo_data,
> +				   bool clear_ccs)

Same comment as patch #4 for two bools, prefer a flags argument.

Matt

>  {
>  	bool clear_vram = mem_type_is_vram(dst->mem_type);
>  	struct xe_gt *gt = m->tile->primary_gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> -	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
>  	struct dma_fence *fence = NULL;
>  	u64 size = bo->size;
>  	struct xe_res_cursor src_it;
>  	struct ttm_resource *src = dst;
>  	int err;
>  
> +	if (WARN_ON(!clear_bo_data && !clear_ccs))
> +		return NULL;
> +
>  	if (!clear_vram)
>  		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
>  	else
> @@ -1070,7 +1077,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		batch_size = 2 +
>  			pte_update_size(m, clear_vram, false, src, &src_it,
>  					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
> -					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
> +					clear_bo_data ? emit_clear_cmd_len(gt) : 0, 0,
>  					avail_pts);
>  
>  		if (xe_migrate_needs_ccs_emit(xe))
> @@ -1092,13 +1099,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
>  			xe_res_next(&src_it, clear_L0);
>  		else
> -			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_system_ccs,
> +			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_ccs,
>  				 &src_it, clear_L0, dst);
>  
>  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>  		update_idx = bb->len;
>  
> -		if (!clear_system_ccs)
> +		if (clear_bo_data)
>  			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
>  
>  		if (xe_migrate_needs_ccs_emit(xe)) {
> @@ -1157,7 +1164,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		return ERR_PTR(err);
>  	}
>  
> -	if (clear_system_ccs)
> +	if (clear_ccs)
>  		bo->ccs_cleared = true;
>  
>  	return fence;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 453e0ecf5034..45f6c180148f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -104,7 +104,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  
>  struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  				   struct xe_bo *bo,
> -				   struct ttm_resource *dst);
> +				   struct ttm_resource *dst,
> +				   bool clear_bo_data,
> +				   bool clear_ccs);
>  
>  struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
>  
> -- 
> 2.34.1
> 
