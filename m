Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF935C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 20:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DC010E256;
	Thu,  9 Jul 2026 20:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="duQg+8Wo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9737E10E256
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 20:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783629236; x=1815165236;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ifqvPTtz4Qwq9B5+MmPvEOe2Eve7H4aQKrwFUDaz+9M=;
 b=duQg+8WoNNBxj5lWFriMi7INewrfIuVpPKZ+7G6Z6i0H7ktP/AmTNbRL
 tabpFGjaTz5lewyP47zIDBzW9Pe7TI7rawNtrYdOf6De/sUdeHridSWXC
 gDvbAWT9dua7Gf34jXtDtVVAv3Nb5qdYAECJv7XD/cljr5JeajnsMNW2l
 iXyruBEQhIKm+kSMXMKTV3SlFknunwSNVZUKGK+1OvMl+Fw4GalZri9s+
 ib/a5T/omX+IB6ejhvQNUq0b3xBrMa4QHEDvsbcU+KRXX/FJ3WFHqRIaq
 +x+YECpf9Jfj3RNazKJj9h5FPiGmh/oObDU+MTRU8DIDubLBXqA+5PVXH Q==;
X-CSE-ConnectionGUID: j+00Ye9XQOGpzwmy4OsQvw==
X-CSE-MsgGUID: T11aF1XDTvSFL2idOSyqvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84109590"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84109590"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:33:55 -0700
X-CSE-ConnectionGUID: G6JArQS2S1qJeKEg/DBfgg==
X-CSE-MsgGUID: J9ITRcEbTKCXIW7HudJGSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258992962"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:33:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:33:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 13:33:46 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:33:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OyL4ueyHO42vnZiLqhoTufT8i9GgQTqtahQT4aKHTJYg2078SEF7NUsZMGqBS1plhpwAg7DZPecYPBuA0ezNtr5ffESqv/CgCayzkKuoGdOKuR3eFAeMnOEuH3ocILdVXwgGhjaEWF2fvEt+Kw/LDuoDRovkPYqVT6SapecLIVhy9sbiTMTFT7s8o6nGGXSKweS4Dk/uGvLcUU3y/cO208q/pJYZiHY6PeA+S23BZ6ouU1uEJFkWlcl/i3quLeyw7dcEBMgG40AvVxNdaBdHuweWlUYhgDOqnYumb0yLdP+yF7K5aj52BZiK91JyXCK9G3QtH0Ylq3NpWDs2szKgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHKjOhUjriTq2h8epwynnLyEv+wGPuxt0QiWNb6Iz7g=;
 b=IXdbRPYhxkY2+GOK7rJKw6J8MLkCBDbwixpwnKrQcc3DSNHXLXTDev2lDz2nq1kMEc/ZWYv40acr5qUUwUFxbn88IaksSziPoPhWisqxN+ZoiYsZq+9YYtm20TX4Armf8QR54th95E2/VpY0+yRXkebK5SDOBoS1SlpVwnivUn/Q9YiK9YL11yiWmm4YgJFpoeFY+9ZeJbXxBX2+uCrtIySCUgSKoxoCld39SPhTM+/uvm+lPSb2ZojpHYvYqqd6qsSjhbs+AFCo9lfQR63h4rbZOZybvzeTV9UKEDDojb0Nm+sYZybuOaxNf6g28E1dGr0eEr1L8JBt/CdzaDTCmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 20:33:43 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 20:33:42 +0000
Date: Thu, 9 Jul 2026 13:33:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 1/5] drm/xe: only resume exec queues that were
 actually suspended
