Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B04FDEE52
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 21:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13AF10EAF8;
	Thu, 23 Apr 2026 21:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXiDIMvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B185210EAF8
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 21:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776980677; x=1808516677;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GP+/NkHkriLT7XBnM/hsbFm5T8U6/dA5Lmh4u5JKPOY=;
 b=MXiDIMvBF6aLRJru60NUHhsEhVAFTA69M1Y/2atvgpsgKK7q9Wmhteyl
 zRBvs0RyuTCciZFQoqo8cVeFd8XakSlaPFqTGdpD8uQn414xBbfUFLGkA
 tqP2GyN3/zPfKrcDnx2oSdq0DlYyyT5trOYRkL8BvbiS912g0SLdpWgC3
 yNZW8/SpGyc7FDcgJgU6JJeZVs2lKex0NIQEZW0FJKVJHFe052FDdblRW
 pSH+eXCIMSI9ZnXHO8pl1KHw06U69egtdXkmC/Fec/cNcMJ1JtA9H0y6C
 nUsGuX8dg6LQ1MG/SrdfClqnJVQWYj6qmV3DeSuVNkukAbHlpEouOfy5u w==;
X-CSE-ConnectionGUID: e4388uAjSxWE4nlD0CrSsQ==
X-CSE-MsgGUID: hshibQcnTuSil7hfFb9eqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="76991706"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="76991706"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 14:44:36 -0700
X-CSE-ConnectionGUID: otz1v0IXR4S/Mu+1mEXZtQ==
X-CSE-MsgGUID: WZiYKvxFRCuD+erBmhqQrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="234554542"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 14:44:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 14:44:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 14:44:35 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 14:44:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLT/SK8EQTZJCe2U65H1OB2/KX9TZdnnI48Tkm81FnaEjqHWor7QZjJKYzk2cPxdeiJnIAIQJ6wIjM9FANZUZ3FOmQ46alQQn2H4I7T93fMusKWz8qkPzYyjGlJsP+52t0UvbXzH6+zb+7cCRRv5KJNfc+isgbQj7xZ4iTxJFV9DXDVwWMXr8PS6XZaqjZ9lgXkvOQ1hkgBaoNZw7lETCIPA4urKyeHG9+wYZiRygo+QpNXdwJQ9EMP1McsfBNhXttPRL+6Js/5vjdYiPndFNu5BjWIFo4WcJyU3kSgVz9cwwJk5CevMZBRY2ssceYYtVBPGReabqUAjHWUIcHPr2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9iXju8oQUndDvBAzoQQpkpjy9ybUL+th8ue9L9GD9c=;
 b=GNNzSDxgq6MJ61C/vS0gKQVGMEo+NvPYLiSIf1LkbJDiXinKzYb1eBpH4YdBNnxOGZF2Zp467L9Fi0h0zRE4NL6o1KyKbSSHsBUYE+muWg8FyY18190kP0EHIkqyFbAlPTM0G/6zH7C9BQWs248p/2aV/CyyEIIbmBunlVq/RQHHB+gd+4EloiQmKD+D0WaqfbhSDjDKgwE8M4ufYvcrE+d/Ocyufb9m2gugRfzHK+7uScafVHb/2/FEBJIwtj/v4+wTWepaZiS4hodap3ersQKkf/O7cHMoMQ4jpskH6X0MUz7IOS/5cTDGKQNWh+4r6CVGUu/iJvmpm0HdMjP4Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Thu, 23 Apr
 2026 21:44:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 21:44:30 +0000
Date: Thu, 23 Apr 2026 14:44:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 4/4] drm/xe/multi_queue: Add needs_cgp_sync mechanism for
 VF post-migration recovery
