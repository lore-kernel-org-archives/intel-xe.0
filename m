Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19259C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 19:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDC310E114;
	Wed, 15 Jul 2026 19:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcFZXUX7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D10110E114
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 19:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784144742; x=1815680742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JnyrysAjcGUwjd4mSr+7HWx7DXYNzp1uKcXkSobtywo=;
 b=VcFZXUX7GfjkSz2IOsWx9knnM77Or2yS7JOV98ykLI4HZlc1qkr63q0J
 iqYTpRNFy764pWvftWK9EIEYy476+6ynvPVV58iJUzsVwF3lfFNum+pAV
 uhGX4UtuefGkORmDXber9kDpgw/xEui2p+CqzlG53NbsZAAwFsM9ntNfT
 AffVr5rEAgAsPeTra5Brn+GwujbqAFmVPeKwHyR5vvpjsIzUgMq4KjvdG
 yxRUpWjg6a/P+B782R/VFG2i0GREZoYFqn+JYmTZlsOlg8GSjkwSey8in
 rKJraPTphDkenae6nNRZ4j13X5hIL2jZAj6KYlIaHhqdVJhmsVrVKRlLy Q==;
X-CSE-ConnectionGUID: H45L/TguTU6+pMVaZL/20A==
X-CSE-MsgGUID: e/Wmxh3uTfWH2/YjSthGow==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95402392"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="95402392"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 12:45:41 -0700
X-CSE-ConnectionGUID: 94poDrPuTQSSCiJG9QwE6Q==
X-CSE-MsgGUID: E7PzRyGHRdC5JEz1NzS3Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="286362953"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 12:45:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 12:45:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 12:45:40 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 12:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qE0O2aLO4U6NA1QfAdWXu8FNz5R/AzwutqJURghnsk7Q1ApnNXRxj1lXNF+b7mpmTNwXPAvrJmHxsZF1DUHIK06LlXLW4bluN91jenW4V7pCuvVUH/LwBA/CQAeGITUeUdXzMnEW6ZTxXmIXepp6Fp5vnhCGWrz7nT8/Jmw68fYEKpgeZgHZdDS0dA0sadkHBjplyfbdoEIFN93iSoRDoFLvBfSx9+XCOXQDUEExmfAxX0GcammahWqBMEDnSF8iOw27e+Ij3LcLWzrTquG8VdG8JL9w1aIcImDJFjcrZMSzRvWHTTt7RZo32a2h8W2hCpm585uqUeAJ607xRhMWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiJDurLVgVOUMhEFaFaNlSv+9UNxk5iah8NdCLKlSoM=;
 b=IaXSJmResuJqYcO+sRzAghk8gwp9AobtXUhUfah/au6atUux/3OHfANfPVKIQVQVHIrZf2DOtbxmliVrflMn1h292qq5wbt3LTodQV5Bmu29m65Oxpo2yGKAu7grFoXwcmam+ZMr6q/lmsYKqt+bBD1TYXTdO056uDFLHFXLGxtmBWncLmMhjmThv8pCSLnCzTZWZ58K+rOhXTeEkJn1I6wmDZ4QuhT/pPMGQmIkSo0Nvmls512COabJh9EVei+Tvk2AQeDv+4hPwkjFwZg+tCe7WMqjNIpPyDunMWmqhsGooqaa39RW8Hv9CkkcXeGerRrhvNfXHffagIjXdFu1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 19:45:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 19:45:37 +0000
Date: Wed, 15 Jul 2026 12:45:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/multi_queue: wait for secondary's own suspend in
 suspend_wait