Message-ID: <alAFo814/XafX/nQ@gsse-cloud1.jf.intel.com>
References: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
 <20260701050730.1776476-8-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260701050730.1776476-8-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc3313f-7f75-45bf-f1e4-08deddf95ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 3febCzZlb1EXxZ5CIb2ZDfN8LbBMXvQyQXdiomrIKdprNR5YoYIuVZ0XxNhuuVfeSunF2HXI45RWan2o9kAxc9pMtihpnPXpM9fhNf7x35oOIv8vbxKZPwbzpd9c9yz35d9/v9ZKZksAnIu+B5ZSTnKhMZ4EcaeJ/KxMzoiRmXUT9IAmrBRVlQpOWLgQelre9DkFmtBo5JFcEbRMFA7KFGqhY7sFC+HEjnj9J6/mW8WPLd+dFdkpe4p2TICkRciGqlNhe2t/r2hP9UXBPuQuyPHzRHRJjB2bv2Dji0fzZ8iKzBI2v6nOHm5+oAtEtXIgng+Tmry7BTd7RfaiBkgr/OY3o+kYFhPc5FJSFyOZyKKQ7OfyIxtWe1vUOaZYODo1Mt86VRUbNLiMOu1fLo3wxmkvOZSJySI7iBWE4pLEWgn6Bv0KKIdWUjjM7tJIdizXN1nsElOBGJgTdRLDfje6SEV//k7xBtMzAW5dF1XVeukmQmE5yez+7k+TcsWrAlUZMYTUREQ22sttBNMhMe6nK1uRVYc560RDrbS7UiI/ccGUiXKQdTHVVU7uwihRG7TwU5wVif7ZLuMwQaTxFJKA7uzc6pImqQLMlgQxwrdttG4sKdTDnhgvz5YdJUDLkWVUOEt3q7+VtgpmVsjdCdVPoQMrlfVesJsJdqT23oJNGo0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a2214/xP0Do/nCaWfG4LElWvNlA+BWXxqPh4gZ4X6snaDgMUzitHQsYYWy56?=
 =?us-ascii?Q?5/alF22HCPaWP55uDAmI1EiYaxwGGhG2d2H1bNs2KU2R39TkIToQkWAgCXkj?=
 =?us-ascii?Q?hJC9ck8AbuSiwrHnBPKYBjVu7tlBYVhUYd4YZHGt9KSTMO6ABbfJwKIPlOqP?=
 =?us-ascii?Q?TxqqTExi4GNlajf9D779eJ0oKkgdPVrhUGAH2xb80MBG/ZK9GBgQfkqcxDzm?=
 =?us-ascii?Q?9LRAtwK/wYX61nIUvdtF5tyCrwwrlmNUA6/eJysEiCqHrZZhQ0NQn3D2WfMG?=
 =?us-ascii?Q?GDJpnGOvBfrVFz4mHTr2u33F5jpFIP4+vWxWao531OsKSms8XdSIHXwhw8Je?=
 =?us-ascii?Q?hk0HOzfEzOOO+j8c1+U2VyWGbUnsEKHSWLFlOqxCwDLJgrjTAWL2X7QQbBNf?=
 =?us-ascii?Q?cghvqno1XJbzVFJ/RenDTSU6cvhLTfk4OFiYvfjfNzy1w9+yqsxF7wMQcHiG?=
 =?us-ascii?Q?86lPmKuo+zlwols7iJj2kLaPaxfuGYaaXeF/LJVF8yy1YPQIp1wYCFtK6IUg?=
 =?us-ascii?Q?8j5q+6wbJfdE+PS38ce3htyyCEBgPofjq8lAib2oeriWfELFUOqa1gJirFNG?=
 =?us-ascii?Q?agdn9BCrETJmOTPDJokB0LExzTcYGYNOSjQejfG0sN5RK8lHMg9MS2moB51L?=
 =?us-ascii?Q?+Nb0UjkNrCyThY5G28nagrqQSVntPG/3sgJdEJp5lc9K+6cAzMfDhZt5GcYX?=
 =?us-ascii?Q?LJg5PDUtoY/2S6VzgxjppvPKv53KBxDOPLbLdVaEiJt8bzAUxREJbU9F+rse?=
 =?us-ascii?Q?WhSofEjgfWFVu2WBscsd9oxVrkPPi7h6e898ySOLJukezdZXXr2xlCKPnGz0?=
 =?us-ascii?Q?aqOsOBgCk90/rKcHLcgiS/xJ/u6NILJUo/TZG70U6UTjaK1RDqHCXbHUaWcL?=
 =?us-ascii?Q?rUD495lj0ldu8TlkwSSzv8mCrflGqrnV9EXF7KiJtS5fAIvuzTtMqsim3IHn?=
 =?us-ascii?Q?Ak+Jb2/H8M0tr+v73mF4eGR8GLwBRZXAkJxtFObsvwgCam7KNESNJxTavD+P?=
 =?us-ascii?Q?8MoICHw8/jytRPMq42rMGk+7TXjsT3+vniQPPaN8tBhVnhFt/Usk4D7WhGAd?=
 =?us-ascii?Q?HgsdVu91R81lem2Guo3VjfD0hhRzGYr1UKxHqn69pbnsJ1mrhdhQSQx7EIBQ?=
 =?us-ascii?Q?grv15MMCBQSjKTvsbFmBdafCtJcR0OwN/W/xiYFPGaEH7wfZ9C3T+wEGCAaY?=
 =?us-ascii?Q?4aSl4i7JwUTMmse6xBHbTpao/iShujtywwaqDAAWA5wX3Ug52j3+8R/ixF5l?=
 =?us-ascii?Q?L6ln9g2WgTScNth7fLJEHGGPbzp9zJr0CGyYGj6glZRwasdmrhVSj7NrypZ6?=
 =?us-ascii?Q?xkLjLjrrhDMY2Q6fetVeUWdB1bQ2pY9as2JGudPBAxmPgxkNMnNtBizEu3kV?=
 =?us-ascii?Q?3A4TH6QlostTBLp6gF/rDuLn31gJeG3PYpQMlHzJv5eXMTyWHfVPrrOFCYwJ?=
 =?us-ascii?Q?8Q3+zMsVnJQmQYicdF1HylND1BdgIB0WvlvPN/DJyNXEacLFJX/eqPMYSI3j?=
 =?us-ascii?Q?4ARddJ3BN4Gwk5Uo319iqiAq8AFa5eUY2I9SDfE9OrLoxCYw96zV6uu7QrmN?=
 =?us-ascii?Q?i++pgYnUOjvyFg9UdgIvqSAF4gau6U8fSZFQuJq9xmiD+YbciWulBgtJhlnc?=
 =?us-ascii?Q?yQZweCMtnH/JayI6jJRSbLecFbyYxEqfn3zhfEuq6msus90tB7wlpLO0/M95?=
 =?us-ascii?Q?kMOTT+Z9HAqfPv5RrHD7eEjnnJv7Q+2nsxUco4YEr4KrfEjQf01b7vbRtqti?=
 =?us-ascii?Q?VmDv2lHf4PQ3TAJlyOkM3md6AHi7RFI=3D?=
