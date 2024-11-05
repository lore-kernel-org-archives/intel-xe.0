Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8E8D36114
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 19:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE4E10E03D;
	Tue,  5 Nov 2024 19:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpZtkb7i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90D410E03D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 19:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730835397; x=1762371397;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1FSVWFUNfwxRTG1rsC8v5LJRU4LdDEN8zQzB8iJnYPc=;
 b=JpZtkb7idJecs1E1YHlSGz2X+OsTemkUxHCkmzzW7hbg5+VSG3+YEHXF
 AZZ02i32CsMOUwmIyfItqDTkT2Dxiu83IUK6dAQv27BCman3IxZSMgCkd
 MLfFUBFtK8JDepRBYYO/4FxxeInLafBIZy+2HpVQNqsnbEDtDmoqdSSQy
 FvoFsTNR9GgmxUGWgColXAEv7ZV9wp41BP8N3vx2nJJNj1p4n4G5AdsEb
 +STLEiMeplmoPo7/ZH1xRAsnThDHGlrh1I22PJAo1JCPzRJTFTCV3f2SS
 Ntj+TJxtcAK5IEwMGlD1b5mxEY3snFreQivqEUyEv9J0tSX80OnnEM0w+ Q==;
X-CSE-ConnectionGUID: BKznXrG+TdStVZTbOYoE9Q==
X-CSE-MsgGUID: ZvLu1u1OQOynk3BOVk9TPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="34533729"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="34533729"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 11:36:36 -0800
X-CSE-ConnectionGUID: 0KF2tx59RwaZhUg10trweg==
X-CSE-MsgGUID: NdvGRjXgR9WYO1Xy7uoWqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="83668042"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 11:36:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 11:36:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 11:36:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 11:36:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9uIq/8xIfuMYfxL/R+QfABxOqUbxgjEvxZ2d9tuemmJkAaSGCM9E0b0fxWtnSII8P0rbcZXstHetfojSDmaUv5gkVM3ODbplKRGUXaRrjvXxhMdIIiMI7QjfmblUXcnrBm+VfrLvo7dhDro//hQAt3HWPI4LbowwUVfV+bEtdlmnvC25CR+PeuqoyAw+4DDBSWdNlrd95F95VIZ3P8GFAfkaBOeJD9LbWdSb2Bv1rx09uv10FmMSpQt/cf8nAvttrX5OHYddyphDg5KxYIZaC91MOwqQyUQfMGdHIaCXHm4Nddf0qxEVqG2pyGRlfvaEt4wOnEB6on28sCsJzHlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+adTdYyFoT9BdYhq75PPrkuyv5GV5iD5dx0nJd3dUEo=;
 b=DERR2Cgsj1C7aibBAXgrYMlYHkP4snbfrR+HtD4IyN7LFDZW96nJfUpKC62uCJCEtek5lO/yjkSdccocEx4R4BfqjzGmhTP02HRxnr78rUAi77sGAU89gmBT2zcmDGQ8khGCNRS1/D8rs1JAWkNG64VdGK0dYBe7S35d9jVA6yH9fQZ80dXZF64KldCdLFqe36LryPcZZAhPYbliebqg2hf1TJJVyQvMz6R7DFylKkfOrGYiY/lqLmBA9oI4evNAPI2dGy9XvB5W2MeGc8kiOMPuodASa8Cl+iga01J3pqsJlJYWOcn7PSKLd+mZ/lWn18idDWgS0qGgimg5wPNIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5983.namprd11.prod.outlook.com (2603:10b6:510:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 19:36:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 19:36:08 +0000
Date: Tue, 5 Nov 2024 11:36:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe/guc: Don't read data from G2H prior to length
 check
Message-ID: <ZypzyPc1W/BX9ESg@lstrano-desk.jf.intel.com>
References: <20241105173032.1947-1-michal.wajdeczko@intel.com>
 <20241105173032.1947-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105173032.1947-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:a03:255::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ba057e-7eac-46c2-8a71-08dcfdd118ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BTZfPVBES6WYqKrm8Useiq6ZuRyhNP7Va6dMvWVmQcVzW0hFeH4VTCWaghIk?=
 =?us-ascii?Q?OzV4KByBuHhSdADkGNGJsko5S8EREGKRBOV+7BeVekwzKOW/8G3PcqpawOvH?=
 =?us-ascii?Q?GehVfVMZOVViaZmCsJgnk3NrZRcXSBty05CcLMnLlkmp7KGRu4TMK+kT8imy?=
 =?us-ascii?Q?eBma3SNGzr4hSkqC1kVd6mL36AgkQ8f3a19zgnh1JbdNig3YvytaQViMN+VP?=
 =?us-ascii?Q?Ws51xAARzP/p70XzOXGf8CkbfwXIiBx/REGxVseF4r4d9CmcohnDAu7qB0Xq?=
 =?us-ascii?Q?naPVXJkjGzEqa33MhoQZ+k5cWw5UEzBGorp+hV8Tp4WutqX5cAGcO+OfVwve?=
 =?us-ascii?Q?plWT4YO1E2WRrYQn5MMlrQVpMwh9oAv1lCi8b5h7MqmMWinCU7SggHwNg/gr?=
 =?us-ascii?Q?WOAj9qhNiRHlSLn7crHcipWQrxqH6L7RDR8I8RVeg9hvtgtvFjUbiWMcCPH4?=
 =?us-ascii?Q?A5Zu34ypQOrImBqLBBSXEUeId6N1p9gvXyGGKHMiSwK7xF8UI1aPxCtwKAL1?=
 =?us-ascii?Q?WRIu8khCNN6qS2asqx3I0djdjJTJZTWYtw8XLQKdRGJGDDd5yyrb6uKu4vud?=
 =?us-ascii?Q?FXPa1uffOPgQrMwk4Gu3Mn0QFQzsZvUr94S54LjGWQ+KDuqtGkdPve+80KqU?=
 =?us-ascii?Q?Id470Rm6ypYb6jOPNfXJTfdg8bOyS7TXd7pZ9ty7VBYY+r8dAvLFLOJ6CpAp?=
 =?us-ascii?Q?tPctnowMu4gvUe2smDpOVscrd8bMkJSfZecLCzK3Wc+OQdd6Ztb4564DBNBu?=
 =?us-ascii?Q?OREq7idMwrPdwLHvlwatm7drY7LQryFT5/JkPODWzSApUdQJhruu7b0LeobL?=
 =?us-ascii?Q?t9g/fjDfa3UKQXdFMqd2qVHvUd23EqvI82dGvwZBssx9KFqEaO8EEeMNix52?=
 =?us-ascii?Q?/bAr4iHqU3COHvkfHmKfGphz4TW0Z4Ou5YxOb0jIc4XWX4PlKqYvsg1HB+Ic?=
 =?us-ascii?Q?Jk70vjUtQLglOfrSrA95f37iZu5kC2B04G8EKukHEtbS5cn/25CY6rds3yvh?=
 =?us-ascii?Q?pxbzetxTC/OBL0XE4DJDZxuz0p/ox9+9cQcy+syXK/ejG+oOe1SgX0oOniua?=
 =?us-ascii?Q?r7Y78MMkagUSzm8XOpP4mSWOjma8RlIBLgg/FbNkAu12hzb009kMZ+ssoBOI?=
 =?us-ascii?Q?60KLu3183AAduBn0Qie1/UE8F9BXhsGZJc8q0z0sNHCAPEM1Rsl7YKFb9pfn?=
 =?us-ascii?Q?6omGXUPA+GIjk+rUZEBdJ24Xu1uZiB14U1RlHQaQrTiqv5E+t3ZtTLxufRZ5?=
 =?us-ascii?Q?+JGEgrvf/LoCgzZBTGz/g9ff0rFrmKL1r1QLj5aClrIHHwDrq8A75nkwQS+f?=
 =?us-ascii?Q?ypEUZcCxMTS5bYKgfdjd4mjm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UgDhM4hLrGJb1FB2rsWOVJLis4RJQcXx5W05ZAHPSi39Tos12Q5o4QeP1e4q?=
 =?us-ascii?Q?b03LnglnPPrG843zhFg5t6bo15YAR27qLmV6EglsxvRD/1v7gXU61rSswpxp?=
 =?us-ascii?Q?6KU7WVCIxoNNhb/441GFwDJJqb3pkzMUglvOcWE3cBZa/dXLvkGwPfw57q82?=
 =?us-ascii?Q?mw8AfYE25MiYP6gIRjXP/OBECr+pEPpDfy2ZQjDpWw5JhrvMGsRNKNAyC4Ub?=
 =?us-ascii?Q?W7obBkgYzxOY26vVRvdczuPI6+ItpltiJBawo8oMUuzENfAUN4hZ4q9c3Wnr?=
 =?us-ascii?Q?55KlQwdxqe4C4I+1jnh2TnroM7tJilVBniHqy2k37bQQ/rNupjdEr1n9BLJa?=
 =?us-ascii?Q?VCh2D5Yn+EuIi9ppnYW7eSFE3kTqeIbAX+UhhQzgf1qqY0dXxOb0PFFF4qM2?=
 =?us-ascii?Q?exeVVg/9UVP8fpeZEaq/+qolXxRnnbbVQnuSL9MvqgHLmqasjifclgE8CFyS?=
 =?us-ascii?Q?SOiun35Iy2kSGGuNGiwhbChEf3EG37EkXG2qkhR9koMaND3yVo1FOKkOrEVV?=
 =?us-ascii?Q?/ytlqHM3vtxsdGHxrNfnE4/mgNFd890yP+i9cuGldBpRkO/iguqO150zgr7f?=
 =?us-ascii?Q?khSXjSGMb8XH7QxwOmxMGwV0wKsPM11Cdjn7p785nGB5tw+gvxKKayeMtW/g?=
 =?us-ascii?Q?T/Qx3ob29lmMaPg+6QcSV6qQBqD4mug6dOzUv3cF/iV0D57hM08s6FeBfCQC?=
 =?us-ascii?Q?2C0fXcea+VugDgJRQdOYZmTTi6V2/OqB/QOwAQSmlTT7A0/qsTtgGHjf9heo?=
 =?us-ascii?Q?spIVtw8IXnIk4/jM4uSr20rxLPsoxsUWNpL7mDdMPogix+/lwSppgMjTn87q?=
 =?us-ascii?Q?TATdJJbdKsklmE+aZCdLu+WzW28ZnLZamSwEp7sZ0GXqbSeEAaDq0Oy4UZu1?=
 =?us-ascii?Q?FFsJK1NPhwM3lmwj91hVIcBgbqLRGwAoN2wknV94q/krX+2nkIoTk8lUkFyT?=
 =?us-ascii?Q?G2Xkhc0dSDogcpHQDvO5wPDMNpV7dqBKIVgC2VrF3T27Saqt/w2HJzWmL5dh?=
 =?us-ascii?Q?mQ9hanOG9Wi1/HDRoLQm+AHH5nics013z9ba5nvqVYs9zTiibmcIZVTouCFc?=
 =?us-ascii?Q?4B83mKfQNCtnRZQajOu5cmCLWzVN84fiZSu7eLhy9rlK1YR+XUyT+znHwC2A?=
 =?us-ascii?Q?QwkY6MYVT1JNmlGHSjthvg6xklDu1+NE6Wp2D0A/tFpu4e3k1glwj7hntLfT?=
 =?us-ascii?Q?ETvGrJgZL2OGVZhYmmWE/CH9xe5QF7WsAB47FcD1NHZj7XSAMQPIEe51snJH?=
 =?us-ascii?Q?HZ5UOWWQYHHyUkS1zNs3Ibj/t4Ubh+3IfDjUy3N/ZBmx6JqAoBNVfpou7u77?=
 =?us-ascii?Q?qZZHqh2FsfQVi27w/yPDPJ84MXvtfgm9N7bnLMzl7w6dFVprg35dJVocLUmG?=
 =?us-ascii?Q?P0GQBmvn4Cb++bLoZ5qCfDQT4jTbSg6KSAJM7QLyeSGzssWewlgqzwJLZk9x?=
 =?us-ascii?Q?zlu44grSqGUf24/BwV2slcd2CzHS37tUoX2kS58SatY/+WrM0a2nwvzV48Py?=
 =?us-ascii?Q?XFO54pTKg36ju7HhzqzjzQogyUOqJ/8Oxs4lwfdiAf/+vs38jss9IT9ZeJFb?=
 =?us-ascii?Q?RIVsdAUopGpgIyFYYnOfYmB2ShDEp2FTUfXr9+gk8lASFzLa/eSSl2GyscFL?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ba057e-7eac-46c2-8a71-08dcfdd118ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 19:36:08.4847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suoCVX9nqA7uRgi/JSvCe/EdXpB0ER6eS82qDegEYP/RXPJaVbttplVQAmaifE0ZVEL01cF8aY4Yk26+4bgZQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5983
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

On Tue, Nov 05, 2024 at 06:30:31PM +0100, Michal Wajdeczko wrote:
> While highly unlikely, incoming G2H message might be too short
> so we shouldn't read any data from it prior to checking a length.
> 

Is this really needed though? The *msg is a per CT member:

xe_guc_ct_types.h

147         /** @msg: Message buffer */
148         u32 msg[GUC_CTB_MSG_MAX_LEN];
149         /** @fast_msg: Message buffer */
150         u32 fast_msg[GUC_CTB_MSG_MAX_LEN];


I suppose this good practice but this is not an actual problem though, right?

Matt 

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4481890be941..147000fd1177 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1885,12 +1885,14 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_exec_queue *q;
> -	u32 guc_id = msg[0];
> -	u32 runnable_state = msg[1];
> +	u32 guc_id, runnable_state;
>  
>  	if (unlikely(len < 2))
>  		return -EPROTO;
>  
> +	guc_id = msg[0];
> +	runnable_state = msg[1];
> +
>  	q = g2h_exec_queue_lookup(guc, guc_id);
>  	if (unlikely(!q))
>  		return -EPROTO;
> @@ -1924,11 +1926,13 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>  int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_exec_queue *q;
> -	u32 guc_id = msg[0];
> +	u32 guc_id;
>  
>  	if (unlikely(len < 1))
>  		return -EPROTO;
>  
> +	guc_id = msg[0];
> +
>  	q = g2h_exec_queue_lookup(guc, guc_id);
>  	if (unlikely(!q))
>  		return -EPROTO;
> @@ -1950,11 +1954,13 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_exec_queue *q;
> -	u32 guc_id = msg[0];
> +	u32 guc_id;
>  
>  	if (unlikely(len < 1))
>  		return -EPROTO;
>  
> +	guc_id = msg[0];
> +
>  	q = g2h_exec_queue_lookup(guc, guc_id);
>  	if (unlikely(!q))
>  		return -EPROTO;
> @@ -2010,11 +2016,13 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_exec_queue *q;
> -	u32 guc_id = msg[0];
> +	u32 guc_id;
>  
>  	if (unlikely(len < 1))
>  		return -EPROTO;
>  
> +	guc_id = msg[0];
> +
>  	q = g2h_exec_queue_lookup(guc, guc_id);
>  	if (unlikely(!q))
>  		return -EPROTO;
> -- 
> 2.43.0
> 