Message-ID: <alfjXhZ9nNaAmmWW@gsse-cloud1.jf.intel.com>
References: <20260714052627.2241302-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260714052627.2241302-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 44418e5c-df54-484b-5c59-08dee2a9a47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|3023799007|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: z+9wCPSWc6p6J3Xpwju7JcJUQffJrmCwUfgR+4wKOslEPTeFClHnR909IvAptglqx3MPnJlmei428at0bSRNm6pQVt1gHbv2roHzwqMZ1oRj2B+C9UsjZ3jxurx0Q8v//aeTgrUAwlDRip4cnm/2ZRfxDZ0aupuF9PDJcU8Wl6VieFfp4/8pUDDzTE5nfA3vhS8uZ8L9qY6pOOFnOR/U786xyCndJacu344xSXyG0n/Voet9mZIBsNMTglwuoB/7hIAXPU8bdLgvMeA7OMoxLFAvD7meCNZaAX/eR1QDSFiwgj4f/GmbpjRYkzKGforAezpZo8LgM5bq2i9ghebQpEi12qUB8s0SfUicEUYzFohBdm4ln3hjzuZ+Xzzt2elpRxIZVGGtTTQbJkV/BLaziZfinL/tJo+lLLw9oXFkTNvi2Iq69v34DC/1mmBWpdhybB1D8IbShr+ZM7SITEuKweETaoWLoSDFP+BSg6JAZvyRQ2QqIjAkJ3K0U6Xje0YWu9UKahwlIWvSwbYuupEFuM5cPMdtdZwbG/E3hoFUATg7CmH9GRlYciaGjAay9VoO9nqPxuUxoDcZJaobHKpgdV48FgLd8if0IzjikAjiRqbU2ZqSc62Ve3pgwqf6e96AjYzp4mMIzo4N9CdcbnbqAM9HY6FbxAG6Gu7fXnMSMOY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(3023799007)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sKVhy5HaZuXRttWyLfpK0818k1oDM6xsimYzdoltDiVXfl8Zo4INgERxSQ0W?=
 =?us-ascii?Q?Gbuqjf1eFLQ4yG4q7ENuF2Sr9GAWcp6NKIP7g1QJ+GS8+z9gbtQ5w+Rb9QDf?=
 =?us-ascii?Q?EPb/3VjBOxzpMKQtYnvu3KG4QSKrnLkR5XDBza1+CUlS1pfsTYne5T+JNjPD?=
 =?us-ascii?Q?Ag4YUmOl8YE3t3dsQ0jCK7uCAZ7eDzVhjqKoAgvll0/MpIRXyZSooROvB6FR?=
 =?us-ascii?Q?XacKulJHblcFjvC62pdBMJbt3BA75gagI/0gWZHdGDDI3fcIGLfw0xDgswXx?=
 =?us-ascii?Q?q7RR8lpT4lkrnxx9aCtT/WCQZpv9cuS3MeAItbN4CLgiZbngaZxY4EHP/5af?=
 =?us-ascii?Q?xu8iczrPOokNCAy4FNZ9R2ribrrbwaeASOzo0MfJ0mdm1J/69mAG73n3BNX0?=
 =?us-ascii?Q?fcsc7mUfNdiZJTTAMj45GDNMMqBu/JKUJQbXdo8rAfQHf2O+YmKmv5EKY2sh?=
 =?us-ascii?Q?c56fz3KTv/fTumd3TiY3ODBQX4JeD+gOF6Ds7Wg7/qovJ4aeId57zP/3UOmh?=
 =?us-ascii?Q?T/81QBoDRMfdOOn/PZ1Xl8ue/IEw8QTup+Z7V9WF6V8LbG+iOHLkfC8X+3zP?=
 =?us-ascii?Q?eZeoyEneIJCspWYBecYZKb/iSUihFcatDDRpd63eSWwOKwSx0efSTztxFrRK?=
 =?us-ascii?Q?xfmQkodPXCD/LyWxl7edqrZx+CpyaJVlknQbqCToyASnE1A0FZEVgWbOv2Uz?=
 =?us-ascii?Q?0pS1nLDdTbaOOgsYh2Vc/PEJB0NfPH9Sqz9J1j+u8zSNahqUSE6N+vr7fBYF?=
 =?us-ascii?Q?xbqfQTOhYfPatgqJZMGWCQgFHuSzJrrnatHQVXi0k3uH+k76eaGKh4zwKiII?=
 =?us-ascii?Q?EWobYpiOsj88BOw6NhodEa7sYIVFpNToreO/Dxnwfm1ljGuuDMjh4zuFCCQ4?=
 =?us-ascii?Q?nzLUFaXsUdNnxSc0JZKCyDuaMh3fAKOxRzUQpDY3GdhRLqG2EvgIF3ezCL70?=
 =?us-ascii?Q?eFP9zGAURAa5a6Qm4/kwyabysP+K6ltbRV+vyqC4ne0Xdk8jsS2aIKld3Q12?=
 =?us-ascii?Q?MJt8szkj3pjDIgNJCxL+dm7Q0V1wudoqOfuIRvNShdbNGkt89NeXHYKNRQGx?=
 =?us-ascii?Q?YsCqNYNGZlxhpFr56IwdjyP/ZmgoIH9Y7TgMS3nq7H9lwu7pzZ2BZuOnp8w5?=
 =?us-ascii?Q?2R9ocDFwbjWqEH/v7cxHC2uPuPFh5CGGx2AKTvX72zeOqxKLW5iXj966fN5Y?=
 =?us-ascii?Q?m/argNZAaTWDfuRYLCqJfRSZXaEJd5RwQTxodgYV1lSZZ4+jwaun5T2ilFIH?=
 =?us-ascii?Q?1LV851SCbks8MpZym/KNj4iRun0OOTskbyjMCNf1W28dBBwgnt+HDdcjYAqc?=
 =?us-ascii?Q?7ZmyLeHICPtl73ztT2Z6Aerq7D6+y8uMWC1IVsb3I0zG4iGdIXyucvfiXM8q?=
 =?us-ascii?Q?Gt2HltadzWR2vvOLn0KnPE/rMNSYQ4tmA6v+Junptp2Aafy1f90KptQxdkrz?=
 =?us-ascii?Q?EDAZK6sOGmxuPEceXRdiDTldqX5IuNhgml0ycuZSydtAtd6dlLTUMJhbh10r?=
 =?us-ascii?Q?0yd2H7oA4cHkBdiVxbqwePfRZTIZ4Mx/rGIYDZAp8u5gQLKh0ZIJLCWy2jAe?=
 =?us-ascii?Q?OZNmgK+2fFU1W0HzNuidi/eZ9YJu3NpCP4rSEAp4O3kgf9EH/710mTHzOH2y?=
 =?us-ascii?Q?MILhWWTv+a65psfLwK2qeFrcGO8UKKQ+vQV8RQY1uTOsuX6ijcsHXpbEEz6F?=
 =?us-ascii?Q?sQBz+8OZDso1Ok/Mh+qRVzTBOy88HGq+QN4tfuZpNnxb9gR5jRMLfzbfySe9?=
 =?us-ascii?Q?ll9/kEJUpA=3D=3D?=
