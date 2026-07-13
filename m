Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361C5C44501
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 16:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F0B10E626;
	Mon, 13 Jul 2026 16:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z488rQPS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7574B10E626
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 16:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783959615; x=1815495615;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=McdJWK3752+f6xUf75gqmNME/BiYSHyrfkulEDBkOfo=;
 b=Z488rQPSReIFEpm2+t6QCHLpp/KyemOA2FcFc78lpauJOrsR4jycIYxs
 kEcQnqctHpUg0mZVe2zpk/sx8n0GitKK2hsP2CmwfLZ+9JyxlyH3LOTvm
 LMmJIF0QafxtYNZ0wC/te/kZKmCZxwuZdgWn6jfyEjh605wpb8EzNdWlT
 4C3JwmPm/2clrKoWqHQCwE2xLjGZxpyxxbtp3f/Vc+solUCTg5i3qt7uk
 39oOYXQ208MpC1n8c5ygN001TeXFr4ES4bWAbg+AuR1VQ32IfeQeg9bVl
 ri+85GLi/de3VBYQqIS7EzHuerW/aginc1Be3hRozxTPHVB+098qFsu3E Q==;
X-CSE-ConnectionGUID: I+vpmnnrTO+kZiRYMMCG3A==
X-CSE-MsgGUID: D0JwvEXGTMe/xy9zlP+ONg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95174595"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95174595"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 09:20:13 -0700
X-CSE-ConnectionGUID: 8JaawpRWTfWqyvzoduN+yw==
X-CSE-MsgGUID: /ukBjGx/Qoy18xrS1sRHnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="254458157"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 09:20:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 09:20:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 09:20:11 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 09:20:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOrRzQXOnXD4wv3jRahDvHQkz98CAvAIGee9TyXSa44YVkaz6ySP8ZrjLzc9Q8yGsqPM+HuLLo2BGuLa0H3/wstdF6teS9LNXlHcoYgT6Sgz2RYj2kALZ1Gnlp65vbFr1pSEb4AEaXr5JSm7p1YAWnJtloco73IZKIoggZCsagqJA/kLZySjM/TPqcbsAGPIR/UL6JGmSWoT3yA/0AC2lbMNPSETffird263YiEQTWcI2Vjg93yuPj8YP3ghT19MrX99PV59sS/Jt0Og/ScrPJd4ZH+6RCTRCWI565xsOoTtwfyMN0JLip1lLPASjwuW5H2GjQMQ6pjTZwmIoi7/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhylodIT/bhmew5t/+eW+KnM62RiMzNx6BA+eLcqiZo=;
 b=I0mWCKqBUdH+6p498n5/qMp/Ep9kbMQMLrgg/HMQuAa6VdbV9dv8MsK1B9JCy6UZJr7dxxe2FzlWyz0kzBRdWe4amprUcDx9q1vqkqnPhFtKarscQ/pw5IGwAT6HgMqsJogwM2ftHJ7yT78flgvZyad8HryVGXTP8KWgiqh1F3dYSVdUn3GrwcodVZIjuxoPJWQRA7rBTvyi+MpyR7cKtMnFpmD8EMZqMalQpsD9SvC8TFtmd4SrfUutHXAFxQNmA7zRgOfZMkgfaEpVIPdZPIZZZHhhX/7lboKgjWv95V1ijaCByZJCUUcWlXS2uQY74x4UuW0zxVnCISryXBKFUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF1A7C623DA.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::816) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 16:20:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 16:20:08 +0000
Date: Mon, 13 Jul 2026 09:20:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 4/6] drm/xe/hw_engine_group: propagate suspend
 failures during mode switch
Message-ID: <alUQNb6rEDGysOxk@gsse-cloud1.jf.intel.com>
References: <20260713030005.2123322-8-niranjana.vishwanathapura@intel.com>
 <20260713030005.2123322-12-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260713030005.2123322-12-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW3PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:303:2b::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF1A7C623DA:EE_