X-Exchange-RoutingPolicyChecked: e/FG895lwovKJ2JKIzFJ7XZvRBZYeTtuwjNibsFNl9Q2NrusGVouU7WYI0nJKO5mlf2alnyG1RneHiAKplhrqLQVShVRA3pV5AJxaa72kfnGFKgwGQ4zLtN6MrTdtnd+3Fjl0Y4nL9CXz2A+ywELuOJxwm7DtZonLsk09sUZpyXy2CQHbSPmd51h0kSNApZgGXMQwXWJNTWTiUNIaXBM6ZghAsfS2BwsxoHAmiwSnpOu2Dxzpjr3xK9KDPoZ/v/bSM3Tpf6+hBuoC1oAZZcbt+9F2QLESZeIPuB+3C9aWgnMyk62Hrh46Oi+nQ3TIaauAa2XOs/gzXUJvAnXIvetqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc3313f-7f75-45bf-f1e4-08deddf95ddc
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:33:42.8016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQqaKXaFn9/6zbT818zoBN4Q6OHNPeTGOnzuOtYWmm6HyV/JtoqVjX8lpz+xxSZozQsPNRvo12ITsCjA4bjiOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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

On Tue, Jun 30, 2026 at 10:07:29PM -0700, Niranjana Vishwanathapura wrote:
> A consumer-issued suspend() can fail (e.g. the queue is killed, banned
> or wedged), leaving the queue un-suspended. The consumer must then not
> issue the matching resume(): resuming a queue that was never suspended
> is incorrect.
> 
> Add an lr.suspended flag to struct xe_exec_queue that records whether a
> consumer suspend() succeeded and a matching resume() is still owed. Set
> it on a successful suspend() in the preempt-fence path, clear it on
> resume(), and only resume queues that have it set.
> 
> In resume_and_reinstall_preempt_fences() also skip queues that have
> since been reset/killed/banned/wedged: such a queue's suspend may not
> have completed (suspend_pending can still be set, e.g. a preempt fence
> signalled with -ENOENT without waiting), so resuming it would trip the
> !suspend_pending assert in the backend. Leave it marked suspended and
> let teardown resolve its state.
> 
> A queue is only ever suspended by a single consumer at a time
> (preempt-fence mode and hw engine group fault mode are mutually
> exclusive), so a single flag is sufficient.
> 
> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_preempt_fence.c    |  7 +++++++
>  drivers/gpu/drm/xe/xe_vm.c               | 18 +++++++++++++++++-
>  3 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index d27ce24daae5..dbb2ee8eb5de 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -200,6 +200,18 @@ struct xe_exec_queue {
>  		u32 seqno;
>  		/** @lr.link: link into VM's list of exec queues */
>  		struct list_head link;
> +		/**
> +		 * @lr.suspended: Tracks whether the consumer-issued suspend()
> +		 * succeeded and a matching resume() is still owed. suspend() can
> +		 * fail (e.g. killed/banned/wedged), leaving the queue
> +		 * un-suspended, so consumers must only resume() queues that were
> +		 * actually suspended. Set by the suspend caller on success and
> +		 * cleared by the resume caller. A queue is only ever suspended by
> +		 * a single consumer at a time (preempt-fence mode and hw engine
> +		 * group fault mode are mutually exclusive), so a single flag is
> +		 * sufficient.
> +		 */
> +		bool suspended;
>  	} lr;
>  
>  #define XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT	0
> diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> index d6427b473ddd..4aa570fe745d 100644
> --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> @@ -74,6 +74,13 @@ static bool preempt_fence_enable_signaling(struct dma_fence *fence)
>  	struct xe_exec_queue *q = pfence->q;
>  
>  	pfence->error = q->ops->suspend(q);
> +	/*
> +	 * Record a successful suspend so the rebind worker only resumes queues
> +	 * that were actually suspended; a failed suspend() leaves the queue
> +	 * un-suspended and must not be paired with a resume().
> +	 */
> +	if (!pfence->error)
> +		WRITE_ONCE(q->lr.suspended, true);
>  	queue_work(q->vm->xe->preempt_fence_wq, &pfence->preempt_work);
>  	return true;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 080c2fff0e95..23f4a9fb9a49 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -206,7 +206,23 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm,
>  	xe_vm_assert_held(vm);
>  
>  	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
> -		q->ops->resume(q);
> +		/*
> +		 * Only resume queues whose suspend() actually succeeded. A
> +		 * failed suspend() (e.g. killed/banned/wedged) leaves the queue
> +		 * un-suspended, so it must not be resumed.
> +		 *
> +		 * Also skip queues that have since been reset/killed/banned/
> +		 * wedged: their suspend may not have completed (suspend_pending
> +		 * can still be set, e.g. a preempt fence signalled with -ENOENT
> +		 * without waiting), so resuming would trip the !suspend_pending
> +		 * assert in the backend. Such queues are being torn down anyway,
> +		 * so leave them marked suspended and let teardown resolve their
> +		 * state.
> +		 */
> +		if (READ_ONCE(q->lr.suspended) && !q->ops->reset_status(q)) {
> +			WRITE_ONCE(q->lr.suspended, false);
> +			q->ops->resume(q);
> +		}
>  
>  		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, q->lr.pfence,
>  					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
> -- 
> 2.43.0
> 