X-Exchange-RoutingPolicyChecked: kKK60jthS9DjEpEuY2f4DUMlqYjVMsuD3/Pu6qOduEBdjS2xp/mvnLusX+CctcMrRXi0Wbjc4tJqZAOS6ncUQErEFMBGfPQQa3ewKndTIoBS1Om7QafO1aEjcamkMOu5UdyX4iAQzTiP3Nq8DvbtAl8H8QmD9hKNGJWHQZ0RdWXvVaEf2ErHqd0yHuL4jSY9U2m+rVCRiF0jmkf744WMXNT8ZLH6FrzH/hqDXb1l48YLLavZQZsncLuKa240YohWkgtWQ9LrkuWTsGCE6n/oDqJcHXDFhcI+oMtV7OcOHQKLhV7lqgf0TpJq5g+5D8OL0uyj/9aVvTAYQus4OtZYaQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 44418e5c-df54-484b-5c59-08dee2a9a47a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 19:45:37.2606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWjW0e/DxV4ZnG+pqMYisWGJEuEe+3LrWBLlCNu/hMplFMS3pYYj98oLFOJeFbcG86brZe9exPw9CRZL61k6ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8256
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

On Mon, Jul 13, 2026 at 10:26:28PM -0700, Niranjana Vishwanathapura wrote:
> For a multi-queue group secondary, guc_exec_queue_suspend_wait() (and its
> blocking variant) only waited on the primary's suspend, on the assumption
> that the secondary's suspend is synchronous. It is not: the secondary's
> suspend rides the sched-message worker (short-circuited, no GuC round-trip)
> and completes asynchronously. When the primary was already suspended the
> forward is a refcount-only transition that queues no new primary SUSPEND
> and leaves the primary's suspend_pending clear, so the wait returned
> immediately while the secondary's own suspend was still in flight. A
> subsequent resume() then tripped the secondary's !suspend_pending assert.
> 
> Wait for the secondary's own suspend to complete before waiting on the
> primary. On a timeout, ban the queue (which tears down the group) rather
> than leave it with suspend_pending set - otherwise the preempt-fence and
> hw-engine-group resume paths would resume it and hit the assert.
> 
> Factor the per-queue wait into guc_exec_queue_wait_suspend_done() and share
> the orchestration between suspend_wait() and suspend_wait_blocking() via
> guc_exec_queue_suspend_wait_common().
> 
> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 126 ++++++++++++++++-------------
>  1 file changed, 70 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c70c77141a74..352f101b221f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2340,25 +2340,23 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
>  	}
>  }
>  
> -static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> +/*
> + * Wait for @q's own suspend to complete: suspend_pending cleared, or the queue
> + * killed / GuC stopped. With @blocking, wait uninterruptibly and do not handle
> + * VF recovery (for callers that must complete on behalf of a possibly
> + * cross-process queue); otherwise wait interruptibly.
> + *
> + * Returns 0 on completion or -ETIME on timeout. Interruptible waits may also
> + * return -EAGAIN (VF recovery in progress, retry) or -ERESTARTSYS (aborted by a
> + * signal; suspend_pending may still be set, so callers must not resume()
> + * without re-confirming the suspend).
> + */
> +static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocking)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	int ret;
>  
> -	/*
> -	 * In multi-queue mode the primary owns the GuC scheduling context for
> -	 * the whole group, so wait on the primary's suspend to complete. All
> -	 * group members share the same GuC/device, so guc, xe and timeout above
> -	 * are computed from @q directly.
> -	 *
> -	 * A secondary's suspend is short-circuited (no GuC round-trip) and, as
> -	 * its SUSPEND message precedes the primary's on the shared FIFO
> -	 * submit_wq, completes before the primary's. So waiting on the primary
> -	 * is sufficient.
> -	 */
> -	q = xe_exec_queue_multi_queue_primary(q);
> -
>  	/*
>  	 * Likely don't need to check exec_queue_killed() as we clear
>  	 * suspend_pending upon kill but to be paranoid but races in which
> @@ -2369,73 +2367,89 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  	 xe_guc_read_stopped(guc))
>  
>  retry:
> -	if (IS_SRIOV_VF(xe))
> +	if (blocking) {
> +		if (IS_SRIOV_VF(xe))
> +			ret = wait_event_timeout(guc->ct.wq, WAIT_COND, HZ * 5);
> +		else
> +			ret = wait_event_timeout(q->guc->suspend_wait, WAIT_COND,
> +						 HZ * 5);
> +	} else if (IS_SRIOV_VF(xe)) {
>  		ret = wait_event_interruptible_timeout(guc->ct.wq, WAIT_COND ||
> -						       vf_recovery(guc),
> -						       HZ * 5);
> -	else
> +						       vf_recovery(guc), HZ * 5);
> +	} else {
>  		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
>  						       WAIT_COND, HZ * 5);
> +	}
>  
> -	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
> +	if (!blocking && vf_recovery(guc) && !xe_device_wedged(xe))
>  		return -EAGAIN;
>  
> -	if (!ret) {
> -		guc_exec_queue_suspend_timeout_ban(q);
> +	if (!ret)
>  		return -ETIME;
> -	} else if (IS_SRIOV_VF(xe) && !WAIT_COND) {
> +	else if (!blocking && IS_SRIOV_VF(xe) && !WAIT_COND)
>  		/* Corner case on RESFIX DONE where vf_recovery() changes */
>  		goto retry;
> -	}
>  
>  #undef WAIT_COND
>  
> -	/*
> -	 * ret < 0 (-ERESTARTSYS): the interruptible wait was aborted by a
> -	 * signal. The queue is not banned - the failure is in the waiter, not
> -	 * the queue. The suspend is not confirmed complete, so suspend_pending
> -	 * may still be set; callers must not resume() on this error without
> -	 * re-confirming the suspend.
> -	 */
>  	return ret < 0 ? ret : 0;
>  }
>  
> -static int guc_exec_queue_suspend_wait_blocking(struct xe_exec_queue *q)
> +static int guc_exec_queue_suspend_wait_common(struct xe_exec_queue *q, bool blocking)
>  {
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
>  	int ret;
>  
>  	/*
> -	 * Uninterruptible variant of guc_exec_queue_suspend_wait() for callers
> -	 * that must complete the wait on behalf of a queue possibly owned by a
> -	 * different process (e.g. cleanup/undo paths). An interruptible wait
> -	 * could return -ERESTARTSYS if the calling task is signalled, leaving
> -	 * that queue suspended forever (cross-process DoS).
> +	 * A secondary's suspend rides the sched-message worker (short-circuited,
> +	 * no GuC round-trip) and so is not synchronous with
> +	 * guc_exec_queue_suspend(): its own suspend_pending may still be set
> +	 * here. Waiting on the primary alone is not sufficient - if the primary
> +	 * was already suspended, the forward is a refcount-only transition that
> +	 * queues no new primary SUSPEND and leaves the primary's suspend_pending
> +	 * clear, so the primary wait would return immediately while the
> +	 * secondary's suspend is still in flight, and a later resume() would trip
> +	 * the secondary's !suspend_pending assert. So first wait for the
> +	 * secondary's own suspend to complete, then wait on the primary.
>  	 *
> -	 * A timeout is still a real per-queue fault, so it bans and cleans up
> -	 * like suspend_wait(). VF recovery is deliberately not handled (no
> -	 * -EAGAIN) since a blocking caller cannot retry.
> +	 * A timeout on either bans the queue (being multi-queue, that tears down
> +	 * the whole group). A secondary suspend has no real GuC round-trip, so
> +	 * its timeout is a software scheduler stall rather than a GuC fault, but
> +	 * banning is still the safe recovery: otherwise the queue is left with
> +	 * suspend_pending set and a subsequent resume() trips the !suspend_pending
> +	 * assert.
>  	 */
> -	q = xe_exec_queue_multi_queue_primary(q);
> -
> -#define WAIT_COND \
> -	(!READ_ONCE(q->guc->suspend_pending) ||	exec_queue_killed(q) || \
> -	 xe_guc_read_stopped(guc))
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		ret = guc_exec_queue_wait_suspend_done(q, blocking);
> +		if (ret == -ETIME)
> +			guc_exec_queue_suspend_timeout_ban(q);
> +		if (ret)
> +			return ret;
> +	}
>  
> -	if (IS_SRIOV_VF(xe))
> -		ret = wait_event_timeout(guc->ct.wq, WAIT_COND, HZ * 5);
> -	else
> -		ret = wait_event_timeout(q->guc->suspend_wait, WAIT_COND, HZ * 5);
> +	q = xe_exec_queue_multi_queue_primary(q);
> +	ret = guc_exec_queue_wait_suspend_done(q, blocking);
> +	if (ret == -ETIME)
> +		guc_exec_queue_suspend_timeout_ban(q);
>  
> -#undef WAIT_COND
> +	return ret;
> +}
>  
> -	if (!ret) {
> -		guc_exec_queue_suspend_timeout_ban(q);
> -		return -ETIME;
> -	}
> +static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> +{
> +	return guc_exec_queue_suspend_wait_common(q, false);
> +}
>  
> -	return 0;
> +/*
> + * Uninterruptible variant of guc_exec_queue_suspend_wait() for callers that
> + * must complete the wait on behalf of a queue possibly owned by a different
> + * process (e.g. cleanup/undo paths). An interruptible wait could return
> + * -ERESTARTSYS if the calling task is signalled, leaving that queue suspended
> + * forever (cross-process DoS). VF recovery is deliberately not handled (no
> + * -EAGAIN) since a blocking caller cannot retry.
> + */
> +static int guc_exec_queue_suspend_wait_blocking(struct xe_exec_queue *q)
> +{
> +	return guc_exec_queue_suspend_wait_common(q, true);
>  }
>  
>  static void guc_exec_queue_resume(struct xe_exec_queue *q)
> -- 
> 2.43.0
> 