X-MS-Office365-Filtering-Correlation-Id: f23c0147-7881-4f12-5aff-08dee0fa9ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: wxt9Od/x/y7MyTH/wQvqyF4kcCrByi38M3OKgTpLVKZCkfcf9rDzjO8gxKh+peQaPJmfPmRAs5J917nsQUbNixoQtnXLzWrqKvlY4V7Bja4lY9TL7ig7CEDc+GfElvYcRYcAmlaA0MHIiADbpBC3uY0YOs9PagYsfH9LvH30nuaUJIIOjsuvzPvv4J4PkuMlFDTMxbIJE0yWmpGqLtfuWyvdz7NQQ2G45futnePCLnDXHpIa3fMmzYYNoXU/Jv4tNTIHqpFqlLnykVX+pLCu65DQlcRUS/MvQiYnXuTmJwc+TU0fKBHZWmtCcgQZIs38m5f1uj+q57T9GLJzQK29cWJH84++dIyEcIvMO/WRY0ySsZPIbxxN8meuPvqZK0Xg02znM53Qb2g3UgcnwoAvy9z7AkISYDyynz9+cgkNP/BZ7e+7Doef6WavF5WeXEHnGIueZuJowx2Zh6Wjzct4na+usVgrbyoIzrzjkjXphAy2Ymv/FtjPycHbyjXYSPDz/hJESqtfSUZucdLvao7ug9+aZFT3kuBVXMbcfDTE/xtahCUCf3QIusCYc1IVzkxkJVVMDTtVYmiPqgOOqOtY5g8L9lxHLN1fhhQ/W28rpxVpPFdlSszUbAcAd9bP5USpI1hTtQS+3NjXxcz9YbuX3VUZY0cS9O/jL7KF2WCPv6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mVqYRmIsTe/nUqEdZLjINuQrHHShOXzipouTR+VjzpgYyq/SaIk2dmogFt8h?=
 =?us-ascii?Q?7mTYhSQhn/0ptM99qusB1MAbr9OxjbN7b2xCv0d1JfkNKDh1fVGYK1I9W6Hw?=
 =?us-ascii?Q?23zMOv3KLyZNBnWqFBUvGs7x/jXtDAtzvMOdTHXYrOAkWspvIaZ8GUHAWJfG?=
 =?us-ascii?Q?UXGBiE1D/tY6QoUW/nupoUZ2IC9RNHSdouSXRQu9OgeGKGwxxtn7HLCViqyr?=
 =?us-ascii?Q?GWkOXS+b9Yepg+gnyMxlvU9/De1tbG/QUqX6gzVFkJayuym5LJUWlZrcMdGt?=
 =?us-ascii?Q?3Gh6W0dEUD/CIsSWErj4FVYmHwG8IxfP1vkQGI2DgfmsYZB9iIgaZIprPocN?=
 =?us-ascii?Q?HMyfxyp+LdQ2PgCD4Y/iVC9cEGVV/ZP7yrZ5I9bBUvpCINA5ddPGADNwpG5W?=
 =?us-ascii?Q?IHtVYSdFfIY+AaKyX1+tP8hy9cgMsqevTXn2A/2UjMKCR9YRqVOP+kwwG0L/?=
 =?us-ascii?Q?hF+h28cfJuTmbyG9GsyceZGWcLKBgs1kRiQPhJiD0PPCRwiw0F30GRX/eU4a?=
 =?us-ascii?Q?RXtQheQWZTEhZePbbCfF7jwSJ2Oy0paKoEz0+JBJRiAA41YqES0bP/WFgAks?=
 =?us-ascii?Q?LcebSx+r6/Z2zDWsq4xpCleIkf9up+2nQ+oIV7fBMU3y/YZfpXcHcgbC+SjY?=
 =?us-ascii?Q?T9qkM9woqWKAZszsaQa6x+pQFYTT544vjJuDYh4KO2ZC2UIDTpLqbm1LBncg?=
 =?us-ascii?Q?mmpmeuWUmIE2XlmXvVZMqgcJT0D9NPrrWojUtccbFLStEWGmET2P/kq3GOQU?=
 =?us-ascii?Q?Wa5IUFFRzOTQxEQ4+kPQrvkHB37ckK43BgEyAltiidUdqDQQGixNt/A+Xw7I?=
 =?us-ascii?Q?WJXpTn6k2XDM43F7eKhmlzTHamdhZmkkoXMylpfu4XIJhF0ohdPHwV7kY8NQ?=
 =?us-ascii?Q?DlTPd84eWLaLtv6tGGGy6Zrb38LFzVtueDvIODVHcG4iRCe39g3q8FV7LNhv?=
 =?us-ascii?Q?asdMMyT5oSSxWlf/d1XRF1TUsL+2xiuPyU7XSqIx6yAFpUZuUSXpoN344Jn9?=
 =?us-ascii?Q?9ClAne/YTiA5T7XcG14OmWk2D69xhVAePUYk0x28H51JynBDt00gXlu1yhLc?=
 =?us-ascii?Q?x/QtUDevHgl6b1p6XJtwdARTwY6I0Q5luP6WLetCcDJCRHhBVvkbBEskJ6+i?=
 =?us-ascii?Q?pSUdgIt65fzg7yZsiNo3bOfCQQ6HcKo9a1x34b/MqqRGrvfLcHNyFO40BBWx?=
 =?us-ascii?Q?eq0iucQA7X6wOi3HxhasqVBsIgEsotm7y6ve7+ognZPsvz9aFXJJAIpfq3y7?=
 =?us-ascii?Q?09qm5nPjtZwEwgpwIey8GBo7zwgcRkInmqGNu2ZQOUdAhheQKe1zVY2e3qcE?=
 =?us-ascii?Q?2qErGkYVoA6HUByalyRhb9FnMjfbm1UQsJcMH1u9R0h55uGmHi6i8+sLTOGC?=
 =?us-ascii?Q?m6xbiuoADeTmuqtACWaUZnHz0GPGdnDUXg1r0+TRQMHoN06LOUj7BTpwZzdy?=
 =?us-ascii?Q?00+Vgkcr0NPO8V1YZvT3Bh93vHgzhBd3WJs05Z+EVyDaNMtMzQ26hLvRo1Xx?=
 =?us-ascii?Q?4E1LPIEWgF4DcOx2QlVxt3Vz4I2o/Vp+m3n6LPwVjI/hUCr+ZhtUmokkMy1T?=
 =?us-ascii?Q?17nEESAOs3xlA7dR08fSrYJ9lOLTOeSHxVurHFSZZDCY0Y6Gxo0qMa2+olK2?=
 =?us-ascii?Q?duBSJSrizngCKiXae8qXe83F6HJUXKYvRZWthlAKXgzF4DraTusZWjHPbmKq?=
 =?us-ascii?Q?VXumidWbZb2ByRinnwfecAkTD8dwhk4Mgh2J2rFmB5nUBpDkEJtwXj1gBfHJ?=
 =?us-ascii?Q?TrZiz62MKQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: JQJ6BkfYPVzclmSc8CiA7vmcVivMO3whuwrmfDUEz18Vy9GdsYsIEtFR62xw5CqPNAwNfcSeu/LKTU4uYP7UWKFDIhX96m1QpuZPgWm/QI9TW/UmpYpoRyOF0SMpf8WW1iq2TYnhsnA08mTI/nhvQahGli/3fvqyrPR5943wn4m6XRlnSBYN4fYKSbPksZvhztUlGCo760Kk8IWU93epG/qBCeEQ2mRnujJwNtDdN9PPL2g6vHbJsv4jh6gvp0AESq1E4P75o62mnJ1GfpQdKfgqMci3bl+oyhAG1cSCv9desZ9+mofoCynAAgk2Niv5GVGNp4Pp2JxzTnkB78bOtA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f23c0147-7881-4f12-5aff-08dee0fa9ae8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:20:08.3176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akHB86BYPzTo+P+srg0+YK0YJ0RfMhIqGZKRhkpF790YxtdnrzIH2nCS1cYSkrMZ2jvF5GKzRBHUVsevFxO0gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1A7C623DA
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