Message-ID: <aeqSu8G1OkVohbuu@gsse-cloud1.jf.intel.com>
References: <20260423024954.1665095-6-niranjana.vishwanathapura@intel.com>
 <20260423024954.1665095-10-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260423024954.1665095-10-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:a03:331::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c4654c-339f-471c-2e77-08dea1818041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: IUm1qJMIppRcWfEoBSs0nsRNPqdg2gPu4akGoVCs3H4FNfo6MR/zXZSx2iuMj4K+lT6ZwU16lX3GsYv9gJ55U9GU44t41tVImQeBaYRDBuflkzYD72BtJ/ZkRvODeAtU0Dr1W962koXp0KjfXgOgkJTTX4U3oq8G+ZgfO2MmyevNkhetdNCwEyP7f8VRz1jBWEEe0aq2btADOrTi4CAtynxbPMPemUEuMKvxiTUm9X+/I45gD3pytFn2c+N/iKSNPQxgq6uXy2cdhjXCSCV+TFDYIC/x6BuZki9B/eR0KzAh2xJXEfBLcE0cUStHmqVnQSFxet5KOMRdHn5i2DSa2sClzAQ+AZ3LDtjuf1PqS1psyb++07SYUGDX6xXfWU9imiesSCbjPtE5L9Fw7tXtEyarC3XrSHrJQpzmcaFNejM9tpj+p5u5xj4dLw9ozDiK68GqLZm1mk3t+ja7WcrEvlB7pFkD2XCrf7zNcIKR+Hjp9tXp/lzqmJ4iSN0ZRhFI51iiUV6IjJN7wz/nY+BmC3CyZBgjuevNrWwGbZWoiGOFoqqr8VHwnAG/+WdKEb3YVOH7DQz19LlzYUgN2KMBXoJzGl1i3yMBPkj5P759nETQ/v8RB8l9d2WWHhFPYLS+0Z0jT/LBE/EGnputVegPIde7QNQ0mdnevIjE1rJ/jvTlNXBbDCrGLgjYBGaqoDzsfONrXMkRsv/UWanNGBySGduu7a5LB7xVVM+D4awTQBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9osm+PMhDxt5vVGNXtv5OnLw4G5+kFprBce8pHpAN+T7WZWqQdWzY7MHs6PP?=
 =?us-ascii?Q?HF79AkBIdglpuc0OR9UROrpcuqSmL2WZEDzRKeQGrSqtZGeNnVa+CECws3ss?=
 =?us-ascii?Q?W+JQBH2O1Z3Yq4v+u/7j1/xWpkOh6HMH4HWObH6M3kSTUenCefygKDwzAc2f?=
 =?us-ascii?Q?MAUzXb+jI/gv+wpVs3CqcaVhJJ3n982CKN0g91x/j7FFjFtzIbvrbC229KyU?=
 =?us-ascii?Q?GD72n0d07pr1EQQwVnix01b5elE3x4r2qz4djirW5F+3PEFXy2AE7VQ0V6sa?=
 =?us-ascii?Q?x5g8euFvOAGFAQqFfsso+Kw/ezeexkWYMGP4TxcH4zDR6Z4GM+4eYO67iNrs?=
 =?us-ascii?Q?rx3FjfCsDMsY2QCmQk5k0cZlMcESTCTX4LbDIzlL9zmg0w9dceLpFU0Okwri?=
 =?us-ascii?Q?9p04gl9NMpqZbB7tXmkob2tl+zKoCFauNwPxRudaW9QgsdROlJHMmNvUZzlU?=
 =?us-ascii?Q?BAULa541r0QO4WRU8gj3lz8C5Cc5L+7HdqCqpsd9/82dZrt2+DKD2QVhnOwu?=
 =?us-ascii?Q?y1nqrnoxlXlzRAWiyQN5vOEhzViTyCNhpwzE7daLJbqz3gc5tYk6FzLNndur?=
 =?us-ascii?Q?/zksF0zwFhyaB2fCfYOefZrJtdiXXlDxmqLNXKJ6WmKk7ATHzozBiFDwT4tL?=
 =?us-ascii?Q?wQQ0+CGV1t0ZIma4jlXkdKxkcjYyEpt/unnsXvf9K8jRvpNEDmEpNdZSr0ZT?=
 =?us-ascii?Q?oWmt1VC3d72oflrMUxpxlKhSp8cpSqn04TTcPZHMvn1Odm42TgDNsiJr8KN3?=
 =?us-ascii?Q?SCgqg93kcuNsq6aw2TbT9Pv+VbOTog76rsN0kazkW4B9oi+/FtgWV1I6stAe?=
 =?us-ascii?Q?aE3rNP1HAcULA56Laz9mjwLKJJfgeSXRCtxRTtbTxESSCKclsnxbyoLRqNyE?=
 =?us-ascii?Q?4AyLXCU9rBy4PwkLnqD8KEFlsyid1jQXeKmfiOwesbZFRDFWbU4H8k02DlxS?=
 =?us-ascii?Q?73IljopYW6R+zVi7DSSlJI435gzx5doR3uRjr+D8soMJd2uWtTe+sA0I3DAM?=
 =?us-ascii?Q?9quNMBtakxS/LSkDC2LZ3o33pmjID7a0paOF5aBDXU+nBRa+AuiQj4FAJ1Qf?=
 =?us-ascii?Q?TNoiDFT56CUKJ3ISHcXuD9o8O+Hu7UbAH46anw9D2lqM14KFB+y3Q65X+D63?=
 =?us-ascii?Q?Ac5j24JWJTD08QjzbiyaFHqF2WCQ448Kf59rtZyZ6nDgROUVv/UCOqzI3jBi?=
 =?us-ascii?Q?6dOBv1EnRJIS2HkVFliVqJmtHDp2xGqaLUfDnAGlo1ONVxP7ZWwY/UaYYQZc?=
 =?us-ascii?Q?xMacZ7UhA5pHm4qxXEnh2b8ML1uPWiYPw610ByPnMZw51CC7qjWVXkkSJtkL?=
 =?us-ascii?Q?m/6eX/qt+JScS0f9I3fqBUmtMLjFb/No/QOmnf6M1IiHULFPIa1eLiiG+Pxr?=
 =?us-ascii?Q?VnEsJPN052CjAfTnaU3FJoGiYpmUECDpEwB13qYIygL95byzqyMZwaXPFsmX?=
 =?us-ascii?Q?m/oF3UBGlG7Ay3K8zlTuifPN/8svHrBXg/gmIZ7yXIAU3kWTlgUZt1p5xn5O?=
 =?us-ascii?Q?6xvYxw19JLn6sStpeSkM73peWLDJQRxZ3MWEBVFjfbx8TM2I5TynFCoH0Fmp?=
 =?us-ascii?Q?RI1Zv0XbARtu93AqZwExOxsqDMpJP7XgQoNk7G0mWPM/+rvXnGzRsunp42q2?=
 =?us-ascii?Q?zGyw4ZGJ0BfpTYDGv8BmHZ9MXX9HsJAoq0EDSfSxK0v4/hufk9WLF+bqxXPy?=
 =?us-ascii?Q?sDfVWNqvgjWvlwF3iydkjNgyDIMduGTf2+UcYgECCumzW7C5/wmxaXSj9HZV?=
 =?us-ascii?Q?imDtlieDoNl1sxhBeUKCq3OsaRGnH48=3D?=
X-Exchange-RoutingPolicyChecked: RFnNCVGCtHcqtteynnsXTodlH27Jfx+SSbjE5YZNJRUtDmJgkxrJWY7GHy6Meba+y5xqbFt4Z5za7egb9qYKS/Bl3KDEOAG1sw0Xxy/CkpZxkNuBmDC+G6UkKpB6age+tMNSMn2yk5f38J7D9V7uHrtBxkkXZs8Dv5CC7RUBmt2cu86jLE74iTwcoA92OizoMedxsoZ+ffbDGP37hVU5OMBwMhPnlhf9nhjwGwekhnIFLrAeXHZZ7IKEHF6w+EWRUlVwPwxCI9kmRAw4XFE7nSkzn/4f4sEcxuwvdCeEW1eBXdZtdLVJbeWLO/NGdE2iNPoaDorwTYOe4xA7f+/hNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c4654c-339f-471c-2e77-08dea1818041
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 21:44:30.9336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPGzwdNI4PMGwXav6MqtuTClzjMPmJ8JHjDS1KXsL8f9c+aS4CNujhIi2TLmaaTopXYqt1LE/WyL0AyisUo4rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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

On Wed, Apr 22, 2026 at 07:49:56PM -0700, Niranjana Vishwanathapura wrote:
> Multi-queue groups use CGP_SYNC H2G messages to notify GuC of queue
> additions and priority changes. If a CGP_SYNC was in-flight when a VF
> migration was detected, the response will never arrive and sync_pending
> will be stuck set, causing a timeout on the next attempt.
> 
> Introduce a needs_cgp_sync flag in xe_guc_exec_queue (mirroring the
> existing needs_resume / needs_suspend / needs_cleanup pattern) to track
> this case:
> 
> - In guc_exec_queue_revert_pending_state_change(), if sync_pending is
>   set on a multi-queue exec_queue, clear it (preventing a timeout on
>   recovery) and set needs_cgp_sync, unless the queue is about to be
>   re-registered (which will issue its own CGP_SYNC).
> 
> - In guc_exec_queue_replay_pending_state_change(), if needs_cgp_sync is
>   set, push a STATIC_MSG_CGP_SYNC to the scheduler head so the CGP_SYNC
>   is replayed after unpause.
> 
> Wire up the new CGP_SYNC_MSG opcode and STATIC_MSG_CGP_SYNC static
> message slot, along with __guc_exec_queue_process_msg_cgp_sync() to
> handle the message in the scheduler workqueue.
> 
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