On Sun, Jul 12, 2026 at 08:00:08PM -0700, Niranjana Vishwanathapura wrote:
> The hw engine group fault-mode switch suspends all faulting LR queues
> but ignored the suspend()/suspend_wait() return value. A suspend() can
> fail (e.g. the queue is killed/banned/wedged), leaving the queue
> un-suspended, so silently continuing could later resume a queue that was
> never suspended.
> 
> Propagate the failure instead: in xe_hw_engine_group_add_exec_queue()
> bail out if suspend() fails, and in
> xe_hw_engine_group_suspend_faulting_lr_jobs() undo the partial suspend
> via a new err_resume path that resumes the sibling queues already
> suspended in this call. Record per-queue success with lr.suspended so
> only queues that were actually suspended are waited on and resumed, and
> skip the cleanup resume() when suspend_wait() failed or the queue was
> reset/killed/banned/wedged (its suspend may not have completed, so
> resuming would trip the !suspend_pending assert in the resume path;
> teardown resolves its state instead).
> 
> Gate the group resume worker (hw_engine_group_resume_lr_jobs_func()) on
> lr.suspended for the same reason, so it only resumes queues that were
> actually suspended.
> 
> v2: Don't let a dying queue block the switch (Matt Brost)
> 
> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 85 ++++++++++++++++++++++++-
>  1 file changed, 82 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 02cf32ae5aa9..0804b426b6f9 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -34,6 +34,15 @@ hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
>  		if (!xe_vm_in_fault_mode(q->vm))
>  			continue;
>  
> +		/*
> +		 * Only resume queues that were actually suspended. A queue whose
> +		 * suspend() failed (e.g. killed/banned/wedged) was never
> +		 * suspended, so it must not be resumed.
> +		 */
> +		if (!READ_ONCE(q->lr.suspended))
> +			continue;
> +
> +		WRITE_ONCE(q->lr.suspended, false);
>  		q->ops->resume(q);
>  	}
>  
> @@ -140,7 +149,18 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
>  		return err;
>  
>  	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
> -		q->ops->suspend(q);
> +		/*
> +		 * suspend() can fail (e.g. killed/banned/wedged), leaving the
> +		 * queue un-suspended. Propagate the failure so the queue is not
> +		 * added; on failure nothing was suspended, so there is nothing to
> +		 * undo. Only record the queue as suspended (and later resume it)
> +		 * once suspend() has succeeded.
> +		 */
> +		err = q->ops->suspend(q);
> +		if (err)
> +			goto err_suspend;
> +
> +		WRITE_ONCE(q->lr.suspended, true);
>  		err = q->ops->suspend_wait(q);
>  		if (err)
>  			goto err_suspend;
> @@ -216,8 +236,22 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  			return -EAGAIN;
>  
>  		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> +		/*
> +		 * suspend() only fails when the queue is killed/banned/wedged.
> +		 * Such a queue is being torn down (its removal from HW is handled
> +		 * by the kill/ban teardown), so it is not a live fault-mode
> +		 * context the mode switch must preempt. Skip it rather than
> +		 * failing the switch, otherwise one dying sibling would block a
> +		 * dma-fence submission on the healthy queues in the group. Only
> +		 * queues recorded as suspended below are later waited on and
> +		 * resumed.
> +		 */
> +		err = q->ops->suspend(q);
> +		if (err)
> +			continue;
> +
> +		WRITE_ONCE(q->lr.suspended, true);
>  		need_resume = true;
> -		q->ops->suspend(q);
>  		gt = q->gt;
>  	}
>  
> @@ -225,9 +259,13 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  		if (!xe_vm_in_fault_mode(q->vm))
>  			continue;
>  
> +		/* Only wait on queues that were actually suspended above. */
> +		if (!READ_ONCE(q->lr.suspended))
> +			continue;
> +
>  		err = q->ops->suspend_wait(q);
>  		if (err)
> -			return err;
> +			goto err_resume;
>  	}
>  
>  	if (gt) {
> @@ -240,6 +278,47 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  		xe_hw_engine_group_resume_faulting_lr_jobs(group);
>  
>  	return 0;
> +
> +err_resume:
> +	/*
> +	 * A suspend_wait() failed partway through the mode switch. Resume the
> +	 * sibling queues that were already suspended in this call so they are
> +	 * not left suspended forever.
> +	 *
> +	 * resume() requires the suspend to have completed (suspend_pending
> +	 * cleared) or it trips the !suspend_pending assert. So skip the resume
> +	 * when either:
> +	 *  - suspend_wait_blocking() fails: on a GuC timeout it bans the queue
> +	 *    and triggers cleanup, so the queue is being torn down; or
> +	 *  - reset_status() is true: the queue was reset/killed/banned/wedged.
> +	 *    suspend_wait() can return success in this case via its killed/
> +	 *    stopped wait condition while suspend_pending is still set, and the
> +	 *    queue is being torn down anyway, so its state is resolved by
> +	 *    teardown rather than by a resume here.
> +	 * In either case leave the queue marked suspended.
> +	 *
> +	 * Use the *blocking* (uninterruptible) wait here: the queues resumed on
> +	 * this path may belong to a different process than the one that
> +	 * triggered the mode switch. An interruptible suspend_wait() would
> +	 * return -ERESTARTSYS if the triggering task is signalled, skip the
> +	 * resume, and leave the other process's queue suspended forever
> +	 * (cross-process DoS).
> +	 */
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (!xe_vm_in_fault_mode(q->vm))
> +			continue;
> +
> +		if (!READ_ONCE(q->lr.suspended))
> +			continue;
> +
> +		if (q->ops->suspend_wait_blocking(q) || q->ops->reset_status(q))
> +			continue;
> +
> +		WRITE_ONCE(q->lr.suspended, false);
> +		q->ops->resume(q);
> +	}
> +
> +	return err;
>  }
>  
>  /**
> -- 
> 2.43.0
> 