This looks right to me. Ideally in your testing we'd like to see...

'Replay REGISTER - guc_id' for both primary and secondary queues...

So maybe update the 'Replay REGISTER - guc_id' debug with information if
the queue is normal, primary, or secondary. This logging is how I
initially checked out VF migration before turning it over to the SRIOV
team extensive testing.

We'd also ideally like to see 'Replay CGP_SYNC - guc_id=%d' in some test
case too.

This is all quite racey so you make have run test cases and move a VF a
bunch of times to get these things to trigger.

One more nit below.

> ---
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  7 +++-
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 39 ++++++++++++++++++++
>  2 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index e5e53b421f29..f12843b80ca2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -31,7 +31,7 @@ struct xe_guc_exec_queue {
>  	 * a message needs to sent through the GPU scheduler but memory
>  	 * allocations are not allowed.
>  	 */
> -#define MAX_STATIC_MSG_TYPE	3
> +#define MAX_STATIC_MSG_TYPE  4
>  	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>  	/** @destroy_async: do final destroy async from this worker */
>  	struct work_struct destroy_async;
> @@ -64,6 +64,11 @@ struct xe_guc_exec_queue {
>  	 * recovery.
>  	 */
>  	bool needs_resume;
> +	/**
> +	 * @needs_cgp_sync: Needs a CGP_SYNC message during VF post migration
> +	 * recovery.
> +	 */
> +	bool needs_cgp_sync;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0e857ef06611..9cb72754215d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1886,11 +1886,20 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
>  	kfree(msg);
>  }
>  
> +static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg)
> +{
> +	struct xe_exec_queue *q = msg->private_data;
> +
> +	if (guc_exec_queue_allowed_to_change_state(q))
> +		guc_exec_queue_send_cgp_sync(q);
> +}
> +
>  #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
>  #define SET_SCHED_PROPS			2
>  #define SUSPEND				3
>  #define RESUME				4
>  #define SET_MULTI_QUEUE_PRIORITY	5
> +#define CGP_SYNC_MSG			6
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> @@ -1917,6 +1926,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>  	case SET_MULTI_QUEUE_PRIORITY:
>  		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
>  		break;
> +	case CGP_SYNC_MSG:
> +		__guc_exec_queue_process_msg_cgp_sync(msg);
> +		break;
>  	default:
>  		XE_WARN_ON("Unknown message type");
>  	}
> @@ -2082,6 +2094,7 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
>  #define STATIC_MSG_CLEANUP	0
>  #define STATIC_MSG_SUSPEND	1
>  #define STATIC_MSG_RESUME	2
> +#define STATIC_MSG_CGP_SYNC	3
>  static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>  {
>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
> @@ -2452,6 +2465,22 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
>  			  q->guc->id);
>  	}
>  
> +	/*
> +	 * If a CGP_SYNC was in flight when the VF was paused, clear the pending
> +	 * flag to prevent a timeout during recovery. Only schedule a replay if
> +	 * the queue won't be re-registered (which would include its own
> +	 * CGP_SYNC as part of the registration process).
> +	 */
> +	if (xe_exec_queue_is_multi_queue(q) &&
> +	    READ_ONCE(q->multi_queue.group->sync_pending)) {
> +		WRITE_ONCE(q->multi_queue.group->sync_pending, false);
> +		if (!(pending_enable && !pending_resume)) {

Maybe a local variable...

bool register_inflight = pending_enable && !pending_resume;

Then use this in the unseen re-register logic above and then here.

Matt

> +			q->guc->needs_cgp_sync = true;
> +			xe_gt_dbg(guc_to_gt(guc), "Replay CGP_SYNC - guc_id=%d",
> +				  q->guc->id);
> +		}
> +	}
> +
>  	q->guc->resume_time = 0;
>  }
>  
> @@ -2688,6 +2717,16 @@ static void guc_exec_queue_replay_pending_state_change(struct xe_exec_queue *q)
>  
>  		q->guc->needs_resume = false;
>  	}
> +
> +	if (q->guc->needs_cgp_sync) {
> +		msg = q->guc->static_msgs + STATIC_MSG_CGP_SYNC;
> +
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg_head(q, msg, CGP_SYNC_MSG);
> +		xe_sched_msg_unlock(sched);
> +
> +		q->guc->needs_cgp_sync = false;
> +	}
>  }
>  
>  static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
> -- 
> 2.43.0
> 
